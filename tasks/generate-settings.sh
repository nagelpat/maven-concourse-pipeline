#!/bin/bash

set -u # fail if it finds unbound variables

mkdir -p ${HOME}/.m2/

echo "Writing settings xml to [${HOME}/.m2/settings.xml]"
echo "Repository Id: ${M2_SETTINGS_REPO_ID}"
echo "Repository Username: ${M2_SETTINGS_REPO_USERNAME}"

set +x
cat > ${HOME}/.m2/settings.xml <<EOF

<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0
                          https://maven.apache.org/xsd/settings-1.0.0.xsd">


</settings>

EOF
set -x
