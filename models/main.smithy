$version: "2.0"

namespace com.consentframework.consentmanagement.api.models

use com.consentframework.consentmanagement.api.models.operations#CreateServiceUserConsent
use com.consentframework.consentmanagement.api.models.operations#ListServiceUserConsent
use com.consentframework.consentmanagement.api.models.operations#UpdateServiceUserConsent

@title("Consent Management API")
service ConsentManagementApi {
    version: "2018-05-10"
    operations: [
        CreateServiceUserConsent,
        ListServiceUserConsent,
        UpdateServiceUserConsent
    ]
}
