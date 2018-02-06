//
//  main.c
//  Lab6Task4
//
//  Created by tobychen on 2016/11/29.
//  Copyright © 2016年 Boston University. All rights reserved.
//

#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

int main(int argc, const char * argv[]) {
    int i=0, j=1, k=0;
    pid_t pid=fork();
    while(1) {
    if (pid == 0) {
    if(i<=1000) {
      i++;
      if (i%100==0)
	printf("Child pid %d %d\n", (int) getpid(), i);
      }
      else
      	exit(0);
    }
    else if (pid > 0) {
      if(k<=1000000) {
	k=i+j;
	i=j;
	j=k;
	if (k%2==0)
	  printf("Parent pid %d %d\n", (int) getpid(), k);
      }
      else 
      	exit(0);
    }
    }
    return 0;
}
