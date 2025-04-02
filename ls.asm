
_ls:     file format elf32-i386


Disassembly of section .text:

00000000 <fmtname>:
#include "user.h"
#include "fs.h"

char*
fmtname(char *path)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 ec 24             	sub    $0x24,%esp
  static char buf[DIRSIZ+1];
  char *p;

  // Find first character after last slash.
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
   7:	8b 45 08             	mov    0x8(%ebp),%eax
   a:	89 04 24             	mov    %eax,(%esp)
   d:	e8 e2 03 00 00       	call   3f4 <strlen>
  12:	8b 55 08             	mov    0x8(%ebp),%edx
  15:	01 d0                	add    %edx,%eax
  17:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1a:	eb 04                	jmp    20 <fmtname+0x20>
  1c:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  20:	8b 45 f4             	mov    -0xc(%ebp),%eax
  23:	3b 45 08             	cmp    0x8(%ebp),%eax
  26:	72 0a                	jb     32 <fmtname+0x32>
  28:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2b:	0f b6 00             	movzbl (%eax),%eax
  2e:	3c 2f                	cmp    $0x2f,%al
  30:	75 ea                	jne    1c <fmtname+0x1c>
    ;
  p++;
  32:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)

  // Return blank-padded name.
  if(strlen(p) >= DIRSIZ)
  36:	8b 45 f4             	mov    -0xc(%ebp),%eax
  39:	89 04 24             	mov    %eax,(%esp)
  3c:	e8 b3 03 00 00       	call   3f4 <strlen>
  41:	83 f8 0d             	cmp    $0xd,%eax
  44:	76 05                	jbe    4b <fmtname+0x4b>
    return p;
  46:	8b 45 f4             	mov    -0xc(%ebp),%eax
  49:	eb 5f                	jmp    aa <fmtname+0xaa>
  memmove(buf, p, strlen(p));
  4b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  4e:	89 04 24             	mov    %eax,(%esp)
  51:	e8 9e 03 00 00       	call   3f4 <strlen>
  56:	89 44 24 08          	mov    %eax,0x8(%esp)
  5a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  5d:	89 44 24 04          	mov    %eax,0x4(%esp)
  61:	c7 04 24 3c 0e 00 00 	movl   $0xe3c,(%esp)
  68:	e8 16 05 00 00       	call   583 <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  6d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  70:	89 04 24             	mov    %eax,(%esp)
  73:	e8 7c 03 00 00       	call   3f4 <strlen>
  78:	ba 0e 00 00 00       	mov    $0xe,%edx
  7d:	89 d3                	mov    %edx,%ebx
  7f:	29 c3                	sub    %eax,%ebx
  81:	8b 45 f4             	mov    -0xc(%ebp),%eax
  84:	89 04 24             	mov    %eax,(%esp)
  87:	e8 68 03 00 00       	call   3f4 <strlen>
  8c:	05 3c 0e 00 00       	add    $0xe3c,%eax
  91:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  95:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
  9c:	00 
  9d:	89 04 24             	mov    %eax,(%esp)
  a0:	e8 76 03 00 00       	call   41b <memset>
  return buf;
  a5:	b8 3c 0e 00 00       	mov    $0xe3c,%eax
}
  aa:	83 c4 24             	add    $0x24,%esp
  ad:	5b                   	pop    %ebx
  ae:	5d                   	pop    %ebp
  af:	c3                   	ret    

000000b0 <ls>:

void
ls(char *path)
{
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	57                   	push   %edi
  b4:	56                   	push   %esi
  b5:	53                   	push   %ebx
  b6:	81 ec 5c 02 00 00    	sub    $0x25c,%esp
  char buf[512], *p;
  int fd;
  struct dirent de;
  struct stat st;

  if((fd = open(path, 0)) < 0){
  bc:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  c3:	00 
  c4:	8b 45 08             	mov    0x8(%ebp),%eax
  c7:	89 04 24             	mov    %eax,(%esp)
  ca:	e8 39 05 00 00       	call   608 <open>
  cf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  d2:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  d6:	79 20                	jns    f8 <ls+0x48>
    printf(2, "ls: cannot open %s\n", path);
  d8:	8b 45 08             	mov    0x8(%ebp),%eax
  db:	89 44 24 08          	mov    %eax,0x8(%esp)
  df:	c7 44 24 04 1c 0b 00 	movl   $0xb1c,0x4(%esp)
  e6:	00 
  e7:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  ee:	e8 5d 06 00 00       	call   750 <printf>
    return;
  f3:	e9 01 02 00 00       	jmp    2f9 <ls+0x249>
  }

  if(fstat(fd, &st) < 0){
  f8:	8d 85 bc fd ff ff    	lea    -0x244(%ebp),%eax
  fe:	89 44 24 04          	mov    %eax,0x4(%esp)
 102:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 105:	89 04 24             	mov    %eax,(%esp)
 108:	e8 13 05 00 00       	call   620 <fstat>
 10d:	85 c0                	test   %eax,%eax
 10f:	79 2b                	jns    13c <ls+0x8c>
    printf(2, "ls: cannot stat %s\n", path);
 111:	8b 45 08             	mov    0x8(%ebp),%eax
 114:	89 44 24 08          	mov    %eax,0x8(%esp)
 118:	c7 44 24 04 30 0b 00 	movl   $0xb30,0x4(%esp)
 11f:	00 
 120:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 127:	e8 24 06 00 00       	call   750 <printf>
    close(fd);
 12c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 12f:	89 04 24             	mov    %eax,(%esp)
 132:	e8 b9 04 00 00       	call   5f0 <close>
    return;
 137:	e9 bd 01 00 00       	jmp    2f9 <ls+0x249>
  }

  switch(st.type){
 13c:	0f b7 85 bc fd ff ff 	movzwl -0x244(%ebp),%eax
 143:	98                   	cwtl   
 144:	83 f8 01             	cmp    $0x1,%eax
 147:	74 53                	je     19c <ls+0xec>
 149:	83 f8 02             	cmp    $0x2,%eax
 14c:	0f 85 9c 01 00 00    	jne    2ee <ls+0x23e>
  case T_FILE:
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
 152:	8b bd cc fd ff ff    	mov    -0x234(%ebp),%edi
 158:	8b b5 c4 fd ff ff    	mov    -0x23c(%ebp),%esi
 15e:	0f b7 85 bc fd ff ff 	movzwl -0x244(%ebp),%eax
 165:	0f bf d8             	movswl %ax,%ebx
 168:	8b 45 08             	mov    0x8(%ebp),%eax
 16b:	89 04 24             	mov    %eax,(%esp)
 16e:	e8 8d fe ff ff       	call   0 <fmtname>
 173:	89 7c 24 14          	mov    %edi,0x14(%esp)
 177:	89 74 24 10          	mov    %esi,0x10(%esp)
 17b:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 17f:	89 44 24 08          	mov    %eax,0x8(%esp)
 183:	c7 44 24 04 44 0b 00 	movl   $0xb44,0x4(%esp)
 18a:	00 
 18b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 192:	e8 b9 05 00 00       	call   750 <printf>
    break;
 197:	e9 52 01 00 00       	jmp    2ee <ls+0x23e>

  case T_DIR:
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 19c:	8b 45 08             	mov    0x8(%ebp),%eax
 19f:	89 04 24             	mov    %eax,(%esp)
 1a2:	e8 4d 02 00 00       	call   3f4 <strlen>
 1a7:	83 c0 10             	add    $0x10,%eax
 1aa:	3d 00 02 00 00       	cmp    $0x200,%eax
 1af:	76 19                	jbe    1ca <ls+0x11a>
      printf(1, "ls: path too long\n");
 1b1:	c7 44 24 04 51 0b 00 	movl   $0xb51,0x4(%esp)
 1b8:	00 
 1b9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1c0:	e8 8b 05 00 00       	call   750 <printf>
      break;
 1c5:	e9 24 01 00 00       	jmp    2ee <ls+0x23e>
    }
    strcpy(buf, path);
 1ca:	8b 45 08             	mov    0x8(%ebp),%eax
 1cd:	89 44 24 04          	mov    %eax,0x4(%esp)
 1d1:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 1d7:	89 04 24             	mov    %eax,(%esp)
 1da:	e8 a6 01 00 00       	call   385 <strcpy>
    p = buf+strlen(buf);
 1df:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 1e5:	89 04 24             	mov    %eax,(%esp)
 1e8:	e8 07 02 00 00       	call   3f4 <strlen>
 1ed:	8d 95 e0 fd ff ff    	lea    -0x220(%ebp),%edx
 1f3:	01 d0                	add    %edx,%eax
 1f5:	89 45 e0             	mov    %eax,-0x20(%ebp)
    *p++ = '/';
 1f8:	8b 45 e0             	mov    -0x20(%ebp),%eax
 1fb:	8d 50 01             	lea    0x1(%eax),%edx
 1fe:	89 55 e0             	mov    %edx,-0x20(%ebp)
 201:	c6 00 2f             	movb   $0x2f,(%eax)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 204:	e9 be 00 00 00       	jmp    2c7 <ls+0x217>
      if(de.inum == 0)
 209:	0f b7 85 d0 fd ff ff 	movzwl -0x230(%ebp),%eax
 210:	66 85 c0             	test   %ax,%ax
 213:	75 05                	jne    21a <ls+0x16a>
        continue;
 215:	e9 ad 00 00 00       	jmp    2c7 <ls+0x217>
      memmove(p, de.name, DIRSIZ);
 21a:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
 221:	00 
 222:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
 228:	83 c0 02             	add    $0x2,%eax
 22b:	89 44 24 04          	mov    %eax,0x4(%esp)
 22f:	8b 45 e0             	mov    -0x20(%ebp),%eax
 232:	89 04 24             	mov    %eax,(%esp)
 235:	e8 49 03 00 00       	call   583 <memmove>
      p[DIRSIZ] = 0;
 23a:	8b 45 e0             	mov    -0x20(%ebp),%eax
 23d:	83 c0 0e             	add    $0xe,%eax
 240:	c6 00 00             	movb   $0x0,(%eax)
      if(stat(buf, &st) < 0){
 243:	8d 85 bc fd ff ff    	lea    -0x244(%ebp),%eax
 249:	89 44 24 04          	mov    %eax,0x4(%esp)
 24d:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 253:	89 04 24             	mov    %eax,(%esp)
 256:	e8 8d 02 00 00       	call   4e8 <stat>
 25b:	85 c0                	test   %eax,%eax
 25d:	79 20                	jns    27f <ls+0x1cf>
        printf(1, "ls: cannot stat %s\n", buf);
 25f:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 265:	89 44 24 08          	mov    %eax,0x8(%esp)
 269:	c7 44 24 04 30 0b 00 	movl   $0xb30,0x4(%esp)
 270:	00 
 271:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 278:	e8 d3 04 00 00       	call   750 <printf>
        continue;
 27d:	eb 48                	jmp    2c7 <ls+0x217>
      }
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 27f:	8b bd cc fd ff ff    	mov    -0x234(%ebp),%edi
 285:	8b b5 c4 fd ff ff    	mov    -0x23c(%ebp),%esi
 28b:	0f b7 85 bc fd ff ff 	movzwl -0x244(%ebp),%eax
 292:	0f bf d8             	movswl %ax,%ebx
 295:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 29b:	89 04 24             	mov    %eax,(%esp)
 29e:	e8 5d fd ff ff       	call   0 <fmtname>
 2a3:	89 7c 24 14          	mov    %edi,0x14(%esp)
 2a7:	89 74 24 10          	mov    %esi,0x10(%esp)
 2ab:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 2af:	89 44 24 08          	mov    %eax,0x8(%esp)
 2b3:	c7 44 24 04 44 0b 00 	movl   $0xb44,0x4(%esp)
 2ba:	00 
 2bb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2c2:	e8 89 04 00 00       	call   750 <printf>
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 2c7:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 2ce:	00 
 2cf:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
 2d5:	89 44 24 04          	mov    %eax,0x4(%esp)
 2d9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 2dc:	89 04 24             	mov    %eax,(%esp)
 2df:	e8 fc 02 00 00       	call   5e0 <read>
 2e4:	83 f8 10             	cmp    $0x10,%eax
 2e7:	0f 84 1c ff ff ff    	je     209 <ls+0x159>
    }
    break;
 2ed:	90                   	nop
  }
  close(fd);
 2ee:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 2f1:	89 04 24             	mov    %eax,(%esp)
 2f4:	e8 f7 02 00 00       	call   5f0 <close>
}
 2f9:	81 c4 5c 02 00 00    	add    $0x25c,%esp
 2ff:	5b                   	pop    %ebx
 300:	5e                   	pop    %esi
 301:	5f                   	pop    %edi
 302:	5d                   	pop    %ebp
 303:	c3                   	ret    

00000304 <main>:

int
main(int argc, char *argv[])
{
 304:	55                   	push   %ebp
 305:	89 e5                	mov    %esp,%ebp
 307:	83 e4 f0             	and    $0xfffffff0,%esp
 30a:	83 ec 20             	sub    $0x20,%esp
  int i;

  if(argc < 2){
 30d:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
 311:	7f 11                	jg     324 <main+0x20>
    ls(".");
 313:	c7 04 24 64 0b 00 00 	movl   $0xb64,(%esp)
 31a:	e8 91 fd ff ff       	call   b0 <ls>
    exit();
 31f:	e8 a4 02 00 00       	call   5c8 <exit>
  }
  for(i=1; i<argc; i++)
 324:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
 32b:	00 
 32c:	eb 1f                	jmp    34d <main+0x49>
    ls(argv[i]);
 32e:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 332:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 339:	8b 45 0c             	mov    0xc(%ebp),%eax
 33c:	01 d0                	add    %edx,%eax
 33e:	8b 00                	mov    (%eax),%eax
 340:	89 04 24             	mov    %eax,(%esp)
 343:	e8 68 fd ff ff       	call   b0 <ls>
  for(i=1; i<argc; i++)
 348:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
 34d:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 351:	3b 45 08             	cmp    0x8(%ebp),%eax
 354:	7c d8                	jl     32e <main+0x2a>
  exit();
 356:	e8 6d 02 00 00       	call   5c8 <exit>

0000035b <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 35b:	55                   	push   %ebp
 35c:	89 e5                	mov    %esp,%ebp
 35e:	57                   	push   %edi
 35f:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 360:	8b 4d 08             	mov    0x8(%ebp),%ecx
 363:	8b 55 10             	mov    0x10(%ebp),%edx
 366:	8b 45 0c             	mov    0xc(%ebp),%eax
 369:	89 cb                	mov    %ecx,%ebx
 36b:	89 df                	mov    %ebx,%edi
 36d:	89 d1                	mov    %edx,%ecx
 36f:	fc                   	cld    
 370:	f3 aa                	rep stos %al,%es:(%edi)
 372:	89 ca                	mov    %ecx,%edx
 374:	89 fb                	mov    %edi,%ebx
 376:	89 5d 08             	mov    %ebx,0x8(%ebp)
 379:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 37c:	5b                   	pop    %ebx
 37d:	5f                   	pop    %edi
 37e:	5d                   	pop    %ebp
 37f:	c3                   	ret    

00000380 <ps>:
#include "stat.h"
#include "fcntl.h"
#include "user.h"
#include "x86.h"

void ps(){
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
  
 //  pstatTable * pst = getpinfo
}
 383:	5d                   	pop    %ebp
 384:	c3                   	ret    

00000385 <strcpy>:

char*
strcpy(char *s, const char *t)
{
 385:	55                   	push   %ebp
 386:	89 e5                	mov    %esp,%ebp
 388:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 38b:	8b 45 08             	mov    0x8(%ebp),%eax
 38e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 391:	90                   	nop
 392:	8b 45 08             	mov    0x8(%ebp),%eax
 395:	8d 50 01             	lea    0x1(%eax),%edx
 398:	89 55 08             	mov    %edx,0x8(%ebp)
 39b:	8b 55 0c             	mov    0xc(%ebp),%edx
 39e:	8d 4a 01             	lea    0x1(%edx),%ecx
 3a1:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 3a4:	0f b6 12             	movzbl (%edx),%edx
 3a7:	88 10                	mov    %dl,(%eax)
 3a9:	0f b6 00             	movzbl (%eax),%eax
 3ac:	84 c0                	test   %al,%al
 3ae:	75 e2                	jne    392 <strcpy+0xd>
    ;
  return os;
 3b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3b3:	c9                   	leave  
 3b4:	c3                   	ret    

000003b5 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3b5:	55                   	push   %ebp
 3b6:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 3b8:	eb 08                	jmp    3c2 <strcmp+0xd>
    p++, q++;
 3ba:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 3be:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 3c2:	8b 45 08             	mov    0x8(%ebp),%eax
 3c5:	0f b6 00             	movzbl (%eax),%eax
 3c8:	84 c0                	test   %al,%al
 3ca:	74 10                	je     3dc <strcmp+0x27>
 3cc:	8b 45 08             	mov    0x8(%ebp),%eax
 3cf:	0f b6 10             	movzbl (%eax),%edx
 3d2:	8b 45 0c             	mov    0xc(%ebp),%eax
 3d5:	0f b6 00             	movzbl (%eax),%eax
 3d8:	38 c2                	cmp    %al,%dl
 3da:	74 de                	je     3ba <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 3dc:	8b 45 08             	mov    0x8(%ebp),%eax
 3df:	0f b6 00             	movzbl (%eax),%eax
 3e2:	0f b6 d0             	movzbl %al,%edx
 3e5:	8b 45 0c             	mov    0xc(%ebp),%eax
 3e8:	0f b6 00             	movzbl (%eax),%eax
 3eb:	0f b6 c0             	movzbl %al,%eax
 3ee:	29 c2                	sub    %eax,%edx
 3f0:	89 d0                	mov    %edx,%eax
}
 3f2:	5d                   	pop    %ebp
 3f3:	c3                   	ret    

000003f4 <strlen>:

uint
strlen(const char *s)
{
 3f4:	55                   	push   %ebp
 3f5:	89 e5                	mov    %esp,%ebp
 3f7:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 3fa:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 401:	eb 04                	jmp    407 <strlen+0x13>
 403:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 407:	8b 55 fc             	mov    -0x4(%ebp),%edx
 40a:	8b 45 08             	mov    0x8(%ebp),%eax
 40d:	01 d0                	add    %edx,%eax
 40f:	0f b6 00             	movzbl (%eax),%eax
 412:	84 c0                	test   %al,%al
 414:	75 ed                	jne    403 <strlen+0xf>
    ;
  return n;
 416:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 419:	c9                   	leave  
 41a:	c3                   	ret    

0000041b <memset>:

void*
memset(void *dst, int c, uint n)
{
 41b:	55                   	push   %ebp
 41c:	89 e5                	mov    %esp,%ebp
 41e:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 421:	8b 45 10             	mov    0x10(%ebp),%eax
 424:	89 44 24 08          	mov    %eax,0x8(%esp)
 428:	8b 45 0c             	mov    0xc(%ebp),%eax
 42b:	89 44 24 04          	mov    %eax,0x4(%esp)
 42f:	8b 45 08             	mov    0x8(%ebp),%eax
 432:	89 04 24             	mov    %eax,(%esp)
 435:	e8 21 ff ff ff       	call   35b <stosb>
  return dst;
 43a:	8b 45 08             	mov    0x8(%ebp),%eax
}
 43d:	c9                   	leave  
 43e:	c3                   	ret    

0000043f <strchr>:

char*
strchr(const char *s, char c)
{
 43f:	55                   	push   %ebp
 440:	89 e5                	mov    %esp,%ebp
 442:	83 ec 04             	sub    $0x4,%esp
 445:	8b 45 0c             	mov    0xc(%ebp),%eax
 448:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 44b:	eb 14                	jmp    461 <strchr+0x22>
    if(*s == c)
 44d:	8b 45 08             	mov    0x8(%ebp),%eax
 450:	0f b6 00             	movzbl (%eax),%eax
 453:	3a 45 fc             	cmp    -0x4(%ebp),%al
 456:	75 05                	jne    45d <strchr+0x1e>
      return (char*)s;
 458:	8b 45 08             	mov    0x8(%ebp),%eax
 45b:	eb 13                	jmp    470 <strchr+0x31>
  for(; *s; s++)
 45d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 461:	8b 45 08             	mov    0x8(%ebp),%eax
 464:	0f b6 00             	movzbl (%eax),%eax
 467:	84 c0                	test   %al,%al
 469:	75 e2                	jne    44d <strchr+0xe>
  return 0;
 46b:	b8 00 00 00 00       	mov    $0x0,%eax
}
 470:	c9                   	leave  
 471:	c3                   	ret    

00000472 <gets>:

char*
gets(char *buf, int max)
{
 472:	55                   	push   %ebp
 473:	89 e5                	mov    %esp,%ebp
 475:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 478:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 47f:	eb 4c                	jmp    4cd <gets+0x5b>
    cc = read(0, &c, 1);
 481:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 488:	00 
 489:	8d 45 ef             	lea    -0x11(%ebp),%eax
 48c:	89 44 24 04          	mov    %eax,0x4(%esp)
 490:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 497:	e8 44 01 00 00       	call   5e0 <read>
 49c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 49f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4a3:	7f 02                	jg     4a7 <gets+0x35>
      break;
 4a5:	eb 31                	jmp    4d8 <gets+0x66>
    buf[i++] = c;
 4a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4aa:	8d 50 01             	lea    0x1(%eax),%edx
 4ad:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4b0:	89 c2                	mov    %eax,%edx
 4b2:	8b 45 08             	mov    0x8(%ebp),%eax
 4b5:	01 c2                	add    %eax,%edx
 4b7:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4bb:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 4bd:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4c1:	3c 0a                	cmp    $0xa,%al
 4c3:	74 13                	je     4d8 <gets+0x66>
 4c5:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4c9:	3c 0d                	cmp    $0xd,%al
 4cb:	74 0b                	je     4d8 <gets+0x66>
  for(i=0; i+1 < max; ){
 4cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4d0:	83 c0 01             	add    $0x1,%eax
 4d3:	3b 45 0c             	cmp    0xc(%ebp),%eax
 4d6:	7c a9                	jl     481 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 4d8:	8b 55 f4             	mov    -0xc(%ebp),%edx
 4db:	8b 45 08             	mov    0x8(%ebp),%eax
 4de:	01 d0                	add    %edx,%eax
 4e0:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 4e3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 4e6:	c9                   	leave  
 4e7:	c3                   	ret    

000004e8 <stat>:

int
stat(const char *n, struct stat *st)
{
 4e8:	55                   	push   %ebp
 4e9:	89 e5                	mov    %esp,%ebp
 4eb:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4ee:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 4f5:	00 
 4f6:	8b 45 08             	mov    0x8(%ebp),%eax
 4f9:	89 04 24             	mov    %eax,(%esp)
 4fc:	e8 07 01 00 00       	call   608 <open>
 501:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 504:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 508:	79 07                	jns    511 <stat+0x29>
    return -1;
 50a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 50f:	eb 23                	jmp    534 <stat+0x4c>
  r = fstat(fd, st);
 511:	8b 45 0c             	mov    0xc(%ebp),%eax
 514:	89 44 24 04          	mov    %eax,0x4(%esp)
 518:	8b 45 f4             	mov    -0xc(%ebp),%eax
 51b:	89 04 24             	mov    %eax,(%esp)
 51e:	e8 fd 00 00 00       	call   620 <fstat>
 523:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 526:	8b 45 f4             	mov    -0xc(%ebp),%eax
 529:	89 04 24             	mov    %eax,(%esp)
 52c:	e8 bf 00 00 00       	call   5f0 <close>
  return r;
 531:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 534:	c9                   	leave  
 535:	c3                   	ret    

00000536 <atoi>:

int
atoi(const char *s)
{
 536:	55                   	push   %ebp
 537:	89 e5                	mov    %esp,%ebp
 539:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 53c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 543:	eb 25                	jmp    56a <atoi+0x34>
    n = n*10 + *s++ - '0';
 545:	8b 55 fc             	mov    -0x4(%ebp),%edx
 548:	89 d0                	mov    %edx,%eax
 54a:	c1 e0 02             	shl    $0x2,%eax
 54d:	01 d0                	add    %edx,%eax
 54f:	01 c0                	add    %eax,%eax
 551:	89 c1                	mov    %eax,%ecx
 553:	8b 45 08             	mov    0x8(%ebp),%eax
 556:	8d 50 01             	lea    0x1(%eax),%edx
 559:	89 55 08             	mov    %edx,0x8(%ebp)
 55c:	0f b6 00             	movzbl (%eax),%eax
 55f:	0f be c0             	movsbl %al,%eax
 562:	01 c8                	add    %ecx,%eax
 564:	83 e8 30             	sub    $0x30,%eax
 567:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 56a:	8b 45 08             	mov    0x8(%ebp),%eax
 56d:	0f b6 00             	movzbl (%eax),%eax
 570:	3c 2f                	cmp    $0x2f,%al
 572:	7e 0a                	jle    57e <atoi+0x48>
 574:	8b 45 08             	mov    0x8(%ebp),%eax
 577:	0f b6 00             	movzbl (%eax),%eax
 57a:	3c 39                	cmp    $0x39,%al
 57c:	7e c7                	jle    545 <atoi+0xf>
  return n;
 57e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 581:	c9                   	leave  
 582:	c3                   	ret    

00000583 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 583:	55                   	push   %ebp
 584:	89 e5                	mov    %esp,%ebp
 586:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 589:	8b 45 08             	mov    0x8(%ebp),%eax
 58c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 58f:	8b 45 0c             	mov    0xc(%ebp),%eax
 592:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 595:	eb 17                	jmp    5ae <memmove+0x2b>
    *dst++ = *src++;
 597:	8b 45 fc             	mov    -0x4(%ebp),%eax
 59a:	8d 50 01             	lea    0x1(%eax),%edx
 59d:	89 55 fc             	mov    %edx,-0x4(%ebp)
 5a0:	8b 55 f8             	mov    -0x8(%ebp),%edx
 5a3:	8d 4a 01             	lea    0x1(%edx),%ecx
 5a6:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 5a9:	0f b6 12             	movzbl (%edx),%edx
 5ac:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 5ae:	8b 45 10             	mov    0x10(%ebp),%eax
 5b1:	8d 50 ff             	lea    -0x1(%eax),%edx
 5b4:	89 55 10             	mov    %edx,0x10(%ebp)
 5b7:	85 c0                	test   %eax,%eax
 5b9:	7f dc                	jg     597 <memmove+0x14>
  return vdst;
 5bb:	8b 45 08             	mov    0x8(%ebp),%eax
}
 5be:	c9                   	leave  
 5bf:	c3                   	ret    

000005c0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5c0:	b8 01 00 00 00       	mov    $0x1,%eax
 5c5:	cd 40                	int    $0x40
 5c7:	c3                   	ret    

000005c8 <exit>:
SYSCALL(exit)
 5c8:	b8 02 00 00 00       	mov    $0x2,%eax
 5cd:	cd 40                	int    $0x40
 5cf:	c3                   	ret    

000005d0 <wait>:
SYSCALL(wait)
 5d0:	b8 03 00 00 00       	mov    $0x3,%eax
 5d5:	cd 40                	int    $0x40
 5d7:	c3                   	ret    

000005d8 <pipe>:
SYSCALL(pipe)
 5d8:	b8 04 00 00 00       	mov    $0x4,%eax
 5dd:	cd 40                	int    $0x40
 5df:	c3                   	ret    

000005e0 <read>:
SYSCALL(read)
 5e0:	b8 05 00 00 00       	mov    $0x5,%eax
 5e5:	cd 40                	int    $0x40
 5e7:	c3                   	ret    

000005e8 <write>:
SYSCALL(write)
 5e8:	b8 10 00 00 00       	mov    $0x10,%eax
 5ed:	cd 40                	int    $0x40
 5ef:	c3                   	ret    

000005f0 <close>:
SYSCALL(close)
 5f0:	b8 15 00 00 00       	mov    $0x15,%eax
 5f5:	cd 40                	int    $0x40
 5f7:	c3                   	ret    

000005f8 <kill>:
SYSCALL(kill)
 5f8:	b8 06 00 00 00       	mov    $0x6,%eax
 5fd:	cd 40                	int    $0x40
 5ff:	c3                   	ret    

00000600 <exec>:
SYSCALL(exec)
 600:	b8 07 00 00 00       	mov    $0x7,%eax
 605:	cd 40                	int    $0x40
 607:	c3                   	ret    

00000608 <open>:
SYSCALL(open)
 608:	b8 0f 00 00 00       	mov    $0xf,%eax
 60d:	cd 40                	int    $0x40
 60f:	c3                   	ret    

00000610 <mknod>:
SYSCALL(mknod)
 610:	b8 11 00 00 00       	mov    $0x11,%eax
 615:	cd 40                	int    $0x40
 617:	c3                   	ret    

00000618 <unlink>:
SYSCALL(unlink)
 618:	b8 12 00 00 00       	mov    $0x12,%eax
 61d:	cd 40                	int    $0x40
 61f:	c3                   	ret    

00000620 <fstat>:
SYSCALL(fstat)
 620:	b8 08 00 00 00       	mov    $0x8,%eax
 625:	cd 40                	int    $0x40
 627:	c3                   	ret    

00000628 <link>:
SYSCALL(link)
 628:	b8 13 00 00 00       	mov    $0x13,%eax
 62d:	cd 40                	int    $0x40
 62f:	c3                   	ret    

00000630 <mkdir>:
SYSCALL(mkdir)
 630:	b8 14 00 00 00       	mov    $0x14,%eax
 635:	cd 40                	int    $0x40
 637:	c3                   	ret    

00000638 <chdir>:
SYSCALL(chdir)
 638:	b8 09 00 00 00       	mov    $0x9,%eax
 63d:	cd 40                	int    $0x40
 63f:	c3                   	ret    

00000640 <dup>:
SYSCALL(dup)
 640:	b8 0a 00 00 00       	mov    $0xa,%eax
 645:	cd 40                	int    $0x40
 647:	c3                   	ret    

00000648 <getpid>:
SYSCALL(getpid)
 648:	b8 0b 00 00 00       	mov    $0xb,%eax
 64d:	cd 40                	int    $0x40
 64f:	c3                   	ret    

00000650 <sbrk>:
SYSCALL(sbrk)
 650:	b8 0c 00 00 00       	mov    $0xc,%eax
 655:	cd 40                	int    $0x40
 657:	c3                   	ret    

00000658 <sleep>:
SYSCALL(sleep)
 658:	b8 0d 00 00 00       	mov    $0xd,%eax
 65d:	cd 40                	int    $0x40
 65f:	c3                   	ret    

00000660 <uptime>:
SYSCALL(uptime)
 660:	b8 0e 00 00 00       	mov    $0xe,%eax
 665:	cd 40                	int    $0x40
 667:	c3                   	ret    

00000668 <getpinfo>:
SYSCALL(getpinfo)
 668:	b8 16 00 00 00       	mov    $0x16,%eax
 66d:	cd 40                	int    $0x40
 66f:	c3                   	ret    

00000670 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 670:	55                   	push   %ebp
 671:	89 e5                	mov    %esp,%ebp
 673:	83 ec 18             	sub    $0x18,%esp
 676:	8b 45 0c             	mov    0xc(%ebp),%eax
 679:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 67c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 683:	00 
 684:	8d 45 f4             	lea    -0xc(%ebp),%eax
 687:	89 44 24 04          	mov    %eax,0x4(%esp)
 68b:	8b 45 08             	mov    0x8(%ebp),%eax
 68e:	89 04 24             	mov    %eax,(%esp)
 691:	e8 52 ff ff ff       	call   5e8 <write>
}
 696:	c9                   	leave  
 697:	c3                   	ret    

00000698 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 698:	55                   	push   %ebp
 699:	89 e5                	mov    %esp,%ebp
 69b:	56                   	push   %esi
 69c:	53                   	push   %ebx
 69d:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 6a0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 6a7:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 6ab:	74 17                	je     6c4 <printint+0x2c>
 6ad:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 6b1:	79 11                	jns    6c4 <printint+0x2c>
    neg = 1;
 6b3:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 6ba:	8b 45 0c             	mov    0xc(%ebp),%eax
 6bd:	f7 d8                	neg    %eax
 6bf:	89 45 ec             	mov    %eax,-0x14(%ebp)
 6c2:	eb 06                	jmp    6ca <printint+0x32>
  } else {
    x = xx;
 6c4:	8b 45 0c             	mov    0xc(%ebp),%eax
 6c7:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 6ca:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 6d1:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 6d4:	8d 41 01             	lea    0x1(%ecx),%eax
 6d7:	89 45 f4             	mov    %eax,-0xc(%ebp)
 6da:	8b 5d 10             	mov    0x10(%ebp),%ebx
 6dd:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6e0:	ba 00 00 00 00       	mov    $0x0,%edx
 6e5:	f7 f3                	div    %ebx
 6e7:	89 d0                	mov    %edx,%eax
 6e9:	0f b6 80 28 0e 00 00 	movzbl 0xe28(%eax),%eax
 6f0:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 6f4:	8b 75 10             	mov    0x10(%ebp),%esi
 6f7:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6fa:	ba 00 00 00 00       	mov    $0x0,%edx
 6ff:	f7 f6                	div    %esi
 701:	89 45 ec             	mov    %eax,-0x14(%ebp)
 704:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 708:	75 c7                	jne    6d1 <printint+0x39>
  if(neg)
 70a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 70e:	74 10                	je     720 <printint+0x88>
    buf[i++] = '-';
 710:	8b 45 f4             	mov    -0xc(%ebp),%eax
 713:	8d 50 01             	lea    0x1(%eax),%edx
 716:	89 55 f4             	mov    %edx,-0xc(%ebp)
 719:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 71e:	eb 1f                	jmp    73f <printint+0xa7>
 720:	eb 1d                	jmp    73f <printint+0xa7>
    putc(fd, buf[i]);
 722:	8d 55 dc             	lea    -0x24(%ebp),%edx
 725:	8b 45 f4             	mov    -0xc(%ebp),%eax
 728:	01 d0                	add    %edx,%eax
 72a:	0f b6 00             	movzbl (%eax),%eax
 72d:	0f be c0             	movsbl %al,%eax
 730:	89 44 24 04          	mov    %eax,0x4(%esp)
 734:	8b 45 08             	mov    0x8(%ebp),%eax
 737:	89 04 24             	mov    %eax,(%esp)
 73a:	e8 31 ff ff ff       	call   670 <putc>
  while(--i >= 0)
 73f:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 743:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 747:	79 d9                	jns    722 <printint+0x8a>
}
 749:	83 c4 30             	add    $0x30,%esp
 74c:	5b                   	pop    %ebx
 74d:	5e                   	pop    %esi
 74e:	5d                   	pop    %ebp
 74f:	c3                   	ret    

00000750 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 750:	55                   	push   %ebp
 751:	89 e5                	mov    %esp,%ebp
 753:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 756:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 75d:	8d 45 0c             	lea    0xc(%ebp),%eax
 760:	83 c0 04             	add    $0x4,%eax
 763:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 766:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 76d:	e9 7c 01 00 00       	jmp    8ee <printf+0x19e>
    c = fmt[i] & 0xff;
 772:	8b 55 0c             	mov    0xc(%ebp),%edx
 775:	8b 45 f0             	mov    -0x10(%ebp),%eax
 778:	01 d0                	add    %edx,%eax
 77a:	0f b6 00             	movzbl (%eax),%eax
 77d:	0f be c0             	movsbl %al,%eax
 780:	25 ff 00 00 00       	and    $0xff,%eax
 785:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 788:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 78c:	75 2c                	jne    7ba <printf+0x6a>
      if(c == '%'){
 78e:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 792:	75 0c                	jne    7a0 <printf+0x50>
        state = '%';
 794:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 79b:	e9 4a 01 00 00       	jmp    8ea <printf+0x19a>
      } else {
        putc(fd, c);
 7a0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7a3:	0f be c0             	movsbl %al,%eax
 7a6:	89 44 24 04          	mov    %eax,0x4(%esp)
 7aa:	8b 45 08             	mov    0x8(%ebp),%eax
 7ad:	89 04 24             	mov    %eax,(%esp)
 7b0:	e8 bb fe ff ff       	call   670 <putc>
 7b5:	e9 30 01 00 00       	jmp    8ea <printf+0x19a>
      }
    } else if(state == '%'){
 7ba:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 7be:	0f 85 26 01 00 00    	jne    8ea <printf+0x19a>
      if(c == 'd'){
 7c4:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 7c8:	75 2d                	jne    7f7 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 7ca:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7cd:	8b 00                	mov    (%eax),%eax
 7cf:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 7d6:	00 
 7d7:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 7de:	00 
 7df:	89 44 24 04          	mov    %eax,0x4(%esp)
 7e3:	8b 45 08             	mov    0x8(%ebp),%eax
 7e6:	89 04 24             	mov    %eax,(%esp)
 7e9:	e8 aa fe ff ff       	call   698 <printint>
        ap++;
 7ee:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7f2:	e9 ec 00 00 00       	jmp    8e3 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 7f7:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 7fb:	74 06                	je     803 <printf+0xb3>
 7fd:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 801:	75 2d                	jne    830 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 803:	8b 45 e8             	mov    -0x18(%ebp),%eax
 806:	8b 00                	mov    (%eax),%eax
 808:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 80f:	00 
 810:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 817:	00 
 818:	89 44 24 04          	mov    %eax,0x4(%esp)
 81c:	8b 45 08             	mov    0x8(%ebp),%eax
 81f:	89 04 24             	mov    %eax,(%esp)
 822:	e8 71 fe ff ff       	call   698 <printint>
        ap++;
 827:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 82b:	e9 b3 00 00 00       	jmp    8e3 <printf+0x193>
      } else if(c == 's'){
 830:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 834:	75 45                	jne    87b <printf+0x12b>
        s = (char*)*ap;
 836:	8b 45 e8             	mov    -0x18(%ebp),%eax
 839:	8b 00                	mov    (%eax),%eax
 83b:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 83e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 842:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 846:	75 09                	jne    851 <printf+0x101>
          s = "(null)";
 848:	c7 45 f4 66 0b 00 00 	movl   $0xb66,-0xc(%ebp)
        while(*s != 0){
 84f:	eb 1e                	jmp    86f <printf+0x11f>
 851:	eb 1c                	jmp    86f <printf+0x11f>
          putc(fd, *s);
 853:	8b 45 f4             	mov    -0xc(%ebp),%eax
 856:	0f b6 00             	movzbl (%eax),%eax
 859:	0f be c0             	movsbl %al,%eax
 85c:	89 44 24 04          	mov    %eax,0x4(%esp)
 860:	8b 45 08             	mov    0x8(%ebp),%eax
 863:	89 04 24             	mov    %eax,(%esp)
 866:	e8 05 fe ff ff       	call   670 <putc>
          s++;
 86b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 86f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 872:	0f b6 00             	movzbl (%eax),%eax
 875:	84 c0                	test   %al,%al
 877:	75 da                	jne    853 <printf+0x103>
 879:	eb 68                	jmp    8e3 <printf+0x193>
        }
      } else if(c == 'c'){
 87b:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 87f:	75 1d                	jne    89e <printf+0x14e>
        putc(fd, *ap);
 881:	8b 45 e8             	mov    -0x18(%ebp),%eax
 884:	8b 00                	mov    (%eax),%eax
 886:	0f be c0             	movsbl %al,%eax
 889:	89 44 24 04          	mov    %eax,0x4(%esp)
 88d:	8b 45 08             	mov    0x8(%ebp),%eax
 890:	89 04 24             	mov    %eax,(%esp)
 893:	e8 d8 fd ff ff       	call   670 <putc>
        ap++;
 898:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 89c:	eb 45                	jmp    8e3 <printf+0x193>
      } else if(c == '%'){
 89e:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 8a2:	75 17                	jne    8bb <printf+0x16b>
        putc(fd, c);
 8a4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8a7:	0f be c0             	movsbl %al,%eax
 8aa:	89 44 24 04          	mov    %eax,0x4(%esp)
 8ae:	8b 45 08             	mov    0x8(%ebp),%eax
 8b1:	89 04 24             	mov    %eax,(%esp)
 8b4:	e8 b7 fd ff ff       	call   670 <putc>
 8b9:	eb 28                	jmp    8e3 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 8bb:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 8c2:	00 
 8c3:	8b 45 08             	mov    0x8(%ebp),%eax
 8c6:	89 04 24             	mov    %eax,(%esp)
 8c9:	e8 a2 fd ff ff       	call   670 <putc>
        putc(fd, c);
 8ce:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8d1:	0f be c0             	movsbl %al,%eax
 8d4:	89 44 24 04          	mov    %eax,0x4(%esp)
 8d8:	8b 45 08             	mov    0x8(%ebp),%eax
 8db:	89 04 24             	mov    %eax,(%esp)
 8de:	e8 8d fd ff ff       	call   670 <putc>
      }
      state = 0;
 8e3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 8ea:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 8ee:	8b 55 0c             	mov    0xc(%ebp),%edx
 8f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8f4:	01 d0                	add    %edx,%eax
 8f6:	0f b6 00             	movzbl (%eax),%eax
 8f9:	84 c0                	test   %al,%al
 8fb:	0f 85 71 fe ff ff    	jne    772 <printf+0x22>
    }
  }
}
 901:	c9                   	leave  
 902:	c3                   	ret    

00000903 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 903:	55                   	push   %ebp
 904:	89 e5                	mov    %esp,%ebp
 906:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 909:	8b 45 08             	mov    0x8(%ebp),%eax
 90c:	83 e8 08             	sub    $0x8,%eax
 90f:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 912:	a1 54 0e 00 00       	mov    0xe54,%eax
 917:	89 45 fc             	mov    %eax,-0x4(%ebp)
 91a:	eb 24                	jmp    940 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 91c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 91f:	8b 00                	mov    (%eax),%eax
 921:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 924:	77 12                	ja     938 <free+0x35>
 926:	8b 45 f8             	mov    -0x8(%ebp),%eax
 929:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 92c:	77 24                	ja     952 <free+0x4f>
 92e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 931:	8b 00                	mov    (%eax),%eax
 933:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 936:	77 1a                	ja     952 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 938:	8b 45 fc             	mov    -0x4(%ebp),%eax
 93b:	8b 00                	mov    (%eax),%eax
 93d:	89 45 fc             	mov    %eax,-0x4(%ebp)
 940:	8b 45 f8             	mov    -0x8(%ebp),%eax
 943:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 946:	76 d4                	jbe    91c <free+0x19>
 948:	8b 45 fc             	mov    -0x4(%ebp),%eax
 94b:	8b 00                	mov    (%eax),%eax
 94d:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 950:	76 ca                	jbe    91c <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 952:	8b 45 f8             	mov    -0x8(%ebp),%eax
 955:	8b 40 04             	mov    0x4(%eax),%eax
 958:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 95f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 962:	01 c2                	add    %eax,%edx
 964:	8b 45 fc             	mov    -0x4(%ebp),%eax
 967:	8b 00                	mov    (%eax),%eax
 969:	39 c2                	cmp    %eax,%edx
 96b:	75 24                	jne    991 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 96d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 970:	8b 50 04             	mov    0x4(%eax),%edx
 973:	8b 45 fc             	mov    -0x4(%ebp),%eax
 976:	8b 00                	mov    (%eax),%eax
 978:	8b 40 04             	mov    0x4(%eax),%eax
 97b:	01 c2                	add    %eax,%edx
 97d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 980:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 983:	8b 45 fc             	mov    -0x4(%ebp),%eax
 986:	8b 00                	mov    (%eax),%eax
 988:	8b 10                	mov    (%eax),%edx
 98a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 98d:	89 10                	mov    %edx,(%eax)
 98f:	eb 0a                	jmp    99b <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 991:	8b 45 fc             	mov    -0x4(%ebp),%eax
 994:	8b 10                	mov    (%eax),%edx
 996:	8b 45 f8             	mov    -0x8(%ebp),%eax
 999:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 99b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 99e:	8b 40 04             	mov    0x4(%eax),%eax
 9a1:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 9a8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9ab:	01 d0                	add    %edx,%eax
 9ad:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 9b0:	75 20                	jne    9d2 <free+0xcf>
    p->s.size += bp->s.size;
 9b2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9b5:	8b 50 04             	mov    0x4(%eax),%edx
 9b8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9bb:	8b 40 04             	mov    0x4(%eax),%eax
 9be:	01 c2                	add    %eax,%edx
 9c0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9c3:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9c6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9c9:	8b 10                	mov    (%eax),%edx
 9cb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9ce:	89 10                	mov    %edx,(%eax)
 9d0:	eb 08                	jmp    9da <free+0xd7>
  } else
    p->s.ptr = bp;
 9d2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9d5:	8b 55 f8             	mov    -0x8(%ebp),%edx
 9d8:	89 10                	mov    %edx,(%eax)
  freep = p;
 9da:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9dd:	a3 54 0e 00 00       	mov    %eax,0xe54
}
 9e2:	c9                   	leave  
 9e3:	c3                   	ret    

000009e4 <morecore>:

static Header*
morecore(uint nu)
{
 9e4:	55                   	push   %ebp
 9e5:	89 e5                	mov    %esp,%ebp
 9e7:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 9ea:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 9f1:	77 07                	ja     9fa <morecore+0x16>
    nu = 4096;
 9f3:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 9fa:	8b 45 08             	mov    0x8(%ebp),%eax
 9fd:	c1 e0 03             	shl    $0x3,%eax
 a00:	89 04 24             	mov    %eax,(%esp)
 a03:	e8 48 fc ff ff       	call   650 <sbrk>
 a08:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 a0b:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 a0f:	75 07                	jne    a18 <morecore+0x34>
    return 0;
 a11:	b8 00 00 00 00       	mov    $0x0,%eax
 a16:	eb 22                	jmp    a3a <morecore+0x56>
  hp = (Header*)p;
 a18:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a1b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 a1e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a21:	8b 55 08             	mov    0x8(%ebp),%edx
 a24:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 a27:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a2a:	83 c0 08             	add    $0x8,%eax
 a2d:	89 04 24             	mov    %eax,(%esp)
 a30:	e8 ce fe ff ff       	call   903 <free>
  return freep;
 a35:	a1 54 0e 00 00       	mov    0xe54,%eax
}
 a3a:	c9                   	leave  
 a3b:	c3                   	ret    

00000a3c <malloc>:

void*
malloc(uint nbytes)
{
 a3c:	55                   	push   %ebp
 a3d:	89 e5                	mov    %esp,%ebp
 a3f:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a42:	8b 45 08             	mov    0x8(%ebp),%eax
 a45:	83 c0 07             	add    $0x7,%eax
 a48:	c1 e8 03             	shr    $0x3,%eax
 a4b:	83 c0 01             	add    $0x1,%eax
 a4e:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 a51:	a1 54 0e 00 00       	mov    0xe54,%eax
 a56:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a59:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 a5d:	75 23                	jne    a82 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 a5f:	c7 45 f0 4c 0e 00 00 	movl   $0xe4c,-0x10(%ebp)
 a66:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a69:	a3 54 0e 00 00       	mov    %eax,0xe54
 a6e:	a1 54 0e 00 00       	mov    0xe54,%eax
 a73:	a3 4c 0e 00 00       	mov    %eax,0xe4c
    base.s.size = 0;
 a78:	c7 05 50 0e 00 00 00 	movl   $0x0,0xe50
 a7f:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a82:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a85:	8b 00                	mov    (%eax),%eax
 a87:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 a8a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a8d:	8b 40 04             	mov    0x4(%eax),%eax
 a90:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a93:	72 4d                	jb     ae2 <malloc+0xa6>
      if(p->s.size == nunits)
 a95:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a98:	8b 40 04             	mov    0x4(%eax),%eax
 a9b:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a9e:	75 0c                	jne    aac <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 aa0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aa3:	8b 10                	mov    (%eax),%edx
 aa5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 aa8:	89 10                	mov    %edx,(%eax)
 aaa:	eb 26                	jmp    ad2 <malloc+0x96>
      else {
        p->s.size -= nunits;
 aac:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aaf:	8b 40 04             	mov    0x4(%eax),%eax
 ab2:	2b 45 ec             	sub    -0x14(%ebp),%eax
 ab5:	89 c2                	mov    %eax,%edx
 ab7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aba:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 abd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ac0:	8b 40 04             	mov    0x4(%eax),%eax
 ac3:	c1 e0 03             	shl    $0x3,%eax
 ac6:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 ac9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 acc:	8b 55 ec             	mov    -0x14(%ebp),%edx
 acf:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 ad2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 ad5:	a3 54 0e 00 00       	mov    %eax,0xe54
      return (void*)(p + 1);
 ada:	8b 45 f4             	mov    -0xc(%ebp),%eax
 add:	83 c0 08             	add    $0x8,%eax
 ae0:	eb 38                	jmp    b1a <malloc+0xde>
    }
    if(p == freep)
 ae2:	a1 54 0e 00 00       	mov    0xe54,%eax
 ae7:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 aea:	75 1b                	jne    b07 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 aec:	8b 45 ec             	mov    -0x14(%ebp),%eax
 aef:	89 04 24             	mov    %eax,(%esp)
 af2:	e8 ed fe ff ff       	call   9e4 <morecore>
 af7:	89 45 f4             	mov    %eax,-0xc(%ebp)
 afa:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 afe:	75 07                	jne    b07 <malloc+0xcb>
        return 0;
 b00:	b8 00 00 00 00       	mov    $0x0,%eax
 b05:	eb 13                	jmp    b1a <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b07:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b0a:	89 45 f0             	mov    %eax,-0x10(%ebp)
 b0d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b10:	8b 00                	mov    (%eax),%eax
 b12:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 b15:	e9 70 ff ff ff       	jmp    a8a <malloc+0x4e>
}
 b1a:	c9                   	leave  
 b1b:	c3                   	ret    
