
_schedtest:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "user.h"

int main(int argc, char *argv[]) {
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 38             	sub    $0x38,%esp
  14:	89 cb                	mov    %ecx,%ebx
  16:	89 e0                	mov    %esp,%eax
  18:	89 c6                	mov    %eax,%esi
    if (argc < 2){
  1a:	83 3b 01             	cmpl   $0x1,(%ebx)
  1d:	7f 14                	jg     33 <main+0x33>
        printf(1, "usage: schedtest loops tickets1 [ tickets2 ... ticketsN ]");
  1f:	c7 44 24 04 8c 0a 00 	movl   $0xa8c,0x4(%esp)
  26:	00 
  27:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  2e:	e8 8c 06 00 00       	call   6bf <printf>
    }
    int i;
    int outputnum = atoi(argv[0]);
  33:	8b 43 04             	mov    0x4(%ebx),%eax
  36:	8b 00                	mov    (%eax),%eax
  38:	89 04 24             	mov    %eax,(%esp)
  3b:	e8 5d 04 00 00       	call   49d <atoi>
  40:	89 45 e0             	mov    %eax,-0x20(%ebp)
    int pidarr[argc - 1];
  43:	8b 03                	mov    (%ebx),%eax
  45:	83 e8 01             	sub    $0x1,%eax
  48:	8d 50 ff             	lea    -0x1(%eax),%edx
  4b:	89 55 dc             	mov    %edx,-0x24(%ebp)
  4e:	c1 e0 02             	shl    $0x2,%eax
  51:	8d 50 03             	lea    0x3(%eax),%edx
  54:	b8 10 00 00 00       	mov    $0x10,%eax
  59:	83 e8 01             	sub    $0x1,%eax
  5c:	01 d0                	add    %edx,%eax
  5e:	bf 10 00 00 00       	mov    $0x10,%edi
  63:	ba 00 00 00 00       	mov    $0x0,%edx
  68:	f7 f7                	div    %edi
  6a:	6b c0 10             	imul   $0x10,%eax,%eax
  6d:	29 c4                	sub    %eax,%esp
  6f:	8d 44 24 08          	lea    0x8(%esp),%eax
  73:	83 c0 03             	add    $0x3,%eax
  76:	c1 e8 02             	shr    $0x2,%eax
  79:	c1 e0 02             	shl    $0x2,%eax
  7c:	89 45 d8             	mov    %eax,-0x28(%ebp)
    for (i = 0; i < argc - 1; i++) {
  7f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  86:	eb 4b                	jmp    d3 <main+0xd3>
        int ntickets = atoi(argv[i + 1]);
  88:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  8b:	83 c0 01             	add    $0x1,%eax
  8e:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  95:	8b 43 04             	mov    0x4(%ebx),%eax
  98:	01 d0                	add    %edx,%eax
  9a:	8b 00                	mov    (%eax),%eax
  9c:	89 04 24             	mov    %eax,(%esp)
  9f:	e8 f9 03 00 00       	call   49d <atoi>
  a4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        pidarr[i] = fork();
  a7:	e8 7b 04 00 00       	call   527 <fork>
  ac:	8b 55 d8             	mov    -0x28(%ebp),%edx
  af:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  b2:	89 04 8a             	mov    %eax,(%edx,%ecx,4)
        if (pidarr[i] == 0){
  b5:	8b 45 d8             	mov    -0x28(%ebp),%eax
  b8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  bb:	8b 04 90             	mov    (%eax,%edx,4),%eax
  be:	85 c0                	test   %eax,%eax
  c0:	75 0d                	jne    cf <main+0xcf>
            settickets(ntickets);
  c2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  c5:	89 04 24             	mov    %eax,(%esp)
  c8:	e8 0a 05 00 00       	call   5d7 <settickets>
            while(1);
  cd:	eb fe                	jmp    cd <main+0xcd>
    for (i = 0; i < argc - 1; i++) {
  cf:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  d3:	8b 03                	mov    (%ebx),%eax
  d5:	83 e8 01             	sub    $0x1,%eax
  d8:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
  db:	7f ab                	jg     88 <main+0x88>
        }
    }
    for (i = 0; i < outputnum; i++){
  dd:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  e4:	eb 15                	jmp    fb <main+0xfb>
        ps();
  e6:	e8 94 00 00 00       	call   17f <ps>
        sleep(3);
  eb:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
  f2:	e8 c8 04 00 00       	call   5bf <sleep>
    for (i = 0; i < outputnum; i++){
  f7:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  fb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  fe:	3b 45 e0             	cmp    -0x20(%ebp),%eax
 101:	7c e3                	jl     e6 <main+0xe6>
    }
    
    for (i = 0; i < argc - 1; i++){
 103:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 10a:	eb 15                	jmp    121 <main+0x121>
        kill(pidarr[i]);
 10c:	8b 45 d8             	mov    -0x28(%ebp),%eax
 10f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 112:	8b 04 90             	mov    (%eax,%edx,4),%eax
 115:	89 04 24             	mov    %eax,(%esp)
 118:	e8 42 04 00 00       	call   55f <kill>
    for (i = 0; i < argc - 1; i++){
 11d:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 121:	8b 03                	mov    (%ebx),%eax
 123:	83 e8 01             	sub    $0x1,%eax
 126:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
 129:	7f e1                	jg     10c <main+0x10c>
    }
     
    for (i = 0; i < argc - 1; i++){
 12b:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 132:	eb 09                	jmp    13d <main+0x13d>
        wait();
 134:	e8 fe 03 00 00       	call   537 <wait>
    for (i = 0; i < argc - 1; i++){
 139:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 13d:	8b 03                	mov    (%ebx),%eax
 13f:	83 e8 01             	sub    $0x1,%eax
 142:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
 145:	7f ed                	jg     134 <main+0x134>
    }

    return 0;
 147:	b8 00 00 00 00       	mov    $0x0,%eax
 14c:	89 f4                	mov    %esi,%esp
}
 14e:	8d 65 f0             	lea    -0x10(%ebp),%esp
 151:	59                   	pop    %ecx
 152:	5b                   	pop    %ebx
 153:	5e                   	pop    %esi
 154:	5f                   	pop    %edi
 155:	5d                   	pop    %ebp
 156:	8d 61 fc             	lea    -0x4(%ecx),%esp
 159:	c3                   	ret    

0000015a <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 15a:	55                   	push   %ebp
 15b:	89 e5                	mov    %esp,%ebp
 15d:	57                   	push   %edi
 15e:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 15f:	8b 4d 08             	mov    0x8(%ebp),%ecx
 162:	8b 55 10             	mov    0x10(%ebp),%edx
 165:	8b 45 0c             	mov    0xc(%ebp),%eax
 168:	89 cb                	mov    %ecx,%ebx
 16a:	89 df                	mov    %ebx,%edi
 16c:	89 d1                	mov    %edx,%ecx
 16e:	fc                   	cld    
 16f:	f3 aa                	rep stos %al,%es:(%edi)
 171:	89 ca                	mov    %ecx,%edx
 173:	89 fb                	mov    %edi,%ebx
 175:	89 5d 08             	mov    %ebx,0x8(%ebp)
 178:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 17b:	5b                   	pop    %ebx
 17c:	5f                   	pop    %edi
 17d:	5d                   	pop    %ebp
 17e:	c3                   	ret    

0000017f <ps>:
#include "user.h"
#include "x86.h"
#include "param.h"
#include "pstat.h"

void ps(){
 17f:	55                   	push   %ebp
 180:	89 e5                	mov    %esp,%ebp
 182:	57                   	push   %edi
 183:	56                   	push   %esi
 184:	53                   	push   %ebx
 185:	81 ec 2c 09 00 00    	sub    $0x92c,%esp
  
  //pstatTable pst = malloc(NPROC * sizeof(pstat_t));
  pstat_t pst[NPROC];
  getpinfo(&pst);
 18b:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 191:	89 04 24             	mov    %eax,(%esp)
 194:	e8 36 04 00 00       	call   5cf <getpinfo>
  int i;
  for (i = 0; i < NPROC; i++){
 199:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 1a0:	e9 32 01 00 00       	jmp    2d7 <ps+0x158>
    if (pst[i].inuse == 1){
 1a5:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 1a8:	89 d0                	mov    %edx,%eax
 1aa:	c1 e0 03             	shl    $0x3,%eax
 1ad:	01 d0                	add    %edx,%eax
 1af:	c1 e0 02             	shl    $0x2,%eax
 1b2:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 1b5:	01 d8                	add    %ebx,%eax
 1b7:	2d 04 09 00 00       	sub    $0x904,%eax
 1bc:	8b 00                	mov    (%eax),%eax
 1be:	83 f8 01             	cmp    $0x1,%eax
 1c1:	0f 85 0c 01 00 00    	jne    2d3 <ps+0x154>
      printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 1c7:	c7 44 24 04 c6 0a 00 	movl   $0xac6,0x4(%esp)
 1ce:	00 
 1cf:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1d6:	e8 e4 04 00 00       	call   6bf <printf>
      printf(1, "%d\t", pst[i].pid);
 1db:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 1de:	89 d0                	mov    %edx,%eax
 1e0:	c1 e0 03             	shl    $0x3,%eax
 1e3:	01 d0                	add    %edx,%eax
 1e5:	c1 e0 02             	shl    $0x2,%eax
 1e8:	8d 75 e8             	lea    -0x18(%ebp),%esi
 1eb:	01 f0                	add    %esi,%eax
 1ed:	2d fc 08 00 00       	sub    $0x8fc,%eax
 1f2:	8b 00                	mov    (%eax),%eax
 1f4:	89 44 24 08          	mov    %eax,0x8(%esp)
 1f8:	c7 44 24 04 df 0a 00 	movl   $0xadf,0x4(%esp)
 1ff:	00 
 200:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 207:	e8 b3 04 00 00       	call   6bf <printf>
      printf(1, "%d\t", pst[i].tickets);
 20c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 20f:	89 d0                	mov    %edx,%eax
 211:	c1 e0 03             	shl    $0x3,%eax
 214:	01 d0                	add    %edx,%eax
 216:	c1 e0 02             	shl    $0x2,%eax
 219:	8d 7d e8             	lea    -0x18(%ebp),%edi
 21c:	01 f8                	add    %edi,%eax
 21e:	2d 00 09 00 00       	sub    $0x900,%eax
 223:	8b 00                	mov    (%eax),%eax
 225:	89 44 24 08          	mov    %eax,0x8(%esp)
 229:	c7 44 24 04 df 0a 00 	movl   $0xadf,0x4(%esp)
 230:	00 
 231:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 238:	e8 82 04 00 00       	call   6bf <printf>
      printf(1, "%d\t", pst[i].ticks);
 23d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 240:	89 d0                	mov    %edx,%eax
 242:	c1 e0 03             	shl    $0x3,%eax
 245:	01 d0                	add    %edx,%eax
 247:	c1 e0 02             	shl    $0x2,%eax
 24a:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 24d:	01 c8                	add    %ecx,%eax
 24f:	2d f8 08 00 00       	sub    $0x8f8,%eax
 254:	8b 00                	mov    (%eax),%eax
 256:	89 44 24 08          	mov    %eax,0x8(%esp)
 25a:	c7 44 24 04 df 0a 00 	movl   $0xadf,0x4(%esp)
 261:	00 
 262:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 269:	e8 51 04 00 00       	call   6bf <printf>
      printf(1, "%c\t", pst[i].state);
 26e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 271:	89 d0                	mov    %edx,%eax
 273:	c1 e0 03             	shl    $0x3,%eax
 276:	01 d0                	add    %edx,%eax
 278:	c1 e0 02             	shl    $0x2,%eax
 27b:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 27e:	01 d8                	add    %ebx,%eax
 280:	2d e4 08 00 00       	sub    $0x8e4,%eax
 285:	0f b6 00             	movzbl (%eax),%eax
 288:	0f be c0             	movsbl %al,%eax
 28b:	89 44 24 08          	mov    %eax,0x8(%esp)
 28f:	c7 44 24 04 e3 0a 00 	movl   $0xae3,0x4(%esp)
 296:	00 
 297:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 29e:	e8 1c 04 00 00       	call   6bf <printf>
      printf(1, "%s\t\n", pst[i].name);
 2a3:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 2a9:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 2ac:	89 d0                	mov    %edx,%eax
 2ae:	c1 e0 03             	shl    $0x3,%eax
 2b1:	01 d0                	add    %edx,%eax
 2b3:	c1 e0 02             	shl    $0x2,%eax
 2b6:	83 c0 10             	add    $0x10,%eax
 2b9:	01 c8                	add    %ecx,%eax
 2bb:	89 44 24 08          	mov    %eax,0x8(%esp)
 2bf:	c7 44 24 04 e7 0a 00 	movl   $0xae7,0x4(%esp)
 2c6:	00 
 2c7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2ce:	e8 ec 03 00 00       	call   6bf <printf>
  for (i = 0; i < NPROC; i++){
 2d3:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 2d7:	83 7d e4 3f          	cmpl   $0x3f,-0x1c(%ebp)
 2db:	0f 8e c4 fe ff ff    	jle    1a5 <ps+0x26>
    }
  }
}
 2e1:	81 c4 2c 09 00 00    	add    $0x92c,%esp
 2e7:	5b                   	pop    %ebx
 2e8:	5e                   	pop    %esi
 2e9:	5f                   	pop    %edi
 2ea:	5d                   	pop    %ebp
 2eb:	c3                   	ret    

000002ec <strcpy>:

char*
strcpy(char *s, const char *t)
{
 2ec:	55                   	push   %ebp
 2ed:	89 e5                	mov    %esp,%ebp
 2ef:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 2f2:	8b 45 08             	mov    0x8(%ebp),%eax
 2f5:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 2f8:	90                   	nop
 2f9:	8b 45 08             	mov    0x8(%ebp),%eax
 2fc:	8d 50 01             	lea    0x1(%eax),%edx
 2ff:	89 55 08             	mov    %edx,0x8(%ebp)
 302:	8b 55 0c             	mov    0xc(%ebp),%edx
 305:	8d 4a 01             	lea    0x1(%edx),%ecx
 308:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 30b:	0f b6 12             	movzbl (%edx),%edx
 30e:	88 10                	mov    %dl,(%eax)
 310:	0f b6 00             	movzbl (%eax),%eax
 313:	84 c0                	test   %al,%al
 315:	75 e2                	jne    2f9 <strcpy+0xd>
    ;
  return os;
 317:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 31a:	c9                   	leave  
 31b:	c3                   	ret    

0000031c <strcmp>:

int
strcmp(const char *p, const char *q)
{
 31c:	55                   	push   %ebp
 31d:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 31f:	eb 08                	jmp    329 <strcmp+0xd>
    p++, q++;
 321:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 325:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 329:	8b 45 08             	mov    0x8(%ebp),%eax
 32c:	0f b6 00             	movzbl (%eax),%eax
 32f:	84 c0                	test   %al,%al
 331:	74 10                	je     343 <strcmp+0x27>
 333:	8b 45 08             	mov    0x8(%ebp),%eax
 336:	0f b6 10             	movzbl (%eax),%edx
 339:	8b 45 0c             	mov    0xc(%ebp),%eax
 33c:	0f b6 00             	movzbl (%eax),%eax
 33f:	38 c2                	cmp    %al,%dl
 341:	74 de                	je     321 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 343:	8b 45 08             	mov    0x8(%ebp),%eax
 346:	0f b6 00             	movzbl (%eax),%eax
 349:	0f b6 d0             	movzbl %al,%edx
 34c:	8b 45 0c             	mov    0xc(%ebp),%eax
 34f:	0f b6 00             	movzbl (%eax),%eax
 352:	0f b6 c0             	movzbl %al,%eax
 355:	29 c2                	sub    %eax,%edx
 357:	89 d0                	mov    %edx,%eax
}
 359:	5d                   	pop    %ebp
 35a:	c3                   	ret    

0000035b <strlen>:

uint
strlen(const char *s)
{
 35b:	55                   	push   %ebp
 35c:	89 e5                	mov    %esp,%ebp
 35e:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 361:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 368:	eb 04                	jmp    36e <strlen+0x13>
 36a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 36e:	8b 55 fc             	mov    -0x4(%ebp),%edx
 371:	8b 45 08             	mov    0x8(%ebp),%eax
 374:	01 d0                	add    %edx,%eax
 376:	0f b6 00             	movzbl (%eax),%eax
 379:	84 c0                	test   %al,%al
 37b:	75 ed                	jne    36a <strlen+0xf>
    ;
  return n;
 37d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 380:	c9                   	leave  
 381:	c3                   	ret    

00000382 <memset>:

void*
memset(void *dst, int c, uint n)
{
 382:	55                   	push   %ebp
 383:	89 e5                	mov    %esp,%ebp
 385:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 388:	8b 45 10             	mov    0x10(%ebp),%eax
 38b:	89 44 24 08          	mov    %eax,0x8(%esp)
 38f:	8b 45 0c             	mov    0xc(%ebp),%eax
 392:	89 44 24 04          	mov    %eax,0x4(%esp)
 396:	8b 45 08             	mov    0x8(%ebp),%eax
 399:	89 04 24             	mov    %eax,(%esp)
 39c:	e8 b9 fd ff ff       	call   15a <stosb>
  return dst;
 3a1:	8b 45 08             	mov    0x8(%ebp),%eax
}
 3a4:	c9                   	leave  
 3a5:	c3                   	ret    

000003a6 <strchr>:

char*
strchr(const char *s, char c)
{
 3a6:	55                   	push   %ebp
 3a7:	89 e5                	mov    %esp,%ebp
 3a9:	83 ec 04             	sub    $0x4,%esp
 3ac:	8b 45 0c             	mov    0xc(%ebp),%eax
 3af:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 3b2:	eb 14                	jmp    3c8 <strchr+0x22>
    if(*s == c)
 3b4:	8b 45 08             	mov    0x8(%ebp),%eax
 3b7:	0f b6 00             	movzbl (%eax),%eax
 3ba:	3a 45 fc             	cmp    -0x4(%ebp),%al
 3bd:	75 05                	jne    3c4 <strchr+0x1e>
      return (char*)s;
 3bf:	8b 45 08             	mov    0x8(%ebp),%eax
 3c2:	eb 13                	jmp    3d7 <strchr+0x31>
  for(; *s; s++)
 3c4:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 3c8:	8b 45 08             	mov    0x8(%ebp),%eax
 3cb:	0f b6 00             	movzbl (%eax),%eax
 3ce:	84 c0                	test   %al,%al
 3d0:	75 e2                	jne    3b4 <strchr+0xe>
  return 0;
 3d2:	b8 00 00 00 00       	mov    $0x0,%eax
}
 3d7:	c9                   	leave  
 3d8:	c3                   	ret    

000003d9 <gets>:

char*
gets(char *buf, int max)
{
 3d9:	55                   	push   %ebp
 3da:	89 e5                	mov    %esp,%ebp
 3dc:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3df:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 3e6:	eb 4c                	jmp    434 <gets+0x5b>
    cc = read(0, &c, 1);
 3e8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3ef:	00 
 3f0:	8d 45 ef             	lea    -0x11(%ebp),%eax
 3f3:	89 44 24 04          	mov    %eax,0x4(%esp)
 3f7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 3fe:	e8 44 01 00 00       	call   547 <read>
 403:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 406:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 40a:	7f 02                	jg     40e <gets+0x35>
      break;
 40c:	eb 31                	jmp    43f <gets+0x66>
    buf[i++] = c;
 40e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 411:	8d 50 01             	lea    0x1(%eax),%edx
 414:	89 55 f4             	mov    %edx,-0xc(%ebp)
 417:	89 c2                	mov    %eax,%edx
 419:	8b 45 08             	mov    0x8(%ebp),%eax
 41c:	01 c2                	add    %eax,%edx
 41e:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 422:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 424:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 428:	3c 0a                	cmp    $0xa,%al
 42a:	74 13                	je     43f <gets+0x66>
 42c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 430:	3c 0d                	cmp    $0xd,%al
 432:	74 0b                	je     43f <gets+0x66>
  for(i=0; i+1 < max; ){
 434:	8b 45 f4             	mov    -0xc(%ebp),%eax
 437:	83 c0 01             	add    $0x1,%eax
 43a:	3b 45 0c             	cmp    0xc(%ebp),%eax
 43d:	7c a9                	jl     3e8 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 43f:	8b 55 f4             	mov    -0xc(%ebp),%edx
 442:	8b 45 08             	mov    0x8(%ebp),%eax
 445:	01 d0                	add    %edx,%eax
 447:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 44a:	8b 45 08             	mov    0x8(%ebp),%eax
}
 44d:	c9                   	leave  
 44e:	c3                   	ret    

0000044f <stat>:

int
stat(const char *n, struct stat *st)
{
 44f:	55                   	push   %ebp
 450:	89 e5                	mov    %esp,%ebp
 452:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 455:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 45c:	00 
 45d:	8b 45 08             	mov    0x8(%ebp),%eax
 460:	89 04 24             	mov    %eax,(%esp)
 463:	e8 07 01 00 00       	call   56f <open>
 468:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 46b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 46f:	79 07                	jns    478 <stat+0x29>
    return -1;
 471:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 476:	eb 23                	jmp    49b <stat+0x4c>
  r = fstat(fd, st);
 478:	8b 45 0c             	mov    0xc(%ebp),%eax
 47b:	89 44 24 04          	mov    %eax,0x4(%esp)
 47f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 482:	89 04 24             	mov    %eax,(%esp)
 485:	e8 fd 00 00 00       	call   587 <fstat>
 48a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 48d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 490:	89 04 24             	mov    %eax,(%esp)
 493:	e8 bf 00 00 00       	call   557 <close>
  return r;
 498:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 49b:	c9                   	leave  
 49c:	c3                   	ret    

0000049d <atoi>:

int
atoi(const char *s)
{
 49d:	55                   	push   %ebp
 49e:	89 e5                	mov    %esp,%ebp
 4a0:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 4a3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 4aa:	eb 25                	jmp    4d1 <atoi+0x34>
    n = n*10 + *s++ - '0';
 4ac:	8b 55 fc             	mov    -0x4(%ebp),%edx
 4af:	89 d0                	mov    %edx,%eax
 4b1:	c1 e0 02             	shl    $0x2,%eax
 4b4:	01 d0                	add    %edx,%eax
 4b6:	01 c0                	add    %eax,%eax
 4b8:	89 c1                	mov    %eax,%ecx
 4ba:	8b 45 08             	mov    0x8(%ebp),%eax
 4bd:	8d 50 01             	lea    0x1(%eax),%edx
 4c0:	89 55 08             	mov    %edx,0x8(%ebp)
 4c3:	0f b6 00             	movzbl (%eax),%eax
 4c6:	0f be c0             	movsbl %al,%eax
 4c9:	01 c8                	add    %ecx,%eax
 4cb:	83 e8 30             	sub    $0x30,%eax
 4ce:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 4d1:	8b 45 08             	mov    0x8(%ebp),%eax
 4d4:	0f b6 00             	movzbl (%eax),%eax
 4d7:	3c 2f                	cmp    $0x2f,%al
 4d9:	7e 0a                	jle    4e5 <atoi+0x48>
 4db:	8b 45 08             	mov    0x8(%ebp),%eax
 4de:	0f b6 00             	movzbl (%eax),%eax
 4e1:	3c 39                	cmp    $0x39,%al
 4e3:	7e c7                	jle    4ac <atoi+0xf>
  return n;
 4e5:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 4e8:	c9                   	leave  
 4e9:	c3                   	ret    

000004ea <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 4ea:	55                   	push   %ebp
 4eb:	89 e5                	mov    %esp,%ebp
 4ed:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 4f0:	8b 45 08             	mov    0x8(%ebp),%eax
 4f3:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 4f6:	8b 45 0c             	mov    0xc(%ebp),%eax
 4f9:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 4fc:	eb 17                	jmp    515 <memmove+0x2b>
    *dst++ = *src++;
 4fe:	8b 45 fc             	mov    -0x4(%ebp),%eax
 501:	8d 50 01             	lea    0x1(%eax),%edx
 504:	89 55 fc             	mov    %edx,-0x4(%ebp)
 507:	8b 55 f8             	mov    -0x8(%ebp),%edx
 50a:	8d 4a 01             	lea    0x1(%edx),%ecx
 50d:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 510:	0f b6 12             	movzbl (%edx),%edx
 513:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 515:	8b 45 10             	mov    0x10(%ebp),%eax
 518:	8d 50 ff             	lea    -0x1(%eax),%edx
 51b:	89 55 10             	mov    %edx,0x10(%ebp)
 51e:	85 c0                	test   %eax,%eax
 520:	7f dc                	jg     4fe <memmove+0x14>
  return vdst;
 522:	8b 45 08             	mov    0x8(%ebp),%eax
}
 525:	c9                   	leave  
 526:	c3                   	ret    

00000527 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 527:	b8 01 00 00 00       	mov    $0x1,%eax
 52c:	cd 40                	int    $0x40
 52e:	c3                   	ret    

0000052f <exit>:
SYSCALL(exit)
 52f:	b8 02 00 00 00       	mov    $0x2,%eax
 534:	cd 40                	int    $0x40
 536:	c3                   	ret    

00000537 <wait>:
SYSCALL(wait)
 537:	b8 03 00 00 00       	mov    $0x3,%eax
 53c:	cd 40                	int    $0x40
 53e:	c3                   	ret    

0000053f <pipe>:
SYSCALL(pipe)
 53f:	b8 04 00 00 00       	mov    $0x4,%eax
 544:	cd 40                	int    $0x40
 546:	c3                   	ret    

00000547 <read>:
SYSCALL(read)
 547:	b8 05 00 00 00       	mov    $0x5,%eax
 54c:	cd 40                	int    $0x40
 54e:	c3                   	ret    

0000054f <write>:
SYSCALL(write)
 54f:	b8 10 00 00 00       	mov    $0x10,%eax
 554:	cd 40                	int    $0x40
 556:	c3                   	ret    

00000557 <close>:
SYSCALL(close)
 557:	b8 15 00 00 00       	mov    $0x15,%eax
 55c:	cd 40                	int    $0x40
 55e:	c3                   	ret    

0000055f <kill>:
SYSCALL(kill)
 55f:	b8 06 00 00 00       	mov    $0x6,%eax
 564:	cd 40                	int    $0x40
 566:	c3                   	ret    

00000567 <exec>:
SYSCALL(exec)
 567:	b8 07 00 00 00       	mov    $0x7,%eax
 56c:	cd 40                	int    $0x40
 56e:	c3                   	ret    

0000056f <open>:
SYSCALL(open)
 56f:	b8 0f 00 00 00       	mov    $0xf,%eax
 574:	cd 40                	int    $0x40
 576:	c3                   	ret    

00000577 <mknod>:
SYSCALL(mknod)
 577:	b8 11 00 00 00       	mov    $0x11,%eax
 57c:	cd 40                	int    $0x40
 57e:	c3                   	ret    

0000057f <unlink>:
SYSCALL(unlink)
 57f:	b8 12 00 00 00       	mov    $0x12,%eax
 584:	cd 40                	int    $0x40
 586:	c3                   	ret    

00000587 <fstat>:
SYSCALL(fstat)
 587:	b8 08 00 00 00       	mov    $0x8,%eax
 58c:	cd 40                	int    $0x40
 58e:	c3                   	ret    

0000058f <link>:
SYSCALL(link)
 58f:	b8 13 00 00 00       	mov    $0x13,%eax
 594:	cd 40                	int    $0x40
 596:	c3                   	ret    

00000597 <mkdir>:
SYSCALL(mkdir)
 597:	b8 14 00 00 00       	mov    $0x14,%eax
 59c:	cd 40                	int    $0x40
 59e:	c3                   	ret    

0000059f <chdir>:
SYSCALL(chdir)
 59f:	b8 09 00 00 00       	mov    $0x9,%eax
 5a4:	cd 40                	int    $0x40
 5a6:	c3                   	ret    

000005a7 <dup>:
SYSCALL(dup)
 5a7:	b8 0a 00 00 00       	mov    $0xa,%eax
 5ac:	cd 40                	int    $0x40
 5ae:	c3                   	ret    

000005af <getpid>:
SYSCALL(getpid)
 5af:	b8 0b 00 00 00       	mov    $0xb,%eax
 5b4:	cd 40                	int    $0x40
 5b6:	c3                   	ret    

000005b7 <sbrk>:
SYSCALL(sbrk)
 5b7:	b8 0c 00 00 00       	mov    $0xc,%eax
 5bc:	cd 40                	int    $0x40
 5be:	c3                   	ret    

000005bf <sleep>:
SYSCALL(sleep)
 5bf:	b8 0d 00 00 00       	mov    $0xd,%eax
 5c4:	cd 40                	int    $0x40
 5c6:	c3                   	ret    

000005c7 <uptime>:
SYSCALL(uptime)
 5c7:	b8 0e 00 00 00       	mov    $0xe,%eax
 5cc:	cd 40                	int    $0x40
 5ce:	c3                   	ret    

000005cf <getpinfo>:
SYSCALL(getpinfo)
 5cf:	b8 16 00 00 00       	mov    $0x16,%eax
 5d4:	cd 40                	int    $0x40
 5d6:	c3                   	ret    

000005d7 <settickets>:
SYSCALL(settickets)
 5d7:	b8 17 00 00 00       	mov    $0x17,%eax
 5dc:	cd 40                	int    $0x40
 5de:	c3                   	ret    

000005df <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5df:	55                   	push   %ebp
 5e0:	89 e5                	mov    %esp,%ebp
 5e2:	83 ec 18             	sub    $0x18,%esp
 5e5:	8b 45 0c             	mov    0xc(%ebp),%eax
 5e8:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 5eb:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5f2:	00 
 5f3:	8d 45 f4             	lea    -0xc(%ebp),%eax
 5f6:	89 44 24 04          	mov    %eax,0x4(%esp)
 5fa:	8b 45 08             	mov    0x8(%ebp),%eax
 5fd:	89 04 24             	mov    %eax,(%esp)
 600:	e8 4a ff ff ff       	call   54f <write>
}
 605:	c9                   	leave  
 606:	c3                   	ret    

00000607 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 607:	55                   	push   %ebp
 608:	89 e5                	mov    %esp,%ebp
 60a:	56                   	push   %esi
 60b:	53                   	push   %ebx
 60c:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 60f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 616:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 61a:	74 17                	je     633 <printint+0x2c>
 61c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 620:	79 11                	jns    633 <printint+0x2c>
    neg = 1;
 622:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 629:	8b 45 0c             	mov    0xc(%ebp),%eax
 62c:	f7 d8                	neg    %eax
 62e:	89 45 ec             	mov    %eax,-0x14(%ebp)
 631:	eb 06                	jmp    639 <printint+0x32>
  } else {
    x = xx;
 633:	8b 45 0c             	mov    0xc(%ebp),%eax
 636:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 639:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 640:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 643:	8d 41 01             	lea    0x1(%ecx),%eax
 646:	89 45 f4             	mov    %eax,-0xc(%ebp)
 649:	8b 5d 10             	mov    0x10(%ebp),%ebx
 64c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 64f:	ba 00 00 00 00       	mov    $0x0,%edx
 654:	f7 f3                	div    %ebx
 656:	89 d0                	mov    %edx,%eax
 658:	0f b6 80 90 0d 00 00 	movzbl 0xd90(%eax),%eax
 65f:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 663:	8b 75 10             	mov    0x10(%ebp),%esi
 666:	8b 45 ec             	mov    -0x14(%ebp),%eax
 669:	ba 00 00 00 00       	mov    $0x0,%edx
 66e:	f7 f6                	div    %esi
 670:	89 45 ec             	mov    %eax,-0x14(%ebp)
 673:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 677:	75 c7                	jne    640 <printint+0x39>
  if(neg)
 679:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 67d:	74 10                	je     68f <printint+0x88>
    buf[i++] = '-';
 67f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 682:	8d 50 01             	lea    0x1(%eax),%edx
 685:	89 55 f4             	mov    %edx,-0xc(%ebp)
 688:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 68d:	eb 1f                	jmp    6ae <printint+0xa7>
 68f:	eb 1d                	jmp    6ae <printint+0xa7>
    putc(fd, buf[i]);
 691:	8d 55 dc             	lea    -0x24(%ebp),%edx
 694:	8b 45 f4             	mov    -0xc(%ebp),%eax
 697:	01 d0                	add    %edx,%eax
 699:	0f b6 00             	movzbl (%eax),%eax
 69c:	0f be c0             	movsbl %al,%eax
 69f:	89 44 24 04          	mov    %eax,0x4(%esp)
 6a3:	8b 45 08             	mov    0x8(%ebp),%eax
 6a6:	89 04 24             	mov    %eax,(%esp)
 6a9:	e8 31 ff ff ff       	call   5df <putc>
  while(--i >= 0)
 6ae:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 6b2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 6b6:	79 d9                	jns    691 <printint+0x8a>
}
 6b8:	83 c4 30             	add    $0x30,%esp
 6bb:	5b                   	pop    %ebx
 6bc:	5e                   	pop    %esi
 6bd:	5d                   	pop    %ebp
 6be:	c3                   	ret    

000006bf <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6bf:	55                   	push   %ebp
 6c0:	89 e5                	mov    %esp,%ebp
 6c2:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 6c5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 6cc:	8d 45 0c             	lea    0xc(%ebp),%eax
 6cf:	83 c0 04             	add    $0x4,%eax
 6d2:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 6d5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 6dc:	e9 7c 01 00 00       	jmp    85d <printf+0x19e>
    c = fmt[i] & 0xff;
 6e1:	8b 55 0c             	mov    0xc(%ebp),%edx
 6e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6e7:	01 d0                	add    %edx,%eax
 6e9:	0f b6 00             	movzbl (%eax),%eax
 6ec:	0f be c0             	movsbl %al,%eax
 6ef:	25 ff 00 00 00       	and    $0xff,%eax
 6f4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 6f7:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 6fb:	75 2c                	jne    729 <printf+0x6a>
      if(c == '%'){
 6fd:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 701:	75 0c                	jne    70f <printf+0x50>
        state = '%';
 703:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 70a:	e9 4a 01 00 00       	jmp    859 <printf+0x19a>
      } else {
        putc(fd, c);
 70f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 712:	0f be c0             	movsbl %al,%eax
 715:	89 44 24 04          	mov    %eax,0x4(%esp)
 719:	8b 45 08             	mov    0x8(%ebp),%eax
 71c:	89 04 24             	mov    %eax,(%esp)
 71f:	e8 bb fe ff ff       	call   5df <putc>
 724:	e9 30 01 00 00       	jmp    859 <printf+0x19a>
      }
    } else if(state == '%'){
 729:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 72d:	0f 85 26 01 00 00    	jne    859 <printf+0x19a>
      if(c == 'd'){
 733:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 737:	75 2d                	jne    766 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 739:	8b 45 e8             	mov    -0x18(%ebp),%eax
 73c:	8b 00                	mov    (%eax),%eax
 73e:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 745:	00 
 746:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 74d:	00 
 74e:	89 44 24 04          	mov    %eax,0x4(%esp)
 752:	8b 45 08             	mov    0x8(%ebp),%eax
 755:	89 04 24             	mov    %eax,(%esp)
 758:	e8 aa fe ff ff       	call   607 <printint>
        ap++;
 75d:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 761:	e9 ec 00 00 00       	jmp    852 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 766:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 76a:	74 06                	je     772 <printf+0xb3>
 76c:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 770:	75 2d                	jne    79f <printf+0xe0>
        printint(fd, *ap, 16, 0);
 772:	8b 45 e8             	mov    -0x18(%ebp),%eax
 775:	8b 00                	mov    (%eax),%eax
 777:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 77e:	00 
 77f:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 786:	00 
 787:	89 44 24 04          	mov    %eax,0x4(%esp)
 78b:	8b 45 08             	mov    0x8(%ebp),%eax
 78e:	89 04 24             	mov    %eax,(%esp)
 791:	e8 71 fe ff ff       	call   607 <printint>
        ap++;
 796:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 79a:	e9 b3 00 00 00       	jmp    852 <printf+0x193>
      } else if(c == 's'){
 79f:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 7a3:	75 45                	jne    7ea <printf+0x12b>
        s = (char*)*ap;
 7a5:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7a8:	8b 00                	mov    (%eax),%eax
 7aa:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 7ad:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 7b1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7b5:	75 09                	jne    7c0 <printf+0x101>
          s = "(null)";
 7b7:	c7 45 f4 ec 0a 00 00 	movl   $0xaec,-0xc(%ebp)
        while(*s != 0){
 7be:	eb 1e                	jmp    7de <printf+0x11f>
 7c0:	eb 1c                	jmp    7de <printf+0x11f>
          putc(fd, *s);
 7c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7c5:	0f b6 00             	movzbl (%eax),%eax
 7c8:	0f be c0             	movsbl %al,%eax
 7cb:	89 44 24 04          	mov    %eax,0x4(%esp)
 7cf:	8b 45 08             	mov    0x8(%ebp),%eax
 7d2:	89 04 24             	mov    %eax,(%esp)
 7d5:	e8 05 fe ff ff       	call   5df <putc>
          s++;
 7da:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 7de:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7e1:	0f b6 00             	movzbl (%eax),%eax
 7e4:	84 c0                	test   %al,%al
 7e6:	75 da                	jne    7c2 <printf+0x103>
 7e8:	eb 68                	jmp    852 <printf+0x193>
        }
      } else if(c == 'c'){
 7ea:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 7ee:	75 1d                	jne    80d <printf+0x14e>
        putc(fd, *ap);
 7f0:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7f3:	8b 00                	mov    (%eax),%eax
 7f5:	0f be c0             	movsbl %al,%eax
 7f8:	89 44 24 04          	mov    %eax,0x4(%esp)
 7fc:	8b 45 08             	mov    0x8(%ebp),%eax
 7ff:	89 04 24             	mov    %eax,(%esp)
 802:	e8 d8 fd ff ff       	call   5df <putc>
        ap++;
 807:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 80b:	eb 45                	jmp    852 <printf+0x193>
      } else if(c == '%'){
 80d:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 811:	75 17                	jne    82a <printf+0x16b>
        putc(fd, c);
 813:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 816:	0f be c0             	movsbl %al,%eax
 819:	89 44 24 04          	mov    %eax,0x4(%esp)
 81d:	8b 45 08             	mov    0x8(%ebp),%eax
 820:	89 04 24             	mov    %eax,(%esp)
 823:	e8 b7 fd ff ff       	call   5df <putc>
 828:	eb 28                	jmp    852 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 82a:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 831:	00 
 832:	8b 45 08             	mov    0x8(%ebp),%eax
 835:	89 04 24             	mov    %eax,(%esp)
 838:	e8 a2 fd ff ff       	call   5df <putc>
        putc(fd, c);
 83d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 840:	0f be c0             	movsbl %al,%eax
 843:	89 44 24 04          	mov    %eax,0x4(%esp)
 847:	8b 45 08             	mov    0x8(%ebp),%eax
 84a:	89 04 24             	mov    %eax,(%esp)
 84d:	e8 8d fd ff ff       	call   5df <putc>
      }
      state = 0;
 852:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 859:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 85d:	8b 55 0c             	mov    0xc(%ebp),%edx
 860:	8b 45 f0             	mov    -0x10(%ebp),%eax
 863:	01 d0                	add    %edx,%eax
 865:	0f b6 00             	movzbl (%eax),%eax
 868:	84 c0                	test   %al,%al
 86a:	0f 85 71 fe ff ff    	jne    6e1 <printf+0x22>
    }
  }
}
 870:	c9                   	leave  
 871:	c3                   	ret    

00000872 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 872:	55                   	push   %ebp
 873:	89 e5                	mov    %esp,%ebp
 875:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 878:	8b 45 08             	mov    0x8(%ebp),%eax
 87b:	83 e8 08             	sub    $0x8,%eax
 87e:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 881:	a1 ac 0d 00 00       	mov    0xdac,%eax
 886:	89 45 fc             	mov    %eax,-0x4(%ebp)
 889:	eb 24                	jmp    8af <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 88b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 88e:	8b 00                	mov    (%eax),%eax
 890:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 893:	77 12                	ja     8a7 <free+0x35>
 895:	8b 45 f8             	mov    -0x8(%ebp),%eax
 898:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 89b:	77 24                	ja     8c1 <free+0x4f>
 89d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8a0:	8b 00                	mov    (%eax),%eax
 8a2:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8a5:	77 1a                	ja     8c1 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8a7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8aa:	8b 00                	mov    (%eax),%eax
 8ac:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8af:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8b2:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8b5:	76 d4                	jbe    88b <free+0x19>
 8b7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8ba:	8b 00                	mov    (%eax),%eax
 8bc:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8bf:	76 ca                	jbe    88b <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8c1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8c4:	8b 40 04             	mov    0x4(%eax),%eax
 8c7:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 8ce:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8d1:	01 c2                	add    %eax,%edx
 8d3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8d6:	8b 00                	mov    (%eax),%eax
 8d8:	39 c2                	cmp    %eax,%edx
 8da:	75 24                	jne    900 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 8dc:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8df:	8b 50 04             	mov    0x4(%eax),%edx
 8e2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8e5:	8b 00                	mov    (%eax),%eax
 8e7:	8b 40 04             	mov    0x4(%eax),%eax
 8ea:	01 c2                	add    %eax,%edx
 8ec:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8ef:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 8f2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8f5:	8b 00                	mov    (%eax),%eax
 8f7:	8b 10                	mov    (%eax),%edx
 8f9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8fc:	89 10                	mov    %edx,(%eax)
 8fe:	eb 0a                	jmp    90a <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 900:	8b 45 fc             	mov    -0x4(%ebp),%eax
 903:	8b 10                	mov    (%eax),%edx
 905:	8b 45 f8             	mov    -0x8(%ebp),%eax
 908:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 90a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 90d:	8b 40 04             	mov    0x4(%eax),%eax
 910:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 917:	8b 45 fc             	mov    -0x4(%ebp),%eax
 91a:	01 d0                	add    %edx,%eax
 91c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 91f:	75 20                	jne    941 <free+0xcf>
    p->s.size += bp->s.size;
 921:	8b 45 fc             	mov    -0x4(%ebp),%eax
 924:	8b 50 04             	mov    0x4(%eax),%edx
 927:	8b 45 f8             	mov    -0x8(%ebp),%eax
 92a:	8b 40 04             	mov    0x4(%eax),%eax
 92d:	01 c2                	add    %eax,%edx
 92f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 932:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 935:	8b 45 f8             	mov    -0x8(%ebp),%eax
 938:	8b 10                	mov    (%eax),%edx
 93a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 93d:	89 10                	mov    %edx,(%eax)
 93f:	eb 08                	jmp    949 <free+0xd7>
  } else
    p->s.ptr = bp;
 941:	8b 45 fc             	mov    -0x4(%ebp),%eax
 944:	8b 55 f8             	mov    -0x8(%ebp),%edx
 947:	89 10                	mov    %edx,(%eax)
  freep = p;
 949:	8b 45 fc             	mov    -0x4(%ebp),%eax
 94c:	a3 ac 0d 00 00       	mov    %eax,0xdac
}
 951:	c9                   	leave  
 952:	c3                   	ret    

00000953 <morecore>:

static Header*
morecore(uint nu)
{
 953:	55                   	push   %ebp
 954:	89 e5                	mov    %esp,%ebp
 956:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 959:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 960:	77 07                	ja     969 <morecore+0x16>
    nu = 4096;
 962:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 969:	8b 45 08             	mov    0x8(%ebp),%eax
 96c:	c1 e0 03             	shl    $0x3,%eax
 96f:	89 04 24             	mov    %eax,(%esp)
 972:	e8 40 fc ff ff       	call   5b7 <sbrk>
 977:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 97a:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 97e:	75 07                	jne    987 <morecore+0x34>
    return 0;
 980:	b8 00 00 00 00       	mov    $0x0,%eax
 985:	eb 22                	jmp    9a9 <morecore+0x56>
  hp = (Header*)p;
 987:	8b 45 f4             	mov    -0xc(%ebp),%eax
 98a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 98d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 990:	8b 55 08             	mov    0x8(%ebp),%edx
 993:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 996:	8b 45 f0             	mov    -0x10(%ebp),%eax
 999:	83 c0 08             	add    $0x8,%eax
 99c:	89 04 24             	mov    %eax,(%esp)
 99f:	e8 ce fe ff ff       	call   872 <free>
  return freep;
 9a4:	a1 ac 0d 00 00       	mov    0xdac,%eax
}
 9a9:	c9                   	leave  
 9aa:	c3                   	ret    

000009ab <malloc>:

void*
malloc(uint nbytes)
{
 9ab:	55                   	push   %ebp
 9ac:	89 e5                	mov    %esp,%ebp
 9ae:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9b1:	8b 45 08             	mov    0x8(%ebp),%eax
 9b4:	83 c0 07             	add    $0x7,%eax
 9b7:	c1 e8 03             	shr    $0x3,%eax
 9ba:	83 c0 01             	add    $0x1,%eax
 9bd:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 9c0:	a1 ac 0d 00 00       	mov    0xdac,%eax
 9c5:	89 45 f0             	mov    %eax,-0x10(%ebp)
 9c8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 9cc:	75 23                	jne    9f1 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 9ce:	c7 45 f0 a4 0d 00 00 	movl   $0xda4,-0x10(%ebp)
 9d5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9d8:	a3 ac 0d 00 00       	mov    %eax,0xdac
 9dd:	a1 ac 0d 00 00       	mov    0xdac,%eax
 9e2:	a3 a4 0d 00 00       	mov    %eax,0xda4
    base.s.size = 0;
 9e7:	c7 05 a8 0d 00 00 00 	movl   $0x0,0xda8
 9ee:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9f4:	8b 00                	mov    (%eax),%eax
 9f6:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 9f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9fc:	8b 40 04             	mov    0x4(%eax),%eax
 9ff:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a02:	72 4d                	jb     a51 <malloc+0xa6>
      if(p->s.size == nunits)
 a04:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a07:	8b 40 04             	mov    0x4(%eax),%eax
 a0a:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a0d:	75 0c                	jne    a1b <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 a0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a12:	8b 10                	mov    (%eax),%edx
 a14:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a17:	89 10                	mov    %edx,(%eax)
 a19:	eb 26                	jmp    a41 <malloc+0x96>
      else {
        p->s.size -= nunits;
 a1b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a1e:	8b 40 04             	mov    0x4(%eax),%eax
 a21:	2b 45 ec             	sub    -0x14(%ebp),%eax
 a24:	89 c2                	mov    %eax,%edx
 a26:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a29:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a2c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a2f:	8b 40 04             	mov    0x4(%eax),%eax
 a32:	c1 e0 03             	shl    $0x3,%eax
 a35:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 a38:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a3b:	8b 55 ec             	mov    -0x14(%ebp),%edx
 a3e:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 a41:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a44:	a3 ac 0d 00 00       	mov    %eax,0xdac
      return (void*)(p + 1);
 a49:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a4c:	83 c0 08             	add    $0x8,%eax
 a4f:	eb 38                	jmp    a89 <malloc+0xde>
    }
    if(p == freep)
 a51:	a1 ac 0d 00 00       	mov    0xdac,%eax
 a56:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 a59:	75 1b                	jne    a76 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 a5b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a5e:	89 04 24             	mov    %eax,(%esp)
 a61:	e8 ed fe ff ff       	call   953 <morecore>
 a66:	89 45 f4             	mov    %eax,-0xc(%ebp)
 a69:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 a6d:	75 07                	jne    a76 <malloc+0xcb>
        return 0;
 a6f:	b8 00 00 00 00       	mov    $0x0,%eax
 a74:	eb 13                	jmp    a89 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a76:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a79:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a7c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a7f:	8b 00                	mov    (%eax),%eax
 a81:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 a84:	e9 70 ff ff ff       	jmp    9f9 <malloc+0x4e>
}
 a89:	c9                   	leave  
 a8a:	c3                   	ret    
