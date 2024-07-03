$version: "2.0"

namespace com.consentframework.consentmanagement.api.models

use aws.api#service
use aws.apigateway#requestValidator
use aws.protocols#restJson1
use com.consentframework.consentmanagement.api.models.operations#CreateServiceUserConsent
use com.consentframework.consentmanagement.api.models.operations#GetServiceUserConsent
use com.consentframework.consentmanagement.api.models.operations#ListServiceUserConsent
use com.consentframework.consentmanagement.api.models.operations#UpdateServiceUserConsent

@aws.apigateway#integration(
    httpMethod: "POST",
    type: "aws_proxy",
    // This URI includes placeholders that must be replaced in CDK code before deployment
    uri: "arn:${AWS::Partition}:apigateway:${AWS::Region}:lambda:path/2015-03-31/functions/${LambdaFunction.Arn}/invocations"
)
@requestValidator("full")
@restJson1
@title("Consent Management API")
@service(
    sdkId: "ConsentManagement",
    arnNamespace: "execute-api"
)
service ConsentManagementApi {
    version: "2024-07-03"
    operations: [
        CreateServiceUserConsent,
        GetServiceUserConsent,
        ListServiceUserConsent,
        UpdateServiceUserConsent
    ]
}
