
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
   d:	56                   	push   %esi
   e:	53                   	push   %ebx
   f:	51                   	push   %ecx
  10:	83 ec 3c             	sub    $0x3c,%esp
  13:	89 cb                	mov    %ecx,%ebx
    if (argc < 2){
  15:	83 3b 01             	cmpl   $0x1,(%ebx)
  18:	7f 19                	jg     33 <main+0x33>
        printf(1, "usage: schedtest loops tickets1 [ tickets2 ... ticketsN ]");
  1a:	c7 44 24 04 9c 0a 00 	movl   $0xa9c,0x4(%esp)
  21:	00 
  22:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  29:	e8 9f 06 00 00       	call   6cd <printf>
        exit();
  2e:	e8 0a 05 00 00       	call   53d <exit>
    }
    int i;
    int outputnum = atoi(argv[1]);
  33:	8b 43 04             	mov    0x4(%ebx),%eax
  36:	83 c0 04             	add    $0x4,%eax
  39:	8b 00                	mov    (%eax),%eax
  3b:	89 04 24             	mov    %eax,(%esp)
  3e:	e8 68 04 00 00       	call   4ab <atoi>
  43:	89 45 e0             	mov    %eax,-0x20(%ebp)
    int pidarr[argc - 2];
  46:	8b 03                	mov    (%ebx),%eax
  48:	83 e8 02             	sub    $0x2,%eax
  4b:	8d 50 ff             	lea    -0x1(%eax),%edx
  4e:	89 55 dc             	mov    %edx,-0x24(%ebp)
  51:	c1 e0 02             	shl    $0x2,%eax
  54:	8d 50 03             	lea    0x3(%eax),%edx
  57:	b8 10 00 00 00       	mov    $0x10,%eax
  5c:	83 e8 01             	sub    $0x1,%eax
  5f:	01 d0                	add    %edx,%eax
  61:	be 10 00 00 00       	mov    $0x10,%esi
  66:	ba 00 00 00 00       	mov    $0x0,%edx
  6b:	f7 f6                	div    %esi
  6d:	6b c0 10             	imul   $0x10,%eax,%eax
  70:	29 c4                	sub    %eax,%esp
  72:	8d 44 24 0c          	lea    0xc(%esp),%eax
  76:	83 c0 03             	add    $0x3,%eax
  79:	c1 e8 02             	shr    $0x2,%eax
  7c:	c1 e0 02             	shl    $0x2,%eax
  7f:	89 45 d8             	mov    %eax,-0x28(%ebp)
    for (i = 0; i < argc - 2; i++) {
  82:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  89:	eb 4a                	jmp    d5 <main+0xd5>
        int ntickets = atoi(argv[i + 2]);
  8b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  8e:	83 c0 02             	add    $0x2,%eax
  91:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  98:	8b 43 04             	mov    0x4(%ebx),%eax
  9b:	01 d0                	add    %edx,%eax
  9d:	8b 00                	mov    (%eax),%eax
  9f:	89 04 24             	mov    %eax,(%esp)
  a2:	e8 04 04 00 00       	call   4ab <atoi>
  a7:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        int p = fork();
  aa:	e8 86 04 00 00       	call   535 <fork>
  af:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if (p == 0){
  b2:	83 7d d0 00          	cmpl   $0x0,-0x30(%ebp)
  b6:	75 0d                	jne    c5 <main+0xc5>
            settickets(ntickets);
  b8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  bb:	89 04 24             	mov    %eax,(%esp)
  be:	e8 22 05 00 00       	call   5e5 <settickets>
            while(1);
  c3:	eb fe                	jmp    c3 <main+0xc3>
        } else {
            pidarr[i] = p;
  c5:	8b 45 d8             	mov    -0x28(%ebp),%eax
  c8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  cb:	8b 4d d0             	mov    -0x30(%ebp),%ecx
  ce:	89 0c 90             	mov    %ecx,(%eax,%edx,4)
    for (i = 0; i < argc - 2; i++) {
  d1:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  d5:	8b 03                	mov    (%ebx),%eax
  d7:	83 e8 02             	sub    $0x2,%eax
  da:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
  dd:	7f ac                	jg     8b <main+0x8b>
        }
    }
    printf(1, "outputnum: %d", argc);
  df:	8b 03                	mov    (%ebx),%eax
  e1:	89 44 24 08          	mov    %eax,0x8(%esp)
  e5:	c7 44 24 04 d6 0a 00 	movl   $0xad6,0x4(%esp)
  ec:	00 
  ed:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  f4:	e8 d4 05 00 00       	call   6cd <printf>
    for (i = 0; i < outputnum; i++){
  f9:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 100:	eb 15                	jmp    117 <main+0x117>
        ps();
 102:	e8 86 00 00 00       	call   18d <ps>
        sleep(3);
 107:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
 10e:	e8 ba 04 00 00       	call   5cd <sleep>
    for (i = 0; i < outputnum; i++){
 113:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 117:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 11a:	3b 45 e0             	cmp    -0x20(%ebp),%eax
 11d:	7c e3                	jl     102 <main+0x102>
    }
    
    for (i = 0; i < argc - 1; i++){
 11f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 126:	eb 15                	jmp    13d <main+0x13d>
        kill(pidarr[i]);
 128:	8b 45 d8             	mov    -0x28(%ebp),%eax
 12b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 12e:	8b 04 90             	mov    (%eax,%edx,4),%eax
 131:	89 04 24             	mov    %eax,(%esp)
 134:	e8 34 04 00 00       	call   56d <kill>
    for (i = 0; i < argc - 1; i++){
 139:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 13d:	8b 03                	mov    (%ebx),%eax
 13f:	83 e8 01             	sub    $0x1,%eax
 142:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
 145:	7f e1                	jg     128 <main+0x128>
    }
     
    for (i = 0; i < argc - 1; i++){
 147:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 14e:	eb 09                	jmp    159 <main+0x159>
        wait();
 150:	e8 f0 03 00 00       	call   545 <wait>
    for (i = 0; i < argc - 1; i++){
 155:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 159:	8b 03                	mov    (%ebx),%eax
 15b:	83 e8 01             	sub    $0x1,%eax
 15e:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
 161:	7f ed                	jg     150 <main+0x150>
    }

    exit();
 163:	e8 d5 03 00 00       	call   53d <exit>

00000168 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 168:	55                   	push   %ebp
 169:	89 e5                	mov    %esp,%ebp
 16b:	57                   	push   %edi
 16c:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 16d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 170:	8b 55 10             	mov    0x10(%ebp),%edx
 173:	8b 45 0c             	mov    0xc(%ebp),%eax
 176:	89 cb                	mov    %ecx,%ebx
 178:	89 df                	mov    %ebx,%edi
 17a:	89 d1                	mov    %edx,%ecx
 17c:	fc                   	cld    
 17d:	f3 aa                	rep stos %al,%es:(%edi)
 17f:	89 ca                	mov    %ecx,%edx
 181:	89 fb                	mov    %edi,%ebx
 183:	89 5d 08             	mov    %ebx,0x8(%ebp)
 186:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 189:	5b                   	pop    %ebx
 18a:	5f                   	pop    %edi
 18b:	5d                   	pop    %ebp
 18c:	c3                   	ret    

0000018d <ps>:
#include "user.h"
#include "x86.h"
#include "param.h"
#include "pstat.h"

void ps(){
 18d:	55                   	push   %ebp
 18e:	89 e5                	mov    %esp,%ebp
 190:	57                   	push   %edi
 191:	56                   	push   %esi
 192:	53                   	push   %ebx
 193:	81 ec 2c 09 00 00    	sub    $0x92c,%esp
  
  //pstatTable pst = malloc(NPROC * sizeof(pstat_t));
  pstat_t pst[NPROC];
  getpinfo(&pst);
 199:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 19f:	89 04 24             	mov    %eax,(%esp)
 1a2:	e8 36 04 00 00       	call   5dd <getpinfo>
  int i;
  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 1a7:	c7 44 24 04 e4 0a 00 	movl   $0xae4,0x4(%esp)
 1ae:	00 
 1af:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1b6:	e8 12 05 00 00       	call   6cd <printf>
  for (i = 0; i < NPROC; i++){
 1bb:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 1c2:	e9 1e 01 00 00       	jmp    2e5 <ps+0x158>
    if (pst[i].inuse == 1){
 1c7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 1ca:	89 d0                	mov    %edx,%eax
 1cc:	c1 e0 03             	shl    $0x3,%eax
 1cf:	01 d0                	add    %edx,%eax
 1d1:	c1 e0 02             	shl    $0x2,%eax
 1d4:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 1d7:	01 d8                	add    %ebx,%eax
 1d9:	2d 04 09 00 00       	sub    $0x904,%eax
 1de:	8b 00                	mov    (%eax),%eax
 1e0:	83 f8 01             	cmp    $0x1,%eax
 1e3:	0f 85 f8 00 00 00    	jne    2e1 <ps+0x154>
      printf(1, "%d\t", pst[i].pid);
 1e9:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 1ec:	89 d0                	mov    %edx,%eax
 1ee:	c1 e0 03             	shl    $0x3,%eax
 1f1:	01 d0                	add    %edx,%eax
 1f3:	c1 e0 02             	shl    $0x2,%eax
 1f6:	8d 75 e8             	lea    -0x18(%ebp),%esi
 1f9:	01 f0                	add    %esi,%eax
 1fb:	2d fc 08 00 00       	sub    $0x8fc,%eax
 200:	8b 00                	mov    (%eax),%eax
 202:	89 44 24 08          	mov    %eax,0x8(%esp)
 206:	c7 44 24 04 fd 0a 00 	movl   $0xafd,0x4(%esp)
 20d:	00 
 20e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 215:	e8 b3 04 00 00       	call   6cd <printf>
      printf(1, "%d\t", pst[i].tickets);
 21a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 21d:	89 d0                	mov    %edx,%eax
 21f:	c1 e0 03             	shl    $0x3,%eax
 222:	01 d0                	add    %edx,%eax
 224:	c1 e0 02             	shl    $0x2,%eax
 227:	8d 7d e8             	lea    -0x18(%ebp),%edi
 22a:	01 f8                	add    %edi,%eax
 22c:	2d 00 09 00 00       	sub    $0x900,%eax
 231:	8b 00                	mov    (%eax),%eax
 233:	89 44 24 08          	mov    %eax,0x8(%esp)
 237:	c7 44 24 04 fd 0a 00 	movl   $0xafd,0x4(%esp)
 23e:	00 
 23f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 246:	e8 82 04 00 00       	call   6cd <printf>
      printf(1, "%d\t", pst[i].ticks);
 24b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 24e:	89 d0                	mov    %edx,%eax
 250:	c1 e0 03             	shl    $0x3,%eax
 253:	01 d0                	add    %edx,%eax
 255:	c1 e0 02             	shl    $0x2,%eax
 258:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 25b:	01 c8                	add    %ecx,%eax
 25d:	2d f8 08 00 00       	sub    $0x8f8,%eax
 262:	8b 00                	mov    (%eax),%eax
 264:	89 44 24 08          	mov    %eax,0x8(%esp)
 268:	c7 44 24 04 fd 0a 00 	movl   $0xafd,0x4(%esp)
 26f:	00 
 270:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 277:	e8 51 04 00 00       	call   6cd <printf>
      printf(1, "%c\t", pst[i].state);
 27c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 27f:	89 d0                	mov    %edx,%eax
 281:	c1 e0 03             	shl    $0x3,%eax
 284:	01 d0                	add    %edx,%eax
 286:	c1 e0 02             	shl    $0x2,%eax
 289:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 28c:	01 d8                	add    %ebx,%eax
 28e:	2d e4 08 00 00       	sub    $0x8e4,%eax
 293:	0f b6 00             	movzbl (%eax),%eax
 296:	0f be c0             	movsbl %al,%eax
 299:	89 44 24 08          	mov    %eax,0x8(%esp)
 29d:	c7 44 24 04 01 0b 00 	movl   $0xb01,0x4(%esp)
 2a4:	00 
 2a5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2ac:	e8 1c 04 00 00       	call   6cd <printf>
      printf(1, "%s\t\n", pst[i].name);
 2b1:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 2b7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 2ba:	89 d0                	mov    %edx,%eax
 2bc:	c1 e0 03             	shl    $0x3,%eax
 2bf:	01 d0                	add    %edx,%eax
 2c1:	c1 e0 02             	shl    $0x2,%eax
 2c4:	83 c0 10             	add    $0x10,%eax
 2c7:	01 c8                	add    %ecx,%eax
 2c9:	89 44 24 08          	mov    %eax,0x8(%esp)
 2cd:	c7 44 24 04 05 0b 00 	movl   $0xb05,0x4(%esp)
 2d4:	00 
 2d5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2dc:	e8 ec 03 00 00       	call   6cd <printf>
  for (i = 0; i < NPROC; i++){
 2e1:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 2e5:	83 7d e4 3f          	cmpl   $0x3f,-0x1c(%ebp)
 2e9:	0f 8e d8 fe ff ff    	jle    1c7 <ps+0x3a>
    }
  }
}
 2ef:	81 c4 2c 09 00 00    	add    $0x92c,%esp
 2f5:	5b                   	pop    %ebx
 2f6:	5e                   	pop    %esi
 2f7:	5f                   	pop    %edi
 2f8:	5d                   	pop    %ebp
 2f9:	c3                   	ret    

000002fa <strcpy>:

char*
strcpy(char *s, const char *t)
{
 2fa:	55                   	push   %ebp
 2fb:	89 e5                	mov    %esp,%ebp
 2fd:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 300:	8b 45 08             	mov    0x8(%ebp),%eax
 303:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 306:	90                   	nop
 307:	8b 45 08             	mov    0x8(%ebp),%eax
 30a:	8d 50 01             	lea    0x1(%eax),%edx
 30d:	89 55 08             	mov    %edx,0x8(%ebp)
 310:	8b 55 0c             	mov    0xc(%ebp),%edx
 313:	8d 4a 01             	lea    0x1(%edx),%ecx
 316:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 319:	0f b6 12             	movzbl (%edx),%edx
 31c:	88 10                	mov    %dl,(%eax)
 31e:	0f b6 00             	movzbl (%eax),%eax
 321:	84 c0                	test   %al,%al
 323:	75 e2                	jne    307 <strcpy+0xd>
    ;
  return os;
 325:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 328:	c9                   	leave  
 329:	c3                   	ret    

0000032a <strcmp>:

int
strcmp(const char *p, const char *q)
{
 32a:	55                   	push   %ebp
 32b:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 32d:	eb 08                	jmp    337 <strcmp+0xd>
    p++, q++;
 32f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 333:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 337:	8b 45 08             	mov    0x8(%ebp),%eax
 33a:	0f b6 00             	movzbl (%eax),%eax
 33d:	84 c0                	test   %al,%al
 33f:	74 10                	je     351 <strcmp+0x27>
 341:	8b 45 08             	mov    0x8(%ebp),%eax
 344:	0f b6 10             	movzbl (%eax),%edx
 347:	8b 45 0c             	mov    0xc(%ebp),%eax
 34a:	0f b6 00             	movzbl (%eax),%eax
 34d:	38 c2                	cmp    %al,%dl
 34f:	74 de                	je     32f <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 351:	8b 45 08             	mov    0x8(%ebp),%eax
 354:	0f b6 00             	movzbl (%eax),%eax
 357:	0f b6 d0             	movzbl %al,%edx
 35a:	8b 45 0c             	mov    0xc(%ebp),%eax
 35d:	0f b6 00             	movzbl (%eax),%eax
 360:	0f b6 c0             	movzbl %al,%eax
 363:	29 c2                	sub    %eax,%edx
 365:	89 d0                	mov    %edx,%eax
}
 367:	5d                   	pop    %ebp
 368:	c3                   	ret    

00000369 <strlen>:

uint
strlen(const char *s)
{
 369:	55                   	push   %ebp
 36a:	89 e5                	mov    %esp,%ebp
 36c:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 36f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 376:	eb 04                	jmp    37c <strlen+0x13>
 378:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 37c:	8b 55 fc             	mov    -0x4(%ebp),%edx
 37f:	8b 45 08             	mov    0x8(%ebp),%eax
 382:	01 d0                	add    %edx,%eax
 384:	0f b6 00             	movzbl (%eax),%eax
 387:	84 c0                	test   %al,%al
 389:	75 ed                	jne    378 <strlen+0xf>
    ;
  return n;
 38b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 38e:	c9                   	leave  
 38f:	c3                   	ret    

00000390 <memset>:

void*
memset(void *dst, int c, uint n)
{
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 396:	8b 45 10             	mov    0x10(%ebp),%eax
 399:	89 44 24 08          	mov    %eax,0x8(%esp)
 39d:	8b 45 0c             	mov    0xc(%ebp),%eax
 3a0:	89 44 24 04          	mov    %eax,0x4(%esp)
 3a4:	8b 45 08             	mov    0x8(%ebp),%eax
 3a7:	89 04 24             	mov    %eax,(%esp)
 3aa:	e8 b9 fd ff ff       	call   168 <stosb>
  return dst;
 3af:	8b 45 08             	mov    0x8(%ebp),%eax
}
 3b2:	c9                   	leave  
 3b3:	c3                   	ret    

000003b4 <strchr>:

char*
strchr(const char *s, char c)
{
 3b4:	55                   	push   %ebp
 3b5:	89 e5                	mov    %esp,%ebp
 3b7:	83 ec 04             	sub    $0x4,%esp
 3ba:	8b 45 0c             	mov    0xc(%ebp),%eax
 3bd:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 3c0:	eb 14                	jmp    3d6 <strchr+0x22>
    if(*s == c)
 3c2:	8b 45 08             	mov    0x8(%ebp),%eax
 3c5:	0f b6 00             	movzbl (%eax),%eax
 3c8:	3a 45 fc             	cmp    -0x4(%ebp),%al
 3cb:	75 05                	jne    3d2 <strchr+0x1e>
      return (char*)s;
 3cd:	8b 45 08             	mov    0x8(%ebp),%eax
 3d0:	eb 13                	jmp    3e5 <strchr+0x31>
  for(; *s; s++)
 3d2:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 3d6:	8b 45 08             	mov    0x8(%ebp),%eax
 3d9:	0f b6 00             	movzbl (%eax),%eax
 3dc:	84 c0                	test   %al,%al
 3de:	75 e2                	jne    3c2 <strchr+0xe>
  return 0;
 3e0:	b8 00 00 00 00       	mov    $0x0,%eax
}
 3e5:	c9                   	leave  
 3e6:	c3                   	ret    

000003e7 <gets>:

char*
gets(char *buf, int max)
{
 3e7:	55                   	push   %ebp
 3e8:	89 e5                	mov    %esp,%ebp
 3ea:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3ed:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 3f4:	eb 4c                	jmp    442 <gets+0x5b>
    cc = read(0, &c, 1);
 3f6:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3fd:	00 
 3fe:	8d 45 ef             	lea    -0x11(%ebp),%eax
 401:	89 44 24 04          	mov    %eax,0x4(%esp)
 405:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 40c:	e8 44 01 00 00       	call   555 <read>
 411:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 414:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 418:	7f 02                	jg     41c <gets+0x35>
      break;
 41a:	eb 31                	jmp    44d <gets+0x66>
    buf[i++] = c;
 41c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 41f:	8d 50 01             	lea    0x1(%eax),%edx
 422:	89 55 f4             	mov    %edx,-0xc(%ebp)
 425:	89 c2                	mov    %eax,%edx
 427:	8b 45 08             	mov    0x8(%ebp),%eax
 42a:	01 c2                	add    %eax,%edx
 42c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 430:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 432:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 436:	3c 0a                	cmp    $0xa,%al
 438:	74 13                	je     44d <gets+0x66>
 43a:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 43e:	3c 0d                	cmp    $0xd,%al
 440:	74 0b                	je     44d <gets+0x66>
  for(i=0; i+1 < max; ){
 442:	8b 45 f4             	mov    -0xc(%ebp),%eax
 445:	83 c0 01             	add    $0x1,%eax
 448:	3b 45 0c             	cmp    0xc(%ebp),%eax
 44b:	7c a9                	jl     3f6 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 44d:	8b 55 f4             	mov    -0xc(%ebp),%edx
 450:	8b 45 08             	mov    0x8(%ebp),%eax
 453:	01 d0                	add    %edx,%eax
 455:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 458:	8b 45 08             	mov    0x8(%ebp),%eax
}
 45b:	c9                   	leave  
 45c:	c3                   	ret    

0000045d <stat>:

int
stat(const char *n, struct stat *st)
{
 45d:	55                   	push   %ebp
 45e:	89 e5                	mov    %esp,%ebp
 460:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 463:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 46a:	00 
 46b:	8b 45 08             	mov    0x8(%ebp),%eax
 46e:	89 04 24             	mov    %eax,(%esp)
 471:	e8 07 01 00 00       	call   57d <open>
 476:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 479:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 47d:	79 07                	jns    486 <stat+0x29>
    return -1;
 47f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 484:	eb 23                	jmp    4a9 <stat+0x4c>
  r = fstat(fd, st);
 486:	8b 45 0c             	mov    0xc(%ebp),%eax
 489:	89 44 24 04          	mov    %eax,0x4(%esp)
 48d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 490:	89 04 24             	mov    %eax,(%esp)
 493:	e8 fd 00 00 00       	call   595 <fstat>
 498:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 49b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 49e:	89 04 24             	mov    %eax,(%esp)
 4a1:	e8 bf 00 00 00       	call   565 <close>
  return r;
 4a6:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 4a9:	c9                   	leave  
 4aa:	c3                   	ret    

000004ab <atoi>:

int
atoi(const char *s)
{
 4ab:	55                   	push   %ebp
 4ac:	89 e5                	mov    %esp,%ebp
 4ae:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 4b1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 4b8:	eb 25                	jmp    4df <atoi+0x34>
    n = n*10 + *s++ - '0';
 4ba:	8b 55 fc             	mov    -0x4(%ebp),%edx
 4bd:	89 d0                	mov    %edx,%eax
 4bf:	c1 e0 02             	shl    $0x2,%eax
 4c2:	01 d0                	add    %edx,%eax
 4c4:	01 c0                	add    %eax,%eax
 4c6:	89 c1                	mov    %eax,%ecx
 4c8:	8b 45 08             	mov    0x8(%ebp),%eax
 4cb:	8d 50 01             	lea    0x1(%eax),%edx
 4ce:	89 55 08             	mov    %edx,0x8(%ebp)
 4d1:	0f b6 00             	movzbl (%eax),%eax
 4d4:	0f be c0             	movsbl %al,%eax
 4d7:	01 c8                	add    %ecx,%eax
 4d9:	83 e8 30             	sub    $0x30,%eax
 4dc:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 4df:	8b 45 08             	mov    0x8(%ebp),%eax
 4e2:	0f b6 00             	movzbl (%eax),%eax
 4e5:	3c 2f                	cmp    $0x2f,%al
 4e7:	7e 0a                	jle    4f3 <atoi+0x48>
 4e9:	8b 45 08             	mov    0x8(%ebp),%eax
 4ec:	0f b6 00             	movzbl (%eax),%eax
 4ef:	3c 39                	cmp    $0x39,%al
 4f1:	7e c7                	jle    4ba <atoi+0xf>
  return n;
 4f3:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 4f6:	c9                   	leave  
 4f7:	c3                   	ret    

000004f8 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 4f8:	55                   	push   %ebp
 4f9:	89 e5                	mov    %esp,%ebp
 4fb:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 4fe:	8b 45 08             	mov    0x8(%ebp),%eax
 501:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 504:	8b 45 0c             	mov    0xc(%ebp),%eax
 507:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 50a:	eb 17                	jmp    523 <memmove+0x2b>
    *dst++ = *src++;
 50c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 50f:	8d 50 01             	lea    0x1(%eax),%edx
 512:	89 55 fc             	mov    %edx,-0x4(%ebp)
 515:	8b 55 f8             	mov    -0x8(%ebp),%edx
 518:	8d 4a 01             	lea    0x1(%edx),%ecx
 51b:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 51e:	0f b6 12             	movzbl (%edx),%edx
 521:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 523:	8b 45 10             	mov    0x10(%ebp),%eax
 526:	8d 50 ff             	lea    -0x1(%eax),%edx
 529:	89 55 10             	mov    %edx,0x10(%ebp)
 52c:	85 c0                	test   %eax,%eax
 52e:	7f dc                	jg     50c <memmove+0x14>
  return vdst;
 530:	8b 45 08             	mov    0x8(%ebp),%eax
}
 533:	c9                   	leave  
 534:	c3                   	ret    

00000535 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 535:	b8 01 00 00 00       	mov    $0x1,%eax
 53a:	cd 40                	int    $0x40
 53c:	c3                   	ret    

0000053d <exit>:
SYSCALL(exit)
 53d:	b8 02 00 00 00       	mov    $0x2,%eax
 542:	cd 40                	int    $0x40
 544:	c3                   	ret    

00000545 <wait>:
SYSCALL(wait)
 545:	b8 03 00 00 00       	mov    $0x3,%eax
 54a:	cd 40                	int    $0x40
 54c:	c3                   	ret    

0000054d <pipe>:
SYSCALL(pipe)
 54d:	b8 04 00 00 00       	mov    $0x4,%eax
 552:	cd 40                	int    $0x40
 554:	c3                   	ret    

00000555 <read>:
SYSCALL(read)
 555:	b8 05 00 00 00       	mov    $0x5,%eax
 55a:	cd 40                	int    $0x40
 55c:	c3                   	ret    

0000055d <write>:
SYSCALL(write)
 55d:	b8 10 00 00 00       	mov    $0x10,%eax
 562:	cd 40                	int    $0x40
 564:	c3                   	ret    

00000565 <close>:
SYSCALL(close)
 565:	b8 15 00 00 00       	mov    $0x15,%eax
 56a:	cd 40                	int    $0x40
 56c:	c3                   	ret    

0000056d <kill>:
SYSCALL(kill)
 56d:	b8 06 00 00 00       	mov    $0x6,%eax
 572:	cd 40                	int    $0x40
 574:	c3                   	ret    

00000575 <exec>:
SYSCALL(exec)
 575:	b8 07 00 00 00       	mov    $0x7,%eax
 57a:	cd 40                	int    $0x40
 57c:	c3                   	ret    

0000057d <open>:
SYSCALL(open)
 57d:	b8 0f 00 00 00       	mov    $0xf,%eax
 582:	cd 40                	int    $0x40
 584:	c3                   	ret    

00000585 <mknod>:
SYSCALL(mknod)
 585:	b8 11 00 00 00       	mov    $0x11,%eax
 58a:	cd 40                	int    $0x40
 58c:	c3                   	ret    

0000058d <unlink>:
SYSCALL(unlink)
 58d:	b8 12 00 00 00       	mov    $0x12,%eax
 592:	cd 40                	int    $0x40
 594:	c3                   	ret    

00000595 <fstat>:
SYSCALL(fstat)
 595:	b8 08 00 00 00       	mov    $0x8,%eax
 59a:	cd 40                	int    $0x40
 59c:	c3                   	ret    

0000059d <link>:
SYSCALL(link)
 59d:	b8 13 00 00 00       	mov    $0x13,%eax
 5a2:	cd 40                	int    $0x40
 5a4:	c3                   	ret    

000005a5 <mkdir>:
SYSCALL(mkdir)
 5a5:	b8 14 00 00 00       	mov    $0x14,%eax
 5aa:	cd 40                	int    $0x40
 5ac:	c3                   	ret    

000005ad <chdir>:
SYSCALL(chdir)
 5ad:	b8 09 00 00 00       	mov    $0x9,%eax
 5b2:	cd 40                	int    $0x40
 5b4:	c3                   	ret    

000005b5 <dup>:
SYSCALL(dup)
 5b5:	b8 0a 00 00 00       	mov    $0xa,%eax
 5ba:	cd 40                	int    $0x40
 5bc:	c3                   	ret    

000005bd <getpid>:
SYSCALL(getpid)
 5bd:	b8 0b 00 00 00       	mov    $0xb,%eax
 5c2:	cd 40                	int    $0x40
 5c4:	c3                   	ret    

000005c5 <sbrk>:
SYSCALL(sbrk)
 5c5:	b8 0c 00 00 00       	mov    $0xc,%eax
 5ca:	cd 40                	int    $0x40
 5cc:	c3                   	ret    

000005cd <sleep>:
SYSCALL(sleep)
 5cd:	b8 0d 00 00 00       	mov    $0xd,%eax
 5d2:	cd 40                	int    $0x40
 5d4:	c3                   	ret    

000005d5 <uptime>:
SYSCALL(uptime)
 5d5:	b8 0e 00 00 00       	mov    $0xe,%eax
 5da:	cd 40                	int    $0x40
 5dc:	c3                   	ret    

000005dd <getpinfo>:
SYSCALL(getpinfo)
 5dd:	b8 16 00 00 00       	mov    $0x16,%eax
 5e2:	cd 40                	int    $0x40
 5e4:	c3                   	ret    

000005e5 <settickets>:
SYSCALL(settickets)
 5e5:	b8 17 00 00 00       	mov    $0x17,%eax
 5ea:	cd 40                	int    $0x40
 5ec:	c3                   	ret    

000005ed <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5ed:	55                   	push   %ebp
 5ee:	89 e5                	mov    %esp,%ebp
 5f0:	83 ec 18             	sub    $0x18,%esp
 5f3:	8b 45 0c             	mov    0xc(%ebp),%eax
 5f6:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 5f9:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 600:	00 
 601:	8d 45 f4             	lea    -0xc(%ebp),%eax
 604:	89 44 24 04          	mov    %eax,0x4(%esp)
 608:	8b 45 08             	mov    0x8(%ebp),%eax
 60b:	89 04 24             	mov    %eax,(%esp)
 60e:	e8 4a ff ff ff       	call   55d <write>
}
 613:	c9                   	leave  
 614:	c3                   	ret    

00000615 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 615:	55                   	push   %ebp
 616:	89 e5                	mov    %esp,%ebp
 618:	56                   	push   %esi
 619:	53                   	push   %ebx
 61a:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 61d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 624:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 628:	74 17                	je     641 <printint+0x2c>
 62a:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 62e:	79 11                	jns    641 <printint+0x2c>
    neg = 1;
 630:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 637:	8b 45 0c             	mov    0xc(%ebp),%eax
 63a:	f7 d8                	neg    %eax
 63c:	89 45 ec             	mov    %eax,-0x14(%ebp)
 63f:	eb 06                	jmp    647 <printint+0x32>
  } else {
    x = xx;
 641:	8b 45 0c             	mov    0xc(%ebp),%eax
 644:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 647:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 64e:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 651:	8d 41 01             	lea    0x1(%ecx),%eax
 654:	89 45 f4             	mov    %eax,-0xc(%ebp)
 657:	8b 5d 10             	mov    0x10(%ebp),%ebx
 65a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 65d:	ba 00 00 00 00       	mov    $0x0,%edx
 662:	f7 f3                	div    %ebx
 664:	89 d0                	mov    %edx,%eax
 666:	0f b6 80 98 0d 00 00 	movzbl 0xd98(%eax),%eax
 66d:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 671:	8b 75 10             	mov    0x10(%ebp),%esi
 674:	8b 45 ec             	mov    -0x14(%ebp),%eax
 677:	ba 00 00 00 00       	mov    $0x0,%edx
 67c:	f7 f6                	div    %esi
 67e:	89 45 ec             	mov    %eax,-0x14(%ebp)
 681:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 685:	75 c7                	jne    64e <printint+0x39>
  if(neg)
 687:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 68b:	74 10                	je     69d <printint+0x88>
    buf[i++] = '-';
 68d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 690:	8d 50 01             	lea    0x1(%eax),%edx
 693:	89 55 f4             	mov    %edx,-0xc(%ebp)
 696:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 69b:	eb 1f                	jmp    6bc <printint+0xa7>
 69d:	eb 1d                	jmp    6bc <printint+0xa7>
    putc(fd, buf[i]);
 69f:	8d 55 dc             	lea    -0x24(%ebp),%edx
 6a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6a5:	01 d0                	add    %edx,%eax
 6a7:	0f b6 00             	movzbl (%eax),%eax
 6aa:	0f be c0             	movsbl %al,%eax
 6ad:	89 44 24 04          	mov    %eax,0x4(%esp)
 6b1:	8b 45 08             	mov    0x8(%ebp),%eax
 6b4:	89 04 24             	mov    %eax,(%esp)
 6b7:	e8 31 ff ff ff       	call   5ed <putc>
  while(--i >= 0)
 6bc:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 6c0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 6c4:	79 d9                	jns    69f <printint+0x8a>
}
 6c6:	83 c4 30             	add    $0x30,%esp
 6c9:	5b                   	pop    %ebx
 6ca:	5e                   	pop    %esi
 6cb:	5d                   	pop    %ebp
 6cc:	c3                   	ret    

000006cd <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6cd:	55                   	push   %ebp
 6ce:	89 e5                	mov    %esp,%ebp
 6d0:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 6d3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 6da:	8d 45 0c             	lea    0xc(%ebp),%eax
 6dd:	83 c0 04             	add    $0x4,%eax
 6e0:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 6e3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 6ea:	e9 7c 01 00 00       	jmp    86b <printf+0x19e>
    c = fmt[i] & 0xff;
 6ef:	8b 55 0c             	mov    0xc(%ebp),%edx
 6f2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6f5:	01 d0                	add    %edx,%eax
 6f7:	0f b6 00             	movzbl (%eax),%eax
 6fa:	0f be c0             	movsbl %al,%eax
 6fd:	25 ff 00 00 00       	and    $0xff,%eax
 702:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 705:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 709:	75 2c                	jne    737 <printf+0x6a>
      if(c == '%'){
 70b:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 70f:	75 0c                	jne    71d <printf+0x50>
        state = '%';
 711:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 718:	e9 4a 01 00 00       	jmp    867 <printf+0x19a>
      } else {
        putc(fd, c);
 71d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 720:	0f be c0             	movsbl %al,%eax
 723:	89 44 24 04          	mov    %eax,0x4(%esp)
 727:	8b 45 08             	mov    0x8(%ebp),%eax
 72a:	89 04 24             	mov    %eax,(%esp)
 72d:	e8 bb fe ff ff       	call   5ed <putc>
 732:	e9 30 01 00 00       	jmp    867 <printf+0x19a>
      }
    } else if(state == '%'){
 737:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 73b:	0f 85 26 01 00 00    	jne    867 <printf+0x19a>
      if(c == 'd'){
 741:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 745:	75 2d                	jne    774 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 747:	8b 45 e8             	mov    -0x18(%ebp),%eax
 74a:	8b 00                	mov    (%eax),%eax
 74c:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 753:	00 
 754:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 75b:	00 
 75c:	89 44 24 04          	mov    %eax,0x4(%esp)
 760:	8b 45 08             	mov    0x8(%ebp),%eax
 763:	89 04 24             	mov    %eax,(%esp)
 766:	e8 aa fe ff ff       	call   615 <printint>
        ap++;
 76b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 76f:	e9 ec 00 00 00       	jmp    860 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 774:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 778:	74 06                	je     780 <printf+0xb3>
 77a:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 77e:	75 2d                	jne    7ad <printf+0xe0>
        printint(fd, *ap, 16, 0);
 780:	8b 45 e8             	mov    -0x18(%ebp),%eax
 783:	8b 00                	mov    (%eax),%eax
 785:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 78c:	00 
 78d:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 794:	00 
 795:	89 44 24 04          	mov    %eax,0x4(%esp)
 799:	8b 45 08             	mov    0x8(%ebp),%eax
 79c:	89 04 24             	mov    %eax,(%esp)
 79f:	e8 71 fe ff ff       	call   615 <printint>
        ap++;
 7a4:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7a8:	e9 b3 00 00 00       	jmp    860 <printf+0x193>
      } else if(c == 's'){
 7ad:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 7b1:	75 45                	jne    7f8 <printf+0x12b>
        s = (char*)*ap;
 7b3:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7b6:	8b 00                	mov    (%eax),%eax
 7b8:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 7bb:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 7bf:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7c3:	75 09                	jne    7ce <printf+0x101>
          s = "(null)";
 7c5:	c7 45 f4 0a 0b 00 00 	movl   $0xb0a,-0xc(%ebp)
        while(*s != 0){
 7cc:	eb 1e                	jmp    7ec <printf+0x11f>
 7ce:	eb 1c                	jmp    7ec <printf+0x11f>
          putc(fd, *s);
 7d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7d3:	0f b6 00             	movzbl (%eax),%eax
 7d6:	0f be c0             	movsbl %al,%eax
 7d9:	89 44 24 04          	mov    %eax,0x4(%esp)
 7dd:	8b 45 08             	mov    0x8(%ebp),%eax
 7e0:	89 04 24             	mov    %eax,(%esp)
 7e3:	e8 05 fe ff ff       	call   5ed <putc>
          s++;
 7e8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 7ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ef:	0f b6 00             	movzbl (%eax),%eax
 7f2:	84 c0                	test   %al,%al
 7f4:	75 da                	jne    7d0 <printf+0x103>
 7f6:	eb 68                	jmp    860 <printf+0x193>
        }
      } else if(c == 'c'){
 7f8:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 7fc:	75 1d                	jne    81b <printf+0x14e>
        putc(fd, *ap);
 7fe:	8b 45 e8             	mov    -0x18(%ebp),%eax
 801:	8b 00                	mov    (%eax),%eax
 803:	0f be c0             	movsbl %al,%eax
 806:	89 44 24 04          	mov    %eax,0x4(%esp)
 80a:	8b 45 08             	mov    0x8(%ebp),%eax
 80d:	89 04 24             	mov    %eax,(%esp)
 810:	e8 d8 fd ff ff       	call   5ed <putc>
        ap++;
 815:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 819:	eb 45                	jmp    860 <printf+0x193>
      } else if(c == '%'){
 81b:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 81f:	75 17                	jne    838 <printf+0x16b>
        putc(fd, c);
 821:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 824:	0f be c0             	movsbl %al,%eax
 827:	89 44 24 04          	mov    %eax,0x4(%esp)
 82b:	8b 45 08             	mov    0x8(%ebp),%eax
 82e:	89 04 24             	mov    %eax,(%esp)
 831:	e8 b7 fd ff ff       	call   5ed <putc>
 836:	eb 28                	jmp    860 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 838:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 83f:	00 
 840:	8b 45 08             	mov    0x8(%ebp),%eax
 843:	89 04 24             	mov    %eax,(%esp)
 846:	e8 a2 fd ff ff       	call   5ed <putc>
        putc(fd, c);
 84b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 84e:	0f be c0             	movsbl %al,%eax
 851:	89 44 24 04          	mov    %eax,0x4(%esp)
 855:	8b 45 08             	mov    0x8(%ebp),%eax
 858:	89 04 24             	mov    %eax,(%esp)
 85b:	e8 8d fd ff ff       	call   5ed <putc>
      }
      state = 0;
 860:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 867:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 86b:	8b 55 0c             	mov    0xc(%ebp),%edx
 86e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 871:	01 d0                	add    %edx,%eax
 873:	0f b6 00             	movzbl (%eax),%eax
 876:	84 c0                	test   %al,%al
 878:	0f 85 71 fe ff ff    	jne    6ef <printf+0x22>
    }
  }
}
 87e:	c9                   	leave  
 87f:	c3                   	ret    

00000880 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 880:	55                   	push   %ebp
 881:	89 e5                	mov    %esp,%ebp
 883:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 886:	8b 45 08             	mov    0x8(%ebp),%eax
 889:	83 e8 08             	sub    $0x8,%eax
 88c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 88f:	a1 b4 0d 00 00       	mov    0xdb4,%eax
 894:	89 45 fc             	mov    %eax,-0x4(%ebp)
 897:	eb 24                	jmp    8bd <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 899:	8b 45 fc             	mov    -0x4(%ebp),%eax
 89c:	8b 00                	mov    (%eax),%eax
 89e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8a1:	77 12                	ja     8b5 <free+0x35>
 8a3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8a6:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8a9:	77 24                	ja     8cf <free+0x4f>
 8ab:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8ae:	8b 00                	mov    (%eax),%eax
 8b0:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8b3:	77 1a                	ja     8cf <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8b8:	8b 00                	mov    (%eax),%eax
 8ba:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8bd:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8c0:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8c3:	76 d4                	jbe    899 <free+0x19>
 8c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8c8:	8b 00                	mov    (%eax),%eax
 8ca:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8cd:	76 ca                	jbe    899 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8cf:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8d2:	8b 40 04             	mov    0x4(%eax),%eax
 8d5:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 8dc:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8df:	01 c2                	add    %eax,%edx
 8e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8e4:	8b 00                	mov    (%eax),%eax
 8e6:	39 c2                	cmp    %eax,%edx
 8e8:	75 24                	jne    90e <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 8ea:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8ed:	8b 50 04             	mov    0x4(%eax),%edx
 8f0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8f3:	8b 00                	mov    (%eax),%eax
 8f5:	8b 40 04             	mov    0x4(%eax),%eax
 8f8:	01 c2                	add    %eax,%edx
 8fa:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8fd:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 900:	8b 45 fc             	mov    -0x4(%ebp),%eax
 903:	8b 00                	mov    (%eax),%eax
 905:	8b 10                	mov    (%eax),%edx
 907:	8b 45 f8             	mov    -0x8(%ebp),%eax
 90a:	89 10                	mov    %edx,(%eax)
 90c:	eb 0a                	jmp    918 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 90e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 911:	8b 10                	mov    (%eax),%edx
 913:	8b 45 f8             	mov    -0x8(%ebp),%eax
 916:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 918:	8b 45 fc             	mov    -0x4(%ebp),%eax
 91b:	8b 40 04             	mov    0x4(%eax),%eax
 91e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 925:	8b 45 fc             	mov    -0x4(%ebp),%eax
 928:	01 d0                	add    %edx,%eax
 92a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 92d:	75 20                	jne    94f <free+0xcf>
    p->s.size += bp->s.size;
 92f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 932:	8b 50 04             	mov    0x4(%eax),%edx
 935:	8b 45 f8             	mov    -0x8(%ebp),%eax
 938:	8b 40 04             	mov    0x4(%eax),%eax
 93b:	01 c2                	add    %eax,%edx
 93d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 940:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 943:	8b 45 f8             	mov    -0x8(%ebp),%eax
 946:	8b 10                	mov    (%eax),%edx
 948:	8b 45 fc             	mov    -0x4(%ebp),%eax
 94b:	89 10                	mov    %edx,(%eax)
 94d:	eb 08                	jmp    957 <free+0xd7>
  } else
    p->s.ptr = bp;
 94f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 952:	8b 55 f8             	mov    -0x8(%ebp),%edx
 955:	89 10                	mov    %edx,(%eax)
  freep = p;
 957:	8b 45 fc             	mov    -0x4(%ebp),%eax
 95a:	a3 b4 0d 00 00       	mov    %eax,0xdb4
}
 95f:	c9                   	leave  
 960:	c3                   	ret    

00000961 <morecore>:

static Header*
morecore(uint nu)
{
 961:	55                   	push   %ebp
 962:	89 e5                	mov    %esp,%ebp
 964:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 967:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 96e:	77 07                	ja     977 <morecore+0x16>
    nu = 4096;
 970:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 977:	8b 45 08             	mov    0x8(%ebp),%eax
 97a:	c1 e0 03             	shl    $0x3,%eax
 97d:	89 04 24             	mov    %eax,(%esp)
 980:	e8 40 fc ff ff       	call   5c5 <sbrk>
 985:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 988:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 98c:	75 07                	jne    995 <morecore+0x34>
    return 0;
 98e:	b8 00 00 00 00       	mov    $0x0,%eax
 993:	eb 22                	jmp    9b7 <morecore+0x56>
  hp = (Header*)p;
 995:	8b 45 f4             	mov    -0xc(%ebp),%eax
 998:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 99b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 99e:	8b 55 08             	mov    0x8(%ebp),%edx
 9a1:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 9a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9a7:	83 c0 08             	add    $0x8,%eax
 9aa:	89 04 24             	mov    %eax,(%esp)
 9ad:	e8 ce fe ff ff       	call   880 <free>
  return freep;
 9b2:	a1 b4 0d 00 00       	mov    0xdb4,%eax
}
 9b7:	c9                   	leave  
 9b8:	c3                   	ret    

000009b9 <malloc>:

void*
malloc(uint nbytes)
{
 9b9:	55                   	push   %ebp
 9ba:	89 e5                	mov    %esp,%ebp
 9bc:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9bf:	8b 45 08             	mov    0x8(%ebp),%eax
 9c2:	83 c0 07             	add    $0x7,%eax
 9c5:	c1 e8 03             	shr    $0x3,%eax
 9c8:	83 c0 01             	add    $0x1,%eax
 9cb:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 9ce:	a1 b4 0d 00 00       	mov    0xdb4,%eax
 9d3:	89 45 f0             	mov    %eax,-0x10(%ebp)
 9d6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 9da:	75 23                	jne    9ff <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 9dc:	c7 45 f0 ac 0d 00 00 	movl   $0xdac,-0x10(%ebp)
 9e3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9e6:	a3 b4 0d 00 00       	mov    %eax,0xdb4
 9eb:	a1 b4 0d 00 00       	mov    0xdb4,%eax
 9f0:	a3 ac 0d 00 00       	mov    %eax,0xdac
    base.s.size = 0;
 9f5:	c7 05 b0 0d 00 00 00 	movl   $0x0,0xdb0
 9fc:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9ff:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a02:	8b 00                	mov    (%eax),%eax
 a04:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 a07:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a0a:	8b 40 04             	mov    0x4(%eax),%eax
 a0d:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a10:	72 4d                	jb     a5f <malloc+0xa6>
      if(p->s.size == nunits)
 a12:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a15:	8b 40 04             	mov    0x4(%eax),%eax
 a18:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a1b:	75 0c                	jne    a29 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 a1d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a20:	8b 10                	mov    (%eax),%edx
 a22:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a25:	89 10                	mov    %edx,(%eax)
 a27:	eb 26                	jmp    a4f <malloc+0x96>
      else {
        p->s.size -= nunits;
 a29:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a2c:	8b 40 04             	mov    0x4(%eax),%eax
 a2f:	2b 45 ec             	sub    -0x14(%ebp),%eax
 a32:	89 c2                	mov    %eax,%edx
 a34:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a37:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a3a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a3d:	8b 40 04             	mov    0x4(%eax),%eax
 a40:	c1 e0 03             	shl    $0x3,%eax
 a43:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 a46:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a49:	8b 55 ec             	mov    -0x14(%ebp),%edx
 a4c:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 a4f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a52:	a3 b4 0d 00 00       	mov    %eax,0xdb4
      return (void*)(p + 1);
 a57:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a5a:	83 c0 08             	add    $0x8,%eax
 a5d:	eb 38                	jmp    a97 <malloc+0xde>
    }
    if(p == freep)
 a5f:	a1 b4 0d 00 00       	mov    0xdb4,%eax
 a64:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 a67:	75 1b                	jne    a84 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 a69:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a6c:	89 04 24             	mov    %eax,(%esp)
 a6f:	e8 ed fe ff ff       	call   961 <morecore>
 a74:	89 45 f4             	mov    %eax,-0xc(%ebp)
 a77:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 a7b:	75 07                	jne    a84 <malloc+0xcb>
        return 0;
 a7d:	b8 00 00 00 00       	mov    $0x0,%eax
 a82:	eb 13                	jmp    a97 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a84:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a87:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a8a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a8d:	8b 00                	mov    (%eax),%eax
 a8f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 a92:	e9 70 ff ff ff       	jmp    a07 <malloc+0x4e>
}
 a97:	c9                   	leave  
 a98:	c3                   	ret    
