
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
  1b:	05 80 0e 00 00       	add    $0xe80,%eax
  20:	c6 00 00             	movb   $0x0,(%eax)
    p = buf;
  23:	c7 45 f0 80 0e 00 00 	movl   $0xe80,-0x10(%ebp)
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
  6f:	e8 79 05 00 00       	call   5ed <write>
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
  8b:	e8 b4 03 00 00       	call   444 <strchr>
  90:	89 45 e8             	mov    %eax,-0x18(%ebp)
  93:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  97:	75 93                	jne    2c <grep+0x2c>
    }
    if(p == buf)
  99:	81 7d f0 80 0e 00 00 	cmpl   $0xe80,-0x10(%ebp)
  a0:	75 07                	jne    a9 <grep+0xa9>
      m = 0;
  a2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if(m > 0){
  a9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  ad:	7e 29                	jle    d8 <grep+0xd8>
      m -= p - buf;
  af:	ba 80 0e 00 00       	mov    $0xe80,%edx
  b4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  b7:	29 c2                	sub    %eax,%edx
  b9:	89 d0                	mov    %edx,%eax
  bb:	01 45 f4             	add    %eax,-0xc(%ebp)
      memmove(buf, p, m);
  be:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c1:	89 44 24 08          	mov    %eax,0x8(%esp)
  c5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c8:	89 44 24 04          	mov    %eax,0x4(%esp)
  cc:	c7 04 24 80 0e 00 00 	movl   $0xe80,(%esp)
  d3:	e8 b0 04 00 00       	call   588 <memmove>
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
  d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  db:	ba ff 03 00 00       	mov    $0x3ff,%edx
  e0:	29 c2                	sub    %eax,%edx
  e2:	89 d0                	mov    %edx,%eax
  e4:	8b 55 f4             	mov    -0xc(%ebp),%edx
  e7:	81 c2 80 0e 00 00    	add    $0xe80,%edx
  ed:	89 44 24 08          	mov    %eax,0x8(%esp)
  f1:	89 54 24 04          	mov    %edx,0x4(%esp)
  f5:	8b 45 0c             	mov    0xc(%ebp),%eax
  f8:	89 04 24             	mov    %eax,(%esp)
  fb:	e8 e5 04 00 00       	call   5e5 <read>
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
 11e:	c7 44 24 04 24 0b 00 	movl   $0xb24,0x4(%esp)
 125:	00 
 126:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 12d:	e8 23 06 00 00       	call   755 <printf>
    exit();
 132:	e8 96 04 00 00       	call   5cd <exit>
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
 15b:	e8 6d 04 00 00       	call   5cd <exit>
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
 18a:	e8 7e 04 00 00       	call   60d <open>
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
 1b0:	c7 44 24 04 44 0b 00 	movl   $0xb44,0x4(%esp)
 1b7:	00 
 1b8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1bf:	e8 91 05 00 00       	call   755 <printf>
      exit();
 1c4:	e8 04 04 00 00       	call   5cd <exit>
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
 1e4:	e8 0c 04 00 00       	call   5f5 <close>
  for(i = 2; i < argc; i++){
 1e9:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
 1ee:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 1f2:	3b 45 08             	cmp    0x8(%ebp),%eax
 1f5:	0f 8c 72 ff ff ff    	jl     16d <main+0x5e>
  }
  exit();
 1fb:	e8 cd 03 00 00       	call   5cd <exit>

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
#include "stat.h"
#include "fcntl.h"
#include "user.h"
#include "x86.h"

void ps(){
 385:	55                   	push   %ebp
 386:	89 e5                	mov    %esp,%ebp
  
 //  pstatTable * pst = getpinfo
}
 388:	5d                   	pop    %ebp
 389:	c3                   	ret    

0000038a <strcpy>:

char*
strcpy(char *s, const char *t)
{
 38a:	55                   	push   %ebp
 38b:	89 e5                	mov    %esp,%ebp
 38d:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 390:	8b 45 08             	mov    0x8(%ebp),%eax
 393:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 396:	90                   	nop
 397:	8b 45 08             	mov    0x8(%ebp),%eax
 39a:	8d 50 01             	lea    0x1(%eax),%edx
 39d:	89 55 08             	mov    %edx,0x8(%ebp)
 3a0:	8b 55 0c             	mov    0xc(%ebp),%edx
 3a3:	8d 4a 01             	lea    0x1(%edx),%ecx
 3a6:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 3a9:	0f b6 12             	movzbl (%edx),%edx
 3ac:	88 10                	mov    %dl,(%eax)
 3ae:	0f b6 00             	movzbl (%eax),%eax
 3b1:	84 c0                	test   %al,%al
 3b3:	75 e2                	jne    397 <strcpy+0xd>
    ;
  return os;
 3b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3b8:	c9                   	leave  
 3b9:	c3                   	ret    

000003ba <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3ba:	55                   	push   %ebp
 3bb:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 3bd:	eb 08                	jmp    3c7 <strcmp+0xd>
    p++, q++;
 3bf:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 3c3:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 3c7:	8b 45 08             	mov    0x8(%ebp),%eax
 3ca:	0f b6 00             	movzbl (%eax),%eax
 3cd:	84 c0                	test   %al,%al
 3cf:	74 10                	je     3e1 <strcmp+0x27>
 3d1:	8b 45 08             	mov    0x8(%ebp),%eax
 3d4:	0f b6 10             	movzbl (%eax),%edx
 3d7:	8b 45 0c             	mov    0xc(%ebp),%eax
 3da:	0f b6 00             	movzbl (%eax),%eax
 3dd:	38 c2                	cmp    %al,%dl
 3df:	74 de                	je     3bf <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 3e1:	8b 45 08             	mov    0x8(%ebp),%eax
 3e4:	0f b6 00             	movzbl (%eax),%eax
 3e7:	0f b6 d0             	movzbl %al,%edx
 3ea:	8b 45 0c             	mov    0xc(%ebp),%eax
 3ed:	0f b6 00             	movzbl (%eax),%eax
 3f0:	0f b6 c0             	movzbl %al,%eax
 3f3:	29 c2                	sub    %eax,%edx
 3f5:	89 d0                	mov    %edx,%eax
}
 3f7:	5d                   	pop    %ebp
 3f8:	c3                   	ret    

000003f9 <strlen>:

uint
strlen(const char *s)
{
 3f9:	55                   	push   %ebp
 3fa:	89 e5                	mov    %esp,%ebp
 3fc:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 3ff:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 406:	eb 04                	jmp    40c <strlen+0x13>
 408:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 40c:	8b 55 fc             	mov    -0x4(%ebp),%edx
 40f:	8b 45 08             	mov    0x8(%ebp),%eax
 412:	01 d0                	add    %edx,%eax
 414:	0f b6 00             	movzbl (%eax),%eax
 417:	84 c0                	test   %al,%al
 419:	75 ed                	jne    408 <strlen+0xf>
    ;
  return n;
 41b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 41e:	c9                   	leave  
 41f:	c3                   	ret    

00000420 <memset>:

void*
memset(void *dst, int c, uint n)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 426:	8b 45 10             	mov    0x10(%ebp),%eax
 429:	89 44 24 08          	mov    %eax,0x8(%esp)
 42d:	8b 45 0c             	mov    0xc(%ebp),%eax
 430:	89 44 24 04          	mov    %eax,0x4(%esp)
 434:	8b 45 08             	mov    0x8(%ebp),%eax
 437:	89 04 24             	mov    %eax,(%esp)
 43a:	e8 21 ff ff ff       	call   360 <stosb>
  return dst;
 43f:	8b 45 08             	mov    0x8(%ebp),%eax
}
 442:	c9                   	leave  
 443:	c3                   	ret    

00000444 <strchr>:

char*
strchr(const char *s, char c)
{
 444:	55                   	push   %ebp
 445:	89 e5                	mov    %esp,%ebp
 447:	83 ec 04             	sub    $0x4,%esp
 44a:	8b 45 0c             	mov    0xc(%ebp),%eax
 44d:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 450:	eb 14                	jmp    466 <strchr+0x22>
    if(*s == c)
 452:	8b 45 08             	mov    0x8(%ebp),%eax
 455:	0f b6 00             	movzbl (%eax),%eax
 458:	3a 45 fc             	cmp    -0x4(%ebp),%al
 45b:	75 05                	jne    462 <strchr+0x1e>
      return (char*)s;
 45d:	8b 45 08             	mov    0x8(%ebp),%eax
 460:	eb 13                	jmp    475 <strchr+0x31>
  for(; *s; s++)
 462:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 466:	8b 45 08             	mov    0x8(%ebp),%eax
 469:	0f b6 00             	movzbl (%eax),%eax
 46c:	84 c0                	test   %al,%al
 46e:	75 e2                	jne    452 <strchr+0xe>
  return 0;
 470:	b8 00 00 00 00       	mov    $0x0,%eax
}
 475:	c9                   	leave  
 476:	c3                   	ret    

00000477 <gets>:

char*
gets(char *buf, int max)
{
 477:	55                   	push   %ebp
 478:	89 e5                	mov    %esp,%ebp
 47a:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 47d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 484:	eb 4c                	jmp    4d2 <gets+0x5b>
    cc = read(0, &c, 1);
 486:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 48d:	00 
 48e:	8d 45 ef             	lea    -0x11(%ebp),%eax
 491:	89 44 24 04          	mov    %eax,0x4(%esp)
 495:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 49c:	e8 44 01 00 00       	call   5e5 <read>
 4a1:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 4a4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4a8:	7f 02                	jg     4ac <gets+0x35>
      break;
 4aa:	eb 31                	jmp    4dd <gets+0x66>
    buf[i++] = c;
 4ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4af:	8d 50 01             	lea    0x1(%eax),%edx
 4b2:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4b5:	89 c2                	mov    %eax,%edx
 4b7:	8b 45 08             	mov    0x8(%ebp),%eax
 4ba:	01 c2                	add    %eax,%edx
 4bc:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4c0:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 4c2:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4c6:	3c 0a                	cmp    $0xa,%al
 4c8:	74 13                	je     4dd <gets+0x66>
 4ca:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4ce:	3c 0d                	cmp    $0xd,%al
 4d0:	74 0b                	je     4dd <gets+0x66>
  for(i=0; i+1 < max; ){
 4d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4d5:	83 c0 01             	add    $0x1,%eax
 4d8:	3b 45 0c             	cmp    0xc(%ebp),%eax
 4db:	7c a9                	jl     486 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 4dd:	8b 55 f4             	mov    -0xc(%ebp),%edx
 4e0:	8b 45 08             	mov    0x8(%ebp),%eax
 4e3:	01 d0                	add    %edx,%eax
 4e5:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 4e8:	8b 45 08             	mov    0x8(%ebp),%eax
}
 4eb:	c9                   	leave  
 4ec:	c3                   	ret    

000004ed <stat>:

int
stat(const char *n, struct stat *st)
{
 4ed:	55                   	push   %ebp
 4ee:	89 e5                	mov    %esp,%ebp
 4f0:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4f3:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 4fa:	00 
 4fb:	8b 45 08             	mov    0x8(%ebp),%eax
 4fe:	89 04 24             	mov    %eax,(%esp)
 501:	e8 07 01 00 00       	call   60d <open>
 506:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 509:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 50d:	79 07                	jns    516 <stat+0x29>
    return -1;
 50f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 514:	eb 23                	jmp    539 <stat+0x4c>
  r = fstat(fd, st);
 516:	8b 45 0c             	mov    0xc(%ebp),%eax
 519:	89 44 24 04          	mov    %eax,0x4(%esp)
 51d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 520:	89 04 24             	mov    %eax,(%esp)
 523:	e8 fd 00 00 00       	call   625 <fstat>
 528:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 52b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 52e:	89 04 24             	mov    %eax,(%esp)
 531:	e8 bf 00 00 00       	call   5f5 <close>
  return r;
 536:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 539:	c9                   	leave  
 53a:	c3                   	ret    

0000053b <atoi>:

int
atoi(const char *s)
{
 53b:	55                   	push   %ebp
 53c:	89 e5                	mov    %esp,%ebp
 53e:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 541:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 548:	eb 25                	jmp    56f <atoi+0x34>
    n = n*10 + *s++ - '0';
 54a:	8b 55 fc             	mov    -0x4(%ebp),%edx
 54d:	89 d0                	mov    %edx,%eax
 54f:	c1 e0 02             	shl    $0x2,%eax
 552:	01 d0                	add    %edx,%eax
 554:	01 c0                	add    %eax,%eax
 556:	89 c1                	mov    %eax,%ecx
 558:	8b 45 08             	mov    0x8(%ebp),%eax
 55b:	8d 50 01             	lea    0x1(%eax),%edx
 55e:	89 55 08             	mov    %edx,0x8(%ebp)
 561:	0f b6 00             	movzbl (%eax),%eax
 564:	0f be c0             	movsbl %al,%eax
 567:	01 c8                	add    %ecx,%eax
 569:	83 e8 30             	sub    $0x30,%eax
 56c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 56f:	8b 45 08             	mov    0x8(%ebp),%eax
 572:	0f b6 00             	movzbl (%eax),%eax
 575:	3c 2f                	cmp    $0x2f,%al
 577:	7e 0a                	jle    583 <atoi+0x48>
 579:	8b 45 08             	mov    0x8(%ebp),%eax
 57c:	0f b6 00             	movzbl (%eax),%eax
 57f:	3c 39                	cmp    $0x39,%al
 581:	7e c7                	jle    54a <atoi+0xf>
  return n;
 583:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 586:	c9                   	leave  
 587:	c3                   	ret    

00000588 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 588:	55                   	push   %ebp
 589:	89 e5                	mov    %esp,%ebp
 58b:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 58e:	8b 45 08             	mov    0x8(%ebp),%eax
 591:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 594:	8b 45 0c             	mov    0xc(%ebp),%eax
 597:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 59a:	eb 17                	jmp    5b3 <memmove+0x2b>
    *dst++ = *src++;
 59c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 59f:	8d 50 01             	lea    0x1(%eax),%edx
 5a2:	89 55 fc             	mov    %edx,-0x4(%ebp)
 5a5:	8b 55 f8             	mov    -0x8(%ebp),%edx
 5a8:	8d 4a 01             	lea    0x1(%edx),%ecx
 5ab:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 5ae:	0f b6 12             	movzbl (%edx),%edx
 5b1:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 5b3:	8b 45 10             	mov    0x10(%ebp),%eax
 5b6:	8d 50 ff             	lea    -0x1(%eax),%edx
 5b9:	89 55 10             	mov    %edx,0x10(%ebp)
 5bc:	85 c0                	test   %eax,%eax
 5be:	7f dc                	jg     59c <memmove+0x14>
  return vdst;
 5c0:	8b 45 08             	mov    0x8(%ebp),%eax
}
 5c3:	c9                   	leave  
 5c4:	c3                   	ret    

000005c5 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5c5:	b8 01 00 00 00       	mov    $0x1,%eax
 5ca:	cd 40                	int    $0x40
 5cc:	c3                   	ret    

000005cd <exit>:
SYSCALL(exit)
 5cd:	b8 02 00 00 00       	mov    $0x2,%eax
 5d2:	cd 40                	int    $0x40
 5d4:	c3                   	ret    

000005d5 <wait>:
SYSCALL(wait)
 5d5:	b8 03 00 00 00       	mov    $0x3,%eax
 5da:	cd 40                	int    $0x40
 5dc:	c3                   	ret    

000005dd <pipe>:
SYSCALL(pipe)
 5dd:	b8 04 00 00 00       	mov    $0x4,%eax
 5e2:	cd 40                	int    $0x40
 5e4:	c3                   	ret    

000005e5 <read>:
SYSCALL(read)
 5e5:	b8 05 00 00 00       	mov    $0x5,%eax
 5ea:	cd 40                	int    $0x40
 5ec:	c3                   	ret    

000005ed <write>:
SYSCALL(write)
 5ed:	b8 10 00 00 00       	mov    $0x10,%eax
 5f2:	cd 40                	int    $0x40
 5f4:	c3                   	ret    

000005f5 <close>:
SYSCALL(close)
 5f5:	b8 15 00 00 00       	mov    $0x15,%eax
 5fa:	cd 40                	int    $0x40
 5fc:	c3                   	ret    

000005fd <kill>:
SYSCALL(kill)
 5fd:	b8 06 00 00 00       	mov    $0x6,%eax
 602:	cd 40                	int    $0x40
 604:	c3                   	ret    

00000605 <exec>:
SYSCALL(exec)
 605:	b8 07 00 00 00       	mov    $0x7,%eax
 60a:	cd 40                	int    $0x40
 60c:	c3                   	ret    

0000060d <open>:
SYSCALL(open)
 60d:	b8 0f 00 00 00       	mov    $0xf,%eax
 612:	cd 40                	int    $0x40
 614:	c3                   	ret    

00000615 <mknod>:
SYSCALL(mknod)
 615:	b8 11 00 00 00       	mov    $0x11,%eax
 61a:	cd 40                	int    $0x40
 61c:	c3                   	ret    

0000061d <unlink>:
SYSCALL(unlink)
 61d:	b8 12 00 00 00       	mov    $0x12,%eax
 622:	cd 40                	int    $0x40
 624:	c3                   	ret    

00000625 <fstat>:
SYSCALL(fstat)
 625:	b8 08 00 00 00       	mov    $0x8,%eax
 62a:	cd 40                	int    $0x40
 62c:	c3                   	ret    

0000062d <link>:
SYSCALL(link)
 62d:	b8 13 00 00 00       	mov    $0x13,%eax
 632:	cd 40                	int    $0x40
 634:	c3                   	ret    

00000635 <mkdir>:
SYSCALL(mkdir)
 635:	b8 14 00 00 00       	mov    $0x14,%eax
 63a:	cd 40                	int    $0x40
 63c:	c3                   	ret    

0000063d <chdir>:
SYSCALL(chdir)
 63d:	b8 09 00 00 00       	mov    $0x9,%eax
 642:	cd 40                	int    $0x40
 644:	c3                   	ret    

00000645 <dup>:
SYSCALL(dup)
 645:	b8 0a 00 00 00       	mov    $0xa,%eax
 64a:	cd 40                	int    $0x40
 64c:	c3                   	ret    

0000064d <getpid>:
SYSCALL(getpid)
 64d:	b8 0b 00 00 00       	mov    $0xb,%eax
 652:	cd 40                	int    $0x40
 654:	c3                   	ret    

00000655 <sbrk>:
SYSCALL(sbrk)
 655:	b8 0c 00 00 00       	mov    $0xc,%eax
 65a:	cd 40                	int    $0x40
 65c:	c3                   	ret    

0000065d <sleep>:
SYSCALL(sleep)
 65d:	b8 0d 00 00 00       	mov    $0xd,%eax
 662:	cd 40                	int    $0x40
 664:	c3                   	ret    

00000665 <uptime>:
SYSCALL(uptime)
 665:	b8 0e 00 00 00       	mov    $0xe,%eax
 66a:	cd 40                	int    $0x40
 66c:	c3                   	ret    

0000066d <getpinfo>:
SYSCALL(getpinfo)
 66d:	b8 16 00 00 00       	mov    $0x16,%eax
 672:	cd 40                	int    $0x40
 674:	c3                   	ret    

00000675 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 675:	55                   	push   %ebp
 676:	89 e5                	mov    %esp,%ebp
 678:	83 ec 18             	sub    $0x18,%esp
 67b:	8b 45 0c             	mov    0xc(%ebp),%eax
 67e:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 681:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 688:	00 
 689:	8d 45 f4             	lea    -0xc(%ebp),%eax
 68c:	89 44 24 04          	mov    %eax,0x4(%esp)
 690:	8b 45 08             	mov    0x8(%ebp),%eax
 693:	89 04 24             	mov    %eax,(%esp)
 696:	e8 52 ff ff ff       	call   5ed <write>
}
 69b:	c9                   	leave  
 69c:	c3                   	ret    

0000069d <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 69d:	55                   	push   %ebp
 69e:	89 e5                	mov    %esp,%ebp
 6a0:	56                   	push   %esi
 6a1:	53                   	push   %ebx
 6a2:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 6a5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 6ac:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 6b0:	74 17                	je     6c9 <printint+0x2c>
 6b2:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 6b6:	79 11                	jns    6c9 <printint+0x2c>
    neg = 1;
 6b8:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 6bf:	8b 45 0c             	mov    0xc(%ebp),%eax
 6c2:	f7 d8                	neg    %eax
 6c4:	89 45 ec             	mov    %eax,-0x14(%ebp)
 6c7:	eb 06                	jmp    6cf <printint+0x32>
  } else {
    x = xx;
 6c9:	8b 45 0c             	mov    0xc(%ebp),%eax
 6cc:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 6cf:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 6d6:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 6d9:	8d 41 01             	lea    0x1(%ecx),%eax
 6dc:	89 45 f4             	mov    %eax,-0xc(%ebp)
 6df:	8b 5d 10             	mov    0x10(%ebp),%ebx
 6e2:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6e5:	ba 00 00 00 00       	mov    $0x0,%edx
 6ea:	f7 f3                	div    %ebx
 6ec:	89 d0                	mov    %edx,%eax
 6ee:	0f b6 80 48 0e 00 00 	movzbl 0xe48(%eax),%eax
 6f5:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 6f9:	8b 75 10             	mov    0x10(%ebp),%esi
 6fc:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6ff:	ba 00 00 00 00       	mov    $0x0,%edx
 704:	f7 f6                	div    %esi
 706:	89 45 ec             	mov    %eax,-0x14(%ebp)
 709:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 70d:	75 c7                	jne    6d6 <printint+0x39>
  if(neg)
 70f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 713:	74 10                	je     725 <printint+0x88>
    buf[i++] = '-';
 715:	8b 45 f4             	mov    -0xc(%ebp),%eax
 718:	8d 50 01             	lea    0x1(%eax),%edx
 71b:	89 55 f4             	mov    %edx,-0xc(%ebp)
 71e:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 723:	eb 1f                	jmp    744 <printint+0xa7>
 725:	eb 1d                	jmp    744 <printint+0xa7>
    putc(fd, buf[i]);
 727:	8d 55 dc             	lea    -0x24(%ebp),%edx
 72a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 72d:	01 d0                	add    %edx,%eax
 72f:	0f b6 00             	movzbl (%eax),%eax
 732:	0f be c0             	movsbl %al,%eax
 735:	89 44 24 04          	mov    %eax,0x4(%esp)
 739:	8b 45 08             	mov    0x8(%ebp),%eax
 73c:	89 04 24             	mov    %eax,(%esp)
 73f:	e8 31 ff ff ff       	call   675 <putc>
  while(--i >= 0)
 744:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 748:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 74c:	79 d9                	jns    727 <printint+0x8a>
}
 74e:	83 c4 30             	add    $0x30,%esp
 751:	5b                   	pop    %ebx
 752:	5e                   	pop    %esi
 753:	5d                   	pop    %ebp
 754:	c3                   	ret    

00000755 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 755:	55                   	push   %ebp
 756:	89 e5                	mov    %esp,%ebp
 758:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 75b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 762:	8d 45 0c             	lea    0xc(%ebp),%eax
 765:	83 c0 04             	add    $0x4,%eax
 768:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 76b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 772:	e9 7c 01 00 00       	jmp    8f3 <printf+0x19e>
    c = fmt[i] & 0xff;
 777:	8b 55 0c             	mov    0xc(%ebp),%edx
 77a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 77d:	01 d0                	add    %edx,%eax
 77f:	0f b6 00             	movzbl (%eax),%eax
 782:	0f be c0             	movsbl %al,%eax
 785:	25 ff 00 00 00       	and    $0xff,%eax
 78a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 78d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 791:	75 2c                	jne    7bf <printf+0x6a>
      if(c == '%'){
 793:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 797:	75 0c                	jne    7a5 <printf+0x50>
        state = '%';
 799:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 7a0:	e9 4a 01 00 00       	jmp    8ef <printf+0x19a>
      } else {
        putc(fd, c);
 7a5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7a8:	0f be c0             	movsbl %al,%eax
 7ab:	89 44 24 04          	mov    %eax,0x4(%esp)
 7af:	8b 45 08             	mov    0x8(%ebp),%eax
 7b2:	89 04 24             	mov    %eax,(%esp)
 7b5:	e8 bb fe ff ff       	call   675 <putc>
 7ba:	e9 30 01 00 00       	jmp    8ef <printf+0x19a>
      }
    } else if(state == '%'){
 7bf:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 7c3:	0f 85 26 01 00 00    	jne    8ef <printf+0x19a>
      if(c == 'd'){
 7c9:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 7cd:	75 2d                	jne    7fc <printf+0xa7>
        printint(fd, *ap, 10, 1);
 7cf:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7d2:	8b 00                	mov    (%eax),%eax
 7d4:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 7db:	00 
 7dc:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 7e3:	00 
 7e4:	89 44 24 04          	mov    %eax,0x4(%esp)
 7e8:	8b 45 08             	mov    0x8(%ebp),%eax
 7eb:	89 04 24             	mov    %eax,(%esp)
 7ee:	e8 aa fe ff ff       	call   69d <printint>
        ap++;
 7f3:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7f7:	e9 ec 00 00 00       	jmp    8e8 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 7fc:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 800:	74 06                	je     808 <printf+0xb3>
 802:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 806:	75 2d                	jne    835 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 808:	8b 45 e8             	mov    -0x18(%ebp),%eax
 80b:	8b 00                	mov    (%eax),%eax
 80d:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 814:	00 
 815:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 81c:	00 
 81d:	89 44 24 04          	mov    %eax,0x4(%esp)
 821:	8b 45 08             	mov    0x8(%ebp),%eax
 824:	89 04 24             	mov    %eax,(%esp)
 827:	e8 71 fe ff ff       	call   69d <printint>
        ap++;
 82c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 830:	e9 b3 00 00 00       	jmp    8e8 <printf+0x193>
      } else if(c == 's'){
 835:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 839:	75 45                	jne    880 <printf+0x12b>
        s = (char*)*ap;
 83b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 83e:	8b 00                	mov    (%eax),%eax
 840:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 843:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 847:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 84b:	75 09                	jne    856 <printf+0x101>
          s = "(null)";
 84d:	c7 45 f4 5a 0b 00 00 	movl   $0xb5a,-0xc(%ebp)
        while(*s != 0){
 854:	eb 1e                	jmp    874 <printf+0x11f>
 856:	eb 1c                	jmp    874 <printf+0x11f>
          putc(fd, *s);
 858:	8b 45 f4             	mov    -0xc(%ebp),%eax
 85b:	0f b6 00             	movzbl (%eax),%eax
 85e:	0f be c0             	movsbl %al,%eax
 861:	89 44 24 04          	mov    %eax,0x4(%esp)
 865:	8b 45 08             	mov    0x8(%ebp),%eax
 868:	89 04 24             	mov    %eax,(%esp)
 86b:	e8 05 fe ff ff       	call   675 <putc>
          s++;
 870:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 874:	8b 45 f4             	mov    -0xc(%ebp),%eax
 877:	0f b6 00             	movzbl (%eax),%eax
 87a:	84 c0                	test   %al,%al
 87c:	75 da                	jne    858 <printf+0x103>
 87e:	eb 68                	jmp    8e8 <printf+0x193>
        }
      } else if(c == 'c'){
 880:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 884:	75 1d                	jne    8a3 <printf+0x14e>
        putc(fd, *ap);
 886:	8b 45 e8             	mov    -0x18(%ebp),%eax
 889:	8b 00                	mov    (%eax),%eax
 88b:	0f be c0             	movsbl %al,%eax
 88e:	89 44 24 04          	mov    %eax,0x4(%esp)
 892:	8b 45 08             	mov    0x8(%ebp),%eax
 895:	89 04 24             	mov    %eax,(%esp)
 898:	e8 d8 fd ff ff       	call   675 <putc>
        ap++;
 89d:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 8a1:	eb 45                	jmp    8e8 <printf+0x193>
      } else if(c == '%'){
 8a3:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 8a7:	75 17                	jne    8c0 <printf+0x16b>
        putc(fd, c);
 8a9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8ac:	0f be c0             	movsbl %al,%eax
 8af:	89 44 24 04          	mov    %eax,0x4(%esp)
 8b3:	8b 45 08             	mov    0x8(%ebp),%eax
 8b6:	89 04 24             	mov    %eax,(%esp)
 8b9:	e8 b7 fd ff ff       	call   675 <putc>
 8be:	eb 28                	jmp    8e8 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 8c0:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 8c7:	00 
 8c8:	8b 45 08             	mov    0x8(%ebp),%eax
 8cb:	89 04 24             	mov    %eax,(%esp)
 8ce:	e8 a2 fd ff ff       	call   675 <putc>
        putc(fd, c);
 8d3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8d6:	0f be c0             	movsbl %al,%eax
 8d9:	89 44 24 04          	mov    %eax,0x4(%esp)
 8dd:	8b 45 08             	mov    0x8(%ebp),%eax
 8e0:	89 04 24             	mov    %eax,(%esp)
 8e3:	e8 8d fd ff ff       	call   675 <putc>
      }
      state = 0;
 8e8:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 8ef:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 8f3:	8b 55 0c             	mov    0xc(%ebp),%edx
 8f6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8f9:	01 d0                	add    %edx,%eax
 8fb:	0f b6 00             	movzbl (%eax),%eax
 8fe:	84 c0                	test   %al,%al
 900:	0f 85 71 fe ff ff    	jne    777 <printf+0x22>
    }
  }
}
 906:	c9                   	leave  
 907:	c3                   	ret    

00000908 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 908:	55                   	push   %ebp
 909:	89 e5                	mov    %esp,%ebp
 90b:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 90e:	8b 45 08             	mov    0x8(%ebp),%eax
 911:	83 e8 08             	sub    $0x8,%eax
 914:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 917:	a1 68 0e 00 00       	mov    0xe68,%eax
 91c:	89 45 fc             	mov    %eax,-0x4(%ebp)
 91f:	eb 24                	jmp    945 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 921:	8b 45 fc             	mov    -0x4(%ebp),%eax
 924:	8b 00                	mov    (%eax),%eax
 926:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 929:	77 12                	ja     93d <free+0x35>
 92b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 92e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 931:	77 24                	ja     957 <free+0x4f>
 933:	8b 45 fc             	mov    -0x4(%ebp),%eax
 936:	8b 00                	mov    (%eax),%eax
 938:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 93b:	77 1a                	ja     957 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 93d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 940:	8b 00                	mov    (%eax),%eax
 942:	89 45 fc             	mov    %eax,-0x4(%ebp)
 945:	8b 45 f8             	mov    -0x8(%ebp),%eax
 948:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 94b:	76 d4                	jbe    921 <free+0x19>
 94d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 950:	8b 00                	mov    (%eax),%eax
 952:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 955:	76 ca                	jbe    921 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 957:	8b 45 f8             	mov    -0x8(%ebp),%eax
 95a:	8b 40 04             	mov    0x4(%eax),%eax
 95d:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 964:	8b 45 f8             	mov    -0x8(%ebp),%eax
 967:	01 c2                	add    %eax,%edx
 969:	8b 45 fc             	mov    -0x4(%ebp),%eax
 96c:	8b 00                	mov    (%eax),%eax
 96e:	39 c2                	cmp    %eax,%edx
 970:	75 24                	jne    996 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 972:	8b 45 f8             	mov    -0x8(%ebp),%eax
 975:	8b 50 04             	mov    0x4(%eax),%edx
 978:	8b 45 fc             	mov    -0x4(%ebp),%eax
 97b:	8b 00                	mov    (%eax),%eax
 97d:	8b 40 04             	mov    0x4(%eax),%eax
 980:	01 c2                	add    %eax,%edx
 982:	8b 45 f8             	mov    -0x8(%ebp),%eax
 985:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 988:	8b 45 fc             	mov    -0x4(%ebp),%eax
 98b:	8b 00                	mov    (%eax),%eax
 98d:	8b 10                	mov    (%eax),%edx
 98f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 992:	89 10                	mov    %edx,(%eax)
 994:	eb 0a                	jmp    9a0 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 996:	8b 45 fc             	mov    -0x4(%ebp),%eax
 999:	8b 10                	mov    (%eax),%edx
 99b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 99e:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 9a0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9a3:	8b 40 04             	mov    0x4(%eax),%eax
 9a6:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 9ad:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9b0:	01 d0                	add    %edx,%eax
 9b2:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 9b5:	75 20                	jne    9d7 <free+0xcf>
    p->s.size += bp->s.size;
 9b7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9ba:	8b 50 04             	mov    0x4(%eax),%edx
 9bd:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9c0:	8b 40 04             	mov    0x4(%eax),%eax
 9c3:	01 c2                	add    %eax,%edx
 9c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9c8:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9cb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9ce:	8b 10                	mov    (%eax),%edx
 9d0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9d3:	89 10                	mov    %edx,(%eax)
 9d5:	eb 08                	jmp    9df <free+0xd7>
  } else
    p->s.ptr = bp;
 9d7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9da:	8b 55 f8             	mov    -0x8(%ebp),%edx
 9dd:	89 10                	mov    %edx,(%eax)
  freep = p;
 9df:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9e2:	a3 68 0e 00 00       	mov    %eax,0xe68
}
 9e7:	c9                   	leave  
 9e8:	c3                   	ret    

000009e9 <morecore>:

static Header*
morecore(uint nu)
{
 9e9:	55                   	push   %ebp
 9ea:	89 e5                	mov    %esp,%ebp
 9ec:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 9ef:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 9f6:	77 07                	ja     9ff <morecore+0x16>
    nu = 4096;
 9f8:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 9ff:	8b 45 08             	mov    0x8(%ebp),%eax
 a02:	c1 e0 03             	shl    $0x3,%eax
 a05:	89 04 24             	mov    %eax,(%esp)
 a08:	e8 48 fc ff ff       	call   655 <sbrk>
 a0d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 a10:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 a14:	75 07                	jne    a1d <morecore+0x34>
    return 0;
 a16:	b8 00 00 00 00       	mov    $0x0,%eax
 a1b:	eb 22                	jmp    a3f <morecore+0x56>
  hp = (Header*)p;
 a1d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a20:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 a23:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a26:	8b 55 08             	mov    0x8(%ebp),%edx
 a29:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 a2c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a2f:	83 c0 08             	add    $0x8,%eax
 a32:	89 04 24             	mov    %eax,(%esp)
 a35:	e8 ce fe ff ff       	call   908 <free>
  return freep;
 a3a:	a1 68 0e 00 00       	mov    0xe68,%eax
}
 a3f:	c9                   	leave  
 a40:	c3                   	ret    

00000a41 <malloc>:

void*
malloc(uint nbytes)
{
 a41:	55                   	push   %ebp
 a42:	89 e5                	mov    %esp,%ebp
 a44:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a47:	8b 45 08             	mov    0x8(%ebp),%eax
 a4a:	83 c0 07             	add    $0x7,%eax
 a4d:	c1 e8 03             	shr    $0x3,%eax
 a50:	83 c0 01             	add    $0x1,%eax
 a53:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 a56:	a1 68 0e 00 00       	mov    0xe68,%eax
 a5b:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a5e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 a62:	75 23                	jne    a87 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 a64:	c7 45 f0 60 0e 00 00 	movl   $0xe60,-0x10(%ebp)
 a6b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a6e:	a3 68 0e 00 00       	mov    %eax,0xe68
 a73:	a1 68 0e 00 00       	mov    0xe68,%eax
 a78:	a3 60 0e 00 00       	mov    %eax,0xe60
    base.s.size = 0;
 a7d:	c7 05 64 0e 00 00 00 	movl   $0x0,0xe64
 a84:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a87:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a8a:	8b 00                	mov    (%eax),%eax
 a8c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 a8f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a92:	8b 40 04             	mov    0x4(%eax),%eax
 a95:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a98:	72 4d                	jb     ae7 <malloc+0xa6>
      if(p->s.size == nunits)
 a9a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a9d:	8b 40 04             	mov    0x4(%eax),%eax
 aa0:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 aa3:	75 0c                	jne    ab1 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 aa5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aa8:	8b 10                	mov    (%eax),%edx
 aaa:	8b 45 f0             	mov    -0x10(%ebp),%eax
 aad:	89 10                	mov    %edx,(%eax)
 aaf:	eb 26                	jmp    ad7 <malloc+0x96>
      else {
        p->s.size -= nunits;
 ab1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ab4:	8b 40 04             	mov    0x4(%eax),%eax
 ab7:	2b 45 ec             	sub    -0x14(%ebp),%eax
 aba:	89 c2                	mov    %eax,%edx
 abc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 abf:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 ac2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ac5:	8b 40 04             	mov    0x4(%eax),%eax
 ac8:	c1 e0 03             	shl    $0x3,%eax
 acb:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 ace:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ad1:	8b 55 ec             	mov    -0x14(%ebp),%edx
 ad4:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 ad7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 ada:	a3 68 0e 00 00       	mov    %eax,0xe68
      return (void*)(p + 1);
 adf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ae2:	83 c0 08             	add    $0x8,%eax
 ae5:	eb 38                	jmp    b1f <malloc+0xde>
    }
    if(p == freep)
 ae7:	a1 68 0e 00 00       	mov    0xe68,%eax
 aec:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 aef:	75 1b                	jne    b0c <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 af1:	8b 45 ec             	mov    -0x14(%ebp),%eax
 af4:	89 04 24             	mov    %eax,(%esp)
 af7:	e8 ed fe ff ff       	call   9e9 <morecore>
 afc:	89 45 f4             	mov    %eax,-0xc(%ebp)
 aff:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 b03:	75 07                	jne    b0c <malloc+0xcb>
        return 0;
 b05:	b8 00 00 00 00       	mov    $0x0,%eax
 b0a:	eb 13                	jmp    b1f <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b0c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b0f:	89 45 f0             	mov    %eax,-0x10(%ebp)
 b12:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b15:	8b 00                	mov    (%eax),%eax
 b17:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 b1a:	e9 70 ff ff ff       	jmp    a8f <malloc+0x4e>
}
 b1f:	c9                   	leave  
 b20:	c3                   	ret    
