
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
  32:	05 40 0e 00 00       	add    $0xe40,%eax
  37:	0f b6 00             	movzbl (%eax),%eax
  3a:	3c 0a                	cmp    $0xa,%al
  3c:	75 04                	jne    42 <wc+0x42>
        l++;
  3e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      if(strchr(" \r\t\n\v", buf[i]))
  42:	8b 45 f4             	mov    -0xc(%ebp),%eax
  45:	05 40 0e 00 00       	add    $0xe40,%eax
  4a:	0f b6 00             	movzbl (%eax),%eax
  4d:	0f be c0             	movsbl %al,%eax
  50:	89 44 24 04          	mov    %eax,0x4(%esp)
  54:	c7 04 24 0a 0b 00 00 	movl   $0xb0a,(%esp)
  5b:	e8 c5 03 00 00       	call   425 <strchr>
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
  92:	c7 44 24 04 40 0e 00 	movl   $0xe40,0x4(%esp)
  99:	00 
  9a:	8b 45 08             	mov    0x8(%ebp),%eax
  9d:	89 04 24             	mov    %eax,(%esp)
  a0:	e8 21 05 00 00       	call   5c6 <read>
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
  b8:	c7 44 24 04 10 0b 00 	movl   $0xb10,0x4(%esp)
  bf:	00 
  c0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  c7:	e8 72 06 00 00       	call   73e <printf>
    exit();
  cc:	e8 dd 04 00 00       	call   5ae <exit>
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
  ed:	c7 44 24 04 20 0b 00 	movl   $0xb20,0x4(%esp)
  f4:	00 
  f5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  fc:	e8 3d 06 00 00       	call   73e <printf>
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
 112:	c7 44 24 04 2d 0b 00 	movl   $0xb2d,0x4(%esp)
 119:	00 
 11a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 121:	e8 da fe ff ff       	call   0 <wc>
    exit();
 126:	e8 83 04 00 00       	call   5ae <exit>
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
 155:	e8 94 04 00 00       	call   5ee <open>
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
 17b:	c7 44 24 04 2e 0b 00 	movl   $0xb2e,0x4(%esp)
 182:	00 
 183:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 18a:	e8 af 05 00 00       	call   73e <printf>
      exit();
 18f:	e8 1a 04 00 00       	call   5ae <exit>
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
 1bd:	e8 14 04 00 00       	call   5d6 <close>
  for(i = 1; i < argc; i++){
 1c2:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
 1c7:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 1cb:	3b 45 08             	cmp    0x8(%ebp),%eax
 1ce:	0f 8c 64 ff ff ff    	jl     138 <main+0x35>
  }
  exit();
 1d4:	e8 d5 03 00 00       	call   5ae <exit>

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
#include "user.h"
#include "x86.h"
#include "param.h"
#include "pstat.h"

void ps(){
 1fe:	55                   	push   %ebp
 1ff:	89 e5                	mov    %esp,%ebp
 201:	57                   	push   %edi
 202:	56                   	push   %esi
 203:	53                   	push   %ebx
 204:	81 ec 2c 09 00 00    	sub    $0x92c,%esp
  
  //pstatTable pst = malloc(NPROC * sizeof(pstat_t));
  pstat_t pst[NPROC];
  getpinfo(&pst);
 20a:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 210:	89 04 24             	mov    %eax,(%esp)
 213:	e8 36 04 00 00       	call   64e <getpinfo>
  int i;
  for (i = 0; i < NPROC; i++){
 218:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 21f:	e9 32 01 00 00       	jmp    356 <ps+0x158>
    if (pst[i].inuse == 1){
 224:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 227:	89 d0                	mov    %edx,%eax
 229:	c1 e0 03             	shl    $0x3,%eax
 22c:	01 d0                	add    %edx,%eax
 22e:	c1 e0 02             	shl    $0x2,%eax
 231:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 234:	01 d8                	add    %ebx,%eax
 236:	2d 04 09 00 00       	sub    $0x904,%eax
 23b:	8b 00                	mov    (%eax),%eax
 23d:	83 f8 01             	cmp    $0x1,%eax
 240:	0f 85 0c 01 00 00    	jne    352 <ps+0x154>
      printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 246:	c7 44 24 04 42 0b 00 	movl   $0xb42,0x4(%esp)
 24d:	00 
 24e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 255:	e8 e4 04 00 00       	call   73e <printf>
      printf(1, "%d\t", pst[i].pid);
 25a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 25d:	89 d0                	mov    %edx,%eax
 25f:	c1 e0 03             	shl    $0x3,%eax
 262:	01 d0                	add    %edx,%eax
 264:	c1 e0 02             	shl    $0x2,%eax
 267:	8d 75 e8             	lea    -0x18(%ebp),%esi
 26a:	01 f0                	add    %esi,%eax
 26c:	2d fc 08 00 00       	sub    $0x8fc,%eax
 271:	8b 00                	mov    (%eax),%eax
 273:	89 44 24 08          	mov    %eax,0x8(%esp)
 277:	c7 44 24 04 5b 0b 00 	movl   $0xb5b,0x4(%esp)
 27e:	00 
 27f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 286:	e8 b3 04 00 00       	call   73e <printf>
      printf(1, "%d\t", pst[i].tickets);
 28b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 28e:	89 d0                	mov    %edx,%eax
 290:	c1 e0 03             	shl    $0x3,%eax
 293:	01 d0                	add    %edx,%eax
 295:	c1 e0 02             	shl    $0x2,%eax
 298:	8d 7d e8             	lea    -0x18(%ebp),%edi
 29b:	01 f8                	add    %edi,%eax
 29d:	2d 00 09 00 00       	sub    $0x900,%eax
 2a2:	8b 00                	mov    (%eax),%eax
 2a4:	89 44 24 08          	mov    %eax,0x8(%esp)
 2a8:	c7 44 24 04 5b 0b 00 	movl   $0xb5b,0x4(%esp)
 2af:	00 
 2b0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2b7:	e8 82 04 00 00       	call   73e <printf>
      printf(1, "%d\t", pst[i].ticks);
 2bc:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 2bf:	89 d0                	mov    %edx,%eax
 2c1:	c1 e0 03             	shl    $0x3,%eax
 2c4:	01 d0                	add    %edx,%eax
 2c6:	c1 e0 02             	shl    $0x2,%eax
 2c9:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 2cc:	01 c8                	add    %ecx,%eax
 2ce:	2d f8 08 00 00       	sub    $0x8f8,%eax
 2d3:	8b 00                	mov    (%eax),%eax
 2d5:	89 44 24 08          	mov    %eax,0x8(%esp)
 2d9:	c7 44 24 04 5b 0b 00 	movl   $0xb5b,0x4(%esp)
 2e0:	00 
 2e1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2e8:	e8 51 04 00 00       	call   73e <printf>
      printf(1, "%c\t", pst[i].state);
 2ed:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 2f0:	89 d0                	mov    %edx,%eax
 2f2:	c1 e0 03             	shl    $0x3,%eax
 2f5:	01 d0                	add    %edx,%eax
 2f7:	c1 e0 02             	shl    $0x2,%eax
 2fa:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 2fd:	01 d8                	add    %ebx,%eax
 2ff:	2d e4 08 00 00       	sub    $0x8e4,%eax
 304:	0f b6 00             	movzbl (%eax),%eax
 307:	0f be c0             	movsbl %al,%eax
 30a:	89 44 24 08          	mov    %eax,0x8(%esp)
 30e:	c7 44 24 04 5f 0b 00 	movl   $0xb5f,0x4(%esp)
 315:	00 
 316:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 31d:	e8 1c 04 00 00       	call   73e <printf>
      printf(1, "%s\t\n", pst[i].name);
 322:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 328:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 32b:	89 d0                	mov    %edx,%eax
 32d:	c1 e0 03             	shl    $0x3,%eax
 330:	01 d0                	add    %edx,%eax
 332:	c1 e0 02             	shl    $0x2,%eax
 335:	83 c0 10             	add    $0x10,%eax
 338:	01 c8                	add    %ecx,%eax
 33a:	89 44 24 08          	mov    %eax,0x8(%esp)
 33e:	c7 44 24 04 63 0b 00 	movl   $0xb63,0x4(%esp)
 345:	00 
 346:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 34d:	e8 ec 03 00 00       	call   73e <printf>
  for (i = 0; i < NPROC; i++){
 352:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 356:	83 7d e4 3f          	cmpl   $0x3f,-0x1c(%ebp)
 35a:	0f 8e c4 fe ff ff    	jle    224 <ps+0x26>
    }
  }
}
 360:	81 c4 2c 09 00 00    	add    $0x92c,%esp
 366:	5b                   	pop    %ebx
 367:	5e                   	pop    %esi
 368:	5f                   	pop    %edi
 369:	5d                   	pop    %ebp
 36a:	c3                   	ret    

0000036b <strcpy>:

char*
strcpy(char *s, const char *t)
{
 36b:	55                   	push   %ebp
 36c:	89 e5                	mov    %esp,%ebp
 36e:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 371:	8b 45 08             	mov    0x8(%ebp),%eax
 374:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 377:	90                   	nop
 378:	8b 45 08             	mov    0x8(%ebp),%eax
 37b:	8d 50 01             	lea    0x1(%eax),%edx
 37e:	89 55 08             	mov    %edx,0x8(%ebp)
 381:	8b 55 0c             	mov    0xc(%ebp),%edx
 384:	8d 4a 01             	lea    0x1(%edx),%ecx
 387:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 38a:	0f b6 12             	movzbl (%edx),%edx
 38d:	88 10                	mov    %dl,(%eax)
 38f:	0f b6 00             	movzbl (%eax),%eax
 392:	84 c0                	test   %al,%al
 394:	75 e2                	jne    378 <strcpy+0xd>
    ;
  return os;
 396:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 399:	c9                   	leave  
 39a:	c3                   	ret    

0000039b <strcmp>:

int
strcmp(const char *p, const char *q)
{
 39b:	55                   	push   %ebp
 39c:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 39e:	eb 08                	jmp    3a8 <strcmp+0xd>
    p++, q++;
 3a0:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 3a4:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 3a8:	8b 45 08             	mov    0x8(%ebp),%eax
 3ab:	0f b6 00             	movzbl (%eax),%eax
 3ae:	84 c0                	test   %al,%al
 3b0:	74 10                	je     3c2 <strcmp+0x27>
 3b2:	8b 45 08             	mov    0x8(%ebp),%eax
 3b5:	0f b6 10             	movzbl (%eax),%edx
 3b8:	8b 45 0c             	mov    0xc(%ebp),%eax
 3bb:	0f b6 00             	movzbl (%eax),%eax
 3be:	38 c2                	cmp    %al,%dl
 3c0:	74 de                	je     3a0 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 3c2:	8b 45 08             	mov    0x8(%ebp),%eax
 3c5:	0f b6 00             	movzbl (%eax),%eax
 3c8:	0f b6 d0             	movzbl %al,%edx
 3cb:	8b 45 0c             	mov    0xc(%ebp),%eax
 3ce:	0f b6 00             	movzbl (%eax),%eax
 3d1:	0f b6 c0             	movzbl %al,%eax
 3d4:	29 c2                	sub    %eax,%edx
 3d6:	89 d0                	mov    %edx,%eax
}
 3d8:	5d                   	pop    %ebp
 3d9:	c3                   	ret    

000003da <strlen>:

uint
strlen(const char *s)
{
 3da:	55                   	push   %ebp
 3db:	89 e5                	mov    %esp,%ebp
 3dd:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 3e0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 3e7:	eb 04                	jmp    3ed <strlen+0x13>
 3e9:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 3ed:	8b 55 fc             	mov    -0x4(%ebp),%edx
 3f0:	8b 45 08             	mov    0x8(%ebp),%eax
 3f3:	01 d0                	add    %edx,%eax
 3f5:	0f b6 00             	movzbl (%eax),%eax
 3f8:	84 c0                	test   %al,%al
 3fa:	75 ed                	jne    3e9 <strlen+0xf>
    ;
  return n;
 3fc:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3ff:	c9                   	leave  
 400:	c3                   	ret    

00000401 <memset>:

void*
memset(void *dst, int c, uint n)
{
 401:	55                   	push   %ebp
 402:	89 e5                	mov    %esp,%ebp
 404:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 407:	8b 45 10             	mov    0x10(%ebp),%eax
 40a:	89 44 24 08          	mov    %eax,0x8(%esp)
 40e:	8b 45 0c             	mov    0xc(%ebp),%eax
 411:	89 44 24 04          	mov    %eax,0x4(%esp)
 415:	8b 45 08             	mov    0x8(%ebp),%eax
 418:	89 04 24             	mov    %eax,(%esp)
 41b:	e8 b9 fd ff ff       	call   1d9 <stosb>
  return dst;
 420:	8b 45 08             	mov    0x8(%ebp),%eax
}
 423:	c9                   	leave  
 424:	c3                   	ret    

00000425 <strchr>:

char*
strchr(const char *s, char c)
{
 425:	55                   	push   %ebp
 426:	89 e5                	mov    %esp,%ebp
 428:	83 ec 04             	sub    $0x4,%esp
 42b:	8b 45 0c             	mov    0xc(%ebp),%eax
 42e:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 431:	eb 14                	jmp    447 <strchr+0x22>
    if(*s == c)
 433:	8b 45 08             	mov    0x8(%ebp),%eax
 436:	0f b6 00             	movzbl (%eax),%eax
 439:	3a 45 fc             	cmp    -0x4(%ebp),%al
 43c:	75 05                	jne    443 <strchr+0x1e>
      return (char*)s;
 43e:	8b 45 08             	mov    0x8(%ebp),%eax
 441:	eb 13                	jmp    456 <strchr+0x31>
  for(; *s; s++)
 443:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 447:	8b 45 08             	mov    0x8(%ebp),%eax
 44a:	0f b6 00             	movzbl (%eax),%eax
 44d:	84 c0                	test   %al,%al
 44f:	75 e2                	jne    433 <strchr+0xe>
  return 0;
 451:	b8 00 00 00 00       	mov    $0x0,%eax
}
 456:	c9                   	leave  
 457:	c3                   	ret    

00000458 <gets>:

char*
gets(char *buf, int max)
{
 458:	55                   	push   %ebp
 459:	89 e5                	mov    %esp,%ebp
 45b:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 45e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 465:	eb 4c                	jmp    4b3 <gets+0x5b>
    cc = read(0, &c, 1);
 467:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 46e:	00 
 46f:	8d 45 ef             	lea    -0x11(%ebp),%eax
 472:	89 44 24 04          	mov    %eax,0x4(%esp)
 476:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 47d:	e8 44 01 00 00       	call   5c6 <read>
 482:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 485:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 489:	7f 02                	jg     48d <gets+0x35>
      break;
 48b:	eb 31                	jmp    4be <gets+0x66>
    buf[i++] = c;
 48d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 490:	8d 50 01             	lea    0x1(%eax),%edx
 493:	89 55 f4             	mov    %edx,-0xc(%ebp)
 496:	89 c2                	mov    %eax,%edx
 498:	8b 45 08             	mov    0x8(%ebp),%eax
 49b:	01 c2                	add    %eax,%edx
 49d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4a1:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 4a3:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4a7:	3c 0a                	cmp    $0xa,%al
 4a9:	74 13                	je     4be <gets+0x66>
 4ab:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4af:	3c 0d                	cmp    $0xd,%al
 4b1:	74 0b                	je     4be <gets+0x66>
  for(i=0; i+1 < max; ){
 4b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4b6:	83 c0 01             	add    $0x1,%eax
 4b9:	3b 45 0c             	cmp    0xc(%ebp),%eax
 4bc:	7c a9                	jl     467 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 4be:	8b 55 f4             	mov    -0xc(%ebp),%edx
 4c1:	8b 45 08             	mov    0x8(%ebp),%eax
 4c4:	01 d0                	add    %edx,%eax
 4c6:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 4c9:	8b 45 08             	mov    0x8(%ebp),%eax
}
 4cc:	c9                   	leave  
 4cd:	c3                   	ret    

000004ce <stat>:

int
stat(const char *n, struct stat *st)
{
 4ce:	55                   	push   %ebp
 4cf:	89 e5                	mov    %esp,%ebp
 4d1:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4d4:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 4db:	00 
 4dc:	8b 45 08             	mov    0x8(%ebp),%eax
 4df:	89 04 24             	mov    %eax,(%esp)
 4e2:	e8 07 01 00 00       	call   5ee <open>
 4e7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 4ea:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4ee:	79 07                	jns    4f7 <stat+0x29>
    return -1;
 4f0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 4f5:	eb 23                	jmp    51a <stat+0x4c>
  r = fstat(fd, st);
 4f7:	8b 45 0c             	mov    0xc(%ebp),%eax
 4fa:	89 44 24 04          	mov    %eax,0x4(%esp)
 4fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
 501:	89 04 24             	mov    %eax,(%esp)
 504:	e8 fd 00 00 00       	call   606 <fstat>
 509:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 50c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 50f:	89 04 24             	mov    %eax,(%esp)
 512:	e8 bf 00 00 00       	call   5d6 <close>
  return r;
 517:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 51a:	c9                   	leave  
 51b:	c3                   	ret    

0000051c <atoi>:

int
atoi(const char *s)
{
 51c:	55                   	push   %ebp
 51d:	89 e5                	mov    %esp,%ebp
 51f:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 522:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 529:	eb 25                	jmp    550 <atoi+0x34>
    n = n*10 + *s++ - '0';
 52b:	8b 55 fc             	mov    -0x4(%ebp),%edx
 52e:	89 d0                	mov    %edx,%eax
 530:	c1 e0 02             	shl    $0x2,%eax
 533:	01 d0                	add    %edx,%eax
 535:	01 c0                	add    %eax,%eax
 537:	89 c1                	mov    %eax,%ecx
 539:	8b 45 08             	mov    0x8(%ebp),%eax
 53c:	8d 50 01             	lea    0x1(%eax),%edx
 53f:	89 55 08             	mov    %edx,0x8(%ebp)
 542:	0f b6 00             	movzbl (%eax),%eax
 545:	0f be c0             	movsbl %al,%eax
 548:	01 c8                	add    %ecx,%eax
 54a:	83 e8 30             	sub    $0x30,%eax
 54d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 550:	8b 45 08             	mov    0x8(%ebp),%eax
 553:	0f b6 00             	movzbl (%eax),%eax
 556:	3c 2f                	cmp    $0x2f,%al
 558:	7e 0a                	jle    564 <atoi+0x48>
 55a:	8b 45 08             	mov    0x8(%ebp),%eax
 55d:	0f b6 00             	movzbl (%eax),%eax
 560:	3c 39                	cmp    $0x39,%al
 562:	7e c7                	jle    52b <atoi+0xf>
  return n;
 564:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 567:	c9                   	leave  
 568:	c3                   	ret    

00000569 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 569:	55                   	push   %ebp
 56a:	89 e5                	mov    %esp,%ebp
 56c:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 56f:	8b 45 08             	mov    0x8(%ebp),%eax
 572:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 575:	8b 45 0c             	mov    0xc(%ebp),%eax
 578:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 57b:	eb 17                	jmp    594 <memmove+0x2b>
    *dst++ = *src++;
 57d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 580:	8d 50 01             	lea    0x1(%eax),%edx
 583:	89 55 fc             	mov    %edx,-0x4(%ebp)
 586:	8b 55 f8             	mov    -0x8(%ebp),%edx
 589:	8d 4a 01             	lea    0x1(%edx),%ecx
 58c:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 58f:	0f b6 12             	movzbl (%edx),%edx
 592:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 594:	8b 45 10             	mov    0x10(%ebp),%eax
 597:	8d 50 ff             	lea    -0x1(%eax),%edx
 59a:	89 55 10             	mov    %edx,0x10(%ebp)
 59d:	85 c0                	test   %eax,%eax
 59f:	7f dc                	jg     57d <memmove+0x14>
  return vdst;
 5a1:	8b 45 08             	mov    0x8(%ebp),%eax
}
 5a4:	c9                   	leave  
 5a5:	c3                   	ret    

000005a6 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5a6:	b8 01 00 00 00       	mov    $0x1,%eax
 5ab:	cd 40                	int    $0x40
 5ad:	c3                   	ret    

000005ae <exit>:
SYSCALL(exit)
 5ae:	b8 02 00 00 00       	mov    $0x2,%eax
 5b3:	cd 40                	int    $0x40
 5b5:	c3                   	ret    

000005b6 <wait>:
SYSCALL(wait)
 5b6:	b8 03 00 00 00       	mov    $0x3,%eax
 5bb:	cd 40                	int    $0x40
 5bd:	c3                   	ret    

000005be <pipe>:
SYSCALL(pipe)
 5be:	b8 04 00 00 00       	mov    $0x4,%eax
 5c3:	cd 40                	int    $0x40
 5c5:	c3                   	ret    

000005c6 <read>:
SYSCALL(read)
 5c6:	b8 05 00 00 00       	mov    $0x5,%eax
 5cb:	cd 40                	int    $0x40
 5cd:	c3                   	ret    

000005ce <write>:
SYSCALL(write)
 5ce:	b8 10 00 00 00       	mov    $0x10,%eax
 5d3:	cd 40                	int    $0x40
 5d5:	c3                   	ret    

000005d6 <close>:
SYSCALL(close)
 5d6:	b8 15 00 00 00       	mov    $0x15,%eax
 5db:	cd 40                	int    $0x40
 5dd:	c3                   	ret    

000005de <kill>:
SYSCALL(kill)
 5de:	b8 06 00 00 00       	mov    $0x6,%eax
 5e3:	cd 40                	int    $0x40
 5e5:	c3                   	ret    

000005e6 <exec>:
SYSCALL(exec)
 5e6:	b8 07 00 00 00       	mov    $0x7,%eax
 5eb:	cd 40                	int    $0x40
 5ed:	c3                   	ret    

000005ee <open>:
SYSCALL(open)
 5ee:	b8 0f 00 00 00       	mov    $0xf,%eax
 5f3:	cd 40                	int    $0x40
 5f5:	c3                   	ret    

000005f6 <mknod>:
SYSCALL(mknod)
 5f6:	b8 11 00 00 00       	mov    $0x11,%eax
 5fb:	cd 40                	int    $0x40
 5fd:	c3                   	ret    

000005fe <unlink>:
SYSCALL(unlink)
 5fe:	b8 12 00 00 00       	mov    $0x12,%eax
 603:	cd 40                	int    $0x40
 605:	c3                   	ret    

00000606 <fstat>:
SYSCALL(fstat)
 606:	b8 08 00 00 00       	mov    $0x8,%eax
 60b:	cd 40                	int    $0x40
 60d:	c3                   	ret    

0000060e <link>:
SYSCALL(link)
 60e:	b8 13 00 00 00       	mov    $0x13,%eax
 613:	cd 40                	int    $0x40
 615:	c3                   	ret    

00000616 <mkdir>:
SYSCALL(mkdir)
 616:	b8 14 00 00 00       	mov    $0x14,%eax
 61b:	cd 40                	int    $0x40
 61d:	c3                   	ret    

0000061e <chdir>:
SYSCALL(chdir)
 61e:	b8 09 00 00 00       	mov    $0x9,%eax
 623:	cd 40                	int    $0x40
 625:	c3                   	ret    

00000626 <dup>:
SYSCALL(dup)
 626:	b8 0a 00 00 00       	mov    $0xa,%eax
 62b:	cd 40                	int    $0x40
 62d:	c3                   	ret    

0000062e <getpid>:
SYSCALL(getpid)
 62e:	b8 0b 00 00 00       	mov    $0xb,%eax
 633:	cd 40                	int    $0x40
 635:	c3                   	ret    

00000636 <sbrk>:
SYSCALL(sbrk)
 636:	b8 0c 00 00 00       	mov    $0xc,%eax
 63b:	cd 40                	int    $0x40
 63d:	c3                   	ret    

0000063e <sleep>:
SYSCALL(sleep)
 63e:	b8 0d 00 00 00       	mov    $0xd,%eax
 643:	cd 40                	int    $0x40
 645:	c3                   	ret    

00000646 <uptime>:
SYSCALL(uptime)
 646:	b8 0e 00 00 00       	mov    $0xe,%eax
 64b:	cd 40                	int    $0x40
 64d:	c3                   	ret    

0000064e <getpinfo>:
SYSCALL(getpinfo)
 64e:	b8 16 00 00 00       	mov    $0x16,%eax
 653:	cd 40                	int    $0x40
 655:	c3                   	ret    

00000656 <settickets>:
SYSCALL(settickets)
 656:	b8 17 00 00 00       	mov    $0x17,%eax
 65b:	cd 40                	int    $0x40
 65d:	c3                   	ret    

0000065e <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 65e:	55                   	push   %ebp
 65f:	89 e5                	mov    %esp,%ebp
 661:	83 ec 18             	sub    $0x18,%esp
 664:	8b 45 0c             	mov    0xc(%ebp),%eax
 667:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 66a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 671:	00 
 672:	8d 45 f4             	lea    -0xc(%ebp),%eax
 675:	89 44 24 04          	mov    %eax,0x4(%esp)
 679:	8b 45 08             	mov    0x8(%ebp),%eax
 67c:	89 04 24             	mov    %eax,(%esp)
 67f:	e8 4a ff ff ff       	call   5ce <write>
}
 684:	c9                   	leave  
 685:	c3                   	ret    

00000686 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 686:	55                   	push   %ebp
 687:	89 e5                	mov    %esp,%ebp
 689:	56                   	push   %esi
 68a:	53                   	push   %ebx
 68b:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 68e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 695:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 699:	74 17                	je     6b2 <printint+0x2c>
 69b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 69f:	79 11                	jns    6b2 <printint+0x2c>
    neg = 1;
 6a1:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 6a8:	8b 45 0c             	mov    0xc(%ebp),%eax
 6ab:	f7 d8                	neg    %eax
 6ad:	89 45 ec             	mov    %eax,-0x14(%ebp)
 6b0:	eb 06                	jmp    6b8 <printint+0x32>
  } else {
    x = xx;
 6b2:	8b 45 0c             	mov    0xc(%ebp),%eax
 6b5:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 6b8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 6bf:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 6c2:	8d 41 01             	lea    0x1(%ecx),%eax
 6c5:	89 45 f4             	mov    %eax,-0xc(%ebp)
 6c8:	8b 5d 10             	mov    0x10(%ebp),%ebx
 6cb:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6ce:	ba 00 00 00 00       	mov    $0x0,%edx
 6d3:	f7 f3                	div    %ebx
 6d5:	89 d0                	mov    %edx,%eax
 6d7:	0f b6 80 04 0e 00 00 	movzbl 0xe04(%eax),%eax
 6de:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 6e2:	8b 75 10             	mov    0x10(%ebp),%esi
 6e5:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6e8:	ba 00 00 00 00       	mov    $0x0,%edx
 6ed:	f7 f6                	div    %esi
 6ef:	89 45 ec             	mov    %eax,-0x14(%ebp)
 6f2:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 6f6:	75 c7                	jne    6bf <printint+0x39>
  if(neg)
 6f8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 6fc:	74 10                	je     70e <printint+0x88>
    buf[i++] = '-';
 6fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
 701:	8d 50 01             	lea    0x1(%eax),%edx
 704:	89 55 f4             	mov    %edx,-0xc(%ebp)
 707:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 70c:	eb 1f                	jmp    72d <printint+0xa7>
 70e:	eb 1d                	jmp    72d <printint+0xa7>
    putc(fd, buf[i]);
 710:	8d 55 dc             	lea    -0x24(%ebp),%edx
 713:	8b 45 f4             	mov    -0xc(%ebp),%eax
 716:	01 d0                	add    %edx,%eax
 718:	0f b6 00             	movzbl (%eax),%eax
 71b:	0f be c0             	movsbl %al,%eax
 71e:	89 44 24 04          	mov    %eax,0x4(%esp)
 722:	8b 45 08             	mov    0x8(%ebp),%eax
 725:	89 04 24             	mov    %eax,(%esp)
 728:	e8 31 ff ff ff       	call   65e <putc>
  while(--i >= 0)
 72d:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 731:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 735:	79 d9                	jns    710 <printint+0x8a>
}
 737:	83 c4 30             	add    $0x30,%esp
 73a:	5b                   	pop    %ebx
 73b:	5e                   	pop    %esi
 73c:	5d                   	pop    %ebp
 73d:	c3                   	ret    

0000073e <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 73e:	55                   	push   %ebp
 73f:	89 e5                	mov    %esp,%ebp
 741:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 744:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 74b:	8d 45 0c             	lea    0xc(%ebp),%eax
 74e:	83 c0 04             	add    $0x4,%eax
 751:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 754:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 75b:	e9 7c 01 00 00       	jmp    8dc <printf+0x19e>
    c = fmt[i] & 0xff;
 760:	8b 55 0c             	mov    0xc(%ebp),%edx
 763:	8b 45 f0             	mov    -0x10(%ebp),%eax
 766:	01 d0                	add    %edx,%eax
 768:	0f b6 00             	movzbl (%eax),%eax
 76b:	0f be c0             	movsbl %al,%eax
 76e:	25 ff 00 00 00       	and    $0xff,%eax
 773:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 776:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 77a:	75 2c                	jne    7a8 <printf+0x6a>
      if(c == '%'){
 77c:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 780:	75 0c                	jne    78e <printf+0x50>
        state = '%';
 782:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 789:	e9 4a 01 00 00       	jmp    8d8 <printf+0x19a>
      } else {
        putc(fd, c);
 78e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 791:	0f be c0             	movsbl %al,%eax
 794:	89 44 24 04          	mov    %eax,0x4(%esp)
 798:	8b 45 08             	mov    0x8(%ebp),%eax
 79b:	89 04 24             	mov    %eax,(%esp)
 79e:	e8 bb fe ff ff       	call   65e <putc>
 7a3:	e9 30 01 00 00       	jmp    8d8 <printf+0x19a>
      }
    } else if(state == '%'){
 7a8:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 7ac:	0f 85 26 01 00 00    	jne    8d8 <printf+0x19a>
      if(c == 'd'){
 7b2:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 7b6:	75 2d                	jne    7e5 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 7b8:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7bb:	8b 00                	mov    (%eax),%eax
 7bd:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 7c4:	00 
 7c5:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 7cc:	00 
 7cd:	89 44 24 04          	mov    %eax,0x4(%esp)
 7d1:	8b 45 08             	mov    0x8(%ebp),%eax
 7d4:	89 04 24             	mov    %eax,(%esp)
 7d7:	e8 aa fe ff ff       	call   686 <printint>
        ap++;
 7dc:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7e0:	e9 ec 00 00 00       	jmp    8d1 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 7e5:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 7e9:	74 06                	je     7f1 <printf+0xb3>
 7eb:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 7ef:	75 2d                	jne    81e <printf+0xe0>
        printint(fd, *ap, 16, 0);
 7f1:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7f4:	8b 00                	mov    (%eax),%eax
 7f6:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 7fd:	00 
 7fe:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 805:	00 
 806:	89 44 24 04          	mov    %eax,0x4(%esp)
 80a:	8b 45 08             	mov    0x8(%ebp),%eax
 80d:	89 04 24             	mov    %eax,(%esp)
 810:	e8 71 fe ff ff       	call   686 <printint>
        ap++;
 815:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 819:	e9 b3 00 00 00       	jmp    8d1 <printf+0x193>
      } else if(c == 's'){
 81e:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 822:	75 45                	jne    869 <printf+0x12b>
        s = (char*)*ap;
 824:	8b 45 e8             	mov    -0x18(%ebp),%eax
 827:	8b 00                	mov    (%eax),%eax
 829:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 82c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 830:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 834:	75 09                	jne    83f <printf+0x101>
          s = "(null)";
 836:	c7 45 f4 68 0b 00 00 	movl   $0xb68,-0xc(%ebp)
        while(*s != 0){
 83d:	eb 1e                	jmp    85d <printf+0x11f>
 83f:	eb 1c                	jmp    85d <printf+0x11f>
          putc(fd, *s);
 841:	8b 45 f4             	mov    -0xc(%ebp),%eax
 844:	0f b6 00             	movzbl (%eax),%eax
 847:	0f be c0             	movsbl %al,%eax
 84a:	89 44 24 04          	mov    %eax,0x4(%esp)
 84e:	8b 45 08             	mov    0x8(%ebp),%eax
 851:	89 04 24             	mov    %eax,(%esp)
 854:	e8 05 fe ff ff       	call   65e <putc>
          s++;
 859:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 85d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 860:	0f b6 00             	movzbl (%eax),%eax
 863:	84 c0                	test   %al,%al
 865:	75 da                	jne    841 <printf+0x103>
 867:	eb 68                	jmp    8d1 <printf+0x193>
        }
      } else if(c == 'c'){
 869:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 86d:	75 1d                	jne    88c <printf+0x14e>
        putc(fd, *ap);
 86f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 872:	8b 00                	mov    (%eax),%eax
 874:	0f be c0             	movsbl %al,%eax
 877:	89 44 24 04          	mov    %eax,0x4(%esp)
 87b:	8b 45 08             	mov    0x8(%ebp),%eax
 87e:	89 04 24             	mov    %eax,(%esp)
 881:	e8 d8 fd ff ff       	call   65e <putc>
        ap++;
 886:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 88a:	eb 45                	jmp    8d1 <printf+0x193>
      } else if(c == '%'){
 88c:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 890:	75 17                	jne    8a9 <printf+0x16b>
        putc(fd, c);
 892:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 895:	0f be c0             	movsbl %al,%eax
 898:	89 44 24 04          	mov    %eax,0x4(%esp)
 89c:	8b 45 08             	mov    0x8(%ebp),%eax
 89f:	89 04 24             	mov    %eax,(%esp)
 8a2:	e8 b7 fd ff ff       	call   65e <putc>
 8a7:	eb 28                	jmp    8d1 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 8a9:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 8b0:	00 
 8b1:	8b 45 08             	mov    0x8(%ebp),%eax
 8b4:	89 04 24             	mov    %eax,(%esp)
 8b7:	e8 a2 fd ff ff       	call   65e <putc>
        putc(fd, c);
 8bc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8bf:	0f be c0             	movsbl %al,%eax
 8c2:	89 44 24 04          	mov    %eax,0x4(%esp)
 8c6:	8b 45 08             	mov    0x8(%ebp),%eax
 8c9:	89 04 24             	mov    %eax,(%esp)
 8cc:	e8 8d fd ff ff       	call   65e <putc>
      }
      state = 0;
 8d1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 8d8:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 8dc:	8b 55 0c             	mov    0xc(%ebp),%edx
 8df:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8e2:	01 d0                	add    %edx,%eax
 8e4:	0f b6 00             	movzbl (%eax),%eax
 8e7:	84 c0                	test   %al,%al
 8e9:	0f 85 71 fe ff ff    	jne    760 <printf+0x22>
    }
  }
}
 8ef:	c9                   	leave  
 8f0:	c3                   	ret    

000008f1 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8f1:	55                   	push   %ebp
 8f2:	89 e5                	mov    %esp,%ebp
 8f4:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8f7:	8b 45 08             	mov    0x8(%ebp),%eax
 8fa:	83 e8 08             	sub    $0x8,%eax
 8fd:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 900:	a1 28 0e 00 00       	mov    0xe28,%eax
 905:	89 45 fc             	mov    %eax,-0x4(%ebp)
 908:	eb 24                	jmp    92e <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 90a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 90d:	8b 00                	mov    (%eax),%eax
 90f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 912:	77 12                	ja     926 <free+0x35>
 914:	8b 45 f8             	mov    -0x8(%ebp),%eax
 917:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 91a:	77 24                	ja     940 <free+0x4f>
 91c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 91f:	8b 00                	mov    (%eax),%eax
 921:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 924:	77 1a                	ja     940 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 926:	8b 45 fc             	mov    -0x4(%ebp),%eax
 929:	8b 00                	mov    (%eax),%eax
 92b:	89 45 fc             	mov    %eax,-0x4(%ebp)
 92e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 931:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 934:	76 d4                	jbe    90a <free+0x19>
 936:	8b 45 fc             	mov    -0x4(%ebp),%eax
 939:	8b 00                	mov    (%eax),%eax
 93b:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 93e:	76 ca                	jbe    90a <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 940:	8b 45 f8             	mov    -0x8(%ebp),%eax
 943:	8b 40 04             	mov    0x4(%eax),%eax
 946:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 94d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 950:	01 c2                	add    %eax,%edx
 952:	8b 45 fc             	mov    -0x4(%ebp),%eax
 955:	8b 00                	mov    (%eax),%eax
 957:	39 c2                	cmp    %eax,%edx
 959:	75 24                	jne    97f <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 95b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 95e:	8b 50 04             	mov    0x4(%eax),%edx
 961:	8b 45 fc             	mov    -0x4(%ebp),%eax
 964:	8b 00                	mov    (%eax),%eax
 966:	8b 40 04             	mov    0x4(%eax),%eax
 969:	01 c2                	add    %eax,%edx
 96b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 96e:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 971:	8b 45 fc             	mov    -0x4(%ebp),%eax
 974:	8b 00                	mov    (%eax),%eax
 976:	8b 10                	mov    (%eax),%edx
 978:	8b 45 f8             	mov    -0x8(%ebp),%eax
 97b:	89 10                	mov    %edx,(%eax)
 97d:	eb 0a                	jmp    989 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 97f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 982:	8b 10                	mov    (%eax),%edx
 984:	8b 45 f8             	mov    -0x8(%ebp),%eax
 987:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 989:	8b 45 fc             	mov    -0x4(%ebp),%eax
 98c:	8b 40 04             	mov    0x4(%eax),%eax
 98f:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 996:	8b 45 fc             	mov    -0x4(%ebp),%eax
 999:	01 d0                	add    %edx,%eax
 99b:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 99e:	75 20                	jne    9c0 <free+0xcf>
    p->s.size += bp->s.size;
 9a0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9a3:	8b 50 04             	mov    0x4(%eax),%edx
 9a6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9a9:	8b 40 04             	mov    0x4(%eax),%eax
 9ac:	01 c2                	add    %eax,%edx
 9ae:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9b1:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9b4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9b7:	8b 10                	mov    (%eax),%edx
 9b9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9bc:	89 10                	mov    %edx,(%eax)
 9be:	eb 08                	jmp    9c8 <free+0xd7>
  } else
    p->s.ptr = bp;
 9c0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9c3:	8b 55 f8             	mov    -0x8(%ebp),%edx
 9c6:	89 10                	mov    %edx,(%eax)
  freep = p;
 9c8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9cb:	a3 28 0e 00 00       	mov    %eax,0xe28
}
 9d0:	c9                   	leave  
 9d1:	c3                   	ret    

000009d2 <morecore>:

static Header*
morecore(uint nu)
{
 9d2:	55                   	push   %ebp
 9d3:	89 e5                	mov    %esp,%ebp
 9d5:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 9d8:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 9df:	77 07                	ja     9e8 <morecore+0x16>
    nu = 4096;
 9e1:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 9e8:	8b 45 08             	mov    0x8(%ebp),%eax
 9eb:	c1 e0 03             	shl    $0x3,%eax
 9ee:	89 04 24             	mov    %eax,(%esp)
 9f1:	e8 40 fc ff ff       	call   636 <sbrk>
 9f6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 9f9:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 9fd:	75 07                	jne    a06 <morecore+0x34>
    return 0;
 9ff:	b8 00 00 00 00       	mov    $0x0,%eax
 a04:	eb 22                	jmp    a28 <morecore+0x56>
  hp = (Header*)p;
 a06:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a09:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 a0c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a0f:	8b 55 08             	mov    0x8(%ebp),%edx
 a12:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 a15:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a18:	83 c0 08             	add    $0x8,%eax
 a1b:	89 04 24             	mov    %eax,(%esp)
 a1e:	e8 ce fe ff ff       	call   8f1 <free>
  return freep;
 a23:	a1 28 0e 00 00       	mov    0xe28,%eax
}
 a28:	c9                   	leave  
 a29:	c3                   	ret    

00000a2a <malloc>:

void*
malloc(uint nbytes)
{
 a2a:	55                   	push   %ebp
 a2b:	89 e5                	mov    %esp,%ebp
 a2d:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a30:	8b 45 08             	mov    0x8(%ebp),%eax
 a33:	83 c0 07             	add    $0x7,%eax
 a36:	c1 e8 03             	shr    $0x3,%eax
 a39:	83 c0 01             	add    $0x1,%eax
 a3c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 a3f:	a1 28 0e 00 00       	mov    0xe28,%eax
 a44:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a47:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 a4b:	75 23                	jne    a70 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 a4d:	c7 45 f0 20 0e 00 00 	movl   $0xe20,-0x10(%ebp)
 a54:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a57:	a3 28 0e 00 00       	mov    %eax,0xe28
 a5c:	a1 28 0e 00 00       	mov    0xe28,%eax
 a61:	a3 20 0e 00 00       	mov    %eax,0xe20
    base.s.size = 0;
 a66:	c7 05 24 0e 00 00 00 	movl   $0x0,0xe24
 a6d:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a70:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a73:	8b 00                	mov    (%eax),%eax
 a75:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 a78:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a7b:	8b 40 04             	mov    0x4(%eax),%eax
 a7e:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a81:	72 4d                	jb     ad0 <malloc+0xa6>
      if(p->s.size == nunits)
 a83:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a86:	8b 40 04             	mov    0x4(%eax),%eax
 a89:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a8c:	75 0c                	jne    a9a <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 a8e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a91:	8b 10                	mov    (%eax),%edx
 a93:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a96:	89 10                	mov    %edx,(%eax)
 a98:	eb 26                	jmp    ac0 <malloc+0x96>
      else {
        p->s.size -= nunits;
 a9a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a9d:	8b 40 04             	mov    0x4(%eax),%eax
 aa0:	2b 45 ec             	sub    -0x14(%ebp),%eax
 aa3:	89 c2                	mov    %eax,%edx
 aa5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aa8:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 aab:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aae:	8b 40 04             	mov    0x4(%eax),%eax
 ab1:	c1 e0 03             	shl    $0x3,%eax
 ab4:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 ab7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aba:	8b 55 ec             	mov    -0x14(%ebp),%edx
 abd:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 ac0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 ac3:	a3 28 0e 00 00       	mov    %eax,0xe28
      return (void*)(p + 1);
 ac8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 acb:	83 c0 08             	add    $0x8,%eax
 ace:	eb 38                	jmp    b08 <malloc+0xde>
    }
    if(p == freep)
 ad0:	a1 28 0e 00 00       	mov    0xe28,%eax
 ad5:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 ad8:	75 1b                	jne    af5 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 ada:	8b 45 ec             	mov    -0x14(%ebp),%eax
 add:	89 04 24             	mov    %eax,(%esp)
 ae0:	e8 ed fe ff ff       	call   9d2 <morecore>
 ae5:	89 45 f4             	mov    %eax,-0xc(%ebp)
 ae8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 aec:	75 07                	jne    af5 <malloc+0xcb>
        return 0;
 aee:	b8 00 00 00 00       	mov    $0x0,%eax
 af3:	eb 13                	jmp    b08 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 af5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 af8:	89 45 f0             	mov    %eax,-0x10(%ebp)
 afb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 afe:	8b 00                	mov    (%eax),%eax
 b00:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 b03:	e9 70 ff ff ff       	jmp    a78 <malloc+0x4e>
}
 b08:	c9                   	leave  
 b09:	c3                   	ret    
