#!/bin/bash
cd ~john/
rm -rf ./*
cd ~suzen/
echo ": $(ls | grep -o '[0-9a-zA-Z]\{28\}')"