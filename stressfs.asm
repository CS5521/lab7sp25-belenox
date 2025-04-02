
_stressfs:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	81 ec 30 02 00 00    	sub    $0x230,%esp
  int fd, i;
  char path[] = "stressfs0";
   c:	c7 84 24 1e 02 00 00 	movl   $0x65727473,0x21e(%esp)
  13:	73 74 72 65 
  17:	c7 84 24 22 02 00 00 	movl   $0x73667373,0x222(%esp)
  1e:	73 73 66 73 
  22:	66 c7 84 24 26 02 00 	movw   $0x30,0x226(%esp)
  29:	00 30 00 
  char data[512];

  printf(1, "stressfs starting\n");
  2c:	c7 44 24 04 74 09 00 	movl   $0x974,0x4(%esp)
  33:	00 
  34:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  3b:	e8 68 05 00 00       	call   5a8 <printf>
  memset(data, 'a', sizeof(data));
  40:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  47:	00 
  48:	c7 44 24 04 61 00 00 	movl   $0x61,0x4(%esp)
  4f:	00 
  50:	8d 44 24 1e          	lea    0x1e(%esp),%eax
  54:	89 04 24             	mov    %eax,(%esp)
  57:	e8 17 02 00 00       	call   273 <memset>

  for(i = 0; i < 4; i++)
  5c:	c7 84 24 2c 02 00 00 	movl   $0x0,0x22c(%esp)
  63:	00 00 00 00 
  67:	eb 13                	jmp    7c <main+0x7c>
    if(fork() > 0)
  69:	e8 aa 03 00 00       	call   418 <fork>
  6e:	85 c0                	test   %eax,%eax
  70:	7e 02                	jle    74 <main+0x74>
      break;
  72:	eb 12                	jmp    86 <main+0x86>
  for(i = 0; i < 4; i++)
  74:	83 84 24 2c 02 00 00 	addl   $0x1,0x22c(%esp)
  7b:	01 
  7c:	83 bc 24 2c 02 00 00 	cmpl   $0x3,0x22c(%esp)
  83:	03 
  84:	7e e3                	jle    69 <main+0x69>

  printf(1, "write %d\n", i);
  86:	8b 84 24 2c 02 00 00 	mov    0x22c(%esp),%eax
  8d:	89 44 24 08          	mov    %eax,0x8(%esp)
  91:	c7 44 24 04 87 09 00 	movl   $0x987,0x4(%esp)
  98:	00 
  99:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  a0:	e8 03 05 00 00       	call   5a8 <printf>

  path[8] += i;
  a5:	0f b6 84 24 26 02 00 	movzbl 0x226(%esp),%eax
  ac:	00 
  ad:	89 c2                	mov    %eax,%edx
  af:	8b 84 24 2c 02 00 00 	mov    0x22c(%esp),%eax
  b6:	01 d0                	add    %edx,%eax
  b8:	88 84 24 26 02 00 00 	mov    %al,0x226(%esp)
  fd = open(path, O_CREATE | O_RDWR);
  bf:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
  c6:	00 
  c7:	8d 84 24 1e 02 00 00 	lea    0x21e(%esp),%eax
  ce:	89 04 24             	mov    %eax,(%esp)
  d1:	e8 8a 03 00 00       	call   460 <open>
  d6:	89 84 24 28 02 00 00 	mov    %eax,0x228(%esp)
  for(i = 0; i < 20; i++)
  dd:	c7 84 24 2c 02 00 00 	movl   $0x0,0x22c(%esp)
  e4:	00 00 00 00 
  e8:	eb 27                	jmp    111 <main+0x111>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  ea:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  f1:	00 
  f2:	8d 44 24 1e          	lea    0x1e(%esp),%eax
  f6:	89 44 24 04          	mov    %eax,0x4(%esp)
  fa:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
 101:	89 04 24             	mov    %eax,(%esp)
 104:	e8 37 03 00 00       	call   440 <write>
  for(i = 0; i < 20; i++)
 109:	83 84 24 2c 02 00 00 	addl   $0x1,0x22c(%esp)
 110:	01 
 111:	83 bc 24 2c 02 00 00 	cmpl   $0x13,0x22c(%esp)
 118:	13 
 119:	7e cf                	jle    ea <main+0xea>
  close(fd);
 11b:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
 122:	89 04 24             	mov    %eax,(%esp)
 125:	e8 1e 03 00 00       	call   448 <close>

  printf(1, "read\n");
 12a:	c7 44 24 04 91 09 00 	movl   $0x991,0x4(%esp)
 131:	00 
 132:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 139:	e8 6a 04 00 00       	call   5a8 <printf>

  fd = open(path, O_RDONLY);
 13e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 145:	00 
 146:	8d 84 24 1e 02 00 00 	lea    0x21e(%esp),%eax
 14d:	89 04 24             	mov    %eax,(%esp)
 150:	e8 0b 03 00 00       	call   460 <open>
 155:	89 84 24 28 02 00 00 	mov    %eax,0x228(%esp)
  for (i = 0; i < 20; i++)
 15c:	c7 84 24 2c 02 00 00 	movl   $0x0,0x22c(%esp)
 163:	00 00 00 00 
 167:	eb 27                	jmp    190 <main+0x190>
    read(fd, data, sizeof(data));
 169:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
 170:	00 
 171:	8d 44 24 1e          	lea    0x1e(%esp),%eax
 175:	89 44 24 04          	mov    %eax,0x4(%esp)
 179:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
 180:	89 04 24             	mov    %eax,(%esp)
 183:	e8 b0 02 00 00       	call   438 <read>
  for (i = 0; i < 20; i++)
 188:	83 84 24 2c 02 00 00 	addl   $0x1,0x22c(%esp)
 18f:	01 
 190:	83 bc 24 2c 02 00 00 	cmpl   $0x13,0x22c(%esp)
 197:	13 
 198:	7e cf                	jle    169 <main+0x169>
  close(fd);
 19a:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
 1a1:	89 04 24             	mov    %eax,(%esp)
 1a4:	e8 9f 02 00 00       	call   448 <close>

  wait();
 1a9:	e8 7a 02 00 00       	call   428 <wait>

  exit();
 1ae:	e8 6d 02 00 00       	call   420 <exit>

000001b3 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 1b3:	55                   	push   %ebp
 1b4:	89 e5                	mov    %esp,%ebp
 1b6:	57                   	push   %edi
 1b7:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 1b8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1bb:	8b 55 10             	mov    0x10(%ebp),%edx
 1be:	8b 45 0c             	mov    0xc(%ebp),%eax
 1c1:	89 cb                	mov    %ecx,%ebx
 1c3:	89 df                	mov    %ebx,%edi
 1c5:	89 d1                	mov    %edx,%ecx
 1c7:	fc                   	cld    
 1c8:	f3 aa                	rep stos %al,%es:(%edi)
 1ca:	89 ca                	mov    %ecx,%edx
 1cc:	89 fb                	mov    %edi,%ebx
 1ce:	89 5d 08             	mov    %ebx,0x8(%ebp)
 1d1:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 1d4:	5b                   	pop    %ebx
 1d5:	5f                   	pop    %edi
 1d6:	5d                   	pop    %ebp
 1d7:	c3                   	ret    

000001d8 <ps>:
#include "stat.h"
#include "fcntl.h"
#include "user.h"
#include "x86.h"

void ps(){
 1d8:	55                   	push   %ebp
 1d9:	89 e5                	mov    %esp,%ebp
  
 //  pstatTable * pst = getpinfo
}
 1db:	5d                   	pop    %ebp
 1dc:	c3                   	ret    

000001dd <strcpy>:

char*
strcpy(char *s, const char *t)
{
 1dd:	55                   	push   %ebp
 1de:	89 e5                	mov    %esp,%ebp
 1e0:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 1e3:	8b 45 08             	mov    0x8(%ebp),%eax
 1e6:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 1e9:	90                   	nop
 1ea:	8b 45 08             	mov    0x8(%ebp),%eax
 1ed:	8d 50 01             	lea    0x1(%eax),%edx
 1f0:	89 55 08             	mov    %edx,0x8(%ebp)
 1f3:	8b 55 0c             	mov    0xc(%ebp),%edx
 1f6:	8d 4a 01             	lea    0x1(%edx),%ecx
 1f9:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 1fc:	0f b6 12             	movzbl (%edx),%edx
 1ff:	88 10                	mov    %dl,(%eax)
 201:	0f b6 00             	movzbl (%eax),%eax
 204:	84 c0                	test   %al,%al
 206:	75 e2                	jne    1ea <strcpy+0xd>
    ;
  return os;
 208:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 20b:	c9                   	leave  
 20c:	c3                   	ret    

0000020d <strcmp>:

int
strcmp(const char *p, const char *q)
{
 20d:	55                   	push   %ebp
 20e:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 210:	eb 08                	jmp    21a <strcmp+0xd>
    p++, q++;
 212:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 216:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 21a:	8b 45 08             	mov    0x8(%ebp),%eax
 21d:	0f b6 00             	movzbl (%eax),%eax
 220:	84 c0                	test   %al,%al
 222:	74 10                	je     234 <strcmp+0x27>
 224:	8b 45 08             	mov    0x8(%ebp),%eax
 227:	0f b6 10             	movzbl (%eax),%edx
 22a:	8b 45 0c             	mov    0xc(%ebp),%eax
 22d:	0f b6 00             	movzbl (%eax),%eax
 230:	38 c2                	cmp    %al,%dl
 232:	74 de                	je     212 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 234:	8b 45 08             	mov    0x8(%ebp),%eax
 237:	0f b6 00             	movzbl (%eax),%eax
 23a:	0f b6 d0             	movzbl %al,%edx
 23d:	8b 45 0c             	mov    0xc(%ebp),%eax
 240:	0f b6 00             	movzbl (%eax),%eax
 243:	0f b6 c0             	movzbl %al,%eax
 246:	29 c2                	sub    %eax,%edx
 248:	89 d0                	mov    %edx,%eax
}
 24a:	5d                   	pop    %ebp
 24b:	c3                   	ret    

0000024c <strlen>:

uint
strlen(const char *s)
{
 24c:	55                   	push   %ebp
 24d:	89 e5                	mov    %esp,%ebp
 24f:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 252:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 259:	eb 04                	jmp    25f <strlen+0x13>
 25b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 25f:	8b 55 fc             	mov    -0x4(%ebp),%edx
 262:	8b 45 08             	mov    0x8(%ebp),%eax
 265:	01 d0                	add    %edx,%eax
 267:	0f b6 00             	movzbl (%eax),%eax
 26a:	84 c0                	test   %al,%al
 26c:	75 ed                	jne    25b <strlen+0xf>
    ;
  return n;
 26e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 271:	c9                   	leave  
 272:	c3                   	ret    

00000273 <memset>:

void*
memset(void *dst, int c, uint n)
{
 273:	55                   	push   %ebp
 274:	89 e5                	mov    %esp,%ebp
 276:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 279:	8b 45 10             	mov    0x10(%ebp),%eax
 27c:	89 44 24 08          	mov    %eax,0x8(%esp)
 280:	8b 45 0c             	mov    0xc(%ebp),%eax
 283:	89 44 24 04          	mov    %eax,0x4(%esp)
 287:	8b 45 08             	mov    0x8(%ebp),%eax
 28a:	89 04 24             	mov    %eax,(%esp)
 28d:	e8 21 ff ff ff       	call   1b3 <stosb>
  return dst;
 292:	8b 45 08             	mov    0x8(%ebp),%eax
}
 295:	c9                   	leave  
 296:	c3                   	ret    

00000297 <strchr>:

char*
strchr(const char *s, char c)
{
 297:	55                   	push   %ebp
 298:	89 e5                	mov    %esp,%ebp
 29a:	83 ec 04             	sub    $0x4,%esp
 29d:	8b 45 0c             	mov    0xc(%ebp),%eax
 2a0:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 2a3:	eb 14                	jmp    2b9 <strchr+0x22>
    if(*s == c)
 2a5:	8b 45 08             	mov    0x8(%ebp),%eax
 2a8:	0f b6 00             	movzbl (%eax),%eax
 2ab:	3a 45 fc             	cmp    -0x4(%ebp),%al
 2ae:	75 05                	jne    2b5 <strchr+0x1e>
      return (char*)s;
 2b0:	8b 45 08             	mov    0x8(%ebp),%eax
 2b3:	eb 13                	jmp    2c8 <strchr+0x31>
  for(; *s; s++)
 2b5:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2b9:	8b 45 08             	mov    0x8(%ebp),%eax
 2bc:	0f b6 00             	movzbl (%eax),%eax
 2bf:	84 c0                	test   %al,%al
 2c1:	75 e2                	jne    2a5 <strchr+0xe>
  return 0;
 2c3:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2c8:	c9                   	leave  
 2c9:	c3                   	ret    

000002ca <gets>:

char*
gets(char *buf, int max)
{
 2ca:	55                   	push   %ebp
 2cb:	89 e5                	mov    %esp,%ebp
 2cd:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2d0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 2d7:	eb 4c                	jmp    325 <gets+0x5b>
    cc = read(0, &c, 1);
 2d9:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 2e0:	00 
 2e1:	8d 45 ef             	lea    -0x11(%ebp),%eax
 2e4:	89 44 24 04          	mov    %eax,0x4(%esp)
 2e8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 2ef:	e8 44 01 00 00       	call   438 <read>
 2f4:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 2f7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 2fb:	7f 02                	jg     2ff <gets+0x35>
      break;
 2fd:	eb 31                	jmp    330 <gets+0x66>
    buf[i++] = c;
 2ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
 302:	8d 50 01             	lea    0x1(%eax),%edx
 305:	89 55 f4             	mov    %edx,-0xc(%ebp)
 308:	89 c2                	mov    %eax,%edx
 30a:	8b 45 08             	mov    0x8(%ebp),%eax
 30d:	01 c2                	add    %eax,%edx
 30f:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 313:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 315:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 319:	3c 0a                	cmp    $0xa,%al
 31b:	74 13                	je     330 <gets+0x66>
 31d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 321:	3c 0d                	cmp    $0xd,%al
 323:	74 0b                	je     330 <gets+0x66>
  for(i=0; i+1 < max; ){
 325:	8b 45 f4             	mov    -0xc(%ebp),%eax
 328:	83 c0 01             	add    $0x1,%eax
 32b:	3b 45 0c             	cmp    0xc(%ebp),%eax
 32e:	7c a9                	jl     2d9 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 330:	8b 55 f4             	mov    -0xc(%ebp),%edx
 333:	8b 45 08             	mov    0x8(%ebp),%eax
 336:	01 d0                	add    %edx,%eax
 338:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 33b:	8b 45 08             	mov    0x8(%ebp),%eax
}
 33e:	c9                   	leave  
 33f:	c3                   	ret    

00000340 <stat>:

int
stat(const char *n, struct stat *st)
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 346:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 34d:	00 
 34e:	8b 45 08             	mov    0x8(%ebp),%eax
 351:	89 04 24             	mov    %eax,(%esp)
 354:	e8 07 01 00 00       	call   460 <open>
 359:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 35c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 360:	79 07                	jns    369 <stat+0x29>
    return -1;
 362:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 367:	eb 23                	jmp    38c <stat+0x4c>
  r = fstat(fd, st);
 369:	8b 45 0c             	mov    0xc(%ebp),%eax
 36c:	89 44 24 04          	mov    %eax,0x4(%esp)
 370:	8b 45 f4             	mov    -0xc(%ebp),%eax
 373:	89 04 24             	mov    %eax,(%esp)
 376:	e8 fd 00 00 00       	call   478 <fstat>
 37b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 37e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 381:	89 04 24             	mov    %eax,(%esp)
 384:	e8 bf 00 00 00       	call   448 <close>
  return r;
 389:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 38c:	c9                   	leave  
 38d:	c3                   	ret    

0000038e <atoi>:

int
atoi(const char *s)
{
 38e:	55                   	push   %ebp
 38f:	89 e5                	mov    %esp,%ebp
 391:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 394:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 39b:	eb 25                	jmp    3c2 <atoi+0x34>
    n = n*10 + *s++ - '0';
 39d:	8b 55 fc             	mov    -0x4(%ebp),%edx
 3a0:	89 d0                	mov    %edx,%eax
 3a2:	c1 e0 02             	shl    $0x2,%eax
 3a5:	01 d0                	add    %edx,%eax
 3a7:	01 c0                	add    %eax,%eax
 3a9:	89 c1                	mov    %eax,%ecx
 3ab:	8b 45 08             	mov    0x8(%ebp),%eax
 3ae:	8d 50 01             	lea    0x1(%eax),%edx
 3b1:	89 55 08             	mov    %edx,0x8(%ebp)
 3b4:	0f b6 00             	movzbl (%eax),%eax
 3b7:	0f be c0             	movsbl %al,%eax
 3ba:	01 c8                	add    %ecx,%eax
 3bc:	83 e8 30             	sub    $0x30,%eax
 3bf:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 3c2:	8b 45 08             	mov    0x8(%ebp),%eax
 3c5:	0f b6 00             	movzbl (%eax),%eax
 3c8:	3c 2f                	cmp    $0x2f,%al
 3ca:	7e 0a                	jle    3d6 <atoi+0x48>
 3cc:	8b 45 08             	mov    0x8(%ebp),%eax
 3cf:	0f b6 00             	movzbl (%eax),%eax
 3d2:	3c 39                	cmp    $0x39,%al
 3d4:	7e c7                	jle    39d <atoi+0xf>
  return n;
 3d6:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3d9:	c9                   	leave  
 3da:	c3                   	ret    

000003db <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3db:	55                   	push   %ebp
 3dc:	89 e5                	mov    %esp,%ebp
 3de:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 3e1:	8b 45 08             	mov    0x8(%ebp),%eax
 3e4:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 3e7:	8b 45 0c             	mov    0xc(%ebp),%eax
 3ea:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 3ed:	eb 17                	jmp    406 <memmove+0x2b>
    *dst++ = *src++;
 3ef:	8b 45 fc             	mov    -0x4(%ebp),%eax
 3f2:	8d 50 01             	lea    0x1(%eax),%edx
 3f5:	89 55 fc             	mov    %edx,-0x4(%ebp)
 3f8:	8b 55 f8             	mov    -0x8(%ebp),%edx
 3fb:	8d 4a 01             	lea    0x1(%edx),%ecx
 3fe:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 401:	0f b6 12             	movzbl (%edx),%edx
 404:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 406:	8b 45 10             	mov    0x10(%ebp),%eax
 409:	8d 50 ff             	lea    -0x1(%eax),%edx
 40c:	89 55 10             	mov    %edx,0x10(%ebp)
 40f:	85 c0                	test   %eax,%eax
 411:	7f dc                	jg     3ef <memmove+0x14>
  return vdst;
 413:	8b 45 08             	mov    0x8(%ebp),%eax
}
 416:	c9                   	leave  
 417:	c3                   	ret    

00000418 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 418:	b8 01 00 00 00       	mov    $0x1,%eax
 41d:	cd 40                	int    $0x40
 41f:	c3                   	ret    

00000420 <exit>:
SYSCALL(exit)
 420:	b8 02 00 00 00       	mov    $0x2,%eax
 425:	cd 40                	int    $0x40
 427:	c3                   	ret    

00000428 <wait>:
SYSCALL(wait)
 428:	b8 03 00 00 00       	mov    $0x3,%eax
 42d:	cd 40                	int    $0x40
 42f:	c3                   	ret    

00000430 <pipe>:
SYSCALL(pipe)
 430:	b8 04 00 00 00       	mov    $0x4,%eax
 435:	cd 40                	int    $0x40
 437:	c3                   	ret    

00000438 <read>:
SYSCALL(read)
 438:	b8 05 00 00 00       	mov    $0x5,%eax
 43d:	cd 40                	int    $0x40
 43f:	c3                   	ret    

00000440 <write>:
SYSCALL(write)
 440:	b8 10 00 00 00       	mov    $0x10,%eax
 445:	cd 40                	int    $0x40
 447:	c3                   	ret    

00000448 <close>:
SYSCALL(close)
 448:	b8 15 00 00 00       	mov    $0x15,%eax
 44d:	cd 40                	int    $0x40
 44f:	c3                   	ret    

00000450 <kill>:
SYSCALL(kill)
 450:	b8 06 00 00 00       	mov    $0x6,%eax
 455:	cd 40                	int    $0x40
 457:	c3                   	ret    

00000458 <exec>:
SYSCALL(exec)
 458:	b8 07 00 00 00       	mov    $0x7,%eax
 45d:	cd 40                	int    $0x40
 45f:	c3                   	ret    

00000460 <open>:
SYSCALL(open)
 460:	b8 0f 00 00 00       	mov    $0xf,%eax
 465:	cd 40                	int    $0x40
 467:	c3                   	ret    

00000468 <mknod>:
SYSCALL(mknod)
 468:	b8 11 00 00 00       	mov    $0x11,%eax
 46d:	cd 40                	int    $0x40
 46f:	c3                   	ret    

00000470 <unlink>:
SYSCALL(unlink)
 470:	b8 12 00 00 00       	mov    $0x12,%eax
 475:	cd 40                	int    $0x40
 477:	c3                   	ret    

00000478 <fstat>:
SYSCALL(fstat)
 478:	b8 08 00 00 00       	mov    $0x8,%eax
 47d:	cd 40                	int    $0x40
 47f:	c3                   	ret    

00000480 <link>:
SYSCALL(link)
 480:	b8 13 00 00 00       	mov    $0x13,%eax
 485:	cd 40                	int    $0x40
 487:	c3                   	ret    

00000488 <mkdir>:
SYSCALL(mkdir)
 488:	b8 14 00 00 00       	mov    $0x14,%eax
 48d:	cd 40                	int    $0x40
 48f:	c3                   	ret    

00000490 <chdir>:
SYSCALL(chdir)
 490:	b8 09 00 00 00       	mov    $0x9,%eax
 495:	cd 40                	int    $0x40
 497:	c3                   	ret    

00000498 <dup>:
SYSCALL(dup)
 498:	b8 0a 00 00 00       	mov    $0xa,%eax
 49d:	cd 40                	int    $0x40
 49f:	c3                   	ret    

000004a0 <getpid>:
SYSCALL(getpid)
 4a0:	b8 0b 00 00 00       	mov    $0xb,%eax
 4a5:	cd 40                	int    $0x40
 4a7:	c3                   	ret    

000004a8 <sbrk>:
SYSCALL(sbrk)
 4a8:	b8 0c 00 00 00       	mov    $0xc,%eax
 4ad:	cd 40                	int    $0x40
 4af:	c3                   	ret    

000004b0 <sleep>:
SYSCALL(sleep)
 4b0:	b8 0d 00 00 00       	mov    $0xd,%eax
 4b5:	cd 40                	int    $0x40
 4b7:	c3                   	ret    

000004b8 <uptime>:
SYSCALL(uptime)
 4b8:	b8 0e 00 00 00       	mov    $0xe,%eax
 4bd:	cd 40                	int    $0x40
 4bf:	c3                   	ret    

000004c0 <getpinfo>:
SYSCALL(getpinfo)
 4c0:	b8 16 00 00 00       	mov    $0x16,%eax
 4c5:	cd 40                	int    $0x40
 4c7:	c3                   	ret    

000004c8 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4c8:	55                   	push   %ebp
 4c9:	89 e5                	mov    %esp,%ebp
 4cb:	83 ec 18             	sub    $0x18,%esp
 4ce:	8b 45 0c             	mov    0xc(%ebp),%eax
 4d1:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 4d4:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4db:	00 
 4dc:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4df:	89 44 24 04          	mov    %eax,0x4(%esp)
 4e3:	8b 45 08             	mov    0x8(%ebp),%eax
 4e6:	89 04 24             	mov    %eax,(%esp)
 4e9:	e8 52 ff ff ff       	call   440 <write>
}
 4ee:	c9                   	leave  
 4ef:	c3                   	ret    

000004f0 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4f0:	55                   	push   %ebp
 4f1:	89 e5                	mov    %esp,%ebp
 4f3:	56                   	push   %esi
 4f4:	53                   	push   %ebx
 4f5:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 4f8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 4ff:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 503:	74 17                	je     51c <printint+0x2c>
 505:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 509:	79 11                	jns    51c <printint+0x2c>
    neg = 1;
 50b:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 512:	8b 45 0c             	mov    0xc(%ebp),%eax
 515:	f7 d8                	neg    %eax
 517:	89 45 ec             	mov    %eax,-0x14(%ebp)
 51a:	eb 06                	jmp    522 <printint+0x32>
  } else {
    x = xx;
 51c:	8b 45 0c             	mov    0xc(%ebp),%eax
 51f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 522:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 529:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 52c:	8d 41 01             	lea    0x1(%ecx),%eax
 52f:	89 45 f4             	mov    %eax,-0xc(%ebp)
 532:	8b 5d 10             	mov    0x10(%ebp),%ebx
 535:	8b 45 ec             	mov    -0x14(%ebp),%eax
 538:	ba 00 00 00 00       	mov    $0x0,%edx
 53d:	f7 f3                	div    %ebx
 53f:	89 d0                	mov    %edx,%eax
 541:	0f b6 80 04 0c 00 00 	movzbl 0xc04(%eax),%eax
 548:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 54c:	8b 75 10             	mov    0x10(%ebp),%esi
 54f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 552:	ba 00 00 00 00       	mov    $0x0,%edx
 557:	f7 f6                	div    %esi
 559:	89 45 ec             	mov    %eax,-0x14(%ebp)
 55c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 560:	75 c7                	jne    529 <printint+0x39>
  if(neg)
 562:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 566:	74 10                	je     578 <printint+0x88>
    buf[i++] = '-';
 568:	8b 45 f4             	mov    -0xc(%ebp),%eax
 56b:	8d 50 01             	lea    0x1(%eax),%edx
 56e:	89 55 f4             	mov    %edx,-0xc(%ebp)
 571:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 576:	eb 1f                	jmp    597 <printint+0xa7>
 578:	eb 1d                	jmp    597 <printint+0xa7>
    putc(fd, buf[i]);
 57a:	8d 55 dc             	lea    -0x24(%ebp),%edx
 57d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 580:	01 d0                	add    %edx,%eax
 582:	0f b6 00             	movzbl (%eax),%eax
 585:	0f be c0             	movsbl %al,%eax
 588:	89 44 24 04          	mov    %eax,0x4(%esp)
 58c:	8b 45 08             	mov    0x8(%ebp),%eax
 58f:	89 04 24             	mov    %eax,(%esp)
 592:	e8 31 ff ff ff       	call   4c8 <putc>
  while(--i >= 0)
 597:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 59b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 59f:	79 d9                	jns    57a <printint+0x8a>
}
 5a1:	83 c4 30             	add    $0x30,%esp
 5a4:	5b                   	pop    %ebx
 5a5:	5e                   	pop    %esi
 5a6:	5d                   	pop    %ebp
 5a7:	c3                   	ret    

000005a8 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5a8:	55                   	push   %ebp
 5a9:	89 e5                	mov    %esp,%ebp
 5ab:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 5ae:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 5b5:	8d 45 0c             	lea    0xc(%ebp),%eax
 5b8:	83 c0 04             	add    $0x4,%eax
 5bb:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 5be:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 5c5:	e9 7c 01 00 00       	jmp    746 <printf+0x19e>
    c = fmt[i] & 0xff;
 5ca:	8b 55 0c             	mov    0xc(%ebp),%edx
 5cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5d0:	01 d0                	add    %edx,%eax
 5d2:	0f b6 00             	movzbl (%eax),%eax
 5d5:	0f be c0             	movsbl %al,%eax
 5d8:	25 ff 00 00 00       	and    $0xff,%eax
 5dd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 5e0:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5e4:	75 2c                	jne    612 <printf+0x6a>
      if(c == '%'){
 5e6:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5ea:	75 0c                	jne    5f8 <printf+0x50>
        state = '%';
 5ec:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 5f3:	e9 4a 01 00 00       	jmp    742 <printf+0x19a>
      } else {
        putc(fd, c);
 5f8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5fb:	0f be c0             	movsbl %al,%eax
 5fe:	89 44 24 04          	mov    %eax,0x4(%esp)
 602:	8b 45 08             	mov    0x8(%ebp),%eax
 605:	89 04 24             	mov    %eax,(%esp)
 608:	e8 bb fe ff ff       	call   4c8 <putc>
 60d:	e9 30 01 00 00       	jmp    742 <printf+0x19a>
      }
    } else if(state == '%'){
 612:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 616:	0f 85 26 01 00 00    	jne    742 <printf+0x19a>
      if(c == 'd'){
 61c:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 620:	75 2d                	jne    64f <printf+0xa7>
        printint(fd, *ap, 10, 1);
 622:	8b 45 e8             	mov    -0x18(%ebp),%eax
 625:	8b 00                	mov    (%eax),%eax
 627:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 62e:	00 
 62f:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 636:	00 
 637:	89 44 24 04          	mov    %eax,0x4(%esp)
 63b:	8b 45 08             	mov    0x8(%ebp),%eax
 63e:	89 04 24             	mov    %eax,(%esp)
 641:	e8 aa fe ff ff       	call   4f0 <printint>
        ap++;
 646:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 64a:	e9 ec 00 00 00       	jmp    73b <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 64f:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 653:	74 06                	je     65b <printf+0xb3>
 655:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 659:	75 2d                	jne    688 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 65b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 65e:	8b 00                	mov    (%eax),%eax
 660:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 667:	00 
 668:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 66f:	00 
 670:	89 44 24 04          	mov    %eax,0x4(%esp)
 674:	8b 45 08             	mov    0x8(%ebp),%eax
 677:	89 04 24             	mov    %eax,(%esp)
 67a:	e8 71 fe ff ff       	call   4f0 <printint>
        ap++;
 67f:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 683:	e9 b3 00 00 00       	jmp    73b <printf+0x193>
      } else if(c == 's'){
 688:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 68c:	75 45                	jne    6d3 <printf+0x12b>
        s = (char*)*ap;
 68e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 691:	8b 00                	mov    (%eax),%eax
 693:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 696:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 69a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 69e:	75 09                	jne    6a9 <printf+0x101>
          s = "(null)";
 6a0:	c7 45 f4 97 09 00 00 	movl   $0x997,-0xc(%ebp)
        while(*s != 0){
 6a7:	eb 1e                	jmp    6c7 <printf+0x11f>
 6a9:	eb 1c                	jmp    6c7 <printf+0x11f>
          putc(fd, *s);
 6ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6ae:	0f b6 00             	movzbl (%eax),%eax
 6b1:	0f be c0             	movsbl %al,%eax
 6b4:	89 44 24 04          	mov    %eax,0x4(%esp)
 6b8:	8b 45 08             	mov    0x8(%ebp),%eax
 6bb:	89 04 24             	mov    %eax,(%esp)
 6be:	e8 05 fe ff ff       	call   4c8 <putc>
          s++;
 6c3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 6c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6ca:	0f b6 00             	movzbl (%eax),%eax
 6cd:	84 c0                	test   %al,%al
 6cf:	75 da                	jne    6ab <printf+0x103>
 6d1:	eb 68                	jmp    73b <printf+0x193>
        }
      } else if(c == 'c'){
 6d3:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 6d7:	75 1d                	jne    6f6 <printf+0x14e>
        putc(fd, *ap);
 6d9:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6dc:	8b 00                	mov    (%eax),%eax
 6de:	0f be c0             	movsbl %al,%eax
 6e1:	89 44 24 04          	mov    %eax,0x4(%esp)
 6e5:	8b 45 08             	mov    0x8(%ebp),%eax
 6e8:	89 04 24             	mov    %eax,(%esp)
 6eb:	e8 d8 fd ff ff       	call   4c8 <putc>
        ap++;
 6f0:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6f4:	eb 45                	jmp    73b <printf+0x193>
      } else if(c == '%'){
 6f6:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 6fa:	75 17                	jne    713 <printf+0x16b>
        putc(fd, c);
 6fc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6ff:	0f be c0             	movsbl %al,%eax
 702:	89 44 24 04          	mov    %eax,0x4(%esp)
 706:	8b 45 08             	mov    0x8(%ebp),%eax
 709:	89 04 24             	mov    %eax,(%esp)
 70c:	e8 b7 fd ff ff       	call   4c8 <putc>
 711:	eb 28                	jmp    73b <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 713:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 71a:	00 
 71b:	8b 45 08             	mov    0x8(%ebp),%eax
 71e:	89 04 24             	mov    %eax,(%esp)
 721:	e8 a2 fd ff ff       	call   4c8 <putc>
        putc(fd, c);
 726:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 729:	0f be c0             	movsbl %al,%eax
 72c:	89 44 24 04          	mov    %eax,0x4(%esp)
 730:	8b 45 08             	mov    0x8(%ebp),%eax
 733:	89 04 24             	mov    %eax,(%esp)
 736:	e8 8d fd ff ff       	call   4c8 <putc>
      }
      state = 0;
 73b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 742:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 746:	8b 55 0c             	mov    0xc(%ebp),%edx
 749:	8b 45 f0             	mov    -0x10(%ebp),%eax
 74c:	01 d0                	add    %edx,%eax
 74e:	0f b6 00             	movzbl (%eax),%eax
 751:	84 c0                	test   %al,%al
 753:	0f 85 71 fe ff ff    	jne    5ca <printf+0x22>
    }
  }
}
 759:	c9                   	leave  
 75a:	c3                   	ret    

0000075b <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 75b:	55                   	push   %ebp
 75c:	89 e5                	mov    %esp,%ebp
 75e:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 761:	8b 45 08             	mov    0x8(%ebp),%eax
 764:	83 e8 08             	sub    $0x8,%eax
 767:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 76a:	a1 20 0c 00 00       	mov    0xc20,%eax
 76f:	89 45 fc             	mov    %eax,-0x4(%ebp)
 772:	eb 24                	jmp    798 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 774:	8b 45 fc             	mov    -0x4(%ebp),%eax
 777:	8b 00                	mov    (%eax),%eax
 779:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 77c:	77 12                	ja     790 <free+0x35>
 77e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 781:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 784:	77 24                	ja     7aa <free+0x4f>
 786:	8b 45 fc             	mov    -0x4(%ebp),%eax
 789:	8b 00                	mov    (%eax),%eax
 78b:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 78e:	77 1a                	ja     7aa <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 790:	8b 45 fc             	mov    -0x4(%ebp),%eax
 793:	8b 00                	mov    (%eax),%eax
 795:	89 45 fc             	mov    %eax,-0x4(%ebp)
 798:	8b 45 f8             	mov    -0x8(%ebp),%eax
 79b:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 79e:	76 d4                	jbe    774 <free+0x19>
 7a0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a3:	8b 00                	mov    (%eax),%eax
 7a5:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7a8:	76 ca                	jbe    774 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7aa:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7ad:	8b 40 04             	mov    0x4(%eax),%eax
 7b0:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7b7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7ba:	01 c2                	add    %eax,%edx
 7bc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7bf:	8b 00                	mov    (%eax),%eax
 7c1:	39 c2                	cmp    %eax,%edx
 7c3:	75 24                	jne    7e9 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 7c5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7c8:	8b 50 04             	mov    0x4(%eax),%edx
 7cb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ce:	8b 00                	mov    (%eax),%eax
 7d0:	8b 40 04             	mov    0x4(%eax),%eax
 7d3:	01 c2                	add    %eax,%edx
 7d5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7d8:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 7db:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7de:	8b 00                	mov    (%eax),%eax
 7e0:	8b 10                	mov    (%eax),%edx
 7e2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7e5:	89 10                	mov    %edx,(%eax)
 7e7:	eb 0a                	jmp    7f3 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 7e9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ec:	8b 10                	mov    (%eax),%edx
 7ee:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7f1:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 7f3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f6:	8b 40 04             	mov    0x4(%eax),%eax
 7f9:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 800:	8b 45 fc             	mov    -0x4(%ebp),%eax
 803:	01 d0                	add    %edx,%eax
 805:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 808:	75 20                	jne    82a <free+0xcf>
    p->s.size += bp->s.size;
 80a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80d:	8b 50 04             	mov    0x4(%eax),%edx
 810:	8b 45 f8             	mov    -0x8(%ebp),%eax
 813:	8b 40 04             	mov    0x4(%eax),%eax
 816:	01 c2                	add    %eax,%edx
 818:	8b 45 fc             	mov    -0x4(%ebp),%eax
 81b:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 81e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 821:	8b 10                	mov    (%eax),%edx
 823:	8b 45 fc             	mov    -0x4(%ebp),%eax
 826:	89 10                	mov    %edx,(%eax)
 828:	eb 08                	jmp    832 <free+0xd7>
  } else
    p->s.ptr = bp;
 82a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 82d:	8b 55 f8             	mov    -0x8(%ebp),%edx
 830:	89 10                	mov    %edx,(%eax)
  freep = p;
 832:	8b 45 fc             	mov    -0x4(%ebp),%eax
 835:	a3 20 0c 00 00       	mov    %eax,0xc20
}
 83a:	c9                   	leave  
 83b:	c3                   	ret    

0000083c <morecore>:

static Header*
morecore(uint nu)
{
 83c:	55                   	push   %ebp
 83d:	89 e5                	mov    %esp,%ebp
 83f:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 842:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 849:	77 07                	ja     852 <morecore+0x16>
    nu = 4096;
 84b:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 852:	8b 45 08             	mov    0x8(%ebp),%eax
 855:	c1 e0 03             	shl    $0x3,%eax
 858:	89 04 24             	mov    %eax,(%esp)
 85b:	e8 48 fc ff ff       	call   4a8 <sbrk>
 860:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 863:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 867:	75 07                	jne    870 <morecore+0x34>
    return 0;
 869:	b8 00 00 00 00       	mov    $0x0,%eax
 86e:	eb 22                	jmp    892 <morecore+0x56>
  hp = (Header*)p;
 870:	8b 45 f4             	mov    -0xc(%ebp),%eax
 873:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 876:	8b 45 f0             	mov    -0x10(%ebp),%eax
 879:	8b 55 08             	mov    0x8(%ebp),%edx
 87c:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 87f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 882:	83 c0 08             	add    $0x8,%eax
 885:	89 04 24             	mov    %eax,(%esp)
 888:	e8 ce fe ff ff       	call   75b <free>
  return freep;
 88d:	a1 20 0c 00 00       	mov    0xc20,%eax
}
 892:	c9                   	leave  
 893:	c3                   	ret    

00000894 <malloc>:

void*
malloc(uint nbytes)
{
 894:	55                   	push   %ebp
 895:	89 e5                	mov    %esp,%ebp
 897:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 89a:	8b 45 08             	mov    0x8(%ebp),%eax
 89d:	83 c0 07             	add    $0x7,%eax
 8a0:	c1 e8 03             	shr    $0x3,%eax
 8a3:	83 c0 01             	add    $0x1,%eax
 8a6:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 8a9:	a1 20 0c 00 00       	mov    0xc20,%eax
 8ae:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8b1:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8b5:	75 23                	jne    8da <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 8b7:	c7 45 f0 18 0c 00 00 	movl   $0xc18,-0x10(%ebp)
 8be:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8c1:	a3 20 0c 00 00       	mov    %eax,0xc20
 8c6:	a1 20 0c 00 00       	mov    0xc20,%eax
 8cb:	a3 18 0c 00 00       	mov    %eax,0xc18
    base.s.size = 0;
 8d0:	c7 05 1c 0c 00 00 00 	movl   $0x0,0xc1c
 8d7:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8da:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8dd:	8b 00                	mov    (%eax),%eax
 8df:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 8e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8e5:	8b 40 04             	mov    0x4(%eax),%eax
 8e8:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8eb:	72 4d                	jb     93a <malloc+0xa6>
      if(p->s.size == nunits)
 8ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8f0:	8b 40 04             	mov    0x4(%eax),%eax
 8f3:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8f6:	75 0c                	jne    904 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 8f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8fb:	8b 10                	mov    (%eax),%edx
 8fd:	8b 45 f0             	mov    -0x10(%ebp),%eax
 900:	89 10                	mov    %edx,(%eax)
 902:	eb 26                	jmp    92a <malloc+0x96>
      else {
        p->s.size -= nunits;
 904:	8b 45 f4             	mov    -0xc(%ebp),%eax
 907:	8b 40 04             	mov    0x4(%eax),%eax
 90a:	2b 45 ec             	sub    -0x14(%ebp),%eax
 90d:	89 c2                	mov    %eax,%edx
 90f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 912:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 915:	8b 45 f4             	mov    -0xc(%ebp),%eax
 918:	8b 40 04             	mov    0x4(%eax),%eax
 91b:	c1 e0 03             	shl    $0x3,%eax
 91e:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 921:	8b 45 f4             	mov    -0xc(%ebp),%eax
 924:	8b 55 ec             	mov    -0x14(%ebp),%edx
 927:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 92a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 92d:	a3 20 0c 00 00       	mov    %eax,0xc20
      return (void*)(p + 1);
 932:	8b 45 f4             	mov    -0xc(%ebp),%eax
 935:	83 c0 08             	add    $0x8,%eax
 938:	eb 38                	jmp    972 <malloc+0xde>
    }
    if(p == freep)
 93a:	a1 20 0c 00 00       	mov    0xc20,%eax
 93f:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 942:	75 1b                	jne    95f <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 944:	8b 45 ec             	mov    -0x14(%ebp),%eax
 947:	89 04 24             	mov    %eax,(%esp)
 94a:	e8 ed fe ff ff       	call   83c <morecore>
 94f:	89 45 f4             	mov    %eax,-0xc(%ebp)
 952:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 956:	75 07                	jne    95f <malloc+0xcb>
        return 0;
 958:	b8 00 00 00 00       	mov    $0x0,%eax
 95d:	eb 13                	jmp    972 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 95f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 962:	89 45 f0             	mov    %eax,-0x10(%ebp)
 965:	8b 45 f4             	mov    -0xc(%ebp),%eax
 968:	8b 00                	mov    (%eax),%eax
 96a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 96d:	e9 70 ff ff ff       	jmp    8e2 <malloc+0x4e>
}
 972:	c9                   	leave  
 973:	c3                   	ret    
