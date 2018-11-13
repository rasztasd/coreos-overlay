EAPI=5
DESCRIPTION=""
HOMEPAGE=""
SRC_URI=""
EGIT_REPO_URI="https://github.com/tpm2-software/tpm2-tools.git"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm arm64 ~m68k ~ppc ~ppc64 ~s390 ~sh ~x86"
IUSE=""

DEPEND="app-crypt/tpm2-tss"
RDEPEND="${DEPEND}"

inherit git-r3

src_unpack() {
  git-r3_src_unpack
}

src_prepare() {
  default
}

src_configure() {
  echo 'asdf'
  echo ${SYSROOT}

  ./bootstrap
  # ./configure --prefix=${SYSROOT}/usr/share/tpm2-tss  PKG_CONFIG_PATH=${SYSROOT}/usr/share/tpm2-tss/lib/pkgconfig
  # ./configure
  LDFLAGS="-L${SYSROOT}/usr/local/lib/ " CPPFLAGS="-I${SYSROOT}/usr/local/include " PKG_CONFIG_PATH=${SYSROOT}/usr/local/lib/pkgconfig ./configure
}

# src_install() {
#   emake install
#   emake DESTDIR="${D}" install
# }

src_install() {
  # make install
  make DESTDIR="${D}" install
  # into  /usr/share/tpm2-tools
  # doins -r ${D}usr/share/tpm2-tools/
}
