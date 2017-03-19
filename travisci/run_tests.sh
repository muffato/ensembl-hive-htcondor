#!/bin/bash

## This script runs as a normal user (condoradmin) because the default
## configuration of Condor does not allow root to submit any jobs

# Stop the script at the first failure
set -e

echo "DEBUG: Environment of $0"; env; id; echo "END_DEBUG"

BUILD_DIR=/home/condoradmin/ensembl-hive-condor
cd $BUILD_DIR
export EHIVE_ROOT_DIR=$PWD/ensembl-hive
export PERL5LIB=$EHIVE_ROOT_DIR/modules:$PWD/modules
export EHIVE_TEST_PIPELINE_URLS='sqlite:///ehive_test_pipeline_db'

prove -rv t

