#!/bin/sh
set -e

version=0.2-SNAPSHOT

function install {
  mvn -Dscala.version="${1}" clean package
  sed -e "s/\${scala.version}/${1}/g" -e "s/^.*<scala.version>.*$//g" pom.xml > target/custom-pom.xml
  sed -i "" -e "s/\${scct.scala.version}/${2}/g" -e "s/^.*<scct.scala.version>.*$//g" target/custom-pom.xml
  mvn deploy:deploy-file \
    -Durl=file:///Users/mtkopone/dev/scct-root/gh-pages/maven-repo/ \
    -DrepositoryId=local-gh-pages \
    -Dfile=target/maven-scct-multiproject-report-${version}.jar \
    -DartifactId=maven-scct-multiproject-report_${1} \
    -DpomFile=target/custom-pom.xml
}

install "2.9.2" "2.9.2"
install "2.10.0-RC3" "2.10"