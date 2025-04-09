
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
   f:	c7 44 24 04 c0 09 00 	movl   $0x9c0,0x4(%esp)
  16:	00 
  17:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  1e:	e8 d1 05 00 00       	call   5f4 <printf>
    exit();
  23:	e8 3c 04 00 00       	call   464 <exit>
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
  47:	e8 80 04 00 00       	call   4cc <mkdir>
  4c:	85 c0                	test   %eax,%eax
  4e:	79 2c                	jns    7c <main+0x7c>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
  50:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  54:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  5b:	8b 45 0c             	mov    0xc(%ebp),%eax
  5e:	01 d0                	add    %edx,%eax
  60:	8b 00                	mov    (%eax),%eax
  62:	89 44 24 08          	mov    %eax,0x8(%esp)
  66:	c7 44 24 04 d7 09 00 	movl   $0x9d7,0x4(%esp)
  6d:	00 
  6e:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  75:	e8 7a 05 00 00       	call   5f4 <printf>
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
  8a:	e8 d5 03 00 00       	call   464 <exit>

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
#include "user.h"
#include "x86.h"
#include "param.h"
#include "pstat.h"

void ps(){
  b4:	55                   	push   %ebp
  b5:	89 e5                	mov    %esp,%ebp
  b7:	57                   	push   %edi
  b8:	56                   	push   %esi
  b9:	53                   	push   %ebx
  ba:	81 ec 2c 09 00 00    	sub    $0x92c,%esp
  
  //pstatTable pst = malloc(NPROC * sizeof(pstat_t));
  pstat_t pst[NPROC];
  getpinfo(&pst);
  c0:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
  c6:	89 04 24             	mov    %eax,(%esp)
  c9:	e8 36 04 00 00       	call   504 <getpinfo>
  int i;
  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
  ce:	c7 44 24 04 f3 09 00 	movl   $0x9f3,0x4(%esp)
  d5:	00 
  d6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  dd:	e8 12 05 00 00       	call   5f4 <printf>
  for (i = 0; i < NPROC; i++){
  e2:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  e9:	e9 1e 01 00 00       	jmp    20c <ps+0x158>
    if (pst[i].inuse == 1){
  ee:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  f1:	89 d0                	mov    %edx,%eax
  f3:	c1 e0 03             	shl    $0x3,%eax
  f6:	01 d0                	add    %edx,%eax
  f8:	c1 e0 02             	shl    $0x2,%eax
  fb:	8d 5d e8             	lea    -0x18(%ebp),%ebx
  fe:	01 d8                	add    %ebx,%eax
 100:	2d 04 09 00 00       	sub    $0x904,%eax
 105:	8b 00                	mov    (%eax),%eax
 107:	83 f8 01             	cmp    $0x1,%eax
 10a:	0f 85 f8 00 00 00    	jne    208 <ps+0x154>
      printf(1, "%d\t", pst[i].pid);
 110:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 113:	89 d0                	mov    %edx,%eax
 115:	c1 e0 03             	shl    $0x3,%eax
 118:	01 d0                	add    %edx,%eax
 11a:	c1 e0 02             	shl    $0x2,%eax
 11d:	8d 75 e8             	lea    -0x18(%ebp),%esi
 120:	01 f0                	add    %esi,%eax
 122:	2d fc 08 00 00       	sub    $0x8fc,%eax
 127:	8b 00                	mov    (%eax),%eax
 129:	89 44 24 08          	mov    %eax,0x8(%esp)
 12d:	c7 44 24 04 0c 0a 00 	movl   $0xa0c,0x4(%esp)
 134:	00 
 135:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 13c:	e8 b3 04 00 00       	call   5f4 <printf>
      printf(1, "%d\t", pst[i].tickets);
 141:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 144:	89 d0                	mov    %edx,%eax
 146:	c1 e0 03             	shl    $0x3,%eax
 149:	01 d0                	add    %edx,%eax
 14b:	c1 e0 02             	shl    $0x2,%eax
 14e:	8d 7d e8             	lea    -0x18(%ebp),%edi
 151:	01 f8                	add    %edi,%eax
 153:	2d 00 09 00 00       	sub    $0x900,%eax
 158:	8b 00                	mov    (%eax),%eax
 15a:	89 44 24 08          	mov    %eax,0x8(%esp)
 15e:	c7 44 24 04 0c 0a 00 	movl   $0xa0c,0x4(%esp)
 165:	00 
 166:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 16d:	e8 82 04 00 00       	call   5f4 <printf>
      printf(1, "%d\t", pst[i].ticks);
 172:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 175:	89 d0                	mov    %edx,%eax
 177:	c1 e0 03             	shl    $0x3,%eax
 17a:	01 d0                	add    %edx,%eax
 17c:	c1 e0 02             	shl    $0x2,%eax
 17f:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 182:	01 c8                	add    %ecx,%eax
 184:	2d f8 08 00 00       	sub    $0x8f8,%eax
 189:	8b 00                	mov    (%eax),%eax
 18b:	89 44 24 08          	mov    %eax,0x8(%esp)
 18f:	c7 44 24 04 0c 0a 00 	movl   $0xa0c,0x4(%esp)
 196:	00 
 197:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 19e:	e8 51 04 00 00       	call   5f4 <printf>
      printf(1, "%c\t", pst[i].state);
 1a3:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 1a6:	89 d0                	mov    %edx,%eax
 1a8:	c1 e0 03             	shl    $0x3,%eax
 1ab:	01 d0                	add    %edx,%eax
 1ad:	c1 e0 02             	shl    $0x2,%eax
 1b0:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 1b3:	01 d8                	add    %ebx,%eax
 1b5:	2d e4 08 00 00       	sub    $0x8e4,%eax
 1ba:	0f b6 00             	movzbl (%eax),%eax
 1bd:	0f be c0             	movsbl %al,%eax
 1c0:	89 44 24 08          	mov    %eax,0x8(%esp)
 1c4:	c7 44 24 04 10 0a 00 	movl   $0xa10,0x4(%esp)
 1cb:	00 
 1cc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1d3:	e8 1c 04 00 00       	call   5f4 <printf>
      printf(1, "%s\t\n", pst[i].name);
 1d8:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 1de:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 1e1:	89 d0                	mov    %edx,%eax
 1e3:	c1 e0 03             	shl    $0x3,%eax
 1e6:	01 d0                	add    %edx,%eax
 1e8:	c1 e0 02             	shl    $0x2,%eax
 1eb:	83 c0 10             	add    $0x10,%eax
 1ee:	01 c8                	add    %ecx,%eax
 1f0:	89 44 24 08          	mov    %eax,0x8(%esp)
 1f4:	c7 44 24 04 14 0a 00 	movl   $0xa14,0x4(%esp)
 1fb:	00 
 1fc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 203:	e8 ec 03 00 00       	call   5f4 <printf>
  for (i = 0; i < NPROC; i++){
 208:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 20c:	83 7d e4 3f          	cmpl   $0x3f,-0x1c(%ebp)
 210:	0f 8e d8 fe ff ff    	jle    ee <ps+0x3a>
    }
  }
}
 216:	81 c4 2c 09 00 00    	add    $0x92c,%esp
 21c:	5b                   	pop    %ebx
 21d:	5e                   	pop    %esi
 21e:	5f                   	pop    %edi
 21f:	5d                   	pop    %ebp
 220:	c3                   	ret    

00000221 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 221:	55                   	push   %ebp
 222:	89 e5                	mov    %esp,%ebp
 224:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 227:	8b 45 08             	mov    0x8(%ebp),%eax
 22a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 22d:	90                   	nop
 22e:	8b 45 08             	mov    0x8(%ebp),%eax
 231:	8d 50 01             	lea    0x1(%eax),%edx
 234:	89 55 08             	mov    %edx,0x8(%ebp)
 237:	8b 55 0c             	mov    0xc(%ebp),%edx
 23a:	8d 4a 01             	lea    0x1(%edx),%ecx
 23d:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 240:	0f b6 12             	movzbl (%edx),%edx
 243:	88 10                	mov    %dl,(%eax)
 245:	0f b6 00             	movzbl (%eax),%eax
 248:	84 c0                	test   %al,%al
 24a:	75 e2                	jne    22e <strcpy+0xd>
    ;
  return os;
 24c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 24f:	c9                   	leave  
 250:	c3                   	ret    

00000251 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 251:	55                   	push   %ebp
 252:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 254:	eb 08                	jmp    25e <strcmp+0xd>
    p++, q++;
 256:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 25a:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 25e:	8b 45 08             	mov    0x8(%ebp),%eax
 261:	0f b6 00             	movzbl (%eax),%eax
 264:	84 c0                	test   %al,%al
 266:	74 10                	je     278 <strcmp+0x27>
 268:	8b 45 08             	mov    0x8(%ebp),%eax
 26b:	0f b6 10             	movzbl (%eax),%edx
 26e:	8b 45 0c             	mov    0xc(%ebp),%eax
 271:	0f b6 00             	movzbl (%eax),%eax
 274:	38 c2                	cmp    %al,%dl
 276:	74 de                	je     256 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 278:	8b 45 08             	mov    0x8(%ebp),%eax
 27b:	0f b6 00             	movzbl (%eax),%eax
 27e:	0f b6 d0             	movzbl %al,%edx
 281:	8b 45 0c             	mov    0xc(%ebp),%eax
 284:	0f b6 00             	movzbl (%eax),%eax
 287:	0f b6 c0             	movzbl %al,%eax
 28a:	29 c2                	sub    %eax,%edx
 28c:	89 d0                	mov    %edx,%eax
}
 28e:	5d                   	pop    %ebp
 28f:	c3                   	ret    

00000290 <strlen>:

uint
strlen(const char *s)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 296:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 29d:	eb 04                	jmp    2a3 <strlen+0x13>
 29f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 2a3:	8b 55 fc             	mov    -0x4(%ebp),%edx
 2a6:	8b 45 08             	mov    0x8(%ebp),%eax
 2a9:	01 d0                	add    %edx,%eax
 2ab:	0f b6 00             	movzbl (%eax),%eax
 2ae:	84 c0                	test   %al,%al
 2b0:	75 ed                	jne    29f <strlen+0xf>
    ;
  return n;
 2b2:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 2b5:	c9                   	leave  
 2b6:	c3                   	ret    

000002b7 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2b7:	55                   	push   %ebp
 2b8:	89 e5                	mov    %esp,%ebp
 2ba:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 2bd:	8b 45 10             	mov    0x10(%ebp),%eax
 2c0:	89 44 24 08          	mov    %eax,0x8(%esp)
 2c4:	8b 45 0c             	mov    0xc(%ebp),%eax
 2c7:	89 44 24 04          	mov    %eax,0x4(%esp)
 2cb:	8b 45 08             	mov    0x8(%ebp),%eax
 2ce:	89 04 24             	mov    %eax,(%esp)
 2d1:	e8 b9 fd ff ff       	call   8f <stosb>
  return dst;
 2d6:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2d9:	c9                   	leave  
 2da:	c3                   	ret    

000002db <strchr>:

char*
strchr(const char *s, char c)
{
 2db:	55                   	push   %ebp
 2dc:	89 e5                	mov    %esp,%ebp
 2de:	83 ec 04             	sub    $0x4,%esp
 2e1:	8b 45 0c             	mov    0xc(%ebp),%eax
 2e4:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 2e7:	eb 14                	jmp    2fd <strchr+0x22>
    if(*s == c)
 2e9:	8b 45 08             	mov    0x8(%ebp),%eax
 2ec:	0f b6 00             	movzbl (%eax),%eax
 2ef:	3a 45 fc             	cmp    -0x4(%ebp),%al
 2f2:	75 05                	jne    2f9 <strchr+0x1e>
      return (char*)s;
 2f4:	8b 45 08             	mov    0x8(%ebp),%eax
 2f7:	eb 13                	jmp    30c <strchr+0x31>
  for(; *s; s++)
 2f9:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2fd:	8b 45 08             	mov    0x8(%ebp),%eax
 300:	0f b6 00             	movzbl (%eax),%eax
 303:	84 c0                	test   %al,%al
 305:	75 e2                	jne    2e9 <strchr+0xe>
  return 0;
 307:	b8 00 00 00 00       	mov    $0x0,%eax
}
 30c:	c9                   	leave  
 30d:	c3                   	ret    

0000030e <gets>:

char*
gets(char *buf, int max)
{
 30e:	55                   	push   %ebp
 30f:	89 e5                	mov    %esp,%ebp
 311:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 314:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 31b:	eb 4c                	jmp    369 <gets+0x5b>
    cc = read(0, &c, 1);
 31d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 324:	00 
 325:	8d 45 ef             	lea    -0x11(%ebp),%eax
 328:	89 44 24 04          	mov    %eax,0x4(%esp)
 32c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 333:	e8 44 01 00 00       	call   47c <read>
 338:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 33b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 33f:	7f 02                	jg     343 <gets+0x35>
      break;
 341:	eb 31                	jmp    374 <gets+0x66>
    buf[i++] = c;
 343:	8b 45 f4             	mov    -0xc(%ebp),%eax
 346:	8d 50 01             	lea    0x1(%eax),%edx
 349:	89 55 f4             	mov    %edx,-0xc(%ebp)
 34c:	89 c2                	mov    %eax,%edx
 34e:	8b 45 08             	mov    0x8(%ebp),%eax
 351:	01 c2                	add    %eax,%edx
 353:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 357:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 359:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 35d:	3c 0a                	cmp    $0xa,%al
 35f:	74 13                	je     374 <gets+0x66>
 361:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 365:	3c 0d                	cmp    $0xd,%al
 367:	74 0b                	je     374 <gets+0x66>
  for(i=0; i+1 < max; ){
 369:	8b 45 f4             	mov    -0xc(%ebp),%eax
 36c:	83 c0 01             	add    $0x1,%eax
 36f:	3b 45 0c             	cmp    0xc(%ebp),%eax
 372:	7c a9                	jl     31d <gets+0xf>
      break;
  }
  buf[i] = '\0';
 374:	8b 55 f4             	mov    -0xc(%ebp),%edx
 377:	8b 45 08             	mov    0x8(%ebp),%eax
 37a:	01 d0                	add    %edx,%eax
 37c:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 37f:	8b 45 08             	mov    0x8(%ebp),%eax
}
 382:	c9                   	leave  
 383:	c3                   	ret    

00000384 <stat>:

int
stat(const char *n, struct stat *st)
{
 384:	55                   	push   %ebp
 385:	89 e5                	mov    %esp,%ebp
 387:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 38a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 391:	00 
 392:	8b 45 08             	mov    0x8(%ebp),%eax
 395:	89 04 24             	mov    %eax,(%esp)
 398:	e8 07 01 00 00       	call   4a4 <open>
 39d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 3a0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 3a4:	79 07                	jns    3ad <stat+0x29>
    return -1;
 3a6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 3ab:	eb 23                	jmp    3d0 <stat+0x4c>
  r = fstat(fd, st);
 3ad:	8b 45 0c             	mov    0xc(%ebp),%eax
 3b0:	89 44 24 04          	mov    %eax,0x4(%esp)
 3b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3b7:	89 04 24             	mov    %eax,(%esp)
 3ba:	e8 fd 00 00 00       	call   4bc <fstat>
 3bf:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 3c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3c5:	89 04 24             	mov    %eax,(%esp)
 3c8:	e8 bf 00 00 00       	call   48c <close>
  return r;
 3cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 3d0:	c9                   	leave  
 3d1:	c3                   	ret    

000003d2 <atoi>:

int
atoi(const char *s)
{
 3d2:	55                   	push   %ebp
 3d3:	89 e5                	mov    %esp,%ebp
 3d5:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 3d8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 3df:	eb 25                	jmp    406 <atoi+0x34>
    n = n*10 + *s++ - '0';
 3e1:	8b 55 fc             	mov    -0x4(%ebp),%edx
 3e4:	89 d0                	mov    %edx,%eax
 3e6:	c1 e0 02             	shl    $0x2,%eax
 3e9:	01 d0                	add    %edx,%eax
 3eb:	01 c0                	add    %eax,%eax
 3ed:	89 c1                	mov    %eax,%ecx
 3ef:	8b 45 08             	mov    0x8(%ebp),%eax
 3f2:	8d 50 01             	lea    0x1(%eax),%edx
 3f5:	89 55 08             	mov    %edx,0x8(%ebp)
 3f8:	0f b6 00             	movzbl (%eax),%eax
 3fb:	0f be c0             	movsbl %al,%eax
 3fe:	01 c8                	add    %ecx,%eax
 400:	83 e8 30             	sub    $0x30,%eax
 403:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 406:	8b 45 08             	mov    0x8(%ebp),%eax
 409:	0f b6 00             	movzbl (%eax),%eax
 40c:	3c 2f                	cmp    $0x2f,%al
 40e:	7e 0a                	jle    41a <atoi+0x48>
 410:	8b 45 08             	mov    0x8(%ebp),%eax
 413:	0f b6 00             	movzbl (%eax),%eax
 416:	3c 39                	cmp    $0x39,%al
 418:	7e c7                	jle    3e1 <atoi+0xf>
  return n;
 41a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 41d:	c9                   	leave  
 41e:	c3                   	ret    

0000041f <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 41f:	55                   	push   %ebp
 420:	89 e5                	mov    %esp,%ebp
 422:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 425:	8b 45 08             	mov    0x8(%ebp),%eax
 428:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 42b:	8b 45 0c             	mov    0xc(%ebp),%eax
 42e:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 431:	eb 17                	jmp    44a <memmove+0x2b>
    *dst++ = *src++;
 433:	8b 45 fc             	mov    -0x4(%ebp),%eax
 436:	8d 50 01             	lea    0x1(%eax),%edx
 439:	89 55 fc             	mov    %edx,-0x4(%ebp)
 43c:	8b 55 f8             	mov    -0x8(%ebp),%edx
 43f:	8d 4a 01             	lea    0x1(%edx),%ecx
 442:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 445:	0f b6 12             	movzbl (%edx),%edx
 448:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 44a:	8b 45 10             	mov    0x10(%ebp),%eax
 44d:	8d 50 ff             	lea    -0x1(%eax),%edx
 450:	89 55 10             	mov    %edx,0x10(%ebp)
 453:	85 c0                	test   %eax,%eax
 455:	7f dc                	jg     433 <memmove+0x14>
  return vdst;
 457:	8b 45 08             	mov    0x8(%ebp),%eax
}
 45a:	c9                   	leave  
 45b:	c3                   	ret    

0000045c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 45c:	b8 01 00 00 00       	mov    $0x1,%eax
 461:	cd 40                	int    $0x40
 463:	c3                   	ret    

00000464 <exit>:
SYSCALL(exit)
 464:	b8 02 00 00 00       	mov    $0x2,%eax
 469:	cd 40                	int    $0x40
 46b:	c3                   	ret    

0000046c <wait>:
SYSCALL(wait)
 46c:	b8 03 00 00 00       	mov    $0x3,%eax
 471:	cd 40                	int    $0x40
 473:	c3                   	ret    

00000474 <pipe>:
SYSCALL(pipe)
 474:	b8 04 00 00 00       	mov    $0x4,%eax
 479:	cd 40                	int    $0x40
 47b:	c3                   	ret    

0000047c <read>:
SYSCALL(read)
 47c:	b8 05 00 00 00       	mov    $0x5,%eax
 481:	cd 40                	int    $0x40
 483:	c3                   	ret    

00000484 <write>:
SYSCALL(write)
 484:	b8 10 00 00 00       	mov    $0x10,%eax
 489:	cd 40                	int    $0x40
 48b:	c3                   	ret    

0000048c <close>:
SYSCALL(close)
 48c:	b8 15 00 00 00       	mov    $0x15,%eax
 491:	cd 40                	int    $0x40
 493:	c3                   	ret    

00000494 <kill>:
SYSCALL(kill)
 494:	b8 06 00 00 00       	mov    $0x6,%eax
 499:	cd 40                	int    $0x40
 49b:	c3                   	ret    

0000049c <exec>:
SYSCALL(exec)
 49c:	b8 07 00 00 00       	mov    $0x7,%eax
 4a1:	cd 40                	int    $0x40
 4a3:	c3                   	ret    

000004a4 <open>:
SYSCALL(open)
 4a4:	b8 0f 00 00 00       	mov    $0xf,%eax
 4a9:	cd 40                	int    $0x40
 4ab:	c3                   	ret    

000004ac <mknod>:
SYSCALL(mknod)
 4ac:	b8 11 00 00 00       	mov    $0x11,%eax
 4b1:	cd 40                	int    $0x40
 4b3:	c3                   	ret    

000004b4 <unlink>:
SYSCALL(unlink)
 4b4:	b8 12 00 00 00       	mov    $0x12,%eax
 4b9:	cd 40                	int    $0x40
 4bb:	c3                   	ret    

000004bc <fstat>:
SYSCALL(fstat)
 4bc:	b8 08 00 00 00       	mov    $0x8,%eax
 4c1:	cd 40                	int    $0x40
 4c3:	c3                   	ret    

000004c4 <link>:
SYSCALL(link)
 4c4:	b8 13 00 00 00       	mov    $0x13,%eax
 4c9:	cd 40                	int    $0x40
 4cb:	c3                   	ret    

000004cc <mkdir>:
SYSCALL(mkdir)
 4cc:	b8 14 00 00 00       	mov    $0x14,%eax
 4d1:	cd 40                	int    $0x40
 4d3:	c3                   	ret    

000004d4 <chdir>:
SYSCALL(chdir)
 4d4:	b8 09 00 00 00       	mov    $0x9,%eax
 4d9:	cd 40                	int    $0x40
 4db:	c3                   	ret    

000004dc <dup>:
SYSCALL(dup)
 4dc:	b8 0a 00 00 00       	mov    $0xa,%eax
 4e1:	cd 40                	int    $0x40
 4e3:	c3                   	ret    

000004e4 <getpid>:
SYSCALL(getpid)
 4e4:	b8 0b 00 00 00       	mov    $0xb,%eax
 4e9:	cd 40                	int    $0x40
 4eb:	c3                   	ret    

000004ec <sbrk>:
SYSCALL(sbrk)
 4ec:	b8 0c 00 00 00       	mov    $0xc,%eax
 4f1:	cd 40                	int    $0x40
 4f3:	c3                   	ret    

000004f4 <sleep>:
SYSCALL(sleep)
 4f4:	b8 0d 00 00 00       	mov    $0xd,%eax
 4f9:	cd 40                	int    $0x40
 4fb:	c3                   	ret    

000004fc <uptime>:
SYSCALL(uptime)
 4fc:	b8 0e 00 00 00       	mov    $0xe,%eax
 501:	cd 40                	int    $0x40
 503:	c3                   	ret    

00000504 <getpinfo>:
SYSCALL(getpinfo)
 504:	b8 16 00 00 00       	mov    $0x16,%eax
 509:	cd 40                	int    $0x40
 50b:	c3                   	ret    

0000050c <settickets>:
SYSCALL(settickets)
 50c:	b8 17 00 00 00       	mov    $0x17,%eax
 511:	cd 40                	int    $0x40
 513:	c3                   	ret    

00000514 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 514:	55                   	push   %ebp
 515:	89 e5                	mov    %esp,%ebp
 517:	83 ec 18             	sub    $0x18,%esp
 51a:	8b 45 0c             	mov    0xc(%ebp),%eax
 51d:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 520:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 527:	00 
 528:	8d 45 f4             	lea    -0xc(%ebp),%eax
 52b:	89 44 24 04          	mov    %eax,0x4(%esp)
 52f:	8b 45 08             	mov    0x8(%ebp),%eax
 532:	89 04 24             	mov    %eax,(%esp)
 535:	e8 4a ff ff ff       	call   484 <write>
}
 53a:	c9                   	leave  
 53b:	c3                   	ret    

0000053c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 53c:	55                   	push   %ebp
 53d:	89 e5                	mov    %esp,%ebp
 53f:	56                   	push   %esi
 540:	53                   	push   %ebx
 541:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 544:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 54b:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 54f:	74 17                	je     568 <printint+0x2c>
 551:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 555:	79 11                	jns    568 <printint+0x2c>
    neg = 1;
 557:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 55e:	8b 45 0c             	mov    0xc(%ebp),%eax
 561:	f7 d8                	neg    %eax
 563:	89 45 ec             	mov    %eax,-0x14(%ebp)
 566:	eb 06                	jmp    56e <printint+0x32>
  } else {
    x = xx;
 568:	8b 45 0c             	mov    0xc(%ebp),%eax
 56b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 56e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 575:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 578:	8d 41 01             	lea    0x1(%ecx),%eax
 57b:	89 45 f4             	mov    %eax,-0xc(%ebp)
 57e:	8b 5d 10             	mov    0x10(%ebp),%ebx
 581:	8b 45 ec             	mov    -0x14(%ebp),%eax
 584:	ba 00 00 00 00       	mov    $0x0,%edx
 589:	f7 f3                	div    %ebx
 58b:	89 d0                	mov    %edx,%eax
 58d:	0f b6 80 94 0c 00 00 	movzbl 0xc94(%eax),%eax
 594:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 598:	8b 75 10             	mov    0x10(%ebp),%esi
 59b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 59e:	ba 00 00 00 00       	mov    $0x0,%edx
 5a3:	f7 f6                	div    %esi
 5a5:	89 45 ec             	mov    %eax,-0x14(%ebp)
 5a8:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5ac:	75 c7                	jne    575 <printint+0x39>
  if(neg)
 5ae:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 5b2:	74 10                	je     5c4 <printint+0x88>
    buf[i++] = '-';
 5b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5b7:	8d 50 01             	lea    0x1(%eax),%edx
 5ba:	89 55 f4             	mov    %edx,-0xc(%ebp)
 5bd:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 5c2:	eb 1f                	jmp    5e3 <printint+0xa7>
 5c4:	eb 1d                	jmp    5e3 <printint+0xa7>
    putc(fd, buf[i]);
 5c6:	8d 55 dc             	lea    -0x24(%ebp),%edx
 5c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5cc:	01 d0                	add    %edx,%eax
 5ce:	0f b6 00             	movzbl (%eax),%eax
 5d1:	0f be c0             	movsbl %al,%eax
 5d4:	89 44 24 04          	mov    %eax,0x4(%esp)
 5d8:	8b 45 08             	mov    0x8(%ebp),%eax
 5db:	89 04 24             	mov    %eax,(%esp)
 5de:	e8 31 ff ff ff       	call   514 <putc>
  while(--i >= 0)
 5e3:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 5e7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5eb:	79 d9                	jns    5c6 <printint+0x8a>
}
 5ed:	83 c4 30             	add    $0x30,%esp
 5f0:	5b                   	pop    %ebx
 5f1:	5e                   	pop    %esi
 5f2:	5d                   	pop    %ebp
 5f3:	c3                   	ret    

000005f4 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5f4:	55                   	push   %ebp
 5f5:	89 e5                	mov    %esp,%ebp
 5f7:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 5fa:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 601:	8d 45 0c             	lea    0xc(%ebp),%eax
 604:	83 c0 04             	add    $0x4,%eax
 607:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 60a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 611:	e9 7c 01 00 00       	jmp    792 <printf+0x19e>
    c = fmt[i] & 0xff;
 616:	8b 55 0c             	mov    0xc(%ebp),%edx
 619:	8b 45 f0             	mov    -0x10(%ebp),%eax
 61c:	01 d0                	add    %edx,%eax
 61e:	0f b6 00             	movzbl (%eax),%eax
 621:	0f be c0             	movsbl %al,%eax
 624:	25 ff 00 00 00       	and    $0xff,%eax
 629:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 62c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 630:	75 2c                	jne    65e <printf+0x6a>
      if(c == '%'){
 632:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 636:	75 0c                	jne    644 <printf+0x50>
        state = '%';
 638:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 63f:	e9 4a 01 00 00       	jmp    78e <printf+0x19a>
      } else {
        putc(fd, c);
 644:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 647:	0f be c0             	movsbl %al,%eax
 64a:	89 44 24 04          	mov    %eax,0x4(%esp)
 64e:	8b 45 08             	mov    0x8(%ebp),%eax
 651:	89 04 24             	mov    %eax,(%esp)
 654:	e8 bb fe ff ff       	call   514 <putc>
 659:	e9 30 01 00 00       	jmp    78e <printf+0x19a>
      }
    } else if(state == '%'){
 65e:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 662:	0f 85 26 01 00 00    	jne    78e <printf+0x19a>
      if(c == 'd'){
 668:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 66c:	75 2d                	jne    69b <printf+0xa7>
        printint(fd, *ap, 10, 1);
 66e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 671:	8b 00                	mov    (%eax),%eax
 673:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 67a:	00 
 67b:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 682:	00 
 683:	89 44 24 04          	mov    %eax,0x4(%esp)
 687:	8b 45 08             	mov    0x8(%ebp),%eax
 68a:	89 04 24             	mov    %eax,(%esp)
 68d:	e8 aa fe ff ff       	call   53c <printint>
        ap++;
 692:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 696:	e9 ec 00 00 00       	jmp    787 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 69b:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 69f:	74 06                	je     6a7 <printf+0xb3>
 6a1:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 6a5:	75 2d                	jne    6d4 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 6a7:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6aa:	8b 00                	mov    (%eax),%eax
 6ac:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 6b3:	00 
 6b4:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 6bb:	00 
 6bc:	89 44 24 04          	mov    %eax,0x4(%esp)
 6c0:	8b 45 08             	mov    0x8(%ebp),%eax
 6c3:	89 04 24             	mov    %eax,(%esp)
 6c6:	e8 71 fe ff ff       	call   53c <printint>
        ap++;
 6cb:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6cf:	e9 b3 00 00 00       	jmp    787 <printf+0x193>
      } else if(c == 's'){
 6d4:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 6d8:	75 45                	jne    71f <printf+0x12b>
        s = (char*)*ap;
 6da:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6dd:	8b 00                	mov    (%eax),%eax
 6df:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 6e2:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 6e6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 6ea:	75 09                	jne    6f5 <printf+0x101>
          s = "(null)";
 6ec:	c7 45 f4 19 0a 00 00 	movl   $0xa19,-0xc(%ebp)
        while(*s != 0){
 6f3:	eb 1e                	jmp    713 <printf+0x11f>
 6f5:	eb 1c                	jmp    713 <printf+0x11f>
          putc(fd, *s);
 6f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6fa:	0f b6 00             	movzbl (%eax),%eax
 6fd:	0f be c0             	movsbl %al,%eax
 700:	89 44 24 04          	mov    %eax,0x4(%esp)
 704:	8b 45 08             	mov    0x8(%ebp),%eax
 707:	89 04 24             	mov    %eax,(%esp)
 70a:	e8 05 fe ff ff       	call   514 <putc>
          s++;
 70f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 713:	8b 45 f4             	mov    -0xc(%ebp),%eax
 716:	0f b6 00             	movzbl (%eax),%eax
 719:	84 c0                	test   %al,%al
 71b:	75 da                	jne    6f7 <printf+0x103>
 71d:	eb 68                	jmp    787 <printf+0x193>
        }
      } else if(c == 'c'){
 71f:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 723:	75 1d                	jne    742 <printf+0x14e>
        putc(fd, *ap);
 725:	8b 45 e8             	mov    -0x18(%ebp),%eax
 728:	8b 00                	mov    (%eax),%eax
 72a:	0f be c0             	movsbl %al,%eax
 72d:	89 44 24 04          	mov    %eax,0x4(%esp)
 731:	8b 45 08             	mov    0x8(%ebp),%eax
 734:	89 04 24             	mov    %eax,(%esp)
 737:	e8 d8 fd ff ff       	call   514 <putc>
        ap++;
 73c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 740:	eb 45                	jmp    787 <printf+0x193>
      } else if(c == '%'){
 742:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 746:	75 17                	jne    75f <printf+0x16b>
        putc(fd, c);
 748:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 74b:	0f be c0             	movsbl %al,%eax
 74e:	89 44 24 04          	mov    %eax,0x4(%esp)
 752:	8b 45 08             	mov    0x8(%ebp),%eax
 755:	89 04 24             	mov    %eax,(%esp)
 758:	e8 b7 fd ff ff       	call   514 <putc>
 75d:	eb 28                	jmp    787 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 75f:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 766:	00 
 767:	8b 45 08             	mov    0x8(%ebp),%eax
 76a:	89 04 24             	mov    %eax,(%esp)
 76d:	e8 a2 fd ff ff       	call   514 <putc>
        putc(fd, c);
 772:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 775:	0f be c0             	movsbl %al,%eax
 778:	89 44 24 04          	mov    %eax,0x4(%esp)
 77c:	8b 45 08             	mov    0x8(%ebp),%eax
 77f:	89 04 24             	mov    %eax,(%esp)
 782:	e8 8d fd ff ff       	call   514 <putc>
      }
      state = 0;
 787:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 78e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 792:	8b 55 0c             	mov    0xc(%ebp),%edx
 795:	8b 45 f0             	mov    -0x10(%ebp),%eax
 798:	01 d0                	add    %edx,%eax
 79a:	0f b6 00             	movzbl (%eax),%eax
 79d:	84 c0                	test   %al,%al
 79f:	0f 85 71 fe ff ff    	jne    616 <printf+0x22>
    }
  }
}
 7a5:	c9                   	leave  
 7a6:	c3                   	ret    

000007a7 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7a7:	55                   	push   %ebp
 7a8:	89 e5                	mov    %esp,%ebp
 7aa:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7ad:	8b 45 08             	mov    0x8(%ebp),%eax
 7b0:	83 e8 08             	sub    $0x8,%eax
 7b3:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7b6:	a1 b0 0c 00 00       	mov    0xcb0,%eax
 7bb:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7be:	eb 24                	jmp    7e4 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7c0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c3:	8b 00                	mov    (%eax),%eax
 7c5:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7c8:	77 12                	ja     7dc <free+0x35>
 7ca:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7cd:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7d0:	77 24                	ja     7f6 <free+0x4f>
 7d2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d5:	8b 00                	mov    (%eax),%eax
 7d7:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7da:	77 1a                	ja     7f6 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7dc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7df:	8b 00                	mov    (%eax),%eax
 7e1:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7e4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7e7:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7ea:	76 d4                	jbe    7c0 <free+0x19>
 7ec:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ef:	8b 00                	mov    (%eax),%eax
 7f1:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7f4:	76 ca                	jbe    7c0 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7f6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7f9:	8b 40 04             	mov    0x4(%eax),%eax
 7fc:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 803:	8b 45 f8             	mov    -0x8(%ebp),%eax
 806:	01 c2                	add    %eax,%edx
 808:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80b:	8b 00                	mov    (%eax),%eax
 80d:	39 c2                	cmp    %eax,%edx
 80f:	75 24                	jne    835 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 811:	8b 45 f8             	mov    -0x8(%ebp),%eax
 814:	8b 50 04             	mov    0x4(%eax),%edx
 817:	8b 45 fc             	mov    -0x4(%ebp),%eax
 81a:	8b 00                	mov    (%eax),%eax
 81c:	8b 40 04             	mov    0x4(%eax),%eax
 81f:	01 c2                	add    %eax,%edx
 821:	8b 45 f8             	mov    -0x8(%ebp),%eax
 824:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 827:	8b 45 fc             	mov    -0x4(%ebp),%eax
 82a:	8b 00                	mov    (%eax),%eax
 82c:	8b 10                	mov    (%eax),%edx
 82e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 831:	89 10                	mov    %edx,(%eax)
 833:	eb 0a                	jmp    83f <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 835:	8b 45 fc             	mov    -0x4(%ebp),%eax
 838:	8b 10                	mov    (%eax),%edx
 83a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 83d:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 83f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 842:	8b 40 04             	mov    0x4(%eax),%eax
 845:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 84c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 84f:	01 d0                	add    %edx,%eax
 851:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 854:	75 20                	jne    876 <free+0xcf>
    p->s.size += bp->s.size;
 856:	8b 45 fc             	mov    -0x4(%ebp),%eax
 859:	8b 50 04             	mov    0x4(%eax),%edx
 85c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 85f:	8b 40 04             	mov    0x4(%eax),%eax
 862:	01 c2                	add    %eax,%edx
 864:	8b 45 fc             	mov    -0x4(%ebp),%eax
 867:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 86a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 86d:	8b 10                	mov    (%eax),%edx
 86f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 872:	89 10                	mov    %edx,(%eax)
 874:	eb 08                	jmp    87e <free+0xd7>
  } else
    p->s.ptr = bp;
 876:	8b 45 fc             	mov    -0x4(%ebp),%eax
 879:	8b 55 f8             	mov    -0x8(%ebp),%edx
 87c:	89 10                	mov    %edx,(%eax)
  freep = p;
 87e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 881:	a3 b0 0c 00 00       	mov    %eax,0xcb0
}
 886:	c9                   	leave  
 887:	c3                   	ret    

00000888 <morecore>:

static Header*
morecore(uint nu)
{
 888:	55                   	push   %ebp
 889:	89 e5                	mov    %esp,%ebp
 88b:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 88e:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 895:	77 07                	ja     89e <morecore+0x16>
    nu = 4096;
 897:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 89e:	8b 45 08             	mov    0x8(%ebp),%eax
 8a1:	c1 e0 03             	shl    $0x3,%eax
 8a4:	89 04 24             	mov    %eax,(%esp)
 8a7:	e8 40 fc ff ff       	call   4ec <sbrk>
 8ac:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 8af:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 8b3:	75 07                	jne    8bc <morecore+0x34>
    return 0;
 8b5:	b8 00 00 00 00       	mov    $0x0,%eax
 8ba:	eb 22                	jmp    8de <morecore+0x56>
  hp = (Header*)p;
 8bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8bf:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 8c2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8c5:	8b 55 08             	mov    0x8(%ebp),%edx
 8c8:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 8cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8ce:	83 c0 08             	add    $0x8,%eax
 8d1:	89 04 24             	mov    %eax,(%esp)
 8d4:	e8 ce fe ff ff       	call   7a7 <free>
  return freep;
 8d9:	a1 b0 0c 00 00       	mov    0xcb0,%eax
}
 8de:	c9                   	leave  
 8df:	c3                   	ret    

000008e0 <malloc>:

void*
malloc(uint nbytes)
{
 8e0:	55                   	push   %ebp
 8e1:	89 e5                	mov    %esp,%ebp
 8e3:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8e6:	8b 45 08             	mov    0x8(%ebp),%eax
 8e9:	83 c0 07             	add    $0x7,%eax
 8ec:	c1 e8 03             	shr    $0x3,%eax
 8ef:	83 c0 01             	add    $0x1,%eax
 8f2:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 8f5:	a1 b0 0c 00 00       	mov    0xcb0,%eax
 8fa:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8fd:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 901:	75 23                	jne    926 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 903:	c7 45 f0 a8 0c 00 00 	movl   $0xca8,-0x10(%ebp)
 90a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 90d:	a3 b0 0c 00 00       	mov    %eax,0xcb0
 912:	a1 b0 0c 00 00       	mov    0xcb0,%eax
 917:	a3 a8 0c 00 00       	mov    %eax,0xca8
    base.s.size = 0;
 91c:	c7 05 ac 0c 00 00 00 	movl   $0x0,0xcac
 923:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 926:	8b 45 f0             	mov    -0x10(%ebp),%eax
 929:	8b 00                	mov    (%eax),%eax
 92b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 92e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 931:	8b 40 04             	mov    0x4(%eax),%eax
 934:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 937:	72 4d                	jb     986 <malloc+0xa6>
      if(p->s.size == nunits)
 939:	8b 45 f4             	mov    -0xc(%ebp),%eax
 93c:	8b 40 04             	mov    0x4(%eax),%eax
 93f:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 942:	75 0c                	jne    950 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 944:	8b 45 f4             	mov    -0xc(%ebp),%eax
 947:	8b 10                	mov    (%eax),%edx
 949:	8b 45 f0             	mov    -0x10(%ebp),%eax
 94c:	89 10                	mov    %edx,(%eax)
 94e:	eb 26                	jmp    976 <malloc+0x96>
      else {
        p->s.size -= nunits;
 950:	8b 45 f4             	mov    -0xc(%ebp),%eax
 953:	8b 40 04             	mov    0x4(%eax),%eax
 956:	2b 45 ec             	sub    -0x14(%ebp),%eax
 959:	89 c2                	mov    %eax,%edx
 95b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 95e:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 961:	8b 45 f4             	mov    -0xc(%ebp),%eax
 964:	8b 40 04             	mov    0x4(%eax),%eax
 967:	c1 e0 03             	shl    $0x3,%eax
 96a:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 96d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 970:	8b 55 ec             	mov    -0x14(%ebp),%edx
 973:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 976:	8b 45 f0             	mov    -0x10(%ebp),%eax
 979:	a3 b0 0c 00 00       	mov    %eax,0xcb0
      return (void*)(p + 1);
 97e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 981:	83 c0 08             	add    $0x8,%eax
 984:	eb 38                	jmp    9be <malloc+0xde>
    }
    if(p == freep)
 986:	a1 b0 0c 00 00       	mov    0xcb0,%eax
 98b:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 98e:	75 1b                	jne    9ab <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 990:	8b 45 ec             	mov    -0x14(%ebp),%eax
 993:	89 04 24             	mov    %eax,(%esp)
 996:	e8 ed fe ff ff       	call   888 <morecore>
 99b:	89 45 f4             	mov    %eax,-0xc(%ebp)
 99e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 9a2:	75 07                	jne    9ab <malloc+0xcb>
        return 0;
 9a4:	b8 00 00 00 00       	mov    $0x0,%eax
 9a9:	eb 13                	jmp    9be <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9ae:	89 45 f0             	mov    %eax,-0x10(%ebp)
 9b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9b4:	8b 00                	mov    (%eax),%eax
 9b6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 9b9:	e9 70 ff ff ff       	jmp    92e <malloc+0x4e>
}
 9be:	c9                   	leave  
 9bf:	c3                   	ret    
