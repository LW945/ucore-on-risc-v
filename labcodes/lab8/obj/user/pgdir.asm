
obj/__user_pgdir.out:     file format elf32-littleriscv


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
  800040:	9f450513          	addi	a0,a0,-1548 # 800a30 <main+0x58>
  800044:	00112e23          	sw	ra,28(sp)
  800048:	02d12623          	sw	a3,44(sp)
  80004c:	02e12823          	sw	a4,48(sp)
  800050:	03012c23          	sw	a6,56(sp)
  800054:	03112e23          	sw	a7,60(sp)
  800058:	00f12623          	sw	a5,12(sp)
  80005c:	198000ef          	jal	ra,8001f4 <cprintf>
  800060:	00c12583          	lw	a1,12(sp)
  800064:	00040513          	mv	a0,s0
  800068:	150000ef          	jal	ra,8001b8 <vcprintf>
  80006c:	00001517          	auipc	a0,0x1
  800070:	a1450513          	addi	a0,a0,-1516 # 800a80 <main+0xa8>
  800074:	180000ef          	jal	ra,8001f4 <cprintf>
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

00800114 <sys_pgdir>:
  800114:	01f00513          	li	a0,31
  800118:	f71ff06f          	j	800088 <syscall>

0080011c <sys_open>:
  80011c:	00058613          	mv	a2,a1
  800120:	00050593          	mv	a1,a0
  800124:	06400513          	li	a0,100
  800128:	f61ff06f          	j	800088 <syscall>

0080012c <sys_close>:
  80012c:	00050593          	mv	a1,a0
  800130:	06500513          	li	a0,101
  800134:	f55ff06f          	j	800088 <syscall>

00800138 <sys_dup>:
  800138:	00058613          	mv	a2,a1
  80013c:	00050593          	mv	a1,a0
  800140:	08200513          	li	a0,130
  800144:	f45ff06f          	j	800088 <syscall>

00800148 <exit>:
  800148:	ff010113          	addi	sp,sp,-16
  80014c:	00112623          	sw	ra,12(sp)
  800150:	fa5ff0ef          	jal	ra,8000f4 <sys_exit>
  800154:	00001517          	auipc	a0,0x1
  800158:	8f850513          	addi	a0,a0,-1800 # 800a4c <main+0x74>
  80015c:	098000ef          	jal	ra,8001f4 <cprintf>
  800160:	0000006f          	j	800160 <exit+0x18>

00800164 <getpid>:
  800164:	f9dff06f          	j	800100 <sys_getpid>

00800168 <print_pgdir>:
  800168:	fadff06f          	j	800114 <sys_pgdir>

0080016c <_start>:
  80016c:	00012503          	lw	a0,0(sp)
  800170:	00410593          	addi	a1,sp,4
  800174:	14c000ef          	jal	ra,8002c0 <umain>
  800178:	0000006f          	j	800178 <_start+0xc>

0080017c <open>:
  80017c:	fa1ff06f          	j	80011c <sys_open>

00800180 <close>:
  800180:	fadff06f          	j	80012c <sys_close>

00800184 <dup2>:
  800184:	fb5ff06f          	j	800138 <sys_dup>

00800188 <cputch>:
  800188:	ff010113          	addi	sp,sp,-16
  80018c:	00112623          	sw	ra,12(sp)
  800190:	00812423          	sw	s0,8(sp)
  800194:	00058413          	mv	s0,a1
  800198:	f71ff0ef          	jal	ra,800108 <sys_putc>
  80019c:	00042783          	lw	a5,0(s0)
  8001a0:	00c12083          	lw	ra,12(sp)
  8001a4:	00178793          	addi	a5,a5,1
  8001a8:	00f42023          	sw	a5,0(s0)
  8001ac:	00812403          	lw	s0,8(sp)
  8001b0:	01010113          	addi	sp,sp,16
  8001b4:	00008067          	ret

008001b8 <vcprintf>:
  8001b8:	fe010113          	addi	sp,sp,-32
  8001bc:	00058713          	mv	a4,a1
  8001c0:	ffff75b7          	lui	a1,0xffff7
  8001c4:	00050693          	mv	a3,a0
  8001c8:	00c10613          	addi	a2,sp,12
  8001cc:	00000517          	auipc	a0,0x0
  8001d0:	fbc50513          	addi	a0,a0,-68 # 800188 <cputch>
  8001d4:	ad958593          	addi	a1,a1,-1319 # ffff6ad9 <sbi_remote_fence_i+0xffff71e9>
  8001d8:	00112e23          	sw	ra,28(sp)
  8001dc:	00012623          	sw	zero,12(sp)
  8001e0:	278000ef          	jal	ra,800458 <vprintfmt>
  8001e4:	01c12083          	lw	ra,28(sp)
  8001e8:	00c12503          	lw	a0,12(sp)
  8001ec:	02010113          	addi	sp,sp,32
  8001f0:	00008067          	ret

008001f4 <cprintf>:
  8001f4:	fc010113          	addi	sp,sp,-64
  8001f8:	02410313          	addi	t1,sp,36
  8001fc:	02b12223          	sw	a1,36(sp)
  800200:	ffff75b7          	lui	a1,0xffff7
  800204:	02c12423          	sw	a2,40(sp)
  800208:	02d12623          	sw	a3,44(sp)
  80020c:	02e12823          	sw	a4,48(sp)
  800210:	00050693          	mv	a3,a0
  800214:	00c10613          	addi	a2,sp,12
  800218:	00000517          	auipc	a0,0x0
  80021c:	f7050513          	addi	a0,a0,-144 # 800188 <cputch>
  800220:	00030713          	mv	a4,t1
  800224:	ad958593          	addi	a1,a1,-1319 # ffff6ad9 <sbi_remote_fence_i+0xffff71e9>
  800228:	00112e23          	sw	ra,28(sp)
  80022c:	02f12a23          	sw	a5,52(sp)
  800230:	03012c23          	sw	a6,56(sp)
  800234:	03112e23          	sw	a7,60(sp)
  800238:	00612423          	sw	t1,8(sp)
  80023c:	00012623          	sw	zero,12(sp)
  800240:	218000ef          	jal	ra,800458 <vprintfmt>
  800244:	01c12083          	lw	ra,28(sp)
  800248:	00c12503          	lw	a0,12(sp)
  80024c:	04010113          	addi	sp,sp,64
  800250:	00008067          	ret

00800254 <initfd>:
  800254:	ff010113          	addi	sp,sp,-16
  800258:	00058793          	mv	a5,a1
  80025c:	00912223          	sw	s1,4(sp)
  800260:	00060593          	mv	a1,a2
  800264:	00050493          	mv	s1,a0
  800268:	00078513          	mv	a0,a5
  80026c:	00812423          	sw	s0,8(sp)
  800270:	00112623          	sw	ra,12(sp)
  800274:	f09ff0ef          	jal	ra,80017c <open>
  800278:	00050413          	mv	s0,a0
  80027c:	02054663          	bltz	a0,8002a8 <initfd+0x54>
  800280:	02950463          	beq	a0,s1,8002a8 <initfd+0x54>
  800284:	00048513          	mv	a0,s1
  800288:	ef9ff0ef          	jal	ra,800180 <close>
  80028c:	00048593          	mv	a1,s1
  800290:	00040513          	mv	a0,s0
  800294:	ef1ff0ef          	jal	ra,800184 <dup2>
  800298:	00050493          	mv	s1,a0
  80029c:	00040513          	mv	a0,s0
  8002a0:	ee1ff0ef          	jal	ra,800180 <close>
  8002a4:	00048413          	mv	s0,s1
  8002a8:	00c12083          	lw	ra,12(sp)
  8002ac:	00040513          	mv	a0,s0
  8002b0:	00412483          	lw	s1,4(sp)
  8002b4:	00812403          	lw	s0,8(sp)
  8002b8:	01010113          	addi	sp,sp,16
  8002bc:	00008067          	ret

008002c0 <umain>:
  8002c0:	ff010113          	addi	sp,sp,-16
  8002c4:	00812423          	sw	s0,8(sp)
  8002c8:	00912223          	sw	s1,4(sp)
  8002cc:	00050413          	mv	s0,a0
  8002d0:	00058493          	mv	s1,a1
  8002d4:	00000613          	li	a2,0
  8002d8:	00000597          	auipc	a1,0x0
  8002dc:	78858593          	addi	a1,a1,1928 # 800a60 <main+0x88>
  8002e0:	00000513          	li	a0,0
  8002e4:	00112623          	sw	ra,12(sp)
  8002e8:	f6dff0ef          	jal	ra,800254 <initfd>
  8002ec:	02054663          	bltz	a0,800318 <umain+0x58>
  8002f0:	00100613          	li	a2,1
  8002f4:	00000597          	auipc	a1,0x0
  8002f8:	7a458593          	addi	a1,a1,1956 # 800a98 <main+0xc0>
  8002fc:	00060513          	mv	a0,a2
  800300:	f55ff0ef          	jal	ra,800254 <initfd>
  800304:	02054a63          	bltz	a0,800338 <umain+0x78>
  800308:	00048593          	mv	a1,s1
  80030c:	00040513          	mv	a0,s0
  800310:	6c8000ef          	jal	ra,8009d8 <main>
  800314:	e35ff0ef          	jal	ra,800148 <exit>
  800318:	00050693          	mv	a3,a0
  80031c:	00000617          	auipc	a2,0x0
  800320:	74c60613          	addi	a2,a2,1868 # 800a68 <main+0x90>
  800324:	01a00593          	li	a1,26
  800328:	00000517          	auipc	a0,0x0
  80032c:	75c50513          	addi	a0,a0,1884 # 800a84 <main+0xac>
  800330:	cf1ff0ef          	jal	ra,800020 <__warn>
  800334:	fbdff06f          	j	8002f0 <umain+0x30>
  800338:	00050693          	mv	a3,a0
  80033c:	00000617          	auipc	a2,0x0
  800340:	76460613          	addi	a2,a2,1892 # 800aa0 <main+0xc8>
  800344:	01d00593          	li	a1,29
  800348:	00000517          	auipc	a0,0x0
  80034c:	73c50513          	addi	a0,a0,1852 # 800a84 <main+0xac>
  800350:	cd1ff0ef          	jal	ra,800020 <__warn>
  800354:	fb5ff06f          	j	800308 <umain+0x48>

00800358 <strnlen>:
  800358:	00050693          	mv	a3,a0
  80035c:	02058a63          	beqz	a1,800390 <strnlen+0x38>
  800360:	00054703          	lbu	a4,0(a0)
  800364:	00150793          	addi	a5,a0,1
  800368:	02070463          	beqz	a4,800390 <strnlen+0x38>
  80036c:	00b505b3          	add	a1,a0,a1
  800370:	0100006f          	j	800380 <strnlen+0x28>
  800374:	00178793          	addi	a5,a5,1
  800378:	fff7c703          	lbu	a4,-1(a5)
  80037c:	00070863          	beqz	a4,80038c <strnlen+0x34>
  800380:	40d78533          	sub	a0,a5,a3
  800384:	feb798e3          	bne	a5,a1,800374 <strnlen+0x1c>
  800388:	00008067          	ret
  80038c:	00008067          	ret
  800390:	00000513          	li	a0,0
  800394:	00008067          	ret

00800398 <printnum>:
  800398:	fd010113          	addi	sp,sp,-48
  80039c:	02912223          	sw	s1,36(sp)
  8003a0:	03212023          	sw	s2,32(sp)
  8003a4:	01312e23          	sw	s3,28(sp)
  8003a8:	01412c23          	sw	s4,24(sp)
  8003ac:	01512a23          	sw	s5,20(sp)
  8003b0:	02112623          	sw	ra,44(sp)
  8003b4:	02812423          	sw	s0,40(sp)
  8003b8:	00050493          	mv	s1,a0
  8003bc:	00058993          	mv	s3,a1
  8003c0:	00060913          	mv	s2,a2
  8003c4:	03012a03          	lw	s4,48(sp)
  8003c8:	03077ab3          	remu	s5,a4,a6
  8003cc:	06079463          	bnez	a5,800434 <printnum+0x9c>
  8003d0:	07077263          	bleu	a6,a4,800434 <printnum+0x9c>
  8003d4:	fff88413          	addi	s0,a7,-1
  8003d8:	00805e63          	blez	s0,8003f4 <printnum+0x5c>
  8003dc:	fff40413          	addi	s0,s0,-1
  8003e0:	00098613          	mv	a2,s3
  8003e4:	00090593          	mv	a1,s2
  8003e8:	000a0513          	mv	a0,s4
  8003ec:	000480e7          	jalr	s1
  8003f0:	fe0416e3          	bnez	s0,8003dc <printnum+0x44>
  8003f4:	00001797          	auipc	a5,0x1
  8003f8:	88478793          	addi	a5,a5,-1916 # 800c78 <error_string+0x64>
  8003fc:	015787b3          	add	a5,a5,s5
  800400:	00098613          	mv	a2,s3
  800404:	00090593          	mv	a1,s2
  800408:	00048313          	mv	t1,s1
  80040c:	02c12083          	lw	ra,44(sp)
  800410:	02812403          	lw	s0,40(sp)
  800414:	02412483          	lw	s1,36(sp)
  800418:	02012903          	lw	s2,32(sp)
  80041c:	01c12983          	lw	s3,28(sp)
  800420:	01812a03          	lw	s4,24(sp)
  800424:	01412a83          	lw	s5,20(sp)
  800428:	0007c503          	lbu	a0,0(a5)
  80042c:	03010113          	addi	sp,sp,48
  800430:	00030067          	jr	t1
  800434:	03075733          	divu	a4,a4,a6
  800438:	01412023          	sw	s4,0(sp)
  80043c:	fff88893          	addi	a7,a7,-1
  800440:	00000793          	li	a5,0
  800444:	00090613          	mv	a2,s2
  800448:	00098593          	mv	a1,s3
  80044c:	00048513          	mv	a0,s1
  800450:	f49ff0ef          	jal	ra,800398 <printnum>
  800454:	fa1ff06f          	j	8003f4 <printnum+0x5c>

00800458 <vprintfmt>:
  800458:	fa010113          	addi	sp,sp,-96
  80045c:	05212823          	sw	s2,80(sp)
  800460:	05312623          	sw	s3,76(sp)
  800464:	05412423          	sw	s4,72(sp)
  800468:	05512223          	sw	s5,68(sp)
  80046c:	05612023          	sw	s6,64(sp)
  800470:	03712e23          	sw	s7,60(sp)
  800474:	03812c23          	sw	s8,56(sp)
  800478:	03a12823          	sw	s10,48(sp)
  80047c:	04112e23          	sw	ra,92(sp)
  800480:	04812c23          	sw	s0,88(sp)
  800484:	04912a23          	sw	s1,84(sp)
  800488:	03912a23          	sw	s9,52(sp)
  80048c:	03b12623          	sw	s11,44(sp)
  800490:	00050a13          	mv	s4,a0
  800494:	00058993          	mv	s3,a1
  800498:	00060913          	mv	s2,a2
  80049c:	00068d13          	mv	s10,a3
  8004a0:	00070b13          	mv	s6,a4
  8004a4:	00000a97          	auipc	s5,0x0
  8004a8:	618a8a93          	addi	s5,s5,1560 # 800abc <main+0xe4>
  8004ac:	fff00b93          	li	s7,-1
  8004b0:	05e00c13          	li	s8,94
  8004b4:	000d4503          	lbu	a0,0(s10)
  8004b8:	02500493          	li	s1,37
  8004bc:	001d0413          	addi	s0,s10,1
  8004c0:	02950063          	beq	a0,s1,8004e0 <vprintfmt+0x88>
  8004c4:	06050663          	beqz	a0,800530 <vprintfmt+0xd8>
  8004c8:	00098613          	mv	a2,s3
  8004cc:	00090593          	mv	a1,s2
  8004d0:	00140413          	addi	s0,s0,1
  8004d4:	000a00e7          	jalr	s4
  8004d8:	fff44503          	lbu	a0,-1(s0)
  8004dc:	fe9514e3          	bne	a0,s1,8004c4 <vprintfmt+0x6c>
  8004e0:	00044e03          	lbu	t3,0(s0)
  8004e4:	fff00d93          	li	s11,-1
  8004e8:	02000693          	li	a3,32
  8004ec:	00000493          	li	s1,0
  8004f0:	00000593          	li	a1,0
  8004f4:	000d8c93          	mv	s9,s11
  8004f8:	05500713          	li	a4,85
  8004fc:	00100313          	li	t1,1
  800500:	03000813          	li	a6,48
  800504:	00900613          	li	a2,9
  800508:	02d00513          	li	a0,45
  80050c:	fdde0793          	addi	a5,t3,-35
  800510:	0ff7f793          	andi	a5,a5,255
  800514:	00140d13          	addi	s10,s0,1
  800518:	34f76a63          	bltu	a4,a5,80086c <vprintfmt+0x414>
  80051c:	00279793          	slli	a5,a5,0x2
  800520:	015787b3          	add	a5,a5,s5
  800524:	0007a783          	lw	a5,0(a5)
  800528:	015787b3          	add	a5,a5,s5
  80052c:	00078067          	jr	a5
  800530:	05c12083          	lw	ra,92(sp)
  800534:	05812403          	lw	s0,88(sp)
  800538:	05412483          	lw	s1,84(sp)
  80053c:	05012903          	lw	s2,80(sp)
  800540:	04c12983          	lw	s3,76(sp)
  800544:	04812a03          	lw	s4,72(sp)
  800548:	04412a83          	lw	s5,68(sp)
  80054c:	04012b03          	lw	s6,64(sp)
  800550:	03c12b83          	lw	s7,60(sp)
  800554:	03812c03          	lw	s8,56(sp)
  800558:	03412c83          	lw	s9,52(sp)
  80055c:	03012d03          	lw	s10,48(sp)
  800560:	02c12d83          	lw	s11,44(sp)
  800564:	06010113          	addi	sp,sp,96
  800568:	00008067          	ret
  80056c:	00100793          	li	a5,1
  800570:	36b7c863          	blt	a5,a1,8008e0 <vprintfmt+0x488>
  800574:	000b2703          	lw	a4,0(s6)
  800578:	00000793          	li	a5,0
  80057c:	004b0b13          	addi	s6,s6,4
  800580:	01000813          	li	a6,16
  800584:	00d12023          	sw	a3,0(sp)
  800588:	000c8893          	mv	a7,s9
  80058c:	00090613          	mv	a2,s2
  800590:	00098593          	mv	a1,s3
  800594:	000a0513          	mv	a0,s4
  800598:	e01ff0ef          	jal	ra,800398 <printnum>
  80059c:	f19ff06f          	j	8004b4 <vprintfmt+0x5c>
  8005a0:	00144e03          	lbu	t3,1(s0)
  8005a4:	00030493          	mv	s1,t1
  8005a8:	000d0413          	mv	s0,s10
  8005ac:	f61ff06f          	j	80050c <vprintfmt+0xb4>
  8005b0:	000b2503          	lw	a0,0(s6)
  8005b4:	00098613          	mv	a2,s3
  8005b8:	00090593          	mv	a1,s2
  8005bc:	004b0b13          	addi	s6,s6,4
  8005c0:	000a00e7          	jalr	s4
  8005c4:	ef1ff06f          	j	8004b4 <vprintfmt+0x5c>
  8005c8:	00100793          	li	a5,1
  8005cc:	32b7c863          	blt	a5,a1,8008fc <vprintfmt+0x4a4>
  8005d0:	000b2703          	lw	a4,0(s6)
  8005d4:	004b0b13          	addi	s6,s6,4
  8005d8:	41f75793          	srai	a5,a4,0x1f
  8005dc:	00a00813          	li	a6,10
  8005e0:	fa07d2e3          	bgez	a5,800584 <vprintfmt+0x12c>
  8005e4:	00098613          	mv	a2,s3
  8005e8:	00090593          	mv	a1,s2
  8005ec:	02d00513          	li	a0,45
  8005f0:	00f12e23          	sw	a5,28(sp)
  8005f4:	00e12c23          	sw	a4,24(sp)
  8005f8:	01012a23          	sw	a6,20(sp)
  8005fc:	00d12823          	sw	a3,16(sp)
  800600:	000a00e7          	jalr	s4
  800604:	01812703          	lw	a4,24(sp)
  800608:	01c12783          	lw	a5,28(sp)
  80060c:	01012683          	lw	a3,16(sp)
  800610:	40e00733          	neg	a4,a4
  800614:	00e03633          	snez	a2,a4
  800618:	40f007b3          	neg	a5,a5
  80061c:	40c787b3          	sub	a5,a5,a2
  800620:	01412803          	lw	a6,20(sp)
  800624:	f61ff06f          	j	800584 <vprintfmt+0x12c>
  800628:	000b2783          	lw	a5,0(s6)
  80062c:	01800693          	li	a3,24
  800630:	004b0b13          	addi	s6,s6,4
  800634:	41f7d713          	srai	a4,a5,0x1f
  800638:	00f747b3          	xor	a5,a4,a5
  80063c:	40e787b3          	sub	a5,a5,a4
  800640:	2cf6ca63          	blt	a3,a5,800914 <vprintfmt+0x4bc>
  800644:	00279693          	slli	a3,a5,0x2
  800648:	00000717          	auipc	a4,0x0
  80064c:	5cc70713          	addi	a4,a4,1484 # 800c14 <error_string>
  800650:	00d70733          	add	a4,a4,a3
  800654:	00072703          	lw	a4,0(a4)
  800658:	2a070e63          	beqz	a4,800914 <vprintfmt+0x4bc>
  80065c:	00000697          	auipc	a3,0x0
  800660:	7f068693          	addi	a3,a3,2032 # 800e4c <error_string+0x238>
  800664:	00090613          	mv	a2,s2
  800668:	00098593          	mv	a1,s3
  80066c:	000a0513          	mv	a0,s4
  800670:	334000ef          	jal	ra,8009a4 <printfmt>
  800674:	e41ff06f          	j	8004b4 <vprintfmt+0x5c>
  800678:	00144e03          	lbu	t3,1(s0)
  80067c:	00158593          	addi	a1,a1,1
  800680:	000d0413          	mv	s0,s10
  800684:	e89ff06f          	j	80050c <vprintfmt+0xb4>
  800688:	00100793          	li	a5,1
  80068c:	20b7ce63          	blt	a5,a1,8008a8 <vprintfmt+0x450>
  800690:	000b2703          	lw	a4,0(s6)
  800694:	00000793          	li	a5,0
  800698:	004b0b13          	addi	s6,s6,4
  80069c:	00800813          	li	a6,8
  8006a0:	ee5ff06f          	j	800584 <vprintfmt+0x12c>
  8006a4:	03000513          	li	a0,48
  8006a8:	00098613          	mv	a2,s3
  8006ac:	00090593          	mv	a1,s2
  8006b0:	00d12823          	sw	a3,16(sp)
  8006b4:	000a00e7          	jalr	s4
  8006b8:	00098613          	mv	a2,s3
  8006bc:	00090593          	mv	a1,s2
  8006c0:	07800513          	li	a0,120
  8006c4:	000a00e7          	jalr	s4
  8006c8:	000b2703          	lw	a4,0(s6)
  8006cc:	00000793          	li	a5,0
  8006d0:	01000813          	li	a6,16
  8006d4:	004b0b13          	addi	s6,s6,4
  8006d8:	01012683          	lw	a3,16(sp)
  8006dc:	ea9ff06f          	j	800584 <vprintfmt+0x12c>
  8006e0:	000b2403          	lw	s0,0(s6)
  8006e4:	004b0793          	addi	a5,s6,4
  8006e8:	00f12a23          	sw	a5,20(sp)
  8006ec:	26040463          	beqz	s0,800954 <vprintfmt+0x4fc>
  8006f0:	05905463          	blez	s9,800738 <vprintfmt+0x2e0>
  8006f4:	02d00793          	li	a5,45
  8006f8:	22f68e63          	beq	a3,a5,800934 <vprintfmt+0x4dc>
  8006fc:	000d8593          	mv	a1,s11
  800700:	00040513          	mv	a0,s0
  800704:	00d12823          	sw	a3,16(sp)
  800708:	c51ff0ef          	jal	ra,800358 <strnlen>
  80070c:	40ac8cb3          	sub	s9,s9,a0
  800710:	03905463          	blez	s9,800738 <vprintfmt+0x2e0>
  800714:	01012683          	lw	a3,16(sp)
  800718:	00068513          	mv	a0,a3
  80071c:	00098613          	mv	a2,s3
  800720:	00090593          	mv	a1,s2
  800724:	00d12823          	sw	a3,16(sp)
  800728:	fffc8c93          	addi	s9,s9,-1
  80072c:	000a00e7          	jalr	s4
  800730:	01012683          	lw	a3,16(sp)
  800734:	fe0c92e3          	bnez	s9,800718 <vprintfmt+0x2c0>
  800738:	00044783          	lbu	a5,0(s0)
  80073c:	00140b13          	addi	s6,s0,1
  800740:	00078513          	mv	a0,a5
  800744:	06078063          	beqz	a5,8007a4 <vprintfmt+0x34c>
  800748:	03f00413          	li	s0,63
  80074c:	000dc663          	bltz	s11,800758 <vprintfmt+0x300>
  800750:	fffd8d93          	addi	s11,s11,-1
  800754:	037d8863          	beq	s11,s7,800784 <vprintfmt+0x32c>
  800758:	00098613          	mv	a2,s3
  80075c:	00090593          	mv	a1,s2
  800760:	00048663          	beqz	s1,80076c <vprintfmt+0x314>
  800764:	fe078793          	addi	a5,a5,-32
  800768:	12fc6a63          	bltu	s8,a5,80089c <vprintfmt+0x444>
  80076c:	000a00e7          	jalr	s4
  800770:	001b0b13          	addi	s6,s6,1
  800774:	fffb4783          	lbu	a5,-1(s6)
  800778:	fffc8c93          	addi	s9,s9,-1
  80077c:	00078513          	mv	a0,a5
  800780:	fc0796e3          	bnez	a5,80074c <vprintfmt+0x2f4>
  800784:	03905063          	blez	s9,8007a4 <vprintfmt+0x34c>
  800788:	02000413          	li	s0,32
  80078c:	fffc8c93          	addi	s9,s9,-1
  800790:	00098613          	mv	a2,s3
  800794:	00090593          	mv	a1,s2
  800798:	00040513          	mv	a0,s0
  80079c:	000a00e7          	jalr	s4
  8007a0:	fe0c96e3          	bnez	s9,80078c <vprintfmt+0x334>
  8007a4:	01412b03          	lw	s6,20(sp)
  8007a8:	d0dff06f          	j	8004b4 <vprintfmt+0x5c>
  8007ac:	00100793          	li	a5,1
  8007b0:	10b7ca63          	blt	a5,a1,8008c4 <vprintfmt+0x46c>
  8007b4:	000b2703          	lw	a4,0(s6)
  8007b8:	00000793          	li	a5,0
  8007bc:	004b0b13          	addi	s6,s6,4
  8007c0:	00a00813          	li	a6,10
  8007c4:	dc1ff06f          	j	800584 <vprintfmt+0x12c>
  8007c8:	00144e03          	lbu	t3,1(s0)
  8007cc:	00050693          	mv	a3,a0
  8007d0:	000d0413          	mv	s0,s10
  8007d4:	d39ff06f          	j	80050c <vprintfmt+0xb4>
  8007d8:	00098613          	mv	a2,s3
  8007dc:	00090593          	mv	a1,s2
  8007e0:	02500513          	li	a0,37
  8007e4:	000a00e7          	jalr	s4
  8007e8:	ccdff06f          	j	8004b4 <vprintfmt+0x5c>
  8007ec:	000b2d83          	lw	s11,0(s6)
  8007f0:	00144e03          	lbu	t3,1(s0)
  8007f4:	004b0b13          	addi	s6,s6,4
  8007f8:	000d0413          	mv	s0,s10
  8007fc:	d00cd8e3          	bgez	s9,80050c <vprintfmt+0xb4>
  800800:	000d8c93          	mv	s9,s11
  800804:	fff00d93          	li	s11,-1
  800808:	d05ff06f          	j	80050c <vprintfmt+0xb4>
  80080c:	00144e03          	lbu	t3,1(s0)
  800810:	00080693          	mv	a3,a6
  800814:	000d0413          	mv	s0,s10
  800818:	cf5ff06f          	j	80050c <vprintfmt+0xb4>
  80081c:	00144e83          	lbu	t4,1(s0)
  800820:	fd0e0d93          	addi	s11,t3,-48
  800824:	fd0e8793          	addi	a5,t4,-48
  800828:	14f66c63          	bltu	a2,a5,800980 <vprintfmt+0x528>
  80082c:	000d0413          	mv	s0,s10
  800830:	002d9793          	slli	a5,s11,0x2
  800834:	01b78db3          	add	s11,a5,s11
  800838:	00140413          	addi	s0,s0,1
  80083c:	001d9d93          	slli	s11,s11,0x1
  800840:	01dd8db3          	add	s11,s11,t4
  800844:	00044e83          	lbu	t4,0(s0)
  800848:	fd0d8d93          	addi	s11,s11,-48
  80084c:	fd0e8793          	addi	a5,t4,-48
  800850:	fef670e3          	bleu	a5,a2,800830 <vprintfmt+0x3d8>
  800854:	000e8e13          	mv	t3,t4
  800858:	fa5ff06f          	j	8007fc <vprintfmt+0x3a4>
  80085c:	0e0cc863          	bltz	s9,80094c <vprintfmt+0x4f4>
  800860:	00144e03          	lbu	t3,1(s0)
  800864:	000d0413          	mv	s0,s10
  800868:	ca5ff06f          	j	80050c <vprintfmt+0xb4>
  80086c:	00098613          	mv	a2,s3
  800870:	00090593          	mv	a1,s2
  800874:	02500513          	li	a0,37
  800878:	000a00e7          	jalr	s4
  80087c:	fff44783          	lbu	a5,-1(s0)
  800880:	02500713          	li	a4,37
  800884:	00040d13          	mv	s10,s0
  800888:	c2e786e3          	beq	a5,a4,8004b4 <vprintfmt+0x5c>
  80088c:	fffd0d13          	addi	s10,s10,-1
  800890:	fffd4783          	lbu	a5,-1(s10)
  800894:	fee79ce3          	bne	a5,a4,80088c <vprintfmt+0x434>
  800898:	c1dff06f          	j	8004b4 <vprintfmt+0x5c>
  80089c:	00040513          	mv	a0,s0
  8008a0:	000a00e7          	jalr	s4
  8008a4:	ecdff06f          	j	800770 <vprintfmt+0x318>
  8008a8:	007b0793          	addi	a5,s6,7
  8008ac:	ff87f793          	andi	a5,a5,-8
  8008b0:	00878b13          	addi	s6,a5,8
  8008b4:	0007a703          	lw	a4,0(a5)
  8008b8:	00800813          	li	a6,8
  8008bc:	0047a783          	lw	a5,4(a5)
  8008c0:	cc5ff06f          	j	800584 <vprintfmt+0x12c>
  8008c4:	007b0793          	addi	a5,s6,7
  8008c8:	ff87f793          	andi	a5,a5,-8
  8008cc:	00878b13          	addi	s6,a5,8
  8008d0:	0007a703          	lw	a4,0(a5)
  8008d4:	00a00813          	li	a6,10
  8008d8:	0047a783          	lw	a5,4(a5)
  8008dc:	ca9ff06f          	j	800584 <vprintfmt+0x12c>
  8008e0:	007b0793          	addi	a5,s6,7
  8008e4:	ff87f793          	andi	a5,a5,-8
  8008e8:	00878b13          	addi	s6,a5,8
  8008ec:	0007a703          	lw	a4,0(a5)
  8008f0:	01000813          	li	a6,16
  8008f4:	0047a783          	lw	a5,4(a5)
  8008f8:	c8dff06f          	j	800584 <vprintfmt+0x12c>
  8008fc:	007b0793          	addi	a5,s6,7
  800900:	ff87f793          	andi	a5,a5,-8
  800904:	00878b13          	addi	s6,a5,8
  800908:	0007a703          	lw	a4,0(a5)
  80090c:	0047a783          	lw	a5,4(a5)
  800910:	ccdff06f          	j	8005dc <vprintfmt+0x184>
  800914:	00078713          	mv	a4,a5
  800918:	00000697          	auipc	a3,0x0
  80091c:	52868693          	addi	a3,a3,1320 # 800e40 <error_string+0x22c>
  800920:	00090613          	mv	a2,s2
  800924:	00098593          	mv	a1,s3
  800928:	000a0513          	mv	a0,s4
  80092c:	078000ef          	jal	ra,8009a4 <printfmt>
  800930:	b85ff06f          	j	8004b4 <vprintfmt+0x5c>
  800934:	00044783          	lbu	a5,0(s0)
  800938:	00140b13          	addi	s6,s0,1
  80093c:	00078513          	mv	a0,a5
  800940:	e40784e3          	beqz	a5,800788 <vprintfmt+0x330>
  800944:	03f00413          	li	s0,63
  800948:	e05ff06f          	j	80074c <vprintfmt+0x2f4>
  80094c:	00000c93          	li	s9,0
  800950:	f11ff06f          	j	800860 <vprintfmt+0x408>
  800954:	03905c63          	blez	s9,80098c <vprintfmt+0x534>
  800958:	02d00793          	li	a5,45
  80095c:	00000417          	auipc	s0,0x0
  800960:	4dc40413          	addi	s0,s0,1244 # 800e38 <error_string+0x224>
  800964:	d8f69ce3          	bne	a3,a5,8006fc <vprintfmt+0x2a4>
  800968:	02800513          	li	a0,40
  80096c:	00000b17          	auipc	s6,0x0
  800970:	4cdb0b13          	addi	s6,s6,1229 # 800e39 <error_string+0x225>
  800974:	00050793          	mv	a5,a0
  800978:	03f00413          	li	s0,63
  80097c:	dd1ff06f          	j	80074c <vprintfmt+0x2f4>
  800980:	000e8e13          	mv	t3,t4
  800984:	000d0413          	mv	s0,s10
  800988:	e75ff06f          	j	8007fc <vprintfmt+0x3a4>
  80098c:	02800793          	li	a5,40
  800990:	00078513          	mv	a0,a5
  800994:	00000b17          	auipc	s6,0x0
  800998:	4a5b0b13          	addi	s6,s6,1189 # 800e39 <error_string+0x225>
  80099c:	03f00413          	li	s0,63
  8009a0:	dadff06f          	j	80074c <vprintfmt+0x2f4>

008009a4 <printfmt>:
  8009a4:	fd010113          	addi	sp,sp,-48
  8009a8:	02010313          	addi	t1,sp,32
  8009ac:	02e12023          	sw	a4,32(sp)
  8009b0:	00030713          	mv	a4,t1
  8009b4:	00112e23          	sw	ra,28(sp)
  8009b8:	02f12223          	sw	a5,36(sp)
  8009bc:	03012423          	sw	a6,40(sp)
  8009c0:	03112623          	sw	a7,44(sp)
  8009c4:	00612623          	sw	t1,12(sp)
  8009c8:	a91ff0ef          	jal	ra,800458 <vprintfmt>
  8009cc:	01c12083          	lw	ra,28(sp)
  8009d0:	03010113          	addi	sp,sp,48
  8009d4:	00008067          	ret

008009d8 <main>:
  8009d8:	ff010113          	addi	sp,sp,-16
  8009dc:	00112623          	sw	ra,12(sp)
  8009e0:	f84ff0ef          	jal	ra,800164 <getpid>
  8009e4:	00050593          	mv	a1,a0
  8009e8:	00000517          	auipc	a0,0x0
  8009ec:	46850513          	addi	a0,a0,1128 # 800e50 <error_string+0x23c>
  8009f0:	805ff0ef          	jal	ra,8001f4 <cprintf>
  8009f4:	f74ff0ef          	jal	ra,800168 <print_pgdir>
  8009f8:	00000517          	auipc	a0,0x0
  8009fc:	47050513          	addi	a0,a0,1136 # 800e68 <error_string+0x254>
  800a00:	ff4ff0ef          	jal	ra,8001f4 <cprintf>
  800a04:	00c12083          	lw	ra,12(sp)
  800a08:	00000513          	li	a0,0
  800a0c:	01010113          	addi	sp,sp,16
  800a10:	00008067          	ret
