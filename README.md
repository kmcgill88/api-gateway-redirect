# api-gateway-redirect
A serverless solution to handle url redirects for static sites.


## Setup
- Run `bash run.sh deploy <FromDomain> <ToProtocol> <ToDomain> <HostedZoneId> <AcmArnForFromDomain>`
  - For example `bash run.sh deploy www.mcgilldevtech.com https mcgilldevtech.com ABC123 arn:aws:acm:us-east-1:123456789012:certificate/abc123` to redirect `www` to your `apex` domain (or visa versa).
- Be patient, deploying the `AWS::ApiGateway::DomainName` doesn't break and speed records!
- Hit `FromDomain` from your browser and you should be redirected to your `ToDomain`
> Swap out `deploy` with `update` to run again. `delete` to tear it all down.

### What's happening during all of this?
- When you enter `www.mcgilldevtech.com` in your browser Route53 directs you to API Gateway's CloudFront.
- CloudFront `301`'s you to `https://www.mcgilldevtech.com`
- That URL hits the lambda which pulls off the `FromDomain`'s path, if there is one, and reconstructs the url then `301`'s clients to that URL. ie. `www.mcgilldevtech.com/about` goes to `https://mcgilldevtech.com/about`,..dropping the `www` and enforces `https`
