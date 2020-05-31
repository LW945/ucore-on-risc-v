
obj/__user_waitkill.out:     file format elf32-littleriscv


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
  800040:	b9450513          	addi	a0,a0,-1132 # 800bd0 <main+0xc4>
  800044:	00112e23          	sw	ra,28(sp)
  800048:	02d12623          	sw	a3,44(sp)
  80004c:	02e12823          	sw	a4,48(sp)
  800050:	03012c23          	sw	a6,56(sp)
  800054:	03112e23          	sw	a7,60(sp)
  800058:	00f12623          	sw	a5,12(sp)
  80005c:	228000ef          	jal	ra,800284 <cprintf>
  800060:	00c12583          	lw	a1,12(sp)
  800064:	00040513          	mv	a0,s0
  800068:	1e0000ef          	jal	ra,800248 <vcprintf>
  80006c:	00001517          	auipc	a0,0x1
  800070:	fa850513          	addi	a0,a0,-88 # 801014 <error_string+0x244>
  800074:	210000ef          	jal	ra,800284 <cprintf>
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
  8000a0:	b5050513          	addi	a0,a0,-1200 # 800bec <main+0xe0>
  8000a4:	00112e23          	sw	ra,28(sp)
  8000a8:	02d12623          	sw	a3,44(sp)
  8000ac:	02e12823          	sw	a4,48(sp)
  8000b0:	03012c23          	sw	a6,56(sp)
  8000b4:	03112e23          	sw	a7,60(sp)
  8000b8:	00f12623          	sw	a5,12(sp)
  8000bc:	1c8000ef          	jal	ra,800284 <cprintf>
  8000c0:	00c12583          	lw	a1,12(sp)
  8000c4:	00040513          	mv	a0,s0
  8000c8:	180000ef          	jal	ra,800248 <vcprintf>
  8000cc:	00001517          	auipc	a0,0x1
  8000d0:	f4850513          	addi	a0,a0,-184 # 801014 <error_string+0x244>
  8000d4:	1b0000ef          	jal	ra,800284 <cprintf>
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
  8001dc:	a3050513          	addi	a0,a0,-1488 # 800c08 <main+0xfc>
  8001e0:	0a4000ef          	jal	ra,800284 <cprintf>
  8001e4:	0000006f          	j	8001e4 <exit+0x18>

008001e8 <fork>:
  8001e8:	f79ff06f          	j	800160 <sys_fork>

008001ec <waitpid>:
  8001ec:	f7dff06f          	j	800168 <sys_wait>

008001f0 <yield>:
  8001f0:	f89ff06f          	j	800178 <sys_yield>

008001f4 <kill>:
  8001f4:	f8dff06f          	j	800180 <sys_kill>

008001f8 <getpid>:
  8001f8:	f95ff06f          	j	80018c <sys_getpid>

008001fc <_start>:
  8001fc:	00012503          	lw	a0,0(sp)
  800200:	00410593          	addi	a1,sp,4
  800204:	14c000ef          	jal	ra,800350 <umain>
  800208:	0000006f          	j	800208 <_start+0xc>

0080020c <open>:
  80020c:	f95ff06f          	j	8001a0 <sys_open>

00800210 <close>:
  800210:	fa1ff06f          	j	8001b0 <sys_close>

00800214 <dup2>:
  800214:	fa9ff06f          	j	8001bc <sys_dup>

00800218 <cputch>:
  800218:	ff010113          	addi	sp,sp,-16
  80021c:	00112623          	sw	ra,12(sp)
  800220:	00812423          	sw	s0,8(sp)
  800224:	00058413          	mv	s0,a1
  800228:	f6dff0ef          	jal	ra,800194 <sys_putc>
  80022c:	00042783          	lw	a5,0(s0)
  800230:	00c12083          	lw	ra,12(sp)
  800234:	00178793          	addi	a5,a5,1
  800238:	00f42023          	sw	a5,0(s0)
  80023c:	00812403          	lw	s0,8(sp)
  800240:	01010113          	addi	sp,sp,16
  800244:	00008067          	ret

00800248 <vcprintf>:
  800248:	fe010113          	addi	sp,sp,-32
  80024c:	00058713          	mv	a4,a1
  800250:	ffff75b7          	lui	a1,0xffff7
  800254:	00050693          	mv	a3,a0
  800258:	00c10613          	addi	a2,sp,12
  80025c:	00000517          	auipc	a0,0x0
  800260:	fbc50513          	addi	a0,a0,-68 # 800218 <cputch>
  800264:	ad958593          	addi	a1,a1,-1319 # ffff6ad9 <sbi_remote_fence_i+0xffff71e9>
  800268:	00112e23          	sw	ra,28(sp)
  80026c:	00012623          	sw	zero,12(sp)
  800270:	278000ef          	jal	ra,8004e8 <vprintfmt>
  800274:	01c12083          	lw	ra,28(sp)
  800278:	00c12503          	lw	a0,12(sp)
  80027c:	02010113          	addi	sp,sp,32
  800280:	00008067          	ret

00800284 <cprintf>:
  800284:	fc010113          	addi	sp,sp,-64
  800288:	02410313          	addi	t1,sp,36
  80028c:	02b12223          	sw	a1,36(sp)
  800290:	ffff75b7          	lui	a1,0xffff7
  800294:	02c12423          	sw	a2,40(sp)
  800298:	02d12623          	sw	a3,44(sp)
  80029c:	02e12823          	sw	a4,48(sp)
  8002a0:	00050693          	mv	a3,a0
  8002a4:	00c10613          	addi	a2,sp,12
  8002a8:	00000517          	auipc	a0,0x0
  8002ac:	f7050513          	addi	a0,a0,-144 # 800218 <cputch>
  8002b0:	00030713          	mv	a4,t1
  8002b4:	ad958593          	addi	a1,a1,-1319 # ffff6ad9 <sbi_remote_fence_i+0xffff71e9>
  8002b8:	00112e23          	sw	ra,28(sp)
  8002bc:	02f12a23          	sw	a5,52(sp)
  8002c0:	03012c23          	sw	a6,56(sp)
  8002c4:	03112e23          	sw	a7,60(sp)
  8002c8:	00612423          	sw	t1,8(sp)
  8002cc:	00012623          	sw	zero,12(sp)
  8002d0:	218000ef          	jal	ra,8004e8 <vprintfmt>
  8002d4:	01c12083          	lw	ra,28(sp)
  8002d8:	00c12503          	lw	a0,12(sp)
  8002dc:	04010113          	addi	sp,sp,64
  8002e0:	00008067          	ret

008002e4 <initfd>:
  8002e4:	ff010113          	addi	sp,sp,-16
  8002e8:	00058793          	mv	a5,a1
  8002ec:	00912223          	sw	s1,4(sp)
  8002f0:	00060593          	mv	a1,a2
  8002f4:	00050493          	mv	s1,a0
  8002f8:	00078513          	mv	a0,a5
  8002fc:	00812423          	sw	s0,8(sp)
  800300:	00112623          	sw	ra,12(sp)
  800304:	f09ff0ef          	jal	ra,80020c <open>
  800308:	00050413          	mv	s0,a0
  80030c:	02054663          	bltz	a0,800338 <initfd+0x54>
  800310:	02950463          	beq	a0,s1,800338 <initfd+0x54>
  800314:	00048513          	mv	a0,s1
  800318:	ef9ff0ef          	jal	ra,800210 <close>
  80031c:	00048593          	mv	a1,s1
  800320:	00040513          	mv	a0,s0
  800324:	ef1ff0ef          	jal	ra,800214 <dup2>
  800328:	00050493          	mv	s1,a0
  80032c:	00040513          	mv	a0,s0
  800330:	ee1ff0ef          	jal	ra,800210 <close>
  800334:	00048413          	mv	s0,s1
  800338:	00c12083          	lw	ra,12(sp)
  80033c:	00040513          	mv	a0,s0
  800340:	00412483          	lw	s1,4(sp)
  800344:	00812403          	lw	s0,8(sp)
  800348:	01010113          	addi	sp,sp,16
  80034c:	00008067          	ret

00800350 <umain>:
  800350:	ff010113          	addi	sp,sp,-16
  800354:	00812423          	sw	s0,8(sp)
  800358:	00912223          	sw	s1,4(sp)
  80035c:	00050413          	mv	s0,a0
  800360:	00058493          	mv	s1,a1
  800364:	00000613          	li	a2,0
  800368:	00001597          	auipc	a1,0x1
  80036c:	8b458593          	addi	a1,a1,-1868 # 800c1c <main+0x110>
  800370:	00000513          	li	a0,0
  800374:	00112623          	sw	ra,12(sp)
  800378:	f6dff0ef          	jal	ra,8002e4 <initfd>
  80037c:	02054663          	bltz	a0,8003a8 <umain+0x58>
  800380:	00100613          	li	a2,1
  800384:	00001597          	auipc	a1,0x1
  800388:	8d058593          	addi	a1,a1,-1840 # 800c54 <main+0x148>
  80038c:	00060513          	mv	a0,a2
  800390:	f55ff0ef          	jal	ra,8002e4 <initfd>
  800394:	02054a63          	bltz	a0,8003c8 <umain+0x78>
  800398:	00048593          	mv	a1,s1
  80039c:	00040513          	mv	a0,s0
  8003a0:	76c000ef          	jal	ra,800b0c <main>
  8003a4:	e29ff0ef          	jal	ra,8001cc <exit>
  8003a8:	00050693          	mv	a3,a0
  8003ac:	00001617          	auipc	a2,0x1
  8003b0:	87860613          	addi	a2,a2,-1928 # 800c24 <main+0x118>
  8003b4:	01a00593          	li	a1,26
  8003b8:	00001517          	auipc	a0,0x1
  8003bc:	88850513          	addi	a0,a0,-1912 # 800c40 <main+0x134>
  8003c0:	cc1ff0ef          	jal	ra,800080 <__warn>
  8003c4:	fbdff06f          	j	800380 <umain+0x30>
  8003c8:	00050693          	mv	a3,a0
  8003cc:	00001617          	auipc	a2,0x1
  8003d0:	89060613          	addi	a2,a2,-1904 # 800c5c <main+0x150>
  8003d4:	01d00593          	li	a1,29
  8003d8:	00001517          	auipc	a0,0x1
  8003dc:	86850513          	addi	a0,a0,-1944 # 800c40 <main+0x134>
  8003e0:	ca1ff0ef          	jal	ra,800080 <__warn>
  8003e4:	fb5ff06f          	j	800398 <umain+0x48>

008003e8 <strnlen>:
  8003e8:	00050693          	mv	a3,a0
  8003ec:	02058a63          	beqz	a1,800420 <strnlen+0x38>
  8003f0:	00054703          	lbu	a4,0(a0)
  8003f4:	00150793          	addi	a5,a0,1
  8003f8:	02070463          	beqz	a4,800420 <strnlen+0x38>
  8003fc:	00b505b3          	add	a1,a0,a1
  800400:	0100006f          	j	800410 <strnlen+0x28>
  800404:	00178793          	addi	a5,a5,1
  800408:	fff7c703          	lbu	a4,-1(a5)
  80040c:	00070863          	beqz	a4,80041c <strnlen+0x34>
  800410:	40d78533          	sub	a0,a5,a3
  800414:	feb798e3          	bne	a5,a1,800404 <strnlen+0x1c>
  800418:	00008067          	ret
  80041c:	00008067          	ret
  800420:	00000513          	li	a0,0
  800424:	00008067          	ret

00800428 <printnum>:
  800428:	fd010113          	addi	sp,sp,-48
  80042c:	02912223          	sw	s1,36(sp)
  800430:	03212023          	sw	s2,32(sp)
  800434:	01312e23          	sw	s3,28(sp)
  800438:	01412c23          	sw	s4,24(sp)
  80043c:	01512a23          	sw	s5,20(sp)
  800440:	02112623          	sw	ra,44(sp)
  800444:	02812423          	sw	s0,40(sp)
  800448:	00050493          	mv	s1,a0
  80044c:	00058993          	mv	s3,a1
  800450:	00060913          	mv	s2,a2
  800454:	03012a03          	lw	s4,48(sp)
  800458:	03077ab3          	remu	s5,a4,a6
  80045c:	06079463          	bnez	a5,8004c4 <printnum+0x9c>
  800460:	07077263          	bleu	a6,a4,8004c4 <printnum+0x9c>
  800464:	fff88413          	addi	s0,a7,-1
  800468:	00805e63          	blez	s0,800484 <printnum+0x5c>
  80046c:	fff40413          	addi	s0,s0,-1
  800470:	00098613          	mv	a2,s3
  800474:	00090593          	mv	a1,s2
  800478:	000a0513          	mv	a0,s4
  80047c:	000480e7          	jalr	s1
  800480:	fe0416e3          	bnez	s0,80046c <printnum+0x44>
  800484:	00001797          	auipc	a5,0x1
  800488:	9b078793          	addi	a5,a5,-1616 # 800e34 <error_string+0x64>
  80048c:	015787b3          	add	a5,a5,s5
  800490:	00098613          	mv	a2,s3
  800494:	00090593          	mv	a1,s2
  800498:	00048313          	mv	t1,s1
  80049c:	02c12083          	lw	ra,44(sp)
  8004a0:	02812403          	lw	s0,40(sp)
  8004a4:	02412483          	lw	s1,36(sp)
  8004a8:	02012903          	lw	s2,32(sp)
  8004ac:	01c12983          	lw	s3,28(sp)
  8004b0:	01812a03          	lw	s4,24(sp)
  8004b4:	01412a83          	lw	s5,20(sp)
  8004b8:	0007c503          	lbu	a0,0(a5)
  8004bc:	03010113          	addi	sp,sp,48
  8004c0:	00030067          	jr	t1
  8004c4:	03075733          	divu	a4,a4,a6
  8004c8:	01412023          	sw	s4,0(sp)
  8004cc:	fff88893          	addi	a7,a7,-1
  8004d0:	00000793          	li	a5,0
  8004d4:	00090613          	mv	a2,s2
  8004d8:	00098593          	mv	a1,s3
  8004dc:	00048513          	mv	a0,s1
  8004e0:	f49ff0ef          	jal	ra,800428 <printnum>
  8004e4:	fa1ff06f          	j	800484 <printnum+0x5c>

008004e8 <vprintfmt>:
  8004e8:	fa010113          	addi	sp,sp,-96
  8004ec:	05212823          	sw	s2,80(sp)
  8004f0:	05312623          	sw	s3,76(sp)
  8004f4:	05412423          	sw	s4,72(sp)
  8004f8:	05512223          	sw	s5,68(sp)
  8004fc:	05612023          	sw	s6,64(sp)
  800500:	03712e23          	sw	s7,60(sp)
  800504:	03812c23          	sw	s8,56(sp)
  800508:	03a12823          	sw	s10,48(sp)
  80050c:	04112e23          	sw	ra,92(sp)
  800510:	04812c23          	sw	s0,88(sp)
  800514:	04912a23          	sw	s1,84(sp)
  800518:	03912a23          	sw	s9,52(sp)
  80051c:	03b12623          	sw	s11,44(sp)
  800520:	00050a13          	mv	s4,a0
  800524:	00058993          	mv	s3,a1
  800528:	00060913          	mv	s2,a2
  80052c:	00068d13          	mv	s10,a3
  800530:	00070b13          	mv	s6,a4
  800534:	00000a97          	auipc	s5,0x0
  800538:	744a8a93          	addi	s5,s5,1860 # 800c78 <main+0x16c>
  80053c:	fff00b93          	li	s7,-1
  800540:	05e00c13          	li	s8,94
  800544:	000d4503          	lbu	a0,0(s10)
  800548:	02500493          	li	s1,37
  80054c:	001d0413          	addi	s0,s10,1
  800550:	02950063          	beq	a0,s1,800570 <vprintfmt+0x88>
  800554:	06050663          	beqz	a0,8005c0 <vprintfmt+0xd8>
  800558:	00098613          	mv	a2,s3
  80055c:	00090593          	mv	a1,s2
  800560:	00140413          	addi	s0,s0,1
  800564:	000a00e7          	jalr	s4
  800568:	fff44503          	lbu	a0,-1(s0)
  80056c:	fe9514e3          	bne	a0,s1,800554 <vprintfmt+0x6c>
  800570:	00044e03          	lbu	t3,0(s0)
  800574:	fff00d93          	li	s11,-1
  800578:	02000693          	li	a3,32
  80057c:	00000493          	li	s1,0
  800580:	00000593          	li	a1,0
  800584:	000d8c93          	mv	s9,s11
  800588:	05500713          	li	a4,85
  80058c:	00100313          	li	t1,1
  800590:	03000813          	li	a6,48
  800594:	00900613          	li	a2,9
  800598:	02d00513          	li	a0,45
  80059c:	fdde0793          	addi	a5,t3,-35
  8005a0:	0ff7f793          	andi	a5,a5,255
  8005a4:	00140d13          	addi	s10,s0,1
  8005a8:	34f76a63          	bltu	a4,a5,8008fc <vprintfmt+0x414>
  8005ac:	00279793          	slli	a5,a5,0x2
  8005b0:	015787b3          	add	a5,a5,s5
  8005b4:	0007a783          	lw	a5,0(a5)
  8005b8:	015787b3          	add	a5,a5,s5
  8005bc:	00078067          	jr	a5
  8005c0:	05c12083          	lw	ra,92(sp)
  8005c4:	05812403          	lw	s0,88(sp)
  8005c8:	05412483          	lw	s1,84(sp)
  8005cc:	05012903          	lw	s2,80(sp)
  8005d0:	04c12983          	lw	s3,76(sp)
  8005d4:	04812a03          	lw	s4,72(sp)
  8005d8:	04412a83          	lw	s5,68(sp)
  8005dc:	04012b03          	lw	s6,64(sp)
  8005e0:	03c12b83          	lw	s7,60(sp)
  8005e4:	03812c03          	lw	s8,56(sp)
  8005e8:	03412c83          	lw	s9,52(sp)
  8005ec:	03012d03          	lw	s10,48(sp)
  8005f0:	02c12d83          	lw	s11,44(sp)
  8005f4:	06010113          	addi	sp,sp,96
  8005f8:	00008067          	ret
  8005fc:	00100793          	li	a5,1
  800600:	36b7c863          	blt	a5,a1,800970 <vprintfmt+0x488>
  800604:	000b2703          	lw	a4,0(s6)
  800608:	00000793          	li	a5,0
  80060c:	004b0b13          	addi	s6,s6,4
  800610:	01000813          	li	a6,16
  800614:	00d12023          	sw	a3,0(sp)
  800618:	000c8893          	mv	a7,s9
  80061c:	00090613          	mv	a2,s2
  800620:	00098593          	mv	a1,s3
  800624:	000a0513          	mv	a0,s4
  800628:	e01ff0ef          	jal	ra,800428 <printnum>
  80062c:	f19ff06f          	j	800544 <vprintfmt+0x5c>
  800630:	00144e03          	lbu	t3,1(s0)
  800634:	00030493          	mv	s1,t1
  800638:	000d0413          	mv	s0,s10
  80063c:	f61ff06f          	j	80059c <vprintfmt+0xb4>
  800640:	000b2503          	lw	a0,0(s6)
  800644:	00098613          	mv	a2,s3
  800648:	00090593          	mv	a1,s2
  80064c:	004b0b13          	addi	s6,s6,4
  800650:	000a00e7          	jalr	s4
  800654:	ef1ff06f          	j	800544 <vprintfmt+0x5c>
  800658:	00100793          	li	a5,1
  80065c:	32b7c863          	blt	a5,a1,80098c <vprintfmt+0x4a4>
  800660:	000b2703          	lw	a4,0(s6)
  800664:	004b0b13          	addi	s6,s6,4
  800668:	41f75793          	srai	a5,a4,0x1f
  80066c:	00a00813          	li	a6,10
  800670:	fa07d2e3          	bgez	a5,800614 <vprintfmt+0x12c>
  800674:	00098613          	mv	a2,s3
  800678:	00090593          	mv	a1,s2
  80067c:	02d00513          	li	a0,45
  800680:	00f12e23          	sw	a5,28(sp)
  800684:	00e12c23          	sw	a4,24(sp)
  800688:	01012a23          	sw	a6,20(sp)
  80068c:	00d12823          	sw	a3,16(sp)
  800690:	000a00e7          	jalr	s4
  800694:	01812703          	lw	a4,24(sp)
  800698:	01c12783          	lw	a5,28(sp)
  80069c:	01012683          	lw	a3,16(sp)
  8006a0:	40e00733          	neg	a4,a4
  8006a4:	00e03633          	snez	a2,a4
  8006a8:	40f007b3          	neg	a5,a5
  8006ac:	40c787b3          	sub	a5,a5,a2
  8006b0:	01412803          	lw	a6,20(sp)
  8006b4:	f61ff06f          	j	800614 <vprintfmt+0x12c>
  8006b8:	000b2783          	lw	a5,0(s6)
  8006bc:	01800693          	li	a3,24
  8006c0:	004b0b13          	addi	s6,s6,4
  8006c4:	41f7d713          	srai	a4,a5,0x1f
  8006c8:	00f747b3          	xor	a5,a4,a5
  8006cc:	40e787b3          	sub	a5,a5,a4
  8006d0:	2cf6ca63          	blt	a3,a5,8009a4 <vprintfmt+0x4bc>
  8006d4:	00279693          	slli	a3,a5,0x2
  8006d8:	00000717          	auipc	a4,0x0
  8006dc:	6f870713          	addi	a4,a4,1784 # 800dd0 <error_string>
  8006e0:	00d70733          	add	a4,a4,a3
  8006e4:	00072703          	lw	a4,0(a4)
  8006e8:	2a070e63          	beqz	a4,8009a4 <vprintfmt+0x4bc>
  8006ec:	00001697          	auipc	a3,0x1
  8006f0:	91c68693          	addi	a3,a3,-1764 # 801008 <error_string+0x238>
  8006f4:	00090613          	mv	a2,s2
  8006f8:	00098593          	mv	a1,s3
  8006fc:	000a0513          	mv	a0,s4
  800700:	334000ef          	jal	ra,800a34 <printfmt>
  800704:	e41ff06f          	j	800544 <vprintfmt+0x5c>
  800708:	00144e03          	lbu	t3,1(s0)
  80070c:	00158593          	addi	a1,a1,1
  800710:	000d0413          	mv	s0,s10
  800714:	e89ff06f          	j	80059c <vprintfmt+0xb4>
  800718:	00100793          	li	a5,1
  80071c:	20b7ce63          	blt	a5,a1,800938 <vprintfmt+0x450>
  800720:	000b2703          	lw	a4,0(s6)
  800724:	00000793          	li	a5,0
  800728:	004b0b13          	addi	s6,s6,4
  80072c:	00800813          	li	a6,8
  800730:	ee5ff06f          	j	800614 <vprintfmt+0x12c>
  800734:	03000513          	li	a0,48
  800738:	00098613          	mv	a2,s3
  80073c:	00090593          	mv	a1,s2
  800740:	00d12823          	sw	a3,16(sp)
  800744:	000a00e7          	jalr	s4
  800748:	00098613          	mv	a2,s3
  80074c:	00090593          	mv	a1,s2
  800750:	07800513          	li	a0,120
  800754:	000a00e7          	jalr	s4
  800758:	000b2703          	lw	a4,0(s6)
  80075c:	00000793          	li	a5,0
  800760:	01000813          	li	a6,16
  800764:	004b0b13          	addi	s6,s6,4
  800768:	01012683          	lw	a3,16(sp)
  80076c:	ea9ff06f          	j	800614 <vprintfmt+0x12c>
  800770:	000b2403          	lw	s0,0(s6)
  800774:	004b0793          	addi	a5,s6,4
  800778:	00f12a23          	sw	a5,20(sp)
  80077c:	26040463          	beqz	s0,8009e4 <vprintfmt+0x4fc>
  800780:	05905463          	blez	s9,8007c8 <vprintfmt+0x2e0>
  800784:	02d00793          	li	a5,45
  800788:	22f68e63          	beq	a3,a5,8009c4 <vprintfmt+0x4dc>
  80078c:	000d8593          	mv	a1,s11
  800790:	00040513          	mv	a0,s0
  800794:	00d12823          	sw	a3,16(sp)
  800798:	c51ff0ef          	jal	ra,8003e8 <strnlen>
  80079c:	40ac8cb3          	sub	s9,s9,a0
  8007a0:	03905463          	blez	s9,8007c8 <vprintfmt+0x2e0>
  8007a4:	01012683          	lw	a3,16(sp)
  8007a8:	00068513          	mv	a0,a3
  8007ac:	00098613          	mv	a2,s3
  8007b0:	00090593          	mv	a1,s2
  8007b4:	00d12823          	sw	a3,16(sp)
  8007b8:	fffc8c93          	addi	s9,s9,-1
  8007bc:	000a00e7          	jalr	s4
  8007c0:	01012683          	lw	a3,16(sp)
  8007c4:	fe0c92e3          	bnez	s9,8007a8 <vprintfmt+0x2c0>
  8007c8:	00044783          	lbu	a5,0(s0)
  8007cc:	00140b13          	addi	s6,s0,1
  8007d0:	00078513          	mv	a0,a5
  8007d4:	06078063          	beqz	a5,800834 <vprintfmt+0x34c>
  8007d8:	03f00413          	li	s0,63
  8007dc:	000dc663          	bltz	s11,8007e8 <vprintfmt+0x300>
  8007e0:	fffd8d93          	addi	s11,s11,-1
  8007e4:	037d8863          	beq	s11,s7,800814 <vprintfmt+0x32c>
  8007e8:	00098613          	mv	a2,s3
  8007ec:	00090593          	mv	a1,s2
  8007f0:	00048663          	beqz	s1,8007fc <vprintfmt+0x314>
  8007f4:	fe078793          	addi	a5,a5,-32
  8007f8:	12fc6a63          	bltu	s8,a5,80092c <vprintfmt+0x444>
  8007fc:	000a00e7          	jalr	s4
  800800:	001b0b13          	addi	s6,s6,1
  800804:	fffb4783          	lbu	a5,-1(s6)
  800808:	fffc8c93          	addi	s9,s9,-1
  80080c:	00078513          	mv	a0,a5
  800810:	fc0796e3          	bnez	a5,8007dc <vprintfmt+0x2f4>
  800814:	03905063          	blez	s9,800834 <vprintfmt+0x34c>
  800818:	02000413          	li	s0,32
  80081c:	fffc8c93          	addi	s9,s9,-1
  800820:	00098613          	mv	a2,s3
  800824:	00090593          	mv	a1,s2
  800828:	00040513          	mv	a0,s0
  80082c:	000a00e7          	jalr	s4
  800830:	fe0c96e3          	bnez	s9,80081c <vprintfmt+0x334>
  800834:	01412b03          	lw	s6,20(sp)
  800838:	d0dff06f          	j	800544 <vprintfmt+0x5c>
  80083c:	00100793          	li	a5,1
  800840:	10b7ca63          	blt	a5,a1,800954 <vprintfmt+0x46c>
  800844:	000b2703          	lw	a4,0(s6)
  800848:	00000793          	li	a5,0
  80084c:	004b0b13          	addi	s6,s6,4
  800850:	00a00813          	li	a6,10
  800854:	dc1ff06f          	j	800614 <vprintfmt+0x12c>
  800858:	00144e03          	lbu	t3,1(s0)
  80085c:	00050693          	mv	a3,a0
  800860:	000d0413          	mv	s0,s10
  800864:	d39ff06f          	j	80059c <vprintfmt+0xb4>
  800868:	00098613          	mv	a2,s3
  80086c:	00090593          	mv	a1,s2
  800870:	02500513          	li	a0,37
  800874:	000a00e7          	jalr	s4
  800878:	ccdff06f          	j	800544 <vprintfmt+0x5c>
  80087c:	000b2d83          	lw	s11,0(s6)
  800880:	00144e03          	lbu	t3,1(s0)
  800884:	004b0b13          	addi	s6,s6,4
  800888:	000d0413          	mv	s0,s10
  80088c:	d00cd8e3          	bgez	s9,80059c <vprintfmt+0xb4>
  800890:	000d8c93          	mv	s9,s11
  800894:	fff00d93          	li	s11,-1
  800898:	d05ff06f          	j	80059c <vprintfmt+0xb4>
  80089c:	00144e03          	lbu	t3,1(s0)
  8008a0:	00080693          	mv	a3,a6
  8008a4:	000d0413          	mv	s0,s10
  8008a8:	cf5ff06f          	j	80059c <vprintfmt+0xb4>
  8008ac:	00144e83          	lbu	t4,1(s0)
  8008b0:	fd0e0d93          	addi	s11,t3,-48
  8008b4:	fd0e8793          	addi	a5,t4,-48
  8008b8:	14f66c63          	bltu	a2,a5,800a10 <vprintfmt+0x528>
  8008bc:	000d0413          	mv	s0,s10
  8008c0:	002d9793          	slli	a5,s11,0x2
  8008c4:	01b78db3          	add	s11,a5,s11
  8008c8:	00140413          	addi	s0,s0,1
  8008cc:	001d9d93          	slli	s11,s11,0x1
  8008d0:	01dd8db3          	add	s11,s11,t4
  8008d4:	00044e83          	lbu	t4,0(s0)
  8008d8:	fd0d8d93          	addi	s11,s11,-48
  8008dc:	fd0e8793          	addi	a5,t4,-48
  8008e0:	fef670e3          	bleu	a5,a2,8008c0 <vprintfmt+0x3d8>
  8008e4:	000e8e13          	mv	t3,t4
  8008e8:	fa5ff06f          	j	80088c <vprintfmt+0x3a4>
  8008ec:	0e0cc863          	bltz	s9,8009dc <vprintfmt+0x4f4>
  8008f0:	00144e03          	lbu	t3,1(s0)
  8008f4:	000d0413          	mv	s0,s10
  8008f8:	ca5ff06f          	j	80059c <vprintfmt+0xb4>
  8008fc:	00098613          	mv	a2,s3
  800900:	00090593          	mv	a1,s2
  800904:	02500513          	li	a0,37
  800908:	000a00e7          	jalr	s4
  80090c:	fff44783          	lbu	a5,-1(s0)
  800910:	02500713          	li	a4,37
  800914:	00040d13          	mv	s10,s0
  800918:	c2e786e3          	beq	a5,a4,800544 <vprintfmt+0x5c>
  80091c:	fffd0d13          	addi	s10,s10,-1
  800920:	fffd4783          	lbu	a5,-1(s10)
  800924:	fee79ce3          	bne	a5,a4,80091c <vprintfmt+0x434>
  800928:	c1dff06f          	j	800544 <vprintfmt+0x5c>
  80092c:	00040513          	mv	a0,s0
  800930:	000a00e7          	jalr	s4
  800934:	ecdff06f          	j	800800 <vprintfmt+0x318>
  800938:	007b0793          	addi	a5,s6,7
  80093c:	ff87f793          	andi	a5,a5,-8
  800940:	00878b13          	addi	s6,a5,8
  800944:	0007a703          	lw	a4,0(a5)
  800948:	00800813          	li	a6,8
  80094c:	0047a783          	lw	a5,4(a5)
  800950:	cc5ff06f          	j	800614 <vprintfmt+0x12c>
  800954:	007b0793          	addi	a5,s6,7
  800958:	ff87f793          	andi	a5,a5,-8
  80095c:	00878b13          	addi	s6,a5,8
  800960:	0007a703          	lw	a4,0(a5)
  800964:	00a00813          	li	a6,10
  800968:	0047a783          	lw	a5,4(a5)
  80096c:	ca9ff06f          	j	800614 <vprintfmt+0x12c>
  800970:	007b0793          	addi	a5,s6,7
  800974:	ff87f793          	andi	a5,a5,-8
  800978:	00878b13          	addi	s6,a5,8
  80097c:	0007a703          	lw	a4,0(a5)
  800980:	01000813          	li	a6,16
  800984:	0047a783          	lw	a5,4(a5)
  800988:	c8dff06f          	j	800614 <vprintfmt+0x12c>
  80098c:	007b0793          	addi	a5,s6,7
  800990:	ff87f793          	andi	a5,a5,-8
  800994:	00878b13          	addi	s6,a5,8
  800998:	0007a703          	lw	a4,0(a5)
  80099c:	0047a783          	lw	a5,4(a5)
  8009a0:	ccdff06f          	j	80066c <vprintfmt+0x184>
  8009a4:	00078713          	mv	a4,a5
  8009a8:	00000697          	auipc	a3,0x0
  8009ac:	65468693          	addi	a3,a3,1620 # 800ffc <error_string+0x22c>
  8009b0:	00090613          	mv	a2,s2
  8009b4:	00098593          	mv	a1,s3
  8009b8:	000a0513          	mv	a0,s4
  8009bc:	078000ef          	jal	ra,800a34 <printfmt>
  8009c0:	b85ff06f          	j	800544 <vprintfmt+0x5c>
  8009c4:	00044783          	lbu	a5,0(s0)
  8009c8:	00140b13          	addi	s6,s0,1
  8009cc:	00078513          	mv	a0,a5
  8009d0:	e40784e3          	beqz	a5,800818 <vprintfmt+0x330>
  8009d4:	03f00413          	li	s0,63
  8009d8:	e05ff06f          	j	8007dc <vprintfmt+0x2f4>
  8009dc:	00000c93          	li	s9,0
  8009e0:	f11ff06f          	j	8008f0 <vprintfmt+0x408>
  8009e4:	03905c63          	blez	s9,800a1c <vprintfmt+0x534>
  8009e8:	02d00793          	li	a5,45
  8009ec:	00000417          	auipc	s0,0x0
  8009f0:	60840413          	addi	s0,s0,1544 # 800ff4 <error_string+0x224>
  8009f4:	d8f69ce3          	bne	a3,a5,80078c <vprintfmt+0x2a4>
  8009f8:	02800513          	li	a0,40
  8009fc:	00000b17          	auipc	s6,0x0
  800a00:	5f9b0b13          	addi	s6,s6,1529 # 800ff5 <error_string+0x225>
  800a04:	00050793          	mv	a5,a0
  800a08:	03f00413          	li	s0,63
  800a0c:	dd1ff06f          	j	8007dc <vprintfmt+0x2f4>
  800a10:	000e8e13          	mv	t3,t4
  800a14:	000d0413          	mv	s0,s10
  800a18:	e75ff06f          	j	80088c <vprintfmt+0x3a4>
  800a1c:	02800793          	li	a5,40
  800a20:	00078513          	mv	a0,a5
  800a24:	00000b17          	auipc	s6,0x0
  800a28:	5d1b0b13          	addi	s6,s6,1489 # 800ff5 <error_string+0x225>
  800a2c:	03f00413          	li	s0,63
  800a30:	dadff06f          	j	8007dc <vprintfmt+0x2f4>

00800a34 <printfmt>:
  800a34:	fd010113          	addi	sp,sp,-48
  800a38:	02010313          	addi	t1,sp,32
  800a3c:	02e12023          	sw	a4,32(sp)
  800a40:	00030713          	mv	a4,t1
  800a44:	00112e23          	sw	ra,28(sp)
  800a48:	02f12223          	sw	a5,36(sp)
  800a4c:	03012423          	sw	a6,40(sp)
  800a50:	03112623          	sw	a7,44(sp)
  800a54:	00612623          	sw	t1,12(sp)
  800a58:	a91ff0ef          	jal	ra,8004e8 <vprintfmt>
  800a5c:	01c12083          	lw	ra,28(sp)
  800a60:	03010113          	addi	sp,sp,48
  800a64:	00008067          	ret

00800a68 <do_yield>:
  800a68:	ff010113          	addi	sp,sp,-16
  800a6c:	00112623          	sw	ra,12(sp)
  800a70:	f80ff0ef          	jal	ra,8001f0 <yield>
  800a74:	f7cff0ef          	jal	ra,8001f0 <yield>
  800a78:	f78ff0ef          	jal	ra,8001f0 <yield>
  800a7c:	f74ff0ef          	jal	ra,8001f0 <yield>
  800a80:	f70ff0ef          	jal	ra,8001f0 <yield>
  800a84:	00c12083          	lw	ra,12(sp)
  800a88:	01010113          	addi	sp,sp,16
  800a8c:	f64ff06f          	j	8001f0 <yield>

00800a90 <loop>:
  800a90:	ff010113          	addi	sp,sp,-16
  800a94:	00000517          	auipc	a0,0x0
  800a98:	57850513          	addi	a0,a0,1400 # 80100c <error_string+0x23c>
  800a9c:	00112623          	sw	ra,12(sp)
  800aa0:	fe4ff0ef          	jal	ra,800284 <cprintf>
  800aa4:	0000006f          	j	800aa4 <loop+0x14>

00800aa8 <work>:
  800aa8:	ff010113          	addi	sp,sp,-16
  800aac:	00000517          	auipc	a0,0x0
  800ab0:	5d050513          	addi	a0,a0,1488 # 80107c <error_string+0x2ac>
  800ab4:	00112623          	sw	ra,12(sp)
  800ab8:	fccff0ef          	jal	ra,800284 <cprintf>
  800abc:	fadff0ef          	jal	ra,800a68 <do_yield>
  800ac0:	00001517          	auipc	a0,0x1
  800ac4:	54052503          	lw	a0,1344(a0) # 802000 <parent>
  800ac8:	f2cff0ef          	jal	ra,8001f4 <kill>
  800acc:	02051263          	bnez	a0,800af0 <work+0x48>
  800ad0:	00000517          	auipc	a0,0x0
  800ad4:	5b850513          	addi	a0,a0,1464 # 801088 <error_string+0x2b8>
  800ad8:	facff0ef          	jal	ra,800284 <cprintf>
  800adc:	f8dff0ef          	jal	ra,800a68 <do_yield>
  800ae0:	00001517          	auipc	a0,0x1
  800ae4:	52852503          	lw	a0,1320(a0) # 802008 <pid1>
  800ae8:	f0cff0ef          	jal	ra,8001f4 <kill>
  800aec:	00050663          	beqz	a0,800af8 <work+0x50>
  800af0:	fff00513          	li	a0,-1
  800af4:	ed8ff0ef          	jal	ra,8001cc <exit>
  800af8:	00000517          	auipc	a0,0x0
  800afc:	5a450513          	addi	a0,a0,1444 # 80109c <error_string+0x2cc>
  800b00:	f84ff0ef          	jal	ra,800284 <cprintf>
  800b04:	00000513          	li	a0,0
  800b08:	ec4ff0ef          	jal	ra,8001cc <exit>

00800b0c <main>:
  800b0c:	ff010113          	addi	sp,sp,-16
  800b10:	00112623          	sw	ra,12(sp)
  800b14:	ee4ff0ef          	jal	ra,8001f8 <getpid>
  800b18:	00001297          	auipc	t0,0x1
  800b1c:	4ea2a423          	sw	a0,1256(t0) # 802000 <parent>
  800b20:	ec8ff0ef          	jal	ra,8001e8 <fork>
  800b24:	00001297          	auipc	t0,0x1
  800b28:	4ea2a223          	sw	a0,1252(t0) # 802008 <pid1>
  800b2c:	04050c63          	beqz	a0,800b84 <main+0x78>
  800b30:	04a05e63          	blez	a0,800b8c <main+0x80>
  800b34:	eb4ff0ef          	jal	ra,8001e8 <fork>
  800b38:	00001297          	auipc	t0,0x1
  800b3c:	4ca2a623          	sw	a0,1228(t0) # 802004 <pid2>
  800b40:	04050463          	beqz	a0,800b88 <main+0x7c>
  800b44:	06a05463          	blez	a0,800bac <main+0xa0>
  800b48:	00000517          	auipc	a0,0x0
  800b4c:	50450513          	addi	a0,a0,1284 # 80104c <error_string+0x27c>
  800b50:	f34ff0ef          	jal	ra,800284 <cprintf>
  800b54:	00000593          	li	a1,0
  800b58:	00001517          	auipc	a0,0x1
  800b5c:	4b052503          	lw	a0,1200(a0) # 802008 <pid1>
  800b60:	e8cff0ef          	jal	ra,8001ec <waitpid>
  800b64:	00001697          	auipc	a3,0x1
  800b68:	4a46a683          	lw	a3,1188(a3) # 802008 <pid1>
  800b6c:	00000617          	auipc	a2,0x0
  800b70:	4f060613          	addi	a2,a2,1264 # 80105c <error_string+0x28c>
  800b74:	03400593          	li	a1,52
  800b78:	00000517          	auipc	a0,0x0
  800b7c:	4c450513          	addi	a0,a0,1220 # 80103c <error_string+0x26c>
  800b80:	ca0ff0ef          	jal	ra,800020 <__panic>
  800b84:	f0dff0ef          	jal	ra,800a90 <loop>
  800b88:	f21ff0ef          	jal	ra,800aa8 <work>
  800b8c:	00000697          	auipc	a3,0x0
  800b90:	48c68693          	addi	a3,a3,1164 # 801018 <error_string+0x248>
  800b94:	00000617          	auipc	a2,0x0
  800b98:	49060613          	addi	a2,a2,1168 # 801024 <error_string+0x254>
  800b9c:	02c00593          	li	a1,44
  800ba0:	00000517          	auipc	a0,0x0
  800ba4:	49c50513          	addi	a0,a0,1180 # 80103c <error_string+0x26c>
  800ba8:	c78ff0ef          	jal	ra,800020 <__panic>
  800bac:	00001517          	auipc	a0,0x1
  800bb0:	45c52503          	lw	a0,1116(a0) # 802008 <pid1>
  800bb4:	e40ff0ef          	jal	ra,8001f4 <kill>
  800bb8:	00000617          	auipc	a2,0x0
  800bbc:	4b860613          	addi	a2,a2,1208 # 801070 <error_string+0x2a0>
  800bc0:	03900593          	li	a1,57
  800bc4:	00000517          	auipc	a0,0x0
  800bc8:	47850513          	addi	a0,a0,1144 # 80103c <error_string+0x26c>
  800bcc:	c54ff0ef          	jal	ra,800020 <__panic>
