#!/usr/bin/env bash

readonly BUILD_FILES_DIRECTORY="/home/ubuntu/genius-test-app/build";
readonly FE_S3_BUCKET="genius-test-app/";


verifyIfExistsBuildDirectory()
{
  if [ ! -f $BUILD_FILES_DIRECTORY ];then
    return 0;
  fi
  return 2;
}

copyBuildFilesToS3()
{
  cd $BUILD_FILES_DIRECTORY && aws s3 sync . s3://$FE_S3_BUCKET --acl public-read;
}

run()
{
  verifyIfExistsBuildDirectory;
  if [ "$?" -eq 0 ];then
    copyBuildFilesToS3;
    elif [ "$?" -eq 2 ];then
    exit 2;
  fi
  
}
sleep 2m;
run;