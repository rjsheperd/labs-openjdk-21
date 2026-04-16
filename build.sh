#!/usr/bin/env bash

# Build static-libs-image using the macOS SDK and system clang.
# iOS-specific compilation is handled by the Xcode projects in the parent build.
# The ios-jdk.patch only affects files compiled by those Xcode projects
# (libjava/libnet), so no iOS flags are needed here.

./configure \
    --with-conf-name=labsjdk \
    --with-version-opt=jvmci-23.1.3-b33 \
    --with-version-pre= \
    --with-vendor-name="GraalVM Community" \
    --with-vendor-url=https://www.graalvm.org/ \
    --with-vendor-bug-url=https://github.com/oracle/graal/issues \
    --with-vendor-vm-bug-url=https://github.com/oracle/graal/issues

# make CONF_NAME=labsjdk graal-builder-image
make CONF_NAME=labsjdk static-libs-image
