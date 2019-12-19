//
//  main.c
//  ServeurDeCalculV2
//
//  Created by admin on 25/11/2019.
//  Copyright © 2019 IUT de Vélizy. All rights reserved.
//

/* simpleServerSocket.c */
#include <stdio.h>
#include <stdlib.h>
#include <strings.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>

int calcul(char ent[]);
void doprocessing (int sock);

int main( int argc, char *argv[] )
{
    printf("initialisation...");
    int sockfd, newsockfd, portno;
    unsigned int clilen;
    char buffer[256];
    struct sockaddr_in serv_addr, cli_addr;
    int  n;
    pid_t pid;
    
    /* First call to socket() function */
    sockfd = socket(PF_INET, SOCK_STREAM, 0);
    
    /* Initialize socket structure */
    //bzero((char *) &serv_addr, sizeof(serv_addr));
    portno = 5001;
    
    
    
    serv_addr.sin_family = AF_INET;
    serv_addr.sin_addr.s_addr = INADDR_ANY;
    serv_addr.sin_port = htons(portno);
    
    
    
    /* Now bind the host address using bind() call.*/
    bind(sockfd, (struct sockaddr *) &serv_addr, sizeof(serv_addr));
    
    
    /* Now start listening for the clients, here process will
     * go in sleep mode and will wait for the incoming connection       */
    listen(sockfd,5);
    
    
    
    clilen = sizeof(cli_addr);
    printf("OK\n\n");
    while (1)
    {
        /* Accept actual connection from the client */
        newsockfd = accept(sockfd, (struct sockaddr *)&cli_addr, &clilen);
        /* If connection is established then start communicating */
        
        /* Create child process */
        pid = fork();
        if (pid == 0){
                /* This is the client process */
                close(sockfd);
                doprocessing(newsockfd);
                exit(0);
        }else{
                close(newsockfd);
        }
        
        /* SERVER V0 HERE
        bzero(buffer,256); // met le buffer à zéro (identique à memset)
        n = read( newsockfd,buffer,(ssize_t)255 );
        printf("Here is the message: %s",buffer);
        
        sprintf(buffer, "%d", calcul(buffer));
        printf("Le resultat est : %s\n\n",buffer);
        // Write a response to the client
        char msg[256] = "I got your message, the result is : ";
        strcat(msg, buffer);
        n = write(newsockfd, msg, strlen(msg));
        */
        
    }
    
    return 0;
}
int calcul(char ent[]){
    int res = 0;
    if(strstr(ent, "+") != NULL){
        printf("Il s'agit d'une addition\n");
        char delim[] = "+";
        char *ptr = strtok(ent, delim);
        int num1 = atoi(ptr);
        printf("le premier numéro est : %d\n", num1);
        ptr = strtok(NULL, delim);
        int num2 = atoi(ptr);
        printf("le deuxième numéro est : %d\n", num2);
        res = num1 + num2;
    }
    if(strstr(ent, "-") != NULL){
        printf("Il s'agit d'une soustraction\n");
        char delim[] = "-";
        char *ptr = strtok(ent, delim);
        int num1 = atoi(ptr);
        printf("le premier numéro est : %d\n", num1);
        ptr = strtok(NULL, delim);
        int num2 = atoi(ptr);
        printf("le deuxième numéro est : %d\n", num2);
        res = num1 - num2;
    }
    if(strstr(ent, "*") != NULL){
        printf("Il s'agit d'une mulitplication\n");
        char delim[] = "*";
        char *ptr = strtok(ent, delim);
        int num1 = atoi(ptr);
        printf("le premier numéro est : %d\n", num1);
        ptr = strtok(NULL, delim);
        int num2 = atoi(ptr);
        printf("le deuxième numéro est : %d\n", num2);
        res = num1 * num2;
    }
    if(strstr(ent, "/") != NULL){
        printf("Il s'agit d'une division\n");
        char delim[] = "/";
        char *ptr = strtok(ent, delim);
        int num1 = atoi(ptr);
        printf("le premier numéro est : %d\n", num1);
        ptr = strtok(NULL, delim);
        int num2 = atoi(ptr);
        printf("le deuxième numéro est : %d\n", num2);
        res = num1 / num2;
    }
    return res;
}

void doprocessing (int sock){
    int n;
    char buffer[256];
    bzero(buffer,256);
    
    n = read(sock,buffer,255);
    printf("Here is the message: %s\n",buffer);
    
    sprintf(buffer, "%d", calcul(buffer));
    printf("Le resultat est : %s\n\n",buffer);
    char msg[256] = "I got your message, the result is : ";
    strcat(msg, buffer);
    n = write(sock, msg, strlen(msg));
    //n = write(sock,"I got your message",18);
}
