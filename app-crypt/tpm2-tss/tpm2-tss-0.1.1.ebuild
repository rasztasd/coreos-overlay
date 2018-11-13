EAPI=5
DESCRIPTION=""
HOMEPAGE=""
SRC_URI=""
EGIT_REPO_URI="https://github.com/tpm2-software/tpm2-tss.git"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 arm arm64 ~m68k ~ppc ~ppc64 ~s390 ~sh ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

inherit git-r3

src_unpack() {
  git-r3_src_unpack
}

src_prepare() {
  ./bootstrap
  default
}

src_configure() {
  # ./configure  --prefix=${D}usr/share/tpm2-tss --exec-prefix=${D}/usr/share/tpm2-tss
  # ./configure --prefix=${D}usr/local
  ./configure
  # ./configure  --prefix=/usr/share/tpm2-tss --exec-prefix=/usr/share/tpm2-tss
}

src_install() {
  make DESTDIR="${D}" install

  # into  /usr/share/tpm2-tss
  # doins -r ${D}usr/share/tpm2-tss/
}
