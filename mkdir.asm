
_mkdir:     file format elf32-i386


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

  if(argc < 2){
   9:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
   d:	7f 19                	jg     28 <main+0x28>
    printf(2, "Usage: mkdir files...\n");
   f:	c7 44 24 04 50 08 00 	movl   $0x850,0x4(%esp)
  16:	00 
  17:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  1e:	e8 61 04 00 00       	call   484 <printf>
    exit();
  23:	e8 d4 02 00 00       	call   2fc <exit>
  }

  for(i = 1; i < argc; i++){
  28:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
  2f:	00 
  30:	eb 4f                	jmp    81 <main+0x81>
    if(mkdir(argv[i]) < 0){
  32:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  36:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3d:	8b 45 0c             	mov    0xc(%ebp),%eax
  40:	01 d0                	add    %edx,%eax
  42:	8b 00                	mov    (%eax),%eax
  44:	89 04 24             	mov    %eax,(%esp)
  47:	e8 18 03 00 00       	call   364 <mkdir>
  4c:	85 c0                	test   %eax,%eax
  4e:	79 2c                	jns    7c <main+0x7c>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
  50:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  54:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  5b:	8b 45 0c             	mov    0xc(%ebp),%eax
  5e:	01 d0                	add    %edx,%eax
  60:	8b 00                	mov    (%eax),%eax
  62:	89 44 24 08          	mov    %eax,0x8(%esp)
  66:	c7 44 24 04 67 08 00 	movl   $0x867,0x4(%esp)
  6d:	00 
  6e:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  75:	e8 0a 04 00 00       	call   484 <printf>
      break;
  7a:	eb 0e                	jmp    8a <main+0x8a>
  for(i = 1; i < argc; i++){
  7c:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
  81:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  85:	3b 45 08             	cmp    0x8(%ebp),%eax
  88:	7c a8                	jl     32 <main+0x32>
    }
  }

  exit();
  8a:	e8 6d 02 00 00       	call   2fc <exit>

0000008f <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  8f:	55                   	push   %ebp
  90:	89 e5                	mov    %esp,%ebp
  92:	57                   	push   %edi
  93:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  94:	8b 4d 08             	mov    0x8(%ebp),%ecx
  97:	8b 55 10             	mov    0x10(%ebp),%edx
  9a:	8b 45 0c             	mov    0xc(%ebp),%eax
  9d:	89 cb                	mov    %ecx,%ebx
  9f:	89 df                	mov    %ebx,%edi
  a1:	89 d1                	mov    %edx,%ecx
  a3:	fc                   	cld    
  a4:	f3 aa                	rep stos %al,%es:(%edi)
  a6:	89 ca                	mov    %ecx,%edx
  a8:	89 fb                	mov    %edi,%ebx
  aa:	89 5d 08             	mov    %ebx,0x8(%ebp)
  ad:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  b0:	5b                   	pop    %ebx
  b1:	5f                   	pop    %edi
  b2:	5d                   	pop    %ebp
  b3:	c3                   	ret    

000000b4 <ps>:
#include "stat.h"
#include "fcntl.h"
#include "user.h"
#include "x86.h"

void ps(){
  b4:	55                   	push   %ebp
  b5:	89 e5                	mov    %esp,%ebp
  
 //  pstatTable * pst = getpinfo
}
  b7:	5d                   	pop    %ebp
  b8:	c3                   	ret    

000000b9 <strcpy>:

char*
strcpy(char *s, const char *t)
{
  b9:	55                   	push   %ebp
  ba:	89 e5                	mov    %esp,%ebp
  bc:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  bf:	8b 45 08             	mov    0x8(%ebp),%eax
  c2:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  c5:	90                   	nop
  c6:	8b 45 08             	mov    0x8(%ebp),%eax
  c9:	8d 50 01             	lea    0x1(%eax),%edx
  cc:	89 55 08             	mov    %edx,0x8(%ebp)
  cf:	8b 55 0c             	mov    0xc(%ebp),%edx
  d2:	8d 4a 01             	lea    0x1(%edx),%ecx
  d5:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  d8:	0f b6 12             	movzbl (%edx),%edx
  db:	88 10                	mov    %dl,(%eax)
  dd:	0f b6 00             	movzbl (%eax),%eax
  e0:	84 c0                	test   %al,%al
  e2:	75 e2                	jne    c6 <strcpy+0xd>
    ;
  return os;
  e4:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  e7:	c9                   	leave  
  e8:	c3                   	ret    

000000e9 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  e9:	55                   	push   %ebp
  ea:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  ec:	eb 08                	jmp    f6 <strcmp+0xd>
    p++, q++;
  ee:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  f2:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
  f6:	8b 45 08             	mov    0x8(%ebp),%eax
  f9:	0f b6 00             	movzbl (%eax),%eax
  fc:	84 c0                	test   %al,%al
  fe:	74 10                	je     110 <strcmp+0x27>
 100:	8b 45 08             	mov    0x8(%ebp),%eax
 103:	0f b6 10             	movzbl (%eax),%edx
 106:	8b 45 0c             	mov    0xc(%ebp),%eax
 109:	0f b6 00             	movzbl (%eax),%eax
 10c:	38 c2                	cmp    %al,%dl
 10e:	74 de                	je     ee <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 110:	8b 45 08             	mov    0x8(%ebp),%eax
 113:	0f b6 00             	movzbl (%eax),%eax
 116:	0f b6 d0             	movzbl %al,%edx
 119:	8b 45 0c             	mov    0xc(%ebp),%eax
 11c:	0f b6 00             	movzbl (%eax),%eax
 11f:	0f b6 c0             	movzbl %al,%eax
 122:	29 c2                	sub    %eax,%edx
 124:	89 d0                	mov    %edx,%eax
}
 126:	5d                   	pop    %ebp
 127:	c3                   	ret    

00000128 <strlen>:

uint
strlen(const char *s)
{
 128:	55                   	push   %ebp
 129:	89 e5                	mov    %esp,%ebp
 12b:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 12e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 135:	eb 04                	jmp    13b <strlen+0x13>
 137:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 13b:	8b 55 fc             	mov    -0x4(%ebp),%edx
 13e:	8b 45 08             	mov    0x8(%ebp),%eax
 141:	01 d0                	add    %edx,%eax
 143:	0f b6 00             	movzbl (%eax),%eax
 146:	84 c0                	test   %al,%al
 148:	75 ed                	jne    137 <strlen+0xf>
    ;
  return n;
 14a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 14d:	c9                   	leave  
 14e:	c3                   	ret    

0000014f <memset>:

void*
memset(void *dst, int c, uint n)
{
 14f:	55                   	push   %ebp
 150:	89 e5                	mov    %esp,%ebp
 152:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 155:	8b 45 10             	mov    0x10(%ebp),%eax
 158:	89 44 24 08          	mov    %eax,0x8(%esp)
 15c:	8b 45 0c             	mov    0xc(%ebp),%eax
 15f:	89 44 24 04          	mov    %eax,0x4(%esp)
 163:	8b 45 08             	mov    0x8(%ebp),%eax
 166:	89 04 24             	mov    %eax,(%esp)
 169:	e8 21 ff ff ff       	call   8f <stosb>
  return dst;
 16e:	8b 45 08             	mov    0x8(%ebp),%eax
}
 171:	c9                   	leave  
 172:	c3                   	ret    

00000173 <strchr>:

char*
strchr(const char *s, char c)
{
 173:	55                   	push   %ebp
 174:	89 e5                	mov    %esp,%ebp
 176:	83 ec 04             	sub    $0x4,%esp
 179:	8b 45 0c             	mov    0xc(%ebp),%eax
 17c:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 17f:	eb 14                	jmp    195 <strchr+0x22>
    if(*s == c)
 181:	8b 45 08             	mov    0x8(%ebp),%eax
 184:	0f b6 00             	movzbl (%eax),%eax
 187:	3a 45 fc             	cmp    -0x4(%ebp),%al
 18a:	75 05                	jne    191 <strchr+0x1e>
      return (char*)s;
 18c:	8b 45 08             	mov    0x8(%ebp),%eax
 18f:	eb 13                	jmp    1a4 <strchr+0x31>
  for(; *s; s++)
 191:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 195:	8b 45 08             	mov    0x8(%ebp),%eax
 198:	0f b6 00             	movzbl (%eax),%eax
 19b:	84 c0                	test   %al,%al
 19d:	75 e2                	jne    181 <strchr+0xe>
  return 0;
 19f:	b8 00 00 00 00       	mov    $0x0,%eax
}
 1a4:	c9                   	leave  
 1a5:	c3                   	ret    

000001a6 <gets>:

char*
gets(char *buf, int max)
{
 1a6:	55                   	push   %ebp
 1a7:	89 e5                	mov    %esp,%ebp
 1a9:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1ac:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 1b3:	eb 4c                	jmp    201 <gets+0x5b>
    cc = read(0, &c, 1);
 1b5:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 1bc:	00 
 1bd:	8d 45 ef             	lea    -0x11(%ebp),%eax
 1c0:	89 44 24 04          	mov    %eax,0x4(%esp)
 1c4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1cb:	e8 44 01 00 00       	call   314 <read>
 1d0:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1d3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1d7:	7f 02                	jg     1db <gets+0x35>
      break;
 1d9:	eb 31                	jmp    20c <gets+0x66>
    buf[i++] = c;
 1db:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1de:	8d 50 01             	lea    0x1(%eax),%edx
 1e1:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1e4:	89 c2                	mov    %eax,%edx
 1e6:	8b 45 08             	mov    0x8(%ebp),%eax
 1e9:	01 c2                	add    %eax,%edx
 1eb:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1ef:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1f1:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1f5:	3c 0a                	cmp    $0xa,%al
 1f7:	74 13                	je     20c <gets+0x66>
 1f9:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1fd:	3c 0d                	cmp    $0xd,%al
 1ff:	74 0b                	je     20c <gets+0x66>
  for(i=0; i+1 < max; ){
 201:	8b 45 f4             	mov    -0xc(%ebp),%eax
 204:	83 c0 01             	add    $0x1,%eax
 207:	3b 45 0c             	cmp    0xc(%ebp),%eax
 20a:	7c a9                	jl     1b5 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 20c:	8b 55 f4             	mov    -0xc(%ebp),%edx
 20f:	8b 45 08             	mov    0x8(%ebp),%eax
 212:	01 d0                	add    %edx,%eax
 214:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 217:	8b 45 08             	mov    0x8(%ebp),%eax
}
 21a:	c9                   	leave  
 21b:	c3                   	ret    

0000021c <stat>:

int
stat(const char *n, struct stat *st)
{
 21c:	55                   	push   %ebp
 21d:	89 e5                	mov    %esp,%ebp
 21f:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 222:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 229:	00 
 22a:	8b 45 08             	mov    0x8(%ebp),%eax
 22d:	89 04 24             	mov    %eax,(%esp)
 230:	e8 07 01 00 00       	call   33c <open>
 235:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 238:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 23c:	79 07                	jns    245 <stat+0x29>
    return -1;
 23e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 243:	eb 23                	jmp    268 <stat+0x4c>
  r = fstat(fd, st);
 245:	8b 45 0c             	mov    0xc(%ebp),%eax
 248:	89 44 24 04          	mov    %eax,0x4(%esp)
 24c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 24f:	89 04 24             	mov    %eax,(%esp)
 252:	e8 fd 00 00 00       	call   354 <fstat>
 257:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 25a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 25d:	89 04 24             	mov    %eax,(%esp)
 260:	e8 bf 00 00 00       	call   324 <close>
  return r;
 265:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 268:	c9                   	leave  
 269:	c3                   	ret    

0000026a <atoi>:

int
atoi(const char *s)
{
 26a:	55                   	push   %ebp
 26b:	89 e5                	mov    %esp,%ebp
 26d:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 270:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 277:	eb 25                	jmp    29e <atoi+0x34>
    n = n*10 + *s++ - '0';
 279:	8b 55 fc             	mov    -0x4(%ebp),%edx
 27c:	89 d0                	mov    %edx,%eax
 27e:	c1 e0 02             	shl    $0x2,%eax
 281:	01 d0                	add    %edx,%eax
 283:	01 c0                	add    %eax,%eax
 285:	89 c1                	mov    %eax,%ecx
 287:	8b 45 08             	mov    0x8(%ebp),%eax
 28a:	8d 50 01             	lea    0x1(%eax),%edx
 28d:	89 55 08             	mov    %edx,0x8(%ebp)
 290:	0f b6 00             	movzbl (%eax),%eax
 293:	0f be c0             	movsbl %al,%eax
 296:	01 c8                	add    %ecx,%eax
 298:	83 e8 30             	sub    $0x30,%eax
 29b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 29e:	8b 45 08             	mov    0x8(%ebp),%eax
 2a1:	0f b6 00             	movzbl (%eax),%eax
 2a4:	3c 2f                	cmp    $0x2f,%al
 2a6:	7e 0a                	jle    2b2 <atoi+0x48>
 2a8:	8b 45 08             	mov    0x8(%ebp),%eax
 2ab:	0f b6 00             	movzbl (%eax),%eax
 2ae:	3c 39                	cmp    $0x39,%al
 2b0:	7e c7                	jle    279 <atoi+0xf>
  return n;
 2b2:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 2b5:	c9                   	leave  
 2b6:	c3                   	ret    

000002b7 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2b7:	55                   	push   %ebp
 2b8:	89 e5                	mov    %esp,%ebp
 2ba:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 2bd:	8b 45 08             	mov    0x8(%ebp),%eax
 2c0:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 2c3:	8b 45 0c             	mov    0xc(%ebp),%eax
 2c6:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 2c9:	eb 17                	jmp    2e2 <memmove+0x2b>
    *dst++ = *src++;
 2cb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2ce:	8d 50 01             	lea    0x1(%eax),%edx
 2d1:	89 55 fc             	mov    %edx,-0x4(%ebp)
 2d4:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2d7:	8d 4a 01             	lea    0x1(%edx),%ecx
 2da:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 2dd:	0f b6 12             	movzbl (%edx),%edx
 2e0:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 2e2:	8b 45 10             	mov    0x10(%ebp),%eax
 2e5:	8d 50 ff             	lea    -0x1(%eax),%edx
 2e8:	89 55 10             	mov    %edx,0x10(%ebp)
 2eb:	85 c0                	test   %eax,%eax
 2ed:	7f dc                	jg     2cb <memmove+0x14>
  return vdst;
 2ef:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2f2:	c9                   	leave  
 2f3:	c3                   	ret    

000002f4 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2f4:	b8 01 00 00 00       	mov    $0x1,%eax
 2f9:	cd 40                	int    $0x40
 2fb:	c3                   	ret    

000002fc <exit>:
SYSCALL(exit)
 2fc:	b8 02 00 00 00       	mov    $0x2,%eax
 301:	cd 40                	int    $0x40
 303:	c3                   	ret    

00000304 <wait>:
SYSCALL(wait)
 304:	b8 03 00 00 00       	mov    $0x3,%eax
 309:	cd 40                	int    $0x40
 30b:	c3                   	ret    

0000030c <pipe>:
SYSCALL(pipe)
 30c:	b8 04 00 00 00       	mov    $0x4,%eax
 311:	cd 40                	int    $0x40
 313:	c3                   	ret    

00000314 <read>:
SYSCALL(read)
 314:	b8 05 00 00 00       	mov    $0x5,%eax
 319:	cd 40                	int    $0x40
 31b:	c3                   	ret    

0000031c <write>:
SYSCALL(write)
 31c:	b8 10 00 00 00       	mov    $0x10,%eax
 321:	cd 40                	int    $0x40
 323:	c3                   	ret    

00000324 <close>:
SYSCALL(close)
 324:	b8 15 00 00 00       	mov    $0x15,%eax
 329:	cd 40                	int    $0x40
 32b:	c3                   	ret    

0000032c <kill>:
SYSCALL(kill)
 32c:	b8 06 00 00 00       	mov    $0x6,%eax
 331:	cd 40                	int    $0x40
 333:	c3                   	ret    

00000334 <exec>:
SYSCALL(exec)
 334:	b8 07 00 00 00       	mov    $0x7,%eax
 339:	cd 40                	int    $0x40
 33b:	c3                   	ret    

0000033c <open>:
SYSCALL(open)
 33c:	b8 0f 00 00 00       	mov    $0xf,%eax
 341:	cd 40                	int    $0x40
 343:	c3                   	ret    

00000344 <mknod>:
SYSCALL(mknod)
 344:	b8 11 00 00 00       	mov    $0x11,%eax
 349:	cd 40                	int    $0x40
 34b:	c3                   	ret    

0000034c <unlink>:
SYSCALL(unlink)
 34c:	b8 12 00 00 00       	mov    $0x12,%eax
 351:	cd 40                	int    $0x40
 353:	c3                   	ret    

00000354 <fstat>:
SYSCALL(fstat)
 354:	b8 08 00 00 00       	mov    $0x8,%eax
 359:	cd 40                	int    $0x40
 35b:	c3                   	ret    

0000035c <link>:
SYSCALL(link)
 35c:	b8 13 00 00 00       	mov    $0x13,%eax
 361:	cd 40                	int    $0x40
 363:	c3                   	ret    

00000364 <mkdir>:
SYSCALL(mkdir)
 364:	b8 14 00 00 00       	mov    $0x14,%eax
 369:	cd 40                	int    $0x40
 36b:	c3                   	ret    

0000036c <chdir>:
SYSCALL(chdir)
 36c:	b8 09 00 00 00       	mov    $0x9,%eax
 371:	cd 40                	int    $0x40
 373:	c3                   	ret    

00000374 <dup>:
SYSCALL(dup)
 374:	b8 0a 00 00 00       	mov    $0xa,%eax
 379:	cd 40                	int    $0x40
 37b:	c3                   	ret    

0000037c <getpid>:
SYSCALL(getpid)
 37c:	b8 0b 00 00 00       	mov    $0xb,%eax
 381:	cd 40                	int    $0x40
 383:	c3                   	ret    

00000384 <sbrk>:
SYSCALL(sbrk)
 384:	b8 0c 00 00 00       	mov    $0xc,%eax
 389:	cd 40                	int    $0x40
 38b:	c3                   	ret    

0000038c <sleep>:
SYSCALL(sleep)
 38c:	b8 0d 00 00 00       	mov    $0xd,%eax
 391:	cd 40                	int    $0x40
 393:	c3                   	ret    

00000394 <uptime>:
SYSCALL(uptime)
 394:	b8 0e 00 00 00       	mov    $0xe,%eax
 399:	cd 40                	int    $0x40
 39b:	c3                   	ret    

0000039c <getpinfo>:
SYSCALL(getpinfo)
 39c:	b8 16 00 00 00       	mov    $0x16,%eax
 3a1:	cd 40                	int    $0x40
 3a3:	c3                   	ret    

000003a4 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3a4:	55                   	push   %ebp
 3a5:	89 e5                	mov    %esp,%ebp
 3a7:	83 ec 18             	sub    $0x18,%esp
 3aa:	8b 45 0c             	mov    0xc(%ebp),%eax
 3ad:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 3b0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3b7:	00 
 3b8:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3bb:	89 44 24 04          	mov    %eax,0x4(%esp)
 3bf:	8b 45 08             	mov    0x8(%ebp),%eax
 3c2:	89 04 24             	mov    %eax,(%esp)
 3c5:	e8 52 ff ff ff       	call   31c <write>
}
 3ca:	c9                   	leave  
 3cb:	c3                   	ret    

000003cc <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3cc:	55                   	push   %ebp
 3cd:	89 e5                	mov    %esp,%ebp
 3cf:	56                   	push   %esi
 3d0:	53                   	push   %ebx
 3d1:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 3d4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 3db:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 3df:	74 17                	je     3f8 <printint+0x2c>
 3e1:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 3e5:	79 11                	jns    3f8 <printint+0x2c>
    neg = 1;
 3e7:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 3ee:	8b 45 0c             	mov    0xc(%ebp),%eax
 3f1:	f7 d8                	neg    %eax
 3f3:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3f6:	eb 06                	jmp    3fe <printint+0x32>
  } else {
    x = xx;
 3f8:	8b 45 0c             	mov    0xc(%ebp),%eax
 3fb:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 3fe:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 405:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 408:	8d 41 01             	lea    0x1(%ecx),%eax
 40b:	89 45 f4             	mov    %eax,-0xc(%ebp)
 40e:	8b 5d 10             	mov    0x10(%ebp),%ebx
 411:	8b 45 ec             	mov    -0x14(%ebp),%eax
 414:	ba 00 00 00 00       	mov    $0x0,%edx
 419:	f7 f3                	div    %ebx
 41b:	89 d0                	mov    %edx,%eax
 41d:	0f b6 80 f0 0a 00 00 	movzbl 0xaf0(%eax),%eax
 424:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 428:	8b 75 10             	mov    0x10(%ebp),%esi
 42b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 42e:	ba 00 00 00 00       	mov    $0x0,%edx
 433:	f7 f6                	div    %esi
 435:	89 45 ec             	mov    %eax,-0x14(%ebp)
 438:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 43c:	75 c7                	jne    405 <printint+0x39>
  if(neg)
 43e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 442:	74 10                	je     454 <printint+0x88>
    buf[i++] = '-';
 444:	8b 45 f4             	mov    -0xc(%ebp),%eax
 447:	8d 50 01             	lea    0x1(%eax),%edx
 44a:	89 55 f4             	mov    %edx,-0xc(%ebp)
 44d:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 452:	eb 1f                	jmp    473 <printint+0xa7>
 454:	eb 1d                	jmp    473 <printint+0xa7>
    putc(fd, buf[i]);
 456:	8d 55 dc             	lea    -0x24(%ebp),%edx
 459:	8b 45 f4             	mov    -0xc(%ebp),%eax
 45c:	01 d0                	add    %edx,%eax
 45e:	0f b6 00             	movzbl (%eax),%eax
 461:	0f be c0             	movsbl %al,%eax
 464:	89 44 24 04          	mov    %eax,0x4(%esp)
 468:	8b 45 08             	mov    0x8(%ebp),%eax
 46b:	89 04 24             	mov    %eax,(%esp)
 46e:	e8 31 ff ff ff       	call   3a4 <putc>
  while(--i >= 0)
 473:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 477:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 47b:	79 d9                	jns    456 <printint+0x8a>
}
 47d:	83 c4 30             	add    $0x30,%esp
 480:	5b                   	pop    %ebx
 481:	5e                   	pop    %esi
 482:	5d                   	pop    %ebp
 483:	c3                   	ret    

00000484 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 484:	55                   	push   %ebp
 485:	89 e5                	mov    %esp,%ebp
 487:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 48a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 491:	8d 45 0c             	lea    0xc(%ebp),%eax
 494:	83 c0 04             	add    $0x4,%eax
 497:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 49a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 4a1:	e9 7c 01 00 00       	jmp    622 <printf+0x19e>
    c = fmt[i] & 0xff;
 4a6:	8b 55 0c             	mov    0xc(%ebp),%edx
 4a9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 4ac:	01 d0                	add    %edx,%eax
 4ae:	0f b6 00             	movzbl (%eax),%eax
 4b1:	0f be c0             	movsbl %al,%eax
 4b4:	25 ff 00 00 00       	and    $0xff,%eax
 4b9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 4bc:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4c0:	75 2c                	jne    4ee <printf+0x6a>
      if(c == '%'){
 4c2:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 4c6:	75 0c                	jne    4d4 <printf+0x50>
        state = '%';
 4c8:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 4cf:	e9 4a 01 00 00       	jmp    61e <printf+0x19a>
      } else {
        putc(fd, c);
 4d4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4d7:	0f be c0             	movsbl %al,%eax
 4da:	89 44 24 04          	mov    %eax,0x4(%esp)
 4de:	8b 45 08             	mov    0x8(%ebp),%eax
 4e1:	89 04 24             	mov    %eax,(%esp)
 4e4:	e8 bb fe ff ff       	call   3a4 <putc>
 4e9:	e9 30 01 00 00       	jmp    61e <printf+0x19a>
      }
    } else if(state == '%'){
 4ee:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 4f2:	0f 85 26 01 00 00    	jne    61e <printf+0x19a>
      if(c == 'd'){
 4f8:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 4fc:	75 2d                	jne    52b <printf+0xa7>
        printint(fd, *ap, 10, 1);
 4fe:	8b 45 e8             	mov    -0x18(%ebp),%eax
 501:	8b 00                	mov    (%eax),%eax
 503:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 50a:	00 
 50b:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 512:	00 
 513:	89 44 24 04          	mov    %eax,0x4(%esp)
 517:	8b 45 08             	mov    0x8(%ebp),%eax
 51a:	89 04 24             	mov    %eax,(%esp)
 51d:	e8 aa fe ff ff       	call   3cc <printint>
        ap++;
 522:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 526:	e9 ec 00 00 00       	jmp    617 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 52b:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 52f:	74 06                	je     537 <printf+0xb3>
 531:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 535:	75 2d                	jne    564 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 537:	8b 45 e8             	mov    -0x18(%ebp),%eax
 53a:	8b 00                	mov    (%eax),%eax
 53c:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 543:	00 
 544:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 54b:	00 
 54c:	89 44 24 04          	mov    %eax,0x4(%esp)
 550:	8b 45 08             	mov    0x8(%ebp),%eax
 553:	89 04 24             	mov    %eax,(%esp)
 556:	e8 71 fe ff ff       	call   3cc <printint>
        ap++;
 55b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 55f:	e9 b3 00 00 00       	jmp    617 <printf+0x193>
      } else if(c == 's'){
 564:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 568:	75 45                	jne    5af <printf+0x12b>
        s = (char*)*ap;
 56a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 56d:	8b 00                	mov    (%eax),%eax
 56f:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 572:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 576:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 57a:	75 09                	jne    585 <printf+0x101>
          s = "(null)";
 57c:	c7 45 f4 83 08 00 00 	movl   $0x883,-0xc(%ebp)
        while(*s != 0){
 583:	eb 1e                	jmp    5a3 <printf+0x11f>
 585:	eb 1c                	jmp    5a3 <printf+0x11f>
          putc(fd, *s);
 587:	8b 45 f4             	mov    -0xc(%ebp),%eax
 58a:	0f b6 00             	movzbl (%eax),%eax
 58d:	0f be c0             	movsbl %al,%eax
 590:	89 44 24 04          	mov    %eax,0x4(%esp)
 594:	8b 45 08             	mov    0x8(%ebp),%eax
 597:	89 04 24             	mov    %eax,(%esp)
 59a:	e8 05 fe ff ff       	call   3a4 <putc>
          s++;
 59f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 5a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5a6:	0f b6 00             	movzbl (%eax),%eax
 5a9:	84 c0                	test   %al,%al
 5ab:	75 da                	jne    587 <printf+0x103>
 5ad:	eb 68                	jmp    617 <printf+0x193>
        }
      } else if(c == 'c'){
 5af:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 5b3:	75 1d                	jne    5d2 <printf+0x14e>
        putc(fd, *ap);
 5b5:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5b8:	8b 00                	mov    (%eax),%eax
 5ba:	0f be c0             	movsbl %al,%eax
 5bd:	89 44 24 04          	mov    %eax,0x4(%esp)
 5c1:	8b 45 08             	mov    0x8(%ebp),%eax
 5c4:	89 04 24             	mov    %eax,(%esp)
 5c7:	e8 d8 fd ff ff       	call   3a4 <putc>
        ap++;
 5cc:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5d0:	eb 45                	jmp    617 <printf+0x193>
      } else if(c == '%'){
 5d2:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5d6:	75 17                	jne    5ef <printf+0x16b>
        putc(fd, c);
 5d8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5db:	0f be c0             	movsbl %al,%eax
 5de:	89 44 24 04          	mov    %eax,0x4(%esp)
 5e2:	8b 45 08             	mov    0x8(%ebp),%eax
 5e5:	89 04 24             	mov    %eax,(%esp)
 5e8:	e8 b7 fd ff ff       	call   3a4 <putc>
 5ed:	eb 28                	jmp    617 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5ef:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 5f6:	00 
 5f7:	8b 45 08             	mov    0x8(%ebp),%eax
 5fa:	89 04 24             	mov    %eax,(%esp)
 5fd:	e8 a2 fd ff ff       	call   3a4 <putc>
        putc(fd, c);
 602:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 605:	0f be c0             	movsbl %al,%eax
 608:	89 44 24 04          	mov    %eax,0x4(%esp)
 60c:	8b 45 08             	mov    0x8(%ebp),%eax
 60f:	89 04 24             	mov    %eax,(%esp)
 612:	e8 8d fd ff ff       	call   3a4 <putc>
      }
      state = 0;
 617:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 61e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 622:	8b 55 0c             	mov    0xc(%ebp),%edx
 625:	8b 45 f0             	mov    -0x10(%ebp),%eax
 628:	01 d0                	add    %edx,%eax
 62a:	0f b6 00             	movzbl (%eax),%eax
 62d:	84 c0                	test   %al,%al
 62f:	0f 85 71 fe ff ff    	jne    4a6 <printf+0x22>
    }
  }
}
 635:	c9                   	leave  
 636:	c3                   	ret    

00000637 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 637:	55                   	push   %ebp
 638:	89 e5                	mov    %esp,%ebp
 63a:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 63d:	8b 45 08             	mov    0x8(%ebp),%eax
 640:	83 e8 08             	sub    $0x8,%eax
 643:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 646:	a1 0c 0b 00 00       	mov    0xb0c,%eax
 64b:	89 45 fc             	mov    %eax,-0x4(%ebp)
 64e:	eb 24                	jmp    674 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 650:	8b 45 fc             	mov    -0x4(%ebp),%eax
 653:	8b 00                	mov    (%eax),%eax
 655:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 658:	77 12                	ja     66c <free+0x35>
 65a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 65d:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 660:	77 24                	ja     686 <free+0x4f>
 662:	8b 45 fc             	mov    -0x4(%ebp),%eax
 665:	8b 00                	mov    (%eax),%eax
 667:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 66a:	77 1a                	ja     686 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 66c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 66f:	8b 00                	mov    (%eax),%eax
 671:	89 45 fc             	mov    %eax,-0x4(%ebp)
 674:	8b 45 f8             	mov    -0x8(%ebp),%eax
 677:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 67a:	76 d4                	jbe    650 <free+0x19>
 67c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 67f:	8b 00                	mov    (%eax),%eax
 681:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 684:	76 ca                	jbe    650 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 686:	8b 45 f8             	mov    -0x8(%ebp),%eax
 689:	8b 40 04             	mov    0x4(%eax),%eax
 68c:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 693:	8b 45 f8             	mov    -0x8(%ebp),%eax
 696:	01 c2                	add    %eax,%edx
 698:	8b 45 fc             	mov    -0x4(%ebp),%eax
 69b:	8b 00                	mov    (%eax),%eax
 69d:	39 c2                	cmp    %eax,%edx
 69f:	75 24                	jne    6c5 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 6a1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6a4:	8b 50 04             	mov    0x4(%eax),%edx
 6a7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6aa:	8b 00                	mov    (%eax),%eax
 6ac:	8b 40 04             	mov    0x4(%eax),%eax
 6af:	01 c2                	add    %eax,%edx
 6b1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6b4:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 6b7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ba:	8b 00                	mov    (%eax),%eax
 6bc:	8b 10                	mov    (%eax),%edx
 6be:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6c1:	89 10                	mov    %edx,(%eax)
 6c3:	eb 0a                	jmp    6cf <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 6c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c8:	8b 10                	mov    (%eax),%edx
 6ca:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6cd:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 6cf:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d2:	8b 40 04             	mov    0x4(%eax),%eax
 6d5:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 6dc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6df:	01 d0                	add    %edx,%eax
 6e1:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6e4:	75 20                	jne    706 <free+0xcf>
    p->s.size += bp->s.size;
 6e6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e9:	8b 50 04             	mov    0x4(%eax),%edx
 6ec:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6ef:	8b 40 04             	mov    0x4(%eax),%eax
 6f2:	01 c2                	add    %eax,%edx
 6f4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f7:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6fa:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6fd:	8b 10                	mov    (%eax),%edx
 6ff:	8b 45 fc             	mov    -0x4(%ebp),%eax
 702:	89 10                	mov    %edx,(%eax)
 704:	eb 08                	jmp    70e <free+0xd7>
  } else
    p->s.ptr = bp;
 706:	8b 45 fc             	mov    -0x4(%ebp),%eax
 709:	8b 55 f8             	mov    -0x8(%ebp),%edx
 70c:	89 10                	mov    %edx,(%eax)
  freep = p;
 70e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 711:	a3 0c 0b 00 00       	mov    %eax,0xb0c
}
 716:	c9                   	leave  
 717:	c3                   	ret    

00000718 <morecore>:

static Header*
morecore(uint nu)
{
 718:	55                   	push   %ebp
 719:	89 e5                	mov    %esp,%ebp
 71b:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 71e:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 725:	77 07                	ja     72e <morecore+0x16>
    nu = 4096;
 727:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 72e:	8b 45 08             	mov    0x8(%ebp),%eax
 731:	c1 e0 03             	shl    $0x3,%eax
 734:	89 04 24             	mov    %eax,(%esp)
 737:	e8 48 fc ff ff       	call   384 <sbrk>
 73c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 73f:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 743:	75 07                	jne    74c <morecore+0x34>
    return 0;
 745:	b8 00 00 00 00       	mov    $0x0,%eax
 74a:	eb 22                	jmp    76e <morecore+0x56>
  hp = (Header*)p;
 74c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 74f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 752:	8b 45 f0             	mov    -0x10(%ebp),%eax
 755:	8b 55 08             	mov    0x8(%ebp),%edx
 758:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 75b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 75e:	83 c0 08             	add    $0x8,%eax
 761:	89 04 24             	mov    %eax,(%esp)
 764:	e8 ce fe ff ff       	call   637 <free>
  return freep;
 769:	a1 0c 0b 00 00       	mov    0xb0c,%eax
}
 76e:	c9                   	leave  
 76f:	c3                   	ret    

00000770 <malloc>:

void*
malloc(uint nbytes)
{
 770:	55                   	push   %ebp
 771:	89 e5                	mov    %esp,%ebp
 773:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 776:	8b 45 08             	mov    0x8(%ebp),%eax
 779:	83 c0 07             	add    $0x7,%eax
 77c:	c1 e8 03             	shr    $0x3,%eax
 77f:	83 c0 01             	add    $0x1,%eax
 782:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 785:	a1 0c 0b 00 00       	mov    0xb0c,%eax
 78a:	89 45 f0             	mov    %eax,-0x10(%ebp)
 78d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 791:	75 23                	jne    7b6 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 793:	c7 45 f0 04 0b 00 00 	movl   $0xb04,-0x10(%ebp)
 79a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 79d:	a3 0c 0b 00 00       	mov    %eax,0xb0c
 7a2:	a1 0c 0b 00 00       	mov    0xb0c,%eax
 7a7:	a3 04 0b 00 00       	mov    %eax,0xb04
    base.s.size = 0;
 7ac:	c7 05 08 0b 00 00 00 	movl   $0x0,0xb08
 7b3:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7b6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7b9:	8b 00                	mov    (%eax),%eax
 7bb:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 7be:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7c1:	8b 40 04             	mov    0x4(%eax),%eax
 7c4:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 7c7:	72 4d                	jb     816 <malloc+0xa6>
      if(p->s.size == nunits)
 7c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7cc:	8b 40 04             	mov    0x4(%eax),%eax
 7cf:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 7d2:	75 0c                	jne    7e0 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 7d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7d7:	8b 10                	mov    (%eax),%edx
 7d9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7dc:	89 10                	mov    %edx,(%eax)
 7de:	eb 26                	jmp    806 <malloc+0x96>
      else {
        p->s.size -= nunits;
 7e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7e3:	8b 40 04             	mov    0x4(%eax),%eax
 7e6:	2b 45 ec             	sub    -0x14(%ebp),%eax
 7e9:	89 c2                	mov    %eax,%edx
 7eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ee:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7f4:	8b 40 04             	mov    0x4(%eax),%eax
 7f7:	c1 e0 03             	shl    $0x3,%eax
 7fa:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 7fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 800:	8b 55 ec             	mov    -0x14(%ebp),%edx
 803:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 806:	8b 45 f0             	mov    -0x10(%ebp),%eax
 809:	a3 0c 0b 00 00       	mov    %eax,0xb0c
      return (void*)(p + 1);
 80e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 811:	83 c0 08             	add    $0x8,%eax
 814:	eb 38                	jmp    84e <malloc+0xde>
    }
    if(p == freep)
 816:	a1 0c 0b 00 00       	mov    0xb0c,%eax
 81b:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 81e:	75 1b                	jne    83b <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 820:	8b 45 ec             	mov    -0x14(%ebp),%eax
 823:	89 04 24             	mov    %eax,(%esp)
 826:	e8 ed fe ff ff       	call   718 <morecore>
 82b:	89 45 f4             	mov    %eax,-0xc(%ebp)
 82e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 832:	75 07                	jne    83b <malloc+0xcb>
        return 0;
 834:	b8 00 00 00 00       	mov    $0x0,%eax
 839:	eb 13                	jmp    84e <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 83b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 83e:	89 45 f0             	mov    %eax,-0x10(%ebp)
 841:	8b 45 f4             	mov    -0xc(%ebp),%eax
 844:	8b 00                	mov    (%eax),%eax
 846:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 849:	e9 70 ff ff ff       	jmp    7be <malloc+0x4e>
}
 84e:	c9                   	leave  
 84f:	c3                   	ret    
