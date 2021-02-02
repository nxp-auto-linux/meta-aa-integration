
EXTERNALSRC := "${WORKDIR}/apd-cmake-modules"
ORIGINALSRC := "${THISDIR}/../../../ara-api/apd/apd-cmake-modules"

# relocate apd-cmake-modules folder and patch the cmake files, as configure
# fails under gatesgarth
addtask change_cmake_dir after do_patch before do_generate_toolchain_file, do_populate_lic

do_change_cmake_dir() {
	rm -rf ${EXTERNALSRC}
	mkdir -p ${EXTERNALSRC}
	cp -rf ${ORIGINALSRC}/src ${EXTERNALSRC}/
	cp -f ${ORIGINALSRC}/${CONFIGURE_FILES} ${EXTERNALSRC}/
	cp -f ${ORIGINALSRC}/LICENSE ${EXTERNALSRC}/
	
	# docker.cmake is the one that breaks the configure task
	sed -i 's/DOCKER docker REQUIRED/DOCKER docker/g' ${EXTERNALSRC}/src/docker.cmake
}
