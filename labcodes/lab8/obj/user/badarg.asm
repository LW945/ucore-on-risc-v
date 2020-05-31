
obj/__user_badarg.out:     file format elf32-littleriscv


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
  800040:	b3450513          	addi	a0,a0,-1228 # 800b70 <main+0x124>
  800044:	00112e23          	sw	ra,28(sp)
  800048:	02d12623          	sw	a3,44(sp)
  80004c:	02e12823          	sw	a4,48(sp)
  800050:	03012c23          	sw	a6,56(sp)
  800054:	03112e23          	sw	a7,60(sp)
  800058:	00f12623          	sw	a5,12(sp)
  80005c:	20c000ef          	jal	ra,800268 <cprintf>
  800060:	00c12583          	lw	a1,12(sp)
  800064:	00040513          	mv	a0,s0
  800068:	1c4000ef          	jal	ra,80022c <vcprintf>
  80006c:	00001517          	auipc	a0,0x1
  800070:	b7050513          	addi	a0,a0,-1168 # 800bdc <main+0x190>
  800074:	1f4000ef          	jal	ra,800268 <cprintf>
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
  8000a0:	af050513          	addi	a0,a0,-1296 # 800b8c <main+0x140>
  8000a4:	00112e23          	sw	ra,28(sp)
  8000a8:	02d12623          	sw	a3,44(sp)
  8000ac:	02e12823          	sw	a4,48(sp)
  8000b0:	03012c23          	sw	a6,56(sp)
  8000b4:	03112e23          	sw	a7,60(sp)
  8000b8:	00f12623          	sw	a5,12(sp)
  8000bc:	1ac000ef          	jal	ra,800268 <cprintf>
  8000c0:	00c12583          	lw	a1,12(sp)
  8000c4:	00040513          	mv	a0,s0
  8000c8:	164000ef          	jal	ra,80022c <vcprintf>
  8000cc:	00001517          	auipc	a0,0x1
  8000d0:	b1050513          	addi	a0,a0,-1264 # 800bdc <main+0x190>
  8000d4:	194000ef          	jal	ra,800268 <cprintf>
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
  8001c8:	9e450513          	addi	a0,a0,-1564 # 800ba8 <main+0x15c>
  8001cc:	09c000ef          	jal	ra,800268 <cprintf>
  8001d0:	0000006f          	j	8001d0 <exit+0x18>

008001d4 <fork>:
  8001d4:	f8dff06f          	j	800160 <sys_fork>

008001d8 <waitpid>:
  8001d8:	f91ff06f          	j	800168 <sys_wait>

008001dc <yield>:
  8001dc:	f9dff06f          	j	800178 <sys_yield>

008001e0 <_start>:
  8001e0:	00012503          	lw	a0,0(sp)
  8001e4:	00410593          	addi	a1,sp,4
  8001e8:	14c000ef          	jal	ra,800334 <umain>
  8001ec:	0000006f          	j	8001ec <_start+0xc>

008001f0 <open>:
  8001f0:	f9dff06f          	j	80018c <sys_open>

008001f4 <close>:
  8001f4:	fa9ff06f          	j	80019c <sys_close>

008001f8 <dup2>:
  8001f8:	fb1ff06f          	j	8001a8 <sys_dup>

008001fc <cputch>:
  8001fc:	ff010113          	addi	sp,sp,-16
  800200:	00112623          	sw	ra,12(sp)
  800204:	00812423          	sw	s0,8(sp)
  800208:	00058413          	mv	s0,a1
  80020c:	f75ff0ef          	jal	ra,800180 <sys_putc>
  800210:	00042783          	lw	a5,0(s0)
  800214:	00c12083          	lw	ra,12(sp)
  800218:	00178793          	addi	a5,a5,1
  80021c:	00f42023          	sw	a5,0(s0)
  800220:	00812403          	lw	s0,8(sp)
  800224:	01010113          	addi	sp,sp,16
  800228:	00008067          	ret

0080022c <vcprintf>:
  80022c:	fe010113          	addi	sp,sp,-32
  800230:	00058713          	mv	a4,a1
  800234:	ffff75b7          	lui	a1,0xffff7
  800238:	00050693          	mv	a3,a0
  80023c:	00c10613          	addi	a2,sp,12
  800240:	00000517          	auipc	a0,0x0
  800244:	fbc50513          	addi	a0,a0,-68 # 8001fc <cputch>
  800248:	ad958593          	addi	a1,a1,-1319 # ffff6ad9 <sbi_remote_fence_i+0xffff71e9>
  80024c:	00112e23          	sw	ra,28(sp)
  800250:	00012623          	sw	zero,12(sp)
  800254:	278000ef          	jal	ra,8004cc <vprintfmt>
  800258:	01c12083          	lw	ra,28(sp)
  80025c:	00c12503          	lw	a0,12(sp)
  800260:	02010113          	addi	sp,sp,32
  800264:	00008067          	ret

00800268 <cprintf>:
  800268:	fc010113          	addi	sp,sp,-64
  80026c:	02410313          	addi	t1,sp,36
  800270:	02b12223          	sw	a1,36(sp)
  800274:	ffff75b7          	lui	a1,0xffff7
  800278:	02c12423          	sw	a2,40(sp)
  80027c:	02d12623          	sw	a3,44(sp)
  800280:	02e12823          	sw	a4,48(sp)
  800284:	00050693          	mv	a3,a0
  800288:	00c10613          	addi	a2,sp,12
  80028c:	00000517          	auipc	a0,0x0
  800290:	f7050513          	addi	a0,a0,-144 # 8001fc <cputch>
  800294:	00030713          	mv	a4,t1
  800298:	ad958593          	addi	a1,a1,-1319 # ffff6ad9 <sbi_remote_fence_i+0xffff71e9>
  80029c:	00112e23          	sw	ra,28(sp)
  8002a0:	02f12a23          	sw	a5,52(sp)
  8002a4:	03012c23          	sw	a6,56(sp)
  8002a8:	03112e23          	sw	a7,60(sp)
  8002ac:	00612423          	sw	t1,8(sp)
  8002b0:	00012623          	sw	zero,12(sp)
  8002b4:	218000ef          	jal	ra,8004cc <vprintfmt>
  8002b8:	01c12083          	lw	ra,28(sp)
  8002bc:	00c12503          	lw	a0,12(sp)
  8002c0:	04010113          	addi	sp,sp,64
  8002c4:	00008067          	ret

008002c8 <initfd>:
  8002c8:	ff010113          	addi	sp,sp,-16
  8002cc:	00058793          	mv	a5,a1
  8002d0:	00912223          	sw	s1,4(sp)
  8002d4:	00060593          	mv	a1,a2
  8002d8:	00050493          	mv	s1,a0
  8002dc:	00078513          	mv	a0,a5
  8002e0:	00812423          	sw	s0,8(sp)
  8002e4:	00112623          	sw	ra,12(sp)
  8002e8:	f09ff0ef          	jal	ra,8001f0 <open>
  8002ec:	00050413          	mv	s0,a0
  8002f0:	02054663          	bltz	a0,80031c <initfd+0x54>
  8002f4:	02950463          	beq	a0,s1,80031c <initfd+0x54>
  8002f8:	00048513          	mv	a0,s1
  8002fc:	ef9ff0ef          	jal	ra,8001f4 <close>
  800300:	00048593          	mv	a1,s1
  800304:	00040513          	mv	a0,s0
  800308:	ef1ff0ef          	jal	ra,8001f8 <dup2>
  80030c:	00050493          	mv	s1,a0
  800310:	00040513          	mv	a0,s0
  800314:	ee1ff0ef          	jal	ra,8001f4 <close>
  800318:	00048413          	mv	s0,s1
  80031c:	00c12083          	lw	ra,12(sp)
  800320:	00040513          	mv	a0,s0
  800324:	00412483          	lw	s1,4(sp)
  800328:	00812403          	lw	s0,8(sp)
  80032c:	01010113          	addi	sp,sp,16
  800330:	00008067          	ret

00800334 <umain>:
  800334:	ff010113          	addi	sp,sp,-16
  800338:	00812423          	sw	s0,8(sp)
  80033c:	00912223          	sw	s1,4(sp)
  800340:	00050413          	mv	s0,a0
  800344:	00058493          	mv	s1,a1
  800348:	00000613          	li	a2,0
  80034c:	00001597          	auipc	a1,0x1
  800350:	87058593          	addi	a1,a1,-1936 # 800bbc <main+0x170>
  800354:	00000513          	li	a0,0
  800358:	00112623          	sw	ra,12(sp)
  80035c:	f6dff0ef          	jal	ra,8002c8 <initfd>
  800360:	02054663          	bltz	a0,80038c <umain+0x58>
  800364:	00100613          	li	a2,1
  800368:	00001597          	auipc	a1,0x1
  80036c:	88c58593          	addi	a1,a1,-1908 # 800bf4 <main+0x1a8>
  800370:	00060513          	mv	a0,a2
  800374:	f55ff0ef          	jal	ra,8002c8 <initfd>
  800378:	02054a63          	bltz	a0,8003ac <umain+0x78>
  80037c:	00048593          	mv	a1,s1
  800380:	00040513          	mv	a0,s0
  800384:	6c8000ef          	jal	ra,800a4c <main>
  800388:	e31ff0ef          	jal	ra,8001b8 <exit>
  80038c:	00050693          	mv	a3,a0
  800390:	00001617          	auipc	a2,0x1
  800394:	83460613          	addi	a2,a2,-1996 # 800bc4 <main+0x178>
  800398:	01a00593          	li	a1,26
  80039c:	00001517          	auipc	a0,0x1
  8003a0:	84450513          	addi	a0,a0,-1980 # 800be0 <main+0x194>
  8003a4:	cddff0ef          	jal	ra,800080 <__warn>
  8003a8:	fbdff06f          	j	800364 <umain+0x30>
  8003ac:	00050693          	mv	a3,a0
  8003b0:	00001617          	auipc	a2,0x1
  8003b4:	84c60613          	addi	a2,a2,-1972 # 800bfc <main+0x1b0>
  8003b8:	01d00593          	li	a1,29
  8003bc:	00001517          	auipc	a0,0x1
  8003c0:	82450513          	addi	a0,a0,-2012 # 800be0 <main+0x194>
  8003c4:	cbdff0ef          	jal	ra,800080 <__warn>
  8003c8:	fb5ff06f          	j	80037c <umain+0x48>

008003cc <strnlen>:
  8003cc:	00050693          	mv	a3,a0
  8003d0:	02058a63          	beqz	a1,800404 <strnlen+0x38>
  8003d4:	00054703          	lbu	a4,0(a0)
  8003d8:	00150793          	addi	a5,a0,1
  8003dc:	02070463          	beqz	a4,800404 <strnlen+0x38>
  8003e0:	00b505b3          	add	a1,a0,a1
  8003e4:	0100006f          	j	8003f4 <strnlen+0x28>
  8003e8:	00178793          	addi	a5,a5,1
  8003ec:	fff7c703          	lbu	a4,-1(a5)
  8003f0:	00070863          	beqz	a4,800400 <strnlen+0x34>
  8003f4:	40d78533          	sub	a0,a5,a3
  8003f8:	feb798e3          	bne	a5,a1,8003e8 <strnlen+0x1c>
  8003fc:	00008067          	ret
  800400:	00008067          	ret
  800404:	00000513          	li	a0,0
  800408:	00008067          	ret

0080040c <printnum>:
  80040c:	fd010113          	addi	sp,sp,-48
  800410:	02912223          	sw	s1,36(sp)
  800414:	03212023          	sw	s2,32(sp)
  800418:	01312e23          	sw	s3,28(sp)
  80041c:	01412c23          	sw	s4,24(sp)
  800420:	01512a23          	sw	s5,20(sp)
  800424:	02112623          	sw	ra,44(sp)
  800428:	02812423          	sw	s0,40(sp)
  80042c:	00050493          	mv	s1,a0
  800430:	00058993          	mv	s3,a1
  800434:	00060913          	mv	s2,a2
  800438:	03012a03          	lw	s4,48(sp)
  80043c:	03077ab3          	remu	s5,a4,a6
  800440:	06079463          	bnez	a5,8004a8 <printnum+0x9c>
  800444:	07077263          	bleu	a6,a4,8004a8 <printnum+0x9c>
  800448:	fff88413          	addi	s0,a7,-1
  80044c:	00805e63          	blez	s0,800468 <printnum+0x5c>
  800450:	fff40413          	addi	s0,s0,-1
  800454:	00098613          	mv	a2,s3
  800458:	00090593          	mv	a1,s2
  80045c:	000a0513          	mv	a0,s4
  800460:	000480e7          	jalr	s1
  800464:	fe0416e3          	bnez	s0,800450 <printnum+0x44>
  800468:	00001797          	auipc	a5,0x1
  80046c:	96c78793          	addi	a5,a5,-1684 # 800dd4 <error_string+0x64>
  800470:	015787b3          	add	a5,a5,s5
  800474:	00098613          	mv	a2,s3
  800478:	00090593          	mv	a1,s2
  80047c:	00048313          	mv	t1,s1
  800480:	02c12083          	lw	ra,44(sp)
  800484:	02812403          	lw	s0,40(sp)
  800488:	02412483          	lw	s1,36(sp)
  80048c:	02012903          	lw	s2,32(sp)
  800490:	01c12983          	lw	s3,28(sp)
  800494:	01812a03          	lw	s4,24(sp)
  800498:	01412a83          	lw	s5,20(sp)
  80049c:	0007c503          	lbu	a0,0(a5)
  8004a0:	03010113          	addi	sp,sp,48
  8004a4:	00030067          	jr	t1
  8004a8:	03075733          	divu	a4,a4,a6
  8004ac:	01412023          	sw	s4,0(sp)
  8004b0:	fff88893          	addi	a7,a7,-1
  8004b4:	00000793          	li	a5,0
  8004b8:	00090613          	mv	a2,s2
  8004bc:	00098593          	mv	a1,s3
  8004c0:	00048513          	mv	a0,s1
  8004c4:	f49ff0ef          	jal	ra,80040c <printnum>
  8004c8:	fa1ff06f          	j	800468 <printnum+0x5c>

008004cc <vprintfmt>:
  8004cc:	fa010113          	addi	sp,sp,-96
  8004d0:	05212823          	sw	s2,80(sp)
  8004d4:	05312623          	sw	s3,76(sp)
  8004d8:	05412423          	sw	s4,72(sp)
  8004dc:	05512223          	sw	s5,68(sp)
  8004e0:	05612023          	sw	s6,64(sp)
  8004e4:	03712e23          	sw	s7,60(sp)
  8004e8:	03812c23          	sw	s8,56(sp)
  8004ec:	03a12823          	sw	s10,48(sp)
  8004f0:	04112e23          	sw	ra,92(sp)
  8004f4:	04812c23          	sw	s0,88(sp)
  8004f8:	04912a23          	sw	s1,84(sp)
  8004fc:	03912a23          	sw	s9,52(sp)
  800500:	03b12623          	sw	s11,44(sp)
  800504:	00050a13          	mv	s4,a0
  800508:	00058993          	mv	s3,a1
  80050c:	00060913          	mv	s2,a2
  800510:	00068d13          	mv	s10,a3
  800514:	00070b13          	mv	s6,a4
  800518:	00000a97          	auipc	s5,0x0
  80051c:	700a8a93          	addi	s5,s5,1792 # 800c18 <main+0x1cc>
  800520:	fff00b93          	li	s7,-1
  800524:	05e00c13          	li	s8,94
  800528:	000d4503          	lbu	a0,0(s10)
  80052c:	02500493          	li	s1,37
  800530:	001d0413          	addi	s0,s10,1
  800534:	02950063          	beq	a0,s1,800554 <vprintfmt+0x88>
  800538:	06050663          	beqz	a0,8005a4 <vprintfmt+0xd8>
  80053c:	00098613          	mv	a2,s3
  800540:	00090593          	mv	a1,s2
  800544:	00140413          	addi	s0,s0,1
  800548:	000a00e7          	jalr	s4
  80054c:	fff44503          	lbu	a0,-1(s0)
  800550:	fe9514e3          	bne	a0,s1,800538 <vprintfmt+0x6c>
  800554:	00044e03          	lbu	t3,0(s0)
  800558:	fff00d93          	li	s11,-1
  80055c:	02000693          	li	a3,32
  800560:	00000493          	li	s1,0
  800564:	00000593          	li	a1,0
  800568:	000d8c93          	mv	s9,s11
  80056c:	05500713          	li	a4,85
  800570:	00100313          	li	t1,1
  800574:	03000813          	li	a6,48
  800578:	00900613          	li	a2,9
  80057c:	02d00513          	li	a0,45
  800580:	fdde0793          	addi	a5,t3,-35
  800584:	0ff7f793          	andi	a5,a5,255
  800588:	00140d13          	addi	s10,s0,1
  80058c:	34f76a63          	bltu	a4,a5,8008e0 <vprintfmt+0x414>
  800590:	00279793          	slli	a5,a5,0x2
  800594:	015787b3          	add	a5,a5,s5
  800598:	0007a783          	lw	a5,0(a5)
  80059c:	015787b3          	add	a5,a5,s5
  8005a0:	00078067          	jr	a5
  8005a4:	05c12083          	lw	ra,92(sp)
  8005a8:	05812403          	lw	s0,88(sp)
  8005ac:	05412483          	lw	s1,84(sp)
  8005b0:	05012903          	lw	s2,80(sp)
  8005b4:	04c12983          	lw	s3,76(sp)
  8005b8:	04812a03          	lw	s4,72(sp)
  8005bc:	04412a83          	lw	s5,68(sp)
  8005c0:	04012b03          	lw	s6,64(sp)
  8005c4:	03c12b83          	lw	s7,60(sp)
  8005c8:	03812c03          	lw	s8,56(sp)
  8005cc:	03412c83          	lw	s9,52(sp)
  8005d0:	03012d03          	lw	s10,48(sp)
  8005d4:	02c12d83          	lw	s11,44(sp)
  8005d8:	06010113          	addi	sp,sp,96
  8005dc:	00008067          	ret
  8005e0:	00100793          	li	a5,1
  8005e4:	36b7c863          	blt	a5,a1,800954 <vprintfmt+0x488>
  8005e8:	000b2703          	lw	a4,0(s6)
  8005ec:	00000793          	li	a5,0
  8005f0:	004b0b13          	addi	s6,s6,4
  8005f4:	01000813          	li	a6,16
  8005f8:	00d12023          	sw	a3,0(sp)
  8005fc:	000c8893          	mv	a7,s9
  800600:	00090613          	mv	a2,s2
  800604:	00098593          	mv	a1,s3
  800608:	000a0513          	mv	a0,s4
  80060c:	e01ff0ef          	jal	ra,80040c <printnum>
  800610:	f19ff06f          	j	800528 <vprintfmt+0x5c>
  800614:	00144e03          	lbu	t3,1(s0)
  800618:	00030493          	mv	s1,t1
  80061c:	000d0413          	mv	s0,s10
  800620:	f61ff06f          	j	800580 <vprintfmt+0xb4>
  800624:	000b2503          	lw	a0,0(s6)
  800628:	00098613          	mv	a2,s3
  80062c:	00090593          	mv	a1,s2
  800630:	004b0b13          	addi	s6,s6,4
  800634:	000a00e7          	jalr	s4
  800638:	ef1ff06f          	j	800528 <vprintfmt+0x5c>
  80063c:	00100793          	li	a5,1
  800640:	32b7c863          	blt	a5,a1,800970 <vprintfmt+0x4a4>
  800644:	000b2703          	lw	a4,0(s6)
  800648:	004b0b13          	addi	s6,s6,4
  80064c:	41f75793          	srai	a5,a4,0x1f
  800650:	00a00813          	li	a6,10
  800654:	fa07d2e3          	bgez	a5,8005f8 <vprintfmt+0x12c>
  800658:	00098613          	mv	a2,s3
  80065c:	00090593          	mv	a1,s2
  800660:	02d00513          	li	a0,45
  800664:	00f12e23          	sw	a5,28(sp)
  800668:	00e12c23          	sw	a4,24(sp)
  80066c:	01012a23          	sw	a6,20(sp)
  800670:	00d12823          	sw	a3,16(sp)
  800674:	000a00e7          	jalr	s4
  800678:	01812703          	lw	a4,24(sp)
  80067c:	01c12783          	lw	a5,28(sp)
  800680:	01012683          	lw	a3,16(sp)
  800684:	40e00733          	neg	a4,a4
  800688:	00e03633          	snez	a2,a4
  80068c:	40f007b3          	neg	a5,a5
  800690:	40c787b3          	sub	a5,a5,a2
  800694:	01412803          	lw	a6,20(sp)
  800698:	f61ff06f          	j	8005f8 <vprintfmt+0x12c>
  80069c:	000b2783          	lw	a5,0(s6)
  8006a0:	01800693          	li	a3,24
  8006a4:	004b0b13          	addi	s6,s6,4
  8006a8:	41f7d713          	srai	a4,a5,0x1f
  8006ac:	00f747b3          	xor	a5,a4,a5
  8006b0:	40e787b3          	sub	a5,a5,a4
  8006b4:	2cf6ca63          	blt	a3,a5,800988 <vprintfmt+0x4bc>
  8006b8:	00279693          	slli	a3,a5,0x2
  8006bc:	00000717          	auipc	a4,0x0
  8006c0:	6b470713          	addi	a4,a4,1716 # 800d70 <error_string>
  8006c4:	00d70733          	add	a4,a4,a3
  8006c8:	00072703          	lw	a4,0(a4)
  8006cc:	2a070e63          	beqz	a4,800988 <vprintfmt+0x4bc>
  8006d0:	00001697          	auipc	a3,0x1
  8006d4:	8d868693          	addi	a3,a3,-1832 # 800fa8 <error_string+0x238>
  8006d8:	00090613          	mv	a2,s2
  8006dc:	00098593          	mv	a1,s3
  8006e0:	000a0513          	mv	a0,s4
  8006e4:	334000ef          	jal	ra,800a18 <printfmt>
  8006e8:	e41ff06f          	j	800528 <vprintfmt+0x5c>
  8006ec:	00144e03          	lbu	t3,1(s0)
  8006f0:	00158593          	addi	a1,a1,1
  8006f4:	000d0413          	mv	s0,s10
  8006f8:	e89ff06f          	j	800580 <vprintfmt+0xb4>
  8006fc:	00100793          	li	a5,1
  800700:	20b7ce63          	blt	a5,a1,80091c <vprintfmt+0x450>
  800704:	000b2703          	lw	a4,0(s6)
  800708:	00000793          	li	a5,0
  80070c:	004b0b13          	addi	s6,s6,4
  800710:	00800813          	li	a6,8
  800714:	ee5ff06f          	j	8005f8 <vprintfmt+0x12c>
  800718:	03000513          	li	a0,48
  80071c:	00098613          	mv	a2,s3
  800720:	00090593          	mv	a1,s2
  800724:	00d12823          	sw	a3,16(sp)
  800728:	000a00e7          	jalr	s4
  80072c:	00098613          	mv	a2,s3
  800730:	00090593          	mv	a1,s2
  800734:	07800513          	li	a0,120
  800738:	000a00e7          	jalr	s4
  80073c:	000b2703          	lw	a4,0(s6)
  800740:	00000793          	li	a5,0
  800744:	01000813          	li	a6,16
  800748:	004b0b13          	addi	s6,s6,4
  80074c:	01012683          	lw	a3,16(sp)
  800750:	ea9ff06f          	j	8005f8 <vprintfmt+0x12c>
  800754:	000b2403          	lw	s0,0(s6)
  800758:	004b0793          	addi	a5,s6,4
  80075c:	00f12a23          	sw	a5,20(sp)
  800760:	26040463          	beqz	s0,8009c8 <vprintfmt+0x4fc>
  800764:	05905463          	blez	s9,8007ac <vprintfmt+0x2e0>
  800768:	02d00793          	li	a5,45
  80076c:	22f68e63          	beq	a3,a5,8009a8 <vprintfmt+0x4dc>
  800770:	000d8593          	mv	a1,s11
  800774:	00040513          	mv	a0,s0
  800778:	00d12823          	sw	a3,16(sp)
  80077c:	c51ff0ef          	jal	ra,8003cc <strnlen>
  800780:	40ac8cb3          	sub	s9,s9,a0
  800784:	03905463          	blez	s9,8007ac <vprintfmt+0x2e0>
  800788:	01012683          	lw	a3,16(sp)
  80078c:	00068513          	mv	a0,a3
  800790:	00098613          	mv	a2,s3
  800794:	00090593          	mv	a1,s2
  800798:	00d12823          	sw	a3,16(sp)
  80079c:	fffc8c93          	addi	s9,s9,-1
  8007a0:	000a00e7          	jalr	s4
  8007a4:	01012683          	lw	a3,16(sp)
  8007a8:	fe0c92e3          	bnez	s9,80078c <vprintfmt+0x2c0>
  8007ac:	00044783          	lbu	a5,0(s0)
  8007b0:	00140b13          	addi	s6,s0,1
  8007b4:	00078513          	mv	a0,a5
  8007b8:	06078063          	beqz	a5,800818 <vprintfmt+0x34c>
  8007bc:	03f00413          	li	s0,63
  8007c0:	000dc663          	bltz	s11,8007cc <vprintfmt+0x300>
  8007c4:	fffd8d93          	addi	s11,s11,-1
  8007c8:	037d8863          	beq	s11,s7,8007f8 <vprintfmt+0x32c>
  8007cc:	00098613          	mv	a2,s3
  8007d0:	00090593          	mv	a1,s2
  8007d4:	00048663          	beqz	s1,8007e0 <vprintfmt+0x314>
  8007d8:	fe078793          	addi	a5,a5,-32
  8007dc:	12fc6a63          	bltu	s8,a5,800910 <vprintfmt+0x444>
  8007e0:	000a00e7          	jalr	s4
  8007e4:	001b0b13          	addi	s6,s6,1
  8007e8:	fffb4783          	lbu	a5,-1(s6)
  8007ec:	fffc8c93          	addi	s9,s9,-1
  8007f0:	00078513          	mv	a0,a5
  8007f4:	fc0796e3          	bnez	a5,8007c0 <vprintfmt+0x2f4>
  8007f8:	03905063          	blez	s9,800818 <vprintfmt+0x34c>
  8007fc:	02000413          	li	s0,32
  800800:	fffc8c93          	addi	s9,s9,-1
  800804:	00098613          	mv	a2,s3
  800808:	00090593          	mv	a1,s2
  80080c:	00040513          	mv	a0,s0
  800810:	000a00e7          	jalr	s4
  800814:	fe0c96e3          	bnez	s9,800800 <vprintfmt+0x334>
  800818:	01412b03          	lw	s6,20(sp)
  80081c:	d0dff06f          	j	800528 <vprintfmt+0x5c>
  800820:	00100793          	li	a5,1
  800824:	10b7ca63          	blt	a5,a1,800938 <vprintfmt+0x46c>
  800828:	000b2703          	lw	a4,0(s6)
  80082c:	00000793          	li	a5,0
  800830:	004b0b13          	addi	s6,s6,4
  800834:	00a00813          	li	a6,10
  800838:	dc1ff06f          	j	8005f8 <vprintfmt+0x12c>
  80083c:	00144e03          	lbu	t3,1(s0)
  800840:	00050693          	mv	a3,a0
  800844:	000d0413          	mv	s0,s10
  800848:	d39ff06f          	j	800580 <vprintfmt+0xb4>
  80084c:	00098613          	mv	a2,s3
  800850:	00090593          	mv	a1,s2
  800854:	02500513          	li	a0,37
  800858:	000a00e7          	jalr	s4
  80085c:	ccdff06f          	j	800528 <vprintfmt+0x5c>
  800860:	000b2d83          	lw	s11,0(s6)
  800864:	00144e03          	lbu	t3,1(s0)
  800868:	004b0b13          	addi	s6,s6,4
  80086c:	000d0413          	mv	s0,s10
  800870:	d00cd8e3          	bgez	s9,800580 <vprintfmt+0xb4>
  800874:	000d8c93          	mv	s9,s11
  800878:	fff00d93          	li	s11,-1
  80087c:	d05ff06f          	j	800580 <vprintfmt+0xb4>
  800880:	00144e03          	lbu	t3,1(s0)
  800884:	00080693          	mv	a3,a6
  800888:	000d0413          	mv	s0,s10
  80088c:	cf5ff06f          	j	800580 <vprintfmt+0xb4>
  800890:	00144e83          	lbu	t4,1(s0)
  800894:	fd0e0d93          	addi	s11,t3,-48
  800898:	fd0e8793          	addi	a5,t4,-48
  80089c:	14f66c63          	bltu	a2,a5,8009f4 <vprintfmt+0x528>
  8008a0:	000d0413          	mv	s0,s10
  8008a4:	002d9793          	slli	a5,s11,0x2
  8008a8:	01b78db3          	add	s11,a5,s11
  8008ac:	00140413          	addi	s0,s0,1
  8008b0:	001d9d93          	slli	s11,s11,0x1
  8008b4:	01dd8db3          	add	s11,s11,t4
  8008b8:	00044e83          	lbu	t4,0(s0)
  8008bc:	fd0d8d93          	addi	s11,s11,-48
  8008c0:	fd0e8793          	addi	a5,t4,-48
  8008c4:	fef670e3          	bleu	a5,a2,8008a4 <vprintfmt+0x3d8>
  8008c8:	000e8e13          	mv	t3,t4
  8008cc:	fa5ff06f          	j	800870 <vprintfmt+0x3a4>
  8008d0:	0e0cc863          	bltz	s9,8009c0 <vprintfmt+0x4f4>
  8008d4:	00144e03          	lbu	t3,1(s0)
  8008d8:	000d0413          	mv	s0,s10
  8008dc:	ca5ff06f          	j	800580 <vprintfmt+0xb4>
  8008e0:	00098613          	mv	a2,s3
  8008e4:	00090593          	mv	a1,s2
  8008e8:	02500513          	li	a0,37
  8008ec:	000a00e7          	jalr	s4
  8008f0:	fff44783          	lbu	a5,-1(s0)
  8008f4:	02500713          	li	a4,37
  8008f8:	00040d13          	mv	s10,s0
  8008fc:	c2e786e3          	beq	a5,a4,800528 <vprintfmt+0x5c>
  800900:	fffd0d13          	addi	s10,s10,-1
  800904:	fffd4783          	lbu	a5,-1(s10)
  800908:	fee79ce3          	bne	a5,a4,800900 <vprintfmt+0x434>
  80090c:	c1dff06f          	j	800528 <vprintfmt+0x5c>
  800910:	00040513          	mv	a0,s0
  800914:	000a00e7          	jalr	s4
  800918:	ecdff06f          	j	8007e4 <vprintfmt+0x318>
  80091c:	007b0793          	addi	a5,s6,7
  800920:	ff87f793          	andi	a5,a5,-8
  800924:	00878b13          	addi	s6,a5,8
  800928:	0007a703          	lw	a4,0(a5)
  80092c:	00800813          	li	a6,8
  800930:	0047a783          	lw	a5,4(a5)
  800934:	cc5ff06f          	j	8005f8 <vprintfmt+0x12c>
  800938:	007b0793          	addi	a5,s6,7
  80093c:	ff87f793          	andi	a5,a5,-8
  800940:	00878b13          	addi	s6,a5,8
  800944:	0007a703          	lw	a4,0(a5)
  800948:	00a00813          	li	a6,10
  80094c:	0047a783          	lw	a5,4(a5)
  800950:	ca9ff06f          	j	8005f8 <vprintfmt+0x12c>
  800954:	007b0793          	addi	a5,s6,7
  800958:	ff87f793          	andi	a5,a5,-8
  80095c:	00878b13          	addi	s6,a5,8
  800960:	0007a703          	lw	a4,0(a5)
  800964:	01000813          	li	a6,16
  800968:	0047a783          	lw	a5,4(a5)
  80096c:	c8dff06f          	j	8005f8 <vprintfmt+0x12c>
  800970:	007b0793          	addi	a5,s6,7
  800974:	ff87f793          	andi	a5,a5,-8
  800978:	00878b13          	addi	s6,a5,8
  80097c:	0007a703          	lw	a4,0(a5)
  800980:	0047a783          	lw	a5,4(a5)
  800984:	ccdff06f          	j	800650 <vprintfmt+0x184>
  800988:	00078713          	mv	a4,a5
  80098c:	00000697          	auipc	a3,0x0
  800990:	61068693          	addi	a3,a3,1552 # 800f9c <error_string+0x22c>
  800994:	00090613          	mv	a2,s2
  800998:	00098593          	mv	a1,s3
  80099c:	000a0513          	mv	a0,s4
  8009a0:	078000ef          	jal	ra,800a18 <printfmt>
  8009a4:	b85ff06f          	j	800528 <vprintfmt+0x5c>
  8009a8:	00044783          	lbu	a5,0(s0)
  8009ac:	00140b13          	addi	s6,s0,1
  8009b0:	00078513          	mv	a0,a5
  8009b4:	e40784e3          	beqz	a5,8007fc <vprintfmt+0x330>
  8009b8:	03f00413          	li	s0,63
  8009bc:	e05ff06f          	j	8007c0 <vprintfmt+0x2f4>
  8009c0:	00000c93          	li	s9,0
  8009c4:	f11ff06f          	j	8008d4 <vprintfmt+0x408>
  8009c8:	03905c63          	blez	s9,800a00 <vprintfmt+0x534>
  8009cc:	02d00793          	li	a5,45
  8009d0:	00000417          	auipc	s0,0x0
  8009d4:	5c440413          	addi	s0,s0,1476 # 800f94 <error_string+0x224>
  8009d8:	d8f69ce3          	bne	a3,a5,800770 <vprintfmt+0x2a4>
  8009dc:	02800513          	li	a0,40
  8009e0:	00000b17          	auipc	s6,0x0
  8009e4:	5b5b0b13          	addi	s6,s6,1461 # 800f95 <error_string+0x225>
  8009e8:	00050793          	mv	a5,a0
  8009ec:	03f00413          	li	s0,63
  8009f0:	dd1ff06f          	j	8007c0 <vprintfmt+0x2f4>
  8009f4:	000e8e13          	mv	t3,t4
  8009f8:	000d0413          	mv	s0,s10
  8009fc:	e75ff06f          	j	800870 <vprintfmt+0x3a4>
  800a00:	02800793          	li	a5,40
  800a04:	00078513          	mv	a0,a5
  800a08:	00000b17          	auipc	s6,0x0
  800a0c:	58db0b13          	addi	s6,s6,1421 # 800f95 <error_string+0x225>
  800a10:	03f00413          	li	s0,63
  800a14:	dadff06f          	j	8007c0 <vprintfmt+0x2f4>

00800a18 <printfmt>:
  800a18:	fd010113          	addi	sp,sp,-48
  800a1c:	02010313          	addi	t1,sp,32
  800a20:	02e12023          	sw	a4,32(sp)
  800a24:	00030713          	mv	a4,t1
  800a28:	00112e23          	sw	ra,28(sp)
  800a2c:	02f12223          	sw	a5,36(sp)
  800a30:	03012423          	sw	a6,40(sp)
  800a34:	03112623          	sw	a7,44(sp)
  800a38:	00612623          	sw	t1,12(sp)
  800a3c:	a91ff0ef          	jal	ra,8004cc <vprintfmt>
  800a40:	01c12083          	lw	ra,28(sp)
  800a44:	03010113          	addi	sp,sp,48
  800a48:	00008067          	ret

00800a4c <main>:
  800a4c:	fe010113          	addi	sp,sp,-32
  800a50:	00112e23          	sw	ra,28(sp)
  800a54:	00812c23          	sw	s0,24(sp)
  800a58:	f7cff0ef          	jal	ra,8001d4 <fork>
  800a5c:	0e050663          	beqz	a0,800b48 <main+0xfc>
  800a60:	00050413          	mv	s0,a0
  800a64:	0ca05263          	blez	a0,800b28 <main+0xdc>
  800a68:	00000593          	li	a1,0
  800a6c:	fff00513          	li	a0,-1
  800a70:	f68ff0ef          	jal	ra,8001d8 <waitpid>
  800a74:	08050a63          	beqz	a0,800b08 <main+0xbc>
  800a78:	c00005b7          	lui	a1,0xc0000
  800a7c:	00040513          	mv	a0,s0
  800a80:	f58ff0ef          	jal	ra,8001d8 <waitpid>
  800a84:	06050263          	beqz	a0,800ae8 <main+0x9c>
  800a88:	00c10593          	addi	a1,sp,12
  800a8c:	00040513          	mv	a0,s0
  800a90:	f48ff0ef          	jal	ra,8001d8 <waitpid>
  800a94:	02051a63          	bnez	a0,800ac8 <main+0x7c>
  800a98:	00c12703          	lw	a4,12(sp)
  800a9c:	0000c7b7          	lui	a5,0xc
  800aa0:	eaf78793          	addi	a5,a5,-337 # beaf <__panic-0x7f4171>
  800aa4:	02f71263          	bne	a4,a5,800ac8 <main+0x7c>
  800aa8:	00000517          	auipc	a0,0x0
  800aac:	5b850513          	addi	a0,a0,1464 # 801060 <error_string+0x2f0>
  800ab0:	fb8ff0ef          	jal	ra,800268 <cprintf>
  800ab4:	01c12083          	lw	ra,28(sp)
  800ab8:	00000513          	li	a0,0
  800abc:	01812403          	lw	s0,24(sp)
  800ac0:	02010113          	addi	sp,sp,32
  800ac4:	00008067          	ret
  800ac8:	00000697          	auipc	a3,0x0
  800acc:	56068693          	addi	a3,a3,1376 # 801028 <error_string+0x2b8>
  800ad0:	00000617          	auipc	a2,0x0
  800ad4:	4f060613          	addi	a2,a2,1264 # 800fc0 <error_string+0x250>
  800ad8:	01200593          	li	a1,18
  800adc:	00000517          	auipc	a0,0x0
  800ae0:	4fc50513          	addi	a0,a0,1276 # 800fd8 <error_string+0x268>
  800ae4:	d3cff0ef          	jal	ra,800020 <__panic>
  800ae8:	00000697          	auipc	a3,0x0
  800aec:	51868693          	addi	a3,a3,1304 # 801000 <error_string+0x290>
  800af0:	00000617          	auipc	a2,0x0
  800af4:	4d060613          	addi	a2,a2,1232 # 800fc0 <error_string+0x250>
  800af8:	01100593          	li	a1,17
  800afc:	00000517          	auipc	a0,0x0
  800b00:	4dc50513          	addi	a0,a0,1244 # 800fd8 <error_string+0x268>
  800b04:	d1cff0ef          	jal	ra,800020 <__panic>
  800b08:	00000697          	auipc	a3,0x0
  800b0c:	4e068693          	addi	a3,a3,1248 # 800fe8 <error_string+0x278>
  800b10:	00000617          	auipc	a2,0x0
  800b14:	4b060613          	addi	a2,a2,1200 # 800fc0 <error_string+0x250>
  800b18:	01000593          	li	a1,16
  800b1c:	00000517          	auipc	a0,0x0
  800b20:	4bc50513          	addi	a0,a0,1212 # 800fd8 <error_string+0x268>
  800b24:	cfcff0ef          	jal	ra,800020 <__panic>
  800b28:	00000697          	auipc	a3,0x0
  800b2c:	49068693          	addi	a3,a3,1168 # 800fb8 <error_string+0x248>
  800b30:	00000617          	auipc	a2,0x0
  800b34:	49060613          	addi	a2,a2,1168 # 800fc0 <error_string+0x250>
  800b38:	00f00593          	li	a1,15
  800b3c:	00000517          	auipc	a0,0x0
  800b40:	49c50513          	addi	a0,a0,1180 # 800fd8 <error_string+0x268>
  800b44:	cdcff0ef          	jal	ra,800020 <__panic>
  800b48:	00000517          	auipc	a0,0x0
  800b4c:	46450513          	addi	a0,a0,1124 # 800fac <error_string+0x23c>
  800b50:	f18ff0ef          	jal	ra,800268 <cprintf>
  800b54:	00a00413          	li	s0,10
  800b58:	fff40413          	addi	s0,s0,-1
  800b5c:	e80ff0ef          	jal	ra,8001dc <yield>
  800b60:	fe041ce3          	bnez	s0,800b58 <main+0x10c>
  800b64:	0000c537          	lui	a0,0xc
  800b68:	eaf50513          	addi	a0,a0,-337 # beaf <__panic-0x7f4171>
  800b6c:	e4cff0ef          	jal	ra,8001b8 <exit>
