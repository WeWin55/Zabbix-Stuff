#!/bin/bash
RES=`du -s "$1" | awk '{print $1}'`
echo $RES
