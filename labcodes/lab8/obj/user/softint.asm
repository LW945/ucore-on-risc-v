
obj/__user_softint.out:     file format elf32-littleriscv


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
  800040:	9b050513          	addi	a0,a0,-1616 # 8009ec <main+0x2c>
  800044:	00112e23          	sw	ra,28(sp)
  800048:	02d12623          	sw	a3,44(sp)
  80004c:	02e12823          	sw	a4,48(sp)
  800050:	03012c23          	sw	a6,56(sp)
  800054:	03112e23          	sw	a7,60(sp)
  800058:	00f12623          	sw	a5,12(sp)
  80005c:	180000ef          	jal	ra,8001dc <cprintf>
  800060:	00c12583          	lw	a1,12(sp)
  800064:	00040513          	mv	a0,s0
  800068:	138000ef          	jal	ra,8001a0 <vcprintf>
  80006c:	00001517          	auipc	a0,0x1
  800070:	9d050513          	addi	a0,a0,-1584 # 800a3c <main+0x7c>
  800074:	168000ef          	jal	ra,8001dc <cprintf>
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

00800128 <sys_dup>:
  800128:	00058613          	mv	a2,a1
  80012c:	00050593          	mv	a1,a0
  800130:	08200513          	li	a0,130
  800134:	f55ff06f          	j	800088 <syscall>

00800138 <exit>:
  800138:	ff010113          	addi	sp,sp,-16
  80013c:	00112623          	sw	ra,12(sp)
  800140:	fb5ff0ef          	jal	ra,8000f4 <sys_exit>
  800144:	00001517          	auipc	a0,0x1
  800148:	8c450513          	addi	a0,a0,-1852 # 800a08 <main+0x48>
  80014c:	090000ef          	jal	ra,8001dc <cprintf>
  800150:	0000006f          	j	800150 <exit+0x18>

00800154 <_start>:
  800154:	00012503          	lw	a0,0(sp)
  800158:	00410593          	addi	a1,sp,4
  80015c:	14c000ef          	jal	ra,8002a8 <umain>
  800160:	0000006f          	j	800160 <_start+0xc>

00800164 <open>:
  800164:	fa9ff06f          	j	80010c <sys_open>

00800168 <close>:
  800168:	fb5ff06f          	j	80011c <sys_close>

0080016c <dup2>:
  80016c:	fbdff06f          	j	800128 <sys_dup>

00800170 <cputch>:
  800170:	ff010113          	addi	sp,sp,-16
  800174:	00112623          	sw	ra,12(sp)
  800178:	00812423          	sw	s0,8(sp)
  80017c:	00058413          	mv	s0,a1
  800180:	f81ff0ef          	jal	ra,800100 <sys_putc>
  800184:	00042783          	lw	a5,0(s0)
  800188:	00c12083          	lw	ra,12(sp)
  80018c:	00178793          	addi	a5,a5,1
  800190:	00f42023          	sw	a5,0(s0)
  800194:	00812403          	lw	s0,8(sp)
  800198:	01010113          	addi	sp,sp,16
  80019c:	00008067          	ret

008001a0 <vcprintf>:
  8001a0:	fe010113          	addi	sp,sp,-32
  8001a4:	00058713          	mv	a4,a1
  8001a8:	ffff75b7          	lui	a1,0xffff7
  8001ac:	00050693          	mv	a3,a0
  8001b0:	00c10613          	addi	a2,sp,12
  8001b4:	00000517          	auipc	a0,0x0
  8001b8:	fbc50513          	addi	a0,a0,-68 # 800170 <cputch>
  8001bc:	ad958593          	addi	a1,a1,-1319 # ffff6ad9 <sbi_remote_fence_i+0xffff71e9>
  8001c0:	00112e23          	sw	ra,28(sp)
  8001c4:	00012623          	sw	zero,12(sp)
  8001c8:	278000ef          	jal	ra,800440 <vprintfmt>
  8001cc:	01c12083          	lw	ra,28(sp)
  8001d0:	00c12503          	lw	a0,12(sp)
  8001d4:	02010113          	addi	sp,sp,32
  8001d8:	00008067          	ret

008001dc <cprintf>:
  8001dc:	fc010113          	addi	sp,sp,-64
  8001e0:	02410313          	addi	t1,sp,36
  8001e4:	02b12223          	sw	a1,36(sp)
  8001e8:	ffff75b7          	lui	a1,0xffff7
  8001ec:	02c12423          	sw	a2,40(sp)
  8001f0:	02d12623          	sw	a3,44(sp)
  8001f4:	02e12823          	sw	a4,48(sp)
  8001f8:	00050693          	mv	a3,a0
  8001fc:	00c10613          	addi	a2,sp,12
  800200:	00000517          	auipc	a0,0x0
  800204:	f7050513          	addi	a0,a0,-144 # 800170 <cputch>
  800208:	00030713          	mv	a4,t1
  80020c:	ad958593          	addi	a1,a1,-1319 # ffff6ad9 <sbi_remote_fence_i+0xffff71e9>
  800210:	00112e23          	sw	ra,28(sp)
  800214:	02f12a23          	sw	a5,52(sp)
  800218:	03012c23          	sw	a6,56(sp)
  80021c:	03112e23          	sw	a7,60(sp)
  800220:	00612423          	sw	t1,8(sp)
  800224:	00012623          	sw	zero,12(sp)
  800228:	218000ef          	jal	ra,800440 <vprintfmt>
  80022c:	01c12083          	lw	ra,28(sp)
  800230:	00c12503          	lw	a0,12(sp)
  800234:	04010113          	addi	sp,sp,64
  800238:	00008067          	ret

0080023c <initfd>:
  80023c:	ff010113          	addi	sp,sp,-16
  800240:	00058793          	mv	a5,a1
  800244:	00912223          	sw	s1,4(sp)
  800248:	00060593          	mv	a1,a2
  80024c:	00050493          	mv	s1,a0
  800250:	00078513          	mv	a0,a5
  800254:	00812423          	sw	s0,8(sp)
  800258:	00112623          	sw	ra,12(sp)
  80025c:	f09ff0ef          	jal	ra,800164 <open>
  800260:	00050413          	mv	s0,a0
  800264:	02054663          	bltz	a0,800290 <initfd+0x54>
  800268:	02950463          	beq	a0,s1,800290 <initfd+0x54>
  80026c:	00048513          	mv	a0,s1
  800270:	ef9ff0ef          	jal	ra,800168 <close>
  800274:	00048593          	mv	a1,s1
  800278:	00040513          	mv	a0,s0
  80027c:	ef1ff0ef          	jal	ra,80016c <dup2>
  800280:	00050493          	mv	s1,a0
  800284:	00040513          	mv	a0,s0
  800288:	ee1ff0ef          	jal	ra,800168 <close>
  80028c:	00048413          	mv	s0,s1
  800290:	00c12083          	lw	ra,12(sp)
  800294:	00040513          	mv	a0,s0
  800298:	00412483          	lw	s1,4(sp)
  80029c:	00812403          	lw	s0,8(sp)
  8002a0:	01010113          	addi	sp,sp,16
  8002a4:	00008067          	ret

008002a8 <umain>:
  8002a8:	ff010113          	addi	sp,sp,-16
  8002ac:	00812423          	sw	s0,8(sp)
  8002b0:	00912223          	sw	s1,4(sp)
  8002b4:	00050413          	mv	s0,a0
  8002b8:	00058493          	mv	s1,a1
  8002bc:	00000613          	li	a2,0
  8002c0:	00000597          	auipc	a1,0x0
  8002c4:	75c58593          	addi	a1,a1,1884 # 800a1c <main+0x5c>
  8002c8:	00000513          	li	a0,0
  8002cc:	00112623          	sw	ra,12(sp)
  8002d0:	f6dff0ef          	jal	ra,80023c <initfd>
  8002d4:	02054663          	bltz	a0,800300 <umain+0x58>
  8002d8:	00100613          	li	a2,1
  8002dc:	00000597          	auipc	a1,0x0
  8002e0:	77858593          	addi	a1,a1,1912 # 800a54 <main+0x94>
  8002e4:	00060513          	mv	a0,a2
  8002e8:	f55ff0ef          	jal	ra,80023c <initfd>
  8002ec:	02054a63          	bltz	a0,800320 <umain+0x78>
  8002f0:	00048593          	mv	a1,s1
  8002f4:	00040513          	mv	a0,s0
  8002f8:	6c8000ef          	jal	ra,8009c0 <main>
  8002fc:	e3dff0ef          	jal	ra,800138 <exit>
  800300:	00050693          	mv	a3,a0
  800304:	00000617          	auipc	a2,0x0
  800308:	72060613          	addi	a2,a2,1824 # 800a24 <main+0x64>
  80030c:	01a00593          	li	a1,26
  800310:	00000517          	auipc	a0,0x0
  800314:	73050513          	addi	a0,a0,1840 # 800a40 <main+0x80>
  800318:	d09ff0ef          	jal	ra,800020 <__warn>
  80031c:	fbdff06f          	j	8002d8 <umain+0x30>
  800320:	00050693          	mv	a3,a0
  800324:	00000617          	auipc	a2,0x0
  800328:	73860613          	addi	a2,a2,1848 # 800a5c <main+0x9c>
  80032c:	01d00593          	li	a1,29
  800330:	00000517          	auipc	a0,0x0
  800334:	71050513          	addi	a0,a0,1808 # 800a40 <main+0x80>
  800338:	ce9ff0ef          	jal	ra,800020 <__warn>
  80033c:	fb5ff06f          	j	8002f0 <umain+0x48>

00800340 <strnlen>:
  800340:	00050693          	mv	a3,a0
  800344:	02058a63          	beqz	a1,800378 <strnlen+0x38>
  800348:	00054703          	lbu	a4,0(a0)
  80034c:	00150793          	addi	a5,a0,1
  800350:	02070463          	beqz	a4,800378 <strnlen+0x38>
  800354:	00b505b3          	add	a1,a0,a1
  800358:	0100006f          	j	800368 <strnlen+0x28>
  80035c:	00178793          	addi	a5,a5,1
  800360:	fff7c703          	lbu	a4,-1(a5)
  800364:	00070863          	beqz	a4,800374 <strnlen+0x34>
  800368:	40d78533          	sub	a0,a5,a3
  80036c:	feb798e3          	bne	a5,a1,80035c <strnlen+0x1c>
  800370:	00008067          	ret
  800374:	00008067          	ret
  800378:	00000513          	li	a0,0
  80037c:	00008067          	ret

00800380 <printnum>:
  800380:	fd010113          	addi	sp,sp,-48
  800384:	02912223          	sw	s1,36(sp)
  800388:	03212023          	sw	s2,32(sp)
  80038c:	01312e23          	sw	s3,28(sp)
  800390:	01412c23          	sw	s4,24(sp)
  800394:	01512a23          	sw	s5,20(sp)
  800398:	02112623          	sw	ra,44(sp)
  80039c:	02812423          	sw	s0,40(sp)
  8003a0:	00050493          	mv	s1,a0
  8003a4:	00058993          	mv	s3,a1
  8003a8:	00060913          	mv	s2,a2
  8003ac:	03012a03          	lw	s4,48(sp)
  8003b0:	03077ab3          	remu	s5,a4,a6
  8003b4:	06079463          	bnez	a5,80041c <printnum+0x9c>
  8003b8:	07077263          	bleu	a6,a4,80041c <printnum+0x9c>
  8003bc:	fff88413          	addi	s0,a7,-1
  8003c0:	00805e63          	blez	s0,8003dc <printnum+0x5c>
  8003c4:	fff40413          	addi	s0,s0,-1
  8003c8:	00098613          	mv	a2,s3
  8003cc:	00090593          	mv	a1,s2
  8003d0:	000a0513          	mv	a0,s4
  8003d4:	000480e7          	jalr	s1
  8003d8:	fe0416e3          	bnez	s0,8003c4 <printnum+0x44>
  8003dc:	00001797          	auipc	a5,0x1
  8003e0:	85878793          	addi	a5,a5,-1960 # 800c34 <error_string+0x64>
  8003e4:	015787b3          	add	a5,a5,s5
  8003e8:	00098613          	mv	a2,s3
  8003ec:	00090593          	mv	a1,s2
  8003f0:	00048313          	mv	t1,s1
  8003f4:	02c12083          	lw	ra,44(sp)
  8003f8:	02812403          	lw	s0,40(sp)
  8003fc:	02412483          	lw	s1,36(sp)
  800400:	02012903          	lw	s2,32(sp)
  800404:	01c12983          	lw	s3,28(sp)
  800408:	01812a03          	lw	s4,24(sp)
  80040c:	01412a83          	lw	s5,20(sp)
  800410:	0007c503          	lbu	a0,0(a5)
  800414:	03010113          	addi	sp,sp,48
  800418:	00030067          	jr	t1
  80041c:	03075733          	divu	a4,a4,a6
  800420:	01412023          	sw	s4,0(sp)
  800424:	fff88893          	addi	a7,a7,-1
  800428:	00000793          	li	a5,0
  80042c:	00090613          	mv	a2,s2
  800430:	00098593          	mv	a1,s3
  800434:	00048513          	mv	a0,s1
  800438:	f49ff0ef          	jal	ra,800380 <printnum>
  80043c:	fa1ff06f          	j	8003dc <printnum+0x5c>

00800440 <vprintfmt>:
  800440:	fa010113          	addi	sp,sp,-96
  800444:	05212823          	sw	s2,80(sp)
  800448:	05312623          	sw	s3,76(sp)
  80044c:	05412423          	sw	s4,72(sp)
  800450:	05512223          	sw	s5,68(sp)
  800454:	05612023          	sw	s6,64(sp)
  800458:	03712e23          	sw	s7,60(sp)
  80045c:	03812c23          	sw	s8,56(sp)
  800460:	03a12823          	sw	s10,48(sp)
  800464:	04112e23          	sw	ra,92(sp)
  800468:	04812c23          	sw	s0,88(sp)
  80046c:	04912a23          	sw	s1,84(sp)
  800470:	03912a23          	sw	s9,52(sp)
  800474:	03b12623          	sw	s11,44(sp)
  800478:	00050a13          	mv	s4,a0
  80047c:	00058993          	mv	s3,a1
  800480:	00060913          	mv	s2,a2
  800484:	00068d13          	mv	s10,a3
  800488:	00070b13          	mv	s6,a4
  80048c:	00000a97          	auipc	s5,0x0
  800490:	5eca8a93          	addi	s5,s5,1516 # 800a78 <main+0xb8>
  800494:	fff00b93          	li	s7,-1
  800498:	05e00c13          	li	s8,94
  80049c:	000d4503          	lbu	a0,0(s10)
  8004a0:	02500493          	li	s1,37
  8004a4:	001d0413          	addi	s0,s10,1
  8004a8:	02950063          	beq	a0,s1,8004c8 <vprintfmt+0x88>
  8004ac:	06050663          	beqz	a0,800518 <vprintfmt+0xd8>
  8004b0:	00098613          	mv	a2,s3
  8004b4:	00090593          	mv	a1,s2
  8004b8:	00140413          	addi	s0,s0,1
  8004bc:	000a00e7          	jalr	s4
  8004c0:	fff44503          	lbu	a0,-1(s0)
  8004c4:	fe9514e3          	bne	a0,s1,8004ac <vprintfmt+0x6c>
  8004c8:	00044e03          	lbu	t3,0(s0)
  8004cc:	fff00d93          	li	s11,-1
  8004d0:	02000693          	li	a3,32
  8004d4:	00000493          	li	s1,0
  8004d8:	00000593          	li	a1,0
  8004dc:	000d8c93          	mv	s9,s11
  8004e0:	05500713          	li	a4,85
  8004e4:	00100313          	li	t1,1
  8004e8:	03000813          	li	a6,48
  8004ec:	00900613          	li	a2,9
  8004f0:	02d00513          	li	a0,45
  8004f4:	fdde0793          	addi	a5,t3,-35
  8004f8:	0ff7f793          	andi	a5,a5,255
  8004fc:	00140d13          	addi	s10,s0,1
  800500:	34f76a63          	bltu	a4,a5,800854 <vprintfmt+0x414>
  800504:	00279793          	slli	a5,a5,0x2
  800508:	015787b3          	add	a5,a5,s5
  80050c:	0007a783          	lw	a5,0(a5)
  800510:	015787b3          	add	a5,a5,s5
  800514:	00078067          	jr	a5
  800518:	05c12083          	lw	ra,92(sp)
  80051c:	05812403          	lw	s0,88(sp)
  800520:	05412483          	lw	s1,84(sp)
  800524:	05012903          	lw	s2,80(sp)
  800528:	04c12983          	lw	s3,76(sp)
  80052c:	04812a03          	lw	s4,72(sp)
  800530:	04412a83          	lw	s5,68(sp)
  800534:	04012b03          	lw	s6,64(sp)
  800538:	03c12b83          	lw	s7,60(sp)
  80053c:	03812c03          	lw	s8,56(sp)
  800540:	03412c83          	lw	s9,52(sp)
  800544:	03012d03          	lw	s10,48(sp)
  800548:	02c12d83          	lw	s11,44(sp)
  80054c:	06010113          	addi	sp,sp,96
  800550:	00008067          	ret
  800554:	00100793          	li	a5,1
  800558:	36b7c863          	blt	a5,a1,8008c8 <vprintfmt+0x488>
  80055c:	000b2703          	lw	a4,0(s6)
  800560:	00000793          	li	a5,0
  800564:	004b0b13          	addi	s6,s6,4
  800568:	01000813          	li	a6,16
  80056c:	00d12023          	sw	a3,0(sp)
  800570:	000c8893          	mv	a7,s9
  800574:	00090613          	mv	a2,s2
  800578:	00098593          	mv	a1,s3
  80057c:	000a0513          	mv	a0,s4
  800580:	e01ff0ef          	jal	ra,800380 <printnum>
  800584:	f19ff06f          	j	80049c <vprintfmt+0x5c>
  800588:	00144e03          	lbu	t3,1(s0)
  80058c:	00030493          	mv	s1,t1
  800590:	000d0413          	mv	s0,s10
  800594:	f61ff06f          	j	8004f4 <vprintfmt+0xb4>
  800598:	000b2503          	lw	a0,0(s6)
  80059c:	00098613          	mv	a2,s3
  8005a0:	00090593          	mv	a1,s2
  8005a4:	004b0b13          	addi	s6,s6,4
  8005a8:	000a00e7          	jalr	s4
  8005ac:	ef1ff06f          	j	80049c <vprintfmt+0x5c>
  8005b0:	00100793          	li	a5,1
  8005b4:	32b7c863          	blt	a5,a1,8008e4 <vprintfmt+0x4a4>
  8005b8:	000b2703          	lw	a4,0(s6)
  8005bc:	004b0b13          	addi	s6,s6,4
  8005c0:	41f75793          	srai	a5,a4,0x1f
  8005c4:	00a00813          	li	a6,10
  8005c8:	fa07d2e3          	bgez	a5,80056c <vprintfmt+0x12c>
  8005cc:	00098613          	mv	a2,s3
  8005d0:	00090593          	mv	a1,s2
  8005d4:	02d00513          	li	a0,45
  8005d8:	00f12e23          	sw	a5,28(sp)
  8005dc:	00e12c23          	sw	a4,24(sp)
  8005e0:	01012a23          	sw	a6,20(sp)
  8005e4:	00d12823          	sw	a3,16(sp)
  8005e8:	000a00e7          	jalr	s4
  8005ec:	01812703          	lw	a4,24(sp)
  8005f0:	01c12783          	lw	a5,28(sp)
  8005f4:	01012683          	lw	a3,16(sp)
  8005f8:	40e00733          	neg	a4,a4
  8005fc:	00e03633          	snez	a2,a4
  800600:	40f007b3          	neg	a5,a5
  800604:	40c787b3          	sub	a5,a5,a2
  800608:	01412803          	lw	a6,20(sp)
  80060c:	f61ff06f          	j	80056c <vprintfmt+0x12c>
  800610:	000b2783          	lw	a5,0(s6)
  800614:	01800693          	li	a3,24
  800618:	004b0b13          	addi	s6,s6,4
  80061c:	41f7d713          	srai	a4,a5,0x1f
  800620:	00f747b3          	xor	a5,a4,a5
  800624:	40e787b3          	sub	a5,a5,a4
  800628:	2cf6ca63          	blt	a3,a5,8008fc <vprintfmt+0x4bc>
  80062c:	00279693          	slli	a3,a5,0x2
  800630:	00000717          	auipc	a4,0x0
  800634:	5a070713          	addi	a4,a4,1440 # 800bd0 <error_string>
  800638:	00d70733          	add	a4,a4,a3
  80063c:	00072703          	lw	a4,0(a4)
  800640:	2a070e63          	beqz	a4,8008fc <vprintfmt+0x4bc>
  800644:	00000697          	auipc	a3,0x0
  800648:	7c468693          	addi	a3,a3,1988 # 800e08 <error_string+0x238>
  80064c:	00090613          	mv	a2,s2
  800650:	00098593          	mv	a1,s3
  800654:	000a0513          	mv	a0,s4
  800658:	334000ef          	jal	ra,80098c <printfmt>
  80065c:	e41ff06f          	j	80049c <vprintfmt+0x5c>
  800660:	00144e03          	lbu	t3,1(s0)
  800664:	00158593          	addi	a1,a1,1
  800668:	000d0413          	mv	s0,s10
  80066c:	e89ff06f          	j	8004f4 <vprintfmt+0xb4>
  800670:	00100793          	li	a5,1
  800674:	20b7ce63          	blt	a5,a1,800890 <vprintfmt+0x450>
  800678:	000b2703          	lw	a4,0(s6)
  80067c:	00000793          	li	a5,0
  800680:	004b0b13          	addi	s6,s6,4
  800684:	00800813          	li	a6,8
  800688:	ee5ff06f          	j	80056c <vprintfmt+0x12c>
  80068c:	03000513          	li	a0,48
  800690:	00098613          	mv	a2,s3
  800694:	00090593          	mv	a1,s2
  800698:	00d12823          	sw	a3,16(sp)
  80069c:	000a00e7          	jalr	s4
  8006a0:	00098613          	mv	a2,s3
  8006a4:	00090593          	mv	a1,s2
  8006a8:	07800513          	li	a0,120
  8006ac:	000a00e7          	jalr	s4
  8006b0:	000b2703          	lw	a4,0(s6)
  8006b4:	00000793          	li	a5,0
  8006b8:	01000813          	li	a6,16
  8006bc:	004b0b13          	addi	s6,s6,4
  8006c0:	01012683          	lw	a3,16(sp)
  8006c4:	ea9ff06f          	j	80056c <vprintfmt+0x12c>
  8006c8:	000b2403          	lw	s0,0(s6)
  8006cc:	004b0793          	addi	a5,s6,4
  8006d0:	00f12a23          	sw	a5,20(sp)
  8006d4:	26040463          	beqz	s0,80093c <vprintfmt+0x4fc>
  8006d8:	05905463          	blez	s9,800720 <vprintfmt+0x2e0>
  8006dc:	02d00793          	li	a5,45
  8006e0:	22f68e63          	beq	a3,a5,80091c <vprintfmt+0x4dc>
  8006e4:	000d8593          	mv	a1,s11
  8006e8:	00040513          	mv	a0,s0
  8006ec:	00d12823          	sw	a3,16(sp)
  8006f0:	c51ff0ef          	jal	ra,800340 <strnlen>
  8006f4:	40ac8cb3          	sub	s9,s9,a0
  8006f8:	03905463          	blez	s9,800720 <vprintfmt+0x2e0>
  8006fc:	01012683          	lw	a3,16(sp)
  800700:	00068513          	mv	a0,a3
  800704:	00098613          	mv	a2,s3
  800708:	00090593          	mv	a1,s2
  80070c:	00d12823          	sw	a3,16(sp)
  800710:	fffc8c93          	addi	s9,s9,-1
  800714:	000a00e7          	jalr	s4
  800718:	01012683          	lw	a3,16(sp)
  80071c:	fe0c92e3          	bnez	s9,800700 <vprintfmt+0x2c0>
  800720:	00044783          	lbu	a5,0(s0)
  800724:	00140b13          	addi	s6,s0,1
  800728:	00078513          	mv	a0,a5
  80072c:	06078063          	beqz	a5,80078c <vprintfmt+0x34c>
  800730:	03f00413          	li	s0,63
  800734:	000dc663          	bltz	s11,800740 <vprintfmt+0x300>
  800738:	fffd8d93          	addi	s11,s11,-1
  80073c:	037d8863          	beq	s11,s7,80076c <vprintfmt+0x32c>
  800740:	00098613          	mv	a2,s3
  800744:	00090593          	mv	a1,s2
  800748:	00048663          	beqz	s1,800754 <vprintfmt+0x314>
  80074c:	fe078793          	addi	a5,a5,-32
  800750:	12fc6a63          	bltu	s8,a5,800884 <vprintfmt+0x444>
  800754:	000a00e7          	jalr	s4
  800758:	001b0b13          	addi	s6,s6,1
  80075c:	fffb4783          	lbu	a5,-1(s6)
  800760:	fffc8c93          	addi	s9,s9,-1
  800764:	00078513          	mv	a0,a5
  800768:	fc0796e3          	bnez	a5,800734 <vprintfmt+0x2f4>
  80076c:	03905063          	blez	s9,80078c <vprintfmt+0x34c>
  800770:	02000413          	li	s0,32
  800774:	fffc8c93          	addi	s9,s9,-1
  800778:	00098613          	mv	a2,s3
  80077c:	00090593          	mv	a1,s2
  800780:	00040513          	mv	a0,s0
  800784:	000a00e7          	jalr	s4
  800788:	fe0c96e3          	bnez	s9,800774 <vprintfmt+0x334>
  80078c:	01412b03          	lw	s6,20(sp)
  800790:	d0dff06f          	j	80049c <vprintfmt+0x5c>
  800794:	00100793          	li	a5,1
  800798:	10b7ca63          	blt	a5,a1,8008ac <vprintfmt+0x46c>
  80079c:	000b2703          	lw	a4,0(s6)
  8007a0:	00000793          	li	a5,0
  8007a4:	004b0b13          	addi	s6,s6,4
  8007a8:	00a00813          	li	a6,10
  8007ac:	dc1ff06f          	j	80056c <vprintfmt+0x12c>
  8007b0:	00144e03          	lbu	t3,1(s0)
  8007b4:	00050693          	mv	a3,a0
  8007b8:	000d0413          	mv	s0,s10
  8007bc:	d39ff06f          	j	8004f4 <vprintfmt+0xb4>
  8007c0:	00098613          	mv	a2,s3
  8007c4:	00090593          	mv	a1,s2
  8007c8:	02500513          	li	a0,37
  8007cc:	000a00e7          	jalr	s4
  8007d0:	ccdff06f          	j	80049c <vprintfmt+0x5c>
  8007d4:	000b2d83          	lw	s11,0(s6)
  8007d8:	00144e03          	lbu	t3,1(s0)
  8007dc:	004b0b13          	addi	s6,s6,4
  8007e0:	000d0413          	mv	s0,s10
  8007e4:	d00cd8e3          	bgez	s9,8004f4 <vprintfmt+0xb4>
  8007e8:	000d8c93          	mv	s9,s11
  8007ec:	fff00d93          	li	s11,-1
  8007f0:	d05ff06f          	j	8004f4 <vprintfmt+0xb4>
  8007f4:	00144e03          	lbu	t3,1(s0)
  8007f8:	00080693          	mv	a3,a6
  8007fc:	000d0413          	mv	s0,s10
  800800:	cf5ff06f          	j	8004f4 <vprintfmt+0xb4>
  800804:	00144e83          	lbu	t4,1(s0)
  800808:	fd0e0d93          	addi	s11,t3,-48
  80080c:	fd0e8793          	addi	a5,t4,-48
  800810:	14f66c63          	bltu	a2,a5,800968 <vprintfmt+0x528>
  800814:	000d0413          	mv	s0,s10
  800818:	002d9793          	slli	a5,s11,0x2
  80081c:	01b78db3          	add	s11,a5,s11
  800820:	00140413          	addi	s0,s0,1
  800824:	001d9d93          	slli	s11,s11,0x1
  800828:	01dd8db3          	add	s11,s11,t4
  80082c:	00044e83          	lbu	t4,0(s0)
  800830:	fd0d8d93          	addi	s11,s11,-48
  800834:	fd0e8793          	addi	a5,t4,-48
  800838:	fef670e3          	bleu	a5,a2,800818 <vprintfmt+0x3d8>
  80083c:	000e8e13          	mv	t3,t4
  800840:	fa5ff06f          	j	8007e4 <vprintfmt+0x3a4>
  800844:	0e0cc863          	bltz	s9,800934 <vprintfmt+0x4f4>
  800848:	00144e03          	lbu	t3,1(s0)
  80084c:	000d0413          	mv	s0,s10
  800850:	ca5ff06f          	j	8004f4 <vprintfmt+0xb4>
  800854:	00098613          	mv	a2,s3
  800858:	00090593          	mv	a1,s2
  80085c:	02500513          	li	a0,37
  800860:	000a00e7          	jalr	s4
  800864:	fff44783          	lbu	a5,-1(s0)
  800868:	02500713          	li	a4,37
  80086c:	00040d13          	mv	s10,s0
  800870:	c2e786e3          	beq	a5,a4,80049c <vprintfmt+0x5c>
  800874:	fffd0d13          	addi	s10,s10,-1
  800878:	fffd4783          	lbu	a5,-1(s10)
  80087c:	fee79ce3          	bne	a5,a4,800874 <vprintfmt+0x434>
  800880:	c1dff06f          	j	80049c <vprintfmt+0x5c>
  800884:	00040513          	mv	a0,s0
  800888:	000a00e7          	jalr	s4
  80088c:	ecdff06f          	j	800758 <vprintfmt+0x318>
  800890:	007b0793          	addi	a5,s6,7
  800894:	ff87f793          	andi	a5,a5,-8
  800898:	00878b13          	addi	s6,a5,8
  80089c:	0007a703          	lw	a4,0(a5)
  8008a0:	00800813          	li	a6,8
  8008a4:	0047a783          	lw	a5,4(a5)
  8008a8:	cc5ff06f          	j	80056c <vprintfmt+0x12c>
  8008ac:	007b0793          	addi	a5,s6,7
  8008b0:	ff87f793          	andi	a5,a5,-8
  8008b4:	00878b13          	addi	s6,a5,8
  8008b8:	0007a703          	lw	a4,0(a5)
  8008bc:	00a00813          	li	a6,10
  8008c0:	0047a783          	lw	a5,4(a5)
  8008c4:	ca9ff06f          	j	80056c <vprintfmt+0x12c>
  8008c8:	007b0793          	addi	a5,s6,7
  8008cc:	ff87f793          	andi	a5,a5,-8
  8008d0:	00878b13          	addi	s6,a5,8
  8008d4:	0007a703          	lw	a4,0(a5)
  8008d8:	01000813          	li	a6,16
  8008dc:	0047a783          	lw	a5,4(a5)
  8008e0:	c8dff06f          	j	80056c <vprintfmt+0x12c>
  8008e4:	007b0793          	addi	a5,s6,7
  8008e8:	ff87f793          	andi	a5,a5,-8
  8008ec:	00878b13          	addi	s6,a5,8
  8008f0:	0007a703          	lw	a4,0(a5)
  8008f4:	0047a783          	lw	a5,4(a5)
  8008f8:	ccdff06f          	j	8005c4 <vprintfmt+0x184>
  8008fc:	00078713          	mv	a4,a5
  800900:	00000697          	auipc	a3,0x0
  800904:	4fc68693          	addi	a3,a3,1276 # 800dfc <error_string+0x22c>
  800908:	00090613          	mv	a2,s2
  80090c:	00098593          	mv	a1,s3
  800910:	000a0513          	mv	a0,s4
  800914:	078000ef          	jal	ra,80098c <printfmt>
  800918:	b85ff06f          	j	80049c <vprintfmt+0x5c>
  80091c:	00044783          	lbu	a5,0(s0)
  800920:	00140b13          	addi	s6,s0,1
  800924:	00078513          	mv	a0,a5
  800928:	e40784e3          	beqz	a5,800770 <vprintfmt+0x330>
  80092c:	03f00413          	li	s0,63
  800930:	e05ff06f          	j	800734 <vprintfmt+0x2f4>
  800934:	00000c93          	li	s9,0
  800938:	f11ff06f          	j	800848 <vprintfmt+0x408>
  80093c:	03905c63          	blez	s9,800974 <vprintfmt+0x534>
  800940:	02d00793          	li	a5,45
  800944:	00000417          	auipc	s0,0x0
  800948:	4b040413          	addi	s0,s0,1200 # 800df4 <error_string+0x224>
  80094c:	d8f69ce3          	bne	a3,a5,8006e4 <vprintfmt+0x2a4>
  800950:	02800513          	li	a0,40
  800954:	00000b17          	auipc	s6,0x0
  800958:	4a1b0b13          	addi	s6,s6,1185 # 800df5 <error_string+0x225>
  80095c:	00050793          	mv	a5,a0
  800960:	03f00413          	li	s0,63
  800964:	dd1ff06f          	j	800734 <vprintfmt+0x2f4>
  800968:	000e8e13          	mv	t3,t4
  80096c:	000d0413          	mv	s0,s10
  800970:	e75ff06f          	j	8007e4 <vprintfmt+0x3a4>
  800974:	02800793          	li	a5,40
  800978:	00078513          	mv	a0,a5
  80097c:	00000b17          	auipc	s6,0x0
  800980:	479b0b13          	addi	s6,s6,1145 # 800df5 <error_string+0x225>
  800984:	03f00413          	li	s0,63
  800988:	dadff06f          	j	800734 <vprintfmt+0x2f4>

0080098c <printfmt>:
  80098c:	fd010113          	addi	sp,sp,-48
  800990:	02010313          	addi	t1,sp,32
  800994:	02e12023          	sw	a4,32(sp)
  800998:	00030713          	mv	a4,t1
  80099c:	00112e23          	sw	ra,28(sp)
  8009a0:	02f12223          	sw	a5,36(sp)
  8009a4:	03012423          	sw	a6,40(sp)
  8009a8:	03112623          	sw	a7,44(sp)
  8009ac:	00612623          	sw	t1,12(sp)
  8009b0:	a91ff0ef          	jal	ra,800440 <vprintfmt>
  8009b4:	01c12083          	lw	ra,28(sp)
  8009b8:	03010113          	addi	sp,sp,48
  8009bc:	00008067          	ret

008009c0 <main>:
  8009c0:	ff010113          	addi	sp,sp,-16
  8009c4:	00000513          	li	a0,0
  8009c8:	00112623          	sw	ra,12(sp)
  8009cc:	f6cff0ef          	jal	ra,800138 <exit>
