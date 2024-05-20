# consent-management-api-models
This package defines API models for the Consent Management API.

## Technologies
We use Smithy to produce protocol and technology agnostic API models that can be used to automatically generate:
* API specifications for various types of platforms
* API clients for various programming languages

We use Gradle to build the project and manage package dependencies.

## Development
### First time set-up
To build the project for the first time, run

```sh
./gradlew build
```

and validate that it completes successfully.

After a successful build, the Smithy API models should be generated at `./build/smithyprojections/consent-management-api-models/source/model/model.json`.

### Subsequent builds
In order to clean up stale build artifacts and rebuild the API models based on your latest changes, run

```sh
./gradlew clean build
```

If you do not clean before building, your local environment may continue to use stale, cached versions of the API models in builds.

## References
* Gradle documentation: https://docs.gradle.org
* Smithy documentation: https://smithy.io
