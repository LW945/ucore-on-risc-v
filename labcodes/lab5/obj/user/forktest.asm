
obj/__user_forktest.out:     file format elf32-littleriscv


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
  800040:	8e450513          	addi	a0,a0,-1820 # 800920 <main+0xd0>
  800044:	00112e23          	sw	ra,28(sp)
  800048:	02d12623          	sw	a3,44(sp)
  80004c:	02e12823          	sw	a4,48(sp)
  800050:	03012c23          	sw	a6,56(sp)
  800054:	03112e23          	sw	a7,60(sp)
  800058:	00f12623          	sw	a5,12(sp)
  80005c:	158000ef          	jal	ra,8001b4 <cprintf>
  800060:	00c12583          	lw	a1,12(sp)
  800064:	00040513          	mv	a0,s0
  800068:	118000ef          	jal	ra,800180 <vcprintf>
  80006c:	00001517          	auipc	a0,0x1
  800070:	8d050513          	addi	a0,a0,-1840 # 80093c <main+0xec>
  800074:	140000ef          	jal	ra,8001b4 <cprintf>
  800078:	ff600513          	li	a0,-10
  80007c:	0a0000ef          	jal	ra,80011c <exit>

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

00800110 <sys_putc>:
  800110:	00050593          	mv	a1,a0
  800114:	01e00513          	li	a0,30
  800118:	f69ff06f          	j	800080 <syscall>

0080011c <exit>:
  80011c:	ff010113          	addi	sp,sp,-16
  800120:	00112623          	sw	ra,12(sp)
  800124:	fc9ff0ef          	jal	ra,8000ec <sys_exit>
  800128:	00001517          	auipc	a0,0x1
  80012c:	81850513          	addi	a0,a0,-2024 # 800940 <main+0xf0>
  800130:	084000ef          	jal	ra,8001b4 <cprintf>
  800134:	0000006f          	j	800134 <exit+0x18>

00800138 <fork>:
  800138:	fc1ff06f          	j	8000f8 <sys_fork>

0080013c <wait>:
  80013c:	00000593          	li	a1,0
  800140:	00000513          	li	a0,0
  800144:	fbdff06f          	j	800100 <sys_wait>

00800148 <_start>:
  800148:	0c4000ef          	jal	ra,80020c <umain>
  80014c:	0000006f          	j	80014c <_start+0x4>

00800150 <cputch>:
  800150:	ff010113          	addi	sp,sp,-16
  800154:	00112623          	sw	ra,12(sp)
  800158:	00812423          	sw	s0,8(sp)
  80015c:	00058413          	mv	s0,a1
  800160:	fb1ff0ef          	jal	ra,800110 <sys_putc>
  800164:	00042783          	lw	a5,0(s0)
  800168:	00c12083          	lw	ra,12(sp)
  80016c:	00178793          	addi	a5,a5,1
  800170:	00f42023          	sw	a5,0(s0)
  800174:	00812403          	lw	s0,8(sp)
  800178:	01010113          	addi	sp,sp,16
  80017c:	00008067          	ret

00800180 <vcprintf>:
  800180:	fe010113          	addi	sp,sp,-32
  800184:	00058693          	mv	a3,a1
  800188:	00050613          	mv	a2,a0
  80018c:	00c10593          	addi	a1,sp,12
  800190:	00000517          	auipc	a0,0x0
  800194:	fc050513          	addi	a0,a0,-64 # 800150 <cputch>
  800198:	00112e23          	sw	ra,28(sp)
  80019c:	00012623          	sw	zero,12(sp)
  8001a0:	164000ef          	jal	ra,800304 <vprintfmt>
  8001a4:	01c12083          	lw	ra,28(sp)
  8001a8:	00c12503          	lw	a0,12(sp)
  8001ac:	02010113          	addi	sp,sp,32
  8001b0:	00008067          	ret

008001b4 <cprintf>:
  8001b4:	fc010113          	addi	sp,sp,-64
  8001b8:	02410313          	addi	t1,sp,36
  8001bc:	02b12223          	sw	a1,36(sp)
  8001c0:	02c12423          	sw	a2,40(sp)
  8001c4:	02d12623          	sw	a3,44(sp)
  8001c8:	00050613          	mv	a2,a0
  8001cc:	00c10593          	addi	a1,sp,12
  8001d0:	00000517          	auipc	a0,0x0
  8001d4:	f8050513          	addi	a0,a0,-128 # 800150 <cputch>
  8001d8:	00030693          	mv	a3,t1
  8001dc:	00112e23          	sw	ra,28(sp)
  8001e0:	02e12823          	sw	a4,48(sp)
  8001e4:	02f12a23          	sw	a5,52(sp)
  8001e8:	03012c23          	sw	a6,56(sp)
  8001ec:	03112e23          	sw	a7,60(sp)
  8001f0:	00612423          	sw	t1,8(sp)
  8001f4:	00012623          	sw	zero,12(sp)
  8001f8:	10c000ef          	jal	ra,800304 <vprintfmt>
  8001fc:	01c12083          	lw	ra,28(sp)
  800200:	00c12503          	lw	a0,12(sp)
  800204:	04010113          	addi	sp,sp,64
  800208:	00008067          	ret

0080020c <umain>:
  80020c:	ff010113          	addi	sp,sp,-16
  800210:	00112623          	sw	ra,12(sp)
  800214:	63c000ef          	jal	ra,800850 <main>
  800218:	f05ff0ef          	jal	ra,80011c <exit>

0080021c <strnlen>:
  80021c:	00050693          	mv	a3,a0
  800220:	02058a63          	beqz	a1,800254 <strnlen+0x38>
  800224:	00054703          	lbu	a4,0(a0)
  800228:	00150793          	addi	a5,a0,1
  80022c:	02070463          	beqz	a4,800254 <strnlen+0x38>
  800230:	00b505b3          	add	a1,a0,a1
  800234:	0100006f          	j	800244 <strnlen+0x28>
  800238:	00178793          	addi	a5,a5,1
  80023c:	fff7c703          	lbu	a4,-1(a5)
  800240:	00070863          	beqz	a4,800250 <strnlen+0x34>
  800244:	40d78533          	sub	a0,a5,a3
  800248:	feb798e3          	bne	a5,a1,800238 <strnlen+0x1c>
  80024c:	00008067          	ret
  800250:	00008067          	ret
  800254:	00000513          	li	a0,0
  800258:	00008067          	ret

0080025c <printnum>:
  80025c:	fe010113          	addi	sp,sp,-32
  800260:	00912a23          	sw	s1,20(sp)
  800264:	01212823          	sw	s2,16(sp)
  800268:	01312623          	sw	s3,12(sp)
  80026c:	01412423          	sw	s4,8(sp)
  800270:	00112e23          	sw	ra,28(sp)
  800274:	00812c23          	sw	s0,24(sp)
  800278:	00050493          	mv	s1,a0
  80027c:	00058913          	mv	s2,a1
  800280:	00080993          	mv	s3,a6
  800284:	02e67a33          	remu	s4,a2,a4
  800288:	04069e63          	bnez	a3,8002e4 <printnum+0x88>
  80028c:	04e67c63          	bleu	a4,a2,8002e4 <printnum+0x88>
  800290:	fff78413          	addi	s0,a5,-1
  800294:	00805c63          	blez	s0,8002ac <printnum+0x50>
  800298:	fff40413          	addi	s0,s0,-1
  80029c:	00090593          	mv	a1,s2
  8002a0:	00098513          	mv	a0,s3
  8002a4:	000480e7          	jalr	s1
  8002a8:	fe0418e3          	bnez	s0,800298 <printnum+0x3c>
  8002ac:	00001797          	auipc	a5,0x1
  8002b0:	86478793          	addi	a5,a5,-1948 # 800b10 <error_string+0x64>
  8002b4:	014787b3          	add	a5,a5,s4
  8002b8:	00090593          	mv	a1,s2
  8002bc:	00048313          	mv	t1,s1
  8002c0:	01c12083          	lw	ra,28(sp)
  8002c4:	01812403          	lw	s0,24(sp)
  8002c8:	01412483          	lw	s1,20(sp)
  8002cc:	01012903          	lw	s2,16(sp)
  8002d0:	00c12983          	lw	s3,12(sp)
  8002d4:	00812a03          	lw	s4,8(sp)
  8002d8:	0007c503          	lbu	a0,0(a5)
  8002dc:	02010113          	addi	sp,sp,32
  8002e0:	00030067          	jr	t1
  8002e4:	02e65633          	divu	a2,a2,a4
  8002e8:	00098813          	mv	a6,s3
  8002ec:	fff78793          	addi	a5,a5,-1
  8002f0:	00000693          	li	a3,0
  8002f4:	00090593          	mv	a1,s2
  8002f8:	00048513          	mv	a0,s1
  8002fc:	f61ff0ef          	jal	ra,80025c <printnum>
  800300:	fadff06f          	j	8002ac <printnum+0x50>

00800304 <vprintfmt>:
  800304:	fb010113          	addi	sp,sp,-80
  800308:	05212023          	sw	s2,64(sp)
  80030c:	03312e23          	sw	s3,60(sp)
  800310:	03412c23          	sw	s4,56(sp)
  800314:	03512a23          	sw	s5,52(sp)
  800318:	03612823          	sw	s6,48(sp)
  80031c:	03712623          	sw	s7,44(sp)
  800320:	03812423          	sw	s8,40(sp)
  800324:	03912223          	sw	s9,36(sp)
  800328:	04112623          	sw	ra,76(sp)
  80032c:	04812423          	sw	s0,72(sp)
  800330:	04912223          	sw	s1,68(sp)
  800334:	03a12023          	sw	s10,32(sp)
  800338:	01b12e23          	sw	s11,28(sp)
  80033c:	00050993          	mv	s3,a0
  800340:	00058913          	mv	s2,a1
  800344:	00060c93          	mv	s9,a2
  800348:	00068a93          	mv	s5,a3
  80034c:	00000a17          	auipc	s4,0x0
  800350:	608a0a13          	addi	s4,s4,1544 # 800954 <main+0x104>
  800354:	02800c13          	li	s8,40
  800358:	fff00b13          	li	s6,-1
  80035c:	05e00b93          	li	s7,94
  800360:	000cc503          	lbu	a0,0(s9)
  800364:	02500493          	li	s1,37
  800368:	001c8413          	addi	s0,s9,1
  80036c:	00950e63          	beq	a0,s1,800388 <vprintfmt+0x84>
  800370:	06050463          	beqz	a0,8003d8 <vprintfmt+0xd4>
  800374:	00090593          	mv	a1,s2
  800378:	00140413          	addi	s0,s0,1
  80037c:	000980e7          	jalr	s3
  800380:	fff44503          	lbu	a0,-1(s0)
  800384:	fe9516e3          	bne	a0,s1,800370 <vprintfmt+0x6c>
  800388:	00044e03          	lbu	t3,0(s0)
  80038c:	fff00d13          	li	s10,-1
  800390:	02000813          	li	a6,32
  800394:	00000493          	li	s1,0
  800398:	00000593          	li	a1,0
  80039c:	000d0d93          	mv	s11,s10
  8003a0:	05500693          	li	a3,85
  8003a4:	00100313          	li	t1,1
  8003a8:	03000893          	li	a7,48
  8003ac:	00900613          	li	a2,9
  8003b0:	02d00513          	li	a0,45
  8003b4:	fdde0713          	addi	a4,t3,-35
  8003b8:	0ff77713          	andi	a4,a4,255
  8003bc:	00140c93          	addi	s9,s0,1
  8003c0:	32e6e463          	bltu	a3,a4,8006e8 <vprintfmt+0x3e4>
  8003c4:	00271713          	slli	a4,a4,0x2
  8003c8:	01470733          	add	a4,a4,s4
  8003cc:	00072783          	lw	a5,0(a4)
  8003d0:	014787b3          	add	a5,a5,s4
  8003d4:	00078067          	jr	a5
  8003d8:	04c12083          	lw	ra,76(sp)
  8003dc:	04812403          	lw	s0,72(sp)
  8003e0:	04412483          	lw	s1,68(sp)
  8003e4:	04012903          	lw	s2,64(sp)
  8003e8:	03c12983          	lw	s3,60(sp)
  8003ec:	03812a03          	lw	s4,56(sp)
  8003f0:	03412a83          	lw	s5,52(sp)
  8003f4:	03012b03          	lw	s6,48(sp)
  8003f8:	02c12b83          	lw	s7,44(sp)
  8003fc:	02812c03          	lw	s8,40(sp)
  800400:	02412c83          	lw	s9,36(sp)
  800404:	02012d03          	lw	s10,32(sp)
  800408:	01c12d83          	lw	s11,28(sp)
  80040c:	05010113          	addi	sp,sp,80
  800410:	00008067          	ret
  800414:	00100793          	li	a5,1
  800418:	34b7c063          	blt	a5,a1,800758 <vprintfmt+0x454>
  80041c:	000aa603          	lw	a2,0(s5)
  800420:	00000693          	li	a3,0
  800424:	004a8a93          	addi	s5,s5,4
  800428:	01000713          	li	a4,16
  80042c:	000d8793          	mv	a5,s11
  800430:	00090593          	mv	a1,s2
  800434:	00098513          	mv	a0,s3
  800438:	e25ff0ef          	jal	ra,80025c <printnum>
  80043c:	f25ff06f          	j	800360 <vprintfmt+0x5c>
  800440:	00144e03          	lbu	t3,1(s0)
  800444:	00030493          	mv	s1,t1
  800448:	000c8413          	mv	s0,s9
  80044c:	f69ff06f          	j	8003b4 <vprintfmt+0xb0>
  800450:	000aa503          	lw	a0,0(s5)
  800454:	00090593          	mv	a1,s2
  800458:	004a8a93          	addi	s5,s5,4
  80045c:	000980e7          	jalr	s3
  800460:	f01ff06f          	j	800360 <vprintfmt+0x5c>
  800464:	00100793          	li	a5,1
  800468:	30b7c663          	blt	a5,a1,800774 <vprintfmt+0x470>
  80046c:	000aa603          	lw	a2,0(s5)
  800470:	004a8a93          	addi	s5,s5,4
  800474:	41f65693          	srai	a3,a2,0x1f
  800478:	00a00713          	li	a4,10
  80047c:	fa06d8e3          	bgez	a3,80042c <vprintfmt+0x128>
  800480:	00090593          	mv	a1,s2
  800484:	02d00513          	li	a0,45
  800488:	00d12623          	sw	a3,12(sp)
  80048c:	00c12423          	sw	a2,8(sp)
  800490:	00e12223          	sw	a4,4(sp)
  800494:	01012023          	sw	a6,0(sp)
  800498:	000980e7          	jalr	s3
  80049c:	00812603          	lw	a2,8(sp)
  8004a0:	00c12683          	lw	a3,12(sp)
  8004a4:	00012803          	lw	a6,0(sp)
  8004a8:	40c00633          	neg	a2,a2
  8004ac:	00c037b3          	snez	a5,a2
  8004b0:	40d006b3          	neg	a3,a3
  8004b4:	40f686b3          	sub	a3,a3,a5
  8004b8:	00412703          	lw	a4,4(sp)
  8004bc:	f71ff06f          	j	80042c <vprintfmt+0x128>
  8004c0:	000aa783          	lw	a5,0(s5)
  8004c4:	01800693          	li	a3,24
  8004c8:	004a8a93          	addi	s5,s5,4
  8004cc:	41f7d713          	srai	a4,a5,0x1f
  8004d0:	00f747b3          	xor	a5,a4,a5
  8004d4:	40e787b3          	sub	a5,a5,a4
  8004d8:	2af6ca63          	blt	a3,a5,80078c <vprintfmt+0x488>
  8004dc:	00279693          	slli	a3,a5,0x2
  8004e0:	00000717          	auipc	a4,0x0
  8004e4:	5cc70713          	addi	a4,a4,1484 # 800aac <error_string>
  8004e8:	00d70733          	add	a4,a4,a3
  8004ec:	00072683          	lw	a3,0(a4)
  8004f0:	28068e63          	beqz	a3,80078c <vprintfmt+0x488>
  8004f4:	00000617          	auipc	a2,0x0
  8004f8:	6e860613          	addi	a2,a2,1768 # 800bdc <error_string+0x130>
  8004fc:	00090593          	mv	a1,s2
  800500:	00098513          	mv	a0,s3
  800504:	314000ef          	jal	ra,800818 <printfmt>
  800508:	e59ff06f          	j	800360 <vprintfmt+0x5c>
  80050c:	00144e03          	lbu	t3,1(s0)
  800510:	00158593          	addi	a1,a1,1
  800514:	000c8413          	mv	s0,s9
  800518:	e9dff06f          	j	8003b4 <vprintfmt+0xb0>
  80051c:	00100793          	li	a5,1
  800520:	20b7c063          	blt	a5,a1,800720 <vprintfmt+0x41c>
  800524:	000aa603          	lw	a2,0(s5)
  800528:	00000693          	li	a3,0
  80052c:	004a8a93          	addi	s5,s5,4
  800530:	00800713          	li	a4,8
  800534:	ef9ff06f          	j	80042c <vprintfmt+0x128>
  800538:	03000513          	li	a0,48
  80053c:	00090593          	mv	a1,s2
  800540:	01012023          	sw	a6,0(sp)
  800544:	000980e7          	jalr	s3
  800548:	00090593          	mv	a1,s2
  80054c:	07800513          	li	a0,120
  800550:	000980e7          	jalr	s3
  800554:	000aa603          	lw	a2,0(s5)
  800558:	00000693          	li	a3,0
  80055c:	01000713          	li	a4,16
  800560:	004a8a93          	addi	s5,s5,4
  800564:	00012803          	lw	a6,0(sp)
  800568:	ec5ff06f          	j	80042c <vprintfmt+0x128>
  80056c:	000aa403          	lw	s0,0(s5)
  800570:	004a8793          	addi	a5,s5,4
  800574:	00f12223          	sw	a5,4(sp)
  800578:	24040863          	beqz	s0,8007c8 <vprintfmt+0x4c4>
  80057c:	05b05263          	blez	s11,8005c0 <vprintfmt+0x2bc>
  800580:	02d00793          	li	a5,45
  800584:	22f80263          	beq	a6,a5,8007a8 <vprintfmt+0x4a4>
  800588:	000d0593          	mv	a1,s10
  80058c:	00040513          	mv	a0,s0
  800590:	01012023          	sw	a6,0(sp)
  800594:	c89ff0ef          	jal	ra,80021c <strnlen>
  800598:	40ad8db3          	sub	s11,s11,a0
  80059c:	03b05263          	blez	s11,8005c0 <vprintfmt+0x2bc>
  8005a0:	00012803          	lw	a6,0(sp)
  8005a4:	00080513          	mv	a0,a6
  8005a8:	00090593          	mv	a1,s2
  8005ac:	01012023          	sw	a6,0(sp)
  8005b0:	fffd8d93          	addi	s11,s11,-1
  8005b4:	000980e7          	jalr	s3
  8005b8:	00012803          	lw	a6,0(sp)
  8005bc:	fe0d94e3          	bnez	s11,8005a4 <vprintfmt+0x2a0>
  8005c0:	00044783          	lbu	a5,0(s0)
  8005c4:	00140a93          	addi	s5,s0,1
  8005c8:	00078513          	mv	a0,a5
  8005cc:	04078c63          	beqz	a5,800624 <vprintfmt+0x320>
  8005d0:	03f00413          	li	s0,63
  8005d4:	000d4663          	bltz	s10,8005e0 <vprintfmt+0x2dc>
  8005d8:	fffd0d13          	addi	s10,s10,-1
  8005dc:	036d0663          	beq	s10,s6,800608 <vprintfmt+0x304>
  8005e0:	00090593          	mv	a1,s2
  8005e4:	00048663          	beqz	s1,8005f0 <vprintfmt+0x2ec>
  8005e8:	fe078793          	addi	a5,a5,-32
  8005ec:	12fbe463          	bltu	s7,a5,800714 <vprintfmt+0x410>
  8005f0:	000980e7          	jalr	s3
  8005f4:	001a8a93          	addi	s5,s5,1
  8005f8:	fffac783          	lbu	a5,-1(s5)
  8005fc:	fffd8d93          	addi	s11,s11,-1
  800600:	00078513          	mv	a0,a5
  800604:	fc0798e3          	bnez	a5,8005d4 <vprintfmt+0x2d0>
  800608:	01b05e63          	blez	s11,800624 <vprintfmt+0x320>
  80060c:	02000413          	li	s0,32
  800610:	fffd8d93          	addi	s11,s11,-1
  800614:	00090593          	mv	a1,s2
  800618:	00040513          	mv	a0,s0
  80061c:	000980e7          	jalr	s3
  800620:	fe0d98e3          	bnez	s11,800610 <vprintfmt+0x30c>
  800624:	00412a83          	lw	s5,4(sp)
  800628:	d39ff06f          	j	800360 <vprintfmt+0x5c>
  80062c:	00100793          	li	a5,1
  800630:	10b7c663          	blt	a5,a1,80073c <vprintfmt+0x438>
  800634:	000aa603          	lw	a2,0(s5)
  800638:	00000693          	li	a3,0
  80063c:	004a8a93          	addi	s5,s5,4
  800640:	00a00713          	li	a4,10
  800644:	de9ff06f          	j	80042c <vprintfmt+0x128>
  800648:	00144e03          	lbu	t3,1(s0)
  80064c:	00050813          	mv	a6,a0
  800650:	000c8413          	mv	s0,s9
  800654:	d61ff06f          	j	8003b4 <vprintfmt+0xb0>
  800658:	00090593          	mv	a1,s2
  80065c:	02500513          	li	a0,37
  800660:	000980e7          	jalr	s3
  800664:	cfdff06f          	j	800360 <vprintfmt+0x5c>
  800668:	000aad03          	lw	s10,0(s5)
  80066c:	00144e03          	lbu	t3,1(s0)
  800670:	004a8a93          	addi	s5,s5,4
  800674:	000c8413          	mv	s0,s9
  800678:	d20ddee3          	bgez	s11,8003b4 <vprintfmt+0xb0>
  80067c:	000d0d93          	mv	s11,s10
  800680:	fff00d13          	li	s10,-1
  800684:	d31ff06f          	j	8003b4 <vprintfmt+0xb0>
  800688:	00144e03          	lbu	t3,1(s0)
  80068c:	00088813          	mv	a6,a7
  800690:	000c8413          	mv	s0,s9
  800694:	d21ff06f          	j	8003b4 <vprintfmt+0xb0>
  800698:	00144703          	lbu	a4,1(s0)
  80069c:	fd0e0d13          	addi	s10,t3,-48
  8006a0:	fd070793          	addi	a5,a4,-48
  8006a4:	14f66863          	bltu	a2,a5,8007f4 <vprintfmt+0x4f0>
  8006a8:	000c8413          	mv	s0,s9
  8006ac:	002d1793          	slli	a5,s10,0x2
  8006b0:	01a78d33          	add	s10,a5,s10
  8006b4:	00140413          	addi	s0,s0,1
  8006b8:	001d1d13          	slli	s10,s10,0x1
  8006bc:	00ed0d33          	add	s10,s10,a4
  8006c0:	00044703          	lbu	a4,0(s0)
  8006c4:	fd0d0d13          	addi	s10,s10,-48
  8006c8:	fd070793          	addi	a5,a4,-48
  8006cc:	fef670e3          	bleu	a5,a2,8006ac <vprintfmt+0x3a8>
  8006d0:	00070e13          	mv	t3,a4
  8006d4:	fa5ff06f          	j	800678 <vprintfmt+0x374>
  8006d8:	0e0dc463          	bltz	s11,8007c0 <vprintfmt+0x4bc>
  8006dc:	00144e03          	lbu	t3,1(s0)
  8006e0:	000c8413          	mv	s0,s9
  8006e4:	cd1ff06f          	j	8003b4 <vprintfmt+0xb0>
  8006e8:	00090593          	mv	a1,s2
  8006ec:	02500513          	li	a0,37
  8006f0:	000980e7          	jalr	s3
  8006f4:	fff44783          	lbu	a5,-1(s0)
  8006f8:	02500713          	li	a4,37
  8006fc:	00040c93          	mv	s9,s0
  800700:	c6e780e3          	beq	a5,a4,800360 <vprintfmt+0x5c>
  800704:	fffc8c93          	addi	s9,s9,-1
  800708:	fffcc783          	lbu	a5,-1(s9)
  80070c:	fee79ce3          	bne	a5,a4,800704 <vprintfmt+0x400>
  800710:	c51ff06f          	j	800360 <vprintfmt+0x5c>
  800714:	00040513          	mv	a0,s0
  800718:	000980e7          	jalr	s3
  80071c:	ed9ff06f          	j	8005f4 <vprintfmt+0x2f0>
  800720:	007a8793          	addi	a5,s5,7
  800724:	ff87f793          	andi	a5,a5,-8
  800728:	00878a93          	addi	s5,a5,8
  80072c:	0007a603          	lw	a2,0(a5)
  800730:	0047a683          	lw	a3,4(a5)
  800734:	00800713          	li	a4,8
  800738:	cf5ff06f          	j	80042c <vprintfmt+0x128>
  80073c:	007a8793          	addi	a5,s5,7
  800740:	ff87f793          	andi	a5,a5,-8
  800744:	00878a93          	addi	s5,a5,8
  800748:	0007a603          	lw	a2,0(a5)
  80074c:	0047a683          	lw	a3,4(a5)
  800750:	00a00713          	li	a4,10
  800754:	cd9ff06f          	j	80042c <vprintfmt+0x128>
  800758:	007a8793          	addi	a5,s5,7
  80075c:	ff87f793          	andi	a5,a5,-8
  800760:	00878a93          	addi	s5,a5,8
  800764:	0007a603          	lw	a2,0(a5)
  800768:	0047a683          	lw	a3,4(a5)
  80076c:	01000713          	li	a4,16
  800770:	cbdff06f          	j	80042c <vprintfmt+0x128>
  800774:	007a8793          	addi	a5,s5,7
  800778:	ff87f793          	andi	a5,a5,-8
  80077c:	00878a93          	addi	s5,a5,8
  800780:	0007a603          	lw	a2,0(a5)
  800784:	0047a683          	lw	a3,4(a5)
  800788:	cf1ff06f          	j	800478 <vprintfmt+0x174>
  80078c:	00078693          	mv	a3,a5
  800790:	00000617          	auipc	a2,0x0
  800794:	44060613          	addi	a2,a2,1088 # 800bd0 <error_string+0x124>
  800798:	00090593          	mv	a1,s2
  80079c:	00098513          	mv	a0,s3
  8007a0:	078000ef          	jal	ra,800818 <printfmt>
  8007a4:	bbdff06f          	j	800360 <vprintfmt+0x5c>
  8007a8:	00044783          	lbu	a5,0(s0)
  8007ac:	00140a93          	addi	s5,s0,1
  8007b0:	00078513          	mv	a0,a5
  8007b4:	e4078ce3          	beqz	a5,80060c <vprintfmt+0x308>
  8007b8:	03f00413          	li	s0,63
  8007bc:	e19ff06f          	j	8005d4 <vprintfmt+0x2d0>
  8007c0:	00000d93          	li	s11,0
  8007c4:	f19ff06f          	j	8006dc <vprintfmt+0x3d8>
  8007c8:	03b05c63          	blez	s11,800800 <vprintfmt+0x4fc>
  8007cc:	02d00793          	li	a5,45
  8007d0:	00000417          	auipc	s0,0x0
  8007d4:	3f840413          	addi	s0,s0,1016 # 800bc8 <error_string+0x11c>
  8007d8:	daf818e3          	bne	a6,a5,800588 <vprintfmt+0x284>
  8007dc:	00000a97          	auipc	s5,0x0
  8007e0:	3eda8a93          	addi	s5,s5,1005 # 800bc9 <error_string+0x11d>
  8007e4:	000c0513          	mv	a0,s8
  8007e8:	000c0793          	mv	a5,s8
  8007ec:	03f00413          	li	s0,63
  8007f0:	de5ff06f          	j	8005d4 <vprintfmt+0x2d0>
  8007f4:	00070e13          	mv	t3,a4
  8007f8:	000c8413          	mv	s0,s9
  8007fc:	e7dff06f          	j	800678 <vprintfmt+0x374>
  800800:	000c0793          	mv	a5,s8
  800804:	000c0513          	mv	a0,s8
  800808:	00000a97          	auipc	s5,0x0
  80080c:	3c1a8a93          	addi	s5,s5,961 # 800bc9 <error_string+0x11d>
  800810:	03f00413          	li	s0,63
  800814:	dc1ff06f          	j	8005d4 <vprintfmt+0x2d0>

00800818 <printfmt>:
  800818:	fc010113          	addi	sp,sp,-64
  80081c:	02c10313          	addi	t1,sp,44
  800820:	02d12623          	sw	a3,44(sp)
  800824:	00030693          	mv	a3,t1
  800828:	00112e23          	sw	ra,28(sp)
  80082c:	02e12823          	sw	a4,48(sp)
  800830:	02f12a23          	sw	a5,52(sp)
  800834:	03012c23          	sw	a6,56(sp)
  800838:	03112e23          	sw	a7,60(sp)
  80083c:	00612623          	sw	t1,12(sp)
  800840:	ac5ff0ef          	jal	ra,800304 <vprintfmt>
  800844:	01c12083          	lw	ra,28(sp)
  800848:	04010113          	addi	sp,sp,64
  80084c:	00008067          	ret

00800850 <main>:
  800850:	ff010113          	addi	sp,sp,-16
  800854:	00812423          	sw	s0,8(sp)
  800858:	00912223          	sw	s1,4(sp)
  80085c:	00112623          	sw	ra,12(sp)
  800860:	00000413          	li	s0,0
  800864:	02000493          	li	s1,32
  800868:	8d1ff0ef          	jal	ra,800138 <fork>
  80086c:	04050663          	beqz	a0,8008b8 <main+0x68>
  800870:	06a05063          	blez	a0,8008d0 <main+0x80>
  800874:	00140413          	addi	s0,s0,1
  800878:	fe9418e3          	bne	s0,s1,800868 <main+0x18>
  80087c:	8c1ff0ef          	jal	ra,80013c <wait>
  800880:	06051863          	bnez	a0,8008f0 <main+0xa0>
  800884:	fff40413          	addi	s0,s0,-1
  800888:	fe041ae3          	bnez	s0,80087c <main+0x2c>
  80088c:	8b1ff0ef          	jal	ra,80013c <wait>
  800890:	06050c63          	beqz	a0,800908 <main+0xb8>
  800894:	00000517          	auipc	a0,0x0
  800898:	3b450513          	addi	a0,a0,948 # 800c48 <error_string+0x19c>
  80089c:	919ff0ef          	jal	ra,8001b4 <cprintf>
  8008a0:	00c12083          	lw	ra,12(sp)
  8008a4:	00000513          	li	a0,0
  8008a8:	00812403          	lw	s0,8(sp)
  8008ac:	00412483          	lw	s1,4(sp)
  8008b0:	01010113          	addi	sp,sp,16
  8008b4:	00008067          	ret
  8008b8:	00040593          	mv	a1,s0
  8008bc:	00000517          	auipc	a0,0x0
  8008c0:	32450513          	addi	a0,a0,804 # 800be0 <error_string+0x134>
  8008c4:	8f1ff0ef          	jal	ra,8001b4 <cprintf>
  8008c8:	00000513          	li	a0,0
  8008cc:	851ff0ef          	jal	ra,80011c <exit>
  8008d0:	00000697          	auipc	a3,0x0
  8008d4:	32068693          	addi	a3,a3,800 # 800bf0 <error_string+0x144>
  8008d8:	00000617          	auipc	a2,0x0
  8008dc:	32060613          	addi	a2,a2,800 # 800bf8 <error_string+0x14c>
  8008e0:	00e00593          	li	a1,14
  8008e4:	00000517          	auipc	a0,0x0
  8008e8:	32c50513          	addi	a0,a0,812 # 800c10 <error_string+0x164>
  8008ec:	f34ff0ef          	jal	ra,800020 <__panic>
  8008f0:	00000617          	auipc	a2,0x0
  8008f4:	33060613          	addi	a2,a2,816 # 800c20 <error_string+0x174>
  8008f8:	01700593          	li	a1,23
  8008fc:	00000517          	auipc	a0,0x0
  800900:	31450513          	addi	a0,a0,788 # 800c10 <error_string+0x164>
  800904:	f1cff0ef          	jal	ra,800020 <__panic>
  800908:	00000617          	auipc	a2,0x0
  80090c:	32c60613          	addi	a2,a2,812 # 800c34 <error_string+0x188>
  800910:	01c00593          	li	a1,28
  800914:	00000517          	auipc	a0,0x0
  800918:	2fc50513          	addi	a0,a0,764 # 800c10 <error_string+0x164>
  80091c:	f04ff0ef          	jal	ra,800020 <__panic>
