#!/bin/bash
mkdir -p ${BUILDPATH}/Workspace
mkdir -p ${BUILDPATH}/Libraries/python
mkdir -p ${BUILDPATH}/Validation/Output
#Get Modified Files
git diff --name-only --diff-filter=AMR HEAD^1 HEAD | xargs -I '{}' cp --parents -r '{}' ${BUILDPATH}

# Get packaged libs
find ${LIBRARYPATH} -name '*.whl' | xargs -I '{}' cp '{}' ${BUILDPATH}/Libraries/python/

# Generate artifact
tar -czvf Builds/latest_build.tar.gz ${BUILDPATH}
     
