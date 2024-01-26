#!/usr/bin/env bash

tsc $1.ts && bun $1.js && rm -rf $1.js
