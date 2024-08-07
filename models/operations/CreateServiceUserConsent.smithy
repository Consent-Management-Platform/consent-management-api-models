$version: "2.0"

namespace com.consentframework.consentmanagement.api.models.operations

use com.consentframework.consentmanagement.api.models.exceptions#BadRequestException
use com.consentframework.consentmanagement.api.models.exceptions#ConflictingResourceException
use com.consentframework.consentmanagement.api.models.exceptions#InternalServiceException
use com.consentframework.consentmanagement.api.models.types#ConsentData
use com.consentframework.consentmanagement.api.models.types#ConsentExpiryTime
use com.consentframework.consentmanagement.api.models.types#ConsentId
use com.consentframework.consentmanagement.api.models.types#ConsentStatus
use com.consentframework.consentmanagement.api.models.types#ConsentType
use com.consentframework.consentmanagement.api.models.types#ServiceId
use com.consentframework.consentmanagement.api.models.types#UserId

@documentation("Create a user Consent for a given service.")
@http(method: "POST", uri: "/v1/consent-management/services/{serviceId}/users/{userId}/consents", code: 200)
operation CreateServiceUserConsent {
    input: CreateServiceUserConsentInput
    output: CreateServiceUserConsentOutput
    errors: [
        BadRequestException,
        ConflictingResourceException,
        InternalServiceException
    ]
}

@input
structure CreateServiceUserConsentInput {
    @required
    @httpLabel
    serviceId: ServiceId

    @required
    @httpLabel
    userId: UserId

    @required
    status: ConsentStatus

    consentType: ConsentType

    consentData: ConsentData

    expiryTime: ConsentExpiryTime
}

@output
structure CreateServiceUserConsentOutput {
    @required
    consentId: ConsentId
}
