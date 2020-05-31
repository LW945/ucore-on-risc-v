
bin/kernel:     file format elf32-littleriscv


Disassembly of section .text:

c0000000 <kern_entry>:
c0000000:	0000a117          	auipc	sp,0xa
c0000004:	00010113          	mv	sp,sp
c0000008:	0040006f          	j	c000000c <kern_init>

c000000c <kern_init>:
c000000c:	0000a517          	auipc	a0,0xa
c0000010:	01850513          	addi	a0,a0,24 # c000a024 <edata>
c0000014:	00011617          	auipc	a2,0x11
c0000018:	50460613          	addi	a2,a2,1284 # c0011518 <end>
c000001c:	ff010113          	addi	sp,sp,-16 # c0009ff0 <bootstack+0x1ff0>
c0000020:	40a60633          	sub	a2,a2,a0
c0000024:	00000593          	li	a1,0
c0000028:	00112623          	sw	ra,12(sp)
c000002c:	7c5040ef          	jal	ra,c0004ff0 <memset>
c0000030:	6dc000ef          	jal	ra,c000070c <cons_init>
c0000034:	00005597          	auipc	a1,0x5
c0000038:	5f058593          	addi	a1,a1,1520 # c0005624 <etext>
c000003c:	00005517          	auipc	a0,0x5
c0000040:	60450513          	addi	a0,a0,1540 # c0005640 <etext+0x1c>
c0000044:	090000ef          	jal	ra,c00000d4 <cprintf>
c0000048:	288000ef          	jal	ra,c00002d0 <print_kerninfo>
c000004c:	699030ef          	jal	ra,c0003ee4 <pmm_init>
c0000050:	750000ef          	jal	ra,c00007a0 <pic_init>
c0000054:	7e4000ef          	jal	ra,c0000838 <idt_init>
c0000058:	0a0010ef          	jal	ra,c00010f8 <vmm_init>
c000005c:	5b0000ef          	jal	ra,c000060c <ide_init>
c0000060:	485010ef          	jal	ra,c0001ce4 <swap_init>
c0000064:	660000ef          	jal	ra,c00006c4 <clock_init>
c0000068:	73c000ef          	jal	ra,c00007a4 <intr_enable>
c000006c:	0000006f          	j	c000006c <kern_init+0x60>

c0000070 <cputch>:
c0000070:	ff010113          	addi	sp,sp,-16
c0000074:	00112623          	sw	ra,12(sp)
c0000078:	00812423          	sw	s0,8(sp)
c000007c:	00058413          	mv	s0,a1
c0000080:	690000ef          	jal	ra,c0000710 <cons_putc>
c0000084:	00042783          	lw	a5,0(s0)
c0000088:	00c12083          	lw	ra,12(sp)
c000008c:	00178793          	addi	a5,a5,1
c0000090:	00f42023          	sw	a5,0(s0)
c0000094:	00812403          	lw	s0,8(sp)
c0000098:	01010113          	addi	sp,sp,16
c000009c:	00008067          	ret

c00000a0 <vcprintf>:
c00000a0:	fe010113          	addi	sp,sp,-32
c00000a4:	00058693          	mv	a3,a1
c00000a8:	00050613          	mv	a2,a0
c00000ac:	00c10593          	addi	a1,sp,12
c00000b0:	00000517          	auipc	a0,0x0
c00000b4:	fc050513          	addi	a0,a0,-64 # c0000070 <cputch>
c00000b8:	00112e23          	sw	ra,28(sp)
c00000bc:	00012623          	sw	zero,12(sp)
c00000c0:	018050ef          	jal	ra,c00050d8 <vprintfmt>
c00000c4:	01c12083          	lw	ra,28(sp)
c00000c8:	00c12503          	lw	a0,12(sp)
c00000cc:	02010113          	addi	sp,sp,32
c00000d0:	00008067          	ret

c00000d4 <cprintf>:
c00000d4:	fc010113          	addi	sp,sp,-64
c00000d8:	02410313          	addi	t1,sp,36
c00000dc:	02b12223          	sw	a1,36(sp)
c00000e0:	02c12423          	sw	a2,40(sp)
c00000e4:	02d12623          	sw	a3,44(sp)
c00000e8:	00050613          	mv	a2,a0
c00000ec:	00c10593          	addi	a1,sp,12
c00000f0:	00000517          	auipc	a0,0x0
c00000f4:	f8050513          	addi	a0,a0,-128 # c0000070 <cputch>
c00000f8:	00030693          	mv	a3,t1
c00000fc:	00112e23          	sw	ra,28(sp)
c0000100:	02e12823          	sw	a4,48(sp)
c0000104:	02f12a23          	sw	a5,52(sp)
c0000108:	03012c23          	sw	a6,56(sp)
c000010c:	03112e23          	sw	a7,60(sp)
c0000110:	00612423          	sw	t1,8(sp)
c0000114:	00012623          	sw	zero,12(sp)
c0000118:	7c1040ef          	jal	ra,c00050d8 <vprintfmt>
c000011c:	01c12083          	lw	ra,28(sp)
c0000120:	00c12503          	lw	a0,12(sp)
c0000124:	04010113          	addi	sp,sp,64
c0000128:	00008067          	ret

c000012c <cputchar>:
c000012c:	5e40006f          	j	c0000710 <cons_putc>

c0000130 <getchar>:
c0000130:	ff010113          	addi	sp,sp,-16
c0000134:	00112623          	sw	ra,12(sp)
c0000138:	620000ef          	jal	ra,c0000758 <cons_getc>
c000013c:	fe050ee3          	beqz	a0,c0000138 <getchar+0x8>
c0000140:	00c12083          	lw	ra,12(sp)
c0000144:	01010113          	addi	sp,sp,16
c0000148:	00008067          	ret

c000014c <readline>:
c000014c:	fd010113          	addi	sp,sp,-48
c0000150:	02112623          	sw	ra,44(sp)
c0000154:	02812423          	sw	s0,40(sp)
c0000158:	02912223          	sw	s1,36(sp)
c000015c:	03212023          	sw	s2,32(sp)
c0000160:	01312e23          	sw	s3,28(sp)
c0000164:	01412c23          	sw	s4,24(sp)
c0000168:	01512a23          	sw	s5,20(sp)
c000016c:	01612823          	sw	s6,16(sp)
c0000170:	01712623          	sw	s7,12(sp)
c0000174:	00050a63          	beqz	a0,c0000188 <readline+0x3c>
c0000178:	00050593          	mv	a1,a0
c000017c:	00005517          	auipc	a0,0x5
c0000180:	4cc50513          	addi	a0,a0,1228 # c0005648 <etext+0x24>
c0000184:	f51ff0ef          	jal	ra,c00000d4 <cprintf>
c0000188:	00000493          	li	s1,0
c000018c:	01f00913          	li	s2,31
c0000190:	00d00993          	li	s3,13
c0000194:	00800a93          	li	s5,8
c0000198:	00a00b13          	li	s6,10
c000019c:	3fe00a13          	li	s4,1022
c00001a0:	0000ab97          	auipc	s7,0xa
c00001a4:	e88b8b93          	addi	s7,s7,-376 # c000a028 <buf>
c00001a8:	f89ff0ef          	jal	ra,c0000130 <getchar>
c00001ac:	00050413          	mv	s0,a0
c00001b0:	06054863          	bltz	a0,c0000220 <readline+0xd4>
c00001b4:	06a95a63          	ble	a0,s2,c0000228 <readline+0xdc>
c00001b8:	049a5663          	ble	s1,s4,c0000204 <readline+0xb8>
c00001bc:	ff3416e3          	bne	s0,s3,c00001a8 <readline+0x5c>
c00001c0:	00040513          	mv	a0,s0
c00001c4:	f69ff0ef          	jal	ra,c000012c <cputchar>
c00001c8:	0000a517          	auipc	a0,0xa
c00001cc:	e6050513          	addi	a0,a0,-416 # c000a028 <buf>
c00001d0:	009504b3          	add	s1,a0,s1
c00001d4:	00048023          	sb	zero,0(s1)
c00001d8:	02c12083          	lw	ra,44(sp)
c00001dc:	02812403          	lw	s0,40(sp)
c00001e0:	02412483          	lw	s1,36(sp)
c00001e4:	02012903          	lw	s2,32(sp)
c00001e8:	01c12983          	lw	s3,28(sp)
c00001ec:	01812a03          	lw	s4,24(sp)
c00001f0:	01412a83          	lw	s5,20(sp)
c00001f4:	01012b03          	lw	s6,16(sp)
c00001f8:	00c12b83          	lw	s7,12(sp)
c00001fc:	03010113          	addi	sp,sp,48
c0000200:	00008067          	ret
c0000204:	f29ff0ef          	jal	ra,c000012c <cputchar>
c0000208:	009b87b3          	add	a5,s7,s1
c000020c:	00878023          	sb	s0,0(a5)
c0000210:	f21ff0ef          	jal	ra,c0000130 <getchar>
c0000214:	00148493          	addi	s1,s1,1
c0000218:	00050413          	mv	s0,a0
c000021c:	f8055ce3          	bgez	a0,c00001b4 <readline+0x68>
c0000220:	00000513          	li	a0,0
c0000224:	fb5ff06f          	j	c00001d8 <readline+0x8c>
c0000228:	01551a63          	bne	a0,s5,c000023c <readline+0xf0>
c000022c:	f6048ee3          	beqz	s1,c00001a8 <readline+0x5c>
c0000230:	efdff0ef          	jal	ra,c000012c <cputchar>
c0000234:	fff48493          	addi	s1,s1,-1
c0000238:	f71ff06f          	j	c00001a8 <readline+0x5c>
c000023c:	f96502e3          	beq	a0,s6,c00001c0 <readline+0x74>
c0000240:	f73414e3          	bne	s0,s3,c00001a8 <readline+0x5c>
c0000244:	f7dff06f          	j	c00001c0 <readline+0x74>

c0000248 <__panic>:
c0000248:	fc010113          	addi	sp,sp,-64
c000024c:	02f12a23          	sw	a5,52(sp)
c0000250:	00112e23          	sw	ra,28(sp)
c0000254:	00812c23          	sw	s0,24(sp)
c0000258:	02d12623          	sw	a3,44(sp)
c000025c:	02e12823          	sw	a4,48(sp)
c0000260:	03012c23          	sw	a6,56(sp)
c0000264:	03112e23          	sw	a7,60(sp)
c0000268:	00011797          	auipc	a5,0x11
c000026c:	1c07a783          	lw	a5,448(a5) # c0011428 <is_panic>
c0000270:	00078a63          	beqz	a5,c0000284 <__panic+0x3c>
c0000274:	538000ef          	jal	ra,c00007ac <intr_disable>
c0000278:	00000513          	li	a0,0
c000027c:	1b4000ef          	jal	ra,c0000430 <kmonitor>
c0000280:	ff9ff06f          	j	c0000278 <__panic+0x30>
c0000284:	00100713          	li	a4,1
c0000288:	00011797          	auipc	a5,0x11
c000028c:	1a078793          	addi	a5,a5,416 # c0011428 <is_panic>
c0000290:	00e7a023          	sw	a4,0(a5)
c0000294:	00060413          	mv	s0,a2
c0000298:	02c10793          	addi	a5,sp,44
c000029c:	00058613          	mv	a2,a1
c00002a0:	00050593          	mv	a1,a0
c00002a4:	00005517          	auipc	a0,0x5
c00002a8:	3a850513          	addi	a0,a0,936 # c000564c <etext+0x28>
c00002ac:	00f12623          	sw	a5,12(sp)
c00002b0:	e25ff0ef          	jal	ra,c00000d4 <cprintf>
c00002b4:	00c12583          	lw	a1,12(sp)
c00002b8:	00040513          	mv	a0,s0
c00002bc:	de5ff0ef          	jal	ra,c00000a0 <vcprintf>
c00002c0:	00007517          	auipc	a0,0x7
c00002c4:	bdc50513          	addi	a0,a0,-1060 # c0006e9c <default_pmm_manager+0x45c>
c00002c8:	e0dff0ef          	jal	ra,c00000d4 <cprintf>
c00002cc:	fa9ff06f          	j	c0000274 <__panic+0x2c>

c00002d0 <print_kerninfo>:
c00002d0:	ff010113          	addi	sp,sp,-16
c00002d4:	00005517          	auipc	a0,0x5
c00002d8:	3bc50513          	addi	a0,a0,956 # c0005690 <etext+0x6c>
c00002dc:	00112623          	sw	ra,12(sp)
c00002e0:	df5ff0ef          	jal	ra,c00000d4 <cprintf>
c00002e4:	00000597          	auipc	a1,0x0
c00002e8:	d2858593          	addi	a1,a1,-728 # c000000c <kern_init>
c00002ec:	00005517          	auipc	a0,0x5
c00002f0:	3c050513          	addi	a0,a0,960 # c00056ac <etext+0x88>
c00002f4:	de1ff0ef          	jal	ra,c00000d4 <cprintf>
c00002f8:	00005597          	auipc	a1,0x5
c00002fc:	32c58593          	addi	a1,a1,812 # c0005624 <etext>
c0000300:	00005517          	auipc	a0,0x5
c0000304:	3c850513          	addi	a0,a0,968 # c00056c8 <etext+0xa4>
c0000308:	dcdff0ef          	jal	ra,c00000d4 <cprintf>
c000030c:	0000a597          	auipc	a1,0xa
c0000310:	d1858593          	addi	a1,a1,-744 # c000a024 <edata>
c0000314:	00005517          	auipc	a0,0x5
c0000318:	3d050513          	addi	a0,a0,976 # c00056e4 <etext+0xc0>
c000031c:	db9ff0ef          	jal	ra,c00000d4 <cprintf>
c0000320:	00011597          	auipc	a1,0x11
c0000324:	1f858593          	addi	a1,a1,504 # c0011518 <end>
c0000328:	00005517          	auipc	a0,0x5
c000032c:	3d850513          	addi	a0,a0,984 # c0005700 <etext+0xdc>
c0000330:	da5ff0ef          	jal	ra,c00000d4 <cprintf>
c0000334:	00011597          	auipc	a1,0x11
c0000338:	5e358593          	addi	a1,a1,1507 # c0011917 <end+0x3ff>
c000033c:	00000797          	auipc	a5,0x0
c0000340:	cd078793          	addi	a5,a5,-816 # c000000c <kern_init>
c0000344:	40f587b3          	sub	a5,a1,a5
c0000348:	41f7d593          	srai	a1,a5,0x1f
c000034c:	3ff5f593          	andi	a1,a1,1023
c0000350:	00c12083          	lw	ra,12(sp)
c0000354:	00f585b3          	add	a1,a1,a5
c0000358:	40a5d593          	srai	a1,a1,0xa
c000035c:	00005517          	auipc	a0,0x5
c0000360:	3c050513          	addi	a0,a0,960 # c000571c <etext+0xf8>
c0000364:	01010113          	addi	sp,sp,16
c0000368:	d6dff06f          	j	c00000d4 <cprintf>

c000036c <print_stackframe>:
c000036c:	ff010113          	addi	sp,sp,-16
c0000370:	00005617          	auipc	a2,0x5
c0000374:	2f860613          	addi	a2,a2,760 # c0005668 <etext+0x44>
c0000378:	05b00593          	li	a1,91
c000037c:	00005517          	auipc	a0,0x5
c0000380:	30050513          	addi	a0,a0,768 # c000567c <etext+0x58>
c0000384:	00112623          	sw	ra,12(sp)
c0000388:	ec1ff0ef          	jal	ra,c0000248 <__panic>

c000038c <mon_help>:
c000038c:	ff010113          	addi	sp,sp,-16
c0000390:	00005617          	auipc	a2,0x5
c0000394:	47060613          	addi	a2,a2,1136 # c0005800 <commands+0xb8>
c0000398:	00005597          	auipc	a1,0x5
c000039c:	48858593          	addi	a1,a1,1160 # c0005820 <commands+0xd8>
c00003a0:	00005517          	auipc	a0,0x5
c00003a4:	48850513          	addi	a0,a0,1160 # c0005828 <commands+0xe0>
c00003a8:	00112623          	sw	ra,12(sp)
c00003ac:	d29ff0ef          	jal	ra,c00000d4 <cprintf>
c00003b0:	00005617          	auipc	a2,0x5
c00003b4:	48460613          	addi	a2,a2,1156 # c0005834 <commands+0xec>
c00003b8:	00005597          	auipc	a1,0x5
c00003bc:	4a458593          	addi	a1,a1,1188 # c000585c <commands+0x114>
c00003c0:	00005517          	auipc	a0,0x5
c00003c4:	46850513          	addi	a0,a0,1128 # c0005828 <commands+0xe0>
c00003c8:	d0dff0ef          	jal	ra,c00000d4 <cprintf>
c00003cc:	00005617          	auipc	a2,0x5
c00003d0:	49c60613          	addi	a2,a2,1180 # c0005868 <commands+0x120>
c00003d4:	00005597          	auipc	a1,0x5
c00003d8:	4b458593          	addi	a1,a1,1204 # c0005888 <commands+0x140>
c00003dc:	00005517          	auipc	a0,0x5
c00003e0:	44c50513          	addi	a0,a0,1100 # c0005828 <commands+0xe0>
c00003e4:	cf1ff0ef          	jal	ra,c00000d4 <cprintf>
c00003e8:	00c12083          	lw	ra,12(sp)
c00003ec:	00000513          	li	a0,0
c00003f0:	01010113          	addi	sp,sp,16
c00003f4:	00008067          	ret

c00003f8 <mon_kerninfo>:
c00003f8:	ff010113          	addi	sp,sp,-16
c00003fc:	00112623          	sw	ra,12(sp)
c0000400:	ed1ff0ef          	jal	ra,c00002d0 <print_kerninfo>
c0000404:	00c12083          	lw	ra,12(sp)
c0000408:	00000513          	li	a0,0
c000040c:	01010113          	addi	sp,sp,16
c0000410:	00008067          	ret

c0000414 <mon_backtrace>:
c0000414:	ff010113          	addi	sp,sp,-16
c0000418:	00112623          	sw	ra,12(sp)
c000041c:	f51ff0ef          	jal	ra,c000036c <print_stackframe>
c0000420:	00c12083          	lw	ra,12(sp)
c0000424:	00000513          	li	a0,0
c0000428:	01010113          	addi	sp,sp,16
c000042c:	00008067          	ret

c0000430 <kmonitor>:
c0000430:	f9010113          	addi	sp,sp,-112
c0000434:	05812423          	sw	s8,72(sp)
c0000438:	00050c13          	mv	s8,a0
c000043c:	00005517          	auipc	a0,0x5
c0000440:	33050513          	addi	a0,a0,816 # c000576c <commands+0x24>
c0000444:	06112623          	sw	ra,108(sp)
c0000448:	06812423          	sw	s0,104(sp)
c000044c:	06912223          	sw	s1,100(sp)
c0000450:	07212023          	sw	s2,96(sp)
c0000454:	05312e23          	sw	s3,92(sp)
c0000458:	05412c23          	sw	s4,88(sp)
c000045c:	05512a23          	sw	s5,84(sp)
c0000460:	05612823          	sw	s6,80(sp)
c0000464:	05712623          	sw	s7,76(sp)
c0000468:	05912223          	sw	s9,68(sp)
c000046c:	05a12023          	sw	s10,64(sp)
c0000470:	c65ff0ef          	jal	ra,c00000d4 <cprintf>
c0000474:	00005517          	auipc	a0,0x5
c0000478:	32050513          	addi	a0,a0,800 # c0005794 <commands+0x4c>
c000047c:	c59ff0ef          	jal	ra,c00000d4 <cprintf>
c0000480:	000c0663          	beqz	s8,c000048c <kmonitor+0x5c>
c0000484:	000c0513          	mv	a0,s8
c0000488:	5e4000ef          	jal	ra,c0000a6c <print_trapframe>
c000048c:	00005c97          	auipc	s9,0x5
c0000490:	2bcc8c93          	addi	s9,s9,700 # c0005748 <commands>
c0000494:	00005997          	auipc	s3,0x5
c0000498:	32898993          	addi	s3,s3,808 # c00057bc <commands+0x74>
c000049c:	00005497          	auipc	s1,0x5
c00004a0:	32448493          	addi	s1,s1,804 # c00057c0 <commands+0x78>
c00004a4:	00f00a13          	li	s4,15
c00004a8:	01000b93          	li	s7,16
c00004ac:	00005b17          	auipc	s6,0x5
c00004b0:	31cb0b13          	addi	s6,s6,796 # c00057c8 <commands+0x80>
c00004b4:	00300a93          	li	s5,3
c00004b8:	00098513          	mv	a0,s3
c00004bc:	c91ff0ef          	jal	ra,c000014c <readline>
c00004c0:	00050413          	mv	s0,a0
c00004c4:	fe050ae3          	beqz	a0,c00004b8 <kmonitor+0x88>
c00004c8:	00054583          	lbu	a1,0(a0)
c00004cc:	00000913          	li	s2,0
c00004d0:	0a059463          	bnez	a1,c0000578 <kmonitor+0x148>
c00004d4:	fe0902e3          	beqz	s2,c00004b8 <kmonitor+0x88>
c00004d8:	00012583          	lw	a1,0(sp)
c00004dc:	00005d17          	auipc	s10,0x5
c00004e0:	26cd0d13          	addi	s10,s10,620 # c0005748 <commands>
c00004e4:	00005517          	auipc	a0,0x5
c00004e8:	33c50513          	addi	a0,a0,828 # c0005820 <commands+0xd8>
c00004ec:	00000413          	li	s0,0
c00004f0:	00cd0d13          	addi	s10,s10,12
c00004f4:	29d040ef          	jal	ra,c0004f90 <strcmp>
c00004f8:	02050063          	beqz	a0,c0000518 <kmonitor+0xe8>
c00004fc:	00140413          	addi	s0,s0,1
c0000500:	0f540c63          	beq	s0,s5,c00005f8 <kmonitor+0x1c8>
c0000504:	000d2503          	lw	a0,0(s10)
c0000508:	00012583          	lw	a1,0(sp)
c000050c:	00cd0d13          	addi	s10,s10,12
c0000510:	281040ef          	jal	ra,c0004f90 <strcmp>
c0000514:	fe0514e3          	bnez	a0,c00004fc <kmonitor+0xcc>
c0000518:	00141793          	slli	a5,s0,0x1
c000051c:	008787b3          	add	a5,a5,s0
c0000520:	00279793          	slli	a5,a5,0x2
c0000524:	00fc87b3          	add	a5,s9,a5
c0000528:	0087a783          	lw	a5,8(a5)
c000052c:	000c0613          	mv	a2,s8
c0000530:	00410593          	addi	a1,sp,4
c0000534:	fff90513          	addi	a0,s2,-1
c0000538:	000780e7          	jalr	a5
c000053c:	f6055ee3          	bgez	a0,c00004b8 <kmonitor+0x88>
c0000540:	06c12083          	lw	ra,108(sp)
c0000544:	06812403          	lw	s0,104(sp)
c0000548:	06412483          	lw	s1,100(sp)
c000054c:	06012903          	lw	s2,96(sp)
c0000550:	05c12983          	lw	s3,92(sp)
c0000554:	05812a03          	lw	s4,88(sp)
c0000558:	05412a83          	lw	s5,84(sp)
c000055c:	05012b03          	lw	s6,80(sp)
c0000560:	04c12b83          	lw	s7,76(sp)
c0000564:	04812c03          	lw	s8,72(sp)
c0000568:	04412c83          	lw	s9,68(sp)
c000056c:	04012d03          	lw	s10,64(sp)
c0000570:	07010113          	addi	sp,sp,112
c0000574:	00008067          	ret
c0000578:	00048513          	mv	a0,s1
c000057c:	249040ef          	jal	ra,c0004fc4 <strchr>
c0000580:	00050c63          	beqz	a0,c0000598 <kmonitor+0x168>
c0000584:	00144583          	lbu	a1,1(s0)
c0000588:	00040023          	sb	zero,0(s0)
c000058c:	00140413          	addi	s0,s0,1
c0000590:	f40582e3          	beqz	a1,c00004d4 <kmonitor+0xa4>
c0000594:	fe5ff06f          	j	c0000578 <kmonitor+0x148>
c0000598:	00044783          	lbu	a5,0(s0)
c000059c:	f2078ce3          	beqz	a5,c00004d4 <kmonitor+0xa4>
c00005a0:	05490463          	beq	s2,s4,c00005e8 <kmonitor+0x1b8>
c00005a4:	00291793          	slli	a5,s2,0x2
c00005a8:	04010713          	addi	a4,sp,64
c00005ac:	00f707b3          	add	a5,a4,a5
c00005b0:	fc87a023          	sw	s0,-64(a5)
c00005b4:	00044583          	lbu	a1,0(s0)
c00005b8:	00190913          	addi	s2,s2,1
c00005bc:	00059a63          	bnez	a1,c00005d0 <kmonitor+0x1a0>
c00005c0:	f19ff06f          	j	c00004d8 <kmonitor+0xa8>
c00005c4:	00140413          	addi	s0,s0,1
c00005c8:	00044583          	lbu	a1,0(s0)
c00005cc:	f00586e3          	beqz	a1,c00004d8 <kmonitor+0xa8>
c00005d0:	00048513          	mv	a0,s1
c00005d4:	1f1040ef          	jal	ra,c0004fc4 <strchr>
c00005d8:	fe0506e3          	beqz	a0,c00005c4 <kmonitor+0x194>
c00005dc:	00044583          	lbu	a1,0(s0)
c00005e0:	ee058ae3          	beqz	a1,c00004d4 <kmonitor+0xa4>
c00005e4:	f95ff06f          	j	c0000578 <kmonitor+0x148>
c00005e8:	000b8593          	mv	a1,s7
c00005ec:	000b0513          	mv	a0,s6
c00005f0:	ae5ff0ef          	jal	ra,c00000d4 <cprintf>
c00005f4:	fb1ff06f          	j	c00005a4 <kmonitor+0x174>
c00005f8:	00012583          	lw	a1,0(sp)
c00005fc:	00005517          	auipc	a0,0x5
c0000600:	1ec50513          	addi	a0,a0,492 # c00057e8 <commands+0xa0>
c0000604:	ad1ff0ef          	jal	ra,c00000d4 <cprintf>
c0000608:	eb1ff06f          	j	c00004b8 <kmonitor+0x88>

c000060c <ide_init>:
c000060c:	00008067          	ret

c0000610 <ide_device_valid>:
c0000610:	00253513          	sltiu	a0,a0,2
c0000614:	00008067          	ret

c0000618 <ide_device_size>:
c0000618:	03800513          	li	a0,56
c000061c:	00008067          	ret

c0000620 <ide_read_secs>:
c0000620:	0000a797          	auipc	a5,0xa
c0000624:	e0878793          	addi	a5,a5,-504 # c000a428 <ide>
c0000628:	00959593          	slli	a1,a1,0x9
c000062c:	ff010113          	addi	sp,sp,-16
c0000630:	00060513          	mv	a0,a2
c0000634:	00b785b3          	add	a1,a5,a1
c0000638:	00969613          	slli	a2,a3,0x9
c000063c:	00112623          	sw	ra,12(sp)
c0000640:	1cd040ef          	jal	ra,c000500c <memcpy>
c0000644:	00c12083          	lw	ra,12(sp)
c0000648:	00000513          	li	a0,0
c000064c:	01010113          	addi	sp,sp,16
c0000650:	00008067          	ret

c0000654 <ide_write_secs>:
c0000654:	00060713          	mv	a4,a2
c0000658:	00959793          	slli	a5,a1,0x9
c000065c:	0000a517          	auipc	a0,0xa
c0000660:	dcc50513          	addi	a0,a0,-564 # c000a428 <ide>
c0000664:	ff010113          	addi	sp,sp,-16
c0000668:	00969613          	slli	a2,a3,0x9
c000066c:	00070593          	mv	a1,a4
c0000670:	00f50533          	add	a0,a0,a5
c0000674:	00112623          	sw	ra,12(sp)
c0000678:	195040ef          	jal	ra,c000500c <memcpy>
c000067c:	00c12083          	lw	ra,12(sp)
c0000680:	00000513          	li	a0,0
c0000684:	01010113          	addi	sp,sp,16
c0000688:	00008067          	ret

c000068c <clock_set_next_event>:
c000068c:	c81027f3          	rdtimeh	a5
c0000690:	c01025f3          	rdtime	a1
c0000694:	c8102773          	rdtimeh	a4
c0000698:	fee79ae3          	bne	a5,a4,c000068c <clock_set_next_event>
c000069c:	00011717          	auipc	a4,0x11
c00006a0:	d9470713          	addi	a4,a4,-620 # c0011430 <timebase>
c00006a4:	00072503          	lw	a0,0(a4)
c00006a8:	00472703          	lw	a4,4(a4)
c00006ac:	00a58533          	add	a0,a1,a0
c00006b0:	00b535b3          	sltu	a1,a0,a1
c00006b4:	00e787b3          	add	a5,a5,a4
c00006b8:	00f585b3          	add	a1,a1,a5
c00006bc:	3ffff317          	auipc	t1,0x3ffff
c00006c0:	1e430067          	jr	484(t1) # fffff8a0 <sbi_set_timer>

c00006c4 <clock_init>:
c00006c4:	ff010113          	addi	sp,sp,-16
c00006c8:	00112623          	sw	ra,12(sp)
c00006cc:	3ffff317          	auipc	t1,0x3ffff
c00006d0:	1b4300e7          	jalr	436(t1) # fffff880 <sbi_timebase>
c00006d4:	1f400793          	li	a5,500
c00006d8:	02f55533          	divu	a0,a0,a5
c00006dc:	00011797          	auipc	a5,0x11
c00006e0:	d5478793          	addi	a5,a5,-684 # c0011430 <timebase>
c00006e4:	0007a223          	sw	zero,4(a5)
c00006e8:	00a7a023          	sw	a0,0(a5)
c00006ec:	fa1ff0ef          	jal	ra,c000068c <clock_set_next_event>
c00006f0:	00c12083          	lw	ra,12(sp)
c00006f4:	00005517          	auipc	a0,0x5
c00006f8:	1a050513          	addi	a0,a0,416 # c0005894 <commands+0x14c>
c00006fc:	00011297          	auipc	t0,0x11
c0000700:	d402aa23          	sw	zero,-684(t0) # c0011450 <ticks>
c0000704:	01010113          	addi	sp,sp,16
c0000708:	9cdff06f          	j	c00000d4 <cprintf>

c000070c <cons_init>:
c000070c:	00008067          	ret

c0000710 <cons_putc>:
c0000710:	100027f3          	csrr	a5,sstatus
c0000714:	0027f793          	andi	a5,a5,2
c0000718:	00079863          	bnez	a5,c0000728 <cons_putc+0x18>
c000071c:	0ff57513          	andi	a0,a0,255
c0000720:	3ffff317          	auipc	t1,0x3ffff
c0000724:	11030067          	jr	272(t1) # fffff830 <sbi_console_putchar>
c0000728:	ff010113          	addi	sp,sp,-16
c000072c:	00112623          	sw	ra,12(sp)
c0000730:	00812423          	sw	s0,8(sp)
c0000734:	00050413          	mv	s0,a0
c0000738:	074000ef          	jal	ra,c00007ac <intr_disable>
c000073c:	0ff47513          	andi	a0,s0,255
c0000740:	3ffff317          	auipc	t1,0x3ffff
c0000744:	0f0300e7          	jalr	240(t1) # fffff830 <sbi_console_putchar>
c0000748:	00c12083          	lw	ra,12(sp)
c000074c:	00812403          	lw	s0,8(sp)
c0000750:	01010113          	addi	sp,sp,16
c0000754:	0500006f          	j	c00007a4 <intr_enable>

c0000758 <cons_getc>:
c0000758:	100027f3          	csrr	a5,sstatus
c000075c:	0027f793          	andi	a5,a5,2
c0000760:	00079663          	bnez	a5,c000076c <cons_getc+0x14>
c0000764:	3ffff317          	auipc	t1,0x3ffff
c0000768:	0dc30067          	jr	220(t1) # fffff840 <sbi_console_getchar>
c000076c:	ff010113          	addi	sp,sp,-16
c0000770:	00112623          	sw	ra,12(sp)
c0000774:	00812423          	sw	s0,8(sp)
c0000778:	034000ef          	jal	ra,c00007ac <intr_disable>
c000077c:	3ffff317          	auipc	t1,0x3ffff
c0000780:	0c4300e7          	jalr	196(t1) # fffff840 <sbi_console_getchar>
c0000784:	00050413          	mv	s0,a0
c0000788:	01c000ef          	jal	ra,c00007a4 <intr_enable>
c000078c:	00c12083          	lw	ra,12(sp)
c0000790:	00040513          	mv	a0,s0
c0000794:	00812403          	lw	s0,8(sp)
c0000798:	01010113          	addi	sp,sp,16
c000079c:	00008067          	ret

c00007a0 <pic_init>:
c00007a0:	00008067          	ret

c00007a4 <intr_enable>:
c00007a4:	100167f3          	csrrsi	a5,sstatus,2
c00007a8:	00008067          	ret

c00007ac <intr_disable>:
c00007ac:	100177f3          	csrrci	a5,sstatus,2
c00007b0:	00008067          	ret

c00007b4 <pgfault_handler>:
c00007b4:	08052783          	lw	a5,128(a0)
c00007b8:	ff010113          	addi	sp,sp,-16
c00007bc:	00812423          	sw	s0,8(sp)
c00007c0:	00112623          	sw	ra,12(sp)
c00007c4:	1007f793          	andi	a5,a5,256
c00007c8:	00050413          	mv	s0,a0
c00007cc:	08852583          	lw	a1,136(a0)
c00007d0:	05500613          	li	a2,85
c00007d4:	00078463          	beqz	a5,c00007dc <pgfault_handler+0x28>
c00007d8:	04b00613          	li	a2,75
c00007dc:	08c42703          	lw	a4,140(s0)
c00007e0:	00700793          	li	a5,7
c00007e4:	05700693          	li	a3,87
c00007e8:	00f70463          	beq	a4,a5,c00007f0 <pgfault_handler+0x3c>
c00007ec:	05200693          	li	a3,82
c00007f0:	00005517          	auipc	a0,0x5
c00007f4:	32850513          	addi	a0,a0,808 # c0005b18 <commands+0x3d0>
c00007f8:	8ddff0ef          	jal	ra,c00000d4 <cprintf>
c00007fc:	00011517          	auipc	a0,0x11
c0000800:	c5852503          	lw	a0,-936(a0) # c0011454 <check_mm_struct>
c0000804:	00050e63          	beqz	a0,c0000820 <pgfault_handler+0x6c>
c0000808:	08842603          	lw	a2,136(s0)
c000080c:	08c42583          	lw	a1,140(s0)
c0000810:	00c12083          	lw	ra,12(sp)
c0000814:	00812403          	lw	s0,8(sp)
c0000818:	01010113          	addi	sp,sp,16
c000081c:	6bd0006f          	j	c00016d8 <do_pgfault>
c0000820:	00005617          	auipc	a2,0x5
c0000824:	31860613          	addi	a2,a2,792 # c0005b38 <commands+0x3f0>
c0000828:	07500593          	li	a1,117
c000082c:	00005517          	auipc	a0,0x5
c0000830:	32450513          	addi	a0,a0,804 # c0005b50 <commands+0x408>
c0000834:	a15ff0ef          	jal	ra,c0000248 <__panic>

c0000838 <idt_init>:
c0000838:	14005073          	csrwi	sscratch,0
c000083c:	00000797          	auipc	a5,0x0
c0000840:	4d478793          	addi	a5,a5,1236 # c0000d10 <__alltraps>
c0000844:	10579073          	csrw	stvec,a5
c0000848:	100167f3          	csrrsi	a5,sstatus,2
c000084c:	00008067          	ret

c0000850 <print_regs>:
c0000850:	00052583          	lw	a1,0(a0)
c0000854:	ff010113          	addi	sp,sp,-16
c0000858:	00812423          	sw	s0,8(sp)
c000085c:	00050413          	mv	s0,a0
c0000860:	00005517          	auipc	a0,0x5
c0000864:	30450513          	addi	a0,a0,772 # c0005b64 <commands+0x41c>
c0000868:	00112623          	sw	ra,12(sp)
c000086c:	869ff0ef          	jal	ra,c00000d4 <cprintf>
c0000870:	00442583          	lw	a1,4(s0)
c0000874:	00005517          	auipc	a0,0x5
c0000878:	30450513          	addi	a0,a0,772 # c0005b78 <commands+0x430>
c000087c:	859ff0ef          	jal	ra,c00000d4 <cprintf>
c0000880:	00842583          	lw	a1,8(s0)
c0000884:	00005517          	auipc	a0,0x5
c0000888:	30850513          	addi	a0,a0,776 # c0005b8c <commands+0x444>
c000088c:	849ff0ef          	jal	ra,c00000d4 <cprintf>
c0000890:	00c42583          	lw	a1,12(s0)
c0000894:	00005517          	auipc	a0,0x5
c0000898:	30c50513          	addi	a0,a0,780 # c0005ba0 <commands+0x458>
c000089c:	839ff0ef          	jal	ra,c00000d4 <cprintf>
c00008a0:	01042583          	lw	a1,16(s0)
c00008a4:	00005517          	auipc	a0,0x5
c00008a8:	31050513          	addi	a0,a0,784 # c0005bb4 <commands+0x46c>
c00008ac:	829ff0ef          	jal	ra,c00000d4 <cprintf>
c00008b0:	01442583          	lw	a1,20(s0)
c00008b4:	00005517          	auipc	a0,0x5
c00008b8:	31450513          	addi	a0,a0,788 # c0005bc8 <commands+0x480>
c00008bc:	819ff0ef          	jal	ra,c00000d4 <cprintf>
c00008c0:	01842583          	lw	a1,24(s0)
c00008c4:	00005517          	auipc	a0,0x5
c00008c8:	31850513          	addi	a0,a0,792 # c0005bdc <commands+0x494>
c00008cc:	809ff0ef          	jal	ra,c00000d4 <cprintf>
c00008d0:	01c42583          	lw	a1,28(s0)
c00008d4:	00005517          	auipc	a0,0x5
c00008d8:	31c50513          	addi	a0,a0,796 # c0005bf0 <commands+0x4a8>
c00008dc:	ff8ff0ef          	jal	ra,c00000d4 <cprintf>
c00008e0:	02042583          	lw	a1,32(s0)
c00008e4:	00005517          	auipc	a0,0x5
c00008e8:	32050513          	addi	a0,a0,800 # c0005c04 <commands+0x4bc>
c00008ec:	fe8ff0ef          	jal	ra,c00000d4 <cprintf>
c00008f0:	02442583          	lw	a1,36(s0)
c00008f4:	00005517          	auipc	a0,0x5
c00008f8:	32450513          	addi	a0,a0,804 # c0005c18 <commands+0x4d0>
c00008fc:	fd8ff0ef          	jal	ra,c00000d4 <cprintf>
c0000900:	02842583          	lw	a1,40(s0)
c0000904:	00005517          	auipc	a0,0x5
c0000908:	32850513          	addi	a0,a0,808 # c0005c2c <commands+0x4e4>
c000090c:	fc8ff0ef          	jal	ra,c00000d4 <cprintf>
c0000910:	02c42583          	lw	a1,44(s0)
c0000914:	00005517          	auipc	a0,0x5
c0000918:	32c50513          	addi	a0,a0,812 # c0005c40 <commands+0x4f8>
c000091c:	fb8ff0ef          	jal	ra,c00000d4 <cprintf>
c0000920:	03042583          	lw	a1,48(s0)
c0000924:	00005517          	auipc	a0,0x5
c0000928:	33050513          	addi	a0,a0,816 # c0005c54 <commands+0x50c>
c000092c:	fa8ff0ef          	jal	ra,c00000d4 <cprintf>
c0000930:	03442583          	lw	a1,52(s0)
c0000934:	00005517          	auipc	a0,0x5
c0000938:	33450513          	addi	a0,a0,820 # c0005c68 <commands+0x520>
c000093c:	f98ff0ef          	jal	ra,c00000d4 <cprintf>
c0000940:	03842583          	lw	a1,56(s0)
c0000944:	00005517          	auipc	a0,0x5
c0000948:	33850513          	addi	a0,a0,824 # c0005c7c <commands+0x534>
c000094c:	f88ff0ef          	jal	ra,c00000d4 <cprintf>
c0000950:	03c42583          	lw	a1,60(s0)
c0000954:	00005517          	auipc	a0,0x5
c0000958:	33c50513          	addi	a0,a0,828 # c0005c90 <commands+0x548>
c000095c:	f78ff0ef          	jal	ra,c00000d4 <cprintf>
c0000960:	04042583          	lw	a1,64(s0)
c0000964:	00005517          	auipc	a0,0x5
c0000968:	34050513          	addi	a0,a0,832 # c0005ca4 <commands+0x55c>
c000096c:	f68ff0ef          	jal	ra,c00000d4 <cprintf>
c0000970:	04442583          	lw	a1,68(s0)
c0000974:	00005517          	auipc	a0,0x5
c0000978:	34450513          	addi	a0,a0,836 # c0005cb8 <commands+0x570>
c000097c:	f58ff0ef          	jal	ra,c00000d4 <cprintf>
c0000980:	04842583          	lw	a1,72(s0)
c0000984:	00005517          	auipc	a0,0x5
c0000988:	34850513          	addi	a0,a0,840 # c0005ccc <commands+0x584>
c000098c:	f48ff0ef          	jal	ra,c00000d4 <cprintf>
c0000990:	04c42583          	lw	a1,76(s0)
c0000994:	00005517          	auipc	a0,0x5
c0000998:	34c50513          	addi	a0,a0,844 # c0005ce0 <commands+0x598>
c000099c:	f38ff0ef          	jal	ra,c00000d4 <cprintf>
c00009a0:	05042583          	lw	a1,80(s0)
c00009a4:	00005517          	auipc	a0,0x5
c00009a8:	35050513          	addi	a0,a0,848 # c0005cf4 <commands+0x5ac>
c00009ac:	f28ff0ef          	jal	ra,c00000d4 <cprintf>
c00009b0:	05442583          	lw	a1,84(s0)
c00009b4:	00005517          	auipc	a0,0x5
c00009b8:	35450513          	addi	a0,a0,852 # c0005d08 <commands+0x5c0>
c00009bc:	f18ff0ef          	jal	ra,c00000d4 <cprintf>
c00009c0:	05842583          	lw	a1,88(s0)
c00009c4:	00005517          	auipc	a0,0x5
c00009c8:	35850513          	addi	a0,a0,856 # c0005d1c <commands+0x5d4>
c00009cc:	f08ff0ef          	jal	ra,c00000d4 <cprintf>
c00009d0:	05c42583          	lw	a1,92(s0)
c00009d4:	00005517          	auipc	a0,0x5
c00009d8:	35c50513          	addi	a0,a0,860 # c0005d30 <commands+0x5e8>
c00009dc:	ef8ff0ef          	jal	ra,c00000d4 <cprintf>
c00009e0:	06042583          	lw	a1,96(s0)
c00009e4:	00005517          	auipc	a0,0x5
c00009e8:	36050513          	addi	a0,a0,864 # c0005d44 <commands+0x5fc>
c00009ec:	ee8ff0ef          	jal	ra,c00000d4 <cprintf>
c00009f0:	06442583          	lw	a1,100(s0)
c00009f4:	00005517          	auipc	a0,0x5
c00009f8:	36450513          	addi	a0,a0,868 # c0005d58 <commands+0x610>
c00009fc:	ed8ff0ef          	jal	ra,c00000d4 <cprintf>
c0000a00:	06842583          	lw	a1,104(s0)
c0000a04:	00005517          	auipc	a0,0x5
c0000a08:	36850513          	addi	a0,a0,872 # c0005d6c <commands+0x624>
c0000a0c:	ec8ff0ef          	jal	ra,c00000d4 <cprintf>
c0000a10:	06c42583          	lw	a1,108(s0)
c0000a14:	00005517          	auipc	a0,0x5
c0000a18:	36c50513          	addi	a0,a0,876 # c0005d80 <commands+0x638>
c0000a1c:	eb8ff0ef          	jal	ra,c00000d4 <cprintf>
c0000a20:	07042583          	lw	a1,112(s0)
c0000a24:	00005517          	auipc	a0,0x5
c0000a28:	37050513          	addi	a0,a0,880 # c0005d94 <commands+0x64c>
c0000a2c:	ea8ff0ef          	jal	ra,c00000d4 <cprintf>
c0000a30:	07442583          	lw	a1,116(s0)
c0000a34:	00005517          	auipc	a0,0x5
c0000a38:	37450513          	addi	a0,a0,884 # c0005da8 <commands+0x660>
c0000a3c:	e98ff0ef          	jal	ra,c00000d4 <cprintf>
c0000a40:	07842583          	lw	a1,120(s0)
c0000a44:	00005517          	auipc	a0,0x5
c0000a48:	37850513          	addi	a0,a0,888 # c0005dbc <commands+0x674>
c0000a4c:	e88ff0ef          	jal	ra,c00000d4 <cprintf>
c0000a50:	07c42583          	lw	a1,124(s0)
c0000a54:	00c12083          	lw	ra,12(sp)
c0000a58:	00812403          	lw	s0,8(sp)
c0000a5c:	00005517          	auipc	a0,0x5
c0000a60:	37450513          	addi	a0,a0,884 # c0005dd0 <commands+0x688>
c0000a64:	01010113          	addi	sp,sp,16
c0000a68:	e6cff06f          	j	c00000d4 <cprintf>

c0000a6c <print_trapframe>:
c0000a6c:	ff010113          	addi	sp,sp,-16
c0000a70:	00050593          	mv	a1,a0
c0000a74:	00812423          	sw	s0,8(sp)
c0000a78:	00050413          	mv	s0,a0
c0000a7c:	00005517          	auipc	a0,0x5
c0000a80:	36850513          	addi	a0,a0,872 # c0005de4 <commands+0x69c>
c0000a84:	00112623          	sw	ra,12(sp)
c0000a88:	e4cff0ef          	jal	ra,c00000d4 <cprintf>
c0000a8c:	00040513          	mv	a0,s0
c0000a90:	dc1ff0ef          	jal	ra,c0000850 <print_regs>
c0000a94:	08042583          	lw	a1,128(s0)
c0000a98:	00005517          	auipc	a0,0x5
c0000a9c:	36050513          	addi	a0,a0,864 # c0005df8 <commands+0x6b0>
c0000aa0:	e34ff0ef          	jal	ra,c00000d4 <cprintf>
c0000aa4:	08442583          	lw	a1,132(s0)
c0000aa8:	00005517          	auipc	a0,0x5
c0000aac:	36450513          	addi	a0,a0,868 # c0005e0c <commands+0x6c4>
c0000ab0:	e24ff0ef          	jal	ra,c00000d4 <cprintf>
c0000ab4:	08842583          	lw	a1,136(s0)
c0000ab8:	00005517          	auipc	a0,0x5
c0000abc:	36850513          	addi	a0,a0,872 # c0005e20 <commands+0x6d8>
c0000ac0:	e14ff0ef          	jal	ra,c00000d4 <cprintf>
c0000ac4:	08c42583          	lw	a1,140(s0)
c0000ac8:	00c12083          	lw	ra,12(sp)
c0000acc:	00812403          	lw	s0,8(sp)
c0000ad0:	00005517          	auipc	a0,0x5
c0000ad4:	36450513          	addi	a0,a0,868 # c0005e34 <commands+0x6ec>
c0000ad8:	01010113          	addi	sp,sp,16
c0000adc:	df8ff06f          	j	c00000d4 <cprintf>

c0000ae0 <interrupt_handler>:
c0000ae0:	08c52783          	lw	a5,140(a0)
c0000ae4:	80000737          	lui	a4,0x80000
c0000ae8:	fff74713          	not	a4,a4
c0000aec:	00e7f7b3          	and	a5,a5,a4
c0000af0:	00b00713          	li	a4,11
c0000af4:	08f76a63          	bltu	a4,a5,c0000b88 <interrupt_handler+0xa8>
c0000af8:	00005717          	auipc	a4,0x5
c0000afc:	db870713          	addi	a4,a4,-584 # c00058b0 <commands+0x168>
c0000b00:	00279793          	slli	a5,a5,0x2
c0000b04:	00e787b3          	add	a5,a5,a4
c0000b08:	0007a783          	lw	a5,0(a5)
c0000b0c:	00e787b3          	add	a5,a5,a4
c0000b10:	00078067          	jr	a5
c0000b14:	00005517          	auipc	a0,0x5
c0000b18:	f6050513          	addi	a0,a0,-160 # c0005a74 <commands+0x32c>
c0000b1c:	db8ff06f          	j	c00000d4 <cprintf>
c0000b20:	00005517          	auipc	a0,0x5
c0000b24:	f9050513          	addi	a0,a0,-112 # c0005ab0 <commands+0x368>
c0000b28:	dacff06f          	j	c00000d4 <cprintf>
c0000b2c:	00005517          	auipc	a0,0x5
c0000b30:	fa450513          	addi	a0,a0,-92 # c0005ad0 <commands+0x388>
c0000b34:	da0ff06f          	j	c00000d4 <cprintf>
c0000b38:	00005517          	auipc	a0,0x5
c0000b3c:	fc050513          	addi	a0,a0,-64 # c0005af8 <commands+0x3b0>
c0000b40:	d94ff06f          	j	c00000d4 <cprintf>
c0000b44:	ff010113          	addi	sp,sp,-16
c0000b48:	00112623          	sw	ra,12(sp)
c0000b4c:	b41ff0ef          	jal	ra,c000068c <clock_set_next_event>
c0000b50:	00011797          	auipc	a5,0x11
c0000b54:	9007a783          	lw	a5,-1792(a5) # c0011450 <ticks>
c0000b58:	00178793          	addi	a5,a5,1
c0000b5c:	06400593          	li	a1,100
c0000b60:	02b7f733          	remu	a4,a5,a1
c0000b64:	00011297          	auipc	t0,0x11
c0000b68:	8ef2a623          	sw	a5,-1812(t0) # c0011450 <ticks>
c0000b6c:	02070063          	beqz	a4,c0000b8c <interrupt_handler+0xac>
c0000b70:	00c12083          	lw	ra,12(sp)
c0000b74:	01010113          	addi	sp,sp,16
c0000b78:	00008067          	ret
c0000b7c:	00005517          	auipc	a0,0x5
c0000b80:	f1450513          	addi	a0,a0,-236 # c0005a90 <commands+0x348>
c0000b84:	d50ff06f          	j	c00000d4 <cprintf>
c0000b88:	ee5ff06f          	j	c0000a6c <print_trapframe>
c0000b8c:	00c12083          	lw	ra,12(sp)
c0000b90:	00005517          	auipc	a0,0x5
c0000b94:	f5c50513          	addi	a0,a0,-164 # c0005aec <commands+0x3a4>
c0000b98:	01010113          	addi	sp,sp,16
c0000b9c:	d38ff06f          	j	c00000d4 <cprintf>

c0000ba0 <exception_handler>:
c0000ba0:	08c52783          	lw	a5,140(a0)
c0000ba4:	00b00693          	li	a3,11
c0000ba8:	12f6e663          	bltu	a3,a5,c0000cd4 <exception_handler+0x134>
c0000bac:	00005717          	auipc	a4,0x5
c0000bb0:	d3470713          	addi	a4,a4,-716 # c00058e0 <commands+0x198>
c0000bb4:	00279793          	slli	a5,a5,0x2
c0000bb8:	00e787b3          	add	a5,a5,a4
c0000bbc:	0007a783          	lw	a5,0(a5)
c0000bc0:	ff010113          	addi	sp,sp,-16
c0000bc4:	00812423          	sw	s0,8(sp)
c0000bc8:	00112623          	sw	ra,12(sp)
c0000bcc:	00912223          	sw	s1,4(sp)
c0000bd0:	00e787b3          	add	a5,a5,a4
c0000bd4:	00050413          	mv	s0,a0
c0000bd8:	00078067          	jr	a5
c0000bdc:	00005517          	auipc	a0,0x5
c0000be0:	e5850513          	addi	a0,a0,-424 # c0005a34 <commands+0x2ec>
c0000be4:	00c12083          	lw	ra,12(sp)
c0000be8:	00812403          	lw	s0,8(sp)
c0000bec:	00412483          	lw	s1,4(sp)
c0000bf0:	01010113          	addi	sp,sp,16
c0000bf4:	ce0ff06f          	j	c00000d4 <cprintf>
c0000bf8:	00005517          	auipc	a0,0x5
c0000bfc:	e5c50513          	addi	a0,a0,-420 # c0005a54 <commands+0x30c>
c0000c00:	fe5ff06f          	j	c0000be4 <exception_handler+0x44>
c0000c04:	00005517          	auipc	a0,0x5
c0000c08:	d0c50513          	addi	a0,a0,-756 # c0005910 <commands+0x1c8>
c0000c0c:	fd9ff06f          	j	c0000be4 <exception_handler+0x44>
c0000c10:	00005517          	auipc	a0,0x5
c0000c14:	d2050513          	addi	a0,a0,-736 # c0005930 <commands+0x1e8>
c0000c18:	fcdff06f          	j	c0000be4 <exception_handler+0x44>
c0000c1c:	00005517          	auipc	a0,0x5
c0000c20:	d3050513          	addi	a0,a0,-720 # c000594c <commands+0x204>
c0000c24:	fc1ff06f          	j	c0000be4 <exception_handler+0x44>
c0000c28:	00005517          	auipc	a0,0x5
c0000c2c:	d3c50513          	addi	a0,a0,-708 # c0005964 <commands+0x21c>
c0000c30:	fb5ff06f          	j	c0000be4 <exception_handler+0x44>
c0000c34:	00005517          	auipc	a0,0x5
c0000c38:	d3c50513          	addi	a0,a0,-708 # c0005970 <commands+0x228>
c0000c3c:	fa9ff06f          	j	c0000be4 <exception_handler+0x44>
c0000c40:	00005517          	auipc	a0,0x5
c0000c44:	d4c50513          	addi	a0,a0,-692 # c000598c <commands+0x244>
c0000c48:	c8cff0ef          	jal	ra,c00000d4 <cprintf>
c0000c4c:	00040513          	mv	a0,s0
c0000c50:	b65ff0ef          	jal	ra,c00007b4 <pgfault_handler>
c0000c54:	00050493          	mv	s1,a0
c0000c58:	08051063          	bnez	a0,c0000cd8 <exception_handler+0x138>
c0000c5c:	00c12083          	lw	ra,12(sp)
c0000c60:	00812403          	lw	s0,8(sp)
c0000c64:	00412483          	lw	s1,4(sp)
c0000c68:	01010113          	addi	sp,sp,16
c0000c6c:	00008067          	ret
c0000c70:	00005517          	auipc	a0,0x5
c0000c74:	d4c50513          	addi	a0,a0,-692 # c00059bc <commands+0x274>
c0000c78:	f6dff06f          	j	c0000be4 <exception_handler+0x44>
c0000c7c:	00005517          	auipc	a0,0x5
c0000c80:	d6050513          	addi	a0,a0,-672 # c00059dc <commands+0x294>
c0000c84:	c50ff0ef          	jal	ra,c00000d4 <cprintf>
c0000c88:	00040513          	mv	a0,s0
c0000c8c:	b29ff0ef          	jal	ra,c00007b4 <pgfault_handler>
c0000c90:	00050493          	mv	s1,a0
c0000c94:	fc0504e3          	beqz	a0,c0000c5c <exception_handler+0xbc>
c0000c98:	00040513          	mv	a0,s0
c0000c9c:	dd1ff0ef          	jal	ra,c0000a6c <print_trapframe>
c0000ca0:	00048693          	mv	a3,s1
c0000ca4:	00005617          	auipc	a2,0x5
c0000ca8:	cfc60613          	addi	a2,a2,-772 # c00059a0 <commands+0x258>
c0000cac:	0d000593          	li	a1,208
c0000cb0:	00005517          	auipc	a0,0x5
c0000cb4:	ea050513          	addi	a0,a0,-352 # c0005b50 <commands+0x408>
c0000cb8:	d90ff0ef          	jal	ra,c0000248 <__panic>
c0000cbc:	00005517          	auipc	a0,0x5
c0000cc0:	d3850513          	addi	a0,a0,-712 # c00059f4 <commands+0x2ac>
c0000cc4:	f21ff06f          	j	c0000be4 <exception_handler+0x44>
c0000cc8:	00005517          	auipc	a0,0x5
c0000ccc:	d4c50513          	addi	a0,a0,-692 # c0005a14 <commands+0x2cc>
c0000cd0:	f15ff06f          	j	c0000be4 <exception_handler+0x44>
c0000cd4:	d99ff06f          	j	c0000a6c <print_trapframe>
c0000cd8:	00040513          	mv	a0,s0
c0000cdc:	d91ff0ef          	jal	ra,c0000a6c <print_trapframe>
c0000ce0:	00048693          	mv	a3,s1
c0000ce4:	00005617          	auipc	a2,0x5
c0000ce8:	cbc60613          	addi	a2,a2,-836 # c00059a0 <commands+0x258>
c0000cec:	0c600593          	li	a1,198
c0000cf0:	00005517          	auipc	a0,0x5
c0000cf4:	e6050513          	addi	a0,a0,-416 # c0005b50 <commands+0x408>
c0000cf8:	d50ff0ef          	jal	ra,c0000248 <__panic>

c0000cfc <trap>:
c0000cfc:	08c52783          	lw	a5,140(a0)
c0000d00:	0007c463          	bltz	a5,c0000d08 <trap+0xc>
c0000d04:	e9dff06f          	j	c0000ba0 <exception_handler>
c0000d08:	dd9ff06f          	j	c0000ae0 <interrupt_handler>
c0000d0c:	0000                	unimp
	...

c0000d10 <__alltraps>:
c0000d10:	14011073          	csrw	sscratch,sp
c0000d14:	f7010113          	addi	sp,sp,-144
c0000d18:	00112223          	sw	ra,4(sp)
c0000d1c:	00312623          	sw	gp,12(sp)
c0000d20:	00412823          	sw	tp,16(sp)
c0000d24:	00512a23          	sw	t0,20(sp)
c0000d28:	00612c23          	sw	t1,24(sp)
c0000d2c:	00712e23          	sw	t2,28(sp)
c0000d30:	02812023          	sw	s0,32(sp)
c0000d34:	02912223          	sw	s1,36(sp)
c0000d38:	02a12423          	sw	a0,40(sp)
c0000d3c:	02b12623          	sw	a1,44(sp)
c0000d40:	02c12823          	sw	a2,48(sp)
c0000d44:	02d12a23          	sw	a3,52(sp)
c0000d48:	02e12c23          	sw	a4,56(sp)
c0000d4c:	02f12e23          	sw	a5,60(sp)
c0000d50:	05012023          	sw	a6,64(sp)
c0000d54:	05112223          	sw	a7,68(sp)
c0000d58:	05212423          	sw	s2,72(sp)
c0000d5c:	05312623          	sw	s3,76(sp)
c0000d60:	05412823          	sw	s4,80(sp)
c0000d64:	05512a23          	sw	s5,84(sp)
c0000d68:	05612c23          	sw	s6,88(sp)
c0000d6c:	05712e23          	sw	s7,92(sp)
c0000d70:	07812023          	sw	s8,96(sp)
c0000d74:	07912223          	sw	s9,100(sp)
c0000d78:	07a12423          	sw	s10,104(sp)
c0000d7c:	07b12623          	sw	s11,108(sp)
c0000d80:	07c12823          	sw	t3,112(sp)
c0000d84:	07d12a23          	sw	t4,116(sp)
c0000d88:	07e12c23          	sw	t5,120(sp)
c0000d8c:	07f12e23          	sw	t6,124(sp)
c0000d90:	14002473          	csrr	s0,sscratch
c0000d94:	100024f3          	csrr	s1,sstatus
c0000d98:	14102973          	csrr	s2,sepc
c0000d9c:	143029f3          	csrr	s3,sbadaddr
c0000da0:	14202a73          	csrr	s4,scause
c0000da4:	00812423          	sw	s0,8(sp)
c0000da8:	08912023          	sw	s1,128(sp)
c0000dac:	09212223          	sw	s2,132(sp)
c0000db0:	09312423          	sw	s3,136(sp)
c0000db4:	09412623          	sw	s4,140(sp)
c0000db8:	00010513          	mv	a0,sp
c0000dbc:	f41ff0ef          	jal	ra,c0000cfc <trap>

c0000dc0 <__trapret>:
c0000dc0:	08012483          	lw	s1,128(sp)
c0000dc4:	08412903          	lw	s2,132(sp)
c0000dc8:	10049073          	csrw	sstatus,s1
c0000dcc:	14191073          	csrw	sepc,s2
c0000dd0:	00412083          	lw	ra,4(sp)
c0000dd4:	00c12183          	lw	gp,12(sp)
c0000dd8:	01012203          	lw	tp,16(sp)
c0000ddc:	01412283          	lw	t0,20(sp)
c0000de0:	01812303          	lw	t1,24(sp)
c0000de4:	01c12383          	lw	t2,28(sp)
c0000de8:	02012403          	lw	s0,32(sp)
c0000dec:	02412483          	lw	s1,36(sp)
c0000df0:	02812503          	lw	a0,40(sp)
c0000df4:	02c12583          	lw	a1,44(sp)
c0000df8:	03012603          	lw	a2,48(sp)
c0000dfc:	03412683          	lw	a3,52(sp)
c0000e00:	03812703          	lw	a4,56(sp)
c0000e04:	03c12783          	lw	a5,60(sp)
c0000e08:	04012803          	lw	a6,64(sp)
c0000e0c:	04412883          	lw	a7,68(sp)
c0000e10:	04812903          	lw	s2,72(sp)
c0000e14:	04c12983          	lw	s3,76(sp)
c0000e18:	05012a03          	lw	s4,80(sp)
c0000e1c:	05412a83          	lw	s5,84(sp)
c0000e20:	05812b03          	lw	s6,88(sp)
c0000e24:	05c12b83          	lw	s7,92(sp)
c0000e28:	06012c03          	lw	s8,96(sp)
c0000e2c:	06412c83          	lw	s9,100(sp)
c0000e30:	06812d03          	lw	s10,104(sp)
c0000e34:	06c12d83          	lw	s11,108(sp)
c0000e38:	07012e03          	lw	t3,112(sp)
c0000e3c:	07412e83          	lw	t4,116(sp)
c0000e40:	07812f03          	lw	t5,120(sp)
c0000e44:	07c12f83          	lw	t6,124(sp)
c0000e48:	00812103          	lw	sp,8(sp)
c0000e4c:	10200073          	sret
c0000e50:	0000                	unimp
	...

c0000e54 <check_vma_overlap.isra.0.part.1>:
c0000e54:	ff010113          	addi	sp,sp,-16
c0000e58:	00005697          	auipc	a3,0x5
c0000e5c:	ff068693          	addi	a3,a3,-16 # c0005e48 <commands+0x700>
c0000e60:	00005617          	auipc	a2,0x5
c0000e64:	00860613          	addi	a2,a2,8 # c0005e68 <commands+0x720>
c0000e68:	06700593          	li	a1,103
c0000e6c:	00005517          	auipc	a0,0x5
c0000e70:	01450513          	addi	a0,a0,20 # c0005e80 <commands+0x738>
c0000e74:	00112623          	sw	ra,12(sp)
c0000e78:	bd0ff0ef          	jal	ra,c0000248 <__panic>

c0000e7c <mm_create>:
c0000e7c:	ff010113          	addi	sp,sp,-16
c0000e80:	01800513          	li	a0,24
c0000e84:	00812423          	sw	s0,8(sp)
c0000e88:	00112623          	sw	ra,12(sp)
c0000e8c:	525030ef          	jal	ra,c0004bb0 <kmalloc>
c0000e90:	00050413          	mv	s0,a0
c0000e94:	02050463          	beqz	a0,c0000ebc <mm_create+0x40>
c0000e98:	00a42223          	sw	a0,4(s0)
c0000e9c:	00a42023          	sw	a0,0(s0)
c0000ea0:	00052423          	sw	zero,8(a0)
c0000ea4:	00052623          	sw	zero,12(a0)
c0000ea8:	00052823          	sw	zero,16(a0)
c0000eac:	00010797          	auipc	a5,0x10
c0000eb0:	5947a783          	lw	a5,1428(a5) # c0011440 <swap_init_ok>
c0000eb4:	00079e63          	bnez	a5,c0000ed0 <mm_create+0x54>
c0000eb8:	00052a23          	sw	zero,20(a0)
c0000ebc:	00c12083          	lw	ra,12(sp)
c0000ec0:	00040513          	mv	a0,s0
c0000ec4:	00812403          	lw	s0,8(sp)
c0000ec8:	01010113          	addi	sp,sp,16
c0000ecc:	00008067          	ret
c0000ed0:	5b4010ef          	jal	ra,c0002484 <swap_init_mm>
c0000ed4:	00c12083          	lw	ra,12(sp)
c0000ed8:	00040513          	mv	a0,s0
c0000edc:	00812403          	lw	s0,8(sp)
c0000ee0:	01010113          	addi	sp,sp,16
c0000ee4:	00008067          	ret

c0000ee8 <vma_create>:
c0000ee8:	ff010113          	addi	sp,sp,-16
c0000eec:	01212023          	sw	s2,0(sp)
c0000ef0:	00050913          	mv	s2,a0
c0000ef4:	01800513          	li	a0,24
c0000ef8:	00812423          	sw	s0,8(sp)
c0000efc:	00912223          	sw	s1,4(sp)
c0000f00:	00112623          	sw	ra,12(sp)
c0000f04:	00058493          	mv	s1,a1
c0000f08:	00060413          	mv	s0,a2
c0000f0c:	4a5030ef          	jal	ra,c0004bb0 <kmalloc>
c0000f10:	00050863          	beqz	a0,c0000f20 <vma_create+0x38>
c0000f14:	01252223          	sw	s2,4(a0)
c0000f18:	00952423          	sw	s1,8(a0)
c0000f1c:	00852623          	sw	s0,12(a0)
c0000f20:	00c12083          	lw	ra,12(sp)
c0000f24:	00812403          	lw	s0,8(sp)
c0000f28:	00412483          	lw	s1,4(sp)
c0000f2c:	00012903          	lw	s2,0(sp)
c0000f30:	01010113          	addi	sp,sp,16
c0000f34:	00008067          	ret

c0000f38 <find_vma>:
c0000f38:	04050263          	beqz	a0,c0000f7c <find_vma+0x44>
c0000f3c:	00852783          	lw	a5,8(a0)
c0000f40:	00078663          	beqz	a5,c0000f4c <find_vma+0x14>
c0000f44:	0047a703          	lw	a4,4(a5)
c0000f48:	04e5f063          	bleu	a4,a1,c0000f88 <find_vma+0x50>
c0000f4c:	00050793          	mv	a5,a0
c0000f50:	0047a783          	lw	a5,4(a5)
c0000f54:	02f50463          	beq	a0,a5,c0000f7c <find_vma+0x44>
c0000f58:	ff47a703          	lw	a4,-12(a5)
c0000f5c:	fee5eae3          	bltu	a1,a4,c0000f50 <find_vma+0x18>
c0000f60:	ff87a703          	lw	a4,-8(a5)
c0000f64:	fee5f6e3          	bleu	a4,a1,c0000f50 <find_vma+0x18>
c0000f68:	ff078793          	addi	a5,a5,-16
c0000f6c:	00078863          	beqz	a5,c0000f7c <find_vma+0x44>
c0000f70:	00f52423          	sw	a5,8(a0)
c0000f74:	00078513          	mv	a0,a5
c0000f78:	00008067          	ret
c0000f7c:	00000793          	li	a5,0
c0000f80:	00078513          	mv	a0,a5
c0000f84:	00008067          	ret
c0000f88:	0087a703          	lw	a4,8(a5)
c0000f8c:	fce5f0e3          	bleu	a4,a1,c0000f4c <find_vma+0x14>
c0000f90:	00f52423          	sw	a5,8(a0)
c0000f94:	fe1ff06f          	j	c0000f74 <find_vma+0x3c>

c0000f98 <insert_vma_struct>:
c0000f98:	0045a603          	lw	a2,4(a1)
c0000f9c:	0085a803          	lw	a6,8(a1)
c0000fa0:	ff010113          	addi	sp,sp,-16
c0000fa4:	00112623          	sw	ra,12(sp)
c0000fa8:	00050713          	mv	a4,a0
c0000fac:	01066a63          	bltu	a2,a6,c0000fc0 <insert_vma_struct+0x28>
c0000fb0:	0bc0006f          	j	c000106c <insert_vma_struct+0xd4>
c0000fb4:	ff47a683          	lw	a3,-12(a5)
c0000fb8:	06d66663          	bltu	a2,a3,c0001024 <insert_vma_struct+0x8c>
c0000fbc:	00078713          	mv	a4,a5
c0000fc0:	00472783          	lw	a5,4(a4)
c0000fc4:	fef518e3          	bne	a0,a5,c0000fb4 <insert_vma_struct+0x1c>
c0000fc8:	00050793          	mv	a5,a0
c0000fcc:	0ca70263          	beq	a4,a0,c0001090 <insert_vma_struct+0xf8>
c0000fd0:	ff872683          	lw	a3,-8(a4)
c0000fd4:	ff472883          	lw	a7,-12(a4)
c0000fd8:	0ad8fa63          	bleu	a3,a7,c000108c <insert_vma_struct+0xf4>
c0000fdc:	06d66863          	bltu	a2,a3,c000104c <insert_vma_struct+0xb4>
c0000fe0:	00f50a63          	beq	a0,a5,c0000ff4 <insert_vma_struct+0x5c>
c0000fe4:	ff47a683          	lw	a3,-12(a5)
c0000fe8:	0706e263          	bltu	a3,a6,c000104c <insert_vma_struct+0xb4>
c0000fec:	ff87a603          	lw	a2,-8(a5)
c0000ff0:	02c6fe63          	bleu	a2,a3,c000102c <insert_vma_struct+0x94>
c0000ff4:	01052683          	lw	a3,16(a0)
c0000ff8:	00a5a023          	sw	a0,0(a1)
c0000ffc:	01058613          	addi	a2,a1,16
c0001000:	00c7a023          	sw	a2,0(a5)
c0001004:	00c12083          	lw	ra,12(sp)
c0001008:	00c72223          	sw	a2,4(a4)
c000100c:	00f5aa23          	sw	a5,20(a1)
c0001010:	00e5a823          	sw	a4,16(a1)
c0001014:	00168793          	addi	a5,a3,1
c0001018:	00f52823          	sw	a5,16(a0)
c000101c:	01010113          	addi	sp,sp,16
c0001020:	00008067          	ret
c0001024:	fca702e3          	beq	a4,a0,c0000fe8 <insert_vma_struct+0x50>
c0001028:	fa9ff06f          	j	c0000fd0 <insert_vma_struct+0x38>
c000102c:	00005697          	auipc	a3,0x5
c0001030:	f2068693          	addi	a3,a3,-224 # c0005f4c <commands+0x804>
c0001034:	00005617          	auipc	a2,0x5
c0001038:	e3460613          	addi	a2,a2,-460 # c0005e68 <commands+0x720>
c000103c:	06900593          	li	a1,105
c0001040:	00005517          	auipc	a0,0x5
c0001044:	e4050513          	addi	a0,a0,-448 # c0005e80 <commands+0x738>
c0001048:	a00ff0ef          	jal	ra,c0000248 <__panic>
c000104c:	00005697          	auipc	a3,0x5
c0001050:	ee068693          	addi	a3,a3,-288 # c0005f2c <commands+0x7e4>
c0001054:	00005617          	auipc	a2,0x5
c0001058:	e1460613          	addi	a2,a2,-492 # c0005e68 <commands+0x720>
c000105c:	06800593          	li	a1,104
c0001060:	00005517          	auipc	a0,0x5
c0001064:	e2050513          	addi	a0,a0,-480 # c0005e80 <commands+0x738>
c0001068:	9e0ff0ef          	jal	ra,c0000248 <__panic>
c000106c:	00005697          	auipc	a3,0x5
c0001070:	ea468693          	addi	a3,a3,-348 # c0005f10 <commands+0x7c8>
c0001074:	00005617          	auipc	a2,0x5
c0001078:	df460613          	addi	a2,a2,-524 # c0005e68 <commands+0x720>
c000107c:	07000593          	li	a1,112
c0001080:	00005517          	auipc	a0,0x5
c0001084:	e0050513          	addi	a0,a0,-512 # c0005e80 <commands+0x738>
c0001088:	9c0ff0ef          	jal	ra,c0000248 <__panic>
c000108c:	dc9ff0ef          	jal	ra,c0000e54 <check_vma_overlap.isra.0.part.1>
c0001090:	00070793          	mv	a5,a4
c0001094:	f61ff06f          	j	c0000ff4 <insert_vma_struct+0x5c>

c0001098 <mm_destroy>:
c0001098:	ff010113          	addi	sp,sp,-16
c000109c:	00812423          	sw	s0,8(sp)
c00010a0:	00050413          	mv	s0,a0
c00010a4:	00452503          	lw	a0,4(a0)
c00010a8:	00912223          	sw	s1,4(sp)
c00010ac:	00112623          	sw	ra,12(sp)
c00010b0:	01800493          	li	s1,24
c00010b4:	02a40463          	beq	s0,a0,c00010dc <mm_destroy+0x44>
c00010b8:	00052703          	lw	a4,0(a0)
c00010bc:	00452783          	lw	a5,4(a0)
c00010c0:	00048593          	mv	a1,s1
c00010c4:	ff050513          	addi	a0,a0,-16
c00010c8:	00f72223          	sw	a5,4(a4)
c00010cc:	00e7a023          	sw	a4,0(a5)
c00010d0:	3b9030ef          	jal	ra,c0004c88 <kfree>
c00010d4:	00442503          	lw	a0,4(s0)
c00010d8:	fea410e3          	bne	s0,a0,c00010b8 <mm_destroy+0x20>
c00010dc:	00040513          	mv	a0,s0
c00010e0:	00c12083          	lw	ra,12(sp)
c00010e4:	00812403          	lw	s0,8(sp)
c00010e8:	00412483          	lw	s1,4(sp)
c00010ec:	01800593          	li	a1,24
c00010f0:	01010113          	addi	sp,sp,16
c00010f4:	3950306f          	j	c0004c88 <kfree>

c00010f8 <vmm_init>:
c00010f8:	fd010113          	addi	sp,sp,-48
c00010fc:	02112623          	sw	ra,44(sp)
c0001100:	02812423          	sw	s0,40(sp)
c0001104:	02912223          	sw	s1,36(sp)
c0001108:	03212023          	sw	s2,32(sp)
c000110c:	01512a23          	sw	s5,20(sp)
c0001110:	01612823          	sw	s6,16(sp)
c0001114:	01312e23          	sw	s3,28(sp)
c0001118:	01412c23          	sw	s4,24(sp)
c000111c:	01712623          	sw	s7,12(sp)
c0001120:	508020ef          	jal	ra,c0003628 <nr_free_pages>
c0001124:	00050a93          	mv	s5,a0
c0001128:	500020ef          	jal	ra,c0003628 <nr_free_pages>
c000112c:	00050b13          	mv	s6,a0
c0001130:	d4dff0ef          	jal	ra,c0000e7c <mm_create>
c0001134:	00050493          	mv	s1,a0
c0001138:	03200413          	li	s0,50
c000113c:	01800913          	li	s2,24
c0001140:	02051263          	bnez	a0,c0001164 <vmm_init+0x6c>
c0001144:	5140006f          	j	c0001658 <vmm_init+0x560>
c0001148:	00852223          	sw	s0,4(a0)
c000114c:	00f52423          	sw	a5,8(a0)
c0001150:	00052623          	sw	zero,12(a0)
c0001154:	ffb40413          	addi	s0,s0,-5
c0001158:	00048513          	mv	a0,s1
c000115c:	e3dff0ef          	jal	ra,c0000f98 <insert_vma_struct>
c0001160:	02040c63          	beqz	s0,c0001198 <vmm_init+0xa0>
c0001164:	00090513          	mv	a0,s2
c0001168:	249030ef          	jal	ra,c0004bb0 <kmalloc>
c000116c:	00050593          	mv	a1,a0
c0001170:	00240793          	addi	a5,s0,2
c0001174:	fc051ae3          	bnez	a0,c0001148 <vmm_init+0x50>
c0001178:	00005697          	auipc	a3,0x5
c000117c:	03868693          	addi	a3,a3,56 # c00061b0 <commands+0xa68>
c0001180:	00005617          	auipc	a2,0x5
c0001184:	ce860613          	addi	a2,a2,-792 # c0005e68 <commands+0x720>
c0001188:	0ba00593          	li	a1,186
c000118c:	00005517          	auipc	a0,0x5
c0001190:	cf450513          	addi	a0,a0,-780 # c0005e80 <commands+0x738>
c0001194:	8b4ff0ef          	jal	ra,c0000248 <__panic>
c0001198:	03700413          	li	s0,55
c000119c:	01800913          	li	s2,24
c00011a0:	1f900993          	li	s3,505
c00011a4:	0240006f          	j	c00011c8 <vmm_init+0xd0>
c00011a8:	00852223          	sw	s0,4(a0)
c00011ac:	00f52423          	sw	a5,8(a0)
c00011b0:	00052623          	sw	zero,12(a0)
c00011b4:	00050593          	mv	a1,a0
c00011b8:	00540413          	addi	s0,s0,5
c00011bc:	00048513          	mv	a0,s1
c00011c0:	dd9ff0ef          	jal	ra,c0000f98 <insert_vma_struct>
c00011c4:	03340a63          	beq	s0,s3,c00011f8 <vmm_init+0x100>
c00011c8:	00090513          	mv	a0,s2
c00011cc:	1e5030ef          	jal	ra,c0004bb0 <kmalloc>
c00011d0:	00240793          	addi	a5,s0,2
c00011d4:	fc051ae3          	bnez	a0,c00011a8 <vmm_init+0xb0>
c00011d8:	00005697          	auipc	a3,0x5
c00011dc:	fd868693          	addi	a3,a3,-40 # c00061b0 <commands+0xa68>
c00011e0:	00005617          	auipc	a2,0x5
c00011e4:	c8860613          	addi	a2,a2,-888 # c0005e68 <commands+0x720>
c00011e8:	0c000593          	li	a1,192
c00011ec:	00005517          	auipc	a0,0x5
c00011f0:	c9450513          	addi	a0,a0,-876 # c0005e80 <commands+0x738>
c00011f4:	854ff0ef          	jal	ra,c0000248 <__panic>
c00011f8:	0044a783          	lw	a5,4(s1)
c00011fc:	00700713          	li	a4,7
c0001200:	1fb00593          	li	a1,507
c0001204:	2ef48e63          	beq	s1,a5,c0001500 <vmm_init+0x408>
c0001208:	ff47a603          	lw	a2,-12(a5)
c000120c:	ffe70693          	addi	a3,a4,-2
c0001210:	28d61863          	bne	a2,a3,c00014a0 <vmm_init+0x3a8>
c0001214:	ff87a683          	lw	a3,-8(a5)
c0001218:	28e69463          	bne	a3,a4,c00014a0 <vmm_init+0x3a8>
c000121c:	00570713          	addi	a4,a4,5
c0001220:	0047a783          	lw	a5,4(a5)
c0001224:	feb710e3          	bne	a4,a1,c0001204 <vmm_init+0x10c>
c0001228:	00500413          	li	s0,5
c000122c:	1f900b93          	li	s7,505
c0001230:	00040593          	mv	a1,s0
c0001234:	00048513          	mv	a0,s1
c0001238:	d01ff0ef          	jal	ra,c0000f38 <find_vma>
c000123c:	00050913          	mv	s2,a0
c0001240:	2e050063          	beqz	a0,c0001520 <vmm_init+0x428>
c0001244:	00140593          	addi	a1,s0,1
c0001248:	00048513          	mv	a0,s1
c000124c:	cedff0ef          	jal	ra,c0000f38 <find_vma>
c0001250:	00050993          	mv	s3,a0
c0001254:	34050663          	beqz	a0,c00015a0 <vmm_init+0x4a8>
c0001258:	00240a13          	addi	s4,s0,2
c000125c:	000a0593          	mv	a1,s4
c0001260:	00048513          	mv	a0,s1
c0001264:	cd5ff0ef          	jal	ra,c0000f38 <find_vma>
c0001268:	30051c63          	bnez	a0,c0001580 <vmm_init+0x488>
c000126c:	00340593          	addi	a1,s0,3
c0001270:	00048513          	mv	a0,s1
c0001274:	cc5ff0ef          	jal	ra,c0000f38 <find_vma>
c0001278:	2e051463          	bnez	a0,c0001560 <vmm_init+0x468>
c000127c:	00440593          	addi	a1,s0,4
c0001280:	00048513          	mv	a0,s1
c0001284:	cb5ff0ef          	jal	ra,c0000f38 <find_vma>
c0001288:	2a051c63          	bnez	a0,c0001540 <vmm_init+0x448>
c000128c:	00492783          	lw	a5,4(s2)
c0001290:	24f41863          	bne	s0,a5,c00014e0 <vmm_init+0x3e8>
c0001294:	00892783          	lw	a5,8(s2)
c0001298:	25479463          	bne	a5,s4,c00014e0 <vmm_init+0x3e8>
c000129c:	0049a703          	lw	a4,4(s3)
c00012a0:	22e41063          	bne	s0,a4,c00014c0 <vmm_init+0x3c8>
c00012a4:	0089a703          	lw	a4,8(s3)
c00012a8:	20f71c63          	bne	a4,a5,c00014c0 <vmm_init+0x3c8>
c00012ac:	00540413          	addi	s0,s0,5
c00012b0:	f97410e3          	bne	s0,s7,c0001230 <vmm_init+0x138>
c00012b4:	00400413          	li	s0,4
c00012b8:	fff00913          	li	s2,-1
c00012bc:	00040593          	mv	a1,s0
c00012c0:	00048513          	mv	a0,s1
c00012c4:	c75ff0ef          	jal	ra,c0000f38 <find_vma>
c00012c8:	02050e63          	beqz	a0,c0001304 <vmm_init+0x20c>
c00012cc:	00852683          	lw	a3,8(a0)
c00012d0:	00452603          	lw	a2,4(a0)
c00012d4:	00040593          	mv	a1,s0
c00012d8:	00005517          	auipc	a0,0x5
c00012dc:	da050513          	addi	a0,a0,-608 # c0006078 <commands+0x930>
c00012e0:	df5fe0ef          	jal	ra,c00000d4 <cprintf>
c00012e4:	00005697          	auipc	a3,0x5
c00012e8:	dbc68693          	addi	a3,a3,-580 # c00060a0 <commands+0x958>
c00012ec:	00005617          	auipc	a2,0x5
c00012f0:	b7c60613          	addi	a2,a2,-1156 # c0005e68 <commands+0x720>
c00012f4:	0e200593          	li	a1,226
c00012f8:	00005517          	auipc	a0,0x5
c00012fc:	b8850513          	addi	a0,a0,-1144 # c0005e80 <commands+0x738>
c0001300:	f49fe0ef          	jal	ra,c0000248 <__panic>
c0001304:	fff40413          	addi	s0,s0,-1
c0001308:	fb241ae3          	bne	s0,s2,c00012bc <vmm_init+0x1c4>
c000130c:	00048513          	mv	a0,s1
c0001310:	d89ff0ef          	jal	ra,c0001098 <mm_destroy>
c0001314:	314020ef          	jal	ra,c0003628 <nr_free_pages>
c0001318:	2aab1463          	bne	s6,a0,c00015c0 <vmm_init+0x4c8>
c000131c:	00005517          	auipc	a0,0x5
c0001320:	dc050513          	addi	a0,a0,-576 # c00060dc <commands+0x994>
c0001324:	db1fe0ef          	jal	ra,c00000d4 <cprintf>
c0001328:	300020ef          	jal	ra,c0003628 <nr_free_pages>
c000132c:	00050993          	mv	s3,a0
c0001330:	00010917          	auipc	s2,0x10
c0001334:	12490913          	addi	s2,s2,292 # c0011454 <check_mm_struct>
c0001338:	b45ff0ef          	jal	ra,c0000e7c <mm_create>
c000133c:	00a92023          	sw	a0,0(s2)
c0001340:	00050413          	mv	s0,a0
c0001344:	2e050a63          	beqz	a0,c0001638 <vmm_init+0x540>
c0001348:	00010497          	auipc	s1,0x10
c000134c:	0fc4a483          	lw	s1,252(s1) # c0011444 <boot_pgdir>
c0001350:	0004a783          	lw	a5,0(s1)
c0001354:	00952623          	sw	s1,12(a0)
c0001358:	2c079063          	bnez	a5,c0001618 <vmm_init+0x520>
c000135c:	01800513          	li	a0,24
c0001360:	051030ef          	jal	ra,c0004bb0 <kmalloc>
c0001364:	00050a13          	mv	s4,a0
c0001368:	10050c63          	beqz	a0,c0001480 <vmm_init+0x388>
c000136c:	004007b7          	lui	a5,0x400
c0001370:	00fa2423          	sw	a5,8(s4)
c0001374:	00200793          	li	a5,2
c0001378:	00050593          	mv	a1,a0
c000137c:	00fa2623          	sw	a5,12(s4)
c0001380:	00040513          	mv	a0,s0
c0001384:	000a2223          	sw	zero,4(s4)
c0001388:	c11ff0ef          	jal	ra,c0000f98 <insert_vma_struct>
c000138c:	10000593          	li	a1,256
c0001390:	00040513          	mv	a0,s0
c0001394:	ba5ff0ef          	jal	ra,c0000f38 <find_vma>
c0001398:	00000793          	li	a5,0
c000139c:	06400713          	li	a4,100
c00013a0:	30aa1c63          	bne	s4,a0,c00016b8 <vmm_init+0x5c0>
c00013a4:	10f78023          	sb	a5,256(a5) # 400100 <BASE_ADDRESS-0xbfbfff00>
c00013a8:	00178793          	addi	a5,a5,1
c00013ac:	fee79ce3          	bne	a5,a4,c00013a4 <vmm_init+0x2ac>
c00013b0:	00001737          	lui	a4,0x1
c00013b4:	35670713          	addi	a4,a4,854 # 1356 <BASE_ADDRESS-0xbfffecaa>
c00013b8:	00000793          	li	a5,0
c00013bc:	06400613          	li	a2,100
c00013c0:	1007c683          	lbu	a3,256(a5)
c00013c4:	00178793          	addi	a5,a5,1
c00013c8:	40d70733          	sub	a4,a4,a3
c00013cc:	fec79ae3          	bne	a5,a2,c00013c0 <vmm_init+0x2c8>
c00013d0:	2c071463          	bnez	a4,c0001698 <vmm_init+0x5a0>
c00013d4:	00000593          	li	a1,0
c00013d8:	00048513          	mv	a0,s1
c00013dc:	598020ef          	jal	ra,c0003974 <page_remove>
c00013e0:	0004a783          	lw	a5,0(s1)
c00013e4:	00010717          	auipc	a4,0x10
c00013e8:	06472703          	lw	a4,100(a4) # c0011448 <npage>
c00013ec:	00279793          	slli	a5,a5,0x2
c00013f0:	00c7d793          	srli	a5,a5,0xc
c00013f4:	20e7f663          	bleu	a4,a5,c0001600 <vmm_init+0x508>
c00013f8:	00009717          	auipc	a4,0x9
c00013fc:	c2872703          	lw	a4,-984(a4) # c000a020 <nbase>
c0001400:	40e787b3          	sub	a5,a5,a4
c0001404:	00579793          	slli	a5,a5,0x5
c0001408:	00010517          	auipc	a0,0x10
c000140c:	10c52503          	lw	a0,268(a0) # c0011514 <pages>
c0001410:	00f50533          	add	a0,a0,a5
c0001414:	00100593          	li	a1,1
c0001418:	1ac020ef          	jal	ra,c00035c4 <free_pages>
c000141c:	0004a023          	sw	zero,0(s1)
c0001420:	00042623          	sw	zero,12(s0)
c0001424:	00040513          	mv	a0,s0
c0001428:	c71ff0ef          	jal	ra,c0001098 <mm_destroy>
c000142c:	00092023          	sw	zero,0(s2)
c0001430:	1f8020ef          	jal	ra,c0003628 <nr_free_pages>
c0001434:	1aa99663          	bne	s3,a0,c00015e0 <vmm_init+0x4e8>
c0001438:	00005517          	auipc	a0,0x5
c000143c:	d4450513          	addi	a0,a0,-700 # c000617c <commands+0xa34>
c0001440:	c95fe0ef          	jal	ra,c00000d4 <cprintf>
c0001444:	1e4020ef          	jal	ra,c0003628 <nr_free_pages>
c0001448:	22aa9863          	bne	s5,a0,c0001678 <vmm_init+0x580>
c000144c:	02c12083          	lw	ra,44(sp)
c0001450:	02812403          	lw	s0,40(sp)
c0001454:	02412483          	lw	s1,36(sp)
c0001458:	02012903          	lw	s2,32(sp)
c000145c:	01c12983          	lw	s3,28(sp)
c0001460:	01812a03          	lw	s4,24(sp)
c0001464:	01412a83          	lw	s5,20(sp)
c0001468:	01012b03          	lw	s6,16(sp)
c000146c:	00c12b83          	lw	s7,12(sp)
c0001470:	00005517          	auipc	a0,0x5
c0001474:	d2850513          	addi	a0,a0,-728 # c0006198 <commands+0xa50>
c0001478:	03010113          	addi	sp,sp,48
c000147c:	c59fe06f          	j	c00000d4 <cprintf>
c0001480:	00005697          	auipc	a3,0x5
c0001484:	d3068693          	addi	a3,a3,-720 # c00061b0 <commands+0xa68>
c0001488:	00005617          	auipc	a2,0x5
c000148c:	9e060613          	addi	a2,a2,-1568 # c0005e68 <commands+0x720>
c0001490:	0fa00593          	li	a1,250
c0001494:	00005517          	auipc	a0,0x5
c0001498:	9ec50513          	addi	a0,a0,-1556 # c0005e80 <commands+0x738>
c000149c:	dadfe0ef          	jal	ra,c0000248 <__panic>
c00014a0:	00005697          	auipc	a3,0x5
c00014a4:	af068693          	addi	a3,a3,-1296 # c0005f90 <commands+0x848>
c00014a8:	00005617          	auipc	a2,0x5
c00014ac:	9c060613          	addi	a2,a2,-1600 # c0005e68 <commands+0x720>
c00014b0:	0c900593          	li	a1,201
c00014b4:	00005517          	auipc	a0,0x5
c00014b8:	9cc50513          	addi	a0,a0,-1588 # c0005e80 <commands+0x738>
c00014bc:	d8dfe0ef          	jal	ra,c0000248 <__panic>
c00014c0:	00005697          	auipc	a3,0x5
c00014c4:	b8868693          	addi	a3,a3,-1144 # c0006048 <commands+0x900>
c00014c8:	00005617          	auipc	a2,0x5
c00014cc:	9a060613          	addi	a2,a2,-1632 # c0005e68 <commands+0x720>
c00014d0:	0da00593          	li	a1,218
c00014d4:	00005517          	auipc	a0,0x5
c00014d8:	9ac50513          	addi	a0,a0,-1620 # c0005e80 <commands+0x738>
c00014dc:	d6dfe0ef          	jal	ra,c0000248 <__panic>
c00014e0:	00005697          	auipc	a3,0x5
c00014e4:	b3868693          	addi	a3,a3,-1224 # c0006018 <commands+0x8d0>
c00014e8:	00005617          	auipc	a2,0x5
c00014ec:	98060613          	addi	a2,a2,-1664 # c0005e68 <commands+0x720>
c00014f0:	0d900593          	li	a1,217
c00014f4:	00005517          	auipc	a0,0x5
c00014f8:	98c50513          	addi	a0,a0,-1652 # c0005e80 <commands+0x738>
c00014fc:	d4dfe0ef          	jal	ra,c0000248 <__panic>
c0001500:	00005697          	auipc	a3,0x5
c0001504:	a7868693          	addi	a3,a3,-1416 # c0005f78 <commands+0x830>
c0001508:	00005617          	auipc	a2,0x5
c000150c:	96060613          	addi	a2,a2,-1696 # c0005e68 <commands+0x720>
c0001510:	0c700593          	li	a1,199
c0001514:	00005517          	auipc	a0,0x5
c0001518:	96c50513          	addi	a0,a0,-1684 # c0005e80 <commands+0x738>
c000151c:	d2dfe0ef          	jal	ra,c0000248 <__panic>
c0001520:	00005697          	auipc	a3,0x5
c0001524:	aa868693          	addi	a3,a3,-1368 # c0005fc8 <commands+0x880>
c0001528:	00005617          	auipc	a2,0x5
c000152c:	94060613          	addi	a2,a2,-1728 # c0005e68 <commands+0x720>
c0001530:	0cf00593          	li	a1,207
c0001534:	00005517          	auipc	a0,0x5
c0001538:	94c50513          	addi	a0,a0,-1716 # c0005e80 <commands+0x738>
c000153c:	d0dfe0ef          	jal	ra,c0000248 <__panic>
c0001540:	00005697          	auipc	a3,0x5
c0001544:	ac868693          	addi	a3,a3,-1336 # c0006008 <commands+0x8c0>
c0001548:	00005617          	auipc	a2,0x5
c000154c:	92060613          	addi	a2,a2,-1760 # c0005e68 <commands+0x720>
c0001550:	0d700593          	li	a1,215
c0001554:	00005517          	auipc	a0,0x5
c0001558:	92c50513          	addi	a0,a0,-1748 # c0005e80 <commands+0x738>
c000155c:	cedfe0ef          	jal	ra,c0000248 <__panic>
c0001560:	00005697          	auipc	a3,0x5
c0001564:	a9868693          	addi	a3,a3,-1384 # c0005ff8 <commands+0x8b0>
c0001568:	00005617          	auipc	a2,0x5
c000156c:	90060613          	addi	a2,a2,-1792 # c0005e68 <commands+0x720>
c0001570:	0d500593          	li	a1,213
c0001574:	00005517          	auipc	a0,0x5
c0001578:	90c50513          	addi	a0,a0,-1780 # c0005e80 <commands+0x738>
c000157c:	ccdfe0ef          	jal	ra,c0000248 <__panic>
c0001580:	00005697          	auipc	a3,0x5
c0001584:	a6868693          	addi	a3,a3,-1432 # c0005fe8 <commands+0x8a0>
c0001588:	00005617          	auipc	a2,0x5
c000158c:	8e060613          	addi	a2,a2,-1824 # c0005e68 <commands+0x720>
c0001590:	0d300593          	li	a1,211
c0001594:	00005517          	auipc	a0,0x5
c0001598:	8ec50513          	addi	a0,a0,-1812 # c0005e80 <commands+0x738>
c000159c:	cadfe0ef          	jal	ra,c0000248 <__panic>
c00015a0:	00005697          	auipc	a3,0x5
c00015a4:	a3868693          	addi	a3,a3,-1480 # c0005fd8 <commands+0x890>
c00015a8:	00005617          	auipc	a2,0x5
c00015ac:	8c060613          	addi	a2,a2,-1856 # c0005e68 <commands+0x720>
c00015b0:	0d100593          	li	a1,209
c00015b4:	00005517          	auipc	a0,0x5
c00015b8:	8cc50513          	addi	a0,a0,-1844 # c0005e80 <commands+0x738>
c00015bc:	c8dfe0ef          	jal	ra,c0000248 <__panic>
c00015c0:	00005697          	auipc	a3,0x5
c00015c4:	af468693          	addi	a3,a3,-1292 # c00060b4 <commands+0x96c>
c00015c8:	00005617          	auipc	a2,0x5
c00015cc:	8a060613          	addi	a2,a2,-1888 # c0005e68 <commands+0x720>
c00015d0:	0e700593          	li	a1,231
c00015d4:	00005517          	auipc	a0,0x5
c00015d8:	8ac50513          	addi	a0,a0,-1876 # c0005e80 <commands+0x738>
c00015dc:	c6dfe0ef          	jal	ra,c0000248 <__panic>
c00015e0:	00005697          	auipc	a3,0x5
c00015e4:	ad468693          	addi	a3,a3,-1324 # c00060b4 <commands+0x96c>
c00015e8:	00005617          	auipc	a2,0x5
c00015ec:	88060613          	addi	a2,a2,-1920 # c0005e68 <commands+0x720>
c00015f0:	11300593          	li	a1,275
c00015f4:	00005517          	auipc	a0,0x5
c00015f8:	88c50513          	addi	a0,a0,-1908 # c0005e80 <commands+0x738>
c00015fc:	c4dfe0ef          	jal	ra,c0000248 <__panic>
c0001600:	00005617          	auipc	a2,0x5
c0001604:	b4c60613          	addi	a2,a2,-1204 # c000614c <commands+0xa04>
c0001608:	06600593          	li	a1,102
c000160c:	00005517          	auipc	a0,0x5
c0001610:	b6050513          	addi	a0,a0,-1184 # c000616c <commands+0xa24>
c0001614:	c35fe0ef          	jal	ra,c0000248 <__panic>
c0001618:	00005697          	auipc	a3,0x5
c000161c:	afc68693          	addi	a3,a3,-1284 # c0006114 <commands+0x9cc>
c0001620:	00005617          	auipc	a2,0x5
c0001624:	84860613          	addi	a2,a2,-1976 # c0005e68 <commands+0x720>
c0001628:	0f700593          	li	a1,247
c000162c:	00005517          	auipc	a0,0x5
c0001630:	85450513          	addi	a0,a0,-1964 # c0005e80 <commands+0x738>
c0001634:	c15fe0ef          	jal	ra,c0000248 <__panic>
c0001638:	00005697          	auipc	a3,0x5
c000163c:	ac468693          	addi	a3,a3,-1340 # c00060fc <commands+0x9b4>
c0001640:	00005617          	auipc	a2,0x5
c0001644:	82860613          	addi	a2,a2,-2008 # c0005e68 <commands+0x720>
c0001648:	0f400593          	li	a1,244
c000164c:	00005517          	auipc	a0,0x5
c0001650:	83450513          	addi	a0,a0,-1996 # c0005e80 <commands+0x738>
c0001654:	bf5fe0ef          	jal	ra,c0000248 <__panic>
c0001658:	00005697          	auipc	a3,0x5
c000165c:	91468693          	addi	a3,a3,-1772 # c0005f6c <commands+0x824>
c0001660:	00005617          	auipc	a2,0x5
c0001664:	80860613          	addi	a2,a2,-2040 # c0005e68 <commands+0x720>
c0001668:	0b300593          	li	a1,179
c000166c:	00005517          	auipc	a0,0x5
c0001670:	81450513          	addi	a0,a0,-2028 # c0005e80 <commands+0x738>
c0001674:	bd5fe0ef          	jal	ra,c0000248 <__panic>
c0001678:	00005697          	auipc	a3,0x5
c000167c:	a3c68693          	addi	a3,a3,-1476 # c00060b4 <commands+0x96c>
c0001680:	00004617          	auipc	a2,0x4
c0001684:	7e860613          	addi	a2,a2,2024 # c0005e68 <commands+0x720>
c0001688:	0a900593          	li	a1,169
c000168c:	00004517          	auipc	a0,0x4
c0001690:	7f450513          	addi	a0,a0,2036 # c0005e80 <commands+0x738>
c0001694:	bb5fe0ef          	jal	ra,c0000248 <__panic>
c0001698:	00005697          	auipc	a3,0x5
c000169c:	aa868693          	addi	a3,a3,-1368 # c0006140 <commands+0x9f8>
c00016a0:	00004617          	auipc	a2,0x4
c00016a4:	7c860613          	addi	a2,a2,1992 # c0005e68 <commands+0x720>
c00016a8:	10900593          	li	a1,265
c00016ac:	00004517          	auipc	a0,0x4
c00016b0:	7d450513          	addi	a0,a0,2004 # c0005e80 <commands+0x738>
c00016b4:	b95fe0ef          	jal	ra,c0000248 <__panic>
c00016b8:	00005697          	auipc	a3,0x5
c00016bc:	a6c68693          	addi	a3,a3,-1428 # c0006124 <commands+0x9dc>
c00016c0:	00004617          	auipc	a2,0x4
c00016c4:	7a860613          	addi	a2,a2,1960 # c0005e68 <commands+0x720>
c00016c8:	0ff00593          	li	a1,255
c00016cc:	00004517          	auipc	a0,0x4
c00016d0:	7b450513          	addi	a0,a0,1972 # c0005e80 <commands+0x738>
c00016d4:	b75fe0ef          	jal	ra,c0000248 <__panic>

c00016d8 <do_pgfault>:
c00016d8:	fe010113          	addi	sp,sp,-32
c00016dc:	00060593          	mv	a1,a2
c00016e0:	00812c23          	sw	s0,24(sp)
c00016e4:	00912a23          	sw	s1,20(sp)
c00016e8:	00112e23          	sw	ra,28(sp)
c00016ec:	01212823          	sw	s2,16(sp)
c00016f0:	00060413          	mv	s0,a2
c00016f4:	00050493          	mv	s1,a0
c00016f8:	841ff0ef          	jal	ra,c0000f38 <find_vma>
c00016fc:	00010797          	auipc	a5,0x10
c0001700:	d3c7a783          	lw	a5,-708(a5) # c0011438 <pgfault_num>
c0001704:	00178793          	addi	a5,a5,1
c0001708:	00010297          	auipc	t0,0x10
c000170c:	d2f2a823          	sw	a5,-720(t0) # c0011438 <pgfault_num>
c0001710:	0e050063          	beqz	a0,c00017f0 <do_pgfault+0x118>
c0001714:	00452783          	lw	a5,4(a0)
c0001718:	0cf46c63          	bltu	s0,a5,c00017f0 <do_pgfault+0x118>
c000171c:	00c52783          	lw	a5,12(a0)
c0001720:	01000913          	li	s2,16
c0001724:	0027f793          	andi	a5,a5,2
c0001728:	08079a63          	bnez	a5,c00017bc <do_pgfault+0xe4>
c000172c:	fffff637          	lui	a2,0xfffff
c0001730:	00c4a503          	lw	a0,12(s1)
c0001734:	00c47433          	and	s0,s0,a2
c0001738:	00040593          	mv	a1,s0
c000173c:	00100613          	li	a2,1
c0001740:	741010ef          	jal	ra,c0003680 <get_pte>
c0001744:	00052583          	lw	a1,0(a0)
c0001748:	06058e63          	beqz	a1,c00017c4 <do_pgfault+0xec>
c000174c:	00010797          	auipc	a5,0x10
c0001750:	cf47a783          	lw	a5,-780(a5) # c0011440 <swap_init_ok>
c0001754:	0a078a63          	beqz	a5,c0001808 <do_pgfault+0x130>
c0001758:	00040593          	mv	a1,s0
c000175c:	00c10613          	addi	a2,sp,12
c0001760:	00048513          	mv	a0,s1
c0001764:	00012623          	sw	zero,12(sp)
c0001768:	6e9000ef          	jal	ra,c0002650 <swap_in>
c000176c:	00c12583          	lw	a1,12(sp)
c0001770:	00c4a503          	lw	a0,12(s1)
c0001774:	00090693          	mv	a3,s2
c0001778:	00040613          	mv	a2,s0
c000177c:	294020ef          	jal	ra,c0003a10 <page_insert>
c0001780:	00c12603          	lw	a2,12(sp)
c0001784:	00100693          	li	a3,1
c0001788:	00040593          	mv	a1,s0
c000178c:	00048513          	mv	a0,s1
c0001790:	505000ef          	jal	ra,c0002494 <swap_map_swappable>
c0001794:	00c12703          	lw	a4,12(sp)
c0001798:	00000793          	li	a5,0
c000179c:	00872e23          	sw	s0,28(a4)
c00017a0:	01c12083          	lw	ra,28(sp)
c00017a4:	00078513          	mv	a0,a5
c00017a8:	01812403          	lw	s0,24(sp)
c00017ac:	01412483          	lw	s1,20(sp)
c00017b0:	01012903          	lw	s2,16(sp)
c00017b4:	02010113          	addi	sp,sp,32
c00017b8:	00008067          	ret
c00017bc:	01600913          	li	s2,22
c00017c0:	f6dff06f          	j	c000172c <do_pgfault+0x54>
c00017c4:	00c4a503          	lw	a0,12(s1)
c00017c8:	00090613          	mv	a2,s2
c00017cc:	00040593          	mv	a1,s0
c00017d0:	350020ef          	jal	ra,c0003b20 <pgdir_alloc_page>
c00017d4:	00000793          	li	a5,0
c00017d8:	fc0514e3          	bnez	a0,c00017a0 <do_pgfault+0xc8>
c00017dc:	00004517          	auipc	a0,0x4
c00017e0:	6e450513          	addi	a0,a0,1764 # c0005ec0 <commands+0x778>
c00017e4:	8f1fe0ef          	jal	ra,c00000d4 <cprintf>
c00017e8:	ffc00793          	li	a5,-4
c00017ec:	fb5ff06f          	j	c00017a0 <do_pgfault+0xc8>
c00017f0:	00040593          	mv	a1,s0
c00017f4:	00004517          	auipc	a0,0x4
c00017f8:	69c50513          	addi	a0,a0,1692 # c0005e90 <commands+0x748>
c00017fc:	8d9fe0ef          	jal	ra,c00000d4 <cprintf>
c0001800:	ffd00793          	li	a5,-3
c0001804:	f9dff06f          	j	c00017a0 <do_pgfault+0xc8>
c0001808:	00004517          	auipc	a0,0x4
c000180c:	6e050513          	addi	a0,a0,1760 # c0005ee8 <commands+0x7a0>
c0001810:	8c5fe0ef          	jal	ra,c00000d4 <cprintf>
c0001814:	ffc00793          	li	a5,-4
c0001818:	f89ff06f          	j	c00017a0 <do_pgfault+0xc8>

c000181c <_fifo_init_mm>:
c000181c:	00010797          	auipc	a5,0x10
c0001820:	c3c78793          	addi	a5,a5,-964 # c0011458 <pra_list_head>
c0001824:	00f52a23          	sw	a5,20(a0)
c0001828:	00f7a223          	sw	a5,4(a5)
c000182c:	00f7a023          	sw	a5,0(a5)
c0001830:	00000513          	li	a0,0
c0001834:	00008067          	ret

c0001838 <_fifo_init>:
c0001838:	00000513          	li	a0,0
c000183c:	00008067          	ret

c0001840 <_fifo_set_unswappable>:
c0001840:	00000513          	li	a0,0
c0001844:	00008067          	ret

c0001848 <_fifo_tick_event>:
c0001848:	00000513          	li	a0,0
c000184c:	00008067          	ret

c0001850 <_fifo_check_swap>:
c0001850:	fd010113          	addi	sp,sp,-48
c0001854:	03212023          	sw	s2,32(sp)
c0001858:	01312e23          	sw	s3,28(sp)
c000185c:	00005517          	auipc	a0,0x5
c0001860:	96050513          	addi	a0,a0,-1696 # c00061bc <commands+0xa74>
c0001864:	00003937          	lui	s2,0x3
c0001868:	00c00993          	li	s3,12
c000186c:	02812423          	sw	s0,40(sp)
c0001870:	02112623          	sw	ra,44(sp)
c0001874:	02912223          	sw	s1,36(sp)
c0001878:	01412c23          	sw	s4,24(sp)
c000187c:	01512a23          	sw	s5,20(sp)
c0001880:	01612823          	sw	s6,16(sp)
c0001884:	01712623          	sw	s7,12(sp)
c0001888:	01812423          	sw	s8,8(sp)
c000188c:	849fe0ef          	jal	ra,c00000d4 <cprintf>
c0001890:	01390023          	sb	s3,0(s2) # 3000 <BASE_ADDRESS-0xbfffd000>
c0001894:	00010417          	auipc	s0,0x10
c0001898:	ba442403          	lw	s0,-1116(s0) # c0011438 <pgfault_num>
c000189c:	00400793          	li	a5,4
c00018a0:	1af41c63          	bne	s0,a5,c0001a58 <_fifo_check_swap+0x208>
c00018a4:	00005517          	auipc	a0,0x5
c00018a8:	96450513          	addi	a0,a0,-1692 # c0006208 <commands+0xac0>
c00018ac:	00001ab7          	lui	s5,0x1
c00018b0:	00a00b13          	li	s6,10
c00018b4:	821fe0ef          	jal	ra,c00000d4 <cprintf>
c00018b8:	016a8023          	sb	s6,0(s5) # 1000 <BASE_ADDRESS-0xbffff000>
c00018bc:	00010497          	auipc	s1,0x10
c00018c0:	b7c4a483          	lw	s1,-1156(s1) # c0011438 <pgfault_num>
c00018c4:	30849a63          	bne	s1,s0,c0001bd8 <_fifo_check_swap+0x388>
c00018c8:	00005517          	auipc	a0,0x5
c00018cc:	96850513          	addi	a0,a0,-1688 # c0006230 <commands+0xae8>
c00018d0:	00004bb7          	lui	s7,0x4
c00018d4:	00d00c13          	li	s8,13
c00018d8:	ffcfe0ef          	jal	ra,c00000d4 <cprintf>
c00018dc:	018b8023          	sb	s8,0(s7) # 4000 <BASE_ADDRESS-0xbfffc000>
c00018e0:	00010a17          	auipc	s4,0x10
c00018e4:	b58a2a03          	lw	s4,-1192(s4) # c0011438 <pgfault_num>
c00018e8:	2c9a1863          	bne	s4,s1,c0001bb8 <_fifo_check_swap+0x368>
c00018ec:	00005517          	auipc	a0,0x5
c00018f0:	96c50513          	addi	a0,a0,-1684 # c0006258 <commands+0xb10>
c00018f4:	00002437          	lui	s0,0x2
c00018f8:	00b00493          	li	s1,11
c00018fc:	fd8fe0ef          	jal	ra,c00000d4 <cprintf>
c0001900:	00940023          	sb	s1,0(s0) # 2000 <BASE_ADDRESS-0xbfffe000>
c0001904:	00010797          	auipc	a5,0x10
c0001908:	b347a783          	lw	a5,-1228(a5) # c0011438 <pgfault_num>
c000190c:	29479663          	bne	a5,s4,c0001b98 <_fifo_check_swap+0x348>
c0001910:	00005517          	auipc	a0,0x5
c0001914:	97050513          	addi	a0,a0,-1680 # c0006280 <commands+0xb38>
c0001918:	fbcfe0ef          	jal	ra,c00000d4 <cprintf>
c000191c:	000057b7          	lui	a5,0x5
c0001920:	00e00713          	li	a4,14
c0001924:	00e78023          	sb	a4,0(a5) # 5000 <BASE_ADDRESS-0xbfffb000>
c0001928:	00010a17          	auipc	s4,0x10
c000192c:	b10a2a03          	lw	s4,-1264(s4) # c0011438 <pgfault_num>
c0001930:	00500793          	li	a5,5
c0001934:	24fa1263          	bne	s4,a5,c0001b78 <_fifo_check_swap+0x328>
c0001938:	00005517          	auipc	a0,0x5
c000193c:	92050513          	addi	a0,a0,-1760 # c0006258 <commands+0xb10>
c0001940:	f94fe0ef          	jal	ra,c00000d4 <cprintf>
c0001944:	00940023          	sb	s1,0(s0)
c0001948:	00010797          	auipc	a5,0x10
c000194c:	af07a783          	lw	a5,-1296(a5) # c0011438 <pgfault_num>
c0001950:	21479463          	bne	a5,s4,c0001b58 <_fifo_check_swap+0x308>
c0001954:	00005517          	auipc	a0,0x5
c0001958:	8b450513          	addi	a0,a0,-1868 # c0006208 <commands+0xac0>
c000195c:	f78fe0ef          	jal	ra,c00000d4 <cprintf>
c0001960:	016a8023          	sb	s6,0(s5)
c0001964:	00010717          	auipc	a4,0x10
c0001968:	ad472703          	lw	a4,-1324(a4) # c0011438 <pgfault_num>
c000196c:	00600793          	li	a5,6
c0001970:	1cf71463          	bne	a4,a5,c0001b38 <_fifo_check_swap+0x2e8>
c0001974:	00005517          	auipc	a0,0x5
c0001978:	8e450513          	addi	a0,a0,-1820 # c0006258 <commands+0xb10>
c000197c:	f58fe0ef          	jal	ra,c00000d4 <cprintf>
c0001980:	00940023          	sb	s1,0(s0)
c0001984:	00010717          	auipc	a4,0x10
c0001988:	ab472703          	lw	a4,-1356(a4) # c0011438 <pgfault_num>
c000198c:	00700793          	li	a5,7
c0001990:	18f71463          	bne	a4,a5,c0001b18 <_fifo_check_swap+0x2c8>
c0001994:	00005517          	auipc	a0,0x5
c0001998:	82850513          	addi	a0,a0,-2008 # c00061bc <commands+0xa74>
c000199c:	f38fe0ef          	jal	ra,c00000d4 <cprintf>
c00019a0:	01390023          	sb	s3,0(s2)
c00019a4:	00010717          	auipc	a4,0x10
c00019a8:	a9472703          	lw	a4,-1388(a4) # c0011438 <pgfault_num>
c00019ac:	00800793          	li	a5,8
c00019b0:	14f71463          	bne	a4,a5,c0001af8 <_fifo_check_swap+0x2a8>
c00019b4:	00005517          	auipc	a0,0x5
c00019b8:	87c50513          	addi	a0,a0,-1924 # c0006230 <commands+0xae8>
c00019bc:	f18fe0ef          	jal	ra,c00000d4 <cprintf>
c00019c0:	018b8023          	sb	s8,0(s7)
c00019c4:	00010717          	auipc	a4,0x10
c00019c8:	a7472703          	lw	a4,-1420(a4) # c0011438 <pgfault_num>
c00019cc:	00900793          	li	a5,9
c00019d0:	10f71463          	bne	a4,a5,c0001ad8 <_fifo_check_swap+0x288>
c00019d4:	00005517          	auipc	a0,0x5
c00019d8:	8ac50513          	addi	a0,a0,-1876 # c0006280 <commands+0xb38>
c00019dc:	ef8fe0ef          	jal	ra,c00000d4 <cprintf>
c00019e0:	000057b7          	lui	a5,0x5
c00019e4:	00e00713          	li	a4,14
c00019e8:	00e78023          	sb	a4,0(a5) # 5000 <BASE_ADDRESS-0xbfffb000>
c00019ec:	00010417          	auipc	s0,0x10
c00019f0:	a4c42403          	lw	s0,-1460(s0) # c0011438 <pgfault_num>
c00019f4:	00a00793          	li	a5,10
c00019f8:	0cf41063          	bne	s0,a5,c0001ab8 <_fifo_check_swap+0x268>
c00019fc:	00005517          	auipc	a0,0x5
c0001a00:	80c50513          	addi	a0,a0,-2036 # c0006208 <commands+0xac0>
c0001a04:	ed0fe0ef          	jal	ra,c00000d4 <cprintf>
c0001a08:	000017b7          	lui	a5,0x1
c0001a0c:	0007c783          	lbu	a5,0(a5) # 1000 <BASE_ADDRESS-0xbffff000>
c0001a10:	08879463          	bne	a5,s0,c0001a98 <_fifo_check_swap+0x248>
c0001a14:	00010717          	auipc	a4,0x10
c0001a18:	a2472703          	lw	a4,-1500(a4) # c0011438 <pgfault_num>
c0001a1c:	00b00793          	li	a5,11
c0001a20:	04f71c63          	bne	a4,a5,c0001a78 <_fifo_check_swap+0x228>
c0001a24:	02c12083          	lw	ra,44(sp)
c0001a28:	00000513          	li	a0,0
c0001a2c:	02812403          	lw	s0,40(sp)
c0001a30:	02412483          	lw	s1,36(sp)
c0001a34:	02012903          	lw	s2,32(sp)
c0001a38:	01c12983          	lw	s3,28(sp)
c0001a3c:	01812a03          	lw	s4,24(sp)
c0001a40:	01412a83          	lw	s5,20(sp)
c0001a44:	01012b03          	lw	s6,16(sp)
c0001a48:	00c12b83          	lw	s7,12(sp)
c0001a4c:	00812c03          	lw	s8,8(sp)
c0001a50:	03010113          	addi	sp,sp,48
c0001a54:	00008067          	ret
c0001a58:	00004697          	auipc	a3,0x4
c0001a5c:	78c68693          	addi	a3,a3,1932 # c00061e4 <commands+0xa9c>
c0001a60:	00004617          	auipc	a2,0x4
c0001a64:	40860613          	addi	a2,a2,1032 # c0005e68 <commands+0x720>
c0001a68:	05500593          	li	a1,85
c0001a6c:	00004517          	auipc	a0,0x4
c0001a70:	78850513          	addi	a0,a0,1928 # c00061f4 <commands+0xaac>
c0001a74:	fd4fe0ef          	jal	ra,c0000248 <__panic>
c0001a78:	00005697          	auipc	a3,0x5
c0001a7c:	8b468693          	addi	a3,a3,-1868 # c000632c <commands+0xbe4>
c0001a80:	00004617          	auipc	a2,0x4
c0001a84:	3e860613          	addi	a2,a2,1000 # c0005e68 <commands+0x720>
c0001a88:	07700593          	li	a1,119
c0001a8c:	00004517          	auipc	a0,0x4
c0001a90:	76850513          	addi	a0,a0,1896 # c00061f4 <commands+0xaac>
c0001a94:	fb4fe0ef          	jal	ra,c0000248 <__panic>
c0001a98:	00005697          	auipc	a3,0x5
c0001a9c:	87068693          	addi	a3,a3,-1936 # c0006308 <commands+0xbc0>
c0001aa0:	00004617          	auipc	a2,0x4
c0001aa4:	3c860613          	addi	a2,a2,968 # c0005e68 <commands+0x720>
c0001aa8:	07500593          	li	a1,117
c0001aac:	00004517          	auipc	a0,0x4
c0001ab0:	74850513          	addi	a0,a0,1864 # c00061f4 <commands+0xaac>
c0001ab4:	f94fe0ef          	jal	ra,c0000248 <__panic>
c0001ab8:	00005697          	auipc	a3,0x5
c0001abc:	84068693          	addi	a3,a3,-1984 # c00062f8 <commands+0xbb0>
c0001ac0:	00004617          	auipc	a2,0x4
c0001ac4:	3a860613          	addi	a2,a2,936 # c0005e68 <commands+0x720>
c0001ac8:	07300593          	li	a1,115
c0001acc:	00004517          	auipc	a0,0x4
c0001ad0:	72850513          	addi	a0,a0,1832 # c00061f4 <commands+0xaac>
c0001ad4:	f74fe0ef          	jal	ra,c0000248 <__panic>
c0001ad8:	00005697          	auipc	a3,0x5
c0001adc:	81068693          	addi	a3,a3,-2032 # c00062e8 <commands+0xba0>
c0001ae0:	00004617          	auipc	a2,0x4
c0001ae4:	38860613          	addi	a2,a2,904 # c0005e68 <commands+0x720>
c0001ae8:	07000593          	li	a1,112
c0001aec:	00004517          	auipc	a0,0x4
c0001af0:	70850513          	addi	a0,a0,1800 # c00061f4 <commands+0xaac>
c0001af4:	f54fe0ef          	jal	ra,c0000248 <__panic>
c0001af8:	00004697          	auipc	a3,0x4
c0001afc:	7e068693          	addi	a3,a3,2016 # c00062d8 <commands+0xb90>
c0001b00:	00004617          	auipc	a2,0x4
c0001b04:	36860613          	addi	a2,a2,872 # c0005e68 <commands+0x720>
c0001b08:	06d00593          	li	a1,109
c0001b0c:	00004517          	auipc	a0,0x4
c0001b10:	6e850513          	addi	a0,a0,1768 # c00061f4 <commands+0xaac>
c0001b14:	f34fe0ef          	jal	ra,c0000248 <__panic>
c0001b18:	00004697          	auipc	a3,0x4
c0001b1c:	7b068693          	addi	a3,a3,1968 # c00062c8 <commands+0xb80>
c0001b20:	00004617          	auipc	a2,0x4
c0001b24:	34860613          	addi	a2,a2,840 # c0005e68 <commands+0x720>
c0001b28:	06a00593          	li	a1,106
c0001b2c:	00004517          	auipc	a0,0x4
c0001b30:	6c850513          	addi	a0,a0,1736 # c00061f4 <commands+0xaac>
c0001b34:	f14fe0ef          	jal	ra,c0000248 <__panic>
c0001b38:	00004697          	auipc	a3,0x4
c0001b3c:	78068693          	addi	a3,a3,1920 # c00062b8 <commands+0xb70>
c0001b40:	00004617          	auipc	a2,0x4
c0001b44:	32860613          	addi	a2,a2,808 # c0005e68 <commands+0x720>
c0001b48:	06700593          	li	a1,103
c0001b4c:	00004517          	auipc	a0,0x4
c0001b50:	6a850513          	addi	a0,a0,1704 # c00061f4 <commands+0xaac>
c0001b54:	ef4fe0ef          	jal	ra,c0000248 <__panic>
c0001b58:	00004697          	auipc	a3,0x4
c0001b5c:	75068693          	addi	a3,a3,1872 # c00062a8 <commands+0xb60>
c0001b60:	00004617          	auipc	a2,0x4
c0001b64:	30860613          	addi	a2,a2,776 # c0005e68 <commands+0x720>
c0001b68:	06400593          	li	a1,100
c0001b6c:	00004517          	auipc	a0,0x4
c0001b70:	68850513          	addi	a0,a0,1672 # c00061f4 <commands+0xaac>
c0001b74:	ed4fe0ef          	jal	ra,c0000248 <__panic>
c0001b78:	00004697          	auipc	a3,0x4
c0001b7c:	73068693          	addi	a3,a3,1840 # c00062a8 <commands+0xb60>
c0001b80:	00004617          	auipc	a2,0x4
c0001b84:	2e860613          	addi	a2,a2,744 # c0005e68 <commands+0x720>
c0001b88:	06100593          	li	a1,97
c0001b8c:	00004517          	auipc	a0,0x4
c0001b90:	66850513          	addi	a0,a0,1640 # c00061f4 <commands+0xaac>
c0001b94:	eb4fe0ef          	jal	ra,c0000248 <__panic>
c0001b98:	00004697          	auipc	a3,0x4
c0001b9c:	64c68693          	addi	a3,a3,1612 # c00061e4 <commands+0xa9c>
c0001ba0:	00004617          	auipc	a2,0x4
c0001ba4:	2c860613          	addi	a2,a2,712 # c0005e68 <commands+0x720>
c0001ba8:	05e00593          	li	a1,94
c0001bac:	00004517          	auipc	a0,0x4
c0001bb0:	64850513          	addi	a0,a0,1608 # c00061f4 <commands+0xaac>
c0001bb4:	e94fe0ef          	jal	ra,c0000248 <__panic>
c0001bb8:	00004697          	auipc	a3,0x4
c0001bbc:	62c68693          	addi	a3,a3,1580 # c00061e4 <commands+0xa9c>
c0001bc0:	00004617          	auipc	a2,0x4
c0001bc4:	2a860613          	addi	a2,a2,680 # c0005e68 <commands+0x720>
c0001bc8:	05b00593          	li	a1,91
c0001bcc:	00004517          	auipc	a0,0x4
c0001bd0:	62850513          	addi	a0,a0,1576 # c00061f4 <commands+0xaac>
c0001bd4:	e74fe0ef          	jal	ra,c0000248 <__panic>
c0001bd8:	00004697          	auipc	a3,0x4
c0001bdc:	60c68693          	addi	a3,a3,1548 # c00061e4 <commands+0xa9c>
c0001be0:	00004617          	auipc	a2,0x4
c0001be4:	28860613          	addi	a2,a2,648 # c0005e68 <commands+0x720>
c0001be8:	05800593          	li	a1,88
c0001bec:	00004517          	auipc	a0,0x4
c0001bf0:	60850513          	addi	a0,a0,1544 # c00061f4 <commands+0xaac>
c0001bf4:	e54fe0ef          	jal	ra,c0000248 <__panic>

c0001bf8 <_fifo_swap_out_victim>:
c0001bf8:	01452703          	lw	a4,20(a0)
c0001bfc:	ff010113          	addi	sp,sp,-16
c0001c00:	00112623          	sw	ra,12(sp)
c0001c04:	06070663          	beqz	a4,c0001c70 <_fifo_swap_out_victim+0x78>
c0001c08:	04061463          	bnez	a2,c0001c50 <_fifo_swap_out_victim+0x58>
c0001c0c:	00072783          	lw	a5,0(a4)
c0001c10:	02f70663          	beq	a4,a5,c0001c3c <_fifo_swap_out_victim+0x44>
c0001c14:	0007a683          	lw	a3,0(a5)
c0001c18:	0047a703          	lw	a4,4(a5)
c0001c1c:	00c12083          	lw	ra,12(sp)
c0001c20:	fec78793          	addi	a5,a5,-20
c0001c24:	00e6a223          	sw	a4,4(a3)
c0001c28:	00d72023          	sw	a3,0(a4)
c0001c2c:	00000513          	li	a0,0
c0001c30:	00f5a023          	sw	a5,0(a1)
c0001c34:	01010113          	addi	sp,sp,16
c0001c38:	00008067          	ret
c0001c3c:	00c12083          	lw	ra,12(sp)
c0001c40:	00000513          	li	a0,0
c0001c44:	0005a023          	sw	zero,0(a1)
c0001c48:	01010113          	addi	sp,sp,16
c0001c4c:	00008067          	ret
c0001c50:	00004697          	auipc	a3,0x4
c0001c54:	71c68693          	addi	a3,a3,1820 # c000636c <commands+0xc24>
c0001c58:	00004617          	auipc	a2,0x4
c0001c5c:	21060613          	addi	a2,a2,528 # c0005e68 <commands+0x720>
c0001c60:	04200593          	li	a1,66
c0001c64:	00004517          	auipc	a0,0x4
c0001c68:	59050513          	addi	a0,a0,1424 # c00061f4 <commands+0xaac>
c0001c6c:	ddcfe0ef          	jal	ra,c0000248 <__panic>
c0001c70:	00004697          	auipc	a3,0x4
c0001c74:	6ec68693          	addi	a3,a3,1772 # c000635c <commands+0xc14>
c0001c78:	00004617          	auipc	a2,0x4
c0001c7c:	1f060613          	addi	a2,a2,496 # c0005e68 <commands+0x720>
c0001c80:	04100593          	li	a1,65
c0001c84:	00004517          	auipc	a0,0x4
c0001c88:	57050513          	addi	a0,a0,1392 # c00061f4 <commands+0xaac>
c0001c8c:	dbcfe0ef          	jal	ra,c0000248 <__panic>

c0001c90 <_fifo_map_swappable>:
c0001c90:	01460713          	addi	a4,a2,20
c0001c94:	01452783          	lw	a5,20(a0)
c0001c98:	02070263          	beqz	a4,c0001cbc <_fifo_map_swappable+0x2c>
c0001c9c:	02078063          	beqz	a5,c0001cbc <_fifo_map_swappable+0x2c>
c0001ca0:	0047a683          	lw	a3,4(a5)
c0001ca4:	00000513          	li	a0,0
c0001ca8:	00e6a023          	sw	a4,0(a3)
c0001cac:	00e7a223          	sw	a4,4(a5)
c0001cb0:	00d62c23          	sw	a3,24(a2)
c0001cb4:	00f62a23          	sw	a5,20(a2)
c0001cb8:	00008067          	ret
c0001cbc:	ff010113          	addi	sp,sp,-16
c0001cc0:	00004697          	auipc	a3,0x4
c0001cc4:	67c68693          	addi	a3,a3,1660 # c000633c <commands+0xbf4>
c0001cc8:	00004617          	auipc	a2,0x4
c0001ccc:	1a060613          	addi	a2,a2,416 # c0005e68 <commands+0x720>
c0001cd0:	03200593          	li	a1,50
c0001cd4:	00004517          	auipc	a0,0x4
c0001cd8:	52050513          	addi	a0,a0,1312 # c00061f4 <commands+0xaac>
c0001cdc:	00112623          	sw	ra,12(sp)
c0001ce0:	d68fe0ef          	jal	ra,c0000248 <__panic>

c0001ce4 <swap_init>:
c0001ce4:	fb010113          	addi	sp,sp,-80
c0001ce8:	04112623          	sw	ra,76(sp)
c0001cec:	04812423          	sw	s0,72(sp)
c0001cf0:	04912223          	sw	s1,68(sp)
c0001cf4:	05212023          	sw	s2,64(sp)
c0001cf8:	03312e23          	sw	s3,60(sp)
c0001cfc:	03412c23          	sw	s4,56(sp)
c0001d00:	03512a23          	sw	s5,52(sp)
c0001d04:	03612823          	sw	s6,48(sp)
c0001d08:	03712623          	sw	s7,44(sp)
c0001d0c:	03812423          	sw	s8,40(sp)
c0001d10:	03912223          	sw	s9,36(sp)
c0001d14:	03a12023          	sw	s10,32(sp)
c0001d18:	01b12e23          	sw	s11,28(sp)
c0001d1c:	040030ef          	jal	ra,c0004d5c <swapfs_init>
c0001d20:	0000f697          	auipc	a3,0xf
c0001d24:	7b46a683          	lw	a3,1972(a3) # c00114d4 <max_swap_offset>
c0001d28:	010007b7          	lui	a5,0x1000
c0001d2c:	ff968713          	addi	a4,a3,-7
c0001d30:	ff878793          	addi	a5,a5,-8 # fffff8 <BASE_ADDRESS-0xbf000008>
c0001d34:	58e7ec63          	bltu	a5,a4,c00022cc <swap_init+0x5e8>
c0001d38:	00008797          	auipc	a5,0x8
c0001d3c:	2c878793          	addi	a5,a5,712 # c000a000 <swap_manager_fifo>
c0001d40:	0000f297          	auipc	t0,0xf
c0001d44:	6ef2ae23          	sw	a5,1788(t0) # c001143c <sm>
c0001d48:	00008797          	auipc	a5,0x8
c0001d4c:	2bc7a783          	lw	a5,700(a5) # c000a004 <swap_manager_fifo+0x4>
c0001d50:	000780e7          	jalr	a5
c0001d54:	00050a13          	mv	s4,a0
c0001d58:	04050263          	beqz	a0,c0001d9c <swap_init+0xb8>
c0001d5c:	04c12083          	lw	ra,76(sp)
c0001d60:	000a0513          	mv	a0,s4
c0001d64:	04812403          	lw	s0,72(sp)
c0001d68:	04412483          	lw	s1,68(sp)
c0001d6c:	04012903          	lw	s2,64(sp)
c0001d70:	03c12983          	lw	s3,60(sp)
c0001d74:	03812a03          	lw	s4,56(sp)
c0001d78:	03412a83          	lw	s5,52(sp)
c0001d7c:	03012b03          	lw	s6,48(sp)
c0001d80:	02c12b83          	lw	s7,44(sp)
c0001d84:	02812c03          	lw	s8,40(sp)
c0001d88:	02412c83          	lw	s9,36(sp)
c0001d8c:	02012d03          	lw	s10,32(sp)
c0001d90:	01c12d83          	lw	s11,28(sp)
c0001d94:	05010113          	addi	sp,sp,80
c0001d98:	00008067          	ret
c0001d9c:	0000f797          	auipc	a5,0xf
c0001da0:	6a07a783          	lw	a5,1696(a5) # c001143c <sm>
c0001da4:	0007a583          	lw	a1,0(a5)
c0001da8:	00004517          	auipc	a0,0x4
c0001dac:	66050513          	addi	a0,a0,1632 # c0006408 <commands+0xcc0>
c0001db0:	00100793          	li	a5,1
c0001db4:	0000f297          	auipc	t0,0xf
c0001db8:	68f2a623          	sw	a5,1676(t0) # c0011440 <swap_init_ok>
c0001dbc:	b18fe0ef          	jal	ra,c00000d4 <cprintf>
c0001dc0:	0000f497          	auipc	s1,0xf
c0001dc4:	73c48493          	addi	s1,s1,1852 # c00114fc <free_area>
c0001dc8:	0000f797          	auipc	a5,0xf
c0001dcc:	7387a783          	lw	a5,1848(a5) # c0011500 <free_area+0x4>
c0001dd0:	38978e63          	beq	a5,s1,c000216c <swap_init+0x488>
c0001dd4:	ff87a703          	lw	a4,-8(a5)
c0001dd8:	00175713          	srli	a4,a4,0x1
c0001ddc:	00177713          	andi	a4,a4,1
c0001de0:	38070e63          	beqz	a4,c000217c <swap_init+0x498>
c0001de4:	00000413          	li	s0,0
c0001de8:	00000d13          	li	s10,0
c0001dec:	0100006f          	j	c0001dfc <swap_init+0x118>
c0001df0:	ff87a703          	lw	a4,-8(a5)
c0001df4:	00277713          	andi	a4,a4,2
c0001df8:	38070263          	beqz	a4,c000217c <swap_init+0x498>
c0001dfc:	ffc7a703          	lw	a4,-4(a5)
c0001e00:	0047a783          	lw	a5,4(a5)
c0001e04:	001d0d13          	addi	s10,s10,1
c0001e08:	00e40433          	add	s0,s0,a4
c0001e0c:	00040913          	mv	s2,s0
c0001e10:	fe9790e3          	bne	a5,s1,c0001df0 <swap_init+0x10c>
c0001e14:	015010ef          	jal	ra,c0003628 <nr_free_pages>
c0001e18:	48a91a63          	bne	s2,a0,c00022ac <swap_init+0x5c8>
c0001e1c:	00040613          	mv	a2,s0
c0001e20:	000d0593          	mv	a1,s10
c0001e24:	00004517          	auipc	a0,0x4
c0001e28:	62450513          	addi	a0,a0,1572 # c0006448 <commands+0xd00>
c0001e2c:	aa8fe0ef          	jal	ra,c00000d4 <cprintf>
c0001e30:	84cff0ef          	jal	ra,c0000e7c <mm_create>
c0001e34:	00050a93          	mv	s5,a0
c0001e38:	40050a63          	beqz	a0,c000224c <swap_init+0x568>
c0001e3c:	0000f797          	auipc	a5,0xf
c0001e40:	6187a783          	lw	a5,1560(a5) # c0011454 <check_mm_struct>
c0001e44:	44079463          	bnez	a5,c000228c <swap_init+0x5a8>
c0001e48:	0000fb17          	auipc	s6,0xf
c0001e4c:	5fcb2b03          	lw	s6,1532(s6) # c0011444 <boot_pgdir>
c0001e50:	000b2783          	lw	a5,0(s6)
c0001e54:	0000f717          	auipc	a4,0xf
c0001e58:	60070713          	addi	a4,a4,1536 # c0011454 <check_mm_struct>
c0001e5c:	00a72023          	sw	a0,0(a4)
c0001e60:	01652623          	sw	s6,12(a0)
c0001e64:	60079063          	bnez	a5,c0002464 <swap_init+0x780>
c0001e68:	000065b7          	lui	a1,0x6
c0001e6c:	00300613          	li	a2,3
c0001e70:	00001537          	lui	a0,0x1
c0001e74:	874ff0ef          	jal	ra,c0000ee8 <vma_create>
c0001e78:	00050593          	mv	a1,a0
c0001e7c:	3e050863          	beqz	a0,c000226c <swap_init+0x588>
c0001e80:	000a8513          	mv	a0,s5
c0001e84:	914ff0ef          	jal	ra,c0000f98 <insert_vma_struct>
c0001e88:	00004517          	auipc	a0,0x4
c0001e8c:	60050513          	addi	a0,a0,1536 # c0006488 <commands+0xd40>
c0001e90:	a44fe0ef          	jal	ra,c00000d4 <cprintf>
c0001e94:	00caa503          	lw	a0,12(s5)
c0001e98:	00100613          	li	a2,1
c0001e9c:	000015b7          	lui	a1,0x1
c0001ea0:	7e0010ef          	jal	ra,c0003680 <get_pte>
c0001ea4:	5a050063          	beqz	a0,c0002444 <swap_init+0x760>
c0001ea8:	00004517          	auipc	a0,0x4
c0001eac:	62850513          	addi	a0,a0,1576 # c00064d0 <commands+0xd88>
c0001eb0:	0000f997          	auipc	s3,0xf
c0001eb4:	5b098993          	addi	s3,s3,1456 # c0011460 <check_rp>
c0001eb8:	a1cfe0ef          	jal	ra,c00000d4 <cprintf>
c0001ebc:	0000fb97          	auipc	s7,0xf
c0001ec0:	5b4b8b93          	addi	s7,s7,1460 # c0011470 <swap_in_seq_no>
c0001ec4:	00098c13          	mv	s8,s3
c0001ec8:	00100913          	li	s2,1
c0001ecc:	00090513          	mv	a0,s2
c0001ed0:	640010ef          	jal	ra,c0003510 <alloc_pages>
c0001ed4:	00ac2023          	sw	a0,0(s8)
c0001ed8:	32050a63          	beqz	a0,c000220c <swap_init+0x528>
c0001edc:	00452783          	lw	a5,4(a0)
c0001ee0:	0027f793          	andi	a5,a5,2
c0001ee4:	30079463          	bnez	a5,c00021ec <swap_init+0x508>
c0001ee8:	004c0c13          	addi	s8,s8,4
c0001eec:	ff7c10e3          	bne	s8,s7,c0001ecc <swap_init+0x1e8>
c0001ef0:	0000f797          	auipc	a5,0xf
c0001ef4:	60c7a783          	lw	a5,1548(a5) # c00114fc <free_area>
c0001ef8:	00f12423          	sw	a5,8(sp)
c0001efc:	0000f797          	auipc	a5,0xf
c0001f00:	6087a783          	lw	a5,1544(a5) # c0011504 <free_area+0x8>
c0001f04:	0000fd97          	auipc	s11,0xf
c0001f08:	5fcdad83          	lw	s11,1532(s11) # c0011500 <free_area+0x4>
c0001f0c:	00f12623          	sw	a5,12(sp)
c0001f10:	0094a223          	sw	s1,4(s1)
c0001f14:	0094a023          	sw	s1,0(s1)
c0001f18:	0004a423          	sw	zero,8(s1)
c0001f1c:	0000f917          	auipc	s2,0xf
c0001f20:	54490913          	addi	s2,s2,1348 # c0011460 <check_rp>
c0001f24:	00100b93          	li	s7,1
c0001f28:	00092503          	lw	a0,0(s2)
c0001f2c:	000b8593          	mv	a1,s7
c0001f30:	00490913          	addi	s2,s2,4
c0001f34:	690010ef          	jal	ra,c00035c4 <free_pages>
c0001f38:	ff8918e3          	bne	s2,s8,c0001f28 <swap_init+0x244>
c0001f3c:	0000fb97          	auipc	s7,0xf
c0001f40:	5c8bab83          	lw	s7,1480(s7) # c0011504 <free_area+0x8>
c0001f44:	00400793          	li	a5,4
c0001f48:	4cfb9e63          	bne	s7,a5,c0002424 <swap_init+0x740>
c0001f4c:	00004517          	auipc	a0,0x4
c0001f50:	5fc50513          	addi	a0,a0,1532 # c0006548 <commands+0xe00>
c0001f54:	980fe0ef          	jal	ra,c00000d4 <cprintf>
c0001f58:	00001637          	lui	a2,0x1
c0001f5c:	0000f297          	auipc	t0,0xf
c0001f60:	4c02ae23          	sw	zero,1244(t0) # c0011438 <pgfault_num>
c0001f64:	00a00593          	li	a1,10
c0001f68:	00b60023          	sb	a1,0(a2) # 1000 <BASE_ADDRESS-0xbffff000>
c0001f6c:	0000f797          	auipc	a5,0xf
c0001f70:	4cc7a783          	lw	a5,1228(a5) # c0011438 <pgfault_num>
c0001f74:	00100513          	li	a0,1
c0001f78:	46a79663          	bne	a5,a0,c00023e4 <swap_init+0x700>
c0001f7c:	00b60823          	sb	a1,16(a2)
c0001f80:	0000f617          	auipc	a2,0xf
c0001f84:	4b862603          	lw	a2,1208(a2) # c0011438 <pgfault_num>
c0001f88:	46f61e63          	bne	a2,a5,c0002404 <swap_init+0x720>
c0001f8c:	00002637          	lui	a2,0x2
c0001f90:	00b00593          	li	a1,11
c0001f94:	00b60023          	sb	a1,0(a2) # 2000 <BASE_ADDRESS-0xbfffe000>
c0001f98:	0000f797          	auipc	a5,0xf
c0001f9c:	4a07a783          	lw	a5,1184(a5) # c0011438 <pgfault_num>
c0001fa0:	00200513          	li	a0,2
c0001fa4:	3ca79063          	bne	a5,a0,c0002364 <swap_init+0x680>
c0001fa8:	00b60823          	sb	a1,16(a2)
c0001fac:	0000f617          	auipc	a2,0xf
c0001fb0:	48c62603          	lw	a2,1164(a2) # c0011438 <pgfault_num>
c0001fb4:	3cf61863          	bne	a2,a5,c0002384 <swap_init+0x6a0>
c0001fb8:	00003637          	lui	a2,0x3
c0001fbc:	00c00593          	li	a1,12
c0001fc0:	00b60023          	sb	a1,0(a2) # 3000 <BASE_ADDRESS-0xbfffd000>
c0001fc4:	0000f797          	auipc	a5,0xf
c0001fc8:	4747a783          	lw	a5,1140(a5) # c0011438 <pgfault_num>
c0001fcc:	00300513          	li	a0,3
c0001fd0:	3ca79a63          	bne	a5,a0,c00023a4 <swap_init+0x6c0>
c0001fd4:	00b60823          	sb	a1,16(a2)
c0001fd8:	0000f617          	auipc	a2,0xf
c0001fdc:	46062603          	lw	a2,1120(a2) # c0011438 <pgfault_num>
c0001fe0:	3ef61263          	bne	a2,a5,c00023c4 <swap_init+0x6e0>
c0001fe4:	00004637          	lui	a2,0x4
c0001fe8:	00d00593          	li	a1,13
c0001fec:	00b60023          	sb	a1,0(a2) # 4000 <BASE_ADDRESS-0xbfffc000>
c0001ff0:	0000f797          	auipc	a5,0xf
c0001ff4:	4487a783          	lw	a5,1096(a5) # c0011438 <pgfault_num>
c0001ff8:	2f779663          	bne	a5,s7,c00022e4 <swap_init+0x600>
c0001ffc:	00b60823          	sb	a1,16(a2)
c0002000:	0000f617          	auipc	a2,0xf
c0002004:	43862603          	lw	a2,1080(a2) # c0011438 <pgfault_num>
c0002008:	2ef61e63          	bne	a2,a5,c0002304 <swap_init+0x620>
c000200c:	0000f817          	auipc	a6,0xf
c0002010:	4f882803          	lw	a6,1272(a6) # c0011504 <free_area+0x8>
c0002014:	0000f797          	auipc	a5,0xf
c0002018:	45c78793          	addi	a5,a5,1116 # c0011470 <swap_in_seq_no>
c000201c:	0000f617          	auipc	a2,0xf
c0002020:	47c60613          	addi	a2,a2,1148 # c0011498 <swap_out_seq_no>
c0002024:	0000f517          	auipc	a0,0xf
c0002028:	47450513          	addi	a0,a0,1140 # c0011498 <swap_out_seq_no>
c000202c:	fff00593          	li	a1,-1
c0002030:	2e081a63          	bnez	a6,c0002324 <swap_init+0x640>
c0002034:	00b7a023          	sw	a1,0(a5)
c0002038:	00b62023          	sw	a1,0(a2)
c000203c:	00478793          	addi	a5,a5,4
c0002040:	00460613          	addi	a2,a2,4
c0002044:	fef518e3          	bne	a0,a5,c0002034 <swap_init+0x350>
c0002048:	00008797          	auipc	a5,0x8
c000204c:	fd87a783          	lw	a5,-40(a5) # c000a020 <nbase>
c0002050:	00001bb7          	lui	s7,0x1
c0002054:	0000fc97          	auipc	s9,0xf
c0002058:	498c8c93          	addi	s9,s9,1176 # c00114ec <check_ptep>
c000205c:	0000fc17          	auipc	s8,0xf
c0002060:	404c0c13          	addi	s8,s8,1028 # c0011460 <check_rp>
c0002064:	00f12223          	sw	a5,4(sp)
c0002068:	00000613          	li	a2,0
c000206c:	000b8593          	mv	a1,s7
c0002070:	000b0513          	mv	a0,s6
c0002074:	000ca023          	sw	zero,0(s9)
c0002078:	608010ef          	jal	ra,c0003680 <get_pte>
c000207c:	00aca023          	sw	a0,0(s9)
c0002080:	1a050663          	beqz	a0,c000222c <swap_init+0x548>
c0002084:	00052783          	lw	a5,0(a0)
c0002088:	0017f613          	andi	a2,a5,1
c000208c:	12060863          	beqz	a2,c00021bc <swap_init+0x4d8>
c0002090:	00279793          	slli	a5,a5,0x2
c0002094:	00c7d793          	srli	a5,a5,0xc
c0002098:	0000f617          	auipc	a2,0xf
c000209c:	3b062603          	lw	a2,944(a2) # c0011448 <npage>
c00020a0:	12c7fa63          	bleu	a2,a5,c00021d4 <swap_init+0x4f0>
c00020a4:	00412703          	lw	a4,4(sp)
c00020a8:	000c2583          	lw	a1,0(s8)
c00020ac:	0000f617          	auipc	a2,0xf
c00020b0:	46862603          	lw	a2,1128(a2) # c0011514 <pages>
c00020b4:	40e787b3          	sub	a5,a5,a4
c00020b8:	00579793          	slli	a5,a5,0x5
c00020bc:	00f607b3          	add	a5,a2,a5
c00020c0:	0cf59e63          	bne	a1,a5,c000219c <swap_init+0x4b8>
c00020c4:	000017b7          	lui	a5,0x1
c00020c8:	00fb8bb3          	add	s7,s7,a5
c00020cc:	000057b7          	lui	a5,0x5
c00020d0:	004c8c93          	addi	s9,s9,4
c00020d4:	004c0c13          	addi	s8,s8,4
c00020d8:	f8fb98e3          	bne	s7,a5,c0002068 <swap_init+0x384>
c00020dc:	00004517          	auipc	a0,0x4
c00020e0:	53850513          	addi	a0,a0,1336 # c0006614 <commands+0xecc>
c00020e4:	ff1fd0ef          	jal	ra,c00000d4 <cprintf>
c00020e8:	0000f797          	auipc	a5,0xf
c00020ec:	3547a783          	lw	a5,852(a5) # c001143c <sm>
c00020f0:	01c7a783          	lw	a5,28(a5)
c00020f4:	00100b13          	li	s6,1
c00020f8:	000780e7          	jalr	a5
c00020fc:	24051463          	bnez	a0,c0002344 <swap_init+0x660>
c0002100:	0009a503          	lw	a0,0(s3)
c0002104:	000b0593          	mv	a1,s6
c0002108:	00498993          	addi	s3,s3,4
c000210c:	4b8010ef          	jal	ra,c00035c4 <free_pages>
c0002110:	ff2998e3          	bne	s3,s2,c0002100 <swap_init+0x41c>
c0002114:	000a8513          	mv	a0,s5
c0002118:	f81fe0ef          	jal	ra,c0001098 <mm_destroy>
c000211c:	00c12783          	lw	a5,12(sp)
c0002120:	01b4a223          	sw	s11,4(s1)
c0002124:	00f4a423          	sw	a5,8(s1)
c0002128:	00812783          	lw	a5,8(sp)
c000212c:	00f4a023          	sw	a5,0(s1)
c0002130:	009d8c63          	beq	s11,s1,c0002148 <swap_init+0x464>
c0002134:	ffcda783          	lw	a5,-4(s11)
c0002138:	004dad83          	lw	s11,4(s11)
c000213c:	fffd0d13          	addi	s10,s10,-1
c0002140:	40f40433          	sub	s0,s0,a5
c0002144:	fe9d98e3          	bne	s11,s1,c0002134 <swap_init+0x450>
c0002148:	00040613          	mv	a2,s0
c000214c:	000d0593          	mv	a1,s10
c0002150:	00004517          	auipc	a0,0x4
c0002154:	4f450513          	addi	a0,a0,1268 # c0006644 <commands+0xefc>
c0002158:	f7dfd0ef          	jal	ra,c00000d4 <cprintf>
c000215c:	00004517          	auipc	a0,0x4
c0002160:	50450513          	addi	a0,a0,1284 # c0006660 <commands+0xf18>
c0002164:	f71fd0ef          	jal	ra,c00000d4 <cprintf>
c0002168:	bf5ff06f          	j	c0001d5c <swap_init+0x78>
c000216c:	00000413          	li	s0,0
c0002170:	00000d13          	li	s10,0
c0002174:	00000913          	li	s2,0
c0002178:	c9dff06f          	j	c0001e14 <swap_init+0x130>
c000217c:	00004697          	auipc	a3,0x4
c0002180:	2a068693          	addi	a3,a3,672 # c000641c <commands+0xcd4>
c0002184:	00004617          	auipc	a2,0x4
c0002188:	ce460613          	addi	a2,a2,-796 # c0005e68 <commands+0x720>
c000218c:	0b900593          	li	a1,185
c0002190:	00004517          	auipc	a0,0x4
c0002194:	26850513          	addi	a0,a0,616 # c00063f8 <commands+0xcb0>
c0002198:	8b0fe0ef          	jal	ra,c0000248 <__panic>
c000219c:	00004697          	auipc	a3,0x4
c00021a0:	45068693          	addi	a3,a3,1104 # c00065ec <commands+0xea4>
c00021a4:	00004617          	auipc	a2,0x4
c00021a8:	cc460613          	addi	a2,a2,-828 # c0005e68 <commands+0x720>
c00021ac:	0f900593          	li	a1,249
c00021b0:	00004517          	auipc	a0,0x4
c00021b4:	24850513          	addi	a0,a0,584 # c00063f8 <commands+0xcb0>
c00021b8:	890fe0ef          	jal	ra,c0000248 <__panic>
c00021bc:	00004617          	auipc	a2,0x4
c00021c0:	40c60613          	addi	a2,a2,1036 # c00065c8 <commands+0xe80>
c00021c4:	07100593          	li	a1,113
c00021c8:	00004517          	auipc	a0,0x4
c00021cc:	fa450513          	addi	a0,a0,-92 # c000616c <commands+0xa24>
c00021d0:	878fe0ef          	jal	ra,c0000248 <__panic>
c00021d4:	00004617          	auipc	a2,0x4
c00021d8:	f7860613          	addi	a2,a2,-136 # c000614c <commands+0xa04>
c00021dc:	06600593          	li	a1,102
c00021e0:	00004517          	auipc	a0,0x4
c00021e4:	f8c50513          	addi	a0,a0,-116 # c000616c <commands+0xa24>
c00021e8:	860fe0ef          	jal	ra,c0000248 <__panic>
c00021ec:	00004697          	auipc	a3,0x4
c00021f0:	31c68693          	addi	a3,a3,796 # c0006508 <commands+0xdc0>
c00021f4:	00004617          	auipc	a2,0x4
c00021f8:	c7460613          	addi	a2,a2,-908 # c0005e68 <commands+0x720>
c00021fc:	0da00593          	li	a1,218
c0002200:	00004517          	auipc	a0,0x4
c0002204:	1f850513          	addi	a0,a0,504 # c00063f8 <commands+0xcb0>
c0002208:	840fe0ef          	jal	ra,c0000248 <__panic>
c000220c:	00004697          	auipc	a3,0x4
c0002210:	2e868693          	addi	a3,a3,744 # c00064f4 <commands+0xdac>
c0002214:	00004617          	auipc	a2,0x4
c0002218:	c5460613          	addi	a2,a2,-940 # c0005e68 <commands+0x720>
c000221c:	0d900593          	li	a1,217
c0002220:	00004517          	auipc	a0,0x4
c0002224:	1d850513          	addi	a0,a0,472 # c00063f8 <commands+0xcb0>
c0002228:	820fe0ef          	jal	ra,c0000248 <__panic>
c000222c:	00004697          	auipc	a3,0x4
c0002230:	38468693          	addi	a3,a3,900 # c00065b0 <commands+0xe68>
c0002234:	00004617          	auipc	a2,0x4
c0002238:	c3460613          	addi	a2,a2,-972 # c0005e68 <commands+0x720>
c000223c:	0f800593          	li	a1,248
c0002240:	00004517          	auipc	a0,0x4
c0002244:	1b850513          	addi	a0,a0,440 # c00063f8 <commands+0xcb0>
c0002248:	800fe0ef          	jal	ra,c0000248 <__panic>
c000224c:	00004697          	auipc	a3,0x4
c0002250:	d2068693          	addi	a3,a3,-736 # c0005f6c <commands+0x824>
c0002254:	00004617          	auipc	a2,0x4
c0002258:	c1460613          	addi	a2,a2,-1004 # c0005e68 <commands+0x720>
c000225c:	0c100593          	li	a1,193
c0002260:	00004517          	auipc	a0,0x4
c0002264:	19850513          	addi	a0,a0,408 # c00063f8 <commands+0xcb0>
c0002268:	fe1fd0ef          	jal	ra,c0000248 <__panic>
c000226c:	00004697          	auipc	a3,0x4
c0002270:	f4468693          	addi	a3,a3,-188 # c00061b0 <commands+0xa68>
c0002274:	00004617          	auipc	a2,0x4
c0002278:	bf460613          	addi	a2,a2,-1036 # c0005e68 <commands+0x720>
c000227c:	0cc00593          	li	a1,204
c0002280:	00004517          	auipc	a0,0x4
c0002284:	17850513          	addi	a0,a0,376 # c00063f8 <commands+0xcb0>
c0002288:	fc1fd0ef          	jal	ra,c0000248 <__panic>
c000228c:	00004697          	auipc	a3,0x4
c0002290:	1e468693          	addi	a3,a3,484 # c0006470 <commands+0xd28>
c0002294:	00004617          	auipc	a2,0x4
c0002298:	bd460613          	addi	a2,a2,-1068 # c0005e68 <commands+0x720>
c000229c:	0c400593          	li	a1,196
c00022a0:	00004517          	auipc	a0,0x4
c00022a4:	15850513          	addi	a0,a0,344 # c00063f8 <commands+0xcb0>
c00022a8:	fa1fd0ef          	jal	ra,c0000248 <__panic>
c00022ac:	00004697          	auipc	a3,0x4
c00022b0:	18068693          	addi	a3,a3,384 # c000642c <commands+0xce4>
c00022b4:	00004617          	auipc	a2,0x4
c00022b8:	bb460613          	addi	a2,a2,-1100 # c0005e68 <commands+0x720>
c00022bc:	0bc00593          	li	a1,188
c00022c0:	00004517          	auipc	a0,0x4
c00022c4:	13850513          	addi	a0,a0,312 # c00063f8 <commands+0xcb0>
c00022c8:	f81fd0ef          	jal	ra,c0000248 <__panic>
c00022cc:	00004617          	auipc	a2,0x4
c00022d0:	11060613          	addi	a2,a2,272 # c00063dc <commands+0xc94>
c00022d4:	02600593          	li	a1,38
c00022d8:	00004517          	auipc	a0,0x4
c00022dc:	12050513          	addi	a0,a0,288 # c00063f8 <commands+0xcb0>
c00022e0:	f69fd0ef          	jal	ra,c0000248 <__panic>
c00022e4:	00004697          	auipc	a3,0x4
c00022e8:	f0068693          	addi	a3,a3,-256 # c00061e4 <commands+0xa9c>
c00022ec:	00004617          	auipc	a2,0x4
c00022f0:	b7c60613          	addi	a2,a2,-1156 # c0005e68 <commands+0x720>
c00022f4:	09c00593          	li	a1,156
c00022f8:	00004517          	auipc	a0,0x4
c00022fc:	10050513          	addi	a0,a0,256 # c00063f8 <commands+0xcb0>
c0002300:	f49fd0ef          	jal	ra,c0000248 <__panic>
c0002304:	00004697          	auipc	a3,0x4
c0002308:	ee068693          	addi	a3,a3,-288 # c00061e4 <commands+0xa9c>
c000230c:	00004617          	auipc	a2,0x4
c0002310:	b5c60613          	addi	a2,a2,-1188 # c0005e68 <commands+0x720>
c0002314:	09e00593          	li	a1,158
c0002318:	00004517          	auipc	a0,0x4
c000231c:	0e050513          	addi	a0,a0,224 # c00063f8 <commands+0xcb0>
c0002320:	f29fd0ef          	jal	ra,c0000248 <__panic>
c0002324:	00004697          	auipc	a3,0x4
c0002328:	27c68693          	addi	a3,a3,636 # c00065a0 <commands+0xe58>
c000232c:	00004617          	auipc	a2,0x4
c0002330:	b3c60613          	addi	a2,a2,-1220 # c0005e68 <commands+0x720>
c0002334:	0f000593          	li	a1,240
c0002338:	00004517          	auipc	a0,0x4
c000233c:	0c050513          	addi	a0,a0,192 # c00063f8 <commands+0xcb0>
c0002340:	f09fd0ef          	jal	ra,c0000248 <__panic>
c0002344:	00004697          	auipc	a3,0x4
c0002348:	2f868693          	addi	a3,a3,760 # c000663c <commands+0xef4>
c000234c:	00004617          	auipc	a2,0x4
c0002350:	b1c60613          	addi	a2,a2,-1252 # c0005e68 <commands+0x720>
c0002354:	0ff00593          	li	a1,255
c0002358:	00004517          	auipc	a0,0x4
c000235c:	0a050513          	addi	a0,a0,160 # c00063f8 <commands+0xcb0>
c0002360:	ee9fd0ef          	jal	ra,c0000248 <__panic>
c0002364:	00004697          	auipc	a3,0x4
c0002368:	21c68693          	addi	a3,a3,540 # c0006580 <commands+0xe38>
c000236c:	00004617          	auipc	a2,0x4
c0002370:	afc60613          	addi	a2,a2,-1284 # c0005e68 <commands+0x720>
c0002374:	09400593          	li	a1,148
c0002378:	00004517          	auipc	a0,0x4
c000237c:	08050513          	addi	a0,a0,128 # c00063f8 <commands+0xcb0>
c0002380:	ec9fd0ef          	jal	ra,c0000248 <__panic>
c0002384:	00004697          	auipc	a3,0x4
c0002388:	1fc68693          	addi	a3,a3,508 # c0006580 <commands+0xe38>
c000238c:	00004617          	auipc	a2,0x4
c0002390:	adc60613          	addi	a2,a2,-1316 # c0005e68 <commands+0x720>
c0002394:	09600593          	li	a1,150
c0002398:	00004517          	auipc	a0,0x4
c000239c:	06050513          	addi	a0,a0,96 # c00063f8 <commands+0xcb0>
c00023a0:	ea9fd0ef          	jal	ra,c0000248 <__panic>
c00023a4:	00004697          	auipc	a3,0x4
c00023a8:	1ec68693          	addi	a3,a3,492 # c0006590 <commands+0xe48>
c00023ac:	00004617          	auipc	a2,0x4
c00023b0:	abc60613          	addi	a2,a2,-1348 # c0005e68 <commands+0x720>
c00023b4:	09800593          	li	a1,152
c00023b8:	00004517          	auipc	a0,0x4
c00023bc:	04050513          	addi	a0,a0,64 # c00063f8 <commands+0xcb0>
c00023c0:	e89fd0ef          	jal	ra,c0000248 <__panic>
c00023c4:	00004697          	auipc	a3,0x4
c00023c8:	1cc68693          	addi	a3,a3,460 # c0006590 <commands+0xe48>
c00023cc:	00004617          	auipc	a2,0x4
c00023d0:	a9c60613          	addi	a2,a2,-1380 # c0005e68 <commands+0x720>
c00023d4:	09a00593          	li	a1,154
c00023d8:	00004517          	auipc	a0,0x4
c00023dc:	02050513          	addi	a0,a0,32 # c00063f8 <commands+0xcb0>
c00023e0:	e69fd0ef          	jal	ra,c0000248 <__panic>
c00023e4:	00004697          	auipc	a3,0x4
c00023e8:	18c68693          	addi	a3,a3,396 # c0006570 <commands+0xe28>
c00023ec:	00004617          	auipc	a2,0x4
c00023f0:	a7c60613          	addi	a2,a2,-1412 # c0005e68 <commands+0x720>
c00023f4:	09000593          	li	a1,144
c00023f8:	00004517          	auipc	a0,0x4
c00023fc:	00050513          	mv	a0,a0
c0002400:	e49fd0ef          	jal	ra,c0000248 <__panic>
c0002404:	00004697          	auipc	a3,0x4
c0002408:	16c68693          	addi	a3,a3,364 # c0006570 <commands+0xe28>
c000240c:	00004617          	auipc	a2,0x4
c0002410:	a5c60613          	addi	a2,a2,-1444 # c0005e68 <commands+0x720>
c0002414:	09200593          	li	a1,146
c0002418:	00004517          	auipc	a0,0x4
c000241c:	fe050513          	addi	a0,a0,-32 # c00063f8 <commands+0xcb0>
c0002420:	e29fd0ef          	jal	ra,c0000248 <__panic>
c0002424:	00004697          	auipc	a3,0x4
c0002428:	10068693          	addi	a3,a3,256 # c0006524 <commands+0xddc>
c000242c:	00004617          	auipc	a2,0x4
c0002430:	a3c60613          	addi	a2,a2,-1476 # c0005e68 <commands+0x720>
c0002434:	0e700593          	li	a1,231
c0002438:	00004517          	auipc	a0,0x4
c000243c:	fc050513          	addi	a0,a0,-64 # c00063f8 <commands+0xcb0>
c0002440:	e09fd0ef          	jal	ra,c0000248 <__panic>
c0002444:	00004697          	auipc	a3,0x4
c0002448:	07868693          	addi	a3,a3,120 # c00064bc <commands+0xd74>
c000244c:	00004617          	auipc	a2,0x4
c0002450:	a1c60613          	addi	a2,a2,-1508 # c0005e68 <commands+0x720>
c0002454:	0d400593          	li	a1,212
c0002458:	00004517          	auipc	a0,0x4
c000245c:	fa050513          	addi	a0,a0,-96 # c00063f8 <commands+0xcb0>
c0002460:	de9fd0ef          	jal	ra,c0000248 <__panic>
c0002464:	00004697          	auipc	a3,0x4
c0002468:	cb068693          	addi	a3,a3,-848 # c0006114 <commands+0x9cc>
c000246c:	00004617          	auipc	a2,0x4
c0002470:	9fc60613          	addi	a2,a2,-1540 # c0005e68 <commands+0x720>
c0002474:	0c900593          	li	a1,201
c0002478:	00004517          	auipc	a0,0x4
c000247c:	f8050513          	addi	a0,a0,-128 # c00063f8 <commands+0xcb0>
c0002480:	dc9fd0ef          	jal	ra,c0000248 <__panic>

c0002484 <swap_init_mm>:
c0002484:	0000f797          	auipc	a5,0xf
c0002488:	fb87a783          	lw	a5,-72(a5) # c001143c <sm>
c000248c:	0087a303          	lw	t1,8(a5)
c0002490:	00030067          	jr	t1

c0002494 <swap_map_swappable>:
c0002494:	0000f797          	auipc	a5,0xf
c0002498:	fa87a783          	lw	a5,-88(a5) # c001143c <sm>
c000249c:	0107a303          	lw	t1,16(a5)
c00024a0:	00030067          	jr	t1

c00024a4 <swap_out>:
c00024a4:	fc010113          	addi	sp,sp,-64
c00024a8:	03312623          	sw	s3,44(sp)
c00024ac:	02112e23          	sw	ra,60(sp)
c00024b0:	02812c23          	sw	s0,56(sp)
c00024b4:	02912a23          	sw	s1,52(sp)
c00024b8:	03212823          	sw	s2,48(sp)
c00024bc:	03412423          	sw	s4,40(sp)
c00024c0:	03512223          	sw	s5,36(sp)
c00024c4:	03612023          	sw	s6,32(sp)
c00024c8:	01712e23          	sw	s7,28(sp)
c00024cc:	01812c23          	sw	s8,24(sp)
c00024d0:	00058993          	mv	s3,a1
c00024d4:	10058863          	beqz	a1,c00025e4 <swap_out+0x140>
c00024d8:	00050913          	mv	s2,a0
c00024dc:	00060a13          	mv	s4,a2
c00024e0:	00000413          	li	s0,0
c00024e4:	00004b97          	auipc	s7,0x4
c00024e8:	1f8b8b93          	addi	s7,s7,504 # c00066dc <commands+0xf94>
c00024ec:	00100b13          	li	s6,1
c00024f0:	00004a97          	auipc	s5,0x4
c00024f4:	1d4a8a93          	addi	s5,s5,468 # c00066c4 <commands+0xf7c>
c00024f8:	0340006f          	j	c000252c <swap_out+0x88>
c00024fc:	000a8513          	mv	a0,s5
c0002500:	bd5fd0ef          	jal	ra,c00000d4 <cprintf>
c0002504:	0000f797          	auipc	a5,0xf
c0002508:	f387a783          	lw	a5,-200(a5) # c001143c <sm>
c000250c:	0107a783          	lw	a5,16(a5)
c0002510:	00c12603          	lw	a2,12(sp)
c0002514:	00000693          	li	a3,0
c0002518:	00048593          	mv	a1,s1
c000251c:	00090513          	mv	a0,s2
c0002520:	00140413          	addi	s0,s0,1
c0002524:	000780e7          	jalr	a5
c0002528:	0a898e63          	beq	s3,s0,c00025e4 <swap_out+0x140>
c000252c:	0000f797          	auipc	a5,0xf
c0002530:	f107a783          	lw	a5,-240(a5) # c001143c <sm>
c0002534:	0187a783          	lw	a5,24(a5)
c0002538:	000a0613          	mv	a2,s4
c000253c:	00c10593          	addi	a1,sp,12
c0002540:	00090513          	mv	a0,s2
c0002544:	000780e7          	jalr	a5
c0002548:	0c051863          	bnez	a0,c0002618 <swap_out+0x174>
c000254c:	00c12783          	lw	a5,12(sp)
c0002550:	00c92503          	lw	a0,12(s2)
c0002554:	00000613          	li	a2,0
c0002558:	01c7a483          	lw	s1,28(a5)
c000255c:	00048593          	mv	a1,s1
c0002560:	120010ef          	jal	ra,c0003680 <get_pte>
c0002564:	00052783          	lw	a5,0(a0)
c0002568:	00050c13          	mv	s8,a0
c000256c:	0017f793          	andi	a5,a5,1
c0002570:	0c078063          	beqz	a5,c0002630 <swap_out+0x18c>
c0002574:	00c12583          	lw	a1,12(sp)
c0002578:	01c5a503          	lw	a0,28(a1) # 101c <BASE_ADDRESS-0xbfffefe4>
c000257c:	00c55513          	srli	a0,a0,0xc
c0002580:	00150513          	addi	a0,a0,1
c0002584:	00851513          	slli	a0,a0,0x8
c0002588:	0d1020ef          	jal	ra,c0004e58 <swapfs_write>
c000258c:	f60518e3          	bnez	a0,c00024fc <swap_out+0x58>
c0002590:	00c12783          	lw	a5,12(sp)
c0002594:	00048613          	mv	a2,s1
c0002598:	00040593          	mv	a1,s0
c000259c:	01c7a683          	lw	a3,28(a5)
c00025a0:	000b8513          	mv	a0,s7
c00025a4:	00140413          	addi	s0,s0,1
c00025a8:	00c6d693          	srli	a3,a3,0xc
c00025ac:	00168693          	addi	a3,a3,1
c00025b0:	b25fd0ef          	jal	ra,c00000d4 <cprintf>
c00025b4:	00c12503          	lw	a0,12(sp)
c00025b8:	000b0593          	mv	a1,s6
c00025bc:	01c52783          	lw	a5,28(a0)
c00025c0:	00c7d793          	srli	a5,a5,0xc
c00025c4:	00178793          	addi	a5,a5,1
c00025c8:	00879793          	slli	a5,a5,0x8
c00025cc:	00fc2023          	sw	a5,0(s8)
c00025d0:	7f5000ef          	jal	ra,c00035c4 <free_pages>
c00025d4:	00c92503          	lw	a0,12(s2)
c00025d8:	00048593          	mv	a1,s1
c00025dc:	53c010ef          	jal	ra,c0003b18 <tlb_invalidate>
c00025e0:	f48996e3          	bne	s3,s0,c000252c <swap_out+0x88>
c00025e4:	03c12083          	lw	ra,60(sp)
c00025e8:	00098513          	mv	a0,s3
c00025ec:	03812403          	lw	s0,56(sp)
c00025f0:	03412483          	lw	s1,52(sp)
c00025f4:	03012903          	lw	s2,48(sp)
c00025f8:	02c12983          	lw	s3,44(sp)
c00025fc:	02812a03          	lw	s4,40(sp)
c0002600:	02412a83          	lw	s5,36(sp)
c0002604:	02012b03          	lw	s6,32(sp)
c0002608:	01c12b83          	lw	s7,28(sp)
c000260c:	01812c03          	lw	s8,24(sp)
c0002610:	04010113          	addi	sp,sp,64
c0002614:	00008067          	ret
c0002618:	00040593          	mv	a1,s0
c000261c:	00004517          	auipc	a0,0x4
c0002620:	06050513          	addi	a0,a0,96 # c000667c <commands+0xf34>
c0002624:	ab1fd0ef          	jal	ra,c00000d4 <cprintf>
c0002628:	00040993          	mv	s3,s0
c000262c:	fb9ff06f          	j	c00025e4 <swap_out+0x140>
c0002630:	00004697          	auipc	a3,0x4
c0002634:	07c68693          	addi	a3,a3,124 # c00066ac <commands+0xf64>
c0002638:	00004617          	auipc	a2,0x4
c000263c:	83060613          	addi	a2,a2,-2000 # c0005e68 <commands+0x720>
c0002640:	06500593          	li	a1,101
c0002644:	00004517          	auipc	a0,0x4
c0002648:	db450513          	addi	a0,a0,-588 # c00063f8 <commands+0xcb0>
c000264c:	bfdfd0ef          	jal	ra,c0000248 <__panic>

c0002650 <swap_in>:
c0002650:	fe010113          	addi	sp,sp,-32
c0002654:	01212823          	sw	s2,16(sp)
c0002658:	00050913          	mv	s2,a0
c000265c:	00100513          	li	a0,1
c0002660:	00912a23          	sw	s1,20(sp)
c0002664:	01312623          	sw	s3,12(sp)
c0002668:	00112e23          	sw	ra,28(sp)
c000266c:	00812c23          	sw	s0,24(sp)
c0002670:	00058493          	mv	s1,a1
c0002674:	00060993          	mv	s3,a2
c0002678:	699000ef          	jal	ra,c0003510 <alloc_pages>
c000267c:	06050263          	beqz	a0,c00026e0 <swap_in+0x90>
c0002680:	00050413          	mv	s0,a0
c0002684:	00c92503          	lw	a0,12(s2)
c0002688:	00000613          	li	a2,0
c000268c:	00048593          	mv	a1,s1
c0002690:	7f1000ef          	jal	ra,c0003680 <get_pte>
c0002694:	00050913          	mv	s2,a0
c0002698:	00052503          	lw	a0,0(a0)
c000269c:	00040593          	mv	a1,s0
c00026a0:	708020ef          	jal	ra,c0004da8 <swapfs_read>
c00026a4:	00092583          	lw	a1,0(s2)
c00026a8:	00048613          	mv	a2,s1
c00026ac:	00004517          	auipc	a0,0x4
c00026b0:	cf050513          	addi	a0,a0,-784 # c000639c <commands+0xc54>
c00026b4:	0085d593          	srli	a1,a1,0x8
c00026b8:	a1dfd0ef          	jal	ra,c00000d4 <cprintf>
c00026bc:	01c12083          	lw	ra,28(sp)
c00026c0:	0089a023          	sw	s0,0(s3)
c00026c4:	00000513          	li	a0,0
c00026c8:	01812403          	lw	s0,24(sp)
c00026cc:	01412483          	lw	s1,20(sp)
c00026d0:	01012903          	lw	s2,16(sp)
c00026d4:	00c12983          	lw	s3,12(sp)
c00026d8:	02010113          	addi	sp,sp,32
c00026dc:	00008067          	ret
c00026e0:	00004697          	auipc	a3,0x4
c00026e4:	cac68693          	addi	a3,a3,-852 # c000638c <commands+0xc44>
c00026e8:	00003617          	auipc	a2,0x3
c00026ec:	78060613          	addi	a2,a2,1920 # c0005e68 <commands+0x720>
c00026f0:	07b00593          	li	a1,123
c00026f4:	00004517          	auipc	a0,0x4
c00026f8:	d0450513          	addi	a0,a0,-764 # c00063f8 <commands+0xcb0>
c00026fc:	b4dfd0ef          	jal	ra,c0000248 <__panic>

c0002700 <default_init>:
c0002700:	0000f797          	auipc	a5,0xf
c0002704:	dfc78793          	addi	a5,a5,-516 # c00114fc <free_area>
c0002708:	00f7a223          	sw	a5,4(a5)
c000270c:	00f7a023          	sw	a5,0(a5)
c0002710:	0007a423          	sw	zero,8(a5)
c0002714:	00008067          	ret

c0002718 <default_nr_free_pages>:
c0002718:	0000f517          	auipc	a0,0xf
c000271c:	dec52503          	lw	a0,-532(a0) # c0011504 <free_area+0x8>
c0002720:	00008067          	ret

c0002724 <default_free_pages>:
c0002724:	ff010113          	addi	sp,sp,-16
c0002728:	00112623          	sw	ra,12(sp)
c000272c:	1e058e63          	beqz	a1,c0002928 <default_free_pages+0x204>
c0002730:	00559693          	slli	a3,a1,0x5
c0002734:	00d506b3          	add	a3,a0,a3
c0002738:	04d50863          	beq	a0,a3,c0002788 <default_free_pages+0x64>
c000273c:	00452783          	lw	a5,4(a0)
c0002740:	0017f793          	andi	a5,a5,1
c0002744:	1c079263          	bnez	a5,c0002908 <default_free_pages+0x1e4>
c0002748:	00452783          	lw	a5,4(a0)
c000274c:	0017d793          	srli	a5,a5,0x1
c0002750:	0017f793          	andi	a5,a5,1
c0002754:	1a079a63          	bnez	a5,c0002908 <default_free_pages+0x1e4>
c0002758:	00050793          	mv	a5,a0
c000275c:	01c0006f          	j	c0002778 <default_free_pages+0x54>
c0002760:	0047a703          	lw	a4,4(a5)
c0002764:	00177713          	andi	a4,a4,1
c0002768:	1a071063          	bnez	a4,c0002908 <default_free_pages+0x1e4>
c000276c:	0047a703          	lw	a4,4(a5)
c0002770:	00277713          	andi	a4,a4,2
c0002774:	18071a63          	bnez	a4,c0002908 <default_free_pages+0x1e4>
c0002778:	0007a223          	sw	zero,4(a5)
c000277c:	0007a023          	sw	zero,0(a5)
c0002780:	02078793          	addi	a5,a5,32
c0002784:	fcd79ee3          	bne	a5,a3,c0002760 <default_free_pages+0x3c>
c0002788:	00b52423          	sw	a1,8(a0)
c000278c:	00450313          	addi	t1,a0,4
c0002790:	00200793          	li	a5,2
c0002794:	40f3202f          	amoor.w	zero,a5,(t1)
c0002798:	0000f797          	auipc	a5,0xf
c000279c:	d6c7a783          	lw	a5,-660(a5) # c0011504 <free_area+0x8>
c00027a0:	00b785b3          	add	a1,a5,a1
c00027a4:	0000f697          	auipc	a3,0xf
c00027a8:	d5868693          	addi	a3,a3,-680 # c00114fc <free_area>
c00027ac:	00b6a423          	sw	a1,8(a3)
c00027b0:	0000f797          	auipc	a5,0xf
c00027b4:	d507a783          	lw	a5,-688(a5) # c0011500 <free_area+0x4>
c00027b8:	12d78863          	beq	a5,a3,c00028e8 <default_free_pages+0x1c4>
c00027bc:	0000f597          	auipc	a1,0xf
c00027c0:	d405a583          	lw	a1,-704(a1) # c00114fc <free_area>
c00027c4:	00000813          	li	a6,0
c00027c8:	00c50613          	addi	a2,a0,12
c00027cc:	00100893          	li	a7,1
c00027d0:	0080006f          	j	c00027d8 <default_free_pages+0xb4>
c00027d4:	00070793          	mv	a5,a4
c00027d8:	ff478713          	addi	a4,a5,-12
c00027dc:	02e56863          	bltu	a0,a4,c000280c <default_free_pages+0xe8>
c00027e0:	0047a703          	lw	a4,4(a5)
c00027e4:	fed718e3          	bne	a4,a3,c00027d4 <default_free_pages+0xb0>
c00027e8:	00c7a223          	sw	a2,4(a5)
c00027ec:	00d52823          	sw	a3,16(a0)
c00027f0:	00f52623          	sw	a5,12(a0)
c00027f4:	0047a783          	lw	a5,4(a5)
c00027f8:	00060593          	mv	a1,a2
c00027fc:	06d78863          	beq	a5,a3,c000286c <default_free_pages+0x148>
c0002800:	ff478713          	addi	a4,a5,-12
c0002804:	00088813          	mv	a6,a7
c0002808:	fce57ce3          	bleu	a4,a0,c00027e0 <default_free_pages+0xbc>
c000280c:	12081e63          	bnez	a6,c0002948 <default_free_pages+0x224>
c0002810:	0007a583          	lw	a1,0(a5)
c0002814:	00c7a023          	sw	a2,0(a5)
c0002818:	00c5a223          	sw	a2,4(a1)
c000281c:	00f52823          	sw	a5,16(a0)
c0002820:	00b52623          	sw	a1,12(a0)
c0002824:	06d58a63          	beq	a1,a3,c0002898 <default_free_pages+0x174>
c0002828:	ffc5a603          	lw	a2,-4(a1)
c000282c:	ff458713          	addi	a4,a1,-12
c0002830:	00561793          	slli	a5,a2,0x5
c0002834:	00f707b3          	add	a5,a4,a5
c0002838:	04f51a63          	bne	a0,a5,c000288c <default_free_pages+0x168>
c000283c:	00852783          	lw	a5,8(a0)
c0002840:	00c78633          	add	a2,a5,a2
c0002844:	fec5ae23          	sw	a2,-4(a1)
c0002848:	ffd00793          	li	a5,-3
c000284c:	60f3202f          	amoand.w	zero,a5,(t1)
c0002850:	00c52803          	lw	a6,12(a0)
c0002854:	01052603          	lw	a2,16(a0)
c0002858:	00070513          	mv	a0,a4
c000285c:	00c82223          	sw	a2,4(a6)
c0002860:	0045a783          	lw	a5,4(a1)
c0002864:	01062023          	sw	a6,0(a2)
c0002868:	0280006f          	j	c0002890 <default_free_pages+0x16c>
c000286c:	00c52583          	lw	a1,12(a0)
c0002870:	00c7a023          	sw	a2,0(a5)
c0002874:	00f58e63          	beq	a1,a5,c0002890 <default_free_pages+0x16c>
c0002878:	ffc5a603          	lw	a2,-4(a1)
c000287c:	ff458713          	addi	a4,a1,-12
c0002880:	00561793          	slli	a5,a2,0x5
c0002884:	00f707b3          	add	a5,a4,a5
c0002888:	faf50ae3          	beq	a0,a5,c000283c <default_free_pages+0x118>
c000288c:	01052783          	lw	a5,16(a0)
c0002890:	ff478713          	addi	a4,a5,-12
c0002894:	00d78a63          	beq	a5,a3,c00028a8 <default_free_pages+0x184>
c0002898:	00852603          	lw	a2,8(a0)
c000289c:	00561693          	slli	a3,a2,0x5
c00028a0:	00d506b3          	add	a3,a0,a3
c00028a4:	00d70863          	beq	a4,a3,c00028b4 <default_free_pages+0x190>
c00028a8:	00c12083          	lw	ra,12(sp)
c00028ac:	01010113          	addi	sp,sp,16
c00028b0:	00008067          	ret
c00028b4:	ffc7a703          	lw	a4,-4(a5)
c00028b8:	ff878693          	addi	a3,a5,-8
c00028bc:	00c70633          	add	a2,a4,a2
c00028c0:	00c52423          	sw	a2,8(a0)
c00028c4:	ffd00713          	li	a4,-3
c00028c8:	60e6a02f          	amoand.w	zero,a4,(a3)
c00028cc:	0007a703          	lw	a4,0(a5)
c00028d0:	0047a783          	lw	a5,4(a5)
c00028d4:	00c12083          	lw	ra,12(sp)
c00028d8:	01010113          	addi	sp,sp,16
c00028dc:	00f72223          	sw	a5,4(a4)
c00028e0:	00e7a023          	sw	a4,0(a5)
c00028e4:	00008067          	ret
c00028e8:	00c12083          	lw	ra,12(sp)
c00028ec:	00c50713          	addi	a4,a0,12
c00028f0:	00e7a023          	sw	a4,0(a5)
c00028f4:	00e7a223          	sw	a4,4(a5)
c00028f8:	00f52823          	sw	a5,16(a0)
c00028fc:	00f52623          	sw	a5,12(a0)
c0002900:	01010113          	addi	sp,sp,16
c0002904:	00008067          	ret
c0002908:	00004697          	auipc	a3,0x4
c000290c:	0e068693          	addi	a3,a3,224 # c00069e8 <commands+0x12a0>
c0002910:	00003617          	auipc	a2,0x3
c0002914:	55860613          	addi	a2,a2,1368 # c0005e68 <commands+0x720>
c0002918:	08300593          	li	a1,131
c000291c:	00004517          	auipc	a0,0x4
c0002920:	0f450513          	addi	a0,a0,244 # c0006a10 <commands+0x12c8>
c0002924:	925fd0ef          	jal	ra,c0000248 <__panic>
c0002928:	00004697          	auipc	a3,0x4
c000292c:	10068693          	addi	a3,a3,256 # c0006a28 <commands+0x12e0>
c0002930:	00003617          	auipc	a2,0x3
c0002934:	53860613          	addi	a2,a2,1336 # c0005e68 <commands+0x720>
c0002938:	08000593          	li	a1,128
c000293c:	00004517          	auipc	a0,0x4
c0002940:	0d450513          	addi	a0,a0,212 # c0006a10 <commands+0x12c8>
c0002944:	905fd0ef          	jal	ra,c0000248 <__panic>
c0002948:	00b6a023          	sw	a1,0(a3)
c000294c:	ec5ff06f          	j	c0002810 <default_free_pages+0xec>

c0002950 <default_init_memmap>:
c0002950:	ff010113          	addi	sp,sp,-16
c0002954:	00112623          	sw	ra,12(sp)
c0002958:	12058e63          	beqz	a1,c0002a94 <default_init_memmap+0x144>
c000295c:	00559693          	slli	a3,a1,0x5
c0002960:	00d506b3          	add	a3,a0,a3
c0002964:	02d50c63          	beq	a0,a3,c000299c <default_init_memmap+0x4c>
c0002968:	00452703          	lw	a4,4(a0)
c000296c:	00050793          	mv	a5,a0
c0002970:	00177713          	andi	a4,a4,1
c0002974:	00071a63          	bnez	a4,c0002988 <default_init_memmap+0x38>
c0002978:	0fc0006f          	j	c0002a74 <default_init_memmap+0x124>
c000297c:	0047a703          	lw	a4,4(a5)
c0002980:	00177713          	andi	a4,a4,1
c0002984:	0e070863          	beqz	a4,c0002a74 <default_init_memmap+0x124>
c0002988:	0007a423          	sw	zero,8(a5)
c000298c:	0007a223          	sw	zero,4(a5)
c0002990:	0007a023          	sw	zero,0(a5)
c0002994:	02078793          	addi	a5,a5,32
c0002998:	fed792e3          	bne	a5,a3,c000297c <default_init_memmap+0x2c>
c000299c:	00b52423          	sw	a1,8(a0)
c00029a0:	00200793          	li	a5,2
c00029a4:	00450713          	addi	a4,a0,4
c00029a8:	40f7202f          	amoor.w	zero,a5,(a4)
c00029ac:	0000f797          	auipc	a5,0xf
c00029b0:	b587a783          	lw	a5,-1192(a5) # c0011504 <free_area+0x8>
c00029b4:	00b785b3          	add	a1,a5,a1
c00029b8:	0000f697          	auipc	a3,0xf
c00029bc:	b4468693          	addi	a3,a3,-1212 # c00114fc <free_area>
c00029c0:	00b6a423          	sw	a1,8(a3)
c00029c4:	0000f797          	auipc	a5,0xf
c00029c8:	b3c7a783          	lw	a5,-1220(a5) # c0011500 <free_area+0x4>
c00029cc:	08d78463          	beq	a5,a3,c0002a54 <default_init_memmap+0x104>
c00029d0:	0000f597          	auipc	a1,0xf
c00029d4:	b2c5a583          	lw	a1,-1236(a1) # c00114fc <free_area>
c00029d8:	00000813          	li	a6,0
c00029dc:	00c50613          	addi	a2,a0,12
c00029e0:	00100893          	li	a7,1
c00029e4:	0080006f          	j	c00029ec <default_init_memmap+0x9c>
c00029e8:	00070793          	mv	a5,a4
c00029ec:	ff478713          	addi	a4,a5,-12
c00029f0:	02e56863          	bltu	a0,a4,c0002a20 <default_init_memmap+0xd0>
c00029f4:	0047a703          	lw	a4,4(a5)
c00029f8:	fed718e3          	bne	a4,a3,c00029e8 <default_init_memmap+0x98>
c00029fc:	00c7a223          	sw	a2,4(a5)
c0002a00:	00d52823          	sw	a3,16(a0)
c0002a04:	00f52623          	sw	a5,12(a0)
c0002a08:	0047a783          	lw	a5,4(a5)
c0002a0c:	00060593          	mv	a1,a2
c0002a10:	02d78a63          	beq	a5,a3,c0002a44 <default_init_memmap+0xf4>
c0002a14:	ff478713          	addi	a4,a5,-12
c0002a18:	00088813          	mv	a6,a7
c0002a1c:	fce57ce3          	bleu	a4,a0,c00029f4 <default_init_memmap+0xa4>
c0002a20:	08081a63          	bnez	a6,c0002ab4 <default_init_memmap+0x164>
c0002a24:	0007a703          	lw	a4,0(a5)
c0002a28:	00c12083          	lw	ra,12(sp)
c0002a2c:	00c7a023          	sw	a2,0(a5)
c0002a30:	00c72223          	sw	a2,4(a4)
c0002a34:	00f52823          	sw	a5,16(a0)
c0002a38:	00e52623          	sw	a4,12(a0)
c0002a3c:	01010113          	addi	sp,sp,16
c0002a40:	00008067          	ret
c0002a44:	00c12083          	lw	ra,12(sp)
c0002a48:	00c7a023          	sw	a2,0(a5)
c0002a4c:	01010113          	addi	sp,sp,16
c0002a50:	00008067          	ret
c0002a54:	00c12083          	lw	ra,12(sp)
c0002a58:	00c50713          	addi	a4,a0,12
c0002a5c:	00e7a023          	sw	a4,0(a5)
c0002a60:	00e7a223          	sw	a4,4(a5)
c0002a64:	00f52823          	sw	a5,16(a0)
c0002a68:	00f52623          	sw	a5,12(a0)
c0002a6c:	01010113          	addi	sp,sp,16
c0002a70:	00008067          	ret
c0002a74:	00004697          	auipc	a3,0x4
c0002a78:	fbc68693          	addi	a3,a3,-68 # c0006a30 <commands+0x12e8>
c0002a7c:	00003617          	auipc	a2,0x3
c0002a80:	3ec60613          	addi	a2,a2,1004 # c0005e68 <commands+0x720>
c0002a84:	04900593          	li	a1,73
c0002a88:	00004517          	auipc	a0,0x4
c0002a8c:	f8850513          	addi	a0,a0,-120 # c0006a10 <commands+0x12c8>
c0002a90:	fb8fd0ef          	jal	ra,c0000248 <__panic>
c0002a94:	00004697          	auipc	a3,0x4
c0002a98:	f9468693          	addi	a3,a3,-108 # c0006a28 <commands+0x12e0>
c0002a9c:	00003617          	auipc	a2,0x3
c0002aa0:	3cc60613          	addi	a2,a2,972 # c0005e68 <commands+0x720>
c0002aa4:	04600593          	li	a1,70
c0002aa8:	00004517          	auipc	a0,0x4
c0002aac:	f6850513          	addi	a0,a0,-152 # c0006a10 <commands+0x12c8>
c0002ab0:	f98fd0ef          	jal	ra,c0000248 <__panic>
c0002ab4:	00b6a023          	sw	a1,0(a3)
c0002ab8:	f6dff06f          	j	c0002a24 <default_init_memmap+0xd4>

c0002abc <default_check>:
c0002abc:	fd010113          	addi	sp,sp,-48
c0002ac0:	03212023          	sw	s2,32(sp)
c0002ac4:	02112623          	sw	ra,44(sp)
c0002ac8:	02812423          	sw	s0,40(sp)
c0002acc:	02912223          	sw	s1,36(sp)
c0002ad0:	01312e23          	sw	s3,28(sp)
c0002ad4:	01412c23          	sw	s4,24(sp)
c0002ad8:	01512a23          	sw	s5,20(sp)
c0002adc:	01612823          	sw	s6,16(sp)
c0002ae0:	01712623          	sw	s7,12(sp)
c0002ae4:	01812423          	sw	s8,8(sp)
c0002ae8:	01912223          	sw	s9,4(sp)
c0002aec:	0000f917          	auipc	s2,0xf
c0002af0:	a1090913          	addi	s2,s2,-1520 # c00114fc <free_area>
c0002af4:	0000f797          	auipc	a5,0xf
c0002af8:	a0c7a783          	lw	a5,-1524(a5) # c0011500 <free_area+0x4>
c0002afc:	3d278663          	beq	a5,s2,c0002ec8 <default_check+0x40c>
c0002b00:	ff87a703          	lw	a4,-8(a5)
c0002b04:	00175713          	srli	a4,a4,0x1
c0002b08:	00177713          	andi	a4,a4,1
c0002b0c:	3c070663          	beqz	a4,c0002ed8 <default_check+0x41c>
c0002b10:	00000413          	li	s0,0
c0002b14:	00000493          	li	s1,0
c0002b18:	0100006f          	j	c0002b28 <default_check+0x6c>
c0002b1c:	ff87a703          	lw	a4,-8(a5)
c0002b20:	00277713          	andi	a4,a4,2
c0002b24:	3a070a63          	beqz	a4,c0002ed8 <default_check+0x41c>
c0002b28:	ffc7a703          	lw	a4,-4(a5)
c0002b2c:	0047a783          	lw	a5,4(a5)
c0002b30:	00148493          	addi	s1,s1,1
c0002b34:	00e40433          	add	s0,s0,a4
c0002b38:	00040993          	mv	s3,s0
c0002b3c:	ff2790e3          	bne	a5,s2,c0002b1c <default_check+0x60>
c0002b40:	2e9000ef          	jal	ra,c0003628 <nr_free_pages>
c0002b44:	7ca99a63          	bne	s3,a0,c0003318 <default_check+0x85c>
c0002b48:	00100513          	li	a0,1
c0002b4c:	1c5000ef          	jal	ra,c0003510 <alloc_pages>
c0002b50:	00050a13          	mv	s4,a0
c0002b54:	000502e3          	beqz	a0,c0003358 <default_check+0x89c>
c0002b58:	00100513          	li	a0,1
c0002b5c:	1b5000ef          	jal	ra,c0003510 <alloc_pages>
c0002b60:	00050993          	mv	s3,a0
c0002b64:	7c050a63          	beqz	a0,c0003338 <default_check+0x87c>
c0002b68:	00100513          	li	a0,1
c0002b6c:	1a5000ef          	jal	ra,c0003510 <alloc_pages>
c0002b70:	00050a93          	mv	s5,a0
c0002b74:	56050263          	beqz	a0,c00030d8 <default_check+0x61c>
c0002b78:	3b3a0063          	beq	s4,s3,c0002f18 <default_check+0x45c>
c0002b7c:	38aa0e63          	beq	s4,a0,c0002f18 <default_check+0x45c>
c0002b80:	38a98c63          	beq	s3,a0,c0002f18 <default_check+0x45c>
c0002b84:	000a2783          	lw	a5,0(s4)
c0002b88:	36079863          	bnez	a5,c0002ef8 <default_check+0x43c>
c0002b8c:	0009a783          	lw	a5,0(s3)
c0002b90:	36079463          	bnez	a5,c0002ef8 <default_check+0x43c>
c0002b94:	00052783          	lw	a5,0(a0)
c0002b98:	36079063          	bnez	a5,c0002ef8 <default_check+0x43c>
c0002b9c:	0000f797          	auipc	a5,0xf
c0002ba0:	9787a783          	lw	a5,-1672(a5) # c0011514 <pages>
c0002ba4:	40fa0733          	sub	a4,s4,a5
c0002ba8:	00007617          	auipc	a2,0x7
c0002bac:	47862603          	lw	a2,1144(a2) # c000a020 <nbase>
c0002bb0:	40575713          	srai	a4,a4,0x5
c0002bb4:	00c70733          	add	a4,a4,a2
c0002bb8:	0000f697          	auipc	a3,0xf
c0002bbc:	8906a683          	lw	a3,-1904(a3) # c0011448 <npage>
c0002bc0:	00c69693          	slli	a3,a3,0xc
c0002bc4:	00c71713          	slli	a4,a4,0xc
c0002bc8:	48d77863          	bleu	a3,a4,c0003058 <default_check+0x59c>
c0002bcc:	40f98733          	sub	a4,s3,a5
c0002bd0:	40575713          	srai	a4,a4,0x5
c0002bd4:	00c70733          	add	a4,a4,a2
c0002bd8:	00c71713          	slli	a4,a4,0xc
c0002bdc:	3ed77e63          	bleu	a3,a4,c0002fd8 <default_check+0x51c>
c0002be0:	40f507b3          	sub	a5,a0,a5
c0002be4:	4057d793          	srai	a5,a5,0x5
c0002be8:	00c787b3          	add	a5,a5,a2
c0002bec:	00c79793          	slli	a5,a5,0xc
c0002bf0:	3cd7f463          	bleu	a3,a5,c0002fb8 <default_check+0x4fc>
c0002bf4:	00100513          	li	a0,1
c0002bf8:	0000fc17          	auipc	s8,0xf
c0002bfc:	904c2c03          	lw	s8,-1788(s8) # c00114fc <free_area>
c0002c00:	0000fb97          	auipc	s7,0xf
c0002c04:	900bab83          	lw	s7,-1792(s7) # c0011500 <free_area+0x4>
c0002c08:	0000fb17          	auipc	s6,0xf
c0002c0c:	8fcb2b03          	lw	s6,-1796(s6) # c0011504 <free_area+0x8>
c0002c10:	01292223          	sw	s2,4(s2)
c0002c14:	01292023          	sw	s2,0(s2)
c0002c18:	00092423          	sw	zero,8(s2)
c0002c1c:	0f5000ef          	jal	ra,c0003510 <alloc_pages>
c0002c20:	36051c63          	bnez	a0,c0002f98 <default_check+0x4dc>
c0002c24:	00100593          	li	a1,1
c0002c28:	000a0513          	mv	a0,s4
c0002c2c:	199000ef          	jal	ra,c00035c4 <free_pages>
c0002c30:	00100593          	li	a1,1
c0002c34:	00098513          	mv	a0,s3
c0002c38:	18d000ef          	jal	ra,c00035c4 <free_pages>
c0002c3c:	00100593          	li	a1,1
c0002c40:	000a8513          	mv	a0,s5
c0002c44:	181000ef          	jal	ra,c00035c4 <free_pages>
c0002c48:	0000f717          	auipc	a4,0xf
c0002c4c:	8bc72703          	lw	a4,-1860(a4) # c0011504 <free_area+0x8>
c0002c50:	00300793          	li	a5,3
c0002c54:	32f71263          	bne	a4,a5,c0002f78 <default_check+0x4bc>
c0002c58:	00100513          	li	a0,1
c0002c5c:	0b5000ef          	jal	ra,c0003510 <alloc_pages>
c0002c60:	00050993          	mv	s3,a0
c0002c64:	2c050a63          	beqz	a0,c0002f38 <default_check+0x47c>
c0002c68:	00100513          	li	a0,1
c0002c6c:	0a5000ef          	jal	ra,c0003510 <alloc_pages>
c0002c70:	00050a93          	mv	s5,a0
c0002c74:	44050263          	beqz	a0,c00030b8 <default_check+0x5fc>
c0002c78:	00100513          	li	a0,1
c0002c7c:	095000ef          	jal	ra,c0003510 <alloc_pages>
c0002c80:	00050a13          	mv	s4,a0
c0002c84:	40050a63          	beqz	a0,c0003098 <default_check+0x5dc>
c0002c88:	00100513          	li	a0,1
c0002c8c:	085000ef          	jal	ra,c0003510 <alloc_pages>
c0002c90:	3e051463          	bnez	a0,c0003078 <default_check+0x5bc>
c0002c94:	00100593          	li	a1,1
c0002c98:	00098513          	mv	a0,s3
c0002c9c:	129000ef          	jal	ra,c00035c4 <free_pages>
c0002ca0:	0000f797          	auipc	a5,0xf
c0002ca4:	8607a783          	lw	a5,-1952(a5) # c0011500 <free_area+0x4>
c0002ca8:	2b278863          	beq	a5,s2,c0002f58 <default_check+0x49c>
c0002cac:	00100513          	li	a0,1
c0002cb0:	061000ef          	jal	ra,c0003510 <alloc_pages>
c0002cb4:	38a99263          	bne	s3,a0,c0003038 <default_check+0x57c>
c0002cb8:	00100513          	li	a0,1
c0002cbc:	055000ef          	jal	ra,c0003510 <alloc_pages>
c0002cc0:	34051c63          	bnez	a0,c0003018 <default_check+0x55c>
c0002cc4:	0000f797          	auipc	a5,0xf
c0002cc8:	8407a783          	lw	a5,-1984(a5) # c0011504 <free_area+0x8>
c0002ccc:	32079663          	bnez	a5,c0002ff8 <default_check+0x53c>
c0002cd0:	00098513          	mv	a0,s3
c0002cd4:	00100593          	li	a1,1
c0002cd8:	01892023          	sw	s8,0(s2)
c0002cdc:	01792223          	sw	s7,4(s2)
c0002ce0:	01692423          	sw	s6,8(s2)
c0002ce4:	0e1000ef          	jal	ra,c00035c4 <free_pages>
c0002ce8:	00100593          	li	a1,1
c0002cec:	000a8513          	mv	a0,s5
c0002cf0:	0d5000ef          	jal	ra,c00035c4 <free_pages>
c0002cf4:	00100593          	li	a1,1
c0002cf8:	000a0513          	mv	a0,s4
c0002cfc:	0c9000ef          	jal	ra,c00035c4 <free_pages>
c0002d00:	00500513          	li	a0,5
c0002d04:	00d000ef          	jal	ra,c0003510 <alloc_pages>
c0002d08:	00050993          	mv	s3,a0
c0002d0c:	44050663          	beqz	a0,c0003158 <default_check+0x69c>
c0002d10:	00452783          	lw	a5,4(a0)
c0002d14:	0017d793          	srli	a5,a5,0x1
c0002d18:	0017f793          	andi	a5,a5,1
c0002d1c:	58079e63          	bnez	a5,c00032b8 <default_check+0x7fc>
c0002d20:	00100513          	li	a0,1
c0002d24:	0000eb97          	auipc	s7,0xe
c0002d28:	7d8bab83          	lw	s7,2008(s7) # c00114fc <free_area>
c0002d2c:	0000eb17          	auipc	s6,0xe
c0002d30:	7d4b2b03          	lw	s6,2004(s6) # c0011500 <free_area+0x4>
c0002d34:	01292023          	sw	s2,0(s2)
c0002d38:	01292223          	sw	s2,4(s2)
c0002d3c:	7d4000ef          	jal	ra,c0003510 <alloc_pages>
c0002d40:	54051c63          	bnez	a0,c0003298 <default_check+0x7dc>
c0002d44:	04098a93          	addi	s5,s3,64
c0002d48:	000a8513          	mv	a0,s5
c0002d4c:	00300593          	li	a1,3
c0002d50:	0000ec17          	auipc	s8,0xe
c0002d54:	7b4c2c03          	lw	s8,1972(s8) # c0011504 <free_area+0x8>
c0002d58:	00092423          	sw	zero,8(s2)
c0002d5c:	069000ef          	jal	ra,c00035c4 <free_pages>
c0002d60:	00400513          	li	a0,4
c0002d64:	7ac000ef          	jal	ra,c0003510 <alloc_pages>
c0002d68:	50051863          	bnez	a0,c0003278 <default_check+0x7bc>
c0002d6c:	0449a783          	lw	a5,68(s3)
c0002d70:	0017d793          	srli	a5,a5,0x1
c0002d74:	0017f793          	andi	a5,a5,1
c0002d78:	4e078063          	beqz	a5,c0003258 <default_check+0x79c>
c0002d7c:	0489a503          	lw	a0,72(s3)
c0002d80:	00300793          	li	a5,3
c0002d84:	4cf51a63          	bne	a0,a5,c0003258 <default_check+0x79c>
c0002d88:	788000ef          	jal	ra,c0003510 <alloc_pages>
c0002d8c:	00050a13          	mv	s4,a0
c0002d90:	4a050463          	beqz	a0,c0003238 <default_check+0x77c>
c0002d94:	00100513          	li	a0,1
c0002d98:	778000ef          	jal	ra,c0003510 <alloc_pages>
c0002d9c:	46051e63          	bnez	a0,c0003218 <default_check+0x75c>
c0002da0:	454a9c63          	bne	s5,s4,c00031f8 <default_check+0x73c>
c0002da4:	00100593          	li	a1,1
c0002da8:	00098513          	mv	a0,s3
c0002dac:	019000ef          	jal	ra,c00035c4 <free_pages>
c0002db0:	00300593          	li	a1,3
c0002db4:	000a8513          	mv	a0,s5
c0002db8:	00d000ef          	jal	ra,c00035c4 <free_pages>
c0002dbc:	0049a783          	lw	a5,4(s3)
c0002dc0:	02098c93          	addi	s9,s3,32
c0002dc4:	0017d793          	srli	a5,a5,0x1
c0002dc8:	0017f793          	andi	a5,a5,1
c0002dcc:	40078663          	beqz	a5,c00031d8 <default_check+0x71c>
c0002dd0:	0089aa03          	lw	s4,8(s3)
c0002dd4:	00100793          	li	a5,1
c0002dd8:	40fa1063          	bne	s4,a5,c00031d8 <default_check+0x71c>
c0002ddc:	0449a783          	lw	a5,68(s3)
c0002de0:	0017d793          	srli	a5,a5,0x1
c0002de4:	0017f793          	andi	a5,a5,1
c0002de8:	3c078863          	beqz	a5,c00031b8 <default_check+0x6fc>
c0002dec:	0489a703          	lw	a4,72(s3)
c0002df0:	00300793          	li	a5,3
c0002df4:	3cf71263          	bne	a4,a5,c00031b8 <default_check+0x6fc>
c0002df8:	000a0513          	mv	a0,s4
c0002dfc:	714000ef          	jal	ra,c0003510 <alloc_pages>
c0002e00:	38a99c63          	bne	s3,a0,c0003198 <default_check+0x6dc>
c0002e04:	000a0593          	mv	a1,s4
c0002e08:	7bc000ef          	jal	ra,c00035c4 <free_pages>
c0002e0c:	00200513          	li	a0,2
c0002e10:	700000ef          	jal	ra,c0003510 <alloc_pages>
c0002e14:	36aa9263          	bne	s5,a0,c0003178 <default_check+0x6bc>
c0002e18:	00200593          	li	a1,2
c0002e1c:	7a8000ef          	jal	ra,c00035c4 <free_pages>
c0002e20:	000a0593          	mv	a1,s4
c0002e24:	000c8513          	mv	a0,s9
c0002e28:	79c000ef          	jal	ra,c00035c4 <free_pages>
c0002e2c:	00500513          	li	a0,5
c0002e30:	6e0000ef          	jal	ra,c0003510 <alloc_pages>
c0002e34:	00050993          	mv	s3,a0
c0002e38:	4a050063          	beqz	a0,c00032d8 <default_check+0x81c>
c0002e3c:	000a0513          	mv	a0,s4
c0002e40:	6d0000ef          	jal	ra,c0003510 <alloc_pages>
c0002e44:	2e051a63          	bnez	a0,c0003138 <default_check+0x67c>
c0002e48:	0000e797          	auipc	a5,0xe
c0002e4c:	6bc7a783          	lw	a5,1724(a5) # c0011504 <free_area+0x8>
c0002e50:	2c079463          	bnez	a5,c0003118 <default_check+0x65c>
c0002e54:	00500593          	li	a1,5
c0002e58:	00098513          	mv	a0,s3
c0002e5c:	01892423          	sw	s8,8(s2)
c0002e60:	01792023          	sw	s7,0(s2)
c0002e64:	01692223          	sw	s6,4(s2)
c0002e68:	75c000ef          	jal	ra,c00035c4 <free_pages>
c0002e6c:	0000e797          	auipc	a5,0xe
c0002e70:	6947a783          	lw	a5,1684(a5) # c0011500 <free_area+0x4>
c0002e74:	01278c63          	beq	a5,s2,c0002e8c <default_check+0x3d0>
c0002e78:	ffc7a703          	lw	a4,-4(a5)
c0002e7c:	0047a783          	lw	a5,4(a5)
c0002e80:	fff48493          	addi	s1,s1,-1
c0002e84:	40e40433          	sub	s0,s0,a4
c0002e88:	ff2798e3          	bne	a5,s2,c0002e78 <default_check+0x3bc>
c0002e8c:	26049663          	bnez	s1,c00030f8 <default_check+0x63c>
c0002e90:	46041463          	bnez	s0,c00032f8 <default_check+0x83c>
c0002e94:	02c12083          	lw	ra,44(sp)
c0002e98:	02812403          	lw	s0,40(sp)
c0002e9c:	02412483          	lw	s1,36(sp)
c0002ea0:	02012903          	lw	s2,32(sp)
c0002ea4:	01c12983          	lw	s3,28(sp)
c0002ea8:	01812a03          	lw	s4,24(sp)
c0002eac:	01412a83          	lw	s5,20(sp)
c0002eb0:	01012b03          	lw	s6,16(sp)
c0002eb4:	00c12b83          	lw	s7,12(sp)
c0002eb8:	00812c03          	lw	s8,8(sp)
c0002ebc:	00412c83          	lw	s9,4(sp)
c0002ec0:	03010113          	addi	sp,sp,48
c0002ec4:	00008067          	ret
c0002ec8:	00000993          	li	s3,0
c0002ecc:	00000413          	li	s0,0
c0002ed0:	00000493          	li	s1,0
c0002ed4:	c6dff06f          	j	c0002b40 <default_check+0x84>
c0002ed8:	00003697          	auipc	a3,0x3
c0002edc:	54468693          	addi	a3,a3,1348 # c000641c <commands+0xcd4>
c0002ee0:	00003617          	auipc	a2,0x3
c0002ee4:	f8860613          	addi	a2,a2,-120 # c0005e68 <commands+0x720>
c0002ee8:	0f000593          	li	a1,240
c0002eec:	00004517          	auipc	a0,0x4
c0002ef0:	b2450513          	addi	a0,a0,-1244 # c0006a10 <commands+0x12c8>
c0002ef4:	b54fd0ef          	jal	ra,c0000248 <__panic>
c0002ef8:	00004697          	auipc	a3,0x4
c0002efc:	89c68693          	addi	a3,a3,-1892 # c0006794 <commands+0x104c>
c0002f00:	00003617          	auipc	a2,0x3
c0002f04:	f6860613          	addi	a2,a2,-152 # c0005e68 <commands+0x720>
c0002f08:	0be00593          	li	a1,190
c0002f0c:	00004517          	auipc	a0,0x4
c0002f10:	b0450513          	addi	a0,a0,-1276 # c0006a10 <commands+0x12c8>
c0002f14:	b34fd0ef          	jal	ra,c0000248 <__panic>
c0002f18:	00004697          	auipc	a3,0x4
c0002f1c:	85868693          	addi	a3,a3,-1960 # c0006770 <commands+0x1028>
c0002f20:	00003617          	auipc	a2,0x3
c0002f24:	f4860613          	addi	a2,a2,-184 # c0005e68 <commands+0x720>
c0002f28:	0bd00593          	li	a1,189
c0002f2c:	00004517          	auipc	a0,0x4
c0002f30:	ae450513          	addi	a0,a0,-1308 # c0006a10 <commands+0x12c8>
c0002f34:	b14fd0ef          	jal	ra,c0000248 <__panic>
c0002f38:	00003697          	auipc	a3,0x3
c0002f3c:	7e468693          	addi	a3,a3,2020 # c000671c <commands+0xfd4>
c0002f40:	00003617          	auipc	a2,0x3
c0002f44:	f2860613          	addi	a2,a2,-216 # c0005e68 <commands+0x720>
c0002f48:	0d200593          	li	a1,210
c0002f4c:	00004517          	auipc	a0,0x4
c0002f50:	ac450513          	addi	a0,a0,-1340 # c0006a10 <commands+0x12c8>
c0002f54:	af4fd0ef          	jal	ra,c0000248 <__panic>
c0002f58:	00004697          	auipc	a3,0x4
c0002f5c:	90068693          	addi	a3,a3,-1792 # c0006858 <commands+0x1110>
c0002f60:	00003617          	auipc	a2,0x3
c0002f64:	f0860613          	addi	a2,a2,-248 # c0005e68 <commands+0x720>
c0002f68:	0d900593          	li	a1,217
c0002f6c:	00004517          	auipc	a0,0x4
c0002f70:	aa450513          	addi	a0,a0,-1372 # c0006a10 <commands+0x12c8>
c0002f74:	ad4fd0ef          	jal	ra,c0000248 <__panic>
c0002f78:	00004697          	auipc	a3,0x4
c0002f7c:	8d068693          	addi	a3,a3,-1840 # c0006848 <commands+0x1100>
c0002f80:	00003617          	auipc	a2,0x3
c0002f84:	ee860613          	addi	a2,a2,-280 # c0005e68 <commands+0x720>
c0002f88:	0d000593          	li	a1,208
c0002f8c:	00004517          	auipc	a0,0x4
c0002f90:	a8450513          	addi	a0,a0,-1404 # c0006a10 <commands+0x12c8>
c0002f94:	ab4fd0ef          	jal	ra,c0000248 <__panic>
c0002f98:	00004697          	auipc	a3,0x4
c0002f9c:	89868693          	addi	a3,a3,-1896 # c0006830 <commands+0x10e8>
c0002fa0:	00003617          	auipc	a2,0x3
c0002fa4:	ec860613          	addi	a2,a2,-312 # c0005e68 <commands+0x720>
c0002fa8:	0cb00593          	li	a1,203
c0002fac:	00004517          	auipc	a0,0x4
c0002fb0:	a6450513          	addi	a0,a0,-1436 # c0006a10 <commands+0x12c8>
c0002fb4:	a94fd0ef          	jal	ra,c0000248 <__panic>
c0002fb8:	00004697          	auipc	a3,0x4
c0002fbc:	85868693          	addi	a3,a3,-1960 # c0006810 <commands+0x10c8>
c0002fc0:	00003617          	auipc	a2,0x3
c0002fc4:	ea860613          	addi	a2,a2,-344 # c0005e68 <commands+0x720>
c0002fc8:	0c200593          	li	a1,194
c0002fcc:	00004517          	auipc	a0,0x4
c0002fd0:	a4450513          	addi	a0,a0,-1468 # c0006a10 <commands+0x12c8>
c0002fd4:	a74fd0ef          	jal	ra,c0000248 <__panic>
c0002fd8:	00004697          	auipc	a3,0x4
c0002fdc:	81868693          	addi	a3,a3,-2024 # c00067f0 <commands+0x10a8>
c0002fe0:	00003617          	auipc	a2,0x3
c0002fe4:	e8860613          	addi	a2,a2,-376 # c0005e68 <commands+0x720>
c0002fe8:	0c100593          	li	a1,193
c0002fec:	00004517          	auipc	a0,0x4
c0002ff0:	a2450513          	addi	a0,a0,-1500 # c0006a10 <commands+0x12c8>
c0002ff4:	a54fd0ef          	jal	ra,c0000248 <__panic>
c0002ff8:	00003697          	auipc	a3,0x3
c0002ffc:	5a868693          	addi	a3,a3,1448 # c00065a0 <commands+0xe58>
c0003000:	00003617          	auipc	a2,0x3
c0003004:	e6860613          	addi	a2,a2,-408 # c0005e68 <commands+0x720>
c0003008:	0df00593          	li	a1,223
c000300c:	00004517          	auipc	a0,0x4
c0003010:	a0450513          	addi	a0,a0,-1532 # c0006a10 <commands+0x12c8>
c0003014:	a34fd0ef          	jal	ra,c0000248 <__panic>
c0003018:	00004697          	auipc	a3,0x4
c000301c:	81868693          	addi	a3,a3,-2024 # c0006830 <commands+0x10e8>
c0003020:	00003617          	auipc	a2,0x3
c0003024:	e4860613          	addi	a2,a2,-440 # c0005e68 <commands+0x720>
c0003028:	0dd00593          	li	a1,221
c000302c:	00004517          	auipc	a0,0x4
c0003030:	9e450513          	addi	a0,a0,-1564 # c0006a10 <commands+0x12c8>
c0003034:	a14fd0ef          	jal	ra,c0000248 <__panic>
c0003038:	00004697          	auipc	a3,0x4
c000303c:	83868693          	addi	a3,a3,-1992 # c0006870 <commands+0x1128>
c0003040:	00003617          	auipc	a2,0x3
c0003044:	e2860613          	addi	a2,a2,-472 # c0005e68 <commands+0x720>
c0003048:	0dc00593          	li	a1,220
c000304c:	00004517          	auipc	a0,0x4
c0003050:	9c450513          	addi	a0,a0,-1596 # c0006a10 <commands+0x12c8>
c0003054:	9f4fd0ef          	jal	ra,c0000248 <__panic>
c0003058:	00003697          	auipc	a3,0x3
c000305c:	77868693          	addi	a3,a3,1912 # c00067d0 <commands+0x1088>
c0003060:	00003617          	auipc	a2,0x3
c0003064:	e0860613          	addi	a2,a2,-504 # c0005e68 <commands+0x720>
c0003068:	0c000593          	li	a1,192
c000306c:	00004517          	auipc	a0,0x4
c0003070:	9a450513          	addi	a0,a0,-1628 # c0006a10 <commands+0x12c8>
c0003074:	9d4fd0ef          	jal	ra,c0000248 <__panic>
c0003078:	00003697          	auipc	a3,0x3
c000307c:	7b868693          	addi	a3,a3,1976 # c0006830 <commands+0x10e8>
c0003080:	00003617          	auipc	a2,0x3
c0003084:	de860613          	addi	a2,a2,-536 # c0005e68 <commands+0x720>
c0003088:	0d600593          	li	a1,214
c000308c:	00004517          	auipc	a0,0x4
c0003090:	98450513          	addi	a0,a0,-1660 # c0006a10 <commands+0x12c8>
c0003094:	9b4fd0ef          	jal	ra,c0000248 <__panic>
c0003098:	00003697          	auipc	a3,0x3
c000309c:	6bc68693          	addi	a3,a3,1724 # c0006754 <commands+0x100c>
c00030a0:	00003617          	auipc	a2,0x3
c00030a4:	dc860613          	addi	a2,a2,-568 # c0005e68 <commands+0x720>
c00030a8:	0d400593          	li	a1,212
c00030ac:	00004517          	auipc	a0,0x4
c00030b0:	96450513          	addi	a0,a0,-1692 # c0006a10 <commands+0x12c8>
c00030b4:	994fd0ef          	jal	ra,c0000248 <__panic>
c00030b8:	00003697          	auipc	a3,0x3
c00030bc:	68068693          	addi	a3,a3,1664 # c0006738 <commands+0xff0>
c00030c0:	00003617          	auipc	a2,0x3
c00030c4:	da860613          	addi	a2,a2,-600 # c0005e68 <commands+0x720>
c00030c8:	0d300593          	li	a1,211
c00030cc:	00004517          	auipc	a0,0x4
c00030d0:	94450513          	addi	a0,a0,-1724 # c0006a10 <commands+0x12c8>
c00030d4:	974fd0ef          	jal	ra,c0000248 <__panic>
c00030d8:	00003697          	auipc	a3,0x3
c00030dc:	67c68693          	addi	a3,a3,1660 # c0006754 <commands+0x100c>
c00030e0:	00003617          	auipc	a2,0x3
c00030e4:	d8860613          	addi	a2,a2,-632 # c0005e68 <commands+0x720>
c00030e8:	0bb00593          	li	a1,187
c00030ec:	00004517          	auipc	a0,0x4
c00030f0:	92450513          	addi	a0,a0,-1756 # c0006a10 <commands+0x12c8>
c00030f4:	954fd0ef          	jal	ra,c0000248 <__panic>
c00030f8:	00004697          	auipc	a3,0x4
c00030fc:	8d868693          	addi	a3,a3,-1832 # c00069d0 <commands+0x1288>
c0003100:	00003617          	auipc	a2,0x3
c0003104:	d6860613          	addi	a2,a2,-664 # c0005e68 <commands+0x720>
c0003108:	12500593          	li	a1,293
c000310c:	00004517          	auipc	a0,0x4
c0003110:	90450513          	addi	a0,a0,-1788 # c0006a10 <commands+0x12c8>
c0003114:	934fd0ef          	jal	ra,c0000248 <__panic>
c0003118:	00003697          	auipc	a3,0x3
c000311c:	48868693          	addi	a3,a3,1160 # c00065a0 <commands+0xe58>
c0003120:	00003617          	auipc	a2,0x3
c0003124:	d4860613          	addi	a2,a2,-696 # c0005e68 <commands+0x720>
c0003128:	11a00593          	li	a1,282
c000312c:	00004517          	auipc	a0,0x4
c0003130:	8e450513          	addi	a0,a0,-1820 # c0006a10 <commands+0x12c8>
c0003134:	914fd0ef          	jal	ra,c0000248 <__panic>
c0003138:	00003697          	auipc	a3,0x3
c000313c:	6f868693          	addi	a3,a3,1784 # c0006830 <commands+0x10e8>
c0003140:	00003617          	auipc	a2,0x3
c0003144:	d2860613          	addi	a2,a2,-728 # c0005e68 <commands+0x720>
c0003148:	11800593          	li	a1,280
c000314c:	00004517          	auipc	a0,0x4
c0003150:	8c450513          	addi	a0,a0,-1852 # c0006a10 <commands+0x12c8>
c0003154:	8f4fd0ef          	jal	ra,c0000248 <__panic>
c0003158:	00003697          	auipc	a3,0x3
c000315c:	73468693          	addi	a3,a3,1844 # c000688c <commands+0x1144>
c0003160:	00003617          	auipc	a2,0x3
c0003164:	d0860613          	addi	a2,a2,-760 # c0005e68 <commands+0x720>
c0003168:	0f800593          	li	a1,248
c000316c:	00004517          	auipc	a0,0x4
c0003170:	8a450513          	addi	a0,a0,-1884 # c0006a10 <commands+0x12c8>
c0003174:	8d4fd0ef          	jal	ra,c0000248 <__panic>
c0003178:	00004697          	auipc	a3,0x4
c000317c:	81868693          	addi	a3,a3,-2024 # c0006990 <commands+0x1248>
c0003180:	00003617          	auipc	a2,0x3
c0003184:	ce860613          	addi	a2,a2,-792 # c0005e68 <commands+0x720>
c0003188:	11200593          	li	a1,274
c000318c:	00004517          	auipc	a0,0x4
c0003190:	88450513          	addi	a0,a0,-1916 # c0006a10 <commands+0x12c8>
c0003194:	8b4fd0ef          	jal	ra,c0000248 <__panic>
c0003198:	00003697          	auipc	a3,0x3
c000319c:	7d868693          	addi	a3,a3,2008 # c0006970 <commands+0x1228>
c00031a0:	00003617          	auipc	a2,0x3
c00031a4:	cc860613          	addi	a2,a2,-824 # c0005e68 <commands+0x720>
c00031a8:	11000593          	li	a1,272
c00031ac:	00004517          	auipc	a0,0x4
c00031b0:	86450513          	addi	a0,a0,-1948 # c0006a10 <commands+0x12c8>
c00031b4:	894fd0ef          	jal	ra,c0000248 <__panic>
c00031b8:	00003697          	auipc	a3,0x3
c00031bc:	79068693          	addi	a3,a3,1936 # c0006948 <commands+0x1200>
c00031c0:	00003617          	auipc	a2,0x3
c00031c4:	ca860613          	addi	a2,a2,-856 # c0005e68 <commands+0x720>
c00031c8:	10e00593          	li	a1,270
c00031cc:	00004517          	auipc	a0,0x4
c00031d0:	84450513          	addi	a0,a0,-1980 # c0006a10 <commands+0x12c8>
c00031d4:	874fd0ef          	jal	ra,c0000248 <__panic>
c00031d8:	00003697          	auipc	a3,0x3
c00031dc:	74868693          	addi	a3,a3,1864 # c0006920 <commands+0x11d8>
c00031e0:	00003617          	auipc	a2,0x3
c00031e4:	c8860613          	addi	a2,a2,-888 # c0005e68 <commands+0x720>
c00031e8:	10d00593          	li	a1,269
c00031ec:	00004517          	auipc	a0,0x4
c00031f0:	82450513          	addi	a0,a0,-2012 # c0006a10 <commands+0x12c8>
c00031f4:	854fd0ef          	jal	ra,c0000248 <__panic>
c00031f8:	00003697          	auipc	a3,0x3
c00031fc:	71868693          	addi	a3,a3,1816 # c0006910 <commands+0x11c8>
c0003200:	00003617          	auipc	a2,0x3
c0003204:	c6860613          	addi	a2,a2,-920 # c0005e68 <commands+0x720>
c0003208:	10800593          	li	a1,264
c000320c:	00004517          	auipc	a0,0x4
c0003210:	80450513          	addi	a0,a0,-2044 # c0006a10 <commands+0x12c8>
c0003214:	834fd0ef          	jal	ra,c0000248 <__panic>
c0003218:	00003697          	auipc	a3,0x3
c000321c:	61868693          	addi	a3,a3,1560 # c0006830 <commands+0x10e8>
c0003220:	00003617          	auipc	a2,0x3
c0003224:	c4860613          	addi	a2,a2,-952 # c0005e68 <commands+0x720>
c0003228:	10700593          	li	a1,263
c000322c:	00003517          	auipc	a0,0x3
c0003230:	7e450513          	addi	a0,a0,2020 # c0006a10 <commands+0x12c8>
c0003234:	814fd0ef          	jal	ra,c0000248 <__panic>
c0003238:	00003697          	auipc	a3,0x3
c000323c:	6b868693          	addi	a3,a3,1720 # c00068f0 <commands+0x11a8>
c0003240:	00003617          	auipc	a2,0x3
c0003244:	c2860613          	addi	a2,a2,-984 # c0005e68 <commands+0x720>
c0003248:	10600593          	li	a1,262
c000324c:	00003517          	auipc	a0,0x3
c0003250:	7c450513          	addi	a0,a0,1988 # c0006a10 <commands+0x12c8>
c0003254:	ff5fc0ef          	jal	ra,c0000248 <__panic>
c0003258:	00003697          	auipc	a3,0x3
c000325c:	66c68693          	addi	a3,a3,1644 # c00068c4 <commands+0x117c>
c0003260:	00003617          	auipc	a2,0x3
c0003264:	c0860613          	addi	a2,a2,-1016 # c0005e68 <commands+0x720>
c0003268:	10500593          	li	a1,261
c000326c:	00003517          	auipc	a0,0x3
c0003270:	7a450513          	addi	a0,a0,1956 # c0006a10 <commands+0x12c8>
c0003274:	fd5fc0ef          	jal	ra,c0000248 <__panic>
c0003278:	00003697          	auipc	a3,0x3
c000327c:	63468693          	addi	a3,a3,1588 # c00068ac <commands+0x1164>
c0003280:	00003617          	auipc	a2,0x3
c0003284:	be860613          	addi	a2,a2,-1048 # c0005e68 <commands+0x720>
c0003288:	10400593          	li	a1,260
c000328c:	00003517          	auipc	a0,0x3
c0003290:	78450513          	addi	a0,a0,1924 # c0006a10 <commands+0x12c8>
c0003294:	fb5fc0ef          	jal	ra,c0000248 <__panic>
c0003298:	00003697          	auipc	a3,0x3
c000329c:	59868693          	addi	a3,a3,1432 # c0006830 <commands+0x10e8>
c00032a0:	00003617          	auipc	a2,0x3
c00032a4:	bc860613          	addi	a2,a2,-1080 # c0005e68 <commands+0x720>
c00032a8:	0fe00593          	li	a1,254
c00032ac:	00003517          	auipc	a0,0x3
c00032b0:	76450513          	addi	a0,a0,1892 # c0006a10 <commands+0x12c8>
c00032b4:	f95fc0ef          	jal	ra,c0000248 <__panic>
c00032b8:	00003697          	auipc	a3,0x3
c00032bc:	5e068693          	addi	a3,a3,1504 # c0006898 <commands+0x1150>
c00032c0:	00003617          	auipc	a2,0x3
c00032c4:	ba860613          	addi	a2,a2,-1112 # c0005e68 <commands+0x720>
c00032c8:	0f900593          	li	a1,249
c00032cc:	00003517          	auipc	a0,0x3
c00032d0:	74450513          	addi	a0,a0,1860 # c0006a10 <commands+0x12c8>
c00032d4:	f75fc0ef          	jal	ra,c0000248 <__panic>
c00032d8:	00003697          	auipc	a3,0x3
c00032dc:	6d868693          	addi	a3,a3,1752 # c00069b0 <commands+0x1268>
c00032e0:	00003617          	auipc	a2,0x3
c00032e4:	b8860613          	addi	a2,a2,-1144 # c0005e68 <commands+0x720>
c00032e8:	11700593          	li	a1,279
c00032ec:	00003517          	auipc	a0,0x3
c00032f0:	72450513          	addi	a0,a0,1828 # c0006a10 <commands+0x12c8>
c00032f4:	f55fc0ef          	jal	ra,c0000248 <__panic>
c00032f8:	00003697          	auipc	a3,0x3
c00032fc:	6e468693          	addi	a3,a3,1764 # c00069dc <commands+0x1294>
c0003300:	00003617          	auipc	a2,0x3
c0003304:	b6860613          	addi	a2,a2,-1176 # c0005e68 <commands+0x720>
c0003308:	12600593          	li	a1,294
c000330c:	00003517          	auipc	a0,0x3
c0003310:	70450513          	addi	a0,a0,1796 # c0006a10 <commands+0x12c8>
c0003314:	f35fc0ef          	jal	ra,c0000248 <__panic>
c0003318:	00003697          	auipc	a3,0x3
c000331c:	11468693          	addi	a3,a3,276 # c000642c <commands+0xce4>
c0003320:	00003617          	auipc	a2,0x3
c0003324:	b4860613          	addi	a2,a2,-1208 # c0005e68 <commands+0x720>
c0003328:	0f300593          	li	a1,243
c000332c:	00003517          	auipc	a0,0x3
c0003330:	6e450513          	addi	a0,a0,1764 # c0006a10 <commands+0x12c8>
c0003334:	f15fc0ef          	jal	ra,c0000248 <__panic>
c0003338:	00003697          	auipc	a3,0x3
c000333c:	40068693          	addi	a3,a3,1024 # c0006738 <commands+0xff0>
c0003340:	00003617          	auipc	a2,0x3
c0003344:	b2860613          	addi	a2,a2,-1240 # c0005e68 <commands+0x720>
c0003348:	0ba00593          	li	a1,186
c000334c:	00003517          	auipc	a0,0x3
c0003350:	6c450513          	addi	a0,a0,1732 # c0006a10 <commands+0x12c8>
c0003354:	ef5fc0ef          	jal	ra,c0000248 <__panic>
c0003358:	00003697          	auipc	a3,0x3
c000335c:	3c468693          	addi	a3,a3,964 # c000671c <commands+0xfd4>
c0003360:	00003617          	auipc	a2,0x3
c0003364:	b0860613          	addi	a2,a2,-1272 # c0005e68 <commands+0x720>
c0003368:	0b900593          	li	a1,185
c000336c:	00003517          	auipc	a0,0x3
c0003370:	6a450513          	addi	a0,a0,1700 # c0006a10 <commands+0x12c8>
c0003374:	ed5fc0ef          	jal	ra,c0000248 <__panic>

c0003378 <default_alloc_pages>:
c0003378:	0a050263          	beqz	a0,c000341c <default_alloc_pages+0xa4>
c000337c:	0000e597          	auipc	a1,0xe
c0003380:	1885a583          	lw	a1,392(a1) # c0011504 <free_area+0x8>
c0003384:	00050693          	mv	a3,a0
c0003388:	0000e617          	auipc	a2,0xe
c000338c:	17460613          	addi	a2,a2,372 # c00114fc <free_area>
c0003390:	00a5ee63          	bltu	a1,a0,c00033ac <default_alloc_pages+0x34>
c0003394:	00060793          	mv	a5,a2
c0003398:	00c0006f          	j	c00033a4 <default_alloc_pages+0x2c>
c000339c:	ffc7a703          	lw	a4,-4(a5)
c00033a0:	00d77a63          	bleu	a3,a4,c00033b4 <default_alloc_pages+0x3c>
c00033a4:	0047a783          	lw	a5,4(a5)
c00033a8:	fec79ae3          	bne	a5,a2,c000339c <default_alloc_pages+0x24>
c00033ac:	00000513          	li	a0,0
c00033b0:	00008067          	ret
c00033b4:	ff478513          	addi	a0,a5,-12
c00033b8:	fe050ce3          	beqz	a0,c00033b0 <default_alloc_pages+0x38>
c00033bc:	0007a803          	lw	a6,0(a5)
c00033c0:	0047a883          	lw	a7,4(a5)
c00033c4:	01182223          	sw	a7,4(a6)
c00033c8:	0108a023          	sw	a6,0(a7)
c00033cc:	02e6fc63          	bleu	a4,a3,c0003404 <default_alloc_pages+0x8c>
c00033d0:	00569893          	slli	a7,a3,0x5
c00033d4:	011508b3          	add	a7,a0,a7
c00033d8:	40d70733          	sub	a4,a4,a3
c00033dc:	00e8a423          	sw	a4,8(a7)
c00033e0:	00488313          	addi	t1,a7,4
c00033e4:	00200713          	li	a4,2
c00033e8:	40e3202f          	amoor.w	zero,a4,(t1)
c00033ec:	00482703          	lw	a4,4(a6)
c00033f0:	00c88313          	addi	t1,a7,12
c00033f4:	00672023          	sw	t1,0(a4)
c00033f8:	00682223          	sw	t1,4(a6)
c00033fc:	00e8a823          	sw	a4,16(a7)
c0003400:	0108a623          	sw	a6,12(a7)
c0003404:	40d586b3          	sub	a3,a1,a3
c0003408:	00d62423          	sw	a3,8(a2)
c000340c:	ffd00713          	li	a4,-3
c0003410:	ff878793          	addi	a5,a5,-8
c0003414:	60e7a02f          	amoand.w	zero,a4,(a5)
c0003418:	00008067          	ret
c000341c:	ff010113          	addi	sp,sp,-16
c0003420:	00003697          	auipc	a3,0x3
c0003424:	60868693          	addi	a3,a3,1544 # c0006a28 <commands+0x12e0>
c0003428:	00003617          	auipc	a2,0x3
c000342c:	a4060613          	addi	a2,a2,-1472 # c0005e68 <commands+0x720>
c0003430:	06200593          	li	a1,98
c0003434:	00003517          	auipc	a0,0x3
c0003438:	5dc50513          	addi	a0,a0,1500 # c0006a10 <commands+0x12c8>
c000343c:	00112623          	sw	ra,12(sp)
c0003440:	e09fc0ef          	jal	ra,c0000248 <__panic>

c0003444 <get_pgtable_items.isra.4.part.5>:
c0003444:	00050313          	mv	t1,a0
c0003448:	04a5f063          	bleu	a0,a1,c0003488 <get_pgtable_items.isra.4.part.5+0x44>
c000344c:	00259813          	slli	a6,a1,0x2
c0003450:	010608b3          	add	a7,a2,a6
c0003454:	0008a783          	lw	a5,0(a7)
c0003458:	0017f793          	andi	a5,a5,1
c000345c:	02079a63          	bnez	a5,c0003490 <get_pgtable_items.isra.4.part.5+0x4c>
c0003460:	00480813          	addi	a6,a6,4
c0003464:	01060833          	add	a6,a2,a6
c0003468:	0140006f          	j	c000347c <get_pgtable_items.isra.4.part.5+0x38>
c000346c:	00082783          	lw	a5,0(a6)
c0003470:	00480813          	addi	a6,a6,4
c0003474:	0017f793          	andi	a5,a5,1
c0003478:	00079c63          	bnez	a5,c0003490 <get_pgtable_items.isra.4.part.5+0x4c>
c000347c:	00158593          	addi	a1,a1,1
c0003480:	00080893          	mv	a7,a6
c0003484:	fe6594e3          	bne	a1,t1,c000346c <get_pgtable_items.isra.4.part.5+0x28>
c0003488:	00000513          	li	a0,0
c000348c:	00008067          	ret
c0003490:	00068463          	beqz	a3,c0003498 <get_pgtable_items.isra.4.part.5+0x54>
c0003494:	00b6a023          	sw	a1,0(a3)
c0003498:	0008a503          	lw	a0,0(a7)
c000349c:	00158593          	addi	a1,a1,1
c00034a0:	01f57513          	andi	a0,a0,31
c00034a4:	0265fe63          	bleu	t1,a1,c00034e0 <get_pgtable_items.isra.4.part.5+0x9c>
c00034a8:	00259793          	slli	a5,a1,0x2
c00034ac:	00f606b3          	add	a3,a2,a5
c00034b0:	0006a683          	lw	a3,0(a3)
c00034b4:	01f6f693          	andi	a3,a3,31
c00034b8:	02a69463          	bne	a3,a0,c00034e0 <get_pgtable_items.isra.4.part.5+0x9c>
c00034bc:	ffc78793          	addi	a5,a5,-4
c00034c0:	00f60633          	add	a2,a2,a5
c00034c4:	0140006f          	j	c00034d8 <get_pgtable_items.isra.4.part.5+0x94>
c00034c8:	00862783          	lw	a5,8(a2)
c00034cc:	00460613          	addi	a2,a2,4
c00034d0:	01f7f793          	andi	a5,a5,31
c00034d4:	00d79663          	bne	a5,a3,c00034e0 <get_pgtable_items.isra.4.part.5+0x9c>
c00034d8:	00158593          	addi	a1,a1,1
c00034dc:	fe65e6e3          	bltu	a1,t1,c00034c8 <get_pgtable_items.isra.4.part.5+0x84>
c00034e0:	00070663          	beqz	a4,c00034ec <get_pgtable_items.isra.4.part.5+0xa8>
c00034e4:	00b72023          	sw	a1,0(a4)
c00034e8:	00008067          	ret
c00034ec:	00008067          	ret

c00034f0 <pa2page.part.6>:
c00034f0:	ff010113          	addi	sp,sp,-16
c00034f4:	00003617          	auipc	a2,0x3
c00034f8:	c5860613          	addi	a2,a2,-936 # c000614c <commands+0xa04>
c00034fc:	06600593          	li	a1,102
c0003500:	00003517          	auipc	a0,0x3
c0003504:	c6c50513          	addi	a0,a0,-916 # c000616c <commands+0xa24>
c0003508:	00112623          	sw	ra,12(sp)
c000350c:	d3dfc0ef          	jal	ra,c0000248 <__panic>

c0003510 <alloc_pages>:
c0003510:	ff010113          	addi	sp,sp,-16
c0003514:	00812423          	sw	s0,8(sp)
c0003518:	01212023          	sw	s2,0(sp)
c000351c:	00112623          	sw	ra,12(sp)
c0003520:	00912223          	sw	s1,4(sp)
c0003524:	00050413          	mv	s0,a0
c0003528:	00100913          	li	s2,1
c000352c:	0400006f          	j	c000356c <alloc_pages+0x5c>
c0003530:	0000e797          	auipc	a5,0xe
c0003534:	fd87a783          	lw	a5,-40(a5) # c0011508 <pmm_manager>
c0003538:	00c7a783          	lw	a5,12(a5)
c000353c:	000780e7          	jalr	a5
c0003540:	00050493          	mv	s1,a0
c0003544:	00000613          	li	a2,0
c0003548:	00040593          	mv	a1,s0
c000354c:	04049e63          	bnez	s1,c00035a8 <alloc_pages+0x98>
c0003550:	04896c63          	bltu	s2,s0,c00035a8 <alloc_pages+0x98>
c0003554:	0000e797          	auipc	a5,0xe
c0003558:	eec7a783          	lw	a5,-276(a5) # c0011440 <swap_init_ok>
c000355c:	04078663          	beqz	a5,c00035a8 <alloc_pages+0x98>
c0003560:	0000e517          	auipc	a0,0xe
c0003564:	ef452503          	lw	a0,-268(a0) # c0011454 <check_mm_struct>
c0003568:	f3dfe0ef          	jal	ra,c00024a4 <swap_out>
c000356c:	100027f3          	csrr	a5,sstatus
c0003570:	0027f793          	andi	a5,a5,2
c0003574:	00040513          	mv	a0,s0
c0003578:	fa078ce3          	beqz	a5,c0003530 <alloc_pages+0x20>
c000357c:	a30fd0ef          	jal	ra,c00007ac <intr_disable>
c0003580:	0000e797          	auipc	a5,0xe
c0003584:	f887a783          	lw	a5,-120(a5) # c0011508 <pmm_manager>
c0003588:	00c7a783          	lw	a5,12(a5)
c000358c:	00040513          	mv	a0,s0
c0003590:	000780e7          	jalr	a5
c0003594:	00050493          	mv	s1,a0
c0003598:	a0cfd0ef          	jal	ra,c00007a4 <intr_enable>
c000359c:	00000613          	li	a2,0
c00035a0:	00040593          	mv	a1,s0
c00035a4:	fa0486e3          	beqz	s1,c0003550 <alloc_pages+0x40>
c00035a8:	00c12083          	lw	ra,12(sp)
c00035ac:	00048513          	mv	a0,s1
c00035b0:	00812403          	lw	s0,8(sp)
c00035b4:	00412483          	lw	s1,4(sp)
c00035b8:	00012903          	lw	s2,0(sp)
c00035bc:	01010113          	addi	sp,sp,16
c00035c0:	00008067          	ret

c00035c4 <free_pages>:
c00035c4:	100027f3          	csrr	a5,sstatus
c00035c8:	0027f793          	andi	a5,a5,2
c00035cc:	00079a63          	bnez	a5,c00035e0 <free_pages+0x1c>
c00035d0:	0000e797          	auipc	a5,0xe
c00035d4:	f387a783          	lw	a5,-200(a5) # c0011508 <pmm_manager>
c00035d8:	0107a303          	lw	t1,16(a5)
c00035dc:	00030067          	jr	t1
c00035e0:	ff010113          	addi	sp,sp,-16
c00035e4:	00112623          	sw	ra,12(sp)
c00035e8:	00812423          	sw	s0,8(sp)
c00035ec:	00912223          	sw	s1,4(sp)
c00035f0:	00050413          	mv	s0,a0
c00035f4:	00058493          	mv	s1,a1
c00035f8:	9b4fd0ef          	jal	ra,c00007ac <intr_disable>
c00035fc:	0000e797          	auipc	a5,0xe
c0003600:	f0c7a783          	lw	a5,-244(a5) # c0011508 <pmm_manager>
c0003604:	0107a783          	lw	a5,16(a5)
c0003608:	00048593          	mv	a1,s1
c000360c:	00040513          	mv	a0,s0
c0003610:	000780e7          	jalr	a5
c0003614:	00c12083          	lw	ra,12(sp)
c0003618:	00812403          	lw	s0,8(sp)
c000361c:	00412483          	lw	s1,4(sp)
c0003620:	01010113          	addi	sp,sp,16
c0003624:	980fd06f          	j	c00007a4 <intr_enable>

c0003628 <nr_free_pages>:
c0003628:	100027f3          	csrr	a5,sstatus
c000362c:	0027f793          	andi	a5,a5,2
c0003630:	00079a63          	bnez	a5,c0003644 <nr_free_pages+0x1c>
c0003634:	0000e797          	auipc	a5,0xe
c0003638:	ed47a783          	lw	a5,-300(a5) # c0011508 <pmm_manager>
c000363c:	0147a303          	lw	t1,20(a5)
c0003640:	00030067          	jr	t1
c0003644:	ff010113          	addi	sp,sp,-16
c0003648:	00112623          	sw	ra,12(sp)
c000364c:	00812423          	sw	s0,8(sp)
c0003650:	95cfd0ef          	jal	ra,c00007ac <intr_disable>
c0003654:	0000e797          	auipc	a5,0xe
c0003658:	eb47a783          	lw	a5,-332(a5) # c0011508 <pmm_manager>
c000365c:	0147a783          	lw	a5,20(a5)
c0003660:	000780e7          	jalr	a5
c0003664:	00050413          	mv	s0,a0
c0003668:	93cfd0ef          	jal	ra,c00007a4 <intr_enable>
c000366c:	00c12083          	lw	ra,12(sp)
c0003670:	00040513          	mv	a0,s0
c0003674:	00812403          	lw	s0,8(sp)
c0003678:	01010113          	addi	sp,sp,16
c000367c:	00008067          	ret

c0003680 <get_pte>:
c0003680:	fe010113          	addi	sp,sp,-32
c0003684:	01212823          	sw	s2,16(sp)
c0003688:	0165d913          	srli	s2,a1,0x16
c000368c:	00291913          	slli	s2,s2,0x2
c0003690:	01250933          	add	s2,a0,s2
c0003694:	00092683          	lw	a3,0(s2)
c0003698:	00912a23          	sw	s1,20(sp)
c000369c:	00112e23          	sw	ra,28(sp)
c00036a0:	00812c23          	sw	s0,24(sp)
c00036a4:	01312623          	sw	s3,12(sp)
c00036a8:	0016f793          	andi	a5,a3,1
c00036ac:	00058493          	mv	s1,a1
c00036b0:	08079663          	bnez	a5,c000373c <get_pte+0xbc>
c00036b4:	0c060e63          	beqz	a2,c0003790 <get_pte+0x110>
c00036b8:	00100513          	li	a0,1
c00036bc:	e55ff0ef          	jal	ra,c0003510 <alloc_pages>
c00036c0:	00050413          	mv	s0,a0
c00036c4:	0c050663          	beqz	a0,c0003790 <get_pte+0x110>
c00036c8:	0000e517          	auipc	a0,0xe
c00036cc:	e4c52503          	lw	a0,-436(a0) # c0011514 <pages>
c00036d0:	00100793          	li	a5,1
c00036d4:	40a40533          	sub	a0,s0,a0
c00036d8:	00f42023          	sw	a5,0(s0)
c00036dc:	40555513          	srai	a0,a0,0x5
c00036e0:	000809b7          	lui	s3,0x80
c00036e4:	001007b7          	lui	a5,0x100
c00036e8:	01350533          	add	a0,a0,s3
c00036ec:	fff78793          	addi	a5,a5,-1 # fffff <BASE_ADDRESS-0xbff00001>
c00036f0:	00f577b3          	and	a5,a0,a5
c00036f4:	0000e717          	auipc	a4,0xe
c00036f8:	d5472703          	lw	a4,-684(a4) # c0011448 <npage>
c00036fc:	00c51513          	slli	a0,a0,0xc
c0003700:	0ce7f463          	bleu	a4,a5,c00037c8 <get_pte+0x148>
c0003704:	0000e797          	auipc	a5,0xe
c0003708:	e087a783          	lw	a5,-504(a5) # c001150c <va_pa_offset>
c000370c:	00001637          	lui	a2,0x1
c0003710:	00000593          	li	a1,0
c0003714:	00f50533          	add	a0,a0,a5
c0003718:	0d9010ef          	jal	ra,c0004ff0 <memset>
c000371c:	0000e697          	auipc	a3,0xe
c0003720:	df86a683          	lw	a3,-520(a3) # c0011514 <pages>
c0003724:	40d406b3          	sub	a3,s0,a3
c0003728:	4056d693          	srai	a3,a3,0x5
c000372c:	013686b3          	add	a3,a3,s3
c0003730:	00a69693          	slli	a3,a3,0xa
c0003734:	0116e693          	ori	a3,a3,17
c0003738:	00d92023          	sw	a3,0(s2)
c000373c:	00269693          	slli	a3,a3,0x2
c0003740:	fffff537          	lui	a0,0xfffff
c0003744:	00a6f6b3          	and	a3,a3,a0
c0003748:	00c6d713          	srli	a4,a3,0xc
c000374c:	0000e797          	auipc	a5,0xe
c0003750:	cfc7a783          	lw	a5,-772(a5) # c0011448 <npage>
c0003754:	04f77e63          	bleu	a5,a4,c00037b0 <get_pte+0x130>
c0003758:	00c4d513          	srli	a0,s1,0xc
c000375c:	01c12083          	lw	ra,28(sp)
c0003760:	3ff57513          	andi	a0,a0,1023
c0003764:	0000e797          	auipc	a5,0xe
c0003768:	da87a783          	lw	a5,-600(a5) # c001150c <va_pa_offset>
c000376c:	00f686b3          	add	a3,a3,a5
c0003770:	00251513          	slli	a0,a0,0x2
c0003774:	00a68533          	add	a0,a3,a0
c0003778:	01812403          	lw	s0,24(sp)
c000377c:	01412483          	lw	s1,20(sp)
c0003780:	01012903          	lw	s2,16(sp)
c0003784:	00c12983          	lw	s3,12(sp)
c0003788:	02010113          	addi	sp,sp,32
c000378c:	00008067          	ret
c0003790:	01c12083          	lw	ra,28(sp)
c0003794:	00000513          	li	a0,0
c0003798:	01812403          	lw	s0,24(sp)
c000379c:	01412483          	lw	s1,20(sp)
c00037a0:	01012903          	lw	s2,16(sp)
c00037a4:	00c12983          	lw	s3,12(sp)
c00037a8:	02010113          	addi	sp,sp,32
c00037ac:	00008067          	ret
c00037b0:	00003617          	auipc	a2,0x3
c00037b4:	2e860613          	addi	a2,a2,744 # c0006a98 <default_pmm_manager+0x58>
c00037b8:	12700593          	li	a1,295
c00037bc:	00003517          	auipc	a0,0x3
c00037c0:	30050513          	addi	a0,a0,768 # c0006abc <default_pmm_manager+0x7c>
c00037c4:	a85fc0ef          	jal	ra,c0000248 <__panic>
c00037c8:	00050693          	mv	a3,a0
c00037cc:	00003617          	auipc	a2,0x3
c00037d0:	2cc60613          	addi	a2,a2,716 # c0006a98 <default_pmm_manager+0x58>
c00037d4:	12400593          	li	a1,292
c00037d8:	00003517          	auipc	a0,0x3
c00037dc:	2e450513          	addi	a0,a0,740 # c0006abc <default_pmm_manager+0x7c>
c00037e0:	a69fc0ef          	jal	ra,c0000248 <__panic>

c00037e4 <boot_map_segment>:
c00037e4:	fe010113          	addi	sp,sp,-32
c00037e8:	01312623          	sw	s3,12(sp)
c00037ec:	000019b7          	lui	s3,0x1
c00037f0:	00d5c7b3          	xor	a5,a1,a3
c00037f4:	fff98813          	addi	a6,s3,-1 # fff <BASE_ADDRESS-0xbffff001>
c00037f8:	00112e23          	sw	ra,28(sp)
c00037fc:	00812c23          	sw	s0,24(sp)
c0003800:	00912a23          	sw	s1,20(sp)
c0003804:	01212823          	sw	s2,16(sp)
c0003808:	01412423          	sw	s4,8(sp)
c000380c:	01512223          	sw	s5,4(sp)
c0003810:	01612023          	sw	s6,0(sp)
c0003814:	0107f7b3          	and	a5,a5,a6
c0003818:	0a079c63          	bnez	a5,c00038d0 <boot_map_segment+0xec>
c000381c:	010607b3          	add	a5,a2,a6
c0003820:	0105f833          	and	a6,a1,a6
c0003824:	010787b3          	add	a5,a5,a6
c0003828:	fffff937          	lui	s2,0xfffff
c000382c:	00c7d793          	srli	a5,a5,0xc
c0003830:	0125f5b3          	and	a1,a1,s2
c0003834:	0126f6b3          	and	a3,a3,s2
c0003838:	04078863          	beqz	a5,c0003888 <boot_map_segment+0xa4>
c000383c:	00c79793          	slli	a5,a5,0xc
c0003840:	00100b13          	li	s6,1
c0003844:	00050a93          	mv	s5,a0
c0003848:	00058413          	mv	s0,a1
c000384c:	00b784b3          	add	s1,a5,a1
c0003850:	40b68933          	sub	s2,a3,a1
c0003854:	01676a33          	or	s4,a4,s6
c0003858:	000b0613          	mv	a2,s6
c000385c:	00040593          	mv	a1,s0
c0003860:	000a8513          	mv	a0,s5
c0003864:	e1dff0ef          	jal	ra,c0003680 <get_pte>
c0003868:	008907b3          	add	a5,s2,s0
c000386c:	04050263          	beqz	a0,c00038b0 <boot_map_segment+0xcc>
c0003870:	00c7d793          	srli	a5,a5,0xc
c0003874:	00a79793          	slli	a5,a5,0xa
c0003878:	0147e7b3          	or	a5,a5,s4
c000387c:	00f52023          	sw	a5,0(a0)
c0003880:	01340433          	add	s0,s0,s3
c0003884:	fc849ae3          	bne	s1,s0,c0003858 <boot_map_segment+0x74>
c0003888:	01c12083          	lw	ra,28(sp)
c000388c:	01812403          	lw	s0,24(sp)
c0003890:	01412483          	lw	s1,20(sp)
c0003894:	01012903          	lw	s2,16(sp)
c0003898:	00c12983          	lw	s3,12(sp)
c000389c:	00812a03          	lw	s4,8(sp)
c00038a0:	00412a83          	lw	s5,4(sp)
c00038a4:	00012b03          	lw	s6,0(sp)
c00038a8:	02010113          	addi	sp,sp,32
c00038ac:	00008067          	ret
c00038b0:	00003697          	auipc	a3,0x3
c00038b4:	1d868693          	addi	a3,a3,472 # c0006a88 <default_pmm_manager+0x48>
c00038b8:	00002617          	auipc	a2,0x2
c00038bc:	5b060613          	addi	a2,a2,1456 # c0005e68 <commands+0x720>
c00038c0:	0a900593          	li	a1,169
c00038c4:	00003517          	auipc	a0,0x3
c00038c8:	1f850513          	addi	a0,a0,504 # c0006abc <default_pmm_manager+0x7c>
c00038cc:	97dfc0ef          	jal	ra,c0000248 <__panic>
c00038d0:	00003697          	auipc	a3,0x3
c00038d4:	1a068693          	addi	a3,a3,416 # c0006a70 <default_pmm_manager+0x30>
c00038d8:	00002617          	auipc	a2,0x2
c00038dc:	59060613          	addi	a2,a2,1424 # c0005e68 <commands+0x720>
c00038e0:	0a300593          	li	a1,163
c00038e4:	00003517          	auipc	a0,0x3
c00038e8:	1d850513          	addi	a0,a0,472 # c0006abc <default_pmm_manager+0x7c>
c00038ec:	95dfc0ef          	jal	ra,c0000248 <__panic>

c00038f0 <get_page>:
c00038f0:	ff010113          	addi	sp,sp,-16
c00038f4:	00812423          	sw	s0,8(sp)
c00038f8:	00060413          	mv	s0,a2
c00038fc:	00000613          	li	a2,0
c0003900:	00112623          	sw	ra,12(sp)
c0003904:	d7dff0ef          	jal	ra,c0003680 <get_pte>
c0003908:	00040463          	beqz	s0,c0003910 <get_page+0x20>
c000390c:	00a42023          	sw	a0,0(s0)
c0003910:	04050663          	beqz	a0,c000395c <get_page+0x6c>
c0003914:	00052783          	lw	a5,0(a0)
c0003918:	0017f713          	andi	a4,a5,1
c000391c:	04070063          	beqz	a4,c000395c <get_page+0x6c>
c0003920:	00279793          	slli	a5,a5,0x2
c0003924:	00c7d793          	srli	a5,a5,0xc
c0003928:	0000e717          	auipc	a4,0xe
c000392c:	b2072703          	lw	a4,-1248(a4) # c0011448 <npage>
c0003930:	04e7f063          	bleu	a4,a5,c0003970 <get_page+0x80>
c0003934:	fff80537          	lui	a0,0xfff80
c0003938:	00c12083          	lw	ra,12(sp)
c000393c:	00a787b3          	add	a5,a5,a0
c0003940:	00579793          	slli	a5,a5,0x5
c0003944:	0000e517          	auipc	a0,0xe
c0003948:	bd052503          	lw	a0,-1072(a0) # c0011514 <pages>
c000394c:	00f50533          	add	a0,a0,a5
c0003950:	00812403          	lw	s0,8(sp)
c0003954:	01010113          	addi	sp,sp,16
c0003958:	00008067          	ret
c000395c:	00c12083          	lw	ra,12(sp)
c0003960:	00000513          	li	a0,0
c0003964:	00812403          	lw	s0,8(sp)
c0003968:	01010113          	addi	sp,sp,16
c000396c:	00008067          	ret
c0003970:	b81ff0ef          	jal	ra,c00034f0 <pa2page.part.6>

c0003974 <page_remove>:
c0003974:	ff010113          	addi	sp,sp,-16
c0003978:	00000613          	li	a2,0
c000397c:	00112623          	sw	ra,12(sp)
c0003980:	00812423          	sw	s0,8(sp)
c0003984:	cfdff0ef          	jal	ra,c0003680 <get_pte>
c0003988:	00050a63          	beqz	a0,c000399c <page_remove+0x28>
c000398c:	00052783          	lw	a5,0(a0)
c0003990:	00050413          	mv	s0,a0
c0003994:	0017f713          	andi	a4,a5,1
c0003998:	00071a63          	bnez	a4,c00039ac <page_remove+0x38>
c000399c:	00c12083          	lw	ra,12(sp)
c00039a0:	00812403          	lw	s0,8(sp)
c00039a4:	01010113          	addi	sp,sp,16
c00039a8:	00008067          	ret
c00039ac:	00279793          	slli	a5,a5,0x2
c00039b0:	00c7d793          	srli	a5,a5,0xc
c00039b4:	0000e717          	auipc	a4,0xe
c00039b8:	a9472703          	lw	a4,-1388(a4) # c0011448 <npage>
c00039bc:	04e7f863          	bleu	a4,a5,c0003a0c <page_remove+0x98>
c00039c0:	fff80537          	lui	a0,0xfff80
c00039c4:	00a787b3          	add	a5,a5,a0
c00039c8:	00579793          	slli	a5,a5,0x5
c00039cc:	0000e517          	auipc	a0,0xe
c00039d0:	b4852503          	lw	a0,-1208(a0) # c0011514 <pages>
c00039d4:	00f50533          	add	a0,a0,a5
c00039d8:	00052783          	lw	a5,0(a0)
c00039dc:	fff78793          	addi	a5,a5,-1
c00039e0:	00f52023          	sw	a5,0(a0)
c00039e4:	00078e63          	beqz	a5,c0003a00 <page_remove+0x8c>
c00039e8:	00042023          	sw	zero,0(s0)
c00039ec:	10400073          	sfence.vm
c00039f0:	00c12083          	lw	ra,12(sp)
c00039f4:	00812403          	lw	s0,8(sp)
c00039f8:	01010113          	addi	sp,sp,16
c00039fc:	00008067          	ret
c0003a00:	00100593          	li	a1,1
c0003a04:	bc1ff0ef          	jal	ra,c00035c4 <free_pages>
c0003a08:	fe1ff06f          	j	c00039e8 <page_remove+0x74>
c0003a0c:	ae5ff0ef          	jal	ra,c00034f0 <pa2page.part.6>

c0003a10 <page_insert>:
c0003a10:	ff010113          	addi	sp,sp,-16
c0003a14:	00060793          	mv	a5,a2
c0003a18:	00812423          	sw	s0,8(sp)
c0003a1c:	00100613          	li	a2,1
c0003a20:	00058413          	mv	s0,a1
c0003a24:	00078593          	mv	a1,a5
c0003a28:	01212023          	sw	s2,0(sp)
c0003a2c:	00112623          	sw	ra,12(sp)
c0003a30:	00912223          	sw	s1,4(sp)
c0003a34:	00068913          	mv	s2,a3
c0003a38:	c49ff0ef          	jal	ra,c0003680 <get_pte>
c0003a3c:	0c050863          	beqz	a0,c0003b0c <page_insert+0xfc>
c0003a40:	00042703          	lw	a4,0(s0)
c0003a44:	00050493          	mv	s1,a0
c0003a48:	00170793          	addi	a5,a4,1
c0003a4c:	00f42023          	sw	a5,0(s0)
c0003a50:	00052783          	lw	a5,0(a0)
c0003a54:	0017f693          	andi	a3,a5,1
c0003a58:	04069663          	bnez	a3,c0003aa4 <page_insert+0x94>
c0003a5c:	0000e697          	auipc	a3,0xe
c0003a60:	ab86a683          	lw	a3,-1352(a3) # c0011514 <pages>
c0003a64:	40d40433          	sub	s0,s0,a3
c0003a68:	40545413          	srai	s0,s0,0x5
c0003a6c:	000806b7          	lui	a3,0x80
c0003a70:	00d40433          	add	s0,s0,a3
c0003a74:	00a41413          	slli	s0,s0,0xa
c0003a78:	00196693          	ori	a3,s2,1
c0003a7c:	00d466b3          	or	a3,s0,a3
c0003a80:	00d4a023          	sw	a3,0(s1)
c0003a84:	10400073          	sfence.vm
c0003a88:	00000513          	li	a0,0
c0003a8c:	00c12083          	lw	ra,12(sp)
c0003a90:	00812403          	lw	s0,8(sp)
c0003a94:	00412483          	lw	s1,4(sp)
c0003a98:	00012903          	lw	s2,0(sp)
c0003a9c:	01010113          	addi	sp,sp,16
c0003aa0:	00008067          	ret
c0003aa4:	00279793          	slli	a5,a5,0x2
c0003aa8:	00c7d793          	srli	a5,a5,0xc
c0003aac:	0000e697          	auipc	a3,0xe
c0003ab0:	99c6a683          	lw	a3,-1636(a3) # c0011448 <npage>
c0003ab4:	06d7f063          	bleu	a3,a5,c0003b14 <page_insert+0x104>
c0003ab8:	fff80537          	lui	a0,0xfff80
c0003abc:	00a78533          	add	a0,a5,a0
c0003ac0:	0000e697          	auipc	a3,0xe
c0003ac4:	a546a683          	lw	a3,-1452(a3) # c0011514 <pages>
c0003ac8:	00551513          	slli	a0,a0,0x5
c0003acc:	00a68533          	add	a0,a3,a0
c0003ad0:	00a40e63          	beq	s0,a0,c0003aec <page_insert+0xdc>
c0003ad4:	00052783          	lw	a5,0(a0) # fff80000 <sbi_remote_fence_i+0xfff80710>
c0003ad8:	fff78793          	addi	a5,a5,-1
c0003adc:	00f52023          	sw	a5,0(a0)
c0003ae0:	00078a63          	beqz	a5,c0003af4 <page_insert+0xe4>
c0003ae4:	10400073          	sfence.vm
c0003ae8:	f7dff06f          	j	c0003a64 <page_insert+0x54>
c0003aec:	00e42023          	sw	a4,0(s0)
c0003af0:	f75ff06f          	j	c0003a64 <page_insert+0x54>
c0003af4:	00100593          	li	a1,1
c0003af8:	acdff0ef          	jal	ra,c00035c4 <free_pages>
c0003afc:	0000e697          	auipc	a3,0xe
c0003b00:	a186a683          	lw	a3,-1512(a3) # c0011514 <pages>
c0003b04:	10400073          	sfence.vm
c0003b08:	f5dff06f          	j	c0003a64 <page_insert+0x54>
c0003b0c:	ffc00513          	li	a0,-4
c0003b10:	f7dff06f          	j	c0003a8c <page_insert+0x7c>
c0003b14:	9ddff0ef          	jal	ra,c00034f0 <pa2page.part.6>

c0003b18 <tlb_invalidate>:
c0003b18:	10400073          	sfence.vm
c0003b1c:	00008067          	ret

c0003b20 <pgdir_alloc_page>:
c0003b20:	fe010113          	addi	sp,sp,-32
c0003b24:	01212823          	sw	s2,16(sp)
c0003b28:	00050913          	mv	s2,a0
c0003b2c:	00100513          	li	a0,1
c0003b30:	00812c23          	sw	s0,24(sp)
c0003b34:	00912a23          	sw	s1,20(sp)
c0003b38:	01312623          	sw	s3,12(sp)
c0003b3c:	00112e23          	sw	ra,28(sp)
c0003b40:	00058493          	mv	s1,a1
c0003b44:	00060993          	mv	s3,a2
c0003b48:	9c9ff0ef          	jal	ra,c0003510 <alloc_pages>
c0003b4c:	00050413          	mv	s0,a0
c0003b50:	02050463          	beqz	a0,c0003b78 <pgdir_alloc_page+0x58>
c0003b54:	00050593          	mv	a1,a0
c0003b58:	00098693          	mv	a3,s3
c0003b5c:	00048613          	mv	a2,s1
c0003b60:	00090513          	mv	a0,s2
c0003b64:	eadff0ef          	jal	ra,c0003a10 <page_insert>
c0003b68:	06051c63          	bnez	a0,c0003be0 <pgdir_alloc_page+0xc0>
c0003b6c:	0000e797          	auipc	a5,0xe
c0003b70:	8d47a783          	lw	a5,-1836(a5) # c0011440 <swap_init_ok>
c0003b74:	02079263          	bnez	a5,c0003b98 <pgdir_alloc_page+0x78>
c0003b78:	01c12083          	lw	ra,28(sp)
c0003b7c:	00040513          	mv	a0,s0
c0003b80:	01412483          	lw	s1,20(sp)
c0003b84:	01812403          	lw	s0,24(sp)
c0003b88:	01012903          	lw	s2,16(sp)
c0003b8c:	00c12983          	lw	s3,12(sp)
c0003b90:	02010113          	addi	sp,sp,32
c0003b94:	00008067          	ret
c0003b98:	00000693          	li	a3,0
c0003b9c:	00040613          	mv	a2,s0
c0003ba0:	00048593          	mv	a1,s1
c0003ba4:	0000e517          	auipc	a0,0xe
c0003ba8:	8b052503          	lw	a0,-1872(a0) # c0011454 <check_mm_struct>
c0003bac:	8e9fe0ef          	jal	ra,c0002494 <swap_map_swappable>
c0003bb0:	00042703          	lw	a4,0(s0)
c0003bb4:	00942e23          	sw	s1,28(s0)
c0003bb8:	00100793          	li	a5,1
c0003bbc:	faf70ee3          	beq	a4,a5,c0003b78 <pgdir_alloc_page+0x58>
c0003bc0:	00003697          	auipc	a3,0x3
c0003bc4:	f4468693          	addi	a3,a3,-188 # c0006b04 <default_pmm_manager+0xc4>
c0003bc8:	00002617          	auipc	a2,0x2
c0003bcc:	2a060613          	addi	a2,a2,672 # c0005e68 <commands+0x720>
c0003bd0:	19200593          	li	a1,402
c0003bd4:	00003517          	auipc	a0,0x3
c0003bd8:	ee850513          	addi	a0,a0,-280 # c0006abc <default_pmm_manager+0x7c>
c0003bdc:	e6cfc0ef          	jal	ra,c0000248 <__panic>
c0003be0:	00040513          	mv	a0,s0
c0003be4:	00100593          	li	a1,1
c0003be8:	9ddff0ef          	jal	ra,c00035c4 <free_pages>
c0003bec:	00000413          	li	s0,0
c0003bf0:	f89ff06f          	j	c0003b78 <pgdir_alloc_page+0x58>

c0003bf4 <print_pgdir>:
c0003bf4:	fa010113          	addi	sp,sp,-96
c0003bf8:	00003517          	auipc	a0,0x3
c0003bfc:	47c50513          	addi	a0,a0,1148 # c0007074 <default_pmm_manager+0x634>
c0003c00:	05212823          	sw	s2,80(sp)
c0003c04:	04112e23          	sw	ra,92(sp)
c0003c08:	04812c23          	sw	s0,88(sp)
c0003c0c:	04912a23          	sw	s1,84(sp)
c0003c10:	05312623          	sw	s3,76(sp)
c0003c14:	05412423          	sw	s4,72(sp)
c0003c18:	05512223          	sw	s5,68(sp)
c0003c1c:	05612023          	sw	s6,64(sp)
c0003c20:	03712e23          	sw	s7,60(sp)
c0003c24:	03812c23          	sw	s8,56(sp)
c0003c28:	03912a23          	sw	s9,52(sp)
c0003c2c:	03a12823          	sw	s10,48(sp)
c0003c30:	03b12623          	sw	s11,44(sp)
c0003c34:	ca0fc0ef          	jal	ra,c00000d4 <cprintf>
c0003c38:	00000593          	li	a1,0
c0003c3c:	00012a23          	sw	zero,20(sp)
c0003c40:	02d00913          	li	s2,45
c0003c44:	01410713          	addi	a4,sp,20
c0003c48:	01010693          	addi	a3,sp,16
c0003c4c:	fafec637          	lui	a2,0xfafec
c0003c50:	40000513          	li	a0,1024
c0003c54:	ff0ff0ef          	jal	ra,c0003444 <get_pgtable_items.isra.4.part.5>
c0003c58:	00050413          	mv	s0,a0
c0003c5c:	08050263          	beqz	a0,c0003ce0 <print_pgdir+0xec>
c0003c60:	01412583          	lw	a1,20(sp)
c0003c64:	01012783          	lw	a5,16(sp)
c0003c68:	01047513          	andi	a0,s0,16
c0003c6c:	01659693          	slli	a3,a1,0x16
c0003c70:	40f585b3          	sub	a1,a1,a5
c0003c74:	01679613          	slli	a2,a5,0x16
c0003c78:	01659713          	slli	a4,a1,0x16
c0003c7c:	00090313          	mv	t1,s2
c0003c80:	00050463          	beqz	a0,c0003c88 <print_pgdir+0x94>
c0003c84:	07500313          	li	t1,117
c0003c88:	0000db17          	auipc	s6,0xd
c0003c8c:	7c4b0b13          	addi	s6,s6,1988 # c001144c <str.1568>
c0003c90:	07200793          	li	a5,114
c0003c94:	006b0023          	sb	t1,0(s6)
c0003c98:	00fb00a3          	sb	a5,1(s6)
c0003c9c:	00447793          	andi	a5,s0,4
c0003ca0:	00090313          	mv	t1,s2
c0003ca4:	00078463          	beqz	a5,c0003cac <print_pgdir+0xb8>
c0003ca8:	07700313          	li	t1,119
c0003cac:	0000d797          	auipc	a5,0xd
c0003cb0:	7a078793          	addi	a5,a5,1952 # c001144c <str.1568>
c0003cb4:	00003517          	auipc	a0,0x3
c0003cb8:	3f450513          	addi	a0,a0,1012 # c00070a8 <default_pmm_manager+0x668>
c0003cbc:	006b0123          	sb	t1,2(s6)
c0003cc0:	000b01a3          	sb	zero,3(s6)
c0003cc4:	c10fc0ef          	jal	ra,c00000d4 <cprintf>
c0003cc8:	00f47413          	andi	s0,s0,15
c0003ccc:	00100793          	li	a5,1
c0003cd0:	04f40c63          	beq	s0,a5,c0003d28 <print_pgdir+0x134>
c0003cd4:	01412583          	lw	a1,20(sp)
c0003cd8:	3ff00793          	li	a5,1023
c0003cdc:	f6b7f4e3          	bleu	a1,a5,c0003c44 <print_pgdir+0x50>
c0003ce0:	00003517          	auipc	a0,0x3
c0003ce4:	40c50513          	addi	a0,a0,1036 # c00070ec <default_pmm_manager+0x6ac>
c0003ce8:	becfc0ef          	jal	ra,c00000d4 <cprintf>
c0003cec:	05c12083          	lw	ra,92(sp)
c0003cf0:	05812403          	lw	s0,88(sp)
c0003cf4:	05412483          	lw	s1,84(sp)
c0003cf8:	05012903          	lw	s2,80(sp)
c0003cfc:	04c12983          	lw	s3,76(sp)
c0003d00:	04812a03          	lw	s4,72(sp)
c0003d04:	04412a83          	lw	s5,68(sp)
c0003d08:	04012b03          	lw	s6,64(sp)
c0003d0c:	03c12b83          	lw	s7,60(sp)
c0003d10:	03812c03          	lw	s8,56(sp)
c0003d14:	03412c83          	lw	s9,52(sp)
c0003d18:	03012d03          	lw	s10,48(sp)
c0003d1c:	02c12d83          	lw	s11,44(sp)
c0003d20:	06010113          	addi	sp,sp,96
c0003d24:	00008067          	ret
c0003d28:	01012783          	lw	a5,16(sp)
c0003d2c:	00000413          	li	s0,0
c0003d30:	00a79c93          	slli	s9,a5,0xa
c0003d34:	00c79313          	slli	t1,a5,0xc
c0003d38:	00279d93          	slli	s11,a5,0x2
c0003d3c:	00f12623          	sw	a5,12(sp)
c0003d40:	fafec7b7          	lui	a5,0xfafec
c0003d44:	01912e23          	sw	s9,28(sp)
c0003d48:	40600ab3          	neg	s5,t1
c0003d4c:	400c8c93          	addi	s9,s9,1024
c0003d50:	00fd8db3          	add	s11,s11,a5
c0003d54:	0140006f          	j	c0003d68 <print_pgdir+0x174>
c0003d58:	fffff7b7          	lui	a5,0xfffff
c0003d5c:	00fa8ab3          	add	s5,s5,a5
c0003d60:	400c8c93          	addi	s9,s9,1024
c0003d64:	004d8d93          	addi	s11,s11,4
c0003d68:	01412583          	lw	a1,20(sp)
c0003d6c:	00c12783          	lw	a5,12(sp)
c0003d70:	10b7fa63          	bleu	a1,a5,c0003e84 <print_pgdir+0x290>
c0003d74:	00178793          	addi	a5,a5,1 # fffff001 <sbi_remote_fence_i+0xfffff711>
c0003d78:	00f12623          	sw	a5,12(sp)
c0003d7c:	000da783          	lw	a5,0(s11)
c0003d80:	fffff4b7          	lui	s1,0xfffff
c0003d84:	0000d717          	auipc	a4,0xd
c0003d88:	6c472703          	lw	a4,1732(a4) # c0011448 <npage>
c0003d8c:	00279793          	slli	a5,a5,0x2
c0003d90:	0097f7b3          	and	a5,a5,s1
c0003d94:	00c7d693          	srli	a3,a5,0xc
c0003d98:	01c12583          	lw	a1,28(sp)
c0003d9c:	07700a13          	li	s4,119
c0003da0:	0000d997          	auipc	s3,0xd
c0003da4:	6ac98993          	addi	s3,s3,1708 # c001144c <str.1568>
c0003da8:	0ae6fc63          	bleu	a4,a3,c0003e60 <print_pgdir+0x26c>
c0003dac:	fb95f6e3          	bleu	s9,a1,c0003d58 <print_pgdir+0x164>
c0003db0:	0000d697          	auipc	a3,0xd
c0003db4:	75c6a683          	lw	a3,1884(a3) # c001150c <va_pa_offset>
c0003db8:	00d787b3          	add	a5,a5,a3
c0003dbc:	01c10713          	addi	a4,sp,28
c0003dc0:	01810693          	addi	a3,sp,24
c0003dc4:	01578633          	add	a2,a5,s5
c0003dc8:	000c8513          	mv	a0,s9
c0003dcc:	e78ff0ef          	jal	ra,c0003444 <get_pgtable_items.isra.4.part.5>
c0003dd0:	00050d13          	mv	s10,a0
c0003dd4:	f80502e3          	beqz	a0,c0003d58 <print_pgdir+0x164>
c0003dd8:	0aa40263          	beq	s0,a0,c0003e7c <print_pgdir+0x288>
c0003ddc:	04040c63          	beqz	s0,c0003e34 <print_pgdir+0x240>
c0003de0:	417c05b3          	sub	a1,s8,s7
c0003de4:	01047793          	andi	a5,s0,16
c0003de8:	00cb9613          	slli	a2,s7,0xc
c0003dec:	00cc1693          	slli	a3,s8,0xc
c0003df0:	00c59713          	slli	a4,a1,0xc
c0003df4:	00090513          	mv	a0,s2
c0003df8:	00078463          	beqz	a5,c0003e00 <print_pgdir+0x20c>
c0003dfc:	07500513          	li	a0,117
c0003e00:	07200793          	li	a5,114
c0003e04:	00ab0023          	sb	a0,0(s6)
c0003e08:	00fb00a3          	sb	a5,1(s6)
c0003e0c:	00447413          	andi	s0,s0,4
c0003e10:	000a0e13          	mv	t3,s4
c0003e14:	00041463          	bnez	s0,c0003e1c <print_pgdir+0x228>
c0003e18:	00090e13          	mv	t3,s2
c0003e1c:	00098793          	mv	a5,s3
c0003e20:	00003517          	auipc	a0,0x3
c0003e24:	2a850513          	addi	a0,a0,680 # c00070c8 <default_pmm_manager+0x688>
c0003e28:	01cb0123          	sb	t3,2(s6)
c0003e2c:	000b01a3          	sb	zero,3(s6)
c0003e30:	aa4fc0ef          	jal	ra,c00000d4 <cprintf>
c0003e34:	01812b83          	lw	s7,24(sp)
c0003e38:	01c12c03          	lw	s8,28(sp)
c0003e3c:	000da783          	lw	a5,0(s11)
c0003e40:	0000d717          	auipc	a4,0xd
c0003e44:	60872703          	lw	a4,1544(a4) # c0011448 <npage>
c0003e48:	000c0593          	mv	a1,s8
c0003e4c:	00279793          	slli	a5,a5,0x2
c0003e50:	0097f7b3          	and	a5,a5,s1
c0003e54:	00c7d693          	srli	a3,a5,0xc
c0003e58:	000d0413          	mv	s0,s10
c0003e5c:	f4e6e8e3          	bltu	a3,a4,c0003dac <print_pgdir+0x1b8>
c0003e60:	00078693          	mv	a3,a5
c0003e64:	00003617          	auipc	a2,0x3
c0003e68:	c3460613          	addi	a2,a2,-972 # c0006a98 <default_pmm_manager+0x58>
c0003e6c:	23a00593          	li	a1,570
c0003e70:	00003517          	auipc	a0,0x3
c0003e74:	c4c50513          	addi	a0,a0,-948 # c0006abc <default_pmm_manager+0x7c>
c0003e78:	bd0fc0ef          	jal	ra,c0000248 <__panic>
c0003e7c:	01c12c03          	lw	s8,28(sp)
c0003e80:	fbdff06f          	j	c0003e3c <print_pgdir+0x248>
c0003e84:	e4040ae3          	beqz	s0,c0003cd8 <print_pgdir+0xe4>
c0003e88:	417c05b3          	sub	a1,s8,s7
c0003e8c:	01047793          	andi	a5,s0,16
c0003e90:	00cb9613          	slli	a2,s7,0xc
c0003e94:	00cc1693          	slli	a3,s8,0xc
c0003e98:	00c59713          	slli	a4,a1,0xc
c0003e9c:	00090513          	mv	a0,s2
c0003ea0:	00078463          	beqz	a5,c0003ea8 <print_pgdir+0x2b4>
c0003ea4:	07500513          	li	a0,117
c0003ea8:	07200793          	li	a5,114
c0003eac:	00ab0023          	sb	a0,0(s6)
c0003eb0:	00fb00a3          	sb	a5,1(s6)
c0003eb4:	00447413          	andi	s0,s0,4
c0003eb8:	00090313          	mv	t1,s2
c0003ebc:	00040463          	beqz	s0,c0003ec4 <print_pgdir+0x2d0>
c0003ec0:	07700313          	li	t1,119
c0003ec4:	0000d797          	auipc	a5,0xd
c0003ec8:	58878793          	addi	a5,a5,1416 # c001144c <str.1568>
c0003ecc:	00003517          	auipc	a0,0x3
c0003ed0:	1fc50513          	addi	a0,a0,508 # c00070c8 <default_pmm_manager+0x688>
c0003ed4:	006b0123          	sb	t1,2(s6)
c0003ed8:	000b01a3          	sb	zero,3(s6)
c0003edc:	9f8fc0ef          	jal	ra,c00000d4 <cprintf>
c0003ee0:	df5ff06f          	j	c0003cd4 <print_pgdir+0xe0>

c0003ee4 <pmm_init>:
c0003ee4:	fe010113          	addi	sp,sp,-32
c0003ee8:	00003597          	auipc	a1,0x3
c0003eec:	b585a583          	lw	a1,-1192(a1) # c0006a40 <default_pmm_manager>
c0003ef0:	00003797          	auipc	a5,0x3
c0003ef4:	b5078793          	addi	a5,a5,-1200 # c0006a40 <default_pmm_manager>
c0003ef8:	00003517          	auipc	a0,0x3
c0003efc:	c2050513          	addi	a0,a0,-992 # c0006b18 <default_pmm_manager+0xd8>
c0003f00:	00112e23          	sw	ra,28(sp)
c0003f04:	00812c23          	sw	s0,24(sp)
c0003f08:	00912a23          	sw	s1,20(sp)
c0003f0c:	01212823          	sw	s2,16(sp)
c0003f10:	0000d297          	auipc	t0,0xd
c0003f14:	5ef2ac23          	sw	a5,1528(t0) # c0011508 <pmm_manager>
c0003f18:	9bcfc0ef          	jal	ra,c00000d4 <cprintf>
c0003f1c:	0000d797          	auipc	a5,0xd
c0003f20:	5ec7a783          	lw	a5,1516(a5) # c0011508 <pmm_manager>
c0003f24:	0047a783          	lw	a5,4(a5)
c0003f28:	000780e7          	jalr	a5
c0003f2c:	3fffc317          	auipc	t1,0x3fffc
c0003f30:	8d4300e7          	jalr	-1836(t1) # fffff800 <sbi_hart_id>
c0003f34:	00410593          	addi	a1,sp,4
c0003f38:	3fffc317          	auipc	t1,0x3fffc
c0003f3c:	8e8300e7          	jalr	-1816(t1) # fffff820 <sbi_query_memory>
c0003f40:	3c051ce3          	bnez	a0,c0004b18 <pmm_init+0xc34>
c0003f44:	00412483          	lw	s1,4(sp)
c0003f48:	00812903          	lw	s2,8(sp)
c0003f4c:	c00007b7          	lui	a5,0xc0000
c0003f50:	409787b3          	sub	a5,a5,s1
c0003f54:	00003517          	auipc	a0,0x3
c0003f58:	c0850513          	addi	a0,a0,-1016 # c0006b5c <default_pmm_manager+0x11c>
c0003f5c:	0000d297          	auipc	t0,0xd
c0003f60:	5af2a823          	sw	a5,1456(t0) # c001150c <va_pa_offset>
c0003f64:	01248433          	add	s0,s1,s2
c0003f68:	96cfc0ef          	jal	ra,c00000d4 <cprintf>
c0003f6c:	00048613          	mv	a2,s1
c0003f70:	fff40693          	addi	a3,s0,-1
c0003f74:	00090593          	mv	a1,s2
c0003f78:	00003517          	auipc	a0,0x3
c0003f7c:	bfc50513          	addi	a0,a0,-1028 # c0006b74 <default_pmm_manager+0x134>
c0003f80:	954fc0ef          	jal	ra,c00000d4 <cprintf>
c0003f84:	f80007b7          	lui	a5,0xf8000
c0003f88:	00040613          	mv	a2,s0
c0003f8c:	0087f463          	bleu	s0,a5,c0003f94 <pmm_init+0xb0>
c0003f90:	00078613          	mv	a2,a5
c0003f94:	fffff737          	lui	a4,0xfffff
c0003f98:	0000e797          	auipc	a5,0xe
c0003f9c:	57f78793          	addi	a5,a5,1407 # c0012517 <end+0xfff>
c0003fa0:	00c65613          	srli	a2,a2,0xc
c0003fa4:	00e7f7b3          	and	a5,a5,a4
c0003fa8:	0000d297          	auipc	t0,0xd
c0003fac:	4ac2a023          	sw	a2,1184(t0) # c0011448 <npage>
c0003fb0:	0000d297          	auipc	t0,0xd
c0003fb4:	56f2a223          	sw	a5,1380(t0) # c0011514 <pages>
c0003fb8:	000805b7          	lui	a1,0x80
c0003fbc:	68b60463          	beq	a2,a1,c0004644 <pmm_init+0x760>
c0003fc0:	00060813          	mv	a6,a2
c0003fc4:	00000713          	li	a4,0
c0003fc8:	00078513          	mv	a0,a5
c0003fcc:	00100893          	li	a7,1
c0003fd0:	40b605b3          	sub	a1,a2,a1
c0003fd4:	0080006f          	j	c0003fdc <pmm_init+0xf8>
c0003fd8:	00050793          	mv	a5,a0
c0003fdc:	00571693          	slli	a3,a4,0x5
c0003fe0:	00d787b3          	add	a5,a5,a3
c0003fe4:	00478793          	addi	a5,a5,4
c0003fe8:	4117a02f          	amoor.w	zero,a7,(a5)
c0003fec:	00170713          	addi	a4,a4,1 # fffff001 <sbi_remote_fence_i+0xfffff711>
c0003ff0:	00080613          	mv	a2,a6
c0003ff4:	feb762e3          	bltu	a4,a1,c0003fd8 <pmm_init+0xf4>
c0003ff8:	07f806b7          	lui	a3,0x7f80
c0003ffc:	00d606b3          	add	a3,a2,a3
c0004000:	00569693          	slli	a3,a3,0x5
c0004004:	00d506b3          	add	a3,a0,a3
c0004008:	c00007b7          	lui	a5,0xc0000
c000400c:	6af6ee63          	bltu	a3,a5,c00046c8 <pmm_init+0x7e4>
c0004010:	fffff737          	lui	a4,0xfffff
c0004014:	0000d797          	auipc	a5,0xd
c0004018:	4f87a783          	lw	a5,1272(a5) # c001150c <va_pa_offset>
c000401c:	40f686b3          	sub	a3,a3,a5
c0004020:	00e47433          	and	s0,s0,a4
c0004024:	0486f263          	bleu	s0,a3,c0004068 <pmm_init+0x184>
c0004028:	000017b7          	lui	a5,0x1
c000402c:	fff78793          	addi	a5,a5,-1 # fff <BASE_ADDRESS-0xbffff001>
c0004030:	00f686b3          	add	a3,a3,a5
c0004034:	00c6d793          	srli	a5,a3,0xc
c0004038:	0ac7f2e3          	bleu	a2,a5,c00048dc <pmm_init+0x9f8>
c000403c:	00e6f6b3          	and	a3,a3,a4
c0004040:	fff80737          	lui	a4,0xfff80
c0004044:	00e787b3          	add	a5,a5,a4
c0004048:	0000d717          	auipc	a4,0xd
c000404c:	4c072703          	lw	a4,1216(a4) # c0011508 <pmm_manager>
c0004050:	00872703          	lw	a4,8(a4)
c0004054:	40d406b3          	sub	a3,s0,a3
c0004058:	00579793          	slli	a5,a5,0x5
c000405c:	00c6d593          	srli	a1,a3,0xc
c0004060:	00f50533          	add	a0,a0,a5
c0004064:	000700e7          	jalr	a4
c0004068:	0000d797          	auipc	a5,0xd
c000406c:	4a07a783          	lw	a5,1184(a5) # c0011508 <pmm_manager>
c0004070:	0187a783          	lw	a5,24(a5)
c0004074:	000780e7          	jalr	a5
c0004078:	00003517          	auipc	a0,0x3
c000407c:	b4850513          	addi	a0,a0,-1208 # c0006bc0 <default_pmm_manager+0x180>
c0004080:	854fc0ef          	jal	ra,c00000d4 <cprintf>
c0004084:	00100513          	li	a0,1
c0004088:	c88ff0ef          	jal	ra,c0003510 <alloc_pages>
c000408c:	080506e3          	beqz	a0,c0004918 <pmm_init+0xa34>
c0004090:	0000d797          	auipc	a5,0xd
c0004094:	4847a783          	lw	a5,1156(a5) # c0011514 <pages>
c0004098:	40f507b3          	sub	a5,a0,a5
c000409c:	00080737          	lui	a4,0x80
c00040a0:	4057d793          	srai	a5,a5,0x5
c00040a4:	00e787b3          	add	a5,a5,a4
c00040a8:	00100737          	lui	a4,0x100
c00040ac:	fff70713          	addi	a4,a4,-1 # fffff <BASE_ADDRESS-0xbff00001>
c00040b0:	00e7f733          	and	a4,a5,a4
c00040b4:	0000d697          	auipc	a3,0xd
c00040b8:	3946a683          	lw	a3,916(a3) # c0011448 <npage>
c00040bc:	00c79793          	slli	a5,a5,0xc
c00040c0:	02d77ee3          	bleu	a3,a4,c00048fc <pmm_init+0xa18>
c00040c4:	0000d717          	auipc	a4,0xd
c00040c8:	44872703          	lw	a4,1096(a4) # c001150c <va_pa_offset>
c00040cc:	00e787b3          	add	a5,a5,a4
c00040d0:	00078513          	mv	a0,a5
c00040d4:	00001637          	lui	a2,0x1
c00040d8:	00000593          	li	a1,0
c00040dc:	0000d297          	auipc	t0,0xd
c00040e0:	36f2a423          	sw	a5,872(t0) # c0011444 <boot_pgdir>
c00040e4:	70d000ef          	jal	ra,c0004ff0 <memset>
c00040e8:	0000d517          	auipc	a0,0xd
c00040ec:	35c52503          	lw	a0,860(a0) # c0011444 <boot_pgdir>
c00040f0:	c00007b7          	lui	a5,0xc0000
c00040f4:	7ef56663          	bltu	a0,a5,c00048e0 <pmm_init+0x9fc>
c00040f8:	0000d797          	auipc	a5,0xd
c00040fc:	4147a783          	lw	a5,1044(a5) # c001150c <va_pa_offset>
c0004100:	40f507b3          	sub	a5,a0,a5
c0004104:	0000d297          	auipc	t0,0xd
c0004108:	40f2a623          	sw	a5,1036(t0) # c0011510 <boot_cr3>
c000410c:	0000d717          	auipc	a4,0xd
c0004110:	33c72703          	lw	a4,828(a4) # c0011448 <npage>
c0004114:	000f87b7          	lui	a5,0xf8
c0004118:	26e7ece3          	bltu	a5,a4,c0004b90 <pmm_init+0xcac>
c000411c:	7a050063          	beqz	a0,c00048bc <pmm_init+0x9d8>
c0004120:	01451793          	slli	a5,a0,0x14
c0004124:	78079c63          	bnez	a5,c00048bc <pmm_init+0x9d8>
c0004128:	00000613          	li	a2,0
c000412c:	00000593          	li	a1,0
c0004130:	fc0ff0ef          	jal	ra,c00038f0 <get_page>
c0004134:	76051463          	bnez	a0,c000489c <pmm_init+0x9b8>
c0004138:	00100513          	li	a0,1
c000413c:	bd4ff0ef          	jal	ra,c0003510 <alloc_pages>
c0004140:	00050493          	mv	s1,a0
c0004144:	00050593          	mv	a1,a0
c0004148:	00000693          	li	a3,0
c000414c:	00000613          	li	a2,0
c0004150:	0000d517          	auipc	a0,0xd
c0004154:	2f452503          	lw	a0,756(a0) # c0011444 <boot_pgdir>
c0004158:	8b9ff0ef          	jal	ra,c0003a10 <page_insert>
c000415c:	72051063          	bnez	a0,c000487c <pmm_init+0x998>
c0004160:	00000613          	li	a2,0
c0004164:	00000593          	li	a1,0
c0004168:	0000d517          	auipc	a0,0xd
c000416c:	2dc52503          	lw	a0,732(a0) # c0011444 <boot_pgdir>
c0004170:	d10ff0ef          	jal	ra,c0003680 <get_pte>
c0004174:	020506e3          	beqz	a0,c00049a0 <pmm_init+0xabc>
c0004178:	00052783          	lw	a5,0(a0)
c000417c:	0017f713          	andi	a4,a5,1
c0004180:	000704e3          	beqz	a4,c0004988 <pmm_init+0xaa4>
c0004184:	00279793          	slli	a5,a5,0x2
c0004188:	00c7d793          	srli	a5,a5,0xc
c000418c:	0000d617          	auipc	a2,0xd
c0004190:	2bc62603          	lw	a2,700(a2) # c0011448 <npage>
c0004194:	74c7f463          	bleu	a2,a5,c00048dc <pmm_init+0x9f8>
c0004198:	fff80737          	lui	a4,0xfff80
c000419c:	00e787b3          	add	a5,a5,a4
c00041a0:	00579793          	slli	a5,a5,0x5
c00041a4:	0000d717          	auipc	a4,0xd
c00041a8:	37072703          	lw	a4,880(a4) # c0011514 <pages>
c00041ac:	00f707b3          	add	a5,a4,a5
c00041b0:	7af49c63          	bne	s1,a5,c0004968 <pmm_init+0xa84>
c00041b4:	0004a903          	lw	s2,0(s1) # fffff000 <sbi_remote_fence_i+0xfffff710>
c00041b8:	00100793          	li	a5,1
c00041bc:	78f91663          	bne	s2,a5,c0004948 <pmm_init+0xa64>
c00041c0:	0000d517          	auipc	a0,0xd
c00041c4:	28452503          	lw	a0,644(a0) # c0011444 <boot_pgdir>
c00041c8:	00052683          	lw	a3,0(a0)
c00041cc:	fffff7b7          	lui	a5,0xfffff
c00041d0:	00269693          	slli	a3,a3,0x2
c00041d4:	00f6f6b3          	and	a3,a3,a5
c00041d8:	00c6d793          	srli	a5,a3,0xc
c00041dc:	74c7fa63          	bleu	a2,a5,c0004930 <pmm_init+0xa4c>
c00041e0:	0000d417          	auipc	s0,0xd
c00041e4:	32c42403          	lw	s0,812(s0) # c001150c <va_pa_offset>
c00041e8:	008686b3          	add	a3,a3,s0
c00041ec:	00000613          	li	a2,0
c00041f0:	000015b7          	lui	a1,0x1
c00041f4:	00468413          	addi	s0,a3,4
c00041f8:	c88ff0ef          	jal	ra,c0003680 <get_pte>
c00041fc:	00a412e3          	bne	s0,a0,c0004a00 <pmm_init+0xb1c>
c0004200:	00090513          	mv	a0,s2
c0004204:	b0cff0ef          	jal	ra,c0003510 <alloc_pages>
c0004208:	00050413          	mv	s0,a0
c000420c:	00050593          	mv	a1,a0
c0004210:	01400693          	li	a3,20
c0004214:	00001637          	lui	a2,0x1
c0004218:	0000d517          	auipc	a0,0xd
c000421c:	22c52503          	lw	a0,556(a0) # c0011444 <boot_pgdir>
c0004220:	ff0ff0ef          	jal	ra,c0003a10 <page_insert>
c0004224:	7a051e63          	bnez	a0,c00049e0 <pmm_init+0xafc>
c0004228:	00000613          	li	a2,0
c000422c:	000015b7          	lui	a1,0x1
c0004230:	0000d517          	auipc	a0,0xd
c0004234:	21452503          	lw	a0,532(a0) # c0011444 <boot_pgdir>
c0004238:	c48ff0ef          	jal	ra,c0003680 <get_pte>
c000423c:	78050263          	beqz	a0,c00049c0 <pmm_init+0xadc>
c0004240:	00052783          	lw	a5,0(a0)
c0004244:	0107f713          	andi	a4,a5,16
c0004248:	58070a63          	beqz	a4,c00047dc <pmm_init+0x8f8>
c000424c:	0047f793          	andi	a5,a5,4
c0004250:	56078663          	beqz	a5,c00047bc <pmm_init+0x8d8>
c0004254:	0000d517          	auipc	a0,0xd
c0004258:	1f052503          	lw	a0,496(a0) # c0011444 <boot_pgdir>
c000425c:	00052783          	lw	a5,0(a0)
c0004260:	0107f793          	andi	a5,a5,16
c0004264:	52078c63          	beqz	a5,c000479c <pmm_init+0x8b8>
c0004268:	00042903          	lw	s2,0(s0)
c000426c:	00100793          	li	a5,1
c0004270:	50f91663          	bne	s2,a5,c000477c <pmm_init+0x898>
c0004274:	00000693          	li	a3,0
c0004278:	00001637          	lui	a2,0x1
c000427c:	00048593          	mv	a1,s1
c0004280:	f90ff0ef          	jal	ra,c0003a10 <page_insert>
c0004284:	4c051c63          	bnez	a0,c000475c <pmm_init+0x878>
c0004288:	0004a703          	lw	a4,0(s1)
c000428c:	00200793          	li	a5,2
c0004290:	4af71663          	bne	a4,a5,c000473c <pmm_init+0x858>
c0004294:	00042783          	lw	a5,0(s0)
c0004298:	48079263          	bnez	a5,c000471c <pmm_init+0x838>
c000429c:	00000613          	li	a2,0
c00042a0:	000015b7          	lui	a1,0x1
c00042a4:	0000d517          	auipc	a0,0xd
c00042a8:	1a052503          	lw	a0,416(a0) # c0011444 <boot_pgdir>
c00042ac:	bd4ff0ef          	jal	ra,c0003680 <get_pte>
c00042b0:	44050663          	beqz	a0,c00046fc <pmm_init+0x818>
c00042b4:	00052703          	lw	a4,0(a0)
c00042b8:	00177793          	andi	a5,a4,1
c00042bc:	6c078663          	beqz	a5,c0004988 <pmm_init+0xaa4>
c00042c0:	00271793          	slli	a5,a4,0x2
c00042c4:	00c7d793          	srli	a5,a5,0xc
c00042c8:	0000d697          	auipc	a3,0xd
c00042cc:	1806a683          	lw	a3,384(a3) # c0011448 <npage>
c00042d0:	60d7f663          	bleu	a3,a5,c00048dc <pmm_init+0x9f8>
c00042d4:	fff806b7          	lui	a3,0xfff80
c00042d8:	00d787b3          	add	a5,a5,a3
c00042dc:	00579793          	slli	a5,a5,0x5
c00042e0:	0000d697          	auipc	a3,0xd
c00042e4:	2346a683          	lw	a3,564(a3) # c0011514 <pages>
c00042e8:	00f687b3          	add	a5,a3,a5
c00042ec:	56f49863          	bne	s1,a5,c000485c <pmm_init+0x978>
c00042f0:	01077713          	andi	a4,a4,16
c00042f4:	54071463          	bnez	a4,c000483c <pmm_init+0x958>
c00042f8:	00000593          	li	a1,0
c00042fc:	0000d517          	auipc	a0,0xd
c0004300:	14852503          	lw	a0,328(a0) # c0011444 <boot_pgdir>
c0004304:	e70ff0ef          	jal	ra,c0003974 <page_remove>
c0004308:	0004a783          	lw	a5,0(s1)
c000430c:	51279863          	bne	a5,s2,c000481c <pmm_init+0x938>
c0004310:	00042783          	lw	a5,0(s0)
c0004314:	4e079463          	bnez	a5,c00047fc <pmm_init+0x918>
c0004318:	000015b7          	lui	a1,0x1
c000431c:	0000d517          	auipc	a0,0xd
c0004320:	12852503          	lw	a0,296(a0) # c0011444 <boot_pgdir>
c0004324:	e50ff0ef          	jal	ra,c0003974 <page_remove>
c0004328:	0004a783          	lw	a5,0(s1)
c000432c:	36079e63          	bnez	a5,c00046a8 <pmm_init+0x7c4>
c0004330:	00042783          	lw	a5,0(s0)
c0004334:	7c079263          	bnez	a5,c0004af8 <pmm_init+0xc14>
c0004338:	0000d797          	auipc	a5,0xd
c000433c:	10c7a783          	lw	a5,268(a5) # c0011444 <boot_pgdir>
c0004340:	0007a783          	lw	a5,0(a5)
c0004344:	0000d717          	auipc	a4,0xd
c0004348:	10472703          	lw	a4,260(a4) # c0011448 <npage>
c000434c:	00279793          	slli	a5,a5,0x2
c0004350:	00c7d793          	srli	a5,a5,0xc
c0004354:	58e7f463          	bleu	a4,a5,c00048dc <pmm_init+0x9f8>
c0004358:	fff80737          	lui	a4,0xfff80
c000435c:	00e787b3          	add	a5,a5,a4
c0004360:	00579793          	slli	a5,a5,0x5
c0004364:	0000d517          	auipc	a0,0xd
c0004368:	1b052503          	lw	a0,432(a0) # c0011514 <pages>
c000436c:	00f50533          	add	a0,a0,a5
c0004370:	00052583          	lw	a1,0(a0)
c0004374:	00100793          	li	a5,1
c0004378:	76f59063          	bne	a1,a5,c0004ad8 <pmm_init+0xbf4>
c000437c:	a48ff0ef          	jal	ra,c00035c4 <free_pages>
c0004380:	0000d797          	auipc	a5,0xd
c0004384:	0c47a783          	lw	a5,196(a5) # c0011444 <boot_pgdir>
c0004388:	0007a023          	sw	zero,0(a5)
c000438c:	00003517          	auipc	a0,0x3
c0004390:	af850513          	addi	a0,a0,-1288 # c0006e84 <default_pmm_manager+0x444>
c0004394:	d41fb0ef          	jal	ra,c00000d4 <cprintf>
c0004398:	0000d797          	auipc	a5,0xd
c000439c:	1787a783          	lw	a5,376(a5) # c0011510 <boot_cr3>
c00043a0:	00c7d793          	srli	a5,a5,0xc
c00043a4:	0000d517          	auipc	a0,0xd
c00043a8:	0a052503          	lw	a0,160(a0) # c0011444 <boot_pgdir>
c00043ac:	00a79793          	slli	a5,a5,0xa
c00043b0:	00001437          	lui	s0,0x1
c00043b4:	00850733          	add	a4,a0,s0
c00043b8:	0017e693          	ori	a3,a5,1
c00043bc:	c00005b7          	lui	a1,0xc0000
c00043c0:	0077e793          	ori	a5,a5,7
c00043c4:	fad72623          	sw	a3,-84(a4) # fff7ffac <sbi_remote_fence_i+0xfff806bc>
c00043c8:	0000d697          	auipc	a3,0xd
c00043cc:	1446a683          	lw	a3,324(a3) # c001150c <va_pa_offset>
c00043d0:	faf72823          	sw	a5,-80(a4)
c00043d4:	40d586b3          	sub	a3,a1,a3
c00043d8:	00f00713          	li	a4,15
c00043dc:	38000637          	lui	a2,0x38000
c00043e0:	c04ff0ef          	jal	ra,c00037e4 <boot_map_segment>
c00043e4:	180027f3          	csrr	a5,sptbr
c00043e8:	00100737          	lui	a4,0x100
c00043ec:	fff70713          	addi	a4,a4,-1 # fffff <BASE_ADDRESS-0xbff00001>
c00043f0:	00e7f733          	and	a4,a5,a4
c00043f4:	0000d697          	auipc	a3,0xd
c00043f8:	0546a683          	lw	a3,84(a3) # c0011448 <npage>
c00043fc:	00c79793          	slli	a5,a5,0xc
c0004400:	2ed77063          	bleu	a3,a4,c00046e0 <pmm_init+0x7fc>
c0004404:	0000d517          	auipc	a0,0xd
c0004408:	10852503          	lw	a0,264(a0) # c001150c <va_pa_offset>
c000440c:	00a78533          	add	a0,a5,a0
c0004410:	00000613          	li	a2,0
c0004414:	fff00593          	li	a1,-1
c0004418:	a68ff0ef          	jal	ra,c0003680 <get_pte>
c000441c:	00052683          	lw	a3,0(a0)
c0004420:	fffff4b7          	lui	s1,0xfffff
c0004424:	00b00713          	li	a4,11
c0004428:	00269693          	slli	a3,a3,0x2
c000442c:	0096f6b3          	and	a3,a3,s1
c0004430:	00040613          	mv	a2,s0
c0004434:	00048593          	mv	a1,s1
c0004438:	0000d517          	auipc	a0,0xd
c000443c:	00c52503          	lw	a0,12(a0) # c0011444 <boot_pgdir>
c0004440:	ba4ff0ef          	jal	ra,c00037e4 <boot_map_segment>
c0004444:	0000d797          	auipc	a5,0xd
c0004448:	0cc7a783          	lw	a5,204(a5) # c0011510 <boot_cr3>
c000444c:	00c7d793          	srli	a5,a5,0xc
c0004450:	18079073          	csrw	sptbr,a5
c0004454:	0000d797          	auipc	a5,0xd
c0004458:	ff47a783          	lw	a5,-12(a5) # c0011448 <npage>
c000445c:	000c0437          	lui	s0,0xc0
c0004460:	0000d517          	auipc	a0,0xd
c0004464:	fe452503          	lw	a0,-28(a0) # c0011444 <boot_pgdir>
c0004468:	00f46c63          	bltu	s0,a5,c0004480 <pmm_init+0x59c>
c000446c:	04c0006f          	j	c00044b8 <pmm_init+0x5d4>
c0004470:	00c45793          	srli	a5,s0,0xc
c0004474:	0000d517          	auipc	a0,0xd
c0004478:	fd052503          	lw	a0,-48(a0) # c0011444 <boot_pgdir>
c000447c:	1ee7f863          	bleu	a4,a5,c000466c <pmm_init+0x788>
c0004480:	0000d597          	auipc	a1,0xd
c0004484:	08c5a583          	lw	a1,140(a1) # c001150c <va_pa_offset>
c0004488:	00000613          	li	a2,0
c000448c:	00b405b3          	add	a1,s0,a1
c0004490:	9f0ff0ef          	jal	ra,c0003680 <get_pte>
c0004494:	1a050c63          	beqz	a0,c000464c <pmm_init+0x768>
c0004498:	00052783          	lw	a5,0(a0)
c000449c:	00279793          	slli	a5,a5,0x2
c00044a0:	0097f7b3          	and	a5,a5,s1
c00044a4:	1e879263          	bne	a5,s0,c0004688 <pmm_init+0x7a4>
c00044a8:	00140413          	addi	s0,s0,1 # c0001 <BASE_ADDRESS-0xbff3ffff>
c00044ac:	0000d717          	auipc	a4,0xd
c00044b0:	f9c72703          	lw	a4,-100(a4) # c0011448 <npage>
c00044b4:	fae46ee3          	bltu	s0,a4,c0004470 <pmm_init+0x58c>
c00044b8:	0000d697          	auipc	a3,0xd
c00044bc:	f8c6a683          	lw	a3,-116(a3) # c0011444 <boot_pgdir>
c00044c0:	000014b7          	lui	s1,0x1
c00044c4:	009687b3          	add	a5,a3,s1
c00044c8:	fac7a783          	lw	a5,-84(a5)
c00044cc:	fffff637          	lui	a2,0xfffff
c00044d0:	c0000737          	lui	a4,0xc0000
c00044d4:	00279793          	slli	a5,a5,0x2
c00044d8:	00c7f7b3          	and	a5,a5,a2
c00044dc:	5ee6e263          	bltu	a3,a4,c0004ac0 <pmm_init+0xbdc>
c00044e0:	0000d717          	auipc	a4,0xd
c00044e4:	02c72703          	lw	a4,44(a4) # c001150c <va_pa_offset>
c00044e8:	40e68733          	sub	a4,a3,a4
c00044ec:	5ae79a63          	bne	a5,a4,c0004aa0 <pmm_init+0xbbc>
c00044f0:	0006a783          	lw	a5,0(a3)
c00044f4:	58079663          	bnez	a5,c0004a80 <pmm_init+0xb9c>
c00044f8:	00100513          	li	a0,1
c00044fc:	814ff0ef          	jal	ra,c0003510 <alloc_pages>
c0004500:	00050413          	mv	s0,a0
c0004504:	00050593          	mv	a1,a0
c0004508:	00600693          	li	a3,6
c000450c:	10000613          	li	a2,256
c0004510:	0000d517          	auipc	a0,0xd
c0004514:	f3452503          	lw	a0,-204(a0) # c0011444 <boot_pgdir>
c0004518:	cf8ff0ef          	jal	ra,c0003a10 <page_insert>
c000451c:	54051263          	bnez	a0,c0004a60 <pmm_init+0xb7c>
c0004520:	00042703          	lw	a4,0(s0)
c0004524:	00100793          	li	a5,1
c0004528:	50f71c63          	bne	a4,a5,c0004a40 <pmm_init+0xb5c>
c000452c:	00600693          	li	a3,6
c0004530:	10048613          	addi	a2,s1,256 # 1100 <BASE_ADDRESS-0xbfffef00>
c0004534:	00040593          	mv	a1,s0
c0004538:	0000d517          	auipc	a0,0xd
c000453c:	f0c52503          	lw	a0,-244(a0) # c0011444 <boot_pgdir>
c0004540:	cd0ff0ef          	jal	ra,c0003a10 <page_insert>
c0004544:	4c051e63          	bnez	a0,c0004a20 <pmm_init+0xb3c>
c0004548:	00042703          	lw	a4,0(s0)
c000454c:	00200793          	li	a5,2
c0004550:	62f71063          	bne	a4,a5,c0004b70 <pmm_init+0xc8c>
c0004554:	00003597          	auipc	a1,0x3
c0004558:	a8c58593          	addi	a1,a1,-1396 # c0006fe0 <default_pmm_manager+0x5a0>
c000455c:	10000513          	li	a0,256
c0004560:	215000ef          	jal	ra,c0004f74 <strcpy>
c0004564:	10048593          	addi	a1,s1,256
c0004568:	10000513          	li	a0,256
c000456c:	225000ef          	jal	ra,c0004f90 <strcmp>
c0004570:	5e051063          	bnez	a0,c0004b50 <pmm_init+0xc6c>
c0004574:	0000d797          	auipc	a5,0xd
c0004578:	fa07a783          	lw	a5,-96(a5) # c0011514 <pages>
c000457c:	40f407b3          	sub	a5,s0,a5
c0004580:	00080737          	lui	a4,0x80
c0004584:	4057d793          	srai	a5,a5,0x5
c0004588:	00e787b3          	add	a5,a5,a4
c000458c:	00100737          	lui	a4,0x100
c0004590:	fff70713          	addi	a4,a4,-1 # fffff <BASE_ADDRESS-0xbff00001>
c0004594:	00e7f733          	and	a4,a5,a4
c0004598:	0000d697          	auipc	a3,0xd
c000459c:	eb06a683          	lw	a3,-336(a3) # c0011448 <npage>
c00045a0:	00c79793          	slli	a5,a5,0xc
c00045a4:	34d77c63          	bleu	a3,a4,c00048fc <pmm_init+0xa18>
c00045a8:	0000d717          	auipc	a4,0xd
c00045ac:	f6472703          	lw	a4,-156(a4) # c001150c <va_pa_offset>
c00045b0:	00f707b3          	add	a5,a4,a5
c00045b4:	10078023          	sb	zero,256(a5)
c00045b8:	10000513          	li	a0,256
c00045bc:	14d000ef          	jal	ra,c0004f08 <strlen>
c00045c0:	56051863          	bnez	a0,c0004b30 <pmm_init+0xc4c>
c00045c4:	00100593          	li	a1,1
c00045c8:	00040513          	mv	a0,s0
c00045cc:	ff9fe0ef          	jal	ra,c00035c4 <free_pages>
c00045d0:	0000d797          	auipc	a5,0xd
c00045d4:	e747a783          	lw	a5,-396(a5) # c0011444 <boot_pgdir>
c00045d8:	0007a783          	lw	a5,0(a5)
c00045dc:	0000d717          	auipc	a4,0xd
c00045e0:	e6c72703          	lw	a4,-404(a4) # c0011448 <npage>
c00045e4:	00279793          	slli	a5,a5,0x2
c00045e8:	00c7d793          	srli	a5,a5,0xc
c00045ec:	2ee7f863          	bleu	a4,a5,c00048dc <pmm_init+0x9f8>
c00045f0:	fff80737          	lui	a4,0xfff80
c00045f4:	00e787b3          	add	a5,a5,a4
c00045f8:	00579793          	slli	a5,a5,0x5
c00045fc:	0000d517          	auipc	a0,0xd
c0004600:	f1852503          	lw	a0,-232(a0) # c0011514 <pages>
c0004604:	00100593          	li	a1,1
c0004608:	00f50533          	add	a0,a0,a5
c000460c:	fb9fe0ef          	jal	ra,c00035c4 <free_pages>
c0004610:	0000d797          	auipc	a5,0xd
c0004614:	e347a783          	lw	a5,-460(a5) # c0011444 <boot_pgdir>
c0004618:	0007a023          	sw	zero,0(a5)
c000461c:	00003517          	auipc	a0,0x3
c0004620:	a3850513          	addi	a0,a0,-1480 # c0007054 <default_pmm_manager+0x614>
c0004624:	ab1fb0ef          	jal	ra,c00000d4 <cprintf>
c0004628:	dccff0ef          	jal	ra,c0003bf4 <print_pgdir>
c000462c:	01c12083          	lw	ra,28(sp)
c0004630:	01812403          	lw	s0,24(sp)
c0004634:	01412483          	lw	s1,20(sp)
c0004638:	01012903          	lw	s2,16(sp)
c000463c:	02010113          	addi	sp,sp,32
c0004640:	00008067          	ret
c0004644:	00078513          	mv	a0,a5
c0004648:	9b1ff06f          	j	c0003ff8 <pmm_init+0x114>
c000464c:	00003697          	auipc	a3,0x3
c0004650:	85468693          	addi	a3,a3,-1964 # c0006ea0 <default_pmm_manager+0x460>
c0004654:	00002617          	auipc	a2,0x2
c0004658:	81460613          	addi	a2,a2,-2028 # c0005e68 <commands+0x720>
c000465c:	1d900593          	li	a1,473
c0004660:	00002517          	auipc	a0,0x2
c0004664:	45c50513          	addi	a0,a0,1116 # c0006abc <default_pmm_manager+0x7c>
c0004668:	be1fb0ef          	jal	ra,c0000248 <__panic>
c000466c:	00040693          	mv	a3,s0
c0004670:	00002617          	auipc	a2,0x2
c0004674:	42860613          	addi	a2,a2,1064 # c0006a98 <default_pmm_manager+0x58>
c0004678:	1d900593          	li	a1,473
c000467c:	00002517          	auipc	a0,0x2
c0004680:	44050513          	addi	a0,a0,1088 # c0006abc <default_pmm_manager+0x7c>
c0004684:	bc5fb0ef          	jal	ra,c0000248 <__panic>
c0004688:	00003697          	auipc	a3,0x3
c000468c:	85868693          	addi	a3,a3,-1960 # c0006ee0 <default_pmm_manager+0x4a0>
c0004690:	00001617          	auipc	a2,0x1
c0004694:	7d860613          	addi	a2,a2,2008 # c0005e68 <commands+0x720>
c0004698:	1da00593          	li	a1,474
c000469c:	00002517          	auipc	a0,0x2
c00046a0:	42050513          	addi	a0,a0,1056 # c0006abc <default_pmm_manager+0x7c>
c00046a4:	ba5fb0ef          	jal	ra,c0000248 <__panic>
c00046a8:	00002697          	auipc	a3,0x2
c00046ac:	7a068693          	addi	a3,a3,1952 # c0006e48 <default_pmm_manager+0x408>
c00046b0:	00001617          	auipc	a2,0x1
c00046b4:	7b860613          	addi	a2,a2,1976 # c0005e68 <commands+0x720>
c00046b8:	1ca00593          	li	a1,458
c00046bc:	00002517          	auipc	a0,0x2
c00046c0:	40050513          	addi	a0,a0,1024 # c0006abc <default_pmm_manager+0x7c>
c00046c4:	b85fb0ef          	jal	ra,c0000248 <__panic>
c00046c8:	00002617          	auipc	a2,0x2
c00046cc:	4d460613          	addi	a2,a2,1236 # c0006b9c <default_pmm_manager+0x15c>
c00046d0:	08b00593          	li	a1,139
c00046d4:	00002517          	auipc	a0,0x2
c00046d8:	3e850513          	addi	a0,a0,1000 # c0006abc <default_pmm_manager+0x7c>
c00046dc:	b6dfb0ef          	jal	ra,c0000248 <__panic>
c00046e0:	00078693          	mv	a3,a5
c00046e4:	00002617          	auipc	a2,0x2
c00046e8:	3b460613          	addi	a2,a2,948 # c0006a98 <default_pmm_manager+0x58>
c00046ec:	0eb00593          	li	a1,235
c00046f0:	00002517          	auipc	a0,0x2
c00046f4:	3cc50513          	addi	a0,a0,972 # c0006abc <default_pmm_manager+0x7c>
c00046f8:	b51fb0ef          	jal	ra,c0000248 <__panic>
c00046fc:	00002697          	auipc	a3,0x2
c0004700:	66468693          	addi	a3,a3,1636 # c0006d60 <default_pmm_manager+0x320>
c0004704:	00001617          	auipc	a2,0x1
c0004708:	76460613          	addi	a2,a2,1892 # c0005e68 <commands+0x720>
c000470c:	1c100593          	li	a1,449
c0004710:	00002517          	auipc	a0,0x2
c0004714:	3ac50513          	addi	a0,a0,940 # c0006abc <default_pmm_manager+0x7c>
c0004718:	b31fb0ef          	jal	ra,c0000248 <__panic>
c000471c:	00002697          	auipc	a3,0x2
c0004720:	70068693          	addi	a3,a3,1792 # c0006e1c <default_pmm_manager+0x3dc>
c0004724:	00001617          	auipc	a2,0x1
c0004728:	74460613          	addi	a2,a2,1860 # c0005e68 <commands+0x720>
c000472c:	1c000593          	li	a1,448
c0004730:	00002517          	auipc	a0,0x2
c0004734:	38c50513          	addi	a0,a0,908 # c0006abc <default_pmm_manager+0x7c>
c0004738:	b11fb0ef          	jal	ra,c0000248 <__panic>
c000473c:	00002697          	auipc	a3,0x2
c0004740:	6cc68693          	addi	a3,a3,1740 # c0006e08 <default_pmm_manager+0x3c8>
c0004744:	00001617          	auipc	a2,0x1
c0004748:	72460613          	addi	a2,a2,1828 # c0005e68 <commands+0x720>
c000474c:	1bf00593          	li	a1,447
c0004750:	00002517          	auipc	a0,0x2
c0004754:	36c50513          	addi	a0,a0,876 # c0006abc <default_pmm_manager+0x7c>
c0004758:	af1fb0ef          	jal	ra,c0000248 <__panic>
c000475c:	00002697          	auipc	a3,0x2
c0004760:	68068693          	addi	a3,a3,1664 # c0006ddc <default_pmm_manager+0x39c>
c0004764:	00001617          	auipc	a2,0x1
c0004768:	70460613          	addi	a2,a2,1796 # c0005e68 <commands+0x720>
c000476c:	1be00593          	li	a1,446
c0004770:	00002517          	auipc	a0,0x2
c0004774:	34c50513          	addi	a0,a0,844 # c0006abc <default_pmm_manager+0x7c>
c0004778:	ad1fb0ef          	jal	ra,c0000248 <__panic>
c000477c:	00002697          	auipc	a3,0x2
c0004780:	64c68693          	addi	a3,a3,1612 # c0006dc8 <default_pmm_manager+0x388>
c0004784:	00001617          	auipc	a2,0x1
c0004788:	6e460613          	addi	a2,a2,1764 # c0005e68 <commands+0x720>
c000478c:	1bc00593          	li	a1,444
c0004790:	00002517          	auipc	a0,0x2
c0004794:	32c50513          	addi	a0,a0,812 # c0006abc <default_pmm_manager+0x7c>
c0004798:	ab1fb0ef          	jal	ra,c0000248 <__panic>
c000479c:	00002697          	auipc	a3,0x2
c00047a0:	61468693          	addi	a3,a3,1556 # c0006db0 <default_pmm_manager+0x370>
c00047a4:	00001617          	auipc	a2,0x1
c00047a8:	6c460613          	addi	a2,a2,1732 # c0005e68 <commands+0x720>
c00047ac:	1bb00593          	li	a1,443
c00047b0:	00002517          	auipc	a0,0x2
c00047b4:	30c50513          	addi	a0,a0,780 # c0006abc <default_pmm_manager+0x7c>
c00047b8:	a91fb0ef          	jal	ra,c0000248 <__panic>
c00047bc:	00002697          	auipc	a3,0x2
c00047c0:	5e468693          	addi	a3,a3,1508 # c0006da0 <default_pmm_manager+0x360>
c00047c4:	00001617          	auipc	a2,0x1
c00047c8:	6a460613          	addi	a2,a2,1700 # c0005e68 <commands+0x720>
c00047cc:	1ba00593          	li	a1,442
c00047d0:	00002517          	auipc	a0,0x2
c00047d4:	2ec50513          	addi	a0,a0,748 # c0006abc <default_pmm_manager+0x7c>
c00047d8:	a71fb0ef          	jal	ra,c0000248 <__panic>
c00047dc:	00002697          	auipc	a3,0x2
c00047e0:	5b468693          	addi	a3,a3,1460 # c0006d90 <default_pmm_manager+0x350>
c00047e4:	00001617          	auipc	a2,0x1
c00047e8:	68460613          	addi	a2,a2,1668 # c0005e68 <commands+0x720>
c00047ec:	1b900593          	li	a1,441
c00047f0:	00002517          	auipc	a0,0x2
c00047f4:	2cc50513          	addi	a0,a0,716 # c0006abc <default_pmm_manager+0x7c>
c00047f8:	a51fb0ef          	jal	ra,c0000248 <__panic>
c00047fc:	00002697          	auipc	a3,0x2
c0004800:	62068693          	addi	a3,a3,1568 # c0006e1c <default_pmm_manager+0x3dc>
c0004804:	00001617          	auipc	a2,0x1
c0004808:	66460613          	addi	a2,a2,1636 # c0005e68 <commands+0x720>
c000480c:	1c700593          	li	a1,455
c0004810:	00002517          	auipc	a0,0x2
c0004814:	2ac50513          	addi	a0,a0,684 # c0006abc <default_pmm_manager+0x7c>
c0004818:	a31fb0ef          	jal	ra,c0000248 <__panic>
c000481c:	00002697          	auipc	a3,0x2
c0004820:	4d068693          	addi	a3,a3,1232 # c0006cec <default_pmm_manager+0x2ac>
c0004824:	00001617          	auipc	a2,0x1
c0004828:	64460613          	addi	a2,a2,1604 # c0005e68 <commands+0x720>
c000482c:	1c600593          	li	a1,454
c0004830:	00002517          	auipc	a0,0x2
c0004834:	28c50513          	addi	a0,a0,652 # c0006abc <default_pmm_manager+0x7c>
c0004838:	a11fb0ef          	jal	ra,c0000248 <__panic>
c000483c:	00002697          	auipc	a3,0x2
c0004840:	5f468693          	addi	a3,a3,1524 # c0006e30 <default_pmm_manager+0x3f0>
c0004844:	00001617          	auipc	a2,0x1
c0004848:	62460613          	addi	a2,a2,1572 # c0005e68 <commands+0x720>
c000484c:	1c300593          	li	a1,451
c0004850:	00002517          	auipc	a0,0x2
c0004854:	26c50513          	addi	a0,a0,620 # c0006abc <default_pmm_manager+0x7c>
c0004858:	9f1fb0ef          	jal	ra,c0000248 <__panic>
c000485c:	00002697          	auipc	a3,0x2
c0004860:	47868693          	addi	a3,a3,1144 # c0006cd4 <default_pmm_manager+0x294>
c0004864:	00001617          	auipc	a2,0x1
c0004868:	60460613          	addi	a2,a2,1540 # c0005e68 <commands+0x720>
c000486c:	1c200593          	li	a1,450
c0004870:	00002517          	auipc	a0,0x2
c0004874:	24c50513          	addi	a0,a0,588 # c0006abc <default_pmm_manager+0x7c>
c0004878:	9d1fb0ef          	jal	ra,c0000248 <__panic>
c000487c:	00002697          	auipc	a3,0x2
c0004880:	3fc68693          	addi	a3,a3,1020 # c0006c78 <default_pmm_manager+0x238>
c0004884:	00001617          	auipc	a2,0x1
c0004888:	5e460613          	addi	a2,a2,1508 # c0005e68 <commands+0x720>
c000488c:	1ac00593          	li	a1,428
c0004890:	00002517          	auipc	a0,0x2
c0004894:	22c50513          	addi	a0,a0,556 # c0006abc <default_pmm_manager+0x7c>
c0004898:	9b1fb0ef          	jal	ra,c0000248 <__panic>
c000489c:	00002697          	auipc	a3,0x2
c00048a0:	3b468693          	addi	a3,a3,948 # c0006c50 <default_pmm_manager+0x210>
c00048a4:	00001617          	auipc	a2,0x1
c00048a8:	5c460613          	addi	a2,a2,1476 # c0005e68 <commands+0x720>
c00048ac:	1a800593          	li	a1,424
c00048b0:	00002517          	auipc	a0,0x2
c00048b4:	20c50513          	addi	a0,a0,524 # c0006abc <default_pmm_manager+0x7c>
c00048b8:	991fb0ef          	jal	ra,c0000248 <__panic>
c00048bc:	00002697          	auipc	a3,0x2
c00048c0:	35c68693          	addi	a3,a3,860 # c0006c18 <default_pmm_manager+0x1d8>
c00048c4:	00001617          	auipc	a2,0x1
c00048c8:	5a460613          	addi	a2,a2,1444 # c0005e68 <commands+0x720>
c00048cc:	1a700593          	li	a1,423
c00048d0:	00002517          	auipc	a0,0x2
c00048d4:	1ec50513          	addi	a0,a0,492 # c0006abc <default_pmm_manager+0x7c>
c00048d8:	971fb0ef          	jal	ra,c0000248 <__panic>
c00048dc:	c15fe0ef          	jal	ra,c00034f0 <pa2page.part.6>
c00048e0:	00050693          	mv	a3,a0
c00048e4:	00002617          	auipc	a2,0x2
c00048e8:	2b860613          	addi	a2,a2,696 # c0006b9c <default_pmm_manager+0x15c>
c00048ec:	0d300593          	li	a1,211
c00048f0:	00002517          	auipc	a0,0x2
c00048f4:	1cc50513          	addi	a0,a0,460 # c0006abc <default_pmm_manager+0x7c>
c00048f8:	951fb0ef          	jal	ra,c0000248 <__panic>
c00048fc:	00078693          	mv	a3,a5
c0004900:	00002617          	auipc	a2,0x2
c0004904:	19860613          	addi	a2,a2,408 # c0006a98 <default_pmm_manager+0x58>
c0004908:	06b00593          	li	a1,107
c000490c:	00002517          	auipc	a0,0x2
c0004910:	86050513          	addi	a0,a0,-1952 # c000616c <commands+0xa24>
c0004914:	935fb0ef          	jal	ra,c0000248 <__panic>
c0004918:	00002617          	auipc	a2,0x2
c000491c:	2c860613          	addi	a2,a2,712 # c0006be0 <default_pmm_manager+0x1a0>
c0004920:	0b500593          	li	a1,181
c0004924:	00002517          	auipc	a0,0x2
c0004928:	19850513          	addi	a0,a0,408 # c0006abc <default_pmm_manager+0x7c>
c000492c:	91dfb0ef          	jal	ra,c0000248 <__panic>
c0004930:	00002617          	auipc	a2,0x2
c0004934:	16860613          	addi	a2,a2,360 # c0006a98 <default_pmm_manager+0x58>
c0004938:	1b300593          	li	a1,435
c000493c:	00002517          	auipc	a0,0x2
c0004940:	18050513          	addi	a0,a0,384 # c0006abc <default_pmm_manager+0x7c>
c0004944:	905fb0ef          	jal	ra,c0000248 <__panic>
c0004948:	00002697          	auipc	a3,0x2
c000494c:	3a468693          	addi	a3,a3,932 # c0006cec <default_pmm_manager+0x2ac>
c0004950:	00001617          	auipc	a2,0x1
c0004954:	51860613          	addi	a2,a2,1304 # c0005e68 <commands+0x720>
c0004958:	1b100593          	li	a1,433
c000495c:	00002517          	auipc	a0,0x2
c0004960:	16050513          	addi	a0,a0,352 # c0006abc <default_pmm_manager+0x7c>
c0004964:	8e5fb0ef          	jal	ra,c0000248 <__panic>
c0004968:	00002697          	auipc	a3,0x2
c000496c:	36c68693          	addi	a3,a3,876 # c0006cd4 <default_pmm_manager+0x294>
c0004970:	00001617          	auipc	a2,0x1
c0004974:	4f860613          	addi	a2,a2,1272 # c0005e68 <commands+0x720>
c0004978:	1b000593          	li	a1,432
c000497c:	00002517          	auipc	a0,0x2
c0004980:	14050513          	addi	a0,a0,320 # c0006abc <default_pmm_manager+0x7c>
c0004984:	8c5fb0ef          	jal	ra,c0000248 <__panic>
c0004988:	00002617          	auipc	a2,0x2
c000498c:	c4060613          	addi	a2,a2,-960 # c00065c8 <commands+0xe80>
c0004990:	07100593          	li	a1,113
c0004994:	00001517          	auipc	a0,0x1
c0004998:	7d850513          	addi	a0,a0,2008 # c000616c <commands+0xa24>
c000499c:	8adfb0ef          	jal	ra,c0000248 <__panic>
c00049a0:	00002697          	auipc	a3,0x2
c00049a4:	30468693          	addi	a3,a3,772 # c0006ca4 <default_pmm_manager+0x264>
c00049a8:	00001617          	auipc	a2,0x1
c00049ac:	4c060613          	addi	a2,a2,1216 # c0005e68 <commands+0x720>
c00049b0:	1af00593          	li	a1,431
c00049b4:	00002517          	auipc	a0,0x2
c00049b8:	10850513          	addi	a0,a0,264 # c0006abc <default_pmm_manager+0x7c>
c00049bc:	88dfb0ef          	jal	ra,c0000248 <__panic>
c00049c0:	00002697          	auipc	a3,0x2
c00049c4:	3a068693          	addi	a3,a3,928 # c0006d60 <default_pmm_manager+0x320>
c00049c8:	00001617          	auipc	a2,0x1
c00049cc:	4a060613          	addi	a2,a2,1184 # c0005e68 <commands+0x720>
c00049d0:	1b800593          	li	a1,440
c00049d4:	00002517          	auipc	a0,0x2
c00049d8:	0e850513          	addi	a0,a0,232 # c0006abc <default_pmm_manager+0x7c>
c00049dc:	86dfb0ef          	jal	ra,c0000248 <__panic>
c00049e0:	00002697          	auipc	a3,0x2
c00049e4:	34868693          	addi	a3,a3,840 # c0006d28 <default_pmm_manager+0x2e8>
c00049e8:	00001617          	auipc	a2,0x1
c00049ec:	48060613          	addi	a2,a2,1152 # c0005e68 <commands+0x720>
c00049f0:	1b700593          	li	a1,439
c00049f4:	00002517          	auipc	a0,0x2
c00049f8:	0c850513          	addi	a0,a0,200 # c0006abc <default_pmm_manager+0x7c>
c00049fc:	84dfb0ef          	jal	ra,c0000248 <__panic>
c0004a00:	00002697          	auipc	a3,0x2
c0004a04:	30068693          	addi	a3,a3,768 # c0006d00 <default_pmm_manager+0x2c0>
c0004a08:	00001617          	auipc	a2,0x1
c0004a0c:	46060613          	addi	a2,a2,1120 # c0005e68 <commands+0x720>
c0004a10:	1b400593          	li	a1,436
c0004a14:	00002517          	auipc	a0,0x2
c0004a18:	0a850513          	addi	a0,a0,168 # c0006abc <default_pmm_manager+0x7c>
c0004a1c:	82dfb0ef          	jal	ra,c0000248 <__panic>
c0004a20:	00002697          	auipc	a3,0x2
c0004a24:	56c68693          	addi	a3,a3,1388 # c0006f8c <default_pmm_manager+0x54c>
c0004a28:	00001617          	auipc	a2,0x1
c0004a2c:	44060613          	addi	a2,a2,1088 # c0005e68 <commands+0x720>
c0004a30:	1e500593          	li	a1,485
c0004a34:	00002517          	auipc	a0,0x2
c0004a38:	08850513          	addi	a0,a0,136 # c0006abc <default_pmm_manager+0x7c>
c0004a3c:	80dfb0ef          	jal	ra,c0000248 <__panic>
c0004a40:	00002697          	auipc	a3,0x2
c0004a44:	53868693          	addi	a3,a3,1336 # c0006f78 <default_pmm_manager+0x538>
c0004a48:	00001617          	auipc	a2,0x1
c0004a4c:	42060613          	addi	a2,a2,1056 # c0005e68 <commands+0x720>
c0004a50:	1e400593          	li	a1,484
c0004a54:	00002517          	auipc	a0,0x2
c0004a58:	06850513          	addi	a0,a0,104 # c0006abc <default_pmm_manager+0x7c>
c0004a5c:	fecfb0ef          	jal	ra,c0000248 <__panic>
c0004a60:	00002697          	auipc	a3,0x2
c0004a64:	4e068693          	addi	a3,a3,1248 # c0006f40 <default_pmm_manager+0x500>
c0004a68:	00001617          	auipc	a2,0x1
c0004a6c:	40060613          	addi	a2,a2,1024 # c0005e68 <commands+0x720>
c0004a70:	1e300593          	li	a1,483
c0004a74:	00002517          	auipc	a0,0x2
c0004a78:	04850513          	addi	a0,a0,72 # c0006abc <default_pmm_manager+0x7c>
c0004a7c:	fccfb0ef          	jal	ra,c0000248 <__panic>
c0004a80:	00002697          	auipc	a3,0x2
c0004a84:	4ac68693          	addi	a3,a3,1196 # c0006f2c <default_pmm_manager+0x4ec>
c0004a88:	00001617          	auipc	a2,0x1
c0004a8c:	3e060613          	addi	a2,a2,992 # c0005e68 <commands+0x720>
c0004a90:	1df00593          	li	a1,479
c0004a94:	00002517          	auipc	a0,0x2
c0004a98:	02850513          	addi	a0,a0,40 # c0006abc <default_pmm_manager+0x7c>
c0004a9c:	facfb0ef          	jal	ra,c0000248 <__panic>
c0004aa0:	00002697          	auipc	a3,0x2
c0004aa4:	45868693          	addi	a3,a3,1112 # c0006ef8 <default_pmm_manager+0x4b8>
c0004aa8:	00001617          	auipc	a2,0x1
c0004aac:	3c060613          	addi	a2,a2,960 # c0005e68 <commands+0x720>
c0004ab0:	1dd00593          	li	a1,477
c0004ab4:	00002517          	auipc	a0,0x2
c0004ab8:	00850513          	addi	a0,a0,8 # c0006abc <default_pmm_manager+0x7c>
c0004abc:	f8cfb0ef          	jal	ra,c0000248 <__panic>
c0004ac0:	00002617          	auipc	a2,0x2
c0004ac4:	0dc60613          	addi	a2,a2,220 # c0006b9c <default_pmm_manager+0x15c>
c0004ac8:	1dd00593          	li	a1,477
c0004acc:	00002517          	auipc	a0,0x2
c0004ad0:	ff050513          	addi	a0,a0,-16 # c0006abc <default_pmm_manager+0x7c>
c0004ad4:	f74fb0ef          	jal	ra,c0000248 <__panic>
c0004ad8:	00002697          	auipc	a3,0x2
c0004adc:	38468693          	addi	a3,a3,900 # c0006e5c <default_pmm_manager+0x41c>
c0004ae0:	00001617          	auipc	a2,0x1
c0004ae4:	38860613          	addi	a2,a2,904 # c0005e68 <commands+0x720>
c0004ae8:	1cd00593          	li	a1,461
c0004aec:	00002517          	auipc	a0,0x2
c0004af0:	fd050513          	addi	a0,a0,-48 # c0006abc <default_pmm_manager+0x7c>
c0004af4:	f54fb0ef          	jal	ra,c0000248 <__panic>
c0004af8:	00002697          	auipc	a3,0x2
c0004afc:	32468693          	addi	a3,a3,804 # c0006e1c <default_pmm_manager+0x3dc>
c0004b00:	00001617          	auipc	a2,0x1
c0004b04:	36860613          	addi	a2,a2,872 # c0005e68 <commands+0x720>
c0004b08:	1cb00593          	li	a1,459
c0004b0c:	00002517          	auipc	a0,0x2
c0004b10:	fb050513          	addi	a0,a0,-80 # c0006abc <default_pmm_manager+0x7c>
c0004b14:	f34fb0ef          	jal	ra,c0000248 <__panic>
c0004b18:	00002617          	auipc	a2,0x2
c0004b1c:	01860613          	addi	a2,a2,24 # c0006b30 <default_pmm_manager+0xf0>
c0004b20:	06c00593          	li	a1,108
c0004b24:	00002517          	auipc	a0,0x2
c0004b28:	f9850513          	addi	a0,a0,-104 # c0006abc <default_pmm_manager+0x7c>
c0004b2c:	f1cfb0ef          	jal	ra,c0000248 <__panic>
c0004b30:	00002697          	auipc	a3,0x2
c0004b34:	50068693          	addi	a3,a3,1280 # c0007030 <default_pmm_manager+0x5f0>
c0004b38:	00001617          	auipc	a2,0x1
c0004b3c:	33060613          	addi	a2,a2,816 # c0005e68 <commands+0x720>
c0004b40:	1ed00593          	li	a1,493
c0004b44:	00002517          	auipc	a0,0x2
c0004b48:	f7850513          	addi	a0,a0,-136 # c0006abc <default_pmm_manager+0x7c>
c0004b4c:	efcfb0ef          	jal	ra,c0000248 <__panic>
c0004b50:	00002697          	auipc	a3,0x2
c0004b54:	4a868693          	addi	a3,a3,1192 # c0006ff8 <default_pmm_manager+0x5b8>
c0004b58:	00001617          	auipc	a2,0x1
c0004b5c:	31060613          	addi	a2,a2,784 # c0005e68 <commands+0x720>
c0004b60:	1ea00593          	li	a1,490
c0004b64:	00002517          	auipc	a0,0x2
c0004b68:	f5850513          	addi	a0,a0,-168 # c0006abc <default_pmm_manager+0x7c>
c0004b6c:	edcfb0ef          	jal	ra,c0000248 <__panic>
c0004b70:	00002697          	auipc	a3,0x2
c0004b74:	45c68693          	addi	a3,a3,1116 # c0006fcc <default_pmm_manager+0x58c>
c0004b78:	00001617          	auipc	a2,0x1
c0004b7c:	2f060613          	addi	a2,a2,752 # c0005e68 <commands+0x720>
c0004b80:	1e600593          	li	a1,486
c0004b84:	00002517          	auipc	a0,0x2
c0004b88:	f3850513          	addi	a0,a0,-200 # c0006abc <default_pmm_manager+0x7c>
c0004b8c:	ebcfb0ef          	jal	ra,c0000248 <__panic>
c0004b90:	00002697          	auipc	a3,0x2
c0004b94:	06c68693          	addi	a3,a3,108 # c0006bfc <default_pmm_manager+0x1bc>
c0004b98:	00001617          	auipc	a2,0x1
c0004b9c:	2d060613          	addi	a2,a2,720 # c0005e68 <commands+0x720>
c0004ba0:	1a600593          	li	a1,422
c0004ba4:	00002517          	auipc	a0,0x2
c0004ba8:	f1850513          	addi	a0,a0,-232 # c0006abc <default_pmm_manager+0x7c>
c0004bac:	e9cfb0ef          	jal	ra,c0000248 <__panic>

c0004bb0 <kmalloc>:
c0004bb0:	ff010113          	addi	sp,sp,-16
c0004bb4:	000157b7          	lui	a5,0x15
c0004bb8:	00112623          	sw	ra,12(sp)
c0004bbc:	fff50713          	addi	a4,a0,-1
c0004bc0:	ffe78793          	addi	a5,a5,-2 # 14ffe <BASE_ADDRESS-0xbffeb002>
c0004bc4:	06e7e463          	bltu	a5,a4,c0004c2c <kmalloc+0x7c>
c0004bc8:	000017b7          	lui	a5,0x1
c0004bcc:	fff78793          	addi	a5,a5,-1 # fff <BASE_ADDRESS-0xbffff001>
c0004bd0:	00f50533          	add	a0,a0,a5
c0004bd4:	00c55513          	srli	a0,a0,0xc
c0004bd8:	939fe0ef          	jal	ra,c0003510 <alloc_pages>
c0004bdc:	08050663          	beqz	a0,c0004c68 <kmalloc+0xb8>
c0004be0:	0000d797          	auipc	a5,0xd
c0004be4:	9347a783          	lw	a5,-1740(a5) # c0011514 <pages>
c0004be8:	40f50533          	sub	a0,a0,a5
c0004bec:	40555513          	srai	a0,a0,0x5
c0004bf0:	000806b7          	lui	a3,0x80
c0004bf4:	001007b7          	lui	a5,0x100
c0004bf8:	00d50533          	add	a0,a0,a3
c0004bfc:	fff78793          	addi	a5,a5,-1 # fffff <BASE_ADDRESS-0xbff00001>
c0004c00:	00f577b3          	and	a5,a0,a5
c0004c04:	0000d717          	auipc	a4,0xd
c0004c08:	84472703          	lw	a4,-1980(a4) # c0011448 <npage>
c0004c0c:	00c51513          	slli	a0,a0,0xc
c0004c10:	02e7fe63          	bleu	a4,a5,c0004c4c <kmalloc+0x9c>
c0004c14:	00c12083          	lw	ra,12(sp)
c0004c18:	0000d797          	auipc	a5,0xd
c0004c1c:	8f47a783          	lw	a5,-1804(a5) # c001150c <va_pa_offset>
c0004c20:	00f50533          	add	a0,a0,a5
c0004c24:	01010113          	addi	sp,sp,16
c0004c28:	00008067          	ret
c0004c2c:	00002697          	auipc	a3,0x2
c0004c30:	eac68693          	addi	a3,a3,-340 # c0006ad8 <default_pmm_manager+0x98>
c0004c34:	00001617          	auipc	a2,0x1
c0004c38:	23460613          	addi	a2,a2,564 # c0005e68 <commands+0x720>
c0004c3c:	25c00593          	li	a1,604
c0004c40:	00002517          	auipc	a0,0x2
c0004c44:	e7c50513          	addi	a0,a0,-388 # c0006abc <default_pmm_manager+0x7c>
c0004c48:	e00fb0ef          	jal	ra,c0000248 <__panic>
c0004c4c:	00050693          	mv	a3,a0
c0004c50:	00002617          	auipc	a2,0x2
c0004c54:	e4860613          	addi	a2,a2,-440 # c0006a98 <default_pmm_manager+0x58>
c0004c58:	06b00593          	li	a1,107
c0004c5c:	00001517          	auipc	a0,0x1
c0004c60:	51050513          	addi	a0,a0,1296 # c000616c <commands+0xa24>
c0004c64:	de4fb0ef          	jal	ra,c0000248 <__panic>
c0004c68:	00002697          	auipc	a3,0x2
c0004c6c:	e8c68693          	addi	a3,a3,-372 # c0006af4 <default_pmm_manager+0xb4>
c0004c70:	00001617          	auipc	a2,0x1
c0004c74:	1f860613          	addi	a2,a2,504 # c0005e68 <commands+0x720>
c0004c78:	25f00593          	li	a1,607
c0004c7c:	00002517          	auipc	a0,0x2
c0004c80:	e4050513          	addi	a0,a0,-448 # c0006abc <default_pmm_manager+0x7c>
c0004c84:	dc4fb0ef          	jal	ra,c0000248 <__panic>

c0004c88 <kfree>:
c0004c88:	ff010113          	addi	sp,sp,-16
c0004c8c:	000157b7          	lui	a5,0x15
c0004c90:	00112623          	sw	ra,12(sp)
c0004c94:	fff58713          	addi	a4,a1,-1
c0004c98:	ffe78793          	addi	a5,a5,-2 # 14ffe <BASE_ADDRESS-0xbffeb002>
c0004c9c:	06e7e063          	bltu	a5,a4,c0004cfc <kfree+0x74>
c0004ca0:	08050e63          	beqz	a0,c0004d3c <kfree+0xb4>
c0004ca4:	000017b7          	lui	a5,0x1
c0004ca8:	fff78793          	addi	a5,a5,-1 # fff <BASE_ADDRESS-0xbffff001>
c0004cac:	00f585b3          	add	a1,a1,a5
c0004cb0:	c00007b7          	lui	a5,0xc0000
c0004cb4:	00c5d593          	srli	a1,a1,0xc
c0004cb8:	06f56463          	bltu	a0,a5,c0004d20 <kfree+0x98>
c0004cbc:	0000d697          	auipc	a3,0xd
c0004cc0:	8506a683          	lw	a3,-1968(a3) # c001150c <va_pa_offset>
c0004cc4:	40d50533          	sub	a0,a0,a3
c0004cc8:	00c55513          	srli	a0,a0,0xc
c0004ccc:	0000c797          	auipc	a5,0xc
c0004cd0:	77c7a783          	lw	a5,1916(a5) # c0011448 <npage>
c0004cd4:	04f57463          	bleu	a5,a0,c0004d1c <kfree+0x94>
c0004cd8:	fff807b7          	lui	a5,0xfff80
c0004cdc:	00f50533          	add	a0,a0,a5
c0004ce0:	00c12083          	lw	ra,12(sp)
c0004ce4:	00551513          	slli	a0,a0,0x5
c0004ce8:	0000d797          	auipc	a5,0xd
c0004cec:	82c7a783          	lw	a5,-2004(a5) # c0011514 <pages>
c0004cf0:	00a78533          	add	a0,a5,a0
c0004cf4:	01010113          	addi	sp,sp,16
c0004cf8:	8cdfe06f          	j	c00035c4 <free_pages>
c0004cfc:	00002697          	auipc	a3,0x2
c0004d00:	ddc68693          	addi	a3,a3,-548 # c0006ad8 <default_pmm_manager+0x98>
c0004d04:	00001617          	auipc	a2,0x1
c0004d08:	16460613          	addi	a2,a2,356 # c0005e68 <commands+0x720>
c0004d0c:	26500593          	li	a1,613
c0004d10:	00002517          	auipc	a0,0x2
c0004d14:	dac50513          	addi	a0,a0,-596 # c0006abc <default_pmm_manager+0x7c>
c0004d18:	d30fb0ef          	jal	ra,c0000248 <__panic>
c0004d1c:	fd4fe0ef          	jal	ra,c00034f0 <pa2page.part.6>
c0004d20:	00050693          	mv	a3,a0
c0004d24:	00002617          	auipc	a2,0x2
c0004d28:	e7860613          	addi	a2,a2,-392 # c0006b9c <default_pmm_manager+0x15c>
c0004d2c:	06d00593          	li	a1,109
c0004d30:	00001517          	auipc	a0,0x1
c0004d34:	43c50513          	addi	a0,a0,1084 # c000616c <commands+0xa24>
c0004d38:	d10fb0ef          	jal	ra,c0000248 <__panic>
c0004d3c:	00002697          	auipc	a3,0x2
c0004d40:	d9068693          	addi	a3,a3,-624 # c0006acc <default_pmm_manager+0x8c>
c0004d44:	00001617          	auipc	a2,0x1
c0004d48:	12460613          	addi	a2,a2,292 # c0005e68 <commands+0x720>
c0004d4c:	26600593          	li	a1,614
c0004d50:	00002517          	auipc	a0,0x2
c0004d54:	d6c50513          	addi	a0,a0,-660 # c0006abc <default_pmm_manager+0x7c>
c0004d58:	cf0fb0ef          	jal	ra,c0000248 <__panic>

c0004d5c <swapfs_init>:
c0004d5c:	ff010113          	addi	sp,sp,-16
c0004d60:	00100513          	li	a0,1
c0004d64:	00112623          	sw	ra,12(sp)
c0004d68:	8a9fb0ef          	jal	ra,c0000610 <ide_device_valid>
c0004d6c:	02050263          	beqz	a0,c0004d90 <swapfs_init+0x34>
c0004d70:	00100513          	li	a0,1
c0004d74:	8a5fb0ef          	jal	ra,c0000618 <ide_device_size>
c0004d78:	00c12083          	lw	ra,12(sp)
c0004d7c:	00355513          	srli	a0,a0,0x3
c0004d80:	0000c297          	auipc	t0,0xc
c0004d84:	74a2aa23          	sw	a0,1876(t0) # c00114d4 <max_swap_offset>
c0004d88:	01010113          	addi	sp,sp,16
c0004d8c:	00008067          	ret
c0004d90:	00002617          	auipc	a2,0x2
c0004d94:	39060613          	addi	a2,a2,912 # c0007120 <default_pmm_manager+0x6e0>
c0004d98:	00d00593          	li	a1,13
c0004d9c:	00002517          	auipc	a0,0x2
c0004da0:	3a050513          	addi	a0,a0,928 # c000713c <default_pmm_manager+0x6fc>
c0004da4:	ca4fb0ef          	jal	ra,c0000248 <__panic>

c0004da8 <swapfs_read>:
c0004da8:	ff010113          	addi	sp,sp,-16
c0004dac:	00112623          	sw	ra,12(sp)
c0004db0:	00855793          	srli	a5,a0,0x8
c0004db4:	06078663          	beqz	a5,c0004e20 <swapfs_read+0x78>
c0004db8:	0000c717          	auipc	a4,0xc
c0004dbc:	71c72703          	lw	a4,1820(a4) # c00114d4 <max_swap_offset>
c0004dc0:	06e7f063          	bleu	a4,a5,c0004e20 <swapfs_read+0x78>
c0004dc4:	0000c617          	auipc	a2,0xc
c0004dc8:	75062603          	lw	a2,1872(a2) # c0011514 <pages>
c0004dcc:	40c58633          	sub	a2,a1,a2
c0004dd0:	40565613          	srai	a2,a2,0x5
c0004dd4:	00005597          	auipc	a1,0x5
c0004dd8:	24c5a583          	lw	a1,588(a1) # c000a020 <nbase>
c0004ddc:	00100737          	lui	a4,0x100
c0004de0:	00b60633          	add	a2,a2,a1
c0004de4:	fff70713          	addi	a4,a4,-1 # fffff <BASE_ADDRESS-0xbff00001>
c0004de8:	00e67733          	and	a4,a2,a4
c0004dec:	0000c697          	auipc	a3,0xc
c0004df0:	65c6a683          	lw	a3,1628(a3) # c0011448 <npage>
c0004df4:	00379593          	slli	a1,a5,0x3
c0004df8:	00c61613          	slli	a2,a2,0xc
c0004dfc:	04d77063          	bleu	a3,a4,c0004e3c <swapfs_read+0x94>
c0004e00:	00c12083          	lw	ra,12(sp)
c0004e04:	0000c797          	auipc	a5,0xc
c0004e08:	7087a783          	lw	a5,1800(a5) # c001150c <va_pa_offset>
c0004e0c:	00800693          	li	a3,8
c0004e10:	00f60633          	add	a2,a2,a5
c0004e14:	00100513          	li	a0,1
c0004e18:	01010113          	addi	sp,sp,16
c0004e1c:	805fb06f          	j	c0000620 <ide_read_secs>
c0004e20:	00050693          	mv	a3,a0
c0004e24:	00002617          	auipc	a2,0x2
c0004e28:	32c60613          	addi	a2,a2,812 # c0007150 <default_pmm_manager+0x710>
c0004e2c:	01400593          	li	a1,20
c0004e30:	00002517          	auipc	a0,0x2
c0004e34:	30c50513          	addi	a0,a0,780 # c000713c <default_pmm_manager+0x6fc>
c0004e38:	c10fb0ef          	jal	ra,c0000248 <__panic>
c0004e3c:	00060693          	mv	a3,a2
c0004e40:	06b00593          	li	a1,107
c0004e44:	00002617          	auipc	a2,0x2
c0004e48:	c5460613          	addi	a2,a2,-940 # c0006a98 <default_pmm_manager+0x58>
c0004e4c:	00001517          	auipc	a0,0x1
c0004e50:	32050513          	addi	a0,a0,800 # c000616c <commands+0xa24>
c0004e54:	bf4fb0ef          	jal	ra,c0000248 <__panic>

c0004e58 <swapfs_write>:
c0004e58:	ff010113          	addi	sp,sp,-16
c0004e5c:	00112623          	sw	ra,12(sp)
c0004e60:	00855793          	srli	a5,a0,0x8
c0004e64:	06078663          	beqz	a5,c0004ed0 <swapfs_write+0x78>
c0004e68:	0000c717          	auipc	a4,0xc
c0004e6c:	66c72703          	lw	a4,1644(a4) # c00114d4 <max_swap_offset>
c0004e70:	06e7f063          	bleu	a4,a5,c0004ed0 <swapfs_write+0x78>
c0004e74:	0000c617          	auipc	a2,0xc
c0004e78:	6a062603          	lw	a2,1696(a2) # c0011514 <pages>
c0004e7c:	40c58633          	sub	a2,a1,a2
c0004e80:	40565613          	srai	a2,a2,0x5
c0004e84:	00005597          	auipc	a1,0x5
c0004e88:	19c5a583          	lw	a1,412(a1) # c000a020 <nbase>
c0004e8c:	00100737          	lui	a4,0x100
c0004e90:	00b60633          	add	a2,a2,a1
c0004e94:	fff70713          	addi	a4,a4,-1 # fffff <BASE_ADDRESS-0xbff00001>
c0004e98:	00e67733          	and	a4,a2,a4
c0004e9c:	0000c697          	auipc	a3,0xc
c0004ea0:	5ac6a683          	lw	a3,1452(a3) # c0011448 <npage>
c0004ea4:	00379593          	slli	a1,a5,0x3
c0004ea8:	00c61613          	slli	a2,a2,0xc
c0004eac:	04d77063          	bleu	a3,a4,c0004eec <swapfs_write+0x94>
c0004eb0:	00c12083          	lw	ra,12(sp)
c0004eb4:	0000c797          	auipc	a5,0xc
c0004eb8:	6587a783          	lw	a5,1624(a5) # c001150c <va_pa_offset>
c0004ebc:	00800693          	li	a3,8
c0004ec0:	00f60633          	add	a2,a2,a5
c0004ec4:	00100513          	li	a0,1
c0004ec8:	01010113          	addi	sp,sp,16
c0004ecc:	f88fb06f          	j	c0000654 <ide_write_secs>
c0004ed0:	00050693          	mv	a3,a0
c0004ed4:	00002617          	auipc	a2,0x2
c0004ed8:	27c60613          	addi	a2,a2,636 # c0007150 <default_pmm_manager+0x710>
c0004edc:	01900593          	li	a1,25
c0004ee0:	00002517          	auipc	a0,0x2
c0004ee4:	25c50513          	addi	a0,a0,604 # c000713c <default_pmm_manager+0x6fc>
c0004ee8:	b60fb0ef          	jal	ra,c0000248 <__panic>
c0004eec:	00060693          	mv	a3,a2
c0004ef0:	06b00593          	li	a1,107
c0004ef4:	00002617          	auipc	a2,0x2
c0004ef8:	ba460613          	addi	a2,a2,-1116 # c0006a98 <default_pmm_manager+0x58>
c0004efc:	00001517          	auipc	a0,0x1
c0004f00:	27050513          	addi	a0,a0,624 # c000616c <commands+0xa24>
c0004f04:	b44fb0ef          	jal	ra,c0000248 <__panic>

c0004f08 <strlen>:
c0004f08:	00054703          	lbu	a4,0(a0)
c0004f0c:	00050693          	mv	a3,a0
c0004f10:	00150793          	addi	a5,a0,1
c0004f14:	00070c63          	beqz	a4,c0004f2c <strlen+0x24>
c0004f18:	40d78533          	sub	a0,a5,a3
c0004f1c:	00178793          	addi	a5,a5,1
c0004f20:	fff7c703          	lbu	a4,-1(a5)
c0004f24:	fe071ae3          	bnez	a4,c0004f18 <strlen+0x10>
c0004f28:	00008067          	ret
c0004f2c:	00000513          	li	a0,0
c0004f30:	00008067          	ret

c0004f34 <strnlen>:
c0004f34:	00050693          	mv	a3,a0
c0004f38:	02058a63          	beqz	a1,c0004f6c <strnlen+0x38>
c0004f3c:	00054703          	lbu	a4,0(a0)
c0004f40:	00150793          	addi	a5,a0,1
c0004f44:	02070463          	beqz	a4,c0004f6c <strnlen+0x38>
c0004f48:	00b505b3          	add	a1,a0,a1
c0004f4c:	0100006f          	j	c0004f5c <strnlen+0x28>
c0004f50:	00178793          	addi	a5,a5,1
c0004f54:	fff7c703          	lbu	a4,-1(a5)
c0004f58:	00070863          	beqz	a4,c0004f68 <strnlen+0x34>
c0004f5c:	40d78533          	sub	a0,a5,a3
c0004f60:	feb798e3          	bne	a5,a1,c0004f50 <strnlen+0x1c>
c0004f64:	00008067          	ret
c0004f68:	00008067          	ret
c0004f6c:	00000513          	li	a0,0
c0004f70:	00008067          	ret

c0004f74 <strcpy>:
c0004f74:	00050793          	mv	a5,a0
c0004f78:	00158593          	addi	a1,a1,1
c0004f7c:	fff5c703          	lbu	a4,-1(a1)
c0004f80:	00178793          	addi	a5,a5,1
c0004f84:	fee78fa3          	sb	a4,-1(a5)
c0004f88:	fe0718e3          	bnez	a4,c0004f78 <strcpy+0x4>
c0004f8c:	00008067          	ret

c0004f90 <strcmp>:
c0004f90:	00054783          	lbu	a5,0(a0)
c0004f94:	0005c703          	lbu	a4,0(a1)
c0004f98:	02078263          	beqz	a5,c0004fbc <strcmp+0x2c>
c0004f9c:	02e79063          	bne	a5,a4,c0004fbc <strcmp+0x2c>
c0004fa0:	00150513          	addi	a0,a0,1
c0004fa4:	00054783          	lbu	a5,0(a0)
c0004fa8:	00158693          	addi	a3,a1,1
c0004fac:	0015c703          	lbu	a4,1(a1)
c0004fb0:	00078663          	beqz	a5,c0004fbc <strcmp+0x2c>
c0004fb4:	00068593          	mv	a1,a3
c0004fb8:	fee784e3          	beq	a5,a4,c0004fa0 <strcmp+0x10>
c0004fbc:	40e78533          	sub	a0,a5,a4
c0004fc0:	00008067          	ret

c0004fc4 <strchr>:
c0004fc4:	00054783          	lbu	a5,0(a0)
c0004fc8:	00078e63          	beqz	a5,c0004fe4 <strchr+0x20>
c0004fcc:	00f59663          	bne	a1,a5,c0004fd8 <strchr+0x14>
c0004fd0:	01c0006f          	j	c0004fec <strchr+0x28>
c0004fd4:	00b78a63          	beq	a5,a1,c0004fe8 <strchr+0x24>
c0004fd8:	00150513          	addi	a0,a0,1
c0004fdc:	00054783          	lbu	a5,0(a0)
c0004fe0:	fe079ae3          	bnez	a5,c0004fd4 <strchr+0x10>
c0004fe4:	00000513          	li	a0,0
c0004fe8:	00008067          	ret
c0004fec:	00008067          	ret

c0004ff0 <memset>:
c0004ff0:	00c50733          	add	a4,a0,a2
c0004ff4:	00050793          	mv	a5,a0
c0004ff8:	00060863          	beqz	a2,c0005008 <memset+0x18>
c0004ffc:	00178793          	addi	a5,a5,1
c0005000:	feb78fa3          	sb	a1,-1(a5)
c0005004:	fef71ce3          	bne	a4,a5,c0004ffc <memset+0xc>
c0005008:	00008067          	ret

c000500c <memcpy>:
c000500c:	00c586b3          	add	a3,a1,a2
c0005010:	00050793          	mv	a5,a0
c0005014:	00060c63          	beqz	a2,c000502c <memcpy+0x20>
c0005018:	00158593          	addi	a1,a1,1
c000501c:	fff5c703          	lbu	a4,-1(a1)
c0005020:	00178793          	addi	a5,a5,1
c0005024:	fee78fa3          	sb	a4,-1(a5)
c0005028:	feb698e3          	bne	a3,a1,c0005018 <memcpy+0xc>
c000502c:	00008067          	ret

c0005030 <printnum>:
c0005030:	fe010113          	addi	sp,sp,-32
c0005034:	00912a23          	sw	s1,20(sp)
c0005038:	01212823          	sw	s2,16(sp)
c000503c:	01312623          	sw	s3,12(sp)
c0005040:	01412423          	sw	s4,8(sp)
c0005044:	00112e23          	sw	ra,28(sp)
c0005048:	00812c23          	sw	s0,24(sp)
c000504c:	00050493          	mv	s1,a0
c0005050:	00058913          	mv	s2,a1
c0005054:	00080993          	mv	s3,a6
c0005058:	02e67a33          	remu	s4,a2,a4
c000505c:	04069e63          	bnez	a3,c00050b8 <printnum+0x88>
c0005060:	04e67c63          	bleu	a4,a2,c00050b8 <printnum+0x88>
c0005064:	fff78413          	addi	s0,a5,-1
c0005068:	00805c63          	blez	s0,c0005080 <printnum+0x50>
c000506c:	fff40413          	addi	s0,s0,-1
c0005070:	00090593          	mv	a1,s2
c0005074:	00098513          	mv	a0,s3
c0005078:	000480e7          	jalr	s1
c000507c:	fe0418e3          	bnez	s0,c000506c <printnum+0x3c>
c0005080:	00002797          	auipc	a5,0x2
c0005084:	26478793          	addi	a5,a5,612 # c00072e4 <error_string+0x1c>
c0005088:	014787b3          	add	a5,a5,s4
c000508c:	00090593          	mv	a1,s2
c0005090:	00048313          	mv	t1,s1
c0005094:	01c12083          	lw	ra,28(sp)
c0005098:	01812403          	lw	s0,24(sp)
c000509c:	01412483          	lw	s1,20(sp)
c00050a0:	01012903          	lw	s2,16(sp)
c00050a4:	00c12983          	lw	s3,12(sp)
c00050a8:	00812a03          	lw	s4,8(sp)
c00050ac:	0007c503          	lbu	a0,0(a5)
c00050b0:	02010113          	addi	sp,sp,32
c00050b4:	00030067          	jr	t1
c00050b8:	02e65633          	divu	a2,a2,a4
c00050bc:	00098813          	mv	a6,s3
c00050c0:	fff78793          	addi	a5,a5,-1
c00050c4:	00000693          	li	a3,0
c00050c8:	00090593          	mv	a1,s2
c00050cc:	00048513          	mv	a0,s1
c00050d0:	f61ff0ef          	jal	ra,c0005030 <printnum>
c00050d4:	fadff06f          	j	c0005080 <printnum+0x50>

c00050d8 <vprintfmt>:
c00050d8:	fb010113          	addi	sp,sp,-80
c00050dc:	05212023          	sw	s2,64(sp)
c00050e0:	03312e23          	sw	s3,60(sp)
c00050e4:	03412c23          	sw	s4,56(sp)
c00050e8:	03512a23          	sw	s5,52(sp)
c00050ec:	03612823          	sw	s6,48(sp)
c00050f0:	03712623          	sw	s7,44(sp)
c00050f4:	03812423          	sw	s8,40(sp)
c00050f8:	03912223          	sw	s9,36(sp)
c00050fc:	04112623          	sw	ra,76(sp)
c0005100:	04812423          	sw	s0,72(sp)
c0005104:	04912223          	sw	s1,68(sp)
c0005108:	03a12023          	sw	s10,32(sp)
c000510c:	01b12e23          	sw	s11,28(sp)
c0005110:	00050993          	mv	s3,a0
c0005114:	00058913          	mv	s2,a1
c0005118:	00060c93          	mv	s9,a2
c000511c:	00068a93          	mv	s5,a3
c0005120:	00002a17          	auipc	s4,0x2
c0005124:	050a0a13          	addi	s4,s4,80 # c0007170 <default_pmm_manager+0x730>
c0005128:	02800c13          	li	s8,40
c000512c:	fff00b13          	li	s6,-1
c0005130:	05e00b93          	li	s7,94
c0005134:	000cc503          	lbu	a0,0(s9)
c0005138:	02500493          	li	s1,37
c000513c:	001c8413          	addi	s0,s9,1
c0005140:	00950e63          	beq	a0,s1,c000515c <vprintfmt+0x84>
c0005144:	06050463          	beqz	a0,c00051ac <vprintfmt+0xd4>
c0005148:	00090593          	mv	a1,s2
c000514c:	00140413          	addi	s0,s0,1
c0005150:	000980e7          	jalr	s3
c0005154:	fff44503          	lbu	a0,-1(s0)
c0005158:	fe9516e3          	bne	a0,s1,c0005144 <vprintfmt+0x6c>
c000515c:	00044e03          	lbu	t3,0(s0)
c0005160:	fff00d13          	li	s10,-1
c0005164:	02000813          	li	a6,32
c0005168:	00000493          	li	s1,0
c000516c:	00000593          	li	a1,0
c0005170:	000d0d93          	mv	s11,s10
c0005174:	05500693          	li	a3,85
c0005178:	00100313          	li	t1,1
c000517c:	03000893          	li	a7,48
c0005180:	00900613          	li	a2,9
c0005184:	02d00513          	li	a0,45
c0005188:	fdde0713          	addi	a4,t3,-35
c000518c:	0ff77713          	andi	a4,a4,255
c0005190:	00140c93          	addi	s9,s0,1
c0005194:	32e6e463          	bltu	a3,a4,c00054bc <vprintfmt+0x3e4>
c0005198:	00271713          	slli	a4,a4,0x2
c000519c:	01470733          	add	a4,a4,s4
c00051a0:	00072783          	lw	a5,0(a4)
c00051a4:	014787b3          	add	a5,a5,s4
c00051a8:	00078067          	jr	a5
c00051ac:	04c12083          	lw	ra,76(sp)
c00051b0:	04812403          	lw	s0,72(sp)
c00051b4:	04412483          	lw	s1,68(sp)
c00051b8:	04012903          	lw	s2,64(sp)
c00051bc:	03c12983          	lw	s3,60(sp)
c00051c0:	03812a03          	lw	s4,56(sp)
c00051c4:	03412a83          	lw	s5,52(sp)
c00051c8:	03012b03          	lw	s6,48(sp)
c00051cc:	02c12b83          	lw	s7,44(sp)
c00051d0:	02812c03          	lw	s8,40(sp)
c00051d4:	02412c83          	lw	s9,36(sp)
c00051d8:	02012d03          	lw	s10,32(sp)
c00051dc:	01c12d83          	lw	s11,28(sp)
c00051e0:	05010113          	addi	sp,sp,80
c00051e4:	00008067          	ret
c00051e8:	00100793          	li	a5,1
c00051ec:	34b7c063          	blt	a5,a1,c000552c <vprintfmt+0x454>
c00051f0:	000aa603          	lw	a2,0(s5)
c00051f4:	00000693          	li	a3,0
c00051f8:	004a8a93          	addi	s5,s5,4
c00051fc:	01000713          	li	a4,16
c0005200:	000d8793          	mv	a5,s11
c0005204:	00090593          	mv	a1,s2
c0005208:	00098513          	mv	a0,s3
c000520c:	e25ff0ef          	jal	ra,c0005030 <printnum>
c0005210:	f25ff06f          	j	c0005134 <vprintfmt+0x5c>
c0005214:	00144e03          	lbu	t3,1(s0)
c0005218:	00030493          	mv	s1,t1
c000521c:	000c8413          	mv	s0,s9
c0005220:	f69ff06f          	j	c0005188 <vprintfmt+0xb0>
c0005224:	000aa503          	lw	a0,0(s5)
c0005228:	00090593          	mv	a1,s2
c000522c:	004a8a93          	addi	s5,s5,4
c0005230:	000980e7          	jalr	s3
c0005234:	f01ff06f          	j	c0005134 <vprintfmt+0x5c>
c0005238:	00100793          	li	a5,1
c000523c:	30b7c663          	blt	a5,a1,c0005548 <vprintfmt+0x470>
c0005240:	000aa603          	lw	a2,0(s5)
c0005244:	004a8a93          	addi	s5,s5,4
c0005248:	41f65693          	srai	a3,a2,0x1f
c000524c:	00a00713          	li	a4,10
c0005250:	fa06d8e3          	bgez	a3,c0005200 <vprintfmt+0x128>
c0005254:	00090593          	mv	a1,s2
c0005258:	02d00513          	li	a0,45
c000525c:	00d12623          	sw	a3,12(sp)
c0005260:	00c12423          	sw	a2,8(sp)
c0005264:	00e12223          	sw	a4,4(sp)
c0005268:	01012023          	sw	a6,0(sp)
c000526c:	000980e7          	jalr	s3
c0005270:	00812603          	lw	a2,8(sp)
c0005274:	00c12683          	lw	a3,12(sp)
c0005278:	00012803          	lw	a6,0(sp)
c000527c:	40c00633          	neg	a2,a2
c0005280:	00c037b3          	snez	a5,a2
c0005284:	40d006b3          	neg	a3,a3
c0005288:	40f686b3          	sub	a3,a3,a5
c000528c:	00412703          	lw	a4,4(sp)
c0005290:	f71ff06f          	j	c0005200 <vprintfmt+0x128>
c0005294:	000aa783          	lw	a5,0(s5)
c0005298:	00600693          	li	a3,6
c000529c:	004a8a93          	addi	s5,s5,4
c00052a0:	41f7d713          	srai	a4,a5,0x1f
c00052a4:	00f747b3          	xor	a5,a4,a5
c00052a8:	40e787b3          	sub	a5,a5,a4
c00052ac:	2af6ca63          	blt	a3,a5,c0005560 <vprintfmt+0x488>
c00052b0:	00279693          	slli	a3,a5,0x2
c00052b4:	00002717          	auipc	a4,0x2
c00052b8:	01470713          	addi	a4,a4,20 # c00072c8 <error_string>
c00052bc:	00d70733          	add	a4,a4,a3
c00052c0:	00072683          	lw	a3,0(a4)
c00052c4:	28068e63          	beqz	a3,c0005560 <vprintfmt+0x488>
c00052c8:	00000617          	auipc	a2,0x0
c00052cc:	38060613          	addi	a2,a2,896 # c0005648 <etext+0x24>
c00052d0:	00090593          	mv	a1,s2
c00052d4:	00098513          	mv	a0,s3
c00052d8:	314000ef          	jal	ra,c00055ec <printfmt>
c00052dc:	e59ff06f          	j	c0005134 <vprintfmt+0x5c>
c00052e0:	00144e03          	lbu	t3,1(s0)
c00052e4:	00158593          	addi	a1,a1,1
c00052e8:	000c8413          	mv	s0,s9
c00052ec:	e9dff06f          	j	c0005188 <vprintfmt+0xb0>
c00052f0:	00100793          	li	a5,1
c00052f4:	20b7c063          	blt	a5,a1,c00054f4 <vprintfmt+0x41c>
c00052f8:	000aa603          	lw	a2,0(s5)
c00052fc:	00000693          	li	a3,0
c0005300:	004a8a93          	addi	s5,s5,4
c0005304:	00800713          	li	a4,8
c0005308:	ef9ff06f          	j	c0005200 <vprintfmt+0x128>
c000530c:	03000513          	li	a0,48
c0005310:	00090593          	mv	a1,s2
c0005314:	01012023          	sw	a6,0(sp)
c0005318:	000980e7          	jalr	s3
c000531c:	00090593          	mv	a1,s2
c0005320:	07800513          	li	a0,120
c0005324:	000980e7          	jalr	s3
c0005328:	000aa603          	lw	a2,0(s5)
c000532c:	00000693          	li	a3,0
c0005330:	01000713          	li	a4,16
c0005334:	004a8a93          	addi	s5,s5,4
c0005338:	00012803          	lw	a6,0(sp)
c000533c:	ec5ff06f          	j	c0005200 <vprintfmt+0x128>
c0005340:	000aa403          	lw	s0,0(s5)
c0005344:	004a8793          	addi	a5,s5,4
c0005348:	00f12223          	sw	a5,4(sp)
c000534c:	24040863          	beqz	s0,c000559c <vprintfmt+0x4c4>
c0005350:	05b05263          	blez	s11,c0005394 <vprintfmt+0x2bc>
c0005354:	02d00793          	li	a5,45
c0005358:	22f80263          	beq	a6,a5,c000557c <vprintfmt+0x4a4>
c000535c:	000d0593          	mv	a1,s10
c0005360:	00040513          	mv	a0,s0
c0005364:	01012023          	sw	a6,0(sp)
c0005368:	bcdff0ef          	jal	ra,c0004f34 <strnlen>
c000536c:	40ad8db3          	sub	s11,s11,a0
c0005370:	03b05263          	blez	s11,c0005394 <vprintfmt+0x2bc>
c0005374:	00012803          	lw	a6,0(sp)
c0005378:	00080513          	mv	a0,a6
c000537c:	00090593          	mv	a1,s2
c0005380:	01012023          	sw	a6,0(sp)
c0005384:	fffd8d93          	addi	s11,s11,-1
c0005388:	000980e7          	jalr	s3
c000538c:	00012803          	lw	a6,0(sp)
c0005390:	fe0d94e3          	bnez	s11,c0005378 <vprintfmt+0x2a0>
c0005394:	00044783          	lbu	a5,0(s0)
c0005398:	00140a93          	addi	s5,s0,1
c000539c:	00078513          	mv	a0,a5
c00053a0:	04078c63          	beqz	a5,c00053f8 <vprintfmt+0x320>
c00053a4:	03f00413          	li	s0,63
c00053a8:	000d4663          	bltz	s10,c00053b4 <vprintfmt+0x2dc>
c00053ac:	fffd0d13          	addi	s10,s10,-1
c00053b0:	036d0663          	beq	s10,s6,c00053dc <vprintfmt+0x304>
c00053b4:	00090593          	mv	a1,s2
c00053b8:	00048663          	beqz	s1,c00053c4 <vprintfmt+0x2ec>
c00053bc:	fe078793          	addi	a5,a5,-32
c00053c0:	12fbe463          	bltu	s7,a5,c00054e8 <vprintfmt+0x410>
c00053c4:	000980e7          	jalr	s3
c00053c8:	001a8a93          	addi	s5,s5,1
c00053cc:	fffac783          	lbu	a5,-1(s5)
c00053d0:	fffd8d93          	addi	s11,s11,-1
c00053d4:	00078513          	mv	a0,a5
c00053d8:	fc0798e3          	bnez	a5,c00053a8 <vprintfmt+0x2d0>
c00053dc:	01b05e63          	blez	s11,c00053f8 <vprintfmt+0x320>
c00053e0:	02000413          	li	s0,32
c00053e4:	fffd8d93          	addi	s11,s11,-1
c00053e8:	00090593          	mv	a1,s2
c00053ec:	00040513          	mv	a0,s0
c00053f0:	000980e7          	jalr	s3
c00053f4:	fe0d98e3          	bnez	s11,c00053e4 <vprintfmt+0x30c>
c00053f8:	00412a83          	lw	s5,4(sp)
c00053fc:	d39ff06f          	j	c0005134 <vprintfmt+0x5c>
c0005400:	00100793          	li	a5,1
c0005404:	10b7c663          	blt	a5,a1,c0005510 <vprintfmt+0x438>
c0005408:	000aa603          	lw	a2,0(s5)
c000540c:	00000693          	li	a3,0
c0005410:	004a8a93          	addi	s5,s5,4
c0005414:	00a00713          	li	a4,10
c0005418:	de9ff06f          	j	c0005200 <vprintfmt+0x128>
c000541c:	00144e03          	lbu	t3,1(s0)
c0005420:	00050813          	mv	a6,a0
c0005424:	000c8413          	mv	s0,s9
c0005428:	d61ff06f          	j	c0005188 <vprintfmt+0xb0>
c000542c:	00090593          	mv	a1,s2
c0005430:	02500513          	li	a0,37
c0005434:	000980e7          	jalr	s3
c0005438:	cfdff06f          	j	c0005134 <vprintfmt+0x5c>
c000543c:	000aad03          	lw	s10,0(s5)
c0005440:	00144e03          	lbu	t3,1(s0)
c0005444:	004a8a93          	addi	s5,s5,4
c0005448:	000c8413          	mv	s0,s9
c000544c:	d20ddee3          	bgez	s11,c0005188 <vprintfmt+0xb0>
c0005450:	000d0d93          	mv	s11,s10
c0005454:	fff00d13          	li	s10,-1
c0005458:	d31ff06f          	j	c0005188 <vprintfmt+0xb0>
c000545c:	00144e03          	lbu	t3,1(s0)
c0005460:	00088813          	mv	a6,a7
c0005464:	000c8413          	mv	s0,s9
c0005468:	d21ff06f          	j	c0005188 <vprintfmt+0xb0>
c000546c:	00144703          	lbu	a4,1(s0)
c0005470:	fd0e0d13          	addi	s10,t3,-48
c0005474:	fd070793          	addi	a5,a4,-48
c0005478:	14f66863          	bltu	a2,a5,c00055c8 <vprintfmt+0x4f0>
c000547c:	000c8413          	mv	s0,s9
c0005480:	002d1793          	slli	a5,s10,0x2
c0005484:	01a78d33          	add	s10,a5,s10
c0005488:	00140413          	addi	s0,s0,1
c000548c:	001d1d13          	slli	s10,s10,0x1
c0005490:	00ed0d33          	add	s10,s10,a4
c0005494:	00044703          	lbu	a4,0(s0)
c0005498:	fd0d0d13          	addi	s10,s10,-48
c000549c:	fd070793          	addi	a5,a4,-48
c00054a0:	fef670e3          	bleu	a5,a2,c0005480 <vprintfmt+0x3a8>
c00054a4:	00070e13          	mv	t3,a4
c00054a8:	fa5ff06f          	j	c000544c <vprintfmt+0x374>
c00054ac:	0e0dc463          	bltz	s11,c0005594 <vprintfmt+0x4bc>
c00054b0:	00144e03          	lbu	t3,1(s0)
c00054b4:	000c8413          	mv	s0,s9
c00054b8:	cd1ff06f          	j	c0005188 <vprintfmt+0xb0>
c00054bc:	00090593          	mv	a1,s2
c00054c0:	02500513          	li	a0,37
c00054c4:	000980e7          	jalr	s3
c00054c8:	fff44783          	lbu	a5,-1(s0)
c00054cc:	02500713          	li	a4,37
c00054d0:	00040c93          	mv	s9,s0
c00054d4:	c6e780e3          	beq	a5,a4,c0005134 <vprintfmt+0x5c>
c00054d8:	fffc8c93          	addi	s9,s9,-1
c00054dc:	fffcc783          	lbu	a5,-1(s9)
c00054e0:	fee79ce3          	bne	a5,a4,c00054d8 <vprintfmt+0x400>
c00054e4:	c51ff06f          	j	c0005134 <vprintfmt+0x5c>
c00054e8:	00040513          	mv	a0,s0
c00054ec:	000980e7          	jalr	s3
c00054f0:	ed9ff06f          	j	c00053c8 <vprintfmt+0x2f0>
c00054f4:	007a8793          	addi	a5,s5,7
c00054f8:	ff87f793          	andi	a5,a5,-8
c00054fc:	00878a93          	addi	s5,a5,8
c0005500:	0007a603          	lw	a2,0(a5)
c0005504:	0047a683          	lw	a3,4(a5)
c0005508:	00800713          	li	a4,8
c000550c:	cf5ff06f          	j	c0005200 <vprintfmt+0x128>
c0005510:	007a8793          	addi	a5,s5,7
c0005514:	ff87f793          	andi	a5,a5,-8
c0005518:	00878a93          	addi	s5,a5,8
c000551c:	0007a603          	lw	a2,0(a5)
c0005520:	0047a683          	lw	a3,4(a5)
c0005524:	00a00713          	li	a4,10
c0005528:	cd9ff06f          	j	c0005200 <vprintfmt+0x128>
c000552c:	007a8793          	addi	a5,s5,7
c0005530:	ff87f793          	andi	a5,a5,-8
c0005534:	00878a93          	addi	s5,a5,8
c0005538:	0007a603          	lw	a2,0(a5)
c000553c:	0047a683          	lw	a3,4(a5)
c0005540:	01000713          	li	a4,16
c0005544:	cbdff06f          	j	c0005200 <vprintfmt+0x128>
c0005548:	007a8793          	addi	a5,s5,7
c000554c:	ff87f793          	andi	a5,a5,-8
c0005550:	00878a93          	addi	s5,a5,8
c0005554:	0007a603          	lw	a2,0(a5)
c0005558:	0047a683          	lw	a3,4(a5)
c000555c:	cf1ff06f          	j	c000524c <vprintfmt+0x174>
c0005560:	00078693          	mv	a3,a5
c0005564:	00002617          	auipc	a2,0x2
c0005568:	e0860613          	addi	a2,a2,-504 # c000736c <error_string+0xa4>
c000556c:	00090593          	mv	a1,s2
c0005570:	00098513          	mv	a0,s3
c0005574:	078000ef          	jal	ra,c00055ec <printfmt>
c0005578:	bbdff06f          	j	c0005134 <vprintfmt+0x5c>
c000557c:	00044783          	lbu	a5,0(s0)
c0005580:	00140a93          	addi	s5,s0,1
c0005584:	00078513          	mv	a0,a5
c0005588:	e4078ce3          	beqz	a5,c00053e0 <vprintfmt+0x308>
c000558c:	03f00413          	li	s0,63
c0005590:	e19ff06f          	j	c00053a8 <vprintfmt+0x2d0>
c0005594:	00000d93          	li	s11,0
c0005598:	f19ff06f          	j	c00054b0 <vprintfmt+0x3d8>
c000559c:	03b05c63          	blez	s11,c00055d4 <vprintfmt+0x4fc>
c00055a0:	02d00793          	li	a5,45
c00055a4:	00002417          	auipc	s0,0x2
c00055a8:	dc040413          	addi	s0,s0,-576 # c0007364 <error_string+0x9c>
c00055ac:	daf818e3          	bne	a6,a5,c000535c <vprintfmt+0x284>
c00055b0:	00002a97          	auipc	s5,0x2
c00055b4:	db5a8a93          	addi	s5,s5,-587 # c0007365 <error_string+0x9d>
c00055b8:	000c0513          	mv	a0,s8
c00055bc:	000c0793          	mv	a5,s8
c00055c0:	03f00413          	li	s0,63
c00055c4:	de5ff06f          	j	c00053a8 <vprintfmt+0x2d0>
c00055c8:	00070e13          	mv	t3,a4
c00055cc:	000c8413          	mv	s0,s9
c00055d0:	e7dff06f          	j	c000544c <vprintfmt+0x374>
c00055d4:	000c0793          	mv	a5,s8
c00055d8:	000c0513          	mv	a0,s8
c00055dc:	00002a97          	auipc	s5,0x2
c00055e0:	d89a8a93          	addi	s5,s5,-631 # c0007365 <error_string+0x9d>
c00055e4:	03f00413          	li	s0,63
c00055e8:	dc1ff06f          	j	c00053a8 <vprintfmt+0x2d0>

c00055ec <printfmt>:
c00055ec:	fc010113          	addi	sp,sp,-64
c00055f0:	02c10313          	addi	t1,sp,44
c00055f4:	02d12623          	sw	a3,44(sp)
c00055f8:	00030693          	mv	a3,t1
c00055fc:	00112e23          	sw	ra,28(sp)
c0005600:	02e12823          	sw	a4,48(sp)
c0005604:	02f12a23          	sw	a5,52(sp)
c0005608:	03012c23          	sw	a6,56(sp)
c000560c:	03112e23          	sw	a7,60(sp)
c0005610:	00612623          	sw	t1,12(sp)
c0005614:	ac5ff0ef          	jal	ra,c00050d8 <vprintfmt>
c0005618:	01c12083          	lw	ra,28(sp)
c000561c:	04010113          	addi	sp,sp,64
c0005620:	00008067          	ret
