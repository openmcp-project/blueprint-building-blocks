#!/bin/bash

###################################################################
#script name	: yamllint
#description	: Install tac "brew install coreutils"
#
#args         : -
###################################################################
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# shellcheck disable=SC1091
source "$SCRIPT_DIR"/shared-variables.sh
declare resultPwd newLineString helmChartListTemplatedManifestsFileName exitCode msgHelpStart msgEverythingIsFine

set +e
echo "$newLineString"
echo "The script you are running has:"
echo "basename: [$(basename "$0")]"
echo "dirname : [$(dirname "$0")]"
echo "pwd     : [$(pwd)]"
echo "bash -v : [$(/bin/bash --version)]"
# https://github.com/zegl/yamllint
cmd="yamllint"
###################################################################
# Check if run in Github Action Runner
if [ -n "$GITHUB_WORKSPACE" ]; then
  cmd="/home/runner/.local/bin/${cmd}"

  python -m build 

  if ! pip install --user "${GITHUB_WORKSPACE}/scripts/ci/yamllint-1.32.0.tar"; then
    echo "!!! ERROR installing yamllint !!!"
    exit 1
  fi
  
fi
###################################################################
echo "$newLineString"
echo "\$ ${cmd} -v"
${cmd} -v
echo "$newLineString"
###################################################################
declare -a filesToRemove=("yamllint-parsable.txt")
REMOVE_FILES_IF_EXISTS "$resultPwd" "${filesToRemove[@]}"

ASSERT_FILE_EXISTS_WITH_MSG "$resultPwd" "$helmChartListTemplatedManifestsFileName" "Run helm-chart-listing.sh first!!"

echo -e "$msgHelpStart && $(dirname "$0")/$(basename "$0")" >> "${resultPwd}/pr-status-check-human-friendly.txt"

while read -r helmManifestFile
do
 
  cmdFat="$cmd $helmManifestFile -c .github/.yamllint.config.yaml --strict -f standard"
  echo "\$ $cmdFat"  
  eval "$cmdFat"
  tempQ=$?
  if [ $tempQ != 0 ]; then
    
    {
    echo "$newLineString"
    echo "Use command to run this check on your local machine!"
    echo -e "$cmdFat\n"     
    } >> "${resultPwd}/pr-status-check-human-friendly.txt"

    parsableResult=$(eval ${cmd} "${helmManifestFile}" -c .github/.yamllint.config.yaml --strict -f parsable)
    while read -r item
    do
      #Read the split words into an array based on comma delimiter
      IFS=':' ; read -ra strarr <<< "$item"
      msg=$(sed -E 's/^\s+//' <<<"${strarr[3]}")
      line=${strarr[1]}
      file=${strarr[0]}  
      if [ "$line" == 1 ]; then
      # eval head "helm-template-cloud-orchestration-control-plane.yaml" | grep "# Source:" | tac | awk '{print;exit}' | cut -c11-
        helmChartFile=$(eval head "$file" | grep "# Source:" | tac | awk '{print;exit}' | cut -c11-)        
        helmChartLine=$line
      else 
        helmChartFile=$(eval head -"${line}" "$file" | grep "# Source:" | tac | awk '{print;exit}' | cut -c11-)
        startLine=$(eval head -"${line}" "$file" | grep "# Source:" --line-number |  tac | awk '{print;exit}' | cut -d : -f 1)      
        # shellcheck disable=SC2003
        helmChartLine=$(expr "$line" - "$startLine")        
      fi
      if [[ "$helmChartFile" == *"/charts/"* ]]; then
        echo "$msgEverythingIsFine for $helmChartFile" >> "${resultPwd}/pr-status-check-human-friendly.txt"
        continue
      fi
      level=$(awk '{ sub(/.*\[/, ""); sub(/\].*/, ""); print }' <<< "$msg")
      echo "file: $helmChartFile line:≈±${helmChartLine} - ${msg}" >> "${resultPwd}/pr-status-check-human-friendly.txt"
      echo "file: $file line:${line} - ${msg}" >> "${resultPwd}/pr-status-check-human-friendly.txt"
      echo "::${level} file=helm/charts/$helmChartFile,line=$helmChartLine,endLine=$helmChartLine::$msg" >> "${resultPwd}/github-workflow-commands.txt"      
      exitCode=$tempQ
    done <<< "${parsableResult}"
    echo "${parsableResult}" >> "${resultPwd}/yamllint-parsable.txt"
  fi
  
  echo "$newLineString"

done < "${helmChartListTemplatedManifestsFileName}"
exit "$exitCode"
###################################################################