all:
	g++ -Ih:/coding/01_libs/SDL2/x64/include/SDL2 -Lh:/coding/01_libs/SDL2/x64/lib -lSDL2 -lSDL2main -o main src/*.cxx -lmingw32 -lSDL2main -lSDL2