# api-gateway-redirect
A serverless solution to handle url redirects.


## Setup
- Run `bash run.sh deploy <FromDomain> <ToDomain> <ToProtocol> <HostedZoneId> <AcmArnForFromDomain>`
  - For example `bash run.sh deploy www.mcgilldevtech.com mcgilldevtech.com https ABC123 arn:aws:acm:us-east-1:123456789012:certificate/abc123` to redirect www to your apex domain.
- Be patient, deploying the `AWS::ApiGateway::DomainName` doesn't break and speed records!
- Hit your `FromDomain` and you should be redirected to your `ToDomain`
> Swap out `deploy` with `update` to run again.
