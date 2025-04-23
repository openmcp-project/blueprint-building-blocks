#!/bin/bash
###################################################################
#Script Name  : Shell Check
#Description  : Validates Bash / Shell Scripts
#Args         : -
#Hint         : execute this script from github repository root!
###################################################################
# shellcheck disable=SC1091
source "$(pwd)/.github/actions/shared-variables.sh"
declare resultPwd newLineString exitCode msgEverythingIsFine

set +e
echo "The script you are running has:"
echo "basename: [$(basename "$0")]"
echo "dirname : [$(dirname "$0")]"
echo "pwd     : [$(pwd)]"

cmd="shellcheck"
###################################################################
resultPwd=$(pwd)
if [ -n "$GITHUB_WORKSPACE" ]; then  
  cmd="./shellcheck-v${VERSION}/${cmd}"  
fi
###################################################################
declare -a filesToRemove=("spellcheck-parsable.txt")
REMOVE_FILES_IF_EXISTS "$resultPwd" "${filesToRemove[@]}"

###################################################################
for dir in $(find . -type f -name '*.sh' | sed -r 's|/[^/]+$||' | sort | uniq); do
  cmdFat="${cmd} ${dir}/*.sh -a"
  {
    echo "$newLineString"
    echo "Use command to run this check on your local machine!"
    echo -e "$cmdFat\n"     
    } >> "${resultPwd}/pr-status-check-human-friendly.txt"

  echo "\$ $cmdFat" 
  eval "$cmdFat" >>"${resultPwd}/pr-status-check-human-friendly.txt" 
  tempQ=$?
  if [ $tempQ != 0 ]; then
    exitCode=$tempQ
    jsonResult=$( ${cmd} "${dir}"/*.sh -f json -a )
    echo "$jsonResult" >> "spellcheck-parsable.txt" 2>&1

    jq -c '.[]' <<< "$jsonResult" | while read -r i; do
      # shellcheck disable=SC2001
      i=$( sed 's/"""/""/g' <<< "$i" )
     
      file=$(jq -r '.file' <<< "$i");
      file=$( sed -r 's/\.\///g' <<< "$file" )
      line=$(jq -r '.line' <<< "$i");
      endLine=$(jq -r '.endLine' <<< "$i");
      level=$(jq -r '.level' <<< "$i");
      message=$(jq -r '.message' <<< "$i");

      case $level in
      info | style)
        level="notice"
        ;;
      esac
      echo "::${level} file=$file,line=$line,endLine=$endLine::$message" >> "${resultPwd}/github-workflow-commands.txt"
    done
  else 
    echo "$msgEverythingIsFine" >> "${resultPwd}/pr-status-check-human-friendly.txt"
  fi
 
done
exit "$exitCode"
###################################################################