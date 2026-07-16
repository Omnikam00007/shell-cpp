#!/bin/sh
#
# Use this script to run your program LOCALLY.
#
# Note: Changing this script WILL NOT affect how CodeCrafters runs your program.
#
# Learn more: https://codecrafters.io/program-interface
error_trap() {
  echo "\n❌ [ERROR] Script failed during compilation or setup!"
  echo "Press [ENTER] to close this window and see what broke..."
  read dummy_variable
}

# Bind the function to the ERR signal so it catches any crash
trap 'error_trap' EXIT



set +e # Exit early if any commands fail
# set -x
# Copied from .codecrafters/compile.sh
#
# - Edit this to change how your program compiles locally
# - Edit .codecrafters/compile.sh to change how your program compiles remotely



(
  cd "$(dirname "$0")" # Ensure compile steps are run within the repository directory
  cmake -B build -S . -DCMAKE_TOOLCHAIN_FILE=${VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake
  cmake --build ./build
)

trap - EXIT

# set +e

# Copied from .codecrafters/run.sh
#
# - Edit this to change how your program runs locally
# - Edit .codecrafters/run.sh to change how your program runs remotely
exec $(dirname "$0")/build/shell "$@"
