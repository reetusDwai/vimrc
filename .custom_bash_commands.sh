#!/bin/bash

# makes a new c file
function newc() {
	str="/*\nName: Kalem Smith\nCourse and Section: CSE 113_01\nDate: $(date '+%m/%d/%Y')\n900# 900361875\nDescription: \n*/\n#include<stdio.h>\n\nint main()\n{\n\n}"
	echo -e $str >> $1.c
	vim $1.c
}

# runs c file and outputs it
function runc() {
	name="${1%.*}"
	gcc $1 -o "output_${name}"
	./output_${name}
}
