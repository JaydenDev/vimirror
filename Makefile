PREFIX = /usr

all:
	@echo Run \'make install\' to install this program!.

install:
	@mkdir -p $(DESTDIR)$(PREFIX)/bin
	@cp -p main.sh $(DESTDIR)$(PREFIX)/bin/vimirror
	@chmod 755 $(DESTDIR)$(PREFIX)/bin/vimirror


uninstall:
	@rm -rf $(DESTDIR)$(PREFIX)/bin/vimirror
