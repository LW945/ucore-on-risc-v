
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
  800040:	d3450513          	addi	a0,a0,-716 # 800d70 <main+0x100>
  800044:	00112e23          	sw	ra,28(sp)
  800048:	02d12623          	sw	a3,44(sp)
  80004c:	02e12823          	sw	a4,48(sp)
  800050:	03012c23          	sw	a6,56(sp)
  800054:	03112e23          	sw	a7,60(sp)
  800058:	00f12623          	sw	a5,12(sp)
  80005c:	230000ef          	jal	ra,80028c <cprintf>
  800060:	00c12583          	lw	a1,12(sp)
  800064:	00040513          	mv	a0,s0
  800068:	1e8000ef          	jal	ra,800250 <vcprintf>
  80006c:	00001517          	auipc	a0,0x1
  800070:	15850513          	addi	a0,a0,344 # 8011c4 <error_string+0x254>
  800074:	218000ef          	jal	ra,80028c <cprintf>
  800078:	ff600513          	li	a0,-10
  80007c:	150000ef          	jal	ra,8001cc <exit>

00800080 <__warn>:
  800080:	fc010113          	addi	sp,sp,-64
  800084:	00812c23          	sw	s0,24(sp)
  800088:	02f12a23          	sw	a5,52(sp)
  80008c:	00060413          	mv	s0,a2
  800090:	02c10793          	addi	a5,sp,44
  800094:	00058613          	mv	a2,a1
  800098:	00050593          	mv	a1,a0
  80009c:	00001517          	auipc	a0,0x1
  8000a0:	cf050513          	addi	a0,a0,-784 # 800d8c <main+0x11c>
  8000a4:	00112e23          	sw	ra,28(sp)
  8000a8:	02d12623          	sw	a3,44(sp)
  8000ac:	02e12823          	sw	a4,48(sp)
  8000b0:	03012c23          	sw	a6,56(sp)
  8000b4:	03112e23          	sw	a7,60(sp)
  8000b8:	00f12623          	sw	a5,12(sp)
  8000bc:	1d0000ef          	jal	ra,80028c <cprintf>
  8000c0:	00c12583          	lw	a1,12(sp)
  8000c4:	00040513          	mv	a0,s0
  8000c8:	188000ef          	jal	ra,800250 <vcprintf>
  8000cc:	00001517          	auipc	a0,0x1
  8000d0:	0f850513          	addi	a0,a0,248 # 8011c4 <error_string+0x254>
  8000d4:	1b8000ef          	jal	ra,80028c <cprintf>
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

00800178 <sys_yield>:
  800178:	00a00513          	li	a0,10
  80017c:	f6dff06f          	j	8000e8 <syscall>

00800180 <sys_kill>:
  800180:	00050593          	mv	a1,a0
  800184:	00c00513          	li	a0,12
  800188:	f61ff06f          	j	8000e8 <syscall>

0080018c <sys_getpid>:
  80018c:	01200513          	li	a0,18
  800190:	f59ff06f          	j	8000e8 <syscall>

00800194 <sys_putc>:
  800194:	00050593          	mv	a1,a0
  800198:	01e00513          	li	a0,30
  80019c:	f4dff06f          	j	8000e8 <syscall>

008001a0 <sys_open>:
  8001a0:	00058613          	mv	a2,a1
  8001a4:	00050593          	mv	a1,a0
  8001a8:	06400513          	li	a0,100
  8001ac:	f3dff06f          	j	8000e8 <syscall>

008001b0 <sys_close>:
  8001b0:	00050593          	mv	a1,a0
  8001b4:	06500513          	li	a0,101
  8001b8:	f31ff06f          	j	8000e8 <syscall>

008001bc <sys_dup>:
  8001bc:	00058613          	mv	a2,a1
  8001c0:	00050593          	mv	a1,a0
  8001c4:	08200513          	li	a0,130
  8001c8:	f21ff06f          	j	8000e8 <syscall>

008001cc <exit>:
  8001cc:	ff010113          	addi	sp,sp,-16
  8001d0:	00112623          	sw	ra,12(sp)
  8001d4:	f81ff0ef          	jal	ra,800154 <sys_exit>
  8001d8:	00001517          	auipc	a0,0x1
  8001dc:	bd050513          	addi	a0,a0,-1072 # 800da8 <main+0x138>
  8001e0:	0ac000ef          	jal	ra,80028c <cprintf>
  8001e4:	0000006f          	j	8001e4 <exit+0x18>

008001e8 <fork>:
  8001e8:	f79ff06f          	j	800160 <sys_fork>

008001ec <wait>:
  8001ec:	00000593          	li	a1,0
  8001f0:	00000513          	li	a0,0
  8001f4:	f75ff06f          	j	800168 <sys_wait>

008001f8 <yield>:
  8001f8:	f81ff06f          	j	800178 <sys_yield>

008001fc <kill>:
  8001fc:	f85ff06f          	j	800180 <sys_kill>

00800200 <getpid>:
  800200:	f8dff06f          	j	80018c <sys_getpid>

00800204 <_start>:
  800204:	00012503          	lw	a0,0(sp)
  800208:	00410593          	addi	a1,sp,4
  80020c:	14c000ef          	jal	ra,800358 <umain>
  800210:	0000006f          	j	800210 <_start+0xc>

00800214 <open>:
  800214:	f8dff06f          	j	8001a0 <sys_open>

00800218 <close>:
  800218:	f99ff06f          	j	8001b0 <sys_close>

0080021c <dup2>:
  80021c:	fa1ff06f          	j	8001bc <sys_dup>

00800220 <cputch>:
  800220:	ff010113          	addi	sp,sp,-16
  800224:	00112623          	sw	ra,12(sp)
  800228:	00812423          	sw	s0,8(sp)
  80022c:	00058413          	mv	s0,a1
  800230:	f65ff0ef          	jal	ra,800194 <sys_putc>
  800234:	00042783          	lw	a5,0(s0)
  800238:	00c12083          	lw	ra,12(sp)
  80023c:	00178793          	addi	a5,a5,1
  800240:	00f42023          	sw	a5,0(s0)
  800244:	00812403          	lw	s0,8(sp)
  800248:	01010113          	addi	sp,sp,16
  80024c:	00008067          	ret

00800250 <vcprintf>:
  800250:	fe010113          	addi	sp,sp,-32
  800254:	00058713          	mv	a4,a1
  800258:	ffff75b7          	lui	a1,0xffff7
  80025c:	00050693          	mv	a3,a0
  800260:	00c10613          	addi	a2,sp,12
  800264:	00000517          	auipc	a0,0x0
  800268:	fbc50513          	addi	a0,a0,-68 # 800220 <cputch>
  80026c:	ad958593          	addi	a1,a1,-1319 # ffff6ad9 <sbi_remote_fence_i+0xffff71e9>
  800270:	00112e23          	sw	ra,28(sp)
  800274:	00012623          	sw	zero,12(sp)
  800278:	294000ef          	jal	ra,80050c <vprintfmt>
  80027c:	01c12083          	lw	ra,28(sp)
  800280:	00c12503          	lw	a0,12(sp)
  800284:	02010113          	addi	sp,sp,32
  800288:	00008067          	ret

0080028c <cprintf>:
  80028c:	fc010113          	addi	sp,sp,-64
  800290:	02410313          	addi	t1,sp,36
  800294:	02b12223          	sw	a1,36(sp)
  800298:	ffff75b7          	lui	a1,0xffff7
  80029c:	02c12423          	sw	a2,40(sp)
  8002a0:	02d12623          	sw	a3,44(sp)
  8002a4:	02e12823          	sw	a4,48(sp)
  8002a8:	00050693          	mv	a3,a0
  8002ac:	00c10613          	addi	a2,sp,12
  8002b0:	00000517          	auipc	a0,0x0
  8002b4:	f7050513          	addi	a0,a0,-144 # 800220 <cputch>
  8002b8:	00030713          	mv	a4,t1
  8002bc:	ad958593          	addi	a1,a1,-1319 # ffff6ad9 <sbi_remote_fence_i+0xffff71e9>
  8002c0:	00112e23          	sw	ra,28(sp)
  8002c4:	02f12a23          	sw	a5,52(sp)
  8002c8:	03012c23          	sw	a6,56(sp)
  8002cc:	03112e23          	sw	a7,60(sp)
  8002d0:	00612423          	sw	t1,8(sp)
  8002d4:	00012623          	sw	zero,12(sp)
  8002d8:	234000ef          	jal	ra,80050c <vprintfmt>
  8002dc:	01c12083          	lw	ra,28(sp)
  8002e0:	00c12503          	lw	a0,12(sp)
  8002e4:	04010113          	addi	sp,sp,64
  8002e8:	00008067          	ret

008002ec <initfd>:
  8002ec:	ff010113          	addi	sp,sp,-16
  8002f0:	00058793          	mv	a5,a1
  8002f4:	00912223          	sw	s1,4(sp)
  8002f8:	00060593          	mv	a1,a2
  8002fc:	00050493          	mv	s1,a0
  800300:	00078513          	mv	a0,a5
  800304:	00812423          	sw	s0,8(sp)
  800308:	00112623          	sw	ra,12(sp)
  80030c:	f09ff0ef          	jal	ra,800214 <open>
  800310:	00050413          	mv	s0,a0
  800314:	02054663          	bltz	a0,800340 <initfd+0x54>
  800318:	02950463          	beq	a0,s1,800340 <initfd+0x54>
  80031c:	00048513          	mv	a0,s1
  800320:	ef9ff0ef          	jal	ra,800218 <close>
  800324:	00048593          	mv	a1,s1
  800328:	00040513          	mv	a0,s0
  80032c:	ef1ff0ef          	jal	ra,80021c <dup2>
  800330:	00050493          	mv	s1,a0
  800334:	00040513          	mv	a0,s0
  800338:	ee1ff0ef          	jal	ra,800218 <close>
  80033c:	00048413          	mv	s0,s1
  800340:	00c12083          	lw	ra,12(sp)
  800344:	00040513          	mv	a0,s0
  800348:	00412483          	lw	s1,4(sp)
  80034c:	00812403          	lw	s0,8(sp)
  800350:	01010113          	addi	sp,sp,16
  800354:	00008067          	ret

00800358 <umain>:
  800358:	ff010113          	addi	sp,sp,-16
  80035c:	00812423          	sw	s0,8(sp)
  800360:	00912223          	sw	s1,4(sp)
  800364:	00050413          	mv	s0,a0
  800368:	00058493          	mv	s1,a1
  80036c:	00000613          	li	a2,0
  800370:	00001597          	auipc	a1,0x1
  800374:	a4c58593          	addi	a1,a1,-1460 # 800dbc <main+0x14c>
  800378:	00000513          	li	a0,0
  80037c:	00112623          	sw	ra,12(sp)
  800380:	f6dff0ef          	jal	ra,8002ec <initfd>
  800384:	02054663          	bltz	a0,8003b0 <umain+0x58>
  800388:	00100613          	li	a2,1
  80038c:	00001597          	auipc	a1,0x1
  800390:	a6858593          	addi	a1,a1,-1432 # 800df4 <main+0x184>
  800394:	00060513          	mv	a0,a2
  800398:	f55ff0ef          	jal	ra,8002ec <initfd>
  80039c:	02054a63          	bltz	a0,8003d0 <umain+0x78>
  8003a0:	00048593          	mv	a1,s1
  8003a4:	00040513          	mv	a0,s0
  8003a8:	0c9000ef          	jal	ra,800c70 <main>
  8003ac:	e21ff0ef          	jal	ra,8001cc <exit>
  8003b0:	00050693          	mv	a3,a0
  8003b4:	00001617          	auipc	a2,0x1
  8003b8:	a1060613          	addi	a2,a2,-1520 # 800dc4 <main+0x154>
  8003bc:	01a00593          	li	a1,26
  8003c0:	00001517          	auipc	a0,0x1
  8003c4:	a2050513          	addi	a0,a0,-1504 # 800de0 <main+0x170>
  8003c8:	cb9ff0ef          	jal	ra,800080 <__warn>
  8003cc:	fbdff06f          	j	800388 <umain+0x30>
  8003d0:	00050693          	mv	a3,a0
  8003d4:	00001617          	auipc	a2,0x1
  8003d8:	a2860613          	addi	a2,a2,-1496 # 800dfc <main+0x18c>
  8003dc:	01d00593          	li	a1,29
  8003e0:	00001517          	auipc	a0,0x1
  8003e4:	a0050513          	addi	a0,a0,-1536 # 800de0 <main+0x170>
  8003e8:	c99ff0ef          	jal	ra,800080 <__warn>
  8003ec:	fb5ff06f          	j	8003a0 <umain+0x48>

008003f0 <strnlen>:
  8003f0:	00050693          	mv	a3,a0
  8003f4:	02058a63          	beqz	a1,800428 <strnlen+0x38>
  8003f8:	00054703          	lbu	a4,0(a0)
  8003fc:	00150793          	addi	a5,a0,1
  800400:	02070463          	beqz	a4,800428 <strnlen+0x38>
  800404:	00b505b3          	add	a1,a0,a1
  800408:	0100006f          	j	800418 <strnlen+0x28>
  80040c:	00178793          	addi	a5,a5,1
  800410:	fff7c703          	lbu	a4,-1(a5)
  800414:	00070863          	beqz	a4,800424 <strnlen+0x34>
  800418:	40d78533          	sub	a0,a5,a3
  80041c:	feb798e3          	bne	a5,a1,80040c <strnlen+0x1c>
  800420:	00008067          	ret
  800424:	00008067          	ret
  800428:	00000513          	li	a0,0
  80042c:	00008067          	ret

00800430 <memset>:
  800430:	00c50733          	add	a4,a0,a2
  800434:	00050793          	mv	a5,a0
  800438:	00060863          	beqz	a2,800448 <memset+0x18>
  80043c:	00178793          	addi	a5,a5,1
  800440:	feb78fa3          	sb	a1,-1(a5)
  800444:	fef71ce3          	bne	a4,a5,80043c <memset+0xc>
  800448:	00008067          	ret

0080044c <printnum>:
  80044c:	fd010113          	addi	sp,sp,-48
  800450:	02912223          	sw	s1,36(sp)
  800454:	03212023          	sw	s2,32(sp)
  800458:	01312e23          	sw	s3,28(sp)
  80045c:	01412c23          	sw	s4,24(sp)
  800460:	01512a23          	sw	s5,20(sp)
  800464:	02112623          	sw	ra,44(sp)
  800468:	02812423          	sw	s0,40(sp)
  80046c:	00050493          	mv	s1,a0
  800470:	00058993          	mv	s3,a1
  800474:	00060913          	mv	s2,a2
  800478:	03012a03          	lw	s4,48(sp)
  80047c:	03077ab3          	remu	s5,a4,a6
  800480:	06079463          	bnez	a5,8004e8 <printnum+0x9c>
  800484:	07077263          	bleu	a6,a4,8004e8 <printnum+0x9c>
  800488:	fff88413          	addi	s0,a7,-1
  80048c:	00805e63          	blez	s0,8004a8 <printnum+0x5c>
  800490:	fff40413          	addi	s0,s0,-1
  800494:	00098613          	mv	a2,s3
  800498:	00090593          	mv	a1,s2
  80049c:	000a0513          	mv	a0,s4
  8004a0:	000480e7          	jalr	s1
  8004a4:	fe0416e3          	bnez	s0,800490 <printnum+0x44>
  8004a8:	00001797          	auipc	a5,0x1
  8004ac:	b2c78793          	addi	a5,a5,-1236 # 800fd4 <error_string+0x64>
  8004b0:	015787b3          	add	a5,a5,s5
  8004b4:	00098613          	mv	a2,s3
  8004b8:	00090593          	mv	a1,s2
  8004bc:	00048313          	mv	t1,s1
  8004c0:	02c12083          	lw	ra,44(sp)
  8004c4:	02812403          	lw	s0,40(sp)
  8004c8:	02412483          	lw	s1,36(sp)
  8004cc:	02012903          	lw	s2,32(sp)
  8004d0:	01c12983          	lw	s3,28(sp)
  8004d4:	01812a03          	lw	s4,24(sp)
  8004d8:	01412a83          	lw	s5,20(sp)
  8004dc:	0007c503          	lbu	a0,0(a5)
  8004e0:	03010113          	addi	sp,sp,48
  8004e4:	00030067          	jr	t1
  8004e8:	03075733          	divu	a4,a4,a6
  8004ec:	01412023          	sw	s4,0(sp)
  8004f0:	fff88893          	addi	a7,a7,-1
  8004f4:	00000793          	li	a5,0
  8004f8:	00090613          	mv	a2,s2
  8004fc:	00098593          	mv	a1,s3
  800500:	00048513          	mv	a0,s1
  800504:	f49ff0ef          	jal	ra,80044c <printnum>
  800508:	fa1ff06f          	j	8004a8 <printnum+0x5c>

0080050c <vprintfmt>:
  80050c:	fa010113          	addi	sp,sp,-96
  800510:	05212823          	sw	s2,80(sp)
  800514:	05312623          	sw	s3,76(sp)
  800518:	05412423          	sw	s4,72(sp)
  80051c:	05512223          	sw	s5,68(sp)
  800520:	05612023          	sw	s6,64(sp)
  800524:	03712e23          	sw	s7,60(sp)
  800528:	03812c23          	sw	s8,56(sp)
  80052c:	03a12823          	sw	s10,48(sp)
  800530:	04112e23          	sw	ra,92(sp)
  800534:	04812c23          	sw	s0,88(sp)
  800538:	04912a23          	sw	s1,84(sp)
  80053c:	03912a23          	sw	s9,52(sp)
  800540:	03b12623          	sw	s11,44(sp)
  800544:	00050a13          	mv	s4,a0
  800548:	00058993          	mv	s3,a1
  80054c:	00060913          	mv	s2,a2
  800550:	00068d13          	mv	s10,a3
  800554:	00070b13          	mv	s6,a4
  800558:	00001a97          	auipc	s5,0x1
  80055c:	8c0a8a93          	addi	s5,s5,-1856 # 800e18 <main+0x1a8>
  800560:	fff00b93          	li	s7,-1
  800564:	05e00c13          	li	s8,94
  800568:	000d4503          	lbu	a0,0(s10)
  80056c:	02500493          	li	s1,37
  800570:	001d0413          	addi	s0,s10,1
  800574:	02950063          	beq	a0,s1,800594 <vprintfmt+0x88>
  800578:	06050663          	beqz	a0,8005e4 <vprintfmt+0xd8>
  80057c:	00098613          	mv	a2,s3
  800580:	00090593          	mv	a1,s2
  800584:	00140413          	addi	s0,s0,1
  800588:	000a00e7          	jalr	s4
  80058c:	fff44503          	lbu	a0,-1(s0)
  800590:	fe9514e3          	bne	a0,s1,800578 <vprintfmt+0x6c>
  800594:	00044e03          	lbu	t3,0(s0)
  800598:	fff00d93          	li	s11,-1
  80059c:	02000693          	li	a3,32
  8005a0:	00000493          	li	s1,0
  8005a4:	00000593          	li	a1,0
  8005a8:	000d8c93          	mv	s9,s11
  8005ac:	05500713          	li	a4,85
  8005b0:	00100313          	li	t1,1
  8005b4:	03000813          	li	a6,48
  8005b8:	00900613          	li	a2,9
  8005bc:	02d00513          	li	a0,45
  8005c0:	fdde0793          	addi	a5,t3,-35
  8005c4:	0ff7f793          	andi	a5,a5,255
  8005c8:	00140d13          	addi	s10,s0,1
  8005cc:	34f76a63          	bltu	a4,a5,800920 <vprintfmt+0x414>
  8005d0:	00279793          	slli	a5,a5,0x2
  8005d4:	015787b3          	add	a5,a5,s5
  8005d8:	0007a783          	lw	a5,0(a5)
  8005dc:	015787b3          	add	a5,a5,s5
  8005e0:	00078067          	jr	a5
  8005e4:	05c12083          	lw	ra,92(sp)
  8005e8:	05812403          	lw	s0,88(sp)
  8005ec:	05412483          	lw	s1,84(sp)
  8005f0:	05012903          	lw	s2,80(sp)
  8005f4:	04c12983          	lw	s3,76(sp)
  8005f8:	04812a03          	lw	s4,72(sp)
  8005fc:	04412a83          	lw	s5,68(sp)
  800600:	04012b03          	lw	s6,64(sp)
  800604:	03c12b83          	lw	s7,60(sp)
  800608:	03812c03          	lw	s8,56(sp)
  80060c:	03412c83          	lw	s9,52(sp)
  800610:	03012d03          	lw	s10,48(sp)
  800614:	02c12d83          	lw	s11,44(sp)
  800618:	06010113          	addi	sp,sp,96
  80061c:	00008067          	ret
  800620:	00100793          	li	a5,1
  800624:	36b7c863          	blt	a5,a1,800994 <vprintfmt+0x488>
  800628:	000b2703          	lw	a4,0(s6)
  80062c:	00000793          	li	a5,0
  800630:	004b0b13          	addi	s6,s6,4
  800634:	01000813          	li	a6,16
  800638:	00d12023          	sw	a3,0(sp)
  80063c:	000c8893          	mv	a7,s9
  800640:	00090613          	mv	a2,s2
  800644:	00098593          	mv	a1,s3
  800648:	000a0513          	mv	a0,s4
  80064c:	e01ff0ef          	jal	ra,80044c <printnum>
  800650:	f19ff06f          	j	800568 <vprintfmt+0x5c>
  800654:	00144e03          	lbu	t3,1(s0)
  800658:	00030493          	mv	s1,t1
  80065c:	000d0413          	mv	s0,s10
  800660:	f61ff06f          	j	8005c0 <vprintfmt+0xb4>
  800664:	000b2503          	lw	a0,0(s6)
  800668:	00098613          	mv	a2,s3
  80066c:	00090593          	mv	a1,s2
  800670:	004b0b13          	addi	s6,s6,4
  800674:	000a00e7          	jalr	s4
  800678:	ef1ff06f          	j	800568 <vprintfmt+0x5c>
  80067c:	00100793          	li	a5,1
  800680:	32b7c863          	blt	a5,a1,8009b0 <vprintfmt+0x4a4>
  800684:	000b2703          	lw	a4,0(s6)
  800688:	004b0b13          	addi	s6,s6,4
  80068c:	41f75793          	srai	a5,a4,0x1f
  800690:	00a00813          	li	a6,10
  800694:	fa07d2e3          	bgez	a5,800638 <vprintfmt+0x12c>
  800698:	00098613          	mv	a2,s3
  80069c:	00090593          	mv	a1,s2
  8006a0:	02d00513          	li	a0,45
  8006a4:	00f12e23          	sw	a5,28(sp)
  8006a8:	00e12c23          	sw	a4,24(sp)
  8006ac:	01012a23          	sw	a6,20(sp)
  8006b0:	00d12823          	sw	a3,16(sp)
  8006b4:	000a00e7          	jalr	s4
  8006b8:	01812703          	lw	a4,24(sp)
  8006bc:	01c12783          	lw	a5,28(sp)
  8006c0:	01012683          	lw	a3,16(sp)
  8006c4:	40e00733          	neg	a4,a4
  8006c8:	00e03633          	snez	a2,a4
  8006cc:	40f007b3          	neg	a5,a5
  8006d0:	40c787b3          	sub	a5,a5,a2
  8006d4:	01412803          	lw	a6,20(sp)
  8006d8:	f61ff06f          	j	800638 <vprintfmt+0x12c>
  8006dc:	000b2783          	lw	a5,0(s6)
  8006e0:	01800693          	li	a3,24
  8006e4:	004b0b13          	addi	s6,s6,4
  8006e8:	41f7d713          	srai	a4,a5,0x1f
  8006ec:	00f747b3          	xor	a5,a4,a5
  8006f0:	40e787b3          	sub	a5,a5,a4
  8006f4:	2cf6ca63          	blt	a3,a5,8009c8 <vprintfmt+0x4bc>
  8006f8:	00279693          	slli	a3,a5,0x2
  8006fc:	00001717          	auipc	a4,0x1
  800700:	87470713          	addi	a4,a4,-1932 # 800f70 <error_string>
  800704:	00d70733          	add	a4,a4,a3
  800708:	00072703          	lw	a4,0(a4)
  80070c:	2a070e63          	beqz	a4,8009c8 <vprintfmt+0x4bc>
  800710:	00001697          	auipc	a3,0x1
  800714:	a9868693          	addi	a3,a3,-1384 # 8011a8 <error_string+0x238>
  800718:	00090613          	mv	a2,s2
  80071c:	00098593          	mv	a1,s3
  800720:	000a0513          	mv	a0,s4
  800724:	334000ef          	jal	ra,800a58 <printfmt>
  800728:	e41ff06f          	j	800568 <vprintfmt+0x5c>
  80072c:	00144e03          	lbu	t3,1(s0)
  800730:	00158593          	addi	a1,a1,1
  800734:	000d0413          	mv	s0,s10
  800738:	e89ff06f          	j	8005c0 <vprintfmt+0xb4>
  80073c:	00100793          	li	a5,1
  800740:	20b7ce63          	blt	a5,a1,80095c <vprintfmt+0x450>
  800744:	000b2703          	lw	a4,0(s6)
  800748:	00000793          	li	a5,0
  80074c:	004b0b13          	addi	s6,s6,4
  800750:	00800813          	li	a6,8
  800754:	ee5ff06f          	j	800638 <vprintfmt+0x12c>
  800758:	03000513          	li	a0,48
  80075c:	00098613          	mv	a2,s3
  800760:	00090593          	mv	a1,s2
  800764:	00d12823          	sw	a3,16(sp)
  800768:	000a00e7          	jalr	s4
  80076c:	00098613          	mv	a2,s3
  800770:	00090593          	mv	a1,s2
  800774:	07800513          	li	a0,120
  800778:	000a00e7          	jalr	s4
  80077c:	000b2703          	lw	a4,0(s6)
  800780:	00000793          	li	a5,0
  800784:	01000813          	li	a6,16
  800788:	004b0b13          	addi	s6,s6,4
  80078c:	01012683          	lw	a3,16(sp)
  800790:	ea9ff06f          	j	800638 <vprintfmt+0x12c>
  800794:	000b2403          	lw	s0,0(s6)
  800798:	004b0793          	addi	a5,s6,4
  80079c:	00f12a23          	sw	a5,20(sp)
  8007a0:	26040463          	beqz	s0,800a08 <vprintfmt+0x4fc>
  8007a4:	05905463          	blez	s9,8007ec <vprintfmt+0x2e0>
  8007a8:	02d00793          	li	a5,45
  8007ac:	22f68e63          	beq	a3,a5,8009e8 <vprintfmt+0x4dc>
  8007b0:	000d8593          	mv	a1,s11
  8007b4:	00040513          	mv	a0,s0
  8007b8:	00d12823          	sw	a3,16(sp)
  8007bc:	c35ff0ef          	jal	ra,8003f0 <strnlen>
  8007c0:	40ac8cb3          	sub	s9,s9,a0
  8007c4:	03905463          	blez	s9,8007ec <vprintfmt+0x2e0>
  8007c8:	01012683          	lw	a3,16(sp)
  8007cc:	00068513          	mv	a0,a3
  8007d0:	00098613          	mv	a2,s3
  8007d4:	00090593          	mv	a1,s2
  8007d8:	00d12823          	sw	a3,16(sp)
  8007dc:	fffc8c93          	addi	s9,s9,-1
  8007e0:	000a00e7          	jalr	s4
  8007e4:	01012683          	lw	a3,16(sp)
  8007e8:	fe0c92e3          	bnez	s9,8007cc <vprintfmt+0x2c0>
  8007ec:	00044783          	lbu	a5,0(s0)
  8007f0:	00140b13          	addi	s6,s0,1
  8007f4:	00078513          	mv	a0,a5
  8007f8:	06078063          	beqz	a5,800858 <vprintfmt+0x34c>
  8007fc:	03f00413          	li	s0,63
  800800:	000dc663          	bltz	s11,80080c <vprintfmt+0x300>
  800804:	fffd8d93          	addi	s11,s11,-1
  800808:	037d8863          	beq	s11,s7,800838 <vprintfmt+0x32c>
  80080c:	00098613          	mv	a2,s3
  800810:	00090593          	mv	a1,s2
  800814:	00048663          	beqz	s1,800820 <vprintfmt+0x314>
  800818:	fe078793          	addi	a5,a5,-32
  80081c:	12fc6a63          	bltu	s8,a5,800950 <vprintfmt+0x444>
  800820:	000a00e7          	jalr	s4
  800824:	001b0b13          	addi	s6,s6,1
  800828:	fffb4783          	lbu	a5,-1(s6)
  80082c:	fffc8c93          	addi	s9,s9,-1
  800830:	00078513          	mv	a0,a5
  800834:	fc0796e3          	bnez	a5,800800 <vprintfmt+0x2f4>
  800838:	03905063          	blez	s9,800858 <vprintfmt+0x34c>
  80083c:	02000413          	li	s0,32
  800840:	fffc8c93          	addi	s9,s9,-1
  800844:	00098613          	mv	a2,s3
  800848:	00090593          	mv	a1,s2
  80084c:	00040513          	mv	a0,s0
  800850:	000a00e7          	jalr	s4
  800854:	fe0c96e3          	bnez	s9,800840 <vprintfmt+0x334>
  800858:	01412b03          	lw	s6,20(sp)
  80085c:	d0dff06f          	j	800568 <vprintfmt+0x5c>
  800860:	00100793          	li	a5,1
  800864:	10b7ca63          	blt	a5,a1,800978 <vprintfmt+0x46c>
  800868:	000b2703          	lw	a4,0(s6)
  80086c:	00000793          	li	a5,0
  800870:	004b0b13          	addi	s6,s6,4
  800874:	00a00813          	li	a6,10
  800878:	dc1ff06f          	j	800638 <vprintfmt+0x12c>
  80087c:	00144e03          	lbu	t3,1(s0)
  800880:	00050693          	mv	a3,a0
  800884:	000d0413          	mv	s0,s10
  800888:	d39ff06f          	j	8005c0 <vprintfmt+0xb4>
  80088c:	00098613          	mv	a2,s3
  800890:	00090593          	mv	a1,s2
  800894:	02500513          	li	a0,37
  800898:	000a00e7          	jalr	s4
  80089c:	ccdff06f          	j	800568 <vprintfmt+0x5c>
  8008a0:	000b2d83          	lw	s11,0(s6)
  8008a4:	00144e03          	lbu	t3,1(s0)
  8008a8:	004b0b13          	addi	s6,s6,4
  8008ac:	000d0413          	mv	s0,s10
  8008b0:	d00cd8e3          	bgez	s9,8005c0 <vprintfmt+0xb4>
  8008b4:	000d8c93          	mv	s9,s11
  8008b8:	fff00d93          	li	s11,-1
  8008bc:	d05ff06f          	j	8005c0 <vprintfmt+0xb4>
  8008c0:	00144e03          	lbu	t3,1(s0)
  8008c4:	00080693          	mv	a3,a6
  8008c8:	000d0413          	mv	s0,s10
  8008cc:	cf5ff06f          	j	8005c0 <vprintfmt+0xb4>
  8008d0:	00144e83          	lbu	t4,1(s0)
  8008d4:	fd0e0d93          	addi	s11,t3,-48
  8008d8:	fd0e8793          	addi	a5,t4,-48
  8008dc:	14f66c63          	bltu	a2,a5,800a34 <vprintfmt+0x528>
  8008e0:	000d0413          	mv	s0,s10
  8008e4:	002d9793          	slli	a5,s11,0x2
  8008e8:	01b78db3          	add	s11,a5,s11
  8008ec:	00140413          	addi	s0,s0,1
  8008f0:	001d9d93          	slli	s11,s11,0x1
  8008f4:	01dd8db3          	add	s11,s11,t4
  8008f8:	00044e83          	lbu	t4,0(s0)
  8008fc:	fd0d8d93          	addi	s11,s11,-48
  800900:	fd0e8793          	addi	a5,t4,-48
  800904:	fef670e3          	bleu	a5,a2,8008e4 <vprintfmt+0x3d8>
  800908:	000e8e13          	mv	t3,t4
  80090c:	fa5ff06f          	j	8008b0 <vprintfmt+0x3a4>
  800910:	0e0cc863          	bltz	s9,800a00 <vprintfmt+0x4f4>
  800914:	00144e03          	lbu	t3,1(s0)
  800918:	000d0413          	mv	s0,s10
  80091c:	ca5ff06f          	j	8005c0 <vprintfmt+0xb4>
  800920:	00098613          	mv	a2,s3
  800924:	00090593          	mv	a1,s2
  800928:	02500513          	li	a0,37
  80092c:	000a00e7          	jalr	s4
  800930:	fff44783          	lbu	a5,-1(s0)
  800934:	02500713          	li	a4,37
  800938:	00040d13          	mv	s10,s0
  80093c:	c2e786e3          	beq	a5,a4,800568 <vprintfmt+0x5c>
  800940:	fffd0d13          	addi	s10,s10,-1
  800944:	fffd4783          	lbu	a5,-1(s10)
  800948:	fee79ce3          	bne	a5,a4,800940 <vprintfmt+0x434>
  80094c:	c1dff06f          	j	800568 <vprintfmt+0x5c>
  800950:	00040513          	mv	a0,s0
  800954:	000a00e7          	jalr	s4
  800958:	ecdff06f          	j	800824 <vprintfmt+0x318>
  80095c:	007b0793          	addi	a5,s6,7
  800960:	ff87f793          	andi	a5,a5,-8
  800964:	00878b13          	addi	s6,a5,8
  800968:	0007a703          	lw	a4,0(a5)
  80096c:	00800813          	li	a6,8
  800970:	0047a783          	lw	a5,4(a5)
  800974:	cc5ff06f          	j	800638 <vprintfmt+0x12c>
  800978:	007b0793          	addi	a5,s6,7
  80097c:	ff87f793          	andi	a5,a5,-8
  800980:	00878b13          	addi	s6,a5,8
  800984:	0007a703          	lw	a4,0(a5)
  800988:	00a00813          	li	a6,10
  80098c:	0047a783          	lw	a5,4(a5)
  800990:	ca9ff06f          	j	800638 <vprintfmt+0x12c>
  800994:	007b0793          	addi	a5,s6,7
  800998:	ff87f793          	andi	a5,a5,-8
  80099c:	00878b13          	addi	s6,a5,8
  8009a0:	0007a703          	lw	a4,0(a5)
  8009a4:	01000813          	li	a6,16
  8009a8:	0047a783          	lw	a5,4(a5)
  8009ac:	c8dff06f          	j	800638 <vprintfmt+0x12c>
  8009b0:	007b0793          	addi	a5,s6,7
  8009b4:	ff87f793          	andi	a5,a5,-8
  8009b8:	00878b13          	addi	s6,a5,8
  8009bc:	0007a703          	lw	a4,0(a5)
  8009c0:	0047a783          	lw	a5,4(a5)
  8009c4:	ccdff06f          	j	800690 <vprintfmt+0x184>
  8009c8:	00078713          	mv	a4,a5
  8009cc:	00000697          	auipc	a3,0x0
  8009d0:	7d068693          	addi	a3,a3,2000 # 80119c <error_string+0x22c>
  8009d4:	00090613          	mv	a2,s2
  8009d8:	00098593          	mv	a1,s3
  8009dc:	000a0513          	mv	a0,s4
  8009e0:	078000ef          	jal	ra,800a58 <printfmt>
  8009e4:	b85ff06f          	j	800568 <vprintfmt+0x5c>
  8009e8:	00044783          	lbu	a5,0(s0)
  8009ec:	00140b13          	addi	s6,s0,1
  8009f0:	00078513          	mv	a0,a5
  8009f4:	e40784e3          	beqz	a5,80083c <vprintfmt+0x330>
  8009f8:	03f00413          	li	s0,63
  8009fc:	e05ff06f          	j	800800 <vprintfmt+0x2f4>
  800a00:	00000c93          	li	s9,0
  800a04:	f11ff06f          	j	800914 <vprintfmt+0x408>
  800a08:	03905c63          	blez	s9,800a40 <vprintfmt+0x534>
  800a0c:	02d00793          	li	a5,45
  800a10:	00000417          	auipc	s0,0x0
  800a14:	78440413          	addi	s0,s0,1924 # 801194 <error_string+0x224>
  800a18:	d8f69ce3          	bne	a3,a5,8007b0 <vprintfmt+0x2a4>
  800a1c:	02800513          	li	a0,40
  800a20:	00000b17          	auipc	s6,0x0
  800a24:	775b0b13          	addi	s6,s6,1909 # 801195 <error_string+0x225>
  800a28:	00050793          	mv	a5,a0
  800a2c:	03f00413          	li	s0,63
  800a30:	dd1ff06f          	j	800800 <vprintfmt+0x2f4>
  800a34:	000e8e13          	mv	t3,t4
  800a38:	000d0413          	mv	s0,s10
  800a3c:	e75ff06f          	j	8008b0 <vprintfmt+0x3a4>
  800a40:	02800793          	li	a5,40
  800a44:	00078513          	mv	a0,a5
  800a48:	00000b17          	auipc	s6,0x0
  800a4c:	74db0b13          	addi	s6,s6,1869 # 801195 <error_string+0x225>
  800a50:	03f00413          	li	s0,63
  800a54:	dadff06f          	j	800800 <vprintfmt+0x2f4>

00800a58 <printfmt>:
  800a58:	fd010113          	addi	sp,sp,-48
  800a5c:	02010313          	addi	t1,sp,32
  800a60:	02e12023          	sw	a4,32(sp)
  800a64:	00030713          	mv	a4,t1
  800a68:	00112e23          	sw	ra,28(sp)
  800a6c:	02f12223          	sw	a5,36(sp)
  800a70:	03012423          	sw	a6,40(sp)
  800a74:	03112623          	sw	a7,44(sp)
  800a78:	00612623          	sw	t1,12(sp)
  800a7c:	a91ff0ef          	jal	ra,80050c <vprintfmt>
  800a80:	01c12083          	lw	ra,28(sp)
  800a84:	03010113          	addi	sp,sp,48
  800a88:	00008067          	ret

00800a8c <rand>:
  800a8c:	00001597          	auipc	a1,0x1
  800a90:	57458593          	addi	a1,a1,1396 # 802000 <next>
  800a94:	0005a683          	lw	a3,0(a1)
  800a98:	deece637          	lui	a2,0xdeece
  800a9c:	66d60613          	addi	a2,a2,1645 # deece66d <sbi_remote_fence_i+0xdeeced7d>
  800aa0:	02c687b3          	mul	a5,a3,a2
  800aa4:	0045a703          	lw	a4,4(a1)
  800aa8:	00b78813          	addi	a6,a5,11
  800aac:	00f837b3          	sltu	a5,a6,a5
  800ab0:	00c85513          	srli	a0,a6,0xc
  800ab4:	0105a023          	sw	a6,0(a1)
  800ab8:	00500813          	li	a6,5
  800abc:	03068833          	mul	a6,a3,a6
  800ac0:	02c70733          	mul	a4,a4,a2
  800ac4:	02c6b6b3          	mulhu	a3,a3,a2
  800ac8:	01070733          	add	a4,a4,a6
  800acc:	00d70733          	add	a4,a4,a3
  800ad0:	00e787b3          	add	a5,a5,a4
  800ad4:	01079793          	slli	a5,a5,0x10
  800ad8:	0107d793          	srli	a5,a5,0x10
  800adc:	01479713          	slli	a4,a5,0x14
  800ae0:	00a76533          	or	a0,a4,a0
  800ae4:	80000737          	lui	a4,0x80000
  800ae8:	fff74713          	not	a4,a4
  800aec:	02e57533          	remu	a0,a0,a4
  800af0:	00f5a223          	sw	a5,4(a1)
  800af4:	00150513          	addi	a0,a0,1
  800af8:	00008067          	ret

00800afc <srand>:
  800afc:	00001797          	auipc	a5,0x1
  800b00:	50478793          	addi	a5,a5,1284 # 802000 <next>
  800b04:	00a7a023          	sw	a0,0(a5)
  800b08:	0007a223          	sw	zero,4(a5)
  800b0c:	00008067          	ret

00800b10 <work>:
  800b10:	fe010113          	addi	sp,sp,-32
  800b14:	01212823          	sw	s2,16(sp)
  800b18:	01312623          	sw	s3,12(sp)
  800b1c:	00001917          	auipc	s2,0x1
  800b20:	4ec90913          	addi	s2,s2,1260 # 802008 <mata>
  800b24:	00001997          	auipc	s3,0x1
  800b28:	67498993          	addi	s3,s3,1652 # 802198 <matb>
  800b2c:	00812c23          	sw	s0,24(sp)
  800b30:	00912a23          	sw	s1,20(sp)
  800b34:	00112e23          	sw	ra,28(sp)
  800b38:	00050493          	mv	s1,a0
  800b3c:	00001417          	auipc	s0,0x1
  800b40:	7ec40413          	addi	s0,s0,2028 # 802328 <matc>
  800b44:	00090593          	mv	a1,s2
  800b48:	00098793          	mv	a5,s3
  800b4c:	00100693          	li	a3,1
  800b50:	02878613          	addi	a2,a5,40
  800b54:	00058713          	mv	a4,a1
  800b58:	00d7a023          	sw	a3,0(a5)
  800b5c:	00d72023          	sw	a3,0(a4) # 80000000 <sbi_remote_fence_i+0x80000710>
  800b60:	00478793          	addi	a5,a5,4
  800b64:	00470713          	addi	a4,a4,4
  800b68:	fec798e3          	bne	a5,a2,800b58 <work+0x48>
  800b6c:	02858593          	addi	a1,a1,40
  800b70:	fef410e3          	bne	s0,a5,800b50 <work+0x40>
  800b74:	e84ff0ef          	jal	ra,8001f8 <yield>
  800b78:	e88ff0ef          	jal	ra,800200 <getpid>
  800b7c:	00048613          	mv	a2,s1
  800b80:	00050593          	mv	a1,a0
  800b84:	00000517          	auipc	a0,0x0
  800b88:	67050513          	addi	a0,a0,1648 # 8011f4 <error_string+0x284>
  800b8c:	f00ff0ef          	jal	ra,80028c <cprintf>
  800b90:	fff00293          	li	t0,-1
  800b94:	fff48493          	addi	s1,s1,-1
  800b98:	00001f97          	auipc	t6,0x1
  800b9c:	600f8f93          	addi	t6,t6,1536 # 802198 <matb>
  800ba0:	00001e17          	auipc	t3,0x1
  800ba4:	7b0e0e13          	addi	t3,t3,1968 # 802350 <matc+0x28>
  800ba8:	00002f17          	auipc	t5,0x2
  800bac:	910f0f13          	addi	t5,t5,-1776 # 8024b8 <matc+0x190>
  800bb0:	0a548263          	beq	s1,t0,800c54 <work+0x144>
  800bb4:	00001817          	auipc	a6,0x1
  800bb8:	77480813          	addi	a6,a6,1908 # 802328 <matc>
  800bbc:	00080e93          	mv	t4,a6
  800bc0:	00090313          	mv	t1,s2
  800bc4:	00040513          	mv	a0,s0
  800bc8:	000e8893          	mv	a7,t4
  800bcc:	e7050793          	addi	a5,a0,-400
  800bd0:	00030693          	mv	a3,t1
  800bd4:	00000613          	li	a2,0
  800bd8:	0006a703          	lw	a4,0(a3)
  800bdc:	0007a583          	lw	a1,0(a5)
  800be0:	02878793          	addi	a5,a5,40
  800be4:	00468693          	addi	a3,a3,4
  800be8:	02b70733          	mul	a4,a4,a1
  800bec:	00e60633          	add	a2,a2,a4
  800bf0:	fea794e3          	bne	a5,a0,800bd8 <work+0xc8>
  800bf4:	00c8a023          	sw	a2,0(a7)
  800bf8:	00478513          	addi	a0,a5,4
  800bfc:	00488893          	addi	a7,a7,4
  800c00:	fcae16e3          	bne	t3,a0,800bcc <work+0xbc>
  800c04:	02830313          	addi	t1,t1,40
  800c08:	028e8e93          	addi	t4,t4,40
  800c0c:	fbf31ce3          	bne	t1,t6,800bc4 <work+0xb4>
  800c10:	00090513          	mv	a0,s2
  800c14:	00098593          	mv	a1,s3
  800c18:	02880613          	addi	a2,a6,40
  800c1c:	00050713          	mv	a4,a0
  800c20:	00058793          	mv	a5,a1
  800c24:	00082683          	lw	a3,0(a6)
  800c28:	00478793          	addi	a5,a5,4
  800c2c:	00480813          	addi	a6,a6,4
  800c30:	00d72023          	sw	a3,0(a4)
  800c34:	fed7ae23          	sw	a3,-4(a5)
  800c38:	00470713          	addi	a4,a4,4
  800c3c:	fec814e3          	bne	a6,a2,800c24 <work+0x114>
  800c40:	02858593          	addi	a1,a1,40
  800c44:	02850513          	addi	a0,a0,40
  800c48:	fd0f18e3          	bne	t5,a6,800c18 <work+0x108>
  800c4c:	fff48493          	addi	s1,s1,-1
  800c50:	f65492e3          	bne	s1,t0,800bb4 <work+0xa4>
  800c54:	dacff0ef          	jal	ra,800200 <getpid>
  800c58:	00050593          	mv	a1,a0
  800c5c:	00000517          	auipc	a0,0x0
  800c60:	5b850513          	addi	a0,a0,1464 # 801214 <error_string+0x2a4>
  800c64:	e28ff0ef          	jal	ra,80028c <cprintf>
  800c68:	00000513          	li	a0,0
  800c6c:	d60ff0ef          	jal	ra,8001cc <exit>

00800c70 <main>:
  800c70:	f9010113          	addi	sp,sp,-112
  800c74:	05400613          	li	a2,84
  800c78:	00000593          	li	a1,0
  800c7c:	00c10513          	addi	a0,sp,12
  800c80:	06812423          	sw	s0,104(sp)
  800c84:	06912223          	sw	s1,100(sp)
  800c88:	07212023          	sw	s2,96(sp)
  800c8c:	06112623          	sw	ra,108(sp)
  800c90:	00c10493          	addi	s1,sp,12
  800c94:	f9cff0ef          	jal	ra,800430 <memset>
  800c98:	00000413          	li	s0,0
  800c9c:	01500913          	li	s2,21
  800ca0:	d48ff0ef          	jal	ra,8001e8 <fork>
  800ca4:	00a4a023          	sw	a0,0(s1)
  800ca8:	0a050063          	beqz	a0,800d48 <main+0xd8>
  800cac:	06054063          	bltz	a0,800d0c <main+0x9c>
  800cb0:	00140413          	addi	s0,s0,1
  800cb4:	00448493          	addi	s1,s1,4
  800cb8:	ff2414e3          	bne	s0,s2,800ca0 <main+0x30>
  800cbc:	00000517          	auipc	a0,0x0
  800cc0:	4f050513          	addi	a0,a0,1264 # 8011ac <error_string+0x23c>
  800cc4:	dc8ff0ef          	jal	ra,80028c <cprintf>
  800cc8:	d24ff0ef          	jal	ra,8001ec <wait>
  800ccc:	02051a63          	bnez	a0,800d00 <main+0x90>
  800cd0:	fff40413          	addi	s0,s0,-1
  800cd4:	fe041ae3          	bnez	s0,800cc8 <main+0x58>
  800cd8:	00000517          	auipc	a0,0x0
  800cdc:	4f050513          	addi	a0,a0,1264 # 8011c8 <error_string+0x258>
  800ce0:	dacff0ef          	jal	ra,80028c <cprintf>
  800ce4:	06c12083          	lw	ra,108(sp)
  800ce8:	00000513          	li	a0,0
  800cec:	06812403          	lw	s0,104(sp)
  800cf0:	06412483          	lw	s1,100(sp)
  800cf4:	06012903          	lw	s2,96(sp)
  800cf8:	07010113          	addi	sp,sp,112
  800cfc:	00008067          	ret
  800d00:	00000517          	auipc	a0,0x0
  800d04:	4b850513          	addi	a0,a0,1208 # 8011b8 <error_string+0x248>
  800d08:	d84ff0ef          	jal	ra,80028c <cprintf>
  800d0c:	00000413          	li	s0,0
  800d10:	05400493          	li	s1,84
  800d14:	00c10793          	addi	a5,sp,12
  800d18:	008787b3          	add	a5,a5,s0
  800d1c:	0007a503          	lw	a0,0(a5)
  800d20:	00a05463          	blez	a0,800d28 <main+0xb8>
  800d24:	cd8ff0ef          	jal	ra,8001fc <kill>
  800d28:	00440413          	addi	s0,s0,4
  800d2c:	fe9414e3          	bne	s0,s1,800d14 <main+0xa4>
  800d30:	00000617          	auipc	a2,0x0
  800d34:	4a860613          	addi	a2,a2,1192 # 8011d8 <error_string+0x268>
  800d38:	05200593          	li	a1,82
  800d3c:	00000517          	auipc	a0,0x0
  800d40:	4a850513          	addi	a0,a0,1192 # 8011e4 <error_string+0x274>
  800d44:	adcff0ef          	jal	ra,800020 <__panic>
  800d48:	02840533          	mul	a0,s0,s0
  800d4c:	db1ff0ef          	jal	ra,800afc <srand>
  800d50:	d3dff0ef          	jal	ra,800a8c <rand>
  800d54:	01500793          	li	a5,21
  800d58:	02f57533          	remu	a0,a0,a5
  800d5c:	02a50533          	mul	a0,a0,a0
  800d60:	00a50793          	addi	a5,a0,10
  800d64:	06400513          	li	a0,100
  800d68:	02a78533          	mul	a0,a5,a0
  800d6c:	da5ff0ef          	jal	ra,800b10 <work>
