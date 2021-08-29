#!/bin/bash

USERXX=$1

if [ -z "$USERXX" -o "$USERXX" = "userXX" ]
  then
    echo "Usage: Input your username like deploy-people.sh user1"
    exit;
fi

echo Your username is $USERXX
echo Deploy people service........

oc project $USERXX-project
oc delete dc,deployment,bc,build,svc,route,pod,is --all

echo "Waiting 30 seconds to finialize deletion of resources..."
sleep 30

mvn -q quarkus:add-extension -Dextensions="openshift" -f $CHE_PROJECTS_ROOT/demo2win-sample

<<<<<<< HEAD
cp /projects/demo2win-sample/scripts/application.properties /projects/demo2win-sample/src/main/resources/
=======
cp /projects/quarkus-workshop-m1m2-labs/scripts/application.properties /projects/demo2win-sample/src/main/resources/
>>>>>>> 12f1967628bfb0a7cacc6816efc3b02fc8c87875

mvn clean package -Pnative -DskipTests -f ${CHE_PROJECTS_ROOT}/demo2win-sample

oc rollout status -w dc/people
