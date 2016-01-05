#!/bin/sh

if [ -d notes ]; then
	cd notes
else
	mkdir notes
	cd notes
fi
if [ ! -d img ]; then
	mkdir img
	touch img/index
fi
if [ ! -f makefile ]; then
	ln -s ~/dev/notes/makefile .
fi