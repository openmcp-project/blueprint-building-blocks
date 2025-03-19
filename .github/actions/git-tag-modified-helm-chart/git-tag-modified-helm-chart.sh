#!/bin/bash
###################################################################
#Script Name  : git tag modified helm chart
#Description  : creates a git tag for each modified helm chart
#Args         : -
#Hint         : Only works with Helm Chart Version compare
###################################################################
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
# shellcheck disable=SC1091
source "$SCRIPT_DIR"/../shared-variables.sh

declare resultPwd exitCode

set +e
echo "The script you are running has:"
echo "basename: [$(basename "$0")]"
echo "dirname : [$(dirname "$0")]"
echo "pwd     : [$(pwd)]"

declare -a filesToRemove=("pr-status-check-human-friendly.txt" "modified_files.txt")
REMOVE_FILES_IF_EXISTS "$resultPwd" "${filesToRemove[@]}"
###################################################################
if [ -z "$COMMIT_HASH" ]; then
  COMMIT_HASH="89b624080bb62e7f5ac340d81fef96c9d6446d22"
  echo "!!! WARNING: \$COMMIT_HASH NEEDS TO BE SET e.g. Default set COMMIT_HASH=${COMMIT_HASH}!  \"export COMMIT_HASH=${COMMIT_HASH}\"!!!"
  exit 1
fi


###################################################################
# Function to print a row with fixed-width columns
print_row() {
  printf "%-70s %-50s %-15s %-15s\n" "$1" "$2" "$3" "$4"
}

git_tag_check() {
  local tag=$1
  git rev-parse -q --verify "refs/tags/$tag" &>/dev/null
}
###################################################################

# List modified files of commit
git diff-tree --no-commit-id --name-only -r "$COMMIT_HASH" >modified_files.txt
# shellcheck disable=SC2181
if [ $? != 0 ]; then
  exit 1
fi
# Iterate over the array of paths with filenames and extract the directory paths
unique_paths=()
while IFS= read -r path; do

  dir=$(dirname "$path")

  if [[ "$dir" == *templates ]]; then
    dir=${dir%/*}
  fi
  dir=${dir%*/templates*} # retain the part before "/templates"

  if [ -f "$dir/Chart.yaml" ] || [ -f "$dir/Chart.yml" ]; then
    unique_paths+=("$dir")
  fi
done <"modified_files.txt"

if [ ${#unique_paths[@]} -eq 0 ]; then
  echo -e "No Helm Charts have been modified!\n"
  echo -e "List of Modified files:"
  cat "modified_files.txt"
  exit "$exitCode"
fi

# Sort and remove duplicates from the list of paths
# shellcheck disable=SC2207
unique_paths=($(echo "${unique_paths[@]}" | tr ' ' '\n' | sort -u))
{
  # Header row
  printf "%-70s %-50s %-15s %-15s\n" "Modified Helm Chart:" "Name:" "Version:" "Status:"

  git checkout "$COMMIT_HASH"

  for helmChart in "${unique_paths[@]}"; do
    chartVersion=$(yq -r eval '.version' "$helmChart/Chart.yaml")
    chartName=$(yq -r eval '.name' "$helmChart/Chart.yaml")
    gitTag="$chartName-$chartVersion"
    if git_tag_check "$gitTag"; then
      print_row "$helmChart" "$chartName" "$chartVersion" "-"
    else

      git tag "$gitTag" "$COMMIT_HASH"
      # shellcheck disable=SC2181
      if [ $? != 0 ]; then
        print_row "$helmChart" "$chartName" "$chartVersion" "ERROR: git tag $gitTag"
        exit 1
      fi

      git push origin "$gitTag"
      # shellcheck disable=SC2181
      if [ $? != 0 ]; then
        print_row "$helmChart" "$chartName" "$chartVersion" "ERROR: git push origin $gitTag"
        exit 1
      fi

      print_row "$helmChart" "$chartName" "$chartVersion" "git tagged&pushed $gitTag"

    fi

  done

} >>"$resultPwd/pr-status-check-human-friendly.txt"

cat "$resultPwd/pr-status-check-human-friendly.txt"

exit "$exitCode"
