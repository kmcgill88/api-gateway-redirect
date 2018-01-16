#!/bin/bash
if [[ $1 == "deploy" ]]; then
  aws cloudformation create-stack \
    --stack-name URL-REDIRECTER \
    --capabilities CAPABILITY_NAMED_IAM \
    --template-body file://./redirect.template.yaml \
    --parameters \
        ParameterKey=FromDomain,ParameterValue=$2 \
        ParameterKey=ToProtocol,ParameterValue=$3 \
        ParameterKey=ToDomain,ParameterValue=$4 \
        ParameterKey=HostedZoneId,ParameterValue=$5 \
        ParameterKey=FromDomainAcmArn,ParameterValue=$6
fi
if [[ $1 == "update" ]]; then
  aws cloudformation update-stack \
    --stack-name URL-REDIRECTER \
    --capabilities CAPABILITY_NAMED_IAM \
    --template-body file://./redirect.template.yaml \
    --parameters \
        ParameterKey=FromDomain,ParameterValue=$2 \
        ParameterKey=ToProtocol,ParameterValue=$3 \
        ParameterKey=ToDomain,ParameterValue=$4 \
        ParameterKey=HostedZoneId,ParameterValue=$5 \
        ParameterKey=FromDomainAcmArn,ParameterValue=$6
fi
if [[ $1 == "delete" ]]; then
  aws cloudformation delete-stack --stack-name URL-REDIRECTER
fi
