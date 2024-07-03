$version: "2.0"

namespace com.consentframework.consentmanagement.api.models.operations

use com.consentframework.consentmanagement.api.models.exceptions#BadRequestException
use com.consentframework.consentmanagement.api.models.exceptions#ConflictingResourceException
use com.consentframework.consentmanagement.api.models.exceptions#InternalServiceException
use com.consentframework.consentmanagement.api.models.exceptions#NotFoundException
use com.consentframework.consentmanagement.api.models.types#ConsentData
use com.consentframework.consentmanagement.api.models.types#ConsentExpiryTime
use com.consentframework.consentmanagement.api.models.types#ConsentId
use com.consentframework.consentmanagement.api.models.types#ConsentList
use com.consentframework.consentmanagement.api.models.types#ConsentStatus
use com.consentframework.consentmanagement.api.models.types#ConsentType
use com.consentframework.consentmanagement.api.models.types#ServiceId
use com.consentframework.consentmanagement.api.models.types#UserId

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
