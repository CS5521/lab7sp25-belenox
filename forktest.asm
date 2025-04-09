
_forktest:     file format elf32-i386


Disassembly of section .text:

00000000 <printf>:

#define N  1000

void
printf(int fd, const char *s, ...)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 18             	sub    $0x18,%esp
  write(fd, s, strlen(s));
   6:	8b 45 0c             	mov    0xc(%ebp),%eax
   9:	89 04 24             	mov    %eax,(%esp)
   c:	e8 05 03 00 00       	call   316 <strlen>
  11:	89 44 24 08          	mov    %eax,0x8(%esp)
  15:	8b 45 0c             	mov    0xc(%ebp),%eax
  18:	89 44 24 04          	mov    %eax,0x4(%esp)
  1c:	8b 45 08             	mov    0x8(%ebp),%eax
  1f:	89 04 24             	mov    %eax,(%esp)
  22:	e8 e3 04 00 00       	call   50a <write>
}
  27:	c9                   	leave  
  28:	c3                   	ret    

00000029 <forktest>:

void
forktest(void)
{
  29:	55                   	push   %ebp
  2a:	89 e5                	mov    %esp,%ebp
  2c:	83 ec 28             	sub    $0x28,%esp
  int n, pid;

  printf(1, "fork test\n");
  2f:	c7 44 24 04 9c 05 00 	movl   $0x59c,0x4(%esp)
  36:	00 
  37:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  3e:	e8 bd ff ff ff       	call   0 <printf>

  for(n=0; n<N; n++){
  43:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  4a:	eb 1f                	jmp    6b <forktest+0x42>
    pid = fork();
  4c:	e8 91 04 00 00       	call   4e2 <fork>
  51:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(pid < 0)
  54:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  58:	79 02                	jns    5c <forktest+0x33>
      break;
  5a:	eb 18                	jmp    74 <forktest+0x4b>
    if(pid == 0)
  5c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  60:	75 05                	jne    67 <forktest+0x3e>
      exit();
  62:	e8 83 04 00 00       	call   4ea <exit>
  for(n=0; n<N; n++){
  67:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  6b:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
  72:	7e d8                	jle    4c <forktest+0x23>
  }

  if(n == N){
  74:	81 7d f4 e8 03 00 00 	cmpl   $0x3e8,-0xc(%ebp)
  7b:	75 21                	jne    9e <forktest+0x75>
    printf(1, "fork claimed to work N times!\n", N);
  7d:	c7 44 24 08 e8 03 00 	movl   $0x3e8,0x8(%esp)
  84:	00 
  85:	c7 44 24 04 a8 05 00 	movl   $0x5a8,0x4(%esp)
  8c:	00 
  8d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  94:	e8 67 ff ff ff       	call   0 <printf>
    exit();
  99:	e8 4c 04 00 00       	call   4ea <exit>
  }

  for(; n > 0; n--){
  9e:	eb 26                	jmp    c6 <forktest+0x9d>
    if(wait() < 0){
  a0:	e8 4d 04 00 00       	call   4f2 <wait>
  a5:	85 c0                	test   %eax,%eax
  a7:	79 19                	jns    c2 <forktest+0x99>
      printf(1, "wait stopped early\n");
  a9:	c7 44 24 04 c7 05 00 	movl   $0x5c7,0x4(%esp)
  b0:	00 
  b1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  b8:	e8 43 ff ff ff       	call   0 <printf>
      exit();
  bd:	e8 28 04 00 00       	call   4ea <exit>
  for(; n > 0; n--){
  c2:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  c6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  ca:	7f d4                	jg     a0 <forktest+0x77>
    }
  }

  if(wait() != -1){
  cc:	e8 21 04 00 00       	call   4f2 <wait>
  d1:	83 f8 ff             	cmp    $0xffffffff,%eax
  d4:	74 19                	je     ef <forktest+0xc6>
    printf(1, "wait got too many\n");
  d6:	c7 44 24 04 db 05 00 	movl   $0x5db,0x4(%esp)
  dd:	00 
  de:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  e5:	e8 16 ff ff ff       	call   0 <printf>
    exit();
  ea:	e8 fb 03 00 00       	call   4ea <exit>
  }

  printf(1, "fork test OK\n");
  ef:	c7 44 24 04 ee 05 00 	movl   $0x5ee,0x4(%esp)
  f6:	00 
  f7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  fe:	e8 fd fe ff ff       	call   0 <printf>
}
 103:	c9                   	leave  
 104:	c3                   	ret    

00000105 <main>:

int
main(void)
{
 105:	55                   	push   %ebp
 106:	89 e5                	mov    %esp,%ebp
 108:	83 e4 f0             	and    $0xfffffff0,%esp
  forktest();
 10b:	e8 19 ff ff ff       	call   29 <forktest>
  exit();
 110:	e8 d5 03 00 00       	call   4ea <exit>

00000115 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 115:	55                   	push   %ebp
 116:	89 e5                	mov    %esp,%ebp
 118:	57                   	push   %edi
 119:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 11a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 11d:	8b 55 10             	mov    0x10(%ebp),%edx
 120:	8b 45 0c             	mov    0xc(%ebp),%eax
 123:	89 cb                	mov    %ecx,%ebx
 125:	89 df                	mov    %ebx,%edi
 127:	89 d1                	mov    %edx,%ecx
 129:	fc                   	cld    
 12a:	f3 aa                	rep stos %al,%es:(%edi)
 12c:	89 ca                	mov    %ecx,%edx
 12e:	89 fb                	mov    %edi,%ebx
 130:	89 5d 08             	mov    %ebx,0x8(%ebp)
 133:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 136:	5b                   	pop    %ebx
 137:	5f                   	pop    %edi
 138:	5d                   	pop    %ebp
 139:	c3                   	ret    

0000013a <ps>:
#include "user.h"
#include "x86.h"
#include "param.h"
#include "pstat.h"

void ps(){
 13a:	55                   	push   %ebp
 13b:	89 e5                	mov    %esp,%ebp
 13d:	57                   	push   %edi
 13e:	56                   	push   %esi
 13f:	53                   	push   %ebx
 140:	81 ec 2c 09 00 00    	sub    $0x92c,%esp
  
  //pstatTable pst = malloc(NPROC * sizeof(pstat_t));
  pstat_t pst[NPROC];
  getpinfo(&pst);
 146:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 14c:	89 04 24             	mov    %eax,(%esp)
 14f:	e8 36 04 00 00       	call   58a <getpinfo>
  int i;
  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 154:	c7 44 24 04 fc 05 00 	movl   $0x5fc,0x4(%esp)
 15b:	00 
 15c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 163:	e8 98 fe ff ff       	call   0 <printf>
  for (i = 0; i < NPROC; i++){
 168:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 16f:	e9 1e 01 00 00       	jmp    292 <ps+0x158>
    if (pst[i].inuse == 1){
 174:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 177:	89 d0                	mov    %edx,%eax
 179:	c1 e0 03             	shl    $0x3,%eax
 17c:	01 d0                	add    %edx,%eax
 17e:	c1 e0 02             	shl    $0x2,%eax
 181:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 184:	01 d8                	add    %ebx,%eax
 186:	2d 04 09 00 00       	sub    $0x904,%eax
 18b:	8b 00                	mov    (%eax),%eax
 18d:	83 f8 01             	cmp    $0x1,%eax
 190:	0f 85 f8 00 00 00    	jne    28e <ps+0x154>
      printf(1, "%d\t", pst[i].pid);
 196:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 199:	89 d0                	mov    %edx,%eax
 19b:	c1 e0 03             	shl    $0x3,%eax
 19e:	01 d0                	add    %edx,%eax
 1a0:	c1 e0 02             	shl    $0x2,%eax
 1a3:	8d 75 e8             	lea    -0x18(%ebp),%esi
 1a6:	01 f0                	add    %esi,%eax
 1a8:	2d fc 08 00 00       	sub    $0x8fc,%eax
 1ad:	8b 00                	mov    (%eax),%eax
 1af:	89 44 24 08          	mov    %eax,0x8(%esp)
 1b3:	c7 44 24 04 15 06 00 	movl   $0x615,0x4(%esp)
 1ba:	00 
 1bb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1c2:	e8 39 fe ff ff       	call   0 <printf>
      printf(1, "%d\t", pst[i].tickets);
 1c7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 1ca:	89 d0                	mov    %edx,%eax
 1cc:	c1 e0 03             	shl    $0x3,%eax
 1cf:	01 d0                	add    %edx,%eax
 1d1:	c1 e0 02             	shl    $0x2,%eax
 1d4:	8d 7d e8             	lea    -0x18(%ebp),%edi
 1d7:	01 f8                	add    %edi,%eax
 1d9:	2d 00 09 00 00       	sub    $0x900,%eax
 1de:	8b 00                	mov    (%eax),%eax
 1e0:	89 44 24 08          	mov    %eax,0x8(%esp)
 1e4:	c7 44 24 04 15 06 00 	movl   $0x615,0x4(%esp)
 1eb:	00 
 1ec:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1f3:	e8 08 fe ff ff       	call   0 <printf>
      printf(1, "%d\t", pst[i].ticks);
 1f8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 1fb:	89 d0                	mov    %edx,%eax
 1fd:	c1 e0 03             	shl    $0x3,%eax
 200:	01 d0                	add    %edx,%eax
 202:	c1 e0 02             	shl    $0x2,%eax
 205:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 208:	01 c8                	add    %ecx,%eax
 20a:	2d f8 08 00 00       	sub    $0x8f8,%eax
 20f:	8b 00                	mov    (%eax),%eax
 211:	89 44 24 08          	mov    %eax,0x8(%esp)
 215:	c7 44 24 04 15 06 00 	movl   $0x615,0x4(%esp)
 21c:	00 
 21d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 224:	e8 d7 fd ff ff       	call   0 <printf>
      printf(1, "%c\t", pst[i].state);
 229:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 22c:	89 d0                	mov    %edx,%eax
 22e:	c1 e0 03             	shl    $0x3,%eax
 231:	01 d0                	add    %edx,%eax
 233:	c1 e0 02             	shl    $0x2,%eax
 236:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 239:	01 d8                	add    %ebx,%eax
 23b:	2d e4 08 00 00       	sub    $0x8e4,%eax
 240:	0f b6 00             	movzbl (%eax),%eax
 243:	0f be c0             	movsbl %al,%eax
 246:	89 44 24 08          	mov    %eax,0x8(%esp)
 24a:	c7 44 24 04 19 06 00 	movl   $0x619,0x4(%esp)
 251:	00 
 252:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 259:	e8 a2 fd ff ff       	call   0 <printf>
      printf(1, "%s\t\n", pst[i].name);
 25e:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 264:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 267:	89 d0                	mov    %edx,%eax
 269:	c1 e0 03             	shl    $0x3,%eax
 26c:	01 d0                	add    %edx,%eax
 26e:	c1 e0 02             	shl    $0x2,%eax
 271:	83 c0 10             	add    $0x10,%eax
 274:	01 c8                	add    %ecx,%eax
 276:	89 44 24 08          	mov    %eax,0x8(%esp)
 27a:	c7 44 24 04 1d 06 00 	movl   $0x61d,0x4(%esp)
 281:	00 
 282:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 289:	e8 72 fd ff ff       	call   0 <printf>
  for (i = 0; i < NPROC; i++){
 28e:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 292:	83 7d e4 3f          	cmpl   $0x3f,-0x1c(%ebp)
 296:	0f 8e d8 fe ff ff    	jle    174 <ps+0x3a>
    }
  }
}
 29c:	81 c4 2c 09 00 00    	add    $0x92c,%esp
 2a2:	5b                   	pop    %ebx
 2a3:	5e                   	pop    %esi
 2a4:	5f                   	pop    %edi
 2a5:	5d                   	pop    %ebp
 2a6:	c3                   	ret    

000002a7 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 2a7:	55                   	push   %ebp
 2a8:	89 e5                	mov    %esp,%ebp
 2aa:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 2ad:	8b 45 08             	mov    0x8(%ebp),%eax
 2b0:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 2b3:	90                   	nop
 2b4:	8b 45 08             	mov    0x8(%ebp),%eax
 2b7:	8d 50 01             	lea    0x1(%eax),%edx
 2ba:	89 55 08             	mov    %edx,0x8(%ebp)
 2bd:	8b 55 0c             	mov    0xc(%ebp),%edx
 2c0:	8d 4a 01             	lea    0x1(%edx),%ecx
 2c3:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 2c6:	0f b6 12             	movzbl (%edx),%edx
 2c9:	88 10                	mov    %dl,(%eax)
 2cb:	0f b6 00             	movzbl (%eax),%eax
 2ce:	84 c0                	test   %al,%al
 2d0:	75 e2                	jne    2b4 <strcpy+0xd>
    ;
  return os;
 2d2:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 2d5:	c9                   	leave  
 2d6:	c3                   	ret    

000002d7 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2d7:	55                   	push   %ebp
 2d8:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 2da:	eb 08                	jmp    2e4 <strcmp+0xd>
    p++, q++;
 2dc:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2e0:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 2e4:	8b 45 08             	mov    0x8(%ebp),%eax
 2e7:	0f b6 00             	movzbl (%eax),%eax
 2ea:	84 c0                	test   %al,%al
 2ec:	74 10                	je     2fe <strcmp+0x27>
 2ee:	8b 45 08             	mov    0x8(%ebp),%eax
 2f1:	0f b6 10             	movzbl (%eax),%edx
 2f4:	8b 45 0c             	mov    0xc(%ebp),%eax
 2f7:	0f b6 00             	movzbl (%eax),%eax
 2fa:	38 c2                	cmp    %al,%dl
 2fc:	74 de                	je     2dc <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 2fe:	8b 45 08             	mov    0x8(%ebp),%eax
 301:	0f b6 00             	movzbl (%eax),%eax
 304:	0f b6 d0             	movzbl %al,%edx
 307:	8b 45 0c             	mov    0xc(%ebp),%eax
 30a:	0f b6 00             	movzbl (%eax),%eax
 30d:	0f b6 c0             	movzbl %al,%eax
 310:	29 c2                	sub    %eax,%edx
 312:	89 d0                	mov    %edx,%eax
}
 314:	5d                   	pop    %ebp
 315:	c3                   	ret    

00000316 <strlen>:

uint
strlen(const char *s)
{
 316:	55                   	push   %ebp
 317:	89 e5                	mov    %esp,%ebp
 319:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 31c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 323:	eb 04                	jmp    329 <strlen+0x13>
 325:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 329:	8b 55 fc             	mov    -0x4(%ebp),%edx
 32c:	8b 45 08             	mov    0x8(%ebp),%eax
 32f:	01 d0                	add    %edx,%eax
 331:	0f b6 00             	movzbl (%eax),%eax
 334:	84 c0                	test   %al,%al
 336:	75 ed                	jne    325 <strlen+0xf>
    ;
  return n;
 338:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 33b:	c9                   	leave  
 33c:	c3                   	ret    

0000033d <memset>:

void*
memset(void *dst, int c, uint n)
{
 33d:	55                   	push   %ebp
 33e:	89 e5                	mov    %esp,%ebp
 340:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 343:	8b 45 10             	mov    0x10(%ebp),%eax
 346:	89 44 24 08          	mov    %eax,0x8(%esp)
 34a:	8b 45 0c             	mov    0xc(%ebp),%eax
 34d:	89 44 24 04          	mov    %eax,0x4(%esp)
 351:	8b 45 08             	mov    0x8(%ebp),%eax
 354:	89 04 24             	mov    %eax,(%esp)
 357:	e8 b9 fd ff ff       	call   115 <stosb>
  return dst;
 35c:	8b 45 08             	mov    0x8(%ebp),%eax
}
 35f:	c9                   	leave  
 360:	c3                   	ret    

00000361 <strchr>:

char*
strchr(const char *s, char c)
{
 361:	55                   	push   %ebp
 362:	89 e5                	mov    %esp,%ebp
 364:	83 ec 04             	sub    $0x4,%esp
 367:	8b 45 0c             	mov    0xc(%ebp),%eax
 36a:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 36d:	eb 14                	jmp    383 <strchr+0x22>
    if(*s == c)
 36f:	8b 45 08             	mov    0x8(%ebp),%eax
 372:	0f b6 00             	movzbl (%eax),%eax
 375:	3a 45 fc             	cmp    -0x4(%ebp),%al
 378:	75 05                	jne    37f <strchr+0x1e>
      return (char*)s;
 37a:	8b 45 08             	mov    0x8(%ebp),%eax
 37d:	eb 13                	jmp    392 <strchr+0x31>
  for(; *s; s++)
 37f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 383:	8b 45 08             	mov    0x8(%ebp),%eax
 386:	0f b6 00             	movzbl (%eax),%eax
 389:	84 c0                	test   %al,%al
 38b:	75 e2                	jne    36f <strchr+0xe>
  return 0;
 38d:	b8 00 00 00 00       	mov    $0x0,%eax
}
 392:	c9                   	leave  
 393:	c3                   	ret    

00000394 <gets>:

char*
gets(char *buf, int max)
{
 394:	55                   	push   %ebp
 395:	89 e5                	mov    %esp,%ebp
 397:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 39a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 3a1:	eb 4c                	jmp    3ef <gets+0x5b>
    cc = read(0, &c, 1);
 3a3:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3aa:	00 
 3ab:	8d 45 ef             	lea    -0x11(%ebp),%eax
 3ae:	89 44 24 04          	mov    %eax,0x4(%esp)
 3b2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 3b9:	e8 44 01 00 00       	call   502 <read>
 3be:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 3c1:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 3c5:	7f 02                	jg     3c9 <gets+0x35>
      break;
 3c7:	eb 31                	jmp    3fa <gets+0x66>
    buf[i++] = c;
 3c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3cc:	8d 50 01             	lea    0x1(%eax),%edx
 3cf:	89 55 f4             	mov    %edx,-0xc(%ebp)
 3d2:	89 c2                	mov    %eax,%edx
 3d4:	8b 45 08             	mov    0x8(%ebp),%eax
 3d7:	01 c2                	add    %eax,%edx
 3d9:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 3dd:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 3df:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 3e3:	3c 0a                	cmp    $0xa,%al
 3e5:	74 13                	je     3fa <gets+0x66>
 3e7:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 3eb:	3c 0d                	cmp    $0xd,%al
 3ed:	74 0b                	je     3fa <gets+0x66>
  for(i=0; i+1 < max; ){
 3ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3f2:	83 c0 01             	add    $0x1,%eax
 3f5:	3b 45 0c             	cmp    0xc(%ebp),%eax
 3f8:	7c a9                	jl     3a3 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 3fa:	8b 55 f4             	mov    -0xc(%ebp),%edx
 3fd:	8b 45 08             	mov    0x8(%ebp),%eax
 400:	01 d0                	add    %edx,%eax
 402:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 405:	8b 45 08             	mov    0x8(%ebp),%eax
}
 408:	c9                   	leave  
 409:	c3                   	ret    

0000040a <stat>:

int
stat(const char *n, struct stat *st)
{
 40a:	55                   	push   %ebp
 40b:	89 e5                	mov    %esp,%ebp
 40d:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 410:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 417:	00 
 418:	8b 45 08             	mov    0x8(%ebp),%eax
 41b:	89 04 24             	mov    %eax,(%esp)
 41e:	e8 07 01 00 00       	call   52a <open>
 423:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 426:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 42a:	79 07                	jns    433 <stat+0x29>
    return -1;
 42c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 431:	eb 23                	jmp    456 <stat+0x4c>
  r = fstat(fd, st);
 433:	8b 45 0c             	mov    0xc(%ebp),%eax
 436:	89 44 24 04          	mov    %eax,0x4(%esp)
 43a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 43d:	89 04 24             	mov    %eax,(%esp)
 440:	e8 fd 00 00 00       	call   542 <fstat>
 445:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 448:	8b 45 f4             	mov    -0xc(%ebp),%eax
 44b:	89 04 24             	mov    %eax,(%esp)
 44e:	e8 bf 00 00 00       	call   512 <close>
  return r;
 453:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 456:	c9                   	leave  
 457:	c3                   	ret    

00000458 <atoi>:

int
atoi(const char *s)
{
 458:	55                   	push   %ebp
 459:	89 e5                	mov    %esp,%ebp
 45b:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 45e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 465:	eb 25                	jmp    48c <atoi+0x34>
    n = n*10 + *s++ - '0';
 467:	8b 55 fc             	mov    -0x4(%ebp),%edx
 46a:	89 d0                	mov    %edx,%eax
 46c:	c1 e0 02             	shl    $0x2,%eax
 46f:	01 d0                	add    %edx,%eax
 471:	01 c0                	add    %eax,%eax
 473:	89 c1                	mov    %eax,%ecx
 475:	8b 45 08             	mov    0x8(%ebp),%eax
 478:	8d 50 01             	lea    0x1(%eax),%edx
 47b:	89 55 08             	mov    %edx,0x8(%ebp)
 47e:	0f b6 00             	movzbl (%eax),%eax
 481:	0f be c0             	movsbl %al,%eax
 484:	01 c8                	add    %ecx,%eax
 486:	83 e8 30             	sub    $0x30,%eax
 489:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 48c:	8b 45 08             	mov    0x8(%ebp),%eax
 48f:	0f b6 00             	movzbl (%eax),%eax
 492:	3c 2f                	cmp    $0x2f,%al
 494:	7e 0a                	jle    4a0 <atoi+0x48>
 496:	8b 45 08             	mov    0x8(%ebp),%eax
 499:	0f b6 00             	movzbl (%eax),%eax
 49c:	3c 39                	cmp    $0x39,%al
 49e:	7e c7                	jle    467 <atoi+0xf>
  return n;
 4a0:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 4a3:	c9                   	leave  
 4a4:	c3                   	ret    

000004a5 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 4a5:	55                   	push   %ebp
 4a6:	89 e5                	mov    %esp,%ebp
 4a8:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 4ab:	8b 45 08             	mov    0x8(%ebp),%eax
 4ae:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 4b1:	8b 45 0c             	mov    0xc(%ebp),%eax
 4b4:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 4b7:	eb 17                	jmp    4d0 <memmove+0x2b>
    *dst++ = *src++;
 4b9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 4bc:	8d 50 01             	lea    0x1(%eax),%edx
 4bf:	89 55 fc             	mov    %edx,-0x4(%ebp)
 4c2:	8b 55 f8             	mov    -0x8(%ebp),%edx
 4c5:	8d 4a 01             	lea    0x1(%edx),%ecx
 4c8:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 4cb:	0f b6 12             	movzbl (%edx),%edx
 4ce:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 4d0:	8b 45 10             	mov    0x10(%ebp),%eax
 4d3:	8d 50 ff             	lea    -0x1(%eax),%edx
 4d6:	89 55 10             	mov    %edx,0x10(%ebp)
 4d9:	85 c0                	test   %eax,%eax
 4db:	7f dc                	jg     4b9 <memmove+0x14>
  return vdst;
 4dd:	8b 45 08             	mov    0x8(%ebp),%eax
}
 4e0:	c9                   	leave  
 4e1:	c3                   	ret    

000004e2 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4e2:	b8 01 00 00 00       	mov    $0x1,%eax
 4e7:	cd 40                	int    $0x40
 4e9:	c3                   	ret    

000004ea <exit>:
SYSCALL(exit)
 4ea:	b8 02 00 00 00       	mov    $0x2,%eax
 4ef:	cd 40                	int    $0x40
 4f1:	c3                   	ret    

000004f2 <wait>:
SYSCALL(wait)
 4f2:	b8 03 00 00 00       	mov    $0x3,%eax
 4f7:	cd 40                	int    $0x40
 4f9:	c3                   	ret    

000004fa <pipe>:
SYSCALL(pipe)
 4fa:	b8 04 00 00 00       	mov    $0x4,%eax
 4ff:	cd 40                	int    $0x40
 501:	c3                   	ret    

00000502 <read>:
SYSCALL(read)
 502:	b8 05 00 00 00       	mov    $0x5,%eax
 507:	cd 40                	int    $0x40
 509:	c3                   	ret    

0000050a <write>:
SYSCALL(write)
 50a:	b8 10 00 00 00       	mov    $0x10,%eax
 50f:	cd 40                	int    $0x40
 511:	c3                   	ret    

00000512 <close>:
SYSCALL(close)
 512:	b8 15 00 00 00       	mov    $0x15,%eax
 517:	cd 40                	int    $0x40
 519:	c3                   	ret    

0000051a <kill>:
SYSCALL(kill)
 51a:	b8 06 00 00 00       	mov    $0x6,%eax
 51f:	cd 40                	int    $0x40
 521:	c3                   	ret    

00000522 <exec>:
SYSCALL(exec)
 522:	b8 07 00 00 00       	mov    $0x7,%eax
 527:	cd 40                	int    $0x40
 529:	c3                   	ret    

0000052a <open>:
SYSCALL(open)
 52a:	b8 0f 00 00 00       	mov    $0xf,%eax
 52f:	cd 40                	int    $0x40
 531:	c3                   	ret    

00000532 <mknod>:
SYSCALL(mknod)
 532:	b8 11 00 00 00       	mov    $0x11,%eax
 537:	cd 40                	int    $0x40
 539:	c3                   	ret    

0000053a <unlink>:
SYSCALL(unlink)
 53a:	b8 12 00 00 00       	mov    $0x12,%eax
 53f:	cd 40                	int    $0x40
 541:	c3                   	ret    

00000542 <fstat>:
SYSCALL(fstat)
 542:	b8 08 00 00 00       	mov    $0x8,%eax
 547:	cd 40                	int    $0x40
 549:	c3                   	ret    

0000054a <link>:
SYSCALL(link)
 54a:	b8 13 00 00 00       	mov    $0x13,%eax
 54f:	cd 40                	int    $0x40
 551:	c3                   	ret    

00000552 <mkdir>:
SYSCALL(mkdir)
 552:	b8 14 00 00 00       	mov    $0x14,%eax
 557:	cd 40                	int    $0x40
 559:	c3                   	ret    

0000055a <chdir>:
SYSCALL(chdir)
 55a:	b8 09 00 00 00       	mov    $0x9,%eax
 55f:	cd 40                	int    $0x40
 561:	c3                   	ret    

00000562 <dup>:
SYSCALL(dup)
 562:	b8 0a 00 00 00       	mov    $0xa,%eax
 567:	cd 40                	int    $0x40
 569:	c3                   	ret    

0000056a <getpid>:
SYSCALL(getpid)
 56a:	b8 0b 00 00 00       	mov    $0xb,%eax
 56f:	cd 40                	int    $0x40
 571:	c3                   	ret    

00000572 <sbrk>:
SYSCALL(sbrk)
 572:	b8 0c 00 00 00       	mov    $0xc,%eax
 577:	cd 40                	int    $0x40
 579:	c3                   	ret    

0000057a <sleep>:
SYSCALL(sleep)
 57a:	b8 0d 00 00 00       	mov    $0xd,%eax
 57f:	cd 40                	int    $0x40
 581:	c3                   	ret    

00000582 <uptime>:
SYSCALL(uptime)
 582:	b8 0e 00 00 00       	mov    $0xe,%eax
 587:	cd 40                	int    $0x40
 589:	c3                   	ret    

0000058a <getpinfo>:
SYSCALL(getpinfo)
 58a:	b8 16 00 00 00       	mov    $0x16,%eax
 58f:	cd 40                	int    $0x40
 591:	c3                   	ret    

00000592 <settickets>:
SYSCALL(settickets)
 592:	b8 17 00 00 00       	mov    $0x17,%eax
 597:	cd 40                	int    $0x40
 599:	c3                   	ret    
