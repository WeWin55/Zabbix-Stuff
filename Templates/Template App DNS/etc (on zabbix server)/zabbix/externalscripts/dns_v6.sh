#!/bin/bash
/usr/bin/host -6 -s -W 2 as202701.net $1 > /dev/null 2>&1; echo $?
