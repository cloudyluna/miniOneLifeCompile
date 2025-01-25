#!/usr/bin/env bash

LEVEL="$1"
MAKEFILE_VARS="$2"

if [[ -z "$MAKEFILE_VARS" ]]
then
    echo "Need path to Makefile.common for second argument"
    exit 1
fi

DEBUG_PAT='s/OPTIMIZE_FLAG = .*/OPTIMIZE_FLAG = ${OPTIMIZE_OFF_FLAG}/'
DEBUG_NO_WARN_PAT='s/OPTIMIZE_FLAG = .*/OPTIMIZE_FLAG = ${OPTIMIZE_DEBUG_NO_WARN_FLAG}/'
DEBUG_ASAN_PAT='s/OPTIMIZE_FLAG = .*/OPTIMIZE_FLAG = ${OPTIMIZE_DEBUG_ASAN_FLAG}/'
FAST_PAT='s/OPTIMIZE_FLAG = .*/OPTIMIZE_FLAG = ${OPTIMIZE_ON_FLAG}/'

case "$LEVEL" in
    "debug")
        sed -i "$DEBUG_PAT" "$MAKEFILE_VARS"
        ;;
    "debug_no_warn")
        sed -i "$DEBUG_NO_WARN_PAT" "$MAKEFILE_VARS"
        ;;
    "debug_asan")
        sed -i "$DEBUG_ASAN_PAT" "$MAKEFILE_VARS"
        ;;
    "fast")
        sed -i "$FAST_PAT" "$MAKEFILE_VARS"
        ;;
    *)
        sed -i "$DEBUG_PAT" "$MAKEFILE_VARS"
        ;;
esac

exit
