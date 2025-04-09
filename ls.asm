
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
   d:	e8 4a 05 00 00       	call   55c <strlen>
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
  3c:	e8 1b 05 00 00       	call   55c <strlen>
  41:	83 f8 0d             	cmp    $0xd,%eax
  44:	76 05                	jbe    4b <fmtname+0x4b>
    return p;
  46:	8b 45 f4             	mov    -0xc(%ebp),%eax
  49:	eb 5f                	jmp    aa <fmtname+0xaa>
  memmove(buf, p, strlen(p));
  4b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  4e:	89 04 24             	mov    %eax,(%esp)
  51:	e8 06 05 00 00       	call   55c <strlen>
  56:	89 44 24 08          	mov    %eax,0x8(%esp)
  5a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  5d:	89 44 24 04          	mov    %eax,0x4(%esp)
  61:	c7 04 24 e0 0f 00 00 	movl   $0xfe0,(%esp)
  68:	e8 7e 06 00 00       	call   6eb <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  6d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  70:	89 04 24             	mov    %eax,(%esp)
  73:	e8 e4 04 00 00       	call   55c <strlen>
  78:	ba 0e 00 00 00       	mov    $0xe,%edx
  7d:	89 d3                	mov    %edx,%ebx
  7f:	29 c3                	sub    %eax,%ebx
  81:	8b 45 f4             	mov    -0xc(%ebp),%eax
  84:	89 04 24             	mov    %eax,(%esp)
  87:	e8 d0 04 00 00       	call   55c <strlen>
  8c:	05 e0 0f 00 00       	add    $0xfe0,%eax
  91:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  95:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
  9c:	00 
  9d:	89 04 24             	mov    %eax,(%esp)
  a0:	e8 de 04 00 00       	call   583 <memset>
  return buf;
  a5:	b8 e0 0f 00 00       	mov    $0xfe0,%eax
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
  ca:	e8 a1 06 00 00       	call   770 <open>
  cf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  d2:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  d6:	79 20                	jns    f8 <ls+0x48>
    printf(2, "ls: cannot open %s\n", path);
  d8:	8b 45 08             	mov    0x8(%ebp),%eax
  db:	89 44 24 08          	mov    %eax,0x8(%esp)
  df:	c7 44 24 04 8c 0c 00 	movl   $0xc8c,0x4(%esp)
  e6:	00 
  e7:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  ee:	e8 cd 07 00 00       	call   8c0 <printf>
    return;
  f3:	e9 01 02 00 00       	jmp    2f9 <ls+0x249>
  }

  if(fstat(fd, &st) < 0){
  f8:	8d 85 bc fd ff ff    	lea    -0x244(%ebp),%eax
  fe:	89 44 24 04          	mov    %eax,0x4(%esp)
 102:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 105:	89 04 24             	mov    %eax,(%esp)
 108:	e8 7b 06 00 00       	call   788 <fstat>
 10d:	85 c0                	test   %eax,%eax
 10f:	79 2b                	jns    13c <ls+0x8c>
    printf(2, "ls: cannot stat %s\n", path);
 111:	8b 45 08             	mov    0x8(%ebp),%eax
 114:	89 44 24 08          	mov    %eax,0x8(%esp)
 118:	c7 44 24 04 a0 0c 00 	movl   $0xca0,0x4(%esp)
 11f:	00 
 120:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 127:	e8 94 07 00 00       	call   8c0 <printf>
    close(fd);
 12c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 12f:	89 04 24             	mov    %eax,(%esp)
 132:	e8 21 06 00 00       	call   758 <close>
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
 183:	c7 44 24 04 b4 0c 00 	movl   $0xcb4,0x4(%esp)
 18a:	00 
 18b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 192:	e8 29 07 00 00       	call   8c0 <printf>
    break;
 197:	e9 52 01 00 00       	jmp    2ee <ls+0x23e>

  case T_DIR:
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 19c:	8b 45 08             	mov    0x8(%ebp),%eax
 19f:	89 04 24             	mov    %eax,(%esp)
 1a2:	e8 b5 03 00 00       	call   55c <strlen>
 1a7:	83 c0 10             	add    $0x10,%eax
 1aa:	3d 00 02 00 00       	cmp    $0x200,%eax
 1af:	76 19                	jbe    1ca <ls+0x11a>
      printf(1, "ls: path too long\n");
 1b1:	c7 44 24 04 c1 0c 00 	movl   $0xcc1,0x4(%esp)
 1b8:	00 
 1b9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1c0:	e8 fb 06 00 00       	call   8c0 <printf>
      break;
 1c5:	e9 24 01 00 00       	jmp    2ee <ls+0x23e>
    }
    strcpy(buf, path);
 1ca:	8b 45 08             	mov    0x8(%ebp),%eax
 1cd:	89 44 24 04          	mov    %eax,0x4(%esp)
 1d1:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 1d7:	89 04 24             	mov    %eax,(%esp)
 1da:	e8 0e 03 00 00       	call   4ed <strcpy>
    p = buf+strlen(buf);
 1df:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 1e5:	89 04 24             	mov    %eax,(%esp)
 1e8:	e8 6f 03 00 00       	call   55c <strlen>
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
 235:	e8 b1 04 00 00       	call   6eb <memmove>
      p[DIRSIZ] = 0;
 23a:	8b 45 e0             	mov    -0x20(%ebp),%eax
 23d:	83 c0 0e             	add    $0xe,%eax
 240:	c6 00 00             	movb   $0x0,(%eax)
      if(stat(buf, &st) < 0){
 243:	8d 85 bc fd ff ff    	lea    -0x244(%ebp),%eax
 249:	89 44 24 04          	mov    %eax,0x4(%esp)
 24d:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 253:	89 04 24             	mov    %eax,(%esp)
 256:	e8 f5 03 00 00       	call   650 <stat>
 25b:	85 c0                	test   %eax,%eax
 25d:	79 20                	jns    27f <ls+0x1cf>
        printf(1, "ls: cannot stat %s\n", buf);
 25f:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 265:	89 44 24 08          	mov    %eax,0x8(%esp)
 269:	c7 44 24 04 a0 0c 00 	movl   $0xca0,0x4(%esp)
 270:	00 
 271:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 278:	e8 43 06 00 00       	call   8c0 <printf>
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
 2b3:	c7 44 24 04 b4 0c 00 	movl   $0xcb4,0x4(%esp)
 2ba:	00 
 2bb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2c2:	e8 f9 05 00 00       	call   8c0 <printf>
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 2c7:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 2ce:	00 
 2cf:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
 2d5:	89 44 24 04          	mov    %eax,0x4(%esp)
 2d9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 2dc:	89 04 24             	mov    %eax,(%esp)
 2df:	e8 64 04 00 00       	call   748 <read>
 2e4:	83 f8 10             	cmp    $0x10,%eax
 2e7:	0f 84 1c ff ff ff    	je     209 <ls+0x159>
    }
    break;
 2ed:	90                   	nop
  }
  close(fd);
 2ee:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 2f1:	89 04 24             	mov    %eax,(%esp)
 2f4:	e8 5f 04 00 00       	call   758 <close>
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
 313:	c7 04 24 d4 0c 00 00 	movl   $0xcd4,(%esp)
 31a:	e8 91 fd ff ff       	call   b0 <ls>
    exit();
 31f:	e8 0c 04 00 00       	call   730 <exit>
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
 356:	e8 d5 03 00 00       	call   730 <exit>

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
#include "user.h"
#include "x86.h"
#include "param.h"
#include "pstat.h"

void ps(){
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	57                   	push   %edi
 384:	56                   	push   %esi
 385:	53                   	push   %ebx
 386:	81 ec 2c 09 00 00    	sub    $0x92c,%esp
  
  //pstatTable pst = malloc(NPROC * sizeof(pstat_t));
  pstat_t pst[NPROC];
  getpinfo(&pst);
 38c:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 392:	89 04 24             	mov    %eax,(%esp)
 395:	e8 36 04 00 00       	call   7d0 <getpinfo>
  int i;
  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 39a:	c7 44 24 04 d6 0c 00 	movl   $0xcd6,0x4(%esp)
 3a1:	00 
 3a2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3a9:	e8 12 05 00 00       	call   8c0 <printf>
  for (i = 0; i < NPROC; i++){
 3ae:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 3b5:	e9 1e 01 00 00       	jmp    4d8 <ps+0x158>
    if (pst[i].inuse == 1){
 3ba:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 3bd:	89 d0                	mov    %edx,%eax
 3bf:	c1 e0 03             	shl    $0x3,%eax
 3c2:	01 d0                	add    %edx,%eax
 3c4:	c1 e0 02             	shl    $0x2,%eax
 3c7:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 3ca:	01 d8                	add    %ebx,%eax
 3cc:	2d 04 09 00 00       	sub    $0x904,%eax
 3d1:	8b 00                	mov    (%eax),%eax
 3d3:	83 f8 01             	cmp    $0x1,%eax
 3d6:	0f 85 f8 00 00 00    	jne    4d4 <ps+0x154>
      printf(1, "%d\t", pst[i].pid);
 3dc:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 3df:	89 d0                	mov    %edx,%eax
 3e1:	c1 e0 03             	shl    $0x3,%eax
 3e4:	01 d0                	add    %edx,%eax
 3e6:	c1 e0 02             	shl    $0x2,%eax
 3e9:	8d 75 e8             	lea    -0x18(%ebp),%esi
 3ec:	01 f0                	add    %esi,%eax
 3ee:	2d fc 08 00 00       	sub    $0x8fc,%eax
 3f3:	8b 00                	mov    (%eax),%eax
 3f5:	89 44 24 08          	mov    %eax,0x8(%esp)
 3f9:	c7 44 24 04 ef 0c 00 	movl   $0xcef,0x4(%esp)
 400:	00 
 401:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 408:	e8 b3 04 00 00       	call   8c0 <printf>
      printf(1, "%d\t", pst[i].tickets);
 40d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 410:	89 d0                	mov    %edx,%eax
 412:	c1 e0 03             	shl    $0x3,%eax
 415:	01 d0                	add    %edx,%eax
 417:	c1 e0 02             	shl    $0x2,%eax
 41a:	8d 7d e8             	lea    -0x18(%ebp),%edi
 41d:	01 f8                	add    %edi,%eax
 41f:	2d 00 09 00 00       	sub    $0x900,%eax
 424:	8b 00                	mov    (%eax),%eax
 426:	89 44 24 08          	mov    %eax,0x8(%esp)
 42a:	c7 44 24 04 ef 0c 00 	movl   $0xcef,0x4(%esp)
 431:	00 
 432:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 439:	e8 82 04 00 00       	call   8c0 <printf>
      printf(1, "%d\t", pst[i].ticks);
 43e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 441:	89 d0                	mov    %edx,%eax
 443:	c1 e0 03             	shl    $0x3,%eax
 446:	01 d0                	add    %edx,%eax
 448:	c1 e0 02             	shl    $0x2,%eax
 44b:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 44e:	01 c8                	add    %ecx,%eax
 450:	2d f8 08 00 00       	sub    $0x8f8,%eax
 455:	8b 00                	mov    (%eax),%eax
 457:	89 44 24 08          	mov    %eax,0x8(%esp)
 45b:	c7 44 24 04 ef 0c 00 	movl   $0xcef,0x4(%esp)
 462:	00 
 463:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 46a:	e8 51 04 00 00       	call   8c0 <printf>
      printf(1, "%c\t", pst[i].state);
 46f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 472:	89 d0                	mov    %edx,%eax
 474:	c1 e0 03             	shl    $0x3,%eax
 477:	01 d0                	add    %edx,%eax
 479:	c1 e0 02             	shl    $0x2,%eax
 47c:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 47f:	01 d8                	add    %ebx,%eax
 481:	2d e4 08 00 00       	sub    $0x8e4,%eax
 486:	0f b6 00             	movzbl (%eax),%eax
 489:	0f be c0             	movsbl %al,%eax
 48c:	89 44 24 08          	mov    %eax,0x8(%esp)
 490:	c7 44 24 04 f3 0c 00 	movl   $0xcf3,0x4(%esp)
 497:	00 
 498:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 49f:	e8 1c 04 00 00       	call   8c0 <printf>
      printf(1, "%s\t\n", pst[i].name);
 4a4:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 4aa:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 4ad:	89 d0                	mov    %edx,%eax
 4af:	c1 e0 03             	shl    $0x3,%eax
 4b2:	01 d0                	add    %edx,%eax
 4b4:	c1 e0 02             	shl    $0x2,%eax
 4b7:	83 c0 10             	add    $0x10,%eax
 4ba:	01 c8                	add    %ecx,%eax
 4bc:	89 44 24 08          	mov    %eax,0x8(%esp)
 4c0:	c7 44 24 04 f7 0c 00 	movl   $0xcf7,0x4(%esp)
 4c7:	00 
 4c8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 4cf:	e8 ec 03 00 00       	call   8c0 <printf>
  for (i = 0; i < NPROC; i++){
 4d4:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 4d8:	83 7d e4 3f          	cmpl   $0x3f,-0x1c(%ebp)
 4dc:	0f 8e d8 fe ff ff    	jle    3ba <ps+0x3a>
    }
  }
}
 4e2:	81 c4 2c 09 00 00    	add    $0x92c,%esp
 4e8:	5b                   	pop    %ebx
 4e9:	5e                   	pop    %esi
 4ea:	5f                   	pop    %edi
 4eb:	5d                   	pop    %ebp
 4ec:	c3                   	ret    

000004ed <strcpy>:

char*
strcpy(char *s, const char *t)
{
 4ed:	55                   	push   %ebp
 4ee:	89 e5                	mov    %esp,%ebp
 4f0:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 4f3:	8b 45 08             	mov    0x8(%ebp),%eax
 4f6:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 4f9:	90                   	nop
 4fa:	8b 45 08             	mov    0x8(%ebp),%eax
 4fd:	8d 50 01             	lea    0x1(%eax),%edx
 500:	89 55 08             	mov    %edx,0x8(%ebp)
 503:	8b 55 0c             	mov    0xc(%ebp),%edx
 506:	8d 4a 01             	lea    0x1(%edx),%ecx
 509:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 50c:	0f b6 12             	movzbl (%edx),%edx
 50f:	88 10                	mov    %dl,(%eax)
 511:	0f b6 00             	movzbl (%eax),%eax
 514:	84 c0                	test   %al,%al
 516:	75 e2                	jne    4fa <strcpy+0xd>
    ;
  return os;
 518:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 51b:	c9                   	leave  
 51c:	c3                   	ret    

0000051d <strcmp>:

int
strcmp(const char *p, const char *q)
{
 51d:	55                   	push   %ebp
 51e:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 520:	eb 08                	jmp    52a <strcmp+0xd>
    p++, q++;
 522:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 526:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 52a:	8b 45 08             	mov    0x8(%ebp),%eax
 52d:	0f b6 00             	movzbl (%eax),%eax
 530:	84 c0                	test   %al,%al
 532:	74 10                	je     544 <strcmp+0x27>
 534:	8b 45 08             	mov    0x8(%ebp),%eax
 537:	0f b6 10             	movzbl (%eax),%edx
 53a:	8b 45 0c             	mov    0xc(%ebp),%eax
 53d:	0f b6 00             	movzbl (%eax),%eax
 540:	38 c2                	cmp    %al,%dl
 542:	74 de                	je     522 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 544:	8b 45 08             	mov    0x8(%ebp),%eax
 547:	0f b6 00             	movzbl (%eax),%eax
 54a:	0f b6 d0             	movzbl %al,%edx
 54d:	8b 45 0c             	mov    0xc(%ebp),%eax
 550:	0f b6 00             	movzbl (%eax),%eax
 553:	0f b6 c0             	movzbl %al,%eax
 556:	29 c2                	sub    %eax,%edx
 558:	89 d0                	mov    %edx,%eax
}
 55a:	5d                   	pop    %ebp
 55b:	c3                   	ret    

0000055c <strlen>:

uint
strlen(const char *s)
{
 55c:	55                   	push   %ebp
 55d:	89 e5                	mov    %esp,%ebp
 55f:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 562:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 569:	eb 04                	jmp    56f <strlen+0x13>
 56b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 56f:	8b 55 fc             	mov    -0x4(%ebp),%edx
 572:	8b 45 08             	mov    0x8(%ebp),%eax
 575:	01 d0                	add    %edx,%eax
 577:	0f b6 00             	movzbl (%eax),%eax
 57a:	84 c0                	test   %al,%al
 57c:	75 ed                	jne    56b <strlen+0xf>
    ;
  return n;
 57e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 581:	c9                   	leave  
 582:	c3                   	ret    

00000583 <memset>:

void*
memset(void *dst, int c, uint n)
{
 583:	55                   	push   %ebp
 584:	89 e5                	mov    %esp,%ebp
 586:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 589:	8b 45 10             	mov    0x10(%ebp),%eax
 58c:	89 44 24 08          	mov    %eax,0x8(%esp)
 590:	8b 45 0c             	mov    0xc(%ebp),%eax
 593:	89 44 24 04          	mov    %eax,0x4(%esp)
 597:	8b 45 08             	mov    0x8(%ebp),%eax
 59a:	89 04 24             	mov    %eax,(%esp)
 59d:	e8 b9 fd ff ff       	call   35b <stosb>
  return dst;
 5a2:	8b 45 08             	mov    0x8(%ebp),%eax
}
 5a5:	c9                   	leave  
 5a6:	c3                   	ret    

000005a7 <strchr>:

char*
strchr(const char *s, char c)
{
 5a7:	55                   	push   %ebp
 5a8:	89 e5                	mov    %esp,%ebp
 5aa:	83 ec 04             	sub    $0x4,%esp
 5ad:	8b 45 0c             	mov    0xc(%ebp),%eax
 5b0:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 5b3:	eb 14                	jmp    5c9 <strchr+0x22>
    if(*s == c)
 5b5:	8b 45 08             	mov    0x8(%ebp),%eax
 5b8:	0f b6 00             	movzbl (%eax),%eax
 5bb:	3a 45 fc             	cmp    -0x4(%ebp),%al
 5be:	75 05                	jne    5c5 <strchr+0x1e>
      return (char*)s;
 5c0:	8b 45 08             	mov    0x8(%ebp),%eax
 5c3:	eb 13                	jmp    5d8 <strchr+0x31>
  for(; *s; s++)
 5c5:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 5c9:	8b 45 08             	mov    0x8(%ebp),%eax
 5cc:	0f b6 00             	movzbl (%eax),%eax
 5cf:	84 c0                	test   %al,%al
 5d1:	75 e2                	jne    5b5 <strchr+0xe>
  return 0;
 5d3:	b8 00 00 00 00       	mov    $0x0,%eax
}
 5d8:	c9                   	leave  
 5d9:	c3                   	ret    

000005da <gets>:

char*
gets(char *buf, int max)
{
 5da:	55                   	push   %ebp
 5db:	89 e5                	mov    %esp,%ebp
 5dd:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 5e0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 5e7:	eb 4c                	jmp    635 <gets+0x5b>
    cc = read(0, &c, 1);
 5e9:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5f0:	00 
 5f1:	8d 45 ef             	lea    -0x11(%ebp),%eax
 5f4:	89 44 24 04          	mov    %eax,0x4(%esp)
 5f8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 5ff:	e8 44 01 00 00       	call   748 <read>
 604:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 607:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 60b:	7f 02                	jg     60f <gets+0x35>
      break;
 60d:	eb 31                	jmp    640 <gets+0x66>
    buf[i++] = c;
 60f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 612:	8d 50 01             	lea    0x1(%eax),%edx
 615:	89 55 f4             	mov    %edx,-0xc(%ebp)
 618:	89 c2                	mov    %eax,%edx
 61a:	8b 45 08             	mov    0x8(%ebp),%eax
 61d:	01 c2                	add    %eax,%edx
 61f:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 623:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 625:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 629:	3c 0a                	cmp    $0xa,%al
 62b:	74 13                	je     640 <gets+0x66>
 62d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 631:	3c 0d                	cmp    $0xd,%al
 633:	74 0b                	je     640 <gets+0x66>
  for(i=0; i+1 < max; ){
 635:	8b 45 f4             	mov    -0xc(%ebp),%eax
 638:	83 c0 01             	add    $0x1,%eax
 63b:	3b 45 0c             	cmp    0xc(%ebp),%eax
 63e:	7c a9                	jl     5e9 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 640:	8b 55 f4             	mov    -0xc(%ebp),%edx
 643:	8b 45 08             	mov    0x8(%ebp),%eax
 646:	01 d0                	add    %edx,%eax
 648:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 64b:	8b 45 08             	mov    0x8(%ebp),%eax
}
 64e:	c9                   	leave  
 64f:	c3                   	ret    

00000650 <stat>:

int
stat(const char *n, struct stat *st)
{
 650:	55                   	push   %ebp
 651:	89 e5                	mov    %esp,%ebp
 653:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 656:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 65d:	00 
 65e:	8b 45 08             	mov    0x8(%ebp),%eax
 661:	89 04 24             	mov    %eax,(%esp)
 664:	e8 07 01 00 00       	call   770 <open>
 669:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 66c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 670:	79 07                	jns    679 <stat+0x29>
    return -1;
 672:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 677:	eb 23                	jmp    69c <stat+0x4c>
  r = fstat(fd, st);
 679:	8b 45 0c             	mov    0xc(%ebp),%eax
 67c:	89 44 24 04          	mov    %eax,0x4(%esp)
 680:	8b 45 f4             	mov    -0xc(%ebp),%eax
 683:	89 04 24             	mov    %eax,(%esp)
 686:	e8 fd 00 00 00       	call   788 <fstat>
 68b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 68e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 691:	89 04 24             	mov    %eax,(%esp)
 694:	e8 bf 00 00 00       	call   758 <close>
  return r;
 699:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 69c:	c9                   	leave  
 69d:	c3                   	ret    

0000069e <atoi>:

int
atoi(const char *s)
{
 69e:	55                   	push   %ebp
 69f:	89 e5                	mov    %esp,%ebp
 6a1:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 6a4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 6ab:	eb 25                	jmp    6d2 <atoi+0x34>
    n = n*10 + *s++ - '0';
 6ad:	8b 55 fc             	mov    -0x4(%ebp),%edx
 6b0:	89 d0                	mov    %edx,%eax
 6b2:	c1 e0 02             	shl    $0x2,%eax
 6b5:	01 d0                	add    %edx,%eax
 6b7:	01 c0                	add    %eax,%eax
 6b9:	89 c1                	mov    %eax,%ecx
 6bb:	8b 45 08             	mov    0x8(%ebp),%eax
 6be:	8d 50 01             	lea    0x1(%eax),%edx
 6c1:	89 55 08             	mov    %edx,0x8(%ebp)
 6c4:	0f b6 00             	movzbl (%eax),%eax
 6c7:	0f be c0             	movsbl %al,%eax
 6ca:	01 c8                	add    %ecx,%eax
 6cc:	83 e8 30             	sub    $0x30,%eax
 6cf:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 6d2:	8b 45 08             	mov    0x8(%ebp),%eax
 6d5:	0f b6 00             	movzbl (%eax),%eax
 6d8:	3c 2f                	cmp    $0x2f,%al
 6da:	7e 0a                	jle    6e6 <atoi+0x48>
 6dc:	8b 45 08             	mov    0x8(%ebp),%eax
 6df:	0f b6 00             	movzbl (%eax),%eax
 6e2:	3c 39                	cmp    $0x39,%al
 6e4:	7e c7                	jle    6ad <atoi+0xf>
  return n;
 6e6:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 6e9:	c9                   	leave  
 6ea:	c3                   	ret    

000006eb <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 6eb:	55                   	push   %ebp
 6ec:	89 e5                	mov    %esp,%ebp
 6ee:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 6f1:	8b 45 08             	mov    0x8(%ebp),%eax
 6f4:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 6f7:	8b 45 0c             	mov    0xc(%ebp),%eax
 6fa:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 6fd:	eb 17                	jmp    716 <memmove+0x2b>
    *dst++ = *src++;
 6ff:	8b 45 fc             	mov    -0x4(%ebp),%eax
 702:	8d 50 01             	lea    0x1(%eax),%edx
 705:	89 55 fc             	mov    %edx,-0x4(%ebp)
 708:	8b 55 f8             	mov    -0x8(%ebp),%edx
 70b:	8d 4a 01             	lea    0x1(%edx),%ecx
 70e:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 711:	0f b6 12             	movzbl (%edx),%edx
 714:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 716:	8b 45 10             	mov    0x10(%ebp),%eax
 719:	8d 50 ff             	lea    -0x1(%eax),%edx
 71c:	89 55 10             	mov    %edx,0x10(%ebp)
 71f:	85 c0                	test   %eax,%eax
 721:	7f dc                	jg     6ff <memmove+0x14>
  return vdst;
 723:	8b 45 08             	mov    0x8(%ebp),%eax
}
 726:	c9                   	leave  
 727:	c3                   	ret    

00000728 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 728:	b8 01 00 00 00       	mov    $0x1,%eax
 72d:	cd 40                	int    $0x40
 72f:	c3                   	ret    

00000730 <exit>:
SYSCALL(exit)
 730:	b8 02 00 00 00       	mov    $0x2,%eax
 735:	cd 40                	int    $0x40
 737:	c3                   	ret    

00000738 <wait>:
SYSCALL(wait)
 738:	b8 03 00 00 00       	mov    $0x3,%eax
 73d:	cd 40                	int    $0x40
 73f:	c3                   	ret    

00000740 <pipe>:
SYSCALL(pipe)
 740:	b8 04 00 00 00       	mov    $0x4,%eax
 745:	cd 40                	int    $0x40
 747:	c3                   	ret    

00000748 <read>:
SYSCALL(read)
 748:	b8 05 00 00 00       	mov    $0x5,%eax
 74d:	cd 40                	int    $0x40
 74f:	c3                   	ret    

00000750 <write>:
SYSCALL(write)
 750:	b8 10 00 00 00       	mov    $0x10,%eax
 755:	cd 40                	int    $0x40
 757:	c3                   	ret    

00000758 <close>:
SYSCALL(close)
 758:	b8 15 00 00 00       	mov    $0x15,%eax
 75d:	cd 40                	int    $0x40
 75f:	c3                   	ret    

00000760 <kill>:
SYSCALL(kill)
 760:	b8 06 00 00 00       	mov    $0x6,%eax
 765:	cd 40                	int    $0x40
 767:	c3                   	ret    

00000768 <exec>:
SYSCALL(exec)
 768:	b8 07 00 00 00       	mov    $0x7,%eax
 76d:	cd 40                	int    $0x40
 76f:	c3                   	ret    

00000770 <open>:
SYSCALL(open)
 770:	b8 0f 00 00 00       	mov    $0xf,%eax
 775:	cd 40                	int    $0x40
 777:	c3                   	ret    

00000778 <mknod>:
SYSCALL(mknod)
 778:	b8 11 00 00 00       	mov    $0x11,%eax
 77d:	cd 40                	int    $0x40
 77f:	c3                   	ret    

00000780 <unlink>:
SYSCALL(unlink)
 780:	b8 12 00 00 00       	mov    $0x12,%eax
 785:	cd 40                	int    $0x40
 787:	c3                   	ret    

00000788 <fstat>:
SYSCALL(fstat)
 788:	b8 08 00 00 00       	mov    $0x8,%eax
 78d:	cd 40                	int    $0x40
 78f:	c3                   	ret    

00000790 <link>:
SYSCALL(link)
 790:	b8 13 00 00 00       	mov    $0x13,%eax
 795:	cd 40                	int    $0x40
 797:	c3                   	ret    

00000798 <mkdir>:
SYSCALL(mkdir)
 798:	b8 14 00 00 00       	mov    $0x14,%eax
 79d:	cd 40                	int    $0x40
 79f:	c3                   	ret    

000007a0 <chdir>:
SYSCALL(chdir)
 7a0:	b8 09 00 00 00       	mov    $0x9,%eax
 7a5:	cd 40                	int    $0x40
 7a7:	c3                   	ret    

000007a8 <dup>:
SYSCALL(dup)
 7a8:	b8 0a 00 00 00       	mov    $0xa,%eax
 7ad:	cd 40                	int    $0x40
 7af:	c3                   	ret    

000007b0 <getpid>:
SYSCALL(getpid)
 7b0:	b8 0b 00 00 00       	mov    $0xb,%eax
 7b5:	cd 40                	int    $0x40
 7b7:	c3                   	ret    

000007b8 <sbrk>:
SYSCALL(sbrk)
 7b8:	b8 0c 00 00 00       	mov    $0xc,%eax
 7bd:	cd 40                	int    $0x40
 7bf:	c3                   	ret    

000007c0 <sleep>:
SYSCALL(sleep)
 7c0:	b8 0d 00 00 00       	mov    $0xd,%eax
 7c5:	cd 40                	int    $0x40
 7c7:	c3                   	ret    

000007c8 <uptime>:
SYSCALL(uptime)
 7c8:	b8 0e 00 00 00       	mov    $0xe,%eax
 7cd:	cd 40                	int    $0x40
 7cf:	c3                   	ret    

000007d0 <getpinfo>:
SYSCALL(getpinfo)
 7d0:	b8 16 00 00 00       	mov    $0x16,%eax
 7d5:	cd 40                	int    $0x40
 7d7:	c3                   	ret    

000007d8 <settickets>:
SYSCALL(settickets)
 7d8:	b8 17 00 00 00       	mov    $0x17,%eax
 7dd:	cd 40                	int    $0x40
 7df:	c3                   	ret    

000007e0 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 7e0:	55                   	push   %ebp
 7e1:	89 e5                	mov    %esp,%ebp
 7e3:	83 ec 18             	sub    $0x18,%esp
 7e6:	8b 45 0c             	mov    0xc(%ebp),%eax
 7e9:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 7ec:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 7f3:	00 
 7f4:	8d 45 f4             	lea    -0xc(%ebp),%eax
 7f7:	89 44 24 04          	mov    %eax,0x4(%esp)
 7fb:	8b 45 08             	mov    0x8(%ebp),%eax
 7fe:	89 04 24             	mov    %eax,(%esp)
 801:	e8 4a ff ff ff       	call   750 <write>
}
 806:	c9                   	leave  
 807:	c3                   	ret    

00000808 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 808:	55                   	push   %ebp
 809:	89 e5                	mov    %esp,%ebp
 80b:	56                   	push   %esi
 80c:	53                   	push   %ebx
 80d:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 810:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 817:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 81b:	74 17                	je     834 <printint+0x2c>
 81d:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 821:	79 11                	jns    834 <printint+0x2c>
    neg = 1;
 823:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 82a:	8b 45 0c             	mov    0xc(%ebp),%eax
 82d:	f7 d8                	neg    %eax
 82f:	89 45 ec             	mov    %eax,-0x14(%ebp)
 832:	eb 06                	jmp    83a <printint+0x32>
  } else {
    x = xx;
 834:	8b 45 0c             	mov    0xc(%ebp),%eax
 837:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 83a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 841:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 844:	8d 41 01             	lea    0x1(%ecx),%eax
 847:	89 45 f4             	mov    %eax,-0xc(%ebp)
 84a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 84d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 850:	ba 00 00 00 00       	mov    $0x0,%edx
 855:	f7 f3                	div    %ebx
 857:	89 d0                	mov    %edx,%eax
 859:	0f b6 80 cc 0f 00 00 	movzbl 0xfcc(%eax),%eax
 860:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 864:	8b 75 10             	mov    0x10(%ebp),%esi
 867:	8b 45 ec             	mov    -0x14(%ebp),%eax
 86a:	ba 00 00 00 00       	mov    $0x0,%edx
 86f:	f7 f6                	div    %esi
 871:	89 45 ec             	mov    %eax,-0x14(%ebp)
 874:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 878:	75 c7                	jne    841 <printint+0x39>
  if(neg)
 87a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 87e:	74 10                	je     890 <printint+0x88>
    buf[i++] = '-';
 880:	8b 45 f4             	mov    -0xc(%ebp),%eax
 883:	8d 50 01             	lea    0x1(%eax),%edx
 886:	89 55 f4             	mov    %edx,-0xc(%ebp)
 889:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 88e:	eb 1f                	jmp    8af <printint+0xa7>
 890:	eb 1d                	jmp    8af <printint+0xa7>
    putc(fd, buf[i]);
 892:	8d 55 dc             	lea    -0x24(%ebp),%edx
 895:	8b 45 f4             	mov    -0xc(%ebp),%eax
 898:	01 d0                	add    %edx,%eax
 89a:	0f b6 00             	movzbl (%eax),%eax
 89d:	0f be c0             	movsbl %al,%eax
 8a0:	89 44 24 04          	mov    %eax,0x4(%esp)
 8a4:	8b 45 08             	mov    0x8(%ebp),%eax
 8a7:	89 04 24             	mov    %eax,(%esp)
 8aa:	e8 31 ff ff ff       	call   7e0 <putc>
  while(--i >= 0)
 8af:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 8b3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8b7:	79 d9                	jns    892 <printint+0x8a>
}
 8b9:	83 c4 30             	add    $0x30,%esp
 8bc:	5b                   	pop    %ebx
 8bd:	5e                   	pop    %esi
 8be:	5d                   	pop    %ebp
 8bf:	c3                   	ret    

000008c0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 8c0:	55                   	push   %ebp
 8c1:	89 e5                	mov    %esp,%ebp
 8c3:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 8c6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 8cd:	8d 45 0c             	lea    0xc(%ebp),%eax
 8d0:	83 c0 04             	add    $0x4,%eax
 8d3:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 8d6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 8dd:	e9 7c 01 00 00       	jmp    a5e <printf+0x19e>
    c = fmt[i] & 0xff;
 8e2:	8b 55 0c             	mov    0xc(%ebp),%edx
 8e5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8e8:	01 d0                	add    %edx,%eax
 8ea:	0f b6 00             	movzbl (%eax),%eax
 8ed:	0f be c0             	movsbl %al,%eax
 8f0:	25 ff 00 00 00       	and    $0xff,%eax
 8f5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 8f8:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 8fc:	75 2c                	jne    92a <printf+0x6a>
      if(c == '%'){
 8fe:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 902:	75 0c                	jne    910 <printf+0x50>
        state = '%';
 904:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 90b:	e9 4a 01 00 00       	jmp    a5a <printf+0x19a>
      } else {
        putc(fd, c);
 910:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 913:	0f be c0             	movsbl %al,%eax
 916:	89 44 24 04          	mov    %eax,0x4(%esp)
 91a:	8b 45 08             	mov    0x8(%ebp),%eax
 91d:	89 04 24             	mov    %eax,(%esp)
 920:	e8 bb fe ff ff       	call   7e0 <putc>
 925:	e9 30 01 00 00       	jmp    a5a <printf+0x19a>
      }
    } else if(state == '%'){
 92a:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 92e:	0f 85 26 01 00 00    	jne    a5a <printf+0x19a>
      if(c == 'd'){
 934:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 938:	75 2d                	jne    967 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 93a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 93d:	8b 00                	mov    (%eax),%eax
 93f:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 946:	00 
 947:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 94e:	00 
 94f:	89 44 24 04          	mov    %eax,0x4(%esp)
 953:	8b 45 08             	mov    0x8(%ebp),%eax
 956:	89 04 24             	mov    %eax,(%esp)
 959:	e8 aa fe ff ff       	call   808 <printint>
        ap++;
 95e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 962:	e9 ec 00 00 00       	jmp    a53 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 967:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 96b:	74 06                	je     973 <printf+0xb3>
 96d:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 971:	75 2d                	jne    9a0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 973:	8b 45 e8             	mov    -0x18(%ebp),%eax
 976:	8b 00                	mov    (%eax),%eax
 978:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 97f:	00 
 980:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 987:	00 
 988:	89 44 24 04          	mov    %eax,0x4(%esp)
 98c:	8b 45 08             	mov    0x8(%ebp),%eax
 98f:	89 04 24             	mov    %eax,(%esp)
 992:	e8 71 fe ff ff       	call   808 <printint>
        ap++;
 997:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 99b:	e9 b3 00 00 00       	jmp    a53 <printf+0x193>
      } else if(c == 's'){
 9a0:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 9a4:	75 45                	jne    9eb <printf+0x12b>
        s = (char*)*ap;
 9a6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 9a9:	8b 00                	mov    (%eax),%eax
 9ab:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 9ae:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 9b2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 9b6:	75 09                	jne    9c1 <printf+0x101>
          s = "(null)";
 9b8:	c7 45 f4 fc 0c 00 00 	movl   $0xcfc,-0xc(%ebp)
        while(*s != 0){
 9bf:	eb 1e                	jmp    9df <printf+0x11f>
 9c1:	eb 1c                	jmp    9df <printf+0x11f>
          putc(fd, *s);
 9c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9c6:	0f b6 00             	movzbl (%eax),%eax
 9c9:	0f be c0             	movsbl %al,%eax
 9cc:	89 44 24 04          	mov    %eax,0x4(%esp)
 9d0:	8b 45 08             	mov    0x8(%ebp),%eax
 9d3:	89 04 24             	mov    %eax,(%esp)
 9d6:	e8 05 fe ff ff       	call   7e0 <putc>
          s++;
 9db:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 9df:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9e2:	0f b6 00             	movzbl (%eax),%eax
 9e5:	84 c0                	test   %al,%al
 9e7:	75 da                	jne    9c3 <printf+0x103>
 9e9:	eb 68                	jmp    a53 <printf+0x193>
        }
      } else if(c == 'c'){
 9eb:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 9ef:	75 1d                	jne    a0e <printf+0x14e>
        putc(fd, *ap);
 9f1:	8b 45 e8             	mov    -0x18(%ebp),%eax
 9f4:	8b 00                	mov    (%eax),%eax
 9f6:	0f be c0             	movsbl %al,%eax
 9f9:	89 44 24 04          	mov    %eax,0x4(%esp)
 9fd:	8b 45 08             	mov    0x8(%ebp),%eax
 a00:	89 04 24             	mov    %eax,(%esp)
 a03:	e8 d8 fd ff ff       	call   7e0 <putc>
        ap++;
 a08:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 a0c:	eb 45                	jmp    a53 <printf+0x193>
      } else if(c == '%'){
 a0e:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 a12:	75 17                	jne    a2b <printf+0x16b>
        putc(fd, c);
 a14:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 a17:	0f be c0             	movsbl %al,%eax
 a1a:	89 44 24 04          	mov    %eax,0x4(%esp)
 a1e:	8b 45 08             	mov    0x8(%ebp),%eax
 a21:	89 04 24             	mov    %eax,(%esp)
 a24:	e8 b7 fd ff ff       	call   7e0 <putc>
 a29:	eb 28                	jmp    a53 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 a2b:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 a32:	00 
 a33:	8b 45 08             	mov    0x8(%ebp),%eax
 a36:	89 04 24             	mov    %eax,(%esp)
 a39:	e8 a2 fd ff ff       	call   7e0 <putc>
        putc(fd, c);
 a3e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 a41:	0f be c0             	movsbl %al,%eax
 a44:	89 44 24 04          	mov    %eax,0x4(%esp)
 a48:	8b 45 08             	mov    0x8(%ebp),%eax
 a4b:	89 04 24             	mov    %eax,(%esp)
 a4e:	e8 8d fd ff ff       	call   7e0 <putc>
      }
      state = 0;
 a53:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 a5a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 a5e:	8b 55 0c             	mov    0xc(%ebp),%edx
 a61:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a64:	01 d0                	add    %edx,%eax
 a66:	0f b6 00             	movzbl (%eax),%eax
 a69:	84 c0                	test   %al,%al
 a6b:	0f 85 71 fe ff ff    	jne    8e2 <printf+0x22>
    }
  }
}
 a71:	c9                   	leave  
 a72:	c3                   	ret    

00000a73 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 a73:	55                   	push   %ebp
 a74:	89 e5                	mov    %esp,%ebp
 a76:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 a79:	8b 45 08             	mov    0x8(%ebp),%eax
 a7c:	83 e8 08             	sub    $0x8,%eax
 a7f:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a82:	a1 f8 0f 00 00       	mov    0xff8,%eax
 a87:	89 45 fc             	mov    %eax,-0x4(%ebp)
 a8a:	eb 24                	jmp    ab0 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a8c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a8f:	8b 00                	mov    (%eax),%eax
 a91:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 a94:	77 12                	ja     aa8 <free+0x35>
 a96:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a99:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 a9c:	77 24                	ja     ac2 <free+0x4f>
 a9e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 aa1:	8b 00                	mov    (%eax),%eax
 aa3:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 aa6:	77 1a                	ja     ac2 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 aa8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 aab:	8b 00                	mov    (%eax),%eax
 aad:	89 45 fc             	mov    %eax,-0x4(%ebp)
 ab0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 ab3:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 ab6:	76 d4                	jbe    a8c <free+0x19>
 ab8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 abb:	8b 00                	mov    (%eax),%eax
 abd:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 ac0:	76 ca                	jbe    a8c <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 ac2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 ac5:	8b 40 04             	mov    0x4(%eax),%eax
 ac8:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 acf:	8b 45 f8             	mov    -0x8(%ebp),%eax
 ad2:	01 c2                	add    %eax,%edx
 ad4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ad7:	8b 00                	mov    (%eax),%eax
 ad9:	39 c2                	cmp    %eax,%edx
 adb:	75 24                	jne    b01 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 add:	8b 45 f8             	mov    -0x8(%ebp),%eax
 ae0:	8b 50 04             	mov    0x4(%eax),%edx
 ae3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ae6:	8b 00                	mov    (%eax),%eax
 ae8:	8b 40 04             	mov    0x4(%eax),%eax
 aeb:	01 c2                	add    %eax,%edx
 aed:	8b 45 f8             	mov    -0x8(%ebp),%eax
 af0:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 af3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 af6:	8b 00                	mov    (%eax),%eax
 af8:	8b 10                	mov    (%eax),%edx
 afa:	8b 45 f8             	mov    -0x8(%ebp),%eax
 afd:	89 10                	mov    %edx,(%eax)
 aff:	eb 0a                	jmp    b0b <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 b01:	8b 45 fc             	mov    -0x4(%ebp),%eax
 b04:	8b 10                	mov    (%eax),%edx
 b06:	8b 45 f8             	mov    -0x8(%ebp),%eax
 b09:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 b0b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 b0e:	8b 40 04             	mov    0x4(%eax),%eax
 b11:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 b18:	8b 45 fc             	mov    -0x4(%ebp),%eax
 b1b:	01 d0                	add    %edx,%eax
 b1d:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 b20:	75 20                	jne    b42 <free+0xcf>
    p->s.size += bp->s.size;
 b22:	8b 45 fc             	mov    -0x4(%ebp),%eax
 b25:	8b 50 04             	mov    0x4(%eax),%edx
 b28:	8b 45 f8             	mov    -0x8(%ebp),%eax
 b2b:	8b 40 04             	mov    0x4(%eax),%eax
 b2e:	01 c2                	add    %eax,%edx
 b30:	8b 45 fc             	mov    -0x4(%ebp),%eax
 b33:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 b36:	8b 45 f8             	mov    -0x8(%ebp),%eax
 b39:	8b 10                	mov    (%eax),%edx
 b3b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 b3e:	89 10                	mov    %edx,(%eax)
 b40:	eb 08                	jmp    b4a <free+0xd7>
  } else
    p->s.ptr = bp;
 b42:	8b 45 fc             	mov    -0x4(%ebp),%eax
 b45:	8b 55 f8             	mov    -0x8(%ebp),%edx
 b48:	89 10                	mov    %edx,(%eax)
  freep = p;
 b4a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 b4d:	a3 f8 0f 00 00       	mov    %eax,0xff8
}
 b52:	c9                   	leave  
 b53:	c3                   	ret    

00000b54 <morecore>:

static Header*
morecore(uint nu)
{
 b54:	55                   	push   %ebp
 b55:	89 e5                	mov    %esp,%ebp
 b57:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 b5a:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 b61:	77 07                	ja     b6a <morecore+0x16>
    nu = 4096;
 b63:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 b6a:	8b 45 08             	mov    0x8(%ebp),%eax
 b6d:	c1 e0 03             	shl    $0x3,%eax
 b70:	89 04 24             	mov    %eax,(%esp)
 b73:	e8 40 fc ff ff       	call   7b8 <sbrk>
 b78:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 b7b:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 b7f:	75 07                	jne    b88 <morecore+0x34>
    return 0;
 b81:	b8 00 00 00 00       	mov    $0x0,%eax
 b86:	eb 22                	jmp    baa <morecore+0x56>
  hp = (Header*)p;
 b88:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b8b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 b8e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b91:	8b 55 08             	mov    0x8(%ebp),%edx
 b94:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 b97:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b9a:	83 c0 08             	add    $0x8,%eax
 b9d:	89 04 24             	mov    %eax,(%esp)
 ba0:	e8 ce fe ff ff       	call   a73 <free>
  return freep;
 ba5:	a1 f8 0f 00 00       	mov    0xff8,%eax
}
 baa:	c9                   	leave  
 bab:	c3                   	ret    

00000bac <malloc>:

void*
malloc(uint nbytes)
{
 bac:	55                   	push   %ebp
 bad:	89 e5                	mov    %esp,%ebp
 baf:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 bb2:	8b 45 08             	mov    0x8(%ebp),%eax
 bb5:	83 c0 07             	add    $0x7,%eax
 bb8:	c1 e8 03             	shr    $0x3,%eax
 bbb:	83 c0 01             	add    $0x1,%eax
 bbe:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 bc1:	a1 f8 0f 00 00       	mov    0xff8,%eax
 bc6:	89 45 f0             	mov    %eax,-0x10(%ebp)
 bc9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 bcd:	75 23                	jne    bf2 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 bcf:	c7 45 f0 f0 0f 00 00 	movl   $0xff0,-0x10(%ebp)
 bd6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 bd9:	a3 f8 0f 00 00       	mov    %eax,0xff8
 bde:	a1 f8 0f 00 00       	mov    0xff8,%eax
 be3:	a3 f0 0f 00 00       	mov    %eax,0xff0
    base.s.size = 0;
 be8:	c7 05 f4 0f 00 00 00 	movl   $0x0,0xff4
 bef:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 bf2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 bf5:	8b 00                	mov    (%eax),%eax
 bf7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 bfa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bfd:	8b 40 04             	mov    0x4(%eax),%eax
 c00:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 c03:	72 4d                	jb     c52 <malloc+0xa6>
      if(p->s.size == nunits)
 c05:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c08:	8b 40 04             	mov    0x4(%eax),%eax
 c0b:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 c0e:	75 0c                	jne    c1c <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 c10:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c13:	8b 10                	mov    (%eax),%edx
 c15:	8b 45 f0             	mov    -0x10(%ebp),%eax
 c18:	89 10                	mov    %edx,(%eax)
 c1a:	eb 26                	jmp    c42 <malloc+0x96>
      else {
        p->s.size -= nunits;
 c1c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c1f:	8b 40 04             	mov    0x4(%eax),%eax
 c22:	2b 45 ec             	sub    -0x14(%ebp),%eax
 c25:	89 c2                	mov    %eax,%edx
 c27:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c2a:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 c2d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c30:	8b 40 04             	mov    0x4(%eax),%eax
 c33:	c1 e0 03             	shl    $0x3,%eax
 c36:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 c39:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c3c:	8b 55 ec             	mov    -0x14(%ebp),%edx
 c3f:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 c42:	8b 45 f0             	mov    -0x10(%ebp),%eax
 c45:	a3 f8 0f 00 00       	mov    %eax,0xff8
      return (void*)(p + 1);
 c4a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c4d:	83 c0 08             	add    $0x8,%eax
 c50:	eb 38                	jmp    c8a <malloc+0xde>
    }
    if(p == freep)
 c52:	a1 f8 0f 00 00       	mov    0xff8,%eax
 c57:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 c5a:	75 1b                	jne    c77 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 c5c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 c5f:	89 04 24             	mov    %eax,(%esp)
 c62:	e8 ed fe ff ff       	call   b54 <morecore>
 c67:	89 45 f4             	mov    %eax,-0xc(%ebp)
 c6a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 c6e:	75 07                	jne    c77 <malloc+0xcb>
        return 0;
 c70:	b8 00 00 00 00       	mov    $0x0,%eax
 c75:	eb 13                	jmp    c8a <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c77:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c7a:	89 45 f0             	mov    %eax,-0x10(%ebp)
 c7d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c80:	8b 00                	mov    (%eax),%eax
 c82:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 c85:	e9 70 ff ff ff       	jmp    bfa <malloc+0x4e>
}
 c8a:	c9                   	leave  
 c8b:	c3                   	ret    
