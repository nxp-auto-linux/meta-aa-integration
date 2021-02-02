FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

# Fix build with gcc10.2
# Use these patches from meta-openembedded
SRC_URI += " \
	file://241.patch \
	file://245.patch \
"
