
obj/__user_pgdir.out:     file format elf32-littleriscv


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

00800098 <sys_getpid>:
  800098:	01200513          	li	a0,18
  80009c:	f85ff06f          	j	800020 <syscall>

008000a0 <sys_putc>:
  8000a0:	00050593          	mv	a1,a0
  8000a4:	01e00513          	li	a0,30
  8000a8:	f79ff06f          	j	800020 <syscall>

008000ac <sys_pgdir>:
  8000ac:	01f00513          	li	a0,31
  8000b0:	f71ff06f          	j	800020 <syscall>

008000b4 <exit>:
  8000b4:	ff010113          	addi	sp,sp,-16
  8000b8:	00112623          	sw	ra,12(sp)
  8000bc:	fd1ff0ef          	jal	ra,80008c <sys_exit>
  8000c0:	00000517          	auipc	a0,0x0
  8000c4:	72850513          	addi	a0,a0,1832 # 8007e8 <main+0x3c>
  8000c8:	048000ef          	jal	ra,800110 <cprintf>
  8000cc:	0000006f          	j	8000cc <exit+0x18>

008000d0 <getpid>:
  8000d0:	fc9ff06f          	j	800098 <sys_getpid>

008000d4 <print_pgdir>:
  8000d4:	fd9ff06f          	j	8000ac <sys_pgdir>

008000d8 <_start>:
  8000d8:	090000ef          	jal	ra,800168 <umain>
  8000dc:	0000006f          	j	8000dc <_start+0x4>

008000e0 <cputch>:
  8000e0:	ff010113          	addi	sp,sp,-16
  8000e4:	00112623          	sw	ra,12(sp)
  8000e8:	00812423          	sw	s0,8(sp)
  8000ec:	00058413          	mv	s0,a1
  8000f0:	fb1ff0ef          	jal	ra,8000a0 <sys_putc>
  8000f4:	00042783          	lw	a5,0(s0)
  8000f8:	00c12083          	lw	ra,12(sp)
  8000fc:	00178793          	addi	a5,a5,1
  800100:	00f42023          	sw	a5,0(s0)
  800104:	00812403          	lw	s0,8(sp)
  800108:	01010113          	addi	sp,sp,16
  80010c:	00008067          	ret

00800110 <cprintf>:
  800110:	fc010113          	addi	sp,sp,-64
  800114:	02410313          	addi	t1,sp,36
  800118:	02b12223          	sw	a1,36(sp)
  80011c:	02c12423          	sw	a2,40(sp)
  800120:	02d12623          	sw	a3,44(sp)
  800124:	00050613          	mv	a2,a0
  800128:	00c10593          	addi	a1,sp,12
  80012c:	00000517          	auipc	a0,0x0
  800130:	fb450513          	addi	a0,a0,-76 # 8000e0 <cputch>
  800134:	00030693          	mv	a3,t1
  800138:	00112e23          	sw	ra,28(sp)
  80013c:	02e12823          	sw	a4,48(sp)
  800140:	02f12a23          	sw	a5,52(sp)
  800144:	03012c23          	sw	a6,56(sp)
  800148:	03112e23          	sw	a7,60(sp)
  80014c:	00612423          	sw	t1,8(sp)
  800150:	00012623          	sw	zero,12(sp)
  800154:	10c000ef          	jal	ra,800260 <vprintfmt>
  800158:	01c12083          	lw	ra,28(sp)
  80015c:	00c12503          	lw	a0,12(sp)
  800160:	04010113          	addi	sp,sp,64
  800164:	00008067          	ret

00800168 <umain>:
  800168:	ff010113          	addi	sp,sp,-16
  80016c:	00112623          	sw	ra,12(sp)
  800170:	63c000ef          	jal	ra,8007ac <main>
  800174:	f41ff0ef          	jal	ra,8000b4 <exit>

00800178 <strnlen>:
  800178:	00050693          	mv	a3,a0
  80017c:	02058a63          	beqz	a1,8001b0 <strnlen+0x38>
  800180:	00054703          	lbu	a4,0(a0)
  800184:	00150793          	addi	a5,a0,1
  800188:	02070463          	beqz	a4,8001b0 <strnlen+0x38>
  80018c:	00b505b3          	add	a1,a0,a1
  800190:	0100006f          	j	8001a0 <strnlen+0x28>
  800194:	00178793          	addi	a5,a5,1
  800198:	fff7c703          	lbu	a4,-1(a5)
  80019c:	00070863          	beqz	a4,8001ac <strnlen+0x34>
  8001a0:	40d78533          	sub	a0,a5,a3
  8001a4:	feb798e3          	bne	a5,a1,800194 <strnlen+0x1c>
  8001a8:	00008067          	ret
  8001ac:	00008067          	ret
  8001b0:	00000513          	li	a0,0
  8001b4:	00008067          	ret

008001b8 <printnum>:
  8001b8:	fe010113          	addi	sp,sp,-32
  8001bc:	00912a23          	sw	s1,20(sp)
  8001c0:	01212823          	sw	s2,16(sp)
  8001c4:	01312623          	sw	s3,12(sp)
  8001c8:	01412423          	sw	s4,8(sp)
  8001cc:	00112e23          	sw	ra,28(sp)
  8001d0:	00812c23          	sw	s0,24(sp)
  8001d4:	00050493          	mv	s1,a0
  8001d8:	00058913          	mv	s2,a1
  8001dc:	00080993          	mv	s3,a6
  8001e0:	02e67a33          	remu	s4,a2,a4
  8001e4:	04069e63          	bnez	a3,800240 <printnum+0x88>
  8001e8:	04e67c63          	bleu	a4,a2,800240 <printnum+0x88>
  8001ec:	fff78413          	addi	s0,a5,-1
  8001f0:	00805c63          	blez	s0,800208 <printnum+0x50>
  8001f4:	fff40413          	addi	s0,s0,-1
  8001f8:	00090593          	mv	a1,s2
  8001fc:	00098513          	mv	a0,s3
  800200:	000480e7          	jalr	s1
  800204:	fe0418e3          	bnez	s0,8001f4 <printnum+0x3c>
  800208:	00000797          	auipc	a5,0x0
  80020c:	7b078793          	addi	a5,a5,1968 # 8009b8 <error_string+0x64>
  800210:	014787b3          	add	a5,a5,s4
  800214:	00090593          	mv	a1,s2
  800218:	00048313          	mv	t1,s1
  80021c:	01c12083          	lw	ra,28(sp)
  800220:	01812403          	lw	s0,24(sp)
  800224:	01412483          	lw	s1,20(sp)
  800228:	01012903          	lw	s2,16(sp)
  80022c:	00c12983          	lw	s3,12(sp)
  800230:	00812a03          	lw	s4,8(sp)
  800234:	0007c503          	lbu	a0,0(a5)
  800238:	02010113          	addi	sp,sp,32
  80023c:	00030067          	jr	t1
  800240:	02e65633          	divu	a2,a2,a4
  800244:	00098813          	mv	a6,s3
  800248:	fff78793          	addi	a5,a5,-1
  80024c:	00000693          	li	a3,0
  800250:	00090593          	mv	a1,s2
  800254:	00048513          	mv	a0,s1
  800258:	f61ff0ef          	jal	ra,8001b8 <printnum>
  80025c:	fadff06f          	j	800208 <printnum+0x50>

00800260 <vprintfmt>:
  800260:	fb010113          	addi	sp,sp,-80
  800264:	05212023          	sw	s2,64(sp)
  800268:	03312e23          	sw	s3,60(sp)
  80026c:	03412c23          	sw	s4,56(sp)
  800270:	03512a23          	sw	s5,52(sp)
  800274:	03612823          	sw	s6,48(sp)
  800278:	03712623          	sw	s7,44(sp)
  80027c:	03812423          	sw	s8,40(sp)
  800280:	03912223          	sw	s9,36(sp)
  800284:	04112623          	sw	ra,76(sp)
  800288:	04812423          	sw	s0,72(sp)
  80028c:	04912223          	sw	s1,68(sp)
  800290:	03a12023          	sw	s10,32(sp)
  800294:	01b12e23          	sw	s11,28(sp)
  800298:	00050993          	mv	s3,a0
  80029c:	00058913          	mv	s2,a1
  8002a0:	00060c93          	mv	s9,a2
  8002a4:	00068a93          	mv	s5,a3
  8002a8:	00000a17          	auipc	s4,0x0
  8002ac:	554a0a13          	addi	s4,s4,1364 # 8007fc <main+0x50>
  8002b0:	02800c13          	li	s8,40
  8002b4:	fff00b13          	li	s6,-1
  8002b8:	05e00b93          	li	s7,94
  8002bc:	000cc503          	lbu	a0,0(s9)
  8002c0:	02500493          	li	s1,37
  8002c4:	001c8413          	addi	s0,s9,1
  8002c8:	00950e63          	beq	a0,s1,8002e4 <vprintfmt+0x84>
  8002cc:	06050463          	beqz	a0,800334 <vprintfmt+0xd4>
  8002d0:	00090593          	mv	a1,s2
  8002d4:	00140413          	addi	s0,s0,1
  8002d8:	000980e7          	jalr	s3
  8002dc:	fff44503          	lbu	a0,-1(s0)
  8002e0:	fe9516e3          	bne	a0,s1,8002cc <vprintfmt+0x6c>
  8002e4:	00044e03          	lbu	t3,0(s0)
  8002e8:	fff00d13          	li	s10,-1
  8002ec:	02000813          	li	a6,32
  8002f0:	00000493          	li	s1,0
  8002f4:	00000593          	li	a1,0
  8002f8:	000d0d93          	mv	s11,s10
  8002fc:	05500693          	li	a3,85
  800300:	00100313          	li	t1,1
  800304:	03000893          	li	a7,48
  800308:	00900613          	li	a2,9
  80030c:	02d00513          	li	a0,45
  800310:	fdde0713          	addi	a4,t3,-35
  800314:	0ff77713          	andi	a4,a4,255
  800318:	00140c93          	addi	s9,s0,1
  80031c:	32e6e463          	bltu	a3,a4,800644 <vprintfmt+0x3e4>
  800320:	00271713          	slli	a4,a4,0x2
  800324:	01470733          	add	a4,a4,s4
  800328:	00072783          	lw	a5,0(a4)
  80032c:	014787b3          	add	a5,a5,s4
  800330:	00078067          	jr	a5
  800334:	04c12083          	lw	ra,76(sp)
  800338:	04812403          	lw	s0,72(sp)
  80033c:	04412483          	lw	s1,68(sp)
  800340:	04012903          	lw	s2,64(sp)
  800344:	03c12983          	lw	s3,60(sp)
  800348:	03812a03          	lw	s4,56(sp)
  80034c:	03412a83          	lw	s5,52(sp)
  800350:	03012b03          	lw	s6,48(sp)
  800354:	02c12b83          	lw	s7,44(sp)
  800358:	02812c03          	lw	s8,40(sp)
  80035c:	02412c83          	lw	s9,36(sp)
  800360:	02012d03          	lw	s10,32(sp)
  800364:	01c12d83          	lw	s11,28(sp)
  800368:	05010113          	addi	sp,sp,80
  80036c:	00008067          	ret
  800370:	00100793          	li	a5,1
  800374:	34b7c063          	blt	a5,a1,8006b4 <vprintfmt+0x454>
  800378:	000aa603          	lw	a2,0(s5)
  80037c:	00000693          	li	a3,0
  800380:	004a8a93          	addi	s5,s5,4
  800384:	01000713          	li	a4,16
  800388:	000d8793          	mv	a5,s11
  80038c:	00090593          	mv	a1,s2
  800390:	00098513          	mv	a0,s3
  800394:	e25ff0ef          	jal	ra,8001b8 <printnum>
  800398:	f25ff06f          	j	8002bc <vprintfmt+0x5c>
  80039c:	00144e03          	lbu	t3,1(s0)
  8003a0:	00030493          	mv	s1,t1
  8003a4:	000c8413          	mv	s0,s9
  8003a8:	f69ff06f          	j	800310 <vprintfmt+0xb0>
  8003ac:	000aa503          	lw	a0,0(s5)
  8003b0:	00090593          	mv	a1,s2
  8003b4:	004a8a93          	addi	s5,s5,4
  8003b8:	000980e7          	jalr	s3
  8003bc:	f01ff06f          	j	8002bc <vprintfmt+0x5c>
  8003c0:	00100793          	li	a5,1
  8003c4:	30b7c663          	blt	a5,a1,8006d0 <vprintfmt+0x470>
  8003c8:	000aa603          	lw	a2,0(s5)
  8003cc:	004a8a93          	addi	s5,s5,4
  8003d0:	41f65693          	srai	a3,a2,0x1f
  8003d4:	00a00713          	li	a4,10
  8003d8:	fa06d8e3          	bgez	a3,800388 <vprintfmt+0x128>
  8003dc:	00090593          	mv	a1,s2
  8003e0:	02d00513          	li	a0,45
  8003e4:	00d12623          	sw	a3,12(sp)
  8003e8:	00c12423          	sw	a2,8(sp)
  8003ec:	00e12223          	sw	a4,4(sp)
  8003f0:	01012023          	sw	a6,0(sp)
  8003f4:	000980e7          	jalr	s3
  8003f8:	00812603          	lw	a2,8(sp)
  8003fc:	00c12683          	lw	a3,12(sp)
  800400:	00012803          	lw	a6,0(sp)
  800404:	40c00633          	neg	a2,a2
  800408:	00c037b3          	snez	a5,a2
  80040c:	40d006b3          	neg	a3,a3
  800410:	40f686b3          	sub	a3,a3,a5
  800414:	00412703          	lw	a4,4(sp)
  800418:	f71ff06f          	j	800388 <vprintfmt+0x128>
  80041c:	000aa783          	lw	a5,0(s5)
  800420:	01800693          	li	a3,24
  800424:	004a8a93          	addi	s5,s5,4
  800428:	41f7d713          	srai	a4,a5,0x1f
  80042c:	00f747b3          	xor	a5,a4,a5
  800430:	40e787b3          	sub	a5,a5,a4
  800434:	2af6ca63          	blt	a3,a5,8006e8 <vprintfmt+0x488>
  800438:	00279693          	slli	a3,a5,0x2
  80043c:	00000717          	auipc	a4,0x0
  800440:	51870713          	addi	a4,a4,1304 # 800954 <error_string>
  800444:	00d70733          	add	a4,a4,a3
  800448:	00072683          	lw	a3,0(a4)
  80044c:	28068e63          	beqz	a3,8006e8 <vprintfmt+0x488>
  800450:	00000617          	auipc	a2,0x0
  800454:	63460613          	addi	a2,a2,1588 # 800a84 <error_string+0x130>
  800458:	00090593          	mv	a1,s2
  80045c:	00098513          	mv	a0,s3
  800460:	314000ef          	jal	ra,800774 <printfmt>
  800464:	e59ff06f          	j	8002bc <vprintfmt+0x5c>
  800468:	00144e03          	lbu	t3,1(s0)
  80046c:	00158593          	addi	a1,a1,1
  800470:	000c8413          	mv	s0,s9
  800474:	e9dff06f          	j	800310 <vprintfmt+0xb0>
  800478:	00100793          	li	a5,1
  80047c:	20b7c063          	blt	a5,a1,80067c <vprintfmt+0x41c>
  800480:	000aa603          	lw	a2,0(s5)
  800484:	00000693          	li	a3,0
  800488:	004a8a93          	addi	s5,s5,4
  80048c:	00800713          	li	a4,8
  800490:	ef9ff06f          	j	800388 <vprintfmt+0x128>
  800494:	03000513          	li	a0,48
  800498:	00090593          	mv	a1,s2
  80049c:	01012023          	sw	a6,0(sp)
  8004a0:	000980e7          	jalr	s3
  8004a4:	00090593          	mv	a1,s2
  8004a8:	07800513          	li	a0,120
  8004ac:	000980e7          	jalr	s3
  8004b0:	000aa603          	lw	a2,0(s5)
  8004b4:	00000693          	li	a3,0
  8004b8:	01000713          	li	a4,16
  8004bc:	004a8a93          	addi	s5,s5,4
  8004c0:	00012803          	lw	a6,0(sp)
  8004c4:	ec5ff06f          	j	800388 <vprintfmt+0x128>
  8004c8:	000aa403          	lw	s0,0(s5)
  8004cc:	004a8793          	addi	a5,s5,4
  8004d0:	00f12223          	sw	a5,4(sp)
  8004d4:	24040863          	beqz	s0,800724 <vprintfmt+0x4c4>
  8004d8:	05b05263          	blez	s11,80051c <vprintfmt+0x2bc>
  8004dc:	02d00793          	li	a5,45
  8004e0:	22f80263          	beq	a6,a5,800704 <vprintfmt+0x4a4>
  8004e4:	000d0593          	mv	a1,s10
  8004e8:	00040513          	mv	a0,s0
  8004ec:	01012023          	sw	a6,0(sp)
  8004f0:	c89ff0ef          	jal	ra,800178 <strnlen>
  8004f4:	40ad8db3          	sub	s11,s11,a0
  8004f8:	03b05263          	blez	s11,80051c <vprintfmt+0x2bc>
  8004fc:	00012803          	lw	a6,0(sp)
  800500:	00080513          	mv	a0,a6
  800504:	00090593          	mv	a1,s2
  800508:	01012023          	sw	a6,0(sp)
  80050c:	fffd8d93          	addi	s11,s11,-1
  800510:	000980e7          	jalr	s3
  800514:	00012803          	lw	a6,0(sp)
  800518:	fe0d94e3          	bnez	s11,800500 <vprintfmt+0x2a0>
  80051c:	00044783          	lbu	a5,0(s0)
  800520:	00140a93          	addi	s5,s0,1
  800524:	00078513          	mv	a0,a5
  800528:	04078c63          	beqz	a5,800580 <vprintfmt+0x320>
  80052c:	03f00413          	li	s0,63
  800530:	000d4663          	bltz	s10,80053c <vprintfmt+0x2dc>
  800534:	fffd0d13          	addi	s10,s10,-1
  800538:	036d0663          	beq	s10,s6,800564 <vprintfmt+0x304>
  80053c:	00090593          	mv	a1,s2
  800540:	00048663          	beqz	s1,80054c <vprintfmt+0x2ec>
  800544:	fe078793          	addi	a5,a5,-32
  800548:	12fbe463          	bltu	s7,a5,800670 <vprintfmt+0x410>
  80054c:	000980e7          	jalr	s3
  800550:	001a8a93          	addi	s5,s5,1
  800554:	fffac783          	lbu	a5,-1(s5)
  800558:	fffd8d93          	addi	s11,s11,-1
  80055c:	00078513          	mv	a0,a5
  800560:	fc0798e3          	bnez	a5,800530 <vprintfmt+0x2d0>
  800564:	01b05e63          	blez	s11,800580 <vprintfmt+0x320>
  800568:	02000413          	li	s0,32
  80056c:	fffd8d93          	addi	s11,s11,-1
  800570:	00090593          	mv	a1,s2
  800574:	00040513          	mv	a0,s0
  800578:	000980e7          	jalr	s3
  80057c:	fe0d98e3          	bnez	s11,80056c <vprintfmt+0x30c>
  800580:	00412a83          	lw	s5,4(sp)
  800584:	d39ff06f          	j	8002bc <vprintfmt+0x5c>
  800588:	00100793          	li	a5,1
  80058c:	10b7c663          	blt	a5,a1,800698 <vprintfmt+0x438>
  800590:	000aa603          	lw	a2,0(s5)
  800594:	00000693          	li	a3,0
  800598:	004a8a93          	addi	s5,s5,4
  80059c:	00a00713          	li	a4,10
  8005a0:	de9ff06f          	j	800388 <vprintfmt+0x128>
  8005a4:	00144e03          	lbu	t3,1(s0)
  8005a8:	00050813          	mv	a6,a0
  8005ac:	000c8413          	mv	s0,s9
  8005b0:	d61ff06f          	j	800310 <vprintfmt+0xb0>
  8005b4:	00090593          	mv	a1,s2
  8005b8:	02500513          	li	a0,37
  8005bc:	000980e7          	jalr	s3
  8005c0:	cfdff06f          	j	8002bc <vprintfmt+0x5c>
  8005c4:	000aad03          	lw	s10,0(s5)
  8005c8:	00144e03          	lbu	t3,1(s0)
  8005cc:	004a8a93          	addi	s5,s5,4
  8005d0:	000c8413          	mv	s0,s9
  8005d4:	d20ddee3          	bgez	s11,800310 <vprintfmt+0xb0>
  8005d8:	000d0d93          	mv	s11,s10
  8005dc:	fff00d13          	li	s10,-1
  8005e0:	d31ff06f          	j	800310 <vprintfmt+0xb0>
  8005e4:	00144e03          	lbu	t3,1(s0)
  8005e8:	00088813          	mv	a6,a7
  8005ec:	000c8413          	mv	s0,s9
  8005f0:	d21ff06f          	j	800310 <vprintfmt+0xb0>
  8005f4:	00144703          	lbu	a4,1(s0)
  8005f8:	fd0e0d13          	addi	s10,t3,-48
  8005fc:	fd070793          	addi	a5,a4,-48
  800600:	14f66863          	bltu	a2,a5,800750 <vprintfmt+0x4f0>
  800604:	000c8413          	mv	s0,s9
  800608:	002d1793          	slli	a5,s10,0x2
  80060c:	01a78d33          	add	s10,a5,s10
  800610:	00140413          	addi	s0,s0,1
  800614:	001d1d13          	slli	s10,s10,0x1
  800618:	00ed0d33          	add	s10,s10,a4
  80061c:	00044703          	lbu	a4,0(s0)
  800620:	fd0d0d13          	addi	s10,s10,-48
  800624:	fd070793          	addi	a5,a4,-48
  800628:	fef670e3          	bleu	a5,a2,800608 <vprintfmt+0x3a8>
  80062c:	00070e13          	mv	t3,a4
  800630:	fa5ff06f          	j	8005d4 <vprintfmt+0x374>
  800634:	0e0dc463          	bltz	s11,80071c <vprintfmt+0x4bc>
  800638:	00144e03          	lbu	t3,1(s0)
  80063c:	000c8413          	mv	s0,s9
  800640:	cd1ff06f          	j	800310 <vprintfmt+0xb0>
  800644:	00090593          	mv	a1,s2
  800648:	02500513          	li	a0,37
  80064c:	000980e7          	jalr	s3
  800650:	fff44783          	lbu	a5,-1(s0)
  800654:	02500713          	li	a4,37
  800658:	00040c93          	mv	s9,s0
  80065c:	c6e780e3          	beq	a5,a4,8002bc <vprintfmt+0x5c>
  800660:	fffc8c93          	addi	s9,s9,-1
  800664:	fffcc783          	lbu	a5,-1(s9)
  800668:	fee79ce3          	bne	a5,a4,800660 <vprintfmt+0x400>
  80066c:	c51ff06f          	j	8002bc <vprintfmt+0x5c>
  800670:	00040513          	mv	a0,s0
  800674:	000980e7          	jalr	s3
  800678:	ed9ff06f          	j	800550 <vprintfmt+0x2f0>
  80067c:	007a8793          	addi	a5,s5,7
  800680:	ff87f793          	andi	a5,a5,-8
  800684:	00878a93          	addi	s5,a5,8
  800688:	0007a603          	lw	a2,0(a5)
  80068c:	0047a683          	lw	a3,4(a5)
  800690:	00800713          	li	a4,8
  800694:	cf5ff06f          	j	800388 <vprintfmt+0x128>
  800698:	007a8793          	addi	a5,s5,7
  80069c:	ff87f793          	andi	a5,a5,-8
  8006a0:	00878a93          	addi	s5,a5,8
  8006a4:	0007a603          	lw	a2,0(a5)
  8006a8:	0047a683          	lw	a3,4(a5)
  8006ac:	00a00713          	li	a4,10
  8006b0:	cd9ff06f          	j	800388 <vprintfmt+0x128>
  8006b4:	007a8793          	addi	a5,s5,7
  8006b8:	ff87f793          	andi	a5,a5,-8
  8006bc:	00878a93          	addi	s5,a5,8
  8006c0:	0007a603          	lw	a2,0(a5)
  8006c4:	0047a683          	lw	a3,4(a5)
  8006c8:	01000713          	li	a4,16
  8006cc:	cbdff06f          	j	800388 <vprintfmt+0x128>
  8006d0:	007a8793          	addi	a5,s5,7
  8006d4:	ff87f793          	andi	a5,a5,-8
  8006d8:	00878a93          	addi	s5,a5,8
  8006dc:	0007a603          	lw	a2,0(a5)
  8006e0:	0047a683          	lw	a3,4(a5)
  8006e4:	cf1ff06f          	j	8003d4 <vprintfmt+0x174>
  8006e8:	00078693          	mv	a3,a5
  8006ec:	00000617          	auipc	a2,0x0
  8006f0:	38c60613          	addi	a2,a2,908 # 800a78 <error_string+0x124>
  8006f4:	00090593          	mv	a1,s2
  8006f8:	00098513          	mv	a0,s3
  8006fc:	078000ef          	jal	ra,800774 <printfmt>
  800700:	bbdff06f          	j	8002bc <vprintfmt+0x5c>
  800704:	00044783          	lbu	a5,0(s0)
  800708:	00140a93          	addi	s5,s0,1
  80070c:	00078513          	mv	a0,a5
  800710:	e4078ce3          	beqz	a5,800568 <vprintfmt+0x308>
  800714:	03f00413          	li	s0,63
  800718:	e19ff06f          	j	800530 <vprintfmt+0x2d0>
  80071c:	00000d93          	li	s11,0
  800720:	f19ff06f          	j	800638 <vprintfmt+0x3d8>
  800724:	03b05c63          	blez	s11,80075c <vprintfmt+0x4fc>
  800728:	02d00793          	li	a5,45
  80072c:	00000417          	auipc	s0,0x0
  800730:	34440413          	addi	s0,s0,836 # 800a70 <error_string+0x11c>
  800734:	daf818e3          	bne	a6,a5,8004e4 <vprintfmt+0x284>
  800738:	00000a97          	auipc	s5,0x0
  80073c:	339a8a93          	addi	s5,s5,825 # 800a71 <error_string+0x11d>
  800740:	000c0513          	mv	a0,s8
  800744:	000c0793          	mv	a5,s8
  800748:	03f00413          	li	s0,63
  80074c:	de5ff06f          	j	800530 <vprintfmt+0x2d0>
  800750:	00070e13          	mv	t3,a4
  800754:	000c8413          	mv	s0,s9
  800758:	e7dff06f          	j	8005d4 <vprintfmt+0x374>
  80075c:	000c0793          	mv	a5,s8
  800760:	000c0513          	mv	a0,s8
  800764:	00000a97          	auipc	s5,0x0
  800768:	30da8a93          	addi	s5,s5,781 # 800a71 <error_string+0x11d>
  80076c:	03f00413          	li	s0,63
  800770:	dc1ff06f          	j	800530 <vprintfmt+0x2d0>

00800774 <printfmt>:
  800774:	fc010113          	addi	sp,sp,-64
  800778:	02c10313          	addi	t1,sp,44
  80077c:	02d12623          	sw	a3,44(sp)
  800780:	00030693          	mv	a3,t1
  800784:	00112e23          	sw	ra,28(sp)
  800788:	02e12823          	sw	a4,48(sp)
  80078c:	02f12a23          	sw	a5,52(sp)
  800790:	03012c23          	sw	a6,56(sp)
  800794:	03112e23          	sw	a7,60(sp)
  800798:	00612623          	sw	t1,12(sp)
  80079c:	ac5ff0ef          	jal	ra,800260 <vprintfmt>
  8007a0:	01c12083          	lw	ra,28(sp)
  8007a4:	04010113          	addi	sp,sp,64
  8007a8:	00008067          	ret

008007ac <main>:
  8007ac:	ff010113          	addi	sp,sp,-16
  8007b0:	00112623          	sw	ra,12(sp)
  8007b4:	91dff0ef          	jal	ra,8000d0 <getpid>
  8007b8:	00050593          	mv	a1,a0
  8007bc:	00000517          	auipc	a0,0x0
  8007c0:	2cc50513          	addi	a0,a0,716 # 800a88 <error_string+0x134>
  8007c4:	94dff0ef          	jal	ra,800110 <cprintf>
  8007c8:	90dff0ef          	jal	ra,8000d4 <print_pgdir>
  8007cc:	00000517          	auipc	a0,0x0
  8007d0:	2d450513          	addi	a0,a0,724 # 800aa0 <error_string+0x14c>
  8007d4:	93dff0ef          	jal	ra,800110 <cprintf>
  8007d8:	00c12083          	lw	ra,12(sp)
  8007dc:	00000513          	li	a0,0
  8007e0:	01010113          	addi	sp,sp,16
  8007e4:	00008067          	ret
