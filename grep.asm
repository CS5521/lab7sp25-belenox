
_grep:     file format elf32-i386


Disassembly of section .text:

00000000 <grep>:
char buf[1024];
int match(char*, char*);

void
grep(char *pattern, int fd)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 28             	sub    $0x28,%esp
  int n, m;
  char *p, *q;

  m = 0;
   6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
   d:	e9 c6 00 00 00       	jmp    d8 <grep+0xd8>
    m += n;
  12:	8b 45 ec             	mov    -0x14(%ebp),%eax
  15:	01 45 f4             	add    %eax,-0xc(%ebp)
    buf[m] = '\0';
  18:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1b:	05 20 10 00 00       	add    $0x1020,%eax
  20:	c6 00 00             	movb   $0x0,(%eax)
    p = buf;
  23:	c7 45 f0 20 10 00 00 	movl   $0x1020,-0x10(%ebp)
    while((q = strchr(p, '\n')) != 0){
  2a:	eb 51                	jmp    7d <grep+0x7d>
      *q = 0;
  2c:	8b 45 e8             	mov    -0x18(%ebp),%eax
  2f:	c6 00 00             	movb   $0x0,(%eax)
      if(match(pattern, p)){
  32:	8b 45 f0             	mov    -0x10(%ebp),%eax
  35:	89 44 24 04          	mov    %eax,0x4(%esp)
  39:	8b 45 08             	mov    0x8(%ebp),%eax
  3c:	89 04 24             	mov    %eax,(%esp)
  3f:	e8 bc 01 00 00       	call   200 <match>
  44:	85 c0                	test   %eax,%eax
  46:	74 2c                	je     74 <grep+0x74>
        *q = '\n';
  48:	8b 45 e8             	mov    -0x18(%ebp),%eax
  4b:	c6 00 0a             	movb   $0xa,(%eax)
        write(1, p, q+1 - p);
  4e:	8b 45 e8             	mov    -0x18(%ebp),%eax
  51:	83 c0 01             	add    $0x1,%eax
  54:	89 c2                	mov    %eax,%edx
  56:	8b 45 f0             	mov    -0x10(%ebp),%eax
  59:	29 c2                	sub    %eax,%edx
  5b:	89 d0                	mov    %edx,%eax
  5d:	89 44 24 08          	mov    %eax,0x8(%esp)
  61:	8b 45 f0             	mov    -0x10(%ebp),%eax
  64:	89 44 24 04          	mov    %eax,0x4(%esp)
  68:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  6f:	e8 e1 06 00 00       	call   755 <write>
      }
      p = q+1;
  74:	8b 45 e8             	mov    -0x18(%ebp),%eax
  77:	83 c0 01             	add    $0x1,%eax
  7a:	89 45 f0             	mov    %eax,-0x10(%ebp)
    while((q = strchr(p, '\n')) != 0){
  7d:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
  84:	00 
  85:	8b 45 f0             	mov    -0x10(%ebp),%eax
  88:	89 04 24             	mov    %eax,(%esp)
  8b:	e8 1c 05 00 00       	call   5ac <strchr>
  90:	89 45 e8             	mov    %eax,-0x18(%ebp)
  93:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  97:	75 93                	jne    2c <grep+0x2c>
    }
    if(p == buf)
  99:	81 7d f0 20 10 00 00 	cmpl   $0x1020,-0x10(%ebp)
  a0:	75 07                	jne    a9 <grep+0xa9>
      m = 0;
  a2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if(m > 0){
  a9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  ad:	7e 29                	jle    d8 <grep+0xd8>
      m -= p - buf;
  af:	ba 20 10 00 00       	mov    $0x1020,%edx
  b4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  b7:	29 c2                	sub    %eax,%edx
  b9:	89 d0                	mov    %edx,%eax
  bb:	01 45 f4             	add    %eax,-0xc(%ebp)
      memmove(buf, p, m);
  be:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c1:	89 44 24 08          	mov    %eax,0x8(%esp)
  c5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c8:	89 44 24 04          	mov    %eax,0x4(%esp)
  cc:	c7 04 24 20 10 00 00 	movl   $0x1020,(%esp)
  d3:	e8 18 06 00 00       	call   6f0 <memmove>
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
  d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  db:	ba ff 03 00 00       	mov    $0x3ff,%edx
  e0:	29 c2                	sub    %eax,%edx
  e2:	89 d0                	mov    %edx,%eax
  e4:	8b 55 f4             	mov    -0xc(%ebp),%edx
  e7:	81 c2 20 10 00 00    	add    $0x1020,%edx
  ed:	89 44 24 08          	mov    %eax,0x8(%esp)
  f1:	89 54 24 04          	mov    %edx,0x4(%esp)
  f5:	8b 45 0c             	mov    0xc(%ebp),%eax
  f8:	89 04 24             	mov    %eax,(%esp)
  fb:	e8 4d 06 00 00       	call   74d <read>
 100:	89 45 ec             	mov    %eax,-0x14(%ebp)
 103:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 107:	0f 8f 05 ff ff ff    	jg     12 <grep+0x12>
    }
  }
}
 10d:	c9                   	leave  
 10e:	c3                   	ret    

0000010f <main>:

int
main(int argc, char *argv[])
{
 10f:	55                   	push   %ebp
 110:	89 e5                	mov    %esp,%ebp
 112:	83 e4 f0             	and    $0xfffffff0,%esp
 115:	83 ec 20             	sub    $0x20,%esp
  int fd, i;
  char *pattern;

  if(argc <= 1){
 118:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
 11c:	7f 19                	jg     137 <main+0x28>
    printf(2, "usage: grep pattern [file ...]\n");
 11e:	c7 44 24 04 94 0c 00 	movl   $0xc94,0x4(%esp)
 125:	00 
 126:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 12d:	e8 93 07 00 00       	call   8c5 <printf>
    exit();
 132:	e8 fe 05 00 00       	call   735 <exit>
  }
  pattern = argv[1];
 137:	8b 45 0c             	mov    0xc(%ebp),%eax
 13a:	8b 40 04             	mov    0x4(%eax),%eax
 13d:	89 44 24 18          	mov    %eax,0x18(%esp)

  if(argc <= 2){
 141:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
 145:	7f 19                	jg     160 <main+0x51>
    grep(pattern, 0);
 147:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 14e:	00 
 14f:	8b 44 24 18          	mov    0x18(%esp),%eax
 153:	89 04 24             	mov    %eax,(%esp)
 156:	e8 a5 fe ff ff       	call   0 <grep>
    exit();
 15b:	e8 d5 05 00 00       	call   735 <exit>
  }

  for(i = 2; i < argc; i++){
 160:	c7 44 24 1c 02 00 00 	movl   $0x2,0x1c(%esp)
 167:	00 
 168:	e9 81 00 00 00       	jmp    1ee <main+0xdf>
    if((fd = open(argv[i], 0)) < 0){
 16d:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 171:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 178:	8b 45 0c             	mov    0xc(%ebp),%eax
 17b:	01 d0                	add    %edx,%eax
 17d:	8b 00                	mov    (%eax),%eax
 17f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 186:	00 
 187:	89 04 24             	mov    %eax,(%esp)
 18a:	e8 e6 05 00 00       	call   775 <open>
 18f:	89 44 24 14          	mov    %eax,0x14(%esp)
 193:	83 7c 24 14 00       	cmpl   $0x0,0x14(%esp)
 198:	79 2f                	jns    1c9 <main+0xba>
      printf(1, "grep: cannot open %s\n", argv[i]);
 19a:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 19e:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 1a5:	8b 45 0c             	mov    0xc(%ebp),%eax
 1a8:	01 d0                	add    %edx,%eax
 1aa:	8b 00                	mov    (%eax),%eax
 1ac:	89 44 24 08          	mov    %eax,0x8(%esp)
 1b0:	c7 44 24 04 b4 0c 00 	movl   $0xcb4,0x4(%esp)
 1b7:	00 
 1b8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1bf:	e8 01 07 00 00       	call   8c5 <printf>
      exit();
 1c4:	e8 6c 05 00 00       	call   735 <exit>
    }
    grep(pattern, fd);
 1c9:	8b 44 24 14          	mov    0x14(%esp),%eax
 1cd:	89 44 24 04          	mov    %eax,0x4(%esp)
 1d1:	8b 44 24 18          	mov    0x18(%esp),%eax
 1d5:	89 04 24             	mov    %eax,(%esp)
 1d8:	e8 23 fe ff ff       	call   0 <grep>
    close(fd);
 1dd:	8b 44 24 14          	mov    0x14(%esp),%eax
 1e1:	89 04 24             	mov    %eax,(%esp)
 1e4:	e8 74 05 00 00       	call   75d <close>
  for(i = 2; i < argc; i++){
 1e9:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
 1ee:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 1f2:	3b 45 08             	cmp    0x8(%ebp),%eax
 1f5:	0f 8c 72 ff ff ff    	jl     16d <main+0x5e>
  }
  exit();
 1fb:	e8 35 05 00 00       	call   735 <exit>

00000200 <match>:
int matchhere(char*, char*);
int matchstar(int, char*, char*);

int
match(char *re, char *text)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	83 ec 18             	sub    $0x18,%esp
  if(re[0] == '^')
 206:	8b 45 08             	mov    0x8(%ebp),%eax
 209:	0f b6 00             	movzbl (%eax),%eax
 20c:	3c 5e                	cmp    $0x5e,%al
 20e:	75 17                	jne    227 <match+0x27>
    return matchhere(re+1, text);
 210:	8b 45 08             	mov    0x8(%ebp),%eax
 213:	8d 50 01             	lea    0x1(%eax),%edx
 216:	8b 45 0c             	mov    0xc(%ebp),%eax
 219:	89 44 24 04          	mov    %eax,0x4(%esp)
 21d:	89 14 24             	mov    %edx,(%esp)
 220:	e8 36 00 00 00       	call   25b <matchhere>
 225:	eb 32                	jmp    259 <match+0x59>
  do{  // must look at empty string
    if(matchhere(re, text))
 227:	8b 45 0c             	mov    0xc(%ebp),%eax
 22a:	89 44 24 04          	mov    %eax,0x4(%esp)
 22e:	8b 45 08             	mov    0x8(%ebp),%eax
 231:	89 04 24             	mov    %eax,(%esp)
 234:	e8 22 00 00 00       	call   25b <matchhere>
 239:	85 c0                	test   %eax,%eax
 23b:	74 07                	je     244 <match+0x44>
      return 1;
 23d:	b8 01 00 00 00       	mov    $0x1,%eax
 242:	eb 15                	jmp    259 <match+0x59>
  }while(*text++ != '\0');
 244:	8b 45 0c             	mov    0xc(%ebp),%eax
 247:	8d 50 01             	lea    0x1(%eax),%edx
 24a:	89 55 0c             	mov    %edx,0xc(%ebp)
 24d:	0f b6 00             	movzbl (%eax),%eax
 250:	84 c0                	test   %al,%al
 252:	75 d3                	jne    227 <match+0x27>
  return 0;
 254:	b8 00 00 00 00       	mov    $0x0,%eax
}
 259:	c9                   	leave  
 25a:	c3                   	ret    

0000025b <matchhere>:

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
 25b:	55                   	push   %ebp
 25c:	89 e5                	mov    %esp,%ebp
 25e:	83 ec 18             	sub    $0x18,%esp
  if(re[0] == '\0')
 261:	8b 45 08             	mov    0x8(%ebp),%eax
 264:	0f b6 00             	movzbl (%eax),%eax
 267:	84 c0                	test   %al,%al
 269:	75 0a                	jne    275 <matchhere+0x1a>
    return 1;
 26b:	b8 01 00 00 00       	mov    $0x1,%eax
 270:	e9 9b 00 00 00       	jmp    310 <matchhere+0xb5>
  if(re[1] == '*')
 275:	8b 45 08             	mov    0x8(%ebp),%eax
 278:	83 c0 01             	add    $0x1,%eax
 27b:	0f b6 00             	movzbl (%eax),%eax
 27e:	3c 2a                	cmp    $0x2a,%al
 280:	75 24                	jne    2a6 <matchhere+0x4b>
    return matchstar(re[0], re+2, text);
 282:	8b 45 08             	mov    0x8(%ebp),%eax
 285:	8d 48 02             	lea    0x2(%eax),%ecx
 288:	8b 45 08             	mov    0x8(%ebp),%eax
 28b:	0f b6 00             	movzbl (%eax),%eax
 28e:	0f be c0             	movsbl %al,%eax
 291:	8b 55 0c             	mov    0xc(%ebp),%edx
 294:	89 54 24 08          	mov    %edx,0x8(%esp)
 298:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 29c:	89 04 24             	mov    %eax,(%esp)
 29f:	e8 6e 00 00 00       	call   312 <matchstar>
 2a4:	eb 6a                	jmp    310 <matchhere+0xb5>
  if(re[0] == '$' && re[1] == '\0')
 2a6:	8b 45 08             	mov    0x8(%ebp),%eax
 2a9:	0f b6 00             	movzbl (%eax),%eax
 2ac:	3c 24                	cmp    $0x24,%al
 2ae:	75 1d                	jne    2cd <matchhere+0x72>
 2b0:	8b 45 08             	mov    0x8(%ebp),%eax
 2b3:	83 c0 01             	add    $0x1,%eax
 2b6:	0f b6 00             	movzbl (%eax),%eax
 2b9:	84 c0                	test   %al,%al
 2bb:	75 10                	jne    2cd <matchhere+0x72>
    return *text == '\0';
 2bd:	8b 45 0c             	mov    0xc(%ebp),%eax
 2c0:	0f b6 00             	movzbl (%eax),%eax
 2c3:	84 c0                	test   %al,%al
 2c5:	0f 94 c0             	sete   %al
 2c8:	0f b6 c0             	movzbl %al,%eax
 2cb:	eb 43                	jmp    310 <matchhere+0xb5>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
 2cd:	8b 45 0c             	mov    0xc(%ebp),%eax
 2d0:	0f b6 00             	movzbl (%eax),%eax
 2d3:	84 c0                	test   %al,%al
 2d5:	74 34                	je     30b <matchhere+0xb0>
 2d7:	8b 45 08             	mov    0x8(%ebp),%eax
 2da:	0f b6 00             	movzbl (%eax),%eax
 2dd:	3c 2e                	cmp    $0x2e,%al
 2df:	74 10                	je     2f1 <matchhere+0x96>
 2e1:	8b 45 08             	mov    0x8(%ebp),%eax
 2e4:	0f b6 10             	movzbl (%eax),%edx
 2e7:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ea:	0f b6 00             	movzbl (%eax),%eax
 2ed:	38 c2                	cmp    %al,%dl
 2ef:	75 1a                	jne    30b <matchhere+0xb0>
    return matchhere(re+1, text+1);
 2f1:	8b 45 0c             	mov    0xc(%ebp),%eax
 2f4:	8d 50 01             	lea    0x1(%eax),%edx
 2f7:	8b 45 08             	mov    0x8(%ebp),%eax
 2fa:	83 c0 01             	add    $0x1,%eax
 2fd:	89 54 24 04          	mov    %edx,0x4(%esp)
 301:	89 04 24             	mov    %eax,(%esp)
 304:	e8 52 ff ff ff       	call   25b <matchhere>
 309:	eb 05                	jmp    310 <matchhere+0xb5>
  return 0;
 30b:	b8 00 00 00 00       	mov    $0x0,%eax
}
 310:	c9                   	leave  
 311:	c3                   	ret    

00000312 <matchstar>:

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
 312:	55                   	push   %ebp
 313:	89 e5                	mov    %esp,%ebp
 315:	83 ec 18             	sub    $0x18,%esp
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
 318:	8b 45 10             	mov    0x10(%ebp),%eax
 31b:	89 44 24 04          	mov    %eax,0x4(%esp)
 31f:	8b 45 0c             	mov    0xc(%ebp),%eax
 322:	89 04 24             	mov    %eax,(%esp)
 325:	e8 31 ff ff ff       	call   25b <matchhere>
 32a:	85 c0                	test   %eax,%eax
 32c:	74 07                	je     335 <matchstar+0x23>
      return 1;
 32e:	b8 01 00 00 00       	mov    $0x1,%eax
 333:	eb 29                	jmp    35e <matchstar+0x4c>
  }while(*text!='\0' && (*text++==c || c=='.'));
 335:	8b 45 10             	mov    0x10(%ebp),%eax
 338:	0f b6 00             	movzbl (%eax),%eax
 33b:	84 c0                	test   %al,%al
 33d:	74 1a                	je     359 <matchstar+0x47>
 33f:	8b 45 10             	mov    0x10(%ebp),%eax
 342:	8d 50 01             	lea    0x1(%eax),%edx
 345:	89 55 10             	mov    %edx,0x10(%ebp)
 348:	0f b6 00             	movzbl (%eax),%eax
 34b:	0f be c0             	movsbl %al,%eax
 34e:	3b 45 08             	cmp    0x8(%ebp),%eax
 351:	74 c5                	je     318 <matchstar+0x6>
 353:	83 7d 08 2e          	cmpl   $0x2e,0x8(%ebp)
 357:	74 bf                	je     318 <matchstar+0x6>
  return 0;
 359:	b8 00 00 00 00       	mov    $0x0,%eax
}
 35e:	c9                   	leave  
 35f:	c3                   	ret    

00000360 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	57                   	push   %edi
 364:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 365:	8b 4d 08             	mov    0x8(%ebp),%ecx
 368:	8b 55 10             	mov    0x10(%ebp),%edx
 36b:	8b 45 0c             	mov    0xc(%ebp),%eax
 36e:	89 cb                	mov    %ecx,%ebx
 370:	89 df                	mov    %ebx,%edi
 372:	89 d1                	mov    %edx,%ecx
 374:	fc                   	cld    
 375:	f3 aa                	rep stos %al,%es:(%edi)
 377:	89 ca                	mov    %ecx,%edx
 379:	89 fb                	mov    %edi,%ebx
 37b:	89 5d 08             	mov    %ebx,0x8(%ebp)
 37e:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 381:	5b                   	pop    %ebx
 382:	5f                   	pop    %edi
 383:	5d                   	pop    %ebp
 384:	c3                   	ret    

00000385 <ps>:
#include "user.h"
#include "x86.h"
#include "param.h"
#include "pstat.h"

void ps(){
 385:	55                   	push   %ebp
 386:	89 e5                	mov    %esp,%ebp
 388:	57                   	push   %edi
 389:	56                   	push   %esi
 38a:	53                   	push   %ebx
 38b:	81 ec 2c 09 00 00    	sub    $0x92c,%esp
  
  //pstatTable pst = malloc(NPROC * sizeof(pstat_t));
  pstat_t pst[NPROC];
  getpinfo(&pst);
 391:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 397:	89 04 24             	mov    %eax,(%esp)
 39a:	e8 36 04 00 00       	call   7d5 <getpinfo>
  int i;
  for (i = 0; i < NPROC; i++){
 39f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 3a6:	e9 32 01 00 00       	jmp    4dd <ps+0x158>
    if (pst[i].inuse == 1){
 3ab:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 3ae:	89 d0                	mov    %edx,%eax
 3b0:	c1 e0 03             	shl    $0x3,%eax
 3b3:	01 d0                	add    %edx,%eax
 3b5:	c1 e0 02             	shl    $0x2,%eax
 3b8:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 3bb:	01 d8                	add    %ebx,%eax
 3bd:	2d 04 09 00 00       	sub    $0x904,%eax
 3c2:	8b 00                	mov    (%eax),%eax
 3c4:	83 f8 01             	cmp    $0x1,%eax
 3c7:	0f 85 0c 01 00 00    	jne    4d9 <ps+0x154>
      printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 3cd:	c7 44 24 04 ca 0c 00 	movl   $0xcca,0x4(%esp)
 3d4:	00 
 3d5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3dc:	e8 e4 04 00 00       	call   8c5 <printf>
      printf(1, "%d\t", pst[i].pid);
 3e1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 3e4:	89 d0                	mov    %edx,%eax
 3e6:	c1 e0 03             	shl    $0x3,%eax
 3e9:	01 d0                	add    %edx,%eax
 3eb:	c1 e0 02             	shl    $0x2,%eax
 3ee:	8d 75 e8             	lea    -0x18(%ebp),%esi
 3f1:	01 f0                	add    %esi,%eax
 3f3:	2d fc 08 00 00       	sub    $0x8fc,%eax
 3f8:	8b 00                	mov    (%eax),%eax
 3fa:	89 44 24 08          	mov    %eax,0x8(%esp)
 3fe:	c7 44 24 04 e3 0c 00 	movl   $0xce3,0x4(%esp)
 405:	00 
 406:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 40d:	e8 b3 04 00 00       	call   8c5 <printf>
      printf(1, "%d\t", pst[i].tickets);
 412:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 415:	89 d0                	mov    %edx,%eax
 417:	c1 e0 03             	shl    $0x3,%eax
 41a:	01 d0                	add    %edx,%eax
 41c:	c1 e0 02             	shl    $0x2,%eax
 41f:	8d 7d e8             	lea    -0x18(%ebp),%edi
 422:	01 f8                	add    %edi,%eax
 424:	2d 00 09 00 00       	sub    $0x900,%eax
 429:	8b 00                	mov    (%eax),%eax
 42b:	89 44 24 08          	mov    %eax,0x8(%esp)
 42f:	c7 44 24 04 e3 0c 00 	movl   $0xce3,0x4(%esp)
 436:	00 
 437:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 43e:	e8 82 04 00 00       	call   8c5 <printf>
      printf(1, "%d\t", pst[i].ticks);
 443:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 446:	89 d0                	mov    %edx,%eax
 448:	c1 e0 03             	shl    $0x3,%eax
 44b:	01 d0                	add    %edx,%eax
 44d:	c1 e0 02             	shl    $0x2,%eax
 450:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 453:	01 c8                	add    %ecx,%eax
 455:	2d f8 08 00 00       	sub    $0x8f8,%eax
 45a:	8b 00                	mov    (%eax),%eax
 45c:	89 44 24 08          	mov    %eax,0x8(%esp)
 460:	c7 44 24 04 e3 0c 00 	movl   $0xce3,0x4(%esp)
 467:	00 
 468:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 46f:	e8 51 04 00 00       	call   8c5 <printf>
      printf(1, "%c\t", pst[i].state);
 474:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 477:	89 d0                	mov    %edx,%eax
 479:	c1 e0 03             	shl    $0x3,%eax
 47c:	01 d0                	add    %edx,%eax
 47e:	c1 e0 02             	shl    $0x2,%eax
 481:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 484:	01 d8                	add    %ebx,%eax
 486:	2d e4 08 00 00       	sub    $0x8e4,%eax
 48b:	0f b6 00             	movzbl (%eax),%eax
 48e:	0f be c0             	movsbl %al,%eax
 491:	89 44 24 08          	mov    %eax,0x8(%esp)
 495:	c7 44 24 04 e7 0c 00 	movl   $0xce7,0x4(%esp)
 49c:	00 
 49d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 4a4:	e8 1c 04 00 00       	call   8c5 <printf>
      printf(1, "%s\t\n", pst[i].name);
 4a9:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 4af:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 4b2:	89 d0                	mov    %edx,%eax
 4b4:	c1 e0 03             	shl    $0x3,%eax
 4b7:	01 d0                	add    %edx,%eax
 4b9:	c1 e0 02             	shl    $0x2,%eax
 4bc:	83 c0 10             	add    $0x10,%eax
 4bf:	01 c8                	add    %ecx,%eax
 4c1:	89 44 24 08          	mov    %eax,0x8(%esp)
 4c5:	c7 44 24 04 eb 0c 00 	movl   $0xceb,0x4(%esp)
 4cc:	00 
 4cd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 4d4:	e8 ec 03 00 00       	call   8c5 <printf>
  for (i = 0; i < NPROC; i++){
 4d9:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 4dd:	83 7d e4 3f          	cmpl   $0x3f,-0x1c(%ebp)
 4e1:	0f 8e c4 fe ff ff    	jle    3ab <ps+0x26>
    }
  }
}
 4e7:	81 c4 2c 09 00 00    	add    $0x92c,%esp
 4ed:	5b                   	pop    %ebx
 4ee:	5e                   	pop    %esi
 4ef:	5f                   	pop    %edi
 4f0:	5d                   	pop    %ebp
 4f1:	c3                   	ret    

000004f2 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 4f2:	55                   	push   %ebp
 4f3:	89 e5                	mov    %esp,%ebp
 4f5:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 4f8:	8b 45 08             	mov    0x8(%ebp),%eax
 4fb:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 4fe:	90                   	nop
 4ff:	8b 45 08             	mov    0x8(%ebp),%eax
 502:	8d 50 01             	lea    0x1(%eax),%edx
 505:	89 55 08             	mov    %edx,0x8(%ebp)
 508:	8b 55 0c             	mov    0xc(%ebp),%edx
 50b:	8d 4a 01             	lea    0x1(%edx),%ecx
 50e:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 511:	0f b6 12             	movzbl (%edx),%edx
 514:	88 10                	mov    %dl,(%eax)
 516:	0f b6 00             	movzbl (%eax),%eax
 519:	84 c0                	test   %al,%al
 51b:	75 e2                	jne    4ff <strcpy+0xd>
    ;
  return os;
 51d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 520:	c9                   	leave  
 521:	c3                   	ret    

00000522 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 522:	55                   	push   %ebp
 523:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 525:	eb 08                	jmp    52f <strcmp+0xd>
    p++, q++;
 527:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 52b:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 52f:	8b 45 08             	mov    0x8(%ebp),%eax
 532:	0f b6 00             	movzbl (%eax),%eax
 535:	84 c0                	test   %al,%al
 537:	74 10                	je     549 <strcmp+0x27>
 539:	8b 45 08             	mov    0x8(%ebp),%eax
 53c:	0f b6 10             	movzbl (%eax),%edx
 53f:	8b 45 0c             	mov    0xc(%ebp),%eax
 542:	0f b6 00             	movzbl (%eax),%eax
 545:	38 c2                	cmp    %al,%dl
 547:	74 de                	je     527 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 549:	8b 45 08             	mov    0x8(%ebp),%eax
 54c:	0f b6 00             	movzbl (%eax),%eax
 54f:	0f b6 d0             	movzbl %al,%edx
 552:	8b 45 0c             	mov    0xc(%ebp),%eax
 555:	0f b6 00             	movzbl (%eax),%eax
 558:	0f b6 c0             	movzbl %al,%eax
 55b:	29 c2                	sub    %eax,%edx
 55d:	89 d0                	mov    %edx,%eax
}
 55f:	5d                   	pop    %ebp
 560:	c3                   	ret    

00000561 <strlen>:

uint
strlen(const char *s)
{
 561:	55                   	push   %ebp
 562:	89 e5                	mov    %esp,%ebp
 564:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 567:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 56e:	eb 04                	jmp    574 <strlen+0x13>
 570:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 574:	8b 55 fc             	mov    -0x4(%ebp),%edx
 577:	8b 45 08             	mov    0x8(%ebp),%eax
 57a:	01 d0                	add    %edx,%eax
 57c:	0f b6 00             	movzbl (%eax),%eax
 57f:	84 c0                	test   %al,%al
 581:	75 ed                	jne    570 <strlen+0xf>
    ;
  return n;
 583:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 586:	c9                   	leave  
 587:	c3                   	ret    

00000588 <memset>:

void*
memset(void *dst, int c, uint n)
{
 588:	55                   	push   %ebp
 589:	89 e5                	mov    %esp,%ebp
 58b:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 58e:	8b 45 10             	mov    0x10(%ebp),%eax
 591:	89 44 24 08          	mov    %eax,0x8(%esp)
 595:	8b 45 0c             	mov    0xc(%ebp),%eax
 598:	89 44 24 04          	mov    %eax,0x4(%esp)
 59c:	8b 45 08             	mov    0x8(%ebp),%eax
 59f:	89 04 24             	mov    %eax,(%esp)
 5a2:	e8 b9 fd ff ff       	call   360 <stosb>
  return dst;
 5a7:	8b 45 08             	mov    0x8(%ebp),%eax
}
 5aa:	c9                   	leave  
 5ab:	c3                   	ret    

000005ac <strchr>:

char*
strchr(const char *s, char c)
{
 5ac:	55                   	push   %ebp
 5ad:	89 e5                	mov    %esp,%ebp
 5af:	83 ec 04             	sub    $0x4,%esp
 5b2:	8b 45 0c             	mov    0xc(%ebp),%eax
 5b5:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 5b8:	eb 14                	jmp    5ce <strchr+0x22>
    if(*s == c)
 5ba:	8b 45 08             	mov    0x8(%ebp),%eax
 5bd:	0f b6 00             	movzbl (%eax),%eax
 5c0:	3a 45 fc             	cmp    -0x4(%ebp),%al
 5c3:	75 05                	jne    5ca <strchr+0x1e>
      return (char*)s;
 5c5:	8b 45 08             	mov    0x8(%ebp),%eax
 5c8:	eb 13                	jmp    5dd <strchr+0x31>
  for(; *s; s++)
 5ca:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 5ce:	8b 45 08             	mov    0x8(%ebp),%eax
 5d1:	0f b6 00             	movzbl (%eax),%eax
 5d4:	84 c0                	test   %al,%al
 5d6:	75 e2                	jne    5ba <strchr+0xe>
  return 0;
 5d8:	b8 00 00 00 00       	mov    $0x0,%eax
}
 5dd:	c9                   	leave  
 5de:	c3                   	ret    

000005df <gets>:

char*
gets(char *buf, int max)
{
 5df:	55                   	push   %ebp
 5e0:	89 e5                	mov    %esp,%ebp
 5e2:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 5e5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 5ec:	eb 4c                	jmp    63a <gets+0x5b>
    cc = read(0, &c, 1);
 5ee:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5f5:	00 
 5f6:	8d 45 ef             	lea    -0x11(%ebp),%eax
 5f9:	89 44 24 04          	mov    %eax,0x4(%esp)
 5fd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 604:	e8 44 01 00 00       	call   74d <read>
 609:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 60c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 610:	7f 02                	jg     614 <gets+0x35>
      break;
 612:	eb 31                	jmp    645 <gets+0x66>
    buf[i++] = c;
 614:	8b 45 f4             	mov    -0xc(%ebp),%eax
 617:	8d 50 01             	lea    0x1(%eax),%edx
 61a:	89 55 f4             	mov    %edx,-0xc(%ebp)
 61d:	89 c2                	mov    %eax,%edx
 61f:	8b 45 08             	mov    0x8(%ebp),%eax
 622:	01 c2                	add    %eax,%edx
 624:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 628:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 62a:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 62e:	3c 0a                	cmp    $0xa,%al
 630:	74 13                	je     645 <gets+0x66>
 632:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 636:	3c 0d                	cmp    $0xd,%al
 638:	74 0b                	je     645 <gets+0x66>
  for(i=0; i+1 < max; ){
 63a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 63d:	83 c0 01             	add    $0x1,%eax
 640:	3b 45 0c             	cmp    0xc(%ebp),%eax
 643:	7c a9                	jl     5ee <gets+0xf>
      break;
  }
  buf[i] = '\0';
 645:	8b 55 f4             	mov    -0xc(%ebp),%edx
 648:	8b 45 08             	mov    0x8(%ebp),%eax
 64b:	01 d0                	add    %edx,%eax
 64d:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 650:	8b 45 08             	mov    0x8(%ebp),%eax
}
 653:	c9                   	leave  
 654:	c3                   	ret    

00000655 <stat>:

int
stat(const char *n, struct stat *st)
{
 655:	55                   	push   %ebp
 656:	89 e5                	mov    %esp,%ebp
 658:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 65b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 662:	00 
 663:	8b 45 08             	mov    0x8(%ebp),%eax
 666:	89 04 24             	mov    %eax,(%esp)
 669:	e8 07 01 00 00       	call   775 <open>
 66e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 671:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 675:	79 07                	jns    67e <stat+0x29>
    return -1;
 677:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 67c:	eb 23                	jmp    6a1 <stat+0x4c>
  r = fstat(fd, st);
 67e:	8b 45 0c             	mov    0xc(%ebp),%eax
 681:	89 44 24 04          	mov    %eax,0x4(%esp)
 685:	8b 45 f4             	mov    -0xc(%ebp),%eax
 688:	89 04 24             	mov    %eax,(%esp)
 68b:	e8 fd 00 00 00       	call   78d <fstat>
 690:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 693:	8b 45 f4             	mov    -0xc(%ebp),%eax
 696:	89 04 24             	mov    %eax,(%esp)
 699:	e8 bf 00 00 00       	call   75d <close>
  return r;
 69e:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 6a1:	c9                   	leave  
 6a2:	c3                   	ret    

000006a3 <atoi>:

int
atoi(const char *s)
{
 6a3:	55                   	push   %ebp
 6a4:	89 e5                	mov    %esp,%ebp
 6a6:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 6a9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 6b0:	eb 25                	jmp    6d7 <atoi+0x34>
    n = n*10 + *s++ - '0';
 6b2:	8b 55 fc             	mov    -0x4(%ebp),%edx
 6b5:	89 d0                	mov    %edx,%eax
 6b7:	c1 e0 02             	shl    $0x2,%eax
 6ba:	01 d0                	add    %edx,%eax
 6bc:	01 c0                	add    %eax,%eax
 6be:	89 c1                	mov    %eax,%ecx
 6c0:	8b 45 08             	mov    0x8(%ebp),%eax
 6c3:	8d 50 01             	lea    0x1(%eax),%edx
 6c6:	89 55 08             	mov    %edx,0x8(%ebp)
 6c9:	0f b6 00             	movzbl (%eax),%eax
 6cc:	0f be c0             	movsbl %al,%eax
 6cf:	01 c8                	add    %ecx,%eax
 6d1:	83 e8 30             	sub    $0x30,%eax
 6d4:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 6d7:	8b 45 08             	mov    0x8(%ebp),%eax
 6da:	0f b6 00             	movzbl (%eax),%eax
 6dd:	3c 2f                	cmp    $0x2f,%al
 6df:	7e 0a                	jle    6eb <atoi+0x48>
 6e1:	8b 45 08             	mov    0x8(%ebp),%eax
 6e4:	0f b6 00             	movzbl (%eax),%eax
 6e7:	3c 39                	cmp    $0x39,%al
 6e9:	7e c7                	jle    6b2 <atoi+0xf>
  return n;
 6eb:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 6ee:	c9                   	leave  
 6ef:	c3                   	ret    

000006f0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 6f0:	55                   	push   %ebp
 6f1:	89 e5                	mov    %esp,%ebp
 6f3:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 6f6:	8b 45 08             	mov    0x8(%ebp),%eax
 6f9:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 6fc:	8b 45 0c             	mov    0xc(%ebp),%eax
 6ff:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 702:	eb 17                	jmp    71b <memmove+0x2b>
    *dst++ = *src++;
 704:	8b 45 fc             	mov    -0x4(%ebp),%eax
 707:	8d 50 01             	lea    0x1(%eax),%edx
 70a:	89 55 fc             	mov    %edx,-0x4(%ebp)
 70d:	8b 55 f8             	mov    -0x8(%ebp),%edx
 710:	8d 4a 01             	lea    0x1(%edx),%ecx
 713:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 716:	0f b6 12             	movzbl (%edx),%edx
 719:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 71b:	8b 45 10             	mov    0x10(%ebp),%eax
 71e:	8d 50 ff             	lea    -0x1(%eax),%edx
 721:	89 55 10             	mov    %edx,0x10(%ebp)
 724:	85 c0                	test   %eax,%eax
 726:	7f dc                	jg     704 <memmove+0x14>
  return vdst;
 728:	8b 45 08             	mov    0x8(%ebp),%eax
}
 72b:	c9                   	leave  
 72c:	c3                   	ret    

0000072d <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 72d:	b8 01 00 00 00       	mov    $0x1,%eax
 732:	cd 40                	int    $0x40
 734:	c3                   	ret    

00000735 <exit>:
SYSCALL(exit)
 735:	b8 02 00 00 00       	mov    $0x2,%eax
 73a:	cd 40                	int    $0x40
 73c:	c3                   	ret    

0000073d <wait>:
SYSCALL(wait)
 73d:	b8 03 00 00 00       	mov    $0x3,%eax
 742:	cd 40                	int    $0x40
 744:	c3                   	ret    

00000745 <pipe>:
SYSCALL(pipe)
 745:	b8 04 00 00 00       	mov    $0x4,%eax
 74a:	cd 40                	int    $0x40
 74c:	c3                   	ret    

0000074d <read>:
SYSCALL(read)
 74d:	b8 05 00 00 00       	mov    $0x5,%eax
 752:	cd 40                	int    $0x40
 754:	c3                   	ret    

00000755 <write>:
SYSCALL(write)
 755:	b8 10 00 00 00       	mov    $0x10,%eax
 75a:	cd 40                	int    $0x40
 75c:	c3                   	ret    

0000075d <close>:
SYSCALL(close)
 75d:	b8 15 00 00 00       	mov    $0x15,%eax
 762:	cd 40                	int    $0x40
 764:	c3                   	ret    

00000765 <kill>:
SYSCALL(kill)
 765:	b8 06 00 00 00       	mov    $0x6,%eax
 76a:	cd 40                	int    $0x40
 76c:	c3                   	ret    

0000076d <exec>:
SYSCALL(exec)
 76d:	b8 07 00 00 00       	mov    $0x7,%eax
 772:	cd 40                	int    $0x40
 774:	c3                   	ret    

00000775 <open>:
SYSCALL(open)
 775:	b8 0f 00 00 00       	mov    $0xf,%eax
 77a:	cd 40                	int    $0x40
 77c:	c3                   	ret    

0000077d <mknod>:
SYSCALL(mknod)
 77d:	b8 11 00 00 00       	mov    $0x11,%eax
 782:	cd 40                	int    $0x40
 784:	c3                   	ret    

00000785 <unlink>:
SYSCALL(unlink)
 785:	b8 12 00 00 00       	mov    $0x12,%eax
 78a:	cd 40                	int    $0x40
 78c:	c3                   	ret    

0000078d <fstat>:
SYSCALL(fstat)
 78d:	b8 08 00 00 00       	mov    $0x8,%eax
 792:	cd 40                	int    $0x40
 794:	c3                   	ret    

00000795 <link>:
SYSCALL(link)
 795:	b8 13 00 00 00       	mov    $0x13,%eax
 79a:	cd 40                	int    $0x40
 79c:	c3                   	ret    

0000079d <mkdir>:
SYSCALL(mkdir)
 79d:	b8 14 00 00 00       	mov    $0x14,%eax
 7a2:	cd 40                	int    $0x40
 7a4:	c3                   	ret    

000007a5 <chdir>:
SYSCALL(chdir)
 7a5:	b8 09 00 00 00       	mov    $0x9,%eax
 7aa:	cd 40                	int    $0x40
 7ac:	c3                   	ret    

000007ad <dup>:
SYSCALL(dup)
 7ad:	b8 0a 00 00 00       	mov    $0xa,%eax
 7b2:	cd 40                	int    $0x40
 7b4:	c3                   	ret    

000007b5 <getpid>:
SYSCALL(getpid)
 7b5:	b8 0b 00 00 00       	mov    $0xb,%eax
 7ba:	cd 40                	int    $0x40
 7bc:	c3                   	ret    

000007bd <sbrk>:
SYSCALL(sbrk)
 7bd:	b8 0c 00 00 00       	mov    $0xc,%eax
 7c2:	cd 40                	int    $0x40
 7c4:	c3                   	ret    

000007c5 <sleep>:
SYSCALL(sleep)
 7c5:	b8 0d 00 00 00       	mov    $0xd,%eax
 7ca:	cd 40                	int    $0x40
 7cc:	c3                   	ret    

000007cd <uptime>:
SYSCALL(uptime)
 7cd:	b8 0e 00 00 00       	mov    $0xe,%eax
 7d2:	cd 40                	int    $0x40
 7d4:	c3                   	ret    

000007d5 <getpinfo>:
SYSCALL(getpinfo)
 7d5:	b8 16 00 00 00       	mov    $0x16,%eax
 7da:	cd 40                	int    $0x40
 7dc:	c3                   	ret    

000007dd <settickets>:
SYSCALL(settickets)
 7dd:	b8 17 00 00 00       	mov    $0x17,%eax
 7e2:	cd 40                	int    $0x40
 7e4:	c3                   	ret    

000007e5 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 7e5:	55                   	push   %ebp
 7e6:	89 e5                	mov    %esp,%ebp
 7e8:	83 ec 18             	sub    $0x18,%esp
 7eb:	8b 45 0c             	mov    0xc(%ebp),%eax
 7ee:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 7f1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 7f8:	00 
 7f9:	8d 45 f4             	lea    -0xc(%ebp),%eax
 7fc:	89 44 24 04          	mov    %eax,0x4(%esp)
 800:	8b 45 08             	mov    0x8(%ebp),%eax
 803:	89 04 24             	mov    %eax,(%esp)
 806:	e8 4a ff ff ff       	call   755 <write>
}
 80b:	c9                   	leave  
 80c:	c3                   	ret    

0000080d <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 80d:	55                   	push   %ebp
 80e:	89 e5                	mov    %esp,%ebp
 810:	56                   	push   %esi
 811:	53                   	push   %ebx
 812:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 815:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 81c:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 820:	74 17                	je     839 <printint+0x2c>
 822:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 826:	79 11                	jns    839 <printint+0x2c>
    neg = 1;
 828:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 82f:	8b 45 0c             	mov    0xc(%ebp),%eax
 832:	f7 d8                	neg    %eax
 834:	89 45 ec             	mov    %eax,-0x14(%ebp)
 837:	eb 06                	jmp    83f <printint+0x32>
  } else {
    x = xx;
 839:	8b 45 0c             	mov    0xc(%ebp),%eax
 83c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 83f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 846:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 849:	8d 41 01             	lea    0x1(%ecx),%eax
 84c:	89 45 f4             	mov    %eax,-0xc(%ebp)
 84f:	8b 5d 10             	mov    0x10(%ebp),%ebx
 852:	8b 45 ec             	mov    -0x14(%ebp),%eax
 855:	ba 00 00 00 00       	mov    $0x0,%edx
 85a:	f7 f3                	div    %ebx
 85c:	89 d0                	mov    %edx,%eax
 85e:	0f b6 80 ec 0f 00 00 	movzbl 0xfec(%eax),%eax
 865:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 869:	8b 75 10             	mov    0x10(%ebp),%esi
 86c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 86f:	ba 00 00 00 00       	mov    $0x0,%edx
 874:	f7 f6                	div    %esi
 876:	89 45 ec             	mov    %eax,-0x14(%ebp)
 879:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 87d:	75 c7                	jne    846 <printint+0x39>
  if(neg)
 87f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 883:	74 10                	je     895 <printint+0x88>
    buf[i++] = '-';
 885:	8b 45 f4             	mov    -0xc(%ebp),%eax
 888:	8d 50 01             	lea    0x1(%eax),%edx
 88b:	89 55 f4             	mov    %edx,-0xc(%ebp)
 88e:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 893:	eb 1f                	jmp    8b4 <printint+0xa7>
 895:	eb 1d                	jmp    8b4 <printint+0xa7>
    putc(fd, buf[i]);
 897:	8d 55 dc             	lea    -0x24(%ebp),%edx
 89a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 89d:	01 d0                	add    %edx,%eax
 89f:	0f b6 00             	movzbl (%eax),%eax
 8a2:	0f be c0             	movsbl %al,%eax
 8a5:	89 44 24 04          	mov    %eax,0x4(%esp)
 8a9:	8b 45 08             	mov    0x8(%ebp),%eax
 8ac:	89 04 24             	mov    %eax,(%esp)
 8af:	e8 31 ff ff ff       	call   7e5 <putc>
  while(--i >= 0)
 8b4:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 8b8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8bc:	79 d9                	jns    897 <printint+0x8a>
}
 8be:	83 c4 30             	add    $0x30,%esp
 8c1:	5b                   	pop    %ebx
 8c2:	5e                   	pop    %esi
 8c3:	5d                   	pop    %ebp
 8c4:	c3                   	ret    

000008c5 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 8c5:	55                   	push   %ebp
 8c6:	89 e5                	mov    %esp,%ebp
 8c8:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 8cb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 8d2:	8d 45 0c             	lea    0xc(%ebp),%eax
 8d5:	83 c0 04             	add    $0x4,%eax
 8d8:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 8db:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 8e2:	e9 7c 01 00 00       	jmp    a63 <printf+0x19e>
    c = fmt[i] & 0xff;
 8e7:	8b 55 0c             	mov    0xc(%ebp),%edx
 8ea:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8ed:	01 d0                	add    %edx,%eax
 8ef:	0f b6 00             	movzbl (%eax),%eax
 8f2:	0f be c0             	movsbl %al,%eax
 8f5:	25 ff 00 00 00       	and    $0xff,%eax
 8fa:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 8fd:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 901:	75 2c                	jne    92f <printf+0x6a>
      if(c == '%'){
 903:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 907:	75 0c                	jne    915 <printf+0x50>
        state = '%';
 909:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 910:	e9 4a 01 00 00       	jmp    a5f <printf+0x19a>
      } else {
        putc(fd, c);
 915:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 918:	0f be c0             	movsbl %al,%eax
 91b:	89 44 24 04          	mov    %eax,0x4(%esp)
 91f:	8b 45 08             	mov    0x8(%ebp),%eax
 922:	89 04 24             	mov    %eax,(%esp)
 925:	e8 bb fe ff ff       	call   7e5 <putc>
 92a:	e9 30 01 00 00       	jmp    a5f <printf+0x19a>
      }
    } else if(state == '%'){
 92f:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 933:	0f 85 26 01 00 00    	jne    a5f <printf+0x19a>
      if(c == 'd'){
 939:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 93d:	75 2d                	jne    96c <printf+0xa7>
        printint(fd, *ap, 10, 1);
 93f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 942:	8b 00                	mov    (%eax),%eax
 944:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 94b:	00 
 94c:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 953:	00 
 954:	89 44 24 04          	mov    %eax,0x4(%esp)
 958:	8b 45 08             	mov    0x8(%ebp),%eax
 95b:	89 04 24             	mov    %eax,(%esp)
 95e:	e8 aa fe ff ff       	call   80d <printint>
        ap++;
 963:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 967:	e9 ec 00 00 00       	jmp    a58 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 96c:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 970:	74 06                	je     978 <printf+0xb3>
 972:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 976:	75 2d                	jne    9a5 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 978:	8b 45 e8             	mov    -0x18(%ebp),%eax
 97b:	8b 00                	mov    (%eax),%eax
 97d:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 984:	00 
 985:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 98c:	00 
 98d:	89 44 24 04          	mov    %eax,0x4(%esp)
 991:	8b 45 08             	mov    0x8(%ebp),%eax
 994:	89 04 24             	mov    %eax,(%esp)
 997:	e8 71 fe ff ff       	call   80d <printint>
        ap++;
 99c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 9a0:	e9 b3 00 00 00       	jmp    a58 <printf+0x193>
      } else if(c == 's'){
 9a5:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 9a9:	75 45                	jne    9f0 <printf+0x12b>
        s = (char*)*ap;
 9ab:	8b 45 e8             	mov    -0x18(%ebp),%eax
 9ae:	8b 00                	mov    (%eax),%eax
 9b0:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 9b3:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 9b7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 9bb:	75 09                	jne    9c6 <printf+0x101>
          s = "(null)";
 9bd:	c7 45 f4 f0 0c 00 00 	movl   $0xcf0,-0xc(%ebp)
        while(*s != 0){
 9c4:	eb 1e                	jmp    9e4 <printf+0x11f>
 9c6:	eb 1c                	jmp    9e4 <printf+0x11f>
          putc(fd, *s);
 9c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9cb:	0f b6 00             	movzbl (%eax),%eax
 9ce:	0f be c0             	movsbl %al,%eax
 9d1:	89 44 24 04          	mov    %eax,0x4(%esp)
 9d5:	8b 45 08             	mov    0x8(%ebp),%eax
 9d8:	89 04 24             	mov    %eax,(%esp)
 9db:	e8 05 fe ff ff       	call   7e5 <putc>
          s++;
 9e0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 9e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9e7:	0f b6 00             	movzbl (%eax),%eax
 9ea:	84 c0                	test   %al,%al
 9ec:	75 da                	jne    9c8 <printf+0x103>
 9ee:	eb 68                	jmp    a58 <printf+0x193>
        }
      } else if(c == 'c'){
 9f0:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 9f4:	75 1d                	jne    a13 <printf+0x14e>
        putc(fd, *ap);
 9f6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 9f9:	8b 00                	mov    (%eax),%eax
 9fb:	0f be c0             	movsbl %al,%eax
 9fe:	89 44 24 04          	mov    %eax,0x4(%esp)
 a02:	8b 45 08             	mov    0x8(%ebp),%eax
 a05:	89 04 24             	mov    %eax,(%esp)
 a08:	e8 d8 fd ff ff       	call   7e5 <putc>
        ap++;
 a0d:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 a11:	eb 45                	jmp    a58 <printf+0x193>
      } else if(c == '%'){
 a13:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 a17:	75 17                	jne    a30 <printf+0x16b>
        putc(fd, c);
 a19:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 a1c:	0f be c0             	movsbl %al,%eax
 a1f:	89 44 24 04          	mov    %eax,0x4(%esp)
 a23:	8b 45 08             	mov    0x8(%ebp),%eax
 a26:	89 04 24             	mov    %eax,(%esp)
 a29:	e8 b7 fd ff ff       	call   7e5 <putc>
 a2e:	eb 28                	jmp    a58 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 a30:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 a37:	00 
 a38:	8b 45 08             	mov    0x8(%ebp),%eax
 a3b:	89 04 24             	mov    %eax,(%esp)
 a3e:	e8 a2 fd ff ff       	call   7e5 <putc>
        putc(fd, c);
 a43:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 a46:	0f be c0             	movsbl %al,%eax
 a49:	89 44 24 04          	mov    %eax,0x4(%esp)
 a4d:	8b 45 08             	mov    0x8(%ebp),%eax
 a50:	89 04 24             	mov    %eax,(%esp)
 a53:	e8 8d fd ff ff       	call   7e5 <putc>
      }
      state = 0;
 a58:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 a5f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 a63:	8b 55 0c             	mov    0xc(%ebp),%edx
 a66:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a69:	01 d0                	add    %edx,%eax
 a6b:	0f b6 00             	movzbl (%eax),%eax
 a6e:	84 c0                	test   %al,%al
 a70:	0f 85 71 fe ff ff    	jne    8e7 <printf+0x22>
    }
  }
}
 a76:	c9                   	leave  
 a77:	c3                   	ret    

00000a78 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 a78:	55                   	push   %ebp
 a79:	89 e5                	mov    %esp,%ebp
 a7b:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 a7e:	8b 45 08             	mov    0x8(%ebp),%eax
 a81:	83 e8 08             	sub    $0x8,%eax
 a84:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a87:	a1 08 10 00 00       	mov    0x1008,%eax
 a8c:	89 45 fc             	mov    %eax,-0x4(%ebp)
 a8f:	eb 24                	jmp    ab5 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a91:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a94:	8b 00                	mov    (%eax),%eax
 a96:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 a99:	77 12                	ja     aad <free+0x35>
 a9b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a9e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 aa1:	77 24                	ja     ac7 <free+0x4f>
 aa3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 aa6:	8b 00                	mov    (%eax),%eax
 aa8:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 aab:	77 1a                	ja     ac7 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 aad:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ab0:	8b 00                	mov    (%eax),%eax
 ab2:	89 45 fc             	mov    %eax,-0x4(%ebp)
 ab5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 ab8:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 abb:	76 d4                	jbe    a91 <free+0x19>
 abd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ac0:	8b 00                	mov    (%eax),%eax
 ac2:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 ac5:	76 ca                	jbe    a91 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 ac7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 aca:	8b 40 04             	mov    0x4(%eax),%eax
 acd:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 ad4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 ad7:	01 c2                	add    %eax,%edx
 ad9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 adc:	8b 00                	mov    (%eax),%eax
 ade:	39 c2                	cmp    %eax,%edx
 ae0:	75 24                	jne    b06 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 ae2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 ae5:	8b 50 04             	mov    0x4(%eax),%edx
 ae8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 aeb:	8b 00                	mov    (%eax),%eax
 aed:	8b 40 04             	mov    0x4(%eax),%eax
 af0:	01 c2                	add    %eax,%edx
 af2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 af5:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 af8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 afb:	8b 00                	mov    (%eax),%eax
 afd:	8b 10                	mov    (%eax),%edx
 aff:	8b 45 f8             	mov    -0x8(%ebp),%eax
 b02:	89 10                	mov    %edx,(%eax)
 b04:	eb 0a                	jmp    b10 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 b06:	8b 45 fc             	mov    -0x4(%ebp),%eax
 b09:	8b 10                	mov    (%eax),%edx
 b0b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 b0e:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 b10:	8b 45 fc             	mov    -0x4(%ebp),%eax
 b13:	8b 40 04             	mov    0x4(%eax),%eax
 b16:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 b1d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 b20:	01 d0                	add    %edx,%eax
 b22:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 b25:	75 20                	jne    b47 <free+0xcf>
    p->s.size += bp->s.size;
 b27:	8b 45 fc             	mov    -0x4(%ebp),%eax
 b2a:	8b 50 04             	mov    0x4(%eax),%edx
 b2d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 b30:	8b 40 04             	mov    0x4(%eax),%eax
 b33:	01 c2                	add    %eax,%edx
 b35:	8b 45 fc             	mov    -0x4(%ebp),%eax
 b38:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 b3b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 b3e:	8b 10                	mov    (%eax),%edx
 b40:	8b 45 fc             	mov    -0x4(%ebp),%eax
 b43:	89 10                	mov    %edx,(%eax)
 b45:	eb 08                	jmp    b4f <free+0xd7>
  } else
    p->s.ptr = bp;
 b47:	8b 45 fc             	mov    -0x4(%ebp),%eax
 b4a:	8b 55 f8             	mov    -0x8(%ebp),%edx
 b4d:	89 10                	mov    %edx,(%eax)
  freep = p;
 b4f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 b52:	a3 08 10 00 00       	mov    %eax,0x1008
}
 b57:	c9                   	leave  
 b58:	c3                   	ret    

00000b59 <morecore>:

static Header*
morecore(uint nu)
{
 b59:	55                   	push   %ebp
 b5a:	89 e5                	mov    %esp,%ebp
 b5c:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 b5f:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 b66:	77 07                	ja     b6f <morecore+0x16>
    nu = 4096;
 b68:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 b6f:	8b 45 08             	mov    0x8(%ebp),%eax
 b72:	c1 e0 03             	shl    $0x3,%eax
 b75:	89 04 24             	mov    %eax,(%esp)
 b78:	e8 40 fc ff ff       	call   7bd <sbrk>
 b7d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 b80:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 b84:	75 07                	jne    b8d <morecore+0x34>
    return 0;
 b86:	b8 00 00 00 00       	mov    $0x0,%eax
 b8b:	eb 22                	jmp    baf <morecore+0x56>
  hp = (Header*)p;
 b8d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b90:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 b93:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b96:	8b 55 08             	mov    0x8(%ebp),%edx
 b99:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 b9c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b9f:	83 c0 08             	add    $0x8,%eax
 ba2:	89 04 24             	mov    %eax,(%esp)
 ba5:	e8 ce fe ff ff       	call   a78 <free>
  return freep;
 baa:	a1 08 10 00 00       	mov    0x1008,%eax
}
 baf:	c9                   	leave  
 bb0:	c3                   	ret    

00000bb1 <malloc>:

void*
malloc(uint nbytes)
{
 bb1:	55                   	push   %ebp
 bb2:	89 e5                	mov    %esp,%ebp
 bb4:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 bb7:	8b 45 08             	mov    0x8(%ebp),%eax
 bba:	83 c0 07             	add    $0x7,%eax
 bbd:	c1 e8 03             	shr    $0x3,%eax
 bc0:	83 c0 01             	add    $0x1,%eax
 bc3:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 bc6:	a1 08 10 00 00       	mov    0x1008,%eax
 bcb:	89 45 f0             	mov    %eax,-0x10(%ebp)
 bce:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 bd2:	75 23                	jne    bf7 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 bd4:	c7 45 f0 00 10 00 00 	movl   $0x1000,-0x10(%ebp)
 bdb:	8b 45 f0             	mov    -0x10(%ebp),%eax
 bde:	a3 08 10 00 00       	mov    %eax,0x1008
 be3:	a1 08 10 00 00       	mov    0x1008,%eax
 be8:	a3 00 10 00 00       	mov    %eax,0x1000
    base.s.size = 0;
 bed:	c7 05 04 10 00 00 00 	movl   $0x0,0x1004
 bf4:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 bf7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 bfa:	8b 00                	mov    (%eax),%eax
 bfc:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 bff:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c02:	8b 40 04             	mov    0x4(%eax),%eax
 c05:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 c08:	72 4d                	jb     c57 <malloc+0xa6>
      if(p->s.size == nunits)
 c0a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c0d:	8b 40 04             	mov    0x4(%eax),%eax
 c10:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 c13:	75 0c                	jne    c21 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 c15:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c18:	8b 10                	mov    (%eax),%edx
 c1a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 c1d:	89 10                	mov    %edx,(%eax)
 c1f:	eb 26                	jmp    c47 <malloc+0x96>
      else {
        p->s.size -= nunits;
 c21:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c24:	8b 40 04             	mov    0x4(%eax),%eax
 c27:	2b 45 ec             	sub    -0x14(%ebp),%eax
 c2a:	89 c2                	mov    %eax,%edx
 c2c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c2f:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 c32:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c35:	8b 40 04             	mov    0x4(%eax),%eax
 c38:	c1 e0 03             	shl    $0x3,%eax
 c3b:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 c3e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c41:	8b 55 ec             	mov    -0x14(%ebp),%edx
 c44:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 c47:	8b 45 f0             	mov    -0x10(%ebp),%eax
 c4a:	a3 08 10 00 00       	mov    %eax,0x1008
      return (void*)(p + 1);
 c4f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c52:	83 c0 08             	add    $0x8,%eax
 c55:	eb 38                	jmp    c8f <malloc+0xde>
    }
    if(p == freep)
 c57:	a1 08 10 00 00       	mov    0x1008,%eax
 c5c:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 c5f:	75 1b                	jne    c7c <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 c61:	8b 45 ec             	mov    -0x14(%ebp),%eax
 c64:	89 04 24             	mov    %eax,(%esp)
 c67:	e8 ed fe ff ff       	call   b59 <morecore>
 c6c:	89 45 f4             	mov    %eax,-0xc(%ebp)
 c6f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 c73:	75 07                	jne    c7c <malloc+0xcb>
        return 0;
 c75:	b8 00 00 00 00       	mov    $0x0,%eax
 c7a:	eb 13                	jmp    c8f <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c7c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c7f:	89 45 f0             	mov    %eax,-0x10(%ebp)
 c82:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c85:	8b 00                	mov    (%eax),%eax
 c87:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 c8a:	e9 70 ff ff ff       	jmp    bff <malloc+0x4e>
}
 c8f:	c9                   	leave  
 c90:	c3                   	ret    
