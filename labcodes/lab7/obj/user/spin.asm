
obj/__user_spin.out:     file format elf32-littleriscv


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
  800040:	93850513          	addi	a0,a0,-1736 # 800974 <main+0x110>
  800044:	00112e23          	sw	ra,28(sp)
  800048:	02d12623          	sw	a3,44(sp)
  80004c:	02e12823          	sw	a4,48(sp)
  800050:	03012c23          	sw	a6,56(sp)
  800054:	03112e23          	sw	a7,60(sp)
  800058:	00f12623          	sw	a5,12(sp)
  80005c:	16c000ef          	jal	ra,8001c8 <cprintf>
  800060:	00c12583          	lw	a1,12(sp)
  800064:	00040513          	mv	a0,s0
  800068:	12c000ef          	jal	ra,800194 <vcprintf>
  80006c:	00001517          	auipc	a0,0x1
  800070:	c0850513          	addi	a0,a0,-1016 # 800c74 <error_string+0x178>
  800074:	154000ef          	jal	ra,8001c8 <cprintf>
  800078:	ff600513          	li	a0,-10
  80007c:	0b4000ef          	jal	ra,800130 <exit>

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

00800118 <sys_kill>:
  800118:	00050593          	mv	a1,a0
  80011c:	00c00513          	li	a0,12
  800120:	f61ff06f          	j	800080 <syscall>

00800124 <sys_putc>:
  800124:	00050593          	mv	a1,a0
  800128:	01e00513          	li	a0,30
  80012c:	f55ff06f          	j	800080 <syscall>

00800130 <exit>:
  800130:	ff010113          	addi	sp,sp,-16
  800134:	00112623          	sw	ra,12(sp)
  800138:	fb5ff0ef          	jal	ra,8000ec <sys_exit>
  80013c:	00001517          	auipc	a0,0x1
  800140:	85450513          	addi	a0,a0,-1964 # 800990 <main+0x12c>
  800144:	084000ef          	jal	ra,8001c8 <cprintf>
  800148:	0000006f          	j	800148 <exit+0x18>

0080014c <fork>:
  80014c:	fadff06f          	j	8000f8 <sys_fork>

00800150 <waitpid>:
  800150:	fb1ff06f          	j	800100 <sys_wait>

00800154 <yield>:
  800154:	fbdff06f          	j	800110 <sys_yield>

00800158 <kill>:
  800158:	fc1ff06f          	j	800118 <sys_kill>

0080015c <_start>:
  80015c:	0c4000ef          	jal	ra,800220 <umain>
  800160:	0000006f          	j	800160 <_start+0x4>

00800164 <cputch>:
  800164:	ff010113          	addi	sp,sp,-16
  800168:	00112623          	sw	ra,12(sp)
  80016c:	00812423          	sw	s0,8(sp)
  800170:	00058413          	mv	s0,a1
  800174:	fb1ff0ef          	jal	ra,800124 <sys_putc>
  800178:	00042783          	lw	a5,0(s0)
  80017c:	00c12083          	lw	ra,12(sp)
  800180:	00178793          	addi	a5,a5,1
  800184:	00f42023          	sw	a5,0(s0)
  800188:	00812403          	lw	s0,8(sp)
  80018c:	01010113          	addi	sp,sp,16
  800190:	00008067          	ret

00800194 <vcprintf>:
  800194:	fe010113          	addi	sp,sp,-32
  800198:	00058693          	mv	a3,a1
  80019c:	00050613          	mv	a2,a0
  8001a0:	00c10593          	addi	a1,sp,12
  8001a4:	00000517          	auipc	a0,0x0
  8001a8:	fc050513          	addi	a0,a0,-64 # 800164 <cputch>
  8001ac:	00112e23          	sw	ra,28(sp)
  8001b0:	00012623          	sw	zero,12(sp)
  8001b4:	164000ef          	jal	ra,800318 <vprintfmt>
  8001b8:	01c12083          	lw	ra,28(sp)
  8001bc:	00c12503          	lw	a0,12(sp)
  8001c0:	02010113          	addi	sp,sp,32
  8001c4:	00008067          	ret

008001c8 <cprintf>:
  8001c8:	fc010113          	addi	sp,sp,-64
  8001cc:	02410313          	addi	t1,sp,36
  8001d0:	02b12223          	sw	a1,36(sp)
  8001d4:	02c12423          	sw	a2,40(sp)
  8001d8:	02d12623          	sw	a3,44(sp)
  8001dc:	00050613          	mv	a2,a0
  8001e0:	00c10593          	addi	a1,sp,12
  8001e4:	00000517          	auipc	a0,0x0
  8001e8:	f8050513          	addi	a0,a0,-128 # 800164 <cputch>
  8001ec:	00030693          	mv	a3,t1
  8001f0:	00112e23          	sw	ra,28(sp)
  8001f4:	02e12823          	sw	a4,48(sp)
  8001f8:	02f12a23          	sw	a5,52(sp)
  8001fc:	03012c23          	sw	a6,56(sp)
  800200:	03112e23          	sw	a7,60(sp)
  800204:	00612423          	sw	t1,8(sp)
  800208:	00012623          	sw	zero,12(sp)
  80020c:	10c000ef          	jal	ra,800318 <vprintfmt>
  800210:	01c12083          	lw	ra,28(sp)
  800214:	00c12503          	lw	a0,12(sp)
  800218:	04010113          	addi	sp,sp,64
  80021c:	00008067          	ret

00800220 <umain>:
  800220:	ff010113          	addi	sp,sp,-16
  800224:	00112623          	sw	ra,12(sp)
  800228:	63c000ef          	jal	ra,800864 <main>
  80022c:	f05ff0ef          	jal	ra,800130 <exit>

00800230 <strnlen>:
  800230:	00050693          	mv	a3,a0
  800234:	02058a63          	beqz	a1,800268 <strnlen+0x38>
  800238:	00054703          	lbu	a4,0(a0)
  80023c:	00150793          	addi	a5,a0,1
  800240:	02070463          	beqz	a4,800268 <strnlen+0x38>
  800244:	00b505b3          	add	a1,a0,a1
  800248:	0100006f          	j	800258 <strnlen+0x28>
  80024c:	00178793          	addi	a5,a5,1
  800250:	fff7c703          	lbu	a4,-1(a5)
  800254:	00070863          	beqz	a4,800264 <strnlen+0x34>
  800258:	40d78533          	sub	a0,a5,a3
  80025c:	feb798e3          	bne	a5,a1,80024c <strnlen+0x1c>
  800260:	00008067          	ret
  800264:	00008067          	ret
  800268:	00000513          	li	a0,0
  80026c:	00008067          	ret

00800270 <printnum>:
  800270:	fe010113          	addi	sp,sp,-32
  800274:	00912a23          	sw	s1,20(sp)
  800278:	01212823          	sw	s2,16(sp)
  80027c:	01312623          	sw	s3,12(sp)
  800280:	01412423          	sw	s4,8(sp)
  800284:	00112e23          	sw	ra,28(sp)
  800288:	00812c23          	sw	s0,24(sp)
  80028c:	00050493          	mv	s1,a0
  800290:	00058913          	mv	s2,a1
  800294:	00080993          	mv	s3,a6
  800298:	02e67a33          	remu	s4,a2,a4
  80029c:	04069e63          	bnez	a3,8002f8 <printnum+0x88>
  8002a0:	04e67c63          	bleu	a4,a2,8002f8 <printnum+0x88>
  8002a4:	fff78413          	addi	s0,a5,-1
  8002a8:	00805c63          	blez	s0,8002c0 <printnum+0x50>
  8002ac:	fff40413          	addi	s0,s0,-1
  8002b0:	00090593          	mv	a1,s2
  8002b4:	00098513          	mv	a0,s3
  8002b8:	000480e7          	jalr	s1
  8002bc:	fe0418e3          	bnez	s0,8002ac <printnum+0x3c>
  8002c0:	00001797          	auipc	a5,0x1
  8002c4:	8a078793          	addi	a5,a5,-1888 # 800b60 <error_string+0x64>
  8002c8:	014787b3          	add	a5,a5,s4
  8002cc:	00090593          	mv	a1,s2
  8002d0:	00048313          	mv	t1,s1
  8002d4:	01c12083          	lw	ra,28(sp)
  8002d8:	01812403          	lw	s0,24(sp)
  8002dc:	01412483          	lw	s1,20(sp)
  8002e0:	01012903          	lw	s2,16(sp)
  8002e4:	00c12983          	lw	s3,12(sp)
  8002e8:	00812a03          	lw	s4,8(sp)
  8002ec:	0007c503          	lbu	a0,0(a5)
  8002f0:	02010113          	addi	sp,sp,32
  8002f4:	00030067          	jr	t1
  8002f8:	02e65633          	divu	a2,a2,a4
  8002fc:	00098813          	mv	a6,s3
  800300:	fff78793          	addi	a5,a5,-1
  800304:	00000693          	li	a3,0
  800308:	00090593          	mv	a1,s2
  80030c:	00048513          	mv	a0,s1
  800310:	f61ff0ef          	jal	ra,800270 <printnum>
  800314:	fadff06f          	j	8002c0 <printnum+0x50>

00800318 <vprintfmt>:
  800318:	fb010113          	addi	sp,sp,-80
  80031c:	05212023          	sw	s2,64(sp)
  800320:	03312e23          	sw	s3,60(sp)
  800324:	03412c23          	sw	s4,56(sp)
  800328:	03512a23          	sw	s5,52(sp)
  80032c:	03612823          	sw	s6,48(sp)
  800330:	03712623          	sw	s7,44(sp)
  800334:	03812423          	sw	s8,40(sp)
  800338:	03912223          	sw	s9,36(sp)
  80033c:	04112623          	sw	ra,76(sp)
  800340:	04812423          	sw	s0,72(sp)
  800344:	04912223          	sw	s1,68(sp)
  800348:	03a12023          	sw	s10,32(sp)
  80034c:	01b12e23          	sw	s11,28(sp)
  800350:	00050993          	mv	s3,a0
  800354:	00058913          	mv	s2,a1
  800358:	00060c93          	mv	s9,a2
  80035c:	00068a93          	mv	s5,a3
  800360:	00000a17          	auipc	s4,0x0
  800364:	644a0a13          	addi	s4,s4,1604 # 8009a4 <main+0x140>
  800368:	02800c13          	li	s8,40
  80036c:	fff00b13          	li	s6,-1
  800370:	05e00b93          	li	s7,94
  800374:	000cc503          	lbu	a0,0(s9)
  800378:	02500493          	li	s1,37
  80037c:	001c8413          	addi	s0,s9,1
  800380:	00950e63          	beq	a0,s1,80039c <vprintfmt+0x84>
  800384:	06050463          	beqz	a0,8003ec <vprintfmt+0xd4>
  800388:	00090593          	mv	a1,s2
  80038c:	00140413          	addi	s0,s0,1
  800390:	000980e7          	jalr	s3
  800394:	fff44503          	lbu	a0,-1(s0)
  800398:	fe9516e3          	bne	a0,s1,800384 <vprintfmt+0x6c>
  80039c:	00044e03          	lbu	t3,0(s0)
  8003a0:	fff00d13          	li	s10,-1
  8003a4:	02000813          	li	a6,32
  8003a8:	00000493          	li	s1,0
  8003ac:	00000593          	li	a1,0
  8003b0:	000d0d93          	mv	s11,s10
  8003b4:	05500693          	li	a3,85
  8003b8:	00100313          	li	t1,1
  8003bc:	03000893          	li	a7,48
  8003c0:	00900613          	li	a2,9
  8003c4:	02d00513          	li	a0,45
  8003c8:	fdde0713          	addi	a4,t3,-35
  8003cc:	0ff77713          	andi	a4,a4,255
  8003d0:	00140c93          	addi	s9,s0,1
  8003d4:	32e6e463          	bltu	a3,a4,8006fc <vprintfmt+0x3e4>
  8003d8:	00271713          	slli	a4,a4,0x2
  8003dc:	01470733          	add	a4,a4,s4
  8003e0:	00072783          	lw	a5,0(a4)
  8003e4:	014787b3          	add	a5,a5,s4
  8003e8:	00078067          	jr	a5
  8003ec:	04c12083          	lw	ra,76(sp)
  8003f0:	04812403          	lw	s0,72(sp)
  8003f4:	04412483          	lw	s1,68(sp)
  8003f8:	04012903          	lw	s2,64(sp)
  8003fc:	03c12983          	lw	s3,60(sp)
  800400:	03812a03          	lw	s4,56(sp)
  800404:	03412a83          	lw	s5,52(sp)
  800408:	03012b03          	lw	s6,48(sp)
  80040c:	02c12b83          	lw	s7,44(sp)
  800410:	02812c03          	lw	s8,40(sp)
  800414:	02412c83          	lw	s9,36(sp)
  800418:	02012d03          	lw	s10,32(sp)
  80041c:	01c12d83          	lw	s11,28(sp)
  800420:	05010113          	addi	sp,sp,80
  800424:	00008067          	ret
  800428:	00100793          	li	a5,1
  80042c:	34b7c063          	blt	a5,a1,80076c <vprintfmt+0x454>
  800430:	000aa603          	lw	a2,0(s5)
  800434:	00000693          	li	a3,0
  800438:	004a8a93          	addi	s5,s5,4
  80043c:	01000713          	li	a4,16
  800440:	000d8793          	mv	a5,s11
  800444:	00090593          	mv	a1,s2
  800448:	00098513          	mv	a0,s3
  80044c:	e25ff0ef          	jal	ra,800270 <printnum>
  800450:	f25ff06f          	j	800374 <vprintfmt+0x5c>
  800454:	00144e03          	lbu	t3,1(s0)
  800458:	00030493          	mv	s1,t1
  80045c:	000c8413          	mv	s0,s9
  800460:	f69ff06f          	j	8003c8 <vprintfmt+0xb0>
  800464:	000aa503          	lw	a0,0(s5)
  800468:	00090593          	mv	a1,s2
  80046c:	004a8a93          	addi	s5,s5,4
  800470:	000980e7          	jalr	s3
  800474:	f01ff06f          	j	800374 <vprintfmt+0x5c>
  800478:	00100793          	li	a5,1
  80047c:	30b7c663          	blt	a5,a1,800788 <vprintfmt+0x470>
  800480:	000aa603          	lw	a2,0(s5)
  800484:	004a8a93          	addi	s5,s5,4
  800488:	41f65693          	srai	a3,a2,0x1f
  80048c:	00a00713          	li	a4,10
  800490:	fa06d8e3          	bgez	a3,800440 <vprintfmt+0x128>
  800494:	00090593          	mv	a1,s2
  800498:	02d00513          	li	a0,45
  80049c:	00d12623          	sw	a3,12(sp)
  8004a0:	00c12423          	sw	a2,8(sp)
  8004a4:	00e12223          	sw	a4,4(sp)
  8004a8:	01012023          	sw	a6,0(sp)
  8004ac:	000980e7          	jalr	s3
  8004b0:	00812603          	lw	a2,8(sp)
  8004b4:	00c12683          	lw	a3,12(sp)
  8004b8:	00012803          	lw	a6,0(sp)
  8004bc:	40c00633          	neg	a2,a2
  8004c0:	00c037b3          	snez	a5,a2
  8004c4:	40d006b3          	neg	a3,a3
  8004c8:	40f686b3          	sub	a3,a3,a5
  8004cc:	00412703          	lw	a4,4(sp)
  8004d0:	f71ff06f          	j	800440 <vprintfmt+0x128>
  8004d4:	000aa783          	lw	a5,0(s5)
  8004d8:	01800693          	li	a3,24
  8004dc:	004a8a93          	addi	s5,s5,4
  8004e0:	41f7d713          	srai	a4,a5,0x1f
  8004e4:	00f747b3          	xor	a5,a4,a5
  8004e8:	40e787b3          	sub	a5,a5,a4
  8004ec:	2af6ca63          	blt	a3,a5,8007a0 <vprintfmt+0x488>
  8004f0:	00279693          	slli	a3,a5,0x2
  8004f4:	00000717          	auipc	a4,0x0
  8004f8:	60870713          	addi	a4,a4,1544 # 800afc <error_string>
  8004fc:	00d70733          	add	a4,a4,a3
  800500:	00072683          	lw	a3,0(a4)
  800504:	28068e63          	beqz	a3,8007a0 <vprintfmt+0x488>
  800508:	00000617          	auipc	a2,0x0
  80050c:	72460613          	addi	a2,a2,1828 # 800c2c <error_string+0x130>
  800510:	00090593          	mv	a1,s2
  800514:	00098513          	mv	a0,s3
  800518:	314000ef          	jal	ra,80082c <printfmt>
  80051c:	e59ff06f          	j	800374 <vprintfmt+0x5c>
  800520:	00144e03          	lbu	t3,1(s0)
  800524:	00158593          	addi	a1,a1,1
  800528:	000c8413          	mv	s0,s9
  80052c:	e9dff06f          	j	8003c8 <vprintfmt+0xb0>
  800530:	00100793          	li	a5,1
  800534:	20b7c063          	blt	a5,a1,800734 <vprintfmt+0x41c>
  800538:	000aa603          	lw	a2,0(s5)
  80053c:	00000693          	li	a3,0
  800540:	004a8a93          	addi	s5,s5,4
  800544:	00800713          	li	a4,8
  800548:	ef9ff06f          	j	800440 <vprintfmt+0x128>
  80054c:	03000513          	li	a0,48
  800550:	00090593          	mv	a1,s2
  800554:	01012023          	sw	a6,0(sp)
  800558:	000980e7          	jalr	s3
  80055c:	00090593          	mv	a1,s2
  800560:	07800513          	li	a0,120
  800564:	000980e7          	jalr	s3
  800568:	000aa603          	lw	a2,0(s5)
  80056c:	00000693          	li	a3,0
  800570:	01000713          	li	a4,16
  800574:	004a8a93          	addi	s5,s5,4
  800578:	00012803          	lw	a6,0(sp)
  80057c:	ec5ff06f          	j	800440 <vprintfmt+0x128>
  800580:	000aa403          	lw	s0,0(s5)
  800584:	004a8793          	addi	a5,s5,4
  800588:	00f12223          	sw	a5,4(sp)
  80058c:	24040863          	beqz	s0,8007dc <vprintfmt+0x4c4>
  800590:	05b05263          	blez	s11,8005d4 <vprintfmt+0x2bc>
  800594:	02d00793          	li	a5,45
  800598:	22f80263          	beq	a6,a5,8007bc <vprintfmt+0x4a4>
  80059c:	000d0593          	mv	a1,s10
  8005a0:	00040513          	mv	a0,s0
  8005a4:	01012023          	sw	a6,0(sp)
  8005a8:	c89ff0ef          	jal	ra,800230 <strnlen>
  8005ac:	40ad8db3          	sub	s11,s11,a0
  8005b0:	03b05263          	blez	s11,8005d4 <vprintfmt+0x2bc>
  8005b4:	00012803          	lw	a6,0(sp)
  8005b8:	00080513          	mv	a0,a6
  8005bc:	00090593          	mv	a1,s2
  8005c0:	01012023          	sw	a6,0(sp)
  8005c4:	fffd8d93          	addi	s11,s11,-1
  8005c8:	000980e7          	jalr	s3
  8005cc:	00012803          	lw	a6,0(sp)
  8005d0:	fe0d94e3          	bnez	s11,8005b8 <vprintfmt+0x2a0>
  8005d4:	00044783          	lbu	a5,0(s0)
  8005d8:	00140a93          	addi	s5,s0,1
  8005dc:	00078513          	mv	a0,a5
  8005e0:	04078c63          	beqz	a5,800638 <vprintfmt+0x320>
  8005e4:	03f00413          	li	s0,63
  8005e8:	000d4663          	bltz	s10,8005f4 <vprintfmt+0x2dc>
  8005ec:	fffd0d13          	addi	s10,s10,-1
  8005f0:	036d0663          	beq	s10,s6,80061c <vprintfmt+0x304>
  8005f4:	00090593          	mv	a1,s2
  8005f8:	00048663          	beqz	s1,800604 <vprintfmt+0x2ec>
  8005fc:	fe078793          	addi	a5,a5,-32
  800600:	12fbe463          	bltu	s7,a5,800728 <vprintfmt+0x410>
  800604:	000980e7          	jalr	s3
  800608:	001a8a93          	addi	s5,s5,1
  80060c:	fffac783          	lbu	a5,-1(s5)
  800610:	fffd8d93          	addi	s11,s11,-1
  800614:	00078513          	mv	a0,a5
  800618:	fc0798e3          	bnez	a5,8005e8 <vprintfmt+0x2d0>
  80061c:	01b05e63          	blez	s11,800638 <vprintfmt+0x320>
  800620:	02000413          	li	s0,32
  800624:	fffd8d93          	addi	s11,s11,-1
  800628:	00090593          	mv	a1,s2
  80062c:	00040513          	mv	a0,s0
  800630:	000980e7          	jalr	s3
  800634:	fe0d98e3          	bnez	s11,800624 <vprintfmt+0x30c>
  800638:	00412a83          	lw	s5,4(sp)
  80063c:	d39ff06f          	j	800374 <vprintfmt+0x5c>
  800640:	00100793          	li	a5,1
  800644:	10b7c663          	blt	a5,a1,800750 <vprintfmt+0x438>
  800648:	000aa603          	lw	a2,0(s5)
  80064c:	00000693          	li	a3,0
  800650:	004a8a93          	addi	s5,s5,4
  800654:	00a00713          	li	a4,10
  800658:	de9ff06f          	j	800440 <vprintfmt+0x128>
  80065c:	00144e03          	lbu	t3,1(s0)
  800660:	00050813          	mv	a6,a0
  800664:	000c8413          	mv	s0,s9
  800668:	d61ff06f          	j	8003c8 <vprintfmt+0xb0>
  80066c:	00090593          	mv	a1,s2
  800670:	02500513          	li	a0,37
  800674:	000980e7          	jalr	s3
  800678:	cfdff06f          	j	800374 <vprintfmt+0x5c>
  80067c:	000aad03          	lw	s10,0(s5)
  800680:	00144e03          	lbu	t3,1(s0)
  800684:	004a8a93          	addi	s5,s5,4
  800688:	000c8413          	mv	s0,s9
  80068c:	d20ddee3          	bgez	s11,8003c8 <vprintfmt+0xb0>
  800690:	000d0d93          	mv	s11,s10
  800694:	fff00d13          	li	s10,-1
  800698:	d31ff06f          	j	8003c8 <vprintfmt+0xb0>
  80069c:	00144e03          	lbu	t3,1(s0)
  8006a0:	00088813          	mv	a6,a7
  8006a4:	000c8413          	mv	s0,s9
  8006a8:	d21ff06f          	j	8003c8 <vprintfmt+0xb0>
  8006ac:	00144703          	lbu	a4,1(s0)
  8006b0:	fd0e0d13          	addi	s10,t3,-48
  8006b4:	fd070793          	addi	a5,a4,-48
  8006b8:	14f66863          	bltu	a2,a5,800808 <vprintfmt+0x4f0>
  8006bc:	000c8413          	mv	s0,s9
  8006c0:	002d1793          	slli	a5,s10,0x2
  8006c4:	01a78d33          	add	s10,a5,s10
  8006c8:	00140413          	addi	s0,s0,1
  8006cc:	001d1d13          	slli	s10,s10,0x1
  8006d0:	00ed0d33          	add	s10,s10,a4
  8006d4:	00044703          	lbu	a4,0(s0)
  8006d8:	fd0d0d13          	addi	s10,s10,-48
  8006dc:	fd070793          	addi	a5,a4,-48
  8006e0:	fef670e3          	bleu	a5,a2,8006c0 <vprintfmt+0x3a8>
  8006e4:	00070e13          	mv	t3,a4
  8006e8:	fa5ff06f          	j	80068c <vprintfmt+0x374>
  8006ec:	0e0dc463          	bltz	s11,8007d4 <vprintfmt+0x4bc>
  8006f0:	00144e03          	lbu	t3,1(s0)
  8006f4:	000c8413          	mv	s0,s9
  8006f8:	cd1ff06f          	j	8003c8 <vprintfmt+0xb0>
  8006fc:	00090593          	mv	a1,s2
  800700:	02500513          	li	a0,37
  800704:	000980e7          	jalr	s3
  800708:	fff44783          	lbu	a5,-1(s0)
  80070c:	02500713          	li	a4,37
  800710:	00040c93          	mv	s9,s0
  800714:	c6e780e3          	beq	a5,a4,800374 <vprintfmt+0x5c>
  800718:	fffc8c93          	addi	s9,s9,-1
  80071c:	fffcc783          	lbu	a5,-1(s9)
  800720:	fee79ce3          	bne	a5,a4,800718 <vprintfmt+0x400>
  800724:	c51ff06f          	j	800374 <vprintfmt+0x5c>
  800728:	00040513          	mv	a0,s0
  80072c:	000980e7          	jalr	s3
  800730:	ed9ff06f          	j	800608 <vprintfmt+0x2f0>
  800734:	007a8793          	addi	a5,s5,7
  800738:	ff87f793          	andi	a5,a5,-8
  80073c:	00878a93          	addi	s5,a5,8
  800740:	0007a603          	lw	a2,0(a5)
  800744:	0047a683          	lw	a3,4(a5)
  800748:	00800713          	li	a4,8
  80074c:	cf5ff06f          	j	800440 <vprintfmt+0x128>
  800750:	007a8793          	addi	a5,s5,7
  800754:	ff87f793          	andi	a5,a5,-8
  800758:	00878a93          	addi	s5,a5,8
  80075c:	0007a603          	lw	a2,0(a5)
  800760:	0047a683          	lw	a3,4(a5)
  800764:	00a00713          	li	a4,10
  800768:	cd9ff06f          	j	800440 <vprintfmt+0x128>
  80076c:	007a8793          	addi	a5,s5,7
  800770:	ff87f793          	andi	a5,a5,-8
  800774:	00878a93          	addi	s5,a5,8
  800778:	0007a603          	lw	a2,0(a5)
  80077c:	0047a683          	lw	a3,4(a5)
  800780:	01000713          	li	a4,16
  800784:	cbdff06f          	j	800440 <vprintfmt+0x128>
  800788:	007a8793          	addi	a5,s5,7
  80078c:	ff87f793          	andi	a5,a5,-8
  800790:	00878a93          	addi	s5,a5,8
  800794:	0007a603          	lw	a2,0(a5)
  800798:	0047a683          	lw	a3,4(a5)
  80079c:	cf1ff06f          	j	80048c <vprintfmt+0x174>
  8007a0:	00078693          	mv	a3,a5
  8007a4:	00000617          	auipc	a2,0x0
  8007a8:	47c60613          	addi	a2,a2,1148 # 800c20 <error_string+0x124>
  8007ac:	00090593          	mv	a1,s2
  8007b0:	00098513          	mv	a0,s3
  8007b4:	078000ef          	jal	ra,80082c <printfmt>
  8007b8:	bbdff06f          	j	800374 <vprintfmt+0x5c>
  8007bc:	00044783          	lbu	a5,0(s0)
  8007c0:	00140a93          	addi	s5,s0,1
  8007c4:	00078513          	mv	a0,a5
  8007c8:	e4078ce3          	beqz	a5,800620 <vprintfmt+0x308>
  8007cc:	03f00413          	li	s0,63
  8007d0:	e19ff06f          	j	8005e8 <vprintfmt+0x2d0>
  8007d4:	00000d93          	li	s11,0
  8007d8:	f19ff06f          	j	8006f0 <vprintfmt+0x3d8>
  8007dc:	03b05c63          	blez	s11,800814 <vprintfmt+0x4fc>
  8007e0:	02d00793          	li	a5,45
  8007e4:	00000417          	auipc	s0,0x0
  8007e8:	43440413          	addi	s0,s0,1076 # 800c18 <error_string+0x11c>
  8007ec:	daf818e3          	bne	a6,a5,80059c <vprintfmt+0x284>
  8007f0:	00000a97          	auipc	s5,0x0
  8007f4:	429a8a93          	addi	s5,s5,1065 # 800c19 <error_string+0x11d>
  8007f8:	000c0513          	mv	a0,s8
  8007fc:	000c0793          	mv	a5,s8
  800800:	03f00413          	li	s0,63
  800804:	de5ff06f          	j	8005e8 <vprintfmt+0x2d0>
  800808:	00070e13          	mv	t3,a4
  80080c:	000c8413          	mv	s0,s9
  800810:	e7dff06f          	j	80068c <vprintfmt+0x374>
  800814:	000c0793          	mv	a5,s8
  800818:	000c0513          	mv	a0,s8
  80081c:	00000a97          	auipc	s5,0x0
  800820:	3fda8a93          	addi	s5,s5,1021 # 800c19 <error_string+0x11d>
  800824:	03f00413          	li	s0,63
  800828:	dc1ff06f          	j	8005e8 <vprintfmt+0x2d0>

0080082c <printfmt>:
  80082c:	fc010113          	addi	sp,sp,-64
  800830:	02c10313          	addi	t1,sp,44
  800834:	02d12623          	sw	a3,44(sp)
  800838:	00030693          	mv	a3,t1
  80083c:	00112e23          	sw	ra,28(sp)
  800840:	02e12823          	sw	a4,48(sp)
  800844:	02f12a23          	sw	a5,52(sp)
  800848:	03012c23          	sw	a6,56(sp)
  80084c:	03112e23          	sw	a7,60(sp)
  800850:	00612623          	sw	t1,12(sp)
  800854:	ac5ff0ef          	jal	ra,800318 <vprintfmt>
  800858:	01c12083          	lw	ra,28(sp)
  80085c:	04010113          	addi	sp,sp,64
  800860:	00008067          	ret

00800864 <main>:
  800864:	ff010113          	addi	sp,sp,-16
  800868:	00000517          	auipc	a0,0x0
  80086c:	3c850513          	addi	a0,a0,968 # 800c30 <error_string+0x134>
  800870:	00112623          	sw	ra,12(sp)
  800874:	00812423          	sw	s0,8(sp)
  800878:	951ff0ef          	jal	ra,8001c8 <cprintf>
  80087c:	8d1ff0ef          	jal	ra,80014c <fork>
  800880:	08050663          	beqz	a0,80090c <main+0xa8>
  800884:	00050413          	mv	s0,a0
  800888:	08054a63          	bltz	a0,80091c <main+0xb8>
  80088c:	00000517          	auipc	a0,0x0
  800890:	40c50513          	addi	a0,a0,1036 # 800c98 <error_string+0x19c>
  800894:	935ff0ef          	jal	ra,8001c8 <cprintf>
  800898:	8bdff0ef          	jal	ra,800154 <yield>
  80089c:	8b9ff0ef          	jal	ra,800154 <yield>
  8008a0:	8b5ff0ef          	jal	ra,800154 <yield>
  8008a4:	00000517          	auipc	a0,0x0
  8008a8:	41c50513          	addi	a0,a0,1052 # 800cc0 <error_string+0x1c4>
  8008ac:	91dff0ef          	jal	ra,8001c8 <cprintf>
  8008b0:	00040513          	mv	a0,s0
  8008b4:	8a5ff0ef          	jal	ra,800158 <kill>
  8008b8:	08051e63          	bnez	a0,800954 <main+0xf0>
  8008bc:	00000593          	li	a1,0
  8008c0:	00000517          	auipc	a0,0x0
  8008c4:	45850513          	addi	a0,a0,1112 # 800d18 <error_string+0x21c>
  8008c8:	901ff0ef          	jal	ra,8001c8 <cprintf>
  8008cc:	00000593          	li	a1,0
  8008d0:	00040513          	mv	a0,s0
  8008d4:	87dff0ef          	jal	ra,800150 <waitpid>
  8008d8:	04051e63          	bnez	a0,800934 <main+0xd0>
  8008dc:	00000593          	li	a1,0
  8008e0:	00000517          	auipc	a0,0x0
  8008e4:	46c50513          	addi	a0,a0,1132 # 800d4c <error_string+0x250>
  8008e8:	8e1ff0ef          	jal	ra,8001c8 <cprintf>
  8008ec:	00000517          	auipc	a0,0x0
  8008f0:	47450513          	addi	a0,a0,1140 # 800d60 <error_string+0x264>
  8008f4:	8d5ff0ef          	jal	ra,8001c8 <cprintf>
  8008f8:	00c12083          	lw	ra,12(sp)
  8008fc:	00000513          	li	a0,0
  800900:	00812403          	lw	s0,8(sp)
  800904:	01010113          	addi	sp,sp,16
  800908:	00008067          	ret
  80090c:	00000517          	auipc	a0,0x0
  800910:	34c50513          	addi	a0,a0,844 # 800c58 <error_string+0x15c>
  800914:	8b5ff0ef          	jal	ra,8001c8 <cprintf>
  800918:	0000006f          	j	800918 <main+0xb4>
  80091c:	00000617          	auipc	a2,0x0
  800920:	35c60613          	addi	a2,a2,860 # 800c78 <error_string+0x17c>
  800924:	00d00593          	li	a1,13
  800928:	00000517          	auipc	a0,0x0
  80092c:	36450513          	addi	a0,a0,868 # 800c8c <error_string+0x190>
  800930:	ef0ff0ef          	jal	ra,800020 <__panic>
  800934:	00000697          	auipc	a3,0x0
  800938:	3f868693          	addi	a3,a3,1016 # 800d2c <error_string+0x230>
  80093c:	00000617          	auipc	a2,0x0
  800940:	3c460613          	addi	a2,a2,964 # 800d00 <error_string+0x204>
  800944:	01a00593          	li	a1,26
  800948:	00000517          	auipc	a0,0x0
  80094c:	34450513          	addi	a0,a0,836 # 800c8c <error_string+0x190>
  800950:	ed0ff0ef          	jal	ra,800020 <__panic>
  800954:	00000697          	auipc	a3,0x0
  800958:	39468693          	addi	a3,a3,916 # 800ce8 <error_string+0x1ec>
  80095c:	00000617          	auipc	a2,0x0
  800960:	3a460613          	addi	a2,a2,932 # 800d00 <error_string+0x204>
  800964:	01700593          	li	a1,23
  800968:	00000517          	auipc	a0,0x0
  80096c:	32450513          	addi	a0,a0,804 # 800c8c <error_string+0x190>
  800970:	eb0ff0ef          	jal	ra,800020 <__panic>
