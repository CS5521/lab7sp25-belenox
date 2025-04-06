
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
  2c:	c7 44 24 04 e4 0a 00 	movl   $0xae4,0x4(%esp)
  33:	00 
  34:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  3b:	e8 d8 06 00 00       	call   718 <printf>
  memset(data, 'a', sizeof(data));
  40:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  47:	00 
  48:	c7 44 24 04 61 00 00 	movl   $0x61,0x4(%esp)
  4f:	00 
  50:	8d 44 24 1e          	lea    0x1e(%esp),%eax
  54:	89 04 24             	mov    %eax,(%esp)
  57:	e8 7f 03 00 00       	call   3db <memset>

  for(i = 0; i < 4; i++)
  5c:	c7 84 24 2c 02 00 00 	movl   $0x0,0x22c(%esp)
  63:	00 00 00 00 
  67:	eb 13                	jmp    7c <main+0x7c>
    if(fork() > 0)
  69:	e8 12 05 00 00       	call   580 <fork>
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
  91:	c7 44 24 04 f7 0a 00 	movl   $0xaf7,0x4(%esp)
  98:	00 
  99:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  a0:	e8 73 06 00 00       	call   718 <printf>

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
  d1:	e8 f2 04 00 00       	call   5c8 <open>
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
 104:	e8 9f 04 00 00       	call   5a8 <write>
  for(i = 0; i < 20; i++)
 109:	83 84 24 2c 02 00 00 	addl   $0x1,0x22c(%esp)
 110:	01 
 111:	83 bc 24 2c 02 00 00 	cmpl   $0x13,0x22c(%esp)
 118:	13 
 119:	7e cf                	jle    ea <main+0xea>
  close(fd);
 11b:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
 122:	89 04 24             	mov    %eax,(%esp)
 125:	e8 86 04 00 00       	call   5b0 <close>

  printf(1, "read\n");
 12a:	c7 44 24 04 01 0b 00 	movl   $0xb01,0x4(%esp)
 131:	00 
 132:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 139:	e8 da 05 00 00       	call   718 <printf>

  fd = open(path, O_RDONLY);
 13e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 145:	00 
 146:	8d 84 24 1e 02 00 00 	lea    0x21e(%esp),%eax
 14d:	89 04 24             	mov    %eax,(%esp)
 150:	e8 73 04 00 00       	call   5c8 <open>
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
 183:	e8 18 04 00 00       	call   5a0 <read>
  for (i = 0; i < 20; i++)
 188:	83 84 24 2c 02 00 00 	addl   $0x1,0x22c(%esp)
 18f:	01 
 190:	83 bc 24 2c 02 00 00 	cmpl   $0x13,0x22c(%esp)
 197:	13 
 198:	7e cf                	jle    169 <main+0x169>
  close(fd);
 19a:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
 1a1:	89 04 24             	mov    %eax,(%esp)
 1a4:	e8 07 04 00 00       	call   5b0 <close>

  wait();
 1a9:	e8 e2 03 00 00       	call   590 <wait>

  exit();
 1ae:	e8 d5 03 00 00       	call   588 <exit>

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
#include "user.h"
#include "x86.h"
#include "param.h"
#include "pstat.h"

void ps(){
 1d8:	55                   	push   %ebp
 1d9:	89 e5                	mov    %esp,%ebp
 1db:	57                   	push   %edi
 1dc:	56                   	push   %esi
 1dd:	53                   	push   %ebx
 1de:	81 ec 2c 09 00 00    	sub    $0x92c,%esp
  
  //pstatTable pst = malloc(NPROC * sizeof(pstat_t));
  pstat_t pst[NPROC];
  getpinfo(&pst);
 1e4:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 1ea:	89 04 24             	mov    %eax,(%esp)
 1ed:	e8 36 04 00 00       	call   628 <getpinfo>
  int i;
  for (i = 0; i < NPROC; i++){
 1f2:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 1f9:	e9 32 01 00 00       	jmp    330 <ps+0x158>
    if (pst[i].inuse == 1){
 1fe:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 201:	89 d0                	mov    %edx,%eax
 203:	c1 e0 03             	shl    $0x3,%eax
 206:	01 d0                	add    %edx,%eax
 208:	c1 e0 02             	shl    $0x2,%eax
 20b:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 20e:	01 d8                	add    %ebx,%eax
 210:	2d 04 09 00 00       	sub    $0x904,%eax
 215:	8b 00                	mov    (%eax),%eax
 217:	83 f8 01             	cmp    $0x1,%eax
 21a:	0f 85 0c 01 00 00    	jne    32c <ps+0x154>
      printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 220:	c7 44 24 04 07 0b 00 	movl   $0xb07,0x4(%esp)
 227:	00 
 228:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 22f:	e8 e4 04 00 00       	call   718 <printf>
      printf(1, "%d\t", pst[i].pid);
 234:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 237:	89 d0                	mov    %edx,%eax
 239:	c1 e0 03             	shl    $0x3,%eax
 23c:	01 d0                	add    %edx,%eax
 23e:	c1 e0 02             	shl    $0x2,%eax
 241:	8d 75 e8             	lea    -0x18(%ebp),%esi
 244:	01 f0                	add    %esi,%eax
 246:	2d fc 08 00 00       	sub    $0x8fc,%eax
 24b:	8b 00                	mov    (%eax),%eax
 24d:	89 44 24 08          	mov    %eax,0x8(%esp)
 251:	c7 44 24 04 20 0b 00 	movl   $0xb20,0x4(%esp)
 258:	00 
 259:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 260:	e8 b3 04 00 00       	call   718 <printf>
      printf(1, "%d\t", pst[i].tickets);
 265:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 268:	89 d0                	mov    %edx,%eax
 26a:	c1 e0 03             	shl    $0x3,%eax
 26d:	01 d0                	add    %edx,%eax
 26f:	c1 e0 02             	shl    $0x2,%eax
 272:	8d 7d e8             	lea    -0x18(%ebp),%edi
 275:	01 f8                	add    %edi,%eax
 277:	2d 00 09 00 00       	sub    $0x900,%eax
 27c:	8b 00                	mov    (%eax),%eax
 27e:	89 44 24 08          	mov    %eax,0x8(%esp)
 282:	c7 44 24 04 20 0b 00 	movl   $0xb20,0x4(%esp)
 289:	00 
 28a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 291:	e8 82 04 00 00       	call   718 <printf>
      printf(1, "%d\t", pst[i].ticks);
 296:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 299:	89 d0                	mov    %edx,%eax
 29b:	c1 e0 03             	shl    $0x3,%eax
 29e:	01 d0                	add    %edx,%eax
 2a0:	c1 e0 02             	shl    $0x2,%eax
 2a3:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 2a6:	01 c8                	add    %ecx,%eax
 2a8:	2d f8 08 00 00       	sub    $0x8f8,%eax
 2ad:	8b 00                	mov    (%eax),%eax
 2af:	89 44 24 08          	mov    %eax,0x8(%esp)
 2b3:	c7 44 24 04 20 0b 00 	movl   $0xb20,0x4(%esp)
 2ba:	00 
 2bb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2c2:	e8 51 04 00 00       	call   718 <printf>
      printf(1, "%c\t", pst[i].state);
 2c7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 2ca:	89 d0                	mov    %edx,%eax
 2cc:	c1 e0 03             	shl    $0x3,%eax
 2cf:	01 d0                	add    %edx,%eax
 2d1:	c1 e0 02             	shl    $0x2,%eax
 2d4:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 2d7:	01 d8                	add    %ebx,%eax
 2d9:	2d e4 08 00 00       	sub    $0x8e4,%eax
 2de:	0f b6 00             	movzbl (%eax),%eax
 2e1:	0f be c0             	movsbl %al,%eax
 2e4:	89 44 24 08          	mov    %eax,0x8(%esp)
 2e8:	c7 44 24 04 24 0b 00 	movl   $0xb24,0x4(%esp)
 2ef:	00 
 2f0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2f7:	e8 1c 04 00 00       	call   718 <printf>
      printf(1, "%s\t\n", pst[i].name);
 2fc:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 302:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 305:	89 d0                	mov    %edx,%eax
 307:	c1 e0 03             	shl    $0x3,%eax
 30a:	01 d0                	add    %edx,%eax
 30c:	c1 e0 02             	shl    $0x2,%eax
 30f:	83 c0 10             	add    $0x10,%eax
 312:	01 c8                	add    %ecx,%eax
 314:	89 44 24 08          	mov    %eax,0x8(%esp)
 318:	c7 44 24 04 28 0b 00 	movl   $0xb28,0x4(%esp)
 31f:	00 
 320:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 327:	e8 ec 03 00 00       	call   718 <printf>
  for (i = 0; i < NPROC; i++){
 32c:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 330:	83 7d e4 3f          	cmpl   $0x3f,-0x1c(%ebp)
 334:	0f 8e c4 fe ff ff    	jle    1fe <ps+0x26>
    }
  }
}
 33a:	81 c4 2c 09 00 00    	add    $0x92c,%esp
 340:	5b                   	pop    %ebx
 341:	5e                   	pop    %esi
 342:	5f                   	pop    %edi
 343:	5d                   	pop    %ebp
 344:	c3                   	ret    

00000345 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 345:	55                   	push   %ebp
 346:	89 e5                	mov    %esp,%ebp
 348:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 34b:	8b 45 08             	mov    0x8(%ebp),%eax
 34e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 351:	90                   	nop
 352:	8b 45 08             	mov    0x8(%ebp),%eax
 355:	8d 50 01             	lea    0x1(%eax),%edx
 358:	89 55 08             	mov    %edx,0x8(%ebp)
 35b:	8b 55 0c             	mov    0xc(%ebp),%edx
 35e:	8d 4a 01             	lea    0x1(%edx),%ecx
 361:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 364:	0f b6 12             	movzbl (%edx),%edx
 367:	88 10                	mov    %dl,(%eax)
 369:	0f b6 00             	movzbl (%eax),%eax
 36c:	84 c0                	test   %al,%al
 36e:	75 e2                	jne    352 <strcpy+0xd>
    ;
  return os;
 370:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 373:	c9                   	leave  
 374:	c3                   	ret    

00000375 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 375:	55                   	push   %ebp
 376:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 378:	eb 08                	jmp    382 <strcmp+0xd>
    p++, q++;
 37a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 37e:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 382:	8b 45 08             	mov    0x8(%ebp),%eax
 385:	0f b6 00             	movzbl (%eax),%eax
 388:	84 c0                	test   %al,%al
 38a:	74 10                	je     39c <strcmp+0x27>
 38c:	8b 45 08             	mov    0x8(%ebp),%eax
 38f:	0f b6 10             	movzbl (%eax),%edx
 392:	8b 45 0c             	mov    0xc(%ebp),%eax
 395:	0f b6 00             	movzbl (%eax),%eax
 398:	38 c2                	cmp    %al,%dl
 39a:	74 de                	je     37a <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 39c:	8b 45 08             	mov    0x8(%ebp),%eax
 39f:	0f b6 00             	movzbl (%eax),%eax
 3a2:	0f b6 d0             	movzbl %al,%edx
 3a5:	8b 45 0c             	mov    0xc(%ebp),%eax
 3a8:	0f b6 00             	movzbl (%eax),%eax
 3ab:	0f b6 c0             	movzbl %al,%eax
 3ae:	29 c2                	sub    %eax,%edx
 3b0:	89 d0                	mov    %edx,%eax
}
 3b2:	5d                   	pop    %ebp
 3b3:	c3                   	ret    

000003b4 <strlen>:

uint
strlen(const char *s)
{
 3b4:	55                   	push   %ebp
 3b5:	89 e5                	mov    %esp,%ebp
 3b7:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 3ba:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 3c1:	eb 04                	jmp    3c7 <strlen+0x13>
 3c3:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 3c7:	8b 55 fc             	mov    -0x4(%ebp),%edx
 3ca:	8b 45 08             	mov    0x8(%ebp),%eax
 3cd:	01 d0                	add    %edx,%eax
 3cf:	0f b6 00             	movzbl (%eax),%eax
 3d2:	84 c0                	test   %al,%al
 3d4:	75 ed                	jne    3c3 <strlen+0xf>
    ;
  return n;
 3d6:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3d9:	c9                   	leave  
 3da:	c3                   	ret    

000003db <memset>:

void*
memset(void *dst, int c, uint n)
{
 3db:	55                   	push   %ebp
 3dc:	89 e5                	mov    %esp,%ebp
 3de:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 3e1:	8b 45 10             	mov    0x10(%ebp),%eax
 3e4:	89 44 24 08          	mov    %eax,0x8(%esp)
 3e8:	8b 45 0c             	mov    0xc(%ebp),%eax
 3eb:	89 44 24 04          	mov    %eax,0x4(%esp)
 3ef:	8b 45 08             	mov    0x8(%ebp),%eax
 3f2:	89 04 24             	mov    %eax,(%esp)
 3f5:	e8 b9 fd ff ff       	call   1b3 <stosb>
  return dst;
 3fa:	8b 45 08             	mov    0x8(%ebp),%eax
}
 3fd:	c9                   	leave  
 3fe:	c3                   	ret    

000003ff <strchr>:

char*
strchr(const char *s, char c)
{
 3ff:	55                   	push   %ebp
 400:	89 e5                	mov    %esp,%ebp
 402:	83 ec 04             	sub    $0x4,%esp
 405:	8b 45 0c             	mov    0xc(%ebp),%eax
 408:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 40b:	eb 14                	jmp    421 <strchr+0x22>
    if(*s == c)
 40d:	8b 45 08             	mov    0x8(%ebp),%eax
 410:	0f b6 00             	movzbl (%eax),%eax
 413:	3a 45 fc             	cmp    -0x4(%ebp),%al
 416:	75 05                	jne    41d <strchr+0x1e>
      return (char*)s;
 418:	8b 45 08             	mov    0x8(%ebp),%eax
 41b:	eb 13                	jmp    430 <strchr+0x31>
  for(; *s; s++)
 41d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 421:	8b 45 08             	mov    0x8(%ebp),%eax
 424:	0f b6 00             	movzbl (%eax),%eax
 427:	84 c0                	test   %al,%al
 429:	75 e2                	jne    40d <strchr+0xe>
  return 0;
 42b:	b8 00 00 00 00       	mov    $0x0,%eax
}
 430:	c9                   	leave  
 431:	c3                   	ret    

00000432 <gets>:

char*
gets(char *buf, int max)
{
 432:	55                   	push   %ebp
 433:	89 e5                	mov    %esp,%ebp
 435:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 438:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 43f:	eb 4c                	jmp    48d <gets+0x5b>
    cc = read(0, &c, 1);
 441:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 448:	00 
 449:	8d 45 ef             	lea    -0x11(%ebp),%eax
 44c:	89 44 24 04          	mov    %eax,0x4(%esp)
 450:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 457:	e8 44 01 00 00       	call   5a0 <read>
 45c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 45f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 463:	7f 02                	jg     467 <gets+0x35>
      break;
 465:	eb 31                	jmp    498 <gets+0x66>
    buf[i++] = c;
 467:	8b 45 f4             	mov    -0xc(%ebp),%eax
 46a:	8d 50 01             	lea    0x1(%eax),%edx
 46d:	89 55 f4             	mov    %edx,-0xc(%ebp)
 470:	89 c2                	mov    %eax,%edx
 472:	8b 45 08             	mov    0x8(%ebp),%eax
 475:	01 c2                	add    %eax,%edx
 477:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 47b:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 47d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 481:	3c 0a                	cmp    $0xa,%al
 483:	74 13                	je     498 <gets+0x66>
 485:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 489:	3c 0d                	cmp    $0xd,%al
 48b:	74 0b                	je     498 <gets+0x66>
  for(i=0; i+1 < max; ){
 48d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 490:	83 c0 01             	add    $0x1,%eax
 493:	3b 45 0c             	cmp    0xc(%ebp),%eax
 496:	7c a9                	jl     441 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 498:	8b 55 f4             	mov    -0xc(%ebp),%edx
 49b:	8b 45 08             	mov    0x8(%ebp),%eax
 49e:	01 d0                	add    %edx,%eax
 4a0:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 4a3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 4a6:	c9                   	leave  
 4a7:	c3                   	ret    

000004a8 <stat>:

int
stat(const char *n, struct stat *st)
{
 4a8:	55                   	push   %ebp
 4a9:	89 e5                	mov    %esp,%ebp
 4ab:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4ae:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 4b5:	00 
 4b6:	8b 45 08             	mov    0x8(%ebp),%eax
 4b9:	89 04 24             	mov    %eax,(%esp)
 4bc:	e8 07 01 00 00       	call   5c8 <open>
 4c1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 4c4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4c8:	79 07                	jns    4d1 <stat+0x29>
    return -1;
 4ca:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 4cf:	eb 23                	jmp    4f4 <stat+0x4c>
  r = fstat(fd, st);
 4d1:	8b 45 0c             	mov    0xc(%ebp),%eax
 4d4:	89 44 24 04          	mov    %eax,0x4(%esp)
 4d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4db:	89 04 24             	mov    %eax,(%esp)
 4de:	e8 fd 00 00 00       	call   5e0 <fstat>
 4e3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 4e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4e9:	89 04 24             	mov    %eax,(%esp)
 4ec:	e8 bf 00 00 00       	call   5b0 <close>
  return r;
 4f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 4f4:	c9                   	leave  
 4f5:	c3                   	ret    

000004f6 <atoi>:

int
atoi(const char *s)
{
 4f6:	55                   	push   %ebp
 4f7:	89 e5                	mov    %esp,%ebp
 4f9:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 4fc:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 503:	eb 25                	jmp    52a <atoi+0x34>
    n = n*10 + *s++ - '0';
 505:	8b 55 fc             	mov    -0x4(%ebp),%edx
 508:	89 d0                	mov    %edx,%eax
 50a:	c1 e0 02             	shl    $0x2,%eax
 50d:	01 d0                	add    %edx,%eax
 50f:	01 c0                	add    %eax,%eax
 511:	89 c1                	mov    %eax,%ecx
 513:	8b 45 08             	mov    0x8(%ebp),%eax
 516:	8d 50 01             	lea    0x1(%eax),%edx
 519:	89 55 08             	mov    %edx,0x8(%ebp)
 51c:	0f b6 00             	movzbl (%eax),%eax
 51f:	0f be c0             	movsbl %al,%eax
 522:	01 c8                	add    %ecx,%eax
 524:	83 e8 30             	sub    $0x30,%eax
 527:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 52a:	8b 45 08             	mov    0x8(%ebp),%eax
 52d:	0f b6 00             	movzbl (%eax),%eax
 530:	3c 2f                	cmp    $0x2f,%al
 532:	7e 0a                	jle    53e <atoi+0x48>
 534:	8b 45 08             	mov    0x8(%ebp),%eax
 537:	0f b6 00             	movzbl (%eax),%eax
 53a:	3c 39                	cmp    $0x39,%al
 53c:	7e c7                	jle    505 <atoi+0xf>
  return n;
 53e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 541:	c9                   	leave  
 542:	c3                   	ret    

00000543 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 543:	55                   	push   %ebp
 544:	89 e5                	mov    %esp,%ebp
 546:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 549:	8b 45 08             	mov    0x8(%ebp),%eax
 54c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 54f:	8b 45 0c             	mov    0xc(%ebp),%eax
 552:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 555:	eb 17                	jmp    56e <memmove+0x2b>
    *dst++ = *src++;
 557:	8b 45 fc             	mov    -0x4(%ebp),%eax
 55a:	8d 50 01             	lea    0x1(%eax),%edx
 55d:	89 55 fc             	mov    %edx,-0x4(%ebp)
 560:	8b 55 f8             	mov    -0x8(%ebp),%edx
 563:	8d 4a 01             	lea    0x1(%edx),%ecx
 566:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 569:	0f b6 12             	movzbl (%edx),%edx
 56c:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 56e:	8b 45 10             	mov    0x10(%ebp),%eax
 571:	8d 50 ff             	lea    -0x1(%eax),%edx
 574:	89 55 10             	mov    %edx,0x10(%ebp)
 577:	85 c0                	test   %eax,%eax
 579:	7f dc                	jg     557 <memmove+0x14>
  return vdst;
 57b:	8b 45 08             	mov    0x8(%ebp),%eax
}
 57e:	c9                   	leave  
 57f:	c3                   	ret    

00000580 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 580:	b8 01 00 00 00       	mov    $0x1,%eax
 585:	cd 40                	int    $0x40
 587:	c3                   	ret    

00000588 <exit>:
SYSCALL(exit)
 588:	b8 02 00 00 00       	mov    $0x2,%eax
 58d:	cd 40                	int    $0x40
 58f:	c3                   	ret    

00000590 <wait>:
SYSCALL(wait)
 590:	b8 03 00 00 00       	mov    $0x3,%eax
 595:	cd 40                	int    $0x40
 597:	c3                   	ret    

00000598 <pipe>:
SYSCALL(pipe)
 598:	b8 04 00 00 00       	mov    $0x4,%eax
 59d:	cd 40                	int    $0x40
 59f:	c3                   	ret    

000005a0 <read>:
SYSCALL(read)
 5a0:	b8 05 00 00 00       	mov    $0x5,%eax
 5a5:	cd 40                	int    $0x40
 5a7:	c3                   	ret    

000005a8 <write>:
SYSCALL(write)
 5a8:	b8 10 00 00 00       	mov    $0x10,%eax
 5ad:	cd 40                	int    $0x40
 5af:	c3                   	ret    

000005b0 <close>:
SYSCALL(close)
 5b0:	b8 15 00 00 00       	mov    $0x15,%eax
 5b5:	cd 40                	int    $0x40
 5b7:	c3                   	ret    

000005b8 <kill>:
SYSCALL(kill)
 5b8:	b8 06 00 00 00       	mov    $0x6,%eax
 5bd:	cd 40                	int    $0x40
 5bf:	c3                   	ret    

000005c0 <exec>:
SYSCALL(exec)
 5c0:	b8 07 00 00 00       	mov    $0x7,%eax
 5c5:	cd 40                	int    $0x40
 5c7:	c3                   	ret    

000005c8 <open>:
SYSCALL(open)
 5c8:	b8 0f 00 00 00       	mov    $0xf,%eax
 5cd:	cd 40                	int    $0x40
 5cf:	c3                   	ret    

000005d0 <mknod>:
SYSCALL(mknod)
 5d0:	b8 11 00 00 00       	mov    $0x11,%eax
 5d5:	cd 40                	int    $0x40
 5d7:	c3                   	ret    

000005d8 <unlink>:
SYSCALL(unlink)
 5d8:	b8 12 00 00 00       	mov    $0x12,%eax
 5dd:	cd 40                	int    $0x40
 5df:	c3                   	ret    

000005e0 <fstat>:
SYSCALL(fstat)
 5e0:	b8 08 00 00 00       	mov    $0x8,%eax
 5e5:	cd 40                	int    $0x40
 5e7:	c3                   	ret    

000005e8 <link>:
SYSCALL(link)
 5e8:	b8 13 00 00 00       	mov    $0x13,%eax
 5ed:	cd 40                	int    $0x40
 5ef:	c3                   	ret    

000005f0 <mkdir>:
SYSCALL(mkdir)
 5f0:	b8 14 00 00 00       	mov    $0x14,%eax
 5f5:	cd 40                	int    $0x40
 5f7:	c3                   	ret    

000005f8 <chdir>:
SYSCALL(chdir)
 5f8:	b8 09 00 00 00       	mov    $0x9,%eax
 5fd:	cd 40                	int    $0x40
 5ff:	c3                   	ret    

00000600 <dup>:
SYSCALL(dup)
 600:	b8 0a 00 00 00       	mov    $0xa,%eax
 605:	cd 40                	int    $0x40
 607:	c3                   	ret    

00000608 <getpid>:
SYSCALL(getpid)
 608:	b8 0b 00 00 00       	mov    $0xb,%eax
 60d:	cd 40                	int    $0x40
 60f:	c3                   	ret    

00000610 <sbrk>:
SYSCALL(sbrk)
 610:	b8 0c 00 00 00       	mov    $0xc,%eax
 615:	cd 40                	int    $0x40
 617:	c3                   	ret    

00000618 <sleep>:
SYSCALL(sleep)
 618:	b8 0d 00 00 00       	mov    $0xd,%eax
 61d:	cd 40                	int    $0x40
 61f:	c3                   	ret    

00000620 <uptime>:
SYSCALL(uptime)
 620:	b8 0e 00 00 00       	mov    $0xe,%eax
 625:	cd 40                	int    $0x40
 627:	c3                   	ret    

00000628 <getpinfo>:
SYSCALL(getpinfo)
 628:	b8 16 00 00 00       	mov    $0x16,%eax
 62d:	cd 40                	int    $0x40
 62f:	c3                   	ret    

00000630 <settickets>:
SYSCALL(settickets)
 630:	b8 17 00 00 00       	mov    $0x17,%eax
 635:	cd 40                	int    $0x40
 637:	c3                   	ret    

00000638 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 638:	55                   	push   %ebp
 639:	89 e5                	mov    %esp,%ebp
 63b:	83 ec 18             	sub    $0x18,%esp
 63e:	8b 45 0c             	mov    0xc(%ebp),%eax
 641:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 644:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 64b:	00 
 64c:	8d 45 f4             	lea    -0xc(%ebp),%eax
 64f:	89 44 24 04          	mov    %eax,0x4(%esp)
 653:	8b 45 08             	mov    0x8(%ebp),%eax
 656:	89 04 24             	mov    %eax,(%esp)
 659:	e8 4a ff ff ff       	call   5a8 <write>
}
 65e:	c9                   	leave  
 65f:	c3                   	ret    

00000660 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 660:	55                   	push   %ebp
 661:	89 e5                	mov    %esp,%ebp
 663:	56                   	push   %esi
 664:	53                   	push   %ebx
 665:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 668:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 66f:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 673:	74 17                	je     68c <printint+0x2c>
 675:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 679:	79 11                	jns    68c <printint+0x2c>
    neg = 1;
 67b:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 682:	8b 45 0c             	mov    0xc(%ebp),%eax
 685:	f7 d8                	neg    %eax
 687:	89 45 ec             	mov    %eax,-0x14(%ebp)
 68a:	eb 06                	jmp    692 <printint+0x32>
  } else {
    x = xx;
 68c:	8b 45 0c             	mov    0xc(%ebp),%eax
 68f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 692:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 699:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 69c:	8d 41 01             	lea    0x1(%ecx),%eax
 69f:	89 45 f4             	mov    %eax,-0xc(%ebp)
 6a2:	8b 5d 10             	mov    0x10(%ebp),%ebx
 6a5:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6a8:	ba 00 00 00 00       	mov    $0x0,%edx
 6ad:	f7 f3                	div    %ebx
 6af:	89 d0                	mov    %edx,%eax
 6b1:	0f b6 80 a8 0d 00 00 	movzbl 0xda8(%eax),%eax
 6b8:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 6bc:	8b 75 10             	mov    0x10(%ebp),%esi
 6bf:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6c2:	ba 00 00 00 00       	mov    $0x0,%edx
 6c7:	f7 f6                	div    %esi
 6c9:	89 45 ec             	mov    %eax,-0x14(%ebp)
 6cc:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 6d0:	75 c7                	jne    699 <printint+0x39>
  if(neg)
 6d2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 6d6:	74 10                	je     6e8 <printint+0x88>
    buf[i++] = '-';
 6d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6db:	8d 50 01             	lea    0x1(%eax),%edx
 6de:	89 55 f4             	mov    %edx,-0xc(%ebp)
 6e1:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 6e6:	eb 1f                	jmp    707 <printint+0xa7>
 6e8:	eb 1d                	jmp    707 <printint+0xa7>
    putc(fd, buf[i]);
 6ea:	8d 55 dc             	lea    -0x24(%ebp),%edx
 6ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6f0:	01 d0                	add    %edx,%eax
 6f2:	0f b6 00             	movzbl (%eax),%eax
 6f5:	0f be c0             	movsbl %al,%eax
 6f8:	89 44 24 04          	mov    %eax,0x4(%esp)
 6fc:	8b 45 08             	mov    0x8(%ebp),%eax
 6ff:	89 04 24             	mov    %eax,(%esp)
 702:	e8 31 ff ff ff       	call   638 <putc>
  while(--i >= 0)
 707:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 70b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 70f:	79 d9                	jns    6ea <printint+0x8a>
}
 711:	83 c4 30             	add    $0x30,%esp
 714:	5b                   	pop    %ebx
 715:	5e                   	pop    %esi
 716:	5d                   	pop    %ebp
 717:	c3                   	ret    

00000718 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 718:	55                   	push   %ebp
 719:	89 e5                	mov    %esp,%ebp
 71b:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 71e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 725:	8d 45 0c             	lea    0xc(%ebp),%eax
 728:	83 c0 04             	add    $0x4,%eax
 72b:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 72e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 735:	e9 7c 01 00 00       	jmp    8b6 <printf+0x19e>
    c = fmt[i] & 0xff;
 73a:	8b 55 0c             	mov    0xc(%ebp),%edx
 73d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 740:	01 d0                	add    %edx,%eax
 742:	0f b6 00             	movzbl (%eax),%eax
 745:	0f be c0             	movsbl %al,%eax
 748:	25 ff 00 00 00       	and    $0xff,%eax
 74d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 750:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 754:	75 2c                	jne    782 <printf+0x6a>
      if(c == '%'){
 756:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 75a:	75 0c                	jne    768 <printf+0x50>
        state = '%';
 75c:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 763:	e9 4a 01 00 00       	jmp    8b2 <printf+0x19a>
      } else {
        putc(fd, c);
 768:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 76b:	0f be c0             	movsbl %al,%eax
 76e:	89 44 24 04          	mov    %eax,0x4(%esp)
 772:	8b 45 08             	mov    0x8(%ebp),%eax
 775:	89 04 24             	mov    %eax,(%esp)
 778:	e8 bb fe ff ff       	call   638 <putc>
 77d:	e9 30 01 00 00       	jmp    8b2 <printf+0x19a>
      }
    } else if(state == '%'){
 782:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 786:	0f 85 26 01 00 00    	jne    8b2 <printf+0x19a>
      if(c == 'd'){
 78c:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 790:	75 2d                	jne    7bf <printf+0xa7>
        printint(fd, *ap, 10, 1);
 792:	8b 45 e8             	mov    -0x18(%ebp),%eax
 795:	8b 00                	mov    (%eax),%eax
 797:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 79e:	00 
 79f:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 7a6:	00 
 7a7:	89 44 24 04          	mov    %eax,0x4(%esp)
 7ab:	8b 45 08             	mov    0x8(%ebp),%eax
 7ae:	89 04 24             	mov    %eax,(%esp)
 7b1:	e8 aa fe ff ff       	call   660 <printint>
        ap++;
 7b6:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7ba:	e9 ec 00 00 00       	jmp    8ab <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 7bf:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 7c3:	74 06                	je     7cb <printf+0xb3>
 7c5:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 7c9:	75 2d                	jne    7f8 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 7cb:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7ce:	8b 00                	mov    (%eax),%eax
 7d0:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 7d7:	00 
 7d8:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 7df:	00 
 7e0:	89 44 24 04          	mov    %eax,0x4(%esp)
 7e4:	8b 45 08             	mov    0x8(%ebp),%eax
 7e7:	89 04 24             	mov    %eax,(%esp)
 7ea:	e8 71 fe ff ff       	call   660 <printint>
        ap++;
 7ef:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7f3:	e9 b3 00 00 00       	jmp    8ab <printf+0x193>
      } else if(c == 's'){
 7f8:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 7fc:	75 45                	jne    843 <printf+0x12b>
        s = (char*)*ap;
 7fe:	8b 45 e8             	mov    -0x18(%ebp),%eax
 801:	8b 00                	mov    (%eax),%eax
 803:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 806:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 80a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 80e:	75 09                	jne    819 <printf+0x101>
          s = "(null)";
 810:	c7 45 f4 2d 0b 00 00 	movl   $0xb2d,-0xc(%ebp)
        while(*s != 0){
 817:	eb 1e                	jmp    837 <printf+0x11f>
 819:	eb 1c                	jmp    837 <printf+0x11f>
          putc(fd, *s);
 81b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 81e:	0f b6 00             	movzbl (%eax),%eax
 821:	0f be c0             	movsbl %al,%eax
 824:	89 44 24 04          	mov    %eax,0x4(%esp)
 828:	8b 45 08             	mov    0x8(%ebp),%eax
 82b:	89 04 24             	mov    %eax,(%esp)
 82e:	e8 05 fe ff ff       	call   638 <putc>
          s++;
 833:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 837:	8b 45 f4             	mov    -0xc(%ebp),%eax
 83a:	0f b6 00             	movzbl (%eax),%eax
 83d:	84 c0                	test   %al,%al
 83f:	75 da                	jne    81b <printf+0x103>
 841:	eb 68                	jmp    8ab <printf+0x193>
        }
      } else if(c == 'c'){
 843:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 847:	75 1d                	jne    866 <printf+0x14e>
        putc(fd, *ap);
 849:	8b 45 e8             	mov    -0x18(%ebp),%eax
 84c:	8b 00                	mov    (%eax),%eax
 84e:	0f be c0             	movsbl %al,%eax
 851:	89 44 24 04          	mov    %eax,0x4(%esp)
 855:	8b 45 08             	mov    0x8(%ebp),%eax
 858:	89 04 24             	mov    %eax,(%esp)
 85b:	e8 d8 fd ff ff       	call   638 <putc>
        ap++;
 860:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 864:	eb 45                	jmp    8ab <printf+0x193>
      } else if(c == '%'){
 866:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 86a:	75 17                	jne    883 <printf+0x16b>
        putc(fd, c);
 86c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 86f:	0f be c0             	movsbl %al,%eax
 872:	89 44 24 04          	mov    %eax,0x4(%esp)
 876:	8b 45 08             	mov    0x8(%ebp),%eax
 879:	89 04 24             	mov    %eax,(%esp)
 87c:	e8 b7 fd ff ff       	call   638 <putc>
 881:	eb 28                	jmp    8ab <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 883:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 88a:	00 
 88b:	8b 45 08             	mov    0x8(%ebp),%eax
 88e:	89 04 24             	mov    %eax,(%esp)
 891:	e8 a2 fd ff ff       	call   638 <putc>
        putc(fd, c);
 896:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 899:	0f be c0             	movsbl %al,%eax
 89c:	89 44 24 04          	mov    %eax,0x4(%esp)
 8a0:	8b 45 08             	mov    0x8(%ebp),%eax
 8a3:	89 04 24             	mov    %eax,(%esp)
 8a6:	e8 8d fd ff ff       	call   638 <putc>
      }
      state = 0;
 8ab:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 8b2:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 8b6:	8b 55 0c             	mov    0xc(%ebp),%edx
 8b9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8bc:	01 d0                	add    %edx,%eax
 8be:	0f b6 00             	movzbl (%eax),%eax
 8c1:	84 c0                	test   %al,%al
 8c3:	0f 85 71 fe ff ff    	jne    73a <printf+0x22>
    }
  }
}
 8c9:	c9                   	leave  
 8ca:	c3                   	ret    

000008cb <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8cb:	55                   	push   %ebp
 8cc:	89 e5                	mov    %esp,%ebp
 8ce:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8d1:	8b 45 08             	mov    0x8(%ebp),%eax
 8d4:	83 e8 08             	sub    $0x8,%eax
 8d7:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8da:	a1 c4 0d 00 00       	mov    0xdc4,%eax
 8df:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8e2:	eb 24                	jmp    908 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8e4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8e7:	8b 00                	mov    (%eax),%eax
 8e9:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8ec:	77 12                	ja     900 <free+0x35>
 8ee:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8f1:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8f4:	77 24                	ja     91a <free+0x4f>
 8f6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8f9:	8b 00                	mov    (%eax),%eax
 8fb:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8fe:	77 1a                	ja     91a <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 900:	8b 45 fc             	mov    -0x4(%ebp),%eax
 903:	8b 00                	mov    (%eax),%eax
 905:	89 45 fc             	mov    %eax,-0x4(%ebp)
 908:	8b 45 f8             	mov    -0x8(%ebp),%eax
 90b:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 90e:	76 d4                	jbe    8e4 <free+0x19>
 910:	8b 45 fc             	mov    -0x4(%ebp),%eax
 913:	8b 00                	mov    (%eax),%eax
 915:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 918:	76 ca                	jbe    8e4 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 91a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 91d:	8b 40 04             	mov    0x4(%eax),%eax
 920:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 927:	8b 45 f8             	mov    -0x8(%ebp),%eax
 92a:	01 c2                	add    %eax,%edx
 92c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 92f:	8b 00                	mov    (%eax),%eax
 931:	39 c2                	cmp    %eax,%edx
 933:	75 24                	jne    959 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 935:	8b 45 f8             	mov    -0x8(%ebp),%eax
 938:	8b 50 04             	mov    0x4(%eax),%edx
 93b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 93e:	8b 00                	mov    (%eax),%eax
 940:	8b 40 04             	mov    0x4(%eax),%eax
 943:	01 c2                	add    %eax,%edx
 945:	8b 45 f8             	mov    -0x8(%ebp),%eax
 948:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 94b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 94e:	8b 00                	mov    (%eax),%eax
 950:	8b 10                	mov    (%eax),%edx
 952:	8b 45 f8             	mov    -0x8(%ebp),%eax
 955:	89 10                	mov    %edx,(%eax)
 957:	eb 0a                	jmp    963 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 959:	8b 45 fc             	mov    -0x4(%ebp),%eax
 95c:	8b 10                	mov    (%eax),%edx
 95e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 961:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 963:	8b 45 fc             	mov    -0x4(%ebp),%eax
 966:	8b 40 04             	mov    0x4(%eax),%eax
 969:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 970:	8b 45 fc             	mov    -0x4(%ebp),%eax
 973:	01 d0                	add    %edx,%eax
 975:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 978:	75 20                	jne    99a <free+0xcf>
    p->s.size += bp->s.size;
 97a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 97d:	8b 50 04             	mov    0x4(%eax),%edx
 980:	8b 45 f8             	mov    -0x8(%ebp),%eax
 983:	8b 40 04             	mov    0x4(%eax),%eax
 986:	01 c2                	add    %eax,%edx
 988:	8b 45 fc             	mov    -0x4(%ebp),%eax
 98b:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 98e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 991:	8b 10                	mov    (%eax),%edx
 993:	8b 45 fc             	mov    -0x4(%ebp),%eax
 996:	89 10                	mov    %edx,(%eax)
 998:	eb 08                	jmp    9a2 <free+0xd7>
  } else
    p->s.ptr = bp;
 99a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 99d:	8b 55 f8             	mov    -0x8(%ebp),%edx
 9a0:	89 10                	mov    %edx,(%eax)
  freep = p;
 9a2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9a5:	a3 c4 0d 00 00       	mov    %eax,0xdc4
}
 9aa:	c9                   	leave  
 9ab:	c3                   	ret    

000009ac <morecore>:

static Header*
morecore(uint nu)
{
 9ac:	55                   	push   %ebp
 9ad:	89 e5                	mov    %esp,%ebp
 9af:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 9b2:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 9b9:	77 07                	ja     9c2 <morecore+0x16>
    nu = 4096;
 9bb:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 9c2:	8b 45 08             	mov    0x8(%ebp),%eax
 9c5:	c1 e0 03             	shl    $0x3,%eax
 9c8:	89 04 24             	mov    %eax,(%esp)
 9cb:	e8 40 fc ff ff       	call   610 <sbrk>
 9d0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 9d3:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 9d7:	75 07                	jne    9e0 <morecore+0x34>
    return 0;
 9d9:	b8 00 00 00 00       	mov    $0x0,%eax
 9de:	eb 22                	jmp    a02 <morecore+0x56>
  hp = (Header*)p;
 9e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9e3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 9e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9e9:	8b 55 08             	mov    0x8(%ebp),%edx
 9ec:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 9ef:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9f2:	83 c0 08             	add    $0x8,%eax
 9f5:	89 04 24             	mov    %eax,(%esp)
 9f8:	e8 ce fe ff ff       	call   8cb <free>
  return freep;
 9fd:	a1 c4 0d 00 00       	mov    0xdc4,%eax
}
 a02:	c9                   	leave  
 a03:	c3                   	ret    

00000a04 <malloc>:

void*
malloc(uint nbytes)
{
 a04:	55                   	push   %ebp
 a05:	89 e5                	mov    %esp,%ebp
 a07:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a0a:	8b 45 08             	mov    0x8(%ebp),%eax
 a0d:	83 c0 07             	add    $0x7,%eax
 a10:	c1 e8 03             	shr    $0x3,%eax
 a13:	83 c0 01             	add    $0x1,%eax
 a16:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 a19:	a1 c4 0d 00 00       	mov    0xdc4,%eax
 a1e:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a21:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 a25:	75 23                	jne    a4a <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 a27:	c7 45 f0 bc 0d 00 00 	movl   $0xdbc,-0x10(%ebp)
 a2e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a31:	a3 c4 0d 00 00       	mov    %eax,0xdc4
 a36:	a1 c4 0d 00 00       	mov    0xdc4,%eax
 a3b:	a3 bc 0d 00 00       	mov    %eax,0xdbc
    base.s.size = 0;
 a40:	c7 05 c0 0d 00 00 00 	movl   $0x0,0xdc0
 a47:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a4a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a4d:	8b 00                	mov    (%eax),%eax
 a4f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 a52:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a55:	8b 40 04             	mov    0x4(%eax),%eax
 a58:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a5b:	72 4d                	jb     aaa <malloc+0xa6>
      if(p->s.size == nunits)
 a5d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a60:	8b 40 04             	mov    0x4(%eax),%eax
 a63:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a66:	75 0c                	jne    a74 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 a68:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a6b:	8b 10                	mov    (%eax),%edx
 a6d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a70:	89 10                	mov    %edx,(%eax)
 a72:	eb 26                	jmp    a9a <malloc+0x96>
      else {
        p->s.size -= nunits;
 a74:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a77:	8b 40 04             	mov    0x4(%eax),%eax
 a7a:	2b 45 ec             	sub    -0x14(%ebp),%eax
 a7d:	89 c2                	mov    %eax,%edx
 a7f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a82:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a85:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a88:	8b 40 04             	mov    0x4(%eax),%eax
 a8b:	c1 e0 03             	shl    $0x3,%eax
 a8e:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 a91:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a94:	8b 55 ec             	mov    -0x14(%ebp),%edx
 a97:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 a9a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a9d:	a3 c4 0d 00 00       	mov    %eax,0xdc4
      return (void*)(p + 1);
 aa2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aa5:	83 c0 08             	add    $0x8,%eax
 aa8:	eb 38                	jmp    ae2 <malloc+0xde>
    }
    if(p == freep)
 aaa:	a1 c4 0d 00 00       	mov    0xdc4,%eax
 aaf:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 ab2:	75 1b                	jne    acf <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 ab4:	8b 45 ec             	mov    -0x14(%ebp),%eax
 ab7:	89 04 24             	mov    %eax,(%esp)
 aba:	e8 ed fe ff ff       	call   9ac <morecore>
 abf:	89 45 f4             	mov    %eax,-0xc(%ebp)
 ac2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 ac6:	75 07                	jne    acf <malloc+0xcb>
        return 0;
 ac8:	b8 00 00 00 00       	mov    $0x0,%eax
 acd:	eb 13                	jmp    ae2 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 acf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ad2:	89 45 f0             	mov    %eax,-0x10(%ebp)
 ad5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ad8:	8b 00                	mov    (%eax),%eax
 ada:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 add:	e9 70 ff ff ff       	jmp    a52 <malloc+0x4e>
}
 ae2:	c9                   	leave  
 ae3:	c3                   	ret    
