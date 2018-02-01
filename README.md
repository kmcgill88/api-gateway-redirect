# api-gateway-redirect
A serverless solution to handle url redirects for static sites.

## Prerequisites
- ARN to a valid Amazon Certificate Mangager (ACM) certificate that covers your `FromDomain` name.
- `HostedZoneId` of your `FromDomain`'s Route53 record.
#### Notes:  
  - If you previously used your `FromDomain` as a CloudFront alias you must remove that before deploying this cloudformation. Domains can only be associated with 1 CloudFront distribution.
  - Ensure you don't have any existing `A` or `AAAA` Route53 records for the `FromDomain`, these will be created for you. If you have prior records the deployment will fail.

## Setup
- Run `bash run.sh deploy <FromDomain> <ToProtocol> <ToDomain> <HostedZoneId> <AcmArnForFromDomain>`
  - For example `bash run.sh deploy www.mcgilldevtech.com https mcgilldevtech.com ABC123 arn:aws:acm:us-east-1:123456789012:certificate/abc123` to redirect `www` to your `apex` domain (or visa versa).
- Be patient, deploying the `AWS::ApiGateway::DomainName` doesn't break and speed records!
- Hit the `FromDomain` from your browser and you should be redirected to your `ToDomain`, including any path.
> Swap out `deploy` with `update` to run again. `delete` to tear it all down.

### What's happening during all of this?
- When you enter `www.mcgilldevtech.com` in your browser Route53 directs you to API Gateway's CloudFront.
- CloudFront `301`'s you to `https://www.mcgilldevtech.com`
- That URL hits the lambda which pulls off the `FromDomain`'s path, if there is one, and reconstructs the url then `301`'s clients to that URL. ie. `www.mcgilldevtech.com/about` goes to `https://mcgilldevtech.com/about`,..dropping the `www` and enforcing `https`
