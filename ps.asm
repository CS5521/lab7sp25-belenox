
_ps:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "stat.h"
#include "user.h"
int
main(int argc, char * argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
  ps();
   6:	e8 2a 00 00 00       	call   35 <ps>
  exit();
   b:	e8 d5 03 00 00       	call   3e5 <exit>

00000010 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  10:	55                   	push   %ebp
  11:	89 e5                	mov    %esp,%ebp
  13:	57                   	push   %edi
  14:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  15:	8b 4d 08             	mov    0x8(%ebp),%ecx
  18:	8b 55 10             	mov    0x10(%ebp),%edx
  1b:	8b 45 0c             	mov    0xc(%ebp),%eax
  1e:	89 cb                	mov    %ecx,%ebx
  20:	89 df                	mov    %ebx,%edi
  22:	89 d1                	mov    %edx,%ecx
  24:	fc                   	cld    
  25:	f3 aa                	rep stos %al,%es:(%edi)
  27:	89 ca                	mov    %ecx,%edx
  29:	89 fb                	mov    %edi,%ebx
  2b:	89 5d 08             	mov    %ebx,0x8(%ebp)
  2e:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  31:	5b                   	pop    %ebx
  32:	5f                   	pop    %edi
  33:	5d                   	pop    %ebp
  34:	c3                   	ret    

00000035 <ps>:
#include "user.h"
#include "x86.h"
#include "param.h"
#include "pstat.h"

void ps(){
  35:	55                   	push   %ebp
  36:	89 e5                	mov    %esp,%ebp
  38:	57                   	push   %edi
  39:	56                   	push   %esi
  3a:	53                   	push   %ebx
  3b:	81 ec 2c 09 00 00    	sub    $0x92c,%esp
  
  //pstatTable pst = malloc(NPROC * sizeof(pstat_t));
  pstat_t pst[NPROC];
  getpinfo(&pst);
  41:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
  47:	89 04 24             	mov    %eax,(%esp)
  4a:	e8 36 04 00 00       	call   485 <getpinfo>
  int i;
  for (i = 0; i < NPROC; i++){
  4f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  56:	e9 32 01 00 00       	jmp    18d <ps+0x158>
    if (pst[i].inuse == 1){
  5b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  5e:	89 d0                	mov    %edx,%eax
  60:	c1 e0 03             	shl    $0x3,%eax
  63:	01 d0                	add    %edx,%eax
  65:	c1 e0 02             	shl    $0x2,%eax
  68:	8d 5d e8             	lea    -0x18(%ebp),%ebx
  6b:	01 d8                	add    %ebx,%eax
  6d:	2d 04 09 00 00       	sub    $0x904,%eax
  72:	8b 00                	mov    (%eax),%eax
  74:	83 f8 01             	cmp    $0x1,%eax
  77:	0f 85 0c 01 00 00    	jne    189 <ps+0x154>
      printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
  7d:	c7 44 24 04 41 09 00 	movl   $0x941,0x4(%esp)
  84:	00 
  85:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  8c:	e8 e4 04 00 00       	call   575 <printf>
      printf(1, "%d\t", pst[i].pid);
  91:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  94:	89 d0                	mov    %edx,%eax
  96:	c1 e0 03             	shl    $0x3,%eax
  99:	01 d0                	add    %edx,%eax
  9b:	c1 e0 02             	shl    $0x2,%eax
  9e:	8d 75 e8             	lea    -0x18(%ebp),%esi
  a1:	01 f0                	add    %esi,%eax
  a3:	2d fc 08 00 00       	sub    $0x8fc,%eax
  a8:	8b 00                	mov    (%eax),%eax
  aa:	89 44 24 08          	mov    %eax,0x8(%esp)
  ae:	c7 44 24 04 5a 09 00 	movl   $0x95a,0x4(%esp)
  b5:	00 
  b6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  bd:	e8 b3 04 00 00       	call   575 <printf>
      printf(1, "%d\t", pst[i].tickets);
  c2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  c5:	89 d0                	mov    %edx,%eax
  c7:	c1 e0 03             	shl    $0x3,%eax
  ca:	01 d0                	add    %edx,%eax
  cc:	c1 e0 02             	shl    $0x2,%eax
  cf:	8d 7d e8             	lea    -0x18(%ebp),%edi
  d2:	01 f8                	add    %edi,%eax
  d4:	2d 00 09 00 00       	sub    $0x900,%eax
  d9:	8b 00                	mov    (%eax),%eax
  db:	89 44 24 08          	mov    %eax,0x8(%esp)
  df:	c7 44 24 04 5a 09 00 	movl   $0x95a,0x4(%esp)
  e6:	00 
  e7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  ee:	e8 82 04 00 00       	call   575 <printf>
      printf(1, "%d\t", pst[i].ticks);
  f3:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  f6:	89 d0                	mov    %edx,%eax
  f8:	c1 e0 03             	shl    $0x3,%eax
  fb:	01 d0                	add    %edx,%eax
  fd:	c1 e0 02             	shl    $0x2,%eax
 100:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 103:	01 c8                	add    %ecx,%eax
 105:	2d f8 08 00 00       	sub    $0x8f8,%eax
 10a:	8b 00                	mov    (%eax),%eax
 10c:	89 44 24 08          	mov    %eax,0x8(%esp)
 110:	c7 44 24 04 5a 09 00 	movl   $0x95a,0x4(%esp)
 117:	00 
 118:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 11f:	e8 51 04 00 00       	call   575 <printf>
      printf(1, "%c\t", pst[i].state);
 124:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 127:	89 d0                	mov    %edx,%eax
 129:	c1 e0 03             	shl    $0x3,%eax
 12c:	01 d0                	add    %edx,%eax
 12e:	c1 e0 02             	shl    $0x2,%eax
 131:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 134:	01 d8                	add    %ebx,%eax
 136:	2d e4 08 00 00       	sub    $0x8e4,%eax
 13b:	0f b6 00             	movzbl (%eax),%eax
 13e:	0f be c0             	movsbl %al,%eax
 141:	89 44 24 08          	mov    %eax,0x8(%esp)
 145:	c7 44 24 04 5e 09 00 	movl   $0x95e,0x4(%esp)
 14c:	00 
 14d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 154:	e8 1c 04 00 00       	call   575 <printf>
      printf(1, "%s\t\n", pst[i].name);
 159:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 15f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 162:	89 d0                	mov    %edx,%eax
 164:	c1 e0 03             	shl    $0x3,%eax
 167:	01 d0                	add    %edx,%eax
 169:	c1 e0 02             	shl    $0x2,%eax
 16c:	83 c0 10             	add    $0x10,%eax
 16f:	01 c8                	add    %ecx,%eax
 171:	89 44 24 08          	mov    %eax,0x8(%esp)
 175:	c7 44 24 04 62 09 00 	movl   $0x962,0x4(%esp)
 17c:	00 
 17d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 184:	e8 ec 03 00 00       	call   575 <printf>
  for (i = 0; i < NPROC; i++){
 189:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 18d:	83 7d e4 3f          	cmpl   $0x3f,-0x1c(%ebp)
 191:	0f 8e c4 fe ff ff    	jle    5b <ps+0x26>
    }
  }
}
 197:	81 c4 2c 09 00 00    	add    $0x92c,%esp
 19d:	5b                   	pop    %ebx
 19e:	5e                   	pop    %esi
 19f:	5f                   	pop    %edi
 1a0:	5d                   	pop    %ebp
 1a1:	c3                   	ret    

000001a2 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 1a2:	55                   	push   %ebp
 1a3:	89 e5                	mov    %esp,%ebp
 1a5:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 1a8:	8b 45 08             	mov    0x8(%ebp),%eax
 1ab:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 1ae:	90                   	nop
 1af:	8b 45 08             	mov    0x8(%ebp),%eax
 1b2:	8d 50 01             	lea    0x1(%eax),%edx
 1b5:	89 55 08             	mov    %edx,0x8(%ebp)
 1b8:	8b 55 0c             	mov    0xc(%ebp),%edx
 1bb:	8d 4a 01             	lea    0x1(%edx),%ecx
 1be:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 1c1:	0f b6 12             	movzbl (%edx),%edx
 1c4:	88 10                	mov    %dl,(%eax)
 1c6:	0f b6 00             	movzbl (%eax),%eax
 1c9:	84 c0                	test   %al,%al
 1cb:	75 e2                	jne    1af <strcpy+0xd>
    ;
  return os;
 1cd:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1d0:	c9                   	leave  
 1d1:	c3                   	ret    

000001d2 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1d2:	55                   	push   %ebp
 1d3:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 1d5:	eb 08                	jmp    1df <strcmp+0xd>
    p++, q++;
 1d7:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 1db:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 1df:	8b 45 08             	mov    0x8(%ebp),%eax
 1e2:	0f b6 00             	movzbl (%eax),%eax
 1e5:	84 c0                	test   %al,%al
 1e7:	74 10                	je     1f9 <strcmp+0x27>
 1e9:	8b 45 08             	mov    0x8(%ebp),%eax
 1ec:	0f b6 10             	movzbl (%eax),%edx
 1ef:	8b 45 0c             	mov    0xc(%ebp),%eax
 1f2:	0f b6 00             	movzbl (%eax),%eax
 1f5:	38 c2                	cmp    %al,%dl
 1f7:	74 de                	je     1d7 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 1f9:	8b 45 08             	mov    0x8(%ebp),%eax
 1fc:	0f b6 00             	movzbl (%eax),%eax
 1ff:	0f b6 d0             	movzbl %al,%edx
 202:	8b 45 0c             	mov    0xc(%ebp),%eax
 205:	0f b6 00             	movzbl (%eax),%eax
 208:	0f b6 c0             	movzbl %al,%eax
 20b:	29 c2                	sub    %eax,%edx
 20d:	89 d0                	mov    %edx,%eax
}
 20f:	5d                   	pop    %ebp
 210:	c3                   	ret    

00000211 <strlen>:

uint
strlen(const char *s)
{
 211:	55                   	push   %ebp
 212:	89 e5                	mov    %esp,%ebp
 214:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 217:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 21e:	eb 04                	jmp    224 <strlen+0x13>
 220:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 224:	8b 55 fc             	mov    -0x4(%ebp),%edx
 227:	8b 45 08             	mov    0x8(%ebp),%eax
 22a:	01 d0                	add    %edx,%eax
 22c:	0f b6 00             	movzbl (%eax),%eax
 22f:	84 c0                	test   %al,%al
 231:	75 ed                	jne    220 <strlen+0xf>
    ;
  return n;
 233:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 236:	c9                   	leave  
 237:	c3                   	ret    

00000238 <memset>:

void*
memset(void *dst, int c, uint n)
{
 238:	55                   	push   %ebp
 239:	89 e5                	mov    %esp,%ebp
 23b:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 23e:	8b 45 10             	mov    0x10(%ebp),%eax
 241:	89 44 24 08          	mov    %eax,0x8(%esp)
 245:	8b 45 0c             	mov    0xc(%ebp),%eax
 248:	89 44 24 04          	mov    %eax,0x4(%esp)
 24c:	8b 45 08             	mov    0x8(%ebp),%eax
 24f:	89 04 24             	mov    %eax,(%esp)
 252:	e8 b9 fd ff ff       	call   10 <stosb>
  return dst;
 257:	8b 45 08             	mov    0x8(%ebp),%eax
}
 25a:	c9                   	leave  
 25b:	c3                   	ret    

0000025c <strchr>:

char*
strchr(const char *s, char c)
{
 25c:	55                   	push   %ebp
 25d:	89 e5                	mov    %esp,%ebp
 25f:	83 ec 04             	sub    $0x4,%esp
 262:	8b 45 0c             	mov    0xc(%ebp),%eax
 265:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 268:	eb 14                	jmp    27e <strchr+0x22>
    if(*s == c)
 26a:	8b 45 08             	mov    0x8(%ebp),%eax
 26d:	0f b6 00             	movzbl (%eax),%eax
 270:	3a 45 fc             	cmp    -0x4(%ebp),%al
 273:	75 05                	jne    27a <strchr+0x1e>
      return (char*)s;
 275:	8b 45 08             	mov    0x8(%ebp),%eax
 278:	eb 13                	jmp    28d <strchr+0x31>
  for(; *s; s++)
 27a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 27e:	8b 45 08             	mov    0x8(%ebp),%eax
 281:	0f b6 00             	movzbl (%eax),%eax
 284:	84 c0                	test   %al,%al
 286:	75 e2                	jne    26a <strchr+0xe>
  return 0;
 288:	b8 00 00 00 00       	mov    $0x0,%eax
}
 28d:	c9                   	leave  
 28e:	c3                   	ret    

0000028f <gets>:

char*
gets(char *buf, int max)
{
 28f:	55                   	push   %ebp
 290:	89 e5                	mov    %esp,%ebp
 292:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 295:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 29c:	eb 4c                	jmp    2ea <gets+0x5b>
    cc = read(0, &c, 1);
 29e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 2a5:	00 
 2a6:	8d 45 ef             	lea    -0x11(%ebp),%eax
 2a9:	89 44 24 04          	mov    %eax,0x4(%esp)
 2ad:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 2b4:	e8 44 01 00 00       	call   3fd <read>
 2b9:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 2bc:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 2c0:	7f 02                	jg     2c4 <gets+0x35>
      break;
 2c2:	eb 31                	jmp    2f5 <gets+0x66>
    buf[i++] = c;
 2c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2c7:	8d 50 01             	lea    0x1(%eax),%edx
 2ca:	89 55 f4             	mov    %edx,-0xc(%ebp)
 2cd:	89 c2                	mov    %eax,%edx
 2cf:	8b 45 08             	mov    0x8(%ebp),%eax
 2d2:	01 c2                	add    %eax,%edx
 2d4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 2d8:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 2da:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 2de:	3c 0a                	cmp    $0xa,%al
 2e0:	74 13                	je     2f5 <gets+0x66>
 2e2:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 2e6:	3c 0d                	cmp    $0xd,%al
 2e8:	74 0b                	je     2f5 <gets+0x66>
  for(i=0; i+1 < max; ){
 2ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2ed:	83 c0 01             	add    $0x1,%eax
 2f0:	3b 45 0c             	cmp    0xc(%ebp),%eax
 2f3:	7c a9                	jl     29e <gets+0xf>
      break;
  }
  buf[i] = '\0';
 2f5:	8b 55 f4             	mov    -0xc(%ebp),%edx
 2f8:	8b 45 08             	mov    0x8(%ebp),%eax
 2fb:	01 d0                	add    %edx,%eax
 2fd:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 300:	8b 45 08             	mov    0x8(%ebp),%eax
}
 303:	c9                   	leave  
 304:	c3                   	ret    

00000305 <stat>:

int
stat(const char *n, struct stat *st)
{
 305:	55                   	push   %ebp
 306:	89 e5                	mov    %esp,%ebp
 308:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 30b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 312:	00 
 313:	8b 45 08             	mov    0x8(%ebp),%eax
 316:	89 04 24             	mov    %eax,(%esp)
 319:	e8 07 01 00 00       	call   425 <open>
 31e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 321:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 325:	79 07                	jns    32e <stat+0x29>
    return -1;
 327:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 32c:	eb 23                	jmp    351 <stat+0x4c>
  r = fstat(fd, st);
 32e:	8b 45 0c             	mov    0xc(%ebp),%eax
 331:	89 44 24 04          	mov    %eax,0x4(%esp)
 335:	8b 45 f4             	mov    -0xc(%ebp),%eax
 338:	89 04 24             	mov    %eax,(%esp)
 33b:	e8 fd 00 00 00       	call   43d <fstat>
 340:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 343:	8b 45 f4             	mov    -0xc(%ebp),%eax
 346:	89 04 24             	mov    %eax,(%esp)
 349:	e8 bf 00 00 00       	call   40d <close>
  return r;
 34e:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 351:	c9                   	leave  
 352:	c3                   	ret    

00000353 <atoi>:

int
atoi(const char *s)
{
 353:	55                   	push   %ebp
 354:	89 e5                	mov    %esp,%ebp
 356:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 359:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 360:	eb 25                	jmp    387 <atoi+0x34>
    n = n*10 + *s++ - '0';
 362:	8b 55 fc             	mov    -0x4(%ebp),%edx
 365:	89 d0                	mov    %edx,%eax
 367:	c1 e0 02             	shl    $0x2,%eax
 36a:	01 d0                	add    %edx,%eax
 36c:	01 c0                	add    %eax,%eax
 36e:	89 c1                	mov    %eax,%ecx
 370:	8b 45 08             	mov    0x8(%ebp),%eax
 373:	8d 50 01             	lea    0x1(%eax),%edx
 376:	89 55 08             	mov    %edx,0x8(%ebp)
 379:	0f b6 00             	movzbl (%eax),%eax
 37c:	0f be c0             	movsbl %al,%eax
 37f:	01 c8                	add    %ecx,%eax
 381:	83 e8 30             	sub    $0x30,%eax
 384:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 387:	8b 45 08             	mov    0x8(%ebp),%eax
 38a:	0f b6 00             	movzbl (%eax),%eax
 38d:	3c 2f                	cmp    $0x2f,%al
 38f:	7e 0a                	jle    39b <atoi+0x48>
 391:	8b 45 08             	mov    0x8(%ebp),%eax
 394:	0f b6 00             	movzbl (%eax),%eax
 397:	3c 39                	cmp    $0x39,%al
 399:	7e c7                	jle    362 <atoi+0xf>
  return n;
 39b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 39e:	c9                   	leave  
 39f:	c3                   	ret    

000003a0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 3a6:	8b 45 08             	mov    0x8(%ebp),%eax
 3a9:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 3ac:	8b 45 0c             	mov    0xc(%ebp),%eax
 3af:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 3b2:	eb 17                	jmp    3cb <memmove+0x2b>
    *dst++ = *src++;
 3b4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 3b7:	8d 50 01             	lea    0x1(%eax),%edx
 3ba:	89 55 fc             	mov    %edx,-0x4(%ebp)
 3bd:	8b 55 f8             	mov    -0x8(%ebp),%edx
 3c0:	8d 4a 01             	lea    0x1(%edx),%ecx
 3c3:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 3c6:	0f b6 12             	movzbl (%edx),%edx
 3c9:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 3cb:	8b 45 10             	mov    0x10(%ebp),%eax
 3ce:	8d 50 ff             	lea    -0x1(%eax),%edx
 3d1:	89 55 10             	mov    %edx,0x10(%ebp)
 3d4:	85 c0                	test   %eax,%eax
 3d6:	7f dc                	jg     3b4 <memmove+0x14>
  return vdst;
 3d8:	8b 45 08             	mov    0x8(%ebp),%eax
}
 3db:	c9                   	leave  
 3dc:	c3                   	ret    

000003dd <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3dd:	b8 01 00 00 00       	mov    $0x1,%eax
 3e2:	cd 40                	int    $0x40
 3e4:	c3                   	ret    

000003e5 <exit>:
SYSCALL(exit)
 3e5:	b8 02 00 00 00       	mov    $0x2,%eax
 3ea:	cd 40                	int    $0x40
 3ec:	c3                   	ret    

000003ed <wait>:
SYSCALL(wait)
 3ed:	b8 03 00 00 00       	mov    $0x3,%eax
 3f2:	cd 40                	int    $0x40
 3f4:	c3                   	ret    

000003f5 <pipe>:
SYSCALL(pipe)
 3f5:	b8 04 00 00 00       	mov    $0x4,%eax
 3fa:	cd 40                	int    $0x40
 3fc:	c3                   	ret    

000003fd <read>:
SYSCALL(read)
 3fd:	b8 05 00 00 00       	mov    $0x5,%eax
 402:	cd 40                	int    $0x40
 404:	c3                   	ret    

00000405 <write>:
SYSCALL(write)
 405:	b8 10 00 00 00       	mov    $0x10,%eax
 40a:	cd 40                	int    $0x40
 40c:	c3                   	ret    

0000040d <close>:
SYSCALL(close)
 40d:	b8 15 00 00 00       	mov    $0x15,%eax
 412:	cd 40                	int    $0x40
 414:	c3                   	ret    

00000415 <kill>:
SYSCALL(kill)
 415:	b8 06 00 00 00       	mov    $0x6,%eax
 41a:	cd 40                	int    $0x40
 41c:	c3                   	ret    

0000041d <exec>:
SYSCALL(exec)
 41d:	b8 07 00 00 00       	mov    $0x7,%eax
 422:	cd 40                	int    $0x40
 424:	c3                   	ret    

00000425 <open>:
SYSCALL(open)
 425:	b8 0f 00 00 00       	mov    $0xf,%eax
 42a:	cd 40                	int    $0x40
 42c:	c3                   	ret    

0000042d <mknod>:
SYSCALL(mknod)
 42d:	b8 11 00 00 00       	mov    $0x11,%eax
 432:	cd 40                	int    $0x40
 434:	c3                   	ret    

00000435 <unlink>:
SYSCALL(unlink)
 435:	b8 12 00 00 00       	mov    $0x12,%eax
 43a:	cd 40                	int    $0x40
 43c:	c3                   	ret    

0000043d <fstat>:
SYSCALL(fstat)
 43d:	b8 08 00 00 00       	mov    $0x8,%eax
 442:	cd 40                	int    $0x40
 444:	c3                   	ret    

00000445 <link>:
SYSCALL(link)
 445:	b8 13 00 00 00       	mov    $0x13,%eax
 44a:	cd 40                	int    $0x40
 44c:	c3                   	ret    

0000044d <mkdir>:
SYSCALL(mkdir)
 44d:	b8 14 00 00 00       	mov    $0x14,%eax
 452:	cd 40                	int    $0x40
 454:	c3                   	ret    

00000455 <chdir>:
SYSCALL(chdir)
 455:	b8 09 00 00 00       	mov    $0x9,%eax
 45a:	cd 40                	int    $0x40
 45c:	c3                   	ret    

0000045d <dup>:
SYSCALL(dup)
 45d:	b8 0a 00 00 00       	mov    $0xa,%eax
 462:	cd 40                	int    $0x40
 464:	c3                   	ret    

00000465 <getpid>:
SYSCALL(getpid)
 465:	b8 0b 00 00 00       	mov    $0xb,%eax
 46a:	cd 40                	int    $0x40
 46c:	c3                   	ret    

0000046d <sbrk>:
SYSCALL(sbrk)
 46d:	b8 0c 00 00 00       	mov    $0xc,%eax
 472:	cd 40                	int    $0x40
 474:	c3                   	ret    

00000475 <sleep>:
SYSCALL(sleep)
 475:	b8 0d 00 00 00       	mov    $0xd,%eax
 47a:	cd 40                	int    $0x40
 47c:	c3                   	ret    

0000047d <uptime>:
SYSCALL(uptime)
 47d:	b8 0e 00 00 00       	mov    $0xe,%eax
 482:	cd 40                	int    $0x40
 484:	c3                   	ret    

00000485 <getpinfo>:
SYSCALL(getpinfo)
 485:	b8 16 00 00 00       	mov    $0x16,%eax
 48a:	cd 40                	int    $0x40
 48c:	c3                   	ret    

0000048d <settickets>:
SYSCALL(settickets)
 48d:	b8 17 00 00 00       	mov    $0x17,%eax
 492:	cd 40                	int    $0x40
 494:	c3                   	ret    

00000495 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 495:	55                   	push   %ebp
 496:	89 e5                	mov    %esp,%ebp
 498:	83 ec 18             	sub    $0x18,%esp
 49b:	8b 45 0c             	mov    0xc(%ebp),%eax
 49e:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 4a1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4a8:	00 
 4a9:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4ac:	89 44 24 04          	mov    %eax,0x4(%esp)
 4b0:	8b 45 08             	mov    0x8(%ebp),%eax
 4b3:	89 04 24             	mov    %eax,(%esp)
 4b6:	e8 4a ff ff ff       	call   405 <write>
}
 4bb:	c9                   	leave  
 4bc:	c3                   	ret    

000004bd <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4bd:	55                   	push   %ebp
 4be:	89 e5                	mov    %esp,%ebp
 4c0:	56                   	push   %esi
 4c1:	53                   	push   %ebx
 4c2:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 4c5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 4cc:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 4d0:	74 17                	je     4e9 <printint+0x2c>
 4d2:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 4d6:	79 11                	jns    4e9 <printint+0x2c>
    neg = 1;
 4d8:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 4df:	8b 45 0c             	mov    0xc(%ebp),%eax
 4e2:	f7 d8                	neg    %eax
 4e4:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4e7:	eb 06                	jmp    4ef <printint+0x32>
  } else {
    x = xx;
 4e9:	8b 45 0c             	mov    0xc(%ebp),%eax
 4ec:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 4ef:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 4f6:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 4f9:	8d 41 01             	lea    0x1(%ecx),%eax
 4fc:	89 45 f4             	mov    %eax,-0xc(%ebp)
 4ff:	8b 5d 10             	mov    0x10(%ebp),%ebx
 502:	8b 45 ec             	mov    -0x14(%ebp),%eax
 505:	ba 00 00 00 00       	mov    $0x0,%edx
 50a:	f7 f3                	div    %ebx
 50c:	89 d0                	mov    %edx,%eax
 50e:	0f b6 80 e4 0b 00 00 	movzbl 0xbe4(%eax),%eax
 515:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 519:	8b 75 10             	mov    0x10(%ebp),%esi
 51c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 51f:	ba 00 00 00 00       	mov    $0x0,%edx
 524:	f7 f6                	div    %esi
 526:	89 45 ec             	mov    %eax,-0x14(%ebp)
 529:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 52d:	75 c7                	jne    4f6 <printint+0x39>
  if(neg)
 52f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 533:	74 10                	je     545 <printint+0x88>
    buf[i++] = '-';
 535:	8b 45 f4             	mov    -0xc(%ebp),%eax
 538:	8d 50 01             	lea    0x1(%eax),%edx
 53b:	89 55 f4             	mov    %edx,-0xc(%ebp)
 53e:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 543:	eb 1f                	jmp    564 <printint+0xa7>
 545:	eb 1d                	jmp    564 <printint+0xa7>
    putc(fd, buf[i]);
 547:	8d 55 dc             	lea    -0x24(%ebp),%edx
 54a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 54d:	01 d0                	add    %edx,%eax
 54f:	0f b6 00             	movzbl (%eax),%eax
 552:	0f be c0             	movsbl %al,%eax
 555:	89 44 24 04          	mov    %eax,0x4(%esp)
 559:	8b 45 08             	mov    0x8(%ebp),%eax
 55c:	89 04 24             	mov    %eax,(%esp)
 55f:	e8 31 ff ff ff       	call   495 <putc>
  while(--i >= 0)
 564:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 568:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 56c:	79 d9                	jns    547 <printint+0x8a>
}
 56e:	83 c4 30             	add    $0x30,%esp
 571:	5b                   	pop    %ebx
 572:	5e                   	pop    %esi
 573:	5d                   	pop    %ebp
 574:	c3                   	ret    

00000575 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 575:	55                   	push   %ebp
 576:	89 e5                	mov    %esp,%ebp
 578:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 57b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 582:	8d 45 0c             	lea    0xc(%ebp),%eax
 585:	83 c0 04             	add    $0x4,%eax
 588:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 58b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 592:	e9 7c 01 00 00       	jmp    713 <printf+0x19e>
    c = fmt[i] & 0xff;
 597:	8b 55 0c             	mov    0xc(%ebp),%edx
 59a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 59d:	01 d0                	add    %edx,%eax
 59f:	0f b6 00             	movzbl (%eax),%eax
 5a2:	0f be c0             	movsbl %al,%eax
 5a5:	25 ff 00 00 00       	and    $0xff,%eax
 5aa:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 5ad:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5b1:	75 2c                	jne    5df <printf+0x6a>
      if(c == '%'){
 5b3:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5b7:	75 0c                	jne    5c5 <printf+0x50>
        state = '%';
 5b9:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 5c0:	e9 4a 01 00 00       	jmp    70f <printf+0x19a>
      } else {
        putc(fd, c);
 5c5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5c8:	0f be c0             	movsbl %al,%eax
 5cb:	89 44 24 04          	mov    %eax,0x4(%esp)
 5cf:	8b 45 08             	mov    0x8(%ebp),%eax
 5d2:	89 04 24             	mov    %eax,(%esp)
 5d5:	e8 bb fe ff ff       	call   495 <putc>
 5da:	e9 30 01 00 00       	jmp    70f <printf+0x19a>
      }
    } else if(state == '%'){
 5df:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 5e3:	0f 85 26 01 00 00    	jne    70f <printf+0x19a>
      if(c == 'd'){
 5e9:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 5ed:	75 2d                	jne    61c <printf+0xa7>
        printint(fd, *ap, 10, 1);
 5ef:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5f2:	8b 00                	mov    (%eax),%eax
 5f4:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 5fb:	00 
 5fc:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 603:	00 
 604:	89 44 24 04          	mov    %eax,0x4(%esp)
 608:	8b 45 08             	mov    0x8(%ebp),%eax
 60b:	89 04 24             	mov    %eax,(%esp)
 60e:	e8 aa fe ff ff       	call   4bd <printint>
        ap++;
 613:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 617:	e9 ec 00 00 00       	jmp    708 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 61c:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 620:	74 06                	je     628 <printf+0xb3>
 622:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 626:	75 2d                	jne    655 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 628:	8b 45 e8             	mov    -0x18(%ebp),%eax
 62b:	8b 00                	mov    (%eax),%eax
 62d:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 634:	00 
 635:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 63c:	00 
 63d:	89 44 24 04          	mov    %eax,0x4(%esp)
 641:	8b 45 08             	mov    0x8(%ebp),%eax
 644:	89 04 24             	mov    %eax,(%esp)
 647:	e8 71 fe ff ff       	call   4bd <printint>
        ap++;
 64c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 650:	e9 b3 00 00 00       	jmp    708 <printf+0x193>
      } else if(c == 's'){
 655:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 659:	75 45                	jne    6a0 <printf+0x12b>
        s = (char*)*ap;
 65b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 65e:	8b 00                	mov    (%eax),%eax
 660:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 663:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 667:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 66b:	75 09                	jne    676 <printf+0x101>
          s = "(null)";
 66d:	c7 45 f4 67 09 00 00 	movl   $0x967,-0xc(%ebp)
        while(*s != 0){
 674:	eb 1e                	jmp    694 <printf+0x11f>
 676:	eb 1c                	jmp    694 <printf+0x11f>
          putc(fd, *s);
 678:	8b 45 f4             	mov    -0xc(%ebp),%eax
 67b:	0f b6 00             	movzbl (%eax),%eax
 67e:	0f be c0             	movsbl %al,%eax
 681:	89 44 24 04          	mov    %eax,0x4(%esp)
 685:	8b 45 08             	mov    0x8(%ebp),%eax
 688:	89 04 24             	mov    %eax,(%esp)
 68b:	e8 05 fe ff ff       	call   495 <putc>
          s++;
 690:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 694:	8b 45 f4             	mov    -0xc(%ebp),%eax
 697:	0f b6 00             	movzbl (%eax),%eax
 69a:	84 c0                	test   %al,%al
 69c:	75 da                	jne    678 <printf+0x103>
 69e:	eb 68                	jmp    708 <printf+0x193>
        }
      } else if(c == 'c'){
 6a0:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 6a4:	75 1d                	jne    6c3 <printf+0x14e>
        putc(fd, *ap);
 6a6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6a9:	8b 00                	mov    (%eax),%eax
 6ab:	0f be c0             	movsbl %al,%eax
 6ae:	89 44 24 04          	mov    %eax,0x4(%esp)
 6b2:	8b 45 08             	mov    0x8(%ebp),%eax
 6b5:	89 04 24             	mov    %eax,(%esp)
 6b8:	e8 d8 fd ff ff       	call   495 <putc>
        ap++;
 6bd:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6c1:	eb 45                	jmp    708 <printf+0x193>
      } else if(c == '%'){
 6c3:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 6c7:	75 17                	jne    6e0 <printf+0x16b>
        putc(fd, c);
 6c9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6cc:	0f be c0             	movsbl %al,%eax
 6cf:	89 44 24 04          	mov    %eax,0x4(%esp)
 6d3:	8b 45 08             	mov    0x8(%ebp),%eax
 6d6:	89 04 24             	mov    %eax,(%esp)
 6d9:	e8 b7 fd ff ff       	call   495 <putc>
 6de:	eb 28                	jmp    708 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 6e0:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 6e7:	00 
 6e8:	8b 45 08             	mov    0x8(%ebp),%eax
 6eb:	89 04 24             	mov    %eax,(%esp)
 6ee:	e8 a2 fd ff ff       	call   495 <putc>
        putc(fd, c);
 6f3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6f6:	0f be c0             	movsbl %al,%eax
 6f9:	89 44 24 04          	mov    %eax,0x4(%esp)
 6fd:	8b 45 08             	mov    0x8(%ebp),%eax
 700:	89 04 24             	mov    %eax,(%esp)
 703:	e8 8d fd ff ff       	call   495 <putc>
      }
      state = 0;
 708:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 70f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 713:	8b 55 0c             	mov    0xc(%ebp),%edx
 716:	8b 45 f0             	mov    -0x10(%ebp),%eax
 719:	01 d0                	add    %edx,%eax
 71b:	0f b6 00             	movzbl (%eax),%eax
 71e:	84 c0                	test   %al,%al
 720:	0f 85 71 fe ff ff    	jne    597 <printf+0x22>
    }
  }
}
 726:	c9                   	leave  
 727:	c3                   	ret    

00000728 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 728:	55                   	push   %ebp
 729:	89 e5                	mov    %esp,%ebp
 72b:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 72e:	8b 45 08             	mov    0x8(%ebp),%eax
 731:	83 e8 08             	sub    $0x8,%eax
 734:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 737:	a1 00 0c 00 00       	mov    0xc00,%eax
 73c:	89 45 fc             	mov    %eax,-0x4(%ebp)
 73f:	eb 24                	jmp    765 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 741:	8b 45 fc             	mov    -0x4(%ebp),%eax
 744:	8b 00                	mov    (%eax),%eax
 746:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 749:	77 12                	ja     75d <free+0x35>
 74b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 74e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 751:	77 24                	ja     777 <free+0x4f>
 753:	8b 45 fc             	mov    -0x4(%ebp),%eax
 756:	8b 00                	mov    (%eax),%eax
 758:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 75b:	77 1a                	ja     777 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 75d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 760:	8b 00                	mov    (%eax),%eax
 762:	89 45 fc             	mov    %eax,-0x4(%ebp)
 765:	8b 45 f8             	mov    -0x8(%ebp),%eax
 768:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 76b:	76 d4                	jbe    741 <free+0x19>
 76d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 770:	8b 00                	mov    (%eax),%eax
 772:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 775:	76 ca                	jbe    741 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 777:	8b 45 f8             	mov    -0x8(%ebp),%eax
 77a:	8b 40 04             	mov    0x4(%eax),%eax
 77d:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 784:	8b 45 f8             	mov    -0x8(%ebp),%eax
 787:	01 c2                	add    %eax,%edx
 789:	8b 45 fc             	mov    -0x4(%ebp),%eax
 78c:	8b 00                	mov    (%eax),%eax
 78e:	39 c2                	cmp    %eax,%edx
 790:	75 24                	jne    7b6 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 792:	8b 45 f8             	mov    -0x8(%ebp),%eax
 795:	8b 50 04             	mov    0x4(%eax),%edx
 798:	8b 45 fc             	mov    -0x4(%ebp),%eax
 79b:	8b 00                	mov    (%eax),%eax
 79d:	8b 40 04             	mov    0x4(%eax),%eax
 7a0:	01 c2                	add    %eax,%edx
 7a2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7a5:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 7a8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ab:	8b 00                	mov    (%eax),%eax
 7ad:	8b 10                	mov    (%eax),%edx
 7af:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7b2:	89 10                	mov    %edx,(%eax)
 7b4:	eb 0a                	jmp    7c0 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 7b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b9:	8b 10                	mov    (%eax),%edx
 7bb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7be:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 7c0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c3:	8b 40 04             	mov    0x4(%eax),%eax
 7c6:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7cd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d0:	01 d0                	add    %edx,%eax
 7d2:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7d5:	75 20                	jne    7f7 <free+0xcf>
    p->s.size += bp->s.size;
 7d7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7da:	8b 50 04             	mov    0x4(%eax),%edx
 7dd:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7e0:	8b 40 04             	mov    0x4(%eax),%eax
 7e3:	01 c2                	add    %eax,%edx
 7e5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e8:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7eb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7ee:	8b 10                	mov    (%eax),%edx
 7f0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f3:	89 10                	mov    %edx,(%eax)
 7f5:	eb 08                	jmp    7ff <free+0xd7>
  } else
    p->s.ptr = bp;
 7f7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7fa:	8b 55 f8             	mov    -0x8(%ebp),%edx
 7fd:	89 10                	mov    %edx,(%eax)
  freep = p;
 7ff:	8b 45 fc             	mov    -0x4(%ebp),%eax
 802:	a3 00 0c 00 00       	mov    %eax,0xc00
}
 807:	c9                   	leave  
 808:	c3                   	ret    

00000809 <morecore>:

static Header*
morecore(uint nu)
{
 809:	55                   	push   %ebp
 80a:	89 e5                	mov    %esp,%ebp
 80c:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 80f:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 816:	77 07                	ja     81f <morecore+0x16>
    nu = 4096;
 818:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 81f:	8b 45 08             	mov    0x8(%ebp),%eax
 822:	c1 e0 03             	shl    $0x3,%eax
 825:	89 04 24             	mov    %eax,(%esp)
 828:	e8 40 fc ff ff       	call   46d <sbrk>
 82d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 830:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 834:	75 07                	jne    83d <morecore+0x34>
    return 0;
 836:	b8 00 00 00 00       	mov    $0x0,%eax
 83b:	eb 22                	jmp    85f <morecore+0x56>
  hp = (Header*)p;
 83d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 840:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 843:	8b 45 f0             	mov    -0x10(%ebp),%eax
 846:	8b 55 08             	mov    0x8(%ebp),%edx
 849:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 84c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 84f:	83 c0 08             	add    $0x8,%eax
 852:	89 04 24             	mov    %eax,(%esp)
 855:	e8 ce fe ff ff       	call   728 <free>
  return freep;
 85a:	a1 00 0c 00 00       	mov    0xc00,%eax
}
 85f:	c9                   	leave  
 860:	c3                   	ret    

00000861 <malloc>:

void*
malloc(uint nbytes)
{
 861:	55                   	push   %ebp
 862:	89 e5                	mov    %esp,%ebp
 864:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 867:	8b 45 08             	mov    0x8(%ebp),%eax
 86a:	83 c0 07             	add    $0x7,%eax
 86d:	c1 e8 03             	shr    $0x3,%eax
 870:	83 c0 01             	add    $0x1,%eax
 873:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 876:	a1 00 0c 00 00       	mov    0xc00,%eax
 87b:	89 45 f0             	mov    %eax,-0x10(%ebp)
 87e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 882:	75 23                	jne    8a7 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 884:	c7 45 f0 f8 0b 00 00 	movl   $0xbf8,-0x10(%ebp)
 88b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 88e:	a3 00 0c 00 00       	mov    %eax,0xc00
 893:	a1 00 0c 00 00       	mov    0xc00,%eax
 898:	a3 f8 0b 00 00       	mov    %eax,0xbf8
    base.s.size = 0;
 89d:	c7 05 fc 0b 00 00 00 	movl   $0x0,0xbfc
 8a4:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8a7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8aa:	8b 00                	mov    (%eax),%eax
 8ac:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 8af:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8b2:	8b 40 04             	mov    0x4(%eax),%eax
 8b5:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8b8:	72 4d                	jb     907 <malloc+0xa6>
      if(p->s.size == nunits)
 8ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8bd:	8b 40 04             	mov    0x4(%eax),%eax
 8c0:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8c3:	75 0c                	jne    8d1 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 8c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8c8:	8b 10                	mov    (%eax),%edx
 8ca:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8cd:	89 10                	mov    %edx,(%eax)
 8cf:	eb 26                	jmp    8f7 <malloc+0x96>
      else {
        p->s.size -= nunits;
 8d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8d4:	8b 40 04             	mov    0x4(%eax),%eax
 8d7:	2b 45 ec             	sub    -0x14(%ebp),%eax
 8da:	89 c2                	mov    %eax,%edx
 8dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8df:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8e5:	8b 40 04             	mov    0x4(%eax),%eax
 8e8:	c1 e0 03             	shl    $0x3,%eax
 8eb:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 8ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8f1:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8f4:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 8f7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8fa:	a3 00 0c 00 00       	mov    %eax,0xc00
      return (void*)(p + 1);
 8ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
 902:	83 c0 08             	add    $0x8,%eax
 905:	eb 38                	jmp    93f <malloc+0xde>
    }
    if(p == freep)
 907:	a1 00 0c 00 00       	mov    0xc00,%eax
 90c:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 90f:	75 1b                	jne    92c <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 911:	8b 45 ec             	mov    -0x14(%ebp),%eax
 914:	89 04 24             	mov    %eax,(%esp)
 917:	e8 ed fe ff ff       	call   809 <morecore>
 91c:	89 45 f4             	mov    %eax,-0xc(%ebp)
 91f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 923:	75 07                	jne    92c <malloc+0xcb>
        return 0;
 925:	b8 00 00 00 00       	mov    $0x0,%eax
 92a:	eb 13                	jmp    93f <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 92c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 92f:	89 45 f0             	mov    %eax,-0x10(%ebp)
 932:	8b 45 f4             	mov    -0xc(%ebp),%eax
 935:	8b 00                	mov    (%eax),%eax
 937:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 93a:	e9 70 ff ff ff       	jmp    8af <malloc+0x4e>
}
 93f:	c9                   	leave  
 940:	c3                   	ret    
