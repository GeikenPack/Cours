#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <signal.h>
#include <sys/wait.h>

int count = 0;
int app = 0;

int finF = 0;
int status;
void handler(int sig) {count++; app = 1;}

void handler2(int sig) {finF = 1; waitpid(-1, &status, WNOHANG);}

int main(int argc, char* argv[])
{
    /* //Exo 1
    usleep(7000000); //sleep 7 secondes 
    execl("/usr/bin/xtermmmm", "xterm", NULL);
    if (errno)
    {
        perror("Erreur execl");
        exit(5);
    }
    //Si l'appel à exec ne fonctionne pas, le reste du programme ne s'exécute pas. 
    printf("Ne s'exécute jamais");
    return 0;
    */
   /* //Exo 2
   int pid = 0;S
   pid = fork();
   
   if (pid == 0)
   {
        printf("Je suis le fils de %d : mon PID est %d\n", getppid(), getpid());
        usleep(30000000);
        printf("Fin du fils %d\n", getpid());
        exit(40);
   }
   else
   {
        printf("Je suis le père de %d : mon PID est %d\n", pid, getpid());
        printf("Fin du père %d\n", getpid());
   }*/
    /* //Exo 3
   printf("Mon PID : %d", getpid());
   while(1)
   {
       printf(".");
       fflush(stdout);
       usleep(1000000);
   }
   return 0;*/

    /* //Exo 4
    signal(SIGINT, handler);
    while(1)
    {
        if (app)
        {
            if (count <= 3 && count > 0)
            {
                printf("Interruption numéro %d\n", count);
            }
            else if (count == 6)
            {
                exit(20);
            }
            app = 0;
        }
    }
    */

    signal(SIGCHLD, handler2);
    int compteur = 0;
    int id = fork();
    int codeR = 0;
    if (id == 0)
    {
        usleep(20000000);
        exit(5);
    }
    else
    {
        while (1)
        {
            printf("Compteur : %d\n", compteur);
            compteur++;
            if (finF == 1)
            {
                codeR = WEXITSTATUS(status);
                printf("Fin du fils : %d\n", codeR);
                finF = 0;
            }
            usleep(1000000);
        }
    }
}

