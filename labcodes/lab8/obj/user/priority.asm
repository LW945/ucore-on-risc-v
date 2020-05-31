
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
  800040:	cb850513          	addi	a0,a0,-840 # 800cf4 <main+0x250>
  800044:	00112e23          	sw	ra,28(sp)
  800048:	02d12623          	sw	a3,44(sp)
  80004c:	02e12823          	sw	a4,48(sp)
  800050:	03012c23          	sw	a6,56(sp)
  800054:	03112e23          	sw	a7,60(sp)
  800058:	00f12623          	sw	a5,12(sp)
  80005c:	248000ef          	jal	ra,8002a4 <cprintf>
  800060:	00c12583          	lw	a1,12(sp)
  800064:	00040513          	mv	a0,s0
  800068:	200000ef          	jal	ra,800268 <vcprintf>
  80006c:	00001517          	auipc	a0,0x1
  800070:	cf450513          	addi	a0,a0,-780 # 800d60 <main+0x2bc>
  800074:	230000ef          	jal	ra,8002a4 <cprintf>
  800078:	ff600513          	li	a0,-10
  80007c:	168000ef          	jal	ra,8001e4 <exit>

00800080 <__warn>:
  800080:	fc010113          	addi	sp,sp,-64
  800084:	00812c23          	sw	s0,24(sp)
  800088:	02f12a23          	sw	a5,52(sp)
  80008c:	00060413          	mv	s0,a2
  800090:	02c10793          	addi	a5,sp,44
  800094:	00058613          	mv	a2,a1
  800098:	00050593          	mv	a1,a0
  80009c:	00001517          	auipc	a0,0x1
  8000a0:	c7450513          	addi	a0,a0,-908 # 800d10 <main+0x26c>
  8000a4:	00112e23          	sw	ra,28(sp)
  8000a8:	02d12623          	sw	a3,44(sp)
  8000ac:	02e12823          	sw	a4,48(sp)
  8000b0:	03012c23          	sw	a6,56(sp)
  8000b4:	03112e23          	sw	a7,60(sp)
  8000b8:	00f12623          	sw	a5,12(sp)
  8000bc:	1e8000ef          	jal	ra,8002a4 <cprintf>
  8000c0:	00c12583          	lw	a1,12(sp)
  8000c4:	00040513          	mv	a0,s0
  8000c8:	1a0000ef          	jal	ra,800268 <vcprintf>
  8000cc:	00001517          	auipc	a0,0x1
  8000d0:	c9450513          	addi	a0,a0,-876 # 800d60 <main+0x2bc>
  8000d4:	1d0000ef          	jal	ra,8002a4 <cprintf>
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

00800178 <sys_kill>:
  800178:	00050593          	mv	a1,a0
  80017c:	00c00513          	li	a0,12
  800180:	f69ff06f          	j	8000e8 <syscall>

00800184 <sys_getpid>:
  800184:	01200513          	li	a0,18
  800188:	f61ff06f          	j	8000e8 <syscall>

0080018c <sys_putc>:
  80018c:	00050593          	mv	a1,a0
  800190:	01e00513          	li	a0,30
  800194:	f55ff06f          	j	8000e8 <syscall>

00800198 <sys_lab6_set_priority>:
  800198:	00050593          	mv	a1,a0
  80019c:	0ff00513          	li	a0,255
  8001a0:	f49ff06f          	j	8000e8 <syscall>

008001a4 <sys_sleep>:
  8001a4:	00050593          	mv	a1,a0
  8001a8:	00b00513          	li	a0,11
  8001ac:	f3dff06f          	j	8000e8 <syscall>

008001b0 <sys_gettime>:
  8001b0:	01100513          	li	a0,17
  8001b4:	f35ff06f          	j	8000e8 <syscall>

008001b8 <sys_open>:
  8001b8:	00058613          	mv	a2,a1
  8001bc:	00050593          	mv	a1,a0
  8001c0:	06400513          	li	a0,100
  8001c4:	f25ff06f          	j	8000e8 <syscall>

008001c8 <sys_close>:
  8001c8:	00050593          	mv	a1,a0
  8001cc:	06500513          	li	a0,101
  8001d0:	f19ff06f          	j	8000e8 <syscall>

008001d4 <sys_dup>:
  8001d4:	00058613          	mv	a2,a1
  8001d8:	00050593          	mv	a1,a0
  8001dc:	08200513          	li	a0,130
  8001e0:	f09ff06f          	j	8000e8 <syscall>

008001e4 <exit>:
  8001e4:	ff010113          	addi	sp,sp,-16
  8001e8:	00112623          	sw	ra,12(sp)
  8001ec:	f69ff0ef          	jal	ra,800154 <sys_exit>
  8001f0:	00001517          	auipc	a0,0x1
  8001f4:	b3c50513          	addi	a0,a0,-1220 # 800d2c <main+0x288>
  8001f8:	0ac000ef          	jal	ra,8002a4 <cprintf>
  8001fc:	0000006f          	j	8001fc <exit+0x18>

00800200 <fork>:
  800200:	f61ff06f          	j	800160 <sys_fork>

00800204 <waitpid>:
  800204:	f65ff06f          	j	800168 <sys_wait>

00800208 <kill>:
  800208:	f71ff06f          	j	800178 <sys_kill>

0080020c <getpid>:
  80020c:	f79ff06f          	j	800184 <sys_getpid>

00800210 <lab6_set_priority>:
  800210:	f89ff06f          	j	800198 <sys_lab6_set_priority>

00800214 <sleep>:
  800214:	f91ff06f          	j	8001a4 <sys_sleep>

00800218 <gettime_msec>:
  800218:	f99ff06f          	j	8001b0 <sys_gettime>

0080021c <_start>:
  80021c:	00012503          	lw	a0,0(sp)
  800220:	00410593          	addi	a1,sp,4
  800224:	14c000ef          	jal	ra,800370 <umain>
  800228:	0000006f          	j	800228 <_start+0xc>

0080022c <open>:
  80022c:	f8dff06f          	j	8001b8 <sys_open>

00800230 <close>:
  800230:	f99ff06f          	j	8001c8 <sys_close>

00800234 <dup2>:
  800234:	fa1ff06f          	j	8001d4 <sys_dup>

00800238 <cputch>:
  800238:	ff010113          	addi	sp,sp,-16
  80023c:	00112623          	sw	ra,12(sp)
  800240:	00812423          	sw	s0,8(sp)
  800244:	00058413          	mv	s0,a1
  800248:	f45ff0ef          	jal	ra,80018c <sys_putc>
  80024c:	00042783          	lw	a5,0(s0)
  800250:	00c12083          	lw	ra,12(sp)
  800254:	00178793          	addi	a5,a5,1
  800258:	00f42023          	sw	a5,0(s0)
  80025c:	00812403          	lw	s0,8(sp)
  800260:	01010113          	addi	sp,sp,16
  800264:	00008067          	ret

00800268 <vcprintf>:
  800268:	fe010113          	addi	sp,sp,-32
  80026c:	00058713          	mv	a4,a1
  800270:	ffff75b7          	lui	a1,0xffff7
  800274:	00050693          	mv	a3,a0
  800278:	00c10613          	addi	a2,sp,12
  80027c:	00000517          	auipc	a0,0x0
  800280:	fbc50513          	addi	a0,a0,-68 # 800238 <cputch>
  800284:	ad958593          	addi	a1,a1,-1319 # ffff6ad9 <sbi_remote_fence_i+0xffff71e9>
  800288:	00112e23          	sw	ra,28(sp)
  80028c:	00012623          	sw	zero,12(sp)
  800290:	294000ef          	jal	ra,800524 <vprintfmt>
  800294:	01c12083          	lw	ra,28(sp)
  800298:	00c12503          	lw	a0,12(sp)
  80029c:	02010113          	addi	sp,sp,32
  8002a0:	00008067          	ret

008002a4 <cprintf>:
  8002a4:	fc010113          	addi	sp,sp,-64
  8002a8:	02410313          	addi	t1,sp,36
  8002ac:	02b12223          	sw	a1,36(sp)
  8002b0:	ffff75b7          	lui	a1,0xffff7
  8002b4:	02c12423          	sw	a2,40(sp)
  8002b8:	02d12623          	sw	a3,44(sp)
  8002bc:	02e12823          	sw	a4,48(sp)
  8002c0:	00050693          	mv	a3,a0
  8002c4:	00c10613          	addi	a2,sp,12
  8002c8:	00000517          	auipc	a0,0x0
  8002cc:	f7050513          	addi	a0,a0,-144 # 800238 <cputch>
  8002d0:	00030713          	mv	a4,t1
  8002d4:	ad958593          	addi	a1,a1,-1319 # ffff6ad9 <sbi_remote_fence_i+0xffff71e9>
  8002d8:	00112e23          	sw	ra,28(sp)
  8002dc:	02f12a23          	sw	a5,52(sp)
  8002e0:	03012c23          	sw	a6,56(sp)
  8002e4:	03112e23          	sw	a7,60(sp)
  8002e8:	00612423          	sw	t1,8(sp)
  8002ec:	00012623          	sw	zero,12(sp)
  8002f0:	234000ef          	jal	ra,800524 <vprintfmt>
  8002f4:	01c12083          	lw	ra,28(sp)
  8002f8:	00c12503          	lw	a0,12(sp)
  8002fc:	04010113          	addi	sp,sp,64
  800300:	00008067          	ret

00800304 <initfd>:
  800304:	ff010113          	addi	sp,sp,-16
  800308:	00058793          	mv	a5,a1
  80030c:	00912223          	sw	s1,4(sp)
  800310:	00060593          	mv	a1,a2
  800314:	00050493          	mv	s1,a0
  800318:	00078513          	mv	a0,a5
  80031c:	00812423          	sw	s0,8(sp)
  800320:	00112623          	sw	ra,12(sp)
  800324:	f09ff0ef          	jal	ra,80022c <open>
  800328:	00050413          	mv	s0,a0
  80032c:	02054663          	bltz	a0,800358 <initfd+0x54>
  800330:	02950463          	beq	a0,s1,800358 <initfd+0x54>
  800334:	00048513          	mv	a0,s1
  800338:	ef9ff0ef          	jal	ra,800230 <close>
  80033c:	00048593          	mv	a1,s1
  800340:	00040513          	mv	a0,s0
  800344:	ef1ff0ef          	jal	ra,800234 <dup2>
  800348:	00050493          	mv	s1,a0
  80034c:	00040513          	mv	a0,s0
  800350:	ee1ff0ef          	jal	ra,800230 <close>
  800354:	00048413          	mv	s0,s1
  800358:	00c12083          	lw	ra,12(sp)
  80035c:	00040513          	mv	a0,s0
  800360:	00412483          	lw	s1,4(sp)
  800364:	00812403          	lw	s0,8(sp)
  800368:	01010113          	addi	sp,sp,16
  80036c:	00008067          	ret

00800370 <umain>:
  800370:	ff010113          	addi	sp,sp,-16
  800374:	00812423          	sw	s0,8(sp)
  800378:	00912223          	sw	s1,4(sp)
  80037c:	00050413          	mv	s0,a0
  800380:	00058493          	mv	s1,a1
  800384:	00000613          	li	a2,0
  800388:	00001597          	auipc	a1,0x1
  80038c:	9b858593          	addi	a1,a1,-1608 # 800d40 <main+0x29c>
  800390:	00000513          	li	a0,0
  800394:	00112623          	sw	ra,12(sp)
  800398:	f6dff0ef          	jal	ra,800304 <initfd>
  80039c:	02054663          	bltz	a0,8003c8 <umain+0x58>
  8003a0:	00100613          	li	a2,1
  8003a4:	00001597          	auipc	a1,0x1
  8003a8:	9d458593          	addi	a1,a1,-1580 # 800d78 <main+0x2d4>
  8003ac:	00060513          	mv	a0,a2
  8003b0:	f55ff0ef          	jal	ra,800304 <initfd>
  8003b4:	02054a63          	bltz	a0,8003e8 <umain+0x78>
  8003b8:	00048593          	mv	a1,s1
  8003bc:	00040513          	mv	a0,s0
  8003c0:	6e4000ef          	jal	ra,800aa4 <main>
  8003c4:	e21ff0ef          	jal	ra,8001e4 <exit>
  8003c8:	00050693          	mv	a3,a0
  8003cc:	00001617          	auipc	a2,0x1
  8003d0:	97c60613          	addi	a2,a2,-1668 # 800d48 <main+0x2a4>
  8003d4:	01a00593          	li	a1,26
  8003d8:	00001517          	auipc	a0,0x1
  8003dc:	98c50513          	addi	a0,a0,-1652 # 800d64 <main+0x2c0>
  8003e0:	ca1ff0ef          	jal	ra,800080 <__warn>
  8003e4:	fbdff06f          	j	8003a0 <umain+0x30>
  8003e8:	00050693          	mv	a3,a0
  8003ec:	00001617          	auipc	a2,0x1
  8003f0:	99460613          	addi	a2,a2,-1644 # 800d80 <main+0x2dc>
  8003f4:	01d00593          	li	a1,29
  8003f8:	00001517          	auipc	a0,0x1
  8003fc:	96c50513          	addi	a0,a0,-1684 # 800d64 <main+0x2c0>
  800400:	c81ff0ef          	jal	ra,800080 <__warn>
  800404:	fb5ff06f          	j	8003b8 <umain+0x48>

00800408 <strnlen>:
  800408:	00050693          	mv	a3,a0
  80040c:	02058a63          	beqz	a1,800440 <strnlen+0x38>
  800410:	00054703          	lbu	a4,0(a0)
  800414:	00150793          	addi	a5,a0,1
  800418:	02070463          	beqz	a4,800440 <strnlen+0x38>
  80041c:	00b505b3          	add	a1,a0,a1
  800420:	0100006f          	j	800430 <strnlen+0x28>
  800424:	00178793          	addi	a5,a5,1
  800428:	fff7c703          	lbu	a4,-1(a5)
  80042c:	00070863          	beqz	a4,80043c <strnlen+0x34>
  800430:	40d78533          	sub	a0,a5,a3
  800434:	feb798e3          	bne	a5,a1,800424 <strnlen+0x1c>
  800438:	00008067          	ret
  80043c:	00008067          	ret
  800440:	00000513          	li	a0,0
  800444:	00008067          	ret

00800448 <memset>:
  800448:	00c50733          	add	a4,a0,a2
  80044c:	00050793          	mv	a5,a0
  800450:	00060863          	beqz	a2,800460 <memset+0x18>
  800454:	00178793          	addi	a5,a5,1
  800458:	feb78fa3          	sb	a1,-1(a5)
  80045c:	fef71ce3          	bne	a4,a5,800454 <memset+0xc>
  800460:	00008067          	ret

00800464 <printnum>:
  800464:	fd010113          	addi	sp,sp,-48
  800468:	02912223          	sw	s1,36(sp)
  80046c:	03212023          	sw	s2,32(sp)
  800470:	01312e23          	sw	s3,28(sp)
  800474:	01412c23          	sw	s4,24(sp)
  800478:	01512a23          	sw	s5,20(sp)
  80047c:	02112623          	sw	ra,44(sp)
  800480:	02812423          	sw	s0,40(sp)
  800484:	00050493          	mv	s1,a0
  800488:	00058993          	mv	s3,a1
  80048c:	00060913          	mv	s2,a2
  800490:	03012a03          	lw	s4,48(sp)
  800494:	03077ab3          	remu	s5,a4,a6
  800498:	06079463          	bnez	a5,800500 <printnum+0x9c>
  80049c:	07077263          	bleu	a6,a4,800500 <printnum+0x9c>
  8004a0:	fff88413          	addi	s0,a7,-1
  8004a4:	00805e63          	blez	s0,8004c0 <printnum+0x5c>
  8004a8:	fff40413          	addi	s0,s0,-1
  8004ac:	00098613          	mv	a2,s3
  8004b0:	00090593          	mv	a1,s2
  8004b4:	000a0513          	mv	a0,s4
  8004b8:	000480e7          	jalr	s1
  8004bc:	fe0416e3          	bnez	s0,8004a8 <printnum+0x44>
  8004c0:	00001797          	auipc	a5,0x1
  8004c4:	a9878793          	addi	a5,a5,-1384 # 800f58 <error_string+0x64>
  8004c8:	015787b3          	add	a5,a5,s5
  8004cc:	00098613          	mv	a2,s3
  8004d0:	00090593          	mv	a1,s2
  8004d4:	00048313          	mv	t1,s1
  8004d8:	02c12083          	lw	ra,44(sp)
  8004dc:	02812403          	lw	s0,40(sp)
  8004e0:	02412483          	lw	s1,36(sp)
  8004e4:	02012903          	lw	s2,32(sp)
  8004e8:	01c12983          	lw	s3,28(sp)
  8004ec:	01812a03          	lw	s4,24(sp)
  8004f0:	01412a83          	lw	s5,20(sp)
  8004f4:	0007c503          	lbu	a0,0(a5)
  8004f8:	03010113          	addi	sp,sp,48
  8004fc:	00030067          	jr	t1
  800500:	03075733          	divu	a4,a4,a6
  800504:	01412023          	sw	s4,0(sp)
  800508:	fff88893          	addi	a7,a7,-1
  80050c:	00000793          	li	a5,0
  800510:	00090613          	mv	a2,s2
  800514:	00098593          	mv	a1,s3
  800518:	00048513          	mv	a0,s1
  80051c:	f49ff0ef          	jal	ra,800464 <printnum>
  800520:	fa1ff06f          	j	8004c0 <printnum+0x5c>

00800524 <vprintfmt>:
  800524:	fa010113          	addi	sp,sp,-96
  800528:	05212823          	sw	s2,80(sp)
  80052c:	05312623          	sw	s3,76(sp)
  800530:	05412423          	sw	s4,72(sp)
  800534:	05512223          	sw	s5,68(sp)
  800538:	05612023          	sw	s6,64(sp)
  80053c:	03712e23          	sw	s7,60(sp)
  800540:	03812c23          	sw	s8,56(sp)
  800544:	03a12823          	sw	s10,48(sp)
  800548:	04112e23          	sw	ra,92(sp)
  80054c:	04812c23          	sw	s0,88(sp)
  800550:	04912a23          	sw	s1,84(sp)
  800554:	03912a23          	sw	s9,52(sp)
  800558:	03b12623          	sw	s11,44(sp)
  80055c:	00050a13          	mv	s4,a0
  800560:	00058993          	mv	s3,a1
  800564:	00060913          	mv	s2,a2
  800568:	00068d13          	mv	s10,a3
  80056c:	00070b13          	mv	s6,a4
  800570:	00001a97          	auipc	s5,0x1
  800574:	82ca8a93          	addi	s5,s5,-2004 # 800d9c <main+0x2f8>
  800578:	fff00b93          	li	s7,-1
  80057c:	05e00c13          	li	s8,94
  800580:	000d4503          	lbu	a0,0(s10)
  800584:	02500493          	li	s1,37
  800588:	001d0413          	addi	s0,s10,1
  80058c:	02950063          	beq	a0,s1,8005ac <vprintfmt+0x88>
  800590:	06050663          	beqz	a0,8005fc <vprintfmt+0xd8>
  800594:	00098613          	mv	a2,s3
  800598:	00090593          	mv	a1,s2
  80059c:	00140413          	addi	s0,s0,1
  8005a0:	000a00e7          	jalr	s4
  8005a4:	fff44503          	lbu	a0,-1(s0)
  8005a8:	fe9514e3          	bne	a0,s1,800590 <vprintfmt+0x6c>
  8005ac:	00044e03          	lbu	t3,0(s0)
  8005b0:	fff00d93          	li	s11,-1
  8005b4:	02000693          	li	a3,32
  8005b8:	00000493          	li	s1,0
  8005bc:	00000593          	li	a1,0
  8005c0:	000d8c93          	mv	s9,s11
  8005c4:	05500713          	li	a4,85
  8005c8:	00100313          	li	t1,1
  8005cc:	03000813          	li	a6,48
  8005d0:	00900613          	li	a2,9
  8005d4:	02d00513          	li	a0,45
  8005d8:	fdde0793          	addi	a5,t3,-35
  8005dc:	0ff7f793          	andi	a5,a5,255
  8005e0:	00140d13          	addi	s10,s0,1
  8005e4:	34f76a63          	bltu	a4,a5,800938 <vprintfmt+0x414>
  8005e8:	00279793          	slli	a5,a5,0x2
  8005ec:	015787b3          	add	a5,a5,s5
  8005f0:	0007a783          	lw	a5,0(a5)
  8005f4:	015787b3          	add	a5,a5,s5
  8005f8:	00078067          	jr	a5
  8005fc:	05c12083          	lw	ra,92(sp)
  800600:	05812403          	lw	s0,88(sp)
  800604:	05412483          	lw	s1,84(sp)
  800608:	05012903          	lw	s2,80(sp)
  80060c:	04c12983          	lw	s3,76(sp)
  800610:	04812a03          	lw	s4,72(sp)
  800614:	04412a83          	lw	s5,68(sp)
  800618:	04012b03          	lw	s6,64(sp)
  80061c:	03c12b83          	lw	s7,60(sp)
  800620:	03812c03          	lw	s8,56(sp)
  800624:	03412c83          	lw	s9,52(sp)
  800628:	03012d03          	lw	s10,48(sp)
  80062c:	02c12d83          	lw	s11,44(sp)
  800630:	06010113          	addi	sp,sp,96
  800634:	00008067          	ret
  800638:	00100793          	li	a5,1
  80063c:	36b7c863          	blt	a5,a1,8009ac <vprintfmt+0x488>
  800640:	000b2703          	lw	a4,0(s6)
  800644:	00000793          	li	a5,0
  800648:	004b0b13          	addi	s6,s6,4
  80064c:	01000813          	li	a6,16
  800650:	00d12023          	sw	a3,0(sp)
  800654:	000c8893          	mv	a7,s9
  800658:	00090613          	mv	a2,s2
  80065c:	00098593          	mv	a1,s3
  800660:	000a0513          	mv	a0,s4
  800664:	e01ff0ef          	jal	ra,800464 <printnum>
  800668:	f19ff06f          	j	800580 <vprintfmt+0x5c>
  80066c:	00144e03          	lbu	t3,1(s0)
  800670:	00030493          	mv	s1,t1
  800674:	000d0413          	mv	s0,s10
  800678:	f61ff06f          	j	8005d8 <vprintfmt+0xb4>
  80067c:	000b2503          	lw	a0,0(s6)
  800680:	00098613          	mv	a2,s3
  800684:	00090593          	mv	a1,s2
  800688:	004b0b13          	addi	s6,s6,4
  80068c:	000a00e7          	jalr	s4
  800690:	ef1ff06f          	j	800580 <vprintfmt+0x5c>
  800694:	00100793          	li	a5,1
  800698:	32b7c863          	blt	a5,a1,8009c8 <vprintfmt+0x4a4>
  80069c:	000b2703          	lw	a4,0(s6)
  8006a0:	004b0b13          	addi	s6,s6,4
  8006a4:	41f75793          	srai	a5,a4,0x1f
  8006a8:	00a00813          	li	a6,10
  8006ac:	fa07d2e3          	bgez	a5,800650 <vprintfmt+0x12c>
  8006b0:	00098613          	mv	a2,s3
  8006b4:	00090593          	mv	a1,s2
  8006b8:	02d00513          	li	a0,45
  8006bc:	00f12e23          	sw	a5,28(sp)
  8006c0:	00e12c23          	sw	a4,24(sp)
  8006c4:	01012a23          	sw	a6,20(sp)
  8006c8:	00d12823          	sw	a3,16(sp)
  8006cc:	000a00e7          	jalr	s4
  8006d0:	01812703          	lw	a4,24(sp)
  8006d4:	01c12783          	lw	a5,28(sp)
  8006d8:	01012683          	lw	a3,16(sp)
  8006dc:	40e00733          	neg	a4,a4
  8006e0:	00e03633          	snez	a2,a4
  8006e4:	40f007b3          	neg	a5,a5
  8006e8:	40c787b3          	sub	a5,a5,a2
  8006ec:	01412803          	lw	a6,20(sp)
  8006f0:	f61ff06f          	j	800650 <vprintfmt+0x12c>
  8006f4:	000b2783          	lw	a5,0(s6)
  8006f8:	01800693          	li	a3,24
  8006fc:	004b0b13          	addi	s6,s6,4
  800700:	41f7d713          	srai	a4,a5,0x1f
  800704:	00f747b3          	xor	a5,a4,a5
  800708:	40e787b3          	sub	a5,a5,a4
  80070c:	2cf6ca63          	blt	a3,a5,8009e0 <vprintfmt+0x4bc>
  800710:	00279693          	slli	a3,a5,0x2
  800714:	00000717          	auipc	a4,0x0
  800718:	7e070713          	addi	a4,a4,2016 # 800ef4 <error_string>
  80071c:	00d70733          	add	a4,a4,a3
  800720:	00072703          	lw	a4,0(a4)
  800724:	2a070e63          	beqz	a4,8009e0 <vprintfmt+0x4bc>
  800728:	00001697          	auipc	a3,0x1
  80072c:	a0468693          	addi	a3,a3,-1532 # 80112c <error_string+0x238>
  800730:	00090613          	mv	a2,s2
  800734:	00098593          	mv	a1,s3
  800738:	000a0513          	mv	a0,s4
  80073c:	334000ef          	jal	ra,800a70 <printfmt>
  800740:	e41ff06f          	j	800580 <vprintfmt+0x5c>
  800744:	00144e03          	lbu	t3,1(s0)
  800748:	00158593          	addi	a1,a1,1
  80074c:	000d0413          	mv	s0,s10
  800750:	e89ff06f          	j	8005d8 <vprintfmt+0xb4>
  800754:	00100793          	li	a5,1
  800758:	20b7ce63          	blt	a5,a1,800974 <vprintfmt+0x450>
  80075c:	000b2703          	lw	a4,0(s6)
  800760:	00000793          	li	a5,0
  800764:	004b0b13          	addi	s6,s6,4
  800768:	00800813          	li	a6,8
  80076c:	ee5ff06f          	j	800650 <vprintfmt+0x12c>
  800770:	03000513          	li	a0,48
  800774:	00098613          	mv	a2,s3
  800778:	00090593          	mv	a1,s2
  80077c:	00d12823          	sw	a3,16(sp)
  800780:	000a00e7          	jalr	s4
  800784:	00098613          	mv	a2,s3
  800788:	00090593          	mv	a1,s2
  80078c:	07800513          	li	a0,120
  800790:	000a00e7          	jalr	s4
  800794:	000b2703          	lw	a4,0(s6)
  800798:	00000793          	li	a5,0
  80079c:	01000813          	li	a6,16
  8007a0:	004b0b13          	addi	s6,s6,4
  8007a4:	01012683          	lw	a3,16(sp)
  8007a8:	ea9ff06f          	j	800650 <vprintfmt+0x12c>
  8007ac:	000b2403          	lw	s0,0(s6)
  8007b0:	004b0793          	addi	a5,s6,4
  8007b4:	00f12a23          	sw	a5,20(sp)
  8007b8:	26040463          	beqz	s0,800a20 <vprintfmt+0x4fc>
  8007bc:	05905463          	blez	s9,800804 <vprintfmt+0x2e0>
  8007c0:	02d00793          	li	a5,45
  8007c4:	22f68e63          	beq	a3,a5,800a00 <vprintfmt+0x4dc>
  8007c8:	000d8593          	mv	a1,s11
  8007cc:	00040513          	mv	a0,s0
  8007d0:	00d12823          	sw	a3,16(sp)
  8007d4:	c35ff0ef          	jal	ra,800408 <strnlen>
  8007d8:	40ac8cb3          	sub	s9,s9,a0
  8007dc:	03905463          	blez	s9,800804 <vprintfmt+0x2e0>
  8007e0:	01012683          	lw	a3,16(sp)
  8007e4:	00068513          	mv	a0,a3
  8007e8:	00098613          	mv	a2,s3
  8007ec:	00090593          	mv	a1,s2
  8007f0:	00d12823          	sw	a3,16(sp)
  8007f4:	fffc8c93          	addi	s9,s9,-1
  8007f8:	000a00e7          	jalr	s4
  8007fc:	01012683          	lw	a3,16(sp)
  800800:	fe0c92e3          	bnez	s9,8007e4 <vprintfmt+0x2c0>
  800804:	00044783          	lbu	a5,0(s0)
  800808:	00140b13          	addi	s6,s0,1
  80080c:	00078513          	mv	a0,a5
  800810:	06078063          	beqz	a5,800870 <vprintfmt+0x34c>
  800814:	03f00413          	li	s0,63
  800818:	000dc663          	bltz	s11,800824 <vprintfmt+0x300>
  80081c:	fffd8d93          	addi	s11,s11,-1
  800820:	037d8863          	beq	s11,s7,800850 <vprintfmt+0x32c>
  800824:	00098613          	mv	a2,s3
  800828:	00090593          	mv	a1,s2
  80082c:	00048663          	beqz	s1,800838 <vprintfmt+0x314>
  800830:	fe078793          	addi	a5,a5,-32
  800834:	12fc6a63          	bltu	s8,a5,800968 <vprintfmt+0x444>
  800838:	000a00e7          	jalr	s4
  80083c:	001b0b13          	addi	s6,s6,1
  800840:	fffb4783          	lbu	a5,-1(s6)
  800844:	fffc8c93          	addi	s9,s9,-1
  800848:	00078513          	mv	a0,a5
  80084c:	fc0796e3          	bnez	a5,800818 <vprintfmt+0x2f4>
  800850:	03905063          	blez	s9,800870 <vprintfmt+0x34c>
  800854:	02000413          	li	s0,32
  800858:	fffc8c93          	addi	s9,s9,-1
  80085c:	00098613          	mv	a2,s3
  800860:	00090593          	mv	a1,s2
  800864:	00040513          	mv	a0,s0
  800868:	000a00e7          	jalr	s4
  80086c:	fe0c96e3          	bnez	s9,800858 <vprintfmt+0x334>
  800870:	01412b03          	lw	s6,20(sp)
  800874:	d0dff06f          	j	800580 <vprintfmt+0x5c>
  800878:	00100793          	li	a5,1
  80087c:	10b7ca63          	blt	a5,a1,800990 <vprintfmt+0x46c>
  800880:	000b2703          	lw	a4,0(s6)
  800884:	00000793          	li	a5,0
  800888:	004b0b13          	addi	s6,s6,4
  80088c:	00a00813          	li	a6,10
  800890:	dc1ff06f          	j	800650 <vprintfmt+0x12c>
  800894:	00144e03          	lbu	t3,1(s0)
  800898:	00050693          	mv	a3,a0
  80089c:	000d0413          	mv	s0,s10
  8008a0:	d39ff06f          	j	8005d8 <vprintfmt+0xb4>
  8008a4:	00098613          	mv	a2,s3
  8008a8:	00090593          	mv	a1,s2
  8008ac:	02500513          	li	a0,37
  8008b0:	000a00e7          	jalr	s4
  8008b4:	ccdff06f          	j	800580 <vprintfmt+0x5c>
  8008b8:	000b2d83          	lw	s11,0(s6)
  8008bc:	00144e03          	lbu	t3,1(s0)
  8008c0:	004b0b13          	addi	s6,s6,4
  8008c4:	000d0413          	mv	s0,s10
  8008c8:	d00cd8e3          	bgez	s9,8005d8 <vprintfmt+0xb4>
  8008cc:	000d8c93          	mv	s9,s11
  8008d0:	fff00d93          	li	s11,-1
  8008d4:	d05ff06f          	j	8005d8 <vprintfmt+0xb4>
  8008d8:	00144e03          	lbu	t3,1(s0)
  8008dc:	00080693          	mv	a3,a6
  8008e0:	000d0413          	mv	s0,s10
  8008e4:	cf5ff06f          	j	8005d8 <vprintfmt+0xb4>
  8008e8:	00144e83          	lbu	t4,1(s0)
  8008ec:	fd0e0d93          	addi	s11,t3,-48
  8008f0:	fd0e8793          	addi	a5,t4,-48
  8008f4:	14f66c63          	bltu	a2,a5,800a4c <vprintfmt+0x528>
  8008f8:	000d0413          	mv	s0,s10
  8008fc:	002d9793          	slli	a5,s11,0x2
  800900:	01b78db3          	add	s11,a5,s11
  800904:	00140413          	addi	s0,s0,1
  800908:	001d9d93          	slli	s11,s11,0x1
  80090c:	01dd8db3          	add	s11,s11,t4
  800910:	00044e83          	lbu	t4,0(s0)
  800914:	fd0d8d93          	addi	s11,s11,-48
  800918:	fd0e8793          	addi	a5,t4,-48
  80091c:	fef670e3          	bleu	a5,a2,8008fc <vprintfmt+0x3d8>
  800920:	000e8e13          	mv	t3,t4
  800924:	fa5ff06f          	j	8008c8 <vprintfmt+0x3a4>
  800928:	0e0cc863          	bltz	s9,800a18 <vprintfmt+0x4f4>
  80092c:	00144e03          	lbu	t3,1(s0)
  800930:	000d0413          	mv	s0,s10
  800934:	ca5ff06f          	j	8005d8 <vprintfmt+0xb4>
  800938:	00098613          	mv	a2,s3
  80093c:	00090593          	mv	a1,s2
  800940:	02500513          	li	a0,37
  800944:	000a00e7          	jalr	s4
  800948:	fff44783          	lbu	a5,-1(s0)
  80094c:	02500713          	li	a4,37
  800950:	00040d13          	mv	s10,s0
  800954:	c2e786e3          	beq	a5,a4,800580 <vprintfmt+0x5c>
  800958:	fffd0d13          	addi	s10,s10,-1
  80095c:	fffd4783          	lbu	a5,-1(s10)
  800960:	fee79ce3          	bne	a5,a4,800958 <vprintfmt+0x434>
  800964:	c1dff06f          	j	800580 <vprintfmt+0x5c>
  800968:	00040513          	mv	a0,s0
  80096c:	000a00e7          	jalr	s4
  800970:	ecdff06f          	j	80083c <vprintfmt+0x318>
  800974:	007b0793          	addi	a5,s6,7
  800978:	ff87f793          	andi	a5,a5,-8
  80097c:	00878b13          	addi	s6,a5,8
  800980:	0007a703          	lw	a4,0(a5)
  800984:	00800813          	li	a6,8
  800988:	0047a783          	lw	a5,4(a5)
  80098c:	cc5ff06f          	j	800650 <vprintfmt+0x12c>
  800990:	007b0793          	addi	a5,s6,7
  800994:	ff87f793          	andi	a5,a5,-8
  800998:	00878b13          	addi	s6,a5,8
  80099c:	0007a703          	lw	a4,0(a5)
  8009a0:	00a00813          	li	a6,10
  8009a4:	0047a783          	lw	a5,4(a5)
  8009a8:	ca9ff06f          	j	800650 <vprintfmt+0x12c>
  8009ac:	007b0793          	addi	a5,s6,7
  8009b0:	ff87f793          	andi	a5,a5,-8
  8009b4:	00878b13          	addi	s6,a5,8
  8009b8:	0007a703          	lw	a4,0(a5)
  8009bc:	01000813          	li	a6,16
  8009c0:	0047a783          	lw	a5,4(a5)
  8009c4:	c8dff06f          	j	800650 <vprintfmt+0x12c>
  8009c8:	007b0793          	addi	a5,s6,7
  8009cc:	ff87f793          	andi	a5,a5,-8
  8009d0:	00878b13          	addi	s6,a5,8
  8009d4:	0007a703          	lw	a4,0(a5)
  8009d8:	0047a783          	lw	a5,4(a5)
  8009dc:	ccdff06f          	j	8006a8 <vprintfmt+0x184>
  8009e0:	00078713          	mv	a4,a5
  8009e4:	00000697          	auipc	a3,0x0
  8009e8:	73c68693          	addi	a3,a3,1852 # 801120 <error_string+0x22c>
  8009ec:	00090613          	mv	a2,s2
  8009f0:	00098593          	mv	a1,s3
  8009f4:	000a0513          	mv	a0,s4
  8009f8:	078000ef          	jal	ra,800a70 <printfmt>
  8009fc:	b85ff06f          	j	800580 <vprintfmt+0x5c>
  800a00:	00044783          	lbu	a5,0(s0)
  800a04:	00140b13          	addi	s6,s0,1
  800a08:	00078513          	mv	a0,a5
  800a0c:	e40784e3          	beqz	a5,800854 <vprintfmt+0x330>
  800a10:	03f00413          	li	s0,63
  800a14:	e05ff06f          	j	800818 <vprintfmt+0x2f4>
  800a18:	00000c93          	li	s9,0
  800a1c:	f11ff06f          	j	80092c <vprintfmt+0x408>
  800a20:	03905c63          	blez	s9,800a58 <vprintfmt+0x534>
  800a24:	02d00793          	li	a5,45
  800a28:	00000417          	auipc	s0,0x0
  800a2c:	6f040413          	addi	s0,s0,1776 # 801118 <error_string+0x224>
  800a30:	d8f69ce3          	bne	a3,a5,8007c8 <vprintfmt+0x2a4>
  800a34:	02800513          	li	a0,40
  800a38:	00000b17          	auipc	s6,0x0
  800a3c:	6e1b0b13          	addi	s6,s6,1761 # 801119 <error_string+0x225>
  800a40:	00050793          	mv	a5,a0
  800a44:	03f00413          	li	s0,63
  800a48:	dd1ff06f          	j	800818 <vprintfmt+0x2f4>
  800a4c:	000e8e13          	mv	t3,t4
  800a50:	000d0413          	mv	s0,s10
  800a54:	e75ff06f          	j	8008c8 <vprintfmt+0x3a4>
  800a58:	02800793          	li	a5,40
  800a5c:	00078513          	mv	a0,a5
  800a60:	00000b17          	auipc	s6,0x0
  800a64:	6b9b0b13          	addi	s6,s6,1721 # 801119 <error_string+0x225>
  800a68:	03f00413          	li	s0,63
  800a6c:	dadff06f          	j	800818 <vprintfmt+0x2f4>

00800a70 <printfmt>:
  800a70:	fd010113          	addi	sp,sp,-48
  800a74:	02010313          	addi	t1,sp,32
  800a78:	02e12023          	sw	a4,32(sp)
  800a7c:	00030713          	mv	a4,t1
  800a80:	00112e23          	sw	ra,28(sp)
  800a84:	02f12223          	sw	a5,36(sp)
  800a88:	03012423          	sw	a6,40(sp)
  800a8c:	03112623          	sw	a7,44(sp)
  800a90:	00612623          	sw	t1,12(sp)
  800a94:	a91ff0ef          	jal	ra,800524 <vprintfmt>
  800a98:	01c12083          	lw	ra,28(sp)
  800a9c:	03010113          	addi	sp,sp,48
  800aa0:	00008067          	ret

00800aa4 <main>:
  800aa4:	fd010113          	addi	sp,sp,-48
  800aa8:	19000593          	li	a1,400
  800aac:	00000517          	auipc	a0,0x0
  800ab0:	68450513          	addi	a0,a0,1668 # 801130 <error_string+0x23c>
  800ab4:	02112623          	sw	ra,44(sp)
  800ab8:	02812423          	sw	s0,40(sp)
  800abc:	02912223          	sw	s1,36(sp)
  800ac0:	03212023          	sw	s2,32(sp)
  800ac4:	01312e23          	sw	s3,28(sp)
  800ac8:	01412c23          	sw	s4,24(sp)
  800acc:	01512a23          	sw	s5,20(sp)
  800ad0:	01612823          	sw	s6,16(sp)
  800ad4:	fd0ff0ef          	jal	ra,8002a4 <cprintf>
  800ad8:	19000513          	li	a0,400
  800adc:	f38ff0ef          	jal	ra,800214 <sleep>
  800ae0:	01400613          	li	a2,20
  800ae4:	00000593          	li	a1,0
  800ae8:	00001517          	auipc	a0,0x1
  800aec:	54050513          	addi	a0,a0,1344 # 802028 <pids>
  800af0:	959ff0ef          	jal	ra,800448 <memset>
  800af4:	00001497          	auipc	s1,0x1
  800af8:	53448493          	addi	s1,s1,1332 # 802028 <pids>
  800afc:	00600513          	li	a0,6
  800b00:	00001a97          	auipc	s5,0x1
  800b04:	500a8a93          	addi	s5,s5,1280 # 802000 <acc>
  800b08:	f08ff0ef          	jal	ra,800210 <lab6_set_priority>
  800b0c:	000a8993          	mv	s3,s5
  800b10:	00048b13          	mv	s6,s1
  800b14:	00048913          	mv	s2,s1
  800b18:	00000413          	li	s0,0
  800b1c:	00500a13          	li	s4,5
  800b20:	0009a023          	sw	zero,0(s3)
  800b24:	edcff0ef          	jal	ra,800200 <fork>
  800b28:	00a92023          	sw	a0,0(s2)
  800b2c:	10050463          	beqz	a0,800c34 <main+0x190>
  800b30:	18054663          	bltz	a0,800cbc <main+0x218>
  800b34:	00140413          	addi	s0,s0,1
  800b38:	00498993          	addi	s3,s3,4
  800b3c:	00490913          	addi	s2,s2,4
  800b40:	ff4410e3          	bne	s0,s4,800b20 <main+0x7c>
  800b44:	00000517          	auipc	a0,0x0
  800b48:	63450513          	addi	a0,a0,1588 # 801178 <error_string+0x284>
  800b4c:	00001917          	auipc	s2,0x1
  800b50:	4c890913          	addi	s2,s2,1224 # 802014 <status>
  800b54:	f50ff0ef          	jal	ra,8002a4 <cprintf>
  800b58:	00001b17          	auipc	s6,0x1
  800b5c:	4d0b0b13          	addi	s6,s6,1232 # 802028 <pids>
  800b60:	00090413          	mv	s0,s2
  800b64:	00000a97          	auipc	s5,0x0
  800b68:	63ca8a93          	addi	s5,s5,1596 # 8011a0 <error_string+0x2ac>
  800b6c:	0004a503          	lw	a0,0(s1)
  800b70:	00040593          	mv	a1,s0
  800b74:	00042023          	sw	zero,0(s0)
  800b78:	e8cff0ef          	jal	ra,800204 <waitpid>
  800b7c:	00042a03          	lw	s4,0(s0)
  800b80:	0004a983          	lw	s3,0(s1)
  800b84:	e94ff0ef          	jal	ra,800218 <gettime_msec>
  800b88:	00440413          	addi	s0,s0,4
  800b8c:	00050693          	mv	a3,a0
  800b90:	000a0613          	mv	a2,s4
  800b94:	00098593          	mv	a1,s3
  800b98:	000a8513          	mv	a0,s5
  800b9c:	00448493          	addi	s1,s1,4
  800ba0:	f04ff0ef          	jal	ra,8002a4 <cprintf>
  800ba4:	fd6414e3          	bne	s0,s6,800b6c <main+0xc8>
  800ba8:	00000517          	auipc	a0,0x0
  800bac:	61850513          	addi	a0,a0,1560 # 8011c0 <error_string+0x2cc>
  800bb0:	ef4ff0ef          	jal	ra,8002a4 <cprintf>
  800bb4:	00000517          	auipc	a0,0x0
  800bb8:	62450513          	addi	a0,a0,1572 # 8011d8 <error_string+0x2e4>
  800bbc:	ee8ff0ef          	jal	ra,8002a4 <cprintf>
  800bc0:	00000497          	auipc	s1,0x0
  800bc4:	63848493          	addi	s1,s1,1592 # 8011f8 <error_string+0x304>
  800bc8:	00092583          	lw	a1,0(s2)
  800bcc:	00001797          	auipc	a5,0x1
  800bd0:	4487a783          	lw	a5,1096(a5) # 802014 <status>
  800bd4:	00490913          	addi	s2,s2,4
  800bd8:	00159593          	slli	a1,a1,0x1
  800bdc:	02f5c5b3          	div	a1,a1,a5
  800be0:	00048513          	mv	a0,s1
  800be4:	00158593          	addi	a1,a1,1
  800be8:	01f5d793          	srli	a5,a1,0x1f
  800bec:	00b785b3          	add	a1,a5,a1
  800bf0:	4015d593          	srai	a1,a1,0x1
  800bf4:	eb0ff0ef          	jal	ra,8002a4 <cprintf>
  800bf8:	fc8918e3          	bne	s2,s0,800bc8 <main+0x124>
  800bfc:	00000517          	auipc	a0,0x0
  800c00:	16450513          	addi	a0,a0,356 # 800d60 <main+0x2bc>
  800c04:	ea0ff0ef          	jal	ra,8002a4 <cprintf>
  800c08:	02c12083          	lw	ra,44(sp)
  800c0c:	00000513          	li	a0,0
  800c10:	02812403          	lw	s0,40(sp)
  800c14:	02412483          	lw	s1,36(sp)
  800c18:	02012903          	lw	s2,32(sp)
  800c1c:	01c12983          	lw	s3,28(sp)
  800c20:	01812a03          	lw	s4,24(sp)
  800c24:	01412a83          	lw	s5,20(sp)
  800c28:	01012b03          	lw	s6,16(sp)
  800c2c:	03010113          	addi	sp,sp,48
  800c30:	00008067          	ret
  800c34:	00140513          	addi	a0,s0,1
  800c38:	00241413          	slli	s0,s0,0x2
  800c3c:	008a8433          	add	s0,s5,s0
  800c40:	000014b7          	lui	s1,0x1
  800c44:	dccff0ef          	jal	ra,800210 <lab6_set_priority>
  800c48:	fa048493          	addi	s1,s1,-96 # fa0 <__panic-0x7ff080>
  800c4c:	00042023          	sw	zero,0(s0)
  800c50:	57800993          	li	s3,1400
  800c54:	00042683          	lw	a3,0(s0)
  800c58:	00168693          	addi	a3,a3,1
  800c5c:	0c800713          	li	a4,200
  800c60:	00c12783          	lw	a5,12(sp)
  800c64:	fff70713          	addi	a4,a4,-1
  800c68:	0017b793          	seqz	a5,a5
  800c6c:	00f12623          	sw	a5,12(sp)
  800c70:	fe0718e3          	bnez	a4,800c60 <main+0x1bc>
  800c74:	0296f7b3          	remu	a5,a3,s1
  800c78:	00168713          	addi	a4,a3,1
  800c7c:	00078663          	beqz	a5,800c88 <main+0x1e4>
  800c80:	00070693          	mv	a3,a4
  800c84:	fd9ff06f          	j	800c5c <main+0x1b8>
  800c88:	00d42023          	sw	a3,0(s0)
  800c8c:	d8cff0ef          	jal	ra,800218 <gettime_msec>
  800c90:	00050913          	mv	s2,a0
  800c94:	fca9d0e3          	ble	a0,s3,800c54 <main+0x1b0>
  800c98:	d74ff0ef          	jal	ra,80020c <getpid>
  800c9c:	00042603          	lw	a2,0(s0)
  800ca0:	00050593          	mv	a1,a0
  800ca4:	00090693          	mv	a3,s2
  800ca8:	00000517          	auipc	a0,0x0
  800cac:	4b050513          	addi	a0,a0,1200 # 801158 <error_string+0x264>
  800cb0:	df4ff0ef          	jal	ra,8002a4 <cprintf>
  800cb4:	00042503          	lw	a0,0(s0)
  800cb8:	d2cff0ef          	jal	ra,8001e4 <exit>
  800cbc:	00000413          	li	s0,0
  800cc0:	01400493          	li	s1,20
  800cc4:	008b07b3          	add	a5,s6,s0
  800cc8:	0007a503          	lw	a0,0(a5)
  800ccc:	00a05463          	blez	a0,800cd4 <main+0x230>
  800cd0:	d38ff0ef          	jal	ra,800208 <kill>
  800cd4:	00440413          	addi	s0,s0,4
  800cd8:	fe9416e3          	bne	s0,s1,800cc4 <main+0x220>
  800cdc:	00000617          	auipc	a2,0x0
  800ce0:	52060613          	addi	a2,a2,1312 # 8011fc <error_string+0x308>
  800ce4:	04e00593          	li	a1,78
  800ce8:	00000517          	auipc	a0,0x0
  800cec:	52050513          	addi	a0,a0,1312 # 801208 <error_string+0x314>
  800cf0:	b30ff0ef          	jal	ra,800020 <__panic>
