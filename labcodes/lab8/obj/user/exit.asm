
obj/__user_exit.out:     file format elf32-littleriscv


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
  800040:	b5c50513          	addi	a0,a0,-1188 # 800b98 <main+0x140>
  800044:	00112e23          	sw	ra,28(sp)
  800048:	02d12623          	sw	a3,44(sp)
  80004c:	02e12823          	sw	a4,48(sp)
  800050:	03012c23          	sw	a6,56(sp)
  800054:	03112e23          	sw	a7,60(sp)
  800058:	00f12623          	sw	a5,12(sp)
  80005c:	218000ef          	jal	ra,800274 <cprintf>
  800060:	00c12583          	lw	a1,12(sp)
  800064:	00040513          	mv	a0,s0
  800068:	1d0000ef          	jal	ra,800238 <vcprintf>
  80006c:	00001517          	auipc	a0,0x1
  800070:	b9850513          	addi	a0,a0,-1128 # 800c04 <main+0x1ac>
  800074:	200000ef          	jal	ra,800274 <cprintf>
  800078:	ff600513          	li	a0,-10
  80007c:	13c000ef          	jal	ra,8001b8 <exit>

00800080 <__warn>:
  800080:	fc010113          	addi	sp,sp,-64
  800084:	00812c23          	sw	s0,24(sp)
  800088:	02f12a23          	sw	a5,52(sp)
  80008c:	00060413          	mv	s0,a2
  800090:	02c10793          	addi	a5,sp,44
  800094:	00058613          	mv	a2,a1
  800098:	00050593          	mv	a1,a0
  80009c:	00001517          	auipc	a0,0x1
  8000a0:	b1850513          	addi	a0,a0,-1256 # 800bb4 <main+0x15c>
  8000a4:	00112e23          	sw	ra,28(sp)
  8000a8:	02d12623          	sw	a3,44(sp)
  8000ac:	02e12823          	sw	a4,48(sp)
  8000b0:	03012c23          	sw	a6,56(sp)
  8000b4:	03112e23          	sw	a7,60(sp)
  8000b8:	00f12623          	sw	a5,12(sp)
  8000bc:	1b8000ef          	jal	ra,800274 <cprintf>
  8000c0:	00c12583          	lw	a1,12(sp)
  8000c4:	00040513          	mv	a0,s0
  8000c8:	170000ef          	jal	ra,800238 <vcprintf>
  8000cc:	00001517          	auipc	a0,0x1
  8000d0:	b3850513          	addi	a0,a0,-1224 # 800c04 <main+0x1ac>
  8000d4:	1a0000ef          	jal	ra,800274 <cprintf>
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

00800180 <sys_putc>:
  800180:	00050593          	mv	a1,a0
  800184:	01e00513          	li	a0,30
  800188:	f61ff06f          	j	8000e8 <syscall>

0080018c <sys_open>:
  80018c:	00058613          	mv	a2,a1
  800190:	00050593          	mv	a1,a0
  800194:	06400513          	li	a0,100
  800198:	f51ff06f          	j	8000e8 <syscall>

0080019c <sys_close>:
  80019c:	00050593          	mv	a1,a0
  8001a0:	06500513          	li	a0,101
  8001a4:	f45ff06f          	j	8000e8 <syscall>

008001a8 <sys_dup>:
  8001a8:	00058613          	mv	a2,a1
  8001ac:	00050593          	mv	a1,a0
  8001b0:	08200513          	li	a0,130
  8001b4:	f35ff06f          	j	8000e8 <syscall>

008001b8 <exit>:
  8001b8:	ff010113          	addi	sp,sp,-16
  8001bc:	00112623          	sw	ra,12(sp)
  8001c0:	f95ff0ef          	jal	ra,800154 <sys_exit>
  8001c4:	00001517          	auipc	a0,0x1
  8001c8:	a0c50513          	addi	a0,a0,-1524 # 800bd0 <main+0x178>
  8001cc:	0a8000ef          	jal	ra,800274 <cprintf>
  8001d0:	0000006f          	j	8001d0 <exit+0x18>

008001d4 <fork>:
  8001d4:	f8dff06f          	j	800160 <sys_fork>

008001d8 <wait>:
  8001d8:	00000593          	li	a1,0
  8001dc:	00000513          	li	a0,0
  8001e0:	f89ff06f          	j	800168 <sys_wait>

008001e4 <waitpid>:
  8001e4:	f85ff06f          	j	800168 <sys_wait>

008001e8 <yield>:
  8001e8:	f91ff06f          	j	800178 <sys_yield>

008001ec <_start>:
  8001ec:	00012503          	lw	a0,0(sp)
  8001f0:	00410593          	addi	a1,sp,4
  8001f4:	14c000ef          	jal	ra,800340 <umain>
  8001f8:	0000006f          	j	8001f8 <_start+0xc>

008001fc <open>:
  8001fc:	f91ff06f          	j	80018c <sys_open>

00800200 <close>:
  800200:	f9dff06f          	j	80019c <sys_close>

00800204 <dup2>:
  800204:	fa5ff06f          	j	8001a8 <sys_dup>

00800208 <cputch>:
  800208:	ff010113          	addi	sp,sp,-16
  80020c:	00112623          	sw	ra,12(sp)
  800210:	00812423          	sw	s0,8(sp)
  800214:	00058413          	mv	s0,a1
  800218:	f69ff0ef          	jal	ra,800180 <sys_putc>
  80021c:	00042783          	lw	a5,0(s0)
  800220:	00c12083          	lw	ra,12(sp)
  800224:	00178793          	addi	a5,a5,1
  800228:	00f42023          	sw	a5,0(s0)
  80022c:	00812403          	lw	s0,8(sp)
  800230:	01010113          	addi	sp,sp,16
  800234:	00008067          	ret

00800238 <vcprintf>:
  800238:	fe010113          	addi	sp,sp,-32
  80023c:	00058713          	mv	a4,a1
  800240:	ffff75b7          	lui	a1,0xffff7
  800244:	00050693          	mv	a3,a0
  800248:	00c10613          	addi	a2,sp,12
  80024c:	00000517          	auipc	a0,0x0
  800250:	fbc50513          	addi	a0,a0,-68 # 800208 <cputch>
  800254:	ad958593          	addi	a1,a1,-1319 # ffff6ad9 <sbi_remote_fence_i+0xffff71e9>
  800258:	00112e23          	sw	ra,28(sp)
  80025c:	00012623          	sw	zero,12(sp)
  800260:	278000ef          	jal	ra,8004d8 <vprintfmt>
  800264:	01c12083          	lw	ra,28(sp)
  800268:	00c12503          	lw	a0,12(sp)
  80026c:	02010113          	addi	sp,sp,32
  800270:	00008067          	ret

00800274 <cprintf>:
  800274:	fc010113          	addi	sp,sp,-64
  800278:	02410313          	addi	t1,sp,36
  80027c:	02b12223          	sw	a1,36(sp)
  800280:	ffff75b7          	lui	a1,0xffff7
  800284:	02c12423          	sw	a2,40(sp)
  800288:	02d12623          	sw	a3,44(sp)
  80028c:	02e12823          	sw	a4,48(sp)
  800290:	00050693          	mv	a3,a0
  800294:	00c10613          	addi	a2,sp,12
  800298:	00000517          	auipc	a0,0x0
  80029c:	f7050513          	addi	a0,a0,-144 # 800208 <cputch>
  8002a0:	00030713          	mv	a4,t1
  8002a4:	ad958593          	addi	a1,a1,-1319 # ffff6ad9 <sbi_remote_fence_i+0xffff71e9>
  8002a8:	00112e23          	sw	ra,28(sp)
  8002ac:	02f12a23          	sw	a5,52(sp)
  8002b0:	03012c23          	sw	a6,56(sp)
  8002b4:	03112e23          	sw	a7,60(sp)
  8002b8:	00612423          	sw	t1,8(sp)
  8002bc:	00012623          	sw	zero,12(sp)
  8002c0:	218000ef          	jal	ra,8004d8 <vprintfmt>
  8002c4:	01c12083          	lw	ra,28(sp)
  8002c8:	00c12503          	lw	a0,12(sp)
  8002cc:	04010113          	addi	sp,sp,64
  8002d0:	00008067          	ret

008002d4 <initfd>:
  8002d4:	ff010113          	addi	sp,sp,-16
  8002d8:	00058793          	mv	a5,a1
  8002dc:	00912223          	sw	s1,4(sp)
  8002e0:	00060593          	mv	a1,a2
  8002e4:	00050493          	mv	s1,a0
  8002e8:	00078513          	mv	a0,a5
  8002ec:	00812423          	sw	s0,8(sp)
  8002f0:	00112623          	sw	ra,12(sp)
  8002f4:	f09ff0ef          	jal	ra,8001fc <open>
  8002f8:	00050413          	mv	s0,a0
  8002fc:	02054663          	bltz	a0,800328 <initfd+0x54>
  800300:	02950463          	beq	a0,s1,800328 <initfd+0x54>
  800304:	00048513          	mv	a0,s1
  800308:	ef9ff0ef          	jal	ra,800200 <close>
  80030c:	00048593          	mv	a1,s1
  800310:	00040513          	mv	a0,s0
  800314:	ef1ff0ef          	jal	ra,800204 <dup2>
  800318:	00050493          	mv	s1,a0
  80031c:	00040513          	mv	a0,s0
  800320:	ee1ff0ef          	jal	ra,800200 <close>
  800324:	00048413          	mv	s0,s1
  800328:	00c12083          	lw	ra,12(sp)
  80032c:	00040513          	mv	a0,s0
  800330:	00412483          	lw	s1,4(sp)
  800334:	00812403          	lw	s0,8(sp)
  800338:	01010113          	addi	sp,sp,16
  80033c:	00008067          	ret

00800340 <umain>:
  800340:	ff010113          	addi	sp,sp,-16
  800344:	00812423          	sw	s0,8(sp)
  800348:	00912223          	sw	s1,4(sp)
  80034c:	00050413          	mv	s0,a0
  800350:	00058493          	mv	s1,a1
  800354:	00000613          	li	a2,0
  800358:	00001597          	auipc	a1,0x1
  80035c:	88c58593          	addi	a1,a1,-1908 # 800be4 <main+0x18c>
  800360:	00000513          	li	a0,0
  800364:	00112623          	sw	ra,12(sp)
  800368:	f6dff0ef          	jal	ra,8002d4 <initfd>
  80036c:	02054663          	bltz	a0,800398 <umain+0x58>
  800370:	00100613          	li	a2,1
  800374:	00001597          	auipc	a1,0x1
  800378:	8a858593          	addi	a1,a1,-1880 # 800c1c <main+0x1c4>
  80037c:	00060513          	mv	a0,a2
  800380:	f55ff0ef          	jal	ra,8002d4 <initfd>
  800384:	02054a63          	bltz	a0,8003b8 <umain+0x78>
  800388:	00048593          	mv	a1,s1
  80038c:	00040513          	mv	a0,s0
  800390:	6c8000ef          	jal	ra,800a58 <main>
  800394:	e25ff0ef          	jal	ra,8001b8 <exit>
  800398:	00050693          	mv	a3,a0
  80039c:	00001617          	auipc	a2,0x1
  8003a0:	85060613          	addi	a2,a2,-1968 # 800bec <main+0x194>
  8003a4:	01a00593          	li	a1,26
  8003a8:	00001517          	auipc	a0,0x1
  8003ac:	86050513          	addi	a0,a0,-1952 # 800c08 <main+0x1b0>
  8003b0:	cd1ff0ef          	jal	ra,800080 <__warn>
  8003b4:	fbdff06f          	j	800370 <umain+0x30>
  8003b8:	00050693          	mv	a3,a0
  8003bc:	00001617          	auipc	a2,0x1
  8003c0:	86860613          	addi	a2,a2,-1944 # 800c24 <main+0x1cc>
  8003c4:	01d00593          	li	a1,29
  8003c8:	00001517          	auipc	a0,0x1
  8003cc:	84050513          	addi	a0,a0,-1984 # 800c08 <main+0x1b0>
  8003d0:	cb1ff0ef          	jal	ra,800080 <__warn>
  8003d4:	fb5ff06f          	j	800388 <umain+0x48>

008003d8 <strnlen>:
  8003d8:	00050693          	mv	a3,a0
  8003dc:	02058a63          	beqz	a1,800410 <strnlen+0x38>
  8003e0:	00054703          	lbu	a4,0(a0)
  8003e4:	00150793          	addi	a5,a0,1
  8003e8:	02070463          	beqz	a4,800410 <strnlen+0x38>
  8003ec:	00b505b3          	add	a1,a0,a1
  8003f0:	0100006f          	j	800400 <strnlen+0x28>
  8003f4:	00178793          	addi	a5,a5,1
  8003f8:	fff7c703          	lbu	a4,-1(a5)
  8003fc:	00070863          	beqz	a4,80040c <strnlen+0x34>
  800400:	40d78533          	sub	a0,a5,a3
  800404:	feb798e3          	bne	a5,a1,8003f4 <strnlen+0x1c>
  800408:	00008067          	ret
  80040c:	00008067          	ret
  800410:	00000513          	li	a0,0
  800414:	00008067          	ret

00800418 <printnum>:
  800418:	fd010113          	addi	sp,sp,-48
  80041c:	02912223          	sw	s1,36(sp)
  800420:	03212023          	sw	s2,32(sp)
  800424:	01312e23          	sw	s3,28(sp)
  800428:	01412c23          	sw	s4,24(sp)
  80042c:	01512a23          	sw	s5,20(sp)
  800430:	02112623          	sw	ra,44(sp)
  800434:	02812423          	sw	s0,40(sp)
  800438:	00050493          	mv	s1,a0
  80043c:	00058993          	mv	s3,a1
  800440:	00060913          	mv	s2,a2
  800444:	03012a03          	lw	s4,48(sp)
  800448:	03077ab3          	remu	s5,a4,a6
  80044c:	06079463          	bnez	a5,8004b4 <printnum+0x9c>
  800450:	07077263          	bleu	a6,a4,8004b4 <printnum+0x9c>
  800454:	fff88413          	addi	s0,a7,-1
  800458:	00805e63          	blez	s0,800474 <printnum+0x5c>
  80045c:	fff40413          	addi	s0,s0,-1
  800460:	00098613          	mv	a2,s3
  800464:	00090593          	mv	a1,s2
  800468:	000a0513          	mv	a0,s4
  80046c:	000480e7          	jalr	s1
  800470:	fe0416e3          	bnez	s0,80045c <printnum+0x44>
  800474:	00001797          	auipc	a5,0x1
  800478:	98878793          	addi	a5,a5,-1656 # 800dfc <error_string+0x64>
  80047c:	015787b3          	add	a5,a5,s5
  800480:	00098613          	mv	a2,s3
  800484:	00090593          	mv	a1,s2
  800488:	00048313          	mv	t1,s1
  80048c:	02c12083          	lw	ra,44(sp)
  800490:	02812403          	lw	s0,40(sp)
  800494:	02412483          	lw	s1,36(sp)
  800498:	02012903          	lw	s2,32(sp)
  80049c:	01c12983          	lw	s3,28(sp)
  8004a0:	01812a03          	lw	s4,24(sp)
  8004a4:	01412a83          	lw	s5,20(sp)
  8004a8:	0007c503          	lbu	a0,0(a5)
  8004ac:	03010113          	addi	sp,sp,48
  8004b0:	00030067          	jr	t1
  8004b4:	03075733          	divu	a4,a4,a6
  8004b8:	01412023          	sw	s4,0(sp)
  8004bc:	fff88893          	addi	a7,a7,-1
  8004c0:	00000793          	li	a5,0
  8004c4:	00090613          	mv	a2,s2
  8004c8:	00098593          	mv	a1,s3
  8004cc:	00048513          	mv	a0,s1
  8004d0:	f49ff0ef          	jal	ra,800418 <printnum>
  8004d4:	fa1ff06f          	j	800474 <printnum+0x5c>

008004d8 <vprintfmt>:
  8004d8:	fa010113          	addi	sp,sp,-96
  8004dc:	05212823          	sw	s2,80(sp)
  8004e0:	05312623          	sw	s3,76(sp)
  8004e4:	05412423          	sw	s4,72(sp)
  8004e8:	05512223          	sw	s5,68(sp)
  8004ec:	05612023          	sw	s6,64(sp)
  8004f0:	03712e23          	sw	s7,60(sp)
  8004f4:	03812c23          	sw	s8,56(sp)
  8004f8:	03a12823          	sw	s10,48(sp)
  8004fc:	04112e23          	sw	ra,92(sp)
  800500:	04812c23          	sw	s0,88(sp)
  800504:	04912a23          	sw	s1,84(sp)
  800508:	03912a23          	sw	s9,52(sp)
  80050c:	03b12623          	sw	s11,44(sp)
  800510:	00050a13          	mv	s4,a0
  800514:	00058993          	mv	s3,a1
  800518:	00060913          	mv	s2,a2
  80051c:	00068d13          	mv	s10,a3
  800520:	00070b13          	mv	s6,a4
  800524:	00000a97          	auipc	s5,0x0
  800528:	71ca8a93          	addi	s5,s5,1820 # 800c40 <main+0x1e8>
  80052c:	fff00b93          	li	s7,-1
  800530:	05e00c13          	li	s8,94
  800534:	000d4503          	lbu	a0,0(s10)
  800538:	02500493          	li	s1,37
  80053c:	001d0413          	addi	s0,s10,1
  800540:	02950063          	beq	a0,s1,800560 <vprintfmt+0x88>
  800544:	06050663          	beqz	a0,8005b0 <vprintfmt+0xd8>
  800548:	00098613          	mv	a2,s3
  80054c:	00090593          	mv	a1,s2
  800550:	00140413          	addi	s0,s0,1
  800554:	000a00e7          	jalr	s4
  800558:	fff44503          	lbu	a0,-1(s0)
  80055c:	fe9514e3          	bne	a0,s1,800544 <vprintfmt+0x6c>
  800560:	00044e03          	lbu	t3,0(s0)
  800564:	fff00d93          	li	s11,-1
  800568:	02000693          	li	a3,32
  80056c:	00000493          	li	s1,0
  800570:	00000593          	li	a1,0
  800574:	000d8c93          	mv	s9,s11
  800578:	05500713          	li	a4,85
  80057c:	00100313          	li	t1,1
  800580:	03000813          	li	a6,48
  800584:	00900613          	li	a2,9
  800588:	02d00513          	li	a0,45
  80058c:	fdde0793          	addi	a5,t3,-35
  800590:	0ff7f793          	andi	a5,a5,255
  800594:	00140d13          	addi	s10,s0,1
  800598:	34f76a63          	bltu	a4,a5,8008ec <vprintfmt+0x414>
  80059c:	00279793          	slli	a5,a5,0x2
  8005a0:	015787b3          	add	a5,a5,s5
  8005a4:	0007a783          	lw	a5,0(a5)
  8005a8:	015787b3          	add	a5,a5,s5
  8005ac:	00078067          	jr	a5
  8005b0:	05c12083          	lw	ra,92(sp)
  8005b4:	05812403          	lw	s0,88(sp)
  8005b8:	05412483          	lw	s1,84(sp)
  8005bc:	05012903          	lw	s2,80(sp)
  8005c0:	04c12983          	lw	s3,76(sp)
  8005c4:	04812a03          	lw	s4,72(sp)
  8005c8:	04412a83          	lw	s5,68(sp)
  8005cc:	04012b03          	lw	s6,64(sp)
  8005d0:	03c12b83          	lw	s7,60(sp)
  8005d4:	03812c03          	lw	s8,56(sp)
  8005d8:	03412c83          	lw	s9,52(sp)
  8005dc:	03012d03          	lw	s10,48(sp)
  8005e0:	02c12d83          	lw	s11,44(sp)
  8005e4:	06010113          	addi	sp,sp,96
  8005e8:	00008067          	ret
  8005ec:	00100793          	li	a5,1
  8005f0:	36b7c863          	blt	a5,a1,800960 <vprintfmt+0x488>
  8005f4:	000b2703          	lw	a4,0(s6)
  8005f8:	00000793          	li	a5,0
  8005fc:	004b0b13          	addi	s6,s6,4
  800600:	01000813          	li	a6,16
  800604:	00d12023          	sw	a3,0(sp)
  800608:	000c8893          	mv	a7,s9
  80060c:	00090613          	mv	a2,s2
  800610:	00098593          	mv	a1,s3
  800614:	000a0513          	mv	a0,s4
  800618:	e01ff0ef          	jal	ra,800418 <printnum>
  80061c:	f19ff06f          	j	800534 <vprintfmt+0x5c>
  800620:	00144e03          	lbu	t3,1(s0)
  800624:	00030493          	mv	s1,t1
  800628:	000d0413          	mv	s0,s10
  80062c:	f61ff06f          	j	80058c <vprintfmt+0xb4>
  800630:	000b2503          	lw	a0,0(s6)
  800634:	00098613          	mv	a2,s3
  800638:	00090593          	mv	a1,s2
  80063c:	004b0b13          	addi	s6,s6,4
  800640:	000a00e7          	jalr	s4
  800644:	ef1ff06f          	j	800534 <vprintfmt+0x5c>
  800648:	00100793          	li	a5,1
  80064c:	32b7c863          	blt	a5,a1,80097c <vprintfmt+0x4a4>
  800650:	000b2703          	lw	a4,0(s6)
  800654:	004b0b13          	addi	s6,s6,4
  800658:	41f75793          	srai	a5,a4,0x1f
  80065c:	00a00813          	li	a6,10
  800660:	fa07d2e3          	bgez	a5,800604 <vprintfmt+0x12c>
  800664:	00098613          	mv	a2,s3
  800668:	00090593          	mv	a1,s2
  80066c:	02d00513          	li	a0,45
  800670:	00f12e23          	sw	a5,28(sp)
  800674:	00e12c23          	sw	a4,24(sp)
  800678:	01012a23          	sw	a6,20(sp)
  80067c:	00d12823          	sw	a3,16(sp)
  800680:	000a00e7          	jalr	s4
  800684:	01812703          	lw	a4,24(sp)
  800688:	01c12783          	lw	a5,28(sp)
  80068c:	01012683          	lw	a3,16(sp)
  800690:	40e00733          	neg	a4,a4
  800694:	00e03633          	snez	a2,a4
  800698:	40f007b3          	neg	a5,a5
  80069c:	40c787b3          	sub	a5,a5,a2
  8006a0:	01412803          	lw	a6,20(sp)
  8006a4:	f61ff06f          	j	800604 <vprintfmt+0x12c>
  8006a8:	000b2783          	lw	a5,0(s6)
  8006ac:	01800693          	li	a3,24
  8006b0:	004b0b13          	addi	s6,s6,4
  8006b4:	41f7d713          	srai	a4,a5,0x1f
  8006b8:	00f747b3          	xor	a5,a4,a5
  8006bc:	40e787b3          	sub	a5,a5,a4
  8006c0:	2cf6ca63          	blt	a3,a5,800994 <vprintfmt+0x4bc>
  8006c4:	00279693          	slli	a3,a5,0x2
  8006c8:	00000717          	auipc	a4,0x0
  8006cc:	6d070713          	addi	a4,a4,1744 # 800d98 <error_string>
  8006d0:	00d70733          	add	a4,a4,a3
  8006d4:	00072703          	lw	a4,0(a4)
  8006d8:	2a070e63          	beqz	a4,800994 <vprintfmt+0x4bc>
  8006dc:	00001697          	auipc	a3,0x1
  8006e0:	8f468693          	addi	a3,a3,-1804 # 800fd0 <error_string+0x238>
  8006e4:	00090613          	mv	a2,s2
  8006e8:	00098593          	mv	a1,s3
  8006ec:	000a0513          	mv	a0,s4
  8006f0:	334000ef          	jal	ra,800a24 <printfmt>
  8006f4:	e41ff06f          	j	800534 <vprintfmt+0x5c>
  8006f8:	00144e03          	lbu	t3,1(s0)
  8006fc:	00158593          	addi	a1,a1,1
  800700:	000d0413          	mv	s0,s10
  800704:	e89ff06f          	j	80058c <vprintfmt+0xb4>
  800708:	00100793          	li	a5,1
  80070c:	20b7ce63          	blt	a5,a1,800928 <vprintfmt+0x450>
  800710:	000b2703          	lw	a4,0(s6)
  800714:	00000793          	li	a5,0
  800718:	004b0b13          	addi	s6,s6,4
  80071c:	00800813          	li	a6,8
  800720:	ee5ff06f          	j	800604 <vprintfmt+0x12c>
  800724:	03000513          	li	a0,48
  800728:	00098613          	mv	a2,s3
  80072c:	00090593          	mv	a1,s2
  800730:	00d12823          	sw	a3,16(sp)
  800734:	000a00e7          	jalr	s4
  800738:	00098613          	mv	a2,s3
  80073c:	00090593          	mv	a1,s2
  800740:	07800513          	li	a0,120
  800744:	000a00e7          	jalr	s4
  800748:	000b2703          	lw	a4,0(s6)
  80074c:	00000793          	li	a5,0
  800750:	01000813          	li	a6,16
  800754:	004b0b13          	addi	s6,s6,4
  800758:	01012683          	lw	a3,16(sp)
  80075c:	ea9ff06f          	j	800604 <vprintfmt+0x12c>
  800760:	000b2403          	lw	s0,0(s6)
  800764:	004b0793          	addi	a5,s6,4
  800768:	00f12a23          	sw	a5,20(sp)
  80076c:	26040463          	beqz	s0,8009d4 <vprintfmt+0x4fc>
  800770:	05905463          	blez	s9,8007b8 <vprintfmt+0x2e0>
  800774:	02d00793          	li	a5,45
  800778:	22f68e63          	beq	a3,a5,8009b4 <vprintfmt+0x4dc>
  80077c:	000d8593          	mv	a1,s11
  800780:	00040513          	mv	a0,s0
  800784:	00d12823          	sw	a3,16(sp)
  800788:	c51ff0ef          	jal	ra,8003d8 <strnlen>
  80078c:	40ac8cb3          	sub	s9,s9,a0
  800790:	03905463          	blez	s9,8007b8 <vprintfmt+0x2e0>
  800794:	01012683          	lw	a3,16(sp)
  800798:	00068513          	mv	a0,a3
  80079c:	00098613          	mv	a2,s3
  8007a0:	00090593          	mv	a1,s2
  8007a4:	00d12823          	sw	a3,16(sp)
  8007a8:	fffc8c93          	addi	s9,s9,-1
  8007ac:	000a00e7          	jalr	s4
  8007b0:	01012683          	lw	a3,16(sp)
  8007b4:	fe0c92e3          	bnez	s9,800798 <vprintfmt+0x2c0>
  8007b8:	00044783          	lbu	a5,0(s0)
  8007bc:	00140b13          	addi	s6,s0,1
  8007c0:	00078513          	mv	a0,a5
  8007c4:	06078063          	beqz	a5,800824 <vprintfmt+0x34c>
  8007c8:	03f00413          	li	s0,63
  8007cc:	000dc663          	bltz	s11,8007d8 <vprintfmt+0x300>
  8007d0:	fffd8d93          	addi	s11,s11,-1
  8007d4:	037d8863          	beq	s11,s7,800804 <vprintfmt+0x32c>
  8007d8:	00098613          	mv	a2,s3
  8007dc:	00090593          	mv	a1,s2
  8007e0:	00048663          	beqz	s1,8007ec <vprintfmt+0x314>
  8007e4:	fe078793          	addi	a5,a5,-32
  8007e8:	12fc6a63          	bltu	s8,a5,80091c <vprintfmt+0x444>
  8007ec:	000a00e7          	jalr	s4
  8007f0:	001b0b13          	addi	s6,s6,1
  8007f4:	fffb4783          	lbu	a5,-1(s6)
  8007f8:	fffc8c93          	addi	s9,s9,-1
  8007fc:	00078513          	mv	a0,a5
  800800:	fc0796e3          	bnez	a5,8007cc <vprintfmt+0x2f4>
  800804:	03905063          	blez	s9,800824 <vprintfmt+0x34c>
  800808:	02000413          	li	s0,32
  80080c:	fffc8c93          	addi	s9,s9,-1
  800810:	00098613          	mv	a2,s3
  800814:	00090593          	mv	a1,s2
  800818:	00040513          	mv	a0,s0
  80081c:	000a00e7          	jalr	s4
  800820:	fe0c96e3          	bnez	s9,80080c <vprintfmt+0x334>
  800824:	01412b03          	lw	s6,20(sp)
  800828:	d0dff06f          	j	800534 <vprintfmt+0x5c>
  80082c:	00100793          	li	a5,1
  800830:	10b7ca63          	blt	a5,a1,800944 <vprintfmt+0x46c>
  800834:	000b2703          	lw	a4,0(s6)
  800838:	00000793          	li	a5,0
  80083c:	004b0b13          	addi	s6,s6,4
  800840:	00a00813          	li	a6,10
  800844:	dc1ff06f          	j	800604 <vprintfmt+0x12c>
  800848:	00144e03          	lbu	t3,1(s0)
  80084c:	00050693          	mv	a3,a0
  800850:	000d0413          	mv	s0,s10
  800854:	d39ff06f          	j	80058c <vprintfmt+0xb4>
  800858:	00098613          	mv	a2,s3
  80085c:	00090593          	mv	a1,s2
  800860:	02500513          	li	a0,37
  800864:	000a00e7          	jalr	s4
  800868:	ccdff06f          	j	800534 <vprintfmt+0x5c>
  80086c:	000b2d83          	lw	s11,0(s6)
  800870:	00144e03          	lbu	t3,1(s0)
  800874:	004b0b13          	addi	s6,s6,4
  800878:	000d0413          	mv	s0,s10
  80087c:	d00cd8e3          	bgez	s9,80058c <vprintfmt+0xb4>
  800880:	000d8c93          	mv	s9,s11
  800884:	fff00d93          	li	s11,-1
  800888:	d05ff06f          	j	80058c <vprintfmt+0xb4>
  80088c:	00144e03          	lbu	t3,1(s0)
  800890:	00080693          	mv	a3,a6
  800894:	000d0413          	mv	s0,s10
  800898:	cf5ff06f          	j	80058c <vprintfmt+0xb4>
  80089c:	00144e83          	lbu	t4,1(s0)
  8008a0:	fd0e0d93          	addi	s11,t3,-48
  8008a4:	fd0e8793          	addi	a5,t4,-48
  8008a8:	14f66c63          	bltu	a2,a5,800a00 <vprintfmt+0x528>
  8008ac:	000d0413          	mv	s0,s10
  8008b0:	002d9793          	slli	a5,s11,0x2
  8008b4:	01b78db3          	add	s11,a5,s11
  8008b8:	00140413          	addi	s0,s0,1
  8008bc:	001d9d93          	slli	s11,s11,0x1
  8008c0:	01dd8db3          	add	s11,s11,t4
  8008c4:	00044e83          	lbu	t4,0(s0)
  8008c8:	fd0d8d93          	addi	s11,s11,-48
  8008cc:	fd0e8793          	addi	a5,t4,-48
  8008d0:	fef670e3          	bleu	a5,a2,8008b0 <vprintfmt+0x3d8>
  8008d4:	000e8e13          	mv	t3,t4
  8008d8:	fa5ff06f          	j	80087c <vprintfmt+0x3a4>
  8008dc:	0e0cc863          	bltz	s9,8009cc <vprintfmt+0x4f4>
  8008e0:	00144e03          	lbu	t3,1(s0)
  8008e4:	000d0413          	mv	s0,s10
  8008e8:	ca5ff06f          	j	80058c <vprintfmt+0xb4>
  8008ec:	00098613          	mv	a2,s3
  8008f0:	00090593          	mv	a1,s2
  8008f4:	02500513          	li	a0,37
  8008f8:	000a00e7          	jalr	s4
  8008fc:	fff44783          	lbu	a5,-1(s0)
  800900:	02500713          	li	a4,37
  800904:	00040d13          	mv	s10,s0
  800908:	c2e786e3          	beq	a5,a4,800534 <vprintfmt+0x5c>
  80090c:	fffd0d13          	addi	s10,s10,-1
  800910:	fffd4783          	lbu	a5,-1(s10)
  800914:	fee79ce3          	bne	a5,a4,80090c <vprintfmt+0x434>
  800918:	c1dff06f          	j	800534 <vprintfmt+0x5c>
  80091c:	00040513          	mv	a0,s0
  800920:	000a00e7          	jalr	s4
  800924:	ecdff06f          	j	8007f0 <vprintfmt+0x318>
  800928:	007b0793          	addi	a5,s6,7
  80092c:	ff87f793          	andi	a5,a5,-8
  800930:	00878b13          	addi	s6,a5,8
  800934:	0007a703          	lw	a4,0(a5)
  800938:	00800813          	li	a6,8
  80093c:	0047a783          	lw	a5,4(a5)
  800940:	cc5ff06f          	j	800604 <vprintfmt+0x12c>
  800944:	007b0793          	addi	a5,s6,7
  800948:	ff87f793          	andi	a5,a5,-8
  80094c:	00878b13          	addi	s6,a5,8
  800950:	0007a703          	lw	a4,0(a5)
  800954:	00a00813          	li	a6,10
  800958:	0047a783          	lw	a5,4(a5)
  80095c:	ca9ff06f          	j	800604 <vprintfmt+0x12c>
  800960:	007b0793          	addi	a5,s6,7
  800964:	ff87f793          	andi	a5,a5,-8
  800968:	00878b13          	addi	s6,a5,8
  80096c:	0007a703          	lw	a4,0(a5)
  800970:	01000813          	li	a6,16
  800974:	0047a783          	lw	a5,4(a5)
  800978:	c8dff06f          	j	800604 <vprintfmt+0x12c>
  80097c:	007b0793          	addi	a5,s6,7
  800980:	ff87f793          	andi	a5,a5,-8
  800984:	00878b13          	addi	s6,a5,8
  800988:	0007a703          	lw	a4,0(a5)
  80098c:	0047a783          	lw	a5,4(a5)
  800990:	ccdff06f          	j	80065c <vprintfmt+0x184>
  800994:	00078713          	mv	a4,a5
  800998:	00000697          	auipc	a3,0x0
  80099c:	62c68693          	addi	a3,a3,1580 # 800fc4 <error_string+0x22c>
  8009a0:	00090613          	mv	a2,s2
  8009a4:	00098593          	mv	a1,s3
  8009a8:	000a0513          	mv	a0,s4
  8009ac:	078000ef          	jal	ra,800a24 <printfmt>
  8009b0:	b85ff06f          	j	800534 <vprintfmt+0x5c>
  8009b4:	00044783          	lbu	a5,0(s0)
  8009b8:	00140b13          	addi	s6,s0,1
  8009bc:	00078513          	mv	a0,a5
  8009c0:	e40784e3          	beqz	a5,800808 <vprintfmt+0x330>
  8009c4:	03f00413          	li	s0,63
  8009c8:	e05ff06f          	j	8007cc <vprintfmt+0x2f4>
  8009cc:	00000c93          	li	s9,0
  8009d0:	f11ff06f          	j	8008e0 <vprintfmt+0x408>
  8009d4:	03905c63          	blez	s9,800a0c <vprintfmt+0x534>
  8009d8:	02d00793          	li	a5,45
  8009dc:	00000417          	auipc	s0,0x0
  8009e0:	5e040413          	addi	s0,s0,1504 # 800fbc <error_string+0x224>
  8009e4:	d8f69ce3          	bne	a3,a5,80077c <vprintfmt+0x2a4>
  8009e8:	02800513          	li	a0,40
  8009ec:	00000b17          	auipc	s6,0x0
  8009f0:	5d1b0b13          	addi	s6,s6,1489 # 800fbd <error_string+0x225>
  8009f4:	00050793          	mv	a5,a0
  8009f8:	03f00413          	li	s0,63
  8009fc:	dd1ff06f          	j	8007cc <vprintfmt+0x2f4>
  800a00:	000e8e13          	mv	t3,t4
  800a04:	000d0413          	mv	s0,s10
  800a08:	e75ff06f          	j	80087c <vprintfmt+0x3a4>
  800a0c:	02800793          	li	a5,40
  800a10:	00078513          	mv	a0,a5
  800a14:	00000b17          	auipc	s6,0x0
  800a18:	5a9b0b13          	addi	s6,s6,1449 # 800fbd <error_string+0x225>
  800a1c:	03f00413          	li	s0,63
  800a20:	dadff06f          	j	8007cc <vprintfmt+0x2f4>

00800a24 <printfmt>:
  800a24:	fd010113          	addi	sp,sp,-48
  800a28:	02010313          	addi	t1,sp,32
  800a2c:	02e12023          	sw	a4,32(sp)
  800a30:	00030713          	mv	a4,t1
  800a34:	00112e23          	sw	ra,28(sp)
  800a38:	02f12223          	sw	a5,36(sp)
  800a3c:	03012423          	sw	a6,40(sp)
  800a40:	03112623          	sw	a7,44(sp)
  800a44:	00612623          	sw	t1,12(sp)
  800a48:	a91ff0ef          	jal	ra,8004d8 <vprintfmt>
  800a4c:	01c12083          	lw	ra,28(sp)
  800a50:	03010113          	addi	sp,sp,48
  800a54:	00008067          	ret

00800a58 <main>:
  800a58:	fe010113          	addi	sp,sp,-32
  800a5c:	00000517          	auipc	a0,0x0
  800a60:	57850513          	addi	a0,a0,1400 # 800fd4 <error_string+0x23c>
  800a64:	00112e23          	sw	ra,28(sp)
  800a68:	00812c23          	sw	s0,24(sp)
  800a6c:	809ff0ef          	jal	ra,800274 <cprintf>
  800a70:	f64ff0ef          	jal	ra,8001d4 <fork>
  800a74:	0e050863          	beqz	a0,800b64 <main+0x10c>
  800a78:	00050413          	mv	s0,a0
  800a7c:	00050593          	mv	a1,a0
  800a80:	00000517          	auipc	a0,0x0
  800a84:	59050513          	addi	a0,a0,1424 # 801010 <error_string+0x278>
  800a88:	fecff0ef          	jal	ra,800274 <cprintf>
  800a8c:	0a805c63          	blez	s0,800b44 <main+0xec>
  800a90:	00000517          	auipc	a0,0x0
  800a94:	5d050513          	addi	a0,a0,1488 # 801060 <error_string+0x2c8>
  800a98:	fdcff0ef          	jal	ra,800274 <cprintf>
  800a9c:	00c10593          	addi	a1,sp,12
  800aa0:	00040513          	mv	a0,s0
  800aa4:	f40ff0ef          	jal	ra,8001e4 <waitpid>
  800aa8:	04051e63          	bnez	a0,800b04 <main+0xac>
  800aac:	00c12703          	lw	a4,12(sp)
  800ab0:	00001797          	auipc	a5,0x1
  800ab4:	5507a783          	lw	a5,1360(a5) # 802000 <magic>
  800ab8:	04f71663          	bne	a4,a5,800b04 <main+0xac>
  800abc:	00c10593          	addi	a1,sp,12
  800ac0:	00040513          	mv	a0,s0
  800ac4:	f20ff0ef          	jal	ra,8001e4 <waitpid>
  800ac8:	04050e63          	beqz	a0,800b24 <main+0xcc>
  800acc:	f0cff0ef          	jal	ra,8001d8 <wait>
  800ad0:	04050a63          	beqz	a0,800b24 <main+0xcc>
  800ad4:	00040593          	mv	a1,s0
  800ad8:	00000517          	auipc	a0,0x0
  800adc:	5fc50513          	addi	a0,a0,1532 # 8010d4 <error_string+0x33c>
  800ae0:	f94ff0ef          	jal	ra,800274 <cprintf>
  800ae4:	00000517          	auipc	a0,0x0
  800ae8:	60050513          	addi	a0,a0,1536 # 8010e4 <error_string+0x34c>
  800aec:	f88ff0ef          	jal	ra,800274 <cprintf>
  800af0:	01c12083          	lw	ra,28(sp)
  800af4:	00000513          	li	a0,0
  800af8:	01812403          	lw	s0,24(sp)
  800afc:	02010113          	addi	sp,sp,32
  800b00:	00008067          	ret
  800b04:	00000697          	auipc	a3,0x0
  800b08:	57c68693          	addi	a3,a3,1404 # 801080 <error_string+0x2e8>
  800b0c:	00000617          	auipc	a2,0x0
  800b10:	53060613          	addi	a2,a2,1328 # 80103c <error_string+0x2a4>
  800b14:	01b00593          	li	a1,27
  800b18:	00000517          	auipc	a0,0x0
  800b1c:	53c50513          	addi	a0,a0,1340 # 801054 <error_string+0x2bc>
  800b20:	d00ff0ef          	jal	ra,800020 <__panic>
  800b24:	00000697          	auipc	a3,0x0
  800b28:	58868693          	addi	a3,a3,1416 # 8010ac <error_string+0x314>
  800b2c:	00000617          	auipc	a2,0x0
  800b30:	51060613          	addi	a2,a2,1296 # 80103c <error_string+0x2a4>
  800b34:	01c00593          	li	a1,28
  800b38:	00000517          	auipc	a0,0x0
  800b3c:	51c50513          	addi	a0,a0,1308 # 801054 <error_string+0x2bc>
  800b40:	ce0ff0ef          	jal	ra,800020 <__panic>
  800b44:	00000697          	auipc	a3,0x0
  800b48:	4f068693          	addi	a3,a3,1264 # 801034 <error_string+0x29c>
  800b4c:	00000617          	auipc	a2,0x0
  800b50:	4f060613          	addi	a2,a2,1264 # 80103c <error_string+0x2a4>
  800b54:	01800593          	li	a1,24
  800b58:	00000517          	auipc	a0,0x0
  800b5c:	4fc50513          	addi	a0,a0,1276 # 801054 <error_string+0x2bc>
  800b60:	cc0ff0ef          	jal	ra,800020 <__panic>
  800b64:	00000517          	auipc	a0,0x0
  800b68:	49850513          	addi	a0,a0,1176 # 800ffc <error_string+0x264>
  800b6c:	f08ff0ef          	jal	ra,800274 <cprintf>
  800b70:	e78ff0ef          	jal	ra,8001e8 <yield>
  800b74:	e74ff0ef          	jal	ra,8001e8 <yield>
  800b78:	e70ff0ef          	jal	ra,8001e8 <yield>
  800b7c:	e6cff0ef          	jal	ra,8001e8 <yield>
  800b80:	e68ff0ef          	jal	ra,8001e8 <yield>
  800b84:	e64ff0ef          	jal	ra,8001e8 <yield>
  800b88:	e60ff0ef          	jal	ra,8001e8 <yield>
  800b8c:	00001517          	auipc	a0,0x1
  800b90:	47452503          	lw	a0,1140(a0) # 802000 <magic>
  800b94:	e24ff0ef          	jal	ra,8001b8 <exit>
