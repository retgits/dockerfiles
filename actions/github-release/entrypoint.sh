#!/bin/sh

set -e

## Get the reposistory name and the owner name
OWNER="$(echo $GITHUB_REPOSITORY | cut -d'/' -f1)"
REPO="$(echo $GITHUB_REPOSITORY | cut -d'/' -f2)"

## Get the name of the folder which contains the artifacts
DIST="${ARTIFACT_DIR:-dist/}"

## Get the name of the branch
BRANCH=${GITHUB_REF//refs\/heads\//}

## Get the version number for the release or set a default version based on the current date
VERSION=v${BRANCH//refs\/tags\//}
if [ ${#VERSION} -eq 1 ]; then
    VERSION=$(date +v%Y%m%d%H%M%S)
    echo "No version found, setting default version based on date/time to ${VERSION}" 
fi

## Execute the command
if [ "$DIST" == "-version" ]; then
    ghr -version
else
    exec ghr -t "${GITHUB_TOKEN}" -u "${GITHUB_ACTOR}" -r "${REPO}" -n "${VERSION}" --replace "${VERSION}" "${DIST}"
fi