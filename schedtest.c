#include "types.h"
#include "user.h"

int main(int argc, char *argv[]) {
    if (argc < 2){
        printf(1, "usage: schedtest loops tickets1 [ tickets2 ... ticketsN ]");
        exit();
    }
    int i;
    int outputnum = atoi(argv[1]);
    int pidarr[argc - 2];
    for (i = 0; i < argc - 2; i++) {
        int ntickets = atoi(argv[i + 2]);
        int p = fork();
        if (p == 0){
            settickets(ntickets);
            while(1);
        } else {
            pidarr[i] = p;
        }
    }
    printf(1, "outputnum: %d", argc);
    for (i = 0; i < outputnum; i++){
        ps();
        sleep(3);
    }
    
    for (i = 0; i < argc - 1; i++){
        kill(pidarr[i]);
    }
     
    for (i = 0; i < argc - 1; i++){
        wait();
    }

    exit();
}
