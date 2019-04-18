#!/usr/bin/env bash

readonly BUILD_DIRECTORY="/home/ubuntu/genius-test-app";

verifyIfExistsDependecies()
{
  if [ $(which yarn) ] && [ $(which npm) ];then
    return 0;
  fi
  return 2;
}

installAndBuild()
{
  if [ ! -d $BUILD_DIRECTORY ];then
    mkdir -p $BUILD_DIRECTORY;
  fi
  cd $BUILD_DIRECTORY \
  && yarn && yarn build;
}

run()
{
  verifyIfExistsDependecies;
  if [ "$?" -eq 0 ];then
    installAndBuild;
    elif [ "$?" -eq 2 ];then
    exit 1;
  fi
  
}

run;