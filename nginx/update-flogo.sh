#!/bin/sh
cd ~
wget -O pages.zip http://gogs:3000/retgits/flogo-artifact-repository/archive/pages.zip
unzip pages.zip
rm -rf /usr/share/nginx/html/flogo-artifact-repository
mv flogo-artifact-repository/public /usr/share/nginx/html/flogo-artifact-repository
