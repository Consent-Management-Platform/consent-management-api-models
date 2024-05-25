$version: "2.0"

namespace com.consentframework.consentmanagement.api.models

use aws.protocols#restJson1
use com.consentframework.consentmanagement.api.models.operations#CreateServiceUserConsent
use com.consentframework.consentmanagement.api.models.operations#GetServiceUserConsent
use com.consentframework.consentmanagement.api.models.operations#ListServiceUserConsent
use com.consentframework.consentmanagement.api.models.operations#UpdateServiceUserConsent

@title("Consent Management API")
@restJson1
service ConsentManagementApi {
    version: "2024-05-24"
    operations: [
        CreateServiceUserConsent,
        GetServiceUserConsent,
        ListServiceUserConsent,
        UpdateServiceUserConsent
    ]
}
