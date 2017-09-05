# pttg-docker-nginx-proxy
Proving Things - NGINX reverse proxy - certificate rotation aware

[![Docker Repository on Quay](https://quay.io/repository/ukhomeofficedigital/pttg-nginx-proxy/status "Docker Repository on Quay")](https://quay.io/repository/ukhomeofficedigital/pttg-nginx-proxy)

A version of [docker-nginx-proxy] with ability to restart nginx when it detects nginx is serving outdated SSL certificates
pages. - Please read [the documentation for that image].


Image contains two scripts;

* monitor_certs.sh that periodically checks if out of date certificates are being served. If so, it restart nginx
* go_and_monitor.sh that spawns the first script but then starts [docker-nginx-proxy] go.sh script.

This script is currently used for all Home Office Proving Things to Government services (pttg) e.g. [pttg-ip-api]
## Find Us

* [GitHub]
* [Quay.io]

## Versioning

This image will be versioned alongside the version of
[docker-nginx-proxy] it consumes, with a minor build number tagged on
the end. For the versions available, see the [tags on this repository].

## Authors

* **Andy Marke** - *Initial work* - [andymarke]

See also the list of [contributors] who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENCE.md]
file for details.

[contributors]:                     https://github.com/UKHomeOffice/pttg-docker-nginx-proxy/graphs/contributors
[andymarke]:                        https://github.com/andymarke
[docker-nginx-proxy]:               https://github.com/UKHomeOffice/docker-nginx-proxy
[GitHub]:                           https://github.com/UKHomeOffice/pttg-docker-nginx-proxy
[LICENCE.md]:                       LICENCE.md
[Quay.io]:                          https://quay.io/repository/ukhomeofficedigital/pttg-nginx-proxy
[tags on this repository]:          https://github.com/UKHomeOffice/pttg-docker-nginx-proxy/tags
[the documentation for that image]: https://github.com/UKHomeOffice/docker-nginx-proxy/blob/master/README.md
[pttg-ip-api]:                      https://github.com/UKHomeOffice/pttg-ip-api