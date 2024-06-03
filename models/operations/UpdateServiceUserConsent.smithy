$version: "2.0"

namespace com.consentframework.consentmanagement.api.models.operations

use com.consentframework.consentmanagement.api.models.exceptions#InternalServiceException
use com.consentframework.consentmanagement.api.models.exceptions#NotFoundException
use com.consentframework.consentmanagement.api.models.types#ConsentData
use com.consentframework.consentmanagement.api.models.types#ConsentExpiryTime
use com.consentframework.consentmanagement.api.models.types#ConsentId
use com.consentframework.consentmanagement.api.models.types#ConsentList
use com.consentframework.consentmanagement.api.models.types#ConsentStatus
use com.consentframework.consentmanagement.api.models.types#ServiceId
use com.consentframework.consentmanagement.api.models.types#UserId

@documentation("Update a user Consent for a given service.")
@http(method: "POST", uri: "/v1/consent-management/services/{serviceId}/users/{userId}/consents/{consentId}", code: 200)
operation UpdateServiceUserConsent {
    input: UpdateServiceUserConsentInput
    output: UpdateServiceUserConsentOutput
    errors: [
        InternalServiceException,
        NotFoundException
    ]
}

@input
structure UpdateServiceUserConsentInput {
    @required
    @httpLabel
    consentId: ConsentId

    @required
    @httpLabel
    serviceId: ServiceId

    @required
    @httpLabel
    userId: UserId

    status: ConsentStatus

    consentData: ConsentData

    expiryTime: ConsentExpiryTime
}

@output
structure UpdateServiceUserConsentOutput {}
