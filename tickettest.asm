
_tickettest:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp
  printf(1, "parent pid: %d; tickets should be 10\n", getpid());
   9:	e8 7f 05 00 00       	call   58d <getpid>
   e:	89 44 24 08          	mov    %eax,0x8(%esp)
  12:	c7 44 24 04 6c 0a 00 	movl   $0xa6c,0x4(%esp)
  19:	00 
  1a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  21:	e8 77 06 00 00       	call   69d <printf>
  ps();
  26:	e8 32 01 00 00       	call   15d <ps>
  int pid = fork();
  2b:	e8 d5 04 00 00       	call   505 <fork>
  30:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  if (pid == 0)
  34:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
  39:	75 27                	jne    62 <main+0x62>
  {
     printf(1, "first child pid: %d; tickets should be 10\n", getpid());
  3b:	e8 4d 05 00 00       	call   58d <getpid>
  40:	89 44 24 08          	mov    %eax,0x8(%esp)
  44:	c7 44 24 04 94 0a 00 	movl   $0xa94,0x4(%esp)
  4b:	00 
  4c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  53:	e8 45 06 00 00       	call   69d <printf>
     ps();
  58:	e8 00 01 00 00       	call   15d <ps>
     exit();
  5d:	e8 ab 04 00 00       	call   50d <exit>
  }
  wait();
  62:	e8 ae 04 00 00       	call   515 <wait>
  printf(1, "parent pid: %d; setting tickets to 20\n", getpid());
  67:	e8 21 05 00 00       	call   58d <getpid>
  6c:	89 44 24 08          	mov    %eax,0x8(%esp)
  70:	c7 44 24 04 c0 0a 00 	movl   $0xac0,0x4(%esp)
  77:	00 
  78:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  7f:	e8 19 06 00 00       	call   69d <printf>
  settickets(20);
  84:	c7 04 24 14 00 00 00 	movl   $0x14,(%esp)
  8b:	e8 25 05 00 00       	call   5b5 <settickets>
  ps();
  90:	e8 c8 00 00 00       	call   15d <ps>
  pid = fork();
  95:	e8 6b 04 00 00       	call   505 <fork>
  9a:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  if (pid == 0)
  9e:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
  a3:	0f 85 85 00 00 00    	jne    12e <main+0x12e>
  {
     printf(1, "second child pid: %d; tickets should be 20\n", getpid());
  a9:	e8 df 04 00 00       	call   58d <getpid>
  ae:	89 44 24 08          	mov    %eax,0x8(%esp)
  b2:	c7 44 24 04 e8 0a 00 	movl   $0xae8,0x4(%esp)
  b9:	00 
  ba:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  c1:	e8 d7 05 00 00       	call   69d <printf>
     ps();
  c6:	e8 92 00 00 00       	call   15d <ps>
     settickets(30);
  cb:	c7 04 24 1e 00 00 00 	movl   $0x1e,(%esp)
  d2:	e8 de 04 00 00       	call   5b5 <settickets>
     printf(1, "second child pid: %d; tickets should now be 30\n");
  d7:	c7 44 24 04 14 0b 00 	movl   $0xb14,0x4(%esp)
  de:	00 
  df:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  e6:	e8 b2 05 00 00       	call   69d <printf>
     ps();
  eb:	e8 6d 00 00 00       	call   15d <ps>
     pid = fork();
  f0:	e8 10 04 00 00       	call   505 <fork>
  f5:	89 44 24 1c          	mov    %eax,0x1c(%esp)
     if (pid == 0)
  f9:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
  fe:	75 24                	jne    124 <main+0x124>
     {
        printf(1, "child of second child pid: %d; tickets should be 30\n", getpid());
 100:	e8 88 04 00 00       	call   58d <getpid>
 105:	89 44 24 08          	mov    %eax,0x8(%esp)
 109:	c7 44 24 04 44 0b 00 	movl   $0xb44,0x4(%esp)
 110:	00 
 111:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 118:	e8 80 05 00 00       	call   69d <printf>
        ps();
 11d:	e8 3b 00 00 00       	call   15d <ps>
 122:	eb 0a                	jmp    12e <main+0x12e>
     } else
     {
        wait();
 124:	e8 ec 03 00 00       	call   515 <wait>
        exit();
 129:	e8 df 03 00 00       	call   50d <exit>
     }
  }
  wait();
 12e:	e8 e2 03 00 00       	call   515 <wait>
  exit();
 133:	e8 d5 03 00 00       	call   50d <exit>

00000138 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 138:	55                   	push   %ebp
 139:	89 e5                	mov    %esp,%ebp
 13b:	57                   	push   %edi
 13c:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 13d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 140:	8b 55 10             	mov    0x10(%ebp),%edx
 143:	8b 45 0c             	mov    0xc(%ebp),%eax
 146:	89 cb                	mov    %ecx,%ebx
 148:	89 df                	mov    %ebx,%edi
 14a:	89 d1                	mov    %edx,%ecx
 14c:	fc                   	cld    
 14d:	f3 aa                	rep stos %al,%es:(%edi)
 14f:	89 ca                	mov    %ecx,%edx
 151:	89 fb                	mov    %edi,%ebx
 153:	89 5d 08             	mov    %ebx,0x8(%ebp)
 156:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 159:	5b                   	pop    %ebx
 15a:	5f                   	pop    %edi
 15b:	5d                   	pop    %ebp
 15c:	c3                   	ret    

0000015d <ps>:
#include "user.h"
#include "x86.h"
#include "param.h"
#include "pstat.h"

void ps(){
 15d:	55                   	push   %ebp
 15e:	89 e5                	mov    %esp,%ebp
 160:	57                   	push   %edi
 161:	56                   	push   %esi
 162:	53                   	push   %ebx
 163:	81 ec 2c 09 00 00    	sub    $0x92c,%esp
  
  //pstatTable pst = malloc(NPROC * sizeof(pstat_t));
  pstat_t pst[NPROC];
  getpinfo(&pst);
 169:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 16f:	89 04 24             	mov    %eax,(%esp)
 172:	e8 36 04 00 00       	call   5ad <getpinfo>
  int i;
  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 177:	c7 44 24 04 79 0b 00 	movl   $0xb79,0x4(%esp)
 17e:	00 
 17f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 186:	e8 12 05 00 00       	call   69d <printf>
  for (i = 0; i < NPROC; i++){
 18b:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 192:	e9 1e 01 00 00       	jmp    2b5 <ps+0x158>
    if (pst[i].inuse == 1){
 197:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 19a:	89 d0                	mov    %edx,%eax
 19c:	c1 e0 03             	shl    $0x3,%eax
 19f:	01 d0                	add    %edx,%eax
 1a1:	c1 e0 02             	shl    $0x2,%eax
 1a4:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 1a7:	01 d8                	add    %ebx,%eax
 1a9:	2d 04 09 00 00       	sub    $0x904,%eax
 1ae:	8b 00                	mov    (%eax),%eax
 1b0:	83 f8 01             	cmp    $0x1,%eax
 1b3:	0f 85 f8 00 00 00    	jne    2b1 <ps+0x154>
      printf(1, "%d\t", pst[i].pid);
 1b9:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 1bc:	89 d0                	mov    %edx,%eax
 1be:	c1 e0 03             	shl    $0x3,%eax
 1c1:	01 d0                	add    %edx,%eax
 1c3:	c1 e0 02             	shl    $0x2,%eax
 1c6:	8d 75 e8             	lea    -0x18(%ebp),%esi
 1c9:	01 f0                	add    %esi,%eax
 1cb:	2d fc 08 00 00       	sub    $0x8fc,%eax
 1d0:	8b 00                	mov    (%eax),%eax
 1d2:	89 44 24 08          	mov    %eax,0x8(%esp)
 1d6:	c7 44 24 04 92 0b 00 	movl   $0xb92,0x4(%esp)
 1dd:	00 
 1de:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1e5:	e8 b3 04 00 00       	call   69d <printf>
      printf(1, "%d\t", pst[i].tickets);
 1ea:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 1ed:	89 d0                	mov    %edx,%eax
 1ef:	c1 e0 03             	shl    $0x3,%eax
 1f2:	01 d0                	add    %edx,%eax
 1f4:	c1 e0 02             	shl    $0x2,%eax
 1f7:	8d 7d e8             	lea    -0x18(%ebp),%edi
 1fa:	01 f8                	add    %edi,%eax
 1fc:	2d 00 09 00 00       	sub    $0x900,%eax
 201:	8b 00                	mov    (%eax),%eax
 203:	89 44 24 08          	mov    %eax,0x8(%esp)
 207:	c7 44 24 04 92 0b 00 	movl   $0xb92,0x4(%esp)
 20e:	00 
 20f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 216:	e8 82 04 00 00       	call   69d <printf>
      printf(1, "%d\t", pst[i].ticks);
 21b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 21e:	89 d0                	mov    %edx,%eax
 220:	c1 e0 03             	shl    $0x3,%eax
 223:	01 d0                	add    %edx,%eax
 225:	c1 e0 02             	shl    $0x2,%eax
 228:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 22b:	01 c8                	add    %ecx,%eax
 22d:	2d f8 08 00 00       	sub    $0x8f8,%eax
 232:	8b 00                	mov    (%eax),%eax
 234:	89 44 24 08          	mov    %eax,0x8(%esp)
 238:	c7 44 24 04 92 0b 00 	movl   $0xb92,0x4(%esp)
 23f:	00 
 240:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 247:	e8 51 04 00 00       	call   69d <printf>
      printf(1, "%c\t", pst[i].state);
 24c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 24f:	89 d0                	mov    %edx,%eax
 251:	c1 e0 03             	shl    $0x3,%eax
 254:	01 d0                	add    %edx,%eax
 256:	c1 e0 02             	shl    $0x2,%eax
 259:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 25c:	01 d8                	add    %ebx,%eax
 25e:	2d e4 08 00 00       	sub    $0x8e4,%eax
 263:	0f b6 00             	movzbl (%eax),%eax
 266:	0f be c0             	movsbl %al,%eax
 269:	89 44 24 08          	mov    %eax,0x8(%esp)
 26d:	c7 44 24 04 96 0b 00 	movl   $0xb96,0x4(%esp)
 274:	00 
 275:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 27c:	e8 1c 04 00 00       	call   69d <printf>
      printf(1, "%s\t\n", pst[i].name);
 281:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 287:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 28a:	89 d0                	mov    %edx,%eax
 28c:	c1 e0 03             	shl    $0x3,%eax
 28f:	01 d0                	add    %edx,%eax
 291:	c1 e0 02             	shl    $0x2,%eax
 294:	83 c0 10             	add    $0x10,%eax
 297:	01 c8                	add    %ecx,%eax
 299:	89 44 24 08          	mov    %eax,0x8(%esp)
 29d:	c7 44 24 04 9a 0b 00 	movl   $0xb9a,0x4(%esp)
 2a4:	00 
 2a5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2ac:	e8 ec 03 00 00       	call   69d <printf>
  for (i = 0; i < NPROC; i++){
 2b1:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 2b5:	83 7d e4 3f          	cmpl   $0x3f,-0x1c(%ebp)
 2b9:	0f 8e d8 fe ff ff    	jle    197 <ps+0x3a>
    }
  }
}
 2bf:	81 c4 2c 09 00 00    	add    $0x92c,%esp
 2c5:	5b                   	pop    %ebx
 2c6:	5e                   	pop    %esi
 2c7:	5f                   	pop    %edi
 2c8:	5d                   	pop    %ebp
 2c9:	c3                   	ret    

000002ca <strcpy>:

char*
strcpy(char *s, const char *t)
{
 2ca:	55                   	push   %ebp
 2cb:	89 e5                	mov    %esp,%ebp
 2cd:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 2d0:	8b 45 08             	mov    0x8(%ebp),%eax
 2d3:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 2d6:	90                   	nop
 2d7:	8b 45 08             	mov    0x8(%ebp),%eax
 2da:	8d 50 01             	lea    0x1(%eax),%edx
 2dd:	89 55 08             	mov    %edx,0x8(%ebp)
 2e0:	8b 55 0c             	mov    0xc(%ebp),%edx
 2e3:	8d 4a 01             	lea    0x1(%edx),%ecx
 2e6:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 2e9:	0f b6 12             	movzbl (%edx),%edx
 2ec:	88 10                	mov    %dl,(%eax)
 2ee:	0f b6 00             	movzbl (%eax),%eax
 2f1:	84 c0                	test   %al,%al
 2f3:	75 e2                	jne    2d7 <strcpy+0xd>
    ;
  return os;
 2f5:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 2f8:	c9                   	leave  
 2f9:	c3                   	ret    

000002fa <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2fa:	55                   	push   %ebp
 2fb:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 2fd:	eb 08                	jmp    307 <strcmp+0xd>
    p++, q++;
 2ff:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 303:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 307:	8b 45 08             	mov    0x8(%ebp),%eax
 30a:	0f b6 00             	movzbl (%eax),%eax
 30d:	84 c0                	test   %al,%al
 30f:	74 10                	je     321 <strcmp+0x27>
 311:	8b 45 08             	mov    0x8(%ebp),%eax
 314:	0f b6 10             	movzbl (%eax),%edx
 317:	8b 45 0c             	mov    0xc(%ebp),%eax
 31a:	0f b6 00             	movzbl (%eax),%eax
 31d:	38 c2                	cmp    %al,%dl
 31f:	74 de                	je     2ff <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 321:	8b 45 08             	mov    0x8(%ebp),%eax
 324:	0f b6 00             	movzbl (%eax),%eax
 327:	0f b6 d0             	movzbl %al,%edx
 32a:	8b 45 0c             	mov    0xc(%ebp),%eax
 32d:	0f b6 00             	movzbl (%eax),%eax
 330:	0f b6 c0             	movzbl %al,%eax
 333:	29 c2                	sub    %eax,%edx
 335:	89 d0                	mov    %edx,%eax
}
 337:	5d                   	pop    %ebp
 338:	c3                   	ret    

00000339 <strlen>:

uint
strlen(const char *s)
{
 339:	55                   	push   %ebp
 33a:	89 e5                	mov    %esp,%ebp
 33c:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 33f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 346:	eb 04                	jmp    34c <strlen+0x13>
 348:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 34c:	8b 55 fc             	mov    -0x4(%ebp),%edx
 34f:	8b 45 08             	mov    0x8(%ebp),%eax
 352:	01 d0                	add    %edx,%eax
 354:	0f b6 00             	movzbl (%eax),%eax
 357:	84 c0                	test   %al,%al
 359:	75 ed                	jne    348 <strlen+0xf>
    ;
  return n;
 35b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 35e:	c9                   	leave  
 35f:	c3                   	ret    

00000360 <memset>:

void*
memset(void *dst, int c, uint n)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 366:	8b 45 10             	mov    0x10(%ebp),%eax
 369:	89 44 24 08          	mov    %eax,0x8(%esp)
 36d:	8b 45 0c             	mov    0xc(%ebp),%eax
 370:	89 44 24 04          	mov    %eax,0x4(%esp)
 374:	8b 45 08             	mov    0x8(%ebp),%eax
 377:	89 04 24             	mov    %eax,(%esp)
 37a:	e8 b9 fd ff ff       	call   138 <stosb>
  return dst;
 37f:	8b 45 08             	mov    0x8(%ebp),%eax
}
 382:	c9                   	leave  
 383:	c3                   	ret    

00000384 <strchr>:

char*
strchr(const char *s, char c)
{
 384:	55                   	push   %ebp
 385:	89 e5                	mov    %esp,%ebp
 387:	83 ec 04             	sub    $0x4,%esp
 38a:	8b 45 0c             	mov    0xc(%ebp),%eax
 38d:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 390:	eb 14                	jmp    3a6 <strchr+0x22>
    if(*s == c)
 392:	8b 45 08             	mov    0x8(%ebp),%eax
 395:	0f b6 00             	movzbl (%eax),%eax
 398:	3a 45 fc             	cmp    -0x4(%ebp),%al
 39b:	75 05                	jne    3a2 <strchr+0x1e>
      return (char*)s;
 39d:	8b 45 08             	mov    0x8(%ebp),%eax
 3a0:	eb 13                	jmp    3b5 <strchr+0x31>
  for(; *s; s++)
 3a2:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 3a6:	8b 45 08             	mov    0x8(%ebp),%eax
 3a9:	0f b6 00             	movzbl (%eax),%eax
 3ac:	84 c0                	test   %al,%al
 3ae:	75 e2                	jne    392 <strchr+0xe>
  return 0;
 3b0:	b8 00 00 00 00       	mov    $0x0,%eax
}
 3b5:	c9                   	leave  
 3b6:	c3                   	ret    

000003b7 <gets>:

char*
gets(char *buf, int max)
{
 3b7:	55                   	push   %ebp
 3b8:	89 e5                	mov    %esp,%ebp
 3ba:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3bd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 3c4:	eb 4c                	jmp    412 <gets+0x5b>
    cc = read(0, &c, 1);
 3c6:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3cd:	00 
 3ce:	8d 45 ef             	lea    -0x11(%ebp),%eax
 3d1:	89 44 24 04          	mov    %eax,0x4(%esp)
 3d5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 3dc:	e8 44 01 00 00       	call   525 <read>
 3e1:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 3e4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 3e8:	7f 02                	jg     3ec <gets+0x35>
      break;
 3ea:	eb 31                	jmp    41d <gets+0x66>
    buf[i++] = c;
 3ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3ef:	8d 50 01             	lea    0x1(%eax),%edx
 3f2:	89 55 f4             	mov    %edx,-0xc(%ebp)
 3f5:	89 c2                	mov    %eax,%edx
 3f7:	8b 45 08             	mov    0x8(%ebp),%eax
 3fa:	01 c2                	add    %eax,%edx
 3fc:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 400:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 402:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 406:	3c 0a                	cmp    $0xa,%al
 408:	74 13                	je     41d <gets+0x66>
 40a:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 40e:	3c 0d                	cmp    $0xd,%al
 410:	74 0b                	je     41d <gets+0x66>
  for(i=0; i+1 < max; ){
 412:	8b 45 f4             	mov    -0xc(%ebp),%eax
 415:	83 c0 01             	add    $0x1,%eax
 418:	3b 45 0c             	cmp    0xc(%ebp),%eax
 41b:	7c a9                	jl     3c6 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 41d:	8b 55 f4             	mov    -0xc(%ebp),%edx
 420:	8b 45 08             	mov    0x8(%ebp),%eax
 423:	01 d0                	add    %edx,%eax
 425:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 428:	8b 45 08             	mov    0x8(%ebp),%eax
}
 42b:	c9                   	leave  
 42c:	c3                   	ret    

0000042d <stat>:

int
stat(const char *n, struct stat *st)
{
 42d:	55                   	push   %ebp
 42e:	89 e5                	mov    %esp,%ebp
 430:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 433:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 43a:	00 
 43b:	8b 45 08             	mov    0x8(%ebp),%eax
 43e:	89 04 24             	mov    %eax,(%esp)
 441:	e8 07 01 00 00       	call   54d <open>
 446:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 449:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 44d:	79 07                	jns    456 <stat+0x29>
    return -1;
 44f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 454:	eb 23                	jmp    479 <stat+0x4c>
  r = fstat(fd, st);
 456:	8b 45 0c             	mov    0xc(%ebp),%eax
 459:	89 44 24 04          	mov    %eax,0x4(%esp)
 45d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 460:	89 04 24             	mov    %eax,(%esp)
 463:	e8 fd 00 00 00       	call   565 <fstat>
 468:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 46b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 46e:	89 04 24             	mov    %eax,(%esp)
 471:	e8 bf 00 00 00       	call   535 <close>
  return r;
 476:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 479:	c9                   	leave  
 47a:	c3                   	ret    

0000047b <atoi>:

int
atoi(const char *s)
{
 47b:	55                   	push   %ebp
 47c:	89 e5                	mov    %esp,%ebp
 47e:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 481:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 488:	eb 25                	jmp    4af <atoi+0x34>
    n = n*10 + *s++ - '0';
 48a:	8b 55 fc             	mov    -0x4(%ebp),%edx
 48d:	89 d0                	mov    %edx,%eax
 48f:	c1 e0 02             	shl    $0x2,%eax
 492:	01 d0                	add    %edx,%eax
 494:	01 c0                	add    %eax,%eax
 496:	89 c1                	mov    %eax,%ecx
 498:	8b 45 08             	mov    0x8(%ebp),%eax
 49b:	8d 50 01             	lea    0x1(%eax),%edx
 49e:	89 55 08             	mov    %edx,0x8(%ebp)
 4a1:	0f b6 00             	movzbl (%eax),%eax
 4a4:	0f be c0             	movsbl %al,%eax
 4a7:	01 c8                	add    %ecx,%eax
 4a9:	83 e8 30             	sub    $0x30,%eax
 4ac:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 4af:	8b 45 08             	mov    0x8(%ebp),%eax
 4b2:	0f b6 00             	movzbl (%eax),%eax
 4b5:	3c 2f                	cmp    $0x2f,%al
 4b7:	7e 0a                	jle    4c3 <atoi+0x48>
 4b9:	8b 45 08             	mov    0x8(%ebp),%eax
 4bc:	0f b6 00             	movzbl (%eax),%eax
 4bf:	3c 39                	cmp    $0x39,%al
 4c1:	7e c7                	jle    48a <atoi+0xf>
  return n;
 4c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 4c6:	c9                   	leave  
 4c7:	c3                   	ret    

000004c8 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 4c8:	55                   	push   %ebp
 4c9:	89 e5                	mov    %esp,%ebp
 4cb:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 4ce:	8b 45 08             	mov    0x8(%ebp),%eax
 4d1:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 4d4:	8b 45 0c             	mov    0xc(%ebp),%eax
 4d7:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 4da:	eb 17                	jmp    4f3 <memmove+0x2b>
    *dst++ = *src++;
 4dc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 4df:	8d 50 01             	lea    0x1(%eax),%edx
 4e2:	89 55 fc             	mov    %edx,-0x4(%ebp)
 4e5:	8b 55 f8             	mov    -0x8(%ebp),%edx
 4e8:	8d 4a 01             	lea    0x1(%edx),%ecx
 4eb:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 4ee:	0f b6 12             	movzbl (%edx),%edx
 4f1:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 4f3:	8b 45 10             	mov    0x10(%ebp),%eax
 4f6:	8d 50 ff             	lea    -0x1(%eax),%edx
 4f9:	89 55 10             	mov    %edx,0x10(%ebp)
 4fc:	85 c0                	test   %eax,%eax
 4fe:	7f dc                	jg     4dc <memmove+0x14>
  return vdst;
 500:	8b 45 08             	mov    0x8(%ebp),%eax
}
 503:	c9                   	leave  
 504:	c3                   	ret    

00000505 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 505:	b8 01 00 00 00       	mov    $0x1,%eax
 50a:	cd 40                	int    $0x40
 50c:	c3                   	ret    

0000050d <exit>:
SYSCALL(exit)
 50d:	b8 02 00 00 00       	mov    $0x2,%eax
 512:	cd 40                	int    $0x40
 514:	c3                   	ret    

00000515 <wait>:
SYSCALL(wait)
 515:	b8 03 00 00 00       	mov    $0x3,%eax
 51a:	cd 40                	int    $0x40
 51c:	c3                   	ret    

0000051d <pipe>:
SYSCALL(pipe)
 51d:	b8 04 00 00 00       	mov    $0x4,%eax
 522:	cd 40                	int    $0x40
 524:	c3                   	ret    

00000525 <read>:
SYSCALL(read)
 525:	b8 05 00 00 00       	mov    $0x5,%eax
 52a:	cd 40                	int    $0x40
 52c:	c3                   	ret    

0000052d <write>:
SYSCALL(write)
 52d:	b8 10 00 00 00       	mov    $0x10,%eax
 532:	cd 40                	int    $0x40
 534:	c3                   	ret    

00000535 <close>:
SYSCALL(close)
 535:	b8 15 00 00 00       	mov    $0x15,%eax
 53a:	cd 40                	int    $0x40
 53c:	c3                   	ret    

0000053d <kill>:
SYSCALL(kill)
 53d:	b8 06 00 00 00       	mov    $0x6,%eax
 542:	cd 40                	int    $0x40
 544:	c3                   	ret    

00000545 <exec>:
SYSCALL(exec)
 545:	b8 07 00 00 00       	mov    $0x7,%eax
 54a:	cd 40                	int    $0x40
 54c:	c3                   	ret    

0000054d <open>:
SYSCALL(open)
 54d:	b8 0f 00 00 00       	mov    $0xf,%eax
 552:	cd 40                	int    $0x40
 554:	c3                   	ret    

00000555 <mknod>:
SYSCALL(mknod)
 555:	b8 11 00 00 00       	mov    $0x11,%eax
 55a:	cd 40                	int    $0x40
 55c:	c3                   	ret    

0000055d <unlink>:
SYSCALL(unlink)
 55d:	b8 12 00 00 00       	mov    $0x12,%eax
 562:	cd 40                	int    $0x40
 564:	c3                   	ret    

00000565 <fstat>:
SYSCALL(fstat)
 565:	b8 08 00 00 00       	mov    $0x8,%eax
 56a:	cd 40                	int    $0x40
 56c:	c3                   	ret    

0000056d <link>:
SYSCALL(link)
 56d:	b8 13 00 00 00       	mov    $0x13,%eax
 572:	cd 40                	int    $0x40
 574:	c3                   	ret    

00000575 <mkdir>:
SYSCALL(mkdir)
 575:	b8 14 00 00 00       	mov    $0x14,%eax
 57a:	cd 40                	int    $0x40
 57c:	c3                   	ret    

0000057d <chdir>:
SYSCALL(chdir)
 57d:	b8 09 00 00 00       	mov    $0x9,%eax
 582:	cd 40                	int    $0x40
 584:	c3                   	ret    

00000585 <dup>:
SYSCALL(dup)
 585:	b8 0a 00 00 00       	mov    $0xa,%eax
 58a:	cd 40                	int    $0x40
 58c:	c3                   	ret    

0000058d <getpid>:
SYSCALL(getpid)
 58d:	b8 0b 00 00 00       	mov    $0xb,%eax
 592:	cd 40                	int    $0x40
 594:	c3                   	ret    

00000595 <sbrk>:
SYSCALL(sbrk)
 595:	b8 0c 00 00 00       	mov    $0xc,%eax
 59a:	cd 40                	int    $0x40
 59c:	c3                   	ret    

0000059d <sleep>:
SYSCALL(sleep)
 59d:	b8 0d 00 00 00       	mov    $0xd,%eax
 5a2:	cd 40                	int    $0x40
 5a4:	c3                   	ret    

000005a5 <uptime>:
SYSCALL(uptime)
 5a5:	b8 0e 00 00 00       	mov    $0xe,%eax
 5aa:	cd 40                	int    $0x40
 5ac:	c3                   	ret    

000005ad <getpinfo>:
SYSCALL(getpinfo)
 5ad:	b8 16 00 00 00       	mov    $0x16,%eax
 5b2:	cd 40                	int    $0x40
 5b4:	c3                   	ret    

000005b5 <settickets>:
SYSCALL(settickets)
 5b5:	b8 17 00 00 00       	mov    $0x17,%eax
 5ba:	cd 40                	int    $0x40
 5bc:	c3                   	ret    

000005bd <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5bd:	55                   	push   %ebp
 5be:	89 e5                	mov    %esp,%ebp
 5c0:	83 ec 18             	sub    $0x18,%esp
 5c3:	8b 45 0c             	mov    0xc(%ebp),%eax
 5c6:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 5c9:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5d0:	00 
 5d1:	8d 45 f4             	lea    -0xc(%ebp),%eax
 5d4:	89 44 24 04          	mov    %eax,0x4(%esp)
 5d8:	8b 45 08             	mov    0x8(%ebp),%eax
 5db:	89 04 24             	mov    %eax,(%esp)
 5de:	e8 4a ff ff ff       	call   52d <write>
}
 5e3:	c9                   	leave  
 5e4:	c3                   	ret    

000005e5 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5e5:	55                   	push   %ebp
 5e6:	89 e5                	mov    %esp,%ebp
 5e8:	56                   	push   %esi
 5e9:	53                   	push   %ebx
 5ea:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 5ed:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 5f4:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 5f8:	74 17                	je     611 <printint+0x2c>
 5fa:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 5fe:	79 11                	jns    611 <printint+0x2c>
    neg = 1;
 600:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 607:	8b 45 0c             	mov    0xc(%ebp),%eax
 60a:	f7 d8                	neg    %eax
 60c:	89 45 ec             	mov    %eax,-0x14(%ebp)
 60f:	eb 06                	jmp    617 <printint+0x32>
  } else {
    x = xx;
 611:	8b 45 0c             	mov    0xc(%ebp),%eax
 614:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 617:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 61e:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 621:	8d 41 01             	lea    0x1(%ecx),%eax
 624:	89 45 f4             	mov    %eax,-0xc(%ebp)
 627:	8b 5d 10             	mov    0x10(%ebp),%ebx
 62a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 62d:	ba 00 00 00 00       	mov    $0x0,%edx
 632:	f7 f3                	div    %ebx
 634:	89 d0                	mov    %edx,%eax
 636:	0f b6 80 1c 0e 00 00 	movzbl 0xe1c(%eax),%eax
 63d:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 641:	8b 75 10             	mov    0x10(%ebp),%esi
 644:	8b 45 ec             	mov    -0x14(%ebp),%eax
 647:	ba 00 00 00 00       	mov    $0x0,%edx
 64c:	f7 f6                	div    %esi
 64e:	89 45 ec             	mov    %eax,-0x14(%ebp)
 651:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 655:	75 c7                	jne    61e <printint+0x39>
  if(neg)
 657:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 65b:	74 10                	je     66d <printint+0x88>
    buf[i++] = '-';
 65d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 660:	8d 50 01             	lea    0x1(%eax),%edx
 663:	89 55 f4             	mov    %edx,-0xc(%ebp)
 666:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 66b:	eb 1f                	jmp    68c <printint+0xa7>
 66d:	eb 1d                	jmp    68c <printint+0xa7>
    putc(fd, buf[i]);
 66f:	8d 55 dc             	lea    -0x24(%ebp),%edx
 672:	8b 45 f4             	mov    -0xc(%ebp),%eax
 675:	01 d0                	add    %edx,%eax
 677:	0f b6 00             	movzbl (%eax),%eax
 67a:	0f be c0             	movsbl %al,%eax
 67d:	89 44 24 04          	mov    %eax,0x4(%esp)
 681:	8b 45 08             	mov    0x8(%ebp),%eax
 684:	89 04 24             	mov    %eax,(%esp)
 687:	e8 31 ff ff ff       	call   5bd <putc>
  while(--i >= 0)
 68c:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 690:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 694:	79 d9                	jns    66f <printint+0x8a>
}
 696:	83 c4 30             	add    $0x30,%esp
 699:	5b                   	pop    %ebx
 69a:	5e                   	pop    %esi
 69b:	5d                   	pop    %ebp
 69c:	c3                   	ret    

0000069d <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 69d:	55                   	push   %ebp
 69e:	89 e5                	mov    %esp,%ebp
 6a0:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 6a3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 6aa:	8d 45 0c             	lea    0xc(%ebp),%eax
 6ad:	83 c0 04             	add    $0x4,%eax
 6b0:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 6b3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 6ba:	e9 7c 01 00 00       	jmp    83b <printf+0x19e>
    c = fmt[i] & 0xff;
 6bf:	8b 55 0c             	mov    0xc(%ebp),%edx
 6c2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6c5:	01 d0                	add    %edx,%eax
 6c7:	0f b6 00             	movzbl (%eax),%eax
 6ca:	0f be c0             	movsbl %al,%eax
 6cd:	25 ff 00 00 00       	and    $0xff,%eax
 6d2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 6d5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 6d9:	75 2c                	jne    707 <printf+0x6a>
      if(c == '%'){
 6db:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 6df:	75 0c                	jne    6ed <printf+0x50>
        state = '%';
 6e1:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 6e8:	e9 4a 01 00 00       	jmp    837 <printf+0x19a>
      } else {
        putc(fd, c);
 6ed:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6f0:	0f be c0             	movsbl %al,%eax
 6f3:	89 44 24 04          	mov    %eax,0x4(%esp)
 6f7:	8b 45 08             	mov    0x8(%ebp),%eax
 6fa:	89 04 24             	mov    %eax,(%esp)
 6fd:	e8 bb fe ff ff       	call   5bd <putc>
 702:	e9 30 01 00 00       	jmp    837 <printf+0x19a>
      }
    } else if(state == '%'){
 707:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 70b:	0f 85 26 01 00 00    	jne    837 <printf+0x19a>
      if(c == 'd'){
 711:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 715:	75 2d                	jne    744 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 717:	8b 45 e8             	mov    -0x18(%ebp),%eax
 71a:	8b 00                	mov    (%eax),%eax
 71c:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 723:	00 
 724:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 72b:	00 
 72c:	89 44 24 04          	mov    %eax,0x4(%esp)
 730:	8b 45 08             	mov    0x8(%ebp),%eax
 733:	89 04 24             	mov    %eax,(%esp)
 736:	e8 aa fe ff ff       	call   5e5 <printint>
        ap++;
 73b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 73f:	e9 ec 00 00 00       	jmp    830 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 744:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 748:	74 06                	je     750 <printf+0xb3>
 74a:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 74e:	75 2d                	jne    77d <printf+0xe0>
        printint(fd, *ap, 16, 0);
 750:	8b 45 e8             	mov    -0x18(%ebp),%eax
 753:	8b 00                	mov    (%eax),%eax
 755:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 75c:	00 
 75d:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 764:	00 
 765:	89 44 24 04          	mov    %eax,0x4(%esp)
 769:	8b 45 08             	mov    0x8(%ebp),%eax
 76c:	89 04 24             	mov    %eax,(%esp)
 76f:	e8 71 fe ff ff       	call   5e5 <printint>
        ap++;
 774:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 778:	e9 b3 00 00 00       	jmp    830 <printf+0x193>
      } else if(c == 's'){
 77d:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 781:	75 45                	jne    7c8 <printf+0x12b>
        s = (char*)*ap;
 783:	8b 45 e8             	mov    -0x18(%ebp),%eax
 786:	8b 00                	mov    (%eax),%eax
 788:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 78b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 78f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 793:	75 09                	jne    79e <printf+0x101>
          s = "(null)";
 795:	c7 45 f4 9f 0b 00 00 	movl   $0xb9f,-0xc(%ebp)
        while(*s != 0){
 79c:	eb 1e                	jmp    7bc <printf+0x11f>
 79e:	eb 1c                	jmp    7bc <printf+0x11f>
          putc(fd, *s);
 7a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7a3:	0f b6 00             	movzbl (%eax),%eax
 7a6:	0f be c0             	movsbl %al,%eax
 7a9:	89 44 24 04          	mov    %eax,0x4(%esp)
 7ad:	8b 45 08             	mov    0x8(%ebp),%eax
 7b0:	89 04 24             	mov    %eax,(%esp)
 7b3:	e8 05 fe ff ff       	call   5bd <putc>
          s++;
 7b8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 7bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7bf:	0f b6 00             	movzbl (%eax),%eax
 7c2:	84 c0                	test   %al,%al
 7c4:	75 da                	jne    7a0 <printf+0x103>
 7c6:	eb 68                	jmp    830 <printf+0x193>
        }
      } else if(c == 'c'){
 7c8:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 7cc:	75 1d                	jne    7eb <printf+0x14e>
        putc(fd, *ap);
 7ce:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7d1:	8b 00                	mov    (%eax),%eax
 7d3:	0f be c0             	movsbl %al,%eax
 7d6:	89 44 24 04          	mov    %eax,0x4(%esp)
 7da:	8b 45 08             	mov    0x8(%ebp),%eax
 7dd:	89 04 24             	mov    %eax,(%esp)
 7e0:	e8 d8 fd ff ff       	call   5bd <putc>
        ap++;
 7e5:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7e9:	eb 45                	jmp    830 <printf+0x193>
      } else if(c == '%'){
 7eb:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 7ef:	75 17                	jne    808 <printf+0x16b>
        putc(fd, c);
 7f1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7f4:	0f be c0             	movsbl %al,%eax
 7f7:	89 44 24 04          	mov    %eax,0x4(%esp)
 7fb:	8b 45 08             	mov    0x8(%ebp),%eax
 7fe:	89 04 24             	mov    %eax,(%esp)
 801:	e8 b7 fd ff ff       	call   5bd <putc>
 806:	eb 28                	jmp    830 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 808:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 80f:	00 
 810:	8b 45 08             	mov    0x8(%ebp),%eax
 813:	89 04 24             	mov    %eax,(%esp)
 816:	e8 a2 fd ff ff       	call   5bd <putc>
        putc(fd, c);
 81b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 81e:	0f be c0             	movsbl %al,%eax
 821:	89 44 24 04          	mov    %eax,0x4(%esp)
 825:	8b 45 08             	mov    0x8(%ebp),%eax
 828:	89 04 24             	mov    %eax,(%esp)
 82b:	e8 8d fd ff ff       	call   5bd <putc>
      }
      state = 0;
 830:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 837:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 83b:	8b 55 0c             	mov    0xc(%ebp),%edx
 83e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 841:	01 d0                	add    %edx,%eax
 843:	0f b6 00             	movzbl (%eax),%eax
 846:	84 c0                	test   %al,%al
 848:	0f 85 71 fe ff ff    	jne    6bf <printf+0x22>
    }
  }
}
 84e:	c9                   	leave  
 84f:	c3                   	ret    

00000850 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 850:	55                   	push   %ebp
 851:	89 e5                	mov    %esp,%ebp
 853:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 856:	8b 45 08             	mov    0x8(%ebp),%eax
 859:	83 e8 08             	sub    $0x8,%eax
 85c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 85f:	a1 38 0e 00 00       	mov    0xe38,%eax
 864:	89 45 fc             	mov    %eax,-0x4(%ebp)
 867:	eb 24                	jmp    88d <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 869:	8b 45 fc             	mov    -0x4(%ebp),%eax
 86c:	8b 00                	mov    (%eax),%eax
 86e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 871:	77 12                	ja     885 <free+0x35>
 873:	8b 45 f8             	mov    -0x8(%ebp),%eax
 876:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 879:	77 24                	ja     89f <free+0x4f>
 87b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 87e:	8b 00                	mov    (%eax),%eax
 880:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 883:	77 1a                	ja     89f <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 885:	8b 45 fc             	mov    -0x4(%ebp),%eax
 888:	8b 00                	mov    (%eax),%eax
 88a:	89 45 fc             	mov    %eax,-0x4(%ebp)
 88d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 890:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 893:	76 d4                	jbe    869 <free+0x19>
 895:	8b 45 fc             	mov    -0x4(%ebp),%eax
 898:	8b 00                	mov    (%eax),%eax
 89a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 89d:	76 ca                	jbe    869 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 89f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8a2:	8b 40 04             	mov    0x4(%eax),%eax
 8a5:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 8ac:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8af:	01 c2                	add    %eax,%edx
 8b1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8b4:	8b 00                	mov    (%eax),%eax
 8b6:	39 c2                	cmp    %eax,%edx
 8b8:	75 24                	jne    8de <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 8ba:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8bd:	8b 50 04             	mov    0x4(%eax),%edx
 8c0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8c3:	8b 00                	mov    (%eax),%eax
 8c5:	8b 40 04             	mov    0x4(%eax),%eax
 8c8:	01 c2                	add    %eax,%edx
 8ca:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8cd:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 8d0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8d3:	8b 00                	mov    (%eax),%eax
 8d5:	8b 10                	mov    (%eax),%edx
 8d7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8da:	89 10                	mov    %edx,(%eax)
 8dc:	eb 0a                	jmp    8e8 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 8de:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8e1:	8b 10                	mov    (%eax),%edx
 8e3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8e6:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 8e8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8eb:	8b 40 04             	mov    0x4(%eax),%eax
 8ee:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 8f5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8f8:	01 d0                	add    %edx,%eax
 8fa:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8fd:	75 20                	jne    91f <free+0xcf>
    p->s.size += bp->s.size;
 8ff:	8b 45 fc             	mov    -0x4(%ebp),%eax
 902:	8b 50 04             	mov    0x4(%eax),%edx
 905:	8b 45 f8             	mov    -0x8(%ebp),%eax
 908:	8b 40 04             	mov    0x4(%eax),%eax
 90b:	01 c2                	add    %eax,%edx
 90d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 910:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 913:	8b 45 f8             	mov    -0x8(%ebp),%eax
 916:	8b 10                	mov    (%eax),%edx
 918:	8b 45 fc             	mov    -0x4(%ebp),%eax
 91b:	89 10                	mov    %edx,(%eax)
 91d:	eb 08                	jmp    927 <free+0xd7>
  } else
    p->s.ptr = bp;
 91f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 922:	8b 55 f8             	mov    -0x8(%ebp),%edx
 925:	89 10                	mov    %edx,(%eax)
  freep = p;
 927:	8b 45 fc             	mov    -0x4(%ebp),%eax
 92a:	a3 38 0e 00 00       	mov    %eax,0xe38
}
 92f:	c9                   	leave  
 930:	c3                   	ret    

00000931 <morecore>:

static Header*
morecore(uint nu)
{
 931:	55                   	push   %ebp
 932:	89 e5                	mov    %esp,%ebp
 934:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 937:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 93e:	77 07                	ja     947 <morecore+0x16>
    nu = 4096;
 940:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 947:	8b 45 08             	mov    0x8(%ebp),%eax
 94a:	c1 e0 03             	shl    $0x3,%eax
 94d:	89 04 24             	mov    %eax,(%esp)
 950:	e8 40 fc ff ff       	call   595 <sbrk>
 955:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 958:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 95c:	75 07                	jne    965 <morecore+0x34>
    return 0;
 95e:	b8 00 00 00 00       	mov    $0x0,%eax
 963:	eb 22                	jmp    987 <morecore+0x56>
  hp = (Header*)p;
 965:	8b 45 f4             	mov    -0xc(%ebp),%eax
 968:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 96b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 96e:	8b 55 08             	mov    0x8(%ebp),%edx
 971:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 974:	8b 45 f0             	mov    -0x10(%ebp),%eax
 977:	83 c0 08             	add    $0x8,%eax
 97a:	89 04 24             	mov    %eax,(%esp)
 97d:	e8 ce fe ff ff       	call   850 <free>
  return freep;
 982:	a1 38 0e 00 00       	mov    0xe38,%eax
}
 987:	c9                   	leave  
 988:	c3                   	ret    

00000989 <malloc>:

void*
malloc(uint nbytes)
{
 989:	55                   	push   %ebp
 98a:	89 e5                	mov    %esp,%ebp
 98c:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 98f:	8b 45 08             	mov    0x8(%ebp),%eax
 992:	83 c0 07             	add    $0x7,%eax
 995:	c1 e8 03             	shr    $0x3,%eax
 998:	83 c0 01             	add    $0x1,%eax
 99b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 99e:	a1 38 0e 00 00       	mov    0xe38,%eax
 9a3:	89 45 f0             	mov    %eax,-0x10(%ebp)
 9a6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 9aa:	75 23                	jne    9cf <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 9ac:	c7 45 f0 30 0e 00 00 	movl   $0xe30,-0x10(%ebp)
 9b3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9b6:	a3 38 0e 00 00       	mov    %eax,0xe38
 9bb:	a1 38 0e 00 00       	mov    0xe38,%eax
 9c0:	a3 30 0e 00 00       	mov    %eax,0xe30
    base.s.size = 0;
 9c5:	c7 05 34 0e 00 00 00 	movl   $0x0,0xe34
 9cc:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9cf:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9d2:	8b 00                	mov    (%eax),%eax
 9d4:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 9d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9da:	8b 40 04             	mov    0x4(%eax),%eax
 9dd:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 9e0:	72 4d                	jb     a2f <malloc+0xa6>
      if(p->s.size == nunits)
 9e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9e5:	8b 40 04             	mov    0x4(%eax),%eax
 9e8:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 9eb:	75 0c                	jne    9f9 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 9ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9f0:	8b 10                	mov    (%eax),%edx
 9f2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9f5:	89 10                	mov    %edx,(%eax)
 9f7:	eb 26                	jmp    a1f <malloc+0x96>
      else {
        p->s.size -= nunits;
 9f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9fc:	8b 40 04             	mov    0x4(%eax),%eax
 9ff:	2b 45 ec             	sub    -0x14(%ebp),%eax
 a02:	89 c2                	mov    %eax,%edx
 a04:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a07:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a0a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a0d:	8b 40 04             	mov    0x4(%eax),%eax
 a10:	c1 e0 03             	shl    $0x3,%eax
 a13:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 a16:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a19:	8b 55 ec             	mov    -0x14(%ebp),%edx
 a1c:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 a1f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a22:	a3 38 0e 00 00       	mov    %eax,0xe38
      return (void*)(p + 1);
 a27:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a2a:	83 c0 08             	add    $0x8,%eax
 a2d:	eb 38                	jmp    a67 <malloc+0xde>
    }
    if(p == freep)
 a2f:	a1 38 0e 00 00       	mov    0xe38,%eax
 a34:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 a37:	75 1b                	jne    a54 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 a39:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a3c:	89 04 24             	mov    %eax,(%esp)
 a3f:	e8 ed fe ff ff       	call   931 <morecore>
 a44:	89 45 f4             	mov    %eax,-0xc(%ebp)
 a47:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 a4b:	75 07                	jne    a54 <malloc+0xcb>
        return 0;
 a4d:	b8 00 00 00 00       	mov    $0x0,%eax
 a52:	eb 13                	jmp    a67 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a54:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a57:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a5a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a5d:	8b 00                	mov    (%eax),%eax
 a5f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 a62:	e9 70 ff ff ff       	jmp    9d7 <malloc+0x4e>
}
 a67:	c9                   	leave  
 a68:	c3                   	ret    
