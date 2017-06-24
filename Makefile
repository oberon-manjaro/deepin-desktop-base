VERSION := 17.0.2
RELEASE := 

all: build

build:
	sed -e "s|@@VERSION@@|$(VERSION)|g" -e "s|@@RELEASE@@|$(RELEASE)|g" files/desktop-version.in > files/desktop-version

install:
	mkdir -p ${DESTDIR}/usr/share/i18n
	mkdir -p ${DESTDIR}/usr/share/distro-info
	install -Dm644 files/i18n_dependent.json  ${DESTDIR}/usr/share/i18n/i18n_dependent.json
	install -Dm644 files/language_info.json  ${DESTDIR}/usr/share/i18n/language_info.json
	install -Dm644 files/desktop-version ${DESTDIR}/usr/lib/deepin/desktop-version
	ln -s ${DESTDIR}/usr/lib/deepin/desktop-version ${DESTDIR}/etc/deepin-version
clean:
	rm -f files/desktop-version
