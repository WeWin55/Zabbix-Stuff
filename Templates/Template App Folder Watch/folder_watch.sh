#!/bin/bash
RES=`dircnt "$1" | awk {'print $1'}`
echo $RES
