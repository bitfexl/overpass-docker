#!/bin/bash
echo "Logs"
echo "------"
echo "1) Apache error log"
echo "2) Apache access log"
echo "3) Overpass nohup log"
echo
echo "Overpass"
echo "----------"
echo "4) Overpass status"
echo "5) Start overpass"
echo "6) Stop overpass"
echo "7) Remove named sockets (sometimes fixes overpass after restart)"
echo
echo "Apache"
echo "--------"
echo "8) Apache status"
echo "9) Start apache"
echo "10) Stop apache"
echo
echo "Enter option: "
read option

if [[ $option = 1 ]]
then
    less -N +G /var/log/apache2/error.log
elif [[ $option = 2 ]]
then
    less -N +G /var/log/apache2/access.log
elif [[ $option = 3 ]]
then
    less -N +G /overpass/nohup.out
elif [[ $option = 4 ]]
then
    /overpass/bin/dispatcher --osm-base --status
elif [[ $option = 5 ]]
then
    nohup /overpass/bin/dispatcher --osm-base --db-dir=/data/db &
elif [[ $option = 6 ]]
then
    /overpass/bin/dispatcher --osm-base --terminate
elif [[ $option = 7 ]]
then
    rm /data/db/osm3s_*
elif [[ $option = 8 ]]
then
    service apache2 status
elif [[ $option = 9 ]]
then
    service apache2 start
elif [[ $option = 10 ]]
then
    service apache2 stop
else
    echo "Unknown option '$option'."
fi