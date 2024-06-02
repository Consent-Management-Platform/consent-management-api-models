#!/usr/bin/env bash
#
# This script locally generates ReDoc API documentation
# from this package's Smithy models.
#
# Pre-requisites:
# 1. jq has been installed, ref: https://jqlang.github.io/jq/download/
# 2. yq has been installed, ref: https://github.com/mikefarah/yq
# 3. gh has been installed, ref: https://github.com/cli/cli#installation
#    - Once installed, set up your credentials via `gh auth login`
# 4. redoc-cli has been installed, ref: https://github.com/Redocly/redoc
#    - eg. `npm install -g @redocly/cli`
set -e

# Locate and save workspace directory for use in scripts
current_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export WORKSPACE_DIR="$current_dir/.."
cd $WORKSPACE_DIR

# Set up other env variables
export OPENAPI_JSON_FILEPATH="build/smithyprojections/consent-management-api-models/source/openapi/ConsentManagementApi.openapi.json"
export API_DOCS_HTML_FILEPATH="build/docs/docs.html"

# Generate OpenAPI spec files based on latest models
fullyQualifiedApiSpecFilepath="$WORKSPACE_DIR/$OPENAPI_JSON_FILEPATH"
if [ -f $fullyQualifiedApiSpecFilepath ]; then
    echo "Running 'gradle wrapper clean build' to update API spec to reflect latest models"
    gradle wrapper clean build
else
    echo "Running 'gradle wrapper build' to generate API spec since not found at $fullyQualifiedApiSpecFilepath"
    gradle wrapper build
fi

# Download script to generate API documentation from OpenAPI specification
mkdir -p $WORKSPACE_DIR/build/scripts
scriptName=generate-docs.sh
sourceFile="/repos/msayson/smithy-gh-pages-action/contents/scripts/$scriptName?ref=v1.1.0"
destinationFilepath="$WORKSPACE_DIR/build/scripts/$scriptName"
gh api \
    -H "Accept: application/vnd.github.raw+json" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    $sourceFile > $destinationFilepath

# Run script to generate API documentation
source $WORKSPACE_DIR/build/scripts/generate-docs.sh
