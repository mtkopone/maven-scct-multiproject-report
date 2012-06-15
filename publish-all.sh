#!/bin/sh
set -e

version=0.2-SNAPSHOT

function install {
  mvn -Dscala.version="${1}" clean package
  sed -e "s/\${scala.version}/${1}/g" -e "s/^.*<scala.version>.*$//g" pom.xml > target/custom-pom.xml
  mvn deploy:deploy-file \
    -Durl=file:///Users/mtkopone/projects/scct/gh-pages/maven-repo/ \
    -DrepositoryId=local-gh-pages \
    -Dfile=target/maven-scct-multiproject-report-${version}.jar \
    -DartifactId=maven-scct-multiproject-report_${1} \
    -DpomFile=target/custom-pom.xml
}

scalas=( "2.9.2" "2.9.1-1" "2.9.1" "2.9.0-1" "2.9.0")

for i in "${scalas[@]}"; do
  install $i
done
