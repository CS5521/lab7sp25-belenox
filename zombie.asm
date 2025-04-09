
_zombie:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 10             	sub    $0x10,%esp
  if(fork() > 0)
   9:	e8 e2 03 00 00       	call   3f0 <fork>
   e:	85 c0                	test   %eax,%eax
  10:	7e 0c                	jle    1e <main+0x1e>
    sleep(5);  // Let child exit before parent.
  12:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
  19:	e8 6a 04 00 00       	call   488 <sleep>
  exit();
  1e:	e8 d5 03 00 00       	call   3f8 <exit>

00000023 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  23:	55                   	push   %ebp
  24:	89 e5                	mov    %esp,%ebp
  26:	57                   	push   %edi
  27:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  28:	8b 4d 08             	mov    0x8(%ebp),%ecx
  2b:	8b 55 10             	mov    0x10(%ebp),%edx
  2e:	8b 45 0c             	mov    0xc(%ebp),%eax
  31:	89 cb                	mov    %ecx,%ebx
  33:	89 df                	mov    %ebx,%edi
  35:	89 d1                	mov    %edx,%ecx
  37:	fc                   	cld    
  38:	f3 aa                	rep stos %al,%es:(%edi)
  3a:	89 ca                	mov    %ecx,%edx
  3c:	89 fb                	mov    %edi,%ebx
  3e:	89 5d 08             	mov    %ebx,0x8(%ebp)
  41:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  44:	5b                   	pop    %ebx
  45:	5f                   	pop    %edi
  46:	5d                   	pop    %ebp
  47:	c3                   	ret    

00000048 <ps>:
#include "user.h"
#include "x86.h"
#include "param.h"
#include "pstat.h"

void ps(){
  48:	55                   	push   %ebp
  49:	89 e5                	mov    %esp,%ebp
  4b:	57                   	push   %edi
  4c:	56                   	push   %esi
  4d:	53                   	push   %ebx
  4e:	81 ec 2c 09 00 00    	sub    $0x92c,%esp
  
  //pstatTable pst = malloc(NPROC * sizeof(pstat_t));
  pstat_t pst[NPROC];
  getpinfo(&pst);
  54:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
  5a:	89 04 24             	mov    %eax,(%esp)
  5d:	e8 36 04 00 00       	call   498 <getpinfo>
  int i;
  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
  62:	c7 44 24 04 54 09 00 	movl   $0x954,0x4(%esp)
  69:	00 
  6a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  71:	e8 12 05 00 00       	call   588 <printf>
  for (i = 0; i < NPROC; i++){
  76:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  7d:	e9 1e 01 00 00       	jmp    1a0 <ps+0x158>
    if (pst[i].inuse == 1){
  82:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  85:	89 d0                	mov    %edx,%eax
  87:	c1 e0 03             	shl    $0x3,%eax
  8a:	01 d0                	add    %edx,%eax
  8c:	c1 e0 02             	shl    $0x2,%eax
  8f:	8d 5d e8             	lea    -0x18(%ebp),%ebx
  92:	01 d8                	add    %ebx,%eax
  94:	2d 04 09 00 00       	sub    $0x904,%eax
  99:	8b 00                	mov    (%eax),%eax
  9b:	83 f8 01             	cmp    $0x1,%eax
  9e:	0f 85 f8 00 00 00    	jne    19c <ps+0x154>
      printf(1, "%d\t", pst[i].pid);
  a4:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  a7:	89 d0                	mov    %edx,%eax
  a9:	c1 e0 03             	shl    $0x3,%eax
  ac:	01 d0                	add    %edx,%eax
  ae:	c1 e0 02             	shl    $0x2,%eax
  b1:	8d 75 e8             	lea    -0x18(%ebp),%esi
  b4:	01 f0                	add    %esi,%eax
  b6:	2d fc 08 00 00       	sub    $0x8fc,%eax
  bb:	8b 00                	mov    (%eax),%eax
  bd:	89 44 24 08          	mov    %eax,0x8(%esp)
  c1:	c7 44 24 04 6d 09 00 	movl   $0x96d,0x4(%esp)
  c8:	00 
  c9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  d0:	e8 b3 04 00 00       	call   588 <printf>
      printf(1, "%d\t", pst[i].tickets);
  d5:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  d8:	89 d0                	mov    %edx,%eax
  da:	c1 e0 03             	shl    $0x3,%eax
  dd:	01 d0                	add    %edx,%eax
  df:	c1 e0 02             	shl    $0x2,%eax
  e2:	8d 7d e8             	lea    -0x18(%ebp),%edi
  e5:	01 f8                	add    %edi,%eax
  e7:	2d 00 09 00 00       	sub    $0x900,%eax
  ec:	8b 00                	mov    (%eax),%eax
  ee:	89 44 24 08          	mov    %eax,0x8(%esp)
  f2:	c7 44 24 04 6d 09 00 	movl   $0x96d,0x4(%esp)
  f9:	00 
  fa:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 101:	e8 82 04 00 00       	call   588 <printf>
      printf(1, "%d\t", pst[i].ticks);
 106:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 109:	89 d0                	mov    %edx,%eax
 10b:	c1 e0 03             	shl    $0x3,%eax
 10e:	01 d0                	add    %edx,%eax
 110:	c1 e0 02             	shl    $0x2,%eax
 113:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 116:	01 c8                	add    %ecx,%eax
 118:	2d f8 08 00 00       	sub    $0x8f8,%eax
 11d:	8b 00                	mov    (%eax),%eax
 11f:	89 44 24 08          	mov    %eax,0x8(%esp)
 123:	c7 44 24 04 6d 09 00 	movl   $0x96d,0x4(%esp)
 12a:	00 
 12b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 132:	e8 51 04 00 00       	call   588 <printf>
      printf(1, "%c\t", pst[i].state);
 137:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 13a:	89 d0                	mov    %edx,%eax
 13c:	c1 e0 03             	shl    $0x3,%eax
 13f:	01 d0                	add    %edx,%eax
 141:	c1 e0 02             	shl    $0x2,%eax
 144:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 147:	01 d8                	add    %ebx,%eax
 149:	2d e4 08 00 00       	sub    $0x8e4,%eax
 14e:	0f b6 00             	movzbl (%eax),%eax
 151:	0f be c0             	movsbl %al,%eax
 154:	89 44 24 08          	mov    %eax,0x8(%esp)
 158:	c7 44 24 04 71 09 00 	movl   $0x971,0x4(%esp)
 15f:	00 
 160:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 167:	e8 1c 04 00 00       	call   588 <printf>
      printf(1, "%s\t\n", pst[i].name);
 16c:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 172:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 175:	89 d0                	mov    %edx,%eax
 177:	c1 e0 03             	shl    $0x3,%eax
 17a:	01 d0                	add    %edx,%eax
 17c:	c1 e0 02             	shl    $0x2,%eax
 17f:	83 c0 10             	add    $0x10,%eax
 182:	01 c8                	add    %ecx,%eax
 184:	89 44 24 08          	mov    %eax,0x8(%esp)
 188:	c7 44 24 04 75 09 00 	movl   $0x975,0x4(%esp)
 18f:	00 
 190:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 197:	e8 ec 03 00 00       	call   588 <printf>
  for (i = 0; i < NPROC; i++){
 19c:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 1a0:	83 7d e4 3f          	cmpl   $0x3f,-0x1c(%ebp)
 1a4:	0f 8e d8 fe ff ff    	jle    82 <ps+0x3a>
    }
  }
}
 1aa:	81 c4 2c 09 00 00    	add    $0x92c,%esp
 1b0:	5b                   	pop    %ebx
 1b1:	5e                   	pop    %esi
 1b2:	5f                   	pop    %edi
 1b3:	5d                   	pop    %ebp
 1b4:	c3                   	ret    

000001b5 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 1b5:	55                   	push   %ebp
 1b6:	89 e5                	mov    %esp,%ebp
 1b8:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 1bb:	8b 45 08             	mov    0x8(%ebp),%eax
 1be:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 1c1:	90                   	nop
 1c2:	8b 45 08             	mov    0x8(%ebp),%eax
 1c5:	8d 50 01             	lea    0x1(%eax),%edx
 1c8:	89 55 08             	mov    %edx,0x8(%ebp)
 1cb:	8b 55 0c             	mov    0xc(%ebp),%edx
 1ce:	8d 4a 01             	lea    0x1(%edx),%ecx
 1d1:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 1d4:	0f b6 12             	movzbl (%edx),%edx
 1d7:	88 10                	mov    %dl,(%eax)
 1d9:	0f b6 00             	movzbl (%eax),%eax
 1dc:	84 c0                	test   %al,%al
 1de:	75 e2                	jne    1c2 <strcpy+0xd>
    ;
  return os;
 1e0:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1e3:	c9                   	leave  
 1e4:	c3                   	ret    

000001e5 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1e5:	55                   	push   %ebp
 1e6:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 1e8:	eb 08                	jmp    1f2 <strcmp+0xd>
    p++, q++;
 1ea:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 1ee:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 1f2:	8b 45 08             	mov    0x8(%ebp),%eax
 1f5:	0f b6 00             	movzbl (%eax),%eax
 1f8:	84 c0                	test   %al,%al
 1fa:	74 10                	je     20c <strcmp+0x27>
 1fc:	8b 45 08             	mov    0x8(%ebp),%eax
 1ff:	0f b6 10             	movzbl (%eax),%edx
 202:	8b 45 0c             	mov    0xc(%ebp),%eax
 205:	0f b6 00             	movzbl (%eax),%eax
 208:	38 c2                	cmp    %al,%dl
 20a:	74 de                	je     1ea <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 20c:	8b 45 08             	mov    0x8(%ebp),%eax
 20f:	0f b6 00             	movzbl (%eax),%eax
 212:	0f b6 d0             	movzbl %al,%edx
 215:	8b 45 0c             	mov    0xc(%ebp),%eax
 218:	0f b6 00             	movzbl (%eax),%eax
 21b:	0f b6 c0             	movzbl %al,%eax
 21e:	29 c2                	sub    %eax,%edx
 220:	89 d0                	mov    %edx,%eax
}
 222:	5d                   	pop    %ebp
 223:	c3                   	ret    

00000224 <strlen>:

uint
strlen(const char *s)
{
 224:	55                   	push   %ebp
 225:	89 e5                	mov    %esp,%ebp
 227:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 22a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 231:	eb 04                	jmp    237 <strlen+0x13>
 233:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 237:	8b 55 fc             	mov    -0x4(%ebp),%edx
 23a:	8b 45 08             	mov    0x8(%ebp),%eax
 23d:	01 d0                	add    %edx,%eax
 23f:	0f b6 00             	movzbl (%eax),%eax
 242:	84 c0                	test   %al,%al
 244:	75 ed                	jne    233 <strlen+0xf>
    ;
  return n;
 246:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 249:	c9                   	leave  
 24a:	c3                   	ret    

0000024b <memset>:

void*
memset(void *dst, int c, uint n)
{
 24b:	55                   	push   %ebp
 24c:	89 e5                	mov    %esp,%ebp
 24e:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 251:	8b 45 10             	mov    0x10(%ebp),%eax
 254:	89 44 24 08          	mov    %eax,0x8(%esp)
 258:	8b 45 0c             	mov    0xc(%ebp),%eax
 25b:	89 44 24 04          	mov    %eax,0x4(%esp)
 25f:	8b 45 08             	mov    0x8(%ebp),%eax
 262:	89 04 24             	mov    %eax,(%esp)
 265:	e8 b9 fd ff ff       	call   23 <stosb>
  return dst;
 26a:	8b 45 08             	mov    0x8(%ebp),%eax
}
 26d:	c9                   	leave  
 26e:	c3                   	ret    

0000026f <strchr>:

char*
strchr(const char *s, char c)
{
 26f:	55                   	push   %ebp
 270:	89 e5                	mov    %esp,%ebp
 272:	83 ec 04             	sub    $0x4,%esp
 275:	8b 45 0c             	mov    0xc(%ebp),%eax
 278:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 27b:	eb 14                	jmp    291 <strchr+0x22>
    if(*s == c)
 27d:	8b 45 08             	mov    0x8(%ebp),%eax
 280:	0f b6 00             	movzbl (%eax),%eax
 283:	3a 45 fc             	cmp    -0x4(%ebp),%al
 286:	75 05                	jne    28d <strchr+0x1e>
      return (char*)s;
 288:	8b 45 08             	mov    0x8(%ebp),%eax
 28b:	eb 13                	jmp    2a0 <strchr+0x31>
  for(; *s; s++)
 28d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 291:	8b 45 08             	mov    0x8(%ebp),%eax
 294:	0f b6 00             	movzbl (%eax),%eax
 297:	84 c0                	test   %al,%al
 299:	75 e2                	jne    27d <strchr+0xe>
  return 0;
 29b:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2a0:	c9                   	leave  
 2a1:	c3                   	ret    

000002a2 <gets>:

char*
gets(char *buf, int max)
{
 2a2:	55                   	push   %ebp
 2a3:	89 e5                	mov    %esp,%ebp
 2a5:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2a8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 2af:	eb 4c                	jmp    2fd <gets+0x5b>
    cc = read(0, &c, 1);
 2b1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 2b8:	00 
 2b9:	8d 45 ef             	lea    -0x11(%ebp),%eax
 2bc:	89 44 24 04          	mov    %eax,0x4(%esp)
 2c0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 2c7:	e8 44 01 00 00       	call   410 <read>
 2cc:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 2cf:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 2d3:	7f 02                	jg     2d7 <gets+0x35>
      break;
 2d5:	eb 31                	jmp    308 <gets+0x66>
    buf[i++] = c;
 2d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2da:	8d 50 01             	lea    0x1(%eax),%edx
 2dd:	89 55 f4             	mov    %edx,-0xc(%ebp)
 2e0:	89 c2                	mov    %eax,%edx
 2e2:	8b 45 08             	mov    0x8(%ebp),%eax
 2e5:	01 c2                	add    %eax,%edx
 2e7:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 2eb:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 2ed:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 2f1:	3c 0a                	cmp    $0xa,%al
 2f3:	74 13                	je     308 <gets+0x66>
 2f5:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 2f9:	3c 0d                	cmp    $0xd,%al
 2fb:	74 0b                	je     308 <gets+0x66>
  for(i=0; i+1 < max; ){
 2fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 300:	83 c0 01             	add    $0x1,%eax
 303:	3b 45 0c             	cmp    0xc(%ebp),%eax
 306:	7c a9                	jl     2b1 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 308:	8b 55 f4             	mov    -0xc(%ebp),%edx
 30b:	8b 45 08             	mov    0x8(%ebp),%eax
 30e:	01 d0                	add    %edx,%eax
 310:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 313:	8b 45 08             	mov    0x8(%ebp),%eax
}
 316:	c9                   	leave  
 317:	c3                   	ret    

00000318 <stat>:

int
stat(const char *n, struct stat *st)
{
 318:	55                   	push   %ebp
 319:	89 e5                	mov    %esp,%ebp
 31b:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 31e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 325:	00 
 326:	8b 45 08             	mov    0x8(%ebp),%eax
 329:	89 04 24             	mov    %eax,(%esp)
 32c:	e8 07 01 00 00       	call   438 <open>
 331:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 334:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 338:	79 07                	jns    341 <stat+0x29>
    return -1;
 33a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 33f:	eb 23                	jmp    364 <stat+0x4c>
  r = fstat(fd, st);
 341:	8b 45 0c             	mov    0xc(%ebp),%eax
 344:	89 44 24 04          	mov    %eax,0x4(%esp)
 348:	8b 45 f4             	mov    -0xc(%ebp),%eax
 34b:	89 04 24             	mov    %eax,(%esp)
 34e:	e8 fd 00 00 00       	call   450 <fstat>
 353:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 356:	8b 45 f4             	mov    -0xc(%ebp),%eax
 359:	89 04 24             	mov    %eax,(%esp)
 35c:	e8 bf 00 00 00       	call   420 <close>
  return r;
 361:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 364:	c9                   	leave  
 365:	c3                   	ret    

00000366 <atoi>:

int
atoi(const char *s)
{
 366:	55                   	push   %ebp
 367:	89 e5                	mov    %esp,%ebp
 369:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 36c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 373:	eb 25                	jmp    39a <atoi+0x34>
    n = n*10 + *s++ - '0';
 375:	8b 55 fc             	mov    -0x4(%ebp),%edx
 378:	89 d0                	mov    %edx,%eax
 37a:	c1 e0 02             	shl    $0x2,%eax
 37d:	01 d0                	add    %edx,%eax
 37f:	01 c0                	add    %eax,%eax
 381:	89 c1                	mov    %eax,%ecx
 383:	8b 45 08             	mov    0x8(%ebp),%eax
 386:	8d 50 01             	lea    0x1(%eax),%edx
 389:	89 55 08             	mov    %edx,0x8(%ebp)
 38c:	0f b6 00             	movzbl (%eax),%eax
 38f:	0f be c0             	movsbl %al,%eax
 392:	01 c8                	add    %ecx,%eax
 394:	83 e8 30             	sub    $0x30,%eax
 397:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 39a:	8b 45 08             	mov    0x8(%ebp),%eax
 39d:	0f b6 00             	movzbl (%eax),%eax
 3a0:	3c 2f                	cmp    $0x2f,%al
 3a2:	7e 0a                	jle    3ae <atoi+0x48>
 3a4:	8b 45 08             	mov    0x8(%ebp),%eax
 3a7:	0f b6 00             	movzbl (%eax),%eax
 3aa:	3c 39                	cmp    $0x39,%al
 3ac:	7e c7                	jle    375 <atoi+0xf>
  return n;
 3ae:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3b1:	c9                   	leave  
 3b2:	c3                   	ret    

000003b3 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3b3:	55                   	push   %ebp
 3b4:	89 e5                	mov    %esp,%ebp
 3b6:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 3b9:	8b 45 08             	mov    0x8(%ebp),%eax
 3bc:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 3bf:	8b 45 0c             	mov    0xc(%ebp),%eax
 3c2:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 3c5:	eb 17                	jmp    3de <memmove+0x2b>
    *dst++ = *src++;
 3c7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 3ca:	8d 50 01             	lea    0x1(%eax),%edx
 3cd:	89 55 fc             	mov    %edx,-0x4(%ebp)
 3d0:	8b 55 f8             	mov    -0x8(%ebp),%edx
 3d3:	8d 4a 01             	lea    0x1(%edx),%ecx
 3d6:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 3d9:	0f b6 12             	movzbl (%edx),%edx
 3dc:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 3de:	8b 45 10             	mov    0x10(%ebp),%eax
 3e1:	8d 50 ff             	lea    -0x1(%eax),%edx
 3e4:	89 55 10             	mov    %edx,0x10(%ebp)
 3e7:	85 c0                	test   %eax,%eax
 3e9:	7f dc                	jg     3c7 <memmove+0x14>
  return vdst;
 3eb:	8b 45 08             	mov    0x8(%ebp),%eax
}
 3ee:	c9                   	leave  
 3ef:	c3                   	ret    

000003f0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3f0:	b8 01 00 00 00       	mov    $0x1,%eax
 3f5:	cd 40                	int    $0x40
 3f7:	c3                   	ret    

000003f8 <exit>:
SYSCALL(exit)
 3f8:	b8 02 00 00 00       	mov    $0x2,%eax
 3fd:	cd 40                	int    $0x40
 3ff:	c3                   	ret    

00000400 <wait>:
SYSCALL(wait)
 400:	b8 03 00 00 00       	mov    $0x3,%eax
 405:	cd 40                	int    $0x40
 407:	c3                   	ret    

00000408 <pipe>:
SYSCALL(pipe)
 408:	b8 04 00 00 00       	mov    $0x4,%eax
 40d:	cd 40                	int    $0x40
 40f:	c3                   	ret    

00000410 <read>:
SYSCALL(read)
 410:	b8 05 00 00 00       	mov    $0x5,%eax
 415:	cd 40                	int    $0x40
 417:	c3                   	ret    

00000418 <write>:
SYSCALL(write)
 418:	b8 10 00 00 00       	mov    $0x10,%eax
 41d:	cd 40                	int    $0x40
 41f:	c3                   	ret    

00000420 <close>:
SYSCALL(close)
 420:	b8 15 00 00 00       	mov    $0x15,%eax
 425:	cd 40                	int    $0x40
 427:	c3                   	ret    

00000428 <kill>:
SYSCALL(kill)
 428:	b8 06 00 00 00       	mov    $0x6,%eax
 42d:	cd 40                	int    $0x40
 42f:	c3                   	ret    

00000430 <exec>:
SYSCALL(exec)
 430:	b8 07 00 00 00       	mov    $0x7,%eax
 435:	cd 40                	int    $0x40
 437:	c3                   	ret    

00000438 <open>:
SYSCALL(open)
 438:	b8 0f 00 00 00       	mov    $0xf,%eax
 43d:	cd 40                	int    $0x40
 43f:	c3                   	ret    

00000440 <mknod>:
SYSCALL(mknod)
 440:	b8 11 00 00 00       	mov    $0x11,%eax
 445:	cd 40                	int    $0x40
 447:	c3                   	ret    

00000448 <unlink>:
SYSCALL(unlink)
 448:	b8 12 00 00 00       	mov    $0x12,%eax
 44d:	cd 40                	int    $0x40
 44f:	c3                   	ret    

00000450 <fstat>:
SYSCALL(fstat)
 450:	b8 08 00 00 00       	mov    $0x8,%eax
 455:	cd 40                	int    $0x40
 457:	c3                   	ret    

00000458 <link>:
SYSCALL(link)
 458:	b8 13 00 00 00       	mov    $0x13,%eax
 45d:	cd 40                	int    $0x40
 45f:	c3                   	ret    

00000460 <mkdir>:
SYSCALL(mkdir)
 460:	b8 14 00 00 00       	mov    $0x14,%eax
 465:	cd 40                	int    $0x40
 467:	c3                   	ret    

00000468 <chdir>:
SYSCALL(chdir)
 468:	b8 09 00 00 00       	mov    $0x9,%eax
 46d:	cd 40                	int    $0x40
 46f:	c3                   	ret    

00000470 <dup>:
SYSCALL(dup)
 470:	b8 0a 00 00 00       	mov    $0xa,%eax
 475:	cd 40                	int    $0x40
 477:	c3                   	ret    

00000478 <getpid>:
SYSCALL(getpid)
 478:	b8 0b 00 00 00       	mov    $0xb,%eax
 47d:	cd 40                	int    $0x40
 47f:	c3                   	ret    

00000480 <sbrk>:
SYSCALL(sbrk)
 480:	b8 0c 00 00 00       	mov    $0xc,%eax
 485:	cd 40                	int    $0x40
 487:	c3                   	ret    

00000488 <sleep>:
SYSCALL(sleep)
 488:	b8 0d 00 00 00       	mov    $0xd,%eax
 48d:	cd 40                	int    $0x40
 48f:	c3                   	ret    

00000490 <uptime>:
SYSCALL(uptime)
 490:	b8 0e 00 00 00       	mov    $0xe,%eax
 495:	cd 40                	int    $0x40
 497:	c3                   	ret    

00000498 <getpinfo>:
SYSCALL(getpinfo)
 498:	b8 16 00 00 00       	mov    $0x16,%eax
 49d:	cd 40                	int    $0x40
 49f:	c3                   	ret    

000004a0 <settickets>:
SYSCALL(settickets)
 4a0:	b8 17 00 00 00       	mov    $0x17,%eax
 4a5:	cd 40                	int    $0x40
 4a7:	c3                   	ret    

000004a8 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4a8:	55                   	push   %ebp
 4a9:	89 e5                	mov    %esp,%ebp
 4ab:	83 ec 18             	sub    $0x18,%esp
 4ae:	8b 45 0c             	mov    0xc(%ebp),%eax
 4b1:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 4b4:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4bb:	00 
 4bc:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4bf:	89 44 24 04          	mov    %eax,0x4(%esp)
 4c3:	8b 45 08             	mov    0x8(%ebp),%eax
 4c6:	89 04 24             	mov    %eax,(%esp)
 4c9:	e8 4a ff ff ff       	call   418 <write>
}
 4ce:	c9                   	leave  
 4cf:	c3                   	ret    

000004d0 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4d0:	55                   	push   %ebp
 4d1:	89 e5                	mov    %esp,%ebp
 4d3:	56                   	push   %esi
 4d4:	53                   	push   %ebx
 4d5:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 4d8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 4df:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 4e3:	74 17                	je     4fc <printint+0x2c>
 4e5:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 4e9:	79 11                	jns    4fc <printint+0x2c>
    neg = 1;
 4eb:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 4f2:	8b 45 0c             	mov    0xc(%ebp),%eax
 4f5:	f7 d8                	neg    %eax
 4f7:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4fa:	eb 06                	jmp    502 <printint+0x32>
  } else {
    x = xx;
 4fc:	8b 45 0c             	mov    0xc(%ebp),%eax
 4ff:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 502:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 509:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 50c:	8d 41 01             	lea    0x1(%ecx),%eax
 50f:	89 45 f4             	mov    %eax,-0xc(%ebp)
 512:	8b 5d 10             	mov    0x10(%ebp),%ebx
 515:	8b 45 ec             	mov    -0x14(%ebp),%eax
 518:	ba 00 00 00 00       	mov    $0x0,%edx
 51d:	f7 f3                	div    %ebx
 51f:	89 d0                	mov    %edx,%eax
 521:	0f b6 80 f8 0b 00 00 	movzbl 0xbf8(%eax),%eax
 528:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 52c:	8b 75 10             	mov    0x10(%ebp),%esi
 52f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 532:	ba 00 00 00 00       	mov    $0x0,%edx
 537:	f7 f6                	div    %esi
 539:	89 45 ec             	mov    %eax,-0x14(%ebp)
 53c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 540:	75 c7                	jne    509 <printint+0x39>
  if(neg)
 542:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 546:	74 10                	je     558 <printint+0x88>
    buf[i++] = '-';
 548:	8b 45 f4             	mov    -0xc(%ebp),%eax
 54b:	8d 50 01             	lea    0x1(%eax),%edx
 54e:	89 55 f4             	mov    %edx,-0xc(%ebp)
 551:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 556:	eb 1f                	jmp    577 <printint+0xa7>
 558:	eb 1d                	jmp    577 <printint+0xa7>
    putc(fd, buf[i]);
 55a:	8d 55 dc             	lea    -0x24(%ebp),%edx
 55d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 560:	01 d0                	add    %edx,%eax
 562:	0f b6 00             	movzbl (%eax),%eax
 565:	0f be c0             	movsbl %al,%eax
 568:	89 44 24 04          	mov    %eax,0x4(%esp)
 56c:	8b 45 08             	mov    0x8(%ebp),%eax
 56f:	89 04 24             	mov    %eax,(%esp)
 572:	e8 31 ff ff ff       	call   4a8 <putc>
  while(--i >= 0)
 577:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 57b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 57f:	79 d9                	jns    55a <printint+0x8a>
}
 581:	83 c4 30             	add    $0x30,%esp
 584:	5b                   	pop    %ebx
 585:	5e                   	pop    %esi
 586:	5d                   	pop    %ebp
 587:	c3                   	ret    

00000588 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 588:	55                   	push   %ebp
 589:	89 e5                	mov    %esp,%ebp
 58b:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 58e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 595:	8d 45 0c             	lea    0xc(%ebp),%eax
 598:	83 c0 04             	add    $0x4,%eax
 59b:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 59e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 5a5:	e9 7c 01 00 00       	jmp    726 <printf+0x19e>
    c = fmt[i] & 0xff;
 5aa:	8b 55 0c             	mov    0xc(%ebp),%edx
 5ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5b0:	01 d0                	add    %edx,%eax
 5b2:	0f b6 00             	movzbl (%eax),%eax
 5b5:	0f be c0             	movsbl %al,%eax
 5b8:	25 ff 00 00 00       	and    $0xff,%eax
 5bd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 5c0:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5c4:	75 2c                	jne    5f2 <printf+0x6a>
      if(c == '%'){
 5c6:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5ca:	75 0c                	jne    5d8 <printf+0x50>
        state = '%';
 5cc:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 5d3:	e9 4a 01 00 00       	jmp    722 <printf+0x19a>
      } else {
        putc(fd, c);
 5d8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5db:	0f be c0             	movsbl %al,%eax
 5de:	89 44 24 04          	mov    %eax,0x4(%esp)
 5e2:	8b 45 08             	mov    0x8(%ebp),%eax
 5e5:	89 04 24             	mov    %eax,(%esp)
 5e8:	e8 bb fe ff ff       	call   4a8 <putc>
 5ed:	e9 30 01 00 00       	jmp    722 <printf+0x19a>
      }
    } else if(state == '%'){
 5f2:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 5f6:	0f 85 26 01 00 00    	jne    722 <printf+0x19a>
      if(c == 'd'){
 5fc:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 600:	75 2d                	jne    62f <printf+0xa7>
        printint(fd, *ap, 10, 1);
 602:	8b 45 e8             	mov    -0x18(%ebp),%eax
 605:	8b 00                	mov    (%eax),%eax
 607:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 60e:	00 
 60f:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 616:	00 
 617:	89 44 24 04          	mov    %eax,0x4(%esp)
 61b:	8b 45 08             	mov    0x8(%ebp),%eax
 61e:	89 04 24             	mov    %eax,(%esp)
 621:	e8 aa fe ff ff       	call   4d0 <printint>
        ap++;
 626:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 62a:	e9 ec 00 00 00       	jmp    71b <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 62f:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 633:	74 06                	je     63b <printf+0xb3>
 635:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 639:	75 2d                	jne    668 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 63b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 63e:	8b 00                	mov    (%eax),%eax
 640:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 647:	00 
 648:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 64f:	00 
 650:	89 44 24 04          	mov    %eax,0x4(%esp)
 654:	8b 45 08             	mov    0x8(%ebp),%eax
 657:	89 04 24             	mov    %eax,(%esp)
 65a:	e8 71 fe ff ff       	call   4d0 <printint>
        ap++;
 65f:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 663:	e9 b3 00 00 00       	jmp    71b <printf+0x193>
      } else if(c == 's'){
 668:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 66c:	75 45                	jne    6b3 <printf+0x12b>
        s = (char*)*ap;
 66e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 671:	8b 00                	mov    (%eax),%eax
 673:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 676:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 67a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 67e:	75 09                	jne    689 <printf+0x101>
          s = "(null)";
 680:	c7 45 f4 7a 09 00 00 	movl   $0x97a,-0xc(%ebp)
        while(*s != 0){
 687:	eb 1e                	jmp    6a7 <printf+0x11f>
 689:	eb 1c                	jmp    6a7 <printf+0x11f>
          putc(fd, *s);
 68b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 68e:	0f b6 00             	movzbl (%eax),%eax
 691:	0f be c0             	movsbl %al,%eax
 694:	89 44 24 04          	mov    %eax,0x4(%esp)
 698:	8b 45 08             	mov    0x8(%ebp),%eax
 69b:	89 04 24             	mov    %eax,(%esp)
 69e:	e8 05 fe ff ff       	call   4a8 <putc>
          s++;
 6a3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 6a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6aa:	0f b6 00             	movzbl (%eax),%eax
 6ad:	84 c0                	test   %al,%al
 6af:	75 da                	jne    68b <printf+0x103>
 6b1:	eb 68                	jmp    71b <printf+0x193>
        }
      } else if(c == 'c'){
 6b3:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 6b7:	75 1d                	jne    6d6 <printf+0x14e>
        putc(fd, *ap);
 6b9:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6bc:	8b 00                	mov    (%eax),%eax
 6be:	0f be c0             	movsbl %al,%eax
 6c1:	89 44 24 04          	mov    %eax,0x4(%esp)
 6c5:	8b 45 08             	mov    0x8(%ebp),%eax
 6c8:	89 04 24             	mov    %eax,(%esp)
 6cb:	e8 d8 fd ff ff       	call   4a8 <putc>
        ap++;
 6d0:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6d4:	eb 45                	jmp    71b <printf+0x193>
      } else if(c == '%'){
 6d6:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 6da:	75 17                	jne    6f3 <printf+0x16b>
        putc(fd, c);
 6dc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6df:	0f be c0             	movsbl %al,%eax
 6e2:	89 44 24 04          	mov    %eax,0x4(%esp)
 6e6:	8b 45 08             	mov    0x8(%ebp),%eax
 6e9:	89 04 24             	mov    %eax,(%esp)
 6ec:	e8 b7 fd ff ff       	call   4a8 <putc>
 6f1:	eb 28                	jmp    71b <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 6f3:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 6fa:	00 
 6fb:	8b 45 08             	mov    0x8(%ebp),%eax
 6fe:	89 04 24             	mov    %eax,(%esp)
 701:	e8 a2 fd ff ff       	call   4a8 <putc>
        putc(fd, c);
 706:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 709:	0f be c0             	movsbl %al,%eax
 70c:	89 44 24 04          	mov    %eax,0x4(%esp)
 710:	8b 45 08             	mov    0x8(%ebp),%eax
 713:	89 04 24             	mov    %eax,(%esp)
 716:	e8 8d fd ff ff       	call   4a8 <putc>
      }
      state = 0;
 71b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 722:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 726:	8b 55 0c             	mov    0xc(%ebp),%edx
 729:	8b 45 f0             	mov    -0x10(%ebp),%eax
 72c:	01 d0                	add    %edx,%eax
 72e:	0f b6 00             	movzbl (%eax),%eax
 731:	84 c0                	test   %al,%al
 733:	0f 85 71 fe ff ff    	jne    5aa <printf+0x22>
    }
  }
}
 739:	c9                   	leave  
 73a:	c3                   	ret    

0000073b <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 73b:	55                   	push   %ebp
 73c:	89 e5                	mov    %esp,%ebp
 73e:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 741:	8b 45 08             	mov    0x8(%ebp),%eax
 744:	83 e8 08             	sub    $0x8,%eax
 747:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 74a:	a1 14 0c 00 00       	mov    0xc14,%eax
 74f:	89 45 fc             	mov    %eax,-0x4(%ebp)
 752:	eb 24                	jmp    778 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 754:	8b 45 fc             	mov    -0x4(%ebp),%eax
 757:	8b 00                	mov    (%eax),%eax
 759:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 75c:	77 12                	ja     770 <free+0x35>
 75e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 761:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 764:	77 24                	ja     78a <free+0x4f>
 766:	8b 45 fc             	mov    -0x4(%ebp),%eax
 769:	8b 00                	mov    (%eax),%eax
 76b:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 76e:	77 1a                	ja     78a <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 770:	8b 45 fc             	mov    -0x4(%ebp),%eax
 773:	8b 00                	mov    (%eax),%eax
 775:	89 45 fc             	mov    %eax,-0x4(%ebp)
 778:	8b 45 f8             	mov    -0x8(%ebp),%eax
 77b:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 77e:	76 d4                	jbe    754 <free+0x19>
 780:	8b 45 fc             	mov    -0x4(%ebp),%eax
 783:	8b 00                	mov    (%eax),%eax
 785:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 788:	76 ca                	jbe    754 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 78a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 78d:	8b 40 04             	mov    0x4(%eax),%eax
 790:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 797:	8b 45 f8             	mov    -0x8(%ebp),%eax
 79a:	01 c2                	add    %eax,%edx
 79c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 79f:	8b 00                	mov    (%eax),%eax
 7a1:	39 c2                	cmp    %eax,%edx
 7a3:	75 24                	jne    7c9 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 7a5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7a8:	8b 50 04             	mov    0x4(%eax),%edx
 7ab:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ae:	8b 00                	mov    (%eax),%eax
 7b0:	8b 40 04             	mov    0x4(%eax),%eax
 7b3:	01 c2                	add    %eax,%edx
 7b5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7b8:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 7bb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7be:	8b 00                	mov    (%eax),%eax
 7c0:	8b 10                	mov    (%eax),%edx
 7c2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7c5:	89 10                	mov    %edx,(%eax)
 7c7:	eb 0a                	jmp    7d3 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 7c9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7cc:	8b 10                	mov    (%eax),%edx
 7ce:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7d1:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 7d3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d6:	8b 40 04             	mov    0x4(%eax),%eax
 7d9:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7e0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e3:	01 d0                	add    %edx,%eax
 7e5:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7e8:	75 20                	jne    80a <free+0xcf>
    p->s.size += bp->s.size;
 7ea:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ed:	8b 50 04             	mov    0x4(%eax),%edx
 7f0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7f3:	8b 40 04             	mov    0x4(%eax),%eax
 7f6:	01 c2                	add    %eax,%edx
 7f8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7fb:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7fe:	8b 45 f8             	mov    -0x8(%ebp),%eax
 801:	8b 10                	mov    (%eax),%edx
 803:	8b 45 fc             	mov    -0x4(%ebp),%eax
 806:	89 10                	mov    %edx,(%eax)
 808:	eb 08                	jmp    812 <free+0xd7>
  } else
    p->s.ptr = bp;
 80a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80d:	8b 55 f8             	mov    -0x8(%ebp),%edx
 810:	89 10                	mov    %edx,(%eax)
  freep = p;
 812:	8b 45 fc             	mov    -0x4(%ebp),%eax
 815:	a3 14 0c 00 00       	mov    %eax,0xc14
}
 81a:	c9                   	leave  
 81b:	c3                   	ret    

0000081c <morecore>:

static Header*
morecore(uint nu)
{
 81c:	55                   	push   %ebp
 81d:	89 e5                	mov    %esp,%ebp
 81f:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 822:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 829:	77 07                	ja     832 <morecore+0x16>
    nu = 4096;
 82b:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 832:	8b 45 08             	mov    0x8(%ebp),%eax
 835:	c1 e0 03             	shl    $0x3,%eax
 838:	89 04 24             	mov    %eax,(%esp)
 83b:	e8 40 fc ff ff       	call   480 <sbrk>
 840:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 843:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 847:	75 07                	jne    850 <morecore+0x34>
    return 0;
 849:	b8 00 00 00 00       	mov    $0x0,%eax
 84e:	eb 22                	jmp    872 <morecore+0x56>
  hp = (Header*)p;
 850:	8b 45 f4             	mov    -0xc(%ebp),%eax
 853:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 856:	8b 45 f0             	mov    -0x10(%ebp),%eax
 859:	8b 55 08             	mov    0x8(%ebp),%edx
 85c:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 85f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 862:	83 c0 08             	add    $0x8,%eax
 865:	89 04 24             	mov    %eax,(%esp)
 868:	e8 ce fe ff ff       	call   73b <free>
  return freep;
 86d:	a1 14 0c 00 00       	mov    0xc14,%eax
}
 872:	c9                   	leave  
 873:	c3                   	ret    

00000874 <malloc>:

void*
malloc(uint nbytes)
{
 874:	55                   	push   %ebp
 875:	89 e5                	mov    %esp,%ebp
 877:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 87a:	8b 45 08             	mov    0x8(%ebp),%eax
 87d:	83 c0 07             	add    $0x7,%eax
 880:	c1 e8 03             	shr    $0x3,%eax
 883:	83 c0 01             	add    $0x1,%eax
 886:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 889:	a1 14 0c 00 00       	mov    0xc14,%eax
 88e:	89 45 f0             	mov    %eax,-0x10(%ebp)
 891:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 895:	75 23                	jne    8ba <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 897:	c7 45 f0 0c 0c 00 00 	movl   $0xc0c,-0x10(%ebp)
 89e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8a1:	a3 14 0c 00 00       	mov    %eax,0xc14
 8a6:	a1 14 0c 00 00       	mov    0xc14,%eax
 8ab:	a3 0c 0c 00 00       	mov    %eax,0xc0c
    base.s.size = 0;
 8b0:	c7 05 10 0c 00 00 00 	movl   $0x0,0xc10
 8b7:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8ba:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8bd:	8b 00                	mov    (%eax),%eax
 8bf:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 8c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8c5:	8b 40 04             	mov    0x4(%eax),%eax
 8c8:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8cb:	72 4d                	jb     91a <malloc+0xa6>
      if(p->s.size == nunits)
 8cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8d0:	8b 40 04             	mov    0x4(%eax),%eax
 8d3:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8d6:	75 0c                	jne    8e4 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 8d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8db:	8b 10                	mov    (%eax),%edx
 8dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8e0:	89 10                	mov    %edx,(%eax)
 8e2:	eb 26                	jmp    90a <malloc+0x96>
      else {
        p->s.size -= nunits;
 8e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8e7:	8b 40 04             	mov    0x4(%eax),%eax
 8ea:	2b 45 ec             	sub    -0x14(%ebp),%eax
 8ed:	89 c2                	mov    %eax,%edx
 8ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8f2:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8f8:	8b 40 04             	mov    0x4(%eax),%eax
 8fb:	c1 e0 03             	shl    $0x3,%eax
 8fe:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 901:	8b 45 f4             	mov    -0xc(%ebp),%eax
 904:	8b 55 ec             	mov    -0x14(%ebp),%edx
 907:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 90a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 90d:	a3 14 0c 00 00       	mov    %eax,0xc14
      return (void*)(p + 1);
 912:	8b 45 f4             	mov    -0xc(%ebp),%eax
 915:	83 c0 08             	add    $0x8,%eax
 918:	eb 38                	jmp    952 <malloc+0xde>
    }
    if(p == freep)
 91a:	a1 14 0c 00 00       	mov    0xc14,%eax
 91f:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 922:	75 1b                	jne    93f <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 924:	8b 45 ec             	mov    -0x14(%ebp),%eax
 927:	89 04 24             	mov    %eax,(%esp)
 92a:	e8 ed fe ff ff       	call   81c <morecore>
 92f:	89 45 f4             	mov    %eax,-0xc(%ebp)
 932:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 936:	75 07                	jne    93f <malloc+0xcb>
        return 0;
 938:	b8 00 00 00 00       	mov    $0x0,%eax
 93d:	eb 13                	jmp    952 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 93f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 942:	89 45 f0             	mov    %eax,-0x10(%ebp)
 945:	8b 45 f4             	mov    -0xc(%ebp),%eax
 948:	8b 00                	mov    (%eax),%eax
 94a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 94d:	e9 70 ff ff ff       	jmp    8c2 <malloc+0x4e>
}
 952:	c9                   	leave  
 953:	c3                   	ret    
