# Contributor: Colin 'Evaryont' Shea <evaryont@saphrix.com>
pkgname=arson
pkgver=2.1.2
pkgrel=1
pkgdesc="The HOT AUR search helper!"
arch=(any)
url="http://evaryont.github.com/arson/"
license=('GPL')
depends=(ruby-json ruby-facets)
makedepends=(rubygems)
filename="evaryont-$pkgname-$pkgver.gem"
source=(http://gems.github.com/gems/$filename)
noextract=($filename)
md5sums=('d5c03120dd9b641ca58a41e2c435e697')

build() {
  cd $srcdir
  gem install --ignore-dependencies --no-rdoc --no-ri -i "$pkgdir/usr/lib/ruby/gems/1.8" -n "$pkgdir/usr/bin" $filename
}

# vim:set ts=2 sw=2 et:
