#!/bin/bash

# Exit if any of the intermediate steps fail
set -e

# Extract "foo" and "baz" arguments from the input into
# FOO and BAZ shell variables.
# jq will ensure that the values are properly quoted
# and escaped for consumption by the shell.
eval "$(jq -r '@sh "WORKSPACE=\r(.workspace) PROJECTCODE=\r(.projectcode) URL=\r(.url)"')"
# Placeholder for whatever data-fetching logic your script implements
curl --header "querytext: $WORKSPACE-$PROJECTCODE" $URL