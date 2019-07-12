
DEPENDS_LIST_ARACOMGEN ??= ""

# Some Adaptive Autosar applications defined in meta-ara and meta-st layer require
# ara-com-generator in the build process. However, this dependency on ara-com-gen
# is not present in the application's recipes. Thus, we add this build time dependency
# on every Adaptive Autosar application wich uses the generator.
DEPENDS_append = "${@bb.utils.contains('DEPENDS_LIST_ARACOMGEN', "${PN}", ' ara-com-gen', '', d)}"
