
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
   9:	e8 7a 02 00 00       	call   288 <fork>
   e:	85 c0                	test   %eax,%eax
  10:	7e 0c                	jle    1e <main+0x1e>
    sleep(5);  // Let child exit before parent.
  12:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
  19:	e8 02 03 00 00       	call   320 <sleep>
  exit();
  1e:	e8 6d 02 00 00       	call   290 <exit>

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
#include "stat.h"
#include "fcntl.h"
#include "user.h"
#include "x86.h"

void ps(){
  48:	55                   	push   %ebp
  49:	89 e5                	mov    %esp,%ebp
  
 //  pstatTable * pst = getpinfo
}
  4b:	5d                   	pop    %ebp
  4c:	c3                   	ret    

0000004d <strcpy>:

char*
strcpy(char *s, const char *t)
{
  4d:	55                   	push   %ebp
  4e:	89 e5                	mov    %esp,%ebp
  50:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  53:	8b 45 08             	mov    0x8(%ebp),%eax
  56:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  59:	90                   	nop
  5a:	8b 45 08             	mov    0x8(%ebp),%eax
  5d:	8d 50 01             	lea    0x1(%eax),%edx
  60:	89 55 08             	mov    %edx,0x8(%ebp)
  63:	8b 55 0c             	mov    0xc(%ebp),%edx
  66:	8d 4a 01             	lea    0x1(%edx),%ecx
  69:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  6c:	0f b6 12             	movzbl (%edx),%edx
  6f:	88 10                	mov    %dl,(%eax)
  71:	0f b6 00             	movzbl (%eax),%eax
  74:	84 c0                	test   %al,%al
  76:	75 e2                	jne    5a <strcpy+0xd>
    ;
  return os;
  78:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  7b:	c9                   	leave  
  7c:	c3                   	ret    

0000007d <strcmp>:

int
strcmp(const char *p, const char *q)
{
  7d:	55                   	push   %ebp
  7e:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  80:	eb 08                	jmp    8a <strcmp+0xd>
    p++, q++;
  82:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  86:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
  8a:	8b 45 08             	mov    0x8(%ebp),%eax
  8d:	0f b6 00             	movzbl (%eax),%eax
  90:	84 c0                	test   %al,%al
  92:	74 10                	je     a4 <strcmp+0x27>
  94:	8b 45 08             	mov    0x8(%ebp),%eax
  97:	0f b6 10             	movzbl (%eax),%edx
  9a:	8b 45 0c             	mov    0xc(%ebp),%eax
  9d:	0f b6 00             	movzbl (%eax),%eax
  a0:	38 c2                	cmp    %al,%dl
  a2:	74 de                	je     82 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
  a4:	8b 45 08             	mov    0x8(%ebp),%eax
  a7:	0f b6 00             	movzbl (%eax),%eax
  aa:	0f b6 d0             	movzbl %al,%edx
  ad:	8b 45 0c             	mov    0xc(%ebp),%eax
  b0:	0f b6 00             	movzbl (%eax),%eax
  b3:	0f b6 c0             	movzbl %al,%eax
  b6:	29 c2                	sub    %eax,%edx
  b8:	89 d0                	mov    %edx,%eax
}
  ba:	5d                   	pop    %ebp
  bb:	c3                   	ret    

000000bc <strlen>:

uint
strlen(const char *s)
{
  bc:	55                   	push   %ebp
  bd:	89 e5                	mov    %esp,%ebp
  bf:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
  c2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  c9:	eb 04                	jmp    cf <strlen+0x13>
  cb:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  cf:	8b 55 fc             	mov    -0x4(%ebp),%edx
  d2:	8b 45 08             	mov    0x8(%ebp),%eax
  d5:	01 d0                	add    %edx,%eax
  d7:	0f b6 00             	movzbl (%eax),%eax
  da:	84 c0                	test   %al,%al
  dc:	75 ed                	jne    cb <strlen+0xf>
    ;
  return n;
  de:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  e1:	c9                   	leave  
  e2:	c3                   	ret    

000000e3 <memset>:

void*
memset(void *dst, int c, uint n)
{
  e3:	55                   	push   %ebp
  e4:	89 e5                	mov    %esp,%ebp
  e6:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
  e9:	8b 45 10             	mov    0x10(%ebp),%eax
  ec:	89 44 24 08          	mov    %eax,0x8(%esp)
  f0:	8b 45 0c             	mov    0xc(%ebp),%eax
  f3:	89 44 24 04          	mov    %eax,0x4(%esp)
  f7:	8b 45 08             	mov    0x8(%ebp),%eax
  fa:	89 04 24             	mov    %eax,(%esp)
  fd:	e8 21 ff ff ff       	call   23 <stosb>
  return dst;
 102:	8b 45 08             	mov    0x8(%ebp),%eax
}
 105:	c9                   	leave  
 106:	c3                   	ret    

00000107 <strchr>:

char*
strchr(const char *s, char c)
{
 107:	55                   	push   %ebp
 108:	89 e5                	mov    %esp,%ebp
 10a:	83 ec 04             	sub    $0x4,%esp
 10d:	8b 45 0c             	mov    0xc(%ebp),%eax
 110:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 113:	eb 14                	jmp    129 <strchr+0x22>
    if(*s == c)
 115:	8b 45 08             	mov    0x8(%ebp),%eax
 118:	0f b6 00             	movzbl (%eax),%eax
 11b:	3a 45 fc             	cmp    -0x4(%ebp),%al
 11e:	75 05                	jne    125 <strchr+0x1e>
      return (char*)s;
 120:	8b 45 08             	mov    0x8(%ebp),%eax
 123:	eb 13                	jmp    138 <strchr+0x31>
  for(; *s; s++)
 125:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 129:	8b 45 08             	mov    0x8(%ebp),%eax
 12c:	0f b6 00             	movzbl (%eax),%eax
 12f:	84 c0                	test   %al,%al
 131:	75 e2                	jne    115 <strchr+0xe>
  return 0;
 133:	b8 00 00 00 00       	mov    $0x0,%eax
}
 138:	c9                   	leave  
 139:	c3                   	ret    

0000013a <gets>:

char*
gets(char *buf, int max)
{
 13a:	55                   	push   %ebp
 13b:	89 e5                	mov    %esp,%ebp
 13d:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 140:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 147:	eb 4c                	jmp    195 <gets+0x5b>
    cc = read(0, &c, 1);
 149:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 150:	00 
 151:	8d 45 ef             	lea    -0x11(%ebp),%eax
 154:	89 44 24 04          	mov    %eax,0x4(%esp)
 158:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 15f:	e8 44 01 00 00       	call   2a8 <read>
 164:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 167:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 16b:	7f 02                	jg     16f <gets+0x35>
      break;
 16d:	eb 31                	jmp    1a0 <gets+0x66>
    buf[i++] = c;
 16f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 172:	8d 50 01             	lea    0x1(%eax),%edx
 175:	89 55 f4             	mov    %edx,-0xc(%ebp)
 178:	89 c2                	mov    %eax,%edx
 17a:	8b 45 08             	mov    0x8(%ebp),%eax
 17d:	01 c2                	add    %eax,%edx
 17f:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 183:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 185:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 189:	3c 0a                	cmp    $0xa,%al
 18b:	74 13                	je     1a0 <gets+0x66>
 18d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 191:	3c 0d                	cmp    $0xd,%al
 193:	74 0b                	je     1a0 <gets+0x66>
  for(i=0; i+1 < max; ){
 195:	8b 45 f4             	mov    -0xc(%ebp),%eax
 198:	83 c0 01             	add    $0x1,%eax
 19b:	3b 45 0c             	cmp    0xc(%ebp),%eax
 19e:	7c a9                	jl     149 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 1a0:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1a3:	8b 45 08             	mov    0x8(%ebp),%eax
 1a6:	01 d0                	add    %edx,%eax
 1a8:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1ab:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1ae:	c9                   	leave  
 1af:	c3                   	ret    

000001b0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1b6:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1bd:	00 
 1be:	8b 45 08             	mov    0x8(%ebp),%eax
 1c1:	89 04 24             	mov    %eax,(%esp)
 1c4:	e8 07 01 00 00       	call   2d0 <open>
 1c9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 1cc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1d0:	79 07                	jns    1d9 <stat+0x29>
    return -1;
 1d2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1d7:	eb 23                	jmp    1fc <stat+0x4c>
  r = fstat(fd, st);
 1d9:	8b 45 0c             	mov    0xc(%ebp),%eax
 1dc:	89 44 24 04          	mov    %eax,0x4(%esp)
 1e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1e3:	89 04 24             	mov    %eax,(%esp)
 1e6:	e8 fd 00 00 00       	call   2e8 <fstat>
 1eb:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 1ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1f1:	89 04 24             	mov    %eax,(%esp)
 1f4:	e8 bf 00 00 00       	call   2b8 <close>
  return r;
 1f9:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 1fc:	c9                   	leave  
 1fd:	c3                   	ret    

000001fe <atoi>:

int
atoi(const char *s)
{
 1fe:	55                   	push   %ebp
 1ff:	89 e5                	mov    %esp,%ebp
 201:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 204:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 20b:	eb 25                	jmp    232 <atoi+0x34>
    n = n*10 + *s++ - '0';
 20d:	8b 55 fc             	mov    -0x4(%ebp),%edx
 210:	89 d0                	mov    %edx,%eax
 212:	c1 e0 02             	shl    $0x2,%eax
 215:	01 d0                	add    %edx,%eax
 217:	01 c0                	add    %eax,%eax
 219:	89 c1                	mov    %eax,%ecx
 21b:	8b 45 08             	mov    0x8(%ebp),%eax
 21e:	8d 50 01             	lea    0x1(%eax),%edx
 221:	89 55 08             	mov    %edx,0x8(%ebp)
 224:	0f b6 00             	movzbl (%eax),%eax
 227:	0f be c0             	movsbl %al,%eax
 22a:	01 c8                	add    %ecx,%eax
 22c:	83 e8 30             	sub    $0x30,%eax
 22f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 232:	8b 45 08             	mov    0x8(%ebp),%eax
 235:	0f b6 00             	movzbl (%eax),%eax
 238:	3c 2f                	cmp    $0x2f,%al
 23a:	7e 0a                	jle    246 <atoi+0x48>
 23c:	8b 45 08             	mov    0x8(%ebp),%eax
 23f:	0f b6 00             	movzbl (%eax),%eax
 242:	3c 39                	cmp    $0x39,%al
 244:	7e c7                	jle    20d <atoi+0xf>
  return n;
 246:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 249:	c9                   	leave  
 24a:	c3                   	ret    

0000024b <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 24b:	55                   	push   %ebp
 24c:	89 e5                	mov    %esp,%ebp
 24e:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 251:	8b 45 08             	mov    0x8(%ebp),%eax
 254:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 257:	8b 45 0c             	mov    0xc(%ebp),%eax
 25a:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 25d:	eb 17                	jmp    276 <memmove+0x2b>
    *dst++ = *src++;
 25f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 262:	8d 50 01             	lea    0x1(%eax),%edx
 265:	89 55 fc             	mov    %edx,-0x4(%ebp)
 268:	8b 55 f8             	mov    -0x8(%ebp),%edx
 26b:	8d 4a 01             	lea    0x1(%edx),%ecx
 26e:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 271:	0f b6 12             	movzbl (%edx),%edx
 274:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 276:	8b 45 10             	mov    0x10(%ebp),%eax
 279:	8d 50 ff             	lea    -0x1(%eax),%edx
 27c:	89 55 10             	mov    %edx,0x10(%ebp)
 27f:	85 c0                	test   %eax,%eax
 281:	7f dc                	jg     25f <memmove+0x14>
  return vdst;
 283:	8b 45 08             	mov    0x8(%ebp),%eax
}
 286:	c9                   	leave  
 287:	c3                   	ret    

00000288 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 288:	b8 01 00 00 00       	mov    $0x1,%eax
 28d:	cd 40                	int    $0x40
 28f:	c3                   	ret    

00000290 <exit>:
SYSCALL(exit)
 290:	b8 02 00 00 00       	mov    $0x2,%eax
 295:	cd 40                	int    $0x40
 297:	c3                   	ret    

00000298 <wait>:
SYSCALL(wait)
 298:	b8 03 00 00 00       	mov    $0x3,%eax
 29d:	cd 40                	int    $0x40
 29f:	c3                   	ret    

000002a0 <pipe>:
SYSCALL(pipe)
 2a0:	b8 04 00 00 00       	mov    $0x4,%eax
 2a5:	cd 40                	int    $0x40
 2a7:	c3                   	ret    

000002a8 <read>:
SYSCALL(read)
 2a8:	b8 05 00 00 00       	mov    $0x5,%eax
 2ad:	cd 40                	int    $0x40
 2af:	c3                   	ret    

000002b0 <write>:
SYSCALL(write)
 2b0:	b8 10 00 00 00       	mov    $0x10,%eax
 2b5:	cd 40                	int    $0x40
 2b7:	c3                   	ret    

000002b8 <close>:
SYSCALL(close)
 2b8:	b8 15 00 00 00       	mov    $0x15,%eax
 2bd:	cd 40                	int    $0x40
 2bf:	c3                   	ret    

000002c0 <kill>:
SYSCALL(kill)
 2c0:	b8 06 00 00 00       	mov    $0x6,%eax
 2c5:	cd 40                	int    $0x40
 2c7:	c3                   	ret    

000002c8 <exec>:
SYSCALL(exec)
 2c8:	b8 07 00 00 00       	mov    $0x7,%eax
 2cd:	cd 40                	int    $0x40
 2cf:	c3                   	ret    

000002d0 <open>:
SYSCALL(open)
 2d0:	b8 0f 00 00 00       	mov    $0xf,%eax
 2d5:	cd 40                	int    $0x40
 2d7:	c3                   	ret    

000002d8 <mknod>:
SYSCALL(mknod)
 2d8:	b8 11 00 00 00       	mov    $0x11,%eax
 2dd:	cd 40                	int    $0x40
 2df:	c3                   	ret    

000002e0 <unlink>:
SYSCALL(unlink)
 2e0:	b8 12 00 00 00       	mov    $0x12,%eax
 2e5:	cd 40                	int    $0x40
 2e7:	c3                   	ret    

000002e8 <fstat>:
SYSCALL(fstat)
 2e8:	b8 08 00 00 00       	mov    $0x8,%eax
 2ed:	cd 40                	int    $0x40
 2ef:	c3                   	ret    

000002f0 <link>:
SYSCALL(link)
 2f0:	b8 13 00 00 00       	mov    $0x13,%eax
 2f5:	cd 40                	int    $0x40
 2f7:	c3                   	ret    

000002f8 <mkdir>:
SYSCALL(mkdir)
 2f8:	b8 14 00 00 00       	mov    $0x14,%eax
 2fd:	cd 40                	int    $0x40
 2ff:	c3                   	ret    

00000300 <chdir>:
SYSCALL(chdir)
 300:	b8 09 00 00 00       	mov    $0x9,%eax
 305:	cd 40                	int    $0x40
 307:	c3                   	ret    

00000308 <dup>:
SYSCALL(dup)
 308:	b8 0a 00 00 00       	mov    $0xa,%eax
 30d:	cd 40                	int    $0x40
 30f:	c3                   	ret    

00000310 <getpid>:
SYSCALL(getpid)
 310:	b8 0b 00 00 00       	mov    $0xb,%eax
 315:	cd 40                	int    $0x40
 317:	c3                   	ret    

00000318 <sbrk>:
SYSCALL(sbrk)
 318:	b8 0c 00 00 00       	mov    $0xc,%eax
 31d:	cd 40                	int    $0x40
 31f:	c3                   	ret    

00000320 <sleep>:
SYSCALL(sleep)
 320:	b8 0d 00 00 00       	mov    $0xd,%eax
 325:	cd 40                	int    $0x40
 327:	c3                   	ret    

00000328 <uptime>:
SYSCALL(uptime)
 328:	b8 0e 00 00 00       	mov    $0xe,%eax
 32d:	cd 40                	int    $0x40
 32f:	c3                   	ret    

00000330 <getpinfo>:
SYSCALL(getpinfo)
 330:	b8 16 00 00 00       	mov    $0x16,%eax
 335:	cd 40                	int    $0x40
 337:	c3                   	ret    

00000338 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 338:	55                   	push   %ebp
 339:	89 e5                	mov    %esp,%ebp
 33b:	83 ec 18             	sub    $0x18,%esp
 33e:	8b 45 0c             	mov    0xc(%ebp),%eax
 341:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 344:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 34b:	00 
 34c:	8d 45 f4             	lea    -0xc(%ebp),%eax
 34f:	89 44 24 04          	mov    %eax,0x4(%esp)
 353:	8b 45 08             	mov    0x8(%ebp),%eax
 356:	89 04 24             	mov    %eax,(%esp)
 359:	e8 52 ff ff ff       	call   2b0 <write>
}
 35e:	c9                   	leave  
 35f:	c3                   	ret    

00000360 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	56                   	push   %esi
 364:	53                   	push   %ebx
 365:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 368:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 36f:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 373:	74 17                	je     38c <printint+0x2c>
 375:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 379:	79 11                	jns    38c <printint+0x2c>
    neg = 1;
 37b:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 382:	8b 45 0c             	mov    0xc(%ebp),%eax
 385:	f7 d8                	neg    %eax
 387:	89 45 ec             	mov    %eax,-0x14(%ebp)
 38a:	eb 06                	jmp    392 <printint+0x32>
  } else {
    x = xx;
 38c:	8b 45 0c             	mov    0xc(%ebp),%eax
 38f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 392:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 399:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 39c:	8d 41 01             	lea    0x1(%ecx),%eax
 39f:	89 45 f4             	mov    %eax,-0xc(%ebp)
 3a2:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3a5:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3a8:	ba 00 00 00 00       	mov    $0x0,%edx
 3ad:	f7 f3                	div    %ebx
 3af:	89 d0                	mov    %edx,%eax
 3b1:	0f b6 80 50 0a 00 00 	movzbl 0xa50(%eax),%eax
 3b8:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 3bc:	8b 75 10             	mov    0x10(%ebp),%esi
 3bf:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3c2:	ba 00 00 00 00       	mov    $0x0,%edx
 3c7:	f7 f6                	div    %esi
 3c9:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3cc:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 3d0:	75 c7                	jne    399 <printint+0x39>
  if(neg)
 3d2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 3d6:	74 10                	je     3e8 <printint+0x88>
    buf[i++] = '-';
 3d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3db:	8d 50 01             	lea    0x1(%eax),%edx
 3de:	89 55 f4             	mov    %edx,-0xc(%ebp)
 3e1:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 3e6:	eb 1f                	jmp    407 <printint+0xa7>
 3e8:	eb 1d                	jmp    407 <printint+0xa7>
    putc(fd, buf[i]);
 3ea:	8d 55 dc             	lea    -0x24(%ebp),%edx
 3ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3f0:	01 d0                	add    %edx,%eax
 3f2:	0f b6 00             	movzbl (%eax),%eax
 3f5:	0f be c0             	movsbl %al,%eax
 3f8:	89 44 24 04          	mov    %eax,0x4(%esp)
 3fc:	8b 45 08             	mov    0x8(%ebp),%eax
 3ff:	89 04 24             	mov    %eax,(%esp)
 402:	e8 31 ff ff ff       	call   338 <putc>
  while(--i >= 0)
 407:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 40b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 40f:	79 d9                	jns    3ea <printint+0x8a>
}
 411:	83 c4 30             	add    $0x30,%esp
 414:	5b                   	pop    %ebx
 415:	5e                   	pop    %esi
 416:	5d                   	pop    %ebp
 417:	c3                   	ret    

00000418 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 418:	55                   	push   %ebp
 419:	89 e5                	mov    %esp,%ebp
 41b:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 41e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 425:	8d 45 0c             	lea    0xc(%ebp),%eax
 428:	83 c0 04             	add    $0x4,%eax
 42b:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 42e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 435:	e9 7c 01 00 00       	jmp    5b6 <printf+0x19e>
    c = fmt[i] & 0xff;
 43a:	8b 55 0c             	mov    0xc(%ebp),%edx
 43d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 440:	01 d0                	add    %edx,%eax
 442:	0f b6 00             	movzbl (%eax),%eax
 445:	0f be c0             	movsbl %al,%eax
 448:	25 ff 00 00 00       	and    $0xff,%eax
 44d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 450:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 454:	75 2c                	jne    482 <printf+0x6a>
      if(c == '%'){
 456:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 45a:	75 0c                	jne    468 <printf+0x50>
        state = '%';
 45c:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 463:	e9 4a 01 00 00       	jmp    5b2 <printf+0x19a>
      } else {
        putc(fd, c);
 468:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 46b:	0f be c0             	movsbl %al,%eax
 46e:	89 44 24 04          	mov    %eax,0x4(%esp)
 472:	8b 45 08             	mov    0x8(%ebp),%eax
 475:	89 04 24             	mov    %eax,(%esp)
 478:	e8 bb fe ff ff       	call   338 <putc>
 47d:	e9 30 01 00 00       	jmp    5b2 <printf+0x19a>
      }
    } else if(state == '%'){
 482:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 486:	0f 85 26 01 00 00    	jne    5b2 <printf+0x19a>
      if(c == 'd'){
 48c:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 490:	75 2d                	jne    4bf <printf+0xa7>
        printint(fd, *ap, 10, 1);
 492:	8b 45 e8             	mov    -0x18(%ebp),%eax
 495:	8b 00                	mov    (%eax),%eax
 497:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 49e:	00 
 49f:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 4a6:	00 
 4a7:	89 44 24 04          	mov    %eax,0x4(%esp)
 4ab:	8b 45 08             	mov    0x8(%ebp),%eax
 4ae:	89 04 24             	mov    %eax,(%esp)
 4b1:	e8 aa fe ff ff       	call   360 <printint>
        ap++;
 4b6:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4ba:	e9 ec 00 00 00       	jmp    5ab <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 4bf:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 4c3:	74 06                	je     4cb <printf+0xb3>
 4c5:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 4c9:	75 2d                	jne    4f8 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 4cb:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4ce:	8b 00                	mov    (%eax),%eax
 4d0:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 4d7:	00 
 4d8:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 4df:	00 
 4e0:	89 44 24 04          	mov    %eax,0x4(%esp)
 4e4:	8b 45 08             	mov    0x8(%ebp),%eax
 4e7:	89 04 24             	mov    %eax,(%esp)
 4ea:	e8 71 fe ff ff       	call   360 <printint>
        ap++;
 4ef:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4f3:	e9 b3 00 00 00       	jmp    5ab <printf+0x193>
      } else if(c == 's'){
 4f8:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 4fc:	75 45                	jne    543 <printf+0x12b>
        s = (char*)*ap;
 4fe:	8b 45 e8             	mov    -0x18(%ebp),%eax
 501:	8b 00                	mov    (%eax),%eax
 503:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 506:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 50a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 50e:	75 09                	jne    519 <printf+0x101>
          s = "(null)";
 510:	c7 45 f4 e4 07 00 00 	movl   $0x7e4,-0xc(%ebp)
        while(*s != 0){
 517:	eb 1e                	jmp    537 <printf+0x11f>
 519:	eb 1c                	jmp    537 <printf+0x11f>
          putc(fd, *s);
 51b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 51e:	0f b6 00             	movzbl (%eax),%eax
 521:	0f be c0             	movsbl %al,%eax
 524:	89 44 24 04          	mov    %eax,0x4(%esp)
 528:	8b 45 08             	mov    0x8(%ebp),%eax
 52b:	89 04 24             	mov    %eax,(%esp)
 52e:	e8 05 fe ff ff       	call   338 <putc>
          s++;
 533:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 537:	8b 45 f4             	mov    -0xc(%ebp),%eax
 53a:	0f b6 00             	movzbl (%eax),%eax
 53d:	84 c0                	test   %al,%al
 53f:	75 da                	jne    51b <printf+0x103>
 541:	eb 68                	jmp    5ab <printf+0x193>
        }
      } else if(c == 'c'){
 543:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 547:	75 1d                	jne    566 <printf+0x14e>
        putc(fd, *ap);
 549:	8b 45 e8             	mov    -0x18(%ebp),%eax
 54c:	8b 00                	mov    (%eax),%eax
 54e:	0f be c0             	movsbl %al,%eax
 551:	89 44 24 04          	mov    %eax,0x4(%esp)
 555:	8b 45 08             	mov    0x8(%ebp),%eax
 558:	89 04 24             	mov    %eax,(%esp)
 55b:	e8 d8 fd ff ff       	call   338 <putc>
        ap++;
 560:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 564:	eb 45                	jmp    5ab <printf+0x193>
      } else if(c == '%'){
 566:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 56a:	75 17                	jne    583 <printf+0x16b>
        putc(fd, c);
 56c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 56f:	0f be c0             	movsbl %al,%eax
 572:	89 44 24 04          	mov    %eax,0x4(%esp)
 576:	8b 45 08             	mov    0x8(%ebp),%eax
 579:	89 04 24             	mov    %eax,(%esp)
 57c:	e8 b7 fd ff ff       	call   338 <putc>
 581:	eb 28                	jmp    5ab <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 583:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 58a:	00 
 58b:	8b 45 08             	mov    0x8(%ebp),%eax
 58e:	89 04 24             	mov    %eax,(%esp)
 591:	e8 a2 fd ff ff       	call   338 <putc>
        putc(fd, c);
 596:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 599:	0f be c0             	movsbl %al,%eax
 59c:	89 44 24 04          	mov    %eax,0x4(%esp)
 5a0:	8b 45 08             	mov    0x8(%ebp),%eax
 5a3:	89 04 24             	mov    %eax,(%esp)
 5a6:	e8 8d fd ff ff       	call   338 <putc>
      }
      state = 0;
 5ab:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 5b2:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 5b6:	8b 55 0c             	mov    0xc(%ebp),%edx
 5b9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5bc:	01 d0                	add    %edx,%eax
 5be:	0f b6 00             	movzbl (%eax),%eax
 5c1:	84 c0                	test   %al,%al
 5c3:	0f 85 71 fe ff ff    	jne    43a <printf+0x22>
    }
  }
}
 5c9:	c9                   	leave  
 5ca:	c3                   	ret    

000005cb <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5cb:	55                   	push   %ebp
 5cc:	89 e5                	mov    %esp,%ebp
 5ce:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5d1:	8b 45 08             	mov    0x8(%ebp),%eax
 5d4:	83 e8 08             	sub    $0x8,%eax
 5d7:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5da:	a1 6c 0a 00 00       	mov    0xa6c,%eax
 5df:	89 45 fc             	mov    %eax,-0x4(%ebp)
 5e2:	eb 24                	jmp    608 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5e4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5e7:	8b 00                	mov    (%eax),%eax
 5e9:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 5ec:	77 12                	ja     600 <free+0x35>
 5ee:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5f1:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 5f4:	77 24                	ja     61a <free+0x4f>
 5f6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5f9:	8b 00                	mov    (%eax),%eax
 5fb:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 5fe:	77 1a                	ja     61a <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 600:	8b 45 fc             	mov    -0x4(%ebp),%eax
 603:	8b 00                	mov    (%eax),%eax
 605:	89 45 fc             	mov    %eax,-0x4(%ebp)
 608:	8b 45 f8             	mov    -0x8(%ebp),%eax
 60b:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 60e:	76 d4                	jbe    5e4 <free+0x19>
 610:	8b 45 fc             	mov    -0x4(%ebp),%eax
 613:	8b 00                	mov    (%eax),%eax
 615:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 618:	76 ca                	jbe    5e4 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 61a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 61d:	8b 40 04             	mov    0x4(%eax),%eax
 620:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 627:	8b 45 f8             	mov    -0x8(%ebp),%eax
 62a:	01 c2                	add    %eax,%edx
 62c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 62f:	8b 00                	mov    (%eax),%eax
 631:	39 c2                	cmp    %eax,%edx
 633:	75 24                	jne    659 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 635:	8b 45 f8             	mov    -0x8(%ebp),%eax
 638:	8b 50 04             	mov    0x4(%eax),%edx
 63b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 63e:	8b 00                	mov    (%eax),%eax
 640:	8b 40 04             	mov    0x4(%eax),%eax
 643:	01 c2                	add    %eax,%edx
 645:	8b 45 f8             	mov    -0x8(%ebp),%eax
 648:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 64b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 64e:	8b 00                	mov    (%eax),%eax
 650:	8b 10                	mov    (%eax),%edx
 652:	8b 45 f8             	mov    -0x8(%ebp),%eax
 655:	89 10                	mov    %edx,(%eax)
 657:	eb 0a                	jmp    663 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 659:	8b 45 fc             	mov    -0x4(%ebp),%eax
 65c:	8b 10                	mov    (%eax),%edx
 65e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 661:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 663:	8b 45 fc             	mov    -0x4(%ebp),%eax
 666:	8b 40 04             	mov    0x4(%eax),%eax
 669:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 670:	8b 45 fc             	mov    -0x4(%ebp),%eax
 673:	01 d0                	add    %edx,%eax
 675:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 678:	75 20                	jne    69a <free+0xcf>
    p->s.size += bp->s.size;
 67a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 67d:	8b 50 04             	mov    0x4(%eax),%edx
 680:	8b 45 f8             	mov    -0x8(%ebp),%eax
 683:	8b 40 04             	mov    0x4(%eax),%eax
 686:	01 c2                	add    %eax,%edx
 688:	8b 45 fc             	mov    -0x4(%ebp),%eax
 68b:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 68e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 691:	8b 10                	mov    (%eax),%edx
 693:	8b 45 fc             	mov    -0x4(%ebp),%eax
 696:	89 10                	mov    %edx,(%eax)
 698:	eb 08                	jmp    6a2 <free+0xd7>
  } else
    p->s.ptr = bp;
 69a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 69d:	8b 55 f8             	mov    -0x8(%ebp),%edx
 6a0:	89 10                	mov    %edx,(%eax)
  freep = p;
 6a2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a5:	a3 6c 0a 00 00       	mov    %eax,0xa6c
}
 6aa:	c9                   	leave  
 6ab:	c3                   	ret    

000006ac <morecore>:

static Header*
morecore(uint nu)
{
 6ac:	55                   	push   %ebp
 6ad:	89 e5                	mov    %esp,%ebp
 6af:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 6b2:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 6b9:	77 07                	ja     6c2 <morecore+0x16>
    nu = 4096;
 6bb:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 6c2:	8b 45 08             	mov    0x8(%ebp),%eax
 6c5:	c1 e0 03             	shl    $0x3,%eax
 6c8:	89 04 24             	mov    %eax,(%esp)
 6cb:	e8 48 fc ff ff       	call   318 <sbrk>
 6d0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 6d3:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 6d7:	75 07                	jne    6e0 <morecore+0x34>
    return 0;
 6d9:	b8 00 00 00 00       	mov    $0x0,%eax
 6de:	eb 22                	jmp    702 <morecore+0x56>
  hp = (Header*)p;
 6e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6e3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 6e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6e9:	8b 55 08             	mov    0x8(%ebp),%edx
 6ec:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 6ef:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6f2:	83 c0 08             	add    $0x8,%eax
 6f5:	89 04 24             	mov    %eax,(%esp)
 6f8:	e8 ce fe ff ff       	call   5cb <free>
  return freep;
 6fd:	a1 6c 0a 00 00       	mov    0xa6c,%eax
}
 702:	c9                   	leave  
 703:	c3                   	ret    

00000704 <malloc>:

void*
malloc(uint nbytes)
{
 704:	55                   	push   %ebp
 705:	89 e5                	mov    %esp,%ebp
 707:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 70a:	8b 45 08             	mov    0x8(%ebp),%eax
 70d:	83 c0 07             	add    $0x7,%eax
 710:	c1 e8 03             	shr    $0x3,%eax
 713:	83 c0 01             	add    $0x1,%eax
 716:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 719:	a1 6c 0a 00 00       	mov    0xa6c,%eax
 71e:	89 45 f0             	mov    %eax,-0x10(%ebp)
 721:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 725:	75 23                	jne    74a <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 727:	c7 45 f0 64 0a 00 00 	movl   $0xa64,-0x10(%ebp)
 72e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 731:	a3 6c 0a 00 00       	mov    %eax,0xa6c
 736:	a1 6c 0a 00 00       	mov    0xa6c,%eax
 73b:	a3 64 0a 00 00       	mov    %eax,0xa64
    base.s.size = 0;
 740:	c7 05 68 0a 00 00 00 	movl   $0x0,0xa68
 747:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 74a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 74d:	8b 00                	mov    (%eax),%eax
 74f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 752:	8b 45 f4             	mov    -0xc(%ebp),%eax
 755:	8b 40 04             	mov    0x4(%eax),%eax
 758:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 75b:	72 4d                	jb     7aa <malloc+0xa6>
      if(p->s.size == nunits)
 75d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 760:	8b 40 04             	mov    0x4(%eax),%eax
 763:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 766:	75 0c                	jne    774 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 768:	8b 45 f4             	mov    -0xc(%ebp),%eax
 76b:	8b 10                	mov    (%eax),%edx
 76d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 770:	89 10                	mov    %edx,(%eax)
 772:	eb 26                	jmp    79a <malloc+0x96>
      else {
        p->s.size -= nunits;
 774:	8b 45 f4             	mov    -0xc(%ebp),%eax
 777:	8b 40 04             	mov    0x4(%eax),%eax
 77a:	2b 45 ec             	sub    -0x14(%ebp),%eax
 77d:	89 c2                	mov    %eax,%edx
 77f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 782:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 785:	8b 45 f4             	mov    -0xc(%ebp),%eax
 788:	8b 40 04             	mov    0x4(%eax),%eax
 78b:	c1 e0 03             	shl    $0x3,%eax
 78e:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 791:	8b 45 f4             	mov    -0xc(%ebp),%eax
 794:	8b 55 ec             	mov    -0x14(%ebp),%edx
 797:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 79a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 79d:	a3 6c 0a 00 00       	mov    %eax,0xa6c
      return (void*)(p + 1);
 7a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7a5:	83 c0 08             	add    $0x8,%eax
 7a8:	eb 38                	jmp    7e2 <malloc+0xde>
    }
    if(p == freep)
 7aa:	a1 6c 0a 00 00       	mov    0xa6c,%eax
 7af:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 7b2:	75 1b                	jne    7cf <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 7b4:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7b7:	89 04 24             	mov    %eax,(%esp)
 7ba:	e8 ed fe ff ff       	call   6ac <morecore>
 7bf:	89 45 f4             	mov    %eax,-0xc(%ebp)
 7c2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7c6:	75 07                	jne    7cf <malloc+0xcb>
        return 0;
 7c8:	b8 00 00 00 00       	mov    $0x0,%eax
 7cd:	eb 13                	jmp    7e2 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7d2:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7d8:	8b 00                	mov    (%eax),%eax
 7da:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 7dd:	e9 70 ff ff ff       	jmp    752 <malloc+0x4e>
}
 7e2:	c9                   	leave  
 7e3:	c3                   	ret    
