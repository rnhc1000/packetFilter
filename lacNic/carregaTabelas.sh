#!/bin/sh
/sbin/pfctl -t cidrBR  -T add -f cidrBR
/sbin/pfctl -t cidrBR6 -T add -f cidrBR6
/bin/mv cidrBR cidrBR6 /etc/pf.files/ 
