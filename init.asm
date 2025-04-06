
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
  11:	c7 04 24 43 0a 00 00 	movl   $0xa43,(%esp)
  18:	e8 07 05 00 00       	call   524 <open>
  1d:	85 c0                	test   %eax,%eax
  1f:	79 30                	jns    51 <main+0x51>
    mknod("console", 1, 1);
  21:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
  28:	00 
  29:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  30:	00 
  31:	c7 04 24 43 0a 00 00 	movl   $0xa43,(%esp)
  38:	e8 ef 04 00 00       	call   52c <mknod>
    open("console", O_RDWR);
  3d:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
  44:	00 
  45:	c7 04 24 43 0a 00 00 	movl   $0xa43,(%esp)
  4c:	e8 d3 04 00 00       	call   524 <open>
  }
  dup(0);  // stdout
  51:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  58:	e8 ff 04 00 00       	call   55c <dup>
  dup(0);  // stderr
  5d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  64:	e8 f3 04 00 00       	call   55c <dup>

  for(;;){
    printf(1, "init: starting sh\n");
  69:	c7 44 24 04 4b 0a 00 	movl   $0xa4b,0x4(%esp)
  70:	00 
  71:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  78:	e8 f7 05 00 00       	call   674 <printf>
    pid = fork();
  7d:	e8 5a 04 00 00       	call   4dc <fork>
  82:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    if(pid < 0){
  86:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
  8b:	79 19                	jns    a6 <main+0xa6>
      printf(1, "init: fork failed\n");
  8d:	c7 44 24 04 5e 0a 00 	movl   $0xa5e,0x4(%esp)
  94:	00 
  95:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  9c:	e8 d3 05 00 00       	call   674 <printf>
      exit();
  a1:	e8 3e 04 00 00       	call   4e4 <exit>
    }
    if(pid == 0){
  a6:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
  ab:	75 2d                	jne    da <main+0xda>
      exec("sh", argv);
  ad:	c7 44 24 04 34 0d 00 	movl   $0xd34,0x4(%esp)
  b4:	00 
  b5:	c7 04 24 40 0a 00 00 	movl   $0xa40,(%esp)
  bc:	e8 5b 04 00 00       	call   51c <exec>
      printf(1, "init: exec sh failed\n");
  c1:	c7 44 24 04 71 0a 00 	movl   $0xa71,0x4(%esp)
  c8:	00 
  c9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  d0:	e8 9f 05 00 00       	call   674 <printf>
      exit();
  d5:	e8 0a 04 00 00       	call   4e4 <exit>
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  da:	eb 14                	jmp    f0 <main+0xf0>
      printf(1, "zombie!\n");
  dc:	c7 44 24 04 87 0a 00 	movl   $0xa87,0x4(%esp)
  e3:	00 
  e4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  eb:	e8 84 05 00 00       	call   674 <printf>
    while((wpid=wait()) >= 0 && wpid != pid)
  f0:	e8 f7 03 00 00       	call   4ec <wait>
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
#include "user.h"
#include "x86.h"
#include "param.h"
#include "pstat.h"

void ps(){
 134:	55                   	push   %ebp
 135:	89 e5                	mov    %esp,%ebp
 137:	57                   	push   %edi
 138:	56                   	push   %esi
 139:	53                   	push   %ebx
 13a:	81 ec 2c 09 00 00    	sub    $0x92c,%esp
  
  //pstatTable pst = malloc(NPROC * sizeof(pstat_t));
  pstat_t pst[NPROC];
  getpinfo(&pst);
 140:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 146:	89 04 24             	mov    %eax,(%esp)
 149:	e8 36 04 00 00       	call   584 <getpinfo>
  int i;
  for (i = 0; i < NPROC; i++){
 14e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 155:	e9 32 01 00 00       	jmp    28c <ps+0x158>
    if (pst[i].inuse == 1){
 15a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 15d:	89 d0                	mov    %edx,%eax
 15f:	c1 e0 03             	shl    $0x3,%eax
 162:	01 d0                	add    %edx,%eax
 164:	c1 e0 02             	shl    $0x2,%eax
 167:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 16a:	01 d8                	add    %ebx,%eax
 16c:	2d 04 09 00 00       	sub    $0x904,%eax
 171:	8b 00                	mov    (%eax),%eax
 173:	83 f8 01             	cmp    $0x1,%eax
 176:	0f 85 0c 01 00 00    	jne    288 <ps+0x154>
      printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 17c:	c7 44 24 04 90 0a 00 	movl   $0xa90,0x4(%esp)
 183:	00 
 184:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 18b:	e8 e4 04 00 00       	call   674 <printf>
      printf(1, "%d\t", pst[i].pid);
 190:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 193:	89 d0                	mov    %edx,%eax
 195:	c1 e0 03             	shl    $0x3,%eax
 198:	01 d0                	add    %edx,%eax
 19a:	c1 e0 02             	shl    $0x2,%eax
 19d:	8d 75 e8             	lea    -0x18(%ebp),%esi
 1a0:	01 f0                	add    %esi,%eax
 1a2:	2d fc 08 00 00       	sub    $0x8fc,%eax
 1a7:	8b 00                	mov    (%eax),%eax
 1a9:	89 44 24 08          	mov    %eax,0x8(%esp)
 1ad:	c7 44 24 04 a9 0a 00 	movl   $0xaa9,0x4(%esp)
 1b4:	00 
 1b5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1bc:	e8 b3 04 00 00       	call   674 <printf>
      printf(1, "%d\t", pst[i].tickets);
 1c1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 1c4:	89 d0                	mov    %edx,%eax
 1c6:	c1 e0 03             	shl    $0x3,%eax
 1c9:	01 d0                	add    %edx,%eax
 1cb:	c1 e0 02             	shl    $0x2,%eax
 1ce:	8d 7d e8             	lea    -0x18(%ebp),%edi
 1d1:	01 f8                	add    %edi,%eax
 1d3:	2d 00 09 00 00       	sub    $0x900,%eax
 1d8:	8b 00                	mov    (%eax),%eax
 1da:	89 44 24 08          	mov    %eax,0x8(%esp)
 1de:	c7 44 24 04 a9 0a 00 	movl   $0xaa9,0x4(%esp)
 1e5:	00 
 1e6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1ed:	e8 82 04 00 00       	call   674 <printf>
      printf(1, "%d\t", pst[i].ticks);
 1f2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 1f5:	89 d0                	mov    %edx,%eax
 1f7:	c1 e0 03             	shl    $0x3,%eax
 1fa:	01 d0                	add    %edx,%eax
 1fc:	c1 e0 02             	shl    $0x2,%eax
 1ff:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 202:	01 c8                	add    %ecx,%eax
 204:	2d f8 08 00 00       	sub    $0x8f8,%eax
 209:	8b 00                	mov    (%eax),%eax
 20b:	89 44 24 08          	mov    %eax,0x8(%esp)
 20f:	c7 44 24 04 a9 0a 00 	movl   $0xaa9,0x4(%esp)
 216:	00 
 217:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 21e:	e8 51 04 00 00       	call   674 <printf>
      printf(1, "%c\t", pst[i].state);
 223:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 226:	89 d0                	mov    %edx,%eax
 228:	c1 e0 03             	shl    $0x3,%eax
 22b:	01 d0                	add    %edx,%eax
 22d:	c1 e0 02             	shl    $0x2,%eax
 230:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 233:	01 d8                	add    %ebx,%eax
 235:	2d e4 08 00 00       	sub    $0x8e4,%eax
 23a:	0f b6 00             	movzbl (%eax),%eax
 23d:	0f be c0             	movsbl %al,%eax
 240:	89 44 24 08          	mov    %eax,0x8(%esp)
 244:	c7 44 24 04 ad 0a 00 	movl   $0xaad,0x4(%esp)
 24b:	00 
 24c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 253:	e8 1c 04 00 00       	call   674 <printf>
      printf(1, "%s\t\n", pst[i].name);
 258:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 25e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 261:	89 d0                	mov    %edx,%eax
 263:	c1 e0 03             	shl    $0x3,%eax
 266:	01 d0                	add    %edx,%eax
 268:	c1 e0 02             	shl    $0x2,%eax
 26b:	83 c0 10             	add    $0x10,%eax
 26e:	01 c8                	add    %ecx,%eax
 270:	89 44 24 08          	mov    %eax,0x8(%esp)
 274:	c7 44 24 04 b1 0a 00 	movl   $0xab1,0x4(%esp)
 27b:	00 
 27c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 283:	e8 ec 03 00 00       	call   674 <printf>
  for (i = 0; i < NPROC; i++){
 288:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 28c:	83 7d e4 3f          	cmpl   $0x3f,-0x1c(%ebp)
 290:	0f 8e c4 fe ff ff    	jle    15a <ps+0x26>
    }
  }
}
 296:	81 c4 2c 09 00 00    	add    $0x92c,%esp
 29c:	5b                   	pop    %ebx
 29d:	5e                   	pop    %esi
 29e:	5f                   	pop    %edi
 29f:	5d                   	pop    %ebp
 2a0:	c3                   	ret    

000002a1 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 2a1:	55                   	push   %ebp
 2a2:	89 e5                	mov    %esp,%ebp
 2a4:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 2a7:	8b 45 08             	mov    0x8(%ebp),%eax
 2aa:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 2ad:	90                   	nop
 2ae:	8b 45 08             	mov    0x8(%ebp),%eax
 2b1:	8d 50 01             	lea    0x1(%eax),%edx
 2b4:	89 55 08             	mov    %edx,0x8(%ebp)
 2b7:	8b 55 0c             	mov    0xc(%ebp),%edx
 2ba:	8d 4a 01             	lea    0x1(%edx),%ecx
 2bd:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 2c0:	0f b6 12             	movzbl (%edx),%edx
 2c3:	88 10                	mov    %dl,(%eax)
 2c5:	0f b6 00             	movzbl (%eax),%eax
 2c8:	84 c0                	test   %al,%al
 2ca:	75 e2                	jne    2ae <strcpy+0xd>
    ;
  return os;
 2cc:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 2cf:	c9                   	leave  
 2d0:	c3                   	ret    

000002d1 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2d1:	55                   	push   %ebp
 2d2:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 2d4:	eb 08                	jmp    2de <strcmp+0xd>
    p++, q++;
 2d6:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2da:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 2de:	8b 45 08             	mov    0x8(%ebp),%eax
 2e1:	0f b6 00             	movzbl (%eax),%eax
 2e4:	84 c0                	test   %al,%al
 2e6:	74 10                	je     2f8 <strcmp+0x27>
 2e8:	8b 45 08             	mov    0x8(%ebp),%eax
 2eb:	0f b6 10             	movzbl (%eax),%edx
 2ee:	8b 45 0c             	mov    0xc(%ebp),%eax
 2f1:	0f b6 00             	movzbl (%eax),%eax
 2f4:	38 c2                	cmp    %al,%dl
 2f6:	74 de                	je     2d6 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 2f8:	8b 45 08             	mov    0x8(%ebp),%eax
 2fb:	0f b6 00             	movzbl (%eax),%eax
 2fe:	0f b6 d0             	movzbl %al,%edx
 301:	8b 45 0c             	mov    0xc(%ebp),%eax
 304:	0f b6 00             	movzbl (%eax),%eax
 307:	0f b6 c0             	movzbl %al,%eax
 30a:	29 c2                	sub    %eax,%edx
 30c:	89 d0                	mov    %edx,%eax
}
 30e:	5d                   	pop    %ebp
 30f:	c3                   	ret    

00000310 <strlen>:

uint
strlen(const char *s)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 316:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 31d:	eb 04                	jmp    323 <strlen+0x13>
 31f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 323:	8b 55 fc             	mov    -0x4(%ebp),%edx
 326:	8b 45 08             	mov    0x8(%ebp),%eax
 329:	01 d0                	add    %edx,%eax
 32b:	0f b6 00             	movzbl (%eax),%eax
 32e:	84 c0                	test   %al,%al
 330:	75 ed                	jne    31f <strlen+0xf>
    ;
  return n;
 332:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 335:	c9                   	leave  
 336:	c3                   	ret    

00000337 <memset>:

void*
memset(void *dst, int c, uint n)
{
 337:	55                   	push   %ebp
 338:	89 e5                	mov    %esp,%ebp
 33a:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 33d:	8b 45 10             	mov    0x10(%ebp),%eax
 340:	89 44 24 08          	mov    %eax,0x8(%esp)
 344:	8b 45 0c             	mov    0xc(%ebp),%eax
 347:	89 44 24 04          	mov    %eax,0x4(%esp)
 34b:	8b 45 08             	mov    0x8(%ebp),%eax
 34e:	89 04 24             	mov    %eax,(%esp)
 351:	e8 b9 fd ff ff       	call   10f <stosb>
  return dst;
 356:	8b 45 08             	mov    0x8(%ebp),%eax
}
 359:	c9                   	leave  
 35a:	c3                   	ret    

0000035b <strchr>:

char*
strchr(const char *s, char c)
{
 35b:	55                   	push   %ebp
 35c:	89 e5                	mov    %esp,%ebp
 35e:	83 ec 04             	sub    $0x4,%esp
 361:	8b 45 0c             	mov    0xc(%ebp),%eax
 364:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 367:	eb 14                	jmp    37d <strchr+0x22>
    if(*s == c)
 369:	8b 45 08             	mov    0x8(%ebp),%eax
 36c:	0f b6 00             	movzbl (%eax),%eax
 36f:	3a 45 fc             	cmp    -0x4(%ebp),%al
 372:	75 05                	jne    379 <strchr+0x1e>
      return (char*)s;
 374:	8b 45 08             	mov    0x8(%ebp),%eax
 377:	eb 13                	jmp    38c <strchr+0x31>
  for(; *s; s++)
 379:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 37d:	8b 45 08             	mov    0x8(%ebp),%eax
 380:	0f b6 00             	movzbl (%eax),%eax
 383:	84 c0                	test   %al,%al
 385:	75 e2                	jne    369 <strchr+0xe>
  return 0;
 387:	b8 00 00 00 00       	mov    $0x0,%eax
}
 38c:	c9                   	leave  
 38d:	c3                   	ret    

0000038e <gets>:

char*
gets(char *buf, int max)
{
 38e:	55                   	push   %ebp
 38f:	89 e5                	mov    %esp,%ebp
 391:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 394:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 39b:	eb 4c                	jmp    3e9 <gets+0x5b>
    cc = read(0, &c, 1);
 39d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3a4:	00 
 3a5:	8d 45 ef             	lea    -0x11(%ebp),%eax
 3a8:	89 44 24 04          	mov    %eax,0x4(%esp)
 3ac:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 3b3:	e8 44 01 00 00       	call   4fc <read>
 3b8:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 3bb:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 3bf:	7f 02                	jg     3c3 <gets+0x35>
      break;
 3c1:	eb 31                	jmp    3f4 <gets+0x66>
    buf[i++] = c;
 3c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3c6:	8d 50 01             	lea    0x1(%eax),%edx
 3c9:	89 55 f4             	mov    %edx,-0xc(%ebp)
 3cc:	89 c2                	mov    %eax,%edx
 3ce:	8b 45 08             	mov    0x8(%ebp),%eax
 3d1:	01 c2                	add    %eax,%edx
 3d3:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 3d7:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 3d9:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 3dd:	3c 0a                	cmp    $0xa,%al
 3df:	74 13                	je     3f4 <gets+0x66>
 3e1:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 3e5:	3c 0d                	cmp    $0xd,%al
 3e7:	74 0b                	je     3f4 <gets+0x66>
  for(i=0; i+1 < max; ){
 3e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3ec:	83 c0 01             	add    $0x1,%eax
 3ef:	3b 45 0c             	cmp    0xc(%ebp),%eax
 3f2:	7c a9                	jl     39d <gets+0xf>
      break;
  }
  buf[i] = '\0';
 3f4:	8b 55 f4             	mov    -0xc(%ebp),%edx
 3f7:	8b 45 08             	mov    0x8(%ebp),%eax
 3fa:	01 d0                	add    %edx,%eax
 3fc:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 3ff:	8b 45 08             	mov    0x8(%ebp),%eax
}
 402:	c9                   	leave  
 403:	c3                   	ret    

00000404 <stat>:

int
stat(const char *n, struct stat *st)
{
 404:	55                   	push   %ebp
 405:	89 e5                	mov    %esp,%ebp
 407:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 40a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 411:	00 
 412:	8b 45 08             	mov    0x8(%ebp),%eax
 415:	89 04 24             	mov    %eax,(%esp)
 418:	e8 07 01 00 00       	call   524 <open>
 41d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 420:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 424:	79 07                	jns    42d <stat+0x29>
    return -1;
 426:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 42b:	eb 23                	jmp    450 <stat+0x4c>
  r = fstat(fd, st);
 42d:	8b 45 0c             	mov    0xc(%ebp),%eax
 430:	89 44 24 04          	mov    %eax,0x4(%esp)
 434:	8b 45 f4             	mov    -0xc(%ebp),%eax
 437:	89 04 24             	mov    %eax,(%esp)
 43a:	e8 fd 00 00 00       	call   53c <fstat>
 43f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 442:	8b 45 f4             	mov    -0xc(%ebp),%eax
 445:	89 04 24             	mov    %eax,(%esp)
 448:	e8 bf 00 00 00       	call   50c <close>
  return r;
 44d:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 450:	c9                   	leave  
 451:	c3                   	ret    

00000452 <atoi>:

int
atoi(const char *s)
{
 452:	55                   	push   %ebp
 453:	89 e5                	mov    %esp,%ebp
 455:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 458:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 45f:	eb 25                	jmp    486 <atoi+0x34>
    n = n*10 + *s++ - '0';
 461:	8b 55 fc             	mov    -0x4(%ebp),%edx
 464:	89 d0                	mov    %edx,%eax
 466:	c1 e0 02             	shl    $0x2,%eax
 469:	01 d0                	add    %edx,%eax
 46b:	01 c0                	add    %eax,%eax
 46d:	89 c1                	mov    %eax,%ecx
 46f:	8b 45 08             	mov    0x8(%ebp),%eax
 472:	8d 50 01             	lea    0x1(%eax),%edx
 475:	89 55 08             	mov    %edx,0x8(%ebp)
 478:	0f b6 00             	movzbl (%eax),%eax
 47b:	0f be c0             	movsbl %al,%eax
 47e:	01 c8                	add    %ecx,%eax
 480:	83 e8 30             	sub    $0x30,%eax
 483:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 486:	8b 45 08             	mov    0x8(%ebp),%eax
 489:	0f b6 00             	movzbl (%eax),%eax
 48c:	3c 2f                	cmp    $0x2f,%al
 48e:	7e 0a                	jle    49a <atoi+0x48>
 490:	8b 45 08             	mov    0x8(%ebp),%eax
 493:	0f b6 00             	movzbl (%eax),%eax
 496:	3c 39                	cmp    $0x39,%al
 498:	7e c7                	jle    461 <atoi+0xf>
  return n;
 49a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 49d:	c9                   	leave  
 49e:	c3                   	ret    

0000049f <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 49f:	55                   	push   %ebp
 4a0:	89 e5                	mov    %esp,%ebp
 4a2:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 4a5:	8b 45 08             	mov    0x8(%ebp),%eax
 4a8:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 4ab:	8b 45 0c             	mov    0xc(%ebp),%eax
 4ae:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 4b1:	eb 17                	jmp    4ca <memmove+0x2b>
    *dst++ = *src++;
 4b3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 4b6:	8d 50 01             	lea    0x1(%eax),%edx
 4b9:	89 55 fc             	mov    %edx,-0x4(%ebp)
 4bc:	8b 55 f8             	mov    -0x8(%ebp),%edx
 4bf:	8d 4a 01             	lea    0x1(%edx),%ecx
 4c2:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 4c5:	0f b6 12             	movzbl (%edx),%edx
 4c8:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 4ca:	8b 45 10             	mov    0x10(%ebp),%eax
 4cd:	8d 50 ff             	lea    -0x1(%eax),%edx
 4d0:	89 55 10             	mov    %edx,0x10(%ebp)
 4d3:	85 c0                	test   %eax,%eax
 4d5:	7f dc                	jg     4b3 <memmove+0x14>
  return vdst;
 4d7:	8b 45 08             	mov    0x8(%ebp),%eax
}
 4da:	c9                   	leave  
 4db:	c3                   	ret    

000004dc <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4dc:	b8 01 00 00 00       	mov    $0x1,%eax
 4e1:	cd 40                	int    $0x40
 4e3:	c3                   	ret    

000004e4 <exit>:
SYSCALL(exit)
 4e4:	b8 02 00 00 00       	mov    $0x2,%eax
 4e9:	cd 40                	int    $0x40
 4eb:	c3                   	ret    

000004ec <wait>:
SYSCALL(wait)
 4ec:	b8 03 00 00 00       	mov    $0x3,%eax
 4f1:	cd 40                	int    $0x40
 4f3:	c3                   	ret    

000004f4 <pipe>:
SYSCALL(pipe)
 4f4:	b8 04 00 00 00       	mov    $0x4,%eax
 4f9:	cd 40                	int    $0x40
 4fb:	c3                   	ret    

000004fc <read>:
SYSCALL(read)
 4fc:	b8 05 00 00 00       	mov    $0x5,%eax
 501:	cd 40                	int    $0x40
 503:	c3                   	ret    

00000504 <write>:
SYSCALL(write)
 504:	b8 10 00 00 00       	mov    $0x10,%eax
 509:	cd 40                	int    $0x40
 50b:	c3                   	ret    

0000050c <close>:
SYSCALL(close)
 50c:	b8 15 00 00 00       	mov    $0x15,%eax
 511:	cd 40                	int    $0x40
 513:	c3                   	ret    

00000514 <kill>:
SYSCALL(kill)
 514:	b8 06 00 00 00       	mov    $0x6,%eax
 519:	cd 40                	int    $0x40
 51b:	c3                   	ret    

0000051c <exec>:
SYSCALL(exec)
 51c:	b8 07 00 00 00       	mov    $0x7,%eax
 521:	cd 40                	int    $0x40
 523:	c3                   	ret    

00000524 <open>:
SYSCALL(open)
 524:	b8 0f 00 00 00       	mov    $0xf,%eax
 529:	cd 40                	int    $0x40
 52b:	c3                   	ret    

0000052c <mknod>:
SYSCALL(mknod)
 52c:	b8 11 00 00 00       	mov    $0x11,%eax
 531:	cd 40                	int    $0x40
 533:	c3                   	ret    

00000534 <unlink>:
SYSCALL(unlink)
 534:	b8 12 00 00 00       	mov    $0x12,%eax
 539:	cd 40                	int    $0x40
 53b:	c3                   	ret    

0000053c <fstat>:
SYSCALL(fstat)
 53c:	b8 08 00 00 00       	mov    $0x8,%eax
 541:	cd 40                	int    $0x40
 543:	c3                   	ret    

00000544 <link>:
SYSCALL(link)
 544:	b8 13 00 00 00       	mov    $0x13,%eax
 549:	cd 40                	int    $0x40
 54b:	c3                   	ret    

0000054c <mkdir>:
SYSCALL(mkdir)
 54c:	b8 14 00 00 00       	mov    $0x14,%eax
 551:	cd 40                	int    $0x40
 553:	c3                   	ret    

00000554 <chdir>:
SYSCALL(chdir)
 554:	b8 09 00 00 00       	mov    $0x9,%eax
 559:	cd 40                	int    $0x40
 55b:	c3                   	ret    

0000055c <dup>:
SYSCALL(dup)
 55c:	b8 0a 00 00 00       	mov    $0xa,%eax
 561:	cd 40                	int    $0x40
 563:	c3                   	ret    

00000564 <getpid>:
SYSCALL(getpid)
 564:	b8 0b 00 00 00       	mov    $0xb,%eax
 569:	cd 40                	int    $0x40
 56b:	c3                   	ret    

0000056c <sbrk>:
SYSCALL(sbrk)
 56c:	b8 0c 00 00 00       	mov    $0xc,%eax
 571:	cd 40                	int    $0x40
 573:	c3                   	ret    

00000574 <sleep>:
SYSCALL(sleep)
 574:	b8 0d 00 00 00       	mov    $0xd,%eax
 579:	cd 40                	int    $0x40
 57b:	c3                   	ret    

0000057c <uptime>:
SYSCALL(uptime)
 57c:	b8 0e 00 00 00       	mov    $0xe,%eax
 581:	cd 40                	int    $0x40
 583:	c3                   	ret    

00000584 <getpinfo>:
SYSCALL(getpinfo)
 584:	b8 16 00 00 00       	mov    $0x16,%eax
 589:	cd 40                	int    $0x40
 58b:	c3                   	ret    

0000058c <settickets>:
SYSCALL(settickets)
 58c:	b8 17 00 00 00       	mov    $0x17,%eax
 591:	cd 40                	int    $0x40
 593:	c3                   	ret    

00000594 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 594:	55                   	push   %ebp
 595:	89 e5                	mov    %esp,%ebp
 597:	83 ec 18             	sub    $0x18,%esp
 59a:	8b 45 0c             	mov    0xc(%ebp),%eax
 59d:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 5a0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5a7:	00 
 5a8:	8d 45 f4             	lea    -0xc(%ebp),%eax
 5ab:	89 44 24 04          	mov    %eax,0x4(%esp)
 5af:	8b 45 08             	mov    0x8(%ebp),%eax
 5b2:	89 04 24             	mov    %eax,(%esp)
 5b5:	e8 4a ff ff ff       	call   504 <write>
}
 5ba:	c9                   	leave  
 5bb:	c3                   	ret    

000005bc <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5bc:	55                   	push   %ebp
 5bd:	89 e5                	mov    %esp,%ebp
 5bf:	56                   	push   %esi
 5c0:	53                   	push   %ebx
 5c1:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 5c4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 5cb:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 5cf:	74 17                	je     5e8 <printint+0x2c>
 5d1:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 5d5:	79 11                	jns    5e8 <printint+0x2c>
    neg = 1;
 5d7:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 5de:	8b 45 0c             	mov    0xc(%ebp),%eax
 5e1:	f7 d8                	neg    %eax
 5e3:	89 45 ec             	mov    %eax,-0x14(%ebp)
 5e6:	eb 06                	jmp    5ee <printint+0x32>
  } else {
    x = xx;
 5e8:	8b 45 0c             	mov    0xc(%ebp),%eax
 5eb:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 5ee:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 5f5:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 5f8:	8d 41 01             	lea    0x1(%ecx),%eax
 5fb:	89 45 f4             	mov    %eax,-0xc(%ebp)
 5fe:	8b 5d 10             	mov    0x10(%ebp),%ebx
 601:	8b 45 ec             	mov    -0x14(%ebp),%eax
 604:	ba 00 00 00 00       	mov    $0x0,%edx
 609:	f7 f3                	div    %ebx
 60b:	89 d0                	mov    %edx,%eax
 60d:	0f b6 80 3c 0d 00 00 	movzbl 0xd3c(%eax),%eax
 614:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 618:	8b 75 10             	mov    0x10(%ebp),%esi
 61b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 61e:	ba 00 00 00 00       	mov    $0x0,%edx
 623:	f7 f6                	div    %esi
 625:	89 45 ec             	mov    %eax,-0x14(%ebp)
 628:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 62c:	75 c7                	jne    5f5 <printint+0x39>
  if(neg)
 62e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 632:	74 10                	je     644 <printint+0x88>
    buf[i++] = '-';
 634:	8b 45 f4             	mov    -0xc(%ebp),%eax
 637:	8d 50 01             	lea    0x1(%eax),%edx
 63a:	89 55 f4             	mov    %edx,-0xc(%ebp)
 63d:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 642:	eb 1f                	jmp    663 <printint+0xa7>
 644:	eb 1d                	jmp    663 <printint+0xa7>
    putc(fd, buf[i]);
 646:	8d 55 dc             	lea    -0x24(%ebp),%edx
 649:	8b 45 f4             	mov    -0xc(%ebp),%eax
 64c:	01 d0                	add    %edx,%eax
 64e:	0f b6 00             	movzbl (%eax),%eax
 651:	0f be c0             	movsbl %al,%eax
 654:	89 44 24 04          	mov    %eax,0x4(%esp)
 658:	8b 45 08             	mov    0x8(%ebp),%eax
 65b:	89 04 24             	mov    %eax,(%esp)
 65e:	e8 31 ff ff ff       	call   594 <putc>
  while(--i >= 0)
 663:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 667:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 66b:	79 d9                	jns    646 <printint+0x8a>
}
 66d:	83 c4 30             	add    $0x30,%esp
 670:	5b                   	pop    %ebx
 671:	5e                   	pop    %esi
 672:	5d                   	pop    %ebp
 673:	c3                   	ret    

00000674 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 674:	55                   	push   %ebp
 675:	89 e5                	mov    %esp,%ebp
 677:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 67a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 681:	8d 45 0c             	lea    0xc(%ebp),%eax
 684:	83 c0 04             	add    $0x4,%eax
 687:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 68a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 691:	e9 7c 01 00 00       	jmp    812 <printf+0x19e>
    c = fmt[i] & 0xff;
 696:	8b 55 0c             	mov    0xc(%ebp),%edx
 699:	8b 45 f0             	mov    -0x10(%ebp),%eax
 69c:	01 d0                	add    %edx,%eax
 69e:	0f b6 00             	movzbl (%eax),%eax
 6a1:	0f be c0             	movsbl %al,%eax
 6a4:	25 ff 00 00 00       	and    $0xff,%eax
 6a9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 6ac:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 6b0:	75 2c                	jne    6de <printf+0x6a>
      if(c == '%'){
 6b2:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 6b6:	75 0c                	jne    6c4 <printf+0x50>
        state = '%';
 6b8:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 6bf:	e9 4a 01 00 00       	jmp    80e <printf+0x19a>
      } else {
        putc(fd, c);
 6c4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6c7:	0f be c0             	movsbl %al,%eax
 6ca:	89 44 24 04          	mov    %eax,0x4(%esp)
 6ce:	8b 45 08             	mov    0x8(%ebp),%eax
 6d1:	89 04 24             	mov    %eax,(%esp)
 6d4:	e8 bb fe ff ff       	call   594 <putc>
 6d9:	e9 30 01 00 00       	jmp    80e <printf+0x19a>
      }
    } else if(state == '%'){
 6de:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 6e2:	0f 85 26 01 00 00    	jne    80e <printf+0x19a>
      if(c == 'd'){
 6e8:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 6ec:	75 2d                	jne    71b <printf+0xa7>
        printint(fd, *ap, 10, 1);
 6ee:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6f1:	8b 00                	mov    (%eax),%eax
 6f3:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 6fa:	00 
 6fb:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 702:	00 
 703:	89 44 24 04          	mov    %eax,0x4(%esp)
 707:	8b 45 08             	mov    0x8(%ebp),%eax
 70a:	89 04 24             	mov    %eax,(%esp)
 70d:	e8 aa fe ff ff       	call   5bc <printint>
        ap++;
 712:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 716:	e9 ec 00 00 00       	jmp    807 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 71b:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 71f:	74 06                	je     727 <printf+0xb3>
 721:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 725:	75 2d                	jne    754 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 727:	8b 45 e8             	mov    -0x18(%ebp),%eax
 72a:	8b 00                	mov    (%eax),%eax
 72c:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 733:	00 
 734:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 73b:	00 
 73c:	89 44 24 04          	mov    %eax,0x4(%esp)
 740:	8b 45 08             	mov    0x8(%ebp),%eax
 743:	89 04 24             	mov    %eax,(%esp)
 746:	e8 71 fe ff ff       	call   5bc <printint>
        ap++;
 74b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 74f:	e9 b3 00 00 00       	jmp    807 <printf+0x193>
      } else if(c == 's'){
 754:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 758:	75 45                	jne    79f <printf+0x12b>
        s = (char*)*ap;
 75a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 75d:	8b 00                	mov    (%eax),%eax
 75f:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 762:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 766:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 76a:	75 09                	jne    775 <printf+0x101>
          s = "(null)";
 76c:	c7 45 f4 b6 0a 00 00 	movl   $0xab6,-0xc(%ebp)
        while(*s != 0){
 773:	eb 1e                	jmp    793 <printf+0x11f>
 775:	eb 1c                	jmp    793 <printf+0x11f>
          putc(fd, *s);
 777:	8b 45 f4             	mov    -0xc(%ebp),%eax
 77a:	0f b6 00             	movzbl (%eax),%eax
 77d:	0f be c0             	movsbl %al,%eax
 780:	89 44 24 04          	mov    %eax,0x4(%esp)
 784:	8b 45 08             	mov    0x8(%ebp),%eax
 787:	89 04 24             	mov    %eax,(%esp)
 78a:	e8 05 fe ff ff       	call   594 <putc>
          s++;
 78f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 793:	8b 45 f4             	mov    -0xc(%ebp),%eax
 796:	0f b6 00             	movzbl (%eax),%eax
 799:	84 c0                	test   %al,%al
 79b:	75 da                	jne    777 <printf+0x103>
 79d:	eb 68                	jmp    807 <printf+0x193>
        }
      } else if(c == 'c'){
 79f:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 7a3:	75 1d                	jne    7c2 <printf+0x14e>
        putc(fd, *ap);
 7a5:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7a8:	8b 00                	mov    (%eax),%eax
 7aa:	0f be c0             	movsbl %al,%eax
 7ad:	89 44 24 04          	mov    %eax,0x4(%esp)
 7b1:	8b 45 08             	mov    0x8(%ebp),%eax
 7b4:	89 04 24             	mov    %eax,(%esp)
 7b7:	e8 d8 fd ff ff       	call   594 <putc>
        ap++;
 7bc:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7c0:	eb 45                	jmp    807 <printf+0x193>
      } else if(c == '%'){
 7c2:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 7c6:	75 17                	jne    7df <printf+0x16b>
        putc(fd, c);
 7c8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7cb:	0f be c0             	movsbl %al,%eax
 7ce:	89 44 24 04          	mov    %eax,0x4(%esp)
 7d2:	8b 45 08             	mov    0x8(%ebp),%eax
 7d5:	89 04 24             	mov    %eax,(%esp)
 7d8:	e8 b7 fd ff ff       	call   594 <putc>
 7dd:	eb 28                	jmp    807 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 7df:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 7e6:	00 
 7e7:	8b 45 08             	mov    0x8(%ebp),%eax
 7ea:	89 04 24             	mov    %eax,(%esp)
 7ed:	e8 a2 fd ff ff       	call   594 <putc>
        putc(fd, c);
 7f2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7f5:	0f be c0             	movsbl %al,%eax
 7f8:	89 44 24 04          	mov    %eax,0x4(%esp)
 7fc:	8b 45 08             	mov    0x8(%ebp),%eax
 7ff:	89 04 24             	mov    %eax,(%esp)
 802:	e8 8d fd ff ff       	call   594 <putc>
      }
      state = 0;
 807:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 80e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 812:	8b 55 0c             	mov    0xc(%ebp),%edx
 815:	8b 45 f0             	mov    -0x10(%ebp),%eax
 818:	01 d0                	add    %edx,%eax
 81a:	0f b6 00             	movzbl (%eax),%eax
 81d:	84 c0                	test   %al,%al
 81f:	0f 85 71 fe ff ff    	jne    696 <printf+0x22>
    }
  }
}
 825:	c9                   	leave  
 826:	c3                   	ret    

00000827 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 827:	55                   	push   %ebp
 828:	89 e5                	mov    %esp,%ebp
 82a:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 82d:	8b 45 08             	mov    0x8(%ebp),%eax
 830:	83 e8 08             	sub    $0x8,%eax
 833:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 836:	a1 58 0d 00 00       	mov    0xd58,%eax
 83b:	89 45 fc             	mov    %eax,-0x4(%ebp)
 83e:	eb 24                	jmp    864 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 840:	8b 45 fc             	mov    -0x4(%ebp),%eax
 843:	8b 00                	mov    (%eax),%eax
 845:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 848:	77 12                	ja     85c <free+0x35>
 84a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 84d:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 850:	77 24                	ja     876 <free+0x4f>
 852:	8b 45 fc             	mov    -0x4(%ebp),%eax
 855:	8b 00                	mov    (%eax),%eax
 857:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 85a:	77 1a                	ja     876 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 85c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 85f:	8b 00                	mov    (%eax),%eax
 861:	89 45 fc             	mov    %eax,-0x4(%ebp)
 864:	8b 45 f8             	mov    -0x8(%ebp),%eax
 867:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 86a:	76 d4                	jbe    840 <free+0x19>
 86c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 86f:	8b 00                	mov    (%eax),%eax
 871:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 874:	76 ca                	jbe    840 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 876:	8b 45 f8             	mov    -0x8(%ebp),%eax
 879:	8b 40 04             	mov    0x4(%eax),%eax
 87c:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 883:	8b 45 f8             	mov    -0x8(%ebp),%eax
 886:	01 c2                	add    %eax,%edx
 888:	8b 45 fc             	mov    -0x4(%ebp),%eax
 88b:	8b 00                	mov    (%eax),%eax
 88d:	39 c2                	cmp    %eax,%edx
 88f:	75 24                	jne    8b5 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 891:	8b 45 f8             	mov    -0x8(%ebp),%eax
 894:	8b 50 04             	mov    0x4(%eax),%edx
 897:	8b 45 fc             	mov    -0x4(%ebp),%eax
 89a:	8b 00                	mov    (%eax),%eax
 89c:	8b 40 04             	mov    0x4(%eax),%eax
 89f:	01 c2                	add    %eax,%edx
 8a1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8a4:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 8a7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8aa:	8b 00                	mov    (%eax),%eax
 8ac:	8b 10                	mov    (%eax),%edx
 8ae:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8b1:	89 10                	mov    %edx,(%eax)
 8b3:	eb 0a                	jmp    8bf <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 8b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8b8:	8b 10                	mov    (%eax),%edx
 8ba:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8bd:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 8bf:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8c2:	8b 40 04             	mov    0x4(%eax),%eax
 8c5:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 8cc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8cf:	01 d0                	add    %edx,%eax
 8d1:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8d4:	75 20                	jne    8f6 <free+0xcf>
    p->s.size += bp->s.size;
 8d6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8d9:	8b 50 04             	mov    0x4(%eax),%edx
 8dc:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8df:	8b 40 04             	mov    0x4(%eax),%eax
 8e2:	01 c2                	add    %eax,%edx
 8e4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8e7:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8ea:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8ed:	8b 10                	mov    (%eax),%edx
 8ef:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8f2:	89 10                	mov    %edx,(%eax)
 8f4:	eb 08                	jmp    8fe <free+0xd7>
  } else
    p->s.ptr = bp;
 8f6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8f9:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8fc:	89 10                	mov    %edx,(%eax)
  freep = p;
 8fe:	8b 45 fc             	mov    -0x4(%ebp),%eax
 901:	a3 58 0d 00 00       	mov    %eax,0xd58
}
 906:	c9                   	leave  
 907:	c3                   	ret    

00000908 <morecore>:

static Header*
morecore(uint nu)
{
 908:	55                   	push   %ebp
 909:	89 e5                	mov    %esp,%ebp
 90b:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 90e:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 915:	77 07                	ja     91e <morecore+0x16>
    nu = 4096;
 917:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 91e:	8b 45 08             	mov    0x8(%ebp),%eax
 921:	c1 e0 03             	shl    $0x3,%eax
 924:	89 04 24             	mov    %eax,(%esp)
 927:	e8 40 fc ff ff       	call   56c <sbrk>
 92c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 92f:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 933:	75 07                	jne    93c <morecore+0x34>
    return 0;
 935:	b8 00 00 00 00       	mov    $0x0,%eax
 93a:	eb 22                	jmp    95e <morecore+0x56>
  hp = (Header*)p;
 93c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 93f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 942:	8b 45 f0             	mov    -0x10(%ebp),%eax
 945:	8b 55 08             	mov    0x8(%ebp),%edx
 948:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 94b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 94e:	83 c0 08             	add    $0x8,%eax
 951:	89 04 24             	mov    %eax,(%esp)
 954:	e8 ce fe ff ff       	call   827 <free>
  return freep;
 959:	a1 58 0d 00 00       	mov    0xd58,%eax
}
 95e:	c9                   	leave  
 95f:	c3                   	ret    

00000960 <malloc>:

void*
malloc(uint nbytes)
{
 960:	55                   	push   %ebp
 961:	89 e5                	mov    %esp,%ebp
 963:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 966:	8b 45 08             	mov    0x8(%ebp),%eax
 969:	83 c0 07             	add    $0x7,%eax
 96c:	c1 e8 03             	shr    $0x3,%eax
 96f:	83 c0 01             	add    $0x1,%eax
 972:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 975:	a1 58 0d 00 00       	mov    0xd58,%eax
 97a:	89 45 f0             	mov    %eax,-0x10(%ebp)
 97d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 981:	75 23                	jne    9a6 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 983:	c7 45 f0 50 0d 00 00 	movl   $0xd50,-0x10(%ebp)
 98a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 98d:	a3 58 0d 00 00       	mov    %eax,0xd58
 992:	a1 58 0d 00 00       	mov    0xd58,%eax
 997:	a3 50 0d 00 00       	mov    %eax,0xd50
    base.s.size = 0;
 99c:	c7 05 54 0d 00 00 00 	movl   $0x0,0xd54
 9a3:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9a6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9a9:	8b 00                	mov    (%eax),%eax
 9ab:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 9ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9b1:	8b 40 04             	mov    0x4(%eax),%eax
 9b4:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 9b7:	72 4d                	jb     a06 <malloc+0xa6>
      if(p->s.size == nunits)
 9b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9bc:	8b 40 04             	mov    0x4(%eax),%eax
 9bf:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 9c2:	75 0c                	jne    9d0 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 9c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9c7:	8b 10                	mov    (%eax),%edx
 9c9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9cc:	89 10                	mov    %edx,(%eax)
 9ce:	eb 26                	jmp    9f6 <malloc+0x96>
      else {
        p->s.size -= nunits;
 9d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9d3:	8b 40 04             	mov    0x4(%eax),%eax
 9d6:	2b 45 ec             	sub    -0x14(%ebp),%eax
 9d9:	89 c2                	mov    %eax,%edx
 9db:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9de:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 9e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9e4:	8b 40 04             	mov    0x4(%eax),%eax
 9e7:	c1 e0 03             	shl    $0x3,%eax
 9ea:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 9ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9f0:	8b 55 ec             	mov    -0x14(%ebp),%edx
 9f3:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 9f6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9f9:	a3 58 0d 00 00       	mov    %eax,0xd58
      return (void*)(p + 1);
 9fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a01:	83 c0 08             	add    $0x8,%eax
 a04:	eb 38                	jmp    a3e <malloc+0xde>
    }
    if(p == freep)
 a06:	a1 58 0d 00 00       	mov    0xd58,%eax
 a0b:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 a0e:	75 1b                	jne    a2b <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 a10:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a13:	89 04 24             	mov    %eax,(%esp)
 a16:	e8 ed fe ff ff       	call   908 <morecore>
 a1b:	89 45 f4             	mov    %eax,-0xc(%ebp)
 a1e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 a22:	75 07                	jne    a2b <malloc+0xcb>
        return 0;
 a24:	b8 00 00 00 00       	mov    $0x0,%eax
 a29:	eb 13                	jmp    a3e <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a2b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a2e:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a31:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a34:	8b 00                	mov    (%eax),%eax
 a36:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 a39:	e9 70 ff ff ff       	jmp    9ae <malloc+0x4e>
}
 a3e:	c9                   	leave  
 a3f:	c3                   	ret    
