#!/bin/bash
if [[ $1 == "deploy" ]]; then
  aws cloudformation create-stack --stack-name URL-REDIRECTER --capabilities CAPABILITY_NAMED_IAM --template-body file://./redirect.template.yaml
fi
if [[ $1 == "update" ]]; then
  aws cloudformation update-stack --stack-name URL-REDIRECTER --capabilities CAPABILITY_NAMED_IAM --template-body file://./redirect.template.yaml
fi
if [[ $1 == "delete" ]]; then
  aws cloudformation delete-stack --stack-name URL-REDIRECTER
fi
