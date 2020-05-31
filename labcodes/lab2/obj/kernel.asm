
bin/kernel:     file format elf32-littleriscv


Disassembly of section .text:

c0000000 <kern_entry>:
c0000000:	00007117          	auipc	sp,0x7
c0000004:	00010113          	mv	sp,sp
c0000008:	0040006f          	j	c000000c <kern_init>

c000000c <kern_init>:
c000000c:	00007517          	auipc	a0,0x7
c0000010:	ff850513          	addi	a0,a0,-8 # c0007004 <edata>
c0000014:	00007617          	auipc	a2,0x7
c0000018:	43060613          	addi	a2,a2,1072 # c0007444 <end>
c000001c:	ff010113          	addi	sp,sp,-16 # c0006ff0 <bootstack+0x1ff0>
c0000020:	40a60633          	sub	a2,a2,a0
c0000024:	00000593          	li	a1,0
c0000028:	00112623          	sw	ra,12(sp)
c000002c:	0b8030ef          	jal	ra,c00030e4 <memset>
c0000030:	654000ef          	jal	ra,c0000684 <cons_init>
c0000034:	00003597          	auipc	a1,0x3
c0000038:	6c058593          	addi	a1,a1,1728 # c00036f4 <etext>
c000003c:	00003517          	auipc	a0,0x3
c0000040:	6d450513          	addi	a0,a0,1748 # c0003710 <etext+0x1c>
c0000044:	088000ef          	jal	ra,c00000cc <cprintf>
c0000048:	280000ef          	jal	ra,c00002c8 <print_kerninfo>
c000004c:	664000ef          	jal	ra,c00006b0 <idt_init>
c0000050:	4f8010ef          	jal	ra,c0001548 <pmm_init>
c0000054:	648000ef          	jal	ra,c000069c <pic_init>
c0000058:	658000ef          	jal	ra,c00006b0 <idt_init>
c000005c:	5e0000ef          	jal	ra,c000063c <clock_init>
c0000060:	640000ef          	jal	ra,c00006a0 <intr_enable>
c0000064:	0000006f          	j	c0000064 <kern_init+0x58>

c0000068 <cputch>:
c0000068:	ff010113          	addi	sp,sp,-16
c000006c:	00112623          	sw	ra,12(sp)
c0000070:	00812423          	sw	s0,8(sp)
c0000074:	00058413          	mv	s0,a1
c0000078:	610000ef          	jal	ra,c0000688 <cons_putc>
c000007c:	00042783          	lw	a5,0(s0)
c0000080:	00c12083          	lw	ra,12(sp)
c0000084:	00178793          	addi	a5,a5,1
c0000088:	00f42023          	sw	a5,0(s0)
c000008c:	00812403          	lw	s0,8(sp)
c0000090:	01010113          	addi	sp,sp,16
c0000094:	00008067          	ret

c0000098 <vcprintf>:
c0000098:	fe010113          	addi	sp,sp,-32
c000009c:	00058693          	mv	a3,a1
c00000a0:	00050613          	mv	a2,a0
c00000a4:	00c10593          	addi	a1,sp,12
c00000a8:	00000517          	auipc	a0,0x0
c00000ac:	fc050513          	addi	a0,a0,-64 # c0000068 <cputch>
c00000b0:	00112e23          	sw	ra,28(sp)
c00000b4:	00012623          	sw	zero,12(sp)
c00000b8:	0f0030ef          	jal	ra,c00031a8 <vprintfmt>
c00000bc:	01c12083          	lw	ra,28(sp)
c00000c0:	00c12503          	lw	a0,12(sp)
c00000c4:	02010113          	addi	sp,sp,32
c00000c8:	00008067          	ret

c00000cc <cprintf>:
c00000cc:	fc010113          	addi	sp,sp,-64
c00000d0:	02410313          	addi	t1,sp,36
c00000d4:	02b12223          	sw	a1,36(sp)
c00000d8:	02c12423          	sw	a2,40(sp)
c00000dc:	02d12623          	sw	a3,44(sp)
c00000e0:	00050613          	mv	a2,a0
c00000e4:	00c10593          	addi	a1,sp,12
c00000e8:	00000517          	auipc	a0,0x0
c00000ec:	f8050513          	addi	a0,a0,-128 # c0000068 <cputch>
c00000f0:	00030693          	mv	a3,t1
c00000f4:	00112e23          	sw	ra,28(sp)
c00000f8:	02e12823          	sw	a4,48(sp)
c00000fc:	02f12a23          	sw	a5,52(sp)
c0000100:	03012c23          	sw	a6,56(sp)
c0000104:	03112e23          	sw	a7,60(sp)
c0000108:	00612423          	sw	t1,8(sp)
c000010c:	00012623          	sw	zero,12(sp)
c0000110:	098030ef          	jal	ra,c00031a8 <vprintfmt>
c0000114:	01c12083          	lw	ra,28(sp)
c0000118:	00c12503          	lw	a0,12(sp)
c000011c:	04010113          	addi	sp,sp,64
c0000120:	00008067          	ret

c0000124 <cputchar>:
c0000124:	5640006f          	j	c0000688 <cons_putc>

c0000128 <getchar>:
c0000128:	ff010113          	addi	sp,sp,-16
c000012c:	00112623          	sw	ra,12(sp)
c0000130:	564000ef          	jal	ra,c0000694 <cons_getc>
c0000134:	fe050ee3          	beqz	a0,c0000130 <getchar+0x8>
c0000138:	00c12083          	lw	ra,12(sp)
c000013c:	01010113          	addi	sp,sp,16
c0000140:	00008067          	ret

c0000144 <readline>:
c0000144:	fd010113          	addi	sp,sp,-48
c0000148:	02112623          	sw	ra,44(sp)
c000014c:	02812423          	sw	s0,40(sp)
c0000150:	02912223          	sw	s1,36(sp)
c0000154:	03212023          	sw	s2,32(sp)
c0000158:	01312e23          	sw	s3,28(sp)
c000015c:	01412c23          	sw	s4,24(sp)
c0000160:	01512a23          	sw	s5,20(sp)
c0000164:	01612823          	sw	s6,16(sp)
c0000168:	01712623          	sw	s7,12(sp)
c000016c:	00050a63          	beqz	a0,c0000180 <readline+0x3c>
c0000170:	00050593          	mv	a1,a0
c0000174:	00003517          	auipc	a0,0x3
c0000178:	5a450513          	addi	a0,a0,1444 # c0003718 <etext+0x24>
c000017c:	f51ff0ef          	jal	ra,c00000cc <cprintf>
c0000180:	00000493          	li	s1,0
c0000184:	01f00913          	li	s2,31
c0000188:	00d00993          	li	s3,13
c000018c:	00800a93          	li	s5,8
c0000190:	00a00b13          	li	s6,10
c0000194:	3fe00a13          	li	s4,1022
c0000198:	00007b97          	auipc	s7,0x7
c000019c:	e70b8b93          	addi	s7,s7,-400 # c0007008 <buf>
c00001a0:	f89ff0ef          	jal	ra,c0000128 <getchar>
c00001a4:	00050413          	mv	s0,a0
c00001a8:	06054863          	bltz	a0,c0000218 <readline+0xd4>
c00001ac:	06a95a63          	ble	a0,s2,c0000220 <readline+0xdc>
c00001b0:	049a5663          	ble	s1,s4,c00001fc <readline+0xb8>
c00001b4:	ff3416e3          	bne	s0,s3,c00001a0 <readline+0x5c>
c00001b8:	00040513          	mv	a0,s0
c00001bc:	f69ff0ef          	jal	ra,c0000124 <cputchar>
c00001c0:	00007517          	auipc	a0,0x7
c00001c4:	e4850513          	addi	a0,a0,-440 # c0007008 <buf>
c00001c8:	009504b3          	add	s1,a0,s1
c00001cc:	00048023          	sb	zero,0(s1)
c00001d0:	02c12083          	lw	ra,44(sp)
c00001d4:	02812403          	lw	s0,40(sp)
c00001d8:	02412483          	lw	s1,36(sp)
c00001dc:	02012903          	lw	s2,32(sp)
c00001e0:	01c12983          	lw	s3,28(sp)
c00001e4:	01812a03          	lw	s4,24(sp)
c00001e8:	01412a83          	lw	s5,20(sp)
c00001ec:	01012b03          	lw	s6,16(sp)
c00001f0:	00c12b83          	lw	s7,12(sp)
c00001f4:	03010113          	addi	sp,sp,48
c00001f8:	00008067          	ret
c00001fc:	f29ff0ef          	jal	ra,c0000124 <cputchar>
c0000200:	009b87b3          	add	a5,s7,s1
c0000204:	00878023          	sb	s0,0(a5)
c0000208:	f21ff0ef          	jal	ra,c0000128 <getchar>
c000020c:	00148493          	addi	s1,s1,1
c0000210:	00050413          	mv	s0,a0
c0000214:	f8055ce3          	bgez	a0,c00001ac <readline+0x68>
c0000218:	00000513          	li	a0,0
c000021c:	fb5ff06f          	j	c00001d0 <readline+0x8c>
c0000220:	01551a63          	bne	a0,s5,c0000234 <readline+0xf0>
c0000224:	f6048ee3          	beqz	s1,c00001a0 <readline+0x5c>
c0000228:	efdff0ef          	jal	ra,c0000124 <cputchar>
c000022c:	fff48493          	addi	s1,s1,-1
c0000230:	f71ff06f          	j	c00001a0 <readline+0x5c>
c0000234:	f96502e3          	beq	a0,s6,c00001b8 <readline+0x74>
c0000238:	f73414e3          	bne	s0,s3,c00001a0 <readline+0x5c>
c000023c:	f7dff06f          	j	c00001b8 <readline+0x74>

c0000240 <__panic>:
c0000240:	fc010113          	addi	sp,sp,-64
c0000244:	02f12a23          	sw	a5,52(sp)
c0000248:	00112e23          	sw	ra,28(sp)
c000024c:	00812c23          	sw	s0,24(sp)
c0000250:	02d12623          	sw	a3,44(sp)
c0000254:	02e12823          	sw	a4,48(sp)
c0000258:	03012c23          	sw	a6,56(sp)
c000025c:	03112e23          	sw	a7,60(sp)
c0000260:	00007797          	auipc	a5,0x7
c0000264:	1a87a783          	lw	a5,424(a5) # c0007408 <is_panic>
c0000268:	00078a63          	beqz	a5,c000027c <__panic+0x3c>
c000026c:	43c000ef          	jal	ra,c00006a8 <intr_disable>
c0000270:	00000513          	li	a0,0
c0000274:	1b4000ef          	jal	ra,c0000428 <kmonitor>
c0000278:	ff9ff06f          	j	c0000270 <__panic+0x30>
c000027c:	00100713          	li	a4,1
c0000280:	00007797          	auipc	a5,0x7
c0000284:	18878793          	addi	a5,a5,392 # c0007408 <is_panic>
c0000288:	00e7a023          	sw	a4,0(a5)
c000028c:	00060413          	mv	s0,a2
c0000290:	02c10793          	addi	a5,sp,44
c0000294:	00058613          	mv	a2,a1
c0000298:	00050593          	mv	a1,a0
c000029c:	00003517          	auipc	a0,0x3
c00002a0:	48050513          	addi	a0,a0,1152 # c000371c <etext+0x28>
c00002a4:	00f12623          	sw	a5,12(sp)
c00002a8:	e25ff0ef          	jal	ra,c00000cc <cprintf>
c00002ac:	00c12583          	lw	a1,12(sp)
c00002b0:	00040513          	mv	a0,s0
c00002b4:	de5ff0ef          	jal	ra,c0000098 <vcprintf>
c00002b8:	00004517          	auipc	a0,0x4
c00002bc:	ee450513          	addi	a0,a0,-284 # c000419c <commands+0x984>
c00002c0:	e0dff0ef          	jal	ra,c00000cc <cprintf>
c00002c4:	fa9ff06f          	j	c000026c <__panic+0x2c>

c00002c8 <print_kerninfo>:
c00002c8:	ff010113          	addi	sp,sp,-16
c00002cc:	00003517          	auipc	a0,0x3
c00002d0:	49450513          	addi	a0,a0,1172 # c0003760 <etext+0x6c>
c00002d4:	00112623          	sw	ra,12(sp)
c00002d8:	df5ff0ef          	jal	ra,c00000cc <cprintf>
c00002dc:	00000597          	auipc	a1,0x0
c00002e0:	d3058593          	addi	a1,a1,-720 # c000000c <kern_init>
c00002e4:	00003517          	auipc	a0,0x3
c00002e8:	49850513          	addi	a0,a0,1176 # c000377c <etext+0x88>
c00002ec:	de1ff0ef          	jal	ra,c00000cc <cprintf>
c00002f0:	00003597          	auipc	a1,0x3
c00002f4:	40458593          	addi	a1,a1,1028 # c00036f4 <etext>
c00002f8:	00003517          	auipc	a0,0x3
c00002fc:	4a050513          	addi	a0,a0,1184 # c0003798 <etext+0xa4>
c0000300:	dcdff0ef          	jal	ra,c00000cc <cprintf>
c0000304:	00007597          	auipc	a1,0x7
c0000308:	d0058593          	addi	a1,a1,-768 # c0007004 <edata>
c000030c:	00003517          	auipc	a0,0x3
c0000310:	4a850513          	addi	a0,a0,1192 # c00037b4 <etext+0xc0>
c0000314:	db9ff0ef          	jal	ra,c00000cc <cprintf>
c0000318:	00007597          	auipc	a1,0x7
c000031c:	12c58593          	addi	a1,a1,300 # c0007444 <end>
c0000320:	00003517          	auipc	a0,0x3
c0000324:	4b050513          	addi	a0,a0,1200 # c00037d0 <etext+0xdc>
c0000328:	da5ff0ef          	jal	ra,c00000cc <cprintf>
c000032c:	00007597          	auipc	a1,0x7
c0000330:	51758593          	addi	a1,a1,1303 # c0007843 <end+0x3ff>
c0000334:	00000797          	auipc	a5,0x0
c0000338:	cd878793          	addi	a5,a5,-808 # c000000c <kern_init>
c000033c:	40f587b3          	sub	a5,a1,a5
c0000340:	41f7d593          	srai	a1,a5,0x1f
c0000344:	3ff5f593          	andi	a1,a1,1023
c0000348:	00c12083          	lw	ra,12(sp)
c000034c:	00f585b3          	add	a1,a1,a5
c0000350:	40a5d593          	srai	a1,a1,0xa
c0000354:	00003517          	auipc	a0,0x3
c0000358:	49850513          	addi	a0,a0,1176 # c00037ec <etext+0xf8>
c000035c:	01010113          	addi	sp,sp,16
c0000360:	d6dff06f          	j	c00000cc <cprintf>

c0000364 <print_stackframe>:
c0000364:	ff010113          	addi	sp,sp,-16
c0000368:	00003617          	auipc	a2,0x3
c000036c:	3d060613          	addi	a2,a2,976 # c0003738 <etext+0x44>
c0000370:	05b00593          	li	a1,91
c0000374:	00003517          	auipc	a0,0x3
c0000378:	3d850513          	addi	a0,a0,984 # c000374c <etext+0x58>
c000037c:	00112623          	sw	ra,12(sp)
c0000380:	ec1ff0ef          	jal	ra,c0000240 <__panic>

c0000384 <mon_help>:
c0000384:	ff010113          	addi	sp,sp,-16
c0000388:	00003617          	auipc	a2,0x3
c000038c:	54860613          	addi	a2,a2,1352 # c00038d0 <commands+0xb8>
c0000390:	00003597          	auipc	a1,0x3
c0000394:	56058593          	addi	a1,a1,1376 # c00038f0 <commands+0xd8>
c0000398:	00003517          	auipc	a0,0x3
c000039c:	56050513          	addi	a0,a0,1376 # c00038f8 <commands+0xe0>
c00003a0:	00112623          	sw	ra,12(sp)
c00003a4:	d29ff0ef          	jal	ra,c00000cc <cprintf>
c00003a8:	00003617          	auipc	a2,0x3
c00003ac:	55c60613          	addi	a2,a2,1372 # c0003904 <commands+0xec>
c00003b0:	00003597          	auipc	a1,0x3
c00003b4:	57c58593          	addi	a1,a1,1404 # c000392c <commands+0x114>
c00003b8:	00003517          	auipc	a0,0x3
c00003bc:	54050513          	addi	a0,a0,1344 # c00038f8 <commands+0xe0>
c00003c0:	d0dff0ef          	jal	ra,c00000cc <cprintf>
c00003c4:	00003617          	auipc	a2,0x3
c00003c8:	57460613          	addi	a2,a2,1396 # c0003938 <commands+0x120>
c00003cc:	00003597          	auipc	a1,0x3
c00003d0:	58c58593          	addi	a1,a1,1420 # c0003958 <commands+0x140>
c00003d4:	00003517          	auipc	a0,0x3
c00003d8:	52450513          	addi	a0,a0,1316 # c00038f8 <commands+0xe0>
c00003dc:	cf1ff0ef          	jal	ra,c00000cc <cprintf>
c00003e0:	00c12083          	lw	ra,12(sp)
c00003e4:	00000513          	li	a0,0
c00003e8:	01010113          	addi	sp,sp,16
c00003ec:	00008067          	ret

c00003f0 <mon_kerninfo>:
c00003f0:	ff010113          	addi	sp,sp,-16
c00003f4:	00112623          	sw	ra,12(sp)
c00003f8:	ed1ff0ef          	jal	ra,c00002c8 <print_kerninfo>
c00003fc:	00c12083          	lw	ra,12(sp)
c0000400:	00000513          	li	a0,0
c0000404:	01010113          	addi	sp,sp,16
c0000408:	00008067          	ret

c000040c <mon_backtrace>:
c000040c:	ff010113          	addi	sp,sp,-16
c0000410:	00112623          	sw	ra,12(sp)
c0000414:	f51ff0ef          	jal	ra,c0000364 <print_stackframe>
c0000418:	00c12083          	lw	ra,12(sp)
c000041c:	00000513          	li	a0,0
c0000420:	01010113          	addi	sp,sp,16
c0000424:	00008067          	ret

c0000428 <kmonitor>:
c0000428:	f9010113          	addi	sp,sp,-112
c000042c:	05812423          	sw	s8,72(sp)
c0000430:	00050c13          	mv	s8,a0
c0000434:	00003517          	auipc	a0,0x3
c0000438:	40850513          	addi	a0,a0,1032 # c000383c <commands+0x24>
c000043c:	06112623          	sw	ra,108(sp)
c0000440:	06812423          	sw	s0,104(sp)
c0000444:	06912223          	sw	s1,100(sp)
c0000448:	07212023          	sw	s2,96(sp)
c000044c:	05312e23          	sw	s3,92(sp)
c0000450:	05412c23          	sw	s4,88(sp)
c0000454:	05512a23          	sw	s5,84(sp)
c0000458:	05612823          	sw	s6,80(sp)
c000045c:	05712623          	sw	s7,76(sp)
c0000460:	05912223          	sw	s9,68(sp)
c0000464:	05a12023          	sw	s10,64(sp)
c0000468:	c65ff0ef          	jal	ra,c00000cc <cprintf>
c000046c:	00003517          	auipc	a0,0x3
c0000470:	3f850513          	addi	a0,a0,1016 # c0003864 <commands+0x4c>
c0000474:	c59ff0ef          	jal	ra,c00000cc <cprintf>
c0000478:	000c0663          	beqz	s8,c0000484 <kmonitor+0x5c>
c000047c:	000c0513          	mv	a0,s8
c0000480:	460000ef          	jal	ra,c00008e0 <print_trapframe>
c0000484:	00003c97          	auipc	s9,0x3
c0000488:	394c8c93          	addi	s9,s9,916 # c0003818 <commands>
c000048c:	00003997          	auipc	s3,0x3
c0000490:	40098993          	addi	s3,s3,1024 # c000388c <commands+0x74>
c0000494:	00003497          	auipc	s1,0x3
c0000498:	3fc48493          	addi	s1,s1,1020 # c0003890 <commands+0x78>
c000049c:	00f00a13          	li	s4,15
c00004a0:	01000b93          	li	s7,16
c00004a4:	00003b17          	auipc	s6,0x3
c00004a8:	3f4b0b13          	addi	s6,s6,1012 # c0003898 <commands+0x80>
c00004ac:	00300a93          	li	s5,3
c00004b0:	00098513          	mv	a0,s3
c00004b4:	c91ff0ef          	jal	ra,c0000144 <readline>
c00004b8:	00050413          	mv	s0,a0
c00004bc:	fe050ae3          	beqz	a0,c00004b0 <kmonitor+0x88>
c00004c0:	00054583          	lbu	a1,0(a0)
c00004c4:	00000913          	li	s2,0
c00004c8:	0a059463          	bnez	a1,c0000570 <kmonitor+0x148>
c00004cc:	fe0902e3          	beqz	s2,c00004b0 <kmonitor+0x88>
c00004d0:	00012583          	lw	a1,0(sp)
c00004d4:	00003d17          	auipc	s10,0x3
c00004d8:	344d0d13          	addi	s10,s10,836 # c0003818 <commands>
c00004dc:	00003517          	auipc	a0,0x3
c00004e0:	41450513          	addi	a0,a0,1044 # c00038f0 <commands+0xd8>
c00004e4:	00000413          	li	s0,0
c00004e8:	00cd0d13          	addi	s10,s10,12
c00004ec:	399020ef          	jal	ra,c0003084 <strcmp>
c00004f0:	02050063          	beqz	a0,c0000510 <kmonitor+0xe8>
c00004f4:	00140413          	addi	s0,s0,1
c00004f8:	0f540c63          	beq	s0,s5,c00005f0 <kmonitor+0x1c8>
c00004fc:	000d2503          	lw	a0,0(s10)
c0000500:	00012583          	lw	a1,0(sp)
c0000504:	00cd0d13          	addi	s10,s10,12
c0000508:	37d020ef          	jal	ra,c0003084 <strcmp>
c000050c:	fe0514e3          	bnez	a0,c00004f4 <kmonitor+0xcc>
c0000510:	00141793          	slli	a5,s0,0x1
c0000514:	008787b3          	add	a5,a5,s0
c0000518:	00279793          	slli	a5,a5,0x2
c000051c:	00fc87b3          	add	a5,s9,a5
c0000520:	0087a783          	lw	a5,8(a5)
c0000524:	000c0613          	mv	a2,s8
c0000528:	00410593          	addi	a1,sp,4
c000052c:	fff90513          	addi	a0,s2,-1
c0000530:	000780e7          	jalr	a5
c0000534:	f6055ee3          	bgez	a0,c00004b0 <kmonitor+0x88>
c0000538:	06c12083          	lw	ra,108(sp)
c000053c:	06812403          	lw	s0,104(sp)
c0000540:	06412483          	lw	s1,100(sp)
c0000544:	06012903          	lw	s2,96(sp)
c0000548:	05c12983          	lw	s3,92(sp)
c000054c:	05812a03          	lw	s4,88(sp)
c0000550:	05412a83          	lw	s5,84(sp)
c0000554:	05012b03          	lw	s6,80(sp)
c0000558:	04c12b83          	lw	s7,76(sp)
c000055c:	04812c03          	lw	s8,72(sp)
c0000560:	04412c83          	lw	s9,68(sp)
c0000564:	04012d03          	lw	s10,64(sp)
c0000568:	07010113          	addi	sp,sp,112
c000056c:	00008067          	ret
c0000570:	00048513          	mv	a0,s1
c0000574:	345020ef          	jal	ra,c00030b8 <strchr>
c0000578:	00050c63          	beqz	a0,c0000590 <kmonitor+0x168>
c000057c:	00144583          	lbu	a1,1(s0)
c0000580:	00040023          	sb	zero,0(s0)
c0000584:	00140413          	addi	s0,s0,1
c0000588:	f40582e3          	beqz	a1,c00004cc <kmonitor+0xa4>
c000058c:	fe5ff06f          	j	c0000570 <kmonitor+0x148>
c0000590:	00044783          	lbu	a5,0(s0)
c0000594:	f2078ce3          	beqz	a5,c00004cc <kmonitor+0xa4>
c0000598:	05490463          	beq	s2,s4,c00005e0 <kmonitor+0x1b8>
c000059c:	00291793          	slli	a5,s2,0x2
c00005a0:	04010713          	addi	a4,sp,64
c00005a4:	00f707b3          	add	a5,a4,a5
c00005a8:	fc87a023          	sw	s0,-64(a5)
c00005ac:	00044583          	lbu	a1,0(s0)
c00005b0:	00190913          	addi	s2,s2,1
c00005b4:	00059a63          	bnez	a1,c00005c8 <kmonitor+0x1a0>
c00005b8:	f19ff06f          	j	c00004d0 <kmonitor+0xa8>
c00005bc:	00140413          	addi	s0,s0,1
c00005c0:	00044583          	lbu	a1,0(s0)
c00005c4:	f00586e3          	beqz	a1,c00004d0 <kmonitor+0xa8>
c00005c8:	00048513          	mv	a0,s1
c00005cc:	2ed020ef          	jal	ra,c00030b8 <strchr>
c00005d0:	fe0506e3          	beqz	a0,c00005bc <kmonitor+0x194>
c00005d4:	00044583          	lbu	a1,0(s0)
c00005d8:	ee058ae3          	beqz	a1,c00004cc <kmonitor+0xa4>
c00005dc:	f95ff06f          	j	c0000570 <kmonitor+0x148>
c00005e0:	000b8593          	mv	a1,s7
c00005e4:	000b0513          	mv	a0,s6
c00005e8:	ae5ff0ef          	jal	ra,c00000cc <cprintf>
c00005ec:	fb1ff06f          	j	c000059c <kmonitor+0x174>
c00005f0:	00012583          	lw	a1,0(sp)
c00005f4:	00003517          	auipc	a0,0x3
c00005f8:	2c450513          	addi	a0,a0,708 # c00038b8 <commands+0xa0>
c00005fc:	ad1ff0ef          	jal	ra,c00000cc <cprintf>
c0000600:	eb1ff06f          	j	c00004b0 <kmonitor+0x88>

c0000604 <clock_set_next_event>:
c0000604:	c81027f3          	rdtimeh	a5
c0000608:	c01025f3          	rdtime	a1
c000060c:	c8102773          	rdtimeh	a4
c0000610:	fee79ae3          	bne	a5,a4,c0000604 <clock_set_next_event>
c0000614:	00007717          	auipc	a4,0x7
c0000618:	dfc70713          	addi	a4,a4,-516 # c0007410 <timebase>
c000061c:	00072503          	lw	a0,0(a4)
c0000620:	00472703          	lw	a4,4(a4)
c0000624:	00a58533          	add	a0,a1,a0
c0000628:	00b535b3          	sltu	a1,a0,a1
c000062c:	00e787b3          	add	a5,a5,a4
c0000630:	00f585b3          	add	a1,a1,a5
c0000634:	3ffff317          	auipc	t1,0x3ffff
c0000638:	26c30067          	jr	620(t1) # fffff8a0 <sbi_set_timer>

c000063c <clock_init>:
c000063c:	ff010113          	addi	sp,sp,-16
c0000640:	00112623          	sw	ra,12(sp)
c0000644:	3ffff317          	auipc	t1,0x3ffff
c0000648:	23c300e7          	jalr	572(t1) # fffff880 <sbi_timebase>
c000064c:	1f400793          	li	a5,500
c0000650:	02f55533          	divu	a0,a0,a5
c0000654:	00007797          	auipc	a5,0x7
c0000658:	dbc78793          	addi	a5,a5,-580 # c0007410 <timebase>
c000065c:	0007a223          	sw	zero,4(a5)
c0000660:	00a7a023          	sw	a0,0(a5)
c0000664:	fa1ff0ef          	jal	ra,c0000604 <clock_set_next_event>
c0000668:	00c12083          	lw	ra,12(sp)
c000066c:	00003517          	auipc	a0,0x3
c0000670:	2f850513          	addi	a0,a0,760 # c0003964 <commands+0x14c>
c0000674:	00007297          	auipc	t0,0x7
c0000678:	da02a823          	sw	zero,-592(t0) # c0007424 <ticks>
c000067c:	01010113          	addi	sp,sp,16
c0000680:	a4dff06f          	j	c00000cc <cprintf>

c0000684 <cons_init>:
c0000684:	00008067          	ret

c0000688 <cons_putc>:
c0000688:	0ff57513          	andi	a0,a0,255
c000068c:	3ffff317          	auipc	t1,0x3ffff
c0000690:	1a430067          	jr	420(t1) # fffff830 <sbi_console_putchar>

c0000694 <cons_getc>:
c0000694:	3ffff317          	auipc	t1,0x3ffff
c0000698:	1ac30067          	jr	428(t1) # fffff840 <sbi_console_getchar>

c000069c <pic_init>:
c000069c:	00008067          	ret

c00006a0 <intr_enable>:
c00006a0:	100167f3          	csrrsi	a5,sstatus,2
c00006a4:	00008067          	ret

c00006a8 <intr_disable>:
c00006a8:	100177f3          	csrrci	a5,sstatus,2
c00006ac:	00008067          	ret

c00006b0 <idt_init>:
c00006b0:	14005073          	csrwi	sscratch,0
c00006b4:	00000797          	auipc	a5,0x0
c00006b8:	38878793          	addi	a5,a5,904 # c0000a3c <__alltraps>
c00006bc:	10579073          	csrw	stvec,a5
c00006c0:	00008067          	ret

c00006c4 <print_regs>:
c00006c4:	00052583          	lw	a1,0(a0)
c00006c8:	ff010113          	addi	sp,sp,-16
c00006cc:	00812423          	sw	s0,8(sp)
c00006d0:	00050413          	mv	s0,a0
c00006d4:	00003517          	auipc	a0,0x3
c00006d8:	39850513          	addi	a0,a0,920 # c0003a6c <commands+0x254>
c00006dc:	00112623          	sw	ra,12(sp)
c00006e0:	9edff0ef          	jal	ra,c00000cc <cprintf>
c00006e4:	00442583          	lw	a1,4(s0)
c00006e8:	00003517          	auipc	a0,0x3
c00006ec:	39850513          	addi	a0,a0,920 # c0003a80 <commands+0x268>
c00006f0:	9ddff0ef          	jal	ra,c00000cc <cprintf>
c00006f4:	00842583          	lw	a1,8(s0)
c00006f8:	00003517          	auipc	a0,0x3
c00006fc:	39c50513          	addi	a0,a0,924 # c0003a94 <commands+0x27c>
c0000700:	9cdff0ef          	jal	ra,c00000cc <cprintf>
c0000704:	00c42583          	lw	a1,12(s0)
c0000708:	00003517          	auipc	a0,0x3
c000070c:	3a050513          	addi	a0,a0,928 # c0003aa8 <commands+0x290>
c0000710:	9bdff0ef          	jal	ra,c00000cc <cprintf>
c0000714:	01042583          	lw	a1,16(s0)
c0000718:	00003517          	auipc	a0,0x3
c000071c:	3a450513          	addi	a0,a0,932 # c0003abc <commands+0x2a4>
c0000720:	9adff0ef          	jal	ra,c00000cc <cprintf>
c0000724:	01442583          	lw	a1,20(s0)
c0000728:	00003517          	auipc	a0,0x3
c000072c:	3a850513          	addi	a0,a0,936 # c0003ad0 <commands+0x2b8>
c0000730:	99dff0ef          	jal	ra,c00000cc <cprintf>
c0000734:	01842583          	lw	a1,24(s0)
c0000738:	00003517          	auipc	a0,0x3
c000073c:	3ac50513          	addi	a0,a0,940 # c0003ae4 <commands+0x2cc>
c0000740:	98dff0ef          	jal	ra,c00000cc <cprintf>
c0000744:	01c42583          	lw	a1,28(s0)
c0000748:	00003517          	auipc	a0,0x3
c000074c:	3b050513          	addi	a0,a0,944 # c0003af8 <commands+0x2e0>
c0000750:	97dff0ef          	jal	ra,c00000cc <cprintf>
c0000754:	02042583          	lw	a1,32(s0)
c0000758:	00003517          	auipc	a0,0x3
c000075c:	3b450513          	addi	a0,a0,948 # c0003b0c <commands+0x2f4>
c0000760:	96dff0ef          	jal	ra,c00000cc <cprintf>
c0000764:	02442583          	lw	a1,36(s0)
c0000768:	00003517          	auipc	a0,0x3
c000076c:	3b850513          	addi	a0,a0,952 # c0003b20 <commands+0x308>
c0000770:	95dff0ef          	jal	ra,c00000cc <cprintf>
c0000774:	02842583          	lw	a1,40(s0)
c0000778:	00003517          	auipc	a0,0x3
c000077c:	3bc50513          	addi	a0,a0,956 # c0003b34 <commands+0x31c>
c0000780:	94dff0ef          	jal	ra,c00000cc <cprintf>
c0000784:	02c42583          	lw	a1,44(s0)
c0000788:	00003517          	auipc	a0,0x3
c000078c:	3c050513          	addi	a0,a0,960 # c0003b48 <commands+0x330>
c0000790:	93dff0ef          	jal	ra,c00000cc <cprintf>
c0000794:	03042583          	lw	a1,48(s0)
c0000798:	00003517          	auipc	a0,0x3
c000079c:	3c450513          	addi	a0,a0,964 # c0003b5c <commands+0x344>
c00007a0:	92dff0ef          	jal	ra,c00000cc <cprintf>
c00007a4:	03442583          	lw	a1,52(s0)
c00007a8:	00003517          	auipc	a0,0x3
c00007ac:	3c850513          	addi	a0,a0,968 # c0003b70 <commands+0x358>
c00007b0:	91dff0ef          	jal	ra,c00000cc <cprintf>
c00007b4:	03842583          	lw	a1,56(s0)
c00007b8:	00003517          	auipc	a0,0x3
c00007bc:	3cc50513          	addi	a0,a0,972 # c0003b84 <commands+0x36c>
c00007c0:	90dff0ef          	jal	ra,c00000cc <cprintf>
c00007c4:	03c42583          	lw	a1,60(s0)
c00007c8:	00003517          	auipc	a0,0x3
c00007cc:	3d050513          	addi	a0,a0,976 # c0003b98 <commands+0x380>
c00007d0:	8fdff0ef          	jal	ra,c00000cc <cprintf>
c00007d4:	04042583          	lw	a1,64(s0)
c00007d8:	00003517          	auipc	a0,0x3
c00007dc:	3d450513          	addi	a0,a0,980 # c0003bac <commands+0x394>
c00007e0:	8edff0ef          	jal	ra,c00000cc <cprintf>
c00007e4:	04442583          	lw	a1,68(s0)
c00007e8:	00003517          	auipc	a0,0x3
c00007ec:	3d850513          	addi	a0,a0,984 # c0003bc0 <commands+0x3a8>
c00007f0:	8ddff0ef          	jal	ra,c00000cc <cprintf>
c00007f4:	04842583          	lw	a1,72(s0)
c00007f8:	00003517          	auipc	a0,0x3
c00007fc:	3dc50513          	addi	a0,a0,988 # c0003bd4 <commands+0x3bc>
c0000800:	8cdff0ef          	jal	ra,c00000cc <cprintf>
c0000804:	04c42583          	lw	a1,76(s0)
c0000808:	00003517          	auipc	a0,0x3
c000080c:	3e050513          	addi	a0,a0,992 # c0003be8 <commands+0x3d0>
c0000810:	8bdff0ef          	jal	ra,c00000cc <cprintf>
c0000814:	05042583          	lw	a1,80(s0)
c0000818:	00003517          	auipc	a0,0x3
c000081c:	3e450513          	addi	a0,a0,996 # c0003bfc <commands+0x3e4>
c0000820:	8adff0ef          	jal	ra,c00000cc <cprintf>
c0000824:	05442583          	lw	a1,84(s0)
c0000828:	00003517          	auipc	a0,0x3
c000082c:	3e850513          	addi	a0,a0,1000 # c0003c10 <commands+0x3f8>
c0000830:	89dff0ef          	jal	ra,c00000cc <cprintf>
c0000834:	05842583          	lw	a1,88(s0)
c0000838:	00003517          	auipc	a0,0x3
c000083c:	3ec50513          	addi	a0,a0,1004 # c0003c24 <commands+0x40c>
c0000840:	88dff0ef          	jal	ra,c00000cc <cprintf>
c0000844:	05c42583          	lw	a1,92(s0)
c0000848:	00003517          	auipc	a0,0x3
c000084c:	3f050513          	addi	a0,a0,1008 # c0003c38 <commands+0x420>
c0000850:	87dff0ef          	jal	ra,c00000cc <cprintf>
c0000854:	06042583          	lw	a1,96(s0)
c0000858:	00003517          	auipc	a0,0x3
c000085c:	3f450513          	addi	a0,a0,1012 # c0003c4c <commands+0x434>
c0000860:	86dff0ef          	jal	ra,c00000cc <cprintf>
c0000864:	06442583          	lw	a1,100(s0)
c0000868:	00003517          	auipc	a0,0x3
c000086c:	3f850513          	addi	a0,a0,1016 # c0003c60 <commands+0x448>
c0000870:	85dff0ef          	jal	ra,c00000cc <cprintf>
c0000874:	06842583          	lw	a1,104(s0)
c0000878:	00003517          	auipc	a0,0x3
c000087c:	3fc50513          	addi	a0,a0,1020 # c0003c74 <commands+0x45c>
c0000880:	84dff0ef          	jal	ra,c00000cc <cprintf>
c0000884:	06c42583          	lw	a1,108(s0)
c0000888:	00003517          	auipc	a0,0x3
c000088c:	40050513          	addi	a0,a0,1024 # c0003c88 <commands+0x470>
c0000890:	83dff0ef          	jal	ra,c00000cc <cprintf>
c0000894:	07042583          	lw	a1,112(s0)
c0000898:	00003517          	auipc	a0,0x3
c000089c:	40450513          	addi	a0,a0,1028 # c0003c9c <commands+0x484>
c00008a0:	82dff0ef          	jal	ra,c00000cc <cprintf>
c00008a4:	07442583          	lw	a1,116(s0)
c00008a8:	00003517          	auipc	a0,0x3
c00008ac:	40850513          	addi	a0,a0,1032 # c0003cb0 <commands+0x498>
c00008b0:	81dff0ef          	jal	ra,c00000cc <cprintf>
c00008b4:	07842583          	lw	a1,120(s0)
c00008b8:	00003517          	auipc	a0,0x3
c00008bc:	40c50513          	addi	a0,a0,1036 # c0003cc4 <commands+0x4ac>
c00008c0:	80dff0ef          	jal	ra,c00000cc <cprintf>
c00008c4:	07c42583          	lw	a1,124(s0)
c00008c8:	00c12083          	lw	ra,12(sp)
c00008cc:	00812403          	lw	s0,8(sp)
c00008d0:	00003517          	auipc	a0,0x3
c00008d4:	40850513          	addi	a0,a0,1032 # c0003cd8 <commands+0x4c0>
c00008d8:	01010113          	addi	sp,sp,16
c00008dc:	ff0ff06f          	j	c00000cc <cprintf>

c00008e0 <print_trapframe>:
c00008e0:	ff010113          	addi	sp,sp,-16
c00008e4:	00050593          	mv	a1,a0
c00008e8:	00812423          	sw	s0,8(sp)
c00008ec:	00050413          	mv	s0,a0
c00008f0:	00003517          	auipc	a0,0x3
c00008f4:	3fc50513          	addi	a0,a0,1020 # c0003cec <commands+0x4d4>
c00008f8:	00112623          	sw	ra,12(sp)
c00008fc:	fd0ff0ef          	jal	ra,c00000cc <cprintf>
c0000900:	00040513          	mv	a0,s0
c0000904:	dc1ff0ef          	jal	ra,c00006c4 <print_regs>
c0000908:	08042583          	lw	a1,128(s0)
c000090c:	00003517          	auipc	a0,0x3
c0000910:	3f450513          	addi	a0,a0,1012 # c0003d00 <commands+0x4e8>
c0000914:	fb8ff0ef          	jal	ra,c00000cc <cprintf>
c0000918:	08442583          	lw	a1,132(s0)
c000091c:	00003517          	auipc	a0,0x3
c0000920:	3f850513          	addi	a0,a0,1016 # c0003d14 <commands+0x4fc>
c0000924:	fa8ff0ef          	jal	ra,c00000cc <cprintf>
c0000928:	08842583          	lw	a1,136(s0)
c000092c:	00003517          	auipc	a0,0x3
c0000930:	3fc50513          	addi	a0,a0,1020 # c0003d28 <commands+0x510>
c0000934:	f98ff0ef          	jal	ra,c00000cc <cprintf>
c0000938:	08c42583          	lw	a1,140(s0)
c000093c:	00c12083          	lw	ra,12(sp)
c0000940:	00812403          	lw	s0,8(sp)
c0000944:	00003517          	auipc	a0,0x3
c0000948:	3f850513          	addi	a0,a0,1016 # c0003d3c <commands+0x524>
c000094c:	01010113          	addi	sp,sp,16
c0000950:	f7cff06f          	j	c00000cc <cprintf>

c0000954 <interrupt_handler>:
c0000954:	08c52783          	lw	a5,140(a0)
c0000958:	80000737          	lui	a4,0x80000
c000095c:	fff74713          	not	a4,a4
c0000960:	00e7f7b3          	and	a5,a5,a4
c0000964:	00b00713          	li	a4,11
c0000968:	0af76063          	bltu	a4,a5,c0000a08 <interrupt_handler+0xb4>
c000096c:	00003717          	auipc	a4,0x3
c0000970:	01470713          	addi	a4,a4,20 # c0003980 <commands+0x168>
c0000974:	00279793          	slli	a5,a5,0x2
c0000978:	00e787b3          	add	a5,a5,a4
c000097c:	0007a783          	lw	a5,0(a5)
c0000980:	00e787b3          	add	a5,a5,a4
c0000984:	00078067          	jr	a5
c0000988:	00003517          	auipc	a0,0x3
c000098c:	06450513          	addi	a0,a0,100 # c00039ec <commands+0x1d4>
c0000990:	f3cff06f          	j	c00000cc <cprintf>
c0000994:	00003517          	auipc	a0,0x3
c0000998:	07850513          	addi	a0,a0,120 # c0003a0c <commands+0x1f4>
c000099c:	f30ff06f          	j	c00000cc <cprintf>
c00009a0:	00003517          	auipc	a0,0x3
c00009a4:	01050513          	addi	a0,a0,16 # c00039b0 <commands+0x198>
c00009a8:	f24ff06f          	j	c00000cc <cprintf>
c00009ac:	00003517          	auipc	a0,0x3
c00009b0:	02050513          	addi	a0,a0,32 # c00039cc <commands+0x1b4>
c00009b4:	f18ff06f          	j	c00000cc <cprintf>
c00009b8:	00003517          	auipc	a0,0x3
c00009bc:	09450513          	addi	a0,a0,148 # c0003a4c <commands+0x234>
c00009c0:	f0cff06f          	j	c00000cc <cprintf>
c00009c4:	ff010113          	addi	sp,sp,-16
c00009c8:	00112623          	sw	ra,12(sp)
c00009cc:	c39ff0ef          	jal	ra,c0000604 <clock_set_next_event>
c00009d0:	00007797          	auipc	a5,0x7
c00009d4:	a547a783          	lw	a5,-1452(a5) # c0007424 <ticks>
c00009d8:	00178793          	addi	a5,a5,1
c00009dc:	06400593          	li	a1,100
c00009e0:	02b7f733          	remu	a4,a5,a1
c00009e4:	00007297          	auipc	t0,0x7
c00009e8:	a4f2a023          	sw	a5,-1472(t0) # c0007424 <ticks>
c00009ec:	02070063          	beqz	a4,c0000a0c <interrupt_handler+0xb8>
c00009f0:	00c12083          	lw	ra,12(sp)
c00009f4:	01010113          	addi	sp,sp,16
c00009f8:	00008067          	ret
c00009fc:	00003517          	auipc	a0,0x3
c0000a00:	02c50513          	addi	a0,a0,44 # c0003a28 <commands+0x210>
c0000a04:	ec8ff06f          	j	c00000cc <cprintf>
c0000a08:	ed9ff06f          	j	c00008e0 <print_trapframe>
c0000a0c:	00c12083          	lw	ra,12(sp)
c0000a10:	00003517          	auipc	a0,0x3
c0000a14:	03050513          	addi	a0,a0,48 # c0003a40 <commands+0x228>
c0000a18:	01010113          	addi	sp,sp,16
c0000a1c:	eb0ff06f          	j	c00000cc <cprintf>

c0000a20 <trap>:
c0000a20:	08c52783          	lw	a5,140(a0)
c0000a24:	0007ca63          	bltz	a5,c0000a38 <trap+0x18>
c0000a28:	00b00713          	li	a4,11
c0000a2c:	00f76463          	bltu	a4,a5,c0000a34 <trap+0x14>
c0000a30:	00008067          	ret
c0000a34:	eadff06f          	j	c00008e0 <print_trapframe>
c0000a38:	f1dff06f          	j	c0000954 <interrupt_handler>

c0000a3c <__alltraps>:
c0000a3c:	14011073          	csrw	sscratch,sp
c0000a40:	f7010113          	addi	sp,sp,-144
c0000a44:	00012023          	sw	zero,0(sp)
c0000a48:	00112223          	sw	ra,4(sp)
c0000a4c:	00312623          	sw	gp,12(sp)
c0000a50:	00412823          	sw	tp,16(sp)
c0000a54:	00512a23          	sw	t0,20(sp)
c0000a58:	00612c23          	sw	t1,24(sp)
c0000a5c:	00712e23          	sw	t2,28(sp)
c0000a60:	02812023          	sw	s0,32(sp)
c0000a64:	02912223          	sw	s1,36(sp)
c0000a68:	02a12423          	sw	a0,40(sp)
c0000a6c:	02b12623          	sw	a1,44(sp)
c0000a70:	02c12823          	sw	a2,48(sp)
c0000a74:	02d12a23          	sw	a3,52(sp)
c0000a78:	02e12c23          	sw	a4,56(sp)
c0000a7c:	02f12e23          	sw	a5,60(sp)
c0000a80:	05012023          	sw	a6,64(sp)
c0000a84:	05112223          	sw	a7,68(sp)
c0000a88:	05212423          	sw	s2,72(sp)
c0000a8c:	05312623          	sw	s3,76(sp)
c0000a90:	05412823          	sw	s4,80(sp)
c0000a94:	05512a23          	sw	s5,84(sp)
c0000a98:	05612c23          	sw	s6,88(sp)
c0000a9c:	05712e23          	sw	s7,92(sp)
c0000aa0:	07812023          	sw	s8,96(sp)
c0000aa4:	07912223          	sw	s9,100(sp)
c0000aa8:	07a12423          	sw	s10,104(sp)
c0000aac:	07b12623          	sw	s11,108(sp)
c0000ab0:	07c12823          	sw	t3,112(sp)
c0000ab4:	07d12a23          	sw	t4,116(sp)
c0000ab8:	07e12c23          	sw	t5,120(sp)
c0000abc:	07f12e23          	sw	t6,124(sp)
c0000ac0:	14001473          	csrrw	s0,sscratch,zero
c0000ac4:	100024f3          	csrr	s1,sstatus
c0000ac8:	14102973          	csrr	s2,sepc
c0000acc:	143029f3          	csrr	s3,sbadaddr
c0000ad0:	14202a73          	csrr	s4,scause
c0000ad4:	00812423          	sw	s0,8(sp)
c0000ad8:	08912023          	sw	s1,128(sp)
c0000adc:	09212223          	sw	s2,132(sp)
c0000ae0:	09312423          	sw	s3,136(sp)
c0000ae4:	09412623          	sw	s4,140(sp)
c0000ae8:	00010513          	mv	a0,sp
c0000aec:	f35ff0ef          	jal	ra,c0000a20 <trap>

c0000af0 <__trapret>:
c0000af0:	08012483          	lw	s1,128(sp)
c0000af4:	08412903          	lw	s2,132(sp)
c0000af8:	10049073          	csrw	sstatus,s1
c0000afc:	14191073          	csrw	sepc,s2
c0000b00:	00412083          	lw	ra,4(sp)
c0000b04:	00c12183          	lw	gp,12(sp)
c0000b08:	01012203          	lw	tp,16(sp)
c0000b0c:	01412283          	lw	t0,20(sp)
c0000b10:	01812303          	lw	t1,24(sp)
c0000b14:	01c12383          	lw	t2,28(sp)
c0000b18:	02012403          	lw	s0,32(sp)
c0000b1c:	02412483          	lw	s1,36(sp)
c0000b20:	02812503          	lw	a0,40(sp)
c0000b24:	02c12583          	lw	a1,44(sp)
c0000b28:	03012603          	lw	a2,48(sp)
c0000b2c:	03412683          	lw	a3,52(sp)
c0000b30:	03812703          	lw	a4,56(sp)
c0000b34:	03c12783          	lw	a5,60(sp)
c0000b38:	04012803          	lw	a6,64(sp)
c0000b3c:	04412883          	lw	a7,68(sp)
c0000b40:	04812903          	lw	s2,72(sp)
c0000b44:	04c12983          	lw	s3,76(sp)
c0000b48:	05012a03          	lw	s4,80(sp)
c0000b4c:	05412a83          	lw	s5,84(sp)
c0000b50:	05812b03          	lw	s6,88(sp)
c0000b54:	05c12b83          	lw	s7,92(sp)
c0000b58:	06012c03          	lw	s8,96(sp)
c0000b5c:	06412c83          	lw	s9,100(sp)
c0000b60:	06812d03          	lw	s10,104(sp)
c0000b64:	06c12d83          	lw	s11,108(sp)
c0000b68:	07012e03          	lw	t3,112(sp)
c0000b6c:	07412e83          	lw	t4,116(sp)
c0000b70:	07812f03          	lw	t5,120(sp)
c0000b74:	07c12f83          	lw	t6,124(sp)
c0000b78:	00812103          	lw	sp,8(sp)
c0000b7c:	10200073          	sret

c0000b80 <get_pgtable_items.isra.4.part.5>:
c0000b80:	00050313          	mv	t1,a0
c0000b84:	04a5f063          	bleu	a0,a1,c0000bc4 <get_pgtable_items.isra.4.part.5+0x44>
c0000b88:	00259813          	slli	a6,a1,0x2
c0000b8c:	010608b3          	add	a7,a2,a6
c0000b90:	0008a783          	lw	a5,0(a7)
c0000b94:	0017f793          	andi	a5,a5,1
c0000b98:	02079a63          	bnez	a5,c0000bcc <get_pgtable_items.isra.4.part.5+0x4c>
c0000b9c:	00480813          	addi	a6,a6,4
c0000ba0:	01060833          	add	a6,a2,a6
c0000ba4:	0140006f          	j	c0000bb8 <get_pgtable_items.isra.4.part.5+0x38>
c0000ba8:	00082783          	lw	a5,0(a6)
c0000bac:	00480813          	addi	a6,a6,4
c0000bb0:	0017f793          	andi	a5,a5,1
c0000bb4:	00079c63          	bnez	a5,c0000bcc <get_pgtable_items.isra.4.part.5+0x4c>
c0000bb8:	00158593          	addi	a1,a1,1
c0000bbc:	00080893          	mv	a7,a6
c0000bc0:	fe6594e3          	bne	a1,t1,c0000ba8 <get_pgtable_items.isra.4.part.5+0x28>
c0000bc4:	00000513          	li	a0,0
c0000bc8:	00008067          	ret
c0000bcc:	00068463          	beqz	a3,c0000bd4 <get_pgtable_items.isra.4.part.5+0x54>
c0000bd0:	00b6a023          	sw	a1,0(a3)
c0000bd4:	0008a503          	lw	a0,0(a7)
c0000bd8:	00158593          	addi	a1,a1,1
c0000bdc:	01f57513          	andi	a0,a0,31
c0000be0:	0265fe63          	bleu	t1,a1,c0000c1c <get_pgtable_items.isra.4.part.5+0x9c>
c0000be4:	00259793          	slli	a5,a1,0x2
c0000be8:	00f606b3          	add	a3,a2,a5
c0000bec:	0006a683          	lw	a3,0(a3)
c0000bf0:	01f6f693          	andi	a3,a3,31
c0000bf4:	02a69463          	bne	a3,a0,c0000c1c <get_pgtable_items.isra.4.part.5+0x9c>
c0000bf8:	ffc78793          	addi	a5,a5,-4
c0000bfc:	00f60633          	add	a2,a2,a5
c0000c00:	0140006f          	j	c0000c14 <get_pgtable_items.isra.4.part.5+0x94>
c0000c04:	00862783          	lw	a5,8(a2)
c0000c08:	00460613          	addi	a2,a2,4
c0000c0c:	01f7f793          	andi	a5,a5,31
c0000c10:	00d79663          	bne	a5,a3,c0000c1c <get_pgtable_items.isra.4.part.5+0x9c>
c0000c14:	00158593          	addi	a1,a1,1
c0000c18:	fe65e6e3          	bltu	a1,t1,c0000c04 <get_pgtable_items.isra.4.part.5+0x84>
c0000c1c:	00070663          	beqz	a4,c0000c28 <get_pgtable_items.isra.4.part.5+0xa8>
c0000c20:	00b72023          	sw	a1,0(a4)
c0000c24:	00008067          	ret
c0000c28:	00008067          	ret

c0000c2c <pa2page.part.6>:
c0000c2c:	ff010113          	addi	sp,sp,-16
c0000c30:	00003617          	auipc	a2,0x3
c0000c34:	19460613          	addi	a2,a2,404 # c0003dc4 <commands+0x5ac>
c0000c38:	06500593          	li	a1,101
c0000c3c:	00003517          	auipc	a0,0x3
c0000c40:	1a850513          	addi	a0,a0,424 # c0003de4 <commands+0x5cc>
c0000c44:	00112623          	sw	ra,12(sp)
c0000c48:	df8ff0ef          	jal	ra,c0000240 <__panic>

c0000c4c <alloc_pages>:
c0000c4c:	100027f3          	csrr	a5,sstatus
c0000c50:	0027f793          	andi	a5,a5,2
c0000c54:	00079a63          	bnez	a5,c0000c68 <alloc_pages+0x1c>
c0000c58:	00006797          	auipc	a5,0x6
c0000c5c:	7d07a783          	lw	a5,2000(a5) # c0007428 <pmm_manager>
c0000c60:	00c7a303          	lw	t1,12(a5)
c0000c64:	00030067          	jr	t1
c0000c68:	ff010113          	addi	sp,sp,-16
c0000c6c:	00112623          	sw	ra,12(sp)
c0000c70:	00812423          	sw	s0,8(sp)
c0000c74:	00050413          	mv	s0,a0
c0000c78:	a31ff0ef          	jal	ra,c00006a8 <intr_disable>
c0000c7c:	00006797          	auipc	a5,0x6
c0000c80:	7ac7a783          	lw	a5,1964(a5) # c0007428 <pmm_manager>
c0000c84:	00c7a783          	lw	a5,12(a5)
c0000c88:	00040513          	mv	a0,s0
c0000c8c:	000780e7          	jalr	a5
c0000c90:	00050413          	mv	s0,a0
c0000c94:	a0dff0ef          	jal	ra,c00006a0 <intr_enable>
c0000c98:	00c12083          	lw	ra,12(sp)
c0000c9c:	00040513          	mv	a0,s0
c0000ca0:	00812403          	lw	s0,8(sp)
c0000ca4:	01010113          	addi	sp,sp,16
c0000ca8:	00008067          	ret

c0000cac <free_pages>:
c0000cac:	100027f3          	csrr	a5,sstatus
c0000cb0:	0027f793          	andi	a5,a5,2
c0000cb4:	00079a63          	bnez	a5,c0000cc8 <free_pages+0x1c>
c0000cb8:	00006797          	auipc	a5,0x6
c0000cbc:	7707a783          	lw	a5,1904(a5) # c0007428 <pmm_manager>
c0000cc0:	0107a303          	lw	t1,16(a5)
c0000cc4:	00030067          	jr	t1
c0000cc8:	ff010113          	addi	sp,sp,-16
c0000ccc:	00112623          	sw	ra,12(sp)
c0000cd0:	00812423          	sw	s0,8(sp)
c0000cd4:	00912223          	sw	s1,4(sp)
c0000cd8:	00050413          	mv	s0,a0
c0000cdc:	00058493          	mv	s1,a1
c0000ce0:	9c9ff0ef          	jal	ra,c00006a8 <intr_disable>
c0000ce4:	00006797          	auipc	a5,0x6
c0000ce8:	7447a783          	lw	a5,1860(a5) # c0007428 <pmm_manager>
c0000cec:	0107a783          	lw	a5,16(a5)
c0000cf0:	00048593          	mv	a1,s1
c0000cf4:	00040513          	mv	a0,s0
c0000cf8:	000780e7          	jalr	a5
c0000cfc:	00c12083          	lw	ra,12(sp)
c0000d00:	00812403          	lw	s0,8(sp)
c0000d04:	00412483          	lw	s1,4(sp)
c0000d08:	01010113          	addi	sp,sp,16
c0000d0c:	995ff06f          	j	c00006a0 <intr_enable>

c0000d10 <nr_free_pages>:
c0000d10:	100027f3          	csrr	a5,sstatus
c0000d14:	0027f793          	andi	a5,a5,2
c0000d18:	00079a63          	bnez	a5,c0000d2c <nr_free_pages+0x1c>
c0000d1c:	00006797          	auipc	a5,0x6
c0000d20:	70c7a783          	lw	a5,1804(a5) # c0007428 <pmm_manager>
c0000d24:	0147a303          	lw	t1,20(a5)
c0000d28:	00030067          	jr	t1
c0000d2c:	ff010113          	addi	sp,sp,-16
c0000d30:	00112623          	sw	ra,12(sp)
c0000d34:	00812423          	sw	s0,8(sp)
c0000d38:	971ff0ef          	jal	ra,c00006a8 <intr_disable>
c0000d3c:	00006797          	auipc	a5,0x6
c0000d40:	6ec7a783          	lw	a5,1772(a5) # c0007428 <pmm_manager>
c0000d44:	0147a783          	lw	a5,20(a5)
c0000d48:	000780e7          	jalr	a5
c0000d4c:	00050413          	mv	s0,a0
c0000d50:	951ff0ef          	jal	ra,c00006a0 <intr_enable>
c0000d54:	00c12083          	lw	ra,12(sp)
c0000d58:	00040513          	mv	a0,s0
c0000d5c:	00812403          	lw	s0,8(sp)
c0000d60:	01010113          	addi	sp,sp,16
c0000d64:	00008067          	ret

c0000d68 <get_pte>:
c0000d68:	fe010113          	addi	sp,sp,-32
c0000d6c:	01212823          	sw	s2,16(sp)
c0000d70:	0165d913          	srli	s2,a1,0x16
c0000d74:	00291913          	slli	s2,s2,0x2
c0000d78:	01250933          	add	s2,a0,s2
c0000d7c:	00092683          	lw	a3,0(s2)
c0000d80:	00912a23          	sw	s1,20(sp)
c0000d84:	00112e23          	sw	ra,28(sp)
c0000d88:	00812c23          	sw	s0,24(sp)
c0000d8c:	01312623          	sw	s3,12(sp)
c0000d90:	01412423          	sw	s4,8(sp)
c0000d94:	0016f793          	andi	a5,a3,1
c0000d98:	00058493          	mv	s1,a1
c0000d9c:	08079e63          	bnez	a5,c0000e38 <get_pte+0xd0>
c0000da0:	0e060863          	beqz	a2,c0000e90 <get_pte+0x128>
c0000da4:	00100513          	li	a0,1
c0000da8:	ea5ff0ef          	jal	ra,c0000c4c <alloc_pages>
c0000dac:	00050413          	mv	s0,a0
c0000db0:	0e050063          	beqz	a0,c0000e90 <get_pte+0x128>
c0000db4:	00006517          	auipc	a0,0x6
c0000db8:	68052503          	lw	a0,1664(a0) # c0007434 <pages>
c0000dbc:	40a40533          	sub	a0,s0,a0
c0000dc0:	ccccd6b7          	lui	a3,0xccccd
c0000dc4:	40255513          	srai	a0,a0,0x2
c0000dc8:	ccd68993          	addi	s3,a3,-819 # cccccccd <sbi_remote_fence_i+0xccccd3dd>
c0000dcc:	03350533          	mul	a0,a0,s3
c0000dd0:	00100793          	li	a5,1
c0000dd4:	00f42023          	sw	a5,0(s0)
c0000dd8:	00080a37          	lui	s4,0x80
c0000ddc:	001007b7          	lui	a5,0x100
c0000de0:	fff78793          	addi	a5,a5,-1 # fffff <BASE_ADDRESS-0xbff00001>
c0000de4:	00006717          	auipc	a4,0x6
c0000de8:	63872703          	lw	a4,1592(a4) # c000741c <npage>
c0000dec:	01450533          	add	a0,a0,s4
c0000df0:	00f577b3          	and	a5,a0,a5
c0000df4:	00c51513          	slli	a0,a0,0xc
c0000df8:	0ce7fa63          	bleu	a4,a5,c0000ecc <get_pte+0x164>
c0000dfc:	00006797          	auipc	a5,0x6
c0000e00:	6307a783          	lw	a5,1584(a5) # c000742c <va_pa_offset>
c0000e04:	00001637          	lui	a2,0x1
c0000e08:	00000593          	li	a1,0
c0000e0c:	00f50533          	add	a0,a0,a5
c0000e10:	2d4020ef          	jal	ra,c00030e4 <memset>
c0000e14:	00006697          	auipc	a3,0x6
c0000e18:	6206a683          	lw	a3,1568(a3) # c0007434 <pages>
c0000e1c:	40d406b3          	sub	a3,s0,a3
c0000e20:	4026d693          	srai	a3,a3,0x2
c0000e24:	033686b3          	mul	a3,a3,s3
c0000e28:	014686b3          	add	a3,a3,s4
c0000e2c:	00a69693          	slli	a3,a3,0xa
c0000e30:	0116e693          	ori	a3,a3,17
c0000e34:	00d92023          	sw	a3,0(s2)
c0000e38:	00269693          	slli	a3,a3,0x2
c0000e3c:	fffff537          	lui	a0,0xfffff
c0000e40:	00a6f6b3          	and	a3,a3,a0
c0000e44:	00c6d713          	srli	a4,a3,0xc
c0000e48:	00006797          	auipc	a5,0x6
c0000e4c:	5d47a783          	lw	a5,1492(a5) # c000741c <npage>
c0000e50:	06f77263          	bleu	a5,a4,c0000eb4 <get_pte+0x14c>
c0000e54:	00c4d513          	srli	a0,s1,0xc
c0000e58:	01c12083          	lw	ra,28(sp)
c0000e5c:	3ff57513          	andi	a0,a0,1023
c0000e60:	00006797          	auipc	a5,0x6
c0000e64:	5cc7a783          	lw	a5,1484(a5) # c000742c <va_pa_offset>
c0000e68:	00f686b3          	add	a3,a3,a5
c0000e6c:	00251513          	slli	a0,a0,0x2
c0000e70:	00a68533          	add	a0,a3,a0
c0000e74:	01812403          	lw	s0,24(sp)
c0000e78:	01412483          	lw	s1,20(sp)
c0000e7c:	01012903          	lw	s2,16(sp)
c0000e80:	00c12983          	lw	s3,12(sp)
c0000e84:	00812a03          	lw	s4,8(sp)
c0000e88:	02010113          	addi	sp,sp,32
c0000e8c:	00008067          	ret
c0000e90:	01c12083          	lw	ra,28(sp)
c0000e94:	00000513          	li	a0,0
c0000e98:	01812403          	lw	s0,24(sp)
c0000e9c:	01412483          	lw	s1,20(sp)
c0000ea0:	01012903          	lw	s2,16(sp)
c0000ea4:	00c12983          	lw	s3,12(sp)
c0000ea8:	00812a03          	lw	s4,8(sp)
c0000eac:	02010113          	addi	sp,sp,32
c0000eb0:	00008067          	ret
c0000eb4:	00003617          	auipc	a2,0x3
c0000eb8:	edc60613          	addi	a2,a2,-292 # c0003d90 <commands+0x578>
c0000ebc:	11d00593          	li	a1,285
c0000ec0:	00003517          	auipc	a0,0x3
c0000ec4:	ef450513          	addi	a0,a0,-268 # c0003db4 <commands+0x59c>
c0000ec8:	b78ff0ef          	jal	ra,c0000240 <__panic>
c0000ecc:	00050693          	mv	a3,a0
c0000ed0:	00003617          	auipc	a2,0x3
c0000ed4:	ec060613          	addi	a2,a2,-320 # c0003d90 <commands+0x578>
c0000ed8:	11800593          	li	a1,280
c0000edc:	00003517          	auipc	a0,0x3
c0000ee0:	ed850513          	addi	a0,a0,-296 # c0003db4 <commands+0x59c>
c0000ee4:	b5cff0ef          	jal	ra,c0000240 <__panic>

c0000ee8 <boot_map_segment>:
c0000ee8:	fe010113          	addi	sp,sp,-32
c0000eec:	01312623          	sw	s3,12(sp)
c0000ef0:	000019b7          	lui	s3,0x1
c0000ef4:	00d5c7b3          	xor	a5,a1,a3
c0000ef8:	fff98813          	addi	a6,s3,-1 # fff <BASE_ADDRESS-0xbffff001>
c0000efc:	00112e23          	sw	ra,28(sp)
c0000f00:	00812c23          	sw	s0,24(sp)
c0000f04:	00912a23          	sw	s1,20(sp)
c0000f08:	01212823          	sw	s2,16(sp)
c0000f0c:	01412423          	sw	s4,8(sp)
c0000f10:	01512223          	sw	s5,4(sp)
c0000f14:	01612023          	sw	s6,0(sp)
c0000f18:	0107f7b3          	and	a5,a5,a6
c0000f1c:	0a079c63          	bnez	a5,c0000fd4 <boot_map_segment+0xec>
c0000f20:	010607b3          	add	a5,a2,a6
c0000f24:	0105f833          	and	a6,a1,a6
c0000f28:	010787b3          	add	a5,a5,a6
c0000f2c:	fffff937          	lui	s2,0xfffff
c0000f30:	00c7d793          	srli	a5,a5,0xc
c0000f34:	0125f5b3          	and	a1,a1,s2
c0000f38:	0126f6b3          	and	a3,a3,s2
c0000f3c:	04078863          	beqz	a5,c0000f8c <boot_map_segment+0xa4>
c0000f40:	00c79793          	slli	a5,a5,0xc
c0000f44:	00100b13          	li	s6,1
c0000f48:	00050a93          	mv	s5,a0
c0000f4c:	00058413          	mv	s0,a1
c0000f50:	00b784b3          	add	s1,a5,a1
c0000f54:	40b68933          	sub	s2,a3,a1
c0000f58:	01676a33          	or	s4,a4,s6
c0000f5c:	000b0613          	mv	a2,s6
c0000f60:	00040593          	mv	a1,s0
c0000f64:	000a8513          	mv	a0,s5
c0000f68:	e01ff0ef          	jal	ra,c0000d68 <get_pte>
c0000f6c:	008907b3          	add	a5,s2,s0
c0000f70:	04050263          	beqz	a0,c0000fb4 <boot_map_segment+0xcc>
c0000f74:	00c7d793          	srli	a5,a5,0xc
c0000f78:	00a79793          	slli	a5,a5,0xa
c0000f7c:	0147e7b3          	or	a5,a5,s4
c0000f80:	00f52023          	sw	a5,0(a0)
c0000f84:	01340433          	add	s0,s0,s3
c0000f88:	fc849ae3          	bne	s1,s0,c0000f5c <boot_map_segment+0x74>
c0000f8c:	01c12083          	lw	ra,28(sp)
c0000f90:	01812403          	lw	s0,24(sp)
c0000f94:	01412483          	lw	s1,20(sp)
c0000f98:	01012903          	lw	s2,16(sp)
c0000f9c:	00c12983          	lw	s3,12(sp)
c0000fa0:	00812a03          	lw	s4,8(sp)
c0000fa4:	00412a83          	lw	s5,4(sp)
c0000fa8:	00012b03          	lw	s6,0(sp)
c0000fac:	02010113          	addi	sp,sp,32
c0000fb0:	00008067          	ret
c0000fb4:	00003697          	auipc	a3,0x3
c0000fb8:	dcc68693          	addi	a3,a3,-564 # c0003d80 <commands+0x568>
c0000fbc:	00003617          	auipc	a2,0x3
c0000fc0:	dac60613          	addi	a2,a2,-596 # c0003d68 <commands+0x550>
c0000fc4:	0a100593          	li	a1,161
c0000fc8:	00003517          	auipc	a0,0x3
c0000fcc:	dec50513          	addi	a0,a0,-532 # c0003db4 <commands+0x59c>
c0000fd0:	a70ff0ef          	jal	ra,c0000240 <__panic>
c0000fd4:	00003697          	auipc	a3,0x3
c0000fd8:	d7c68693          	addi	a3,a3,-644 # c0003d50 <commands+0x538>
c0000fdc:	00003617          	auipc	a2,0x3
c0000fe0:	d8c60613          	addi	a2,a2,-628 # c0003d68 <commands+0x550>
c0000fe4:	09b00593          	li	a1,155
c0000fe8:	00003517          	auipc	a0,0x3
c0000fec:	dcc50513          	addi	a0,a0,-564 # c0003db4 <commands+0x59c>
c0000ff0:	a50ff0ef          	jal	ra,c0000240 <__panic>

c0000ff4 <get_page>:
c0000ff4:	ff010113          	addi	sp,sp,-16
c0000ff8:	00812423          	sw	s0,8(sp)
c0000ffc:	00060413          	mv	s0,a2
c0001000:	00000613          	li	a2,0
c0001004:	00112623          	sw	ra,12(sp)
c0001008:	d61ff0ef          	jal	ra,c0000d68 <get_pte>
c000100c:	00040463          	beqz	s0,c0001014 <get_page+0x20>
c0001010:	00a42023          	sw	a0,0(s0)
c0001014:	04050a63          	beqz	a0,c0001068 <get_page+0x74>
c0001018:	00052783          	lw	a5,0(a0)
c000101c:	0017f713          	andi	a4,a5,1
c0001020:	04070463          	beqz	a4,c0001068 <get_page+0x74>
c0001024:	00279793          	slli	a5,a5,0x2
c0001028:	00c7d793          	srli	a5,a5,0xc
c000102c:	00006717          	auipc	a4,0x6
c0001030:	3f072703          	lw	a4,1008(a4) # c000741c <npage>
c0001034:	04e7f463          	bleu	a4,a5,c000107c <get_page+0x88>
c0001038:	fff80537          	lui	a0,0xfff80
c000103c:	00a787b3          	add	a5,a5,a0
c0001040:	00279513          	slli	a0,a5,0x2
c0001044:	00c12083          	lw	ra,12(sp)
c0001048:	00f507b3          	add	a5,a0,a5
c000104c:	00279793          	slli	a5,a5,0x2
c0001050:	00006517          	auipc	a0,0x6
c0001054:	3e452503          	lw	a0,996(a0) # c0007434 <pages>
c0001058:	00f50533          	add	a0,a0,a5
c000105c:	00812403          	lw	s0,8(sp)
c0001060:	01010113          	addi	sp,sp,16
c0001064:	00008067          	ret
c0001068:	00c12083          	lw	ra,12(sp)
c000106c:	00000513          	li	a0,0
c0001070:	00812403          	lw	s0,8(sp)
c0001074:	01010113          	addi	sp,sp,16
c0001078:	00008067          	ret
c000107c:	bb1ff0ef          	jal	ra,c0000c2c <pa2page.part.6>

c0001080 <page_remove>:
c0001080:	ff010113          	addi	sp,sp,-16
c0001084:	00000613          	li	a2,0
c0001088:	00912223          	sw	s1,4(sp)
c000108c:	00112623          	sw	ra,12(sp)
c0001090:	00812423          	sw	s0,8(sp)
c0001094:	00058493          	mv	s1,a1
c0001098:	cd1ff0ef          	jal	ra,c0000d68 <get_pte>
c000109c:	00050a63          	beqz	a0,c00010b0 <page_remove+0x30>
c00010a0:	00052783          	lw	a5,0(a0)
c00010a4:	00050413          	mv	s0,a0
c00010a8:	0017f713          	andi	a4,a5,1
c00010ac:	00071c63          	bnez	a4,c00010c4 <page_remove+0x44>
c00010b0:	00c12083          	lw	ra,12(sp)
c00010b4:	00812403          	lw	s0,8(sp)
c00010b8:	00412483          	lw	s1,4(sp)
c00010bc:	01010113          	addi	sp,sp,16
c00010c0:	00008067          	ret
c00010c4:	00279793          	slli	a5,a5,0x2
c00010c8:	00c7d793          	srli	a5,a5,0xc
c00010cc:	00006717          	auipc	a4,0x6
c00010d0:	35072703          	lw	a4,848(a4) # c000741c <npage>
c00010d4:	04e7fe63          	bleu	a4,a5,c0001130 <page_remove+0xb0>
c00010d8:	fff80737          	lui	a4,0xfff80
c00010dc:	00e787b3          	add	a5,a5,a4
c00010e0:	00279513          	slli	a0,a5,0x2
c00010e4:	00f507b3          	add	a5,a0,a5
c00010e8:	00279793          	slli	a5,a5,0x2
c00010ec:	00006517          	auipc	a0,0x6
c00010f0:	34852503          	lw	a0,840(a0) # c0007434 <pages>
c00010f4:	00f50533          	add	a0,a0,a5
c00010f8:	00052783          	lw	a5,0(a0)
c00010fc:	fff78793          	addi	a5,a5,-1
c0001100:	00f52023          	sw	a5,0(a0)
c0001104:	02078063          	beqz	a5,c0001124 <page_remove+0xa4>
c0001108:	00042023          	sw	zero,0(s0)
c000110c:	10448073          	sfence.vm	s1
c0001110:	00c12083          	lw	ra,12(sp)
c0001114:	00812403          	lw	s0,8(sp)
c0001118:	00412483          	lw	s1,4(sp)
c000111c:	01010113          	addi	sp,sp,16
c0001120:	00008067          	ret
c0001124:	00100593          	li	a1,1
c0001128:	b85ff0ef          	jal	ra,c0000cac <free_pages>
c000112c:	fddff06f          	j	c0001108 <page_remove+0x88>
c0001130:	afdff0ef          	jal	ra,c0000c2c <pa2page.part.6>

c0001134 <page_insert>:
c0001134:	fe010113          	addi	sp,sp,-32
c0001138:	01312623          	sw	s3,12(sp)
c000113c:	00060993          	mv	s3,a2
c0001140:	00812c23          	sw	s0,24(sp)
c0001144:	00100613          	li	a2,1
c0001148:	00058413          	mv	s0,a1
c000114c:	00098593          	mv	a1,s3
c0001150:	01212823          	sw	s2,16(sp)
c0001154:	00112e23          	sw	ra,28(sp)
c0001158:	00912a23          	sw	s1,20(sp)
c000115c:	00068913          	mv	s2,a3
c0001160:	c09ff0ef          	jal	ra,c0000d68 <get_pte>
c0001164:	0e050463          	beqz	a0,c000124c <page_insert+0x118>
c0001168:	00042703          	lw	a4,0(s0)
c000116c:	00050493          	mv	s1,a0
c0001170:	00170793          	addi	a5,a4,1 # fff80001 <sbi_remote_fence_i+0xfff80711>
c0001174:	00f42023          	sw	a5,0(s0)
c0001178:	00052783          	lw	a5,0(a0)
c000117c:	0017f693          	andi	a3,a5,1
c0001180:	04069e63          	bnez	a3,c00011dc <page_insert+0xa8>
c0001184:	00006697          	auipc	a3,0x6
c0001188:	2b06a683          	lw	a3,688(a3) # c0007434 <pages>
c000118c:	40d40433          	sub	s0,s0,a3
c0001190:	ccccd6b7          	lui	a3,0xccccd
c0001194:	ccd68693          	addi	a3,a3,-819 # cccccccd <sbi_remote_fence_i+0xccccd3dd>
c0001198:	40245413          	srai	s0,s0,0x2
c000119c:	02d40433          	mul	s0,s0,a3
c00011a0:	000806b7          	lui	a3,0x80
c00011a4:	00196913          	ori	s2,s2,1
c00011a8:	00d406b3          	add	a3,s0,a3
c00011ac:	00a69693          	slli	a3,a3,0xa
c00011b0:	0126e6b3          	or	a3,a3,s2
c00011b4:	00d4a023          	sw	a3,0(s1)
c00011b8:	10498073          	sfence.vm	s3
c00011bc:	00000513          	li	a0,0
c00011c0:	01c12083          	lw	ra,28(sp)
c00011c4:	01812403          	lw	s0,24(sp)
c00011c8:	01412483          	lw	s1,20(sp)
c00011cc:	01012903          	lw	s2,16(sp)
c00011d0:	00c12983          	lw	s3,12(sp)
c00011d4:	02010113          	addi	sp,sp,32
c00011d8:	00008067          	ret
c00011dc:	00279793          	slli	a5,a5,0x2
c00011e0:	00c7d793          	srli	a5,a5,0xc
c00011e4:	00006697          	auipc	a3,0x6
c00011e8:	2386a683          	lw	a3,568(a3) # c000741c <npage>
c00011ec:	06d7f463          	bleu	a3,a5,c0001254 <page_insert+0x120>
c00011f0:	fff806b7          	lui	a3,0xfff80
c00011f4:	00d787b3          	add	a5,a5,a3
c00011f8:	00279513          	slli	a0,a5,0x2
c00011fc:	00f50533          	add	a0,a0,a5
c0001200:	00006697          	auipc	a3,0x6
c0001204:	2346a683          	lw	a3,564(a3) # c0007434 <pages>
c0001208:	00251513          	slli	a0,a0,0x2
c000120c:	00a68533          	add	a0,a3,a0
c0001210:	00a40e63          	beq	s0,a0,c000122c <page_insert+0xf8>
c0001214:	00052783          	lw	a5,0(a0)
c0001218:	fff78793          	addi	a5,a5,-1
c000121c:	00f52023          	sw	a5,0(a0)
c0001220:	00078a63          	beqz	a5,c0001234 <page_insert+0x100>
c0001224:	10498073          	sfence.vm	s3
c0001228:	f65ff06f          	j	c000118c <page_insert+0x58>
c000122c:	00e42023          	sw	a4,0(s0)
c0001230:	f5dff06f          	j	c000118c <page_insert+0x58>
c0001234:	00100593          	li	a1,1
c0001238:	a75ff0ef          	jal	ra,c0000cac <free_pages>
c000123c:	00006697          	auipc	a3,0x6
c0001240:	1f86a683          	lw	a3,504(a3) # c0007434 <pages>
c0001244:	10498073          	sfence.vm	s3
c0001248:	f45ff06f          	j	c000118c <page_insert+0x58>
c000124c:	ffc00513          	li	a0,-4
c0001250:	f71ff06f          	j	c00011c0 <page_insert+0x8c>
c0001254:	9d9ff0ef          	jal	ra,c0000c2c <pa2page.part.6>

c0001258 <print_pgdir>:
c0001258:	fa010113          	addi	sp,sp,-96
c000125c:	00003517          	auipc	a0,0x3
c0001260:	11850513          	addi	a0,a0,280 # c0004374 <commands+0xb5c>
c0001264:	05212823          	sw	s2,80(sp)
c0001268:	04112e23          	sw	ra,92(sp)
c000126c:	04812c23          	sw	s0,88(sp)
c0001270:	04912a23          	sw	s1,84(sp)
c0001274:	05312623          	sw	s3,76(sp)
c0001278:	05412423          	sw	s4,72(sp)
c000127c:	05512223          	sw	s5,68(sp)
c0001280:	05612023          	sw	s6,64(sp)
c0001284:	03712e23          	sw	s7,60(sp)
c0001288:	03812c23          	sw	s8,56(sp)
c000128c:	03912a23          	sw	s9,52(sp)
c0001290:	03a12823          	sw	s10,48(sp)
c0001294:	03b12623          	sw	s11,44(sp)
c0001298:	e35fe0ef          	jal	ra,c00000cc <cprintf>
c000129c:	00000593          	li	a1,0
c00012a0:	00012a23          	sw	zero,20(sp)
c00012a4:	02d00913          	li	s2,45
c00012a8:	01410713          	addi	a4,sp,20
c00012ac:	01010693          	addi	a3,sp,16
c00012b0:	fafec637          	lui	a2,0xfafec
c00012b4:	40000513          	li	a0,1024
c00012b8:	8c9ff0ef          	jal	ra,c0000b80 <get_pgtable_items.isra.4.part.5>
c00012bc:	00050413          	mv	s0,a0
c00012c0:	08050263          	beqz	a0,c0001344 <print_pgdir+0xec>
c00012c4:	01412583          	lw	a1,20(sp)
c00012c8:	01012783          	lw	a5,16(sp)
c00012cc:	01047513          	andi	a0,s0,16
c00012d0:	01659693          	slli	a3,a1,0x16
c00012d4:	40f585b3          	sub	a1,a1,a5
c00012d8:	01679613          	slli	a2,a5,0x16
c00012dc:	01659713          	slli	a4,a1,0x16
c00012e0:	00090313          	mv	t1,s2
c00012e4:	00050463          	beqz	a0,c00012ec <print_pgdir+0x94>
c00012e8:	07500313          	li	t1,117
c00012ec:	00006b17          	auipc	s6,0x6
c00012f0:	134b0b13          	addi	s6,s6,308 # c0007420 <str.1474>
c00012f4:	07200793          	li	a5,114
c00012f8:	006b0023          	sb	t1,0(s6)
c00012fc:	00fb00a3          	sb	a5,1(s6)
c0001300:	00447793          	andi	a5,s0,4
c0001304:	00090313          	mv	t1,s2
c0001308:	00078463          	beqz	a5,c0001310 <print_pgdir+0xb8>
c000130c:	07700313          	li	t1,119
c0001310:	00006797          	auipc	a5,0x6
c0001314:	11078793          	addi	a5,a5,272 # c0007420 <str.1474>
c0001318:	00003517          	auipc	a0,0x3
c000131c:	09050513          	addi	a0,a0,144 # c00043a8 <commands+0xb90>
c0001320:	006b0123          	sb	t1,2(s6)
c0001324:	000b01a3          	sb	zero,3(s6)
c0001328:	da5fe0ef          	jal	ra,c00000cc <cprintf>
c000132c:	00f47413          	andi	s0,s0,15
c0001330:	00100793          	li	a5,1
c0001334:	04f40c63          	beq	s0,a5,c000138c <print_pgdir+0x134>
c0001338:	01412583          	lw	a1,20(sp)
c000133c:	3ff00793          	li	a5,1023
c0001340:	f6b7f4e3          	bleu	a1,a5,c00012a8 <print_pgdir+0x50>
c0001344:	00003517          	auipc	a0,0x3
c0001348:	0a850513          	addi	a0,a0,168 # c00043ec <commands+0xbd4>
c000134c:	d81fe0ef          	jal	ra,c00000cc <cprintf>
c0001350:	05c12083          	lw	ra,92(sp)
c0001354:	05812403          	lw	s0,88(sp)
c0001358:	05412483          	lw	s1,84(sp)
c000135c:	05012903          	lw	s2,80(sp)
c0001360:	04c12983          	lw	s3,76(sp)
c0001364:	04812a03          	lw	s4,72(sp)
c0001368:	04412a83          	lw	s5,68(sp)
c000136c:	04012b03          	lw	s6,64(sp)
c0001370:	03c12b83          	lw	s7,60(sp)
c0001374:	03812c03          	lw	s8,56(sp)
c0001378:	03412c83          	lw	s9,52(sp)
c000137c:	03012d03          	lw	s10,48(sp)
c0001380:	02c12d83          	lw	s11,44(sp)
c0001384:	06010113          	addi	sp,sp,96
c0001388:	00008067          	ret
c000138c:	01012783          	lw	a5,16(sp)
c0001390:	00000413          	li	s0,0
c0001394:	00a79c93          	slli	s9,a5,0xa
c0001398:	00c79313          	slli	t1,a5,0xc
c000139c:	00279d93          	slli	s11,a5,0x2
c00013a0:	00f12623          	sw	a5,12(sp)
c00013a4:	fafec7b7          	lui	a5,0xfafec
c00013a8:	01912e23          	sw	s9,28(sp)
c00013ac:	40600ab3          	neg	s5,t1
c00013b0:	400c8c93          	addi	s9,s9,1024
c00013b4:	00fd8db3          	add	s11,s11,a5
c00013b8:	0140006f          	j	c00013cc <print_pgdir+0x174>
c00013bc:	fffff7b7          	lui	a5,0xfffff
c00013c0:	00fa8ab3          	add	s5,s5,a5
c00013c4:	400c8c93          	addi	s9,s9,1024
c00013c8:	004d8d93          	addi	s11,s11,4
c00013cc:	01412583          	lw	a1,20(sp)
c00013d0:	00c12783          	lw	a5,12(sp)
c00013d4:	10b7fa63          	bleu	a1,a5,c00014e8 <print_pgdir+0x290>
c00013d8:	00178793          	addi	a5,a5,1 # fffff001 <sbi_remote_fence_i+0xfffff711>
c00013dc:	00f12623          	sw	a5,12(sp)
c00013e0:	000da783          	lw	a5,0(s11)
c00013e4:	fffff4b7          	lui	s1,0xfffff
c00013e8:	00006717          	auipc	a4,0x6
c00013ec:	03472703          	lw	a4,52(a4) # c000741c <npage>
c00013f0:	00279793          	slli	a5,a5,0x2
c00013f4:	0097f7b3          	and	a5,a5,s1
c00013f8:	00c7d693          	srli	a3,a5,0xc
c00013fc:	01c12583          	lw	a1,28(sp)
c0001400:	07700a13          	li	s4,119
c0001404:	00006997          	auipc	s3,0x6
c0001408:	01c98993          	addi	s3,s3,28 # c0007420 <str.1474>
c000140c:	0ae6fc63          	bleu	a4,a3,c00014c4 <print_pgdir+0x26c>
c0001410:	fb95f6e3          	bleu	s9,a1,c00013bc <print_pgdir+0x164>
c0001414:	00006697          	auipc	a3,0x6
c0001418:	0186a683          	lw	a3,24(a3) # c000742c <va_pa_offset>
c000141c:	00d787b3          	add	a5,a5,a3
c0001420:	01c10713          	addi	a4,sp,28
c0001424:	01810693          	addi	a3,sp,24
c0001428:	01578633          	add	a2,a5,s5
c000142c:	000c8513          	mv	a0,s9
c0001430:	f50ff0ef          	jal	ra,c0000b80 <get_pgtable_items.isra.4.part.5>
c0001434:	00050d13          	mv	s10,a0
c0001438:	f80502e3          	beqz	a0,c00013bc <print_pgdir+0x164>
c000143c:	0aa40263          	beq	s0,a0,c00014e0 <print_pgdir+0x288>
c0001440:	04040c63          	beqz	s0,c0001498 <print_pgdir+0x240>
c0001444:	417c05b3          	sub	a1,s8,s7
c0001448:	01047793          	andi	a5,s0,16
c000144c:	00cb9613          	slli	a2,s7,0xc
c0001450:	00cc1693          	slli	a3,s8,0xc
c0001454:	00c59713          	slli	a4,a1,0xc
c0001458:	00090513          	mv	a0,s2
c000145c:	00078463          	beqz	a5,c0001464 <print_pgdir+0x20c>
c0001460:	07500513          	li	a0,117
c0001464:	07200793          	li	a5,114
c0001468:	00ab0023          	sb	a0,0(s6)
c000146c:	00fb00a3          	sb	a5,1(s6)
c0001470:	00447413          	andi	s0,s0,4
c0001474:	000a0e13          	mv	t3,s4
c0001478:	00041463          	bnez	s0,c0001480 <print_pgdir+0x228>
c000147c:	00090e13          	mv	t3,s2
c0001480:	00098793          	mv	a5,s3
c0001484:	00003517          	auipc	a0,0x3
c0001488:	f4450513          	addi	a0,a0,-188 # c00043c8 <commands+0xbb0>
c000148c:	01cb0123          	sb	t3,2(s6)
c0001490:	000b01a3          	sb	zero,3(s6)
c0001494:	c39fe0ef          	jal	ra,c00000cc <cprintf>
c0001498:	01812b83          	lw	s7,24(sp)
c000149c:	01c12c03          	lw	s8,28(sp)
c00014a0:	000da783          	lw	a5,0(s11)
c00014a4:	00006717          	auipc	a4,0x6
c00014a8:	f7872703          	lw	a4,-136(a4) # c000741c <npage>
c00014ac:	000c0593          	mv	a1,s8
c00014b0:	00279793          	slli	a5,a5,0x2
c00014b4:	0097f7b3          	and	a5,a5,s1
c00014b8:	00c7d693          	srli	a3,a5,0xc
c00014bc:	000d0413          	mv	s0,s10
c00014c0:	f4e6e8e3          	bltu	a3,a4,c0001410 <print_pgdir+0x1b8>
c00014c4:	00078693          	mv	a3,a5
c00014c8:	00003617          	auipc	a2,0x3
c00014cc:	8c860613          	addi	a2,a2,-1848 # c0003d90 <commands+0x578>
c00014d0:	21900593          	li	a1,537
c00014d4:	00003517          	auipc	a0,0x3
c00014d8:	8e050513          	addi	a0,a0,-1824 # c0003db4 <commands+0x59c>
c00014dc:	d65fe0ef          	jal	ra,c0000240 <__panic>
c00014e0:	01c12c03          	lw	s8,28(sp)
c00014e4:	fbdff06f          	j	c00014a0 <print_pgdir+0x248>
c00014e8:	e4040ae3          	beqz	s0,c000133c <print_pgdir+0xe4>
c00014ec:	417c05b3          	sub	a1,s8,s7
c00014f0:	01047793          	andi	a5,s0,16
c00014f4:	00cb9613          	slli	a2,s7,0xc
c00014f8:	00cc1693          	slli	a3,s8,0xc
c00014fc:	00c59713          	slli	a4,a1,0xc
c0001500:	00090513          	mv	a0,s2
c0001504:	00078463          	beqz	a5,c000150c <print_pgdir+0x2b4>
c0001508:	07500513          	li	a0,117
c000150c:	07200793          	li	a5,114
c0001510:	00ab0023          	sb	a0,0(s6)
c0001514:	00fb00a3          	sb	a5,1(s6)
c0001518:	00447413          	andi	s0,s0,4
c000151c:	00090313          	mv	t1,s2
c0001520:	00040463          	beqz	s0,c0001528 <print_pgdir+0x2d0>
c0001524:	07700313          	li	t1,119
c0001528:	00006797          	auipc	a5,0x6
c000152c:	ef878793          	addi	a5,a5,-264 # c0007420 <str.1474>
c0001530:	00003517          	auipc	a0,0x3
c0001534:	e9850513          	addi	a0,a0,-360 # c00043c8 <commands+0xbb0>
c0001538:	006b0123          	sb	t1,2(s6)
c000153c:	000b01a3          	sb	zero,3(s6)
c0001540:	b8dfe0ef          	jal	ra,c00000cc <cprintf>
c0001544:	df5ff06f          	j	c0001338 <print_pgdir+0xe0>

c0001548 <pmm_init>:
c0001548:	fe010113          	addi	sp,sp,-32
c000154c:	00003597          	auipc	a1,0x3
c0001550:	2345a583          	lw	a1,564(a1) # c0004780 <default_pmm_manager>
c0001554:	00003797          	auipc	a5,0x3
c0001558:	22c78793          	addi	a5,a5,556 # c0004780 <default_pmm_manager>
c000155c:	00003517          	auipc	a0,0x3
c0001560:	89850513          	addi	a0,a0,-1896 # c0003df4 <commands+0x5dc>
c0001564:	00112e23          	sw	ra,28(sp)
c0001568:	00812c23          	sw	s0,24(sp)
c000156c:	00912a23          	sw	s1,20(sp)
c0001570:	01212823          	sw	s2,16(sp)
c0001574:	00006297          	auipc	t0,0x6
c0001578:	eaf2aa23          	sw	a5,-332(t0) # c0007428 <pmm_manager>
c000157c:	b51fe0ef          	jal	ra,c00000cc <cprintf>
c0001580:	00006797          	auipc	a5,0x6
c0001584:	ea87a783          	lw	a5,-344(a5) # c0007428 <pmm_manager>
c0001588:	0047a783          	lw	a5,4(a5)
c000158c:	000780e7          	jalr	a5
c0001590:	3fffe317          	auipc	t1,0x3fffe
c0001594:	270300e7          	jalr	624(t1) # fffff800 <sbi_hart_id>
c0001598:	00410593          	addi	a1,sp,4
c000159c:	3fffe317          	auipc	t1,0x3fffe
c00015a0:	284300e7          	jalr	644(t1) # fffff820 <sbi_query_memory>
c00015a4:	42051ce3          	bnez	a0,c00021dc <pmm_init+0xc94>
c00015a8:	00412483          	lw	s1,4(sp)
c00015ac:	00812903          	lw	s2,8(sp)
c00015b0:	c00007b7          	lui	a5,0xc0000
c00015b4:	409787b3          	sub	a5,a5,s1
c00015b8:	00003517          	auipc	a0,0x3
c00015bc:	88050513          	addi	a0,a0,-1920 # c0003e38 <commands+0x620>
c00015c0:	00006297          	auipc	t0,0x6
c00015c4:	e6f2a623          	sw	a5,-404(t0) # c000742c <va_pa_offset>
c00015c8:	01248433          	add	s0,s1,s2
c00015cc:	b01fe0ef          	jal	ra,c00000cc <cprintf>
c00015d0:	00048613          	mv	a2,s1
c00015d4:	fff40693          	addi	a3,s0,-1
c00015d8:	00090593          	mv	a1,s2
c00015dc:	00003517          	auipc	a0,0x3
c00015e0:	87450513          	addi	a0,a0,-1932 # c0003e50 <commands+0x638>
c00015e4:	ae9fe0ef          	jal	ra,c00000cc <cprintf>
c00015e8:	f80007b7          	lui	a5,0xf8000
c00015ec:	00040613          	mv	a2,s0
c00015f0:	0087f463          	bleu	s0,a5,c00015f8 <pmm_init+0xb0>
c00015f4:	00078613          	mv	a2,a5
c00015f8:	fffff737          	lui	a4,0xfffff
c00015fc:	00007797          	auipc	a5,0x7
c0001600:	e4778793          	addi	a5,a5,-441 # c0008443 <end+0xfff>
c0001604:	00c65613          	srli	a2,a2,0xc
c0001608:	00e7f7b3          	and	a5,a5,a4
c000160c:	00006297          	auipc	t0,0x6
c0001610:	e0c2a823          	sw	a2,-496(t0) # c000741c <npage>
c0001614:	00006297          	auipc	t0,0x6
c0001618:	e2f2a023          	sw	a5,-480(t0) # c0007434 <pages>
c000161c:	000805b7          	lui	a1,0x80
c0001620:	6eb60463          	beq	a2,a1,c0001d08 <pmm_init+0x7c0>
c0001624:	00060813          	mv	a6,a2
c0001628:	00000693          	li	a3,0
c000162c:	00000713          	li	a4,0
c0001630:	00078513          	mv	a0,a5
c0001634:	00100893          	li	a7,1
c0001638:	40b605b3          	sub	a1,a2,a1
c000163c:	0080006f          	j	c0001644 <pmm_init+0xfc>
c0001640:	00050793          	mv	a5,a0
c0001644:	00d787b3          	add	a5,a5,a3
c0001648:	00478793          	addi	a5,a5,4
c000164c:	4117a02f          	amoor.w	zero,a7,(a5)
c0001650:	00170713          	addi	a4,a4,1 # fffff001 <sbi_remote_fence_i+0xfffff711>
c0001654:	00080613          	mv	a2,a6
c0001658:	01468693          	addi	a3,a3,20
c000165c:	feb762e3          	bltu	a4,a1,c0001640 <pmm_init+0xf8>
c0001660:	00261693          	slli	a3,a2,0x2
c0001664:	00c686b3          	add	a3,a3,a2
c0001668:	00269693          	slli	a3,a3,0x2
c000166c:	ff6007b7          	lui	a5,0xff600
c0001670:	00d506b3          	add	a3,a0,a3
c0001674:	00f686b3          	add	a3,a3,a5
c0001678:	c00007b7          	lui	a5,0xc0000
c000167c:	70f6e863          	bltu	a3,a5,c0001d8c <pmm_init+0x844>
c0001680:	fffff5b7          	lui	a1,0xfffff
c0001684:	00006797          	auipc	a5,0x6
c0001688:	da87a783          	lw	a5,-600(a5) # c000742c <va_pa_offset>
c000168c:	40f686b3          	sub	a3,a3,a5
c0001690:	00b47433          	and	s0,s0,a1
c0001694:	0486f663          	bleu	s0,a3,c00016e0 <pmm_init+0x198>
c0001698:	000017b7          	lui	a5,0x1
c000169c:	fff78793          	addi	a5,a5,-1 # fff <BASE_ADDRESS-0xbffff001>
c00016a0:	00f686b3          	add	a3,a3,a5
c00016a4:	00c6d793          	srli	a5,a3,0xc
c00016a8:	0ec7fce3          	bleu	a2,a5,c0001fa0 <pmm_init+0xa58>
c00016ac:	fff80737          	lui	a4,0xfff80
c00016b0:	00e78733          	add	a4,a5,a4
c00016b4:	00271793          	slli	a5,a4,0x2
c00016b8:	00e787b3          	add	a5,a5,a4
c00016bc:	00006717          	auipc	a4,0x6
c00016c0:	d6c72703          	lw	a4,-660(a4) # c0007428 <pmm_manager>
c00016c4:	00b6f6b3          	and	a3,a3,a1
c00016c8:	00872703          	lw	a4,8(a4)
c00016cc:	40d406b3          	sub	a3,s0,a3
c00016d0:	00279793          	slli	a5,a5,0x2
c00016d4:	00c6d593          	srli	a1,a3,0xc
c00016d8:	00f50533          	add	a0,a0,a5
c00016dc:	000700e7          	jalr	a4
c00016e0:	00006797          	auipc	a5,0x6
c00016e4:	d487a783          	lw	a5,-696(a5) # c0007428 <pmm_manager>
c00016e8:	0187a783          	lw	a5,24(a5)
c00016ec:	000780e7          	jalr	a5
c00016f0:	00002517          	auipc	a0,0x2
c00016f4:	7ac50513          	addi	a0,a0,1964 # c0003e9c <commands+0x684>
c00016f8:	9d5fe0ef          	jal	ra,c00000cc <cprintf>
c00016fc:	00100513          	li	a0,1
c0001700:	d4cff0ef          	jal	ra,c0000c4c <alloc_pages>
c0001704:	0c050ce3          	beqz	a0,c0001fdc <pmm_init+0xa94>
c0001708:	00006797          	auipc	a5,0x6
c000170c:	d2c7a783          	lw	a5,-724(a5) # c0007434 <pages>
c0001710:	40f507b3          	sub	a5,a0,a5
c0001714:	ccccd737          	lui	a4,0xccccd
c0001718:	ccd70713          	addi	a4,a4,-819 # cccccccd <sbi_remote_fence_i+0xccccd3dd>
c000171c:	4027d793          	srai	a5,a5,0x2
c0001720:	02e787b3          	mul	a5,a5,a4
c0001724:	00080737          	lui	a4,0x80
c0001728:	00006697          	auipc	a3,0x6
c000172c:	cf46a683          	lw	a3,-780(a3) # c000741c <npage>
c0001730:	00e787b3          	add	a5,a5,a4
c0001734:	00100737          	lui	a4,0x100
c0001738:	fff70713          	addi	a4,a4,-1 # fffff <BASE_ADDRESS-0xbff00001>
c000173c:	00e7f733          	and	a4,a5,a4
c0001740:	00c79793          	slli	a5,a5,0xc
c0001744:	06d77ee3          	bleu	a3,a4,c0001fc0 <pmm_init+0xa78>
c0001748:	00006717          	auipc	a4,0x6
c000174c:	ce472703          	lw	a4,-796(a4) # c000742c <va_pa_offset>
c0001750:	00e787b3          	add	a5,a5,a4
c0001754:	00078513          	mv	a0,a5
c0001758:	00001637          	lui	a2,0x1
c000175c:	00000593          	li	a1,0
c0001760:	00006297          	auipc	t0,0x6
c0001764:	caf2ac23          	sw	a5,-840(t0) # c0007418 <boot_pgdir>
c0001768:	17d010ef          	jal	ra,c00030e4 <memset>
c000176c:	00006517          	auipc	a0,0x6
c0001770:	cac52503          	lw	a0,-852(a0) # c0007418 <boot_pgdir>
c0001774:	c00007b7          	lui	a5,0xc0000
c0001778:	02f566e3          	bltu	a0,a5,c0001fa4 <pmm_init+0xa5c>
c000177c:	00006797          	auipc	a5,0x6
c0001780:	cb07a783          	lw	a5,-848(a5) # c000742c <va_pa_offset>
c0001784:	40f507b3          	sub	a5,a0,a5
c0001788:	00006297          	auipc	t0,0x6
c000178c:	caf2a423          	sw	a5,-856(t0) # c0007430 <boot_cr3>
c0001790:	00006717          	auipc	a4,0x6
c0001794:	c8c72703          	lw	a4,-884(a4) # c000741c <npage>
c0001798:	000f87b7          	lui	a5,0xf8
c000179c:	2ae7ece3          	bltu	a5,a4,c0002254 <pmm_init+0xd0c>
c00017a0:	7e050063          	beqz	a0,c0001f80 <pmm_init+0xa38>
c00017a4:	01451793          	slli	a5,a0,0x14
c00017a8:	7c079c63          	bnez	a5,c0001f80 <pmm_init+0xa38>
c00017ac:	00000613          	li	a2,0
c00017b0:	00000593          	li	a1,0
c00017b4:	841ff0ef          	jal	ra,c0000ff4 <get_page>
c00017b8:	7a051463          	bnez	a0,c0001f60 <pmm_init+0xa18>
c00017bc:	00100513          	li	a0,1
c00017c0:	c8cff0ef          	jal	ra,c0000c4c <alloc_pages>
c00017c4:	00050493          	mv	s1,a0
c00017c8:	00050593          	mv	a1,a0
c00017cc:	00000693          	li	a3,0
c00017d0:	00000613          	li	a2,0
c00017d4:	00006517          	auipc	a0,0x6
c00017d8:	c4452503          	lw	a0,-956(a0) # c0007418 <boot_pgdir>
c00017dc:	959ff0ef          	jal	ra,c0001134 <page_insert>
c00017e0:	76051063          	bnez	a0,c0001f40 <pmm_init+0x9f8>
c00017e4:	00000613          	li	a2,0
c00017e8:	00000593          	li	a1,0
c00017ec:	00006517          	auipc	a0,0x6
c00017f0:	c2c52503          	lw	a0,-980(a0) # c0007418 <boot_pgdir>
c00017f4:	d74ff0ef          	jal	ra,c0000d68 <get_pte>
c00017f8:	060506e3          	beqz	a0,c0002064 <pmm_init+0xb1c>
c00017fc:	00052783          	lw	a5,0(a0)
c0001800:	0017f713          	andi	a4,a5,1
c0001804:	040704e3          	beqz	a4,c000204c <pmm_init+0xb04>
c0001808:	00279793          	slli	a5,a5,0x2
c000180c:	00c7d793          	srli	a5,a5,0xc
c0001810:	00006617          	auipc	a2,0x6
c0001814:	c0c62603          	lw	a2,-1012(a2) # c000741c <npage>
c0001818:	78c7f463          	bleu	a2,a5,c0001fa0 <pmm_init+0xa58>
c000181c:	fff80737          	lui	a4,0xfff80
c0001820:	00e787b3          	add	a5,a5,a4
c0001824:	00279713          	slli	a4,a5,0x2
c0001828:	00f707b3          	add	a5,a4,a5
c000182c:	00279793          	slli	a5,a5,0x2
c0001830:	00006717          	auipc	a4,0x6
c0001834:	c0472703          	lw	a4,-1020(a4) # c0007434 <pages>
c0001838:	00f707b3          	add	a5,a4,a5
c000183c:	7ef49863          	bne	s1,a5,c000202c <pmm_init+0xae4>
c0001840:	0004a903          	lw	s2,0(s1) # fffff000 <sbi_remote_fence_i+0xfffff710>
c0001844:	00100793          	li	a5,1
c0001848:	7cf91263          	bne	s2,a5,c000200c <pmm_init+0xac4>
c000184c:	00006517          	auipc	a0,0x6
c0001850:	bcc52503          	lw	a0,-1076(a0) # c0007418 <boot_pgdir>
c0001854:	00052683          	lw	a3,0(a0)
c0001858:	fffff7b7          	lui	a5,0xfffff
c000185c:	00269693          	slli	a3,a3,0x2
c0001860:	00f6f6b3          	and	a3,a3,a5
c0001864:	00c6d793          	srli	a5,a3,0xc
c0001868:	78c7f663          	bleu	a2,a5,c0001ff4 <pmm_init+0xaac>
c000186c:	00006417          	auipc	s0,0x6
c0001870:	bc042403          	lw	s0,-1088(s0) # c000742c <va_pa_offset>
c0001874:	008686b3          	add	a3,a3,s0
c0001878:	00000613          	li	a2,0
c000187c:	000015b7          	lui	a1,0x1
c0001880:	00468413          	addi	s0,a3,4
c0001884:	ce4ff0ef          	jal	ra,c0000d68 <get_pte>
c0001888:	02a41ee3          	bne	s0,a0,c00020c4 <pmm_init+0xb7c>
c000188c:	00090513          	mv	a0,s2
c0001890:	bbcff0ef          	jal	ra,c0000c4c <alloc_pages>
c0001894:	00050413          	mv	s0,a0
c0001898:	00050593          	mv	a1,a0
c000189c:	01400693          	li	a3,20
c00018a0:	00001637          	lui	a2,0x1
c00018a4:	00006517          	auipc	a0,0x6
c00018a8:	b7452503          	lw	a0,-1164(a0) # c0007418 <boot_pgdir>
c00018ac:	889ff0ef          	jal	ra,c0001134 <page_insert>
c00018b0:	7e051a63          	bnez	a0,c00020a4 <pmm_init+0xb5c>
c00018b4:	00000613          	li	a2,0
c00018b8:	000015b7          	lui	a1,0x1
c00018bc:	00006517          	auipc	a0,0x6
c00018c0:	b5c52503          	lw	a0,-1188(a0) # c0007418 <boot_pgdir>
c00018c4:	ca4ff0ef          	jal	ra,c0000d68 <get_pte>
c00018c8:	7a050e63          	beqz	a0,c0002084 <pmm_init+0xb3c>
c00018cc:	00052783          	lw	a5,0(a0)
c00018d0:	0107f713          	andi	a4,a5,16
c00018d4:	5c070663          	beqz	a4,c0001ea0 <pmm_init+0x958>
c00018d8:	0047f793          	andi	a5,a5,4
c00018dc:	5a078263          	beqz	a5,c0001e80 <pmm_init+0x938>
c00018e0:	00006517          	auipc	a0,0x6
c00018e4:	b3852503          	lw	a0,-1224(a0) # c0007418 <boot_pgdir>
c00018e8:	00052783          	lw	a5,0(a0)
c00018ec:	0107f793          	andi	a5,a5,16
c00018f0:	56078863          	beqz	a5,c0001e60 <pmm_init+0x918>
c00018f4:	00042903          	lw	s2,0(s0)
c00018f8:	00100793          	li	a5,1
c00018fc:	54f91263          	bne	s2,a5,c0001e40 <pmm_init+0x8f8>
c0001900:	00000693          	li	a3,0
c0001904:	00001637          	lui	a2,0x1
c0001908:	00048593          	mv	a1,s1
c000190c:	829ff0ef          	jal	ra,c0001134 <page_insert>
c0001910:	50051863          	bnez	a0,c0001e20 <pmm_init+0x8d8>
c0001914:	0004a703          	lw	a4,0(s1)
c0001918:	00200793          	li	a5,2
c000191c:	4ef71263          	bne	a4,a5,c0001e00 <pmm_init+0x8b8>
c0001920:	00042783          	lw	a5,0(s0)
c0001924:	4a079e63          	bnez	a5,c0001de0 <pmm_init+0x898>
c0001928:	00000613          	li	a2,0
c000192c:	000015b7          	lui	a1,0x1
c0001930:	00006517          	auipc	a0,0x6
c0001934:	ae852503          	lw	a0,-1304(a0) # c0007418 <boot_pgdir>
c0001938:	c30ff0ef          	jal	ra,c0000d68 <get_pte>
c000193c:	48050263          	beqz	a0,c0001dc0 <pmm_init+0x878>
c0001940:	00052703          	lw	a4,0(a0)
c0001944:	00177793          	andi	a5,a4,1
c0001948:	70078263          	beqz	a5,c000204c <pmm_init+0xb04>
c000194c:	00271793          	slli	a5,a4,0x2
c0001950:	00c7d793          	srli	a5,a5,0xc
c0001954:	00006697          	auipc	a3,0x6
c0001958:	ac86a683          	lw	a3,-1336(a3) # c000741c <npage>
c000195c:	64d7f263          	bleu	a3,a5,c0001fa0 <pmm_init+0xa58>
c0001960:	fff806b7          	lui	a3,0xfff80
c0001964:	00d787b3          	add	a5,a5,a3
c0001968:	00279693          	slli	a3,a5,0x2
c000196c:	00f687b3          	add	a5,a3,a5
c0001970:	00279793          	slli	a5,a5,0x2
c0001974:	00006697          	auipc	a3,0x6
c0001978:	ac06a683          	lw	a3,-1344(a3) # c0007434 <pages>
c000197c:	00f687b3          	add	a5,a3,a5
c0001980:	5af49063          	bne	s1,a5,c0001f20 <pmm_init+0x9d8>
c0001984:	01077713          	andi	a4,a4,16
c0001988:	56071c63          	bnez	a4,c0001f00 <pmm_init+0x9b8>
c000198c:	00000593          	li	a1,0
c0001990:	00006517          	auipc	a0,0x6
c0001994:	a8852503          	lw	a0,-1400(a0) # c0007418 <boot_pgdir>
c0001998:	ee8ff0ef          	jal	ra,c0001080 <page_remove>
c000199c:	0004a783          	lw	a5,0(s1)
c00019a0:	55279063          	bne	a5,s2,c0001ee0 <pmm_init+0x998>
c00019a4:	00042783          	lw	a5,0(s0)
c00019a8:	50079c63          	bnez	a5,c0001ec0 <pmm_init+0x978>
c00019ac:	000015b7          	lui	a1,0x1
c00019b0:	00006517          	auipc	a0,0x6
c00019b4:	a6852503          	lw	a0,-1432(a0) # c0007418 <boot_pgdir>
c00019b8:	ec8ff0ef          	jal	ra,c0001080 <page_remove>
c00019bc:	0004a783          	lw	a5,0(s1)
c00019c0:	3a079663          	bnez	a5,c0001d6c <pmm_init+0x824>
c00019c4:	00042783          	lw	a5,0(s0)
c00019c8:	7e079a63          	bnez	a5,c00021bc <pmm_init+0xc74>
c00019cc:	00006797          	auipc	a5,0x6
c00019d0:	a4c7a783          	lw	a5,-1460(a5) # c0007418 <boot_pgdir>
c00019d4:	0007a783          	lw	a5,0(a5)
c00019d8:	00006717          	auipc	a4,0x6
c00019dc:	a4472703          	lw	a4,-1468(a4) # c000741c <npage>
c00019e0:	00279793          	slli	a5,a5,0x2
c00019e4:	00c7d793          	srli	a5,a5,0xc
c00019e8:	5ae7fc63          	bleu	a4,a5,c0001fa0 <pmm_init+0xa58>
c00019ec:	fff80737          	lui	a4,0xfff80
c00019f0:	00e787b3          	add	a5,a5,a4
c00019f4:	00279713          	slli	a4,a5,0x2
c00019f8:	00f707b3          	add	a5,a4,a5
c00019fc:	00279793          	slli	a5,a5,0x2
c0001a00:	00006517          	auipc	a0,0x6
c0001a04:	a3452503          	lw	a0,-1484(a0) # c0007434 <pages>
c0001a08:	00f50533          	add	a0,a0,a5
c0001a0c:	00052583          	lw	a1,0(a0)
c0001a10:	00100793          	li	a5,1
c0001a14:	78f59463          	bne	a1,a5,c000219c <pmm_init+0xc54>
c0001a18:	a94ff0ef          	jal	ra,c0000cac <free_pages>
c0001a1c:	00006797          	auipc	a5,0x6
c0001a20:	9fc7a783          	lw	a5,-1540(a5) # c0007418 <boot_pgdir>
c0001a24:	0007a023          	sw	zero,0(a5)
c0001a28:	00002517          	auipc	a0,0x2
c0001a2c:	75c50513          	addi	a0,a0,1884 # c0004184 <commands+0x96c>
c0001a30:	e9cfe0ef          	jal	ra,c00000cc <cprintf>
c0001a34:	00006797          	auipc	a5,0x6
c0001a38:	9fc7a783          	lw	a5,-1540(a5) # c0007430 <boot_cr3>
c0001a3c:	00c7d793          	srli	a5,a5,0xc
c0001a40:	00006517          	auipc	a0,0x6
c0001a44:	9d852503          	lw	a0,-1576(a0) # c0007418 <boot_pgdir>
c0001a48:	00a79793          	slli	a5,a5,0xa
c0001a4c:	00001437          	lui	s0,0x1
c0001a50:	00850733          	add	a4,a0,s0
c0001a54:	0017e693          	ori	a3,a5,1
c0001a58:	c00005b7          	lui	a1,0xc0000
c0001a5c:	0077e793          	ori	a5,a5,7
c0001a60:	fad72623          	sw	a3,-84(a4) # fff7ffac <sbi_remote_fence_i+0xfff806bc>
c0001a64:	00006697          	auipc	a3,0x6
c0001a68:	9c86a683          	lw	a3,-1592(a3) # c000742c <va_pa_offset>
c0001a6c:	faf72823          	sw	a5,-80(a4)
c0001a70:	40d586b3          	sub	a3,a1,a3
c0001a74:	00f00713          	li	a4,15
c0001a78:	38000637          	lui	a2,0x38000
c0001a7c:	c6cff0ef          	jal	ra,c0000ee8 <boot_map_segment>
c0001a80:	180027f3          	csrr	a5,sptbr
c0001a84:	00100737          	lui	a4,0x100
c0001a88:	fff70713          	addi	a4,a4,-1 # fffff <BASE_ADDRESS-0xbff00001>
c0001a8c:	00e7f733          	and	a4,a5,a4
c0001a90:	00006697          	auipc	a3,0x6
c0001a94:	98c6a683          	lw	a3,-1652(a3) # c000741c <npage>
c0001a98:	00c79793          	slli	a5,a5,0xc
c0001a9c:	30d77463          	bleu	a3,a4,c0001da4 <pmm_init+0x85c>
c0001aa0:	00006517          	auipc	a0,0x6
c0001aa4:	98c52503          	lw	a0,-1652(a0) # c000742c <va_pa_offset>
c0001aa8:	00a78533          	add	a0,a5,a0
c0001aac:	00000613          	li	a2,0
c0001ab0:	fff00593          	li	a1,-1
c0001ab4:	ab4ff0ef          	jal	ra,c0000d68 <get_pte>
c0001ab8:	00052683          	lw	a3,0(a0)
c0001abc:	fffff4b7          	lui	s1,0xfffff
c0001ac0:	00b00713          	li	a4,11
c0001ac4:	00269693          	slli	a3,a3,0x2
c0001ac8:	0096f6b3          	and	a3,a3,s1
c0001acc:	00040613          	mv	a2,s0
c0001ad0:	00048593          	mv	a1,s1
c0001ad4:	00006517          	auipc	a0,0x6
c0001ad8:	94452503          	lw	a0,-1724(a0) # c0007418 <boot_pgdir>
c0001adc:	c0cff0ef          	jal	ra,c0000ee8 <boot_map_segment>
c0001ae0:	00006797          	auipc	a5,0x6
c0001ae4:	9507a783          	lw	a5,-1712(a5) # c0007430 <boot_cr3>
c0001ae8:	00c7d793          	srli	a5,a5,0xc
c0001aec:	18079073          	csrw	sptbr,a5
c0001af0:	00006797          	auipc	a5,0x6
c0001af4:	92c7a783          	lw	a5,-1748(a5) # c000741c <npage>
c0001af8:	000c0437          	lui	s0,0xc0
c0001afc:	00006517          	auipc	a0,0x6
c0001b00:	91c52503          	lw	a0,-1764(a0) # c0007418 <boot_pgdir>
c0001b04:	00f46c63          	bltu	s0,a5,c0001b1c <pmm_init+0x5d4>
c0001b08:	04c0006f          	j	c0001b54 <pmm_init+0x60c>
c0001b0c:	00c45793          	srli	a5,s0,0xc
c0001b10:	00006517          	auipc	a0,0x6
c0001b14:	90852503          	lw	a0,-1784(a0) # c0007418 <boot_pgdir>
c0001b18:	20e7fc63          	bleu	a4,a5,c0001d30 <pmm_init+0x7e8>
c0001b1c:	00006597          	auipc	a1,0x6
c0001b20:	9105a583          	lw	a1,-1776(a1) # c000742c <va_pa_offset>
c0001b24:	00000613          	li	a2,0
c0001b28:	00b405b3          	add	a1,s0,a1
c0001b2c:	a3cff0ef          	jal	ra,c0000d68 <get_pte>
c0001b30:	1e050063          	beqz	a0,c0001d10 <pmm_init+0x7c8>
c0001b34:	00052783          	lw	a5,0(a0)
c0001b38:	00279793          	slli	a5,a5,0x2
c0001b3c:	0097f7b3          	and	a5,a5,s1
c0001b40:	20879663          	bne	a5,s0,c0001d4c <pmm_init+0x804>
c0001b44:	00140413          	addi	s0,s0,1 # c0001 <BASE_ADDRESS-0xbff3ffff>
c0001b48:	00006717          	auipc	a4,0x6
c0001b4c:	8d472703          	lw	a4,-1836(a4) # c000741c <npage>
c0001b50:	fae46ee3          	bltu	s0,a4,c0001b0c <pmm_init+0x5c4>
c0001b54:	00006697          	auipc	a3,0x6
c0001b58:	8c46a683          	lw	a3,-1852(a3) # c0007418 <boot_pgdir>
c0001b5c:	000014b7          	lui	s1,0x1
c0001b60:	009687b3          	add	a5,a3,s1
c0001b64:	fac7a783          	lw	a5,-84(a5)
c0001b68:	fffff637          	lui	a2,0xfffff
c0001b6c:	c0000737          	lui	a4,0xc0000
c0001b70:	00279793          	slli	a5,a5,0x2
c0001b74:	00c7f7b3          	and	a5,a5,a2
c0001b78:	60e6e663          	bltu	a3,a4,c0002184 <pmm_init+0xc3c>
c0001b7c:	00006717          	auipc	a4,0x6
c0001b80:	8b072703          	lw	a4,-1872(a4) # c000742c <va_pa_offset>
c0001b84:	40e68733          	sub	a4,a3,a4
c0001b88:	5ce79e63          	bne	a5,a4,c0002164 <pmm_init+0xc1c>
c0001b8c:	0006a783          	lw	a5,0(a3)
c0001b90:	5a079a63          	bnez	a5,c0002144 <pmm_init+0xbfc>
c0001b94:	00100513          	li	a0,1
c0001b98:	8b4ff0ef          	jal	ra,c0000c4c <alloc_pages>
c0001b9c:	00050413          	mv	s0,a0
c0001ba0:	00050593          	mv	a1,a0
c0001ba4:	00600693          	li	a3,6
c0001ba8:	10000613          	li	a2,256
c0001bac:	00006517          	auipc	a0,0x6
c0001bb0:	86c52503          	lw	a0,-1940(a0) # c0007418 <boot_pgdir>
c0001bb4:	d80ff0ef          	jal	ra,c0001134 <page_insert>
c0001bb8:	56051663          	bnez	a0,c0002124 <pmm_init+0xbdc>
c0001bbc:	00042703          	lw	a4,0(s0)
c0001bc0:	00100793          	li	a5,1
c0001bc4:	54f71063          	bne	a4,a5,c0002104 <pmm_init+0xbbc>
c0001bc8:	00600693          	li	a3,6
c0001bcc:	10048613          	addi	a2,s1,256 # 1100 <BASE_ADDRESS-0xbfffef00>
c0001bd0:	00040593          	mv	a1,s0
c0001bd4:	00006517          	auipc	a0,0x6
c0001bd8:	84452503          	lw	a0,-1980(a0) # c0007418 <boot_pgdir>
c0001bdc:	d58ff0ef          	jal	ra,c0001134 <page_insert>
c0001be0:	50051263          	bnez	a0,c00020e4 <pmm_init+0xb9c>
c0001be4:	00042703          	lw	a4,0(s0)
c0001be8:	00200793          	li	a5,2
c0001bec:	64f71463          	bne	a4,a5,c0002234 <pmm_init+0xcec>
c0001bf0:	00000613          	li	a2,0
c0001bf4:	10000593          	li	a1,256
c0001bf8:	00006517          	auipc	a0,0x6
c0001bfc:	82052503          	lw	a0,-2016(a0) # c0007418 <boot_pgdir>
c0001c00:	968ff0ef          	jal	ra,c0000d68 <get_pte>
c0001c04:	00002597          	auipc	a1,0x2
c0001c08:	6dc58593          	addi	a1,a1,1756 # c00042e0 <commands+0xac8>
c0001c0c:	10000513          	li	a0,256
c0001c10:	458010ef          	jal	ra,c0003068 <strcpy>
c0001c14:	10048593          	addi	a1,s1,256
c0001c18:	10000513          	li	a0,256
c0001c1c:	468010ef          	jal	ra,c0003084 <strcmp>
c0001c20:	5e051a63          	bnez	a0,c0002214 <pmm_init+0xccc>
c0001c24:	00006797          	auipc	a5,0x6
c0001c28:	8107a783          	lw	a5,-2032(a5) # c0007434 <pages>
c0001c2c:	40f407b3          	sub	a5,s0,a5
c0001c30:	ccccd737          	lui	a4,0xccccd
c0001c34:	ccd70713          	addi	a4,a4,-819 # cccccccd <sbi_remote_fence_i+0xccccd3dd>
c0001c38:	4027d793          	srai	a5,a5,0x2
c0001c3c:	02e787b3          	mul	a5,a5,a4
c0001c40:	00080737          	lui	a4,0x80
c0001c44:	00005697          	auipc	a3,0x5
c0001c48:	7d86a683          	lw	a3,2008(a3) # c000741c <npage>
c0001c4c:	00e787b3          	add	a5,a5,a4
c0001c50:	00100737          	lui	a4,0x100
c0001c54:	fff70713          	addi	a4,a4,-1 # fffff <BASE_ADDRESS-0xbff00001>
c0001c58:	00e7f733          	and	a4,a5,a4
c0001c5c:	00c79793          	slli	a5,a5,0xc
c0001c60:	36d77063          	bleu	a3,a4,c0001fc0 <pmm_init+0xa78>
c0001c64:	00005717          	auipc	a4,0x5
c0001c68:	7c872703          	lw	a4,1992(a4) # c000742c <va_pa_offset>
c0001c6c:	00f707b3          	add	a5,a4,a5
c0001c70:	10078023          	sb	zero,256(a5)
c0001c74:	10000513          	li	a0,256
c0001c78:	384010ef          	jal	ra,c0002ffc <strlen>
c0001c7c:	56051c63          	bnez	a0,c00021f4 <pmm_init+0xcac>
c0001c80:	00100593          	li	a1,1
c0001c84:	00040513          	mv	a0,s0
c0001c88:	824ff0ef          	jal	ra,c0000cac <free_pages>
c0001c8c:	00005797          	auipc	a5,0x5
c0001c90:	78c7a783          	lw	a5,1932(a5) # c0007418 <boot_pgdir>
c0001c94:	0007a783          	lw	a5,0(a5)
c0001c98:	00005717          	auipc	a4,0x5
c0001c9c:	78472703          	lw	a4,1924(a4) # c000741c <npage>
c0001ca0:	00279793          	slli	a5,a5,0x2
c0001ca4:	00c7d793          	srli	a5,a5,0xc
c0001ca8:	2ee7fc63          	bleu	a4,a5,c0001fa0 <pmm_init+0xa58>
c0001cac:	fff80737          	lui	a4,0xfff80
c0001cb0:	00e787b3          	add	a5,a5,a4
c0001cb4:	00279713          	slli	a4,a5,0x2
c0001cb8:	00f707b3          	add	a5,a4,a5
c0001cbc:	00279793          	slli	a5,a5,0x2
c0001cc0:	00005517          	auipc	a0,0x5
c0001cc4:	77452503          	lw	a0,1908(a0) # c0007434 <pages>
c0001cc8:	00100593          	li	a1,1
c0001ccc:	00f50533          	add	a0,a0,a5
c0001cd0:	fddfe0ef          	jal	ra,c0000cac <free_pages>
c0001cd4:	00005797          	auipc	a5,0x5
c0001cd8:	7447a783          	lw	a5,1860(a5) # c0007418 <boot_pgdir>
c0001cdc:	0007a023          	sw	zero,0(a5)
c0001ce0:	00002517          	auipc	a0,0x2
c0001ce4:	67450513          	addi	a0,a0,1652 # c0004354 <commands+0xb3c>
c0001ce8:	be4fe0ef          	jal	ra,c00000cc <cprintf>
c0001cec:	d6cff0ef          	jal	ra,c0001258 <print_pgdir>
c0001cf0:	01c12083          	lw	ra,28(sp)
c0001cf4:	01812403          	lw	s0,24(sp)
c0001cf8:	01412483          	lw	s1,20(sp)
c0001cfc:	01012903          	lw	s2,16(sp)
c0001d00:	02010113          	addi	sp,sp,32
c0001d04:	00008067          	ret
c0001d08:	00078513          	mv	a0,a5
c0001d0c:	955ff06f          	j	c0001660 <pmm_init+0x118>
c0001d10:	00002697          	auipc	a3,0x2
c0001d14:	49068693          	addi	a3,a3,1168 # c00041a0 <commands+0x988>
c0001d18:	00002617          	auipc	a2,0x2
c0001d1c:	05060613          	addi	a2,a2,80 # c0003d68 <commands+0x550>
c0001d20:	1b900593          	li	a1,441
c0001d24:	00002517          	auipc	a0,0x2
c0001d28:	09050513          	addi	a0,a0,144 # c0003db4 <commands+0x59c>
c0001d2c:	d14fe0ef          	jal	ra,c0000240 <__panic>
c0001d30:	00040693          	mv	a3,s0
c0001d34:	00002617          	auipc	a2,0x2
c0001d38:	05c60613          	addi	a2,a2,92 # c0003d90 <commands+0x578>
c0001d3c:	1b900593          	li	a1,441
c0001d40:	00002517          	auipc	a0,0x2
c0001d44:	07450513          	addi	a0,a0,116 # c0003db4 <commands+0x59c>
c0001d48:	cf8fe0ef          	jal	ra,c0000240 <__panic>
c0001d4c:	00002697          	auipc	a3,0x2
c0001d50:	49468693          	addi	a3,a3,1172 # c00041e0 <commands+0x9c8>
c0001d54:	00002617          	auipc	a2,0x2
c0001d58:	01460613          	addi	a2,a2,20 # c0003d68 <commands+0x550>
c0001d5c:	1ba00593          	li	a1,442
c0001d60:	00002517          	auipc	a0,0x2
c0001d64:	05450513          	addi	a0,a0,84 # c0003db4 <commands+0x59c>
c0001d68:	cd8fe0ef          	jal	ra,c0000240 <__panic>
c0001d6c:	00002697          	auipc	a3,0x2
c0001d70:	3dc68693          	addi	a3,a3,988 # c0004148 <commands+0x930>
c0001d74:	00002617          	auipc	a2,0x2
c0001d78:	ff460613          	addi	a2,a2,-12 # c0003d68 <commands+0x550>
c0001d7c:	1aa00593          	li	a1,426
c0001d80:	00002517          	auipc	a0,0x2
c0001d84:	03450513          	addi	a0,a0,52 # c0003db4 <commands+0x59c>
c0001d88:	cb8fe0ef          	jal	ra,c0000240 <__panic>
c0001d8c:	00002617          	auipc	a2,0x2
c0001d90:	0ec60613          	addi	a2,a2,236 # c0003e78 <commands+0x660>
c0001d94:	08500593          	li	a1,133
c0001d98:	00002517          	auipc	a0,0x2
c0001d9c:	01c50513          	addi	a0,a0,28 # c0003db4 <commands+0x59c>
c0001da0:	ca0fe0ef          	jal	ra,c0000240 <__panic>
c0001da4:	00078693          	mv	a3,a5
c0001da8:	00002617          	auipc	a2,0x2
c0001dac:	fe860613          	addi	a2,a2,-24 # c0003d90 <commands+0x578>
c0001db0:	0df00593          	li	a1,223
c0001db4:	00002517          	auipc	a0,0x2
c0001db8:	00050513          	mv	a0,a0
c0001dbc:	c84fe0ef          	jal	ra,c0000240 <__panic>
c0001dc0:	00002697          	auipc	a3,0x2
c0001dc4:	2a068693          	addi	a3,a3,672 # c0004060 <commands+0x848>
c0001dc8:	00002617          	auipc	a2,0x2
c0001dcc:	fa060613          	addi	a2,a2,-96 # c0003d68 <commands+0x550>
c0001dd0:	1a100593          	li	a1,417
c0001dd4:	00002517          	auipc	a0,0x2
c0001dd8:	fe050513          	addi	a0,a0,-32 # c0003db4 <commands+0x59c>
c0001ddc:	c64fe0ef          	jal	ra,c0000240 <__panic>
c0001de0:	00002697          	auipc	a3,0x2
c0001de4:	33c68693          	addi	a3,a3,828 # c000411c <commands+0x904>
c0001de8:	00002617          	auipc	a2,0x2
c0001dec:	f8060613          	addi	a2,a2,-128 # c0003d68 <commands+0x550>
c0001df0:	1a000593          	li	a1,416
c0001df4:	00002517          	auipc	a0,0x2
c0001df8:	fc050513          	addi	a0,a0,-64 # c0003db4 <commands+0x59c>
c0001dfc:	c44fe0ef          	jal	ra,c0000240 <__panic>
c0001e00:	00002697          	auipc	a3,0x2
c0001e04:	30868693          	addi	a3,a3,776 # c0004108 <commands+0x8f0>
c0001e08:	00002617          	auipc	a2,0x2
c0001e0c:	f6060613          	addi	a2,a2,-160 # c0003d68 <commands+0x550>
c0001e10:	19f00593          	li	a1,415
c0001e14:	00002517          	auipc	a0,0x2
c0001e18:	fa050513          	addi	a0,a0,-96 # c0003db4 <commands+0x59c>
c0001e1c:	c24fe0ef          	jal	ra,c0000240 <__panic>
c0001e20:	00002697          	auipc	a3,0x2
c0001e24:	2bc68693          	addi	a3,a3,700 # c00040dc <commands+0x8c4>
c0001e28:	00002617          	auipc	a2,0x2
c0001e2c:	f4060613          	addi	a2,a2,-192 # c0003d68 <commands+0x550>
c0001e30:	19e00593          	li	a1,414
c0001e34:	00002517          	auipc	a0,0x2
c0001e38:	f8050513          	addi	a0,a0,-128 # c0003db4 <commands+0x59c>
c0001e3c:	c04fe0ef          	jal	ra,c0000240 <__panic>
c0001e40:	00002697          	auipc	a3,0x2
c0001e44:	28868693          	addi	a3,a3,648 # c00040c8 <commands+0x8b0>
c0001e48:	00002617          	auipc	a2,0x2
c0001e4c:	f2060613          	addi	a2,a2,-224 # c0003d68 <commands+0x550>
c0001e50:	19c00593          	li	a1,412
c0001e54:	00002517          	auipc	a0,0x2
c0001e58:	f6050513          	addi	a0,a0,-160 # c0003db4 <commands+0x59c>
c0001e5c:	be4fe0ef          	jal	ra,c0000240 <__panic>
c0001e60:	00002697          	auipc	a3,0x2
c0001e64:	25068693          	addi	a3,a3,592 # c00040b0 <commands+0x898>
c0001e68:	00002617          	auipc	a2,0x2
c0001e6c:	f0060613          	addi	a2,a2,-256 # c0003d68 <commands+0x550>
c0001e70:	19b00593          	li	a1,411
c0001e74:	00002517          	auipc	a0,0x2
c0001e78:	f4050513          	addi	a0,a0,-192 # c0003db4 <commands+0x59c>
c0001e7c:	bc4fe0ef          	jal	ra,c0000240 <__panic>
c0001e80:	00002697          	auipc	a3,0x2
c0001e84:	22068693          	addi	a3,a3,544 # c00040a0 <commands+0x888>
c0001e88:	00002617          	auipc	a2,0x2
c0001e8c:	ee060613          	addi	a2,a2,-288 # c0003d68 <commands+0x550>
c0001e90:	19a00593          	li	a1,410
c0001e94:	00002517          	auipc	a0,0x2
c0001e98:	f2050513          	addi	a0,a0,-224 # c0003db4 <commands+0x59c>
c0001e9c:	ba4fe0ef          	jal	ra,c0000240 <__panic>
c0001ea0:	00002697          	auipc	a3,0x2
c0001ea4:	1f068693          	addi	a3,a3,496 # c0004090 <commands+0x878>
c0001ea8:	00002617          	auipc	a2,0x2
c0001eac:	ec060613          	addi	a2,a2,-320 # c0003d68 <commands+0x550>
c0001eb0:	19900593          	li	a1,409
c0001eb4:	00002517          	auipc	a0,0x2
c0001eb8:	f0050513          	addi	a0,a0,-256 # c0003db4 <commands+0x59c>
c0001ebc:	b84fe0ef          	jal	ra,c0000240 <__panic>
c0001ec0:	00002697          	auipc	a3,0x2
c0001ec4:	25c68693          	addi	a3,a3,604 # c000411c <commands+0x904>
c0001ec8:	00002617          	auipc	a2,0x2
c0001ecc:	ea060613          	addi	a2,a2,-352 # c0003d68 <commands+0x550>
c0001ed0:	1a700593          	li	a1,423
c0001ed4:	00002517          	auipc	a0,0x2
c0001ed8:	ee050513          	addi	a0,a0,-288 # c0003db4 <commands+0x59c>
c0001edc:	b64fe0ef          	jal	ra,c0000240 <__panic>
c0001ee0:	00002697          	auipc	a3,0x2
c0001ee4:	10c68693          	addi	a3,a3,268 # c0003fec <commands+0x7d4>
c0001ee8:	00002617          	auipc	a2,0x2
c0001eec:	e8060613          	addi	a2,a2,-384 # c0003d68 <commands+0x550>
c0001ef0:	1a600593          	li	a1,422
c0001ef4:	00002517          	auipc	a0,0x2
c0001ef8:	ec050513          	addi	a0,a0,-320 # c0003db4 <commands+0x59c>
c0001efc:	b44fe0ef          	jal	ra,c0000240 <__panic>
c0001f00:	00002697          	auipc	a3,0x2
c0001f04:	23068693          	addi	a3,a3,560 # c0004130 <commands+0x918>
c0001f08:	00002617          	auipc	a2,0x2
c0001f0c:	e6060613          	addi	a2,a2,-416 # c0003d68 <commands+0x550>
c0001f10:	1a300593          	li	a1,419
c0001f14:	00002517          	auipc	a0,0x2
c0001f18:	ea050513          	addi	a0,a0,-352 # c0003db4 <commands+0x59c>
c0001f1c:	b24fe0ef          	jal	ra,c0000240 <__panic>
c0001f20:	00002697          	auipc	a3,0x2
c0001f24:	0b468693          	addi	a3,a3,180 # c0003fd4 <commands+0x7bc>
c0001f28:	00002617          	auipc	a2,0x2
c0001f2c:	e4060613          	addi	a2,a2,-448 # c0003d68 <commands+0x550>
c0001f30:	1a200593          	li	a1,418
c0001f34:	00002517          	auipc	a0,0x2
c0001f38:	e8050513          	addi	a0,a0,-384 # c0003db4 <commands+0x59c>
c0001f3c:	b04fe0ef          	jal	ra,c0000240 <__panic>
c0001f40:	00002697          	auipc	a3,0x2
c0001f44:	01468693          	addi	a3,a3,20 # c0003f54 <commands+0x73c>
c0001f48:	00002617          	auipc	a2,0x2
c0001f4c:	e2060613          	addi	a2,a2,-480 # c0003d68 <commands+0x550>
c0001f50:	18c00593          	li	a1,396
c0001f54:	00002517          	auipc	a0,0x2
c0001f58:	e6050513          	addi	a0,a0,-416 # c0003db4 <commands+0x59c>
c0001f5c:	ae4fe0ef          	jal	ra,c0000240 <__panic>
c0001f60:	00002697          	auipc	a3,0x2
c0001f64:	fcc68693          	addi	a3,a3,-52 # c0003f2c <commands+0x714>
c0001f68:	00002617          	auipc	a2,0x2
c0001f6c:	e0060613          	addi	a2,a2,-512 # c0003d68 <commands+0x550>
c0001f70:	18800593          	li	a1,392
c0001f74:	00002517          	auipc	a0,0x2
c0001f78:	e4050513          	addi	a0,a0,-448 # c0003db4 <commands+0x59c>
c0001f7c:	ac4fe0ef          	jal	ra,c0000240 <__panic>
c0001f80:	00002697          	auipc	a3,0x2
c0001f84:	f7468693          	addi	a3,a3,-140 # c0003ef4 <commands+0x6dc>
c0001f88:	00002617          	auipc	a2,0x2
c0001f8c:	de060613          	addi	a2,a2,-544 # c0003d68 <commands+0x550>
c0001f90:	18700593          	li	a1,391
c0001f94:	00002517          	auipc	a0,0x2
c0001f98:	e2050513          	addi	a0,a0,-480 # c0003db4 <commands+0x59c>
c0001f9c:	aa4fe0ef          	jal	ra,c0000240 <__panic>
c0001fa0:	c8dfe0ef          	jal	ra,c0000c2c <pa2page.part.6>
c0001fa4:	00050693          	mv	a3,a0
c0001fa8:	00002617          	auipc	a2,0x2
c0001fac:	ed060613          	addi	a2,a2,-304 # c0003e78 <commands+0x660>
c0001fb0:	0cb00593          	li	a1,203
c0001fb4:	00002517          	auipc	a0,0x2
c0001fb8:	e0050513          	addi	a0,a0,-512 # c0003db4 <commands+0x59c>
c0001fbc:	a84fe0ef          	jal	ra,c0000240 <__panic>
c0001fc0:	00078693          	mv	a3,a5
c0001fc4:	00002617          	auipc	a2,0x2
c0001fc8:	dcc60613          	addi	a2,a2,-564 # c0003d90 <commands+0x578>
c0001fcc:	06a00593          	li	a1,106
c0001fd0:	00002517          	auipc	a0,0x2
c0001fd4:	e1450513          	addi	a0,a0,-492 # c0003de4 <commands+0x5cc>
c0001fd8:	a68fe0ef          	jal	ra,c0000240 <__panic>
c0001fdc:	00002617          	auipc	a2,0x2
c0001fe0:	ee060613          	addi	a2,a2,-288 # c0003ebc <commands+0x6a4>
c0001fe4:	0ad00593          	li	a1,173
c0001fe8:	00002517          	auipc	a0,0x2
c0001fec:	dcc50513          	addi	a0,a0,-564 # c0003db4 <commands+0x59c>
c0001ff0:	a50fe0ef          	jal	ra,c0000240 <__panic>
c0001ff4:	00002617          	auipc	a2,0x2
c0001ff8:	d9c60613          	addi	a2,a2,-612 # c0003d90 <commands+0x578>
c0001ffc:	19300593          	li	a1,403
c0002000:	00002517          	auipc	a0,0x2
c0002004:	db450513          	addi	a0,a0,-588 # c0003db4 <commands+0x59c>
c0002008:	a38fe0ef          	jal	ra,c0000240 <__panic>
c000200c:	00002697          	auipc	a3,0x2
c0002010:	fe068693          	addi	a3,a3,-32 # c0003fec <commands+0x7d4>
c0002014:	00002617          	auipc	a2,0x2
c0002018:	d5460613          	addi	a2,a2,-684 # c0003d68 <commands+0x550>
c000201c:	19100593          	li	a1,401
c0002020:	00002517          	auipc	a0,0x2
c0002024:	d9450513          	addi	a0,a0,-620 # c0003db4 <commands+0x59c>
c0002028:	a18fe0ef          	jal	ra,c0000240 <__panic>
c000202c:	00002697          	auipc	a3,0x2
c0002030:	fa868693          	addi	a3,a3,-88 # c0003fd4 <commands+0x7bc>
c0002034:	00002617          	auipc	a2,0x2
c0002038:	d3460613          	addi	a2,a2,-716 # c0003d68 <commands+0x550>
c000203c:	19000593          	li	a1,400
c0002040:	00002517          	auipc	a0,0x2
c0002044:	d7450513          	addi	a0,a0,-652 # c0003db4 <commands+0x59c>
c0002048:	9f8fe0ef          	jal	ra,c0000240 <__panic>
c000204c:	00002617          	auipc	a2,0x2
c0002050:	f6460613          	addi	a2,a2,-156 # c0003fb0 <commands+0x798>
c0002054:	07000593          	li	a1,112
c0002058:	00002517          	auipc	a0,0x2
c000205c:	d8c50513          	addi	a0,a0,-628 # c0003de4 <commands+0x5cc>
c0002060:	9e0fe0ef          	jal	ra,c0000240 <__panic>
c0002064:	00002697          	auipc	a3,0x2
c0002068:	f1c68693          	addi	a3,a3,-228 # c0003f80 <commands+0x768>
c000206c:	00002617          	auipc	a2,0x2
c0002070:	cfc60613          	addi	a2,a2,-772 # c0003d68 <commands+0x550>
c0002074:	18f00593          	li	a1,399
c0002078:	00002517          	auipc	a0,0x2
c000207c:	d3c50513          	addi	a0,a0,-708 # c0003db4 <commands+0x59c>
c0002080:	9c0fe0ef          	jal	ra,c0000240 <__panic>
c0002084:	00002697          	auipc	a3,0x2
c0002088:	fdc68693          	addi	a3,a3,-36 # c0004060 <commands+0x848>
c000208c:	00002617          	auipc	a2,0x2
c0002090:	cdc60613          	addi	a2,a2,-804 # c0003d68 <commands+0x550>
c0002094:	19800593          	li	a1,408
c0002098:	00002517          	auipc	a0,0x2
c000209c:	d1c50513          	addi	a0,a0,-740 # c0003db4 <commands+0x59c>
c00020a0:	9a0fe0ef          	jal	ra,c0000240 <__panic>
c00020a4:	00002697          	auipc	a3,0x2
c00020a8:	f8468693          	addi	a3,a3,-124 # c0004028 <commands+0x810>
c00020ac:	00002617          	auipc	a2,0x2
c00020b0:	cbc60613          	addi	a2,a2,-836 # c0003d68 <commands+0x550>
c00020b4:	19700593          	li	a1,407
c00020b8:	00002517          	auipc	a0,0x2
c00020bc:	cfc50513          	addi	a0,a0,-772 # c0003db4 <commands+0x59c>
c00020c0:	980fe0ef          	jal	ra,c0000240 <__panic>
c00020c4:	00002697          	auipc	a3,0x2
c00020c8:	f3c68693          	addi	a3,a3,-196 # c0004000 <commands+0x7e8>
c00020cc:	00002617          	auipc	a2,0x2
c00020d0:	c9c60613          	addi	a2,a2,-868 # c0003d68 <commands+0x550>
c00020d4:	19400593          	li	a1,404
c00020d8:	00002517          	auipc	a0,0x2
c00020dc:	cdc50513          	addi	a0,a0,-804 # c0003db4 <commands+0x59c>
c00020e0:	960fe0ef          	jal	ra,c0000240 <__panic>
c00020e4:	00002697          	auipc	a3,0x2
c00020e8:	1a868693          	addi	a3,a3,424 # c000428c <commands+0xa74>
c00020ec:	00002617          	auipc	a2,0x2
c00020f0:	c7c60613          	addi	a2,a2,-900 # c0003d68 <commands+0x550>
c00020f4:	1c300593          	li	a1,451
c00020f8:	00002517          	auipc	a0,0x2
c00020fc:	cbc50513          	addi	a0,a0,-836 # c0003db4 <commands+0x59c>
c0002100:	940fe0ef          	jal	ra,c0000240 <__panic>
c0002104:	00002697          	auipc	a3,0x2
c0002108:	17468693          	addi	a3,a3,372 # c0004278 <commands+0xa60>
c000210c:	00002617          	auipc	a2,0x2
c0002110:	c5c60613          	addi	a2,a2,-932 # c0003d68 <commands+0x550>
c0002114:	1c200593          	li	a1,450
c0002118:	00002517          	auipc	a0,0x2
c000211c:	c9c50513          	addi	a0,a0,-868 # c0003db4 <commands+0x59c>
c0002120:	920fe0ef          	jal	ra,c0000240 <__panic>
c0002124:	00002697          	auipc	a3,0x2
c0002128:	11c68693          	addi	a3,a3,284 # c0004240 <commands+0xa28>
c000212c:	00002617          	auipc	a2,0x2
c0002130:	c3c60613          	addi	a2,a2,-964 # c0003d68 <commands+0x550>
c0002134:	1c100593          	li	a1,449
c0002138:	00002517          	auipc	a0,0x2
c000213c:	c7c50513          	addi	a0,a0,-900 # c0003db4 <commands+0x59c>
c0002140:	900fe0ef          	jal	ra,c0000240 <__panic>
c0002144:	00002697          	auipc	a3,0x2
c0002148:	0e868693          	addi	a3,a3,232 # c000422c <commands+0xa14>
c000214c:	00002617          	auipc	a2,0x2
c0002150:	c1c60613          	addi	a2,a2,-996 # c0003d68 <commands+0x550>
c0002154:	1be00593          	li	a1,446
c0002158:	00002517          	auipc	a0,0x2
c000215c:	c5c50513          	addi	a0,a0,-932 # c0003db4 <commands+0x59c>
c0002160:	8e0fe0ef          	jal	ra,c0000240 <__panic>
c0002164:	00002697          	auipc	a3,0x2
c0002168:	09468693          	addi	a3,a3,148 # c00041f8 <commands+0x9e0>
c000216c:	00002617          	auipc	a2,0x2
c0002170:	bfc60613          	addi	a2,a2,-1028 # c0003d68 <commands+0x550>
c0002174:	1bc00593          	li	a1,444
c0002178:	00002517          	auipc	a0,0x2
c000217c:	c3c50513          	addi	a0,a0,-964 # c0003db4 <commands+0x59c>
c0002180:	8c0fe0ef          	jal	ra,c0000240 <__panic>
c0002184:	00002617          	auipc	a2,0x2
c0002188:	cf460613          	addi	a2,a2,-780 # c0003e78 <commands+0x660>
c000218c:	1bc00593          	li	a1,444
c0002190:	00002517          	auipc	a0,0x2
c0002194:	c2450513          	addi	a0,a0,-988 # c0003db4 <commands+0x59c>
c0002198:	8a8fe0ef          	jal	ra,c0000240 <__panic>
c000219c:	00002697          	auipc	a3,0x2
c00021a0:	fc068693          	addi	a3,a3,-64 # c000415c <commands+0x944>
c00021a4:	00002617          	auipc	a2,0x2
c00021a8:	bc460613          	addi	a2,a2,-1084 # c0003d68 <commands+0x550>
c00021ac:	1ad00593          	li	a1,429
c00021b0:	00002517          	auipc	a0,0x2
c00021b4:	c0450513          	addi	a0,a0,-1020 # c0003db4 <commands+0x59c>
c00021b8:	888fe0ef          	jal	ra,c0000240 <__panic>
c00021bc:	00002697          	auipc	a3,0x2
c00021c0:	f6068693          	addi	a3,a3,-160 # c000411c <commands+0x904>
c00021c4:	00002617          	auipc	a2,0x2
c00021c8:	ba460613          	addi	a2,a2,-1116 # c0003d68 <commands+0x550>
c00021cc:	1ab00593          	li	a1,427
c00021d0:	00002517          	auipc	a0,0x2
c00021d4:	be450513          	addi	a0,a0,-1052 # c0003db4 <commands+0x59c>
c00021d8:	868fe0ef          	jal	ra,c0000240 <__panic>
c00021dc:	00002617          	auipc	a2,0x2
c00021e0:	c3060613          	addi	a2,a2,-976 # c0003e0c <commands+0x5f4>
c00021e4:	06600593          	li	a1,102
c00021e8:	00002517          	auipc	a0,0x2
c00021ec:	bcc50513          	addi	a0,a0,-1076 # c0003db4 <commands+0x59c>
c00021f0:	850fe0ef          	jal	ra,c0000240 <__panic>
c00021f4:	00002697          	auipc	a3,0x2
c00021f8:	13c68693          	addi	a3,a3,316 # c0004330 <commands+0xb18>
c00021fc:	00002617          	auipc	a2,0x2
c0002200:	b6c60613          	addi	a2,a2,-1172 # c0003d68 <commands+0x550>
c0002204:	1cc00593          	li	a1,460
c0002208:	00002517          	auipc	a0,0x2
c000220c:	bac50513          	addi	a0,a0,-1108 # c0003db4 <commands+0x59c>
c0002210:	830fe0ef          	jal	ra,c0000240 <__panic>
c0002214:	00002697          	auipc	a3,0x2
c0002218:	0e468693          	addi	a3,a3,228 # c00042f8 <commands+0xae0>
c000221c:	00002617          	auipc	a2,0x2
c0002220:	b4c60613          	addi	a2,a2,-1204 # c0003d68 <commands+0x550>
c0002224:	1c900593          	li	a1,457
c0002228:	00002517          	auipc	a0,0x2
c000222c:	b8c50513          	addi	a0,a0,-1140 # c0003db4 <commands+0x59c>
c0002230:	810fe0ef          	jal	ra,c0000240 <__panic>
c0002234:	00002697          	auipc	a3,0x2
c0002238:	09868693          	addi	a3,a3,152 # c00042cc <commands+0xab4>
c000223c:	00002617          	auipc	a2,0x2
c0002240:	b2c60613          	addi	a2,a2,-1236 # c0003d68 <commands+0x550>
c0002244:	1c400593          	li	a1,452
c0002248:	00002517          	auipc	a0,0x2
c000224c:	b6c50513          	addi	a0,a0,-1172 # c0003db4 <commands+0x59c>
c0002250:	ff1fd0ef          	jal	ra,c0000240 <__panic>
c0002254:	00002697          	auipc	a3,0x2
c0002258:	c8468693          	addi	a3,a3,-892 # c0003ed8 <commands+0x6c0>
c000225c:	00002617          	auipc	a2,0x2
c0002260:	b0c60613          	addi	a2,a2,-1268 # c0003d68 <commands+0x550>
c0002264:	18600593          	li	a1,390
c0002268:	00002517          	auipc	a0,0x2
c000226c:	b4c50513          	addi	a0,a0,-1204 # c0003db4 <commands+0x59c>
c0002270:	fd1fd0ef          	jal	ra,c0000240 <__panic>

c0002274 <default_init>:
c0002274:	00005797          	auipc	a5,0x5
c0002278:	1c478793          	addi	a5,a5,452 # c0007438 <free_area>
c000227c:	00f7a223          	sw	a5,4(a5)
c0002280:	00f7a023          	sw	a5,0(a5)
c0002284:	0007a423          	sw	zero,8(a5)
c0002288:	00008067          	ret

c000228c <default_nr_free_pages>:
c000228c:	00005517          	auipc	a0,0x5
c0002290:	1b452503          	lw	a0,436(a0) # c0007440 <free_area+0x8>
c0002294:	00008067          	ret

c0002298 <default_free_pages>:
c0002298:	ff010113          	addi	sp,sp,-16
c000229c:	00112623          	sw	ra,12(sp)
c00022a0:	20058e63          	beqz	a1,c00024bc <default_free_pages+0x224>
c00022a4:	00259693          	slli	a3,a1,0x2
c00022a8:	00b686b3          	add	a3,a3,a1
c00022ac:	00269693          	slli	a3,a3,0x2
c00022b0:	00d506b3          	add	a3,a0,a3
c00022b4:	04d50863          	beq	a0,a3,c0002304 <default_free_pages+0x6c>
c00022b8:	00452783          	lw	a5,4(a0)
c00022bc:	0017f793          	andi	a5,a5,1
c00022c0:	1c079e63          	bnez	a5,c000249c <default_free_pages+0x204>
c00022c4:	00452783          	lw	a5,4(a0)
c00022c8:	0017d793          	srli	a5,a5,0x1
c00022cc:	0017f793          	andi	a5,a5,1
c00022d0:	1c079663          	bnez	a5,c000249c <default_free_pages+0x204>
c00022d4:	00050793          	mv	a5,a0
c00022d8:	01c0006f          	j	c00022f4 <default_free_pages+0x5c>
c00022dc:	0047a703          	lw	a4,4(a5)
c00022e0:	00177713          	andi	a4,a4,1
c00022e4:	1a071c63          	bnez	a4,c000249c <default_free_pages+0x204>
c00022e8:	0047a703          	lw	a4,4(a5)
c00022ec:	00277713          	andi	a4,a4,2
c00022f0:	1a071663          	bnez	a4,c000249c <default_free_pages+0x204>
c00022f4:	0007a223          	sw	zero,4(a5)
c00022f8:	0007a023          	sw	zero,0(a5)
c00022fc:	01478793          	addi	a5,a5,20
c0002300:	fcd79ee3          	bne	a5,a3,c00022dc <default_free_pages+0x44>
c0002304:	00b52423          	sw	a1,8(a0)
c0002308:	00450313          	addi	t1,a0,4
c000230c:	00200793          	li	a5,2
c0002310:	40f3202f          	amoor.w	zero,a5,(t1)
c0002314:	00005797          	auipc	a5,0x5
c0002318:	12c7a783          	lw	a5,300(a5) # c0007440 <free_area+0x8>
c000231c:	00b785b3          	add	a1,a5,a1
c0002320:	00005697          	auipc	a3,0x5
c0002324:	11868693          	addi	a3,a3,280 # c0007438 <free_area>
c0002328:	00b6a423          	sw	a1,8(a3)
c000232c:	00005797          	auipc	a5,0x5
c0002330:	1107a783          	lw	a5,272(a5) # c000743c <free_area+0x4>
c0002334:	14d78463          	beq	a5,a3,c000247c <default_free_pages+0x1e4>
c0002338:	00005597          	auipc	a1,0x5
c000233c:	1005a583          	lw	a1,256(a1) # c0007438 <free_area>
c0002340:	00000813          	li	a6,0
c0002344:	00c50613          	addi	a2,a0,12
c0002348:	00100893          	li	a7,1
c000234c:	0080006f          	j	c0002354 <default_free_pages+0xbc>
c0002350:	00070793          	mv	a5,a4
c0002354:	ff478713          	addi	a4,a5,-12
c0002358:	02e56863          	bltu	a0,a4,c0002388 <default_free_pages+0xf0>
c000235c:	0047a703          	lw	a4,4(a5)
c0002360:	fed718e3          	bne	a4,a3,c0002350 <default_free_pages+0xb8>
c0002364:	00c7a223          	sw	a2,4(a5)
c0002368:	00d52823          	sw	a3,16(a0)
c000236c:	00f52623          	sw	a5,12(a0)
c0002370:	0047a783          	lw	a5,4(a5)
c0002374:	00060593          	mv	a1,a2
c0002378:	06d78c63          	beq	a5,a3,c00023f0 <default_free_pages+0x158>
c000237c:	ff478713          	addi	a4,a5,-12
c0002380:	00088813          	mv	a6,a7
c0002384:	fce57ce3          	bleu	a4,a0,c000235c <default_free_pages+0xc4>
c0002388:	14081a63          	bnez	a6,c00024dc <default_free_pages+0x244>
c000238c:	0007a583          	lw	a1,0(a5)
c0002390:	00c7a023          	sw	a2,0(a5)
c0002394:	00c5a223          	sw	a2,4(a1)
c0002398:	00f52823          	sw	a5,16(a0)
c000239c:	00b52623          	sw	a1,12(a0)
c00023a0:	08d58263          	beq	a1,a3,c0002424 <default_free_pages+0x18c>
c00023a4:	ffc5a703          	lw	a4,-4(a1)
c00023a8:	ff458613          	addi	a2,a1,-12
c00023ac:	00271793          	slli	a5,a4,0x2
c00023b0:	00e787b3          	add	a5,a5,a4
c00023b4:	00279793          	slli	a5,a5,0x2
c00023b8:	00f607b3          	add	a5,a2,a5
c00023bc:	04f51e63          	bne	a0,a5,c0002418 <default_free_pages+0x180>
c00023c0:	00852783          	lw	a5,8(a0)
c00023c4:	00e78733          	add	a4,a5,a4
c00023c8:	fee5ae23          	sw	a4,-4(a1)
c00023cc:	ffd00793          	li	a5,-3
c00023d0:	60f3202f          	amoand.w	zero,a5,(t1)
c00023d4:	00c52803          	lw	a6,12(a0)
c00023d8:	01052703          	lw	a4,16(a0)
c00023dc:	00060513          	mv	a0,a2
c00023e0:	00e82223          	sw	a4,4(a6)
c00023e4:	0045a783          	lw	a5,4(a1)
c00023e8:	01072023          	sw	a6,0(a4) # fff80000 <sbi_remote_fence_i+0xfff80710>
c00023ec:	0300006f          	j	c000241c <default_free_pages+0x184>
c00023f0:	00c52583          	lw	a1,12(a0)
c00023f4:	00c7a023          	sw	a2,0(a5)
c00023f8:	02f58263          	beq	a1,a5,c000241c <default_free_pages+0x184>
c00023fc:	ffc5a703          	lw	a4,-4(a1)
c0002400:	ff458613          	addi	a2,a1,-12
c0002404:	00271793          	slli	a5,a4,0x2
c0002408:	00e787b3          	add	a5,a5,a4
c000240c:	00279793          	slli	a5,a5,0x2
c0002410:	00f607b3          	add	a5,a2,a5
c0002414:	faf506e3          	beq	a0,a5,c00023c0 <default_free_pages+0x128>
c0002418:	01052783          	lw	a5,16(a0)
c000241c:	ff478713          	addi	a4,a5,-12
c0002420:	00d78e63          	beq	a5,a3,c000243c <default_free_pages+0x1a4>
c0002424:	00852603          	lw	a2,8(a0)
c0002428:	00261693          	slli	a3,a2,0x2
c000242c:	00c686b3          	add	a3,a3,a2
c0002430:	00269693          	slli	a3,a3,0x2
c0002434:	00d506b3          	add	a3,a0,a3
c0002438:	00d70863          	beq	a4,a3,c0002448 <default_free_pages+0x1b0>
c000243c:	00c12083          	lw	ra,12(sp)
c0002440:	01010113          	addi	sp,sp,16
c0002444:	00008067          	ret
c0002448:	ffc7a703          	lw	a4,-4(a5)
c000244c:	ff878693          	addi	a3,a5,-8
c0002450:	00c70633          	add	a2,a4,a2
c0002454:	00c52423          	sw	a2,8(a0)
c0002458:	ffd00713          	li	a4,-3
c000245c:	60e6a02f          	amoand.w	zero,a4,(a3)
c0002460:	0007a703          	lw	a4,0(a5)
c0002464:	0047a783          	lw	a5,4(a5)
c0002468:	00c12083          	lw	ra,12(sp)
c000246c:	01010113          	addi	sp,sp,16
c0002470:	00f72223          	sw	a5,4(a4)
c0002474:	00e7a023          	sw	a4,0(a5)
c0002478:	00008067          	ret
c000247c:	00c12083          	lw	ra,12(sp)
c0002480:	00c50713          	addi	a4,a0,12
c0002484:	00e7a023          	sw	a4,0(a5)
c0002488:	00e7a223          	sw	a4,4(a5)
c000248c:	00f52823          	sw	a5,16(a0)
c0002490:	00f52623          	sw	a5,12(a0)
c0002494:	01010113          	addi	sp,sp,16
c0002498:	00008067          	ret
c000249c:	00002697          	auipc	a3,0x2
c00024a0:	28c68693          	addi	a3,a3,652 # c0004728 <commands+0xf10>
c00024a4:	00002617          	auipc	a2,0x2
c00024a8:	8c460613          	addi	a2,a2,-1852 # c0003d68 <commands+0x550>
c00024ac:	08300593          	li	a1,131
c00024b0:	00002517          	auipc	a0,0x2
c00024b4:	2a050513          	addi	a0,a0,672 # c0004750 <commands+0xf38>
c00024b8:	d89fd0ef          	jal	ra,c0000240 <__panic>
c00024bc:	00002697          	auipc	a3,0x2
c00024c0:	2ac68693          	addi	a3,a3,684 # c0004768 <commands+0xf50>
c00024c4:	00002617          	auipc	a2,0x2
c00024c8:	8a460613          	addi	a2,a2,-1884 # c0003d68 <commands+0x550>
c00024cc:	08000593          	li	a1,128
c00024d0:	00002517          	auipc	a0,0x2
c00024d4:	28050513          	addi	a0,a0,640 # c0004750 <commands+0xf38>
c00024d8:	d69fd0ef          	jal	ra,c0000240 <__panic>
c00024dc:	00b6a023          	sw	a1,0(a3)
c00024e0:	eadff06f          	j	c000238c <default_free_pages+0xf4>

c00024e4 <default_init_memmap>:
c00024e4:	ff010113          	addi	sp,sp,-16
c00024e8:	00112623          	sw	ra,12(sp)
c00024ec:	14058263          	beqz	a1,c0002630 <default_init_memmap+0x14c>
c00024f0:	00259693          	slli	a3,a1,0x2
c00024f4:	00b686b3          	add	a3,a3,a1
c00024f8:	00269693          	slli	a3,a3,0x2
c00024fc:	00d506b3          	add	a3,a0,a3
c0002500:	02d50c63          	beq	a0,a3,c0002538 <default_init_memmap+0x54>
c0002504:	00452703          	lw	a4,4(a0)
c0002508:	00050793          	mv	a5,a0
c000250c:	00177713          	andi	a4,a4,1
c0002510:	00071a63          	bnez	a4,c0002524 <default_init_memmap+0x40>
c0002514:	0fc0006f          	j	c0002610 <default_init_memmap+0x12c>
c0002518:	0047a703          	lw	a4,4(a5)
c000251c:	00177713          	andi	a4,a4,1
c0002520:	0e070863          	beqz	a4,c0002610 <default_init_memmap+0x12c>
c0002524:	0007a423          	sw	zero,8(a5)
c0002528:	0007a223          	sw	zero,4(a5)
c000252c:	0007a023          	sw	zero,0(a5)
c0002530:	01478793          	addi	a5,a5,20
c0002534:	fed792e3          	bne	a5,a3,c0002518 <default_init_memmap+0x34>
c0002538:	00b52423          	sw	a1,8(a0)
c000253c:	00200793          	li	a5,2
c0002540:	00450713          	addi	a4,a0,4
c0002544:	40f7202f          	amoor.w	zero,a5,(a4)
c0002548:	00005797          	auipc	a5,0x5
c000254c:	ef87a783          	lw	a5,-264(a5) # c0007440 <free_area+0x8>
c0002550:	00b785b3          	add	a1,a5,a1
c0002554:	00005697          	auipc	a3,0x5
c0002558:	ee468693          	addi	a3,a3,-284 # c0007438 <free_area>
c000255c:	00b6a423          	sw	a1,8(a3)
c0002560:	00005797          	auipc	a5,0x5
c0002564:	edc7a783          	lw	a5,-292(a5) # c000743c <free_area+0x4>
c0002568:	08d78463          	beq	a5,a3,c00025f0 <default_init_memmap+0x10c>
c000256c:	00005597          	auipc	a1,0x5
c0002570:	ecc5a583          	lw	a1,-308(a1) # c0007438 <free_area>
c0002574:	00000813          	li	a6,0
c0002578:	00c50613          	addi	a2,a0,12
c000257c:	00100893          	li	a7,1
c0002580:	0080006f          	j	c0002588 <default_init_memmap+0xa4>
c0002584:	00070793          	mv	a5,a4
c0002588:	ff478713          	addi	a4,a5,-12
c000258c:	02e56863          	bltu	a0,a4,c00025bc <default_init_memmap+0xd8>
c0002590:	0047a703          	lw	a4,4(a5)
c0002594:	fed718e3          	bne	a4,a3,c0002584 <default_init_memmap+0xa0>
c0002598:	00c7a223          	sw	a2,4(a5)
c000259c:	00d52823          	sw	a3,16(a0)
c00025a0:	00f52623          	sw	a5,12(a0)
c00025a4:	0047a783          	lw	a5,4(a5)
c00025a8:	00060593          	mv	a1,a2
c00025ac:	02d78a63          	beq	a5,a3,c00025e0 <default_init_memmap+0xfc>
c00025b0:	ff478713          	addi	a4,a5,-12
c00025b4:	00088813          	mv	a6,a7
c00025b8:	fce57ce3          	bleu	a4,a0,c0002590 <default_init_memmap+0xac>
c00025bc:	08081a63          	bnez	a6,c0002650 <default_init_memmap+0x16c>
c00025c0:	0007a703          	lw	a4,0(a5)
c00025c4:	00c12083          	lw	ra,12(sp)
c00025c8:	00c7a023          	sw	a2,0(a5)
c00025cc:	00c72223          	sw	a2,4(a4)
c00025d0:	00f52823          	sw	a5,16(a0)
c00025d4:	00e52623          	sw	a4,12(a0)
c00025d8:	01010113          	addi	sp,sp,16
c00025dc:	00008067          	ret
c00025e0:	00c12083          	lw	ra,12(sp)
c00025e4:	00c7a023          	sw	a2,0(a5)
c00025e8:	01010113          	addi	sp,sp,16
c00025ec:	00008067          	ret
c00025f0:	00c12083          	lw	ra,12(sp)
c00025f4:	00c50713          	addi	a4,a0,12
c00025f8:	00e7a023          	sw	a4,0(a5)
c00025fc:	00e7a223          	sw	a4,4(a5)
c0002600:	00f52823          	sw	a5,16(a0)
c0002604:	00f52623          	sw	a5,12(a0)
c0002608:	01010113          	addi	sp,sp,16
c000260c:	00008067          	ret
c0002610:	00002697          	auipc	a3,0x2
c0002614:	16068693          	addi	a3,a3,352 # c0004770 <commands+0xf58>
c0002618:	00001617          	auipc	a2,0x1
c000261c:	75060613          	addi	a2,a2,1872 # c0003d68 <commands+0x550>
c0002620:	04900593          	li	a1,73
c0002624:	00002517          	auipc	a0,0x2
c0002628:	12c50513          	addi	a0,a0,300 # c0004750 <commands+0xf38>
c000262c:	c15fd0ef          	jal	ra,c0000240 <__panic>
c0002630:	00002697          	auipc	a3,0x2
c0002634:	13868693          	addi	a3,a3,312 # c0004768 <commands+0xf50>
c0002638:	00001617          	auipc	a2,0x1
c000263c:	73060613          	addi	a2,a2,1840 # c0003d68 <commands+0x550>
c0002640:	04600593          	li	a1,70
c0002644:	00002517          	auipc	a0,0x2
c0002648:	10c50513          	addi	a0,a0,268 # c0004750 <commands+0xf38>
c000264c:	bf5fd0ef          	jal	ra,c0000240 <__panic>
c0002650:	00b6a023          	sw	a1,0(a3)
c0002654:	f6dff06f          	j	c00025c0 <default_init_memmap+0xdc>

c0002658 <default_check>:
c0002658:	fd010113          	addi	sp,sp,-48
c000265c:	03212023          	sw	s2,32(sp)
c0002660:	02112623          	sw	ra,44(sp)
c0002664:	02812423          	sw	s0,40(sp)
c0002668:	02912223          	sw	s1,36(sp)
c000266c:	01312e23          	sw	s3,28(sp)
c0002670:	01412c23          	sw	s4,24(sp)
c0002674:	01512a23          	sw	s5,20(sp)
c0002678:	01612823          	sw	s6,16(sp)
c000267c:	01712623          	sw	s7,12(sp)
c0002680:	01812423          	sw	s8,8(sp)
c0002684:	01912223          	sw	s9,4(sp)
c0002688:	00005917          	auipc	s2,0x5
c000268c:	db090913          	addi	s2,s2,-592 # c0007438 <free_area>
c0002690:	00005797          	auipc	a5,0x5
c0002694:	dac7a783          	lw	a5,-596(a5) # c000743c <free_area+0x4>
c0002698:	3f278063          	beq	a5,s2,c0002a78 <default_check+0x420>
c000269c:	ff87a703          	lw	a4,-8(a5)
c00026a0:	00175713          	srli	a4,a4,0x1
c00026a4:	00177713          	andi	a4,a4,1
c00026a8:	3e070063          	beqz	a4,c0002a88 <default_check+0x430>
c00026ac:	00000413          	li	s0,0
c00026b0:	00000493          	li	s1,0
c00026b4:	0100006f          	j	c00026c4 <default_check+0x6c>
c00026b8:	ff87a703          	lw	a4,-8(a5)
c00026bc:	00277713          	andi	a4,a4,2
c00026c0:	3c070463          	beqz	a4,c0002a88 <default_check+0x430>
c00026c4:	ffc7a703          	lw	a4,-4(a5)
c00026c8:	0047a783          	lw	a5,4(a5)
c00026cc:	00148493          	addi	s1,s1,1
c00026d0:	00e40433          	add	s0,s0,a4
c00026d4:	00040993          	mv	s3,s0
c00026d8:	ff2790e3          	bne	a5,s2,c00026b8 <default_check+0x60>
c00026dc:	e34fe0ef          	jal	ra,c0000d10 <nr_free_pages>
c00026e0:	7ea99463          	bne	s3,a0,c0002ec8 <default_check+0x870>
c00026e4:	00100513          	li	a0,1
c00026e8:	d64fe0ef          	jal	ra,c0000c4c <alloc_pages>
c00026ec:	00050a13          	mv	s4,a0
c00026f0:	00050ce3          	beqz	a0,c0002f08 <default_check+0x8b0>
c00026f4:	00100513          	li	a0,1
c00026f8:	d54fe0ef          	jal	ra,c0000c4c <alloc_pages>
c00026fc:	00050993          	mv	s3,a0
c0002700:	7e050463          	beqz	a0,c0002ee8 <default_check+0x890>
c0002704:	00100513          	li	a0,1
c0002708:	d44fe0ef          	jal	ra,c0000c4c <alloc_pages>
c000270c:	00050a93          	mv	s5,a0
c0002710:	56050c63          	beqz	a0,c0002c88 <default_check+0x630>
c0002714:	3b3a0a63          	beq	s4,s3,c0002ac8 <default_check+0x470>
c0002718:	3aaa0863          	beq	s4,a0,c0002ac8 <default_check+0x470>
c000271c:	3aa98663          	beq	s3,a0,c0002ac8 <default_check+0x470>
c0002720:	000a2783          	lw	a5,0(s4) # 80000 <BASE_ADDRESS-0xbff80000>
c0002724:	38079263          	bnez	a5,c0002aa8 <default_check+0x450>
c0002728:	0009a783          	lw	a5,0(s3)
c000272c:	36079e63          	bnez	a5,c0002aa8 <default_check+0x450>
c0002730:	00052783          	lw	a5,0(a0)
c0002734:	36079a63          	bnez	a5,c0002aa8 <default_check+0x450>
c0002738:	00005797          	auipc	a5,0x5
c000273c:	cfc7a783          	lw	a5,-772(a5) # c0007434 <pages>
c0002740:	40fa0733          	sub	a4,s4,a5
c0002744:	ccccd637          	lui	a2,0xccccd
c0002748:	40275713          	srai	a4,a4,0x2
c000274c:	ccd60613          	addi	a2,a2,-819 # cccccccd <sbi_remote_fence_i+0xccccd3dd>
c0002750:	02c70733          	mul	a4,a4,a2
c0002754:	00005597          	auipc	a1,0x5
c0002758:	8ac5a583          	lw	a1,-1876(a1) # c0007000 <bootstacktop>
c000275c:	00005697          	auipc	a3,0x5
c0002760:	cc06a683          	lw	a3,-832(a3) # c000741c <npage>
c0002764:	00c69693          	slli	a3,a3,0xc
c0002768:	00b70733          	add	a4,a4,a1
c000276c:	00c71713          	slli	a4,a4,0xc
c0002770:	48d77c63          	bleu	a3,a4,c0002c08 <default_check+0x5b0>
c0002774:	40f98733          	sub	a4,s3,a5
c0002778:	40275713          	srai	a4,a4,0x2
c000277c:	02c70733          	mul	a4,a4,a2
c0002780:	00b70733          	add	a4,a4,a1
c0002784:	00c71713          	slli	a4,a4,0xc
c0002788:	40d77063          	bleu	a3,a4,c0002b88 <default_check+0x530>
c000278c:	40f507b3          	sub	a5,a0,a5
c0002790:	4027d793          	srai	a5,a5,0x2
c0002794:	02c787b3          	mul	a5,a5,a2
c0002798:	00b787b3          	add	a5,a5,a1
c000279c:	00c79793          	slli	a5,a5,0xc
c00027a0:	3cd7f463          	bleu	a3,a5,c0002b68 <default_check+0x510>
c00027a4:	00100513          	li	a0,1
c00027a8:	00005c17          	auipc	s8,0x5
c00027ac:	c90c2c03          	lw	s8,-880(s8) # c0007438 <free_area>
c00027b0:	00005b97          	auipc	s7,0x5
c00027b4:	c8cbab83          	lw	s7,-884(s7) # c000743c <free_area+0x4>
c00027b8:	00005b17          	auipc	s6,0x5
c00027bc:	c88b2b03          	lw	s6,-888(s6) # c0007440 <free_area+0x8>
c00027c0:	01292223          	sw	s2,4(s2)
c00027c4:	01292023          	sw	s2,0(s2)
c00027c8:	00092423          	sw	zero,8(s2)
c00027cc:	c80fe0ef          	jal	ra,c0000c4c <alloc_pages>
c00027d0:	36051c63          	bnez	a0,c0002b48 <default_check+0x4f0>
c00027d4:	00100593          	li	a1,1
c00027d8:	000a0513          	mv	a0,s4
c00027dc:	cd0fe0ef          	jal	ra,c0000cac <free_pages>
c00027e0:	00100593          	li	a1,1
c00027e4:	00098513          	mv	a0,s3
c00027e8:	cc4fe0ef          	jal	ra,c0000cac <free_pages>
c00027ec:	00100593          	li	a1,1
c00027f0:	000a8513          	mv	a0,s5
c00027f4:	cb8fe0ef          	jal	ra,c0000cac <free_pages>
c00027f8:	00005717          	auipc	a4,0x5
c00027fc:	c4872703          	lw	a4,-952(a4) # c0007440 <free_area+0x8>
c0002800:	00300793          	li	a5,3
c0002804:	32f71263          	bne	a4,a5,c0002b28 <default_check+0x4d0>
c0002808:	00100513          	li	a0,1
c000280c:	c40fe0ef          	jal	ra,c0000c4c <alloc_pages>
c0002810:	00050993          	mv	s3,a0
c0002814:	2c050a63          	beqz	a0,c0002ae8 <default_check+0x490>
c0002818:	00100513          	li	a0,1
c000281c:	c30fe0ef          	jal	ra,c0000c4c <alloc_pages>
c0002820:	00050a93          	mv	s5,a0
c0002824:	44050263          	beqz	a0,c0002c68 <default_check+0x610>
c0002828:	00100513          	li	a0,1
c000282c:	c20fe0ef          	jal	ra,c0000c4c <alloc_pages>
c0002830:	00050a13          	mv	s4,a0
c0002834:	40050a63          	beqz	a0,c0002c48 <default_check+0x5f0>
c0002838:	00100513          	li	a0,1
c000283c:	c10fe0ef          	jal	ra,c0000c4c <alloc_pages>
c0002840:	3e051463          	bnez	a0,c0002c28 <default_check+0x5d0>
c0002844:	00100593          	li	a1,1
c0002848:	00098513          	mv	a0,s3
c000284c:	c60fe0ef          	jal	ra,c0000cac <free_pages>
c0002850:	00005797          	auipc	a5,0x5
c0002854:	bec7a783          	lw	a5,-1044(a5) # c000743c <free_area+0x4>
c0002858:	2b278863          	beq	a5,s2,c0002b08 <default_check+0x4b0>
c000285c:	00100513          	li	a0,1
c0002860:	becfe0ef          	jal	ra,c0000c4c <alloc_pages>
c0002864:	38a99263          	bne	s3,a0,c0002be8 <default_check+0x590>
c0002868:	00100513          	li	a0,1
c000286c:	be0fe0ef          	jal	ra,c0000c4c <alloc_pages>
c0002870:	34051c63          	bnez	a0,c0002bc8 <default_check+0x570>
c0002874:	00005797          	auipc	a5,0x5
c0002878:	bcc7a783          	lw	a5,-1076(a5) # c0007440 <free_area+0x8>
c000287c:	32079663          	bnez	a5,c0002ba8 <default_check+0x550>
c0002880:	00098513          	mv	a0,s3
c0002884:	00100593          	li	a1,1
c0002888:	01892023          	sw	s8,0(s2)
c000288c:	01792223          	sw	s7,4(s2)
c0002890:	01692423          	sw	s6,8(s2)
c0002894:	c18fe0ef          	jal	ra,c0000cac <free_pages>
c0002898:	00100593          	li	a1,1
c000289c:	000a8513          	mv	a0,s5
c00028a0:	c0cfe0ef          	jal	ra,c0000cac <free_pages>
c00028a4:	00100593          	li	a1,1
c00028a8:	000a0513          	mv	a0,s4
c00028ac:	c00fe0ef          	jal	ra,c0000cac <free_pages>
c00028b0:	00500513          	li	a0,5
c00028b4:	b98fe0ef          	jal	ra,c0000c4c <alloc_pages>
c00028b8:	00050993          	mv	s3,a0
c00028bc:	44050663          	beqz	a0,c0002d08 <default_check+0x6b0>
c00028c0:	00452783          	lw	a5,4(a0)
c00028c4:	0017d793          	srli	a5,a5,0x1
c00028c8:	0017f793          	andi	a5,a5,1
c00028cc:	58079e63          	bnez	a5,c0002e68 <default_check+0x810>
c00028d0:	00100513          	li	a0,1
c00028d4:	00005b97          	auipc	s7,0x5
c00028d8:	b64bab83          	lw	s7,-1180(s7) # c0007438 <free_area>
c00028dc:	00005b17          	auipc	s6,0x5
c00028e0:	b60b2b03          	lw	s6,-1184(s6) # c000743c <free_area+0x4>
c00028e4:	01292023          	sw	s2,0(s2)
c00028e8:	01292223          	sw	s2,4(s2)
c00028ec:	b60fe0ef          	jal	ra,c0000c4c <alloc_pages>
c00028f0:	54051c63          	bnez	a0,c0002e48 <default_check+0x7f0>
c00028f4:	02898a93          	addi	s5,s3,40
c00028f8:	000a8513          	mv	a0,s5
c00028fc:	00300593          	li	a1,3
c0002900:	00005c17          	auipc	s8,0x5
c0002904:	b40c2c03          	lw	s8,-1216(s8) # c0007440 <free_area+0x8>
c0002908:	00092423          	sw	zero,8(s2)
c000290c:	ba0fe0ef          	jal	ra,c0000cac <free_pages>
c0002910:	00400513          	li	a0,4
c0002914:	b38fe0ef          	jal	ra,c0000c4c <alloc_pages>
c0002918:	50051863          	bnez	a0,c0002e28 <default_check+0x7d0>
c000291c:	02c9a783          	lw	a5,44(s3)
c0002920:	0017d793          	srli	a5,a5,0x1
c0002924:	0017f793          	andi	a5,a5,1
c0002928:	4e078063          	beqz	a5,c0002e08 <default_check+0x7b0>
c000292c:	0309a503          	lw	a0,48(s3)
c0002930:	00300793          	li	a5,3
c0002934:	4cf51a63          	bne	a0,a5,c0002e08 <default_check+0x7b0>
c0002938:	b14fe0ef          	jal	ra,c0000c4c <alloc_pages>
c000293c:	00050a13          	mv	s4,a0
c0002940:	4a050463          	beqz	a0,c0002de8 <default_check+0x790>
c0002944:	00100513          	li	a0,1
c0002948:	b04fe0ef          	jal	ra,c0000c4c <alloc_pages>
c000294c:	46051e63          	bnez	a0,c0002dc8 <default_check+0x770>
c0002950:	454a9c63          	bne	s5,s4,c0002da8 <default_check+0x750>
c0002954:	00100593          	li	a1,1
c0002958:	00098513          	mv	a0,s3
c000295c:	b50fe0ef          	jal	ra,c0000cac <free_pages>
c0002960:	00300593          	li	a1,3
c0002964:	000a8513          	mv	a0,s5
c0002968:	b44fe0ef          	jal	ra,c0000cac <free_pages>
c000296c:	0049a783          	lw	a5,4(s3)
c0002970:	01498c93          	addi	s9,s3,20
c0002974:	0017d793          	srli	a5,a5,0x1
c0002978:	0017f793          	andi	a5,a5,1
c000297c:	40078663          	beqz	a5,c0002d88 <default_check+0x730>
c0002980:	0089aa03          	lw	s4,8(s3)
c0002984:	00100793          	li	a5,1
c0002988:	40fa1063          	bne	s4,a5,c0002d88 <default_check+0x730>
c000298c:	02c9a783          	lw	a5,44(s3)
c0002990:	0017d793          	srli	a5,a5,0x1
c0002994:	0017f793          	andi	a5,a5,1
c0002998:	3c078863          	beqz	a5,c0002d68 <default_check+0x710>
c000299c:	0309a703          	lw	a4,48(s3)
c00029a0:	00300793          	li	a5,3
c00029a4:	3cf71263          	bne	a4,a5,c0002d68 <default_check+0x710>
c00029a8:	000a0513          	mv	a0,s4
c00029ac:	aa0fe0ef          	jal	ra,c0000c4c <alloc_pages>
c00029b0:	38a99c63          	bne	s3,a0,c0002d48 <default_check+0x6f0>
c00029b4:	000a0593          	mv	a1,s4
c00029b8:	af4fe0ef          	jal	ra,c0000cac <free_pages>
c00029bc:	00200513          	li	a0,2
c00029c0:	a8cfe0ef          	jal	ra,c0000c4c <alloc_pages>
c00029c4:	36aa9263          	bne	s5,a0,c0002d28 <default_check+0x6d0>
c00029c8:	00200593          	li	a1,2
c00029cc:	ae0fe0ef          	jal	ra,c0000cac <free_pages>
c00029d0:	000a0593          	mv	a1,s4
c00029d4:	000c8513          	mv	a0,s9
c00029d8:	ad4fe0ef          	jal	ra,c0000cac <free_pages>
c00029dc:	00500513          	li	a0,5
c00029e0:	a6cfe0ef          	jal	ra,c0000c4c <alloc_pages>
c00029e4:	00050993          	mv	s3,a0
c00029e8:	4a050063          	beqz	a0,c0002e88 <default_check+0x830>
c00029ec:	000a0513          	mv	a0,s4
c00029f0:	a5cfe0ef          	jal	ra,c0000c4c <alloc_pages>
c00029f4:	2e051a63          	bnez	a0,c0002ce8 <default_check+0x690>
c00029f8:	00005797          	auipc	a5,0x5
c00029fc:	a487a783          	lw	a5,-1464(a5) # c0007440 <free_area+0x8>
c0002a00:	2c079463          	bnez	a5,c0002cc8 <default_check+0x670>
c0002a04:	00500593          	li	a1,5
c0002a08:	00098513          	mv	a0,s3
c0002a0c:	01892423          	sw	s8,8(s2)
c0002a10:	01792023          	sw	s7,0(s2)
c0002a14:	01692223          	sw	s6,4(s2)
c0002a18:	a94fe0ef          	jal	ra,c0000cac <free_pages>
c0002a1c:	00005797          	auipc	a5,0x5
c0002a20:	a207a783          	lw	a5,-1504(a5) # c000743c <free_area+0x4>
c0002a24:	01278c63          	beq	a5,s2,c0002a3c <default_check+0x3e4>
c0002a28:	ffc7a703          	lw	a4,-4(a5)
c0002a2c:	0047a783          	lw	a5,4(a5)
c0002a30:	fff48493          	addi	s1,s1,-1
c0002a34:	40e40433          	sub	s0,s0,a4
c0002a38:	ff2798e3          	bne	a5,s2,c0002a28 <default_check+0x3d0>
c0002a3c:	26049663          	bnez	s1,c0002ca8 <default_check+0x650>
c0002a40:	46041463          	bnez	s0,c0002ea8 <default_check+0x850>
c0002a44:	02c12083          	lw	ra,44(sp)
c0002a48:	02812403          	lw	s0,40(sp)
c0002a4c:	02412483          	lw	s1,36(sp)
c0002a50:	02012903          	lw	s2,32(sp)
c0002a54:	01c12983          	lw	s3,28(sp)
c0002a58:	01812a03          	lw	s4,24(sp)
c0002a5c:	01412a83          	lw	s5,20(sp)
c0002a60:	01012b03          	lw	s6,16(sp)
c0002a64:	00c12b83          	lw	s7,12(sp)
c0002a68:	00812c03          	lw	s8,8(sp)
c0002a6c:	00412c83          	lw	s9,4(sp)
c0002a70:	03010113          	addi	sp,sp,48
c0002a74:	00008067          	ret
c0002a78:	00000993          	li	s3,0
c0002a7c:	00000413          	li	s0,0
c0002a80:	00000493          	li	s1,0
c0002a84:	c59ff06f          	j	c00026dc <default_check+0x84>
c0002a88:	00002697          	auipc	a3,0x2
c0002a8c:	99868693          	addi	a3,a3,-1640 # c0004420 <commands+0xc08>
c0002a90:	00001617          	auipc	a2,0x1
c0002a94:	2d860613          	addi	a2,a2,728 # c0003d68 <commands+0x550>
c0002a98:	0f000593          	li	a1,240
c0002a9c:	00002517          	auipc	a0,0x2
c0002aa0:	cb450513          	addi	a0,a0,-844 # c0004750 <commands+0xf38>
c0002aa4:	f9cfd0ef          	jal	ra,c0000240 <__panic>
c0002aa8:	00002697          	auipc	a3,0x2
c0002aac:	a1c68693          	addi	a3,a3,-1508 # c00044c4 <commands+0xcac>
c0002ab0:	00001617          	auipc	a2,0x1
c0002ab4:	2b860613          	addi	a2,a2,696 # c0003d68 <commands+0x550>
c0002ab8:	0be00593          	li	a1,190
c0002abc:	00002517          	auipc	a0,0x2
c0002ac0:	c9450513          	addi	a0,a0,-876 # c0004750 <commands+0xf38>
c0002ac4:	f7cfd0ef          	jal	ra,c0000240 <__panic>
c0002ac8:	00002697          	auipc	a3,0x2
c0002acc:	9d868693          	addi	a3,a3,-1576 # c00044a0 <commands+0xc88>
c0002ad0:	00001617          	auipc	a2,0x1
c0002ad4:	29860613          	addi	a2,a2,664 # c0003d68 <commands+0x550>
c0002ad8:	0bd00593          	li	a1,189
c0002adc:	00002517          	auipc	a0,0x2
c0002ae0:	c7450513          	addi	a0,a0,-908 # c0004750 <commands+0xf38>
c0002ae4:	f5cfd0ef          	jal	ra,c0000240 <__panic>
c0002ae8:	00002697          	auipc	a3,0x2
c0002aec:	96468693          	addi	a3,a3,-1692 # c000444c <commands+0xc34>
c0002af0:	00001617          	auipc	a2,0x1
c0002af4:	27860613          	addi	a2,a2,632 # c0003d68 <commands+0x550>
c0002af8:	0d200593          	li	a1,210
c0002afc:	00002517          	auipc	a0,0x2
c0002b00:	c5450513          	addi	a0,a0,-940 # c0004750 <commands+0xf38>
c0002b04:	f3cfd0ef          	jal	ra,c0000240 <__panic>
c0002b08:	00002697          	auipc	a3,0x2
c0002b0c:	a8068693          	addi	a3,a3,-1408 # c0004588 <commands+0xd70>
c0002b10:	00001617          	auipc	a2,0x1
c0002b14:	25860613          	addi	a2,a2,600 # c0003d68 <commands+0x550>
c0002b18:	0d900593          	li	a1,217
c0002b1c:	00002517          	auipc	a0,0x2
c0002b20:	c3450513          	addi	a0,a0,-972 # c0004750 <commands+0xf38>
c0002b24:	f1cfd0ef          	jal	ra,c0000240 <__panic>
c0002b28:	00002697          	auipc	a3,0x2
c0002b2c:	a5068693          	addi	a3,a3,-1456 # c0004578 <commands+0xd60>
c0002b30:	00001617          	auipc	a2,0x1
c0002b34:	23860613          	addi	a2,a2,568 # c0003d68 <commands+0x550>
c0002b38:	0d000593          	li	a1,208
c0002b3c:	00002517          	auipc	a0,0x2
c0002b40:	c1450513          	addi	a0,a0,-1004 # c0004750 <commands+0xf38>
c0002b44:	efcfd0ef          	jal	ra,c0000240 <__panic>
c0002b48:	00002697          	auipc	a3,0x2
c0002b4c:	a1868693          	addi	a3,a3,-1512 # c0004560 <commands+0xd48>
c0002b50:	00001617          	auipc	a2,0x1
c0002b54:	21860613          	addi	a2,a2,536 # c0003d68 <commands+0x550>
c0002b58:	0cb00593          	li	a1,203
c0002b5c:	00002517          	auipc	a0,0x2
c0002b60:	bf450513          	addi	a0,a0,-1036 # c0004750 <commands+0xf38>
c0002b64:	edcfd0ef          	jal	ra,c0000240 <__panic>
c0002b68:	00002697          	auipc	a3,0x2
c0002b6c:	9d868693          	addi	a3,a3,-1576 # c0004540 <commands+0xd28>
c0002b70:	00001617          	auipc	a2,0x1
c0002b74:	1f860613          	addi	a2,a2,504 # c0003d68 <commands+0x550>
c0002b78:	0c200593          	li	a1,194
c0002b7c:	00002517          	auipc	a0,0x2
c0002b80:	bd450513          	addi	a0,a0,-1068 # c0004750 <commands+0xf38>
c0002b84:	ebcfd0ef          	jal	ra,c0000240 <__panic>
c0002b88:	00002697          	auipc	a3,0x2
c0002b8c:	99868693          	addi	a3,a3,-1640 # c0004520 <commands+0xd08>
c0002b90:	00001617          	auipc	a2,0x1
c0002b94:	1d860613          	addi	a2,a2,472 # c0003d68 <commands+0x550>
c0002b98:	0c100593          	li	a1,193
c0002b9c:	00002517          	auipc	a0,0x2
c0002ba0:	bb450513          	addi	a0,a0,-1100 # c0004750 <commands+0xf38>
c0002ba4:	e9cfd0ef          	jal	ra,c0000240 <__panic>
c0002ba8:	00002697          	auipc	a3,0x2
c0002bac:	a1468693          	addi	a3,a3,-1516 # c00045bc <commands+0xda4>
c0002bb0:	00001617          	auipc	a2,0x1
c0002bb4:	1b860613          	addi	a2,a2,440 # c0003d68 <commands+0x550>
c0002bb8:	0df00593          	li	a1,223
c0002bbc:	00002517          	auipc	a0,0x2
c0002bc0:	b9450513          	addi	a0,a0,-1132 # c0004750 <commands+0xf38>
c0002bc4:	e7cfd0ef          	jal	ra,c0000240 <__panic>
c0002bc8:	00002697          	auipc	a3,0x2
c0002bcc:	99868693          	addi	a3,a3,-1640 # c0004560 <commands+0xd48>
c0002bd0:	00001617          	auipc	a2,0x1
c0002bd4:	19860613          	addi	a2,a2,408 # c0003d68 <commands+0x550>
c0002bd8:	0dd00593          	li	a1,221
c0002bdc:	00002517          	auipc	a0,0x2
c0002be0:	b7450513          	addi	a0,a0,-1164 # c0004750 <commands+0xf38>
c0002be4:	e5cfd0ef          	jal	ra,c0000240 <__panic>
c0002be8:	00002697          	auipc	a3,0x2
c0002bec:	9b868693          	addi	a3,a3,-1608 # c00045a0 <commands+0xd88>
c0002bf0:	00001617          	auipc	a2,0x1
c0002bf4:	17860613          	addi	a2,a2,376 # c0003d68 <commands+0x550>
c0002bf8:	0dc00593          	li	a1,220
c0002bfc:	00002517          	auipc	a0,0x2
c0002c00:	b5450513          	addi	a0,a0,-1196 # c0004750 <commands+0xf38>
c0002c04:	e3cfd0ef          	jal	ra,c0000240 <__panic>
c0002c08:	00002697          	auipc	a3,0x2
c0002c0c:	8f868693          	addi	a3,a3,-1800 # c0004500 <commands+0xce8>
c0002c10:	00001617          	auipc	a2,0x1
c0002c14:	15860613          	addi	a2,a2,344 # c0003d68 <commands+0x550>
c0002c18:	0c000593          	li	a1,192
c0002c1c:	00002517          	auipc	a0,0x2
c0002c20:	b3450513          	addi	a0,a0,-1228 # c0004750 <commands+0xf38>
c0002c24:	e1cfd0ef          	jal	ra,c0000240 <__panic>
c0002c28:	00002697          	auipc	a3,0x2
c0002c2c:	93868693          	addi	a3,a3,-1736 # c0004560 <commands+0xd48>
c0002c30:	00001617          	auipc	a2,0x1
c0002c34:	13860613          	addi	a2,a2,312 # c0003d68 <commands+0x550>
c0002c38:	0d600593          	li	a1,214
c0002c3c:	00002517          	auipc	a0,0x2
c0002c40:	b1450513          	addi	a0,a0,-1260 # c0004750 <commands+0xf38>
c0002c44:	dfcfd0ef          	jal	ra,c0000240 <__panic>
c0002c48:	00002697          	auipc	a3,0x2
c0002c4c:	83c68693          	addi	a3,a3,-1988 # c0004484 <commands+0xc6c>
c0002c50:	00001617          	auipc	a2,0x1
c0002c54:	11860613          	addi	a2,a2,280 # c0003d68 <commands+0x550>
c0002c58:	0d400593          	li	a1,212
c0002c5c:	00002517          	auipc	a0,0x2
c0002c60:	af450513          	addi	a0,a0,-1292 # c0004750 <commands+0xf38>
c0002c64:	ddcfd0ef          	jal	ra,c0000240 <__panic>
c0002c68:	00002697          	auipc	a3,0x2
c0002c6c:	80068693          	addi	a3,a3,-2048 # c0004468 <commands+0xc50>
c0002c70:	00001617          	auipc	a2,0x1
c0002c74:	0f860613          	addi	a2,a2,248 # c0003d68 <commands+0x550>
c0002c78:	0d300593          	li	a1,211
c0002c7c:	00002517          	auipc	a0,0x2
c0002c80:	ad450513          	addi	a0,a0,-1324 # c0004750 <commands+0xf38>
c0002c84:	dbcfd0ef          	jal	ra,c0000240 <__panic>
c0002c88:	00001697          	auipc	a3,0x1
c0002c8c:	7fc68693          	addi	a3,a3,2044 # c0004484 <commands+0xc6c>
c0002c90:	00001617          	auipc	a2,0x1
c0002c94:	0d860613          	addi	a2,a2,216 # c0003d68 <commands+0x550>
c0002c98:	0bb00593          	li	a1,187
c0002c9c:	00002517          	auipc	a0,0x2
c0002ca0:	ab450513          	addi	a0,a0,-1356 # c0004750 <commands+0xf38>
c0002ca4:	d9cfd0ef          	jal	ra,c0000240 <__panic>
c0002ca8:	00002697          	auipc	a3,0x2
c0002cac:	a6868693          	addi	a3,a3,-1432 # c0004710 <commands+0xef8>
c0002cb0:	00001617          	auipc	a2,0x1
c0002cb4:	0b860613          	addi	a2,a2,184 # c0003d68 <commands+0x550>
c0002cb8:	12500593          	li	a1,293
c0002cbc:	00002517          	auipc	a0,0x2
c0002cc0:	a9450513          	addi	a0,a0,-1388 # c0004750 <commands+0xf38>
c0002cc4:	d7cfd0ef          	jal	ra,c0000240 <__panic>
c0002cc8:	00002697          	auipc	a3,0x2
c0002ccc:	8f468693          	addi	a3,a3,-1804 # c00045bc <commands+0xda4>
c0002cd0:	00001617          	auipc	a2,0x1
c0002cd4:	09860613          	addi	a2,a2,152 # c0003d68 <commands+0x550>
c0002cd8:	11a00593          	li	a1,282
c0002cdc:	00002517          	auipc	a0,0x2
c0002ce0:	a7450513          	addi	a0,a0,-1420 # c0004750 <commands+0xf38>
c0002ce4:	d5cfd0ef          	jal	ra,c0000240 <__panic>
c0002ce8:	00002697          	auipc	a3,0x2
c0002cec:	87868693          	addi	a3,a3,-1928 # c0004560 <commands+0xd48>
c0002cf0:	00001617          	auipc	a2,0x1
c0002cf4:	07860613          	addi	a2,a2,120 # c0003d68 <commands+0x550>
c0002cf8:	11800593          	li	a1,280
c0002cfc:	00002517          	auipc	a0,0x2
c0002d00:	a5450513          	addi	a0,a0,-1452 # c0004750 <commands+0xf38>
c0002d04:	d3cfd0ef          	jal	ra,c0000240 <__panic>
c0002d08:	00002697          	auipc	a3,0x2
c0002d0c:	8c468693          	addi	a3,a3,-1852 # c00045cc <commands+0xdb4>
c0002d10:	00001617          	auipc	a2,0x1
c0002d14:	05860613          	addi	a2,a2,88 # c0003d68 <commands+0x550>
c0002d18:	0f800593          	li	a1,248
c0002d1c:	00002517          	auipc	a0,0x2
c0002d20:	a3450513          	addi	a0,a0,-1484 # c0004750 <commands+0xf38>
c0002d24:	d1cfd0ef          	jal	ra,c0000240 <__panic>
c0002d28:	00002697          	auipc	a3,0x2
c0002d2c:	9a868693          	addi	a3,a3,-1624 # c00046d0 <commands+0xeb8>
c0002d30:	00001617          	auipc	a2,0x1
c0002d34:	03860613          	addi	a2,a2,56 # c0003d68 <commands+0x550>
c0002d38:	11200593          	li	a1,274
c0002d3c:	00002517          	auipc	a0,0x2
c0002d40:	a1450513          	addi	a0,a0,-1516 # c0004750 <commands+0xf38>
c0002d44:	cfcfd0ef          	jal	ra,c0000240 <__panic>
c0002d48:	00002697          	auipc	a3,0x2
c0002d4c:	96868693          	addi	a3,a3,-1688 # c00046b0 <commands+0xe98>
c0002d50:	00001617          	auipc	a2,0x1
c0002d54:	01860613          	addi	a2,a2,24 # c0003d68 <commands+0x550>
c0002d58:	11000593          	li	a1,272
c0002d5c:	00002517          	auipc	a0,0x2
c0002d60:	9f450513          	addi	a0,a0,-1548 # c0004750 <commands+0xf38>
c0002d64:	cdcfd0ef          	jal	ra,c0000240 <__panic>
c0002d68:	00002697          	auipc	a3,0x2
c0002d6c:	92068693          	addi	a3,a3,-1760 # c0004688 <commands+0xe70>
c0002d70:	00001617          	auipc	a2,0x1
c0002d74:	ff860613          	addi	a2,a2,-8 # c0003d68 <commands+0x550>
c0002d78:	10e00593          	li	a1,270
c0002d7c:	00002517          	auipc	a0,0x2
c0002d80:	9d450513          	addi	a0,a0,-1580 # c0004750 <commands+0xf38>
c0002d84:	cbcfd0ef          	jal	ra,c0000240 <__panic>
c0002d88:	00002697          	auipc	a3,0x2
c0002d8c:	8d868693          	addi	a3,a3,-1832 # c0004660 <commands+0xe48>
c0002d90:	00001617          	auipc	a2,0x1
c0002d94:	fd860613          	addi	a2,a2,-40 # c0003d68 <commands+0x550>
c0002d98:	10d00593          	li	a1,269
c0002d9c:	00002517          	auipc	a0,0x2
c0002da0:	9b450513          	addi	a0,a0,-1612 # c0004750 <commands+0xf38>
c0002da4:	c9cfd0ef          	jal	ra,c0000240 <__panic>
c0002da8:	00002697          	auipc	a3,0x2
c0002dac:	8a868693          	addi	a3,a3,-1880 # c0004650 <commands+0xe38>
c0002db0:	00001617          	auipc	a2,0x1
c0002db4:	fb860613          	addi	a2,a2,-72 # c0003d68 <commands+0x550>
c0002db8:	10800593          	li	a1,264
c0002dbc:	00002517          	auipc	a0,0x2
c0002dc0:	99450513          	addi	a0,a0,-1644 # c0004750 <commands+0xf38>
c0002dc4:	c7cfd0ef          	jal	ra,c0000240 <__panic>
c0002dc8:	00001697          	auipc	a3,0x1
c0002dcc:	79868693          	addi	a3,a3,1944 # c0004560 <commands+0xd48>
c0002dd0:	00001617          	auipc	a2,0x1
c0002dd4:	f9860613          	addi	a2,a2,-104 # c0003d68 <commands+0x550>
c0002dd8:	10700593          	li	a1,263
c0002ddc:	00002517          	auipc	a0,0x2
c0002de0:	97450513          	addi	a0,a0,-1676 # c0004750 <commands+0xf38>
c0002de4:	c5cfd0ef          	jal	ra,c0000240 <__panic>
c0002de8:	00002697          	auipc	a3,0x2
c0002dec:	84868693          	addi	a3,a3,-1976 # c0004630 <commands+0xe18>
c0002df0:	00001617          	auipc	a2,0x1
c0002df4:	f7860613          	addi	a2,a2,-136 # c0003d68 <commands+0x550>
c0002df8:	10600593          	li	a1,262
c0002dfc:	00002517          	auipc	a0,0x2
c0002e00:	95450513          	addi	a0,a0,-1708 # c0004750 <commands+0xf38>
c0002e04:	c3cfd0ef          	jal	ra,c0000240 <__panic>
c0002e08:	00001697          	auipc	a3,0x1
c0002e0c:	7fc68693          	addi	a3,a3,2044 # c0004604 <commands+0xdec>
c0002e10:	00001617          	auipc	a2,0x1
c0002e14:	f5860613          	addi	a2,a2,-168 # c0003d68 <commands+0x550>
c0002e18:	10500593          	li	a1,261
c0002e1c:	00002517          	auipc	a0,0x2
c0002e20:	93450513          	addi	a0,a0,-1740 # c0004750 <commands+0xf38>
c0002e24:	c1cfd0ef          	jal	ra,c0000240 <__panic>
c0002e28:	00001697          	auipc	a3,0x1
c0002e2c:	7c468693          	addi	a3,a3,1988 # c00045ec <commands+0xdd4>
c0002e30:	00001617          	auipc	a2,0x1
c0002e34:	f3860613          	addi	a2,a2,-200 # c0003d68 <commands+0x550>
c0002e38:	10400593          	li	a1,260
c0002e3c:	00002517          	auipc	a0,0x2
c0002e40:	91450513          	addi	a0,a0,-1772 # c0004750 <commands+0xf38>
c0002e44:	bfcfd0ef          	jal	ra,c0000240 <__panic>
c0002e48:	00001697          	auipc	a3,0x1
c0002e4c:	71868693          	addi	a3,a3,1816 # c0004560 <commands+0xd48>
c0002e50:	00001617          	auipc	a2,0x1
c0002e54:	f1860613          	addi	a2,a2,-232 # c0003d68 <commands+0x550>
c0002e58:	0fe00593          	li	a1,254
c0002e5c:	00002517          	auipc	a0,0x2
c0002e60:	8f450513          	addi	a0,a0,-1804 # c0004750 <commands+0xf38>
c0002e64:	bdcfd0ef          	jal	ra,c0000240 <__panic>
c0002e68:	00001697          	auipc	a3,0x1
c0002e6c:	77068693          	addi	a3,a3,1904 # c00045d8 <commands+0xdc0>
c0002e70:	00001617          	auipc	a2,0x1
c0002e74:	ef860613          	addi	a2,a2,-264 # c0003d68 <commands+0x550>
c0002e78:	0f900593          	li	a1,249
c0002e7c:	00002517          	auipc	a0,0x2
c0002e80:	8d450513          	addi	a0,a0,-1836 # c0004750 <commands+0xf38>
c0002e84:	bbcfd0ef          	jal	ra,c0000240 <__panic>
c0002e88:	00002697          	auipc	a3,0x2
c0002e8c:	86868693          	addi	a3,a3,-1944 # c00046f0 <commands+0xed8>
c0002e90:	00001617          	auipc	a2,0x1
c0002e94:	ed860613          	addi	a2,a2,-296 # c0003d68 <commands+0x550>
c0002e98:	11700593          	li	a1,279
c0002e9c:	00002517          	auipc	a0,0x2
c0002ea0:	8b450513          	addi	a0,a0,-1868 # c0004750 <commands+0xf38>
c0002ea4:	b9cfd0ef          	jal	ra,c0000240 <__panic>
c0002ea8:	00002697          	auipc	a3,0x2
c0002eac:	87468693          	addi	a3,a3,-1932 # c000471c <commands+0xf04>
c0002eb0:	00001617          	auipc	a2,0x1
c0002eb4:	eb860613          	addi	a2,a2,-328 # c0003d68 <commands+0x550>
c0002eb8:	12600593          	li	a1,294
c0002ebc:	00002517          	auipc	a0,0x2
c0002ec0:	89450513          	addi	a0,a0,-1900 # c0004750 <commands+0xf38>
c0002ec4:	b7cfd0ef          	jal	ra,c0000240 <__panic>
c0002ec8:	00001697          	auipc	a3,0x1
c0002ecc:	56868693          	addi	a3,a3,1384 # c0004430 <commands+0xc18>
c0002ed0:	00001617          	auipc	a2,0x1
c0002ed4:	e9860613          	addi	a2,a2,-360 # c0003d68 <commands+0x550>
c0002ed8:	0f300593          	li	a1,243
c0002edc:	00002517          	auipc	a0,0x2
c0002ee0:	87450513          	addi	a0,a0,-1932 # c0004750 <commands+0xf38>
c0002ee4:	b5cfd0ef          	jal	ra,c0000240 <__panic>
c0002ee8:	00001697          	auipc	a3,0x1
c0002eec:	58068693          	addi	a3,a3,1408 # c0004468 <commands+0xc50>
c0002ef0:	00001617          	auipc	a2,0x1
c0002ef4:	e7860613          	addi	a2,a2,-392 # c0003d68 <commands+0x550>
c0002ef8:	0ba00593          	li	a1,186
c0002efc:	00002517          	auipc	a0,0x2
c0002f00:	85450513          	addi	a0,a0,-1964 # c0004750 <commands+0xf38>
c0002f04:	b3cfd0ef          	jal	ra,c0000240 <__panic>
c0002f08:	00001697          	auipc	a3,0x1
c0002f0c:	54468693          	addi	a3,a3,1348 # c000444c <commands+0xc34>
c0002f10:	00001617          	auipc	a2,0x1
c0002f14:	e5860613          	addi	a2,a2,-424 # c0003d68 <commands+0x550>
c0002f18:	0b900593          	li	a1,185
c0002f1c:	00002517          	auipc	a0,0x2
c0002f20:	83450513          	addi	a0,a0,-1996 # c0004750 <commands+0xf38>
c0002f24:	b1cfd0ef          	jal	ra,c0000240 <__panic>

c0002f28 <default_alloc_pages>:
c0002f28:	0a050663          	beqz	a0,c0002fd4 <default_alloc_pages+0xac>
c0002f2c:	00004817          	auipc	a6,0x4
c0002f30:	51482803          	lw	a6,1300(a6) # c0007440 <free_area+0x8>
c0002f34:	00050693          	mv	a3,a0
c0002f38:	00004617          	auipc	a2,0x4
c0002f3c:	50060613          	addi	a2,a2,1280 # c0007438 <free_area>
c0002f40:	00a86e63          	bltu	a6,a0,c0002f5c <default_alloc_pages+0x34>
c0002f44:	00060793          	mv	a5,a2
c0002f48:	00c0006f          	j	c0002f54 <default_alloc_pages+0x2c>
c0002f4c:	ffc7a703          	lw	a4,-4(a5)
c0002f50:	00d77a63          	bleu	a3,a4,c0002f64 <default_alloc_pages+0x3c>
c0002f54:	0047a783          	lw	a5,4(a5)
c0002f58:	fec79ae3          	bne	a5,a2,c0002f4c <default_alloc_pages+0x24>
c0002f5c:	00000513          	li	a0,0
c0002f60:	00008067          	ret
c0002f64:	ff478513          	addi	a0,a5,-12
c0002f68:	fe050ce3          	beqz	a0,c0002f60 <default_alloc_pages+0x38>
c0002f6c:	0007a883          	lw	a7,0(a5)
c0002f70:	0047a583          	lw	a1,4(a5)
c0002f74:	00b8a223          	sw	a1,4(a7)
c0002f78:	0115a023          	sw	a7,0(a1)
c0002f7c:	04e6f063          	bleu	a4,a3,c0002fbc <default_alloc_pages+0x94>
c0002f80:	00269593          	slli	a1,a3,0x2
c0002f84:	00d585b3          	add	a1,a1,a3
c0002f88:	00259593          	slli	a1,a1,0x2
c0002f8c:	00b505b3          	add	a1,a0,a1
c0002f90:	40d70733          	sub	a4,a4,a3
c0002f94:	00e5a423          	sw	a4,8(a1)
c0002f98:	00458313          	addi	t1,a1,4
c0002f9c:	00200713          	li	a4,2
c0002fa0:	40e3202f          	amoor.w	zero,a4,(t1)
c0002fa4:	0048a703          	lw	a4,4(a7)
c0002fa8:	00c58313          	addi	t1,a1,12
c0002fac:	00672023          	sw	t1,0(a4)
c0002fb0:	0068a223          	sw	t1,4(a7)
c0002fb4:	00e5a823          	sw	a4,16(a1)
c0002fb8:	0115a623          	sw	a7,12(a1)
c0002fbc:	40d806b3          	sub	a3,a6,a3
c0002fc0:	00d62423          	sw	a3,8(a2)
c0002fc4:	ffd00713          	li	a4,-3
c0002fc8:	ff878793          	addi	a5,a5,-8
c0002fcc:	60e7a02f          	amoand.w	zero,a4,(a5)
c0002fd0:	00008067          	ret
c0002fd4:	ff010113          	addi	sp,sp,-16
c0002fd8:	00001697          	auipc	a3,0x1
c0002fdc:	79068693          	addi	a3,a3,1936 # c0004768 <commands+0xf50>
c0002fe0:	00001617          	auipc	a2,0x1
c0002fe4:	d8860613          	addi	a2,a2,-632 # c0003d68 <commands+0x550>
c0002fe8:	06200593          	li	a1,98
c0002fec:	00001517          	auipc	a0,0x1
c0002ff0:	76450513          	addi	a0,a0,1892 # c0004750 <commands+0xf38>
c0002ff4:	00112623          	sw	ra,12(sp)
c0002ff8:	a48fd0ef          	jal	ra,c0000240 <__panic>

c0002ffc <strlen>:
c0002ffc:	00054703          	lbu	a4,0(a0)
c0003000:	00050693          	mv	a3,a0
c0003004:	00150793          	addi	a5,a0,1
c0003008:	00070c63          	beqz	a4,c0003020 <strlen+0x24>
c000300c:	40d78533          	sub	a0,a5,a3
c0003010:	00178793          	addi	a5,a5,1
c0003014:	fff7c703          	lbu	a4,-1(a5)
c0003018:	fe071ae3          	bnez	a4,c000300c <strlen+0x10>
c000301c:	00008067          	ret
c0003020:	00000513          	li	a0,0
c0003024:	00008067          	ret

c0003028 <strnlen>:
c0003028:	00050693          	mv	a3,a0
c000302c:	02058a63          	beqz	a1,c0003060 <strnlen+0x38>
c0003030:	00054703          	lbu	a4,0(a0)
c0003034:	00150793          	addi	a5,a0,1
c0003038:	02070463          	beqz	a4,c0003060 <strnlen+0x38>
c000303c:	00b505b3          	add	a1,a0,a1
c0003040:	0100006f          	j	c0003050 <strnlen+0x28>
c0003044:	00178793          	addi	a5,a5,1
c0003048:	fff7c703          	lbu	a4,-1(a5)
c000304c:	00070863          	beqz	a4,c000305c <strnlen+0x34>
c0003050:	40d78533          	sub	a0,a5,a3
c0003054:	feb798e3          	bne	a5,a1,c0003044 <strnlen+0x1c>
c0003058:	00008067          	ret
c000305c:	00008067          	ret
c0003060:	00000513          	li	a0,0
c0003064:	00008067          	ret

c0003068 <strcpy>:
c0003068:	00050793          	mv	a5,a0
c000306c:	00158593          	addi	a1,a1,1
c0003070:	fff5c703          	lbu	a4,-1(a1)
c0003074:	00178793          	addi	a5,a5,1
c0003078:	fee78fa3          	sb	a4,-1(a5)
c000307c:	fe0718e3          	bnez	a4,c000306c <strcpy+0x4>
c0003080:	00008067          	ret

c0003084 <strcmp>:
c0003084:	00054783          	lbu	a5,0(a0)
c0003088:	0005c703          	lbu	a4,0(a1)
c000308c:	02078263          	beqz	a5,c00030b0 <strcmp+0x2c>
c0003090:	02e79063          	bne	a5,a4,c00030b0 <strcmp+0x2c>
c0003094:	00150513          	addi	a0,a0,1
c0003098:	00054783          	lbu	a5,0(a0)
c000309c:	00158693          	addi	a3,a1,1
c00030a0:	0015c703          	lbu	a4,1(a1)
c00030a4:	00078663          	beqz	a5,c00030b0 <strcmp+0x2c>
c00030a8:	00068593          	mv	a1,a3
c00030ac:	fee784e3          	beq	a5,a4,c0003094 <strcmp+0x10>
c00030b0:	40e78533          	sub	a0,a5,a4
c00030b4:	00008067          	ret

c00030b8 <strchr>:
c00030b8:	00054783          	lbu	a5,0(a0)
c00030bc:	00078e63          	beqz	a5,c00030d8 <strchr+0x20>
c00030c0:	00f59663          	bne	a1,a5,c00030cc <strchr+0x14>
c00030c4:	01c0006f          	j	c00030e0 <strchr+0x28>
c00030c8:	00b78a63          	beq	a5,a1,c00030dc <strchr+0x24>
c00030cc:	00150513          	addi	a0,a0,1
c00030d0:	00054783          	lbu	a5,0(a0)
c00030d4:	fe079ae3          	bnez	a5,c00030c8 <strchr+0x10>
c00030d8:	00000513          	li	a0,0
c00030dc:	00008067          	ret
c00030e0:	00008067          	ret

c00030e4 <memset>:
c00030e4:	00c50733          	add	a4,a0,a2
c00030e8:	00050793          	mv	a5,a0
c00030ec:	00060863          	beqz	a2,c00030fc <memset+0x18>
c00030f0:	00178793          	addi	a5,a5,1
c00030f4:	feb78fa3          	sb	a1,-1(a5)
c00030f8:	fef71ce3          	bne	a4,a5,c00030f0 <memset+0xc>
c00030fc:	00008067          	ret

c0003100 <printnum>:
c0003100:	fe010113          	addi	sp,sp,-32
c0003104:	00912a23          	sw	s1,20(sp)
c0003108:	01212823          	sw	s2,16(sp)
c000310c:	01312623          	sw	s3,12(sp)
c0003110:	01412423          	sw	s4,8(sp)
c0003114:	00112e23          	sw	ra,28(sp)
c0003118:	00812c23          	sw	s0,24(sp)
c000311c:	00050493          	mv	s1,a0
c0003120:	00058913          	mv	s2,a1
c0003124:	00080993          	mv	s3,a6
c0003128:	02e67a33          	remu	s4,a2,a4
c000312c:	04069e63          	bnez	a3,c0003188 <printnum+0x88>
c0003130:	04e67c63          	bleu	a4,a2,c0003188 <printnum+0x88>
c0003134:	fff78413          	addi	s0,a5,-1
c0003138:	00805c63          	blez	s0,c0003150 <printnum+0x50>
c000313c:	fff40413          	addi	s0,s0,-1
c0003140:	00090593          	mv	a1,s2
c0003144:	00098513          	mv	a0,s3
c0003148:	000480e7          	jalr	s1
c000314c:	fe0418e3          	bnez	s0,c000313c <printnum+0x3c>
c0003150:	00001797          	auipc	a5,0x1
c0003154:	7d478793          	addi	a5,a5,2004 # c0004924 <error_string+0x1c>
c0003158:	014787b3          	add	a5,a5,s4
c000315c:	00090593          	mv	a1,s2
c0003160:	00048313          	mv	t1,s1
c0003164:	01c12083          	lw	ra,28(sp)
c0003168:	01812403          	lw	s0,24(sp)
c000316c:	01412483          	lw	s1,20(sp)
c0003170:	01012903          	lw	s2,16(sp)
c0003174:	00c12983          	lw	s3,12(sp)
c0003178:	00812a03          	lw	s4,8(sp)
c000317c:	0007c503          	lbu	a0,0(a5)
c0003180:	02010113          	addi	sp,sp,32
c0003184:	00030067          	jr	t1
c0003188:	02e65633          	divu	a2,a2,a4
c000318c:	00098813          	mv	a6,s3
c0003190:	fff78793          	addi	a5,a5,-1
c0003194:	00000693          	li	a3,0
c0003198:	00090593          	mv	a1,s2
c000319c:	00048513          	mv	a0,s1
c00031a0:	f61ff0ef          	jal	ra,c0003100 <printnum>
c00031a4:	fadff06f          	j	c0003150 <printnum+0x50>

c00031a8 <vprintfmt>:
c00031a8:	fb010113          	addi	sp,sp,-80
c00031ac:	05212023          	sw	s2,64(sp)
c00031b0:	03312e23          	sw	s3,60(sp)
c00031b4:	03412c23          	sw	s4,56(sp)
c00031b8:	03512a23          	sw	s5,52(sp)
c00031bc:	03612823          	sw	s6,48(sp)
c00031c0:	03712623          	sw	s7,44(sp)
c00031c4:	03812423          	sw	s8,40(sp)
c00031c8:	03912223          	sw	s9,36(sp)
c00031cc:	04112623          	sw	ra,76(sp)
c00031d0:	04812423          	sw	s0,72(sp)
c00031d4:	04912223          	sw	s1,68(sp)
c00031d8:	03a12023          	sw	s10,32(sp)
c00031dc:	01b12e23          	sw	s11,28(sp)
c00031e0:	00050993          	mv	s3,a0
c00031e4:	00058913          	mv	s2,a1
c00031e8:	00060c93          	mv	s9,a2
c00031ec:	00068a93          	mv	s5,a3
c00031f0:	00001a17          	auipc	s4,0x1
c00031f4:	5c0a0a13          	addi	s4,s4,1472 # c00047b0 <default_pmm_manager+0x30>
c00031f8:	02800c13          	li	s8,40
c00031fc:	fff00b13          	li	s6,-1
c0003200:	05e00b93          	li	s7,94
c0003204:	000cc503          	lbu	a0,0(s9)
c0003208:	02500493          	li	s1,37
c000320c:	001c8413          	addi	s0,s9,1
c0003210:	00950e63          	beq	a0,s1,c000322c <vprintfmt+0x84>
c0003214:	06050463          	beqz	a0,c000327c <vprintfmt+0xd4>
c0003218:	00090593          	mv	a1,s2
c000321c:	00140413          	addi	s0,s0,1
c0003220:	000980e7          	jalr	s3
c0003224:	fff44503          	lbu	a0,-1(s0)
c0003228:	fe9516e3          	bne	a0,s1,c0003214 <vprintfmt+0x6c>
c000322c:	00044e03          	lbu	t3,0(s0)
c0003230:	fff00d13          	li	s10,-1
c0003234:	02000813          	li	a6,32
c0003238:	00000493          	li	s1,0
c000323c:	00000593          	li	a1,0
c0003240:	000d0d93          	mv	s11,s10
c0003244:	05500693          	li	a3,85
c0003248:	00100313          	li	t1,1
c000324c:	03000893          	li	a7,48
c0003250:	00900613          	li	a2,9
c0003254:	02d00513          	li	a0,45
c0003258:	fdde0713          	addi	a4,t3,-35
c000325c:	0ff77713          	andi	a4,a4,255
c0003260:	00140c93          	addi	s9,s0,1
c0003264:	32e6e463          	bltu	a3,a4,c000358c <vprintfmt+0x3e4>
c0003268:	00271713          	slli	a4,a4,0x2
c000326c:	01470733          	add	a4,a4,s4
c0003270:	00072783          	lw	a5,0(a4)
c0003274:	014787b3          	add	a5,a5,s4
c0003278:	00078067          	jr	a5
c000327c:	04c12083          	lw	ra,76(sp)
c0003280:	04812403          	lw	s0,72(sp)
c0003284:	04412483          	lw	s1,68(sp)
c0003288:	04012903          	lw	s2,64(sp)
c000328c:	03c12983          	lw	s3,60(sp)
c0003290:	03812a03          	lw	s4,56(sp)
c0003294:	03412a83          	lw	s5,52(sp)
c0003298:	03012b03          	lw	s6,48(sp)
c000329c:	02c12b83          	lw	s7,44(sp)
c00032a0:	02812c03          	lw	s8,40(sp)
c00032a4:	02412c83          	lw	s9,36(sp)
c00032a8:	02012d03          	lw	s10,32(sp)
c00032ac:	01c12d83          	lw	s11,28(sp)
c00032b0:	05010113          	addi	sp,sp,80
c00032b4:	00008067          	ret
c00032b8:	00100793          	li	a5,1
c00032bc:	34b7c063          	blt	a5,a1,c00035fc <vprintfmt+0x454>
c00032c0:	000aa603          	lw	a2,0(s5)
c00032c4:	00000693          	li	a3,0
c00032c8:	004a8a93          	addi	s5,s5,4
c00032cc:	01000713          	li	a4,16
c00032d0:	000d8793          	mv	a5,s11
c00032d4:	00090593          	mv	a1,s2
c00032d8:	00098513          	mv	a0,s3
c00032dc:	e25ff0ef          	jal	ra,c0003100 <printnum>
c00032e0:	f25ff06f          	j	c0003204 <vprintfmt+0x5c>
c00032e4:	00144e03          	lbu	t3,1(s0)
c00032e8:	00030493          	mv	s1,t1
c00032ec:	000c8413          	mv	s0,s9
c00032f0:	f69ff06f          	j	c0003258 <vprintfmt+0xb0>
c00032f4:	000aa503          	lw	a0,0(s5)
c00032f8:	00090593          	mv	a1,s2
c00032fc:	004a8a93          	addi	s5,s5,4
c0003300:	000980e7          	jalr	s3
c0003304:	f01ff06f          	j	c0003204 <vprintfmt+0x5c>
c0003308:	00100793          	li	a5,1
c000330c:	30b7c663          	blt	a5,a1,c0003618 <vprintfmt+0x470>
c0003310:	000aa603          	lw	a2,0(s5)
c0003314:	004a8a93          	addi	s5,s5,4
c0003318:	41f65693          	srai	a3,a2,0x1f
c000331c:	00a00713          	li	a4,10
c0003320:	fa06d8e3          	bgez	a3,c00032d0 <vprintfmt+0x128>
c0003324:	00090593          	mv	a1,s2
c0003328:	02d00513          	li	a0,45
c000332c:	00d12623          	sw	a3,12(sp)
c0003330:	00c12423          	sw	a2,8(sp)
c0003334:	00e12223          	sw	a4,4(sp)
c0003338:	01012023          	sw	a6,0(sp)
c000333c:	000980e7          	jalr	s3
c0003340:	00812603          	lw	a2,8(sp)
c0003344:	00c12683          	lw	a3,12(sp)
c0003348:	00012803          	lw	a6,0(sp)
c000334c:	40c00633          	neg	a2,a2
c0003350:	00c037b3          	snez	a5,a2
c0003354:	40d006b3          	neg	a3,a3
c0003358:	40f686b3          	sub	a3,a3,a5
c000335c:	00412703          	lw	a4,4(sp)
c0003360:	f71ff06f          	j	c00032d0 <vprintfmt+0x128>
c0003364:	000aa783          	lw	a5,0(s5)
c0003368:	00600693          	li	a3,6
c000336c:	004a8a93          	addi	s5,s5,4
c0003370:	41f7d713          	srai	a4,a5,0x1f
c0003374:	00f747b3          	xor	a5,a4,a5
c0003378:	40e787b3          	sub	a5,a5,a4
c000337c:	2af6ca63          	blt	a3,a5,c0003630 <vprintfmt+0x488>
c0003380:	00279693          	slli	a3,a5,0x2
c0003384:	00001717          	auipc	a4,0x1
c0003388:	58470713          	addi	a4,a4,1412 # c0004908 <error_string>
c000338c:	00d70733          	add	a4,a4,a3
c0003390:	00072683          	lw	a3,0(a4)
c0003394:	28068e63          	beqz	a3,c0003630 <vprintfmt+0x488>
c0003398:	00000617          	auipc	a2,0x0
c000339c:	38060613          	addi	a2,a2,896 # c0003718 <etext+0x24>
c00033a0:	00090593          	mv	a1,s2
c00033a4:	00098513          	mv	a0,s3
c00033a8:	314000ef          	jal	ra,c00036bc <printfmt>
c00033ac:	e59ff06f          	j	c0003204 <vprintfmt+0x5c>
c00033b0:	00144e03          	lbu	t3,1(s0)
c00033b4:	00158593          	addi	a1,a1,1
c00033b8:	000c8413          	mv	s0,s9
c00033bc:	e9dff06f          	j	c0003258 <vprintfmt+0xb0>
c00033c0:	00100793          	li	a5,1
c00033c4:	20b7c063          	blt	a5,a1,c00035c4 <vprintfmt+0x41c>
c00033c8:	000aa603          	lw	a2,0(s5)
c00033cc:	00000693          	li	a3,0
c00033d0:	004a8a93          	addi	s5,s5,4
c00033d4:	00800713          	li	a4,8
c00033d8:	ef9ff06f          	j	c00032d0 <vprintfmt+0x128>
c00033dc:	03000513          	li	a0,48
c00033e0:	00090593          	mv	a1,s2
c00033e4:	01012023          	sw	a6,0(sp)
c00033e8:	000980e7          	jalr	s3
c00033ec:	00090593          	mv	a1,s2
c00033f0:	07800513          	li	a0,120
c00033f4:	000980e7          	jalr	s3
c00033f8:	000aa603          	lw	a2,0(s5)
c00033fc:	00000693          	li	a3,0
c0003400:	01000713          	li	a4,16
c0003404:	004a8a93          	addi	s5,s5,4
c0003408:	00012803          	lw	a6,0(sp)
c000340c:	ec5ff06f          	j	c00032d0 <vprintfmt+0x128>
c0003410:	000aa403          	lw	s0,0(s5)
c0003414:	004a8793          	addi	a5,s5,4
c0003418:	00f12223          	sw	a5,4(sp)
c000341c:	24040863          	beqz	s0,c000366c <vprintfmt+0x4c4>
c0003420:	05b05263          	blez	s11,c0003464 <vprintfmt+0x2bc>
c0003424:	02d00793          	li	a5,45
c0003428:	22f80263          	beq	a6,a5,c000364c <vprintfmt+0x4a4>
c000342c:	000d0593          	mv	a1,s10
c0003430:	00040513          	mv	a0,s0
c0003434:	01012023          	sw	a6,0(sp)
c0003438:	bf1ff0ef          	jal	ra,c0003028 <strnlen>
c000343c:	40ad8db3          	sub	s11,s11,a0
c0003440:	03b05263          	blez	s11,c0003464 <vprintfmt+0x2bc>
c0003444:	00012803          	lw	a6,0(sp)
c0003448:	00080513          	mv	a0,a6
c000344c:	00090593          	mv	a1,s2
c0003450:	01012023          	sw	a6,0(sp)
c0003454:	fffd8d93          	addi	s11,s11,-1
c0003458:	000980e7          	jalr	s3
c000345c:	00012803          	lw	a6,0(sp)
c0003460:	fe0d94e3          	bnez	s11,c0003448 <vprintfmt+0x2a0>
c0003464:	00044783          	lbu	a5,0(s0)
c0003468:	00140a93          	addi	s5,s0,1
c000346c:	00078513          	mv	a0,a5
c0003470:	04078c63          	beqz	a5,c00034c8 <vprintfmt+0x320>
c0003474:	03f00413          	li	s0,63
c0003478:	000d4663          	bltz	s10,c0003484 <vprintfmt+0x2dc>
c000347c:	fffd0d13          	addi	s10,s10,-1
c0003480:	036d0663          	beq	s10,s6,c00034ac <vprintfmt+0x304>
c0003484:	00090593          	mv	a1,s2
c0003488:	00048663          	beqz	s1,c0003494 <vprintfmt+0x2ec>
c000348c:	fe078793          	addi	a5,a5,-32
c0003490:	12fbe463          	bltu	s7,a5,c00035b8 <vprintfmt+0x410>
c0003494:	000980e7          	jalr	s3
c0003498:	001a8a93          	addi	s5,s5,1
c000349c:	fffac783          	lbu	a5,-1(s5)
c00034a0:	fffd8d93          	addi	s11,s11,-1
c00034a4:	00078513          	mv	a0,a5
c00034a8:	fc0798e3          	bnez	a5,c0003478 <vprintfmt+0x2d0>
c00034ac:	01b05e63          	blez	s11,c00034c8 <vprintfmt+0x320>
c00034b0:	02000413          	li	s0,32
c00034b4:	fffd8d93          	addi	s11,s11,-1
c00034b8:	00090593          	mv	a1,s2
c00034bc:	00040513          	mv	a0,s0
c00034c0:	000980e7          	jalr	s3
c00034c4:	fe0d98e3          	bnez	s11,c00034b4 <vprintfmt+0x30c>
c00034c8:	00412a83          	lw	s5,4(sp)
c00034cc:	d39ff06f          	j	c0003204 <vprintfmt+0x5c>
c00034d0:	00100793          	li	a5,1
c00034d4:	10b7c663          	blt	a5,a1,c00035e0 <vprintfmt+0x438>
c00034d8:	000aa603          	lw	a2,0(s5)
c00034dc:	00000693          	li	a3,0
c00034e0:	004a8a93          	addi	s5,s5,4
c00034e4:	00a00713          	li	a4,10
c00034e8:	de9ff06f          	j	c00032d0 <vprintfmt+0x128>
c00034ec:	00144e03          	lbu	t3,1(s0)
c00034f0:	00050813          	mv	a6,a0
c00034f4:	000c8413          	mv	s0,s9
c00034f8:	d61ff06f          	j	c0003258 <vprintfmt+0xb0>
c00034fc:	00090593          	mv	a1,s2
c0003500:	02500513          	li	a0,37
c0003504:	000980e7          	jalr	s3
c0003508:	cfdff06f          	j	c0003204 <vprintfmt+0x5c>
c000350c:	000aad03          	lw	s10,0(s5)
c0003510:	00144e03          	lbu	t3,1(s0)
c0003514:	004a8a93          	addi	s5,s5,4
c0003518:	000c8413          	mv	s0,s9
c000351c:	d20ddee3          	bgez	s11,c0003258 <vprintfmt+0xb0>
c0003520:	000d0d93          	mv	s11,s10
c0003524:	fff00d13          	li	s10,-1
c0003528:	d31ff06f          	j	c0003258 <vprintfmt+0xb0>
c000352c:	00144e03          	lbu	t3,1(s0)
c0003530:	00088813          	mv	a6,a7
c0003534:	000c8413          	mv	s0,s9
c0003538:	d21ff06f          	j	c0003258 <vprintfmt+0xb0>
c000353c:	00144703          	lbu	a4,1(s0)
c0003540:	fd0e0d13          	addi	s10,t3,-48
c0003544:	fd070793          	addi	a5,a4,-48
c0003548:	14f66863          	bltu	a2,a5,c0003698 <vprintfmt+0x4f0>
c000354c:	000c8413          	mv	s0,s9
c0003550:	002d1793          	slli	a5,s10,0x2
c0003554:	01a78d33          	add	s10,a5,s10
c0003558:	00140413          	addi	s0,s0,1
c000355c:	001d1d13          	slli	s10,s10,0x1
c0003560:	00ed0d33          	add	s10,s10,a4
c0003564:	00044703          	lbu	a4,0(s0)
c0003568:	fd0d0d13          	addi	s10,s10,-48
c000356c:	fd070793          	addi	a5,a4,-48
c0003570:	fef670e3          	bleu	a5,a2,c0003550 <vprintfmt+0x3a8>
c0003574:	00070e13          	mv	t3,a4
c0003578:	fa5ff06f          	j	c000351c <vprintfmt+0x374>
c000357c:	0e0dc463          	bltz	s11,c0003664 <vprintfmt+0x4bc>
c0003580:	00144e03          	lbu	t3,1(s0)
c0003584:	000c8413          	mv	s0,s9
c0003588:	cd1ff06f          	j	c0003258 <vprintfmt+0xb0>
c000358c:	00090593          	mv	a1,s2
c0003590:	02500513          	li	a0,37
c0003594:	000980e7          	jalr	s3
c0003598:	fff44783          	lbu	a5,-1(s0)
c000359c:	02500713          	li	a4,37
c00035a0:	00040c93          	mv	s9,s0
c00035a4:	c6e780e3          	beq	a5,a4,c0003204 <vprintfmt+0x5c>
c00035a8:	fffc8c93          	addi	s9,s9,-1
c00035ac:	fffcc783          	lbu	a5,-1(s9)
c00035b0:	fee79ce3          	bne	a5,a4,c00035a8 <vprintfmt+0x400>
c00035b4:	c51ff06f          	j	c0003204 <vprintfmt+0x5c>
c00035b8:	00040513          	mv	a0,s0
c00035bc:	000980e7          	jalr	s3
c00035c0:	ed9ff06f          	j	c0003498 <vprintfmt+0x2f0>
c00035c4:	007a8793          	addi	a5,s5,7
c00035c8:	ff87f793          	andi	a5,a5,-8
c00035cc:	00878a93          	addi	s5,a5,8
c00035d0:	0007a603          	lw	a2,0(a5)
c00035d4:	0047a683          	lw	a3,4(a5)
c00035d8:	00800713          	li	a4,8
c00035dc:	cf5ff06f          	j	c00032d0 <vprintfmt+0x128>
c00035e0:	007a8793          	addi	a5,s5,7
c00035e4:	ff87f793          	andi	a5,a5,-8
c00035e8:	00878a93          	addi	s5,a5,8
c00035ec:	0007a603          	lw	a2,0(a5)
c00035f0:	0047a683          	lw	a3,4(a5)
c00035f4:	00a00713          	li	a4,10
c00035f8:	cd9ff06f          	j	c00032d0 <vprintfmt+0x128>
c00035fc:	007a8793          	addi	a5,s5,7
c0003600:	ff87f793          	andi	a5,a5,-8
c0003604:	00878a93          	addi	s5,a5,8
c0003608:	0007a603          	lw	a2,0(a5)
c000360c:	0047a683          	lw	a3,4(a5)
c0003610:	01000713          	li	a4,16
c0003614:	cbdff06f          	j	c00032d0 <vprintfmt+0x128>
c0003618:	007a8793          	addi	a5,s5,7
c000361c:	ff87f793          	andi	a5,a5,-8
c0003620:	00878a93          	addi	s5,a5,8
c0003624:	0007a603          	lw	a2,0(a5)
c0003628:	0047a683          	lw	a3,4(a5)
c000362c:	cf1ff06f          	j	c000331c <vprintfmt+0x174>
c0003630:	00078693          	mv	a3,a5
c0003634:	00001617          	auipc	a2,0x1
c0003638:	37860613          	addi	a2,a2,888 # c00049ac <error_string+0xa4>
c000363c:	00090593          	mv	a1,s2
c0003640:	00098513          	mv	a0,s3
c0003644:	078000ef          	jal	ra,c00036bc <printfmt>
c0003648:	bbdff06f          	j	c0003204 <vprintfmt+0x5c>
c000364c:	00044783          	lbu	a5,0(s0)
c0003650:	00140a93          	addi	s5,s0,1
c0003654:	00078513          	mv	a0,a5
c0003658:	e4078ce3          	beqz	a5,c00034b0 <vprintfmt+0x308>
c000365c:	03f00413          	li	s0,63
c0003660:	e19ff06f          	j	c0003478 <vprintfmt+0x2d0>
c0003664:	00000d93          	li	s11,0
c0003668:	f19ff06f          	j	c0003580 <vprintfmt+0x3d8>
c000366c:	03b05c63          	blez	s11,c00036a4 <vprintfmt+0x4fc>
c0003670:	02d00793          	li	a5,45
c0003674:	00001417          	auipc	s0,0x1
c0003678:	33040413          	addi	s0,s0,816 # c00049a4 <error_string+0x9c>
c000367c:	daf818e3          	bne	a6,a5,c000342c <vprintfmt+0x284>
c0003680:	00001a97          	auipc	s5,0x1
c0003684:	325a8a93          	addi	s5,s5,805 # c00049a5 <error_string+0x9d>
c0003688:	000c0513          	mv	a0,s8
c000368c:	000c0793          	mv	a5,s8
c0003690:	03f00413          	li	s0,63
c0003694:	de5ff06f          	j	c0003478 <vprintfmt+0x2d0>
c0003698:	00070e13          	mv	t3,a4
c000369c:	000c8413          	mv	s0,s9
c00036a0:	e7dff06f          	j	c000351c <vprintfmt+0x374>
c00036a4:	000c0793          	mv	a5,s8
c00036a8:	000c0513          	mv	a0,s8
c00036ac:	00001a97          	auipc	s5,0x1
c00036b0:	2f9a8a93          	addi	s5,s5,761 # c00049a5 <error_string+0x9d>
c00036b4:	03f00413          	li	s0,63
c00036b8:	dc1ff06f          	j	c0003478 <vprintfmt+0x2d0>

c00036bc <printfmt>:
c00036bc:	fc010113          	addi	sp,sp,-64
c00036c0:	02c10313          	addi	t1,sp,44
c00036c4:	02d12623          	sw	a3,44(sp)
c00036c8:	00030693          	mv	a3,t1
c00036cc:	00112e23          	sw	ra,28(sp)
c00036d0:	02e12823          	sw	a4,48(sp)
c00036d4:	02f12a23          	sw	a5,52(sp)
c00036d8:	03012c23          	sw	a6,56(sp)
c00036dc:	03112e23          	sw	a7,60(sp)
c00036e0:	00612623          	sw	t1,12(sp)
c00036e4:	ac5ff0ef          	jal	ra,c00031a8 <vprintfmt>
c00036e8:	01c12083          	lw	ra,28(sp)
c00036ec:	04010113          	addi	sp,sp,64
c00036f0:	00008067          	ret
