
obj/__user_priority.out:     file format elf32-littleriscv


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
  800040:	a9850513          	addi	a0,a0,-1384 # 800ad4 <main+0x238>
  800044:	00112e23          	sw	ra,28(sp)
  800048:	02d12623          	sw	a3,44(sp)
  80004c:	02e12823          	sw	a4,48(sp)
  800050:	03012c23          	sw	a6,56(sp)
  800054:	03112e23          	sw	a7,60(sp)
  800058:	00f12623          	sw	a5,12(sp)
  80005c:	188000ef          	jal	ra,8001e4 <cprintf>
  800060:	00c12583          	lw	a1,12(sp)
  800064:	00040513          	mv	a0,s0
  800068:	148000ef          	jal	ra,8001b0 <vcprintf>
  80006c:	00001517          	auipc	a0,0x1
  800070:	d6850513          	addi	a0,a0,-664 # 800dd4 <error_string+0x178>
  800074:	170000ef          	jal	ra,8001e4 <cprintf>
  800078:	ff600513          	li	a0,-10
  80007c:	0c8000ef          	jal	ra,800144 <exit>

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

00800110 <sys_kill>:
  800110:	00050593          	mv	a1,a0
  800114:	00c00513          	li	a0,12
  800118:	f69ff06f          	j	800080 <syscall>

0080011c <sys_getpid>:
  80011c:	01200513          	li	a0,18
  800120:	f61ff06f          	j	800080 <syscall>

00800124 <sys_putc>:
  800124:	00050593          	mv	a1,a0
  800128:	01e00513          	li	a0,30
  80012c:	f55ff06f          	j	800080 <syscall>

00800130 <sys_gettime>:
  800130:	01100513          	li	a0,17
  800134:	f4dff06f          	j	800080 <syscall>

00800138 <sys_lab6_set_priority>:
  800138:	00050593          	mv	a1,a0
  80013c:	0ff00513          	li	a0,255
  800140:	f41ff06f          	j	800080 <syscall>

00800144 <exit>:
  800144:	ff010113          	addi	sp,sp,-16
  800148:	00112623          	sw	ra,12(sp)
  80014c:	fa1ff0ef          	jal	ra,8000ec <sys_exit>
  800150:	00001517          	auipc	a0,0x1
  800154:	9a050513          	addi	a0,a0,-1632 # 800af0 <main+0x254>
  800158:	08c000ef          	jal	ra,8001e4 <cprintf>
  80015c:	0000006f          	j	80015c <exit+0x18>

00800160 <fork>:
  800160:	f99ff06f          	j	8000f8 <sys_fork>

00800164 <waitpid>:
  800164:	f9dff06f          	j	800100 <sys_wait>

00800168 <kill>:
  800168:	fa9ff06f          	j	800110 <sys_kill>

0080016c <getpid>:
  80016c:	fb1ff06f          	j	80011c <sys_getpid>

00800170 <gettime_msec>:
  800170:	fc1ff06f          	j	800130 <sys_gettime>

00800174 <lab6_set_priority>:
  800174:	fc5ff06f          	j	800138 <sys_lab6_set_priority>

00800178 <_start>:
  800178:	0c4000ef          	jal	ra,80023c <umain>
  80017c:	0000006f          	j	80017c <_start+0x4>

00800180 <cputch>:
  800180:	ff010113          	addi	sp,sp,-16
  800184:	00112623          	sw	ra,12(sp)
  800188:	00812423          	sw	s0,8(sp)
  80018c:	00058413          	mv	s0,a1
  800190:	f95ff0ef          	jal	ra,800124 <sys_putc>
  800194:	00042783          	lw	a5,0(s0)
  800198:	00c12083          	lw	ra,12(sp)
  80019c:	00178793          	addi	a5,a5,1
  8001a0:	00f42023          	sw	a5,0(s0)
  8001a4:	00812403          	lw	s0,8(sp)
  8001a8:	01010113          	addi	sp,sp,16
  8001ac:	00008067          	ret

008001b0 <vcprintf>:
  8001b0:	fe010113          	addi	sp,sp,-32
  8001b4:	00058693          	mv	a3,a1
  8001b8:	00050613          	mv	a2,a0
  8001bc:	00c10593          	addi	a1,sp,12
  8001c0:	00000517          	auipc	a0,0x0
  8001c4:	fc050513          	addi	a0,a0,-64 # 800180 <cputch>
  8001c8:	00112e23          	sw	ra,28(sp)
  8001cc:	00012623          	sw	zero,12(sp)
  8001d0:	180000ef          	jal	ra,800350 <vprintfmt>
  8001d4:	01c12083          	lw	ra,28(sp)
  8001d8:	00c12503          	lw	a0,12(sp)
  8001dc:	02010113          	addi	sp,sp,32
  8001e0:	00008067          	ret

008001e4 <cprintf>:
  8001e4:	fc010113          	addi	sp,sp,-64
  8001e8:	02410313          	addi	t1,sp,36
  8001ec:	02b12223          	sw	a1,36(sp)
  8001f0:	02c12423          	sw	a2,40(sp)
  8001f4:	02d12623          	sw	a3,44(sp)
  8001f8:	00050613          	mv	a2,a0
  8001fc:	00c10593          	addi	a1,sp,12
  800200:	00000517          	auipc	a0,0x0
  800204:	f8050513          	addi	a0,a0,-128 # 800180 <cputch>
  800208:	00030693          	mv	a3,t1
  80020c:	00112e23          	sw	ra,28(sp)
  800210:	02e12823          	sw	a4,48(sp)
  800214:	02f12a23          	sw	a5,52(sp)
  800218:	03012c23          	sw	a6,56(sp)
  80021c:	03112e23          	sw	a7,60(sp)
  800220:	00612423          	sw	t1,8(sp)
  800224:	00012623          	sw	zero,12(sp)
  800228:	128000ef          	jal	ra,800350 <vprintfmt>
  80022c:	01c12083          	lw	ra,28(sp)
  800230:	00c12503          	lw	a0,12(sp)
  800234:	04010113          	addi	sp,sp,64
  800238:	00008067          	ret

0080023c <umain>:
  80023c:	ff010113          	addi	sp,sp,-16
  800240:	00112623          	sw	ra,12(sp)
  800244:	658000ef          	jal	ra,80089c <main>
  800248:	efdff0ef          	jal	ra,800144 <exit>

0080024c <strnlen>:
  80024c:	00050693          	mv	a3,a0
  800250:	02058a63          	beqz	a1,800284 <strnlen+0x38>
  800254:	00054703          	lbu	a4,0(a0)
  800258:	00150793          	addi	a5,a0,1
  80025c:	02070463          	beqz	a4,800284 <strnlen+0x38>
  800260:	00b505b3          	add	a1,a0,a1
  800264:	0100006f          	j	800274 <strnlen+0x28>
  800268:	00178793          	addi	a5,a5,1
  80026c:	fff7c703          	lbu	a4,-1(a5)
  800270:	00070863          	beqz	a4,800280 <strnlen+0x34>
  800274:	40d78533          	sub	a0,a5,a3
  800278:	feb798e3          	bne	a5,a1,800268 <strnlen+0x1c>
  80027c:	00008067          	ret
  800280:	00008067          	ret
  800284:	00000513          	li	a0,0
  800288:	00008067          	ret

0080028c <memset>:
  80028c:	00c50733          	add	a4,a0,a2
  800290:	00050793          	mv	a5,a0
  800294:	00060863          	beqz	a2,8002a4 <memset+0x18>
  800298:	00178793          	addi	a5,a5,1
  80029c:	feb78fa3          	sb	a1,-1(a5)
  8002a0:	fef71ce3          	bne	a4,a5,800298 <memset+0xc>
  8002a4:	00008067          	ret

008002a8 <printnum>:
  8002a8:	fe010113          	addi	sp,sp,-32
  8002ac:	00912a23          	sw	s1,20(sp)
  8002b0:	01212823          	sw	s2,16(sp)
  8002b4:	01312623          	sw	s3,12(sp)
  8002b8:	01412423          	sw	s4,8(sp)
  8002bc:	00112e23          	sw	ra,28(sp)
  8002c0:	00812c23          	sw	s0,24(sp)
  8002c4:	00050493          	mv	s1,a0
  8002c8:	00058913          	mv	s2,a1
  8002cc:	00080993          	mv	s3,a6
  8002d0:	02e67a33          	remu	s4,a2,a4
  8002d4:	04069e63          	bnez	a3,800330 <printnum+0x88>
  8002d8:	04e67c63          	bleu	a4,a2,800330 <printnum+0x88>
  8002dc:	fff78413          	addi	s0,a5,-1
  8002e0:	00805c63          	blez	s0,8002f8 <printnum+0x50>
  8002e4:	fff40413          	addi	s0,s0,-1
  8002e8:	00090593          	mv	a1,s2
  8002ec:	00098513          	mv	a0,s3
  8002f0:	000480e7          	jalr	s1
  8002f4:	fe0418e3          	bnez	s0,8002e4 <printnum+0x3c>
  8002f8:	00001797          	auipc	a5,0x1
  8002fc:	9c878793          	addi	a5,a5,-1592 # 800cc0 <error_string+0x64>
  800300:	014787b3          	add	a5,a5,s4
  800304:	00090593          	mv	a1,s2
  800308:	00048313          	mv	t1,s1
  80030c:	01c12083          	lw	ra,28(sp)
  800310:	01812403          	lw	s0,24(sp)
  800314:	01412483          	lw	s1,20(sp)
  800318:	01012903          	lw	s2,16(sp)
  80031c:	00c12983          	lw	s3,12(sp)
  800320:	00812a03          	lw	s4,8(sp)
  800324:	0007c503          	lbu	a0,0(a5)
  800328:	02010113          	addi	sp,sp,32
  80032c:	00030067          	jr	t1
  800330:	02e65633          	divu	a2,a2,a4
  800334:	00098813          	mv	a6,s3
  800338:	fff78793          	addi	a5,a5,-1
  80033c:	00000693          	li	a3,0
  800340:	00090593          	mv	a1,s2
  800344:	00048513          	mv	a0,s1
  800348:	f61ff0ef          	jal	ra,8002a8 <printnum>
  80034c:	fadff06f          	j	8002f8 <printnum+0x50>

00800350 <vprintfmt>:
  800350:	fb010113          	addi	sp,sp,-80
  800354:	05212023          	sw	s2,64(sp)
  800358:	03312e23          	sw	s3,60(sp)
  80035c:	03412c23          	sw	s4,56(sp)
  800360:	03512a23          	sw	s5,52(sp)
  800364:	03612823          	sw	s6,48(sp)
  800368:	03712623          	sw	s7,44(sp)
  80036c:	03812423          	sw	s8,40(sp)
  800370:	03912223          	sw	s9,36(sp)
  800374:	04112623          	sw	ra,76(sp)
  800378:	04812423          	sw	s0,72(sp)
  80037c:	04912223          	sw	s1,68(sp)
  800380:	03a12023          	sw	s10,32(sp)
  800384:	01b12e23          	sw	s11,28(sp)
  800388:	00050993          	mv	s3,a0
  80038c:	00058913          	mv	s2,a1
  800390:	00060c93          	mv	s9,a2
  800394:	00068a93          	mv	s5,a3
  800398:	00000a17          	auipc	s4,0x0
  80039c:	76ca0a13          	addi	s4,s4,1900 # 800b04 <main+0x268>
  8003a0:	02800c13          	li	s8,40
  8003a4:	fff00b13          	li	s6,-1
  8003a8:	05e00b93          	li	s7,94
  8003ac:	000cc503          	lbu	a0,0(s9)
  8003b0:	02500493          	li	s1,37
  8003b4:	001c8413          	addi	s0,s9,1
  8003b8:	00950e63          	beq	a0,s1,8003d4 <vprintfmt+0x84>
  8003bc:	06050463          	beqz	a0,800424 <vprintfmt+0xd4>
  8003c0:	00090593          	mv	a1,s2
  8003c4:	00140413          	addi	s0,s0,1
  8003c8:	000980e7          	jalr	s3
  8003cc:	fff44503          	lbu	a0,-1(s0)
  8003d0:	fe9516e3          	bne	a0,s1,8003bc <vprintfmt+0x6c>
  8003d4:	00044e03          	lbu	t3,0(s0)
  8003d8:	fff00d13          	li	s10,-1
  8003dc:	02000813          	li	a6,32
  8003e0:	00000493          	li	s1,0
  8003e4:	00000593          	li	a1,0
  8003e8:	000d0d93          	mv	s11,s10
  8003ec:	05500693          	li	a3,85
  8003f0:	00100313          	li	t1,1
  8003f4:	03000893          	li	a7,48
  8003f8:	00900613          	li	a2,9
  8003fc:	02d00513          	li	a0,45
  800400:	fdde0713          	addi	a4,t3,-35
  800404:	0ff77713          	andi	a4,a4,255
  800408:	00140c93          	addi	s9,s0,1
  80040c:	32e6e463          	bltu	a3,a4,800734 <vprintfmt+0x3e4>
  800410:	00271713          	slli	a4,a4,0x2
  800414:	01470733          	add	a4,a4,s4
  800418:	00072783          	lw	a5,0(a4)
  80041c:	014787b3          	add	a5,a5,s4
  800420:	00078067          	jr	a5
  800424:	04c12083          	lw	ra,76(sp)
  800428:	04812403          	lw	s0,72(sp)
  80042c:	04412483          	lw	s1,68(sp)
  800430:	04012903          	lw	s2,64(sp)
  800434:	03c12983          	lw	s3,60(sp)
  800438:	03812a03          	lw	s4,56(sp)
  80043c:	03412a83          	lw	s5,52(sp)
  800440:	03012b03          	lw	s6,48(sp)
  800444:	02c12b83          	lw	s7,44(sp)
  800448:	02812c03          	lw	s8,40(sp)
  80044c:	02412c83          	lw	s9,36(sp)
  800450:	02012d03          	lw	s10,32(sp)
  800454:	01c12d83          	lw	s11,28(sp)
  800458:	05010113          	addi	sp,sp,80
  80045c:	00008067          	ret
  800460:	00100793          	li	a5,1
  800464:	34b7c063          	blt	a5,a1,8007a4 <vprintfmt+0x454>
  800468:	000aa603          	lw	a2,0(s5)
  80046c:	00000693          	li	a3,0
  800470:	004a8a93          	addi	s5,s5,4
  800474:	01000713          	li	a4,16
  800478:	000d8793          	mv	a5,s11
  80047c:	00090593          	mv	a1,s2
  800480:	00098513          	mv	a0,s3
  800484:	e25ff0ef          	jal	ra,8002a8 <printnum>
  800488:	f25ff06f          	j	8003ac <vprintfmt+0x5c>
  80048c:	00144e03          	lbu	t3,1(s0)
  800490:	00030493          	mv	s1,t1
  800494:	000c8413          	mv	s0,s9
  800498:	f69ff06f          	j	800400 <vprintfmt+0xb0>
  80049c:	000aa503          	lw	a0,0(s5)
  8004a0:	00090593          	mv	a1,s2
  8004a4:	004a8a93          	addi	s5,s5,4
  8004a8:	000980e7          	jalr	s3
  8004ac:	f01ff06f          	j	8003ac <vprintfmt+0x5c>
  8004b0:	00100793          	li	a5,1
  8004b4:	30b7c663          	blt	a5,a1,8007c0 <vprintfmt+0x470>
  8004b8:	000aa603          	lw	a2,0(s5)
  8004bc:	004a8a93          	addi	s5,s5,4
  8004c0:	41f65693          	srai	a3,a2,0x1f
  8004c4:	00a00713          	li	a4,10
  8004c8:	fa06d8e3          	bgez	a3,800478 <vprintfmt+0x128>
  8004cc:	00090593          	mv	a1,s2
  8004d0:	02d00513          	li	a0,45
  8004d4:	00d12623          	sw	a3,12(sp)
  8004d8:	00c12423          	sw	a2,8(sp)
  8004dc:	00e12223          	sw	a4,4(sp)
  8004e0:	01012023          	sw	a6,0(sp)
  8004e4:	000980e7          	jalr	s3
  8004e8:	00812603          	lw	a2,8(sp)
  8004ec:	00c12683          	lw	a3,12(sp)
  8004f0:	00012803          	lw	a6,0(sp)
  8004f4:	40c00633          	neg	a2,a2
  8004f8:	00c037b3          	snez	a5,a2
  8004fc:	40d006b3          	neg	a3,a3
  800500:	40f686b3          	sub	a3,a3,a5
  800504:	00412703          	lw	a4,4(sp)
  800508:	f71ff06f          	j	800478 <vprintfmt+0x128>
  80050c:	000aa783          	lw	a5,0(s5)
  800510:	01800693          	li	a3,24
  800514:	004a8a93          	addi	s5,s5,4
  800518:	41f7d713          	srai	a4,a5,0x1f
  80051c:	00f747b3          	xor	a5,a4,a5
  800520:	40e787b3          	sub	a5,a5,a4
  800524:	2af6ca63          	blt	a3,a5,8007d8 <vprintfmt+0x488>
  800528:	00279693          	slli	a3,a5,0x2
  80052c:	00000717          	auipc	a4,0x0
  800530:	73070713          	addi	a4,a4,1840 # 800c5c <error_string>
  800534:	00d70733          	add	a4,a4,a3
  800538:	00072683          	lw	a3,0(a4)
  80053c:	28068e63          	beqz	a3,8007d8 <vprintfmt+0x488>
  800540:	00001617          	auipc	a2,0x1
  800544:	84c60613          	addi	a2,a2,-1972 # 800d8c <error_string+0x130>
  800548:	00090593          	mv	a1,s2
  80054c:	00098513          	mv	a0,s3
  800550:	314000ef          	jal	ra,800864 <printfmt>
  800554:	e59ff06f          	j	8003ac <vprintfmt+0x5c>
  800558:	00144e03          	lbu	t3,1(s0)
  80055c:	00158593          	addi	a1,a1,1
  800560:	000c8413          	mv	s0,s9
  800564:	e9dff06f          	j	800400 <vprintfmt+0xb0>
  800568:	00100793          	li	a5,1
  80056c:	20b7c063          	blt	a5,a1,80076c <vprintfmt+0x41c>
  800570:	000aa603          	lw	a2,0(s5)
  800574:	00000693          	li	a3,0
  800578:	004a8a93          	addi	s5,s5,4
  80057c:	00800713          	li	a4,8
  800580:	ef9ff06f          	j	800478 <vprintfmt+0x128>
  800584:	03000513          	li	a0,48
  800588:	00090593          	mv	a1,s2
  80058c:	01012023          	sw	a6,0(sp)
  800590:	000980e7          	jalr	s3
  800594:	00090593          	mv	a1,s2
  800598:	07800513          	li	a0,120
  80059c:	000980e7          	jalr	s3
  8005a0:	000aa603          	lw	a2,0(s5)
  8005a4:	00000693          	li	a3,0
  8005a8:	01000713          	li	a4,16
  8005ac:	004a8a93          	addi	s5,s5,4
  8005b0:	00012803          	lw	a6,0(sp)
  8005b4:	ec5ff06f          	j	800478 <vprintfmt+0x128>
  8005b8:	000aa403          	lw	s0,0(s5)
  8005bc:	004a8793          	addi	a5,s5,4
  8005c0:	00f12223          	sw	a5,4(sp)
  8005c4:	24040863          	beqz	s0,800814 <vprintfmt+0x4c4>
  8005c8:	05b05263          	blez	s11,80060c <vprintfmt+0x2bc>
  8005cc:	02d00793          	li	a5,45
  8005d0:	22f80263          	beq	a6,a5,8007f4 <vprintfmt+0x4a4>
  8005d4:	000d0593          	mv	a1,s10
  8005d8:	00040513          	mv	a0,s0
  8005dc:	01012023          	sw	a6,0(sp)
  8005e0:	c6dff0ef          	jal	ra,80024c <strnlen>
  8005e4:	40ad8db3          	sub	s11,s11,a0
  8005e8:	03b05263          	blez	s11,80060c <vprintfmt+0x2bc>
  8005ec:	00012803          	lw	a6,0(sp)
  8005f0:	00080513          	mv	a0,a6
  8005f4:	00090593          	mv	a1,s2
  8005f8:	01012023          	sw	a6,0(sp)
  8005fc:	fffd8d93          	addi	s11,s11,-1
  800600:	000980e7          	jalr	s3
  800604:	00012803          	lw	a6,0(sp)
  800608:	fe0d94e3          	bnez	s11,8005f0 <vprintfmt+0x2a0>
  80060c:	00044783          	lbu	a5,0(s0)
  800610:	00140a93          	addi	s5,s0,1
  800614:	00078513          	mv	a0,a5
  800618:	04078c63          	beqz	a5,800670 <vprintfmt+0x320>
  80061c:	03f00413          	li	s0,63
  800620:	000d4663          	bltz	s10,80062c <vprintfmt+0x2dc>
  800624:	fffd0d13          	addi	s10,s10,-1
  800628:	036d0663          	beq	s10,s6,800654 <vprintfmt+0x304>
  80062c:	00090593          	mv	a1,s2
  800630:	00048663          	beqz	s1,80063c <vprintfmt+0x2ec>
  800634:	fe078793          	addi	a5,a5,-32
  800638:	12fbe463          	bltu	s7,a5,800760 <vprintfmt+0x410>
  80063c:	000980e7          	jalr	s3
  800640:	001a8a93          	addi	s5,s5,1
  800644:	fffac783          	lbu	a5,-1(s5)
  800648:	fffd8d93          	addi	s11,s11,-1
  80064c:	00078513          	mv	a0,a5
  800650:	fc0798e3          	bnez	a5,800620 <vprintfmt+0x2d0>
  800654:	01b05e63          	blez	s11,800670 <vprintfmt+0x320>
  800658:	02000413          	li	s0,32
  80065c:	fffd8d93          	addi	s11,s11,-1
  800660:	00090593          	mv	a1,s2
  800664:	00040513          	mv	a0,s0
  800668:	000980e7          	jalr	s3
  80066c:	fe0d98e3          	bnez	s11,80065c <vprintfmt+0x30c>
  800670:	00412a83          	lw	s5,4(sp)
  800674:	d39ff06f          	j	8003ac <vprintfmt+0x5c>
  800678:	00100793          	li	a5,1
  80067c:	10b7c663          	blt	a5,a1,800788 <vprintfmt+0x438>
  800680:	000aa603          	lw	a2,0(s5)
  800684:	00000693          	li	a3,0
  800688:	004a8a93          	addi	s5,s5,4
  80068c:	00a00713          	li	a4,10
  800690:	de9ff06f          	j	800478 <vprintfmt+0x128>
  800694:	00144e03          	lbu	t3,1(s0)
  800698:	00050813          	mv	a6,a0
  80069c:	000c8413          	mv	s0,s9
  8006a0:	d61ff06f          	j	800400 <vprintfmt+0xb0>
  8006a4:	00090593          	mv	a1,s2
  8006a8:	02500513          	li	a0,37
  8006ac:	000980e7          	jalr	s3
  8006b0:	cfdff06f          	j	8003ac <vprintfmt+0x5c>
  8006b4:	000aad03          	lw	s10,0(s5)
  8006b8:	00144e03          	lbu	t3,1(s0)
  8006bc:	004a8a93          	addi	s5,s5,4
  8006c0:	000c8413          	mv	s0,s9
  8006c4:	d20ddee3          	bgez	s11,800400 <vprintfmt+0xb0>
  8006c8:	000d0d93          	mv	s11,s10
  8006cc:	fff00d13          	li	s10,-1
  8006d0:	d31ff06f          	j	800400 <vprintfmt+0xb0>
  8006d4:	00144e03          	lbu	t3,1(s0)
  8006d8:	00088813          	mv	a6,a7
  8006dc:	000c8413          	mv	s0,s9
  8006e0:	d21ff06f          	j	800400 <vprintfmt+0xb0>
  8006e4:	00144703          	lbu	a4,1(s0)
  8006e8:	fd0e0d13          	addi	s10,t3,-48
  8006ec:	fd070793          	addi	a5,a4,-48
  8006f0:	14f66863          	bltu	a2,a5,800840 <vprintfmt+0x4f0>
  8006f4:	000c8413          	mv	s0,s9
  8006f8:	002d1793          	slli	a5,s10,0x2
  8006fc:	01a78d33          	add	s10,a5,s10
  800700:	00140413          	addi	s0,s0,1
  800704:	001d1d13          	slli	s10,s10,0x1
  800708:	00ed0d33          	add	s10,s10,a4
  80070c:	00044703          	lbu	a4,0(s0)
  800710:	fd0d0d13          	addi	s10,s10,-48
  800714:	fd070793          	addi	a5,a4,-48
  800718:	fef670e3          	bleu	a5,a2,8006f8 <vprintfmt+0x3a8>
  80071c:	00070e13          	mv	t3,a4
  800720:	fa5ff06f          	j	8006c4 <vprintfmt+0x374>
  800724:	0e0dc463          	bltz	s11,80080c <vprintfmt+0x4bc>
  800728:	00144e03          	lbu	t3,1(s0)
  80072c:	000c8413          	mv	s0,s9
  800730:	cd1ff06f          	j	800400 <vprintfmt+0xb0>
  800734:	00090593          	mv	a1,s2
  800738:	02500513          	li	a0,37
  80073c:	000980e7          	jalr	s3
  800740:	fff44783          	lbu	a5,-1(s0)
  800744:	02500713          	li	a4,37
  800748:	00040c93          	mv	s9,s0
  80074c:	c6e780e3          	beq	a5,a4,8003ac <vprintfmt+0x5c>
  800750:	fffc8c93          	addi	s9,s9,-1
  800754:	fffcc783          	lbu	a5,-1(s9)
  800758:	fee79ce3          	bne	a5,a4,800750 <vprintfmt+0x400>
  80075c:	c51ff06f          	j	8003ac <vprintfmt+0x5c>
  800760:	00040513          	mv	a0,s0
  800764:	000980e7          	jalr	s3
  800768:	ed9ff06f          	j	800640 <vprintfmt+0x2f0>
  80076c:	007a8793          	addi	a5,s5,7
  800770:	ff87f793          	andi	a5,a5,-8
  800774:	00878a93          	addi	s5,a5,8
  800778:	0007a603          	lw	a2,0(a5)
  80077c:	0047a683          	lw	a3,4(a5)
  800780:	00800713          	li	a4,8
  800784:	cf5ff06f          	j	800478 <vprintfmt+0x128>
  800788:	007a8793          	addi	a5,s5,7
  80078c:	ff87f793          	andi	a5,a5,-8
  800790:	00878a93          	addi	s5,a5,8
  800794:	0007a603          	lw	a2,0(a5)
  800798:	0047a683          	lw	a3,4(a5)
  80079c:	00a00713          	li	a4,10
  8007a0:	cd9ff06f          	j	800478 <vprintfmt+0x128>
  8007a4:	007a8793          	addi	a5,s5,7
  8007a8:	ff87f793          	andi	a5,a5,-8
  8007ac:	00878a93          	addi	s5,a5,8
  8007b0:	0007a603          	lw	a2,0(a5)
  8007b4:	0047a683          	lw	a3,4(a5)
  8007b8:	01000713          	li	a4,16
  8007bc:	cbdff06f          	j	800478 <vprintfmt+0x128>
  8007c0:	007a8793          	addi	a5,s5,7
  8007c4:	ff87f793          	andi	a5,a5,-8
  8007c8:	00878a93          	addi	s5,a5,8
  8007cc:	0007a603          	lw	a2,0(a5)
  8007d0:	0047a683          	lw	a3,4(a5)
  8007d4:	cf1ff06f          	j	8004c4 <vprintfmt+0x174>
  8007d8:	00078693          	mv	a3,a5
  8007dc:	00000617          	auipc	a2,0x0
  8007e0:	5a460613          	addi	a2,a2,1444 # 800d80 <error_string+0x124>
  8007e4:	00090593          	mv	a1,s2
  8007e8:	00098513          	mv	a0,s3
  8007ec:	078000ef          	jal	ra,800864 <printfmt>
  8007f0:	bbdff06f          	j	8003ac <vprintfmt+0x5c>
  8007f4:	00044783          	lbu	a5,0(s0)
  8007f8:	00140a93          	addi	s5,s0,1
  8007fc:	00078513          	mv	a0,a5
  800800:	e4078ce3          	beqz	a5,800658 <vprintfmt+0x308>
  800804:	03f00413          	li	s0,63
  800808:	e19ff06f          	j	800620 <vprintfmt+0x2d0>
  80080c:	00000d93          	li	s11,0
  800810:	f19ff06f          	j	800728 <vprintfmt+0x3d8>
  800814:	03b05c63          	blez	s11,80084c <vprintfmt+0x4fc>
  800818:	02d00793          	li	a5,45
  80081c:	00000417          	auipc	s0,0x0
  800820:	55c40413          	addi	s0,s0,1372 # 800d78 <error_string+0x11c>
  800824:	daf818e3          	bne	a6,a5,8005d4 <vprintfmt+0x284>
  800828:	00000a97          	auipc	s5,0x0
  80082c:	551a8a93          	addi	s5,s5,1361 # 800d79 <error_string+0x11d>
  800830:	000c0513          	mv	a0,s8
  800834:	000c0793          	mv	a5,s8
  800838:	03f00413          	li	s0,63
  80083c:	de5ff06f          	j	800620 <vprintfmt+0x2d0>
  800840:	00070e13          	mv	t3,a4
  800844:	000c8413          	mv	s0,s9
  800848:	e7dff06f          	j	8006c4 <vprintfmt+0x374>
  80084c:	000c0793          	mv	a5,s8
  800850:	000c0513          	mv	a0,s8
  800854:	00000a97          	auipc	s5,0x0
  800858:	525a8a93          	addi	s5,s5,1317 # 800d79 <error_string+0x11d>
  80085c:	03f00413          	li	s0,63
  800860:	dc1ff06f          	j	800620 <vprintfmt+0x2d0>

00800864 <printfmt>:
  800864:	fc010113          	addi	sp,sp,-64
  800868:	02c10313          	addi	t1,sp,44
  80086c:	02d12623          	sw	a3,44(sp)
  800870:	00030693          	mv	a3,t1
  800874:	00112e23          	sw	ra,28(sp)
  800878:	02e12823          	sw	a4,48(sp)
  80087c:	02f12a23          	sw	a5,52(sp)
  800880:	03012c23          	sw	a6,56(sp)
  800884:	03112e23          	sw	a7,60(sp)
  800888:	00612623          	sw	t1,12(sp)
  80088c:	ac5ff0ef          	jal	ra,800350 <vprintfmt>
  800890:	01c12083          	lw	ra,28(sp)
  800894:	04010113          	addi	sp,sp,64
  800898:	00008067          	ret

0080089c <main>:
  80089c:	fd010113          	addi	sp,sp,-48
  8008a0:	01400613          	li	a2,20
  8008a4:	00000593          	li	a1,0
  8008a8:	00000517          	auipc	a0,0x0
  8008ac:	78050513          	addi	a0,a0,1920 # 801028 <pids>
  8008b0:	02112623          	sw	ra,44(sp)
  8008b4:	02812423          	sw	s0,40(sp)
  8008b8:	02912223          	sw	s1,36(sp)
  8008bc:	03212023          	sw	s2,32(sp)
  8008c0:	01312e23          	sw	s3,28(sp)
  8008c4:	01412c23          	sw	s4,24(sp)
  8008c8:	01512a23          	sw	s5,20(sp)
  8008cc:	01612823          	sw	s6,16(sp)
  8008d0:	9bdff0ef          	jal	ra,80028c <memset>
  8008d4:	00000497          	auipc	s1,0x0
  8008d8:	75448493          	addi	s1,s1,1876 # 801028 <pids>
  8008dc:	00600513          	li	a0,6
  8008e0:	00000a97          	auipc	s5,0x0
  8008e4:	720a8a93          	addi	s5,s5,1824 # 801000 <acc>
  8008e8:	88dff0ef          	jal	ra,800174 <lab6_set_priority>
  8008ec:	000a8993          	mv	s3,s5
  8008f0:	00048b13          	mv	s6,s1
  8008f4:	00048913          	mv	s2,s1
  8008f8:	00000413          	li	s0,0
  8008fc:	00500a13          	li	s4,5
  800900:	0009a023          	sw	zero,0(s3)
  800904:	85dff0ef          	jal	ra,800160 <fork>
  800908:	00a92023          	sw	a0,0(s2)
  80090c:	10050463          	beqz	a0,800a14 <main+0x178>
  800910:	18054663          	bltz	a0,800a9c <main+0x200>
  800914:	00140413          	addi	s0,s0,1
  800918:	00498993          	addi	s3,s3,4
  80091c:	00490913          	addi	s2,s2,4
  800920:	ff4410e3          	bne	s0,s4,800900 <main+0x64>
  800924:	00000517          	auipc	a0,0x0
  800928:	48c50513          	addi	a0,a0,1164 # 800db0 <error_string+0x154>
  80092c:	00000917          	auipc	s2,0x0
  800930:	6e890913          	addi	s2,s2,1768 # 801014 <status>
  800934:	8b1ff0ef          	jal	ra,8001e4 <cprintf>
  800938:	00000b17          	auipc	s6,0x0
  80093c:	6f0b0b13          	addi	s6,s6,1776 # 801028 <pids>
  800940:	00090413          	mv	s0,s2
  800944:	00000a97          	auipc	s5,0x0
  800948:	494a8a93          	addi	s5,s5,1172 # 800dd8 <error_string+0x17c>
  80094c:	0004a503          	lw	a0,0(s1)
  800950:	00040593          	mv	a1,s0
  800954:	00042023          	sw	zero,0(s0)
  800958:	80dff0ef          	jal	ra,800164 <waitpid>
  80095c:	00042a03          	lw	s4,0(s0)
  800960:	0004a983          	lw	s3,0(s1)
  800964:	80dff0ef          	jal	ra,800170 <gettime_msec>
  800968:	00440413          	addi	s0,s0,4
  80096c:	00050693          	mv	a3,a0
  800970:	000a0613          	mv	a2,s4
  800974:	00098593          	mv	a1,s3
  800978:	000a8513          	mv	a0,s5
  80097c:	00448493          	addi	s1,s1,4
  800980:	865ff0ef          	jal	ra,8001e4 <cprintf>
  800984:	fd6414e3          	bne	s0,s6,80094c <main+0xb0>
  800988:	00000517          	auipc	a0,0x0
  80098c:	47050513          	addi	a0,a0,1136 # 800df8 <error_string+0x19c>
  800990:	855ff0ef          	jal	ra,8001e4 <cprintf>
  800994:	00000517          	auipc	a0,0x0
  800998:	47c50513          	addi	a0,a0,1148 # 800e10 <error_string+0x1b4>
  80099c:	849ff0ef          	jal	ra,8001e4 <cprintf>
  8009a0:	00000497          	auipc	s1,0x0
  8009a4:	49048493          	addi	s1,s1,1168 # 800e30 <error_string+0x1d4>
  8009a8:	00092583          	lw	a1,0(s2)
  8009ac:	00000797          	auipc	a5,0x0
  8009b0:	6687a783          	lw	a5,1640(a5) # 801014 <status>
  8009b4:	00490913          	addi	s2,s2,4
  8009b8:	00159593          	slli	a1,a1,0x1
  8009bc:	02f5c5b3          	div	a1,a1,a5
  8009c0:	00048513          	mv	a0,s1
  8009c4:	00158593          	addi	a1,a1,1
  8009c8:	01f5d793          	srli	a5,a1,0x1f
  8009cc:	00b785b3          	add	a1,a5,a1
  8009d0:	4015d593          	srai	a1,a1,0x1
  8009d4:	811ff0ef          	jal	ra,8001e4 <cprintf>
  8009d8:	fc8918e3          	bne	s2,s0,8009a8 <main+0x10c>
  8009dc:	00000517          	auipc	a0,0x0
  8009e0:	3f850513          	addi	a0,a0,1016 # 800dd4 <error_string+0x178>
  8009e4:	801ff0ef          	jal	ra,8001e4 <cprintf>
  8009e8:	02c12083          	lw	ra,44(sp)
  8009ec:	00000513          	li	a0,0
  8009f0:	02812403          	lw	s0,40(sp)
  8009f4:	02412483          	lw	s1,36(sp)
  8009f8:	02012903          	lw	s2,32(sp)
  8009fc:	01c12983          	lw	s3,28(sp)
  800a00:	01812a03          	lw	s4,24(sp)
  800a04:	01412a83          	lw	s5,20(sp)
  800a08:	01012b03          	lw	s6,16(sp)
  800a0c:	03010113          	addi	sp,sp,48
  800a10:	00008067          	ret
  800a14:	00140513          	addi	a0,s0,1
  800a18:	00241413          	slli	s0,s0,0x2
  800a1c:	008a8433          	add	s0,s5,s0
  800a20:	000014b7          	lui	s1,0x1
  800a24:	f50ff0ef          	jal	ra,800174 <lab6_set_priority>
  800a28:	fa048493          	addi	s1,s1,-96 # fa0 <__panic-0x7ff080>
  800a2c:	00042023          	sw	zero,0(s0)
  800a30:	3e800993          	li	s3,1000
  800a34:	00042683          	lw	a3,0(s0)
  800a38:	00168693          	addi	a3,a3,1
  800a3c:	0c800713          	li	a4,200
  800a40:	00c12783          	lw	a5,12(sp)
  800a44:	fff70713          	addi	a4,a4,-1
  800a48:	0017b793          	seqz	a5,a5
  800a4c:	00f12623          	sw	a5,12(sp)
  800a50:	fe0718e3          	bnez	a4,800a40 <main+0x1a4>
  800a54:	0296f7b3          	remu	a5,a3,s1
  800a58:	00168713          	addi	a4,a3,1
  800a5c:	00078663          	beqz	a5,800a68 <main+0x1cc>
  800a60:	00070693          	mv	a3,a4
  800a64:	fd9ff06f          	j	800a3c <main+0x1a0>
  800a68:	00d42023          	sw	a3,0(s0)
  800a6c:	f04ff0ef          	jal	ra,800170 <gettime_msec>
  800a70:	00050913          	mv	s2,a0
  800a74:	fca9d0e3          	ble	a0,s3,800a34 <main+0x198>
  800a78:	ef4ff0ef          	jal	ra,80016c <getpid>
  800a7c:	00042603          	lw	a2,0(s0)
  800a80:	00050593          	mv	a1,a0
  800a84:	00090693          	mv	a3,s2
  800a88:	00000517          	auipc	a0,0x0
  800a8c:	30850513          	addi	a0,a0,776 # 800d90 <error_string+0x134>
  800a90:	f54ff0ef          	jal	ra,8001e4 <cprintf>
  800a94:	00042503          	lw	a0,0(s0)
  800a98:	eacff0ef          	jal	ra,800144 <exit>
  800a9c:	00000413          	li	s0,0
  800aa0:	01400493          	li	s1,20
  800aa4:	008b07b3          	add	a5,s6,s0
  800aa8:	0007a503          	lw	a0,0(a5)
  800aac:	00a05463          	blez	a0,800ab4 <main+0x218>
  800ab0:	eb8ff0ef          	jal	ra,800168 <kill>
  800ab4:	00440413          	addi	s0,s0,4
  800ab8:	fe9416e3          	bne	s0,s1,800aa4 <main+0x208>
  800abc:	00000617          	auipc	a2,0x0
  800ac0:	37860613          	addi	a2,a2,888 # 800e34 <error_string+0x1d8>
  800ac4:	04b00593          	li	a1,75
  800ac8:	00000517          	auipc	a0,0x0
  800acc:	37850513          	addi	a0,a0,888 # 800e40 <error_string+0x1e4>
  800ad0:	d50ff0ef          	jal	ra,800020 <__panic>
