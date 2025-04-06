
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <runcmd>:
struct cmd *parsecmd(char*);

// Execute cmd.  Never returns.
void
runcmd(struct cmd *cmd)
{
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	83 ec 38             	sub    $0x38,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
       6:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
       a:	75 05                	jne    11 <runcmd+0x11>
    exit();
       c:	e8 bd 10 00 00       	call   10ce <exit>

  switch(cmd->type){
      11:	8b 45 08             	mov    0x8(%ebp),%eax
      14:	8b 00                	mov    (%eax),%eax
      16:	83 f8 05             	cmp    $0x5,%eax
      19:	77 09                	ja     24 <runcmd+0x24>
      1b:	8b 04 85 58 16 00 00 	mov    0x1658(,%eax,4),%eax
      22:	ff e0                	jmp    *%eax
  default:
    panic("runcmd");
      24:	c7 04 24 2c 16 00 00 	movl   $0x162c,(%esp)
      2b:	e8 27 03 00 00       	call   357 <panic>

  case EXEC:
    ecmd = (struct execcmd*)cmd;
      30:	8b 45 08             	mov    0x8(%ebp),%eax
      33:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(ecmd->argv[0] == 0)
      36:	8b 45 f4             	mov    -0xc(%ebp),%eax
      39:	8b 40 04             	mov    0x4(%eax),%eax
      3c:	85 c0                	test   %eax,%eax
      3e:	75 05                	jne    45 <runcmd+0x45>
      exit();
      40:	e8 89 10 00 00       	call   10ce <exit>
    exec(ecmd->argv[0], ecmd->argv);
      45:	8b 45 f4             	mov    -0xc(%ebp),%eax
      48:	8d 50 04             	lea    0x4(%eax),%edx
      4b:	8b 45 f4             	mov    -0xc(%ebp),%eax
      4e:	8b 40 04             	mov    0x4(%eax),%eax
      51:	89 54 24 04          	mov    %edx,0x4(%esp)
      55:	89 04 24             	mov    %eax,(%esp)
      58:	e8 a9 10 00 00       	call   1106 <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
      5d:	8b 45 f4             	mov    -0xc(%ebp),%eax
      60:	8b 40 04             	mov    0x4(%eax),%eax
      63:	89 44 24 08          	mov    %eax,0x8(%esp)
      67:	c7 44 24 04 33 16 00 	movl   $0x1633,0x4(%esp)
      6e:	00 
      6f:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
      76:	e8 e3 11 00 00       	call   125e <printf>
    break;
      7b:	e9 86 01 00 00       	jmp    206 <runcmd+0x206>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
      80:	8b 45 08             	mov    0x8(%ebp),%eax
      83:	89 45 f0             	mov    %eax,-0x10(%ebp)
    close(rcmd->fd);
      86:	8b 45 f0             	mov    -0x10(%ebp),%eax
      89:	8b 40 14             	mov    0x14(%eax),%eax
      8c:	89 04 24             	mov    %eax,(%esp)
      8f:	e8 62 10 00 00       	call   10f6 <close>
    if(open(rcmd->file, rcmd->mode) < 0){
      94:	8b 45 f0             	mov    -0x10(%ebp),%eax
      97:	8b 50 10             	mov    0x10(%eax),%edx
      9a:	8b 45 f0             	mov    -0x10(%ebp),%eax
      9d:	8b 40 08             	mov    0x8(%eax),%eax
      a0:	89 54 24 04          	mov    %edx,0x4(%esp)
      a4:	89 04 24             	mov    %eax,(%esp)
      a7:	e8 62 10 00 00       	call   110e <open>
      ac:	85 c0                	test   %eax,%eax
      ae:	79 23                	jns    d3 <runcmd+0xd3>
      printf(2, "open %s failed\n", rcmd->file);
      b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
      b3:	8b 40 08             	mov    0x8(%eax),%eax
      b6:	89 44 24 08          	mov    %eax,0x8(%esp)
      ba:	c7 44 24 04 43 16 00 	movl   $0x1643,0x4(%esp)
      c1:	00 
      c2:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
      c9:	e8 90 11 00 00       	call   125e <printf>
      exit();
      ce:	e8 fb 0f 00 00       	call   10ce <exit>
    }
    runcmd(rcmd->cmd);
      d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
      d6:	8b 40 04             	mov    0x4(%eax),%eax
      d9:	89 04 24             	mov    %eax,(%esp)
      dc:	e8 1f ff ff ff       	call   0 <runcmd>
    break;
      e1:	e9 20 01 00 00       	jmp    206 <runcmd+0x206>

  case LIST:
    lcmd = (struct listcmd*)cmd;
      e6:	8b 45 08             	mov    0x8(%ebp),%eax
      e9:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(fork1() == 0)
      ec:	e8 8c 02 00 00       	call   37d <fork1>
      f1:	85 c0                	test   %eax,%eax
      f3:	75 0e                	jne    103 <runcmd+0x103>
      runcmd(lcmd->left);
      f5:	8b 45 ec             	mov    -0x14(%ebp),%eax
      f8:	8b 40 04             	mov    0x4(%eax),%eax
      fb:	89 04 24             	mov    %eax,(%esp)
      fe:	e8 fd fe ff ff       	call   0 <runcmd>
    wait();
     103:	e8 ce 0f 00 00       	call   10d6 <wait>
    runcmd(lcmd->right);
     108:	8b 45 ec             	mov    -0x14(%ebp),%eax
     10b:	8b 40 08             	mov    0x8(%eax),%eax
     10e:	89 04 24             	mov    %eax,(%esp)
     111:	e8 ea fe ff ff       	call   0 <runcmd>
    break;
     116:	e9 eb 00 00 00       	jmp    206 <runcmd+0x206>

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
     11b:	8b 45 08             	mov    0x8(%ebp),%eax
     11e:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(pipe(p) < 0)
     121:	8d 45 dc             	lea    -0x24(%ebp),%eax
     124:	89 04 24             	mov    %eax,(%esp)
     127:	e8 b2 0f 00 00       	call   10de <pipe>
     12c:	85 c0                	test   %eax,%eax
     12e:	79 0c                	jns    13c <runcmd+0x13c>
      panic("pipe");
     130:	c7 04 24 53 16 00 00 	movl   $0x1653,(%esp)
     137:	e8 1b 02 00 00       	call   357 <panic>
    if(fork1() == 0){
     13c:	e8 3c 02 00 00       	call   37d <fork1>
     141:	85 c0                	test   %eax,%eax
     143:	75 3b                	jne    180 <runcmd+0x180>
      close(1);
     145:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     14c:	e8 a5 0f 00 00       	call   10f6 <close>
      dup(p[1]);
     151:	8b 45 e0             	mov    -0x20(%ebp),%eax
     154:	89 04 24             	mov    %eax,(%esp)
     157:	e8 ea 0f 00 00       	call   1146 <dup>
      close(p[0]);
     15c:	8b 45 dc             	mov    -0x24(%ebp),%eax
     15f:	89 04 24             	mov    %eax,(%esp)
     162:	e8 8f 0f 00 00       	call   10f6 <close>
      close(p[1]);
     167:	8b 45 e0             	mov    -0x20(%ebp),%eax
     16a:	89 04 24             	mov    %eax,(%esp)
     16d:	e8 84 0f 00 00       	call   10f6 <close>
      runcmd(pcmd->left);
     172:	8b 45 e8             	mov    -0x18(%ebp),%eax
     175:	8b 40 04             	mov    0x4(%eax),%eax
     178:	89 04 24             	mov    %eax,(%esp)
     17b:	e8 80 fe ff ff       	call   0 <runcmd>
    }
    if(fork1() == 0){
     180:	e8 f8 01 00 00       	call   37d <fork1>
     185:	85 c0                	test   %eax,%eax
     187:	75 3b                	jne    1c4 <runcmd+0x1c4>
      close(0);
     189:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     190:	e8 61 0f 00 00       	call   10f6 <close>
      dup(p[0]);
     195:	8b 45 dc             	mov    -0x24(%ebp),%eax
     198:	89 04 24             	mov    %eax,(%esp)
     19b:	e8 a6 0f 00 00       	call   1146 <dup>
      close(p[0]);
     1a0:	8b 45 dc             	mov    -0x24(%ebp),%eax
     1a3:	89 04 24             	mov    %eax,(%esp)
     1a6:	e8 4b 0f 00 00       	call   10f6 <close>
      close(p[1]);
     1ab:	8b 45 e0             	mov    -0x20(%ebp),%eax
     1ae:	89 04 24             	mov    %eax,(%esp)
     1b1:	e8 40 0f 00 00       	call   10f6 <close>
      runcmd(pcmd->right);
     1b6:	8b 45 e8             	mov    -0x18(%ebp),%eax
     1b9:	8b 40 08             	mov    0x8(%eax),%eax
     1bc:	89 04 24             	mov    %eax,(%esp)
     1bf:	e8 3c fe ff ff       	call   0 <runcmd>
    }
    close(p[0]);
     1c4:	8b 45 dc             	mov    -0x24(%ebp),%eax
     1c7:	89 04 24             	mov    %eax,(%esp)
     1ca:	e8 27 0f 00 00       	call   10f6 <close>
    close(p[1]);
     1cf:	8b 45 e0             	mov    -0x20(%ebp),%eax
     1d2:	89 04 24             	mov    %eax,(%esp)
     1d5:	e8 1c 0f 00 00       	call   10f6 <close>
    wait();
     1da:	e8 f7 0e 00 00       	call   10d6 <wait>
    wait();
     1df:	e8 f2 0e 00 00       	call   10d6 <wait>
    break;
     1e4:	eb 20                	jmp    206 <runcmd+0x206>

  case BACK:
    bcmd = (struct backcmd*)cmd;
     1e6:	8b 45 08             	mov    0x8(%ebp),%eax
     1e9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(fork1() == 0)
     1ec:	e8 8c 01 00 00       	call   37d <fork1>
     1f1:	85 c0                	test   %eax,%eax
     1f3:	75 10                	jne    205 <runcmd+0x205>
      runcmd(bcmd->cmd);
     1f5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     1f8:	8b 40 04             	mov    0x4(%eax),%eax
     1fb:	89 04 24             	mov    %eax,(%esp)
     1fe:	e8 fd fd ff ff       	call   0 <runcmd>
    break;
     203:	eb 00                	jmp    205 <runcmd+0x205>
     205:	90                   	nop
  }
  exit();
     206:	e8 c3 0e 00 00       	call   10ce <exit>

0000020b <getcmd>:
}

int
getcmd(char *buf, int nbuf)
{
     20b:	55                   	push   %ebp
     20c:	89 e5                	mov    %esp,%ebp
     20e:	83 ec 18             	sub    $0x18,%esp
  printf(2, "$ ");
     211:	c7 44 24 04 70 16 00 	movl   $0x1670,0x4(%esp)
     218:	00 
     219:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     220:	e8 39 10 00 00       	call   125e <printf>
  memset(buf, 0, nbuf);
     225:	8b 45 0c             	mov    0xc(%ebp),%eax
     228:	89 44 24 08          	mov    %eax,0x8(%esp)
     22c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     233:	00 
     234:	8b 45 08             	mov    0x8(%ebp),%eax
     237:	89 04 24             	mov    %eax,(%esp)
     23a:	e8 e2 0c 00 00       	call   f21 <memset>
  gets(buf, nbuf);
     23f:	8b 45 0c             	mov    0xc(%ebp),%eax
     242:	89 44 24 04          	mov    %eax,0x4(%esp)
     246:	8b 45 08             	mov    0x8(%ebp),%eax
     249:	89 04 24             	mov    %eax,(%esp)
     24c:	e8 27 0d 00 00       	call   f78 <gets>
  if(buf[0] == 0) // EOF
     251:	8b 45 08             	mov    0x8(%ebp),%eax
     254:	0f b6 00             	movzbl (%eax),%eax
     257:	84 c0                	test   %al,%al
     259:	75 07                	jne    262 <getcmd+0x57>
    return -1;
     25b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     260:	eb 05                	jmp    267 <getcmd+0x5c>
  return 0;
     262:	b8 00 00 00 00       	mov    $0x0,%eax
}
     267:	c9                   	leave  
     268:	c3                   	ret    

00000269 <main>:

int
main(void)
{
     269:	55                   	push   %ebp
     26a:	89 e5                	mov    %esp,%ebp
     26c:	83 e4 f0             	and    $0xfffffff0,%esp
     26f:	83 ec 20             	sub    $0x20,%esp
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
     272:	eb 15                	jmp    289 <main+0x20>
    if(fd >= 3){
     274:	83 7c 24 1c 02       	cmpl   $0x2,0x1c(%esp)
     279:	7e 0e                	jle    289 <main+0x20>
      close(fd);
     27b:	8b 44 24 1c          	mov    0x1c(%esp),%eax
     27f:	89 04 24             	mov    %eax,(%esp)
     282:	e8 6f 0e 00 00       	call   10f6 <close>
      break;
     287:	eb 1f                	jmp    2a8 <main+0x3f>
  while((fd = open("console", O_RDWR)) >= 0){
     289:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
     290:	00 
     291:	c7 04 24 73 16 00 00 	movl   $0x1673,(%esp)
     298:	e8 71 0e 00 00       	call   110e <open>
     29d:	89 44 24 1c          	mov    %eax,0x1c(%esp)
     2a1:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
     2a6:	79 cc                	jns    274 <main+0xb>
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
     2a8:	e9 89 00 00 00       	jmp    336 <main+0xcd>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     2ad:	0f b6 05 20 1c 00 00 	movzbl 0x1c20,%eax
     2b4:	3c 63                	cmp    $0x63,%al
     2b6:	75 5c                	jne    314 <main+0xab>
     2b8:	0f b6 05 21 1c 00 00 	movzbl 0x1c21,%eax
     2bf:	3c 64                	cmp    $0x64,%al
     2c1:	75 51                	jne    314 <main+0xab>
     2c3:	0f b6 05 22 1c 00 00 	movzbl 0x1c22,%eax
     2ca:	3c 20                	cmp    $0x20,%al
     2cc:	75 46                	jne    314 <main+0xab>
      // Chdir must be called by the parent, not the child.
      buf[strlen(buf)-1] = 0;  // chop \n
     2ce:	c7 04 24 20 1c 00 00 	movl   $0x1c20,(%esp)
     2d5:	e8 20 0c 00 00       	call   efa <strlen>
     2da:	83 e8 01             	sub    $0x1,%eax
     2dd:	c6 80 20 1c 00 00 00 	movb   $0x0,0x1c20(%eax)
      if(chdir(buf+3) < 0)
     2e4:	c7 04 24 23 1c 00 00 	movl   $0x1c23,(%esp)
     2eb:	e8 4e 0e 00 00       	call   113e <chdir>
     2f0:	85 c0                	test   %eax,%eax
     2f2:	79 1e                	jns    312 <main+0xa9>
        printf(2, "cannot cd %s\n", buf+3);
     2f4:	c7 44 24 08 23 1c 00 	movl   $0x1c23,0x8(%esp)
     2fb:	00 
     2fc:	c7 44 24 04 7b 16 00 	movl   $0x167b,0x4(%esp)
     303:	00 
     304:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     30b:	e8 4e 0f 00 00       	call   125e <printf>
      continue;
     310:	eb 24                	jmp    336 <main+0xcd>
     312:	eb 22                	jmp    336 <main+0xcd>
    }
    if(fork1() == 0)
     314:	e8 64 00 00 00       	call   37d <fork1>
     319:	85 c0                	test   %eax,%eax
     31b:	75 14                	jne    331 <main+0xc8>
      runcmd(parsecmd(buf));
     31d:	c7 04 24 20 1c 00 00 	movl   $0x1c20,(%esp)
     324:	e8 c9 03 00 00       	call   6f2 <parsecmd>
     329:	89 04 24             	mov    %eax,(%esp)
     32c:	e8 cf fc ff ff       	call   0 <runcmd>
    wait();
     331:	e8 a0 0d 00 00       	call   10d6 <wait>
  while(getcmd(buf, sizeof(buf)) >= 0){
     336:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
     33d:	00 
     33e:	c7 04 24 20 1c 00 00 	movl   $0x1c20,(%esp)
     345:	e8 c1 fe ff ff       	call   20b <getcmd>
     34a:	85 c0                	test   %eax,%eax
     34c:	0f 89 5b ff ff ff    	jns    2ad <main+0x44>
  }
  exit();
     352:	e8 77 0d 00 00       	call   10ce <exit>

00000357 <panic>:
}

void
panic(char *s)
{
     357:	55                   	push   %ebp
     358:	89 e5                	mov    %esp,%ebp
     35a:	83 ec 18             	sub    $0x18,%esp
  printf(2, "%s\n", s);
     35d:	8b 45 08             	mov    0x8(%ebp),%eax
     360:	89 44 24 08          	mov    %eax,0x8(%esp)
     364:	c7 44 24 04 89 16 00 	movl   $0x1689,0x4(%esp)
     36b:	00 
     36c:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     373:	e8 e6 0e 00 00       	call   125e <printf>
  exit();
     378:	e8 51 0d 00 00       	call   10ce <exit>

0000037d <fork1>:
}

int
fork1(void)
{
     37d:	55                   	push   %ebp
     37e:	89 e5                	mov    %esp,%ebp
     380:	83 ec 28             	sub    $0x28,%esp
  int pid;

  pid = fork();
     383:	e8 3e 0d 00 00       	call   10c6 <fork>
     388:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(pid == -1)
     38b:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
     38f:	75 0c                	jne    39d <fork1+0x20>
    panic("fork");
     391:	c7 04 24 8d 16 00 00 	movl   $0x168d,(%esp)
     398:	e8 ba ff ff ff       	call   357 <panic>
  return pid;
     39d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     3a0:	c9                   	leave  
     3a1:	c3                   	ret    

000003a2 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     3a2:	55                   	push   %ebp
     3a3:	89 e5                	mov    %esp,%ebp
     3a5:	83 ec 28             	sub    $0x28,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3a8:	c7 04 24 54 00 00 00 	movl   $0x54,(%esp)
     3af:	e8 96 11 00 00       	call   154a <malloc>
     3b4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     3b7:	c7 44 24 08 54 00 00 	movl   $0x54,0x8(%esp)
     3be:	00 
     3bf:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     3c6:	00 
     3c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
     3ca:	89 04 24             	mov    %eax,(%esp)
     3cd:	e8 4f 0b 00 00       	call   f21 <memset>
  cmd->type = EXEC;
     3d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
     3d5:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  return (struct cmd*)cmd;
     3db:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     3de:	c9                   	leave  
     3df:	c3                   	ret    

000003e0 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     3e0:	55                   	push   %ebp
     3e1:	89 e5                	mov    %esp,%ebp
     3e3:	83 ec 28             	sub    $0x28,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3e6:	c7 04 24 18 00 00 00 	movl   $0x18,(%esp)
     3ed:	e8 58 11 00 00       	call   154a <malloc>
     3f2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     3f5:	c7 44 24 08 18 00 00 	movl   $0x18,0x8(%esp)
     3fc:	00 
     3fd:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     404:	00 
     405:	8b 45 f4             	mov    -0xc(%ebp),%eax
     408:	89 04 24             	mov    %eax,(%esp)
     40b:	e8 11 0b 00 00       	call   f21 <memset>
  cmd->type = REDIR;
     410:	8b 45 f4             	mov    -0xc(%ebp),%eax
     413:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
  cmd->cmd = subcmd;
     419:	8b 45 f4             	mov    -0xc(%ebp),%eax
     41c:	8b 55 08             	mov    0x8(%ebp),%edx
     41f:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->file = file;
     422:	8b 45 f4             	mov    -0xc(%ebp),%eax
     425:	8b 55 0c             	mov    0xc(%ebp),%edx
     428:	89 50 08             	mov    %edx,0x8(%eax)
  cmd->efile = efile;
     42b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     42e:	8b 55 10             	mov    0x10(%ebp),%edx
     431:	89 50 0c             	mov    %edx,0xc(%eax)
  cmd->mode = mode;
     434:	8b 45 f4             	mov    -0xc(%ebp),%eax
     437:	8b 55 14             	mov    0x14(%ebp),%edx
     43a:	89 50 10             	mov    %edx,0x10(%eax)
  cmd->fd = fd;
     43d:	8b 45 f4             	mov    -0xc(%ebp),%eax
     440:	8b 55 18             	mov    0x18(%ebp),%edx
     443:	89 50 14             	mov    %edx,0x14(%eax)
  return (struct cmd*)cmd;
     446:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     449:	c9                   	leave  
     44a:	c3                   	ret    

0000044b <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     44b:	55                   	push   %ebp
     44c:	89 e5                	mov    %esp,%ebp
     44e:	83 ec 28             	sub    $0x28,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     451:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
     458:	e8 ed 10 00 00       	call   154a <malloc>
     45d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     460:	c7 44 24 08 0c 00 00 	movl   $0xc,0x8(%esp)
     467:	00 
     468:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     46f:	00 
     470:	8b 45 f4             	mov    -0xc(%ebp),%eax
     473:	89 04 24             	mov    %eax,(%esp)
     476:	e8 a6 0a 00 00       	call   f21 <memset>
  cmd->type = PIPE;
     47b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     47e:	c7 00 03 00 00 00    	movl   $0x3,(%eax)
  cmd->left = left;
     484:	8b 45 f4             	mov    -0xc(%ebp),%eax
     487:	8b 55 08             	mov    0x8(%ebp),%edx
     48a:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
     48d:	8b 45 f4             	mov    -0xc(%ebp),%eax
     490:	8b 55 0c             	mov    0xc(%ebp),%edx
     493:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
     496:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     499:	c9                   	leave  
     49a:	c3                   	ret    

0000049b <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     49b:	55                   	push   %ebp
     49c:	89 e5                	mov    %esp,%ebp
     49e:	83 ec 28             	sub    $0x28,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     4a1:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
     4a8:	e8 9d 10 00 00       	call   154a <malloc>
     4ad:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     4b0:	c7 44 24 08 0c 00 00 	movl   $0xc,0x8(%esp)
     4b7:	00 
     4b8:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     4bf:	00 
     4c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4c3:	89 04 24             	mov    %eax,(%esp)
     4c6:	e8 56 0a 00 00       	call   f21 <memset>
  cmd->type = LIST;
     4cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4ce:	c7 00 04 00 00 00    	movl   $0x4,(%eax)
  cmd->left = left;
     4d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4d7:	8b 55 08             	mov    0x8(%ebp),%edx
     4da:	89 50 04             	mov    %edx,0x4(%eax)
  cmd->right = right;
     4dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
     4e0:	8b 55 0c             	mov    0xc(%ebp),%edx
     4e3:	89 50 08             	mov    %edx,0x8(%eax)
  return (struct cmd*)cmd;
     4e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     4e9:	c9                   	leave  
     4ea:	c3                   	ret    

000004eb <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     4eb:	55                   	push   %ebp
     4ec:	89 e5                	mov    %esp,%ebp
     4ee:	83 ec 28             	sub    $0x28,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     4f1:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
     4f8:	e8 4d 10 00 00       	call   154a <malloc>
     4fd:	89 45 f4             	mov    %eax,-0xc(%ebp)
  memset(cmd, 0, sizeof(*cmd));
     500:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
     507:	00 
     508:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     50f:	00 
     510:	8b 45 f4             	mov    -0xc(%ebp),%eax
     513:	89 04 24             	mov    %eax,(%esp)
     516:	e8 06 0a 00 00       	call   f21 <memset>
  cmd->type = BACK;
     51b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     51e:	c7 00 05 00 00 00    	movl   $0x5,(%eax)
  cmd->cmd = subcmd;
     524:	8b 45 f4             	mov    -0xc(%ebp),%eax
     527:	8b 55 08             	mov    0x8(%ebp),%edx
     52a:	89 50 04             	mov    %edx,0x4(%eax)
  return (struct cmd*)cmd;
     52d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     530:	c9                   	leave  
     531:	c3                   	ret    

00000532 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     532:	55                   	push   %ebp
     533:	89 e5                	mov    %esp,%ebp
     535:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int ret;

  s = *ps;
     538:	8b 45 08             	mov    0x8(%ebp),%eax
     53b:	8b 00                	mov    (%eax),%eax
     53d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
     540:	eb 04                	jmp    546 <gettoken+0x14>
    s++;
     542:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
     546:	8b 45 f4             	mov    -0xc(%ebp),%eax
     549:	3b 45 0c             	cmp    0xc(%ebp),%eax
     54c:	73 1d                	jae    56b <gettoken+0x39>
     54e:	8b 45 f4             	mov    -0xc(%ebp),%eax
     551:	0f b6 00             	movzbl (%eax),%eax
     554:	0f be c0             	movsbl %al,%eax
     557:	89 44 24 04          	mov    %eax,0x4(%esp)
     55b:	c7 04 24 fc 1b 00 00 	movl   $0x1bfc,(%esp)
     562:	e8 de 09 00 00       	call   f45 <strchr>
     567:	85 c0                	test   %eax,%eax
     569:	75 d7                	jne    542 <gettoken+0x10>
  if(q)
     56b:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
     56f:	74 08                	je     579 <gettoken+0x47>
    *q = s;
     571:	8b 45 10             	mov    0x10(%ebp),%eax
     574:	8b 55 f4             	mov    -0xc(%ebp),%edx
     577:	89 10                	mov    %edx,(%eax)
  ret = *s;
     579:	8b 45 f4             	mov    -0xc(%ebp),%eax
     57c:	0f b6 00             	movzbl (%eax),%eax
     57f:	0f be c0             	movsbl %al,%eax
     582:	89 45 f0             	mov    %eax,-0x10(%ebp)
  switch(*s){
     585:	8b 45 f4             	mov    -0xc(%ebp),%eax
     588:	0f b6 00             	movzbl (%eax),%eax
     58b:	0f be c0             	movsbl %al,%eax
     58e:	83 f8 29             	cmp    $0x29,%eax
     591:	7f 14                	jg     5a7 <gettoken+0x75>
     593:	83 f8 28             	cmp    $0x28,%eax
     596:	7d 28                	jge    5c0 <gettoken+0x8e>
     598:	85 c0                	test   %eax,%eax
     59a:	0f 84 94 00 00 00    	je     634 <gettoken+0x102>
     5a0:	83 f8 26             	cmp    $0x26,%eax
     5a3:	74 1b                	je     5c0 <gettoken+0x8e>
     5a5:	eb 3c                	jmp    5e3 <gettoken+0xb1>
     5a7:	83 f8 3e             	cmp    $0x3e,%eax
     5aa:	74 1a                	je     5c6 <gettoken+0x94>
     5ac:	83 f8 3e             	cmp    $0x3e,%eax
     5af:	7f 0a                	jg     5bb <gettoken+0x89>
     5b1:	83 e8 3b             	sub    $0x3b,%eax
     5b4:	83 f8 01             	cmp    $0x1,%eax
     5b7:	77 2a                	ja     5e3 <gettoken+0xb1>
     5b9:	eb 05                	jmp    5c0 <gettoken+0x8e>
     5bb:	83 f8 7c             	cmp    $0x7c,%eax
     5be:	75 23                	jne    5e3 <gettoken+0xb1>
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
     5c0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    break;
     5c4:	eb 6f                	jmp    635 <gettoken+0x103>
  case '>':
    s++;
     5c6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(*s == '>'){
     5ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
     5cd:	0f b6 00             	movzbl (%eax),%eax
     5d0:	3c 3e                	cmp    $0x3e,%al
     5d2:	75 0d                	jne    5e1 <gettoken+0xaf>
      ret = '+';
     5d4:	c7 45 f0 2b 00 00 00 	movl   $0x2b,-0x10(%ebp)
      s++;
     5db:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    }
    break;
     5df:	eb 54                	jmp    635 <gettoken+0x103>
     5e1:	eb 52                	jmp    635 <gettoken+0x103>
  default:
    ret = 'a';
     5e3:	c7 45 f0 61 00 00 00 	movl   $0x61,-0x10(%ebp)
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     5ea:	eb 04                	jmp    5f0 <gettoken+0xbe>
      s++;
     5ec:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     5f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
     5f3:	3b 45 0c             	cmp    0xc(%ebp),%eax
     5f6:	73 3a                	jae    632 <gettoken+0x100>
     5f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
     5fb:	0f b6 00             	movzbl (%eax),%eax
     5fe:	0f be c0             	movsbl %al,%eax
     601:	89 44 24 04          	mov    %eax,0x4(%esp)
     605:	c7 04 24 fc 1b 00 00 	movl   $0x1bfc,(%esp)
     60c:	e8 34 09 00 00       	call   f45 <strchr>
     611:	85 c0                	test   %eax,%eax
     613:	75 1d                	jne    632 <gettoken+0x100>
     615:	8b 45 f4             	mov    -0xc(%ebp),%eax
     618:	0f b6 00             	movzbl (%eax),%eax
     61b:	0f be c0             	movsbl %al,%eax
     61e:	89 44 24 04          	mov    %eax,0x4(%esp)
     622:	c7 04 24 02 1c 00 00 	movl   $0x1c02,(%esp)
     629:	e8 17 09 00 00       	call   f45 <strchr>
     62e:	85 c0                	test   %eax,%eax
     630:	74 ba                	je     5ec <gettoken+0xba>
    break;
     632:	eb 01                	jmp    635 <gettoken+0x103>
    break;
     634:	90                   	nop
  }
  if(eq)
     635:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
     639:	74 0a                	je     645 <gettoken+0x113>
    *eq = s;
     63b:	8b 45 14             	mov    0x14(%ebp),%eax
     63e:	8b 55 f4             	mov    -0xc(%ebp),%edx
     641:	89 10                	mov    %edx,(%eax)

  while(s < es && strchr(whitespace, *s))
     643:	eb 06                	jmp    64b <gettoken+0x119>
     645:	eb 04                	jmp    64b <gettoken+0x119>
    s++;
     647:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
     64b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     64e:	3b 45 0c             	cmp    0xc(%ebp),%eax
     651:	73 1d                	jae    670 <gettoken+0x13e>
     653:	8b 45 f4             	mov    -0xc(%ebp),%eax
     656:	0f b6 00             	movzbl (%eax),%eax
     659:	0f be c0             	movsbl %al,%eax
     65c:	89 44 24 04          	mov    %eax,0x4(%esp)
     660:	c7 04 24 fc 1b 00 00 	movl   $0x1bfc,(%esp)
     667:	e8 d9 08 00 00       	call   f45 <strchr>
     66c:	85 c0                	test   %eax,%eax
     66e:	75 d7                	jne    647 <gettoken+0x115>
  *ps = s;
     670:	8b 45 08             	mov    0x8(%ebp),%eax
     673:	8b 55 f4             	mov    -0xc(%ebp),%edx
     676:	89 10                	mov    %edx,(%eax)
  return ret;
     678:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     67b:	c9                   	leave  
     67c:	c3                   	ret    

0000067d <peek>:

int
peek(char **ps, char *es, char *toks)
{
     67d:	55                   	push   %ebp
     67e:	89 e5                	mov    %esp,%ebp
     680:	83 ec 28             	sub    $0x28,%esp
  char *s;

  s = *ps;
     683:	8b 45 08             	mov    0x8(%ebp),%eax
     686:	8b 00                	mov    (%eax),%eax
     688:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
     68b:	eb 04                	jmp    691 <peek+0x14>
    s++;
     68d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  while(s < es && strchr(whitespace, *s))
     691:	8b 45 f4             	mov    -0xc(%ebp),%eax
     694:	3b 45 0c             	cmp    0xc(%ebp),%eax
     697:	73 1d                	jae    6b6 <peek+0x39>
     699:	8b 45 f4             	mov    -0xc(%ebp),%eax
     69c:	0f b6 00             	movzbl (%eax),%eax
     69f:	0f be c0             	movsbl %al,%eax
     6a2:	89 44 24 04          	mov    %eax,0x4(%esp)
     6a6:	c7 04 24 fc 1b 00 00 	movl   $0x1bfc,(%esp)
     6ad:	e8 93 08 00 00       	call   f45 <strchr>
     6b2:	85 c0                	test   %eax,%eax
     6b4:	75 d7                	jne    68d <peek+0x10>
  *ps = s;
     6b6:	8b 45 08             	mov    0x8(%ebp),%eax
     6b9:	8b 55 f4             	mov    -0xc(%ebp),%edx
     6bc:	89 10                	mov    %edx,(%eax)
  return *s && strchr(toks, *s);
     6be:	8b 45 f4             	mov    -0xc(%ebp),%eax
     6c1:	0f b6 00             	movzbl (%eax),%eax
     6c4:	84 c0                	test   %al,%al
     6c6:	74 23                	je     6eb <peek+0x6e>
     6c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
     6cb:	0f b6 00             	movzbl (%eax),%eax
     6ce:	0f be c0             	movsbl %al,%eax
     6d1:	89 44 24 04          	mov    %eax,0x4(%esp)
     6d5:	8b 45 10             	mov    0x10(%ebp),%eax
     6d8:	89 04 24             	mov    %eax,(%esp)
     6db:	e8 65 08 00 00       	call   f45 <strchr>
     6e0:	85 c0                	test   %eax,%eax
     6e2:	74 07                	je     6eb <peek+0x6e>
     6e4:	b8 01 00 00 00       	mov    $0x1,%eax
     6e9:	eb 05                	jmp    6f0 <peek+0x73>
     6eb:	b8 00 00 00 00       	mov    $0x0,%eax
}
     6f0:	c9                   	leave  
     6f1:	c3                   	ret    

000006f2 <parsecmd>:
struct cmd *parseexec(char**, char*);
struct cmd *nulterminate(struct cmd*);

struct cmd*
parsecmd(char *s)
{
     6f2:	55                   	push   %ebp
     6f3:	89 e5                	mov    %esp,%ebp
     6f5:	53                   	push   %ebx
     6f6:	83 ec 24             	sub    $0x24,%esp
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
     6f9:	8b 5d 08             	mov    0x8(%ebp),%ebx
     6fc:	8b 45 08             	mov    0x8(%ebp),%eax
     6ff:	89 04 24             	mov    %eax,(%esp)
     702:	e8 f3 07 00 00       	call   efa <strlen>
     707:	01 d8                	add    %ebx,%eax
     709:	89 45 f4             	mov    %eax,-0xc(%ebp)
  cmd = parseline(&s, es);
     70c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     70f:	89 44 24 04          	mov    %eax,0x4(%esp)
     713:	8d 45 08             	lea    0x8(%ebp),%eax
     716:	89 04 24             	mov    %eax,(%esp)
     719:	e8 60 00 00 00       	call   77e <parseline>
     71e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  peek(&s, es, "");
     721:	c7 44 24 08 92 16 00 	movl   $0x1692,0x8(%esp)
     728:	00 
     729:	8b 45 f4             	mov    -0xc(%ebp),%eax
     72c:	89 44 24 04          	mov    %eax,0x4(%esp)
     730:	8d 45 08             	lea    0x8(%ebp),%eax
     733:	89 04 24             	mov    %eax,(%esp)
     736:	e8 42 ff ff ff       	call   67d <peek>
  if(s != es){
     73b:	8b 45 08             	mov    0x8(%ebp),%eax
     73e:	3b 45 f4             	cmp    -0xc(%ebp),%eax
     741:	74 27                	je     76a <parsecmd+0x78>
    printf(2, "leftovers: %s\n", s);
     743:	8b 45 08             	mov    0x8(%ebp),%eax
     746:	89 44 24 08          	mov    %eax,0x8(%esp)
     74a:	c7 44 24 04 93 16 00 	movl   $0x1693,0x4(%esp)
     751:	00 
     752:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     759:	e8 00 0b 00 00       	call   125e <printf>
    panic("syntax");
     75e:	c7 04 24 a2 16 00 00 	movl   $0x16a2,(%esp)
     765:	e8 ed fb ff ff       	call   357 <panic>
  }
  nulterminate(cmd);
     76a:	8b 45 f0             	mov    -0x10(%ebp),%eax
     76d:	89 04 24             	mov    %eax,(%esp)
     770:	e8 a3 04 00 00       	call   c18 <nulterminate>
  return cmd;
     775:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     778:	83 c4 24             	add    $0x24,%esp
     77b:	5b                   	pop    %ebx
     77c:	5d                   	pop    %ebp
     77d:	c3                   	ret    

0000077e <parseline>:

struct cmd*
parseline(char **ps, char *es)
{
     77e:	55                   	push   %ebp
     77f:	89 e5                	mov    %esp,%ebp
     781:	83 ec 28             	sub    $0x28,%esp
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
     784:	8b 45 0c             	mov    0xc(%ebp),%eax
     787:	89 44 24 04          	mov    %eax,0x4(%esp)
     78b:	8b 45 08             	mov    0x8(%ebp),%eax
     78e:	89 04 24             	mov    %eax,(%esp)
     791:	e8 bc 00 00 00       	call   852 <parsepipe>
     796:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(peek(ps, es, "&")){
     799:	eb 30                	jmp    7cb <parseline+0x4d>
    gettoken(ps, es, 0, 0);
     79b:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     7a2:	00 
     7a3:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     7aa:	00 
     7ab:	8b 45 0c             	mov    0xc(%ebp),%eax
     7ae:	89 44 24 04          	mov    %eax,0x4(%esp)
     7b2:	8b 45 08             	mov    0x8(%ebp),%eax
     7b5:	89 04 24             	mov    %eax,(%esp)
     7b8:	e8 75 fd ff ff       	call   532 <gettoken>
    cmd = backcmd(cmd);
     7bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
     7c0:	89 04 24             	mov    %eax,(%esp)
     7c3:	e8 23 fd ff ff       	call   4eb <backcmd>
     7c8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  while(peek(ps, es, "&")){
     7cb:	c7 44 24 08 a9 16 00 	movl   $0x16a9,0x8(%esp)
     7d2:	00 
     7d3:	8b 45 0c             	mov    0xc(%ebp),%eax
     7d6:	89 44 24 04          	mov    %eax,0x4(%esp)
     7da:	8b 45 08             	mov    0x8(%ebp),%eax
     7dd:	89 04 24             	mov    %eax,(%esp)
     7e0:	e8 98 fe ff ff       	call   67d <peek>
     7e5:	85 c0                	test   %eax,%eax
     7e7:	75 b2                	jne    79b <parseline+0x1d>
  }
  if(peek(ps, es, ";")){
     7e9:	c7 44 24 08 ab 16 00 	movl   $0x16ab,0x8(%esp)
     7f0:	00 
     7f1:	8b 45 0c             	mov    0xc(%ebp),%eax
     7f4:	89 44 24 04          	mov    %eax,0x4(%esp)
     7f8:	8b 45 08             	mov    0x8(%ebp),%eax
     7fb:	89 04 24             	mov    %eax,(%esp)
     7fe:	e8 7a fe ff ff       	call   67d <peek>
     803:	85 c0                	test   %eax,%eax
     805:	74 46                	je     84d <parseline+0xcf>
    gettoken(ps, es, 0, 0);
     807:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     80e:	00 
     80f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     816:	00 
     817:	8b 45 0c             	mov    0xc(%ebp),%eax
     81a:	89 44 24 04          	mov    %eax,0x4(%esp)
     81e:	8b 45 08             	mov    0x8(%ebp),%eax
     821:	89 04 24             	mov    %eax,(%esp)
     824:	e8 09 fd ff ff       	call   532 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     829:	8b 45 0c             	mov    0xc(%ebp),%eax
     82c:	89 44 24 04          	mov    %eax,0x4(%esp)
     830:	8b 45 08             	mov    0x8(%ebp),%eax
     833:	89 04 24             	mov    %eax,(%esp)
     836:	e8 43 ff ff ff       	call   77e <parseline>
     83b:	89 44 24 04          	mov    %eax,0x4(%esp)
     83f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     842:	89 04 24             	mov    %eax,(%esp)
     845:	e8 51 fc ff ff       	call   49b <listcmd>
     84a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
     84d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     850:	c9                   	leave  
     851:	c3                   	ret    

00000852 <parsepipe>:

struct cmd*
parsepipe(char **ps, char *es)
{
     852:	55                   	push   %ebp
     853:	89 e5                	mov    %esp,%ebp
     855:	83 ec 28             	sub    $0x28,%esp
  struct cmd *cmd;

  cmd = parseexec(ps, es);
     858:	8b 45 0c             	mov    0xc(%ebp),%eax
     85b:	89 44 24 04          	mov    %eax,0x4(%esp)
     85f:	8b 45 08             	mov    0x8(%ebp),%eax
     862:	89 04 24             	mov    %eax,(%esp)
     865:	e8 68 02 00 00       	call   ad2 <parseexec>
     86a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(peek(ps, es, "|")){
     86d:	c7 44 24 08 ad 16 00 	movl   $0x16ad,0x8(%esp)
     874:	00 
     875:	8b 45 0c             	mov    0xc(%ebp),%eax
     878:	89 44 24 04          	mov    %eax,0x4(%esp)
     87c:	8b 45 08             	mov    0x8(%ebp),%eax
     87f:	89 04 24             	mov    %eax,(%esp)
     882:	e8 f6 fd ff ff       	call   67d <peek>
     887:	85 c0                	test   %eax,%eax
     889:	74 46                	je     8d1 <parsepipe+0x7f>
    gettoken(ps, es, 0, 0);
     88b:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     892:	00 
     893:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     89a:	00 
     89b:	8b 45 0c             	mov    0xc(%ebp),%eax
     89e:	89 44 24 04          	mov    %eax,0x4(%esp)
     8a2:	8b 45 08             	mov    0x8(%ebp),%eax
     8a5:	89 04 24             	mov    %eax,(%esp)
     8a8:	e8 85 fc ff ff       	call   532 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     8ad:	8b 45 0c             	mov    0xc(%ebp),%eax
     8b0:	89 44 24 04          	mov    %eax,0x4(%esp)
     8b4:	8b 45 08             	mov    0x8(%ebp),%eax
     8b7:	89 04 24             	mov    %eax,(%esp)
     8ba:	e8 93 ff ff ff       	call   852 <parsepipe>
     8bf:	89 44 24 04          	mov    %eax,0x4(%esp)
     8c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
     8c6:	89 04 24             	mov    %eax,(%esp)
     8c9:	e8 7d fb ff ff       	call   44b <pipecmd>
     8ce:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
  return cmd;
     8d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     8d4:	c9                   	leave  
     8d5:	c3                   	ret    

000008d6 <parseredirs>:

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     8d6:	55                   	push   %ebp
     8d7:	89 e5                	mov    %esp,%ebp
     8d9:	83 ec 38             	sub    $0x38,%esp
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     8dc:	e9 f6 00 00 00       	jmp    9d7 <parseredirs+0x101>
    tok = gettoken(ps, es, 0, 0);
     8e1:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     8e8:	00 
     8e9:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     8f0:	00 
     8f1:	8b 45 10             	mov    0x10(%ebp),%eax
     8f4:	89 44 24 04          	mov    %eax,0x4(%esp)
     8f8:	8b 45 0c             	mov    0xc(%ebp),%eax
     8fb:	89 04 24             	mov    %eax,(%esp)
     8fe:	e8 2f fc ff ff       	call   532 <gettoken>
     903:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(gettoken(ps, es, &q, &eq) != 'a')
     906:	8d 45 ec             	lea    -0x14(%ebp),%eax
     909:	89 44 24 0c          	mov    %eax,0xc(%esp)
     90d:	8d 45 f0             	lea    -0x10(%ebp),%eax
     910:	89 44 24 08          	mov    %eax,0x8(%esp)
     914:	8b 45 10             	mov    0x10(%ebp),%eax
     917:	89 44 24 04          	mov    %eax,0x4(%esp)
     91b:	8b 45 0c             	mov    0xc(%ebp),%eax
     91e:	89 04 24             	mov    %eax,(%esp)
     921:	e8 0c fc ff ff       	call   532 <gettoken>
     926:	83 f8 61             	cmp    $0x61,%eax
     929:	74 0c                	je     937 <parseredirs+0x61>
      panic("missing file for redirection");
     92b:	c7 04 24 af 16 00 00 	movl   $0x16af,(%esp)
     932:	e8 20 fa ff ff       	call   357 <panic>
    switch(tok){
     937:	8b 45 f4             	mov    -0xc(%ebp),%eax
     93a:	83 f8 3c             	cmp    $0x3c,%eax
     93d:	74 0f                	je     94e <parseredirs+0x78>
     93f:	83 f8 3e             	cmp    $0x3e,%eax
     942:	74 38                	je     97c <parseredirs+0xa6>
     944:	83 f8 2b             	cmp    $0x2b,%eax
     947:	74 61                	je     9aa <parseredirs+0xd4>
     949:	e9 89 00 00 00       	jmp    9d7 <parseredirs+0x101>
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     94e:	8b 55 ec             	mov    -0x14(%ebp),%edx
     951:	8b 45 f0             	mov    -0x10(%ebp),%eax
     954:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     95b:	00 
     95c:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     963:	00 
     964:	89 54 24 08          	mov    %edx,0x8(%esp)
     968:	89 44 24 04          	mov    %eax,0x4(%esp)
     96c:	8b 45 08             	mov    0x8(%ebp),%eax
     96f:	89 04 24             	mov    %eax,(%esp)
     972:	e8 69 fa ff ff       	call   3e0 <redircmd>
     977:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     97a:	eb 5b                	jmp    9d7 <parseredirs+0x101>
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     97c:	8b 55 ec             	mov    -0x14(%ebp),%edx
     97f:	8b 45 f0             	mov    -0x10(%ebp),%eax
     982:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
     989:	00 
     98a:	c7 44 24 0c 01 02 00 	movl   $0x201,0xc(%esp)
     991:	00 
     992:	89 54 24 08          	mov    %edx,0x8(%esp)
     996:	89 44 24 04          	mov    %eax,0x4(%esp)
     99a:	8b 45 08             	mov    0x8(%ebp),%eax
     99d:	89 04 24             	mov    %eax,(%esp)
     9a0:	e8 3b fa ff ff       	call   3e0 <redircmd>
     9a5:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     9a8:	eb 2d                	jmp    9d7 <parseredirs+0x101>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     9aa:	8b 55 ec             	mov    -0x14(%ebp),%edx
     9ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
     9b0:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
     9b7:	00 
     9b8:	c7 44 24 0c 01 02 00 	movl   $0x201,0xc(%esp)
     9bf:	00 
     9c0:	89 54 24 08          	mov    %edx,0x8(%esp)
     9c4:	89 44 24 04          	mov    %eax,0x4(%esp)
     9c8:	8b 45 08             	mov    0x8(%ebp),%eax
     9cb:	89 04 24             	mov    %eax,(%esp)
     9ce:	e8 0d fa ff ff       	call   3e0 <redircmd>
     9d3:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     9d6:	90                   	nop
  while(peek(ps, es, "<>")){
     9d7:	c7 44 24 08 cc 16 00 	movl   $0x16cc,0x8(%esp)
     9de:	00 
     9df:	8b 45 10             	mov    0x10(%ebp),%eax
     9e2:	89 44 24 04          	mov    %eax,0x4(%esp)
     9e6:	8b 45 0c             	mov    0xc(%ebp),%eax
     9e9:	89 04 24             	mov    %eax,(%esp)
     9ec:	e8 8c fc ff ff       	call   67d <peek>
     9f1:	85 c0                	test   %eax,%eax
     9f3:	0f 85 e8 fe ff ff    	jne    8e1 <parseredirs+0xb>
    }
  }
  return cmd;
     9f9:	8b 45 08             	mov    0x8(%ebp),%eax
}
     9fc:	c9                   	leave  
     9fd:	c3                   	ret    

000009fe <parseblock>:

struct cmd*
parseblock(char **ps, char *es)
{
     9fe:	55                   	push   %ebp
     9ff:	89 e5                	mov    %esp,%ebp
     a01:	83 ec 28             	sub    $0x28,%esp
  struct cmd *cmd;

  if(!peek(ps, es, "("))
     a04:	c7 44 24 08 cf 16 00 	movl   $0x16cf,0x8(%esp)
     a0b:	00 
     a0c:	8b 45 0c             	mov    0xc(%ebp),%eax
     a0f:	89 44 24 04          	mov    %eax,0x4(%esp)
     a13:	8b 45 08             	mov    0x8(%ebp),%eax
     a16:	89 04 24             	mov    %eax,(%esp)
     a19:	e8 5f fc ff ff       	call   67d <peek>
     a1e:	85 c0                	test   %eax,%eax
     a20:	75 0c                	jne    a2e <parseblock+0x30>
    panic("parseblock");
     a22:	c7 04 24 d1 16 00 00 	movl   $0x16d1,(%esp)
     a29:	e8 29 f9 ff ff       	call   357 <panic>
  gettoken(ps, es, 0, 0);
     a2e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     a35:	00 
     a36:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     a3d:	00 
     a3e:	8b 45 0c             	mov    0xc(%ebp),%eax
     a41:	89 44 24 04          	mov    %eax,0x4(%esp)
     a45:	8b 45 08             	mov    0x8(%ebp),%eax
     a48:	89 04 24             	mov    %eax,(%esp)
     a4b:	e8 e2 fa ff ff       	call   532 <gettoken>
  cmd = parseline(ps, es);
     a50:	8b 45 0c             	mov    0xc(%ebp),%eax
     a53:	89 44 24 04          	mov    %eax,0x4(%esp)
     a57:	8b 45 08             	mov    0x8(%ebp),%eax
     a5a:	89 04 24             	mov    %eax,(%esp)
     a5d:	e8 1c fd ff ff       	call   77e <parseline>
     a62:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(!peek(ps, es, ")"))
     a65:	c7 44 24 08 dc 16 00 	movl   $0x16dc,0x8(%esp)
     a6c:	00 
     a6d:	8b 45 0c             	mov    0xc(%ebp),%eax
     a70:	89 44 24 04          	mov    %eax,0x4(%esp)
     a74:	8b 45 08             	mov    0x8(%ebp),%eax
     a77:	89 04 24             	mov    %eax,(%esp)
     a7a:	e8 fe fb ff ff       	call   67d <peek>
     a7f:	85 c0                	test   %eax,%eax
     a81:	75 0c                	jne    a8f <parseblock+0x91>
    panic("syntax - missing )");
     a83:	c7 04 24 de 16 00 00 	movl   $0x16de,(%esp)
     a8a:	e8 c8 f8 ff ff       	call   357 <panic>
  gettoken(ps, es, 0, 0);
     a8f:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     a96:	00 
     a97:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     a9e:	00 
     a9f:	8b 45 0c             	mov    0xc(%ebp),%eax
     aa2:	89 44 24 04          	mov    %eax,0x4(%esp)
     aa6:	8b 45 08             	mov    0x8(%ebp),%eax
     aa9:	89 04 24             	mov    %eax,(%esp)
     aac:	e8 81 fa ff ff       	call   532 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     ab1:	8b 45 0c             	mov    0xc(%ebp),%eax
     ab4:	89 44 24 08          	mov    %eax,0x8(%esp)
     ab8:	8b 45 08             	mov    0x8(%ebp),%eax
     abb:	89 44 24 04          	mov    %eax,0x4(%esp)
     abf:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ac2:	89 04 24             	mov    %eax,(%esp)
     ac5:	e8 0c fe ff ff       	call   8d6 <parseredirs>
     aca:	89 45 f4             	mov    %eax,-0xc(%ebp)
  return cmd;
     acd:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
     ad0:	c9                   	leave  
     ad1:	c3                   	ret    

00000ad2 <parseexec>:

struct cmd*
parseexec(char **ps, char *es)
{
     ad2:	55                   	push   %ebp
     ad3:	89 e5                	mov    %esp,%ebp
     ad5:	83 ec 38             	sub    $0x38,%esp
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     ad8:	c7 44 24 08 cf 16 00 	movl   $0x16cf,0x8(%esp)
     adf:	00 
     ae0:	8b 45 0c             	mov    0xc(%ebp),%eax
     ae3:	89 44 24 04          	mov    %eax,0x4(%esp)
     ae7:	8b 45 08             	mov    0x8(%ebp),%eax
     aea:	89 04 24             	mov    %eax,(%esp)
     aed:	e8 8b fb ff ff       	call   67d <peek>
     af2:	85 c0                	test   %eax,%eax
     af4:	74 17                	je     b0d <parseexec+0x3b>
    return parseblock(ps, es);
     af6:	8b 45 0c             	mov    0xc(%ebp),%eax
     af9:	89 44 24 04          	mov    %eax,0x4(%esp)
     afd:	8b 45 08             	mov    0x8(%ebp),%eax
     b00:	89 04 24             	mov    %eax,(%esp)
     b03:	e8 f6 fe ff ff       	call   9fe <parseblock>
     b08:	e9 09 01 00 00       	jmp    c16 <parseexec+0x144>

  ret = execcmd();
     b0d:	e8 90 f8 ff ff       	call   3a2 <execcmd>
     b12:	89 45 f0             	mov    %eax,-0x10(%ebp)
  cmd = (struct execcmd*)ret;
     b15:	8b 45 f0             	mov    -0x10(%ebp),%eax
     b18:	89 45 ec             	mov    %eax,-0x14(%ebp)

  argc = 0;
     b1b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  ret = parseredirs(ret, ps, es);
     b22:	8b 45 0c             	mov    0xc(%ebp),%eax
     b25:	89 44 24 08          	mov    %eax,0x8(%esp)
     b29:	8b 45 08             	mov    0x8(%ebp),%eax
     b2c:	89 44 24 04          	mov    %eax,0x4(%esp)
     b30:	8b 45 f0             	mov    -0x10(%ebp),%eax
     b33:	89 04 24             	mov    %eax,(%esp)
     b36:	e8 9b fd ff ff       	call   8d6 <parseredirs>
     b3b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  while(!peek(ps, es, "|)&;")){
     b3e:	e9 8f 00 00 00       	jmp    bd2 <parseexec+0x100>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     b43:	8d 45 e0             	lea    -0x20(%ebp),%eax
     b46:	89 44 24 0c          	mov    %eax,0xc(%esp)
     b4a:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     b4d:	89 44 24 08          	mov    %eax,0x8(%esp)
     b51:	8b 45 0c             	mov    0xc(%ebp),%eax
     b54:	89 44 24 04          	mov    %eax,0x4(%esp)
     b58:	8b 45 08             	mov    0x8(%ebp),%eax
     b5b:	89 04 24             	mov    %eax,(%esp)
     b5e:	e8 cf f9 ff ff       	call   532 <gettoken>
     b63:	89 45 e8             	mov    %eax,-0x18(%ebp)
     b66:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     b6a:	75 05                	jne    b71 <parseexec+0x9f>
      break;
     b6c:	e9 83 00 00 00       	jmp    bf4 <parseexec+0x122>
    if(tok != 'a')
     b71:	83 7d e8 61          	cmpl   $0x61,-0x18(%ebp)
     b75:	74 0c                	je     b83 <parseexec+0xb1>
      panic("syntax");
     b77:	c7 04 24 a2 16 00 00 	movl   $0x16a2,(%esp)
     b7e:	e8 d4 f7 ff ff       	call   357 <panic>
    cmd->argv[argc] = q;
     b83:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
     b86:	8b 45 ec             	mov    -0x14(%ebp),%eax
     b89:	8b 55 f4             	mov    -0xc(%ebp),%edx
     b8c:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
    cmd->eargv[argc] = eq;
     b90:	8b 55 e0             	mov    -0x20(%ebp),%edx
     b93:	8b 45 ec             	mov    -0x14(%ebp),%eax
     b96:	8b 4d f4             	mov    -0xc(%ebp),%ecx
     b99:	83 c1 08             	add    $0x8,%ecx
     b9c:	89 54 88 0c          	mov    %edx,0xc(%eax,%ecx,4)
    argc++;
     ba0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(argc >= MAXARGS)
     ba4:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
     ba8:	7e 0c                	jle    bb6 <parseexec+0xe4>
      panic("too many args");
     baa:	c7 04 24 f1 16 00 00 	movl   $0x16f1,(%esp)
     bb1:	e8 a1 f7 ff ff       	call   357 <panic>
    ret = parseredirs(ret, ps, es);
     bb6:	8b 45 0c             	mov    0xc(%ebp),%eax
     bb9:	89 44 24 08          	mov    %eax,0x8(%esp)
     bbd:	8b 45 08             	mov    0x8(%ebp),%eax
     bc0:	89 44 24 04          	mov    %eax,0x4(%esp)
     bc4:	8b 45 f0             	mov    -0x10(%ebp),%eax
     bc7:	89 04 24             	mov    %eax,(%esp)
     bca:	e8 07 fd ff ff       	call   8d6 <parseredirs>
     bcf:	89 45 f0             	mov    %eax,-0x10(%ebp)
  while(!peek(ps, es, "|)&;")){
     bd2:	c7 44 24 08 ff 16 00 	movl   $0x16ff,0x8(%esp)
     bd9:	00 
     bda:	8b 45 0c             	mov    0xc(%ebp),%eax
     bdd:	89 44 24 04          	mov    %eax,0x4(%esp)
     be1:	8b 45 08             	mov    0x8(%ebp),%eax
     be4:	89 04 24             	mov    %eax,(%esp)
     be7:	e8 91 fa ff ff       	call   67d <peek>
     bec:	85 c0                	test   %eax,%eax
     bee:	0f 84 4f ff ff ff    	je     b43 <parseexec+0x71>
  }
  cmd->argv[argc] = 0;
     bf4:	8b 45 ec             	mov    -0x14(%ebp),%eax
     bf7:	8b 55 f4             	mov    -0xc(%ebp),%edx
     bfa:	c7 44 90 04 00 00 00 	movl   $0x0,0x4(%eax,%edx,4)
     c01:	00 
  cmd->eargv[argc] = 0;
     c02:	8b 45 ec             	mov    -0x14(%ebp),%eax
     c05:	8b 55 f4             	mov    -0xc(%ebp),%edx
     c08:	83 c2 08             	add    $0x8,%edx
     c0b:	c7 44 90 0c 00 00 00 	movl   $0x0,0xc(%eax,%edx,4)
     c12:	00 
  return ret;
     c13:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     c16:	c9                   	leave  
     c17:	c3                   	ret    

00000c18 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     c18:	55                   	push   %ebp
     c19:	89 e5                	mov    %esp,%ebp
     c1b:	83 ec 38             	sub    $0x38,%esp
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     c1e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
     c22:	75 0a                	jne    c2e <nulterminate+0x16>
    return 0;
     c24:	b8 00 00 00 00       	mov    $0x0,%eax
     c29:	e9 c9 00 00 00       	jmp    cf7 <nulterminate+0xdf>

  switch(cmd->type){
     c2e:	8b 45 08             	mov    0x8(%ebp),%eax
     c31:	8b 00                	mov    (%eax),%eax
     c33:	83 f8 05             	cmp    $0x5,%eax
     c36:	0f 87 b8 00 00 00    	ja     cf4 <nulterminate+0xdc>
     c3c:	8b 04 85 04 17 00 00 	mov    0x1704(,%eax,4),%eax
     c43:	ff e0                	jmp    *%eax
  case EXEC:
    ecmd = (struct execcmd*)cmd;
     c45:	8b 45 08             	mov    0x8(%ebp),%eax
     c48:	89 45 f0             	mov    %eax,-0x10(%ebp)
    for(i=0; ecmd->argv[i]; i++)
     c4b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     c52:	eb 14                	jmp    c68 <nulterminate+0x50>
      *ecmd->eargv[i] = 0;
     c54:	8b 45 f0             	mov    -0x10(%ebp),%eax
     c57:	8b 55 f4             	mov    -0xc(%ebp),%edx
     c5a:	83 c2 08             	add    $0x8,%edx
     c5d:	8b 44 90 0c          	mov    0xc(%eax,%edx,4),%eax
     c61:	c6 00 00             	movb   $0x0,(%eax)
    for(i=0; ecmd->argv[i]; i++)
     c64:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     c68:	8b 45 f0             	mov    -0x10(%ebp),%eax
     c6b:	8b 55 f4             	mov    -0xc(%ebp),%edx
     c6e:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
     c72:	85 c0                	test   %eax,%eax
     c74:	75 de                	jne    c54 <nulterminate+0x3c>
    break;
     c76:	eb 7c                	jmp    cf4 <nulterminate+0xdc>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
     c78:	8b 45 08             	mov    0x8(%ebp),%eax
     c7b:	89 45 ec             	mov    %eax,-0x14(%ebp)
    nulterminate(rcmd->cmd);
     c7e:	8b 45 ec             	mov    -0x14(%ebp),%eax
     c81:	8b 40 04             	mov    0x4(%eax),%eax
     c84:	89 04 24             	mov    %eax,(%esp)
     c87:	e8 8c ff ff ff       	call   c18 <nulterminate>
    *rcmd->efile = 0;
     c8c:	8b 45 ec             	mov    -0x14(%ebp),%eax
     c8f:	8b 40 0c             	mov    0xc(%eax),%eax
     c92:	c6 00 00             	movb   $0x0,(%eax)
    break;
     c95:	eb 5d                	jmp    cf4 <nulterminate+0xdc>

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
     c97:	8b 45 08             	mov    0x8(%ebp),%eax
     c9a:	89 45 e8             	mov    %eax,-0x18(%ebp)
    nulterminate(pcmd->left);
     c9d:	8b 45 e8             	mov    -0x18(%ebp),%eax
     ca0:	8b 40 04             	mov    0x4(%eax),%eax
     ca3:	89 04 24             	mov    %eax,(%esp)
     ca6:	e8 6d ff ff ff       	call   c18 <nulterminate>
    nulterminate(pcmd->right);
     cab:	8b 45 e8             	mov    -0x18(%ebp),%eax
     cae:	8b 40 08             	mov    0x8(%eax),%eax
     cb1:	89 04 24             	mov    %eax,(%esp)
     cb4:	e8 5f ff ff ff       	call   c18 <nulterminate>
    break;
     cb9:	eb 39                	jmp    cf4 <nulterminate+0xdc>

  case LIST:
    lcmd = (struct listcmd*)cmd;
     cbb:	8b 45 08             	mov    0x8(%ebp),%eax
     cbe:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    nulterminate(lcmd->left);
     cc1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     cc4:	8b 40 04             	mov    0x4(%eax),%eax
     cc7:	89 04 24             	mov    %eax,(%esp)
     cca:	e8 49 ff ff ff       	call   c18 <nulterminate>
    nulterminate(lcmd->right);
     ccf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     cd2:	8b 40 08             	mov    0x8(%eax),%eax
     cd5:	89 04 24             	mov    %eax,(%esp)
     cd8:	e8 3b ff ff ff       	call   c18 <nulterminate>
    break;
     cdd:	eb 15                	jmp    cf4 <nulterminate+0xdc>

  case BACK:
    bcmd = (struct backcmd*)cmd;
     cdf:	8b 45 08             	mov    0x8(%ebp),%eax
     ce2:	89 45 e0             	mov    %eax,-0x20(%ebp)
    nulterminate(bcmd->cmd);
     ce5:	8b 45 e0             	mov    -0x20(%ebp),%eax
     ce8:	8b 40 04             	mov    0x4(%eax),%eax
     ceb:	89 04 24             	mov    %eax,(%esp)
     cee:	e8 25 ff ff ff       	call   c18 <nulterminate>
    break;
     cf3:	90                   	nop
  }
  return cmd;
     cf4:	8b 45 08             	mov    0x8(%ebp),%eax
}
     cf7:	c9                   	leave  
     cf8:	c3                   	ret    

00000cf9 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
     cf9:	55                   	push   %ebp
     cfa:	89 e5                	mov    %esp,%ebp
     cfc:	57                   	push   %edi
     cfd:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
     cfe:	8b 4d 08             	mov    0x8(%ebp),%ecx
     d01:	8b 55 10             	mov    0x10(%ebp),%edx
     d04:	8b 45 0c             	mov    0xc(%ebp),%eax
     d07:	89 cb                	mov    %ecx,%ebx
     d09:	89 df                	mov    %ebx,%edi
     d0b:	89 d1                	mov    %edx,%ecx
     d0d:	fc                   	cld    
     d0e:	f3 aa                	rep stos %al,%es:(%edi)
     d10:	89 ca                	mov    %ecx,%edx
     d12:	89 fb                	mov    %edi,%ebx
     d14:	89 5d 08             	mov    %ebx,0x8(%ebp)
     d17:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
     d1a:	5b                   	pop    %ebx
     d1b:	5f                   	pop    %edi
     d1c:	5d                   	pop    %ebp
     d1d:	c3                   	ret    

00000d1e <ps>:
#include "user.h"
#include "x86.h"
#include "param.h"
#include "pstat.h"

void ps(){
     d1e:	55                   	push   %ebp
     d1f:	89 e5                	mov    %esp,%ebp
     d21:	57                   	push   %edi
     d22:	56                   	push   %esi
     d23:	53                   	push   %ebx
     d24:	81 ec 2c 09 00 00    	sub    $0x92c,%esp
  
  //pstatTable pst = malloc(NPROC * sizeof(pstat_t));
  pstat_t pst[NPROC];
  getpinfo(&pst);
     d2a:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
     d30:	89 04 24             	mov    %eax,(%esp)
     d33:	e8 36 04 00 00       	call   116e <getpinfo>
  int i;
  for (i = 0; i < NPROC; i++){
     d38:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
     d3f:	e9 32 01 00 00       	jmp    e76 <ps+0x158>
    if (pst[i].inuse == 1){
     d44:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     d47:	89 d0                	mov    %edx,%eax
     d49:	c1 e0 03             	shl    $0x3,%eax
     d4c:	01 d0                	add    %edx,%eax
     d4e:	c1 e0 02             	shl    $0x2,%eax
     d51:	8d 5d e8             	lea    -0x18(%ebp),%ebx
     d54:	01 d8                	add    %ebx,%eax
     d56:	2d 04 09 00 00       	sub    $0x904,%eax
     d5b:	8b 00                	mov    (%eax),%eax
     d5d:	83 f8 01             	cmp    $0x1,%eax
     d60:	0f 85 0c 01 00 00    	jne    e72 <ps+0x154>
      printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
     d66:	c7 44 24 04 1c 17 00 	movl   $0x171c,0x4(%esp)
     d6d:	00 
     d6e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     d75:	e8 e4 04 00 00       	call   125e <printf>
      printf(1, "%d\t", pst[i].pid);
     d7a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     d7d:	89 d0                	mov    %edx,%eax
     d7f:	c1 e0 03             	shl    $0x3,%eax
     d82:	01 d0                	add    %edx,%eax
     d84:	c1 e0 02             	shl    $0x2,%eax
     d87:	8d 75 e8             	lea    -0x18(%ebp),%esi
     d8a:	01 f0                	add    %esi,%eax
     d8c:	2d fc 08 00 00       	sub    $0x8fc,%eax
     d91:	8b 00                	mov    (%eax),%eax
     d93:	89 44 24 08          	mov    %eax,0x8(%esp)
     d97:	c7 44 24 04 35 17 00 	movl   $0x1735,0x4(%esp)
     d9e:	00 
     d9f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     da6:	e8 b3 04 00 00       	call   125e <printf>
      printf(1, "%d\t", pst[i].tickets);
     dab:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     dae:	89 d0                	mov    %edx,%eax
     db0:	c1 e0 03             	shl    $0x3,%eax
     db3:	01 d0                	add    %edx,%eax
     db5:	c1 e0 02             	shl    $0x2,%eax
     db8:	8d 7d e8             	lea    -0x18(%ebp),%edi
     dbb:	01 f8                	add    %edi,%eax
     dbd:	2d 00 09 00 00       	sub    $0x900,%eax
     dc2:	8b 00                	mov    (%eax),%eax
     dc4:	89 44 24 08          	mov    %eax,0x8(%esp)
     dc8:	c7 44 24 04 35 17 00 	movl   $0x1735,0x4(%esp)
     dcf:	00 
     dd0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     dd7:	e8 82 04 00 00       	call   125e <printf>
      printf(1, "%d\t", pst[i].ticks);
     ddc:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     ddf:	89 d0                	mov    %edx,%eax
     de1:	c1 e0 03             	shl    $0x3,%eax
     de4:	01 d0                	add    %edx,%eax
     de6:	c1 e0 02             	shl    $0x2,%eax
     de9:	8d 4d e8             	lea    -0x18(%ebp),%ecx
     dec:	01 c8                	add    %ecx,%eax
     dee:	2d f8 08 00 00       	sub    $0x8f8,%eax
     df3:	8b 00                	mov    (%eax),%eax
     df5:	89 44 24 08          	mov    %eax,0x8(%esp)
     df9:	c7 44 24 04 35 17 00 	movl   $0x1735,0x4(%esp)
     e00:	00 
     e01:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     e08:	e8 51 04 00 00       	call   125e <printf>
      printf(1, "%c\t", pst[i].state);
     e0d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     e10:	89 d0                	mov    %edx,%eax
     e12:	c1 e0 03             	shl    $0x3,%eax
     e15:	01 d0                	add    %edx,%eax
     e17:	c1 e0 02             	shl    $0x2,%eax
     e1a:	8d 5d e8             	lea    -0x18(%ebp),%ebx
     e1d:	01 d8                	add    %ebx,%eax
     e1f:	2d e4 08 00 00       	sub    $0x8e4,%eax
     e24:	0f b6 00             	movzbl (%eax),%eax
     e27:	0f be c0             	movsbl %al,%eax
     e2a:	89 44 24 08          	mov    %eax,0x8(%esp)
     e2e:	c7 44 24 04 39 17 00 	movl   $0x1739,0x4(%esp)
     e35:	00 
     e36:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     e3d:	e8 1c 04 00 00       	call   125e <printf>
      printf(1, "%s\t\n", pst[i].name);
     e42:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
     e48:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     e4b:	89 d0                	mov    %edx,%eax
     e4d:	c1 e0 03             	shl    $0x3,%eax
     e50:	01 d0                	add    %edx,%eax
     e52:	c1 e0 02             	shl    $0x2,%eax
     e55:	83 c0 10             	add    $0x10,%eax
     e58:	01 c8                	add    %ecx,%eax
     e5a:	89 44 24 08          	mov    %eax,0x8(%esp)
     e5e:	c7 44 24 04 3d 17 00 	movl   $0x173d,0x4(%esp)
     e65:	00 
     e66:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     e6d:	e8 ec 03 00 00       	call   125e <printf>
  for (i = 0; i < NPROC; i++){
     e72:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
     e76:	83 7d e4 3f          	cmpl   $0x3f,-0x1c(%ebp)
     e7a:	0f 8e c4 fe ff ff    	jle    d44 <ps+0x26>
    }
  }
}
     e80:	81 c4 2c 09 00 00    	add    $0x92c,%esp
     e86:	5b                   	pop    %ebx
     e87:	5e                   	pop    %esi
     e88:	5f                   	pop    %edi
     e89:	5d                   	pop    %ebp
     e8a:	c3                   	ret    

00000e8b <strcpy>:

char*
strcpy(char *s, const char *t)
{
     e8b:	55                   	push   %ebp
     e8c:	89 e5                	mov    %esp,%ebp
     e8e:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
     e91:	8b 45 08             	mov    0x8(%ebp),%eax
     e94:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
     e97:	90                   	nop
     e98:	8b 45 08             	mov    0x8(%ebp),%eax
     e9b:	8d 50 01             	lea    0x1(%eax),%edx
     e9e:	89 55 08             	mov    %edx,0x8(%ebp)
     ea1:	8b 55 0c             	mov    0xc(%ebp),%edx
     ea4:	8d 4a 01             	lea    0x1(%edx),%ecx
     ea7:	89 4d 0c             	mov    %ecx,0xc(%ebp)
     eaa:	0f b6 12             	movzbl (%edx),%edx
     ead:	88 10                	mov    %dl,(%eax)
     eaf:	0f b6 00             	movzbl (%eax),%eax
     eb2:	84 c0                	test   %al,%al
     eb4:	75 e2                	jne    e98 <strcpy+0xd>
    ;
  return os;
     eb6:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     eb9:	c9                   	leave  
     eba:	c3                   	ret    

00000ebb <strcmp>:

int
strcmp(const char *p, const char *q)
{
     ebb:	55                   	push   %ebp
     ebc:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
     ebe:	eb 08                	jmp    ec8 <strcmp+0xd>
    p++, q++;
     ec0:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     ec4:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
     ec8:	8b 45 08             	mov    0x8(%ebp),%eax
     ecb:	0f b6 00             	movzbl (%eax),%eax
     ece:	84 c0                	test   %al,%al
     ed0:	74 10                	je     ee2 <strcmp+0x27>
     ed2:	8b 45 08             	mov    0x8(%ebp),%eax
     ed5:	0f b6 10             	movzbl (%eax),%edx
     ed8:	8b 45 0c             	mov    0xc(%ebp),%eax
     edb:	0f b6 00             	movzbl (%eax),%eax
     ede:	38 c2                	cmp    %al,%dl
     ee0:	74 de                	je     ec0 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
     ee2:	8b 45 08             	mov    0x8(%ebp),%eax
     ee5:	0f b6 00             	movzbl (%eax),%eax
     ee8:	0f b6 d0             	movzbl %al,%edx
     eeb:	8b 45 0c             	mov    0xc(%ebp),%eax
     eee:	0f b6 00             	movzbl (%eax),%eax
     ef1:	0f b6 c0             	movzbl %al,%eax
     ef4:	29 c2                	sub    %eax,%edx
     ef6:	89 d0                	mov    %edx,%eax
}
     ef8:	5d                   	pop    %ebp
     ef9:	c3                   	ret    

00000efa <strlen>:

uint
strlen(const char *s)
{
     efa:	55                   	push   %ebp
     efb:	89 e5                	mov    %esp,%ebp
     efd:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
     f00:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
     f07:	eb 04                	jmp    f0d <strlen+0x13>
     f09:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
     f0d:	8b 55 fc             	mov    -0x4(%ebp),%edx
     f10:	8b 45 08             	mov    0x8(%ebp),%eax
     f13:	01 d0                	add    %edx,%eax
     f15:	0f b6 00             	movzbl (%eax),%eax
     f18:	84 c0                	test   %al,%al
     f1a:	75 ed                	jne    f09 <strlen+0xf>
    ;
  return n;
     f1c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     f1f:	c9                   	leave  
     f20:	c3                   	ret    

00000f21 <memset>:

void*
memset(void *dst, int c, uint n)
{
     f21:	55                   	push   %ebp
     f22:	89 e5                	mov    %esp,%ebp
     f24:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
     f27:	8b 45 10             	mov    0x10(%ebp),%eax
     f2a:	89 44 24 08          	mov    %eax,0x8(%esp)
     f2e:	8b 45 0c             	mov    0xc(%ebp),%eax
     f31:	89 44 24 04          	mov    %eax,0x4(%esp)
     f35:	8b 45 08             	mov    0x8(%ebp),%eax
     f38:	89 04 24             	mov    %eax,(%esp)
     f3b:	e8 b9 fd ff ff       	call   cf9 <stosb>
  return dst;
     f40:	8b 45 08             	mov    0x8(%ebp),%eax
}
     f43:	c9                   	leave  
     f44:	c3                   	ret    

00000f45 <strchr>:

char*
strchr(const char *s, char c)
{
     f45:	55                   	push   %ebp
     f46:	89 e5                	mov    %esp,%ebp
     f48:	83 ec 04             	sub    $0x4,%esp
     f4b:	8b 45 0c             	mov    0xc(%ebp),%eax
     f4e:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
     f51:	eb 14                	jmp    f67 <strchr+0x22>
    if(*s == c)
     f53:	8b 45 08             	mov    0x8(%ebp),%eax
     f56:	0f b6 00             	movzbl (%eax),%eax
     f59:	3a 45 fc             	cmp    -0x4(%ebp),%al
     f5c:	75 05                	jne    f63 <strchr+0x1e>
      return (char*)s;
     f5e:	8b 45 08             	mov    0x8(%ebp),%eax
     f61:	eb 13                	jmp    f76 <strchr+0x31>
  for(; *s; s++)
     f63:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     f67:	8b 45 08             	mov    0x8(%ebp),%eax
     f6a:	0f b6 00             	movzbl (%eax),%eax
     f6d:	84 c0                	test   %al,%al
     f6f:	75 e2                	jne    f53 <strchr+0xe>
  return 0;
     f71:	b8 00 00 00 00       	mov    $0x0,%eax
}
     f76:	c9                   	leave  
     f77:	c3                   	ret    

00000f78 <gets>:

char*
gets(char *buf, int max)
{
     f78:	55                   	push   %ebp
     f79:	89 e5                	mov    %esp,%ebp
     f7b:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     f7e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     f85:	eb 4c                	jmp    fd3 <gets+0x5b>
    cc = read(0, &c, 1);
     f87:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     f8e:	00 
     f8f:	8d 45 ef             	lea    -0x11(%ebp),%eax
     f92:	89 44 24 04          	mov    %eax,0x4(%esp)
     f96:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     f9d:	e8 44 01 00 00       	call   10e6 <read>
     fa2:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
     fa5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     fa9:	7f 02                	jg     fad <gets+0x35>
      break;
     fab:	eb 31                	jmp    fde <gets+0x66>
    buf[i++] = c;
     fad:	8b 45 f4             	mov    -0xc(%ebp),%eax
     fb0:	8d 50 01             	lea    0x1(%eax),%edx
     fb3:	89 55 f4             	mov    %edx,-0xc(%ebp)
     fb6:	89 c2                	mov    %eax,%edx
     fb8:	8b 45 08             	mov    0x8(%ebp),%eax
     fbb:	01 c2                	add    %eax,%edx
     fbd:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     fc1:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
     fc3:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     fc7:	3c 0a                	cmp    $0xa,%al
     fc9:	74 13                	je     fde <gets+0x66>
     fcb:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     fcf:	3c 0d                	cmp    $0xd,%al
     fd1:	74 0b                	je     fde <gets+0x66>
  for(i=0; i+1 < max; ){
     fd3:	8b 45 f4             	mov    -0xc(%ebp),%eax
     fd6:	83 c0 01             	add    $0x1,%eax
     fd9:	3b 45 0c             	cmp    0xc(%ebp),%eax
     fdc:	7c a9                	jl     f87 <gets+0xf>
      break;
  }
  buf[i] = '\0';
     fde:	8b 55 f4             	mov    -0xc(%ebp),%edx
     fe1:	8b 45 08             	mov    0x8(%ebp),%eax
     fe4:	01 d0                	add    %edx,%eax
     fe6:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
     fe9:	8b 45 08             	mov    0x8(%ebp),%eax
}
     fec:	c9                   	leave  
     fed:	c3                   	ret    

00000fee <stat>:

int
stat(const char *n, struct stat *st)
{
     fee:	55                   	push   %ebp
     fef:	89 e5                	mov    %esp,%ebp
     ff1:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     ff4:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     ffb:	00 
     ffc:	8b 45 08             	mov    0x8(%ebp),%eax
     fff:	89 04 24             	mov    %eax,(%esp)
    1002:	e8 07 01 00 00       	call   110e <open>
    1007:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
    100a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    100e:	79 07                	jns    1017 <stat+0x29>
    return -1;
    1010:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1015:	eb 23                	jmp    103a <stat+0x4c>
  r = fstat(fd, st);
    1017:	8b 45 0c             	mov    0xc(%ebp),%eax
    101a:	89 44 24 04          	mov    %eax,0x4(%esp)
    101e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1021:	89 04 24             	mov    %eax,(%esp)
    1024:	e8 fd 00 00 00       	call   1126 <fstat>
    1029:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
    102c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    102f:	89 04 24             	mov    %eax,(%esp)
    1032:	e8 bf 00 00 00       	call   10f6 <close>
  return r;
    1037:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    103a:	c9                   	leave  
    103b:	c3                   	ret    

0000103c <atoi>:

int
atoi(const char *s)
{
    103c:	55                   	push   %ebp
    103d:	89 e5                	mov    %esp,%ebp
    103f:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    1042:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    1049:	eb 25                	jmp    1070 <atoi+0x34>
    n = n*10 + *s++ - '0';
    104b:	8b 55 fc             	mov    -0x4(%ebp),%edx
    104e:	89 d0                	mov    %edx,%eax
    1050:	c1 e0 02             	shl    $0x2,%eax
    1053:	01 d0                	add    %edx,%eax
    1055:	01 c0                	add    %eax,%eax
    1057:	89 c1                	mov    %eax,%ecx
    1059:	8b 45 08             	mov    0x8(%ebp),%eax
    105c:	8d 50 01             	lea    0x1(%eax),%edx
    105f:	89 55 08             	mov    %edx,0x8(%ebp)
    1062:	0f b6 00             	movzbl (%eax),%eax
    1065:	0f be c0             	movsbl %al,%eax
    1068:	01 c8                	add    %ecx,%eax
    106a:	83 e8 30             	sub    $0x30,%eax
    106d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    1070:	8b 45 08             	mov    0x8(%ebp),%eax
    1073:	0f b6 00             	movzbl (%eax),%eax
    1076:	3c 2f                	cmp    $0x2f,%al
    1078:	7e 0a                	jle    1084 <atoi+0x48>
    107a:	8b 45 08             	mov    0x8(%ebp),%eax
    107d:	0f b6 00             	movzbl (%eax),%eax
    1080:	3c 39                	cmp    $0x39,%al
    1082:	7e c7                	jle    104b <atoi+0xf>
  return n;
    1084:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    1087:	c9                   	leave  
    1088:	c3                   	ret    

00001089 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    1089:	55                   	push   %ebp
    108a:	89 e5                	mov    %esp,%ebp
    108c:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
    108f:	8b 45 08             	mov    0x8(%ebp),%eax
    1092:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
    1095:	8b 45 0c             	mov    0xc(%ebp),%eax
    1098:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
    109b:	eb 17                	jmp    10b4 <memmove+0x2b>
    *dst++ = *src++;
    109d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    10a0:	8d 50 01             	lea    0x1(%eax),%edx
    10a3:	89 55 fc             	mov    %edx,-0x4(%ebp)
    10a6:	8b 55 f8             	mov    -0x8(%ebp),%edx
    10a9:	8d 4a 01             	lea    0x1(%edx),%ecx
    10ac:	89 4d f8             	mov    %ecx,-0x8(%ebp)
    10af:	0f b6 12             	movzbl (%edx),%edx
    10b2:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
    10b4:	8b 45 10             	mov    0x10(%ebp),%eax
    10b7:	8d 50 ff             	lea    -0x1(%eax),%edx
    10ba:	89 55 10             	mov    %edx,0x10(%ebp)
    10bd:	85 c0                	test   %eax,%eax
    10bf:	7f dc                	jg     109d <memmove+0x14>
  return vdst;
    10c1:	8b 45 08             	mov    0x8(%ebp),%eax
}
    10c4:	c9                   	leave  
    10c5:	c3                   	ret    

000010c6 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    10c6:	b8 01 00 00 00       	mov    $0x1,%eax
    10cb:	cd 40                	int    $0x40
    10cd:	c3                   	ret    

000010ce <exit>:
SYSCALL(exit)
    10ce:	b8 02 00 00 00       	mov    $0x2,%eax
    10d3:	cd 40                	int    $0x40
    10d5:	c3                   	ret    

000010d6 <wait>:
SYSCALL(wait)
    10d6:	b8 03 00 00 00       	mov    $0x3,%eax
    10db:	cd 40                	int    $0x40
    10dd:	c3                   	ret    

000010de <pipe>:
SYSCALL(pipe)
    10de:	b8 04 00 00 00       	mov    $0x4,%eax
    10e3:	cd 40                	int    $0x40
    10e5:	c3                   	ret    

000010e6 <read>:
SYSCALL(read)
    10e6:	b8 05 00 00 00       	mov    $0x5,%eax
    10eb:	cd 40                	int    $0x40
    10ed:	c3                   	ret    

000010ee <write>:
SYSCALL(write)
    10ee:	b8 10 00 00 00       	mov    $0x10,%eax
    10f3:	cd 40                	int    $0x40
    10f5:	c3                   	ret    

000010f6 <close>:
SYSCALL(close)
    10f6:	b8 15 00 00 00       	mov    $0x15,%eax
    10fb:	cd 40                	int    $0x40
    10fd:	c3                   	ret    

000010fe <kill>:
SYSCALL(kill)
    10fe:	b8 06 00 00 00       	mov    $0x6,%eax
    1103:	cd 40                	int    $0x40
    1105:	c3                   	ret    

00001106 <exec>:
SYSCALL(exec)
    1106:	b8 07 00 00 00       	mov    $0x7,%eax
    110b:	cd 40                	int    $0x40
    110d:	c3                   	ret    

0000110e <open>:
SYSCALL(open)
    110e:	b8 0f 00 00 00       	mov    $0xf,%eax
    1113:	cd 40                	int    $0x40
    1115:	c3                   	ret    

00001116 <mknod>:
SYSCALL(mknod)
    1116:	b8 11 00 00 00       	mov    $0x11,%eax
    111b:	cd 40                	int    $0x40
    111d:	c3                   	ret    

0000111e <unlink>:
SYSCALL(unlink)
    111e:	b8 12 00 00 00       	mov    $0x12,%eax
    1123:	cd 40                	int    $0x40
    1125:	c3                   	ret    

00001126 <fstat>:
SYSCALL(fstat)
    1126:	b8 08 00 00 00       	mov    $0x8,%eax
    112b:	cd 40                	int    $0x40
    112d:	c3                   	ret    

0000112e <link>:
SYSCALL(link)
    112e:	b8 13 00 00 00       	mov    $0x13,%eax
    1133:	cd 40                	int    $0x40
    1135:	c3                   	ret    

00001136 <mkdir>:
SYSCALL(mkdir)
    1136:	b8 14 00 00 00       	mov    $0x14,%eax
    113b:	cd 40                	int    $0x40
    113d:	c3                   	ret    

0000113e <chdir>:
SYSCALL(chdir)
    113e:	b8 09 00 00 00       	mov    $0x9,%eax
    1143:	cd 40                	int    $0x40
    1145:	c3                   	ret    

00001146 <dup>:
SYSCALL(dup)
    1146:	b8 0a 00 00 00       	mov    $0xa,%eax
    114b:	cd 40                	int    $0x40
    114d:	c3                   	ret    

0000114e <getpid>:
SYSCALL(getpid)
    114e:	b8 0b 00 00 00       	mov    $0xb,%eax
    1153:	cd 40                	int    $0x40
    1155:	c3                   	ret    

00001156 <sbrk>:
SYSCALL(sbrk)
    1156:	b8 0c 00 00 00       	mov    $0xc,%eax
    115b:	cd 40                	int    $0x40
    115d:	c3                   	ret    

0000115e <sleep>:
SYSCALL(sleep)
    115e:	b8 0d 00 00 00       	mov    $0xd,%eax
    1163:	cd 40                	int    $0x40
    1165:	c3                   	ret    

00001166 <uptime>:
SYSCALL(uptime)
    1166:	b8 0e 00 00 00       	mov    $0xe,%eax
    116b:	cd 40                	int    $0x40
    116d:	c3                   	ret    

0000116e <getpinfo>:
SYSCALL(getpinfo)
    116e:	b8 16 00 00 00       	mov    $0x16,%eax
    1173:	cd 40                	int    $0x40
    1175:	c3                   	ret    

00001176 <settickets>:
SYSCALL(settickets)
    1176:	b8 17 00 00 00       	mov    $0x17,%eax
    117b:	cd 40                	int    $0x40
    117d:	c3                   	ret    

0000117e <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    117e:	55                   	push   %ebp
    117f:	89 e5                	mov    %esp,%ebp
    1181:	83 ec 18             	sub    $0x18,%esp
    1184:	8b 45 0c             	mov    0xc(%ebp),%eax
    1187:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    118a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1191:	00 
    1192:	8d 45 f4             	lea    -0xc(%ebp),%eax
    1195:	89 44 24 04          	mov    %eax,0x4(%esp)
    1199:	8b 45 08             	mov    0x8(%ebp),%eax
    119c:	89 04 24             	mov    %eax,(%esp)
    119f:	e8 4a ff ff ff       	call   10ee <write>
}
    11a4:	c9                   	leave  
    11a5:	c3                   	ret    

000011a6 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    11a6:	55                   	push   %ebp
    11a7:	89 e5                	mov    %esp,%ebp
    11a9:	56                   	push   %esi
    11aa:	53                   	push   %ebx
    11ab:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    11ae:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    11b5:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    11b9:	74 17                	je     11d2 <printint+0x2c>
    11bb:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    11bf:	79 11                	jns    11d2 <printint+0x2c>
    neg = 1;
    11c1:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    11c8:	8b 45 0c             	mov    0xc(%ebp),%eax
    11cb:	f7 d8                	neg    %eax
    11cd:	89 45 ec             	mov    %eax,-0x14(%ebp)
    11d0:	eb 06                	jmp    11d8 <printint+0x32>
  } else {
    x = xx;
    11d2:	8b 45 0c             	mov    0xc(%ebp),%eax
    11d5:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    11d8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    11df:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    11e2:	8d 41 01             	lea    0x1(%ecx),%eax
    11e5:	89 45 f4             	mov    %eax,-0xc(%ebp)
    11e8:	8b 5d 10             	mov    0x10(%ebp),%ebx
    11eb:	8b 45 ec             	mov    -0x14(%ebp),%eax
    11ee:	ba 00 00 00 00       	mov    $0x0,%edx
    11f3:	f7 f3                	div    %ebx
    11f5:	89 d0                	mov    %edx,%eax
    11f7:	0f b6 80 0a 1c 00 00 	movzbl 0x1c0a(%eax),%eax
    11fe:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    1202:	8b 75 10             	mov    0x10(%ebp),%esi
    1205:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1208:	ba 00 00 00 00       	mov    $0x0,%edx
    120d:	f7 f6                	div    %esi
    120f:	89 45 ec             	mov    %eax,-0x14(%ebp)
    1212:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1216:	75 c7                	jne    11df <printint+0x39>
  if(neg)
    1218:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    121c:	74 10                	je     122e <printint+0x88>
    buf[i++] = '-';
    121e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1221:	8d 50 01             	lea    0x1(%eax),%edx
    1224:	89 55 f4             	mov    %edx,-0xc(%ebp)
    1227:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    122c:	eb 1f                	jmp    124d <printint+0xa7>
    122e:	eb 1d                	jmp    124d <printint+0xa7>
    putc(fd, buf[i]);
    1230:	8d 55 dc             	lea    -0x24(%ebp),%edx
    1233:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1236:	01 d0                	add    %edx,%eax
    1238:	0f b6 00             	movzbl (%eax),%eax
    123b:	0f be c0             	movsbl %al,%eax
    123e:	89 44 24 04          	mov    %eax,0x4(%esp)
    1242:	8b 45 08             	mov    0x8(%ebp),%eax
    1245:	89 04 24             	mov    %eax,(%esp)
    1248:	e8 31 ff ff ff       	call   117e <putc>
  while(--i >= 0)
    124d:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    1251:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1255:	79 d9                	jns    1230 <printint+0x8a>
}
    1257:	83 c4 30             	add    $0x30,%esp
    125a:	5b                   	pop    %ebx
    125b:	5e                   	pop    %esi
    125c:	5d                   	pop    %ebp
    125d:	c3                   	ret    

0000125e <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    125e:	55                   	push   %ebp
    125f:	89 e5                	mov    %esp,%ebp
    1261:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    1264:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    126b:	8d 45 0c             	lea    0xc(%ebp),%eax
    126e:	83 c0 04             	add    $0x4,%eax
    1271:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    1274:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    127b:	e9 7c 01 00 00       	jmp    13fc <printf+0x19e>
    c = fmt[i] & 0xff;
    1280:	8b 55 0c             	mov    0xc(%ebp),%edx
    1283:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1286:	01 d0                	add    %edx,%eax
    1288:	0f b6 00             	movzbl (%eax),%eax
    128b:	0f be c0             	movsbl %al,%eax
    128e:	25 ff 00 00 00       	and    $0xff,%eax
    1293:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    1296:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    129a:	75 2c                	jne    12c8 <printf+0x6a>
      if(c == '%'){
    129c:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    12a0:	75 0c                	jne    12ae <printf+0x50>
        state = '%';
    12a2:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    12a9:	e9 4a 01 00 00       	jmp    13f8 <printf+0x19a>
      } else {
        putc(fd, c);
    12ae:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    12b1:	0f be c0             	movsbl %al,%eax
    12b4:	89 44 24 04          	mov    %eax,0x4(%esp)
    12b8:	8b 45 08             	mov    0x8(%ebp),%eax
    12bb:	89 04 24             	mov    %eax,(%esp)
    12be:	e8 bb fe ff ff       	call   117e <putc>
    12c3:	e9 30 01 00 00       	jmp    13f8 <printf+0x19a>
      }
    } else if(state == '%'){
    12c8:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    12cc:	0f 85 26 01 00 00    	jne    13f8 <printf+0x19a>
      if(c == 'd'){
    12d2:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    12d6:	75 2d                	jne    1305 <printf+0xa7>
        printint(fd, *ap, 10, 1);
    12d8:	8b 45 e8             	mov    -0x18(%ebp),%eax
    12db:	8b 00                	mov    (%eax),%eax
    12dd:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    12e4:	00 
    12e5:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    12ec:	00 
    12ed:	89 44 24 04          	mov    %eax,0x4(%esp)
    12f1:	8b 45 08             	mov    0x8(%ebp),%eax
    12f4:	89 04 24             	mov    %eax,(%esp)
    12f7:	e8 aa fe ff ff       	call   11a6 <printint>
        ap++;
    12fc:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    1300:	e9 ec 00 00 00       	jmp    13f1 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
    1305:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    1309:	74 06                	je     1311 <printf+0xb3>
    130b:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    130f:	75 2d                	jne    133e <printf+0xe0>
        printint(fd, *ap, 16, 0);
    1311:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1314:	8b 00                	mov    (%eax),%eax
    1316:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    131d:	00 
    131e:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    1325:	00 
    1326:	89 44 24 04          	mov    %eax,0x4(%esp)
    132a:	8b 45 08             	mov    0x8(%ebp),%eax
    132d:	89 04 24             	mov    %eax,(%esp)
    1330:	e8 71 fe ff ff       	call   11a6 <printint>
        ap++;
    1335:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    1339:	e9 b3 00 00 00       	jmp    13f1 <printf+0x193>
      } else if(c == 's'){
    133e:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    1342:	75 45                	jne    1389 <printf+0x12b>
        s = (char*)*ap;
    1344:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1347:	8b 00                	mov    (%eax),%eax
    1349:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    134c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    1350:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1354:	75 09                	jne    135f <printf+0x101>
          s = "(null)";
    1356:	c7 45 f4 42 17 00 00 	movl   $0x1742,-0xc(%ebp)
        while(*s != 0){
    135d:	eb 1e                	jmp    137d <printf+0x11f>
    135f:	eb 1c                	jmp    137d <printf+0x11f>
          putc(fd, *s);
    1361:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1364:	0f b6 00             	movzbl (%eax),%eax
    1367:	0f be c0             	movsbl %al,%eax
    136a:	89 44 24 04          	mov    %eax,0x4(%esp)
    136e:	8b 45 08             	mov    0x8(%ebp),%eax
    1371:	89 04 24             	mov    %eax,(%esp)
    1374:	e8 05 fe ff ff       	call   117e <putc>
          s++;
    1379:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
    137d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1380:	0f b6 00             	movzbl (%eax),%eax
    1383:	84 c0                	test   %al,%al
    1385:	75 da                	jne    1361 <printf+0x103>
    1387:	eb 68                	jmp    13f1 <printf+0x193>
        }
      } else if(c == 'c'){
    1389:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    138d:	75 1d                	jne    13ac <printf+0x14e>
        putc(fd, *ap);
    138f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1392:	8b 00                	mov    (%eax),%eax
    1394:	0f be c0             	movsbl %al,%eax
    1397:	89 44 24 04          	mov    %eax,0x4(%esp)
    139b:	8b 45 08             	mov    0x8(%ebp),%eax
    139e:	89 04 24             	mov    %eax,(%esp)
    13a1:	e8 d8 fd ff ff       	call   117e <putc>
        ap++;
    13a6:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    13aa:	eb 45                	jmp    13f1 <printf+0x193>
      } else if(c == '%'){
    13ac:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    13b0:	75 17                	jne    13c9 <printf+0x16b>
        putc(fd, c);
    13b2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    13b5:	0f be c0             	movsbl %al,%eax
    13b8:	89 44 24 04          	mov    %eax,0x4(%esp)
    13bc:	8b 45 08             	mov    0x8(%ebp),%eax
    13bf:	89 04 24             	mov    %eax,(%esp)
    13c2:	e8 b7 fd ff ff       	call   117e <putc>
    13c7:	eb 28                	jmp    13f1 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    13c9:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    13d0:	00 
    13d1:	8b 45 08             	mov    0x8(%ebp),%eax
    13d4:	89 04 24             	mov    %eax,(%esp)
    13d7:	e8 a2 fd ff ff       	call   117e <putc>
        putc(fd, c);
    13dc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    13df:	0f be c0             	movsbl %al,%eax
    13e2:	89 44 24 04          	mov    %eax,0x4(%esp)
    13e6:	8b 45 08             	mov    0x8(%ebp),%eax
    13e9:	89 04 24             	mov    %eax,(%esp)
    13ec:	e8 8d fd ff ff       	call   117e <putc>
      }
      state = 0;
    13f1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
    13f8:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    13fc:	8b 55 0c             	mov    0xc(%ebp),%edx
    13ff:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1402:	01 d0                	add    %edx,%eax
    1404:	0f b6 00             	movzbl (%eax),%eax
    1407:	84 c0                	test   %al,%al
    1409:	0f 85 71 fe ff ff    	jne    1280 <printf+0x22>
    }
  }
}
    140f:	c9                   	leave  
    1410:	c3                   	ret    

00001411 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1411:	55                   	push   %ebp
    1412:	89 e5                	mov    %esp,%ebp
    1414:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    1417:	8b 45 08             	mov    0x8(%ebp),%eax
    141a:	83 e8 08             	sub    $0x8,%eax
    141d:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1420:	a1 8c 1c 00 00       	mov    0x1c8c,%eax
    1425:	89 45 fc             	mov    %eax,-0x4(%ebp)
    1428:	eb 24                	jmp    144e <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    142a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    142d:	8b 00                	mov    (%eax),%eax
    142f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1432:	77 12                	ja     1446 <free+0x35>
    1434:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1437:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    143a:	77 24                	ja     1460 <free+0x4f>
    143c:	8b 45 fc             	mov    -0x4(%ebp),%eax
    143f:	8b 00                	mov    (%eax),%eax
    1441:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    1444:	77 1a                	ja     1460 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1446:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1449:	8b 00                	mov    (%eax),%eax
    144b:	89 45 fc             	mov    %eax,-0x4(%ebp)
    144e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1451:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    1454:	76 d4                	jbe    142a <free+0x19>
    1456:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1459:	8b 00                	mov    (%eax),%eax
    145b:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    145e:	76 ca                	jbe    142a <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1460:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1463:	8b 40 04             	mov    0x4(%eax),%eax
    1466:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    146d:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1470:	01 c2                	add    %eax,%edx
    1472:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1475:	8b 00                	mov    (%eax),%eax
    1477:	39 c2                	cmp    %eax,%edx
    1479:	75 24                	jne    149f <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    147b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    147e:	8b 50 04             	mov    0x4(%eax),%edx
    1481:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1484:	8b 00                	mov    (%eax),%eax
    1486:	8b 40 04             	mov    0x4(%eax),%eax
    1489:	01 c2                	add    %eax,%edx
    148b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    148e:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    1491:	8b 45 fc             	mov    -0x4(%ebp),%eax
    1494:	8b 00                	mov    (%eax),%eax
    1496:	8b 10                	mov    (%eax),%edx
    1498:	8b 45 f8             	mov    -0x8(%ebp),%eax
    149b:	89 10                	mov    %edx,(%eax)
    149d:	eb 0a                	jmp    14a9 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    149f:	8b 45 fc             	mov    -0x4(%ebp),%eax
    14a2:	8b 10                	mov    (%eax),%edx
    14a4:	8b 45 f8             	mov    -0x8(%ebp),%eax
    14a7:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    14a9:	8b 45 fc             	mov    -0x4(%ebp),%eax
    14ac:	8b 40 04             	mov    0x4(%eax),%eax
    14af:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    14b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
    14b9:	01 d0                	add    %edx,%eax
    14bb:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    14be:	75 20                	jne    14e0 <free+0xcf>
    p->s.size += bp->s.size;
    14c0:	8b 45 fc             	mov    -0x4(%ebp),%eax
    14c3:	8b 50 04             	mov    0x4(%eax),%edx
    14c6:	8b 45 f8             	mov    -0x8(%ebp),%eax
    14c9:	8b 40 04             	mov    0x4(%eax),%eax
    14cc:	01 c2                	add    %eax,%edx
    14ce:	8b 45 fc             	mov    -0x4(%ebp),%eax
    14d1:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    14d4:	8b 45 f8             	mov    -0x8(%ebp),%eax
    14d7:	8b 10                	mov    (%eax),%edx
    14d9:	8b 45 fc             	mov    -0x4(%ebp),%eax
    14dc:	89 10                	mov    %edx,(%eax)
    14de:	eb 08                	jmp    14e8 <free+0xd7>
  } else
    p->s.ptr = bp;
    14e0:	8b 45 fc             	mov    -0x4(%ebp),%eax
    14e3:	8b 55 f8             	mov    -0x8(%ebp),%edx
    14e6:	89 10                	mov    %edx,(%eax)
  freep = p;
    14e8:	8b 45 fc             	mov    -0x4(%ebp),%eax
    14eb:	a3 8c 1c 00 00       	mov    %eax,0x1c8c
}
    14f0:	c9                   	leave  
    14f1:	c3                   	ret    

000014f2 <morecore>:

static Header*
morecore(uint nu)
{
    14f2:	55                   	push   %ebp
    14f3:	89 e5                	mov    %esp,%ebp
    14f5:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    14f8:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    14ff:	77 07                	ja     1508 <morecore+0x16>
    nu = 4096;
    1501:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    1508:	8b 45 08             	mov    0x8(%ebp),%eax
    150b:	c1 e0 03             	shl    $0x3,%eax
    150e:	89 04 24             	mov    %eax,(%esp)
    1511:	e8 40 fc ff ff       	call   1156 <sbrk>
    1516:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    1519:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    151d:	75 07                	jne    1526 <morecore+0x34>
    return 0;
    151f:	b8 00 00 00 00       	mov    $0x0,%eax
    1524:	eb 22                	jmp    1548 <morecore+0x56>
  hp = (Header*)p;
    1526:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1529:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    152c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    152f:	8b 55 08             	mov    0x8(%ebp),%edx
    1532:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    1535:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1538:	83 c0 08             	add    $0x8,%eax
    153b:	89 04 24             	mov    %eax,(%esp)
    153e:	e8 ce fe ff ff       	call   1411 <free>
  return freep;
    1543:	a1 8c 1c 00 00       	mov    0x1c8c,%eax
}
    1548:	c9                   	leave  
    1549:	c3                   	ret    

0000154a <malloc>:

void*
malloc(uint nbytes)
{
    154a:	55                   	push   %ebp
    154b:	89 e5                	mov    %esp,%ebp
    154d:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1550:	8b 45 08             	mov    0x8(%ebp),%eax
    1553:	83 c0 07             	add    $0x7,%eax
    1556:	c1 e8 03             	shr    $0x3,%eax
    1559:	83 c0 01             	add    $0x1,%eax
    155c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    155f:	a1 8c 1c 00 00       	mov    0x1c8c,%eax
    1564:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1567:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    156b:	75 23                	jne    1590 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    156d:	c7 45 f0 84 1c 00 00 	movl   $0x1c84,-0x10(%ebp)
    1574:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1577:	a3 8c 1c 00 00       	mov    %eax,0x1c8c
    157c:	a1 8c 1c 00 00       	mov    0x1c8c,%eax
    1581:	a3 84 1c 00 00       	mov    %eax,0x1c84
    base.s.size = 0;
    1586:	c7 05 88 1c 00 00 00 	movl   $0x0,0x1c88
    158d:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1590:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1593:	8b 00                	mov    (%eax),%eax
    1595:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    1598:	8b 45 f4             	mov    -0xc(%ebp),%eax
    159b:	8b 40 04             	mov    0x4(%eax),%eax
    159e:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    15a1:	72 4d                	jb     15f0 <malloc+0xa6>
      if(p->s.size == nunits)
    15a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15a6:	8b 40 04             	mov    0x4(%eax),%eax
    15a9:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    15ac:	75 0c                	jne    15ba <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    15ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15b1:	8b 10                	mov    (%eax),%edx
    15b3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    15b6:	89 10                	mov    %edx,(%eax)
    15b8:	eb 26                	jmp    15e0 <malloc+0x96>
      else {
        p->s.size -= nunits;
    15ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15bd:	8b 40 04             	mov    0x4(%eax),%eax
    15c0:	2b 45 ec             	sub    -0x14(%ebp),%eax
    15c3:	89 c2                	mov    %eax,%edx
    15c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15c8:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    15cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15ce:	8b 40 04             	mov    0x4(%eax),%eax
    15d1:	c1 e0 03             	shl    $0x3,%eax
    15d4:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    15d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15da:	8b 55 ec             	mov    -0x14(%ebp),%edx
    15dd:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    15e0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    15e3:	a3 8c 1c 00 00       	mov    %eax,0x1c8c
      return (void*)(p + 1);
    15e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15eb:	83 c0 08             	add    $0x8,%eax
    15ee:	eb 38                	jmp    1628 <malloc+0xde>
    }
    if(p == freep)
    15f0:	a1 8c 1c 00 00       	mov    0x1c8c,%eax
    15f5:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    15f8:	75 1b                	jne    1615 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    15fa:	8b 45 ec             	mov    -0x14(%ebp),%eax
    15fd:	89 04 24             	mov    %eax,(%esp)
    1600:	e8 ed fe ff ff       	call   14f2 <morecore>
    1605:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1608:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    160c:	75 07                	jne    1615 <malloc+0xcb>
        return 0;
    160e:	b8 00 00 00 00       	mov    $0x0,%eax
    1613:	eb 13                	jmp    1628 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1615:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1618:	89 45 f0             	mov    %eax,-0x10(%ebp)
    161b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    161e:	8b 00                	mov    (%eax),%eax
    1620:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
    1623:	e9 70 ff ff ff       	jmp    1598 <malloc+0x4e>
}
    1628:	c9                   	leave  
    1629:	c3                   	ret    
