
obj/__user_matrix.out:     file format elf32-littleriscv


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
  800040:	b3c50513          	addi	a0,a0,-1220 # 800b78 <main+0x100>
  800044:	00112e23          	sw	ra,28(sp)
  800048:	02d12623          	sw	a3,44(sp)
  80004c:	02e12823          	sw	a4,48(sp)
  800050:	03012c23          	sw	a6,56(sp)
  800054:	03112e23          	sw	a7,60(sp)
  800058:	00f12623          	sw	a5,12(sp)
  80005c:	180000ef          	jal	ra,8001dc <cprintf>
  800060:	00c12583          	lw	a1,12(sp)
  800064:	00040513          	mv	a0,s0
  800068:	140000ef          	jal	ra,8001a8 <vcprintf>
  80006c:	00001517          	auipc	a0,0x1
  800070:	de050513          	addi	a0,a0,-544 # 800e4c <error_string+0x14c>
  800074:	168000ef          	jal	ra,8001dc <cprintf>
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
  800148:	a5050513          	addi	a0,a0,-1456 # 800b94 <main+0x11c>
  80014c:	090000ef          	jal	ra,8001dc <cprintf>
  800150:	0000006f          	j	800150 <exit+0x18>

00800154 <fork>:
  800154:	fa5ff06f          	j	8000f8 <sys_fork>

00800158 <wait>:
  800158:	00000593          	li	a1,0
  80015c:	00000513          	li	a0,0
  800160:	fa1ff06f          	j	800100 <sys_wait>

00800164 <yield>:
  800164:	fadff06f          	j	800110 <sys_yield>

00800168 <kill>:
  800168:	fb1ff06f          	j	800118 <sys_kill>

0080016c <getpid>:
  80016c:	fb9ff06f          	j	800124 <sys_getpid>

00800170 <_start>:
  800170:	0c4000ef          	jal	ra,800234 <umain>
  800174:	0000006f          	j	800174 <_start+0x4>

00800178 <cputch>:
  800178:	ff010113          	addi	sp,sp,-16
  80017c:	00112623          	sw	ra,12(sp)
  800180:	00812423          	sw	s0,8(sp)
  800184:	00058413          	mv	s0,a1
  800188:	fa5ff0ef          	jal	ra,80012c <sys_putc>
  80018c:	00042783          	lw	a5,0(s0)
  800190:	00c12083          	lw	ra,12(sp)
  800194:	00178793          	addi	a5,a5,1
  800198:	00f42023          	sw	a5,0(s0)
  80019c:	00812403          	lw	s0,8(sp)
  8001a0:	01010113          	addi	sp,sp,16
  8001a4:	00008067          	ret

008001a8 <vcprintf>:
  8001a8:	fe010113          	addi	sp,sp,-32
  8001ac:	00058693          	mv	a3,a1
  8001b0:	00050613          	mv	a2,a0
  8001b4:	00c10593          	addi	a1,sp,12
  8001b8:	00000517          	auipc	a0,0x0
  8001bc:	fc050513          	addi	a0,a0,-64 # 800178 <cputch>
  8001c0:	00112e23          	sw	ra,28(sp)
  8001c4:	00012623          	sw	zero,12(sp)
  8001c8:	180000ef          	jal	ra,800348 <vprintfmt>
  8001cc:	01c12083          	lw	ra,28(sp)
  8001d0:	00c12503          	lw	a0,12(sp)
  8001d4:	02010113          	addi	sp,sp,32
  8001d8:	00008067          	ret

008001dc <cprintf>:
  8001dc:	fc010113          	addi	sp,sp,-64
  8001e0:	02410313          	addi	t1,sp,36
  8001e4:	02b12223          	sw	a1,36(sp)
  8001e8:	02c12423          	sw	a2,40(sp)
  8001ec:	02d12623          	sw	a3,44(sp)
  8001f0:	00050613          	mv	a2,a0
  8001f4:	00c10593          	addi	a1,sp,12
  8001f8:	00000517          	auipc	a0,0x0
  8001fc:	f8050513          	addi	a0,a0,-128 # 800178 <cputch>
  800200:	00030693          	mv	a3,t1
  800204:	00112e23          	sw	ra,28(sp)
  800208:	02e12823          	sw	a4,48(sp)
  80020c:	02f12a23          	sw	a5,52(sp)
  800210:	03012c23          	sw	a6,56(sp)
  800214:	03112e23          	sw	a7,60(sp)
  800218:	00612423          	sw	t1,8(sp)
  80021c:	00012623          	sw	zero,12(sp)
  800220:	128000ef          	jal	ra,800348 <vprintfmt>
  800224:	01c12083          	lw	ra,28(sp)
  800228:	00c12503          	lw	a0,12(sp)
  80022c:	04010113          	addi	sp,sp,64
  800230:	00008067          	ret

00800234 <umain>:
  800234:	ff010113          	addi	sp,sp,-16
  800238:	00112623          	sw	ra,12(sp)
  80023c:	03d000ef          	jal	ra,800a78 <main>
  800240:	ef9ff0ef          	jal	ra,800138 <exit>

00800244 <strnlen>:
  800244:	00050693          	mv	a3,a0
  800248:	02058a63          	beqz	a1,80027c <strnlen+0x38>
  80024c:	00054703          	lbu	a4,0(a0)
  800250:	00150793          	addi	a5,a0,1
  800254:	02070463          	beqz	a4,80027c <strnlen+0x38>
  800258:	00b505b3          	add	a1,a0,a1
  80025c:	0100006f          	j	80026c <strnlen+0x28>
  800260:	00178793          	addi	a5,a5,1
  800264:	fff7c703          	lbu	a4,-1(a5)
  800268:	00070863          	beqz	a4,800278 <strnlen+0x34>
  80026c:	40d78533          	sub	a0,a5,a3
  800270:	feb798e3          	bne	a5,a1,800260 <strnlen+0x1c>
  800274:	00008067          	ret
  800278:	00008067          	ret
  80027c:	00000513          	li	a0,0
  800280:	00008067          	ret

00800284 <memset>:
  800284:	00c50733          	add	a4,a0,a2
  800288:	00050793          	mv	a5,a0
  80028c:	00060863          	beqz	a2,80029c <memset+0x18>
  800290:	00178793          	addi	a5,a5,1
  800294:	feb78fa3          	sb	a1,-1(a5)
  800298:	fef71ce3          	bne	a4,a5,800290 <memset+0xc>
  80029c:	00008067          	ret

008002a0 <printnum>:
  8002a0:	fe010113          	addi	sp,sp,-32
  8002a4:	00912a23          	sw	s1,20(sp)
  8002a8:	01212823          	sw	s2,16(sp)
  8002ac:	01312623          	sw	s3,12(sp)
  8002b0:	01412423          	sw	s4,8(sp)
  8002b4:	00112e23          	sw	ra,28(sp)
  8002b8:	00812c23          	sw	s0,24(sp)
  8002bc:	00050493          	mv	s1,a0
  8002c0:	00058913          	mv	s2,a1
  8002c4:	00080993          	mv	s3,a6
  8002c8:	02e67a33          	remu	s4,a2,a4
  8002cc:	04069e63          	bnez	a3,800328 <printnum+0x88>
  8002d0:	04e67c63          	bleu	a4,a2,800328 <printnum+0x88>
  8002d4:	fff78413          	addi	s0,a5,-1
  8002d8:	00805c63          	blez	s0,8002f0 <printnum+0x50>
  8002dc:	fff40413          	addi	s0,s0,-1
  8002e0:	00090593          	mv	a1,s2
  8002e4:	00098513          	mv	a0,s3
  8002e8:	000480e7          	jalr	s1
  8002ec:	fe0418e3          	bnez	s0,8002dc <printnum+0x3c>
  8002f0:	00001797          	auipc	a5,0x1
  8002f4:	a7478793          	addi	a5,a5,-1420 # 800d64 <error_string+0x64>
  8002f8:	014787b3          	add	a5,a5,s4
  8002fc:	00090593          	mv	a1,s2
  800300:	00048313          	mv	t1,s1
  800304:	01c12083          	lw	ra,28(sp)
  800308:	01812403          	lw	s0,24(sp)
  80030c:	01412483          	lw	s1,20(sp)
  800310:	01012903          	lw	s2,16(sp)
  800314:	00c12983          	lw	s3,12(sp)
  800318:	00812a03          	lw	s4,8(sp)
  80031c:	0007c503          	lbu	a0,0(a5)
  800320:	02010113          	addi	sp,sp,32
  800324:	00030067          	jr	t1
  800328:	02e65633          	divu	a2,a2,a4
  80032c:	00098813          	mv	a6,s3
  800330:	fff78793          	addi	a5,a5,-1
  800334:	00000693          	li	a3,0
  800338:	00090593          	mv	a1,s2
  80033c:	00048513          	mv	a0,s1
  800340:	f61ff0ef          	jal	ra,8002a0 <printnum>
  800344:	fadff06f          	j	8002f0 <printnum+0x50>

00800348 <vprintfmt>:
  800348:	fb010113          	addi	sp,sp,-80
  80034c:	05212023          	sw	s2,64(sp)
  800350:	03312e23          	sw	s3,60(sp)
  800354:	03412c23          	sw	s4,56(sp)
  800358:	03512a23          	sw	s5,52(sp)
  80035c:	03612823          	sw	s6,48(sp)
  800360:	03712623          	sw	s7,44(sp)
  800364:	03812423          	sw	s8,40(sp)
  800368:	03912223          	sw	s9,36(sp)
  80036c:	04112623          	sw	ra,76(sp)
  800370:	04812423          	sw	s0,72(sp)
  800374:	04912223          	sw	s1,68(sp)
  800378:	03a12023          	sw	s10,32(sp)
  80037c:	01b12e23          	sw	s11,28(sp)
  800380:	00050993          	mv	s3,a0
  800384:	00058913          	mv	s2,a1
  800388:	00060c93          	mv	s9,a2
  80038c:	00068a93          	mv	s5,a3
  800390:	00001a17          	auipc	s4,0x1
  800394:	818a0a13          	addi	s4,s4,-2024 # 800ba8 <main+0x130>
  800398:	02800c13          	li	s8,40
  80039c:	fff00b13          	li	s6,-1
  8003a0:	05e00b93          	li	s7,94
  8003a4:	000cc503          	lbu	a0,0(s9)
  8003a8:	02500493          	li	s1,37
  8003ac:	001c8413          	addi	s0,s9,1
  8003b0:	00950e63          	beq	a0,s1,8003cc <vprintfmt+0x84>
  8003b4:	06050463          	beqz	a0,80041c <vprintfmt+0xd4>
  8003b8:	00090593          	mv	a1,s2
  8003bc:	00140413          	addi	s0,s0,1
  8003c0:	000980e7          	jalr	s3
  8003c4:	fff44503          	lbu	a0,-1(s0)
  8003c8:	fe9516e3          	bne	a0,s1,8003b4 <vprintfmt+0x6c>
  8003cc:	00044e03          	lbu	t3,0(s0)
  8003d0:	fff00d13          	li	s10,-1
  8003d4:	02000813          	li	a6,32
  8003d8:	00000493          	li	s1,0
  8003dc:	00000593          	li	a1,0
  8003e0:	000d0d93          	mv	s11,s10
  8003e4:	05500693          	li	a3,85
  8003e8:	00100313          	li	t1,1
  8003ec:	03000893          	li	a7,48
  8003f0:	00900613          	li	a2,9
  8003f4:	02d00513          	li	a0,45
  8003f8:	fdde0713          	addi	a4,t3,-35
  8003fc:	0ff77713          	andi	a4,a4,255
  800400:	00140c93          	addi	s9,s0,1
  800404:	32e6e463          	bltu	a3,a4,80072c <vprintfmt+0x3e4>
  800408:	00271713          	slli	a4,a4,0x2
  80040c:	01470733          	add	a4,a4,s4
  800410:	00072783          	lw	a5,0(a4)
  800414:	014787b3          	add	a5,a5,s4
  800418:	00078067          	jr	a5
  80041c:	04c12083          	lw	ra,76(sp)
  800420:	04812403          	lw	s0,72(sp)
  800424:	04412483          	lw	s1,68(sp)
  800428:	04012903          	lw	s2,64(sp)
  80042c:	03c12983          	lw	s3,60(sp)
  800430:	03812a03          	lw	s4,56(sp)
  800434:	03412a83          	lw	s5,52(sp)
  800438:	03012b03          	lw	s6,48(sp)
  80043c:	02c12b83          	lw	s7,44(sp)
  800440:	02812c03          	lw	s8,40(sp)
  800444:	02412c83          	lw	s9,36(sp)
  800448:	02012d03          	lw	s10,32(sp)
  80044c:	01c12d83          	lw	s11,28(sp)
  800450:	05010113          	addi	sp,sp,80
  800454:	00008067          	ret
  800458:	00100793          	li	a5,1
  80045c:	34b7c063          	blt	a5,a1,80079c <vprintfmt+0x454>
  800460:	000aa603          	lw	a2,0(s5)
  800464:	00000693          	li	a3,0
  800468:	004a8a93          	addi	s5,s5,4
  80046c:	01000713          	li	a4,16
  800470:	000d8793          	mv	a5,s11
  800474:	00090593          	mv	a1,s2
  800478:	00098513          	mv	a0,s3
  80047c:	e25ff0ef          	jal	ra,8002a0 <printnum>
  800480:	f25ff06f          	j	8003a4 <vprintfmt+0x5c>
  800484:	00144e03          	lbu	t3,1(s0)
  800488:	00030493          	mv	s1,t1
  80048c:	000c8413          	mv	s0,s9
  800490:	f69ff06f          	j	8003f8 <vprintfmt+0xb0>
  800494:	000aa503          	lw	a0,0(s5)
  800498:	00090593          	mv	a1,s2
  80049c:	004a8a93          	addi	s5,s5,4
  8004a0:	000980e7          	jalr	s3
  8004a4:	f01ff06f          	j	8003a4 <vprintfmt+0x5c>
  8004a8:	00100793          	li	a5,1
  8004ac:	30b7c663          	blt	a5,a1,8007b8 <vprintfmt+0x470>
  8004b0:	000aa603          	lw	a2,0(s5)
  8004b4:	004a8a93          	addi	s5,s5,4
  8004b8:	41f65693          	srai	a3,a2,0x1f
  8004bc:	00a00713          	li	a4,10
  8004c0:	fa06d8e3          	bgez	a3,800470 <vprintfmt+0x128>
  8004c4:	00090593          	mv	a1,s2
  8004c8:	02d00513          	li	a0,45
  8004cc:	00d12623          	sw	a3,12(sp)
  8004d0:	00c12423          	sw	a2,8(sp)
  8004d4:	00e12223          	sw	a4,4(sp)
  8004d8:	01012023          	sw	a6,0(sp)
  8004dc:	000980e7          	jalr	s3
  8004e0:	00812603          	lw	a2,8(sp)
  8004e4:	00c12683          	lw	a3,12(sp)
  8004e8:	00012803          	lw	a6,0(sp)
  8004ec:	40c00633          	neg	a2,a2
  8004f0:	00c037b3          	snez	a5,a2
  8004f4:	40d006b3          	neg	a3,a3
  8004f8:	40f686b3          	sub	a3,a3,a5
  8004fc:	00412703          	lw	a4,4(sp)
  800500:	f71ff06f          	j	800470 <vprintfmt+0x128>
  800504:	000aa783          	lw	a5,0(s5)
  800508:	01800693          	li	a3,24
  80050c:	004a8a93          	addi	s5,s5,4
  800510:	41f7d713          	srai	a4,a5,0x1f
  800514:	00f747b3          	xor	a5,a4,a5
  800518:	40e787b3          	sub	a5,a5,a4
  80051c:	2af6ca63          	blt	a3,a5,8007d0 <vprintfmt+0x488>
  800520:	00279693          	slli	a3,a5,0x2
  800524:	00000717          	auipc	a4,0x0
  800528:	7dc70713          	addi	a4,a4,2012 # 800d00 <error_string>
  80052c:	00d70733          	add	a4,a4,a3
  800530:	00072683          	lw	a3,0(a4)
  800534:	28068e63          	beqz	a3,8007d0 <vprintfmt+0x488>
  800538:	00001617          	auipc	a2,0x1
  80053c:	8f860613          	addi	a2,a2,-1800 # 800e30 <error_string+0x130>
  800540:	00090593          	mv	a1,s2
  800544:	00098513          	mv	a0,s3
  800548:	314000ef          	jal	ra,80085c <printfmt>
  80054c:	e59ff06f          	j	8003a4 <vprintfmt+0x5c>
  800550:	00144e03          	lbu	t3,1(s0)
  800554:	00158593          	addi	a1,a1,1
  800558:	000c8413          	mv	s0,s9
  80055c:	e9dff06f          	j	8003f8 <vprintfmt+0xb0>
  800560:	00100793          	li	a5,1
  800564:	20b7c063          	blt	a5,a1,800764 <vprintfmt+0x41c>
  800568:	000aa603          	lw	a2,0(s5)
  80056c:	00000693          	li	a3,0
  800570:	004a8a93          	addi	s5,s5,4
  800574:	00800713          	li	a4,8
  800578:	ef9ff06f          	j	800470 <vprintfmt+0x128>
  80057c:	03000513          	li	a0,48
  800580:	00090593          	mv	a1,s2
  800584:	01012023          	sw	a6,0(sp)
  800588:	000980e7          	jalr	s3
  80058c:	00090593          	mv	a1,s2
  800590:	07800513          	li	a0,120
  800594:	000980e7          	jalr	s3
  800598:	000aa603          	lw	a2,0(s5)
  80059c:	00000693          	li	a3,0
  8005a0:	01000713          	li	a4,16
  8005a4:	004a8a93          	addi	s5,s5,4
  8005a8:	00012803          	lw	a6,0(sp)
  8005ac:	ec5ff06f          	j	800470 <vprintfmt+0x128>
  8005b0:	000aa403          	lw	s0,0(s5)
  8005b4:	004a8793          	addi	a5,s5,4
  8005b8:	00f12223          	sw	a5,4(sp)
  8005bc:	24040863          	beqz	s0,80080c <vprintfmt+0x4c4>
  8005c0:	05b05263          	blez	s11,800604 <vprintfmt+0x2bc>
  8005c4:	02d00793          	li	a5,45
  8005c8:	22f80263          	beq	a6,a5,8007ec <vprintfmt+0x4a4>
  8005cc:	000d0593          	mv	a1,s10
  8005d0:	00040513          	mv	a0,s0
  8005d4:	01012023          	sw	a6,0(sp)
  8005d8:	c6dff0ef          	jal	ra,800244 <strnlen>
  8005dc:	40ad8db3          	sub	s11,s11,a0
  8005e0:	03b05263          	blez	s11,800604 <vprintfmt+0x2bc>
  8005e4:	00012803          	lw	a6,0(sp)
  8005e8:	00080513          	mv	a0,a6
  8005ec:	00090593          	mv	a1,s2
  8005f0:	01012023          	sw	a6,0(sp)
  8005f4:	fffd8d93          	addi	s11,s11,-1
  8005f8:	000980e7          	jalr	s3
  8005fc:	00012803          	lw	a6,0(sp)
  800600:	fe0d94e3          	bnez	s11,8005e8 <vprintfmt+0x2a0>
  800604:	00044783          	lbu	a5,0(s0)
  800608:	00140a93          	addi	s5,s0,1
  80060c:	00078513          	mv	a0,a5
  800610:	04078c63          	beqz	a5,800668 <vprintfmt+0x320>
  800614:	03f00413          	li	s0,63
  800618:	000d4663          	bltz	s10,800624 <vprintfmt+0x2dc>
  80061c:	fffd0d13          	addi	s10,s10,-1
  800620:	036d0663          	beq	s10,s6,80064c <vprintfmt+0x304>
  800624:	00090593          	mv	a1,s2
  800628:	00048663          	beqz	s1,800634 <vprintfmt+0x2ec>
  80062c:	fe078793          	addi	a5,a5,-32
  800630:	12fbe463          	bltu	s7,a5,800758 <vprintfmt+0x410>
  800634:	000980e7          	jalr	s3
  800638:	001a8a93          	addi	s5,s5,1
  80063c:	fffac783          	lbu	a5,-1(s5)
  800640:	fffd8d93          	addi	s11,s11,-1
  800644:	00078513          	mv	a0,a5
  800648:	fc0798e3          	bnez	a5,800618 <vprintfmt+0x2d0>
  80064c:	01b05e63          	blez	s11,800668 <vprintfmt+0x320>
  800650:	02000413          	li	s0,32
  800654:	fffd8d93          	addi	s11,s11,-1
  800658:	00090593          	mv	a1,s2
  80065c:	00040513          	mv	a0,s0
  800660:	000980e7          	jalr	s3
  800664:	fe0d98e3          	bnez	s11,800654 <vprintfmt+0x30c>
  800668:	00412a83          	lw	s5,4(sp)
  80066c:	d39ff06f          	j	8003a4 <vprintfmt+0x5c>
  800670:	00100793          	li	a5,1
  800674:	10b7c663          	blt	a5,a1,800780 <vprintfmt+0x438>
  800678:	000aa603          	lw	a2,0(s5)
  80067c:	00000693          	li	a3,0
  800680:	004a8a93          	addi	s5,s5,4
  800684:	00a00713          	li	a4,10
  800688:	de9ff06f          	j	800470 <vprintfmt+0x128>
  80068c:	00144e03          	lbu	t3,1(s0)
  800690:	00050813          	mv	a6,a0
  800694:	000c8413          	mv	s0,s9
  800698:	d61ff06f          	j	8003f8 <vprintfmt+0xb0>
  80069c:	00090593          	mv	a1,s2
  8006a0:	02500513          	li	a0,37
  8006a4:	000980e7          	jalr	s3
  8006a8:	cfdff06f          	j	8003a4 <vprintfmt+0x5c>
  8006ac:	000aad03          	lw	s10,0(s5)
  8006b0:	00144e03          	lbu	t3,1(s0)
  8006b4:	004a8a93          	addi	s5,s5,4
  8006b8:	000c8413          	mv	s0,s9
  8006bc:	d20ddee3          	bgez	s11,8003f8 <vprintfmt+0xb0>
  8006c0:	000d0d93          	mv	s11,s10
  8006c4:	fff00d13          	li	s10,-1
  8006c8:	d31ff06f          	j	8003f8 <vprintfmt+0xb0>
  8006cc:	00144e03          	lbu	t3,1(s0)
  8006d0:	00088813          	mv	a6,a7
  8006d4:	000c8413          	mv	s0,s9
  8006d8:	d21ff06f          	j	8003f8 <vprintfmt+0xb0>
  8006dc:	00144703          	lbu	a4,1(s0)
  8006e0:	fd0e0d13          	addi	s10,t3,-48
  8006e4:	fd070793          	addi	a5,a4,-48
  8006e8:	14f66863          	bltu	a2,a5,800838 <vprintfmt+0x4f0>
  8006ec:	000c8413          	mv	s0,s9
  8006f0:	002d1793          	slli	a5,s10,0x2
  8006f4:	01a78d33          	add	s10,a5,s10
  8006f8:	00140413          	addi	s0,s0,1
  8006fc:	001d1d13          	slli	s10,s10,0x1
  800700:	00ed0d33          	add	s10,s10,a4
  800704:	00044703          	lbu	a4,0(s0)
  800708:	fd0d0d13          	addi	s10,s10,-48
  80070c:	fd070793          	addi	a5,a4,-48
  800710:	fef670e3          	bleu	a5,a2,8006f0 <vprintfmt+0x3a8>
  800714:	00070e13          	mv	t3,a4
  800718:	fa5ff06f          	j	8006bc <vprintfmt+0x374>
  80071c:	0e0dc463          	bltz	s11,800804 <vprintfmt+0x4bc>
  800720:	00144e03          	lbu	t3,1(s0)
  800724:	000c8413          	mv	s0,s9
  800728:	cd1ff06f          	j	8003f8 <vprintfmt+0xb0>
  80072c:	00090593          	mv	a1,s2
  800730:	02500513          	li	a0,37
  800734:	000980e7          	jalr	s3
  800738:	fff44783          	lbu	a5,-1(s0)
  80073c:	02500713          	li	a4,37
  800740:	00040c93          	mv	s9,s0
  800744:	c6e780e3          	beq	a5,a4,8003a4 <vprintfmt+0x5c>
  800748:	fffc8c93          	addi	s9,s9,-1
  80074c:	fffcc783          	lbu	a5,-1(s9)
  800750:	fee79ce3          	bne	a5,a4,800748 <vprintfmt+0x400>
  800754:	c51ff06f          	j	8003a4 <vprintfmt+0x5c>
  800758:	00040513          	mv	a0,s0
  80075c:	000980e7          	jalr	s3
  800760:	ed9ff06f          	j	800638 <vprintfmt+0x2f0>
  800764:	007a8793          	addi	a5,s5,7
  800768:	ff87f793          	andi	a5,a5,-8
  80076c:	00878a93          	addi	s5,a5,8
  800770:	0007a603          	lw	a2,0(a5)
  800774:	0047a683          	lw	a3,4(a5)
  800778:	00800713          	li	a4,8
  80077c:	cf5ff06f          	j	800470 <vprintfmt+0x128>
  800780:	007a8793          	addi	a5,s5,7
  800784:	ff87f793          	andi	a5,a5,-8
  800788:	00878a93          	addi	s5,a5,8
  80078c:	0007a603          	lw	a2,0(a5)
  800790:	0047a683          	lw	a3,4(a5)
  800794:	00a00713          	li	a4,10
  800798:	cd9ff06f          	j	800470 <vprintfmt+0x128>
  80079c:	007a8793          	addi	a5,s5,7
  8007a0:	ff87f793          	andi	a5,a5,-8
  8007a4:	00878a93          	addi	s5,a5,8
  8007a8:	0007a603          	lw	a2,0(a5)
  8007ac:	0047a683          	lw	a3,4(a5)
  8007b0:	01000713          	li	a4,16
  8007b4:	cbdff06f          	j	800470 <vprintfmt+0x128>
  8007b8:	007a8793          	addi	a5,s5,7
  8007bc:	ff87f793          	andi	a5,a5,-8
  8007c0:	00878a93          	addi	s5,a5,8
  8007c4:	0007a603          	lw	a2,0(a5)
  8007c8:	0047a683          	lw	a3,4(a5)
  8007cc:	cf1ff06f          	j	8004bc <vprintfmt+0x174>
  8007d0:	00078693          	mv	a3,a5
  8007d4:	00000617          	auipc	a2,0x0
  8007d8:	65060613          	addi	a2,a2,1616 # 800e24 <error_string+0x124>
  8007dc:	00090593          	mv	a1,s2
  8007e0:	00098513          	mv	a0,s3
  8007e4:	078000ef          	jal	ra,80085c <printfmt>
  8007e8:	bbdff06f          	j	8003a4 <vprintfmt+0x5c>
  8007ec:	00044783          	lbu	a5,0(s0)
  8007f0:	00140a93          	addi	s5,s0,1
  8007f4:	00078513          	mv	a0,a5
  8007f8:	e4078ce3          	beqz	a5,800650 <vprintfmt+0x308>
  8007fc:	03f00413          	li	s0,63
  800800:	e19ff06f          	j	800618 <vprintfmt+0x2d0>
  800804:	00000d93          	li	s11,0
  800808:	f19ff06f          	j	800720 <vprintfmt+0x3d8>
  80080c:	03b05c63          	blez	s11,800844 <vprintfmt+0x4fc>
  800810:	02d00793          	li	a5,45
  800814:	00000417          	auipc	s0,0x0
  800818:	60840413          	addi	s0,s0,1544 # 800e1c <error_string+0x11c>
  80081c:	daf818e3          	bne	a6,a5,8005cc <vprintfmt+0x284>
  800820:	00000a97          	auipc	s5,0x0
  800824:	5fda8a93          	addi	s5,s5,1533 # 800e1d <error_string+0x11d>
  800828:	000c0513          	mv	a0,s8
  80082c:	000c0793          	mv	a5,s8
  800830:	03f00413          	li	s0,63
  800834:	de5ff06f          	j	800618 <vprintfmt+0x2d0>
  800838:	00070e13          	mv	t3,a4
  80083c:	000c8413          	mv	s0,s9
  800840:	e7dff06f          	j	8006bc <vprintfmt+0x374>
  800844:	000c0793          	mv	a5,s8
  800848:	000c0513          	mv	a0,s8
  80084c:	00000a97          	auipc	s5,0x0
  800850:	5d1a8a93          	addi	s5,s5,1489 # 800e1d <error_string+0x11d>
  800854:	03f00413          	li	s0,63
  800858:	dc1ff06f          	j	800618 <vprintfmt+0x2d0>

0080085c <printfmt>:
  80085c:	fc010113          	addi	sp,sp,-64
  800860:	02c10313          	addi	t1,sp,44
  800864:	02d12623          	sw	a3,44(sp)
  800868:	00030693          	mv	a3,t1
  80086c:	00112e23          	sw	ra,28(sp)
  800870:	02e12823          	sw	a4,48(sp)
  800874:	02f12a23          	sw	a5,52(sp)
  800878:	03012c23          	sw	a6,56(sp)
  80087c:	03112e23          	sw	a7,60(sp)
  800880:	00612623          	sw	t1,12(sp)
  800884:	ac5ff0ef          	jal	ra,800348 <vprintfmt>
  800888:	01c12083          	lw	ra,28(sp)
  80088c:	04010113          	addi	sp,sp,64
  800890:	00008067          	ret

00800894 <rand>:
  800894:	00000597          	auipc	a1,0x0
  800898:	76c58593          	addi	a1,a1,1900 # 801000 <next>
  80089c:	0005a683          	lw	a3,0(a1)
  8008a0:	deece637          	lui	a2,0xdeece
  8008a4:	66d60613          	addi	a2,a2,1645 # deece66d <sbi_remote_fence_i+0xdeeced7d>
  8008a8:	02c687b3          	mul	a5,a3,a2
  8008ac:	0045a703          	lw	a4,4(a1)
  8008b0:	00b78813          	addi	a6,a5,11
  8008b4:	00f837b3          	sltu	a5,a6,a5
  8008b8:	00c85513          	srli	a0,a6,0xc
  8008bc:	0105a023          	sw	a6,0(a1)
  8008c0:	00500813          	li	a6,5
  8008c4:	03068833          	mul	a6,a3,a6
  8008c8:	02c70733          	mul	a4,a4,a2
  8008cc:	02c6b6b3          	mulhu	a3,a3,a2
  8008d0:	01070733          	add	a4,a4,a6
  8008d4:	00d70733          	add	a4,a4,a3
  8008d8:	00e787b3          	add	a5,a5,a4
  8008dc:	01079793          	slli	a5,a5,0x10
  8008e0:	0107d793          	srli	a5,a5,0x10
  8008e4:	01479713          	slli	a4,a5,0x14
  8008e8:	00a76533          	or	a0,a4,a0
  8008ec:	80000737          	lui	a4,0x80000
  8008f0:	fff74713          	not	a4,a4
  8008f4:	02e57533          	remu	a0,a0,a4
  8008f8:	00f5a223          	sw	a5,4(a1)
  8008fc:	00150513          	addi	a0,a0,1
  800900:	00008067          	ret

00800904 <srand>:
  800904:	00000797          	auipc	a5,0x0
  800908:	6fc78793          	addi	a5,a5,1788 # 801000 <next>
  80090c:	00a7a023          	sw	a0,0(a5)
  800910:	0007a223          	sw	zero,4(a5)
  800914:	00008067          	ret

00800918 <work>:
  800918:	fe010113          	addi	sp,sp,-32
  80091c:	01212823          	sw	s2,16(sp)
  800920:	01312623          	sw	s3,12(sp)
  800924:	00000917          	auipc	s2,0x0
  800928:	6e490913          	addi	s2,s2,1764 # 801008 <mata>
  80092c:	00001997          	auipc	s3,0x1
  800930:	86c98993          	addi	s3,s3,-1940 # 801198 <matb>
  800934:	00812c23          	sw	s0,24(sp)
  800938:	00912a23          	sw	s1,20(sp)
  80093c:	00112e23          	sw	ra,28(sp)
  800940:	00050493          	mv	s1,a0
  800944:	00001417          	auipc	s0,0x1
  800948:	9e440413          	addi	s0,s0,-1564 # 801328 <matc>
  80094c:	00090593          	mv	a1,s2
  800950:	00098793          	mv	a5,s3
  800954:	00100693          	li	a3,1
  800958:	02878613          	addi	a2,a5,40
  80095c:	00058713          	mv	a4,a1
  800960:	00d7a023          	sw	a3,0(a5)
  800964:	00d72023          	sw	a3,0(a4) # 80000000 <sbi_remote_fence_i+0x80000710>
  800968:	00478793          	addi	a5,a5,4
  80096c:	00470713          	addi	a4,a4,4
  800970:	fec798e3          	bne	a5,a2,800960 <work+0x48>
  800974:	02858593          	addi	a1,a1,40
  800978:	fef410e3          	bne	s0,a5,800958 <work+0x40>
  80097c:	fe8ff0ef          	jal	ra,800164 <yield>
  800980:	fecff0ef          	jal	ra,80016c <getpid>
  800984:	00048613          	mv	a2,s1
  800988:	00050593          	mv	a1,a0
  80098c:	00000517          	auipc	a0,0x0
  800990:	4f050513          	addi	a0,a0,1264 # 800e7c <error_string+0x17c>
  800994:	849ff0ef          	jal	ra,8001dc <cprintf>
  800998:	fff00293          	li	t0,-1
  80099c:	fff48493          	addi	s1,s1,-1
  8009a0:	00000f97          	auipc	t6,0x0
  8009a4:	7f8f8f93          	addi	t6,t6,2040 # 801198 <matb>
  8009a8:	00001e17          	auipc	t3,0x1
  8009ac:	9a8e0e13          	addi	t3,t3,-1624 # 801350 <matc+0x28>
  8009b0:	00001f17          	auipc	t5,0x1
  8009b4:	b08f0f13          	addi	t5,t5,-1272 # 8014b8 <matc+0x190>
  8009b8:	0a548263          	beq	s1,t0,800a5c <work+0x144>
  8009bc:	00001817          	auipc	a6,0x1
  8009c0:	96c80813          	addi	a6,a6,-1684 # 801328 <matc>
  8009c4:	00080e93          	mv	t4,a6
  8009c8:	00090313          	mv	t1,s2
  8009cc:	00040513          	mv	a0,s0
  8009d0:	000e8893          	mv	a7,t4
  8009d4:	e7050793          	addi	a5,a0,-400
  8009d8:	00030693          	mv	a3,t1
  8009dc:	00000613          	li	a2,0
  8009e0:	0006a703          	lw	a4,0(a3)
  8009e4:	0007a583          	lw	a1,0(a5)
  8009e8:	02878793          	addi	a5,a5,40
  8009ec:	00468693          	addi	a3,a3,4
  8009f0:	02b70733          	mul	a4,a4,a1
  8009f4:	00e60633          	add	a2,a2,a4
  8009f8:	fea794e3          	bne	a5,a0,8009e0 <work+0xc8>
  8009fc:	00c8a023          	sw	a2,0(a7)
  800a00:	00478513          	addi	a0,a5,4
  800a04:	00488893          	addi	a7,a7,4
  800a08:	fcae16e3          	bne	t3,a0,8009d4 <work+0xbc>
  800a0c:	02830313          	addi	t1,t1,40
  800a10:	028e8e93          	addi	t4,t4,40
  800a14:	fbf31ce3          	bne	t1,t6,8009cc <work+0xb4>
  800a18:	00090513          	mv	a0,s2
  800a1c:	00098593          	mv	a1,s3
  800a20:	02880613          	addi	a2,a6,40
  800a24:	00050713          	mv	a4,a0
  800a28:	00058793          	mv	a5,a1
  800a2c:	00082683          	lw	a3,0(a6)
  800a30:	00478793          	addi	a5,a5,4
  800a34:	00480813          	addi	a6,a6,4
  800a38:	00d72023          	sw	a3,0(a4)
  800a3c:	fed7ae23          	sw	a3,-4(a5)
  800a40:	00470713          	addi	a4,a4,4
  800a44:	fec814e3          	bne	a6,a2,800a2c <work+0x114>
  800a48:	02858593          	addi	a1,a1,40
  800a4c:	02850513          	addi	a0,a0,40
  800a50:	fd0f18e3          	bne	t5,a6,800a20 <work+0x108>
  800a54:	fff48493          	addi	s1,s1,-1
  800a58:	f65492e3          	bne	s1,t0,8009bc <work+0xa4>
  800a5c:	f10ff0ef          	jal	ra,80016c <getpid>
  800a60:	00050593          	mv	a1,a0
  800a64:	00000517          	auipc	a0,0x0
  800a68:	43850513          	addi	a0,a0,1080 # 800e9c <error_string+0x19c>
  800a6c:	f70ff0ef          	jal	ra,8001dc <cprintf>
  800a70:	00000513          	li	a0,0
  800a74:	ec4ff0ef          	jal	ra,800138 <exit>

00800a78 <main>:
  800a78:	f9010113          	addi	sp,sp,-112
  800a7c:	05400613          	li	a2,84
  800a80:	00000593          	li	a1,0
  800a84:	00c10513          	addi	a0,sp,12
  800a88:	06812423          	sw	s0,104(sp)
  800a8c:	06912223          	sw	s1,100(sp)
  800a90:	07212023          	sw	s2,96(sp)
  800a94:	06112623          	sw	ra,108(sp)
  800a98:	00c10493          	addi	s1,sp,12
  800a9c:	fe8ff0ef          	jal	ra,800284 <memset>
  800aa0:	00000413          	li	s0,0
  800aa4:	01500913          	li	s2,21
  800aa8:	eacff0ef          	jal	ra,800154 <fork>
  800aac:	00a4a023          	sw	a0,0(s1)
  800ab0:	0a050063          	beqz	a0,800b50 <main+0xd8>
  800ab4:	06054063          	bltz	a0,800b14 <main+0x9c>
  800ab8:	00140413          	addi	s0,s0,1
  800abc:	00448493          	addi	s1,s1,4
  800ac0:	ff2414e3          	bne	s0,s2,800aa8 <main+0x30>
  800ac4:	00000517          	auipc	a0,0x0
  800ac8:	37050513          	addi	a0,a0,880 # 800e34 <error_string+0x134>
  800acc:	f10ff0ef          	jal	ra,8001dc <cprintf>
  800ad0:	e88ff0ef          	jal	ra,800158 <wait>
  800ad4:	02051a63          	bnez	a0,800b08 <main+0x90>
  800ad8:	fff40413          	addi	s0,s0,-1
  800adc:	fe041ae3          	bnez	s0,800ad0 <main+0x58>
  800ae0:	00000517          	auipc	a0,0x0
  800ae4:	37050513          	addi	a0,a0,880 # 800e50 <error_string+0x150>
  800ae8:	ef4ff0ef          	jal	ra,8001dc <cprintf>
  800aec:	06c12083          	lw	ra,108(sp)
  800af0:	00000513          	li	a0,0
  800af4:	06812403          	lw	s0,104(sp)
  800af8:	06412483          	lw	s1,100(sp)
  800afc:	06012903          	lw	s2,96(sp)
  800b00:	07010113          	addi	sp,sp,112
  800b04:	00008067          	ret
  800b08:	00000517          	auipc	a0,0x0
  800b0c:	33850513          	addi	a0,a0,824 # 800e40 <error_string+0x140>
  800b10:	eccff0ef          	jal	ra,8001dc <cprintf>
  800b14:	00000413          	li	s0,0
  800b18:	05400493          	li	s1,84
  800b1c:	00c10793          	addi	a5,sp,12
  800b20:	008787b3          	add	a5,a5,s0
  800b24:	0007a503          	lw	a0,0(a5)
  800b28:	00a05463          	blez	a0,800b30 <main+0xb8>
  800b2c:	e3cff0ef          	jal	ra,800168 <kill>
  800b30:	00440413          	addi	s0,s0,4
  800b34:	fe9414e3          	bne	s0,s1,800b1c <main+0xa4>
  800b38:	00000617          	auipc	a2,0x0
  800b3c:	32860613          	addi	a2,a2,808 # 800e60 <error_string+0x160>
  800b40:	05200593          	li	a1,82
  800b44:	00000517          	auipc	a0,0x0
  800b48:	32850513          	addi	a0,a0,808 # 800e6c <error_string+0x16c>
  800b4c:	cd4ff0ef          	jal	ra,800020 <__panic>
  800b50:	02840533          	mul	a0,s0,s0
  800b54:	db1ff0ef          	jal	ra,800904 <srand>
  800b58:	d3dff0ef          	jal	ra,800894 <rand>
  800b5c:	01500793          	li	a5,21
  800b60:	02f57533          	remu	a0,a0,a5
  800b64:	02a50533          	mul	a0,a0,a0
  800b68:	00a50793          	addi	a5,a0,10
  800b6c:	06400513          	li	a0,100
  800b70:	02a78533          	mul	a0,a5,a0
  800b74:	da5ff0ef          	jal	ra,800918 <work>
