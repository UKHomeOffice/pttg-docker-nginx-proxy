FROM quay.io/ukhomeofficedigital/nginx-proxy:v3.1.3

ADD ./scripts/ /

ENTRYPOINT ["/go_and_monitor.sh"]
