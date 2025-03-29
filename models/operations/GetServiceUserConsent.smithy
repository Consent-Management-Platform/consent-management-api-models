$version: "2.0"

namespace com.consentframework.consentmanagement.api.models.operations

use com.consentframework.shared.models.consent#Consent
use com.consentframework.shared.models.consent#ConsentId
use com.consentframework.shared.models.consent#ServiceId
use com.consentframework.shared.models.consent#UserId
use com.consentframework.shared.models.exceptions#InternalServiceException
use com.consentframework.shared.models.exceptions#NotFoundException

@documentation("Retrieve a user Consent for a given service.")
@readonly
@http(method: "GET", uri: "/v1/consent-management/services/{serviceId}/users/{userId}/consents/{consentId}", code: 200)
operation GetServiceUserConsent {
    input: GetServiceUserConsentInput
    output: GetServiceUserConsentOutput
    errors: [
        InternalServiceException,
        NotFoundException
    ]
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
