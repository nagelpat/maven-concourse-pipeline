#!/bin/bash

set -e

cd terraform-source
make -f ../pipeline/tasks/Makefile
