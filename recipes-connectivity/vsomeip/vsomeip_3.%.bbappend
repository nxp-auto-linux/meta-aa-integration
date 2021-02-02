FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

# Fix build with gcc10.2
SRC_URI += " \
	file://0001-Fix-build-with-gcc10.2.patch \
"

