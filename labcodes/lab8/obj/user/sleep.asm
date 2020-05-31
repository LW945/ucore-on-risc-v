
obj/__user_sleep.out:     file format elf32-littleriscv


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
  800040:	afc50513          	addi	a0,a0,-1284 # 800b38 <main+0x88>
  800044:	00112e23          	sw	ra,28(sp)
  800048:	02d12623          	sw	a3,44(sp)
  80004c:	02e12823          	sw	a4,48(sp)
  800050:	03012c23          	sw	a6,56(sp)
  800054:	03112e23          	sw	a7,60(sp)
  800058:	00f12623          	sw	a5,12(sp)
  80005c:	21c000ef          	jal	ra,800278 <cprintf>
  800060:	00c12583          	lw	a1,12(sp)
  800064:	00040513          	mv	a0,s0
  800068:	1d4000ef          	jal	ra,80023c <vcprintf>
  80006c:	00001517          	auipc	a0,0x1
  800070:	b3850513          	addi	a0,a0,-1224 # 800ba4 <main+0xf4>
  800074:	204000ef          	jal	ra,800278 <cprintf>
  800078:	ff600513          	li	a0,-10
  80007c:	148000ef          	jal	ra,8001c4 <exit>

00800080 <__warn>:
  800080:	fc010113          	addi	sp,sp,-64
  800084:	00812c23          	sw	s0,24(sp)
  800088:	02f12a23          	sw	a5,52(sp)
  80008c:	00060413          	mv	s0,a2
  800090:	02c10793          	addi	a5,sp,44
  800094:	00058613          	mv	a2,a1
  800098:	00050593          	mv	a1,a0
  80009c:	00001517          	auipc	a0,0x1
  8000a0:	ab850513          	addi	a0,a0,-1352 # 800b54 <main+0xa4>
  8000a4:	00112e23          	sw	ra,28(sp)
  8000a8:	02d12623          	sw	a3,44(sp)
  8000ac:	02e12823          	sw	a4,48(sp)
  8000b0:	03012c23          	sw	a6,56(sp)
  8000b4:	03112e23          	sw	a7,60(sp)
  8000b8:	00f12623          	sw	a5,12(sp)
  8000bc:	1bc000ef          	jal	ra,800278 <cprintf>
  8000c0:	00c12583          	lw	a1,12(sp)
  8000c4:	00040513          	mv	a0,s0
  8000c8:	174000ef          	jal	ra,80023c <vcprintf>
  8000cc:	00001517          	auipc	a0,0x1
  8000d0:	ad850513          	addi	a0,a0,-1320 # 800ba4 <main+0xf4>
  8000d4:	1a4000ef          	jal	ra,800278 <cprintf>
  8000d8:	01c12083          	lw	ra,28(sp)
  8000dc:	01812403          	lw	s0,24(sp)
  8000e0:	04010113          	addi	sp,sp,64
  8000e4:	00008067          	ret

008000e8 <syscall>:
  8000e8:	fb010113          	addi	sp,sp,-80
  8000ec:	04e12023          	sw	a4,64(sp)
  8000f0:	02e12423          	sw	a4,40(sp)
  8000f4:	04810713          	addi	a4,sp,72
  8000f8:	00a12623          	sw	a0,12(sp)
  8000fc:	02b12a23          	sw	a1,52(sp)
  800100:	02c12c23          	sw	a2,56(sp)
  800104:	02d12e23          	sw	a3,60(sp)
  800108:	04f12223          	sw	a5,68(sp)
  80010c:	05012423          	sw	a6,72(sp)
  800110:	05112623          	sw	a7,76(sp)
  800114:	00b12e23          	sw	a1,28(sp)
  800118:	02c12023          	sw	a2,32(sp)
  80011c:	02d12223          	sw	a3,36(sp)
  800120:	00e12a23          	sw	a4,20(sp)
  800124:	02f12623          	sw	a5,44(sp)
  800128:	00c12503          	lw	a0,12(sp)
  80012c:	01c12583          	lw	a1,28(sp)
  800130:	02012603          	lw	a2,32(sp)
  800134:	02412683          	lw	a3,36(sp)
  800138:	02812703          	lw	a4,40(sp)
  80013c:	02c12783          	lw	a5,44(sp)
  800140:	00000073          	ecall
  800144:	00a12c23          	sw	a0,24(sp)
  800148:	01812503          	lw	a0,24(sp)
  80014c:	05010113          	addi	sp,sp,80
  800150:	00008067          	ret

00800154 <sys_exit>:
  800154:	00050593          	mv	a1,a0
  800158:	00100513          	li	a0,1
  80015c:	f8dff06f          	j	8000e8 <syscall>

00800160 <sys_fork>:
  800160:	00200513          	li	a0,2
  800164:	f85ff06f          	j	8000e8 <syscall>

00800168 <sys_wait>:
  800168:	00058613          	mv	a2,a1
  80016c:	00050593          	mv	a1,a0
  800170:	00300513          	li	a0,3
  800174:	f75ff06f          	j	8000e8 <syscall>

00800178 <sys_putc>:
  800178:	00050593          	mv	a1,a0
  80017c:	01e00513          	li	a0,30
  800180:	f69ff06f          	j	8000e8 <syscall>

00800184 <sys_sleep>:
  800184:	00050593          	mv	a1,a0
  800188:	00b00513          	li	a0,11
  80018c:	f5dff06f          	j	8000e8 <syscall>

00800190 <sys_gettime>:
  800190:	01100513          	li	a0,17
  800194:	f55ff06f          	j	8000e8 <syscall>

00800198 <sys_open>:
  800198:	00058613          	mv	a2,a1
  80019c:	00050593          	mv	a1,a0
  8001a0:	06400513          	li	a0,100
  8001a4:	f45ff06f          	j	8000e8 <syscall>

008001a8 <sys_close>:
  8001a8:	00050593          	mv	a1,a0
  8001ac:	06500513          	li	a0,101
  8001b0:	f39ff06f          	j	8000e8 <syscall>

008001b4 <sys_dup>:
  8001b4:	00058613          	mv	a2,a1
  8001b8:	00050593          	mv	a1,a0
  8001bc:	08200513          	li	a0,130
  8001c0:	f29ff06f          	j	8000e8 <syscall>

008001c4 <exit>:
  8001c4:	ff010113          	addi	sp,sp,-16
  8001c8:	00112623          	sw	ra,12(sp)
  8001cc:	f89ff0ef          	jal	ra,800154 <sys_exit>
  8001d0:	00001517          	auipc	a0,0x1
  8001d4:	9a050513          	addi	a0,a0,-1632 # 800b70 <main+0xc0>
  8001d8:	0a0000ef          	jal	ra,800278 <cprintf>
  8001dc:	0000006f          	j	8001dc <exit+0x18>

008001e0 <fork>:
  8001e0:	f81ff06f          	j	800160 <sys_fork>

008001e4 <waitpid>:
  8001e4:	f85ff06f          	j	800168 <sys_wait>

008001e8 <sleep>:
  8001e8:	f9dff06f          	j	800184 <sys_sleep>

008001ec <gettime_msec>:
  8001ec:	fa5ff06f          	j	800190 <sys_gettime>

008001f0 <_start>:
  8001f0:	00012503          	lw	a0,0(sp)
  8001f4:	00410593          	addi	a1,sp,4
  8001f8:	14c000ef          	jal	ra,800344 <umain>
  8001fc:	0000006f          	j	8001fc <_start+0xc>

00800200 <open>:
  800200:	f99ff06f          	j	800198 <sys_open>

00800204 <close>:
  800204:	fa5ff06f          	j	8001a8 <sys_close>

00800208 <dup2>:
  800208:	fadff06f          	j	8001b4 <sys_dup>

0080020c <cputch>:
  80020c:	ff010113          	addi	sp,sp,-16
  800210:	00112623          	sw	ra,12(sp)
  800214:	00812423          	sw	s0,8(sp)
  800218:	00058413          	mv	s0,a1
  80021c:	f5dff0ef          	jal	ra,800178 <sys_putc>
  800220:	00042783          	lw	a5,0(s0)
  800224:	00c12083          	lw	ra,12(sp)
  800228:	00178793          	addi	a5,a5,1
  80022c:	00f42023          	sw	a5,0(s0)
  800230:	00812403          	lw	s0,8(sp)
  800234:	01010113          	addi	sp,sp,16
  800238:	00008067          	ret

0080023c <vcprintf>:
  80023c:	fe010113          	addi	sp,sp,-32
  800240:	00058713          	mv	a4,a1
  800244:	ffff75b7          	lui	a1,0xffff7
  800248:	00050693          	mv	a3,a0
  80024c:	00c10613          	addi	a2,sp,12
  800250:	00000517          	auipc	a0,0x0
  800254:	fbc50513          	addi	a0,a0,-68 # 80020c <cputch>
  800258:	ad958593          	addi	a1,a1,-1319 # ffff6ad9 <sbi_remote_fence_i+0xffff71e9>
  80025c:	00112e23          	sw	ra,28(sp)
  800260:	00012623          	sw	zero,12(sp)
  800264:	278000ef          	jal	ra,8004dc <vprintfmt>
  800268:	01c12083          	lw	ra,28(sp)
  80026c:	00c12503          	lw	a0,12(sp)
  800270:	02010113          	addi	sp,sp,32
  800274:	00008067          	ret

00800278 <cprintf>:
  800278:	fc010113          	addi	sp,sp,-64
  80027c:	02410313          	addi	t1,sp,36
  800280:	02b12223          	sw	a1,36(sp)
  800284:	ffff75b7          	lui	a1,0xffff7
  800288:	02c12423          	sw	a2,40(sp)
  80028c:	02d12623          	sw	a3,44(sp)
  800290:	02e12823          	sw	a4,48(sp)
  800294:	00050693          	mv	a3,a0
  800298:	00c10613          	addi	a2,sp,12
  80029c:	00000517          	auipc	a0,0x0
  8002a0:	f7050513          	addi	a0,a0,-144 # 80020c <cputch>
  8002a4:	00030713          	mv	a4,t1
  8002a8:	ad958593          	addi	a1,a1,-1319 # ffff6ad9 <sbi_remote_fence_i+0xffff71e9>
  8002ac:	00112e23          	sw	ra,28(sp)
  8002b0:	02f12a23          	sw	a5,52(sp)
  8002b4:	03012c23          	sw	a6,56(sp)
  8002b8:	03112e23          	sw	a7,60(sp)
  8002bc:	00612423          	sw	t1,8(sp)
  8002c0:	00012623          	sw	zero,12(sp)
  8002c4:	218000ef          	jal	ra,8004dc <vprintfmt>
  8002c8:	01c12083          	lw	ra,28(sp)
  8002cc:	00c12503          	lw	a0,12(sp)
  8002d0:	04010113          	addi	sp,sp,64
  8002d4:	00008067          	ret

008002d8 <initfd>:
  8002d8:	ff010113          	addi	sp,sp,-16
  8002dc:	00058793          	mv	a5,a1
  8002e0:	00912223          	sw	s1,4(sp)
  8002e4:	00060593          	mv	a1,a2
  8002e8:	00050493          	mv	s1,a0
  8002ec:	00078513          	mv	a0,a5
  8002f0:	00812423          	sw	s0,8(sp)
  8002f4:	00112623          	sw	ra,12(sp)
  8002f8:	f09ff0ef          	jal	ra,800200 <open>
  8002fc:	00050413          	mv	s0,a0
  800300:	02054663          	bltz	a0,80032c <initfd+0x54>
  800304:	02950463          	beq	a0,s1,80032c <initfd+0x54>
  800308:	00048513          	mv	a0,s1
  80030c:	ef9ff0ef          	jal	ra,800204 <close>
  800310:	00048593          	mv	a1,s1
  800314:	00040513          	mv	a0,s0
  800318:	ef1ff0ef          	jal	ra,800208 <dup2>
  80031c:	00050493          	mv	s1,a0
  800320:	00040513          	mv	a0,s0
  800324:	ee1ff0ef          	jal	ra,800204 <close>
  800328:	00048413          	mv	s0,s1
  80032c:	00c12083          	lw	ra,12(sp)
  800330:	00040513          	mv	a0,s0
  800334:	00412483          	lw	s1,4(sp)
  800338:	00812403          	lw	s0,8(sp)
  80033c:	01010113          	addi	sp,sp,16
  800340:	00008067          	ret

00800344 <umain>:
  800344:	ff010113          	addi	sp,sp,-16
  800348:	00812423          	sw	s0,8(sp)
  80034c:	00912223          	sw	s1,4(sp)
  800350:	00050413          	mv	s0,a0
  800354:	00058493          	mv	s1,a1
  800358:	00000613          	li	a2,0
  80035c:	00001597          	auipc	a1,0x1
  800360:	82858593          	addi	a1,a1,-2008 # 800b84 <main+0xd4>
  800364:	00000513          	li	a0,0
  800368:	00112623          	sw	ra,12(sp)
  80036c:	f6dff0ef          	jal	ra,8002d8 <initfd>
  800370:	02054663          	bltz	a0,80039c <umain+0x58>
  800374:	00100613          	li	a2,1
  800378:	00001597          	auipc	a1,0x1
  80037c:	84458593          	addi	a1,a1,-1980 # 800bbc <main+0x10c>
  800380:	00060513          	mv	a0,a2
  800384:	f55ff0ef          	jal	ra,8002d8 <initfd>
  800388:	02054a63          	bltz	a0,8003bc <umain+0x78>
  80038c:	00048593          	mv	a1,s1
  800390:	00040513          	mv	a0,s0
  800394:	71c000ef          	jal	ra,800ab0 <main>
  800398:	e2dff0ef          	jal	ra,8001c4 <exit>
  80039c:	00050693          	mv	a3,a0
  8003a0:	00000617          	auipc	a2,0x0
  8003a4:	7ec60613          	addi	a2,a2,2028 # 800b8c <main+0xdc>
  8003a8:	01a00593          	li	a1,26
  8003ac:	00000517          	auipc	a0,0x0
  8003b0:	7fc50513          	addi	a0,a0,2044 # 800ba8 <main+0xf8>
  8003b4:	ccdff0ef          	jal	ra,800080 <__warn>
  8003b8:	fbdff06f          	j	800374 <umain+0x30>
  8003bc:	00050693          	mv	a3,a0
  8003c0:	00001617          	auipc	a2,0x1
  8003c4:	80460613          	addi	a2,a2,-2044 # 800bc4 <main+0x114>
  8003c8:	01d00593          	li	a1,29
  8003cc:	00000517          	auipc	a0,0x0
  8003d0:	7dc50513          	addi	a0,a0,2012 # 800ba8 <main+0xf8>
  8003d4:	cadff0ef          	jal	ra,800080 <__warn>
  8003d8:	fb5ff06f          	j	80038c <umain+0x48>

008003dc <strnlen>:
  8003dc:	00050693          	mv	a3,a0
  8003e0:	02058a63          	beqz	a1,800414 <strnlen+0x38>
  8003e4:	00054703          	lbu	a4,0(a0)
  8003e8:	00150793          	addi	a5,a0,1
  8003ec:	02070463          	beqz	a4,800414 <strnlen+0x38>
  8003f0:	00b505b3          	add	a1,a0,a1
  8003f4:	0100006f          	j	800404 <strnlen+0x28>
  8003f8:	00178793          	addi	a5,a5,1
  8003fc:	fff7c703          	lbu	a4,-1(a5)
  800400:	00070863          	beqz	a4,800410 <strnlen+0x34>
  800404:	40d78533          	sub	a0,a5,a3
  800408:	feb798e3          	bne	a5,a1,8003f8 <strnlen+0x1c>
  80040c:	00008067          	ret
  800410:	00008067          	ret
  800414:	00000513          	li	a0,0
  800418:	00008067          	ret

0080041c <printnum>:
  80041c:	fd010113          	addi	sp,sp,-48
  800420:	02912223          	sw	s1,36(sp)
  800424:	03212023          	sw	s2,32(sp)
  800428:	01312e23          	sw	s3,28(sp)
  80042c:	01412c23          	sw	s4,24(sp)
  800430:	01512a23          	sw	s5,20(sp)
  800434:	02112623          	sw	ra,44(sp)
  800438:	02812423          	sw	s0,40(sp)
  80043c:	00050493          	mv	s1,a0
  800440:	00058993          	mv	s3,a1
  800444:	00060913          	mv	s2,a2
  800448:	03012a03          	lw	s4,48(sp)
  80044c:	03077ab3          	remu	s5,a4,a6
  800450:	06079463          	bnez	a5,8004b8 <printnum+0x9c>
  800454:	07077263          	bleu	a6,a4,8004b8 <printnum+0x9c>
  800458:	fff88413          	addi	s0,a7,-1
  80045c:	00805e63          	blez	s0,800478 <printnum+0x5c>
  800460:	fff40413          	addi	s0,s0,-1
  800464:	00098613          	mv	a2,s3
  800468:	00090593          	mv	a1,s2
  80046c:	000a0513          	mv	a0,s4
  800470:	000480e7          	jalr	s1
  800474:	fe0416e3          	bnez	s0,800460 <printnum+0x44>
  800478:	00001797          	auipc	a5,0x1
  80047c:	92478793          	addi	a5,a5,-1756 # 800d9c <error_string+0x64>
  800480:	015787b3          	add	a5,a5,s5
  800484:	00098613          	mv	a2,s3
  800488:	00090593          	mv	a1,s2
  80048c:	00048313          	mv	t1,s1
  800490:	02c12083          	lw	ra,44(sp)
  800494:	02812403          	lw	s0,40(sp)
  800498:	02412483          	lw	s1,36(sp)
  80049c:	02012903          	lw	s2,32(sp)
  8004a0:	01c12983          	lw	s3,28(sp)
  8004a4:	01812a03          	lw	s4,24(sp)
  8004a8:	01412a83          	lw	s5,20(sp)
  8004ac:	0007c503          	lbu	a0,0(a5)
  8004b0:	03010113          	addi	sp,sp,48
  8004b4:	00030067          	jr	t1
  8004b8:	03075733          	divu	a4,a4,a6
  8004bc:	01412023          	sw	s4,0(sp)
  8004c0:	fff88893          	addi	a7,a7,-1
  8004c4:	00000793          	li	a5,0
  8004c8:	00090613          	mv	a2,s2
  8004cc:	00098593          	mv	a1,s3
  8004d0:	00048513          	mv	a0,s1
  8004d4:	f49ff0ef          	jal	ra,80041c <printnum>
  8004d8:	fa1ff06f          	j	800478 <printnum+0x5c>

008004dc <vprintfmt>:
  8004dc:	fa010113          	addi	sp,sp,-96
  8004e0:	05212823          	sw	s2,80(sp)
  8004e4:	05312623          	sw	s3,76(sp)
  8004e8:	05412423          	sw	s4,72(sp)
  8004ec:	05512223          	sw	s5,68(sp)
  8004f0:	05612023          	sw	s6,64(sp)
  8004f4:	03712e23          	sw	s7,60(sp)
  8004f8:	03812c23          	sw	s8,56(sp)
  8004fc:	03a12823          	sw	s10,48(sp)
  800500:	04112e23          	sw	ra,92(sp)
  800504:	04812c23          	sw	s0,88(sp)
  800508:	04912a23          	sw	s1,84(sp)
  80050c:	03912a23          	sw	s9,52(sp)
  800510:	03b12623          	sw	s11,44(sp)
  800514:	00050a13          	mv	s4,a0
  800518:	00058993          	mv	s3,a1
  80051c:	00060913          	mv	s2,a2
  800520:	00068d13          	mv	s10,a3
  800524:	00070b13          	mv	s6,a4
  800528:	00000a97          	auipc	s5,0x0
  80052c:	6b8a8a93          	addi	s5,s5,1720 # 800be0 <main+0x130>
  800530:	fff00b93          	li	s7,-1
  800534:	05e00c13          	li	s8,94
  800538:	000d4503          	lbu	a0,0(s10)
  80053c:	02500493          	li	s1,37
  800540:	001d0413          	addi	s0,s10,1
  800544:	02950063          	beq	a0,s1,800564 <vprintfmt+0x88>
  800548:	06050663          	beqz	a0,8005b4 <vprintfmt+0xd8>
  80054c:	00098613          	mv	a2,s3
  800550:	00090593          	mv	a1,s2
  800554:	00140413          	addi	s0,s0,1
  800558:	000a00e7          	jalr	s4
  80055c:	fff44503          	lbu	a0,-1(s0)
  800560:	fe9514e3          	bne	a0,s1,800548 <vprintfmt+0x6c>
  800564:	00044e03          	lbu	t3,0(s0)
  800568:	fff00d93          	li	s11,-1
  80056c:	02000693          	li	a3,32
  800570:	00000493          	li	s1,0
  800574:	00000593          	li	a1,0
  800578:	000d8c93          	mv	s9,s11
  80057c:	05500713          	li	a4,85
  800580:	00100313          	li	t1,1
  800584:	03000813          	li	a6,48
  800588:	00900613          	li	a2,9
  80058c:	02d00513          	li	a0,45
  800590:	fdde0793          	addi	a5,t3,-35
  800594:	0ff7f793          	andi	a5,a5,255
  800598:	00140d13          	addi	s10,s0,1
  80059c:	34f76a63          	bltu	a4,a5,8008f0 <vprintfmt+0x414>
  8005a0:	00279793          	slli	a5,a5,0x2
  8005a4:	015787b3          	add	a5,a5,s5
  8005a8:	0007a783          	lw	a5,0(a5)
  8005ac:	015787b3          	add	a5,a5,s5
  8005b0:	00078067          	jr	a5
  8005b4:	05c12083          	lw	ra,92(sp)
  8005b8:	05812403          	lw	s0,88(sp)
  8005bc:	05412483          	lw	s1,84(sp)
  8005c0:	05012903          	lw	s2,80(sp)
  8005c4:	04c12983          	lw	s3,76(sp)
  8005c8:	04812a03          	lw	s4,72(sp)
  8005cc:	04412a83          	lw	s5,68(sp)
  8005d0:	04012b03          	lw	s6,64(sp)
  8005d4:	03c12b83          	lw	s7,60(sp)
  8005d8:	03812c03          	lw	s8,56(sp)
  8005dc:	03412c83          	lw	s9,52(sp)
  8005e0:	03012d03          	lw	s10,48(sp)
  8005e4:	02c12d83          	lw	s11,44(sp)
  8005e8:	06010113          	addi	sp,sp,96
  8005ec:	00008067          	ret
  8005f0:	00100793          	li	a5,1
  8005f4:	36b7c863          	blt	a5,a1,800964 <vprintfmt+0x488>
  8005f8:	000b2703          	lw	a4,0(s6)
  8005fc:	00000793          	li	a5,0
  800600:	004b0b13          	addi	s6,s6,4
  800604:	01000813          	li	a6,16
  800608:	00d12023          	sw	a3,0(sp)
  80060c:	000c8893          	mv	a7,s9
  800610:	00090613          	mv	a2,s2
  800614:	00098593          	mv	a1,s3
  800618:	000a0513          	mv	a0,s4
  80061c:	e01ff0ef          	jal	ra,80041c <printnum>
  800620:	f19ff06f          	j	800538 <vprintfmt+0x5c>
  800624:	00144e03          	lbu	t3,1(s0)
  800628:	00030493          	mv	s1,t1
  80062c:	000d0413          	mv	s0,s10
  800630:	f61ff06f          	j	800590 <vprintfmt+0xb4>
  800634:	000b2503          	lw	a0,0(s6)
  800638:	00098613          	mv	a2,s3
  80063c:	00090593          	mv	a1,s2
  800640:	004b0b13          	addi	s6,s6,4
  800644:	000a00e7          	jalr	s4
  800648:	ef1ff06f          	j	800538 <vprintfmt+0x5c>
  80064c:	00100793          	li	a5,1
  800650:	32b7c863          	blt	a5,a1,800980 <vprintfmt+0x4a4>
  800654:	000b2703          	lw	a4,0(s6)
  800658:	004b0b13          	addi	s6,s6,4
  80065c:	41f75793          	srai	a5,a4,0x1f
  800660:	00a00813          	li	a6,10
  800664:	fa07d2e3          	bgez	a5,800608 <vprintfmt+0x12c>
  800668:	00098613          	mv	a2,s3
  80066c:	00090593          	mv	a1,s2
  800670:	02d00513          	li	a0,45
  800674:	00f12e23          	sw	a5,28(sp)
  800678:	00e12c23          	sw	a4,24(sp)
  80067c:	01012a23          	sw	a6,20(sp)
  800680:	00d12823          	sw	a3,16(sp)
  800684:	000a00e7          	jalr	s4
  800688:	01812703          	lw	a4,24(sp)
  80068c:	01c12783          	lw	a5,28(sp)
  800690:	01012683          	lw	a3,16(sp)
  800694:	40e00733          	neg	a4,a4
  800698:	00e03633          	snez	a2,a4
  80069c:	40f007b3          	neg	a5,a5
  8006a0:	40c787b3          	sub	a5,a5,a2
  8006a4:	01412803          	lw	a6,20(sp)
  8006a8:	f61ff06f          	j	800608 <vprintfmt+0x12c>
  8006ac:	000b2783          	lw	a5,0(s6)
  8006b0:	01800693          	li	a3,24
  8006b4:	004b0b13          	addi	s6,s6,4
  8006b8:	41f7d713          	srai	a4,a5,0x1f
  8006bc:	00f747b3          	xor	a5,a4,a5
  8006c0:	40e787b3          	sub	a5,a5,a4
  8006c4:	2cf6ca63          	blt	a3,a5,800998 <vprintfmt+0x4bc>
  8006c8:	00279693          	slli	a3,a5,0x2
  8006cc:	00000717          	auipc	a4,0x0
  8006d0:	66c70713          	addi	a4,a4,1644 # 800d38 <error_string>
  8006d4:	00d70733          	add	a4,a4,a3
  8006d8:	00072703          	lw	a4,0(a4)
  8006dc:	2a070e63          	beqz	a4,800998 <vprintfmt+0x4bc>
  8006e0:	00001697          	auipc	a3,0x1
  8006e4:	89068693          	addi	a3,a3,-1904 # 800f70 <error_string+0x238>
  8006e8:	00090613          	mv	a2,s2
  8006ec:	00098593          	mv	a1,s3
  8006f0:	000a0513          	mv	a0,s4
  8006f4:	334000ef          	jal	ra,800a28 <printfmt>
  8006f8:	e41ff06f          	j	800538 <vprintfmt+0x5c>
  8006fc:	00144e03          	lbu	t3,1(s0)
  800700:	00158593          	addi	a1,a1,1
  800704:	000d0413          	mv	s0,s10
  800708:	e89ff06f          	j	800590 <vprintfmt+0xb4>
  80070c:	00100793          	li	a5,1
  800710:	20b7ce63          	blt	a5,a1,80092c <vprintfmt+0x450>
  800714:	000b2703          	lw	a4,0(s6)
  800718:	00000793          	li	a5,0
  80071c:	004b0b13          	addi	s6,s6,4
  800720:	00800813          	li	a6,8
  800724:	ee5ff06f          	j	800608 <vprintfmt+0x12c>
  800728:	03000513          	li	a0,48
  80072c:	00098613          	mv	a2,s3
  800730:	00090593          	mv	a1,s2
  800734:	00d12823          	sw	a3,16(sp)
  800738:	000a00e7          	jalr	s4
  80073c:	00098613          	mv	a2,s3
  800740:	00090593          	mv	a1,s2
  800744:	07800513          	li	a0,120
  800748:	000a00e7          	jalr	s4
  80074c:	000b2703          	lw	a4,0(s6)
  800750:	00000793          	li	a5,0
  800754:	01000813          	li	a6,16
  800758:	004b0b13          	addi	s6,s6,4
  80075c:	01012683          	lw	a3,16(sp)
  800760:	ea9ff06f          	j	800608 <vprintfmt+0x12c>
  800764:	000b2403          	lw	s0,0(s6)
  800768:	004b0793          	addi	a5,s6,4
  80076c:	00f12a23          	sw	a5,20(sp)
  800770:	26040463          	beqz	s0,8009d8 <vprintfmt+0x4fc>
  800774:	05905463          	blez	s9,8007bc <vprintfmt+0x2e0>
  800778:	02d00793          	li	a5,45
  80077c:	22f68e63          	beq	a3,a5,8009b8 <vprintfmt+0x4dc>
  800780:	000d8593          	mv	a1,s11
  800784:	00040513          	mv	a0,s0
  800788:	00d12823          	sw	a3,16(sp)
  80078c:	c51ff0ef          	jal	ra,8003dc <strnlen>
  800790:	40ac8cb3          	sub	s9,s9,a0
  800794:	03905463          	blez	s9,8007bc <vprintfmt+0x2e0>
  800798:	01012683          	lw	a3,16(sp)
  80079c:	00068513          	mv	a0,a3
  8007a0:	00098613          	mv	a2,s3
  8007a4:	00090593          	mv	a1,s2
  8007a8:	00d12823          	sw	a3,16(sp)
  8007ac:	fffc8c93          	addi	s9,s9,-1
  8007b0:	000a00e7          	jalr	s4
  8007b4:	01012683          	lw	a3,16(sp)
  8007b8:	fe0c92e3          	bnez	s9,80079c <vprintfmt+0x2c0>
  8007bc:	00044783          	lbu	a5,0(s0)
  8007c0:	00140b13          	addi	s6,s0,1
  8007c4:	00078513          	mv	a0,a5
  8007c8:	06078063          	beqz	a5,800828 <vprintfmt+0x34c>
  8007cc:	03f00413          	li	s0,63
  8007d0:	000dc663          	bltz	s11,8007dc <vprintfmt+0x300>
  8007d4:	fffd8d93          	addi	s11,s11,-1
  8007d8:	037d8863          	beq	s11,s7,800808 <vprintfmt+0x32c>
  8007dc:	00098613          	mv	a2,s3
  8007e0:	00090593          	mv	a1,s2
  8007e4:	00048663          	beqz	s1,8007f0 <vprintfmt+0x314>
  8007e8:	fe078793          	addi	a5,a5,-32
  8007ec:	12fc6a63          	bltu	s8,a5,800920 <vprintfmt+0x444>
  8007f0:	000a00e7          	jalr	s4
  8007f4:	001b0b13          	addi	s6,s6,1
  8007f8:	fffb4783          	lbu	a5,-1(s6)
  8007fc:	fffc8c93          	addi	s9,s9,-1
  800800:	00078513          	mv	a0,a5
  800804:	fc0796e3          	bnez	a5,8007d0 <vprintfmt+0x2f4>
  800808:	03905063          	blez	s9,800828 <vprintfmt+0x34c>
  80080c:	02000413          	li	s0,32
  800810:	fffc8c93          	addi	s9,s9,-1
  800814:	00098613          	mv	a2,s3
  800818:	00090593          	mv	a1,s2
  80081c:	00040513          	mv	a0,s0
  800820:	000a00e7          	jalr	s4
  800824:	fe0c96e3          	bnez	s9,800810 <vprintfmt+0x334>
  800828:	01412b03          	lw	s6,20(sp)
  80082c:	d0dff06f          	j	800538 <vprintfmt+0x5c>
  800830:	00100793          	li	a5,1
  800834:	10b7ca63          	blt	a5,a1,800948 <vprintfmt+0x46c>
  800838:	000b2703          	lw	a4,0(s6)
  80083c:	00000793          	li	a5,0
  800840:	004b0b13          	addi	s6,s6,4
  800844:	00a00813          	li	a6,10
  800848:	dc1ff06f          	j	800608 <vprintfmt+0x12c>
  80084c:	00144e03          	lbu	t3,1(s0)
  800850:	00050693          	mv	a3,a0
  800854:	000d0413          	mv	s0,s10
  800858:	d39ff06f          	j	800590 <vprintfmt+0xb4>
  80085c:	00098613          	mv	a2,s3
  800860:	00090593          	mv	a1,s2
  800864:	02500513          	li	a0,37
  800868:	000a00e7          	jalr	s4
  80086c:	ccdff06f          	j	800538 <vprintfmt+0x5c>
  800870:	000b2d83          	lw	s11,0(s6)
  800874:	00144e03          	lbu	t3,1(s0)
  800878:	004b0b13          	addi	s6,s6,4
  80087c:	000d0413          	mv	s0,s10
  800880:	d00cd8e3          	bgez	s9,800590 <vprintfmt+0xb4>
  800884:	000d8c93          	mv	s9,s11
  800888:	fff00d93          	li	s11,-1
  80088c:	d05ff06f          	j	800590 <vprintfmt+0xb4>
  800890:	00144e03          	lbu	t3,1(s0)
  800894:	00080693          	mv	a3,a6
  800898:	000d0413          	mv	s0,s10
  80089c:	cf5ff06f          	j	800590 <vprintfmt+0xb4>
  8008a0:	00144e83          	lbu	t4,1(s0)
  8008a4:	fd0e0d93          	addi	s11,t3,-48
  8008a8:	fd0e8793          	addi	a5,t4,-48
  8008ac:	14f66c63          	bltu	a2,a5,800a04 <vprintfmt+0x528>
  8008b0:	000d0413          	mv	s0,s10
  8008b4:	002d9793          	slli	a5,s11,0x2
  8008b8:	01b78db3          	add	s11,a5,s11
  8008bc:	00140413          	addi	s0,s0,1
  8008c0:	001d9d93          	slli	s11,s11,0x1
  8008c4:	01dd8db3          	add	s11,s11,t4
  8008c8:	00044e83          	lbu	t4,0(s0)
  8008cc:	fd0d8d93          	addi	s11,s11,-48
  8008d0:	fd0e8793          	addi	a5,t4,-48
  8008d4:	fef670e3          	bleu	a5,a2,8008b4 <vprintfmt+0x3d8>
  8008d8:	000e8e13          	mv	t3,t4
  8008dc:	fa5ff06f          	j	800880 <vprintfmt+0x3a4>
  8008e0:	0e0cc863          	bltz	s9,8009d0 <vprintfmt+0x4f4>
  8008e4:	00144e03          	lbu	t3,1(s0)
  8008e8:	000d0413          	mv	s0,s10
  8008ec:	ca5ff06f          	j	800590 <vprintfmt+0xb4>
  8008f0:	00098613          	mv	a2,s3
  8008f4:	00090593          	mv	a1,s2
  8008f8:	02500513          	li	a0,37
  8008fc:	000a00e7          	jalr	s4
  800900:	fff44783          	lbu	a5,-1(s0)
  800904:	02500713          	li	a4,37
  800908:	00040d13          	mv	s10,s0
  80090c:	c2e786e3          	beq	a5,a4,800538 <vprintfmt+0x5c>
  800910:	fffd0d13          	addi	s10,s10,-1
  800914:	fffd4783          	lbu	a5,-1(s10)
  800918:	fee79ce3          	bne	a5,a4,800910 <vprintfmt+0x434>
  80091c:	c1dff06f          	j	800538 <vprintfmt+0x5c>
  800920:	00040513          	mv	a0,s0
  800924:	000a00e7          	jalr	s4
  800928:	ecdff06f          	j	8007f4 <vprintfmt+0x318>
  80092c:	007b0793          	addi	a5,s6,7
  800930:	ff87f793          	andi	a5,a5,-8
  800934:	00878b13          	addi	s6,a5,8
  800938:	0007a703          	lw	a4,0(a5)
  80093c:	00800813          	li	a6,8
  800940:	0047a783          	lw	a5,4(a5)
  800944:	cc5ff06f          	j	800608 <vprintfmt+0x12c>
  800948:	007b0793          	addi	a5,s6,7
  80094c:	ff87f793          	andi	a5,a5,-8
  800950:	00878b13          	addi	s6,a5,8
  800954:	0007a703          	lw	a4,0(a5)
  800958:	00a00813          	li	a6,10
  80095c:	0047a783          	lw	a5,4(a5)
  800960:	ca9ff06f          	j	800608 <vprintfmt+0x12c>
  800964:	007b0793          	addi	a5,s6,7
  800968:	ff87f793          	andi	a5,a5,-8
  80096c:	00878b13          	addi	s6,a5,8
  800970:	0007a703          	lw	a4,0(a5)
  800974:	01000813          	li	a6,16
  800978:	0047a783          	lw	a5,4(a5)
  80097c:	c8dff06f          	j	800608 <vprintfmt+0x12c>
  800980:	007b0793          	addi	a5,s6,7
  800984:	ff87f793          	andi	a5,a5,-8
  800988:	00878b13          	addi	s6,a5,8
  80098c:	0007a703          	lw	a4,0(a5)
  800990:	0047a783          	lw	a5,4(a5)
  800994:	ccdff06f          	j	800660 <vprintfmt+0x184>
  800998:	00078713          	mv	a4,a5
  80099c:	00000697          	auipc	a3,0x0
  8009a0:	5c868693          	addi	a3,a3,1480 # 800f64 <error_string+0x22c>
  8009a4:	00090613          	mv	a2,s2
  8009a8:	00098593          	mv	a1,s3
  8009ac:	000a0513          	mv	a0,s4
  8009b0:	078000ef          	jal	ra,800a28 <printfmt>
  8009b4:	b85ff06f          	j	800538 <vprintfmt+0x5c>
  8009b8:	00044783          	lbu	a5,0(s0)
  8009bc:	00140b13          	addi	s6,s0,1
  8009c0:	00078513          	mv	a0,a5
  8009c4:	e40784e3          	beqz	a5,80080c <vprintfmt+0x330>
  8009c8:	03f00413          	li	s0,63
  8009cc:	e05ff06f          	j	8007d0 <vprintfmt+0x2f4>
  8009d0:	00000c93          	li	s9,0
  8009d4:	f11ff06f          	j	8008e4 <vprintfmt+0x408>
  8009d8:	03905c63          	blez	s9,800a10 <vprintfmt+0x534>
  8009dc:	02d00793          	li	a5,45
  8009e0:	00000417          	auipc	s0,0x0
  8009e4:	57c40413          	addi	s0,s0,1404 # 800f5c <error_string+0x224>
  8009e8:	d8f69ce3          	bne	a3,a5,800780 <vprintfmt+0x2a4>
  8009ec:	02800513          	li	a0,40
  8009f0:	00000b17          	auipc	s6,0x0
  8009f4:	56db0b13          	addi	s6,s6,1389 # 800f5d <error_string+0x225>
  8009f8:	00050793          	mv	a5,a0
  8009fc:	03f00413          	li	s0,63
  800a00:	dd1ff06f          	j	8007d0 <vprintfmt+0x2f4>
  800a04:	000e8e13          	mv	t3,t4
  800a08:	000d0413          	mv	s0,s10
  800a0c:	e75ff06f          	j	800880 <vprintfmt+0x3a4>
  800a10:	02800793          	li	a5,40
  800a14:	00078513          	mv	a0,a5
  800a18:	00000b17          	auipc	s6,0x0
  800a1c:	545b0b13          	addi	s6,s6,1349 # 800f5d <error_string+0x225>
  800a20:	03f00413          	li	s0,63
  800a24:	dadff06f          	j	8007d0 <vprintfmt+0x2f4>

00800a28 <printfmt>:
  800a28:	fd010113          	addi	sp,sp,-48
  800a2c:	02010313          	addi	t1,sp,32
  800a30:	02e12023          	sw	a4,32(sp)
  800a34:	00030713          	mv	a4,t1
  800a38:	00112e23          	sw	ra,28(sp)
  800a3c:	02f12223          	sw	a5,36(sp)
  800a40:	03012423          	sw	a6,40(sp)
  800a44:	03112623          	sw	a7,44(sp)
  800a48:	00612623          	sw	t1,12(sp)
  800a4c:	a91ff0ef          	jal	ra,8004dc <vprintfmt>
  800a50:	01c12083          	lw	ra,28(sp)
  800a54:	03010113          	addi	sp,sp,48
  800a58:	00008067          	ret

00800a5c <sleepy>:
  800a5c:	fe010113          	addi	sp,sp,-32
  800a60:	00812c23          	sw	s0,24(sp)
  800a64:	00912a23          	sw	s1,20(sp)
  800a68:	01212823          	sw	s2,16(sp)
  800a6c:	01312623          	sw	s3,12(sp)
  800a70:	00112e23          	sw	ra,28(sp)
  800a74:	00000413          	li	s0,0
  800a78:	06400493          	li	s1,100
  800a7c:	00000997          	auipc	s3,0x0
  800a80:	57898993          	addi	s3,s3,1400 # 800ff4 <error_string+0x2bc>
  800a84:	00a00913          	li	s2,10
  800a88:	00048513          	mv	a0,s1
  800a8c:	f5cff0ef          	jal	ra,8001e8 <sleep>
  800a90:	00140413          	addi	s0,s0,1
  800a94:	00048613          	mv	a2,s1
  800a98:	00040593          	mv	a1,s0
  800a9c:	00098513          	mv	a0,s3
  800aa0:	fd8ff0ef          	jal	ra,800278 <cprintf>
  800aa4:	ff2412e3          	bne	s0,s2,800a88 <sleepy+0x2c>
  800aa8:	00000513          	li	a0,0
  800aac:	f18ff0ef          	jal	ra,8001c4 <exit>

00800ab0 <main>:
  800ab0:	fe010113          	addi	sp,sp,-32
  800ab4:	00812c23          	sw	s0,24(sp)
  800ab8:	00112e23          	sw	ra,28(sp)
  800abc:	f30ff0ef          	jal	ra,8001ec <gettime_msec>
  800ac0:	00050413          	mv	s0,a0
  800ac4:	f1cff0ef          	jal	ra,8001e0 <fork>
  800ac8:	06050663          	beqz	a0,800b34 <main+0x84>
  800acc:	00c10593          	addi	a1,sp,12
  800ad0:	f14ff0ef          	jal	ra,8001e4 <waitpid>
  800ad4:	04051063          	bnez	a0,800b14 <main+0x64>
  800ad8:	00c12783          	lw	a5,12(sp)
  800adc:	02079c63          	bnez	a5,800b14 <main+0x64>
  800ae0:	f0cff0ef          	jal	ra,8001ec <gettime_msec>
  800ae4:	408505b3          	sub	a1,a0,s0
  800ae8:	00000517          	auipc	a0,0x0
  800aec:	4e850513          	addi	a0,a0,1256 # 800fd0 <error_string+0x298>
  800af0:	f88ff0ef          	jal	ra,800278 <cprintf>
  800af4:	00000517          	auipc	a0,0x0
  800af8:	4f050513          	addi	a0,a0,1264 # 800fe4 <error_string+0x2ac>
  800afc:	f7cff0ef          	jal	ra,800278 <cprintf>
  800b00:	01c12083          	lw	ra,28(sp)
  800b04:	00000513          	li	a0,0
  800b08:	01812403          	lw	s0,24(sp)
  800b0c:	02010113          	addi	sp,sp,32
  800b10:	00008067          	ret
  800b14:	00000697          	auipc	a3,0x0
  800b18:	46068693          	addi	a3,a3,1120 # 800f74 <error_string+0x23c>
  800b1c:	00000617          	auipc	a2,0x0
  800b20:	48c60613          	addi	a2,a2,1164 # 800fa8 <error_string+0x270>
  800b24:	01700593          	li	a1,23
  800b28:	00000517          	auipc	a0,0x0
  800b2c:	49850513          	addi	a0,a0,1176 # 800fc0 <error_string+0x288>
  800b30:	cf0ff0ef          	jal	ra,800020 <__panic>
  800b34:	f29ff0ef          	jal	ra,800a5c <sleepy>
