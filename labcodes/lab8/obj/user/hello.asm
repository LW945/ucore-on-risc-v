
obj/__user_hello.out:     file format elf32-littleriscv


Disassembly of section .text:

00800020 <__warn>:
  800020:	fc010113          	addi	sp,sp,-64
  800024:	00812c23          	sw	s0,24(sp)
  800028:	02f12a23          	sw	a5,52(sp)
  80002c:	00060413          	mv	s0,a2
  800030:	02c10793          	addi	a5,sp,44
  800034:	00058613          	mv	a2,a1
  800038:	00050593          	mv	a1,a0
  80003c:	00001517          	auipc	a0,0x1
  800040:	9f050513          	addi	a0,a0,-1552 # 800a2c <main+0x60>
  800044:	00112e23          	sw	ra,28(sp)
  800048:	02d12623          	sw	a3,44(sp)
  80004c:	02e12823          	sw	a4,48(sp)
  800050:	03012c23          	sw	a6,56(sp)
  800054:	03112e23          	sw	a7,60(sp)
  800058:	00f12623          	sw	a5,12(sp)
  80005c:	18c000ef          	jal	ra,8001e8 <cprintf>
  800060:	00c12583          	lw	a1,12(sp)
  800064:	00040513          	mv	a0,s0
  800068:	144000ef          	jal	ra,8001ac <vcprintf>
  80006c:	00001517          	auipc	a0,0x1
  800070:	e0050513          	addi	a0,a0,-512 # 800e6c <error_string+0x25c>
  800074:	174000ef          	jal	ra,8001e8 <cprintf>
  800078:	01c12083          	lw	ra,28(sp)
  80007c:	01812403          	lw	s0,24(sp)
  800080:	04010113          	addi	sp,sp,64
  800084:	00008067          	ret

00800088 <syscall>:
  800088:	fb010113          	addi	sp,sp,-80
  80008c:	04e12023          	sw	a4,64(sp)
  800090:	02e12423          	sw	a4,40(sp)
  800094:	04810713          	addi	a4,sp,72
  800098:	00a12623          	sw	a0,12(sp)
  80009c:	02b12a23          	sw	a1,52(sp)
  8000a0:	02c12c23          	sw	a2,56(sp)
  8000a4:	02d12e23          	sw	a3,60(sp)
  8000a8:	04f12223          	sw	a5,68(sp)
  8000ac:	05012423          	sw	a6,72(sp)
  8000b0:	05112623          	sw	a7,76(sp)
  8000b4:	00b12e23          	sw	a1,28(sp)
  8000b8:	02c12023          	sw	a2,32(sp)
  8000bc:	02d12223          	sw	a3,36(sp)
  8000c0:	00e12a23          	sw	a4,20(sp)
  8000c4:	02f12623          	sw	a5,44(sp)
  8000c8:	00c12503          	lw	a0,12(sp)
  8000cc:	01c12583          	lw	a1,28(sp)
  8000d0:	02012603          	lw	a2,32(sp)
  8000d4:	02412683          	lw	a3,36(sp)
  8000d8:	02812703          	lw	a4,40(sp)
  8000dc:	02c12783          	lw	a5,44(sp)
  8000e0:	00000073          	ecall
  8000e4:	00a12c23          	sw	a0,24(sp)
  8000e8:	01812503          	lw	a0,24(sp)
  8000ec:	05010113          	addi	sp,sp,80
  8000f0:	00008067          	ret

008000f4 <sys_exit>:
  8000f4:	00050593          	mv	a1,a0
  8000f8:	00100513          	li	a0,1
  8000fc:	f8dff06f          	j	800088 <syscall>

00800100 <sys_getpid>:
  800100:	01200513          	li	a0,18
  800104:	f85ff06f          	j	800088 <syscall>

00800108 <sys_putc>:
  800108:	00050593          	mv	a1,a0
  80010c:	01e00513          	li	a0,30
  800110:	f79ff06f          	j	800088 <syscall>

00800114 <sys_open>:
  800114:	00058613          	mv	a2,a1
  800118:	00050593          	mv	a1,a0
  80011c:	06400513          	li	a0,100
  800120:	f69ff06f          	j	800088 <syscall>

00800124 <sys_close>:
  800124:	00050593          	mv	a1,a0
  800128:	06500513          	li	a0,101
  80012c:	f5dff06f          	j	800088 <syscall>

00800130 <sys_dup>:
  800130:	00058613          	mv	a2,a1
  800134:	00050593          	mv	a1,a0
  800138:	08200513          	li	a0,130
  80013c:	f4dff06f          	j	800088 <syscall>

00800140 <exit>:
  800140:	ff010113          	addi	sp,sp,-16
  800144:	00112623          	sw	ra,12(sp)
  800148:	fadff0ef          	jal	ra,8000f4 <sys_exit>
  80014c:	00001517          	auipc	a0,0x1
  800150:	8fc50513          	addi	a0,a0,-1796 # 800a48 <main+0x7c>
  800154:	094000ef          	jal	ra,8001e8 <cprintf>
  800158:	0000006f          	j	800158 <exit+0x18>

0080015c <getpid>:
  80015c:	fa5ff06f          	j	800100 <sys_getpid>

00800160 <_start>:
  800160:	00012503          	lw	a0,0(sp)
  800164:	00410593          	addi	a1,sp,4
  800168:	14c000ef          	jal	ra,8002b4 <umain>
  80016c:	0000006f          	j	80016c <_start+0xc>

00800170 <open>:
  800170:	fa5ff06f          	j	800114 <sys_open>

00800174 <close>:
  800174:	fb1ff06f          	j	800124 <sys_close>

00800178 <dup2>:
  800178:	fb9ff06f          	j	800130 <sys_dup>

0080017c <cputch>:
  80017c:	ff010113          	addi	sp,sp,-16
  800180:	00112623          	sw	ra,12(sp)
  800184:	00812423          	sw	s0,8(sp)
  800188:	00058413          	mv	s0,a1
  80018c:	f7dff0ef          	jal	ra,800108 <sys_putc>
  800190:	00042783          	lw	a5,0(s0)
  800194:	00c12083          	lw	ra,12(sp)
  800198:	00178793          	addi	a5,a5,1
  80019c:	00f42023          	sw	a5,0(s0)
  8001a0:	00812403          	lw	s0,8(sp)
  8001a4:	01010113          	addi	sp,sp,16
  8001a8:	00008067          	ret

008001ac <vcprintf>:
  8001ac:	fe010113          	addi	sp,sp,-32
  8001b0:	00058713          	mv	a4,a1
  8001b4:	ffff75b7          	lui	a1,0xffff7
  8001b8:	00050693          	mv	a3,a0
  8001bc:	00c10613          	addi	a2,sp,12
  8001c0:	00000517          	auipc	a0,0x0
  8001c4:	fbc50513          	addi	a0,a0,-68 # 80017c <cputch>
  8001c8:	ad958593          	addi	a1,a1,-1319 # ffff6ad9 <sbi_remote_fence_i+0xffff71e9>
  8001cc:	00112e23          	sw	ra,28(sp)
  8001d0:	00012623          	sw	zero,12(sp)
  8001d4:	278000ef          	jal	ra,80044c <vprintfmt>
  8001d8:	01c12083          	lw	ra,28(sp)
  8001dc:	00c12503          	lw	a0,12(sp)
  8001e0:	02010113          	addi	sp,sp,32
  8001e4:	00008067          	ret

008001e8 <cprintf>:
  8001e8:	fc010113          	addi	sp,sp,-64
  8001ec:	02410313          	addi	t1,sp,36
  8001f0:	02b12223          	sw	a1,36(sp)
  8001f4:	ffff75b7          	lui	a1,0xffff7
  8001f8:	02c12423          	sw	a2,40(sp)
  8001fc:	02d12623          	sw	a3,44(sp)
  800200:	02e12823          	sw	a4,48(sp)
  800204:	00050693          	mv	a3,a0
  800208:	00c10613          	addi	a2,sp,12
  80020c:	00000517          	auipc	a0,0x0
  800210:	f7050513          	addi	a0,a0,-144 # 80017c <cputch>
  800214:	00030713          	mv	a4,t1
  800218:	ad958593          	addi	a1,a1,-1319 # ffff6ad9 <sbi_remote_fence_i+0xffff71e9>
  80021c:	00112e23          	sw	ra,28(sp)
  800220:	02f12a23          	sw	a5,52(sp)
  800224:	03012c23          	sw	a6,56(sp)
  800228:	03112e23          	sw	a7,60(sp)
  80022c:	00612423          	sw	t1,8(sp)
  800230:	00012623          	sw	zero,12(sp)
  800234:	218000ef          	jal	ra,80044c <vprintfmt>
  800238:	01c12083          	lw	ra,28(sp)
  80023c:	00c12503          	lw	a0,12(sp)
  800240:	04010113          	addi	sp,sp,64
  800244:	00008067          	ret

00800248 <initfd>:
  800248:	ff010113          	addi	sp,sp,-16
  80024c:	00058793          	mv	a5,a1
  800250:	00912223          	sw	s1,4(sp)
  800254:	00060593          	mv	a1,a2
  800258:	00050493          	mv	s1,a0
  80025c:	00078513          	mv	a0,a5
  800260:	00812423          	sw	s0,8(sp)
  800264:	00112623          	sw	ra,12(sp)
  800268:	f09ff0ef          	jal	ra,800170 <open>
  80026c:	00050413          	mv	s0,a0
  800270:	02054663          	bltz	a0,80029c <initfd+0x54>
  800274:	02950463          	beq	a0,s1,80029c <initfd+0x54>
  800278:	00048513          	mv	a0,s1
  80027c:	ef9ff0ef          	jal	ra,800174 <close>
  800280:	00048593          	mv	a1,s1
  800284:	00040513          	mv	a0,s0
  800288:	ef1ff0ef          	jal	ra,800178 <dup2>
  80028c:	00050493          	mv	s1,a0
  800290:	00040513          	mv	a0,s0
  800294:	ee1ff0ef          	jal	ra,800174 <close>
  800298:	00048413          	mv	s0,s1
  80029c:	00c12083          	lw	ra,12(sp)
  8002a0:	00040513          	mv	a0,s0
  8002a4:	00412483          	lw	s1,4(sp)
  8002a8:	00812403          	lw	s0,8(sp)
  8002ac:	01010113          	addi	sp,sp,16
  8002b0:	00008067          	ret

008002b4 <umain>:
  8002b4:	ff010113          	addi	sp,sp,-16
  8002b8:	00812423          	sw	s0,8(sp)
  8002bc:	00912223          	sw	s1,4(sp)
  8002c0:	00050413          	mv	s0,a0
  8002c4:	00058493          	mv	s1,a1
  8002c8:	00000613          	li	a2,0
  8002cc:	00000597          	auipc	a1,0x0
  8002d0:	79058593          	addi	a1,a1,1936 # 800a5c <main+0x90>
  8002d4:	00000513          	li	a0,0
  8002d8:	00112623          	sw	ra,12(sp)
  8002dc:	f6dff0ef          	jal	ra,800248 <initfd>
  8002e0:	02054663          	bltz	a0,80030c <umain+0x58>
  8002e4:	00100613          	li	a2,1
  8002e8:	00000597          	auipc	a1,0x0
  8002ec:	7ac58593          	addi	a1,a1,1964 # 800a94 <main+0xc8>
  8002f0:	00060513          	mv	a0,a2
  8002f4:	f55ff0ef          	jal	ra,800248 <initfd>
  8002f8:	02054a63          	bltz	a0,80032c <umain+0x78>
  8002fc:	00048593          	mv	a1,s1
  800300:	00040513          	mv	a0,s0
  800304:	6c8000ef          	jal	ra,8009cc <main>
  800308:	e39ff0ef          	jal	ra,800140 <exit>
  80030c:	00050693          	mv	a3,a0
  800310:	00000617          	auipc	a2,0x0
  800314:	75460613          	addi	a2,a2,1876 # 800a64 <main+0x98>
  800318:	01a00593          	li	a1,26
  80031c:	00000517          	auipc	a0,0x0
  800320:	76450513          	addi	a0,a0,1892 # 800a80 <main+0xb4>
  800324:	cfdff0ef          	jal	ra,800020 <__warn>
  800328:	fbdff06f          	j	8002e4 <umain+0x30>
  80032c:	00050693          	mv	a3,a0
  800330:	00000617          	auipc	a2,0x0
  800334:	76c60613          	addi	a2,a2,1900 # 800a9c <main+0xd0>
  800338:	01d00593          	li	a1,29
  80033c:	00000517          	auipc	a0,0x0
  800340:	74450513          	addi	a0,a0,1860 # 800a80 <main+0xb4>
  800344:	cddff0ef          	jal	ra,800020 <__warn>
  800348:	fb5ff06f          	j	8002fc <umain+0x48>

0080034c <strnlen>:
  80034c:	00050693          	mv	a3,a0
  800350:	02058a63          	beqz	a1,800384 <strnlen+0x38>
  800354:	00054703          	lbu	a4,0(a0)
  800358:	00150793          	addi	a5,a0,1
  80035c:	02070463          	beqz	a4,800384 <strnlen+0x38>
  800360:	00b505b3          	add	a1,a0,a1
  800364:	0100006f          	j	800374 <strnlen+0x28>
  800368:	00178793          	addi	a5,a5,1
  80036c:	fff7c703          	lbu	a4,-1(a5)
  800370:	00070863          	beqz	a4,800380 <strnlen+0x34>
  800374:	40d78533          	sub	a0,a5,a3
  800378:	feb798e3          	bne	a5,a1,800368 <strnlen+0x1c>
  80037c:	00008067          	ret
  800380:	00008067          	ret
  800384:	00000513          	li	a0,0
  800388:	00008067          	ret

0080038c <printnum>:
  80038c:	fd010113          	addi	sp,sp,-48
  800390:	02912223          	sw	s1,36(sp)
  800394:	03212023          	sw	s2,32(sp)
  800398:	01312e23          	sw	s3,28(sp)
  80039c:	01412c23          	sw	s4,24(sp)
  8003a0:	01512a23          	sw	s5,20(sp)
  8003a4:	02112623          	sw	ra,44(sp)
  8003a8:	02812423          	sw	s0,40(sp)
  8003ac:	00050493          	mv	s1,a0
  8003b0:	00058993          	mv	s3,a1
  8003b4:	00060913          	mv	s2,a2
  8003b8:	03012a03          	lw	s4,48(sp)
  8003bc:	03077ab3          	remu	s5,a4,a6
  8003c0:	06079463          	bnez	a5,800428 <printnum+0x9c>
  8003c4:	07077263          	bleu	a6,a4,800428 <printnum+0x9c>
  8003c8:	fff88413          	addi	s0,a7,-1
  8003cc:	00805e63          	blez	s0,8003e8 <printnum+0x5c>
  8003d0:	fff40413          	addi	s0,s0,-1
  8003d4:	00098613          	mv	a2,s3
  8003d8:	00090593          	mv	a1,s2
  8003dc:	000a0513          	mv	a0,s4
  8003e0:	000480e7          	jalr	s1
  8003e4:	fe0416e3          	bnez	s0,8003d0 <printnum+0x44>
  8003e8:	00001797          	auipc	a5,0x1
  8003ec:	88c78793          	addi	a5,a5,-1908 # 800c74 <error_string+0x64>
  8003f0:	015787b3          	add	a5,a5,s5
  8003f4:	00098613          	mv	a2,s3
  8003f8:	00090593          	mv	a1,s2
  8003fc:	00048313          	mv	t1,s1
  800400:	02c12083          	lw	ra,44(sp)
  800404:	02812403          	lw	s0,40(sp)
  800408:	02412483          	lw	s1,36(sp)
  80040c:	02012903          	lw	s2,32(sp)
  800410:	01c12983          	lw	s3,28(sp)
  800414:	01812a03          	lw	s4,24(sp)
  800418:	01412a83          	lw	s5,20(sp)
  80041c:	0007c503          	lbu	a0,0(a5)
  800420:	03010113          	addi	sp,sp,48
  800424:	00030067          	jr	t1
  800428:	03075733          	divu	a4,a4,a6
  80042c:	01412023          	sw	s4,0(sp)
  800430:	fff88893          	addi	a7,a7,-1
  800434:	00000793          	li	a5,0
  800438:	00090613          	mv	a2,s2
  80043c:	00098593          	mv	a1,s3
  800440:	00048513          	mv	a0,s1
  800444:	f49ff0ef          	jal	ra,80038c <printnum>
  800448:	fa1ff06f          	j	8003e8 <printnum+0x5c>

0080044c <vprintfmt>:
  80044c:	fa010113          	addi	sp,sp,-96
  800450:	05212823          	sw	s2,80(sp)
  800454:	05312623          	sw	s3,76(sp)
  800458:	05412423          	sw	s4,72(sp)
  80045c:	05512223          	sw	s5,68(sp)
  800460:	05612023          	sw	s6,64(sp)
  800464:	03712e23          	sw	s7,60(sp)
  800468:	03812c23          	sw	s8,56(sp)
  80046c:	03a12823          	sw	s10,48(sp)
  800470:	04112e23          	sw	ra,92(sp)
  800474:	04812c23          	sw	s0,88(sp)
  800478:	04912a23          	sw	s1,84(sp)
  80047c:	03912a23          	sw	s9,52(sp)
  800480:	03b12623          	sw	s11,44(sp)
  800484:	00050a13          	mv	s4,a0
  800488:	00058993          	mv	s3,a1
  80048c:	00060913          	mv	s2,a2
  800490:	00068d13          	mv	s10,a3
  800494:	00070b13          	mv	s6,a4
  800498:	00000a97          	auipc	s5,0x0
  80049c:	620a8a93          	addi	s5,s5,1568 # 800ab8 <main+0xec>
  8004a0:	fff00b93          	li	s7,-1
  8004a4:	05e00c13          	li	s8,94
  8004a8:	000d4503          	lbu	a0,0(s10)
  8004ac:	02500493          	li	s1,37
  8004b0:	001d0413          	addi	s0,s10,1
  8004b4:	02950063          	beq	a0,s1,8004d4 <vprintfmt+0x88>
  8004b8:	06050663          	beqz	a0,800524 <vprintfmt+0xd8>
  8004bc:	00098613          	mv	a2,s3
  8004c0:	00090593          	mv	a1,s2
  8004c4:	00140413          	addi	s0,s0,1
  8004c8:	000a00e7          	jalr	s4
  8004cc:	fff44503          	lbu	a0,-1(s0)
  8004d0:	fe9514e3          	bne	a0,s1,8004b8 <vprintfmt+0x6c>
  8004d4:	00044e03          	lbu	t3,0(s0)
  8004d8:	fff00d93          	li	s11,-1
  8004dc:	02000693          	li	a3,32
  8004e0:	00000493          	li	s1,0
  8004e4:	00000593          	li	a1,0
  8004e8:	000d8c93          	mv	s9,s11
  8004ec:	05500713          	li	a4,85
  8004f0:	00100313          	li	t1,1
  8004f4:	03000813          	li	a6,48
  8004f8:	00900613          	li	a2,9
  8004fc:	02d00513          	li	a0,45
  800500:	fdde0793          	addi	a5,t3,-35
  800504:	0ff7f793          	andi	a5,a5,255
  800508:	00140d13          	addi	s10,s0,1
  80050c:	34f76a63          	bltu	a4,a5,800860 <vprintfmt+0x414>
  800510:	00279793          	slli	a5,a5,0x2
  800514:	015787b3          	add	a5,a5,s5
  800518:	0007a783          	lw	a5,0(a5)
  80051c:	015787b3          	add	a5,a5,s5
  800520:	00078067          	jr	a5
  800524:	05c12083          	lw	ra,92(sp)
  800528:	05812403          	lw	s0,88(sp)
  80052c:	05412483          	lw	s1,84(sp)
  800530:	05012903          	lw	s2,80(sp)
  800534:	04c12983          	lw	s3,76(sp)
  800538:	04812a03          	lw	s4,72(sp)
  80053c:	04412a83          	lw	s5,68(sp)
  800540:	04012b03          	lw	s6,64(sp)
  800544:	03c12b83          	lw	s7,60(sp)
  800548:	03812c03          	lw	s8,56(sp)
  80054c:	03412c83          	lw	s9,52(sp)
  800550:	03012d03          	lw	s10,48(sp)
  800554:	02c12d83          	lw	s11,44(sp)
  800558:	06010113          	addi	sp,sp,96
  80055c:	00008067          	ret
  800560:	00100793          	li	a5,1
  800564:	36b7c863          	blt	a5,a1,8008d4 <vprintfmt+0x488>
  800568:	000b2703          	lw	a4,0(s6)
  80056c:	00000793          	li	a5,0
  800570:	004b0b13          	addi	s6,s6,4
  800574:	01000813          	li	a6,16
  800578:	00d12023          	sw	a3,0(sp)
  80057c:	000c8893          	mv	a7,s9
  800580:	00090613          	mv	a2,s2
  800584:	00098593          	mv	a1,s3
  800588:	000a0513          	mv	a0,s4
  80058c:	e01ff0ef          	jal	ra,80038c <printnum>
  800590:	f19ff06f          	j	8004a8 <vprintfmt+0x5c>
  800594:	00144e03          	lbu	t3,1(s0)
  800598:	00030493          	mv	s1,t1
  80059c:	000d0413          	mv	s0,s10
  8005a0:	f61ff06f          	j	800500 <vprintfmt+0xb4>
  8005a4:	000b2503          	lw	a0,0(s6)
  8005a8:	00098613          	mv	a2,s3
  8005ac:	00090593          	mv	a1,s2
  8005b0:	004b0b13          	addi	s6,s6,4
  8005b4:	000a00e7          	jalr	s4
  8005b8:	ef1ff06f          	j	8004a8 <vprintfmt+0x5c>
  8005bc:	00100793          	li	a5,1
  8005c0:	32b7c863          	blt	a5,a1,8008f0 <vprintfmt+0x4a4>
  8005c4:	000b2703          	lw	a4,0(s6)
  8005c8:	004b0b13          	addi	s6,s6,4
  8005cc:	41f75793          	srai	a5,a4,0x1f
  8005d0:	00a00813          	li	a6,10
  8005d4:	fa07d2e3          	bgez	a5,800578 <vprintfmt+0x12c>
  8005d8:	00098613          	mv	a2,s3
  8005dc:	00090593          	mv	a1,s2
  8005e0:	02d00513          	li	a0,45
  8005e4:	00f12e23          	sw	a5,28(sp)
  8005e8:	00e12c23          	sw	a4,24(sp)
  8005ec:	01012a23          	sw	a6,20(sp)
  8005f0:	00d12823          	sw	a3,16(sp)
  8005f4:	000a00e7          	jalr	s4
  8005f8:	01812703          	lw	a4,24(sp)
  8005fc:	01c12783          	lw	a5,28(sp)
  800600:	01012683          	lw	a3,16(sp)
  800604:	40e00733          	neg	a4,a4
  800608:	00e03633          	snez	a2,a4
  80060c:	40f007b3          	neg	a5,a5
  800610:	40c787b3          	sub	a5,a5,a2
  800614:	01412803          	lw	a6,20(sp)
  800618:	f61ff06f          	j	800578 <vprintfmt+0x12c>
  80061c:	000b2783          	lw	a5,0(s6)
  800620:	01800693          	li	a3,24
  800624:	004b0b13          	addi	s6,s6,4
  800628:	41f7d713          	srai	a4,a5,0x1f
  80062c:	00f747b3          	xor	a5,a4,a5
  800630:	40e787b3          	sub	a5,a5,a4
  800634:	2cf6ca63          	blt	a3,a5,800908 <vprintfmt+0x4bc>
  800638:	00279693          	slli	a3,a5,0x2
  80063c:	00000717          	auipc	a4,0x0
  800640:	5d470713          	addi	a4,a4,1492 # 800c10 <error_string>
  800644:	00d70733          	add	a4,a4,a3
  800648:	00072703          	lw	a4,0(a4)
  80064c:	2a070e63          	beqz	a4,800908 <vprintfmt+0x4bc>
  800650:	00000697          	auipc	a3,0x0
  800654:	7f868693          	addi	a3,a3,2040 # 800e48 <error_string+0x238>
  800658:	00090613          	mv	a2,s2
  80065c:	00098593          	mv	a1,s3
  800660:	000a0513          	mv	a0,s4
  800664:	334000ef          	jal	ra,800998 <printfmt>
  800668:	e41ff06f          	j	8004a8 <vprintfmt+0x5c>
  80066c:	00144e03          	lbu	t3,1(s0)
  800670:	00158593          	addi	a1,a1,1
  800674:	000d0413          	mv	s0,s10
  800678:	e89ff06f          	j	800500 <vprintfmt+0xb4>
  80067c:	00100793          	li	a5,1
  800680:	20b7ce63          	blt	a5,a1,80089c <vprintfmt+0x450>
  800684:	000b2703          	lw	a4,0(s6)
  800688:	00000793          	li	a5,0
  80068c:	004b0b13          	addi	s6,s6,4
  800690:	00800813          	li	a6,8
  800694:	ee5ff06f          	j	800578 <vprintfmt+0x12c>
  800698:	03000513          	li	a0,48
  80069c:	00098613          	mv	a2,s3
  8006a0:	00090593          	mv	a1,s2
  8006a4:	00d12823          	sw	a3,16(sp)
  8006a8:	000a00e7          	jalr	s4
  8006ac:	00098613          	mv	a2,s3
  8006b0:	00090593          	mv	a1,s2
  8006b4:	07800513          	li	a0,120
  8006b8:	000a00e7          	jalr	s4
  8006bc:	000b2703          	lw	a4,0(s6)
  8006c0:	00000793          	li	a5,0
  8006c4:	01000813          	li	a6,16
  8006c8:	004b0b13          	addi	s6,s6,4
  8006cc:	01012683          	lw	a3,16(sp)
  8006d0:	ea9ff06f          	j	800578 <vprintfmt+0x12c>
  8006d4:	000b2403          	lw	s0,0(s6)
  8006d8:	004b0793          	addi	a5,s6,4
  8006dc:	00f12a23          	sw	a5,20(sp)
  8006e0:	26040463          	beqz	s0,800948 <vprintfmt+0x4fc>
  8006e4:	05905463          	blez	s9,80072c <vprintfmt+0x2e0>
  8006e8:	02d00793          	li	a5,45
  8006ec:	22f68e63          	beq	a3,a5,800928 <vprintfmt+0x4dc>
  8006f0:	000d8593          	mv	a1,s11
  8006f4:	00040513          	mv	a0,s0
  8006f8:	00d12823          	sw	a3,16(sp)
  8006fc:	c51ff0ef          	jal	ra,80034c <strnlen>
  800700:	40ac8cb3          	sub	s9,s9,a0
  800704:	03905463          	blez	s9,80072c <vprintfmt+0x2e0>
  800708:	01012683          	lw	a3,16(sp)
  80070c:	00068513          	mv	a0,a3
  800710:	00098613          	mv	a2,s3
  800714:	00090593          	mv	a1,s2
  800718:	00d12823          	sw	a3,16(sp)
  80071c:	fffc8c93          	addi	s9,s9,-1
  800720:	000a00e7          	jalr	s4
  800724:	01012683          	lw	a3,16(sp)
  800728:	fe0c92e3          	bnez	s9,80070c <vprintfmt+0x2c0>
  80072c:	00044783          	lbu	a5,0(s0)
  800730:	00140b13          	addi	s6,s0,1
  800734:	00078513          	mv	a0,a5
  800738:	06078063          	beqz	a5,800798 <vprintfmt+0x34c>
  80073c:	03f00413          	li	s0,63
  800740:	000dc663          	bltz	s11,80074c <vprintfmt+0x300>
  800744:	fffd8d93          	addi	s11,s11,-1
  800748:	037d8863          	beq	s11,s7,800778 <vprintfmt+0x32c>
  80074c:	00098613          	mv	a2,s3
  800750:	00090593          	mv	a1,s2
  800754:	00048663          	beqz	s1,800760 <vprintfmt+0x314>
  800758:	fe078793          	addi	a5,a5,-32
  80075c:	12fc6a63          	bltu	s8,a5,800890 <vprintfmt+0x444>
  800760:	000a00e7          	jalr	s4
  800764:	001b0b13          	addi	s6,s6,1
  800768:	fffb4783          	lbu	a5,-1(s6)
  80076c:	fffc8c93          	addi	s9,s9,-1
  800770:	00078513          	mv	a0,a5
  800774:	fc0796e3          	bnez	a5,800740 <vprintfmt+0x2f4>
  800778:	03905063          	blez	s9,800798 <vprintfmt+0x34c>
  80077c:	02000413          	li	s0,32
  800780:	fffc8c93          	addi	s9,s9,-1
  800784:	00098613          	mv	a2,s3
  800788:	00090593          	mv	a1,s2
  80078c:	00040513          	mv	a0,s0
  800790:	000a00e7          	jalr	s4
  800794:	fe0c96e3          	bnez	s9,800780 <vprintfmt+0x334>
  800798:	01412b03          	lw	s6,20(sp)
  80079c:	d0dff06f          	j	8004a8 <vprintfmt+0x5c>
  8007a0:	00100793          	li	a5,1
  8007a4:	10b7ca63          	blt	a5,a1,8008b8 <vprintfmt+0x46c>
  8007a8:	000b2703          	lw	a4,0(s6)
  8007ac:	00000793          	li	a5,0
  8007b0:	004b0b13          	addi	s6,s6,4
  8007b4:	00a00813          	li	a6,10
  8007b8:	dc1ff06f          	j	800578 <vprintfmt+0x12c>
  8007bc:	00144e03          	lbu	t3,1(s0)
  8007c0:	00050693          	mv	a3,a0
  8007c4:	000d0413          	mv	s0,s10
  8007c8:	d39ff06f          	j	800500 <vprintfmt+0xb4>
  8007cc:	00098613          	mv	a2,s3
  8007d0:	00090593          	mv	a1,s2
  8007d4:	02500513          	li	a0,37
  8007d8:	000a00e7          	jalr	s4
  8007dc:	ccdff06f          	j	8004a8 <vprintfmt+0x5c>
  8007e0:	000b2d83          	lw	s11,0(s6)
  8007e4:	00144e03          	lbu	t3,1(s0)
  8007e8:	004b0b13          	addi	s6,s6,4
  8007ec:	000d0413          	mv	s0,s10
  8007f0:	d00cd8e3          	bgez	s9,800500 <vprintfmt+0xb4>
  8007f4:	000d8c93          	mv	s9,s11
  8007f8:	fff00d93          	li	s11,-1
  8007fc:	d05ff06f          	j	800500 <vprintfmt+0xb4>
  800800:	00144e03          	lbu	t3,1(s0)
  800804:	00080693          	mv	a3,a6
  800808:	000d0413          	mv	s0,s10
  80080c:	cf5ff06f          	j	800500 <vprintfmt+0xb4>
  800810:	00144e83          	lbu	t4,1(s0)
  800814:	fd0e0d93          	addi	s11,t3,-48
  800818:	fd0e8793          	addi	a5,t4,-48
  80081c:	14f66c63          	bltu	a2,a5,800974 <vprintfmt+0x528>
  800820:	000d0413          	mv	s0,s10
  800824:	002d9793          	slli	a5,s11,0x2
  800828:	01b78db3          	add	s11,a5,s11
  80082c:	00140413          	addi	s0,s0,1
  800830:	001d9d93          	slli	s11,s11,0x1
  800834:	01dd8db3          	add	s11,s11,t4
  800838:	00044e83          	lbu	t4,0(s0)
  80083c:	fd0d8d93          	addi	s11,s11,-48
  800840:	fd0e8793          	addi	a5,t4,-48
  800844:	fef670e3          	bleu	a5,a2,800824 <vprintfmt+0x3d8>
  800848:	000e8e13          	mv	t3,t4
  80084c:	fa5ff06f          	j	8007f0 <vprintfmt+0x3a4>
  800850:	0e0cc863          	bltz	s9,800940 <vprintfmt+0x4f4>
  800854:	00144e03          	lbu	t3,1(s0)
  800858:	000d0413          	mv	s0,s10
  80085c:	ca5ff06f          	j	800500 <vprintfmt+0xb4>
  800860:	00098613          	mv	a2,s3
  800864:	00090593          	mv	a1,s2
  800868:	02500513          	li	a0,37
  80086c:	000a00e7          	jalr	s4
  800870:	fff44783          	lbu	a5,-1(s0)
  800874:	02500713          	li	a4,37
  800878:	00040d13          	mv	s10,s0
  80087c:	c2e786e3          	beq	a5,a4,8004a8 <vprintfmt+0x5c>
  800880:	fffd0d13          	addi	s10,s10,-1
  800884:	fffd4783          	lbu	a5,-1(s10)
  800888:	fee79ce3          	bne	a5,a4,800880 <vprintfmt+0x434>
  80088c:	c1dff06f          	j	8004a8 <vprintfmt+0x5c>
  800890:	00040513          	mv	a0,s0
  800894:	000a00e7          	jalr	s4
  800898:	ecdff06f          	j	800764 <vprintfmt+0x318>
  80089c:	007b0793          	addi	a5,s6,7
  8008a0:	ff87f793          	andi	a5,a5,-8
  8008a4:	00878b13          	addi	s6,a5,8
  8008a8:	0007a703          	lw	a4,0(a5)
  8008ac:	00800813          	li	a6,8
  8008b0:	0047a783          	lw	a5,4(a5)
  8008b4:	cc5ff06f          	j	800578 <vprintfmt+0x12c>
  8008b8:	007b0793          	addi	a5,s6,7
  8008bc:	ff87f793          	andi	a5,a5,-8
  8008c0:	00878b13          	addi	s6,a5,8
  8008c4:	0007a703          	lw	a4,0(a5)
  8008c8:	00a00813          	li	a6,10
  8008cc:	0047a783          	lw	a5,4(a5)
  8008d0:	ca9ff06f          	j	800578 <vprintfmt+0x12c>
  8008d4:	007b0793          	addi	a5,s6,7
  8008d8:	ff87f793          	andi	a5,a5,-8
  8008dc:	00878b13          	addi	s6,a5,8
  8008e0:	0007a703          	lw	a4,0(a5)
  8008e4:	01000813          	li	a6,16
  8008e8:	0047a783          	lw	a5,4(a5)
  8008ec:	c8dff06f          	j	800578 <vprintfmt+0x12c>
  8008f0:	007b0793          	addi	a5,s6,7
  8008f4:	ff87f793          	andi	a5,a5,-8
  8008f8:	00878b13          	addi	s6,a5,8
  8008fc:	0007a703          	lw	a4,0(a5)
  800900:	0047a783          	lw	a5,4(a5)
  800904:	ccdff06f          	j	8005d0 <vprintfmt+0x184>
  800908:	00078713          	mv	a4,a5
  80090c:	00000697          	auipc	a3,0x0
  800910:	53068693          	addi	a3,a3,1328 # 800e3c <error_string+0x22c>
  800914:	00090613          	mv	a2,s2
  800918:	00098593          	mv	a1,s3
  80091c:	000a0513          	mv	a0,s4
  800920:	078000ef          	jal	ra,800998 <printfmt>
  800924:	b85ff06f          	j	8004a8 <vprintfmt+0x5c>
  800928:	00044783          	lbu	a5,0(s0)
  80092c:	00140b13          	addi	s6,s0,1
  800930:	00078513          	mv	a0,a5
  800934:	e40784e3          	beqz	a5,80077c <vprintfmt+0x330>
  800938:	03f00413          	li	s0,63
  80093c:	e05ff06f          	j	800740 <vprintfmt+0x2f4>
  800940:	00000c93          	li	s9,0
  800944:	f11ff06f          	j	800854 <vprintfmt+0x408>
  800948:	03905c63          	blez	s9,800980 <vprintfmt+0x534>
  80094c:	02d00793          	li	a5,45
  800950:	00000417          	auipc	s0,0x0
  800954:	4e440413          	addi	s0,s0,1252 # 800e34 <error_string+0x224>
  800958:	d8f69ce3          	bne	a3,a5,8006f0 <vprintfmt+0x2a4>
  80095c:	02800513          	li	a0,40
  800960:	00000b17          	auipc	s6,0x0
  800964:	4d5b0b13          	addi	s6,s6,1237 # 800e35 <error_string+0x225>
  800968:	00050793          	mv	a5,a0
  80096c:	03f00413          	li	s0,63
  800970:	dd1ff06f          	j	800740 <vprintfmt+0x2f4>
  800974:	000e8e13          	mv	t3,t4
  800978:	000d0413          	mv	s0,s10
  80097c:	e75ff06f          	j	8007f0 <vprintfmt+0x3a4>
  800980:	02800793          	li	a5,40
  800984:	00078513          	mv	a0,a5
  800988:	00000b17          	auipc	s6,0x0
  80098c:	4adb0b13          	addi	s6,s6,1197 # 800e35 <error_string+0x225>
  800990:	03f00413          	li	s0,63
  800994:	dadff06f          	j	800740 <vprintfmt+0x2f4>

00800998 <printfmt>:
  800998:	fd010113          	addi	sp,sp,-48
  80099c:	02010313          	addi	t1,sp,32
  8009a0:	02e12023          	sw	a4,32(sp)
  8009a4:	00030713          	mv	a4,t1
  8009a8:	00112e23          	sw	ra,28(sp)
  8009ac:	02f12223          	sw	a5,36(sp)
  8009b0:	03012423          	sw	a6,40(sp)
  8009b4:	03112623          	sw	a7,44(sp)
  8009b8:	00612623          	sw	t1,12(sp)
  8009bc:	a91ff0ef          	jal	ra,80044c <vprintfmt>
  8009c0:	01c12083          	lw	ra,28(sp)
  8009c4:	03010113          	addi	sp,sp,48
  8009c8:	00008067          	ret

008009cc <main>:
  8009cc:	ff010113          	addi	sp,sp,-16
  8009d0:	00000517          	auipc	a0,0x0
  8009d4:	47c50513          	addi	a0,a0,1148 # 800e4c <error_string+0x23c>
  8009d8:	00112623          	sw	ra,12(sp)
  8009dc:	80dff0ef          	jal	ra,8001e8 <cprintf>
  8009e0:	f7cff0ef          	jal	ra,80015c <getpid>
  8009e4:	00050593          	mv	a1,a0
  8009e8:	00000517          	auipc	a0,0x0
  8009ec:	47450513          	addi	a0,a0,1140 # 800e5c <error_string+0x24c>
  8009f0:	ff8ff0ef          	jal	ra,8001e8 <cprintf>
  8009f4:	00000517          	auipc	a0,0x0
  8009f8:	47c50513          	addi	a0,a0,1148 # 800e70 <error_string+0x260>
  8009fc:	fecff0ef          	jal	ra,8001e8 <cprintf>
  800a00:	00c12083          	lw	ra,12(sp)
  800a04:	00000513          	li	a0,0
  800a08:	01010113          	addi	sp,sp,16
  800a0c:	00008067          	ret
