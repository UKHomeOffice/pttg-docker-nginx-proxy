#!/usr/bin/env bash

CACHED_DATE_FILE=~/cached-cert-date.txt
ACTUAL_DATE_FILE=~/actual-cert-date.txt
SERVER_URL=localhost:10443
CERTIFICATE_FILE=${SERVER_CERT}
NGINX_BIN=/usr/local/openresty/nginx/sbin/nginx

function get-cached-cert-date {
	echo | openssl s_client  -connect $SERVER_URL | openssl x509 -noout -enddate  |  sed 's/.*notAfter=\(.*\)$/\1/g' > $CACHED_DATE_FILE
}

function get-actual-cert-date {
	openssl x509 -in $CERTIFICATE_FILE -noout -enddate  |  sed 's/.*notAfter=\(.*\)$/\1/g' > $ACTUAL_DATE_FILE
}

function check-dates {
	echo Checking certificate dates...
	get-cached-cert-date
	get-actual-cert-date
	DIFF=$(diff  $CACHED_DATE_FILE $ACTUAL_DATE_FILE)
	if [ "$DIFF" != "" ]
	then
		echo "nginx needs restarting due certificate dates changed"
		echo $DIFF
		eval "$NGINX_BIN -s reload"
	fi
}

while [ 1 ]
do
	sleep 60s
	check-dates
done





