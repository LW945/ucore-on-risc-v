
obj/__user_waitkill.out:     file format elf32-littleriscv


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
  800040:	99c50513          	addi	a0,a0,-1636 # 8009d8 <main+0xc4>
  800044:	00112e23          	sw	ra,28(sp)
  800048:	02d12623          	sw	a3,44(sp)
  80004c:	02e12823          	sw	a4,48(sp)
  800050:	03012c23          	sw	a6,56(sp)
  800054:	03112e23          	sw	a7,60(sp)
  800058:	00f12623          	sw	a5,12(sp)
  80005c:	178000ef          	jal	ra,8001d4 <cprintf>
  800060:	00c12583          	lw	a1,12(sp)
  800064:	00040513          	mv	a0,s0
  800068:	138000ef          	jal	ra,8001a0 <vcprintf>
  80006c:	00001517          	auipc	a0,0x1
  800070:	c3050513          	addi	a0,a0,-976 # 800c9c <error_string+0x13c>
  800074:	160000ef          	jal	ra,8001d4 <cprintf>
  800078:	ff600513          	li	a0,-10
  80007c:	0bc000ef          	jal	ra,800138 <exit>

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

00800124 <sys_getpid>:
  800124:	01200513          	li	a0,18
  800128:	f59ff06f          	j	800080 <syscall>

0080012c <sys_putc>:
  80012c:	00050593          	mv	a1,a0
  800130:	01e00513          	li	a0,30
  800134:	f4dff06f          	j	800080 <syscall>

00800138 <exit>:
  800138:	ff010113          	addi	sp,sp,-16
  80013c:	00112623          	sw	ra,12(sp)
  800140:	fadff0ef          	jal	ra,8000ec <sys_exit>
  800144:	00001517          	auipc	a0,0x1
  800148:	8b050513          	addi	a0,a0,-1872 # 8009f4 <main+0xe0>
  80014c:	088000ef          	jal	ra,8001d4 <cprintf>
  800150:	0000006f          	j	800150 <exit+0x18>

00800154 <fork>:
  800154:	fa5ff06f          	j	8000f8 <sys_fork>

00800158 <waitpid>:
  800158:	fa9ff06f          	j	800100 <sys_wait>

0080015c <yield>:
  80015c:	fb5ff06f          	j	800110 <sys_yield>

00800160 <kill>:
  800160:	fb9ff06f          	j	800118 <sys_kill>

00800164 <getpid>:
  800164:	fc1ff06f          	j	800124 <sys_getpid>

00800168 <_start>:
  800168:	0c4000ef          	jal	ra,80022c <umain>
  80016c:	0000006f          	j	80016c <_start+0x4>

00800170 <cputch>:
  800170:	ff010113          	addi	sp,sp,-16
  800174:	00112623          	sw	ra,12(sp)
  800178:	00812423          	sw	s0,8(sp)
  80017c:	00058413          	mv	s0,a1
  800180:	fadff0ef          	jal	ra,80012c <sys_putc>
  800184:	00042783          	lw	a5,0(s0)
  800188:	00c12083          	lw	ra,12(sp)
  80018c:	00178793          	addi	a5,a5,1
  800190:	00f42023          	sw	a5,0(s0)
  800194:	00812403          	lw	s0,8(sp)
  800198:	01010113          	addi	sp,sp,16
  80019c:	00008067          	ret

008001a0 <vcprintf>:
  8001a0:	fe010113          	addi	sp,sp,-32
  8001a4:	00058693          	mv	a3,a1
  8001a8:	00050613          	mv	a2,a0
  8001ac:	00c10593          	addi	a1,sp,12
  8001b0:	00000517          	auipc	a0,0x0
  8001b4:	fc050513          	addi	a0,a0,-64 # 800170 <cputch>
  8001b8:	00112e23          	sw	ra,28(sp)
  8001bc:	00012623          	sw	zero,12(sp)
  8001c0:	164000ef          	jal	ra,800324 <vprintfmt>
  8001c4:	01c12083          	lw	ra,28(sp)
  8001c8:	00c12503          	lw	a0,12(sp)
  8001cc:	02010113          	addi	sp,sp,32
  8001d0:	00008067          	ret

008001d4 <cprintf>:
  8001d4:	fc010113          	addi	sp,sp,-64
  8001d8:	02410313          	addi	t1,sp,36
  8001dc:	02b12223          	sw	a1,36(sp)
  8001e0:	02c12423          	sw	a2,40(sp)
  8001e4:	02d12623          	sw	a3,44(sp)
  8001e8:	00050613          	mv	a2,a0
  8001ec:	00c10593          	addi	a1,sp,12
  8001f0:	00000517          	auipc	a0,0x0
  8001f4:	f8050513          	addi	a0,a0,-128 # 800170 <cputch>
  8001f8:	00030693          	mv	a3,t1
  8001fc:	00112e23          	sw	ra,28(sp)
  800200:	02e12823          	sw	a4,48(sp)
  800204:	02f12a23          	sw	a5,52(sp)
  800208:	03012c23          	sw	a6,56(sp)
  80020c:	03112e23          	sw	a7,60(sp)
  800210:	00612423          	sw	t1,8(sp)
  800214:	00012623          	sw	zero,12(sp)
  800218:	10c000ef          	jal	ra,800324 <vprintfmt>
  80021c:	01c12083          	lw	ra,28(sp)
  800220:	00c12503          	lw	a0,12(sp)
  800224:	04010113          	addi	sp,sp,64
  800228:	00008067          	ret

0080022c <umain>:
  80022c:	ff010113          	addi	sp,sp,-16
  800230:	00112623          	sw	ra,12(sp)
  800234:	6e0000ef          	jal	ra,800914 <main>
  800238:	f01ff0ef          	jal	ra,800138 <exit>

0080023c <strnlen>:
  80023c:	00050693          	mv	a3,a0
  800240:	02058a63          	beqz	a1,800274 <strnlen+0x38>
  800244:	00054703          	lbu	a4,0(a0)
  800248:	00150793          	addi	a5,a0,1
  80024c:	02070463          	beqz	a4,800274 <strnlen+0x38>
  800250:	00b505b3          	add	a1,a0,a1
  800254:	0100006f          	j	800264 <strnlen+0x28>
  800258:	00178793          	addi	a5,a5,1
  80025c:	fff7c703          	lbu	a4,-1(a5)
  800260:	00070863          	beqz	a4,800270 <strnlen+0x34>
  800264:	40d78533          	sub	a0,a5,a3
  800268:	feb798e3          	bne	a5,a1,800258 <strnlen+0x1c>
  80026c:	00008067          	ret
  800270:	00008067          	ret
  800274:	00000513          	li	a0,0
  800278:	00008067          	ret

0080027c <printnum>:
  80027c:	fe010113          	addi	sp,sp,-32
  800280:	00912a23          	sw	s1,20(sp)
  800284:	01212823          	sw	s2,16(sp)
  800288:	01312623          	sw	s3,12(sp)
  80028c:	01412423          	sw	s4,8(sp)
  800290:	00112e23          	sw	ra,28(sp)
  800294:	00812c23          	sw	s0,24(sp)
  800298:	00050493          	mv	s1,a0
  80029c:	00058913          	mv	s2,a1
  8002a0:	00080993          	mv	s3,a6
  8002a4:	02e67a33          	remu	s4,a2,a4
  8002a8:	04069e63          	bnez	a3,800304 <printnum+0x88>
  8002ac:	04e67c63          	bleu	a4,a2,800304 <printnum+0x88>
  8002b0:	fff78413          	addi	s0,a5,-1
  8002b4:	00805c63          	blez	s0,8002cc <printnum+0x50>
  8002b8:	fff40413          	addi	s0,s0,-1
  8002bc:	00090593          	mv	a1,s2
  8002c0:	00098513          	mv	a0,s3
  8002c4:	000480e7          	jalr	s1
  8002c8:	fe0418e3          	bnez	s0,8002b8 <printnum+0x3c>
  8002cc:	00001797          	auipc	a5,0x1
  8002d0:	8f878793          	addi	a5,a5,-1800 # 800bc4 <error_string+0x64>
  8002d4:	014787b3          	add	a5,a5,s4
  8002d8:	00090593          	mv	a1,s2
  8002dc:	00048313          	mv	t1,s1
  8002e0:	01c12083          	lw	ra,28(sp)
  8002e4:	01812403          	lw	s0,24(sp)
  8002e8:	01412483          	lw	s1,20(sp)
  8002ec:	01012903          	lw	s2,16(sp)
  8002f0:	00c12983          	lw	s3,12(sp)
  8002f4:	00812a03          	lw	s4,8(sp)
  8002f8:	0007c503          	lbu	a0,0(a5)
  8002fc:	02010113          	addi	sp,sp,32
  800300:	00030067          	jr	t1
  800304:	02e65633          	divu	a2,a2,a4
  800308:	00098813          	mv	a6,s3
  80030c:	fff78793          	addi	a5,a5,-1
  800310:	00000693          	li	a3,0
  800314:	00090593          	mv	a1,s2
  800318:	00048513          	mv	a0,s1
  80031c:	f61ff0ef          	jal	ra,80027c <printnum>
  800320:	fadff06f          	j	8002cc <printnum+0x50>

00800324 <vprintfmt>:
  800324:	fb010113          	addi	sp,sp,-80
  800328:	05212023          	sw	s2,64(sp)
  80032c:	03312e23          	sw	s3,60(sp)
  800330:	03412c23          	sw	s4,56(sp)
  800334:	03512a23          	sw	s5,52(sp)
  800338:	03612823          	sw	s6,48(sp)
  80033c:	03712623          	sw	s7,44(sp)
  800340:	03812423          	sw	s8,40(sp)
  800344:	03912223          	sw	s9,36(sp)
  800348:	04112623          	sw	ra,76(sp)
  80034c:	04812423          	sw	s0,72(sp)
  800350:	04912223          	sw	s1,68(sp)
  800354:	03a12023          	sw	s10,32(sp)
  800358:	01b12e23          	sw	s11,28(sp)
  80035c:	00050993          	mv	s3,a0
  800360:	00058913          	mv	s2,a1
  800364:	00060c93          	mv	s9,a2
  800368:	00068a93          	mv	s5,a3
  80036c:	00000a17          	auipc	s4,0x0
  800370:	69ca0a13          	addi	s4,s4,1692 # 800a08 <main+0xf4>
  800374:	02800c13          	li	s8,40
  800378:	fff00b13          	li	s6,-1
  80037c:	05e00b93          	li	s7,94
  800380:	000cc503          	lbu	a0,0(s9)
  800384:	02500493          	li	s1,37
  800388:	001c8413          	addi	s0,s9,1
  80038c:	00950e63          	beq	a0,s1,8003a8 <vprintfmt+0x84>
  800390:	06050463          	beqz	a0,8003f8 <vprintfmt+0xd4>
  800394:	00090593          	mv	a1,s2
  800398:	00140413          	addi	s0,s0,1
  80039c:	000980e7          	jalr	s3
  8003a0:	fff44503          	lbu	a0,-1(s0)
  8003a4:	fe9516e3          	bne	a0,s1,800390 <vprintfmt+0x6c>
  8003a8:	00044e03          	lbu	t3,0(s0)
  8003ac:	fff00d13          	li	s10,-1
  8003b0:	02000813          	li	a6,32
  8003b4:	00000493          	li	s1,0
  8003b8:	00000593          	li	a1,0
  8003bc:	000d0d93          	mv	s11,s10
  8003c0:	05500693          	li	a3,85
  8003c4:	00100313          	li	t1,1
  8003c8:	03000893          	li	a7,48
  8003cc:	00900613          	li	a2,9
  8003d0:	02d00513          	li	a0,45
  8003d4:	fdde0713          	addi	a4,t3,-35
  8003d8:	0ff77713          	andi	a4,a4,255
  8003dc:	00140c93          	addi	s9,s0,1
  8003e0:	32e6e463          	bltu	a3,a4,800708 <vprintfmt+0x3e4>
  8003e4:	00271713          	slli	a4,a4,0x2
  8003e8:	01470733          	add	a4,a4,s4
  8003ec:	00072783          	lw	a5,0(a4)
  8003f0:	014787b3          	add	a5,a5,s4
  8003f4:	00078067          	jr	a5
  8003f8:	04c12083          	lw	ra,76(sp)
  8003fc:	04812403          	lw	s0,72(sp)
  800400:	04412483          	lw	s1,68(sp)
  800404:	04012903          	lw	s2,64(sp)
  800408:	03c12983          	lw	s3,60(sp)
  80040c:	03812a03          	lw	s4,56(sp)
  800410:	03412a83          	lw	s5,52(sp)
  800414:	03012b03          	lw	s6,48(sp)
  800418:	02c12b83          	lw	s7,44(sp)
  80041c:	02812c03          	lw	s8,40(sp)
  800420:	02412c83          	lw	s9,36(sp)
  800424:	02012d03          	lw	s10,32(sp)
  800428:	01c12d83          	lw	s11,28(sp)
  80042c:	05010113          	addi	sp,sp,80
  800430:	00008067          	ret
  800434:	00100793          	li	a5,1
  800438:	34b7c063          	blt	a5,a1,800778 <vprintfmt+0x454>
  80043c:	000aa603          	lw	a2,0(s5)
  800440:	00000693          	li	a3,0
  800444:	004a8a93          	addi	s5,s5,4
  800448:	01000713          	li	a4,16
  80044c:	000d8793          	mv	a5,s11
  800450:	00090593          	mv	a1,s2
  800454:	00098513          	mv	a0,s3
  800458:	e25ff0ef          	jal	ra,80027c <printnum>
  80045c:	f25ff06f          	j	800380 <vprintfmt+0x5c>
  800460:	00144e03          	lbu	t3,1(s0)
  800464:	00030493          	mv	s1,t1
  800468:	000c8413          	mv	s0,s9
  80046c:	f69ff06f          	j	8003d4 <vprintfmt+0xb0>
  800470:	000aa503          	lw	a0,0(s5)
  800474:	00090593          	mv	a1,s2
  800478:	004a8a93          	addi	s5,s5,4
  80047c:	000980e7          	jalr	s3
  800480:	f01ff06f          	j	800380 <vprintfmt+0x5c>
  800484:	00100793          	li	a5,1
  800488:	30b7c663          	blt	a5,a1,800794 <vprintfmt+0x470>
  80048c:	000aa603          	lw	a2,0(s5)
  800490:	004a8a93          	addi	s5,s5,4
  800494:	41f65693          	srai	a3,a2,0x1f
  800498:	00a00713          	li	a4,10
  80049c:	fa06d8e3          	bgez	a3,80044c <vprintfmt+0x128>
  8004a0:	00090593          	mv	a1,s2
  8004a4:	02d00513          	li	a0,45
  8004a8:	00d12623          	sw	a3,12(sp)
  8004ac:	00c12423          	sw	a2,8(sp)
  8004b0:	00e12223          	sw	a4,4(sp)
  8004b4:	01012023          	sw	a6,0(sp)
  8004b8:	000980e7          	jalr	s3
  8004bc:	00812603          	lw	a2,8(sp)
  8004c0:	00c12683          	lw	a3,12(sp)
  8004c4:	00012803          	lw	a6,0(sp)
  8004c8:	40c00633          	neg	a2,a2
  8004cc:	00c037b3          	snez	a5,a2
  8004d0:	40d006b3          	neg	a3,a3
  8004d4:	40f686b3          	sub	a3,a3,a5
  8004d8:	00412703          	lw	a4,4(sp)
  8004dc:	f71ff06f          	j	80044c <vprintfmt+0x128>
  8004e0:	000aa783          	lw	a5,0(s5)
  8004e4:	01800693          	li	a3,24
  8004e8:	004a8a93          	addi	s5,s5,4
  8004ec:	41f7d713          	srai	a4,a5,0x1f
  8004f0:	00f747b3          	xor	a5,a4,a5
  8004f4:	40e787b3          	sub	a5,a5,a4
  8004f8:	2af6ca63          	blt	a3,a5,8007ac <vprintfmt+0x488>
  8004fc:	00279693          	slli	a3,a5,0x2
  800500:	00000717          	auipc	a4,0x0
  800504:	66070713          	addi	a4,a4,1632 # 800b60 <error_string>
  800508:	00d70733          	add	a4,a4,a3
  80050c:	00072683          	lw	a3,0(a4)
  800510:	28068e63          	beqz	a3,8007ac <vprintfmt+0x488>
  800514:	00000617          	auipc	a2,0x0
  800518:	77c60613          	addi	a2,a2,1916 # 800c90 <error_string+0x130>
  80051c:	00090593          	mv	a1,s2
  800520:	00098513          	mv	a0,s3
  800524:	314000ef          	jal	ra,800838 <printfmt>
  800528:	e59ff06f          	j	800380 <vprintfmt+0x5c>
  80052c:	00144e03          	lbu	t3,1(s0)
  800530:	00158593          	addi	a1,a1,1
  800534:	000c8413          	mv	s0,s9
  800538:	e9dff06f          	j	8003d4 <vprintfmt+0xb0>
  80053c:	00100793          	li	a5,1
  800540:	20b7c063          	blt	a5,a1,800740 <vprintfmt+0x41c>
  800544:	000aa603          	lw	a2,0(s5)
  800548:	00000693          	li	a3,0
  80054c:	004a8a93          	addi	s5,s5,4
  800550:	00800713          	li	a4,8
  800554:	ef9ff06f          	j	80044c <vprintfmt+0x128>
  800558:	03000513          	li	a0,48
  80055c:	00090593          	mv	a1,s2
  800560:	01012023          	sw	a6,0(sp)
  800564:	000980e7          	jalr	s3
  800568:	00090593          	mv	a1,s2
  80056c:	07800513          	li	a0,120
  800570:	000980e7          	jalr	s3
  800574:	000aa603          	lw	a2,0(s5)
  800578:	00000693          	li	a3,0
  80057c:	01000713          	li	a4,16
  800580:	004a8a93          	addi	s5,s5,4
  800584:	00012803          	lw	a6,0(sp)
  800588:	ec5ff06f          	j	80044c <vprintfmt+0x128>
  80058c:	000aa403          	lw	s0,0(s5)
  800590:	004a8793          	addi	a5,s5,4
  800594:	00f12223          	sw	a5,4(sp)
  800598:	24040863          	beqz	s0,8007e8 <vprintfmt+0x4c4>
  80059c:	05b05263          	blez	s11,8005e0 <vprintfmt+0x2bc>
  8005a0:	02d00793          	li	a5,45
  8005a4:	22f80263          	beq	a6,a5,8007c8 <vprintfmt+0x4a4>
  8005a8:	000d0593          	mv	a1,s10
  8005ac:	00040513          	mv	a0,s0
  8005b0:	01012023          	sw	a6,0(sp)
  8005b4:	c89ff0ef          	jal	ra,80023c <strnlen>
  8005b8:	40ad8db3          	sub	s11,s11,a0
  8005bc:	03b05263          	blez	s11,8005e0 <vprintfmt+0x2bc>
  8005c0:	00012803          	lw	a6,0(sp)
  8005c4:	00080513          	mv	a0,a6
  8005c8:	00090593          	mv	a1,s2
  8005cc:	01012023          	sw	a6,0(sp)
  8005d0:	fffd8d93          	addi	s11,s11,-1
  8005d4:	000980e7          	jalr	s3
  8005d8:	00012803          	lw	a6,0(sp)
  8005dc:	fe0d94e3          	bnez	s11,8005c4 <vprintfmt+0x2a0>
  8005e0:	00044783          	lbu	a5,0(s0)
  8005e4:	00140a93          	addi	s5,s0,1
  8005e8:	00078513          	mv	a0,a5
  8005ec:	04078c63          	beqz	a5,800644 <vprintfmt+0x320>
  8005f0:	03f00413          	li	s0,63
  8005f4:	000d4663          	bltz	s10,800600 <vprintfmt+0x2dc>
  8005f8:	fffd0d13          	addi	s10,s10,-1
  8005fc:	036d0663          	beq	s10,s6,800628 <vprintfmt+0x304>
  800600:	00090593          	mv	a1,s2
  800604:	00048663          	beqz	s1,800610 <vprintfmt+0x2ec>
  800608:	fe078793          	addi	a5,a5,-32
  80060c:	12fbe463          	bltu	s7,a5,800734 <vprintfmt+0x410>
  800610:	000980e7          	jalr	s3
  800614:	001a8a93          	addi	s5,s5,1
  800618:	fffac783          	lbu	a5,-1(s5)
  80061c:	fffd8d93          	addi	s11,s11,-1
  800620:	00078513          	mv	a0,a5
  800624:	fc0798e3          	bnez	a5,8005f4 <vprintfmt+0x2d0>
  800628:	01b05e63          	blez	s11,800644 <vprintfmt+0x320>
  80062c:	02000413          	li	s0,32
  800630:	fffd8d93          	addi	s11,s11,-1
  800634:	00090593          	mv	a1,s2
  800638:	00040513          	mv	a0,s0
  80063c:	000980e7          	jalr	s3
  800640:	fe0d98e3          	bnez	s11,800630 <vprintfmt+0x30c>
  800644:	00412a83          	lw	s5,4(sp)
  800648:	d39ff06f          	j	800380 <vprintfmt+0x5c>
  80064c:	00100793          	li	a5,1
  800650:	10b7c663          	blt	a5,a1,80075c <vprintfmt+0x438>
  800654:	000aa603          	lw	a2,0(s5)
  800658:	00000693          	li	a3,0
  80065c:	004a8a93          	addi	s5,s5,4
  800660:	00a00713          	li	a4,10
  800664:	de9ff06f          	j	80044c <vprintfmt+0x128>
  800668:	00144e03          	lbu	t3,1(s0)
  80066c:	00050813          	mv	a6,a0
  800670:	000c8413          	mv	s0,s9
  800674:	d61ff06f          	j	8003d4 <vprintfmt+0xb0>
  800678:	00090593          	mv	a1,s2
  80067c:	02500513          	li	a0,37
  800680:	000980e7          	jalr	s3
  800684:	cfdff06f          	j	800380 <vprintfmt+0x5c>
  800688:	000aad03          	lw	s10,0(s5)
  80068c:	00144e03          	lbu	t3,1(s0)
  800690:	004a8a93          	addi	s5,s5,4
  800694:	000c8413          	mv	s0,s9
  800698:	d20ddee3          	bgez	s11,8003d4 <vprintfmt+0xb0>
  80069c:	000d0d93          	mv	s11,s10
  8006a0:	fff00d13          	li	s10,-1
  8006a4:	d31ff06f          	j	8003d4 <vprintfmt+0xb0>
  8006a8:	00144e03          	lbu	t3,1(s0)
  8006ac:	00088813          	mv	a6,a7
  8006b0:	000c8413          	mv	s0,s9
  8006b4:	d21ff06f          	j	8003d4 <vprintfmt+0xb0>
  8006b8:	00144703          	lbu	a4,1(s0)
  8006bc:	fd0e0d13          	addi	s10,t3,-48
  8006c0:	fd070793          	addi	a5,a4,-48
  8006c4:	14f66863          	bltu	a2,a5,800814 <vprintfmt+0x4f0>
  8006c8:	000c8413          	mv	s0,s9
  8006cc:	002d1793          	slli	a5,s10,0x2
  8006d0:	01a78d33          	add	s10,a5,s10
  8006d4:	00140413          	addi	s0,s0,1
  8006d8:	001d1d13          	slli	s10,s10,0x1
  8006dc:	00ed0d33          	add	s10,s10,a4
  8006e0:	00044703          	lbu	a4,0(s0)
  8006e4:	fd0d0d13          	addi	s10,s10,-48
  8006e8:	fd070793          	addi	a5,a4,-48
  8006ec:	fef670e3          	bleu	a5,a2,8006cc <vprintfmt+0x3a8>
  8006f0:	00070e13          	mv	t3,a4
  8006f4:	fa5ff06f          	j	800698 <vprintfmt+0x374>
  8006f8:	0e0dc463          	bltz	s11,8007e0 <vprintfmt+0x4bc>
  8006fc:	00144e03          	lbu	t3,1(s0)
  800700:	000c8413          	mv	s0,s9
  800704:	cd1ff06f          	j	8003d4 <vprintfmt+0xb0>
  800708:	00090593          	mv	a1,s2
  80070c:	02500513          	li	a0,37
  800710:	000980e7          	jalr	s3
  800714:	fff44783          	lbu	a5,-1(s0)
  800718:	02500713          	li	a4,37
  80071c:	00040c93          	mv	s9,s0
  800720:	c6e780e3          	beq	a5,a4,800380 <vprintfmt+0x5c>
  800724:	fffc8c93          	addi	s9,s9,-1
  800728:	fffcc783          	lbu	a5,-1(s9)
  80072c:	fee79ce3          	bne	a5,a4,800724 <vprintfmt+0x400>
  800730:	c51ff06f          	j	800380 <vprintfmt+0x5c>
  800734:	00040513          	mv	a0,s0
  800738:	000980e7          	jalr	s3
  80073c:	ed9ff06f          	j	800614 <vprintfmt+0x2f0>
  800740:	007a8793          	addi	a5,s5,7
  800744:	ff87f793          	andi	a5,a5,-8
  800748:	00878a93          	addi	s5,a5,8
  80074c:	0007a603          	lw	a2,0(a5)
  800750:	0047a683          	lw	a3,4(a5)
  800754:	00800713          	li	a4,8
  800758:	cf5ff06f          	j	80044c <vprintfmt+0x128>
  80075c:	007a8793          	addi	a5,s5,7
  800760:	ff87f793          	andi	a5,a5,-8
  800764:	00878a93          	addi	s5,a5,8
  800768:	0007a603          	lw	a2,0(a5)
  80076c:	0047a683          	lw	a3,4(a5)
  800770:	00a00713          	li	a4,10
  800774:	cd9ff06f          	j	80044c <vprintfmt+0x128>
  800778:	007a8793          	addi	a5,s5,7
  80077c:	ff87f793          	andi	a5,a5,-8
  800780:	00878a93          	addi	s5,a5,8
  800784:	0007a603          	lw	a2,0(a5)
  800788:	0047a683          	lw	a3,4(a5)
  80078c:	01000713          	li	a4,16
  800790:	cbdff06f          	j	80044c <vprintfmt+0x128>
  800794:	007a8793          	addi	a5,s5,7
  800798:	ff87f793          	andi	a5,a5,-8
  80079c:	00878a93          	addi	s5,a5,8
  8007a0:	0007a603          	lw	a2,0(a5)
  8007a4:	0047a683          	lw	a3,4(a5)
  8007a8:	cf1ff06f          	j	800498 <vprintfmt+0x174>
  8007ac:	00078693          	mv	a3,a5
  8007b0:	00000617          	auipc	a2,0x0
  8007b4:	4d460613          	addi	a2,a2,1236 # 800c84 <error_string+0x124>
  8007b8:	00090593          	mv	a1,s2
  8007bc:	00098513          	mv	a0,s3
  8007c0:	078000ef          	jal	ra,800838 <printfmt>
  8007c4:	bbdff06f          	j	800380 <vprintfmt+0x5c>
  8007c8:	00044783          	lbu	a5,0(s0)
  8007cc:	00140a93          	addi	s5,s0,1
  8007d0:	00078513          	mv	a0,a5
  8007d4:	e4078ce3          	beqz	a5,80062c <vprintfmt+0x308>
  8007d8:	03f00413          	li	s0,63
  8007dc:	e19ff06f          	j	8005f4 <vprintfmt+0x2d0>
  8007e0:	00000d93          	li	s11,0
  8007e4:	f19ff06f          	j	8006fc <vprintfmt+0x3d8>
  8007e8:	03b05c63          	blez	s11,800820 <vprintfmt+0x4fc>
  8007ec:	02d00793          	li	a5,45
  8007f0:	00000417          	auipc	s0,0x0
  8007f4:	48c40413          	addi	s0,s0,1164 # 800c7c <error_string+0x11c>
  8007f8:	daf818e3          	bne	a6,a5,8005a8 <vprintfmt+0x284>
  8007fc:	00000a97          	auipc	s5,0x0
  800800:	481a8a93          	addi	s5,s5,1153 # 800c7d <error_string+0x11d>
  800804:	000c0513          	mv	a0,s8
  800808:	000c0793          	mv	a5,s8
  80080c:	03f00413          	li	s0,63
  800810:	de5ff06f          	j	8005f4 <vprintfmt+0x2d0>
  800814:	00070e13          	mv	t3,a4
  800818:	000c8413          	mv	s0,s9
  80081c:	e7dff06f          	j	800698 <vprintfmt+0x374>
  800820:	000c0793          	mv	a5,s8
  800824:	000c0513          	mv	a0,s8
  800828:	00000a97          	auipc	s5,0x0
  80082c:	455a8a93          	addi	s5,s5,1109 # 800c7d <error_string+0x11d>
  800830:	03f00413          	li	s0,63
  800834:	dc1ff06f          	j	8005f4 <vprintfmt+0x2d0>

00800838 <printfmt>:
  800838:	fc010113          	addi	sp,sp,-64
  80083c:	02c10313          	addi	t1,sp,44
  800840:	02d12623          	sw	a3,44(sp)
  800844:	00030693          	mv	a3,t1
  800848:	00112e23          	sw	ra,28(sp)
  80084c:	02e12823          	sw	a4,48(sp)
  800850:	02f12a23          	sw	a5,52(sp)
  800854:	03012c23          	sw	a6,56(sp)
  800858:	03112e23          	sw	a7,60(sp)
  80085c:	00612623          	sw	t1,12(sp)
  800860:	ac5ff0ef          	jal	ra,800324 <vprintfmt>
  800864:	01c12083          	lw	ra,28(sp)
  800868:	04010113          	addi	sp,sp,64
  80086c:	00008067          	ret

00800870 <do_yield>:
  800870:	ff010113          	addi	sp,sp,-16
  800874:	00112623          	sw	ra,12(sp)
  800878:	8e5ff0ef          	jal	ra,80015c <yield>
  80087c:	8e1ff0ef          	jal	ra,80015c <yield>
  800880:	8ddff0ef          	jal	ra,80015c <yield>
  800884:	8d9ff0ef          	jal	ra,80015c <yield>
  800888:	8d5ff0ef          	jal	ra,80015c <yield>
  80088c:	00c12083          	lw	ra,12(sp)
  800890:	01010113          	addi	sp,sp,16
  800894:	8c9ff06f          	j	80015c <yield>

00800898 <loop>:
  800898:	ff010113          	addi	sp,sp,-16
  80089c:	00000517          	auipc	a0,0x0
  8008a0:	3f850513          	addi	a0,a0,1016 # 800c94 <error_string+0x134>
  8008a4:	00112623          	sw	ra,12(sp)
  8008a8:	92dff0ef          	jal	ra,8001d4 <cprintf>
  8008ac:	0000006f          	j	8008ac <loop+0x14>

008008b0 <work>:
  8008b0:	ff010113          	addi	sp,sp,-16
  8008b4:	00000517          	auipc	a0,0x0
  8008b8:	45050513          	addi	a0,a0,1104 # 800d04 <error_string+0x1a4>
  8008bc:	00112623          	sw	ra,12(sp)
  8008c0:	915ff0ef          	jal	ra,8001d4 <cprintf>
  8008c4:	fadff0ef          	jal	ra,800870 <do_yield>
  8008c8:	00000517          	auipc	a0,0x0
  8008cc:	73852503          	lw	a0,1848(a0) # 801000 <parent>
  8008d0:	891ff0ef          	jal	ra,800160 <kill>
  8008d4:	02051263          	bnez	a0,8008f8 <work+0x48>
  8008d8:	00000517          	auipc	a0,0x0
  8008dc:	43850513          	addi	a0,a0,1080 # 800d10 <error_string+0x1b0>
  8008e0:	8f5ff0ef          	jal	ra,8001d4 <cprintf>
  8008e4:	f8dff0ef          	jal	ra,800870 <do_yield>
  8008e8:	00000517          	auipc	a0,0x0
  8008ec:	72052503          	lw	a0,1824(a0) # 801008 <pid1>
  8008f0:	871ff0ef          	jal	ra,800160 <kill>
  8008f4:	00050663          	beqz	a0,800900 <work+0x50>
  8008f8:	fff00513          	li	a0,-1
  8008fc:	83dff0ef          	jal	ra,800138 <exit>
  800900:	00000517          	auipc	a0,0x0
  800904:	42450513          	addi	a0,a0,1060 # 800d24 <error_string+0x1c4>
  800908:	8cdff0ef          	jal	ra,8001d4 <cprintf>
  80090c:	00000513          	li	a0,0
  800910:	829ff0ef          	jal	ra,800138 <exit>

00800914 <main>:
  800914:	ff010113          	addi	sp,sp,-16
  800918:	00112623          	sw	ra,12(sp)
  80091c:	849ff0ef          	jal	ra,800164 <getpid>
  800920:	00000297          	auipc	t0,0x0
  800924:	6ea2a023          	sw	a0,1760(t0) # 801000 <parent>
  800928:	82dff0ef          	jal	ra,800154 <fork>
  80092c:	00000297          	auipc	t0,0x0
  800930:	6ca2ae23          	sw	a0,1756(t0) # 801008 <pid1>
  800934:	04050c63          	beqz	a0,80098c <main+0x78>
  800938:	04a05e63          	blez	a0,800994 <main+0x80>
  80093c:	819ff0ef          	jal	ra,800154 <fork>
  800940:	00000297          	auipc	t0,0x0
  800944:	6ca2a223          	sw	a0,1732(t0) # 801004 <pid2>
  800948:	04050463          	beqz	a0,800990 <main+0x7c>
  80094c:	06a05463          	blez	a0,8009b4 <main+0xa0>
  800950:	00000517          	auipc	a0,0x0
  800954:	38450513          	addi	a0,a0,900 # 800cd4 <error_string+0x174>
  800958:	87dff0ef          	jal	ra,8001d4 <cprintf>
  80095c:	00000593          	li	a1,0
  800960:	00000517          	auipc	a0,0x0
  800964:	6a852503          	lw	a0,1704(a0) # 801008 <pid1>
  800968:	ff0ff0ef          	jal	ra,800158 <waitpid>
  80096c:	00000697          	auipc	a3,0x0
  800970:	69c6a683          	lw	a3,1692(a3) # 801008 <pid1>
  800974:	00000617          	auipc	a2,0x0
  800978:	37060613          	addi	a2,a2,880 # 800ce4 <error_string+0x184>
  80097c:	03400593          	li	a1,52
  800980:	00000517          	auipc	a0,0x0
  800984:	34450513          	addi	a0,a0,836 # 800cc4 <error_string+0x164>
  800988:	e98ff0ef          	jal	ra,800020 <__panic>
  80098c:	f0dff0ef          	jal	ra,800898 <loop>
  800990:	f21ff0ef          	jal	ra,8008b0 <work>
  800994:	00000697          	auipc	a3,0x0
  800998:	30c68693          	addi	a3,a3,780 # 800ca0 <error_string+0x140>
  80099c:	00000617          	auipc	a2,0x0
  8009a0:	31060613          	addi	a2,a2,784 # 800cac <error_string+0x14c>
  8009a4:	02c00593          	li	a1,44
  8009a8:	00000517          	auipc	a0,0x0
  8009ac:	31c50513          	addi	a0,a0,796 # 800cc4 <error_string+0x164>
  8009b0:	e70ff0ef          	jal	ra,800020 <__panic>
  8009b4:	00000517          	auipc	a0,0x0
  8009b8:	65452503          	lw	a0,1620(a0) # 801008 <pid1>
  8009bc:	fa4ff0ef          	jal	ra,800160 <kill>
  8009c0:	00000617          	auipc	a2,0x0
  8009c4:	33860613          	addi	a2,a2,824 # 800cf8 <error_string+0x198>
  8009c8:	03900593          	li	a1,57
  8009cc:	00000517          	auipc	a0,0x0
  8009d0:	2f850513          	addi	a0,a0,760 # 800cc4 <error_string+0x164>
  8009d4:	e4cff0ef          	jal	ra,800020 <__panic>
