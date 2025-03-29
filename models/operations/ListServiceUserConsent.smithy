$version: "2.0"

namespace com.consentframework.consentmanagement.api.models.operations

use com.consentframework.shared.models.consent#ConsentList
use com.consentframework.shared.models.consent#ServiceId
use com.consentframework.shared.models.consent#UserId
use com.consentframework.shared.models.exceptions#InternalServiceException
use com.consentframework.shared.models.exceptions#BadRequestException

@documentation("List consents a user has granted to a given service.")
@readonly
@http(method: "GET", uri: "/v1/consent-management/services/{serviceId}/users/{userId}/consents", code: 200)
operation ListServiceUserConsent {
    input: ListServiceUserConsentInput
    output: ListServiceUserConsentOutput
    errors: [
        BadRequestException,
        InternalServiceException
    ]
}

@input
structure ListServiceUserConsentInput {
    @required
    @httpLabel
    serviceId: ServiceId

    @required
    @httpLabel
    userId: UserId

    @documentation("Optional. Maximum number of Consents to return in a single response.")
    @httpQuery("limit")
    limit: Integer

    @documentation("Optional. The nextPageToken returned from the previous list request.")
    @httpQuery("pageToken")
    pageToken: String
}

@output
structure ListServiceUserConsentOutput {
    @documentation("Page of Consents")
    data: ConsentList

    @documentation("Pagination token to retrieve the next page of results.")
    nextPageToken: String
}
