#include "types.h"
#include "user.h"

int main(int argc, char *argv[]) {
    if (argc < 2){
        printf(1, "usage: schedtest loops tickets1 [ tickets2 ... ticketsN ]");
    }
    int i;
    int outputnum = atoi(argv[0]);
    int pidarr[argc - 1];
    for (i = 0; i < argc - 1; i++) {
        int ntickets = atoi(argv[i + 1]);
        pidarr[i] = fork();
        if (pidarr[i] == 0){
            settickets(ntickets);
            while(1);
        }
    }
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

    return 0;
}
