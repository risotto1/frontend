#!/bin/sh
prodDeployment=`(helm get values --all frontend | grep -Po 'deployment: \K.*')`
if [ "$prodDeployment" = "green" ]; then
    newDeployment="blue"
else
    newDeployment="green"
fi

if [ "$1" = "deploy" ]; then
    helm upgrade --install frontend ${HELM_CHART_DIR:=~/work/poc/frontend} --reuse-values --set production.deployment=$newDeployment
fi

echo $newDeployment
