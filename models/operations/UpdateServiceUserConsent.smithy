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
use com.consentframework.shared.models.exceptions#NotFoundException

@documentation("Update a user Consent for a given service.")
@http(method: "POST", uri: "/v1/consent-management/services/{serviceId}/users/{userId}/consents/{consentId}", code: 200)
operation UpdateServiceUserConsent {
    input: UpdateServiceUserConsentInput
    output: UpdateServiceUserConsentOutput
    errors: [
        BadRequestException,
        ConflictingResourceException,
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

    @documentation("Updated consent version, used to conditionally write only if the stored data has the prior version, to protect against race conditions or writing stale data.")
    @required
    consentVersion: Integer

    status: ConsentStatus

    consentType: ConsentType

    consentData: ConsentData

    expiryTime: ConsentExpiryTime
}

@output
structure UpdateServiceUserConsentOutput {}
