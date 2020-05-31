
obj/__user_forktree.out:     file format elf32-littleriscv


Disassembly of section .text:

00800020 <syscall>:
  800020:	fb010113          	addi	sp,sp,-80
  800024:	04e12023          	sw	a4,64(sp)
  800028:	02e12423          	sw	a4,40(sp)
  80002c:	04810713          	addi	a4,sp,72
  800030:	00a12623          	sw	a0,12(sp)
  800034:	02b12a23          	sw	a1,52(sp)
  800038:	02c12c23          	sw	a2,56(sp)
  80003c:	02d12e23          	sw	a3,60(sp)
  800040:	04f12223          	sw	a5,68(sp)
  800044:	05012423          	sw	a6,72(sp)
  800048:	05112623          	sw	a7,76(sp)
  80004c:	00b12e23          	sw	a1,28(sp)
  800050:	02c12023          	sw	a2,32(sp)
  800054:	02d12223          	sw	a3,36(sp)
  800058:	00e12a23          	sw	a4,20(sp)
  80005c:	02f12623          	sw	a5,44(sp)
  800060:	00c12503          	lw	a0,12(sp)
  800064:	01c12583          	lw	a1,28(sp)
  800068:	02012603          	lw	a2,32(sp)
  80006c:	02412683          	lw	a3,36(sp)
  800070:	02812703          	lw	a4,40(sp)
  800074:	02c12783          	lw	a5,44(sp)
  800078:	00000073          	ecall
  80007c:	00a12c23          	sw	a0,24(sp)
  800080:	01812503          	lw	a0,24(sp)
  800084:	05010113          	addi	sp,sp,80
  800088:	00008067          	ret

0080008c <sys_exit>:
  80008c:	00050593          	mv	a1,a0
  800090:	00100513          	li	a0,1
  800094:	f8dff06f          	j	800020 <syscall>

00800098 <sys_fork>:
  800098:	00200513          	li	a0,2
  80009c:	f85ff06f          	j	800020 <syscall>

008000a0 <sys_yield>:
  8000a0:	00a00513          	li	a0,10
  8000a4:	f7dff06f          	j	800020 <syscall>

008000a8 <sys_getpid>:
  8000a8:	01200513          	li	a0,18
  8000ac:	f75ff06f          	j	800020 <syscall>

008000b0 <sys_putc>:
  8000b0:	00050593          	mv	a1,a0
  8000b4:	01e00513          	li	a0,30
  8000b8:	f69ff06f          	j	800020 <syscall>

008000bc <exit>:
  8000bc:	ff010113          	addi	sp,sp,-16
  8000c0:	00112623          	sw	ra,12(sp)
  8000c4:	fc9ff0ef          	jal	ra,80008c <sys_exit>
  8000c8:	00001517          	auipc	a0,0x1
  8000cc:	8b850513          	addi	a0,a0,-1864 # 800980 <main+0x24>
  8000d0:	04c000ef          	jal	ra,80011c <cprintf>
  8000d4:	0000006f          	j	8000d4 <exit+0x18>

008000d8 <fork>:
  8000d8:	fc1ff06f          	j	800098 <sys_fork>

008000dc <yield>:
  8000dc:	fc5ff06f          	j	8000a0 <sys_yield>

008000e0 <getpid>:
  8000e0:	fc9ff06f          	j	8000a8 <sys_getpid>

008000e4 <_start>:
  8000e4:	090000ef          	jal	ra,800174 <umain>
  8000e8:	0000006f          	j	8000e8 <_start+0x4>

008000ec <cputch>:
  8000ec:	ff010113          	addi	sp,sp,-16
  8000f0:	00112623          	sw	ra,12(sp)
  8000f4:	00812423          	sw	s0,8(sp)
  8000f8:	00058413          	mv	s0,a1
  8000fc:	fb5ff0ef          	jal	ra,8000b0 <sys_putc>
  800100:	00042783          	lw	a5,0(s0)
  800104:	00c12083          	lw	ra,12(sp)
  800108:	00178793          	addi	a5,a5,1
  80010c:	00f42023          	sw	a5,0(s0)
  800110:	00812403          	lw	s0,8(sp)
  800114:	01010113          	addi	sp,sp,16
  800118:	00008067          	ret

0080011c <cprintf>:
  80011c:	fc010113          	addi	sp,sp,-64
  800120:	02410313          	addi	t1,sp,36
  800124:	02b12223          	sw	a1,36(sp)
  800128:	02c12423          	sw	a2,40(sp)
  80012c:	02d12623          	sw	a3,44(sp)
  800130:	00050613          	mv	a2,a0
  800134:	00c10593          	addi	a1,sp,12
  800138:	00000517          	auipc	a0,0x0
  80013c:	fb450513          	addi	a0,a0,-76 # 8000ec <cputch>
  800140:	00030693          	mv	a3,t1
  800144:	00112e23          	sw	ra,28(sp)
  800148:	02e12823          	sw	a4,48(sp)
  80014c:	02f12a23          	sw	a5,52(sp)
  800150:	03012c23          	sw	a6,56(sp)
  800154:	03112e23          	sw	a7,60(sp)
  800158:	00612423          	sw	t1,8(sp)
  80015c:	00012623          	sw	zero,12(sp)
  800160:	160000ef          	jal	ra,8002c0 <vprintfmt>
  800164:	01c12083          	lw	ra,28(sp)
  800168:	00c12503          	lw	a0,12(sp)
  80016c:	04010113          	addi	sp,sp,64
  800170:	00008067          	ret

00800174 <umain>:
  800174:	ff010113          	addi	sp,sp,-16
  800178:	00112623          	sw	ra,12(sp)
  80017c:	7e0000ef          	jal	ra,80095c <main>
  800180:	f3dff0ef          	jal	ra,8000bc <exit>

00800184 <strlen>:
  800184:	00054703          	lbu	a4,0(a0)
  800188:	00050693          	mv	a3,a0
  80018c:	00150793          	addi	a5,a0,1
  800190:	00070c63          	beqz	a4,8001a8 <strlen+0x24>
  800194:	40d78533          	sub	a0,a5,a3
  800198:	00178793          	addi	a5,a5,1
  80019c:	fff7c703          	lbu	a4,-1(a5)
  8001a0:	fe071ae3          	bnez	a4,800194 <strlen+0x10>
  8001a4:	00008067          	ret
  8001a8:	00000513          	li	a0,0
  8001ac:	00008067          	ret

008001b0 <strnlen>:
  8001b0:	00050693          	mv	a3,a0
  8001b4:	02058a63          	beqz	a1,8001e8 <strnlen+0x38>
  8001b8:	00054703          	lbu	a4,0(a0)
  8001bc:	00150793          	addi	a5,a0,1
  8001c0:	02070463          	beqz	a4,8001e8 <strnlen+0x38>
  8001c4:	00b505b3          	add	a1,a0,a1
  8001c8:	0100006f          	j	8001d8 <strnlen+0x28>
  8001cc:	00178793          	addi	a5,a5,1
  8001d0:	fff7c703          	lbu	a4,-1(a5)
  8001d4:	00070863          	beqz	a4,8001e4 <strnlen+0x34>
  8001d8:	40d78533          	sub	a0,a5,a3
  8001dc:	feb798e3          	bne	a5,a1,8001cc <strnlen+0x1c>
  8001e0:	00008067          	ret
  8001e4:	00008067          	ret
  8001e8:	00000513          	li	a0,0
  8001ec:	00008067          	ret

008001f0 <printnum>:
  8001f0:	fe010113          	addi	sp,sp,-32
  8001f4:	00912a23          	sw	s1,20(sp)
  8001f8:	01212823          	sw	s2,16(sp)
  8001fc:	01312623          	sw	s3,12(sp)
  800200:	01412423          	sw	s4,8(sp)
  800204:	00112e23          	sw	ra,28(sp)
  800208:	00812c23          	sw	s0,24(sp)
  80020c:	00050493          	mv	s1,a0
  800210:	00058913          	mv	s2,a1
  800214:	00080993          	mv	s3,a6
  800218:	02e67a33          	remu	s4,a2,a4
  80021c:	04069e63          	bnez	a3,800278 <printnum+0x88>
  800220:	04e67c63          	bleu	a4,a2,800278 <printnum+0x88>
  800224:	fff78413          	addi	s0,a5,-1
  800228:	00805c63          	blez	s0,800240 <printnum+0x50>
  80022c:	fff40413          	addi	s0,s0,-1
  800230:	00090593          	mv	a1,s2
  800234:	00098513          	mv	a0,s3
  800238:	000480e7          	jalr	s1
  80023c:	fe0418e3          	bnez	s0,80022c <printnum+0x3c>
  800240:	00001797          	auipc	a5,0x1
  800244:	91078793          	addi	a5,a5,-1776 # 800b50 <error_string+0x64>
  800248:	014787b3          	add	a5,a5,s4
  80024c:	00090593          	mv	a1,s2
  800250:	00048313          	mv	t1,s1
  800254:	01c12083          	lw	ra,28(sp)
  800258:	01812403          	lw	s0,24(sp)
  80025c:	01412483          	lw	s1,20(sp)
  800260:	01012903          	lw	s2,16(sp)
  800264:	00c12983          	lw	s3,12(sp)
  800268:	00812a03          	lw	s4,8(sp)
  80026c:	0007c503          	lbu	a0,0(a5)
  800270:	02010113          	addi	sp,sp,32
  800274:	00030067          	jr	t1
  800278:	02e65633          	divu	a2,a2,a4
  80027c:	00098813          	mv	a6,s3
  800280:	fff78793          	addi	a5,a5,-1
  800284:	00000693          	li	a3,0
  800288:	00090593          	mv	a1,s2
  80028c:	00048513          	mv	a0,s1
  800290:	f61ff0ef          	jal	ra,8001f0 <printnum>
  800294:	fadff06f          	j	800240 <printnum+0x50>

00800298 <sprintputch>:
  800298:	0085a783          	lw	a5,8(a1)
  80029c:	0005a703          	lw	a4,0(a1)
  8002a0:	0045a683          	lw	a3,4(a1)
  8002a4:	00178793          	addi	a5,a5,1
  8002a8:	00f5a423          	sw	a5,8(a1)
  8002ac:	00d77863          	bleu	a3,a4,8002bc <sprintputch+0x24>
  8002b0:	00170793          	addi	a5,a4,1
  8002b4:	00f5a023          	sw	a5,0(a1)
  8002b8:	00a70023          	sb	a0,0(a4)
  8002bc:	00008067          	ret

008002c0 <vprintfmt>:
  8002c0:	fb010113          	addi	sp,sp,-80
  8002c4:	05212023          	sw	s2,64(sp)
  8002c8:	03312e23          	sw	s3,60(sp)
  8002cc:	03412c23          	sw	s4,56(sp)
  8002d0:	03512a23          	sw	s5,52(sp)
  8002d4:	03612823          	sw	s6,48(sp)
  8002d8:	03712623          	sw	s7,44(sp)
  8002dc:	03812423          	sw	s8,40(sp)
  8002e0:	03912223          	sw	s9,36(sp)
  8002e4:	04112623          	sw	ra,76(sp)
  8002e8:	04812423          	sw	s0,72(sp)
  8002ec:	04912223          	sw	s1,68(sp)
  8002f0:	03a12023          	sw	s10,32(sp)
  8002f4:	01b12e23          	sw	s11,28(sp)
  8002f8:	00050993          	mv	s3,a0
  8002fc:	00058913          	mv	s2,a1
  800300:	00060c93          	mv	s9,a2
  800304:	00068a93          	mv	s5,a3
  800308:	00000a17          	auipc	s4,0x0
  80030c:	68ca0a13          	addi	s4,s4,1676 # 800994 <main+0x38>
  800310:	02800c13          	li	s8,40
  800314:	fff00b13          	li	s6,-1
  800318:	05e00b93          	li	s7,94
  80031c:	000cc503          	lbu	a0,0(s9)
  800320:	02500493          	li	s1,37
  800324:	001c8413          	addi	s0,s9,1
  800328:	00950e63          	beq	a0,s1,800344 <vprintfmt+0x84>
  80032c:	06050463          	beqz	a0,800394 <vprintfmt+0xd4>
  800330:	00090593          	mv	a1,s2
  800334:	00140413          	addi	s0,s0,1
  800338:	000980e7          	jalr	s3
  80033c:	fff44503          	lbu	a0,-1(s0)
  800340:	fe9516e3          	bne	a0,s1,80032c <vprintfmt+0x6c>
  800344:	00044e03          	lbu	t3,0(s0)
  800348:	fff00d13          	li	s10,-1
  80034c:	02000813          	li	a6,32
  800350:	00000493          	li	s1,0
  800354:	00000593          	li	a1,0
  800358:	000d0d93          	mv	s11,s10
  80035c:	05500693          	li	a3,85
  800360:	00100313          	li	t1,1
  800364:	03000893          	li	a7,48
  800368:	00900613          	li	a2,9
  80036c:	02d00513          	li	a0,45
  800370:	fdde0713          	addi	a4,t3,-35
  800374:	0ff77713          	andi	a4,a4,255
  800378:	00140c93          	addi	s9,s0,1
  80037c:	32e6e463          	bltu	a3,a4,8006a4 <vprintfmt+0x3e4>
  800380:	00271713          	slli	a4,a4,0x2
  800384:	01470733          	add	a4,a4,s4
  800388:	00072783          	lw	a5,0(a4)
  80038c:	014787b3          	add	a5,a5,s4
  800390:	00078067          	jr	a5
  800394:	04c12083          	lw	ra,76(sp)
  800398:	04812403          	lw	s0,72(sp)
  80039c:	04412483          	lw	s1,68(sp)
  8003a0:	04012903          	lw	s2,64(sp)
  8003a4:	03c12983          	lw	s3,60(sp)
  8003a8:	03812a03          	lw	s4,56(sp)
  8003ac:	03412a83          	lw	s5,52(sp)
  8003b0:	03012b03          	lw	s6,48(sp)
  8003b4:	02c12b83          	lw	s7,44(sp)
  8003b8:	02812c03          	lw	s8,40(sp)
  8003bc:	02412c83          	lw	s9,36(sp)
  8003c0:	02012d03          	lw	s10,32(sp)
  8003c4:	01c12d83          	lw	s11,28(sp)
  8003c8:	05010113          	addi	sp,sp,80
  8003cc:	00008067          	ret
  8003d0:	00100793          	li	a5,1
  8003d4:	34b7c063          	blt	a5,a1,800714 <vprintfmt+0x454>
  8003d8:	000aa603          	lw	a2,0(s5)
  8003dc:	00000693          	li	a3,0
  8003e0:	004a8a93          	addi	s5,s5,4
  8003e4:	01000713          	li	a4,16
  8003e8:	000d8793          	mv	a5,s11
  8003ec:	00090593          	mv	a1,s2
  8003f0:	00098513          	mv	a0,s3
  8003f4:	dfdff0ef          	jal	ra,8001f0 <printnum>
  8003f8:	f25ff06f          	j	80031c <vprintfmt+0x5c>
  8003fc:	00144e03          	lbu	t3,1(s0)
  800400:	00030493          	mv	s1,t1
  800404:	000c8413          	mv	s0,s9
  800408:	f69ff06f          	j	800370 <vprintfmt+0xb0>
  80040c:	000aa503          	lw	a0,0(s5)
  800410:	00090593          	mv	a1,s2
  800414:	004a8a93          	addi	s5,s5,4
  800418:	000980e7          	jalr	s3
  80041c:	f01ff06f          	j	80031c <vprintfmt+0x5c>
  800420:	00100793          	li	a5,1
  800424:	30b7c663          	blt	a5,a1,800730 <vprintfmt+0x470>
  800428:	000aa603          	lw	a2,0(s5)
  80042c:	004a8a93          	addi	s5,s5,4
  800430:	41f65693          	srai	a3,a2,0x1f
  800434:	00a00713          	li	a4,10
  800438:	fa06d8e3          	bgez	a3,8003e8 <vprintfmt+0x128>
  80043c:	00090593          	mv	a1,s2
  800440:	02d00513          	li	a0,45
  800444:	00d12623          	sw	a3,12(sp)
  800448:	00c12423          	sw	a2,8(sp)
  80044c:	00e12223          	sw	a4,4(sp)
  800450:	01012023          	sw	a6,0(sp)
  800454:	000980e7          	jalr	s3
  800458:	00812603          	lw	a2,8(sp)
  80045c:	00c12683          	lw	a3,12(sp)
  800460:	00012803          	lw	a6,0(sp)
  800464:	40c00633          	neg	a2,a2
  800468:	00c037b3          	snez	a5,a2
  80046c:	40d006b3          	neg	a3,a3
  800470:	40f686b3          	sub	a3,a3,a5
  800474:	00412703          	lw	a4,4(sp)
  800478:	f71ff06f          	j	8003e8 <vprintfmt+0x128>
  80047c:	000aa783          	lw	a5,0(s5)
  800480:	01800693          	li	a3,24
  800484:	004a8a93          	addi	s5,s5,4
  800488:	41f7d713          	srai	a4,a5,0x1f
  80048c:	00f747b3          	xor	a5,a4,a5
  800490:	40e787b3          	sub	a5,a5,a4
  800494:	2af6ca63          	blt	a3,a5,800748 <vprintfmt+0x488>
  800498:	00279693          	slli	a3,a5,0x2
  80049c:	00000717          	auipc	a4,0x0
  8004a0:	65070713          	addi	a4,a4,1616 # 800aec <error_string>
  8004a4:	00d70733          	add	a4,a4,a3
  8004a8:	00072683          	lw	a3,0(a4)
  8004ac:	28068e63          	beqz	a3,800748 <vprintfmt+0x488>
  8004b0:	00000617          	auipc	a2,0x0
  8004b4:	76c60613          	addi	a2,a2,1900 # 800c1c <error_string+0x130>
  8004b8:	00090593          	mv	a1,s2
  8004bc:	00098513          	mv	a0,s3
  8004c0:	314000ef          	jal	ra,8007d4 <printfmt>
  8004c4:	e59ff06f          	j	80031c <vprintfmt+0x5c>
  8004c8:	00144e03          	lbu	t3,1(s0)
  8004cc:	00158593          	addi	a1,a1,1
  8004d0:	000c8413          	mv	s0,s9
  8004d4:	e9dff06f          	j	800370 <vprintfmt+0xb0>
  8004d8:	00100793          	li	a5,1
  8004dc:	20b7c063          	blt	a5,a1,8006dc <vprintfmt+0x41c>
  8004e0:	000aa603          	lw	a2,0(s5)
  8004e4:	00000693          	li	a3,0
  8004e8:	004a8a93          	addi	s5,s5,4
  8004ec:	00800713          	li	a4,8
  8004f0:	ef9ff06f          	j	8003e8 <vprintfmt+0x128>
  8004f4:	03000513          	li	a0,48
  8004f8:	00090593          	mv	a1,s2
  8004fc:	01012023          	sw	a6,0(sp)
  800500:	000980e7          	jalr	s3
  800504:	00090593          	mv	a1,s2
  800508:	07800513          	li	a0,120
  80050c:	000980e7          	jalr	s3
  800510:	000aa603          	lw	a2,0(s5)
  800514:	00000693          	li	a3,0
  800518:	01000713          	li	a4,16
  80051c:	004a8a93          	addi	s5,s5,4
  800520:	00012803          	lw	a6,0(sp)
  800524:	ec5ff06f          	j	8003e8 <vprintfmt+0x128>
  800528:	000aa403          	lw	s0,0(s5)
  80052c:	004a8793          	addi	a5,s5,4
  800530:	00f12223          	sw	a5,4(sp)
  800534:	24040863          	beqz	s0,800784 <vprintfmt+0x4c4>
  800538:	05b05263          	blez	s11,80057c <vprintfmt+0x2bc>
  80053c:	02d00793          	li	a5,45
  800540:	22f80263          	beq	a6,a5,800764 <vprintfmt+0x4a4>
  800544:	000d0593          	mv	a1,s10
  800548:	00040513          	mv	a0,s0
  80054c:	01012023          	sw	a6,0(sp)
  800550:	c61ff0ef          	jal	ra,8001b0 <strnlen>
  800554:	40ad8db3          	sub	s11,s11,a0
  800558:	03b05263          	blez	s11,80057c <vprintfmt+0x2bc>
  80055c:	00012803          	lw	a6,0(sp)
  800560:	00080513          	mv	a0,a6
  800564:	00090593          	mv	a1,s2
  800568:	01012023          	sw	a6,0(sp)
  80056c:	fffd8d93          	addi	s11,s11,-1
  800570:	000980e7          	jalr	s3
  800574:	00012803          	lw	a6,0(sp)
  800578:	fe0d94e3          	bnez	s11,800560 <vprintfmt+0x2a0>
  80057c:	00044783          	lbu	a5,0(s0)
  800580:	00140a93          	addi	s5,s0,1
  800584:	00078513          	mv	a0,a5
  800588:	04078c63          	beqz	a5,8005e0 <vprintfmt+0x320>
  80058c:	03f00413          	li	s0,63
  800590:	000d4663          	bltz	s10,80059c <vprintfmt+0x2dc>
  800594:	fffd0d13          	addi	s10,s10,-1
  800598:	036d0663          	beq	s10,s6,8005c4 <vprintfmt+0x304>
  80059c:	00090593          	mv	a1,s2
  8005a0:	00048663          	beqz	s1,8005ac <vprintfmt+0x2ec>
  8005a4:	fe078793          	addi	a5,a5,-32
  8005a8:	12fbe463          	bltu	s7,a5,8006d0 <vprintfmt+0x410>
  8005ac:	000980e7          	jalr	s3
  8005b0:	001a8a93          	addi	s5,s5,1
  8005b4:	fffac783          	lbu	a5,-1(s5)
  8005b8:	fffd8d93          	addi	s11,s11,-1
  8005bc:	00078513          	mv	a0,a5
  8005c0:	fc0798e3          	bnez	a5,800590 <vprintfmt+0x2d0>
  8005c4:	01b05e63          	blez	s11,8005e0 <vprintfmt+0x320>
  8005c8:	02000413          	li	s0,32
  8005cc:	fffd8d93          	addi	s11,s11,-1
  8005d0:	00090593          	mv	a1,s2
  8005d4:	00040513          	mv	a0,s0
  8005d8:	000980e7          	jalr	s3
  8005dc:	fe0d98e3          	bnez	s11,8005cc <vprintfmt+0x30c>
  8005e0:	00412a83          	lw	s5,4(sp)
  8005e4:	d39ff06f          	j	80031c <vprintfmt+0x5c>
  8005e8:	00100793          	li	a5,1
  8005ec:	10b7c663          	blt	a5,a1,8006f8 <vprintfmt+0x438>
  8005f0:	000aa603          	lw	a2,0(s5)
  8005f4:	00000693          	li	a3,0
  8005f8:	004a8a93          	addi	s5,s5,4
  8005fc:	00a00713          	li	a4,10
  800600:	de9ff06f          	j	8003e8 <vprintfmt+0x128>
  800604:	00144e03          	lbu	t3,1(s0)
  800608:	00050813          	mv	a6,a0
  80060c:	000c8413          	mv	s0,s9
  800610:	d61ff06f          	j	800370 <vprintfmt+0xb0>
  800614:	00090593          	mv	a1,s2
  800618:	02500513          	li	a0,37
  80061c:	000980e7          	jalr	s3
  800620:	cfdff06f          	j	80031c <vprintfmt+0x5c>
  800624:	000aad03          	lw	s10,0(s5)
  800628:	00144e03          	lbu	t3,1(s0)
  80062c:	004a8a93          	addi	s5,s5,4
  800630:	000c8413          	mv	s0,s9
  800634:	d20ddee3          	bgez	s11,800370 <vprintfmt+0xb0>
  800638:	000d0d93          	mv	s11,s10
  80063c:	fff00d13          	li	s10,-1
  800640:	d31ff06f          	j	800370 <vprintfmt+0xb0>
  800644:	00144e03          	lbu	t3,1(s0)
  800648:	00088813          	mv	a6,a7
  80064c:	000c8413          	mv	s0,s9
  800650:	d21ff06f          	j	800370 <vprintfmt+0xb0>
  800654:	00144703          	lbu	a4,1(s0)
  800658:	fd0e0d13          	addi	s10,t3,-48
  80065c:	fd070793          	addi	a5,a4,-48
  800660:	14f66863          	bltu	a2,a5,8007b0 <vprintfmt+0x4f0>
  800664:	000c8413          	mv	s0,s9
  800668:	002d1793          	slli	a5,s10,0x2
  80066c:	01a78d33          	add	s10,a5,s10
  800670:	00140413          	addi	s0,s0,1
  800674:	001d1d13          	slli	s10,s10,0x1
  800678:	00ed0d33          	add	s10,s10,a4
  80067c:	00044703          	lbu	a4,0(s0)
  800680:	fd0d0d13          	addi	s10,s10,-48
  800684:	fd070793          	addi	a5,a4,-48
  800688:	fef670e3          	bleu	a5,a2,800668 <vprintfmt+0x3a8>
  80068c:	00070e13          	mv	t3,a4
  800690:	fa5ff06f          	j	800634 <vprintfmt+0x374>
  800694:	0e0dc463          	bltz	s11,80077c <vprintfmt+0x4bc>
  800698:	00144e03          	lbu	t3,1(s0)
  80069c:	000c8413          	mv	s0,s9
  8006a0:	cd1ff06f          	j	800370 <vprintfmt+0xb0>
  8006a4:	00090593          	mv	a1,s2
  8006a8:	02500513          	li	a0,37
  8006ac:	000980e7          	jalr	s3
  8006b0:	fff44783          	lbu	a5,-1(s0)
  8006b4:	02500713          	li	a4,37
  8006b8:	00040c93          	mv	s9,s0
  8006bc:	c6e780e3          	beq	a5,a4,80031c <vprintfmt+0x5c>
  8006c0:	fffc8c93          	addi	s9,s9,-1
  8006c4:	fffcc783          	lbu	a5,-1(s9)
  8006c8:	fee79ce3          	bne	a5,a4,8006c0 <vprintfmt+0x400>
  8006cc:	c51ff06f          	j	80031c <vprintfmt+0x5c>
  8006d0:	00040513          	mv	a0,s0
  8006d4:	000980e7          	jalr	s3
  8006d8:	ed9ff06f          	j	8005b0 <vprintfmt+0x2f0>
  8006dc:	007a8793          	addi	a5,s5,7
  8006e0:	ff87f793          	andi	a5,a5,-8
  8006e4:	00878a93          	addi	s5,a5,8
  8006e8:	0007a603          	lw	a2,0(a5)
  8006ec:	0047a683          	lw	a3,4(a5)
  8006f0:	00800713          	li	a4,8
  8006f4:	cf5ff06f          	j	8003e8 <vprintfmt+0x128>
  8006f8:	007a8793          	addi	a5,s5,7
  8006fc:	ff87f793          	andi	a5,a5,-8
  800700:	00878a93          	addi	s5,a5,8
  800704:	0007a603          	lw	a2,0(a5)
  800708:	0047a683          	lw	a3,4(a5)
  80070c:	00a00713          	li	a4,10
  800710:	cd9ff06f          	j	8003e8 <vprintfmt+0x128>
  800714:	007a8793          	addi	a5,s5,7
  800718:	ff87f793          	andi	a5,a5,-8
  80071c:	00878a93          	addi	s5,a5,8
  800720:	0007a603          	lw	a2,0(a5)
  800724:	0047a683          	lw	a3,4(a5)
  800728:	01000713          	li	a4,16
  80072c:	cbdff06f          	j	8003e8 <vprintfmt+0x128>
  800730:	007a8793          	addi	a5,s5,7
  800734:	ff87f793          	andi	a5,a5,-8
  800738:	00878a93          	addi	s5,a5,8
  80073c:	0007a603          	lw	a2,0(a5)
  800740:	0047a683          	lw	a3,4(a5)
  800744:	cf1ff06f          	j	800434 <vprintfmt+0x174>
  800748:	00078693          	mv	a3,a5
  80074c:	00000617          	auipc	a2,0x0
  800750:	4c460613          	addi	a2,a2,1220 # 800c10 <error_string+0x124>
  800754:	00090593          	mv	a1,s2
  800758:	00098513          	mv	a0,s3
  80075c:	078000ef          	jal	ra,8007d4 <printfmt>
  800760:	bbdff06f          	j	80031c <vprintfmt+0x5c>
  800764:	00044783          	lbu	a5,0(s0)
  800768:	00140a93          	addi	s5,s0,1
  80076c:	00078513          	mv	a0,a5
  800770:	e4078ce3          	beqz	a5,8005c8 <vprintfmt+0x308>
  800774:	03f00413          	li	s0,63
  800778:	e19ff06f          	j	800590 <vprintfmt+0x2d0>
  80077c:	00000d93          	li	s11,0
  800780:	f19ff06f          	j	800698 <vprintfmt+0x3d8>
  800784:	03b05c63          	blez	s11,8007bc <vprintfmt+0x4fc>
  800788:	02d00793          	li	a5,45
  80078c:	00000417          	auipc	s0,0x0
  800790:	47c40413          	addi	s0,s0,1148 # 800c08 <error_string+0x11c>
  800794:	daf818e3          	bne	a6,a5,800544 <vprintfmt+0x284>
  800798:	00000a97          	auipc	s5,0x0
  80079c:	471a8a93          	addi	s5,s5,1137 # 800c09 <error_string+0x11d>
  8007a0:	000c0513          	mv	a0,s8
  8007a4:	000c0793          	mv	a5,s8
  8007a8:	03f00413          	li	s0,63
  8007ac:	de5ff06f          	j	800590 <vprintfmt+0x2d0>
  8007b0:	00070e13          	mv	t3,a4
  8007b4:	000c8413          	mv	s0,s9
  8007b8:	e7dff06f          	j	800634 <vprintfmt+0x374>
  8007bc:	000c0793          	mv	a5,s8
  8007c0:	000c0513          	mv	a0,s8
  8007c4:	00000a97          	auipc	s5,0x0
  8007c8:	445a8a93          	addi	s5,s5,1093 # 800c09 <error_string+0x11d>
  8007cc:	03f00413          	li	s0,63
  8007d0:	dc1ff06f          	j	800590 <vprintfmt+0x2d0>

008007d4 <printfmt>:
  8007d4:	fc010113          	addi	sp,sp,-64
  8007d8:	02c10313          	addi	t1,sp,44
  8007dc:	02d12623          	sw	a3,44(sp)
  8007e0:	00030693          	mv	a3,t1
  8007e4:	00112e23          	sw	ra,28(sp)
  8007e8:	02e12823          	sw	a4,48(sp)
  8007ec:	02f12a23          	sw	a5,52(sp)
  8007f0:	03012c23          	sw	a6,56(sp)
  8007f4:	03112e23          	sw	a7,60(sp)
  8007f8:	00612623          	sw	t1,12(sp)
  8007fc:	ac5ff0ef          	jal	ra,8002c0 <vprintfmt>
  800800:	01c12083          	lw	ra,28(sp)
  800804:	04010113          	addi	sp,sp,64
  800808:	00008067          	ret

0080080c <vsnprintf>:
  80080c:	fff58593          	addi	a1,a1,-1
  800810:	fe010113          	addi	sp,sp,-32
  800814:	00b505b3          	add	a1,a0,a1
  800818:	00112e23          	sw	ra,28(sp)
  80081c:	00a12223          	sw	a0,4(sp)
  800820:	00b12423          	sw	a1,8(sp)
  800824:	00012623          	sw	zero,12(sp)
  800828:	02050c63          	beqz	a0,800860 <vsnprintf+0x54>
  80082c:	00050793          	mv	a5,a0
  800830:	ffd00513          	li	a0,-3
  800834:	02f5e063          	bltu	a1,a5,800854 <vsnprintf+0x48>
  800838:	00000517          	auipc	a0,0x0
  80083c:	a6050513          	addi	a0,a0,-1440 # 800298 <sprintputch>
  800840:	00410593          	addi	a1,sp,4
  800844:	a7dff0ef          	jal	ra,8002c0 <vprintfmt>
  800848:	00412783          	lw	a5,4(sp)
  80084c:	00078023          	sb	zero,0(a5)
  800850:	00c12503          	lw	a0,12(sp)
  800854:	01c12083          	lw	ra,28(sp)
  800858:	02010113          	addi	sp,sp,32
  80085c:	00008067          	ret
  800860:	ffd00513          	li	a0,-3
  800864:	ff1ff06f          	j	800854 <vsnprintf+0x48>

00800868 <snprintf>:
  800868:	fc010113          	addi	sp,sp,-64
  80086c:	02c10313          	addi	t1,sp,44
  800870:	02d12623          	sw	a3,44(sp)
  800874:	00030693          	mv	a3,t1
  800878:	00112e23          	sw	ra,28(sp)
  80087c:	02e12823          	sw	a4,48(sp)
  800880:	02f12a23          	sw	a5,52(sp)
  800884:	03012c23          	sw	a6,56(sp)
  800888:	03112e23          	sw	a7,60(sp)
  80088c:	00612623          	sw	t1,12(sp)
  800890:	f7dff0ef          	jal	ra,80080c <vsnprintf>
  800894:	01c12083          	lw	ra,28(sp)
  800898:	04010113          	addi	sp,sp,64
  80089c:	00008067          	ret

008008a0 <forktree>:
  8008a0:	ff010113          	addi	sp,sp,-16
  8008a4:	00112623          	sw	ra,12(sp)
  8008a8:	00812423          	sw	s0,8(sp)
  8008ac:	00050413          	mv	s0,a0
  8008b0:	831ff0ef          	jal	ra,8000e0 <getpid>
  8008b4:	00040613          	mv	a2,s0
  8008b8:	00050593          	mv	a1,a0
  8008bc:	00000517          	auipc	a0,0x0
  8008c0:	36c50513          	addi	a0,a0,876 # 800c28 <error_string+0x13c>
  8008c4:	859ff0ef          	jal	ra,80011c <cprintf>
  8008c8:	00040513          	mv	a0,s0
  8008cc:	03000593          	li	a1,48
  8008d0:	01c000ef          	jal	ra,8008ec <forkchild>
  8008d4:	00040513          	mv	a0,s0
  8008d8:	00c12083          	lw	ra,12(sp)
  8008dc:	00812403          	lw	s0,8(sp)
  8008e0:	03100593          	li	a1,49
  8008e4:	01010113          	addi	sp,sp,16
  8008e8:	0040006f          	j	8008ec <forkchild>

008008ec <forkchild>:
  8008ec:	fe010113          	addi	sp,sp,-32
  8008f0:	00812c23          	sw	s0,24(sp)
  8008f4:	00912a23          	sw	s1,20(sp)
  8008f8:	00112e23          	sw	ra,28(sp)
  8008fc:	00050413          	mv	s0,a0
  800900:	00058493          	mv	s1,a1
  800904:	881ff0ef          	jal	ra,800184 <strlen>
  800908:	00300793          	li	a5,3
  80090c:	00a7fc63          	bleu	a0,a5,800924 <forkchild+0x38>
  800910:	01c12083          	lw	ra,28(sp)
  800914:	01812403          	lw	s0,24(sp)
  800918:	01412483          	lw	s1,20(sp)
  80091c:	02010113          	addi	sp,sp,32
  800920:	00008067          	ret
  800924:	00048713          	mv	a4,s1
  800928:	00040693          	mv	a3,s0
  80092c:	00000617          	auipc	a2,0x0
  800930:	2f460613          	addi	a2,a2,756 # 800c20 <error_string+0x134>
  800934:	00500593          	li	a1,5
  800938:	00810513          	addi	a0,sp,8
  80093c:	f2dff0ef          	jal	ra,800868 <snprintf>
  800940:	f98ff0ef          	jal	ra,8000d8 <fork>
  800944:	fc0516e3          	bnez	a0,800910 <forkchild+0x24>
  800948:	00810513          	addi	a0,sp,8
  80094c:	f55ff0ef          	jal	ra,8008a0 <forktree>
  800950:	f8cff0ef          	jal	ra,8000dc <yield>
  800954:	00000513          	li	a0,0
  800958:	f64ff0ef          	jal	ra,8000bc <exit>

0080095c <main>:
  80095c:	ff010113          	addi	sp,sp,-16
  800960:	00000517          	auipc	a0,0x0
  800964:	2d850513          	addi	a0,a0,728 # 800c38 <error_string+0x14c>
  800968:	00112623          	sw	ra,12(sp)
  80096c:	f35ff0ef          	jal	ra,8008a0 <forktree>
  800970:	00c12083          	lw	ra,12(sp)
  800974:	00000513          	li	a0,0
  800978:	01010113          	addi	sp,sp,16
  80097c:	00008067          	ret
