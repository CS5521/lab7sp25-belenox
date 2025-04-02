
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <wc>:

char buf[512];

void
wc(int fd, char *name)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 48             	sub    $0x48,%esp
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
   6:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
   d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10:	89 45 ec             	mov    %eax,-0x14(%ebp)
  13:	8b 45 ec             	mov    -0x14(%ebp),%eax
  16:	89 45 f0             	mov    %eax,-0x10(%ebp)
  inword = 0;
  19:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
  20:	eb 68                	jmp    8a <wc+0x8a>
    for(i=0; i<n; i++){
  22:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  29:	eb 57                	jmp    82 <wc+0x82>
      c++;
  2b:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
      if(buf[i] == '\n')
  2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  32:	05 a0 0c 00 00       	add    $0xca0,%eax
  37:	0f b6 00             	movzbl (%eax),%eax
  3a:	3c 0a                	cmp    $0xa,%al
  3c:	75 04                	jne    42 <wc+0x42>
        l++;
  3e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      if(strchr(" \r\t\n\v", buf[i]))
  42:	8b 45 f4             	mov    -0xc(%ebp),%eax
  45:	05 a0 0c 00 00       	add    $0xca0,%eax
  4a:	0f b6 00             	movzbl (%eax),%eax
  4d:	0f be c0             	movsbl %al,%eax
  50:	89 44 24 04          	mov    %eax,0x4(%esp)
  54:	c7 04 24 9a 09 00 00 	movl   $0x99a,(%esp)
  5b:	e8 5d 02 00 00       	call   2bd <strchr>
  60:	85 c0                	test   %eax,%eax
  62:	74 09                	je     6d <wc+0x6d>
        inword = 0;
  64:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  6b:	eb 11                	jmp    7e <wc+0x7e>
      else if(!inword){
  6d:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  71:	75 0b                	jne    7e <wc+0x7e>
        w++;
  73:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
        inword = 1;
  77:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
    for(i=0; i<n; i++){
  7e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  82:	8b 45 f4             	mov    -0xc(%ebp),%eax
  85:	3b 45 e0             	cmp    -0x20(%ebp),%eax
  88:	7c a1                	jl     2b <wc+0x2b>
  while((n = read(fd, buf, sizeof(buf))) > 0){
  8a:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  91:	00 
  92:	c7 44 24 04 a0 0c 00 	movl   $0xca0,0x4(%esp)
  99:	00 
  9a:	8b 45 08             	mov    0x8(%ebp),%eax
  9d:	89 04 24             	mov    %eax,(%esp)
  a0:	e8 b9 03 00 00       	call   45e <read>
  a5:	89 45 e0             	mov    %eax,-0x20(%ebp)
  a8:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  ac:	0f 8f 70 ff ff ff    	jg     22 <wc+0x22>
      }
    }
  }
  if(n < 0){
  b2:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  b6:	79 19                	jns    d1 <wc+0xd1>
    printf(1, "wc: read error\n");
  b8:	c7 44 24 04 a0 09 00 	movl   $0x9a0,0x4(%esp)
  bf:	00 
  c0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  c7:	e8 02 05 00 00       	call   5ce <printf>
    exit();
  cc:	e8 75 03 00 00       	call   446 <exit>
  }
  printf(1, "%d %d %d %s\n", l, w, c, name);
  d1:	8b 45 0c             	mov    0xc(%ebp),%eax
  d4:	89 44 24 14          	mov    %eax,0x14(%esp)
  d8:	8b 45 e8             	mov    -0x18(%ebp),%eax
  db:	89 44 24 10          	mov    %eax,0x10(%esp)
  df:	8b 45 ec             	mov    -0x14(%ebp),%eax
  e2:	89 44 24 0c          	mov    %eax,0xc(%esp)
  e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  e9:	89 44 24 08          	mov    %eax,0x8(%esp)
  ed:	c7 44 24 04 b0 09 00 	movl   $0x9b0,0x4(%esp)
  f4:	00 
  f5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  fc:	e8 cd 04 00 00       	call   5ce <printf>
}
 101:	c9                   	leave  
 102:	c3                   	ret    

00000103 <main>:

int
main(int argc, char *argv[])
{
 103:	55                   	push   %ebp
 104:	89 e5                	mov    %esp,%ebp
 106:	83 e4 f0             	and    $0xfffffff0,%esp
 109:	83 ec 20             	sub    $0x20,%esp
  int fd, i;

  if(argc <= 1){
 10c:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
 110:	7f 19                	jg     12b <main+0x28>
    wc(0, "");
 112:	c7 44 24 04 bd 09 00 	movl   $0x9bd,0x4(%esp)
 119:	00 
 11a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 121:	e8 da fe ff ff       	call   0 <wc>
    exit();
 126:	e8 1b 03 00 00       	call   446 <exit>
  }

  for(i = 1; i < argc; i++){
 12b:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
 132:	00 
 133:	e9 8f 00 00 00       	jmp    1c7 <main+0xc4>
    if((fd = open(argv[i], 0)) < 0){
 138:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 13c:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 143:	8b 45 0c             	mov    0xc(%ebp),%eax
 146:	01 d0                	add    %edx,%eax
 148:	8b 00                	mov    (%eax),%eax
 14a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 151:	00 
 152:	89 04 24             	mov    %eax,(%esp)
 155:	e8 2c 03 00 00       	call   486 <open>
 15a:	89 44 24 18          	mov    %eax,0x18(%esp)
 15e:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
 163:	79 2f                	jns    194 <main+0x91>
      printf(1, "wc: cannot open %s\n", argv[i]);
 165:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 169:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 170:	8b 45 0c             	mov    0xc(%ebp),%eax
 173:	01 d0                	add    %edx,%eax
 175:	8b 00                	mov    (%eax),%eax
 177:	89 44 24 08          	mov    %eax,0x8(%esp)
 17b:	c7 44 24 04 be 09 00 	movl   $0x9be,0x4(%esp)
 182:	00 
 183:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 18a:	e8 3f 04 00 00       	call   5ce <printf>
      exit();
 18f:	e8 b2 02 00 00       	call   446 <exit>
    }
    wc(fd, argv[i]);
 194:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 198:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 19f:	8b 45 0c             	mov    0xc(%ebp),%eax
 1a2:	01 d0                	add    %edx,%eax
 1a4:	8b 00                	mov    (%eax),%eax
 1a6:	89 44 24 04          	mov    %eax,0x4(%esp)
 1aa:	8b 44 24 18          	mov    0x18(%esp),%eax
 1ae:	89 04 24             	mov    %eax,(%esp)
 1b1:	e8 4a fe ff ff       	call   0 <wc>
    close(fd);
 1b6:	8b 44 24 18          	mov    0x18(%esp),%eax
 1ba:	89 04 24             	mov    %eax,(%esp)
 1bd:	e8 ac 02 00 00       	call   46e <close>
  for(i = 1; i < argc; i++){
 1c2:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
 1c7:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 1cb:	3b 45 08             	cmp    0x8(%ebp),%eax
 1ce:	0f 8c 64 ff ff ff    	jl     138 <main+0x35>
  }
  exit();
 1d4:	e8 6d 02 00 00       	call   446 <exit>

000001d9 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 1d9:	55                   	push   %ebp
 1da:	89 e5                	mov    %esp,%ebp
 1dc:	57                   	push   %edi
 1dd:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 1de:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1e1:	8b 55 10             	mov    0x10(%ebp),%edx
 1e4:	8b 45 0c             	mov    0xc(%ebp),%eax
 1e7:	89 cb                	mov    %ecx,%ebx
 1e9:	89 df                	mov    %ebx,%edi
 1eb:	89 d1                	mov    %edx,%ecx
 1ed:	fc                   	cld    
 1ee:	f3 aa                	rep stos %al,%es:(%edi)
 1f0:	89 ca                	mov    %ecx,%edx
 1f2:	89 fb                	mov    %edi,%ebx
 1f4:	89 5d 08             	mov    %ebx,0x8(%ebp)
 1f7:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 1fa:	5b                   	pop    %ebx
 1fb:	5f                   	pop    %edi
 1fc:	5d                   	pop    %ebp
 1fd:	c3                   	ret    

000001fe <ps>:
#include "stat.h"
#include "fcntl.h"
#include "user.h"
#include "x86.h"

void ps(){
 1fe:	55                   	push   %ebp
 1ff:	89 e5                	mov    %esp,%ebp
  
 //  pstatTable * pst = getpinfo
}
 201:	5d                   	pop    %ebp
 202:	c3                   	ret    

00000203 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 203:	55                   	push   %ebp
 204:	89 e5                	mov    %esp,%ebp
 206:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 209:	8b 45 08             	mov    0x8(%ebp),%eax
 20c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 20f:	90                   	nop
 210:	8b 45 08             	mov    0x8(%ebp),%eax
 213:	8d 50 01             	lea    0x1(%eax),%edx
 216:	89 55 08             	mov    %edx,0x8(%ebp)
 219:	8b 55 0c             	mov    0xc(%ebp),%edx
 21c:	8d 4a 01             	lea    0x1(%edx),%ecx
 21f:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 222:	0f b6 12             	movzbl (%edx),%edx
 225:	88 10                	mov    %dl,(%eax)
 227:	0f b6 00             	movzbl (%eax),%eax
 22a:	84 c0                	test   %al,%al
 22c:	75 e2                	jne    210 <strcpy+0xd>
    ;
  return os;
 22e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 231:	c9                   	leave  
 232:	c3                   	ret    

00000233 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 233:	55                   	push   %ebp
 234:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 236:	eb 08                	jmp    240 <strcmp+0xd>
    p++, q++;
 238:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 23c:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 240:	8b 45 08             	mov    0x8(%ebp),%eax
 243:	0f b6 00             	movzbl (%eax),%eax
 246:	84 c0                	test   %al,%al
 248:	74 10                	je     25a <strcmp+0x27>
 24a:	8b 45 08             	mov    0x8(%ebp),%eax
 24d:	0f b6 10             	movzbl (%eax),%edx
 250:	8b 45 0c             	mov    0xc(%ebp),%eax
 253:	0f b6 00             	movzbl (%eax),%eax
 256:	38 c2                	cmp    %al,%dl
 258:	74 de                	je     238 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 25a:	8b 45 08             	mov    0x8(%ebp),%eax
 25d:	0f b6 00             	movzbl (%eax),%eax
 260:	0f b6 d0             	movzbl %al,%edx
 263:	8b 45 0c             	mov    0xc(%ebp),%eax
 266:	0f b6 00             	movzbl (%eax),%eax
 269:	0f b6 c0             	movzbl %al,%eax
 26c:	29 c2                	sub    %eax,%edx
 26e:	89 d0                	mov    %edx,%eax
}
 270:	5d                   	pop    %ebp
 271:	c3                   	ret    

00000272 <strlen>:

uint
strlen(const char *s)
{
 272:	55                   	push   %ebp
 273:	89 e5                	mov    %esp,%ebp
 275:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 278:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 27f:	eb 04                	jmp    285 <strlen+0x13>
 281:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 285:	8b 55 fc             	mov    -0x4(%ebp),%edx
 288:	8b 45 08             	mov    0x8(%ebp),%eax
 28b:	01 d0                	add    %edx,%eax
 28d:	0f b6 00             	movzbl (%eax),%eax
 290:	84 c0                	test   %al,%al
 292:	75 ed                	jne    281 <strlen+0xf>
    ;
  return n;
 294:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 297:	c9                   	leave  
 298:	c3                   	ret    

00000299 <memset>:

void*
memset(void *dst, int c, uint n)
{
 299:	55                   	push   %ebp
 29a:	89 e5                	mov    %esp,%ebp
 29c:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 29f:	8b 45 10             	mov    0x10(%ebp),%eax
 2a2:	89 44 24 08          	mov    %eax,0x8(%esp)
 2a6:	8b 45 0c             	mov    0xc(%ebp),%eax
 2a9:	89 44 24 04          	mov    %eax,0x4(%esp)
 2ad:	8b 45 08             	mov    0x8(%ebp),%eax
 2b0:	89 04 24             	mov    %eax,(%esp)
 2b3:	e8 21 ff ff ff       	call   1d9 <stosb>
  return dst;
 2b8:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2bb:	c9                   	leave  
 2bc:	c3                   	ret    

000002bd <strchr>:

char*
strchr(const char *s, char c)
{
 2bd:	55                   	push   %ebp
 2be:	89 e5                	mov    %esp,%ebp
 2c0:	83 ec 04             	sub    $0x4,%esp
 2c3:	8b 45 0c             	mov    0xc(%ebp),%eax
 2c6:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 2c9:	eb 14                	jmp    2df <strchr+0x22>
    if(*s == c)
 2cb:	8b 45 08             	mov    0x8(%ebp),%eax
 2ce:	0f b6 00             	movzbl (%eax),%eax
 2d1:	3a 45 fc             	cmp    -0x4(%ebp),%al
 2d4:	75 05                	jne    2db <strchr+0x1e>
      return (char*)s;
 2d6:	8b 45 08             	mov    0x8(%ebp),%eax
 2d9:	eb 13                	jmp    2ee <strchr+0x31>
  for(; *s; s++)
 2db:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2df:	8b 45 08             	mov    0x8(%ebp),%eax
 2e2:	0f b6 00             	movzbl (%eax),%eax
 2e5:	84 c0                	test   %al,%al
 2e7:	75 e2                	jne    2cb <strchr+0xe>
  return 0;
 2e9:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2ee:	c9                   	leave  
 2ef:	c3                   	ret    

000002f0 <gets>:

char*
gets(char *buf, int max)
{
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2f6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 2fd:	eb 4c                	jmp    34b <gets+0x5b>
    cc = read(0, &c, 1);
 2ff:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 306:	00 
 307:	8d 45 ef             	lea    -0x11(%ebp),%eax
 30a:	89 44 24 04          	mov    %eax,0x4(%esp)
 30e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 315:	e8 44 01 00 00       	call   45e <read>
 31a:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 31d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 321:	7f 02                	jg     325 <gets+0x35>
      break;
 323:	eb 31                	jmp    356 <gets+0x66>
    buf[i++] = c;
 325:	8b 45 f4             	mov    -0xc(%ebp),%eax
 328:	8d 50 01             	lea    0x1(%eax),%edx
 32b:	89 55 f4             	mov    %edx,-0xc(%ebp)
 32e:	89 c2                	mov    %eax,%edx
 330:	8b 45 08             	mov    0x8(%ebp),%eax
 333:	01 c2                	add    %eax,%edx
 335:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 339:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 33b:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 33f:	3c 0a                	cmp    $0xa,%al
 341:	74 13                	je     356 <gets+0x66>
 343:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 347:	3c 0d                	cmp    $0xd,%al
 349:	74 0b                	je     356 <gets+0x66>
  for(i=0; i+1 < max; ){
 34b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 34e:	83 c0 01             	add    $0x1,%eax
 351:	3b 45 0c             	cmp    0xc(%ebp),%eax
 354:	7c a9                	jl     2ff <gets+0xf>
      break;
  }
  buf[i] = '\0';
 356:	8b 55 f4             	mov    -0xc(%ebp),%edx
 359:	8b 45 08             	mov    0x8(%ebp),%eax
 35c:	01 d0                	add    %edx,%eax
 35e:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 361:	8b 45 08             	mov    0x8(%ebp),%eax
}
 364:	c9                   	leave  
 365:	c3                   	ret    

00000366 <stat>:

int
stat(const char *n, struct stat *st)
{
 366:	55                   	push   %ebp
 367:	89 e5                	mov    %esp,%ebp
 369:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 36c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 373:	00 
 374:	8b 45 08             	mov    0x8(%ebp),%eax
 377:	89 04 24             	mov    %eax,(%esp)
 37a:	e8 07 01 00 00       	call   486 <open>
 37f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 382:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 386:	79 07                	jns    38f <stat+0x29>
    return -1;
 388:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 38d:	eb 23                	jmp    3b2 <stat+0x4c>
  r = fstat(fd, st);
 38f:	8b 45 0c             	mov    0xc(%ebp),%eax
 392:	89 44 24 04          	mov    %eax,0x4(%esp)
 396:	8b 45 f4             	mov    -0xc(%ebp),%eax
 399:	89 04 24             	mov    %eax,(%esp)
 39c:	e8 fd 00 00 00       	call   49e <fstat>
 3a1:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 3a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3a7:	89 04 24             	mov    %eax,(%esp)
 3aa:	e8 bf 00 00 00       	call   46e <close>
  return r;
 3af:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 3b2:	c9                   	leave  
 3b3:	c3                   	ret    

000003b4 <atoi>:

int
atoi(const char *s)
{
 3b4:	55                   	push   %ebp
 3b5:	89 e5                	mov    %esp,%ebp
 3b7:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 3ba:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 3c1:	eb 25                	jmp    3e8 <atoi+0x34>
    n = n*10 + *s++ - '0';
 3c3:	8b 55 fc             	mov    -0x4(%ebp),%edx
 3c6:	89 d0                	mov    %edx,%eax
 3c8:	c1 e0 02             	shl    $0x2,%eax
 3cb:	01 d0                	add    %edx,%eax
 3cd:	01 c0                	add    %eax,%eax
 3cf:	89 c1                	mov    %eax,%ecx
 3d1:	8b 45 08             	mov    0x8(%ebp),%eax
 3d4:	8d 50 01             	lea    0x1(%eax),%edx
 3d7:	89 55 08             	mov    %edx,0x8(%ebp)
 3da:	0f b6 00             	movzbl (%eax),%eax
 3dd:	0f be c0             	movsbl %al,%eax
 3e0:	01 c8                	add    %ecx,%eax
 3e2:	83 e8 30             	sub    $0x30,%eax
 3e5:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 3e8:	8b 45 08             	mov    0x8(%ebp),%eax
 3eb:	0f b6 00             	movzbl (%eax),%eax
 3ee:	3c 2f                	cmp    $0x2f,%al
 3f0:	7e 0a                	jle    3fc <atoi+0x48>
 3f2:	8b 45 08             	mov    0x8(%ebp),%eax
 3f5:	0f b6 00             	movzbl (%eax),%eax
 3f8:	3c 39                	cmp    $0x39,%al
 3fa:	7e c7                	jle    3c3 <atoi+0xf>
  return n;
 3fc:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3ff:	c9                   	leave  
 400:	c3                   	ret    

00000401 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 401:	55                   	push   %ebp
 402:	89 e5                	mov    %esp,%ebp
 404:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 407:	8b 45 08             	mov    0x8(%ebp),%eax
 40a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 40d:	8b 45 0c             	mov    0xc(%ebp),%eax
 410:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 413:	eb 17                	jmp    42c <memmove+0x2b>
    *dst++ = *src++;
 415:	8b 45 fc             	mov    -0x4(%ebp),%eax
 418:	8d 50 01             	lea    0x1(%eax),%edx
 41b:	89 55 fc             	mov    %edx,-0x4(%ebp)
 41e:	8b 55 f8             	mov    -0x8(%ebp),%edx
 421:	8d 4a 01             	lea    0x1(%edx),%ecx
 424:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 427:	0f b6 12             	movzbl (%edx),%edx
 42a:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 42c:	8b 45 10             	mov    0x10(%ebp),%eax
 42f:	8d 50 ff             	lea    -0x1(%eax),%edx
 432:	89 55 10             	mov    %edx,0x10(%ebp)
 435:	85 c0                	test   %eax,%eax
 437:	7f dc                	jg     415 <memmove+0x14>
  return vdst;
 439:	8b 45 08             	mov    0x8(%ebp),%eax
}
 43c:	c9                   	leave  
 43d:	c3                   	ret    

0000043e <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 43e:	b8 01 00 00 00       	mov    $0x1,%eax
 443:	cd 40                	int    $0x40
 445:	c3                   	ret    

00000446 <exit>:
SYSCALL(exit)
 446:	b8 02 00 00 00       	mov    $0x2,%eax
 44b:	cd 40                	int    $0x40
 44d:	c3                   	ret    

0000044e <wait>:
SYSCALL(wait)
 44e:	b8 03 00 00 00       	mov    $0x3,%eax
 453:	cd 40                	int    $0x40
 455:	c3                   	ret    

00000456 <pipe>:
SYSCALL(pipe)
 456:	b8 04 00 00 00       	mov    $0x4,%eax
 45b:	cd 40                	int    $0x40
 45d:	c3                   	ret    

0000045e <read>:
SYSCALL(read)
 45e:	b8 05 00 00 00       	mov    $0x5,%eax
 463:	cd 40                	int    $0x40
 465:	c3                   	ret    

00000466 <write>:
SYSCALL(write)
 466:	b8 10 00 00 00       	mov    $0x10,%eax
 46b:	cd 40                	int    $0x40
 46d:	c3                   	ret    

0000046e <close>:
SYSCALL(close)
 46e:	b8 15 00 00 00       	mov    $0x15,%eax
 473:	cd 40                	int    $0x40
 475:	c3                   	ret    

00000476 <kill>:
SYSCALL(kill)
 476:	b8 06 00 00 00       	mov    $0x6,%eax
 47b:	cd 40                	int    $0x40
 47d:	c3                   	ret    

0000047e <exec>:
SYSCALL(exec)
 47e:	b8 07 00 00 00       	mov    $0x7,%eax
 483:	cd 40                	int    $0x40
 485:	c3                   	ret    

00000486 <open>:
SYSCALL(open)
 486:	b8 0f 00 00 00       	mov    $0xf,%eax
 48b:	cd 40                	int    $0x40
 48d:	c3                   	ret    

0000048e <mknod>:
SYSCALL(mknod)
 48e:	b8 11 00 00 00       	mov    $0x11,%eax
 493:	cd 40                	int    $0x40
 495:	c3                   	ret    

00000496 <unlink>:
SYSCALL(unlink)
 496:	b8 12 00 00 00       	mov    $0x12,%eax
 49b:	cd 40                	int    $0x40
 49d:	c3                   	ret    

0000049e <fstat>:
SYSCALL(fstat)
 49e:	b8 08 00 00 00       	mov    $0x8,%eax
 4a3:	cd 40                	int    $0x40
 4a5:	c3                   	ret    

000004a6 <link>:
SYSCALL(link)
 4a6:	b8 13 00 00 00       	mov    $0x13,%eax
 4ab:	cd 40                	int    $0x40
 4ad:	c3                   	ret    

000004ae <mkdir>:
SYSCALL(mkdir)
 4ae:	b8 14 00 00 00       	mov    $0x14,%eax
 4b3:	cd 40                	int    $0x40
 4b5:	c3                   	ret    

000004b6 <chdir>:
SYSCALL(chdir)
 4b6:	b8 09 00 00 00       	mov    $0x9,%eax
 4bb:	cd 40                	int    $0x40
 4bd:	c3                   	ret    

000004be <dup>:
SYSCALL(dup)
 4be:	b8 0a 00 00 00       	mov    $0xa,%eax
 4c3:	cd 40                	int    $0x40
 4c5:	c3                   	ret    

000004c6 <getpid>:
SYSCALL(getpid)
 4c6:	b8 0b 00 00 00       	mov    $0xb,%eax
 4cb:	cd 40                	int    $0x40
 4cd:	c3                   	ret    

000004ce <sbrk>:
SYSCALL(sbrk)
 4ce:	b8 0c 00 00 00       	mov    $0xc,%eax
 4d3:	cd 40                	int    $0x40
 4d5:	c3                   	ret    

000004d6 <sleep>:
SYSCALL(sleep)
 4d6:	b8 0d 00 00 00       	mov    $0xd,%eax
 4db:	cd 40                	int    $0x40
 4dd:	c3                   	ret    

000004de <uptime>:
SYSCALL(uptime)
 4de:	b8 0e 00 00 00       	mov    $0xe,%eax
 4e3:	cd 40                	int    $0x40
 4e5:	c3                   	ret    

000004e6 <getpinfo>:
SYSCALL(getpinfo)
 4e6:	b8 16 00 00 00       	mov    $0x16,%eax
 4eb:	cd 40                	int    $0x40
 4ed:	c3                   	ret    

000004ee <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4ee:	55                   	push   %ebp
 4ef:	89 e5                	mov    %esp,%ebp
 4f1:	83 ec 18             	sub    $0x18,%esp
 4f4:	8b 45 0c             	mov    0xc(%ebp),%eax
 4f7:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 4fa:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 501:	00 
 502:	8d 45 f4             	lea    -0xc(%ebp),%eax
 505:	89 44 24 04          	mov    %eax,0x4(%esp)
 509:	8b 45 08             	mov    0x8(%ebp),%eax
 50c:	89 04 24             	mov    %eax,(%esp)
 50f:	e8 52 ff ff ff       	call   466 <write>
}
 514:	c9                   	leave  
 515:	c3                   	ret    

00000516 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 516:	55                   	push   %ebp
 517:	89 e5                	mov    %esp,%ebp
 519:	56                   	push   %esi
 51a:	53                   	push   %ebx
 51b:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 51e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 525:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 529:	74 17                	je     542 <printint+0x2c>
 52b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 52f:	79 11                	jns    542 <printint+0x2c>
    neg = 1;
 531:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 538:	8b 45 0c             	mov    0xc(%ebp),%eax
 53b:	f7 d8                	neg    %eax
 53d:	89 45 ec             	mov    %eax,-0x14(%ebp)
 540:	eb 06                	jmp    548 <printint+0x32>
  } else {
    x = xx;
 542:	8b 45 0c             	mov    0xc(%ebp),%eax
 545:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 548:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 54f:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 552:	8d 41 01             	lea    0x1(%ecx),%eax
 555:	89 45 f4             	mov    %eax,-0xc(%ebp)
 558:	8b 5d 10             	mov    0x10(%ebp),%ebx
 55b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 55e:	ba 00 00 00 00       	mov    $0x0,%edx
 563:	f7 f3                	div    %ebx
 565:	89 d0                	mov    %edx,%eax
 567:	0f b6 80 60 0c 00 00 	movzbl 0xc60(%eax),%eax
 56e:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 572:	8b 75 10             	mov    0x10(%ebp),%esi
 575:	8b 45 ec             	mov    -0x14(%ebp),%eax
 578:	ba 00 00 00 00       	mov    $0x0,%edx
 57d:	f7 f6                	div    %esi
 57f:	89 45 ec             	mov    %eax,-0x14(%ebp)
 582:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 586:	75 c7                	jne    54f <printint+0x39>
  if(neg)
 588:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 58c:	74 10                	je     59e <printint+0x88>
    buf[i++] = '-';
 58e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 591:	8d 50 01             	lea    0x1(%eax),%edx
 594:	89 55 f4             	mov    %edx,-0xc(%ebp)
 597:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 59c:	eb 1f                	jmp    5bd <printint+0xa7>
 59e:	eb 1d                	jmp    5bd <printint+0xa7>
    putc(fd, buf[i]);
 5a0:	8d 55 dc             	lea    -0x24(%ebp),%edx
 5a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5a6:	01 d0                	add    %edx,%eax
 5a8:	0f b6 00             	movzbl (%eax),%eax
 5ab:	0f be c0             	movsbl %al,%eax
 5ae:	89 44 24 04          	mov    %eax,0x4(%esp)
 5b2:	8b 45 08             	mov    0x8(%ebp),%eax
 5b5:	89 04 24             	mov    %eax,(%esp)
 5b8:	e8 31 ff ff ff       	call   4ee <putc>
  while(--i >= 0)
 5bd:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 5c1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5c5:	79 d9                	jns    5a0 <printint+0x8a>
}
 5c7:	83 c4 30             	add    $0x30,%esp
 5ca:	5b                   	pop    %ebx
 5cb:	5e                   	pop    %esi
 5cc:	5d                   	pop    %ebp
 5cd:	c3                   	ret    

000005ce <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5ce:	55                   	push   %ebp
 5cf:	89 e5                	mov    %esp,%ebp
 5d1:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 5d4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 5db:	8d 45 0c             	lea    0xc(%ebp),%eax
 5de:	83 c0 04             	add    $0x4,%eax
 5e1:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 5e4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 5eb:	e9 7c 01 00 00       	jmp    76c <printf+0x19e>
    c = fmt[i] & 0xff;
 5f0:	8b 55 0c             	mov    0xc(%ebp),%edx
 5f3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5f6:	01 d0                	add    %edx,%eax
 5f8:	0f b6 00             	movzbl (%eax),%eax
 5fb:	0f be c0             	movsbl %al,%eax
 5fe:	25 ff 00 00 00       	and    $0xff,%eax
 603:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 606:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 60a:	75 2c                	jne    638 <printf+0x6a>
      if(c == '%'){
 60c:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 610:	75 0c                	jne    61e <printf+0x50>
        state = '%';
 612:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 619:	e9 4a 01 00 00       	jmp    768 <printf+0x19a>
      } else {
        putc(fd, c);
 61e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 621:	0f be c0             	movsbl %al,%eax
 624:	89 44 24 04          	mov    %eax,0x4(%esp)
 628:	8b 45 08             	mov    0x8(%ebp),%eax
 62b:	89 04 24             	mov    %eax,(%esp)
 62e:	e8 bb fe ff ff       	call   4ee <putc>
 633:	e9 30 01 00 00       	jmp    768 <printf+0x19a>
      }
    } else if(state == '%'){
 638:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 63c:	0f 85 26 01 00 00    	jne    768 <printf+0x19a>
      if(c == 'd'){
 642:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 646:	75 2d                	jne    675 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 648:	8b 45 e8             	mov    -0x18(%ebp),%eax
 64b:	8b 00                	mov    (%eax),%eax
 64d:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 654:	00 
 655:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 65c:	00 
 65d:	89 44 24 04          	mov    %eax,0x4(%esp)
 661:	8b 45 08             	mov    0x8(%ebp),%eax
 664:	89 04 24             	mov    %eax,(%esp)
 667:	e8 aa fe ff ff       	call   516 <printint>
        ap++;
 66c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 670:	e9 ec 00 00 00       	jmp    761 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 675:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 679:	74 06                	je     681 <printf+0xb3>
 67b:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 67f:	75 2d                	jne    6ae <printf+0xe0>
        printint(fd, *ap, 16, 0);
 681:	8b 45 e8             	mov    -0x18(%ebp),%eax
 684:	8b 00                	mov    (%eax),%eax
 686:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 68d:	00 
 68e:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 695:	00 
 696:	89 44 24 04          	mov    %eax,0x4(%esp)
 69a:	8b 45 08             	mov    0x8(%ebp),%eax
 69d:	89 04 24             	mov    %eax,(%esp)
 6a0:	e8 71 fe ff ff       	call   516 <printint>
        ap++;
 6a5:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6a9:	e9 b3 00 00 00       	jmp    761 <printf+0x193>
      } else if(c == 's'){
 6ae:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 6b2:	75 45                	jne    6f9 <printf+0x12b>
        s = (char*)*ap;
 6b4:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6b7:	8b 00                	mov    (%eax),%eax
 6b9:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 6bc:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 6c0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 6c4:	75 09                	jne    6cf <printf+0x101>
          s = "(null)";
 6c6:	c7 45 f4 d2 09 00 00 	movl   $0x9d2,-0xc(%ebp)
        while(*s != 0){
 6cd:	eb 1e                	jmp    6ed <printf+0x11f>
 6cf:	eb 1c                	jmp    6ed <printf+0x11f>
          putc(fd, *s);
 6d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6d4:	0f b6 00             	movzbl (%eax),%eax
 6d7:	0f be c0             	movsbl %al,%eax
 6da:	89 44 24 04          	mov    %eax,0x4(%esp)
 6de:	8b 45 08             	mov    0x8(%ebp),%eax
 6e1:	89 04 24             	mov    %eax,(%esp)
 6e4:	e8 05 fe ff ff       	call   4ee <putc>
          s++;
 6e9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 6ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6f0:	0f b6 00             	movzbl (%eax),%eax
 6f3:	84 c0                	test   %al,%al
 6f5:	75 da                	jne    6d1 <printf+0x103>
 6f7:	eb 68                	jmp    761 <printf+0x193>
        }
      } else if(c == 'c'){
 6f9:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 6fd:	75 1d                	jne    71c <printf+0x14e>
        putc(fd, *ap);
 6ff:	8b 45 e8             	mov    -0x18(%ebp),%eax
 702:	8b 00                	mov    (%eax),%eax
 704:	0f be c0             	movsbl %al,%eax
 707:	89 44 24 04          	mov    %eax,0x4(%esp)
 70b:	8b 45 08             	mov    0x8(%ebp),%eax
 70e:	89 04 24             	mov    %eax,(%esp)
 711:	e8 d8 fd ff ff       	call   4ee <putc>
        ap++;
 716:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 71a:	eb 45                	jmp    761 <printf+0x193>
      } else if(c == '%'){
 71c:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 720:	75 17                	jne    739 <printf+0x16b>
        putc(fd, c);
 722:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 725:	0f be c0             	movsbl %al,%eax
 728:	89 44 24 04          	mov    %eax,0x4(%esp)
 72c:	8b 45 08             	mov    0x8(%ebp),%eax
 72f:	89 04 24             	mov    %eax,(%esp)
 732:	e8 b7 fd ff ff       	call   4ee <putc>
 737:	eb 28                	jmp    761 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 739:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 740:	00 
 741:	8b 45 08             	mov    0x8(%ebp),%eax
 744:	89 04 24             	mov    %eax,(%esp)
 747:	e8 a2 fd ff ff       	call   4ee <putc>
        putc(fd, c);
 74c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 74f:	0f be c0             	movsbl %al,%eax
 752:	89 44 24 04          	mov    %eax,0x4(%esp)
 756:	8b 45 08             	mov    0x8(%ebp),%eax
 759:	89 04 24             	mov    %eax,(%esp)
 75c:	e8 8d fd ff ff       	call   4ee <putc>
      }
      state = 0;
 761:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 768:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 76c:	8b 55 0c             	mov    0xc(%ebp),%edx
 76f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 772:	01 d0                	add    %edx,%eax
 774:	0f b6 00             	movzbl (%eax),%eax
 777:	84 c0                	test   %al,%al
 779:	0f 85 71 fe ff ff    	jne    5f0 <printf+0x22>
    }
  }
}
 77f:	c9                   	leave  
 780:	c3                   	ret    

00000781 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 781:	55                   	push   %ebp
 782:	89 e5                	mov    %esp,%ebp
 784:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 787:	8b 45 08             	mov    0x8(%ebp),%eax
 78a:	83 e8 08             	sub    $0x8,%eax
 78d:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 790:	a1 88 0c 00 00       	mov    0xc88,%eax
 795:	89 45 fc             	mov    %eax,-0x4(%ebp)
 798:	eb 24                	jmp    7be <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 79a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 79d:	8b 00                	mov    (%eax),%eax
 79f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7a2:	77 12                	ja     7b6 <free+0x35>
 7a4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7a7:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7aa:	77 24                	ja     7d0 <free+0x4f>
 7ac:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7af:	8b 00                	mov    (%eax),%eax
 7b1:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7b4:	77 1a                	ja     7d0 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b9:	8b 00                	mov    (%eax),%eax
 7bb:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7be:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7c1:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7c4:	76 d4                	jbe    79a <free+0x19>
 7c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c9:	8b 00                	mov    (%eax),%eax
 7cb:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7ce:	76 ca                	jbe    79a <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7d0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7d3:	8b 40 04             	mov    0x4(%eax),%eax
 7d6:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7dd:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7e0:	01 c2                	add    %eax,%edx
 7e2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e5:	8b 00                	mov    (%eax),%eax
 7e7:	39 c2                	cmp    %eax,%edx
 7e9:	75 24                	jne    80f <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 7eb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7ee:	8b 50 04             	mov    0x4(%eax),%edx
 7f1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f4:	8b 00                	mov    (%eax),%eax
 7f6:	8b 40 04             	mov    0x4(%eax),%eax
 7f9:	01 c2                	add    %eax,%edx
 7fb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7fe:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 801:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804:	8b 00                	mov    (%eax),%eax
 806:	8b 10                	mov    (%eax),%edx
 808:	8b 45 f8             	mov    -0x8(%ebp),%eax
 80b:	89 10                	mov    %edx,(%eax)
 80d:	eb 0a                	jmp    819 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 80f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 812:	8b 10                	mov    (%eax),%edx
 814:	8b 45 f8             	mov    -0x8(%ebp),%eax
 817:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 819:	8b 45 fc             	mov    -0x4(%ebp),%eax
 81c:	8b 40 04             	mov    0x4(%eax),%eax
 81f:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 826:	8b 45 fc             	mov    -0x4(%ebp),%eax
 829:	01 d0                	add    %edx,%eax
 82b:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 82e:	75 20                	jne    850 <free+0xcf>
    p->s.size += bp->s.size;
 830:	8b 45 fc             	mov    -0x4(%ebp),%eax
 833:	8b 50 04             	mov    0x4(%eax),%edx
 836:	8b 45 f8             	mov    -0x8(%ebp),%eax
 839:	8b 40 04             	mov    0x4(%eax),%eax
 83c:	01 c2                	add    %eax,%edx
 83e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 841:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 844:	8b 45 f8             	mov    -0x8(%ebp),%eax
 847:	8b 10                	mov    (%eax),%edx
 849:	8b 45 fc             	mov    -0x4(%ebp),%eax
 84c:	89 10                	mov    %edx,(%eax)
 84e:	eb 08                	jmp    858 <free+0xd7>
  } else
    p->s.ptr = bp;
 850:	8b 45 fc             	mov    -0x4(%ebp),%eax
 853:	8b 55 f8             	mov    -0x8(%ebp),%edx
 856:	89 10                	mov    %edx,(%eax)
  freep = p;
 858:	8b 45 fc             	mov    -0x4(%ebp),%eax
 85b:	a3 88 0c 00 00       	mov    %eax,0xc88
}
 860:	c9                   	leave  
 861:	c3                   	ret    

00000862 <morecore>:

static Header*
morecore(uint nu)
{
 862:	55                   	push   %ebp
 863:	89 e5                	mov    %esp,%ebp
 865:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 868:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 86f:	77 07                	ja     878 <morecore+0x16>
    nu = 4096;
 871:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 878:	8b 45 08             	mov    0x8(%ebp),%eax
 87b:	c1 e0 03             	shl    $0x3,%eax
 87e:	89 04 24             	mov    %eax,(%esp)
 881:	e8 48 fc ff ff       	call   4ce <sbrk>
 886:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 889:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 88d:	75 07                	jne    896 <morecore+0x34>
    return 0;
 88f:	b8 00 00 00 00       	mov    $0x0,%eax
 894:	eb 22                	jmp    8b8 <morecore+0x56>
  hp = (Header*)p;
 896:	8b 45 f4             	mov    -0xc(%ebp),%eax
 899:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 89c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 89f:	8b 55 08             	mov    0x8(%ebp),%edx
 8a2:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 8a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8a8:	83 c0 08             	add    $0x8,%eax
 8ab:	89 04 24             	mov    %eax,(%esp)
 8ae:	e8 ce fe ff ff       	call   781 <free>
  return freep;
 8b3:	a1 88 0c 00 00       	mov    0xc88,%eax
}
 8b8:	c9                   	leave  
 8b9:	c3                   	ret    

000008ba <malloc>:

void*
malloc(uint nbytes)
{
 8ba:	55                   	push   %ebp
 8bb:	89 e5                	mov    %esp,%ebp
 8bd:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8c0:	8b 45 08             	mov    0x8(%ebp),%eax
 8c3:	83 c0 07             	add    $0x7,%eax
 8c6:	c1 e8 03             	shr    $0x3,%eax
 8c9:	83 c0 01             	add    $0x1,%eax
 8cc:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 8cf:	a1 88 0c 00 00       	mov    0xc88,%eax
 8d4:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8d7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8db:	75 23                	jne    900 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 8dd:	c7 45 f0 80 0c 00 00 	movl   $0xc80,-0x10(%ebp)
 8e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8e7:	a3 88 0c 00 00       	mov    %eax,0xc88
 8ec:	a1 88 0c 00 00       	mov    0xc88,%eax
 8f1:	a3 80 0c 00 00       	mov    %eax,0xc80
    base.s.size = 0;
 8f6:	c7 05 84 0c 00 00 00 	movl   $0x0,0xc84
 8fd:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 900:	8b 45 f0             	mov    -0x10(%ebp),%eax
 903:	8b 00                	mov    (%eax),%eax
 905:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 908:	8b 45 f4             	mov    -0xc(%ebp),%eax
 90b:	8b 40 04             	mov    0x4(%eax),%eax
 90e:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 911:	72 4d                	jb     960 <malloc+0xa6>
      if(p->s.size == nunits)
 913:	8b 45 f4             	mov    -0xc(%ebp),%eax
 916:	8b 40 04             	mov    0x4(%eax),%eax
 919:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 91c:	75 0c                	jne    92a <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 91e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 921:	8b 10                	mov    (%eax),%edx
 923:	8b 45 f0             	mov    -0x10(%ebp),%eax
 926:	89 10                	mov    %edx,(%eax)
 928:	eb 26                	jmp    950 <malloc+0x96>
      else {
        p->s.size -= nunits;
 92a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 92d:	8b 40 04             	mov    0x4(%eax),%eax
 930:	2b 45 ec             	sub    -0x14(%ebp),%eax
 933:	89 c2                	mov    %eax,%edx
 935:	8b 45 f4             	mov    -0xc(%ebp),%eax
 938:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 93b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 93e:	8b 40 04             	mov    0x4(%eax),%eax
 941:	c1 e0 03             	shl    $0x3,%eax
 944:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 947:	8b 45 f4             	mov    -0xc(%ebp),%eax
 94a:	8b 55 ec             	mov    -0x14(%ebp),%edx
 94d:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 950:	8b 45 f0             	mov    -0x10(%ebp),%eax
 953:	a3 88 0c 00 00       	mov    %eax,0xc88
      return (void*)(p + 1);
 958:	8b 45 f4             	mov    -0xc(%ebp),%eax
 95b:	83 c0 08             	add    $0x8,%eax
 95e:	eb 38                	jmp    998 <malloc+0xde>
    }
    if(p == freep)
 960:	a1 88 0c 00 00       	mov    0xc88,%eax
 965:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 968:	75 1b                	jne    985 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 96a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 96d:	89 04 24             	mov    %eax,(%esp)
 970:	e8 ed fe ff ff       	call   862 <morecore>
 975:	89 45 f4             	mov    %eax,-0xc(%ebp)
 978:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 97c:	75 07                	jne    985 <malloc+0xcb>
        return 0;
 97e:	b8 00 00 00 00       	mov    $0x0,%eax
 983:	eb 13                	jmp    998 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 985:	8b 45 f4             	mov    -0xc(%ebp),%eax
 988:	89 45 f0             	mov    %eax,-0x10(%ebp)
 98b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 98e:	8b 00                	mov    (%eax),%eax
 990:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 993:	e9 70 ff ff ff       	jmp    908 <malloc+0x4e>
}
 998:	c9                   	leave  
 999:	c3                   	ret    
