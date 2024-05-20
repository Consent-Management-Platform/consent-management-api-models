$version: "2.0"

namespace com.consentframework.consentmanagement.api.models.types

@documentation("Unique identifier for a Consent.")
string ConsentId

@documentation("Unique identifier for a service.")
string ServiceId

@documentation("Unique identifier for a user.")
string UserId

@documentation("Time when the Consent automatically expires, using the ISO 8601 format.")
@timestampFormat("date-time")
timestamp ConsentExpiryTime

@documentation("Current status of a Consent.")
enum ConsentStatus {
    ACTIVE,
    EXPIRED,
    REVOKED
}
