
DEPENDS_LIST_ARACOMGEN ??= ""
BUILD_SYS_LIST_ARAGENERATOR ??= ""

# Some Adaptive Autosar applications defined in meta-ara and meta-st layer require
# ara-com-generator in the build process. However, this dependency on ara-com-gen
# is not present in the application's recipes. Thus, we add this build time dependency
# on every Adaptive Autosar application wich uses the generator.
DEPENDS_append = "${@bb.utils.contains('DEPENDS_LIST_ARACOMGEN', "${PN}", ' ara-com-gen', '', d)}"

# BUILD_SYS variable is used by some recipes from meta-st to refer
# the recipe specific sysroot instead of a general sysroot which
# is not longer used since rocko yocto distribution
BUILD_SYS_append = "${@bb.utils.contains('BUILD_SYS_LIST_ARAGENERATOR', "${PN}", ' /../work/aarch64-fsl-linux/${PN}/${PV}-${PR}/recipe-sysroot', '', d)}"
BUILD_SYS_remove = "${@bb.utils.contains('BUILD_SYS_LIST_ARAGENERATOR', "${PN}", ' x86_64-linux', '', d)}"
