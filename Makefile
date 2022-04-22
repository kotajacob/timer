# timer
# See LICENSE for copyright and license details.
.POSIX:
.SUFFIXES:

VERSION = 1.1.0
GO = go
RM = rm
INSTALL = install
SCDOC = scdoc
GOFLAGS =
PREFIX = /usr/local
BINDIR = bin
MANDIR = share/man

all: timer doc/timer.1

timer:
	$(GO) build -ldflags "-X main.Version=$(VERSION)" $(GOFLAGS)

doc/timer.1: doc/timer.1.scd
	$(SCDOC) < doc/timer.1.scd | sed "s/VERSION/$(VERSION)/g" > doc/timer.1

clean:
	$(RM) -f timer doc/timer.1

install:
	$(INSTALL) -dp \
		$(DESTDIR)$(PREFIX)/$(BINDIR)/ \
		$(DESTDIR)$(PREFIX)/$(MANDIR)/man1/
	$(INSTALL) -pm 0755 timer -t $(DESTDIR)$(PREFIX)/$(BINDIR)/
	$(INSTALL) -pm 0644 doc/timer.1 -t $(DESTDIR)$(PREFIX)/$(MANDIR)/man1/

uninstall:
	$(RM) -f \
		$(DESTDIR)$(PREFIX)/$(BINDIR)/timer \
		$(DESTDIR)$(PREFIX)/$(MANDIR)/man1/timer.1

.PHONY: all timer clean install uninstall
