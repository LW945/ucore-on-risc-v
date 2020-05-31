
obj/__user_hello.out:     file format elf32-littleriscv


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

008000ac <exit>:
  8000ac:	ff010113          	addi	sp,sp,-16
  8000b0:	00112623          	sw	ra,12(sp)
  8000b4:	fd9ff0ef          	jal	ra,80008c <sys_exit>
  8000b8:	00000517          	auipc	a0,0x0
  8000bc:	72c50513          	addi	a0,a0,1836 # 8007e4 <main+0x44>
  8000c0:	044000ef          	jal	ra,800104 <cprintf>
  8000c4:	0000006f          	j	8000c4 <exit+0x18>

008000c8 <getpid>:
  8000c8:	fd1ff06f          	j	800098 <sys_getpid>

008000cc <_start>:
  8000cc:	090000ef          	jal	ra,80015c <umain>
  8000d0:	0000006f          	j	8000d0 <_start+0x4>

008000d4 <cputch>:
  8000d4:	ff010113          	addi	sp,sp,-16
  8000d8:	00112623          	sw	ra,12(sp)
  8000dc:	00812423          	sw	s0,8(sp)
  8000e0:	00058413          	mv	s0,a1
  8000e4:	fbdff0ef          	jal	ra,8000a0 <sys_putc>
  8000e8:	00042783          	lw	a5,0(s0)
  8000ec:	00c12083          	lw	ra,12(sp)
  8000f0:	00178793          	addi	a5,a5,1
  8000f4:	00f42023          	sw	a5,0(s0)
  8000f8:	00812403          	lw	s0,8(sp)
  8000fc:	01010113          	addi	sp,sp,16
  800100:	00008067          	ret

00800104 <cprintf>:
  800104:	fc010113          	addi	sp,sp,-64
  800108:	02410313          	addi	t1,sp,36
  80010c:	02b12223          	sw	a1,36(sp)
  800110:	02c12423          	sw	a2,40(sp)
  800114:	02d12623          	sw	a3,44(sp)
  800118:	00050613          	mv	a2,a0
  80011c:	00c10593          	addi	a1,sp,12
  800120:	00000517          	auipc	a0,0x0
  800124:	fb450513          	addi	a0,a0,-76 # 8000d4 <cputch>
  800128:	00030693          	mv	a3,t1
  80012c:	00112e23          	sw	ra,28(sp)
  800130:	02e12823          	sw	a4,48(sp)
  800134:	02f12a23          	sw	a5,52(sp)
  800138:	03012c23          	sw	a6,56(sp)
  80013c:	03112e23          	sw	a7,60(sp)
  800140:	00612423          	sw	t1,8(sp)
  800144:	00012623          	sw	zero,12(sp)
  800148:	10c000ef          	jal	ra,800254 <vprintfmt>
  80014c:	01c12083          	lw	ra,28(sp)
  800150:	00c12503          	lw	a0,12(sp)
  800154:	04010113          	addi	sp,sp,64
  800158:	00008067          	ret

0080015c <umain>:
  80015c:	ff010113          	addi	sp,sp,-16
  800160:	00112623          	sw	ra,12(sp)
  800164:	63c000ef          	jal	ra,8007a0 <main>
  800168:	f45ff0ef          	jal	ra,8000ac <exit>

0080016c <strnlen>:
  80016c:	00050693          	mv	a3,a0
  800170:	02058a63          	beqz	a1,8001a4 <strnlen+0x38>
  800174:	00054703          	lbu	a4,0(a0)
  800178:	00150793          	addi	a5,a0,1
  80017c:	02070463          	beqz	a4,8001a4 <strnlen+0x38>
  800180:	00b505b3          	add	a1,a0,a1
  800184:	0100006f          	j	800194 <strnlen+0x28>
  800188:	00178793          	addi	a5,a5,1
  80018c:	fff7c703          	lbu	a4,-1(a5)
  800190:	00070863          	beqz	a4,8001a0 <strnlen+0x34>
  800194:	40d78533          	sub	a0,a5,a3
  800198:	feb798e3          	bne	a5,a1,800188 <strnlen+0x1c>
  80019c:	00008067          	ret
  8001a0:	00008067          	ret
  8001a4:	00000513          	li	a0,0
  8001a8:	00008067          	ret

008001ac <printnum>:
  8001ac:	fe010113          	addi	sp,sp,-32
  8001b0:	00912a23          	sw	s1,20(sp)
  8001b4:	01212823          	sw	s2,16(sp)
  8001b8:	01312623          	sw	s3,12(sp)
  8001bc:	01412423          	sw	s4,8(sp)
  8001c0:	00112e23          	sw	ra,28(sp)
  8001c4:	00812c23          	sw	s0,24(sp)
  8001c8:	00050493          	mv	s1,a0
  8001cc:	00058913          	mv	s2,a1
  8001d0:	00080993          	mv	s3,a6
  8001d4:	02e67a33          	remu	s4,a2,a4
  8001d8:	04069e63          	bnez	a3,800234 <printnum+0x88>
  8001dc:	04e67c63          	bleu	a4,a2,800234 <printnum+0x88>
  8001e0:	fff78413          	addi	s0,a5,-1
  8001e4:	00805c63          	blez	s0,8001fc <printnum+0x50>
  8001e8:	fff40413          	addi	s0,s0,-1
  8001ec:	00090593          	mv	a1,s2
  8001f0:	00098513          	mv	a0,s3
  8001f4:	000480e7          	jalr	s1
  8001f8:	fe0418e3          	bnez	s0,8001e8 <printnum+0x3c>
  8001fc:	00000797          	auipc	a5,0x0
  800200:	7b878793          	addi	a5,a5,1976 # 8009b4 <error_string+0x64>
  800204:	014787b3          	add	a5,a5,s4
  800208:	00090593          	mv	a1,s2
  80020c:	00048313          	mv	t1,s1
  800210:	01c12083          	lw	ra,28(sp)
  800214:	01812403          	lw	s0,24(sp)
  800218:	01412483          	lw	s1,20(sp)
  80021c:	01012903          	lw	s2,16(sp)
  800220:	00c12983          	lw	s3,12(sp)
  800224:	00812a03          	lw	s4,8(sp)
  800228:	0007c503          	lbu	a0,0(a5)
  80022c:	02010113          	addi	sp,sp,32
  800230:	00030067          	jr	t1
  800234:	02e65633          	divu	a2,a2,a4
  800238:	00098813          	mv	a6,s3
  80023c:	fff78793          	addi	a5,a5,-1
  800240:	00000693          	li	a3,0
  800244:	00090593          	mv	a1,s2
  800248:	00048513          	mv	a0,s1
  80024c:	f61ff0ef          	jal	ra,8001ac <printnum>
  800250:	fadff06f          	j	8001fc <printnum+0x50>

00800254 <vprintfmt>:
  800254:	fb010113          	addi	sp,sp,-80
  800258:	05212023          	sw	s2,64(sp)
  80025c:	03312e23          	sw	s3,60(sp)
  800260:	03412c23          	sw	s4,56(sp)
  800264:	03512a23          	sw	s5,52(sp)
  800268:	03612823          	sw	s6,48(sp)
  80026c:	03712623          	sw	s7,44(sp)
  800270:	03812423          	sw	s8,40(sp)
  800274:	03912223          	sw	s9,36(sp)
  800278:	04112623          	sw	ra,76(sp)
  80027c:	04812423          	sw	s0,72(sp)
  800280:	04912223          	sw	s1,68(sp)
  800284:	03a12023          	sw	s10,32(sp)
  800288:	01b12e23          	sw	s11,28(sp)
  80028c:	00050993          	mv	s3,a0
  800290:	00058913          	mv	s2,a1
  800294:	00060c93          	mv	s9,a2
  800298:	00068a93          	mv	s5,a3
  80029c:	00000a17          	auipc	s4,0x0
  8002a0:	55ca0a13          	addi	s4,s4,1372 # 8007f8 <main+0x58>
  8002a4:	02800c13          	li	s8,40
  8002a8:	fff00b13          	li	s6,-1
  8002ac:	05e00b93          	li	s7,94
  8002b0:	000cc503          	lbu	a0,0(s9)
  8002b4:	02500493          	li	s1,37
  8002b8:	001c8413          	addi	s0,s9,1
  8002bc:	00950e63          	beq	a0,s1,8002d8 <vprintfmt+0x84>
  8002c0:	06050463          	beqz	a0,800328 <vprintfmt+0xd4>
  8002c4:	00090593          	mv	a1,s2
  8002c8:	00140413          	addi	s0,s0,1
  8002cc:	000980e7          	jalr	s3
  8002d0:	fff44503          	lbu	a0,-1(s0)
  8002d4:	fe9516e3          	bne	a0,s1,8002c0 <vprintfmt+0x6c>
  8002d8:	00044e03          	lbu	t3,0(s0)
  8002dc:	fff00d13          	li	s10,-1
  8002e0:	02000813          	li	a6,32
  8002e4:	00000493          	li	s1,0
  8002e8:	00000593          	li	a1,0
  8002ec:	000d0d93          	mv	s11,s10
  8002f0:	05500693          	li	a3,85
  8002f4:	00100313          	li	t1,1
  8002f8:	03000893          	li	a7,48
  8002fc:	00900613          	li	a2,9
  800300:	02d00513          	li	a0,45
  800304:	fdde0713          	addi	a4,t3,-35
  800308:	0ff77713          	andi	a4,a4,255
  80030c:	00140c93          	addi	s9,s0,1
  800310:	32e6e463          	bltu	a3,a4,800638 <vprintfmt+0x3e4>
  800314:	00271713          	slli	a4,a4,0x2
  800318:	01470733          	add	a4,a4,s4
  80031c:	00072783          	lw	a5,0(a4)
  800320:	014787b3          	add	a5,a5,s4
  800324:	00078067          	jr	a5
  800328:	04c12083          	lw	ra,76(sp)
  80032c:	04812403          	lw	s0,72(sp)
  800330:	04412483          	lw	s1,68(sp)
  800334:	04012903          	lw	s2,64(sp)
  800338:	03c12983          	lw	s3,60(sp)
  80033c:	03812a03          	lw	s4,56(sp)
  800340:	03412a83          	lw	s5,52(sp)
  800344:	03012b03          	lw	s6,48(sp)
  800348:	02c12b83          	lw	s7,44(sp)
  80034c:	02812c03          	lw	s8,40(sp)
  800350:	02412c83          	lw	s9,36(sp)
  800354:	02012d03          	lw	s10,32(sp)
  800358:	01c12d83          	lw	s11,28(sp)
  80035c:	05010113          	addi	sp,sp,80
  800360:	00008067          	ret
  800364:	00100793          	li	a5,1
  800368:	34b7c063          	blt	a5,a1,8006a8 <vprintfmt+0x454>
  80036c:	000aa603          	lw	a2,0(s5)
  800370:	00000693          	li	a3,0
  800374:	004a8a93          	addi	s5,s5,4
  800378:	01000713          	li	a4,16
  80037c:	000d8793          	mv	a5,s11
  800380:	00090593          	mv	a1,s2
  800384:	00098513          	mv	a0,s3
  800388:	e25ff0ef          	jal	ra,8001ac <printnum>
  80038c:	f25ff06f          	j	8002b0 <vprintfmt+0x5c>
  800390:	00144e03          	lbu	t3,1(s0)
  800394:	00030493          	mv	s1,t1
  800398:	000c8413          	mv	s0,s9
  80039c:	f69ff06f          	j	800304 <vprintfmt+0xb0>
  8003a0:	000aa503          	lw	a0,0(s5)
  8003a4:	00090593          	mv	a1,s2
  8003a8:	004a8a93          	addi	s5,s5,4
  8003ac:	000980e7          	jalr	s3
  8003b0:	f01ff06f          	j	8002b0 <vprintfmt+0x5c>
  8003b4:	00100793          	li	a5,1
  8003b8:	30b7c663          	blt	a5,a1,8006c4 <vprintfmt+0x470>
  8003bc:	000aa603          	lw	a2,0(s5)
  8003c0:	004a8a93          	addi	s5,s5,4
  8003c4:	41f65693          	srai	a3,a2,0x1f
  8003c8:	00a00713          	li	a4,10
  8003cc:	fa06d8e3          	bgez	a3,80037c <vprintfmt+0x128>
  8003d0:	00090593          	mv	a1,s2
  8003d4:	02d00513          	li	a0,45
  8003d8:	00d12623          	sw	a3,12(sp)
  8003dc:	00c12423          	sw	a2,8(sp)
  8003e0:	00e12223          	sw	a4,4(sp)
  8003e4:	01012023          	sw	a6,0(sp)
  8003e8:	000980e7          	jalr	s3
  8003ec:	00812603          	lw	a2,8(sp)
  8003f0:	00c12683          	lw	a3,12(sp)
  8003f4:	00012803          	lw	a6,0(sp)
  8003f8:	40c00633          	neg	a2,a2
  8003fc:	00c037b3          	snez	a5,a2
  800400:	40d006b3          	neg	a3,a3
  800404:	40f686b3          	sub	a3,a3,a5
  800408:	00412703          	lw	a4,4(sp)
  80040c:	f71ff06f          	j	80037c <vprintfmt+0x128>
  800410:	000aa783          	lw	a5,0(s5)
  800414:	01800693          	li	a3,24
  800418:	004a8a93          	addi	s5,s5,4
  80041c:	41f7d713          	srai	a4,a5,0x1f
  800420:	00f747b3          	xor	a5,a4,a5
  800424:	40e787b3          	sub	a5,a5,a4
  800428:	2af6ca63          	blt	a3,a5,8006dc <vprintfmt+0x488>
  80042c:	00279693          	slli	a3,a5,0x2
  800430:	00000717          	auipc	a4,0x0
  800434:	52070713          	addi	a4,a4,1312 # 800950 <error_string>
  800438:	00d70733          	add	a4,a4,a3
  80043c:	00072683          	lw	a3,0(a4)
  800440:	28068e63          	beqz	a3,8006dc <vprintfmt+0x488>
  800444:	00000617          	auipc	a2,0x0
  800448:	63c60613          	addi	a2,a2,1596 # 800a80 <error_string+0x130>
  80044c:	00090593          	mv	a1,s2
  800450:	00098513          	mv	a0,s3
  800454:	314000ef          	jal	ra,800768 <printfmt>
  800458:	e59ff06f          	j	8002b0 <vprintfmt+0x5c>
  80045c:	00144e03          	lbu	t3,1(s0)
  800460:	00158593          	addi	a1,a1,1
  800464:	000c8413          	mv	s0,s9
  800468:	e9dff06f          	j	800304 <vprintfmt+0xb0>
  80046c:	00100793          	li	a5,1
  800470:	20b7c063          	blt	a5,a1,800670 <vprintfmt+0x41c>
  800474:	000aa603          	lw	a2,0(s5)
  800478:	00000693          	li	a3,0
  80047c:	004a8a93          	addi	s5,s5,4
  800480:	00800713          	li	a4,8
  800484:	ef9ff06f          	j	80037c <vprintfmt+0x128>
  800488:	03000513          	li	a0,48
  80048c:	00090593          	mv	a1,s2
  800490:	01012023          	sw	a6,0(sp)
  800494:	000980e7          	jalr	s3
  800498:	00090593          	mv	a1,s2
  80049c:	07800513          	li	a0,120
  8004a0:	000980e7          	jalr	s3
  8004a4:	000aa603          	lw	a2,0(s5)
  8004a8:	00000693          	li	a3,0
  8004ac:	01000713          	li	a4,16
  8004b0:	004a8a93          	addi	s5,s5,4
  8004b4:	00012803          	lw	a6,0(sp)
  8004b8:	ec5ff06f          	j	80037c <vprintfmt+0x128>
  8004bc:	000aa403          	lw	s0,0(s5)
  8004c0:	004a8793          	addi	a5,s5,4
  8004c4:	00f12223          	sw	a5,4(sp)
  8004c8:	24040863          	beqz	s0,800718 <vprintfmt+0x4c4>
  8004cc:	05b05263          	blez	s11,800510 <vprintfmt+0x2bc>
  8004d0:	02d00793          	li	a5,45
  8004d4:	22f80263          	beq	a6,a5,8006f8 <vprintfmt+0x4a4>
  8004d8:	000d0593          	mv	a1,s10
  8004dc:	00040513          	mv	a0,s0
  8004e0:	01012023          	sw	a6,0(sp)
  8004e4:	c89ff0ef          	jal	ra,80016c <strnlen>
  8004e8:	40ad8db3          	sub	s11,s11,a0
  8004ec:	03b05263          	blez	s11,800510 <vprintfmt+0x2bc>
  8004f0:	00012803          	lw	a6,0(sp)
  8004f4:	00080513          	mv	a0,a6
  8004f8:	00090593          	mv	a1,s2
  8004fc:	01012023          	sw	a6,0(sp)
  800500:	fffd8d93          	addi	s11,s11,-1
  800504:	000980e7          	jalr	s3
  800508:	00012803          	lw	a6,0(sp)
  80050c:	fe0d94e3          	bnez	s11,8004f4 <vprintfmt+0x2a0>
  800510:	00044783          	lbu	a5,0(s0)
  800514:	00140a93          	addi	s5,s0,1
  800518:	00078513          	mv	a0,a5
  80051c:	04078c63          	beqz	a5,800574 <vprintfmt+0x320>
  800520:	03f00413          	li	s0,63
  800524:	000d4663          	bltz	s10,800530 <vprintfmt+0x2dc>
  800528:	fffd0d13          	addi	s10,s10,-1
  80052c:	036d0663          	beq	s10,s6,800558 <vprintfmt+0x304>
  800530:	00090593          	mv	a1,s2
  800534:	00048663          	beqz	s1,800540 <vprintfmt+0x2ec>
  800538:	fe078793          	addi	a5,a5,-32
  80053c:	12fbe463          	bltu	s7,a5,800664 <vprintfmt+0x410>
  800540:	000980e7          	jalr	s3
  800544:	001a8a93          	addi	s5,s5,1
  800548:	fffac783          	lbu	a5,-1(s5)
  80054c:	fffd8d93          	addi	s11,s11,-1
  800550:	00078513          	mv	a0,a5
  800554:	fc0798e3          	bnez	a5,800524 <vprintfmt+0x2d0>
  800558:	01b05e63          	blez	s11,800574 <vprintfmt+0x320>
  80055c:	02000413          	li	s0,32
  800560:	fffd8d93          	addi	s11,s11,-1
  800564:	00090593          	mv	a1,s2
  800568:	00040513          	mv	a0,s0
  80056c:	000980e7          	jalr	s3
  800570:	fe0d98e3          	bnez	s11,800560 <vprintfmt+0x30c>
  800574:	00412a83          	lw	s5,4(sp)
  800578:	d39ff06f          	j	8002b0 <vprintfmt+0x5c>
  80057c:	00100793          	li	a5,1
  800580:	10b7c663          	blt	a5,a1,80068c <vprintfmt+0x438>
  800584:	000aa603          	lw	a2,0(s5)
  800588:	00000693          	li	a3,0
  80058c:	004a8a93          	addi	s5,s5,4
  800590:	00a00713          	li	a4,10
  800594:	de9ff06f          	j	80037c <vprintfmt+0x128>
  800598:	00144e03          	lbu	t3,1(s0)
  80059c:	00050813          	mv	a6,a0
  8005a0:	000c8413          	mv	s0,s9
  8005a4:	d61ff06f          	j	800304 <vprintfmt+0xb0>
  8005a8:	00090593          	mv	a1,s2
  8005ac:	02500513          	li	a0,37
  8005b0:	000980e7          	jalr	s3
  8005b4:	cfdff06f          	j	8002b0 <vprintfmt+0x5c>
  8005b8:	000aad03          	lw	s10,0(s5)
  8005bc:	00144e03          	lbu	t3,1(s0)
  8005c0:	004a8a93          	addi	s5,s5,4
  8005c4:	000c8413          	mv	s0,s9
  8005c8:	d20ddee3          	bgez	s11,800304 <vprintfmt+0xb0>
  8005cc:	000d0d93          	mv	s11,s10
  8005d0:	fff00d13          	li	s10,-1
  8005d4:	d31ff06f          	j	800304 <vprintfmt+0xb0>
  8005d8:	00144e03          	lbu	t3,1(s0)
  8005dc:	00088813          	mv	a6,a7
  8005e0:	000c8413          	mv	s0,s9
  8005e4:	d21ff06f          	j	800304 <vprintfmt+0xb0>
  8005e8:	00144703          	lbu	a4,1(s0)
  8005ec:	fd0e0d13          	addi	s10,t3,-48
  8005f0:	fd070793          	addi	a5,a4,-48
  8005f4:	14f66863          	bltu	a2,a5,800744 <vprintfmt+0x4f0>
  8005f8:	000c8413          	mv	s0,s9
  8005fc:	002d1793          	slli	a5,s10,0x2
  800600:	01a78d33          	add	s10,a5,s10
  800604:	00140413          	addi	s0,s0,1
  800608:	001d1d13          	slli	s10,s10,0x1
  80060c:	00ed0d33          	add	s10,s10,a4
  800610:	00044703          	lbu	a4,0(s0)
  800614:	fd0d0d13          	addi	s10,s10,-48
  800618:	fd070793          	addi	a5,a4,-48
  80061c:	fef670e3          	bleu	a5,a2,8005fc <vprintfmt+0x3a8>
  800620:	00070e13          	mv	t3,a4
  800624:	fa5ff06f          	j	8005c8 <vprintfmt+0x374>
  800628:	0e0dc463          	bltz	s11,800710 <vprintfmt+0x4bc>
  80062c:	00144e03          	lbu	t3,1(s0)
  800630:	000c8413          	mv	s0,s9
  800634:	cd1ff06f          	j	800304 <vprintfmt+0xb0>
  800638:	00090593          	mv	a1,s2
  80063c:	02500513          	li	a0,37
  800640:	000980e7          	jalr	s3
  800644:	fff44783          	lbu	a5,-1(s0)
  800648:	02500713          	li	a4,37
  80064c:	00040c93          	mv	s9,s0
  800650:	c6e780e3          	beq	a5,a4,8002b0 <vprintfmt+0x5c>
  800654:	fffc8c93          	addi	s9,s9,-1
  800658:	fffcc783          	lbu	a5,-1(s9)
  80065c:	fee79ce3          	bne	a5,a4,800654 <vprintfmt+0x400>
  800660:	c51ff06f          	j	8002b0 <vprintfmt+0x5c>
  800664:	00040513          	mv	a0,s0
  800668:	000980e7          	jalr	s3
  80066c:	ed9ff06f          	j	800544 <vprintfmt+0x2f0>
  800670:	007a8793          	addi	a5,s5,7
  800674:	ff87f793          	andi	a5,a5,-8
  800678:	00878a93          	addi	s5,a5,8
  80067c:	0007a603          	lw	a2,0(a5)
  800680:	0047a683          	lw	a3,4(a5)
  800684:	00800713          	li	a4,8
  800688:	cf5ff06f          	j	80037c <vprintfmt+0x128>
  80068c:	007a8793          	addi	a5,s5,7
  800690:	ff87f793          	andi	a5,a5,-8
  800694:	00878a93          	addi	s5,a5,8
  800698:	0007a603          	lw	a2,0(a5)
  80069c:	0047a683          	lw	a3,4(a5)
  8006a0:	00a00713          	li	a4,10
  8006a4:	cd9ff06f          	j	80037c <vprintfmt+0x128>
  8006a8:	007a8793          	addi	a5,s5,7
  8006ac:	ff87f793          	andi	a5,a5,-8
  8006b0:	00878a93          	addi	s5,a5,8
  8006b4:	0007a603          	lw	a2,0(a5)
  8006b8:	0047a683          	lw	a3,4(a5)
  8006bc:	01000713          	li	a4,16
  8006c0:	cbdff06f          	j	80037c <vprintfmt+0x128>
  8006c4:	007a8793          	addi	a5,s5,7
  8006c8:	ff87f793          	andi	a5,a5,-8
  8006cc:	00878a93          	addi	s5,a5,8
  8006d0:	0007a603          	lw	a2,0(a5)
  8006d4:	0047a683          	lw	a3,4(a5)
  8006d8:	cf1ff06f          	j	8003c8 <vprintfmt+0x174>
  8006dc:	00078693          	mv	a3,a5
  8006e0:	00000617          	auipc	a2,0x0
  8006e4:	39460613          	addi	a2,a2,916 # 800a74 <error_string+0x124>
  8006e8:	00090593          	mv	a1,s2
  8006ec:	00098513          	mv	a0,s3
  8006f0:	078000ef          	jal	ra,800768 <printfmt>
  8006f4:	bbdff06f          	j	8002b0 <vprintfmt+0x5c>
  8006f8:	00044783          	lbu	a5,0(s0)
  8006fc:	00140a93          	addi	s5,s0,1
  800700:	00078513          	mv	a0,a5
  800704:	e4078ce3          	beqz	a5,80055c <vprintfmt+0x308>
  800708:	03f00413          	li	s0,63
  80070c:	e19ff06f          	j	800524 <vprintfmt+0x2d0>
  800710:	00000d93          	li	s11,0
  800714:	f19ff06f          	j	80062c <vprintfmt+0x3d8>
  800718:	03b05c63          	blez	s11,800750 <vprintfmt+0x4fc>
  80071c:	02d00793          	li	a5,45
  800720:	00000417          	auipc	s0,0x0
  800724:	34c40413          	addi	s0,s0,844 # 800a6c <error_string+0x11c>
  800728:	daf818e3          	bne	a6,a5,8004d8 <vprintfmt+0x284>
  80072c:	00000a97          	auipc	s5,0x0
  800730:	341a8a93          	addi	s5,s5,833 # 800a6d <error_string+0x11d>
  800734:	000c0513          	mv	a0,s8
  800738:	000c0793          	mv	a5,s8
  80073c:	03f00413          	li	s0,63
  800740:	de5ff06f          	j	800524 <vprintfmt+0x2d0>
  800744:	00070e13          	mv	t3,a4
  800748:	000c8413          	mv	s0,s9
  80074c:	e7dff06f          	j	8005c8 <vprintfmt+0x374>
  800750:	000c0793          	mv	a5,s8
  800754:	000c0513          	mv	a0,s8
  800758:	00000a97          	auipc	s5,0x0
  80075c:	315a8a93          	addi	s5,s5,789 # 800a6d <error_string+0x11d>
  800760:	03f00413          	li	s0,63
  800764:	dc1ff06f          	j	800524 <vprintfmt+0x2d0>

00800768 <printfmt>:
  800768:	fc010113          	addi	sp,sp,-64
  80076c:	02c10313          	addi	t1,sp,44
  800770:	02d12623          	sw	a3,44(sp)
  800774:	00030693          	mv	a3,t1
  800778:	00112e23          	sw	ra,28(sp)
  80077c:	02e12823          	sw	a4,48(sp)
  800780:	02f12a23          	sw	a5,52(sp)
  800784:	03012c23          	sw	a6,56(sp)
  800788:	03112e23          	sw	a7,60(sp)
  80078c:	00612623          	sw	t1,12(sp)
  800790:	ac5ff0ef          	jal	ra,800254 <vprintfmt>
  800794:	01c12083          	lw	ra,28(sp)
  800798:	04010113          	addi	sp,sp,64
  80079c:	00008067          	ret

008007a0 <main>:
  8007a0:	ff010113          	addi	sp,sp,-16
  8007a4:	00000517          	auipc	a0,0x0
  8007a8:	2e050513          	addi	a0,a0,736 # 800a84 <error_string+0x134>
  8007ac:	00112623          	sw	ra,12(sp)
  8007b0:	955ff0ef          	jal	ra,800104 <cprintf>
  8007b4:	915ff0ef          	jal	ra,8000c8 <getpid>
  8007b8:	00050593          	mv	a1,a0
  8007bc:	00000517          	auipc	a0,0x0
  8007c0:	2d850513          	addi	a0,a0,728 # 800a94 <error_string+0x144>
  8007c4:	941ff0ef          	jal	ra,800104 <cprintf>
  8007c8:	00000517          	auipc	a0,0x0
  8007cc:	2e050513          	addi	a0,a0,736 # 800aa8 <error_string+0x158>
  8007d0:	935ff0ef          	jal	ra,800104 <cprintf>
  8007d4:	00c12083          	lw	ra,12(sp)
  8007d8:	00000513          	li	a0,0
  8007dc:	01010113          	addi	sp,sp,16
  8007e0:	00008067          	ret
