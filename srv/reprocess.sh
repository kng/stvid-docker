#!/bin/bash
find obs -type f \( \
        -iname \*.dat -o \
        -iname \*.png -o \
        -iname \*.cal -o \
        -iname \*.cat -o \
        -iname \*.csv -o \
        -iname test.fits \) -delete -print

