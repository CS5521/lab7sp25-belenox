
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
   f:	c7 44 24 04 00 0c 00 	movl   $0xc00,0x4(%esp)
  16:	00 
  17:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  1e:	e8 a5 03 00 00       	call   3c8 <write>
  23:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  26:	74 19                	je     41 <cat+0x41>
      printf(1, "cat: write error\n");
  28:	c7 44 24 04 fc 08 00 	movl   $0x8fc,0x4(%esp)
  2f:	00 
  30:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  37:	e8 f4 04 00 00       	call   530 <printf>
      exit();
  3c:	e8 67 03 00 00       	call   3a8 <exit>
  while((n = read(fd, buf, sizeof(buf))) > 0) {
  41:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  48:	00 
  49:	c7 44 24 04 00 0c 00 	movl   $0xc00,0x4(%esp)
  50:	00 
  51:	8b 45 08             	mov    0x8(%ebp),%eax
  54:	89 04 24             	mov    %eax,(%esp)
  57:	e8 64 03 00 00       	call   3c0 <read>
  5c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  5f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  63:	7f a3                	jg     8 <cat+0x8>
    }
  }
  if(n < 0){
  65:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  69:	79 19                	jns    84 <cat+0x84>
    printf(1, "cat: read error\n");
  6b:	c7 44 24 04 0e 09 00 	movl   $0x90e,0x4(%esp)
  72:	00 
  73:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  7a:	e8 b1 04 00 00       	call   530 <printf>
    exit();
  7f:	e8 24 03 00 00       	call   3a8 <exit>
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
  a1:	e8 02 03 00 00       	call   3a8 <exit>
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
  cd:	e8 16 03 00 00       	call   3e8 <open>
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
  f3:	c7 44 24 04 1f 09 00 	movl   $0x91f,0x4(%esp)
  fa:	00 
  fb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 102:	e8 29 04 00 00       	call   530 <printf>
      exit();
 107:	e8 9c 02 00 00       	call   3a8 <exit>
    }
    cat(fd);
 10c:	8b 44 24 18          	mov    0x18(%esp),%eax
 110:	89 04 24             	mov    %eax,(%esp)
 113:	e8 e8 fe ff ff       	call   0 <cat>
    close(fd);
 118:	8b 44 24 18          	mov    0x18(%esp),%eax
 11c:	89 04 24             	mov    %eax,(%esp)
 11f:	e8 ac 02 00 00       	call   3d0 <close>
  for(i = 1; i < argc; i++){
 124:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
 129:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 12d:	3b 45 08             	cmp    0x8(%ebp),%eax
 130:	0f 8c 7a ff ff ff    	jl     b0 <main+0x2a>
  }
  exit();
 136:	e8 6d 02 00 00       	call   3a8 <exit>

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
#include "stat.h"
#include "fcntl.h"
#include "user.h"
#include "x86.h"

void ps(){
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
  
 //  pstatTable * pst = getpinfo
}
 163:	5d                   	pop    %ebp
 164:	c3                   	ret    

00000165 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 165:	55                   	push   %ebp
 166:	89 e5                	mov    %esp,%ebp
 168:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 16b:	8b 45 08             	mov    0x8(%ebp),%eax
 16e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 171:	90                   	nop
 172:	8b 45 08             	mov    0x8(%ebp),%eax
 175:	8d 50 01             	lea    0x1(%eax),%edx
 178:	89 55 08             	mov    %edx,0x8(%ebp)
 17b:	8b 55 0c             	mov    0xc(%ebp),%edx
 17e:	8d 4a 01             	lea    0x1(%edx),%ecx
 181:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 184:	0f b6 12             	movzbl (%edx),%edx
 187:	88 10                	mov    %dl,(%eax)
 189:	0f b6 00             	movzbl (%eax),%eax
 18c:	84 c0                	test   %al,%al
 18e:	75 e2                	jne    172 <strcpy+0xd>
    ;
  return os;
 190:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 193:	c9                   	leave  
 194:	c3                   	ret    

00000195 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 195:	55                   	push   %ebp
 196:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 198:	eb 08                	jmp    1a2 <strcmp+0xd>
    p++, q++;
 19a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 19e:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 1a2:	8b 45 08             	mov    0x8(%ebp),%eax
 1a5:	0f b6 00             	movzbl (%eax),%eax
 1a8:	84 c0                	test   %al,%al
 1aa:	74 10                	je     1bc <strcmp+0x27>
 1ac:	8b 45 08             	mov    0x8(%ebp),%eax
 1af:	0f b6 10             	movzbl (%eax),%edx
 1b2:	8b 45 0c             	mov    0xc(%ebp),%eax
 1b5:	0f b6 00             	movzbl (%eax),%eax
 1b8:	38 c2                	cmp    %al,%dl
 1ba:	74 de                	je     19a <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 1bc:	8b 45 08             	mov    0x8(%ebp),%eax
 1bf:	0f b6 00             	movzbl (%eax),%eax
 1c2:	0f b6 d0             	movzbl %al,%edx
 1c5:	8b 45 0c             	mov    0xc(%ebp),%eax
 1c8:	0f b6 00             	movzbl (%eax),%eax
 1cb:	0f b6 c0             	movzbl %al,%eax
 1ce:	29 c2                	sub    %eax,%edx
 1d0:	89 d0                	mov    %edx,%eax
}
 1d2:	5d                   	pop    %ebp
 1d3:	c3                   	ret    

000001d4 <strlen>:

uint
strlen(const char *s)
{
 1d4:	55                   	push   %ebp
 1d5:	89 e5                	mov    %esp,%ebp
 1d7:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 1da:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1e1:	eb 04                	jmp    1e7 <strlen+0x13>
 1e3:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1e7:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1ea:	8b 45 08             	mov    0x8(%ebp),%eax
 1ed:	01 d0                	add    %edx,%eax
 1ef:	0f b6 00             	movzbl (%eax),%eax
 1f2:	84 c0                	test   %al,%al
 1f4:	75 ed                	jne    1e3 <strlen+0xf>
    ;
  return n;
 1f6:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1f9:	c9                   	leave  
 1fa:	c3                   	ret    

000001fb <memset>:

void*
memset(void *dst, int c, uint n)
{
 1fb:	55                   	push   %ebp
 1fc:	89 e5                	mov    %esp,%ebp
 1fe:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 201:	8b 45 10             	mov    0x10(%ebp),%eax
 204:	89 44 24 08          	mov    %eax,0x8(%esp)
 208:	8b 45 0c             	mov    0xc(%ebp),%eax
 20b:	89 44 24 04          	mov    %eax,0x4(%esp)
 20f:	8b 45 08             	mov    0x8(%ebp),%eax
 212:	89 04 24             	mov    %eax,(%esp)
 215:	e8 21 ff ff ff       	call   13b <stosb>
  return dst;
 21a:	8b 45 08             	mov    0x8(%ebp),%eax
}
 21d:	c9                   	leave  
 21e:	c3                   	ret    

0000021f <strchr>:

char*
strchr(const char *s, char c)
{
 21f:	55                   	push   %ebp
 220:	89 e5                	mov    %esp,%ebp
 222:	83 ec 04             	sub    $0x4,%esp
 225:	8b 45 0c             	mov    0xc(%ebp),%eax
 228:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 22b:	eb 14                	jmp    241 <strchr+0x22>
    if(*s == c)
 22d:	8b 45 08             	mov    0x8(%ebp),%eax
 230:	0f b6 00             	movzbl (%eax),%eax
 233:	3a 45 fc             	cmp    -0x4(%ebp),%al
 236:	75 05                	jne    23d <strchr+0x1e>
      return (char*)s;
 238:	8b 45 08             	mov    0x8(%ebp),%eax
 23b:	eb 13                	jmp    250 <strchr+0x31>
  for(; *s; s++)
 23d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 241:	8b 45 08             	mov    0x8(%ebp),%eax
 244:	0f b6 00             	movzbl (%eax),%eax
 247:	84 c0                	test   %al,%al
 249:	75 e2                	jne    22d <strchr+0xe>
  return 0;
 24b:	b8 00 00 00 00       	mov    $0x0,%eax
}
 250:	c9                   	leave  
 251:	c3                   	ret    

00000252 <gets>:

char*
gets(char *buf, int max)
{
 252:	55                   	push   %ebp
 253:	89 e5                	mov    %esp,%ebp
 255:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 258:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 25f:	eb 4c                	jmp    2ad <gets+0x5b>
    cc = read(0, &c, 1);
 261:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 268:	00 
 269:	8d 45 ef             	lea    -0x11(%ebp),%eax
 26c:	89 44 24 04          	mov    %eax,0x4(%esp)
 270:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 277:	e8 44 01 00 00       	call   3c0 <read>
 27c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 27f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 283:	7f 02                	jg     287 <gets+0x35>
      break;
 285:	eb 31                	jmp    2b8 <gets+0x66>
    buf[i++] = c;
 287:	8b 45 f4             	mov    -0xc(%ebp),%eax
 28a:	8d 50 01             	lea    0x1(%eax),%edx
 28d:	89 55 f4             	mov    %edx,-0xc(%ebp)
 290:	89 c2                	mov    %eax,%edx
 292:	8b 45 08             	mov    0x8(%ebp),%eax
 295:	01 c2                	add    %eax,%edx
 297:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 29b:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 29d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 2a1:	3c 0a                	cmp    $0xa,%al
 2a3:	74 13                	je     2b8 <gets+0x66>
 2a5:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 2a9:	3c 0d                	cmp    $0xd,%al
 2ab:	74 0b                	je     2b8 <gets+0x66>
  for(i=0; i+1 < max; ){
 2ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2b0:	83 c0 01             	add    $0x1,%eax
 2b3:	3b 45 0c             	cmp    0xc(%ebp),%eax
 2b6:	7c a9                	jl     261 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 2b8:	8b 55 f4             	mov    -0xc(%ebp),%edx
 2bb:	8b 45 08             	mov    0x8(%ebp),%eax
 2be:	01 d0                	add    %edx,%eax
 2c0:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 2c3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2c6:	c9                   	leave  
 2c7:	c3                   	ret    

000002c8 <stat>:

int
stat(const char *n, struct stat *st)
{
 2c8:	55                   	push   %ebp
 2c9:	89 e5                	mov    %esp,%ebp
 2cb:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2ce:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2d5:	00 
 2d6:	8b 45 08             	mov    0x8(%ebp),%eax
 2d9:	89 04 24             	mov    %eax,(%esp)
 2dc:	e8 07 01 00 00       	call   3e8 <open>
 2e1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 2e4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2e8:	79 07                	jns    2f1 <stat+0x29>
    return -1;
 2ea:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2ef:	eb 23                	jmp    314 <stat+0x4c>
  r = fstat(fd, st);
 2f1:	8b 45 0c             	mov    0xc(%ebp),%eax
 2f4:	89 44 24 04          	mov    %eax,0x4(%esp)
 2f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2fb:	89 04 24             	mov    %eax,(%esp)
 2fe:	e8 fd 00 00 00       	call   400 <fstat>
 303:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 306:	8b 45 f4             	mov    -0xc(%ebp),%eax
 309:	89 04 24             	mov    %eax,(%esp)
 30c:	e8 bf 00 00 00       	call   3d0 <close>
  return r;
 311:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 314:	c9                   	leave  
 315:	c3                   	ret    

00000316 <atoi>:

int
atoi(const char *s)
{
 316:	55                   	push   %ebp
 317:	89 e5                	mov    %esp,%ebp
 319:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 31c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 323:	eb 25                	jmp    34a <atoi+0x34>
    n = n*10 + *s++ - '0';
 325:	8b 55 fc             	mov    -0x4(%ebp),%edx
 328:	89 d0                	mov    %edx,%eax
 32a:	c1 e0 02             	shl    $0x2,%eax
 32d:	01 d0                	add    %edx,%eax
 32f:	01 c0                	add    %eax,%eax
 331:	89 c1                	mov    %eax,%ecx
 333:	8b 45 08             	mov    0x8(%ebp),%eax
 336:	8d 50 01             	lea    0x1(%eax),%edx
 339:	89 55 08             	mov    %edx,0x8(%ebp)
 33c:	0f b6 00             	movzbl (%eax),%eax
 33f:	0f be c0             	movsbl %al,%eax
 342:	01 c8                	add    %ecx,%eax
 344:	83 e8 30             	sub    $0x30,%eax
 347:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 34a:	8b 45 08             	mov    0x8(%ebp),%eax
 34d:	0f b6 00             	movzbl (%eax),%eax
 350:	3c 2f                	cmp    $0x2f,%al
 352:	7e 0a                	jle    35e <atoi+0x48>
 354:	8b 45 08             	mov    0x8(%ebp),%eax
 357:	0f b6 00             	movzbl (%eax),%eax
 35a:	3c 39                	cmp    $0x39,%al
 35c:	7e c7                	jle    325 <atoi+0xf>
  return n;
 35e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 361:	c9                   	leave  
 362:	c3                   	ret    

00000363 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 363:	55                   	push   %ebp
 364:	89 e5                	mov    %esp,%ebp
 366:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 369:	8b 45 08             	mov    0x8(%ebp),%eax
 36c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 36f:	8b 45 0c             	mov    0xc(%ebp),%eax
 372:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 375:	eb 17                	jmp    38e <memmove+0x2b>
    *dst++ = *src++;
 377:	8b 45 fc             	mov    -0x4(%ebp),%eax
 37a:	8d 50 01             	lea    0x1(%eax),%edx
 37d:	89 55 fc             	mov    %edx,-0x4(%ebp)
 380:	8b 55 f8             	mov    -0x8(%ebp),%edx
 383:	8d 4a 01             	lea    0x1(%edx),%ecx
 386:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 389:	0f b6 12             	movzbl (%edx),%edx
 38c:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 38e:	8b 45 10             	mov    0x10(%ebp),%eax
 391:	8d 50 ff             	lea    -0x1(%eax),%edx
 394:	89 55 10             	mov    %edx,0x10(%ebp)
 397:	85 c0                	test   %eax,%eax
 399:	7f dc                	jg     377 <memmove+0x14>
  return vdst;
 39b:	8b 45 08             	mov    0x8(%ebp),%eax
}
 39e:	c9                   	leave  
 39f:	c3                   	ret    

000003a0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3a0:	b8 01 00 00 00       	mov    $0x1,%eax
 3a5:	cd 40                	int    $0x40
 3a7:	c3                   	ret    

000003a8 <exit>:
SYSCALL(exit)
 3a8:	b8 02 00 00 00       	mov    $0x2,%eax
 3ad:	cd 40                	int    $0x40
 3af:	c3                   	ret    

000003b0 <wait>:
SYSCALL(wait)
 3b0:	b8 03 00 00 00       	mov    $0x3,%eax
 3b5:	cd 40                	int    $0x40
 3b7:	c3                   	ret    

000003b8 <pipe>:
SYSCALL(pipe)
 3b8:	b8 04 00 00 00       	mov    $0x4,%eax
 3bd:	cd 40                	int    $0x40
 3bf:	c3                   	ret    

000003c0 <read>:
SYSCALL(read)
 3c0:	b8 05 00 00 00       	mov    $0x5,%eax
 3c5:	cd 40                	int    $0x40
 3c7:	c3                   	ret    

000003c8 <write>:
SYSCALL(write)
 3c8:	b8 10 00 00 00       	mov    $0x10,%eax
 3cd:	cd 40                	int    $0x40
 3cf:	c3                   	ret    

000003d0 <close>:
SYSCALL(close)
 3d0:	b8 15 00 00 00       	mov    $0x15,%eax
 3d5:	cd 40                	int    $0x40
 3d7:	c3                   	ret    

000003d8 <kill>:
SYSCALL(kill)
 3d8:	b8 06 00 00 00       	mov    $0x6,%eax
 3dd:	cd 40                	int    $0x40
 3df:	c3                   	ret    

000003e0 <exec>:
SYSCALL(exec)
 3e0:	b8 07 00 00 00       	mov    $0x7,%eax
 3e5:	cd 40                	int    $0x40
 3e7:	c3                   	ret    

000003e8 <open>:
SYSCALL(open)
 3e8:	b8 0f 00 00 00       	mov    $0xf,%eax
 3ed:	cd 40                	int    $0x40
 3ef:	c3                   	ret    

000003f0 <mknod>:
SYSCALL(mknod)
 3f0:	b8 11 00 00 00       	mov    $0x11,%eax
 3f5:	cd 40                	int    $0x40
 3f7:	c3                   	ret    

000003f8 <unlink>:
SYSCALL(unlink)
 3f8:	b8 12 00 00 00       	mov    $0x12,%eax
 3fd:	cd 40                	int    $0x40
 3ff:	c3                   	ret    

00000400 <fstat>:
SYSCALL(fstat)
 400:	b8 08 00 00 00       	mov    $0x8,%eax
 405:	cd 40                	int    $0x40
 407:	c3                   	ret    

00000408 <link>:
SYSCALL(link)
 408:	b8 13 00 00 00       	mov    $0x13,%eax
 40d:	cd 40                	int    $0x40
 40f:	c3                   	ret    

00000410 <mkdir>:
SYSCALL(mkdir)
 410:	b8 14 00 00 00       	mov    $0x14,%eax
 415:	cd 40                	int    $0x40
 417:	c3                   	ret    

00000418 <chdir>:
SYSCALL(chdir)
 418:	b8 09 00 00 00       	mov    $0x9,%eax
 41d:	cd 40                	int    $0x40
 41f:	c3                   	ret    

00000420 <dup>:
SYSCALL(dup)
 420:	b8 0a 00 00 00       	mov    $0xa,%eax
 425:	cd 40                	int    $0x40
 427:	c3                   	ret    

00000428 <getpid>:
SYSCALL(getpid)
 428:	b8 0b 00 00 00       	mov    $0xb,%eax
 42d:	cd 40                	int    $0x40
 42f:	c3                   	ret    

00000430 <sbrk>:
SYSCALL(sbrk)
 430:	b8 0c 00 00 00       	mov    $0xc,%eax
 435:	cd 40                	int    $0x40
 437:	c3                   	ret    

00000438 <sleep>:
SYSCALL(sleep)
 438:	b8 0d 00 00 00       	mov    $0xd,%eax
 43d:	cd 40                	int    $0x40
 43f:	c3                   	ret    

00000440 <uptime>:
SYSCALL(uptime)
 440:	b8 0e 00 00 00       	mov    $0xe,%eax
 445:	cd 40                	int    $0x40
 447:	c3                   	ret    

00000448 <getpinfo>:
SYSCALL(getpinfo)
 448:	b8 16 00 00 00       	mov    $0x16,%eax
 44d:	cd 40                	int    $0x40
 44f:	c3                   	ret    

00000450 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	83 ec 18             	sub    $0x18,%esp
 456:	8b 45 0c             	mov    0xc(%ebp),%eax
 459:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 45c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 463:	00 
 464:	8d 45 f4             	lea    -0xc(%ebp),%eax
 467:	89 44 24 04          	mov    %eax,0x4(%esp)
 46b:	8b 45 08             	mov    0x8(%ebp),%eax
 46e:	89 04 24             	mov    %eax,(%esp)
 471:	e8 52 ff ff ff       	call   3c8 <write>
}
 476:	c9                   	leave  
 477:	c3                   	ret    

00000478 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 478:	55                   	push   %ebp
 479:	89 e5                	mov    %esp,%ebp
 47b:	56                   	push   %esi
 47c:	53                   	push   %ebx
 47d:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 480:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 487:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 48b:	74 17                	je     4a4 <printint+0x2c>
 48d:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 491:	79 11                	jns    4a4 <printint+0x2c>
    neg = 1;
 493:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 49a:	8b 45 0c             	mov    0xc(%ebp),%eax
 49d:	f7 d8                	neg    %eax
 49f:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4a2:	eb 06                	jmp    4aa <printint+0x32>
  } else {
    x = xx;
 4a4:	8b 45 0c             	mov    0xc(%ebp),%eax
 4a7:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 4aa:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 4b1:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 4b4:	8d 41 01             	lea    0x1(%ecx),%eax
 4b7:	89 45 f4             	mov    %eax,-0xc(%ebp)
 4ba:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4bd:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4c0:	ba 00 00 00 00       	mov    $0x0,%edx
 4c5:	f7 f3                	div    %ebx
 4c7:	89 d0                	mov    %edx,%eax
 4c9:	0f b6 80 c0 0b 00 00 	movzbl 0xbc0(%eax),%eax
 4d0:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 4d4:	8b 75 10             	mov    0x10(%ebp),%esi
 4d7:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4da:	ba 00 00 00 00       	mov    $0x0,%edx
 4df:	f7 f6                	div    %esi
 4e1:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4e4:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4e8:	75 c7                	jne    4b1 <printint+0x39>
  if(neg)
 4ea:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4ee:	74 10                	je     500 <printint+0x88>
    buf[i++] = '-';
 4f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4f3:	8d 50 01             	lea    0x1(%eax),%edx
 4f6:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4f9:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 4fe:	eb 1f                	jmp    51f <printint+0xa7>
 500:	eb 1d                	jmp    51f <printint+0xa7>
    putc(fd, buf[i]);
 502:	8d 55 dc             	lea    -0x24(%ebp),%edx
 505:	8b 45 f4             	mov    -0xc(%ebp),%eax
 508:	01 d0                	add    %edx,%eax
 50a:	0f b6 00             	movzbl (%eax),%eax
 50d:	0f be c0             	movsbl %al,%eax
 510:	89 44 24 04          	mov    %eax,0x4(%esp)
 514:	8b 45 08             	mov    0x8(%ebp),%eax
 517:	89 04 24             	mov    %eax,(%esp)
 51a:	e8 31 ff ff ff       	call   450 <putc>
  while(--i >= 0)
 51f:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 523:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 527:	79 d9                	jns    502 <printint+0x8a>
}
 529:	83 c4 30             	add    $0x30,%esp
 52c:	5b                   	pop    %ebx
 52d:	5e                   	pop    %esi
 52e:	5d                   	pop    %ebp
 52f:	c3                   	ret    

00000530 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 536:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 53d:	8d 45 0c             	lea    0xc(%ebp),%eax
 540:	83 c0 04             	add    $0x4,%eax
 543:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 546:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 54d:	e9 7c 01 00 00       	jmp    6ce <printf+0x19e>
    c = fmt[i] & 0xff;
 552:	8b 55 0c             	mov    0xc(%ebp),%edx
 555:	8b 45 f0             	mov    -0x10(%ebp),%eax
 558:	01 d0                	add    %edx,%eax
 55a:	0f b6 00             	movzbl (%eax),%eax
 55d:	0f be c0             	movsbl %al,%eax
 560:	25 ff 00 00 00       	and    $0xff,%eax
 565:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 568:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 56c:	75 2c                	jne    59a <printf+0x6a>
      if(c == '%'){
 56e:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 572:	75 0c                	jne    580 <printf+0x50>
        state = '%';
 574:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 57b:	e9 4a 01 00 00       	jmp    6ca <printf+0x19a>
      } else {
        putc(fd, c);
 580:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 583:	0f be c0             	movsbl %al,%eax
 586:	89 44 24 04          	mov    %eax,0x4(%esp)
 58a:	8b 45 08             	mov    0x8(%ebp),%eax
 58d:	89 04 24             	mov    %eax,(%esp)
 590:	e8 bb fe ff ff       	call   450 <putc>
 595:	e9 30 01 00 00       	jmp    6ca <printf+0x19a>
      }
    } else if(state == '%'){
 59a:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 59e:	0f 85 26 01 00 00    	jne    6ca <printf+0x19a>
      if(c == 'd'){
 5a4:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 5a8:	75 2d                	jne    5d7 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 5aa:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5ad:	8b 00                	mov    (%eax),%eax
 5af:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 5b6:	00 
 5b7:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 5be:	00 
 5bf:	89 44 24 04          	mov    %eax,0x4(%esp)
 5c3:	8b 45 08             	mov    0x8(%ebp),%eax
 5c6:	89 04 24             	mov    %eax,(%esp)
 5c9:	e8 aa fe ff ff       	call   478 <printint>
        ap++;
 5ce:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5d2:	e9 ec 00 00 00       	jmp    6c3 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 5d7:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 5db:	74 06                	je     5e3 <printf+0xb3>
 5dd:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 5e1:	75 2d                	jne    610 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 5e3:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5e6:	8b 00                	mov    (%eax),%eax
 5e8:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 5ef:	00 
 5f0:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 5f7:	00 
 5f8:	89 44 24 04          	mov    %eax,0x4(%esp)
 5fc:	8b 45 08             	mov    0x8(%ebp),%eax
 5ff:	89 04 24             	mov    %eax,(%esp)
 602:	e8 71 fe ff ff       	call   478 <printint>
        ap++;
 607:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 60b:	e9 b3 00 00 00       	jmp    6c3 <printf+0x193>
      } else if(c == 's'){
 610:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 614:	75 45                	jne    65b <printf+0x12b>
        s = (char*)*ap;
 616:	8b 45 e8             	mov    -0x18(%ebp),%eax
 619:	8b 00                	mov    (%eax),%eax
 61b:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 61e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 622:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 626:	75 09                	jne    631 <printf+0x101>
          s = "(null)";
 628:	c7 45 f4 34 09 00 00 	movl   $0x934,-0xc(%ebp)
        while(*s != 0){
 62f:	eb 1e                	jmp    64f <printf+0x11f>
 631:	eb 1c                	jmp    64f <printf+0x11f>
          putc(fd, *s);
 633:	8b 45 f4             	mov    -0xc(%ebp),%eax
 636:	0f b6 00             	movzbl (%eax),%eax
 639:	0f be c0             	movsbl %al,%eax
 63c:	89 44 24 04          	mov    %eax,0x4(%esp)
 640:	8b 45 08             	mov    0x8(%ebp),%eax
 643:	89 04 24             	mov    %eax,(%esp)
 646:	e8 05 fe ff ff       	call   450 <putc>
          s++;
 64b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 64f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 652:	0f b6 00             	movzbl (%eax),%eax
 655:	84 c0                	test   %al,%al
 657:	75 da                	jne    633 <printf+0x103>
 659:	eb 68                	jmp    6c3 <printf+0x193>
        }
      } else if(c == 'c'){
 65b:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 65f:	75 1d                	jne    67e <printf+0x14e>
        putc(fd, *ap);
 661:	8b 45 e8             	mov    -0x18(%ebp),%eax
 664:	8b 00                	mov    (%eax),%eax
 666:	0f be c0             	movsbl %al,%eax
 669:	89 44 24 04          	mov    %eax,0x4(%esp)
 66d:	8b 45 08             	mov    0x8(%ebp),%eax
 670:	89 04 24             	mov    %eax,(%esp)
 673:	e8 d8 fd ff ff       	call   450 <putc>
        ap++;
 678:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 67c:	eb 45                	jmp    6c3 <printf+0x193>
      } else if(c == '%'){
 67e:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 682:	75 17                	jne    69b <printf+0x16b>
        putc(fd, c);
 684:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 687:	0f be c0             	movsbl %al,%eax
 68a:	89 44 24 04          	mov    %eax,0x4(%esp)
 68e:	8b 45 08             	mov    0x8(%ebp),%eax
 691:	89 04 24             	mov    %eax,(%esp)
 694:	e8 b7 fd ff ff       	call   450 <putc>
 699:	eb 28                	jmp    6c3 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 69b:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 6a2:	00 
 6a3:	8b 45 08             	mov    0x8(%ebp),%eax
 6a6:	89 04 24             	mov    %eax,(%esp)
 6a9:	e8 a2 fd ff ff       	call   450 <putc>
        putc(fd, c);
 6ae:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6b1:	0f be c0             	movsbl %al,%eax
 6b4:	89 44 24 04          	mov    %eax,0x4(%esp)
 6b8:	8b 45 08             	mov    0x8(%ebp),%eax
 6bb:	89 04 24             	mov    %eax,(%esp)
 6be:	e8 8d fd ff ff       	call   450 <putc>
      }
      state = 0;
 6c3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 6ca:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 6ce:	8b 55 0c             	mov    0xc(%ebp),%edx
 6d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6d4:	01 d0                	add    %edx,%eax
 6d6:	0f b6 00             	movzbl (%eax),%eax
 6d9:	84 c0                	test   %al,%al
 6db:	0f 85 71 fe ff ff    	jne    552 <printf+0x22>
    }
  }
}
 6e1:	c9                   	leave  
 6e2:	c3                   	ret    

000006e3 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6e3:	55                   	push   %ebp
 6e4:	89 e5                	mov    %esp,%ebp
 6e6:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6e9:	8b 45 08             	mov    0x8(%ebp),%eax
 6ec:	83 e8 08             	sub    $0x8,%eax
 6ef:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6f2:	a1 e8 0b 00 00       	mov    0xbe8,%eax
 6f7:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6fa:	eb 24                	jmp    720 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6fc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ff:	8b 00                	mov    (%eax),%eax
 701:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 704:	77 12                	ja     718 <free+0x35>
 706:	8b 45 f8             	mov    -0x8(%ebp),%eax
 709:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 70c:	77 24                	ja     732 <free+0x4f>
 70e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 711:	8b 00                	mov    (%eax),%eax
 713:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 716:	77 1a                	ja     732 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 718:	8b 45 fc             	mov    -0x4(%ebp),%eax
 71b:	8b 00                	mov    (%eax),%eax
 71d:	89 45 fc             	mov    %eax,-0x4(%ebp)
 720:	8b 45 f8             	mov    -0x8(%ebp),%eax
 723:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 726:	76 d4                	jbe    6fc <free+0x19>
 728:	8b 45 fc             	mov    -0x4(%ebp),%eax
 72b:	8b 00                	mov    (%eax),%eax
 72d:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 730:	76 ca                	jbe    6fc <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 732:	8b 45 f8             	mov    -0x8(%ebp),%eax
 735:	8b 40 04             	mov    0x4(%eax),%eax
 738:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 73f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 742:	01 c2                	add    %eax,%edx
 744:	8b 45 fc             	mov    -0x4(%ebp),%eax
 747:	8b 00                	mov    (%eax),%eax
 749:	39 c2                	cmp    %eax,%edx
 74b:	75 24                	jne    771 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 74d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 750:	8b 50 04             	mov    0x4(%eax),%edx
 753:	8b 45 fc             	mov    -0x4(%ebp),%eax
 756:	8b 00                	mov    (%eax),%eax
 758:	8b 40 04             	mov    0x4(%eax),%eax
 75b:	01 c2                	add    %eax,%edx
 75d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 760:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 763:	8b 45 fc             	mov    -0x4(%ebp),%eax
 766:	8b 00                	mov    (%eax),%eax
 768:	8b 10                	mov    (%eax),%edx
 76a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 76d:	89 10                	mov    %edx,(%eax)
 76f:	eb 0a                	jmp    77b <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 771:	8b 45 fc             	mov    -0x4(%ebp),%eax
 774:	8b 10                	mov    (%eax),%edx
 776:	8b 45 f8             	mov    -0x8(%ebp),%eax
 779:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 77b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 77e:	8b 40 04             	mov    0x4(%eax),%eax
 781:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 788:	8b 45 fc             	mov    -0x4(%ebp),%eax
 78b:	01 d0                	add    %edx,%eax
 78d:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 790:	75 20                	jne    7b2 <free+0xcf>
    p->s.size += bp->s.size;
 792:	8b 45 fc             	mov    -0x4(%ebp),%eax
 795:	8b 50 04             	mov    0x4(%eax),%edx
 798:	8b 45 f8             	mov    -0x8(%ebp),%eax
 79b:	8b 40 04             	mov    0x4(%eax),%eax
 79e:	01 c2                	add    %eax,%edx
 7a0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a3:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7a6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7a9:	8b 10                	mov    (%eax),%edx
 7ab:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ae:	89 10                	mov    %edx,(%eax)
 7b0:	eb 08                	jmp    7ba <free+0xd7>
  } else
    p->s.ptr = bp;
 7b2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b5:	8b 55 f8             	mov    -0x8(%ebp),%edx
 7b8:	89 10                	mov    %edx,(%eax)
  freep = p;
 7ba:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7bd:	a3 e8 0b 00 00       	mov    %eax,0xbe8
}
 7c2:	c9                   	leave  
 7c3:	c3                   	ret    

000007c4 <morecore>:

static Header*
morecore(uint nu)
{
 7c4:	55                   	push   %ebp
 7c5:	89 e5                	mov    %esp,%ebp
 7c7:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 7ca:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 7d1:	77 07                	ja     7da <morecore+0x16>
    nu = 4096;
 7d3:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 7da:	8b 45 08             	mov    0x8(%ebp),%eax
 7dd:	c1 e0 03             	shl    $0x3,%eax
 7e0:	89 04 24             	mov    %eax,(%esp)
 7e3:	e8 48 fc ff ff       	call   430 <sbrk>
 7e8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 7eb:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 7ef:	75 07                	jne    7f8 <morecore+0x34>
    return 0;
 7f1:	b8 00 00 00 00       	mov    $0x0,%eax
 7f6:	eb 22                	jmp    81a <morecore+0x56>
  hp = (Header*)p;
 7f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7fb:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 7fe:	8b 45 f0             	mov    -0x10(%ebp),%eax
 801:	8b 55 08             	mov    0x8(%ebp),%edx
 804:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 807:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80a:	83 c0 08             	add    $0x8,%eax
 80d:	89 04 24             	mov    %eax,(%esp)
 810:	e8 ce fe ff ff       	call   6e3 <free>
  return freep;
 815:	a1 e8 0b 00 00       	mov    0xbe8,%eax
}
 81a:	c9                   	leave  
 81b:	c3                   	ret    

0000081c <malloc>:

void*
malloc(uint nbytes)
{
 81c:	55                   	push   %ebp
 81d:	89 e5                	mov    %esp,%ebp
 81f:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 822:	8b 45 08             	mov    0x8(%ebp),%eax
 825:	83 c0 07             	add    $0x7,%eax
 828:	c1 e8 03             	shr    $0x3,%eax
 82b:	83 c0 01             	add    $0x1,%eax
 82e:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 831:	a1 e8 0b 00 00       	mov    0xbe8,%eax
 836:	89 45 f0             	mov    %eax,-0x10(%ebp)
 839:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 83d:	75 23                	jne    862 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 83f:	c7 45 f0 e0 0b 00 00 	movl   $0xbe0,-0x10(%ebp)
 846:	8b 45 f0             	mov    -0x10(%ebp),%eax
 849:	a3 e8 0b 00 00       	mov    %eax,0xbe8
 84e:	a1 e8 0b 00 00       	mov    0xbe8,%eax
 853:	a3 e0 0b 00 00       	mov    %eax,0xbe0
    base.s.size = 0;
 858:	c7 05 e4 0b 00 00 00 	movl   $0x0,0xbe4
 85f:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 862:	8b 45 f0             	mov    -0x10(%ebp),%eax
 865:	8b 00                	mov    (%eax),%eax
 867:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 86a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 86d:	8b 40 04             	mov    0x4(%eax),%eax
 870:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 873:	72 4d                	jb     8c2 <malloc+0xa6>
      if(p->s.size == nunits)
 875:	8b 45 f4             	mov    -0xc(%ebp),%eax
 878:	8b 40 04             	mov    0x4(%eax),%eax
 87b:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 87e:	75 0c                	jne    88c <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 880:	8b 45 f4             	mov    -0xc(%ebp),%eax
 883:	8b 10                	mov    (%eax),%edx
 885:	8b 45 f0             	mov    -0x10(%ebp),%eax
 888:	89 10                	mov    %edx,(%eax)
 88a:	eb 26                	jmp    8b2 <malloc+0x96>
      else {
        p->s.size -= nunits;
 88c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 88f:	8b 40 04             	mov    0x4(%eax),%eax
 892:	2b 45 ec             	sub    -0x14(%ebp),%eax
 895:	89 c2                	mov    %eax,%edx
 897:	8b 45 f4             	mov    -0xc(%ebp),%eax
 89a:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 89d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8a0:	8b 40 04             	mov    0x4(%eax),%eax
 8a3:	c1 e0 03             	shl    $0x3,%eax
 8a6:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 8a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ac:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8af:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 8b2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8b5:	a3 e8 0b 00 00       	mov    %eax,0xbe8
      return (void*)(p + 1);
 8ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8bd:	83 c0 08             	add    $0x8,%eax
 8c0:	eb 38                	jmp    8fa <malloc+0xde>
    }
    if(p == freep)
 8c2:	a1 e8 0b 00 00       	mov    0xbe8,%eax
 8c7:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 8ca:	75 1b                	jne    8e7 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 8cc:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8cf:	89 04 24             	mov    %eax,(%esp)
 8d2:	e8 ed fe ff ff       	call   7c4 <morecore>
 8d7:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8da:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8de:	75 07                	jne    8e7 <malloc+0xcb>
        return 0;
 8e0:	b8 00 00 00 00       	mov    $0x0,%eax
 8e5:	eb 13                	jmp    8fa <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ea:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8f0:	8b 00                	mov    (%eax),%eax
 8f2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 8f5:	e9 70 ff ff ff       	jmp    86a <malloc+0x4e>
}
 8fa:	c9                   	leave  
 8fb:	c3                   	ret    
