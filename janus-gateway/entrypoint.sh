#!/bin/bash

set -m

janus-sentinel &

janus $@
