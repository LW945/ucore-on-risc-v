
obj/__user_badarg.out:     file format elf32-littleriscv


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
  800040:	93c50513          	addi	a0,a0,-1732 # 800978 <main+0x124>
  800044:	00112e23          	sw	ra,28(sp)
  800048:	02d12623          	sw	a3,44(sp)
  80004c:	02e12823          	sw	a4,48(sp)
  800050:	03012c23          	sw	a6,56(sp)
  800054:	03112e23          	sw	a7,60(sp)
  800058:	00f12623          	sw	a5,12(sp)
  80005c:	15c000ef          	jal	ra,8001b8 <cprintf>
  800060:	00c12583          	lw	a1,12(sp)
  800064:	00040513          	mv	a0,s0
  800068:	11c000ef          	jal	ra,800184 <vcprintf>
  80006c:	00001517          	auipc	a0,0x1
  800070:	bd050513          	addi	a0,a0,-1072 # 800c3c <error_string+0x13c>
  800074:	144000ef          	jal	ra,8001b8 <cprintf>
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
  800134:	86450513          	addi	a0,a0,-1948 # 800994 <main+0x140>
  800138:	080000ef          	jal	ra,8001b8 <cprintf>
  80013c:	0000006f          	j	80013c <exit+0x18>

00800140 <fork>:
  800140:	fb9ff06f          	j	8000f8 <sys_fork>

00800144 <waitpid>:
  800144:	fbdff06f          	j	800100 <sys_wait>

00800148 <yield>:
  800148:	fc9ff06f          	j	800110 <sys_yield>

0080014c <_start>:
  80014c:	0c4000ef          	jal	ra,800210 <umain>
  800150:	0000006f          	j	800150 <_start+0x4>

00800154 <cputch>:
  800154:	ff010113          	addi	sp,sp,-16
  800158:	00112623          	sw	ra,12(sp)
  80015c:	00812423          	sw	s0,8(sp)
  800160:	00058413          	mv	s0,a1
  800164:	fb5ff0ef          	jal	ra,800118 <sys_putc>
  800168:	00042783          	lw	a5,0(s0)
  80016c:	00c12083          	lw	ra,12(sp)
  800170:	00178793          	addi	a5,a5,1
  800174:	00f42023          	sw	a5,0(s0)
  800178:	00812403          	lw	s0,8(sp)
  80017c:	01010113          	addi	sp,sp,16
  800180:	00008067          	ret

00800184 <vcprintf>:
  800184:	fe010113          	addi	sp,sp,-32
  800188:	00058693          	mv	a3,a1
  80018c:	00050613          	mv	a2,a0
  800190:	00c10593          	addi	a1,sp,12
  800194:	00000517          	auipc	a0,0x0
  800198:	fc050513          	addi	a0,a0,-64 # 800154 <cputch>
  80019c:	00112e23          	sw	ra,28(sp)
  8001a0:	00012623          	sw	zero,12(sp)
  8001a4:	164000ef          	jal	ra,800308 <vprintfmt>
  8001a8:	01c12083          	lw	ra,28(sp)
  8001ac:	00c12503          	lw	a0,12(sp)
  8001b0:	02010113          	addi	sp,sp,32
  8001b4:	00008067          	ret

008001b8 <cprintf>:
  8001b8:	fc010113          	addi	sp,sp,-64
  8001bc:	02410313          	addi	t1,sp,36
  8001c0:	02b12223          	sw	a1,36(sp)
  8001c4:	02c12423          	sw	a2,40(sp)
  8001c8:	02d12623          	sw	a3,44(sp)
  8001cc:	00050613          	mv	a2,a0
  8001d0:	00c10593          	addi	a1,sp,12
  8001d4:	00000517          	auipc	a0,0x0
  8001d8:	f8050513          	addi	a0,a0,-128 # 800154 <cputch>
  8001dc:	00030693          	mv	a3,t1
  8001e0:	00112e23          	sw	ra,28(sp)
  8001e4:	02e12823          	sw	a4,48(sp)
  8001e8:	02f12a23          	sw	a5,52(sp)
  8001ec:	03012c23          	sw	a6,56(sp)
  8001f0:	03112e23          	sw	a7,60(sp)
  8001f4:	00612423          	sw	t1,8(sp)
  8001f8:	00012623          	sw	zero,12(sp)
  8001fc:	10c000ef          	jal	ra,800308 <vprintfmt>
  800200:	01c12083          	lw	ra,28(sp)
  800204:	00c12503          	lw	a0,12(sp)
  800208:	04010113          	addi	sp,sp,64
  80020c:	00008067          	ret

00800210 <umain>:
  800210:	ff010113          	addi	sp,sp,-16
  800214:	00112623          	sw	ra,12(sp)
  800218:	63c000ef          	jal	ra,800854 <main>
  80021c:	f09ff0ef          	jal	ra,800124 <exit>

00800220 <strnlen>:
  800220:	00050693          	mv	a3,a0
  800224:	02058a63          	beqz	a1,800258 <strnlen+0x38>
  800228:	00054703          	lbu	a4,0(a0)
  80022c:	00150793          	addi	a5,a0,1
  800230:	02070463          	beqz	a4,800258 <strnlen+0x38>
  800234:	00b505b3          	add	a1,a0,a1
  800238:	0100006f          	j	800248 <strnlen+0x28>
  80023c:	00178793          	addi	a5,a5,1
  800240:	fff7c703          	lbu	a4,-1(a5)
  800244:	00070863          	beqz	a4,800254 <strnlen+0x34>
  800248:	40d78533          	sub	a0,a5,a3
  80024c:	feb798e3          	bne	a5,a1,80023c <strnlen+0x1c>
  800250:	00008067          	ret
  800254:	00008067          	ret
  800258:	00000513          	li	a0,0
  80025c:	00008067          	ret

00800260 <printnum>:
  800260:	fe010113          	addi	sp,sp,-32
  800264:	00912a23          	sw	s1,20(sp)
  800268:	01212823          	sw	s2,16(sp)
  80026c:	01312623          	sw	s3,12(sp)
  800270:	01412423          	sw	s4,8(sp)
  800274:	00112e23          	sw	ra,28(sp)
  800278:	00812c23          	sw	s0,24(sp)
  80027c:	00050493          	mv	s1,a0
  800280:	00058913          	mv	s2,a1
  800284:	00080993          	mv	s3,a6
  800288:	02e67a33          	remu	s4,a2,a4
  80028c:	04069e63          	bnez	a3,8002e8 <printnum+0x88>
  800290:	04e67c63          	bleu	a4,a2,8002e8 <printnum+0x88>
  800294:	fff78413          	addi	s0,a5,-1
  800298:	00805c63          	blez	s0,8002b0 <printnum+0x50>
  80029c:	fff40413          	addi	s0,s0,-1
  8002a0:	00090593          	mv	a1,s2
  8002a4:	00098513          	mv	a0,s3
  8002a8:	000480e7          	jalr	s1
  8002ac:	fe0418e3          	bnez	s0,80029c <printnum+0x3c>
  8002b0:	00001797          	auipc	a5,0x1
  8002b4:	8b478793          	addi	a5,a5,-1868 # 800b64 <error_string+0x64>
  8002b8:	014787b3          	add	a5,a5,s4
  8002bc:	00090593          	mv	a1,s2
  8002c0:	00048313          	mv	t1,s1
  8002c4:	01c12083          	lw	ra,28(sp)
  8002c8:	01812403          	lw	s0,24(sp)
  8002cc:	01412483          	lw	s1,20(sp)
  8002d0:	01012903          	lw	s2,16(sp)
  8002d4:	00c12983          	lw	s3,12(sp)
  8002d8:	00812a03          	lw	s4,8(sp)
  8002dc:	0007c503          	lbu	a0,0(a5)
  8002e0:	02010113          	addi	sp,sp,32
  8002e4:	00030067          	jr	t1
  8002e8:	02e65633          	divu	a2,a2,a4
  8002ec:	00098813          	mv	a6,s3
  8002f0:	fff78793          	addi	a5,a5,-1
  8002f4:	00000693          	li	a3,0
  8002f8:	00090593          	mv	a1,s2
  8002fc:	00048513          	mv	a0,s1
  800300:	f61ff0ef          	jal	ra,800260 <printnum>
  800304:	fadff06f          	j	8002b0 <printnum+0x50>

00800308 <vprintfmt>:
  800308:	fb010113          	addi	sp,sp,-80
  80030c:	05212023          	sw	s2,64(sp)
  800310:	03312e23          	sw	s3,60(sp)
  800314:	03412c23          	sw	s4,56(sp)
  800318:	03512a23          	sw	s5,52(sp)
  80031c:	03612823          	sw	s6,48(sp)
  800320:	03712623          	sw	s7,44(sp)
  800324:	03812423          	sw	s8,40(sp)
  800328:	03912223          	sw	s9,36(sp)
  80032c:	04112623          	sw	ra,76(sp)
  800330:	04812423          	sw	s0,72(sp)
  800334:	04912223          	sw	s1,68(sp)
  800338:	03a12023          	sw	s10,32(sp)
  80033c:	01b12e23          	sw	s11,28(sp)
  800340:	00050993          	mv	s3,a0
  800344:	00058913          	mv	s2,a1
  800348:	00060c93          	mv	s9,a2
  80034c:	00068a93          	mv	s5,a3
  800350:	00000a17          	auipc	s4,0x0
  800354:	658a0a13          	addi	s4,s4,1624 # 8009a8 <main+0x154>
  800358:	02800c13          	li	s8,40
  80035c:	fff00b13          	li	s6,-1
  800360:	05e00b93          	li	s7,94
  800364:	000cc503          	lbu	a0,0(s9)
  800368:	02500493          	li	s1,37
  80036c:	001c8413          	addi	s0,s9,1
  800370:	00950e63          	beq	a0,s1,80038c <vprintfmt+0x84>
  800374:	06050463          	beqz	a0,8003dc <vprintfmt+0xd4>
  800378:	00090593          	mv	a1,s2
  80037c:	00140413          	addi	s0,s0,1
  800380:	000980e7          	jalr	s3
  800384:	fff44503          	lbu	a0,-1(s0)
  800388:	fe9516e3          	bne	a0,s1,800374 <vprintfmt+0x6c>
  80038c:	00044e03          	lbu	t3,0(s0)
  800390:	fff00d13          	li	s10,-1
  800394:	02000813          	li	a6,32
  800398:	00000493          	li	s1,0
  80039c:	00000593          	li	a1,0
  8003a0:	000d0d93          	mv	s11,s10
  8003a4:	05500693          	li	a3,85
  8003a8:	00100313          	li	t1,1
  8003ac:	03000893          	li	a7,48
  8003b0:	00900613          	li	a2,9
  8003b4:	02d00513          	li	a0,45
  8003b8:	fdde0713          	addi	a4,t3,-35
  8003bc:	0ff77713          	andi	a4,a4,255
  8003c0:	00140c93          	addi	s9,s0,1
  8003c4:	32e6e463          	bltu	a3,a4,8006ec <vprintfmt+0x3e4>
  8003c8:	00271713          	slli	a4,a4,0x2
  8003cc:	01470733          	add	a4,a4,s4
  8003d0:	00072783          	lw	a5,0(a4)
  8003d4:	014787b3          	add	a5,a5,s4
  8003d8:	00078067          	jr	a5
  8003dc:	04c12083          	lw	ra,76(sp)
  8003e0:	04812403          	lw	s0,72(sp)
  8003e4:	04412483          	lw	s1,68(sp)
  8003e8:	04012903          	lw	s2,64(sp)
  8003ec:	03c12983          	lw	s3,60(sp)
  8003f0:	03812a03          	lw	s4,56(sp)
  8003f4:	03412a83          	lw	s5,52(sp)
  8003f8:	03012b03          	lw	s6,48(sp)
  8003fc:	02c12b83          	lw	s7,44(sp)
  800400:	02812c03          	lw	s8,40(sp)
  800404:	02412c83          	lw	s9,36(sp)
  800408:	02012d03          	lw	s10,32(sp)
  80040c:	01c12d83          	lw	s11,28(sp)
  800410:	05010113          	addi	sp,sp,80
  800414:	00008067          	ret
  800418:	00100793          	li	a5,1
  80041c:	34b7c063          	blt	a5,a1,80075c <vprintfmt+0x454>
  800420:	000aa603          	lw	a2,0(s5)
  800424:	00000693          	li	a3,0
  800428:	004a8a93          	addi	s5,s5,4
  80042c:	01000713          	li	a4,16
  800430:	000d8793          	mv	a5,s11
  800434:	00090593          	mv	a1,s2
  800438:	00098513          	mv	a0,s3
  80043c:	e25ff0ef          	jal	ra,800260 <printnum>
  800440:	f25ff06f          	j	800364 <vprintfmt+0x5c>
  800444:	00144e03          	lbu	t3,1(s0)
  800448:	00030493          	mv	s1,t1
  80044c:	000c8413          	mv	s0,s9
  800450:	f69ff06f          	j	8003b8 <vprintfmt+0xb0>
  800454:	000aa503          	lw	a0,0(s5)
  800458:	00090593          	mv	a1,s2
  80045c:	004a8a93          	addi	s5,s5,4
  800460:	000980e7          	jalr	s3
  800464:	f01ff06f          	j	800364 <vprintfmt+0x5c>
  800468:	00100793          	li	a5,1
  80046c:	30b7c663          	blt	a5,a1,800778 <vprintfmt+0x470>
  800470:	000aa603          	lw	a2,0(s5)
  800474:	004a8a93          	addi	s5,s5,4
  800478:	41f65693          	srai	a3,a2,0x1f
  80047c:	00a00713          	li	a4,10
  800480:	fa06d8e3          	bgez	a3,800430 <vprintfmt+0x128>
  800484:	00090593          	mv	a1,s2
  800488:	02d00513          	li	a0,45
  80048c:	00d12623          	sw	a3,12(sp)
  800490:	00c12423          	sw	a2,8(sp)
  800494:	00e12223          	sw	a4,4(sp)
  800498:	01012023          	sw	a6,0(sp)
  80049c:	000980e7          	jalr	s3
  8004a0:	00812603          	lw	a2,8(sp)
  8004a4:	00c12683          	lw	a3,12(sp)
  8004a8:	00012803          	lw	a6,0(sp)
  8004ac:	40c00633          	neg	a2,a2
  8004b0:	00c037b3          	snez	a5,a2
  8004b4:	40d006b3          	neg	a3,a3
  8004b8:	40f686b3          	sub	a3,a3,a5
  8004bc:	00412703          	lw	a4,4(sp)
  8004c0:	f71ff06f          	j	800430 <vprintfmt+0x128>
  8004c4:	000aa783          	lw	a5,0(s5)
  8004c8:	01800693          	li	a3,24
  8004cc:	004a8a93          	addi	s5,s5,4
  8004d0:	41f7d713          	srai	a4,a5,0x1f
  8004d4:	00f747b3          	xor	a5,a4,a5
  8004d8:	40e787b3          	sub	a5,a5,a4
  8004dc:	2af6ca63          	blt	a3,a5,800790 <vprintfmt+0x488>
  8004e0:	00279693          	slli	a3,a5,0x2
  8004e4:	00000717          	auipc	a4,0x0
  8004e8:	61c70713          	addi	a4,a4,1564 # 800b00 <error_string>
  8004ec:	00d70733          	add	a4,a4,a3
  8004f0:	00072683          	lw	a3,0(a4)
  8004f4:	28068e63          	beqz	a3,800790 <vprintfmt+0x488>
  8004f8:	00000617          	auipc	a2,0x0
  8004fc:	73860613          	addi	a2,a2,1848 # 800c30 <error_string+0x130>
  800500:	00090593          	mv	a1,s2
  800504:	00098513          	mv	a0,s3
  800508:	314000ef          	jal	ra,80081c <printfmt>
  80050c:	e59ff06f          	j	800364 <vprintfmt+0x5c>
  800510:	00144e03          	lbu	t3,1(s0)
  800514:	00158593          	addi	a1,a1,1
  800518:	000c8413          	mv	s0,s9
  80051c:	e9dff06f          	j	8003b8 <vprintfmt+0xb0>
  800520:	00100793          	li	a5,1
  800524:	20b7c063          	blt	a5,a1,800724 <vprintfmt+0x41c>
  800528:	000aa603          	lw	a2,0(s5)
  80052c:	00000693          	li	a3,0
  800530:	004a8a93          	addi	s5,s5,4
  800534:	00800713          	li	a4,8
  800538:	ef9ff06f          	j	800430 <vprintfmt+0x128>
  80053c:	03000513          	li	a0,48
  800540:	00090593          	mv	a1,s2
  800544:	01012023          	sw	a6,0(sp)
  800548:	000980e7          	jalr	s3
  80054c:	00090593          	mv	a1,s2
  800550:	07800513          	li	a0,120
  800554:	000980e7          	jalr	s3
  800558:	000aa603          	lw	a2,0(s5)
  80055c:	00000693          	li	a3,0
  800560:	01000713          	li	a4,16
  800564:	004a8a93          	addi	s5,s5,4
  800568:	00012803          	lw	a6,0(sp)
  80056c:	ec5ff06f          	j	800430 <vprintfmt+0x128>
  800570:	000aa403          	lw	s0,0(s5)
  800574:	004a8793          	addi	a5,s5,4
  800578:	00f12223          	sw	a5,4(sp)
  80057c:	24040863          	beqz	s0,8007cc <vprintfmt+0x4c4>
  800580:	05b05263          	blez	s11,8005c4 <vprintfmt+0x2bc>
  800584:	02d00793          	li	a5,45
  800588:	22f80263          	beq	a6,a5,8007ac <vprintfmt+0x4a4>
  80058c:	000d0593          	mv	a1,s10
  800590:	00040513          	mv	a0,s0
  800594:	01012023          	sw	a6,0(sp)
  800598:	c89ff0ef          	jal	ra,800220 <strnlen>
  80059c:	40ad8db3          	sub	s11,s11,a0
  8005a0:	03b05263          	blez	s11,8005c4 <vprintfmt+0x2bc>
  8005a4:	00012803          	lw	a6,0(sp)
  8005a8:	00080513          	mv	a0,a6
  8005ac:	00090593          	mv	a1,s2
  8005b0:	01012023          	sw	a6,0(sp)
  8005b4:	fffd8d93          	addi	s11,s11,-1
  8005b8:	000980e7          	jalr	s3
  8005bc:	00012803          	lw	a6,0(sp)
  8005c0:	fe0d94e3          	bnez	s11,8005a8 <vprintfmt+0x2a0>
  8005c4:	00044783          	lbu	a5,0(s0)
  8005c8:	00140a93          	addi	s5,s0,1
  8005cc:	00078513          	mv	a0,a5
  8005d0:	04078c63          	beqz	a5,800628 <vprintfmt+0x320>
  8005d4:	03f00413          	li	s0,63
  8005d8:	000d4663          	bltz	s10,8005e4 <vprintfmt+0x2dc>
  8005dc:	fffd0d13          	addi	s10,s10,-1
  8005e0:	036d0663          	beq	s10,s6,80060c <vprintfmt+0x304>
  8005e4:	00090593          	mv	a1,s2
  8005e8:	00048663          	beqz	s1,8005f4 <vprintfmt+0x2ec>
  8005ec:	fe078793          	addi	a5,a5,-32
  8005f0:	12fbe463          	bltu	s7,a5,800718 <vprintfmt+0x410>
  8005f4:	000980e7          	jalr	s3
  8005f8:	001a8a93          	addi	s5,s5,1
  8005fc:	fffac783          	lbu	a5,-1(s5)
  800600:	fffd8d93          	addi	s11,s11,-1
  800604:	00078513          	mv	a0,a5
  800608:	fc0798e3          	bnez	a5,8005d8 <vprintfmt+0x2d0>
  80060c:	01b05e63          	blez	s11,800628 <vprintfmt+0x320>
  800610:	02000413          	li	s0,32
  800614:	fffd8d93          	addi	s11,s11,-1
  800618:	00090593          	mv	a1,s2
  80061c:	00040513          	mv	a0,s0
  800620:	000980e7          	jalr	s3
  800624:	fe0d98e3          	bnez	s11,800614 <vprintfmt+0x30c>
  800628:	00412a83          	lw	s5,4(sp)
  80062c:	d39ff06f          	j	800364 <vprintfmt+0x5c>
  800630:	00100793          	li	a5,1
  800634:	10b7c663          	blt	a5,a1,800740 <vprintfmt+0x438>
  800638:	000aa603          	lw	a2,0(s5)
  80063c:	00000693          	li	a3,0
  800640:	004a8a93          	addi	s5,s5,4
  800644:	00a00713          	li	a4,10
  800648:	de9ff06f          	j	800430 <vprintfmt+0x128>
  80064c:	00144e03          	lbu	t3,1(s0)
  800650:	00050813          	mv	a6,a0
  800654:	000c8413          	mv	s0,s9
  800658:	d61ff06f          	j	8003b8 <vprintfmt+0xb0>
  80065c:	00090593          	mv	a1,s2
  800660:	02500513          	li	a0,37
  800664:	000980e7          	jalr	s3
  800668:	cfdff06f          	j	800364 <vprintfmt+0x5c>
  80066c:	000aad03          	lw	s10,0(s5)
  800670:	00144e03          	lbu	t3,1(s0)
  800674:	004a8a93          	addi	s5,s5,4
  800678:	000c8413          	mv	s0,s9
  80067c:	d20ddee3          	bgez	s11,8003b8 <vprintfmt+0xb0>
  800680:	000d0d93          	mv	s11,s10
  800684:	fff00d13          	li	s10,-1
  800688:	d31ff06f          	j	8003b8 <vprintfmt+0xb0>
  80068c:	00144e03          	lbu	t3,1(s0)
  800690:	00088813          	mv	a6,a7
  800694:	000c8413          	mv	s0,s9
  800698:	d21ff06f          	j	8003b8 <vprintfmt+0xb0>
  80069c:	00144703          	lbu	a4,1(s0)
  8006a0:	fd0e0d13          	addi	s10,t3,-48
  8006a4:	fd070793          	addi	a5,a4,-48
  8006a8:	14f66863          	bltu	a2,a5,8007f8 <vprintfmt+0x4f0>
  8006ac:	000c8413          	mv	s0,s9
  8006b0:	002d1793          	slli	a5,s10,0x2
  8006b4:	01a78d33          	add	s10,a5,s10
  8006b8:	00140413          	addi	s0,s0,1
  8006bc:	001d1d13          	slli	s10,s10,0x1
  8006c0:	00ed0d33          	add	s10,s10,a4
  8006c4:	00044703          	lbu	a4,0(s0)
  8006c8:	fd0d0d13          	addi	s10,s10,-48
  8006cc:	fd070793          	addi	a5,a4,-48
  8006d0:	fef670e3          	bleu	a5,a2,8006b0 <vprintfmt+0x3a8>
  8006d4:	00070e13          	mv	t3,a4
  8006d8:	fa5ff06f          	j	80067c <vprintfmt+0x374>
  8006dc:	0e0dc463          	bltz	s11,8007c4 <vprintfmt+0x4bc>
  8006e0:	00144e03          	lbu	t3,1(s0)
  8006e4:	000c8413          	mv	s0,s9
  8006e8:	cd1ff06f          	j	8003b8 <vprintfmt+0xb0>
  8006ec:	00090593          	mv	a1,s2
  8006f0:	02500513          	li	a0,37
  8006f4:	000980e7          	jalr	s3
  8006f8:	fff44783          	lbu	a5,-1(s0)
  8006fc:	02500713          	li	a4,37
  800700:	00040c93          	mv	s9,s0
  800704:	c6e780e3          	beq	a5,a4,800364 <vprintfmt+0x5c>
  800708:	fffc8c93          	addi	s9,s9,-1
  80070c:	fffcc783          	lbu	a5,-1(s9)
  800710:	fee79ce3          	bne	a5,a4,800708 <vprintfmt+0x400>
  800714:	c51ff06f          	j	800364 <vprintfmt+0x5c>
  800718:	00040513          	mv	a0,s0
  80071c:	000980e7          	jalr	s3
  800720:	ed9ff06f          	j	8005f8 <vprintfmt+0x2f0>
  800724:	007a8793          	addi	a5,s5,7
  800728:	ff87f793          	andi	a5,a5,-8
  80072c:	00878a93          	addi	s5,a5,8
  800730:	0007a603          	lw	a2,0(a5)
  800734:	0047a683          	lw	a3,4(a5)
  800738:	00800713          	li	a4,8
  80073c:	cf5ff06f          	j	800430 <vprintfmt+0x128>
  800740:	007a8793          	addi	a5,s5,7
  800744:	ff87f793          	andi	a5,a5,-8
  800748:	00878a93          	addi	s5,a5,8
  80074c:	0007a603          	lw	a2,0(a5)
  800750:	0047a683          	lw	a3,4(a5)
  800754:	00a00713          	li	a4,10
  800758:	cd9ff06f          	j	800430 <vprintfmt+0x128>
  80075c:	007a8793          	addi	a5,s5,7
  800760:	ff87f793          	andi	a5,a5,-8
  800764:	00878a93          	addi	s5,a5,8
  800768:	0007a603          	lw	a2,0(a5)
  80076c:	0047a683          	lw	a3,4(a5)
  800770:	01000713          	li	a4,16
  800774:	cbdff06f          	j	800430 <vprintfmt+0x128>
  800778:	007a8793          	addi	a5,s5,7
  80077c:	ff87f793          	andi	a5,a5,-8
  800780:	00878a93          	addi	s5,a5,8
  800784:	0007a603          	lw	a2,0(a5)
  800788:	0047a683          	lw	a3,4(a5)
  80078c:	cf1ff06f          	j	80047c <vprintfmt+0x174>
  800790:	00078693          	mv	a3,a5
  800794:	00000617          	auipc	a2,0x0
  800798:	49060613          	addi	a2,a2,1168 # 800c24 <error_string+0x124>
  80079c:	00090593          	mv	a1,s2
  8007a0:	00098513          	mv	a0,s3
  8007a4:	078000ef          	jal	ra,80081c <printfmt>
  8007a8:	bbdff06f          	j	800364 <vprintfmt+0x5c>
  8007ac:	00044783          	lbu	a5,0(s0)
  8007b0:	00140a93          	addi	s5,s0,1
  8007b4:	00078513          	mv	a0,a5
  8007b8:	e4078ce3          	beqz	a5,800610 <vprintfmt+0x308>
  8007bc:	03f00413          	li	s0,63
  8007c0:	e19ff06f          	j	8005d8 <vprintfmt+0x2d0>
  8007c4:	00000d93          	li	s11,0
  8007c8:	f19ff06f          	j	8006e0 <vprintfmt+0x3d8>
  8007cc:	03b05c63          	blez	s11,800804 <vprintfmt+0x4fc>
  8007d0:	02d00793          	li	a5,45
  8007d4:	00000417          	auipc	s0,0x0
  8007d8:	44840413          	addi	s0,s0,1096 # 800c1c <error_string+0x11c>
  8007dc:	daf818e3          	bne	a6,a5,80058c <vprintfmt+0x284>
  8007e0:	00000a97          	auipc	s5,0x0
  8007e4:	43da8a93          	addi	s5,s5,1085 # 800c1d <error_string+0x11d>
  8007e8:	000c0513          	mv	a0,s8
  8007ec:	000c0793          	mv	a5,s8
  8007f0:	03f00413          	li	s0,63
  8007f4:	de5ff06f          	j	8005d8 <vprintfmt+0x2d0>
  8007f8:	00070e13          	mv	t3,a4
  8007fc:	000c8413          	mv	s0,s9
  800800:	e7dff06f          	j	80067c <vprintfmt+0x374>
  800804:	000c0793          	mv	a5,s8
  800808:	000c0513          	mv	a0,s8
  80080c:	00000a97          	auipc	s5,0x0
  800810:	411a8a93          	addi	s5,s5,1041 # 800c1d <error_string+0x11d>
  800814:	03f00413          	li	s0,63
  800818:	dc1ff06f          	j	8005d8 <vprintfmt+0x2d0>

0080081c <printfmt>:
  80081c:	fc010113          	addi	sp,sp,-64
  800820:	02c10313          	addi	t1,sp,44
  800824:	02d12623          	sw	a3,44(sp)
  800828:	00030693          	mv	a3,t1
  80082c:	00112e23          	sw	ra,28(sp)
  800830:	02e12823          	sw	a4,48(sp)
  800834:	02f12a23          	sw	a5,52(sp)
  800838:	03012c23          	sw	a6,56(sp)
  80083c:	03112e23          	sw	a7,60(sp)
  800840:	00612623          	sw	t1,12(sp)
  800844:	ac5ff0ef          	jal	ra,800308 <vprintfmt>
  800848:	01c12083          	lw	ra,28(sp)
  80084c:	04010113          	addi	sp,sp,64
  800850:	00008067          	ret

00800854 <main>:
  800854:	fe010113          	addi	sp,sp,-32
  800858:	00112e23          	sw	ra,28(sp)
  80085c:	00812c23          	sw	s0,24(sp)
  800860:	8e1ff0ef          	jal	ra,800140 <fork>
  800864:	0e050663          	beqz	a0,800950 <main+0xfc>
  800868:	00050413          	mv	s0,a0
  80086c:	0ca05263          	blez	a0,800930 <main+0xdc>
  800870:	00000593          	li	a1,0
  800874:	fff00513          	li	a0,-1
  800878:	8cdff0ef          	jal	ra,800144 <waitpid>
  80087c:	08050a63          	beqz	a0,800910 <main+0xbc>
  800880:	c00005b7          	lui	a1,0xc0000
  800884:	00040513          	mv	a0,s0
  800888:	8bdff0ef          	jal	ra,800144 <waitpid>
  80088c:	06050263          	beqz	a0,8008f0 <main+0x9c>
  800890:	00c10593          	addi	a1,sp,12
  800894:	00040513          	mv	a0,s0
  800898:	8adff0ef          	jal	ra,800144 <waitpid>
  80089c:	02051a63          	bnez	a0,8008d0 <main+0x7c>
  8008a0:	00c12703          	lw	a4,12(sp)
  8008a4:	0000c7b7          	lui	a5,0xc
  8008a8:	eaf78793          	addi	a5,a5,-337 # beaf <__panic-0x7f4171>
  8008ac:	02f71263          	bne	a4,a5,8008d0 <main+0x7c>
  8008b0:	00000517          	auipc	a0,0x0
  8008b4:	43850513          	addi	a0,a0,1080 # 800ce8 <error_string+0x1e8>
  8008b8:	901ff0ef          	jal	ra,8001b8 <cprintf>
  8008bc:	01c12083          	lw	ra,28(sp)
  8008c0:	00000513          	li	a0,0
  8008c4:	01812403          	lw	s0,24(sp)
  8008c8:	02010113          	addi	sp,sp,32
  8008cc:	00008067          	ret
  8008d0:	00000697          	auipc	a3,0x0
  8008d4:	3e068693          	addi	a3,a3,992 # 800cb0 <error_string+0x1b0>
  8008d8:	00000617          	auipc	a2,0x0
  8008dc:	37060613          	addi	a2,a2,880 # 800c48 <error_string+0x148>
  8008e0:	01200593          	li	a1,18
  8008e4:	00000517          	auipc	a0,0x0
  8008e8:	37c50513          	addi	a0,a0,892 # 800c60 <error_string+0x160>
  8008ec:	f34ff0ef          	jal	ra,800020 <__panic>
  8008f0:	00000697          	auipc	a3,0x0
  8008f4:	39868693          	addi	a3,a3,920 # 800c88 <error_string+0x188>
  8008f8:	00000617          	auipc	a2,0x0
  8008fc:	35060613          	addi	a2,a2,848 # 800c48 <error_string+0x148>
  800900:	01100593          	li	a1,17
  800904:	00000517          	auipc	a0,0x0
  800908:	35c50513          	addi	a0,a0,860 # 800c60 <error_string+0x160>
  80090c:	f14ff0ef          	jal	ra,800020 <__panic>
  800910:	00000697          	auipc	a3,0x0
  800914:	36068693          	addi	a3,a3,864 # 800c70 <error_string+0x170>
  800918:	00000617          	auipc	a2,0x0
  80091c:	33060613          	addi	a2,a2,816 # 800c48 <error_string+0x148>
  800920:	01000593          	li	a1,16
  800924:	00000517          	auipc	a0,0x0
  800928:	33c50513          	addi	a0,a0,828 # 800c60 <error_string+0x160>
  80092c:	ef4ff0ef          	jal	ra,800020 <__panic>
  800930:	00000697          	auipc	a3,0x0
  800934:	31068693          	addi	a3,a3,784 # 800c40 <error_string+0x140>
  800938:	00000617          	auipc	a2,0x0
  80093c:	31060613          	addi	a2,a2,784 # 800c48 <error_string+0x148>
  800940:	00f00593          	li	a1,15
  800944:	00000517          	auipc	a0,0x0
  800948:	31c50513          	addi	a0,a0,796 # 800c60 <error_string+0x160>
  80094c:	ed4ff0ef          	jal	ra,800020 <__panic>
  800950:	00000517          	auipc	a0,0x0
  800954:	2e450513          	addi	a0,a0,740 # 800c34 <error_string+0x134>
  800958:	861ff0ef          	jal	ra,8001b8 <cprintf>
  80095c:	00a00413          	li	s0,10
  800960:	fff40413          	addi	s0,s0,-1
  800964:	fe4ff0ef          	jal	ra,800148 <yield>
  800968:	fe041ce3          	bnez	s0,800960 <main+0x10c>
  80096c:	0000c537          	lui	a0,0xc
  800970:	eaf50513          	addi	a0,a0,-337 # beaf <__panic-0x7f4171>
  800974:	fb0ff0ef          	jal	ra,800124 <exit>
