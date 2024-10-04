# Maintainer: Taijian <taijian@posteo.de>
# Contributor: Sebastian Lau <lauseb644@gmail.com>
# Contributor Damian01w <damian01w@gmail.com>
# Contributor: Padfoot <padfoot@exemail.com.au>
# Editor: Ardox <ardox@axos-project.com>

pkgname=plymouth
pkgver=24.004.60
pkgrel=1
pkgdesc="A graphical boot splash screen with kernel mode-setting support"
url="https://www.freedesktop.org/wiki/Software/Plymouth/"
arch=('i686' 'x86_64')
license=('GPL')
epoch=1

depends=('libdrm' 'pango' 'systemd')
makedepends=('docbook-xsl')
optdepends=('cantarell-fonts: For text output, e.g. during decryption'
        'xf86-video-fbdev: Support special graphic cards on early startup')
backup=('etc/plymouth/plymouthd.conf')

source=("https://gitlab.freedesktop.org/${pkgname}/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
    	'axos-logo.png'
       'plymouth.encrypt_hook'
       'plymouth.encrypt_install'
       'lightdm-plymouth.service'
       'sddm-plymouth.service'
       'plymouth-deactivate.service' # needed for sddm
       'plymouth.initcpio_hook'
       'plymouth.initcpio_install'
       'sd-plymouth.initcpio_install'
       'plymouth-quit.service.in.patch'
       'plymouth-update-initrd.patch'
       'plymouthd.conf.patch'
       'ply-utils.c.patch'
       'runstatedir.patch'
)
prepare() {
	cd "$srcdir"/${pkgname}-${pkgver}
	patch -p1 -i $srcdir/plymouth-update-initrd.patch
	patch -p1 -i $srcdir/plymouth-quit.service.in.patch
	patch -p1 -i $srcdir/plymouthd.conf.patch
	# apply upstream patches
	patch -p1 -i $srcdir/ply-utils.c.patch
	# patch -p1 -i $srcdir/runstatedir.patch
}

build() {
	cd "$srcdir"/${pkgname}-${pkgver}

	LDFLAGS="$LDFLAGS -ludev" ./autogen.sh \
		--prefix=/usr \
		--exec-prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--libdir=/usr/lib \
		--libexecdir=/usr/lib \
		--sbindir=/usr/bin \
		--enable-systemd-integration \
		--enable-drm \
		--enable-tracing \
		--enable-pango \
		--enable-gtk=no \
		--with-release-file=/etc/os-release \
		--with-logo=/usr/share/plymouth/axos-logo.png \
		--with-background-color=0x000000 \
		--with-background-start-color-stop=0x000000 \
		--with-background-end-color-stop=0x4D4D4D \
		--without-rhgb-compat-link \
		--without-system-root-install \
		--runstatedir=/run

	make
}

package() {
	cd "$srcdir"/${pkgname}-${pkgver}

	make DESTDIR="$pkgdir" install

	install -Dm644 "$srcdir/axos-logo.png" "$pkgdir/usr/share/plymouth/axos-logo.png"

	install -Dm644 "$srcdir/plymouth.encrypt_hook" "$pkgdir/usr/lib/initcpio/hooks/plymouth-encrypt"
	install -Dm644 "$srcdir/plymouth.encrypt_install" "$pkgdir/usr/lib/initcpio/install/plymouth-encrypt"
	install -Dm644 "$srcdir/plymouth.initcpio_hook" "$pkgdir/usr/lib/initcpio/hooks/plymouth"
	install -Dm644 "$srcdir/plymouth.initcpio_install" "$pkgdir/usr/lib/initcpio/install/plymouth"
	install -Dm644 "$srcdir/sd-plymouth.initcpio_install" "$pkgdir/usr/lib/initcpio/install/sd-plymouth"

	for i in {sddm,lightdm}-plymouth.service; do
		install -Dm644 "$srcdir/$i" "$pkgdir/usr/lib/systemd/system/$i"
	done

	install -Dm644 "$srcdir/plymouth-deactivate.service" 	"$pkgdir/usr/lib/systemd/system/plymouth-deactivate.service"
	install -Dm644 "$pkgdir/usr/share/plymouth/plymouthd.defaults" "$pkgdir/etc/plymouth/plymouthd.conf"
}
sha256sums=('f59bc6dea9745c32e9ca03a717adc284b0ea5677243a7769eb8a7c6cc1eba801'
            '933eb942ed6e266f93243463a6a1cc811d9c5ccdc48fa89847fe775961a99279'
            '748e0cfa0e10ab781bc202fceeed46e765ed788784f1b85945187b0f29eafad7'
            '373ec20fe4c47e693a0c45cc06dd906e35dd1d70a85546bd1d571391de11763a'
            '2026b7507c3ae919b18c7c6ecf00b79ddc627e12eed06f121233784386659ae5'
            'c39f526f7e99173bc8f012900f53257537a25e2d8c19e23df630f1fe9a7627ba'
            '3b17ed58b59a4b60d904c60bba52bae7ad685aa8273f6ceaae08a15870c0a9eb'
            '2a80e2cad8de428358647677afa166219589d3338c5f94838146c804a29e2769'
            'a3e7ae0d465cd46fdfc533b348f95de4287dc4e5e29a0e3508b4fe7ab8bc8c57'
            'cae15006894197410ed79b337de8cf033fe0a8ece9fe7dad4b6db9bda1434774'
            'dec28b86ddea93704f8479d33e08f81cd7ff4ccaad57e9053c23bd046db2278a'
            '74908ba59cea53c6a9ab67bb6dec1de1616f3851a0fd89bb3c157a1c54e6633a'
            'f17c33fe69c13ac97980fb6ba5b1dedba107459d82d8c781ea4f4a7bd4bb941e'
            '194bfe9a3917f47203c9d23c25ca13b5ae8bbe836596db9a794440925ad427bf'
            'c4fdc475d35d32f8211b9b1ca860ccedcd20124b85aa4a38bb538c342ba21d8c')
