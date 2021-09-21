#!/bin/bash

set -eo pipefail

cd artblock-package; swift test --parallel; cd ..
