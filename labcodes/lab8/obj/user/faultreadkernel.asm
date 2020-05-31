
obj/__user_faultreadkernel.out:     file format elf32-littleriscv


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
  800040:	a1850513          	addi	a0,a0,-1512 # 800a54 <main+0x34>
  800044:	00112e23          	sw	ra,28(sp)
  800048:	02d12623          	sw	a3,44(sp)
  80004c:	02e12823          	sw	a4,48(sp)
  800050:	03012c23          	sw	a6,56(sp)
  800054:	03112e23          	sw	a7,60(sp)
  800058:	00f12623          	sw	a5,12(sp)
  80005c:	1e0000ef          	jal	ra,80023c <cprintf>
  800060:	00c12583          	lw	a1,12(sp)
  800064:	00040513          	mv	a0,s0
  800068:	198000ef          	jal	ra,800200 <vcprintf>
  80006c:	00001517          	auipc	a0,0x1
  800070:	e4050513          	addi	a0,a0,-448 # 800eac <error_string+0x258>
  800074:	1c8000ef          	jal	ra,80023c <cprintf>
  800078:	ff600513          	li	a0,-10
  80007c:	11c000ef          	jal	ra,800198 <exit>

00800080 <__warn>:
  800080:	fc010113          	addi	sp,sp,-64
  800084:	00812c23          	sw	s0,24(sp)
  800088:	02f12a23          	sw	a5,52(sp)
  80008c:	00060413          	mv	s0,a2
  800090:	02c10793          	addi	a5,sp,44
  800094:	00058613          	mv	a2,a1
  800098:	00050593          	mv	a1,a0
  80009c:	00001517          	auipc	a0,0x1
  8000a0:	9d450513          	addi	a0,a0,-1580 # 800a70 <main+0x50>
  8000a4:	00112e23          	sw	ra,28(sp)
  8000a8:	02d12623          	sw	a3,44(sp)
  8000ac:	02e12823          	sw	a4,48(sp)
  8000b0:	03012c23          	sw	a6,56(sp)
  8000b4:	03112e23          	sw	a7,60(sp)
  8000b8:	00f12623          	sw	a5,12(sp)
  8000bc:	180000ef          	jal	ra,80023c <cprintf>
  8000c0:	00c12583          	lw	a1,12(sp)
  8000c4:	00040513          	mv	a0,s0
  8000c8:	138000ef          	jal	ra,800200 <vcprintf>
  8000cc:	00001517          	auipc	a0,0x1
  8000d0:	de050513          	addi	a0,a0,-544 # 800eac <error_string+0x258>
  8000d4:	168000ef          	jal	ra,80023c <cprintf>
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

00800160 <sys_putc>:
  800160:	00050593          	mv	a1,a0
  800164:	01e00513          	li	a0,30
  800168:	f81ff06f          	j	8000e8 <syscall>

0080016c <sys_open>:
  80016c:	00058613          	mv	a2,a1
  800170:	00050593          	mv	a1,a0
  800174:	06400513          	li	a0,100
  800178:	f71ff06f          	j	8000e8 <syscall>

0080017c <sys_close>:
  80017c:	00050593          	mv	a1,a0
  800180:	06500513          	li	a0,101
  800184:	f65ff06f          	j	8000e8 <syscall>

00800188 <sys_dup>:
  800188:	00058613          	mv	a2,a1
  80018c:	00050593          	mv	a1,a0
  800190:	08200513          	li	a0,130
  800194:	f55ff06f          	j	8000e8 <syscall>

00800198 <exit>:
  800198:	ff010113          	addi	sp,sp,-16
  80019c:	00112623          	sw	ra,12(sp)
  8001a0:	fb5ff0ef          	jal	ra,800154 <sys_exit>
  8001a4:	00001517          	auipc	a0,0x1
  8001a8:	8e850513          	addi	a0,a0,-1816 # 800a8c <main+0x6c>
  8001ac:	090000ef          	jal	ra,80023c <cprintf>
  8001b0:	0000006f          	j	8001b0 <exit+0x18>

008001b4 <_start>:
  8001b4:	00012503          	lw	a0,0(sp)
  8001b8:	00410593          	addi	a1,sp,4
  8001bc:	14c000ef          	jal	ra,800308 <umain>
  8001c0:	0000006f          	j	8001c0 <_start+0xc>

008001c4 <open>:
  8001c4:	fa9ff06f          	j	80016c <sys_open>

008001c8 <close>:
  8001c8:	fb5ff06f          	j	80017c <sys_close>

008001cc <dup2>:
  8001cc:	fbdff06f          	j	800188 <sys_dup>

008001d0 <cputch>:
  8001d0:	ff010113          	addi	sp,sp,-16
  8001d4:	00112623          	sw	ra,12(sp)
  8001d8:	00812423          	sw	s0,8(sp)
  8001dc:	00058413          	mv	s0,a1
  8001e0:	f81ff0ef          	jal	ra,800160 <sys_putc>
  8001e4:	00042783          	lw	a5,0(s0)
  8001e8:	00c12083          	lw	ra,12(sp)
  8001ec:	00178793          	addi	a5,a5,1
  8001f0:	00f42023          	sw	a5,0(s0)
  8001f4:	00812403          	lw	s0,8(sp)
  8001f8:	01010113          	addi	sp,sp,16
  8001fc:	00008067          	ret

00800200 <vcprintf>:
  800200:	fe010113          	addi	sp,sp,-32
  800204:	00058713          	mv	a4,a1
  800208:	ffff75b7          	lui	a1,0xffff7
  80020c:	00050693          	mv	a3,a0
  800210:	00c10613          	addi	a2,sp,12
  800214:	00000517          	auipc	a0,0x0
  800218:	fbc50513          	addi	a0,a0,-68 # 8001d0 <cputch>
  80021c:	ad958593          	addi	a1,a1,-1319 # ffff6ad9 <sbi_remote_fence_i+0xffff71e9>
  800220:	00112e23          	sw	ra,28(sp)
  800224:	00012623          	sw	zero,12(sp)
  800228:	278000ef          	jal	ra,8004a0 <vprintfmt>
  80022c:	01c12083          	lw	ra,28(sp)
  800230:	00c12503          	lw	a0,12(sp)
  800234:	02010113          	addi	sp,sp,32
  800238:	00008067          	ret

0080023c <cprintf>:
  80023c:	fc010113          	addi	sp,sp,-64
  800240:	02410313          	addi	t1,sp,36
  800244:	02b12223          	sw	a1,36(sp)
  800248:	ffff75b7          	lui	a1,0xffff7
  80024c:	02c12423          	sw	a2,40(sp)
  800250:	02d12623          	sw	a3,44(sp)
  800254:	02e12823          	sw	a4,48(sp)
  800258:	00050693          	mv	a3,a0
  80025c:	00c10613          	addi	a2,sp,12
  800260:	00000517          	auipc	a0,0x0
  800264:	f7050513          	addi	a0,a0,-144 # 8001d0 <cputch>
  800268:	00030713          	mv	a4,t1
  80026c:	ad958593          	addi	a1,a1,-1319 # ffff6ad9 <sbi_remote_fence_i+0xffff71e9>
  800270:	00112e23          	sw	ra,28(sp)
  800274:	02f12a23          	sw	a5,52(sp)
  800278:	03012c23          	sw	a6,56(sp)
  80027c:	03112e23          	sw	a7,60(sp)
  800280:	00612423          	sw	t1,8(sp)
  800284:	00012623          	sw	zero,12(sp)
  800288:	218000ef          	jal	ra,8004a0 <vprintfmt>
  80028c:	01c12083          	lw	ra,28(sp)
  800290:	00c12503          	lw	a0,12(sp)
  800294:	04010113          	addi	sp,sp,64
  800298:	00008067          	ret

0080029c <initfd>:
  80029c:	ff010113          	addi	sp,sp,-16
  8002a0:	00058793          	mv	a5,a1
  8002a4:	00912223          	sw	s1,4(sp)
  8002a8:	00060593          	mv	a1,a2
  8002ac:	00050493          	mv	s1,a0
  8002b0:	00078513          	mv	a0,a5
  8002b4:	00812423          	sw	s0,8(sp)
  8002b8:	00112623          	sw	ra,12(sp)
  8002bc:	f09ff0ef          	jal	ra,8001c4 <open>
  8002c0:	00050413          	mv	s0,a0
  8002c4:	02054663          	bltz	a0,8002f0 <initfd+0x54>
  8002c8:	02950463          	beq	a0,s1,8002f0 <initfd+0x54>
  8002cc:	00048513          	mv	a0,s1
  8002d0:	ef9ff0ef          	jal	ra,8001c8 <close>
  8002d4:	00048593          	mv	a1,s1
  8002d8:	00040513          	mv	a0,s0
  8002dc:	ef1ff0ef          	jal	ra,8001cc <dup2>
  8002e0:	00050493          	mv	s1,a0
  8002e4:	00040513          	mv	a0,s0
  8002e8:	ee1ff0ef          	jal	ra,8001c8 <close>
  8002ec:	00048413          	mv	s0,s1
  8002f0:	00c12083          	lw	ra,12(sp)
  8002f4:	00040513          	mv	a0,s0
  8002f8:	00412483          	lw	s1,4(sp)
  8002fc:	00812403          	lw	s0,8(sp)
  800300:	01010113          	addi	sp,sp,16
  800304:	00008067          	ret

00800308 <umain>:
  800308:	ff010113          	addi	sp,sp,-16
  80030c:	00812423          	sw	s0,8(sp)
  800310:	00912223          	sw	s1,4(sp)
  800314:	00050413          	mv	s0,a0
  800318:	00058493          	mv	s1,a1
  80031c:	00000613          	li	a2,0
  800320:	00000597          	auipc	a1,0x0
  800324:	78058593          	addi	a1,a1,1920 # 800aa0 <main+0x80>
  800328:	00000513          	li	a0,0
  80032c:	00112623          	sw	ra,12(sp)
  800330:	f6dff0ef          	jal	ra,80029c <initfd>
  800334:	02054663          	bltz	a0,800360 <umain+0x58>
  800338:	00100613          	li	a2,1
  80033c:	00000597          	auipc	a1,0x0
  800340:	79c58593          	addi	a1,a1,1948 # 800ad8 <main+0xb8>
  800344:	00060513          	mv	a0,a2
  800348:	f55ff0ef          	jal	ra,80029c <initfd>
  80034c:	02054a63          	bltz	a0,800380 <umain+0x78>
  800350:	00048593          	mv	a1,s1
  800354:	00040513          	mv	a0,s0
  800358:	6c8000ef          	jal	ra,800a20 <main>
  80035c:	e3dff0ef          	jal	ra,800198 <exit>
  800360:	00050693          	mv	a3,a0
  800364:	00000617          	auipc	a2,0x0
  800368:	74460613          	addi	a2,a2,1860 # 800aa8 <main+0x88>
  80036c:	01a00593          	li	a1,26
  800370:	00000517          	auipc	a0,0x0
  800374:	75450513          	addi	a0,a0,1876 # 800ac4 <main+0xa4>
  800378:	d09ff0ef          	jal	ra,800080 <__warn>
  80037c:	fbdff06f          	j	800338 <umain+0x30>
  800380:	00050693          	mv	a3,a0
  800384:	00000617          	auipc	a2,0x0
  800388:	75c60613          	addi	a2,a2,1884 # 800ae0 <main+0xc0>
  80038c:	01d00593          	li	a1,29
  800390:	00000517          	auipc	a0,0x0
  800394:	73450513          	addi	a0,a0,1844 # 800ac4 <main+0xa4>
  800398:	ce9ff0ef          	jal	ra,800080 <__warn>
  80039c:	fb5ff06f          	j	800350 <umain+0x48>

008003a0 <strnlen>:
  8003a0:	00050693          	mv	a3,a0
  8003a4:	02058a63          	beqz	a1,8003d8 <strnlen+0x38>
  8003a8:	00054703          	lbu	a4,0(a0)
  8003ac:	00150793          	addi	a5,a0,1
  8003b0:	02070463          	beqz	a4,8003d8 <strnlen+0x38>
  8003b4:	00b505b3          	add	a1,a0,a1
  8003b8:	0100006f          	j	8003c8 <strnlen+0x28>
  8003bc:	00178793          	addi	a5,a5,1
  8003c0:	fff7c703          	lbu	a4,-1(a5)
  8003c4:	00070863          	beqz	a4,8003d4 <strnlen+0x34>
  8003c8:	40d78533          	sub	a0,a5,a3
  8003cc:	feb798e3          	bne	a5,a1,8003bc <strnlen+0x1c>
  8003d0:	00008067          	ret
  8003d4:	00008067          	ret
  8003d8:	00000513          	li	a0,0
  8003dc:	00008067          	ret

008003e0 <printnum>:
  8003e0:	fd010113          	addi	sp,sp,-48
  8003e4:	02912223          	sw	s1,36(sp)
  8003e8:	03212023          	sw	s2,32(sp)
  8003ec:	01312e23          	sw	s3,28(sp)
  8003f0:	01412c23          	sw	s4,24(sp)
  8003f4:	01512a23          	sw	s5,20(sp)
  8003f8:	02112623          	sw	ra,44(sp)
  8003fc:	02812423          	sw	s0,40(sp)
  800400:	00050493          	mv	s1,a0
  800404:	00058993          	mv	s3,a1
  800408:	00060913          	mv	s2,a2
  80040c:	03012a03          	lw	s4,48(sp)
  800410:	03077ab3          	remu	s5,a4,a6
  800414:	06079463          	bnez	a5,80047c <printnum+0x9c>
  800418:	07077263          	bleu	a6,a4,80047c <printnum+0x9c>
  80041c:	fff88413          	addi	s0,a7,-1
  800420:	00805e63          	blez	s0,80043c <printnum+0x5c>
  800424:	fff40413          	addi	s0,s0,-1
  800428:	00098613          	mv	a2,s3
  80042c:	00090593          	mv	a1,s2
  800430:	000a0513          	mv	a0,s4
  800434:	000480e7          	jalr	s1
  800438:	fe0416e3          	bnez	s0,800424 <printnum+0x44>
  80043c:	00001797          	auipc	a5,0x1
  800440:	87c78793          	addi	a5,a5,-1924 # 800cb8 <error_string+0x64>
  800444:	015787b3          	add	a5,a5,s5
  800448:	00098613          	mv	a2,s3
  80044c:	00090593          	mv	a1,s2
  800450:	00048313          	mv	t1,s1
  800454:	02c12083          	lw	ra,44(sp)
  800458:	02812403          	lw	s0,40(sp)
  80045c:	02412483          	lw	s1,36(sp)
  800460:	02012903          	lw	s2,32(sp)
  800464:	01c12983          	lw	s3,28(sp)
  800468:	01812a03          	lw	s4,24(sp)
  80046c:	01412a83          	lw	s5,20(sp)
  800470:	0007c503          	lbu	a0,0(a5)
  800474:	03010113          	addi	sp,sp,48
  800478:	00030067          	jr	t1
  80047c:	03075733          	divu	a4,a4,a6
  800480:	01412023          	sw	s4,0(sp)
  800484:	fff88893          	addi	a7,a7,-1
  800488:	00000793          	li	a5,0
  80048c:	00090613          	mv	a2,s2
  800490:	00098593          	mv	a1,s3
  800494:	00048513          	mv	a0,s1
  800498:	f49ff0ef          	jal	ra,8003e0 <printnum>
  80049c:	fa1ff06f          	j	80043c <printnum+0x5c>

008004a0 <vprintfmt>:
  8004a0:	fa010113          	addi	sp,sp,-96
  8004a4:	05212823          	sw	s2,80(sp)
  8004a8:	05312623          	sw	s3,76(sp)
  8004ac:	05412423          	sw	s4,72(sp)
  8004b0:	05512223          	sw	s5,68(sp)
  8004b4:	05612023          	sw	s6,64(sp)
  8004b8:	03712e23          	sw	s7,60(sp)
  8004bc:	03812c23          	sw	s8,56(sp)
  8004c0:	03a12823          	sw	s10,48(sp)
  8004c4:	04112e23          	sw	ra,92(sp)
  8004c8:	04812c23          	sw	s0,88(sp)
  8004cc:	04912a23          	sw	s1,84(sp)
  8004d0:	03912a23          	sw	s9,52(sp)
  8004d4:	03b12623          	sw	s11,44(sp)
  8004d8:	00050a13          	mv	s4,a0
  8004dc:	00058993          	mv	s3,a1
  8004e0:	00060913          	mv	s2,a2
  8004e4:	00068d13          	mv	s10,a3
  8004e8:	00070b13          	mv	s6,a4
  8004ec:	00000a97          	auipc	s5,0x0
  8004f0:	610a8a93          	addi	s5,s5,1552 # 800afc <main+0xdc>
  8004f4:	fff00b93          	li	s7,-1
  8004f8:	05e00c13          	li	s8,94
  8004fc:	000d4503          	lbu	a0,0(s10)
  800500:	02500493          	li	s1,37
  800504:	001d0413          	addi	s0,s10,1
  800508:	02950063          	beq	a0,s1,800528 <vprintfmt+0x88>
  80050c:	06050663          	beqz	a0,800578 <vprintfmt+0xd8>
  800510:	00098613          	mv	a2,s3
  800514:	00090593          	mv	a1,s2
  800518:	00140413          	addi	s0,s0,1
  80051c:	000a00e7          	jalr	s4
  800520:	fff44503          	lbu	a0,-1(s0)
  800524:	fe9514e3          	bne	a0,s1,80050c <vprintfmt+0x6c>
  800528:	00044e03          	lbu	t3,0(s0)
  80052c:	fff00d93          	li	s11,-1
  800530:	02000693          	li	a3,32
  800534:	00000493          	li	s1,0
  800538:	00000593          	li	a1,0
  80053c:	000d8c93          	mv	s9,s11
  800540:	05500713          	li	a4,85
  800544:	00100313          	li	t1,1
  800548:	03000813          	li	a6,48
  80054c:	00900613          	li	a2,9
  800550:	02d00513          	li	a0,45
  800554:	fdde0793          	addi	a5,t3,-35
  800558:	0ff7f793          	andi	a5,a5,255
  80055c:	00140d13          	addi	s10,s0,1
  800560:	34f76a63          	bltu	a4,a5,8008b4 <vprintfmt+0x414>
  800564:	00279793          	slli	a5,a5,0x2
  800568:	015787b3          	add	a5,a5,s5
  80056c:	0007a783          	lw	a5,0(a5)
  800570:	015787b3          	add	a5,a5,s5
  800574:	00078067          	jr	a5
  800578:	05c12083          	lw	ra,92(sp)
  80057c:	05812403          	lw	s0,88(sp)
  800580:	05412483          	lw	s1,84(sp)
  800584:	05012903          	lw	s2,80(sp)
  800588:	04c12983          	lw	s3,76(sp)
  80058c:	04812a03          	lw	s4,72(sp)
  800590:	04412a83          	lw	s5,68(sp)
  800594:	04012b03          	lw	s6,64(sp)
  800598:	03c12b83          	lw	s7,60(sp)
  80059c:	03812c03          	lw	s8,56(sp)
  8005a0:	03412c83          	lw	s9,52(sp)
  8005a4:	03012d03          	lw	s10,48(sp)
  8005a8:	02c12d83          	lw	s11,44(sp)
  8005ac:	06010113          	addi	sp,sp,96
  8005b0:	00008067          	ret
  8005b4:	00100793          	li	a5,1
  8005b8:	36b7c863          	blt	a5,a1,800928 <vprintfmt+0x488>
  8005bc:	000b2703          	lw	a4,0(s6)
  8005c0:	00000793          	li	a5,0
  8005c4:	004b0b13          	addi	s6,s6,4
  8005c8:	01000813          	li	a6,16
  8005cc:	00d12023          	sw	a3,0(sp)
  8005d0:	000c8893          	mv	a7,s9
  8005d4:	00090613          	mv	a2,s2
  8005d8:	00098593          	mv	a1,s3
  8005dc:	000a0513          	mv	a0,s4
  8005e0:	e01ff0ef          	jal	ra,8003e0 <printnum>
  8005e4:	f19ff06f          	j	8004fc <vprintfmt+0x5c>
  8005e8:	00144e03          	lbu	t3,1(s0)
  8005ec:	00030493          	mv	s1,t1
  8005f0:	000d0413          	mv	s0,s10
  8005f4:	f61ff06f          	j	800554 <vprintfmt+0xb4>
  8005f8:	000b2503          	lw	a0,0(s6)
  8005fc:	00098613          	mv	a2,s3
  800600:	00090593          	mv	a1,s2
  800604:	004b0b13          	addi	s6,s6,4
  800608:	000a00e7          	jalr	s4
  80060c:	ef1ff06f          	j	8004fc <vprintfmt+0x5c>
  800610:	00100793          	li	a5,1
  800614:	32b7c863          	blt	a5,a1,800944 <vprintfmt+0x4a4>
  800618:	000b2703          	lw	a4,0(s6)
  80061c:	004b0b13          	addi	s6,s6,4
  800620:	41f75793          	srai	a5,a4,0x1f
  800624:	00a00813          	li	a6,10
  800628:	fa07d2e3          	bgez	a5,8005cc <vprintfmt+0x12c>
  80062c:	00098613          	mv	a2,s3
  800630:	00090593          	mv	a1,s2
  800634:	02d00513          	li	a0,45
  800638:	00f12e23          	sw	a5,28(sp)
  80063c:	00e12c23          	sw	a4,24(sp)
  800640:	01012a23          	sw	a6,20(sp)
  800644:	00d12823          	sw	a3,16(sp)
  800648:	000a00e7          	jalr	s4
  80064c:	01812703          	lw	a4,24(sp)
  800650:	01c12783          	lw	a5,28(sp)
  800654:	01012683          	lw	a3,16(sp)
  800658:	40e00733          	neg	a4,a4
  80065c:	00e03633          	snez	a2,a4
  800660:	40f007b3          	neg	a5,a5
  800664:	40c787b3          	sub	a5,a5,a2
  800668:	01412803          	lw	a6,20(sp)
  80066c:	f61ff06f          	j	8005cc <vprintfmt+0x12c>
  800670:	000b2783          	lw	a5,0(s6)
  800674:	01800693          	li	a3,24
  800678:	004b0b13          	addi	s6,s6,4
  80067c:	41f7d713          	srai	a4,a5,0x1f
  800680:	00f747b3          	xor	a5,a4,a5
  800684:	40e787b3          	sub	a5,a5,a4
  800688:	2cf6ca63          	blt	a3,a5,80095c <vprintfmt+0x4bc>
  80068c:	00279693          	slli	a3,a5,0x2
  800690:	00000717          	auipc	a4,0x0
  800694:	5c470713          	addi	a4,a4,1476 # 800c54 <error_string>
  800698:	00d70733          	add	a4,a4,a3
  80069c:	00072703          	lw	a4,0(a4)
  8006a0:	2a070e63          	beqz	a4,80095c <vprintfmt+0x4bc>
  8006a4:	00000697          	auipc	a3,0x0
  8006a8:	7e868693          	addi	a3,a3,2024 # 800e8c <error_string+0x238>
  8006ac:	00090613          	mv	a2,s2
  8006b0:	00098593          	mv	a1,s3
  8006b4:	000a0513          	mv	a0,s4
  8006b8:	334000ef          	jal	ra,8009ec <printfmt>
  8006bc:	e41ff06f          	j	8004fc <vprintfmt+0x5c>
  8006c0:	00144e03          	lbu	t3,1(s0)
  8006c4:	00158593          	addi	a1,a1,1
  8006c8:	000d0413          	mv	s0,s10
  8006cc:	e89ff06f          	j	800554 <vprintfmt+0xb4>
  8006d0:	00100793          	li	a5,1
  8006d4:	20b7ce63          	blt	a5,a1,8008f0 <vprintfmt+0x450>
  8006d8:	000b2703          	lw	a4,0(s6)
  8006dc:	00000793          	li	a5,0
  8006e0:	004b0b13          	addi	s6,s6,4
  8006e4:	00800813          	li	a6,8
  8006e8:	ee5ff06f          	j	8005cc <vprintfmt+0x12c>
  8006ec:	03000513          	li	a0,48
  8006f0:	00098613          	mv	a2,s3
  8006f4:	00090593          	mv	a1,s2
  8006f8:	00d12823          	sw	a3,16(sp)
  8006fc:	000a00e7          	jalr	s4
  800700:	00098613          	mv	a2,s3
  800704:	00090593          	mv	a1,s2
  800708:	07800513          	li	a0,120
  80070c:	000a00e7          	jalr	s4
  800710:	000b2703          	lw	a4,0(s6)
  800714:	00000793          	li	a5,0
  800718:	01000813          	li	a6,16
  80071c:	004b0b13          	addi	s6,s6,4
  800720:	01012683          	lw	a3,16(sp)
  800724:	ea9ff06f          	j	8005cc <vprintfmt+0x12c>
  800728:	000b2403          	lw	s0,0(s6)
  80072c:	004b0793          	addi	a5,s6,4
  800730:	00f12a23          	sw	a5,20(sp)
  800734:	26040463          	beqz	s0,80099c <vprintfmt+0x4fc>
  800738:	05905463          	blez	s9,800780 <vprintfmt+0x2e0>
  80073c:	02d00793          	li	a5,45
  800740:	22f68e63          	beq	a3,a5,80097c <vprintfmt+0x4dc>
  800744:	000d8593          	mv	a1,s11
  800748:	00040513          	mv	a0,s0
  80074c:	00d12823          	sw	a3,16(sp)
  800750:	c51ff0ef          	jal	ra,8003a0 <strnlen>
  800754:	40ac8cb3          	sub	s9,s9,a0
  800758:	03905463          	blez	s9,800780 <vprintfmt+0x2e0>
  80075c:	01012683          	lw	a3,16(sp)
  800760:	00068513          	mv	a0,a3
  800764:	00098613          	mv	a2,s3
  800768:	00090593          	mv	a1,s2
  80076c:	00d12823          	sw	a3,16(sp)
  800770:	fffc8c93          	addi	s9,s9,-1
  800774:	000a00e7          	jalr	s4
  800778:	01012683          	lw	a3,16(sp)
  80077c:	fe0c92e3          	bnez	s9,800760 <vprintfmt+0x2c0>
  800780:	00044783          	lbu	a5,0(s0)
  800784:	00140b13          	addi	s6,s0,1
  800788:	00078513          	mv	a0,a5
  80078c:	06078063          	beqz	a5,8007ec <vprintfmt+0x34c>
  800790:	03f00413          	li	s0,63
  800794:	000dc663          	bltz	s11,8007a0 <vprintfmt+0x300>
  800798:	fffd8d93          	addi	s11,s11,-1
  80079c:	037d8863          	beq	s11,s7,8007cc <vprintfmt+0x32c>
  8007a0:	00098613          	mv	a2,s3
  8007a4:	00090593          	mv	a1,s2
  8007a8:	00048663          	beqz	s1,8007b4 <vprintfmt+0x314>
  8007ac:	fe078793          	addi	a5,a5,-32
  8007b0:	12fc6a63          	bltu	s8,a5,8008e4 <vprintfmt+0x444>
  8007b4:	000a00e7          	jalr	s4
  8007b8:	001b0b13          	addi	s6,s6,1
  8007bc:	fffb4783          	lbu	a5,-1(s6)
  8007c0:	fffc8c93          	addi	s9,s9,-1
  8007c4:	00078513          	mv	a0,a5
  8007c8:	fc0796e3          	bnez	a5,800794 <vprintfmt+0x2f4>
  8007cc:	03905063          	blez	s9,8007ec <vprintfmt+0x34c>
  8007d0:	02000413          	li	s0,32
  8007d4:	fffc8c93          	addi	s9,s9,-1
  8007d8:	00098613          	mv	a2,s3
  8007dc:	00090593          	mv	a1,s2
  8007e0:	00040513          	mv	a0,s0
  8007e4:	000a00e7          	jalr	s4
  8007e8:	fe0c96e3          	bnez	s9,8007d4 <vprintfmt+0x334>
  8007ec:	01412b03          	lw	s6,20(sp)
  8007f0:	d0dff06f          	j	8004fc <vprintfmt+0x5c>
  8007f4:	00100793          	li	a5,1
  8007f8:	10b7ca63          	blt	a5,a1,80090c <vprintfmt+0x46c>
  8007fc:	000b2703          	lw	a4,0(s6)
  800800:	00000793          	li	a5,0
  800804:	004b0b13          	addi	s6,s6,4
  800808:	00a00813          	li	a6,10
  80080c:	dc1ff06f          	j	8005cc <vprintfmt+0x12c>
  800810:	00144e03          	lbu	t3,1(s0)
  800814:	00050693          	mv	a3,a0
  800818:	000d0413          	mv	s0,s10
  80081c:	d39ff06f          	j	800554 <vprintfmt+0xb4>
  800820:	00098613          	mv	a2,s3
  800824:	00090593          	mv	a1,s2
  800828:	02500513          	li	a0,37
  80082c:	000a00e7          	jalr	s4
  800830:	ccdff06f          	j	8004fc <vprintfmt+0x5c>
  800834:	000b2d83          	lw	s11,0(s6)
  800838:	00144e03          	lbu	t3,1(s0)
  80083c:	004b0b13          	addi	s6,s6,4
  800840:	000d0413          	mv	s0,s10
  800844:	d00cd8e3          	bgez	s9,800554 <vprintfmt+0xb4>
  800848:	000d8c93          	mv	s9,s11
  80084c:	fff00d93          	li	s11,-1
  800850:	d05ff06f          	j	800554 <vprintfmt+0xb4>
  800854:	00144e03          	lbu	t3,1(s0)
  800858:	00080693          	mv	a3,a6
  80085c:	000d0413          	mv	s0,s10
  800860:	cf5ff06f          	j	800554 <vprintfmt+0xb4>
  800864:	00144e83          	lbu	t4,1(s0)
  800868:	fd0e0d93          	addi	s11,t3,-48
  80086c:	fd0e8793          	addi	a5,t4,-48
  800870:	14f66c63          	bltu	a2,a5,8009c8 <vprintfmt+0x528>
  800874:	000d0413          	mv	s0,s10
  800878:	002d9793          	slli	a5,s11,0x2
  80087c:	01b78db3          	add	s11,a5,s11
  800880:	00140413          	addi	s0,s0,1
  800884:	001d9d93          	slli	s11,s11,0x1
  800888:	01dd8db3          	add	s11,s11,t4
  80088c:	00044e83          	lbu	t4,0(s0)
  800890:	fd0d8d93          	addi	s11,s11,-48
  800894:	fd0e8793          	addi	a5,t4,-48
  800898:	fef670e3          	bleu	a5,a2,800878 <vprintfmt+0x3d8>
  80089c:	000e8e13          	mv	t3,t4
  8008a0:	fa5ff06f          	j	800844 <vprintfmt+0x3a4>
  8008a4:	0e0cc863          	bltz	s9,800994 <vprintfmt+0x4f4>
  8008a8:	00144e03          	lbu	t3,1(s0)
  8008ac:	000d0413          	mv	s0,s10
  8008b0:	ca5ff06f          	j	800554 <vprintfmt+0xb4>
  8008b4:	00098613          	mv	a2,s3
  8008b8:	00090593          	mv	a1,s2
  8008bc:	02500513          	li	a0,37
  8008c0:	000a00e7          	jalr	s4
  8008c4:	fff44783          	lbu	a5,-1(s0)
  8008c8:	02500713          	li	a4,37
  8008cc:	00040d13          	mv	s10,s0
  8008d0:	c2e786e3          	beq	a5,a4,8004fc <vprintfmt+0x5c>
  8008d4:	fffd0d13          	addi	s10,s10,-1
  8008d8:	fffd4783          	lbu	a5,-1(s10)
  8008dc:	fee79ce3          	bne	a5,a4,8008d4 <vprintfmt+0x434>
  8008e0:	c1dff06f          	j	8004fc <vprintfmt+0x5c>
  8008e4:	00040513          	mv	a0,s0
  8008e8:	000a00e7          	jalr	s4
  8008ec:	ecdff06f          	j	8007b8 <vprintfmt+0x318>
  8008f0:	007b0793          	addi	a5,s6,7
  8008f4:	ff87f793          	andi	a5,a5,-8
  8008f8:	00878b13          	addi	s6,a5,8
  8008fc:	0007a703          	lw	a4,0(a5)
  800900:	00800813          	li	a6,8
  800904:	0047a783          	lw	a5,4(a5)
  800908:	cc5ff06f          	j	8005cc <vprintfmt+0x12c>
  80090c:	007b0793          	addi	a5,s6,7
  800910:	ff87f793          	andi	a5,a5,-8
  800914:	00878b13          	addi	s6,a5,8
  800918:	0007a703          	lw	a4,0(a5)
  80091c:	00a00813          	li	a6,10
  800920:	0047a783          	lw	a5,4(a5)
  800924:	ca9ff06f          	j	8005cc <vprintfmt+0x12c>
  800928:	007b0793          	addi	a5,s6,7
  80092c:	ff87f793          	andi	a5,a5,-8
  800930:	00878b13          	addi	s6,a5,8
  800934:	0007a703          	lw	a4,0(a5)
  800938:	01000813          	li	a6,16
  80093c:	0047a783          	lw	a5,4(a5)
  800940:	c8dff06f          	j	8005cc <vprintfmt+0x12c>
  800944:	007b0793          	addi	a5,s6,7
  800948:	ff87f793          	andi	a5,a5,-8
  80094c:	00878b13          	addi	s6,a5,8
  800950:	0007a703          	lw	a4,0(a5)
  800954:	0047a783          	lw	a5,4(a5)
  800958:	ccdff06f          	j	800624 <vprintfmt+0x184>
  80095c:	00078713          	mv	a4,a5
  800960:	00000697          	auipc	a3,0x0
  800964:	52068693          	addi	a3,a3,1312 # 800e80 <error_string+0x22c>
  800968:	00090613          	mv	a2,s2
  80096c:	00098593          	mv	a1,s3
  800970:	000a0513          	mv	a0,s4
  800974:	078000ef          	jal	ra,8009ec <printfmt>
  800978:	b85ff06f          	j	8004fc <vprintfmt+0x5c>
  80097c:	00044783          	lbu	a5,0(s0)
  800980:	00140b13          	addi	s6,s0,1
  800984:	00078513          	mv	a0,a5
  800988:	e40784e3          	beqz	a5,8007d0 <vprintfmt+0x330>
  80098c:	03f00413          	li	s0,63
  800990:	e05ff06f          	j	800794 <vprintfmt+0x2f4>
  800994:	00000c93          	li	s9,0
  800998:	f11ff06f          	j	8008a8 <vprintfmt+0x408>
  80099c:	03905c63          	blez	s9,8009d4 <vprintfmt+0x534>
  8009a0:	02d00793          	li	a5,45
  8009a4:	00000417          	auipc	s0,0x0
  8009a8:	4d440413          	addi	s0,s0,1236 # 800e78 <error_string+0x224>
  8009ac:	d8f69ce3          	bne	a3,a5,800744 <vprintfmt+0x2a4>
  8009b0:	02800513          	li	a0,40
  8009b4:	00000b17          	auipc	s6,0x0
  8009b8:	4c5b0b13          	addi	s6,s6,1221 # 800e79 <error_string+0x225>
  8009bc:	00050793          	mv	a5,a0
  8009c0:	03f00413          	li	s0,63
  8009c4:	dd1ff06f          	j	800794 <vprintfmt+0x2f4>
  8009c8:	000e8e13          	mv	t3,t4
  8009cc:	000d0413          	mv	s0,s10
  8009d0:	e75ff06f          	j	800844 <vprintfmt+0x3a4>
  8009d4:	02800793          	li	a5,40
  8009d8:	00078513          	mv	a0,a5
  8009dc:	00000b17          	auipc	s6,0x0
  8009e0:	49db0b13          	addi	s6,s6,1181 # 800e79 <error_string+0x225>
  8009e4:	03f00413          	li	s0,63
  8009e8:	dadff06f          	j	800794 <vprintfmt+0x2f4>

008009ec <printfmt>:
  8009ec:	fd010113          	addi	sp,sp,-48
  8009f0:	02010313          	addi	t1,sp,32
  8009f4:	02e12023          	sw	a4,32(sp)
  8009f8:	00030713          	mv	a4,t1
  8009fc:	00112e23          	sw	ra,28(sp)
  800a00:	02f12223          	sw	a5,36(sp)
  800a04:	03012423          	sw	a6,40(sp)
  800a08:	03112623          	sw	a7,44(sp)
  800a0c:	00612623          	sw	t1,12(sp)
  800a10:	a91ff0ef          	jal	ra,8004a0 <vprintfmt>
  800a14:	01c12083          	lw	ra,28(sp)
  800a18:	03010113          	addi	sp,sp,48
  800a1c:	00008067          	ret

00800a20 <main>:
  800a20:	fac007b7          	lui	a5,0xfac00
  800a24:	0007a583          	lw	a1,0(a5) # fac00000 <sbi_remote_fence_i+0xfac00710>
  800a28:	ff010113          	addi	sp,sp,-16
  800a2c:	00000517          	auipc	a0,0x0
  800a30:	46450513          	addi	a0,a0,1124 # 800e90 <error_string+0x23c>
  800a34:	00112623          	sw	ra,12(sp)
  800a38:	805ff0ef          	jal	ra,80023c <cprintf>
  800a3c:	00000617          	auipc	a2,0x0
  800a40:	47460613          	addi	a2,a2,1140 # 800eb0 <error_string+0x25c>
  800a44:	00700593          	li	a1,7
  800a48:	00000517          	auipc	a0,0x0
  800a4c:	47450513          	addi	a0,a0,1140 # 800ebc <error_string+0x268>
  800a50:	dd0ff0ef          	jal	ra,800020 <__panic>
