#!/bin/bash

egrep '^[0-9]{3}-[0-9]{2}-[0-9]{4}' testssn.txt > results.txt
sed -re "s/^[0-9]{3}-[0-9]{2}/xxx-xx/" results.txt

