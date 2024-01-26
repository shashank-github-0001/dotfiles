#!/usr/bin/bash

g++ -std=c++23 $1 && ./a.out && rm -rf a.out
