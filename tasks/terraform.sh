#!/bin/bash

set -e

env 

cd terraform-source
make -f ../pipeline/tasks/Makefile
