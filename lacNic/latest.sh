#!/bin/sh
DIR_HOME="/home/rferreira/LacNic"
rm -rf $DIR_HOME/delegated-lacnic-latest
cd $DIR_HOME
wget -4 -c ftp://ftp.lacnic.net/pub/stats/lacnic/delegated-lacnic-latest
grep BR $DIR_HOME/delegated-lacnic-latest | grep ipv4 | awk -F "\|" '{print $4 "/" (32 - (log($5)/log(2)))}' > $DIR_HOME/cidrBR
count=`wc -l $DIR_HOME/cidrBR`
echo "#--- Prefixos IPv4" 
count=`wc -l $DIR_HOME/cidrBR`
/usr/bin/head -n 10 $DIR_HOME/cidrBR
echo "# --- CIDR IPv4 Check! Aguarde!!!"
sleep 2 
/usr/bin/tail -n 10 $DIR_HOME/cidrBR
echo "# --- CIDR IPv4 Check! Arquivo OK!!!"
echo "# ---Total de Prefixos CIDR IPv4 --- #"
echo $count
grep BR $DIR_HOME/delegated-lacnic-latest | grep ipv6 | awk -F "\|" '{print $4 "/" $5}' > $DIR_HOME/cidrBR6
count=`wc -l $DIR_HOME/cidrBR6`
echo "#--- Prefixos IPv6"
/usr/bin/head -n 10 $DIR_HOME/cidrBR6
echo "# --- CIDR IPv6 Check! Aguarde!!!"
sleep 2
/usr/bin/tail -n 10 $DIR_HOME/cidrBR6
echo "# --- CIDR IPv6 Check! Arquivo OK!!!"
echo "# ---Total de Prefixos CIDR IPv6 --- #"
echo $count
