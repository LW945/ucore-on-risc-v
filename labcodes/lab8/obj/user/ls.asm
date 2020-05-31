
obj/__user_ls.out:     file format elf32-littleriscv


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
  800040:	f0850513          	addi	a0,a0,-248 # 800f44 <main+0xa0>
  800044:	00112e23          	sw	ra,28(sp)
  800048:	02d12623          	sw	a3,44(sp)
  80004c:	02e12823          	sw	a4,48(sp)
  800050:	03012c23          	sw	a6,56(sp)
  800054:	03112e23          	sw	a7,60(sp)
  800058:	00f12623          	sw	a5,12(sp)
  80005c:	200000ef          	jal	ra,80025c <cprintf>
  800060:	00c12583          	lw	a1,12(sp)
  800064:	00040513          	mv	a0,s0
  800068:	1b8000ef          	jal	ra,800220 <vcprintf>
  80006c:	00001517          	auipc	a0,0x1
  800070:	f2850513          	addi	a0,a0,-216 # 800f94 <main+0xf0>
  800074:	1e8000ef          	jal	ra,80025c <cprintf>
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

00800100 <sys_putc>:
  800100:	00050593          	mv	a1,a0
  800104:	01e00513          	li	a0,30
  800108:	f81ff06f          	j	800088 <syscall>

0080010c <sys_open>:
  80010c:	00058613          	mv	a2,a1
  800110:	00050593          	mv	a1,a0
  800114:	06400513          	li	a0,100
  800118:	f71ff06f          	j	800088 <syscall>

0080011c <sys_close>:
  80011c:	00050593          	mv	a1,a0
  800120:	06500513          	li	a0,101
  800124:	f65ff06f          	j	800088 <syscall>

00800128 <sys_write>:
  800128:	00060693          	mv	a3,a2
  80012c:	00058613          	mv	a2,a1
  800130:	00050593          	mv	a1,a0
  800134:	06700513          	li	a0,103
  800138:	f51ff06f          	j	800088 <syscall>

0080013c <sys_fstat>:
  80013c:	00058613          	mv	a2,a1
  800140:	00050593          	mv	a1,a0
  800144:	06e00513          	li	a0,110
  800148:	f41ff06f          	j	800088 <syscall>

0080014c <sys_getdirentry>:
  80014c:	00058613          	mv	a2,a1
  800150:	00050593          	mv	a1,a0
  800154:	08000513          	li	a0,128
  800158:	f31ff06f          	j	800088 <syscall>

0080015c <sys_dup>:
  80015c:	00058613          	mv	a2,a1
  800160:	00050593          	mv	a1,a0
  800164:	08200513          	li	a0,130
  800168:	f21ff06f          	j	800088 <syscall>

0080016c <exit>:
  80016c:	ff010113          	addi	sp,sp,-16
  800170:	00112623          	sw	ra,12(sp)
  800174:	f81ff0ef          	jal	ra,8000f4 <sys_exit>
  800178:	00001517          	auipc	a0,0x1
  80017c:	de850513          	addi	a0,a0,-536 # 800f60 <main+0xbc>
  800180:	0dc000ef          	jal	ra,80025c <cprintf>
  800184:	0000006f          	j	800184 <exit+0x18>

00800188 <_start>:
  800188:	00012503          	lw	a0,0(sp)
  80018c:	00410593          	addi	a1,sp,4
  800190:	2c8000ef          	jal	ra,800458 <umain>
  800194:	0000006f          	j	800194 <_start+0xc>

00800198 <open>:
  800198:	f75ff06f          	j	80010c <sys_open>

0080019c <close>:
  80019c:	f81ff06f          	j	80011c <sys_close>

008001a0 <write>:
  8001a0:	f89ff06f          	j	800128 <sys_write>

008001a4 <fstat>:
  8001a4:	f99ff06f          	j	80013c <sys_fstat>

008001a8 <dup2>:
  8001a8:	fb5ff06f          	j	80015c <sys_dup>

008001ac <cputch>:
  8001ac:	ff010113          	addi	sp,sp,-16
  8001b0:	00112623          	sw	ra,12(sp)
  8001b4:	00812423          	sw	s0,8(sp)
  8001b8:	00058413          	mv	s0,a1
  8001bc:	f45ff0ef          	jal	ra,800100 <sys_putc>
  8001c0:	00042783          	lw	a5,0(s0)
  8001c4:	00c12083          	lw	ra,12(sp)
  8001c8:	00178793          	addi	a5,a5,1
  8001cc:	00f42023          	sw	a5,0(s0)
  8001d0:	00812403          	lw	s0,8(sp)
  8001d4:	01010113          	addi	sp,sp,16
  8001d8:	00008067          	ret

008001dc <fputch>:
  8001dc:	fe010113          	addi	sp,sp,-32
  8001e0:	00060793          	mv	a5,a2
  8001e4:	00812c23          	sw	s0,24(sp)
  8001e8:	00a107a3          	sb	a0,15(sp)
  8001ec:	00058413          	mv	s0,a1
  8001f0:	00078513          	mv	a0,a5
  8001f4:	00f10593          	addi	a1,sp,15
  8001f8:	00100613          	li	a2,1
  8001fc:	00112e23          	sw	ra,28(sp)
  800200:	fa1ff0ef          	jal	ra,8001a0 <write>
  800204:	00042783          	lw	a5,0(s0)
  800208:	01c12083          	lw	ra,28(sp)
  80020c:	00178793          	addi	a5,a5,1
  800210:	00f42023          	sw	a5,0(s0)
  800214:	01812403          	lw	s0,24(sp)
  800218:	02010113          	addi	sp,sp,32
  80021c:	00008067          	ret

00800220 <vcprintf>:
  800220:	fe010113          	addi	sp,sp,-32
  800224:	00058713          	mv	a4,a1
  800228:	ffff75b7          	lui	a1,0xffff7
  80022c:	00050693          	mv	a3,a0
  800230:	00c10613          	addi	a2,sp,12
  800234:	00000517          	auipc	a0,0x0
  800238:	f7850513          	addi	a0,a0,-136 # 8001ac <cputch>
  80023c:	ad958593          	addi	a1,a1,-1319 # ffff6ad9 <sbi_remote_fence_i+0xffff71e9>
  800240:	00112e23          	sw	ra,28(sp)
  800244:	00012623          	sw	zero,12(sp)
  800248:	3a8000ef          	jal	ra,8005f0 <vprintfmt>
  80024c:	01c12083          	lw	ra,28(sp)
  800250:	00c12503          	lw	a0,12(sp)
  800254:	02010113          	addi	sp,sp,32
  800258:	00008067          	ret

0080025c <cprintf>:
  80025c:	fc010113          	addi	sp,sp,-64
  800260:	02410313          	addi	t1,sp,36
  800264:	02b12223          	sw	a1,36(sp)
  800268:	ffff75b7          	lui	a1,0xffff7
  80026c:	02c12423          	sw	a2,40(sp)
  800270:	02d12623          	sw	a3,44(sp)
  800274:	02e12823          	sw	a4,48(sp)
  800278:	00050693          	mv	a3,a0
  80027c:	00c10613          	addi	a2,sp,12
  800280:	00000517          	auipc	a0,0x0
  800284:	f2c50513          	addi	a0,a0,-212 # 8001ac <cputch>
  800288:	00030713          	mv	a4,t1
  80028c:	ad958593          	addi	a1,a1,-1319 # ffff6ad9 <sbi_remote_fence_i+0xffff71e9>
  800290:	00112e23          	sw	ra,28(sp)
  800294:	02f12a23          	sw	a5,52(sp)
  800298:	03012c23          	sw	a6,56(sp)
  80029c:	03112e23          	sw	a7,60(sp)
  8002a0:	00612423          	sw	t1,8(sp)
  8002a4:	00012623          	sw	zero,12(sp)
  8002a8:	348000ef          	jal	ra,8005f0 <vprintfmt>
  8002ac:	01c12083          	lw	ra,28(sp)
  8002b0:	00c12503          	lw	a0,12(sp)
  8002b4:	04010113          	addi	sp,sp,64
  8002b8:	00008067          	ret

008002bc <fprintf>:
  8002bc:	fc010113          	addi	sp,sp,-64
  8002c0:	02810313          	addi	t1,sp,40
  8002c4:	02c12423          	sw	a2,40(sp)
  8002c8:	02d12623          	sw	a3,44(sp)
  8002cc:	02e12823          	sw	a4,48(sp)
  8002d0:	00058693          	mv	a3,a1
  8002d4:	00c10613          	addi	a2,sp,12
  8002d8:	00050593          	mv	a1,a0
  8002dc:	00030713          	mv	a4,t1
  8002e0:	00000517          	auipc	a0,0x0
  8002e4:	efc50513          	addi	a0,a0,-260 # 8001dc <fputch>
  8002e8:	00112e23          	sw	ra,28(sp)
  8002ec:	02f12a23          	sw	a5,52(sp)
  8002f0:	03012c23          	sw	a6,56(sp)
  8002f4:	03112e23          	sw	a7,60(sp)
  8002f8:	00612423          	sw	t1,8(sp)
  8002fc:	00012623          	sw	zero,12(sp)
  800300:	2f0000ef          	jal	ra,8005f0 <vprintfmt>
  800304:	01c12083          	lw	ra,28(sp)
  800308:	00c12503          	lw	a0,12(sp)
  80030c:	04010113          	addi	sp,sp,64
  800310:	00008067          	ret

00800314 <opendir>:
  800314:	fe010113          	addi	sp,sp,-32
  800318:	00000593          	li	a1,0
  80031c:	00812c23          	sw	s0,24(sp)
  800320:	00112e23          	sw	ra,28(sp)
  800324:	00002417          	auipc	s0,0x2
  800328:	cdc42403          	lw	s0,-804(s0) # 802000 <dirp>
  80032c:	e6dff0ef          	jal	ra,800198 <open>
  800330:	00a42023          	sw	a0,0(s0)
  800334:	04054663          	bltz	a0,800380 <opendir+0x6c>
  800338:	00002797          	auipc	a5,0x2
  80033c:	cc87a783          	lw	a5,-824(a5) # 802000 <dirp>
  800340:	0007a503          	lw	a0,0(a5)
  800344:	00010593          	mv	a1,sp
  800348:	e5dff0ef          	jal	ra,8001a4 <fstat>
  80034c:	02051a63          	bnez	a0,800380 <opendir+0x6c>
  800350:	00012783          	lw	a5,0(sp)
  800354:	000076b7          	lui	a3,0x7
  800358:	00002737          	lui	a4,0x2
  80035c:	00d7f7b3          	and	a5,a5,a3
  800360:	02e79063          	bne	a5,a4,800380 <opendir+0x6c>
  800364:	01c12083          	lw	ra,28(sp)
  800368:	00002517          	auipc	a0,0x2
  80036c:	c9852503          	lw	a0,-872(a0) # 802000 <dirp>
  800370:	01812403          	lw	s0,24(sp)
  800374:	00052223          	sw	zero,4(a0)
  800378:	02010113          	addi	sp,sp,32
  80037c:	00008067          	ret
  800380:	01c12083          	lw	ra,28(sp)
  800384:	00000513          	li	a0,0
  800388:	01812403          	lw	s0,24(sp)
  80038c:	02010113          	addi	sp,sp,32
  800390:	00008067          	ret

00800394 <readdir>:
  800394:	ff010113          	addi	sp,sp,-16
  800398:	00812423          	sw	s0,8(sp)
  80039c:	00050413          	mv	s0,a0
  8003a0:	00052503          	lw	a0,0(a0)
  8003a4:	00440413          	addi	s0,s0,4
  8003a8:	00040593          	mv	a1,s0
  8003ac:	00112623          	sw	ra,12(sp)
  8003b0:	d9dff0ef          	jal	ra,80014c <sys_getdirentry>
  8003b4:	00051c63          	bnez	a0,8003cc <readdir+0x38>
  8003b8:	00c12083          	lw	ra,12(sp)
  8003bc:	00040513          	mv	a0,s0
  8003c0:	00812403          	lw	s0,8(sp)
  8003c4:	01010113          	addi	sp,sp,16
  8003c8:	00008067          	ret
  8003cc:	00c12083          	lw	ra,12(sp)
  8003d0:	00000413          	li	s0,0
  8003d4:	00040513          	mv	a0,s0
  8003d8:	00812403          	lw	s0,8(sp)
  8003dc:	01010113          	addi	sp,sp,16
  8003e0:	00008067          	ret

008003e4 <closedir>:
  8003e4:	00052503          	lw	a0,0(a0)
  8003e8:	db5ff06f          	j	80019c <close>

008003ec <initfd>:
  8003ec:	ff010113          	addi	sp,sp,-16
  8003f0:	00058793          	mv	a5,a1
  8003f4:	00912223          	sw	s1,4(sp)
  8003f8:	00060593          	mv	a1,a2
  8003fc:	00050493          	mv	s1,a0
  800400:	00078513          	mv	a0,a5
  800404:	00812423          	sw	s0,8(sp)
  800408:	00112623          	sw	ra,12(sp)
  80040c:	d8dff0ef          	jal	ra,800198 <open>
  800410:	00050413          	mv	s0,a0
  800414:	02054663          	bltz	a0,800440 <initfd+0x54>
  800418:	02950463          	beq	a0,s1,800440 <initfd+0x54>
  80041c:	00048513          	mv	a0,s1
  800420:	d7dff0ef          	jal	ra,80019c <close>
  800424:	00048593          	mv	a1,s1
  800428:	00040513          	mv	a0,s0
  80042c:	d7dff0ef          	jal	ra,8001a8 <dup2>
  800430:	00050493          	mv	s1,a0
  800434:	00040513          	mv	a0,s0
  800438:	d65ff0ef          	jal	ra,80019c <close>
  80043c:	00048413          	mv	s0,s1
  800440:	00c12083          	lw	ra,12(sp)
  800444:	00040513          	mv	a0,s0
  800448:	00412483          	lw	s1,4(sp)
  80044c:	00812403          	lw	s0,8(sp)
  800450:	01010113          	addi	sp,sp,16
  800454:	00008067          	ret

00800458 <umain>:
  800458:	ff010113          	addi	sp,sp,-16
  80045c:	00812423          	sw	s0,8(sp)
  800460:	00912223          	sw	s1,4(sp)
  800464:	00050413          	mv	s0,a0
  800468:	00058493          	mv	s1,a1
  80046c:	00000613          	li	a2,0
  800470:	00001597          	auipc	a1,0x1
  800474:	b0458593          	addi	a1,a1,-1276 # 800f74 <main+0xd0>
  800478:	00000513          	li	a0,0
  80047c:	00112623          	sw	ra,12(sp)
  800480:	f6dff0ef          	jal	ra,8003ec <initfd>
  800484:	02054663          	bltz	a0,8004b0 <umain+0x58>
  800488:	00100613          	li	a2,1
  80048c:	00001597          	auipc	a1,0x1
  800490:	b2058593          	addi	a1,a1,-1248 # 800fac <main+0x108>
  800494:	00060513          	mv	a0,a2
  800498:	f55ff0ef          	jal	ra,8003ec <initfd>
  80049c:	02054a63          	bltz	a0,8004d0 <umain+0x78>
  8004a0:	00048593          	mv	a1,s1
  8004a4:	00040513          	mv	a0,s0
  8004a8:	1fd000ef          	jal	ra,800ea4 <main>
  8004ac:	cc1ff0ef          	jal	ra,80016c <exit>
  8004b0:	00050693          	mv	a3,a0
  8004b4:	00001617          	auipc	a2,0x1
  8004b8:	ac860613          	addi	a2,a2,-1336 # 800f7c <main+0xd8>
  8004bc:	01a00593          	li	a1,26
  8004c0:	00001517          	auipc	a0,0x1
  8004c4:	ad850513          	addi	a0,a0,-1320 # 800f98 <main+0xf4>
  8004c8:	b59ff0ef          	jal	ra,800020 <__warn>
  8004cc:	fbdff06f          	j	800488 <umain+0x30>
  8004d0:	00050693          	mv	a3,a0
  8004d4:	00001617          	auipc	a2,0x1
  8004d8:	ae060613          	addi	a2,a2,-1312 # 800fb4 <main+0x110>
  8004dc:	01d00593          	li	a1,29
  8004e0:	00001517          	auipc	a0,0x1
  8004e4:	ab850513          	addi	a0,a0,-1352 # 800f98 <main+0xf4>
  8004e8:	b39ff0ef          	jal	ra,800020 <__warn>
  8004ec:	fb5ff06f          	j	8004a0 <umain+0x48>

008004f0 <strnlen>:
  8004f0:	00050693          	mv	a3,a0
  8004f4:	02058a63          	beqz	a1,800528 <strnlen+0x38>
  8004f8:	00054703          	lbu	a4,0(a0)
  8004fc:	00150793          	addi	a5,a0,1
  800500:	02070463          	beqz	a4,800528 <strnlen+0x38>
  800504:	00b505b3          	add	a1,a0,a1
  800508:	0100006f          	j	800518 <strnlen+0x28>
  80050c:	00178793          	addi	a5,a5,1
  800510:	fff7c703          	lbu	a4,-1(a5)
  800514:	00070863          	beqz	a4,800524 <strnlen+0x34>
  800518:	40d78533          	sub	a0,a5,a3
  80051c:	feb798e3          	bne	a5,a1,80050c <strnlen+0x1c>
  800520:	00008067          	ret
  800524:	00008067          	ret
  800528:	00000513          	li	a0,0
  80052c:	00008067          	ret

00800530 <printnum>:
  800530:	fd010113          	addi	sp,sp,-48
  800534:	02912223          	sw	s1,36(sp)
  800538:	03212023          	sw	s2,32(sp)
  80053c:	01312e23          	sw	s3,28(sp)
  800540:	01412c23          	sw	s4,24(sp)
  800544:	01512a23          	sw	s5,20(sp)
  800548:	02112623          	sw	ra,44(sp)
  80054c:	02812423          	sw	s0,40(sp)
  800550:	00050493          	mv	s1,a0
  800554:	00058993          	mv	s3,a1
  800558:	00060913          	mv	s2,a2
  80055c:	03012a03          	lw	s4,48(sp)
  800560:	03077ab3          	remu	s5,a4,a6
  800564:	06079463          	bnez	a5,8005cc <printnum+0x9c>
  800568:	07077263          	bleu	a6,a4,8005cc <printnum+0x9c>
  80056c:	fff88413          	addi	s0,a7,-1
  800570:	00805e63          	blez	s0,80058c <printnum+0x5c>
  800574:	fff40413          	addi	s0,s0,-1
  800578:	00098613          	mv	a2,s3
  80057c:	00090593          	mv	a1,s2
  800580:	000a0513          	mv	a0,s4
  800584:	000480e7          	jalr	s1
  800588:	fe0416e3          	bnez	s0,800574 <printnum+0x44>
  80058c:	00001797          	auipc	a5,0x1
  800590:	c0078793          	addi	a5,a5,-1024 # 80118c <error_string+0x64>
  800594:	015787b3          	add	a5,a5,s5
  800598:	00098613          	mv	a2,s3
  80059c:	00090593          	mv	a1,s2
  8005a0:	00048313          	mv	t1,s1
  8005a4:	02c12083          	lw	ra,44(sp)
  8005a8:	02812403          	lw	s0,40(sp)
  8005ac:	02412483          	lw	s1,36(sp)
  8005b0:	02012903          	lw	s2,32(sp)
  8005b4:	01c12983          	lw	s3,28(sp)
  8005b8:	01812a03          	lw	s4,24(sp)
  8005bc:	01412a83          	lw	s5,20(sp)
  8005c0:	0007c503          	lbu	a0,0(a5)
  8005c4:	03010113          	addi	sp,sp,48
  8005c8:	00030067          	jr	t1
  8005cc:	03075733          	divu	a4,a4,a6
  8005d0:	01412023          	sw	s4,0(sp)
  8005d4:	fff88893          	addi	a7,a7,-1
  8005d8:	00000793          	li	a5,0
  8005dc:	00090613          	mv	a2,s2
  8005e0:	00098593          	mv	a1,s3
  8005e4:	00048513          	mv	a0,s1
  8005e8:	f49ff0ef          	jal	ra,800530 <printnum>
  8005ec:	fa1ff06f          	j	80058c <printnum+0x5c>

008005f0 <vprintfmt>:
  8005f0:	fa010113          	addi	sp,sp,-96
  8005f4:	05212823          	sw	s2,80(sp)
  8005f8:	05312623          	sw	s3,76(sp)
  8005fc:	05412423          	sw	s4,72(sp)
  800600:	05512223          	sw	s5,68(sp)
  800604:	05612023          	sw	s6,64(sp)
  800608:	03712e23          	sw	s7,60(sp)
  80060c:	03812c23          	sw	s8,56(sp)
  800610:	03a12823          	sw	s10,48(sp)
  800614:	04112e23          	sw	ra,92(sp)
  800618:	04812c23          	sw	s0,88(sp)
  80061c:	04912a23          	sw	s1,84(sp)
  800620:	03912a23          	sw	s9,52(sp)
  800624:	03b12623          	sw	s11,44(sp)
  800628:	00050a13          	mv	s4,a0
  80062c:	00058993          	mv	s3,a1
  800630:	00060913          	mv	s2,a2
  800634:	00068d13          	mv	s10,a3
  800638:	00070b13          	mv	s6,a4
  80063c:	00001a97          	auipc	s5,0x1
  800640:	994a8a93          	addi	s5,s5,-1644 # 800fd0 <main+0x12c>
  800644:	fff00b93          	li	s7,-1
  800648:	05e00c13          	li	s8,94
  80064c:	000d4503          	lbu	a0,0(s10)
  800650:	02500493          	li	s1,37
  800654:	001d0413          	addi	s0,s10,1
  800658:	02950063          	beq	a0,s1,800678 <vprintfmt+0x88>
  80065c:	06050663          	beqz	a0,8006c8 <vprintfmt+0xd8>
  800660:	00098613          	mv	a2,s3
  800664:	00090593          	mv	a1,s2
  800668:	00140413          	addi	s0,s0,1
  80066c:	000a00e7          	jalr	s4
  800670:	fff44503          	lbu	a0,-1(s0)
  800674:	fe9514e3          	bne	a0,s1,80065c <vprintfmt+0x6c>
  800678:	00044e03          	lbu	t3,0(s0)
  80067c:	fff00d93          	li	s11,-1
  800680:	02000693          	li	a3,32
  800684:	00000493          	li	s1,0
  800688:	00000593          	li	a1,0
  80068c:	000d8c93          	mv	s9,s11
  800690:	05500713          	li	a4,85
  800694:	00100313          	li	t1,1
  800698:	03000813          	li	a6,48
  80069c:	00900613          	li	a2,9
  8006a0:	02d00513          	li	a0,45
  8006a4:	fdde0793          	addi	a5,t3,-35
  8006a8:	0ff7f793          	andi	a5,a5,255
  8006ac:	00140d13          	addi	s10,s0,1
  8006b0:	34f76a63          	bltu	a4,a5,800a04 <vprintfmt+0x414>
  8006b4:	00279793          	slli	a5,a5,0x2
  8006b8:	015787b3          	add	a5,a5,s5
  8006bc:	0007a783          	lw	a5,0(a5)
  8006c0:	015787b3          	add	a5,a5,s5
  8006c4:	00078067          	jr	a5
  8006c8:	05c12083          	lw	ra,92(sp)
  8006cc:	05812403          	lw	s0,88(sp)
  8006d0:	05412483          	lw	s1,84(sp)
  8006d4:	05012903          	lw	s2,80(sp)
  8006d8:	04c12983          	lw	s3,76(sp)
  8006dc:	04812a03          	lw	s4,72(sp)
  8006e0:	04412a83          	lw	s5,68(sp)
  8006e4:	04012b03          	lw	s6,64(sp)
  8006e8:	03c12b83          	lw	s7,60(sp)
  8006ec:	03812c03          	lw	s8,56(sp)
  8006f0:	03412c83          	lw	s9,52(sp)
  8006f4:	03012d03          	lw	s10,48(sp)
  8006f8:	02c12d83          	lw	s11,44(sp)
  8006fc:	06010113          	addi	sp,sp,96
  800700:	00008067          	ret
  800704:	00100793          	li	a5,1
  800708:	36b7c863          	blt	a5,a1,800a78 <vprintfmt+0x488>
  80070c:	000b2703          	lw	a4,0(s6)
  800710:	00000793          	li	a5,0
  800714:	004b0b13          	addi	s6,s6,4
  800718:	01000813          	li	a6,16
  80071c:	00d12023          	sw	a3,0(sp)
  800720:	000c8893          	mv	a7,s9
  800724:	00090613          	mv	a2,s2
  800728:	00098593          	mv	a1,s3
  80072c:	000a0513          	mv	a0,s4
  800730:	e01ff0ef          	jal	ra,800530 <printnum>
  800734:	f19ff06f          	j	80064c <vprintfmt+0x5c>
  800738:	00144e03          	lbu	t3,1(s0)
  80073c:	00030493          	mv	s1,t1
  800740:	000d0413          	mv	s0,s10
  800744:	f61ff06f          	j	8006a4 <vprintfmt+0xb4>
  800748:	000b2503          	lw	a0,0(s6)
  80074c:	00098613          	mv	a2,s3
  800750:	00090593          	mv	a1,s2
  800754:	004b0b13          	addi	s6,s6,4
  800758:	000a00e7          	jalr	s4
  80075c:	ef1ff06f          	j	80064c <vprintfmt+0x5c>
  800760:	00100793          	li	a5,1
  800764:	32b7c863          	blt	a5,a1,800a94 <vprintfmt+0x4a4>
  800768:	000b2703          	lw	a4,0(s6)
  80076c:	004b0b13          	addi	s6,s6,4
  800770:	41f75793          	srai	a5,a4,0x1f
  800774:	00a00813          	li	a6,10
  800778:	fa07d2e3          	bgez	a5,80071c <vprintfmt+0x12c>
  80077c:	00098613          	mv	a2,s3
  800780:	00090593          	mv	a1,s2
  800784:	02d00513          	li	a0,45
  800788:	00f12e23          	sw	a5,28(sp)
  80078c:	00e12c23          	sw	a4,24(sp)
  800790:	01012a23          	sw	a6,20(sp)
  800794:	00d12823          	sw	a3,16(sp)
  800798:	000a00e7          	jalr	s4
  80079c:	01812703          	lw	a4,24(sp)
  8007a0:	01c12783          	lw	a5,28(sp)
  8007a4:	01012683          	lw	a3,16(sp)
  8007a8:	40e00733          	neg	a4,a4
  8007ac:	00e03633          	snez	a2,a4
  8007b0:	40f007b3          	neg	a5,a5
  8007b4:	40c787b3          	sub	a5,a5,a2
  8007b8:	01412803          	lw	a6,20(sp)
  8007bc:	f61ff06f          	j	80071c <vprintfmt+0x12c>
  8007c0:	000b2783          	lw	a5,0(s6)
  8007c4:	01800693          	li	a3,24
  8007c8:	004b0b13          	addi	s6,s6,4
  8007cc:	41f7d713          	srai	a4,a5,0x1f
  8007d0:	00f747b3          	xor	a5,a4,a5
  8007d4:	40e787b3          	sub	a5,a5,a4
  8007d8:	2cf6ca63          	blt	a3,a5,800aac <vprintfmt+0x4bc>
  8007dc:	00279693          	slli	a3,a5,0x2
  8007e0:	00001717          	auipc	a4,0x1
  8007e4:	94870713          	addi	a4,a4,-1720 # 801128 <error_string>
  8007e8:	00d70733          	add	a4,a4,a3
  8007ec:	00072703          	lw	a4,0(a4)
  8007f0:	2a070e63          	beqz	a4,800aac <vprintfmt+0x4bc>
  8007f4:	00001697          	auipc	a3,0x1
  8007f8:	b6c68693          	addi	a3,a3,-1172 # 801360 <error_string+0x238>
  8007fc:	00090613          	mv	a2,s2
  800800:	00098593          	mv	a1,s3
  800804:	000a0513          	mv	a0,s4
  800808:	334000ef          	jal	ra,800b3c <printfmt>
  80080c:	e41ff06f          	j	80064c <vprintfmt+0x5c>
  800810:	00144e03          	lbu	t3,1(s0)
  800814:	00158593          	addi	a1,a1,1
  800818:	000d0413          	mv	s0,s10
  80081c:	e89ff06f          	j	8006a4 <vprintfmt+0xb4>
  800820:	00100793          	li	a5,1
  800824:	20b7ce63          	blt	a5,a1,800a40 <vprintfmt+0x450>
  800828:	000b2703          	lw	a4,0(s6)
  80082c:	00000793          	li	a5,0
  800830:	004b0b13          	addi	s6,s6,4
  800834:	00800813          	li	a6,8
  800838:	ee5ff06f          	j	80071c <vprintfmt+0x12c>
  80083c:	03000513          	li	a0,48
  800840:	00098613          	mv	a2,s3
  800844:	00090593          	mv	a1,s2
  800848:	00d12823          	sw	a3,16(sp)
  80084c:	000a00e7          	jalr	s4
  800850:	00098613          	mv	a2,s3
  800854:	00090593          	mv	a1,s2
  800858:	07800513          	li	a0,120
  80085c:	000a00e7          	jalr	s4
  800860:	000b2703          	lw	a4,0(s6)
  800864:	00000793          	li	a5,0
  800868:	01000813          	li	a6,16
  80086c:	004b0b13          	addi	s6,s6,4
  800870:	01012683          	lw	a3,16(sp)
  800874:	ea9ff06f          	j	80071c <vprintfmt+0x12c>
  800878:	000b2403          	lw	s0,0(s6)
  80087c:	004b0793          	addi	a5,s6,4
  800880:	00f12a23          	sw	a5,20(sp)
  800884:	26040463          	beqz	s0,800aec <vprintfmt+0x4fc>
  800888:	05905463          	blez	s9,8008d0 <vprintfmt+0x2e0>
  80088c:	02d00793          	li	a5,45
  800890:	22f68e63          	beq	a3,a5,800acc <vprintfmt+0x4dc>
  800894:	000d8593          	mv	a1,s11
  800898:	00040513          	mv	a0,s0
  80089c:	00d12823          	sw	a3,16(sp)
  8008a0:	c51ff0ef          	jal	ra,8004f0 <strnlen>
  8008a4:	40ac8cb3          	sub	s9,s9,a0
  8008a8:	03905463          	blez	s9,8008d0 <vprintfmt+0x2e0>
  8008ac:	01012683          	lw	a3,16(sp)
  8008b0:	00068513          	mv	a0,a3
  8008b4:	00098613          	mv	a2,s3
  8008b8:	00090593          	mv	a1,s2
  8008bc:	00d12823          	sw	a3,16(sp)
  8008c0:	fffc8c93          	addi	s9,s9,-1
  8008c4:	000a00e7          	jalr	s4
  8008c8:	01012683          	lw	a3,16(sp)
  8008cc:	fe0c92e3          	bnez	s9,8008b0 <vprintfmt+0x2c0>
  8008d0:	00044783          	lbu	a5,0(s0)
  8008d4:	00140b13          	addi	s6,s0,1
  8008d8:	00078513          	mv	a0,a5
  8008dc:	06078063          	beqz	a5,80093c <vprintfmt+0x34c>
  8008e0:	03f00413          	li	s0,63
  8008e4:	000dc663          	bltz	s11,8008f0 <vprintfmt+0x300>
  8008e8:	fffd8d93          	addi	s11,s11,-1
  8008ec:	037d8863          	beq	s11,s7,80091c <vprintfmt+0x32c>
  8008f0:	00098613          	mv	a2,s3
  8008f4:	00090593          	mv	a1,s2
  8008f8:	00048663          	beqz	s1,800904 <vprintfmt+0x314>
  8008fc:	fe078793          	addi	a5,a5,-32
  800900:	12fc6a63          	bltu	s8,a5,800a34 <vprintfmt+0x444>
  800904:	000a00e7          	jalr	s4
  800908:	001b0b13          	addi	s6,s6,1
  80090c:	fffb4783          	lbu	a5,-1(s6)
  800910:	fffc8c93          	addi	s9,s9,-1
  800914:	00078513          	mv	a0,a5
  800918:	fc0796e3          	bnez	a5,8008e4 <vprintfmt+0x2f4>
  80091c:	03905063          	blez	s9,80093c <vprintfmt+0x34c>
  800920:	02000413          	li	s0,32
  800924:	fffc8c93          	addi	s9,s9,-1
  800928:	00098613          	mv	a2,s3
  80092c:	00090593          	mv	a1,s2
  800930:	00040513          	mv	a0,s0
  800934:	000a00e7          	jalr	s4
  800938:	fe0c96e3          	bnez	s9,800924 <vprintfmt+0x334>
  80093c:	01412b03          	lw	s6,20(sp)
  800940:	d0dff06f          	j	80064c <vprintfmt+0x5c>
  800944:	00100793          	li	a5,1
  800948:	10b7ca63          	blt	a5,a1,800a5c <vprintfmt+0x46c>
  80094c:	000b2703          	lw	a4,0(s6)
  800950:	00000793          	li	a5,0
  800954:	004b0b13          	addi	s6,s6,4
  800958:	00a00813          	li	a6,10
  80095c:	dc1ff06f          	j	80071c <vprintfmt+0x12c>
  800960:	00144e03          	lbu	t3,1(s0)
  800964:	00050693          	mv	a3,a0
  800968:	000d0413          	mv	s0,s10
  80096c:	d39ff06f          	j	8006a4 <vprintfmt+0xb4>
  800970:	00098613          	mv	a2,s3
  800974:	00090593          	mv	a1,s2
  800978:	02500513          	li	a0,37
  80097c:	000a00e7          	jalr	s4
  800980:	ccdff06f          	j	80064c <vprintfmt+0x5c>
  800984:	000b2d83          	lw	s11,0(s6)
  800988:	00144e03          	lbu	t3,1(s0)
  80098c:	004b0b13          	addi	s6,s6,4
  800990:	000d0413          	mv	s0,s10
  800994:	d00cd8e3          	bgez	s9,8006a4 <vprintfmt+0xb4>
  800998:	000d8c93          	mv	s9,s11
  80099c:	fff00d93          	li	s11,-1
  8009a0:	d05ff06f          	j	8006a4 <vprintfmt+0xb4>
  8009a4:	00144e03          	lbu	t3,1(s0)
  8009a8:	00080693          	mv	a3,a6
  8009ac:	000d0413          	mv	s0,s10
  8009b0:	cf5ff06f          	j	8006a4 <vprintfmt+0xb4>
  8009b4:	00144e83          	lbu	t4,1(s0)
  8009b8:	fd0e0d93          	addi	s11,t3,-48
  8009bc:	fd0e8793          	addi	a5,t4,-48
  8009c0:	14f66c63          	bltu	a2,a5,800b18 <vprintfmt+0x528>
  8009c4:	000d0413          	mv	s0,s10
  8009c8:	002d9793          	slli	a5,s11,0x2
  8009cc:	01b78db3          	add	s11,a5,s11
  8009d0:	00140413          	addi	s0,s0,1
  8009d4:	001d9d93          	slli	s11,s11,0x1
  8009d8:	01dd8db3          	add	s11,s11,t4
  8009dc:	00044e83          	lbu	t4,0(s0)
  8009e0:	fd0d8d93          	addi	s11,s11,-48
  8009e4:	fd0e8793          	addi	a5,t4,-48
  8009e8:	fef670e3          	bleu	a5,a2,8009c8 <vprintfmt+0x3d8>
  8009ec:	000e8e13          	mv	t3,t4
  8009f0:	fa5ff06f          	j	800994 <vprintfmt+0x3a4>
  8009f4:	0e0cc863          	bltz	s9,800ae4 <vprintfmt+0x4f4>
  8009f8:	00144e03          	lbu	t3,1(s0)
  8009fc:	000d0413          	mv	s0,s10
  800a00:	ca5ff06f          	j	8006a4 <vprintfmt+0xb4>
  800a04:	00098613          	mv	a2,s3
  800a08:	00090593          	mv	a1,s2
  800a0c:	02500513          	li	a0,37
  800a10:	000a00e7          	jalr	s4
  800a14:	fff44783          	lbu	a5,-1(s0)
  800a18:	02500713          	li	a4,37
  800a1c:	00040d13          	mv	s10,s0
  800a20:	c2e786e3          	beq	a5,a4,80064c <vprintfmt+0x5c>
  800a24:	fffd0d13          	addi	s10,s10,-1
  800a28:	fffd4783          	lbu	a5,-1(s10)
  800a2c:	fee79ce3          	bne	a5,a4,800a24 <vprintfmt+0x434>
  800a30:	c1dff06f          	j	80064c <vprintfmt+0x5c>
  800a34:	00040513          	mv	a0,s0
  800a38:	000a00e7          	jalr	s4
  800a3c:	ecdff06f          	j	800908 <vprintfmt+0x318>
  800a40:	007b0793          	addi	a5,s6,7
  800a44:	ff87f793          	andi	a5,a5,-8
  800a48:	00878b13          	addi	s6,a5,8
  800a4c:	0007a703          	lw	a4,0(a5)
  800a50:	00800813          	li	a6,8
  800a54:	0047a783          	lw	a5,4(a5)
  800a58:	cc5ff06f          	j	80071c <vprintfmt+0x12c>
  800a5c:	007b0793          	addi	a5,s6,7
  800a60:	ff87f793          	andi	a5,a5,-8
  800a64:	00878b13          	addi	s6,a5,8
  800a68:	0007a703          	lw	a4,0(a5)
  800a6c:	00a00813          	li	a6,10
  800a70:	0047a783          	lw	a5,4(a5)
  800a74:	ca9ff06f          	j	80071c <vprintfmt+0x12c>
  800a78:	007b0793          	addi	a5,s6,7
  800a7c:	ff87f793          	andi	a5,a5,-8
  800a80:	00878b13          	addi	s6,a5,8
  800a84:	0007a703          	lw	a4,0(a5)
  800a88:	01000813          	li	a6,16
  800a8c:	0047a783          	lw	a5,4(a5)
  800a90:	c8dff06f          	j	80071c <vprintfmt+0x12c>
  800a94:	007b0793          	addi	a5,s6,7
  800a98:	ff87f793          	andi	a5,a5,-8
  800a9c:	00878b13          	addi	s6,a5,8
  800aa0:	0007a703          	lw	a4,0(a5)
  800aa4:	0047a783          	lw	a5,4(a5)
  800aa8:	ccdff06f          	j	800774 <vprintfmt+0x184>
  800aac:	00078713          	mv	a4,a5
  800ab0:	00001697          	auipc	a3,0x1
  800ab4:	8a468693          	addi	a3,a3,-1884 # 801354 <error_string+0x22c>
  800ab8:	00090613          	mv	a2,s2
  800abc:	00098593          	mv	a1,s3
  800ac0:	000a0513          	mv	a0,s4
  800ac4:	078000ef          	jal	ra,800b3c <printfmt>
  800ac8:	b85ff06f          	j	80064c <vprintfmt+0x5c>
  800acc:	00044783          	lbu	a5,0(s0)
  800ad0:	00140b13          	addi	s6,s0,1
  800ad4:	00078513          	mv	a0,a5
  800ad8:	e40784e3          	beqz	a5,800920 <vprintfmt+0x330>
  800adc:	03f00413          	li	s0,63
  800ae0:	e05ff06f          	j	8008e4 <vprintfmt+0x2f4>
  800ae4:	00000c93          	li	s9,0
  800ae8:	f11ff06f          	j	8009f8 <vprintfmt+0x408>
  800aec:	03905c63          	blez	s9,800b24 <vprintfmt+0x534>
  800af0:	02d00793          	li	a5,45
  800af4:	00001417          	auipc	s0,0x1
  800af8:	85840413          	addi	s0,s0,-1960 # 80134c <error_string+0x224>
  800afc:	d8f69ce3          	bne	a3,a5,800894 <vprintfmt+0x2a4>
  800b00:	02800513          	li	a0,40
  800b04:	00001b17          	auipc	s6,0x1
  800b08:	849b0b13          	addi	s6,s6,-1975 # 80134d <error_string+0x225>
  800b0c:	00050793          	mv	a5,a0
  800b10:	03f00413          	li	s0,63
  800b14:	dd1ff06f          	j	8008e4 <vprintfmt+0x2f4>
  800b18:	000e8e13          	mv	t3,t4
  800b1c:	000d0413          	mv	s0,s10
  800b20:	e75ff06f          	j	800994 <vprintfmt+0x3a4>
  800b24:	02800793          	li	a5,40
  800b28:	00078513          	mv	a0,a5
  800b2c:	00001b17          	auipc	s6,0x1
  800b30:	821b0b13          	addi	s6,s6,-2015 # 80134d <error_string+0x225>
  800b34:	03f00413          	li	s0,63
  800b38:	dadff06f          	j	8008e4 <vprintfmt+0x2f4>

00800b3c <printfmt>:
  800b3c:	fd010113          	addi	sp,sp,-48
  800b40:	02010313          	addi	t1,sp,32
  800b44:	02e12023          	sw	a4,32(sp)
  800b48:	00030713          	mv	a4,t1
  800b4c:	00112e23          	sw	ra,28(sp)
  800b50:	02f12223          	sw	a5,36(sp)
  800b54:	03012423          	sw	a6,40(sp)
  800b58:	03112623          	sw	a7,44(sp)
  800b5c:	00612623          	sw	t1,12(sp)
  800b60:	a91ff0ef          	jal	ra,8005f0 <vprintfmt>
  800b64:	01c12083          	lw	ra,28(sp)
  800b68:	03010113          	addi	sp,sp,48
  800b6c:	00008067          	ret

00800b70 <getstat>:
  800b70:	ff010113          	addi	sp,sp,-16
  800b74:	00912223          	sw	s1,4(sp)
  800b78:	00058493          	mv	s1,a1
  800b7c:	00000593          	li	a1,0
  800b80:	00812423          	sw	s0,8(sp)
  800b84:	00112623          	sw	ra,12(sp)
  800b88:	e10ff0ef          	jal	ra,800198 <open>
  800b8c:	00050413          	mv	s0,a0
  800b90:	00054e63          	bltz	a0,800bac <getstat+0x3c>
  800b94:	00048593          	mv	a1,s1
  800b98:	e0cff0ef          	jal	ra,8001a4 <fstat>
  800b9c:	00050493          	mv	s1,a0
  800ba0:	00040513          	mv	a0,s0
  800ba4:	df8ff0ef          	jal	ra,80019c <close>
  800ba8:	00048413          	mv	s0,s1
  800bac:	00c12083          	lw	ra,12(sp)
  800bb0:	00040513          	mv	a0,s0
  800bb4:	00412483          	lw	s1,4(sp)
  800bb8:	00812403          	lw	s0,8(sp)
  800bbc:	01010113          	addi	sp,sp,16
  800bc0:	00008067          	ret

00800bc4 <lsstat>:
  800bc4:	00052783          	lw	a5,0(a0)
  800bc8:	ff010113          	addi	sp,sp,-16
  800bcc:	000076b7          	lui	a3,0x7
  800bd0:	00812423          	sw	s0,8(sp)
  800bd4:	00912223          	sw	s1,4(sp)
  800bd8:	00112623          	sw	ra,12(sp)
  800bdc:	00001737          	lui	a4,0x1
  800be0:	00d7f7b3          	and	a5,a5,a3
  800be4:	00050413          	mv	s0,a0
  800be8:	00058493          	mv	s1,a1
  800bec:	02d00613          	li	a2,45
  800bf0:	00e78e63          	beq	a5,a4,800c0c <lsstat+0x48>
  800bf4:	00002737          	lui	a4,0x2
  800bf8:	06400613          	li	a2,100
  800bfc:	00e78863          	beq	a5,a4,800c0c <lsstat+0x48>
  800c00:	00003737          	lui	a4,0x3
  800c04:	06c00613          	li	a2,108
  800c08:	06e79a63          	bne	a5,a4,800c7c <lsstat+0xb8>
  800c0c:	00001597          	auipc	a1,0x1
  800c10:	80458593          	addi	a1,a1,-2044 # 801410 <error_string+0x2e8>
  800c14:	00100513          	li	a0,1
  800c18:	ea4ff0ef          	jal	ra,8002bc <fprintf>
  800c1c:	00442603          	lw	a2,4(s0)
  800c20:	00000597          	auipc	a1,0x0
  800c24:	7f858593          	addi	a1,a1,2040 # 801418 <error_string+0x2f0>
  800c28:	00100513          	li	a0,1
  800c2c:	e90ff0ef          	jal	ra,8002bc <fprintf>
  800c30:	00842603          	lw	a2,8(s0)
  800c34:	00000597          	auipc	a1,0x0
  800c38:	7ec58593          	addi	a1,a1,2028 # 801420 <error_string+0x2f8>
  800c3c:	00100513          	li	a0,1
  800c40:	e7cff0ef          	jal	ra,8002bc <fprintf>
  800c44:	00c42603          	lw	a2,12(s0)
  800c48:	00000597          	auipc	a1,0x0
  800c4c:	7e058593          	addi	a1,a1,2016 # 801428 <error_string+0x300>
  800c50:	00100513          	li	a0,1
  800c54:	e68ff0ef          	jal	ra,8002bc <fprintf>
  800c58:	00048613          	mv	a2,s1
  800c5c:	00c12083          	lw	ra,12(sp)
  800c60:	00812403          	lw	s0,8(sp)
  800c64:	00412483          	lw	s1,4(sp)
  800c68:	00000597          	auipc	a1,0x0
  800c6c:	7c858593          	addi	a1,a1,1992 # 801430 <error_string+0x308>
  800c70:	00100513          	li	a0,1
  800c74:	01010113          	addi	sp,sp,16
  800c78:	e44ff06f          	j	8002bc <fprintf>
  800c7c:	00004737          	lui	a4,0x4
  800c80:	06300613          	li	a2,99
  800c84:	f8e784e3          	beq	a5,a4,800c0c <lsstat+0x48>
  800c88:	00005737          	lui	a4,0x5
  800c8c:	06200613          	li	a2,98
  800c90:	f6e78ee3          	beq	a5,a4,800c0c <lsstat+0x48>
  800c94:	03f00613          	li	a2,63
  800c98:	f75ff06f          	j	800c0c <lsstat+0x48>

00800c9c <lsdir>:
  800c9c:	fe010113          	addi	sp,sp,-32
  800ca0:	00000517          	auipc	a0,0x0
  800ca4:	75c50513          	addi	a0,a0,1884 # 8013fc <error_string+0x2d4>
  800ca8:	00912a23          	sw	s1,20(sp)
  800cac:	00112e23          	sw	ra,28(sp)
  800cb0:	00812c23          	sw	s0,24(sp)
  800cb4:	01212823          	sw	s2,16(sp)
  800cb8:	e5cff0ef          	jal	ra,800314 <opendir>
  800cbc:	fff00493          	li	s1,-1
  800cc0:	04050e63          	beqz	a0,800d1c <lsdir+0x80>
  800cc4:	00050913          	mv	s2,a0
  800cc8:	01c0006f          	j	800ce4 <lsdir+0x48>
  800ccc:	ea5ff0ef          	jal	ra,800b70 <getstat>
  800cd0:	00050493          	mv	s1,a0
  800cd4:	00040593          	mv	a1,s0
  800cd8:	00010513          	mv	a0,sp
  800cdc:	04049e63          	bnez	s1,800d38 <lsdir+0x9c>
  800ce0:	ee5ff0ef          	jal	ra,800bc4 <lsstat>
  800ce4:	00090513          	mv	a0,s2
  800ce8:	eacff0ef          	jal	ra,800394 <readdir>
  800cec:	00050793          	mv	a5,a0
  800cf0:	00450413          	addi	s0,a0,4
  800cf4:	00010593          	mv	a1,sp
  800cf8:	00040513          	mv	a0,s0
  800cfc:	fc0798e3          	bnez	a5,800ccc <lsdir+0x30>
  800d00:	00000597          	auipc	a1,0x0
  800d04:	70058593          	addi	a1,a1,1792 # 801400 <error_string+0x2d8>
  800d08:	00100513          	li	a0,1
  800d0c:	db0ff0ef          	jal	ra,8002bc <fprintf>
  800d10:	00090513          	mv	a0,s2
  800d14:	ed0ff0ef          	jal	ra,8003e4 <closedir>
  800d18:	00000493          	li	s1,0
  800d1c:	01c12083          	lw	ra,28(sp)
  800d20:	00048513          	mv	a0,s1
  800d24:	01812403          	lw	s0,24(sp)
  800d28:	01412483          	lw	s1,20(sp)
  800d2c:	01012903          	lw	s2,16(sp)
  800d30:	02010113          	addi	sp,sp,32
  800d34:	00008067          	ret
  800d38:	00090513          	mv	a0,s2
  800d3c:	ea8ff0ef          	jal	ra,8003e4 <closedir>
  800d40:	01c12083          	lw	ra,28(sp)
  800d44:	00048513          	mv	a0,s1
  800d48:	01812403          	lw	s0,24(sp)
  800d4c:	01412483          	lw	s1,20(sp)
  800d50:	01012903          	lw	s2,16(sp)
  800d54:	02010113          	addi	sp,sp,32
  800d58:	00008067          	ret

00800d5c <ls>:
  800d5c:	fe010113          	addi	sp,sp,-32
  800d60:	00010593          	mv	a1,sp
  800d64:	00812c23          	sw	s0,24(sp)
  800d68:	00912a23          	sw	s1,20(sp)
  800d6c:	00112e23          	sw	ra,28(sp)
  800d70:	00050493          	mv	s1,a0
  800d74:	dfdff0ef          	jal	ra,800b70 <getstat>
  800d78:	00050413          	mv	s0,a0
  800d7c:	08051e63          	bnez	a0,800e18 <ls+0xbc>
  800d80:	00012783          	lw	a5,0(sp)
  800d84:	000076b7          	lui	a3,0x7
  800d88:	00001737          	lui	a4,0x1
  800d8c:	00d7f7b3          	and	a5,a5,a3
  800d90:	0ae78063          	beq	a5,a4,800e30 <ls+0xd4>
  800d94:	00002737          	lui	a4,0x2
  800d98:	00000617          	auipc	a2,0x0
  800d9c:	5dc60613          	addi	a2,a2,1500 # 801374 <error_string+0x24c>
  800da0:	00e78a63          	beq	a5,a4,800db4 <ls+0x58>
  800da4:	00003737          	lui	a4,0x3
  800da8:	00000617          	auipc	a2,0x0
  800dac:	5dc60613          	addi	a2,a2,1500 # 801384 <error_string+0x25c>
  800db0:	0ce79663          	bne	a5,a4,800e7c <ls+0x120>
  800db4:	00000597          	auipc	a1,0x0
  800db8:	61058593          	addi	a1,a1,1552 # 8013c4 <error_string+0x29c>
  800dbc:	00100513          	li	a0,1
  800dc0:	cfcff0ef          	jal	ra,8002bc <fprintf>
  800dc4:	00412603          	lw	a2,4(sp)
  800dc8:	00000597          	auipc	a1,0x0
  800dcc:	60858593          	addi	a1,a1,1544 # 8013d0 <error_string+0x2a8>
  800dd0:	00100513          	li	a0,1
  800dd4:	ce8ff0ef          	jal	ra,8002bc <fprintf>
  800dd8:	00812603          	lw	a2,8(sp)
  800ddc:	00000597          	auipc	a1,0x0
  800de0:	60058593          	addi	a1,a1,1536 # 8013dc <error_string+0x2b4>
  800de4:	00100513          	li	a0,1
  800de8:	cd4ff0ef          	jal	ra,8002bc <fprintf>
  800dec:	00c12603          	lw	a2,12(sp)
  800df0:	00048693          	mv	a3,s1
  800df4:	00000597          	auipc	a1,0x0
  800df8:	5f458593          	addi	a1,a1,1524 # 8013e8 <error_string+0x2c0>
  800dfc:	00100513          	li	a0,1
  800e00:	cbcff0ef          	jal	ra,8002bc <fprintf>
  800e04:	00012783          	lw	a5,0(sp)
  800e08:	000076b7          	lui	a3,0x7
  800e0c:	00002737          	lui	a4,0x2
  800e10:	00d7f7b3          	and	a5,a5,a3
  800e14:	04e78263          	beq	a5,a4,800e58 <ls+0xfc>
  800e18:	01c12083          	lw	ra,28(sp)
  800e1c:	00040513          	mv	a0,s0
  800e20:	01412483          	lw	s1,20(sp)
  800e24:	01812403          	lw	s0,24(sp)
  800e28:	02010113          	addi	sp,sp,32
  800e2c:	00008067          	ret
  800e30:	02d00793          	li	a5,45
  800e34:	06200713          	li	a4,98
  800e38:	00f76a63          	bltu	a4,a5,800e4c <ls+0xf0>
  800e3c:	03000713          	li	a4,48
  800e40:	00000617          	auipc	a2,0x0
  800e44:	52460613          	addi	a2,a2,1316 # 801364 <error_string+0x23c>
  800e48:	f6e786e3          	beq	a5,a4,800db4 <ls+0x58>
  800e4c:	00000617          	auipc	a2,0x0
  800e50:	56860613          	addi	a2,a2,1384 # 8013b4 <error_string+0x28c>
  800e54:	f61ff06f          	j	800db4 <ls+0x58>
  800e58:	00048513          	mv	a0,s1
  800e5c:	e41ff0ef          	jal	ra,800c9c <lsdir>
  800e60:	01c12083          	lw	ra,28(sp)
  800e64:	00050413          	mv	s0,a0
  800e68:	00040513          	mv	a0,s0
  800e6c:	01412483          	lw	s1,20(sp)
  800e70:	01812403          	lw	s0,24(sp)
  800e74:	02010113          	addi	sp,sp,32
  800e78:	00008067          	ret
  800e7c:	00004737          	lui	a4,0x4
  800e80:	00000617          	auipc	a2,0x0
  800e84:	51460613          	addi	a2,a2,1300 # 801394 <error_string+0x26c>
  800e88:	f2e786e3          	beq	a5,a4,800db4 <ls+0x58>
  800e8c:	00005737          	lui	a4,0x5
  800e90:	00000617          	auipc	a2,0x0
  800e94:	51460613          	addi	a2,a2,1300 # 8013a4 <error_string+0x27c>
  800e98:	f0e78ee3          	beq	a5,a4,800db4 <ls+0x58>
  800e9c:	03f00793          	li	a5,63
  800ea0:	f95ff06f          	j	800e34 <ls+0xd8>

00800ea4 <main>:
  800ea4:	ff010113          	addi	sp,sp,-16
  800ea8:	00912223          	sw	s1,4(sp)
  800eac:	00112623          	sw	ra,12(sp)
  800eb0:	00812423          	sw	s0,8(sp)
  800eb4:	01212023          	sw	s2,0(sp)
  800eb8:	00100493          	li	s1,1
  800ebc:	04950663          	beq	a0,s1,800f08 <main+0x64>
  800ec0:	00050913          	mv	s2,a0
  800ec4:	00458413          	addi	s0,a1,4
  800ec8:	00a4c663          	blt	s1,a0,800ed4 <main+0x30>
  800ecc:	0340006f          	j	800f00 <main+0x5c>
  800ed0:	02990863          	beq	s2,s1,800f00 <main+0x5c>
  800ed4:	00042503          	lw	a0,0(s0)
  800ed8:	00148493          	addi	s1,s1,1
  800edc:	00440413          	addi	s0,s0,4
  800ee0:	e7dff0ef          	jal	ra,800d5c <ls>
  800ee4:	fe0506e3          	beqz	a0,800ed0 <main+0x2c>
  800ee8:	00c12083          	lw	ra,12(sp)
  800eec:	00812403          	lw	s0,8(sp)
  800ef0:	00412483          	lw	s1,4(sp)
  800ef4:	00012903          	lw	s2,0(sp)
  800ef8:	01010113          	addi	sp,sp,16
  800efc:	00008067          	ret
  800f00:	00000513          	li	a0,0
  800f04:	fe5ff06f          	j	800ee8 <main+0x44>
  800f08:	00c12083          	lw	ra,12(sp)
  800f0c:	00812403          	lw	s0,8(sp)
  800f10:	00412483          	lw	s1,4(sp)
  800f14:	00012903          	lw	s2,0(sp)
  800f18:	00000517          	auipc	a0,0x0
  800f1c:	4e450513          	addi	a0,a0,1252 # 8013fc <error_string+0x2d4>
  800f20:	01010113          	addi	sp,sp,16
  800f24:	e39ff06f          	j	800d5c <ls>
