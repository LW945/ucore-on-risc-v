
obj/__user_exit.out:     file format elf32-littleriscv


Disassembly of section .text:

00800020 <__panic>:
  800020:	fc010113          	addi	sp,sp,-64
  800024:	00812c23          	sw	s0,24(sp)
  800028:	02f12a23          	sw	a5,52(sp)
  80002c:	00060413          	mv	s0,a2
  800030:	02c10793          	addi	a5,sp,44
  800034:	00058613          	mv	a2,a1
  800038:	00050593          	mv	a1,a0
  80003c:	00001517          	auipc	a0,0x1
  800040:	96450513          	addi	a0,a0,-1692 # 8009a0 <main+0x140>
  800044:	00112e23          	sw	ra,28(sp)
  800048:	02d12623          	sw	a3,44(sp)
  80004c:	02e12823          	sw	a4,48(sp)
  800050:	03012c23          	sw	a6,56(sp)
  800054:	03112e23          	sw	a7,60(sp)
  800058:	00f12623          	sw	a5,12(sp)
  80005c:	168000ef          	jal	ra,8001c4 <cprintf>
  800060:	00c12583          	lw	a1,12(sp)
  800064:	00040513          	mv	a0,s0
  800068:	128000ef          	jal	ra,800190 <vcprintf>
  80006c:	00001517          	auipc	a0,0x1
  800070:	c4c50513          	addi	a0,a0,-948 # 800cb8 <error_string+0x190>
  800074:	150000ef          	jal	ra,8001c4 <cprintf>
  800078:	ff600513          	li	a0,-10
  80007c:	0a8000ef          	jal	ra,800124 <exit>

00800080 <syscall>:
  800080:	fb010113          	addi	sp,sp,-80
  800084:	04e12023          	sw	a4,64(sp)
  800088:	02e12423          	sw	a4,40(sp)
  80008c:	04810713          	addi	a4,sp,72
  800090:	00a12623          	sw	a0,12(sp)
  800094:	02b12a23          	sw	a1,52(sp)
  800098:	02c12c23          	sw	a2,56(sp)
  80009c:	02d12e23          	sw	a3,60(sp)
  8000a0:	04f12223          	sw	a5,68(sp)
  8000a4:	05012423          	sw	a6,72(sp)
  8000a8:	05112623          	sw	a7,76(sp)
  8000ac:	00b12e23          	sw	a1,28(sp)
  8000b0:	02c12023          	sw	a2,32(sp)
  8000b4:	02d12223          	sw	a3,36(sp)
  8000b8:	00e12a23          	sw	a4,20(sp)
  8000bc:	02f12623          	sw	a5,44(sp)
  8000c0:	00c12503          	lw	a0,12(sp)
  8000c4:	01c12583          	lw	a1,28(sp)
  8000c8:	02012603          	lw	a2,32(sp)
  8000cc:	02412683          	lw	a3,36(sp)
  8000d0:	02812703          	lw	a4,40(sp)
  8000d4:	02c12783          	lw	a5,44(sp)
  8000d8:	00000073          	ecall
  8000dc:	00a12c23          	sw	a0,24(sp)
  8000e0:	01812503          	lw	a0,24(sp)
  8000e4:	05010113          	addi	sp,sp,80
  8000e8:	00008067          	ret

008000ec <sys_exit>:
  8000ec:	00050593          	mv	a1,a0
  8000f0:	00100513          	li	a0,1
  8000f4:	f8dff06f          	j	800080 <syscall>

008000f8 <sys_fork>:
  8000f8:	00200513          	li	a0,2
  8000fc:	f85ff06f          	j	800080 <syscall>

00800100 <sys_wait>:
  800100:	00058613          	mv	a2,a1
  800104:	00050593          	mv	a1,a0
  800108:	00300513          	li	a0,3
  80010c:	f75ff06f          	j	800080 <syscall>

00800110 <sys_yield>:
  800110:	00a00513          	li	a0,10
  800114:	f6dff06f          	j	800080 <syscall>

00800118 <sys_putc>:
  800118:	00050593          	mv	a1,a0
  80011c:	01e00513          	li	a0,30
  800120:	f61ff06f          	j	800080 <syscall>

00800124 <exit>:
  800124:	ff010113          	addi	sp,sp,-16
  800128:	00112623          	sw	ra,12(sp)
  80012c:	fc1ff0ef          	jal	ra,8000ec <sys_exit>
  800130:	00001517          	auipc	a0,0x1
  800134:	88c50513          	addi	a0,a0,-1908 # 8009bc <main+0x15c>
  800138:	08c000ef          	jal	ra,8001c4 <cprintf>
  80013c:	0000006f          	j	80013c <exit+0x18>

00800140 <fork>:
  800140:	fb9ff06f          	j	8000f8 <sys_fork>

00800144 <wait>:
  800144:	00000593          	li	a1,0
  800148:	00000513          	li	a0,0
  80014c:	fb5ff06f          	j	800100 <sys_wait>

00800150 <waitpid>:
  800150:	fb1ff06f          	j	800100 <sys_wait>

00800154 <yield>:
  800154:	fbdff06f          	j	800110 <sys_yield>

00800158 <_start>:
  800158:	0c4000ef          	jal	ra,80021c <umain>
  80015c:	0000006f          	j	80015c <_start+0x4>

00800160 <cputch>:
  800160:	ff010113          	addi	sp,sp,-16
  800164:	00112623          	sw	ra,12(sp)
  800168:	00812423          	sw	s0,8(sp)
  80016c:	00058413          	mv	s0,a1
  800170:	fa9ff0ef          	jal	ra,800118 <sys_putc>
  800174:	00042783          	lw	a5,0(s0)
  800178:	00c12083          	lw	ra,12(sp)
  80017c:	00178793          	addi	a5,a5,1
  800180:	00f42023          	sw	a5,0(s0)
  800184:	00812403          	lw	s0,8(sp)
  800188:	01010113          	addi	sp,sp,16
  80018c:	00008067          	ret

00800190 <vcprintf>:
  800190:	fe010113          	addi	sp,sp,-32
  800194:	00058693          	mv	a3,a1
  800198:	00050613          	mv	a2,a0
  80019c:	00c10593          	addi	a1,sp,12
  8001a0:	00000517          	auipc	a0,0x0
  8001a4:	fc050513          	addi	a0,a0,-64 # 800160 <cputch>
  8001a8:	00112e23          	sw	ra,28(sp)
  8001ac:	00012623          	sw	zero,12(sp)
  8001b0:	164000ef          	jal	ra,800314 <vprintfmt>
  8001b4:	01c12083          	lw	ra,28(sp)
  8001b8:	00c12503          	lw	a0,12(sp)
  8001bc:	02010113          	addi	sp,sp,32
  8001c0:	00008067          	ret

008001c4 <cprintf>:
  8001c4:	fc010113          	addi	sp,sp,-64
  8001c8:	02410313          	addi	t1,sp,36
  8001cc:	02b12223          	sw	a1,36(sp)
  8001d0:	02c12423          	sw	a2,40(sp)
  8001d4:	02d12623          	sw	a3,44(sp)
  8001d8:	00050613          	mv	a2,a0
  8001dc:	00c10593          	addi	a1,sp,12
  8001e0:	00000517          	auipc	a0,0x0
  8001e4:	f8050513          	addi	a0,a0,-128 # 800160 <cputch>
  8001e8:	00030693          	mv	a3,t1
  8001ec:	00112e23          	sw	ra,28(sp)
  8001f0:	02e12823          	sw	a4,48(sp)
  8001f4:	02f12a23          	sw	a5,52(sp)
  8001f8:	03012c23          	sw	a6,56(sp)
  8001fc:	03112e23          	sw	a7,60(sp)
  800200:	00612423          	sw	t1,8(sp)
  800204:	00012623          	sw	zero,12(sp)
  800208:	10c000ef          	jal	ra,800314 <vprintfmt>
  80020c:	01c12083          	lw	ra,28(sp)
  800210:	00c12503          	lw	a0,12(sp)
  800214:	04010113          	addi	sp,sp,64
  800218:	00008067          	ret

0080021c <umain>:
  80021c:	ff010113          	addi	sp,sp,-16
  800220:	00112623          	sw	ra,12(sp)
  800224:	63c000ef          	jal	ra,800860 <main>
  800228:	efdff0ef          	jal	ra,800124 <exit>

0080022c <strnlen>:
  80022c:	00050693          	mv	a3,a0
  800230:	02058a63          	beqz	a1,800264 <strnlen+0x38>
  800234:	00054703          	lbu	a4,0(a0)
  800238:	00150793          	addi	a5,a0,1
  80023c:	02070463          	beqz	a4,800264 <strnlen+0x38>
  800240:	00b505b3          	add	a1,a0,a1
  800244:	0100006f          	j	800254 <strnlen+0x28>
  800248:	00178793          	addi	a5,a5,1
  80024c:	fff7c703          	lbu	a4,-1(a5)
  800250:	00070863          	beqz	a4,800260 <strnlen+0x34>
  800254:	40d78533          	sub	a0,a5,a3
  800258:	feb798e3          	bne	a5,a1,800248 <strnlen+0x1c>
  80025c:	00008067          	ret
  800260:	00008067          	ret
  800264:	00000513          	li	a0,0
  800268:	00008067          	ret

0080026c <printnum>:
  80026c:	fe010113          	addi	sp,sp,-32
  800270:	00912a23          	sw	s1,20(sp)
  800274:	01212823          	sw	s2,16(sp)
  800278:	01312623          	sw	s3,12(sp)
  80027c:	01412423          	sw	s4,8(sp)
  800280:	00112e23          	sw	ra,28(sp)
  800284:	00812c23          	sw	s0,24(sp)
  800288:	00050493          	mv	s1,a0
  80028c:	00058913          	mv	s2,a1
  800290:	00080993          	mv	s3,a6
  800294:	02e67a33          	remu	s4,a2,a4
  800298:	04069e63          	bnez	a3,8002f4 <printnum+0x88>
  80029c:	04e67c63          	bleu	a4,a2,8002f4 <printnum+0x88>
  8002a0:	fff78413          	addi	s0,a5,-1
  8002a4:	00805c63          	blez	s0,8002bc <printnum+0x50>
  8002a8:	fff40413          	addi	s0,s0,-1
  8002ac:	00090593          	mv	a1,s2
  8002b0:	00098513          	mv	a0,s3
  8002b4:	000480e7          	jalr	s1
  8002b8:	fe0418e3          	bnez	s0,8002a8 <printnum+0x3c>
  8002bc:	00001797          	auipc	a5,0x1
  8002c0:	8d078793          	addi	a5,a5,-1840 # 800b8c <error_string+0x64>
  8002c4:	014787b3          	add	a5,a5,s4
  8002c8:	00090593          	mv	a1,s2
  8002cc:	00048313          	mv	t1,s1
  8002d0:	01c12083          	lw	ra,28(sp)
  8002d4:	01812403          	lw	s0,24(sp)
  8002d8:	01412483          	lw	s1,20(sp)
  8002dc:	01012903          	lw	s2,16(sp)
  8002e0:	00c12983          	lw	s3,12(sp)
  8002e4:	00812a03          	lw	s4,8(sp)
  8002e8:	0007c503          	lbu	a0,0(a5)
  8002ec:	02010113          	addi	sp,sp,32
  8002f0:	00030067          	jr	t1
  8002f4:	02e65633          	divu	a2,a2,a4
  8002f8:	00098813          	mv	a6,s3
  8002fc:	fff78793          	addi	a5,a5,-1
  800300:	00000693          	li	a3,0
  800304:	00090593          	mv	a1,s2
  800308:	00048513          	mv	a0,s1
  80030c:	f61ff0ef          	jal	ra,80026c <printnum>
  800310:	fadff06f          	j	8002bc <printnum+0x50>

00800314 <vprintfmt>:
  800314:	fb010113          	addi	sp,sp,-80
  800318:	05212023          	sw	s2,64(sp)
  80031c:	03312e23          	sw	s3,60(sp)
  800320:	03412c23          	sw	s4,56(sp)
  800324:	03512a23          	sw	s5,52(sp)
  800328:	03612823          	sw	s6,48(sp)
  80032c:	03712623          	sw	s7,44(sp)
  800330:	03812423          	sw	s8,40(sp)
  800334:	03912223          	sw	s9,36(sp)
  800338:	04112623          	sw	ra,76(sp)
  80033c:	04812423          	sw	s0,72(sp)
  800340:	04912223          	sw	s1,68(sp)
  800344:	03a12023          	sw	s10,32(sp)
  800348:	01b12e23          	sw	s11,28(sp)
  80034c:	00050993          	mv	s3,a0
  800350:	00058913          	mv	s2,a1
  800354:	00060c93          	mv	s9,a2
  800358:	00068a93          	mv	s5,a3
  80035c:	00000a17          	auipc	s4,0x0
  800360:	674a0a13          	addi	s4,s4,1652 # 8009d0 <main+0x170>
  800364:	02800c13          	li	s8,40
  800368:	fff00b13          	li	s6,-1
  80036c:	05e00b93          	li	s7,94
  800370:	000cc503          	lbu	a0,0(s9)
  800374:	02500493          	li	s1,37
  800378:	001c8413          	addi	s0,s9,1
  80037c:	00950e63          	beq	a0,s1,800398 <vprintfmt+0x84>
  800380:	06050463          	beqz	a0,8003e8 <vprintfmt+0xd4>
  800384:	00090593          	mv	a1,s2
  800388:	00140413          	addi	s0,s0,1
  80038c:	000980e7          	jalr	s3
  800390:	fff44503          	lbu	a0,-1(s0)
  800394:	fe9516e3          	bne	a0,s1,800380 <vprintfmt+0x6c>
  800398:	00044e03          	lbu	t3,0(s0)
  80039c:	fff00d13          	li	s10,-1
  8003a0:	02000813          	li	a6,32
  8003a4:	00000493          	li	s1,0
  8003a8:	00000593          	li	a1,0
  8003ac:	000d0d93          	mv	s11,s10
  8003b0:	05500693          	li	a3,85
  8003b4:	00100313          	li	t1,1
  8003b8:	03000893          	li	a7,48
  8003bc:	00900613          	li	a2,9
  8003c0:	02d00513          	li	a0,45
  8003c4:	fdde0713          	addi	a4,t3,-35
  8003c8:	0ff77713          	andi	a4,a4,255
  8003cc:	00140c93          	addi	s9,s0,1
  8003d0:	32e6e463          	bltu	a3,a4,8006f8 <vprintfmt+0x3e4>
  8003d4:	00271713          	slli	a4,a4,0x2
  8003d8:	01470733          	add	a4,a4,s4
  8003dc:	00072783          	lw	a5,0(a4)
  8003e0:	014787b3          	add	a5,a5,s4
  8003e4:	00078067          	jr	a5
  8003e8:	04c12083          	lw	ra,76(sp)
  8003ec:	04812403          	lw	s0,72(sp)
  8003f0:	04412483          	lw	s1,68(sp)
  8003f4:	04012903          	lw	s2,64(sp)
  8003f8:	03c12983          	lw	s3,60(sp)
  8003fc:	03812a03          	lw	s4,56(sp)
  800400:	03412a83          	lw	s5,52(sp)
  800404:	03012b03          	lw	s6,48(sp)
  800408:	02c12b83          	lw	s7,44(sp)
  80040c:	02812c03          	lw	s8,40(sp)
  800410:	02412c83          	lw	s9,36(sp)
  800414:	02012d03          	lw	s10,32(sp)
  800418:	01c12d83          	lw	s11,28(sp)
  80041c:	05010113          	addi	sp,sp,80
  800420:	00008067          	ret
  800424:	00100793          	li	a5,1
  800428:	34b7c063          	blt	a5,a1,800768 <vprintfmt+0x454>
  80042c:	000aa603          	lw	a2,0(s5)
  800430:	00000693          	li	a3,0
  800434:	004a8a93          	addi	s5,s5,4
  800438:	01000713          	li	a4,16
  80043c:	000d8793          	mv	a5,s11
  800440:	00090593          	mv	a1,s2
  800444:	00098513          	mv	a0,s3
  800448:	e25ff0ef          	jal	ra,80026c <printnum>
  80044c:	f25ff06f          	j	800370 <vprintfmt+0x5c>
  800450:	00144e03          	lbu	t3,1(s0)
  800454:	00030493          	mv	s1,t1
  800458:	000c8413          	mv	s0,s9
  80045c:	f69ff06f          	j	8003c4 <vprintfmt+0xb0>
  800460:	000aa503          	lw	a0,0(s5)
  800464:	00090593          	mv	a1,s2
  800468:	004a8a93          	addi	s5,s5,4
  80046c:	000980e7          	jalr	s3
  800470:	f01ff06f          	j	800370 <vprintfmt+0x5c>
  800474:	00100793          	li	a5,1
  800478:	30b7c663          	blt	a5,a1,800784 <vprintfmt+0x470>
  80047c:	000aa603          	lw	a2,0(s5)
  800480:	004a8a93          	addi	s5,s5,4
  800484:	41f65693          	srai	a3,a2,0x1f
  800488:	00a00713          	li	a4,10
  80048c:	fa06d8e3          	bgez	a3,80043c <vprintfmt+0x128>
  800490:	00090593          	mv	a1,s2
  800494:	02d00513          	li	a0,45
  800498:	00d12623          	sw	a3,12(sp)
  80049c:	00c12423          	sw	a2,8(sp)
  8004a0:	00e12223          	sw	a4,4(sp)
  8004a4:	01012023          	sw	a6,0(sp)
  8004a8:	000980e7          	jalr	s3
  8004ac:	00812603          	lw	a2,8(sp)
  8004b0:	00c12683          	lw	a3,12(sp)
  8004b4:	00012803          	lw	a6,0(sp)
  8004b8:	40c00633          	neg	a2,a2
  8004bc:	00c037b3          	snez	a5,a2
  8004c0:	40d006b3          	neg	a3,a3
  8004c4:	40f686b3          	sub	a3,a3,a5
  8004c8:	00412703          	lw	a4,4(sp)
  8004cc:	f71ff06f          	j	80043c <vprintfmt+0x128>
  8004d0:	000aa783          	lw	a5,0(s5)
  8004d4:	01800693          	li	a3,24
  8004d8:	004a8a93          	addi	s5,s5,4
  8004dc:	41f7d713          	srai	a4,a5,0x1f
  8004e0:	00f747b3          	xor	a5,a4,a5
  8004e4:	40e787b3          	sub	a5,a5,a4
  8004e8:	2af6ca63          	blt	a3,a5,80079c <vprintfmt+0x488>
  8004ec:	00279693          	slli	a3,a5,0x2
  8004f0:	00000717          	auipc	a4,0x0
  8004f4:	63870713          	addi	a4,a4,1592 # 800b28 <error_string>
  8004f8:	00d70733          	add	a4,a4,a3
  8004fc:	00072683          	lw	a3,0(a4)
  800500:	28068e63          	beqz	a3,80079c <vprintfmt+0x488>
  800504:	00000617          	auipc	a2,0x0
  800508:	75460613          	addi	a2,a2,1876 # 800c58 <error_string+0x130>
  80050c:	00090593          	mv	a1,s2
  800510:	00098513          	mv	a0,s3
  800514:	314000ef          	jal	ra,800828 <printfmt>
  800518:	e59ff06f          	j	800370 <vprintfmt+0x5c>
  80051c:	00144e03          	lbu	t3,1(s0)
  800520:	00158593          	addi	a1,a1,1
  800524:	000c8413          	mv	s0,s9
  800528:	e9dff06f          	j	8003c4 <vprintfmt+0xb0>
  80052c:	00100793          	li	a5,1
  800530:	20b7c063          	blt	a5,a1,800730 <vprintfmt+0x41c>
  800534:	000aa603          	lw	a2,0(s5)
  800538:	00000693          	li	a3,0
  80053c:	004a8a93          	addi	s5,s5,4
  800540:	00800713          	li	a4,8
  800544:	ef9ff06f          	j	80043c <vprintfmt+0x128>
  800548:	03000513          	li	a0,48
  80054c:	00090593          	mv	a1,s2
  800550:	01012023          	sw	a6,0(sp)
  800554:	000980e7          	jalr	s3
  800558:	00090593          	mv	a1,s2
  80055c:	07800513          	li	a0,120
  800560:	000980e7          	jalr	s3
  800564:	000aa603          	lw	a2,0(s5)
  800568:	00000693          	li	a3,0
  80056c:	01000713          	li	a4,16
  800570:	004a8a93          	addi	s5,s5,4
  800574:	00012803          	lw	a6,0(sp)
  800578:	ec5ff06f          	j	80043c <vprintfmt+0x128>
  80057c:	000aa403          	lw	s0,0(s5)
  800580:	004a8793          	addi	a5,s5,4
  800584:	00f12223          	sw	a5,4(sp)
  800588:	24040863          	beqz	s0,8007d8 <vprintfmt+0x4c4>
  80058c:	05b05263          	blez	s11,8005d0 <vprintfmt+0x2bc>
  800590:	02d00793          	li	a5,45
  800594:	22f80263          	beq	a6,a5,8007b8 <vprintfmt+0x4a4>
  800598:	000d0593          	mv	a1,s10
  80059c:	00040513          	mv	a0,s0
  8005a0:	01012023          	sw	a6,0(sp)
  8005a4:	c89ff0ef          	jal	ra,80022c <strnlen>
  8005a8:	40ad8db3          	sub	s11,s11,a0
  8005ac:	03b05263          	blez	s11,8005d0 <vprintfmt+0x2bc>
  8005b0:	00012803          	lw	a6,0(sp)
  8005b4:	00080513          	mv	a0,a6
  8005b8:	00090593          	mv	a1,s2
  8005bc:	01012023          	sw	a6,0(sp)
  8005c0:	fffd8d93          	addi	s11,s11,-1
  8005c4:	000980e7          	jalr	s3
  8005c8:	00012803          	lw	a6,0(sp)
  8005cc:	fe0d94e3          	bnez	s11,8005b4 <vprintfmt+0x2a0>
  8005d0:	00044783          	lbu	a5,0(s0)
  8005d4:	00140a93          	addi	s5,s0,1
  8005d8:	00078513          	mv	a0,a5
  8005dc:	04078c63          	beqz	a5,800634 <vprintfmt+0x320>
  8005e0:	03f00413          	li	s0,63
  8005e4:	000d4663          	bltz	s10,8005f0 <vprintfmt+0x2dc>
  8005e8:	fffd0d13          	addi	s10,s10,-1
  8005ec:	036d0663          	beq	s10,s6,800618 <vprintfmt+0x304>
  8005f0:	00090593          	mv	a1,s2
  8005f4:	00048663          	beqz	s1,800600 <vprintfmt+0x2ec>
  8005f8:	fe078793          	addi	a5,a5,-32
  8005fc:	12fbe463          	bltu	s7,a5,800724 <vprintfmt+0x410>
  800600:	000980e7          	jalr	s3
  800604:	001a8a93          	addi	s5,s5,1
  800608:	fffac783          	lbu	a5,-1(s5)
  80060c:	fffd8d93          	addi	s11,s11,-1
  800610:	00078513          	mv	a0,a5
  800614:	fc0798e3          	bnez	a5,8005e4 <vprintfmt+0x2d0>
  800618:	01b05e63          	blez	s11,800634 <vprintfmt+0x320>
  80061c:	02000413          	li	s0,32
  800620:	fffd8d93          	addi	s11,s11,-1
  800624:	00090593          	mv	a1,s2
  800628:	00040513          	mv	a0,s0
  80062c:	000980e7          	jalr	s3
  800630:	fe0d98e3          	bnez	s11,800620 <vprintfmt+0x30c>
  800634:	00412a83          	lw	s5,4(sp)
  800638:	d39ff06f          	j	800370 <vprintfmt+0x5c>
  80063c:	00100793          	li	a5,1
  800640:	10b7c663          	blt	a5,a1,80074c <vprintfmt+0x438>
  800644:	000aa603          	lw	a2,0(s5)
  800648:	00000693          	li	a3,0
  80064c:	004a8a93          	addi	s5,s5,4
  800650:	00a00713          	li	a4,10
  800654:	de9ff06f          	j	80043c <vprintfmt+0x128>
  800658:	00144e03          	lbu	t3,1(s0)
  80065c:	00050813          	mv	a6,a0
  800660:	000c8413          	mv	s0,s9
  800664:	d61ff06f          	j	8003c4 <vprintfmt+0xb0>
  800668:	00090593          	mv	a1,s2
  80066c:	02500513          	li	a0,37
  800670:	000980e7          	jalr	s3
  800674:	cfdff06f          	j	800370 <vprintfmt+0x5c>
  800678:	000aad03          	lw	s10,0(s5)
  80067c:	00144e03          	lbu	t3,1(s0)
  800680:	004a8a93          	addi	s5,s5,4
  800684:	000c8413          	mv	s0,s9
  800688:	d20ddee3          	bgez	s11,8003c4 <vprintfmt+0xb0>
  80068c:	000d0d93          	mv	s11,s10
  800690:	fff00d13          	li	s10,-1
  800694:	d31ff06f          	j	8003c4 <vprintfmt+0xb0>
  800698:	00144e03          	lbu	t3,1(s0)
  80069c:	00088813          	mv	a6,a7
  8006a0:	000c8413          	mv	s0,s9
  8006a4:	d21ff06f          	j	8003c4 <vprintfmt+0xb0>
  8006a8:	00144703          	lbu	a4,1(s0)
  8006ac:	fd0e0d13          	addi	s10,t3,-48
  8006b0:	fd070793          	addi	a5,a4,-48
  8006b4:	14f66863          	bltu	a2,a5,800804 <vprintfmt+0x4f0>
  8006b8:	000c8413          	mv	s0,s9
  8006bc:	002d1793          	slli	a5,s10,0x2
  8006c0:	01a78d33          	add	s10,a5,s10
  8006c4:	00140413          	addi	s0,s0,1
  8006c8:	001d1d13          	slli	s10,s10,0x1
  8006cc:	00ed0d33          	add	s10,s10,a4
  8006d0:	00044703          	lbu	a4,0(s0)
  8006d4:	fd0d0d13          	addi	s10,s10,-48
  8006d8:	fd070793          	addi	a5,a4,-48
  8006dc:	fef670e3          	bleu	a5,a2,8006bc <vprintfmt+0x3a8>
  8006e0:	00070e13          	mv	t3,a4
  8006e4:	fa5ff06f          	j	800688 <vprintfmt+0x374>
  8006e8:	0e0dc463          	bltz	s11,8007d0 <vprintfmt+0x4bc>
  8006ec:	00144e03          	lbu	t3,1(s0)
  8006f0:	000c8413          	mv	s0,s9
  8006f4:	cd1ff06f          	j	8003c4 <vprintfmt+0xb0>
  8006f8:	00090593          	mv	a1,s2
  8006fc:	02500513          	li	a0,37
  800700:	000980e7          	jalr	s3
  800704:	fff44783          	lbu	a5,-1(s0)
  800708:	02500713          	li	a4,37
  80070c:	00040c93          	mv	s9,s0
  800710:	c6e780e3          	beq	a5,a4,800370 <vprintfmt+0x5c>
  800714:	fffc8c93          	addi	s9,s9,-1
  800718:	fffcc783          	lbu	a5,-1(s9)
  80071c:	fee79ce3          	bne	a5,a4,800714 <vprintfmt+0x400>
  800720:	c51ff06f          	j	800370 <vprintfmt+0x5c>
  800724:	00040513          	mv	a0,s0
  800728:	000980e7          	jalr	s3
  80072c:	ed9ff06f          	j	800604 <vprintfmt+0x2f0>
  800730:	007a8793          	addi	a5,s5,7
  800734:	ff87f793          	andi	a5,a5,-8
  800738:	00878a93          	addi	s5,a5,8
  80073c:	0007a603          	lw	a2,0(a5)
  800740:	0047a683          	lw	a3,4(a5)
  800744:	00800713          	li	a4,8
  800748:	cf5ff06f          	j	80043c <vprintfmt+0x128>
  80074c:	007a8793          	addi	a5,s5,7
  800750:	ff87f793          	andi	a5,a5,-8
  800754:	00878a93          	addi	s5,a5,8
  800758:	0007a603          	lw	a2,0(a5)
  80075c:	0047a683          	lw	a3,4(a5)
  800760:	00a00713          	li	a4,10
  800764:	cd9ff06f          	j	80043c <vprintfmt+0x128>
  800768:	007a8793          	addi	a5,s5,7
  80076c:	ff87f793          	andi	a5,a5,-8
  800770:	00878a93          	addi	s5,a5,8
  800774:	0007a603          	lw	a2,0(a5)
  800778:	0047a683          	lw	a3,4(a5)
  80077c:	01000713          	li	a4,16
  800780:	cbdff06f          	j	80043c <vprintfmt+0x128>
  800784:	007a8793          	addi	a5,s5,7
  800788:	ff87f793          	andi	a5,a5,-8
  80078c:	00878a93          	addi	s5,a5,8
  800790:	0007a603          	lw	a2,0(a5)
  800794:	0047a683          	lw	a3,4(a5)
  800798:	cf1ff06f          	j	800488 <vprintfmt+0x174>
  80079c:	00078693          	mv	a3,a5
  8007a0:	00000617          	auipc	a2,0x0
  8007a4:	4ac60613          	addi	a2,a2,1196 # 800c4c <error_string+0x124>
  8007a8:	00090593          	mv	a1,s2
  8007ac:	00098513          	mv	a0,s3
  8007b0:	078000ef          	jal	ra,800828 <printfmt>
  8007b4:	bbdff06f          	j	800370 <vprintfmt+0x5c>
  8007b8:	00044783          	lbu	a5,0(s0)
  8007bc:	00140a93          	addi	s5,s0,1
  8007c0:	00078513          	mv	a0,a5
  8007c4:	e4078ce3          	beqz	a5,80061c <vprintfmt+0x308>
  8007c8:	03f00413          	li	s0,63
  8007cc:	e19ff06f          	j	8005e4 <vprintfmt+0x2d0>
  8007d0:	00000d93          	li	s11,0
  8007d4:	f19ff06f          	j	8006ec <vprintfmt+0x3d8>
  8007d8:	03b05c63          	blez	s11,800810 <vprintfmt+0x4fc>
  8007dc:	02d00793          	li	a5,45
  8007e0:	00000417          	auipc	s0,0x0
  8007e4:	46440413          	addi	s0,s0,1124 # 800c44 <error_string+0x11c>
  8007e8:	daf818e3          	bne	a6,a5,800598 <vprintfmt+0x284>
  8007ec:	00000a97          	auipc	s5,0x0
  8007f0:	459a8a93          	addi	s5,s5,1113 # 800c45 <error_string+0x11d>
  8007f4:	000c0513          	mv	a0,s8
  8007f8:	000c0793          	mv	a5,s8
  8007fc:	03f00413          	li	s0,63
  800800:	de5ff06f          	j	8005e4 <vprintfmt+0x2d0>
  800804:	00070e13          	mv	t3,a4
  800808:	000c8413          	mv	s0,s9
  80080c:	e7dff06f          	j	800688 <vprintfmt+0x374>
  800810:	000c0793          	mv	a5,s8
  800814:	000c0513          	mv	a0,s8
  800818:	00000a97          	auipc	s5,0x0
  80081c:	42da8a93          	addi	s5,s5,1069 # 800c45 <error_string+0x11d>
  800820:	03f00413          	li	s0,63
  800824:	dc1ff06f          	j	8005e4 <vprintfmt+0x2d0>

00800828 <printfmt>:
  800828:	fc010113          	addi	sp,sp,-64
  80082c:	02c10313          	addi	t1,sp,44
  800830:	02d12623          	sw	a3,44(sp)
  800834:	00030693          	mv	a3,t1
  800838:	00112e23          	sw	ra,28(sp)
  80083c:	02e12823          	sw	a4,48(sp)
  800840:	02f12a23          	sw	a5,52(sp)
  800844:	03012c23          	sw	a6,56(sp)
  800848:	03112e23          	sw	a7,60(sp)
  80084c:	00612623          	sw	t1,12(sp)
  800850:	ac5ff0ef          	jal	ra,800314 <vprintfmt>
  800854:	01c12083          	lw	ra,28(sp)
  800858:	04010113          	addi	sp,sp,64
  80085c:	00008067          	ret

00800860 <main>:
  800860:	fe010113          	addi	sp,sp,-32
  800864:	00000517          	auipc	a0,0x0
  800868:	3f850513          	addi	a0,a0,1016 # 800c5c <error_string+0x134>
  80086c:	00112e23          	sw	ra,28(sp)
  800870:	00812c23          	sw	s0,24(sp)
  800874:	951ff0ef          	jal	ra,8001c4 <cprintf>
  800878:	8c9ff0ef          	jal	ra,800140 <fork>
  80087c:	0e050863          	beqz	a0,80096c <main+0x10c>
  800880:	00050413          	mv	s0,a0
  800884:	00050593          	mv	a1,a0
  800888:	00000517          	auipc	a0,0x0
  80088c:	41050513          	addi	a0,a0,1040 # 800c98 <error_string+0x170>
  800890:	935ff0ef          	jal	ra,8001c4 <cprintf>
  800894:	0a805c63          	blez	s0,80094c <main+0xec>
  800898:	00000517          	auipc	a0,0x0
  80089c:	45050513          	addi	a0,a0,1104 # 800ce8 <error_string+0x1c0>
  8008a0:	925ff0ef          	jal	ra,8001c4 <cprintf>
  8008a4:	00c10593          	addi	a1,sp,12
  8008a8:	00040513          	mv	a0,s0
  8008ac:	8a5ff0ef          	jal	ra,800150 <waitpid>
  8008b0:	04051e63          	bnez	a0,80090c <main+0xac>
  8008b4:	00c12703          	lw	a4,12(sp)
  8008b8:	00000797          	auipc	a5,0x0
  8008bc:	7487a783          	lw	a5,1864(a5) # 801000 <magic>
  8008c0:	04f71663          	bne	a4,a5,80090c <main+0xac>
  8008c4:	00c10593          	addi	a1,sp,12
  8008c8:	00040513          	mv	a0,s0
  8008cc:	885ff0ef          	jal	ra,800150 <waitpid>
  8008d0:	04050e63          	beqz	a0,80092c <main+0xcc>
  8008d4:	871ff0ef          	jal	ra,800144 <wait>
  8008d8:	04050a63          	beqz	a0,80092c <main+0xcc>
  8008dc:	00040593          	mv	a1,s0
  8008e0:	00000517          	auipc	a0,0x0
  8008e4:	47c50513          	addi	a0,a0,1148 # 800d5c <error_string+0x234>
  8008e8:	8ddff0ef          	jal	ra,8001c4 <cprintf>
  8008ec:	00000517          	auipc	a0,0x0
  8008f0:	48050513          	addi	a0,a0,1152 # 800d6c <error_string+0x244>
  8008f4:	8d1ff0ef          	jal	ra,8001c4 <cprintf>
  8008f8:	01c12083          	lw	ra,28(sp)
  8008fc:	00000513          	li	a0,0
  800900:	01812403          	lw	s0,24(sp)
  800904:	02010113          	addi	sp,sp,32
  800908:	00008067          	ret
  80090c:	00000697          	auipc	a3,0x0
  800910:	3fc68693          	addi	a3,a3,1020 # 800d08 <error_string+0x1e0>
  800914:	00000617          	auipc	a2,0x0
  800918:	3b060613          	addi	a2,a2,944 # 800cc4 <error_string+0x19c>
  80091c:	01b00593          	li	a1,27
  800920:	00000517          	auipc	a0,0x0
  800924:	3bc50513          	addi	a0,a0,956 # 800cdc <error_string+0x1b4>
  800928:	ef8ff0ef          	jal	ra,800020 <__panic>
  80092c:	00000697          	auipc	a3,0x0
  800930:	40868693          	addi	a3,a3,1032 # 800d34 <error_string+0x20c>
  800934:	00000617          	auipc	a2,0x0
  800938:	39060613          	addi	a2,a2,912 # 800cc4 <error_string+0x19c>
  80093c:	01c00593          	li	a1,28
  800940:	00000517          	auipc	a0,0x0
  800944:	39c50513          	addi	a0,a0,924 # 800cdc <error_string+0x1b4>
  800948:	ed8ff0ef          	jal	ra,800020 <__panic>
  80094c:	00000697          	auipc	a3,0x0
  800950:	37068693          	addi	a3,a3,880 # 800cbc <error_string+0x194>
  800954:	00000617          	auipc	a2,0x0
  800958:	37060613          	addi	a2,a2,880 # 800cc4 <error_string+0x19c>
  80095c:	01800593          	li	a1,24
  800960:	00000517          	auipc	a0,0x0
  800964:	37c50513          	addi	a0,a0,892 # 800cdc <error_string+0x1b4>
  800968:	eb8ff0ef          	jal	ra,800020 <__panic>
  80096c:	00000517          	auipc	a0,0x0
  800970:	31850513          	addi	a0,a0,792 # 800c84 <error_string+0x15c>
  800974:	851ff0ef          	jal	ra,8001c4 <cprintf>
  800978:	fdcff0ef          	jal	ra,800154 <yield>
  80097c:	fd8ff0ef          	jal	ra,800154 <yield>
  800980:	fd4ff0ef          	jal	ra,800154 <yield>
  800984:	fd0ff0ef          	jal	ra,800154 <yield>
  800988:	fccff0ef          	jal	ra,800154 <yield>
  80098c:	fc8ff0ef          	jal	ra,800154 <yield>
  800990:	fc4ff0ef          	jal	ra,800154 <yield>
  800994:	00000517          	auipc	a0,0x0
  800998:	66c52503          	lw	a0,1644(a0) # 801000 <magic>
  80099c:	f88ff0ef          	jal	ra,800124 <exit>
