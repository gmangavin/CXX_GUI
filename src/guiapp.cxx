#include <SDL.h>
#include <iostream>

int main(int argc, char* argv[]) {
   std::cout << "Hello, World!" << std::endl;

   SDL_Window *window = nullptr;

   if (SDL_Init(SDL_INIT_VIDEO) < 0) {
      std::cout << "SDL could not initialize! SDL_Error: " << SDL_GetError() << std::endl;
   } else {
      window = SDL_CreateWindow("SDL Tutorial", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, 640, 480, SDL_WINDOW_SHOWN);
      if(window == NULL) {
         SDL_UpdateWindowSurface(window);
         SDL_Delay(2000);

      }
   }
   
   SDL_DestroyWindow(window);
   SDL_Quit();

   return 0;
}