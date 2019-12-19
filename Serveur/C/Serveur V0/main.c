/* simpleServerSocket.c */
#include <stdio.h>
#include <stdlib.h>
#include <strings.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>

int main( int argc, char *argv[] )
{
    int sockfd, newsockfd, portno;
    unsigned int clilen;
    char buffer[256];
    struct sockaddr_in serv_addr, cli_addr;
    int  n;
    
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
    while (1)
   {
    /* Accept actual connection from the client */
       newsockfd = accept(sockfd, (struct sockaddr *)&cli_addr, &clilen);
    /* If connection is established then start communicating */
       bzero(buffer,256); // met le buffer à zéro (identique à memset)
       n = read( newsockfd,buffer,(ssize_t)255 );
       
       printf("Here is the message: %s\n",buffer);
               /* Write a response to the client */
       n = write(newsockfd,"I got your message",(ssize_t)18);
       
   }
    
        return 0;
}
