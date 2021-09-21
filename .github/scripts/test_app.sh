#!/bin/bash

set -eo pipefail

xcodebuild -workspace artblock.xcworkspace \
            -scheme artblock\ tvOS \
            -destination platform=tvOS\ Simulator,OS=13.3,name=Apple TV\ 11 \
            clean test | xcpretty
