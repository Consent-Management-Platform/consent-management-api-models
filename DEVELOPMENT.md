# Development

## Building the project

### First-time set-up
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

## Locally generating API documentation

### First-time set-up
Install jq by following instructions at https://jqlang.github.io/jq/download/.  This is used to parse JSON input.

Install yq by following instructions at https://github.com/mikefarah/yq.  This is a utility to convert JSON to YAML, which we'll use to convert Smithy's generated OpenAPI JSON spec to YAML, the format required by ReDoc.

Install @redocly/cli by running `npm install -g @redocly/cli`.  This will be used to generate the ReDoc API documentation.

### Running script to generate API docs
Run `./scripts/generate-local-api-docs.sh` to locally generate ReDoc API documentation at `build/docs/docs.html`.
