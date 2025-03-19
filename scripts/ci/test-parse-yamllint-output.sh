#!/bin/bash

# helm-template-app-in-app.yaml
#   25:12     error    trailing spaces  (trailing-spaces)
#   32:16     warning  too few spaces before comment  (comments)
#   33:19     warning  too few spaces before comment  (comments)
#   34:22     warning  too few spaces before comment  (comments)
while read -r item
do
 #echo "${item}"
  # Set comma as delimiter
  IFS=':'
  #Read the split words into an array based on comma delimiter
  read -ra strarr <<< "${item}"
  msg=$(sed -E 's/^\s+//' <<<"${strarr[3]}")
  #echo ${strarr[0]} ${strarr[1]} ${strarr[2]} ${strarr[3]}
  line=${strarr[1]}
  file=${strarr[0]}  
  if [ "$line" == 1 ]; then
    helmChartFile=$(eval head "$file" | grep "# Source:" | tac | awk '{print;exit}' | cut -c11-)        
    helmChartLine=$line
  else 
    helmChartFile=$(eval head -"${line}" "$file" | grep "# Source:" | tac | awk '{print;exit}' | cut -c11-)
    startLine=$(eval head -"${line}" "$file" | grep "# Source:" --line-number |  tac | awk '{print;exit}' | cut -d : -f 1)      
    # shellcheck disable=SC2003
    helmChartLine=$(expr "$line" - "$startLine")        
  fi
  if [[ "$helmChartFile" == *"/charts/"* ]]; then
    continue
  fi
  level=$(awk '{ sub(/.*\[/, ""); sub(/\].*/, ""); print }' <<< "$msg")
  echo "$level Helm Chart File $helmChartFile Line ${helmChartLine} ($line - $startLine):${msg}"
  #echo "::${level} file=helm/charts/$helmChartFile,line=$helmChartLine,endLine=$helmChartLine::$msg"
  #echo "--------------------------------------"
done < "yamllint-parsable.txt"

