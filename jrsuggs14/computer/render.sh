#!/bin/sh
cat fibbo.csv | python3 piper.py > fibbo.pov && povray fibbo.pov
