#!/bin/sh

PREFIX=${PREFIX:=/usr/local}

install -d ${PREFIX}/bin
install -d ${PREFIX}/man/man1
install mgitstatus ${PREFIX}/bin/
install mgitstatus.1 ${PREFIX}/man/man1/
