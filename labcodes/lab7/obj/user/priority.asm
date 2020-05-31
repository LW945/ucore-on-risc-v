
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
  800040:	ac050513          	addi	a0,a0,-1344 # 800afc <main+0x250>
  800044:	00112e23          	sw	ra,28(sp)
  800048:	02d12623          	sw	a3,44(sp)
  80004c:	02e12823          	sw	a4,48(sp)
  800050:	03012c23          	sw	a6,56(sp)
  800054:	03112e23          	sw	a7,60(sp)
  800058:	00f12623          	sw	a5,12(sp)
  80005c:	198000ef          	jal	ra,8001f4 <cprintf>
  800060:	00c12583          	lw	a1,12(sp)
  800064:	00040513          	mv	a0,s0
  800068:	158000ef          	jal	ra,8001c0 <vcprintf>
  80006c:	00001517          	auipc	a0,0x1
  800070:	db850513          	addi	a0,a0,-584 # 800e24 <error_string+0x1a0>
  800074:	180000ef          	jal	ra,8001f4 <cprintf>
  800078:	ff600513          	li	a0,-10
  80007c:	0d4000ef          	jal	ra,800150 <exit>

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

00800144 <sys_sleep>:
  800144:	00050593          	mv	a1,a0
  800148:	00b00513          	li	a0,11
  80014c:	f35ff06f          	j	800080 <syscall>

00800150 <exit>:
  800150:	ff010113          	addi	sp,sp,-16
  800154:	00112623          	sw	ra,12(sp)
  800158:	f95ff0ef          	jal	ra,8000ec <sys_exit>
  80015c:	00001517          	auipc	a0,0x1
  800160:	9bc50513          	addi	a0,a0,-1604 # 800b18 <main+0x26c>
  800164:	090000ef          	jal	ra,8001f4 <cprintf>
  800168:	0000006f          	j	800168 <exit+0x18>

0080016c <fork>:
  80016c:	f8dff06f          	j	8000f8 <sys_fork>

00800170 <waitpid>:
  800170:	f91ff06f          	j	800100 <sys_wait>

00800174 <kill>:
  800174:	f9dff06f          	j	800110 <sys_kill>

00800178 <getpid>:
  800178:	fa5ff06f          	j	80011c <sys_getpid>

0080017c <gettime_msec>:
  80017c:	fb5ff06f          	j	800130 <sys_gettime>

00800180 <lab6_set_priority>:
  800180:	fb9ff06f          	j	800138 <sys_lab6_set_priority>

00800184 <sleep>:
  800184:	fc1ff06f          	j	800144 <sys_sleep>

00800188 <_start>:
  800188:	0c4000ef          	jal	ra,80024c <umain>
  80018c:	0000006f          	j	80018c <_start+0x4>

00800190 <cputch>:
  800190:	ff010113          	addi	sp,sp,-16
  800194:	00112623          	sw	ra,12(sp)
  800198:	00812423          	sw	s0,8(sp)
  80019c:	00058413          	mv	s0,a1
  8001a0:	f85ff0ef          	jal	ra,800124 <sys_putc>
  8001a4:	00042783          	lw	a5,0(s0)
  8001a8:	00c12083          	lw	ra,12(sp)
  8001ac:	00178793          	addi	a5,a5,1
  8001b0:	00f42023          	sw	a5,0(s0)
  8001b4:	00812403          	lw	s0,8(sp)
  8001b8:	01010113          	addi	sp,sp,16
  8001bc:	00008067          	ret

008001c0 <vcprintf>:
  8001c0:	fe010113          	addi	sp,sp,-32
  8001c4:	00058693          	mv	a3,a1
  8001c8:	00050613          	mv	a2,a0
  8001cc:	00c10593          	addi	a1,sp,12
  8001d0:	00000517          	auipc	a0,0x0
  8001d4:	fc050513          	addi	a0,a0,-64 # 800190 <cputch>
  8001d8:	00112e23          	sw	ra,28(sp)
  8001dc:	00012623          	sw	zero,12(sp)
  8001e0:	180000ef          	jal	ra,800360 <vprintfmt>
  8001e4:	01c12083          	lw	ra,28(sp)
  8001e8:	00c12503          	lw	a0,12(sp)
  8001ec:	02010113          	addi	sp,sp,32
  8001f0:	00008067          	ret

008001f4 <cprintf>:
  8001f4:	fc010113          	addi	sp,sp,-64
  8001f8:	02410313          	addi	t1,sp,36
  8001fc:	02b12223          	sw	a1,36(sp)
  800200:	02c12423          	sw	a2,40(sp)
  800204:	02d12623          	sw	a3,44(sp)
  800208:	00050613          	mv	a2,a0
  80020c:	00c10593          	addi	a1,sp,12
  800210:	00000517          	auipc	a0,0x0
  800214:	f8050513          	addi	a0,a0,-128 # 800190 <cputch>
  800218:	00030693          	mv	a3,t1
  80021c:	00112e23          	sw	ra,28(sp)
  800220:	02e12823          	sw	a4,48(sp)
  800224:	02f12a23          	sw	a5,52(sp)
  800228:	03012c23          	sw	a6,56(sp)
  80022c:	03112e23          	sw	a7,60(sp)
  800230:	00612423          	sw	t1,8(sp)
  800234:	00012623          	sw	zero,12(sp)
  800238:	128000ef          	jal	ra,800360 <vprintfmt>
  80023c:	01c12083          	lw	ra,28(sp)
  800240:	00c12503          	lw	a0,12(sp)
  800244:	04010113          	addi	sp,sp,64
  800248:	00008067          	ret

0080024c <umain>:
  80024c:	ff010113          	addi	sp,sp,-16
  800250:	00112623          	sw	ra,12(sp)
  800254:	658000ef          	jal	ra,8008ac <main>
  800258:	ef9ff0ef          	jal	ra,800150 <exit>

0080025c <strnlen>:
  80025c:	00050693          	mv	a3,a0
  800260:	02058a63          	beqz	a1,800294 <strnlen+0x38>
  800264:	00054703          	lbu	a4,0(a0)
  800268:	00150793          	addi	a5,a0,1
  80026c:	02070463          	beqz	a4,800294 <strnlen+0x38>
  800270:	00b505b3          	add	a1,a0,a1
  800274:	0100006f          	j	800284 <strnlen+0x28>
  800278:	00178793          	addi	a5,a5,1
  80027c:	fff7c703          	lbu	a4,-1(a5)
  800280:	00070863          	beqz	a4,800290 <strnlen+0x34>
  800284:	40d78533          	sub	a0,a5,a3
  800288:	feb798e3          	bne	a5,a1,800278 <strnlen+0x1c>
  80028c:	00008067          	ret
  800290:	00008067          	ret
  800294:	00000513          	li	a0,0
  800298:	00008067          	ret

0080029c <memset>:
  80029c:	00c50733          	add	a4,a0,a2
  8002a0:	00050793          	mv	a5,a0
  8002a4:	00060863          	beqz	a2,8002b4 <memset+0x18>
  8002a8:	00178793          	addi	a5,a5,1
  8002ac:	feb78fa3          	sb	a1,-1(a5)
  8002b0:	fef71ce3          	bne	a4,a5,8002a8 <memset+0xc>
  8002b4:	00008067          	ret

008002b8 <printnum>:
  8002b8:	fe010113          	addi	sp,sp,-32
  8002bc:	00912a23          	sw	s1,20(sp)
  8002c0:	01212823          	sw	s2,16(sp)
  8002c4:	01312623          	sw	s3,12(sp)
  8002c8:	01412423          	sw	s4,8(sp)
  8002cc:	00112e23          	sw	ra,28(sp)
  8002d0:	00812c23          	sw	s0,24(sp)
  8002d4:	00050493          	mv	s1,a0
  8002d8:	00058913          	mv	s2,a1
  8002dc:	00080993          	mv	s3,a6
  8002e0:	02e67a33          	remu	s4,a2,a4
  8002e4:	04069e63          	bnez	a3,800340 <printnum+0x88>
  8002e8:	04e67c63          	bleu	a4,a2,800340 <printnum+0x88>
  8002ec:	fff78413          	addi	s0,a5,-1
  8002f0:	00805c63          	blez	s0,800308 <printnum+0x50>
  8002f4:	fff40413          	addi	s0,s0,-1
  8002f8:	00090593          	mv	a1,s2
  8002fc:	00098513          	mv	a0,s3
  800300:	000480e7          	jalr	s1
  800304:	fe0418e3          	bnez	s0,8002f4 <printnum+0x3c>
  800308:	00001797          	auipc	a5,0x1
  80030c:	9e078793          	addi	a5,a5,-1568 # 800ce8 <error_string+0x64>
  800310:	014787b3          	add	a5,a5,s4
  800314:	00090593          	mv	a1,s2
  800318:	00048313          	mv	t1,s1
  80031c:	01c12083          	lw	ra,28(sp)
  800320:	01812403          	lw	s0,24(sp)
  800324:	01412483          	lw	s1,20(sp)
  800328:	01012903          	lw	s2,16(sp)
  80032c:	00c12983          	lw	s3,12(sp)
  800330:	00812a03          	lw	s4,8(sp)
  800334:	0007c503          	lbu	a0,0(a5)
  800338:	02010113          	addi	sp,sp,32
  80033c:	00030067          	jr	t1
  800340:	02e65633          	divu	a2,a2,a4
  800344:	00098813          	mv	a6,s3
  800348:	fff78793          	addi	a5,a5,-1
  80034c:	00000693          	li	a3,0
  800350:	00090593          	mv	a1,s2
  800354:	00048513          	mv	a0,s1
  800358:	f61ff0ef          	jal	ra,8002b8 <printnum>
  80035c:	fadff06f          	j	800308 <printnum+0x50>

00800360 <vprintfmt>:
  800360:	fb010113          	addi	sp,sp,-80
  800364:	05212023          	sw	s2,64(sp)
  800368:	03312e23          	sw	s3,60(sp)
  80036c:	03412c23          	sw	s4,56(sp)
  800370:	03512a23          	sw	s5,52(sp)
  800374:	03612823          	sw	s6,48(sp)
  800378:	03712623          	sw	s7,44(sp)
  80037c:	03812423          	sw	s8,40(sp)
  800380:	03912223          	sw	s9,36(sp)
  800384:	04112623          	sw	ra,76(sp)
  800388:	04812423          	sw	s0,72(sp)
  80038c:	04912223          	sw	s1,68(sp)
  800390:	03a12023          	sw	s10,32(sp)
  800394:	01b12e23          	sw	s11,28(sp)
  800398:	00050993          	mv	s3,a0
  80039c:	00058913          	mv	s2,a1
  8003a0:	00060c93          	mv	s9,a2
  8003a4:	00068a93          	mv	s5,a3
  8003a8:	00000a17          	auipc	s4,0x0
  8003ac:	784a0a13          	addi	s4,s4,1924 # 800b2c <main+0x280>
  8003b0:	02800c13          	li	s8,40
  8003b4:	fff00b13          	li	s6,-1
  8003b8:	05e00b93          	li	s7,94
  8003bc:	000cc503          	lbu	a0,0(s9)
  8003c0:	02500493          	li	s1,37
  8003c4:	001c8413          	addi	s0,s9,1
  8003c8:	00950e63          	beq	a0,s1,8003e4 <vprintfmt+0x84>
  8003cc:	06050463          	beqz	a0,800434 <vprintfmt+0xd4>
  8003d0:	00090593          	mv	a1,s2
  8003d4:	00140413          	addi	s0,s0,1
  8003d8:	000980e7          	jalr	s3
  8003dc:	fff44503          	lbu	a0,-1(s0)
  8003e0:	fe9516e3          	bne	a0,s1,8003cc <vprintfmt+0x6c>
  8003e4:	00044e03          	lbu	t3,0(s0)
  8003e8:	fff00d13          	li	s10,-1
  8003ec:	02000813          	li	a6,32
  8003f0:	00000493          	li	s1,0
  8003f4:	00000593          	li	a1,0
  8003f8:	000d0d93          	mv	s11,s10
  8003fc:	05500693          	li	a3,85
  800400:	00100313          	li	t1,1
  800404:	03000893          	li	a7,48
  800408:	00900613          	li	a2,9
  80040c:	02d00513          	li	a0,45
  800410:	fdde0713          	addi	a4,t3,-35
  800414:	0ff77713          	andi	a4,a4,255
  800418:	00140c93          	addi	s9,s0,1
  80041c:	32e6e463          	bltu	a3,a4,800744 <vprintfmt+0x3e4>
  800420:	00271713          	slli	a4,a4,0x2
  800424:	01470733          	add	a4,a4,s4
  800428:	00072783          	lw	a5,0(a4)
  80042c:	014787b3          	add	a5,a5,s4
  800430:	00078067          	jr	a5
  800434:	04c12083          	lw	ra,76(sp)
  800438:	04812403          	lw	s0,72(sp)
  80043c:	04412483          	lw	s1,68(sp)
  800440:	04012903          	lw	s2,64(sp)
  800444:	03c12983          	lw	s3,60(sp)
  800448:	03812a03          	lw	s4,56(sp)
  80044c:	03412a83          	lw	s5,52(sp)
  800450:	03012b03          	lw	s6,48(sp)
  800454:	02c12b83          	lw	s7,44(sp)
  800458:	02812c03          	lw	s8,40(sp)
  80045c:	02412c83          	lw	s9,36(sp)
  800460:	02012d03          	lw	s10,32(sp)
  800464:	01c12d83          	lw	s11,28(sp)
  800468:	05010113          	addi	sp,sp,80
  80046c:	00008067          	ret
  800470:	00100793          	li	a5,1
  800474:	34b7c063          	blt	a5,a1,8007b4 <vprintfmt+0x454>
  800478:	000aa603          	lw	a2,0(s5)
  80047c:	00000693          	li	a3,0
  800480:	004a8a93          	addi	s5,s5,4
  800484:	01000713          	li	a4,16
  800488:	000d8793          	mv	a5,s11
  80048c:	00090593          	mv	a1,s2
  800490:	00098513          	mv	a0,s3
  800494:	e25ff0ef          	jal	ra,8002b8 <printnum>
  800498:	f25ff06f          	j	8003bc <vprintfmt+0x5c>
  80049c:	00144e03          	lbu	t3,1(s0)
  8004a0:	00030493          	mv	s1,t1
  8004a4:	000c8413          	mv	s0,s9
  8004a8:	f69ff06f          	j	800410 <vprintfmt+0xb0>
  8004ac:	000aa503          	lw	a0,0(s5)
  8004b0:	00090593          	mv	a1,s2
  8004b4:	004a8a93          	addi	s5,s5,4
  8004b8:	000980e7          	jalr	s3
  8004bc:	f01ff06f          	j	8003bc <vprintfmt+0x5c>
  8004c0:	00100793          	li	a5,1
  8004c4:	30b7c663          	blt	a5,a1,8007d0 <vprintfmt+0x470>
  8004c8:	000aa603          	lw	a2,0(s5)
  8004cc:	004a8a93          	addi	s5,s5,4
  8004d0:	41f65693          	srai	a3,a2,0x1f
  8004d4:	00a00713          	li	a4,10
  8004d8:	fa06d8e3          	bgez	a3,800488 <vprintfmt+0x128>
  8004dc:	00090593          	mv	a1,s2
  8004e0:	02d00513          	li	a0,45
  8004e4:	00d12623          	sw	a3,12(sp)
  8004e8:	00c12423          	sw	a2,8(sp)
  8004ec:	00e12223          	sw	a4,4(sp)
  8004f0:	01012023          	sw	a6,0(sp)
  8004f4:	000980e7          	jalr	s3
  8004f8:	00812603          	lw	a2,8(sp)
  8004fc:	00c12683          	lw	a3,12(sp)
  800500:	00012803          	lw	a6,0(sp)
  800504:	40c00633          	neg	a2,a2
  800508:	00c037b3          	snez	a5,a2
  80050c:	40d006b3          	neg	a3,a3
  800510:	40f686b3          	sub	a3,a3,a5
  800514:	00412703          	lw	a4,4(sp)
  800518:	f71ff06f          	j	800488 <vprintfmt+0x128>
  80051c:	000aa783          	lw	a5,0(s5)
  800520:	01800693          	li	a3,24
  800524:	004a8a93          	addi	s5,s5,4
  800528:	41f7d713          	srai	a4,a5,0x1f
  80052c:	00f747b3          	xor	a5,a4,a5
  800530:	40e787b3          	sub	a5,a5,a4
  800534:	2af6ca63          	blt	a3,a5,8007e8 <vprintfmt+0x488>
  800538:	00279693          	slli	a3,a5,0x2
  80053c:	00000717          	auipc	a4,0x0
  800540:	74870713          	addi	a4,a4,1864 # 800c84 <error_string>
  800544:	00d70733          	add	a4,a4,a3
  800548:	00072683          	lw	a3,0(a4)
  80054c:	28068e63          	beqz	a3,8007e8 <vprintfmt+0x488>
  800550:	00001617          	auipc	a2,0x1
  800554:	86460613          	addi	a2,a2,-1948 # 800db4 <error_string+0x130>
  800558:	00090593          	mv	a1,s2
  80055c:	00098513          	mv	a0,s3
  800560:	314000ef          	jal	ra,800874 <printfmt>
  800564:	e59ff06f          	j	8003bc <vprintfmt+0x5c>
  800568:	00144e03          	lbu	t3,1(s0)
  80056c:	00158593          	addi	a1,a1,1
  800570:	000c8413          	mv	s0,s9
  800574:	e9dff06f          	j	800410 <vprintfmt+0xb0>
  800578:	00100793          	li	a5,1
  80057c:	20b7c063          	blt	a5,a1,80077c <vprintfmt+0x41c>
  800580:	000aa603          	lw	a2,0(s5)
  800584:	00000693          	li	a3,0
  800588:	004a8a93          	addi	s5,s5,4
  80058c:	00800713          	li	a4,8
  800590:	ef9ff06f          	j	800488 <vprintfmt+0x128>
  800594:	03000513          	li	a0,48
  800598:	00090593          	mv	a1,s2
  80059c:	01012023          	sw	a6,0(sp)
  8005a0:	000980e7          	jalr	s3
  8005a4:	00090593          	mv	a1,s2
  8005a8:	07800513          	li	a0,120
  8005ac:	000980e7          	jalr	s3
  8005b0:	000aa603          	lw	a2,0(s5)
  8005b4:	00000693          	li	a3,0
  8005b8:	01000713          	li	a4,16
  8005bc:	004a8a93          	addi	s5,s5,4
  8005c0:	00012803          	lw	a6,0(sp)
  8005c4:	ec5ff06f          	j	800488 <vprintfmt+0x128>
  8005c8:	000aa403          	lw	s0,0(s5)
  8005cc:	004a8793          	addi	a5,s5,4
  8005d0:	00f12223          	sw	a5,4(sp)
  8005d4:	24040863          	beqz	s0,800824 <vprintfmt+0x4c4>
  8005d8:	05b05263          	blez	s11,80061c <vprintfmt+0x2bc>
  8005dc:	02d00793          	li	a5,45
  8005e0:	22f80263          	beq	a6,a5,800804 <vprintfmt+0x4a4>
  8005e4:	000d0593          	mv	a1,s10
  8005e8:	00040513          	mv	a0,s0
  8005ec:	01012023          	sw	a6,0(sp)
  8005f0:	c6dff0ef          	jal	ra,80025c <strnlen>
  8005f4:	40ad8db3          	sub	s11,s11,a0
  8005f8:	03b05263          	blez	s11,80061c <vprintfmt+0x2bc>
  8005fc:	00012803          	lw	a6,0(sp)
  800600:	00080513          	mv	a0,a6
  800604:	00090593          	mv	a1,s2
  800608:	01012023          	sw	a6,0(sp)
  80060c:	fffd8d93          	addi	s11,s11,-1
  800610:	000980e7          	jalr	s3
  800614:	00012803          	lw	a6,0(sp)
  800618:	fe0d94e3          	bnez	s11,800600 <vprintfmt+0x2a0>
  80061c:	00044783          	lbu	a5,0(s0)
  800620:	00140a93          	addi	s5,s0,1
  800624:	00078513          	mv	a0,a5
  800628:	04078c63          	beqz	a5,800680 <vprintfmt+0x320>
  80062c:	03f00413          	li	s0,63
  800630:	000d4663          	bltz	s10,80063c <vprintfmt+0x2dc>
  800634:	fffd0d13          	addi	s10,s10,-1
  800638:	036d0663          	beq	s10,s6,800664 <vprintfmt+0x304>
  80063c:	00090593          	mv	a1,s2
  800640:	00048663          	beqz	s1,80064c <vprintfmt+0x2ec>
  800644:	fe078793          	addi	a5,a5,-32
  800648:	12fbe463          	bltu	s7,a5,800770 <vprintfmt+0x410>
  80064c:	000980e7          	jalr	s3
  800650:	001a8a93          	addi	s5,s5,1
  800654:	fffac783          	lbu	a5,-1(s5)
  800658:	fffd8d93          	addi	s11,s11,-1
  80065c:	00078513          	mv	a0,a5
  800660:	fc0798e3          	bnez	a5,800630 <vprintfmt+0x2d0>
  800664:	01b05e63          	blez	s11,800680 <vprintfmt+0x320>
  800668:	02000413          	li	s0,32
  80066c:	fffd8d93          	addi	s11,s11,-1
  800670:	00090593          	mv	a1,s2
  800674:	00040513          	mv	a0,s0
  800678:	000980e7          	jalr	s3
  80067c:	fe0d98e3          	bnez	s11,80066c <vprintfmt+0x30c>
  800680:	00412a83          	lw	s5,4(sp)
  800684:	d39ff06f          	j	8003bc <vprintfmt+0x5c>
  800688:	00100793          	li	a5,1
  80068c:	10b7c663          	blt	a5,a1,800798 <vprintfmt+0x438>
  800690:	000aa603          	lw	a2,0(s5)
  800694:	00000693          	li	a3,0
  800698:	004a8a93          	addi	s5,s5,4
  80069c:	00a00713          	li	a4,10
  8006a0:	de9ff06f          	j	800488 <vprintfmt+0x128>
  8006a4:	00144e03          	lbu	t3,1(s0)
  8006a8:	00050813          	mv	a6,a0
  8006ac:	000c8413          	mv	s0,s9
  8006b0:	d61ff06f          	j	800410 <vprintfmt+0xb0>
  8006b4:	00090593          	mv	a1,s2
  8006b8:	02500513          	li	a0,37
  8006bc:	000980e7          	jalr	s3
  8006c0:	cfdff06f          	j	8003bc <vprintfmt+0x5c>
  8006c4:	000aad03          	lw	s10,0(s5)
  8006c8:	00144e03          	lbu	t3,1(s0)
  8006cc:	004a8a93          	addi	s5,s5,4
  8006d0:	000c8413          	mv	s0,s9
  8006d4:	d20ddee3          	bgez	s11,800410 <vprintfmt+0xb0>
  8006d8:	000d0d93          	mv	s11,s10
  8006dc:	fff00d13          	li	s10,-1
  8006e0:	d31ff06f          	j	800410 <vprintfmt+0xb0>
  8006e4:	00144e03          	lbu	t3,1(s0)
  8006e8:	00088813          	mv	a6,a7
  8006ec:	000c8413          	mv	s0,s9
  8006f0:	d21ff06f          	j	800410 <vprintfmt+0xb0>
  8006f4:	00144703          	lbu	a4,1(s0)
  8006f8:	fd0e0d13          	addi	s10,t3,-48
  8006fc:	fd070793          	addi	a5,a4,-48
  800700:	14f66863          	bltu	a2,a5,800850 <vprintfmt+0x4f0>
  800704:	000c8413          	mv	s0,s9
  800708:	002d1793          	slli	a5,s10,0x2
  80070c:	01a78d33          	add	s10,a5,s10
  800710:	00140413          	addi	s0,s0,1
  800714:	001d1d13          	slli	s10,s10,0x1
  800718:	00ed0d33          	add	s10,s10,a4
  80071c:	00044703          	lbu	a4,0(s0)
  800720:	fd0d0d13          	addi	s10,s10,-48
  800724:	fd070793          	addi	a5,a4,-48
  800728:	fef670e3          	bleu	a5,a2,800708 <vprintfmt+0x3a8>
  80072c:	00070e13          	mv	t3,a4
  800730:	fa5ff06f          	j	8006d4 <vprintfmt+0x374>
  800734:	0e0dc463          	bltz	s11,80081c <vprintfmt+0x4bc>
  800738:	00144e03          	lbu	t3,1(s0)
  80073c:	000c8413          	mv	s0,s9
  800740:	cd1ff06f          	j	800410 <vprintfmt+0xb0>
  800744:	00090593          	mv	a1,s2
  800748:	02500513          	li	a0,37
  80074c:	000980e7          	jalr	s3
  800750:	fff44783          	lbu	a5,-1(s0)
  800754:	02500713          	li	a4,37
  800758:	00040c93          	mv	s9,s0
  80075c:	c6e780e3          	beq	a5,a4,8003bc <vprintfmt+0x5c>
  800760:	fffc8c93          	addi	s9,s9,-1
  800764:	fffcc783          	lbu	a5,-1(s9)
  800768:	fee79ce3          	bne	a5,a4,800760 <vprintfmt+0x400>
  80076c:	c51ff06f          	j	8003bc <vprintfmt+0x5c>
  800770:	00040513          	mv	a0,s0
  800774:	000980e7          	jalr	s3
  800778:	ed9ff06f          	j	800650 <vprintfmt+0x2f0>
  80077c:	007a8793          	addi	a5,s5,7
  800780:	ff87f793          	andi	a5,a5,-8
  800784:	00878a93          	addi	s5,a5,8
  800788:	0007a603          	lw	a2,0(a5)
  80078c:	0047a683          	lw	a3,4(a5)
  800790:	00800713          	li	a4,8
  800794:	cf5ff06f          	j	800488 <vprintfmt+0x128>
  800798:	007a8793          	addi	a5,s5,7
  80079c:	ff87f793          	andi	a5,a5,-8
  8007a0:	00878a93          	addi	s5,a5,8
  8007a4:	0007a603          	lw	a2,0(a5)
  8007a8:	0047a683          	lw	a3,4(a5)
  8007ac:	00a00713          	li	a4,10
  8007b0:	cd9ff06f          	j	800488 <vprintfmt+0x128>
  8007b4:	007a8793          	addi	a5,s5,7
  8007b8:	ff87f793          	andi	a5,a5,-8
  8007bc:	00878a93          	addi	s5,a5,8
  8007c0:	0007a603          	lw	a2,0(a5)
  8007c4:	0047a683          	lw	a3,4(a5)
  8007c8:	01000713          	li	a4,16
  8007cc:	cbdff06f          	j	800488 <vprintfmt+0x128>
  8007d0:	007a8793          	addi	a5,s5,7
  8007d4:	ff87f793          	andi	a5,a5,-8
  8007d8:	00878a93          	addi	s5,a5,8
  8007dc:	0007a603          	lw	a2,0(a5)
  8007e0:	0047a683          	lw	a3,4(a5)
  8007e4:	cf1ff06f          	j	8004d4 <vprintfmt+0x174>
  8007e8:	00078693          	mv	a3,a5
  8007ec:	00000617          	auipc	a2,0x0
  8007f0:	5bc60613          	addi	a2,a2,1468 # 800da8 <error_string+0x124>
  8007f4:	00090593          	mv	a1,s2
  8007f8:	00098513          	mv	a0,s3
  8007fc:	078000ef          	jal	ra,800874 <printfmt>
  800800:	bbdff06f          	j	8003bc <vprintfmt+0x5c>
  800804:	00044783          	lbu	a5,0(s0)
  800808:	00140a93          	addi	s5,s0,1
  80080c:	00078513          	mv	a0,a5
  800810:	e4078ce3          	beqz	a5,800668 <vprintfmt+0x308>
  800814:	03f00413          	li	s0,63
  800818:	e19ff06f          	j	800630 <vprintfmt+0x2d0>
  80081c:	00000d93          	li	s11,0
  800820:	f19ff06f          	j	800738 <vprintfmt+0x3d8>
  800824:	03b05c63          	blez	s11,80085c <vprintfmt+0x4fc>
  800828:	02d00793          	li	a5,45
  80082c:	00000417          	auipc	s0,0x0
  800830:	57440413          	addi	s0,s0,1396 # 800da0 <error_string+0x11c>
  800834:	daf818e3          	bne	a6,a5,8005e4 <vprintfmt+0x284>
  800838:	00000a97          	auipc	s5,0x0
  80083c:	569a8a93          	addi	s5,s5,1385 # 800da1 <error_string+0x11d>
  800840:	000c0513          	mv	a0,s8
  800844:	000c0793          	mv	a5,s8
  800848:	03f00413          	li	s0,63
  80084c:	de5ff06f          	j	800630 <vprintfmt+0x2d0>
  800850:	00070e13          	mv	t3,a4
  800854:	000c8413          	mv	s0,s9
  800858:	e7dff06f          	j	8006d4 <vprintfmt+0x374>
  80085c:	000c0793          	mv	a5,s8
  800860:	000c0513          	mv	a0,s8
  800864:	00000a97          	auipc	s5,0x0
  800868:	53da8a93          	addi	s5,s5,1341 # 800da1 <error_string+0x11d>
  80086c:	03f00413          	li	s0,63
  800870:	dc1ff06f          	j	800630 <vprintfmt+0x2d0>

00800874 <printfmt>:
  800874:	fc010113          	addi	sp,sp,-64
  800878:	02c10313          	addi	t1,sp,44
  80087c:	02d12623          	sw	a3,44(sp)
  800880:	00030693          	mv	a3,t1
  800884:	00112e23          	sw	ra,28(sp)
  800888:	02e12823          	sw	a4,48(sp)
  80088c:	02f12a23          	sw	a5,52(sp)
  800890:	03012c23          	sw	a6,56(sp)
  800894:	03112e23          	sw	a7,60(sp)
  800898:	00612623          	sw	t1,12(sp)
  80089c:	ac5ff0ef          	jal	ra,800360 <vprintfmt>
  8008a0:	01c12083          	lw	ra,28(sp)
  8008a4:	04010113          	addi	sp,sp,64
  8008a8:	00008067          	ret

008008ac <main>:
  8008ac:	fd010113          	addi	sp,sp,-48
  8008b0:	19000593          	li	a1,400
  8008b4:	00000517          	auipc	a0,0x0
  8008b8:	50450513          	addi	a0,a0,1284 # 800db8 <error_string+0x134>
  8008bc:	02112623          	sw	ra,44(sp)
  8008c0:	02812423          	sw	s0,40(sp)
  8008c4:	02912223          	sw	s1,36(sp)
  8008c8:	03212023          	sw	s2,32(sp)
  8008cc:	01312e23          	sw	s3,28(sp)
  8008d0:	01412c23          	sw	s4,24(sp)
  8008d4:	01512a23          	sw	s5,20(sp)
  8008d8:	01612823          	sw	s6,16(sp)
  8008dc:	919ff0ef          	jal	ra,8001f4 <cprintf>
  8008e0:	19000513          	li	a0,400
  8008e4:	8a1ff0ef          	jal	ra,800184 <sleep>
  8008e8:	01400613          	li	a2,20
  8008ec:	00000593          	li	a1,0
  8008f0:	00000517          	auipc	a0,0x0
  8008f4:	73850513          	addi	a0,a0,1848 # 801028 <pids>
  8008f8:	9a5ff0ef          	jal	ra,80029c <memset>
  8008fc:	00000497          	auipc	s1,0x0
  800900:	72c48493          	addi	s1,s1,1836 # 801028 <pids>
  800904:	00600513          	li	a0,6
  800908:	00000a97          	auipc	s5,0x0
  80090c:	6f8a8a93          	addi	s5,s5,1784 # 801000 <acc>
  800910:	871ff0ef          	jal	ra,800180 <lab6_set_priority>
  800914:	000a8993          	mv	s3,s5
  800918:	00048b13          	mv	s6,s1
  80091c:	00048913          	mv	s2,s1
  800920:	00000413          	li	s0,0
  800924:	00500a13          	li	s4,5
  800928:	0009a023          	sw	zero,0(s3)
  80092c:	841ff0ef          	jal	ra,80016c <fork>
  800930:	00a92023          	sw	a0,0(s2)
  800934:	10050463          	beqz	a0,800a3c <main+0x190>
  800938:	18054663          	bltz	a0,800ac4 <main+0x218>
  80093c:	00140413          	addi	s0,s0,1
  800940:	00498993          	addi	s3,s3,4
  800944:	00490913          	addi	s2,s2,4
  800948:	ff4410e3          	bne	s0,s4,800928 <main+0x7c>
  80094c:	00000517          	auipc	a0,0x0
  800950:	4b450513          	addi	a0,a0,1204 # 800e00 <error_string+0x17c>
  800954:	00000917          	auipc	s2,0x0
  800958:	6c090913          	addi	s2,s2,1728 # 801014 <status>
  80095c:	899ff0ef          	jal	ra,8001f4 <cprintf>
  800960:	00000b17          	auipc	s6,0x0
  800964:	6c8b0b13          	addi	s6,s6,1736 # 801028 <pids>
  800968:	00090413          	mv	s0,s2
  80096c:	00000a97          	auipc	s5,0x0
  800970:	4bca8a93          	addi	s5,s5,1212 # 800e28 <error_string+0x1a4>
  800974:	0004a503          	lw	a0,0(s1)
  800978:	00040593          	mv	a1,s0
  80097c:	00042023          	sw	zero,0(s0)
  800980:	ff0ff0ef          	jal	ra,800170 <waitpid>
  800984:	00042a03          	lw	s4,0(s0)
  800988:	0004a983          	lw	s3,0(s1)
  80098c:	ff0ff0ef          	jal	ra,80017c <gettime_msec>
  800990:	00440413          	addi	s0,s0,4
  800994:	00050693          	mv	a3,a0
  800998:	000a0613          	mv	a2,s4
  80099c:	00098593          	mv	a1,s3
  8009a0:	000a8513          	mv	a0,s5
  8009a4:	00448493          	addi	s1,s1,4
  8009a8:	84dff0ef          	jal	ra,8001f4 <cprintf>
  8009ac:	fd6414e3          	bne	s0,s6,800974 <main+0xc8>
  8009b0:	00000517          	auipc	a0,0x0
  8009b4:	49850513          	addi	a0,a0,1176 # 800e48 <error_string+0x1c4>
  8009b8:	83dff0ef          	jal	ra,8001f4 <cprintf>
  8009bc:	00000517          	auipc	a0,0x0
  8009c0:	4a450513          	addi	a0,a0,1188 # 800e60 <error_string+0x1dc>
  8009c4:	831ff0ef          	jal	ra,8001f4 <cprintf>
  8009c8:	00000497          	auipc	s1,0x0
  8009cc:	4b848493          	addi	s1,s1,1208 # 800e80 <error_string+0x1fc>
  8009d0:	00092583          	lw	a1,0(s2)
  8009d4:	00000797          	auipc	a5,0x0
  8009d8:	6407a783          	lw	a5,1600(a5) # 801014 <status>
  8009dc:	00490913          	addi	s2,s2,4
  8009e0:	00159593          	slli	a1,a1,0x1
  8009e4:	02f5c5b3          	div	a1,a1,a5
  8009e8:	00048513          	mv	a0,s1
  8009ec:	00158593          	addi	a1,a1,1
  8009f0:	01f5d793          	srli	a5,a1,0x1f
  8009f4:	00b785b3          	add	a1,a5,a1
  8009f8:	4015d593          	srai	a1,a1,0x1
  8009fc:	ff8ff0ef          	jal	ra,8001f4 <cprintf>
  800a00:	fc8918e3          	bne	s2,s0,8009d0 <main+0x124>
  800a04:	00000517          	auipc	a0,0x0
  800a08:	42050513          	addi	a0,a0,1056 # 800e24 <error_string+0x1a0>
  800a0c:	fe8ff0ef          	jal	ra,8001f4 <cprintf>
  800a10:	02c12083          	lw	ra,44(sp)
  800a14:	00000513          	li	a0,0
  800a18:	02812403          	lw	s0,40(sp)
  800a1c:	02412483          	lw	s1,36(sp)
  800a20:	02012903          	lw	s2,32(sp)
  800a24:	01c12983          	lw	s3,28(sp)
  800a28:	01812a03          	lw	s4,24(sp)
  800a2c:	01412a83          	lw	s5,20(sp)
  800a30:	01012b03          	lw	s6,16(sp)
  800a34:	03010113          	addi	sp,sp,48
  800a38:	00008067          	ret
  800a3c:	00140513          	addi	a0,s0,1
  800a40:	00241413          	slli	s0,s0,0x2
  800a44:	008a8433          	add	s0,s5,s0
  800a48:	000014b7          	lui	s1,0x1
  800a4c:	f34ff0ef          	jal	ra,800180 <lab6_set_priority>
  800a50:	fa048493          	addi	s1,s1,-96 # fa0 <__STAB_BEGIN__-0x1ff070>
  800a54:	00042023          	sw	zero,0(s0)
  800a58:	57800993          	li	s3,1400
  800a5c:	00042683          	lw	a3,0(s0)
  800a60:	00168693          	addi	a3,a3,1
  800a64:	0c800713          	li	a4,200
  800a68:	00c12783          	lw	a5,12(sp)
  800a6c:	fff70713          	addi	a4,a4,-1
  800a70:	0017b793          	seqz	a5,a5
  800a74:	00f12623          	sw	a5,12(sp)
  800a78:	fe0718e3          	bnez	a4,800a68 <main+0x1bc>
  800a7c:	0296f7b3          	remu	a5,a3,s1
  800a80:	00168713          	addi	a4,a3,1
  800a84:	00078663          	beqz	a5,800a90 <main+0x1e4>
  800a88:	00070693          	mv	a3,a4
  800a8c:	fd9ff06f          	j	800a64 <main+0x1b8>
  800a90:	00d42023          	sw	a3,0(s0)
  800a94:	ee8ff0ef          	jal	ra,80017c <gettime_msec>
  800a98:	00050913          	mv	s2,a0
  800a9c:	fca9d0e3          	ble	a0,s3,800a5c <main+0x1b0>
  800aa0:	ed8ff0ef          	jal	ra,800178 <getpid>
  800aa4:	00042603          	lw	a2,0(s0)
  800aa8:	00050593          	mv	a1,a0
  800aac:	00090693          	mv	a3,s2
  800ab0:	00000517          	auipc	a0,0x0
  800ab4:	33050513          	addi	a0,a0,816 # 800de0 <error_string+0x15c>
  800ab8:	f3cff0ef          	jal	ra,8001f4 <cprintf>
  800abc:	00042503          	lw	a0,0(s0)
  800ac0:	e90ff0ef          	jal	ra,800150 <exit>
  800ac4:	00000413          	li	s0,0
  800ac8:	01400493          	li	s1,20
  800acc:	008b07b3          	add	a5,s6,s0
  800ad0:	0007a503          	lw	a0,0(a5)
  800ad4:	00a05463          	blez	a0,800adc <main+0x230>
  800ad8:	e9cff0ef          	jal	ra,800174 <kill>
  800adc:	00440413          	addi	s0,s0,4
  800ae0:	fe9416e3          	bne	s0,s1,800acc <main+0x220>
  800ae4:	00000617          	auipc	a2,0x0
  800ae8:	3a060613          	addi	a2,a2,928 # 800e84 <error_string+0x200>
  800aec:	04e00593          	li	a1,78
  800af0:	00000517          	auipc	a0,0x0
  800af4:	3a050513          	addi	a0,a0,928 # 800e90 <error_string+0x20c>
  800af8:	d28ff0ef          	jal	ra,800020 <__panic>
