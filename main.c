#include <stdio.h>

int main(void){
   int a,b,c;

   printf("Input three integer values seperated by spaces: ");
   scanf("%d %d %d", &a, &b, &c);
   printf("You entered: %d, %d, and  %d\n", a, b, c);

   return 0;
}
