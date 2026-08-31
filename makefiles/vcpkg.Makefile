#### Setup VCPKG to correct version 2026.07.29 tag is 9e593bb18ea69cc5095e012465dcd675a822ed0d
vcpkg/scripts/buildsystems/vcpkg.cmake:
	if [ -d vcpkg/.git ]; then \
		git -C vcpkg fetch --tags && \
		git -C vcpkg checkout --detach 2026.07.29; \
	else \
		git clone --branch 2026.07.29 https://github.com/microsoft/vcpkg; \
	fi
	cd vcpkg && ./bootstrap-vcpkg.sh

setup-vcpkg: vcpkg/scripts/buildsystems/vcpkg.cmake
	@echo 'Consider exporting VCPKG_TOOLCHAIN_PATH=$(PWD)/vcpkg/scripts/buildsystems/vcpkg.cmake'

cleanup-vcpkg:
	rm -rf vcpkg
