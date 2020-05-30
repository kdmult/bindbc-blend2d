#!/bin/bash

nm -D ../bin/libblend2d.so | grep -E " bl.+" | cut -d' ' -f3 | sort
