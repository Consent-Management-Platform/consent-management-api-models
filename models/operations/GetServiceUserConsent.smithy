$version: "2.0"

namespace com.consentframework.consentmanagement.api.models.operations

use com.consentframework.consentmanagement.api.models.types#Consent
use com.consentframework.consentmanagement.api.models.types#ConsentId
use com.consentframework.consentmanagement.api.models.types#ServiceId
use com.consentframework.consentmanagement.api.models.types#UserId

@documentation("Retrieve a user Consent for a given service.")
@readonly
@http(method: "GET", uri: "/v1/consent-management/services/{serviceId}/users/{userId}/consents/{consentId}", code: 200)
operation GetServiceUserConsent {
    input: GetServiceUserConsentInput
    output: GetServiceUserConsentOutput
}

@input
structure GetServiceUserConsentInput {
    @required
    @httpLabel
    consentId: ConsentId

    @required
    @httpLabel
    serviceId: ServiceId

    @required
    @httpLabel
    userId: UserId
}

@output
structure GetServiceUserConsentOutput {
    data: Consent
}
