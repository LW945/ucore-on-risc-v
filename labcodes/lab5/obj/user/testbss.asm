
obj/__user_testbss.out:     file format elf32-littleriscv


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
  800040:	8c450513          	addi	a0,a0,-1852 # 800900 <main+0xd8>
  800044:	00112e23          	sw	ra,28(sp)
  800048:	02d12623          	sw	a3,44(sp)
  80004c:	02e12823          	sw	a4,48(sp)
  800050:	03012c23          	sw	a6,56(sp)
  800054:	03112e23          	sw	a7,60(sp)
  800058:	00f12623          	sw	a5,12(sp)
  80005c:	130000ef          	jal	ra,80018c <cprintf>
  800060:	00c12583          	lw	a1,12(sp)
  800064:	00040513          	mv	a0,s0
  800068:	0f0000ef          	jal	ra,800158 <vcprintf>
  80006c:	00001517          	auipc	a0,0x1
  800070:	8b050513          	addi	a0,a0,-1872 # 80091c <main+0xf4>
  800074:	118000ef          	jal	ra,80018c <cprintf>
  800078:	ff600513          	li	a0,-10
  80007c:	088000ef          	jal	ra,800104 <exit>

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

008000f8 <sys_putc>:
  8000f8:	00050593          	mv	a1,a0
  8000fc:	01e00513          	li	a0,30
  800100:	f81ff06f          	j	800080 <syscall>

00800104 <exit>:
  800104:	ff010113          	addi	sp,sp,-16
  800108:	00112623          	sw	ra,12(sp)
  80010c:	fe1ff0ef          	jal	ra,8000ec <sys_exit>
  800110:	00001517          	auipc	a0,0x1
  800114:	81050513          	addi	a0,a0,-2032 # 800920 <main+0xf8>
  800118:	074000ef          	jal	ra,80018c <cprintf>
  80011c:	0000006f          	j	80011c <exit+0x18>

00800120 <_start>:
  800120:	0c4000ef          	jal	ra,8001e4 <umain>
  800124:	0000006f          	j	800124 <_start+0x4>

00800128 <cputch>:
  800128:	ff010113          	addi	sp,sp,-16
  80012c:	00112623          	sw	ra,12(sp)
  800130:	00812423          	sw	s0,8(sp)
  800134:	00058413          	mv	s0,a1
  800138:	fc1ff0ef          	jal	ra,8000f8 <sys_putc>
  80013c:	00042783          	lw	a5,0(s0)
  800140:	00c12083          	lw	ra,12(sp)
  800144:	00178793          	addi	a5,a5,1
  800148:	00f42023          	sw	a5,0(s0)
  80014c:	00812403          	lw	s0,8(sp)
  800150:	01010113          	addi	sp,sp,16
  800154:	00008067          	ret

00800158 <vcprintf>:
  800158:	fe010113          	addi	sp,sp,-32
  80015c:	00058693          	mv	a3,a1
  800160:	00050613          	mv	a2,a0
  800164:	00c10593          	addi	a1,sp,12
  800168:	00000517          	auipc	a0,0x0
  80016c:	fc050513          	addi	a0,a0,-64 # 800128 <cputch>
  800170:	00112e23          	sw	ra,28(sp)
  800174:	00012623          	sw	zero,12(sp)
  800178:	164000ef          	jal	ra,8002dc <vprintfmt>
  80017c:	01c12083          	lw	ra,28(sp)
  800180:	00c12503          	lw	a0,12(sp)
  800184:	02010113          	addi	sp,sp,32
  800188:	00008067          	ret

0080018c <cprintf>:
  80018c:	fc010113          	addi	sp,sp,-64
  800190:	02410313          	addi	t1,sp,36
  800194:	02b12223          	sw	a1,36(sp)
  800198:	02c12423          	sw	a2,40(sp)
  80019c:	02d12623          	sw	a3,44(sp)
  8001a0:	00050613          	mv	a2,a0
  8001a4:	00c10593          	addi	a1,sp,12
  8001a8:	00000517          	auipc	a0,0x0
  8001ac:	f8050513          	addi	a0,a0,-128 # 800128 <cputch>
  8001b0:	00030693          	mv	a3,t1
  8001b4:	00112e23          	sw	ra,28(sp)
  8001b8:	02e12823          	sw	a4,48(sp)
  8001bc:	02f12a23          	sw	a5,52(sp)
  8001c0:	03012c23          	sw	a6,56(sp)
  8001c4:	03112e23          	sw	a7,60(sp)
  8001c8:	00612423          	sw	t1,8(sp)
  8001cc:	00012623          	sw	zero,12(sp)
  8001d0:	10c000ef          	jal	ra,8002dc <vprintfmt>
  8001d4:	01c12083          	lw	ra,28(sp)
  8001d8:	00c12503          	lw	a0,12(sp)
  8001dc:	04010113          	addi	sp,sp,64
  8001e0:	00008067          	ret

008001e4 <umain>:
  8001e4:	ff010113          	addi	sp,sp,-16
  8001e8:	00112623          	sw	ra,12(sp)
  8001ec:	63c000ef          	jal	ra,800828 <main>
  8001f0:	f15ff0ef          	jal	ra,800104 <exit>

008001f4 <strnlen>:
  8001f4:	00050693          	mv	a3,a0
  8001f8:	02058a63          	beqz	a1,80022c <strnlen+0x38>
  8001fc:	00054703          	lbu	a4,0(a0)
  800200:	00150793          	addi	a5,a0,1
  800204:	02070463          	beqz	a4,80022c <strnlen+0x38>
  800208:	00b505b3          	add	a1,a0,a1
  80020c:	0100006f          	j	80021c <strnlen+0x28>
  800210:	00178793          	addi	a5,a5,1
  800214:	fff7c703          	lbu	a4,-1(a5)
  800218:	00070863          	beqz	a4,800228 <strnlen+0x34>
  80021c:	40d78533          	sub	a0,a5,a3
  800220:	feb798e3          	bne	a5,a1,800210 <strnlen+0x1c>
  800224:	00008067          	ret
  800228:	00008067          	ret
  80022c:	00000513          	li	a0,0
  800230:	00008067          	ret

00800234 <printnum>:
  800234:	fe010113          	addi	sp,sp,-32
  800238:	00912a23          	sw	s1,20(sp)
  80023c:	01212823          	sw	s2,16(sp)
  800240:	01312623          	sw	s3,12(sp)
  800244:	01412423          	sw	s4,8(sp)
  800248:	00112e23          	sw	ra,28(sp)
  80024c:	00812c23          	sw	s0,24(sp)
  800250:	00050493          	mv	s1,a0
  800254:	00058913          	mv	s2,a1
  800258:	00080993          	mv	s3,a6
  80025c:	02e67a33          	remu	s4,a2,a4
  800260:	04069e63          	bnez	a3,8002bc <printnum+0x88>
  800264:	04e67c63          	bleu	a4,a2,8002bc <printnum+0x88>
  800268:	fff78413          	addi	s0,a5,-1
  80026c:	00805c63          	blez	s0,800284 <printnum+0x50>
  800270:	fff40413          	addi	s0,s0,-1
  800274:	00090593          	mv	a1,s2
  800278:	00098513          	mv	a0,s3
  80027c:	000480e7          	jalr	s1
  800280:	fe0418e3          	bnez	s0,800270 <printnum+0x3c>
  800284:	00001797          	auipc	a5,0x1
  800288:	86c78793          	addi	a5,a5,-1940 # 800af0 <error_string+0x64>
  80028c:	014787b3          	add	a5,a5,s4
  800290:	00090593          	mv	a1,s2
  800294:	00048313          	mv	t1,s1
  800298:	01c12083          	lw	ra,28(sp)
  80029c:	01812403          	lw	s0,24(sp)
  8002a0:	01412483          	lw	s1,20(sp)
  8002a4:	01012903          	lw	s2,16(sp)
  8002a8:	00c12983          	lw	s3,12(sp)
  8002ac:	00812a03          	lw	s4,8(sp)
  8002b0:	0007c503          	lbu	a0,0(a5)
  8002b4:	02010113          	addi	sp,sp,32
  8002b8:	00030067          	jr	t1
  8002bc:	02e65633          	divu	a2,a2,a4
  8002c0:	00098813          	mv	a6,s3
  8002c4:	fff78793          	addi	a5,a5,-1
  8002c8:	00000693          	li	a3,0
  8002cc:	00090593          	mv	a1,s2
  8002d0:	00048513          	mv	a0,s1
  8002d4:	f61ff0ef          	jal	ra,800234 <printnum>
  8002d8:	fadff06f          	j	800284 <printnum+0x50>

008002dc <vprintfmt>:
  8002dc:	fb010113          	addi	sp,sp,-80
  8002e0:	05212023          	sw	s2,64(sp)
  8002e4:	03312e23          	sw	s3,60(sp)
  8002e8:	03412c23          	sw	s4,56(sp)
  8002ec:	03512a23          	sw	s5,52(sp)
  8002f0:	03612823          	sw	s6,48(sp)
  8002f4:	03712623          	sw	s7,44(sp)
  8002f8:	03812423          	sw	s8,40(sp)
  8002fc:	03912223          	sw	s9,36(sp)
  800300:	04112623          	sw	ra,76(sp)
  800304:	04812423          	sw	s0,72(sp)
  800308:	04912223          	sw	s1,68(sp)
  80030c:	03a12023          	sw	s10,32(sp)
  800310:	01b12e23          	sw	s11,28(sp)
  800314:	00050993          	mv	s3,a0
  800318:	00058913          	mv	s2,a1
  80031c:	00060c93          	mv	s9,a2
  800320:	00068a93          	mv	s5,a3
  800324:	00000a17          	auipc	s4,0x0
  800328:	610a0a13          	addi	s4,s4,1552 # 800934 <main+0x10c>
  80032c:	02800c13          	li	s8,40
  800330:	fff00b13          	li	s6,-1
  800334:	05e00b93          	li	s7,94
  800338:	000cc503          	lbu	a0,0(s9)
  80033c:	02500493          	li	s1,37
  800340:	001c8413          	addi	s0,s9,1
  800344:	00950e63          	beq	a0,s1,800360 <vprintfmt+0x84>
  800348:	06050463          	beqz	a0,8003b0 <vprintfmt+0xd4>
  80034c:	00090593          	mv	a1,s2
  800350:	00140413          	addi	s0,s0,1
  800354:	000980e7          	jalr	s3
  800358:	fff44503          	lbu	a0,-1(s0)
  80035c:	fe9516e3          	bne	a0,s1,800348 <vprintfmt+0x6c>
  800360:	00044e03          	lbu	t3,0(s0)
  800364:	fff00d13          	li	s10,-1
  800368:	02000813          	li	a6,32
  80036c:	00000493          	li	s1,0
  800370:	00000593          	li	a1,0
  800374:	000d0d93          	mv	s11,s10
  800378:	05500693          	li	a3,85
  80037c:	00100313          	li	t1,1
  800380:	03000893          	li	a7,48
  800384:	00900613          	li	a2,9
  800388:	02d00513          	li	a0,45
  80038c:	fdde0713          	addi	a4,t3,-35
  800390:	0ff77713          	andi	a4,a4,255
  800394:	00140c93          	addi	s9,s0,1
  800398:	32e6e463          	bltu	a3,a4,8006c0 <vprintfmt+0x3e4>
  80039c:	00271713          	slli	a4,a4,0x2
  8003a0:	01470733          	add	a4,a4,s4
  8003a4:	00072783          	lw	a5,0(a4)
  8003a8:	014787b3          	add	a5,a5,s4
  8003ac:	00078067          	jr	a5
  8003b0:	04c12083          	lw	ra,76(sp)
  8003b4:	04812403          	lw	s0,72(sp)
  8003b8:	04412483          	lw	s1,68(sp)
  8003bc:	04012903          	lw	s2,64(sp)
  8003c0:	03c12983          	lw	s3,60(sp)
  8003c4:	03812a03          	lw	s4,56(sp)
  8003c8:	03412a83          	lw	s5,52(sp)
  8003cc:	03012b03          	lw	s6,48(sp)
  8003d0:	02c12b83          	lw	s7,44(sp)
  8003d4:	02812c03          	lw	s8,40(sp)
  8003d8:	02412c83          	lw	s9,36(sp)
  8003dc:	02012d03          	lw	s10,32(sp)
  8003e0:	01c12d83          	lw	s11,28(sp)
  8003e4:	05010113          	addi	sp,sp,80
  8003e8:	00008067          	ret
  8003ec:	00100793          	li	a5,1
  8003f0:	34b7c063          	blt	a5,a1,800730 <vprintfmt+0x454>
  8003f4:	000aa603          	lw	a2,0(s5)
  8003f8:	00000693          	li	a3,0
  8003fc:	004a8a93          	addi	s5,s5,4
  800400:	01000713          	li	a4,16
  800404:	000d8793          	mv	a5,s11
  800408:	00090593          	mv	a1,s2
  80040c:	00098513          	mv	a0,s3
  800410:	e25ff0ef          	jal	ra,800234 <printnum>
  800414:	f25ff06f          	j	800338 <vprintfmt+0x5c>
  800418:	00144e03          	lbu	t3,1(s0)
  80041c:	00030493          	mv	s1,t1
  800420:	000c8413          	mv	s0,s9
  800424:	f69ff06f          	j	80038c <vprintfmt+0xb0>
  800428:	000aa503          	lw	a0,0(s5)
  80042c:	00090593          	mv	a1,s2
  800430:	004a8a93          	addi	s5,s5,4
  800434:	000980e7          	jalr	s3
  800438:	f01ff06f          	j	800338 <vprintfmt+0x5c>
  80043c:	00100793          	li	a5,1
  800440:	30b7c663          	blt	a5,a1,80074c <vprintfmt+0x470>
  800444:	000aa603          	lw	a2,0(s5)
  800448:	004a8a93          	addi	s5,s5,4
  80044c:	41f65693          	srai	a3,a2,0x1f
  800450:	00a00713          	li	a4,10
  800454:	fa06d8e3          	bgez	a3,800404 <vprintfmt+0x128>
  800458:	00090593          	mv	a1,s2
  80045c:	02d00513          	li	a0,45
  800460:	00d12623          	sw	a3,12(sp)
  800464:	00c12423          	sw	a2,8(sp)
  800468:	00e12223          	sw	a4,4(sp)
  80046c:	01012023          	sw	a6,0(sp)
  800470:	000980e7          	jalr	s3
  800474:	00812603          	lw	a2,8(sp)
  800478:	00c12683          	lw	a3,12(sp)
  80047c:	00012803          	lw	a6,0(sp)
  800480:	40c00633          	neg	a2,a2
  800484:	00c037b3          	snez	a5,a2
  800488:	40d006b3          	neg	a3,a3
  80048c:	40f686b3          	sub	a3,a3,a5
  800490:	00412703          	lw	a4,4(sp)
  800494:	f71ff06f          	j	800404 <vprintfmt+0x128>
  800498:	000aa783          	lw	a5,0(s5)
  80049c:	01800693          	li	a3,24
  8004a0:	004a8a93          	addi	s5,s5,4
  8004a4:	41f7d713          	srai	a4,a5,0x1f
  8004a8:	00f747b3          	xor	a5,a4,a5
  8004ac:	40e787b3          	sub	a5,a5,a4
  8004b0:	2af6ca63          	blt	a3,a5,800764 <vprintfmt+0x488>
  8004b4:	00279693          	slli	a3,a5,0x2
  8004b8:	00000717          	auipc	a4,0x0
  8004bc:	5d470713          	addi	a4,a4,1492 # 800a8c <error_string>
  8004c0:	00d70733          	add	a4,a4,a3
  8004c4:	00072683          	lw	a3,0(a4)
  8004c8:	28068e63          	beqz	a3,800764 <vprintfmt+0x488>
  8004cc:	00000617          	auipc	a2,0x0
  8004d0:	6f060613          	addi	a2,a2,1776 # 800bbc <error_string+0x130>
  8004d4:	00090593          	mv	a1,s2
  8004d8:	00098513          	mv	a0,s3
  8004dc:	314000ef          	jal	ra,8007f0 <printfmt>
  8004e0:	e59ff06f          	j	800338 <vprintfmt+0x5c>
  8004e4:	00144e03          	lbu	t3,1(s0)
  8004e8:	00158593          	addi	a1,a1,1
  8004ec:	000c8413          	mv	s0,s9
  8004f0:	e9dff06f          	j	80038c <vprintfmt+0xb0>
  8004f4:	00100793          	li	a5,1
  8004f8:	20b7c063          	blt	a5,a1,8006f8 <vprintfmt+0x41c>
  8004fc:	000aa603          	lw	a2,0(s5)
  800500:	00000693          	li	a3,0
  800504:	004a8a93          	addi	s5,s5,4
  800508:	00800713          	li	a4,8
  80050c:	ef9ff06f          	j	800404 <vprintfmt+0x128>
  800510:	03000513          	li	a0,48
  800514:	00090593          	mv	a1,s2
  800518:	01012023          	sw	a6,0(sp)
  80051c:	000980e7          	jalr	s3
  800520:	00090593          	mv	a1,s2
  800524:	07800513          	li	a0,120
  800528:	000980e7          	jalr	s3
  80052c:	000aa603          	lw	a2,0(s5)
  800530:	00000693          	li	a3,0
  800534:	01000713          	li	a4,16
  800538:	004a8a93          	addi	s5,s5,4
  80053c:	00012803          	lw	a6,0(sp)
  800540:	ec5ff06f          	j	800404 <vprintfmt+0x128>
  800544:	000aa403          	lw	s0,0(s5)
  800548:	004a8793          	addi	a5,s5,4
  80054c:	00f12223          	sw	a5,4(sp)
  800550:	24040863          	beqz	s0,8007a0 <vprintfmt+0x4c4>
  800554:	05b05263          	blez	s11,800598 <vprintfmt+0x2bc>
  800558:	02d00793          	li	a5,45
  80055c:	22f80263          	beq	a6,a5,800780 <vprintfmt+0x4a4>
  800560:	000d0593          	mv	a1,s10
  800564:	00040513          	mv	a0,s0
  800568:	01012023          	sw	a6,0(sp)
  80056c:	c89ff0ef          	jal	ra,8001f4 <strnlen>
  800570:	40ad8db3          	sub	s11,s11,a0
  800574:	03b05263          	blez	s11,800598 <vprintfmt+0x2bc>
  800578:	00012803          	lw	a6,0(sp)
  80057c:	00080513          	mv	a0,a6
  800580:	00090593          	mv	a1,s2
  800584:	01012023          	sw	a6,0(sp)
  800588:	fffd8d93          	addi	s11,s11,-1
  80058c:	000980e7          	jalr	s3
  800590:	00012803          	lw	a6,0(sp)
  800594:	fe0d94e3          	bnez	s11,80057c <vprintfmt+0x2a0>
  800598:	00044783          	lbu	a5,0(s0)
  80059c:	00140a93          	addi	s5,s0,1
  8005a0:	00078513          	mv	a0,a5
  8005a4:	04078c63          	beqz	a5,8005fc <vprintfmt+0x320>
  8005a8:	03f00413          	li	s0,63
  8005ac:	000d4663          	bltz	s10,8005b8 <vprintfmt+0x2dc>
  8005b0:	fffd0d13          	addi	s10,s10,-1
  8005b4:	036d0663          	beq	s10,s6,8005e0 <vprintfmt+0x304>
  8005b8:	00090593          	mv	a1,s2
  8005bc:	00048663          	beqz	s1,8005c8 <vprintfmt+0x2ec>
  8005c0:	fe078793          	addi	a5,a5,-32
  8005c4:	12fbe463          	bltu	s7,a5,8006ec <vprintfmt+0x410>
  8005c8:	000980e7          	jalr	s3
  8005cc:	001a8a93          	addi	s5,s5,1
  8005d0:	fffac783          	lbu	a5,-1(s5)
  8005d4:	fffd8d93          	addi	s11,s11,-1
  8005d8:	00078513          	mv	a0,a5
  8005dc:	fc0798e3          	bnez	a5,8005ac <vprintfmt+0x2d0>
  8005e0:	01b05e63          	blez	s11,8005fc <vprintfmt+0x320>
  8005e4:	02000413          	li	s0,32
  8005e8:	fffd8d93          	addi	s11,s11,-1
  8005ec:	00090593          	mv	a1,s2
  8005f0:	00040513          	mv	a0,s0
  8005f4:	000980e7          	jalr	s3
  8005f8:	fe0d98e3          	bnez	s11,8005e8 <vprintfmt+0x30c>
  8005fc:	00412a83          	lw	s5,4(sp)
  800600:	d39ff06f          	j	800338 <vprintfmt+0x5c>
  800604:	00100793          	li	a5,1
  800608:	10b7c663          	blt	a5,a1,800714 <vprintfmt+0x438>
  80060c:	000aa603          	lw	a2,0(s5)
  800610:	00000693          	li	a3,0
  800614:	004a8a93          	addi	s5,s5,4
  800618:	00a00713          	li	a4,10
  80061c:	de9ff06f          	j	800404 <vprintfmt+0x128>
  800620:	00144e03          	lbu	t3,1(s0)
  800624:	00050813          	mv	a6,a0
  800628:	000c8413          	mv	s0,s9
  80062c:	d61ff06f          	j	80038c <vprintfmt+0xb0>
  800630:	00090593          	mv	a1,s2
  800634:	02500513          	li	a0,37
  800638:	000980e7          	jalr	s3
  80063c:	cfdff06f          	j	800338 <vprintfmt+0x5c>
  800640:	000aad03          	lw	s10,0(s5)
  800644:	00144e03          	lbu	t3,1(s0)
  800648:	004a8a93          	addi	s5,s5,4
  80064c:	000c8413          	mv	s0,s9
  800650:	d20ddee3          	bgez	s11,80038c <vprintfmt+0xb0>
  800654:	000d0d93          	mv	s11,s10
  800658:	fff00d13          	li	s10,-1
  80065c:	d31ff06f          	j	80038c <vprintfmt+0xb0>
  800660:	00144e03          	lbu	t3,1(s0)
  800664:	00088813          	mv	a6,a7
  800668:	000c8413          	mv	s0,s9
  80066c:	d21ff06f          	j	80038c <vprintfmt+0xb0>
  800670:	00144703          	lbu	a4,1(s0)
  800674:	fd0e0d13          	addi	s10,t3,-48
  800678:	fd070793          	addi	a5,a4,-48
  80067c:	14f66863          	bltu	a2,a5,8007cc <vprintfmt+0x4f0>
  800680:	000c8413          	mv	s0,s9
  800684:	002d1793          	slli	a5,s10,0x2
  800688:	01a78d33          	add	s10,a5,s10
  80068c:	00140413          	addi	s0,s0,1
  800690:	001d1d13          	slli	s10,s10,0x1
  800694:	00ed0d33          	add	s10,s10,a4
  800698:	00044703          	lbu	a4,0(s0)
  80069c:	fd0d0d13          	addi	s10,s10,-48
  8006a0:	fd070793          	addi	a5,a4,-48
  8006a4:	fef670e3          	bleu	a5,a2,800684 <vprintfmt+0x3a8>
  8006a8:	00070e13          	mv	t3,a4
  8006ac:	fa5ff06f          	j	800650 <vprintfmt+0x374>
  8006b0:	0e0dc463          	bltz	s11,800798 <vprintfmt+0x4bc>
  8006b4:	00144e03          	lbu	t3,1(s0)
  8006b8:	000c8413          	mv	s0,s9
  8006bc:	cd1ff06f          	j	80038c <vprintfmt+0xb0>
  8006c0:	00090593          	mv	a1,s2
  8006c4:	02500513          	li	a0,37
  8006c8:	000980e7          	jalr	s3
  8006cc:	fff44783          	lbu	a5,-1(s0)
  8006d0:	02500713          	li	a4,37
  8006d4:	00040c93          	mv	s9,s0
  8006d8:	c6e780e3          	beq	a5,a4,800338 <vprintfmt+0x5c>
  8006dc:	fffc8c93          	addi	s9,s9,-1
  8006e0:	fffcc783          	lbu	a5,-1(s9)
  8006e4:	fee79ce3          	bne	a5,a4,8006dc <vprintfmt+0x400>
  8006e8:	c51ff06f          	j	800338 <vprintfmt+0x5c>
  8006ec:	00040513          	mv	a0,s0
  8006f0:	000980e7          	jalr	s3
  8006f4:	ed9ff06f          	j	8005cc <vprintfmt+0x2f0>
  8006f8:	007a8793          	addi	a5,s5,7
  8006fc:	ff87f793          	andi	a5,a5,-8
  800700:	00878a93          	addi	s5,a5,8
  800704:	0007a603          	lw	a2,0(a5)
  800708:	0047a683          	lw	a3,4(a5)
  80070c:	00800713          	li	a4,8
  800710:	cf5ff06f          	j	800404 <vprintfmt+0x128>
  800714:	007a8793          	addi	a5,s5,7
  800718:	ff87f793          	andi	a5,a5,-8
  80071c:	00878a93          	addi	s5,a5,8
  800720:	0007a603          	lw	a2,0(a5)
  800724:	0047a683          	lw	a3,4(a5)
  800728:	00a00713          	li	a4,10
  80072c:	cd9ff06f          	j	800404 <vprintfmt+0x128>
  800730:	007a8793          	addi	a5,s5,7
  800734:	ff87f793          	andi	a5,a5,-8
  800738:	00878a93          	addi	s5,a5,8
  80073c:	0007a603          	lw	a2,0(a5)
  800740:	0047a683          	lw	a3,4(a5)
  800744:	01000713          	li	a4,16
  800748:	cbdff06f          	j	800404 <vprintfmt+0x128>
  80074c:	007a8793          	addi	a5,s5,7
  800750:	ff87f793          	andi	a5,a5,-8
  800754:	00878a93          	addi	s5,a5,8
  800758:	0007a603          	lw	a2,0(a5)
  80075c:	0047a683          	lw	a3,4(a5)
  800760:	cf1ff06f          	j	800450 <vprintfmt+0x174>
  800764:	00078693          	mv	a3,a5
  800768:	00000617          	auipc	a2,0x0
  80076c:	44860613          	addi	a2,a2,1096 # 800bb0 <error_string+0x124>
  800770:	00090593          	mv	a1,s2
  800774:	00098513          	mv	a0,s3
  800778:	078000ef          	jal	ra,8007f0 <printfmt>
  80077c:	bbdff06f          	j	800338 <vprintfmt+0x5c>
  800780:	00044783          	lbu	a5,0(s0)
  800784:	00140a93          	addi	s5,s0,1
  800788:	00078513          	mv	a0,a5
  80078c:	e4078ce3          	beqz	a5,8005e4 <vprintfmt+0x308>
  800790:	03f00413          	li	s0,63
  800794:	e19ff06f          	j	8005ac <vprintfmt+0x2d0>
  800798:	00000d93          	li	s11,0
  80079c:	f19ff06f          	j	8006b4 <vprintfmt+0x3d8>
  8007a0:	03b05c63          	blez	s11,8007d8 <vprintfmt+0x4fc>
  8007a4:	02d00793          	li	a5,45
  8007a8:	00000417          	auipc	s0,0x0
  8007ac:	40040413          	addi	s0,s0,1024 # 800ba8 <error_string+0x11c>
  8007b0:	daf818e3          	bne	a6,a5,800560 <vprintfmt+0x284>
  8007b4:	00000a97          	auipc	s5,0x0
  8007b8:	3f5a8a93          	addi	s5,s5,1013 # 800ba9 <error_string+0x11d>
  8007bc:	000c0513          	mv	a0,s8
  8007c0:	000c0793          	mv	a5,s8
  8007c4:	03f00413          	li	s0,63
  8007c8:	de5ff06f          	j	8005ac <vprintfmt+0x2d0>
  8007cc:	00070e13          	mv	t3,a4
  8007d0:	000c8413          	mv	s0,s9
  8007d4:	e7dff06f          	j	800650 <vprintfmt+0x374>
  8007d8:	000c0793          	mv	a5,s8
  8007dc:	000c0513          	mv	a0,s8
  8007e0:	00000a97          	auipc	s5,0x0
  8007e4:	3c9a8a93          	addi	s5,s5,969 # 800ba9 <error_string+0x11d>
  8007e8:	03f00413          	li	s0,63
  8007ec:	dc1ff06f          	j	8005ac <vprintfmt+0x2d0>

008007f0 <printfmt>:
  8007f0:	fc010113          	addi	sp,sp,-64
  8007f4:	02c10313          	addi	t1,sp,44
  8007f8:	02d12623          	sw	a3,44(sp)
  8007fc:	00030693          	mv	a3,t1
  800800:	00112e23          	sw	ra,28(sp)
  800804:	02e12823          	sw	a4,48(sp)
  800808:	02f12a23          	sw	a5,52(sp)
  80080c:	03012c23          	sw	a6,56(sp)
  800810:	03112e23          	sw	a7,60(sp)
  800814:	00612623          	sw	t1,12(sp)
  800818:	ac5ff0ef          	jal	ra,8002dc <vprintfmt>
  80081c:	01c12083          	lw	ra,28(sp)
  800820:	04010113          	addi	sp,sp,64
  800824:	00008067          	ret

00800828 <main>:
  800828:	ff010113          	addi	sp,sp,-16
  80082c:	00000517          	auipc	a0,0x0
  800830:	39450513          	addi	a0,a0,916 # 800bc0 <error_string+0x134>
  800834:	00112623          	sw	ra,12(sp)
  800838:	955ff0ef          	jal	ra,80018c <cprintf>
  80083c:	00000597          	auipc	a1,0x0
  800840:	7c458593          	addi	a1,a1,1988 # 801000 <bigarray>
  800844:	00058793          	mv	a5,a1
  800848:	00000693          	li	a3,0
  80084c:	00100637          	lui	a2,0x100
  800850:	0100006f          	j	800860 <main+0x38>
  800854:	00168693          	addi	a3,a3,1
  800858:	00478793          	addi	a5,a5,4
  80085c:	02c68263          	beq	a3,a2,800880 <main+0x58>
  800860:	0007a703          	lw	a4,0(a5)
  800864:	fe0708e3          	beqz	a4,800854 <main+0x2c>
  800868:	00000617          	auipc	a2,0x0
  80086c:	37860613          	addi	a2,a2,888 # 800be0 <error_string+0x154>
  800870:	00e00593          	li	a1,14
  800874:	00000517          	auipc	a0,0x0
  800878:	38c50513          	addi	a0,a0,908 # 800c00 <error_string+0x174>
  80087c:	fa4ff0ef          	jal	ra,800020 <__panic>
  800880:	00000717          	auipc	a4,0x0
  800884:	78070713          	addi	a4,a4,1920 # 801000 <bigarray>
  800888:	00000793          	li	a5,0
  80088c:	001006b7          	lui	a3,0x100
  800890:	00f72023          	sw	a5,0(a4)
  800894:	00178793          	addi	a5,a5,1
  800898:	00470713          	addi	a4,a4,4
  80089c:	fed79ae3          	bne	a5,a3,800890 <main+0x68>
  8008a0:	00000693          	li	a3,0
  8008a4:	00100737          	lui	a4,0x100
  8008a8:	0100006f          	j	8008b8 <main+0x90>
  8008ac:	00168693          	addi	a3,a3,1 # 100001 <__panic-0x70001f>
  8008b0:	00458593          	addi	a1,a1,4
  8008b4:	02e68263          	beq	a3,a4,8008d8 <main+0xb0>
  8008b8:	0005a783          	lw	a5,0(a1)
  8008bc:	fed788e3          	beq	a5,a3,8008ac <main+0x84>
  8008c0:	00000617          	auipc	a2,0x0
  8008c4:	35060613          	addi	a2,a2,848 # 800c10 <error_string+0x184>
  8008c8:	01600593          	li	a1,22
  8008cc:	00000517          	auipc	a0,0x0
  8008d0:	33450513          	addi	a0,a0,820 # 800c00 <error_string+0x174>
  8008d4:	f4cff0ef          	jal	ra,800020 <__panic>
  8008d8:	00000517          	auipc	a0,0x0
  8008dc:	36050513          	addi	a0,a0,864 # 800c38 <error_string+0x1ac>
  8008e0:	8adff0ef          	jal	ra,80018c <cprintf>
  8008e4:	00000517          	auipc	a0,0x0
  8008e8:	38850513          	addi	a0,a0,904 # 800c6c <error_string+0x1e0>
  8008ec:	8a1ff0ef          	jal	ra,80018c <cprintf>
  8008f0:	00000513          	li	a0,0
  8008f4:	00401297          	auipc	t0,0x401
  8008f8:	7002a623          	sw	zero,1804(t0) # c02000 <bigarray+0x401000>
  8008fc:	809ff0ef          	jal	ra,800104 <exit>
