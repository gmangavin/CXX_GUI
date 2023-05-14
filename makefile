CXX?=c++
SDL2_INCLUDE_DIR=H:/Coding/01_Libs/SDL2/x64/include
SDL2_LIBRARY_DIR=H:/Coding/01_Libs/SDL2/x64/lib
SDL2FLAGS=$(shell pkg-config sdl2 --cflags) -I$(SDL2_INCLUDE_DIR)
LDFLAGS=-L$(SDL2_LIBRARY_DIR) -lSDL2main -lSDL2
CXXFLAGS?=-std=c++11 -Wall -pedantic -Werror -Wshadow -Wstrict-aliasing -Wstrict-overflow

.PHONY: all msg clean fullclean

all: msg main

msg:
	@echo '--- C++11 ---'

main: ./src/main.cpp
	${CXX} ${CXXFLAGS} -O2 -o $@ $< ${SDL2FLAGS}

small: ./src/main.cpp
	${CXX} ${CXXFLAGS} -Os -o main $< ${SDL2FLAGS}
	-strip main
	-sstrip main

debug: ./src/main.cpp
	${CXX} ${CXXFLAGS} -O0 -g -o main $< ${SDL2FLAGS}

asm: main.asm

main.asm: main.cpp
	${CXX} ${CFLAGS} -S -masm=intel -Og -o main.asm $< ${SDL2FLAGS}

run: msg main
	time ./main

clean:
	rm -f main *.o main.asm

fullclean: clean