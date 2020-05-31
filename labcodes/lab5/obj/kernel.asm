
bin/kernel:     file format elf32-littleriscv


Disassembly of section .text:

c0000000 <kern_entry>:
c0000000:	0000d117          	auipc	sp,0xd
c0000004:	00010113          	mv	sp,sp
c0000008:	0040006f          	j	c000000c <kern_init>

c000000c <kern_init>:
c000000c:	0002d517          	auipc	a0,0x2d
c0000010:	a1050513          	addi	a0,a0,-1520 # c002ca1c <edata>
c0000014:	00036617          	auipc	a2,0x36
c0000018:	f1860613          	addi	a2,a2,-232 # c0035f2c <end>
c000001c:	ff010113          	addi	sp,sp,-16 # c000cff0 <bootstack+0x1ff0>
c0000020:	40a60633          	sub	a2,a2,a0
c0000024:	00000593          	li	a1,0
c0000028:	00112623          	sw	ra,12(sp)
c000002c:	291070ef          	jal	ra,c0007abc <memset>
c0000030:	750000ef          	jal	ra,c0000780 <cons_init>
c0000034:	00008597          	auipc	a1,0x8
c0000038:	0d858593          	addi	a1,a1,216 # c000810c <etext>
c000003c:	00008517          	auipc	a0,0x8
c0000040:	0ec50513          	addi	a0,a0,236 # c0008128 <etext+0x1c>
c0000044:	094000ef          	jal	ra,c00000d8 <cprintf>
c0000048:	2fc000ef          	jal	ra,c0000344 <print_kerninfo>
c000004c:	7dd040ef          	jal	ra,c0005028 <pmm_init>
c0000050:	7c4000ef          	jal	ra,c0000814 <pic_init>
c0000054:	7d4000ef          	jal	ra,c0000828 <idt_init>
c0000058:	568010ef          	jal	ra,c00015c0 <vmm_init>
c000005c:	4f0070ef          	jal	ra,c000754c <proc_init>
c0000060:	620000ef          	jal	ra,c0000680 <ide_init>
c0000064:	7f0020ef          	jal	ra,c0002854 <swap_init>
c0000068:	6d0000ef          	jal	ra,c0000738 <clock_init>
c000006c:	7ac000ef          	jal	ra,c0000818 <intr_enable>
c0000070:	650070ef          	jal	ra,c00076c0 <cpu_idle>

c0000074 <cputch>:
c0000074:	ff010113          	addi	sp,sp,-16
c0000078:	00112623          	sw	ra,12(sp)
c000007c:	00812423          	sw	s0,8(sp)
c0000080:	00058413          	mv	s0,a1
c0000084:	700000ef          	jal	ra,c0000784 <cons_putc>
c0000088:	00042783          	lw	a5,0(s0)
c000008c:	00c12083          	lw	ra,12(sp)
c0000090:	00178793          	addi	a5,a5,1
c0000094:	00f42023          	sw	a5,0(s0)
c0000098:	00812403          	lw	s0,8(sp)
c000009c:	01010113          	addi	sp,sp,16
c00000a0:	00008067          	ret

c00000a4 <vcprintf>:
c00000a4:	fe010113          	addi	sp,sp,-32
c00000a8:	00058693          	mv	a3,a1
c00000ac:	00050613          	mv	a2,a0
c00000b0:	00c10593          	addi	a1,sp,12
c00000b4:	00000517          	auipc	a0,0x0
c00000b8:	fc050513          	addi	a0,a0,-64 # c0000074 <cputch>
c00000bc:	00112e23          	sw	ra,28(sp)
c00000c0:	00012623          	sw	zero,12(sp)
c00000c4:	2e1070ef          	jal	ra,c0007ba4 <vprintfmt>
c00000c8:	01c12083          	lw	ra,28(sp)
c00000cc:	00c12503          	lw	a0,12(sp)
c00000d0:	02010113          	addi	sp,sp,32
c00000d4:	00008067          	ret

c00000d8 <cprintf>:
c00000d8:	fc010113          	addi	sp,sp,-64
c00000dc:	02410313          	addi	t1,sp,36
c00000e0:	02b12223          	sw	a1,36(sp)
c00000e4:	02c12423          	sw	a2,40(sp)
c00000e8:	02d12623          	sw	a3,44(sp)
c00000ec:	00050613          	mv	a2,a0
c00000f0:	00c10593          	addi	a1,sp,12
c00000f4:	00000517          	auipc	a0,0x0
c00000f8:	f8050513          	addi	a0,a0,-128 # c0000074 <cputch>
c00000fc:	00030693          	mv	a3,t1
c0000100:	00112e23          	sw	ra,28(sp)
c0000104:	02e12823          	sw	a4,48(sp)
c0000108:	02f12a23          	sw	a5,52(sp)
c000010c:	03012c23          	sw	a6,56(sp)
c0000110:	03112e23          	sw	a7,60(sp)
c0000114:	00612423          	sw	t1,8(sp)
c0000118:	00012623          	sw	zero,12(sp)
c000011c:	289070ef          	jal	ra,c0007ba4 <vprintfmt>
c0000120:	01c12083          	lw	ra,28(sp)
c0000124:	00c12503          	lw	a0,12(sp)
c0000128:	04010113          	addi	sp,sp,64
c000012c:	00008067          	ret

c0000130 <cputchar>:
c0000130:	6540006f          	j	c0000784 <cons_putc>

c0000134 <getchar>:
c0000134:	ff010113          	addi	sp,sp,-16
c0000138:	00112623          	sw	ra,12(sp)
c000013c:	690000ef          	jal	ra,c00007cc <cons_getc>
c0000140:	fe050ee3          	beqz	a0,c000013c <getchar+0x8>
c0000144:	00c12083          	lw	ra,12(sp)
c0000148:	01010113          	addi	sp,sp,16
c000014c:	00008067          	ret

c0000150 <readline>:
c0000150:	fd010113          	addi	sp,sp,-48
c0000154:	02112623          	sw	ra,44(sp)
c0000158:	02812423          	sw	s0,40(sp)
c000015c:	02912223          	sw	s1,36(sp)
c0000160:	03212023          	sw	s2,32(sp)
c0000164:	01312e23          	sw	s3,28(sp)
c0000168:	01412c23          	sw	s4,24(sp)
c000016c:	01512a23          	sw	s5,20(sp)
c0000170:	01612823          	sw	s6,16(sp)
c0000174:	01712623          	sw	s7,12(sp)
c0000178:	00050a63          	beqz	a0,c000018c <readline+0x3c>
c000017c:	00050593          	mv	a1,a0
c0000180:	00008517          	auipc	a0,0x8
c0000184:	fb050513          	addi	a0,a0,-80 # c0008130 <etext+0x24>
c0000188:	f51ff0ef          	jal	ra,c00000d8 <cprintf>
c000018c:	00000493          	li	s1,0
c0000190:	01f00913          	li	s2,31
c0000194:	00d00993          	li	s3,13
c0000198:	00800a93          	li	s5,8
c000019c:	00a00b13          	li	s6,10
c00001a0:	3fe00a13          	li	s4,1022
c00001a4:	0002db97          	auipc	s7,0x2d
c00001a8:	87cb8b93          	addi	s7,s7,-1924 # c002ca20 <buf>
c00001ac:	f89ff0ef          	jal	ra,c0000134 <getchar>
c00001b0:	00050413          	mv	s0,a0
c00001b4:	06054863          	bltz	a0,c0000224 <readline+0xd4>
c00001b8:	06a95a63          	ble	a0,s2,c000022c <readline+0xdc>
c00001bc:	049a5663          	ble	s1,s4,c0000208 <readline+0xb8>
c00001c0:	ff3416e3          	bne	s0,s3,c00001ac <readline+0x5c>
c00001c4:	00040513          	mv	a0,s0
c00001c8:	f69ff0ef          	jal	ra,c0000130 <cputchar>
c00001cc:	0002d517          	auipc	a0,0x2d
c00001d0:	85450513          	addi	a0,a0,-1964 # c002ca20 <buf>
c00001d4:	009504b3          	add	s1,a0,s1
c00001d8:	00048023          	sb	zero,0(s1)
c00001dc:	02c12083          	lw	ra,44(sp)
c00001e0:	02812403          	lw	s0,40(sp)
c00001e4:	02412483          	lw	s1,36(sp)
c00001e8:	02012903          	lw	s2,32(sp)
c00001ec:	01c12983          	lw	s3,28(sp)
c00001f0:	01812a03          	lw	s4,24(sp)
c00001f4:	01412a83          	lw	s5,20(sp)
c00001f8:	01012b03          	lw	s6,16(sp)
c00001fc:	00c12b83          	lw	s7,12(sp)
c0000200:	03010113          	addi	sp,sp,48
c0000204:	00008067          	ret
c0000208:	f29ff0ef          	jal	ra,c0000130 <cputchar>
c000020c:	009b87b3          	add	a5,s7,s1
c0000210:	00878023          	sb	s0,0(a5)
c0000214:	f21ff0ef          	jal	ra,c0000134 <getchar>
c0000218:	00148493          	addi	s1,s1,1
c000021c:	00050413          	mv	s0,a0
c0000220:	f8055ce3          	bgez	a0,c00001b8 <readline+0x68>
c0000224:	00000513          	li	a0,0
c0000228:	fb5ff06f          	j	c00001dc <readline+0x8c>
c000022c:	01551a63          	bne	a0,s5,c0000240 <readline+0xf0>
c0000230:	f6048ee3          	beqz	s1,c00001ac <readline+0x5c>
c0000234:	efdff0ef          	jal	ra,c0000130 <cputchar>
c0000238:	fff48493          	addi	s1,s1,-1
c000023c:	f71ff06f          	j	c00001ac <readline+0x5c>
c0000240:	f96502e3          	beq	a0,s6,c00001c4 <readline+0x74>
c0000244:	f73414e3          	bne	s0,s3,c00001ac <readline+0x5c>
c0000248:	f7dff06f          	j	c00001c4 <readline+0x74>

c000024c <__panic>:
c000024c:	fc010113          	addi	sp,sp,-64
c0000250:	02f12a23          	sw	a5,52(sp)
c0000254:	00112e23          	sw	ra,28(sp)
c0000258:	00812c23          	sw	s0,24(sp)
c000025c:	02d12623          	sw	a3,44(sp)
c0000260:	02e12823          	sw	a4,48(sp)
c0000264:	03012c23          	sw	a6,56(sp)
c0000268:	03112e23          	sw	a7,60(sp)
c000026c:	00036797          	auipc	a5,0x36
c0000270:	bb47a783          	lw	a5,-1100(a5) # c0035e20 <is_panic>
c0000274:	00078e63          	beqz	a5,c0000290 <__panic+0x44>
c0000278:	3ffff317          	auipc	t1,0x3ffff
c000027c:	618300e7          	jalr	1560(t1) # fffff890 <sbi_shutdown>
c0000280:	5a0000ef          	jal	ra,c0000820 <intr_disable>
c0000284:	00000513          	li	a0,0
c0000288:	21c000ef          	jal	ra,c00004a4 <kmonitor>
c000028c:	ff9ff06f          	j	c0000284 <__panic+0x38>
c0000290:	00100713          	li	a4,1
c0000294:	00036797          	auipc	a5,0x36
c0000298:	b8c78793          	addi	a5,a5,-1140 # c0035e20 <is_panic>
c000029c:	00e7a023          	sw	a4,0(a5)
c00002a0:	00060413          	mv	s0,a2
c00002a4:	02c10793          	addi	a5,sp,44
c00002a8:	00058613          	mv	a2,a1
c00002ac:	00050593          	mv	a1,a0
c00002b0:	00008517          	auipc	a0,0x8
c00002b4:	e8450513          	addi	a0,a0,-380 # c0008134 <etext+0x28>
c00002b8:	00f12623          	sw	a5,12(sp)
c00002bc:	e1dff0ef          	jal	ra,c00000d8 <cprintf>
c00002c0:	00c12583          	lw	a1,12(sp)
c00002c4:	00040513          	mv	a0,s0
c00002c8:	dddff0ef          	jal	ra,c00000a4 <vcprintf>
c00002cc:	00009517          	auipc	a0,0x9
c00002d0:	7b450513          	addi	a0,a0,1972 # c0009a80 <default_pmm_manager+0x408>
c00002d4:	e05ff0ef          	jal	ra,c00000d8 <cprintf>
c00002d8:	fa1ff06f          	j	c0000278 <__panic+0x2c>

c00002dc <__warn>:
c00002dc:	fc010113          	addi	sp,sp,-64
c00002e0:	00812c23          	sw	s0,24(sp)
c00002e4:	02f12a23          	sw	a5,52(sp)
c00002e8:	00060413          	mv	s0,a2
c00002ec:	02c10793          	addi	a5,sp,44
c00002f0:	00058613          	mv	a2,a1
c00002f4:	00050593          	mv	a1,a0
c00002f8:	00008517          	auipc	a0,0x8
c00002fc:	e5850513          	addi	a0,a0,-424 # c0008150 <etext+0x44>
c0000300:	00112e23          	sw	ra,28(sp)
c0000304:	02d12623          	sw	a3,44(sp)
c0000308:	02e12823          	sw	a4,48(sp)
c000030c:	03012c23          	sw	a6,56(sp)
c0000310:	03112e23          	sw	a7,60(sp)
c0000314:	00f12623          	sw	a5,12(sp)
c0000318:	dc1ff0ef          	jal	ra,c00000d8 <cprintf>
c000031c:	00c12583          	lw	a1,12(sp)
c0000320:	00040513          	mv	a0,s0
c0000324:	d81ff0ef          	jal	ra,c00000a4 <vcprintf>
c0000328:	00009517          	auipc	a0,0x9
c000032c:	75850513          	addi	a0,a0,1880 # c0009a80 <default_pmm_manager+0x408>
c0000330:	da9ff0ef          	jal	ra,c00000d8 <cprintf>
c0000334:	01c12083          	lw	ra,28(sp)
c0000338:	01812403          	lw	s0,24(sp)
c000033c:	04010113          	addi	sp,sp,64
c0000340:	00008067          	ret

c0000344 <print_kerninfo>:
c0000344:	ff010113          	addi	sp,sp,-16
c0000348:	00008517          	auipc	a0,0x8
c000034c:	e5050513          	addi	a0,a0,-432 # c0008198 <etext+0x8c>
c0000350:	00112623          	sw	ra,12(sp)
c0000354:	d85ff0ef          	jal	ra,c00000d8 <cprintf>
c0000358:	00000597          	auipc	a1,0x0
c000035c:	cb458593          	addi	a1,a1,-844 # c000000c <kern_init>
c0000360:	00008517          	auipc	a0,0x8
c0000364:	e5450513          	addi	a0,a0,-428 # c00081b4 <etext+0xa8>
c0000368:	d71ff0ef          	jal	ra,c00000d8 <cprintf>
c000036c:	00008597          	auipc	a1,0x8
c0000370:	da058593          	addi	a1,a1,-608 # c000810c <etext>
c0000374:	00008517          	auipc	a0,0x8
c0000378:	e5c50513          	addi	a0,a0,-420 # c00081d0 <etext+0xc4>
c000037c:	d5dff0ef          	jal	ra,c00000d8 <cprintf>
c0000380:	0002c597          	auipc	a1,0x2c
c0000384:	69c58593          	addi	a1,a1,1692 # c002ca1c <edata>
c0000388:	00008517          	auipc	a0,0x8
c000038c:	e6450513          	addi	a0,a0,-412 # c00081ec <etext+0xe0>
c0000390:	d49ff0ef          	jal	ra,c00000d8 <cprintf>
c0000394:	00036597          	auipc	a1,0x36
c0000398:	b9858593          	addi	a1,a1,-1128 # c0035f2c <end>
c000039c:	00008517          	auipc	a0,0x8
c00003a0:	e6c50513          	addi	a0,a0,-404 # c0008208 <etext+0xfc>
c00003a4:	d35ff0ef          	jal	ra,c00000d8 <cprintf>
c00003a8:	00036597          	auipc	a1,0x36
c00003ac:	f8358593          	addi	a1,a1,-125 # c003632b <end+0x3ff>
c00003b0:	00000797          	auipc	a5,0x0
c00003b4:	c5c78793          	addi	a5,a5,-932 # c000000c <kern_init>
c00003b8:	40f587b3          	sub	a5,a1,a5
c00003bc:	41f7d593          	srai	a1,a5,0x1f
c00003c0:	3ff5f593          	andi	a1,a1,1023
c00003c4:	00c12083          	lw	ra,12(sp)
c00003c8:	00f585b3          	add	a1,a1,a5
c00003cc:	40a5d593          	srai	a1,a1,0xa
c00003d0:	00008517          	auipc	a0,0x8
c00003d4:	e5450513          	addi	a0,a0,-428 # c0008224 <etext+0x118>
c00003d8:	01010113          	addi	sp,sp,16
c00003dc:	cfdff06f          	j	c00000d8 <cprintf>

c00003e0 <print_stackframe>:
c00003e0:	ff010113          	addi	sp,sp,-16
c00003e4:	00008617          	auipc	a2,0x8
c00003e8:	d8c60613          	addi	a2,a2,-628 # c0008170 <etext+0x64>
c00003ec:	05b00593          	li	a1,91
c00003f0:	00008517          	auipc	a0,0x8
c00003f4:	d9450513          	addi	a0,a0,-620 # c0008184 <etext+0x78>
c00003f8:	00112623          	sw	ra,12(sp)
c00003fc:	e51ff0ef          	jal	ra,c000024c <__panic>

c0000400 <mon_help>:
c0000400:	ff010113          	addi	sp,sp,-16
c0000404:	00008617          	auipc	a2,0x8
c0000408:	f0460613          	addi	a2,a2,-252 # c0008308 <commands+0xb8>
c000040c:	00008597          	auipc	a1,0x8
c0000410:	f1c58593          	addi	a1,a1,-228 # c0008328 <commands+0xd8>
c0000414:	00008517          	auipc	a0,0x8
c0000418:	f1c50513          	addi	a0,a0,-228 # c0008330 <commands+0xe0>
c000041c:	00112623          	sw	ra,12(sp)
c0000420:	cb9ff0ef          	jal	ra,c00000d8 <cprintf>
c0000424:	00008617          	auipc	a2,0x8
c0000428:	f1860613          	addi	a2,a2,-232 # c000833c <commands+0xec>
c000042c:	00008597          	auipc	a1,0x8
c0000430:	f3858593          	addi	a1,a1,-200 # c0008364 <commands+0x114>
c0000434:	00008517          	auipc	a0,0x8
c0000438:	efc50513          	addi	a0,a0,-260 # c0008330 <commands+0xe0>
c000043c:	c9dff0ef          	jal	ra,c00000d8 <cprintf>
c0000440:	00008617          	auipc	a2,0x8
c0000444:	f3060613          	addi	a2,a2,-208 # c0008370 <commands+0x120>
c0000448:	00008597          	auipc	a1,0x8
c000044c:	f4858593          	addi	a1,a1,-184 # c0008390 <commands+0x140>
c0000450:	00008517          	auipc	a0,0x8
c0000454:	ee050513          	addi	a0,a0,-288 # c0008330 <commands+0xe0>
c0000458:	c81ff0ef          	jal	ra,c00000d8 <cprintf>
c000045c:	00c12083          	lw	ra,12(sp)
c0000460:	00000513          	li	a0,0
c0000464:	01010113          	addi	sp,sp,16
c0000468:	00008067          	ret

c000046c <mon_kerninfo>:
c000046c:	ff010113          	addi	sp,sp,-16
c0000470:	00112623          	sw	ra,12(sp)
c0000474:	ed1ff0ef          	jal	ra,c0000344 <print_kerninfo>
c0000478:	00c12083          	lw	ra,12(sp)
c000047c:	00000513          	li	a0,0
c0000480:	01010113          	addi	sp,sp,16
c0000484:	00008067          	ret

c0000488 <mon_backtrace>:
c0000488:	ff010113          	addi	sp,sp,-16
c000048c:	00112623          	sw	ra,12(sp)
c0000490:	f51ff0ef          	jal	ra,c00003e0 <print_stackframe>
c0000494:	00c12083          	lw	ra,12(sp)
c0000498:	00000513          	li	a0,0
c000049c:	01010113          	addi	sp,sp,16
c00004a0:	00008067          	ret

c00004a4 <kmonitor>:
c00004a4:	f9010113          	addi	sp,sp,-112
c00004a8:	05812423          	sw	s8,72(sp)
c00004ac:	00050c13          	mv	s8,a0
c00004b0:	00008517          	auipc	a0,0x8
c00004b4:	dc450513          	addi	a0,a0,-572 # c0008274 <commands+0x24>
c00004b8:	06112623          	sw	ra,108(sp)
c00004bc:	06812423          	sw	s0,104(sp)
c00004c0:	06912223          	sw	s1,100(sp)
c00004c4:	07212023          	sw	s2,96(sp)
c00004c8:	05312e23          	sw	s3,92(sp)
c00004cc:	05412c23          	sw	s4,88(sp)
c00004d0:	05512a23          	sw	s5,84(sp)
c00004d4:	05612823          	sw	s6,80(sp)
c00004d8:	05712623          	sw	s7,76(sp)
c00004dc:	05912223          	sw	s9,68(sp)
c00004e0:	05a12023          	sw	s10,64(sp)
c00004e4:	bf5ff0ef          	jal	ra,c00000d8 <cprintf>
c00004e8:	00008517          	auipc	a0,0x8
c00004ec:	db450513          	addi	a0,a0,-588 # c000829c <commands+0x4c>
c00004f0:	be9ff0ef          	jal	ra,c00000d8 <cprintf>
c00004f4:	000c0663          	beqz	s8,c0000500 <kmonitor+0x5c>
c00004f8:	000c0513          	mv	a0,s8
c00004fc:	560000ef          	jal	ra,c0000a5c <print_trapframe>
c0000500:	00008c97          	auipc	s9,0x8
c0000504:	d50c8c93          	addi	s9,s9,-688 # c0008250 <commands>
c0000508:	00008997          	auipc	s3,0x8
c000050c:	dbc98993          	addi	s3,s3,-580 # c00082c4 <commands+0x74>
c0000510:	00008497          	auipc	s1,0x8
c0000514:	db848493          	addi	s1,s1,-584 # c00082c8 <commands+0x78>
c0000518:	00f00a13          	li	s4,15
c000051c:	01000b93          	li	s7,16
c0000520:	00008b17          	auipc	s6,0x8
c0000524:	db0b0b13          	addi	s6,s6,-592 # c00082d0 <commands+0x80>
c0000528:	00300a93          	li	s5,3
c000052c:	00098513          	mv	a0,s3
c0000530:	c21ff0ef          	jal	ra,c0000150 <readline>
c0000534:	00050413          	mv	s0,a0
c0000538:	fe050ae3          	beqz	a0,c000052c <kmonitor+0x88>
c000053c:	00054583          	lbu	a1,0(a0)
c0000540:	00000913          	li	s2,0
c0000544:	0a059463          	bnez	a1,c00005ec <kmonitor+0x148>
c0000548:	fe0902e3          	beqz	s2,c000052c <kmonitor+0x88>
c000054c:	00012583          	lw	a1,0(sp)
c0000550:	00008d17          	auipc	s10,0x8
c0000554:	d00d0d13          	addi	s10,s10,-768 # c0008250 <commands>
c0000558:	00008517          	auipc	a0,0x8
c000055c:	dd050513          	addi	a0,a0,-560 # c0008328 <commands+0xd8>
c0000560:	00000413          	li	s0,0
c0000564:	00cd0d13          	addi	s10,s10,12
c0000568:	4f4070ef          	jal	ra,c0007a5c <strcmp>
c000056c:	02050063          	beqz	a0,c000058c <kmonitor+0xe8>
c0000570:	00140413          	addi	s0,s0,1
c0000574:	0f540c63          	beq	s0,s5,c000066c <kmonitor+0x1c8>
c0000578:	000d2503          	lw	a0,0(s10)
c000057c:	00012583          	lw	a1,0(sp)
c0000580:	00cd0d13          	addi	s10,s10,12
c0000584:	4d8070ef          	jal	ra,c0007a5c <strcmp>
c0000588:	fe0514e3          	bnez	a0,c0000570 <kmonitor+0xcc>
c000058c:	00141793          	slli	a5,s0,0x1
c0000590:	008787b3          	add	a5,a5,s0
c0000594:	00279793          	slli	a5,a5,0x2
c0000598:	00fc87b3          	add	a5,s9,a5
c000059c:	0087a783          	lw	a5,8(a5)
c00005a0:	000c0613          	mv	a2,s8
c00005a4:	00410593          	addi	a1,sp,4
c00005a8:	fff90513          	addi	a0,s2,-1
c00005ac:	000780e7          	jalr	a5
c00005b0:	f6055ee3          	bgez	a0,c000052c <kmonitor+0x88>
c00005b4:	06c12083          	lw	ra,108(sp)
c00005b8:	06812403          	lw	s0,104(sp)
c00005bc:	06412483          	lw	s1,100(sp)
c00005c0:	06012903          	lw	s2,96(sp)
c00005c4:	05c12983          	lw	s3,92(sp)
c00005c8:	05812a03          	lw	s4,88(sp)
c00005cc:	05412a83          	lw	s5,84(sp)
c00005d0:	05012b03          	lw	s6,80(sp)
c00005d4:	04c12b83          	lw	s7,76(sp)
c00005d8:	04812c03          	lw	s8,72(sp)
c00005dc:	04412c83          	lw	s9,68(sp)
c00005e0:	04012d03          	lw	s10,64(sp)
c00005e4:	07010113          	addi	sp,sp,112
c00005e8:	00008067          	ret
c00005ec:	00048513          	mv	a0,s1
c00005f0:	4a0070ef          	jal	ra,c0007a90 <strchr>
c00005f4:	00050c63          	beqz	a0,c000060c <kmonitor+0x168>
c00005f8:	00144583          	lbu	a1,1(s0)
c00005fc:	00040023          	sb	zero,0(s0)
c0000600:	00140413          	addi	s0,s0,1
c0000604:	f40582e3          	beqz	a1,c0000548 <kmonitor+0xa4>
c0000608:	fe5ff06f          	j	c00005ec <kmonitor+0x148>
c000060c:	00044783          	lbu	a5,0(s0)
c0000610:	f2078ce3          	beqz	a5,c0000548 <kmonitor+0xa4>
c0000614:	05490463          	beq	s2,s4,c000065c <kmonitor+0x1b8>
c0000618:	00291793          	slli	a5,s2,0x2
c000061c:	04010713          	addi	a4,sp,64
c0000620:	00f707b3          	add	a5,a4,a5
c0000624:	fc87a023          	sw	s0,-64(a5)
c0000628:	00044583          	lbu	a1,0(s0)
c000062c:	00190913          	addi	s2,s2,1
c0000630:	00059a63          	bnez	a1,c0000644 <kmonitor+0x1a0>
c0000634:	f19ff06f          	j	c000054c <kmonitor+0xa8>
c0000638:	00140413          	addi	s0,s0,1
c000063c:	00044583          	lbu	a1,0(s0)
c0000640:	f00586e3          	beqz	a1,c000054c <kmonitor+0xa8>
c0000644:	00048513          	mv	a0,s1
c0000648:	448070ef          	jal	ra,c0007a90 <strchr>
c000064c:	fe0506e3          	beqz	a0,c0000638 <kmonitor+0x194>
c0000650:	00044583          	lbu	a1,0(s0)
c0000654:	ee058ae3          	beqz	a1,c0000548 <kmonitor+0xa4>
c0000658:	f95ff06f          	j	c00005ec <kmonitor+0x148>
c000065c:	000b8593          	mv	a1,s7
c0000660:	000b0513          	mv	a0,s6
c0000664:	a75ff0ef          	jal	ra,c00000d8 <cprintf>
c0000668:	fb1ff06f          	j	c0000618 <kmonitor+0x174>
c000066c:	00012583          	lw	a1,0(sp)
c0000670:	00008517          	auipc	a0,0x8
c0000674:	c8050513          	addi	a0,a0,-896 # c00082f0 <commands+0xa0>
c0000678:	a61ff0ef          	jal	ra,c00000d8 <cprintf>
c000067c:	eb1ff06f          	j	c000052c <kmonitor+0x88>

c0000680 <ide_init>:
c0000680:	00008067          	ret

c0000684 <ide_device_valid>:
c0000684:	00253513          	sltiu	a0,a0,2
c0000688:	00008067          	ret

c000068c <ide_device_size>:
c000068c:	03800513          	li	a0,56
c0000690:	00008067          	ret

c0000694 <ide_read_secs>:
c0000694:	0002c797          	auipc	a5,0x2c
c0000698:	78c78793          	addi	a5,a5,1932 # c002ce20 <ide>
c000069c:	00959593          	slli	a1,a1,0x9
c00006a0:	ff010113          	addi	sp,sp,-16
c00006a4:	00060513          	mv	a0,a2
c00006a8:	00b785b3          	add	a1,a5,a1
c00006ac:	00969613          	slli	a2,a3,0x9
c00006b0:	00112623          	sw	ra,12(sp)
c00006b4:	424070ef          	jal	ra,c0007ad8 <memcpy>
c00006b8:	00c12083          	lw	ra,12(sp)
c00006bc:	00000513          	li	a0,0
c00006c0:	01010113          	addi	sp,sp,16
c00006c4:	00008067          	ret

c00006c8 <ide_write_secs>:
c00006c8:	00060713          	mv	a4,a2
c00006cc:	00959793          	slli	a5,a1,0x9
c00006d0:	0002c517          	auipc	a0,0x2c
c00006d4:	75050513          	addi	a0,a0,1872 # c002ce20 <ide>
c00006d8:	ff010113          	addi	sp,sp,-16
c00006dc:	00969613          	slli	a2,a3,0x9
c00006e0:	00070593          	mv	a1,a4
c00006e4:	00f50533          	add	a0,a0,a5
c00006e8:	00112623          	sw	ra,12(sp)
c00006ec:	3ec070ef          	jal	ra,c0007ad8 <memcpy>
c00006f0:	00c12083          	lw	ra,12(sp)
c00006f4:	00000513          	li	a0,0
c00006f8:	01010113          	addi	sp,sp,16
c00006fc:	00008067          	ret

c0000700 <clock_set_next_event>:
c0000700:	c81027f3          	rdtimeh	a5
c0000704:	c01025f3          	rdtime	a1
c0000708:	c8102773          	rdtimeh	a4
c000070c:	fee79ae3          	bne	a5,a4,c0000700 <clock_set_next_event>
c0000710:	00035717          	auipc	a4,0x35
c0000714:	71870713          	addi	a4,a4,1816 # c0035e28 <timebase>
c0000718:	00072503          	lw	a0,0(a4)
c000071c:	00472703          	lw	a4,4(a4)
c0000720:	00a58533          	add	a0,a1,a0
c0000724:	00b535b3          	sltu	a1,a0,a1
c0000728:	00e787b3          	add	a5,a5,a4
c000072c:	00f585b3          	add	a1,a1,a5
c0000730:	3ffff317          	auipc	t1,0x3ffff
c0000734:	17030067          	jr	368(t1) # fffff8a0 <sbi_set_timer>

c0000738 <clock_init>:
c0000738:	ff010113          	addi	sp,sp,-16
c000073c:	00112623          	sw	ra,12(sp)
c0000740:	3ffff317          	auipc	t1,0x3ffff
c0000744:	140300e7          	jalr	320(t1) # fffff880 <sbi_timebase>
c0000748:	1f400793          	li	a5,500
c000074c:	02f55533          	divu	a0,a0,a5
c0000750:	00035797          	auipc	a5,0x35
c0000754:	6d878793          	addi	a5,a5,1752 # c0035e28 <timebase>
c0000758:	0007a223          	sw	zero,4(a5)
c000075c:	00a7a023          	sw	a0,0(a5)
c0000760:	fa1ff0ef          	jal	ra,c0000700 <clock_set_next_event>
c0000764:	00c12083          	lw	ra,12(sp)
c0000768:	00008517          	auipc	a0,0x8
c000076c:	c3450513          	addi	a0,a0,-972 # c000839c <commands+0x14c>
c0000770:	00035297          	auipc	t0,0x35
c0000774:	6e02a623          	sw	zero,1772(t0) # c0035e5c <ticks>
c0000778:	01010113          	addi	sp,sp,16
c000077c:	95dff06f          	j	c00000d8 <cprintf>

c0000780 <cons_init>:
c0000780:	00008067          	ret

c0000784 <cons_putc>:
c0000784:	100027f3          	csrr	a5,sstatus
c0000788:	0027f793          	andi	a5,a5,2
c000078c:	00079863          	bnez	a5,c000079c <cons_putc+0x18>
c0000790:	0ff57513          	andi	a0,a0,255
c0000794:	3ffff317          	auipc	t1,0x3ffff
c0000798:	09c30067          	jr	156(t1) # fffff830 <sbi_console_putchar>
c000079c:	ff010113          	addi	sp,sp,-16
c00007a0:	00112623          	sw	ra,12(sp)
c00007a4:	00812423          	sw	s0,8(sp)
c00007a8:	00050413          	mv	s0,a0
c00007ac:	074000ef          	jal	ra,c0000820 <intr_disable>
c00007b0:	0ff47513          	andi	a0,s0,255
c00007b4:	3ffff317          	auipc	t1,0x3ffff
c00007b8:	07c300e7          	jalr	124(t1) # fffff830 <sbi_console_putchar>
c00007bc:	00c12083          	lw	ra,12(sp)
c00007c0:	00812403          	lw	s0,8(sp)
c00007c4:	01010113          	addi	sp,sp,16
c00007c8:	0500006f          	j	c0000818 <intr_enable>

c00007cc <cons_getc>:
c00007cc:	100027f3          	csrr	a5,sstatus
c00007d0:	0027f793          	andi	a5,a5,2
c00007d4:	00079663          	bnez	a5,c00007e0 <cons_getc+0x14>
c00007d8:	3ffff317          	auipc	t1,0x3ffff
c00007dc:	06830067          	jr	104(t1) # fffff840 <sbi_console_getchar>
c00007e0:	ff010113          	addi	sp,sp,-16
c00007e4:	00112623          	sw	ra,12(sp)
c00007e8:	00812423          	sw	s0,8(sp)
c00007ec:	034000ef          	jal	ra,c0000820 <intr_disable>
c00007f0:	3ffff317          	auipc	t1,0x3ffff
c00007f4:	050300e7          	jalr	80(t1) # fffff840 <sbi_console_getchar>
c00007f8:	00050413          	mv	s0,a0
c00007fc:	01c000ef          	jal	ra,c0000818 <intr_enable>
c0000800:	00c12083          	lw	ra,12(sp)
c0000804:	00040513          	mv	a0,s0
c0000808:	00812403          	lw	s0,8(sp)
c000080c:	01010113          	addi	sp,sp,16
c0000810:	00008067          	ret

c0000814 <pic_init>:
c0000814:	00008067          	ret

c0000818 <intr_enable>:
c0000818:	100167f3          	csrrsi	a5,sstatus,2
c000081c:	00008067          	ret

c0000820 <intr_disable>:
c0000820:	100177f3          	csrrci	a5,sstatus,2
c0000824:	00008067          	ret

c0000828 <idt_init>:
c0000828:	14005073          	csrwi	sscratch,0
c000082c:	00000797          	auipc	a5,0x0
c0000830:	6f478793          	addi	a5,a5,1780 # c0000f20 <__alltraps>
c0000834:	10579073          	csrw	stvec,a5
c0000838:	100167f3          	csrrsi	a5,sstatus,2
c000083c:	00008067          	ret

c0000840 <print_regs>:
c0000840:	00052583          	lw	a1,0(a0)
c0000844:	ff010113          	addi	sp,sp,-16
c0000848:	00812423          	sw	s0,8(sp)
c000084c:	00050413          	mv	s0,a0
c0000850:	00008517          	auipc	a0,0x8
c0000854:	e2850513          	addi	a0,a0,-472 # c0008678 <commands+0x428>
c0000858:	00112623          	sw	ra,12(sp)
c000085c:	87dff0ef          	jal	ra,c00000d8 <cprintf>
c0000860:	00442583          	lw	a1,4(s0)
c0000864:	00008517          	auipc	a0,0x8
c0000868:	e2850513          	addi	a0,a0,-472 # c000868c <commands+0x43c>
c000086c:	86dff0ef          	jal	ra,c00000d8 <cprintf>
c0000870:	00842583          	lw	a1,8(s0)
c0000874:	00008517          	auipc	a0,0x8
c0000878:	e2c50513          	addi	a0,a0,-468 # c00086a0 <commands+0x450>
c000087c:	85dff0ef          	jal	ra,c00000d8 <cprintf>
c0000880:	00c42583          	lw	a1,12(s0)
c0000884:	00008517          	auipc	a0,0x8
c0000888:	e3050513          	addi	a0,a0,-464 # c00086b4 <commands+0x464>
c000088c:	84dff0ef          	jal	ra,c00000d8 <cprintf>
c0000890:	01042583          	lw	a1,16(s0)
c0000894:	00008517          	auipc	a0,0x8
c0000898:	e3450513          	addi	a0,a0,-460 # c00086c8 <commands+0x478>
c000089c:	83dff0ef          	jal	ra,c00000d8 <cprintf>
c00008a0:	01442583          	lw	a1,20(s0)
c00008a4:	00008517          	auipc	a0,0x8
c00008a8:	e3850513          	addi	a0,a0,-456 # c00086dc <commands+0x48c>
c00008ac:	82dff0ef          	jal	ra,c00000d8 <cprintf>
c00008b0:	01842583          	lw	a1,24(s0)
c00008b4:	00008517          	auipc	a0,0x8
c00008b8:	e3c50513          	addi	a0,a0,-452 # c00086f0 <commands+0x4a0>
c00008bc:	81dff0ef          	jal	ra,c00000d8 <cprintf>
c00008c0:	01c42583          	lw	a1,28(s0)
c00008c4:	00008517          	auipc	a0,0x8
c00008c8:	e4050513          	addi	a0,a0,-448 # c0008704 <commands+0x4b4>
c00008cc:	80dff0ef          	jal	ra,c00000d8 <cprintf>
c00008d0:	02042583          	lw	a1,32(s0)
c00008d4:	00008517          	auipc	a0,0x8
c00008d8:	e4450513          	addi	a0,a0,-444 # c0008718 <commands+0x4c8>
c00008dc:	ffcff0ef          	jal	ra,c00000d8 <cprintf>
c00008e0:	02442583          	lw	a1,36(s0)
c00008e4:	00008517          	auipc	a0,0x8
c00008e8:	e4850513          	addi	a0,a0,-440 # c000872c <commands+0x4dc>
c00008ec:	fecff0ef          	jal	ra,c00000d8 <cprintf>
c00008f0:	02842583          	lw	a1,40(s0)
c00008f4:	00008517          	auipc	a0,0x8
c00008f8:	e4c50513          	addi	a0,a0,-436 # c0008740 <commands+0x4f0>
c00008fc:	fdcff0ef          	jal	ra,c00000d8 <cprintf>
c0000900:	02c42583          	lw	a1,44(s0)
c0000904:	00008517          	auipc	a0,0x8
c0000908:	e5050513          	addi	a0,a0,-432 # c0008754 <commands+0x504>
c000090c:	fccff0ef          	jal	ra,c00000d8 <cprintf>
c0000910:	03042583          	lw	a1,48(s0)
c0000914:	00008517          	auipc	a0,0x8
c0000918:	e5450513          	addi	a0,a0,-428 # c0008768 <commands+0x518>
c000091c:	fbcff0ef          	jal	ra,c00000d8 <cprintf>
c0000920:	03442583          	lw	a1,52(s0)
c0000924:	00008517          	auipc	a0,0x8
c0000928:	e5850513          	addi	a0,a0,-424 # c000877c <commands+0x52c>
c000092c:	facff0ef          	jal	ra,c00000d8 <cprintf>
c0000930:	03842583          	lw	a1,56(s0)
c0000934:	00008517          	auipc	a0,0x8
c0000938:	e5c50513          	addi	a0,a0,-420 # c0008790 <commands+0x540>
c000093c:	f9cff0ef          	jal	ra,c00000d8 <cprintf>
c0000940:	03c42583          	lw	a1,60(s0)
c0000944:	00008517          	auipc	a0,0x8
c0000948:	e6050513          	addi	a0,a0,-416 # c00087a4 <commands+0x554>
c000094c:	f8cff0ef          	jal	ra,c00000d8 <cprintf>
c0000950:	04042583          	lw	a1,64(s0)
c0000954:	00008517          	auipc	a0,0x8
c0000958:	e6450513          	addi	a0,a0,-412 # c00087b8 <commands+0x568>
c000095c:	f7cff0ef          	jal	ra,c00000d8 <cprintf>
c0000960:	04442583          	lw	a1,68(s0)
c0000964:	00008517          	auipc	a0,0x8
c0000968:	e6850513          	addi	a0,a0,-408 # c00087cc <commands+0x57c>
c000096c:	f6cff0ef          	jal	ra,c00000d8 <cprintf>
c0000970:	04842583          	lw	a1,72(s0)
c0000974:	00008517          	auipc	a0,0x8
c0000978:	e6c50513          	addi	a0,a0,-404 # c00087e0 <commands+0x590>
c000097c:	f5cff0ef          	jal	ra,c00000d8 <cprintf>
c0000980:	04c42583          	lw	a1,76(s0)
c0000984:	00008517          	auipc	a0,0x8
c0000988:	e7050513          	addi	a0,a0,-400 # c00087f4 <commands+0x5a4>
c000098c:	f4cff0ef          	jal	ra,c00000d8 <cprintf>
c0000990:	05042583          	lw	a1,80(s0)
c0000994:	00008517          	auipc	a0,0x8
c0000998:	e7450513          	addi	a0,a0,-396 # c0008808 <commands+0x5b8>
c000099c:	f3cff0ef          	jal	ra,c00000d8 <cprintf>
c00009a0:	05442583          	lw	a1,84(s0)
c00009a4:	00008517          	auipc	a0,0x8
c00009a8:	e7850513          	addi	a0,a0,-392 # c000881c <commands+0x5cc>
c00009ac:	f2cff0ef          	jal	ra,c00000d8 <cprintf>
c00009b0:	05842583          	lw	a1,88(s0)
c00009b4:	00008517          	auipc	a0,0x8
c00009b8:	e7c50513          	addi	a0,a0,-388 # c0008830 <commands+0x5e0>
c00009bc:	f1cff0ef          	jal	ra,c00000d8 <cprintf>
c00009c0:	05c42583          	lw	a1,92(s0)
c00009c4:	00008517          	auipc	a0,0x8
c00009c8:	e8050513          	addi	a0,a0,-384 # c0008844 <commands+0x5f4>
c00009cc:	f0cff0ef          	jal	ra,c00000d8 <cprintf>
c00009d0:	06042583          	lw	a1,96(s0)
c00009d4:	00008517          	auipc	a0,0x8
c00009d8:	e8450513          	addi	a0,a0,-380 # c0008858 <commands+0x608>
c00009dc:	efcff0ef          	jal	ra,c00000d8 <cprintf>
c00009e0:	06442583          	lw	a1,100(s0)
c00009e4:	00008517          	auipc	a0,0x8
c00009e8:	e8850513          	addi	a0,a0,-376 # c000886c <commands+0x61c>
c00009ec:	eecff0ef          	jal	ra,c00000d8 <cprintf>
c00009f0:	06842583          	lw	a1,104(s0)
c00009f4:	00008517          	auipc	a0,0x8
c00009f8:	e8c50513          	addi	a0,a0,-372 # c0008880 <commands+0x630>
c00009fc:	edcff0ef          	jal	ra,c00000d8 <cprintf>
c0000a00:	06c42583          	lw	a1,108(s0)
c0000a04:	00008517          	auipc	a0,0x8
c0000a08:	e9050513          	addi	a0,a0,-368 # c0008894 <commands+0x644>
c0000a0c:	eccff0ef          	jal	ra,c00000d8 <cprintf>
c0000a10:	07042583          	lw	a1,112(s0)
c0000a14:	00008517          	auipc	a0,0x8
c0000a18:	e9450513          	addi	a0,a0,-364 # c00088a8 <commands+0x658>
c0000a1c:	ebcff0ef          	jal	ra,c00000d8 <cprintf>
c0000a20:	07442583          	lw	a1,116(s0)
c0000a24:	00008517          	auipc	a0,0x8
c0000a28:	e9850513          	addi	a0,a0,-360 # c00088bc <commands+0x66c>
c0000a2c:	eacff0ef          	jal	ra,c00000d8 <cprintf>
c0000a30:	07842583          	lw	a1,120(s0)
c0000a34:	00008517          	auipc	a0,0x8
c0000a38:	e9c50513          	addi	a0,a0,-356 # c00088d0 <commands+0x680>
c0000a3c:	e9cff0ef          	jal	ra,c00000d8 <cprintf>
c0000a40:	07c42583          	lw	a1,124(s0)
c0000a44:	00c12083          	lw	ra,12(sp)
c0000a48:	00812403          	lw	s0,8(sp)
c0000a4c:	00008517          	auipc	a0,0x8
c0000a50:	e9850513          	addi	a0,a0,-360 # c00088e4 <commands+0x694>
c0000a54:	01010113          	addi	sp,sp,16
c0000a58:	e80ff06f          	j	c00000d8 <cprintf>

c0000a5c <print_trapframe>:
c0000a5c:	ff010113          	addi	sp,sp,-16
c0000a60:	00050593          	mv	a1,a0
c0000a64:	00812423          	sw	s0,8(sp)
c0000a68:	00050413          	mv	s0,a0
c0000a6c:	00008517          	auipc	a0,0x8
c0000a70:	e8c50513          	addi	a0,a0,-372 # c00088f8 <commands+0x6a8>
c0000a74:	00112623          	sw	ra,12(sp)
c0000a78:	e60ff0ef          	jal	ra,c00000d8 <cprintf>
c0000a7c:	00040513          	mv	a0,s0
c0000a80:	dc1ff0ef          	jal	ra,c0000840 <print_regs>
c0000a84:	08042583          	lw	a1,128(s0)
c0000a88:	00008517          	auipc	a0,0x8
c0000a8c:	e8450513          	addi	a0,a0,-380 # c000890c <commands+0x6bc>
c0000a90:	e48ff0ef          	jal	ra,c00000d8 <cprintf>
c0000a94:	08442583          	lw	a1,132(s0)
c0000a98:	00008517          	auipc	a0,0x8
c0000a9c:	e8850513          	addi	a0,a0,-376 # c0008920 <commands+0x6d0>
c0000aa0:	e38ff0ef          	jal	ra,c00000d8 <cprintf>
c0000aa4:	08842583          	lw	a1,136(s0)
c0000aa8:	00008517          	auipc	a0,0x8
c0000aac:	e8c50513          	addi	a0,a0,-372 # c0008934 <commands+0x6e4>
c0000ab0:	e28ff0ef          	jal	ra,c00000d8 <cprintf>
c0000ab4:	08c42583          	lw	a1,140(s0)
c0000ab8:	00c12083          	lw	ra,12(sp)
c0000abc:	00812403          	lw	s0,8(sp)
c0000ac0:	00008517          	auipc	a0,0x8
c0000ac4:	e8850513          	addi	a0,a0,-376 # c0008948 <commands+0x6f8>
c0000ac8:	01010113          	addi	sp,sp,16
c0000acc:	e0cff06f          	j	c00000d8 <cprintf>

c0000ad0 <pgfault_handler>:
c0000ad0:	ff010113          	addi	sp,sp,-16
c0000ad4:	00812423          	sw	s0,8(sp)
c0000ad8:	00112623          	sw	ra,12(sp)
c0000adc:	00035797          	auipc	a5,0x35
c0000ae0:	3847a783          	lw	a5,900(a5) # c0035e60 <check_mm_struct>
c0000ae4:	00050413          	mv	s0,a0
c0000ae8:	06078c63          	beqz	a5,c0000b60 <pgfault_handler+0x90>
c0000aec:	08052783          	lw	a5,128(a0)
c0000af0:	08852583          	lw	a1,136(a0)
c0000af4:	04b00613          	li	a2,75
c0000af8:	1007f793          	andi	a5,a5,256
c0000afc:	04078e63          	beqz	a5,c0000b58 <pgfault_handler+0x88>
c0000b00:	08c42703          	lw	a4,140(s0)
c0000b04:	00700793          	li	a5,7
c0000b08:	05700693          	li	a3,87
c0000b0c:	00f70463          	beq	a4,a5,c0000b14 <pgfault_handler+0x44>
c0000b10:	05200693          	li	a3,82
c0000b14:	00008517          	auipc	a0,0x8
c0000b18:	aec50513          	addi	a0,a0,-1300 # c0008600 <commands+0x3b0>
c0000b1c:	dbcff0ef          	jal	ra,c00000d8 <cprintf>
c0000b20:	00035517          	auipc	a0,0x35
c0000b24:	34052503          	lw	a0,832(a0) # c0035e60 <check_mm_struct>
c0000b28:	02050c63          	beqz	a0,c0000b60 <pgfault_handler+0x90>
c0000b2c:	00035717          	auipc	a4,0x35
c0000b30:	32072703          	lw	a4,800(a4) # c0035e4c <current>
c0000b34:	00035797          	auipc	a5,0x35
c0000b38:	31c7a783          	lw	a5,796(a5) # c0035e50 <idleproc>
c0000b3c:	04f71663          	bne	a4,a5,c0000b88 <pgfault_handler+0xb8>
c0000b40:	08842603          	lw	a2,136(s0)
c0000b44:	08c42583          	lw	a1,140(s0)
c0000b48:	00c12083          	lw	ra,12(sp)
c0000b4c:	00812403          	lw	s0,8(sp)
c0000b50:	01010113          	addi	sp,sp,16
c0000b54:	7e50006f          	j	c0001b38 <do_pgfault>
c0000b58:	05500613          	li	a2,85
c0000b5c:	fa5ff06f          	j	c0000b00 <pgfault_handler+0x30>
c0000b60:	00035797          	auipc	a5,0x35
c0000b64:	2ec7a783          	lw	a5,748(a5) # c0035e4c <current>
c0000b68:	04078063          	beqz	a5,c0000ba8 <pgfault_handler+0xd8>
c0000b6c:	08842603          	lw	a2,136(s0)
c0000b70:	08c42583          	lw	a1,140(s0)
c0000b74:	00c12083          	lw	ra,12(sp)
c0000b78:	00812403          	lw	s0,8(sp)
c0000b7c:	0187a503          	lw	a0,24(a5)
c0000b80:	01010113          	addi	sp,sp,16
c0000b84:	7b50006f          	j	c0001b38 <do_pgfault>
c0000b88:	00008697          	auipc	a3,0x8
c0000b8c:	a9868693          	addi	a3,a3,-1384 # c0008620 <commands+0x3d0>
c0000b90:	00008617          	auipc	a2,0x8
c0000b94:	aa460613          	addi	a2,a2,-1372 # c0008634 <commands+0x3e4>
c0000b98:	06a00593          	li	a1,106
c0000b9c:	00008517          	auipc	a0,0x8
c0000ba0:	ab050513          	addi	a0,a0,-1360 # c000864c <commands+0x3fc>
c0000ba4:	ea8ff0ef          	jal	ra,c000024c <__panic>
c0000ba8:	00040513          	mv	a0,s0
c0000bac:	eb1ff0ef          	jal	ra,c0000a5c <print_trapframe>
c0000bb0:	08042783          	lw	a5,128(s0)
c0000bb4:	08842583          	lw	a1,136(s0)
c0000bb8:	04b00613          	li	a2,75
c0000bbc:	1007f793          	andi	a5,a5,256
c0000bc0:	00079463          	bnez	a5,c0000bc8 <pgfault_handler+0xf8>
c0000bc4:	05500613          	li	a2,85
c0000bc8:	08c42703          	lw	a4,140(s0)
c0000bcc:	00700793          	li	a5,7
c0000bd0:	02f70663          	beq	a4,a5,c0000bfc <pgfault_handler+0x12c>
c0000bd4:	05200693          	li	a3,82
c0000bd8:	00008517          	auipc	a0,0x8
c0000bdc:	a2850513          	addi	a0,a0,-1496 # c0008600 <commands+0x3b0>
c0000be0:	cf8ff0ef          	jal	ra,c00000d8 <cprintf>
c0000be4:	00008617          	auipc	a2,0x8
c0000be8:	a7c60613          	addi	a2,a2,-1412 # c0008660 <commands+0x410>
c0000bec:	07100593          	li	a1,113
c0000bf0:	00008517          	auipc	a0,0x8
c0000bf4:	a5c50513          	addi	a0,a0,-1444 # c000864c <commands+0x3fc>
c0000bf8:	e54ff0ef          	jal	ra,c000024c <__panic>
c0000bfc:	05700693          	li	a3,87
c0000c00:	fd9ff06f          	j	c0000bd8 <pgfault_handler+0x108>

c0000c04 <interrupt_handler>:
c0000c04:	08c52783          	lw	a5,140(a0)
c0000c08:	80000737          	lui	a4,0x80000
c0000c0c:	fff74713          	not	a4,a4
c0000c10:	00e7f7b3          	and	a5,a5,a4
c0000c14:	00b00713          	li	a4,11
c0000c18:	0af76e63          	bltu	a4,a5,c0000cd4 <interrupt_handler+0xd0>
c0000c1c:	00007717          	auipc	a4,0x7
c0000c20:	79c70713          	addi	a4,a4,1948 # c00083b8 <commands+0x168>
c0000c24:	00279793          	slli	a5,a5,0x2
c0000c28:	00e787b3          	add	a5,a5,a4
c0000c2c:	0007a783          	lw	a5,0(a5)
c0000c30:	00e787b3          	add	a5,a5,a4
c0000c34:	00078067          	jr	a5
c0000c38:	00008517          	auipc	a0,0x8
c0000c3c:	92450513          	addi	a0,a0,-1756 # c000855c <commands+0x30c>
c0000c40:	c98ff06f          	j	c00000d8 <cprintf>
c0000c44:	00008517          	auipc	a0,0x8
c0000c48:	95450513          	addi	a0,a0,-1708 # c0008598 <commands+0x348>
c0000c4c:	c8cff06f          	j	c00000d8 <cprintf>
c0000c50:	00008517          	auipc	a0,0x8
c0000c54:	96850513          	addi	a0,a0,-1688 # c00085b8 <commands+0x368>
c0000c58:	c80ff06f          	j	c00000d8 <cprintf>
c0000c5c:	00008517          	auipc	a0,0x8
c0000c60:	98450513          	addi	a0,a0,-1660 # c00085e0 <commands+0x390>
c0000c64:	c74ff06f          	j	c00000d8 <cprintf>
c0000c68:	ff010113          	addi	sp,sp,-16
c0000c6c:	00112623          	sw	ra,12(sp)
c0000c70:	a91ff0ef          	jal	ra,c0000700 <clock_set_next_event>
c0000c74:	00035797          	auipc	a5,0x35
c0000c78:	1e87a783          	lw	a5,488(a5) # c0035e5c <ticks>
c0000c7c:	00178793          	addi	a5,a5,1
c0000c80:	06400593          	li	a1,100
c0000c84:	02b7f733          	remu	a4,a5,a1
c0000c88:	00035297          	auipc	t0,0x35
c0000c8c:	1cf2aa23          	sw	a5,468(t0) # c0035e5c <ticks>
c0000c90:	02071663          	bnez	a4,c0000cbc <interrupt_handler+0xb8>
c0000c94:	00035797          	auipc	a5,0x35
c0000c98:	1b87a783          	lw	a5,440(a5) # c0035e4c <current>
c0000c9c:	02078063          	beqz	a5,c0000cbc <interrupt_handler+0xb8>
c0000ca0:	00008517          	auipc	a0,0x8
c0000ca4:	93450513          	addi	a0,a0,-1740 # c00085d4 <commands+0x384>
c0000ca8:	c30ff0ef          	jal	ra,c00000d8 <cprintf>
c0000cac:	00100713          	li	a4,1
c0000cb0:	00035797          	auipc	a5,0x35
c0000cb4:	19c7a783          	lw	a5,412(a5) # c0035e4c <current>
c0000cb8:	00e7a823          	sw	a4,16(a5)
c0000cbc:	00c12083          	lw	ra,12(sp)
c0000cc0:	01010113          	addi	sp,sp,16
c0000cc4:	00008067          	ret
c0000cc8:	00008517          	auipc	a0,0x8
c0000ccc:	8b050513          	addi	a0,a0,-1872 # c0008578 <commands+0x328>
c0000cd0:	c08ff06f          	j	c00000d8 <cprintf>
c0000cd4:	d89ff06f          	j	c0000a5c <print_trapframe>

c0000cd8 <exception_handler>:
c0000cd8:	08c52783          	lw	a5,140(a0)
c0000cdc:	00b00693          	li	a3,11
c0000ce0:	16f6e063          	bltu	a3,a5,c0000e40 <exception_handler+0x168>
c0000ce4:	00007717          	auipc	a4,0x7
c0000ce8:	70470713          	addi	a4,a4,1796 # c00083e8 <commands+0x198>
c0000cec:	00279793          	slli	a5,a5,0x2
c0000cf0:	00e787b3          	add	a5,a5,a4
c0000cf4:	0007a783          	lw	a5,0(a5)
c0000cf8:	ff010113          	addi	sp,sp,-16
c0000cfc:	00812423          	sw	s0,8(sp)
c0000d00:	00112623          	sw	ra,12(sp)
c0000d04:	00912223          	sw	s1,4(sp)
c0000d08:	00e787b3          	add	a5,a5,a4
c0000d0c:	00050413          	mv	s0,a0
c0000d10:	00078067          	jr	a5
c0000d14:	00007517          	auipc	a0,0x7
c0000d18:	7e850513          	addi	a0,a0,2024 # c00084fc <commands+0x2ac>
c0000d1c:	bbcff0ef          	jal	ra,c00000d8 <cprintf>
c0000d20:	08442783          	lw	a5,132(s0)
c0000d24:	00c12083          	lw	ra,12(sp)
c0000d28:	00412483          	lw	s1,4(sp)
c0000d2c:	00478793          	addi	a5,a5,4
c0000d30:	08f42223          	sw	a5,132(s0)
c0000d34:	00812403          	lw	s0,8(sp)
c0000d38:	01010113          	addi	sp,sp,16
c0000d3c:	3dd0606f          	j	c0007918 <syscall>
c0000d40:	00007517          	auipc	a0,0x7
c0000d44:	7dc50513          	addi	a0,a0,2012 # c000851c <commands+0x2cc>
c0000d48:	00c12083          	lw	ra,12(sp)
c0000d4c:	00812403          	lw	s0,8(sp)
c0000d50:	00412483          	lw	s1,4(sp)
c0000d54:	01010113          	addi	sp,sp,16
c0000d58:	b80ff06f          	j	c00000d8 <cprintf>
c0000d5c:	00007517          	auipc	a0,0x7
c0000d60:	7e050513          	addi	a0,a0,2016 # c000853c <commands+0x2ec>
c0000d64:	fe5ff06f          	j	c0000d48 <exception_handler+0x70>
c0000d68:	00007517          	auipc	a0,0x7
c0000d6c:	6b050513          	addi	a0,a0,1712 # c0008418 <commands+0x1c8>
c0000d70:	fd9ff06f          	j	c0000d48 <exception_handler+0x70>
c0000d74:	00007517          	auipc	a0,0x7
c0000d78:	6c450513          	addi	a0,a0,1732 # c0008438 <commands+0x1e8>
c0000d7c:	b5cff0ef          	jal	ra,c00000d8 <cprintf>
c0000d80:	00040513          	mv	a0,s0
c0000d84:	cd9ff0ef          	jal	ra,c0000a5c <print_trapframe>
c0000d88:	00c12083          	lw	ra,12(sp)
c0000d8c:	00812403          	lw	s0,8(sp)
c0000d90:	00412483          	lw	s1,4(sp)
c0000d94:	01010113          	addi	sp,sp,16
c0000d98:	3ffff317          	auipc	t1,0x3ffff
c0000d9c:	af830067          	jr	-1288(t1) # fffff890 <sbi_shutdown>
c0000da0:	00007517          	auipc	a0,0x7
c0000da4:	6b450513          	addi	a0,a0,1716 # c0008454 <commands+0x204>
c0000da8:	fa1ff06f          	j	c0000d48 <exception_handler+0x70>
c0000dac:	00007517          	auipc	a0,0x7
c0000db0:	6c050513          	addi	a0,a0,1728 # c000846c <commands+0x21c>
c0000db4:	f95ff06f          	j	c0000d48 <exception_handler+0x70>
c0000db8:	00007517          	auipc	a0,0x7
c0000dbc:	6c050513          	addi	a0,a0,1728 # c0008478 <commands+0x228>
c0000dc0:	f89ff06f          	j	c0000d48 <exception_handler+0x70>
c0000dc4:	00007517          	auipc	a0,0x7
c0000dc8:	6d050513          	addi	a0,a0,1744 # c0008494 <commands+0x244>
c0000dcc:	b0cff0ef          	jal	ra,c00000d8 <cprintf>
c0000dd0:	00040513          	mv	a0,s0
c0000dd4:	cfdff0ef          	jal	ra,c0000ad0 <pgfault_handler>
c0000dd8:	00050493          	mv	s1,a0
c0000ddc:	06051463          	bnez	a0,c0000e44 <exception_handler+0x16c>
c0000de0:	00c12083          	lw	ra,12(sp)
c0000de4:	00812403          	lw	s0,8(sp)
c0000de8:	00412483          	lw	s1,4(sp)
c0000dec:	01010113          	addi	sp,sp,16
c0000df0:	00008067          	ret
c0000df4:	00007517          	auipc	a0,0x7
c0000df8:	6d050513          	addi	a0,a0,1744 # c00084c4 <commands+0x274>
c0000dfc:	f4dff06f          	j	c0000d48 <exception_handler+0x70>
c0000e00:	00007517          	auipc	a0,0x7
c0000e04:	6e450513          	addi	a0,a0,1764 # c00084e4 <commands+0x294>
c0000e08:	ad0ff0ef          	jal	ra,c00000d8 <cprintf>
c0000e0c:	00040513          	mv	a0,s0
c0000e10:	cc1ff0ef          	jal	ra,c0000ad0 <pgfault_handler>
c0000e14:	00050493          	mv	s1,a0
c0000e18:	fc0504e3          	beqz	a0,c0000de0 <exception_handler+0x108>
c0000e1c:	00040513          	mv	a0,s0
c0000e20:	c3dff0ef          	jal	ra,c0000a5c <print_trapframe>
c0000e24:	00048693          	mv	a3,s1
c0000e28:	00007617          	auipc	a2,0x7
c0000e2c:	68060613          	addi	a2,a2,1664 # c00084a8 <commands+0x258>
c0000e30:	0d300593          	li	a1,211
c0000e34:	00008517          	auipc	a0,0x8
c0000e38:	81850513          	addi	a0,a0,-2024 # c000864c <commands+0x3fc>
c0000e3c:	c10ff0ef          	jal	ra,c000024c <__panic>
c0000e40:	c1dff06f          	j	c0000a5c <print_trapframe>
c0000e44:	00040513          	mv	a0,s0
c0000e48:	c15ff0ef          	jal	ra,c0000a5c <print_trapframe>
c0000e4c:	00048693          	mv	a3,s1
c0000e50:	00007617          	auipc	a2,0x7
c0000e54:	65860613          	addi	a2,a2,1624 # c00084a8 <commands+0x258>
c0000e58:	0c900593          	li	a1,201
c0000e5c:	00007517          	auipc	a0,0x7
c0000e60:	7f050513          	addi	a0,a0,2032 # c000864c <commands+0x3fc>
c0000e64:	be8ff0ef          	jal	ra,c000024c <__panic>

c0000e68 <trap>:
c0000e68:	00035717          	auipc	a4,0x35
c0000e6c:	fe472703          	lw	a4,-28(a4) # c0035e4c <current>
c0000e70:	0a070063          	beqz	a4,c0000f10 <trap+0xa8>
c0000e74:	ff010113          	addi	sp,sp,-16
c0000e78:	00812423          	sw	s0,8(sp)
c0000e7c:	08c52683          	lw	a3,140(a0)
c0000e80:	08052403          	lw	s0,128(a0)
c0000e84:	00912223          	sw	s1,4(sp)
c0000e88:	00112623          	sw	ra,12(sp)
c0000e8c:	05472483          	lw	s1,84(a4)
c0000e90:	04a72a23          	sw	a0,84(a4)
c0000e94:	10047413          	andi	s0,s0,256
c0000e98:	0606c863          	bltz	a3,c0000f08 <trap+0xa0>
c0000e9c:	e3dff0ef          	jal	ra,c0000cd8 <exception_handler>
c0000ea0:	00035797          	auipc	a5,0x35
c0000ea4:	fac7a783          	lw	a5,-84(a5) # c0035e4c <current>
c0000ea8:	0497aa23          	sw	s1,84(a5)
c0000eac:	00041c63          	bnez	s0,c0000ec4 <trap+0x5c>
c0000eb0:	05c7a703          	lw	a4,92(a5)
c0000eb4:	00177713          	andi	a4,a4,1
c0000eb8:	02071a63          	bnez	a4,c0000eec <trap+0x84>
c0000ebc:	0107a783          	lw	a5,16(a5)
c0000ec0:	00079c63          	bnez	a5,c0000ed8 <trap+0x70>
c0000ec4:	00c12083          	lw	ra,12(sp)
c0000ec8:	00812403          	lw	s0,8(sp)
c0000ecc:	00412483          	lw	s1,4(sp)
c0000ed0:	01010113          	addi	sp,sp,16
c0000ed4:	00008067          	ret
c0000ed8:	00c12083          	lw	ra,12(sp)
c0000edc:	00812403          	lw	s0,8(sp)
c0000ee0:	00412483          	lw	s1,4(sp)
c0000ee4:	01010113          	addi	sp,sp,16
c0000ee8:	0b50606f          	j	c000779c <schedule>
c0000eec:	ff700513          	li	a0,-9
c0000ef0:	231050ef          	jal	ra,c0006920 <do_exit>
c0000ef4:	00035797          	auipc	a5,0x35
c0000ef8:	f587a783          	lw	a5,-168(a5) # c0035e4c <current>
c0000efc:	0107a783          	lw	a5,16(a5)
c0000f00:	fc0782e3          	beqz	a5,c0000ec4 <trap+0x5c>
c0000f04:	fd5ff06f          	j	c0000ed8 <trap+0x70>
c0000f08:	cfdff0ef          	jal	ra,c0000c04 <interrupt_handler>
c0000f0c:	f95ff06f          	j	c0000ea0 <trap+0x38>
c0000f10:	08c52783          	lw	a5,140(a0)
c0000f14:	0007c463          	bltz	a5,c0000f1c <trap+0xb4>
c0000f18:	dc1ff06f          	j	c0000cd8 <exception_handler>
c0000f1c:	ce9ff06f          	j	c0000c04 <interrupt_handler>

c0000f20 <__alltraps>:
c0000f20:	14011173          	csrrw	sp,sscratch,sp
c0000f24:	00011463          	bnez	sp,c0000f2c <__alltraps+0xc>
c0000f28:	14002173          	csrr	sp,sscratch
c0000f2c:	f7010113          	addi	sp,sp,-144
c0000f30:	00012023          	sw	zero,0(sp)
c0000f34:	00112223          	sw	ra,4(sp)
c0000f38:	00312623          	sw	gp,12(sp)
c0000f3c:	00412823          	sw	tp,16(sp)
c0000f40:	00512a23          	sw	t0,20(sp)
c0000f44:	00612c23          	sw	t1,24(sp)
c0000f48:	00712e23          	sw	t2,28(sp)
c0000f4c:	02812023          	sw	s0,32(sp)
c0000f50:	02912223          	sw	s1,36(sp)
c0000f54:	02a12423          	sw	a0,40(sp)
c0000f58:	02b12623          	sw	a1,44(sp)
c0000f5c:	02c12823          	sw	a2,48(sp)
c0000f60:	02d12a23          	sw	a3,52(sp)
c0000f64:	02e12c23          	sw	a4,56(sp)
c0000f68:	02f12e23          	sw	a5,60(sp)
c0000f6c:	05012023          	sw	a6,64(sp)
c0000f70:	05112223          	sw	a7,68(sp)
c0000f74:	05212423          	sw	s2,72(sp)
c0000f78:	05312623          	sw	s3,76(sp)
c0000f7c:	05412823          	sw	s4,80(sp)
c0000f80:	05512a23          	sw	s5,84(sp)
c0000f84:	05612c23          	sw	s6,88(sp)
c0000f88:	05712e23          	sw	s7,92(sp)
c0000f8c:	07812023          	sw	s8,96(sp)
c0000f90:	07912223          	sw	s9,100(sp)
c0000f94:	07a12423          	sw	s10,104(sp)
c0000f98:	07b12623          	sw	s11,108(sp)
c0000f9c:	07c12823          	sw	t3,112(sp)
c0000fa0:	07d12a23          	sw	t4,116(sp)
c0000fa4:	07e12c23          	sw	t5,120(sp)
c0000fa8:	07f12e23          	sw	t6,124(sp)
c0000fac:	14001473          	csrrw	s0,sscratch,zero
c0000fb0:	100024f3          	csrr	s1,sstatus
c0000fb4:	14102973          	csrr	s2,sepc
c0000fb8:	143029f3          	csrr	s3,sbadaddr
c0000fbc:	14202a73          	csrr	s4,scause
c0000fc0:	00812423          	sw	s0,8(sp)
c0000fc4:	08912023          	sw	s1,128(sp)
c0000fc8:	09212223          	sw	s2,132(sp)
c0000fcc:	09312423          	sw	s3,136(sp)
c0000fd0:	09412623          	sw	s4,140(sp)
c0000fd4:	00010513          	mv	a0,sp
c0000fd8:	e91ff0ef          	jal	ra,c0000e68 <trap>

c0000fdc <__trapret>:
c0000fdc:	08012483          	lw	s1,128(sp)
c0000fe0:	08412903          	lw	s2,132(sp)
c0000fe4:	1004f413          	andi	s0,s1,256
c0000fe8:	00041663          	bnez	s0,c0000ff4 <__trapret+0x18>
c0000fec:	09010413          	addi	s0,sp,144
c0000ff0:	14041073          	csrw	sscratch,s0
c0000ff4:	10049073          	csrw	sstatus,s1
c0000ff8:	14191073          	csrw	sepc,s2
c0000ffc:	00412083          	lw	ra,4(sp)
c0001000:	00c12183          	lw	gp,12(sp)
c0001004:	01012203          	lw	tp,16(sp)
c0001008:	01412283          	lw	t0,20(sp)
c000100c:	01812303          	lw	t1,24(sp)
c0001010:	01c12383          	lw	t2,28(sp)
c0001014:	02012403          	lw	s0,32(sp)
c0001018:	02412483          	lw	s1,36(sp)
c000101c:	02812503          	lw	a0,40(sp)
c0001020:	02c12583          	lw	a1,44(sp)
c0001024:	03012603          	lw	a2,48(sp)
c0001028:	03412683          	lw	a3,52(sp)
c000102c:	03812703          	lw	a4,56(sp)
c0001030:	03c12783          	lw	a5,60(sp)
c0001034:	04012803          	lw	a6,64(sp)
c0001038:	04412883          	lw	a7,68(sp)
c000103c:	04812903          	lw	s2,72(sp)
c0001040:	04c12983          	lw	s3,76(sp)
c0001044:	05012a03          	lw	s4,80(sp)
c0001048:	05412a83          	lw	s5,84(sp)
c000104c:	05812b03          	lw	s6,88(sp)
c0001050:	05c12b83          	lw	s7,92(sp)
c0001054:	06012c03          	lw	s8,96(sp)
c0001058:	06412c83          	lw	s9,100(sp)
c000105c:	06812d03          	lw	s10,104(sp)
c0001060:	06c12d83          	lw	s11,108(sp)
c0001064:	07012e03          	lw	t3,112(sp)
c0001068:	07412e83          	lw	t4,116(sp)
c000106c:	07812f03          	lw	t5,120(sp)
c0001070:	07c12f83          	lw	t6,124(sp)
c0001074:	00812103          	lw	sp,8(sp)
c0001078:	10200073          	sret

c000107c <forkrets>:
c000107c:	00050113          	mv	sp,a0
c0001080:	f5dff06f          	j	c0000fdc <__trapret>

c0001084 <check_vma_overlap.isra.0.part.1>:
c0001084:	ff010113          	addi	sp,sp,-16
c0001088:	00008697          	auipc	a3,0x8
c000108c:	8d468693          	addi	a3,a3,-1836 # c000895c <commands+0x70c>
c0001090:	00007617          	auipc	a2,0x7
c0001094:	5a460613          	addi	a2,a2,1444 # c0008634 <commands+0x3e4>
c0001098:	06b00593          	li	a1,107
c000109c:	00008517          	auipc	a0,0x8
c00010a0:	8e050513          	addi	a0,a0,-1824 # c000897c <commands+0x72c>
c00010a4:	00112623          	sw	ra,12(sp)
c00010a8:	9a4ff0ef          	jal	ra,c000024c <__panic>

c00010ac <mm_create>:
c00010ac:	ff010113          	addi	sp,sp,-16
c00010b0:	02000513          	li	a0,32
c00010b4:	00812423          	sw	s0,8(sp)
c00010b8:	00112623          	sw	ra,12(sp)
c00010bc:	4f0010ef          	jal	ra,c00025ac <kmalloc>
c00010c0:	00050413          	mv	s0,a0
c00010c4:	02050863          	beqz	a0,c00010f4 <mm_create+0x48>
c00010c8:	00a42223          	sw	a0,4(s0)
c00010cc:	00a42023          	sw	a0,0(s0)
c00010d0:	00052423          	sw	zero,8(a0)
c00010d4:	00052623          	sw	zero,12(a0)
c00010d8:	00052823          	sw	zero,16(a0)
c00010dc:	00035797          	auipc	a5,0x35
c00010e0:	d607a783          	lw	a5,-672(a5) # c0035e3c <swap_init_ok>
c00010e4:	02079263          	bnez	a5,c0001108 <mm_create+0x5c>
c00010e8:	00052a23          	sw	zero,20(a0)
c00010ec:	00042c23          	sw	zero,24(s0)
c00010f0:	00042e23          	sw	zero,28(s0)
c00010f4:	00c12083          	lw	ra,12(sp)
c00010f8:	00040513          	mv	a0,s0
c00010fc:	00812403          	lw	s0,8(sp)
c0001100:	01010113          	addi	sp,sp,16
c0001104:	00008067          	ret
c0001108:	739010ef          	jal	ra,c0003040 <swap_init_mm>
c000110c:	fe1ff06f          	j	c00010ec <mm_create+0x40>

c0001110 <vma_create>:
c0001110:	ff010113          	addi	sp,sp,-16
c0001114:	01212023          	sw	s2,0(sp)
c0001118:	00050913          	mv	s2,a0
c000111c:	01800513          	li	a0,24
c0001120:	00812423          	sw	s0,8(sp)
c0001124:	00912223          	sw	s1,4(sp)
c0001128:	00112623          	sw	ra,12(sp)
c000112c:	00058493          	mv	s1,a1
c0001130:	00060413          	mv	s0,a2
c0001134:	478010ef          	jal	ra,c00025ac <kmalloc>
c0001138:	00050863          	beqz	a0,c0001148 <vma_create+0x38>
c000113c:	01252223          	sw	s2,4(a0)
c0001140:	00952423          	sw	s1,8(a0)
c0001144:	00852623          	sw	s0,12(a0)
c0001148:	00c12083          	lw	ra,12(sp)
c000114c:	00812403          	lw	s0,8(sp)
c0001150:	00412483          	lw	s1,4(sp)
c0001154:	00012903          	lw	s2,0(sp)
c0001158:	01010113          	addi	sp,sp,16
c000115c:	00008067          	ret

c0001160 <find_vma>:
c0001160:	04050263          	beqz	a0,c00011a4 <find_vma+0x44>
c0001164:	00852783          	lw	a5,8(a0)
c0001168:	00078663          	beqz	a5,c0001174 <find_vma+0x14>
c000116c:	0047a703          	lw	a4,4(a5)
c0001170:	04e5f063          	bleu	a4,a1,c00011b0 <find_vma+0x50>
c0001174:	00050793          	mv	a5,a0
c0001178:	0047a783          	lw	a5,4(a5)
c000117c:	02f50463          	beq	a0,a5,c00011a4 <find_vma+0x44>
c0001180:	ff47a703          	lw	a4,-12(a5)
c0001184:	fee5eae3          	bltu	a1,a4,c0001178 <find_vma+0x18>
c0001188:	ff87a703          	lw	a4,-8(a5)
c000118c:	fee5f6e3          	bleu	a4,a1,c0001178 <find_vma+0x18>
c0001190:	ff078793          	addi	a5,a5,-16
c0001194:	00078863          	beqz	a5,c00011a4 <find_vma+0x44>
c0001198:	00f52423          	sw	a5,8(a0)
c000119c:	00078513          	mv	a0,a5
c00011a0:	00008067          	ret
c00011a4:	00000793          	li	a5,0
c00011a8:	00078513          	mv	a0,a5
c00011ac:	00008067          	ret
c00011b0:	0087a703          	lw	a4,8(a5)
c00011b4:	fce5f0e3          	bleu	a4,a1,c0001174 <find_vma+0x14>
c00011b8:	00f52423          	sw	a5,8(a0)
c00011bc:	fe1ff06f          	j	c000119c <find_vma+0x3c>

c00011c0 <insert_vma_struct>:
c00011c0:	0045a603          	lw	a2,4(a1)
c00011c4:	0085a803          	lw	a6,8(a1)
c00011c8:	ff010113          	addi	sp,sp,-16
c00011cc:	00112623          	sw	ra,12(sp)
c00011d0:	00050713          	mv	a4,a0
c00011d4:	01066a63          	bltu	a2,a6,c00011e8 <insert_vma_struct+0x28>
c00011d8:	0bc0006f          	j	c0001294 <insert_vma_struct+0xd4>
c00011dc:	ff47a683          	lw	a3,-12(a5)
c00011e0:	06d66663          	bltu	a2,a3,c000124c <insert_vma_struct+0x8c>
c00011e4:	00078713          	mv	a4,a5
c00011e8:	00472783          	lw	a5,4(a4)
c00011ec:	fef518e3          	bne	a0,a5,c00011dc <insert_vma_struct+0x1c>
c00011f0:	00050793          	mv	a5,a0
c00011f4:	0ca70263          	beq	a4,a0,c00012b8 <insert_vma_struct+0xf8>
c00011f8:	ff872683          	lw	a3,-8(a4)
c00011fc:	ff472883          	lw	a7,-12(a4)
c0001200:	0ad8fa63          	bleu	a3,a7,c00012b4 <insert_vma_struct+0xf4>
c0001204:	06d66863          	bltu	a2,a3,c0001274 <insert_vma_struct+0xb4>
c0001208:	00f50a63          	beq	a0,a5,c000121c <insert_vma_struct+0x5c>
c000120c:	ff47a683          	lw	a3,-12(a5)
c0001210:	0706e263          	bltu	a3,a6,c0001274 <insert_vma_struct+0xb4>
c0001214:	ff87a603          	lw	a2,-8(a5)
c0001218:	02c6fe63          	bleu	a2,a3,c0001254 <insert_vma_struct+0x94>
c000121c:	01052683          	lw	a3,16(a0)
c0001220:	00a5a023          	sw	a0,0(a1)
c0001224:	01058613          	addi	a2,a1,16
c0001228:	00c7a023          	sw	a2,0(a5)
c000122c:	00c12083          	lw	ra,12(sp)
c0001230:	00c72223          	sw	a2,4(a4)
c0001234:	00f5aa23          	sw	a5,20(a1)
c0001238:	00e5a823          	sw	a4,16(a1)
c000123c:	00168793          	addi	a5,a3,1
c0001240:	00f52823          	sw	a5,16(a0)
c0001244:	01010113          	addi	sp,sp,16
c0001248:	00008067          	ret
c000124c:	fca702e3          	beq	a4,a0,c0001210 <insert_vma_struct+0x50>
c0001250:	fa9ff06f          	j	c00011f8 <insert_vma_struct+0x38>
c0001254:	00008697          	auipc	a3,0x8
c0001258:	87068693          	addi	a3,a3,-1936 # c0008ac4 <commands+0x874>
c000125c:	00007617          	auipc	a2,0x7
c0001260:	3d860613          	addi	a2,a2,984 # c0008634 <commands+0x3e4>
c0001264:	06d00593          	li	a1,109
c0001268:	00007517          	auipc	a0,0x7
c000126c:	71450513          	addi	a0,a0,1812 # c000897c <commands+0x72c>
c0001270:	fddfe0ef          	jal	ra,c000024c <__panic>
c0001274:	00008697          	auipc	a3,0x8
c0001278:	83068693          	addi	a3,a3,-2000 # c0008aa4 <commands+0x854>
c000127c:	00007617          	auipc	a2,0x7
c0001280:	3b860613          	addi	a2,a2,952 # c0008634 <commands+0x3e4>
c0001284:	06c00593          	li	a1,108
c0001288:	00007517          	auipc	a0,0x7
c000128c:	6f450513          	addi	a0,a0,1780 # c000897c <commands+0x72c>
c0001290:	fbdfe0ef          	jal	ra,c000024c <__panic>
c0001294:	00007697          	auipc	a3,0x7
c0001298:	7f468693          	addi	a3,a3,2036 # c0008a88 <commands+0x838>
c000129c:	00007617          	auipc	a2,0x7
c00012a0:	39860613          	addi	a2,a2,920 # c0008634 <commands+0x3e4>
c00012a4:	07400593          	li	a1,116
c00012a8:	00007517          	auipc	a0,0x7
c00012ac:	6d450513          	addi	a0,a0,1748 # c000897c <commands+0x72c>
c00012b0:	f9dfe0ef          	jal	ra,c000024c <__panic>
c00012b4:	dd1ff0ef          	jal	ra,c0001084 <check_vma_overlap.isra.0.part.1>
c00012b8:	00070793          	mv	a5,a4
c00012bc:	f61ff06f          	j	c000121c <insert_vma_struct+0x5c>

c00012c0 <mm_destroy>:
c00012c0:	01852783          	lw	a5,24(a0)
c00012c4:	ff010113          	addi	sp,sp,-16
c00012c8:	00112623          	sw	ra,12(sp)
c00012cc:	00812423          	sw	s0,8(sp)
c00012d0:	04079263          	bnez	a5,c0001314 <mm_destroy+0x54>
c00012d4:	00050413          	mv	s0,a0
c00012d8:	00452503          	lw	a0,4(a0)
c00012dc:	02a40263          	beq	s0,a0,c0001300 <mm_destroy+0x40>
c00012e0:	00052703          	lw	a4,0(a0)
c00012e4:	00452783          	lw	a5,4(a0)
c00012e8:	ff050513          	addi	a0,a0,-16
c00012ec:	00f72223          	sw	a5,4(a4)
c00012f0:	00e7a023          	sw	a4,0(a5)
c00012f4:	3d8010ef          	jal	ra,c00026cc <kfree>
c00012f8:	00442503          	lw	a0,4(s0)
c00012fc:	fea412e3          	bne	s0,a0,c00012e0 <mm_destroy+0x20>
c0001300:	00040513          	mv	a0,s0
c0001304:	00c12083          	lw	ra,12(sp)
c0001308:	00812403          	lw	s0,8(sp)
c000130c:	01010113          	addi	sp,sp,16
c0001310:	3bc0106f          	j	c00026cc <kfree>
c0001314:	00007697          	auipc	a3,0x7
c0001318:	7d068693          	addi	a3,a3,2000 # c0008ae4 <commands+0x894>
c000131c:	00007617          	auipc	a2,0x7
c0001320:	31860613          	addi	a2,a2,792 # c0008634 <commands+0x3e4>
c0001324:	09400593          	li	a1,148
c0001328:	00007517          	auipc	a0,0x7
c000132c:	65450513          	addi	a0,a0,1620 # c000897c <commands+0x72c>
c0001330:	f1dfe0ef          	jal	ra,c000024c <__panic>

c0001334 <mm_map>:
c0001334:	000017b7          	lui	a5,0x1
c0001338:	fe010113          	addi	sp,sp,-32
c000133c:	fff78793          	addi	a5,a5,-1 # fff <_binary_obj___user_faultread_out_size-0xf69>
c0001340:	fffff837          	lui	a6,0xfffff
c0001344:	00812c23          	sw	s0,24(sp)
c0001348:	00f60433          	add	s0,a2,a5
c000134c:	00912a23          	sw	s1,20(sp)
c0001350:	00b40433          	add	s0,s0,a1
c0001354:	00112e23          	sw	ra,28(sp)
c0001358:	01212823          	sw	s2,16(sp)
c000135c:	01312623          	sw	s3,12(sp)
c0001360:	01412423          	sw	s4,8(sp)
c0001364:	01512223          	sw	s5,4(sp)
c0001368:	0105f4b3          	and	s1,a1,a6
c000136c:	002007b7          	lui	a5,0x200
c0001370:	01047433          	and	s0,s0,a6
c0001374:	08f4e863          	bltu	s1,a5,c0001404 <mm_map+0xd0>
c0001378:	0884f663          	bleu	s0,s1,c0001404 <mm_map+0xd0>
c000137c:	b00007b7          	lui	a5,0xb0000
c0001380:	0887e263          	bltu	a5,s0,c0001404 <mm_map+0xd0>
c0001384:	00050993          	mv	s3,a0
c0001388:	00070a13          	mv	s4,a4
c000138c:	00068a93          	mv	s5,a3
c0001390:	08050263          	beqz	a0,c0001414 <mm_map+0xe0>
c0001394:	00048593          	mv	a1,s1
c0001398:	dc9ff0ef          	jal	ra,c0001160 <find_vma>
c000139c:	00050663          	beqz	a0,c00013a8 <mm_map+0x74>
c00013a0:	00452783          	lw	a5,4(a0)
c00013a4:	0687e063          	bltu	a5,s0,c0001404 <mm_map+0xd0>
c00013a8:	01800513          	li	a0,24
c00013ac:	200010ef          	jal	ra,c00025ac <kmalloc>
c00013b0:	00050913          	mv	s2,a0
c00013b4:	ffc00513          	li	a0,-4
c00013b8:	02090463          	beqz	s2,c00013e0 <mm_map+0xac>
c00013bc:	00992223          	sw	s1,4(s2)
c00013c0:	00892423          	sw	s0,8(s2)
c00013c4:	01592623          	sw	s5,12(s2)
c00013c8:	00090593          	mv	a1,s2
c00013cc:	00098513          	mv	a0,s3
c00013d0:	df1ff0ef          	jal	ra,c00011c0 <insert_vma_struct>
c00013d4:	020a0c63          	beqz	s4,c000140c <mm_map+0xd8>
c00013d8:	012a2023          	sw	s2,0(s4)
c00013dc:	00000513          	li	a0,0
c00013e0:	01c12083          	lw	ra,28(sp)
c00013e4:	01812403          	lw	s0,24(sp)
c00013e8:	01412483          	lw	s1,20(sp)
c00013ec:	01012903          	lw	s2,16(sp)
c00013f0:	00c12983          	lw	s3,12(sp)
c00013f4:	00812a03          	lw	s4,8(sp)
c00013f8:	00412a83          	lw	s5,4(sp)
c00013fc:	02010113          	addi	sp,sp,32
c0001400:	00008067          	ret
c0001404:	ffd00513          	li	a0,-3
c0001408:	fd9ff06f          	j	c00013e0 <mm_map+0xac>
c000140c:	00000513          	li	a0,0
c0001410:	fd1ff06f          	j	c00013e0 <mm_map+0xac>
c0001414:	00007697          	auipc	a3,0x7
c0001418:	6e468693          	addi	a3,a3,1764 # c0008af8 <commands+0x8a8>
c000141c:	00007617          	auipc	a2,0x7
c0001420:	21860613          	addi	a2,a2,536 # c0008634 <commands+0x3e4>
c0001424:	0a700593          	li	a1,167
c0001428:	00007517          	auipc	a0,0x7
c000142c:	55450513          	addi	a0,a0,1364 # c000897c <commands+0x72c>
c0001430:	e1dfe0ef          	jal	ra,c000024c <__panic>

c0001434 <dup_mmap>:
c0001434:	fe010113          	addi	sp,sp,-32
c0001438:	00112e23          	sw	ra,28(sp)
c000143c:	00812c23          	sw	s0,24(sp)
c0001440:	00912a23          	sw	s1,20(sp)
c0001444:	01212823          	sw	s2,16(sp)
c0001448:	01312623          	sw	s3,12(sp)
c000144c:	01412423          	sw	s4,8(sp)
c0001450:	01512223          	sw	s5,4(sp)
c0001454:	01612023          	sw	s6,0(sp)
c0001458:	0a050463          	beqz	a0,c0001500 <dup_mmap+0xcc>
c000145c:	00050913          	mv	s2,a0
c0001460:	00058493          	mv	s1,a1
c0001464:	00058413          	mv	s0,a1
c0001468:	01800b13          	li	s6,24
c000146c:	02059e63          	bnez	a1,c00014a8 <dup_mmap+0x74>
c0001470:	0900006f          	j	c0001500 <dup_mmap+0xcc>
c0001474:	00050593          	mv	a1,a0
c0001478:	0157a223          	sw	s5,4(a5) # b0000004 <sbi_remote_fence_i+0xb0000714>
c000147c:	00090513          	mv	a0,s2
c0001480:	0147a423          	sw	s4,8(a5)
c0001484:	0137a623          	sw	s3,12(a5)
c0001488:	d39ff0ef          	jal	ra,c00011c0 <insert_vma_struct>
c000148c:	ff842683          	lw	a3,-8(s0)
c0001490:	ff442603          	lw	a2,-12(s0)
c0001494:	00c4a583          	lw	a1,12(s1)
c0001498:	00c92503          	lw	a0,12(s2)
c000149c:	00000713          	li	a4,0
c00014a0:	500030ef          	jal	ra,c00049a0 <copy_range>
c00014a4:	02051463          	bnez	a0,c00014cc <dup_mmap+0x98>
c00014a8:	00042403          	lw	s0,0(s0)
c00014ac:	04848663          	beq	s1,s0,c00014f8 <dup_mmap+0xc4>
c00014b0:	000b0513          	mv	a0,s6
c00014b4:	ff442a83          	lw	s5,-12(s0)
c00014b8:	ff842a03          	lw	s4,-8(s0)
c00014bc:	ffc42983          	lw	s3,-4(s0)
c00014c0:	0ec010ef          	jal	ra,c00025ac <kmalloc>
c00014c4:	00050793          	mv	a5,a0
c00014c8:	fa0516e3          	bnez	a0,c0001474 <dup_mmap+0x40>
c00014cc:	ffc00513          	li	a0,-4
c00014d0:	01c12083          	lw	ra,28(sp)
c00014d4:	01812403          	lw	s0,24(sp)
c00014d8:	01412483          	lw	s1,20(sp)
c00014dc:	01012903          	lw	s2,16(sp)
c00014e0:	00c12983          	lw	s3,12(sp)
c00014e4:	00812a03          	lw	s4,8(sp)
c00014e8:	00412a83          	lw	s5,4(sp)
c00014ec:	00012b03          	lw	s6,0(sp)
c00014f0:	02010113          	addi	sp,sp,32
c00014f4:	00008067          	ret
c00014f8:	00000513          	li	a0,0
c00014fc:	fd5ff06f          	j	c00014d0 <dup_mmap+0x9c>
c0001500:	00007697          	auipc	a3,0x7
c0001504:	54c68693          	addi	a3,a3,1356 # c0008a4c <commands+0x7fc>
c0001508:	00007617          	auipc	a2,0x7
c000150c:	12c60613          	addi	a2,a2,300 # c0008634 <commands+0x3e4>
c0001510:	0c000593          	li	a1,192
c0001514:	00007517          	auipc	a0,0x7
c0001518:	46850513          	addi	a0,a0,1128 # c000897c <commands+0x72c>
c000151c:	d31fe0ef          	jal	ra,c000024c <__panic>

c0001520 <exit_mmap>:
c0001520:	ff010113          	addi	sp,sp,-16
c0001524:	00112623          	sw	ra,12(sp)
c0001528:	00812423          	sw	s0,8(sp)
c000152c:	00912223          	sw	s1,4(sp)
c0001530:	01212023          	sw	s2,0(sp)
c0001534:	06050663          	beqz	a0,c00015a0 <exit_mmap+0x80>
c0001538:	01852783          	lw	a5,24(a0)
c000153c:	00050493          	mv	s1,a0
c0001540:	06079063          	bnez	a5,c00015a0 <exit_mmap+0x80>
c0001544:	00452403          	lw	s0,4(a0)
c0001548:	00c52903          	lw	s2,12(a0)
c000154c:	02850e63          	beq	a0,s0,c0001588 <exit_mmap+0x68>
c0001550:	ff842603          	lw	a2,-8(s0)
c0001554:	ff442583          	lw	a1,-12(s0)
c0001558:	00090513          	mv	a0,s2
c000155c:	7d5020ef          	jal	ra,c0004530 <unmap_range>
c0001560:	00442403          	lw	s0,4(s0)
c0001564:	fe8496e3          	bne	s1,s0,c0001550 <exit_mmap+0x30>
c0001568:	00442483          	lw	s1,4(s0)
c000156c:	00940e63          	beq	s0,s1,c0001588 <exit_mmap+0x68>
c0001570:	ff84a603          	lw	a2,-8(s1)
c0001574:	ff44a583          	lw	a1,-12(s1)
c0001578:	00090513          	mv	a0,s2
c000157c:	12c030ef          	jal	ra,c00046a8 <exit_range>
c0001580:	0044a483          	lw	s1,4(s1)
c0001584:	fe8496e3          	bne	s1,s0,c0001570 <exit_mmap+0x50>
c0001588:	00c12083          	lw	ra,12(sp)
c000158c:	00812403          	lw	s0,8(sp)
c0001590:	00412483          	lw	s1,4(sp)
c0001594:	00012903          	lw	s2,0(sp)
c0001598:	01010113          	addi	sp,sp,16
c000159c:	00008067          	ret
c00015a0:	00007697          	auipc	a3,0x7
c00015a4:	4c868693          	addi	a3,a3,1224 # c0008a68 <commands+0x818>
c00015a8:	00007617          	auipc	a2,0x7
c00015ac:	08c60613          	addi	a2,a2,140 # c0008634 <commands+0x3e4>
c00015b0:	0d600593          	li	a1,214
c00015b4:	00007517          	auipc	a0,0x7
c00015b8:	3c850513          	addi	a0,a0,968 # c000897c <commands+0x72c>
c00015bc:	c91fe0ef          	jal	ra,c000024c <__panic>

c00015c0 <vmm_init>:
c00015c0:	fe010113          	addi	sp,sp,-32
c00015c4:	00112e23          	sw	ra,28(sp)
c00015c8:	00812c23          	sw	s0,24(sp)
c00015cc:	00912a23          	sw	s1,20(sp)
c00015d0:	01212823          	sw	s2,16(sp)
c00015d4:	01312623          	sw	s3,12(sp)
c00015d8:	01412423          	sw	s4,8(sp)
c00015dc:	01512223          	sw	s5,4(sp)
c00015e0:	405020ef          	jal	ra,c00041e4 <nr_free_pages>
c00015e4:	401020ef          	jal	ra,c00041e4 <nr_free_pages>
c00015e8:	ac5ff0ef          	jal	ra,c00010ac <mm_create>
c00015ec:	00050493          	mv	s1,a0
c00015f0:	03200413          	li	s0,50
c00015f4:	01800913          	li	s2,24
c00015f8:	02051263          	bnez	a0,c000161c <vmm_init+0x5c>
c00015fc:	4640006f          	j	c0001a60 <vmm_init+0x4a0>
c0001600:	00852223          	sw	s0,4(a0)
c0001604:	00f52423          	sw	a5,8(a0)
c0001608:	00052623          	sw	zero,12(a0)
c000160c:	ffb40413          	addi	s0,s0,-5
c0001610:	00048513          	mv	a0,s1
c0001614:	badff0ef          	jal	ra,c00011c0 <insert_vma_struct>
c0001618:	02040c63          	beqz	s0,c0001650 <vmm_init+0x90>
c000161c:	00090513          	mv	a0,s2
c0001620:	78d000ef          	jal	ra,c00025ac <kmalloc>
c0001624:	00050593          	mv	a1,a0
c0001628:	00240793          	addi	a5,s0,2
c000162c:	fc051ae3          	bnez	a0,c0001600 <vmm_init+0x40>
c0001630:	00007697          	auipc	a3,0x7
c0001634:	70c68693          	addi	a3,a3,1804 # c0008d3c <commands+0xaec>
c0001638:	00007617          	auipc	a2,0x7
c000163c:	ffc60613          	addi	a2,a2,-4 # c0008634 <commands+0x3e4>
c0001640:	11300593          	li	a1,275
c0001644:	00007517          	auipc	a0,0x7
c0001648:	33850513          	addi	a0,a0,824 # c000897c <commands+0x72c>
c000164c:	c01fe0ef          	jal	ra,c000024c <__panic>
c0001650:	03700413          	li	s0,55
c0001654:	01800913          	li	s2,24
c0001658:	1f900993          	li	s3,505
c000165c:	0240006f          	j	c0001680 <vmm_init+0xc0>
c0001660:	00852223          	sw	s0,4(a0)
c0001664:	00f52423          	sw	a5,8(a0)
c0001668:	00052623          	sw	zero,12(a0)
c000166c:	00050593          	mv	a1,a0
c0001670:	00540413          	addi	s0,s0,5
c0001674:	00048513          	mv	a0,s1
c0001678:	b49ff0ef          	jal	ra,c00011c0 <insert_vma_struct>
c000167c:	03340a63          	beq	s0,s3,c00016b0 <vmm_init+0xf0>
c0001680:	00090513          	mv	a0,s2
c0001684:	729000ef          	jal	ra,c00025ac <kmalloc>
c0001688:	00240793          	addi	a5,s0,2
c000168c:	fc051ae3          	bnez	a0,c0001660 <vmm_init+0xa0>
c0001690:	00007697          	auipc	a3,0x7
c0001694:	6ac68693          	addi	a3,a3,1708 # c0008d3c <commands+0xaec>
c0001698:	00007617          	auipc	a2,0x7
c000169c:	f9c60613          	addi	a2,a2,-100 # c0008634 <commands+0x3e4>
c00016a0:	11900593          	li	a1,281
c00016a4:	00007517          	auipc	a0,0x7
c00016a8:	2d850513          	addi	a0,a0,728 # c000897c <commands+0x72c>
c00016ac:	ba1fe0ef          	jal	ra,c000024c <__panic>
c00016b0:	0044a783          	lw	a5,4(s1)
c00016b4:	00700713          	li	a4,7
c00016b8:	1fb00593          	li	a1,507
c00016bc:	2ef48263          	beq	s1,a5,c00019a0 <vmm_init+0x3e0>
c00016c0:	ff47a603          	lw	a2,-12(a5)
c00016c4:	ffe70693          	addi	a3,a4,-2
c00016c8:	26d61c63          	bne	a2,a3,c0001940 <vmm_init+0x380>
c00016cc:	ff87a683          	lw	a3,-8(a5)
c00016d0:	26e69863          	bne	a3,a4,c0001940 <vmm_init+0x380>
c00016d4:	00570713          	addi	a4,a4,5
c00016d8:	0047a783          	lw	a5,4(a5)
c00016dc:	feb710e3          	bne	a4,a1,c00016bc <vmm_init+0xfc>
c00016e0:	00500413          	li	s0,5
c00016e4:	1f900a93          	li	s5,505
c00016e8:	00040593          	mv	a1,s0
c00016ec:	00048513          	mv	a0,s1
c00016f0:	a71ff0ef          	jal	ra,c0001160 <find_vma>
c00016f4:	00050913          	mv	s2,a0
c00016f8:	2e050463          	beqz	a0,c00019e0 <vmm_init+0x420>
c00016fc:	00140593          	addi	a1,s0,1
c0001700:	00048513          	mv	a0,s1
c0001704:	a5dff0ef          	jal	ra,c0001160 <find_vma>
c0001708:	00050993          	mv	s3,a0
c000170c:	2a050a63          	beqz	a0,c00019c0 <vmm_init+0x400>
c0001710:	00240a13          	addi	s4,s0,2
c0001714:	000a0593          	mv	a1,s4
c0001718:	00048513          	mv	a0,s1
c000171c:	a45ff0ef          	jal	ra,c0001160 <find_vma>
c0001720:	32051063          	bnez	a0,c0001a40 <vmm_init+0x480>
c0001724:	00340593          	addi	a1,s0,3
c0001728:	00048513          	mv	a0,s1
c000172c:	a35ff0ef          	jal	ra,c0001160 <find_vma>
c0001730:	2e051863          	bnez	a0,c0001a20 <vmm_init+0x460>
c0001734:	00440593          	addi	a1,s0,4
c0001738:	00048513          	mv	a0,s1
c000173c:	a25ff0ef          	jal	ra,c0001160 <find_vma>
c0001740:	2c051063          	bnez	a0,c0001a00 <vmm_init+0x440>
c0001744:	00492783          	lw	a5,4(s2)
c0001748:	22f41c63          	bne	s0,a5,c0001980 <vmm_init+0x3c0>
c000174c:	00892783          	lw	a5,8(s2)
c0001750:	23479863          	bne	a5,s4,c0001980 <vmm_init+0x3c0>
c0001754:	0049a703          	lw	a4,4(s3)
c0001758:	20e41463          	bne	s0,a4,c0001960 <vmm_init+0x3a0>
c000175c:	0089a703          	lw	a4,8(s3)
c0001760:	20f71063          	bne	a4,a5,c0001960 <vmm_init+0x3a0>
c0001764:	00540413          	addi	s0,s0,5
c0001768:	f95410e3          	bne	s0,s5,c00016e8 <vmm_init+0x128>
c000176c:	00400413          	li	s0,4
c0001770:	fff00913          	li	s2,-1
c0001774:	00040593          	mv	a1,s0
c0001778:	00048513          	mv	a0,s1
c000177c:	9e5ff0ef          	jal	ra,c0001160 <find_vma>
c0001780:	02050e63          	beqz	a0,c00017bc <vmm_init+0x1fc>
c0001784:	00852683          	lw	a3,8(a0)
c0001788:	00452603          	lw	a2,4(a0)
c000178c:	00040593          	mv	a1,s0
c0001790:	00007517          	auipc	a0,0x7
c0001794:	47450513          	addi	a0,a0,1140 # c0008c04 <commands+0x9b4>
c0001798:	941fe0ef          	jal	ra,c00000d8 <cprintf>
c000179c:	00007697          	auipc	a3,0x7
c00017a0:	49068693          	addi	a3,a3,1168 # c0008c2c <commands+0x9dc>
c00017a4:	00007617          	auipc	a2,0x7
c00017a8:	e9060613          	addi	a2,a2,-368 # c0008634 <commands+0x3e4>
c00017ac:	13b00593          	li	a1,315
c00017b0:	00007517          	auipc	a0,0x7
c00017b4:	1cc50513          	addi	a0,a0,460 # c000897c <commands+0x72c>
c00017b8:	a95fe0ef          	jal	ra,c000024c <__panic>
c00017bc:	fff40413          	addi	s0,s0,-1
c00017c0:	fb241ae3          	bne	s0,s2,c0001774 <vmm_init+0x1b4>
c00017c4:	00048513          	mv	a0,s1
c00017c8:	af9ff0ef          	jal	ra,c00012c0 <mm_destroy>
c00017cc:	00007517          	auipc	a0,0x7
c00017d0:	47450513          	addi	a0,a0,1140 # c0008c40 <commands+0x9f0>
c00017d4:	905fe0ef          	jal	ra,c00000d8 <cprintf>
c00017d8:	20d020ef          	jal	ra,c00041e4 <nr_free_pages>
c00017dc:	00050993          	mv	s3,a0
c00017e0:	00034917          	auipc	s2,0x34
c00017e4:	68090913          	addi	s2,s2,1664 # c0035e60 <check_mm_struct>
c00017e8:	8c5ff0ef          	jal	ra,c00010ac <mm_create>
c00017ec:	00a92023          	sw	a0,0(s2)
c00017f0:	00050413          	mv	s0,a0
c00017f4:	2a050663          	beqz	a0,c0001aa0 <vmm_init+0x4e0>
c00017f8:	00034497          	auipc	s1,0x34
c00017fc:	6484a483          	lw	s1,1608(s1) # c0035e40 <boot_pgdir>
c0001800:	0004a783          	lw	a5,0(s1)
c0001804:	00952623          	sw	s1,12(a0)
c0001808:	26079c63          	bnez	a5,c0001a80 <vmm_init+0x4c0>
c000180c:	01800513          	li	a0,24
c0001810:	59d000ef          	jal	ra,c00025ac <kmalloc>
c0001814:	00050a13          	mv	s4,a0
c0001818:	10050463          	beqz	a0,c0001920 <vmm_init+0x360>
c000181c:	004007b7          	lui	a5,0x400
c0001820:	00fa2423          	sw	a5,8(s4)
c0001824:	00200793          	li	a5,2
c0001828:	00050593          	mv	a1,a0
c000182c:	00fa2623          	sw	a5,12(s4)
c0001830:	00040513          	mv	a0,s0
c0001834:	000a2223          	sw	zero,4(s4)
c0001838:	989ff0ef          	jal	ra,c00011c0 <insert_vma_struct>
c000183c:	10000593          	li	a1,256
c0001840:	00040513          	mv	a0,s0
c0001844:	91dff0ef          	jal	ra,c0001160 <find_vma>
c0001848:	00000793          	li	a5,0
c000184c:	06400713          	li	a4,100
c0001850:	2caa1463          	bne	s4,a0,c0001b18 <vmm_init+0x558>
c0001854:	10f78023          	sb	a5,256(a5) # 400100 <_binary_obj___user_exit_out_size+0x3fdaa4>
c0001858:	00178793          	addi	a5,a5,1
c000185c:	fee79ce3          	bne	a5,a4,c0001854 <vmm_init+0x294>
c0001860:	00001737          	lui	a4,0x1
c0001864:	35670713          	addi	a4,a4,854 # 1356 <_binary_obj___user_faultread_out_size-0xc12>
c0001868:	00000793          	li	a5,0
c000186c:	06400613          	li	a2,100
c0001870:	1007c683          	lbu	a3,256(a5)
c0001874:	00178793          	addi	a5,a5,1
c0001878:	40d70733          	sub	a4,a4,a3
c000187c:	fec79ae3          	bne	a5,a2,c0001870 <vmm_init+0x2b0>
c0001880:	26071c63          	bnez	a4,c0001af8 <vmm_init+0x538>
c0001884:	00000593          	li	a1,0
c0001888:	00048513          	mv	a0,s1
c000188c:	759020ef          	jal	ra,c00047e4 <page_remove>
c0001890:	0004a783          	lw	a5,0(s1)
c0001894:	00034717          	auipc	a4,0x34
c0001898:	5b072703          	lw	a4,1456(a4) # c0035e44 <npage>
c000189c:	00279793          	slli	a5,a5,0x2
c00018a0:	00c7d793          	srli	a5,a5,0xc
c00018a4:	22e7fe63          	bleu	a4,a5,c0001ae0 <vmm_init+0x520>
c00018a8:	0002b717          	auipc	a4,0x2b
c00018ac:	16872703          	lw	a4,360(a4) # c002ca10 <nbase>
c00018b0:	40e787b3          	sub	a5,a5,a4
c00018b4:	00579793          	slli	a5,a5,0x5
c00018b8:	00034517          	auipc	a0,0x34
c00018bc:	66852503          	lw	a0,1640(a0) # c0035f20 <pages>
c00018c0:	00f50533          	add	a0,a0,a5
c00018c4:	00100593          	li	a1,1
c00018c8:	0b9020ef          	jal	ra,c0004180 <free_pages>
c00018cc:	0004a023          	sw	zero,0(s1)
c00018d0:	00042623          	sw	zero,12(s0)
c00018d4:	00040513          	mv	a0,s0
c00018d8:	9e9ff0ef          	jal	ra,c00012c0 <mm_destroy>
c00018dc:	00092023          	sw	zero,0(s2)
c00018e0:	105020ef          	jal	ra,c00041e4 <nr_free_pages>
c00018e4:	1ca99e63          	bne	s3,a0,c0001ac0 <vmm_init+0x500>
c00018e8:	00007517          	auipc	a0,0x7
c00018ec:	42050513          	addi	a0,a0,1056 # c0008d08 <commands+0xab8>
c00018f0:	fe8fe0ef          	jal	ra,c00000d8 <cprintf>
c00018f4:	01c12083          	lw	ra,28(sp)
c00018f8:	01812403          	lw	s0,24(sp)
c00018fc:	01412483          	lw	s1,20(sp)
c0001900:	01012903          	lw	s2,16(sp)
c0001904:	00c12983          	lw	s3,12(sp)
c0001908:	00812a03          	lw	s4,8(sp)
c000190c:	00412a83          	lw	s5,4(sp)
c0001910:	00007517          	auipc	a0,0x7
c0001914:	41450513          	addi	a0,a0,1044 # c0008d24 <commands+0xad4>
c0001918:	02010113          	addi	sp,sp,32
c000191c:	fbcfe06f          	j	c00000d8 <cprintf>
c0001920:	00007697          	auipc	a3,0x7
c0001924:	41c68693          	addi	a3,a3,1052 # c0008d3c <commands+0xaec>
c0001928:	00007617          	auipc	a2,0x7
c000192c:	d0c60613          	addi	a2,a2,-756 # c0008634 <commands+0x3e4>
c0001930:	15200593          	li	a1,338
c0001934:	00007517          	auipc	a0,0x7
c0001938:	04850513          	addi	a0,a0,72 # c000897c <commands+0x72c>
c000193c:	911fe0ef          	jal	ra,c000024c <__panic>
c0001940:	00007697          	auipc	a3,0x7
c0001944:	1dc68693          	addi	a3,a3,476 # c0008b1c <commands+0x8cc>
c0001948:	00007617          	auipc	a2,0x7
c000194c:	cec60613          	addi	a2,a2,-788 # c0008634 <commands+0x3e4>
c0001950:	12200593          	li	a1,290
c0001954:	00007517          	auipc	a0,0x7
c0001958:	02850513          	addi	a0,a0,40 # c000897c <commands+0x72c>
c000195c:	8f1fe0ef          	jal	ra,c000024c <__panic>
c0001960:	00007697          	auipc	a3,0x7
c0001964:	27468693          	addi	a3,a3,628 # c0008bd4 <commands+0x984>
c0001968:	00007617          	auipc	a2,0x7
c000196c:	ccc60613          	addi	a2,a2,-820 # c0008634 <commands+0x3e4>
c0001970:	13300593          	li	a1,307
c0001974:	00007517          	auipc	a0,0x7
c0001978:	00850513          	addi	a0,a0,8 # c000897c <commands+0x72c>
c000197c:	8d1fe0ef          	jal	ra,c000024c <__panic>
c0001980:	00007697          	auipc	a3,0x7
c0001984:	22468693          	addi	a3,a3,548 # c0008ba4 <commands+0x954>
c0001988:	00007617          	auipc	a2,0x7
c000198c:	cac60613          	addi	a2,a2,-852 # c0008634 <commands+0x3e4>
c0001990:	13200593          	li	a1,306
c0001994:	00007517          	auipc	a0,0x7
c0001998:	fe850513          	addi	a0,a0,-24 # c000897c <commands+0x72c>
c000199c:	8b1fe0ef          	jal	ra,c000024c <__panic>
c00019a0:	00007697          	auipc	a3,0x7
c00019a4:	16468693          	addi	a3,a3,356 # c0008b04 <commands+0x8b4>
c00019a8:	00007617          	auipc	a2,0x7
c00019ac:	c8c60613          	addi	a2,a2,-884 # c0008634 <commands+0x3e4>
c00019b0:	12000593          	li	a1,288
c00019b4:	00007517          	auipc	a0,0x7
c00019b8:	fc850513          	addi	a0,a0,-56 # c000897c <commands+0x72c>
c00019bc:	891fe0ef          	jal	ra,c000024c <__panic>
c00019c0:	00007697          	auipc	a3,0x7
c00019c4:	1a468693          	addi	a3,a3,420 # c0008b64 <commands+0x914>
c00019c8:	00007617          	auipc	a2,0x7
c00019cc:	c6c60613          	addi	a2,a2,-916 # c0008634 <commands+0x3e4>
c00019d0:	12a00593          	li	a1,298
c00019d4:	00007517          	auipc	a0,0x7
c00019d8:	fa850513          	addi	a0,a0,-88 # c000897c <commands+0x72c>
c00019dc:	871fe0ef          	jal	ra,c000024c <__panic>
c00019e0:	00007697          	auipc	a3,0x7
c00019e4:	17468693          	addi	a3,a3,372 # c0008b54 <commands+0x904>
c00019e8:	00007617          	auipc	a2,0x7
c00019ec:	c4c60613          	addi	a2,a2,-948 # c0008634 <commands+0x3e4>
c00019f0:	12800593          	li	a1,296
c00019f4:	00007517          	auipc	a0,0x7
c00019f8:	f8850513          	addi	a0,a0,-120 # c000897c <commands+0x72c>
c00019fc:	851fe0ef          	jal	ra,c000024c <__panic>
c0001a00:	00007697          	auipc	a3,0x7
c0001a04:	19468693          	addi	a3,a3,404 # c0008b94 <commands+0x944>
c0001a08:	00007617          	auipc	a2,0x7
c0001a0c:	c2c60613          	addi	a2,a2,-980 # c0008634 <commands+0x3e4>
c0001a10:	13000593          	li	a1,304
c0001a14:	00007517          	auipc	a0,0x7
c0001a18:	f6850513          	addi	a0,a0,-152 # c000897c <commands+0x72c>
c0001a1c:	831fe0ef          	jal	ra,c000024c <__panic>
c0001a20:	00007697          	auipc	a3,0x7
c0001a24:	16468693          	addi	a3,a3,356 # c0008b84 <commands+0x934>
c0001a28:	00007617          	auipc	a2,0x7
c0001a2c:	c0c60613          	addi	a2,a2,-1012 # c0008634 <commands+0x3e4>
c0001a30:	12e00593          	li	a1,302
c0001a34:	00007517          	auipc	a0,0x7
c0001a38:	f4850513          	addi	a0,a0,-184 # c000897c <commands+0x72c>
c0001a3c:	811fe0ef          	jal	ra,c000024c <__panic>
c0001a40:	00007697          	auipc	a3,0x7
c0001a44:	13468693          	addi	a3,a3,308 # c0008b74 <commands+0x924>
c0001a48:	00007617          	auipc	a2,0x7
c0001a4c:	bec60613          	addi	a2,a2,-1044 # c0008634 <commands+0x3e4>
c0001a50:	12c00593          	li	a1,300
c0001a54:	00007517          	auipc	a0,0x7
c0001a58:	f2850513          	addi	a0,a0,-216 # c000897c <commands+0x72c>
c0001a5c:	ff0fe0ef          	jal	ra,c000024c <__panic>
c0001a60:	00007697          	auipc	a3,0x7
c0001a64:	09868693          	addi	a3,a3,152 # c0008af8 <commands+0x8a8>
c0001a68:	00007617          	auipc	a2,0x7
c0001a6c:	bcc60613          	addi	a2,a2,-1076 # c0008634 <commands+0x3e4>
c0001a70:	10c00593          	li	a1,268
c0001a74:	00007517          	auipc	a0,0x7
c0001a78:	f0850513          	addi	a0,a0,-248 # c000897c <commands+0x72c>
c0001a7c:	fd0fe0ef          	jal	ra,c000024c <__panic>
c0001a80:	00007697          	auipc	a3,0x7
c0001a84:	1f868693          	addi	a3,a3,504 # c0008c78 <commands+0xa28>
c0001a88:	00007617          	auipc	a2,0x7
c0001a8c:	bac60613          	addi	a2,a2,-1108 # c0008634 <commands+0x3e4>
c0001a90:	14f00593          	li	a1,335
c0001a94:	00007517          	auipc	a0,0x7
c0001a98:	ee850513          	addi	a0,a0,-280 # c000897c <commands+0x72c>
c0001a9c:	fb0fe0ef          	jal	ra,c000024c <__panic>
c0001aa0:	00007697          	auipc	a3,0x7
c0001aa4:	1c068693          	addi	a3,a3,448 # c0008c60 <commands+0xa10>
c0001aa8:	00007617          	auipc	a2,0x7
c0001aac:	b8c60613          	addi	a2,a2,-1140 # c0008634 <commands+0x3e4>
c0001ab0:	14b00593          	li	a1,331
c0001ab4:	00007517          	auipc	a0,0x7
c0001ab8:	ec850513          	addi	a0,a0,-312 # c000897c <commands+0x72c>
c0001abc:	f90fe0ef          	jal	ra,c000024c <__panic>
c0001ac0:	00007697          	auipc	a3,0x7
c0001ac4:	22068693          	addi	a3,a3,544 # c0008ce0 <commands+0xa90>
c0001ac8:	00007617          	auipc	a2,0x7
c0001acc:	b6c60613          	addi	a2,a2,-1172 # c0008634 <commands+0x3e4>
c0001ad0:	16b00593          	li	a1,363
c0001ad4:	00007517          	auipc	a0,0x7
c0001ad8:	ea850513          	addi	a0,a0,-344 # c000897c <commands+0x72c>
c0001adc:	f70fe0ef          	jal	ra,c000024c <__panic>
c0001ae0:	00007617          	auipc	a2,0x7
c0001ae4:	1d060613          	addi	a2,a2,464 # c0008cb0 <commands+0xa60>
c0001ae8:	06200593          	li	a1,98
c0001aec:	00007517          	auipc	a0,0x7
c0001af0:	1e450513          	addi	a0,a0,484 # c0008cd0 <commands+0xa80>
c0001af4:	f58fe0ef          	jal	ra,c000024c <__panic>
c0001af8:	00007697          	auipc	a3,0x7
c0001afc:	1ac68693          	addi	a3,a3,428 # c0008ca4 <commands+0xa54>
c0001b00:	00007617          	auipc	a2,0x7
c0001b04:	b3460613          	addi	a2,a2,-1228 # c0008634 <commands+0x3e4>
c0001b08:	16100593          	li	a1,353
c0001b0c:	00007517          	auipc	a0,0x7
c0001b10:	e7050513          	addi	a0,a0,-400 # c000897c <commands+0x72c>
c0001b14:	f38fe0ef          	jal	ra,c000024c <__panic>
c0001b18:	00007697          	auipc	a3,0x7
c0001b1c:	17068693          	addi	a3,a3,368 # c0008c88 <commands+0xa38>
c0001b20:	00007617          	auipc	a2,0x7
c0001b24:	b1460613          	addi	a2,a2,-1260 # c0008634 <commands+0x3e4>
c0001b28:	15700593          	li	a1,343
c0001b2c:	00007517          	auipc	a0,0x7
c0001b30:	e5050513          	addi	a0,a0,-432 # c000897c <commands+0x72c>
c0001b34:	f18fe0ef          	jal	ra,c000024c <__panic>

c0001b38 <do_pgfault>:
c0001b38:	fd010113          	addi	sp,sp,-48
c0001b3c:	00060593          	mv	a1,a2
c0001b40:	02812423          	sw	s0,40(sp)
c0001b44:	02912223          	sw	s1,36(sp)
c0001b48:	02112623          	sw	ra,44(sp)
c0001b4c:	03212023          	sw	s2,32(sp)
c0001b50:	01312e23          	sw	s3,28(sp)
c0001b54:	00060413          	mv	s0,a2
c0001b58:	00050493          	mv	s1,a0
c0001b5c:	e04ff0ef          	jal	ra,c0001160 <find_vma>
c0001b60:	00034797          	auipc	a5,0x34
c0001b64:	2d07a783          	lw	a5,720(a5) # c0035e30 <pgfault_num>
c0001b68:	00178793          	addi	a5,a5,1
c0001b6c:	00034297          	auipc	t0,0x34
c0001b70:	2cf2a223          	sw	a5,708(t0) # c0035e30 <pgfault_num>
c0001b74:	10050c63          	beqz	a0,c0001c8c <do_pgfault+0x154>
c0001b78:	00452783          	lw	a5,4(a0)
c0001b7c:	10f46863          	bltu	s0,a5,c0001c8c <do_pgfault+0x154>
c0001b80:	00c52783          	lw	a5,12(a0)
c0001b84:	01000993          	li	s3,16
c0001b88:	0027f793          	andi	a5,a5,2
c0001b8c:	0a079063          	bnez	a5,c0001c2c <do_pgfault+0xf4>
c0001b90:	fffff637          	lui	a2,0xfffff
c0001b94:	00c4a503          	lw	a0,12(s1)
c0001b98:	00c47433          	and	s0,s0,a2
c0001b9c:	00040593          	mv	a1,s0
c0001ba0:	00100613          	li	a2,1
c0001ba4:	698020ef          	jal	ra,c000423c <get_pte>
c0001ba8:	10050863          	beqz	a0,c0001cb8 <do_pgfault+0x180>
c0001bac:	00052583          	lw	a1,0(a0)
c0001bb0:	0a058863          	beqz	a1,c0001c60 <do_pgfault+0x128>
c0001bb4:	00034797          	auipc	a5,0x34
c0001bb8:	2887a783          	lw	a5,648(a5) # c0035e3c <swap_init_ok>
c0001bbc:	0e078463          	beqz	a5,c0001ca4 <do_pgfault+0x16c>
c0001bc0:	00c10613          	addi	a2,sp,12
c0001bc4:	00040593          	mv	a1,s0
c0001bc8:	00048513          	mv	a0,s1
c0001bcc:	00012623          	sw	zero,12(sp)
c0001bd0:	63c010ef          	jal	ra,c000320c <swap_in>
c0001bd4:	00050913          	mv	s2,a0
c0001bd8:	04051e63          	bnez	a0,c0001c34 <do_pgfault+0xfc>
c0001bdc:	00c12583          	lw	a1,12(sp)
c0001be0:	00c4a503          	lw	a0,12(s1)
c0001be4:	00098693          	mv	a3,s3
c0001be8:	00040613          	mv	a2,s0
c0001bec:	4a5020ef          	jal	ra,c0004890 <page_insert>
c0001bf0:	00c12603          	lw	a2,12(sp)
c0001bf4:	00100693          	li	a3,1
c0001bf8:	00040593          	mv	a1,s0
c0001bfc:	00048513          	mv	a0,s1
c0001c00:	450010ef          	jal	ra,c0003050 <swap_map_swappable>
c0001c04:	00c12783          	lw	a5,12(sp)
c0001c08:	0087ae23          	sw	s0,28(a5)
c0001c0c:	02c12083          	lw	ra,44(sp)
c0001c10:	00090513          	mv	a0,s2
c0001c14:	02812403          	lw	s0,40(sp)
c0001c18:	02412483          	lw	s1,36(sp)
c0001c1c:	02012903          	lw	s2,32(sp)
c0001c20:	01c12983          	lw	s3,28(sp)
c0001c24:	03010113          	addi	sp,sp,48
c0001c28:	00008067          	ret
c0001c2c:	01700993          	li	s3,23
c0001c30:	f61ff06f          	j	c0001b90 <do_pgfault+0x58>
c0001c34:	00007517          	auipc	a0,0x7
c0001c38:	dd050513          	addi	a0,a0,-560 # c0008a04 <commands+0x7b4>
c0001c3c:	c9cfe0ef          	jal	ra,c00000d8 <cprintf>
c0001c40:	02c12083          	lw	ra,44(sp)
c0001c44:	00090513          	mv	a0,s2
c0001c48:	02812403          	lw	s0,40(sp)
c0001c4c:	02412483          	lw	s1,36(sp)
c0001c50:	02012903          	lw	s2,32(sp)
c0001c54:	01c12983          	lw	s3,28(sp)
c0001c58:	03010113          	addi	sp,sp,48
c0001c5c:	00008067          	ret
c0001c60:	00c4a503          	lw	a0,12(s1)
c0001c64:	00098613          	mv	a2,s3
c0001c68:	00040593          	mv	a1,s0
c0001c6c:	7f5020ef          	jal	ra,c0004c60 <pgdir_alloc_page>
c0001c70:	00000913          	li	s2,0
c0001c74:	f8051ce3          	bnez	a0,c0001c0c <do_pgfault+0xd4>
c0001c78:	00007517          	auipc	a0,0x7
c0001c7c:	d6450513          	addi	a0,a0,-668 # c00089dc <commands+0x78c>
c0001c80:	c58fe0ef          	jal	ra,c00000d8 <cprintf>
c0001c84:	ffc00913          	li	s2,-4
c0001c88:	f85ff06f          	j	c0001c0c <do_pgfault+0xd4>
c0001c8c:	00040593          	mv	a1,s0
c0001c90:	00007517          	auipc	a0,0x7
c0001c94:	cfc50513          	addi	a0,a0,-772 # c000898c <commands+0x73c>
c0001c98:	c40fe0ef          	jal	ra,c00000d8 <cprintf>
c0001c9c:	ffd00913          	li	s2,-3
c0001ca0:	f6dff06f          	j	c0001c0c <do_pgfault+0xd4>
c0001ca4:	00007517          	auipc	a0,0x7
c0001ca8:	d8050513          	addi	a0,a0,-640 # c0008a24 <commands+0x7d4>
c0001cac:	c2cfe0ef          	jal	ra,c00000d8 <cprintf>
c0001cb0:	ffc00913          	li	s2,-4
c0001cb4:	f59ff06f          	j	c0001c0c <do_pgfault+0xd4>
c0001cb8:	00007517          	auipc	a0,0x7
c0001cbc:	d0450513          	addi	a0,a0,-764 # c00089bc <commands+0x76c>
c0001cc0:	c18fe0ef          	jal	ra,c00000d8 <cprintf>
c0001cc4:	ffc00913          	li	s2,-4
c0001cc8:	f45ff06f          	j	c0001c0c <do_pgfault+0xd4>

c0001ccc <user_mem_check>:
c0001ccc:	fe010113          	addi	sp,sp,-32
c0001cd0:	00812c23          	sw	s0,24(sp)
c0001cd4:	00112e23          	sw	ra,28(sp)
c0001cd8:	00912a23          	sw	s1,20(sp)
c0001cdc:	01212823          	sw	s2,16(sp)
c0001ce0:	01312623          	sw	s3,12(sp)
c0001ce4:	01412423          	sw	s4,8(sp)
c0001ce8:	00058413          	mv	s0,a1
c0001cec:	08050c63          	beqz	a0,c0001d84 <user_mem_check+0xb8>
c0001cf0:	002007b7          	lui	a5,0x200
c0001cf4:	06f5e663          	bltu	a1,a5,c0001d60 <user_mem_check+0x94>
c0001cf8:	00c584b3          	add	s1,a1,a2
c0001cfc:	0695f263          	bleu	s1,a1,c0001d60 <user_mem_check+0x94>
c0001d00:	b00007b7          	lui	a5,0xb0000
c0001d04:	0497ee63          	bltu	a5,s1,c0001d60 <user_mem_check+0x94>
c0001d08:	00050913          	mv	s2,a0
c0001d0c:	00068993          	mv	s3,a3
c0001d10:	00001a37          	lui	s4,0x1
c0001d14:	0240006f          	j	c0001d38 <user_mem_check+0x6c>
c0001d18:	0027f693          	andi	a3,a5,2
c0001d1c:	01470733          	add	a4,a4,s4
c0001d20:	0087f793          	andi	a5,a5,8
c0001d24:	02068e63          	beqz	a3,c0001d60 <user_mem_check+0x94>
c0001d28:	00078463          	beqz	a5,c0001d30 <user_mem_check+0x64>
c0001d2c:	02e46a63          	bltu	s0,a4,c0001d60 <user_mem_check+0x94>
c0001d30:	00852403          	lw	s0,8(a0)
c0001d34:	06947463          	bleu	s1,s0,c0001d9c <user_mem_check+0xd0>
c0001d38:	00040593          	mv	a1,s0
c0001d3c:	00090513          	mv	a0,s2
c0001d40:	c20ff0ef          	jal	ra,c0001160 <find_vma>
c0001d44:	00050e63          	beqz	a0,c0001d60 <user_mem_check+0x94>
c0001d48:	00452703          	lw	a4,4(a0)
c0001d4c:	00e46a63          	bltu	s0,a4,c0001d60 <user_mem_check+0x94>
c0001d50:	00c52783          	lw	a5,12(a0)
c0001d54:	fc0992e3          	bnez	s3,c0001d18 <user_mem_check+0x4c>
c0001d58:	0017f793          	andi	a5,a5,1
c0001d5c:	fc079ae3          	bnez	a5,c0001d30 <user_mem_check+0x64>
c0001d60:	00000513          	li	a0,0
c0001d64:	01c12083          	lw	ra,28(sp)
c0001d68:	01812403          	lw	s0,24(sp)
c0001d6c:	01412483          	lw	s1,20(sp)
c0001d70:	01012903          	lw	s2,16(sp)
c0001d74:	00c12983          	lw	s3,12(sp)
c0001d78:	00812a03          	lw	s4,8(sp)
c0001d7c:	02010113          	addi	sp,sp,32
c0001d80:	00008067          	ret
c0001d84:	c00007b7          	lui	a5,0xc0000
c0001d88:	fcf5ece3          	bltu	a1,a5,c0001d60 <user_mem_check+0x94>
c0001d8c:	00c58633          	add	a2,a1,a2
c0001d90:	fcc5f8e3          	bleu	a2,a1,c0001d60 <user_mem_check+0x94>
c0001d94:	f80007b7          	lui	a5,0xf8000
c0001d98:	fcc7e4e3          	bltu	a5,a2,c0001d60 <user_mem_check+0x94>
c0001d9c:	00100513          	li	a0,1
c0001da0:	fc5ff06f          	j	c0001d64 <user_mem_check+0x98>

c0001da4 <_fifo_init_mm>:
c0001da4:	00034797          	auipc	a5,0x34
c0001da8:	0c078793          	addi	a5,a5,192 # c0035e64 <pra_list_head>
c0001dac:	00f52a23          	sw	a5,20(a0)
c0001db0:	00f7a223          	sw	a5,4(a5)
c0001db4:	00f7a023          	sw	a5,0(a5)
c0001db8:	00000513          	li	a0,0
c0001dbc:	00008067          	ret

c0001dc0 <_fifo_init>:
c0001dc0:	00000513          	li	a0,0
c0001dc4:	00008067          	ret

c0001dc8 <_fifo_set_unswappable>:
c0001dc8:	00000513          	li	a0,0
c0001dcc:	00008067          	ret

c0001dd0 <_fifo_tick_event>:
c0001dd0:	00000513          	li	a0,0
c0001dd4:	00008067          	ret

c0001dd8 <_fifo_check_swap>:
c0001dd8:	fd010113          	addi	sp,sp,-48
c0001ddc:	03212023          	sw	s2,32(sp)
c0001de0:	01312e23          	sw	s3,28(sp)
c0001de4:	00007517          	auipc	a0,0x7
c0001de8:	f6450513          	addi	a0,a0,-156 # c0008d48 <commands+0xaf8>
c0001dec:	00003937          	lui	s2,0x3
c0001df0:	00c00993          	li	s3,12
c0001df4:	02812423          	sw	s0,40(sp)
c0001df8:	02112623          	sw	ra,44(sp)
c0001dfc:	02912223          	sw	s1,36(sp)
c0001e00:	01412c23          	sw	s4,24(sp)
c0001e04:	01512a23          	sw	s5,20(sp)
c0001e08:	01612823          	sw	s6,16(sp)
c0001e0c:	01712623          	sw	s7,12(sp)
c0001e10:	01812423          	sw	s8,8(sp)
c0001e14:	ac4fe0ef          	jal	ra,c00000d8 <cprintf>
c0001e18:	01390023          	sb	s3,0(s2) # 3000 <_binary_obj___user_exit_out_size+0x9a4>
c0001e1c:	00034417          	auipc	s0,0x34
c0001e20:	01442403          	lw	s0,20(s0) # c0035e30 <pgfault_num>
c0001e24:	00400793          	li	a5,4
c0001e28:	1af41c63          	bne	s0,a5,c0001fe0 <_fifo_check_swap+0x208>
c0001e2c:	00007517          	auipc	a0,0x7
c0001e30:	f6850513          	addi	a0,a0,-152 # c0008d94 <commands+0xb44>
c0001e34:	00001ab7          	lui	s5,0x1
c0001e38:	00a00b13          	li	s6,10
c0001e3c:	a9cfe0ef          	jal	ra,c00000d8 <cprintf>
c0001e40:	016a8023          	sb	s6,0(s5) # 1000 <_binary_obj___user_faultread_out_size-0xf68>
c0001e44:	00034497          	auipc	s1,0x34
c0001e48:	fec4a483          	lw	s1,-20(s1) # c0035e30 <pgfault_num>
c0001e4c:	30849a63          	bne	s1,s0,c0002160 <_fifo_check_swap+0x388>
c0001e50:	00007517          	auipc	a0,0x7
c0001e54:	f6c50513          	addi	a0,a0,-148 # c0008dbc <commands+0xb6c>
c0001e58:	00004bb7          	lui	s7,0x4
c0001e5c:	00d00c13          	li	s8,13
c0001e60:	a78fe0ef          	jal	ra,c00000d8 <cprintf>
c0001e64:	018b8023          	sb	s8,0(s7) # 4000 <_binary_obj___user_exit_out_size+0x19a4>
c0001e68:	00034a17          	auipc	s4,0x34
c0001e6c:	fc8a2a03          	lw	s4,-56(s4) # c0035e30 <pgfault_num>
c0001e70:	2c9a1863          	bne	s4,s1,c0002140 <_fifo_check_swap+0x368>
c0001e74:	00007517          	auipc	a0,0x7
c0001e78:	f7050513          	addi	a0,a0,-144 # c0008de4 <commands+0xb94>
c0001e7c:	00002437          	lui	s0,0x2
c0001e80:	00b00493          	li	s1,11
c0001e84:	a54fe0ef          	jal	ra,c00000d8 <cprintf>
c0001e88:	00940023          	sb	s1,0(s0) # 2000 <_binary_obj___user_softint_out_size+0x94>
c0001e8c:	00034797          	auipc	a5,0x34
c0001e90:	fa47a783          	lw	a5,-92(a5) # c0035e30 <pgfault_num>
c0001e94:	29479663          	bne	a5,s4,c0002120 <_fifo_check_swap+0x348>
c0001e98:	00007517          	auipc	a0,0x7
c0001e9c:	f7450513          	addi	a0,a0,-140 # c0008e0c <commands+0xbbc>
c0001ea0:	a38fe0ef          	jal	ra,c00000d8 <cprintf>
c0001ea4:	000057b7          	lui	a5,0x5
c0001ea8:	00e00713          	li	a4,14
c0001eac:	00e78023          	sb	a4,0(a5) # 5000 <_binary_obj___user_exit_out_size+0x29a4>
c0001eb0:	00034a17          	auipc	s4,0x34
c0001eb4:	f80a2a03          	lw	s4,-128(s4) # c0035e30 <pgfault_num>
c0001eb8:	00500793          	li	a5,5
c0001ebc:	24fa1263          	bne	s4,a5,c0002100 <_fifo_check_swap+0x328>
c0001ec0:	00007517          	auipc	a0,0x7
c0001ec4:	f2450513          	addi	a0,a0,-220 # c0008de4 <commands+0xb94>
c0001ec8:	a10fe0ef          	jal	ra,c00000d8 <cprintf>
c0001ecc:	00940023          	sb	s1,0(s0)
c0001ed0:	00034797          	auipc	a5,0x34
c0001ed4:	f607a783          	lw	a5,-160(a5) # c0035e30 <pgfault_num>
c0001ed8:	21479463          	bne	a5,s4,c00020e0 <_fifo_check_swap+0x308>
c0001edc:	00007517          	auipc	a0,0x7
c0001ee0:	eb850513          	addi	a0,a0,-328 # c0008d94 <commands+0xb44>
c0001ee4:	9f4fe0ef          	jal	ra,c00000d8 <cprintf>
c0001ee8:	016a8023          	sb	s6,0(s5)
c0001eec:	00034717          	auipc	a4,0x34
c0001ef0:	f4472703          	lw	a4,-188(a4) # c0035e30 <pgfault_num>
c0001ef4:	00600793          	li	a5,6
c0001ef8:	1cf71463          	bne	a4,a5,c00020c0 <_fifo_check_swap+0x2e8>
c0001efc:	00007517          	auipc	a0,0x7
c0001f00:	ee850513          	addi	a0,a0,-280 # c0008de4 <commands+0xb94>
c0001f04:	9d4fe0ef          	jal	ra,c00000d8 <cprintf>
c0001f08:	00940023          	sb	s1,0(s0)
c0001f0c:	00034717          	auipc	a4,0x34
c0001f10:	f2472703          	lw	a4,-220(a4) # c0035e30 <pgfault_num>
c0001f14:	00700793          	li	a5,7
c0001f18:	18f71463          	bne	a4,a5,c00020a0 <_fifo_check_swap+0x2c8>
c0001f1c:	00007517          	auipc	a0,0x7
c0001f20:	e2c50513          	addi	a0,a0,-468 # c0008d48 <commands+0xaf8>
c0001f24:	9b4fe0ef          	jal	ra,c00000d8 <cprintf>
c0001f28:	01390023          	sb	s3,0(s2)
c0001f2c:	00034717          	auipc	a4,0x34
c0001f30:	f0472703          	lw	a4,-252(a4) # c0035e30 <pgfault_num>
c0001f34:	00800793          	li	a5,8
c0001f38:	14f71463          	bne	a4,a5,c0002080 <_fifo_check_swap+0x2a8>
c0001f3c:	00007517          	auipc	a0,0x7
c0001f40:	e8050513          	addi	a0,a0,-384 # c0008dbc <commands+0xb6c>
c0001f44:	994fe0ef          	jal	ra,c00000d8 <cprintf>
c0001f48:	018b8023          	sb	s8,0(s7)
c0001f4c:	00034717          	auipc	a4,0x34
c0001f50:	ee472703          	lw	a4,-284(a4) # c0035e30 <pgfault_num>
c0001f54:	00900793          	li	a5,9
c0001f58:	10f71463          	bne	a4,a5,c0002060 <_fifo_check_swap+0x288>
c0001f5c:	00007517          	auipc	a0,0x7
c0001f60:	eb050513          	addi	a0,a0,-336 # c0008e0c <commands+0xbbc>
c0001f64:	974fe0ef          	jal	ra,c00000d8 <cprintf>
c0001f68:	000057b7          	lui	a5,0x5
c0001f6c:	00e00713          	li	a4,14
c0001f70:	00e78023          	sb	a4,0(a5) # 5000 <_binary_obj___user_exit_out_size+0x29a4>
c0001f74:	00034417          	auipc	s0,0x34
c0001f78:	ebc42403          	lw	s0,-324(s0) # c0035e30 <pgfault_num>
c0001f7c:	00a00793          	li	a5,10
c0001f80:	0cf41063          	bne	s0,a5,c0002040 <_fifo_check_swap+0x268>
c0001f84:	00007517          	auipc	a0,0x7
c0001f88:	e1050513          	addi	a0,a0,-496 # c0008d94 <commands+0xb44>
c0001f8c:	94cfe0ef          	jal	ra,c00000d8 <cprintf>
c0001f90:	000017b7          	lui	a5,0x1
c0001f94:	0007c783          	lbu	a5,0(a5) # 1000 <_binary_obj___user_faultread_out_size-0xf68>
c0001f98:	08879463          	bne	a5,s0,c0002020 <_fifo_check_swap+0x248>
c0001f9c:	00034717          	auipc	a4,0x34
c0001fa0:	e9472703          	lw	a4,-364(a4) # c0035e30 <pgfault_num>
c0001fa4:	00b00793          	li	a5,11
c0001fa8:	04f71c63          	bne	a4,a5,c0002000 <_fifo_check_swap+0x228>
c0001fac:	02c12083          	lw	ra,44(sp)
c0001fb0:	00000513          	li	a0,0
c0001fb4:	02812403          	lw	s0,40(sp)
c0001fb8:	02412483          	lw	s1,36(sp)
c0001fbc:	02012903          	lw	s2,32(sp)
c0001fc0:	01c12983          	lw	s3,28(sp)
c0001fc4:	01812a03          	lw	s4,24(sp)
c0001fc8:	01412a83          	lw	s5,20(sp)
c0001fcc:	01012b03          	lw	s6,16(sp)
c0001fd0:	00c12b83          	lw	s7,12(sp)
c0001fd4:	00812c03          	lw	s8,8(sp)
c0001fd8:	03010113          	addi	sp,sp,48
c0001fdc:	00008067          	ret
c0001fe0:	00007697          	auipc	a3,0x7
c0001fe4:	d9068693          	addi	a3,a3,-624 # c0008d70 <commands+0xb20>
c0001fe8:	00006617          	auipc	a2,0x6
c0001fec:	64c60613          	addi	a2,a2,1612 # c0008634 <commands+0x3e4>
c0001ff0:	05100593          	li	a1,81
c0001ff4:	00007517          	auipc	a0,0x7
c0001ff8:	d8c50513          	addi	a0,a0,-628 # c0008d80 <commands+0xb30>
c0001ffc:	a50fe0ef          	jal	ra,c000024c <__panic>
c0002000:	00007697          	auipc	a3,0x7
c0002004:	eb868693          	addi	a3,a3,-328 # c0008eb8 <commands+0xc68>
c0002008:	00006617          	auipc	a2,0x6
c000200c:	62c60613          	addi	a2,a2,1580 # c0008634 <commands+0x3e4>
c0002010:	07300593          	li	a1,115
c0002014:	00007517          	auipc	a0,0x7
c0002018:	d6c50513          	addi	a0,a0,-660 # c0008d80 <commands+0xb30>
c000201c:	a30fe0ef          	jal	ra,c000024c <__panic>
c0002020:	00007697          	auipc	a3,0x7
c0002024:	e7468693          	addi	a3,a3,-396 # c0008e94 <commands+0xc44>
c0002028:	00006617          	auipc	a2,0x6
c000202c:	60c60613          	addi	a2,a2,1548 # c0008634 <commands+0x3e4>
c0002030:	07100593          	li	a1,113
c0002034:	00007517          	auipc	a0,0x7
c0002038:	d4c50513          	addi	a0,a0,-692 # c0008d80 <commands+0xb30>
c000203c:	a10fe0ef          	jal	ra,c000024c <__panic>
c0002040:	00007697          	auipc	a3,0x7
c0002044:	e4468693          	addi	a3,a3,-444 # c0008e84 <commands+0xc34>
c0002048:	00006617          	auipc	a2,0x6
c000204c:	5ec60613          	addi	a2,a2,1516 # c0008634 <commands+0x3e4>
c0002050:	06f00593          	li	a1,111
c0002054:	00007517          	auipc	a0,0x7
c0002058:	d2c50513          	addi	a0,a0,-724 # c0008d80 <commands+0xb30>
c000205c:	9f0fe0ef          	jal	ra,c000024c <__panic>
c0002060:	00007697          	auipc	a3,0x7
c0002064:	e1468693          	addi	a3,a3,-492 # c0008e74 <commands+0xc24>
c0002068:	00006617          	auipc	a2,0x6
c000206c:	5cc60613          	addi	a2,a2,1484 # c0008634 <commands+0x3e4>
c0002070:	06c00593          	li	a1,108
c0002074:	00007517          	auipc	a0,0x7
c0002078:	d0c50513          	addi	a0,a0,-756 # c0008d80 <commands+0xb30>
c000207c:	9d0fe0ef          	jal	ra,c000024c <__panic>
c0002080:	00007697          	auipc	a3,0x7
c0002084:	de468693          	addi	a3,a3,-540 # c0008e64 <commands+0xc14>
c0002088:	00006617          	auipc	a2,0x6
c000208c:	5ac60613          	addi	a2,a2,1452 # c0008634 <commands+0x3e4>
c0002090:	06900593          	li	a1,105
c0002094:	00007517          	auipc	a0,0x7
c0002098:	cec50513          	addi	a0,a0,-788 # c0008d80 <commands+0xb30>
c000209c:	9b0fe0ef          	jal	ra,c000024c <__panic>
c00020a0:	00007697          	auipc	a3,0x7
c00020a4:	db468693          	addi	a3,a3,-588 # c0008e54 <commands+0xc04>
c00020a8:	00006617          	auipc	a2,0x6
c00020ac:	58c60613          	addi	a2,a2,1420 # c0008634 <commands+0x3e4>
c00020b0:	06600593          	li	a1,102
c00020b4:	00007517          	auipc	a0,0x7
c00020b8:	ccc50513          	addi	a0,a0,-820 # c0008d80 <commands+0xb30>
c00020bc:	990fe0ef          	jal	ra,c000024c <__panic>
c00020c0:	00007697          	auipc	a3,0x7
c00020c4:	d8468693          	addi	a3,a3,-636 # c0008e44 <commands+0xbf4>
c00020c8:	00006617          	auipc	a2,0x6
c00020cc:	56c60613          	addi	a2,a2,1388 # c0008634 <commands+0x3e4>
c00020d0:	06300593          	li	a1,99
c00020d4:	00007517          	auipc	a0,0x7
c00020d8:	cac50513          	addi	a0,a0,-852 # c0008d80 <commands+0xb30>
c00020dc:	970fe0ef          	jal	ra,c000024c <__panic>
c00020e0:	00007697          	auipc	a3,0x7
c00020e4:	d5468693          	addi	a3,a3,-684 # c0008e34 <commands+0xbe4>
c00020e8:	00006617          	auipc	a2,0x6
c00020ec:	54c60613          	addi	a2,a2,1356 # c0008634 <commands+0x3e4>
c00020f0:	06000593          	li	a1,96
c00020f4:	00007517          	auipc	a0,0x7
c00020f8:	c8c50513          	addi	a0,a0,-884 # c0008d80 <commands+0xb30>
c00020fc:	950fe0ef          	jal	ra,c000024c <__panic>
c0002100:	00007697          	auipc	a3,0x7
c0002104:	d3468693          	addi	a3,a3,-716 # c0008e34 <commands+0xbe4>
c0002108:	00006617          	auipc	a2,0x6
c000210c:	52c60613          	addi	a2,a2,1324 # c0008634 <commands+0x3e4>
c0002110:	05d00593          	li	a1,93
c0002114:	00007517          	auipc	a0,0x7
c0002118:	c6c50513          	addi	a0,a0,-916 # c0008d80 <commands+0xb30>
c000211c:	930fe0ef          	jal	ra,c000024c <__panic>
c0002120:	00007697          	auipc	a3,0x7
c0002124:	c5068693          	addi	a3,a3,-944 # c0008d70 <commands+0xb20>
c0002128:	00006617          	auipc	a2,0x6
c000212c:	50c60613          	addi	a2,a2,1292 # c0008634 <commands+0x3e4>
c0002130:	05a00593          	li	a1,90
c0002134:	00007517          	auipc	a0,0x7
c0002138:	c4c50513          	addi	a0,a0,-948 # c0008d80 <commands+0xb30>
c000213c:	910fe0ef          	jal	ra,c000024c <__panic>
c0002140:	00007697          	auipc	a3,0x7
c0002144:	c3068693          	addi	a3,a3,-976 # c0008d70 <commands+0xb20>
c0002148:	00006617          	auipc	a2,0x6
c000214c:	4ec60613          	addi	a2,a2,1260 # c0008634 <commands+0x3e4>
c0002150:	05700593          	li	a1,87
c0002154:	00007517          	auipc	a0,0x7
c0002158:	c2c50513          	addi	a0,a0,-980 # c0008d80 <commands+0xb30>
c000215c:	8f0fe0ef          	jal	ra,c000024c <__panic>
c0002160:	00007697          	auipc	a3,0x7
c0002164:	c1068693          	addi	a3,a3,-1008 # c0008d70 <commands+0xb20>
c0002168:	00006617          	auipc	a2,0x6
c000216c:	4cc60613          	addi	a2,a2,1228 # c0008634 <commands+0x3e4>
c0002170:	05400593          	li	a1,84
c0002174:	00007517          	auipc	a0,0x7
c0002178:	c0c50513          	addi	a0,a0,-1012 # c0008d80 <commands+0xb30>
c000217c:	8d0fe0ef          	jal	ra,c000024c <__panic>

c0002180 <_fifo_swap_out_victim>:
c0002180:	01452783          	lw	a5,20(a0)
c0002184:	ff010113          	addi	sp,sp,-16
c0002188:	00112623          	sw	ra,12(sp)
c000218c:	02078a63          	beqz	a5,c00021c0 <_fifo_swap_out_victim+0x40>
c0002190:	04061863          	bnez	a2,c00021e0 <_fifo_swap_out_victim+0x60>
c0002194:	0047a783          	lw	a5,4(a5)
c0002198:	00c12083          	lw	ra,12(sp)
c000219c:	00000513          	li	a0,0
c00021a0:	0007a683          	lw	a3,0(a5)
c00021a4:	0047a703          	lw	a4,4(a5)
c00021a8:	fec78793          	addi	a5,a5,-20
c00021ac:	01010113          	addi	sp,sp,16
c00021b0:	00e6a223          	sw	a4,4(a3)
c00021b4:	00d72023          	sw	a3,0(a4)
c00021b8:	00f5a023          	sw	a5,0(a1)
c00021bc:	00008067          	ret
c00021c0:	00007697          	auipc	a3,0x7
c00021c4:	d2868693          	addi	a3,a3,-728 # c0008ee8 <commands+0xc98>
c00021c8:	00006617          	auipc	a2,0x6
c00021cc:	46c60613          	addi	a2,a2,1132 # c0008634 <commands+0x3e4>
c00021d0:	04100593          	li	a1,65
c00021d4:	00007517          	auipc	a0,0x7
c00021d8:	bac50513          	addi	a0,a0,-1108 # c0008d80 <commands+0xb30>
c00021dc:	870fe0ef          	jal	ra,c000024c <__panic>
c00021e0:	00007697          	auipc	a3,0x7
c00021e4:	d1868693          	addi	a3,a3,-744 # c0008ef8 <commands+0xca8>
c00021e8:	00006617          	auipc	a2,0x6
c00021ec:	44c60613          	addi	a2,a2,1100 # c0008634 <commands+0x3e4>
c00021f0:	04200593          	li	a1,66
c00021f4:	00007517          	auipc	a0,0x7
c00021f8:	b8c50513          	addi	a0,a0,-1140 # c0008d80 <commands+0xb30>
c00021fc:	850fe0ef          	jal	ra,c000024c <__panic>

c0002200 <_fifo_map_swappable>:
c0002200:	01460713          	addi	a4,a2,20
c0002204:	01452783          	lw	a5,20(a0)
c0002208:	02070263          	beqz	a4,c000222c <_fifo_map_swappable+0x2c>
c000220c:	02078063          	beqz	a5,c000222c <_fifo_map_swappable+0x2c>
c0002210:	0007a683          	lw	a3,0(a5)
c0002214:	00e7a023          	sw	a4,0(a5)
c0002218:	00000513          	li	a0,0
c000221c:	00e6a223          	sw	a4,4(a3)
c0002220:	00f62c23          	sw	a5,24(a2)
c0002224:	00d62a23          	sw	a3,20(a2)
c0002228:	00008067          	ret
c000222c:	ff010113          	addi	sp,sp,-16
c0002230:	00007697          	auipc	a3,0x7
c0002234:	c9868693          	addi	a3,a3,-872 # c0008ec8 <commands+0xc78>
c0002238:	00006617          	auipc	a2,0x6
c000223c:	3fc60613          	addi	a2,a2,1020 # c0008634 <commands+0x3e4>
c0002240:	03200593          	li	a1,50
c0002244:	00007517          	auipc	a0,0x7
c0002248:	b3c50513          	addi	a0,a0,-1220 # c0008d80 <commands+0xb30>
c000224c:	00112623          	sw	ra,12(sp)
c0002250:	ffdfd0ef          	jal	ra,c000024c <__panic>

c0002254 <slob_free>:
c0002254:	08050a63          	beqz	a0,c00022e8 <slob_free+0x94>
c0002258:	ff010113          	addi	sp,sp,-16
c000225c:	00112623          	sw	ra,12(sp)
c0002260:	00812423          	sw	s0,8(sp)
c0002264:	08059463          	bnez	a1,c00022ec <slob_free+0x98>
c0002268:	00050413          	mv	s0,a0
c000226c:	100027f3          	csrr	a5,sstatus
c0002270:	0027f793          	andi	a5,a5,2
c0002274:	00000613          	li	a2,0
c0002278:	08079a63          	bnez	a5,c000230c <slob_free+0xb8>
c000227c:	0002a797          	auipc	a5,0x2a
c0002280:	7907a783          	lw	a5,1936(a5) # c002ca0c <slobfree>
c0002284:	0047a703          	lw	a4,4(a5)
c0002288:	0087fc63          	bleu	s0,a5,c00022a0 <slob_free+0x4c>
c000228c:	00e46e63          	bltu	s0,a4,c00022a8 <slob_free+0x54>
c0002290:	00e7fc63          	bleu	a4,a5,c00022a8 <slob_free+0x54>
c0002294:	00070793          	mv	a5,a4
c0002298:	0047a703          	lw	a4,4(a5)
c000229c:	fe87e8e3          	bltu	a5,s0,c000228c <slob_free+0x38>
c00022a0:	fee7eae3          	bltu	a5,a4,c0002294 <slob_free+0x40>
c00022a4:	fee478e3          	bleu	a4,s0,c0002294 <slob_free+0x40>
c00022a8:	00042583          	lw	a1,0(s0)
c00022ac:	00359693          	slli	a3,a1,0x3
c00022b0:	00d406b3          	add	a3,s0,a3
c00022b4:	08d70663          	beq	a4,a3,c0002340 <slob_free+0xec>
c00022b8:	00e42223          	sw	a4,4(s0)
c00022bc:	0007a683          	lw	a3,0(a5)
c00022c0:	00369713          	slli	a4,a3,0x3
c00022c4:	00e78733          	add	a4,a5,a4
c00022c8:	06e40063          	beq	s0,a4,c0002328 <slob_free+0xd4>
c00022cc:	0087a223          	sw	s0,4(a5)
c00022d0:	0002a297          	auipc	t0,0x2a
c00022d4:	72f2ae23          	sw	a5,1852(t0) # c002ca0c <slobfree>
c00022d8:	04061063          	bnez	a2,c0002318 <slob_free+0xc4>
c00022dc:	00c12083          	lw	ra,12(sp)
c00022e0:	00812403          	lw	s0,8(sp)
c00022e4:	01010113          	addi	sp,sp,16
c00022e8:	00008067          	ret
c00022ec:	00758793          	addi	a5,a1,7
c00022f0:	0037d793          	srli	a5,a5,0x3
c00022f4:	00f52023          	sw	a5,0(a0)
c00022f8:	00050413          	mv	s0,a0
c00022fc:	100027f3          	csrr	a5,sstatus
c0002300:	0027f793          	andi	a5,a5,2
c0002304:	00000613          	li	a2,0
c0002308:	f6078ae3          	beqz	a5,c000227c <slob_free+0x28>
c000230c:	d14fe0ef          	jal	ra,c0000820 <intr_disable>
c0002310:	00100613          	li	a2,1
c0002314:	f69ff06f          	j	c000227c <slob_free+0x28>
c0002318:	00c12083          	lw	ra,12(sp)
c000231c:	00812403          	lw	s0,8(sp)
c0002320:	01010113          	addi	sp,sp,16
c0002324:	cf4fe06f          	j	c0000818 <intr_enable>
c0002328:	00042703          	lw	a4,0(s0)
c000232c:	00442583          	lw	a1,4(s0)
c0002330:	00d706b3          	add	a3,a4,a3
c0002334:	00d7a023          	sw	a3,0(a5)
c0002338:	00b7a223          	sw	a1,4(a5)
c000233c:	f95ff06f          	j	c00022d0 <slob_free+0x7c>
c0002340:	00072683          	lw	a3,0(a4)
c0002344:	00472703          	lw	a4,4(a4)
c0002348:	00b685b3          	add	a1,a3,a1
c000234c:	00b42023          	sw	a1,0(s0)
c0002350:	00e42223          	sw	a4,4(s0)
c0002354:	f69ff06f          	j	c00022bc <slob_free+0x68>

c0002358 <__slob_get_free_pages.isra.0>:
c0002358:	00100793          	li	a5,1
c000235c:	ff010113          	addi	sp,sp,-16
c0002360:	00a79533          	sll	a0,a5,a0
c0002364:	00112623          	sw	ra,12(sp)
c0002368:	565010ef          	jal	ra,c00040cc <alloc_pages>
c000236c:	04050a63          	beqz	a0,c00023c0 <__slob_get_free_pages.isra.0+0x68>
c0002370:	00034697          	auipc	a3,0x34
c0002374:	bb06a683          	lw	a3,-1104(a3) # c0035f20 <pages>
c0002378:	40d506b3          	sub	a3,a0,a3
c000237c:	4056d693          	srai	a3,a3,0x5
c0002380:	0002a517          	auipc	a0,0x2a
c0002384:	69052503          	lw	a0,1680(a0) # c002ca10 <nbase>
c0002388:	001007b7          	lui	a5,0x100
c000238c:	00a686b3          	add	a3,a3,a0
c0002390:	fff78793          	addi	a5,a5,-1 # fffff <_binary_obj___user_exit_out_size+0xfd9a3>
c0002394:	00f6f7b3          	and	a5,a3,a5
c0002398:	00034717          	auipc	a4,0x34
c000239c:	aac72703          	lw	a4,-1364(a4) # c0035e44 <npage>
c00023a0:	00c69693          	slli	a3,a3,0xc
c00023a4:	02e7f263          	bleu	a4,a5,c00023c8 <__slob_get_free_pages.isra.0+0x70>
c00023a8:	00034517          	auipc	a0,0x34
c00023ac:	b7052503          	lw	a0,-1168(a0) # c0035f18 <va_pa_offset>
c00023b0:	00a68533          	add	a0,a3,a0
c00023b4:	00c12083          	lw	ra,12(sp)
c00023b8:	01010113          	addi	sp,sp,16
c00023bc:	00008067          	ret
c00023c0:	00000513          	li	a0,0
c00023c4:	ff1ff06f          	j	c00023b4 <__slob_get_free_pages.isra.0+0x5c>
c00023c8:	00007617          	auipc	a2,0x7
c00023cc:	b5060613          	addi	a2,a2,-1200 # c0008f18 <commands+0xcc8>
c00023d0:	06900593          	li	a1,105
c00023d4:	00007517          	auipc	a0,0x7
c00023d8:	8fc50513          	addi	a0,a0,-1796 # c0008cd0 <commands+0xa80>
c00023dc:	e71fd0ef          	jal	ra,c000024c <__panic>

c00023e0 <slob_alloc.isra.1.constprop.3>:
c00023e0:	fd010113          	addi	sp,sp,-48
c00023e4:	02112623          	sw	ra,44(sp)
c00023e8:	02812423          	sw	s0,40(sp)
c00023ec:	02912223          	sw	s1,36(sp)
c00023f0:	03212023          	sw	s2,32(sp)
c00023f4:	01312e23          	sw	s3,28(sp)
c00023f8:	00850713          	addi	a4,a0,8
c00023fc:	000017b7          	lui	a5,0x1
c0002400:	14f77e63          	bleu	a5,a4,c000255c <slob_alloc.isra.1.constprop.3+0x17c>
c0002404:	00750493          	addi	s1,a0,7
c0002408:	0034d413          	srli	s0,s1,0x3
c000240c:	10002673          	csrr	a2,sstatus
c0002410:	00267613          	andi	a2,a2,2
c0002414:	0e061e63          	bnez	a2,c0002510 <slob_alloc.isra.1.constprop.3+0x130>
c0002418:	0002a697          	auipc	a3,0x2a
c000241c:	5f46a683          	lw	a3,1524(a3) # c002ca0c <slobfree>
c0002420:	0046a783          	lw	a5,4(a3)
c0002424:	0007a703          	lw	a4,0(a5) # 1000 <_binary_obj___user_faultread_out_size-0xf68>
c0002428:	12875463          	ble	s0,a4,c0002550 <slob_alloc.isra.1.constprop.3+0x170>
c000242c:	00001937          	lui	s2,0x1
c0002430:	00100993          	li	s3,1
c0002434:	00f68c63          	beq	a3,a5,c000244c <slob_alloc.isra.1.constprop.3+0x6c>
c0002438:	0047a503          	lw	a0,4(a5)
c000243c:	00052703          	lw	a4,0(a0)
c0002440:	04875463          	ble	s0,a4,c0002488 <slob_alloc.isra.1.constprop.3+0xa8>
c0002444:	00050793          	mv	a5,a0
c0002448:	fef698e3          	bne	a3,a5,c0002438 <slob_alloc.isra.1.constprop.3+0x58>
c000244c:	08061463          	bnez	a2,c00024d4 <slob_alloc.isra.1.constprop.3+0xf4>
c0002450:	00000513          	li	a0,0
c0002454:	f05ff0ef          	jal	ra,c0002358 <__slob_get_free_pages.isra.0>
c0002458:	08050663          	beqz	a0,c00024e4 <slob_alloc.isra.1.constprop.3+0x104>
c000245c:	00090593          	mv	a1,s2
c0002460:	df5ff0ef          	jal	ra,c0002254 <slob_free>
c0002464:	10002673          	csrr	a2,sstatus
c0002468:	00267613          	andi	a2,a2,2
c000246c:	08061c63          	bnez	a2,c0002504 <slob_alloc.isra.1.constprop.3+0x124>
c0002470:	0002a697          	auipc	a3,0x2a
c0002474:	59c6a683          	lw	a3,1436(a3) # c002ca0c <slobfree>
c0002478:	00068793          	mv	a5,a3
c000247c:	0047a503          	lw	a0,4(a5)
c0002480:	00052703          	lw	a4,0(a0)
c0002484:	fc8740e3          	blt	a4,s0,c0002444 <slob_alloc.isra.1.constprop.3+0x64>
c0002488:	0ae40e63          	beq	s0,a4,c0002544 <slob_alloc.isra.1.constprop.3+0x164>
c000248c:	ff84f693          	andi	a3,s1,-8
c0002490:	00d506b3          	add	a3,a0,a3
c0002494:	00d7a223          	sw	a3,4(a5)
c0002498:	00452583          	lw	a1,4(a0)
c000249c:	40870733          	sub	a4,a4,s0
c00024a0:	00e6a023          	sw	a4,0(a3)
c00024a4:	00b6a223          	sw	a1,4(a3)
c00024a8:	00852023          	sw	s0,0(a0)
c00024ac:	0002a297          	auipc	t0,0x2a
c00024b0:	56f2a023          	sw	a5,1376(t0) # c002ca0c <slobfree>
c00024b4:	06061463          	bnez	a2,c000251c <slob_alloc.isra.1.constprop.3+0x13c>
c00024b8:	02c12083          	lw	ra,44(sp)
c00024bc:	02812403          	lw	s0,40(sp)
c00024c0:	02412483          	lw	s1,36(sp)
c00024c4:	02012903          	lw	s2,32(sp)
c00024c8:	01c12983          	lw	s3,28(sp)
c00024cc:	03010113          	addi	sp,sp,48
c00024d0:	00008067          	ret
c00024d4:	b44fe0ef          	jal	ra,c0000818 <intr_enable>
c00024d8:	00000513          	li	a0,0
c00024dc:	e7dff0ef          	jal	ra,c0002358 <__slob_get_free_pages.isra.0>
c00024e0:	f6051ee3          	bnez	a0,c000245c <slob_alloc.isra.1.constprop.3+0x7c>
c00024e4:	02c12083          	lw	ra,44(sp)
c00024e8:	00000513          	li	a0,0
c00024ec:	02812403          	lw	s0,40(sp)
c00024f0:	02412483          	lw	s1,36(sp)
c00024f4:	02012903          	lw	s2,32(sp)
c00024f8:	01c12983          	lw	s3,28(sp)
c00024fc:	03010113          	addi	sp,sp,48
c0002500:	00008067          	ret
c0002504:	b1cfe0ef          	jal	ra,c0000820 <intr_disable>
c0002508:	00098613          	mv	a2,s3
c000250c:	f65ff06f          	j	c0002470 <slob_alloc.isra.1.constprop.3+0x90>
c0002510:	b10fe0ef          	jal	ra,c0000820 <intr_disable>
c0002514:	00100613          	li	a2,1
c0002518:	f01ff06f          	j	c0002418 <slob_alloc.isra.1.constprop.3+0x38>
c000251c:	00a12623          	sw	a0,12(sp)
c0002520:	af8fe0ef          	jal	ra,c0000818 <intr_enable>
c0002524:	02c12083          	lw	ra,44(sp)
c0002528:	00c12503          	lw	a0,12(sp)
c000252c:	02812403          	lw	s0,40(sp)
c0002530:	02412483          	lw	s1,36(sp)
c0002534:	02012903          	lw	s2,32(sp)
c0002538:	01c12983          	lw	s3,28(sp)
c000253c:	03010113          	addi	sp,sp,48
c0002540:	00008067          	ret
c0002544:	00452703          	lw	a4,4(a0)
c0002548:	00e7a223          	sw	a4,4(a5)
c000254c:	f61ff06f          	j	c00024ac <slob_alloc.isra.1.constprop.3+0xcc>
c0002550:	00078513          	mv	a0,a5
c0002554:	00068793          	mv	a5,a3
c0002558:	f31ff06f          	j	c0002488 <slob_alloc.isra.1.constprop.3+0xa8>
c000255c:	00007697          	auipc	a3,0x7
c0002560:	a2068693          	addi	a3,a3,-1504 # c0008f7c <commands+0xd2c>
c0002564:	00006617          	auipc	a2,0x6
c0002568:	0d060613          	addi	a2,a2,208 # c0008634 <commands+0x3e4>
c000256c:	06400593          	li	a1,100
c0002570:	00007517          	auipc	a0,0x7
c0002574:	a2c50513          	addi	a0,a0,-1492 # c0008f9c <commands+0xd4c>
c0002578:	cd5fd0ef          	jal	ra,c000024c <__panic>

c000257c <kmalloc_init>:
c000257c:	ff010113          	addi	sp,sp,-16
c0002580:	00007517          	auipc	a0,0x7
c0002584:	a3050513          	addi	a0,a0,-1488 # c0008fb0 <commands+0xd60>
c0002588:	00112623          	sw	ra,12(sp)
c000258c:	b4dfd0ef          	jal	ra,c00000d8 <cprintf>
c0002590:	00c12083          	lw	ra,12(sp)
c0002594:	00007517          	auipc	a0,0x7
c0002598:	9cc50513          	addi	a0,a0,-1588 # c0008f60 <commands+0xd10>
c000259c:	01010113          	addi	sp,sp,16
c00025a0:	b39fd06f          	j	c00000d8 <cprintf>

c00025a4 <kallocated>:
c00025a4:	00000513          	li	a0,0
c00025a8:	00008067          	ret

c00025ac <kmalloc>:
c00025ac:	ff010113          	addi	sp,sp,-16
c00025b0:	00912223          	sw	s1,4(sp)
c00025b4:	000014b7          	lui	s1,0x1
c00025b8:	00812423          	sw	s0,8(sp)
c00025bc:	00112623          	sw	ra,12(sp)
c00025c0:	01212023          	sw	s2,0(sp)
c00025c4:	ff748793          	addi	a5,s1,-9 # ff7 <_binary_obj___user_faultread_out_size-0xf71>
c00025c8:	00050413          	mv	s0,a0
c00025cc:	02a7e863          	bltu	a5,a0,c00025fc <kmalloc+0x50>
c00025d0:	00850513          	addi	a0,a0,8
c00025d4:	e0dff0ef          	jal	ra,c00023e0 <slob_alloc.isra.1.constprop.3>
c00025d8:	00850413          	addi	s0,a0,8
c00025dc:	0c050c63          	beqz	a0,c00026b4 <kmalloc+0x108>
c00025e0:	00c12083          	lw	ra,12(sp)
c00025e4:	00040513          	mv	a0,s0
c00025e8:	00412483          	lw	s1,4(sp)
c00025ec:	00812403          	lw	s0,8(sp)
c00025f0:	00012903          	lw	s2,0(sp)
c00025f4:	01010113          	addi	sp,sp,16
c00025f8:	00008067          	ret
c00025fc:	00c00513          	li	a0,12
c0002600:	de1ff0ef          	jal	ra,c00023e0 <slob_alloc.isra.1.constprop.3>
c0002604:	00050913          	mv	s2,a0
c0002608:	0a050663          	beqz	a0,c00026b4 <kmalloc+0x108>
c000260c:	00040793          	mv	a5,s0
c0002610:	00000513          	li	a0,0
c0002614:	0084da63          	ble	s0,s1,c0002628 <kmalloc+0x7c>
c0002618:	00048713          	mv	a4,s1
c000261c:	4017d793          	srai	a5,a5,0x1
c0002620:	00150513          	addi	a0,a0,1
c0002624:	fef74ce3          	blt	a4,a5,c000261c <kmalloc+0x70>
c0002628:	00a92023          	sw	a0,0(s2) # 1000 <_binary_obj___user_faultread_out_size-0xf68>
c000262c:	d2dff0ef          	jal	ra,c0002358 <__slob_get_free_pages.isra.0>
c0002630:	00a92223          	sw	a0,4(s2)
c0002634:	00050413          	mv	s0,a0
c0002638:	08050263          	beqz	a0,c00026bc <kmalloc+0x110>
c000263c:	100027f3          	csrr	a5,sstatus
c0002640:	0027f793          	andi	a5,a5,2
c0002644:	02079a63          	bnez	a5,c0002678 <kmalloc+0xcc>
c0002648:	00c12083          	lw	ra,12(sp)
c000264c:	00033797          	auipc	a5,0x33
c0002650:	7e87a783          	lw	a5,2024(a5) # c0035e34 <bigblocks>
c0002654:	00040513          	mv	a0,s0
c0002658:	00f92423          	sw	a5,8(s2)
c000265c:	00033297          	auipc	t0,0x33
c0002660:	7d22ac23          	sw	s2,2008(t0) # c0035e34 <bigblocks>
c0002664:	00812403          	lw	s0,8(sp)
c0002668:	00412483          	lw	s1,4(sp)
c000266c:	00012903          	lw	s2,0(sp)
c0002670:	01010113          	addi	sp,sp,16
c0002674:	00008067          	ret
c0002678:	9a8fe0ef          	jal	ra,c0000820 <intr_disable>
c000267c:	00033797          	auipc	a5,0x33
c0002680:	7b87a783          	lw	a5,1976(a5) # c0035e34 <bigblocks>
c0002684:	00f92423          	sw	a5,8(s2)
c0002688:	00033297          	auipc	t0,0x33
c000268c:	7b22a623          	sw	s2,1964(t0) # c0035e34 <bigblocks>
c0002690:	988fe0ef          	jal	ra,c0000818 <intr_enable>
c0002694:	00c12083          	lw	ra,12(sp)
c0002698:	00492403          	lw	s0,4(s2)
c000269c:	00412483          	lw	s1,4(sp)
c00026a0:	00012903          	lw	s2,0(sp)
c00026a4:	00040513          	mv	a0,s0
c00026a8:	00812403          	lw	s0,8(sp)
c00026ac:	01010113          	addi	sp,sp,16
c00026b0:	00008067          	ret
c00026b4:	00000413          	li	s0,0
c00026b8:	f29ff06f          	j	c00025e0 <kmalloc+0x34>
c00026bc:	00c00593          	li	a1,12
c00026c0:	00090513          	mv	a0,s2
c00026c4:	b91ff0ef          	jal	ra,c0002254 <slob_free>
c00026c8:	f19ff06f          	j	c00025e0 <kmalloc+0x34>

c00026cc <kfree>:
c00026cc:	12050c63          	beqz	a0,c0002804 <kfree+0x138>
c00026d0:	ff010113          	addi	sp,sp,-16
c00026d4:	00912223          	sw	s1,4(sp)
c00026d8:	00112623          	sw	ra,12(sp)
c00026dc:	00812423          	sw	s0,8(sp)
c00026e0:	01451793          	slli	a5,a0,0x14
c00026e4:	00050493          	mv	s1,a0
c00026e8:	04079263          	bnez	a5,c000272c <kfree+0x60>
c00026ec:	100027f3          	csrr	a5,sstatus
c00026f0:	0027f793          	andi	a5,a5,2
c00026f4:	0c079663          	bnez	a5,c00027c0 <kfree+0xf4>
c00026f8:	00033797          	auipc	a5,0x33
c00026fc:	73c7a783          	lw	a5,1852(a5) # c0035e34 <bigblocks>
c0002700:	02078663          	beqz	a5,c000272c <kfree+0x60>
c0002704:	0047a703          	lw	a4,4(a5)
c0002708:	10e50063          	beq	a0,a4,c0002808 <kfree+0x13c>
c000270c:	00000693          	li	a3,0
c0002710:	0100006f          	j	c0002720 <kfree+0x54>
c0002714:	00442703          	lw	a4,4(s0)
c0002718:	02e48863          	beq	s1,a4,c0002748 <kfree+0x7c>
c000271c:	00040793          	mv	a5,s0
c0002720:	0087a403          	lw	s0,8(a5)
c0002724:	fe0418e3          	bnez	s0,c0002714 <kfree+0x48>
c0002728:	0c069a63          	bnez	a3,c00027fc <kfree+0x130>
c000272c:	ff848513          	addi	a0,s1,-8
c0002730:	00c12083          	lw	ra,12(sp)
c0002734:	00812403          	lw	s0,8(sp)
c0002738:	00412483          	lw	s1,4(sp)
c000273c:	00000593          	li	a1,0
c0002740:	01010113          	addi	sp,sp,16
c0002744:	b11ff06f          	j	c0002254 <slob_free>
c0002748:	00842703          	lw	a4,8(s0)
c000274c:	00e7a423          	sw	a4,8(a5)
c0002750:	0a069263          	bnez	a3,c00027f4 <kfree+0x128>
c0002754:	c00007b7          	lui	a5,0xc0000
c0002758:	00042703          	lw	a4,0(s0)
c000275c:	0cf4e263          	bltu	s1,a5,c0002820 <kfree+0x154>
c0002760:	00033697          	auipc	a3,0x33
c0002764:	7b86a683          	lw	a3,1976(a3) # c0035f18 <va_pa_offset>
c0002768:	40d484b3          	sub	s1,s1,a3
c000276c:	00c4d493          	srli	s1,s1,0xc
c0002770:	00033797          	auipc	a5,0x33
c0002774:	6d47a783          	lw	a5,1748(a5) # c0035e44 <npage>
c0002778:	0cf4f263          	bleu	a5,s1,c000283c <kfree+0x170>
c000277c:	0002a517          	auipc	a0,0x2a
c0002780:	29452503          	lw	a0,660(a0) # c002ca10 <nbase>
c0002784:	40a484b3          	sub	s1,s1,a0
c0002788:	00549493          	slli	s1,s1,0x5
c000278c:	00033517          	auipc	a0,0x33
c0002790:	79452503          	lw	a0,1940(a0) # c0035f20 <pages>
c0002794:	00100593          	li	a1,1
c0002798:	00950533          	add	a0,a0,s1
c000279c:	00e595b3          	sll	a1,a1,a4
c00027a0:	1e1010ef          	jal	ra,c0004180 <free_pages>
c00027a4:	00040513          	mv	a0,s0
c00027a8:	00c12083          	lw	ra,12(sp)
c00027ac:	00812403          	lw	s0,8(sp)
c00027b0:	00412483          	lw	s1,4(sp)
c00027b4:	00c00593          	li	a1,12
c00027b8:	01010113          	addi	sp,sp,16
c00027bc:	a99ff06f          	j	c0002254 <slob_free>
c00027c0:	860fe0ef          	jal	ra,c0000820 <intr_disable>
c00027c4:	00033797          	auipc	a5,0x33
c00027c8:	6707a783          	lw	a5,1648(a5) # c0035e34 <bigblocks>
c00027cc:	02078863          	beqz	a5,c00027fc <kfree+0x130>
c00027d0:	0047a703          	lw	a4,4(a5)
c00027d4:	00e48663          	beq	s1,a4,c00027e0 <kfree+0x114>
c00027d8:	00100693          	li	a3,1
c00027dc:	f45ff06f          	j	c0002720 <kfree+0x54>
c00027e0:	0087a703          	lw	a4,8(a5)
c00027e4:	00078413          	mv	s0,a5
c00027e8:	00033797          	auipc	a5,0x33
c00027ec:	64c78793          	addi	a5,a5,1612 # c0035e34 <bigblocks>
c00027f0:	00e7a023          	sw	a4,0(a5)
c00027f4:	824fe0ef          	jal	ra,c0000818 <intr_enable>
c00027f8:	f5dff06f          	j	c0002754 <kfree+0x88>
c00027fc:	81cfe0ef          	jal	ra,c0000818 <intr_enable>
c0002800:	f2dff06f          	j	c000272c <kfree+0x60>
c0002804:	00008067          	ret
c0002808:	0087a703          	lw	a4,8(a5)
c000280c:	00078413          	mv	s0,a5
c0002810:	00033797          	auipc	a5,0x33
c0002814:	62478793          	addi	a5,a5,1572 # c0035e34 <bigblocks>
c0002818:	00e7a023          	sw	a4,0(a5)
c000281c:	f39ff06f          	j	c0002754 <kfree+0x88>
c0002820:	00048693          	mv	a3,s1
c0002824:	00006617          	auipc	a2,0x6
c0002828:	71860613          	addi	a2,a2,1816 # c0008f3c <commands+0xcec>
c000282c:	06e00593          	li	a1,110
c0002830:	00006517          	auipc	a0,0x6
c0002834:	4a050513          	addi	a0,a0,1184 # c0008cd0 <commands+0xa80>
c0002838:	a15fd0ef          	jal	ra,c000024c <__panic>
c000283c:	00006617          	auipc	a2,0x6
c0002840:	47460613          	addi	a2,a2,1140 # c0008cb0 <commands+0xa60>
c0002844:	06200593          	li	a1,98
c0002848:	00006517          	auipc	a0,0x6
c000284c:	48850513          	addi	a0,a0,1160 # c0008cd0 <commands+0xa80>
c0002850:	9fdfd0ef          	jal	ra,c000024c <__panic>

c0002854 <swap_init>:
c0002854:	fb010113          	addi	sp,sp,-80
c0002858:	04112623          	sw	ra,76(sp)
c000285c:	04812423          	sw	s0,72(sp)
c0002860:	04912223          	sw	s1,68(sp)
c0002864:	05212023          	sw	s2,64(sp)
c0002868:	03312e23          	sw	s3,60(sp)
c000286c:	03412c23          	sw	s4,56(sp)
c0002870:	03512a23          	sw	s5,52(sp)
c0002874:	03612823          	sw	s6,48(sp)
c0002878:	03712623          	sw	s7,44(sp)
c000287c:	03812423          	sw	s8,40(sp)
c0002880:	03912223          	sw	s9,36(sp)
c0002884:	03a12023          	sw	s10,32(sp)
c0002888:	01b12e23          	sw	s11,28(sp)
c000288c:	4b4030ef          	jal	ra,c0005d40 <swapfs_init>
c0002890:	00033697          	auipc	a3,0x33
c0002894:	6506a683          	lw	a3,1616(a3) # c0035ee0 <max_swap_offset>
c0002898:	010007b7          	lui	a5,0x1000
c000289c:	ff968713          	addi	a4,a3,-7
c00028a0:	ff878793          	addi	a5,a5,-8 # fffff8 <_binary_obj___user_exit_out_size+0xffd99c>
c00028a4:	5ee7e263          	bltu	a5,a4,c0002e88 <swap_init+0x634>
c00028a8:	0002a797          	auipc	a5,0x2a
c00028ac:	13c78793          	addi	a5,a5,316 # c002c9e4 <swap_manager_fifo>
c00028b0:	00033297          	auipc	t0,0x33
c00028b4:	58f2a423          	sw	a5,1416(t0) # c0035e38 <sm>
c00028b8:	0002a797          	auipc	a5,0x2a
c00028bc:	1307a783          	lw	a5,304(a5) # c002c9e8 <swap_manager_fifo+0x4>
c00028c0:	000780e7          	jalr	a5
c00028c4:	00050a93          	mv	s5,a0
c00028c8:	04050263          	beqz	a0,c000290c <swap_init+0xb8>
c00028cc:	04c12083          	lw	ra,76(sp)
c00028d0:	000a8513          	mv	a0,s5
c00028d4:	04812403          	lw	s0,72(sp)
c00028d8:	04412483          	lw	s1,68(sp)
c00028dc:	04012903          	lw	s2,64(sp)
c00028e0:	03c12983          	lw	s3,60(sp)
c00028e4:	03812a03          	lw	s4,56(sp)
c00028e8:	03412a83          	lw	s5,52(sp)
c00028ec:	03012b03          	lw	s6,48(sp)
c00028f0:	02c12b83          	lw	s7,44(sp)
c00028f4:	02812c03          	lw	s8,40(sp)
c00028f8:	02412c83          	lw	s9,36(sp)
c00028fc:	02012d03          	lw	s10,32(sp)
c0002900:	01c12d83          	lw	s11,28(sp)
c0002904:	05010113          	addi	sp,sp,80
c0002908:	00008067          	ret
c000290c:	00033797          	auipc	a5,0x33
c0002910:	52c7a783          	lw	a5,1324(a5) # c0035e38 <sm>
c0002914:	0007a583          	lw	a1,0(a5)
c0002918:	00006517          	auipc	a0,0x6
c000291c:	72850513          	addi	a0,a0,1832 # c0009040 <commands+0xdf0>
c0002920:	00100793          	li	a5,1
c0002924:	00033297          	auipc	t0,0x33
c0002928:	50f2ac23          	sw	a5,1304(t0) # c0035e3c <swap_init_ok>
c000292c:	facfd0ef          	jal	ra,c00000d8 <cprintf>
c0002930:	00033417          	auipc	s0,0x33
c0002934:	5d840413          	addi	s0,s0,1496 # c0035f08 <free_area>
c0002938:	00033797          	auipc	a5,0x33
c000293c:	5d47a783          	lw	a5,1492(a5) # c0035f0c <free_area+0x4>
c0002940:	3e878463          	beq	a5,s0,c0002d28 <swap_init+0x4d4>
c0002944:	ff87a703          	lw	a4,-8(a5)
c0002948:	00175713          	srli	a4,a4,0x1
c000294c:	00177713          	andi	a4,a4,1
c0002950:	3e070463          	beqz	a4,c0002d38 <swap_init+0x4e4>
c0002954:	00000d93          	li	s11,0
c0002958:	00000d13          	li	s10,0
c000295c:	0100006f          	j	c000296c <swap_init+0x118>
c0002960:	ff87a683          	lw	a3,-8(a5)
c0002964:	0026f693          	andi	a3,a3,2
c0002968:	3c068863          	beqz	a3,c0002d38 <swap_init+0x4e4>
c000296c:	ffc7a683          	lw	a3,-4(a5)
c0002970:	0047a783          	lw	a5,4(a5)
c0002974:	001d0d13          	addi	s10,s10,1
c0002978:	00dd8db3          	add	s11,s11,a3
c000297c:	000d8493          	mv	s1,s11
c0002980:	fe8790e3          	bne	a5,s0,c0002960 <swap_init+0x10c>
c0002984:	061010ef          	jal	ra,c00041e4 <nr_free_pages>
c0002988:	4ea49063          	bne	s1,a0,c0002e68 <swap_init+0x614>
c000298c:	000d8613          	mv	a2,s11
c0002990:	000d0593          	mv	a1,s10
c0002994:	00006517          	auipc	a0,0x6
c0002998:	6ec50513          	addi	a0,a0,1772 # c0009080 <commands+0xe30>
c000299c:	f3cfd0ef          	jal	ra,c00000d8 <cprintf>
c00029a0:	f0cfe0ef          	jal	ra,c00010ac <mm_create>
c00029a4:	00050a13          	mv	s4,a0
c00029a8:	46050063          	beqz	a0,c0002e08 <swap_init+0x5b4>
c00029ac:	00033797          	auipc	a5,0x33
c00029b0:	4b47a783          	lw	a5,1204(a5) # c0035e60 <check_mm_struct>
c00029b4:	48079a63          	bnez	a5,c0002e48 <swap_init+0x5f4>
c00029b8:	00033997          	auipc	s3,0x33
c00029bc:	4889a983          	lw	s3,1160(s3) # c0035e40 <boot_pgdir>
c00029c0:	0009a783          	lw	a5,0(s3)
c00029c4:	00033717          	auipc	a4,0x33
c00029c8:	49c70713          	addi	a4,a4,1180 # c0035e60 <check_mm_struct>
c00029cc:	00a72023          	sw	a0,0(a4)
c00029d0:	01352623          	sw	s3,12(a0)
c00029d4:	64079663          	bnez	a5,c0003020 <swap_init+0x7cc>
c00029d8:	000065b7          	lui	a1,0x6
c00029dc:	00300613          	li	a2,3
c00029e0:	00001537          	lui	a0,0x1
c00029e4:	f2cfe0ef          	jal	ra,c0001110 <vma_create>
c00029e8:	00050593          	mv	a1,a0
c00029ec:	42050e63          	beqz	a0,c0002e28 <swap_init+0x5d4>
c00029f0:	000a0513          	mv	a0,s4
c00029f4:	fccfe0ef          	jal	ra,c00011c0 <insert_vma_struct>
c00029f8:	00006517          	auipc	a0,0x6
c00029fc:	6c850513          	addi	a0,a0,1736 # c00090c0 <commands+0xe70>
c0002a00:	ed8fd0ef          	jal	ra,c00000d8 <cprintf>
c0002a04:	00ca2503          	lw	a0,12(s4)
c0002a08:	00100613          	li	a2,1
c0002a0c:	000015b7          	lui	a1,0x1
c0002a10:	02d010ef          	jal	ra,c000423c <get_pte>
c0002a14:	5e050663          	beqz	a0,c0003000 <swap_init+0x7ac>
c0002a18:	00006517          	auipc	a0,0x6
c0002a1c:	6f050513          	addi	a0,a0,1776 # c0009108 <commands+0xeb8>
c0002a20:	00033917          	auipc	s2,0x33
c0002a24:	44c90913          	addi	s2,s2,1100 # c0035e6c <check_rp>
c0002a28:	eb0fd0ef          	jal	ra,c00000d8 <cprintf>
c0002a2c:	00033b17          	auipc	s6,0x33
c0002a30:	450b0b13          	addi	s6,s6,1104 # c0035e7c <swap_in_seq_no>
c0002a34:	00090b93          	mv	s7,s2
c0002a38:	00100493          	li	s1,1
c0002a3c:	00048513          	mv	a0,s1
c0002a40:	68c010ef          	jal	ra,c00040cc <alloc_pages>
c0002a44:	00aba023          	sw	a0,0(s7)
c0002a48:	38050063          	beqz	a0,c0002dc8 <swap_init+0x574>
c0002a4c:	00452783          	lw	a5,4(a0)
c0002a50:	0027f793          	andi	a5,a5,2
c0002a54:	34079a63          	bnez	a5,c0002da8 <swap_init+0x554>
c0002a58:	004b8b93          	addi	s7,s7,4
c0002a5c:	ff6b90e3          	bne	s7,s6,c0002a3c <swap_init+0x1e8>
c0002a60:	00033797          	auipc	a5,0x33
c0002a64:	4a87a783          	lw	a5,1192(a5) # c0035f08 <free_area>
c0002a68:	00f12423          	sw	a5,8(sp)
c0002a6c:	00033797          	auipc	a5,0x33
c0002a70:	4a47a783          	lw	a5,1188(a5) # c0035f10 <free_area+0x8>
c0002a74:	00033c97          	auipc	s9,0x33
c0002a78:	498cac83          	lw	s9,1176(s9) # c0035f0c <free_area+0x4>
c0002a7c:	00f12623          	sw	a5,12(sp)
c0002a80:	00842223          	sw	s0,4(s0)
c0002a84:	00842023          	sw	s0,0(s0)
c0002a88:	00042423          	sw	zero,8(s0)
c0002a8c:	00033497          	auipc	s1,0x33
c0002a90:	3e048493          	addi	s1,s1,992 # c0035e6c <check_rp>
c0002a94:	00100b13          	li	s6,1
c0002a98:	0004a503          	lw	a0,0(s1)
c0002a9c:	000b0593          	mv	a1,s6
c0002aa0:	00448493          	addi	s1,s1,4
c0002aa4:	6dc010ef          	jal	ra,c0004180 <free_pages>
c0002aa8:	ff7498e3          	bne	s1,s7,c0002a98 <swap_init+0x244>
c0002aac:	00033b17          	auipc	s6,0x33
c0002ab0:	464b2b03          	lw	s6,1124(s6) # c0035f10 <free_area+0x8>
c0002ab4:	00400793          	li	a5,4
c0002ab8:	52fb1463          	bne	s6,a5,c0002fe0 <swap_init+0x78c>
c0002abc:	00006517          	auipc	a0,0x6
c0002ac0:	6c450513          	addi	a0,a0,1732 # c0009180 <commands+0xf30>
c0002ac4:	e14fd0ef          	jal	ra,c00000d8 <cprintf>
c0002ac8:	00001637          	lui	a2,0x1
c0002acc:	00033297          	auipc	t0,0x33
c0002ad0:	3602a223          	sw	zero,868(t0) # c0035e30 <pgfault_num>
c0002ad4:	00a00593          	li	a1,10
c0002ad8:	00b60023          	sb	a1,0(a2) # 1000 <_binary_obj___user_faultread_out_size-0xf68>
c0002adc:	00033797          	auipc	a5,0x33
c0002ae0:	3547a783          	lw	a5,852(a5) # c0035e30 <pgfault_num>
c0002ae4:	00100513          	li	a0,1
c0002ae8:	4aa79c63          	bne	a5,a0,c0002fa0 <swap_init+0x74c>
c0002aec:	00b60823          	sb	a1,16(a2)
c0002af0:	00033617          	auipc	a2,0x33
c0002af4:	34062603          	lw	a2,832(a2) # c0035e30 <pgfault_num>
c0002af8:	4cf61463          	bne	a2,a5,c0002fc0 <swap_init+0x76c>
c0002afc:	00002637          	lui	a2,0x2
c0002b00:	00b00593          	li	a1,11
c0002b04:	00b60023          	sb	a1,0(a2) # 2000 <_binary_obj___user_softint_out_size+0x94>
c0002b08:	00033797          	auipc	a5,0x33
c0002b0c:	3287a783          	lw	a5,808(a5) # c0035e30 <pgfault_num>
c0002b10:	00200513          	li	a0,2
c0002b14:	40a79663          	bne	a5,a0,c0002f20 <swap_init+0x6cc>
c0002b18:	00b60823          	sb	a1,16(a2)
c0002b1c:	00033617          	auipc	a2,0x33
c0002b20:	31462603          	lw	a2,788(a2) # c0035e30 <pgfault_num>
c0002b24:	40f61e63          	bne	a2,a5,c0002f40 <swap_init+0x6ec>
c0002b28:	00003637          	lui	a2,0x3
c0002b2c:	00c00593          	li	a1,12
c0002b30:	00b60023          	sb	a1,0(a2) # 3000 <_binary_obj___user_exit_out_size+0x9a4>
c0002b34:	00033797          	auipc	a5,0x33
c0002b38:	2fc7a783          	lw	a5,764(a5) # c0035e30 <pgfault_num>
c0002b3c:	00300513          	li	a0,3
c0002b40:	42a79063          	bne	a5,a0,c0002f60 <swap_init+0x70c>
c0002b44:	00b60823          	sb	a1,16(a2)
c0002b48:	00033617          	auipc	a2,0x33
c0002b4c:	2e862603          	lw	a2,744(a2) # c0035e30 <pgfault_num>
c0002b50:	42f61863          	bne	a2,a5,c0002f80 <swap_init+0x72c>
c0002b54:	00004637          	lui	a2,0x4
c0002b58:	00d00593          	li	a1,13
c0002b5c:	00b60023          	sb	a1,0(a2) # 4000 <_binary_obj___user_exit_out_size+0x19a4>
c0002b60:	00033797          	auipc	a5,0x33
c0002b64:	2d07a783          	lw	a5,720(a5) # c0035e30 <pgfault_num>
c0002b68:	33679c63          	bne	a5,s6,c0002ea0 <swap_init+0x64c>
c0002b6c:	00b60823          	sb	a1,16(a2)
c0002b70:	00033617          	auipc	a2,0x33
c0002b74:	2c062603          	lw	a2,704(a2) # c0035e30 <pgfault_num>
c0002b78:	34f61463          	bne	a2,a5,c0002ec0 <swap_init+0x66c>
c0002b7c:	00033897          	auipc	a7,0x33
c0002b80:	3948a883          	lw	a7,916(a7) # c0035f10 <free_area+0x8>
c0002b84:	00033797          	auipc	a5,0x33
c0002b88:	2f878793          	addi	a5,a5,760 # c0035e7c <swap_in_seq_no>
c0002b8c:	00033617          	auipc	a2,0x33
c0002b90:	31860613          	addi	a2,a2,792 # c0035ea4 <swap_out_seq_no>
c0002b94:	00033517          	auipc	a0,0x33
c0002b98:	31050513          	addi	a0,a0,784 # c0035ea4 <swap_out_seq_no>
c0002b9c:	fff00593          	li	a1,-1
c0002ba0:	34089063          	bnez	a7,c0002ee0 <swap_init+0x68c>
c0002ba4:	00b7a023          	sw	a1,0(a5)
c0002ba8:	00b62023          	sw	a1,0(a2)
c0002bac:	00478793          	addi	a5,a5,4
c0002bb0:	00460613          	addi	a2,a2,4
c0002bb4:	fef518e3          	bne	a0,a5,c0002ba4 <swap_init+0x350>
c0002bb8:	0002a797          	auipc	a5,0x2a
c0002bbc:	e587a783          	lw	a5,-424(a5) # c002ca10 <nbase>
c0002bc0:	00001bb7          	lui	s7,0x1
c0002bc4:	00033b17          	auipc	s6,0x33
c0002bc8:	334b0b13          	addi	s6,s6,820 # c0035ef8 <check_ptep>
c0002bcc:	00033c17          	auipc	s8,0x33
c0002bd0:	2a0c0c13          	addi	s8,s8,672 # c0035e6c <check_rp>
c0002bd4:	00f12223          	sw	a5,4(sp)
c0002bd8:	00000613          	li	a2,0
c0002bdc:	000b8593          	mv	a1,s7
c0002be0:	00098513          	mv	a0,s3
c0002be4:	000b2023          	sw	zero,0(s6)
c0002be8:	654010ef          	jal	ra,c000423c <get_pte>
c0002bec:	00ab2023          	sw	a0,0(s6)
c0002bf0:	1e050c63          	beqz	a0,c0002de8 <swap_init+0x594>
c0002bf4:	00052783          	lw	a5,0(a0)
c0002bf8:	0017f613          	andi	a2,a5,1
c0002bfc:	16060e63          	beqz	a2,c0002d78 <swap_init+0x524>
c0002c00:	00279793          	slli	a5,a5,0x2
c0002c04:	00c7d793          	srli	a5,a5,0xc
c0002c08:	00033617          	auipc	a2,0x33
c0002c0c:	23c62603          	lw	a2,572(a2) # c0035e44 <npage>
c0002c10:	18c7f063          	bleu	a2,a5,c0002d90 <swap_init+0x53c>
c0002c14:	00412703          	lw	a4,4(sp)
c0002c18:	000c2583          	lw	a1,0(s8)
c0002c1c:	00033617          	auipc	a2,0x33
c0002c20:	30462603          	lw	a2,772(a2) # c0035f20 <pages>
c0002c24:	40e787b3          	sub	a5,a5,a4
c0002c28:	00579793          	slli	a5,a5,0x5
c0002c2c:	00f607b3          	add	a5,a2,a5
c0002c30:	12f59463          	bne	a1,a5,c0002d58 <swap_init+0x504>
c0002c34:	000017b7          	lui	a5,0x1
c0002c38:	00fb8bb3          	add	s7,s7,a5
c0002c3c:	000057b7          	lui	a5,0x5
c0002c40:	004b0b13          	addi	s6,s6,4
c0002c44:	004c0c13          	addi	s8,s8,4
c0002c48:	f8fb98e3          	bne	s7,a5,c0002bd8 <swap_init+0x384>
c0002c4c:	00006517          	auipc	a0,0x6
c0002c50:	60050513          	addi	a0,a0,1536 # c000924c <commands+0xffc>
c0002c54:	c84fd0ef          	jal	ra,c00000d8 <cprintf>
c0002c58:	00033797          	auipc	a5,0x33
c0002c5c:	1e07a783          	lw	a5,480(a5) # c0035e38 <sm>
c0002c60:	01c7a783          	lw	a5,28(a5)
c0002c64:	00100b93          	li	s7,1
c0002c68:	000780e7          	jalr	a5
c0002c6c:	28051a63          	bnez	a0,c0002f00 <swap_init+0x6ac>
c0002c70:	00092503          	lw	a0,0(s2)
c0002c74:	000b8593          	mv	a1,s7
c0002c78:	00490913          	addi	s2,s2,4
c0002c7c:	504010ef          	jal	ra,c0004180 <free_pages>
c0002c80:	fe9918e3          	bne	s2,s1,c0002c70 <swap_init+0x41c>
c0002c84:	0009a783          	lw	a5,0(s3)
c0002c88:	00033617          	auipc	a2,0x33
c0002c8c:	1bc62603          	lw	a2,444(a2) # c0035e44 <npage>
c0002c90:	00279793          	slli	a5,a5,0x2
c0002c94:	00c7d793          	srli	a5,a5,0xc
c0002c98:	0ec7fc63          	bleu	a2,a5,c0002d90 <swap_init+0x53c>
c0002c9c:	00412703          	lw	a4,4(sp)
c0002ca0:	00033517          	auipc	a0,0x33
c0002ca4:	28052503          	lw	a0,640(a0) # c0035f20 <pages>
c0002ca8:	00100593          	li	a1,1
c0002cac:	40e787b3          	sub	a5,a5,a4
c0002cb0:	00579793          	slli	a5,a5,0x5
c0002cb4:	00f50533          	add	a0,a0,a5
c0002cb8:	4c8010ef          	jal	ra,c0004180 <free_pages>
c0002cbc:	0009a023          	sw	zero,0(s3)
c0002cc0:	000a2623          	sw	zero,12(s4)
c0002cc4:	000a0513          	mv	a0,s4
c0002cc8:	df8fe0ef          	jal	ra,c00012c0 <mm_destroy>
c0002ccc:	00033797          	auipc	a5,0x33
c0002cd0:	19478793          	addi	a5,a5,404 # c0035e60 <check_mm_struct>
c0002cd4:	0007a023          	sw	zero,0(a5)
c0002cd8:	00c12783          	lw	a5,12(sp)
c0002cdc:	01942223          	sw	s9,4(s0)
c0002ce0:	00f42423          	sw	a5,8(s0)
c0002ce4:	00812783          	lw	a5,8(sp)
c0002ce8:	00f42023          	sw	a5,0(s0)
c0002cec:	008c8c63          	beq	s9,s0,c0002d04 <swap_init+0x4b0>
c0002cf0:	ffcca783          	lw	a5,-4(s9)
c0002cf4:	004cac83          	lw	s9,4(s9)
c0002cf8:	fffd0d13          	addi	s10,s10,-1
c0002cfc:	40fd8db3          	sub	s11,s11,a5
c0002d00:	fe8c98e3          	bne	s9,s0,c0002cf0 <swap_init+0x49c>
c0002d04:	000d8613          	mv	a2,s11
c0002d08:	000d0593          	mv	a1,s10
c0002d0c:	00006517          	auipc	a0,0x6
c0002d10:	57050513          	addi	a0,a0,1392 # c000927c <commands+0x102c>
c0002d14:	bc4fd0ef          	jal	ra,c00000d8 <cprintf>
c0002d18:	00006517          	auipc	a0,0x6
c0002d1c:	58050513          	addi	a0,a0,1408 # c0009298 <commands+0x1048>
c0002d20:	bb8fd0ef          	jal	ra,c00000d8 <cprintf>
c0002d24:	ba9ff06f          	j	c00028cc <swap_init+0x78>
c0002d28:	00000d93          	li	s11,0
c0002d2c:	00000d13          	li	s10,0
c0002d30:	00000493          	li	s1,0
c0002d34:	c51ff06f          	j	c0002984 <swap_init+0x130>
c0002d38:	00006697          	auipc	a3,0x6
c0002d3c:	31c68693          	addi	a3,a3,796 # c0009054 <commands+0xe04>
c0002d40:	00006617          	auipc	a2,0x6
c0002d44:	8f460613          	addi	a2,a2,-1804 # c0008634 <commands+0x3e4>
c0002d48:	0bc00593          	li	a1,188
c0002d4c:	00006517          	auipc	a0,0x6
c0002d50:	2e450513          	addi	a0,a0,740 # c0009030 <commands+0xde0>
c0002d54:	cf8fd0ef          	jal	ra,c000024c <__panic>
c0002d58:	00006697          	auipc	a3,0x6
c0002d5c:	4cc68693          	addi	a3,a3,1228 # c0009224 <commands+0xfd4>
c0002d60:	00006617          	auipc	a2,0x6
c0002d64:	8d460613          	addi	a2,a2,-1836 # c0008634 <commands+0x3e4>
c0002d68:	0fc00593          	li	a1,252
c0002d6c:	00006517          	auipc	a0,0x6
c0002d70:	2c450513          	addi	a0,a0,708 # c0009030 <commands+0xde0>
c0002d74:	cd8fd0ef          	jal	ra,c000024c <__panic>
c0002d78:	00006617          	auipc	a2,0x6
c0002d7c:	48860613          	addi	a2,a2,1160 # c0009200 <commands+0xfb0>
c0002d80:	07400593          	li	a1,116
c0002d84:	00006517          	auipc	a0,0x6
c0002d88:	f4c50513          	addi	a0,a0,-180 # c0008cd0 <commands+0xa80>
c0002d8c:	cc0fd0ef          	jal	ra,c000024c <__panic>
c0002d90:	00006617          	auipc	a2,0x6
c0002d94:	f2060613          	addi	a2,a2,-224 # c0008cb0 <commands+0xa60>
c0002d98:	06200593          	li	a1,98
c0002d9c:	00006517          	auipc	a0,0x6
c0002da0:	f3450513          	addi	a0,a0,-204 # c0008cd0 <commands+0xa80>
c0002da4:	ca8fd0ef          	jal	ra,c000024c <__panic>
c0002da8:	00006697          	auipc	a3,0x6
c0002dac:	39868693          	addi	a3,a3,920 # c0009140 <commands+0xef0>
c0002db0:	00006617          	auipc	a2,0x6
c0002db4:	88460613          	addi	a2,a2,-1916 # c0008634 <commands+0x3e4>
c0002db8:	0dd00593          	li	a1,221
c0002dbc:	00006517          	auipc	a0,0x6
c0002dc0:	27450513          	addi	a0,a0,628 # c0009030 <commands+0xde0>
c0002dc4:	c88fd0ef          	jal	ra,c000024c <__panic>
c0002dc8:	00006697          	auipc	a3,0x6
c0002dcc:	36468693          	addi	a3,a3,868 # c000912c <commands+0xedc>
c0002dd0:	00006617          	auipc	a2,0x6
c0002dd4:	86460613          	addi	a2,a2,-1948 # c0008634 <commands+0x3e4>
c0002dd8:	0dc00593          	li	a1,220
c0002ddc:	00006517          	auipc	a0,0x6
c0002de0:	25450513          	addi	a0,a0,596 # c0009030 <commands+0xde0>
c0002de4:	c68fd0ef          	jal	ra,c000024c <__panic>
c0002de8:	00006697          	auipc	a3,0x6
c0002dec:	40068693          	addi	a3,a3,1024 # c00091e8 <commands+0xf98>
c0002df0:	00006617          	auipc	a2,0x6
c0002df4:	84460613          	addi	a2,a2,-1980 # c0008634 <commands+0x3e4>
c0002df8:	0fb00593          	li	a1,251
c0002dfc:	00006517          	auipc	a0,0x6
c0002e00:	23450513          	addi	a0,a0,564 # c0009030 <commands+0xde0>
c0002e04:	c48fd0ef          	jal	ra,c000024c <__panic>
c0002e08:	00006697          	auipc	a3,0x6
c0002e0c:	cf068693          	addi	a3,a3,-784 # c0008af8 <commands+0x8a8>
c0002e10:	00006617          	auipc	a2,0x6
c0002e14:	82460613          	addi	a2,a2,-2012 # c0008634 <commands+0x3e4>
c0002e18:	0c400593          	li	a1,196
c0002e1c:	00006517          	auipc	a0,0x6
c0002e20:	21450513          	addi	a0,a0,532 # c0009030 <commands+0xde0>
c0002e24:	c28fd0ef          	jal	ra,c000024c <__panic>
c0002e28:	00006697          	auipc	a3,0x6
c0002e2c:	f1468693          	addi	a3,a3,-236 # c0008d3c <commands+0xaec>
c0002e30:	00006617          	auipc	a2,0x6
c0002e34:	80460613          	addi	a2,a2,-2044 # c0008634 <commands+0x3e4>
c0002e38:	0cf00593          	li	a1,207
c0002e3c:	00006517          	auipc	a0,0x6
c0002e40:	1f450513          	addi	a0,a0,500 # c0009030 <commands+0xde0>
c0002e44:	c08fd0ef          	jal	ra,c000024c <__panic>
c0002e48:	00006697          	auipc	a3,0x6
c0002e4c:	26068693          	addi	a3,a3,608 # c00090a8 <commands+0xe58>
c0002e50:	00005617          	auipc	a2,0x5
c0002e54:	7e460613          	addi	a2,a2,2020 # c0008634 <commands+0x3e4>
c0002e58:	0c700593          	li	a1,199
c0002e5c:	00006517          	auipc	a0,0x6
c0002e60:	1d450513          	addi	a0,a0,468 # c0009030 <commands+0xde0>
c0002e64:	be8fd0ef          	jal	ra,c000024c <__panic>
c0002e68:	00006697          	auipc	a3,0x6
c0002e6c:	1fc68693          	addi	a3,a3,508 # c0009064 <commands+0xe14>
c0002e70:	00005617          	auipc	a2,0x5
c0002e74:	7c460613          	addi	a2,a2,1988 # c0008634 <commands+0x3e4>
c0002e78:	0bf00593          	li	a1,191
c0002e7c:	00006517          	auipc	a0,0x6
c0002e80:	1b450513          	addi	a0,a0,436 # c0009030 <commands+0xde0>
c0002e84:	bc8fd0ef          	jal	ra,c000024c <__panic>
c0002e88:	00006617          	auipc	a2,0x6
c0002e8c:	18c60613          	addi	a2,a2,396 # c0009014 <commands+0xdc4>
c0002e90:	02800593          	li	a1,40
c0002e94:	00006517          	auipc	a0,0x6
c0002e98:	19c50513          	addi	a0,a0,412 # c0009030 <commands+0xde0>
c0002e9c:	bb0fd0ef          	jal	ra,c000024c <__panic>
c0002ea0:	00006697          	auipc	a3,0x6
c0002ea4:	ed068693          	addi	a3,a3,-304 # c0008d70 <commands+0xb20>
c0002ea8:	00005617          	auipc	a2,0x5
c0002eac:	78c60613          	addi	a2,a2,1932 # c0008634 <commands+0x3e4>
c0002eb0:	09f00593          	li	a1,159
c0002eb4:	00006517          	auipc	a0,0x6
c0002eb8:	17c50513          	addi	a0,a0,380 # c0009030 <commands+0xde0>
c0002ebc:	b90fd0ef          	jal	ra,c000024c <__panic>
c0002ec0:	00006697          	auipc	a3,0x6
c0002ec4:	eb068693          	addi	a3,a3,-336 # c0008d70 <commands+0xb20>
c0002ec8:	00005617          	auipc	a2,0x5
c0002ecc:	76c60613          	addi	a2,a2,1900 # c0008634 <commands+0x3e4>
c0002ed0:	0a100593          	li	a1,161
c0002ed4:	00006517          	auipc	a0,0x6
c0002ed8:	15c50513          	addi	a0,a0,348 # c0009030 <commands+0xde0>
c0002edc:	b70fd0ef          	jal	ra,c000024c <__panic>
c0002ee0:	00006697          	auipc	a3,0x6
c0002ee4:	2f868693          	addi	a3,a3,760 # c00091d8 <commands+0xf88>
c0002ee8:	00005617          	auipc	a2,0x5
c0002eec:	74c60613          	addi	a2,a2,1868 # c0008634 <commands+0x3e4>
c0002ef0:	0f300593          	li	a1,243
c0002ef4:	00006517          	auipc	a0,0x6
c0002ef8:	13c50513          	addi	a0,a0,316 # c0009030 <commands+0xde0>
c0002efc:	b50fd0ef          	jal	ra,c000024c <__panic>
c0002f00:	00006697          	auipc	a3,0x6
c0002f04:	37468693          	addi	a3,a3,884 # c0009274 <commands+0x1024>
c0002f08:	00005617          	auipc	a2,0x5
c0002f0c:	72c60613          	addi	a2,a2,1836 # c0008634 <commands+0x3e4>
c0002f10:	10200593          	li	a1,258
c0002f14:	00006517          	auipc	a0,0x6
c0002f18:	11c50513          	addi	a0,a0,284 # c0009030 <commands+0xde0>
c0002f1c:	b30fd0ef          	jal	ra,c000024c <__panic>
c0002f20:	00006697          	auipc	a3,0x6
c0002f24:	29868693          	addi	a3,a3,664 # c00091b8 <commands+0xf68>
c0002f28:	00005617          	auipc	a2,0x5
c0002f2c:	70c60613          	addi	a2,a2,1804 # c0008634 <commands+0x3e4>
c0002f30:	09700593          	li	a1,151
c0002f34:	00006517          	auipc	a0,0x6
c0002f38:	0fc50513          	addi	a0,a0,252 # c0009030 <commands+0xde0>
c0002f3c:	b10fd0ef          	jal	ra,c000024c <__panic>
c0002f40:	00006697          	auipc	a3,0x6
c0002f44:	27868693          	addi	a3,a3,632 # c00091b8 <commands+0xf68>
c0002f48:	00005617          	auipc	a2,0x5
c0002f4c:	6ec60613          	addi	a2,a2,1772 # c0008634 <commands+0x3e4>
c0002f50:	09900593          	li	a1,153
c0002f54:	00006517          	auipc	a0,0x6
c0002f58:	0dc50513          	addi	a0,a0,220 # c0009030 <commands+0xde0>
c0002f5c:	af0fd0ef          	jal	ra,c000024c <__panic>
c0002f60:	00006697          	auipc	a3,0x6
c0002f64:	26868693          	addi	a3,a3,616 # c00091c8 <commands+0xf78>
c0002f68:	00005617          	auipc	a2,0x5
c0002f6c:	6cc60613          	addi	a2,a2,1740 # c0008634 <commands+0x3e4>
c0002f70:	09b00593          	li	a1,155
c0002f74:	00006517          	auipc	a0,0x6
c0002f78:	0bc50513          	addi	a0,a0,188 # c0009030 <commands+0xde0>
c0002f7c:	ad0fd0ef          	jal	ra,c000024c <__panic>
c0002f80:	00006697          	auipc	a3,0x6
c0002f84:	24868693          	addi	a3,a3,584 # c00091c8 <commands+0xf78>
c0002f88:	00005617          	auipc	a2,0x5
c0002f8c:	6ac60613          	addi	a2,a2,1708 # c0008634 <commands+0x3e4>
c0002f90:	09d00593          	li	a1,157
c0002f94:	00006517          	auipc	a0,0x6
c0002f98:	09c50513          	addi	a0,a0,156 # c0009030 <commands+0xde0>
c0002f9c:	ab0fd0ef          	jal	ra,c000024c <__panic>
c0002fa0:	00006697          	auipc	a3,0x6
c0002fa4:	20868693          	addi	a3,a3,520 # c00091a8 <commands+0xf58>
c0002fa8:	00005617          	auipc	a2,0x5
c0002fac:	68c60613          	addi	a2,a2,1676 # c0008634 <commands+0x3e4>
c0002fb0:	09300593          	li	a1,147
c0002fb4:	00006517          	auipc	a0,0x6
c0002fb8:	07c50513          	addi	a0,a0,124 # c0009030 <commands+0xde0>
c0002fbc:	a90fd0ef          	jal	ra,c000024c <__panic>
c0002fc0:	00006697          	auipc	a3,0x6
c0002fc4:	1e868693          	addi	a3,a3,488 # c00091a8 <commands+0xf58>
c0002fc8:	00005617          	auipc	a2,0x5
c0002fcc:	66c60613          	addi	a2,a2,1644 # c0008634 <commands+0x3e4>
c0002fd0:	09500593          	li	a1,149
c0002fd4:	00006517          	auipc	a0,0x6
c0002fd8:	05c50513          	addi	a0,a0,92 # c0009030 <commands+0xde0>
c0002fdc:	a70fd0ef          	jal	ra,c000024c <__panic>
c0002fe0:	00006697          	auipc	a3,0x6
c0002fe4:	17c68693          	addi	a3,a3,380 # c000915c <commands+0xf0c>
c0002fe8:	00005617          	auipc	a2,0x5
c0002fec:	64c60613          	addi	a2,a2,1612 # c0008634 <commands+0x3e4>
c0002ff0:	0ea00593          	li	a1,234
c0002ff4:	00006517          	auipc	a0,0x6
c0002ff8:	03c50513          	addi	a0,a0,60 # c0009030 <commands+0xde0>
c0002ffc:	a50fd0ef          	jal	ra,c000024c <__panic>
c0003000:	00006697          	auipc	a3,0x6
c0003004:	0f468693          	addi	a3,a3,244 # c00090f4 <commands+0xea4>
c0003008:	00005617          	auipc	a2,0x5
c000300c:	62c60613          	addi	a2,a2,1580 # c0008634 <commands+0x3e4>
c0003010:	0d700593          	li	a1,215
c0003014:	00006517          	auipc	a0,0x6
c0003018:	01c50513          	addi	a0,a0,28 # c0009030 <commands+0xde0>
c000301c:	a30fd0ef          	jal	ra,c000024c <__panic>
c0003020:	00006697          	auipc	a3,0x6
c0003024:	c5868693          	addi	a3,a3,-936 # c0008c78 <commands+0xa28>
c0003028:	00005617          	auipc	a2,0x5
c000302c:	60c60613          	addi	a2,a2,1548 # c0008634 <commands+0x3e4>
c0003030:	0cc00593          	li	a1,204
c0003034:	00006517          	auipc	a0,0x6
c0003038:	ffc50513          	addi	a0,a0,-4 # c0009030 <commands+0xde0>
c000303c:	a10fd0ef          	jal	ra,c000024c <__panic>

c0003040 <swap_init_mm>:
c0003040:	00033797          	auipc	a5,0x33
c0003044:	df87a783          	lw	a5,-520(a5) # c0035e38 <sm>
c0003048:	0087a303          	lw	t1,8(a5)
c000304c:	00030067          	jr	t1

c0003050 <swap_map_swappable>:
c0003050:	00033797          	auipc	a5,0x33
c0003054:	de87a783          	lw	a5,-536(a5) # c0035e38 <sm>
c0003058:	0107a303          	lw	t1,16(a5)
c000305c:	00030067          	jr	t1

c0003060 <swap_out>:
c0003060:	fc010113          	addi	sp,sp,-64
c0003064:	03312623          	sw	s3,44(sp)
c0003068:	02112e23          	sw	ra,60(sp)
c000306c:	02812c23          	sw	s0,56(sp)
c0003070:	02912a23          	sw	s1,52(sp)
c0003074:	03212823          	sw	s2,48(sp)
c0003078:	03412423          	sw	s4,40(sp)
c000307c:	03512223          	sw	s5,36(sp)
c0003080:	03612023          	sw	s6,32(sp)
c0003084:	01712e23          	sw	s7,28(sp)
c0003088:	01812c23          	sw	s8,24(sp)
c000308c:	00058993          	mv	s3,a1
c0003090:	10058863          	beqz	a1,c00031a0 <swap_out+0x140>
c0003094:	00050913          	mv	s2,a0
c0003098:	00060a13          	mv	s4,a2
c000309c:	00000413          	li	s0,0
c00030a0:	00006b97          	auipc	s7,0x6
c00030a4:	274b8b93          	addi	s7,s7,628 # c0009314 <commands+0x10c4>
c00030a8:	00100b13          	li	s6,1
c00030ac:	00006a97          	auipc	s5,0x6
c00030b0:	250a8a93          	addi	s5,s5,592 # c00092fc <commands+0x10ac>
c00030b4:	0340006f          	j	c00030e8 <swap_out+0x88>
c00030b8:	000a8513          	mv	a0,s5
c00030bc:	81cfd0ef          	jal	ra,c00000d8 <cprintf>
c00030c0:	00033797          	auipc	a5,0x33
c00030c4:	d787a783          	lw	a5,-648(a5) # c0035e38 <sm>
c00030c8:	0107a783          	lw	a5,16(a5)
c00030cc:	00c12603          	lw	a2,12(sp)
c00030d0:	00000693          	li	a3,0
c00030d4:	00048593          	mv	a1,s1
c00030d8:	00090513          	mv	a0,s2
c00030dc:	00140413          	addi	s0,s0,1
c00030e0:	000780e7          	jalr	a5
c00030e4:	0a898e63          	beq	s3,s0,c00031a0 <swap_out+0x140>
c00030e8:	00033797          	auipc	a5,0x33
c00030ec:	d507a783          	lw	a5,-688(a5) # c0035e38 <sm>
c00030f0:	0187a783          	lw	a5,24(a5)
c00030f4:	000a0613          	mv	a2,s4
c00030f8:	00c10593          	addi	a1,sp,12
c00030fc:	00090513          	mv	a0,s2
c0003100:	000780e7          	jalr	a5
c0003104:	0c051863          	bnez	a0,c00031d4 <swap_out+0x174>
c0003108:	00c12783          	lw	a5,12(sp)
c000310c:	00c92503          	lw	a0,12(s2)
c0003110:	00000613          	li	a2,0
c0003114:	01c7a483          	lw	s1,28(a5)
c0003118:	00048593          	mv	a1,s1
c000311c:	120010ef          	jal	ra,c000423c <get_pte>
c0003120:	00052783          	lw	a5,0(a0)
c0003124:	00050c13          	mv	s8,a0
c0003128:	0017f793          	andi	a5,a5,1
c000312c:	0c078063          	beqz	a5,c00031ec <swap_out+0x18c>
c0003130:	00c12583          	lw	a1,12(sp)
c0003134:	01c5a503          	lw	a0,28(a1) # 101c <_binary_obj___user_faultread_out_size-0xf4c>
c0003138:	00c55513          	srli	a0,a0,0xc
c000313c:	00150513          	addi	a0,a0,1
c0003140:	00851513          	slli	a0,a0,0x8
c0003144:	4f9020ef          	jal	ra,c0005e3c <swapfs_write>
c0003148:	f60518e3          	bnez	a0,c00030b8 <swap_out+0x58>
c000314c:	00c12783          	lw	a5,12(sp)
c0003150:	00048613          	mv	a2,s1
c0003154:	00040593          	mv	a1,s0
c0003158:	01c7a683          	lw	a3,28(a5)
c000315c:	000b8513          	mv	a0,s7
c0003160:	00140413          	addi	s0,s0,1
c0003164:	00c6d693          	srli	a3,a3,0xc
c0003168:	00168693          	addi	a3,a3,1
c000316c:	f6dfc0ef          	jal	ra,c00000d8 <cprintf>
c0003170:	00c12503          	lw	a0,12(sp)
c0003174:	000b0593          	mv	a1,s6
c0003178:	01c52783          	lw	a5,28(a0)
c000317c:	00c7d793          	srli	a5,a5,0xc
c0003180:	00178793          	addi	a5,a5,1
c0003184:	00879793          	slli	a5,a5,0x8
c0003188:	00fc2023          	sw	a5,0(s8)
c000318c:	7f5000ef          	jal	ra,c0004180 <free_pages>
c0003190:	00c92503          	lw	a0,12(s2)
c0003194:	00048593          	mv	a1,s1
c0003198:	2c1010ef          	jal	ra,c0004c58 <tlb_invalidate>
c000319c:	f48996e3          	bne	s3,s0,c00030e8 <swap_out+0x88>
c00031a0:	03c12083          	lw	ra,60(sp)
c00031a4:	00098513          	mv	a0,s3
c00031a8:	03812403          	lw	s0,56(sp)
c00031ac:	03412483          	lw	s1,52(sp)
c00031b0:	03012903          	lw	s2,48(sp)
c00031b4:	02c12983          	lw	s3,44(sp)
c00031b8:	02812a03          	lw	s4,40(sp)
c00031bc:	02412a83          	lw	s5,36(sp)
c00031c0:	02012b03          	lw	s6,32(sp)
c00031c4:	01c12b83          	lw	s7,28(sp)
c00031c8:	01812c03          	lw	s8,24(sp)
c00031cc:	04010113          	addi	sp,sp,64
c00031d0:	00008067          	ret
c00031d4:	00040593          	mv	a1,s0
c00031d8:	00006517          	auipc	a0,0x6
c00031dc:	0dc50513          	addi	a0,a0,220 # c00092b4 <commands+0x1064>
c00031e0:	ef9fc0ef          	jal	ra,c00000d8 <cprintf>
c00031e4:	00040993          	mv	s3,s0
c00031e8:	fb9ff06f          	j	c00031a0 <swap_out+0x140>
c00031ec:	00006697          	auipc	a3,0x6
c00031f0:	0f868693          	addi	a3,a3,248 # c00092e4 <commands+0x1094>
c00031f4:	00005617          	auipc	a2,0x5
c00031f8:	44060613          	addi	a2,a2,1088 # c0008634 <commands+0x3e4>
c00031fc:	06800593          	li	a1,104
c0003200:	00006517          	auipc	a0,0x6
c0003204:	e3050513          	addi	a0,a0,-464 # c0009030 <commands+0xde0>
c0003208:	844fd0ef          	jal	ra,c000024c <__panic>

c000320c <swap_in>:
c000320c:	fe010113          	addi	sp,sp,-32
c0003210:	01212823          	sw	s2,16(sp)
c0003214:	00050913          	mv	s2,a0
c0003218:	00100513          	li	a0,1
c000321c:	00912a23          	sw	s1,20(sp)
c0003220:	01312623          	sw	s3,12(sp)
c0003224:	00112e23          	sw	ra,28(sp)
c0003228:	00812c23          	sw	s0,24(sp)
c000322c:	00058493          	mv	s1,a1
c0003230:	00060993          	mv	s3,a2
c0003234:	699000ef          	jal	ra,c00040cc <alloc_pages>
c0003238:	06050263          	beqz	a0,c000329c <swap_in+0x90>
c000323c:	00050413          	mv	s0,a0
c0003240:	00c92503          	lw	a0,12(s2)
c0003244:	00000613          	li	a2,0
c0003248:	00048593          	mv	a1,s1
c000324c:	7f1000ef          	jal	ra,c000423c <get_pte>
c0003250:	00050913          	mv	s2,a0
c0003254:	00052503          	lw	a0,0(a0)
c0003258:	00040593          	mv	a1,s0
c000325c:	331020ef          	jal	ra,c0005d8c <swapfs_read>
c0003260:	00092583          	lw	a1,0(s2)
c0003264:	00048613          	mv	a2,s1
c0003268:	00006517          	auipc	a0,0x6
c000326c:	d6c50513          	addi	a0,a0,-660 # c0008fd4 <commands+0xd84>
c0003270:	0085d593          	srli	a1,a1,0x8
c0003274:	e65fc0ef          	jal	ra,c00000d8 <cprintf>
c0003278:	01c12083          	lw	ra,28(sp)
c000327c:	0089a023          	sw	s0,0(s3)
c0003280:	00000513          	li	a0,0
c0003284:	01812403          	lw	s0,24(sp)
c0003288:	01412483          	lw	s1,20(sp)
c000328c:	01012903          	lw	s2,16(sp)
c0003290:	00c12983          	lw	s3,12(sp)
c0003294:	02010113          	addi	sp,sp,32
c0003298:	00008067          	ret
c000329c:	00006697          	auipc	a3,0x6
c00032a0:	d2868693          	addi	a3,a3,-728 # c0008fc4 <commands+0xd74>
c00032a4:	00005617          	auipc	a2,0x5
c00032a8:	39060613          	addi	a2,a2,912 # c0008634 <commands+0x3e4>
c00032ac:	07e00593          	li	a1,126
c00032b0:	00006517          	auipc	a0,0x6
c00032b4:	d8050513          	addi	a0,a0,-640 # c0009030 <commands+0xde0>
c00032b8:	f95fc0ef          	jal	ra,c000024c <__panic>

c00032bc <default_init>:
c00032bc:	00033797          	auipc	a5,0x33
c00032c0:	c4c78793          	addi	a5,a5,-948 # c0035f08 <free_area>
c00032c4:	00f7a223          	sw	a5,4(a5)
c00032c8:	00f7a023          	sw	a5,0(a5)
c00032cc:	0007a423          	sw	zero,8(a5)
c00032d0:	00008067          	ret

c00032d4 <default_nr_free_pages>:
c00032d4:	00033517          	auipc	a0,0x33
c00032d8:	c3c52503          	lw	a0,-964(a0) # c0035f10 <free_area+0x8>
c00032dc:	00008067          	ret

c00032e0 <default_free_pages>:
c00032e0:	ff010113          	addi	sp,sp,-16
c00032e4:	00112623          	sw	ra,12(sp)
c00032e8:	1e058e63          	beqz	a1,c00034e4 <default_free_pages+0x204>
c00032ec:	00559693          	slli	a3,a1,0x5
c00032f0:	00d506b3          	add	a3,a0,a3
c00032f4:	04d50863          	beq	a0,a3,c0003344 <default_free_pages+0x64>
c00032f8:	00452783          	lw	a5,4(a0)
c00032fc:	0017f793          	andi	a5,a5,1
c0003300:	1c079263          	bnez	a5,c00034c4 <default_free_pages+0x1e4>
c0003304:	00452783          	lw	a5,4(a0)
c0003308:	0017d793          	srli	a5,a5,0x1
c000330c:	0017f793          	andi	a5,a5,1
c0003310:	1a079a63          	bnez	a5,c00034c4 <default_free_pages+0x1e4>
c0003314:	00050793          	mv	a5,a0
c0003318:	01c0006f          	j	c0003334 <default_free_pages+0x54>
c000331c:	0047a703          	lw	a4,4(a5)
c0003320:	00177713          	andi	a4,a4,1
c0003324:	1a071063          	bnez	a4,c00034c4 <default_free_pages+0x1e4>
c0003328:	0047a703          	lw	a4,4(a5)
c000332c:	00277713          	andi	a4,a4,2
c0003330:	18071a63          	bnez	a4,c00034c4 <default_free_pages+0x1e4>
c0003334:	0007a223          	sw	zero,4(a5)
c0003338:	0007a023          	sw	zero,0(a5)
c000333c:	02078793          	addi	a5,a5,32
c0003340:	fcd79ee3          	bne	a5,a3,c000331c <default_free_pages+0x3c>
c0003344:	00b52423          	sw	a1,8(a0)
c0003348:	00450313          	addi	t1,a0,4
c000334c:	00200793          	li	a5,2
c0003350:	40f3202f          	amoor.w	zero,a5,(t1)
c0003354:	00033797          	auipc	a5,0x33
c0003358:	bbc7a783          	lw	a5,-1092(a5) # c0035f10 <free_area+0x8>
c000335c:	00b785b3          	add	a1,a5,a1
c0003360:	00033697          	auipc	a3,0x33
c0003364:	ba868693          	addi	a3,a3,-1112 # c0035f08 <free_area>
c0003368:	00b6a423          	sw	a1,8(a3)
c000336c:	00033797          	auipc	a5,0x33
c0003370:	ba07a783          	lw	a5,-1120(a5) # c0035f0c <free_area+0x4>
c0003374:	12d78863          	beq	a5,a3,c00034a4 <default_free_pages+0x1c4>
c0003378:	00033597          	auipc	a1,0x33
c000337c:	b905a583          	lw	a1,-1136(a1) # c0035f08 <free_area>
c0003380:	00000813          	li	a6,0
c0003384:	00c50613          	addi	a2,a0,12
c0003388:	00100893          	li	a7,1
c000338c:	0080006f          	j	c0003394 <default_free_pages+0xb4>
c0003390:	00070793          	mv	a5,a4
c0003394:	ff478713          	addi	a4,a5,-12
c0003398:	02e56863          	bltu	a0,a4,c00033c8 <default_free_pages+0xe8>
c000339c:	0047a703          	lw	a4,4(a5)
c00033a0:	fed718e3          	bne	a4,a3,c0003390 <default_free_pages+0xb0>
c00033a4:	00c7a223          	sw	a2,4(a5)
c00033a8:	00d52823          	sw	a3,16(a0)
c00033ac:	00f52623          	sw	a5,12(a0)
c00033b0:	0047a783          	lw	a5,4(a5)
c00033b4:	00060593          	mv	a1,a2
c00033b8:	06d78863          	beq	a5,a3,c0003428 <default_free_pages+0x148>
c00033bc:	ff478713          	addi	a4,a5,-12
c00033c0:	00088813          	mv	a6,a7
c00033c4:	fce57ce3          	bleu	a4,a0,c000339c <default_free_pages+0xbc>
c00033c8:	12081e63          	bnez	a6,c0003504 <default_free_pages+0x224>
c00033cc:	0007a583          	lw	a1,0(a5)
c00033d0:	00c7a023          	sw	a2,0(a5)
c00033d4:	00c5a223          	sw	a2,4(a1)
c00033d8:	00f52823          	sw	a5,16(a0)
c00033dc:	00b52623          	sw	a1,12(a0)
c00033e0:	06d58a63          	beq	a1,a3,c0003454 <default_free_pages+0x174>
c00033e4:	ffc5a603          	lw	a2,-4(a1)
c00033e8:	ff458713          	addi	a4,a1,-12
c00033ec:	00561793          	slli	a5,a2,0x5
c00033f0:	00f707b3          	add	a5,a4,a5
c00033f4:	04f51a63          	bne	a0,a5,c0003448 <default_free_pages+0x168>
c00033f8:	00852783          	lw	a5,8(a0)
c00033fc:	00c78633          	add	a2,a5,a2
c0003400:	fec5ae23          	sw	a2,-4(a1)
c0003404:	ffd00793          	li	a5,-3
c0003408:	60f3202f          	amoand.w	zero,a5,(t1)
c000340c:	00c52803          	lw	a6,12(a0)
c0003410:	01052603          	lw	a2,16(a0)
c0003414:	00070513          	mv	a0,a4
c0003418:	00c82223          	sw	a2,4(a6) # fffff004 <sbi_remote_fence_i+0xfffff714>
c000341c:	0045a783          	lw	a5,4(a1)
c0003420:	01062023          	sw	a6,0(a2)
c0003424:	0280006f          	j	c000344c <default_free_pages+0x16c>
c0003428:	00c52583          	lw	a1,12(a0)
c000342c:	00c7a023          	sw	a2,0(a5)
c0003430:	00f58e63          	beq	a1,a5,c000344c <default_free_pages+0x16c>
c0003434:	ffc5a603          	lw	a2,-4(a1)
c0003438:	ff458713          	addi	a4,a1,-12
c000343c:	00561793          	slli	a5,a2,0x5
c0003440:	00f707b3          	add	a5,a4,a5
c0003444:	faf50ae3          	beq	a0,a5,c00033f8 <default_free_pages+0x118>
c0003448:	01052783          	lw	a5,16(a0)
c000344c:	ff478713          	addi	a4,a5,-12
c0003450:	00d78a63          	beq	a5,a3,c0003464 <default_free_pages+0x184>
c0003454:	00852603          	lw	a2,8(a0)
c0003458:	00561693          	slli	a3,a2,0x5
c000345c:	00d506b3          	add	a3,a0,a3
c0003460:	00d70863          	beq	a4,a3,c0003470 <default_free_pages+0x190>
c0003464:	00c12083          	lw	ra,12(sp)
c0003468:	01010113          	addi	sp,sp,16
c000346c:	00008067          	ret
c0003470:	ffc7a703          	lw	a4,-4(a5)
c0003474:	ff878693          	addi	a3,a5,-8
c0003478:	00c70633          	add	a2,a4,a2
c000347c:	00c52423          	sw	a2,8(a0)
c0003480:	ffd00713          	li	a4,-3
c0003484:	60e6a02f          	amoand.w	zero,a4,(a3)
c0003488:	0007a703          	lw	a4,0(a5)
c000348c:	0047a783          	lw	a5,4(a5)
c0003490:	00c12083          	lw	ra,12(sp)
c0003494:	01010113          	addi	sp,sp,16
c0003498:	00f72223          	sw	a5,4(a4)
c000349c:	00e7a023          	sw	a4,0(a5)
c00034a0:	00008067          	ret
c00034a4:	00c12083          	lw	ra,12(sp)
c00034a8:	00c50713          	addi	a4,a0,12
c00034ac:	00e7a023          	sw	a4,0(a5)
c00034b0:	00e7a223          	sw	a4,4(a5)
c00034b4:	00f52823          	sw	a5,16(a0)
c00034b8:	00f52623          	sw	a5,12(a0)
c00034bc:	01010113          	addi	sp,sp,16
c00034c0:	00008067          	ret
c00034c4:	00006697          	auipc	a3,0x6
c00034c8:	15c68693          	addi	a3,a3,348 # c0009620 <commands+0x13d0>
c00034cc:	00005617          	auipc	a2,0x5
c00034d0:	16860613          	addi	a2,a2,360 # c0008634 <commands+0x3e4>
c00034d4:	08300593          	li	a1,131
c00034d8:	00006517          	auipc	a0,0x6
c00034dc:	17050513          	addi	a0,a0,368 # c0009648 <commands+0x13f8>
c00034e0:	d6dfc0ef          	jal	ra,c000024c <__panic>
c00034e4:	00006697          	auipc	a3,0x6
c00034e8:	17c68693          	addi	a3,a3,380 # c0009660 <commands+0x1410>
c00034ec:	00005617          	auipc	a2,0x5
c00034f0:	14860613          	addi	a2,a2,328 # c0008634 <commands+0x3e4>
c00034f4:	08000593          	li	a1,128
c00034f8:	00006517          	auipc	a0,0x6
c00034fc:	15050513          	addi	a0,a0,336 # c0009648 <commands+0x13f8>
c0003500:	d4dfc0ef          	jal	ra,c000024c <__panic>
c0003504:	00b6a023          	sw	a1,0(a3)
c0003508:	ec5ff06f          	j	c00033cc <default_free_pages+0xec>

c000350c <default_init_memmap>:
c000350c:	ff010113          	addi	sp,sp,-16
c0003510:	00112623          	sw	ra,12(sp)
c0003514:	12058e63          	beqz	a1,c0003650 <default_init_memmap+0x144>
c0003518:	00559693          	slli	a3,a1,0x5
c000351c:	00d506b3          	add	a3,a0,a3
c0003520:	02d50c63          	beq	a0,a3,c0003558 <default_init_memmap+0x4c>
c0003524:	00452703          	lw	a4,4(a0)
c0003528:	00050793          	mv	a5,a0
c000352c:	00177713          	andi	a4,a4,1
c0003530:	00071a63          	bnez	a4,c0003544 <default_init_memmap+0x38>
c0003534:	0fc0006f          	j	c0003630 <default_init_memmap+0x124>
c0003538:	0047a703          	lw	a4,4(a5)
c000353c:	00177713          	andi	a4,a4,1
c0003540:	0e070863          	beqz	a4,c0003630 <default_init_memmap+0x124>
c0003544:	0007a423          	sw	zero,8(a5)
c0003548:	0007a223          	sw	zero,4(a5)
c000354c:	0007a023          	sw	zero,0(a5)
c0003550:	02078793          	addi	a5,a5,32
c0003554:	fed792e3          	bne	a5,a3,c0003538 <default_init_memmap+0x2c>
c0003558:	00b52423          	sw	a1,8(a0)
c000355c:	00200793          	li	a5,2
c0003560:	00450713          	addi	a4,a0,4
c0003564:	40f7202f          	amoor.w	zero,a5,(a4)
c0003568:	00033797          	auipc	a5,0x33
c000356c:	9a87a783          	lw	a5,-1624(a5) # c0035f10 <free_area+0x8>
c0003570:	00b785b3          	add	a1,a5,a1
c0003574:	00033697          	auipc	a3,0x33
c0003578:	99468693          	addi	a3,a3,-1644 # c0035f08 <free_area>
c000357c:	00b6a423          	sw	a1,8(a3)
c0003580:	00033797          	auipc	a5,0x33
c0003584:	98c7a783          	lw	a5,-1652(a5) # c0035f0c <free_area+0x4>
c0003588:	08d78463          	beq	a5,a3,c0003610 <default_init_memmap+0x104>
c000358c:	00033597          	auipc	a1,0x33
c0003590:	97c5a583          	lw	a1,-1668(a1) # c0035f08 <free_area>
c0003594:	00000813          	li	a6,0
c0003598:	00c50613          	addi	a2,a0,12
c000359c:	00100893          	li	a7,1
c00035a0:	0080006f          	j	c00035a8 <default_init_memmap+0x9c>
c00035a4:	00070793          	mv	a5,a4
c00035a8:	ff478713          	addi	a4,a5,-12
c00035ac:	02e56863          	bltu	a0,a4,c00035dc <default_init_memmap+0xd0>
c00035b0:	0047a703          	lw	a4,4(a5)
c00035b4:	fed718e3          	bne	a4,a3,c00035a4 <default_init_memmap+0x98>
c00035b8:	00c7a223          	sw	a2,4(a5)
c00035bc:	00d52823          	sw	a3,16(a0)
c00035c0:	00f52623          	sw	a5,12(a0)
c00035c4:	0047a783          	lw	a5,4(a5)
c00035c8:	00060593          	mv	a1,a2
c00035cc:	02d78a63          	beq	a5,a3,c0003600 <default_init_memmap+0xf4>
c00035d0:	ff478713          	addi	a4,a5,-12
c00035d4:	00088813          	mv	a6,a7
c00035d8:	fce57ce3          	bleu	a4,a0,c00035b0 <default_init_memmap+0xa4>
c00035dc:	08081a63          	bnez	a6,c0003670 <default_init_memmap+0x164>
c00035e0:	0007a703          	lw	a4,0(a5)
c00035e4:	00c12083          	lw	ra,12(sp)
c00035e8:	00c7a023          	sw	a2,0(a5)
c00035ec:	00c72223          	sw	a2,4(a4)
c00035f0:	00f52823          	sw	a5,16(a0)
c00035f4:	00e52623          	sw	a4,12(a0)
c00035f8:	01010113          	addi	sp,sp,16
c00035fc:	00008067          	ret
c0003600:	00c12083          	lw	ra,12(sp)
c0003604:	00c7a023          	sw	a2,0(a5)
c0003608:	01010113          	addi	sp,sp,16
c000360c:	00008067          	ret
c0003610:	00c12083          	lw	ra,12(sp)
c0003614:	00c50713          	addi	a4,a0,12
c0003618:	00e7a023          	sw	a4,0(a5)
c000361c:	00e7a223          	sw	a4,4(a5)
c0003620:	00f52823          	sw	a5,16(a0)
c0003624:	00f52623          	sw	a5,12(a0)
c0003628:	01010113          	addi	sp,sp,16
c000362c:	00008067          	ret
c0003630:	00006697          	auipc	a3,0x6
c0003634:	03868693          	addi	a3,a3,56 # c0009668 <commands+0x1418>
c0003638:	00005617          	auipc	a2,0x5
c000363c:	ffc60613          	addi	a2,a2,-4 # c0008634 <commands+0x3e4>
c0003640:	04900593          	li	a1,73
c0003644:	00006517          	auipc	a0,0x6
c0003648:	00450513          	addi	a0,a0,4 # c0009648 <commands+0x13f8>
c000364c:	c01fc0ef          	jal	ra,c000024c <__panic>
c0003650:	00006697          	auipc	a3,0x6
c0003654:	01068693          	addi	a3,a3,16 # c0009660 <commands+0x1410>
c0003658:	00005617          	auipc	a2,0x5
c000365c:	fdc60613          	addi	a2,a2,-36 # c0008634 <commands+0x3e4>
c0003660:	04600593          	li	a1,70
c0003664:	00006517          	auipc	a0,0x6
c0003668:	fe450513          	addi	a0,a0,-28 # c0009648 <commands+0x13f8>
c000366c:	be1fc0ef          	jal	ra,c000024c <__panic>
c0003670:	00b6a023          	sw	a1,0(a3)
c0003674:	f6dff06f          	j	c00035e0 <default_init_memmap+0xd4>

c0003678 <default_check>:
c0003678:	fd010113          	addi	sp,sp,-48
c000367c:	03212023          	sw	s2,32(sp)
c0003680:	02112623          	sw	ra,44(sp)
c0003684:	02812423          	sw	s0,40(sp)
c0003688:	02912223          	sw	s1,36(sp)
c000368c:	01312e23          	sw	s3,28(sp)
c0003690:	01412c23          	sw	s4,24(sp)
c0003694:	01512a23          	sw	s5,20(sp)
c0003698:	01612823          	sw	s6,16(sp)
c000369c:	01712623          	sw	s7,12(sp)
c00036a0:	01812423          	sw	s8,8(sp)
c00036a4:	01912223          	sw	s9,4(sp)
c00036a8:	00033917          	auipc	s2,0x33
c00036ac:	86090913          	addi	s2,s2,-1952 # c0035f08 <free_area>
c00036b0:	00033797          	auipc	a5,0x33
c00036b4:	85c7a783          	lw	a5,-1956(a5) # c0035f0c <free_area+0x4>
c00036b8:	3d278663          	beq	a5,s2,c0003a84 <default_check+0x40c>
c00036bc:	ff87a703          	lw	a4,-8(a5)
c00036c0:	00175713          	srli	a4,a4,0x1
c00036c4:	00177713          	andi	a4,a4,1
c00036c8:	3c070663          	beqz	a4,c0003a94 <default_check+0x41c>
c00036cc:	00000413          	li	s0,0
c00036d0:	00000493          	li	s1,0
c00036d4:	0100006f          	j	c00036e4 <default_check+0x6c>
c00036d8:	ff87a703          	lw	a4,-8(a5)
c00036dc:	00277713          	andi	a4,a4,2
c00036e0:	3a070a63          	beqz	a4,c0003a94 <default_check+0x41c>
c00036e4:	ffc7a703          	lw	a4,-4(a5)
c00036e8:	0047a783          	lw	a5,4(a5)
c00036ec:	00148493          	addi	s1,s1,1
c00036f0:	00e40433          	add	s0,s0,a4
c00036f4:	00040993          	mv	s3,s0
c00036f8:	ff2790e3          	bne	a5,s2,c00036d8 <default_check+0x60>
c00036fc:	2e9000ef          	jal	ra,c00041e4 <nr_free_pages>
c0003700:	7ca99a63          	bne	s3,a0,c0003ed4 <default_check+0x85c>
c0003704:	00100513          	li	a0,1
c0003708:	1c5000ef          	jal	ra,c00040cc <alloc_pages>
c000370c:	00050a13          	mv	s4,a0
c0003710:	000502e3          	beqz	a0,c0003f14 <default_check+0x89c>
c0003714:	00100513          	li	a0,1
c0003718:	1b5000ef          	jal	ra,c00040cc <alloc_pages>
c000371c:	00050993          	mv	s3,a0
c0003720:	7c050a63          	beqz	a0,c0003ef4 <default_check+0x87c>
c0003724:	00100513          	li	a0,1
c0003728:	1a5000ef          	jal	ra,c00040cc <alloc_pages>
c000372c:	00050a93          	mv	s5,a0
c0003730:	56050263          	beqz	a0,c0003c94 <default_check+0x61c>
c0003734:	3b3a0063          	beq	s4,s3,c0003ad4 <default_check+0x45c>
c0003738:	38aa0e63          	beq	s4,a0,c0003ad4 <default_check+0x45c>
c000373c:	38a98c63          	beq	s3,a0,c0003ad4 <default_check+0x45c>
c0003740:	000a2783          	lw	a5,0(s4)
c0003744:	36079863          	bnez	a5,c0003ab4 <default_check+0x43c>
c0003748:	0009a783          	lw	a5,0(s3)
c000374c:	36079463          	bnez	a5,c0003ab4 <default_check+0x43c>
c0003750:	00052783          	lw	a5,0(a0)
c0003754:	36079063          	bnez	a5,c0003ab4 <default_check+0x43c>
c0003758:	00032797          	auipc	a5,0x32
c000375c:	7c87a783          	lw	a5,1992(a5) # c0035f20 <pages>
c0003760:	40fa0733          	sub	a4,s4,a5
c0003764:	00029617          	auipc	a2,0x29
c0003768:	2ac62603          	lw	a2,684(a2) # c002ca10 <nbase>
c000376c:	40575713          	srai	a4,a4,0x5
c0003770:	00c70733          	add	a4,a4,a2
c0003774:	00032697          	auipc	a3,0x32
c0003778:	6d06a683          	lw	a3,1744(a3) # c0035e44 <npage>
c000377c:	00c69693          	slli	a3,a3,0xc
c0003780:	00c71713          	slli	a4,a4,0xc
c0003784:	48d77863          	bleu	a3,a4,c0003c14 <default_check+0x59c>
c0003788:	40f98733          	sub	a4,s3,a5
c000378c:	40575713          	srai	a4,a4,0x5
c0003790:	00c70733          	add	a4,a4,a2
c0003794:	00c71713          	slli	a4,a4,0xc
c0003798:	3ed77e63          	bleu	a3,a4,c0003b94 <default_check+0x51c>
c000379c:	40f507b3          	sub	a5,a0,a5
c00037a0:	4057d793          	srai	a5,a5,0x5
c00037a4:	00c787b3          	add	a5,a5,a2
c00037a8:	00c79793          	slli	a5,a5,0xc
c00037ac:	3cd7f463          	bleu	a3,a5,c0003b74 <default_check+0x4fc>
c00037b0:	00100513          	li	a0,1
c00037b4:	00032c17          	auipc	s8,0x32
c00037b8:	754c2c03          	lw	s8,1876(s8) # c0035f08 <free_area>
c00037bc:	00032b97          	auipc	s7,0x32
c00037c0:	750bab83          	lw	s7,1872(s7) # c0035f0c <free_area+0x4>
c00037c4:	00032b17          	auipc	s6,0x32
c00037c8:	74cb2b03          	lw	s6,1868(s6) # c0035f10 <free_area+0x8>
c00037cc:	01292223          	sw	s2,4(s2)
c00037d0:	01292023          	sw	s2,0(s2)
c00037d4:	00092423          	sw	zero,8(s2)
c00037d8:	0f5000ef          	jal	ra,c00040cc <alloc_pages>
c00037dc:	36051c63          	bnez	a0,c0003b54 <default_check+0x4dc>
c00037e0:	00100593          	li	a1,1
c00037e4:	000a0513          	mv	a0,s4
c00037e8:	199000ef          	jal	ra,c0004180 <free_pages>
c00037ec:	00100593          	li	a1,1
c00037f0:	00098513          	mv	a0,s3
c00037f4:	18d000ef          	jal	ra,c0004180 <free_pages>
c00037f8:	00100593          	li	a1,1
c00037fc:	000a8513          	mv	a0,s5
c0003800:	181000ef          	jal	ra,c0004180 <free_pages>
c0003804:	00032717          	auipc	a4,0x32
c0003808:	70c72703          	lw	a4,1804(a4) # c0035f10 <free_area+0x8>
c000380c:	00300793          	li	a5,3
c0003810:	32f71263          	bne	a4,a5,c0003b34 <default_check+0x4bc>
c0003814:	00100513          	li	a0,1
c0003818:	0b5000ef          	jal	ra,c00040cc <alloc_pages>
c000381c:	00050993          	mv	s3,a0
c0003820:	2c050a63          	beqz	a0,c0003af4 <default_check+0x47c>
c0003824:	00100513          	li	a0,1
c0003828:	0a5000ef          	jal	ra,c00040cc <alloc_pages>
c000382c:	00050a93          	mv	s5,a0
c0003830:	44050263          	beqz	a0,c0003c74 <default_check+0x5fc>
c0003834:	00100513          	li	a0,1
c0003838:	095000ef          	jal	ra,c00040cc <alloc_pages>
c000383c:	00050a13          	mv	s4,a0
c0003840:	40050a63          	beqz	a0,c0003c54 <default_check+0x5dc>
c0003844:	00100513          	li	a0,1
c0003848:	085000ef          	jal	ra,c00040cc <alloc_pages>
c000384c:	3e051463          	bnez	a0,c0003c34 <default_check+0x5bc>
c0003850:	00100593          	li	a1,1
c0003854:	00098513          	mv	a0,s3
c0003858:	129000ef          	jal	ra,c0004180 <free_pages>
c000385c:	00032797          	auipc	a5,0x32
c0003860:	6b07a783          	lw	a5,1712(a5) # c0035f0c <free_area+0x4>
c0003864:	2b278863          	beq	a5,s2,c0003b14 <default_check+0x49c>
c0003868:	00100513          	li	a0,1
c000386c:	061000ef          	jal	ra,c00040cc <alloc_pages>
c0003870:	38a99263          	bne	s3,a0,c0003bf4 <default_check+0x57c>
c0003874:	00100513          	li	a0,1
c0003878:	055000ef          	jal	ra,c00040cc <alloc_pages>
c000387c:	34051c63          	bnez	a0,c0003bd4 <default_check+0x55c>
c0003880:	00032797          	auipc	a5,0x32
c0003884:	6907a783          	lw	a5,1680(a5) # c0035f10 <free_area+0x8>
c0003888:	32079663          	bnez	a5,c0003bb4 <default_check+0x53c>
c000388c:	00098513          	mv	a0,s3
c0003890:	00100593          	li	a1,1
c0003894:	01892023          	sw	s8,0(s2)
c0003898:	01792223          	sw	s7,4(s2)
c000389c:	01692423          	sw	s6,8(s2)
c00038a0:	0e1000ef          	jal	ra,c0004180 <free_pages>
c00038a4:	00100593          	li	a1,1
c00038a8:	000a8513          	mv	a0,s5
c00038ac:	0d5000ef          	jal	ra,c0004180 <free_pages>
c00038b0:	00100593          	li	a1,1
c00038b4:	000a0513          	mv	a0,s4
c00038b8:	0c9000ef          	jal	ra,c0004180 <free_pages>
c00038bc:	00500513          	li	a0,5
c00038c0:	00d000ef          	jal	ra,c00040cc <alloc_pages>
c00038c4:	00050993          	mv	s3,a0
c00038c8:	44050663          	beqz	a0,c0003d14 <default_check+0x69c>
c00038cc:	00452783          	lw	a5,4(a0)
c00038d0:	0017d793          	srli	a5,a5,0x1
c00038d4:	0017f793          	andi	a5,a5,1
c00038d8:	58079e63          	bnez	a5,c0003e74 <default_check+0x7fc>
c00038dc:	00100513          	li	a0,1
c00038e0:	00032b97          	auipc	s7,0x32
c00038e4:	628bab83          	lw	s7,1576(s7) # c0035f08 <free_area>
c00038e8:	00032b17          	auipc	s6,0x32
c00038ec:	624b2b03          	lw	s6,1572(s6) # c0035f0c <free_area+0x4>
c00038f0:	01292023          	sw	s2,0(s2)
c00038f4:	01292223          	sw	s2,4(s2)
c00038f8:	7d4000ef          	jal	ra,c00040cc <alloc_pages>
c00038fc:	54051c63          	bnez	a0,c0003e54 <default_check+0x7dc>
c0003900:	04098a93          	addi	s5,s3,64
c0003904:	000a8513          	mv	a0,s5
c0003908:	00300593          	li	a1,3
c000390c:	00032c17          	auipc	s8,0x32
c0003910:	604c2c03          	lw	s8,1540(s8) # c0035f10 <free_area+0x8>
c0003914:	00092423          	sw	zero,8(s2)
c0003918:	069000ef          	jal	ra,c0004180 <free_pages>
c000391c:	00400513          	li	a0,4
c0003920:	7ac000ef          	jal	ra,c00040cc <alloc_pages>
c0003924:	50051863          	bnez	a0,c0003e34 <default_check+0x7bc>
c0003928:	0449a783          	lw	a5,68(s3)
c000392c:	0017d793          	srli	a5,a5,0x1
c0003930:	0017f793          	andi	a5,a5,1
c0003934:	4e078063          	beqz	a5,c0003e14 <default_check+0x79c>
c0003938:	0489a503          	lw	a0,72(s3)
c000393c:	00300793          	li	a5,3
c0003940:	4cf51a63          	bne	a0,a5,c0003e14 <default_check+0x79c>
c0003944:	788000ef          	jal	ra,c00040cc <alloc_pages>
c0003948:	00050a13          	mv	s4,a0
c000394c:	4a050463          	beqz	a0,c0003df4 <default_check+0x77c>
c0003950:	00100513          	li	a0,1
c0003954:	778000ef          	jal	ra,c00040cc <alloc_pages>
c0003958:	46051e63          	bnez	a0,c0003dd4 <default_check+0x75c>
c000395c:	454a9c63          	bne	s5,s4,c0003db4 <default_check+0x73c>
c0003960:	00100593          	li	a1,1
c0003964:	00098513          	mv	a0,s3
c0003968:	019000ef          	jal	ra,c0004180 <free_pages>
c000396c:	00300593          	li	a1,3
c0003970:	000a8513          	mv	a0,s5
c0003974:	00d000ef          	jal	ra,c0004180 <free_pages>
c0003978:	0049a783          	lw	a5,4(s3)
c000397c:	02098c93          	addi	s9,s3,32
c0003980:	0017d793          	srli	a5,a5,0x1
c0003984:	0017f793          	andi	a5,a5,1
c0003988:	40078663          	beqz	a5,c0003d94 <default_check+0x71c>
c000398c:	0089aa03          	lw	s4,8(s3)
c0003990:	00100793          	li	a5,1
c0003994:	40fa1063          	bne	s4,a5,c0003d94 <default_check+0x71c>
c0003998:	0449a783          	lw	a5,68(s3)
c000399c:	0017d793          	srli	a5,a5,0x1
c00039a0:	0017f793          	andi	a5,a5,1
c00039a4:	3c078863          	beqz	a5,c0003d74 <default_check+0x6fc>
c00039a8:	0489a703          	lw	a4,72(s3)
c00039ac:	00300793          	li	a5,3
c00039b0:	3cf71263          	bne	a4,a5,c0003d74 <default_check+0x6fc>
c00039b4:	000a0513          	mv	a0,s4
c00039b8:	714000ef          	jal	ra,c00040cc <alloc_pages>
c00039bc:	38a99c63          	bne	s3,a0,c0003d54 <default_check+0x6dc>
c00039c0:	000a0593          	mv	a1,s4
c00039c4:	7bc000ef          	jal	ra,c0004180 <free_pages>
c00039c8:	00200513          	li	a0,2
c00039cc:	700000ef          	jal	ra,c00040cc <alloc_pages>
c00039d0:	36aa9263          	bne	s5,a0,c0003d34 <default_check+0x6bc>
c00039d4:	00200593          	li	a1,2
c00039d8:	7a8000ef          	jal	ra,c0004180 <free_pages>
c00039dc:	000a0593          	mv	a1,s4
c00039e0:	000c8513          	mv	a0,s9
c00039e4:	79c000ef          	jal	ra,c0004180 <free_pages>
c00039e8:	00500513          	li	a0,5
c00039ec:	6e0000ef          	jal	ra,c00040cc <alloc_pages>
c00039f0:	00050993          	mv	s3,a0
c00039f4:	4a050063          	beqz	a0,c0003e94 <default_check+0x81c>
c00039f8:	000a0513          	mv	a0,s4
c00039fc:	6d0000ef          	jal	ra,c00040cc <alloc_pages>
c0003a00:	2e051a63          	bnez	a0,c0003cf4 <default_check+0x67c>
c0003a04:	00032797          	auipc	a5,0x32
c0003a08:	50c7a783          	lw	a5,1292(a5) # c0035f10 <free_area+0x8>
c0003a0c:	2c079463          	bnez	a5,c0003cd4 <default_check+0x65c>
c0003a10:	00500593          	li	a1,5
c0003a14:	00098513          	mv	a0,s3
c0003a18:	01892423          	sw	s8,8(s2)
c0003a1c:	01792023          	sw	s7,0(s2)
c0003a20:	01692223          	sw	s6,4(s2)
c0003a24:	75c000ef          	jal	ra,c0004180 <free_pages>
c0003a28:	00032797          	auipc	a5,0x32
c0003a2c:	4e47a783          	lw	a5,1252(a5) # c0035f0c <free_area+0x4>
c0003a30:	01278c63          	beq	a5,s2,c0003a48 <default_check+0x3d0>
c0003a34:	ffc7a703          	lw	a4,-4(a5)
c0003a38:	0047a783          	lw	a5,4(a5)
c0003a3c:	fff48493          	addi	s1,s1,-1
c0003a40:	40e40433          	sub	s0,s0,a4
c0003a44:	ff2798e3          	bne	a5,s2,c0003a34 <default_check+0x3bc>
c0003a48:	26049663          	bnez	s1,c0003cb4 <default_check+0x63c>
c0003a4c:	46041463          	bnez	s0,c0003eb4 <default_check+0x83c>
c0003a50:	02c12083          	lw	ra,44(sp)
c0003a54:	02812403          	lw	s0,40(sp)
c0003a58:	02412483          	lw	s1,36(sp)
c0003a5c:	02012903          	lw	s2,32(sp)
c0003a60:	01c12983          	lw	s3,28(sp)
c0003a64:	01812a03          	lw	s4,24(sp)
c0003a68:	01412a83          	lw	s5,20(sp)
c0003a6c:	01012b03          	lw	s6,16(sp)
c0003a70:	00c12b83          	lw	s7,12(sp)
c0003a74:	00812c03          	lw	s8,8(sp)
c0003a78:	00412c83          	lw	s9,4(sp)
c0003a7c:	03010113          	addi	sp,sp,48
c0003a80:	00008067          	ret
c0003a84:	00000993          	li	s3,0
c0003a88:	00000413          	li	s0,0
c0003a8c:	00000493          	li	s1,0
c0003a90:	c6dff06f          	j	c00036fc <default_check+0x84>
c0003a94:	00005697          	auipc	a3,0x5
c0003a98:	5c068693          	addi	a3,a3,1472 # c0009054 <commands+0xe04>
c0003a9c:	00005617          	auipc	a2,0x5
c0003aa0:	b9860613          	addi	a2,a2,-1128 # c0008634 <commands+0x3e4>
c0003aa4:	0f000593          	li	a1,240
c0003aa8:	00006517          	auipc	a0,0x6
c0003aac:	ba050513          	addi	a0,a0,-1120 # c0009648 <commands+0x13f8>
c0003ab0:	f9cfc0ef          	jal	ra,c000024c <__panic>
c0003ab4:	00006697          	auipc	a3,0x6
c0003ab8:	91868693          	addi	a3,a3,-1768 # c00093cc <commands+0x117c>
c0003abc:	00005617          	auipc	a2,0x5
c0003ac0:	b7860613          	addi	a2,a2,-1160 # c0008634 <commands+0x3e4>
c0003ac4:	0be00593          	li	a1,190
c0003ac8:	00006517          	auipc	a0,0x6
c0003acc:	b8050513          	addi	a0,a0,-1152 # c0009648 <commands+0x13f8>
c0003ad0:	f7cfc0ef          	jal	ra,c000024c <__panic>
c0003ad4:	00006697          	auipc	a3,0x6
c0003ad8:	8d468693          	addi	a3,a3,-1836 # c00093a8 <commands+0x1158>
c0003adc:	00005617          	auipc	a2,0x5
c0003ae0:	b5860613          	addi	a2,a2,-1192 # c0008634 <commands+0x3e4>
c0003ae4:	0bd00593          	li	a1,189
c0003ae8:	00006517          	auipc	a0,0x6
c0003aec:	b6050513          	addi	a0,a0,-1184 # c0009648 <commands+0x13f8>
c0003af0:	f5cfc0ef          	jal	ra,c000024c <__panic>
c0003af4:	00006697          	auipc	a3,0x6
c0003af8:	86068693          	addi	a3,a3,-1952 # c0009354 <commands+0x1104>
c0003afc:	00005617          	auipc	a2,0x5
c0003b00:	b3860613          	addi	a2,a2,-1224 # c0008634 <commands+0x3e4>
c0003b04:	0d200593          	li	a1,210
c0003b08:	00006517          	auipc	a0,0x6
c0003b0c:	b4050513          	addi	a0,a0,-1216 # c0009648 <commands+0x13f8>
c0003b10:	f3cfc0ef          	jal	ra,c000024c <__panic>
c0003b14:	00006697          	auipc	a3,0x6
c0003b18:	97c68693          	addi	a3,a3,-1668 # c0009490 <commands+0x1240>
c0003b1c:	00005617          	auipc	a2,0x5
c0003b20:	b1860613          	addi	a2,a2,-1256 # c0008634 <commands+0x3e4>
c0003b24:	0d900593          	li	a1,217
c0003b28:	00006517          	auipc	a0,0x6
c0003b2c:	b2050513          	addi	a0,a0,-1248 # c0009648 <commands+0x13f8>
c0003b30:	f1cfc0ef          	jal	ra,c000024c <__panic>
c0003b34:	00006697          	auipc	a3,0x6
c0003b38:	94c68693          	addi	a3,a3,-1716 # c0009480 <commands+0x1230>
c0003b3c:	00005617          	auipc	a2,0x5
c0003b40:	af860613          	addi	a2,a2,-1288 # c0008634 <commands+0x3e4>
c0003b44:	0d000593          	li	a1,208
c0003b48:	00006517          	auipc	a0,0x6
c0003b4c:	b0050513          	addi	a0,a0,-1280 # c0009648 <commands+0x13f8>
c0003b50:	efcfc0ef          	jal	ra,c000024c <__panic>
c0003b54:	00006697          	auipc	a3,0x6
c0003b58:	91468693          	addi	a3,a3,-1772 # c0009468 <commands+0x1218>
c0003b5c:	00005617          	auipc	a2,0x5
c0003b60:	ad860613          	addi	a2,a2,-1320 # c0008634 <commands+0x3e4>
c0003b64:	0cb00593          	li	a1,203
c0003b68:	00006517          	auipc	a0,0x6
c0003b6c:	ae050513          	addi	a0,a0,-1312 # c0009648 <commands+0x13f8>
c0003b70:	edcfc0ef          	jal	ra,c000024c <__panic>
c0003b74:	00006697          	auipc	a3,0x6
c0003b78:	8d468693          	addi	a3,a3,-1836 # c0009448 <commands+0x11f8>
c0003b7c:	00005617          	auipc	a2,0x5
c0003b80:	ab860613          	addi	a2,a2,-1352 # c0008634 <commands+0x3e4>
c0003b84:	0c200593          	li	a1,194
c0003b88:	00006517          	auipc	a0,0x6
c0003b8c:	ac050513          	addi	a0,a0,-1344 # c0009648 <commands+0x13f8>
c0003b90:	ebcfc0ef          	jal	ra,c000024c <__panic>
c0003b94:	00006697          	auipc	a3,0x6
c0003b98:	89468693          	addi	a3,a3,-1900 # c0009428 <commands+0x11d8>
c0003b9c:	00005617          	auipc	a2,0x5
c0003ba0:	a9860613          	addi	a2,a2,-1384 # c0008634 <commands+0x3e4>
c0003ba4:	0c100593          	li	a1,193
c0003ba8:	00006517          	auipc	a0,0x6
c0003bac:	aa050513          	addi	a0,a0,-1376 # c0009648 <commands+0x13f8>
c0003bb0:	e9cfc0ef          	jal	ra,c000024c <__panic>
c0003bb4:	00005697          	auipc	a3,0x5
c0003bb8:	62468693          	addi	a3,a3,1572 # c00091d8 <commands+0xf88>
c0003bbc:	00005617          	auipc	a2,0x5
c0003bc0:	a7860613          	addi	a2,a2,-1416 # c0008634 <commands+0x3e4>
c0003bc4:	0df00593          	li	a1,223
c0003bc8:	00006517          	auipc	a0,0x6
c0003bcc:	a8050513          	addi	a0,a0,-1408 # c0009648 <commands+0x13f8>
c0003bd0:	e7cfc0ef          	jal	ra,c000024c <__panic>
c0003bd4:	00006697          	auipc	a3,0x6
c0003bd8:	89468693          	addi	a3,a3,-1900 # c0009468 <commands+0x1218>
c0003bdc:	00005617          	auipc	a2,0x5
c0003be0:	a5860613          	addi	a2,a2,-1448 # c0008634 <commands+0x3e4>
c0003be4:	0dd00593          	li	a1,221
c0003be8:	00006517          	auipc	a0,0x6
c0003bec:	a6050513          	addi	a0,a0,-1440 # c0009648 <commands+0x13f8>
c0003bf0:	e5cfc0ef          	jal	ra,c000024c <__panic>
c0003bf4:	00006697          	auipc	a3,0x6
c0003bf8:	8b468693          	addi	a3,a3,-1868 # c00094a8 <commands+0x1258>
c0003bfc:	00005617          	auipc	a2,0x5
c0003c00:	a3860613          	addi	a2,a2,-1480 # c0008634 <commands+0x3e4>
c0003c04:	0dc00593          	li	a1,220
c0003c08:	00006517          	auipc	a0,0x6
c0003c0c:	a4050513          	addi	a0,a0,-1472 # c0009648 <commands+0x13f8>
c0003c10:	e3cfc0ef          	jal	ra,c000024c <__panic>
c0003c14:	00005697          	auipc	a3,0x5
c0003c18:	7f468693          	addi	a3,a3,2036 # c0009408 <commands+0x11b8>
c0003c1c:	00005617          	auipc	a2,0x5
c0003c20:	a1860613          	addi	a2,a2,-1512 # c0008634 <commands+0x3e4>
c0003c24:	0c000593          	li	a1,192
c0003c28:	00006517          	auipc	a0,0x6
c0003c2c:	a2050513          	addi	a0,a0,-1504 # c0009648 <commands+0x13f8>
c0003c30:	e1cfc0ef          	jal	ra,c000024c <__panic>
c0003c34:	00006697          	auipc	a3,0x6
c0003c38:	83468693          	addi	a3,a3,-1996 # c0009468 <commands+0x1218>
c0003c3c:	00005617          	auipc	a2,0x5
c0003c40:	9f860613          	addi	a2,a2,-1544 # c0008634 <commands+0x3e4>
c0003c44:	0d600593          	li	a1,214
c0003c48:	00006517          	auipc	a0,0x6
c0003c4c:	a0050513          	addi	a0,a0,-1536 # c0009648 <commands+0x13f8>
c0003c50:	dfcfc0ef          	jal	ra,c000024c <__panic>
c0003c54:	00005697          	auipc	a3,0x5
c0003c58:	73868693          	addi	a3,a3,1848 # c000938c <commands+0x113c>
c0003c5c:	00005617          	auipc	a2,0x5
c0003c60:	9d860613          	addi	a2,a2,-1576 # c0008634 <commands+0x3e4>
c0003c64:	0d400593          	li	a1,212
c0003c68:	00006517          	auipc	a0,0x6
c0003c6c:	9e050513          	addi	a0,a0,-1568 # c0009648 <commands+0x13f8>
c0003c70:	ddcfc0ef          	jal	ra,c000024c <__panic>
c0003c74:	00005697          	auipc	a3,0x5
c0003c78:	6fc68693          	addi	a3,a3,1788 # c0009370 <commands+0x1120>
c0003c7c:	00005617          	auipc	a2,0x5
c0003c80:	9b860613          	addi	a2,a2,-1608 # c0008634 <commands+0x3e4>
c0003c84:	0d300593          	li	a1,211
c0003c88:	00006517          	auipc	a0,0x6
c0003c8c:	9c050513          	addi	a0,a0,-1600 # c0009648 <commands+0x13f8>
c0003c90:	dbcfc0ef          	jal	ra,c000024c <__panic>
c0003c94:	00005697          	auipc	a3,0x5
c0003c98:	6f868693          	addi	a3,a3,1784 # c000938c <commands+0x113c>
c0003c9c:	00005617          	auipc	a2,0x5
c0003ca0:	99860613          	addi	a2,a2,-1640 # c0008634 <commands+0x3e4>
c0003ca4:	0bb00593          	li	a1,187
c0003ca8:	00006517          	auipc	a0,0x6
c0003cac:	9a050513          	addi	a0,a0,-1632 # c0009648 <commands+0x13f8>
c0003cb0:	d9cfc0ef          	jal	ra,c000024c <__panic>
c0003cb4:	00006697          	auipc	a3,0x6
c0003cb8:	95468693          	addi	a3,a3,-1708 # c0009608 <commands+0x13b8>
c0003cbc:	00005617          	auipc	a2,0x5
c0003cc0:	97860613          	addi	a2,a2,-1672 # c0008634 <commands+0x3e4>
c0003cc4:	12500593          	li	a1,293
c0003cc8:	00006517          	auipc	a0,0x6
c0003ccc:	98050513          	addi	a0,a0,-1664 # c0009648 <commands+0x13f8>
c0003cd0:	d7cfc0ef          	jal	ra,c000024c <__panic>
c0003cd4:	00005697          	auipc	a3,0x5
c0003cd8:	50468693          	addi	a3,a3,1284 # c00091d8 <commands+0xf88>
c0003cdc:	00005617          	auipc	a2,0x5
c0003ce0:	95860613          	addi	a2,a2,-1704 # c0008634 <commands+0x3e4>
c0003ce4:	11a00593          	li	a1,282
c0003ce8:	00006517          	auipc	a0,0x6
c0003cec:	96050513          	addi	a0,a0,-1696 # c0009648 <commands+0x13f8>
c0003cf0:	d5cfc0ef          	jal	ra,c000024c <__panic>
c0003cf4:	00005697          	auipc	a3,0x5
c0003cf8:	77468693          	addi	a3,a3,1908 # c0009468 <commands+0x1218>
c0003cfc:	00005617          	auipc	a2,0x5
c0003d00:	93860613          	addi	a2,a2,-1736 # c0008634 <commands+0x3e4>
c0003d04:	11800593          	li	a1,280
c0003d08:	00006517          	auipc	a0,0x6
c0003d0c:	94050513          	addi	a0,a0,-1728 # c0009648 <commands+0x13f8>
c0003d10:	d3cfc0ef          	jal	ra,c000024c <__panic>
c0003d14:	00005697          	auipc	a3,0x5
c0003d18:	7b068693          	addi	a3,a3,1968 # c00094c4 <commands+0x1274>
c0003d1c:	00005617          	auipc	a2,0x5
c0003d20:	91860613          	addi	a2,a2,-1768 # c0008634 <commands+0x3e4>
c0003d24:	0f800593          	li	a1,248
c0003d28:	00006517          	auipc	a0,0x6
c0003d2c:	92050513          	addi	a0,a0,-1760 # c0009648 <commands+0x13f8>
c0003d30:	d1cfc0ef          	jal	ra,c000024c <__panic>
c0003d34:	00006697          	auipc	a3,0x6
c0003d38:	89468693          	addi	a3,a3,-1900 # c00095c8 <commands+0x1378>
c0003d3c:	00005617          	auipc	a2,0x5
c0003d40:	8f860613          	addi	a2,a2,-1800 # c0008634 <commands+0x3e4>
c0003d44:	11200593          	li	a1,274
c0003d48:	00006517          	auipc	a0,0x6
c0003d4c:	90050513          	addi	a0,a0,-1792 # c0009648 <commands+0x13f8>
c0003d50:	cfcfc0ef          	jal	ra,c000024c <__panic>
c0003d54:	00006697          	auipc	a3,0x6
c0003d58:	85468693          	addi	a3,a3,-1964 # c00095a8 <commands+0x1358>
c0003d5c:	00005617          	auipc	a2,0x5
c0003d60:	8d860613          	addi	a2,a2,-1832 # c0008634 <commands+0x3e4>
c0003d64:	11000593          	li	a1,272
c0003d68:	00006517          	auipc	a0,0x6
c0003d6c:	8e050513          	addi	a0,a0,-1824 # c0009648 <commands+0x13f8>
c0003d70:	cdcfc0ef          	jal	ra,c000024c <__panic>
c0003d74:	00006697          	auipc	a3,0x6
c0003d78:	80c68693          	addi	a3,a3,-2036 # c0009580 <commands+0x1330>
c0003d7c:	00005617          	auipc	a2,0x5
c0003d80:	8b860613          	addi	a2,a2,-1864 # c0008634 <commands+0x3e4>
c0003d84:	10e00593          	li	a1,270
c0003d88:	00006517          	auipc	a0,0x6
c0003d8c:	8c050513          	addi	a0,a0,-1856 # c0009648 <commands+0x13f8>
c0003d90:	cbcfc0ef          	jal	ra,c000024c <__panic>
c0003d94:	00005697          	auipc	a3,0x5
c0003d98:	7c468693          	addi	a3,a3,1988 # c0009558 <commands+0x1308>
c0003d9c:	00005617          	auipc	a2,0x5
c0003da0:	89860613          	addi	a2,a2,-1896 # c0008634 <commands+0x3e4>
c0003da4:	10d00593          	li	a1,269
c0003da8:	00006517          	auipc	a0,0x6
c0003dac:	8a050513          	addi	a0,a0,-1888 # c0009648 <commands+0x13f8>
c0003db0:	c9cfc0ef          	jal	ra,c000024c <__panic>
c0003db4:	00005697          	auipc	a3,0x5
c0003db8:	79468693          	addi	a3,a3,1940 # c0009548 <commands+0x12f8>
c0003dbc:	00005617          	auipc	a2,0x5
c0003dc0:	87860613          	addi	a2,a2,-1928 # c0008634 <commands+0x3e4>
c0003dc4:	10800593          	li	a1,264
c0003dc8:	00006517          	auipc	a0,0x6
c0003dcc:	88050513          	addi	a0,a0,-1920 # c0009648 <commands+0x13f8>
c0003dd0:	c7cfc0ef          	jal	ra,c000024c <__panic>
c0003dd4:	00005697          	auipc	a3,0x5
c0003dd8:	69468693          	addi	a3,a3,1684 # c0009468 <commands+0x1218>
c0003ddc:	00005617          	auipc	a2,0x5
c0003de0:	85860613          	addi	a2,a2,-1960 # c0008634 <commands+0x3e4>
c0003de4:	10700593          	li	a1,263
c0003de8:	00006517          	auipc	a0,0x6
c0003dec:	86050513          	addi	a0,a0,-1952 # c0009648 <commands+0x13f8>
c0003df0:	c5cfc0ef          	jal	ra,c000024c <__panic>
c0003df4:	00005697          	auipc	a3,0x5
c0003df8:	73468693          	addi	a3,a3,1844 # c0009528 <commands+0x12d8>
c0003dfc:	00005617          	auipc	a2,0x5
c0003e00:	83860613          	addi	a2,a2,-1992 # c0008634 <commands+0x3e4>
c0003e04:	10600593          	li	a1,262
c0003e08:	00006517          	auipc	a0,0x6
c0003e0c:	84050513          	addi	a0,a0,-1984 # c0009648 <commands+0x13f8>
c0003e10:	c3cfc0ef          	jal	ra,c000024c <__panic>
c0003e14:	00005697          	auipc	a3,0x5
c0003e18:	6e868693          	addi	a3,a3,1768 # c00094fc <commands+0x12ac>
c0003e1c:	00005617          	auipc	a2,0x5
c0003e20:	81860613          	addi	a2,a2,-2024 # c0008634 <commands+0x3e4>
c0003e24:	10500593          	li	a1,261
c0003e28:	00006517          	auipc	a0,0x6
c0003e2c:	82050513          	addi	a0,a0,-2016 # c0009648 <commands+0x13f8>
c0003e30:	c1cfc0ef          	jal	ra,c000024c <__panic>
c0003e34:	00005697          	auipc	a3,0x5
c0003e38:	6b068693          	addi	a3,a3,1712 # c00094e4 <commands+0x1294>
c0003e3c:	00004617          	auipc	a2,0x4
c0003e40:	7f860613          	addi	a2,a2,2040 # c0008634 <commands+0x3e4>
c0003e44:	10400593          	li	a1,260
c0003e48:	00006517          	auipc	a0,0x6
c0003e4c:	80050513          	addi	a0,a0,-2048 # c0009648 <commands+0x13f8>
c0003e50:	bfcfc0ef          	jal	ra,c000024c <__panic>
c0003e54:	00005697          	auipc	a3,0x5
c0003e58:	61468693          	addi	a3,a3,1556 # c0009468 <commands+0x1218>
c0003e5c:	00004617          	auipc	a2,0x4
c0003e60:	7d860613          	addi	a2,a2,2008 # c0008634 <commands+0x3e4>
c0003e64:	0fe00593          	li	a1,254
c0003e68:	00005517          	auipc	a0,0x5
c0003e6c:	7e050513          	addi	a0,a0,2016 # c0009648 <commands+0x13f8>
c0003e70:	bdcfc0ef          	jal	ra,c000024c <__panic>
c0003e74:	00005697          	auipc	a3,0x5
c0003e78:	65c68693          	addi	a3,a3,1628 # c00094d0 <commands+0x1280>
c0003e7c:	00004617          	auipc	a2,0x4
c0003e80:	7b860613          	addi	a2,a2,1976 # c0008634 <commands+0x3e4>
c0003e84:	0f900593          	li	a1,249
c0003e88:	00005517          	auipc	a0,0x5
c0003e8c:	7c050513          	addi	a0,a0,1984 # c0009648 <commands+0x13f8>
c0003e90:	bbcfc0ef          	jal	ra,c000024c <__panic>
c0003e94:	00005697          	auipc	a3,0x5
c0003e98:	75468693          	addi	a3,a3,1876 # c00095e8 <commands+0x1398>
c0003e9c:	00004617          	auipc	a2,0x4
c0003ea0:	79860613          	addi	a2,a2,1944 # c0008634 <commands+0x3e4>
c0003ea4:	11700593          	li	a1,279
c0003ea8:	00005517          	auipc	a0,0x5
c0003eac:	7a050513          	addi	a0,a0,1952 # c0009648 <commands+0x13f8>
c0003eb0:	b9cfc0ef          	jal	ra,c000024c <__panic>
c0003eb4:	00005697          	auipc	a3,0x5
c0003eb8:	76068693          	addi	a3,a3,1888 # c0009614 <commands+0x13c4>
c0003ebc:	00004617          	auipc	a2,0x4
c0003ec0:	77860613          	addi	a2,a2,1912 # c0008634 <commands+0x3e4>
c0003ec4:	12600593          	li	a1,294
c0003ec8:	00005517          	auipc	a0,0x5
c0003ecc:	78050513          	addi	a0,a0,1920 # c0009648 <commands+0x13f8>
c0003ed0:	b7cfc0ef          	jal	ra,c000024c <__panic>
c0003ed4:	00005697          	auipc	a3,0x5
c0003ed8:	19068693          	addi	a3,a3,400 # c0009064 <commands+0xe14>
c0003edc:	00004617          	auipc	a2,0x4
c0003ee0:	75860613          	addi	a2,a2,1880 # c0008634 <commands+0x3e4>
c0003ee4:	0f300593          	li	a1,243
c0003ee8:	00005517          	auipc	a0,0x5
c0003eec:	76050513          	addi	a0,a0,1888 # c0009648 <commands+0x13f8>
c0003ef0:	b5cfc0ef          	jal	ra,c000024c <__panic>
c0003ef4:	00005697          	auipc	a3,0x5
c0003ef8:	47c68693          	addi	a3,a3,1148 # c0009370 <commands+0x1120>
c0003efc:	00004617          	auipc	a2,0x4
c0003f00:	73860613          	addi	a2,a2,1848 # c0008634 <commands+0x3e4>
c0003f04:	0ba00593          	li	a1,186
c0003f08:	00005517          	auipc	a0,0x5
c0003f0c:	74050513          	addi	a0,a0,1856 # c0009648 <commands+0x13f8>
c0003f10:	b3cfc0ef          	jal	ra,c000024c <__panic>
c0003f14:	00005697          	auipc	a3,0x5
c0003f18:	44068693          	addi	a3,a3,1088 # c0009354 <commands+0x1104>
c0003f1c:	00004617          	auipc	a2,0x4
c0003f20:	71860613          	addi	a2,a2,1816 # c0008634 <commands+0x3e4>
c0003f24:	0b900593          	li	a1,185
c0003f28:	00005517          	auipc	a0,0x5
c0003f2c:	72050513          	addi	a0,a0,1824 # c0009648 <commands+0x13f8>
c0003f30:	b1cfc0ef          	jal	ra,c000024c <__panic>

c0003f34 <default_alloc_pages>:
c0003f34:	0a050263          	beqz	a0,c0003fd8 <default_alloc_pages+0xa4>
c0003f38:	00032597          	auipc	a1,0x32
c0003f3c:	fd85a583          	lw	a1,-40(a1) # c0035f10 <free_area+0x8>
c0003f40:	00050693          	mv	a3,a0
c0003f44:	00032617          	auipc	a2,0x32
c0003f48:	fc460613          	addi	a2,a2,-60 # c0035f08 <free_area>
c0003f4c:	00a5ee63          	bltu	a1,a0,c0003f68 <default_alloc_pages+0x34>
c0003f50:	00060793          	mv	a5,a2
c0003f54:	00c0006f          	j	c0003f60 <default_alloc_pages+0x2c>
c0003f58:	ffc7a703          	lw	a4,-4(a5)
c0003f5c:	00d77a63          	bleu	a3,a4,c0003f70 <default_alloc_pages+0x3c>
c0003f60:	0047a783          	lw	a5,4(a5)
c0003f64:	fec79ae3          	bne	a5,a2,c0003f58 <default_alloc_pages+0x24>
c0003f68:	00000513          	li	a0,0
c0003f6c:	00008067          	ret
c0003f70:	ff478513          	addi	a0,a5,-12
c0003f74:	fe050ce3          	beqz	a0,c0003f6c <default_alloc_pages+0x38>
c0003f78:	0007a803          	lw	a6,0(a5)
c0003f7c:	0047a883          	lw	a7,4(a5)
c0003f80:	01182223          	sw	a7,4(a6)
c0003f84:	0108a023          	sw	a6,0(a7)
c0003f88:	02e6fc63          	bleu	a4,a3,c0003fc0 <default_alloc_pages+0x8c>
c0003f8c:	00569893          	slli	a7,a3,0x5
c0003f90:	011508b3          	add	a7,a0,a7
c0003f94:	40d70733          	sub	a4,a4,a3
c0003f98:	00e8a423          	sw	a4,8(a7)
c0003f9c:	00488313          	addi	t1,a7,4
c0003fa0:	00200713          	li	a4,2
c0003fa4:	40e3202f          	amoor.w	zero,a4,(t1)
c0003fa8:	00482703          	lw	a4,4(a6)
c0003fac:	00c88313          	addi	t1,a7,12
c0003fb0:	00672023          	sw	t1,0(a4)
c0003fb4:	00682223          	sw	t1,4(a6)
c0003fb8:	00e8a823          	sw	a4,16(a7)
c0003fbc:	0108a623          	sw	a6,12(a7)
c0003fc0:	40d586b3          	sub	a3,a1,a3
c0003fc4:	00d62423          	sw	a3,8(a2)
c0003fc8:	ffd00713          	li	a4,-3
c0003fcc:	ff878793          	addi	a5,a5,-8
c0003fd0:	60e7a02f          	amoand.w	zero,a4,(a5)
c0003fd4:	00008067          	ret
c0003fd8:	ff010113          	addi	sp,sp,-16
c0003fdc:	00005697          	auipc	a3,0x5
c0003fe0:	68468693          	addi	a3,a3,1668 # c0009660 <commands+0x1410>
c0003fe4:	00004617          	auipc	a2,0x4
c0003fe8:	65060613          	addi	a2,a2,1616 # c0008634 <commands+0x3e4>
c0003fec:	06200593          	li	a1,98
c0003ff0:	00005517          	auipc	a0,0x5
c0003ff4:	65850513          	addi	a0,a0,1624 # c0009648 <commands+0x13f8>
c0003ff8:	00112623          	sw	ra,12(sp)
c0003ffc:	a50fc0ef          	jal	ra,c000024c <__panic>

c0004000 <get_pgtable_items.isra.4.part.5>:
c0004000:	00050313          	mv	t1,a0
c0004004:	04a5f063          	bleu	a0,a1,c0004044 <get_pgtable_items.isra.4.part.5+0x44>
c0004008:	00259813          	slli	a6,a1,0x2
c000400c:	010608b3          	add	a7,a2,a6
c0004010:	0008a783          	lw	a5,0(a7)
c0004014:	0017f793          	andi	a5,a5,1
c0004018:	02079a63          	bnez	a5,c000404c <get_pgtable_items.isra.4.part.5+0x4c>
c000401c:	00480813          	addi	a6,a6,4
c0004020:	01060833          	add	a6,a2,a6
c0004024:	0140006f          	j	c0004038 <get_pgtable_items.isra.4.part.5+0x38>
c0004028:	00082783          	lw	a5,0(a6)
c000402c:	00480813          	addi	a6,a6,4
c0004030:	0017f793          	andi	a5,a5,1
c0004034:	00079c63          	bnez	a5,c000404c <get_pgtable_items.isra.4.part.5+0x4c>
c0004038:	00158593          	addi	a1,a1,1
c000403c:	00080893          	mv	a7,a6
c0004040:	fe6594e3          	bne	a1,t1,c0004028 <get_pgtable_items.isra.4.part.5+0x28>
c0004044:	00000513          	li	a0,0
c0004048:	00008067          	ret
c000404c:	00068463          	beqz	a3,c0004054 <get_pgtable_items.isra.4.part.5+0x54>
c0004050:	00b6a023          	sw	a1,0(a3)
c0004054:	0008a503          	lw	a0,0(a7)
c0004058:	00158593          	addi	a1,a1,1
c000405c:	01f57513          	andi	a0,a0,31
c0004060:	0265fe63          	bleu	t1,a1,c000409c <get_pgtable_items.isra.4.part.5+0x9c>
c0004064:	00259793          	slli	a5,a1,0x2
c0004068:	00f606b3          	add	a3,a2,a5
c000406c:	0006a683          	lw	a3,0(a3)
c0004070:	01f6f693          	andi	a3,a3,31
c0004074:	02a69463          	bne	a3,a0,c000409c <get_pgtable_items.isra.4.part.5+0x9c>
c0004078:	ffc78793          	addi	a5,a5,-4
c000407c:	00f60633          	add	a2,a2,a5
c0004080:	0140006f          	j	c0004094 <get_pgtable_items.isra.4.part.5+0x94>
c0004084:	00862783          	lw	a5,8(a2)
c0004088:	00460613          	addi	a2,a2,4
c000408c:	01f7f793          	andi	a5,a5,31
c0004090:	00d79663          	bne	a5,a3,c000409c <get_pgtable_items.isra.4.part.5+0x9c>
c0004094:	00158593          	addi	a1,a1,1
c0004098:	fe65e6e3          	bltu	a1,t1,c0004084 <get_pgtable_items.isra.4.part.5+0x84>
c000409c:	00070663          	beqz	a4,c00040a8 <get_pgtable_items.isra.4.part.5+0xa8>
c00040a0:	00b72023          	sw	a1,0(a4)
c00040a4:	00008067          	ret
c00040a8:	00008067          	ret

c00040ac <pa2page.part.6>:
c00040ac:	ff010113          	addi	sp,sp,-16
c00040b0:	00005617          	auipc	a2,0x5
c00040b4:	c0060613          	addi	a2,a2,-1024 # c0008cb0 <commands+0xa60>
c00040b8:	06200593          	li	a1,98
c00040bc:	00005517          	auipc	a0,0x5
c00040c0:	c1450513          	addi	a0,a0,-1004 # c0008cd0 <commands+0xa80>
c00040c4:	00112623          	sw	ra,12(sp)
c00040c8:	984fc0ef          	jal	ra,c000024c <__panic>

c00040cc <alloc_pages>:
c00040cc:	ff010113          	addi	sp,sp,-16
c00040d0:	00812423          	sw	s0,8(sp)
c00040d4:	01212023          	sw	s2,0(sp)
c00040d8:	00112623          	sw	ra,12(sp)
c00040dc:	00912223          	sw	s1,4(sp)
c00040e0:	00050413          	mv	s0,a0
c00040e4:	00100913          	li	s2,1
c00040e8:	0400006f          	j	c0004128 <alloc_pages+0x5c>
c00040ec:	00032797          	auipc	a5,0x32
c00040f0:	e287a783          	lw	a5,-472(a5) # c0035f14 <pmm_manager>
c00040f4:	00c7a783          	lw	a5,12(a5)
c00040f8:	000780e7          	jalr	a5
c00040fc:	00050493          	mv	s1,a0
c0004100:	00000613          	li	a2,0
c0004104:	00040593          	mv	a1,s0
c0004108:	04049e63          	bnez	s1,c0004164 <alloc_pages+0x98>
c000410c:	04896c63          	bltu	s2,s0,c0004164 <alloc_pages+0x98>
c0004110:	00032797          	auipc	a5,0x32
c0004114:	d2c7a783          	lw	a5,-724(a5) # c0035e3c <swap_init_ok>
c0004118:	04078663          	beqz	a5,c0004164 <alloc_pages+0x98>
c000411c:	00032517          	auipc	a0,0x32
c0004120:	d4452503          	lw	a0,-700(a0) # c0035e60 <check_mm_struct>
c0004124:	f3dfe0ef          	jal	ra,c0003060 <swap_out>
c0004128:	100027f3          	csrr	a5,sstatus
c000412c:	0027f793          	andi	a5,a5,2
c0004130:	00040513          	mv	a0,s0
c0004134:	fa078ce3          	beqz	a5,c00040ec <alloc_pages+0x20>
c0004138:	ee8fc0ef          	jal	ra,c0000820 <intr_disable>
c000413c:	00032797          	auipc	a5,0x32
c0004140:	dd87a783          	lw	a5,-552(a5) # c0035f14 <pmm_manager>
c0004144:	00c7a783          	lw	a5,12(a5)
c0004148:	00040513          	mv	a0,s0
c000414c:	000780e7          	jalr	a5
c0004150:	00050493          	mv	s1,a0
c0004154:	ec4fc0ef          	jal	ra,c0000818 <intr_enable>
c0004158:	00000613          	li	a2,0
c000415c:	00040593          	mv	a1,s0
c0004160:	fa0486e3          	beqz	s1,c000410c <alloc_pages+0x40>
c0004164:	00c12083          	lw	ra,12(sp)
c0004168:	00048513          	mv	a0,s1
c000416c:	00812403          	lw	s0,8(sp)
c0004170:	00412483          	lw	s1,4(sp)
c0004174:	00012903          	lw	s2,0(sp)
c0004178:	01010113          	addi	sp,sp,16
c000417c:	00008067          	ret

c0004180 <free_pages>:
c0004180:	100027f3          	csrr	a5,sstatus
c0004184:	0027f793          	andi	a5,a5,2
c0004188:	00079a63          	bnez	a5,c000419c <free_pages+0x1c>
c000418c:	00032797          	auipc	a5,0x32
c0004190:	d887a783          	lw	a5,-632(a5) # c0035f14 <pmm_manager>
c0004194:	0107a303          	lw	t1,16(a5)
c0004198:	00030067          	jr	t1
c000419c:	ff010113          	addi	sp,sp,-16
c00041a0:	00112623          	sw	ra,12(sp)
c00041a4:	00812423          	sw	s0,8(sp)
c00041a8:	00912223          	sw	s1,4(sp)
c00041ac:	00050413          	mv	s0,a0
c00041b0:	00058493          	mv	s1,a1
c00041b4:	e6cfc0ef          	jal	ra,c0000820 <intr_disable>
c00041b8:	00032797          	auipc	a5,0x32
c00041bc:	d5c7a783          	lw	a5,-676(a5) # c0035f14 <pmm_manager>
c00041c0:	0107a783          	lw	a5,16(a5)
c00041c4:	00048593          	mv	a1,s1
c00041c8:	00040513          	mv	a0,s0
c00041cc:	000780e7          	jalr	a5
c00041d0:	00c12083          	lw	ra,12(sp)
c00041d4:	00812403          	lw	s0,8(sp)
c00041d8:	00412483          	lw	s1,4(sp)
c00041dc:	01010113          	addi	sp,sp,16
c00041e0:	e38fc06f          	j	c0000818 <intr_enable>

c00041e4 <nr_free_pages>:
c00041e4:	100027f3          	csrr	a5,sstatus
c00041e8:	0027f793          	andi	a5,a5,2
c00041ec:	00079a63          	bnez	a5,c0004200 <nr_free_pages+0x1c>
c00041f0:	00032797          	auipc	a5,0x32
c00041f4:	d247a783          	lw	a5,-732(a5) # c0035f14 <pmm_manager>
c00041f8:	0147a303          	lw	t1,20(a5)
c00041fc:	00030067          	jr	t1
c0004200:	ff010113          	addi	sp,sp,-16
c0004204:	00112623          	sw	ra,12(sp)
c0004208:	00812423          	sw	s0,8(sp)
c000420c:	e14fc0ef          	jal	ra,c0000820 <intr_disable>
c0004210:	00032797          	auipc	a5,0x32
c0004214:	d047a783          	lw	a5,-764(a5) # c0035f14 <pmm_manager>
c0004218:	0147a783          	lw	a5,20(a5)
c000421c:	000780e7          	jalr	a5
c0004220:	00050413          	mv	s0,a0
c0004224:	df4fc0ef          	jal	ra,c0000818 <intr_enable>
c0004228:	00c12083          	lw	ra,12(sp)
c000422c:	00040513          	mv	a0,s0
c0004230:	00812403          	lw	s0,8(sp)
c0004234:	01010113          	addi	sp,sp,16
c0004238:	00008067          	ret

c000423c <get_pte>:
c000423c:	fe010113          	addi	sp,sp,-32
c0004240:	01212823          	sw	s2,16(sp)
c0004244:	0165d913          	srli	s2,a1,0x16
c0004248:	00291913          	slli	s2,s2,0x2
c000424c:	01250933          	add	s2,a0,s2
c0004250:	00092683          	lw	a3,0(s2)
c0004254:	00912a23          	sw	s1,20(sp)
c0004258:	00112e23          	sw	ra,28(sp)
c000425c:	00812c23          	sw	s0,24(sp)
c0004260:	01312623          	sw	s3,12(sp)
c0004264:	0016f793          	andi	a5,a3,1
c0004268:	00058493          	mv	s1,a1
c000426c:	08079663          	bnez	a5,c00042f8 <get_pte+0xbc>
c0004270:	0c060e63          	beqz	a2,c000434c <get_pte+0x110>
c0004274:	00100513          	li	a0,1
c0004278:	e55ff0ef          	jal	ra,c00040cc <alloc_pages>
c000427c:	00050413          	mv	s0,a0
c0004280:	0c050663          	beqz	a0,c000434c <get_pte+0x110>
c0004284:	00032517          	auipc	a0,0x32
c0004288:	c9c52503          	lw	a0,-868(a0) # c0035f20 <pages>
c000428c:	00100793          	li	a5,1
c0004290:	40a40533          	sub	a0,s0,a0
c0004294:	00f42023          	sw	a5,0(s0)
c0004298:	40555513          	srai	a0,a0,0x5
c000429c:	000809b7          	lui	s3,0x80
c00042a0:	001007b7          	lui	a5,0x100
c00042a4:	01350533          	add	a0,a0,s3
c00042a8:	fff78793          	addi	a5,a5,-1 # fffff <_binary_obj___user_exit_out_size+0xfd9a3>
c00042ac:	00f577b3          	and	a5,a0,a5
c00042b0:	00032717          	auipc	a4,0x32
c00042b4:	b9472703          	lw	a4,-1132(a4) # c0035e44 <npage>
c00042b8:	00c51513          	slli	a0,a0,0xc
c00042bc:	0ce7f463          	bleu	a4,a5,c0004384 <get_pte+0x148>
c00042c0:	00032797          	auipc	a5,0x32
c00042c4:	c587a783          	lw	a5,-936(a5) # c0035f18 <va_pa_offset>
c00042c8:	00001637          	lui	a2,0x1
c00042cc:	00000593          	li	a1,0
c00042d0:	00f50533          	add	a0,a0,a5
c00042d4:	7e8030ef          	jal	ra,c0007abc <memset>
c00042d8:	00032697          	auipc	a3,0x32
c00042dc:	c486a683          	lw	a3,-952(a3) # c0035f20 <pages>
c00042e0:	40d406b3          	sub	a3,s0,a3
c00042e4:	4056d693          	srai	a3,a3,0x5
c00042e8:	013686b3          	add	a3,a3,s3
c00042ec:	00a69693          	slli	a3,a3,0xa
c00042f0:	0116e693          	ori	a3,a3,17
c00042f4:	00d92023          	sw	a3,0(s2)
c00042f8:	00269693          	slli	a3,a3,0x2
c00042fc:	fffff537          	lui	a0,0xfffff
c0004300:	00a6f6b3          	and	a3,a3,a0
c0004304:	00c6d713          	srli	a4,a3,0xc
c0004308:	00032797          	auipc	a5,0x32
c000430c:	b3c7a783          	lw	a5,-1220(a5) # c0035e44 <npage>
c0004310:	04f77e63          	bleu	a5,a4,c000436c <get_pte+0x130>
c0004314:	00c4d513          	srli	a0,s1,0xc
c0004318:	01c12083          	lw	ra,28(sp)
c000431c:	3ff57513          	andi	a0,a0,1023
c0004320:	00032797          	auipc	a5,0x32
c0004324:	bf87a783          	lw	a5,-1032(a5) # c0035f18 <va_pa_offset>
c0004328:	00f686b3          	add	a3,a3,a5
c000432c:	00251513          	slli	a0,a0,0x2
c0004330:	00a68533          	add	a0,a3,a0
c0004334:	01812403          	lw	s0,24(sp)
c0004338:	01412483          	lw	s1,20(sp)
c000433c:	01012903          	lw	s2,16(sp)
c0004340:	00c12983          	lw	s3,12(sp)
c0004344:	02010113          	addi	sp,sp,32
c0004348:	00008067          	ret
c000434c:	01c12083          	lw	ra,28(sp)
c0004350:	00000513          	li	a0,0
c0004354:	01812403          	lw	s0,24(sp)
c0004358:	01412483          	lw	s1,20(sp)
c000435c:	01012903          	lw	s2,16(sp)
c0004360:	00c12983          	lw	s3,12(sp)
c0004364:	02010113          	addi	sp,sp,32
c0004368:	00008067          	ret
c000436c:	00005617          	auipc	a2,0x5
c0004370:	bac60613          	addi	a2,a2,-1108 # c0008f18 <commands+0xcc8>
c0004374:	12700593          	li	a1,295
c0004378:	00005517          	auipc	a0,0x5
c000437c:	38450513          	addi	a0,a0,900 # c00096fc <default_pmm_manager+0x84>
c0004380:	ecdfb0ef          	jal	ra,c000024c <__panic>
c0004384:	00050693          	mv	a3,a0
c0004388:	00005617          	auipc	a2,0x5
c000438c:	b9060613          	addi	a2,a2,-1136 # c0008f18 <commands+0xcc8>
c0004390:	12400593          	li	a1,292
c0004394:	00005517          	auipc	a0,0x5
c0004398:	36850513          	addi	a0,a0,872 # c00096fc <default_pmm_manager+0x84>
c000439c:	eb1fb0ef          	jal	ra,c000024c <__panic>

c00043a0 <boot_map_segment>:
c00043a0:	fe010113          	addi	sp,sp,-32
c00043a4:	01312623          	sw	s3,12(sp)
c00043a8:	000019b7          	lui	s3,0x1
c00043ac:	00d5c7b3          	xor	a5,a1,a3
c00043b0:	fff98813          	addi	a6,s3,-1 # fff <_binary_obj___user_faultread_out_size-0xf69>
c00043b4:	00112e23          	sw	ra,28(sp)
c00043b8:	00812c23          	sw	s0,24(sp)
c00043bc:	00912a23          	sw	s1,20(sp)
c00043c0:	01212823          	sw	s2,16(sp)
c00043c4:	01412423          	sw	s4,8(sp)
c00043c8:	01512223          	sw	s5,4(sp)
c00043cc:	01612023          	sw	s6,0(sp)
c00043d0:	0107f7b3          	and	a5,a5,a6
c00043d4:	0a079c63          	bnez	a5,c000448c <boot_map_segment+0xec>
c00043d8:	010607b3          	add	a5,a2,a6
c00043dc:	0105f833          	and	a6,a1,a6
c00043e0:	010787b3          	add	a5,a5,a6
c00043e4:	fffff937          	lui	s2,0xfffff
c00043e8:	00c7d793          	srli	a5,a5,0xc
c00043ec:	0125f5b3          	and	a1,a1,s2
c00043f0:	0126f6b3          	and	a3,a3,s2
c00043f4:	04078863          	beqz	a5,c0004444 <boot_map_segment+0xa4>
c00043f8:	00c79793          	slli	a5,a5,0xc
c00043fc:	00100b13          	li	s6,1
c0004400:	00050a93          	mv	s5,a0
c0004404:	00058413          	mv	s0,a1
c0004408:	00b784b3          	add	s1,a5,a1
c000440c:	40b68933          	sub	s2,a3,a1
c0004410:	01676a33          	or	s4,a4,s6
c0004414:	000b0613          	mv	a2,s6
c0004418:	00040593          	mv	a1,s0
c000441c:	000a8513          	mv	a0,s5
c0004420:	e1dff0ef          	jal	ra,c000423c <get_pte>
c0004424:	008907b3          	add	a5,s2,s0
c0004428:	04050263          	beqz	a0,c000446c <boot_map_segment+0xcc>
c000442c:	00c7d793          	srli	a5,a5,0xc
c0004430:	00a79793          	slli	a5,a5,0xa
c0004434:	0147e7b3          	or	a5,a5,s4
c0004438:	00f52023          	sw	a5,0(a0)
c000443c:	01340433          	add	s0,s0,s3
c0004440:	fc849ae3          	bne	s1,s0,c0004414 <boot_map_segment+0x74>
c0004444:	01c12083          	lw	ra,28(sp)
c0004448:	01812403          	lw	s0,24(sp)
c000444c:	01412483          	lw	s1,20(sp)
c0004450:	01012903          	lw	s2,16(sp)
c0004454:	00c12983          	lw	s3,12(sp)
c0004458:	00812a03          	lw	s4,8(sp)
c000445c:	00412a83          	lw	s5,4(sp)
c0004460:	00012b03          	lw	s6,0(sp)
c0004464:	02010113          	addi	sp,sp,32
c0004468:	00008067          	ret
c000446c:	00005697          	auipc	a3,0x5
c0004470:	25468693          	addi	a3,a3,596 # c00096c0 <default_pmm_manager+0x48>
c0004474:	00004617          	auipc	a2,0x4
c0004478:	1c060613          	addi	a2,a2,448 # c0008634 <commands+0x3e4>
c000447c:	0ac00593          	li	a1,172
c0004480:	00005517          	auipc	a0,0x5
c0004484:	27c50513          	addi	a0,a0,636 # c00096fc <default_pmm_manager+0x84>
c0004488:	dc5fb0ef          	jal	ra,c000024c <__panic>
c000448c:	00005697          	auipc	a3,0x5
c0004490:	21c68693          	addi	a3,a3,540 # c00096a8 <default_pmm_manager+0x30>
c0004494:	00004617          	auipc	a2,0x4
c0004498:	1a060613          	addi	a2,a2,416 # c0008634 <commands+0x3e4>
c000449c:	0a600593          	li	a1,166
c00044a0:	00005517          	auipc	a0,0x5
c00044a4:	25c50513          	addi	a0,a0,604 # c00096fc <default_pmm_manager+0x84>
c00044a8:	da5fb0ef          	jal	ra,c000024c <__panic>

c00044ac <get_page>:
c00044ac:	ff010113          	addi	sp,sp,-16
c00044b0:	00812423          	sw	s0,8(sp)
c00044b4:	00060413          	mv	s0,a2
c00044b8:	00000613          	li	a2,0
c00044bc:	00112623          	sw	ra,12(sp)
c00044c0:	d7dff0ef          	jal	ra,c000423c <get_pte>
c00044c4:	00040463          	beqz	s0,c00044cc <get_page+0x20>
c00044c8:	00a42023          	sw	a0,0(s0)
c00044cc:	04050663          	beqz	a0,c0004518 <get_page+0x6c>
c00044d0:	00052783          	lw	a5,0(a0)
c00044d4:	0017f713          	andi	a4,a5,1
c00044d8:	04070063          	beqz	a4,c0004518 <get_page+0x6c>
c00044dc:	00279793          	slli	a5,a5,0x2
c00044e0:	00c7d793          	srli	a5,a5,0xc
c00044e4:	00032717          	auipc	a4,0x32
c00044e8:	96072703          	lw	a4,-1696(a4) # c0035e44 <npage>
c00044ec:	04e7f063          	bleu	a4,a5,c000452c <get_page+0x80>
c00044f0:	fff80537          	lui	a0,0xfff80
c00044f4:	00c12083          	lw	ra,12(sp)
c00044f8:	00a787b3          	add	a5,a5,a0
c00044fc:	00579793          	slli	a5,a5,0x5
c0004500:	00032517          	auipc	a0,0x32
c0004504:	a2052503          	lw	a0,-1504(a0) # c0035f20 <pages>
c0004508:	00f50533          	add	a0,a0,a5
c000450c:	00812403          	lw	s0,8(sp)
c0004510:	01010113          	addi	sp,sp,16
c0004514:	00008067          	ret
c0004518:	00c12083          	lw	ra,12(sp)
c000451c:	00000513          	li	a0,0
c0004520:	00812403          	lw	s0,8(sp)
c0004524:	01010113          	addi	sp,sp,16
c0004528:	00008067          	ret
c000452c:	b81ff0ef          	jal	ra,c00040ac <pa2page.part.6>

c0004530 <unmap_range>:
c0004530:	fd010113          	addi	sp,sp,-48
c0004534:	00c5e7b3          	or	a5,a1,a2
c0004538:	02112623          	sw	ra,44(sp)
c000453c:	02812423          	sw	s0,40(sp)
c0004540:	02912223          	sw	s1,36(sp)
c0004544:	03212023          	sw	s2,32(sp)
c0004548:	01312e23          	sw	s3,28(sp)
c000454c:	01412c23          	sw	s4,24(sp)
c0004550:	01512a23          	sw	s5,20(sp)
c0004554:	01612823          	sw	s6,16(sp)
c0004558:	01712623          	sw	s7,12(sp)
c000455c:	01812423          	sw	s8,8(sp)
c0004560:	01479713          	slli	a4,a5,0x14
c0004564:	12071063          	bnez	a4,c0004684 <unmap_range+0x154>
c0004568:	002007b7          	lui	a5,0x200
c000456c:	00058413          	mv	s0,a1
c0004570:	0ef5ea63          	bltu	a1,a5,c0004664 <unmap_range+0x134>
c0004574:	00060913          	mv	s2,a2
c0004578:	0ec5f663          	bleu	a2,a1,c0004664 <unmap_range+0x134>
c000457c:	b00007b7          	lui	a5,0xb0000
c0004580:	00050993          	mv	s3,a0
c0004584:	00400b37          	lui	s6,0x400
c0004588:	ffc00ab7          	lui	s5,0xffc00
c000458c:	00001a37          	lui	s4,0x1
c0004590:	fff80bb7          	lui	s7,0xfff80
c0004594:	00100c13          	li	s8,1
c0004598:	0cc7e663          	bltu	a5,a2,c0004664 <unmap_range+0x134>
c000459c:	00000613          	li	a2,0
c00045a0:	00040593          	mv	a1,s0
c00045a4:	00098513          	mv	a0,s3
c00045a8:	c95ff0ef          	jal	ra,c000423c <get_pte>
c00045ac:	00050493          	mv	s1,a0
c00045b0:	08050a63          	beqz	a0,c0004644 <unmap_range+0x114>
c00045b4:	00052783          	lw	a5,0(a0)
c00045b8:	02079e63          	bnez	a5,c00045f4 <unmap_range+0xc4>
c00045bc:	01440433          	add	s0,s0,s4
c00045c0:	fd246ee3          	bltu	s0,s2,c000459c <unmap_range+0x6c>
c00045c4:	02c12083          	lw	ra,44(sp)
c00045c8:	02812403          	lw	s0,40(sp)
c00045cc:	02412483          	lw	s1,36(sp)
c00045d0:	02012903          	lw	s2,32(sp)
c00045d4:	01c12983          	lw	s3,28(sp)
c00045d8:	01812a03          	lw	s4,24(sp)
c00045dc:	01412a83          	lw	s5,20(sp)
c00045e0:	01012b03          	lw	s6,16(sp)
c00045e4:	00c12b83          	lw	s7,12(sp)
c00045e8:	00812c03          	lw	s8,8(sp)
c00045ec:	03010113          	addi	sp,sp,48
c00045f0:	00008067          	ret
c00045f4:	0017f713          	andi	a4,a5,1
c00045f8:	fc0702e3          	beqz	a4,c00045bc <unmap_range+0x8c>
c00045fc:	00279793          	slli	a5,a5,0x2
c0004600:	00c7d793          	srli	a5,a5,0xc
c0004604:	00032717          	auipc	a4,0x32
c0004608:	84072703          	lw	a4,-1984(a4) # c0035e44 <npage>
c000460c:	08e7fc63          	bleu	a4,a5,c00046a4 <unmap_range+0x174>
c0004610:	017787b3          	add	a5,a5,s7
c0004614:	00579793          	slli	a5,a5,0x5
c0004618:	00032517          	auipc	a0,0x32
c000461c:	90852503          	lw	a0,-1784(a0) # c0035f20 <pages>
c0004620:	00f50533          	add	a0,a0,a5
c0004624:	00052783          	lw	a5,0(a0)
c0004628:	fff78793          	addi	a5,a5,-1 # afffffff <sbi_remote_fence_i+0xb000070f>
c000462c:	00f52023          	sw	a5,0(a0)
c0004630:	02078463          	beqz	a5,c0004658 <unmap_range+0x128>
c0004634:	0004a023          	sw	zero,0(s1)
c0004638:	10440073          	sfence.vm	s0
c000463c:	01440433          	add	s0,s0,s4
c0004640:	f81ff06f          	j	c00045c0 <unmap_range+0x90>
c0004644:	01640433          	add	s0,s0,s6
c0004648:	01547433          	and	s0,s0,s5
c000464c:	f6040ce3          	beqz	s0,c00045c4 <unmap_range+0x94>
c0004650:	f52466e3          	bltu	s0,s2,c000459c <unmap_range+0x6c>
c0004654:	f71ff06f          	j	c00045c4 <unmap_range+0x94>
c0004658:	000c0593          	mv	a1,s8
c000465c:	b25ff0ef          	jal	ra,c0004180 <free_pages>
c0004660:	fd5ff06f          	j	c0004634 <unmap_range+0x104>
c0004664:	00005697          	auipc	a3,0x5
c0004668:	6cc68693          	addi	a3,a3,1740 # c0009d30 <default_pmm_manager+0x6b8>
c000466c:	00004617          	auipc	a2,0x4
c0004670:	fc860613          	addi	a2,a2,-56 # c0008634 <commands+0x3e4>
c0004674:	15f00593          	li	a1,351
c0004678:	00005517          	auipc	a0,0x5
c000467c:	08450513          	addi	a0,a0,132 # c00096fc <default_pmm_manager+0x84>
c0004680:	bcdfb0ef          	jal	ra,c000024c <__panic>
c0004684:	00005697          	auipc	a3,0x5
c0004688:	68068693          	addi	a3,a3,1664 # c0009d04 <default_pmm_manager+0x68c>
c000468c:	00004617          	auipc	a2,0x4
c0004690:	fa860613          	addi	a2,a2,-88 # c0008634 <commands+0x3e4>
c0004694:	15e00593          	li	a1,350
c0004698:	00005517          	auipc	a0,0x5
c000469c:	06450513          	addi	a0,a0,100 # c00096fc <default_pmm_manager+0x84>
c00046a0:	badfb0ef          	jal	ra,c000024c <__panic>
c00046a4:	a09ff0ef          	jal	ra,c00040ac <pa2page.part.6>

c00046a8 <exit_range>:
c00046a8:	fe010113          	addi	sp,sp,-32
c00046ac:	00c5e7b3          	or	a5,a1,a2
c00046b0:	00112e23          	sw	ra,28(sp)
c00046b4:	00812c23          	sw	s0,24(sp)
c00046b8:	00912a23          	sw	s1,20(sp)
c00046bc:	01212823          	sw	s2,16(sp)
c00046c0:	01312623          	sw	s3,12(sp)
c00046c4:	01412423          	sw	s4,8(sp)
c00046c8:	01512223          	sw	s5,4(sp)
c00046cc:	01612023          	sw	s6,0(sp)
c00046d0:	01479713          	slli	a4,a5,0x14
c00046d4:	0e071863          	bnez	a4,c00047c4 <exit_range+0x11c>
c00046d8:	002007b7          	lui	a5,0x200
c00046dc:	0cf5e463          	bltu	a1,a5,c00047a4 <exit_range+0xfc>
c00046e0:	00060a13          	mv	s4,a2
c00046e4:	0cc5f063          	bleu	a2,a1,c00047a4 <exit_range+0xfc>
c00046e8:	ffc004b7          	lui	s1,0xffc00
c00046ec:	b00007b7          	lui	a5,0xb0000
c00046f0:	00050a93          	mv	s5,a0
c00046f4:	0095f4b3          	and	s1,a1,s1
c00046f8:	fff809b7          	lui	s3,0xfff80
c00046fc:	00100913          	li	s2,1
c0004700:	00400b37          	lui	s6,0x400
c0004704:	00c7f663          	bleu	a2,a5,c0004710 <exit_range+0x68>
c0004708:	09c0006f          	j	c00047a4 <exit_range+0xfc>
c000470c:	0544fc63          	bleu	s4,s1,c0004764 <exit_range+0xbc>
c0004710:	0164d413          	srli	s0,s1,0x16
c0004714:	00241413          	slli	s0,s0,0x2
c0004718:	008a8433          	add	s0,s5,s0
c000471c:	00042783          	lw	a5,0(s0)
c0004720:	0017f713          	andi	a4,a5,1
c0004724:	02070c63          	beqz	a4,c000475c <exit_range+0xb4>
c0004728:	00279793          	slli	a5,a5,0x2
c000472c:	00c7d793          	srli	a5,a5,0xc
c0004730:	00031717          	auipc	a4,0x31
c0004734:	71472703          	lw	a4,1812(a4) # c0035e44 <npage>
c0004738:	04e7fa63          	bleu	a4,a5,c000478c <exit_range+0xe4>
c000473c:	013787b3          	add	a5,a5,s3
c0004740:	00579793          	slli	a5,a5,0x5
c0004744:	00031517          	auipc	a0,0x31
c0004748:	7dc52503          	lw	a0,2012(a0) # c0035f20 <pages>
c000474c:	00090593          	mv	a1,s2
c0004750:	00f50533          	add	a0,a0,a5
c0004754:	a2dff0ef          	jal	ra,c0004180 <free_pages>
c0004758:	00042023          	sw	zero,0(s0)
c000475c:	016484b3          	add	s1,s1,s6
c0004760:	fa0496e3          	bnez	s1,c000470c <exit_range+0x64>
c0004764:	01c12083          	lw	ra,28(sp)
c0004768:	01812403          	lw	s0,24(sp)
c000476c:	01412483          	lw	s1,20(sp)
c0004770:	01012903          	lw	s2,16(sp)
c0004774:	00c12983          	lw	s3,12(sp)
c0004778:	00812a03          	lw	s4,8(sp)
c000477c:	00412a83          	lw	s5,4(sp)
c0004780:	00012b03          	lw	s6,0(sp)
c0004784:	02010113          	addi	sp,sp,32
c0004788:	00008067          	ret
c000478c:	00004617          	auipc	a2,0x4
c0004790:	52460613          	addi	a2,a2,1316 # c0008cb0 <commands+0xa60>
c0004794:	06200593          	li	a1,98
c0004798:	00004517          	auipc	a0,0x4
c000479c:	53850513          	addi	a0,a0,1336 # c0008cd0 <commands+0xa80>
c00047a0:	aadfb0ef          	jal	ra,c000024c <__panic>
c00047a4:	00005697          	auipc	a3,0x5
c00047a8:	58c68693          	addi	a3,a3,1420 # c0009d30 <default_pmm_manager+0x6b8>
c00047ac:	00004617          	auipc	a2,0x4
c00047b0:	e8860613          	addi	a2,a2,-376 # c0008634 <commands+0x3e4>
c00047b4:	17000593          	li	a1,368
c00047b8:	00005517          	auipc	a0,0x5
c00047bc:	f4450513          	addi	a0,a0,-188 # c00096fc <default_pmm_manager+0x84>
c00047c0:	a8dfb0ef          	jal	ra,c000024c <__panic>
c00047c4:	00005697          	auipc	a3,0x5
c00047c8:	54068693          	addi	a3,a3,1344 # c0009d04 <default_pmm_manager+0x68c>
c00047cc:	00004617          	auipc	a2,0x4
c00047d0:	e6860613          	addi	a2,a2,-408 # c0008634 <commands+0x3e4>
c00047d4:	16f00593          	li	a1,367
c00047d8:	00005517          	auipc	a0,0x5
c00047dc:	f2450513          	addi	a0,a0,-220 # c00096fc <default_pmm_manager+0x84>
c00047e0:	a6dfb0ef          	jal	ra,c000024c <__panic>

c00047e4 <page_remove>:
c00047e4:	ff010113          	addi	sp,sp,-16
c00047e8:	00000613          	li	a2,0
c00047ec:	00912223          	sw	s1,4(sp)
c00047f0:	00112623          	sw	ra,12(sp)
c00047f4:	00812423          	sw	s0,8(sp)
c00047f8:	00058493          	mv	s1,a1
c00047fc:	a41ff0ef          	jal	ra,c000423c <get_pte>
c0004800:	00050a63          	beqz	a0,c0004814 <page_remove+0x30>
c0004804:	00052783          	lw	a5,0(a0)
c0004808:	00050413          	mv	s0,a0
c000480c:	0017f713          	andi	a4,a5,1
c0004810:	00071c63          	bnez	a4,c0004828 <page_remove+0x44>
c0004814:	00c12083          	lw	ra,12(sp)
c0004818:	00812403          	lw	s0,8(sp)
c000481c:	00412483          	lw	s1,4(sp)
c0004820:	01010113          	addi	sp,sp,16
c0004824:	00008067          	ret
c0004828:	00279793          	slli	a5,a5,0x2
c000482c:	00c7d793          	srli	a5,a5,0xc
c0004830:	00031717          	auipc	a4,0x31
c0004834:	61472703          	lw	a4,1556(a4) # c0035e44 <npage>
c0004838:	04e7fa63          	bleu	a4,a5,c000488c <page_remove+0xa8>
c000483c:	fff80537          	lui	a0,0xfff80
c0004840:	00a787b3          	add	a5,a5,a0
c0004844:	00579793          	slli	a5,a5,0x5
c0004848:	00031517          	auipc	a0,0x31
c000484c:	6d852503          	lw	a0,1752(a0) # c0035f20 <pages>
c0004850:	00f50533          	add	a0,a0,a5
c0004854:	00052783          	lw	a5,0(a0)
c0004858:	fff78793          	addi	a5,a5,-1 # afffffff <sbi_remote_fence_i+0xb000070f>
c000485c:	00f52023          	sw	a5,0(a0)
c0004860:	02078063          	beqz	a5,c0004880 <page_remove+0x9c>
c0004864:	00042023          	sw	zero,0(s0)
c0004868:	10448073          	sfence.vm	s1
c000486c:	00c12083          	lw	ra,12(sp)
c0004870:	00812403          	lw	s0,8(sp)
c0004874:	00412483          	lw	s1,4(sp)
c0004878:	01010113          	addi	sp,sp,16
c000487c:	00008067          	ret
c0004880:	00100593          	li	a1,1
c0004884:	8fdff0ef          	jal	ra,c0004180 <free_pages>
c0004888:	fddff06f          	j	c0004864 <page_remove+0x80>
c000488c:	821ff0ef          	jal	ra,c00040ac <pa2page.part.6>

c0004890 <page_insert>:
c0004890:	fe010113          	addi	sp,sp,-32
c0004894:	01312623          	sw	s3,12(sp)
c0004898:	00060993          	mv	s3,a2
c000489c:	00812c23          	sw	s0,24(sp)
c00048a0:	00100613          	li	a2,1
c00048a4:	00058413          	mv	s0,a1
c00048a8:	00098593          	mv	a1,s3
c00048ac:	01212823          	sw	s2,16(sp)
c00048b0:	00112e23          	sw	ra,28(sp)
c00048b4:	00912a23          	sw	s1,20(sp)
c00048b8:	00068913          	mv	s2,a3
c00048bc:	981ff0ef          	jal	ra,c000423c <get_pte>
c00048c0:	0c050a63          	beqz	a0,c0004994 <page_insert+0x104>
c00048c4:	00042703          	lw	a4,0(s0)
c00048c8:	00050493          	mv	s1,a0
c00048cc:	00170793          	addi	a5,a4,1
c00048d0:	00f42023          	sw	a5,0(s0)
c00048d4:	00052783          	lw	a5,0(a0)
c00048d8:	0017f693          	andi	a3,a5,1
c00048dc:	04069863          	bnez	a3,c000492c <page_insert+0x9c>
c00048e0:	00031697          	auipc	a3,0x31
c00048e4:	6406a683          	lw	a3,1600(a3) # c0035f20 <pages>
c00048e8:	40d40433          	sub	s0,s0,a3
c00048ec:	40545413          	srai	s0,s0,0x5
c00048f0:	000806b7          	lui	a3,0x80
c00048f4:	00d40433          	add	s0,s0,a3
c00048f8:	00a41413          	slli	s0,s0,0xa
c00048fc:	00196693          	ori	a3,s2,1
c0004900:	00d466b3          	or	a3,s0,a3
c0004904:	00d4a023          	sw	a3,0(s1) # ffc00000 <sbi_remote_fence_i+0xffc00710>
c0004908:	10498073          	sfence.vm	s3
c000490c:	00000513          	li	a0,0
c0004910:	01c12083          	lw	ra,28(sp)
c0004914:	01812403          	lw	s0,24(sp)
c0004918:	01412483          	lw	s1,20(sp)
c000491c:	01012903          	lw	s2,16(sp)
c0004920:	00c12983          	lw	s3,12(sp)
c0004924:	02010113          	addi	sp,sp,32
c0004928:	00008067          	ret
c000492c:	00279793          	slli	a5,a5,0x2
c0004930:	00c7d793          	srli	a5,a5,0xc
c0004934:	00031697          	auipc	a3,0x31
c0004938:	5106a683          	lw	a3,1296(a3) # c0035e44 <npage>
c000493c:	06d7f063          	bleu	a3,a5,c000499c <page_insert+0x10c>
c0004940:	fff80537          	lui	a0,0xfff80
c0004944:	00a78533          	add	a0,a5,a0
c0004948:	00031697          	auipc	a3,0x31
c000494c:	5d86a683          	lw	a3,1496(a3) # c0035f20 <pages>
c0004950:	00551513          	slli	a0,a0,0x5
c0004954:	00a68533          	add	a0,a3,a0
c0004958:	00a40e63          	beq	s0,a0,c0004974 <page_insert+0xe4>
c000495c:	00052783          	lw	a5,0(a0) # fff80000 <sbi_remote_fence_i+0xfff80710>
c0004960:	fff78793          	addi	a5,a5,-1
c0004964:	00f52023          	sw	a5,0(a0)
c0004968:	00078a63          	beqz	a5,c000497c <page_insert+0xec>
c000496c:	10498073          	sfence.vm	s3
c0004970:	f79ff06f          	j	c00048e8 <page_insert+0x58>
c0004974:	00e42023          	sw	a4,0(s0)
c0004978:	f71ff06f          	j	c00048e8 <page_insert+0x58>
c000497c:	00100593          	li	a1,1
c0004980:	801ff0ef          	jal	ra,c0004180 <free_pages>
c0004984:	00031697          	auipc	a3,0x31
c0004988:	59c6a683          	lw	a3,1436(a3) # c0035f20 <pages>
c000498c:	10498073          	sfence.vm	s3
c0004990:	f59ff06f          	j	c00048e8 <page_insert+0x58>
c0004994:	ffc00513          	li	a0,-4
c0004998:	f79ff06f          	j	c0004910 <page_insert+0x80>
c000499c:	f10ff0ef          	jal	ra,c00040ac <pa2page.part.6>

c00049a0 <copy_range>:
c00049a0:	fc010113          	addi	sp,sp,-64
c00049a4:	00d667b3          	or	a5,a2,a3
c00049a8:	02112e23          	sw	ra,60(sp)
c00049ac:	02812c23          	sw	s0,56(sp)
c00049b0:	02912a23          	sw	s1,52(sp)
c00049b4:	03212823          	sw	s2,48(sp)
c00049b8:	03312623          	sw	s3,44(sp)
c00049bc:	03412423          	sw	s4,40(sp)
c00049c0:	03512223          	sw	s5,36(sp)
c00049c4:	03612023          	sw	s6,32(sp)
c00049c8:	01712e23          	sw	s7,28(sp)
c00049cc:	01812c23          	sw	s8,24(sp)
c00049d0:	01912a23          	sw	s9,20(sp)
c00049d4:	01a12823          	sw	s10,16(sp)
c00049d8:	01b12623          	sw	s11,12(sp)
c00049dc:	01479713          	slli	a4,a5,0x14
c00049e0:	24071c63          	bnez	a4,c0004c38 <copy_range+0x298>
c00049e4:	002007b7          	lui	a5,0x200
c00049e8:	00060413          	mv	s0,a2
c00049ec:	1ef66863          	bltu	a2,a5,c0004bdc <copy_range+0x23c>
c00049f0:	00068493          	mv	s1,a3
c00049f4:	1ed67463          	bleu	a3,a2,c0004bdc <copy_range+0x23c>
c00049f8:	b00007b7          	lui	a5,0xb0000
c00049fc:	1ed7e063          	bltu	a5,a3,c0004bdc <copy_range+0x23c>
c0004a00:	00100a37          	lui	s4,0x100
c0004a04:	00050b13          	mv	s6,a0
c0004a08:	00058993          	mv	s3,a1
c0004a0c:	00001937          	lui	s2,0x1
c0004a10:	00100a93          	li	s5,1
c0004a14:	fff80cb7          	lui	s9,0xfff80
c0004a18:	00080bb7          	lui	s7,0x80
c0004a1c:	fffa0a13          	addi	s4,s4,-1 # fffff <_binary_obj___user_exit_out_size+0xfd9a3>
c0004a20:	00000613          	li	a2,0
c0004a24:	00040593          	mv	a1,s0
c0004a28:	00098513          	mv	a0,s3
c0004a2c:	811ff0ef          	jal	ra,c000423c <get_pte>
c0004a30:	00050c13          	mv	s8,a0
c0004a34:	14050463          	beqz	a0,c0004b7c <copy_range+0x1dc>
c0004a38:	00052783          	lw	a5,0(a0)
c0004a3c:	0017f793          	andi	a5,a5,1
c0004a40:	04079663          	bnez	a5,c0004a8c <copy_range+0xec>
c0004a44:	01240433          	add	s0,s0,s2
c0004a48:	fc946ce3          	bltu	s0,s1,c0004a20 <copy_range+0x80>
c0004a4c:	00000513          	li	a0,0
c0004a50:	03c12083          	lw	ra,60(sp)
c0004a54:	03812403          	lw	s0,56(sp)
c0004a58:	03412483          	lw	s1,52(sp)
c0004a5c:	03012903          	lw	s2,48(sp)
c0004a60:	02c12983          	lw	s3,44(sp)
c0004a64:	02812a03          	lw	s4,40(sp)
c0004a68:	02412a83          	lw	s5,36(sp)
c0004a6c:	02012b03          	lw	s6,32(sp)
c0004a70:	01c12b83          	lw	s7,28(sp)
c0004a74:	01812c03          	lw	s8,24(sp)
c0004a78:	01412c83          	lw	s9,20(sp)
c0004a7c:	01012d03          	lw	s10,16(sp)
c0004a80:	00c12d83          	lw	s11,12(sp)
c0004a84:	04010113          	addi	sp,sp,64
c0004a88:	00008067          	ret
c0004a8c:	000a8613          	mv	a2,s5
c0004a90:	00040593          	mv	a1,s0
c0004a94:	000b0513          	mv	a0,s6
c0004a98:	fa4ff0ef          	jal	ra,c000423c <get_pte>
c0004a9c:	0e050e63          	beqz	a0,c0004b98 <copy_range+0x1f8>
c0004aa0:	000c2783          	lw	a5,0(s8)
c0004aa4:	0017f713          	andi	a4,a5,1
c0004aa8:	01f7fc13          	andi	s8,a5,31
c0004aac:	16070a63          	beqz	a4,c0004c20 <copy_range+0x280>
c0004ab0:	00279793          	slli	a5,a5,0x2
c0004ab4:	00c7d793          	srli	a5,a5,0xc
c0004ab8:	00031717          	auipc	a4,0x31
c0004abc:	38c72703          	lw	a4,908(a4) # c0035e44 <npage>
c0004ac0:	14e7fe63          	bleu	a4,a5,c0004c1c <copy_range+0x27c>
c0004ac4:	019787b3          	add	a5,a5,s9
c0004ac8:	00579713          	slli	a4,a5,0x5
c0004acc:	000a8513          	mv	a0,s5
c0004ad0:	00031797          	auipc	a5,0x31
c0004ad4:	4507a783          	lw	a5,1104(a5) # c0035f20 <pages>
c0004ad8:	00e78db3          	add	s11,a5,a4
c0004adc:	df0ff0ef          	jal	ra,c00040cc <alloc_pages>
c0004ae0:	00050d13          	mv	s10,a0
c0004ae4:	0c0d8c63          	beqz	s11,c0004bbc <copy_range+0x21c>
c0004ae8:	10050a63          	beqz	a0,c0004bfc <copy_range+0x25c>
c0004aec:	00031717          	auipc	a4,0x31
c0004af0:	43472703          	lw	a4,1076(a4) # c0035f20 <pages>
c0004af4:	40ed86b3          	sub	a3,s11,a4
c0004af8:	4056d693          	srai	a3,a3,0x5
c0004afc:	017686b3          	add	a3,a3,s7
c0004b00:	0146f7b3          	and	a5,a3,s4
c0004b04:	00031617          	auipc	a2,0x31
c0004b08:	34062603          	lw	a2,832(a2) # c0035e44 <npage>
c0004b0c:	00c69693          	slli	a3,a3,0xc
c0004b10:	08c7fa63          	bleu	a2,a5,c0004ba4 <copy_range+0x204>
c0004b14:	40e507b3          	sub	a5,a0,a4
c0004b18:	4057d793          	srai	a5,a5,0x5
c0004b1c:	017787b3          	add	a5,a5,s7
c0004b20:	00031517          	auipc	a0,0x31
c0004b24:	3f852503          	lw	a0,1016(a0) # c0035f18 <va_pa_offset>
c0004b28:	0147f733          	and	a4,a5,s4
c0004b2c:	00a685b3          	add	a1,a3,a0
c0004b30:	00c79793          	slli	a5,a5,0xc
c0004b34:	06c77663          	bleu	a2,a4,c0004ba0 <copy_range+0x200>
c0004b38:	00090613          	mv	a2,s2
c0004b3c:	00a78533          	add	a0,a5,a0
c0004b40:	799020ef          	jal	ra,c0007ad8 <memcpy>
c0004b44:	000c0693          	mv	a3,s8
c0004b48:	00040613          	mv	a2,s0
c0004b4c:	000d0593          	mv	a1,s10
c0004b50:	000b0513          	mv	a0,s6
c0004b54:	d3dff0ef          	jal	ra,c0004890 <page_insert>
c0004b58:	ee0506e3          	beqz	a0,c0004a44 <copy_range+0xa4>
c0004b5c:	00005697          	auipc	a3,0x5
c0004b60:	b9468693          	addi	a3,a3,-1132 # c00096f0 <default_pmm_manager+0x78>
c0004b64:	00004617          	auipc	a2,0x4
c0004b68:	ad060613          	addi	a2,a2,-1328 # c0008634 <commands+0x3e4>
c0004b6c:	1b700593          	li	a1,439
c0004b70:	00005517          	auipc	a0,0x5
c0004b74:	b8c50513          	addi	a0,a0,-1140 # c00096fc <default_pmm_manager+0x84>
c0004b78:	ed4fb0ef          	jal	ra,c000024c <__panic>
c0004b7c:	004007b7          	lui	a5,0x400
c0004b80:	00f40433          	add	s0,s0,a5
c0004b84:	ffc007b7          	lui	a5,0xffc00
c0004b88:	00f47433          	and	s0,s0,a5
c0004b8c:	ec0400e3          	beqz	s0,c0004a4c <copy_range+0xac>
c0004b90:	e89468e3          	bltu	s0,s1,c0004a20 <copy_range+0x80>
c0004b94:	eb9ff06f          	j	c0004a4c <copy_range+0xac>
c0004b98:	ffc00513          	li	a0,-4
c0004b9c:	eb5ff06f          	j	c0004a50 <copy_range+0xb0>
c0004ba0:	00078693          	mv	a3,a5
c0004ba4:	00004617          	auipc	a2,0x4
c0004ba8:	37460613          	addi	a2,a2,884 # c0008f18 <commands+0xcc8>
c0004bac:	06900593          	li	a1,105
c0004bb0:	00004517          	auipc	a0,0x4
c0004bb4:	12050513          	addi	a0,a0,288 # c0008cd0 <commands+0xa80>
c0004bb8:	e94fb0ef          	jal	ra,c000024c <__panic>
c0004bbc:	00005697          	auipc	a3,0x5
c0004bc0:	b1468693          	addi	a3,a3,-1260 # c00096d0 <default_pmm_manager+0x58>
c0004bc4:	00004617          	auipc	a2,0x4
c0004bc8:	a7060613          	addi	a2,a2,-1424 # c0008634 <commands+0x3e4>
c0004bcc:	19c00593          	li	a1,412
c0004bd0:	00005517          	auipc	a0,0x5
c0004bd4:	b2c50513          	addi	a0,a0,-1236 # c00096fc <default_pmm_manager+0x84>
c0004bd8:	e74fb0ef          	jal	ra,c000024c <__panic>
c0004bdc:	00005697          	auipc	a3,0x5
c0004be0:	15468693          	addi	a3,a3,340 # c0009d30 <default_pmm_manager+0x6b8>
c0004be4:	00004617          	auipc	a2,0x4
c0004be8:	a5060613          	addi	a2,a2,-1456 # c0008634 <commands+0x3e4>
c0004bec:	18800593          	li	a1,392
c0004bf0:	00005517          	auipc	a0,0x5
c0004bf4:	b0c50513          	addi	a0,a0,-1268 # c00096fc <default_pmm_manager+0x84>
c0004bf8:	e54fb0ef          	jal	ra,c000024c <__panic>
c0004bfc:	00005697          	auipc	a3,0x5
c0004c00:	ae468693          	addi	a3,a3,-1308 # c00096e0 <default_pmm_manager+0x68>
c0004c04:	00004617          	auipc	a2,0x4
c0004c08:	a3060613          	addi	a2,a2,-1488 # c0008634 <commands+0x3e4>
c0004c0c:	19d00593          	li	a1,413
c0004c10:	00005517          	auipc	a0,0x5
c0004c14:	aec50513          	addi	a0,a0,-1300 # c00096fc <default_pmm_manager+0x84>
c0004c18:	e34fb0ef          	jal	ra,c000024c <__panic>
c0004c1c:	c90ff0ef          	jal	ra,c00040ac <pa2page.part.6>
c0004c20:	00004617          	auipc	a2,0x4
c0004c24:	5e060613          	addi	a2,a2,1504 # c0009200 <commands+0xfb0>
c0004c28:	07400593          	li	a1,116
c0004c2c:	00004517          	auipc	a0,0x4
c0004c30:	0a450513          	addi	a0,a0,164 # c0008cd0 <commands+0xa80>
c0004c34:	e18fb0ef          	jal	ra,c000024c <__panic>
c0004c38:	00005697          	auipc	a3,0x5
c0004c3c:	0cc68693          	addi	a3,a3,204 # c0009d04 <default_pmm_manager+0x68c>
c0004c40:	00004617          	auipc	a2,0x4
c0004c44:	9f460613          	addi	a2,a2,-1548 # c0008634 <commands+0x3e4>
c0004c48:	18700593          	li	a1,391
c0004c4c:	00005517          	auipc	a0,0x5
c0004c50:	ab050513          	addi	a0,a0,-1360 # c00096fc <default_pmm_manager+0x84>
c0004c54:	df8fb0ef          	jal	ra,c000024c <__panic>

c0004c58 <tlb_invalidate>:
c0004c58:	10458073          	sfence.vm	a1
c0004c5c:	00008067          	ret

c0004c60 <pgdir_alloc_page>:
c0004c60:	fe010113          	addi	sp,sp,-32
c0004c64:	01212823          	sw	s2,16(sp)
c0004c68:	00050913          	mv	s2,a0
c0004c6c:	00100513          	li	a0,1
c0004c70:	00812c23          	sw	s0,24(sp)
c0004c74:	00912a23          	sw	s1,20(sp)
c0004c78:	01312623          	sw	s3,12(sp)
c0004c7c:	00112e23          	sw	ra,28(sp)
c0004c80:	00058493          	mv	s1,a1
c0004c84:	00060993          	mv	s3,a2
c0004c88:	c44ff0ef          	jal	ra,c00040cc <alloc_pages>
c0004c8c:	00050413          	mv	s0,a0
c0004c90:	04050a63          	beqz	a0,c0004ce4 <pgdir_alloc_page+0x84>
c0004c94:	00050593          	mv	a1,a0
c0004c98:	00098693          	mv	a3,s3
c0004c9c:	00048613          	mv	a2,s1
c0004ca0:	00090513          	mv	a0,s2
c0004ca4:	bedff0ef          	jal	ra,c0004890 <page_insert>
c0004ca8:	06051e63          	bnez	a0,c0004d24 <pgdir_alloc_page+0xc4>
c0004cac:	00031797          	auipc	a5,0x31
c0004cb0:	1907a783          	lw	a5,400(a5) # c0035e3c <swap_init_ok>
c0004cb4:	02078863          	beqz	a5,c0004ce4 <pgdir_alloc_page+0x84>
c0004cb8:	00031517          	auipc	a0,0x31
c0004cbc:	1a852503          	lw	a0,424(a0) # c0035e60 <check_mm_struct>
c0004cc0:	02050263          	beqz	a0,c0004ce4 <pgdir_alloc_page+0x84>
c0004cc4:	00000693          	li	a3,0
c0004cc8:	00040613          	mv	a2,s0
c0004ccc:	00048593          	mv	a1,s1
c0004cd0:	b80fe0ef          	jal	ra,c0003050 <swap_map_swappable>
c0004cd4:	00042703          	lw	a4,0(s0)
c0004cd8:	00942e23          	sw	s1,28(s0)
c0004cdc:	00100793          	li	a5,1
c0004ce0:	02f71263          	bne	a4,a5,c0004d04 <pgdir_alloc_page+0xa4>
c0004ce4:	01c12083          	lw	ra,28(sp)
c0004ce8:	00040513          	mv	a0,s0
c0004cec:	01412483          	lw	s1,20(sp)
c0004cf0:	01812403          	lw	s0,24(sp)
c0004cf4:	01012903          	lw	s2,16(sp)
c0004cf8:	00c12983          	lw	s3,12(sp)
c0004cfc:	02010113          	addi	sp,sp,32
c0004d00:	00008067          	ret
c0004d04:	00005697          	auipc	a3,0x5
c0004d08:	a0868693          	addi	a3,a3,-1528 # c000970c <default_pmm_manager+0x94>
c0004d0c:	00004617          	auipc	a2,0x4
c0004d10:	92860613          	addi	a2,a2,-1752 # c0008634 <commands+0x3e4>
c0004d14:	1f600593          	li	a1,502
c0004d18:	00005517          	auipc	a0,0x5
c0004d1c:	9e450513          	addi	a0,a0,-1564 # c00096fc <default_pmm_manager+0x84>
c0004d20:	d2cfb0ef          	jal	ra,c000024c <__panic>
c0004d24:	00040513          	mv	a0,s0
c0004d28:	00100593          	li	a1,1
c0004d2c:	c54ff0ef          	jal	ra,c0004180 <free_pages>
c0004d30:	00000413          	li	s0,0
c0004d34:	fb1ff06f          	j	c0004ce4 <pgdir_alloc_page+0x84>

c0004d38 <print_pgdir>:
c0004d38:	fa010113          	addi	sp,sp,-96
c0004d3c:	00005517          	auipc	a0,0x5
c0004d40:	f1c50513          	addi	a0,a0,-228 # c0009c58 <default_pmm_manager+0x5e0>
c0004d44:	05212823          	sw	s2,80(sp)
c0004d48:	04112e23          	sw	ra,92(sp)
c0004d4c:	04812c23          	sw	s0,88(sp)
c0004d50:	04912a23          	sw	s1,84(sp)
c0004d54:	05312623          	sw	s3,76(sp)
c0004d58:	05412423          	sw	s4,72(sp)
c0004d5c:	05512223          	sw	s5,68(sp)
c0004d60:	05612023          	sw	s6,64(sp)
c0004d64:	03712e23          	sw	s7,60(sp)
c0004d68:	03812c23          	sw	s8,56(sp)
c0004d6c:	03912a23          	sw	s9,52(sp)
c0004d70:	03a12823          	sw	s10,48(sp)
c0004d74:	03b12623          	sw	s11,44(sp)
c0004d78:	b60fb0ef          	jal	ra,c00000d8 <cprintf>
c0004d7c:	00000593          	li	a1,0
c0004d80:	00012a23          	sw	zero,20(sp)
c0004d84:	02d00913          	li	s2,45
c0004d88:	01410713          	addi	a4,sp,20
c0004d8c:	01010693          	addi	a3,sp,16
c0004d90:	fafec637          	lui	a2,0xfafec
c0004d94:	40000513          	li	a0,1024
c0004d98:	a68ff0ef          	jal	ra,c0004000 <get_pgtable_items.isra.4.part.5>
c0004d9c:	00050413          	mv	s0,a0
c0004da0:	08050263          	beqz	a0,c0004e24 <print_pgdir+0xec>
c0004da4:	01412583          	lw	a1,20(sp)
c0004da8:	01012783          	lw	a5,16(sp)
c0004dac:	01047513          	andi	a0,s0,16
c0004db0:	01659693          	slli	a3,a1,0x16
c0004db4:	40f585b3          	sub	a1,a1,a5
c0004db8:	01679613          	slli	a2,a5,0x16
c0004dbc:	01659713          	slli	a4,a1,0x16
c0004dc0:	00090313          	mv	t1,s2
c0004dc4:	00050463          	beqz	a0,c0004dcc <print_pgdir+0x94>
c0004dc8:	07500313          	li	t1,117
c0004dcc:	00031b17          	auipc	s6,0x31
c0004dd0:	07cb0b13          	addi	s6,s6,124 # c0035e48 <str.1851>
c0004dd4:	07200793          	li	a5,114
c0004dd8:	006b0023          	sb	t1,0(s6)
c0004ddc:	00fb00a3          	sb	a5,1(s6)
c0004de0:	00447793          	andi	a5,s0,4
c0004de4:	00090313          	mv	t1,s2
c0004de8:	00078463          	beqz	a5,c0004df0 <print_pgdir+0xb8>
c0004dec:	07700313          	li	t1,119
c0004df0:	00031797          	auipc	a5,0x31
c0004df4:	05878793          	addi	a5,a5,88 # c0035e48 <str.1851>
c0004df8:	00005517          	auipc	a0,0x5
c0004dfc:	e9450513          	addi	a0,a0,-364 # c0009c8c <default_pmm_manager+0x614>
c0004e00:	006b0123          	sb	t1,2(s6)
c0004e04:	000b01a3          	sb	zero,3(s6)
c0004e08:	ad0fb0ef          	jal	ra,c00000d8 <cprintf>
c0004e0c:	00f47413          	andi	s0,s0,15
c0004e10:	00100793          	li	a5,1
c0004e14:	04f40c63          	beq	s0,a5,c0004e6c <print_pgdir+0x134>
c0004e18:	01412583          	lw	a1,20(sp)
c0004e1c:	3ff00793          	li	a5,1023
c0004e20:	f6b7f4e3          	bleu	a1,a5,c0004d88 <print_pgdir+0x50>
c0004e24:	00005517          	auipc	a0,0x5
c0004e28:	eac50513          	addi	a0,a0,-340 # c0009cd0 <default_pmm_manager+0x658>
c0004e2c:	aacfb0ef          	jal	ra,c00000d8 <cprintf>
c0004e30:	05c12083          	lw	ra,92(sp)
c0004e34:	05812403          	lw	s0,88(sp)
c0004e38:	05412483          	lw	s1,84(sp)
c0004e3c:	05012903          	lw	s2,80(sp)
c0004e40:	04c12983          	lw	s3,76(sp)
c0004e44:	04812a03          	lw	s4,72(sp)
c0004e48:	04412a83          	lw	s5,68(sp)
c0004e4c:	04012b03          	lw	s6,64(sp)
c0004e50:	03c12b83          	lw	s7,60(sp)
c0004e54:	03812c03          	lw	s8,56(sp)
c0004e58:	03412c83          	lw	s9,52(sp)
c0004e5c:	03012d03          	lw	s10,48(sp)
c0004e60:	02c12d83          	lw	s11,44(sp)
c0004e64:	06010113          	addi	sp,sp,96
c0004e68:	00008067          	ret
c0004e6c:	01012783          	lw	a5,16(sp)
c0004e70:	00000413          	li	s0,0
c0004e74:	00a79c93          	slli	s9,a5,0xa
c0004e78:	00c79313          	slli	t1,a5,0xc
c0004e7c:	00279d93          	slli	s11,a5,0x2
c0004e80:	00f12623          	sw	a5,12(sp)
c0004e84:	fafec7b7          	lui	a5,0xfafec
c0004e88:	01912e23          	sw	s9,28(sp)
c0004e8c:	40600ab3          	neg	s5,t1
c0004e90:	400c8c93          	addi	s9,s9,1024 # fff80400 <sbi_remote_fence_i+0xfff80b10>
c0004e94:	00fd8db3          	add	s11,s11,a5
c0004e98:	0140006f          	j	c0004eac <print_pgdir+0x174>
c0004e9c:	fffff7b7          	lui	a5,0xfffff
c0004ea0:	00fa8ab3          	add	s5,s5,a5
c0004ea4:	400c8c93          	addi	s9,s9,1024
c0004ea8:	004d8d93          	addi	s11,s11,4
c0004eac:	01412583          	lw	a1,20(sp)
c0004eb0:	00c12783          	lw	a5,12(sp)
c0004eb4:	10b7fa63          	bleu	a1,a5,c0004fc8 <print_pgdir+0x290>
c0004eb8:	00178793          	addi	a5,a5,1 # fffff001 <sbi_remote_fence_i+0xfffff711>
c0004ebc:	00f12623          	sw	a5,12(sp)
c0004ec0:	000da783          	lw	a5,0(s11)
c0004ec4:	fffff4b7          	lui	s1,0xfffff
c0004ec8:	00031717          	auipc	a4,0x31
c0004ecc:	f7c72703          	lw	a4,-132(a4) # c0035e44 <npage>
c0004ed0:	00279793          	slli	a5,a5,0x2
c0004ed4:	0097f7b3          	and	a5,a5,s1
c0004ed8:	00c7d693          	srli	a3,a5,0xc
c0004edc:	01c12583          	lw	a1,28(sp)
c0004ee0:	07700a13          	li	s4,119
c0004ee4:	00031997          	auipc	s3,0x31
c0004ee8:	f6498993          	addi	s3,s3,-156 # c0035e48 <str.1851>
c0004eec:	0ae6fc63          	bleu	a4,a3,c0004fa4 <print_pgdir+0x26c>
c0004ef0:	fb95f6e3          	bleu	s9,a1,c0004e9c <print_pgdir+0x164>
c0004ef4:	00031697          	auipc	a3,0x31
c0004ef8:	0246a683          	lw	a3,36(a3) # c0035f18 <va_pa_offset>
c0004efc:	00d787b3          	add	a5,a5,a3
c0004f00:	01c10713          	addi	a4,sp,28
c0004f04:	01810693          	addi	a3,sp,24
c0004f08:	01578633          	add	a2,a5,s5
c0004f0c:	000c8513          	mv	a0,s9
c0004f10:	8f0ff0ef          	jal	ra,c0004000 <get_pgtable_items.isra.4.part.5>
c0004f14:	00050d13          	mv	s10,a0
c0004f18:	f80502e3          	beqz	a0,c0004e9c <print_pgdir+0x164>
c0004f1c:	0aa40263          	beq	s0,a0,c0004fc0 <print_pgdir+0x288>
c0004f20:	04040c63          	beqz	s0,c0004f78 <print_pgdir+0x240>
c0004f24:	417c05b3          	sub	a1,s8,s7
c0004f28:	01047793          	andi	a5,s0,16
c0004f2c:	00cb9613          	slli	a2,s7,0xc
c0004f30:	00cc1693          	slli	a3,s8,0xc
c0004f34:	00c59713          	slli	a4,a1,0xc
c0004f38:	00090513          	mv	a0,s2
c0004f3c:	00078463          	beqz	a5,c0004f44 <print_pgdir+0x20c>
c0004f40:	07500513          	li	a0,117
c0004f44:	07200793          	li	a5,114
c0004f48:	00ab0023          	sb	a0,0(s6)
c0004f4c:	00fb00a3          	sb	a5,1(s6)
c0004f50:	00447413          	andi	s0,s0,4
c0004f54:	000a0e13          	mv	t3,s4
c0004f58:	00041463          	bnez	s0,c0004f60 <print_pgdir+0x228>
c0004f5c:	00090e13          	mv	t3,s2
c0004f60:	00098793          	mv	a5,s3
c0004f64:	00005517          	auipc	a0,0x5
c0004f68:	d4850513          	addi	a0,a0,-696 # c0009cac <default_pmm_manager+0x634>
c0004f6c:	01cb0123          	sb	t3,2(s6)
c0004f70:	000b01a3          	sb	zero,3(s6)
c0004f74:	964fb0ef          	jal	ra,c00000d8 <cprintf>
c0004f78:	01812b83          	lw	s7,24(sp)
c0004f7c:	01c12c03          	lw	s8,28(sp)
c0004f80:	000da783          	lw	a5,0(s11)
c0004f84:	00031717          	auipc	a4,0x31
c0004f88:	ec072703          	lw	a4,-320(a4) # c0035e44 <npage>
c0004f8c:	000c0593          	mv	a1,s8
c0004f90:	00279793          	slli	a5,a5,0x2
c0004f94:	0097f7b3          	and	a5,a5,s1
c0004f98:	00c7d693          	srli	a3,a5,0xc
c0004f9c:	000d0413          	mv	s0,s10
c0004fa0:	f4e6e8e3          	bltu	a3,a4,c0004ef0 <print_pgdir+0x1b8>
c0004fa4:	00078693          	mv	a3,a5
c0004fa8:	00004617          	auipc	a2,0x4
c0004fac:	f7060613          	addi	a2,a2,-144 # c0008f18 <commands+0xcc8>
c0004fb0:	2a900593          	li	a1,681
c0004fb4:	00004517          	auipc	a0,0x4
c0004fb8:	74850513          	addi	a0,a0,1864 # c00096fc <default_pmm_manager+0x84>
c0004fbc:	a90fb0ef          	jal	ra,c000024c <__panic>
c0004fc0:	01c12c03          	lw	s8,28(sp)
c0004fc4:	fbdff06f          	j	c0004f80 <print_pgdir+0x248>
c0004fc8:	e4040ae3          	beqz	s0,c0004e1c <print_pgdir+0xe4>
c0004fcc:	417c05b3          	sub	a1,s8,s7
c0004fd0:	01047793          	andi	a5,s0,16
c0004fd4:	00cb9613          	slli	a2,s7,0xc
c0004fd8:	00cc1693          	slli	a3,s8,0xc
c0004fdc:	00c59713          	slli	a4,a1,0xc
c0004fe0:	00090513          	mv	a0,s2
c0004fe4:	00078463          	beqz	a5,c0004fec <print_pgdir+0x2b4>
c0004fe8:	07500513          	li	a0,117
c0004fec:	07200793          	li	a5,114
c0004ff0:	00ab0023          	sb	a0,0(s6)
c0004ff4:	00fb00a3          	sb	a5,1(s6)
c0004ff8:	00447413          	andi	s0,s0,4
c0004ffc:	00090313          	mv	t1,s2
c0005000:	00040463          	beqz	s0,c0005008 <print_pgdir+0x2d0>
c0005004:	07700313          	li	t1,119
c0005008:	00031797          	auipc	a5,0x31
c000500c:	e4078793          	addi	a5,a5,-448 # c0035e48 <str.1851>
c0005010:	00005517          	auipc	a0,0x5
c0005014:	c9c50513          	addi	a0,a0,-868 # c0009cac <default_pmm_manager+0x634>
c0005018:	006b0123          	sb	t1,2(s6)
c000501c:	000b01a3          	sb	zero,3(s6)
c0005020:	8b8fb0ef          	jal	ra,c00000d8 <cprintf>
c0005024:	df5ff06f          	j	c0004e18 <print_pgdir+0xe0>

c0005028 <pmm_init>:
c0005028:	fe010113          	addi	sp,sp,-32
c000502c:	00004597          	auipc	a1,0x4
c0005030:	64c5a583          	lw	a1,1612(a1) # c0009678 <default_pmm_manager>
c0005034:	00004797          	auipc	a5,0x4
c0005038:	64478793          	addi	a5,a5,1604 # c0009678 <default_pmm_manager>
c000503c:	00004517          	auipc	a0,0x4
c0005040:	6e450513          	addi	a0,a0,1764 # c0009720 <default_pmm_manager+0xa8>
c0005044:	00112e23          	sw	ra,28(sp)
c0005048:	00812c23          	sw	s0,24(sp)
c000504c:	00912a23          	sw	s1,20(sp)
c0005050:	01212823          	sw	s2,16(sp)
c0005054:	00031297          	auipc	t0,0x31
c0005058:	ecf2a023          	sw	a5,-320(t0) # c0035f14 <pmm_manager>
c000505c:	87cfb0ef          	jal	ra,c00000d8 <cprintf>
c0005060:	00031797          	auipc	a5,0x31
c0005064:	eb47a783          	lw	a5,-332(a5) # c0035f14 <pmm_manager>
c0005068:	0047a783          	lw	a5,4(a5)
c000506c:	000780e7          	jalr	a5
c0005070:	3fffa317          	auipc	t1,0x3fffa
c0005074:	790300e7          	jalr	1936(t1) # fffff800 <sbi_hart_id>
c0005078:	00410593          	addi	a1,sp,4
c000507c:	3fffa317          	auipc	t1,0x3fffa
c0005080:	7a4300e7          	jalr	1956(t1) # fffff820 <sbi_query_memory>
c0005084:	32051ce3          	bnez	a0,c0005bbc <pmm_init+0xb94>
c0005088:	00412483          	lw	s1,4(sp)
c000508c:	00812903          	lw	s2,8(sp)
c0005090:	c00007b7          	lui	a5,0xc0000
c0005094:	409787b3          	sub	a5,a5,s1
c0005098:	00004517          	auipc	a0,0x4
c000509c:	6cc50513          	addi	a0,a0,1740 # c0009764 <default_pmm_manager+0xec>
c00050a0:	00031297          	auipc	t0,0x31
c00050a4:	e6f2ac23          	sw	a5,-392(t0) # c0035f18 <va_pa_offset>
c00050a8:	01248433          	add	s0,s1,s2
c00050ac:	82cfb0ef          	jal	ra,c00000d8 <cprintf>
c00050b0:	00048613          	mv	a2,s1
c00050b4:	fff40693          	addi	a3,s0,-1
c00050b8:	00090593          	mv	a1,s2
c00050bc:	00004517          	auipc	a0,0x4
c00050c0:	6c050513          	addi	a0,a0,1728 # c000977c <default_pmm_manager+0x104>
c00050c4:	814fb0ef          	jal	ra,c00000d8 <cprintf>
c00050c8:	f80007b7          	lui	a5,0xf8000
c00050cc:	00040613          	mv	a2,s0
c00050d0:	0087f463          	bleu	s0,a5,c00050d8 <pmm_init+0xb0>
c00050d4:	00078613          	mv	a2,a5
c00050d8:	00c65613          	srli	a2,a2,0xc
c00050dc:	00031297          	auipc	t0,0x31
c00050e0:	d6c2a423          	sw	a2,-664(t0) # c0035e44 <npage>
c00050e4:	180027f3          	csrr	a5,sptbr
c00050e8:	00100737          	lui	a4,0x100
c00050ec:	fff70713          	addi	a4,a4,-1 # fffff <_binary_obj___user_exit_out_size+0xfd9a3>
c00050f0:	00e7f733          	and	a4,a5,a4
c00050f4:	00c79793          	slli	a5,a5,0xc
c00050f8:	3ec77ae3          	bleu	a2,a4,c0005cec <pmm_init+0xcc4>
c00050fc:	00031317          	auipc	t1,0x31
c0005100:	e1c32303          	lw	t1,-484(t1) # c0035f18 <va_pa_offset>
c0005104:	00002737          	lui	a4,0x2
c0005108:	006787b3          	add	a5,a5,t1
c000510c:	00e787b3          	add	a5,a5,a4
c0005110:	00001737          	lui	a4,0x1
c0005114:	fff70713          	addi	a4,a4,-1 # fff <_binary_obj___user_faultread_out_size-0xf69>
c0005118:	00e787b3          	add	a5,a5,a4
c000511c:	fffff737          	lui	a4,0xfffff
c0005120:	00e7f7b3          	and	a5,a5,a4
c0005124:	00031297          	auipc	t0,0x31
c0005128:	def2ae23          	sw	a5,-516(t0) # c0035f20 <pages>
c000512c:	000805b7          	lui	a1,0x80
c0005130:	68b60463          	beq	a2,a1,c00057b8 <pmm_init+0x790>
c0005134:	00031817          	auipc	a6,0x31
c0005138:	d1082803          	lw	a6,-752(a6) # c0035e44 <npage>
c000513c:	00000713          	li	a4,0
c0005140:	00078513          	mv	a0,a5
c0005144:	00100893          	li	a7,1
c0005148:	40b805b3          	sub	a1,a6,a1
c000514c:	0080006f          	j	c0005154 <pmm_init+0x12c>
c0005150:	00050793          	mv	a5,a0
c0005154:	00571693          	slli	a3,a4,0x5
c0005158:	00d787b3          	add	a5,a5,a3
c000515c:	00478793          	addi	a5,a5,4 # f8000004 <sbi_remote_fence_i+0xf8000714>
c0005160:	4117a02f          	amoor.w	zero,a7,(a5)
c0005164:	00170713          	addi	a4,a4,1 # fffff001 <sbi_remote_fence_i+0xfffff711>
c0005168:	00080613          	mv	a2,a6
c000516c:	feb762e3          	bltu	a4,a1,c0005150 <pmm_init+0x128>
c0005170:	07f806b7          	lui	a3,0x7f80
c0005174:	00d606b3          	add	a3,a2,a3
c0005178:	00569693          	slli	a3,a3,0x5
c000517c:	00d506b3          	add	a3,a0,a3
c0005180:	c00007b7          	lui	a5,0xc0000
c0005184:	3af6e2e3          	bltu	a3,a5,c0005d28 <pmm_init+0xd00>
c0005188:	fffff737          	lui	a4,0xfffff
c000518c:	406686b3          	sub	a3,a3,t1
c0005190:	00e47433          	and	s0,s0,a4
c0005194:	0486f263          	bleu	s0,a3,c00051d8 <pmm_init+0x1b0>
c0005198:	000017b7          	lui	a5,0x1
c000519c:	fff78793          	addi	a5,a5,-1 # fff <_binary_obj___user_faultread_out_size-0xf69>
c00051a0:	00f686b3          	add	a3,a3,a5
c00051a4:	00c6d793          	srli	a5,a3,0xc
c00051a8:	10c7f2e3          	bleu	a2,a5,c0005aac <pmm_init+0xa84>
c00051ac:	00e6f6b3          	and	a3,a3,a4
c00051b0:	fff80737          	lui	a4,0xfff80
c00051b4:	00e787b3          	add	a5,a5,a4
c00051b8:	00031717          	auipc	a4,0x31
c00051bc:	d5c72703          	lw	a4,-676(a4) # c0035f14 <pmm_manager>
c00051c0:	00872703          	lw	a4,8(a4)
c00051c4:	40d406b3          	sub	a3,s0,a3
c00051c8:	00579793          	slli	a5,a5,0x5
c00051cc:	00c6d593          	srli	a1,a3,0xc
c00051d0:	00f50533          	add	a0,a0,a5
c00051d4:	000700e7          	jalr	a4
c00051d8:	00031797          	auipc	a5,0x31
c00051dc:	d3c7a783          	lw	a5,-708(a5) # c0035f14 <pmm_manager>
c00051e0:	0187a783          	lw	a5,24(a5)
c00051e4:	000780e7          	jalr	a5
c00051e8:	00004517          	auipc	a0,0x4
c00051ec:	5bc50513          	addi	a0,a0,1468 # c00097a4 <default_pmm_manager+0x12c>
c00051f0:	ee9fa0ef          	jal	ra,c00000d8 <cprintf>
c00051f4:	00100513          	li	a0,1
c00051f8:	ed5fe0ef          	jal	ra,c00040cc <alloc_pages>
c00051fc:	08050ce3          	beqz	a0,c0005a94 <pmm_init+0xa6c>
c0005200:	00031797          	auipc	a5,0x31
c0005204:	d207a783          	lw	a5,-736(a5) # c0035f20 <pages>
c0005208:	40f507b3          	sub	a5,a0,a5
c000520c:	00080737          	lui	a4,0x80
c0005210:	4057d793          	srai	a5,a5,0x5
c0005214:	00e787b3          	add	a5,a5,a4
c0005218:	00100737          	lui	a4,0x100
c000521c:	fff70713          	addi	a4,a4,-1 # fffff <_binary_obj___user_exit_out_size+0xfd9a3>
c0005220:	00e7f733          	and	a4,a5,a4
c0005224:	00031697          	auipc	a3,0x31
c0005228:	c206a683          	lw	a3,-992(a3) # c0035e44 <npage>
c000522c:	00c79793          	slli	a5,a5,0xc
c0005230:	7cd77463          	bleu	a3,a4,c00059f8 <pmm_init+0x9d0>
c0005234:	00031717          	auipc	a4,0x31
c0005238:	ce472703          	lw	a4,-796(a4) # c0035f18 <va_pa_offset>
c000523c:	00e787b3          	add	a5,a5,a4
c0005240:	00078513          	mv	a0,a5
c0005244:	00001637          	lui	a2,0x1
c0005248:	00000593          	li	a1,0
c000524c:	00031297          	auipc	t0,0x31
c0005250:	bef2aa23          	sw	a5,-1036(t0) # c0035e40 <boot_pgdir>
c0005254:	069020ef          	jal	ra,c0007abc <memset>
c0005258:	00031517          	auipc	a0,0x31
c000525c:	be852503          	lw	a0,-1048(a0) # c0035e40 <boot_pgdir>
c0005260:	c00007b7          	lui	a5,0xc0000
c0005264:	76f56c63          	bltu	a0,a5,c00059dc <pmm_init+0x9b4>
c0005268:	00031797          	auipc	a5,0x31
c000526c:	cb07a783          	lw	a5,-848(a5) # c0035f18 <va_pa_offset>
c0005270:	40f507b3          	sub	a5,a0,a5
c0005274:	00031297          	auipc	t0,0x31
c0005278:	caf2a423          	sw	a5,-856(t0) # c0035f1c <boot_cr3>
c000527c:	00031717          	auipc	a4,0x31
c0005280:	bc872703          	lw	a4,-1080(a4) # c0035e44 <npage>
c0005284:	000f87b7          	lui	a5,0xf8
c0005288:	7ee7e663          	bltu	a5,a4,c0005a74 <pmm_init+0xa4c>
c000528c:	7c050463          	beqz	a0,c0005a54 <pmm_init+0xa2c>
c0005290:	01451793          	slli	a5,a0,0x14
c0005294:	7c079063          	bnez	a5,c0005a54 <pmm_init+0xa2c>
c0005298:	00000613          	li	a2,0
c000529c:	00000593          	li	a1,0
c00052a0:	a0cff0ef          	jal	ra,c00044ac <get_page>
c00052a4:	78051863          	bnez	a0,c0005a34 <pmm_init+0xa0c>
c00052a8:	00100513          	li	a0,1
c00052ac:	e21fe0ef          	jal	ra,c00040cc <alloc_pages>
c00052b0:	00050493          	mv	s1,a0
c00052b4:	00050593          	mv	a1,a0
c00052b8:	00000693          	li	a3,0
c00052bc:	00000613          	li	a2,0
c00052c0:	00031517          	auipc	a0,0x31
c00052c4:	b8052503          	lw	a0,-1152(a0) # c0035e40 <boot_pgdir>
c00052c8:	dc8ff0ef          	jal	ra,c0004890 <page_insert>
c00052cc:	74051463          	bnez	a0,c0005a14 <pmm_init+0x9ec>
c00052d0:	00000613          	li	a2,0
c00052d4:	00000593          	li	a1,0
c00052d8:	00031517          	auipc	a0,0x31
c00052dc:	b6852503          	lw	a0,-1176(a0) # c0035e40 <boot_pgdir>
c00052e0:	f5dfe0ef          	jal	ra,c000423c <get_pte>
c00052e4:	04050ee3          	beqz	a0,c0005b40 <pmm_init+0xb18>
c00052e8:	00052783          	lw	a5,0(a0)
c00052ec:	0017f713          	andi	a4,a5,1
c00052f0:	02070ce3          	beqz	a4,c0005b28 <pmm_init+0xb00>
c00052f4:	00279793          	slli	a5,a5,0x2
c00052f8:	00c7d793          	srli	a5,a5,0xc
c00052fc:	00031617          	auipc	a2,0x31
c0005300:	b4862603          	lw	a2,-1208(a2) # c0035e44 <npage>
c0005304:	7ac7f463          	bleu	a2,a5,c0005aac <pmm_init+0xa84>
c0005308:	fff80737          	lui	a4,0xfff80
c000530c:	00e787b3          	add	a5,a5,a4
c0005310:	00579793          	slli	a5,a5,0x5
c0005314:	00031717          	auipc	a4,0x31
c0005318:	c0c72703          	lw	a4,-1012(a4) # c0035f20 <pages>
c000531c:	00f707b3          	add	a5,a4,a5
c0005320:	7ef49463          	bne	s1,a5,c0005b08 <pmm_init+0xae0>
c0005324:	0004a903          	lw	s2,0(s1) # fffff000 <sbi_remote_fence_i+0xfffff710>
c0005328:	00100793          	li	a5,1
c000532c:	7af91e63          	bne	s2,a5,c0005ae8 <pmm_init+0xac0>
c0005330:	00031517          	auipc	a0,0x31
c0005334:	b1052503          	lw	a0,-1264(a0) # c0035e40 <boot_pgdir>
c0005338:	00052683          	lw	a3,0(a0)
c000533c:	fffff7b7          	lui	a5,0xfffff
c0005340:	00269693          	slli	a3,a3,0x2
c0005344:	00f6f6b3          	and	a3,a3,a5
c0005348:	00c6d793          	srli	a5,a3,0xc
c000534c:	78c7f263          	bleu	a2,a5,c0005ad0 <pmm_init+0xaa8>
c0005350:	00031417          	auipc	s0,0x31
c0005354:	bc842403          	lw	s0,-1080(s0) # c0035f18 <va_pa_offset>
c0005358:	008686b3          	add	a3,a3,s0
c000535c:	00000613          	li	a2,0
c0005360:	000015b7          	lui	a1,0x1
c0005364:	00468413          	addi	s0,a3,4
c0005368:	ed5fe0ef          	jal	ra,c000423c <get_pte>
c000536c:	74a41263          	bne	s0,a0,c0005ab0 <pmm_init+0xa88>
c0005370:	00090513          	mv	a0,s2
c0005374:	d59fe0ef          	jal	ra,c00040cc <alloc_pages>
c0005378:	00050413          	mv	s0,a0
c000537c:	00050593          	mv	a1,a0
c0005380:	01400693          	li	a3,20
c0005384:	00001637          	lui	a2,0x1
c0005388:	00031517          	auipc	a0,0x31
c000538c:	ab852503          	lw	a0,-1352(a0) # c0035e40 <boot_pgdir>
c0005390:	d00ff0ef          	jal	ra,c0004890 <page_insert>
c0005394:	7e051663          	bnez	a0,c0005b80 <pmm_init+0xb58>
c0005398:	00000613          	li	a2,0
c000539c:	000015b7          	lui	a1,0x1
c00053a0:	00031517          	auipc	a0,0x31
c00053a4:	aa052503          	lw	a0,-1376(a0) # c0035e40 <boot_pgdir>
c00053a8:	e95fe0ef          	jal	ra,c000423c <get_pte>
c00053ac:	7a050a63          	beqz	a0,c0005b60 <pmm_init+0xb38>
c00053b0:	00052783          	lw	a5,0(a0)
c00053b4:	0107f713          	andi	a4,a5,16
c00053b8:	5c070263          	beqz	a4,c000597c <pmm_init+0x954>
c00053bc:	0047f793          	andi	a5,a5,4
c00053c0:	58078e63          	beqz	a5,c000595c <pmm_init+0x934>
c00053c4:	00031517          	auipc	a0,0x31
c00053c8:	a7c52503          	lw	a0,-1412(a0) # c0035e40 <boot_pgdir>
c00053cc:	00052783          	lw	a5,0(a0)
c00053d0:	0107f793          	andi	a5,a5,16
c00053d4:	56078463          	beqz	a5,c000593c <pmm_init+0x914>
c00053d8:	00042903          	lw	s2,0(s0)
c00053dc:	00100793          	li	a5,1
c00053e0:	52f91e63          	bne	s2,a5,c000591c <pmm_init+0x8f4>
c00053e4:	00000693          	li	a3,0
c00053e8:	00001637          	lui	a2,0x1
c00053ec:	00048593          	mv	a1,s1
c00053f0:	ca0ff0ef          	jal	ra,c0004890 <page_insert>
c00053f4:	50051463          	bnez	a0,c00058fc <pmm_init+0x8d4>
c00053f8:	0004a703          	lw	a4,0(s1)
c00053fc:	00200793          	li	a5,2
c0005400:	4cf71e63          	bne	a4,a5,c00058dc <pmm_init+0x8b4>
c0005404:	00042783          	lw	a5,0(s0)
c0005408:	4a079a63          	bnez	a5,c00058bc <pmm_init+0x894>
c000540c:	00000613          	li	a2,0
c0005410:	000015b7          	lui	a1,0x1
c0005414:	00031517          	auipc	a0,0x31
c0005418:	a2c52503          	lw	a0,-1492(a0) # c0035e40 <boot_pgdir>
c000541c:	e21fe0ef          	jal	ra,c000423c <get_pte>
c0005420:	46050e63          	beqz	a0,c000589c <pmm_init+0x874>
c0005424:	00052703          	lw	a4,0(a0)
c0005428:	00177793          	andi	a5,a4,1
c000542c:	6e078e63          	beqz	a5,c0005b28 <pmm_init+0xb00>
c0005430:	00271793          	slli	a5,a4,0x2
c0005434:	00c7d793          	srli	a5,a5,0xc
c0005438:	00031697          	auipc	a3,0x31
c000543c:	a0c6a683          	lw	a3,-1524(a3) # c0035e44 <npage>
c0005440:	66d7f663          	bleu	a3,a5,c0005aac <pmm_init+0xa84>
c0005444:	fff806b7          	lui	a3,0xfff80
c0005448:	00d787b3          	add	a5,a5,a3
c000544c:	00579793          	slli	a5,a5,0x5
c0005450:	00031697          	auipc	a3,0x31
c0005454:	ad06a683          	lw	a3,-1328(a3) # c0035f20 <pages>
c0005458:	00f687b3          	add	a5,a3,a5
c000545c:	42f49063          	bne	s1,a5,c000587c <pmm_init+0x854>
c0005460:	01077713          	andi	a4,a4,16
c0005464:	3e071c63          	bnez	a4,c000585c <pmm_init+0x834>
c0005468:	00000593          	li	a1,0
c000546c:	00031517          	auipc	a0,0x31
c0005470:	9d452503          	lw	a0,-1580(a0) # c0035e40 <boot_pgdir>
c0005474:	b70ff0ef          	jal	ra,c00047e4 <page_remove>
c0005478:	0004a783          	lw	a5,0(s1)
c000547c:	3d279063          	bne	a5,s2,c000583c <pmm_init+0x814>
c0005480:	00042783          	lw	a5,0(s0)
c0005484:	38079c63          	bnez	a5,c000581c <pmm_init+0x7f4>
c0005488:	000015b7          	lui	a1,0x1
c000548c:	00031517          	auipc	a0,0x31
c0005490:	9b452503          	lw	a0,-1612(a0) # c0035e40 <boot_pgdir>
c0005494:	b50ff0ef          	jal	ra,c00047e4 <page_remove>
c0005498:	0004a783          	lw	a5,0(s1)
c000549c:	52079063          	bnez	a5,c00059bc <pmm_init+0x994>
c00054a0:	00042783          	lw	a5,0(s0)
c00054a4:	4e079c63          	bnez	a5,c000599c <pmm_init+0x974>
c00054a8:	00031797          	auipc	a5,0x31
c00054ac:	9987a783          	lw	a5,-1640(a5) # c0035e40 <boot_pgdir>
c00054b0:	0007a783          	lw	a5,0(a5)
c00054b4:	00031717          	auipc	a4,0x31
c00054b8:	99072703          	lw	a4,-1648(a4) # c0035e44 <npage>
c00054bc:	00279793          	slli	a5,a5,0x2
c00054c0:	00c7d793          	srli	a5,a5,0xc
c00054c4:	5ee7f463          	bleu	a4,a5,c0005aac <pmm_init+0xa84>
c00054c8:	fff80737          	lui	a4,0xfff80
c00054cc:	00e787b3          	add	a5,a5,a4
c00054d0:	00579793          	slli	a5,a5,0x5
c00054d4:	00031517          	auipc	a0,0x31
c00054d8:	a4c52503          	lw	a0,-1460(a0) # c0035f20 <pages>
c00054dc:	00f50533          	add	a0,a0,a5
c00054e0:	00052583          	lw	a1,0(a0)
c00054e4:	00100793          	li	a5,1
c00054e8:	78f59263          	bne	a1,a5,c0005c6c <pmm_init+0xc44>
c00054ec:	c95fe0ef          	jal	ra,c0004180 <free_pages>
c00054f0:	00031797          	auipc	a5,0x31
c00054f4:	9507a783          	lw	a5,-1712(a5) # c0035e40 <boot_pgdir>
c00054f8:	0007a023          	sw	zero,0(a5)
c00054fc:	00004517          	auipc	a0,0x4
c0005500:	56c50513          	addi	a0,a0,1388 # c0009a68 <default_pmm_manager+0x3f0>
c0005504:	bd5fa0ef          	jal	ra,c00000d8 <cprintf>
c0005508:	00031797          	auipc	a5,0x31
c000550c:	a147a783          	lw	a5,-1516(a5) # c0035f1c <boot_cr3>
c0005510:	00c7d793          	srli	a5,a5,0xc
c0005514:	00031517          	auipc	a0,0x31
c0005518:	92c52503          	lw	a0,-1748(a0) # c0035e40 <boot_pgdir>
c000551c:	00a79793          	slli	a5,a5,0xa
c0005520:	00001437          	lui	s0,0x1
c0005524:	00850733          	add	a4,a0,s0
c0005528:	0017e693          	ori	a3,a5,1
c000552c:	c00005b7          	lui	a1,0xc0000
c0005530:	0077e793          	ori	a5,a5,7
c0005534:	fad72623          	sw	a3,-84(a4) # fff7ffac <sbi_remote_fence_i+0xfff806bc>
c0005538:	00031697          	auipc	a3,0x31
c000553c:	9e06a683          	lw	a3,-1568(a3) # c0035f18 <va_pa_offset>
c0005540:	faf72823          	sw	a5,-80(a4)
c0005544:	40d586b3          	sub	a3,a1,a3
c0005548:	00f00713          	li	a4,15
c000554c:	38000637          	lui	a2,0x38000
c0005550:	e51fe0ef          	jal	ra,c00043a0 <boot_map_segment>
c0005554:	180027f3          	csrr	a5,sptbr
c0005558:	00100737          	lui	a4,0x100
c000555c:	fff70713          	addi	a4,a4,-1 # fffff <_binary_obj___user_exit_out_size+0xfd9a3>
c0005560:	00e7f733          	and	a4,a5,a4
c0005564:	00031697          	auipc	a3,0x31
c0005568:	8e06a683          	lw	a3,-1824(a3) # c0035e44 <npage>
c000556c:	00c79793          	slli	a5,a5,0xc
c0005570:	62d77863          	bleu	a3,a4,c0005ba0 <pmm_init+0xb78>
c0005574:	00031517          	auipc	a0,0x31
c0005578:	9a452503          	lw	a0,-1628(a0) # c0035f18 <va_pa_offset>
c000557c:	00a78533          	add	a0,a5,a0
c0005580:	00000613          	li	a2,0
c0005584:	fff00593          	li	a1,-1
c0005588:	cb5fe0ef          	jal	ra,c000423c <get_pte>
c000558c:	00052683          	lw	a3,0(a0)
c0005590:	fffff4b7          	lui	s1,0xfffff
c0005594:	00b00713          	li	a4,11
c0005598:	00269693          	slli	a3,a3,0x2
c000559c:	0096f6b3          	and	a3,a3,s1
c00055a0:	00040613          	mv	a2,s0
c00055a4:	00048593          	mv	a1,s1
c00055a8:	00031517          	auipc	a0,0x31
c00055ac:	89852503          	lw	a0,-1896(a0) # c0035e40 <boot_pgdir>
c00055b0:	df1fe0ef          	jal	ra,c00043a0 <boot_map_segment>
c00055b4:	00031797          	auipc	a5,0x31
c00055b8:	9687a783          	lw	a5,-1688(a5) # c0035f1c <boot_cr3>
c00055bc:	00c7d793          	srli	a5,a5,0xc
c00055c0:	18079073          	csrw	sptbr,a5
c00055c4:	00031797          	auipc	a5,0x31
c00055c8:	8807a783          	lw	a5,-1920(a5) # c0035e44 <npage>
c00055cc:	000c0437          	lui	s0,0xc0
c00055d0:	00031517          	auipc	a0,0x31
c00055d4:	87052503          	lw	a0,-1936(a0) # c0035e40 <boot_pgdir>
c00055d8:	00f46c63          	bltu	s0,a5,c00055f0 <pmm_init+0x5c8>
c00055dc:	04c0006f          	j	c0005628 <pmm_init+0x600>
c00055e0:	00c45793          	srli	a5,s0,0xc
c00055e4:	00031517          	auipc	a0,0x31
c00055e8:	85c52503          	lw	a0,-1956(a0) # c0035e40 <boot_pgdir>
c00055ec:	1ee7fa63          	bleu	a4,a5,c00057e0 <pmm_init+0x7b8>
c00055f0:	00031597          	auipc	a1,0x31
c00055f4:	9285a583          	lw	a1,-1752(a1) # c0035f18 <va_pa_offset>
c00055f8:	00000613          	li	a2,0
c00055fc:	00b405b3          	add	a1,s0,a1
c0005600:	c3dfe0ef          	jal	ra,c000423c <get_pte>
c0005604:	1a050e63          	beqz	a0,c00057c0 <pmm_init+0x798>
c0005608:	00052783          	lw	a5,0(a0)
c000560c:	00279793          	slli	a5,a5,0x2
c0005610:	0097f7b3          	and	a5,a5,s1
c0005614:	1e879463          	bne	a5,s0,c00057fc <pmm_init+0x7d4>
c0005618:	00140413          	addi	s0,s0,1 # c0001 <_binary_obj___user_exit_out_size+0xbd9a5>
c000561c:	00031717          	auipc	a4,0x31
c0005620:	82872703          	lw	a4,-2008(a4) # c0035e44 <npage>
c0005624:	fae46ee3          	bltu	s0,a4,c00055e0 <pmm_init+0x5b8>
c0005628:	00031697          	auipc	a3,0x31
c000562c:	8186a683          	lw	a3,-2024(a3) # c0035e40 <boot_pgdir>
c0005630:	000014b7          	lui	s1,0x1
c0005634:	009687b3          	add	a5,a3,s1
c0005638:	fac7a783          	lw	a5,-84(a5)
c000563c:	fffff637          	lui	a2,0xfffff
c0005640:	c0000737          	lui	a4,0xc0000
c0005644:	00279793          	slli	a5,a5,0x2
c0005648:	00c7f7b3          	and	a5,a5,a2
c000564c:	60e6e463          	bltu	a3,a4,c0005c54 <pmm_init+0xc2c>
c0005650:	00031717          	auipc	a4,0x31
c0005654:	8c872703          	lw	a4,-1848(a4) # c0035f18 <va_pa_offset>
c0005658:	40e68733          	sub	a4,a3,a4
c000565c:	5ce79c63          	bne	a5,a4,c0005c34 <pmm_init+0xc0c>
c0005660:	0006a783          	lw	a5,0(a3)
c0005664:	5a079863          	bnez	a5,c0005c14 <pmm_init+0xbec>
c0005668:	00100513          	li	a0,1
c000566c:	a61fe0ef          	jal	ra,c00040cc <alloc_pages>
c0005670:	00050413          	mv	s0,a0
c0005674:	00050593          	mv	a1,a0
c0005678:	00600693          	li	a3,6
c000567c:	10000613          	li	a2,256
c0005680:	00030517          	auipc	a0,0x30
c0005684:	7c052503          	lw	a0,1984(a0) # c0035e40 <boot_pgdir>
c0005688:	a08ff0ef          	jal	ra,c0004890 <page_insert>
c000568c:	56051463          	bnez	a0,c0005bf4 <pmm_init+0xbcc>
c0005690:	00042703          	lw	a4,0(s0)
c0005694:	00100793          	li	a5,1
c0005698:	62f71a63          	bne	a4,a5,c0005ccc <pmm_init+0xca4>
c000569c:	00600693          	li	a3,6
c00056a0:	10048613          	addi	a2,s1,256 # 1100 <_binary_obj___user_faultread_out_size-0xe68>
c00056a4:	00040593          	mv	a1,s0
c00056a8:	00030517          	auipc	a0,0x30
c00056ac:	79852503          	lw	a0,1944(a0) # c0035e40 <boot_pgdir>
c00056b0:	9e0ff0ef          	jal	ra,c0004890 <page_insert>
c00056b4:	5e051c63          	bnez	a0,c0005cac <pmm_init+0xc84>
c00056b8:	00042703          	lw	a4,0(s0)
c00056bc:	00200793          	li	a5,2
c00056c0:	5cf71663          	bne	a4,a5,c0005c8c <pmm_init+0xc64>
c00056c4:	00004597          	auipc	a1,0x4
c00056c8:	50058593          	addi	a1,a1,1280 # c0009bc4 <default_pmm_manager+0x54c>
c00056cc:	10000513          	li	a0,256
c00056d0:	370020ef          	jal	ra,c0007a40 <strcpy>
c00056d4:	10048593          	addi	a1,s1,256
c00056d8:	10000513          	li	a0,256
c00056dc:	380020ef          	jal	ra,c0007a5c <strcmp>
c00056e0:	62051463          	bnez	a0,c0005d08 <pmm_init+0xce0>
c00056e4:	00031797          	auipc	a5,0x31
c00056e8:	83c7a783          	lw	a5,-1988(a5) # c0035f20 <pages>
c00056ec:	40f407b3          	sub	a5,s0,a5
c00056f0:	00080737          	lui	a4,0x80
c00056f4:	4057d793          	srai	a5,a5,0x5
c00056f8:	00e787b3          	add	a5,a5,a4
c00056fc:	00100737          	lui	a4,0x100
c0005700:	fff70713          	addi	a4,a4,-1 # fffff <_binary_obj___user_exit_out_size+0xfd9a3>
c0005704:	00e7f733          	and	a4,a5,a4
c0005708:	00030697          	auipc	a3,0x30
c000570c:	73c6a683          	lw	a3,1852(a3) # c0035e44 <npage>
c0005710:	00c79793          	slli	a5,a5,0xc
c0005714:	2ed77263          	bleu	a3,a4,c00059f8 <pmm_init+0x9d0>
c0005718:	00031717          	auipc	a4,0x31
c000571c:	80072703          	lw	a4,-2048(a4) # c0035f18 <va_pa_offset>
c0005720:	00f707b3          	add	a5,a4,a5
c0005724:	10078023          	sb	zero,256(a5)
c0005728:	10000513          	li	a0,256
c000572c:	2a8020ef          	jal	ra,c00079d4 <strlen>
c0005730:	4a051263          	bnez	a0,c0005bd4 <pmm_init+0xbac>
c0005734:	00100593          	li	a1,1
c0005738:	00040513          	mv	a0,s0
c000573c:	a45fe0ef          	jal	ra,c0004180 <free_pages>
c0005740:	00030797          	auipc	a5,0x30
c0005744:	7007a783          	lw	a5,1792(a5) # c0035e40 <boot_pgdir>
c0005748:	0007a783          	lw	a5,0(a5)
c000574c:	00030717          	auipc	a4,0x30
c0005750:	6f872703          	lw	a4,1784(a4) # c0035e44 <npage>
c0005754:	00279793          	slli	a5,a5,0x2
c0005758:	00c7d793          	srli	a5,a5,0xc
c000575c:	34e7f863          	bleu	a4,a5,c0005aac <pmm_init+0xa84>
c0005760:	fff80737          	lui	a4,0xfff80
c0005764:	00e787b3          	add	a5,a5,a4
c0005768:	00579793          	slli	a5,a5,0x5
c000576c:	00030517          	auipc	a0,0x30
c0005770:	7b452503          	lw	a0,1972(a0) # c0035f20 <pages>
c0005774:	00100593          	li	a1,1
c0005778:	00f50533          	add	a0,a0,a5
c000577c:	a05fe0ef          	jal	ra,c0004180 <free_pages>
c0005780:	00030797          	auipc	a5,0x30
c0005784:	6c07a783          	lw	a5,1728(a5) # c0035e40 <boot_pgdir>
c0005788:	0007a023          	sw	zero,0(a5)
c000578c:	00004517          	auipc	a0,0x4
c0005790:	4ac50513          	addi	a0,a0,1196 # c0009c38 <default_pmm_manager+0x5c0>
c0005794:	945fa0ef          	jal	ra,c00000d8 <cprintf>
c0005798:	da0ff0ef          	jal	ra,c0004d38 <print_pgdir>
c000579c:	de1fc0ef          	jal	ra,c000257c <kmalloc_init>
c00057a0:	01c12083          	lw	ra,28(sp)
c00057a4:	01812403          	lw	s0,24(sp)
c00057a8:	01412483          	lw	s1,20(sp)
c00057ac:	01012903          	lw	s2,16(sp)
c00057b0:	02010113          	addi	sp,sp,32
c00057b4:	00008067          	ret
c00057b8:	00078513          	mv	a0,a5
c00057bc:	9b5ff06f          	j	c0005170 <pmm_init+0x148>
c00057c0:	00004697          	auipc	a3,0x4
c00057c4:	2c468693          	addi	a3,a3,708 # c0009a84 <default_pmm_manager+0x40c>
c00057c8:	00003617          	auipc	a2,0x3
c00057cc:	e6c60613          	addi	a2,a2,-404 # c0008634 <commands+0x3e4>
c00057d0:	24800593          	li	a1,584
c00057d4:	00004517          	auipc	a0,0x4
c00057d8:	f2850513          	addi	a0,a0,-216 # c00096fc <default_pmm_manager+0x84>
c00057dc:	a71fa0ef          	jal	ra,c000024c <__panic>
c00057e0:	00040693          	mv	a3,s0
c00057e4:	00003617          	auipc	a2,0x3
c00057e8:	73460613          	addi	a2,a2,1844 # c0008f18 <commands+0xcc8>
c00057ec:	24800593          	li	a1,584
c00057f0:	00004517          	auipc	a0,0x4
c00057f4:	f0c50513          	addi	a0,a0,-244 # c00096fc <default_pmm_manager+0x84>
c00057f8:	a55fa0ef          	jal	ra,c000024c <__panic>
c00057fc:	00004697          	auipc	a3,0x4
c0005800:	2c868693          	addi	a3,a3,712 # c0009ac4 <default_pmm_manager+0x44c>
c0005804:	00003617          	auipc	a2,0x3
c0005808:	e3060613          	addi	a2,a2,-464 # c0008634 <commands+0x3e4>
c000580c:	24900593          	li	a1,585
c0005810:	00004517          	auipc	a0,0x4
c0005814:	eec50513          	addi	a0,a0,-276 # c00096fc <default_pmm_manager+0x84>
c0005818:	a35fa0ef          	jal	ra,c000024c <__panic>
c000581c:	00004697          	auipc	a3,0x4
c0005820:	1e468693          	addi	a3,a3,484 # c0009a00 <default_pmm_manager+0x388>
c0005824:	00003617          	auipc	a2,0x3
c0005828:	e1060613          	addi	a2,a2,-496 # c0008634 <commands+0x3e4>
c000582c:	23200593          	li	a1,562
c0005830:	00004517          	auipc	a0,0x4
c0005834:	ecc50513          	addi	a0,a0,-308 # c00096fc <default_pmm_manager+0x84>
c0005838:	a15fa0ef          	jal	ra,c000024c <__panic>
c000583c:	00004697          	auipc	a3,0x4
c0005840:	09468693          	addi	a3,a3,148 # c00098d0 <default_pmm_manager+0x258>
c0005844:	00003617          	auipc	a2,0x3
c0005848:	df060613          	addi	a2,a2,-528 # c0008634 <commands+0x3e4>
c000584c:	23100593          	li	a1,561
c0005850:	00004517          	auipc	a0,0x4
c0005854:	eac50513          	addi	a0,a0,-340 # c00096fc <default_pmm_manager+0x84>
c0005858:	9f5fa0ef          	jal	ra,c000024c <__panic>
c000585c:	00004697          	auipc	a3,0x4
c0005860:	1b868693          	addi	a3,a3,440 # c0009a14 <default_pmm_manager+0x39c>
c0005864:	00003617          	auipc	a2,0x3
c0005868:	dd060613          	addi	a2,a2,-560 # c0008634 <commands+0x3e4>
c000586c:	22e00593          	li	a1,558
c0005870:	00004517          	auipc	a0,0x4
c0005874:	e8c50513          	addi	a0,a0,-372 # c00096fc <default_pmm_manager+0x84>
c0005878:	9d5fa0ef          	jal	ra,c000024c <__panic>
c000587c:	00004697          	auipc	a3,0x4
c0005880:	03c68693          	addi	a3,a3,60 # c00098b8 <default_pmm_manager+0x240>
c0005884:	00003617          	auipc	a2,0x3
c0005888:	db060613          	addi	a2,a2,-592 # c0008634 <commands+0x3e4>
c000588c:	22d00593          	li	a1,557
c0005890:	00004517          	auipc	a0,0x4
c0005894:	e6c50513          	addi	a0,a0,-404 # c00096fc <default_pmm_manager+0x84>
c0005898:	9b5fa0ef          	jal	ra,c000024c <__panic>
c000589c:	00004697          	auipc	a3,0x4
c00058a0:	0a868693          	addi	a3,a3,168 # c0009944 <default_pmm_manager+0x2cc>
c00058a4:	00003617          	auipc	a2,0x3
c00058a8:	d9060613          	addi	a2,a2,-624 # c0008634 <commands+0x3e4>
c00058ac:	22c00593          	li	a1,556
c00058b0:	00004517          	auipc	a0,0x4
c00058b4:	e4c50513          	addi	a0,a0,-436 # c00096fc <default_pmm_manager+0x84>
c00058b8:	995fa0ef          	jal	ra,c000024c <__panic>
c00058bc:	00004697          	auipc	a3,0x4
c00058c0:	14468693          	addi	a3,a3,324 # c0009a00 <default_pmm_manager+0x388>
c00058c4:	00003617          	auipc	a2,0x3
c00058c8:	d7060613          	addi	a2,a2,-656 # c0008634 <commands+0x3e4>
c00058cc:	22b00593          	li	a1,555
c00058d0:	00004517          	auipc	a0,0x4
c00058d4:	e2c50513          	addi	a0,a0,-468 # c00096fc <default_pmm_manager+0x84>
c00058d8:	975fa0ef          	jal	ra,c000024c <__panic>
c00058dc:	00004697          	auipc	a3,0x4
c00058e0:	11068693          	addi	a3,a3,272 # c00099ec <default_pmm_manager+0x374>
c00058e4:	00003617          	auipc	a2,0x3
c00058e8:	d5060613          	addi	a2,a2,-688 # c0008634 <commands+0x3e4>
c00058ec:	22a00593          	li	a1,554
c00058f0:	00004517          	auipc	a0,0x4
c00058f4:	e0c50513          	addi	a0,a0,-500 # c00096fc <default_pmm_manager+0x84>
c00058f8:	955fa0ef          	jal	ra,c000024c <__panic>
c00058fc:	00004697          	auipc	a3,0x4
c0005900:	0c468693          	addi	a3,a3,196 # c00099c0 <default_pmm_manager+0x348>
c0005904:	00003617          	auipc	a2,0x3
c0005908:	d3060613          	addi	a2,a2,-720 # c0008634 <commands+0x3e4>
c000590c:	22900593          	li	a1,553
c0005910:	00004517          	auipc	a0,0x4
c0005914:	dec50513          	addi	a0,a0,-532 # c00096fc <default_pmm_manager+0x84>
c0005918:	935fa0ef          	jal	ra,c000024c <__panic>
c000591c:	00004697          	auipc	a3,0x4
c0005920:	09068693          	addi	a3,a3,144 # c00099ac <default_pmm_manager+0x334>
c0005924:	00003617          	auipc	a2,0x3
c0005928:	d1060613          	addi	a2,a2,-752 # c0008634 <commands+0x3e4>
c000592c:	22700593          	li	a1,551
c0005930:	00004517          	auipc	a0,0x4
c0005934:	dcc50513          	addi	a0,a0,-564 # c00096fc <default_pmm_manager+0x84>
c0005938:	915fa0ef          	jal	ra,c000024c <__panic>
c000593c:	00004697          	auipc	a3,0x4
c0005940:	05868693          	addi	a3,a3,88 # c0009994 <default_pmm_manager+0x31c>
c0005944:	00003617          	auipc	a2,0x3
c0005948:	cf060613          	addi	a2,a2,-784 # c0008634 <commands+0x3e4>
c000594c:	22600593          	li	a1,550
c0005950:	00004517          	auipc	a0,0x4
c0005954:	dac50513          	addi	a0,a0,-596 # c00096fc <default_pmm_manager+0x84>
c0005958:	8f5fa0ef          	jal	ra,c000024c <__panic>
c000595c:	00004697          	auipc	a3,0x4
c0005960:	02868693          	addi	a3,a3,40 # c0009984 <default_pmm_manager+0x30c>
c0005964:	00003617          	auipc	a2,0x3
c0005968:	cd060613          	addi	a2,a2,-816 # c0008634 <commands+0x3e4>
c000596c:	22500593          	li	a1,549
c0005970:	00004517          	auipc	a0,0x4
c0005974:	d8c50513          	addi	a0,a0,-628 # c00096fc <default_pmm_manager+0x84>
c0005978:	8d5fa0ef          	jal	ra,c000024c <__panic>
c000597c:	00004697          	auipc	a3,0x4
c0005980:	ff868693          	addi	a3,a3,-8 # c0009974 <default_pmm_manager+0x2fc>
c0005984:	00003617          	auipc	a2,0x3
c0005988:	cb060613          	addi	a2,a2,-848 # c0008634 <commands+0x3e4>
c000598c:	22400593          	li	a1,548
c0005990:	00004517          	auipc	a0,0x4
c0005994:	d6c50513          	addi	a0,a0,-660 # c00096fc <default_pmm_manager+0x84>
c0005998:	8b5fa0ef          	jal	ra,c000024c <__panic>
c000599c:	00004697          	auipc	a3,0x4
c00059a0:	06468693          	addi	a3,a3,100 # c0009a00 <default_pmm_manager+0x388>
c00059a4:	00003617          	auipc	a2,0x3
c00059a8:	c9060613          	addi	a2,a2,-880 # c0008634 <commands+0x3e4>
c00059ac:	23600593          	li	a1,566
c00059b0:	00004517          	auipc	a0,0x4
c00059b4:	d4c50513          	addi	a0,a0,-692 # c00096fc <default_pmm_manager+0x84>
c00059b8:	895fa0ef          	jal	ra,c000024c <__panic>
c00059bc:	00004697          	auipc	a3,0x4
c00059c0:	07068693          	addi	a3,a3,112 # c0009a2c <default_pmm_manager+0x3b4>
c00059c4:	00003617          	auipc	a2,0x3
c00059c8:	c7060613          	addi	a2,a2,-912 # c0008634 <commands+0x3e4>
c00059cc:	23500593          	li	a1,565
c00059d0:	00004517          	auipc	a0,0x4
c00059d4:	d2c50513          	addi	a0,a0,-724 # c00096fc <default_pmm_manager+0x84>
c00059d8:	875fa0ef          	jal	ra,c000024c <__panic>
c00059dc:	00050693          	mv	a3,a0
c00059e0:	00003617          	auipc	a2,0x3
c00059e4:	55c60613          	addi	a2,a2,1372 # c0008f3c <commands+0xcec>
c00059e8:	0d600593          	li	a1,214
c00059ec:	00004517          	auipc	a0,0x4
c00059f0:	d1050513          	addi	a0,a0,-752 # c00096fc <default_pmm_manager+0x84>
c00059f4:	859fa0ef          	jal	ra,c000024c <__panic>
c00059f8:	00078693          	mv	a3,a5
c00059fc:	00003617          	auipc	a2,0x3
c0005a00:	51c60613          	addi	a2,a2,1308 # c0008f18 <commands+0xcc8>
c0005a04:	06900593          	li	a1,105
c0005a08:	00003517          	auipc	a0,0x3
c0005a0c:	2c850513          	addi	a0,a0,712 # c0008cd0 <commands+0xa80>
c0005a10:	83dfa0ef          	jal	ra,c000024c <__panic>
c0005a14:	00004697          	auipc	a3,0x4
c0005a18:	e4868693          	addi	a3,a3,-440 # c000985c <default_pmm_manager+0x1e4>
c0005a1c:	00003617          	auipc	a2,0x3
c0005a20:	c1860613          	addi	a2,a2,-1000 # c0008634 <commands+0x3e4>
c0005a24:	21700593          	li	a1,535
c0005a28:	00004517          	auipc	a0,0x4
c0005a2c:	cd450513          	addi	a0,a0,-812 # c00096fc <default_pmm_manager+0x84>
c0005a30:	81dfa0ef          	jal	ra,c000024c <__panic>
c0005a34:	00004697          	auipc	a3,0x4
c0005a38:	e0068693          	addi	a3,a3,-512 # c0009834 <default_pmm_manager+0x1bc>
c0005a3c:	00003617          	auipc	a2,0x3
c0005a40:	bf860613          	addi	a2,a2,-1032 # c0008634 <commands+0x3e4>
c0005a44:	21300593          	li	a1,531
c0005a48:	00004517          	auipc	a0,0x4
c0005a4c:	cb450513          	addi	a0,a0,-844 # c00096fc <default_pmm_manager+0x84>
c0005a50:	ffcfa0ef          	jal	ra,c000024c <__panic>
c0005a54:	00004697          	auipc	a3,0x4
c0005a58:	da868693          	addi	a3,a3,-600 # c00097fc <default_pmm_manager+0x184>
c0005a5c:	00003617          	auipc	a2,0x3
c0005a60:	bd860613          	addi	a2,a2,-1064 # c0008634 <commands+0x3e4>
c0005a64:	21200593          	li	a1,530
c0005a68:	00004517          	auipc	a0,0x4
c0005a6c:	c9450513          	addi	a0,a0,-876 # c00096fc <default_pmm_manager+0x84>
c0005a70:	fdcfa0ef          	jal	ra,c000024c <__panic>
c0005a74:	00004697          	auipc	a3,0x4
c0005a78:	d6c68693          	addi	a3,a3,-660 # c00097e0 <default_pmm_manager+0x168>
c0005a7c:	00003617          	auipc	a2,0x3
c0005a80:	bb860613          	addi	a2,a2,-1096 # c0008634 <commands+0x3e4>
c0005a84:	21100593          	li	a1,529
c0005a88:	00004517          	auipc	a0,0x4
c0005a8c:	c7450513          	addi	a0,a0,-908 # c00096fc <default_pmm_manager+0x84>
c0005a90:	fbcfa0ef          	jal	ra,c000024c <__panic>
c0005a94:	00004617          	auipc	a2,0x4
c0005a98:	d3060613          	addi	a2,a2,-720 # c00097c4 <default_pmm_manager+0x14c>
c0005a9c:	0b800593          	li	a1,184
c0005aa0:	00004517          	auipc	a0,0x4
c0005aa4:	c5c50513          	addi	a0,a0,-932 # c00096fc <default_pmm_manager+0x84>
c0005aa8:	fa4fa0ef          	jal	ra,c000024c <__panic>
c0005aac:	e00fe0ef          	jal	ra,c00040ac <pa2page.part.6>
c0005ab0:	00004697          	auipc	a3,0x4
c0005ab4:	e3468693          	addi	a3,a3,-460 # c00098e4 <default_pmm_manager+0x26c>
c0005ab8:	00003617          	auipc	a2,0x3
c0005abc:	b7c60613          	addi	a2,a2,-1156 # c0008634 <commands+0x3e4>
c0005ac0:	21f00593          	li	a1,543
c0005ac4:	00004517          	auipc	a0,0x4
c0005ac8:	c3850513          	addi	a0,a0,-968 # c00096fc <default_pmm_manager+0x84>
c0005acc:	f80fa0ef          	jal	ra,c000024c <__panic>
c0005ad0:	00003617          	auipc	a2,0x3
c0005ad4:	44860613          	addi	a2,a2,1096 # c0008f18 <commands+0xcc8>
c0005ad8:	21e00593          	li	a1,542
c0005adc:	00004517          	auipc	a0,0x4
c0005ae0:	c2050513          	addi	a0,a0,-992 # c00096fc <default_pmm_manager+0x84>
c0005ae4:	f68fa0ef          	jal	ra,c000024c <__panic>
c0005ae8:	00004697          	auipc	a3,0x4
c0005aec:	de868693          	addi	a3,a3,-536 # c00098d0 <default_pmm_manager+0x258>
c0005af0:	00003617          	auipc	a2,0x3
c0005af4:	b4460613          	addi	a2,a2,-1212 # c0008634 <commands+0x3e4>
c0005af8:	21c00593          	li	a1,540
c0005afc:	00004517          	auipc	a0,0x4
c0005b00:	c0050513          	addi	a0,a0,-1024 # c00096fc <default_pmm_manager+0x84>
c0005b04:	f48fa0ef          	jal	ra,c000024c <__panic>
c0005b08:	00004697          	auipc	a3,0x4
c0005b0c:	db068693          	addi	a3,a3,-592 # c00098b8 <default_pmm_manager+0x240>
c0005b10:	00003617          	auipc	a2,0x3
c0005b14:	b2460613          	addi	a2,a2,-1244 # c0008634 <commands+0x3e4>
c0005b18:	21b00593          	li	a1,539
c0005b1c:	00004517          	auipc	a0,0x4
c0005b20:	be050513          	addi	a0,a0,-1056 # c00096fc <default_pmm_manager+0x84>
c0005b24:	f28fa0ef          	jal	ra,c000024c <__panic>
c0005b28:	00003617          	auipc	a2,0x3
c0005b2c:	6d860613          	addi	a2,a2,1752 # c0009200 <commands+0xfb0>
c0005b30:	07400593          	li	a1,116
c0005b34:	00003517          	auipc	a0,0x3
c0005b38:	19c50513          	addi	a0,a0,412 # c0008cd0 <commands+0xa80>
c0005b3c:	f10fa0ef          	jal	ra,c000024c <__panic>
c0005b40:	00004697          	auipc	a3,0x4
c0005b44:	d4868693          	addi	a3,a3,-696 # c0009888 <default_pmm_manager+0x210>
c0005b48:	00003617          	auipc	a2,0x3
c0005b4c:	aec60613          	addi	a2,a2,-1300 # c0008634 <commands+0x3e4>
c0005b50:	21a00593          	li	a1,538
c0005b54:	00004517          	auipc	a0,0x4
c0005b58:	ba850513          	addi	a0,a0,-1112 # c00096fc <default_pmm_manager+0x84>
c0005b5c:	ef0fa0ef          	jal	ra,c000024c <__panic>
c0005b60:	00004697          	auipc	a3,0x4
c0005b64:	de468693          	addi	a3,a3,-540 # c0009944 <default_pmm_manager+0x2cc>
c0005b68:	00003617          	auipc	a2,0x3
c0005b6c:	acc60613          	addi	a2,a2,-1332 # c0008634 <commands+0x3e4>
c0005b70:	22300593          	li	a1,547
c0005b74:	00004517          	auipc	a0,0x4
c0005b78:	b8850513          	addi	a0,a0,-1144 # c00096fc <default_pmm_manager+0x84>
c0005b7c:	ed0fa0ef          	jal	ra,c000024c <__panic>
c0005b80:	00004697          	auipc	a3,0x4
c0005b84:	d8c68693          	addi	a3,a3,-628 # c000990c <default_pmm_manager+0x294>
c0005b88:	00003617          	auipc	a2,0x3
c0005b8c:	aac60613          	addi	a2,a2,-1364 # c0008634 <commands+0x3e4>
c0005b90:	22200593          	li	a1,546
c0005b94:	00004517          	auipc	a0,0x4
c0005b98:	b6850513          	addi	a0,a0,-1176 # c00096fc <default_pmm_manager+0x84>
c0005b9c:	eb0fa0ef          	jal	ra,c000024c <__panic>
c0005ba0:	00078693          	mv	a3,a5
c0005ba4:	00003617          	auipc	a2,0x3
c0005ba8:	37460613          	addi	a2,a2,884 # c0008f18 <commands+0xcc8>
c0005bac:	0e900593          	li	a1,233
c0005bb0:	00004517          	auipc	a0,0x4
c0005bb4:	b4c50513          	addi	a0,a0,-1204 # c00096fc <default_pmm_manager+0x84>
c0005bb8:	e94fa0ef          	jal	ra,c000024c <__panic>
c0005bbc:	00004617          	auipc	a2,0x4
c0005bc0:	b7c60613          	addi	a2,a2,-1156 # c0009738 <default_pmm_manager+0xc0>
c0005bc4:	07300593          	li	a1,115
c0005bc8:	00004517          	auipc	a0,0x4
c0005bcc:	b3450513          	addi	a0,a0,-1228 # c00096fc <default_pmm_manager+0x84>
c0005bd0:	e7cfa0ef          	jal	ra,c000024c <__panic>
c0005bd4:	00004697          	auipc	a3,0x4
c0005bd8:	04068693          	addi	a3,a3,64 # c0009c14 <default_pmm_manager+0x59c>
c0005bdc:	00003617          	auipc	a2,0x3
c0005be0:	a5860613          	addi	a2,a2,-1448 # c0008634 <commands+0x3e4>
c0005be4:	25c00593          	li	a1,604
c0005be8:	00004517          	auipc	a0,0x4
c0005bec:	b1450513          	addi	a0,a0,-1260 # c00096fc <default_pmm_manager+0x84>
c0005bf0:	e5cfa0ef          	jal	ra,c000024c <__panic>
c0005bf4:	00004697          	auipc	a3,0x4
c0005bf8:	f3068693          	addi	a3,a3,-208 # c0009b24 <default_pmm_manager+0x4ac>
c0005bfc:	00003617          	auipc	a2,0x3
c0005c00:	a3860613          	addi	a2,a2,-1480 # c0008634 <commands+0x3e4>
c0005c04:	25200593          	li	a1,594
c0005c08:	00004517          	auipc	a0,0x4
c0005c0c:	af450513          	addi	a0,a0,-1292 # c00096fc <default_pmm_manager+0x84>
c0005c10:	e3cfa0ef          	jal	ra,c000024c <__panic>
c0005c14:	00004697          	auipc	a3,0x4
c0005c18:	efc68693          	addi	a3,a3,-260 # c0009b10 <default_pmm_manager+0x498>
c0005c1c:	00003617          	auipc	a2,0x3
c0005c20:	a1860613          	addi	a2,a2,-1512 # c0008634 <commands+0x3e4>
c0005c24:	24e00593          	li	a1,590
c0005c28:	00004517          	auipc	a0,0x4
c0005c2c:	ad450513          	addi	a0,a0,-1324 # c00096fc <default_pmm_manager+0x84>
c0005c30:	e1cfa0ef          	jal	ra,c000024c <__panic>
c0005c34:	00004697          	auipc	a3,0x4
c0005c38:	ea868693          	addi	a3,a3,-344 # c0009adc <default_pmm_manager+0x464>
c0005c3c:	00003617          	auipc	a2,0x3
c0005c40:	9f860613          	addi	a2,a2,-1544 # c0008634 <commands+0x3e4>
c0005c44:	24c00593          	li	a1,588
c0005c48:	00004517          	auipc	a0,0x4
c0005c4c:	ab450513          	addi	a0,a0,-1356 # c00096fc <default_pmm_manager+0x84>
c0005c50:	dfcfa0ef          	jal	ra,c000024c <__panic>
c0005c54:	00003617          	auipc	a2,0x3
c0005c58:	2e860613          	addi	a2,a2,744 # c0008f3c <commands+0xcec>
c0005c5c:	24c00593          	li	a1,588
c0005c60:	00004517          	auipc	a0,0x4
c0005c64:	a9c50513          	addi	a0,a0,-1380 # c00096fc <default_pmm_manager+0x84>
c0005c68:	de4fa0ef          	jal	ra,c000024c <__panic>
c0005c6c:	00004697          	auipc	a3,0x4
c0005c70:	dd468693          	addi	a3,a3,-556 # c0009a40 <default_pmm_manager+0x3c8>
c0005c74:	00003617          	auipc	a2,0x3
c0005c78:	9c060613          	addi	a2,a2,-1600 # c0008634 <commands+0x3e4>
c0005c7c:	23800593          	li	a1,568
c0005c80:	00004517          	auipc	a0,0x4
c0005c84:	a7c50513          	addi	a0,a0,-1412 # c00096fc <default_pmm_manager+0x84>
c0005c88:	dc4fa0ef          	jal	ra,c000024c <__panic>
c0005c8c:	00004697          	auipc	a3,0x4
c0005c90:	f2468693          	addi	a3,a3,-220 # c0009bb0 <default_pmm_manager+0x538>
c0005c94:	00003617          	auipc	a2,0x3
c0005c98:	9a060613          	addi	a2,a2,-1632 # c0008634 <commands+0x3e4>
c0005c9c:	25500593          	li	a1,597
c0005ca0:	00004517          	auipc	a0,0x4
c0005ca4:	a5c50513          	addi	a0,a0,-1444 # c00096fc <default_pmm_manager+0x84>
c0005ca8:	da4fa0ef          	jal	ra,c000024c <__panic>
c0005cac:	00004697          	auipc	a3,0x4
c0005cb0:	ec468693          	addi	a3,a3,-316 # c0009b70 <default_pmm_manager+0x4f8>
c0005cb4:	00003617          	auipc	a2,0x3
c0005cb8:	98060613          	addi	a2,a2,-1664 # c0008634 <commands+0x3e4>
c0005cbc:	25400593          	li	a1,596
c0005cc0:	00004517          	auipc	a0,0x4
c0005cc4:	a3c50513          	addi	a0,a0,-1476 # c00096fc <default_pmm_manager+0x84>
c0005cc8:	d84fa0ef          	jal	ra,c000024c <__panic>
c0005ccc:	00004697          	auipc	a3,0x4
c0005cd0:	e9068693          	addi	a3,a3,-368 # c0009b5c <default_pmm_manager+0x4e4>
c0005cd4:	00003617          	auipc	a2,0x3
c0005cd8:	96060613          	addi	a2,a2,-1696 # c0008634 <commands+0x3e4>
c0005cdc:	25300593          	li	a1,595
c0005ce0:	00004517          	auipc	a0,0x4
c0005ce4:	a1c50513          	addi	a0,a0,-1508 # c00096fc <default_pmm_manager+0x84>
c0005ce8:	d64fa0ef          	jal	ra,c000024c <__panic>
c0005cec:	00078693          	mv	a3,a5
c0005cf0:	00003617          	auipc	a2,0x3
c0005cf4:	22860613          	addi	a2,a2,552 # c0008f18 <commands+0xcc8>
c0005cf8:	08b00593          	li	a1,139
c0005cfc:	00004517          	auipc	a0,0x4
c0005d00:	a0050513          	addi	a0,a0,-1536 # c00096fc <default_pmm_manager+0x84>
c0005d04:	d48fa0ef          	jal	ra,c000024c <__panic>
c0005d08:	00004697          	auipc	a3,0x4
c0005d0c:	ed468693          	addi	a3,a3,-300 # c0009bdc <default_pmm_manager+0x564>
c0005d10:	00003617          	auipc	a2,0x3
c0005d14:	92460613          	addi	a2,a2,-1756 # c0008634 <commands+0x3e4>
c0005d18:	25900593          	li	a1,601
c0005d1c:	00004517          	auipc	a0,0x4
c0005d20:	9e050513          	addi	a0,a0,-1568 # c00096fc <default_pmm_manager+0x84>
c0005d24:	d28fa0ef          	jal	ra,c000024c <__panic>
c0005d28:	00003617          	auipc	a2,0x3
c0005d2c:	21460613          	addi	a2,a2,532 # c0008f3c <commands+0xcec>
c0005d30:	09100593          	li	a1,145
c0005d34:	00004517          	auipc	a0,0x4
c0005d38:	9c850513          	addi	a0,a0,-1592 # c00096fc <default_pmm_manager+0x84>
c0005d3c:	d10fa0ef          	jal	ra,c000024c <__panic>

c0005d40 <swapfs_init>:
c0005d40:	ff010113          	addi	sp,sp,-16
c0005d44:	00100513          	li	a0,1
c0005d48:	00112623          	sw	ra,12(sp)
c0005d4c:	939fa0ef          	jal	ra,c0000684 <ide_device_valid>
c0005d50:	02050263          	beqz	a0,c0005d74 <swapfs_init+0x34>
c0005d54:	00100513          	li	a0,1
c0005d58:	935fa0ef          	jal	ra,c000068c <ide_device_size>
c0005d5c:	00c12083          	lw	ra,12(sp)
c0005d60:	00355513          	srli	a0,a0,0x3
c0005d64:	00030297          	auipc	t0,0x30
c0005d68:	16a2ae23          	sw	a0,380(t0) # c0035ee0 <max_swap_offset>
c0005d6c:	01010113          	addi	sp,sp,16
c0005d70:	00008067          	ret
c0005d74:	00004617          	auipc	a2,0x4
c0005d78:	fd460613          	addi	a2,a2,-44 # c0009d48 <default_pmm_manager+0x6d0>
c0005d7c:	00d00593          	li	a1,13
c0005d80:	00004517          	auipc	a0,0x4
c0005d84:	fe450513          	addi	a0,a0,-28 # c0009d64 <default_pmm_manager+0x6ec>
c0005d88:	cc4fa0ef          	jal	ra,c000024c <__panic>

c0005d8c <swapfs_read>:
c0005d8c:	ff010113          	addi	sp,sp,-16
c0005d90:	00112623          	sw	ra,12(sp)
c0005d94:	00855793          	srli	a5,a0,0x8
c0005d98:	06078663          	beqz	a5,c0005e04 <swapfs_read+0x78>
c0005d9c:	00030717          	auipc	a4,0x30
c0005da0:	14472703          	lw	a4,324(a4) # c0035ee0 <max_swap_offset>
c0005da4:	06e7f063          	bleu	a4,a5,c0005e04 <swapfs_read+0x78>
c0005da8:	00030617          	auipc	a2,0x30
c0005dac:	17862603          	lw	a2,376(a2) # c0035f20 <pages>
c0005db0:	40c58633          	sub	a2,a1,a2
c0005db4:	40565613          	srai	a2,a2,0x5
c0005db8:	00027597          	auipc	a1,0x27
c0005dbc:	c585a583          	lw	a1,-936(a1) # c002ca10 <nbase>
c0005dc0:	00100737          	lui	a4,0x100
c0005dc4:	00b60633          	add	a2,a2,a1
c0005dc8:	fff70713          	addi	a4,a4,-1 # fffff <_binary_obj___user_exit_out_size+0xfd9a3>
c0005dcc:	00e67733          	and	a4,a2,a4
c0005dd0:	00030697          	auipc	a3,0x30
c0005dd4:	0746a683          	lw	a3,116(a3) # c0035e44 <npage>
c0005dd8:	00379593          	slli	a1,a5,0x3
c0005ddc:	00c61613          	slli	a2,a2,0xc
c0005de0:	04d77063          	bleu	a3,a4,c0005e20 <swapfs_read+0x94>
c0005de4:	00c12083          	lw	ra,12(sp)
c0005de8:	00030797          	auipc	a5,0x30
c0005dec:	1307a783          	lw	a5,304(a5) # c0035f18 <va_pa_offset>
c0005df0:	00800693          	li	a3,8
c0005df4:	00f60633          	add	a2,a2,a5
c0005df8:	00100513          	li	a0,1
c0005dfc:	01010113          	addi	sp,sp,16
c0005e00:	895fa06f          	j	c0000694 <ide_read_secs>
c0005e04:	00050693          	mv	a3,a0
c0005e08:	00004617          	auipc	a2,0x4
c0005e0c:	f7060613          	addi	a2,a2,-144 # c0009d78 <default_pmm_manager+0x700>
c0005e10:	01400593          	li	a1,20
c0005e14:	00004517          	auipc	a0,0x4
c0005e18:	f5050513          	addi	a0,a0,-176 # c0009d64 <default_pmm_manager+0x6ec>
c0005e1c:	c30fa0ef          	jal	ra,c000024c <__panic>
c0005e20:	00060693          	mv	a3,a2
c0005e24:	06900593          	li	a1,105
c0005e28:	00003617          	auipc	a2,0x3
c0005e2c:	0f060613          	addi	a2,a2,240 # c0008f18 <commands+0xcc8>
c0005e30:	00003517          	auipc	a0,0x3
c0005e34:	ea050513          	addi	a0,a0,-352 # c0008cd0 <commands+0xa80>
c0005e38:	c14fa0ef          	jal	ra,c000024c <__panic>

c0005e3c <swapfs_write>:
c0005e3c:	ff010113          	addi	sp,sp,-16
c0005e40:	00112623          	sw	ra,12(sp)
c0005e44:	00855793          	srli	a5,a0,0x8
c0005e48:	06078663          	beqz	a5,c0005eb4 <swapfs_write+0x78>
c0005e4c:	00030717          	auipc	a4,0x30
c0005e50:	09472703          	lw	a4,148(a4) # c0035ee0 <max_swap_offset>
c0005e54:	06e7f063          	bleu	a4,a5,c0005eb4 <swapfs_write+0x78>
c0005e58:	00030617          	auipc	a2,0x30
c0005e5c:	0c862603          	lw	a2,200(a2) # c0035f20 <pages>
c0005e60:	40c58633          	sub	a2,a1,a2
c0005e64:	40565613          	srai	a2,a2,0x5
c0005e68:	00027597          	auipc	a1,0x27
c0005e6c:	ba85a583          	lw	a1,-1112(a1) # c002ca10 <nbase>
c0005e70:	00100737          	lui	a4,0x100
c0005e74:	00b60633          	add	a2,a2,a1
c0005e78:	fff70713          	addi	a4,a4,-1 # fffff <_binary_obj___user_exit_out_size+0xfd9a3>
c0005e7c:	00e67733          	and	a4,a2,a4
c0005e80:	00030697          	auipc	a3,0x30
c0005e84:	fc46a683          	lw	a3,-60(a3) # c0035e44 <npage>
c0005e88:	00379593          	slli	a1,a5,0x3
c0005e8c:	00c61613          	slli	a2,a2,0xc
c0005e90:	04d77063          	bleu	a3,a4,c0005ed0 <swapfs_write+0x94>
c0005e94:	00c12083          	lw	ra,12(sp)
c0005e98:	00030797          	auipc	a5,0x30
c0005e9c:	0807a783          	lw	a5,128(a5) # c0035f18 <va_pa_offset>
c0005ea0:	00800693          	li	a3,8
c0005ea4:	00f60633          	add	a2,a2,a5
c0005ea8:	00100513          	li	a0,1
c0005eac:	01010113          	addi	sp,sp,16
c0005eb0:	819fa06f          	j	c00006c8 <ide_write_secs>
c0005eb4:	00050693          	mv	a3,a0
c0005eb8:	00004617          	auipc	a2,0x4
c0005ebc:	ec060613          	addi	a2,a2,-320 # c0009d78 <default_pmm_manager+0x700>
c0005ec0:	01900593          	li	a1,25
c0005ec4:	00004517          	auipc	a0,0x4
c0005ec8:	ea050513          	addi	a0,a0,-352 # c0009d64 <default_pmm_manager+0x6ec>
c0005ecc:	b80fa0ef          	jal	ra,c000024c <__panic>
c0005ed0:	00060693          	mv	a3,a2
c0005ed4:	06900593          	li	a1,105
c0005ed8:	00003617          	auipc	a2,0x3
c0005edc:	04060613          	addi	a2,a2,64 # c0008f18 <commands+0xcc8>
c0005ee0:	00003517          	auipc	a0,0x3
c0005ee4:	df050513          	addi	a0,a0,-528 # c0008cd0 <commands+0xa80>
c0005ee8:	b64fa0ef          	jal	ra,c000024c <__panic>

c0005eec <switch_to>:
c0005eec:	00152023          	sw	ra,0(a0)
c0005ef0:	00252223          	sw	sp,4(a0)
c0005ef4:	00852423          	sw	s0,8(a0)
c0005ef8:	00952623          	sw	s1,12(a0)
c0005efc:	01252823          	sw	s2,16(a0)
c0005f00:	01352a23          	sw	s3,20(a0)
c0005f04:	01452c23          	sw	s4,24(a0)
c0005f08:	01552e23          	sw	s5,28(a0)
c0005f0c:	03652023          	sw	s6,32(a0)
c0005f10:	03752223          	sw	s7,36(a0)
c0005f14:	03852423          	sw	s8,40(a0)
c0005f18:	03952623          	sw	s9,44(a0)
c0005f1c:	03a52823          	sw	s10,48(a0)
c0005f20:	03b52a23          	sw	s11,52(a0)
c0005f24:	0005a083          	lw	ra,0(a1)
c0005f28:	0045a103          	lw	sp,4(a1)
c0005f2c:	0085a403          	lw	s0,8(a1)
c0005f30:	00c5a483          	lw	s1,12(a1)
c0005f34:	0105a903          	lw	s2,16(a1)
c0005f38:	0145a983          	lw	s3,20(a1)
c0005f3c:	0185aa03          	lw	s4,24(a1)
c0005f40:	01c5aa83          	lw	s5,28(a1)
c0005f44:	0205ab03          	lw	s6,32(a1)
c0005f48:	0245ab83          	lw	s7,36(a1)
c0005f4c:	0285ac03          	lw	s8,40(a1)
c0005f50:	02c5ac83          	lw	s9,44(a1)
c0005f54:	0305ad03          	lw	s10,48(a1)
c0005f58:	0345ad83          	lw	s11,52(a1)
c0005f5c:	00008067          	ret

c0005f60 <kernel_thread_entry>:
c0005f60:	00048513          	mv	a0,s1
c0005f64:	000400e7          	jalr	s0
c0005f68:	1b9000ef          	jal	ra,c0006920 <do_exit>

c0005f6c <alloc_proc>:
c0005f6c:	ff010113          	addi	sp,sp,-16
c0005f70:	09400513          	li	a0,148
c0005f74:	00812423          	sw	s0,8(sp)
c0005f78:	00112623          	sw	ra,12(sp)
c0005f7c:	e30fc0ef          	jal	ra,c00025ac <kmalloc>
c0005f80:	00050413          	mv	s0,a0
c0005f84:	06050463          	beqz	a0,c0005fec <alloc_proc+0x80>
c0005f88:	fff00793          	li	a5,-1
c0005f8c:	00f52223          	sw	a5,4(a0)
c0005f90:	03800613          	li	a2,56
c0005f94:	00000593          	li	a1,0
c0005f98:	00052023          	sw	zero,0(a0)
c0005f9c:	00052423          	sw	zero,8(a0)
c0005fa0:	00052623          	sw	zero,12(a0)
c0005fa4:	00052823          	sw	zero,16(a0)
c0005fa8:	00052a23          	sw	zero,20(a0)
c0005fac:	00052c23          	sw	zero,24(a0)
c0005fb0:	01c50513          	addi	a0,a0,28
c0005fb4:	309010ef          	jal	ra,c0007abc <memset>
c0005fb8:	00030797          	auipc	a5,0x30
c0005fbc:	f647a783          	lw	a5,-156(a5) # c0035f1c <boot_cr3>
c0005fc0:	04042a23          	sw	zero,84(s0)
c0005fc4:	04f42c23          	sw	a5,88(s0)
c0005fc8:	04042e23          	sw	zero,92(s0)
c0005fcc:	00f00613          	li	a2,15
c0005fd0:	00000593          	li	a1,0
c0005fd4:	06040513          	addi	a0,s0,96
c0005fd8:	2e5010ef          	jal	ra,c0007abc <memset>
c0005fdc:	08042223          	sw	zero,132(s0)
c0005fe0:	08042623          	sw	zero,140(s0)
c0005fe4:	08042823          	sw	zero,144(s0)
c0005fe8:	08042423          	sw	zero,136(s0)
c0005fec:	00c12083          	lw	ra,12(sp)
c0005ff0:	00040513          	mv	a0,s0
c0005ff4:	00812403          	lw	s0,8(sp)
c0005ff8:	01010113          	addi	sp,sp,16
c0005ffc:	00008067          	ret

c0006000 <forkret>:
c0006000:	00030797          	auipc	a5,0x30
c0006004:	e4c7a783          	lw	a5,-436(a5) # c0035e4c <current>
c0006008:	0547a503          	lw	a0,84(a5)
c000600c:	870fb06f          	j	c000107c <forkrets>

c0006010 <user_main>:
c0006010:	00030797          	auipc	a5,0x30
c0006014:	e3c7a783          	lw	a5,-452(a5) # c0035e4c <current>
c0006018:	0047a583          	lw	a1,4(a5)
c000601c:	fd010113          	addi	sp,sp,-48
c0006020:	00004617          	auipc	a2,0x4
c0006024:	13460613          	addi	a2,a2,308 # c000a154 <default_pmm_manager+0xadc>
c0006028:	00004517          	auipc	a0,0x4
c000602c:	13450513          	addi	a0,a0,308 # c000a15c <default_pmm_manager+0xae4>
c0006030:	02112623          	sw	ra,44(sp)
c0006034:	8a4fa0ef          	jal	ra,c00000d8 <cprintf>
c0006038:	00004797          	auipc	a5,0x4
c000603c:	11c78793          	addi	a5,a5,284 # c000a154 <default_pmm_manager+0xadc>
c0006040:	3fffc717          	auipc	a4,0x3fffc
c0006044:	61c70713          	addi	a4,a4,1564 # 265c <sbi_remote_fence_i+0x2d6c>
c0006048:	00e12623          	sw	a4,12(sp)
c000604c:	00078513          	mv	a0,a5
c0006050:	00013717          	auipc	a4,0x13
c0006054:	5bc70713          	addi	a4,a4,1468 # c001960c <_binary_obj___user_exit_out_start>
c0006058:	00e12c23          	sw	a4,24(sp)
c000605c:	00f12e23          	sw	a5,28(sp)
c0006060:	175010ef          	jal	ra,c00079d4 <strlen>
c0006064:	00a12a23          	sw	a0,20(sp)
c0006068:	00400513          	li	a0,4
c000606c:	01c12583          	lw	a1,28(sp)
c0006070:	01412603          	lw	a2,20(sp)
c0006074:	01812683          	lw	a3,24(sp)
c0006078:	00c12703          	lw	a4,12(sp)
c000607c:	00a00893          	li	a7,10
c0006080:	00000073          	ecall
c0006084:	00a12823          	sw	a0,16(sp)
c0006088:	00004617          	auipc	a2,0x4
c000608c:	0fc60613          	addi	a2,a2,252 # c000a184 <default_pmm_manager+0xb0c>
c0006090:	35900593          	li	a1,857
c0006094:	00004517          	auipc	a0,0x4
c0006098:	10c50513          	addi	a0,a0,268 # c000a1a0 <default_pmm_manager+0xb28>
c000609c:	9b0fa0ef          	jal	ra,c000024c <__panic>

c00060a0 <put_pgdir>:
c00060a0:	00c52683          	lw	a3,12(a0)
c00060a4:	ff010113          	addi	sp,sp,-16
c00060a8:	00112623          	sw	ra,12(sp)
c00060ac:	c00007b7          	lui	a5,0xc0000
c00060b0:	04f6e663          	bltu	a3,a5,c00060fc <put_pgdir+0x5c>
c00060b4:	00030517          	auipc	a0,0x30
c00060b8:	e6452503          	lw	a0,-412(a0) # c0035f18 <va_pa_offset>
c00060bc:	40a686b3          	sub	a3,a3,a0
c00060c0:	00c6d693          	srli	a3,a3,0xc
c00060c4:	00030797          	auipc	a5,0x30
c00060c8:	d807a783          	lw	a5,-640(a5) # c0035e44 <npage>
c00060cc:	04f6f463          	bleu	a5,a3,c0006114 <put_pgdir+0x74>
c00060d0:	00027517          	auipc	a0,0x27
c00060d4:	94052503          	lw	a0,-1728(a0) # c002ca10 <nbase>
c00060d8:	40a686b3          	sub	a3,a3,a0
c00060dc:	00c12083          	lw	ra,12(sp)
c00060e0:	00569693          	slli	a3,a3,0x5
c00060e4:	00030517          	auipc	a0,0x30
c00060e8:	e3c52503          	lw	a0,-452(a0) # c0035f20 <pages>
c00060ec:	00100593          	li	a1,1
c00060f0:	00d50533          	add	a0,a0,a3
c00060f4:	01010113          	addi	sp,sp,16
c00060f8:	888fe06f          	j	c0004180 <free_pages>
c00060fc:	00003617          	auipc	a2,0x3
c0006100:	e4060613          	addi	a2,a2,-448 # c0008f3c <commands+0xcec>
c0006104:	06e00593          	li	a1,110
c0006108:	00003517          	auipc	a0,0x3
c000610c:	bc850513          	addi	a0,a0,-1080 # c0008cd0 <commands+0xa80>
c0006110:	93cfa0ef          	jal	ra,c000024c <__panic>
c0006114:	00003617          	auipc	a2,0x3
c0006118:	b9c60613          	addi	a2,a2,-1124 # c0008cb0 <commands+0xa60>
c000611c:	06200593          	li	a1,98
c0006120:	00003517          	auipc	a0,0x3
c0006124:	bb050513          	addi	a0,a0,-1104 # c0008cd0 <commands+0xa80>
c0006128:	924fa0ef          	jal	ra,c000024c <__panic>

c000612c <setup_pgdir>:
c000612c:	fe010113          	addi	sp,sp,-32
c0006130:	01212823          	sw	s2,16(sp)
c0006134:	00050913          	mv	s2,a0
c0006138:	00100513          	li	a0,1
c000613c:	00112e23          	sw	ra,28(sp)
c0006140:	00812c23          	sw	s0,24(sp)
c0006144:	00912a23          	sw	s1,20(sp)
c0006148:	01312623          	sw	s3,12(sp)
c000614c:	f81fd0ef          	jal	ra,c00040cc <alloc_pages>
c0006150:	0a050a63          	beqz	a0,c0006204 <setup_pgdir+0xd8>
c0006154:	00030697          	auipc	a3,0x30
c0006158:	dcc6a683          	lw	a3,-564(a3) # c0035f20 <pages>
c000615c:	40d506b3          	sub	a3,a0,a3
c0006160:	00027997          	auipc	s3,0x27
c0006164:	8b09a983          	lw	s3,-1872(s3) # c002ca10 <nbase>
c0006168:	4056d693          	srai	a3,a3,0x5
c000616c:	001007b7          	lui	a5,0x100
c0006170:	013686b3          	add	a3,a3,s3
c0006174:	fff78793          	addi	a5,a5,-1 # fffff <_binary_obj___user_exit_out_size+0xfd9a3>
c0006178:	00f6f7b3          	and	a5,a3,a5
c000617c:	00030717          	auipc	a4,0x30
c0006180:	cc872703          	lw	a4,-824(a4) # c0035e44 <npage>
c0006184:	00050413          	mv	s0,a0
c0006188:	00c69693          	slli	a3,a3,0xc
c000618c:	08e7f063          	bleu	a4,a5,c000620c <setup_pgdir+0xe0>
c0006190:	00030497          	auipc	s1,0x30
c0006194:	d884a483          	lw	s1,-632(s1) # c0035f18 <va_pa_offset>
c0006198:	009684b3          	add	s1,a3,s1
c000619c:	00001637          	lui	a2,0x1
c00061a0:	00030597          	auipc	a1,0x30
c00061a4:	ca05a583          	lw	a1,-864(a1) # c0035e40 <boot_pgdir>
c00061a8:	00048513          	mv	a0,s1
c00061ac:	12d010ef          	jal	ra,c0007ad8 <memcpy>
c00061b0:	00030797          	auipc	a5,0x30
c00061b4:	d707a783          	lw	a5,-656(a5) # c0035f20 <pages>
c00061b8:	40f40433          	sub	s0,s0,a5
c00061bc:	40545413          	srai	s0,s0,0x5
c00061c0:	01340433          	add	s0,s0,s3
c00061c4:	00a41413          	slli	s0,s0,0xa
c00061c8:	000017b7          	lui	a5,0x1
c00061cc:	00f487b3          	add	a5,s1,a5
c00061d0:	00146713          	ori	a4,s0,1
c00061d4:	00746413          	ori	s0,s0,7
c00061d8:	fae7a623          	sw	a4,-84(a5) # fac <_binary_obj___user_faultread_out_size-0xfbc>
c00061dc:	fa87a823          	sw	s0,-80(a5)
c00061e0:	00992623          	sw	s1,12(s2) # 100c <_binary_obj___user_faultread_out_size-0xf5c>
c00061e4:	00000513          	li	a0,0
c00061e8:	01c12083          	lw	ra,28(sp)
c00061ec:	01812403          	lw	s0,24(sp)
c00061f0:	01412483          	lw	s1,20(sp)
c00061f4:	01012903          	lw	s2,16(sp)
c00061f8:	00c12983          	lw	s3,12(sp)
c00061fc:	02010113          	addi	sp,sp,32
c0006200:	00008067          	ret
c0006204:	ffc00513          	li	a0,-4
c0006208:	fe1ff06f          	j	c00061e8 <setup_pgdir+0xbc>
c000620c:	00003617          	auipc	a2,0x3
c0006210:	d0c60613          	addi	a2,a2,-756 # c0008f18 <commands+0xcc8>
c0006214:	06900593          	li	a1,105
c0006218:	00003517          	auipc	a0,0x3
c000621c:	ab850513          	addi	a0,a0,-1352 # c0008cd0 <commands+0xa80>
c0006220:	82cfa0ef          	jal	ra,c000024c <__panic>

c0006224 <set_proc_name>:
c0006224:	ff010113          	addi	sp,sp,-16
c0006228:	00812423          	sw	s0,8(sp)
c000622c:	06050413          	addi	s0,a0,96
c0006230:	00912223          	sw	s1,4(sp)
c0006234:	01000613          	li	a2,16
c0006238:	00058493          	mv	s1,a1
c000623c:	00040513          	mv	a0,s0
c0006240:	00000593          	li	a1,0
c0006244:	00112623          	sw	ra,12(sp)
c0006248:	075010ef          	jal	ra,c0007abc <memset>
c000624c:	00048593          	mv	a1,s1
c0006250:	00040513          	mv	a0,s0
c0006254:	00c12083          	lw	ra,12(sp)
c0006258:	00812403          	lw	s0,8(sp)
c000625c:	00412483          	lw	s1,4(sp)
c0006260:	00f00613          	li	a2,15
c0006264:	01010113          	addi	sp,sp,16
c0006268:	0710106f          	j	c0007ad8 <memcpy>

c000626c <proc_run>:
c000626c:	ff010113          	addi	sp,sp,-16
c0006270:	00912223          	sw	s1,4(sp)
c0006274:	00112623          	sw	ra,12(sp)
c0006278:	00812423          	sw	s0,8(sp)
c000627c:	01212023          	sw	s2,0(sp)
c0006280:	00030497          	auipc	s1,0x30
c0006284:	bcc4a483          	lw	s1,-1076(s1) # c0035e4c <current>
c0006288:	02a48e63          	beq	s1,a0,c00062c4 <proc_run+0x58>
c000628c:	00050413          	mv	s0,a0
c0006290:	100027f3          	csrr	a5,sstatus
c0006294:	0027f793          	andi	a5,a5,2
c0006298:	00000913          	li	s2,0
c000629c:	04079c63          	bnez	a5,c00062f4 <proc_run+0x88>
c00062a0:	05842783          	lw	a5,88(s0)
c00062a4:	00030297          	auipc	t0,0x30
c00062a8:	ba82a423          	sw	s0,-1112(t0) # c0035e4c <current>
c00062ac:	00c7d793          	srli	a5,a5,0xc
c00062b0:	18079073          	csrw	sptbr,a5
c00062b4:	01c40593          	addi	a1,s0,28
c00062b8:	01c48513          	addi	a0,s1,28
c00062bc:	c31ff0ef          	jal	ra,c0005eec <switch_to>
c00062c0:	00091e63          	bnez	s2,c00062dc <proc_run+0x70>
c00062c4:	00c12083          	lw	ra,12(sp)
c00062c8:	00812403          	lw	s0,8(sp)
c00062cc:	00412483          	lw	s1,4(sp)
c00062d0:	00012903          	lw	s2,0(sp)
c00062d4:	01010113          	addi	sp,sp,16
c00062d8:	00008067          	ret
c00062dc:	00c12083          	lw	ra,12(sp)
c00062e0:	00812403          	lw	s0,8(sp)
c00062e4:	00412483          	lw	s1,4(sp)
c00062e8:	00012903          	lw	s2,0(sp)
c00062ec:	01010113          	addi	sp,sp,16
c00062f0:	d28fa06f          	j	c0000818 <intr_enable>
c00062f4:	d2cfa0ef          	jal	ra,c0000820 <intr_disable>
c00062f8:	00100913          	li	s2,1
c00062fc:	fa5ff06f          	j	c00062a0 <proc_run+0x34>

c0006300 <find_proc>:
c0006300:	000027b7          	lui	a5,0x2
c0006304:	fff50713          	addi	a4,a0,-1
c0006308:	ffe78793          	addi	a5,a5,-2 # 1ffe <_binary_obj___user_softint_out_size+0x92>
c000630c:	06e7e663          	bltu	a5,a4,c0006378 <find_proc+0x78>
c0006310:	ff010113          	addi	sp,sp,-16
c0006314:	00a00593          	li	a1,10
c0006318:	00812423          	sw	s0,8(sp)
c000631c:	00112623          	sw	ra,12(sp)
c0006320:	00050413          	mv	s0,a0
c0006324:	5cd010ef          	jal	ra,c00080f0 <hash32>
c0006328:	0002e797          	auipc	a5,0x2e
c000632c:	af878793          	addi	a5,a5,-1288 # c0033e20 <hash_list>
c0006330:	00351513          	slli	a0,a0,0x3
c0006334:	00a78533          	add	a0,a5,a0
c0006338:	00050793          	mv	a5,a0
c000633c:	00c0006f          	j	c0006348 <find_proc+0x48>
c0006340:	f8c7a703          	lw	a4,-116(a5)
c0006344:	02e40063          	beq	s0,a4,c0006364 <find_proc+0x64>
c0006348:	0047a783          	lw	a5,4(a5)
c000634c:	fef51ae3          	bne	a0,a5,c0006340 <find_proc+0x40>
c0006350:	00c12083          	lw	ra,12(sp)
c0006354:	00000513          	li	a0,0
c0006358:	00812403          	lw	s0,8(sp)
c000635c:	01010113          	addi	sp,sp,16
c0006360:	00008067          	ret
c0006364:	00c12083          	lw	ra,12(sp)
c0006368:	f8878513          	addi	a0,a5,-120
c000636c:	00812403          	lw	s0,8(sp)
c0006370:	01010113          	addi	sp,sp,16
c0006374:	00008067          	ret
c0006378:	00000513          	li	a0,0
c000637c:	00008067          	ret

c0006380 <do_fork>:
c0006380:	00030717          	auipc	a4,0x30
c0006384:	ad872703          	lw	a4,-1320(a4) # c0035e58 <nr_process>
c0006388:	000017b7          	lui	a5,0x1
c000638c:	46f75463          	ble	a5,a4,c00067f4 <do_fork+0x474>
c0006390:	fd010113          	addi	sp,sp,-48
c0006394:	02812423          	sw	s0,40(sp)
c0006398:	02912223          	sw	s1,36(sp)
c000639c:	03212023          	sw	s2,32(sp)
c00063a0:	01312e23          	sw	s3,28(sp)
c00063a4:	02112623          	sw	ra,44(sp)
c00063a8:	01412c23          	sw	s4,24(sp)
c00063ac:	01512a23          	sw	s5,20(sp)
c00063b0:	01612823          	sw	s6,16(sp)
c00063b4:	01712623          	sw	s7,12(sp)
c00063b8:	00050993          	mv	s3,a0
c00063bc:	00058913          	mv	s2,a1
c00063c0:	00060493          	mv	s1,a2
c00063c4:	ba9ff0ef          	jal	ra,c0005f6c <alloc_proc>
c00063c8:	00050413          	mv	s0,a0
c00063cc:	40050663          	beqz	a0,c00067d8 <do_fork+0x458>
c00063d0:	00030797          	auipc	a5,0x30
c00063d4:	a7c7a783          	lw	a5,-1412(a5) # c0035e4c <current>
c00063d8:	0847a703          	lw	a4,132(a5)
c00063dc:	00f52a23          	sw	a5,20(a0)
c00063e0:	4a071263          	bnez	a4,c0006884 <do_fork+0x504>
c00063e4:	00200513          	li	a0,2
c00063e8:	ce5fd0ef          	jal	ra,c00040cc <alloc_pages>
c00063ec:	3e050263          	beqz	a0,c00067d0 <do_fork+0x450>
c00063f0:	00030697          	auipc	a3,0x30
c00063f4:	b306a683          	lw	a3,-1232(a3) # c0035f20 <pages>
c00063f8:	40d506b3          	sub	a3,a0,a3
c00063fc:	4056d693          	srai	a3,a3,0x5
c0006400:	00026a17          	auipc	s4,0x26
c0006404:	610a2a03          	lw	s4,1552(s4) # c002ca10 <nbase>
c0006408:	001007b7          	lui	a5,0x100
c000640c:	014686b3          	add	a3,a3,s4
c0006410:	fff78793          	addi	a5,a5,-1 # fffff <_binary_obj___user_exit_out_size+0xfd9a3>
c0006414:	00f6f7b3          	and	a5,a3,a5
c0006418:	00030717          	auipc	a4,0x30
c000641c:	a2c72703          	lw	a4,-1492(a4) # c0035e44 <npage>
c0006420:	00c69693          	slli	a3,a3,0xc
c0006424:	42e7fc63          	bleu	a4,a5,c000685c <do_fork+0x4dc>
c0006428:	00030797          	auipc	a5,0x30
c000642c:	a247a783          	lw	a5,-1500(a5) # c0035e4c <current>
c0006430:	0187aa83          	lw	s5,24(a5)
c0006434:	00030797          	auipc	a5,0x30
c0006438:	ae47a783          	lw	a5,-1308(a5) # c0035f18 <va_pa_offset>
c000643c:	00f686b3          	add	a3,a3,a5
c0006440:	00d42623          	sw	a3,12(s0)
c0006444:	020a8e63          	beqz	s5,c0006480 <do_fork+0x100>
c0006448:	1009f993          	andi	s3,s3,256
c000644c:	2c098263          	beqz	s3,c0006710 <do_fork+0x390>
c0006450:	018aa783          	lw	a5,24(s5) # ffc00018 <sbi_remote_fence_i+0xffc00728>
c0006454:	00caa683          	lw	a3,12(s5)
c0006458:	c0000737          	lui	a4,0xc0000
c000645c:	00178793          	addi	a5,a5,1
c0006460:	00faac23          	sw	a5,24(s5)
c0006464:	01542c23          	sw	s5,24(s0)
c0006468:	3ce6ee63          	bltu	a3,a4,c0006844 <do_fork+0x4c4>
c000646c:	00030797          	auipc	a5,0x30
c0006470:	aac7a783          	lw	a5,-1364(a5) # c0035f18 <va_pa_offset>
c0006474:	40f686b3          	sub	a3,a3,a5
c0006478:	04d42c23          	sw	a3,88(s0)
c000647c:	00c42683          	lw	a3,12(s0)
c0006480:	00002737          	lui	a4,0x2
c0006484:	f7070713          	addi	a4,a4,-144 # 1f70 <_binary_obj___user_softint_out_size+0x4>
c0006488:	00e68733          	add	a4,a3,a4
c000648c:	00048613          	mv	a2,s1
c0006490:	04e42a23          	sw	a4,84(s0)
c0006494:	00070793          	mv	a5,a4
c0006498:	08048593          	addi	a1,s1,128
c000649c:	00062f83          	lw	t6,0(a2)
c00064a0:	00462f03          	lw	t5,4(a2)
c00064a4:	00862e83          	lw	t4,8(a2)
c00064a8:	00c62e03          	lw	t3,12(a2)
c00064ac:	01062303          	lw	t1,16(a2)
c00064b0:	01462883          	lw	a7,20(a2)
c00064b4:	01862803          	lw	a6,24(a2)
c00064b8:	01c62503          	lw	a0,28(a2)
c00064bc:	01f7a023          	sw	t6,0(a5)
c00064c0:	01e7a223          	sw	t5,4(a5)
c00064c4:	01d7a423          	sw	t4,8(a5)
c00064c8:	01c7a623          	sw	t3,12(a5)
c00064cc:	0067a823          	sw	t1,16(a5)
c00064d0:	0117aa23          	sw	a7,20(a5)
c00064d4:	0107ac23          	sw	a6,24(a5)
c00064d8:	00a7ae23          	sw	a0,28(a5)
c00064dc:	02060613          	addi	a2,a2,32
c00064e0:	02078793          	addi	a5,a5,32
c00064e4:	fab61ce3          	bne	a2,a1,c000649c <do_fork+0x11c>
c00064e8:	00062803          	lw	a6,0(a2)
c00064ec:	00462503          	lw	a0,4(a2)
c00064f0:	00862583          	lw	a1,8(a2)
c00064f4:	00c62603          	lw	a2,12(a2)
c00064f8:	0107a023          	sw	a6,0(a5)
c00064fc:	00a7a223          	sw	a0,4(a5)
c0006500:	00b7a423          	sw	a1,8(a5)
c0006504:	00c7a623          	sw	a2,12(a5)
c0006508:	02072423          	sw	zero,40(a4)
c000650c:	16090c63          	beqz	s2,c0006684 <do_fork+0x304>
c0006510:	01272423          	sw	s2,8(a4)
c0006514:	00000797          	auipc	a5,0x0
c0006518:	aec78793          	addi	a5,a5,-1300 # c0006000 <forkret>
c000651c:	00f42e23          	sw	a5,28(s0)
c0006520:	02e42023          	sw	a4,32(s0)
c0006524:	100027f3          	csrr	a5,sstatus
c0006528:	0027f793          	andi	a5,a5,2
c000652c:	00000913          	li	s2,0
c0006530:	18079263          	bnez	a5,c00066b4 <do_fork+0x334>
c0006534:	00026517          	auipc	a0,0x26
c0006538:	4e052503          	lw	a0,1248(a0) # c002ca14 <last_pid.1589>
c000653c:	00026e17          	auipc	t3,0x26
c0006540:	4d8e0e13          	addi	t3,t3,1240 # c002ca14 <last_pid.1589>
c0006544:	00150513          	addi	a0,a0,1
c0006548:	00ae2023          	sw	a0,0(t3)
c000654c:	000027b7          	lui	a5,0x2
c0006550:	18f54663          	blt	a0,a5,c00066dc <do_fork+0x35c>
c0006554:	00100513          	li	a0,1
c0006558:	00ae2023          	sw	a0,0(t3)
c000655c:	000027b7          	lui	a5,0x2
c0006560:	00026e97          	auipc	t4,0x26
c0006564:	4b8e8e93          	addi	t4,t4,1208 # c002ca18 <next_safe.1588>
c0006568:	00fea023          	sw	a5,0(t4)
c000656c:	00026817          	auipc	a6,0x26
c0006570:	4a882803          	lw	a6,1192(a6) # c002ca14 <last_pid.1589>
c0006574:	00000593          	li	a1,0
c0006578:	00030497          	auipc	s1,0x30
c000657c:	9ac48493          	addi	s1,s1,-1620 # c0035f24 <proc_list>
c0006580:	00078893          	mv	a7,a5
c0006584:	00100613          	li	a2,1
c0006588:	00058313          	mv	t1,a1
c000658c:	00088693          	mv	a3,a7
c0006590:	00030797          	auipc	a5,0x30
c0006594:	99478793          	addi	a5,a5,-1644 # c0035f24 <proc_list>
c0006598:	0047a783          	lw	a5,4(a5)
c000659c:	02978263          	beq	a5,s1,c00065c0 <do_fork+0x240>
c00065a0:	f947a703          	lw	a4,-108(a5)
c00065a4:	14a70863          	beq	a4,a0,c00066f4 <do_fork+0x374>
c00065a8:	fee558e3          	ble	a4,a0,c0006598 <do_fork+0x218>
c00065ac:	fed756e3          	ble	a3,a4,c0006598 <do_fork+0x218>
c00065b0:	0047a783          	lw	a5,4(a5)
c00065b4:	00070693          	mv	a3,a4
c00065b8:	00060313          	mv	t1,a2
c00065bc:	fe9792e3          	bne	a5,s1,c00065a0 <do_fork+0x220>
c00065c0:	2a059a63          	bnez	a1,c0006874 <do_fork+0x4f4>
c00065c4:	2a031c63          	bnez	t1,c000687c <do_fork+0x4fc>
c00065c8:	00a00593          	li	a1,10
c00065cc:	00a42223          	sw	a0,4(s0)
c00065d0:	321010ef          	jal	ra,c00080f0 <hash32>
c00065d4:	0002e797          	auipc	a5,0x2e
c00065d8:	84c78793          	addi	a5,a5,-1972 # c0033e20 <hash_list>
c00065dc:	00351513          	slli	a0,a0,0x3
c00065e0:	00a78533          	add	a0,a5,a0
c00065e4:	00452583          	lw	a1,4(a0)
c00065e8:	01442683          	lw	a3,20(s0)
c00065ec:	07840793          	addi	a5,s0,120
c00065f0:	00f5a023          	sw	a5,0(a1)
c00065f4:	00f52223          	sw	a5,4(a0)
c00065f8:	0886a703          	lw	a4,136(a3)
c00065fc:	00030617          	auipc	a2,0x30
c0006600:	92c62603          	lw	a2,-1748(a2) # c0035f28 <proc_list+0x4>
c0006604:	07040793          	addi	a5,s0,112
c0006608:	06b42e23          	sw	a1,124(s0)
c000660c:	06a42c23          	sw	a0,120(s0)
c0006610:	00f62023          	sw	a5,0(a2)
c0006614:	00f4a223          	sw	a5,4(s1)
c0006618:	06c42a23          	sw	a2,116(s0)
c000661c:	06942823          	sw	s1,112(s0)
c0006620:	08042623          	sw	zero,140(s0)
c0006624:	08e42823          	sw	a4,144(s0)
c0006628:	00070463          	beqz	a4,c0006630 <do_fork+0x2b0>
c000662c:	08872623          	sw	s0,140(a4)
c0006630:	00030797          	auipc	a5,0x30
c0006634:	8287a783          	lw	a5,-2008(a5) # c0035e58 <nr_process>
c0006638:	00178793          	addi	a5,a5,1
c000663c:	0886a423          	sw	s0,136(a3)
c0006640:	00030297          	auipc	t0,0x30
c0006644:	80f2ac23          	sw	a5,-2024(t0) # c0035e58 <nr_process>
c0006648:	0c091063          	bnez	s2,c0006708 <do_fork+0x388>
c000664c:	00040513          	mv	a0,s0
c0006650:	090010ef          	jal	ra,c00076e0 <wakeup_proc>
c0006654:	00442503          	lw	a0,4(s0)
c0006658:	02c12083          	lw	ra,44(sp)
c000665c:	02812403          	lw	s0,40(sp)
c0006660:	02412483          	lw	s1,36(sp)
c0006664:	02012903          	lw	s2,32(sp)
c0006668:	01c12983          	lw	s3,28(sp)
c000666c:	01812a03          	lw	s4,24(sp)
c0006670:	01412a83          	lw	s5,20(sp)
c0006674:	01012b03          	lw	s6,16(sp)
c0006678:	00c12b83          	lw	s7,12(sp)
c000667c:	03010113          	addi	sp,sp,48
c0006680:	00008067          	ret
c0006684:	00002937          	lui	s2,0x2
c0006688:	f6c90913          	addi	s2,s2,-148 # 1f6c <_binary_obj___user_softint_out_size>
c000668c:	01268933          	add	s2,a3,s2
c0006690:	01272423          	sw	s2,8(a4)
c0006694:	00000797          	auipc	a5,0x0
c0006698:	96c78793          	addi	a5,a5,-1684 # c0006000 <forkret>
c000669c:	00f42e23          	sw	a5,28(s0)
c00066a0:	02e42023          	sw	a4,32(s0)
c00066a4:	100027f3          	csrr	a5,sstatus
c00066a8:	0027f793          	andi	a5,a5,2
c00066ac:	00000913          	li	s2,0
c00066b0:	e80782e3          	beqz	a5,c0006534 <do_fork+0x1b4>
c00066b4:	96cfa0ef          	jal	ra,c0000820 <intr_disable>
c00066b8:	00026517          	auipc	a0,0x26
c00066bc:	35c52503          	lw	a0,860(a0) # c002ca14 <last_pid.1589>
c00066c0:	00026e17          	auipc	t3,0x26
c00066c4:	354e0e13          	addi	t3,t3,852 # c002ca14 <last_pid.1589>
c00066c8:	00150513          	addi	a0,a0,1
c00066cc:	00ae2023          	sw	a0,0(t3)
c00066d0:	000027b7          	lui	a5,0x2
c00066d4:	00100913          	li	s2,1
c00066d8:	e6f55ee3          	ble	a5,a0,c0006554 <do_fork+0x1d4>
c00066dc:	00026797          	auipc	a5,0x26
c00066e0:	33c7a783          	lw	a5,828(a5) # c002ca18 <next_safe.1588>
c00066e4:	00030497          	auipc	s1,0x30
c00066e8:	84048493          	addi	s1,s1,-1984 # c0035f24 <proc_list>
c00066ec:	e6f558e3          	ble	a5,a0,c000655c <do_fork+0x1dc>
c00066f0:	ed9ff06f          	j	c00065c8 <do_fork+0x248>
c00066f4:	00150513          	addi	a0,a0,1
c00066f8:	0ed55463          	ble	a3,a0,c00067e0 <do_fork+0x460>
c00066fc:	00050813          	mv	a6,a0
c0006700:	00060593          	mv	a1,a2
c0006704:	e95ff06f          	j	c0006598 <do_fork+0x218>
c0006708:	910fa0ef          	jal	ra,c0000818 <intr_enable>
c000670c:	f41ff06f          	j	c000664c <do_fork+0x2cc>
c0006710:	99dfa0ef          	jal	ra,c00010ac <mm_create>
c0006714:	00050b93          	mv	s7,a0
c0006718:	06050a63          	beqz	a0,c000678c <do_fork+0x40c>
c000671c:	a11ff0ef          	jal	ra,c000612c <setup_pgdir>
c0006720:	06051263          	bnez	a0,c0006784 <do_fork+0x404>
c0006724:	01ca8993          	addi	s3,s5,28
c0006728:	00100793          	li	a5,1
c000672c:	40f9a7af          	amoor.w	a5,a5,(s3)
c0006730:	0017f793          	andi	a5,a5,1
c0006734:	00100b13          	li	s6,1
c0006738:	00078a63          	beqz	a5,c000674c <do_fork+0x3cc>
c000673c:	060010ef          	jal	ra,c000779c <schedule>
c0006740:	4169a7af          	amoor.w	a5,s6,(s3)
c0006744:	0017f793          	andi	a5,a5,1
c0006748:	fe079ae3          	bnez	a5,c000673c <do_fork+0x3bc>
c000674c:	000a8593          	mv	a1,s5
c0006750:	000b8513          	mv	a0,s7
c0006754:	ce1fa0ef          	jal	ra,c0001434 <dup_mmap>
c0006758:	ffe00793          	li	a5,-2
c000675c:	60f9a7af          	amoand.w	a5,a5,(s3)
c0006760:	0017f793          	andi	a5,a5,1
c0006764:	0c078463          	beqz	a5,c000682c <do_fork+0x4ac>
c0006768:	00051663          	bnez	a0,c0006774 <do_fork+0x3f4>
c000676c:	000b8a93          	mv	s5,s7
c0006770:	ce1ff06f          	j	c0006450 <do_fork+0xd0>
c0006774:	000b8513          	mv	a0,s7
c0006778:	da9fa0ef          	jal	ra,c0001520 <exit_mmap>
c000677c:	000b8513          	mv	a0,s7
c0006780:	921ff0ef          	jal	ra,c00060a0 <put_pgdir>
c0006784:	000b8513          	mv	a0,s7
c0006788:	b39fa0ef          	jal	ra,c00012c0 <mm_destroy>
c000678c:	00c42683          	lw	a3,12(s0)
c0006790:	c00007b7          	lui	a5,0xc0000
c0006794:	08f6e063          	bltu	a3,a5,c0006814 <do_fork+0x494>
c0006798:	0002f797          	auipc	a5,0x2f
c000679c:	7807a783          	lw	a5,1920(a5) # c0035f18 <va_pa_offset>
c00067a0:	40f687b3          	sub	a5,a3,a5
c00067a4:	00c7d793          	srli	a5,a5,0xc
c00067a8:	0002f717          	auipc	a4,0x2f
c00067ac:	69c72703          	lw	a4,1692(a4) # c0035e44 <npage>
c00067b0:	04e7f663          	bleu	a4,a5,c00067fc <do_fork+0x47c>
c00067b4:	414787b3          	sub	a5,a5,s4
c00067b8:	00579793          	slli	a5,a5,0x5
c00067bc:	0002f517          	auipc	a0,0x2f
c00067c0:	76452503          	lw	a0,1892(a0) # c0035f20 <pages>
c00067c4:	00200593          	li	a1,2
c00067c8:	00f50533          	add	a0,a0,a5
c00067cc:	9b5fd0ef          	jal	ra,c0004180 <free_pages>
c00067d0:	00040513          	mv	a0,s0
c00067d4:	ef9fb0ef          	jal	ra,c00026cc <kfree>
c00067d8:	ffc00513          	li	a0,-4
c00067dc:	e7dff06f          	j	c0006658 <do_fork+0x2d8>
c00067e0:	01154463          	blt	a0,a7,c00067e8 <do_fork+0x468>
c00067e4:	00100513          	li	a0,1
c00067e8:	00060593          	mv	a1,a2
c00067ec:	00050813          	mv	a6,a0
c00067f0:	d99ff06f          	j	c0006588 <do_fork+0x208>
c00067f4:	ffb00513          	li	a0,-5
c00067f8:	00008067          	ret
c00067fc:	00002617          	auipc	a2,0x2
c0006800:	4b460613          	addi	a2,a2,1204 # c0008cb0 <commands+0xa60>
c0006804:	06200593          	li	a1,98
c0006808:	00002517          	auipc	a0,0x2
c000680c:	4c850513          	addi	a0,a0,1224 # c0008cd0 <commands+0xa80>
c0006810:	a3df90ef          	jal	ra,c000024c <__panic>
c0006814:	00002617          	auipc	a2,0x2
c0006818:	72860613          	addi	a2,a2,1832 # c0008f3c <commands+0xcec>
c000681c:	06e00593          	li	a1,110
c0006820:	00002517          	auipc	a0,0x2
c0006824:	4b050513          	addi	a0,a0,1200 # c0008cd0 <commands+0xa80>
c0006828:	a25f90ef          	jal	ra,c000024c <__panic>
c000682c:	00003617          	auipc	a2,0x3
c0006830:	73c60613          	addi	a2,a2,1852 # c0009f68 <default_pmm_manager+0x8f0>
c0006834:	03100593          	li	a1,49
c0006838:	00003517          	auipc	a0,0x3
c000683c:	74050513          	addi	a0,a0,1856 # c0009f78 <default_pmm_manager+0x900>
c0006840:	a0df90ef          	jal	ra,c000024c <__panic>
c0006844:	00002617          	auipc	a2,0x2
c0006848:	6f860613          	addi	a2,a2,1784 # c0008f3c <commands+0xcec>
c000684c:	15d00593          	li	a1,349
c0006850:	00004517          	auipc	a0,0x4
c0006854:	95050513          	addi	a0,a0,-1712 # c000a1a0 <default_pmm_manager+0xb28>
c0006858:	9f5f90ef          	jal	ra,c000024c <__panic>
c000685c:	00002617          	auipc	a2,0x2
c0006860:	6bc60613          	addi	a2,a2,1724 # c0008f18 <commands+0xcc8>
c0006864:	06900593          	li	a1,105
c0006868:	00002517          	auipc	a0,0x2
c000686c:	46850513          	addi	a0,a0,1128 # c0008cd0 <commands+0xa80>
c0006870:	9ddf90ef          	jal	ra,c000024c <__panic>
c0006874:	010e2023          	sw	a6,0(t3)
c0006878:	d4dff06f          	j	c00065c4 <do_fork+0x244>
c000687c:	00dea023          	sw	a3,0(t4)
c0006880:	d49ff06f          	j	c00065c8 <do_fork+0x248>
c0006884:	00003697          	auipc	a3,0x3
c0006888:	6c868693          	addi	a3,a3,1736 # c0009f4c <default_pmm_manager+0x8d4>
c000688c:	00002617          	auipc	a2,0x2
c0006890:	da860613          	addi	a2,a2,-600 # c0008634 <commands+0x3e4>
c0006894:	1aa00593          	li	a1,426
c0006898:	00004517          	auipc	a0,0x4
c000689c:	90850513          	addi	a0,a0,-1784 # c000a1a0 <default_pmm_manager+0xb28>
c00068a0:	9adf90ef          	jal	ra,c000024c <__panic>

c00068a4 <kernel_thread>:
c00068a4:	f6010113          	addi	sp,sp,-160
c00068a8:	08812c23          	sw	s0,152(sp)
c00068ac:	08912a23          	sw	s1,148(sp)
c00068b0:	09212823          	sw	s2,144(sp)
c00068b4:	00058493          	mv	s1,a1
c00068b8:	00050913          	mv	s2,a0
c00068bc:	00060413          	mv	s0,a2
c00068c0:	00000593          	li	a1,0
c00068c4:	09000613          	li	a2,144
c00068c8:	00010513          	mv	a0,sp
c00068cc:	08112e23          	sw	ra,156(sp)
c00068d0:	1ec010ef          	jal	ra,c0007abc <memset>
c00068d4:	03212023          	sw	s2,32(sp)
c00068d8:	02912223          	sw	s1,36(sp)
c00068dc:	100027f3          	csrr	a5,sstatus
c00068e0:	edd7f793          	andi	a5,a5,-291
c00068e4:	1207e793          	ori	a5,a5,288
c00068e8:	08f12023          	sw	a5,128(sp)
c00068ec:	00010613          	mv	a2,sp
c00068f0:	10046513          	ori	a0,s0,256
c00068f4:	fffff797          	auipc	a5,0xfffff
c00068f8:	66c78793          	addi	a5,a5,1644 # c0005f60 <kernel_thread_entry>
c00068fc:	00000593          	li	a1,0
c0006900:	08f12223          	sw	a5,132(sp)
c0006904:	a7dff0ef          	jal	ra,c0006380 <do_fork>
c0006908:	09c12083          	lw	ra,156(sp)
c000690c:	09812403          	lw	s0,152(sp)
c0006910:	09412483          	lw	s1,148(sp)
c0006914:	09012903          	lw	s2,144(sp)
c0006918:	0a010113          	addi	sp,sp,160
c000691c:	00008067          	ret

c0006920 <do_exit>:
c0006920:	ff010113          	addi	sp,sp,-16
c0006924:	00112623          	sw	ra,12(sp)
c0006928:	00812423          	sw	s0,8(sp)
c000692c:	00912223          	sw	s1,4(sp)
c0006930:	01212023          	sw	s2,0(sp)
c0006934:	0002f697          	auipc	a3,0x2f
c0006938:	5186a683          	lw	a3,1304(a3) # c0035e4c <current>
c000693c:	0002f797          	auipc	a5,0x2f
c0006940:	5147a783          	lw	a5,1300(a5) # c0035e50 <idleproc>
c0006944:	14f68663          	beq	a3,a5,c0006a90 <do_exit+0x170>
c0006948:	0002f797          	auipc	a5,0x2f
c000694c:	50c7a783          	lw	a5,1292(a5) # c0035e54 <initproc>
c0006950:	14f68c63          	beq	a3,a5,c0006aa8 <do_exit+0x188>
c0006954:	0186a403          	lw	s0,24(a3)
c0006958:	00050493          	mv	s1,a0
c000695c:	02040463          	beqz	s0,c0006984 <do_exit+0x64>
c0006960:	0002f797          	auipc	a5,0x2f
c0006964:	5bc7a783          	lw	a5,1468(a5) # c0035f1c <boot_cr3>
c0006968:	00c7d793          	srli	a5,a5,0xc
c000696c:	18079073          	csrw	sptbr,a5
c0006970:	01842783          	lw	a5,24(s0)
c0006974:	fff78793          	addi	a5,a5,-1
c0006978:	00f42c23          	sw	a5,24(s0)
c000697c:	0c078263          	beqz	a5,c0006a40 <do_exit+0x120>
c0006980:	0006ac23          	sw	zero,24(a3)
c0006984:	00300793          	li	a5,3
c0006988:	00f6a023          	sw	a5,0(a3)
c000698c:	0896a023          	sw	s1,128(a3)
c0006990:	100027f3          	csrr	a5,sstatus
c0006994:	0027f793          	andi	a5,a5,2
c0006998:	00000913          	li	s2,0
c000699c:	0c079463          	bnez	a5,c0006a64 <do_exit+0x144>
c00069a0:	0146a503          	lw	a0,20(a3)
c00069a4:	800007b7          	lui	a5,0x80000
c00069a8:	00178793          	addi	a5,a5,1 # 80000001 <sbi_remote_fence_i+0x80000711>
c00069ac:	08452703          	lw	a4,132(a0)
c00069b0:	0cf70863          	beq	a4,a5,c0006a80 <do_exit+0x160>
c00069b4:	800004b7          	lui	s1,0x80000
c00069b8:	00300413          	li	s0,3
c00069bc:	00148493          	addi	s1,s1,1 # 80000001 <sbi_remote_fence_i+0x80000711>
c00069c0:	0886a783          	lw	a5,136(a3)
c00069c4:	04078863          	beqz	a5,c0006a14 <do_exit+0xf4>
c00069c8:	0907a703          	lw	a4,144(a5)
c00069cc:	0002f517          	auipc	a0,0x2f
c00069d0:	48852503          	lw	a0,1160(a0) # c0035e54 <initproc>
c00069d4:	08e6a423          	sw	a4,136(a3)
c00069d8:	08852703          	lw	a4,136(a0)
c00069dc:	0807a623          	sw	zero,140(a5)
c00069e0:	08e7a823          	sw	a4,144(a5)
c00069e4:	00070463          	beqz	a4,c00069ec <do_exit+0xcc>
c00069e8:	08f72623          	sw	a5,140(a4)
c00069ec:	0007a703          	lw	a4,0(a5)
c00069f0:	00a7aa23          	sw	a0,20(a5)
c00069f4:	08f52423          	sw	a5,136(a0)
c00069f8:	fc8714e3          	bne	a4,s0,c00069c0 <do_exit+0xa0>
c00069fc:	08452783          	lw	a5,132(a0)
c0006a00:	fc9790e3          	bne	a5,s1,c00069c0 <do_exit+0xa0>
c0006a04:	4dd000ef          	jal	ra,c00076e0 <wakeup_proc>
c0006a08:	0002f697          	auipc	a3,0x2f
c0006a0c:	4446a683          	lw	a3,1092(a3) # c0035e4c <current>
c0006a10:	fb1ff06f          	j	c00069c0 <do_exit+0xa0>
c0006a14:	06091263          	bnez	s2,c0006a78 <do_exit+0x158>
c0006a18:	585000ef          	jal	ra,c000779c <schedule>
c0006a1c:	0002f797          	auipc	a5,0x2f
c0006a20:	4307a783          	lw	a5,1072(a5) # c0035e4c <current>
c0006a24:	0047a683          	lw	a3,4(a5)
c0006a28:	00003617          	auipc	a2,0x3
c0006a2c:	50460613          	addi	a2,a2,1284 # c0009f2c <default_pmm_manager+0x8b4>
c0006a30:	1fd00593          	li	a1,509
c0006a34:	00003517          	auipc	a0,0x3
c0006a38:	76c50513          	addi	a0,a0,1900 # c000a1a0 <default_pmm_manager+0xb28>
c0006a3c:	811f90ef          	jal	ra,c000024c <__panic>
c0006a40:	00040513          	mv	a0,s0
c0006a44:	addfa0ef          	jal	ra,c0001520 <exit_mmap>
c0006a48:	00040513          	mv	a0,s0
c0006a4c:	e54ff0ef          	jal	ra,c00060a0 <put_pgdir>
c0006a50:	00040513          	mv	a0,s0
c0006a54:	86dfa0ef          	jal	ra,c00012c0 <mm_destroy>
c0006a58:	0002f697          	auipc	a3,0x2f
c0006a5c:	3f46a683          	lw	a3,1012(a3) # c0035e4c <current>
c0006a60:	f21ff06f          	j	c0006980 <do_exit+0x60>
c0006a64:	dbdf90ef          	jal	ra,c0000820 <intr_disable>
c0006a68:	00100913          	li	s2,1
c0006a6c:	0002f697          	auipc	a3,0x2f
c0006a70:	3e06a683          	lw	a3,992(a3) # c0035e4c <current>
c0006a74:	f2dff06f          	j	c00069a0 <do_exit+0x80>
c0006a78:	da1f90ef          	jal	ra,c0000818 <intr_enable>
c0006a7c:	f9dff06f          	j	c0006a18 <do_exit+0xf8>
c0006a80:	461000ef          	jal	ra,c00076e0 <wakeup_proc>
c0006a84:	0002f697          	auipc	a3,0x2f
c0006a88:	3c86a683          	lw	a3,968(a3) # c0035e4c <current>
c0006a8c:	f29ff06f          	j	c00069b4 <do_exit+0x94>
c0006a90:	00003617          	auipc	a2,0x3
c0006a94:	47c60613          	addi	a2,a2,1148 # c0009f0c <default_pmm_manager+0x894>
c0006a98:	1d100593          	li	a1,465
c0006a9c:	00003517          	auipc	a0,0x3
c0006aa0:	70450513          	addi	a0,a0,1796 # c000a1a0 <default_pmm_manager+0xb28>
c0006aa4:	fa8f90ef          	jal	ra,c000024c <__panic>
c0006aa8:	00003617          	auipc	a2,0x3
c0006aac:	47460613          	addi	a2,a2,1140 # c0009f1c <default_pmm_manager+0x8a4>
c0006ab0:	1d400593          	li	a1,468
c0006ab4:	00003517          	auipc	a0,0x3
c0006ab8:	6ec50513          	addi	a0,a0,1772 # c000a1a0 <default_pmm_manager+0xb28>
c0006abc:	f90f90ef          	jal	ra,c000024c <__panic>

c0006ac0 <do_wait.part.1>:
c0006ac0:	fe010113          	addi	sp,sp,-32
c0006ac4:	01212823          	sw	s2,16(sp)
c0006ac8:	01512223          	sw	s5,4(sp)
c0006acc:	80000937          	lui	s2,0x80000
c0006ad0:	00100a93          	li	s5,1
c0006ad4:	00912a23          	sw	s1,20(sp)
c0006ad8:	01312623          	sw	s3,12(sp)
c0006adc:	01412423          	sw	s4,8(sp)
c0006ae0:	00112e23          	sw	ra,28(sp)
c0006ae4:	00812c23          	sw	s0,24(sp)
c0006ae8:	00050993          	mv	s3,a0
c0006aec:	00058a13          	mv	s4,a1
c0006af0:	00300493          	li	s1,3
c0006af4:	01590933          	add	s2,s2,s5
c0006af8:	12099663          	bnez	s3,c0006c24 <do_wait.part.1+0x164>
c0006afc:	0002f717          	auipc	a4,0x2f
c0006b00:	35072703          	lw	a4,848(a4) # c0035e4c <current>
c0006b04:	08872403          	lw	s0,136(a4)
c0006b08:	00041863          	bnez	s0,c0006b18 <do_wait.part.1+0x58>
c0006b0c:	17c0006f          	j	c0006c88 <do_wait.part.1+0x1c8>
c0006b10:	09042403          	lw	s0,144(s0)
c0006b14:	12040c63          	beqz	s0,c0006c4c <do_wait.part.1+0x18c>
c0006b18:	00042783          	lw	a5,0(s0)
c0006b1c:	fe979ae3          	bne	a5,s1,c0006b10 <do_wait.part.1+0x50>
c0006b20:	0002f797          	auipc	a5,0x2f
c0006b24:	3307a783          	lw	a5,816(a5) # c0035e50 <idleproc>
c0006b28:	18878663          	beq	a5,s0,c0006cb4 <do_wait.part.1+0x1f4>
c0006b2c:	0002f797          	auipc	a5,0x2f
c0006b30:	3287a783          	lw	a5,808(a5) # c0035e54 <initproc>
c0006b34:	18f40063          	beq	s0,a5,c0006cb4 <do_wait.part.1+0x1f4>
c0006b38:	000a0663          	beqz	s4,c0006b44 <do_wait.part.1+0x84>
c0006b3c:	08042783          	lw	a5,128(s0)
c0006b40:	00fa2023          	sw	a5,0(s4)
c0006b44:	100027f3          	csrr	a5,sstatus
c0006b48:	0027f793          	andi	a5,a5,2
c0006b4c:	00000613          	li	a2,0
c0006b50:	12079263          	bnez	a5,c0006c74 <do_wait.part.1+0x1b4>
c0006b54:	07842683          	lw	a3,120(s0)
c0006b58:	07c42703          	lw	a4,124(s0)
c0006b5c:	09042783          	lw	a5,144(s0)
c0006b60:	00e6a223          	sw	a4,4(a3)
c0006b64:	00d72023          	sw	a3,0(a4)
c0006b68:	07042683          	lw	a3,112(s0)
c0006b6c:	07442703          	lw	a4,116(s0)
c0006b70:	00e6a223          	sw	a4,4(a3)
c0006b74:	00d72023          	sw	a3,0(a4)
c0006b78:	00078663          	beqz	a5,c0006b84 <do_wait.part.1+0xc4>
c0006b7c:	08c42703          	lw	a4,140(s0)
c0006b80:	08e7a623          	sw	a4,140(a5)
c0006b84:	08c42703          	lw	a4,140(s0)
c0006b88:	10070463          	beqz	a4,c0006c90 <do_wait.part.1+0x1d0>
c0006b8c:	08f72823          	sw	a5,144(a4)
c0006b90:	0002f797          	auipc	a5,0x2f
c0006b94:	2c87a783          	lw	a5,712(a5) # c0035e58 <nr_process>
c0006b98:	fff78793          	addi	a5,a5,-1
c0006b9c:	0002f297          	auipc	t0,0x2f
c0006ba0:	2af2ae23          	sw	a5,700(t0) # c0035e58 <nr_process>
c0006ba4:	0c061e63          	bnez	a2,c0006c80 <do_wait.part.1+0x1c0>
c0006ba8:	00c42683          	lw	a3,12(s0)
c0006bac:	c00007b7          	lui	a5,0xc0000
c0006bb0:	0ef6e663          	bltu	a3,a5,c0006c9c <do_wait.part.1+0x1dc>
c0006bb4:	0002f797          	auipc	a5,0x2f
c0006bb8:	3647a783          	lw	a5,868(a5) # c0035f18 <va_pa_offset>
c0006bbc:	40f686b3          	sub	a3,a3,a5
c0006bc0:	00c6d693          	srli	a3,a3,0xc
c0006bc4:	0002f797          	auipc	a5,0x2f
c0006bc8:	2807a783          	lw	a5,640(a5) # c0035e44 <npage>
c0006bcc:	10f6f063          	bleu	a5,a3,c0006ccc <do_wait.part.1+0x20c>
c0006bd0:	00026517          	auipc	a0,0x26
c0006bd4:	e4052503          	lw	a0,-448(a0) # c002ca10 <nbase>
c0006bd8:	40a686b3          	sub	a3,a3,a0
c0006bdc:	00569693          	slli	a3,a3,0x5
c0006be0:	0002f517          	auipc	a0,0x2f
c0006be4:	34052503          	lw	a0,832(a0) # c0035f20 <pages>
c0006be8:	00d50533          	add	a0,a0,a3
c0006bec:	00200593          	li	a1,2
c0006bf0:	d90fd0ef          	jal	ra,c0004180 <free_pages>
c0006bf4:	00040513          	mv	a0,s0
c0006bf8:	ad5fb0ef          	jal	ra,c00026cc <kfree>
c0006bfc:	00000513          	li	a0,0
c0006c00:	01c12083          	lw	ra,28(sp)
c0006c04:	01812403          	lw	s0,24(sp)
c0006c08:	01412483          	lw	s1,20(sp)
c0006c0c:	01012903          	lw	s2,16(sp)
c0006c10:	00c12983          	lw	s3,12(sp)
c0006c14:	00812a03          	lw	s4,8(sp)
c0006c18:	00412a83          	lw	s5,4(sp)
c0006c1c:	02010113          	addi	sp,sp,32
c0006c20:	00008067          	ret
c0006c24:	00098513          	mv	a0,s3
c0006c28:	ed8ff0ef          	jal	ra,c0006300 <find_proc>
c0006c2c:	00050413          	mv	s0,a0
c0006c30:	04050c63          	beqz	a0,c0006c88 <do_wait.part.1+0x1c8>
c0006c34:	01452703          	lw	a4,20(a0)
c0006c38:	0002f797          	auipc	a5,0x2f
c0006c3c:	2147a783          	lw	a5,532(a5) # c0035e4c <current>
c0006c40:	04f71463          	bne	a4,a5,c0006c88 <do_wait.part.1+0x1c8>
c0006c44:	00052783          	lw	a5,0(a0)
c0006c48:	ec978ce3          	beq	a5,s1,c0006b20 <do_wait.part.1+0x60>
c0006c4c:	01572023          	sw	s5,0(a4)
c0006c50:	09272223          	sw	s2,132(a4)
c0006c54:	349000ef          	jal	ra,c000779c <schedule>
c0006c58:	0002f797          	auipc	a5,0x2f
c0006c5c:	1f47a783          	lw	a5,500(a5) # c0035e4c <current>
c0006c60:	05c7a783          	lw	a5,92(a5)
c0006c64:	0017f793          	andi	a5,a5,1
c0006c68:	e80788e3          	beqz	a5,c0006af8 <do_wait.part.1+0x38>
c0006c6c:	ff700513          	li	a0,-9
c0006c70:	cb1ff0ef          	jal	ra,c0006920 <do_exit>
c0006c74:	badf90ef          	jal	ra,c0000820 <intr_disable>
c0006c78:	00100613          	li	a2,1
c0006c7c:	ed9ff06f          	j	c0006b54 <do_wait.part.1+0x94>
c0006c80:	b99f90ef          	jal	ra,c0000818 <intr_enable>
c0006c84:	f25ff06f          	j	c0006ba8 <do_wait.part.1+0xe8>
c0006c88:	ffe00513          	li	a0,-2
c0006c8c:	f75ff06f          	j	c0006c00 <do_wait.part.1+0x140>
c0006c90:	01442703          	lw	a4,20(s0)
c0006c94:	08f72423          	sw	a5,136(a4)
c0006c98:	ef9ff06f          	j	c0006b90 <do_wait.part.1+0xd0>
c0006c9c:	00002617          	auipc	a2,0x2
c0006ca0:	2a060613          	addi	a2,a2,672 # c0008f3c <commands+0xcec>
c0006ca4:	06e00593          	li	a1,110
c0006ca8:	00002517          	auipc	a0,0x2
c0006cac:	02850513          	addi	a0,a0,40 # c0008cd0 <commands+0xa80>
c0006cb0:	d9cf90ef          	jal	ra,c000024c <__panic>
c0006cb4:	00003617          	auipc	a2,0x3
c0006cb8:	2d860613          	addi	a2,a2,728 # c0009f8c <default_pmm_manager+0x914>
c0006cbc:	2f900593          	li	a1,761
c0006cc0:	00003517          	auipc	a0,0x3
c0006cc4:	4e050513          	addi	a0,a0,1248 # c000a1a0 <default_pmm_manager+0xb28>
c0006cc8:	d84f90ef          	jal	ra,c000024c <__panic>
c0006ccc:	00002617          	auipc	a2,0x2
c0006cd0:	fe460613          	addi	a2,a2,-28 # c0008cb0 <commands+0xa60>
c0006cd4:	06200593          	li	a1,98
c0006cd8:	00002517          	auipc	a0,0x2
c0006cdc:	ff850513          	addi	a0,a0,-8 # c0008cd0 <commands+0xa80>
c0006ce0:	d6cf90ef          	jal	ra,c000024c <__panic>

c0006ce4 <init_main>:
c0006ce4:	ff010113          	addi	sp,sp,-16
c0006ce8:	00112623          	sw	ra,12(sp)
c0006cec:	cf8fd0ef          	jal	ra,c00041e4 <nr_free_pages>
c0006cf0:	8b5fb0ef          	jal	ra,c00025a4 <kallocated>
c0006cf4:	00000613          	li	a2,0
c0006cf8:	00000593          	li	a1,0
c0006cfc:	fffff517          	auipc	a0,0xfffff
c0006d00:	31450513          	addi	a0,a0,788 # c0006010 <user_main>
c0006d04:	ba1ff0ef          	jal	ra,c00068a4 <kernel_thread>
c0006d08:	00a04663          	bgtz	a0,c0006d14 <init_main+0x30>
c0006d0c:	0ac0006f          	j	c0006db8 <init_main+0xd4>
c0006d10:	28d000ef          	jal	ra,c000779c <schedule>
c0006d14:	00000593          	li	a1,0
c0006d18:	00000513          	li	a0,0
c0006d1c:	da5ff0ef          	jal	ra,c0006ac0 <do_wait.part.1>
c0006d20:	fe0508e3          	beqz	a0,c0006d10 <init_main+0x2c>
c0006d24:	00003517          	auipc	a0,0x3
c0006d28:	2a050513          	addi	a0,a0,672 # c0009fc4 <default_pmm_manager+0x94c>
c0006d2c:	bacf90ef          	jal	ra,c00000d8 <cprintf>
c0006d30:	0002f797          	auipc	a5,0x2f
c0006d34:	1247a783          	lw	a5,292(a5) # c0035e54 <initproc>
c0006d38:	0887a703          	lw	a4,136(a5)
c0006d3c:	04071e63          	bnez	a4,c0006d98 <init_main+0xb4>
c0006d40:	08c7a703          	lw	a4,140(a5)
c0006d44:	04071a63          	bnez	a4,c0006d98 <init_main+0xb4>
c0006d48:	0907a703          	lw	a4,144(a5)
c0006d4c:	04071663          	bnez	a4,c0006d98 <init_main+0xb4>
c0006d50:	0002f697          	auipc	a3,0x2f
c0006d54:	1086a683          	lw	a3,264(a3) # c0035e58 <nr_process>
c0006d58:	00200713          	li	a4,2
c0006d5c:	0ae69a63          	bne	a3,a4,c0006e10 <init_main+0x12c>
c0006d60:	07078793          	addi	a5,a5,112
c0006d64:	0002f717          	auipc	a4,0x2f
c0006d68:	1c472703          	lw	a4,452(a4) # c0035f28 <proc_list+0x4>
c0006d6c:	08e79263          	bne	a5,a4,c0006df0 <init_main+0x10c>
c0006d70:	0002f717          	auipc	a4,0x2f
c0006d74:	1b472703          	lw	a4,436(a4) # c0035f24 <proc_list>
c0006d78:	04f71c63          	bne	a4,a5,c0006dd0 <init_main+0xec>
c0006d7c:	00003517          	auipc	a0,0x3
c0006d80:	32850513          	addi	a0,a0,808 # c000a0a4 <default_pmm_manager+0xa2c>
c0006d84:	b54f90ef          	jal	ra,c00000d8 <cprintf>
c0006d88:	00c12083          	lw	ra,12(sp)
c0006d8c:	00000513          	li	a0,0
c0006d90:	01010113          	addi	sp,sp,16
c0006d94:	00008067          	ret
c0006d98:	00003697          	auipc	a3,0x3
c0006d9c:	25068693          	addi	a3,a3,592 # c0009fe8 <default_pmm_manager+0x970>
c0006da0:	00002617          	auipc	a2,0x2
c0006da4:	89460613          	addi	a2,a2,-1900 # c0008634 <commands+0x3e4>
c0006da8:	36c00593          	li	a1,876
c0006dac:	00003517          	auipc	a0,0x3
c0006db0:	3f450513          	addi	a0,a0,1012 # c000a1a0 <default_pmm_manager+0xb28>
c0006db4:	c98f90ef          	jal	ra,c000024c <__panic>
c0006db8:	00003617          	auipc	a2,0x3
c0006dbc:	1f060613          	addi	a2,a2,496 # c0009fa8 <default_pmm_manager+0x930>
c0006dc0:	36400593          	li	a1,868
c0006dc4:	00003517          	auipc	a0,0x3
c0006dc8:	3dc50513          	addi	a0,a0,988 # c000a1a0 <default_pmm_manager+0xb28>
c0006dcc:	c80f90ef          	jal	ra,c000024c <__panic>
c0006dd0:	00003697          	auipc	a3,0x3
c0006dd4:	2a468693          	addi	a3,a3,676 # c000a074 <default_pmm_manager+0x9fc>
c0006dd8:	00002617          	auipc	a2,0x2
c0006ddc:	85c60613          	addi	a2,a2,-1956 # c0008634 <commands+0x3e4>
c0006de0:	36f00593          	li	a1,879
c0006de4:	00003517          	auipc	a0,0x3
c0006de8:	3bc50513          	addi	a0,a0,956 # c000a1a0 <default_pmm_manager+0xb28>
c0006dec:	c60f90ef          	jal	ra,c000024c <__panic>
c0006df0:	00003697          	auipc	a3,0x3
c0006df4:	25468693          	addi	a3,a3,596 # c000a044 <default_pmm_manager+0x9cc>
c0006df8:	00002617          	auipc	a2,0x2
c0006dfc:	83c60613          	addi	a2,a2,-1988 # c0008634 <commands+0x3e4>
c0006e00:	36e00593          	li	a1,878
c0006e04:	00003517          	auipc	a0,0x3
c0006e08:	39c50513          	addi	a0,a0,924 # c000a1a0 <default_pmm_manager+0xb28>
c0006e0c:	c40f90ef          	jal	ra,c000024c <__panic>
c0006e10:	00003697          	auipc	a3,0x3
c0006e14:	22468693          	addi	a3,a3,548 # c000a034 <default_pmm_manager+0x9bc>
c0006e18:	00002617          	auipc	a2,0x2
c0006e1c:	81c60613          	addi	a2,a2,-2020 # c0008634 <commands+0x3e4>
c0006e20:	36d00593          	li	a1,877
c0006e24:	00003517          	auipc	a0,0x3
c0006e28:	37c50513          	addi	a0,a0,892 # c000a1a0 <default_pmm_manager+0xb28>
c0006e2c:	c20f90ef          	jal	ra,c000024c <__panic>

c0006e30 <do_execve>:
c0006e30:	fa010113          	addi	sp,sp,-96
c0006e34:	0002f797          	auipc	a5,0x2f
c0006e38:	0187a783          	lw	a5,24(a5) # c0035e4c <current>
c0006e3c:	05212823          	sw	s2,80(sp)
c0006e40:	0187a903          	lw	s2,24(a5)
c0006e44:	04912a23          	sw	s1,84(sp)
c0006e48:	05312623          	sw	s3,76(sp)
c0006e4c:	03912a23          	sw	s9,52(sp)
c0006e50:	00050993          	mv	s3,a0
c0006e54:	00058493          	mv	s1,a1
c0006e58:	00060c93          	mv	s9,a2
c0006e5c:	00000693          	li	a3,0
c0006e60:	00058613          	mv	a2,a1
c0006e64:	00050593          	mv	a1,a0
c0006e68:	00090513          	mv	a0,s2
c0006e6c:	04112e23          	sw	ra,92(sp)
c0006e70:	04812c23          	sw	s0,88(sp)
c0006e74:	05412423          	sw	s4,72(sp)
c0006e78:	05512223          	sw	s5,68(sp)
c0006e7c:	05612023          	sw	s6,64(sp)
c0006e80:	03712e23          	sw	s7,60(sp)
c0006e84:	03812c23          	sw	s8,56(sp)
c0006e88:	03a12823          	sw	s10,48(sp)
c0006e8c:	03b12623          	sw	s11,44(sp)
c0006e90:	e3dfa0ef          	jal	ra,c0001ccc <user_mem_check>
c0006e94:	4e050e63          	beqz	a0,c0007390 <do_execve+0x560>
c0006e98:	01000613          	li	a2,16
c0006e9c:	00c10533          	add	a0,sp,a2
c0006ea0:	00000593          	li	a1,0
c0006ea4:	419000ef          	jal	ra,c0007abc <memset>
c0006ea8:	00f00793          	li	a5,15
c0006eac:	00048613          	mv	a2,s1
c0006eb0:	0897e063          	bltu	a5,s1,c0006f30 <do_execve+0x100>
c0006eb4:	00098593          	mv	a1,s3
c0006eb8:	01010513          	addi	a0,sp,16
c0006ebc:	41d000ef          	jal	ra,c0007ad8 <memcpy>
c0006ec0:	08090263          	beqz	s2,c0006f44 <do_execve+0x114>
c0006ec4:	0002f797          	auipc	a5,0x2f
c0006ec8:	0587a783          	lw	a5,88(a5) # c0035f1c <boot_cr3>
c0006ecc:	00c7d793          	srli	a5,a5,0xc
c0006ed0:	18079073          	csrw	sptbr,a5
c0006ed4:	01892783          	lw	a5,24(s2) # 80000018 <sbi_remote_fence_i+0x80000728>
c0006ed8:	fff78793          	addi	a5,a5,-1
c0006edc:	00f92c23          	sw	a5,24(s2)
c0006ee0:	34078263          	beqz	a5,c0007224 <do_execve+0x3f4>
c0006ee4:	0002f797          	auipc	a5,0x2f
c0006ee8:	f687a783          	lw	a5,-152(a5) # c0035e4c <current>
c0006eec:	0007ac23          	sw	zero,24(a5)
c0006ef0:	9bcfa0ef          	jal	ra,c00010ac <mm_create>
c0006ef4:	00050993          	mv	s3,a0
c0006ef8:	4a050463          	beqz	a0,c00073a0 <do_execve+0x570>
c0006efc:	a30ff0ef          	jal	ra,c000612c <setup_pgdir>
c0006f00:	46051463          	bnez	a0,c0007368 <do_execve+0x538>
c0006f04:	000ca703          	lw	a4,0(s9)
c0006f08:	464c47b7          	lui	a5,0x464c4
c0006f0c:	57f78793          	addi	a5,a5,1407 # 464c457f <_binary_obj___user_exit_out_size+0x464c1f23>
c0006f10:	04f70e63          	beq	a4,a5,c0006f6c <do_execve+0x13c>
c0006f14:	00098513          	mv	a0,s3
c0006f18:	988ff0ef          	jal	ra,c00060a0 <put_pgdir>
c0006f1c:	00098513          	mv	a0,s3
c0006f20:	ba0fa0ef          	jal	ra,c00012c0 <mm_destroy>
c0006f24:	ff800913          	li	s2,-8
c0006f28:	00090513          	mv	a0,s2
c0006f2c:	9f5ff0ef          	jal	ra,c0006920 <do_exit>
c0006f30:	00078613          	mv	a2,a5
c0006f34:	00098593          	mv	a1,s3
c0006f38:	01010513          	addi	a0,sp,16
c0006f3c:	39d000ef          	jal	ra,c0007ad8 <memcpy>
c0006f40:	f80912e3          	bnez	s2,c0006ec4 <do_execve+0x94>
c0006f44:	0002f797          	auipc	a5,0x2f
c0006f48:	f087a783          	lw	a5,-248(a5) # c0035e4c <current>
c0006f4c:	0187a783          	lw	a5,24(a5)
c0006f50:	fa0780e3          	beqz	a5,c0006ef0 <do_execve+0xc0>
c0006f54:	00003617          	auipc	a2,0x3
c0006f58:	e4460613          	addi	a2,a2,-444 # c0009d98 <default_pmm_manager+0x720>
c0006f5c:	20700593          	li	a1,519
c0006f60:	00003517          	auipc	a0,0x3
c0006f64:	24050513          	addi	a0,a0,576 # c000a1a0 <default_pmm_manager+0xb28>
c0006f68:	ae4f90ef          	jal	ra,c000024c <__panic>
c0006f6c:	01ccaa03          	lw	s4,28(s9)
c0006f70:	02ccdd03          	lhu	s10,44(s9)
c0006f74:	014c8a33          	add	s4,s9,s4
c0006f78:	005d1d13          	slli	s10,s10,0x5
c0006f7c:	01aa07b3          	add	a5,s4,s10
c0006f80:	00f12423          	sw	a5,8(sp)
c0006f84:	02fa7c63          	bleu	a5,s4,c0006fbc <do_execve+0x18c>
c0006f88:	00026797          	auipc	a5,0x26
c0006f8c:	a887a783          	lw	a5,-1400(a5) # c002ca10 <nbase>
c0006f90:	00100bb7          	lui	s7,0x100
c0006f94:	00f12223          	sw	a5,4(sp)
c0006f98:	fffb8b93          	addi	s7,s7,-1 # fffff <_binary_obj___user_exit_out_size+0xfd9a3>
c0006f9c:	00f12623          	sw	a5,12(sp)
c0006fa0:	00f12023          	sw	a5,0(sp)
c0006fa4:	000a2703          	lw	a4,0(s4)
c0006fa8:	00100793          	li	a5,1
c0006fac:	12f70e63          	beq	a4,a5,c00070e8 <do_execve+0x2b8>
c0006fb0:	00812783          	lw	a5,8(sp)
c0006fb4:	020a0a13          	addi	s4,s4,32
c0006fb8:	fefa66e3          	bltu	s4,a5,c0006fa4 <do_execve+0x174>
c0006fbc:	00000713          	li	a4,0
c0006fc0:	00b00693          	li	a3,11
c0006fc4:	00100637          	lui	a2,0x100
c0006fc8:	aff005b7          	lui	a1,0xaff00
c0006fcc:	00098513          	mv	a0,s3
c0006fd0:	b64fa0ef          	jal	ra,c0001334 <mm_map>
c0006fd4:	00050913          	mv	s2,a0
c0006fd8:	22051863          	bnez	a0,c0007208 <do_execve+0x3d8>
c0006fdc:	00c9a503          	lw	a0,12(s3)
c0006fe0:	01f00613          	li	a2,31
c0006fe4:	affff5b7          	lui	a1,0xaffff
c0006fe8:	c79fd0ef          	jal	ra,c0004c60 <pgdir_alloc_page>
c0006fec:	44050a63          	beqz	a0,c0007440 <do_execve+0x610>
c0006ff0:	00c9a503          	lw	a0,12(s3)
c0006ff4:	01f00613          	li	a2,31
c0006ff8:	afffe5b7          	lui	a1,0xafffe
c0006ffc:	c65fd0ef          	jal	ra,c0004c60 <pgdir_alloc_page>
c0007000:	42050063          	beqz	a0,c0007420 <do_execve+0x5f0>
c0007004:	00c9a503          	lw	a0,12(s3)
c0007008:	01f00613          	li	a2,31
c000700c:	afffd5b7          	lui	a1,0xafffd
c0007010:	c51fd0ef          	jal	ra,c0004c60 <pgdir_alloc_page>
c0007014:	3e050663          	beqz	a0,c0007400 <do_execve+0x5d0>
c0007018:	00c9a503          	lw	a0,12(s3)
c000701c:	01f00613          	li	a2,31
c0007020:	afffc5b7          	lui	a1,0xafffc
c0007024:	c3dfd0ef          	jal	ra,c0004c60 <pgdir_alloc_page>
c0007028:	3a050c63          	beqz	a0,c00073e0 <do_execve+0x5b0>
c000702c:	0189a703          	lw	a4,24(s3)
c0007030:	00c9a683          	lw	a3,12(s3)
c0007034:	0002f797          	auipc	a5,0x2f
c0007038:	e187a783          	lw	a5,-488(a5) # c0035e4c <current>
c000703c:	00170713          	addi	a4,a4,1
c0007040:	00e9ac23          	sw	a4,24(s3)
c0007044:	0137ac23          	sw	s3,24(a5)
c0007048:	c0000737          	lui	a4,0xc0000
c000704c:	36e6ee63          	bltu	a3,a4,c00073c8 <do_execve+0x598>
c0007050:	0002f717          	auipc	a4,0x2f
c0007054:	ec872703          	lw	a4,-312(a4) # c0035f18 <va_pa_offset>
c0007058:	40e686b3          	sub	a3,a3,a4
c000705c:	04d7ac23          	sw	a3,88(a5)
c0007060:	00c6d693          	srli	a3,a3,0xc
c0007064:	18069073          	csrw	sptbr,a3
c0007068:	0547a403          	lw	s0,84(a5)
c000706c:	00000593          	li	a1,0
c0007070:	09000613          	li	a2,144
c0007074:	00040513          	mv	a0,s0
c0007078:	08042483          	lw	s1,128(s0)
c000707c:	241000ef          	jal	ra,c0007abc <memset>
c0007080:	018ca783          	lw	a5,24(s9)
c0007084:	edf4f493          	andi	s1,s1,-289
c0007088:	b0000737          	lui	a4,0xb0000
c000708c:	00e42423          	sw	a4,8(s0)
c0007090:	08f42223          	sw	a5,132(s0)
c0007094:	08942023          	sw	s1,128(s0)
c0007098:	01010593          	addi	a1,sp,16
c000709c:	0002f517          	auipc	a0,0x2f
c00070a0:	db052503          	lw	a0,-592(a0) # c0035e4c <current>
c00070a4:	980ff0ef          	jal	ra,c0006224 <set_proc_name>
c00070a8:	05c12083          	lw	ra,92(sp)
c00070ac:	00090513          	mv	a0,s2
c00070b0:	05812403          	lw	s0,88(sp)
c00070b4:	05412483          	lw	s1,84(sp)
c00070b8:	05012903          	lw	s2,80(sp)
c00070bc:	04c12983          	lw	s3,76(sp)
c00070c0:	04812a03          	lw	s4,72(sp)
c00070c4:	04412a83          	lw	s5,68(sp)
c00070c8:	04012b03          	lw	s6,64(sp)
c00070cc:	03c12b83          	lw	s7,60(sp)
c00070d0:	03812c03          	lw	s8,56(sp)
c00070d4:	03412c83          	lw	s9,52(sp)
c00070d8:	03012d03          	lw	s10,48(sp)
c00070dc:	02c12d83          	lw	s11,44(sp)
c00070e0:	06010113          	addi	sp,sp,96
c00070e4:	00008067          	ret
c00070e8:	014a2603          	lw	a2,20(s4)
c00070ec:	010a2783          	lw	a5,16(s4)
c00070f0:	2af66c63          	bltu	a2,a5,c00073a8 <do_execve+0x578>
c00070f4:	018a2783          	lw	a5,24(s4)
c00070f8:	0017f693          	andi	a3,a5,1
c00070fc:	0027f713          	andi	a4,a5,2
c0007100:	00269693          	slli	a3,a3,0x2
c0007104:	00070463          	beqz	a4,c000710c <do_execve+0x2dc>
c0007108:	0026e693          	ori	a3,a3,2
c000710c:	0047f793          	andi	a5,a5,4
c0007110:	00078463          	beqz	a5,c0007118 <do_execve+0x2e8>
c0007114:	0016e693          	ori	a3,a3,1
c0007118:	0016f793          	andi	a5,a3,1
c000711c:	01300b13          	li	s6,19
c0007120:	00079463          	bnez	a5,c0007128 <do_execve+0x2f8>
c0007124:	01100b13          	li	s6,17
c0007128:	0026f793          	andi	a5,a3,2
c000712c:	00078463          	beqz	a5,c0007134 <do_execve+0x304>
c0007130:	01700b13          	li	s6,23
c0007134:	0046f793          	andi	a5,a3,4
c0007138:	00078463          	beqz	a5,c0007140 <do_execve+0x310>
c000713c:	008b6b13          	ori	s6,s6,8
c0007140:	008a2583          	lw	a1,8(s4)
c0007144:	00000713          	li	a4,0
c0007148:	00098513          	mv	a0,s3
c000714c:	9e8fa0ef          	jal	ra,c0001334 <mm_map>
c0007150:	00050913          	mv	s2,a0
c0007154:	0a051a63          	bnez	a0,c0007208 <do_execve+0x3d8>
c0007158:	008a2d03          	lw	s10,8(s4)
c000715c:	010a2903          	lw	s2,16(s4)
c0007160:	004a2483          	lw	s1,4(s4)
c0007164:	fffff7b7          	lui	a5,0xfffff
c0007168:	012d0933          	add	s2,s10,s2
c000716c:	009c84b3          	add	s1,s9,s1
c0007170:	00fd7db3          	and	s11,s10,a5
c0007174:	232d7263          	bleu	s2,s10,c0007398 <do_execve+0x568>
c0007178:	00001ab7          	lui	s5,0x1
c000717c:	0700006f          	j	c00071ec <do_execve+0x3bc>
c0007180:	41bd0533          	sub	a0,s10,s11
c0007184:	015d8db3          	add	s11,s11,s5
c0007188:	40aa8c33          	sub	s8,s5,a0
c000718c:	01b97663          	bleu	s11,s2,c0007198 <do_execve+0x368>
c0007190:	41bc0833          	sub	a6,s8,s11
c0007194:	01090c33          	add	s8,s2,a6
c0007198:	0002f697          	auipc	a3,0x2f
c000719c:	d886a683          	lw	a3,-632(a3) # c0035f20 <pages>
c00071a0:	00012783          	lw	a5,0(sp)
c00071a4:	40d406b3          	sub	a3,s0,a3
c00071a8:	4056d693          	srai	a3,a3,0x5
c00071ac:	00f686b3          	add	a3,a3,a5
c00071b0:	0176f5b3          	and	a1,a3,s7
c00071b4:	0002f617          	auipc	a2,0x2f
c00071b8:	c9062603          	lw	a2,-880(a2) # c0035e44 <npage>
c00071bc:	00c69693          	slli	a3,a3,0xc
c00071c0:	1ec5f863          	bleu	a2,a1,c00073b0 <do_execve+0x580>
c00071c4:	0002f617          	auipc	a2,0x2f
c00071c8:	d5462603          	lw	a2,-684(a2) # c0035f18 <va_pa_offset>
c00071cc:	00c686b3          	add	a3,a3,a2
c00071d0:	00048593          	mv	a1,s1
c00071d4:	000c0613          	mv	a2,s8
c00071d8:	00a68533          	add	a0,a3,a0
c00071dc:	018d0d33          	add	s10,s10,s8
c00071e0:	0f9000ef          	jal	ra,c0007ad8 <memcpy>
c00071e4:	018484b3          	add	s1,s1,s8
c00071e8:	052d7c63          	bleu	s2,s10,c0007240 <do_execve+0x410>
c00071ec:	00c9a503          	lw	a0,12(s3)
c00071f0:	000b0613          	mv	a2,s6
c00071f4:	000d8593          	mv	a1,s11
c00071f8:	a69fd0ef          	jal	ra,c0004c60 <pgdir_alloc_page>
c00071fc:	00050413          	mv	s0,a0
c0007200:	f80510e3          	bnez	a0,c0007180 <do_execve+0x350>
c0007204:	ffc00913          	li	s2,-4
c0007208:	00098513          	mv	a0,s3
c000720c:	b14fa0ef          	jal	ra,c0001520 <exit_mmap>
c0007210:	00098513          	mv	a0,s3
c0007214:	e8dfe0ef          	jal	ra,c00060a0 <put_pgdir>
c0007218:	00098513          	mv	a0,s3
c000721c:	8a4fa0ef          	jal	ra,c00012c0 <mm_destroy>
c0007220:	d09ff06f          	j	c0006f28 <do_execve+0xf8>
c0007224:	00090513          	mv	a0,s2
c0007228:	af8fa0ef          	jal	ra,c0001520 <exit_mmap>
c000722c:	00090513          	mv	a0,s2
c0007230:	e71fe0ef          	jal	ra,c00060a0 <put_pgdir>
c0007234:	00090513          	mv	a0,s2
c0007238:	888fa0ef          	jal	ra,c00012c0 <mm_destroy>
c000723c:	ca9ff06f          	j	c0006ee4 <do_execve+0xb4>
c0007240:	008a2483          	lw	s1,8(s4)
c0007244:	014a2683          	lw	a3,20(s4)
c0007248:	00d484b3          	add	s1,s1,a3
c000724c:	09bd6863          	bltu	s10,s11,c00072dc <do_execve+0x4ac>
c0007250:	00001937          	lui	s2,0x1
c0007254:	069d6663          	bltu	s10,s1,c00072c0 <do_execve+0x490>
c0007258:	d59ff06f          	j	c0006fb0 <do_execve+0x180>
c000725c:	41bd0533          	sub	a0,s10,s11
c0007260:	012d8db3          	add	s11,s11,s2
c0007264:	40a90633          	sub	a2,s2,a0
c0007268:	01b4f663          	bleu	s11,s1,c0007274 <do_execve+0x444>
c000726c:	41b60633          	sub	a2,a2,s11
c0007270:	00c48633          	add	a2,s1,a2
c0007274:	0002f697          	auipc	a3,0x2f
c0007278:	cac6a683          	lw	a3,-852(a3) # c0035f20 <pages>
c000727c:	00412783          	lw	a5,4(sp)
c0007280:	40d406b3          	sub	a3,s0,a3
c0007284:	4056d693          	srai	a3,a3,0x5
c0007288:	00f686b3          	add	a3,a3,a5
c000728c:	0176f833          	and	a6,a3,s7
c0007290:	0002f597          	auipc	a1,0x2f
c0007294:	bb45a583          	lw	a1,-1100(a1) # c0035e44 <npage>
c0007298:	00c69693          	slli	a3,a3,0xc
c000729c:	10b87a63          	bleu	a1,a6,c00073b0 <do_execve+0x580>
c00072a0:	0002f597          	auipc	a1,0x2f
c00072a4:	c785a583          	lw	a1,-904(a1) # c0035f18 <va_pa_offset>
c00072a8:	00b686b3          	add	a3,a3,a1
c00072ac:	00cd0d33          	add	s10,s10,a2
c00072b0:	00000593          	li	a1,0
c00072b4:	00a68533          	add	a0,a3,a0
c00072b8:	005000ef          	jal	ra,c0007abc <memset>
c00072bc:	ce9d7ae3          	bleu	s1,s10,c0006fb0 <do_execve+0x180>
c00072c0:	00c9a503          	lw	a0,12(s3)
c00072c4:	000b0613          	mv	a2,s6
c00072c8:	000d8593          	mv	a1,s11
c00072cc:	995fd0ef          	jal	ra,c0004c60 <pgdir_alloc_page>
c00072d0:	00050413          	mv	s0,a0
c00072d4:	f80514e3          	bnez	a0,c000725c <do_execve+0x42c>
c00072d8:	f2dff06f          	j	c0007204 <do_execve+0x3d4>
c00072dc:	cda48ae3          	beq	s1,s10,c0006fb0 <do_execve+0x180>
c00072e0:	41bd0933          	sub	s2,s10,s11
c00072e4:	00001537          	lui	a0,0x1
c00072e8:	00a90533          	add	a0,s2,a0
c00072ec:	09b4e663          	bltu	s1,s11,c0007378 <do_execve+0x548>
c00072f0:	41200933          	neg	s2,s2
c00072f4:	0002f697          	auipc	a3,0x2f
c00072f8:	c2c6a683          	lw	a3,-980(a3) # c0035f20 <pages>
c00072fc:	00c12783          	lw	a5,12(sp)
c0007300:	40d406b3          	sub	a3,s0,a3
c0007304:	4056d693          	srai	a3,a3,0x5
c0007308:	00f686b3          	add	a3,a3,a5
c000730c:	0176f5b3          	and	a1,a3,s7
c0007310:	0002f617          	auipc	a2,0x2f
c0007314:	b3462603          	lw	a2,-1228(a2) # c0035e44 <npage>
c0007318:	00c69693          	slli	a3,a3,0xc
c000731c:	08c5fa63          	bleu	a2,a1,c00073b0 <do_execve+0x580>
c0007320:	0002f617          	auipc	a2,0x2f
c0007324:	bf862603          	lw	a2,-1032(a2) # c0035f18 <va_pa_offset>
c0007328:	00c686b3          	add	a3,a3,a2
c000732c:	00000593          	li	a1,0
c0007330:	00090613          	mv	a2,s2
c0007334:	00a68533          	add	a0,a3,a0
c0007338:	784000ef          	jal	ra,c0007abc <memset>
c000733c:	01a90733          	add	a4,s2,s10
c0007340:	05b4f263          	bleu	s11,s1,c0007384 <do_execve+0x554>
c0007344:	c6e486e3          	beq	s1,a4,c0006fb0 <do_execve+0x180>
c0007348:	00003697          	auipc	a3,0x3
c000734c:	a7868693          	addi	a3,a3,-1416 # c0009dc0 <default_pmm_manager+0x748>
c0007350:	00001617          	auipc	a2,0x1
c0007354:	2e460613          	addi	a2,a2,740 # c0008634 <commands+0x3e4>
c0007358:	25c00593          	li	a1,604
c000735c:	00003517          	auipc	a0,0x3
c0007360:	e4450513          	addi	a0,a0,-444 # c000a1a0 <default_pmm_manager+0xb28>
c0007364:	ee9f80ef          	jal	ra,c000024c <__panic>
c0007368:	00098513          	mv	a0,s3
c000736c:	f55f90ef          	jal	ra,c00012c0 <mm_destroy>
c0007370:	ffc00913          	li	s2,-4
c0007374:	bb5ff06f          	j	c0006f28 <do_execve+0xf8>
c0007378:	41b486b3          	sub	a3,s1,s11
c000737c:	41268933          	sub	s2,a3,s2
c0007380:	f75ff06f          	j	c00072f4 <do_execve+0x4c4>
c0007384:	fdb712e3          	bne	a4,s11,c0007348 <do_execve+0x518>
c0007388:	000d8d13          	mv	s10,s11
c000738c:	ec5ff06f          	j	c0007250 <do_execve+0x420>
c0007390:	ffd00913          	li	s2,-3
c0007394:	d15ff06f          	j	c00070a8 <do_execve+0x278>
c0007398:	000d0493          	mv	s1,s10
c000739c:	ea9ff06f          	j	c0007244 <do_execve+0x414>
c00073a0:	ffc00913          	li	s2,-4
c00073a4:	b85ff06f          	j	c0006f28 <do_execve+0xf8>
c00073a8:	ff800913          	li	s2,-8
c00073ac:	e5dff06f          	j	c0007208 <do_execve+0x3d8>
c00073b0:	00002617          	auipc	a2,0x2
c00073b4:	b6860613          	addi	a2,a2,-1176 # c0008f18 <commands+0xcc8>
c00073b8:	06900593          	li	a1,105
c00073bc:	00002517          	auipc	a0,0x2
c00073c0:	91450513          	addi	a0,a0,-1772 # c0008cd0 <commands+0xa80>
c00073c4:	e89f80ef          	jal	ra,c000024c <__panic>
c00073c8:	00002617          	auipc	a2,0x2
c00073cc:	b7460613          	addi	a2,a2,-1164 # c0008f3c <commands+0xcec>
c00073d0:	27700593          	li	a1,631
c00073d4:	00003517          	auipc	a0,0x3
c00073d8:	dcc50513          	addi	a0,a0,-564 # c000a1a0 <default_pmm_manager+0xb28>
c00073dc:	e71f80ef          	jal	ra,c000024c <__panic>
c00073e0:	00003697          	auipc	a3,0x3
c00073e4:	ae868693          	addi	a3,a3,-1304 # c0009ec8 <default_pmm_manager+0x850>
c00073e8:	00001617          	auipc	a2,0x1
c00073ec:	24c60613          	addi	a2,a2,588 # c0008634 <commands+0x3e4>
c00073f0:	27200593          	li	a1,626
c00073f4:	00003517          	auipc	a0,0x3
c00073f8:	dac50513          	addi	a0,a0,-596 # c000a1a0 <default_pmm_manager+0xb28>
c00073fc:	e51f80ef          	jal	ra,c000024c <__panic>
c0007400:	00003697          	auipc	a3,0x3
c0007404:	a8468693          	addi	a3,a3,-1404 # c0009e84 <default_pmm_manager+0x80c>
c0007408:	00001617          	auipc	a2,0x1
c000740c:	22c60613          	addi	a2,a2,556 # c0008634 <commands+0x3e4>
c0007410:	27100593          	li	a1,625
c0007414:	00003517          	auipc	a0,0x3
c0007418:	d8c50513          	addi	a0,a0,-628 # c000a1a0 <default_pmm_manager+0xb28>
c000741c:	e31f80ef          	jal	ra,c000024c <__panic>
c0007420:	00003697          	auipc	a3,0x3
c0007424:	a2068693          	addi	a3,a3,-1504 # c0009e40 <default_pmm_manager+0x7c8>
c0007428:	00001617          	auipc	a2,0x1
c000742c:	20c60613          	addi	a2,a2,524 # c0008634 <commands+0x3e4>
c0007430:	27000593          	li	a1,624
c0007434:	00003517          	auipc	a0,0x3
c0007438:	d6c50513          	addi	a0,a0,-660 # c000a1a0 <default_pmm_manager+0xb28>
c000743c:	e11f80ef          	jal	ra,c000024c <__panic>
c0007440:	00003697          	auipc	a3,0x3
c0007444:	9bc68693          	addi	a3,a3,-1604 # c0009dfc <default_pmm_manager+0x784>
c0007448:	00001617          	auipc	a2,0x1
c000744c:	1ec60613          	addi	a2,a2,492 # c0008634 <commands+0x3e4>
c0007450:	26f00593          	li	a1,623
c0007454:	00003517          	auipc	a0,0x3
c0007458:	d4c50513          	addi	a0,a0,-692 # c000a1a0 <default_pmm_manager+0xb28>
c000745c:	df1f80ef          	jal	ra,c000024c <__panic>

c0007460 <do_yield>:
c0007460:	00100713          	li	a4,1
c0007464:	0002f797          	auipc	a5,0x2f
c0007468:	9e87a783          	lw	a5,-1560(a5) # c0035e4c <current>
c000746c:	00e7a823          	sw	a4,16(a5)
c0007470:	00000513          	li	a0,0
c0007474:	00008067          	ret

c0007478 <do_wait>:
c0007478:	ff010113          	addi	sp,sp,-16
c000747c:	00812423          	sw	s0,8(sp)
c0007480:	00912223          	sw	s1,4(sp)
c0007484:	00112623          	sw	ra,12(sp)
c0007488:	00058413          	mv	s0,a1
c000748c:	00050493          	mv	s1,a0
c0007490:	02058063          	beqz	a1,c00074b0 <do_wait+0x38>
c0007494:	0002f797          	auipc	a5,0x2f
c0007498:	9b87a783          	lw	a5,-1608(a5) # c0035e4c <current>
c000749c:	0187a503          	lw	a0,24(a5)
c00074a0:	00100693          	li	a3,1
c00074a4:	00400613          	li	a2,4
c00074a8:	825fa0ef          	jal	ra,c0001ccc <user_mem_check>
c00074ac:	02050063          	beqz	a0,c00074cc <do_wait+0x54>
c00074b0:	00040593          	mv	a1,s0
c00074b4:	00048513          	mv	a0,s1
c00074b8:	00c12083          	lw	ra,12(sp)
c00074bc:	00812403          	lw	s0,8(sp)
c00074c0:	00412483          	lw	s1,4(sp)
c00074c4:	01010113          	addi	sp,sp,16
c00074c8:	df8ff06f          	j	c0006ac0 <do_wait.part.1>
c00074cc:	00c12083          	lw	ra,12(sp)
c00074d0:	ffd00513          	li	a0,-3
c00074d4:	00812403          	lw	s0,8(sp)
c00074d8:	00412483          	lw	s1,4(sp)
c00074dc:	01010113          	addi	sp,sp,16
c00074e0:	00008067          	ret

c00074e4 <do_kill>:
c00074e4:	ff010113          	addi	sp,sp,-16
c00074e8:	00812423          	sw	s0,8(sp)
c00074ec:	00112623          	sw	ra,12(sp)
c00074f0:	e11fe0ef          	jal	ra,c0006300 <find_proc>
c00074f4:	ffd00413          	li	s0,-3
c00074f8:	02050463          	beqz	a0,c0007520 <do_kill+0x3c>
c00074fc:	05c52703          	lw	a4,92(a0)
c0007500:	ff700413          	li	s0,-9
c0007504:	00177693          	andi	a3,a4,1
c0007508:	00069c63          	bnez	a3,c0007520 <do_kill+0x3c>
c000750c:	08452683          	lw	a3,132(a0)
c0007510:	00176713          	ori	a4,a4,1
c0007514:	04e52e23          	sw	a4,92(a0)
c0007518:	00000413          	li	s0,0
c000751c:	0006cc63          	bltz	a3,c0007534 <do_kill+0x50>
c0007520:	00c12083          	lw	ra,12(sp)
c0007524:	00040513          	mv	a0,s0
c0007528:	00812403          	lw	s0,8(sp)
c000752c:	01010113          	addi	sp,sp,16
c0007530:	00008067          	ret
c0007534:	1ac000ef          	jal	ra,c00076e0 <wakeup_proc>
c0007538:	00c12083          	lw	ra,12(sp)
c000753c:	00040513          	mv	a0,s0
c0007540:	00812403          	lw	s0,8(sp)
c0007544:	01010113          	addi	sp,sp,16
c0007548:	00008067          	ret

c000754c <proc_init>:
c000754c:	ff010113          	addi	sp,sp,-16
c0007550:	0002f797          	auipc	a5,0x2f
c0007554:	9d478793          	addi	a5,a5,-1580 # c0035f24 <proc_list>
c0007558:	00112623          	sw	ra,12(sp)
c000755c:	00812423          	sw	s0,8(sp)
c0007560:	00f7a223          	sw	a5,4(a5)
c0007564:	00f7a023          	sw	a5,0(a5)
c0007568:	0002f717          	auipc	a4,0x2f
c000756c:	8b870713          	addi	a4,a4,-1864 # c0035e20 <is_panic>
c0007570:	0002d797          	auipc	a5,0x2d
c0007574:	8b078793          	addi	a5,a5,-1872 # c0033e20 <hash_list>
c0007578:	00f7a223          	sw	a5,4(a5)
c000757c:	00f7a023          	sw	a5,0(a5)
c0007580:	00878793          	addi	a5,a5,8
c0007584:	fef71ae3          	bne	a4,a5,c0007578 <proc_init+0x2c>
c0007588:	9e5fe0ef          	jal	ra,c0005f6c <alloc_proc>
c000758c:	0002f297          	auipc	t0,0x2f
c0007590:	8ca2a223          	sw	a0,-1852(t0) # c0035e50 <idleproc>
c0007594:	0a050e63          	beqz	a0,c0007650 <proc_init+0x104>
c0007598:	00200713          	li	a4,2
c000759c:	00100413          	li	s0,1
c00075a0:	00e52023          	sw	a4,0(a0)
c00075a4:	00004717          	auipc	a4,0x4
c00075a8:	a5c70713          	addi	a4,a4,-1444 # c000b000 <bootstack>
c00075ac:	00003597          	auipc	a1,0x3
c00075b0:	b2c58593          	addi	a1,a1,-1236 # c000a0d8 <default_pmm_manager+0xa60>
c00075b4:	00052223          	sw	zero,4(a0)
c00075b8:	00e52623          	sw	a4,12(a0)
c00075bc:	00852823          	sw	s0,16(a0)
c00075c0:	c65fe0ef          	jal	ra,c0006224 <set_proc_name>
c00075c4:	0002f797          	auipc	a5,0x2f
c00075c8:	8947a783          	lw	a5,-1900(a5) # c0035e58 <nr_process>
c00075cc:	008787b3          	add	a5,a5,s0
c00075d0:	0002f297          	auipc	t0,0x2f
c00075d4:	88f2a423          	sw	a5,-1912(t0) # c0035e58 <nr_process>
c00075d8:	00000613          	li	a2,0
c00075dc:	0002f797          	auipc	a5,0x2f
c00075e0:	8747a783          	lw	a5,-1932(a5) # c0035e50 <idleproc>
c00075e4:	00000593          	li	a1,0
c00075e8:	fffff517          	auipc	a0,0xfffff
c00075ec:	6fc50513          	addi	a0,a0,1788 # c0006ce4 <init_main>
c00075f0:	0002f297          	auipc	t0,0x2f
c00075f4:	84f2ae23          	sw	a5,-1956(t0) # c0035e4c <current>
c00075f8:	aacff0ef          	jal	ra,c00068a4 <kernel_thread>
c00075fc:	0aa05663          	blez	a0,c00076a8 <proc_init+0x15c>
c0007600:	d01fe0ef          	jal	ra,c0006300 <find_proc>
c0007604:	00003597          	auipc	a1,0x3
c0007608:	af858593          	addi	a1,a1,-1288 # c000a0fc <default_pmm_manager+0xa84>
c000760c:	0002f297          	auipc	t0,0x2f
c0007610:	84a2a423          	sw	a0,-1976(t0) # c0035e54 <initproc>
c0007614:	c11fe0ef          	jal	ra,c0006224 <set_proc_name>
c0007618:	0002f797          	auipc	a5,0x2f
c000761c:	8387a783          	lw	a5,-1992(a5) # c0035e50 <idleproc>
c0007620:	06078463          	beqz	a5,c0007688 <proc_init+0x13c>
c0007624:	0047a783          	lw	a5,4(a5)
c0007628:	06079063          	bnez	a5,c0007688 <proc_init+0x13c>
c000762c:	0002f797          	auipc	a5,0x2f
c0007630:	8287a783          	lw	a5,-2008(a5) # c0035e54 <initproc>
c0007634:	02078a63          	beqz	a5,c0007668 <proc_init+0x11c>
c0007638:	0047a783          	lw	a5,4(a5)
c000763c:	02879663          	bne	a5,s0,c0007668 <proc_init+0x11c>
c0007640:	00c12083          	lw	ra,12(sp)
c0007644:	00812403          	lw	s0,8(sp)
c0007648:	01010113          	addi	sp,sp,16
c000764c:	00008067          	ret
c0007650:	00003617          	auipc	a2,0x3
c0007654:	a7060613          	addi	a2,a2,-1424 # c000a0c0 <default_pmm_manager+0xa48>
c0007658:	38100593          	li	a1,897
c000765c:	00003517          	auipc	a0,0x3
c0007660:	b4450513          	addi	a0,a0,-1212 # c000a1a0 <default_pmm_manager+0xb28>
c0007664:	be9f80ef          	jal	ra,c000024c <__panic>
c0007668:	00003697          	auipc	a3,0x3
c000766c:	ac468693          	addi	a3,a3,-1340 # c000a12c <default_pmm_manager+0xab4>
c0007670:	00001617          	auipc	a2,0x1
c0007674:	fc460613          	addi	a2,a2,-60 # c0008634 <commands+0x3e4>
c0007678:	39600593          	li	a1,918
c000767c:	00003517          	auipc	a0,0x3
c0007680:	b2450513          	addi	a0,a0,-1244 # c000a1a0 <default_pmm_manager+0xb28>
c0007684:	bc9f80ef          	jal	ra,c000024c <__panic>
c0007688:	00003697          	auipc	a3,0x3
c000768c:	a7c68693          	addi	a3,a3,-1412 # c000a104 <default_pmm_manager+0xa8c>
c0007690:	00001617          	auipc	a2,0x1
c0007694:	fa460613          	addi	a2,a2,-92 # c0008634 <commands+0x3e4>
c0007698:	39500593          	li	a1,917
c000769c:	00003517          	auipc	a0,0x3
c00076a0:	b0450513          	addi	a0,a0,-1276 # c000a1a0 <default_pmm_manager+0xb28>
c00076a4:	ba9f80ef          	jal	ra,c000024c <__panic>
c00076a8:	00003617          	auipc	a2,0x3
c00076ac:	a3860613          	addi	a2,a2,-1480 # c000a0e0 <default_pmm_manager+0xa68>
c00076b0:	38f00593          	li	a1,911
c00076b4:	00003517          	auipc	a0,0x3
c00076b8:	aec50513          	addi	a0,a0,-1300 # c000a1a0 <default_pmm_manager+0xb28>
c00076bc:	b91f80ef          	jal	ra,c000024c <__panic>

c00076c0 <cpu_idle>:
c00076c0:	ff010113          	addi	sp,sp,-16
c00076c4:	00112623          	sw	ra,12(sp)
c00076c8:	0002e717          	auipc	a4,0x2e
c00076cc:	78472703          	lw	a4,1924(a4) # c0035e4c <current>
c00076d0:	01072783          	lw	a5,16(a4)
c00076d4:	fe078ee3          	beqz	a5,c00076d0 <cpu_idle+0x10>
c00076d8:	0c4000ef          	jal	ra,c000779c <schedule>
c00076dc:	fedff06f          	j	c00076c8 <cpu_idle+0x8>

c00076e0 <wakeup_proc>:
c00076e0:	00052703          	lw	a4,0(a0)
c00076e4:	ff010113          	addi	sp,sp,-16
c00076e8:	00112623          	sw	ra,12(sp)
c00076ec:	00812423          	sw	s0,8(sp)
c00076f0:	00912223          	sw	s1,4(sp)
c00076f4:	00300793          	li	a5,3
c00076f8:	08f70263          	beq	a4,a5,c000777c <wakeup_proc+0x9c>
c00076fc:	00050413          	mv	s0,a0
c0007700:	100027f3          	csrr	a5,sstatus
c0007704:	0027f793          	andi	a5,a5,2
c0007708:	00000493          	li	s1,0
c000770c:	04079063          	bnez	a5,c000774c <wakeup_proc+0x6c>
c0007710:	00200793          	li	a5,2
c0007714:	04f70663          	beq	a4,a5,c0007760 <wakeup_proc+0x80>
c0007718:	00f42023          	sw	a5,0(s0)
c000771c:	08042223          	sw	zero,132(s0)
c0007720:	00049c63          	bnez	s1,c0007738 <wakeup_proc+0x58>
c0007724:	00c12083          	lw	ra,12(sp)
c0007728:	00812403          	lw	s0,8(sp)
c000772c:	00412483          	lw	s1,4(sp)
c0007730:	01010113          	addi	sp,sp,16
c0007734:	00008067          	ret
c0007738:	00c12083          	lw	ra,12(sp)
c000773c:	00812403          	lw	s0,8(sp)
c0007740:	00412483          	lw	s1,4(sp)
c0007744:	01010113          	addi	sp,sp,16
c0007748:	8d0f906f          	j	c0000818 <intr_enable>
c000774c:	8d4f90ef          	jal	ra,c0000820 <intr_disable>
c0007750:	00042703          	lw	a4,0(s0)
c0007754:	00200793          	li	a5,2
c0007758:	00100493          	li	s1,1
c000775c:	faf71ee3          	bne	a4,a5,c0007718 <wakeup_proc+0x38>
c0007760:	00003617          	auipc	a2,0x3
c0007764:	a8860613          	addi	a2,a2,-1400 # c000a1e8 <default_pmm_manager+0xb70>
c0007768:	01200593          	li	a1,18
c000776c:	00003517          	auipc	a0,0x3
c0007770:	a6450513          	addi	a0,a0,-1436 # c000a1d0 <default_pmm_manager+0xb58>
c0007774:	b69f80ef          	jal	ra,c00002dc <__warn>
c0007778:	fa9ff06f          	j	c0007720 <wakeup_proc+0x40>
c000777c:	00003697          	auipc	a3,0x3
c0007780:	a3868693          	addi	a3,a3,-1480 # c000a1b4 <default_pmm_manager+0xb3c>
c0007784:	00001617          	auipc	a2,0x1
c0007788:	eb060613          	addi	a2,a2,-336 # c0008634 <commands+0x3e4>
c000778c:	00900593          	li	a1,9
c0007790:	00003517          	auipc	a0,0x3
c0007794:	a4050513          	addi	a0,a0,-1472 # c000a1d0 <default_pmm_manager+0xb58>
c0007798:	ab5f80ef          	jal	ra,c000024c <__panic>

c000779c <schedule>:
c000779c:	ff010113          	addi	sp,sp,-16
c00077a0:	00112623          	sw	ra,12(sp)
c00077a4:	00812423          	sw	s0,8(sp)
c00077a8:	100027f3          	csrr	a5,sstatus
c00077ac:	0027f793          	andi	a5,a5,2
c00077b0:	00000413          	li	s0,0
c00077b4:	08079a63          	bnez	a5,c0007848 <schedule+0xac>
c00077b8:	0002e897          	auipc	a7,0x2e
c00077bc:	6948a883          	lw	a7,1684(a7) # c0035e4c <current>
c00077c0:	0008a823          	sw	zero,16(a7)
c00077c4:	0002e517          	auipc	a0,0x2e
c00077c8:	68c52503          	lw	a0,1676(a0) # c0035e50 <idleproc>
c00077cc:	08a88e63          	beq	a7,a0,c0007868 <schedule+0xcc>
c00077d0:	07088693          	addi	a3,a7,112
c00077d4:	0002e597          	auipc	a1,0x2e
c00077d8:	75058593          	addi	a1,a1,1872 # c0035f24 <proc_list>
c00077dc:	00068793          	mv	a5,a3
c00077e0:	00000613          	li	a2,0
c00077e4:	00200813          	li	a6,2
c00077e8:	0047a783          	lw	a5,4(a5)
c00077ec:	00b78863          	beq	a5,a1,c00077fc <schedule+0x60>
c00077f0:	f907a703          	lw	a4,-112(a5)
c00077f4:	f9078613          	addi	a2,a5,-112
c00077f8:	01070463          	beq	a4,a6,c0007800 <schedule+0x64>
c00077fc:	fef696e3          	bne	a3,a5,c00077e8 <schedule+0x4c>
c0007800:	00060863          	beqz	a2,c0007810 <schedule+0x74>
c0007804:	00062703          	lw	a4,0(a2)
c0007808:	00200793          	li	a5,2
c000780c:	06f70663          	beq	a4,a5,c0007878 <schedule+0xdc>
c0007810:	00852783          	lw	a5,8(a0)
c0007814:	00178793          	addi	a5,a5,1
c0007818:	00f52423          	sw	a5,8(a0)
c000781c:	01150463          	beq	a0,a7,c0007824 <schedule+0x88>
c0007820:	a4dfe0ef          	jal	ra,c000626c <proc_run>
c0007824:	00041a63          	bnez	s0,c0007838 <schedule+0x9c>
c0007828:	00c12083          	lw	ra,12(sp)
c000782c:	00812403          	lw	s0,8(sp)
c0007830:	01010113          	addi	sp,sp,16
c0007834:	00008067          	ret
c0007838:	00c12083          	lw	ra,12(sp)
c000783c:	00812403          	lw	s0,8(sp)
c0007840:	01010113          	addi	sp,sp,16
c0007844:	fd5f806f          	j	c0000818 <intr_enable>
c0007848:	fd9f80ef          	jal	ra,c0000820 <intr_disable>
c000784c:	0002e897          	auipc	a7,0x2e
c0007850:	6008a883          	lw	a7,1536(a7) # c0035e4c <current>
c0007854:	0008a823          	sw	zero,16(a7)
c0007858:	0002e517          	auipc	a0,0x2e
c000785c:	5f852503          	lw	a0,1528(a0) # c0035e50 <idleproc>
c0007860:	00100413          	li	s0,1
c0007864:	f6a896e3          	bne	a7,a0,c00077d0 <schedule+0x34>
c0007868:	0002e597          	auipc	a1,0x2e
c000786c:	6bc58593          	addi	a1,a1,1724 # c0035f24 <proc_list>
c0007870:	00058693          	mv	a3,a1
c0007874:	f69ff06f          	j	c00077dc <schedule+0x40>
c0007878:	00060513          	mv	a0,a2
c000787c:	f95ff06f          	j	c0007810 <schedule+0x74>

c0007880 <sys_getpid>:
c0007880:	0002e797          	auipc	a5,0x2e
c0007884:	5cc7a783          	lw	a5,1484(a5) # c0035e4c <current>
c0007888:	0047a503          	lw	a0,4(a5)
c000788c:	00008067          	ret

c0007890 <sys_pgdir>:
c0007890:	ff010113          	addi	sp,sp,-16
c0007894:	00112623          	sw	ra,12(sp)
c0007898:	ca0fd0ef          	jal	ra,c0004d38 <print_pgdir>
c000789c:	00c12083          	lw	ra,12(sp)
c00078a0:	00000513          	li	a0,0
c00078a4:	01010113          	addi	sp,sp,16
c00078a8:	00008067          	ret

c00078ac <sys_putc>:
c00078ac:	00052503          	lw	a0,0(a0)
c00078b0:	ff010113          	addi	sp,sp,-16
c00078b4:	00112623          	sw	ra,12(sp)
c00078b8:	879f80ef          	jal	ra,c0000130 <cputchar>
c00078bc:	00c12083          	lw	ra,12(sp)
c00078c0:	00000513          	li	a0,0
c00078c4:	01010113          	addi	sp,sp,16
c00078c8:	00008067          	ret

c00078cc <sys_kill>:
c00078cc:	00052503          	lw	a0,0(a0)
c00078d0:	c15ff06f          	j	c00074e4 <do_kill>

c00078d4 <sys_yield>:
c00078d4:	b8dff06f          	j	c0007460 <do_yield>

c00078d8 <sys_exec>:
c00078d8:	00c52683          	lw	a3,12(a0)
c00078dc:	00852603          	lw	a2,8(a0)
c00078e0:	00452583          	lw	a1,4(a0)
c00078e4:	00052503          	lw	a0,0(a0)
c00078e8:	d48ff06f          	j	c0006e30 <do_execve>

c00078ec <sys_wait>:
c00078ec:	00452583          	lw	a1,4(a0)
c00078f0:	00052503          	lw	a0,0(a0)
c00078f4:	b85ff06f          	j	c0007478 <do_wait>

c00078f8 <sys_fork>:
c00078f8:	0002e797          	auipc	a5,0x2e
c00078fc:	5547a783          	lw	a5,1364(a5) # c0035e4c <current>
c0007900:	0547a603          	lw	a2,84(a5)
c0007904:	00000513          	li	a0,0
c0007908:	00862583          	lw	a1,8(a2)
c000790c:	a75fe06f          	j	c0006380 <do_fork>

c0007910 <sys_exit>:
c0007910:	00052503          	lw	a0,0(a0)
c0007914:	80cff06f          	j	c0006920 <do_exit>

c0007918 <syscall>:
c0007918:	fd010113          	addi	sp,sp,-48
c000791c:	0002e797          	auipc	a5,0x2e
c0007920:	5307a783          	lw	a5,1328(a5) # c0035e4c <current>
c0007924:	02812423          	sw	s0,40(sp)
c0007928:	0547a403          	lw	s0,84(a5)
c000792c:	02912223          	sw	s1,36(sp)
c0007930:	02112623          	sw	ra,44(sp)
c0007934:	02842483          	lw	s1,40(s0)
c0007938:	01f00793          	li	a5,31
c000793c:	0697e263          	bltu	a5,s1,c00079a0 <syscall+0x88>
c0007940:	00249713          	slli	a4,s1,0x2
c0007944:	00003797          	auipc	a5,0x3
c0007948:	90478793          	addi	a5,a5,-1788 # c000a248 <syscalls>
c000794c:	00e787b3          	add	a5,a5,a4
c0007950:	0007a783          	lw	a5,0(a5)
c0007954:	04078663          	beqz	a5,c00079a0 <syscall+0x88>
c0007958:	02c42503          	lw	a0,44(s0)
c000795c:	03042583          	lw	a1,48(s0)
c0007960:	03442603          	lw	a2,52(s0)
c0007964:	03842683          	lw	a3,56(s0)
c0007968:	03c42703          	lw	a4,60(s0)
c000796c:	00a12623          	sw	a0,12(sp)
c0007970:	00b12823          	sw	a1,16(sp)
c0007974:	00c12a23          	sw	a2,20(sp)
c0007978:	00d12c23          	sw	a3,24(sp)
c000797c:	00e12e23          	sw	a4,28(sp)
c0007980:	00c10513          	addi	a0,sp,12
c0007984:	000780e7          	jalr	a5
c0007988:	02c12083          	lw	ra,44(sp)
c000798c:	02a42423          	sw	a0,40(s0)
c0007990:	02412483          	lw	s1,36(sp)
c0007994:	02812403          	lw	s0,40(sp)
c0007998:	03010113          	addi	sp,sp,48
c000799c:	00008067          	ret
c00079a0:	00040513          	mv	a0,s0
c00079a4:	8b8f90ef          	jal	ra,c0000a5c <print_trapframe>
c00079a8:	0002e797          	auipc	a5,0x2e
c00079ac:	4a47a783          	lw	a5,1188(a5) # c0035e4c <current>
c00079b0:	0047a703          	lw	a4,4(a5)
c00079b4:	00048693          	mv	a3,s1
c00079b8:	06078793          	addi	a5,a5,96
c00079bc:	00003617          	auipc	a2,0x3
c00079c0:	84860613          	addi	a2,a2,-1976 # c000a204 <default_pmm_manager+0xb8c>
c00079c4:	06300593          	li	a1,99
c00079c8:	00003517          	auipc	a0,0x3
c00079cc:	86850513          	addi	a0,a0,-1944 # c000a230 <default_pmm_manager+0xbb8>
c00079d0:	87df80ef          	jal	ra,c000024c <__panic>

c00079d4 <strlen>:
c00079d4:	00054703          	lbu	a4,0(a0)
c00079d8:	00050693          	mv	a3,a0
c00079dc:	00150793          	addi	a5,a0,1
c00079e0:	00070c63          	beqz	a4,c00079f8 <strlen+0x24>
c00079e4:	40d78533          	sub	a0,a5,a3
c00079e8:	00178793          	addi	a5,a5,1
c00079ec:	fff7c703          	lbu	a4,-1(a5)
c00079f0:	fe071ae3          	bnez	a4,c00079e4 <strlen+0x10>
c00079f4:	00008067          	ret
c00079f8:	00000513          	li	a0,0
c00079fc:	00008067          	ret

c0007a00 <strnlen>:
c0007a00:	00050693          	mv	a3,a0
c0007a04:	02058a63          	beqz	a1,c0007a38 <strnlen+0x38>
c0007a08:	00054703          	lbu	a4,0(a0)
c0007a0c:	00150793          	addi	a5,a0,1
c0007a10:	02070463          	beqz	a4,c0007a38 <strnlen+0x38>
c0007a14:	00b505b3          	add	a1,a0,a1
c0007a18:	0100006f          	j	c0007a28 <strnlen+0x28>
c0007a1c:	00178793          	addi	a5,a5,1
c0007a20:	fff7c703          	lbu	a4,-1(a5)
c0007a24:	00070863          	beqz	a4,c0007a34 <strnlen+0x34>
c0007a28:	40d78533          	sub	a0,a5,a3
c0007a2c:	feb798e3          	bne	a5,a1,c0007a1c <strnlen+0x1c>
c0007a30:	00008067          	ret
c0007a34:	00008067          	ret
c0007a38:	00000513          	li	a0,0
c0007a3c:	00008067          	ret

c0007a40 <strcpy>:
c0007a40:	00050793          	mv	a5,a0
c0007a44:	00158593          	addi	a1,a1,1
c0007a48:	fff5c703          	lbu	a4,-1(a1)
c0007a4c:	00178793          	addi	a5,a5,1
c0007a50:	fee78fa3          	sb	a4,-1(a5)
c0007a54:	fe0718e3          	bnez	a4,c0007a44 <strcpy+0x4>
c0007a58:	00008067          	ret

c0007a5c <strcmp>:
c0007a5c:	00054783          	lbu	a5,0(a0)
c0007a60:	0005c703          	lbu	a4,0(a1)
c0007a64:	02078263          	beqz	a5,c0007a88 <strcmp+0x2c>
c0007a68:	02e79063          	bne	a5,a4,c0007a88 <strcmp+0x2c>
c0007a6c:	00150513          	addi	a0,a0,1
c0007a70:	00054783          	lbu	a5,0(a0)
c0007a74:	00158693          	addi	a3,a1,1
c0007a78:	0015c703          	lbu	a4,1(a1)
c0007a7c:	00078663          	beqz	a5,c0007a88 <strcmp+0x2c>
c0007a80:	00068593          	mv	a1,a3
c0007a84:	fee784e3          	beq	a5,a4,c0007a6c <strcmp+0x10>
c0007a88:	40e78533          	sub	a0,a5,a4
c0007a8c:	00008067          	ret

c0007a90 <strchr>:
c0007a90:	00054783          	lbu	a5,0(a0)
c0007a94:	00078e63          	beqz	a5,c0007ab0 <strchr+0x20>
c0007a98:	00f59663          	bne	a1,a5,c0007aa4 <strchr+0x14>
c0007a9c:	01c0006f          	j	c0007ab8 <strchr+0x28>
c0007aa0:	00b78a63          	beq	a5,a1,c0007ab4 <strchr+0x24>
c0007aa4:	00150513          	addi	a0,a0,1
c0007aa8:	00054783          	lbu	a5,0(a0)
c0007aac:	fe079ae3          	bnez	a5,c0007aa0 <strchr+0x10>
c0007ab0:	00000513          	li	a0,0
c0007ab4:	00008067          	ret
c0007ab8:	00008067          	ret

c0007abc <memset>:
c0007abc:	00c50733          	add	a4,a0,a2
c0007ac0:	00050793          	mv	a5,a0
c0007ac4:	00060863          	beqz	a2,c0007ad4 <memset+0x18>
c0007ac8:	00178793          	addi	a5,a5,1
c0007acc:	feb78fa3          	sb	a1,-1(a5)
c0007ad0:	fef71ce3          	bne	a4,a5,c0007ac8 <memset+0xc>
c0007ad4:	00008067          	ret

c0007ad8 <memcpy>:
c0007ad8:	00c586b3          	add	a3,a1,a2
c0007adc:	00050793          	mv	a5,a0
c0007ae0:	00060c63          	beqz	a2,c0007af8 <memcpy+0x20>
c0007ae4:	00158593          	addi	a1,a1,1
c0007ae8:	fff5c703          	lbu	a4,-1(a1)
c0007aec:	00178793          	addi	a5,a5,1
c0007af0:	fee78fa3          	sb	a4,-1(a5)
c0007af4:	feb698e3          	bne	a3,a1,c0007ae4 <memcpy+0xc>
c0007af8:	00008067          	ret

c0007afc <printnum>:
c0007afc:	fe010113          	addi	sp,sp,-32
c0007b00:	00912a23          	sw	s1,20(sp)
c0007b04:	01212823          	sw	s2,16(sp)
c0007b08:	01312623          	sw	s3,12(sp)
c0007b0c:	01412423          	sw	s4,8(sp)
c0007b10:	00112e23          	sw	ra,28(sp)
c0007b14:	00812c23          	sw	s0,24(sp)
c0007b18:	00050493          	mv	s1,a0
c0007b1c:	00058913          	mv	s2,a1
c0007b20:	00080993          	mv	s3,a6
c0007b24:	02e67a33          	remu	s4,a2,a4
c0007b28:	04069e63          	bnez	a3,c0007b84 <printnum+0x88>
c0007b2c:	04e67c63          	bleu	a4,a2,c0007b84 <printnum+0x88>
c0007b30:	fff78413          	addi	s0,a5,-1
c0007b34:	00805c63          	blez	s0,c0007b4c <printnum+0x50>
c0007b38:	fff40413          	addi	s0,s0,-1
c0007b3c:	00090593          	mv	a1,s2
c0007b40:	00098513          	mv	a0,s3
c0007b44:	000480e7          	jalr	s1
c0007b48:	fe0418e3          	bnez	s0,c0007b38 <printnum+0x3c>
c0007b4c:	00003797          	auipc	a5,0x3
c0007b50:	93878793          	addi	a5,a5,-1736 # c000a484 <error_string+0x64>
c0007b54:	014787b3          	add	a5,a5,s4
c0007b58:	00090593          	mv	a1,s2
c0007b5c:	00048313          	mv	t1,s1
c0007b60:	01c12083          	lw	ra,28(sp)
c0007b64:	01812403          	lw	s0,24(sp)
c0007b68:	01412483          	lw	s1,20(sp)
c0007b6c:	01012903          	lw	s2,16(sp)
c0007b70:	00c12983          	lw	s3,12(sp)
c0007b74:	00812a03          	lw	s4,8(sp)
c0007b78:	0007c503          	lbu	a0,0(a5)
c0007b7c:	02010113          	addi	sp,sp,32
c0007b80:	00030067          	jr	t1
c0007b84:	02e65633          	divu	a2,a2,a4
c0007b88:	00098813          	mv	a6,s3
c0007b8c:	fff78793          	addi	a5,a5,-1
c0007b90:	00000693          	li	a3,0
c0007b94:	00090593          	mv	a1,s2
c0007b98:	00048513          	mv	a0,s1
c0007b9c:	f61ff0ef          	jal	ra,c0007afc <printnum>
c0007ba0:	fadff06f          	j	c0007b4c <printnum+0x50>

c0007ba4 <vprintfmt>:
c0007ba4:	fb010113          	addi	sp,sp,-80
c0007ba8:	05212023          	sw	s2,64(sp)
c0007bac:	03312e23          	sw	s3,60(sp)
c0007bb0:	03412c23          	sw	s4,56(sp)
c0007bb4:	03512a23          	sw	s5,52(sp)
c0007bb8:	03612823          	sw	s6,48(sp)
c0007bbc:	03712623          	sw	s7,44(sp)
c0007bc0:	03812423          	sw	s8,40(sp)
c0007bc4:	03912223          	sw	s9,36(sp)
c0007bc8:	04112623          	sw	ra,76(sp)
c0007bcc:	04812423          	sw	s0,72(sp)
c0007bd0:	04912223          	sw	s1,68(sp)
c0007bd4:	03a12023          	sw	s10,32(sp)
c0007bd8:	01b12e23          	sw	s11,28(sp)
c0007bdc:	00050993          	mv	s3,a0
c0007be0:	00058913          	mv	s2,a1
c0007be4:	00060c93          	mv	s9,a2
c0007be8:	00068a93          	mv	s5,a3
c0007bec:	00002a17          	auipc	s4,0x2
c0007bf0:	6dca0a13          	addi	s4,s4,1756 # c000a2c8 <syscalls+0x80>
c0007bf4:	02800c13          	li	s8,40
c0007bf8:	fff00b13          	li	s6,-1
c0007bfc:	05e00b93          	li	s7,94
c0007c00:	000cc503          	lbu	a0,0(s9)
c0007c04:	02500493          	li	s1,37
c0007c08:	001c8413          	addi	s0,s9,1
c0007c0c:	00950e63          	beq	a0,s1,c0007c28 <vprintfmt+0x84>
c0007c10:	06050463          	beqz	a0,c0007c78 <vprintfmt+0xd4>
c0007c14:	00090593          	mv	a1,s2
c0007c18:	00140413          	addi	s0,s0,1
c0007c1c:	000980e7          	jalr	s3
c0007c20:	fff44503          	lbu	a0,-1(s0)
c0007c24:	fe9516e3          	bne	a0,s1,c0007c10 <vprintfmt+0x6c>
c0007c28:	00044e03          	lbu	t3,0(s0)
c0007c2c:	fff00d13          	li	s10,-1
c0007c30:	02000813          	li	a6,32
c0007c34:	00000493          	li	s1,0
c0007c38:	00000593          	li	a1,0
c0007c3c:	000d0d93          	mv	s11,s10
c0007c40:	05500693          	li	a3,85
c0007c44:	00100313          	li	t1,1
c0007c48:	03000893          	li	a7,48
c0007c4c:	00900613          	li	a2,9
c0007c50:	02d00513          	li	a0,45
c0007c54:	fdde0713          	addi	a4,t3,-35
c0007c58:	0ff77713          	andi	a4,a4,255
c0007c5c:	00140c93          	addi	s9,s0,1
c0007c60:	32e6e463          	bltu	a3,a4,c0007f88 <vprintfmt+0x3e4>
c0007c64:	00271713          	slli	a4,a4,0x2
c0007c68:	01470733          	add	a4,a4,s4
c0007c6c:	00072783          	lw	a5,0(a4)
c0007c70:	014787b3          	add	a5,a5,s4
c0007c74:	00078067          	jr	a5
c0007c78:	04c12083          	lw	ra,76(sp)
c0007c7c:	04812403          	lw	s0,72(sp)
c0007c80:	04412483          	lw	s1,68(sp)
c0007c84:	04012903          	lw	s2,64(sp)
c0007c88:	03c12983          	lw	s3,60(sp)
c0007c8c:	03812a03          	lw	s4,56(sp)
c0007c90:	03412a83          	lw	s5,52(sp)
c0007c94:	03012b03          	lw	s6,48(sp)
c0007c98:	02c12b83          	lw	s7,44(sp)
c0007c9c:	02812c03          	lw	s8,40(sp)
c0007ca0:	02412c83          	lw	s9,36(sp)
c0007ca4:	02012d03          	lw	s10,32(sp)
c0007ca8:	01c12d83          	lw	s11,28(sp)
c0007cac:	05010113          	addi	sp,sp,80
c0007cb0:	00008067          	ret
c0007cb4:	00100793          	li	a5,1
c0007cb8:	34b7c063          	blt	a5,a1,c0007ff8 <vprintfmt+0x454>
c0007cbc:	000aa603          	lw	a2,0(s5) # 1000 <_binary_obj___user_faultread_out_size-0xf68>
c0007cc0:	00000693          	li	a3,0
c0007cc4:	004a8a93          	addi	s5,s5,4
c0007cc8:	01000713          	li	a4,16
c0007ccc:	000d8793          	mv	a5,s11
c0007cd0:	00090593          	mv	a1,s2
c0007cd4:	00098513          	mv	a0,s3
c0007cd8:	e25ff0ef          	jal	ra,c0007afc <printnum>
c0007cdc:	f25ff06f          	j	c0007c00 <vprintfmt+0x5c>
c0007ce0:	00144e03          	lbu	t3,1(s0)
c0007ce4:	00030493          	mv	s1,t1
c0007ce8:	000c8413          	mv	s0,s9
c0007cec:	f69ff06f          	j	c0007c54 <vprintfmt+0xb0>
c0007cf0:	000aa503          	lw	a0,0(s5)
c0007cf4:	00090593          	mv	a1,s2
c0007cf8:	004a8a93          	addi	s5,s5,4
c0007cfc:	000980e7          	jalr	s3
c0007d00:	f01ff06f          	j	c0007c00 <vprintfmt+0x5c>
c0007d04:	00100793          	li	a5,1
c0007d08:	30b7c663          	blt	a5,a1,c0008014 <vprintfmt+0x470>
c0007d0c:	000aa603          	lw	a2,0(s5)
c0007d10:	004a8a93          	addi	s5,s5,4
c0007d14:	41f65693          	srai	a3,a2,0x1f
c0007d18:	00a00713          	li	a4,10
c0007d1c:	fa06d8e3          	bgez	a3,c0007ccc <vprintfmt+0x128>
c0007d20:	00090593          	mv	a1,s2
c0007d24:	02d00513          	li	a0,45
c0007d28:	00d12623          	sw	a3,12(sp)
c0007d2c:	00c12423          	sw	a2,8(sp)
c0007d30:	00e12223          	sw	a4,4(sp)
c0007d34:	01012023          	sw	a6,0(sp)
c0007d38:	000980e7          	jalr	s3
c0007d3c:	00812603          	lw	a2,8(sp)
c0007d40:	00c12683          	lw	a3,12(sp)
c0007d44:	00012803          	lw	a6,0(sp)
c0007d48:	40c00633          	neg	a2,a2
c0007d4c:	00c037b3          	snez	a5,a2
c0007d50:	40d006b3          	neg	a3,a3
c0007d54:	40f686b3          	sub	a3,a3,a5
c0007d58:	00412703          	lw	a4,4(sp)
c0007d5c:	f71ff06f          	j	c0007ccc <vprintfmt+0x128>
c0007d60:	000aa783          	lw	a5,0(s5)
c0007d64:	01800693          	li	a3,24
c0007d68:	004a8a93          	addi	s5,s5,4
c0007d6c:	41f7d713          	srai	a4,a5,0x1f
c0007d70:	00f747b3          	xor	a5,a4,a5
c0007d74:	40e787b3          	sub	a5,a5,a4
c0007d78:	2af6ca63          	blt	a3,a5,c000802c <vprintfmt+0x488>
c0007d7c:	00279693          	slli	a3,a5,0x2
c0007d80:	00002717          	auipc	a4,0x2
c0007d84:	6a070713          	addi	a4,a4,1696 # c000a420 <error_string>
c0007d88:	00d70733          	add	a4,a4,a3
c0007d8c:	00072683          	lw	a3,0(a4)
c0007d90:	28068e63          	beqz	a3,c000802c <vprintfmt+0x488>
c0007d94:	00000617          	auipc	a2,0x0
c0007d98:	39c60613          	addi	a2,a2,924 # c0008130 <etext+0x24>
c0007d9c:	00090593          	mv	a1,s2
c0007da0:	00098513          	mv	a0,s3
c0007da4:	314000ef          	jal	ra,c00080b8 <printfmt>
c0007da8:	e59ff06f          	j	c0007c00 <vprintfmt+0x5c>
c0007dac:	00144e03          	lbu	t3,1(s0)
c0007db0:	00158593          	addi	a1,a1,1
c0007db4:	000c8413          	mv	s0,s9
c0007db8:	e9dff06f          	j	c0007c54 <vprintfmt+0xb0>
c0007dbc:	00100793          	li	a5,1
c0007dc0:	20b7c063          	blt	a5,a1,c0007fc0 <vprintfmt+0x41c>
c0007dc4:	000aa603          	lw	a2,0(s5)
c0007dc8:	00000693          	li	a3,0
c0007dcc:	004a8a93          	addi	s5,s5,4
c0007dd0:	00800713          	li	a4,8
c0007dd4:	ef9ff06f          	j	c0007ccc <vprintfmt+0x128>
c0007dd8:	03000513          	li	a0,48
c0007ddc:	00090593          	mv	a1,s2
c0007de0:	01012023          	sw	a6,0(sp)
c0007de4:	000980e7          	jalr	s3
c0007de8:	00090593          	mv	a1,s2
c0007dec:	07800513          	li	a0,120
c0007df0:	000980e7          	jalr	s3
c0007df4:	000aa603          	lw	a2,0(s5)
c0007df8:	00000693          	li	a3,0
c0007dfc:	01000713          	li	a4,16
c0007e00:	004a8a93          	addi	s5,s5,4
c0007e04:	00012803          	lw	a6,0(sp)
c0007e08:	ec5ff06f          	j	c0007ccc <vprintfmt+0x128>
c0007e0c:	000aa403          	lw	s0,0(s5)
c0007e10:	004a8793          	addi	a5,s5,4
c0007e14:	00f12223          	sw	a5,4(sp)
c0007e18:	24040863          	beqz	s0,c0008068 <vprintfmt+0x4c4>
c0007e1c:	05b05263          	blez	s11,c0007e60 <vprintfmt+0x2bc>
c0007e20:	02d00793          	li	a5,45
c0007e24:	22f80263          	beq	a6,a5,c0008048 <vprintfmt+0x4a4>
c0007e28:	000d0593          	mv	a1,s10
c0007e2c:	00040513          	mv	a0,s0
c0007e30:	01012023          	sw	a6,0(sp)
c0007e34:	bcdff0ef          	jal	ra,c0007a00 <strnlen>
c0007e38:	40ad8db3          	sub	s11,s11,a0
c0007e3c:	03b05263          	blez	s11,c0007e60 <vprintfmt+0x2bc>
c0007e40:	00012803          	lw	a6,0(sp)
c0007e44:	00080513          	mv	a0,a6
c0007e48:	00090593          	mv	a1,s2
c0007e4c:	01012023          	sw	a6,0(sp)
c0007e50:	fffd8d93          	addi	s11,s11,-1
c0007e54:	000980e7          	jalr	s3
c0007e58:	00012803          	lw	a6,0(sp)
c0007e5c:	fe0d94e3          	bnez	s11,c0007e44 <vprintfmt+0x2a0>
c0007e60:	00044783          	lbu	a5,0(s0)
c0007e64:	00140a93          	addi	s5,s0,1
c0007e68:	00078513          	mv	a0,a5
c0007e6c:	04078c63          	beqz	a5,c0007ec4 <vprintfmt+0x320>
c0007e70:	03f00413          	li	s0,63
c0007e74:	000d4663          	bltz	s10,c0007e80 <vprintfmt+0x2dc>
c0007e78:	fffd0d13          	addi	s10,s10,-1
c0007e7c:	036d0663          	beq	s10,s6,c0007ea8 <vprintfmt+0x304>
c0007e80:	00090593          	mv	a1,s2
c0007e84:	00048663          	beqz	s1,c0007e90 <vprintfmt+0x2ec>
c0007e88:	fe078793          	addi	a5,a5,-32
c0007e8c:	12fbe463          	bltu	s7,a5,c0007fb4 <vprintfmt+0x410>
c0007e90:	000980e7          	jalr	s3
c0007e94:	001a8a93          	addi	s5,s5,1
c0007e98:	fffac783          	lbu	a5,-1(s5)
c0007e9c:	fffd8d93          	addi	s11,s11,-1
c0007ea0:	00078513          	mv	a0,a5
c0007ea4:	fc0798e3          	bnez	a5,c0007e74 <vprintfmt+0x2d0>
c0007ea8:	01b05e63          	blez	s11,c0007ec4 <vprintfmt+0x320>
c0007eac:	02000413          	li	s0,32
c0007eb0:	fffd8d93          	addi	s11,s11,-1
c0007eb4:	00090593          	mv	a1,s2
c0007eb8:	00040513          	mv	a0,s0
c0007ebc:	000980e7          	jalr	s3
c0007ec0:	fe0d98e3          	bnez	s11,c0007eb0 <vprintfmt+0x30c>
c0007ec4:	00412a83          	lw	s5,4(sp)
c0007ec8:	d39ff06f          	j	c0007c00 <vprintfmt+0x5c>
c0007ecc:	00100793          	li	a5,1
c0007ed0:	10b7c663          	blt	a5,a1,c0007fdc <vprintfmt+0x438>
c0007ed4:	000aa603          	lw	a2,0(s5)
c0007ed8:	00000693          	li	a3,0
c0007edc:	004a8a93          	addi	s5,s5,4
c0007ee0:	00a00713          	li	a4,10
c0007ee4:	de9ff06f          	j	c0007ccc <vprintfmt+0x128>
c0007ee8:	00144e03          	lbu	t3,1(s0)
c0007eec:	00050813          	mv	a6,a0
c0007ef0:	000c8413          	mv	s0,s9
c0007ef4:	d61ff06f          	j	c0007c54 <vprintfmt+0xb0>
c0007ef8:	00090593          	mv	a1,s2
c0007efc:	02500513          	li	a0,37
c0007f00:	000980e7          	jalr	s3
c0007f04:	cfdff06f          	j	c0007c00 <vprintfmt+0x5c>
c0007f08:	000aad03          	lw	s10,0(s5)
c0007f0c:	00144e03          	lbu	t3,1(s0)
c0007f10:	004a8a93          	addi	s5,s5,4
c0007f14:	000c8413          	mv	s0,s9
c0007f18:	d20ddee3          	bgez	s11,c0007c54 <vprintfmt+0xb0>
c0007f1c:	000d0d93          	mv	s11,s10
c0007f20:	fff00d13          	li	s10,-1
c0007f24:	d31ff06f          	j	c0007c54 <vprintfmt+0xb0>
c0007f28:	00144e03          	lbu	t3,1(s0)
c0007f2c:	00088813          	mv	a6,a7
c0007f30:	000c8413          	mv	s0,s9
c0007f34:	d21ff06f          	j	c0007c54 <vprintfmt+0xb0>
c0007f38:	00144703          	lbu	a4,1(s0)
c0007f3c:	fd0e0d13          	addi	s10,t3,-48
c0007f40:	fd070793          	addi	a5,a4,-48
c0007f44:	14f66863          	bltu	a2,a5,c0008094 <vprintfmt+0x4f0>
c0007f48:	000c8413          	mv	s0,s9
c0007f4c:	002d1793          	slli	a5,s10,0x2
c0007f50:	01a78d33          	add	s10,a5,s10
c0007f54:	00140413          	addi	s0,s0,1
c0007f58:	001d1d13          	slli	s10,s10,0x1
c0007f5c:	00ed0d33          	add	s10,s10,a4
c0007f60:	00044703          	lbu	a4,0(s0)
c0007f64:	fd0d0d13          	addi	s10,s10,-48
c0007f68:	fd070793          	addi	a5,a4,-48
c0007f6c:	fef670e3          	bleu	a5,a2,c0007f4c <vprintfmt+0x3a8>
c0007f70:	00070e13          	mv	t3,a4
c0007f74:	fa5ff06f          	j	c0007f18 <vprintfmt+0x374>
c0007f78:	0e0dc463          	bltz	s11,c0008060 <vprintfmt+0x4bc>
c0007f7c:	00144e03          	lbu	t3,1(s0)
c0007f80:	000c8413          	mv	s0,s9
c0007f84:	cd1ff06f          	j	c0007c54 <vprintfmt+0xb0>
c0007f88:	00090593          	mv	a1,s2
c0007f8c:	02500513          	li	a0,37
c0007f90:	000980e7          	jalr	s3
c0007f94:	fff44783          	lbu	a5,-1(s0)
c0007f98:	02500713          	li	a4,37
c0007f9c:	00040c93          	mv	s9,s0
c0007fa0:	c6e780e3          	beq	a5,a4,c0007c00 <vprintfmt+0x5c>
c0007fa4:	fffc8c93          	addi	s9,s9,-1
c0007fa8:	fffcc783          	lbu	a5,-1(s9)
c0007fac:	fee79ce3          	bne	a5,a4,c0007fa4 <vprintfmt+0x400>
c0007fb0:	c51ff06f          	j	c0007c00 <vprintfmt+0x5c>
c0007fb4:	00040513          	mv	a0,s0
c0007fb8:	000980e7          	jalr	s3
c0007fbc:	ed9ff06f          	j	c0007e94 <vprintfmt+0x2f0>
c0007fc0:	007a8793          	addi	a5,s5,7
c0007fc4:	ff87f793          	andi	a5,a5,-8
c0007fc8:	00878a93          	addi	s5,a5,8
c0007fcc:	0007a603          	lw	a2,0(a5)
c0007fd0:	0047a683          	lw	a3,4(a5)
c0007fd4:	00800713          	li	a4,8
c0007fd8:	cf5ff06f          	j	c0007ccc <vprintfmt+0x128>
c0007fdc:	007a8793          	addi	a5,s5,7
c0007fe0:	ff87f793          	andi	a5,a5,-8
c0007fe4:	00878a93          	addi	s5,a5,8
c0007fe8:	0007a603          	lw	a2,0(a5)
c0007fec:	0047a683          	lw	a3,4(a5)
c0007ff0:	00a00713          	li	a4,10
c0007ff4:	cd9ff06f          	j	c0007ccc <vprintfmt+0x128>
c0007ff8:	007a8793          	addi	a5,s5,7
c0007ffc:	ff87f793          	andi	a5,a5,-8
c0008000:	00878a93          	addi	s5,a5,8
c0008004:	0007a603          	lw	a2,0(a5)
c0008008:	0047a683          	lw	a3,4(a5)
c000800c:	01000713          	li	a4,16
c0008010:	cbdff06f          	j	c0007ccc <vprintfmt+0x128>
c0008014:	007a8793          	addi	a5,s5,7
c0008018:	ff87f793          	andi	a5,a5,-8
c000801c:	00878a93          	addi	s5,a5,8
c0008020:	0007a603          	lw	a2,0(a5)
c0008024:	0047a683          	lw	a3,4(a5)
c0008028:	cf1ff06f          	j	c0007d18 <vprintfmt+0x174>
c000802c:	00078693          	mv	a3,a5
c0008030:	00002617          	auipc	a2,0x2
c0008034:	51460613          	addi	a2,a2,1300 # c000a544 <error_string+0x124>
c0008038:	00090593          	mv	a1,s2
c000803c:	00098513          	mv	a0,s3
c0008040:	078000ef          	jal	ra,c00080b8 <printfmt>
c0008044:	bbdff06f          	j	c0007c00 <vprintfmt+0x5c>
c0008048:	00044783          	lbu	a5,0(s0)
c000804c:	00140a93          	addi	s5,s0,1
c0008050:	00078513          	mv	a0,a5
c0008054:	e4078ce3          	beqz	a5,c0007eac <vprintfmt+0x308>
c0008058:	03f00413          	li	s0,63
c000805c:	e19ff06f          	j	c0007e74 <vprintfmt+0x2d0>
c0008060:	00000d93          	li	s11,0
c0008064:	f19ff06f          	j	c0007f7c <vprintfmt+0x3d8>
c0008068:	03b05c63          	blez	s11,c00080a0 <vprintfmt+0x4fc>
c000806c:	02d00793          	li	a5,45
c0008070:	00002417          	auipc	s0,0x2
c0008074:	4cc40413          	addi	s0,s0,1228 # c000a53c <error_string+0x11c>
c0008078:	daf818e3          	bne	a6,a5,c0007e28 <vprintfmt+0x284>
c000807c:	00002a97          	auipc	s5,0x2
c0008080:	4c1a8a93          	addi	s5,s5,1217 # c000a53d <error_string+0x11d>
c0008084:	000c0513          	mv	a0,s8
c0008088:	000c0793          	mv	a5,s8
c000808c:	03f00413          	li	s0,63
c0008090:	de5ff06f          	j	c0007e74 <vprintfmt+0x2d0>
c0008094:	00070e13          	mv	t3,a4
c0008098:	000c8413          	mv	s0,s9
c000809c:	e7dff06f          	j	c0007f18 <vprintfmt+0x374>
c00080a0:	000c0793          	mv	a5,s8
c00080a4:	000c0513          	mv	a0,s8
c00080a8:	00002a97          	auipc	s5,0x2
c00080ac:	495a8a93          	addi	s5,s5,1173 # c000a53d <error_string+0x11d>
c00080b0:	03f00413          	li	s0,63
c00080b4:	dc1ff06f          	j	c0007e74 <vprintfmt+0x2d0>

c00080b8 <printfmt>:
c00080b8:	fc010113          	addi	sp,sp,-64
c00080bc:	02c10313          	addi	t1,sp,44
c00080c0:	02d12623          	sw	a3,44(sp)
c00080c4:	00030693          	mv	a3,t1
c00080c8:	00112e23          	sw	ra,28(sp)
c00080cc:	02e12823          	sw	a4,48(sp)
c00080d0:	02f12a23          	sw	a5,52(sp)
c00080d4:	03012c23          	sw	a6,56(sp)
c00080d8:	03112e23          	sw	a7,60(sp)
c00080dc:	00612623          	sw	t1,12(sp)
c00080e0:	ac5ff0ef          	jal	ra,c0007ba4 <vprintfmt>
c00080e4:	01c12083          	lw	ra,28(sp)
c00080e8:	04010113          	addi	sp,sp,64
c00080ec:	00008067          	ret

c00080f0 <hash32>:
c00080f0:	9e3707b7          	lui	a5,0x9e370
c00080f4:	00178793          	addi	a5,a5,1 # 9e370001 <sbi_remote_fence_i+0x9e370711>
c00080f8:	02f50533          	mul	a0,a0,a5
c00080fc:	02000793          	li	a5,32
c0008100:	40b785b3          	sub	a1,a5,a1
c0008104:	00b55533          	srl	a0,a0,a1
c0008108:	00008067          	ret
