cmake_minimum_required(VERSION 3.26)

# Name of the project
project(proj001 VERSION 1.0.0)

# Set the CMAKE_TOOLCHAIN_FILE variable
set(CMAKE_TOOLCHAIN_FILE C:/dev/vcpkg/scripts/buildsystems/vcpkg.cmake
  CACHE STRING "Vcpkg toolchain file")

set(SDL_CMAKE_DEBUG_POSTFIX "d" 
   CACHE STRING "Name suffix for debug builds") 

# Find SDL2 package
list(APPEND CMAKE_PREFIX_PATH "C:/dev/vcpkg/installed/x64-windows-static/share/sdl2")
find_package(SDL2 CONFIG REQUIRED)

# Create an executable
add_executable(${PROJECT_NAME} ./src/main.cxx)

# Link SDL2 to the executable
target_link_libraries(${PROJECT_NAME} SDL2::SDL2 SDL2::SDL2main)