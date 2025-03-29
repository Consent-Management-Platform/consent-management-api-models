$version: "2.0"

namespace com.consentframework.consentmanagement.api.models.operations

use com.consentframework.shared.models.consent#ConsentData
use com.consentframework.shared.models.consent#ConsentExpiryTime
use com.consentframework.shared.models.consent#ConsentId
use com.consentframework.shared.models.consent#ConsentStatus
use com.consentframework.shared.models.consent#ConsentType
use com.consentframework.shared.models.consent#ServiceId
use com.consentframework.shared.models.consent#UserId
use com.consentframework.shared.models.exceptions#BadRequestException
use com.consentframework.shared.models.exceptions#ConflictingResourceException
use com.consentframework.shared.models.exceptions#InternalServiceException

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
