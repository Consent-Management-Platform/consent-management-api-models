$version: "2.0"

namespace com.consentframework.consentmanagement.api.models.types

@documentation("Unstructured Consent data represented by string key-value pairs. Keys must be between 1-64 characters long, values must be between 1-256 characters long, and up to 32 key-value pairs may be provided.")
@length(max: 32)
map ConsentData {
    @length(min: 1, max: 64)
    key: String

    @length(min: 1, max: 256)
    value: String
}

@documentation("Record of user consent.")
structure Consent {
    @required
    consentId: ConsentId

    @required
    consentVersion: Integer

    @required
    userId: UserId

    @required
    serviceId: ServiceId

    @required
    status: ConsentStatus

    consentData: ConsentData

    expiryTime: ConsentExpiryTime
}

list ConsentList {
    member: Consent
}
