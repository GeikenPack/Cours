#include <stdio.h>
#include <unistd.h>
 
int main(int argc, char* argv[]){
  usleep(7000000); /* sleep 7 seconds */
  execl("/usr/bin/xterm", "xterm", NULL); 
      /* si l'appel à exec fonctionne, le reste 
                 du programme ne s’exécute jamais */
  printf("ne s'affiche jamais");
  return 0;
}
