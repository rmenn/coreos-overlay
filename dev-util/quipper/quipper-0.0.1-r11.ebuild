# Copyright (c) 2012 The Chromium OS Authors. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=4
CROS_WORKON_COMMIT="c1509bc1e18b38c3d042809c3fc6eaab58c79135"
CROS_WORKON_TREE="1af8f7cfbc13d84dd2b17d8492123a49ea14544b"
CROS_WORKON_LOCALNAME="../platform/chromiumos-wide-profiling"
CROS_WORKON_PROJECT="chromiumos/platform/chromiumos-wide-profiling"

inherit cros-workon toolchain-funcs

DESCRIPTION="Program used to collect performance data on ChromeOS machines"
HOMEPAGE=""

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm x86"
IUSE=""

RDEPEND="virtual/perf
	dev-libs/openssl
	dev-libs/protobuf"
DEPEND="test? ( dev-cpp/gtest )
	dev-libs/openssl
	dev-libs/protobuf"

src_configure() {
	tc-export CXX
}

src_compile() {
	emake ${PN}
}

src_test() {
	emake check
}

src_install() {
	dobin ${PN}
}
