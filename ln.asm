
_ln:     file format elf32-i386


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
   6:	83 ec 10             	sub    $0x10,%esp
  if(argc != 3){
   9:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
   d:	74 19                	je     28 <main+0x28>
    printf(2, "Usage: ln old new\n");
   f:	c7 44 24 04 aa 09 00 	movl   $0x9aa,0x4(%esp)
  16:	00 
  17:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  1e:	e8 bb 05 00 00       	call   5de <printf>
    exit();
  23:	e8 26 04 00 00       	call   44e <exit>
  }
  if(link(argv[1], argv[2]) < 0)
  28:	8b 45 0c             	mov    0xc(%ebp),%eax
  2b:	83 c0 08             	add    $0x8,%eax
  2e:	8b 10                	mov    (%eax),%edx
  30:	8b 45 0c             	mov    0xc(%ebp),%eax
  33:	83 c0 04             	add    $0x4,%eax
  36:	8b 00                	mov    (%eax),%eax
  38:	89 54 24 04          	mov    %edx,0x4(%esp)
  3c:	89 04 24             	mov    %eax,(%esp)
  3f:	e8 6a 04 00 00       	call   4ae <link>
  44:	85 c0                	test   %eax,%eax
  46:	79 2c                	jns    74 <main+0x74>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  48:	8b 45 0c             	mov    0xc(%ebp),%eax
  4b:	83 c0 08             	add    $0x8,%eax
  4e:	8b 10                	mov    (%eax),%edx
  50:	8b 45 0c             	mov    0xc(%ebp),%eax
  53:	83 c0 04             	add    $0x4,%eax
  56:	8b 00                	mov    (%eax),%eax
  58:	89 54 24 0c          	mov    %edx,0xc(%esp)
  5c:	89 44 24 08          	mov    %eax,0x8(%esp)
  60:	c7 44 24 04 bd 09 00 	movl   $0x9bd,0x4(%esp)
  67:	00 
  68:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  6f:	e8 6a 05 00 00       	call   5de <printf>
  exit();
  74:	e8 d5 03 00 00       	call   44e <exit>

00000079 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  79:	55                   	push   %ebp
  7a:	89 e5                	mov    %esp,%ebp
  7c:	57                   	push   %edi
  7d:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  7e:	8b 4d 08             	mov    0x8(%ebp),%ecx
  81:	8b 55 10             	mov    0x10(%ebp),%edx
  84:	8b 45 0c             	mov    0xc(%ebp),%eax
  87:	89 cb                	mov    %ecx,%ebx
  89:	89 df                	mov    %ebx,%edi
  8b:	89 d1                	mov    %edx,%ecx
  8d:	fc                   	cld    
  8e:	f3 aa                	rep stos %al,%es:(%edi)
  90:	89 ca                	mov    %ecx,%edx
  92:	89 fb                	mov    %edi,%ebx
  94:	89 5d 08             	mov    %ebx,0x8(%ebp)
  97:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  9a:	5b                   	pop    %ebx
  9b:	5f                   	pop    %edi
  9c:	5d                   	pop    %ebp
  9d:	c3                   	ret    

0000009e <ps>:
#include "user.h"
#include "x86.h"
#include "param.h"
#include "pstat.h"

void ps(){
  9e:	55                   	push   %ebp
  9f:	89 e5                	mov    %esp,%ebp
  a1:	57                   	push   %edi
  a2:	56                   	push   %esi
  a3:	53                   	push   %ebx
  a4:	81 ec 2c 09 00 00    	sub    $0x92c,%esp
  
  //pstatTable pst = malloc(NPROC * sizeof(pstat_t));
  pstat_t pst[NPROC];
  getpinfo(&pst);
  aa:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
  b0:	89 04 24             	mov    %eax,(%esp)
  b3:	e8 36 04 00 00       	call   4ee <getpinfo>
  int i;
  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
  b8:	c7 44 24 04 d1 09 00 	movl   $0x9d1,0x4(%esp)
  bf:	00 
  c0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  c7:	e8 12 05 00 00       	call   5de <printf>
  for (i = 0; i < NPROC; i++){
  cc:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  d3:	e9 1e 01 00 00       	jmp    1f6 <ps+0x158>
    if (pst[i].inuse == 1){
  d8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  db:	89 d0                	mov    %edx,%eax
  dd:	c1 e0 03             	shl    $0x3,%eax
  e0:	01 d0                	add    %edx,%eax
  e2:	c1 e0 02             	shl    $0x2,%eax
  e5:	8d 5d e8             	lea    -0x18(%ebp),%ebx
  e8:	01 d8                	add    %ebx,%eax
  ea:	2d 04 09 00 00       	sub    $0x904,%eax
  ef:	8b 00                	mov    (%eax),%eax
  f1:	83 f8 01             	cmp    $0x1,%eax
  f4:	0f 85 f8 00 00 00    	jne    1f2 <ps+0x154>
      printf(1, "%d\t", pst[i].pid);
  fa:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  fd:	89 d0                	mov    %edx,%eax
  ff:	c1 e0 03             	shl    $0x3,%eax
 102:	01 d0                	add    %edx,%eax
 104:	c1 e0 02             	shl    $0x2,%eax
 107:	8d 75 e8             	lea    -0x18(%ebp),%esi
 10a:	01 f0                	add    %esi,%eax
 10c:	2d fc 08 00 00       	sub    $0x8fc,%eax
 111:	8b 00                	mov    (%eax),%eax
 113:	89 44 24 08          	mov    %eax,0x8(%esp)
 117:	c7 44 24 04 ea 09 00 	movl   $0x9ea,0x4(%esp)
 11e:	00 
 11f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 126:	e8 b3 04 00 00       	call   5de <printf>
      printf(1, "%d\t", pst[i].tickets);
 12b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 12e:	89 d0                	mov    %edx,%eax
 130:	c1 e0 03             	shl    $0x3,%eax
 133:	01 d0                	add    %edx,%eax
 135:	c1 e0 02             	shl    $0x2,%eax
 138:	8d 7d e8             	lea    -0x18(%ebp),%edi
 13b:	01 f8                	add    %edi,%eax
 13d:	2d 00 09 00 00       	sub    $0x900,%eax
 142:	8b 00                	mov    (%eax),%eax
 144:	89 44 24 08          	mov    %eax,0x8(%esp)
 148:	c7 44 24 04 ea 09 00 	movl   $0x9ea,0x4(%esp)
 14f:	00 
 150:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 157:	e8 82 04 00 00       	call   5de <printf>
      printf(1, "%d\t", pst[i].ticks);
 15c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 15f:	89 d0                	mov    %edx,%eax
 161:	c1 e0 03             	shl    $0x3,%eax
 164:	01 d0                	add    %edx,%eax
 166:	c1 e0 02             	shl    $0x2,%eax
 169:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 16c:	01 c8                	add    %ecx,%eax
 16e:	2d f8 08 00 00       	sub    $0x8f8,%eax
 173:	8b 00                	mov    (%eax),%eax
 175:	89 44 24 08          	mov    %eax,0x8(%esp)
 179:	c7 44 24 04 ea 09 00 	movl   $0x9ea,0x4(%esp)
 180:	00 
 181:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 188:	e8 51 04 00 00       	call   5de <printf>
      printf(1, "%c\t", pst[i].state);
 18d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 190:	89 d0                	mov    %edx,%eax
 192:	c1 e0 03             	shl    $0x3,%eax
 195:	01 d0                	add    %edx,%eax
 197:	c1 e0 02             	shl    $0x2,%eax
 19a:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 19d:	01 d8                	add    %ebx,%eax
 19f:	2d e4 08 00 00       	sub    $0x8e4,%eax
 1a4:	0f b6 00             	movzbl (%eax),%eax
 1a7:	0f be c0             	movsbl %al,%eax
 1aa:	89 44 24 08          	mov    %eax,0x8(%esp)
 1ae:	c7 44 24 04 ee 09 00 	movl   $0x9ee,0x4(%esp)
 1b5:	00 
 1b6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1bd:	e8 1c 04 00 00       	call   5de <printf>
      printf(1, "%s\t\n", pst[i].name);
 1c2:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 1c8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 1cb:	89 d0                	mov    %edx,%eax
 1cd:	c1 e0 03             	shl    $0x3,%eax
 1d0:	01 d0                	add    %edx,%eax
 1d2:	c1 e0 02             	shl    $0x2,%eax
 1d5:	83 c0 10             	add    $0x10,%eax
 1d8:	01 c8                	add    %ecx,%eax
 1da:	89 44 24 08          	mov    %eax,0x8(%esp)
 1de:	c7 44 24 04 f2 09 00 	movl   $0x9f2,0x4(%esp)
 1e5:	00 
 1e6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1ed:	e8 ec 03 00 00       	call   5de <printf>
  for (i = 0; i < NPROC; i++){
 1f2:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 1f6:	83 7d e4 3f          	cmpl   $0x3f,-0x1c(%ebp)
 1fa:	0f 8e d8 fe ff ff    	jle    d8 <ps+0x3a>
    }
  }
}
 200:	81 c4 2c 09 00 00    	add    $0x92c,%esp
 206:	5b                   	pop    %ebx
 207:	5e                   	pop    %esi
 208:	5f                   	pop    %edi
 209:	5d                   	pop    %ebp
 20a:	c3                   	ret    

0000020b <strcpy>:

char*
strcpy(char *s, const char *t)
{
 20b:	55                   	push   %ebp
 20c:	89 e5                	mov    %esp,%ebp
 20e:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 211:	8b 45 08             	mov    0x8(%ebp),%eax
 214:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 217:	90                   	nop
 218:	8b 45 08             	mov    0x8(%ebp),%eax
 21b:	8d 50 01             	lea    0x1(%eax),%edx
 21e:	89 55 08             	mov    %edx,0x8(%ebp)
 221:	8b 55 0c             	mov    0xc(%ebp),%edx
 224:	8d 4a 01             	lea    0x1(%edx),%ecx
 227:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 22a:	0f b6 12             	movzbl (%edx),%edx
 22d:	88 10                	mov    %dl,(%eax)
 22f:	0f b6 00             	movzbl (%eax),%eax
 232:	84 c0                	test   %al,%al
 234:	75 e2                	jne    218 <strcpy+0xd>
    ;
  return os;
 236:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 239:	c9                   	leave  
 23a:	c3                   	ret    

0000023b <strcmp>:

int
strcmp(const char *p, const char *q)
{
 23b:	55                   	push   %ebp
 23c:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 23e:	eb 08                	jmp    248 <strcmp+0xd>
    p++, q++;
 240:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 244:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 248:	8b 45 08             	mov    0x8(%ebp),%eax
 24b:	0f b6 00             	movzbl (%eax),%eax
 24e:	84 c0                	test   %al,%al
 250:	74 10                	je     262 <strcmp+0x27>
 252:	8b 45 08             	mov    0x8(%ebp),%eax
 255:	0f b6 10             	movzbl (%eax),%edx
 258:	8b 45 0c             	mov    0xc(%ebp),%eax
 25b:	0f b6 00             	movzbl (%eax),%eax
 25e:	38 c2                	cmp    %al,%dl
 260:	74 de                	je     240 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 262:	8b 45 08             	mov    0x8(%ebp),%eax
 265:	0f b6 00             	movzbl (%eax),%eax
 268:	0f b6 d0             	movzbl %al,%edx
 26b:	8b 45 0c             	mov    0xc(%ebp),%eax
 26e:	0f b6 00             	movzbl (%eax),%eax
 271:	0f b6 c0             	movzbl %al,%eax
 274:	29 c2                	sub    %eax,%edx
 276:	89 d0                	mov    %edx,%eax
}
 278:	5d                   	pop    %ebp
 279:	c3                   	ret    

0000027a <strlen>:

uint
strlen(const char *s)
{
 27a:	55                   	push   %ebp
 27b:	89 e5                	mov    %esp,%ebp
 27d:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 280:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 287:	eb 04                	jmp    28d <strlen+0x13>
 289:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 28d:	8b 55 fc             	mov    -0x4(%ebp),%edx
 290:	8b 45 08             	mov    0x8(%ebp),%eax
 293:	01 d0                	add    %edx,%eax
 295:	0f b6 00             	movzbl (%eax),%eax
 298:	84 c0                	test   %al,%al
 29a:	75 ed                	jne    289 <strlen+0xf>
    ;
  return n;
 29c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 29f:	c9                   	leave  
 2a0:	c3                   	ret    

000002a1 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2a1:	55                   	push   %ebp
 2a2:	89 e5                	mov    %esp,%ebp
 2a4:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 2a7:	8b 45 10             	mov    0x10(%ebp),%eax
 2aa:	89 44 24 08          	mov    %eax,0x8(%esp)
 2ae:	8b 45 0c             	mov    0xc(%ebp),%eax
 2b1:	89 44 24 04          	mov    %eax,0x4(%esp)
 2b5:	8b 45 08             	mov    0x8(%ebp),%eax
 2b8:	89 04 24             	mov    %eax,(%esp)
 2bb:	e8 b9 fd ff ff       	call   79 <stosb>
  return dst;
 2c0:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2c3:	c9                   	leave  
 2c4:	c3                   	ret    

000002c5 <strchr>:

char*
strchr(const char *s, char c)
{
 2c5:	55                   	push   %ebp
 2c6:	89 e5                	mov    %esp,%ebp
 2c8:	83 ec 04             	sub    $0x4,%esp
 2cb:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ce:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 2d1:	eb 14                	jmp    2e7 <strchr+0x22>
    if(*s == c)
 2d3:	8b 45 08             	mov    0x8(%ebp),%eax
 2d6:	0f b6 00             	movzbl (%eax),%eax
 2d9:	3a 45 fc             	cmp    -0x4(%ebp),%al
 2dc:	75 05                	jne    2e3 <strchr+0x1e>
      return (char*)s;
 2de:	8b 45 08             	mov    0x8(%ebp),%eax
 2e1:	eb 13                	jmp    2f6 <strchr+0x31>
  for(; *s; s++)
 2e3:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2e7:	8b 45 08             	mov    0x8(%ebp),%eax
 2ea:	0f b6 00             	movzbl (%eax),%eax
 2ed:	84 c0                	test   %al,%al
 2ef:	75 e2                	jne    2d3 <strchr+0xe>
  return 0;
 2f1:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2f6:	c9                   	leave  
 2f7:	c3                   	ret    

000002f8 <gets>:

char*
gets(char *buf, int max)
{
 2f8:	55                   	push   %ebp
 2f9:	89 e5                	mov    %esp,%ebp
 2fb:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2fe:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 305:	eb 4c                	jmp    353 <gets+0x5b>
    cc = read(0, &c, 1);
 307:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 30e:	00 
 30f:	8d 45 ef             	lea    -0x11(%ebp),%eax
 312:	89 44 24 04          	mov    %eax,0x4(%esp)
 316:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 31d:	e8 44 01 00 00       	call   466 <read>
 322:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 325:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 329:	7f 02                	jg     32d <gets+0x35>
      break;
 32b:	eb 31                	jmp    35e <gets+0x66>
    buf[i++] = c;
 32d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 330:	8d 50 01             	lea    0x1(%eax),%edx
 333:	89 55 f4             	mov    %edx,-0xc(%ebp)
 336:	89 c2                	mov    %eax,%edx
 338:	8b 45 08             	mov    0x8(%ebp),%eax
 33b:	01 c2                	add    %eax,%edx
 33d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 341:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 343:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 347:	3c 0a                	cmp    $0xa,%al
 349:	74 13                	je     35e <gets+0x66>
 34b:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 34f:	3c 0d                	cmp    $0xd,%al
 351:	74 0b                	je     35e <gets+0x66>
  for(i=0; i+1 < max; ){
 353:	8b 45 f4             	mov    -0xc(%ebp),%eax
 356:	83 c0 01             	add    $0x1,%eax
 359:	3b 45 0c             	cmp    0xc(%ebp),%eax
 35c:	7c a9                	jl     307 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 35e:	8b 55 f4             	mov    -0xc(%ebp),%edx
 361:	8b 45 08             	mov    0x8(%ebp),%eax
 364:	01 d0                	add    %edx,%eax
 366:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 369:	8b 45 08             	mov    0x8(%ebp),%eax
}
 36c:	c9                   	leave  
 36d:	c3                   	ret    

0000036e <stat>:

int
stat(const char *n, struct stat *st)
{
 36e:	55                   	push   %ebp
 36f:	89 e5                	mov    %esp,%ebp
 371:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 374:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 37b:	00 
 37c:	8b 45 08             	mov    0x8(%ebp),%eax
 37f:	89 04 24             	mov    %eax,(%esp)
 382:	e8 07 01 00 00       	call   48e <open>
 387:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 38a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 38e:	79 07                	jns    397 <stat+0x29>
    return -1;
 390:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 395:	eb 23                	jmp    3ba <stat+0x4c>
  r = fstat(fd, st);
 397:	8b 45 0c             	mov    0xc(%ebp),%eax
 39a:	89 44 24 04          	mov    %eax,0x4(%esp)
 39e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3a1:	89 04 24             	mov    %eax,(%esp)
 3a4:	e8 fd 00 00 00       	call   4a6 <fstat>
 3a9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 3ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3af:	89 04 24             	mov    %eax,(%esp)
 3b2:	e8 bf 00 00 00       	call   476 <close>
  return r;
 3b7:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 3ba:	c9                   	leave  
 3bb:	c3                   	ret    

000003bc <atoi>:

int
atoi(const char *s)
{
 3bc:	55                   	push   %ebp
 3bd:	89 e5                	mov    %esp,%ebp
 3bf:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 3c2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 3c9:	eb 25                	jmp    3f0 <atoi+0x34>
    n = n*10 + *s++ - '0';
 3cb:	8b 55 fc             	mov    -0x4(%ebp),%edx
 3ce:	89 d0                	mov    %edx,%eax
 3d0:	c1 e0 02             	shl    $0x2,%eax
 3d3:	01 d0                	add    %edx,%eax
 3d5:	01 c0                	add    %eax,%eax
 3d7:	89 c1                	mov    %eax,%ecx
 3d9:	8b 45 08             	mov    0x8(%ebp),%eax
 3dc:	8d 50 01             	lea    0x1(%eax),%edx
 3df:	89 55 08             	mov    %edx,0x8(%ebp)
 3e2:	0f b6 00             	movzbl (%eax),%eax
 3e5:	0f be c0             	movsbl %al,%eax
 3e8:	01 c8                	add    %ecx,%eax
 3ea:	83 e8 30             	sub    $0x30,%eax
 3ed:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 3f0:	8b 45 08             	mov    0x8(%ebp),%eax
 3f3:	0f b6 00             	movzbl (%eax),%eax
 3f6:	3c 2f                	cmp    $0x2f,%al
 3f8:	7e 0a                	jle    404 <atoi+0x48>
 3fa:	8b 45 08             	mov    0x8(%ebp),%eax
 3fd:	0f b6 00             	movzbl (%eax),%eax
 400:	3c 39                	cmp    $0x39,%al
 402:	7e c7                	jle    3cb <atoi+0xf>
  return n;
 404:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 407:	c9                   	leave  
 408:	c3                   	ret    

00000409 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 409:	55                   	push   %ebp
 40a:	89 e5                	mov    %esp,%ebp
 40c:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 40f:	8b 45 08             	mov    0x8(%ebp),%eax
 412:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 415:	8b 45 0c             	mov    0xc(%ebp),%eax
 418:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 41b:	eb 17                	jmp    434 <memmove+0x2b>
    *dst++ = *src++;
 41d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 420:	8d 50 01             	lea    0x1(%eax),%edx
 423:	89 55 fc             	mov    %edx,-0x4(%ebp)
 426:	8b 55 f8             	mov    -0x8(%ebp),%edx
 429:	8d 4a 01             	lea    0x1(%edx),%ecx
 42c:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 42f:	0f b6 12             	movzbl (%edx),%edx
 432:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 434:	8b 45 10             	mov    0x10(%ebp),%eax
 437:	8d 50 ff             	lea    -0x1(%eax),%edx
 43a:	89 55 10             	mov    %edx,0x10(%ebp)
 43d:	85 c0                	test   %eax,%eax
 43f:	7f dc                	jg     41d <memmove+0x14>
  return vdst;
 441:	8b 45 08             	mov    0x8(%ebp),%eax
}
 444:	c9                   	leave  
 445:	c3                   	ret    

00000446 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 446:	b8 01 00 00 00       	mov    $0x1,%eax
 44b:	cd 40                	int    $0x40
 44d:	c3                   	ret    

0000044e <exit>:
SYSCALL(exit)
 44e:	b8 02 00 00 00       	mov    $0x2,%eax
 453:	cd 40                	int    $0x40
 455:	c3                   	ret    

00000456 <wait>:
SYSCALL(wait)
 456:	b8 03 00 00 00       	mov    $0x3,%eax
 45b:	cd 40                	int    $0x40
 45d:	c3                   	ret    

0000045e <pipe>:
SYSCALL(pipe)
 45e:	b8 04 00 00 00       	mov    $0x4,%eax
 463:	cd 40                	int    $0x40
 465:	c3                   	ret    

00000466 <read>:
SYSCALL(read)
 466:	b8 05 00 00 00       	mov    $0x5,%eax
 46b:	cd 40                	int    $0x40
 46d:	c3                   	ret    

0000046e <write>:
SYSCALL(write)
 46e:	b8 10 00 00 00       	mov    $0x10,%eax
 473:	cd 40                	int    $0x40
 475:	c3                   	ret    

00000476 <close>:
SYSCALL(close)
 476:	b8 15 00 00 00       	mov    $0x15,%eax
 47b:	cd 40                	int    $0x40
 47d:	c3                   	ret    

0000047e <kill>:
SYSCALL(kill)
 47e:	b8 06 00 00 00       	mov    $0x6,%eax
 483:	cd 40                	int    $0x40
 485:	c3                   	ret    

00000486 <exec>:
SYSCALL(exec)
 486:	b8 07 00 00 00       	mov    $0x7,%eax
 48b:	cd 40                	int    $0x40
 48d:	c3                   	ret    

0000048e <open>:
SYSCALL(open)
 48e:	b8 0f 00 00 00       	mov    $0xf,%eax
 493:	cd 40                	int    $0x40
 495:	c3                   	ret    

00000496 <mknod>:
SYSCALL(mknod)
 496:	b8 11 00 00 00       	mov    $0x11,%eax
 49b:	cd 40                	int    $0x40
 49d:	c3                   	ret    

0000049e <unlink>:
SYSCALL(unlink)
 49e:	b8 12 00 00 00       	mov    $0x12,%eax
 4a3:	cd 40                	int    $0x40
 4a5:	c3                   	ret    

000004a6 <fstat>:
SYSCALL(fstat)
 4a6:	b8 08 00 00 00       	mov    $0x8,%eax
 4ab:	cd 40                	int    $0x40
 4ad:	c3                   	ret    

000004ae <link>:
SYSCALL(link)
 4ae:	b8 13 00 00 00       	mov    $0x13,%eax
 4b3:	cd 40                	int    $0x40
 4b5:	c3                   	ret    

000004b6 <mkdir>:
SYSCALL(mkdir)
 4b6:	b8 14 00 00 00       	mov    $0x14,%eax
 4bb:	cd 40                	int    $0x40
 4bd:	c3                   	ret    

000004be <chdir>:
SYSCALL(chdir)
 4be:	b8 09 00 00 00       	mov    $0x9,%eax
 4c3:	cd 40                	int    $0x40
 4c5:	c3                   	ret    

000004c6 <dup>:
SYSCALL(dup)
 4c6:	b8 0a 00 00 00       	mov    $0xa,%eax
 4cb:	cd 40                	int    $0x40
 4cd:	c3                   	ret    

000004ce <getpid>:
SYSCALL(getpid)
 4ce:	b8 0b 00 00 00       	mov    $0xb,%eax
 4d3:	cd 40                	int    $0x40
 4d5:	c3                   	ret    

000004d6 <sbrk>:
SYSCALL(sbrk)
 4d6:	b8 0c 00 00 00       	mov    $0xc,%eax
 4db:	cd 40                	int    $0x40
 4dd:	c3                   	ret    

000004de <sleep>:
SYSCALL(sleep)
 4de:	b8 0d 00 00 00       	mov    $0xd,%eax
 4e3:	cd 40                	int    $0x40
 4e5:	c3                   	ret    

000004e6 <uptime>:
SYSCALL(uptime)
 4e6:	b8 0e 00 00 00       	mov    $0xe,%eax
 4eb:	cd 40                	int    $0x40
 4ed:	c3                   	ret    

000004ee <getpinfo>:
SYSCALL(getpinfo)
 4ee:	b8 16 00 00 00       	mov    $0x16,%eax
 4f3:	cd 40                	int    $0x40
 4f5:	c3                   	ret    

000004f6 <settickets>:
SYSCALL(settickets)
 4f6:	b8 17 00 00 00       	mov    $0x17,%eax
 4fb:	cd 40                	int    $0x40
 4fd:	c3                   	ret    

000004fe <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4fe:	55                   	push   %ebp
 4ff:	89 e5                	mov    %esp,%ebp
 501:	83 ec 18             	sub    $0x18,%esp
 504:	8b 45 0c             	mov    0xc(%ebp),%eax
 507:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 50a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 511:	00 
 512:	8d 45 f4             	lea    -0xc(%ebp),%eax
 515:	89 44 24 04          	mov    %eax,0x4(%esp)
 519:	8b 45 08             	mov    0x8(%ebp),%eax
 51c:	89 04 24             	mov    %eax,(%esp)
 51f:	e8 4a ff ff ff       	call   46e <write>
}
 524:	c9                   	leave  
 525:	c3                   	ret    

00000526 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 526:	55                   	push   %ebp
 527:	89 e5                	mov    %esp,%ebp
 529:	56                   	push   %esi
 52a:	53                   	push   %ebx
 52b:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 52e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 535:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 539:	74 17                	je     552 <printint+0x2c>
 53b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 53f:	79 11                	jns    552 <printint+0x2c>
    neg = 1;
 541:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 548:	8b 45 0c             	mov    0xc(%ebp),%eax
 54b:	f7 d8                	neg    %eax
 54d:	89 45 ec             	mov    %eax,-0x14(%ebp)
 550:	eb 06                	jmp    558 <printint+0x32>
  } else {
    x = xx;
 552:	8b 45 0c             	mov    0xc(%ebp),%eax
 555:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 558:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 55f:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 562:	8d 41 01             	lea    0x1(%ecx),%eax
 565:	89 45 f4             	mov    %eax,-0xc(%ebp)
 568:	8b 5d 10             	mov    0x10(%ebp),%ebx
 56b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 56e:	ba 00 00 00 00       	mov    $0x0,%edx
 573:	f7 f3                	div    %ebx
 575:	89 d0                	mov    %edx,%eax
 577:	0f b6 80 74 0c 00 00 	movzbl 0xc74(%eax),%eax
 57e:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 582:	8b 75 10             	mov    0x10(%ebp),%esi
 585:	8b 45 ec             	mov    -0x14(%ebp),%eax
 588:	ba 00 00 00 00       	mov    $0x0,%edx
 58d:	f7 f6                	div    %esi
 58f:	89 45 ec             	mov    %eax,-0x14(%ebp)
 592:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 596:	75 c7                	jne    55f <printint+0x39>
  if(neg)
 598:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 59c:	74 10                	je     5ae <printint+0x88>
    buf[i++] = '-';
 59e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5a1:	8d 50 01             	lea    0x1(%eax),%edx
 5a4:	89 55 f4             	mov    %edx,-0xc(%ebp)
 5a7:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 5ac:	eb 1f                	jmp    5cd <printint+0xa7>
 5ae:	eb 1d                	jmp    5cd <printint+0xa7>
    putc(fd, buf[i]);
 5b0:	8d 55 dc             	lea    -0x24(%ebp),%edx
 5b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5b6:	01 d0                	add    %edx,%eax
 5b8:	0f b6 00             	movzbl (%eax),%eax
 5bb:	0f be c0             	movsbl %al,%eax
 5be:	89 44 24 04          	mov    %eax,0x4(%esp)
 5c2:	8b 45 08             	mov    0x8(%ebp),%eax
 5c5:	89 04 24             	mov    %eax,(%esp)
 5c8:	e8 31 ff ff ff       	call   4fe <putc>
  while(--i >= 0)
 5cd:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 5d1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5d5:	79 d9                	jns    5b0 <printint+0x8a>
}
 5d7:	83 c4 30             	add    $0x30,%esp
 5da:	5b                   	pop    %ebx
 5db:	5e                   	pop    %esi
 5dc:	5d                   	pop    %ebp
 5dd:	c3                   	ret    

000005de <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5de:	55                   	push   %ebp
 5df:	89 e5                	mov    %esp,%ebp
 5e1:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 5e4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 5eb:	8d 45 0c             	lea    0xc(%ebp),%eax
 5ee:	83 c0 04             	add    $0x4,%eax
 5f1:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 5f4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 5fb:	e9 7c 01 00 00       	jmp    77c <printf+0x19e>
    c = fmt[i] & 0xff;
 600:	8b 55 0c             	mov    0xc(%ebp),%edx
 603:	8b 45 f0             	mov    -0x10(%ebp),%eax
 606:	01 d0                	add    %edx,%eax
 608:	0f b6 00             	movzbl (%eax),%eax
 60b:	0f be c0             	movsbl %al,%eax
 60e:	25 ff 00 00 00       	and    $0xff,%eax
 613:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 616:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 61a:	75 2c                	jne    648 <printf+0x6a>
      if(c == '%'){
 61c:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 620:	75 0c                	jne    62e <printf+0x50>
        state = '%';
 622:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 629:	e9 4a 01 00 00       	jmp    778 <printf+0x19a>
      } else {
        putc(fd, c);
 62e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 631:	0f be c0             	movsbl %al,%eax
 634:	89 44 24 04          	mov    %eax,0x4(%esp)
 638:	8b 45 08             	mov    0x8(%ebp),%eax
 63b:	89 04 24             	mov    %eax,(%esp)
 63e:	e8 bb fe ff ff       	call   4fe <putc>
 643:	e9 30 01 00 00       	jmp    778 <printf+0x19a>
      }
    } else if(state == '%'){
 648:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 64c:	0f 85 26 01 00 00    	jne    778 <printf+0x19a>
      if(c == 'd'){
 652:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 656:	75 2d                	jne    685 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 658:	8b 45 e8             	mov    -0x18(%ebp),%eax
 65b:	8b 00                	mov    (%eax),%eax
 65d:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 664:	00 
 665:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 66c:	00 
 66d:	89 44 24 04          	mov    %eax,0x4(%esp)
 671:	8b 45 08             	mov    0x8(%ebp),%eax
 674:	89 04 24             	mov    %eax,(%esp)
 677:	e8 aa fe ff ff       	call   526 <printint>
        ap++;
 67c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 680:	e9 ec 00 00 00       	jmp    771 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 685:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 689:	74 06                	je     691 <printf+0xb3>
 68b:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 68f:	75 2d                	jne    6be <printf+0xe0>
        printint(fd, *ap, 16, 0);
 691:	8b 45 e8             	mov    -0x18(%ebp),%eax
 694:	8b 00                	mov    (%eax),%eax
 696:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 69d:	00 
 69e:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 6a5:	00 
 6a6:	89 44 24 04          	mov    %eax,0x4(%esp)
 6aa:	8b 45 08             	mov    0x8(%ebp),%eax
 6ad:	89 04 24             	mov    %eax,(%esp)
 6b0:	e8 71 fe ff ff       	call   526 <printint>
        ap++;
 6b5:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6b9:	e9 b3 00 00 00       	jmp    771 <printf+0x193>
      } else if(c == 's'){
 6be:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 6c2:	75 45                	jne    709 <printf+0x12b>
        s = (char*)*ap;
 6c4:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6c7:	8b 00                	mov    (%eax),%eax
 6c9:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 6cc:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 6d0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 6d4:	75 09                	jne    6df <printf+0x101>
          s = "(null)";
 6d6:	c7 45 f4 f7 09 00 00 	movl   $0x9f7,-0xc(%ebp)
        while(*s != 0){
 6dd:	eb 1e                	jmp    6fd <printf+0x11f>
 6df:	eb 1c                	jmp    6fd <printf+0x11f>
          putc(fd, *s);
 6e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6e4:	0f b6 00             	movzbl (%eax),%eax
 6e7:	0f be c0             	movsbl %al,%eax
 6ea:	89 44 24 04          	mov    %eax,0x4(%esp)
 6ee:	8b 45 08             	mov    0x8(%ebp),%eax
 6f1:	89 04 24             	mov    %eax,(%esp)
 6f4:	e8 05 fe ff ff       	call   4fe <putc>
          s++;
 6f9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 6fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 700:	0f b6 00             	movzbl (%eax),%eax
 703:	84 c0                	test   %al,%al
 705:	75 da                	jne    6e1 <printf+0x103>
 707:	eb 68                	jmp    771 <printf+0x193>
        }
      } else if(c == 'c'){
 709:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 70d:	75 1d                	jne    72c <printf+0x14e>
        putc(fd, *ap);
 70f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 712:	8b 00                	mov    (%eax),%eax
 714:	0f be c0             	movsbl %al,%eax
 717:	89 44 24 04          	mov    %eax,0x4(%esp)
 71b:	8b 45 08             	mov    0x8(%ebp),%eax
 71e:	89 04 24             	mov    %eax,(%esp)
 721:	e8 d8 fd ff ff       	call   4fe <putc>
        ap++;
 726:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 72a:	eb 45                	jmp    771 <printf+0x193>
      } else if(c == '%'){
 72c:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 730:	75 17                	jne    749 <printf+0x16b>
        putc(fd, c);
 732:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 735:	0f be c0             	movsbl %al,%eax
 738:	89 44 24 04          	mov    %eax,0x4(%esp)
 73c:	8b 45 08             	mov    0x8(%ebp),%eax
 73f:	89 04 24             	mov    %eax,(%esp)
 742:	e8 b7 fd ff ff       	call   4fe <putc>
 747:	eb 28                	jmp    771 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 749:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 750:	00 
 751:	8b 45 08             	mov    0x8(%ebp),%eax
 754:	89 04 24             	mov    %eax,(%esp)
 757:	e8 a2 fd ff ff       	call   4fe <putc>
        putc(fd, c);
 75c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 75f:	0f be c0             	movsbl %al,%eax
 762:	89 44 24 04          	mov    %eax,0x4(%esp)
 766:	8b 45 08             	mov    0x8(%ebp),%eax
 769:	89 04 24             	mov    %eax,(%esp)
 76c:	e8 8d fd ff ff       	call   4fe <putc>
      }
      state = 0;
 771:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 778:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 77c:	8b 55 0c             	mov    0xc(%ebp),%edx
 77f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 782:	01 d0                	add    %edx,%eax
 784:	0f b6 00             	movzbl (%eax),%eax
 787:	84 c0                	test   %al,%al
 789:	0f 85 71 fe ff ff    	jne    600 <printf+0x22>
    }
  }
}
 78f:	c9                   	leave  
 790:	c3                   	ret    

00000791 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 791:	55                   	push   %ebp
 792:	89 e5                	mov    %esp,%ebp
 794:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 797:	8b 45 08             	mov    0x8(%ebp),%eax
 79a:	83 e8 08             	sub    $0x8,%eax
 79d:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7a0:	a1 90 0c 00 00       	mov    0xc90,%eax
 7a5:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7a8:	eb 24                	jmp    7ce <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7aa:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ad:	8b 00                	mov    (%eax),%eax
 7af:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7b2:	77 12                	ja     7c6 <free+0x35>
 7b4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7b7:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7ba:	77 24                	ja     7e0 <free+0x4f>
 7bc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7bf:	8b 00                	mov    (%eax),%eax
 7c1:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7c4:	77 1a                	ja     7e0 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c9:	8b 00                	mov    (%eax),%eax
 7cb:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7ce:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7d1:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7d4:	76 d4                	jbe    7aa <free+0x19>
 7d6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d9:	8b 00                	mov    (%eax),%eax
 7db:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7de:	76 ca                	jbe    7aa <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7e0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7e3:	8b 40 04             	mov    0x4(%eax),%eax
 7e6:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7ed:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7f0:	01 c2                	add    %eax,%edx
 7f2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f5:	8b 00                	mov    (%eax),%eax
 7f7:	39 c2                	cmp    %eax,%edx
 7f9:	75 24                	jne    81f <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 7fb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7fe:	8b 50 04             	mov    0x4(%eax),%edx
 801:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804:	8b 00                	mov    (%eax),%eax
 806:	8b 40 04             	mov    0x4(%eax),%eax
 809:	01 c2                	add    %eax,%edx
 80b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 80e:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 811:	8b 45 fc             	mov    -0x4(%ebp),%eax
 814:	8b 00                	mov    (%eax),%eax
 816:	8b 10                	mov    (%eax),%edx
 818:	8b 45 f8             	mov    -0x8(%ebp),%eax
 81b:	89 10                	mov    %edx,(%eax)
 81d:	eb 0a                	jmp    829 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 81f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 822:	8b 10                	mov    (%eax),%edx
 824:	8b 45 f8             	mov    -0x8(%ebp),%eax
 827:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 829:	8b 45 fc             	mov    -0x4(%ebp),%eax
 82c:	8b 40 04             	mov    0x4(%eax),%eax
 82f:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 836:	8b 45 fc             	mov    -0x4(%ebp),%eax
 839:	01 d0                	add    %edx,%eax
 83b:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 83e:	75 20                	jne    860 <free+0xcf>
    p->s.size += bp->s.size;
 840:	8b 45 fc             	mov    -0x4(%ebp),%eax
 843:	8b 50 04             	mov    0x4(%eax),%edx
 846:	8b 45 f8             	mov    -0x8(%ebp),%eax
 849:	8b 40 04             	mov    0x4(%eax),%eax
 84c:	01 c2                	add    %eax,%edx
 84e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 851:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 854:	8b 45 f8             	mov    -0x8(%ebp),%eax
 857:	8b 10                	mov    (%eax),%edx
 859:	8b 45 fc             	mov    -0x4(%ebp),%eax
 85c:	89 10                	mov    %edx,(%eax)
 85e:	eb 08                	jmp    868 <free+0xd7>
  } else
    p->s.ptr = bp;
 860:	8b 45 fc             	mov    -0x4(%ebp),%eax
 863:	8b 55 f8             	mov    -0x8(%ebp),%edx
 866:	89 10                	mov    %edx,(%eax)
  freep = p;
 868:	8b 45 fc             	mov    -0x4(%ebp),%eax
 86b:	a3 90 0c 00 00       	mov    %eax,0xc90
}
 870:	c9                   	leave  
 871:	c3                   	ret    

00000872 <morecore>:

static Header*
morecore(uint nu)
{
 872:	55                   	push   %ebp
 873:	89 e5                	mov    %esp,%ebp
 875:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 878:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 87f:	77 07                	ja     888 <morecore+0x16>
    nu = 4096;
 881:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 888:	8b 45 08             	mov    0x8(%ebp),%eax
 88b:	c1 e0 03             	shl    $0x3,%eax
 88e:	89 04 24             	mov    %eax,(%esp)
 891:	e8 40 fc ff ff       	call   4d6 <sbrk>
 896:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 899:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 89d:	75 07                	jne    8a6 <morecore+0x34>
    return 0;
 89f:	b8 00 00 00 00       	mov    $0x0,%eax
 8a4:	eb 22                	jmp    8c8 <morecore+0x56>
  hp = (Header*)p;
 8a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8a9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 8ac:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8af:	8b 55 08             	mov    0x8(%ebp),%edx
 8b2:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 8b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8b8:	83 c0 08             	add    $0x8,%eax
 8bb:	89 04 24             	mov    %eax,(%esp)
 8be:	e8 ce fe ff ff       	call   791 <free>
  return freep;
 8c3:	a1 90 0c 00 00       	mov    0xc90,%eax
}
 8c8:	c9                   	leave  
 8c9:	c3                   	ret    

000008ca <malloc>:

void*
malloc(uint nbytes)
{
 8ca:	55                   	push   %ebp
 8cb:	89 e5                	mov    %esp,%ebp
 8cd:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8d0:	8b 45 08             	mov    0x8(%ebp),%eax
 8d3:	83 c0 07             	add    $0x7,%eax
 8d6:	c1 e8 03             	shr    $0x3,%eax
 8d9:	83 c0 01             	add    $0x1,%eax
 8dc:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 8df:	a1 90 0c 00 00       	mov    0xc90,%eax
 8e4:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8e7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8eb:	75 23                	jne    910 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 8ed:	c7 45 f0 88 0c 00 00 	movl   $0xc88,-0x10(%ebp)
 8f4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8f7:	a3 90 0c 00 00       	mov    %eax,0xc90
 8fc:	a1 90 0c 00 00       	mov    0xc90,%eax
 901:	a3 88 0c 00 00       	mov    %eax,0xc88
    base.s.size = 0;
 906:	c7 05 8c 0c 00 00 00 	movl   $0x0,0xc8c
 90d:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 910:	8b 45 f0             	mov    -0x10(%ebp),%eax
 913:	8b 00                	mov    (%eax),%eax
 915:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 918:	8b 45 f4             	mov    -0xc(%ebp),%eax
 91b:	8b 40 04             	mov    0x4(%eax),%eax
 91e:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 921:	72 4d                	jb     970 <malloc+0xa6>
      if(p->s.size == nunits)
 923:	8b 45 f4             	mov    -0xc(%ebp),%eax
 926:	8b 40 04             	mov    0x4(%eax),%eax
 929:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 92c:	75 0c                	jne    93a <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 92e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 931:	8b 10                	mov    (%eax),%edx
 933:	8b 45 f0             	mov    -0x10(%ebp),%eax
 936:	89 10                	mov    %edx,(%eax)
 938:	eb 26                	jmp    960 <malloc+0x96>
      else {
        p->s.size -= nunits;
 93a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 93d:	8b 40 04             	mov    0x4(%eax),%eax
 940:	2b 45 ec             	sub    -0x14(%ebp),%eax
 943:	89 c2                	mov    %eax,%edx
 945:	8b 45 f4             	mov    -0xc(%ebp),%eax
 948:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 94b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 94e:	8b 40 04             	mov    0x4(%eax),%eax
 951:	c1 e0 03             	shl    $0x3,%eax
 954:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 957:	8b 45 f4             	mov    -0xc(%ebp),%eax
 95a:	8b 55 ec             	mov    -0x14(%ebp),%edx
 95d:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 960:	8b 45 f0             	mov    -0x10(%ebp),%eax
 963:	a3 90 0c 00 00       	mov    %eax,0xc90
      return (void*)(p + 1);
 968:	8b 45 f4             	mov    -0xc(%ebp),%eax
 96b:	83 c0 08             	add    $0x8,%eax
 96e:	eb 38                	jmp    9a8 <malloc+0xde>
    }
    if(p == freep)
 970:	a1 90 0c 00 00       	mov    0xc90,%eax
 975:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 978:	75 1b                	jne    995 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 97a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 97d:	89 04 24             	mov    %eax,(%esp)
 980:	e8 ed fe ff ff       	call   872 <morecore>
 985:	89 45 f4             	mov    %eax,-0xc(%ebp)
 988:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 98c:	75 07                	jne    995 <malloc+0xcb>
        return 0;
 98e:	b8 00 00 00 00       	mov    $0x0,%eax
 993:	eb 13                	jmp    9a8 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 995:	8b 45 f4             	mov    -0xc(%ebp),%eax
 998:	89 45 f0             	mov    %eax,-0x10(%ebp)
 99b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 99e:	8b 00                	mov    (%eax),%eax
 9a0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 9a3:	e9 70 ff ff ff       	jmp    918 <malloc+0x4e>
}
 9a8:	c9                   	leave  
 9a9:	c3                   	ret    
