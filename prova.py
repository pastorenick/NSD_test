#!/usr/bin/python
# Filename: prova.py

import os, time, sys
print 'ciao'
from pyraf import iraf

#def get_head(image):
#    s=iraf.imhead(image,long='yes', Stdout=1)
#    for i in s:
#        print i

#get_head('4458dec.fits')
os.system('ds9&')
iraf.display('4458dec.fits')
