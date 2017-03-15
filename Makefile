VERSION := 15.4
RELEASE := 

all: build

build:
	sed -e "s|@@VERSION@@|$(VERSION)|g" -e "s|@@RELEASE@@|$(RELEASE)|g" files/desktop-version.in > files/desktop-version

install:
	mkdir -p ${DESTDIR}/usr/share/i18n
	mkdir -p ${DESTDIR}/usr/share/distro-info
	mkdir -p ${DESTDIR}/usr/share/backgrounds/deepin
	install -Dm644 files/i18n_dependent.json  ${DESTDIR}/usr/share/i18n/i18n_dependent.json
	install -Dm644 files/language_info.json  ${DESTDIR}/usr/share/i18n/language_info.json
	install -Dm644 files/desktop-version ${DESTDIR}/usr/lib/deepin/desktop-version
	echo "version,codename,series,created,release,eol" > ${DESTDIR}/usr/share/distro-info/deepin.csv
	echo "15.2,Unstable,unstable,2016-06-01" >> ${DESTDIR}/usr/share/distro-info/deepin.csv
	echo "15.3,Unstable,unstable,2016-09-12" >> ${DESTDIR}/usr/share/distro-info/deepin.csv
clean:
	rm -f files/desktop-version
