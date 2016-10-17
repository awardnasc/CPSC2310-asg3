.text
.global mac
.extern printf

mac: 
   push {ip, lr}

   bl printf

   pop {ip, pc}

.data
string: .asciz "the number is: %d\n"
