
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
   9:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
  10:	00 
  11:	c7 04 24 d3 08 00 00 	movl   $0x8d3,(%esp)
  18:	e8 9f 03 00 00       	call   3bc <open>
  1d:	85 c0                	test   %eax,%eax
  1f:	79 30                	jns    51 <main+0x51>
    mknod("console", 1, 1);
  21:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
  28:	00 
  29:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  30:	00 
  31:	c7 04 24 d3 08 00 00 	movl   $0x8d3,(%esp)
  38:	e8 87 03 00 00       	call   3c4 <mknod>
    open("console", O_RDWR);
  3d:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
  44:	00 
  45:	c7 04 24 d3 08 00 00 	movl   $0x8d3,(%esp)
  4c:	e8 6b 03 00 00       	call   3bc <open>
  }
  dup(0);  // stdout
  51:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  58:	e8 97 03 00 00       	call   3f4 <dup>
  dup(0);  // stderr
  5d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  64:	e8 8b 03 00 00       	call   3f4 <dup>

  for(;;){
    printf(1, "init: starting sh\n");
  69:	c7 44 24 04 db 08 00 	movl   $0x8db,0x4(%esp)
  70:	00 
  71:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  78:	e8 87 04 00 00       	call   504 <printf>
    pid = fork();
  7d:	e8 f2 02 00 00       	call   374 <fork>
  82:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    if(pid < 0){
  86:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
  8b:	79 19                	jns    a6 <main+0xa6>
      printf(1, "init: fork failed\n");
  8d:	c7 44 24 04 ee 08 00 	movl   $0x8ee,0x4(%esp)
  94:	00 
  95:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  9c:	e8 63 04 00 00       	call   504 <printf>
      exit();
  a1:	e8 d6 02 00 00       	call   37c <exit>
    }
    if(pid == 0){
  a6:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
  ab:	75 2d                	jne    da <main+0xda>
      exec("sh", argv);
  ad:	c7 44 24 04 8c 0b 00 	movl   $0xb8c,0x4(%esp)
  b4:	00 
  b5:	c7 04 24 d0 08 00 00 	movl   $0x8d0,(%esp)
  bc:	e8 f3 02 00 00       	call   3b4 <exec>
      printf(1, "init: exec sh failed\n");
  c1:	c7 44 24 04 01 09 00 	movl   $0x901,0x4(%esp)
  c8:	00 
  c9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  d0:	e8 2f 04 00 00       	call   504 <printf>
      exit();
  d5:	e8 a2 02 00 00       	call   37c <exit>
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  da:	eb 14                	jmp    f0 <main+0xf0>
      printf(1, "zombie!\n");
  dc:	c7 44 24 04 17 09 00 	movl   $0x917,0x4(%esp)
  e3:	00 
  e4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  eb:	e8 14 04 00 00       	call   504 <printf>
    while((wpid=wait()) >= 0 && wpid != pid)
  f0:	e8 8f 02 00 00       	call   384 <wait>
  f5:	89 44 24 18          	mov    %eax,0x18(%esp)
  f9:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
  fe:	78 0a                	js     10a <main+0x10a>
 100:	8b 44 24 18          	mov    0x18(%esp),%eax
 104:	3b 44 24 1c          	cmp    0x1c(%esp),%eax
 108:	75 d2                	jne    dc <main+0xdc>
  }
 10a:	e9 5a ff ff ff       	jmp    69 <main+0x69>

0000010f <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 10f:	55                   	push   %ebp
 110:	89 e5                	mov    %esp,%ebp
 112:	57                   	push   %edi
 113:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 114:	8b 4d 08             	mov    0x8(%ebp),%ecx
 117:	8b 55 10             	mov    0x10(%ebp),%edx
 11a:	8b 45 0c             	mov    0xc(%ebp),%eax
 11d:	89 cb                	mov    %ecx,%ebx
 11f:	89 df                	mov    %ebx,%edi
 121:	89 d1                	mov    %edx,%ecx
 123:	fc                   	cld    
 124:	f3 aa                	rep stos %al,%es:(%edi)
 126:	89 ca                	mov    %ecx,%edx
 128:	89 fb                	mov    %edi,%ebx
 12a:	89 5d 08             	mov    %ebx,0x8(%ebp)
 12d:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 130:	5b                   	pop    %ebx
 131:	5f                   	pop    %edi
 132:	5d                   	pop    %ebp
 133:	c3                   	ret    

00000134 <ps>:
#include "stat.h"
#include "fcntl.h"
#include "user.h"
#include "x86.h"

void ps(){
 134:	55                   	push   %ebp
 135:	89 e5                	mov    %esp,%ebp
  
 //  pstatTable * pst = getpinfo
}
 137:	5d                   	pop    %ebp
 138:	c3                   	ret    

00000139 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 139:	55                   	push   %ebp
 13a:	89 e5                	mov    %esp,%ebp
 13c:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 13f:	8b 45 08             	mov    0x8(%ebp),%eax
 142:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 145:	90                   	nop
 146:	8b 45 08             	mov    0x8(%ebp),%eax
 149:	8d 50 01             	lea    0x1(%eax),%edx
 14c:	89 55 08             	mov    %edx,0x8(%ebp)
 14f:	8b 55 0c             	mov    0xc(%ebp),%edx
 152:	8d 4a 01             	lea    0x1(%edx),%ecx
 155:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 158:	0f b6 12             	movzbl (%edx),%edx
 15b:	88 10                	mov    %dl,(%eax)
 15d:	0f b6 00             	movzbl (%eax),%eax
 160:	84 c0                	test   %al,%al
 162:	75 e2                	jne    146 <strcpy+0xd>
    ;
  return os;
 164:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 167:	c9                   	leave  
 168:	c3                   	ret    

00000169 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 169:	55                   	push   %ebp
 16a:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 16c:	eb 08                	jmp    176 <strcmp+0xd>
    p++, q++;
 16e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 172:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 176:	8b 45 08             	mov    0x8(%ebp),%eax
 179:	0f b6 00             	movzbl (%eax),%eax
 17c:	84 c0                	test   %al,%al
 17e:	74 10                	je     190 <strcmp+0x27>
 180:	8b 45 08             	mov    0x8(%ebp),%eax
 183:	0f b6 10             	movzbl (%eax),%edx
 186:	8b 45 0c             	mov    0xc(%ebp),%eax
 189:	0f b6 00             	movzbl (%eax),%eax
 18c:	38 c2                	cmp    %al,%dl
 18e:	74 de                	je     16e <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 190:	8b 45 08             	mov    0x8(%ebp),%eax
 193:	0f b6 00             	movzbl (%eax),%eax
 196:	0f b6 d0             	movzbl %al,%edx
 199:	8b 45 0c             	mov    0xc(%ebp),%eax
 19c:	0f b6 00             	movzbl (%eax),%eax
 19f:	0f b6 c0             	movzbl %al,%eax
 1a2:	29 c2                	sub    %eax,%edx
 1a4:	89 d0                	mov    %edx,%eax
}
 1a6:	5d                   	pop    %ebp
 1a7:	c3                   	ret    

000001a8 <strlen>:

uint
strlen(const char *s)
{
 1a8:	55                   	push   %ebp
 1a9:	89 e5                	mov    %esp,%ebp
 1ab:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 1ae:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1b5:	eb 04                	jmp    1bb <strlen+0x13>
 1b7:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1bb:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1be:	8b 45 08             	mov    0x8(%ebp),%eax
 1c1:	01 d0                	add    %edx,%eax
 1c3:	0f b6 00             	movzbl (%eax),%eax
 1c6:	84 c0                	test   %al,%al
 1c8:	75 ed                	jne    1b7 <strlen+0xf>
    ;
  return n;
 1ca:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1cd:	c9                   	leave  
 1ce:	c3                   	ret    

000001cf <memset>:

void*
memset(void *dst, int c, uint n)
{
 1cf:	55                   	push   %ebp
 1d0:	89 e5                	mov    %esp,%ebp
 1d2:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 1d5:	8b 45 10             	mov    0x10(%ebp),%eax
 1d8:	89 44 24 08          	mov    %eax,0x8(%esp)
 1dc:	8b 45 0c             	mov    0xc(%ebp),%eax
 1df:	89 44 24 04          	mov    %eax,0x4(%esp)
 1e3:	8b 45 08             	mov    0x8(%ebp),%eax
 1e6:	89 04 24             	mov    %eax,(%esp)
 1e9:	e8 21 ff ff ff       	call   10f <stosb>
  return dst;
 1ee:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1f1:	c9                   	leave  
 1f2:	c3                   	ret    

000001f3 <strchr>:

char*
strchr(const char *s, char c)
{
 1f3:	55                   	push   %ebp
 1f4:	89 e5                	mov    %esp,%ebp
 1f6:	83 ec 04             	sub    $0x4,%esp
 1f9:	8b 45 0c             	mov    0xc(%ebp),%eax
 1fc:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 1ff:	eb 14                	jmp    215 <strchr+0x22>
    if(*s == c)
 201:	8b 45 08             	mov    0x8(%ebp),%eax
 204:	0f b6 00             	movzbl (%eax),%eax
 207:	3a 45 fc             	cmp    -0x4(%ebp),%al
 20a:	75 05                	jne    211 <strchr+0x1e>
      return (char*)s;
 20c:	8b 45 08             	mov    0x8(%ebp),%eax
 20f:	eb 13                	jmp    224 <strchr+0x31>
  for(; *s; s++)
 211:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 215:	8b 45 08             	mov    0x8(%ebp),%eax
 218:	0f b6 00             	movzbl (%eax),%eax
 21b:	84 c0                	test   %al,%al
 21d:	75 e2                	jne    201 <strchr+0xe>
  return 0;
 21f:	b8 00 00 00 00       	mov    $0x0,%eax
}
 224:	c9                   	leave  
 225:	c3                   	ret    

00000226 <gets>:

char*
gets(char *buf, int max)
{
 226:	55                   	push   %ebp
 227:	89 e5                	mov    %esp,%ebp
 229:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 22c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 233:	eb 4c                	jmp    281 <gets+0x5b>
    cc = read(0, &c, 1);
 235:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 23c:	00 
 23d:	8d 45 ef             	lea    -0x11(%ebp),%eax
 240:	89 44 24 04          	mov    %eax,0x4(%esp)
 244:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 24b:	e8 44 01 00 00       	call   394 <read>
 250:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 253:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 257:	7f 02                	jg     25b <gets+0x35>
      break;
 259:	eb 31                	jmp    28c <gets+0x66>
    buf[i++] = c;
 25b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 25e:	8d 50 01             	lea    0x1(%eax),%edx
 261:	89 55 f4             	mov    %edx,-0xc(%ebp)
 264:	89 c2                	mov    %eax,%edx
 266:	8b 45 08             	mov    0x8(%ebp),%eax
 269:	01 c2                	add    %eax,%edx
 26b:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 26f:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 271:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 275:	3c 0a                	cmp    $0xa,%al
 277:	74 13                	je     28c <gets+0x66>
 279:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 27d:	3c 0d                	cmp    $0xd,%al
 27f:	74 0b                	je     28c <gets+0x66>
  for(i=0; i+1 < max; ){
 281:	8b 45 f4             	mov    -0xc(%ebp),%eax
 284:	83 c0 01             	add    $0x1,%eax
 287:	3b 45 0c             	cmp    0xc(%ebp),%eax
 28a:	7c a9                	jl     235 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 28c:	8b 55 f4             	mov    -0xc(%ebp),%edx
 28f:	8b 45 08             	mov    0x8(%ebp),%eax
 292:	01 d0                	add    %edx,%eax
 294:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 297:	8b 45 08             	mov    0x8(%ebp),%eax
}
 29a:	c9                   	leave  
 29b:	c3                   	ret    

0000029c <stat>:

int
stat(const char *n, struct stat *st)
{
 29c:	55                   	push   %ebp
 29d:	89 e5                	mov    %esp,%ebp
 29f:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2a2:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2a9:	00 
 2aa:	8b 45 08             	mov    0x8(%ebp),%eax
 2ad:	89 04 24             	mov    %eax,(%esp)
 2b0:	e8 07 01 00 00       	call   3bc <open>
 2b5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 2b8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2bc:	79 07                	jns    2c5 <stat+0x29>
    return -1;
 2be:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2c3:	eb 23                	jmp    2e8 <stat+0x4c>
  r = fstat(fd, st);
 2c5:	8b 45 0c             	mov    0xc(%ebp),%eax
 2c8:	89 44 24 04          	mov    %eax,0x4(%esp)
 2cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2cf:	89 04 24             	mov    %eax,(%esp)
 2d2:	e8 fd 00 00 00       	call   3d4 <fstat>
 2d7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 2da:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2dd:	89 04 24             	mov    %eax,(%esp)
 2e0:	e8 bf 00 00 00       	call   3a4 <close>
  return r;
 2e5:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 2e8:	c9                   	leave  
 2e9:	c3                   	ret    

000002ea <atoi>:

int
atoi(const char *s)
{
 2ea:	55                   	push   %ebp
 2eb:	89 e5                	mov    %esp,%ebp
 2ed:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 2f0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 2f7:	eb 25                	jmp    31e <atoi+0x34>
    n = n*10 + *s++ - '0';
 2f9:	8b 55 fc             	mov    -0x4(%ebp),%edx
 2fc:	89 d0                	mov    %edx,%eax
 2fe:	c1 e0 02             	shl    $0x2,%eax
 301:	01 d0                	add    %edx,%eax
 303:	01 c0                	add    %eax,%eax
 305:	89 c1                	mov    %eax,%ecx
 307:	8b 45 08             	mov    0x8(%ebp),%eax
 30a:	8d 50 01             	lea    0x1(%eax),%edx
 30d:	89 55 08             	mov    %edx,0x8(%ebp)
 310:	0f b6 00             	movzbl (%eax),%eax
 313:	0f be c0             	movsbl %al,%eax
 316:	01 c8                	add    %ecx,%eax
 318:	83 e8 30             	sub    $0x30,%eax
 31b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 31e:	8b 45 08             	mov    0x8(%ebp),%eax
 321:	0f b6 00             	movzbl (%eax),%eax
 324:	3c 2f                	cmp    $0x2f,%al
 326:	7e 0a                	jle    332 <atoi+0x48>
 328:	8b 45 08             	mov    0x8(%ebp),%eax
 32b:	0f b6 00             	movzbl (%eax),%eax
 32e:	3c 39                	cmp    $0x39,%al
 330:	7e c7                	jle    2f9 <atoi+0xf>
  return n;
 332:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 335:	c9                   	leave  
 336:	c3                   	ret    

00000337 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 337:	55                   	push   %ebp
 338:	89 e5                	mov    %esp,%ebp
 33a:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 33d:	8b 45 08             	mov    0x8(%ebp),%eax
 340:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 343:	8b 45 0c             	mov    0xc(%ebp),%eax
 346:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 349:	eb 17                	jmp    362 <memmove+0x2b>
    *dst++ = *src++;
 34b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 34e:	8d 50 01             	lea    0x1(%eax),%edx
 351:	89 55 fc             	mov    %edx,-0x4(%ebp)
 354:	8b 55 f8             	mov    -0x8(%ebp),%edx
 357:	8d 4a 01             	lea    0x1(%edx),%ecx
 35a:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 35d:	0f b6 12             	movzbl (%edx),%edx
 360:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 362:	8b 45 10             	mov    0x10(%ebp),%eax
 365:	8d 50 ff             	lea    -0x1(%eax),%edx
 368:	89 55 10             	mov    %edx,0x10(%ebp)
 36b:	85 c0                	test   %eax,%eax
 36d:	7f dc                	jg     34b <memmove+0x14>
  return vdst;
 36f:	8b 45 08             	mov    0x8(%ebp),%eax
}
 372:	c9                   	leave  
 373:	c3                   	ret    

00000374 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 374:	b8 01 00 00 00       	mov    $0x1,%eax
 379:	cd 40                	int    $0x40
 37b:	c3                   	ret    

0000037c <exit>:
SYSCALL(exit)
 37c:	b8 02 00 00 00       	mov    $0x2,%eax
 381:	cd 40                	int    $0x40
 383:	c3                   	ret    

00000384 <wait>:
SYSCALL(wait)
 384:	b8 03 00 00 00       	mov    $0x3,%eax
 389:	cd 40                	int    $0x40
 38b:	c3                   	ret    

0000038c <pipe>:
SYSCALL(pipe)
 38c:	b8 04 00 00 00       	mov    $0x4,%eax
 391:	cd 40                	int    $0x40
 393:	c3                   	ret    

00000394 <read>:
SYSCALL(read)
 394:	b8 05 00 00 00       	mov    $0x5,%eax
 399:	cd 40                	int    $0x40
 39b:	c3                   	ret    

0000039c <write>:
SYSCALL(write)
 39c:	b8 10 00 00 00       	mov    $0x10,%eax
 3a1:	cd 40                	int    $0x40
 3a3:	c3                   	ret    

000003a4 <close>:
SYSCALL(close)
 3a4:	b8 15 00 00 00       	mov    $0x15,%eax
 3a9:	cd 40                	int    $0x40
 3ab:	c3                   	ret    

000003ac <kill>:
SYSCALL(kill)
 3ac:	b8 06 00 00 00       	mov    $0x6,%eax
 3b1:	cd 40                	int    $0x40
 3b3:	c3                   	ret    

000003b4 <exec>:
SYSCALL(exec)
 3b4:	b8 07 00 00 00       	mov    $0x7,%eax
 3b9:	cd 40                	int    $0x40
 3bb:	c3                   	ret    

000003bc <open>:
SYSCALL(open)
 3bc:	b8 0f 00 00 00       	mov    $0xf,%eax
 3c1:	cd 40                	int    $0x40
 3c3:	c3                   	ret    

000003c4 <mknod>:
SYSCALL(mknod)
 3c4:	b8 11 00 00 00       	mov    $0x11,%eax
 3c9:	cd 40                	int    $0x40
 3cb:	c3                   	ret    

000003cc <unlink>:
SYSCALL(unlink)
 3cc:	b8 12 00 00 00       	mov    $0x12,%eax
 3d1:	cd 40                	int    $0x40
 3d3:	c3                   	ret    

000003d4 <fstat>:
SYSCALL(fstat)
 3d4:	b8 08 00 00 00       	mov    $0x8,%eax
 3d9:	cd 40                	int    $0x40
 3db:	c3                   	ret    

000003dc <link>:
SYSCALL(link)
 3dc:	b8 13 00 00 00       	mov    $0x13,%eax
 3e1:	cd 40                	int    $0x40
 3e3:	c3                   	ret    

000003e4 <mkdir>:
SYSCALL(mkdir)
 3e4:	b8 14 00 00 00       	mov    $0x14,%eax
 3e9:	cd 40                	int    $0x40
 3eb:	c3                   	ret    

000003ec <chdir>:
SYSCALL(chdir)
 3ec:	b8 09 00 00 00       	mov    $0x9,%eax
 3f1:	cd 40                	int    $0x40
 3f3:	c3                   	ret    

000003f4 <dup>:
SYSCALL(dup)
 3f4:	b8 0a 00 00 00       	mov    $0xa,%eax
 3f9:	cd 40                	int    $0x40
 3fb:	c3                   	ret    

000003fc <getpid>:
SYSCALL(getpid)
 3fc:	b8 0b 00 00 00       	mov    $0xb,%eax
 401:	cd 40                	int    $0x40
 403:	c3                   	ret    

00000404 <sbrk>:
SYSCALL(sbrk)
 404:	b8 0c 00 00 00       	mov    $0xc,%eax
 409:	cd 40                	int    $0x40
 40b:	c3                   	ret    

0000040c <sleep>:
SYSCALL(sleep)
 40c:	b8 0d 00 00 00       	mov    $0xd,%eax
 411:	cd 40                	int    $0x40
 413:	c3                   	ret    

00000414 <uptime>:
SYSCALL(uptime)
 414:	b8 0e 00 00 00       	mov    $0xe,%eax
 419:	cd 40                	int    $0x40
 41b:	c3                   	ret    

0000041c <getpinfo>:
SYSCALL(getpinfo)
 41c:	b8 16 00 00 00       	mov    $0x16,%eax
 421:	cd 40                	int    $0x40
 423:	c3                   	ret    

00000424 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 424:	55                   	push   %ebp
 425:	89 e5                	mov    %esp,%ebp
 427:	83 ec 18             	sub    $0x18,%esp
 42a:	8b 45 0c             	mov    0xc(%ebp),%eax
 42d:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 430:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 437:	00 
 438:	8d 45 f4             	lea    -0xc(%ebp),%eax
 43b:	89 44 24 04          	mov    %eax,0x4(%esp)
 43f:	8b 45 08             	mov    0x8(%ebp),%eax
 442:	89 04 24             	mov    %eax,(%esp)
 445:	e8 52 ff ff ff       	call   39c <write>
}
 44a:	c9                   	leave  
 44b:	c3                   	ret    

0000044c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 44c:	55                   	push   %ebp
 44d:	89 e5                	mov    %esp,%ebp
 44f:	56                   	push   %esi
 450:	53                   	push   %ebx
 451:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 454:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 45b:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 45f:	74 17                	je     478 <printint+0x2c>
 461:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 465:	79 11                	jns    478 <printint+0x2c>
    neg = 1;
 467:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 46e:	8b 45 0c             	mov    0xc(%ebp),%eax
 471:	f7 d8                	neg    %eax
 473:	89 45 ec             	mov    %eax,-0x14(%ebp)
 476:	eb 06                	jmp    47e <printint+0x32>
  } else {
    x = xx;
 478:	8b 45 0c             	mov    0xc(%ebp),%eax
 47b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 47e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 485:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 488:	8d 41 01             	lea    0x1(%ecx),%eax
 48b:	89 45 f4             	mov    %eax,-0xc(%ebp)
 48e:	8b 5d 10             	mov    0x10(%ebp),%ebx
 491:	8b 45 ec             	mov    -0x14(%ebp),%eax
 494:	ba 00 00 00 00       	mov    $0x0,%edx
 499:	f7 f3                	div    %ebx
 49b:	89 d0                	mov    %edx,%eax
 49d:	0f b6 80 94 0b 00 00 	movzbl 0xb94(%eax),%eax
 4a4:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 4a8:	8b 75 10             	mov    0x10(%ebp),%esi
 4ab:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4ae:	ba 00 00 00 00       	mov    $0x0,%edx
 4b3:	f7 f6                	div    %esi
 4b5:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4b8:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4bc:	75 c7                	jne    485 <printint+0x39>
  if(neg)
 4be:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4c2:	74 10                	je     4d4 <printint+0x88>
    buf[i++] = '-';
 4c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4c7:	8d 50 01             	lea    0x1(%eax),%edx
 4ca:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4cd:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 4d2:	eb 1f                	jmp    4f3 <printint+0xa7>
 4d4:	eb 1d                	jmp    4f3 <printint+0xa7>
    putc(fd, buf[i]);
 4d6:	8d 55 dc             	lea    -0x24(%ebp),%edx
 4d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4dc:	01 d0                	add    %edx,%eax
 4de:	0f b6 00             	movzbl (%eax),%eax
 4e1:	0f be c0             	movsbl %al,%eax
 4e4:	89 44 24 04          	mov    %eax,0x4(%esp)
 4e8:	8b 45 08             	mov    0x8(%ebp),%eax
 4eb:	89 04 24             	mov    %eax,(%esp)
 4ee:	e8 31 ff ff ff       	call   424 <putc>
  while(--i >= 0)
 4f3:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 4f7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4fb:	79 d9                	jns    4d6 <printint+0x8a>
}
 4fd:	83 c4 30             	add    $0x30,%esp
 500:	5b                   	pop    %ebx
 501:	5e                   	pop    %esi
 502:	5d                   	pop    %ebp
 503:	c3                   	ret    

00000504 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 504:	55                   	push   %ebp
 505:	89 e5                	mov    %esp,%ebp
 507:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 50a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 511:	8d 45 0c             	lea    0xc(%ebp),%eax
 514:	83 c0 04             	add    $0x4,%eax
 517:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 51a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 521:	e9 7c 01 00 00       	jmp    6a2 <printf+0x19e>
    c = fmt[i] & 0xff;
 526:	8b 55 0c             	mov    0xc(%ebp),%edx
 529:	8b 45 f0             	mov    -0x10(%ebp),%eax
 52c:	01 d0                	add    %edx,%eax
 52e:	0f b6 00             	movzbl (%eax),%eax
 531:	0f be c0             	movsbl %al,%eax
 534:	25 ff 00 00 00       	and    $0xff,%eax
 539:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 53c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 540:	75 2c                	jne    56e <printf+0x6a>
      if(c == '%'){
 542:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 546:	75 0c                	jne    554 <printf+0x50>
        state = '%';
 548:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 54f:	e9 4a 01 00 00       	jmp    69e <printf+0x19a>
      } else {
        putc(fd, c);
 554:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 557:	0f be c0             	movsbl %al,%eax
 55a:	89 44 24 04          	mov    %eax,0x4(%esp)
 55e:	8b 45 08             	mov    0x8(%ebp),%eax
 561:	89 04 24             	mov    %eax,(%esp)
 564:	e8 bb fe ff ff       	call   424 <putc>
 569:	e9 30 01 00 00       	jmp    69e <printf+0x19a>
      }
    } else if(state == '%'){
 56e:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 572:	0f 85 26 01 00 00    	jne    69e <printf+0x19a>
      if(c == 'd'){
 578:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 57c:	75 2d                	jne    5ab <printf+0xa7>
        printint(fd, *ap, 10, 1);
 57e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 581:	8b 00                	mov    (%eax),%eax
 583:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 58a:	00 
 58b:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 592:	00 
 593:	89 44 24 04          	mov    %eax,0x4(%esp)
 597:	8b 45 08             	mov    0x8(%ebp),%eax
 59a:	89 04 24             	mov    %eax,(%esp)
 59d:	e8 aa fe ff ff       	call   44c <printint>
        ap++;
 5a2:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5a6:	e9 ec 00 00 00       	jmp    697 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 5ab:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 5af:	74 06                	je     5b7 <printf+0xb3>
 5b1:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 5b5:	75 2d                	jne    5e4 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 5b7:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5ba:	8b 00                	mov    (%eax),%eax
 5bc:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 5c3:	00 
 5c4:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 5cb:	00 
 5cc:	89 44 24 04          	mov    %eax,0x4(%esp)
 5d0:	8b 45 08             	mov    0x8(%ebp),%eax
 5d3:	89 04 24             	mov    %eax,(%esp)
 5d6:	e8 71 fe ff ff       	call   44c <printint>
        ap++;
 5db:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5df:	e9 b3 00 00 00       	jmp    697 <printf+0x193>
      } else if(c == 's'){
 5e4:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 5e8:	75 45                	jne    62f <printf+0x12b>
        s = (char*)*ap;
 5ea:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5ed:	8b 00                	mov    (%eax),%eax
 5ef:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 5f2:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 5f6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5fa:	75 09                	jne    605 <printf+0x101>
          s = "(null)";
 5fc:	c7 45 f4 20 09 00 00 	movl   $0x920,-0xc(%ebp)
        while(*s != 0){
 603:	eb 1e                	jmp    623 <printf+0x11f>
 605:	eb 1c                	jmp    623 <printf+0x11f>
          putc(fd, *s);
 607:	8b 45 f4             	mov    -0xc(%ebp),%eax
 60a:	0f b6 00             	movzbl (%eax),%eax
 60d:	0f be c0             	movsbl %al,%eax
 610:	89 44 24 04          	mov    %eax,0x4(%esp)
 614:	8b 45 08             	mov    0x8(%ebp),%eax
 617:	89 04 24             	mov    %eax,(%esp)
 61a:	e8 05 fe ff ff       	call   424 <putc>
          s++;
 61f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 623:	8b 45 f4             	mov    -0xc(%ebp),%eax
 626:	0f b6 00             	movzbl (%eax),%eax
 629:	84 c0                	test   %al,%al
 62b:	75 da                	jne    607 <printf+0x103>
 62d:	eb 68                	jmp    697 <printf+0x193>
        }
      } else if(c == 'c'){
 62f:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 633:	75 1d                	jne    652 <printf+0x14e>
        putc(fd, *ap);
 635:	8b 45 e8             	mov    -0x18(%ebp),%eax
 638:	8b 00                	mov    (%eax),%eax
 63a:	0f be c0             	movsbl %al,%eax
 63d:	89 44 24 04          	mov    %eax,0x4(%esp)
 641:	8b 45 08             	mov    0x8(%ebp),%eax
 644:	89 04 24             	mov    %eax,(%esp)
 647:	e8 d8 fd ff ff       	call   424 <putc>
        ap++;
 64c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 650:	eb 45                	jmp    697 <printf+0x193>
      } else if(c == '%'){
 652:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 656:	75 17                	jne    66f <printf+0x16b>
        putc(fd, c);
 658:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 65b:	0f be c0             	movsbl %al,%eax
 65e:	89 44 24 04          	mov    %eax,0x4(%esp)
 662:	8b 45 08             	mov    0x8(%ebp),%eax
 665:	89 04 24             	mov    %eax,(%esp)
 668:	e8 b7 fd ff ff       	call   424 <putc>
 66d:	eb 28                	jmp    697 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 66f:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 676:	00 
 677:	8b 45 08             	mov    0x8(%ebp),%eax
 67a:	89 04 24             	mov    %eax,(%esp)
 67d:	e8 a2 fd ff ff       	call   424 <putc>
        putc(fd, c);
 682:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 685:	0f be c0             	movsbl %al,%eax
 688:	89 44 24 04          	mov    %eax,0x4(%esp)
 68c:	8b 45 08             	mov    0x8(%ebp),%eax
 68f:	89 04 24             	mov    %eax,(%esp)
 692:	e8 8d fd ff ff       	call   424 <putc>
      }
      state = 0;
 697:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 69e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 6a2:	8b 55 0c             	mov    0xc(%ebp),%edx
 6a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6a8:	01 d0                	add    %edx,%eax
 6aa:	0f b6 00             	movzbl (%eax),%eax
 6ad:	84 c0                	test   %al,%al
 6af:	0f 85 71 fe ff ff    	jne    526 <printf+0x22>
    }
  }
}
 6b5:	c9                   	leave  
 6b6:	c3                   	ret    

000006b7 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6b7:	55                   	push   %ebp
 6b8:	89 e5                	mov    %esp,%ebp
 6ba:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6bd:	8b 45 08             	mov    0x8(%ebp),%eax
 6c0:	83 e8 08             	sub    $0x8,%eax
 6c3:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6c6:	a1 b0 0b 00 00       	mov    0xbb0,%eax
 6cb:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6ce:	eb 24                	jmp    6f4 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6d0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d3:	8b 00                	mov    (%eax),%eax
 6d5:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6d8:	77 12                	ja     6ec <free+0x35>
 6da:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6dd:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6e0:	77 24                	ja     706 <free+0x4f>
 6e2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e5:	8b 00                	mov    (%eax),%eax
 6e7:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6ea:	77 1a                	ja     706 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6ec:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ef:	8b 00                	mov    (%eax),%eax
 6f1:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6f4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6f7:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6fa:	76 d4                	jbe    6d0 <free+0x19>
 6fc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ff:	8b 00                	mov    (%eax),%eax
 701:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 704:	76 ca                	jbe    6d0 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 706:	8b 45 f8             	mov    -0x8(%ebp),%eax
 709:	8b 40 04             	mov    0x4(%eax),%eax
 70c:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 713:	8b 45 f8             	mov    -0x8(%ebp),%eax
 716:	01 c2                	add    %eax,%edx
 718:	8b 45 fc             	mov    -0x4(%ebp),%eax
 71b:	8b 00                	mov    (%eax),%eax
 71d:	39 c2                	cmp    %eax,%edx
 71f:	75 24                	jne    745 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 721:	8b 45 f8             	mov    -0x8(%ebp),%eax
 724:	8b 50 04             	mov    0x4(%eax),%edx
 727:	8b 45 fc             	mov    -0x4(%ebp),%eax
 72a:	8b 00                	mov    (%eax),%eax
 72c:	8b 40 04             	mov    0x4(%eax),%eax
 72f:	01 c2                	add    %eax,%edx
 731:	8b 45 f8             	mov    -0x8(%ebp),%eax
 734:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 737:	8b 45 fc             	mov    -0x4(%ebp),%eax
 73a:	8b 00                	mov    (%eax),%eax
 73c:	8b 10                	mov    (%eax),%edx
 73e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 741:	89 10                	mov    %edx,(%eax)
 743:	eb 0a                	jmp    74f <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 745:	8b 45 fc             	mov    -0x4(%ebp),%eax
 748:	8b 10                	mov    (%eax),%edx
 74a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 74d:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 74f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 752:	8b 40 04             	mov    0x4(%eax),%eax
 755:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 75c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 75f:	01 d0                	add    %edx,%eax
 761:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 764:	75 20                	jne    786 <free+0xcf>
    p->s.size += bp->s.size;
 766:	8b 45 fc             	mov    -0x4(%ebp),%eax
 769:	8b 50 04             	mov    0x4(%eax),%edx
 76c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 76f:	8b 40 04             	mov    0x4(%eax),%eax
 772:	01 c2                	add    %eax,%edx
 774:	8b 45 fc             	mov    -0x4(%ebp),%eax
 777:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 77a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 77d:	8b 10                	mov    (%eax),%edx
 77f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 782:	89 10                	mov    %edx,(%eax)
 784:	eb 08                	jmp    78e <free+0xd7>
  } else
    p->s.ptr = bp;
 786:	8b 45 fc             	mov    -0x4(%ebp),%eax
 789:	8b 55 f8             	mov    -0x8(%ebp),%edx
 78c:	89 10                	mov    %edx,(%eax)
  freep = p;
 78e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 791:	a3 b0 0b 00 00       	mov    %eax,0xbb0
}
 796:	c9                   	leave  
 797:	c3                   	ret    

00000798 <morecore>:

static Header*
morecore(uint nu)
{
 798:	55                   	push   %ebp
 799:	89 e5                	mov    %esp,%ebp
 79b:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 79e:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 7a5:	77 07                	ja     7ae <morecore+0x16>
    nu = 4096;
 7a7:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 7ae:	8b 45 08             	mov    0x8(%ebp),%eax
 7b1:	c1 e0 03             	shl    $0x3,%eax
 7b4:	89 04 24             	mov    %eax,(%esp)
 7b7:	e8 48 fc ff ff       	call   404 <sbrk>
 7bc:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 7bf:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 7c3:	75 07                	jne    7cc <morecore+0x34>
    return 0;
 7c5:	b8 00 00 00 00       	mov    $0x0,%eax
 7ca:	eb 22                	jmp    7ee <morecore+0x56>
  hp = (Header*)p;
 7cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7cf:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 7d2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7d5:	8b 55 08             	mov    0x8(%ebp),%edx
 7d8:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 7db:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7de:	83 c0 08             	add    $0x8,%eax
 7e1:	89 04 24             	mov    %eax,(%esp)
 7e4:	e8 ce fe ff ff       	call   6b7 <free>
  return freep;
 7e9:	a1 b0 0b 00 00       	mov    0xbb0,%eax
}
 7ee:	c9                   	leave  
 7ef:	c3                   	ret    

000007f0 <malloc>:

void*
malloc(uint nbytes)
{
 7f0:	55                   	push   %ebp
 7f1:	89 e5                	mov    %esp,%ebp
 7f3:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7f6:	8b 45 08             	mov    0x8(%ebp),%eax
 7f9:	83 c0 07             	add    $0x7,%eax
 7fc:	c1 e8 03             	shr    $0x3,%eax
 7ff:	83 c0 01             	add    $0x1,%eax
 802:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 805:	a1 b0 0b 00 00       	mov    0xbb0,%eax
 80a:	89 45 f0             	mov    %eax,-0x10(%ebp)
 80d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 811:	75 23                	jne    836 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 813:	c7 45 f0 a8 0b 00 00 	movl   $0xba8,-0x10(%ebp)
 81a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 81d:	a3 b0 0b 00 00       	mov    %eax,0xbb0
 822:	a1 b0 0b 00 00       	mov    0xbb0,%eax
 827:	a3 a8 0b 00 00       	mov    %eax,0xba8
    base.s.size = 0;
 82c:	c7 05 ac 0b 00 00 00 	movl   $0x0,0xbac
 833:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 836:	8b 45 f0             	mov    -0x10(%ebp),%eax
 839:	8b 00                	mov    (%eax),%eax
 83b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 83e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 841:	8b 40 04             	mov    0x4(%eax),%eax
 844:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 847:	72 4d                	jb     896 <malloc+0xa6>
      if(p->s.size == nunits)
 849:	8b 45 f4             	mov    -0xc(%ebp),%eax
 84c:	8b 40 04             	mov    0x4(%eax),%eax
 84f:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 852:	75 0c                	jne    860 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 854:	8b 45 f4             	mov    -0xc(%ebp),%eax
 857:	8b 10                	mov    (%eax),%edx
 859:	8b 45 f0             	mov    -0x10(%ebp),%eax
 85c:	89 10                	mov    %edx,(%eax)
 85e:	eb 26                	jmp    886 <malloc+0x96>
      else {
        p->s.size -= nunits;
 860:	8b 45 f4             	mov    -0xc(%ebp),%eax
 863:	8b 40 04             	mov    0x4(%eax),%eax
 866:	2b 45 ec             	sub    -0x14(%ebp),%eax
 869:	89 c2                	mov    %eax,%edx
 86b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 86e:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 871:	8b 45 f4             	mov    -0xc(%ebp),%eax
 874:	8b 40 04             	mov    0x4(%eax),%eax
 877:	c1 e0 03             	shl    $0x3,%eax
 87a:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 87d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 880:	8b 55 ec             	mov    -0x14(%ebp),%edx
 883:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 886:	8b 45 f0             	mov    -0x10(%ebp),%eax
 889:	a3 b0 0b 00 00       	mov    %eax,0xbb0
      return (void*)(p + 1);
 88e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 891:	83 c0 08             	add    $0x8,%eax
 894:	eb 38                	jmp    8ce <malloc+0xde>
    }
    if(p == freep)
 896:	a1 b0 0b 00 00       	mov    0xbb0,%eax
 89b:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 89e:	75 1b                	jne    8bb <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 8a0:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8a3:	89 04 24             	mov    %eax,(%esp)
 8a6:	e8 ed fe ff ff       	call   798 <morecore>
 8ab:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8ae:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8b2:	75 07                	jne    8bb <malloc+0xcb>
        return 0;
 8b4:	b8 00 00 00 00       	mov    $0x0,%eax
 8b9:	eb 13                	jmp    8ce <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8be:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8c4:	8b 00                	mov    (%eax),%eax
 8c6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 8c9:	e9 70 ff ff ff       	jmp    83e <malloc+0x4e>
}
 8ce:	c9                   	leave  
 8cf:	c3                   	ret    
