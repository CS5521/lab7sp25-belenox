
_kill:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp
  int i;

  if(argc < 2){
   9:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
   d:	7f 19                	jg     28 <main+0x28>
    printf(2, "usage: kill pid...\n");
   f:	c7 44 24 04 98 09 00 	movl   $0x998,0x4(%esp)
  16:	00 
  17:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  1e:	e8 a9 05 00 00       	call   5cc <printf>
    exit();
  23:	e8 14 04 00 00       	call   43c <exit>
  }
  for(i=1; i<argc; i++)
  28:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
  2f:	00 
  30:	eb 27                	jmp    59 <main+0x59>
    kill(atoi(argv[i]));
  32:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  36:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3d:	8b 45 0c             	mov    0xc(%ebp),%eax
  40:	01 d0                	add    %edx,%eax
  42:	8b 00                	mov    (%eax),%eax
  44:	89 04 24             	mov    %eax,(%esp)
  47:	e8 5e 03 00 00       	call   3aa <atoi>
  4c:	89 04 24             	mov    %eax,(%esp)
  4f:	e8 18 04 00 00       	call   46c <kill>
  for(i=1; i<argc; i++)
  54:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
  59:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  5d:	3b 45 08             	cmp    0x8(%ebp),%eax
  60:	7c d0                	jl     32 <main+0x32>
  exit();
  62:	e8 d5 03 00 00       	call   43c <exit>

00000067 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  67:	55                   	push   %ebp
  68:	89 e5                	mov    %esp,%ebp
  6a:	57                   	push   %edi
  6b:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  6c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  6f:	8b 55 10             	mov    0x10(%ebp),%edx
  72:	8b 45 0c             	mov    0xc(%ebp),%eax
  75:	89 cb                	mov    %ecx,%ebx
  77:	89 df                	mov    %ebx,%edi
  79:	89 d1                	mov    %edx,%ecx
  7b:	fc                   	cld    
  7c:	f3 aa                	rep stos %al,%es:(%edi)
  7e:	89 ca                	mov    %ecx,%edx
  80:	89 fb                	mov    %edi,%ebx
  82:	89 5d 08             	mov    %ebx,0x8(%ebp)
  85:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  88:	5b                   	pop    %ebx
  89:	5f                   	pop    %edi
  8a:	5d                   	pop    %ebp
  8b:	c3                   	ret    

0000008c <ps>:
#include "user.h"
#include "x86.h"
#include "param.h"
#include "pstat.h"

void ps(){
  8c:	55                   	push   %ebp
  8d:	89 e5                	mov    %esp,%ebp
  8f:	57                   	push   %edi
  90:	56                   	push   %esi
  91:	53                   	push   %ebx
  92:	81 ec 2c 09 00 00    	sub    $0x92c,%esp
  
  //pstatTable pst = malloc(NPROC * sizeof(pstat_t));
  pstat_t pst[NPROC];
  getpinfo(&pst);
  98:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
  9e:	89 04 24             	mov    %eax,(%esp)
  a1:	e8 36 04 00 00       	call   4dc <getpinfo>
  int i;
  for (i = 0; i < NPROC; i++){
  a6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  ad:	e9 32 01 00 00       	jmp    1e4 <ps+0x158>
    if (pst[i].inuse == 1){
  b2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  b5:	89 d0                	mov    %edx,%eax
  b7:	c1 e0 03             	shl    $0x3,%eax
  ba:	01 d0                	add    %edx,%eax
  bc:	c1 e0 02             	shl    $0x2,%eax
  bf:	8d 5d e8             	lea    -0x18(%ebp),%ebx
  c2:	01 d8                	add    %ebx,%eax
  c4:	2d 04 09 00 00       	sub    $0x904,%eax
  c9:	8b 00                	mov    (%eax),%eax
  cb:	83 f8 01             	cmp    $0x1,%eax
  ce:	0f 85 0c 01 00 00    	jne    1e0 <ps+0x154>
      printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
  d4:	c7 44 24 04 ac 09 00 	movl   $0x9ac,0x4(%esp)
  db:	00 
  dc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  e3:	e8 e4 04 00 00       	call   5cc <printf>
      printf(1, "%d\t", pst[i].pid);
  e8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  eb:	89 d0                	mov    %edx,%eax
  ed:	c1 e0 03             	shl    $0x3,%eax
  f0:	01 d0                	add    %edx,%eax
  f2:	c1 e0 02             	shl    $0x2,%eax
  f5:	8d 75 e8             	lea    -0x18(%ebp),%esi
  f8:	01 f0                	add    %esi,%eax
  fa:	2d fc 08 00 00       	sub    $0x8fc,%eax
  ff:	8b 00                	mov    (%eax),%eax
 101:	89 44 24 08          	mov    %eax,0x8(%esp)
 105:	c7 44 24 04 c5 09 00 	movl   $0x9c5,0x4(%esp)
 10c:	00 
 10d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 114:	e8 b3 04 00 00       	call   5cc <printf>
      printf(1, "%d\t", pst[i].tickets);
 119:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 11c:	89 d0                	mov    %edx,%eax
 11e:	c1 e0 03             	shl    $0x3,%eax
 121:	01 d0                	add    %edx,%eax
 123:	c1 e0 02             	shl    $0x2,%eax
 126:	8d 7d e8             	lea    -0x18(%ebp),%edi
 129:	01 f8                	add    %edi,%eax
 12b:	2d 00 09 00 00       	sub    $0x900,%eax
 130:	8b 00                	mov    (%eax),%eax
 132:	89 44 24 08          	mov    %eax,0x8(%esp)
 136:	c7 44 24 04 c5 09 00 	movl   $0x9c5,0x4(%esp)
 13d:	00 
 13e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 145:	e8 82 04 00 00       	call   5cc <printf>
      printf(1, "%d\t", pst[i].ticks);
 14a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 14d:	89 d0                	mov    %edx,%eax
 14f:	c1 e0 03             	shl    $0x3,%eax
 152:	01 d0                	add    %edx,%eax
 154:	c1 e0 02             	shl    $0x2,%eax
 157:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 15a:	01 c8                	add    %ecx,%eax
 15c:	2d f8 08 00 00       	sub    $0x8f8,%eax
 161:	8b 00                	mov    (%eax),%eax
 163:	89 44 24 08          	mov    %eax,0x8(%esp)
 167:	c7 44 24 04 c5 09 00 	movl   $0x9c5,0x4(%esp)
 16e:	00 
 16f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 176:	e8 51 04 00 00       	call   5cc <printf>
      printf(1, "%c\t", pst[i].state);
 17b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 17e:	89 d0                	mov    %edx,%eax
 180:	c1 e0 03             	shl    $0x3,%eax
 183:	01 d0                	add    %edx,%eax
 185:	c1 e0 02             	shl    $0x2,%eax
 188:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 18b:	01 d8                	add    %ebx,%eax
 18d:	2d e4 08 00 00       	sub    $0x8e4,%eax
 192:	0f b6 00             	movzbl (%eax),%eax
 195:	0f be c0             	movsbl %al,%eax
 198:	89 44 24 08          	mov    %eax,0x8(%esp)
 19c:	c7 44 24 04 c9 09 00 	movl   $0x9c9,0x4(%esp)
 1a3:	00 
 1a4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1ab:	e8 1c 04 00 00       	call   5cc <printf>
      printf(1, "%s\t\n", pst[i].name);
 1b0:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 1b6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 1b9:	89 d0                	mov    %edx,%eax
 1bb:	c1 e0 03             	shl    $0x3,%eax
 1be:	01 d0                	add    %edx,%eax
 1c0:	c1 e0 02             	shl    $0x2,%eax
 1c3:	83 c0 10             	add    $0x10,%eax
 1c6:	01 c8                	add    %ecx,%eax
 1c8:	89 44 24 08          	mov    %eax,0x8(%esp)
 1cc:	c7 44 24 04 cd 09 00 	movl   $0x9cd,0x4(%esp)
 1d3:	00 
 1d4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1db:	e8 ec 03 00 00       	call   5cc <printf>
  for (i = 0; i < NPROC; i++){
 1e0:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 1e4:	83 7d e4 3f          	cmpl   $0x3f,-0x1c(%ebp)
 1e8:	0f 8e c4 fe ff ff    	jle    b2 <ps+0x26>
    }
  }
}
 1ee:	81 c4 2c 09 00 00    	add    $0x92c,%esp
 1f4:	5b                   	pop    %ebx
 1f5:	5e                   	pop    %esi
 1f6:	5f                   	pop    %edi
 1f7:	5d                   	pop    %ebp
 1f8:	c3                   	ret    

000001f9 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 1f9:	55                   	push   %ebp
 1fa:	89 e5                	mov    %esp,%ebp
 1fc:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 1ff:	8b 45 08             	mov    0x8(%ebp),%eax
 202:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 205:	90                   	nop
 206:	8b 45 08             	mov    0x8(%ebp),%eax
 209:	8d 50 01             	lea    0x1(%eax),%edx
 20c:	89 55 08             	mov    %edx,0x8(%ebp)
 20f:	8b 55 0c             	mov    0xc(%ebp),%edx
 212:	8d 4a 01             	lea    0x1(%edx),%ecx
 215:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 218:	0f b6 12             	movzbl (%edx),%edx
 21b:	88 10                	mov    %dl,(%eax)
 21d:	0f b6 00             	movzbl (%eax),%eax
 220:	84 c0                	test   %al,%al
 222:	75 e2                	jne    206 <strcpy+0xd>
    ;
  return os;
 224:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 227:	c9                   	leave  
 228:	c3                   	ret    

00000229 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 229:	55                   	push   %ebp
 22a:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 22c:	eb 08                	jmp    236 <strcmp+0xd>
    p++, q++;
 22e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 232:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 236:	8b 45 08             	mov    0x8(%ebp),%eax
 239:	0f b6 00             	movzbl (%eax),%eax
 23c:	84 c0                	test   %al,%al
 23e:	74 10                	je     250 <strcmp+0x27>
 240:	8b 45 08             	mov    0x8(%ebp),%eax
 243:	0f b6 10             	movzbl (%eax),%edx
 246:	8b 45 0c             	mov    0xc(%ebp),%eax
 249:	0f b6 00             	movzbl (%eax),%eax
 24c:	38 c2                	cmp    %al,%dl
 24e:	74 de                	je     22e <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 250:	8b 45 08             	mov    0x8(%ebp),%eax
 253:	0f b6 00             	movzbl (%eax),%eax
 256:	0f b6 d0             	movzbl %al,%edx
 259:	8b 45 0c             	mov    0xc(%ebp),%eax
 25c:	0f b6 00             	movzbl (%eax),%eax
 25f:	0f b6 c0             	movzbl %al,%eax
 262:	29 c2                	sub    %eax,%edx
 264:	89 d0                	mov    %edx,%eax
}
 266:	5d                   	pop    %ebp
 267:	c3                   	ret    

00000268 <strlen>:

uint
strlen(const char *s)
{
 268:	55                   	push   %ebp
 269:	89 e5                	mov    %esp,%ebp
 26b:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 26e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 275:	eb 04                	jmp    27b <strlen+0x13>
 277:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 27b:	8b 55 fc             	mov    -0x4(%ebp),%edx
 27e:	8b 45 08             	mov    0x8(%ebp),%eax
 281:	01 d0                	add    %edx,%eax
 283:	0f b6 00             	movzbl (%eax),%eax
 286:	84 c0                	test   %al,%al
 288:	75 ed                	jne    277 <strlen+0xf>
    ;
  return n;
 28a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 28d:	c9                   	leave  
 28e:	c3                   	ret    

0000028f <memset>:

void*
memset(void *dst, int c, uint n)
{
 28f:	55                   	push   %ebp
 290:	89 e5                	mov    %esp,%ebp
 292:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 295:	8b 45 10             	mov    0x10(%ebp),%eax
 298:	89 44 24 08          	mov    %eax,0x8(%esp)
 29c:	8b 45 0c             	mov    0xc(%ebp),%eax
 29f:	89 44 24 04          	mov    %eax,0x4(%esp)
 2a3:	8b 45 08             	mov    0x8(%ebp),%eax
 2a6:	89 04 24             	mov    %eax,(%esp)
 2a9:	e8 b9 fd ff ff       	call   67 <stosb>
  return dst;
 2ae:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2b1:	c9                   	leave  
 2b2:	c3                   	ret    

000002b3 <strchr>:

char*
strchr(const char *s, char c)
{
 2b3:	55                   	push   %ebp
 2b4:	89 e5                	mov    %esp,%ebp
 2b6:	83 ec 04             	sub    $0x4,%esp
 2b9:	8b 45 0c             	mov    0xc(%ebp),%eax
 2bc:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 2bf:	eb 14                	jmp    2d5 <strchr+0x22>
    if(*s == c)
 2c1:	8b 45 08             	mov    0x8(%ebp),%eax
 2c4:	0f b6 00             	movzbl (%eax),%eax
 2c7:	3a 45 fc             	cmp    -0x4(%ebp),%al
 2ca:	75 05                	jne    2d1 <strchr+0x1e>
      return (char*)s;
 2cc:	8b 45 08             	mov    0x8(%ebp),%eax
 2cf:	eb 13                	jmp    2e4 <strchr+0x31>
  for(; *s; s++)
 2d1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2d5:	8b 45 08             	mov    0x8(%ebp),%eax
 2d8:	0f b6 00             	movzbl (%eax),%eax
 2db:	84 c0                	test   %al,%al
 2dd:	75 e2                	jne    2c1 <strchr+0xe>
  return 0;
 2df:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2e4:	c9                   	leave  
 2e5:	c3                   	ret    

000002e6 <gets>:

char*
gets(char *buf, int max)
{
 2e6:	55                   	push   %ebp
 2e7:	89 e5                	mov    %esp,%ebp
 2e9:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2ec:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 2f3:	eb 4c                	jmp    341 <gets+0x5b>
    cc = read(0, &c, 1);
 2f5:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 2fc:	00 
 2fd:	8d 45 ef             	lea    -0x11(%ebp),%eax
 300:	89 44 24 04          	mov    %eax,0x4(%esp)
 304:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 30b:	e8 44 01 00 00       	call   454 <read>
 310:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 313:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 317:	7f 02                	jg     31b <gets+0x35>
      break;
 319:	eb 31                	jmp    34c <gets+0x66>
    buf[i++] = c;
 31b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 31e:	8d 50 01             	lea    0x1(%eax),%edx
 321:	89 55 f4             	mov    %edx,-0xc(%ebp)
 324:	89 c2                	mov    %eax,%edx
 326:	8b 45 08             	mov    0x8(%ebp),%eax
 329:	01 c2                	add    %eax,%edx
 32b:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 32f:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 331:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 335:	3c 0a                	cmp    $0xa,%al
 337:	74 13                	je     34c <gets+0x66>
 339:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 33d:	3c 0d                	cmp    $0xd,%al
 33f:	74 0b                	je     34c <gets+0x66>
  for(i=0; i+1 < max; ){
 341:	8b 45 f4             	mov    -0xc(%ebp),%eax
 344:	83 c0 01             	add    $0x1,%eax
 347:	3b 45 0c             	cmp    0xc(%ebp),%eax
 34a:	7c a9                	jl     2f5 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 34c:	8b 55 f4             	mov    -0xc(%ebp),%edx
 34f:	8b 45 08             	mov    0x8(%ebp),%eax
 352:	01 d0                	add    %edx,%eax
 354:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 357:	8b 45 08             	mov    0x8(%ebp),%eax
}
 35a:	c9                   	leave  
 35b:	c3                   	ret    

0000035c <stat>:

int
stat(const char *n, struct stat *st)
{
 35c:	55                   	push   %ebp
 35d:	89 e5                	mov    %esp,%ebp
 35f:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 362:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 369:	00 
 36a:	8b 45 08             	mov    0x8(%ebp),%eax
 36d:	89 04 24             	mov    %eax,(%esp)
 370:	e8 07 01 00 00       	call   47c <open>
 375:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 378:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 37c:	79 07                	jns    385 <stat+0x29>
    return -1;
 37e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 383:	eb 23                	jmp    3a8 <stat+0x4c>
  r = fstat(fd, st);
 385:	8b 45 0c             	mov    0xc(%ebp),%eax
 388:	89 44 24 04          	mov    %eax,0x4(%esp)
 38c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 38f:	89 04 24             	mov    %eax,(%esp)
 392:	e8 fd 00 00 00       	call   494 <fstat>
 397:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 39a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 39d:	89 04 24             	mov    %eax,(%esp)
 3a0:	e8 bf 00 00 00       	call   464 <close>
  return r;
 3a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 3a8:	c9                   	leave  
 3a9:	c3                   	ret    

000003aa <atoi>:

int
atoi(const char *s)
{
 3aa:	55                   	push   %ebp
 3ab:	89 e5                	mov    %esp,%ebp
 3ad:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 3b0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 3b7:	eb 25                	jmp    3de <atoi+0x34>
    n = n*10 + *s++ - '0';
 3b9:	8b 55 fc             	mov    -0x4(%ebp),%edx
 3bc:	89 d0                	mov    %edx,%eax
 3be:	c1 e0 02             	shl    $0x2,%eax
 3c1:	01 d0                	add    %edx,%eax
 3c3:	01 c0                	add    %eax,%eax
 3c5:	89 c1                	mov    %eax,%ecx
 3c7:	8b 45 08             	mov    0x8(%ebp),%eax
 3ca:	8d 50 01             	lea    0x1(%eax),%edx
 3cd:	89 55 08             	mov    %edx,0x8(%ebp)
 3d0:	0f b6 00             	movzbl (%eax),%eax
 3d3:	0f be c0             	movsbl %al,%eax
 3d6:	01 c8                	add    %ecx,%eax
 3d8:	83 e8 30             	sub    $0x30,%eax
 3db:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 3de:	8b 45 08             	mov    0x8(%ebp),%eax
 3e1:	0f b6 00             	movzbl (%eax),%eax
 3e4:	3c 2f                	cmp    $0x2f,%al
 3e6:	7e 0a                	jle    3f2 <atoi+0x48>
 3e8:	8b 45 08             	mov    0x8(%ebp),%eax
 3eb:	0f b6 00             	movzbl (%eax),%eax
 3ee:	3c 39                	cmp    $0x39,%al
 3f0:	7e c7                	jle    3b9 <atoi+0xf>
  return n;
 3f2:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3f5:	c9                   	leave  
 3f6:	c3                   	ret    

000003f7 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3f7:	55                   	push   %ebp
 3f8:	89 e5                	mov    %esp,%ebp
 3fa:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 3fd:	8b 45 08             	mov    0x8(%ebp),%eax
 400:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 403:	8b 45 0c             	mov    0xc(%ebp),%eax
 406:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 409:	eb 17                	jmp    422 <memmove+0x2b>
    *dst++ = *src++;
 40b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 40e:	8d 50 01             	lea    0x1(%eax),%edx
 411:	89 55 fc             	mov    %edx,-0x4(%ebp)
 414:	8b 55 f8             	mov    -0x8(%ebp),%edx
 417:	8d 4a 01             	lea    0x1(%edx),%ecx
 41a:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 41d:	0f b6 12             	movzbl (%edx),%edx
 420:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 422:	8b 45 10             	mov    0x10(%ebp),%eax
 425:	8d 50 ff             	lea    -0x1(%eax),%edx
 428:	89 55 10             	mov    %edx,0x10(%ebp)
 42b:	85 c0                	test   %eax,%eax
 42d:	7f dc                	jg     40b <memmove+0x14>
  return vdst;
 42f:	8b 45 08             	mov    0x8(%ebp),%eax
}
 432:	c9                   	leave  
 433:	c3                   	ret    

00000434 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 434:	b8 01 00 00 00       	mov    $0x1,%eax
 439:	cd 40                	int    $0x40
 43b:	c3                   	ret    

0000043c <exit>:
SYSCALL(exit)
 43c:	b8 02 00 00 00       	mov    $0x2,%eax
 441:	cd 40                	int    $0x40
 443:	c3                   	ret    

00000444 <wait>:
SYSCALL(wait)
 444:	b8 03 00 00 00       	mov    $0x3,%eax
 449:	cd 40                	int    $0x40
 44b:	c3                   	ret    

0000044c <pipe>:
SYSCALL(pipe)
 44c:	b8 04 00 00 00       	mov    $0x4,%eax
 451:	cd 40                	int    $0x40
 453:	c3                   	ret    

00000454 <read>:
SYSCALL(read)
 454:	b8 05 00 00 00       	mov    $0x5,%eax
 459:	cd 40                	int    $0x40
 45b:	c3                   	ret    

0000045c <write>:
SYSCALL(write)
 45c:	b8 10 00 00 00       	mov    $0x10,%eax
 461:	cd 40                	int    $0x40
 463:	c3                   	ret    

00000464 <close>:
SYSCALL(close)
 464:	b8 15 00 00 00       	mov    $0x15,%eax
 469:	cd 40                	int    $0x40
 46b:	c3                   	ret    

0000046c <kill>:
SYSCALL(kill)
 46c:	b8 06 00 00 00       	mov    $0x6,%eax
 471:	cd 40                	int    $0x40
 473:	c3                   	ret    

00000474 <exec>:
SYSCALL(exec)
 474:	b8 07 00 00 00       	mov    $0x7,%eax
 479:	cd 40                	int    $0x40
 47b:	c3                   	ret    

0000047c <open>:
SYSCALL(open)
 47c:	b8 0f 00 00 00       	mov    $0xf,%eax
 481:	cd 40                	int    $0x40
 483:	c3                   	ret    

00000484 <mknod>:
SYSCALL(mknod)
 484:	b8 11 00 00 00       	mov    $0x11,%eax
 489:	cd 40                	int    $0x40
 48b:	c3                   	ret    

0000048c <unlink>:
SYSCALL(unlink)
 48c:	b8 12 00 00 00       	mov    $0x12,%eax
 491:	cd 40                	int    $0x40
 493:	c3                   	ret    

00000494 <fstat>:
SYSCALL(fstat)
 494:	b8 08 00 00 00       	mov    $0x8,%eax
 499:	cd 40                	int    $0x40
 49b:	c3                   	ret    

0000049c <link>:
SYSCALL(link)
 49c:	b8 13 00 00 00       	mov    $0x13,%eax
 4a1:	cd 40                	int    $0x40
 4a3:	c3                   	ret    

000004a4 <mkdir>:
SYSCALL(mkdir)
 4a4:	b8 14 00 00 00       	mov    $0x14,%eax
 4a9:	cd 40                	int    $0x40
 4ab:	c3                   	ret    

000004ac <chdir>:
SYSCALL(chdir)
 4ac:	b8 09 00 00 00       	mov    $0x9,%eax
 4b1:	cd 40                	int    $0x40
 4b3:	c3                   	ret    

000004b4 <dup>:
SYSCALL(dup)
 4b4:	b8 0a 00 00 00       	mov    $0xa,%eax
 4b9:	cd 40                	int    $0x40
 4bb:	c3                   	ret    

000004bc <getpid>:
SYSCALL(getpid)
 4bc:	b8 0b 00 00 00       	mov    $0xb,%eax
 4c1:	cd 40                	int    $0x40
 4c3:	c3                   	ret    

000004c4 <sbrk>:
SYSCALL(sbrk)
 4c4:	b8 0c 00 00 00       	mov    $0xc,%eax
 4c9:	cd 40                	int    $0x40
 4cb:	c3                   	ret    

000004cc <sleep>:
SYSCALL(sleep)
 4cc:	b8 0d 00 00 00       	mov    $0xd,%eax
 4d1:	cd 40                	int    $0x40
 4d3:	c3                   	ret    

000004d4 <uptime>:
SYSCALL(uptime)
 4d4:	b8 0e 00 00 00       	mov    $0xe,%eax
 4d9:	cd 40                	int    $0x40
 4db:	c3                   	ret    

000004dc <getpinfo>:
SYSCALL(getpinfo)
 4dc:	b8 16 00 00 00       	mov    $0x16,%eax
 4e1:	cd 40                	int    $0x40
 4e3:	c3                   	ret    

000004e4 <settickets>:
SYSCALL(settickets)
 4e4:	b8 17 00 00 00       	mov    $0x17,%eax
 4e9:	cd 40                	int    $0x40
 4eb:	c3                   	ret    

000004ec <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4ec:	55                   	push   %ebp
 4ed:	89 e5                	mov    %esp,%ebp
 4ef:	83 ec 18             	sub    $0x18,%esp
 4f2:	8b 45 0c             	mov    0xc(%ebp),%eax
 4f5:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 4f8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4ff:	00 
 500:	8d 45 f4             	lea    -0xc(%ebp),%eax
 503:	89 44 24 04          	mov    %eax,0x4(%esp)
 507:	8b 45 08             	mov    0x8(%ebp),%eax
 50a:	89 04 24             	mov    %eax,(%esp)
 50d:	e8 4a ff ff ff       	call   45c <write>
}
 512:	c9                   	leave  
 513:	c3                   	ret    

00000514 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 514:	55                   	push   %ebp
 515:	89 e5                	mov    %esp,%ebp
 517:	56                   	push   %esi
 518:	53                   	push   %ebx
 519:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 51c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 523:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 527:	74 17                	je     540 <printint+0x2c>
 529:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 52d:	79 11                	jns    540 <printint+0x2c>
    neg = 1;
 52f:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 536:	8b 45 0c             	mov    0xc(%ebp),%eax
 539:	f7 d8                	neg    %eax
 53b:	89 45 ec             	mov    %eax,-0x14(%ebp)
 53e:	eb 06                	jmp    546 <printint+0x32>
  } else {
    x = xx;
 540:	8b 45 0c             	mov    0xc(%ebp),%eax
 543:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 546:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 54d:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 550:	8d 41 01             	lea    0x1(%ecx),%eax
 553:	89 45 f4             	mov    %eax,-0xc(%ebp)
 556:	8b 5d 10             	mov    0x10(%ebp),%ebx
 559:	8b 45 ec             	mov    -0x14(%ebp),%eax
 55c:	ba 00 00 00 00       	mov    $0x0,%edx
 561:	f7 f3                	div    %ebx
 563:	89 d0                	mov    %edx,%eax
 565:	0f b6 80 50 0c 00 00 	movzbl 0xc50(%eax),%eax
 56c:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 570:	8b 75 10             	mov    0x10(%ebp),%esi
 573:	8b 45 ec             	mov    -0x14(%ebp),%eax
 576:	ba 00 00 00 00       	mov    $0x0,%edx
 57b:	f7 f6                	div    %esi
 57d:	89 45 ec             	mov    %eax,-0x14(%ebp)
 580:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 584:	75 c7                	jne    54d <printint+0x39>
  if(neg)
 586:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 58a:	74 10                	je     59c <printint+0x88>
    buf[i++] = '-';
 58c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 58f:	8d 50 01             	lea    0x1(%eax),%edx
 592:	89 55 f4             	mov    %edx,-0xc(%ebp)
 595:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 59a:	eb 1f                	jmp    5bb <printint+0xa7>
 59c:	eb 1d                	jmp    5bb <printint+0xa7>
    putc(fd, buf[i]);
 59e:	8d 55 dc             	lea    -0x24(%ebp),%edx
 5a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5a4:	01 d0                	add    %edx,%eax
 5a6:	0f b6 00             	movzbl (%eax),%eax
 5a9:	0f be c0             	movsbl %al,%eax
 5ac:	89 44 24 04          	mov    %eax,0x4(%esp)
 5b0:	8b 45 08             	mov    0x8(%ebp),%eax
 5b3:	89 04 24             	mov    %eax,(%esp)
 5b6:	e8 31 ff ff ff       	call   4ec <putc>
  while(--i >= 0)
 5bb:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 5bf:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5c3:	79 d9                	jns    59e <printint+0x8a>
}
 5c5:	83 c4 30             	add    $0x30,%esp
 5c8:	5b                   	pop    %ebx
 5c9:	5e                   	pop    %esi
 5ca:	5d                   	pop    %ebp
 5cb:	c3                   	ret    

000005cc <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5cc:	55                   	push   %ebp
 5cd:	89 e5                	mov    %esp,%ebp
 5cf:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 5d2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 5d9:	8d 45 0c             	lea    0xc(%ebp),%eax
 5dc:	83 c0 04             	add    $0x4,%eax
 5df:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 5e2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 5e9:	e9 7c 01 00 00       	jmp    76a <printf+0x19e>
    c = fmt[i] & 0xff;
 5ee:	8b 55 0c             	mov    0xc(%ebp),%edx
 5f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5f4:	01 d0                	add    %edx,%eax
 5f6:	0f b6 00             	movzbl (%eax),%eax
 5f9:	0f be c0             	movsbl %al,%eax
 5fc:	25 ff 00 00 00       	and    $0xff,%eax
 601:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 604:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 608:	75 2c                	jne    636 <printf+0x6a>
      if(c == '%'){
 60a:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 60e:	75 0c                	jne    61c <printf+0x50>
        state = '%';
 610:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 617:	e9 4a 01 00 00       	jmp    766 <printf+0x19a>
      } else {
        putc(fd, c);
 61c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 61f:	0f be c0             	movsbl %al,%eax
 622:	89 44 24 04          	mov    %eax,0x4(%esp)
 626:	8b 45 08             	mov    0x8(%ebp),%eax
 629:	89 04 24             	mov    %eax,(%esp)
 62c:	e8 bb fe ff ff       	call   4ec <putc>
 631:	e9 30 01 00 00       	jmp    766 <printf+0x19a>
      }
    } else if(state == '%'){
 636:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 63a:	0f 85 26 01 00 00    	jne    766 <printf+0x19a>
      if(c == 'd'){
 640:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 644:	75 2d                	jne    673 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 646:	8b 45 e8             	mov    -0x18(%ebp),%eax
 649:	8b 00                	mov    (%eax),%eax
 64b:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 652:	00 
 653:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 65a:	00 
 65b:	89 44 24 04          	mov    %eax,0x4(%esp)
 65f:	8b 45 08             	mov    0x8(%ebp),%eax
 662:	89 04 24             	mov    %eax,(%esp)
 665:	e8 aa fe ff ff       	call   514 <printint>
        ap++;
 66a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 66e:	e9 ec 00 00 00       	jmp    75f <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 673:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 677:	74 06                	je     67f <printf+0xb3>
 679:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 67d:	75 2d                	jne    6ac <printf+0xe0>
        printint(fd, *ap, 16, 0);
 67f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 682:	8b 00                	mov    (%eax),%eax
 684:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 68b:	00 
 68c:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 693:	00 
 694:	89 44 24 04          	mov    %eax,0x4(%esp)
 698:	8b 45 08             	mov    0x8(%ebp),%eax
 69b:	89 04 24             	mov    %eax,(%esp)
 69e:	e8 71 fe ff ff       	call   514 <printint>
        ap++;
 6a3:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6a7:	e9 b3 00 00 00       	jmp    75f <printf+0x193>
      } else if(c == 's'){
 6ac:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 6b0:	75 45                	jne    6f7 <printf+0x12b>
        s = (char*)*ap;
 6b2:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6b5:	8b 00                	mov    (%eax),%eax
 6b7:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 6ba:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 6be:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 6c2:	75 09                	jne    6cd <printf+0x101>
          s = "(null)";
 6c4:	c7 45 f4 d2 09 00 00 	movl   $0x9d2,-0xc(%ebp)
        while(*s != 0){
 6cb:	eb 1e                	jmp    6eb <printf+0x11f>
 6cd:	eb 1c                	jmp    6eb <printf+0x11f>
          putc(fd, *s);
 6cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6d2:	0f b6 00             	movzbl (%eax),%eax
 6d5:	0f be c0             	movsbl %al,%eax
 6d8:	89 44 24 04          	mov    %eax,0x4(%esp)
 6dc:	8b 45 08             	mov    0x8(%ebp),%eax
 6df:	89 04 24             	mov    %eax,(%esp)
 6e2:	e8 05 fe ff ff       	call   4ec <putc>
          s++;
 6e7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 6eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6ee:	0f b6 00             	movzbl (%eax),%eax
 6f1:	84 c0                	test   %al,%al
 6f3:	75 da                	jne    6cf <printf+0x103>
 6f5:	eb 68                	jmp    75f <printf+0x193>
        }
      } else if(c == 'c'){
 6f7:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 6fb:	75 1d                	jne    71a <printf+0x14e>
        putc(fd, *ap);
 6fd:	8b 45 e8             	mov    -0x18(%ebp),%eax
 700:	8b 00                	mov    (%eax),%eax
 702:	0f be c0             	movsbl %al,%eax
 705:	89 44 24 04          	mov    %eax,0x4(%esp)
 709:	8b 45 08             	mov    0x8(%ebp),%eax
 70c:	89 04 24             	mov    %eax,(%esp)
 70f:	e8 d8 fd ff ff       	call   4ec <putc>
        ap++;
 714:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 718:	eb 45                	jmp    75f <printf+0x193>
      } else if(c == '%'){
 71a:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 71e:	75 17                	jne    737 <printf+0x16b>
        putc(fd, c);
 720:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 723:	0f be c0             	movsbl %al,%eax
 726:	89 44 24 04          	mov    %eax,0x4(%esp)
 72a:	8b 45 08             	mov    0x8(%ebp),%eax
 72d:	89 04 24             	mov    %eax,(%esp)
 730:	e8 b7 fd ff ff       	call   4ec <putc>
 735:	eb 28                	jmp    75f <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 737:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 73e:	00 
 73f:	8b 45 08             	mov    0x8(%ebp),%eax
 742:	89 04 24             	mov    %eax,(%esp)
 745:	e8 a2 fd ff ff       	call   4ec <putc>
        putc(fd, c);
 74a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 74d:	0f be c0             	movsbl %al,%eax
 750:	89 44 24 04          	mov    %eax,0x4(%esp)
 754:	8b 45 08             	mov    0x8(%ebp),%eax
 757:	89 04 24             	mov    %eax,(%esp)
 75a:	e8 8d fd ff ff       	call   4ec <putc>
      }
      state = 0;
 75f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 766:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 76a:	8b 55 0c             	mov    0xc(%ebp),%edx
 76d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 770:	01 d0                	add    %edx,%eax
 772:	0f b6 00             	movzbl (%eax),%eax
 775:	84 c0                	test   %al,%al
 777:	0f 85 71 fe ff ff    	jne    5ee <printf+0x22>
    }
  }
}
 77d:	c9                   	leave  
 77e:	c3                   	ret    

0000077f <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 77f:	55                   	push   %ebp
 780:	89 e5                	mov    %esp,%ebp
 782:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 785:	8b 45 08             	mov    0x8(%ebp),%eax
 788:	83 e8 08             	sub    $0x8,%eax
 78b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 78e:	a1 6c 0c 00 00       	mov    0xc6c,%eax
 793:	89 45 fc             	mov    %eax,-0x4(%ebp)
 796:	eb 24                	jmp    7bc <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 798:	8b 45 fc             	mov    -0x4(%ebp),%eax
 79b:	8b 00                	mov    (%eax),%eax
 79d:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7a0:	77 12                	ja     7b4 <free+0x35>
 7a2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7a5:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7a8:	77 24                	ja     7ce <free+0x4f>
 7aa:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ad:	8b 00                	mov    (%eax),%eax
 7af:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7b2:	77 1a                	ja     7ce <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7b4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b7:	8b 00                	mov    (%eax),%eax
 7b9:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7bc:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7bf:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7c2:	76 d4                	jbe    798 <free+0x19>
 7c4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c7:	8b 00                	mov    (%eax),%eax
 7c9:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7cc:	76 ca                	jbe    798 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7ce:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7d1:	8b 40 04             	mov    0x4(%eax),%eax
 7d4:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7db:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7de:	01 c2                	add    %eax,%edx
 7e0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e3:	8b 00                	mov    (%eax),%eax
 7e5:	39 c2                	cmp    %eax,%edx
 7e7:	75 24                	jne    80d <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 7e9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7ec:	8b 50 04             	mov    0x4(%eax),%edx
 7ef:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f2:	8b 00                	mov    (%eax),%eax
 7f4:	8b 40 04             	mov    0x4(%eax),%eax
 7f7:	01 c2                	add    %eax,%edx
 7f9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7fc:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 7ff:	8b 45 fc             	mov    -0x4(%ebp),%eax
 802:	8b 00                	mov    (%eax),%eax
 804:	8b 10                	mov    (%eax),%edx
 806:	8b 45 f8             	mov    -0x8(%ebp),%eax
 809:	89 10                	mov    %edx,(%eax)
 80b:	eb 0a                	jmp    817 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 80d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 810:	8b 10                	mov    (%eax),%edx
 812:	8b 45 f8             	mov    -0x8(%ebp),%eax
 815:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 817:	8b 45 fc             	mov    -0x4(%ebp),%eax
 81a:	8b 40 04             	mov    0x4(%eax),%eax
 81d:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 824:	8b 45 fc             	mov    -0x4(%ebp),%eax
 827:	01 d0                	add    %edx,%eax
 829:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 82c:	75 20                	jne    84e <free+0xcf>
    p->s.size += bp->s.size;
 82e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 831:	8b 50 04             	mov    0x4(%eax),%edx
 834:	8b 45 f8             	mov    -0x8(%ebp),%eax
 837:	8b 40 04             	mov    0x4(%eax),%eax
 83a:	01 c2                	add    %eax,%edx
 83c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 83f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 842:	8b 45 f8             	mov    -0x8(%ebp),%eax
 845:	8b 10                	mov    (%eax),%edx
 847:	8b 45 fc             	mov    -0x4(%ebp),%eax
 84a:	89 10                	mov    %edx,(%eax)
 84c:	eb 08                	jmp    856 <free+0xd7>
  } else
    p->s.ptr = bp;
 84e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 851:	8b 55 f8             	mov    -0x8(%ebp),%edx
 854:	89 10                	mov    %edx,(%eax)
  freep = p;
 856:	8b 45 fc             	mov    -0x4(%ebp),%eax
 859:	a3 6c 0c 00 00       	mov    %eax,0xc6c
}
 85e:	c9                   	leave  
 85f:	c3                   	ret    

00000860 <morecore>:

static Header*
morecore(uint nu)
{
 860:	55                   	push   %ebp
 861:	89 e5                	mov    %esp,%ebp
 863:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 866:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 86d:	77 07                	ja     876 <morecore+0x16>
    nu = 4096;
 86f:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 876:	8b 45 08             	mov    0x8(%ebp),%eax
 879:	c1 e0 03             	shl    $0x3,%eax
 87c:	89 04 24             	mov    %eax,(%esp)
 87f:	e8 40 fc ff ff       	call   4c4 <sbrk>
 884:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 887:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 88b:	75 07                	jne    894 <morecore+0x34>
    return 0;
 88d:	b8 00 00 00 00       	mov    $0x0,%eax
 892:	eb 22                	jmp    8b6 <morecore+0x56>
  hp = (Header*)p;
 894:	8b 45 f4             	mov    -0xc(%ebp),%eax
 897:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 89a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 89d:	8b 55 08             	mov    0x8(%ebp),%edx
 8a0:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 8a3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8a6:	83 c0 08             	add    $0x8,%eax
 8a9:	89 04 24             	mov    %eax,(%esp)
 8ac:	e8 ce fe ff ff       	call   77f <free>
  return freep;
 8b1:	a1 6c 0c 00 00       	mov    0xc6c,%eax
}
 8b6:	c9                   	leave  
 8b7:	c3                   	ret    

000008b8 <malloc>:

void*
malloc(uint nbytes)
{
 8b8:	55                   	push   %ebp
 8b9:	89 e5                	mov    %esp,%ebp
 8bb:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8be:	8b 45 08             	mov    0x8(%ebp),%eax
 8c1:	83 c0 07             	add    $0x7,%eax
 8c4:	c1 e8 03             	shr    $0x3,%eax
 8c7:	83 c0 01             	add    $0x1,%eax
 8ca:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 8cd:	a1 6c 0c 00 00       	mov    0xc6c,%eax
 8d2:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8d5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8d9:	75 23                	jne    8fe <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 8db:	c7 45 f0 64 0c 00 00 	movl   $0xc64,-0x10(%ebp)
 8e2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8e5:	a3 6c 0c 00 00       	mov    %eax,0xc6c
 8ea:	a1 6c 0c 00 00       	mov    0xc6c,%eax
 8ef:	a3 64 0c 00 00       	mov    %eax,0xc64
    base.s.size = 0;
 8f4:	c7 05 68 0c 00 00 00 	movl   $0x0,0xc68
 8fb:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8fe:	8b 45 f0             	mov    -0x10(%ebp),%eax
 901:	8b 00                	mov    (%eax),%eax
 903:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 906:	8b 45 f4             	mov    -0xc(%ebp),%eax
 909:	8b 40 04             	mov    0x4(%eax),%eax
 90c:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 90f:	72 4d                	jb     95e <malloc+0xa6>
      if(p->s.size == nunits)
 911:	8b 45 f4             	mov    -0xc(%ebp),%eax
 914:	8b 40 04             	mov    0x4(%eax),%eax
 917:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 91a:	75 0c                	jne    928 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 91c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 91f:	8b 10                	mov    (%eax),%edx
 921:	8b 45 f0             	mov    -0x10(%ebp),%eax
 924:	89 10                	mov    %edx,(%eax)
 926:	eb 26                	jmp    94e <malloc+0x96>
      else {
        p->s.size -= nunits;
 928:	8b 45 f4             	mov    -0xc(%ebp),%eax
 92b:	8b 40 04             	mov    0x4(%eax),%eax
 92e:	2b 45 ec             	sub    -0x14(%ebp),%eax
 931:	89 c2                	mov    %eax,%edx
 933:	8b 45 f4             	mov    -0xc(%ebp),%eax
 936:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 939:	8b 45 f4             	mov    -0xc(%ebp),%eax
 93c:	8b 40 04             	mov    0x4(%eax),%eax
 93f:	c1 e0 03             	shl    $0x3,%eax
 942:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 945:	8b 45 f4             	mov    -0xc(%ebp),%eax
 948:	8b 55 ec             	mov    -0x14(%ebp),%edx
 94b:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 94e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 951:	a3 6c 0c 00 00       	mov    %eax,0xc6c
      return (void*)(p + 1);
 956:	8b 45 f4             	mov    -0xc(%ebp),%eax
 959:	83 c0 08             	add    $0x8,%eax
 95c:	eb 38                	jmp    996 <malloc+0xde>
    }
    if(p == freep)
 95e:	a1 6c 0c 00 00       	mov    0xc6c,%eax
 963:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 966:	75 1b                	jne    983 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 968:	8b 45 ec             	mov    -0x14(%ebp),%eax
 96b:	89 04 24             	mov    %eax,(%esp)
 96e:	e8 ed fe ff ff       	call   860 <morecore>
 973:	89 45 f4             	mov    %eax,-0xc(%ebp)
 976:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 97a:	75 07                	jne    983 <malloc+0xcb>
        return 0;
 97c:	b8 00 00 00 00       	mov    $0x0,%eax
 981:	eb 13                	jmp    996 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 983:	8b 45 f4             	mov    -0xc(%ebp),%eax
 986:	89 45 f0             	mov    %eax,-0x10(%ebp)
 989:	8b 45 f4             	mov    -0xc(%ebp),%eax
 98c:	8b 00                	mov    (%eax),%eax
 98e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 991:	e9 70 ff ff ff       	jmp    906 <malloc+0x4e>
}
 996:	c9                   	leave  
 997:	c3                   	ret    
