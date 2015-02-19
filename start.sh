#!/bin/bash
file="/website_files/index.html"
if [ -f "$file" ]
then
  echo "$file found."
else
  echo "$file not found."
  echo "Moving default index.html..."
  mv /index.html /website_files/index.html
fi
/usr/sbin/nginx
