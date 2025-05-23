
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
  1f:	b8 9d 09 00 00       	mov    $0x99d,%eax
  24:	eb 05                	jmp    2b <main+0x2b>
  26:	b8 9f 09 00 00       	mov    $0x99f,%eax
  2b:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  2f:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
  36:	8b 55 0c             	mov    0xc(%ebp),%edx
  39:	01 ca                	add    %ecx,%edx
  3b:	8b 12                	mov    (%edx),%edx
  3d:	89 44 24 0c          	mov    %eax,0xc(%esp)
  41:	89 54 24 08          	mov    %edx,0x8(%esp)
  45:	c7 44 24 04 a1 09 00 	movl   $0x9a1,0x4(%esp)
  4c:	00 
  4d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  54:	e8 78 05 00 00       	call   5d1 <printf>
  for(i = 1; i < argc; i++)
  59:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
  5e:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  62:	3b 45 08             	cmp    0x8(%ebp),%eax
  65:	7c ac                	jl     13 <main+0x13>
  exit();
  67:	e8 d5 03 00 00       	call   441 <exit>

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
#include "user.h"
#include "x86.h"
#include "param.h"
#include "pstat.h"

void ps(){
  91:	55                   	push   %ebp
  92:	89 e5                	mov    %esp,%ebp
  94:	57                   	push   %edi
  95:	56                   	push   %esi
  96:	53                   	push   %ebx
  97:	81 ec 2c 09 00 00    	sub    $0x92c,%esp
  
  //pstatTable pst = malloc(NPROC * sizeof(pstat_t));
  pstat_t pst[NPROC];
  getpinfo(&pst);
  9d:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
  a3:	89 04 24             	mov    %eax,(%esp)
  a6:	e8 36 04 00 00       	call   4e1 <getpinfo>
  int i;
  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
  ab:	c7 44 24 04 a6 09 00 	movl   $0x9a6,0x4(%esp)
  b2:	00 
  b3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  ba:	e8 12 05 00 00       	call   5d1 <printf>
  for (i = 0; i < NPROC; i++){
  bf:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  c6:	e9 1e 01 00 00       	jmp    1e9 <ps+0x158>
    if (pst[i].inuse == 1){
  cb:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  ce:	89 d0                	mov    %edx,%eax
  d0:	c1 e0 03             	shl    $0x3,%eax
  d3:	01 d0                	add    %edx,%eax
  d5:	c1 e0 02             	shl    $0x2,%eax
  d8:	8d 5d e8             	lea    -0x18(%ebp),%ebx
  db:	01 d8                	add    %ebx,%eax
  dd:	2d 04 09 00 00       	sub    $0x904,%eax
  e2:	8b 00                	mov    (%eax),%eax
  e4:	83 f8 01             	cmp    $0x1,%eax
  e7:	0f 85 f8 00 00 00    	jne    1e5 <ps+0x154>
      printf(1, "%d\t", pst[i].pid);
  ed:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  f0:	89 d0                	mov    %edx,%eax
  f2:	c1 e0 03             	shl    $0x3,%eax
  f5:	01 d0                	add    %edx,%eax
  f7:	c1 e0 02             	shl    $0x2,%eax
  fa:	8d 75 e8             	lea    -0x18(%ebp),%esi
  fd:	01 f0                	add    %esi,%eax
  ff:	2d fc 08 00 00       	sub    $0x8fc,%eax
 104:	8b 00                	mov    (%eax),%eax
 106:	89 44 24 08          	mov    %eax,0x8(%esp)
 10a:	c7 44 24 04 bf 09 00 	movl   $0x9bf,0x4(%esp)
 111:	00 
 112:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 119:	e8 b3 04 00 00       	call   5d1 <printf>
      printf(1, "%d\t", pst[i].tickets);
 11e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 121:	89 d0                	mov    %edx,%eax
 123:	c1 e0 03             	shl    $0x3,%eax
 126:	01 d0                	add    %edx,%eax
 128:	c1 e0 02             	shl    $0x2,%eax
 12b:	8d 7d e8             	lea    -0x18(%ebp),%edi
 12e:	01 f8                	add    %edi,%eax
 130:	2d 00 09 00 00       	sub    $0x900,%eax
 135:	8b 00                	mov    (%eax),%eax
 137:	89 44 24 08          	mov    %eax,0x8(%esp)
 13b:	c7 44 24 04 bf 09 00 	movl   $0x9bf,0x4(%esp)
 142:	00 
 143:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 14a:	e8 82 04 00 00       	call   5d1 <printf>
      printf(1, "%d\t", pst[i].ticks);
 14f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 152:	89 d0                	mov    %edx,%eax
 154:	c1 e0 03             	shl    $0x3,%eax
 157:	01 d0                	add    %edx,%eax
 159:	c1 e0 02             	shl    $0x2,%eax
 15c:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 15f:	01 c8                	add    %ecx,%eax
 161:	2d f8 08 00 00       	sub    $0x8f8,%eax
 166:	8b 00                	mov    (%eax),%eax
 168:	89 44 24 08          	mov    %eax,0x8(%esp)
 16c:	c7 44 24 04 bf 09 00 	movl   $0x9bf,0x4(%esp)
 173:	00 
 174:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 17b:	e8 51 04 00 00       	call   5d1 <printf>
      printf(1, "%c\t", pst[i].state);
 180:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 183:	89 d0                	mov    %edx,%eax
 185:	c1 e0 03             	shl    $0x3,%eax
 188:	01 d0                	add    %edx,%eax
 18a:	c1 e0 02             	shl    $0x2,%eax
 18d:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 190:	01 d8                	add    %ebx,%eax
 192:	2d e4 08 00 00       	sub    $0x8e4,%eax
 197:	0f b6 00             	movzbl (%eax),%eax
 19a:	0f be c0             	movsbl %al,%eax
 19d:	89 44 24 08          	mov    %eax,0x8(%esp)
 1a1:	c7 44 24 04 c3 09 00 	movl   $0x9c3,0x4(%esp)
 1a8:	00 
 1a9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1b0:	e8 1c 04 00 00       	call   5d1 <printf>
      printf(1, "%s\t\n", pst[i].name);
 1b5:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 1bb:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 1be:	89 d0                	mov    %edx,%eax
 1c0:	c1 e0 03             	shl    $0x3,%eax
 1c3:	01 d0                	add    %edx,%eax
 1c5:	c1 e0 02             	shl    $0x2,%eax
 1c8:	83 c0 10             	add    $0x10,%eax
 1cb:	01 c8                	add    %ecx,%eax
 1cd:	89 44 24 08          	mov    %eax,0x8(%esp)
 1d1:	c7 44 24 04 c7 09 00 	movl   $0x9c7,0x4(%esp)
 1d8:	00 
 1d9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1e0:	e8 ec 03 00 00       	call   5d1 <printf>
  for (i = 0; i < NPROC; i++){
 1e5:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 1e9:	83 7d e4 3f          	cmpl   $0x3f,-0x1c(%ebp)
 1ed:	0f 8e d8 fe ff ff    	jle    cb <ps+0x3a>
    }
  }
}
 1f3:	81 c4 2c 09 00 00    	add    $0x92c,%esp
 1f9:	5b                   	pop    %ebx
 1fa:	5e                   	pop    %esi
 1fb:	5f                   	pop    %edi
 1fc:	5d                   	pop    %ebp
 1fd:	c3                   	ret    

000001fe <strcpy>:

char*
strcpy(char *s, const char *t)
{
 1fe:	55                   	push   %ebp
 1ff:	89 e5                	mov    %esp,%ebp
 201:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 204:	8b 45 08             	mov    0x8(%ebp),%eax
 207:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 20a:	90                   	nop
 20b:	8b 45 08             	mov    0x8(%ebp),%eax
 20e:	8d 50 01             	lea    0x1(%eax),%edx
 211:	89 55 08             	mov    %edx,0x8(%ebp)
 214:	8b 55 0c             	mov    0xc(%ebp),%edx
 217:	8d 4a 01             	lea    0x1(%edx),%ecx
 21a:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 21d:	0f b6 12             	movzbl (%edx),%edx
 220:	88 10                	mov    %dl,(%eax)
 222:	0f b6 00             	movzbl (%eax),%eax
 225:	84 c0                	test   %al,%al
 227:	75 e2                	jne    20b <strcpy+0xd>
    ;
  return os;
 229:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 22c:	c9                   	leave  
 22d:	c3                   	ret    

0000022e <strcmp>:

int
strcmp(const char *p, const char *q)
{
 22e:	55                   	push   %ebp
 22f:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 231:	eb 08                	jmp    23b <strcmp+0xd>
    p++, q++;
 233:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 237:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 23b:	8b 45 08             	mov    0x8(%ebp),%eax
 23e:	0f b6 00             	movzbl (%eax),%eax
 241:	84 c0                	test   %al,%al
 243:	74 10                	je     255 <strcmp+0x27>
 245:	8b 45 08             	mov    0x8(%ebp),%eax
 248:	0f b6 10             	movzbl (%eax),%edx
 24b:	8b 45 0c             	mov    0xc(%ebp),%eax
 24e:	0f b6 00             	movzbl (%eax),%eax
 251:	38 c2                	cmp    %al,%dl
 253:	74 de                	je     233 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 255:	8b 45 08             	mov    0x8(%ebp),%eax
 258:	0f b6 00             	movzbl (%eax),%eax
 25b:	0f b6 d0             	movzbl %al,%edx
 25e:	8b 45 0c             	mov    0xc(%ebp),%eax
 261:	0f b6 00             	movzbl (%eax),%eax
 264:	0f b6 c0             	movzbl %al,%eax
 267:	29 c2                	sub    %eax,%edx
 269:	89 d0                	mov    %edx,%eax
}
 26b:	5d                   	pop    %ebp
 26c:	c3                   	ret    

0000026d <strlen>:

uint
strlen(const char *s)
{
 26d:	55                   	push   %ebp
 26e:	89 e5                	mov    %esp,%ebp
 270:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 273:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 27a:	eb 04                	jmp    280 <strlen+0x13>
 27c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 280:	8b 55 fc             	mov    -0x4(%ebp),%edx
 283:	8b 45 08             	mov    0x8(%ebp),%eax
 286:	01 d0                	add    %edx,%eax
 288:	0f b6 00             	movzbl (%eax),%eax
 28b:	84 c0                	test   %al,%al
 28d:	75 ed                	jne    27c <strlen+0xf>
    ;
  return n;
 28f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 292:	c9                   	leave  
 293:	c3                   	ret    

00000294 <memset>:

void*
memset(void *dst, int c, uint n)
{
 294:	55                   	push   %ebp
 295:	89 e5                	mov    %esp,%ebp
 297:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 29a:	8b 45 10             	mov    0x10(%ebp),%eax
 29d:	89 44 24 08          	mov    %eax,0x8(%esp)
 2a1:	8b 45 0c             	mov    0xc(%ebp),%eax
 2a4:	89 44 24 04          	mov    %eax,0x4(%esp)
 2a8:	8b 45 08             	mov    0x8(%ebp),%eax
 2ab:	89 04 24             	mov    %eax,(%esp)
 2ae:	e8 b9 fd ff ff       	call   6c <stosb>
  return dst;
 2b3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2b6:	c9                   	leave  
 2b7:	c3                   	ret    

000002b8 <strchr>:

char*
strchr(const char *s, char c)
{
 2b8:	55                   	push   %ebp
 2b9:	89 e5                	mov    %esp,%ebp
 2bb:	83 ec 04             	sub    $0x4,%esp
 2be:	8b 45 0c             	mov    0xc(%ebp),%eax
 2c1:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 2c4:	eb 14                	jmp    2da <strchr+0x22>
    if(*s == c)
 2c6:	8b 45 08             	mov    0x8(%ebp),%eax
 2c9:	0f b6 00             	movzbl (%eax),%eax
 2cc:	3a 45 fc             	cmp    -0x4(%ebp),%al
 2cf:	75 05                	jne    2d6 <strchr+0x1e>
      return (char*)s;
 2d1:	8b 45 08             	mov    0x8(%ebp),%eax
 2d4:	eb 13                	jmp    2e9 <strchr+0x31>
  for(; *s; s++)
 2d6:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2da:	8b 45 08             	mov    0x8(%ebp),%eax
 2dd:	0f b6 00             	movzbl (%eax),%eax
 2e0:	84 c0                	test   %al,%al
 2e2:	75 e2                	jne    2c6 <strchr+0xe>
  return 0;
 2e4:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2e9:	c9                   	leave  
 2ea:	c3                   	ret    

000002eb <gets>:

char*
gets(char *buf, int max)
{
 2eb:	55                   	push   %ebp
 2ec:	89 e5                	mov    %esp,%ebp
 2ee:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2f1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 2f8:	eb 4c                	jmp    346 <gets+0x5b>
    cc = read(0, &c, 1);
 2fa:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 301:	00 
 302:	8d 45 ef             	lea    -0x11(%ebp),%eax
 305:	89 44 24 04          	mov    %eax,0x4(%esp)
 309:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 310:	e8 44 01 00 00       	call   459 <read>
 315:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 318:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 31c:	7f 02                	jg     320 <gets+0x35>
      break;
 31e:	eb 31                	jmp    351 <gets+0x66>
    buf[i++] = c;
 320:	8b 45 f4             	mov    -0xc(%ebp),%eax
 323:	8d 50 01             	lea    0x1(%eax),%edx
 326:	89 55 f4             	mov    %edx,-0xc(%ebp)
 329:	89 c2                	mov    %eax,%edx
 32b:	8b 45 08             	mov    0x8(%ebp),%eax
 32e:	01 c2                	add    %eax,%edx
 330:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 334:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 336:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 33a:	3c 0a                	cmp    $0xa,%al
 33c:	74 13                	je     351 <gets+0x66>
 33e:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 342:	3c 0d                	cmp    $0xd,%al
 344:	74 0b                	je     351 <gets+0x66>
  for(i=0; i+1 < max; ){
 346:	8b 45 f4             	mov    -0xc(%ebp),%eax
 349:	83 c0 01             	add    $0x1,%eax
 34c:	3b 45 0c             	cmp    0xc(%ebp),%eax
 34f:	7c a9                	jl     2fa <gets+0xf>
      break;
  }
  buf[i] = '\0';
 351:	8b 55 f4             	mov    -0xc(%ebp),%edx
 354:	8b 45 08             	mov    0x8(%ebp),%eax
 357:	01 d0                	add    %edx,%eax
 359:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 35c:	8b 45 08             	mov    0x8(%ebp),%eax
}
 35f:	c9                   	leave  
 360:	c3                   	ret    

00000361 <stat>:

int
stat(const char *n, struct stat *st)
{
 361:	55                   	push   %ebp
 362:	89 e5                	mov    %esp,%ebp
 364:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 367:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 36e:	00 
 36f:	8b 45 08             	mov    0x8(%ebp),%eax
 372:	89 04 24             	mov    %eax,(%esp)
 375:	e8 07 01 00 00       	call   481 <open>
 37a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 37d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 381:	79 07                	jns    38a <stat+0x29>
    return -1;
 383:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 388:	eb 23                	jmp    3ad <stat+0x4c>
  r = fstat(fd, st);
 38a:	8b 45 0c             	mov    0xc(%ebp),%eax
 38d:	89 44 24 04          	mov    %eax,0x4(%esp)
 391:	8b 45 f4             	mov    -0xc(%ebp),%eax
 394:	89 04 24             	mov    %eax,(%esp)
 397:	e8 fd 00 00 00       	call   499 <fstat>
 39c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 39f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3a2:	89 04 24             	mov    %eax,(%esp)
 3a5:	e8 bf 00 00 00       	call   469 <close>
  return r;
 3aa:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 3ad:	c9                   	leave  
 3ae:	c3                   	ret    

000003af <atoi>:

int
atoi(const char *s)
{
 3af:	55                   	push   %ebp
 3b0:	89 e5                	mov    %esp,%ebp
 3b2:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 3b5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 3bc:	eb 25                	jmp    3e3 <atoi+0x34>
    n = n*10 + *s++ - '0';
 3be:	8b 55 fc             	mov    -0x4(%ebp),%edx
 3c1:	89 d0                	mov    %edx,%eax
 3c3:	c1 e0 02             	shl    $0x2,%eax
 3c6:	01 d0                	add    %edx,%eax
 3c8:	01 c0                	add    %eax,%eax
 3ca:	89 c1                	mov    %eax,%ecx
 3cc:	8b 45 08             	mov    0x8(%ebp),%eax
 3cf:	8d 50 01             	lea    0x1(%eax),%edx
 3d2:	89 55 08             	mov    %edx,0x8(%ebp)
 3d5:	0f b6 00             	movzbl (%eax),%eax
 3d8:	0f be c0             	movsbl %al,%eax
 3db:	01 c8                	add    %ecx,%eax
 3dd:	83 e8 30             	sub    $0x30,%eax
 3e0:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 3e3:	8b 45 08             	mov    0x8(%ebp),%eax
 3e6:	0f b6 00             	movzbl (%eax),%eax
 3e9:	3c 2f                	cmp    $0x2f,%al
 3eb:	7e 0a                	jle    3f7 <atoi+0x48>
 3ed:	8b 45 08             	mov    0x8(%ebp),%eax
 3f0:	0f b6 00             	movzbl (%eax),%eax
 3f3:	3c 39                	cmp    $0x39,%al
 3f5:	7e c7                	jle    3be <atoi+0xf>
  return n;
 3f7:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3fa:	c9                   	leave  
 3fb:	c3                   	ret    

000003fc <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3fc:	55                   	push   %ebp
 3fd:	89 e5                	mov    %esp,%ebp
 3ff:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 402:	8b 45 08             	mov    0x8(%ebp),%eax
 405:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 408:	8b 45 0c             	mov    0xc(%ebp),%eax
 40b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 40e:	eb 17                	jmp    427 <memmove+0x2b>
    *dst++ = *src++;
 410:	8b 45 fc             	mov    -0x4(%ebp),%eax
 413:	8d 50 01             	lea    0x1(%eax),%edx
 416:	89 55 fc             	mov    %edx,-0x4(%ebp)
 419:	8b 55 f8             	mov    -0x8(%ebp),%edx
 41c:	8d 4a 01             	lea    0x1(%edx),%ecx
 41f:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 422:	0f b6 12             	movzbl (%edx),%edx
 425:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 427:	8b 45 10             	mov    0x10(%ebp),%eax
 42a:	8d 50 ff             	lea    -0x1(%eax),%edx
 42d:	89 55 10             	mov    %edx,0x10(%ebp)
 430:	85 c0                	test   %eax,%eax
 432:	7f dc                	jg     410 <memmove+0x14>
  return vdst;
 434:	8b 45 08             	mov    0x8(%ebp),%eax
}
 437:	c9                   	leave  
 438:	c3                   	ret    

00000439 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 439:	b8 01 00 00 00       	mov    $0x1,%eax
 43e:	cd 40                	int    $0x40
 440:	c3                   	ret    

00000441 <exit>:
SYSCALL(exit)
 441:	b8 02 00 00 00       	mov    $0x2,%eax
 446:	cd 40                	int    $0x40
 448:	c3                   	ret    

00000449 <wait>:
SYSCALL(wait)
 449:	b8 03 00 00 00       	mov    $0x3,%eax
 44e:	cd 40                	int    $0x40
 450:	c3                   	ret    

00000451 <pipe>:
SYSCALL(pipe)
 451:	b8 04 00 00 00       	mov    $0x4,%eax
 456:	cd 40                	int    $0x40
 458:	c3                   	ret    

00000459 <read>:
SYSCALL(read)
 459:	b8 05 00 00 00       	mov    $0x5,%eax
 45e:	cd 40                	int    $0x40
 460:	c3                   	ret    

00000461 <write>:
SYSCALL(write)
 461:	b8 10 00 00 00       	mov    $0x10,%eax
 466:	cd 40                	int    $0x40
 468:	c3                   	ret    

00000469 <close>:
SYSCALL(close)
 469:	b8 15 00 00 00       	mov    $0x15,%eax
 46e:	cd 40                	int    $0x40
 470:	c3                   	ret    

00000471 <kill>:
SYSCALL(kill)
 471:	b8 06 00 00 00       	mov    $0x6,%eax
 476:	cd 40                	int    $0x40
 478:	c3                   	ret    

00000479 <exec>:
SYSCALL(exec)
 479:	b8 07 00 00 00       	mov    $0x7,%eax
 47e:	cd 40                	int    $0x40
 480:	c3                   	ret    

00000481 <open>:
SYSCALL(open)
 481:	b8 0f 00 00 00       	mov    $0xf,%eax
 486:	cd 40                	int    $0x40
 488:	c3                   	ret    

00000489 <mknod>:
SYSCALL(mknod)
 489:	b8 11 00 00 00       	mov    $0x11,%eax
 48e:	cd 40                	int    $0x40
 490:	c3                   	ret    

00000491 <unlink>:
SYSCALL(unlink)
 491:	b8 12 00 00 00       	mov    $0x12,%eax
 496:	cd 40                	int    $0x40
 498:	c3                   	ret    

00000499 <fstat>:
SYSCALL(fstat)
 499:	b8 08 00 00 00       	mov    $0x8,%eax
 49e:	cd 40                	int    $0x40
 4a0:	c3                   	ret    

000004a1 <link>:
SYSCALL(link)
 4a1:	b8 13 00 00 00       	mov    $0x13,%eax
 4a6:	cd 40                	int    $0x40
 4a8:	c3                   	ret    

000004a9 <mkdir>:
SYSCALL(mkdir)
 4a9:	b8 14 00 00 00       	mov    $0x14,%eax
 4ae:	cd 40                	int    $0x40
 4b0:	c3                   	ret    

000004b1 <chdir>:
SYSCALL(chdir)
 4b1:	b8 09 00 00 00       	mov    $0x9,%eax
 4b6:	cd 40                	int    $0x40
 4b8:	c3                   	ret    

000004b9 <dup>:
SYSCALL(dup)
 4b9:	b8 0a 00 00 00       	mov    $0xa,%eax
 4be:	cd 40                	int    $0x40
 4c0:	c3                   	ret    

000004c1 <getpid>:
SYSCALL(getpid)
 4c1:	b8 0b 00 00 00       	mov    $0xb,%eax
 4c6:	cd 40                	int    $0x40
 4c8:	c3                   	ret    

000004c9 <sbrk>:
SYSCALL(sbrk)
 4c9:	b8 0c 00 00 00       	mov    $0xc,%eax
 4ce:	cd 40                	int    $0x40
 4d0:	c3                   	ret    

000004d1 <sleep>:
SYSCALL(sleep)
 4d1:	b8 0d 00 00 00       	mov    $0xd,%eax
 4d6:	cd 40                	int    $0x40
 4d8:	c3                   	ret    

000004d9 <uptime>:
SYSCALL(uptime)
 4d9:	b8 0e 00 00 00       	mov    $0xe,%eax
 4de:	cd 40                	int    $0x40
 4e0:	c3                   	ret    

000004e1 <getpinfo>:
SYSCALL(getpinfo)
 4e1:	b8 16 00 00 00       	mov    $0x16,%eax
 4e6:	cd 40                	int    $0x40
 4e8:	c3                   	ret    

000004e9 <settickets>:
SYSCALL(settickets)
 4e9:	b8 17 00 00 00       	mov    $0x17,%eax
 4ee:	cd 40                	int    $0x40
 4f0:	c3                   	ret    

000004f1 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4f1:	55                   	push   %ebp
 4f2:	89 e5                	mov    %esp,%ebp
 4f4:	83 ec 18             	sub    $0x18,%esp
 4f7:	8b 45 0c             	mov    0xc(%ebp),%eax
 4fa:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 4fd:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 504:	00 
 505:	8d 45 f4             	lea    -0xc(%ebp),%eax
 508:	89 44 24 04          	mov    %eax,0x4(%esp)
 50c:	8b 45 08             	mov    0x8(%ebp),%eax
 50f:	89 04 24             	mov    %eax,(%esp)
 512:	e8 4a ff ff ff       	call   461 <write>
}
 517:	c9                   	leave  
 518:	c3                   	ret    

00000519 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 519:	55                   	push   %ebp
 51a:	89 e5                	mov    %esp,%ebp
 51c:	56                   	push   %esi
 51d:	53                   	push   %ebx
 51e:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 521:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 528:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 52c:	74 17                	je     545 <printint+0x2c>
 52e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 532:	79 11                	jns    545 <printint+0x2c>
    neg = 1;
 534:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 53b:	8b 45 0c             	mov    0xc(%ebp),%eax
 53e:	f7 d8                	neg    %eax
 540:	89 45 ec             	mov    %eax,-0x14(%ebp)
 543:	eb 06                	jmp    54b <printint+0x32>
  } else {
    x = xx;
 545:	8b 45 0c             	mov    0xc(%ebp),%eax
 548:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 54b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 552:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 555:	8d 41 01             	lea    0x1(%ecx),%eax
 558:	89 45 f4             	mov    %eax,-0xc(%ebp)
 55b:	8b 5d 10             	mov    0x10(%ebp),%ebx
 55e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 561:	ba 00 00 00 00       	mov    $0x0,%edx
 566:	f7 f3                	div    %ebx
 568:	89 d0                	mov    %edx,%eax
 56a:	0f b6 80 48 0c 00 00 	movzbl 0xc48(%eax),%eax
 571:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 575:	8b 75 10             	mov    0x10(%ebp),%esi
 578:	8b 45 ec             	mov    -0x14(%ebp),%eax
 57b:	ba 00 00 00 00       	mov    $0x0,%edx
 580:	f7 f6                	div    %esi
 582:	89 45 ec             	mov    %eax,-0x14(%ebp)
 585:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 589:	75 c7                	jne    552 <printint+0x39>
  if(neg)
 58b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 58f:	74 10                	je     5a1 <printint+0x88>
    buf[i++] = '-';
 591:	8b 45 f4             	mov    -0xc(%ebp),%eax
 594:	8d 50 01             	lea    0x1(%eax),%edx
 597:	89 55 f4             	mov    %edx,-0xc(%ebp)
 59a:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 59f:	eb 1f                	jmp    5c0 <printint+0xa7>
 5a1:	eb 1d                	jmp    5c0 <printint+0xa7>
    putc(fd, buf[i]);
 5a3:	8d 55 dc             	lea    -0x24(%ebp),%edx
 5a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5a9:	01 d0                	add    %edx,%eax
 5ab:	0f b6 00             	movzbl (%eax),%eax
 5ae:	0f be c0             	movsbl %al,%eax
 5b1:	89 44 24 04          	mov    %eax,0x4(%esp)
 5b5:	8b 45 08             	mov    0x8(%ebp),%eax
 5b8:	89 04 24             	mov    %eax,(%esp)
 5bb:	e8 31 ff ff ff       	call   4f1 <putc>
  while(--i >= 0)
 5c0:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 5c4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5c8:	79 d9                	jns    5a3 <printint+0x8a>
}
 5ca:	83 c4 30             	add    $0x30,%esp
 5cd:	5b                   	pop    %ebx
 5ce:	5e                   	pop    %esi
 5cf:	5d                   	pop    %ebp
 5d0:	c3                   	ret    

000005d1 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5d1:	55                   	push   %ebp
 5d2:	89 e5                	mov    %esp,%ebp
 5d4:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 5d7:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 5de:	8d 45 0c             	lea    0xc(%ebp),%eax
 5e1:	83 c0 04             	add    $0x4,%eax
 5e4:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 5e7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 5ee:	e9 7c 01 00 00       	jmp    76f <printf+0x19e>
    c = fmt[i] & 0xff;
 5f3:	8b 55 0c             	mov    0xc(%ebp),%edx
 5f6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5f9:	01 d0                	add    %edx,%eax
 5fb:	0f b6 00             	movzbl (%eax),%eax
 5fe:	0f be c0             	movsbl %al,%eax
 601:	25 ff 00 00 00       	and    $0xff,%eax
 606:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 609:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 60d:	75 2c                	jne    63b <printf+0x6a>
      if(c == '%'){
 60f:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 613:	75 0c                	jne    621 <printf+0x50>
        state = '%';
 615:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 61c:	e9 4a 01 00 00       	jmp    76b <printf+0x19a>
      } else {
        putc(fd, c);
 621:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 624:	0f be c0             	movsbl %al,%eax
 627:	89 44 24 04          	mov    %eax,0x4(%esp)
 62b:	8b 45 08             	mov    0x8(%ebp),%eax
 62e:	89 04 24             	mov    %eax,(%esp)
 631:	e8 bb fe ff ff       	call   4f1 <putc>
 636:	e9 30 01 00 00       	jmp    76b <printf+0x19a>
      }
    } else if(state == '%'){
 63b:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 63f:	0f 85 26 01 00 00    	jne    76b <printf+0x19a>
      if(c == 'd'){
 645:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 649:	75 2d                	jne    678 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 64b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 64e:	8b 00                	mov    (%eax),%eax
 650:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 657:	00 
 658:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 65f:	00 
 660:	89 44 24 04          	mov    %eax,0x4(%esp)
 664:	8b 45 08             	mov    0x8(%ebp),%eax
 667:	89 04 24             	mov    %eax,(%esp)
 66a:	e8 aa fe ff ff       	call   519 <printint>
        ap++;
 66f:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 673:	e9 ec 00 00 00       	jmp    764 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 678:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 67c:	74 06                	je     684 <printf+0xb3>
 67e:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 682:	75 2d                	jne    6b1 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 684:	8b 45 e8             	mov    -0x18(%ebp),%eax
 687:	8b 00                	mov    (%eax),%eax
 689:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 690:	00 
 691:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 698:	00 
 699:	89 44 24 04          	mov    %eax,0x4(%esp)
 69d:	8b 45 08             	mov    0x8(%ebp),%eax
 6a0:	89 04 24             	mov    %eax,(%esp)
 6a3:	e8 71 fe ff ff       	call   519 <printint>
        ap++;
 6a8:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6ac:	e9 b3 00 00 00       	jmp    764 <printf+0x193>
      } else if(c == 's'){
 6b1:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 6b5:	75 45                	jne    6fc <printf+0x12b>
        s = (char*)*ap;
 6b7:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6ba:	8b 00                	mov    (%eax),%eax
 6bc:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 6bf:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 6c3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 6c7:	75 09                	jne    6d2 <printf+0x101>
          s = "(null)";
 6c9:	c7 45 f4 cc 09 00 00 	movl   $0x9cc,-0xc(%ebp)
        while(*s != 0){
 6d0:	eb 1e                	jmp    6f0 <printf+0x11f>
 6d2:	eb 1c                	jmp    6f0 <printf+0x11f>
          putc(fd, *s);
 6d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6d7:	0f b6 00             	movzbl (%eax),%eax
 6da:	0f be c0             	movsbl %al,%eax
 6dd:	89 44 24 04          	mov    %eax,0x4(%esp)
 6e1:	8b 45 08             	mov    0x8(%ebp),%eax
 6e4:	89 04 24             	mov    %eax,(%esp)
 6e7:	e8 05 fe ff ff       	call   4f1 <putc>
          s++;
 6ec:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 6f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6f3:	0f b6 00             	movzbl (%eax),%eax
 6f6:	84 c0                	test   %al,%al
 6f8:	75 da                	jne    6d4 <printf+0x103>
 6fa:	eb 68                	jmp    764 <printf+0x193>
        }
      } else if(c == 'c'){
 6fc:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 700:	75 1d                	jne    71f <printf+0x14e>
        putc(fd, *ap);
 702:	8b 45 e8             	mov    -0x18(%ebp),%eax
 705:	8b 00                	mov    (%eax),%eax
 707:	0f be c0             	movsbl %al,%eax
 70a:	89 44 24 04          	mov    %eax,0x4(%esp)
 70e:	8b 45 08             	mov    0x8(%ebp),%eax
 711:	89 04 24             	mov    %eax,(%esp)
 714:	e8 d8 fd ff ff       	call   4f1 <putc>
        ap++;
 719:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 71d:	eb 45                	jmp    764 <printf+0x193>
      } else if(c == '%'){
 71f:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 723:	75 17                	jne    73c <printf+0x16b>
        putc(fd, c);
 725:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 728:	0f be c0             	movsbl %al,%eax
 72b:	89 44 24 04          	mov    %eax,0x4(%esp)
 72f:	8b 45 08             	mov    0x8(%ebp),%eax
 732:	89 04 24             	mov    %eax,(%esp)
 735:	e8 b7 fd ff ff       	call   4f1 <putc>
 73a:	eb 28                	jmp    764 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 73c:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 743:	00 
 744:	8b 45 08             	mov    0x8(%ebp),%eax
 747:	89 04 24             	mov    %eax,(%esp)
 74a:	e8 a2 fd ff ff       	call   4f1 <putc>
        putc(fd, c);
 74f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 752:	0f be c0             	movsbl %al,%eax
 755:	89 44 24 04          	mov    %eax,0x4(%esp)
 759:	8b 45 08             	mov    0x8(%ebp),%eax
 75c:	89 04 24             	mov    %eax,(%esp)
 75f:	e8 8d fd ff ff       	call   4f1 <putc>
      }
      state = 0;
 764:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 76b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 76f:	8b 55 0c             	mov    0xc(%ebp),%edx
 772:	8b 45 f0             	mov    -0x10(%ebp),%eax
 775:	01 d0                	add    %edx,%eax
 777:	0f b6 00             	movzbl (%eax),%eax
 77a:	84 c0                	test   %al,%al
 77c:	0f 85 71 fe ff ff    	jne    5f3 <printf+0x22>
    }
  }
}
 782:	c9                   	leave  
 783:	c3                   	ret    

00000784 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 784:	55                   	push   %ebp
 785:	89 e5                	mov    %esp,%ebp
 787:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 78a:	8b 45 08             	mov    0x8(%ebp),%eax
 78d:	83 e8 08             	sub    $0x8,%eax
 790:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 793:	a1 64 0c 00 00       	mov    0xc64,%eax
 798:	89 45 fc             	mov    %eax,-0x4(%ebp)
 79b:	eb 24                	jmp    7c1 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 79d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a0:	8b 00                	mov    (%eax),%eax
 7a2:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7a5:	77 12                	ja     7b9 <free+0x35>
 7a7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7aa:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7ad:	77 24                	ja     7d3 <free+0x4f>
 7af:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b2:	8b 00                	mov    (%eax),%eax
 7b4:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7b7:	77 1a                	ja     7d3 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7b9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7bc:	8b 00                	mov    (%eax),%eax
 7be:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7c1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7c4:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7c7:	76 d4                	jbe    79d <free+0x19>
 7c9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7cc:	8b 00                	mov    (%eax),%eax
 7ce:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7d1:	76 ca                	jbe    79d <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7d3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7d6:	8b 40 04             	mov    0x4(%eax),%eax
 7d9:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7e0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7e3:	01 c2                	add    %eax,%edx
 7e5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e8:	8b 00                	mov    (%eax),%eax
 7ea:	39 c2                	cmp    %eax,%edx
 7ec:	75 24                	jne    812 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 7ee:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7f1:	8b 50 04             	mov    0x4(%eax),%edx
 7f4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f7:	8b 00                	mov    (%eax),%eax
 7f9:	8b 40 04             	mov    0x4(%eax),%eax
 7fc:	01 c2                	add    %eax,%edx
 7fe:	8b 45 f8             	mov    -0x8(%ebp),%eax
 801:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 804:	8b 45 fc             	mov    -0x4(%ebp),%eax
 807:	8b 00                	mov    (%eax),%eax
 809:	8b 10                	mov    (%eax),%edx
 80b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 80e:	89 10                	mov    %edx,(%eax)
 810:	eb 0a                	jmp    81c <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 812:	8b 45 fc             	mov    -0x4(%ebp),%eax
 815:	8b 10                	mov    (%eax),%edx
 817:	8b 45 f8             	mov    -0x8(%ebp),%eax
 81a:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 81c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 81f:	8b 40 04             	mov    0x4(%eax),%eax
 822:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 829:	8b 45 fc             	mov    -0x4(%ebp),%eax
 82c:	01 d0                	add    %edx,%eax
 82e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 831:	75 20                	jne    853 <free+0xcf>
    p->s.size += bp->s.size;
 833:	8b 45 fc             	mov    -0x4(%ebp),%eax
 836:	8b 50 04             	mov    0x4(%eax),%edx
 839:	8b 45 f8             	mov    -0x8(%ebp),%eax
 83c:	8b 40 04             	mov    0x4(%eax),%eax
 83f:	01 c2                	add    %eax,%edx
 841:	8b 45 fc             	mov    -0x4(%ebp),%eax
 844:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 847:	8b 45 f8             	mov    -0x8(%ebp),%eax
 84a:	8b 10                	mov    (%eax),%edx
 84c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 84f:	89 10                	mov    %edx,(%eax)
 851:	eb 08                	jmp    85b <free+0xd7>
  } else
    p->s.ptr = bp;
 853:	8b 45 fc             	mov    -0x4(%ebp),%eax
 856:	8b 55 f8             	mov    -0x8(%ebp),%edx
 859:	89 10                	mov    %edx,(%eax)
  freep = p;
 85b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 85e:	a3 64 0c 00 00       	mov    %eax,0xc64
}
 863:	c9                   	leave  
 864:	c3                   	ret    

00000865 <morecore>:

static Header*
morecore(uint nu)
{
 865:	55                   	push   %ebp
 866:	89 e5                	mov    %esp,%ebp
 868:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 86b:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 872:	77 07                	ja     87b <morecore+0x16>
    nu = 4096;
 874:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 87b:	8b 45 08             	mov    0x8(%ebp),%eax
 87e:	c1 e0 03             	shl    $0x3,%eax
 881:	89 04 24             	mov    %eax,(%esp)
 884:	e8 40 fc ff ff       	call   4c9 <sbrk>
 889:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 88c:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 890:	75 07                	jne    899 <morecore+0x34>
    return 0;
 892:	b8 00 00 00 00       	mov    $0x0,%eax
 897:	eb 22                	jmp    8bb <morecore+0x56>
  hp = (Header*)p;
 899:	8b 45 f4             	mov    -0xc(%ebp),%eax
 89c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 89f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8a2:	8b 55 08             	mov    0x8(%ebp),%edx
 8a5:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 8a8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8ab:	83 c0 08             	add    $0x8,%eax
 8ae:	89 04 24             	mov    %eax,(%esp)
 8b1:	e8 ce fe ff ff       	call   784 <free>
  return freep;
 8b6:	a1 64 0c 00 00       	mov    0xc64,%eax
}
 8bb:	c9                   	leave  
 8bc:	c3                   	ret    

000008bd <malloc>:

void*
malloc(uint nbytes)
{
 8bd:	55                   	push   %ebp
 8be:	89 e5                	mov    %esp,%ebp
 8c0:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8c3:	8b 45 08             	mov    0x8(%ebp),%eax
 8c6:	83 c0 07             	add    $0x7,%eax
 8c9:	c1 e8 03             	shr    $0x3,%eax
 8cc:	83 c0 01             	add    $0x1,%eax
 8cf:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 8d2:	a1 64 0c 00 00       	mov    0xc64,%eax
 8d7:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8da:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8de:	75 23                	jne    903 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 8e0:	c7 45 f0 5c 0c 00 00 	movl   $0xc5c,-0x10(%ebp)
 8e7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8ea:	a3 64 0c 00 00       	mov    %eax,0xc64
 8ef:	a1 64 0c 00 00       	mov    0xc64,%eax
 8f4:	a3 5c 0c 00 00       	mov    %eax,0xc5c
    base.s.size = 0;
 8f9:	c7 05 60 0c 00 00 00 	movl   $0x0,0xc60
 900:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 903:	8b 45 f0             	mov    -0x10(%ebp),%eax
 906:	8b 00                	mov    (%eax),%eax
 908:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 90b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 90e:	8b 40 04             	mov    0x4(%eax),%eax
 911:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 914:	72 4d                	jb     963 <malloc+0xa6>
      if(p->s.size == nunits)
 916:	8b 45 f4             	mov    -0xc(%ebp),%eax
 919:	8b 40 04             	mov    0x4(%eax),%eax
 91c:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 91f:	75 0c                	jne    92d <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 921:	8b 45 f4             	mov    -0xc(%ebp),%eax
 924:	8b 10                	mov    (%eax),%edx
 926:	8b 45 f0             	mov    -0x10(%ebp),%eax
 929:	89 10                	mov    %edx,(%eax)
 92b:	eb 26                	jmp    953 <malloc+0x96>
      else {
        p->s.size -= nunits;
 92d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 930:	8b 40 04             	mov    0x4(%eax),%eax
 933:	2b 45 ec             	sub    -0x14(%ebp),%eax
 936:	89 c2                	mov    %eax,%edx
 938:	8b 45 f4             	mov    -0xc(%ebp),%eax
 93b:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 93e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 941:	8b 40 04             	mov    0x4(%eax),%eax
 944:	c1 e0 03             	shl    $0x3,%eax
 947:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 94a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 94d:	8b 55 ec             	mov    -0x14(%ebp),%edx
 950:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 953:	8b 45 f0             	mov    -0x10(%ebp),%eax
 956:	a3 64 0c 00 00       	mov    %eax,0xc64
      return (void*)(p + 1);
 95b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 95e:	83 c0 08             	add    $0x8,%eax
 961:	eb 38                	jmp    99b <malloc+0xde>
    }
    if(p == freep)
 963:	a1 64 0c 00 00       	mov    0xc64,%eax
 968:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 96b:	75 1b                	jne    988 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 96d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 970:	89 04 24             	mov    %eax,(%esp)
 973:	e8 ed fe ff ff       	call   865 <morecore>
 978:	89 45 f4             	mov    %eax,-0xc(%ebp)
 97b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 97f:	75 07                	jne    988 <malloc+0xcb>
        return 0;
 981:	b8 00 00 00 00       	mov    $0x0,%eax
 986:	eb 13                	jmp    99b <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 988:	8b 45 f4             	mov    -0xc(%ebp),%eax
 98b:	89 45 f0             	mov    %eax,-0x10(%ebp)
 98e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 991:	8b 00                	mov    (%eax),%eax
 993:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 996:	e9 70 ff ff ff       	jmp    90b <malloc+0x4e>
}
 99b:	c9                   	leave  
 99c:	c3                   	ret    
