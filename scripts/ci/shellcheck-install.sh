#!/bin/bash
###################################################################
#Script Name  : Shell Check
#Description  : Validates Bash / Shell Scripts
#Args         : -
#Hint         : execute this script from github repository root!
###################################################################
cmd="shellcheck"
###################################################################
# https://docs.github.com/en/enterprise-cloud@latest/actions/using-workflows/workflow-commands-for-github-actions#example-grouping-log-lines          
echo "::group:: $(pwd)"

if [ -n "$GITHUB_WORKSPACE" ]; then
  cd "${GITHUB_WORKSPACE}" || exit
  cmd="./shellcheck-v${VERSION}/${cmd}"

  if [ -z "${VERSION}" ]; then
    echo "::error file={.github/workflows/shellcheck.yaml},line={1},endLine={1},title=Setup::env.VERSION needs to be set!"
    echo "::endgroup::"
    exit 1
  fi
  
  if ! curl -sLO "https://github.com/koalaman/shellcheck/releases/download/v${VERSION}/shellcheck-v${VERSION}.linux.x86_64.tar.xz"; then
    echo "::error file={.github/workflows/shellcheck.yaml},line={1},endLine={1},title=Setup::ERROR downloading https://github.com/koalaman/shellcheck/releases/download/v${VERSION}/shellcheck-v${VERSION}.linux.x86_64.tar.xz!"    
    echo "::endgroup::"
    exit 1
  fi
  
  if ! tar -xf "shellcheck-v${VERSION}.linux.x86_64.tar.xz"; then
    echo "::error file={.github/workflows/shellcheck.yaml},line={1},endLine={1},title=Setup::ERROR unpacking shellcheck-v${VERSION}.linux.x86_64.tar.xz!"
    echo "::endgroup::"
    exit 1
  fi
fi
echo "\$ ${cmd} -V"
${cmd} -V
echo "::endgroup::"