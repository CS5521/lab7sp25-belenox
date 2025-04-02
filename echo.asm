
_echo:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp
  int i;

  for(i = 1; i < argc; i++)
   9:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
  10:	00 
  11:	eb 4b                	jmp    5e <main+0x5e>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  13:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  17:	83 c0 01             	add    $0x1,%eax
  1a:	3b 45 08             	cmp    0x8(%ebp),%eax
  1d:	7d 07                	jge    26 <main+0x26>
  1f:	b8 2d 08 00 00       	mov    $0x82d,%eax
  24:	eb 05                	jmp    2b <main+0x2b>
  26:	b8 2f 08 00 00       	mov    $0x82f,%eax
  2b:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  2f:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
  36:	8b 55 0c             	mov    0xc(%ebp),%edx
  39:	01 ca                	add    %ecx,%edx
  3b:	8b 12                	mov    (%edx),%edx
  3d:	89 44 24 0c          	mov    %eax,0xc(%esp)
  41:	89 54 24 08          	mov    %edx,0x8(%esp)
  45:	c7 44 24 04 31 08 00 	movl   $0x831,0x4(%esp)
  4c:	00 
  4d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  54:	e8 08 04 00 00       	call   461 <printf>
  for(i = 1; i < argc; i++)
  59:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
  5e:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  62:	3b 45 08             	cmp    0x8(%ebp),%eax
  65:	7c ac                	jl     13 <main+0x13>
  exit();
  67:	e8 6d 02 00 00       	call   2d9 <exit>

0000006c <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  6c:	55                   	push   %ebp
  6d:	89 e5                	mov    %esp,%ebp
  6f:	57                   	push   %edi
  70:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  71:	8b 4d 08             	mov    0x8(%ebp),%ecx
  74:	8b 55 10             	mov    0x10(%ebp),%edx
  77:	8b 45 0c             	mov    0xc(%ebp),%eax
  7a:	89 cb                	mov    %ecx,%ebx
  7c:	89 df                	mov    %ebx,%edi
  7e:	89 d1                	mov    %edx,%ecx
  80:	fc                   	cld    
  81:	f3 aa                	rep stos %al,%es:(%edi)
  83:	89 ca                	mov    %ecx,%edx
  85:	89 fb                	mov    %edi,%ebx
  87:	89 5d 08             	mov    %ebx,0x8(%ebp)
  8a:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  8d:	5b                   	pop    %ebx
  8e:	5f                   	pop    %edi
  8f:	5d                   	pop    %ebp
  90:	c3                   	ret    

00000091 <ps>:
#include "stat.h"
#include "fcntl.h"
#include "user.h"
#include "x86.h"

void ps(){
  91:	55                   	push   %ebp
  92:	89 e5                	mov    %esp,%ebp
  
 //  pstatTable * pst = getpinfo
}
  94:	5d                   	pop    %ebp
  95:	c3                   	ret    

00000096 <strcpy>:

char*
strcpy(char *s, const char *t)
{
  96:	55                   	push   %ebp
  97:	89 e5                	mov    %esp,%ebp
  99:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  9c:	8b 45 08             	mov    0x8(%ebp),%eax
  9f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  a2:	90                   	nop
  a3:	8b 45 08             	mov    0x8(%ebp),%eax
  a6:	8d 50 01             	lea    0x1(%eax),%edx
  a9:	89 55 08             	mov    %edx,0x8(%ebp)
  ac:	8b 55 0c             	mov    0xc(%ebp),%edx
  af:	8d 4a 01             	lea    0x1(%edx),%ecx
  b2:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  b5:	0f b6 12             	movzbl (%edx),%edx
  b8:	88 10                	mov    %dl,(%eax)
  ba:	0f b6 00             	movzbl (%eax),%eax
  bd:	84 c0                	test   %al,%al
  bf:	75 e2                	jne    a3 <strcpy+0xd>
    ;
  return os;
  c1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  c4:	c9                   	leave  
  c5:	c3                   	ret    

000000c6 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  c6:	55                   	push   %ebp
  c7:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  c9:	eb 08                	jmp    d3 <strcmp+0xd>
    p++, q++;
  cb:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  cf:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
  d3:	8b 45 08             	mov    0x8(%ebp),%eax
  d6:	0f b6 00             	movzbl (%eax),%eax
  d9:	84 c0                	test   %al,%al
  db:	74 10                	je     ed <strcmp+0x27>
  dd:	8b 45 08             	mov    0x8(%ebp),%eax
  e0:	0f b6 10             	movzbl (%eax),%edx
  e3:	8b 45 0c             	mov    0xc(%ebp),%eax
  e6:	0f b6 00             	movzbl (%eax),%eax
  e9:	38 c2                	cmp    %al,%dl
  eb:	74 de                	je     cb <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
  ed:	8b 45 08             	mov    0x8(%ebp),%eax
  f0:	0f b6 00             	movzbl (%eax),%eax
  f3:	0f b6 d0             	movzbl %al,%edx
  f6:	8b 45 0c             	mov    0xc(%ebp),%eax
  f9:	0f b6 00             	movzbl (%eax),%eax
  fc:	0f b6 c0             	movzbl %al,%eax
  ff:	29 c2                	sub    %eax,%edx
 101:	89 d0                	mov    %edx,%eax
}
 103:	5d                   	pop    %ebp
 104:	c3                   	ret    

00000105 <strlen>:

uint
strlen(const char *s)
{
 105:	55                   	push   %ebp
 106:	89 e5                	mov    %esp,%ebp
 108:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 10b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 112:	eb 04                	jmp    118 <strlen+0x13>
 114:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 118:	8b 55 fc             	mov    -0x4(%ebp),%edx
 11b:	8b 45 08             	mov    0x8(%ebp),%eax
 11e:	01 d0                	add    %edx,%eax
 120:	0f b6 00             	movzbl (%eax),%eax
 123:	84 c0                	test   %al,%al
 125:	75 ed                	jne    114 <strlen+0xf>
    ;
  return n;
 127:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 12a:	c9                   	leave  
 12b:	c3                   	ret    

0000012c <memset>:

void*
memset(void *dst, int c, uint n)
{
 12c:	55                   	push   %ebp
 12d:	89 e5                	mov    %esp,%ebp
 12f:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 132:	8b 45 10             	mov    0x10(%ebp),%eax
 135:	89 44 24 08          	mov    %eax,0x8(%esp)
 139:	8b 45 0c             	mov    0xc(%ebp),%eax
 13c:	89 44 24 04          	mov    %eax,0x4(%esp)
 140:	8b 45 08             	mov    0x8(%ebp),%eax
 143:	89 04 24             	mov    %eax,(%esp)
 146:	e8 21 ff ff ff       	call   6c <stosb>
  return dst;
 14b:	8b 45 08             	mov    0x8(%ebp),%eax
}
 14e:	c9                   	leave  
 14f:	c3                   	ret    

00000150 <strchr>:

char*
strchr(const char *s, char c)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	83 ec 04             	sub    $0x4,%esp
 156:	8b 45 0c             	mov    0xc(%ebp),%eax
 159:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 15c:	eb 14                	jmp    172 <strchr+0x22>
    if(*s == c)
 15e:	8b 45 08             	mov    0x8(%ebp),%eax
 161:	0f b6 00             	movzbl (%eax),%eax
 164:	3a 45 fc             	cmp    -0x4(%ebp),%al
 167:	75 05                	jne    16e <strchr+0x1e>
      return (char*)s;
 169:	8b 45 08             	mov    0x8(%ebp),%eax
 16c:	eb 13                	jmp    181 <strchr+0x31>
  for(; *s; s++)
 16e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 172:	8b 45 08             	mov    0x8(%ebp),%eax
 175:	0f b6 00             	movzbl (%eax),%eax
 178:	84 c0                	test   %al,%al
 17a:	75 e2                	jne    15e <strchr+0xe>
  return 0;
 17c:	b8 00 00 00 00       	mov    $0x0,%eax
}
 181:	c9                   	leave  
 182:	c3                   	ret    

00000183 <gets>:

char*
gets(char *buf, int max)
{
 183:	55                   	push   %ebp
 184:	89 e5                	mov    %esp,%ebp
 186:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 189:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 190:	eb 4c                	jmp    1de <gets+0x5b>
    cc = read(0, &c, 1);
 192:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 199:	00 
 19a:	8d 45 ef             	lea    -0x11(%ebp),%eax
 19d:	89 44 24 04          	mov    %eax,0x4(%esp)
 1a1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1a8:	e8 44 01 00 00       	call   2f1 <read>
 1ad:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1b0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1b4:	7f 02                	jg     1b8 <gets+0x35>
      break;
 1b6:	eb 31                	jmp    1e9 <gets+0x66>
    buf[i++] = c;
 1b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1bb:	8d 50 01             	lea    0x1(%eax),%edx
 1be:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1c1:	89 c2                	mov    %eax,%edx
 1c3:	8b 45 08             	mov    0x8(%ebp),%eax
 1c6:	01 c2                	add    %eax,%edx
 1c8:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1cc:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1ce:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1d2:	3c 0a                	cmp    $0xa,%al
 1d4:	74 13                	je     1e9 <gets+0x66>
 1d6:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1da:	3c 0d                	cmp    $0xd,%al
 1dc:	74 0b                	je     1e9 <gets+0x66>
  for(i=0; i+1 < max; ){
 1de:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1e1:	83 c0 01             	add    $0x1,%eax
 1e4:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1e7:	7c a9                	jl     192 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 1e9:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1ec:	8b 45 08             	mov    0x8(%ebp),%eax
 1ef:	01 d0                	add    %edx,%eax
 1f1:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1f4:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1f7:	c9                   	leave  
 1f8:	c3                   	ret    

000001f9 <stat>:

int
stat(const char *n, struct stat *st)
{
 1f9:	55                   	push   %ebp
 1fa:	89 e5                	mov    %esp,%ebp
 1fc:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1ff:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 206:	00 
 207:	8b 45 08             	mov    0x8(%ebp),%eax
 20a:	89 04 24             	mov    %eax,(%esp)
 20d:	e8 07 01 00 00       	call   319 <open>
 212:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 215:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 219:	79 07                	jns    222 <stat+0x29>
    return -1;
 21b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 220:	eb 23                	jmp    245 <stat+0x4c>
  r = fstat(fd, st);
 222:	8b 45 0c             	mov    0xc(%ebp),%eax
 225:	89 44 24 04          	mov    %eax,0x4(%esp)
 229:	8b 45 f4             	mov    -0xc(%ebp),%eax
 22c:	89 04 24             	mov    %eax,(%esp)
 22f:	e8 fd 00 00 00       	call   331 <fstat>
 234:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 237:	8b 45 f4             	mov    -0xc(%ebp),%eax
 23a:	89 04 24             	mov    %eax,(%esp)
 23d:	e8 bf 00 00 00       	call   301 <close>
  return r;
 242:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 245:	c9                   	leave  
 246:	c3                   	ret    

00000247 <atoi>:

int
atoi(const char *s)
{
 247:	55                   	push   %ebp
 248:	89 e5                	mov    %esp,%ebp
 24a:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 24d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 254:	eb 25                	jmp    27b <atoi+0x34>
    n = n*10 + *s++ - '0';
 256:	8b 55 fc             	mov    -0x4(%ebp),%edx
 259:	89 d0                	mov    %edx,%eax
 25b:	c1 e0 02             	shl    $0x2,%eax
 25e:	01 d0                	add    %edx,%eax
 260:	01 c0                	add    %eax,%eax
 262:	89 c1                	mov    %eax,%ecx
 264:	8b 45 08             	mov    0x8(%ebp),%eax
 267:	8d 50 01             	lea    0x1(%eax),%edx
 26a:	89 55 08             	mov    %edx,0x8(%ebp)
 26d:	0f b6 00             	movzbl (%eax),%eax
 270:	0f be c0             	movsbl %al,%eax
 273:	01 c8                	add    %ecx,%eax
 275:	83 e8 30             	sub    $0x30,%eax
 278:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 27b:	8b 45 08             	mov    0x8(%ebp),%eax
 27e:	0f b6 00             	movzbl (%eax),%eax
 281:	3c 2f                	cmp    $0x2f,%al
 283:	7e 0a                	jle    28f <atoi+0x48>
 285:	8b 45 08             	mov    0x8(%ebp),%eax
 288:	0f b6 00             	movzbl (%eax),%eax
 28b:	3c 39                	cmp    $0x39,%al
 28d:	7e c7                	jle    256 <atoi+0xf>
  return n;
 28f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 292:	c9                   	leave  
 293:	c3                   	ret    

00000294 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 294:	55                   	push   %ebp
 295:	89 e5                	mov    %esp,%ebp
 297:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 29a:	8b 45 08             	mov    0x8(%ebp),%eax
 29d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 2a0:	8b 45 0c             	mov    0xc(%ebp),%eax
 2a3:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 2a6:	eb 17                	jmp    2bf <memmove+0x2b>
    *dst++ = *src++;
 2a8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2ab:	8d 50 01             	lea    0x1(%eax),%edx
 2ae:	89 55 fc             	mov    %edx,-0x4(%ebp)
 2b1:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2b4:	8d 4a 01             	lea    0x1(%edx),%ecx
 2b7:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 2ba:	0f b6 12             	movzbl (%edx),%edx
 2bd:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 2bf:	8b 45 10             	mov    0x10(%ebp),%eax
 2c2:	8d 50 ff             	lea    -0x1(%eax),%edx
 2c5:	89 55 10             	mov    %edx,0x10(%ebp)
 2c8:	85 c0                	test   %eax,%eax
 2ca:	7f dc                	jg     2a8 <memmove+0x14>
  return vdst;
 2cc:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2cf:	c9                   	leave  
 2d0:	c3                   	ret    

000002d1 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2d1:	b8 01 00 00 00       	mov    $0x1,%eax
 2d6:	cd 40                	int    $0x40
 2d8:	c3                   	ret    

000002d9 <exit>:
SYSCALL(exit)
 2d9:	b8 02 00 00 00       	mov    $0x2,%eax
 2de:	cd 40                	int    $0x40
 2e0:	c3                   	ret    

000002e1 <wait>:
SYSCALL(wait)
 2e1:	b8 03 00 00 00       	mov    $0x3,%eax
 2e6:	cd 40                	int    $0x40
 2e8:	c3                   	ret    

000002e9 <pipe>:
SYSCALL(pipe)
 2e9:	b8 04 00 00 00       	mov    $0x4,%eax
 2ee:	cd 40                	int    $0x40
 2f0:	c3                   	ret    

000002f1 <read>:
SYSCALL(read)
 2f1:	b8 05 00 00 00       	mov    $0x5,%eax
 2f6:	cd 40                	int    $0x40
 2f8:	c3                   	ret    

000002f9 <write>:
SYSCALL(write)
 2f9:	b8 10 00 00 00       	mov    $0x10,%eax
 2fe:	cd 40                	int    $0x40
 300:	c3                   	ret    

00000301 <close>:
SYSCALL(close)
 301:	b8 15 00 00 00       	mov    $0x15,%eax
 306:	cd 40                	int    $0x40
 308:	c3                   	ret    

00000309 <kill>:
SYSCALL(kill)
 309:	b8 06 00 00 00       	mov    $0x6,%eax
 30e:	cd 40                	int    $0x40
 310:	c3                   	ret    

00000311 <exec>:
SYSCALL(exec)
 311:	b8 07 00 00 00       	mov    $0x7,%eax
 316:	cd 40                	int    $0x40
 318:	c3                   	ret    

00000319 <open>:
SYSCALL(open)
 319:	b8 0f 00 00 00       	mov    $0xf,%eax
 31e:	cd 40                	int    $0x40
 320:	c3                   	ret    

00000321 <mknod>:
SYSCALL(mknod)
 321:	b8 11 00 00 00       	mov    $0x11,%eax
 326:	cd 40                	int    $0x40
 328:	c3                   	ret    

00000329 <unlink>:
SYSCALL(unlink)
 329:	b8 12 00 00 00       	mov    $0x12,%eax
 32e:	cd 40                	int    $0x40
 330:	c3                   	ret    

00000331 <fstat>:
SYSCALL(fstat)
 331:	b8 08 00 00 00       	mov    $0x8,%eax
 336:	cd 40                	int    $0x40
 338:	c3                   	ret    

00000339 <link>:
SYSCALL(link)
 339:	b8 13 00 00 00       	mov    $0x13,%eax
 33e:	cd 40                	int    $0x40
 340:	c3                   	ret    

00000341 <mkdir>:
SYSCALL(mkdir)
 341:	b8 14 00 00 00       	mov    $0x14,%eax
 346:	cd 40                	int    $0x40
 348:	c3                   	ret    

00000349 <chdir>:
SYSCALL(chdir)
 349:	b8 09 00 00 00       	mov    $0x9,%eax
 34e:	cd 40                	int    $0x40
 350:	c3                   	ret    

00000351 <dup>:
SYSCALL(dup)
 351:	b8 0a 00 00 00       	mov    $0xa,%eax
 356:	cd 40                	int    $0x40
 358:	c3                   	ret    

00000359 <getpid>:
SYSCALL(getpid)
 359:	b8 0b 00 00 00       	mov    $0xb,%eax
 35e:	cd 40                	int    $0x40
 360:	c3                   	ret    

00000361 <sbrk>:
SYSCALL(sbrk)
 361:	b8 0c 00 00 00       	mov    $0xc,%eax
 366:	cd 40                	int    $0x40
 368:	c3                   	ret    

00000369 <sleep>:
SYSCALL(sleep)
 369:	b8 0d 00 00 00       	mov    $0xd,%eax
 36e:	cd 40                	int    $0x40
 370:	c3                   	ret    

00000371 <uptime>:
SYSCALL(uptime)
 371:	b8 0e 00 00 00       	mov    $0xe,%eax
 376:	cd 40                	int    $0x40
 378:	c3                   	ret    

00000379 <getpinfo>:
SYSCALL(getpinfo)
 379:	b8 16 00 00 00       	mov    $0x16,%eax
 37e:	cd 40                	int    $0x40
 380:	c3                   	ret    

00000381 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 381:	55                   	push   %ebp
 382:	89 e5                	mov    %esp,%ebp
 384:	83 ec 18             	sub    $0x18,%esp
 387:	8b 45 0c             	mov    0xc(%ebp),%eax
 38a:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 38d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 394:	00 
 395:	8d 45 f4             	lea    -0xc(%ebp),%eax
 398:	89 44 24 04          	mov    %eax,0x4(%esp)
 39c:	8b 45 08             	mov    0x8(%ebp),%eax
 39f:	89 04 24             	mov    %eax,(%esp)
 3a2:	e8 52 ff ff ff       	call   2f9 <write>
}
 3a7:	c9                   	leave  
 3a8:	c3                   	ret    

000003a9 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3a9:	55                   	push   %ebp
 3aa:	89 e5                	mov    %esp,%ebp
 3ac:	56                   	push   %esi
 3ad:	53                   	push   %ebx
 3ae:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 3b1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 3b8:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 3bc:	74 17                	je     3d5 <printint+0x2c>
 3be:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 3c2:	79 11                	jns    3d5 <printint+0x2c>
    neg = 1;
 3c4:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 3cb:	8b 45 0c             	mov    0xc(%ebp),%eax
 3ce:	f7 d8                	neg    %eax
 3d0:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3d3:	eb 06                	jmp    3db <printint+0x32>
  } else {
    x = xx;
 3d5:	8b 45 0c             	mov    0xc(%ebp),%eax
 3d8:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 3db:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 3e2:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 3e5:	8d 41 01             	lea    0x1(%ecx),%eax
 3e8:	89 45 f4             	mov    %eax,-0xc(%ebp)
 3eb:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3ee:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3f1:	ba 00 00 00 00       	mov    $0x0,%edx
 3f6:	f7 f3                	div    %ebx
 3f8:	89 d0                	mov    %edx,%eax
 3fa:	0f b6 80 a4 0a 00 00 	movzbl 0xaa4(%eax),%eax
 401:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 405:	8b 75 10             	mov    0x10(%ebp),%esi
 408:	8b 45 ec             	mov    -0x14(%ebp),%eax
 40b:	ba 00 00 00 00       	mov    $0x0,%edx
 410:	f7 f6                	div    %esi
 412:	89 45 ec             	mov    %eax,-0x14(%ebp)
 415:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 419:	75 c7                	jne    3e2 <printint+0x39>
  if(neg)
 41b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 41f:	74 10                	je     431 <printint+0x88>
    buf[i++] = '-';
 421:	8b 45 f4             	mov    -0xc(%ebp),%eax
 424:	8d 50 01             	lea    0x1(%eax),%edx
 427:	89 55 f4             	mov    %edx,-0xc(%ebp)
 42a:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 42f:	eb 1f                	jmp    450 <printint+0xa7>
 431:	eb 1d                	jmp    450 <printint+0xa7>
    putc(fd, buf[i]);
 433:	8d 55 dc             	lea    -0x24(%ebp),%edx
 436:	8b 45 f4             	mov    -0xc(%ebp),%eax
 439:	01 d0                	add    %edx,%eax
 43b:	0f b6 00             	movzbl (%eax),%eax
 43e:	0f be c0             	movsbl %al,%eax
 441:	89 44 24 04          	mov    %eax,0x4(%esp)
 445:	8b 45 08             	mov    0x8(%ebp),%eax
 448:	89 04 24             	mov    %eax,(%esp)
 44b:	e8 31 ff ff ff       	call   381 <putc>
  while(--i >= 0)
 450:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 454:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 458:	79 d9                	jns    433 <printint+0x8a>
}
 45a:	83 c4 30             	add    $0x30,%esp
 45d:	5b                   	pop    %ebx
 45e:	5e                   	pop    %esi
 45f:	5d                   	pop    %ebp
 460:	c3                   	ret    

00000461 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 461:	55                   	push   %ebp
 462:	89 e5                	mov    %esp,%ebp
 464:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 467:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 46e:	8d 45 0c             	lea    0xc(%ebp),%eax
 471:	83 c0 04             	add    $0x4,%eax
 474:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 477:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 47e:	e9 7c 01 00 00       	jmp    5ff <printf+0x19e>
    c = fmt[i] & 0xff;
 483:	8b 55 0c             	mov    0xc(%ebp),%edx
 486:	8b 45 f0             	mov    -0x10(%ebp),%eax
 489:	01 d0                	add    %edx,%eax
 48b:	0f b6 00             	movzbl (%eax),%eax
 48e:	0f be c0             	movsbl %al,%eax
 491:	25 ff 00 00 00       	and    $0xff,%eax
 496:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 499:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 49d:	75 2c                	jne    4cb <printf+0x6a>
      if(c == '%'){
 49f:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 4a3:	75 0c                	jne    4b1 <printf+0x50>
        state = '%';
 4a5:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 4ac:	e9 4a 01 00 00       	jmp    5fb <printf+0x19a>
      } else {
        putc(fd, c);
 4b1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4b4:	0f be c0             	movsbl %al,%eax
 4b7:	89 44 24 04          	mov    %eax,0x4(%esp)
 4bb:	8b 45 08             	mov    0x8(%ebp),%eax
 4be:	89 04 24             	mov    %eax,(%esp)
 4c1:	e8 bb fe ff ff       	call   381 <putc>
 4c6:	e9 30 01 00 00       	jmp    5fb <printf+0x19a>
      }
    } else if(state == '%'){
 4cb:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 4cf:	0f 85 26 01 00 00    	jne    5fb <printf+0x19a>
      if(c == 'd'){
 4d5:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 4d9:	75 2d                	jne    508 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 4db:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4de:	8b 00                	mov    (%eax),%eax
 4e0:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 4e7:	00 
 4e8:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 4ef:	00 
 4f0:	89 44 24 04          	mov    %eax,0x4(%esp)
 4f4:	8b 45 08             	mov    0x8(%ebp),%eax
 4f7:	89 04 24             	mov    %eax,(%esp)
 4fa:	e8 aa fe ff ff       	call   3a9 <printint>
        ap++;
 4ff:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 503:	e9 ec 00 00 00       	jmp    5f4 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 508:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 50c:	74 06                	je     514 <printf+0xb3>
 50e:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 512:	75 2d                	jne    541 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 514:	8b 45 e8             	mov    -0x18(%ebp),%eax
 517:	8b 00                	mov    (%eax),%eax
 519:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 520:	00 
 521:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 528:	00 
 529:	89 44 24 04          	mov    %eax,0x4(%esp)
 52d:	8b 45 08             	mov    0x8(%ebp),%eax
 530:	89 04 24             	mov    %eax,(%esp)
 533:	e8 71 fe ff ff       	call   3a9 <printint>
        ap++;
 538:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 53c:	e9 b3 00 00 00       	jmp    5f4 <printf+0x193>
      } else if(c == 's'){
 541:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 545:	75 45                	jne    58c <printf+0x12b>
        s = (char*)*ap;
 547:	8b 45 e8             	mov    -0x18(%ebp),%eax
 54a:	8b 00                	mov    (%eax),%eax
 54c:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 54f:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 553:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 557:	75 09                	jne    562 <printf+0x101>
          s = "(null)";
 559:	c7 45 f4 36 08 00 00 	movl   $0x836,-0xc(%ebp)
        while(*s != 0){
 560:	eb 1e                	jmp    580 <printf+0x11f>
 562:	eb 1c                	jmp    580 <printf+0x11f>
          putc(fd, *s);
 564:	8b 45 f4             	mov    -0xc(%ebp),%eax
 567:	0f b6 00             	movzbl (%eax),%eax
 56a:	0f be c0             	movsbl %al,%eax
 56d:	89 44 24 04          	mov    %eax,0x4(%esp)
 571:	8b 45 08             	mov    0x8(%ebp),%eax
 574:	89 04 24             	mov    %eax,(%esp)
 577:	e8 05 fe ff ff       	call   381 <putc>
          s++;
 57c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 580:	8b 45 f4             	mov    -0xc(%ebp),%eax
 583:	0f b6 00             	movzbl (%eax),%eax
 586:	84 c0                	test   %al,%al
 588:	75 da                	jne    564 <printf+0x103>
 58a:	eb 68                	jmp    5f4 <printf+0x193>
        }
      } else if(c == 'c'){
 58c:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 590:	75 1d                	jne    5af <printf+0x14e>
        putc(fd, *ap);
 592:	8b 45 e8             	mov    -0x18(%ebp),%eax
 595:	8b 00                	mov    (%eax),%eax
 597:	0f be c0             	movsbl %al,%eax
 59a:	89 44 24 04          	mov    %eax,0x4(%esp)
 59e:	8b 45 08             	mov    0x8(%ebp),%eax
 5a1:	89 04 24             	mov    %eax,(%esp)
 5a4:	e8 d8 fd ff ff       	call   381 <putc>
        ap++;
 5a9:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5ad:	eb 45                	jmp    5f4 <printf+0x193>
      } else if(c == '%'){
 5af:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5b3:	75 17                	jne    5cc <printf+0x16b>
        putc(fd, c);
 5b5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5b8:	0f be c0             	movsbl %al,%eax
 5bb:	89 44 24 04          	mov    %eax,0x4(%esp)
 5bf:	8b 45 08             	mov    0x8(%ebp),%eax
 5c2:	89 04 24             	mov    %eax,(%esp)
 5c5:	e8 b7 fd ff ff       	call   381 <putc>
 5ca:	eb 28                	jmp    5f4 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5cc:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 5d3:	00 
 5d4:	8b 45 08             	mov    0x8(%ebp),%eax
 5d7:	89 04 24             	mov    %eax,(%esp)
 5da:	e8 a2 fd ff ff       	call   381 <putc>
        putc(fd, c);
 5df:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5e2:	0f be c0             	movsbl %al,%eax
 5e5:	89 44 24 04          	mov    %eax,0x4(%esp)
 5e9:	8b 45 08             	mov    0x8(%ebp),%eax
 5ec:	89 04 24             	mov    %eax,(%esp)
 5ef:	e8 8d fd ff ff       	call   381 <putc>
      }
      state = 0;
 5f4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 5fb:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 5ff:	8b 55 0c             	mov    0xc(%ebp),%edx
 602:	8b 45 f0             	mov    -0x10(%ebp),%eax
 605:	01 d0                	add    %edx,%eax
 607:	0f b6 00             	movzbl (%eax),%eax
 60a:	84 c0                	test   %al,%al
 60c:	0f 85 71 fe ff ff    	jne    483 <printf+0x22>
    }
  }
}
 612:	c9                   	leave  
 613:	c3                   	ret    

00000614 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 614:	55                   	push   %ebp
 615:	89 e5                	mov    %esp,%ebp
 617:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 61a:	8b 45 08             	mov    0x8(%ebp),%eax
 61d:	83 e8 08             	sub    $0x8,%eax
 620:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 623:	a1 c0 0a 00 00       	mov    0xac0,%eax
 628:	89 45 fc             	mov    %eax,-0x4(%ebp)
 62b:	eb 24                	jmp    651 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 62d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 630:	8b 00                	mov    (%eax),%eax
 632:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 635:	77 12                	ja     649 <free+0x35>
 637:	8b 45 f8             	mov    -0x8(%ebp),%eax
 63a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 63d:	77 24                	ja     663 <free+0x4f>
 63f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 642:	8b 00                	mov    (%eax),%eax
 644:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 647:	77 1a                	ja     663 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 649:	8b 45 fc             	mov    -0x4(%ebp),%eax
 64c:	8b 00                	mov    (%eax),%eax
 64e:	89 45 fc             	mov    %eax,-0x4(%ebp)
 651:	8b 45 f8             	mov    -0x8(%ebp),%eax
 654:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 657:	76 d4                	jbe    62d <free+0x19>
 659:	8b 45 fc             	mov    -0x4(%ebp),%eax
 65c:	8b 00                	mov    (%eax),%eax
 65e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 661:	76 ca                	jbe    62d <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 663:	8b 45 f8             	mov    -0x8(%ebp),%eax
 666:	8b 40 04             	mov    0x4(%eax),%eax
 669:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 670:	8b 45 f8             	mov    -0x8(%ebp),%eax
 673:	01 c2                	add    %eax,%edx
 675:	8b 45 fc             	mov    -0x4(%ebp),%eax
 678:	8b 00                	mov    (%eax),%eax
 67a:	39 c2                	cmp    %eax,%edx
 67c:	75 24                	jne    6a2 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 67e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 681:	8b 50 04             	mov    0x4(%eax),%edx
 684:	8b 45 fc             	mov    -0x4(%ebp),%eax
 687:	8b 00                	mov    (%eax),%eax
 689:	8b 40 04             	mov    0x4(%eax),%eax
 68c:	01 c2                	add    %eax,%edx
 68e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 691:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 694:	8b 45 fc             	mov    -0x4(%ebp),%eax
 697:	8b 00                	mov    (%eax),%eax
 699:	8b 10                	mov    (%eax),%edx
 69b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 69e:	89 10                	mov    %edx,(%eax)
 6a0:	eb 0a                	jmp    6ac <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 6a2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a5:	8b 10                	mov    (%eax),%edx
 6a7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6aa:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 6ac:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6af:	8b 40 04             	mov    0x4(%eax),%eax
 6b2:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 6b9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6bc:	01 d0                	add    %edx,%eax
 6be:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6c1:	75 20                	jne    6e3 <free+0xcf>
    p->s.size += bp->s.size;
 6c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c6:	8b 50 04             	mov    0x4(%eax),%edx
 6c9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6cc:	8b 40 04             	mov    0x4(%eax),%eax
 6cf:	01 c2                	add    %eax,%edx
 6d1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d4:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6d7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6da:	8b 10                	mov    (%eax),%edx
 6dc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6df:	89 10                	mov    %edx,(%eax)
 6e1:	eb 08                	jmp    6eb <free+0xd7>
  } else
    p->s.ptr = bp;
 6e3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e6:	8b 55 f8             	mov    -0x8(%ebp),%edx
 6e9:	89 10                	mov    %edx,(%eax)
  freep = p;
 6eb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ee:	a3 c0 0a 00 00       	mov    %eax,0xac0
}
 6f3:	c9                   	leave  
 6f4:	c3                   	ret    

000006f5 <morecore>:

static Header*
morecore(uint nu)
{
 6f5:	55                   	push   %ebp
 6f6:	89 e5                	mov    %esp,%ebp
 6f8:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 6fb:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 702:	77 07                	ja     70b <morecore+0x16>
    nu = 4096;
 704:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 70b:	8b 45 08             	mov    0x8(%ebp),%eax
 70e:	c1 e0 03             	shl    $0x3,%eax
 711:	89 04 24             	mov    %eax,(%esp)
 714:	e8 48 fc ff ff       	call   361 <sbrk>
 719:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 71c:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 720:	75 07                	jne    729 <morecore+0x34>
    return 0;
 722:	b8 00 00 00 00       	mov    $0x0,%eax
 727:	eb 22                	jmp    74b <morecore+0x56>
  hp = (Header*)p;
 729:	8b 45 f4             	mov    -0xc(%ebp),%eax
 72c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 72f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 732:	8b 55 08             	mov    0x8(%ebp),%edx
 735:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 738:	8b 45 f0             	mov    -0x10(%ebp),%eax
 73b:	83 c0 08             	add    $0x8,%eax
 73e:	89 04 24             	mov    %eax,(%esp)
 741:	e8 ce fe ff ff       	call   614 <free>
  return freep;
 746:	a1 c0 0a 00 00       	mov    0xac0,%eax
}
 74b:	c9                   	leave  
 74c:	c3                   	ret    

0000074d <malloc>:

void*
malloc(uint nbytes)
{
 74d:	55                   	push   %ebp
 74e:	89 e5                	mov    %esp,%ebp
 750:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 753:	8b 45 08             	mov    0x8(%ebp),%eax
 756:	83 c0 07             	add    $0x7,%eax
 759:	c1 e8 03             	shr    $0x3,%eax
 75c:	83 c0 01             	add    $0x1,%eax
 75f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 762:	a1 c0 0a 00 00       	mov    0xac0,%eax
 767:	89 45 f0             	mov    %eax,-0x10(%ebp)
 76a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 76e:	75 23                	jne    793 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 770:	c7 45 f0 b8 0a 00 00 	movl   $0xab8,-0x10(%ebp)
 777:	8b 45 f0             	mov    -0x10(%ebp),%eax
 77a:	a3 c0 0a 00 00       	mov    %eax,0xac0
 77f:	a1 c0 0a 00 00       	mov    0xac0,%eax
 784:	a3 b8 0a 00 00       	mov    %eax,0xab8
    base.s.size = 0;
 789:	c7 05 bc 0a 00 00 00 	movl   $0x0,0xabc
 790:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 793:	8b 45 f0             	mov    -0x10(%ebp),%eax
 796:	8b 00                	mov    (%eax),%eax
 798:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 79b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 79e:	8b 40 04             	mov    0x4(%eax),%eax
 7a1:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 7a4:	72 4d                	jb     7f3 <malloc+0xa6>
      if(p->s.size == nunits)
 7a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7a9:	8b 40 04             	mov    0x4(%eax),%eax
 7ac:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 7af:	75 0c                	jne    7bd <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 7b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7b4:	8b 10                	mov    (%eax),%edx
 7b6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7b9:	89 10                	mov    %edx,(%eax)
 7bb:	eb 26                	jmp    7e3 <malloc+0x96>
      else {
        p->s.size -= nunits;
 7bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7c0:	8b 40 04             	mov    0x4(%eax),%eax
 7c3:	2b 45 ec             	sub    -0x14(%ebp),%eax
 7c6:	89 c2                	mov    %eax,%edx
 7c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7cb:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7d1:	8b 40 04             	mov    0x4(%eax),%eax
 7d4:	c1 e0 03             	shl    $0x3,%eax
 7d7:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 7da:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7dd:	8b 55 ec             	mov    -0x14(%ebp),%edx
 7e0:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 7e3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7e6:	a3 c0 0a 00 00       	mov    %eax,0xac0
      return (void*)(p + 1);
 7eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ee:	83 c0 08             	add    $0x8,%eax
 7f1:	eb 38                	jmp    82b <malloc+0xde>
    }
    if(p == freep)
 7f3:	a1 c0 0a 00 00       	mov    0xac0,%eax
 7f8:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 7fb:	75 1b                	jne    818 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 7fd:	8b 45 ec             	mov    -0x14(%ebp),%eax
 800:	89 04 24             	mov    %eax,(%esp)
 803:	e8 ed fe ff ff       	call   6f5 <morecore>
 808:	89 45 f4             	mov    %eax,-0xc(%ebp)
 80b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 80f:	75 07                	jne    818 <malloc+0xcb>
        return 0;
 811:	b8 00 00 00 00       	mov    $0x0,%eax
 816:	eb 13                	jmp    82b <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 818:	8b 45 f4             	mov    -0xc(%ebp),%eax
 81b:	89 45 f0             	mov    %eax,-0x10(%ebp)
 81e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 821:	8b 00                	mov    (%eax),%eax
 823:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 826:	e9 70 ff ff ff       	jmp    79b <malloc+0x4e>
}
 82b:	c9                   	leave  
 82c:	c3                   	ret    
