
obj/__user_sh.out:     file format elf32-littleriscv


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
  800040:	38450513          	addi	a0,a0,900 # 8013c0 <main+0x134>
  800044:	00112e23          	sw	ra,28(sp)
  800048:	02d12623          	sw	a3,44(sp)
  80004c:	02e12823          	sw	a4,48(sp)
  800050:	03012c23          	sw	a6,56(sp)
  800054:	03112e23          	sw	a7,60(sp)
  800058:	00f12623          	sw	a5,12(sp)
  80005c:	2b8000ef          	jal	ra,800314 <cprintf>
  800060:	00c12583          	lw	a1,12(sp)
  800064:	00040513          	mv	a0,s0
  800068:	270000ef          	jal	ra,8002d8 <vcprintf>
  80006c:	00001517          	auipc	a0,0x1
  800070:	3c050513          	addi	a0,a0,960 # 80142c <main+0x1a0>
  800074:	2a0000ef          	jal	ra,800314 <cprintf>
  800078:	ff600513          	li	a0,-10
  80007c:	170000ef          	jal	ra,8001ec <exit>

00800080 <__warn>:
  800080:	fc010113          	addi	sp,sp,-64
  800084:	00812c23          	sw	s0,24(sp)
  800088:	02f12a23          	sw	a5,52(sp)
  80008c:	00060413          	mv	s0,a2
  800090:	02c10793          	addi	a5,sp,44
  800094:	00058613          	mv	a2,a1
  800098:	00050593          	mv	a1,a0
  80009c:	00001517          	auipc	a0,0x1
  8000a0:	34050513          	addi	a0,a0,832 # 8013dc <main+0x150>
  8000a4:	00112e23          	sw	ra,28(sp)
  8000a8:	02d12623          	sw	a3,44(sp)
  8000ac:	02e12823          	sw	a4,48(sp)
  8000b0:	03012c23          	sw	a6,56(sp)
  8000b4:	03112e23          	sw	a7,60(sp)
  8000b8:	00f12623          	sw	a5,12(sp)
  8000bc:	258000ef          	jal	ra,800314 <cprintf>
  8000c0:	00c12583          	lw	a1,12(sp)
  8000c4:	00040513          	mv	a0,s0
  8000c8:	210000ef          	jal	ra,8002d8 <vcprintf>
  8000cc:	00001517          	auipc	a0,0x1
  8000d0:	36050513          	addi	a0,a0,864 # 80142c <main+0x1a0>
  8000d4:	240000ef          	jal	ra,800314 <cprintf>
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

00800184 <sys_exec>:
  800184:	00060693          	mv	a3,a2
  800188:	00058613          	mv	a2,a1
  80018c:	00050593          	mv	a1,a0
  800190:	00400513          	li	a0,4
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

008001b4 <sys_read>:
  8001b4:	00060693          	mv	a3,a2
  8001b8:	00058613          	mv	a2,a1
  8001bc:	00050593          	mv	a1,a0
  8001c0:	06600513          	li	a0,102
  8001c4:	f25ff06f          	j	8000e8 <syscall>

008001c8 <sys_write>:
  8001c8:	00060693          	mv	a3,a2
  8001cc:	00058613          	mv	a2,a1
  8001d0:	00050593          	mv	a1,a0
  8001d4:	06700513          	li	a0,103
  8001d8:	f11ff06f          	j	8000e8 <syscall>

008001dc <sys_dup>:
  8001dc:	00058613          	mv	a2,a1
  8001e0:	00050593          	mv	a1,a0
  8001e4:	08200513          	li	a0,130
  8001e8:	f01ff06f          	j	8000e8 <syscall>

008001ec <exit>:
  8001ec:	ff010113          	addi	sp,sp,-16
  8001f0:	00112623          	sw	ra,12(sp)
  8001f4:	f61ff0ef          	jal	ra,800154 <sys_exit>
  8001f8:	00001517          	auipc	a0,0x1
  8001fc:	20050513          	addi	a0,a0,512 # 8013f8 <main+0x16c>
  800200:	114000ef          	jal	ra,800314 <cprintf>
  800204:	0000006f          	j	800204 <exit+0x18>

00800208 <fork>:
  800208:	f59ff06f          	j	800160 <sys_fork>

0080020c <waitpid>:
  80020c:	f5dff06f          	j	800168 <sys_wait>

00800210 <__exec>:
  800210:	0005a783          	lw	a5,0(a1)
  800214:	00058613          	mv	a2,a1
  800218:	02078063          	beqz	a5,800238 <__exec+0x28>
  80021c:	00458793          	addi	a5,a1,4
  800220:	00000593          	li	a1,0
  800224:	00478793          	addi	a5,a5,4
  800228:	ffc7a683          	lw	a3,-4(a5)
  80022c:	00158593          	addi	a1,a1,1
  800230:	fe069ae3          	bnez	a3,800224 <__exec+0x14>
  800234:	f51ff06f          	j	800184 <sys_exec>
  800238:	00000593          	li	a1,0
  80023c:	ff9ff06f          	j	800234 <__exec+0x24>

00800240 <_start>:
  800240:	00012503          	lw	a0,0(sp)
  800244:	00410593          	addi	a1,sp,4
  800248:	1f0000ef          	jal	ra,800438 <umain>
  80024c:	0000006f          	j	80024c <_start+0xc>

00800250 <open>:
  800250:	f49ff06f          	j	800198 <sys_open>

00800254 <close>:
  800254:	f55ff06f          	j	8001a8 <sys_close>

00800258 <read>:
  800258:	f5dff06f          	j	8001b4 <sys_read>

0080025c <write>:
  80025c:	f6dff06f          	j	8001c8 <sys_write>

00800260 <dup2>:
  800260:	f7dff06f          	j	8001dc <sys_dup>

00800264 <cputch>:
  800264:	ff010113          	addi	sp,sp,-16
  800268:	00112623          	sw	ra,12(sp)
  80026c:	00812423          	sw	s0,8(sp)
  800270:	00058413          	mv	s0,a1
  800274:	f05ff0ef          	jal	ra,800178 <sys_putc>
  800278:	00042783          	lw	a5,0(s0)
  80027c:	00c12083          	lw	ra,12(sp)
  800280:	00178793          	addi	a5,a5,1
  800284:	00f42023          	sw	a5,0(s0)
  800288:	00812403          	lw	s0,8(sp)
  80028c:	01010113          	addi	sp,sp,16
  800290:	00008067          	ret

00800294 <fputch>:
  800294:	fe010113          	addi	sp,sp,-32
  800298:	00060793          	mv	a5,a2
  80029c:	00812c23          	sw	s0,24(sp)
  8002a0:	00a107a3          	sb	a0,15(sp)
  8002a4:	00058413          	mv	s0,a1
  8002a8:	00078513          	mv	a0,a5
  8002ac:	00f10593          	addi	a1,sp,15
  8002b0:	00100613          	li	a2,1
  8002b4:	00112e23          	sw	ra,28(sp)
  8002b8:	fa5ff0ef          	jal	ra,80025c <write>
  8002bc:	00042783          	lw	a5,0(s0)
  8002c0:	01c12083          	lw	ra,28(sp)
  8002c4:	00178793          	addi	a5,a5,1
  8002c8:	00f42023          	sw	a5,0(s0)
  8002cc:	01812403          	lw	s0,24(sp)
  8002d0:	02010113          	addi	sp,sp,32
  8002d4:	00008067          	ret

008002d8 <vcprintf>:
  8002d8:	fe010113          	addi	sp,sp,-32
  8002dc:	00058713          	mv	a4,a1
  8002e0:	ffff75b7          	lui	a1,0xffff7
  8002e4:	00050693          	mv	a3,a0
  8002e8:	00c10613          	addi	a2,sp,12
  8002ec:	00000517          	auipc	a0,0x0
  8002f0:	f7850513          	addi	a0,a0,-136 # 800264 <cputch>
  8002f4:	ad958593          	addi	a1,a1,-1319 # ffff6ad9 <sbi_remote_fence_i+0xffff71e9>
  8002f8:	00112e23          	sw	ra,28(sp)
  8002fc:	00012623          	sw	zero,12(sp)
  800300:	374000ef          	jal	ra,800674 <vprintfmt>
  800304:	01c12083          	lw	ra,28(sp)
  800308:	00c12503          	lw	a0,12(sp)
  80030c:	02010113          	addi	sp,sp,32
  800310:	00008067          	ret

00800314 <cprintf>:
  800314:	fc010113          	addi	sp,sp,-64
  800318:	02410313          	addi	t1,sp,36
  80031c:	02b12223          	sw	a1,36(sp)
  800320:	ffff75b7          	lui	a1,0xffff7
  800324:	02c12423          	sw	a2,40(sp)
  800328:	02d12623          	sw	a3,44(sp)
  80032c:	02e12823          	sw	a4,48(sp)
  800330:	00050693          	mv	a3,a0
  800334:	00c10613          	addi	a2,sp,12
  800338:	00000517          	auipc	a0,0x0
  80033c:	f2c50513          	addi	a0,a0,-212 # 800264 <cputch>
  800340:	00030713          	mv	a4,t1
  800344:	ad958593          	addi	a1,a1,-1319 # ffff6ad9 <sbi_remote_fence_i+0xffff71e9>
  800348:	00112e23          	sw	ra,28(sp)
  80034c:	02f12a23          	sw	a5,52(sp)
  800350:	03012c23          	sw	a6,56(sp)
  800354:	03112e23          	sw	a7,60(sp)
  800358:	00612423          	sw	t1,8(sp)
  80035c:	00012623          	sw	zero,12(sp)
  800360:	314000ef          	jal	ra,800674 <vprintfmt>
  800364:	01c12083          	lw	ra,28(sp)
  800368:	00c12503          	lw	a0,12(sp)
  80036c:	04010113          	addi	sp,sp,64
  800370:	00008067          	ret

00800374 <fprintf>:
  800374:	fc010113          	addi	sp,sp,-64
  800378:	02810313          	addi	t1,sp,40
  80037c:	02c12423          	sw	a2,40(sp)
  800380:	02d12623          	sw	a3,44(sp)
  800384:	02e12823          	sw	a4,48(sp)
  800388:	00058693          	mv	a3,a1
  80038c:	00c10613          	addi	a2,sp,12
  800390:	00050593          	mv	a1,a0
  800394:	00030713          	mv	a4,t1
  800398:	00000517          	auipc	a0,0x0
  80039c:	efc50513          	addi	a0,a0,-260 # 800294 <fputch>
  8003a0:	00112e23          	sw	ra,28(sp)
  8003a4:	02f12a23          	sw	a5,52(sp)
  8003a8:	03012c23          	sw	a6,56(sp)
  8003ac:	03112e23          	sw	a7,60(sp)
  8003b0:	00612423          	sw	t1,8(sp)
  8003b4:	00012623          	sw	zero,12(sp)
  8003b8:	2bc000ef          	jal	ra,800674 <vprintfmt>
  8003bc:	01c12083          	lw	ra,28(sp)
  8003c0:	00c12503          	lw	a0,12(sp)
  8003c4:	04010113          	addi	sp,sp,64
  8003c8:	00008067          	ret

008003cc <initfd>:
  8003cc:	ff010113          	addi	sp,sp,-16
  8003d0:	00058793          	mv	a5,a1
  8003d4:	00912223          	sw	s1,4(sp)
  8003d8:	00060593          	mv	a1,a2
  8003dc:	00050493          	mv	s1,a0
  8003e0:	00078513          	mv	a0,a5
  8003e4:	00812423          	sw	s0,8(sp)
  8003e8:	00112623          	sw	ra,12(sp)
  8003ec:	e65ff0ef          	jal	ra,800250 <open>
  8003f0:	00050413          	mv	s0,a0
  8003f4:	02054663          	bltz	a0,800420 <initfd+0x54>
  8003f8:	02950463          	beq	a0,s1,800420 <initfd+0x54>
  8003fc:	00048513          	mv	a0,s1
  800400:	e55ff0ef          	jal	ra,800254 <close>
  800404:	00048593          	mv	a1,s1
  800408:	00040513          	mv	a0,s0
  80040c:	e55ff0ef          	jal	ra,800260 <dup2>
  800410:	00050493          	mv	s1,a0
  800414:	00040513          	mv	a0,s0
  800418:	e3dff0ef          	jal	ra,800254 <close>
  80041c:	00048413          	mv	s0,s1
  800420:	00c12083          	lw	ra,12(sp)
  800424:	00040513          	mv	a0,s0
  800428:	00412483          	lw	s1,4(sp)
  80042c:	00812403          	lw	s0,8(sp)
  800430:	01010113          	addi	sp,sp,16
  800434:	00008067          	ret

00800438 <umain>:
  800438:	ff010113          	addi	sp,sp,-16
  80043c:	00812423          	sw	s0,8(sp)
  800440:	00912223          	sw	s1,4(sp)
  800444:	00050413          	mv	s0,a0
  800448:	00058493          	mv	s1,a1
  80044c:	00000613          	li	a2,0
  800450:	00001597          	auipc	a1,0x1
  800454:	fbc58593          	addi	a1,a1,-68 # 80140c <main+0x180>
  800458:	00000513          	li	a0,0
  80045c:	00112623          	sw	ra,12(sp)
  800460:	f6dff0ef          	jal	ra,8003cc <initfd>
  800464:	02054663          	bltz	a0,800490 <umain+0x58>
  800468:	00100613          	li	a2,1
  80046c:	00001597          	auipc	a1,0x1
  800470:	fd858593          	addi	a1,a1,-40 # 801444 <main+0x1b8>
  800474:	00060513          	mv	a0,a2
  800478:	f55ff0ef          	jal	ra,8003cc <initfd>
  80047c:	02054a63          	bltz	a0,8004b0 <umain+0x78>
  800480:	00048593          	mv	a1,s1
  800484:	00040513          	mv	a0,s0
  800488:	605000ef          	jal	ra,80128c <main>
  80048c:	d61ff0ef          	jal	ra,8001ec <exit>
  800490:	00050693          	mv	a3,a0
  800494:	00001617          	auipc	a2,0x1
  800498:	f8060613          	addi	a2,a2,-128 # 801414 <main+0x188>
  80049c:	01a00593          	li	a1,26
  8004a0:	00001517          	auipc	a0,0x1
  8004a4:	f9050513          	addi	a0,a0,-112 # 801430 <main+0x1a4>
  8004a8:	bd9ff0ef          	jal	ra,800080 <__warn>
  8004ac:	fbdff06f          	j	800468 <umain+0x30>
  8004b0:	00050693          	mv	a3,a0
  8004b4:	00001617          	auipc	a2,0x1
  8004b8:	f9860613          	addi	a2,a2,-104 # 80144c <main+0x1c0>
  8004bc:	01d00593          	li	a1,29
  8004c0:	00001517          	auipc	a0,0x1
  8004c4:	f7050513          	addi	a0,a0,-144 # 801430 <main+0x1a4>
  8004c8:	bb9ff0ef          	jal	ra,800080 <__warn>
  8004cc:	fb5ff06f          	j	800480 <umain+0x48>

008004d0 <strnlen>:
  8004d0:	00050693          	mv	a3,a0
  8004d4:	02058a63          	beqz	a1,800508 <strnlen+0x38>
  8004d8:	00054703          	lbu	a4,0(a0)
  8004dc:	00150793          	addi	a5,a0,1
  8004e0:	02070463          	beqz	a4,800508 <strnlen+0x38>
  8004e4:	00b505b3          	add	a1,a0,a1
  8004e8:	0100006f          	j	8004f8 <strnlen+0x28>
  8004ec:	00178793          	addi	a5,a5,1
  8004f0:	fff7c703          	lbu	a4,-1(a5)
  8004f4:	00070863          	beqz	a4,800504 <strnlen+0x34>
  8004f8:	40d78533          	sub	a0,a5,a3
  8004fc:	feb798e3          	bne	a5,a1,8004ec <strnlen+0x1c>
  800500:	00008067          	ret
  800504:	00008067          	ret
  800508:	00000513          	li	a0,0
  80050c:	00008067          	ret

00800510 <strcpy>:
  800510:	00050793          	mv	a5,a0
  800514:	00158593          	addi	a1,a1,1
  800518:	fff5c703          	lbu	a4,-1(a1)
  80051c:	00178793          	addi	a5,a5,1
  800520:	fee78fa3          	sb	a4,-1(a5)
  800524:	fe0718e3          	bnez	a4,800514 <strcpy+0x4>
  800528:	00008067          	ret

0080052c <strcmp>:
  80052c:	00054783          	lbu	a5,0(a0)
  800530:	0005c703          	lbu	a4,0(a1)
  800534:	02078263          	beqz	a5,800558 <strcmp+0x2c>
  800538:	02e79063          	bne	a5,a4,800558 <strcmp+0x2c>
  80053c:	00150513          	addi	a0,a0,1
  800540:	00054783          	lbu	a5,0(a0)
  800544:	00158693          	addi	a3,a1,1
  800548:	0015c703          	lbu	a4,1(a1)
  80054c:	00078663          	beqz	a5,800558 <strcmp+0x2c>
  800550:	00068593          	mv	a1,a3
  800554:	fee784e3          	beq	a5,a4,80053c <strcmp+0x10>
  800558:	40e78533          	sub	a0,a5,a4
  80055c:	00008067          	ret

00800560 <strchr>:
  800560:	00054783          	lbu	a5,0(a0)
  800564:	00078e63          	beqz	a5,800580 <strchr+0x20>
  800568:	00f59663          	bne	a1,a5,800574 <strchr+0x14>
  80056c:	01c0006f          	j	800588 <strchr+0x28>
  800570:	00b78a63          	beq	a5,a1,800584 <strchr+0x24>
  800574:	00150513          	addi	a0,a0,1
  800578:	00054783          	lbu	a5,0(a0)
  80057c:	fe079ae3          	bnez	a5,800570 <strchr+0x10>
  800580:	00000513          	li	a0,0
  800584:	00008067          	ret
  800588:	00008067          	ret

0080058c <printnum>:
  80058c:	fd010113          	addi	sp,sp,-48
  800590:	02912223          	sw	s1,36(sp)
  800594:	03212023          	sw	s2,32(sp)
  800598:	01312e23          	sw	s3,28(sp)
  80059c:	01412c23          	sw	s4,24(sp)
  8005a0:	01512a23          	sw	s5,20(sp)
  8005a4:	02112623          	sw	ra,44(sp)
  8005a8:	02812423          	sw	s0,40(sp)
  8005ac:	00050493          	mv	s1,a0
  8005b0:	00058993          	mv	s3,a1
  8005b4:	00060913          	mv	s2,a2
  8005b8:	03012a03          	lw	s4,48(sp)
  8005bc:	03077ab3          	remu	s5,a4,a6
  8005c0:	06079463          	bnez	a5,800628 <printnum+0x9c>
  8005c4:	07077263          	bleu	a6,a4,800628 <printnum+0x9c>
  8005c8:	fff88413          	addi	s0,a7,-1
  8005cc:	00805e63          	blez	s0,8005e8 <printnum+0x5c>
  8005d0:	fff40413          	addi	s0,s0,-1
  8005d4:	00098613          	mv	a2,s3
  8005d8:	00090593          	mv	a1,s2
  8005dc:	000a0513          	mv	a0,s4
  8005e0:	000480e7          	jalr	s1
  8005e4:	fe0416e3          	bnez	s0,8005d0 <printnum+0x44>
  8005e8:	00001797          	auipc	a5,0x1
  8005ec:	03c78793          	addi	a5,a5,60 # 801624 <error_string+0x64>
  8005f0:	015787b3          	add	a5,a5,s5
  8005f4:	00098613          	mv	a2,s3
  8005f8:	00090593          	mv	a1,s2
  8005fc:	00048313          	mv	t1,s1
  800600:	02c12083          	lw	ra,44(sp)
  800604:	02812403          	lw	s0,40(sp)
  800608:	02412483          	lw	s1,36(sp)
  80060c:	02012903          	lw	s2,32(sp)
  800610:	01c12983          	lw	s3,28(sp)
  800614:	01812a03          	lw	s4,24(sp)
  800618:	01412a83          	lw	s5,20(sp)
  80061c:	0007c503          	lbu	a0,0(a5)
  800620:	03010113          	addi	sp,sp,48
  800624:	00030067          	jr	t1
  800628:	03075733          	divu	a4,a4,a6
  80062c:	01412023          	sw	s4,0(sp)
  800630:	fff88893          	addi	a7,a7,-1
  800634:	00000793          	li	a5,0
  800638:	00090613          	mv	a2,s2
  80063c:	00098593          	mv	a1,s3
  800640:	00048513          	mv	a0,s1
  800644:	f49ff0ef          	jal	ra,80058c <printnum>
  800648:	fa1ff06f          	j	8005e8 <printnum+0x5c>

0080064c <sprintputch>:
  80064c:	0085a783          	lw	a5,8(a1)
  800650:	0005a703          	lw	a4,0(a1)
  800654:	0045a683          	lw	a3,4(a1)
  800658:	00178793          	addi	a5,a5,1
  80065c:	00f5a423          	sw	a5,8(a1)
  800660:	00d77863          	bleu	a3,a4,800670 <sprintputch+0x24>
  800664:	00170793          	addi	a5,a4,1
  800668:	00f5a023          	sw	a5,0(a1)
  80066c:	00a70023          	sb	a0,0(a4)
  800670:	00008067          	ret

00800674 <vprintfmt>:
  800674:	fa010113          	addi	sp,sp,-96
  800678:	05212823          	sw	s2,80(sp)
  80067c:	05312623          	sw	s3,76(sp)
  800680:	05412423          	sw	s4,72(sp)
  800684:	05512223          	sw	s5,68(sp)
  800688:	05612023          	sw	s6,64(sp)
  80068c:	03712e23          	sw	s7,60(sp)
  800690:	03812c23          	sw	s8,56(sp)
  800694:	03a12823          	sw	s10,48(sp)
  800698:	04112e23          	sw	ra,92(sp)
  80069c:	04812c23          	sw	s0,88(sp)
  8006a0:	04912a23          	sw	s1,84(sp)
  8006a4:	03912a23          	sw	s9,52(sp)
  8006a8:	03b12623          	sw	s11,44(sp)
  8006ac:	00050a13          	mv	s4,a0
  8006b0:	00058993          	mv	s3,a1
  8006b4:	00060913          	mv	s2,a2
  8006b8:	00068d13          	mv	s10,a3
  8006bc:	00070b13          	mv	s6,a4
  8006c0:	00001a97          	auipc	s5,0x1
  8006c4:	da8a8a93          	addi	s5,s5,-600 # 801468 <main+0x1dc>
  8006c8:	fff00b93          	li	s7,-1
  8006cc:	05e00c13          	li	s8,94
  8006d0:	000d4503          	lbu	a0,0(s10)
  8006d4:	02500493          	li	s1,37
  8006d8:	001d0413          	addi	s0,s10,1
  8006dc:	02950063          	beq	a0,s1,8006fc <vprintfmt+0x88>
  8006e0:	06050663          	beqz	a0,80074c <vprintfmt+0xd8>
  8006e4:	00098613          	mv	a2,s3
  8006e8:	00090593          	mv	a1,s2
  8006ec:	00140413          	addi	s0,s0,1
  8006f0:	000a00e7          	jalr	s4
  8006f4:	fff44503          	lbu	a0,-1(s0)
  8006f8:	fe9514e3          	bne	a0,s1,8006e0 <vprintfmt+0x6c>
  8006fc:	00044e03          	lbu	t3,0(s0)
  800700:	fff00d93          	li	s11,-1
  800704:	02000693          	li	a3,32
  800708:	00000493          	li	s1,0
  80070c:	00000593          	li	a1,0
  800710:	000d8c93          	mv	s9,s11
  800714:	05500713          	li	a4,85
  800718:	00100313          	li	t1,1
  80071c:	03000813          	li	a6,48
  800720:	00900613          	li	a2,9
  800724:	02d00513          	li	a0,45
  800728:	fdde0793          	addi	a5,t3,-35
  80072c:	0ff7f793          	andi	a5,a5,255
  800730:	00140d13          	addi	s10,s0,1
  800734:	34f76a63          	bltu	a4,a5,800a88 <vprintfmt+0x414>
  800738:	00279793          	slli	a5,a5,0x2
  80073c:	015787b3          	add	a5,a5,s5
  800740:	0007a783          	lw	a5,0(a5)
  800744:	015787b3          	add	a5,a5,s5
  800748:	00078067          	jr	a5
  80074c:	05c12083          	lw	ra,92(sp)
  800750:	05812403          	lw	s0,88(sp)
  800754:	05412483          	lw	s1,84(sp)
  800758:	05012903          	lw	s2,80(sp)
  80075c:	04c12983          	lw	s3,76(sp)
  800760:	04812a03          	lw	s4,72(sp)
  800764:	04412a83          	lw	s5,68(sp)
  800768:	04012b03          	lw	s6,64(sp)
  80076c:	03c12b83          	lw	s7,60(sp)
  800770:	03812c03          	lw	s8,56(sp)
  800774:	03412c83          	lw	s9,52(sp)
  800778:	03012d03          	lw	s10,48(sp)
  80077c:	02c12d83          	lw	s11,44(sp)
  800780:	06010113          	addi	sp,sp,96
  800784:	00008067          	ret
  800788:	00100793          	li	a5,1
  80078c:	36b7c863          	blt	a5,a1,800afc <vprintfmt+0x488>
  800790:	000b2703          	lw	a4,0(s6)
  800794:	00000793          	li	a5,0
  800798:	004b0b13          	addi	s6,s6,4
  80079c:	01000813          	li	a6,16
  8007a0:	00d12023          	sw	a3,0(sp)
  8007a4:	000c8893          	mv	a7,s9
  8007a8:	00090613          	mv	a2,s2
  8007ac:	00098593          	mv	a1,s3
  8007b0:	000a0513          	mv	a0,s4
  8007b4:	dd9ff0ef          	jal	ra,80058c <printnum>
  8007b8:	f19ff06f          	j	8006d0 <vprintfmt+0x5c>
  8007bc:	00144e03          	lbu	t3,1(s0)
  8007c0:	00030493          	mv	s1,t1
  8007c4:	000d0413          	mv	s0,s10
  8007c8:	f61ff06f          	j	800728 <vprintfmt+0xb4>
  8007cc:	000b2503          	lw	a0,0(s6)
  8007d0:	00098613          	mv	a2,s3
  8007d4:	00090593          	mv	a1,s2
  8007d8:	004b0b13          	addi	s6,s6,4
  8007dc:	000a00e7          	jalr	s4
  8007e0:	ef1ff06f          	j	8006d0 <vprintfmt+0x5c>
  8007e4:	00100793          	li	a5,1
  8007e8:	32b7c863          	blt	a5,a1,800b18 <vprintfmt+0x4a4>
  8007ec:	000b2703          	lw	a4,0(s6)
  8007f0:	004b0b13          	addi	s6,s6,4
  8007f4:	41f75793          	srai	a5,a4,0x1f
  8007f8:	00a00813          	li	a6,10
  8007fc:	fa07d2e3          	bgez	a5,8007a0 <vprintfmt+0x12c>
  800800:	00098613          	mv	a2,s3
  800804:	00090593          	mv	a1,s2
  800808:	02d00513          	li	a0,45
  80080c:	00f12e23          	sw	a5,28(sp)
  800810:	00e12c23          	sw	a4,24(sp)
  800814:	01012a23          	sw	a6,20(sp)
  800818:	00d12823          	sw	a3,16(sp)
  80081c:	000a00e7          	jalr	s4
  800820:	01812703          	lw	a4,24(sp)
  800824:	01c12783          	lw	a5,28(sp)
  800828:	01012683          	lw	a3,16(sp)
  80082c:	40e00733          	neg	a4,a4
  800830:	00e03633          	snez	a2,a4
  800834:	40f007b3          	neg	a5,a5
  800838:	40c787b3          	sub	a5,a5,a2
  80083c:	01412803          	lw	a6,20(sp)
  800840:	f61ff06f          	j	8007a0 <vprintfmt+0x12c>
  800844:	000b2783          	lw	a5,0(s6)
  800848:	01800693          	li	a3,24
  80084c:	004b0b13          	addi	s6,s6,4
  800850:	41f7d713          	srai	a4,a5,0x1f
  800854:	00f747b3          	xor	a5,a4,a5
  800858:	40e787b3          	sub	a5,a5,a4
  80085c:	2cf6ca63          	blt	a3,a5,800b30 <vprintfmt+0x4bc>
  800860:	00279693          	slli	a3,a5,0x2
  800864:	00001717          	auipc	a4,0x1
  800868:	d5c70713          	addi	a4,a4,-676 # 8015c0 <error_string>
  80086c:	00d70733          	add	a4,a4,a3
  800870:	00072703          	lw	a4,0(a4)
  800874:	2a070e63          	beqz	a4,800b30 <vprintfmt+0x4bc>
  800878:	00001697          	auipc	a3,0x1
  80087c:	f8068693          	addi	a3,a3,-128 # 8017f8 <error_string+0x238>
  800880:	00090613          	mv	a2,s2
  800884:	00098593          	mv	a1,s3
  800888:	000a0513          	mv	a0,s4
  80088c:	334000ef          	jal	ra,800bc0 <printfmt>
  800890:	e41ff06f          	j	8006d0 <vprintfmt+0x5c>
  800894:	00144e03          	lbu	t3,1(s0)
  800898:	00158593          	addi	a1,a1,1
  80089c:	000d0413          	mv	s0,s10
  8008a0:	e89ff06f          	j	800728 <vprintfmt+0xb4>
  8008a4:	00100793          	li	a5,1
  8008a8:	20b7ce63          	blt	a5,a1,800ac4 <vprintfmt+0x450>
  8008ac:	000b2703          	lw	a4,0(s6)
  8008b0:	00000793          	li	a5,0
  8008b4:	004b0b13          	addi	s6,s6,4
  8008b8:	00800813          	li	a6,8
  8008bc:	ee5ff06f          	j	8007a0 <vprintfmt+0x12c>
  8008c0:	03000513          	li	a0,48
  8008c4:	00098613          	mv	a2,s3
  8008c8:	00090593          	mv	a1,s2
  8008cc:	00d12823          	sw	a3,16(sp)
  8008d0:	000a00e7          	jalr	s4
  8008d4:	00098613          	mv	a2,s3
  8008d8:	00090593          	mv	a1,s2
  8008dc:	07800513          	li	a0,120
  8008e0:	000a00e7          	jalr	s4
  8008e4:	000b2703          	lw	a4,0(s6)
  8008e8:	00000793          	li	a5,0
  8008ec:	01000813          	li	a6,16
  8008f0:	004b0b13          	addi	s6,s6,4
  8008f4:	01012683          	lw	a3,16(sp)
  8008f8:	ea9ff06f          	j	8007a0 <vprintfmt+0x12c>
  8008fc:	000b2403          	lw	s0,0(s6)
  800900:	004b0793          	addi	a5,s6,4
  800904:	00f12a23          	sw	a5,20(sp)
  800908:	26040463          	beqz	s0,800b70 <vprintfmt+0x4fc>
  80090c:	05905463          	blez	s9,800954 <vprintfmt+0x2e0>
  800910:	02d00793          	li	a5,45
  800914:	22f68e63          	beq	a3,a5,800b50 <vprintfmt+0x4dc>
  800918:	000d8593          	mv	a1,s11
  80091c:	00040513          	mv	a0,s0
  800920:	00d12823          	sw	a3,16(sp)
  800924:	badff0ef          	jal	ra,8004d0 <strnlen>
  800928:	40ac8cb3          	sub	s9,s9,a0
  80092c:	03905463          	blez	s9,800954 <vprintfmt+0x2e0>
  800930:	01012683          	lw	a3,16(sp)
  800934:	00068513          	mv	a0,a3
  800938:	00098613          	mv	a2,s3
  80093c:	00090593          	mv	a1,s2
  800940:	00d12823          	sw	a3,16(sp)
  800944:	fffc8c93          	addi	s9,s9,-1
  800948:	000a00e7          	jalr	s4
  80094c:	01012683          	lw	a3,16(sp)
  800950:	fe0c92e3          	bnez	s9,800934 <vprintfmt+0x2c0>
  800954:	00044783          	lbu	a5,0(s0)
  800958:	00140b13          	addi	s6,s0,1
  80095c:	00078513          	mv	a0,a5
  800960:	06078063          	beqz	a5,8009c0 <vprintfmt+0x34c>
  800964:	03f00413          	li	s0,63
  800968:	000dc663          	bltz	s11,800974 <vprintfmt+0x300>
  80096c:	fffd8d93          	addi	s11,s11,-1
  800970:	037d8863          	beq	s11,s7,8009a0 <vprintfmt+0x32c>
  800974:	00098613          	mv	a2,s3
  800978:	00090593          	mv	a1,s2
  80097c:	00048663          	beqz	s1,800988 <vprintfmt+0x314>
  800980:	fe078793          	addi	a5,a5,-32
  800984:	12fc6a63          	bltu	s8,a5,800ab8 <vprintfmt+0x444>
  800988:	000a00e7          	jalr	s4
  80098c:	001b0b13          	addi	s6,s6,1
  800990:	fffb4783          	lbu	a5,-1(s6)
  800994:	fffc8c93          	addi	s9,s9,-1
  800998:	00078513          	mv	a0,a5
  80099c:	fc0796e3          	bnez	a5,800968 <vprintfmt+0x2f4>
  8009a0:	03905063          	blez	s9,8009c0 <vprintfmt+0x34c>
  8009a4:	02000413          	li	s0,32
  8009a8:	fffc8c93          	addi	s9,s9,-1
  8009ac:	00098613          	mv	a2,s3
  8009b0:	00090593          	mv	a1,s2
  8009b4:	00040513          	mv	a0,s0
  8009b8:	000a00e7          	jalr	s4
  8009bc:	fe0c96e3          	bnez	s9,8009a8 <vprintfmt+0x334>
  8009c0:	01412b03          	lw	s6,20(sp)
  8009c4:	d0dff06f          	j	8006d0 <vprintfmt+0x5c>
  8009c8:	00100793          	li	a5,1
  8009cc:	10b7ca63          	blt	a5,a1,800ae0 <vprintfmt+0x46c>
  8009d0:	000b2703          	lw	a4,0(s6)
  8009d4:	00000793          	li	a5,0
  8009d8:	004b0b13          	addi	s6,s6,4
  8009dc:	00a00813          	li	a6,10
  8009e0:	dc1ff06f          	j	8007a0 <vprintfmt+0x12c>
  8009e4:	00144e03          	lbu	t3,1(s0)
  8009e8:	00050693          	mv	a3,a0
  8009ec:	000d0413          	mv	s0,s10
  8009f0:	d39ff06f          	j	800728 <vprintfmt+0xb4>
  8009f4:	00098613          	mv	a2,s3
  8009f8:	00090593          	mv	a1,s2
  8009fc:	02500513          	li	a0,37
  800a00:	000a00e7          	jalr	s4
  800a04:	ccdff06f          	j	8006d0 <vprintfmt+0x5c>
  800a08:	000b2d83          	lw	s11,0(s6)
  800a0c:	00144e03          	lbu	t3,1(s0)
  800a10:	004b0b13          	addi	s6,s6,4
  800a14:	000d0413          	mv	s0,s10
  800a18:	d00cd8e3          	bgez	s9,800728 <vprintfmt+0xb4>
  800a1c:	000d8c93          	mv	s9,s11
  800a20:	fff00d93          	li	s11,-1
  800a24:	d05ff06f          	j	800728 <vprintfmt+0xb4>
  800a28:	00144e03          	lbu	t3,1(s0)
  800a2c:	00080693          	mv	a3,a6
  800a30:	000d0413          	mv	s0,s10
  800a34:	cf5ff06f          	j	800728 <vprintfmt+0xb4>
  800a38:	00144e83          	lbu	t4,1(s0)
  800a3c:	fd0e0d93          	addi	s11,t3,-48
  800a40:	fd0e8793          	addi	a5,t4,-48
  800a44:	14f66c63          	bltu	a2,a5,800b9c <vprintfmt+0x528>
  800a48:	000d0413          	mv	s0,s10
  800a4c:	002d9793          	slli	a5,s11,0x2
  800a50:	01b78db3          	add	s11,a5,s11
  800a54:	00140413          	addi	s0,s0,1
  800a58:	001d9d93          	slli	s11,s11,0x1
  800a5c:	01dd8db3          	add	s11,s11,t4
  800a60:	00044e83          	lbu	t4,0(s0)
  800a64:	fd0d8d93          	addi	s11,s11,-48
  800a68:	fd0e8793          	addi	a5,t4,-48
  800a6c:	fef670e3          	bleu	a5,a2,800a4c <vprintfmt+0x3d8>
  800a70:	000e8e13          	mv	t3,t4
  800a74:	fa5ff06f          	j	800a18 <vprintfmt+0x3a4>
  800a78:	0e0cc863          	bltz	s9,800b68 <vprintfmt+0x4f4>
  800a7c:	00144e03          	lbu	t3,1(s0)
  800a80:	000d0413          	mv	s0,s10
  800a84:	ca5ff06f          	j	800728 <vprintfmt+0xb4>
  800a88:	00098613          	mv	a2,s3
  800a8c:	00090593          	mv	a1,s2
  800a90:	02500513          	li	a0,37
  800a94:	000a00e7          	jalr	s4
  800a98:	fff44783          	lbu	a5,-1(s0)
  800a9c:	02500713          	li	a4,37
  800aa0:	00040d13          	mv	s10,s0
  800aa4:	c2e786e3          	beq	a5,a4,8006d0 <vprintfmt+0x5c>
  800aa8:	fffd0d13          	addi	s10,s10,-1
  800aac:	fffd4783          	lbu	a5,-1(s10)
  800ab0:	fee79ce3          	bne	a5,a4,800aa8 <vprintfmt+0x434>
  800ab4:	c1dff06f          	j	8006d0 <vprintfmt+0x5c>
  800ab8:	00040513          	mv	a0,s0
  800abc:	000a00e7          	jalr	s4
  800ac0:	ecdff06f          	j	80098c <vprintfmt+0x318>
  800ac4:	007b0793          	addi	a5,s6,7
  800ac8:	ff87f793          	andi	a5,a5,-8
  800acc:	00878b13          	addi	s6,a5,8
  800ad0:	0007a703          	lw	a4,0(a5)
  800ad4:	00800813          	li	a6,8
  800ad8:	0047a783          	lw	a5,4(a5)
  800adc:	cc5ff06f          	j	8007a0 <vprintfmt+0x12c>
  800ae0:	007b0793          	addi	a5,s6,7
  800ae4:	ff87f793          	andi	a5,a5,-8
  800ae8:	00878b13          	addi	s6,a5,8
  800aec:	0007a703          	lw	a4,0(a5)
  800af0:	00a00813          	li	a6,10
  800af4:	0047a783          	lw	a5,4(a5)
  800af8:	ca9ff06f          	j	8007a0 <vprintfmt+0x12c>
  800afc:	007b0793          	addi	a5,s6,7
  800b00:	ff87f793          	andi	a5,a5,-8
  800b04:	00878b13          	addi	s6,a5,8
  800b08:	0007a703          	lw	a4,0(a5)
  800b0c:	01000813          	li	a6,16
  800b10:	0047a783          	lw	a5,4(a5)
  800b14:	c8dff06f          	j	8007a0 <vprintfmt+0x12c>
  800b18:	007b0793          	addi	a5,s6,7
  800b1c:	ff87f793          	andi	a5,a5,-8
  800b20:	00878b13          	addi	s6,a5,8
  800b24:	0007a703          	lw	a4,0(a5)
  800b28:	0047a783          	lw	a5,4(a5)
  800b2c:	ccdff06f          	j	8007f8 <vprintfmt+0x184>
  800b30:	00078713          	mv	a4,a5
  800b34:	00001697          	auipc	a3,0x1
  800b38:	cb868693          	addi	a3,a3,-840 # 8017ec <error_string+0x22c>
  800b3c:	00090613          	mv	a2,s2
  800b40:	00098593          	mv	a1,s3
  800b44:	000a0513          	mv	a0,s4
  800b48:	078000ef          	jal	ra,800bc0 <printfmt>
  800b4c:	b85ff06f          	j	8006d0 <vprintfmt+0x5c>
  800b50:	00044783          	lbu	a5,0(s0)
  800b54:	00140b13          	addi	s6,s0,1
  800b58:	00078513          	mv	a0,a5
  800b5c:	e40784e3          	beqz	a5,8009a4 <vprintfmt+0x330>
  800b60:	03f00413          	li	s0,63
  800b64:	e05ff06f          	j	800968 <vprintfmt+0x2f4>
  800b68:	00000c93          	li	s9,0
  800b6c:	f11ff06f          	j	800a7c <vprintfmt+0x408>
  800b70:	03905c63          	blez	s9,800ba8 <vprintfmt+0x534>
  800b74:	02d00793          	li	a5,45
  800b78:	00001417          	auipc	s0,0x1
  800b7c:	c6c40413          	addi	s0,s0,-916 # 8017e4 <error_string+0x224>
  800b80:	d8f69ce3          	bne	a3,a5,800918 <vprintfmt+0x2a4>
  800b84:	02800513          	li	a0,40
  800b88:	00001b17          	auipc	s6,0x1
  800b8c:	c5db0b13          	addi	s6,s6,-931 # 8017e5 <error_string+0x225>
  800b90:	00050793          	mv	a5,a0
  800b94:	03f00413          	li	s0,63
  800b98:	dd1ff06f          	j	800968 <vprintfmt+0x2f4>
  800b9c:	000e8e13          	mv	t3,t4
  800ba0:	000d0413          	mv	s0,s10
  800ba4:	e75ff06f          	j	800a18 <vprintfmt+0x3a4>
  800ba8:	02800793          	li	a5,40
  800bac:	00078513          	mv	a0,a5
  800bb0:	00001b17          	auipc	s6,0x1
  800bb4:	c35b0b13          	addi	s6,s6,-971 # 8017e5 <error_string+0x225>
  800bb8:	03f00413          	li	s0,63
  800bbc:	dadff06f          	j	800968 <vprintfmt+0x2f4>

00800bc0 <printfmt>:
  800bc0:	fd010113          	addi	sp,sp,-48
  800bc4:	02010313          	addi	t1,sp,32
  800bc8:	02e12023          	sw	a4,32(sp)
  800bcc:	00030713          	mv	a4,t1
  800bd0:	00112e23          	sw	ra,28(sp)
  800bd4:	02f12223          	sw	a5,36(sp)
  800bd8:	03012423          	sw	a6,40(sp)
  800bdc:	03112623          	sw	a7,44(sp)
  800be0:	00612623          	sw	t1,12(sp)
  800be4:	a91ff0ef          	jal	ra,800674 <vprintfmt>
  800be8:	01c12083          	lw	ra,28(sp)
  800bec:	03010113          	addi	sp,sp,48
  800bf0:	00008067          	ret

00800bf4 <vsnprintf>:
  800bf4:	fff58593          	addi	a1,a1,-1
  800bf8:	fe010113          	addi	sp,sp,-32
  800bfc:	00b505b3          	add	a1,a0,a1
  800c00:	00112e23          	sw	ra,28(sp)
  800c04:	00a12223          	sw	a0,4(sp)
  800c08:	00b12423          	sw	a1,8(sp)
  800c0c:	00012623          	sw	zero,12(sp)
  800c10:	04050463          	beqz	a0,800c58 <vsnprintf+0x64>
  800c14:	00050793          	mv	a5,a0
  800c18:	ffd00513          	li	a0,-3
  800c1c:	02f5e863          	bltu	a1,a5,800c4c <vsnprintf+0x58>
  800c20:	ffff75b7          	lui	a1,0xffff7
  800c24:	00068713          	mv	a4,a3
  800c28:	00000517          	auipc	a0,0x0
  800c2c:	a2450513          	addi	a0,a0,-1500 # 80064c <sprintputch>
  800c30:	00060693          	mv	a3,a2
  800c34:	ad958593          	addi	a1,a1,-1319 # ffff6ad9 <sbi_remote_fence_i+0xffff71e9>
  800c38:	00410613          	addi	a2,sp,4
  800c3c:	a39ff0ef          	jal	ra,800674 <vprintfmt>
  800c40:	00412783          	lw	a5,4(sp)
  800c44:	00078023          	sb	zero,0(a5)
  800c48:	00c12503          	lw	a0,12(sp)
  800c4c:	01c12083          	lw	ra,28(sp)
  800c50:	02010113          	addi	sp,sp,32
  800c54:	00008067          	ret
  800c58:	ffd00513          	li	a0,-3
  800c5c:	ff1ff06f          	j	800c4c <vsnprintf+0x58>

00800c60 <snprintf>:
  800c60:	fc010113          	addi	sp,sp,-64
  800c64:	02c10313          	addi	t1,sp,44
  800c68:	02d12623          	sw	a3,44(sp)
  800c6c:	00030693          	mv	a3,t1
  800c70:	00112e23          	sw	ra,28(sp)
  800c74:	02e12823          	sw	a4,48(sp)
  800c78:	02f12a23          	sw	a5,52(sp)
  800c7c:	03012c23          	sw	a6,56(sp)
  800c80:	03112e23          	sw	a7,60(sp)
  800c84:	00612623          	sw	t1,12(sp)
  800c88:	f6dff0ef          	jal	ra,800bf4 <vsnprintf>
  800c8c:	01c12083          	lw	ra,28(sp)
  800c90:	04010113          	addi	sp,sp,64
  800c94:	00008067          	ret

00800c98 <gettoken>:
  800c98:	fe010113          	addi	sp,sp,-32
  800c9c:	00812c23          	sw	s0,24(sp)
  800ca0:	00052403          	lw	s0,0(a0)
  800ca4:	00112e23          	sw	ra,28(sp)
  800ca8:	00912a23          	sw	s1,20(sp)
  800cac:	01212823          	sw	s2,16(sp)
  800cb0:	01312623          	sw	s3,12(sp)
  800cb4:	01412423          	sw	s4,8(sp)
  800cb8:	01512223          	sw	s5,4(sp)
  800cbc:	01612023          	sw	s6,0(sp)
  800cc0:	02040e63          	beqz	s0,800cfc <gettoken+0x64>
  800cc4:	00058993          	mv	s3,a1
  800cc8:	00050a13          	mv	s4,a0
  800ccc:	00001917          	auipc	s2,0x1
  800cd0:	b3090913          	addi	s2,s2,-1232 # 8017fc <error_string+0x23c>
  800cd4:	00c0006f          	j	800ce0 <gettoken+0x48>
  800cd8:	00140413          	addi	s0,s0,1
  800cdc:	fe040fa3          	sb	zero,-1(s0)
  800ce0:	00044583          	lbu	a1,0(s0)
  800ce4:	00090513          	mv	a0,s2
  800ce8:	879ff0ef          	jal	ra,800560 <strchr>
  800cec:	00050493          	mv	s1,a0
  800cf0:	fe0514e3          	bnez	a0,800cd8 <gettoken+0x40>
  800cf4:	00044783          	lbu	a5,0(s0)
  800cf8:	02079863          	bnez	a5,800d28 <gettoken+0x90>
  800cfc:	00000513          	li	a0,0
  800d00:	01c12083          	lw	ra,28(sp)
  800d04:	01812403          	lw	s0,24(sp)
  800d08:	01412483          	lw	s1,20(sp)
  800d0c:	01012903          	lw	s2,16(sp)
  800d10:	00c12983          	lw	s3,12(sp)
  800d14:	00812a03          	lw	s4,8(sp)
  800d18:	00412a83          	lw	s5,4(sp)
  800d1c:	00012b03          	lw	s6,0(sp)
  800d20:	02010113          	addi	sp,sp,32
  800d24:	00008067          	ret
  800d28:	0089a023          	sw	s0,0(s3)
  800d2c:	00044583          	lbu	a1,0(s0)
  800d30:	00001517          	auipc	a0,0x1
  800d34:	ad850513          	addi	a0,a0,-1320 # 801808 <error_string+0x248>
  800d38:	829ff0ef          	jal	ra,800560 <strchr>
  800d3c:	02050263          	beqz	a0,800d60 <gettoken+0xc8>
  800d40:	00044503          	lbu	a0,0(s0)
  800d44:	00140793          	addi	a5,s0,1
  800d48:	00040023          	sb	zero,0(s0)
  800d4c:	0007c703          	lbu	a4,0(a5)
  800d50:	00070463          	beqz	a4,800d58 <gettoken+0xc0>
  800d54:	00078493          	mv	s1,a5
  800d58:	009a2023          	sw	s1,0(s4)
  800d5c:	fa5ff06f          	j	800d00 <gettoken+0x68>
  800d60:	00044583          	lbu	a1,0(s0)
  800d64:	00000913          	li	s2,0
  800d68:	00001a97          	auipc	s5,0x1
  800d6c:	a9ca8a93          	addi	s5,s5,-1380 # 801804 <error_string+0x244>
  800d70:	02200993          	li	s3,34
  800d74:	02000b13          	li	s6,32
  800d78:	00058e63          	beqz	a1,800d94 <gettoken+0xfc>
  800d7c:	02090463          	beqz	s2,800da4 <gettoken+0x10c>
  800d80:	00044783          	lbu	a5,0(s0)
  800d84:	03378c63          	beq	a5,s3,800dbc <gettoken+0x124>
  800d88:	00140413          	addi	s0,s0,1
  800d8c:	00044583          	lbu	a1,0(s0)
  800d90:	fe0596e3          	bnez	a1,800d7c <gettoken+0xe4>
  800d94:	00000493          	li	s1,0
  800d98:	07700513          	li	a0,119
  800d9c:	009a2023          	sw	s1,0(s4)
  800da0:	f61ff06f          	j	800d00 <gettoken+0x68>
  800da4:	000a8513          	mv	a0,s5
  800da8:	fb8ff0ef          	jal	ra,800560 <strchr>
  800dac:	fc050ae3          	beqz	a0,800d80 <gettoken+0xe8>
  800db0:	00040793          	mv	a5,s0
  800db4:	07700513          	li	a0,119
  800db8:	f95ff06f          	j	800d4c <gettoken+0xb4>
  800dbc:	01640023          	sb	s6,0(s0)
  800dc0:	00194913          	xori	s2,s2,1
  800dc4:	fc5ff06f          	j	800d88 <gettoken+0xf0>

00800dc8 <readline>:
  800dc8:	fc010113          	addi	sp,sp,-64
  800dcc:	02112e23          	sw	ra,60(sp)
  800dd0:	02812c23          	sw	s0,56(sp)
  800dd4:	02912a23          	sw	s1,52(sp)
  800dd8:	03212823          	sw	s2,48(sp)
  800ddc:	03312623          	sw	s3,44(sp)
  800de0:	03412423          	sw	s4,40(sp)
  800de4:	03512223          	sw	s5,36(sp)
  800de8:	03612023          	sw	s6,32(sp)
  800dec:	01712e23          	sw	s7,28(sp)
  800df0:	00050c63          	beqz	a0,800e08 <readline+0x40>
  800df4:	00050613          	mv	a2,a0
  800df8:	00001597          	auipc	a1,0x1
  800dfc:	a0058593          	addi	a1,a1,-1536 # 8017f8 <error_string+0x238>
  800e00:	00100513          	li	a0,1
  800e04:	d70ff0ef          	jal	ra,800374 <fprintf>
  800e08:	000019b7          	lui	s3,0x1
  800e0c:	00000413          	li	s0,0
  800e10:	00300493          	li	s1,3
  800e14:	01f00913          	li	s2,31
  800e18:	00d00a93          	li	s5,13
  800e1c:	00800a13          	li	s4,8
  800e20:	00a00b13          	li	s6,10
  800e24:	ffe98993          	addi	s3,s3,-2 # ffe <__panic-0x7ff022>
  800e28:	00003b97          	auipc	s7,0x3
  800e2c:	1d8b8b93          	addi	s7,s7,472 # 804000 <buffer.1110>
  800e30:	00100613          	li	a2,1
  800e34:	00f10593          	addi	a1,sp,15
  800e38:	00000513          	li	a0,0
  800e3c:	c1cff0ef          	jal	ra,800258 <read>
  800e40:	0a054263          	bltz	a0,800ee4 <readline+0x11c>
  800e44:	0c050c63          	beqz	a0,800f1c <readline+0x154>
  800e48:	00f14603          	lbu	a2,15(sp)
  800e4c:	08960c63          	beq	a2,s1,800ee4 <readline+0x11c>
  800e50:	08c97e63          	bleu	a2,s2,800eec <readline+0x124>
  800e54:	0489de63          	ble	s0,s3,800eb0 <readline+0xe8>
  800e58:	fd561ce3          	bne	a2,s5,800e30 <readline+0x68>
  800e5c:	00001597          	auipc	a1,0x1
  800e60:	a1058593          	addi	a1,a1,-1520 # 80186c <error_string+0x2ac>
  800e64:	00100513          	li	a0,1
  800e68:	d0cff0ef          	jal	ra,800374 <fprintf>
  800e6c:	00003797          	auipc	a5,0x3
  800e70:	19478793          	addi	a5,a5,404 # 804000 <buffer.1110>
  800e74:	008787b3          	add	a5,a5,s0
  800e78:	00078023          	sb	zero,0(a5)
  800e7c:	00003517          	auipc	a0,0x3
  800e80:	18450513          	addi	a0,a0,388 # 804000 <buffer.1110>
  800e84:	03c12083          	lw	ra,60(sp)
  800e88:	03812403          	lw	s0,56(sp)
  800e8c:	03412483          	lw	s1,52(sp)
  800e90:	03012903          	lw	s2,48(sp)
  800e94:	02c12983          	lw	s3,44(sp)
  800e98:	02812a03          	lw	s4,40(sp)
  800e9c:	02412a83          	lw	s5,36(sp)
  800ea0:	02012b03          	lw	s6,32(sp)
  800ea4:	01c12b83          	lw	s7,28(sp)
  800ea8:	04010113          	addi	sp,sp,64
  800eac:	00008067          	ret
  800eb0:	00001597          	auipc	a1,0x1
  800eb4:	9bc58593          	addi	a1,a1,-1604 # 80186c <error_string+0x2ac>
  800eb8:	00100513          	li	a0,1
  800ebc:	cb8ff0ef          	jal	ra,800374 <fprintf>
  800ec0:	00f14703          	lbu	a4,15(sp)
  800ec4:	008b87b3          	add	a5,s7,s0
  800ec8:	00100613          	li	a2,1
  800ecc:	00f10593          	addi	a1,sp,15
  800ed0:	00000513          	li	a0,0
  800ed4:	00e78023          	sb	a4,0(a5)
  800ed8:	00140413          	addi	s0,s0,1
  800edc:	b7cff0ef          	jal	ra,800258 <read>
  800ee0:	f60552e3          	bgez	a0,800e44 <readline+0x7c>
  800ee4:	00000513          	li	a0,0
  800ee8:	f9dff06f          	j	800e84 <readline+0xbc>
  800eec:	03461263          	bne	a2,s4,800f10 <readline+0x148>
  800ef0:	f40400e3          	beqz	s0,800e30 <readline+0x68>
  800ef4:	000a0613          	mv	a2,s4
  800ef8:	00001597          	auipc	a1,0x1
  800efc:	97458593          	addi	a1,a1,-1676 # 80186c <error_string+0x2ac>
  800f00:	00100513          	li	a0,1
  800f04:	c70ff0ef          	jal	ra,800374 <fprintf>
  800f08:	fff40413          	addi	s0,s0,-1
  800f0c:	f25ff06f          	j	800e30 <readline+0x68>
  800f10:	f56606e3          	beq	a2,s6,800e5c <readline+0x94>
  800f14:	f1561ee3          	bne	a2,s5,800e30 <readline+0x68>
  800f18:	f45ff06f          	j	800e5c <readline+0x94>
  800f1c:	f40418e3          	bnez	s0,800e6c <readline+0xa4>
  800f20:	00000513          	li	a0,0
  800f24:	f61ff06f          	j	800e84 <readline+0xbc>

00800f28 <reopen>:
  800f28:	ff010113          	addi	sp,sp,-16
  800f2c:	00112623          	sw	ra,12(sp)
  800f30:	00812423          	sw	s0,8(sp)
  800f34:	00912223          	sw	s1,4(sp)
  800f38:	00058413          	mv	s0,a1
  800f3c:	01212023          	sw	s2,0(sp)
  800f40:	00050493          	mv	s1,a0
  800f44:	00060913          	mv	s2,a2
  800f48:	b0cff0ef          	jal	ra,800254 <close>
  800f4c:	00040513          	mv	a0,s0
  800f50:	00090593          	mv	a1,s2
  800f54:	afcff0ef          	jal	ra,800250 <open>
  800f58:	00050413          	mv	s0,a0
  800f5c:	02054663          	bltz	a0,800f88 <reopen+0x60>
  800f60:	02a48463          	beq	s1,a0,800f88 <reopen+0x60>
  800f64:	00048513          	mv	a0,s1
  800f68:	aecff0ef          	jal	ra,800254 <close>
  800f6c:	00048593          	mv	a1,s1
  800f70:	00040513          	mv	a0,s0
  800f74:	aecff0ef          	jal	ra,800260 <dup2>
  800f78:	00050493          	mv	s1,a0
  800f7c:	00040513          	mv	a0,s0
  800f80:	ad4ff0ef          	jal	ra,800254 <close>
  800f84:	00048413          	mv	s0,s1
  800f88:	00040513          	mv	a0,s0
  800f8c:	00805463          	blez	s0,800f94 <reopen+0x6c>
  800f90:	00000513          	li	a0,0
  800f94:	00c12083          	lw	ra,12(sp)
  800f98:	00812403          	lw	s0,8(sp)
  800f9c:	00412483          	lw	s1,4(sp)
  800fa0:	00012903          	lw	s2,0(sp)
  800fa4:	01010113          	addi	sp,sp,16
  800fa8:	00008067          	ret

00800fac <testfile>:
  800fac:	ff010113          	addi	sp,sp,-16
  800fb0:	00000593          	li	a1,0
  800fb4:	00112623          	sw	ra,12(sp)
  800fb8:	a98ff0ef          	jal	ra,800250 <open>
  800fbc:	00050793          	mv	a5,a0
  800fc0:	00054663          	bltz	a0,800fcc <testfile+0x20>
  800fc4:	a90ff0ef          	jal	ra,800254 <close>
  800fc8:	00000793          	li	a5,0
  800fcc:	00c12083          	lw	ra,12(sp)
  800fd0:	00078513          	mv	a0,a5
  800fd4:	01010113          	addi	sp,sp,16
  800fd8:	00008067          	ret

00800fdc <runcmd>:
  800fdc:	f3010113          	addi	sp,sp,-208
  800fe0:	0d212023          	sw	s2,192(sp)
  800fe4:	0b512a23          	sw	s5,180(sp)
  800fe8:	0b612823          	sw	s6,176(sp)
  800fec:	0b712623          	sw	s7,172(sp)
  800ff0:	0c112623          	sw	ra,204(sp)
  800ff4:	0c812423          	sw	s0,200(sp)
  800ff8:	0c912223          	sw	s1,196(sp)
  800ffc:	0b312e23          	sw	s3,188(sp)
  801000:	0b412c23          	sw	s4,184(sp)
  801004:	00a12623          	sw	a0,12(sp)
  801008:	07700913          	li	s2,119
  80100c:	02000b93          	li	s7,32
  801010:	07c00a93          	li	s5,124
  801014:	03e00b13          	li	s6,62
  801018:	00000493          	li	s1,0
  80101c:	03c00413          	li	s0,60
  801020:	01600a13          	li	s4,22
  801024:	00100993          	li	s3,1
  801028:	01810593          	addi	a1,sp,24
  80102c:	00c10513          	addi	a0,sp,12
  801030:	c69ff0ef          	jal	ra,800c98 <gettoken>
  801034:	16850c63          	beq	a0,s0,8011ac <runcmd+0x1d0>
  801038:	04a45c63          	ble	a0,s0,801090 <runcmd+0xb4>
  80103c:	15250263          	beq	a0,s2,801180 <runcmd+0x1a4>
  801040:	11550463          	beq	a0,s5,801148 <runcmd+0x16c>
  801044:	07650a63          	beq	a0,s6,8010b8 <runcmd+0xdc>
  801048:	00050613          	mv	a2,a0
  80104c:	00001597          	auipc	a1,0x1
  801050:	8a458593          	addi	a1,a1,-1884 # 8018f0 <error_string+0x330>
  801054:	00100513          	li	a0,1
  801058:	b1cff0ef          	jal	ra,800374 <fprintf>
  80105c:	fff00493          	li	s1,-1
  801060:	0cc12083          	lw	ra,204(sp)
  801064:	00048513          	mv	a0,s1
  801068:	0c812403          	lw	s0,200(sp)
  80106c:	0c412483          	lw	s1,196(sp)
  801070:	0c012903          	lw	s2,192(sp)
  801074:	0bc12983          	lw	s3,188(sp)
  801078:	0b812a03          	lw	s4,184(sp)
  80107c:	0b412a83          	lw	s5,180(sp)
  801080:	0b012b03          	lw	s6,176(sp)
  801084:	0ac12b83          	lw	s7,172(sp)
  801088:	0d010113          	addi	sp,sp,208
  80108c:	00008067          	ret
  801090:	08050063          	beqz	a0,801110 <runcmd+0x134>
  801094:	03b00793          	li	a5,59
  801098:	faf518e3          	bne	a0,a5,801048 <runcmd+0x6c>
  80109c:	96cff0ef          	jal	ra,800208 <fork>
  8010a0:	00050793          	mv	a5,a0
  8010a4:	06050663          	beqz	a0,801110 <runcmd+0x134>
  8010a8:	18054a63          	bltz	a0,80123c <runcmd+0x260>
  8010ac:	00000593          	li	a1,0
  8010b0:	95cff0ef          	jal	ra,80020c <waitpid>
  8010b4:	f65ff06f          	j	801018 <runcmd+0x3c>
  8010b8:	01810593          	addi	a1,sp,24
  8010bc:	00c10513          	addi	a0,sp,12
  8010c0:	bd9ff0ef          	jal	ra,800c98 <gettoken>
  8010c4:	1b251863          	bne	a0,s2,801274 <runcmd+0x298>
  8010c8:	01812583          	lw	a1,24(sp)
  8010cc:	000a0613          	mv	a2,s4
  8010d0:	00098513          	mv	a0,s3
  8010d4:	e55ff0ef          	jal	ra,800f28 <reopen>
  8010d8:	f40508e3          	beqz	a0,801028 <runcmd+0x4c>
  8010dc:	00050493          	mv	s1,a0
  8010e0:	f81ff06f          	j	801060 <runcmd+0x84>
  8010e4:	14054c63          	bltz	a0,80123c <runcmd+0x260>
  8010e8:	00100513          	li	a0,1
  8010ec:	968ff0ef          	jal	ra,800254 <close>
  8010f0:	00100593          	li	a1,1
  8010f4:	00000513          	li	a0,0
  8010f8:	968ff0ef          	jal	ra,800260 <dup2>
  8010fc:	fe0540e3          	bltz	a0,8010dc <runcmd+0x100>
  801100:	00000513          	li	a0,0
  801104:	950ff0ef          	jal	ra,800254 <close>
  801108:	00000513          	li	a0,0
  80110c:	948ff0ef          	jal	ra,800254 <close>
  801110:	f40488e3          	beqz	s1,801060 <runcmd+0x84>
  801114:	01c12503          	lw	a0,28(sp)
  801118:	00001597          	auipc	a1,0x1
  80111c:	80058593          	addi	a1,a1,-2048 # 801918 <error_string+0x358>
  801120:	c0cff0ef          	jal	ra,80052c <strcmp>
  801124:	0a051a63          	bnez	a0,8011d8 <runcmd+0x1fc>
  801128:	00200793          	li	a5,2
  80112c:	10f49463          	bne	s1,a5,801234 <runcmd+0x258>
  801130:	02012583          	lw	a1,32(sp)
  801134:	00001517          	auipc	a0,0x1
  801138:	ecc50513          	addi	a0,a0,-308 # 802000 <shcwd>
  80113c:	00000493          	li	s1,0
  801140:	bd0ff0ef          	jal	ra,800510 <strcpy>
  801144:	f1dff06f          	j	801060 <runcmd+0x84>
  801148:	8c0ff0ef          	jal	ra,800208 <fork>
  80114c:	00050793          	mv	a5,a0
  801150:	f8051ae3          	bnez	a0,8010e4 <runcmd+0x108>
  801154:	900ff0ef          	jal	ra,800254 <close>
  801158:	00000593          	li	a1,0
  80115c:	00000513          	li	a0,0
  801160:	900ff0ef          	jal	ra,800260 <dup2>
  801164:	00050493          	mv	s1,a0
  801168:	ee054ce3          	bltz	a0,801060 <runcmd+0x84>
  80116c:	00000513          	li	a0,0
  801170:	8e4ff0ef          	jal	ra,800254 <close>
  801174:	00000513          	li	a0,0
  801178:	8dcff0ef          	jal	ra,800254 <close>
  80117c:	e9dff06f          	j	801018 <runcmd+0x3c>
  801180:	0d748263          	beq	s1,s7,801244 <runcmd+0x268>
  801184:	00249793          	slli	a5,s1,0x2
  801188:	0a010713          	addi	a4,sp,160
  80118c:	00f707b3          	add	a5,a4,a5
  801190:	01812703          	lw	a4,24(sp)
  801194:	01810593          	addi	a1,sp,24
  801198:	00c10513          	addi	a0,sp,12
  80119c:	f6e7ae23          	sw	a4,-132(a5)
  8011a0:	00148493          	addi	s1,s1,1
  8011a4:	af5ff0ef          	jal	ra,800c98 <gettoken>
  8011a8:	e88518e3          	bne	a0,s0,801038 <runcmd+0x5c>
  8011ac:	01810593          	addi	a1,sp,24
  8011b0:	00c10513          	addi	a0,sp,12
  8011b4:	ae5ff0ef          	jal	ra,800c98 <gettoken>
  8011b8:	0b251263          	bne	a0,s2,80125c <runcmd+0x280>
  8011bc:	01812583          	lw	a1,24(sp)
  8011c0:	00000613          	li	a2,0
  8011c4:	00000513          	li	a0,0
  8011c8:	d61ff0ef          	jal	ra,800f28 <reopen>
  8011cc:	e4050ee3          	beqz	a0,801028 <runcmd+0x4c>
  8011d0:	00050493          	mv	s1,a0
  8011d4:	e8dff06f          	j	801060 <runcmd+0x84>
  8011d8:	01c12503          	lw	a0,28(sp)
  8011dc:	dd1ff0ef          	jal	ra,800fac <testfile>
  8011e0:	02050863          	beqz	a0,801210 <runcmd+0x234>
  8011e4:	ff000793          	li	a5,-16
  8011e8:	eef51ae3          	bne	a0,a5,8010dc <runcmd+0x100>
  8011ec:	01c12683          	lw	a3,28(sp)
  8011f0:	00002417          	auipc	s0,0x2
  8011f4:	e1040413          	addi	s0,s0,-496 # 803000 <argv0.1133>
  8011f8:	00000617          	auipc	a2,0x0
  8011fc:	72460613          	addi	a2,a2,1828 # 80191c <error_string+0x35c>
  801200:	000015b7          	lui	a1,0x1
  801204:	00040513          	mv	a0,s0
  801208:	a59ff0ef          	jal	ra,800c60 <snprintf>
  80120c:	00812e23          	sw	s0,28(sp)
  801210:	00249793          	slli	a5,s1,0x2
  801214:	0a010713          	addi	a4,sp,160
  801218:	00f707b3          	add	a5,a4,a5
  80121c:	01c10593          	addi	a1,sp,28
  801220:	00000513          	li	a0,0
  801224:	f607ae23          	sw	zero,-132(a5)
  801228:	fe9fe0ef          	jal	ra,800210 <__exec>
  80122c:	00050493          	mv	s1,a0
  801230:	e31ff06f          	j	801060 <runcmd+0x84>
  801234:	fff00493          	li	s1,-1
  801238:	e29ff06f          	j	801060 <runcmd+0x84>
  80123c:	00078493          	mv	s1,a5
  801240:	e21ff06f          	j	801060 <runcmd+0x84>
  801244:	00000597          	auipc	a1,0x0
  801248:	62c58593          	addi	a1,a1,1580 # 801870 <error_string+0x2b0>
  80124c:	00100513          	li	a0,1
  801250:	924ff0ef          	jal	ra,800374 <fprintf>
  801254:	fff00493          	li	s1,-1
  801258:	e09ff06f          	j	801060 <runcmd+0x84>
  80125c:	00000597          	auipc	a1,0x0
  801260:	63458593          	addi	a1,a1,1588 # 801890 <error_string+0x2d0>
  801264:	00100513          	li	a0,1
  801268:	90cff0ef          	jal	ra,800374 <fprintf>
  80126c:	fff00493          	li	s1,-1
  801270:	df1ff06f          	j	801060 <runcmd+0x84>
  801274:	00000597          	auipc	a1,0x0
  801278:	64c58593          	addi	a1,a1,1612 # 8018c0 <error_string+0x300>
  80127c:	00100513          	li	a0,1
  801280:	8f4ff0ef          	jal	ra,800374 <fprintf>
  801284:	fff00493          	li	s1,-1
  801288:	dd9ff06f          	j	801060 <runcmd+0x84>

0080128c <main>:
  80128c:	fd010113          	addi	sp,sp,-48
  801290:	02812423          	sw	s0,40(sp)
  801294:	02912223          	sw	s1,36(sp)
  801298:	00050413          	mv	s0,a0
  80129c:	00058493          	mv	s1,a1
  8012a0:	00100513          	li	a0,1
  8012a4:	00000597          	auipc	a1,0x0
  8012a8:	56c58593          	addi	a1,a1,1388 # 801810 <error_string+0x250>
  8012ac:	02112623          	sw	ra,44(sp)
  8012b0:	03212023          	sw	s2,32(sp)
  8012b4:	01312e23          	sw	s3,28(sp)
  8012b8:	01412c23          	sw	s4,24(sp)
  8012bc:	8b8ff0ef          	jal	ra,800374 <fprintf>
  8012c0:	00200793          	li	a5,2
  8012c4:	08f40a63          	beq	s0,a5,801358 <main+0xcc>
  8012c8:	00000497          	auipc	s1,0x0
  8012cc:	56048493          	addi	s1,s1,1376 # 801828 <error_string+0x268>
  8012d0:	0a87cc63          	blt	a5,s0,801388 <main+0xfc>
  8012d4:	00001917          	auipc	s2,0x1
  8012d8:	d2c90913          	addi	s2,s2,-724 # 802000 <shcwd>
  8012dc:	00000a17          	auipc	s4,0x0
  8012e0:	580a0a13          	addi	s4,s4,1408 # 80185c <error_string+0x29c>
  8012e4:	00100993          	li	s3,1
  8012e8:	0200006f          	j	801308 <main+0x7c>
  8012ec:	00090023          	sb	zero,0(s2)
  8012f0:	f19fe0ef          	jal	ra,800208 <fork>
  8012f4:	08050263          	beqz	a0,801378 <main+0xec>
  8012f8:	0a054463          	bltz	a0,8013a0 <main+0x114>
  8012fc:	00c10593          	addi	a1,sp,12
  801300:	f0dfe0ef          	jal	ra,80020c <waitpid>
  801304:	02050c63          	beqz	a0,80133c <main+0xb0>
  801308:	00048513          	mv	a0,s1
  80130c:	abdff0ef          	jal	ra,800dc8 <readline>
  801310:	00050413          	mv	s0,a0
  801314:	fc051ce3          	bnez	a0,8012ec <main+0x60>
  801318:	00000513          	li	a0,0
  80131c:	02c12083          	lw	ra,44(sp)
  801320:	02812403          	lw	s0,40(sp)
  801324:	02412483          	lw	s1,36(sp)
  801328:	02012903          	lw	s2,32(sp)
  80132c:	01c12983          	lw	s3,28(sp)
  801330:	01812a03          	lw	s4,24(sp)
  801334:	03010113          	addi	sp,sp,48
  801338:	00008067          	ret
  80133c:	00c12683          	lw	a3,12(sp)
  801340:	fc0684e3          	beqz	a3,801308 <main+0x7c>
  801344:	00068613          	mv	a2,a3
  801348:	000a0593          	mv	a1,s4
  80134c:	00098513          	mv	a0,s3
  801350:	824ff0ef          	jal	ra,800374 <fprintf>
  801354:	fb5ff06f          	j	801308 <main+0x7c>
  801358:	0044a583          	lw	a1,4(s1)
  80135c:	00000613          	li	a2,0
  801360:	00000513          	li	a0,0
  801364:	bc5ff0ef          	jal	ra,800f28 <reopen>
  801368:	00a12623          	sw	a0,12(sp)
  80136c:	00000493          	li	s1,0
  801370:	f60502e3          	beqz	a0,8012d4 <main+0x48>
  801374:	fa9ff06f          	j	80131c <main+0x90>
  801378:	00040513          	mv	a0,s0
  80137c:	c61ff0ef          	jal	ra,800fdc <runcmd>
  801380:	00a12623          	sw	a0,12(sp)
  801384:	e69fe0ef          	jal	ra,8001ec <exit>
  801388:	00000597          	auipc	a1,0x0
  80138c:	59858593          	addi	a1,a1,1432 # 801920 <error_string+0x360>
  801390:	00100513          	li	a0,1
  801394:	fe1fe0ef          	jal	ra,800374 <fprintf>
  801398:	fff00513          	li	a0,-1
  80139c:	f81ff06f          	j	80131c <main+0x90>
  8013a0:	00000697          	auipc	a3,0x0
  8013a4:	48c68693          	addi	a3,a3,1164 # 80182c <error_string+0x26c>
  8013a8:	00000617          	auipc	a2,0x0
  8013ac:	49060613          	addi	a2,a2,1168 # 801838 <error_string+0x278>
  8013b0:	0f200593          	li	a1,242
  8013b4:	00000517          	auipc	a0,0x0
  8013b8:	49c50513          	addi	a0,a0,1180 # 801850 <error_string+0x290>
  8013bc:	c65fe0ef          	jal	ra,800020 <__panic>
