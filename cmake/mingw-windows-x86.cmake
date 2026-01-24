set(CMAKE_SYSTEM_NAME Windows)
set(CMAKE_SYSTEM_PROCESSOR x86_64)

# specify the cross compiler
set(CMAKE_C_COMPILER_TARGET i686-w64-mingw32-gcc)
set(CMAKE_CXX_COMPILER_TARGET i686-w64-mingw32-g++)
set(CMAKE_RC_COMPILER_TARGET i686-w64-mingw32-windres)

# where is the target environment
set(CMAKE_FIND_ROOT_PATH /usr/i686-w64-mingw32)

# search for programs in the build host directories
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# for libraries and headers in the target directories
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)


#vcpkg
set(MINGW TRUE)
set(VCPKG_TARGET_TRIPLET x64-mingw-static)
include("$env{VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake")
