# consent-management-api-models

[![Generate API Docs](https://github.com/Consent-Management-Platform/consent-management-api-models/actions/workflows/generate-api-docs.yaml/badge.svg?branch=main)](https://github.com/Consent-Management-Platform/consent-management-api-models/actions/workflows/generate-api-docs.yaml)

This package defines API models for the Consent Management API.

See [latest v1 API documentation here](https://consent-management-platform.github.io/consent-management-api-models/v1/docs.html).

## Technologies
[Smithy](https://smithy.io) is used to produce protocol and technology agnostic API models that can be used to automatically generate:
* API specifications for various types of platforms
* API clients for various programming languages

[ReDoc](https://github.com/Redocly/redoc) is used to automatically generate API documentation from our API models.

[OpenAPI Generator](https://openapi-generator.tech) is used to automatically generate Java data models and client code from our Smithy-generated OpenAPI spec.

[GitHub Actions](https://docs.github.com/en/actions) are used to automatically generate and deploy HTML API documentation to [GitHub Pages](https://pages.github.com/) after changes are pushed to the main branch.

[GitHub Packages](https://github.com/features/packages) are used to release artifacts to a GitHub's version of Maven, so that the API models can be imported into other packages.

[Gradle](https://docs.gradle.org) is used to build the project and manage package dependencies.

## License
The code in this project is released under the [GPL-3.0 License](LICENSE).
