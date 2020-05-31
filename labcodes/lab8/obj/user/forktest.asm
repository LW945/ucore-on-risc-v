
obj/__user_forktest.out:     file format elf32-littleriscv


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
  800040:	adc50513          	addi	a0,a0,-1316 # 800b18 <main+0xd0>
  800044:	00112e23          	sw	ra,28(sp)
  800048:	02d12623          	sw	a3,44(sp)
  80004c:	02e12823          	sw	a4,48(sp)
  800050:	03012c23          	sw	a6,56(sp)
  800054:	03112e23          	sw	a7,60(sp)
  800058:	00f12623          	sw	a5,12(sp)
  80005c:	208000ef          	jal	ra,800264 <cprintf>
  800060:	00c12583          	lw	a1,12(sp)
  800064:	00040513          	mv	a0,s0
  800068:	1c0000ef          	jal	ra,800228 <vcprintf>
  80006c:	00001517          	auipc	a0,0x1
  800070:	b1850513          	addi	a0,a0,-1256 # 800b84 <main+0x13c>
  800074:	1f0000ef          	jal	ra,800264 <cprintf>
  800078:	ff600513          	li	a0,-10
  80007c:	134000ef          	jal	ra,8001b0 <exit>

00800080 <__warn>:
  800080:	fc010113          	addi	sp,sp,-64
  800084:	00812c23          	sw	s0,24(sp)
  800088:	02f12a23          	sw	a5,52(sp)
  80008c:	00060413          	mv	s0,a2
  800090:	02c10793          	addi	a5,sp,44
  800094:	00058613          	mv	a2,a1
  800098:	00050593          	mv	a1,a0
  80009c:	00001517          	auipc	a0,0x1
  8000a0:	a9850513          	addi	a0,a0,-1384 # 800b34 <main+0xec>
  8000a4:	00112e23          	sw	ra,28(sp)
  8000a8:	02d12623          	sw	a3,44(sp)
  8000ac:	02e12823          	sw	a4,48(sp)
  8000b0:	03012c23          	sw	a6,56(sp)
  8000b4:	03112e23          	sw	a7,60(sp)
  8000b8:	00f12623          	sw	a5,12(sp)
  8000bc:	1a8000ef          	jal	ra,800264 <cprintf>
  8000c0:	00c12583          	lw	a1,12(sp)
  8000c4:	00040513          	mv	a0,s0
  8000c8:	160000ef          	jal	ra,800228 <vcprintf>
  8000cc:	00001517          	auipc	a0,0x1
  8000d0:	ab850513          	addi	a0,a0,-1352 # 800b84 <main+0x13c>
  8000d4:	190000ef          	jal	ra,800264 <cprintf>
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

00800184 <sys_open>:
  800184:	00058613          	mv	a2,a1
  800188:	00050593          	mv	a1,a0
  80018c:	06400513          	li	a0,100
  800190:	f59ff06f          	j	8000e8 <syscall>

00800194 <sys_close>:
  800194:	00050593          	mv	a1,a0
  800198:	06500513          	li	a0,101
  80019c:	f4dff06f          	j	8000e8 <syscall>

008001a0 <sys_dup>:
  8001a0:	00058613          	mv	a2,a1
  8001a4:	00050593          	mv	a1,a0
  8001a8:	08200513          	li	a0,130
  8001ac:	f3dff06f          	j	8000e8 <syscall>

008001b0 <exit>:
  8001b0:	ff010113          	addi	sp,sp,-16
  8001b4:	00112623          	sw	ra,12(sp)
  8001b8:	f9dff0ef          	jal	ra,800154 <sys_exit>
  8001bc:	00001517          	auipc	a0,0x1
  8001c0:	99450513          	addi	a0,a0,-1644 # 800b50 <main+0x108>
  8001c4:	0a0000ef          	jal	ra,800264 <cprintf>
  8001c8:	0000006f          	j	8001c8 <exit+0x18>

008001cc <fork>:
  8001cc:	f95ff06f          	j	800160 <sys_fork>

008001d0 <wait>:
  8001d0:	00000593          	li	a1,0
  8001d4:	00000513          	li	a0,0
  8001d8:	f91ff06f          	j	800168 <sys_wait>

008001dc <_start>:
  8001dc:	00012503          	lw	a0,0(sp)
  8001e0:	00410593          	addi	a1,sp,4
  8001e4:	14c000ef          	jal	ra,800330 <umain>
  8001e8:	0000006f          	j	8001e8 <_start+0xc>

008001ec <open>:
  8001ec:	f99ff06f          	j	800184 <sys_open>

008001f0 <close>:
  8001f0:	fa5ff06f          	j	800194 <sys_close>

008001f4 <dup2>:
  8001f4:	fadff06f          	j	8001a0 <sys_dup>

008001f8 <cputch>:
  8001f8:	ff010113          	addi	sp,sp,-16
  8001fc:	00112623          	sw	ra,12(sp)
  800200:	00812423          	sw	s0,8(sp)
  800204:	00058413          	mv	s0,a1
  800208:	f71ff0ef          	jal	ra,800178 <sys_putc>
  80020c:	00042783          	lw	a5,0(s0)
  800210:	00c12083          	lw	ra,12(sp)
  800214:	00178793          	addi	a5,a5,1
  800218:	00f42023          	sw	a5,0(s0)
  80021c:	00812403          	lw	s0,8(sp)
  800220:	01010113          	addi	sp,sp,16
  800224:	00008067          	ret

00800228 <vcprintf>:
  800228:	fe010113          	addi	sp,sp,-32
  80022c:	00058713          	mv	a4,a1
  800230:	ffff75b7          	lui	a1,0xffff7
  800234:	00050693          	mv	a3,a0
  800238:	00c10613          	addi	a2,sp,12
  80023c:	00000517          	auipc	a0,0x0
  800240:	fbc50513          	addi	a0,a0,-68 # 8001f8 <cputch>
  800244:	ad958593          	addi	a1,a1,-1319 # ffff6ad9 <sbi_remote_fence_i+0xffff71e9>
  800248:	00112e23          	sw	ra,28(sp)
  80024c:	00012623          	sw	zero,12(sp)
  800250:	278000ef          	jal	ra,8004c8 <vprintfmt>
  800254:	01c12083          	lw	ra,28(sp)
  800258:	00c12503          	lw	a0,12(sp)
  80025c:	02010113          	addi	sp,sp,32
  800260:	00008067          	ret

00800264 <cprintf>:
  800264:	fc010113          	addi	sp,sp,-64
  800268:	02410313          	addi	t1,sp,36
  80026c:	02b12223          	sw	a1,36(sp)
  800270:	ffff75b7          	lui	a1,0xffff7
  800274:	02c12423          	sw	a2,40(sp)
  800278:	02d12623          	sw	a3,44(sp)
  80027c:	02e12823          	sw	a4,48(sp)
  800280:	00050693          	mv	a3,a0
  800284:	00c10613          	addi	a2,sp,12
  800288:	00000517          	auipc	a0,0x0
  80028c:	f7050513          	addi	a0,a0,-144 # 8001f8 <cputch>
  800290:	00030713          	mv	a4,t1
  800294:	ad958593          	addi	a1,a1,-1319 # ffff6ad9 <sbi_remote_fence_i+0xffff71e9>
  800298:	00112e23          	sw	ra,28(sp)
  80029c:	02f12a23          	sw	a5,52(sp)
  8002a0:	03012c23          	sw	a6,56(sp)
  8002a4:	03112e23          	sw	a7,60(sp)
  8002a8:	00612423          	sw	t1,8(sp)
  8002ac:	00012623          	sw	zero,12(sp)
  8002b0:	218000ef          	jal	ra,8004c8 <vprintfmt>
  8002b4:	01c12083          	lw	ra,28(sp)
  8002b8:	00c12503          	lw	a0,12(sp)
  8002bc:	04010113          	addi	sp,sp,64
  8002c0:	00008067          	ret

008002c4 <initfd>:
  8002c4:	ff010113          	addi	sp,sp,-16
  8002c8:	00058793          	mv	a5,a1
  8002cc:	00912223          	sw	s1,4(sp)
  8002d0:	00060593          	mv	a1,a2
  8002d4:	00050493          	mv	s1,a0
  8002d8:	00078513          	mv	a0,a5
  8002dc:	00812423          	sw	s0,8(sp)
  8002e0:	00112623          	sw	ra,12(sp)
  8002e4:	f09ff0ef          	jal	ra,8001ec <open>
  8002e8:	00050413          	mv	s0,a0
  8002ec:	02054663          	bltz	a0,800318 <initfd+0x54>
  8002f0:	02950463          	beq	a0,s1,800318 <initfd+0x54>
  8002f4:	00048513          	mv	a0,s1
  8002f8:	ef9ff0ef          	jal	ra,8001f0 <close>
  8002fc:	00048593          	mv	a1,s1
  800300:	00040513          	mv	a0,s0
  800304:	ef1ff0ef          	jal	ra,8001f4 <dup2>
  800308:	00050493          	mv	s1,a0
  80030c:	00040513          	mv	a0,s0
  800310:	ee1ff0ef          	jal	ra,8001f0 <close>
  800314:	00048413          	mv	s0,s1
  800318:	00c12083          	lw	ra,12(sp)
  80031c:	00040513          	mv	a0,s0
  800320:	00412483          	lw	s1,4(sp)
  800324:	00812403          	lw	s0,8(sp)
  800328:	01010113          	addi	sp,sp,16
  80032c:	00008067          	ret

00800330 <umain>:
  800330:	ff010113          	addi	sp,sp,-16
  800334:	00812423          	sw	s0,8(sp)
  800338:	00912223          	sw	s1,4(sp)
  80033c:	00050413          	mv	s0,a0
  800340:	00058493          	mv	s1,a1
  800344:	00000613          	li	a2,0
  800348:	00001597          	auipc	a1,0x1
  80034c:	81c58593          	addi	a1,a1,-2020 # 800b64 <main+0x11c>
  800350:	00000513          	li	a0,0
  800354:	00112623          	sw	ra,12(sp)
  800358:	f6dff0ef          	jal	ra,8002c4 <initfd>
  80035c:	02054663          	bltz	a0,800388 <umain+0x58>
  800360:	00100613          	li	a2,1
  800364:	00001597          	auipc	a1,0x1
  800368:	83858593          	addi	a1,a1,-1992 # 800b9c <main+0x154>
  80036c:	00060513          	mv	a0,a2
  800370:	f55ff0ef          	jal	ra,8002c4 <initfd>
  800374:	02054a63          	bltz	a0,8003a8 <umain+0x78>
  800378:	00048593          	mv	a1,s1
  80037c:	00040513          	mv	a0,s0
  800380:	6c8000ef          	jal	ra,800a48 <main>
  800384:	e2dff0ef          	jal	ra,8001b0 <exit>
  800388:	00050693          	mv	a3,a0
  80038c:	00000617          	auipc	a2,0x0
  800390:	7e060613          	addi	a2,a2,2016 # 800b6c <main+0x124>
  800394:	01a00593          	li	a1,26
  800398:	00000517          	auipc	a0,0x0
  80039c:	7f050513          	addi	a0,a0,2032 # 800b88 <main+0x140>
  8003a0:	ce1ff0ef          	jal	ra,800080 <__warn>
  8003a4:	fbdff06f          	j	800360 <umain+0x30>
  8003a8:	00050693          	mv	a3,a0
  8003ac:	00000617          	auipc	a2,0x0
  8003b0:	7f860613          	addi	a2,a2,2040 # 800ba4 <main+0x15c>
  8003b4:	01d00593          	li	a1,29
  8003b8:	00000517          	auipc	a0,0x0
  8003bc:	7d050513          	addi	a0,a0,2000 # 800b88 <main+0x140>
  8003c0:	cc1ff0ef          	jal	ra,800080 <__warn>
  8003c4:	fb5ff06f          	j	800378 <umain+0x48>

008003c8 <strnlen>:
  8003c8:	00050693          	mv	a3,a0
  8003cc:	02058a63          	beqz	a1,800400 <strnlen+0x38>
  8003d0:	00054703          	lbu	a4,0(a0)
  8003d4:	00150793          	addi	a5,a0,1
  8003d8:	02070463          	beqz	a4,800400 <strnlen+0x38>
  8003dc:	00b505b3          	add	a1,a0,a1
  8003e0:	0100006f          	j	8003f0 <strnlen+0x28>
  8003e4:	00178793          	addi	a5,a5,1
  8003e8:	fff7c703          	lbu	a4,-1(a5)
  8003ec:	00070863          	beqz	a4,8003fc <strnlen+0x34>
  8003f0:	40d78533          	sub	a0,a5,a3
  8003f4:	feb798e3          	bne	a5,a1,8003e4 <strnlen+0x1c>
  8003f8:	00008067          	ret
  8003fc:	00008067          	ret
  800400:	00000513          	li	a0,0
  800404:	00008067          	ret

00800408 <printnum>:
  800408:	fd010113          	addi	sp,sp,-48
  80040c:	02912223          	sw	s1,36(sp)
  800410:	03212023          	sw	s2,32(sp)
  800414:	01312e23          	sw	s3,28(sp)
  800418:	01412c23          	sw	s4,24(sp)
  80041c:	01512a23          	sw	s5,20(sp)
  800420:	02112623          	sw	ra,44(sp)
  800424:	02812423          	sw	s0,40(sp)
  800428:	00050493          	mv	s1,a0
  80042c:	00058993          	mv	s3,a1
  800430:	00060913          	mv	s2,a2
  800434:	03012a03          	lw	s4,48(sp)
  800438:	03077ab3          	remu	s5,a4,a6
  80043c:	06079463          	bnez	a5,8004a4 <printnum+0x9c>
  800440:	07077263          	bleu	a6,a4,8004a4 <printnum+0x9c>
  800444:	fff88413          	addi	s0,a7,-1
  800448:	00805e63          	blez	s0,800464 <printnum+0x5c>
  80044c:	fff40413          	addi	s0,s0,-1
  800450:	00098613          	mv	a2,s3
  800454:	00090593          	mv	a1,s2
  800458:	000a0513          	mv	a0,s4
  80045c:	000480e7          	jalr	s1
  800460:	fe0416e3          	bnez	s0,80044c <printnum+0x44>
  800464:	00001797          	auipc	a5,0x1
  800468:	91878793          	addi	a5,a5,-1768 # 800d7c <error_string+0x64>
  80046c:	015787b3          	add	a5,a5,s5
  800470:	00098613          	mv	a2,s3
  800474:	00090593          	mv	a1,s2
  800478:	00048313          	mv	t1,s1
  80047c:	02c12083          	lw	ra,44(sp)
  800480:	02812403          	lw	s0,40(sp)
  800484:	02412483          	lw	s1,36(sp)
  800488:	02012903          	lw	s2,32(sp)
  80048c:	01c12983          	lw	s3,28(sp)
  800490:	01812a03          	lw	s4,24(sp)
  800494:	01412a83          	lw	s5,20(sp)
  800498:	0007c503          	lbu	a0,0(a5)
  80049c:	03010113          	addi	sp,sp,48
  8004a0:	00030067          	jr	t1
  8004a4:	03075733          	divu	a4,a4,a6
  8004a8:	01412023          	sw	s4,0(sp)
  8004ac:	fff88893          	addi	a7,a7,-1
  8004b0:	00000793          	li	a5,0
  8004b4:	00090613          	mv	a2,s2
  8004b8:	00098593          	mv	a1,s3
  8004bc:	00048513          	mv	a0,s1
  8004c0:	f49ff0ef          	jal	ra,800408 <printnum>
  8004c4:	fa1ff06f          	j	800464 <printnum+0x5c>

008004c8 <vprintfmt>:
  8004c8:	fa010113          	addi	sp,sp,-96
  8004cc:	05212823          	sw	s2,80(sp)
  8004d0:	05312623          	sw	s3,76(sp)
  8004d4:	05412423          	sw	s4,72(sp)
  8004d8:	05512223          	sw	s5,68(sp)
  8004dc:	05612023          	sw	s6,64(sp)
  8004e0:	03712e23          	sw	s7,60(sp)
  8004e4:	03812c23          	sw	s8,56(sp)
  8004e8:	03a12823          	sw	s10,48(sp)
  8004ec:	04112e23          	sw	ra,92(sp)
  8004f0:	04812c23          	sw	s0,88(sp)
  8004f4:	04912a23          	sw	s1,84(sp)
  8004f8:	03912a23          	sw	s9,52(sp)
  8004fc:	03b12623          	sw	s11,44(sp)
  800500:	00050a13          	mv	s4,a0
  800504:	00058993          	mv	s3,a1
  800508:	00060913          	mv	s2,a2
  80050c:	00068d13          	mv	s10,a3
  800510:	00070b13          	mv	s6,a4
  800514:	00000a97          	auipc	s5,0x0
  800518:	6aca8a93          	addi	s5,s5,1708 # 800bc0 <main+0x178>
  80051c:	fff00b93          	li	s7,-1
  800520:	05e00c13          	li	s8,94
  800524:	000d4503          	lbu	a0,0(s10)
  800528:	02500493          	li	s1,37
  80052c:	001d0413          	addi	s0,s10,1
  800530:	02950063          	beq	a0,s1,800550 <vprintfmt+0x88>
  800534:	06050663          	beqz	a0,8005a0 <vprintfmt+0xd8>
  800538:	00098613          	mv	a2,s3
  80053c:	00090593          	mv	a1,s2
  800540:	00140413          	addi	s0,s0,1
  800544:	000a00e7          	jalr	s4
  800548:	fff44503          	lbu	a0,-1(s0)
  80054c:	fe9514e3          	bne	a0,s1,800534 <vprintfmt+0x6c>
  800550:	00044e03          	lbu	t3,0(s0)
  800554:	fff00d93          	li	s11,-1
  800558:	02000693          	li	a3,32
  80055c:	00000493          	li	s1,0
  800560:	00000593          	li	a1,0
  800564:	000d8c93          	mv	s9,s11
  800568:	05500713          	li	a4,85
  80056c:	00100313          	li	t1,1
  800570:	03000813          	li	a6,48
  800574:	00900613          	li	a2,9
  800578:	02d00513          	li	a0,45
  80057c:	fdde0793          	addi	a5,t3,-35
  800580:	0ff7f793          	andi	a5,a5,255
  800584:	00140d13          	addi	s10,s0,1
  800588:	34f76a63          	bltu	a4,a5,8008dc <vprintfmt+0x414>
  80058c:	00279793          	slli	a5,a5,0x2
  800590:	015787b3          	add	a5,a5,s5
  800594:	0007a783          	lw	a5,0(a5)
  800598:	015787b3          	add	a5,a5,s5
  80059c:	00078067          	jr	a5
  8005a0:	05c12083          	lw	ra,92(sp)
  8005a4:	05812403          	lw	s0,88(sp)
  8005a8:	05412483          	lw	s1,84(sp)
  8005ac:	05012903          	lw	s2,80(sp)
  8005b0:	04c12983          	lw	s3,76(sp)
  8005b4:	04812a03          	lw	s4,72(sp)
  8005b8:	04412a83          	lw	s5,68(sp)
  8005bc:	04012b03          	lw	s6,64(sp)
  8005c0:	03c12b83          	lw	s7,60(sp)
  8005c4:	03812c03          	lw	s8,56(sp)
  8005c8:	03412c83          	lw	s9,52(sp)
  8005cc:	03012d03          	lw	s10,48(sp)
  8005d0:	02c12d83          	lw	s11,44(sp)
  8005d4:	06010113          	addi	sp,sp,96
  8005d8:	00008067          	ret
  8005dc:	00100793          	li	a5,1
  8005e0:	36b7c863          	blt	a5,a1,800950 <vprintfmt+0x488>
  8005e4:	000b2703          	lw	a4,0(s6)
  8005e8:	00000793          	li	a5,0
  8005ec:	004b0b13          	addi	s6,s6,4
  8005f0:	01000813          	li	a6,16
  8005f4:	00d12023          	sw	a3,0(sp)
  8005f8:	000c8893          	mv	a7,s9
  8005fc:	00090613          	mv	a2,s2
  800600:	00098593          	mv	a1,s3
  800604:	000a0513          	mv	a0,s4
  800608:	e01ff0ef          	jal	ra,800408 <printnum>
  80060c:	f19ff06f          	j	800524 <vprintfmt+0x5c>
  800610:	00144e03          	lbu	t3,1(s0)
  800614:	00030493          	mv	s1,t1
  800618:	000d0413          	mv	s0,s10
  80061c:	f61ff06f          	j	80057c <vprintfmt+0xb4>
  800620:	000b2503          	lw	a0,0(s6)
  800624:	00098613          	mv	a2,s3
  800628:	00090593          	mv	a1,s2
  80062c:	004b0b13          	addi	s6,s6,4
  800630:	000a00e7          	jalr	s4
  800634:	ef1ff06f          	j	800524 <vprintfmt+0x5c>
  800638:	00100793          	li	a5,1
  80063c:	32b7c863          	blt	a5,a1,80096c <vprintfmt+0x4a4>
  800640:	000b2703          	lw	a4,0(s6)
  800644:	004b0b13          	addi	s6,s6,4
  800648:	41f75793          	srai	a5,a4,0x1f
  80064c:	00a00813          	li	a6,10
  800650:	fa07d2e3          	bgez	a5,8005f4 <vprintfmt+0x12c>
  800654:	00098613          	mv	a2,s3
  800658:	00090593          	mv	a1,s2
  80065c:	02d00513          	li	a0,45
  800660:	00f12e23          	sw	a5,28(sp)
  800664:	00e12c23          	sw	a4,24(sp)
  800668:	01012a23          	sw	a6,20(sp)
  80066c:	00d12823          	sw	a3,16(sp)
  800670:	000a00e7          	jalr	s4
  800674:	01812703          	lw	a4,24(sp)
  800678:	01c12783          	lw	a5,28(sp)
  80067c:	01012683          	lw	a3,16(sp)
  800680:	40e00733          	neg	a4,a4
  800684:	00e03633          	snez	a2,a4
  800688:	40f007b3          	neg	a5,a5
  80068c:	40c787b3          	sub	a5,a5,a2
  800690:	01412803          	lw	a6,20(sp)
  800694:	f61ff06f          	j	8005f4 <vprintfmt+0x12c>
  800698:	000b2783          	lw	a5,0(s6)
  80069c:	01800693          	li	a3,24
  8006a0:	004b0b13          	addi	s6,s6,4
  8006a4:	41f7d713          	srai	a4,a5,0x1f
  8006a8:	00f747b3          	xor	a5,a4,a5
  8006ac:	40e787b3          	sub	a5,a5,a4
  8006b0:	2cf6ca63          	blt	a3,a5,800984 <vprintfmt+0x4bc>
  8006b4:	00279693          	slli	a3,a5,0x2
  8006b8:	00000717          	auipc	a4,0x0
  8006bc:	66070713          	addi	a4,a4,1632 # 800d18 <error_string>
  8006c0:	00d70733          	add	a4,a4,a3
  8006c4:	00072703          	lw	a4,0(a4)
  8006c8:	2a070e63          	beqz	a4,800984 <vprintfmt+0x4bc>
  8006cc:	00001697          	auipc	a3,0x1
  8006d0:	88468693          	addi	a3,a3,-1916 # 800f50 <error_string+0x238>
  8006d4:	00090613          	mv	a2,s2
  8006d8:	00098593          	mv	a1,s3
  8006dc:	000a0513          	mv	a0,s4
  8006e0:	334000ef          	jal	ra,800a14 <printfmt>
  8006e4:	e41ff06f          	j	800524 <vprintfmt+0x5c>
  8006e8:	00144e03          	lbu	t3,1(s0)
  8006ec:	00158593          	addi	a1,a1,1
  8006f0:	000d0413          	mv	s0,s10
  8006f4:	e89ff06f          	j	80057c <vprintfmt+0xb4>
  8006f8:	00100793          	li	a5,1
  8006fc:	20b7ce63          	blt	a5,a1,800918 <vprintfmt+0x450>
  800700:	000b2703          	lw	a4,0(s6)
  800704:	00000793          	li	a5,0
  800708:	004b0b13          	addi	s6,s6,4
  80070c:	00800813          	li	a6,8
  800710:	ee5ff06f          	j	8005f4 <vprintfmt+0x12c>
  800714:	03000513          	li	a0,48
  800718:	00098613          	mv	a2,s3
  80071c:	00090593          	mv	a1,s2
  800720:	00d12823          	sw	a3,16(sp)
  800724:	000a00e7          	jalr	s4
  800728:	00098613          	mv	a2,s3
  80072c:	00090593          	mv	a1,s2
  800730:	07800513          	li	a0,120
  800734:	000a00e7          	jalr	s4
  800738:	000b2703          	lw	a4,0(s6)
  80073c:	00000793          	li	a5,0
  800740:	01000813          	li	a6,16
  800744:	004b0b13          	addi	s6,s6,4
  800748:	01012683          	lw	a3,16(sp)
  80074c:	ea9ff06f          	j	8005f4 <vprintfmt+0x12c>
  800750:	000b2403          	lw	s0,0(s6)
  800754:	004b0793          	addi	a5,s6,4
  800758:	00f12a23          	sw	a5,20(sp)
  80075c:	26040463          	beqz	s0,8009c4 <vprintfmt+0x4fc>
  800760:	05905463          	blez	s9,8007a8 <vprintfmt+0x2e0>
  800764:	02d00793          	li	a5,45
  800768:	22f68e63          	beq	a3,a5,8009a4 <vprintfmt+0x4dc>
  80076c:	000d8593          	mv	a1,s11
  800770:	00040513          	mv	a0,s0
  800774:	00d12823          	sw	a3,16(sp)
  800778:	c51ff0ef          	jal	ra,8003c8 <strnlen>
  80077c:	40ac8cb3          	sub	s9,s9,a0
  800780:	03905463          	blez	s9,8007a8 <vprintfmt+0x2e0>
  800784:	01012683          	lw	a3,16(sp)
  800788:	00068513          	mv	a0,a3
  80078c:	00098613          	mv	a2,s3
  800790:	00090593          	mv	a1,s2
  800794:	00d12823          	sw	a3,16(sp)
  800798:	fffc8c93          	addi	s9,s9,-1
  80079c:	000a00e7          	jalr	s4
  8007a0:	01012683          	lw	a3,16(sp)
  8007a4:	fe0c92e3          	bnez	s9,800788 <vprintfmt+0x2c0>
  8007a8:	00044783          	lbu	a5,0(s0)
  8007ac:	00140b13          	addi	s6,s0,1
  8007b0:	00078513          	mv	a0,a5
  8007b4:	06078063          	beqz	a5,800814 <vprintfmt+0x34c>
  8007b8:	03f00413          	li	s0,63
  8007bc:	000dc663          	bltz	s11,8007c8 <vprintfmt+0x300>
  8007c0:	fffd8d93          	addi	s11,s11,-1
  8007c4:	037d8863          	beq	s11,s7,8007f4 <vprintfmt+0x32c>
  8007c8:	00098613          	mv	a2,s3
  8007cc:	00090593          	mv	a1,s2
  8007d0:	00048663          	beqz	s1,8007dc <vprintfmt+0x314>
  8007d4:	fe078793          	addi	a5,a5,-32
  8007d8:	12fc6a63          	bltu	s8,a5,80090c <vprintfmt+0x444>
  8007dc:	000a00e7          	jalr	s4
  8007e0:	001b0b13          	addi	s6,s6,1
  8007e4:	fffb4783          	lbu	a5,-1(s6)
  8007e8:	fffc8c93          	addi	s9,s9,-1
  8007ec:	00078513          	mv	a0,a5
  8007f0:	fc0796e3          	bnez	a5,8007bc <vprintfmt+0x2f4>
  8007f4:	03905063          	blez	s9,800814 <vprintfmt+0x34c>
  8007f8:	02000413          	li	s0,32
  8007fc:	fffc8c93          	addi	s9,s9,-1
  800800:	00098613          	mv	a2,s3
  800804:	00090593          	mv	a1,s2
  800808:	00040513          	mv	a0,s0
  80080c:	000a00e7          	jalr	s4
  800810:	fe0c96e3          	bnez	s9,8007fc <vprintfmt+0x334>
  800814:	01412b03          	lw	s6,20(sp)
  800818:	d0dff06f          	j	800524 <vprintfmt+0x5c>
  80081c:	00100793          	li	a5,1
  800820:	10b7ca63          	blt	a5,a1,800934 <vprintfmt+0x46c>
  800824:	000b2703          	lw	a4,0(s6)
  800828:	00000793          	li	a5,0
  80082c:	004b0b13          	addi	s6,s6,4
  800830:	00a00813          	li	a6,10
  800834:	dc1ff06f          	j	8005f4 <vprintfmt+0x12c>
  800838:	00144e03          	lbu	t3,1(s0)
  80083c:	00050693          	mv	a3,a0
  800840:	000d0413          	mv	s0,s10
  800844:	d39ff06f          	j	80057c <vprintfmt+0xb4>
  800848:	00098613          	mv	a2,s3
  80084c:	00090593          	mv	a1,s2
  800850:	02500513          	li	a0,37
  800854:	000a00e7          	jalr	s4
  800858:	ccdff06f          	j	800524 <vprintfmt+0x5c>
  80085c:	000b2d83          	lw	s11,0(s6)
  800860:	00144e03          	lbu	t3,1(s0)
  800864:	004b0b13          	addi	s6,s6,4
  800868:	000d0413          	mv	s0,s10
  80086c:	d00cd8e3          	bgez	s9,80057c <vprintfmt+0xb4>
  800870:	000d8c93          	mv	s9,s11
  800874:	fff00d93          	li	s11,-1
  800878:	d05ff06f          	j	80057c <vprintfmt+0xb4>
  80087c:	00144e03          	lbu	t3,1(s0)
  800880:	00080693          	mv	a3,a6
  800884:	000d0413          	mv	s0,s10
  800888:	cf5ff06f          	j	80057c <vprintfmt+0xb4>
  80088c:	00144e83          	lbu	t4,1(s0)
  800890:	fd0e0d93          	addi	s11,t3,-48
  800894:	fd0e8793          	addi	a5,t4,-48
  800898:	14f66c63          	bltu	a2,a5,8009f0 <vprintfmt+0x528>
  80089c:	000d0413          	mv	s0,s10
  8008a0:	002d9793          	slli	a5,s11,0x2
  8008a4:	01b78db3          	add	s11,a5,s11
  8008a8:	00140413          	addi	s0,s0,1
  8008ac:	001d9d93          	slli	s11,s11,0x1
  8008b0:	01dd8db3          	add	s11,s11,t4
  8008b4:	00044e83          	lbu	t4,0(s0)
  8008b8:	fd0d8d93          	addi	s11,s11,-48
  8008bc:	fd0e8793          	addi	a5,t4,-48
  8008c0:	fef670e3          	bleu	a5,a2,8008a0 <vprintfmt+0x3d8>
  8008c4:	000e8e13          	mv	t3,t4
  8008c8:	fa5ff06f          	j	80086c <vprintfmt+0x3a4>
  8008cc:	0e0cc863          	bltz	s9,8009bc <vprintfmt+0x4f4>
  8008d0:	00144e03          	lbu	t3,1(s0)
  8008d4:	000d0413          	mv	s0,s10
  8008d8:	ca5ff06f          	j	80057c <vprintfmt+0xb4>
  8008dc:	00098613          	mv	a2,s3
  8008e0:	00090593          	mv	a1,s2
  8008e4:	02500513          	li	a0,37
  8008e8:	000a00e7          	jalr	s4
  8008ec:	fff44783          	lbu	a5,-1(s0)
  8008f0:	02500713          	li	a4,37
  8008f4:	00040d13          	mv	s10,s0
  8008f8:	c2e786e3          	beq	a5,a4,800524 <vprintfmt+0x5c>
  8008fc:	fffd0d13          	addi	s10,s10,-1
  800900:	fffd4783          	lbu	a5,-1(s10)
  800904:	fee79ce3          	bne	a5,a4,8008fc <vprintfmt+0x434>
  800908:	c1dff06f          	j	800524 <vprintfmt+0x5c>
  80090c:	00040513          	mv	a0,s0
  800910:	000a00e7          	jalr	s4
  800914:	ecdff06f          	j	8007e0 <vprintfmt+0x318>
  800918:	007b0793          	addi	a5,s6,7
  80091c:	ff87f793          	andi	a5,a5,-8
  800920:	00878b13          	addi	s6,a5,8
  800924:	0007a703          	lw	a4,0(a5)
  800928:	00800813          	li	a6,8
  80092c:	0047a783          	lw	a5,4(a5)
  800930:	cc5ff06f          	j	8005f4 <vprintfmt+0x12c>
  800934:	007b0793          	addi	a5,s6,7
  800938:	ff87f793          	andi	a5,a5,-8
  80093c:	00878b13          	addi	s6,a5,8
  800940:	0007a703          	lw	a4,0(a5)
  800944:	00a00813          	li	a6,10
  800948:	0047a783          	lw	a5,4(a5)
  80094c:	ca9ff06f          	j	8005f4 <vprintfmt+0x12c>
  800950:	007b0793          	addi	a5,s6,7
  800954:	ff87f793          	andi	a5,a5,-8
  800958:	00878b13          	addi	s6,a5,8
  80095c:	0007a703          	lw	a4,0(a5)
  800960:	01000813          	li	a6,16
  800964:	0047a783          	lw	a5,4(a5)
  800968:	c8dff06f          	j	8005f4 <vprintfmt+0x12c>
  80096c:	007b0793          	addi	a5,s6,7
  800970:	ff87f793          	andi	a5,a5,-8
  800974:	00878b13          	addi	s6,a5,8
  800978:	0007a703          	lw	a4,0(a5)
  80097c:	0047a783          	lw	a5,4(a5)
  800980:	ccdff06f          	j	80064c <vprintfmt+0x184>
  800984:	00078713          	mv	a4,a5
  800988:	00000697          	auipc	a3,0x0
  80098c:	5bc68693          	addi	a3,a3,1468 # 800f44 <error_string+0x22c>
  800990:	00090613          	mv	a2,s2
  800994:	00098593          	mv	a1,s3
  800998:	000a0513          	mv	a0,s4
  80099c:	078000ef          	jal	ra,800a14 <printfmt>
  8009a0:	b85ff06f          	j	800524 <vprintfmt+0x5c>
  8009a4:	00044783          	lbu	a5,0(s0)
  8009a8:	00140b13          	addi	s6,s0,1
  8009ac:	00078513          	mv	a0,a5
  8009b0:	e40784e3          	beqz	a5,8007f8 <vprintfmt+0x330>
  8009b4:	03f00413          	li	s0,63
  8009b8:	e05ff06f          	j	8007bc <vprintfmt+0x2f4>
  8009bc:	00000c93          	li	s9,0
  8009c0:	f11ff06f          	j	8008d0 <vprintfmt+0x408>
  8009c4:	03905c63          	blez	s9,8009fc <vprintfmt+0x534>
  8009c8:	02d00793          	li	a5,45
  8009cc:	00000417          	auipc	s0,0x0
  8009d0:	57040413          	addi	s0,s0,1392 # 800f3c <error_string+0x224>
  8009d4:	d8f69ce3          	bne	a3,a5,80076c <vprintfmt+0x2a4>
  8009d8:	02800513          	li	a0,40
  8009dc:	00000b17          	auipc	s6,0x0
  8009e0:	561b0b13          	addi	s6,s6,1377 # 800f3d <error_string+0x225>
  8009e4:	00050793          	mv	a5,a0
  8009e8:	03f00413          	li	s0,63
  8009ec:	dd1ff06f          	j	8007bc <vprintfmt+0x2f4>
  8009f0:	000e8e13          	mv	t3,t4
  8009f4:	000d0413          	mv	s0,s10
  8009f8:	e75ff06f          	j	80086c <vprintfmt+0x3a4>
  8009fc:	02800793          	li	a5,40
  800a00:	00078513          	mv	a0,a5
  800a04:	00000b17          	auipc	s6,0x0
  800a08:	539b0b13          	addi	s6,s6,1337 # 800f3d <error_string+0x225>
  800a0c:	03f00413          	li	s0,63
  800a10:	dadff06f          	j	8007bc <vprintfmt+0x2f4>

00800a14 <printfmt>:
  800a14:	fd010113          	addi	sp,sp,-48
  800a18:	02010313          	addi	t1,sp,32
  800a1c:	02e12023          	sw	a4,32(sp)
  800a20:	00030713          	mv	a4,t1
  800a24:	00112e23          	sw	ra,28(sp)
  800a28:	02f12223          	sw	a5,36(sp)
  800a2c:	03012423          	sw	a6,40(sp)
  800a30:	03112623          	sw	a7,44(sp)
  800a34:	00612623          	sw	t1,12(sp)
  800a38:	a91ff0ef          	jal	ra,8004c8 <vprintfmt>
  800a3c:	01c12083          	lw	ra,28(sp)
  800a40:	03010113          	addi	sp,sp,48
  800a44:	00008067          	ret

00800a48 <main>:
  800a48:	ff010113          	addi	sp,sp,-16
  800a4c:	00812423          	sw	s0,8(sp)
  800a50:	00912223          	sw	s1,4(sp)
  800a54:	00112623          	sw	ra,12(sp)
  800a58:	00000413          	li	s0,0
  800a5c:	02000493          	li	s1,32
  800a60:	f6cff0ef          	jal	ra,8001cc <fork>
  800a64:	04050663          	beqz	a0,800ab0 <main+0x68>
  800a68:	06a05063          	blez	a0,800ac8 <main+0x80>
  800a6c:	00140413          	addi	s0,s0,1
  800a70:	fe9418e3          	bne	s0,s1,800a60 <main+0x18>
  800a74:	f5cff0ef          	jal	ra,8001d0 <wait>
  800a78:	06051863          	bnez	a0,800ae8 <main+0xa0>
  800a7c:	fff40413          	addi	s0,s0,-1
  800a80:	fe041ae3          	bnez	s0,800a74 <main+0x2c>
  800a84:	f4cff0ef          	jal	ra,8001d0 <wait>
  800a88:	06050c63          	beqz	a0,800b00 <main+0xb8>
  800a8c:	00000517          	auipc	a0,0x0
  800a90:	53050513          	addi	a0,a0,1328 # 800fbc <error_string+0x2a4>
  800a94:	fd0ff0ef          	jal	ra,800264 <cprintf>
  800a98:	00c12083          	lw	ra,12(sp)
  800a9c:	00000513          	li	a0,0
  800aa0:	00812403          	lw	s0,8(sp)
  800aa4:	00412483          	lw	s1,4(sp)
  800aa8:	01010113          	addi	sp,sp,16
  800aac:	00008067          	ret
  800ab0:	00040593          	mv	a1,s0
  800ab4:	00000517          	auipc	a0,0x0
  800ab8:	4a050513          	addi	a0,a0,1184 # 800f54 <error_string+0x23c>
  800abc:	fa8ff0ef          	jal	ra,800264 <cprintf>
  800ac0:	00000513          	li	a0,0
  800ac4:	eecff0ef          	jal	ra,8001b0 <exit>
  800ac8:	00000697          	auipc	a3,0x0
  800acc:	49c68693          	addi	a3,a3,1180 # 800f64 <error_string+0x24c>
  800ad0:	00000617          	auipc	a2,0x0
  800ad4:	49c60613          	addi	a2,a2,1180 # 800f6c <error_string+0x254>
  800ad8:	00e00593          	li	a1,14
  800adc:	00000517          	auipc	a0,0x0
  800ae0:	4a850513          	addi	a0,a0,1192 # 800f84 <error_string+0x26c>
  800ae4:	d3cff0ef          	jal	ra,800020 <__panic>
  800ae8:	00000617          	auipc	a2,0x0
  800aec:	4ac60613          	addi	a2,a2,1196 # 800f94 <error_string+0x27c>
  800af0:	01700593          	li	a1,23
  800af4:	00000517          	auipc	a0,0x0
  800af8:	49050513          	addi	a0,a0,1168 # 800f84 <error_string+0x26c>
  800afc:	d24ff0ef          	jal	ra,800020 <__panic>
  800b00:	00000617          	auipc	a2,0x0
  800b04:	4a860613          	addi	a2,a2,1192 # 800fa8 <error_string+0x290>
  800b08:	01c00593          	li	a1,28
  800b0c:	00000517          	auipc	a0,0x0
  800b10:	47850513          	addi	a0,a0,1144 # 800f84 <error_string+0x26c>
  800b14:	d0cff0ef          	jal	ra,800020 <__panic>
