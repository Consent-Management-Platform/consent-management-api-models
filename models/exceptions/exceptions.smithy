$version: "2.0"

namespace com.consentframework.consentmanagement.api.models.exceptions

@documentation("This exception is thrown when the requested entity is not found.")
@error("client")
@httpError(404)
structure NotFoundException {
  message: String
}

@documentation("This exception is thrown on an unhandled service error.")
@error("server")
@httpError(500)
structure InternalServiceException {
    message: String
}
