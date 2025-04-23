#!/bin/bash
###################################################################
#Script Name  :
#Description  :
#Args         : -
#Hint         :
###################################################################
set -e
resultPwd=$(pwd)
helmChartListingFileName="helm-charts-templated.yaml"
emptyManifestString="WARNING: This chart is deprecated"
newLineString="-------------------------------------------------------------------------------------------------------------------------"
msgHelpStart=""
#msgEverythingIsFine="／人◕ __ ◕人＼ Everything seems to be all right (⌐⊙_⊙)"
msgEverythingIsFine="☺ √"
exitCode=0
# Define color escape codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
BOLD='\033[1m'
UNDERLINE='\033[4m'
REVERSE='\033[7m'
RESET='\033[0m' # Reset color
###################################################################
declare -a filesToRemove=("pr-status-check-human-friendly.txt" "github-workflow-commands.txt")
###################################################################
function REMOVE_FILES_IF_EXISTS {
  arr=("$@")
  for fileToRemove in "${arr[@]}"
  do
    if [ -f "$1/$fileToRemove" ]; then
      rm "$1/$fileToRemove"
      #echo "removed $1/$fileToRemove"
    fi
  done  
}
function ASSERT_FILE_EXISTS_WITH_MSG {
  if [ ! -f "$1/$2" ]; then
    echo "!! ERROR missing file $1/$2 !!$3"
    exit 1
  fi
}
###################################################################
if [ -n "$GITHUB_WORKSPACE" ]; then
  cd "$GITHUB_WORKSPACE" || exit
  resultPwd=$GITHUB_WORKSPACE
fi
REMOVE_FILES_IF_EXISTS "$resultPwd" "${filesToRemove[@]}"
###################################################################
export helmChartListingFileName emptyManifestString newLineString exitCode resultPwd helmChartListTemplatedManifestsFileName msgHelpStart msgEverythingIsFine RED GREEN YELLOW BLUE BOLD UNDERLINE RESET REVERSE