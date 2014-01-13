#!/bin/bash
sed -i "s/#define SPEEDUPPARSE//g"  Include/speedparse.h
make clean
