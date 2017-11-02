#!/bin/sh
# This script work only in Xcode. To add script:
# 1 - open GithubSDK.xcodeproj (if you don't have this file or have some problem with this file, just run ./pkg -c)
# 2 - go to project settings and select GithubSDK target
# 3 - select Build Phases
# 4 - tap + then tap New Run Script Phase
# 5 - put text below in to the editor
# if you have some problem try to run ./pkg -c, if its not help you can create Apollo by yourself

APOLLO_CODEGEN_PATH="$(eval find ${SRCROOT} -name "check-and-run-apollo-codegen.sh")"

if [ -z "$APOLLO_CODEGEN_PATH" ]; then
  echo "error: Couldn't find check-and-run-apollo-codegen.sh in APOLLO_CODEGEN_PATH; make sure that all is correct"
  exit 1
fi

cd "${SRCROOT}/Sources/${TARGET_NAME}"
"${APOLLO_CODEGEN_PATH}" generate $(find . -name '*.graphql') --schema ../../schema.json --output API.swift
