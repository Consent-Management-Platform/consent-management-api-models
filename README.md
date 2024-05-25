# consent-management-api-models
This package defines API models for the Consent Management API.

Latest API documentation: [https://www.marksayson.com/consent-management-api-models/docs.html](https://www.marksayson.com/consent-management-api-models/docs.html)

## Technologies
Smithy is used to produce protocol and technology agnostic API models that can be used to automatically generate:
* API specifications for various types of platforms
* API clients for various programming languages

Redoc is used to automatically generate API documentation from our API models.

GitHub Actions are used to automatically generate and deploy HTML API documentation to GitHub Pages after changes are pushed to the main branch.

Gradle is used to build the project and manage package dependencies.

## Development
### First time set-up
To build the project for the first time, run

```sh
./gradlew build
```

and validate that it completes successfully.

After a successful build
* Smithy API models should be generated at `./build/smithyprojections/consent-management-api-models/source/model/model.json`.
* OpenAPI API models should be generated at `./build/smithyprojections/consent-management-api-models/source/openapi/ConsentManagementApi.openapi.json`.

### Subsequent builds
In order to clean up stale build artifacts and rebuild the API models based on your latest changes, run

```sh
./gradlew clean build
```

If you do not clean before building, your local environment may continue to use stale, cached versions of the API models in builds.

### Locally generating API documentation
Install yq by following your platform's installation instructions at https://github.com/mikefarah/yq.  This is a utility to convert JSON to YAML, which we'll use to convert Smithy's generated OpenAPI JSON spec to YAML, the format required by ReDoc.

Install @redocly/cli by running `npm install -g @redocly/cli`.  This will be used to generate the ReDoc API documentation.

Run `./gradlew clean build` to build the latest OpenAPI JSON specs.

Run the following to download and run scripts/generate-docs.sh from [https://github.com/msayson/smithy-gh-pages-action](https://github.com/msayson/smithy-gh-pages-action) to generate ReDoc API documentation at `build/docs/docs.html`:

From a Unix terminal:

```sh
mkdir -p build/scripts
curl -o build/scripts/generate-docs.sh https://raw.githubusercontent.com/msayson/smithy-gh-pages-action/main/scripts/generate-docs.sh
chmod +x build/scripts/generate-docs.sh

export OPENAPI_JSON_FILEPATH="build/smithyprojections/consent-management-api-models/source/openapi/ConsentManagementApi.openapi.json"
export OPENAPI_YAML_DIRECTORY="build/openapi"
export API_HTML_DOCS_DIRECTORY="build/docs"
./build/scripts/generate-docs.sh
```

From a Visual Studio Code terminal on Windows:

```sh
mkdir -p build/scripts
curl -o build/scripts/generate-docs.sh https://raw.githubusercontent.com/msayson/smithy-gh-pages-action/main/scripts/generate-docs.sh

$env:OPENAPI_JSON_FILEPATH="build/smithyprojections/consent-management-api-models/source/openapi/ConsentManagementApi.openapi.json"
$env:OPENAPI_YAML_DIRECTORY="build/openapi"
$env:API_HTML_DOCS_DIRECTORY="build/docs"
./build/scripts/generate-docs.sh
```

## References
* GitHub Actions: https://docs.github.com/en/actions
* Gradle: https://docs.gradle.org
* Redoc: https://github.com/Redocly/redoc
* Smithy: https://smithy.io
