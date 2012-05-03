# Makefile for my dns scripts package
# `make dist' needs my bundle >= 0.9.1.
allscripts = addomains dns_aliases dnsinkhole domgrep domlookup findomains ldig makehosts optdomains domains.example hosts.example pdnsd.conf

all: 
	@echo "This makefile is meant for use by the author of this package. "
	@echo "If you are not the author, please run 'make install' instead."
	@echo "This makefile will install programs in \$$DESTDIR/usr/bin"

dist: dns-bash-bundle.sh

dns-bash-bundle.sh : $(allscripts) Makefile
	bundle -z -s $(allscripts) Makefile > dns-bash-bundle.sh
	@echo All done.

install: $(allscripts)
	install -d -m755 "$(DESTDIR)/usr/bin/"
	install -D -m755 $(allscripts) "$(DESTDIR)/usr/bin/"
