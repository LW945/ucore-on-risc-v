
obj/__user_faultread.out:     file format elf32-littleriscv


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

00800098 <sys_putc>:
  800098:	00050593          	mv	a1,a0
  80009c:	01e00513          	li	a0,30
  8000a0:	f81ff06f          	j	800020 <syscall>

008000a4 <exit>:
  8000a4:	ff010113          	addi	sp,sp,-16
  8000a8:	00112623          	sw	ra,12(sp)
  8000ac:	fe1ff0ef          	jal	ra,80008c <sys_exit>
  8000b0:	00000517          	auipc	a0,0x0
  8000b4:	6ec50513          	addi	a0,a0,1772 # 80079c <main+0x8>
  8000b8:	040000ef          	jal	ra,8000f8 <cprintf>
  8000bc:	0000006f          	j	8000bc <exit+0x18>

008000c0 <_start>:
  8000c0:	090000ef          	jal	ra,800150 <umain>
  8000c4:	0000006f          	j	8000c4 <_start+0x4>

008000c8 <cputch>:
  8000c8:	ff010113          	addi	sp,sp,-16
  8000cc:	00112623          	sw	ra,12(sp)
  8000d0:	00812423          	sw	s0,8(sp)
  8000d4:	00058413          	mv	s0,a1
  8000d8:	fc1ff0ef          	jal	ra,800098 <sys_putc>
  8000dc:	00042783          	lw	a5,0(s0)
  8000e0:	00c12083          	lw	ra,12(sp)
  8000e4:	00178793          	addi	a5,a5,1
  8000e8:	00f42023          	sw	a5,0(s0)
  8000ec:	00812403          	lw	s0,8(sp)
  8000f0:	01010113          	addi	sp,sp,16
  8000f4:	00008067          	ret

008000f8 <cprintf>:
  8000f8:	fc010113          	addi	sp,sp,-64
  8000fc:	02410313          	addi	t1,sp,36
  800100:	02b12223          	sw	a1,36(sp)
  800104:	02c12423          	sw	a2,40(sp)
  800108:	02d12623          	sw	a3,44(sp)
  80010c:	00050613          	mv	a2,a0
  800110:	00c10593          	addi	a1,sp,12
  800114:	00000517          	auipc	a0,0x0
  800118:	fb450513          	addi	a0,a0,-76 # 8000c8 <cputch>
  80011c:	00030693          	mv	a3,t1
  800120:	00112e23          	sw	ra,28(sp)
  800124:	02e12823          	sw	a4,48(sp)
  800128:	02f12a23          	sw	a5,52(sp)
  80012c:	03012c23          	sw	a6,56(sp)
  800130:	03112e23          	sw	a7,60(sp)
  800134:	00612423          	sw	t1,8(sp)
  800138:	00012623          	sw	zero,12(sp)
  80013c:	10c000ef          	jal	ra,800248 <vprintfmt>
  800140:	01c12083          	lw	ra,28(sp)
  800144:	00c12503          	lw	a0,12(sp)
  800148:	04010113          	addi	sp,sp,64
  80014c:	00008067          	ret

00800150 <umain>:
  800150:	ff010113          	addi	sp,sp,-16
  800154:	00112623          	sw	ra,12(sp)
  800158:	63c000ef          	jal	ra,800794 <main>
  80015c:	f49ff0ef          	jal	ra,8000a4 <exit>

00800160 <strnlen>:
  800160:	00050693          	mv	a3,a0
  800164:	02058a63          	beqz	a1,800198 <strnlen+0x38>
  800168:	00054703          	lbu	a4,0(a0)
  80016c:	00150793          	addi	a5,a0,1
  800170:	02070463          	beqz	a4,800198 <strnlen+0x38>
  800174:	00b505b3          	add	a1,a0,a1
  800178:	0100006f          	j	800188 <strnlen+0x28>
  80017c:	00178793          	addi	a5,a5,1
  800180:	fff7c703          	lbu	a4,-1(a5)
  800184:	00070863          	beqz	a4,800194 <strnlen+0x34>
  800188:	40d78533          	sub	a0,a5,a3
  80018c:	feb798e3          	bne	a5,a1,80017c <strnlen+0x1c>
  800190:	00008067          	ret
  800194:	00008067          	ret
  800198:	00000513          	li	a0,0
  80019c:	00008067          	ret

008001a0 <printnum>:
  8001a0:	fe010113          	addi	sp,sp,-32
  8001a4:	00912a23          	sw	s1,20(sp)
  8001a8:	01212823          	sw	s2,16(sp)
  8001ac:	01312623          	sw	s3,12(sp)
  8001b0:	01412423          	sw	s4,8(sp)
  8001b4:	00112e23          	sw	ra,28(sp)
  8001b8:	00812c23          	sw	s0,24(sp)
  8001bc:	00050493          	mv	s1,a0
  8001c0:	00058913          	mv	s2,a1
  8001c4:	00080993          	mv	s3,a6
  8001c8:	02e67a33          	remu	s4,a2,a4
  8001cc:	04069e63          	bnez	a3,800228 <printnum+0x88>
  8001d0:	04e67c63          	bleu	a4,a2,800228 <printnum+0x88>
  8001d4:	fff78413          	addi	s0,a5,-1
  8001d8:	00805c63          	blez	s0,8001f0 <printnum+0x50>
  8001dc:	fff40413          	addi	s0,s0,-1
  8001e0:	00090593          	mv	a1,s2
  8001e4:	00098513          	mv	a0,s3
  8001e8:	000480e7          	jalr	s1
  8001ec:	fe0418e3          	bnez	s0,8001dc <printnum+0x3c>
  8001f0:	00000797          	auipc	a5,0x0
  8001f4:	77c78793          	addi	a5,a5,1916 # 80096c <error_string+0x64>
  8001f8:	014787b3          	add	a5,a5,s4
  8001fc:	00090593          	mv	a1,s2
  800200:	00048313          	mv	t1,s1
  800204:	01c12083          	lw	ra,28(sp)
  800208:	01812403          	lw	s0,24(sp)
  80020c:	01412483          	lw	s1,20(sp)
  800210:	01012903          	lw	s2,16(sp)
  800214:	00c12983          	lw	s3,12(sp)
  800218:	00812a03          	lw	s4,8(sp)
  80021c:	0007c503          	lbu	a0,0(a5)
  800220:	02010113          	addi	sp,sp,32
  800224:	00030067          	jr	t1
  800228:	02e65633          	divu	a2,a2,a4
  80022c:	00098813          	mv	a6,s3
  800230:	fff78793          	addi	a5,a5,-1
  800234:	00000693          	li	a3,0
  800238:	00090593          	mv	a1,s2
  80023c:	00048513          	mv	a0,s1
  800240:	f61ff0ef          	jal	ra,8001a0 <printnum>
  800244:	fadff06f          	j	8001f0 <printnum+0x50>

00800248 <vprintfmt>:
  800248:	fb010113          	addi	sp,sp,-80
  80024c:	05212023          	sw	s2,64(sp)
  800250:	03312e23          	sw	s3,60(sp)
  800254:	03412c23          	sw	s4,56(sp)
  800258:	03512a23          	sw	s5,52(sp)
  80025c:	03612823          	sw	s6,48(sp)
  800260:	03712623          	sw	s7,44(sp)
  800264:	03812423          	sw	s8,40(sp)
  800268:	03912223          	sw	s9,36(sp)
  80026c:	04112623          	sw	ra,76(sp)
  800270:	04812423          	sw	s0,72(sp)
  800274:	04912223          	sw	s1,68(sp)
  800278:	03a12023          	sw	s10,32(sp)
  80027c:	01b12e23          	sw	s11,28(sp)
  800280:	00050993          	mv	s3,a0
  800284:	00058913          	mv	s2,a1
  800288:	00060c93          	mv	s9,a2
  80028c:	00068a93          	mv	s5,a3
  800290:	00000a17          	auipc	s4,0x0
  800294:	520a0a13          	addi	s4,s4,1312 # 8007b0 <main+0x1c>
  800298:	02800c13          	li	s8,40
  80029c:	fff00b13          	li	s6,-1
  8002a0:	05e00b93          	li	s7,94
  8002a4:	000cc503          	lbu	a0,0(s9)
  8002a8:	02500493          	li	s1,37
  8002ac:	001c8413          	addi	s0,s9,1
  8002b0:	00950e63          	beq	a0,s1,8002cc <vprintfmt+0x84>
  8002b4:	06050463          	beqz	a0,80031c <vprintfmt+0xd4>
  8002b8:	00090593          	mv	a1,s2
  8002bc:	00140413          	addi	s0,s0,1
  8002c0:	000980e7          	jalr	s3
  8002c4:	fff44503          	lbu	a0,-1(s0)
  8002c8:	fe9516e3          	bne	a0,s1,8002b4 <vprintfmt+0x6c>
  8002cc:	00044e03          	lbu	t3,0(s0)
  8002d0:	fff00d13          	li	s10,-1
  8002d4:	02000813          	li	a6,32
  8002d8:	00000493          	li	s1,0
  8002dc:	00000593          	li	a1,0
  8002e0:	000d0d93          	mv	s11,s10
  8002e4:	05500693          	li	a3,85
  8002e8:	00100313          	li	t1,1
  8002ec:	03000893          	li	a7,48
  8002f0:	00900613          	li	a2,9
  8002f4:	02d00513          	li	a0,45
  8002f8:	fdde0713          	addi	a4,t3,-35
  8002fc:	0ff77713          	andi	a4,a4,255
  800300:	00140c93          	addi	s9,s0,1
  800304:	32e6e463          	bltu	a3,a4,80062c <vprintfmt+0x3e4>
  800308:	00271713          	slli	a4,a4,0x2
  80030c:	01470733          	add	a4,a4,s4
  800310:	00072783          	lw	a5,0(a4)
  800314:	014787b3          	add	a5,a5,s4
  800318:	00078067          	jr	a5
  80031c:	04c12083          	lw	ra,76(sp)
  800320:	04812403          	lw	s0,72(sp)
  800324:	04412483          	lw	s1,68(sp)
  800328:	04012903          	lw	s2,64(sp)
  80032c:	03c12983          	lw	s3,60(sp)
  800330:	03812a03          	lw	s4,56(sp)
  800334:	03412a83          	lw	s5,52(sp)
  800338:	03012b03          	lw	s6,48(sp)
  80033c:	02c12b83          	lw	s7,44(sp)
  800340:	02812c03          	lw	s8,40(sp)
  800344:	02412c83          	lw	s9,36(sp)
  800348:	02012d03          	lw	s10,32(sp)
  80034c:	01c12d83          	lw	s11,28(sp)
  800350:	05010113          	addi	sp,sp,80
  800354:	00008067          	ret
  800358:	00100793          	li	a5,1
  80035c:	34b7c063          	blt	a5,a1,80069c <vprintfmt+0x454>
  800360:	000aa603          	lw	a2,0(s5)
  800364:	00000693          	li	a3,0
  800368:	004a8a93          	addi	s5,s5,4
  80036c:	01000713          	li	a4,16
  800370:	000d8793          	mv	a5,s11
  800374:	00090593          	mv	a1,s2
  800378:	00098513          	mv	a0,s3
  80037c:	e25ff0ef          	jal	ra,8001a0 <printnum>
  800380:	f25ff06f          	j	8002a4 <vprintfmt+0x5c>
  800384:	00144e03          	lbu	t3,1(s0)
  800388:	00030493          	mv	s1,t1
  80038c:	000c8413          	mv	s0,s9
  800390:	f69ff06f          	j	8002f8 <vprintfmt+0xb0>
  800394:	000aa503          	lw	a0,0(s5)
  800398:	00090593          	mv	a1,s2
  80039c:	004a8a93          	addi	s5,s5,4
  8003a0:	000980e7          	jalr	s3
  8003a4:	f01ff06f          	j	8002a4 <vprintfmt+0x5c>
  8003a8:	00100793          	li	a5,1
  8003ac:	30b7c663          	blt	a5,a1,8006b8 <vprintfmt+0x470>
  8003b0:	000aa603          	lw	a2,0(s5)
  8003b4:	004a8a93          	addi	s5,s5,4
  8003b8:	41f65693          	srai	a3,a2,0x1f
  8003bc:	00a00713          	li	a4,10
  8003c0:	fa06d8e3          	bgez	a3,800370 <vprintfmt+0x128>
  8003c4:	00090593          	mv	a1,s2
  8003c8:	02d00513          	li	a0,45
  8003cc:	00d12623          	sw	a3,12(sp)
  8003d0:	00c12423          	sw	a2,8(sp)
  8003d4:	00e12223          	sw	a4,4(sp)
  8003d8:	01012023          	sw	a6,0(sp)
  8003dc:	000980e7          	jalr	s3
  8003e0:	00812603          	lw	a2,8(sp)
  8003e4:	00c12683          	lw	a3,12(sp)
  8003e8:	00012803          	lw	a6,0(sp)
  8003ec:	40c00633          	neg	a2,a2
  8003f0:	00c037b3          	snez	a5,a2
  8003f4:	40d006b3          	neg	a3,a3
  8003f8:	40f686b3          	sub	a3,a3,a5
  8003fc:	00412703          	lw	a4,4(sp)
  800400:	f71ff06f          	j	800370 <vprintfmt+0x128>
  800404:	000aa783          	lw	a5,0(s5)
  800408:	01800693          	li	a3,24
  80040c:	004a8a93          	addi	s5,s5,4
  800410:	41f7d713          	srai	a4,a5,0x1f
  800414:	00f747b3          	xor	a5,a4,a5
  800418:	40e787b3          	sub	a5,a5,a4
  80041c:	2af6ca63          	blt	a3,a5,8006d0 <vprintfmt+0x488>
  800420:	00279693          	slli	a3,a5,0x2
  800424:	00000717          	auipc	a4,0x0
  800428:	4e470713          	addi	a4,a4,1252 # 800908 <error_string>
  80042c:	00d70733          	add	a4,a4,a3
  800430:	00072683          	lw	a3,0(a4)
  800434:	28068e63          	beqz	a3,8006d0 <vprintfmt+0x488>
  800438:	00000617          	auipc	a2,0x0
  80043c:	60060613          	addi	a2,a2,1536 # 800a38 <error_string+0x130>
  800440:	00090593          	mv	a1,s2
  800444:	00098513          	mv	a0,s3
  800448:	314000ef          	jal	ra,80075c <printfmt>
  80044c:	e59ff06f          	j	8002a4 <vprintfmt+0x5c>
  800450:	00144e03          	lbu	t3,1(s0)
  800454:	00158593          	addi	a1,a1,1
  800458:	000c8413          	mv	s0,s9
  80045c:	e9dff06f          	j	8002f8 <vprintfmt+0xb0>
  800460:	00100793          	li	a5,1
  800464:	20b7c063          	blt	a5,a1,800664 <vprintfmt+0x41c>
  800468:	000aa603          	lw	a2,0(s5)
  80046c:	00000693          	li	a3,0
  800470:	004a8a93          	addi	s5,s5,4
  800474:	00800713          	li	a4,8
  800478:	ef9ff06f          	j	800370 <vprintfmt+0x128>
  80047c:	03000513          	li	a0,48
  800480:	00090593          	mv	a1,s2
  800484:	01012023          	sw	a6,0(sp)
  800488:	000980e7          	jalr	s3
  80048c:	00090593          	mv	a1,s2
  800490:	07800513          	li	a0,120
  800494:	000980e7          	jalr	s3
  800498:	000aa603          	lw	a2,0(s5)
  80049c:	00000693          	li	a3,0
  8004a0:	01000713          	li	a4,16
  8004a4:	004a8a93          	addi	s5,s5,4
  8004a8:	00012803          	lw	a6,0(sp)
  8004ac:	ec5ff06f          	j	800370 <vprintfmt+0x128>
  8004b0:	000aa403          	lw	s0,0(s5)
  8004b4:	004a8793          	addi	a5,s5,4
  8004b8:	00f12223          	sw	a5,4(sp)
  8004bc:	24040863          	beqz	s0,80070c <vprintfmt+0x4c4>
  8004c0:	05b05263          	blez	s11,800504 <vprintfmt+0x2bc>
  8004c4:	02d00793          	li	a5,45
  8004c8:	22f80263          	beq	a6,a5,8006ec <vprintfmt+0x4a4>
  8004cc:	000d0593          	mv	a1,s10
  8004d0:	00040513          	mv	a0,s0
  8004d4:	01012023          	sw	a6,0(sp)
  8004d8:	c89ff0ef          	jal	ra,800160 <strnlen>
  8004dc:	40ad8db3          	sub	s11,s11,a0
  8004e0:	03b05263          	blez	s11,800504 <vprintfmt+0x2bc>
  8004e4:	00012803          	lw	a6,0(sp)
  8004e8:	00080513          	mv	a0,a6
  8004ec:	00090593          	mv	a1,s2
  8004f0:	01012023          	sw	a6,0(sp)
  8004f4:	fffd8d93          	addi	s11,s11,-1
  8004f8:	000980e7          	jalr	s3
  8004fc:	00012803          	lw	a6,0(sp)
  800500:	fe0d94e3          	bnez	s11,8004e8 <vprintfmt+0x2a0>
  800504:	00044783          	lbu	a5,0(s0)
  800508:	00140a93          	addi	s5,s0,1
  80050c:	00078513          	mv	a0,a5
  800510:	04078c63          	beqz	a5,800568 <vprintfmt+0x320>
  800514:	03f00413          	li	s0,63
  800518:	000d4663          	bltz	s10,800524 <vprintfmt+0x2dc>
  80051c:	fffd0d13          	addi	s10,s10,-1
  800520:	036d0663          	beq	s10,s6,80054c <vprintfmt+0x304>
  800524:	00090593          	mv	a1,s2
  800528:	00048663          	beqz	s1,800534 <vprintfmt+0x2ec>
  80052c:	fe078793          	addi	a5,a5,-32
  800530:	12fbe463          	bltu	s7,a5,800658 <vprintfmt+0x410>
  800534:	000980e7          	jalr	s3
  800538:	001a8a93          	addi	s5,s5,1
  80053c:	fffac783          	lbu	a5,-1(s5)
  800540:	fffd8d93          	addi	s11,s11,-1
  800544:	00078513          	mv	a0,a5
  800548:	fc0798e3          	bnez	a5,800518 <vprintfmt+0x2d0>
  80054c:	01b05e63          	blez	s11,800568 <vprintfmt+0x320>
  800550:	02000413          	li	s0,32
  800554:	fffd8d93          	addi	s11,s11,-1
  800558:	00090593          	mv	a1,s2
  80055c:	00040513          	mv	a0,s0
  800560:	000980e7          	jalr	s3
  800564:	fe0d98e3          	bnez	s11,800554 <vprintfmt+0x30c>
  800568:	00412a83          	lw	s5,4(sp)
  80056c:	d39ff06f          	j	8002a4 <vprintfmt+0x5c>
  800570:	00100793          	li	a5,1
  800574:	10b7c663          	blt	a5,a1,800680 <vprintfmt+0x438>
  800578:	000aa603          	lw	a2,0(s5)
  80057c:	00000693          	li	a3,0
  800580:	004a8a93          	addi	s5,s5,4
  800584:	00a00713          	li	a4,10
  800588:	de9ff06f          	j	800370 <vprintfmt+0x128>
  80058c:	00144e03          	lbu	t3,1(s0)
  800590:	00050813          	mv	a6,a0
  800594:	000c8413          	mv	s0,s9
  800598:	d61ff06f          	j	8002f8 <vprintfmt+0xb0>
  80059c:	00090593          	mv	a1,s2
  8005a0:	02500513          	li	a0,37
  8005a4:	000980e7          	jalr	s3
  8005a8:	cfdff06f          	j	8002a4 <vprintfmt+0x5c>
  8005ac:	000aad03          	lw	s10,0(s5)
  8005b0:	00144e03          	lbu	t3,1(s0)
  8005b4:	004a8a93          	addi	s5,s5,4
  8005b8:	000c8413          	mv	s0,s9
  8005bc:	d20ddee3          	bgez	s11,8002f8 <vprintfmt+0xb0>
  8005c0:	000d0d93          	mv	s11,s10
  8005c4:	fff00d13          	li	s10,-1
  8005c8:	d31ff06f          	j	8002f8 <vprintfmt+0xb0>
  8005cc:	00144e03          	lbu	t3,1(s0)
  8005d0:	00088813          	mv	a6,a7
  8005d4:	000c8413          	mv	s0,s9
  8005d8:	d21ff06f          	j	8002f8 <vprintfmt+0xb0>
  8005dc:	00144703          	lbu	a4,1(s0)
  8005e0:	fd0e0d13          	addi	s10,t3,-48
  8005e4:	fd070793          	addi	a5,a4,-48
  8005e8:	14f66863          	bltu	a2,a5,800738 <vprintfmt+0x4f0>
  8005ec:	000c8413          	mv	s0,s9
  8005f0:	002d1793          	slli	a5,s10,0x2
  8005f4:	01a78d33          	add	s10,a5,s10
  8005f8:	00140413          	addi	s0,s0,1
  8005fc:	001d1d13          	slli	s10,s10,0x1
  800600:	00ed0d33          	add	s10,s10,a4
  800604:	00044703          	lbu	a4,0(s0)
  800608:	fd0d0d13          	addi	s10,s10,-48
  80060c:	fd070793          	addi	a5,a4,-48
  800610:	fef670e3          	bleu	a5,a2,8005f0 <vprintfmt+0x3a8>
  800614:	00070e13          	mv	t3,a4
  800618:	fa5ff06f          	j	8005bc <vprintfmt+0x374>
  80061c:	0e0dc463          	bltz	s11,800704 <vprintfmt+0x4bc>
  800620:	00144e03          	lbu	t3,1(s0)
  800624:	000c8413          	mv	s0,s9
  800628:	cd1ff06f          	j	8002f8 <vprintfmt+0xb0>
  80062c:	00090593          	mv	a1,s2
  800630:	02500513          	li	a0,37
  800634:	000980e7          	jalr	s3
  800638:	fff44783          	lbu	a5,-1(s0)
  80063c:	02500713          	li	a4,37
  800640:	00040c93          	mv	s9,s0
  800644:	c6e780e3          	beq	a5,a4,8002a4 <vprintfmt+0x5c>
  800648:	fffc8c93          	addi	s9,s9,-1
  80064c:	fffcc783          	lbu	a5,-1(s9)
  800650:	fee79ce3          	bne	a5,a4,800648 <vprintfmt+0x400>
  800654:	c51ff06f          	j	8002a4 <vprintfmt+0x5c>
  800658:	00040513          	mv	a0,s0
  80065c:	000980e7          	jalr	s3
  800660:	ed9ff06f          	j	800538 <vprintfmt+0x2f0>
  800664:	007a8793          	addi	a5,s5,7
  800668:	ff87f793          	andi	a5,a5,-8
  80066c:	00878a93          	addi	s5,a5,8
  800670:	0007a603          	lw	a2,0(a5)
  800674:	0047a683          	lw	a3,4(a5)
  800678:	00800713          	li	a4,8
  80067c:	cf5ff06f          	j	800370 <vprintfmt+0x128>
  800680:	007a8793          	addi	a5,s5,7
  800684:	ff87f793          	andi	a5,a5,-8
  800688:	00878a93          	addi	s5,a5,8
  80068c:	0007a603          	lw	a2,0(a5)
  800690:	0047a683          	lw	a3,4(a5)
  800694:	00a00713          	li	a4,10
  800698:	cd9ff06f          	j	800370 <vprintfmt+0x128>
  80069c:	007a8793          	addi	a5,s5,7
  8006a0:	ff87f793          	andi	a5,a5,-8
  8006a4:	00878a93          	addi	s5,a5,8
  8006a8:	0007a603          	lw	a2,0(a5)
  8006ac:	0047a683          	lw	a3,4(a5)
  8006b0:	01000713          	li	a4,16
  8006b4:	cbdff06f          	j	800370 <vprintfmt+0x128>
  8006b8:	007a8793          	addi	a5,s5,7
  8006bc:	ff87f793          	andi	a5,a5,-8
  8006c0:	00878a93          	addi	s5,a5,8
  8006c4:	0007a603          	lw	a2,0(a5)
  8006c8:	0047a683          	lw	a3,4(a5)
  8006cc:	cf1ff06f          	j	8003bc <vprintfmt+0x174>
  8006d0:	00078693          	mv	a3,a5
  8006d4:	00000617          	auipc	a2,0x0
  8006d8:	35860613          	addi	a2,a2,856 # 800a2c <error_string+0x124>
  8006dc:	00090593          	mv	a1,s2
  8006e0:	00098513          	mv	a0,s3
  8006e4:	078000ef          	jal	ra,80075c <printfmt>
  8006e8:	bbdff06f          	j	8002a4 <vprintfmt+0x5c>
  8006ec:	00044783          	lbu	a5,0(s0)
  8006f0:	00140a93          	addi	s5,s0,1
  8006f4:	00078513          	mv	a0,a5
  8006f8:	e4078ce3          	beqz	a5,800550 <vprintfmt+0x308>
  8006fc:	03f00413          	li	s0,63
  800700:	e19ff06f          	j	800518 <vprintfmt+0x2d0>
  800704:	00000d93          	li	s11,0
  800708:	f19ff06f          	j	800620 <vprintfmt+0x3d8>
  80070c:	03b05c63          	blez	s11,800744 <vprintfmt+0x4fc>
  800710:	02d00793          	li	a5,45
  800714:	00000417          	auipc	s0,0x0
  800718:	31040413          	addi	s0,s0,784 # 800a24 <error_string+0x11c>
  80071c:	daf818e3          	bne	a6,a5,8004cc <vprintfmt+0x284>
  800720:	00000a97          	auipc	s5,0x0
  800724:	305a8a93          	addi	s5,s5,773 # 800a25 <error_string+0x11d>
  800728:	000c0513          	mv	a0,s8
  80072c:	000c0793          	mv	a5,s8
  800730:	03f00413          	li	s0,63
  800734:	de5ff06f          	j	800518 <vprintfmt+0x2d0>
  800738:	00070e13          	mv	t3,a4
  80073c:	000c8413          	mv	s0,s9
  800740:	e7dff06f          	j	8005bc <vprintfmt+0x374>
  800744:	000c0793          	mv	a5,s8
  800748:	000c0513          	mv	a0,s8
  80074c:	00000a97          	auipc	s5,0x0
  800750:	2d9a8a93          	addi	s5,s5,729 # 800a25 <error_string+0x11d>
  800754:	03f00413          	li	s0,63
  800758:	dc1ff06f          	j	800518 <vprintfmt+0x2d0>

0080075c <printfmt>:
  80075c:	fc010113          	addi	sp,sp,-64
  800760:	02c10313          	addi	t1,sp,44
  800764:	02d12623          	sw	a3,44(sp)
  800768:	00030693          	mv	a3,t1
  80076c:	00112e23          	sw	ra,28(sp)
  800770:	02e12823          	sw	a4,48(sp)
  800774:	02f12a23          	sw	a5,52(sp)
  800778:	03012c23          	sw	a6,56(sp)
  80077c:	03112e23          	sw	a7,60(sp)
  800780:	00612623          	sw	t1,12(sp)
  800784:	ac5ff0ef          	jal	ra,800248 <vprintfmt>
  800788:	01c12083          	lw	ra,28(sp)
  80078c:	04010113          	addi	sp,sp,64
  800790:	00008067          	ret

00800794 <main>:
  800794:	00002783          	lw	a5,0(zero) # 0 <__STAB_BEGIN__-0x200010>
  800798:	00100073          	ebreak
