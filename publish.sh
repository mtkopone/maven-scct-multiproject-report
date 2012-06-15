#!/bin/sh
version=0.2-SNAPSHOT
mvn install:install-file \
  -Dfile=target/maven-scct-multiproject-report-${version}.jar \
  -DgroupId=reaktor.scct \
  -DartifactId=maven-scct-multiproject-report \
  -Dversion=${version} \
  -Dpackaging=jar \
  -DlocalRepositoryPath=../gh-pages/maven-repo/
