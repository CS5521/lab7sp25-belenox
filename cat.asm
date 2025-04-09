
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <cat>:

char buf[512];

void
cat(int fd)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 28             	sub    $0x28,%esp
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0) {
   6:	eb 39                	jmp    41 <cat+0x41>
    if (write(1, buf, n) != n) {
   8:	8b 45 f4             	mov    -0xc(%ebp),%eax
   b:	89 44 24 08          	mov    %eax,0x8(%esp)
   f:	c7 44 24 04 a0 0d 00 	movl   $0xda0,0x4(%esp)
  16:	00 
  17:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  1e:	e8 0d 05 00 00       	call   530 <write>
  23:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  26:	74 19                	je     41 <cat+0x41>
      printf(1, "cat: write error\n");
  28:	c7 44 24 04 6c 0a 00 	movl   $0xa6c,0x4(%esp)
  2f:	00 
  30:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  37:	e8 64 06 00 00       	call   6a0 <printf>
      exit();
  3c:	e8 cf 04 00 00       	call   510 <exit>
  while((n = read(fd, buf, sizeof(buf))) > 0) {
  41:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  48:	00 
  49:	c7 44 24 04 a0 0d 00 	movl   $0xda0,0x4(%esp)
  50:	00 
  51:	8b 45 08             	mov    0x8(%ebp),%eax
  54:	89 04 24             	mov    %eax,(%esp)
  57:	e8 cc 04 00 00       	call   528 <read>
  5c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  5f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  63:	7f a3                	jg     8 <cat+0x8>
    }
  }
  if(n < 0){
  65:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  69:	79 19                	jns    84 <cat+0x84>
    printf(1, "cat: read error\n");
  6b:	c7 44 24 04 7e 0a 00 	movl   $0xa7e,0x4(%esp)
  72:	00 
  73:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  7a:	e8 21 06 00 00       	call   6a0 <printf>
    exit();
  7f:	e8 8c 04 00 00       	call   510 <exit>
  }
}
  84:	c9                   	leave  
  85:	c3                   	ret    

00000086 <main>:

int
main(int argc, char *argv[])
{
  86:	55                   	push   %ebp
  87:	89 e5                	mov    %esp,%ebp
  89:	83 e4 f0             	and    $0xfffffff0,%esp
  8c:	83 ec 20             	sub    $0x20,%esp
  int fd, i;

  if(argc <= 1){
  8f:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
  93:	7f 11                	jg     a6 <main+0x20>
    cat(0);
  95:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  9c:	e8 5f ff ff ff       	call   0 <cat>
    exit();
  a1:	e8 6a 04 00 00       	call   510 <exit>
  }

  for(i = 1; i < argc; i++){
  a6:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
  ad:	00 
  ae:	eb 79                	jmp    129 <main+0xa3>
    if((fd = open(argv[i], 0)) < 0){
  b0:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  b4:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  bb:	8b 45 0c             	mov    0xc(%ebp),%eax
  be:	01 d0                	add    %edx,%eax
  c0:	8b 00                	mov    (%eax),%eax
  c2:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  c9:	00 
  ca:	89 04 24             	mov    %eax,(%esp)
  cd:	e8 7e 04 00 00       	call   550 <open>
  d2:	89 44 24 18          	mov    %eax,0x18(%esp)
  d6:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
  db:	79 2f                	jns    10c <main+0x86>
      printf(1, "cat: cannot open %s\n", argv[i]);
  dd:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  e1:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  e8:	8b 45 0c             	mov    0xc(%ebp),%eax
  eb:	01 d0                	add    %edx,%eax
  ed:	8b 00                	mov    (%eax),%eax
  ef:	89 44 24 08          	mov    %eax,0x8(%esp)
  f3:	c7 44 24 04 8f 0a 00 	movl   $0xa8f,0x4(%esp)
  fa:	00 
  fb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 102:	e8 99 05 00 00       	call   6a0 <printf>
      exit();
 107:	e8 04 04 00 00       	call   510 <exit>
    }
    cat(fd);
 10c:	8b 44 24 18          	mov    0x18(%esp),%eax
 110:	89 04 24             	mov    %eax,(%esp)
 113:	e8 e8 fe ff ff       	call   0 <cat>
    close(fd);
 118:	8b 44 24 18          	mov    0x18(%esp),%eax
 11c:	89 04 24             	mov    %eax,(%esp)
 11f:	e8 14 04 00 00       	call   538 <close>
  for(i = 1; i < argc; i++){
 124:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
 129:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 12d:	3b 45 08             	cmp    0x8(%ebp),%eax
 130:	0f 8c 7a ff ff ff    	jl     b0 <main+0x2a>
  }
  exit();
 136:	e8 d5 03 00 00       	call   510 <exit>

0000013b <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 13b:	55                   	push   %ebp
 13c:	89 e5                	mov    %esp,%ebp
 13e:	57                   	push   %edi
 13f:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 140:	8b 4d 08             	mov    0x8(%ebp),%ecx
 143:	8b 55 10             	mov    0x10(%ebp),%edx
 146:	8b 45 0c             	mov    0xc(%ebp),%eax
 149:	89 cb                	mov    %ecx,%ebx
 14b:	89 df                	mov    %ebx,%edi
 14d:	89 d1                	mov    %edx,%ecx
 14f:	fc                   	cld    
 150:	f3 aa                	rep stos %al,%es:(%edi)
 152:	89 ca                	mov    %ecx,%edx
 154:	89 fb                	mov    %edi,%ebx
 156:	89 5d 08             	mov    %ebx,0x8(%ebp)
 159:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 15c:	5b                   	pop    %ebx
 15d:	5f                   	pop    %edi
 15e:	5d                   	pop    %ebp
 15f:	c3                   	ret    

00000160 <ps>:
#include "user.h"
#include "x86.h"
#include "param.h"
#include "pstat.h"

void ps(){
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	57                   	push   %edi
 164:	56                   	push   %esi
 165:	53                   	push   %ebx
 166:	81 ec 2c 09 00 00    	sub    $0x92c,%esp
  
  //pstatTable pst = malloc(NPROC * sizeof(pstat_t));
  pstat_t pst[NPROC];
  getpinfo(&pst);
 16c:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 172:	89 04 24             	mov    %eax,(%esp)
 175:	e8 36 04 00 00       	call   5b0 <getpinfo>
  int i;
  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 17a:	c7 44 24 04 a4 0a 00 	movl   $0xaa4,0x4(%esp)
 181:	00 
 182:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 189:	e8 12 05 00 00       	call   6a0 <printf>
  for (i = 0; i < NPROC; i++){
 18e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 195:	e9 1e 01 00 00       	jmp    2b8 <ps+0x158>
    if (pst[i].inuse == 1){
 19a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 19d:	89 d0                	mov    %edx,%eax
 19f:	c1 e0 03             	shl    $0x3,%eax
 1a2:	01 d0                	add    %edx,%eax
 1a4:	c1 e0 02             	shl    $0x2,%eax
 1a7:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 1aa:	01 d8                	add    %ebx,%eax
 1ac:	2d 04 09 00 00       	sub    $0x904,%eax
 1b1:	8b 00                	mov    (%eax),%eax
 1b3:	83 f8 01             	cmp    $0x1,%eax
 1b6:	0f 85 f8 00 00 00    	jne    2b4 <ps+0x154>
      printf(1, "%d\t", pst[i].pid);
 1bc:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 1bf:	89 d0                	mov    %edx,%eax
 1c1:	c1 e0 03             	shl    $0x3,%eax
 1c4:	01 d0                	add    %edx,%eax
 1c6:	c1 e0 02             	shl    $0x2,%eax
 1c9:	8d 75 e8             	lea    -0x18(%ebp),%esi
 1cc:	01 f0                	add    %esi,%eax
 1ce:	2d fc 08 00 00       	sub    $0x8fc,%eax
 1d3:	8b 00                	mov    (%eax),%eax
 1d5:	89 44 24 08          	mov    %eax,0x8(%esp)
 1d9:	c7 44 24 04 bd 0a 00 	movl   $0xabd,0x4(%esp)
 1e0:	00 
 1e1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1e8:	e8 b3 04 00 00       	call   6a0 <printf>
      printf(1, "%d\t", pst[i].tickets);
 1ed:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 1f0:	89 d0                	mov    %edx,%eax
 1f2:	c1 e0 03             	shl    $0x3,%eax
 1f5:	01 d0                	add    %edx,%eax
 1f7:	c1 e0 02             	shl    $0x2,%eax
 1fa:	8d 7d e8             	lea    -0x18(%ebp),%edi
 1fd:	01 f8                	add    %edi,%eax
 1ff:	2d 00 09 00 00       	sub    $0x900,%eax
 204:	8b 00                	mov    (%eax),%eax
 206:	89 44 24 08          	mov    %eax,0x8(%esp)
 20a:	c7 44 24 04 bd 0a 00 	movl   $0xabd,0x4(%esp)
 211:	00 
 212:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 219:	e8 82 04 00 00       	call   6a0 <printf>
      printf(1, "%d\t", pst[i].ticks);
 21e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 221:	89 d0                	mov    %edx,%eax
 223:	c1 e0 03             	shl    $0x3,%eax
 226:	01 d0                	add    %edx,%eax
 228:	c1 e0 02             	shl    $0x2,%eax
 22b:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 22e:	01 c8                	add    %ecx,%eax
 230:	2d f8 08 00 00       	sub    $0x8f8,%eax
 235:	8b 00                	mov    (%eax),%eax
 237:	89 44 24 08          	mov    %eax,0x8(%esp)
 23b:	c7 44 24 04 bd 0a 00 	movl   $0xabd,0x4(%esp)
 242:	00 
 243:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 24a:	e8 51 04 00 00       	call   6a0 <printf>
      printf(1, "%c\t", pst[i].state);
 24f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 252:	89 d0                	mov    %edx,%eax
 254:	c1 e0 03             	shl    $0x3,%eax
 257:	01 d0                	add    %edx,%eax
 259:	c1 e0 02             	shl    $0x2,%eax
 25c:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 25f:	01 d8                	add    %ebx,%eax
 261:	2d e4 08 00 00       	sub    $0x8e4,%eax
 266:	0f b6 00             	movzbl (%eax),%eax
 269:	0f be c0             	movsbl %al,%eax
 26c:	89 44 24 08          	mov    %eax,0x8(%esp)
 270:	c7 44 24 04 c1 0a 00 	movl   $0xac1,0x4(%esp)
 277:	00 
 278:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 27f:	e8 1c 04 00 00       	call   6a0 <printf>
      printf(1, "%s\t\n", pst[i].name);
 284:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 28a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 28d:	89 d0                	mov    %edx,%eax
 28f:	c1 e0 03             	shl    $0x3,%eax
 292:	01 d0                	add    %edx,%eax
 294:	c1 e0 02             	shl    $0x2,%eax
 297:	83 c0 10             	add    $0x10,%eax
 29a:	01 c8                	add    %ecx,%eax
 29c:	89 44 24 08          	mov    %eax,0x8(%esp)
 2a0:	c7 44 24 04 c5 0a 00 	movl   $0xac5,0x4(%esp)
 2a7:	00 
 2a8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2af:	e8 ec 03 00 00       	call   6a0 <printf>
  for (i = 0; i < NPROC; i++){
 2b4:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 2b8:	83 7d e4 3f          	cmpl   $0x3f,-0x1c(%ebp)
 2bc:	0f 8e d8 fe ff ff    	jle    19a <ps+0x3a>
    }
  }
}
 2c2:	81 c4 2c 09 00 00    	add    $0x92c,%esp
 2c8:	5b                   	pop    %ebx
 2c9:	5e                   	pop    %esi
 2ca:	5f                   	pop    %edi
 2cb:	5d                   	pop    %ebp
 2cc:	c3                   	ret    

000002cd <strcpy>:

char*
strcpy(char *s, const char *t)
{
 2cd:	55                   	push   %ebp
 2ce:	89 e5                	mov    %esp,%ebp
 2d0:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 2d3:	8b 45 08             	mov    0x8(%ebp),%eax
 2d6:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 2d9:	90                   	nop
 2da:	8b 45 08             	mov    0x8(%ebp),%eax
 2dd:	8d 50 01             	lea    0x1(%eax),%edx
 2e0:	89 55 08             	mov    %edx,0x8(%ebp)
 2e3:	8b 55 0c             	mov    0xc(%ebp),%edx
 2e6:	8d 4a 01             	lea    0x1(%edx),%ecx
 2e9:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 2ec:	0f b6 12             	movzbl (%edx),%edx
 2ef:	88 10                	mov    %dl,(%eax)
 2f1:	0f b6 00             	movzbl (%eax),%eax
 2f4:	84 c0                	test   %al,%al
 2f6:	75 e2                	jne    2da <strcpy+0xd>
    ;
  return os;
 2f8:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 2fb:	c9                   	leave  
 2fc:	c3                   	ret    

000002fd <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2fd:	55                   	push   %ebp
 2fe:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 300:	eb 08                	jmp    30a <strcmp+0xd>
    p++, q++;
 302:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 306:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 30a:	8b 45 08             	mov    0x8(%ebp),%eax
 30d:	0f b6 00             	movzbl (%eax),%eax
 310:	84 c0                	test   %al,%al
 312:	74 10                	je     324 <strcmp+0x27>
 314:	8b 45 08             	mov    0x8(%ebp),%eax
 317:	0f b6 10             	movzbl (%eax),%edx
 31a:	8b 45 0c             	mov    0xc(%ebp),%eax
 31d:	0f b6 00             	movzbl (%eax),%eax
 320:	38 c2                	cmp    %al,%dl
 322:	74 de                	je     302 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 324:	8b 45 08             	mov    0x8(%ebp),%eax
 327:	0f b6 00             	movzbl (%eax),%eax
 32a:	0f b6 d0             	movzbl %al,%edx
 32d:	8b 45 0c             	mov    0xc(%ebp),%eax
 330:	0f b6 00             	movzbl (%eax),%eax
 333:	0f b6 c0             	movzbl %al,%eax
 336:	29 c2                	sub    %eax,%edx
 338:	89 d0                	mov    %edx,%eax
}
 33a:	5d                   	pop    %ebp
 33b:	c3                   	ret    

0000033c <strlen>:

uint
strlen(const char *s)
{
 33c:	55                   	push   %ebp
 33d:	89 e5                	mov    %esp,%ebp
 33f:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 342:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 349:	eb 04                	jmp    34f <strlen+0x13>
 34b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 34f:	8b 55 fc             	mov    -0x4(%ebp),%edx
 352:	8b 45 08             	mov    0x8(%ebp),%eax
 355:	01 d0                	add    %edx,%eax
 357:	0f b6 00             	movzbl (%eax),%eax
 35a:	84 c0                	test   %al,%al
 35c:	75 ed                	jne    34b <strlen+0xf>
    ;
  return n;
 35e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 361:	c9                   	leave  
 362:	c3                   	ret    

00000363 <memset>:

void*
memset(void *dst, int c, uint n)
{
 363:	55                   	push   %ebp
 364:	89 e5                	mov    %esp,%ebp
 366:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 369:	8b 45 10             	mov    0x10(%ebp),%eax
 36c:	89 44 24 08          	mov    %eax,0x8(%esp)
 370:	8b 45 0c             	mov    0xc(%ebp),%eax
 373:	89 44 24 04          	mov    %eax,0x4(%esp)
 377:	8b 45 08             	mov    0x8(%ebp),%eax
 37a:	89 04 24             	mov    %eax,(%esp)
 37d:	e8 b9 fd ff ff       	call   13b <stosb>
  return dst;
 382:	8b 45 08             	mov    0x8(%ebp),%eax
}
 385:	c9                   	leave  
 386:	c3                   	ret    

00000387 <strchr>:

char*
strchr(const char *s, char c)
{
 387:	55                   	push   %ebp
 388:	89 e5                	mov    %esp,%ebp
 38a:	83 ec 04             	sub    $0x4,%esp
 38d:	8b 45 0c             	mov    0xc(%ebp),%eax
 390:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 393:	eb 14                	jmp    3a9 <strchr+0x22>
    if(*s == c)
 395:	8b 45 08             	mov    0x8(%ebp),%eax
 398:	0f b6 00             	movzbl (%eax),%eax
 39b:	3a 45 fc             	cmp    -0x4(%ebp),%al
 39e:	75 05                	jne    3a5 <strchr+0x1e>
      return (char*)s;
 3a0:	8b 45 08             	mov    0x8(%ebp),%eax
 3a3:	eb 13                	jmp    3b8 <strchr+0x31>
  for(; *s; s++)
 3a5:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 3a9:	8b 45 08             	mov    0x8(%ebp),%eax
 3ac:	0f b6 00             	movzbl (%eax),%eax
 3af:	84 c0                	test   %al,%al
 3b1:	75 e2                	jne    395 <strchr+0xe>
  return 0;
 3b3:	b8 00 00 00 00       	mov    $0x0,%eax
}
 3b8:	c9                   	leave  
 3b9:	c3                   	ret    

000003ba <gets>:

char*
gets(char *buf, int max)
{
 3ba:	55                   	push   %ebp
 3bb:	89 e5                	mov    %esp,%ebp
 3bd:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3c0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 3c7:	eb 4c                	jmp    415 <gets+0x5b>
    cc = read(0, &c, 1);
 3c9:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3d0:	00 
 3d1:	8d 45 ef             	lea    -0x11(%ebp),%eax
 3d4:	89 44 24 04          	mov    %eax,0x4(%esp)
 3d8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 3df:	e8 44 01 00 00       	call   528 <read>
 3e4:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 3e7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 3eb:	7f 02                	jg     3ef <gets+0x35>
      break;
 3ed:	eb 31                	jmp    420 <gets+0x66>
    buf[i++] = c;
 3ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3f2:	8d 50 01             	lea    0x1(%eax),%edx
 3f5:	89 55 f4             	mov    %edx,-0xc(%ebp)
 3f8:	89 c2                	mov    %eax,%edx
 3fa:	8b 45 08             	mov    0x8(%ebp),%eax
 3fd:	01 c2                	add    %eax,%edx
 3ff:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 403:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 405:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 409:	3c 0a                	cmp    $0xa,%al
 40b:	74 13                	je     420 <gets+0x66>
 40d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 411:	3c 0d                	cmp    $0xd,%al
 413:	74 0b                	je     420 <gets+0x66>
  for(i=0; i+1 < max; ){
 415:	8b 45 f4             	mov    -0xc(%ebp),%eax
 418:	83 c0 01             	add    $0x1,%eax
 41b:	3b 45 0c             	cmp    0xc(%ebp),%eax
 41e:	7c a9                	jl     3c9 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 420:	8b 55 f4             	mov    -0xc(%ebp),%edx
 423:	8b 45 08             	mov    0x8(%ebp),%eax
 426:	01 d0                	add    %edx,%eax
 428:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 42b:	8b 45 08             	mov    0x8(%ebp),%eax
}
 42e:	c9                   	leave  
 42f:	c3                   	ret    

00000430 <stat>:

int
stat(const char *n, struct stat *st)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 436:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 43d:	00 
 43e:	8b 45 08             	mov    0x8(%ebp),%eax
 441:	89 04 24             	mov    %eax,(%esp)
 444:	e8 07 01 00 00       	call   550 <open>
 449:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 44c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 450:	79 07                	jns    459 <stat+0x29>
    return -1;
 452:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 457:	eb 23                	jmp    47c <stat+0x4c>
  r = fstat(fd, st);
 459:	8b 45 0c             	mov    0xc(%ebp),%eax
 45c:	89 44 24 04          	mov    %eax,0x4(%esp)
 460:	8b 45 f4             	mov    -0xc(%ebp),%eax
 463:	89 04 24             	mov    %eax,(%esp)
 466:	e8 fd 00 00 00       	call   568 <fstat>
 46b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 46e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 471:	89 04 24             	mov    %eax,(%esp)
 474:	e8 bf 00 00 00       	call   538 <close>
  return r;
 479:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 47c:	c9                   	leave  
 47d:	c3                   	ret    

0000047e <atoi>:

int
atoi(const char *s)
{
 47e:	55                   	push   %ebp
 47f:	89 e5                	mov    %esp,%ebp
 481:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 484:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 48b:	eb 25                	jmp    4b2 <atoi+0x34>
    n = n*10 + *s++ - '0';
 48d:	8b 55 fc             	mov    -0x4(%ebp),%edx
 490:	89 d0                	mov    %edx,%eax
 492:	c1 e0 02             	shl    $0x2,%eax
 495:	01 d0                	add    %edx,%eax
 497:	01 c0                	add    %eax,%eax
 499:	89 c1                	mov    %eax,%ecx
 49b:	8b 45 08             	mov    0x8(%ebp),%eax
 49e:	8d 50 01             	lea    0x1(%eax),%edx
 4a1:	89 55 08             	mov    %edx,0x8(%ebp)
 4a4:	0f b6 00             	movzbl (%eax),%eax
 4a7:	0f be c0             	movsbl %al,%eax
 4aa:	01 c8                	add    %ecx,%eax
 4ac:	83 e8 30             	sub    $0x30,%eax
 4af:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 4b2:	8b 45 08             	mov    0x8(%ebp),%eax
 4b5:	0f b6 00             	movzbl (%eax),%eax
 4b8:	3c 2f                	cmp    $0x2f,%al
 4ba:	7e 0a                	jle    4c6 <atoi+0x48>
 4bc:	8b 45 08             	mov    0x8(%ebp),%eax
 4bf:	0f b6 00             	movzbl (%eax),%eax
 4c2:	3c 39                	cmp    $0x39,%al
 4c4:	7e c7                	jle    48d <atoi+0xf>
  return n;
 4c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 4c9:	c9                   	leave  
 4ca:	c3                   	ret    

000004cb <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 4cb:	55                   	push   %ebp
 4cc:	89 e5                	mov    %esp,%ebp
 4ce:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 4d1:	8b 45 08             	mov    0x8(%ebp),%eax
 4d4:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 4d7:	8b 45 0c             	mov    0xc(%ebp),%eax
 4da:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 4dd:	eb 17                	jmp    4f6 <memmove+0x2b>
    *dst++ = *src++;
 4df:	8b 45 fc             	mov    -0x4(%ebp),%eax
 4e2:	8d 50 01             	lea    0x1(%eax),%edx
 4e5:	89 55 fc             	mov    %edx,-0x4(%ebp)
 4e8:	8b 55 f8             	mov    -0x8(%ebp),%edx
 4eb:	8d 4a 01             	lea    0x1(%edx),%ecx
 4ee:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 4f1:	0f b6 12             	movzbl (%edx),%edx
 4f4:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 4f6:	8b 45 10             	mov    0x10(%ebp),%eax
 4f9:	8d 50 ff             	lea    -0x1(%eax),%edx
 4fc:	89 55 10             	mov    %edx,0x10(%ebp)
 4ff:	85 c0                	test   %eax,%eax
 501:	7f dc                	jg     4df <memmove+0x14>
  return vdst;
 503:	8b 45 08             	mov    0x8(%ebp),%eax
}
 506:	c9                   	leave  
 507:	c3                   	ret    

00000508 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 508:	b8 01 00 00 00       	mov    $0x1,%eax
 50d:	cd 40                	int    $0x40
 50f:	c3                   	ret    

00000510 <exit>:
SYSCALL(exit)
 510:	b8 02 00 00 00       	mov    $0x2,%eax
 515:	cd 40                	int    $0x40
 517:	c3                   	ret    

00000518 <wait>:
SYSCALL(wait)
 518:	b8 03 00 00 00       	mov    $0x3,%eax
 51d:	cd 40                	int    $0x40
 51f:	c3                   	ret    

00000520 <pipe>:
SYSCALL(pipe)
 520:	b8 04 00 00 00       	mov    $0x4,%eax
 525:	cd 40                	int    $0x40
 527:	c3                   	ret    

00000528 <read>:
SYSCALL(read)
 528:	b8 05 00 00 00       	mov    $0x5,%eax
 52d:	cd 40                	int    $0x40
 52f:	c3                   	ret    

00000530 <write>:
SYSCALL(write)
 530:	b8 10 00 00 00       	mov    $0x10,%eax
 535:	cd 40                	int    $0x40
 537:	c3                   	ret    

00000538 <close>:
SYSCALL(close)
 538:	b8 15 00 00 00       	mov    $0x15,%eax
 53d:	cd 40                	int    $0x40
 53f:	c3                   	ret    

00000540 <kill>:
SYSCALL(kill)
 540:	b8 06 00 00 00       	mov    $0x6,%eax
 545:	cd 40                	int    $0x40
 547:	c3                   	ret    

00000548 <exec>:
SYSCALL(exec)
 548:	b8 07 00 00 00       	mov    $0x7,%eax
 54d:	cd 40                	int    $0x40
 54f:	c3                   	ret    

00000550 <open>:
SYSCALL(open)
 550:	b8 0f 00 00 00       	mov    $0xf,%eax
 555:	cd 40                	int    $0x40
 557:	c3                   	ret    

00000558 <mknod>:
SYSCALL(mknod)
 558:	b8 11 00 00 00       	mov    $0x11,%eax
 55d:	cd 40                	int    $0x40
 55f:	c3                   	ret    

00000560 <unlink>:
SYSCALL(unlink)
 560:	b8 12 00 00 00       	mov    $0x12,%eax
 565:	cd 40                	int    $0x40
 567:	c3                   	ret    

00000568 <fstat>:
SYSCALL(fstat)
 568:	b8 08 00 00 00       	mov    $0x8,%eax
 56d:	cd 40                	int    $0x40
 56f:	c3                   	ret    

00000570 <link>:
SYSCALL(link)
 570:	b8 13 00 00 00       	mov    $0x13,%eax
 575:	cd 40                	int    $0x40
 577:	c3                   	ret    

00000578 <mkdir>:
SYSCALL(mkdir)
 578:	b8 14 00 00 00       	mov    $0x14,%eax
 57d:	cd 40                	int    $0x40
 57f:	c3                   	ret    

00000580 <chdir>:
SYSCALL(chdir)
 580:	b8 09 00 00 00       	mov    $0x9,%eax
 585:	cd 40                	int    $0x40
 587:	c3                   	ret    

00000588 <dup>:
SYSCALL(dup)
 588:	b8 0a 00 00 00       	mov    $0xa,%eax
 58d:	cd 40                	int    $0x40
 58f:	c3                   	ret    

00000590 <getpid>:
SYSCALL(getpid)
 590:	b8 0b 00 00 00       	mov    $0xb,%eax
 595:	cd 40                	int    $0x40
 597:	c3                   	ret    

00000598 <sbrk>:
SYSCALL(sbrk)
 598:	b8 0c 00 00 00       	mov    $0xc,%eax
 59d:	cd 40                	int    $0x40
 59f:	c3                   	ret    

000005a0 <sleep>:
SYSCALL(sleep)
 5a0:	b8 0d 00 00 00       	mov    $0xd,%eax
 5a5:	cd 40                	int    $0x40
 5a7:	c3                   	ret    

000005a8 <uptime>:
SYSCALL(uptime)
 5a8:	b8 0e 00 00 00       	mov    $0xe,%eax
 5ad:	cd 40                	int    $0x40
 5af:	c3                   	ret    

000005b0 <getpinfo>:
SYSCALL(getpinfo)
 5b0:	b8 16 00 00 00       	mov    $0x16,%eax
 5b5:	cd 40                	int    $0x40
 5b7:	c3                   	ret    

000005b8 <settickets>:
SYSCALL(settickets)
 5b8:	b8 17 00 00 00       	mov    $0x17,%eax
 5bd:	cd 40                	int    $0x40
 5bf:	c3                   	ret    

000005c0 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5c0:	55                   	push   %ebp
 5c1:	89 e5                	mov    %esp,%ebp
 5c3:	83 ec 18             	sub    $0x18,%esp
 5c6:	8b 45 0c             	mov    0xc(%ebp),%eax
 5c9:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 5cc:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5d3:	00 
 5d4:	8d 45 f4             	lea    -0xc(%ebp),%eax
 5d7:	89 44 24 04          	mov    %eax,0x4(%esp)
 5db:	8b 45 08             	mov    0x8(%ebp),%eax
 5de:	89 04 24             	mov    %eax,(%esp)
 5e1:	e8 4a ff ff ff       	call   530 <write>
}
 5e6:	c9                   	leave  
 5e7:	c3                   	ret    

000005e8 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5e8:	55                   	push   %ebp
 5e9:	89 e5                	mov    %esp,%ebp
 5eb:	56                   	push   %esi
 5ec:	53                   	push   %ebx
 5ed:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 5f0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 5f7:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 5fb:	74 17                	je     614 <printint+0x2c>
 5fd:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 601:	79 11                	jns    614 <printint+0x2c>
    neg = 1;
 603:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 60a:	8b 45 0c             	mov    0xc(%ebp),%eax
 60d:	f7 d8                	neg    %eax
 60f:	89 45 ec             	mov    %eax,-0x14(%ebp)
 612:	eb 06                	jmp    61a <printint+0x32>
  } else {
    x = xx;
 614:	8b 45 0c             	mov    0xc(%ebp),%eax
 617:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 61a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 621:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 624:	8d 41 01             	lea    0x1(%ecx),%eax
 627:	89 45 f4             	mov    %eax,-0xc(%ebp)
 62a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 62d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 630:	ba 00 00 00 00       	mov    $0x0,%edx
 635:	f7 f3                	div    %ebx
 637:	89 d0                	mov    %edx,%eax
 639:	0f b6 80 68 0d 00 00 	movzbl 0xd68(%eax),%eax
 640:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 644:	8b 75 10             	mov    0x10(%ebp),%esi
 647:	8b 45 ec             	mov    -0x14(%ebp),%eax
 64a:	ba 00 00 00 00       	mov    $0x0,%edx
 64f:	f7 f6                	div    %esi
 651:	89 45 ec             	mov    %eax,-0x14(%ebp)
 654:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 658:	75 c7                	jne    621 <printint+0x39>
  if(neg)
 65a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 65e:	74 10                	je     670 <printint+0x88>
    buf[i++] = '-';
 660:	8b 45 f4             	mov    -0xc(%ebp),%eax
 663:	8d 50 01             	lea    0x1(%eax),%edx
 666:	89 55 f4             	mov    %edx,-0xc(%ebp)
 669:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 66e:	eb 1f                	jmp    68f <printint+0xa7>
 670:	eb 1d                	jmp    68f <printint+0xa7>
    putc(fd, buf[i]);
 672:	8d 55 dc             	lea    -0x24(%ebp),%edx
 675:	8b 45 f4             	mov    -0xc(%ebp),%eax
 678:	01 d0                	add    %edx,%eax
 67a:	0f b6 00             	movzbl (%eax),%eax
 67d:	0f be c0             	movsbl %al,%eax
 680:	89 44 24 04          	mov    %eax,0x4(%esp)
 684:	8b 45 08             	mov    0x8(%ebp),%eax
 687:	89 04 24             	mov    %eax,(%esp)
 68a:	e8 31 ff ff ff       	call   5c0 <putc>
  while(--i >= 0)
 68f:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 693:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 697:	79 d9                	jns    672 <printint+0x8a>
}
 699:	83 c4 30             	add    $0x30,%esp
 69c:	5b                   	pop    %ebx
 69d:	5e                   	pop    %esi
 69e:	5d                   	pop    %ebp
 69f:	c3                   	ret    

000006a0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6a0:	55                   	push   %ebp
 6a1:	89 e5                	mov    %esp,%ebp
 6a3:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 6a6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 6ad:	8d 45 0c             	lea    0xc(%ebp),%eax
 6b0:	83 c0 04             	add    $0x4,%eax
 6b3:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 6b6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 6bd:	e9 7c 01 00 00       	jmp    83e <printf+0x19e>
    c = fmt[i] & 0xff;
 6c2:	8b 55 0c             	mov    0xc(%ebp),%edx
 6c5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6c8:	01 d0                	add    %edx,%eax
 6ca:	0f b6 00             	movzbl (%eax),%eax
 6cd:	0f be c0             	movsbl %al,%eax
 6d0:	25 ff 00 00 00       	and    $0xff,%eax
 6d5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 6d8:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 6dc:	75 2c                	jne    70a <printf+0x6a>
      if(c == '%'){
 6de:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 6e2:	75 0c                	jne    6f0 <printf+0x50>
        state = '%';
 6e4:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 6eb:	e9 4a 01 00 00       	jmp    83a <printf+0x19a>
      } else {
        putc(fd, c);
 6f0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6f3:	0f be c0             	movsbl %al,%eax
 6f6:	89 44 24 04          	mov    %eax,0x4(%esp)
 6fa:	8b 45 08             	mov    0x8(%ebp),%eax
 6fd:	89 04 24             	mov    %eax,(%esp)
 700:	e8 bb fe ff ff       	call   5c0 <putc>
 705:	e9 30 01 00 00       	jmp    83a <printf+0x19a>
      }
    } else if(state == '%'){
 70a:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 70e:	0f 85 26 01 00 00    	jne    83a <printf+0x19a>
      if(c == 'd'){
 714:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 718:	75 2d                	jne    747 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 71a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 71d:	8b 00                	mov    (%eax),%eax
 71f:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 726:	00 
 727:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 72e:	00 
 72f:	89 44 24 04          	mov    %eax,0x4(%esp)
 733:	8b 45 08             	mov    0x8(%ebp),%eax
 736:	89 04 24             	mov    %eax,(%esp)
 739:	e8 aa fe ff ff       	call   5e8 <printint>
        ap++;
 73e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 742:	e9 ec 00 00 00       	jmp    833 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 747:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 74b:	74 06                	je     753 <printf+0xb3>
 74d:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 751:	75 2d                	jne    780 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 753:	8b 45 e8             	mov    -0x18(%ebp),%eax
 756:	8b 00                	mov    (%eax),%eax
 758:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 75f:	00 
 760:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 767:	00 
 768:	89 44 24 04          	mov    %eax,0x4(%esp)
 76c:	8b 45 08             	mov    0x8(%ebp),%eax
 76f:	89 04 24             	mov    %eax,(%esp)
 772:	e8 71 fe ff ff       	call   5e8 <printint>
        ap++;
 777:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 77b:	e9 b3 00 00 00       	jmp    833 <printf+0x193>
      } else if(c == 's'){
 780:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 784:	75 45                	jne    7cb <printf+0x12b>
        s = (char*)*ap;
 786:	8b 45 e8             	mov    -0x18(%ebp),%eax
 789:	8b 00                	mov    (%eax),%eax
 78b:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 78e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 792:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 796:	75 09                	jne    7a1 <printf+0x101>
          s = "(null)";
 798:	c7 45 f4 ca 0a 00 00 	movl   $0xaca,-0xc(%ebp)
        while(*s != 0){
 79f:	eb 1e                	jmp    7bf <printf+0x11f>
 7a1:	eb 1c                	jmp    7bf <printf+0x11f>
          putc(fd, *s);
 7a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7a6:	0f b6 00             	movzbl (%eax),%eax
 7a9:	0f be c0             	movsbl %al,%eax
 7ac:	89 44 24 04          	mov    %eax,0x4(%esp)
 7b0:	8b 45 08             	mov    0x8(%ebp),%eax
 7b3:	89 04 24             	mov    %eax,(%esp)
 7b6:	e8 05 fe ff ff       	call   5c0 <putc>
          s++;
 7bb:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 7bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7c2:	0f b6 00             	movzbl (%eax),%eax
 7c5:	84 c0                	test   %al,%al
 7c7:	75 da                	jne    7a3 <printf+0x103>
 7c9:	eb 68                	jmp    833 <printf+0x193>
        }
      } else if(c == 'c'){
 7cb:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 7cf:	75 1d                	jne    7ee <printf+0x14e>
        putc(fd, *ap);
 7d1:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7d4:	8b 00                	mov    (%eax),%eax
 7d6:	0f be c0             	movsbl %al,%eax
 7d9:	89 44 24 04          	mov    %eax,0x4(%esp)
 7dd:	8b 45 08             	mov    0x8(%ebp),%eax
 7e0:	89 04 24             	mov    %eax,(%esp)
 7e3:	e8 d8 fd ff ff       	call   5c0 <putc>
        ap++;
 7e8:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7ec:	eb 45                	jmp    833 <printf+0x193>
      } else if(c == '%'){
 7ee:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 7f2:	75 17                	jne    80b <printf+0x16b>
        putc(fd, c);
 7f4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7f7:	0f be c0             	movsbl %al,%eax
 7fa:	89 44 24 04          	mov    %eax,0x4(%esp)
 7fe:	8b 45 08             	mov    0x8(%ebp),%eax
 801:	89 04 24             	mov    %eax,(%esp)
 804:	e8 b7 fd ff ff       	call   5c0 <putc>
 809:	eb 28                	jmp    833 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 80b:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 812:	00 
 813:	8b 45 08             	mov    0x8(%ebp),%eax
 816:	89 04 24             	mov    %eax,(%esp)
 819:	e8 a2 fd ff ff       	call   5c0 <putc>
        putc(fd, c);
 81e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 821:	0f be c0             	movsbl %al,%eax
 824:	89 44 24 04          	mov    %eax,0x4(%esp)
 828:	8b 45 08             	mov    0x8(%ebp),%eax
 82b:	89 04 24             	mov    %eax,(%esp)
 82e:	e8 8d fd ff ff       	call   5c0 <putc>
      }
      state = 0;
 833:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 83a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 83e:	8b 55 0c             	mov    0xc(%ebp),%edx
 841:	8b 45 f0             	mov    -0x10(%ebp),%eax
 844:	01 d0                	add    %edx,%eax
 846:	0f b6 00             	movzbl (%eax),%eax
 849:	84 c0                	test   %al,%al
 84b:	0f 85 71 fe ff ff    	jne    6c2 <printf+0x22>
    }
  }
}
 851:	c9                   	leave  
 852:	c3                   	ret    

00000853 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 853:	55                   	push   %ebp
 854:	89 e5                	mov    %esp,%ebp
 856:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 859:	8b 45 08             	mov    0x8(%ebp),%eax
 85c:	83 e8 08             	sub    $0x8,%eax
 85f:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 862:	a1 88 0d 00 00       	mov    0xd88,%eax
 867:	89 45 fc             	mov    %eax,-0x4(%ebp)
 86a:	eb 24                	jmp    890 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 86c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 86f:	8b 00                	mov    (%eax),%eax
 871:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 874:	77 12                	ja     888 <free+0x35>
 876:	8b 45 f8             	mov    -0x8(%ebp),%eax
 879:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 87c:	77 24                	ja     8a2 <free+0x4f>
 87e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 881:	8b 00                	mov    (%eax),%eax
 883:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 886:	77 1a                	ja     8a2 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 888:	8b 45 fc             	mov    -0x4(%ebp),%eax
 88b:	8b 00                	mov    (%eax),%eax
 88d:	89 45 fc             	mov    %eax,-0x4(%ebp)
 890:	8b 45 f8             	mov    -0x8(%ebp),%eax
 893:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 896:	76 d4                	jbe    86c <free+0x19>
 898:	8b 45 fc             	mov    -0x4(%ebp),%eax
 89b:	8b 00                	mov    (%eax),%eax
 89d:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8a0:	76 ca                	jbe    86c <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8a2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8a5:	8b 40 04             	mov    0x4(%eax),%eax
 8a8:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 8af:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8b2:	01 c2                	add    %eax,%edx
 8b4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8b7:	8b 00                	mov    (%eax),%eax
 8b9:	39 c2                	cmp    %eax,%edx
 8bb:	75 24                	jne    8e1 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 8bd:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8c0:	8b 50 04             	mov    0x4(%eax),%edx
 8c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8c6:	8b 00                	mov    (%eax),%eax
 8c8:	8b 40 04             	mov    0x4(%eax),%eax
 8cb:	01 c2                	add    %eax,%edx
 8cd:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8d0:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 8d3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8d6:	8b 00                	mov    (%eax),%eax
 8d8:	8b 10                	mov    (%eax),%edx
 8da:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8dd:	89 10                	mov    %edx,(%eax)
 8df:	eb 0a                	jmp    8eb <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 8e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8e4:	8b 10                	mov    (%eax),%edx
 8e6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8e9:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 8eb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8ee:	8b 40 04             	mov    0x4(%eax),%eax
 8f1:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 8f8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8fb:	01 d0                	add    %edx,%eax
 8fd:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 900:	75 20                	jne    922 <free+0xcf>
    p->s.size += bp->s.size;
 902:	8b 45 fc             	mov    -0x4(%ebp),%eax
 905:	8b 50 04             	mov    0x4(%eax),%edx
 908:	8b 45 f8             	mov    -0x8(%ebp),%eax
 90b:	8b 40 04             	mov    0x4(%eax),%eax
 90e:	01 c2                	add    %eax,%edx
 910:	8b 45 fc             	mov    -0x4(%ebp),%eax
 913:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 916:	8b 45 f8             	mov    -0x8(%ebp),%eax
 919:	8b 10                	mov    (%eax),%edx
 91b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 91e:	89 10                	mov    %edx,(%eax)
 920:	eb 08                	jmp    92a <free+0xd7>
  } else
    p->s.ptr = bp;
 922:	8b 45 fc             	mov    -0x4(%ebp),%eax
 925:	8b 55 f8             	mov    -0x8(%ebp),%edx
 928:	89 10                	mov    %edx,(%eax)
  freep = p;
 92a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 92d:	a3 88 0d 00 00       	mov    %eax,0xd88
}
 932:	c9                   	leave  
 933:	c3                   	ret    

00000934 <morecore>:

static Header*
morecore(uint nu)
{
 934:	55                   	push   %ebp
 935:	89 e5                	mov    %esp,%ebp
 937:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 93a:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 941:	77 07                	ja     94a <morecore+0x16>
    nu = 4096;
 943:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 94a:	8b 45 08             	mov    0x8(%ebp),%eax
 94d:	c1 e0 03             	shl    $0x3,%eax
 950:	89 04 24             	mov    %eax,(%esp)
 953:	e8 40 fc ff ff       	call   598 <sbrk>
 958:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 95b:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 95f:	75 07                	jne    968 <morecore+0x34>
    return 0;
 961:	b8 00 00 00 00       	mov    $0x0,%eax
 966:	eb 22                	jmp    98a <morecore+0x56>
  hp = (Header*)p;
 968:	8b 45 f4             	mov    -0xc(%ebp),%eax
 96b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 96e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 971:	8b 55 08             	mov    0x8(%ebp),%edx
 974:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 977:	8b 45 f0             	mov    -0x10(%ebp),%eax
 97a:	83 c0 08             	add    $0x8,%eax
 97d:	89 04 24             	mov    %eax,(%esp)
 980:	e8 ce fe ff ff       	call   853 <free>
  return freep;
 985:	a1 88 0d 00 00       	mov    0xd88,%eax
}
 98a:	c9                   	leave  
 98b:	c3                   	ret    

0000098c <malloc>:

void*
malloc(uint nbytes)
{
 98c:	55                   	push   %ebp
 98d:	89 e5                	mov    %esp,%ebp
 98f:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 992:	8b 45 08             	mov    0x8(%ebp),%eax
 995:	83 c0 07             	add    $0x7,%eax
 998:	c1 e8 03             	shr    $0x3,%eax
 99b:	83 c0 01             	add    $0x1,%eax
 99e:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 9a1:	a1 88 0d 00 00       	mov    0xd88,%eax
 9a6:	89 45 f0             	mov    %eax,-0x10(%ebp)
 9a9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 9ad:	75 23                	jne    9d2 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 9af:	c7 45 f0 80 0d 00 00 	movl   $0xd80,-0x10(%ebp)
 9b6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9b9:	a3 88 0d 00 00       	mov    %eax,0xd88
 9be:	a1 88 0d 00 00       	mov    0xd88,%eax
 9c3:	a3 80 0d 00 00       	mov    %eax,0xd80
    base.s.size = 0;
 9c8:	c7 05 84 0d 00 00 00 	movl   $0x0,0xd84
 9cf:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9d2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9d5:	8b 00                	mov    (%eax),%eax
 9d7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 9da:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9dd:	8b 40 04             	mov    0x4(%eax),%eax
 9e0:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 9e3:	72 4d                	jb     a32 <malloc+0xa6>
      if(p->s.size == nunits)
 9e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9e8:	8b 40 04             	mov    0x4(%eax),%eax
 9eb:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 9ee:	75 0c                	jne    9fc <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 9f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9f3:	8b 10                	mov    (%eax),%edx
 9f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9f8:	89 10                	mov    %edx,(%eax)
 9fa:	eb 26                	jmp    a22 <malloc+0x96>
      else {
        p->s.size -= nunits;
 9fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9ff:	8b 40 04             	mov    0x4(%eax),%eax
 a02:	2b 45 ec             	sub    -0x14(%ebp),%eax
 a05:	89 c2                	mov    %eax,%edx
 a07:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a0a:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a0d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a10:	8b 40 04             	mov    0x4(%eax),%eax
 a13:	c1 e0 03             	shl    $0x3,%eax
 a16:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 a19:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a1c:	8b 55 ec             	mov    -0x14(%ebp),%edx
 a1f:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 a22:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a25:	a3 88 0d 00 00       	mov    %eax,0xd88
      return (void*)(p + 1);
 a2a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a2d:	83 c0 08             	add    $0x8,%eax
 a30:	eb 38                	jmp    a6a <malloc+0xde>
    }
    if(p == freep)
 a32:	a1 88 0d 00 00       	mov    0xd88,%eax
 a37:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 a3a:	75 1b                	jne    a57 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 a3c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a3f:	89 04 24             	mov    %eax,(%esp)
 a42:	e8 ed fe ff ff       	call   934 <morecore>
 a47:	89 45 f4             	mov    %eax,-0xc(%ebp)
 a4a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 a4e:	75 07                	jne    a57 <malloc+0xcb>
        return 0;
 a50:	b8 00 00 00 00       	mov    $0x0,%eax
 a55:	eb 13                	jmp    a6a <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a57:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a5a:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a5d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a60:	8b 00                	mov    (%eax),%eax
 a62:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 a65:	e9 70 ff ff ff       	jmp    9da <malloc+0x4e>
}
 a6a:	c9                   	leave  
 a6b:	c3                   	ret    
