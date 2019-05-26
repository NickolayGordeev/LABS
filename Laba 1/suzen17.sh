#!/bin/bash
echo "$(ls -a | grep -o '[0-9a-zA-Z]\{28\}')"