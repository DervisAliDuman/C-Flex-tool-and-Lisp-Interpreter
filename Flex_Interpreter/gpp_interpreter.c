#include <stdio.h>    
#include <stdlib.h>    


int isbuffer(int flag, int *buffer){
    if(flag == 1){
        return buffer[1];
    } 
    if(buffer[0] == 1){ 
        return 0; 
    }else if(buffer[0] == 2){
        return buffer[2]; 
    }else{
        return 0;
    }
}


void print(int *buffer){
    int i = 1;
    if(buffer != NULL){
        printf("(");
        while(i < buffer[0]){
            printf("%d ",buffer[i]);
            i++;
        }
        printf("%d)\n",buffer[i]);
    } else {
        printf("()\n");
    }
}