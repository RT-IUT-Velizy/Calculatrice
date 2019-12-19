//
//  ViewController.m
//  ClientDeCalculIOS
//
//  Created by Théo on 10/12/2019.
//  Copyright © 2019 Théo. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#include <sys/types.h>
#include <sys/uio.h>
#include <unistd.h>
#include <arpa/inet.h>

#include <stdio.h>
#include <stdlib.h>
#include <strings.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)buttonact:(id)sender {
    
    NSString *get = self.calcul.text;
    
    
    NSLog(@"\nj'ai vu : %@", get);
    
    /*  Tentative iOS
    printf("Ini...");
    struct sockaddr_in addr;
    memset(&addr, 0, sizeof(addr));
    addr.sin_len        = sizeof(addr);
    addr.sin_family     = AF_INET;
    addr.sin_port       = htons(5001);
    inet_pton(AF_INET, "127.0.0.1", &(addr.sin_addr.s_addr));
    CFDataRef address = CFDataCreate(kCFAllocatorDefault,(const UInt8 *)&addr, sizeof(addr));
    CFSocketRef maCFSocket = CFSocketCreate(kCFAllocatorDefault,PF_INET, SOCK_STREAM,0, kCFSocketNoCallBack,NULL, NULL);
    CFSocketConnectToAddress(maCFSocket, address, 10);
    
    char message[256];
    CFDataRef buffer;
    strcpy(message, [get UTF8String]);
    
    printf("Votre message : %s", message);
    
    //memset(message,0,256);
    //fgets(message,255,stdin);
    buffer = CFDataCreate(kCFAllocatorDefault,(const UInt8 *)message, strlen(message));
    
    CFSocketSendData(maCFSocket, 0, buffer, 10);
    */
   
    
    // C Client Copy
    int sockfd, portno, n;
    struct sockaddr_in serv_addr;
    struct hostent *server;
    
    char buffer[256];
   
    
    portno = 5001;
    
    /* Create a socket point */
    sockfd = socket(PF_INET, SOCK_STREAM, 0);
    
    server = gethostbyname("127.0.0.1");
    
    //bzero((char *) &serv_addr, sizeof(serv_addr));
    serv_addr.sin_family = AF_INET;
    bcopy((char *)server->h_addr, // identique à memcpy
          (char *)&serv_addr.sin_addr.s_addr, server->h_length);
    
    serv_addr.sin_port = htons(portno);
    
    /* Now connect to the server */
    connect(sockfd,(struct sockaddr *)&serv_addr,sizeof(serv_addr));
    /* Now ask for a message from the user, this message
     * will be read by server
     */
    //printf("Please enter the message: ");
    bzero(buffer,256);
    //fgets(buffer,255,stdin);
    strcpy(buffer, [get UTF8String]);
    
    /* Send message to the server */
    n = write(sockfd,buffer,(ssize_t)strlen(buffer));
    
    /* Now read server response */
    bzero(buffer,256);
    n = read(sockfd,buffer,(ssize_t)255);
    
    printf("%s\n",buffer);
    
    NSString* result = [NSString stringWithUTF8String:buffer];;
    self.res.text = result;

}
@end
