
bin/kernel:     file format elf32-littleriscv


Disassembly of section .text:

c0000000 <kern_entry>:
c0000000:	00012117          	auipc	sp,0x12
c0000004:	00010113          	mv	sp,sp
c0000008:	0040006f          	j	c000000c <kern_init>

c000000c <kern_init>:
c000000c:	0003c517          	auipc	a0,0x3c
c0000010:	4d850513          	addi	a0,a0,1240 # c003c4e4 <edata>
c0000014:	00046617          	auipc	a2,0x46
c0000018:	ab860613          	addi	a2,a2,-1352 # c0045acc <end>
c000001c:	ff010113          	addi	sp,sp,-16 # c0011ff0 <bootstack+0x1ff0>
c0000020:	40a60633          	sub	a2,a2,a0
c0000024:	00000593          	li	a1,0
c0000028:	00112623          	sw	ra,12(sp)
c000002c:	6dc0c0ef          	jal	ra,c000c708 <memset>
c0000030:	754000ef          	jal	ra,c0000784 <cons_init>
c0000034:	0000d597          	auipc	a1,0xd
c0000038:	d2458593          	addi	a1,a1,-732 # c000cd58 <etext>
c000003c:	0000d517          	auipc	a0,0xd
c0000040:	d3850513          	addi	a0,a0,-712 # c000cd74 <etext+0x1c>
c0000044:	098000ef          	jal	ra,c00000dc <cprintf>
c0000048:	2f8000ef          	jal	ra,c0000340 <print_kerninfo>
c000004c:	7b5040ef          	jal	ra,c0005000 <pmm_init>
c0000050:	7c8000ef          	jal	ra,c0000818 <pic_init>
c0000054:	7d8000ef          	jal	ra,c000082c <idt_init>
c0000058:	540010ef          	jal	ra,c0001598 <vmm_init>
c000005c:	420080ef          	jal	ra,c000847c <sched_init>
c0000060:	194080ef          	jal	ra,c00081f4 <proc_init>
c0000064:	620000ef          	jal	ra,c0000684 <ide_init>
c0000068:	7c4020ef          	jal	ra,c000282c <swap_init>
c000006c:	6d0000ef          	jal	ra,c000073c <clock_init>
c0000070:	7ac000ef          	jal	ra,c000081c <intr_enable>
c0000074:	2f4080ef          	jal	ra,c0008368 <cpu_idle>

c0000078 <cputch>:
c0000078:	ff010113          	addi	sp,sp,-16
c000007c:	00112623          	sw	ra,12(sp)
c0000080:	00812423          	sw	s0,8(sp)
c0000084:	00058413          	mv	s0,a1
c0000088:	700000ef          	jal	ra,c0000788 <cons_putc>
c000008c:	00042783          	lw	a5,0(s0)
c0000090:	00c12083          	lw	ra,12(sp)
c0000094:	00178793          	addi	a5,a5,1
c0000098:	00f42023          	sw	a5,0(s0)
c000009c:	00812403          	lw	s0,8(sp)
c00000a0:	01010113          	addi	sp,sp,16
c00000a4:	00008067          	ret

c00000a8 <vcprintf>:
c00000a8:	fe010113          	addi	sp,sp,-32
c00000ac:	00058693          	mv	a3,a1
c00000b0:	00050613          	mv	a2,a0
c00000b4:	00c10593          	addi	a1,sp,12
c00000b8:	00000517          	auipc	a0,0x0
c00000bc:	fc050513          	addi	a0,a0,-64 # c0000078 <cputch>
c00000c0:	00112e23          	sw	ra,28(sp)
c00000c4:	00012623          	sw	zero,12(sp)
c00000c8:	7280c0ef          	jal	ra,c000c7f0 <vprintfmt>
c00000cc:	01c12083          	lw	ra,28(sp)
c00000d0:	00c12503          	lw	a0,12(sp)
c00000d4:	02010113          	addi	sp,sp,32
c00000d8:	00008067          	ret

c00000dc <cprintf>:
c00000dc:	fc010113          	addi	sp,sp,-64
c00000e0:	02410313          	addi	t1,sp,36
c00000e4:	02b12223          	sw	a1,36(sp)
c00000e8:	02c12423          	sw	a2,40(sp)
c00000ec:	02d12623          	sw	a3,44(sp)
c00000f0:	00050613          	mv	a2,a0
c00000f4:	00c10593          	addi	a1,sp,12
c00000f8:	00000517          	auipc	a0,0x0
c00000fc:	f8050513          	addi	a0,a0,-128 # c0000078 <cputch>
c0000100:	00030693          	mv	a3,t1
c0000104:	00112e23          	sw	ra,28(sp)
c0000108:	02e12823          	sw	a4,48(sp)
c000010c:	02f12a23          	sw	a5,52(sp)
c0000110:	03012c23          	sw	a6,56(sp)
c0000114:	03112e23          	sw	a7,60(sp)
c0000118:	00612423          	sw	t1,8(sp)
c000011c:	00012623          	sw	zero,12(sp)
c0000120:	6d00c0ef          	jal	ra,c000c7f0 <vprintfmt>
c0000124:	01c12083          	lw	ra,28(sp)
c0000128:	00c12503          	lw	a0,12(sp)
c000012c:	04010113          	addi	sp,sp,64
c0000130:	00008067          	ret

c0000134 <cputchar>:
c0000134:	6540006f          	j	c0000788 <cons_putc>

c0000138 <getchar>:
c0000138:	ff010113          	addi	sp,sp,-16
c000013c:	00112623          	sw	ra,12(sp)
c0000140:	690000ef          	jal	ra,c00007d0 <cons_getc>
c0000144:	fe050ee3          	beqz	a0,c0000140 <getchar+0x8>
c0000148:	00c12083          	lw	ra,12(sp)
c000014c:	01010113          	addi	sp,sp,16
c0000150:	00008067          	ret

c0000154 <readline>:
c0000154:	fd010113          	addi	sp,sp,-48
c0000158:	02112623          	sw	ra,44(sp)
c000015c:	02812423          	sw	s0,40(sp)
c0000160:	02912223          	sw	s1,36(sp)
c0000164:	03212023          	sw	s2,32(sp)
c0000168:	01312e23          	sw	s3,28(sp)
c000016c:	01412c23          	sw	s4,24(sp)
c0000170:	01512a23          	sw	s5,20(sp)
c0000174:	01612823          	sw	s6,16(sp)
c0000178:	01712623          	sw	s7,12(sp)
c000017c:	00050a63          	beqz	a0,c0000190 <readline+0x3c>
c0000180:	00050593          	mv	a1,a0
c0000184:	0000d517          	auipc	a0,0xd
c0000188:	bf850513          	addi	a0,a0,-1032 # c000cd7c <etext+0x24>
c000018c:	f51ff0ef          	jal	ra,c00000dc <cprintf>
c0000190:	00000493          	li	s1,0
c0000194:	01f00913          	li	s2,31
c0000198:	00d00993          	li	s3,13
c000019c:	00800a93          	li	s5,8
c00001a0:	00a00b13          	li	s6,10
c00001a4:	3fe00a13          	li	s4,1022
c00001a8:	0003cb97          	auipc	s7,0x3c
c00001ac:	340b8b93          	addi	s7,s7,832 # c003c4e8 <buf>
c00001b0:	f89ff0ef          	jal	ra,c0000138 <getchar>
c00001b4:	00050413          	mv	s0,a0
c00001b8:	06054863          	bltz	a0,c0000228 <readline+0xd4>
c00001bc:	06a95a63          	ble	a0,s2,c0000230 <readline+0xdc>
c00001c0:	049a5663          	ble	s1,s4,c000020c <readline+0xb8>
c00001c4:	ff3416e3          	bne	s0,s3,c00001b0 <readline+0x5c>
c00001c8:	00040513          	mv	a0,s0
c00001cc:	f69ff0ef          	jal	ra,c0000134 <cputchar>
c00001d0:	0003c517          	auipc	a0,0x3c
c00001d4:	31850513          	addi	a0,a0,792 # c003c4e8 <buf>
c00001d8:	009504b3          	add	s1,a0,s1
c00001dc:	00048023          	sb	zero,0(s1)
c00001e0:	02c12083          	lw	ra,44(sp)
c00001e4:	02812403          	lw	s0,40(sp)
c00001e8:	02412483          	lw	s1,36(sp)
c00001ec:	02012903          	lw	s2,32(sp)
c00001f0:	01c12983          	lw	s3,28(sp)
c00001f4:	01812a03          	lw	s4,24(sp)
c00001f8:	01412a83          	lw	s5,20(sp)
c00001fc:	01012b03          	lw	s6,16(sp)
c0000200:	00c12b83          	lw	s7,12(sp)
c0000204:	03010113          	addi	sp,sp,48
c0000208:	00008067          	ret
c000020c:	f29ff0ef          	jal	ra,c0000134 <cputchar>
c0000210:	009b87b3          	add	a5,s7,s1
c0000214:	00878023          	sb	s0,0(a5)
c0000218:	f21ff0ef          	jal	ra,c0000138 <getchar>
c000021c:	00148493          	addi	s1,s1,1
c0000220:	00050413          	mv	s0,a0
c0000224:	f8055ce3          	bgez	a0,c00001bc <readline+0x68>
c0000228:	00000513          	li	a0,0
c000022c:	fb5ff06f          	j	c00001e0 <readline+0x8c>
c0000230:	01551a63          	bne	a0,s5,c0000244 <readline+0xf0>
c0000234:	f6048ee3          	beqz	s1,c00001b0 <readline+0x5c>
c0000238:	efdff0ef          	jal	ra,c0000134 <cputchar>
c000023c:	fff48493          	addi	s1,s1,-1
c0000240:	f71ff06f          	j	c00001b0 <readline+0x5c>
c0000244:	f96502e3          	beq	a0,s6,c00001c8 <readline+0x74>
c0000248:	f73414e3          	bne	s0,s3,c00001b0 <readline+0x5c>
c000024c:	f7dff06f          	j	c00001c8 <readline+0x74>

c0000250 <__panic>:
c0000250:	fc010113          	addi	sp,sp,-64
c0000254:	02f12a23          	sw	a5,52(sp)
c0000258:	00112e23          	sw	ra,28(sp)
c000025c:	00812c23          	sw	s0,24(sp)
c0000260:	02d12623          	sw	a3,44(sp)
c0000264:	02e12823          	sw	a4,48(sp)
c0000268:	03012c23          	sw	a6,56(sp)
c000026c:	03112e23          	sw	a7,60(sp)
c0000270:	00045797          	auipc	a5,0x45
c0000274:	68c7a783          	lw	a5,1676(a5) # c00458fc <is_panic>
c0000278:	00078a63          	beqz	a5,c000028c <__panic+0x3c>
c000027c:	5a8000ef          	jal	ra,c0000824 <intr_disable>
c0000280:	00000513          	li	a0,0
c0000284:	21c000ef          	jal	ra,c00004a0 <kmonitor>
c0000288:	ff9ff06f          	j	c0000280 <__panic+0x30>
c000028c:	00100713          	li	a4,1
c0000290:	00045797          	auipc	a5,0x45
c0000294:	66c78793          	addi	a5,a5,1644 # c00458fc <is_panic>
c0000298:	00e7a023          	sw	a4,0(a5)
c000029c:	00060413          	mv	s0,a2
c00002a0:	02c10793          	addi	a5,sp,44
c00002a4:	00058613          	mv	a2,a1
c00002a8:	00050593          	mv	a1,a0
c00002ac:	0000d517          	auipc	a0,0xd
c00002b0:	ad450513          	addi	a0,a0,-1324 # c000cd80 <etext+0x28>
c00002b4:	00f12623          	sw	a5,12(sp)
c00002b8:	e25ff0ef          	jal	ra,c00000dc <cprintf>
c00002bc:	00c12583          	lw	a1,12(sp)
c00002c0:	00040513          	mv	a0,s0
c00002c4:	de5ff0ef          	jal	ra,c00000a8 <vcprintf>
c00002c8:	0000e517          	auipc	a0,0xe
c00002cc:	3f850513          	addi	a0,a0,1016 # c000e6c0 <default_pmm_manager+0x408>
c00002d0:	e0dff0ef          	jal	ra,c00000dc <cprintf>
c00002d4:	fa9ff06f          	j	c000027c <__panic+0x2c>

c00002d8 <__warn>:
c00002d8:	fc010113          	addi	sp,sp,-64
c00002dc:	00812c23          	sw	s0,24(sp)
c00002e0:	02f12a23          	sw	a5,52(sp)
c00002e4:	00060413          	mv	s0,a2
c00002e8:	02c10793          	addi	a5,sp,44
c00002ec:	00058613          	mv	a2,a1
c00002f0:	00050593          	mv	a1,a0
c00002f4:	0000d517          	auipc	a0,0xd
c00002f8:	aa850513          	addi	a0,a0,-1368 # c000cd9c <etext+0x44>
c00002fc:	00112e23          	sw	ra,28(sp)
c0000300:	02d12623          	sw	a3,44(sp)
c0000304:	02e12823          	sw	a4,48(sp)
c0000308:	03012c23          	sw	a6,56(sp)
c000030c:	03112e23          	sw	a7,60(sp)
c0000310:	00f12623          	sw	a5,12(sp)
c0000314:	dc9ff0ef          	jal	ra,c00000dc <cprintf>
c0000318:	00c12583          	lw	a1,12(sp)
c000031c:	00040513          	mv	a0,s0
c0000320:	d89ff0ef          	jal	ra,c00000a8 <vcprintf>
c0000324:	0000e517          	auipc	a0,0xe
c0000328:	39c50513          	addi	a0,a0,924 # c000e6c0 <default_pmm_manager+0x408>
c000032c:	db1ff0ef          	jal	ra,c00000dc <cprintf>
c0000330:	01c12083          	lw	ra,28(sp)
c0000334:	01812403          	lw	s0,24(sp)
c0000338:	04010113          	addi	sp,sp,64
c000033c:	00008067          	ret

c0000340 <print_kerninfo>:
c0000340:	ff010113          	addi	sp,sp,-16
c0000344:	0000d517          	auipc	a0,0xd
c0000348:	aa050513          	addi	a0,a0,-1376 # c000cde4 <etext+0x8c>
c000034c:	00112623          	sw	ra,12(sp)
c0000350:	d8dff0ef          	jal	ra,c00000dc <cprintf>
c0000354:	00000597          	auipc	a1,0x0
c0000358:	cb858593          	addi	a1,a1,-840 # c000000c <kern_init>
c000035c:	0000d517          	auipc	a0,0xd
c0000360:	aa450513          	addi	a0,a0,-1372 # c000ce00 <etext+0xa8>
c0000364:	d79ff0ef          	jal	ra,c00000dc <cprintf>
c0000368:	0000d597          	auipc	a1,0xd
c000036c:	9f058593          	addi	a1,a1,-1552 # c000cd58 <etext>
c0000370:	0000d517          	auipc	a0,0xd
c0000374:	aac50513          	addi	a0,a0,-1364 # c000ce1c <etext+0xc4>
c0000378:	d65ff0ef          	jal	ra,c00000dc <cprintf>
c000037c:	0003c597          	auipc	a1,0x3c
c0000380:	16858593          	addi	a1,a1,360 # c003c4e4 <edata>
c0000384:	0000d517          	auipc	a0,0xd
c0000388:	ab450513          	addi	a0,a0,-1356 # c000ce38 <etext+0xe0>
c000038c:	d51ff0ef          	jal	ra,c00000dc <cprintf>
c0000390:	00045597          	auipc	a1,0x45
c0000394:	73c58593          	addi	a1,a1,1852 # c0045acc <end>
c0000398:	0000d517          	auipc	a0,0xd
c000039c:	abc50513          	addi	a0,a0,-1348 # c000ce54 <etext+0xfc>
c00003a0:	d3dff0ef          	jal	ra,c00000dc <cprintf>
c00003a4:	00046597          	auipc	a1,0x46
c00003a8:	b2758593          	addi	a1,a1,-1241 # c0045ecb <end+0x3ff>
c00003ac:	00000797          	auipc	a5,0x0
c00003b0:	c6078793          	addi	a5,a5,-928 # c000000c <kern_init>
c00003b4:	40f587b3          	sub	a5,a1,a5
c00003b8:	41f7d593          	srai	a1,a5,0x1f
c00003bc:	3ff5f593          	andi	a1,a1,1023
c00003c0:	00c12083          	lw	ra,12(sp)
c00003c4:	00f585b3          	add	a1,a1,a5
c00003c8:	40a5d593          	srai	a1,a1,0xa
c00003cc:	0000d517          	auipc	a0,0xd
c00003d0:	aa450513          	addi	a0,a0,-1372 # c000ce70 <etext+0x118>
c00003d4:	01010113          	addi	sp,sp,16
c00003d8:	d05ff06f          	j	c00000dc <cprintf>

c00003dc <print_stackframe>:
c00003dc:	ff010113          	addi	sp,sp,-16
c00003e0:	0000d617          	auipc	a2,0xd
c00003e4:	9dc60613          	addi	a2,a2,-1572 # c000cdbc <etext+0x64>
c00003e8:	05b00593          	li	a1,91
c00003ec:	0000d517          	auipc	a0,0xd
c00003f0:	9e450513          	addi	a0,a0,-1564 # c000cdd0 <etext+0x78>
c00003f4:	00112623          	sw	ra,12(sp)
c00003f8:	e59ff0ef          	jal	ra,c0000250 <__panic>

c00003fc <mon_help>:
c00003fc:	ff010113          	addi	sp,sp,-16
c0000400:	0000d617          	auipc	a2,0xd
c0000404:	b5460613          	addi	a2,a2,-1196 # c000cf54 <commands+0xb8>
c0000408:	0000d597          	auipc	a1,0xd
c000040c:	b6c58593          	addi	a1,a1,-1172 # c000cf74 <commands+0xd8>
c0000410:	0000d517          	auipc	a0,0xd
c0000414:	b6c50513          	addi	a0,a0,-1172 # c000cf7c <commands+0xe0>
c0000418:	00112623          	sw	ra,12(sp)
c000041c:	cc1ff0ef          	jal	ra,c00000dc <cprintf>
c0000420:	0000d617          	auipc	a2,0xd
c0000424:	b6860613          	addi	a2,a2,-1176 # c000cf88 <commands+0xec>
c0000428:	0000d597          	auipc	a1,0xd
c000042c:	b8858593          	addi	a1,a1,-1144 # c000cfb0 <commands+0x114>
c0000430:	0000d517          	auipc	a0,0xd
c0000434:	b4c50513          	addi	a0,a0,-1204 # c000cf7c <commands+0xe0>
c0000438:	ca5ff0ef          	jal	ra,c00000dc <cprintf>
c000043c:	0000d617          	auipc	a2,0xd
c0000440:	b8060613          	addi	a2,a2,-1152 # c000cfbc <commands+0x120>
c0000444:	0000d597          	auipc	a1,0xd
c0000448:	b9858593          	addi	a1,a1,-1128 # c000cfdc <commands+0x140>
c000044c:	0000d517          	auipc	a0,0xd
c0000450:	b3050513          	addi	a0,a0,-1232 # c000cf7c <commands+0xe0>
c0000454:	c89ff0ef          	jal	ra,c00000dc <cprintf>
c0000458:	00c12083          	lw	ra,12(sp)
c000045c:	00000513          	li	a0,0
c0000460:	01010113          	addi	sp,sp,16
c0000464:	00008067          	ret

c0000468 <mon_kerninfo>:
c0000468:	ff010113          	addi	sp,sp,-16
c000046c:	00112623          	sw	ra,12(sp)
c0000470:	ed1ff0ef          	jal	ra,c0000340 <print_kerninfo>
c0000474:	00c12083          	lw	ra,12(sp)
c0000478:	00000513          	li	a0,0
c000047c:	01010113          	addi	sp,sp,16
c0000480:	00008067          	ret

c0000484 <mon_backtrace>:
c0000484:	ff010113          	addi	sp,sp,-16
c0000488:	00112623          	sw	ra,12(sp)
c000048c:	f51ff0ef          	jal	ra,c00003dc <print_stackframe>
c0000490:	00c12083          	lw	ra,12(sp)
c0000494:	00000513          	li	a0,0
c0000498:	01010113          	addi	sp,sp,16
c000049c:	00008067          	ret

c00004a0 <kmonitor>:
c00004a0:	f9010113          	addi	sp,sp,-112
c00004a4:	05812423          	sw	s8,72(sp)
c00004a8:	00050c13          	mv	s8,a0
c00004ac:	0000d517          	auipc	a0,0xd
c00004b0:	a1450513          	addi	a0,a0,-1516 # c000cec0 <commands+0x24>
c00004b4:	06112623          	sw	ra,108(sp)
c00004b8:	06812423          	sw	s0,104(sp)
c00004bc:	06912223          	sw	s1,100(sp)
c00004c0:	07212023          	sw	s2,96(sp)
c00004c4:	05312e23          	sw	s3,92(sp)
c00004c8:	05412c23          	sw	s4,88(sp)
c00004cc:	05512a23          	sw	s5,84(sp)
c00004d0:	05612823          	sw	s6,80(sp)
c00004d4:	05712623          	sw	s7,76(sp)
c00004d8:	05912223          	sw	s9,68(sp)
c00004dc:	05a12023          	sw	s10,64(sp)
c00004e0:	bfdff0ef          	jal	ra,c00000dc <cprintf>
c00004e4:	0000d517          	auipc	a0,0xd
c00004e8:	a0450513          	addi	a0,a0,-1532 # c000cee8 <commands+0x4c>
c00004ec:	bf1ff0ef          	jal	ra,c00000dc <cprintf>
c00004f0:	000c0663          	beqz	s8,c00004fc <kmonitor+0x5c>
c00004f4:	000c0513          	mv	a0,s8
c00004f8:	568000ef          	jal	ra,c0000a60 <print_trapframe>
c00004fc:	3ffff317          	auipc	t1,0x3ffff
c0000500:	394300e7          	jalr	916(t1) # fffff890 <sbi_shutdown>
c0000504:	0000dc97          	auipc	s9,0xd
c0000508:	998c8c93          	addi	s9,s9,-1640 # c000ce9c <commands>
c000050c:	0000d997          	auipc	s3,0xd
c0000510:	a0498993          	addi	s3,s3,-1532 # c000cf10 <commands+0x74>
c0000514:	0000d497          	auipc	s1,0xd
c0000518:	a0048493          	addi	s1,s1,-1536 # c000cf14 <commands+0x78>
c000051c:	00f00a13          	li	s4,15
c0000520:	01000b93          	li	s7,16
c0000524:	0000db17          	auipc	s6,0xd
c0000528:	9f8b0b13          	addi	s6,s6,-1544 # c000cf1c <commands+0x80>
c000052c:	00300a93          	li	s5,3
c0000530:	00098513          	mv	a0,s3
c0000534:	c21ff0ef          	jal	ra,c0000154 <readline>
c0000538:	00050413          	mv	s0,a0
c000053c:	fe050ae3          	beqz	a0,c0000530 <kmonitor+0x90>
c0000540:	00054583          	lbu	a1,0(a0)
c0000544:	00000913          	li	s2,0
c0000548:	0a059463          	bnez	a1,c00005f0 <kmonitor+0x150>
c000054c:	fe0902e3          	beqz	s2,c0000530 <kmonitor+0x90>
c0000550:	00012583          	lw	a1,0(sp)
c0000554:	0000dd17          	auipc	s10,0xd
c0000558:	948d0d13          	addi	s10,s10,-1720 # c000ce9c <commands>
c000055c:	0000d517          	auipc	a0,0xd
c0000560:	a1850513          	addi	a0,a0,-1512 # c000cf74 <commands+0xd8>
c0000564:	00000413          	li	s0,0
c0000568:	00cd0d13          	addi	s10,s10,12
c000056c:	13c0c0ef          	jal	ra,c000c6a8 <strcmp>
c0000570:	02050063          	beqz	a0,c0000590 <kmonitor+0xf0>
c0000574:	00140413          	addi	s0,s0,1
c0000578:	0f540c63          	beq	s0,s5,c0000670 <kmonitor+0x1d0>
c000057c:	000d2503          	lw	a0,0(s10)
c0000580:	00012583          	lw	a1,0(sp)
c0000584:	00cd0d13          	addi	s10,s10,12
c0000588:	1200c0ef          	jal	ra,c000c6a8 <strcmp>
c000058c:	fe0514e3          	bnez	a0,c0000574 <kmonitor+0xd4>
c0000590:	00141793          	slli	a5,s0,0x1
c0000594:	008787b3          	add	a5,a5,s0
c0000598:	00279793          	slli	a5,a5,0x2
c000059c:	00fc87b3          	add	a5,s9,a5
c00005a0:	0087a783          	lw	a5,8(a5)
c00005a4:	000c0613          	mv	a2,s8
c00005a8:	00410593          	addi	a1,sp,4
c00005ac:	fff90513          	addi	a0,s2,-1
c00005b0:	000780e7          	jalr	a5
c00005b4:	f6055ee3          	bgez	a0,c0000530 <kmonitor+0x90>
c00005b8:	06c12083          	lw	ra,108(sp)
c00005bc:	06812403          	lw	s0,104(sp)
c00005c0:	06412483          	lw	s1,100(sp)
c00005c4:	06012903          	lw	s2,96(sp)
c00005c8:	05c12983          	lw	s3,92(sp)
c00005cc:	05812a03          	lw	s4,88(sp)
c00005d0:	05412a83          	lw	s5,84(sp)
c00005d4:	05012b03          	lw	s6,80(sp)
c00005d8:	04c12b83          	lw	s7,76(sp)
c00005dc:	04812c03          	lw	s8,72(sp)
c00005e0:	04412c83          	lw	s9,68(sp)
c00005e4:	04012d03          	lw	s10,64(sp)
c00005e8:	07010113          	addi	sp,sp,112
c00005ec:	00008067          	ret
c00005f0:	00048513          	mv	a0,s1
c00005f4:	0e80c0ef          	jal	ra,c000c6dc <strchr>
c00005f8:	00050c63          	beqz	a0,c0000610 <kmonitor+0x170>
c00005fc:	00144583          	lbu	a1,1(s0)
c0000600:	00040023          	sb	zero,0(s0)
c0000604:	00140413          	addi	s0,s0,1
c0000608:	f40582e3          	beqz	a1,c000054c <kmonitor+0xac>
c000060c:	fe5ff06f          	j	c00005f0 <kmonitor+0x150>
c0000610:	00044783          	lbu	a5,0(s0)
c0000614:	f2078ce3          	beqz	a5,c000054c <kmonitor+0xac>
c0000618:	05490463          	beq	s2,s4,c0000660 <kmonitor+0x1c0>
c000061c:	00291793          	slli	a5,s2,0x2
c0000620:	04010713          	addi	a4,sp,64
c0000624:	00f707b3          	add	a5,a4,a5
c0000628:	fc87a023          	sw	s0,-64(a5)
c000062c:	00044583          	lbu	a1,0(s0)
c0000630:	00190913          	addi	s2,s2,1
c0000634:	00059a63          	bnez	a1,c0000648 <kmonitor+0x1a8>
c0000638:	f19ff06f          	j	c0000550 <kmonitor+0xb0>
c000063c:	00140413          	addi	s0,s0,1
c0000640:	00044583          	lbu	a1,0(s0)
c0000644:	f00586e3          	beqz	a1,c0000550 <kmonitor+0xb0>
c0000648:	00048513          	mv	a0,s1
c000064c:	0900c0ef          	jal	ra,c000c6dc <strchr>
c0000650:	fe0506e3          	beqz	a0,c000063c <kmonitor+0x19c>
c0000654:	00044583          	lbu	a1,0(s0)
c0000658:	ee058ae3          	beqz	a1,c000054c <kmonitor+0xac>
c000065c:	f95ff06f          	j	c00005f0 <kmonitor+0x150>
c0000660:	000b8593          	mv	a1,s7
c0000664:	000b0513          	mv	a0,s6
c0000668:	a75ff0ef          	jal	ra,c00000dc <cprintf>
c000066c:	fb1ff06f          	j	c000061c <kmonitor+0x17c>
c0000670:	00012583          	lw	a1,0(sp)
c0000674:	0000d517          	auipc	a0,0xd
c0000678:	8c850513          	addi	a0,a0,-1848 # c000cf3c <commands+0xa0>
c000067c:	a61ff0ef          	jal	ra,c00000dc <cprintf>
c0000680:	eb1ff06f          	j	c0000530 <kmonitor+0x90>

c0000684 <ide_init>:
c0000684:	00008067          	ret

c0000688 <ide_device_valid>:
c0000688:	00253513          	sltiu	a0,a0,2
c000068c:	00008067          	ret

c0000690 <ide_device_size>:
c0000690:	03800513          	li	a0,56
c0000694:	00008067          	ret

c0000698 <ide_read_secs>:
c0000698:	0003c797          	auipc	a5,0x3c
c000069c:	25078793          	addi	a5,a5,592 # c003c8e8 <ide>
c00006a0:	00959593          	slli	a1,a1,0x9
c00006a4:	ff010113          	addi	sp,sp,-16
c00006a8:	00060513          	mv	a0,a2
c00006ac:	00b785b3          	add	a1,a5,a1
c00006b0:	00969613          	slli	a2,a3,0x9
c00006b4:	00112623          	sw	ra,12(sp)
c00006b8:	06c0c0ef          	jal	ra,c000c724 <memcpy>
c00006bc:	00c12083          	lw	ra,12(sp)
c00006c0:	00000513          	li	a0,0
c00006c4:	01010113          	addi	sp,sp,16
c00006c8:	00008067          	ret

c00006cc <ide_write_secs>:
c00006cc:	00060713          	mv	a4,a2
c00006d0:	00959793          	slli	a5,a1,0x9
c00006d4:	0003c517          	auipc	a0,0x3c
c00006d8:	21450513          	addi	a0,a0,532 # c003c8e8 <ide>
c00006dc:	ff010113          	addi	sp,sp,-16
c00006e0:	00969613          	slli	a2,a3,0x9
c00006e4:	00070593          	mv	a1,a4
c00006e8:	00f50533          	add	a0,a0,a5
c00006ec:	00112623          	sw	ra,12(sp)
c00006f0:	0340c0ef          	jal	ra,c000c724 <memcpy>
c00006f4:	00c12083          	lw	ra,12(sp)
c00006f8:	00000513          	li	a0,0
c00006fc:	01010113          	addi	sp,sp,16
c0000700:	00008067          	ret

c0000704 <clock_set_next_event>:
c0000704:	c81027f3          	rdtimeh	a5
c0000708:	c01025f3          	rdtime	a1
c000070c:	c8102773          	rdtimeh	a4
c0000710:	fee79ae3          	bne	a5,a4,c0000704 <clock_set_next_event>
c0000714:	00045717          	auipc	a4,0x45
c0000718:	1ec70713          	addi	a4,a4,492 # c0045900 <timebase>
c000071c:	00072503          	lw	a0,0(a4)
c0000720:	00472703          	lw	a4,4(a4)
c0000724:	00a58533          	add	a0,a1,a0
c0000728:	00b535b3          	sltu	a1,a0,a1
c000072c:	00e787b3          	add	a5,a5,a4
c0000730:	00f585b3          	add	a1,a1,a5
c0000734:	3ffff317          	auipc	t1,0x3ffff
c0000738:	16c30067          	jr	364(t1) # fffff8a0 <sbi_set_timer>

c000073c <clock_init>:
c000073c:	ff010113          	addi	sp,sp,-16
c0000740:	00112623          	sw	ra,12(sp)
c0000744:	3ffff317          	auipc	t1,0x3ffff
c0000748:	13c300e7          	jalr	316(t1) # fffff880 <sbi_timebase>
c000074c:	1f400793          	li	a5,500
c0000750:	02f55533          	divu	a0,a0,a5
c0000754:	00045797          	auipc	a5,0x45
c0000758:	1ac78793          	addi	a5,a5,428 # c0045900 <timebase>
c000075c:	0007a223          	sw	zero,4(a5)
c0000760:	00a7a023          	sw	a0,0(a5)
c0000764:	fa1ff0ef          	jal	ra,c0000704 <clock_set_next_event>
c0000768:	00c12083          	lw	ra,12(sp)
c000076c:	0000d517          	auipc	a0,0xd
c0000770:	87c50513          	addi	a0,a0,-1924 # c000cfe8 <commands+0x14c>
c0000774:	00045297          	auipc	t0,0x45
c0000778:	1c02a823          	sw	zero,464(t0) # c0045944 <ticks>
c000077c:	01010113          	addi	sp,sp,16
c0000780:	95dff06f          	j	c00000dc <cprintf>

c0000784 <cons_init>:
c0000784:	00008067          	ret

c0000788 <cons_putc>:
c0000788:	100027f3          	csrr	a5,sstatus
c000078c:	0027f793          	andi	a5,a5,2
c0000790:	00079863          	bnez	a5,c00007a0 <cons_putc+0x18>
c0000794:	0ff57513          	andi	a0,a0,255
c0000798:	3ffff317          	auipc	t1,0x3ffff
c000079c:	09830067          	jr	152(t1) # fffff830 <sbi_console_putchar>
c00007a0:	ff010113          	addi	sp,sp,-16
c00007a4:	00112623          	sw	ra,12(sp)
c00007a8:	00812423          	sw	s0,8(sp)
c00007ac:	00050413          	mv	s0,a0
c00007b0:	074000ef          	jal	ra,c0000824 <intr_disable>
c00007b4:	0ff47513          	andi	a0,s0,255
c00007b8:	3ffff317          	auipc	t1,0x3ffff
c00007bc:	078300e7          	jalr	120(t1) # fffff830 <sbi_console_putchar>
c00007c0:	00c12083          	lw	ra,12(sp)
c00007c4:	00812403          	lw	s0,8(sp)
c00007c8:	01010113          	addi	sp,sp,16
c00007cc:	0500006f          	j	c000081c <intr_enable>

c00007d0 <cons_getc>:
c00007d0:	100027f3          	csrr	a5,sstatus
c00007d4:	0027f793          	andi	a5,a5,2
c00007d8:	00079663          	bnez	a5,c00007e4 <cons_getc+0x14>
c00007dc:	3ffff317          	auipc	t1,0x3ffff
c00007e0:	06430067          	jr	100(t1) # fffff840 <sbi_console_getchar>
c00007e4:	ff010113          	addi	sp,sp,-16
c00007e8:	00112623          	sw	ra,12(sp)
c00007ec:	00812423          	sw	s0,8(sp)
c00007f0:	034000ef          	jal	ra,c0000824 <intr_disable>
c00007f4:	3ffff317          	auipc	t1,0x3ffff
c00007f8:	04c300e7          	jalr	76(t1) # fffff840 <sbi_console_getchar>
c00007fc:	00050413          	mv	s0,a0
c0000800:	01c000ef          	jal	ra,c000081c <intr_enable>
c0000804:	00c12083          	lw	ra,12(sp)
c0000808:	00040513          	mv	a0,s0
c000080c:	00812403          	lw	s0,8(sp)
c0000810:	01010113          	addi	sp,sp,16
c0000814:	00008067          	ret

c0000818 <pic_init>:
c0000818:	00008067          	ret

c000081c <intr_enable>:
c000081c:	100167f3          	csrrsi	a5,sstatus,2
c0000820:	00008067          	ret

c0000824 <intr_disable>:
c0000824:	100177f3          	csrrci	a5,sstatus,2
c0000828:	00008067          	ret

c000082c <idt_init>:
c000082c:	14005073          	csrwi	sscratch,0
c0000830:	00000797          	auipc	a5,0x0
c0000834:	6c078793          	addi	a5,a5,1728 # c0000ef0 <__alltraps>
c0000838:	10579073          	csrw	stvec,a5
c000083c:	100167f3          	csrrsi	a5,sstatus,2
c0000840:	00008067          	ret

c0000844 <print_regs>:
c0000844:	00052583          	lw	a1,0(a0)
c0000848:	ff010113          	addi	sp,sp,-16
c000084c:	00812423          	sw	s0,8(sp)
c0000850:	00050413          	mv	s0,a0
c0000854:	0000d517          	auipc	a0,0xd
c0000858:	a6450513          	addi	a0,a0,-1436 # c000d2b8 <commands+0x41c>
c000085c:	00112623          	sw	ra,12(sp)
c0000860:	87dff0ef          	jal	ra,c00000dc <cprintf>
c0000864:	00442583          	lw	a1,4(s0)
c0000868:	0000d517          	auipc	a0,0xd
c000086c:	a6450513          	addi	a0,a0,-1436 # c000d2cc <commands+0x430>
c0000870:	86dff0ef          	jal	ra,c00000dc <cprintf>
c0000874:	00842583          	lw	a1,8(s0)
c0000878:	0000d517          	auipc	a0,0xd
c000087c:	a6850513          	addi	a0,a0,-1432 # c000d2e0 <commands+0x444>
c0000880:	85dff0ef          	jal	ra,c00000dc <cprintf>
c0000884:	00c42583          	lw	a1,12(s0)
c0000888:	0000d517          	auipc	a0,0xd
c000088c:	a6c50513          	addi	a0,a0,-1428 # c000d2f4 <commands+0x458>
c0000890:	84dff0ef          	jal	ra,c00000dc <cprintf>
c0000894:	01042583          	lw	a1,16(s0)
c0000898:	0000d517          	auipc	a0,0xd
c000089c:	a7050513          	addi	a0,a0,-1424 # c000d308 <commands+0x46c>
c00008a0:	83dff0ef          	jal	ra,c00000dc <cprintf>
c00008a4:	01442583          	lw	a1,20(s0)
c00008a8:	0000d517          	auipc	a0,0xd
c00008ac:	a7450513          	addi	a0,a0,-1420 # c000d31c <commands+0x480>
c00008b0:	82dff0ef          	jal	ra,c00000dc <cprintf>
c00008b4:	01842583          	lw	a1,24(s0)
c00008b8:	0000d517          	auipc	a0,0xd
c00008bc:	a7850513          	addi	a0,a0,-1416 # c000d330 <commands+0x494>
c00008c0:	81dff0ef          	jal	ra,c00000dc <cprintf>
c00008c4:	01c42583          	lw	a1,28(s0)
c00008c8:	0000d517          	auipc	a0,0xd
c00008cc:	a7c50513          	addi	a0,a0,-1412 # c000d344 <commands+0x4a8>
c00008d0:	80dff0ef          	jal	ra,c00000dc <cprintf>
c00008d4:	02042583          	lw	a1,32(s0)
c00008d8:	0000d517          	auipc	a0,0xd
c00008dc:	a8050513          	addi	a0,a0,-1408 # c000d358 <commands+0x4bc>
c00008e0:	ffcff0ef          	jal	ra,c00000dc <cprintf>
c00008e4:	02442583          	lw	a1,36(s0)
c00008e8:	0000d517          	auipc	a0,0xd
c00008ec:	a8450513          	addi	a0,a0,-1404 # c000d36c <commands+0x4d0>
c00008f0:	fecff0ef          	jal	ra,c00000dc <cprintf>
c00008f4:	02842583          	lw	a1,40(s0)
c00008f8:	0000d517          	auipc	a0,0xd
c00008fc:	a8850513          	addi	a0,a0,-1400 # c000d380 <commands+0x4e4>
c0000900:	fdcff0ef          	jal	ra,c00000dc <cprintf>
c0000904:	02c42583          	lw	a1,44(s0)
c0000908:	0000d517          	auipc	a0,0xd
c000090c:	a8c50513          	addi	a0,a0,-1396 # c000d394 <commands+0x4f8>
c0000910:	fccff0ef          	jal	ra,c00000dc <cprintf>
c0000914:	03042583          	lw	a1,48(s0)
c0000918:	0000d517          	auipc	a0,0xd
c000091c:	a9050513          	addi	a0,a0,-1392 # c000d3a8 <commands+0x50c>
c0000920:	fbcff0ef          	jal	ra,c00000dc <cprintf>
c0000924:	03442583          	lw	a1,52(s0)
c0000928:	0000d517          	auipc	a0,0xd
c000092c:	a9450513          	addi	a0,a0,-1388 # c000d3bc <commands+0x520>
c0000930:	facff0ef          	jal	ra,c00000dc <cprintf>
c0000934:	03842583          	lw	a1,56(s0)
c0000938:	0000d517          	auipc	a0,0xd
c000093c:	a9850513          	addi	a0,a0,-1384 # c000d3d0 <commands+0x534>
c0000940:	f9cff0ef          	jal	ra,c00000dc <cprintf>
c0000944:	03c42583          	lw	a1,60(s0)
c0000948:	0000d517          	auipc	a0,0xd
c000094c:	a9c50513          	addi	a0,a0,-1380 # c000d3e4 <commands+0x548>
c0000950:	f8cff0ef          	jal	ra,c00000dc <cprintf>
c0000954:	04042583          	lw	a1,64(s0)
c0000958:	0000d517          	auipc	a0,0xd
c000095c:	aa050513          	addi	a0,a0,-1376 # c000d3f8 <commands+0x55c>
c0000960:	f7cff0ef          	jal	ra,c00000dc <cprintf>
c0000964:	04442583          	lw	a1,68(s0)
c0000968:	0000d517          	auipc	a0,0xd
c000096c:	aa450513          	addi	a0,a0,-1372 # c000d40c <commands+0x570>
c0000970:	f6cff0ef          	jal	ra,c00000dc <cprintf>
c0000974:	04842583          	lw	a1,72(s0)
c0000978:	0000d517          	auipc	a0,0xd
c000097c:	aa850513          	addi	a0,a0,-1368 # c000d420 <commands+0x584>
c0000980:	f5cff0ef          	jal	ra,c00000dc <cprintf>
c0000984:	04c42583          	lw	a1,76(s0)
c0000988:	0000d517          	auipc	a0,0xd
c000098c:	aac50513          	addi	a0,a0,-1364 # c000d434 <commands+0x598>
c0000990:	f4cff0ef          	jal	ra,c00000dc <cprintf>
c0000994:	05042583          	lw	a1,80(s0)
c0000998:	0000d517          	auipc	a0,0xd
c000099c:	ab050513          	addi	a0,a0,-1360 # c000d448 <commands+0x5ac>
c00009a0:	f3cff0ef          	jal	ra,c00000dc <cprintf>
c00009a4:	05442583          	lw	a1,84(s0)
c00009a8:	0000d517          	auipc	a0,0xd
c00009ac:	ab450513          	addi	a0,a0,-1356 # c000d45c <commands+0x5c0>
c00009b0:	f2cff0ef          	jal	ra,c00000dc <cprintf>
c00009b4:	05842583          	lw	a1,88(s0)
c00009b8:	0000d517          	auipc	a0,0xd
c00009bc:	ab850513          	addi	a0,a0,-1352 # c000d470 <commands+0x5d4>
c00009c0:	f1cff0ef          	jal	ra,c00000dc <cprintf>
c00009c4:	05c42583          	lw	a1,92(s0)
c00009c8:	0000d517          	auipc	a0,0xd
c00009cc:	abc50513          	addi	a0,a0,-1348 # c000d484 <commands+0x5e8>
c00009d0:	f0cff0ef          	jal	ra,c00000dc <cprintf>
c00009d4:	06042583          	lw	a1,96(s0)
c00009d8:	0000d517          	auipc	a0,0xd
c00009dc:	ac050513          	addi	a0,a0,-1344 # c000d498 <commands+0x5fc>
c00009e0:	efcff0ef          	jal	ra,c00000dc <cprintf>
c00009e4:	06442583          	lw	a1,100(s0)
c00009e8:	0000d517          	auipc	a0,0xd
c00009ec:	ac450513          	addi	a0,a0,-1340 # c000d4ac <commands+0x610>
c00009f0:	eecff0ef          	jal	ra,c00000dc <cprintf>
c00009f4:	06842583          	lw	a1,104(s0)
c00009f8:	0000d517          	auipc	a0,0xd
c00009fc:	ac850513          	addi	a0,a0,-1336 # c000d4c0 <commands+0x624>
c0000a00:	edcff0ef          	jal	ra,c00000dc <cprintf>
c0000a04:	06c42583          	lw	a1,108(s0)
c0000a08:	0000d517          	auipc	a0,0xd
c0000a0c:	acc50513          	addi	a0,a0,-1332 # c000d4d4 <commands+0x638>
c0000a10:	eccff0ef          	jal	ra,c00000dc <cprintf>
c0000a14:	07042583          	lw	a1,112(s0)
c0000a18:	0000d517          	auipc	a0,0xd
c0000a1c:	ad050513          	addi	a0,a0,-1328 # c000d4e8 <commands+0x64c>
c0000a20:	ebcff0ef          	jal	ra,c00000dc <cprintf>
c0000a24:	07442583          	lw	a1,116(s0)
c0000a28:	0000d517          	auipc	a0,0xd
c0000a2c:	ad450513          	addi	a0,a0,-1324 # c000d4fc <commands+0x660>
c0000a30:	eacff0ef          	jal	ra,c00000dc <cprintf>
c0000a34:	07842583          	lw	a1,120(s0)
c0000a38:	0000d517          	auipc	a0,0xd
c0000a3c:	ad850513          	addi	a0,a0,-1320 # c000d510 <commands+0x674>
c0000a40:	e9cff0ef          	jal	ra,c00000dc <cprintf>
c0000a44:	07c42583          	lw	a1,124(s0)
c0000a48:	00c12083          	lw	ra,12(sp)
c0000a4c:	00812403          	lw	s0,8(sp)
c0000a50:	0000d517          	auipc	a0,0xd
c0000a54:	ad450513          	addi	a0,a0,-1324 # c000d524 <commands+0x688>
c0000a58:	01010113          	addi	sp,sp,16
c0000a5c:	e80ff06f          	j	c00000dc <cprintf>

c0000a60 <print_trapframe>:
c0000a60:	ff010113          	addi	sp,sp,-16
c0000a64:	00050593          	mv	a1,a0
c0000a68:	00812423          	sw	s0,8(sp)
c0000a6c:	00050413          	mv	s0,a0
c0000a70:	0000d517          	auipc	a0,0xd
c0000a74:	ac850513          	addi	a0,a0,-1336 # c000d538 <commands+0x69c>
c0000a78:	00112623          	sw	ra,12(sp)
c0000a7c:	e60ff0ef          	jal	ra,c00000dc <cprintf>
c0000a80:	00040513          	mv	a0,s0
c0000a84:	dc1ff0ef          	jal	ra,c0000844 <print_regs>
c0000a88:	08042583          	lw	a1,128(s0)
c0000a8c:	0000d517          	auipc	a0,0xd
c0000a90:	ac050513          	addi	a0,a0,-1344 # c000d54c <commands+0x6b0>
c0000a94:	e48ff0ef          	jal	ra,c00000dc <cprintf>
c0000a98:	08442583          	lw	a1,132(s0)
c0000a9c:	0000d517          	auipc	a0,0xd
c0000aa0:	ac450513          	addi	a0,a0,-1340 # c000d560 <commands+0x6c4>
c0000aa4:	e38ff0ef          	jal	ra,c00000dc <cprintf>
c0000aa8:	08842583          	lw	a1,136(s0)
c0000aac:	0000d517          	auipc	a0,0xd
c0000ab0:	ac850513          	addi	a0,a0,-1336 # c000d574 <commands+0x6d8>
c0000ab4:	e28ff0ef          	jal	ra,c00000dc <cprintf>
c0000ab8:	08c42583          	lw	a1,140(s0)
c0000abc:	00c12083          	lw	ra,12(sp)
c0000ac0:	00812403          	lw	s0,8(sp)
c0000ac4:	0000d517          	auipc	a0,0xd
c0000ac8:	ac450513          	addi	a0,a0,-1340 # c000d588 <commands+0x6ec>
c0000acc:	01010113          	addi	sp,sp,16
c0000ad0:	e0cff06f          	j	c00000dc <cprintf>

c0000ad4 <pgfault_handler>:
c0000ad4:	ff010113          	addi	sp,sp,-16
c0000ad8:	00812423          	sw	s0,8(sp)
c0000adc:	00112623          	sw	ra,12(sp)
c0000ae0:	00045797          	auipc	a5,0x45
c0000ae4:	e687a783          	lw	a5,-408(a5) # c0045948 <check_mm_struct>
c0000ae8:	00050413          	mv	s0,a0
c0000aec:	06078c63          	beqz	a5,c0000b64 <pgfault_handler+0x90>
c0000af0:	08052783          	lw	a5,128(a0)
c0000af4:	08852583          	lw	a1,136(a0)
c0000af8:	04b00613          	li	a2,75
c0000afc:	1007f793          	andi	a5,a5,256
c0000b00:	04078e63          	beqz	a5,c0000b5c <pgfault_handler+0x88>
c0000b04:	08c42703          	lw	a4,140(s0)
c0000b08:	00700793          	li	a5,7
c0000b0c:	05700693          	li	a3,87
c0000b10:	00f70463          	beq	a4,a5,c0000b18 <pgfault_handler+0x44>
c0000b14:	05200693          	li	a3,82
c0000b18:	0000c517          	auipc	a0,0xc
c0000b1c:	72850513          	addi	a0,a0,1832 # c000d240 <commands+0x3a4>
c0000b20:	dbcff0ef          	jal	ra,c00000dc <cprintf>
c0000b24:	00045517          	auipc	a0,0x45
c0000b28:	e2452503          	lw	a0,-476(a0) # c0045948 <check_mm_struct>
c0000b2c:	02050c63          	beqz	a0,c0000b64 <pgfault_handler+0x90>
c0000b30:	00045717          	auipc	a4,0x45
c0000b34:	df472703          	lw	a4,-524(a4) # c0045924 <current>
c0000b38:	00045797          	auipc	a5,0x45
c0000b3c:	df07a783          	lw	a5,-528(a5) # c0045928 <idleproc>
c0000b40:	04f71663          	bne	a4,a5,c0000b8c <pgfault_handler+0xb8>
c0000b44:	08842603          	lw	a2,136(s0)
c0000b48:	08c42583          	lw	a1,140(s0)
c0000b4c:	00c12083          	lw	ra,12(sp)
c0000b50:	00812403          	lw	s0,8(sp)
c0000b54:	01010113          	addi	sp,sp,16
c0000b58:	7b90006f          	j	c0001b10 <do_pgfault>
c0000b5c:	05500613          	li	a2,85
c0000b60:	fa5ff06f          	j	c0000b04 <pgfault_handler+0x30>
c0000b64:	00045797          	auipc	a5,0x45
c0000b68:	dc07a783          	lw	a5,-576(a5) # c0045924 <current>
c0000b6c:	04078063          	beqz	a5,c0000bac <pgfault_handler+0xd8>
c0000b70:	08842603          	lw	a2,136(s0)
c0000b74:	08c42583          	lw	a1,140(s0)
c0000b78:	00c12083          	lw	ra,12(sp)
c0000b7c:	00812403          	lw	s0,8(sp)
c0000b80:	0187a503          	lw	a0,24(a5)
c0000b84:	01010113          	addi	sp,sp,16
c0000b88:	7890006f          	j	c0001b10 <do_pgfault>
c0000b8c:	0000c697          	auipc	a3,0xc
c0000b90:	6d468693          	addi	a3,a3,1748 # c000d260 <commands+0x3c4>
c0000b94:	0000c617          	auipc	a2,0xc
c0000b98:	6e060613          	addi	a2,a2,1760 # c000d274 <commands+0x3d8>
c0000b9c:	06d00593          	li	a1,109
c0000ba0:	0000c517          	auipc	a0,0xc
c0000ba4:	6ec50513          	addi	a0,a0,1772 # c000d28c <commands+0x3f0>
c0000ba8:	ea8ff0ef          	jal	ra,c0000250 <__panic>
c0000bac:	00040513          	mv	a0,s0
c0000bb0:	eb1ff0ef          	jal	ra,c0000a60 <print_trapframe>
c0000bb4:	08042783          	lw	a5,128(s0)
c0000bb8:	08842583          	lw	a1,136(s0)
c0000bbc:	04b00613          	li	a2,75
c0000bc0:	1007f793          	andi	a5,a5,256
c0000bc4:	00079463          	bnez	a5,c0000bcc <pgfault_handler+0xf8>
c0000bc8:	05500613          	li	a2,85
c0000bcc:	08c42703          	lw	a4,140(s0)
c0000bd0:	00700793          	li	a5,7
c0000bd4:	02f70663          	beq	a4,a5,c0000c00 <pgfault_handler+0x12c>
c0000bd8:	05200693          	li	a3,82
c0000bdc:	0000c517          	auipc	a0,0xc
c0000be0:	66450513          	addi	a0,a0,1636 # c000d240 <commands+0x3a4>
c0000be4:	cf8ff0ef          	jal	ra,c00000dc <cprintf>
c0000be8:	0000c617          	auipc	a2,0xc
c0000bec:	6b860613          	addi	a2,a2,1720 # c000d2a0 <commands+0x404>
c0000bf0:	07400593          	li	a1,116
c0000bf4:	0000c517          	auipc	a0,0xc
c0000bf8:	69850513          	addi	a0,a0,1688 # c000d28c <commands+0x3f0>
c0000bfc:	e54ff0ef          	jal	ra,c0000250 <__panic>
c0000c00:	05700693          	li	a3,87
c0000c04:	fd9ff06f          	j	c0000bdc <pgfault_handler+0x108>

c0000c08 <interrupt_handler>:
c0000c08:	08c52783          	lw	a5,140(a0)
c0000c0c:	80000737          	lui	a4,0x80000
c0000c10:	fff74713          	not	a4,a4
c0000c14:	00e7f7b3          	and	a5,a5,a4
c0000c18:	00b00713          	li	a4,11
c0000c1c:	08f76463          	bltu	a4,a5,c0000ca4 <interrupt_handler+0x9c>
c0000c20:	0000c717          	auipc	a4,0xc
c0000c24:	3e470713          	addi	a4,a4,996 # c000d004 <commands+0x168>
c0000c28:	00279793          	slli	a5,a5,0x2
c0000c2c:	00e787b3          	add	a5,a5,a4
c0000c30:	0007a783          	lw	a5,0(a5)
c0000c34:	00e787b3          	add	a5,a5,a4
c0000c38:	00078067          	jr	a5
c0000c3c:	0000c517          	auipc	a0,0xc
c0000c40:	56c50513          	addi	a0,a0,1388 # c000d1a8 <commands+0x30c>
c0000c44:	c98ff06f          	j	c00000dc <cprintf>
c0000c48:	0000c517          	auipc	a0,0xc
c0000c4c:	59c50513          	addi	a0,a0,1436 # c000d1e4 <commands+0x348>
c0000c50:	c8cff06f          	j	c00000dc <cprintf>
c0000c54:	0000c517          	auipc	a0,0xc
c0000c58:	5b050513          	addi	a0,a0,1456 # c000d204 <commands+0x368>
c0000c5c:	c80ff06f          	j	c00000dc <cprintf>
c0000c60:	0000c517          	auipc	a0,0xc
c0000c64:	5c050513          	addi	a0,a0,1472 # c000d220 <commands+0x384>
c0000c68:	c74ff06f          	j	c00000dc <cprintf>
c0000c6c:	ff010113          	addi	sp,sp,-16
c0000c70:	00112623          	sw	ra,12(sp)
c0000c74:	a91ff0ef          	jal	ra,c0000704 <clock_set_next_event>
c0000c78:	00045797          	auipc	a5,0x45
c0000c7c:	ccc7a783          	lw	a5,-820(a5) # c0045944 <ticks>
c0000c80:	00c12083          	lw	ra,12(sp)
c0000c84:	00178793          	addi	a5,a5,1
c0000c88:	00045297          	auipc	t0,0x45
c0000c8c:	caf2ae23          	sw	a5,-836(t0) # c0045944 <ticks>
c0000c90:	01010113          	addi	sp,sp,16
c0000c94:	4550706f          	j	c00088e8 <run_timer_list>
c0000c98:	0000c517          	auipc	a0,0xc
c0000c9c:	52c50513          	addi	a0,a0,1324 # c000d1c4 <commands+0x328>
c0000ca0:	c3cff06f          	j	c00000dc <cprintf>
c0000ca4:	dbdff06f          	j	c0000a60 <print_trapframe>

c0000ca8 <exception_handler>:
c0000ca8:	08c52783          	lw	a5,140(a0)
c0000cac:	00b00693          	li	a3,11
c0000cb0:	16f6e063          	bltu	a3,a5,c0000e10 <exception_handler+0x168>
c0000cb4:	0000c717          	auipc	a4,0xc
c0000cb8:	38070713          	addi	a4,a4,896 # c000d034 <commands+0x198>
c0000cbc:	00279793          	slli	a5,a5,0x2
c0000cc0:	00e787b3          	add	a5,a5,a4
c0000cc4:	0007a783          	lw	a5,0(a5)
c0000cc8:	ff010113          	addi	sp,sp,-16
c0000ccc:	00812423          	sw	s0,8(sp)
c0000cd0:	00112623          	sw	ra,12(sp)
c0000cd4:	00912223          	sw	s1,4(sp)
c0000cd8:	00e787b3          	add	a5,a5,a4
c0000cdc:	00050413          	mv	s0,a0
c0000ce0:	00078067          	jr	a5
c0000ce4:	0000c517          	auipc	a0,0xc
c0000ce8:	46450513          	addi	a0,a0,1124 # c000d148 <commands+0x2ac>
c0000cec:	bf0ff0ef          	jal	ra,c00000dc <cprintf>
c0000cf0:	08442783          	lw	a5,132(s0)
c0000cf4:	00c12083          	lw	ra,12(sp)
c0000cf8:	00412483          	lw	s1,4(sp)
c0000cfc:	00478793          	addi	a5,a5,4
c0000d00:	08f42223          	sw	a5,132(s0)
c0000d04:	00812403          	lw	s0,8(sp)
c0000d08:	01010113          	addi	sp,sp,16
c0000d0c:	0590b06f          	j	c000c564 <syscall>
c0000d10:	0000c517          	auipc	a0,0xc
c0000d14:	45850513          	addi	a0,a0,1112 # c000d168 <commands+0x2cc>
c0000d18:	00c12083          	lw	ra,12(sp)
c0000d1c:	00812403          	lw	s0,8(sp)
c0000d20:	00412483          	lw	s1,4(sp)
c0000d24:	01010113          	addi	sp,sp,16
c0000d28:	bb4ff06f          	j	c00000dc <cprintf>
c0000d2c:	0000c517          	auipc	a0,0xc
c0000d30:	45c50513          	addi	a0,a0,1116 # c000d188 <commands+0x2ec>
c0000d34:	fe5ff06f          	j	c0000d18 <exception_handler+0x70>
c0000d38:	0000c517          	auipc	a0,0xc
c0000d3c:	32c50513          	addi	a0,a0,812 # c000d064 <commands+0x1c8>
c0000d40:	fd9ff06f          	j	c0000d18 <exception_handler+0x70>
c0000d44:	0000c517          	auipc	a0,0xc
c0000d48:	34050513          	addi	a0,a0,832 # c000d084 <commands+0x1e8>
c0000d4c:	b90ff0ef          	jal	ra,c00000dc <cprintf>
c0000d50:	00040513          	mv	a0,s0
c0000d54:	d0dff0ef          	jal	ra,c0000a60 <print_trapframe>
c0000d58:	00c12083          	lw	ra,12(sp)
c0000d5c:	00812403          	lw	s0,8(sp)
c0000d60:	00412483          	lw	s1,4(sp)
c0000d64:	01010113          	addi	sp,sp,16
c0000d68:	3ffff317          	auipc	t1,0x3ffff
c0000d6c:	b2830067          	jr	-1240(t1) # fffff890 <sbi_shutdown>
c0000d70:	0000c517          	auipc	a0,0xc
c0000d74:	33050513          	addi	a0,a0,816 # c000d0a0 <commands+0x204>
c0000d78:	fd5ff06f          	j	c0000d4c <exception_handler+0xa4>
c0000d7c:	0000c517          	auipc	a0,0xc
c0000d80:	33c50513          	addi	a0,a0,828 # c000d0b8 <commands+0x21c>
c0000d84:	f95ff06f          	j	c0000d18 <exception_handler+0x70>
c0000d88:	0000c517          	auipc	a0,0xc
c0000d8c:	33c50513          	addi	a0,a0,828 # c000d0c4 <commands+0x228>
c0000d90:	f89ff06f          	j	c0000d18 <exception_handler+0x70>
c0000d94:	0000c517          	auipc	a0,0xc
c0000d98:	34c50513          	addi	a0,a0,844 # c000d0e0 <commands+0x244>
c0000d9c:	b40ff0ef          	jal	ra,c00000dc <cprintf>
c0000da0:	00040513          	mv	a0,s0
c0000da4:	d31ff0ef          	jal	ra,c0000ad4 <pgfault_handler>
c0000da8:	00050493          	mv	s1,a0
c0000dac:	06051463          	bnez	a0,c0000e14 <exception_handler+0x16c>
c0000db0:	00c12083          	lw	ra,12(sp)
c0000db4:	00812403          	lw	s0,8(sp)
c0000db8:	00412483          	lw	s1,4(sp)
c0000dbc:	01010113          	addi	sp,sp,16
c0000dc0:	00008067          	ret
c0000dc4:	0000c517          	auipc	a0,0xc
c0000dc8:	34c50513          	addi	a0,a0,844 # c000d110 <commands+0x274>
c0000dcc:	f4dff06f          	j	c0000d18 <exception_handler+0x70>
c0000dd0:	0000c517          	auipc	a0,0xc
c0000dd4:	36050513          	addi	a0,a0,864 # c000d130 <commands+0x294>
c0000dd8:	b04ff0ef          	jal	ra,c00000dc <cprintf>
c0000ddc:	00040513          	mv	a0,s0
c0000de0:	cf5ff0ef          	jal	ra,c0000ad4 <pgfault_handler>
c0000de4:	00050493          	mv	s1,a0
c0000de8:	fc0504e3          	beqz	a0,c0000db0 <exception_handler+0x108>
c0000dec:	00040513          	mv	a0,s0
c0000df0:	c71ff0ef          	jal	ra,c0000a60 <print_trapframe>
c0000df4:	00048693          	mv	a3,s1
c0000df8:	0000c617          	auipc	a2,0xc
c0000dfc:	2fc60613          	addi	a2,a2,764 # c000d0f4 <commands+0x258>
c0000e00:	0d700593          	li	a1,215
c0000e04:	0000c517          	auipc	a0,0xc
c0000e08:	48850513          	addi	a0,a0,1160 # c000d28c <commands+0x3f0>
c0000e0c:	c44ff0ef          	jal	ra,c0000250 <__panic>
c0000e10:	c51ff06f          	j	c0000a60 <print_trapframe>
c0000e14:	00040513          	mv	a0,s0
c0000e18:	c49ff0ef          	jal	ra,c0000a60 <print_trapframe>
c0000e1c:	00048693          	mv	a3,s1
c0000e20:	0000c617          	auipc	a2,0xc
c0000e24:	2d460613          	addi	a2,a2,724 # c000d0f4 <commands+0x258>
c0000e28:	0cd00593          	li	a1,205
c0000e2c:	0000c517          	auipc	a0,0xc
c0000e30:	46050513          	addi	a0,a0,1120 # c000d28c <commands+0x3f0>
c0000e34:	c1cff0ef          	jal	ra,c0000250 <__panic>

c0000e38 <trap>:
c0000e38:	00045717          	auipc	a4,0x45
c0000e3c:	aec72703          	lw	a4,-1300(a4) # c0045924 <current>
c0000e40:	0a070063          	beqz	a4,c0000ee0 <trap+0xa8>
c0000e44:	ff010113          	addi	sp,sp,-16
c0000e48:	00812423          	sw	s0,8(sp)
c0000e4c:	08c52683          	lw	a3,140(a0)
c0000e50:	08052403          	lw	s0,128(a0)
c0000e54:	00912223          	sw	s1,4(sp)
c0000e58:	00112623          	sw	ra,12(sp)
c0000e5c:	05472483          	lw	s1,84(a4)
c0000e60:	04a72a23          	sw	a0,84(a4)
c0000e64:	10047413          	andi	s0,s0,256
c0000e68:	0606c863          	bltz	a3,c0000ed8 <trap+0xa0>
c0000e6c:	e3dff0ef          	jal	ra,c0000ca8 <exception_handler>
c0000e70:	00045797          	auipc	a5,0x45
c0000e74:	ab47a783          	lw	a5,-1356(a5) # c0045924 <current>
c0000e78:	0497aa23          	sw	s1,84(a5)
c0000e7c:	00041c63          	bnez	s0,c0000e94 <trap+0x5c>
c0000e80:	05c7a703          	lw	a4,92(a5)
c0000e84:	00177713          	andi	a4,a4,1
c0000e88:	02071a63          	bnez	a4,c0000ebc <trap+0x84>
c0000e8c:	0107a783          	lw	a5,16(a5)
c0000e90:	00079c63          	bnez	a5,c0000ea8 <trap+0x70>
c0000e94:	00c12083          	lw	ra,12(sp)
c0000e98:	00812403          	lw	s0,8(sp)
c0000e9c:	00412483          	lw	s1,4(sp)
c0000ea0:	01010113          	addi	sp,sp,16
c0000ea4:	00008067          	ret
c0000ea8:	00c12083          	lw	ra,12(sp)
c0000eac:	00812403          	lw	s0,8(sp)
c0000eb0:	00412483          	lw	s1,4(sp)
c0000eb4:	01010113          	addi	sp,sp,16
c0000eb8:	7280706f          	j	c00085e0 <schedule>
c0000ebc:	ff700513          	li	a0,-9
c0000ec0:	5e0060ef          	jal	ra,c00074a0 <do_exit>
c0000ec4:	00045797          	auipc	a5,0x45
c0000ec8:	a607a783          	lw	a5,-1440(a5) # c0045924 <current>
c0000ecc:	0107a783          	lw	a5,16(a5)
c0000ed0:	fc0782e3          	beqz	a5,c0000e94 <trap+0x5c>
c0000ed4:	fd5ff06f          	j	c0000ea8 <trap+0x70>
c0000ed8:	d31ff0ef          	jal	ra,c0000c08 <interrupt_handler>
c0000edc:	f95ff06f          	j	c0000e70 <trap+0x38>
c0000ee0:	08c52783          	lw	a5,140(a0)
c0000ee4:	0007c463          	bltz	a5,c0000eec <trap+0xb4>
c0000ee8:	dc1ff06f          	j	c0000ca8 <exception_handler>
c0000eec:	d1dff06f          	j	c0000c08 <interrupt_handler>

c0000ef0 <__alltraps>:
c0000ef0:	14011173          	csrrw	sp,sscratch,sp
c0000ef4:	00011463          	bnez	sp,c0000efc <__alltraps+0xc>
c0000ef8:	14002173          	csrr	sp,sscratch
c0000efc:	f7010113          	addi	sp,sp,-144
c0000f00:	00012023          	sw	zero,0(sp)
c0000f04:	00112223          	sw	ra,4(sp)
c0000f08:	00312623          	sw	gp,12(sp)
c0000f0c:	00412823          	sw	tp,16(sp)
c0000f10:	00512a23          	sw	t0,20(sp)
c0000f14:	00612c23          	sw	t1,24(sp)
c0000f18:	00712e23          	sw	t2,28(sp)
c0000f1c:	02812023          	sw	s0,32(sp)
c0000f20:	02912223          	sw	s1,36(sp)
c0000f24:	02a12423          	sw	a0,40(sp)
c0000f28:	02b12623          	sw	a1,44(sp)
c0000f2c:	02c12823          	sw	a2,48(sp)
c0000f30:	02d12a23          	sw	a3,52(sp)
c0000f34:	02e12c23          	sw	a4,56(sp)
c0000f38:	02f12e23          	sw	a5,60(sp)
c0000f3c:	05012023          	sw	a6,64(sp)
c0000f40:	05112223          	sw	a7,68(sp)
c0000f44:	05212423          	sw	s2,72(sp)
c0000f48:	05312623          	sw	s3,76(sp)
c0000f4c:	05412823          	sw	s4,80(sp)
c0000f50:	05512a23          	sw	s5,84(sp)
c0000f54:	05612c23          	sw	s6,88(sp)
c0000f58:	05712e23          	sw	s7,92(sp)
c0000f5c:	07812023          	sw	s8,96(sp)
c0000f60:	07912223          	sw	s9,100(sp)
c0000f64:	07a12423          	sw	s10,104(sp)
c0000f68:	07b12623          	sw	s11,108(sp)
c0000f6c:	07c12823          	sw	t3,112(sp)
c0000f70:	07d12a23          	sw	t4,116(sp)
c0000f74:	07e12c23          	sw	t5,120(sp)
c0000f78:	07f12e23          	sw	t6,124(sp)
c0000f7c:	14001473          	csrrw	s0,sscratch,zero
c0000f80:	100024f3          	csrr	s1,sstatus
c0000f84:	14102973          	csrr	s2,sepc
c0000f88:	143029f3          	csrr	s3,sbadaddr
c0000f8c:	14202a73          	csrr	s4,scause
c0000f90:	00812423          	sw	s0,8(sp)
c0000f94:	08912023          	sw	s1,128(sp)
c0000f98:	09212223          	sw	s2,132(sp)
c0000f9c:	09312423          	sw	s3,136(sp)
c0000fa0:	09412623          	sw	s4,140(sp)
c0000fa4:	00010513          	mv	a0,sp
c0000fa8:	e91ff0ef          	jal	ra,c0000e38 <trap>

c0000fac <__trapret>:
c0000fac:	08012483          	lw	s1,128(sp)
c0000fb0:	08412903          	lw	s2,132(sp)
c0000fb4:	1004f413          	andi	s0,s1,256
c0000fb8:	00041663          	bnez	s0,c0000fc4 <__trapret+0x18>
c0000fbc:	09010413          	addi	s0,sp,144
c0000fc0:	14041073          	csrw	sscratch,s0
c0000fc4:	10049073          	csrw	sstatus,s1
c0000fc8:	14191073          	csrw	sepc,s2
c0000fcc:	00412083          	lw	ra,4(sp)
c0000fd0:	00c12183          	lw	gp,12(sp)
c0000fd4:	01012203          	lw	tp,16(sp)
c0000fd8:	01412283          	lw	t0,20(sp)
c0000fdc:	01812303          	lw	t1,24(sp)
c0000fe0:	01c12383          	lw	t2,28(sp)
c0000fe4:	02012403          	lw	s0,32(sp)
c0000fe8:	02412483          	lw	s1,36(sp)
c0000fec:	02812503          	lw	a0,40(sp)
c0000ff0:	02c12583          	lw	a1,44(sp)
c0000ff4:	03012603          	lw	a2,48(sp)
c0000ff8:	03412683          	lw	a3,52(sp)
c0000ffc:	03812703          	lw	a4,56(sp)
c0001000:	03c12783          	lw	a5,60(sp)
c0001004:	04012803          	lw	a6,64(sp)
c0001008:	04412883          	lw	a7,68(sp)
c000100c:	04812903          	lw	s2,72(sp)
c0001010:	04c12983          	lw	s3,76(sp)
c0001014:	05012a03          	lw	s4,80(sp)
c0001018:	05412a83          	lw	s5,84(sp)
c000101c:	05812b03          	lw	s6,88(sp)
c0001020:	05c12b83          	lw	s7,92(sp)
c0001024:	06012c03          	lw	s8,96(sp)
c0001028:	06412c83          	lw	s9,100(sp)
c000102c:	06812d03          	lw	s10,104(sp)
c0001030:	06c12d83          	lw	s11,108(sp)
c0001034:	07012e03          	lw	t3,112(sp)
c0001038:	07412e83          	lw	t4,116(sp)
c000103c:	07812f03          	lw	t5,120(sp)
c0001040:	07c12f83          	lw	t6,124(sp)
c0001044:	00812103          	lw	sp,8(sp)
c0001048:	10200073          	sret

c000104c <forkrets>:
c000104c:	00050113          	mv	sp,a0
c0001050:	f5dff06f          	j	c0000fac <__trapret>

c0001054 <check_vma_overlap.isra.2.part.3>:
c0001054:	ff010113          	addi	sp,sp,-16
c0001058:	0000c697          	auipc	a3,0xc
c000105c:	54468693          	addi	a3,a3,1348 # c000d59c <commands+0x700>
c0001060:	0000c617          	auipc	a2,0xc
c0001064:	21460613          	addi	a2,a2,532 # c000d274 <commands+0x3d8>
c0001068:	06b00593          	li	a1,107
c000106c:	0000c517          	auipc	a0,0xc
c0001070:	55050513          	addi	a0,a0,1360 # c000d5bc <commands+0x720>
c0001074:	00112623          	sw	ra,12(sp)
c0001078:	9d8ff0ef          	jal	ra,c0000250 <__panic>

c000107c <mm_create>:
c000107c:	ff010113          	addi	sp,sp,-16
c0001080:	02c00513          	li	a0,44
c0001084:	00812423          	sw	s0,8(sp)
c0001088:	00112623          	sw	ra,12(sp)
c000108c:	4f8010ef          	jal	ra,c0002584 <kmalloc>
c0001090:	00050413          	mv	s0,a0
c0001094:	02050c63          	beqz	a0,c00010cc <mm_create+0x50>
c0001098:	00a42223          	sw	a0,4(s0)
c000109c:	00a42023          	sw	a0,0(s0)
c00010a0:	00052423          	sw	zero,8(a0)
c00010a4:	00052623          	sw	zero,12(a0)
c00010a8:	00052823          	sw	zero,16(a0)
c00010ac:	00045797          	auipc	a5,0x45
c00010b0:	8687a783          	lw	a5,-1944(a5) # c0045914 <swap_init_ok>
c00010b4:	02079663          	bnez	a5,c00010e0 <mm_create+0x64>
c00010b8:	00052a23          	sw	zero,20(a0)
c00010bc:	00042c23          	sw	zero,24(s0)
c00010c0:	00100593          	li	a1,1
c00010c4:	01c40513          	addi	a0,s0,28
c00010c8:	5d8050ef          	jal	ra,c00066a0 <sem_init>
c00010cc:	00c12083          	lw	ra,12(sp)
c00010d0:	00040513          	mv	a0,s0
c00010d4:	00812403          	lw	s0,8(sp)
c00010d8:	01010113          	addi	sp,sp,16
c00010dc:	00008067          	ret
c00010e0:	739010ef          	jal	ra,c0003018 <swap_init_mm>
c00010e4:	fd9ff06f          	j	c00010bc <mm_create+0x40>

c00010e8 <vma_create>:
c00010e8:	ff010113          	addi	sp,sp,-16
c00010ec:	01212023          	sw	s2,0(sp)
c00010f0:	00050913          	mv	s2,a0
c00010f4:	01800513          	li	a0,24
c00010f8:	00812423          	sw	s0,8(sp)
c00010fc:	00912223          	sw	s1,4(sp)
c0001100:	00112623          	sw	ra,12(sp)
c0001104:	00058493          	mv	s1,a1
c0001108:	00060413          	mv	s0,a2
c000110c:	478010ef          	jal	ra,c0002584 <kmalloc>
c0001110:	00050863          	beqz	a0,c0001120 <vma_create+0x38>
c0001114:	01252223          	sw	s2,4(a0)
c0001118:	00952423          	sw	s1,8(a0)
c000111c:	00852623          	sw	s0,12(a0)
c0001120:	00c12083          	lw	ra,12(sp)
c0001124:	00812403          	lw	s0,8(sp)
c0001128:	00412483          	lw	s1,4(sp)
c000112c:	00012903          	lw	s2,0(sp)
c0001130:	01010113          	addi	sp,sp,16
c0001134:	00008067          	ret

c0001138 <find_vma>:
c0001138:	04050263          	beqz	a0,c000117c <find_vma+0x44>
c000113c:	00852783          	lw	a5,8(a0)
c0001140:	00078663          	beqz	a5,c000114c <find_vma+0x14>
c0001144:	0047a703          	lw	a4,4(a5)
c0001148:	04e5f063          	bleu	a4,a1,c0001188 <find_vma+0x50>
c000114c:	00050793          	mv	a5,a0
c0001150:	0047a783          	lw	a5,4(a5)
c0001154:	02f50463          	beq	a0,a5,c000117c <find_vma+0x44>
c0001158:	ff47a703          	lw	a4,-12(a5)
c000115c:	fee5eae3          	bltu	a1,a4,c0001150 <find_vma+0x18>
c0001160:	ff87a703          	lw	a4,-8(a5)
c0001164:	fee5f6e3          	bleu	a4,a1,c0001150 <find_vma+0x18>
c0001168:	ff078793          	addi	a5,a5,-16
c000116c:	00078863          	beqz	a5,c000117c <find_vma+0x44>
c0001170:	00f52423          	sw	a5,8(a0)
c0001174:	00078513          	mv	a0,a5
c0001178:	00008067          	ret
c000117c:	00000793          	li	a5,0
c0001180:	00078513          	mv	a0,a5
c0001184:	00008067          	ret
c0001188:	0087a703          	lw	a4,8(a5)
c000118c:	fce5f0e3          	bleu	a4,a1,c000114c <find_vma+0x14>
c0001190:	00f52423          	sw	a5,8(a0)
c0001194:	fe1ff06f          	j	c0001174 <find_vma+0x3c>

c0001198 <insert_vma_struct>:
c0001198:	0045a603          	lw	a2,4(a1)
c000119c:	0085a803          	lw	a6,8(a1)
c00011a0:	ff010113          	addi	sp,sp,-16
c00011a4:	00112623          	sw	ra,12(sp)
c00011a8:	00050713          	mv	a4,a0
c00011ac:	01066a63          	bltu	a2,a6,c00011c0 <insert_vma_struct+0x28>
c00011b0:	0bc0006f          	j	c000126c <insert_vma_struct+0xd4>
c00011b4:	ff47a683          	lw	a3,-12(a5)
c00011b8:	06d66663          	bltu	a2,a3,c0001224 <insert_vma_struct+0x8c>
c00011bc:	00078713          	mv	a4,a5
c00011c0:	00472783          	lw	a5,4(a4)
c00011c4:	fef518e3          	bne	a0,a5,c00011b4 <insert_vma_struct+0x1c>
c00011c8:	00050793          	mv	a5,a0
c00011cc:	0ca70263          	beq	a4,a0,c0001290 <insert_vma_struct+0xf8>
c00011d0:	ff872683          	lw	a3,-8(a4)
c00011d4:	ff472883          	lw	a7,-12(a4)
c00011d8:	0ad8fa63          	bleu	a3,a7,c000128c <insert_vma_struct+0xf4>
c00011dc:	06d66863          	bltu	a2,a3,c000124c <insert_vma_struct+0xb4>
c00011e0:	00f50a63          	beq	a0,a5,c00011f4 <insert_vma_struct+0x5c>
c00011e4:	ff47a683          	lw	a3,-12(a5)
c00011e8:	0706e263          	bltu	a3,a6,c000124c <insert_vma_struct+0xb4>
c00011ec:	ff87a603          	lw	a2,-8(a5)
c00011f0:	02c6fe63          	bleu	a2,a3,c000122c <insert_vma_struct+0x94>
c00011f4:	01052683          	lw	a3,16(a0)
c00011f8:	00a5a023          	sw	a0,0(a1)
c00011fc:	01058613          	addi	a2,a1,16
c0001200:	00c7a023          	sw	a2,0(a5)
c0001204:	00c12083          	lw	ra,12(sp)
c0001208:	00c72223          	sw	a2,4(a4)
c000120c:	00f5aa23          	sw	a5,20(a1)
c0001210:	00e5a823          	sw	a4,16(a1)
c0001214:	00168793          	addi	a5,a3,1
c0001218:	00f52823          	sw	a5,16(a0)
c000121c:	01010113          	addi	sp,sp,16
c0001220:	00008067          	ret
c0001224:	fca702e3          	beq	a4,a0,c00011e8 <insert_vma_struct+0x50>
c0001228:	fa9ff06f          	j	c00011d0 <insert_vma_struct+0x38>
c000122c:	0000c697          	auipc	a3,0xc
c0001230:	4d868693          	addi	a3,a3,1240 # c000d704 <commands+0x868>
c0001234:	0000c617          	auipc	a2,0xc
c0001238:	04060613          	addi	a2,a2,64 # c000d274 <commands+0x3d8>
c000123c:	06d00593          	li	a1,109
c0001240:	0000c517          	auipc	a0,0xc
c0001244:	37c50513          	addi	a0,a0,892 # c000d5bc <commands+0x720>
c0001248:	808ff0ef          	jal	ra,c0000250 <__panic>
c000124c:	0000c697          	auipc	a3,0xc
c0001250:	49868693          	addi	a3,a3,1176 # c000d6e4 <commands+0x848>
c0001254:	0000c617          	auipc	a2,0xc
c0001258:	02060613          	addi	a2,a2,32 # c000d274 <commands+0x3d8>
c000125c:	06c00593          	li	a1,108
c0001260:	0000c517          	auipc	a0,0xc
c0001264:	35c50513          	addi	a0,a0,860 # c000d5bc <commands+0x720>
c0001268:	fe9fe0ef          	jal	ra,c0000250 <__panic>
c000126c:	0000c697          	auipc	a3,0xc
c0001270:	45c68693          	addi	a3,a3,1116 # c000d6c8 <commands+0x82c>
c0001274:	0000c617          	auipc	a2,0xc
c0001278:	00060613          	mv	a2,a2
c000127c:	07400593          	li	a1,116
c0001280:	0000c517          	auipc	a0,0xc
c0001284:	33c50513          	addi	a0,a0,828 # c000d5bc <commands+0x720>
c0001288:	fc9fe0ef          	jal	ra,c0000250 <__panic>
c000128c:	dc9ff0ef          	jal	ra,c0001054 <check_vma_overlap.isra.2.part.3>
c0001290:	00070793          	mv	a5,a4
c0001294:	f61ff06f          	j	c00011f4 <insert_vma_struct+0x5c>

c0001298 <mm_destroy>:
c0001298:	01852783          	lw	a5,24(a0)
c000129c:	ff010113          	addi	sp,sp,-16
c00012a0:	00112623          	sw	ra,12(sp)
c00012a4:	00812423          	sw	s0,8(sp)
c00012a8:	04079263          	bnez	a5,c00012ec <mm_destroy+0x54>
c00012ac:	00050413          	mv	s0,a0
c00012b0:	00452503          	lw	a0,4(a0)
c00012b4:	02a40263          	beq	s0,a0,c00012d8 <mm_destroy+0x40>
c00012b8:	00052703          	lw	a4,0(a0)
c00012bc:	00452783          	lw	a5,4(a0)
c00012c0:	ff050513          	addi	a0,a0,-16
c00012c4:	00f72223          	sw	a5,4(a4)
c00012c8:	00e7a023          	sw	a4,0(a5)
c00012cc:	3d8010ef          	jal	ra,c00026a4 <kfree>
c00012d0:	00442503          	lw	a0,4(s0)
c00012d4:	fea412e3          	bne	s0,a0,c00012b8 <mm_destroy+0x20>
c00012d8:	00040513          	mv	a0,s0
c00012dc:	00c12083          	lw	ra,12(sp)
c00012e0:	00812403          	lw	s0,8(sp)
c00012e4:	01010113          	addi	sp,sp,16
c00012e8:	3bc0106f          	j	c00026a4 <kfree>
c00012ec:	0000c697          	auipc	a3,0xc
c00012f0:	43868693          	addi	a3,a3,1080 # c000d724 <commands+0x888>
c00012f4:	0000c617          	auipc	a2,0xc
c00012f8:	f8060613          	addi	a2,a2,-128 # c000d274 <commands+0x3d8>
c00012fc:	09400593          	li	a1,148
c0001300:	0000c517          	auipc	a0,0xc
c0001304:	2bc50513          	addi	a0,a0,700 # c000d5bc <commands+0x720>
c0001308:	f49fe0ef          	jal	ra,c0000250 <__panic>

c000130c <mm_map>:
c000130c:	000017b7          	lui	a5,0x1
c0001310:	fe010113          	addi	sp,sp,-32
c0001314:	fff78793          	addi	a5,a5,-1 # fff <_binary_obj___user_faultread_out_size-0x10a9>
c0001318:	fffff837          	lui	a6,0xfffff
c000131c:	00812c23          	sw	s0,24(sp)
c0001320:	00f60433          	add	s0,a2,a5
c0001324:	00912a23          	sw	s1,20(sp)
c0001328:	00b40433          	add	s0,s0,a1
c000132c:	00112e23          	sw	ra,28(sp)
c0001330:	01212823          	sw	s2,16(sp)
c0001334:	01312623          	sw	s3,12(sp)
c0001338:	01412423          	sw	s4,8(sp)
c000133c:	01512223          	sw	s5,4(sp)
c0001340:	0105f4b3          	and	s1,a1,a6
c0001344:	002007b7          	lui	a5,0x200
c0001348:	01047433          	and	s0,s0,a6
c000134c:	08f4e863          	bltu	s1,a5,c00013dc <mm_map+0xd0>
c0001350:	0884f663          	bleu	s0,s1,c00013dc <mm_map+0xd0>
c0001354:	b00007b7          	lui	a5,0xb0000
c0001358:	0887e263          	bltu	a5,s0,c00013dc <mm_map+0xd0>
c000135c:	00050993          	mv	s3,a0
c0001360:	00070a13          	mv	s4,a4
c0001364:	00068a93          	mv	s5,a3
c0001368:	08050263          	beqz	a0,c00013ec <mm_map+0xe0>
c000136c:	00048593          	mv	a1,s1
c0001370:	dc9ff0ef          	jal	ra,c0001138 <find_vma>
c0001374:	00050663          	beqz	a0,c0001380 <mm_map+0x74>
c0001378:	00452783          	lw	a5,4(a0)
c000137c:	0687e063          	bltu	a5,s0,c00013dc <mm_map+0xd0>
c0001380:	01800513          	li	a0,24
c0001384:	200010ef          	jal	ra,c0002584 <kmalloc>
c0001388:	00050913          	mv	s2,a0
c000138c:	ffc00513          	li	a0,-4
c0001390:	02090463          	beqz	s2,c00013b8 <mm_map+0xac>
c0001394:	00992223          	sw	s1,4(s2)
c0001398:	00892423          	sw	s0,8(s2)
c000139c:	01592623          	sw	s5,12(s2)
c00013a0:	00090593          	mv	a1,s2
c00013a4:	00098513          	mv	a0,s3
c00013a8:	df1ff0ef          	jal	ra,c0001198 <insert_vma_struct>
c00013ac:	020a0c63          	beqz	s4,c00013e4 <mm_map+0xd8>
c00013b0:	012a2023          	sw	s2,0(s4)
c00013b4:	00000513          	li	a0,0
c00013b8:	01c12083          	lw	ra,28(sp)
c00013bc:	01812403          	lw	s0,24(sp)
c00013c0:	01412483          	lw	s1,20(sp)
c00013c4:	01012903          	lw	s2,16(sp)
c00013c8:	00c12983          	lw	s3,12(sp)
c00013cc:	00812a03          	lw	s4,8(sp)
c00013d0:	00412a83          	lw	s5,4(sp)
c00013d4:	02010113          	addi	sp,sp,32
c00013d8:	00008067          	ret
c00013dc:	ffd00513          	li	a0,-3
c00013e0:	fd9ff06f          	j	c00013b8 <mm_map+0xac>
c00013e4:	00000513          	li	a0,0
c00013e8:	fd1ff06f          	j	c00013b8 <mm_map+0xac>
c00013ec:	0000c697          	auipc	a3,0xc
c00013f0:	34c68693          	addi	a3,a3,844 # c000d738 <commands+0x89c>
c00013f4:	0000c617          	auipc	a2,0xc
c00013f8:	e8060613          	addi	a2,a2,-384 # c000d274 <commands+0x3d8>
c00013fc:	0a700593          	li	a1,167
c0001400:	0000c517          	auipc	a0,0xc
c0001404:	1bc50513          	addi	a0,a0,444 # c000d5bc <commands+0x720>
c0001408:	e49fe0ef          	jal	ra,c0000250 <__panic>

c000140c <dup_mmap>:
c000140c:	fe010113          	addi	sp,sp,-32
c0001410:	00112e23          	sw	ra,28(sp)
c0001414:	00812c23          	sw	s0,24(sp)
c0001418:	00912a23          	sw	s1,20(sp)
c000141c:	01212823          	sw	s2,16(sp)
c0001420:	01312623          	sw	s3,12(sp)
c0001424:	01412423          	sw	s4,8(sp)
c0001428:	01512223          	sw	s5,4(sp)
c000142c:	01612023          	sw	s6,0(sp)
c0001430:	0a050463          	beqz	a0,c00014d8 <dup_mmap+0xcc>
c0001434:	00050913          	mv	s2,a0
c0001438:	00058493          	mv	s1,a1
c000143c:	00058413          	mv	s0,a1
c0001440:	01800b13          	li	s6,24
c0001444:	02059e63          	bnez	a1,c0001480 <dup_mmap+0x74>
c0001448:	0900006f          	j	c00014d8 <dup_mmap+0xcc>
c000144c:	00050593          	mv	a1,a0
c0001450:	0157a223          	sw	s5,4(a5) # b0000004 <sbi_remote_fence_i+0xb0000714>
c0001454:	00090513          	mv	a0,s2
c0001458:	0147a423          	sw	s4,8(a5)
c000145c:	0137a623          	sw	s3,12(a5)
c0001460:	d39ff0ef          	jal	ra,c0001198 <insert_vma_struct>
c0001464:	ff842683          	lw	a3,-8(s0)
c0001468:	ff442603          	lw	a2,-12(s0)
c000146c:	00c4a583          	lw	a1,12(s1)
c0001470:	00c92503          	lw	a0,12(s2)
c0001474:	00000713          	li	a4,0
c0001478:	500030ef          	jal	ra,c0004978 <copy_range>
c000147c:	02051463          	bnez	a0,c00014a4 <dup_mmap+0x98>
c0001480:	00042403          	lw	s0,0(s0)
c0001484:	04848663          	beq	s1,s0,c00014d0 <dup_mmap+0xc4>
c0001488:	000b0513          	mv	a0,s6
c000148c:	ff442a83          	lw	s5,-12(s0)
c0001490:	ff842a03          	lw	s4,-8(s0)
c0001494:	ffc42983          	lw	s3,-4(s0)
c0001498:	0ec010ef          	jal	ra,c0002584 <kmalloc>
c000149c:	00050793          	mv	a5,a0
c00014a0:	fa0516e3          	bnez	a0,c000144c <dup_mmap+0x40>
c00014a4:	ffc00513          	li	a0,-4
c00014a8:	01c12083          	lw	ra,28(sp)
c00014ac:	01812403          	lw	s0,24(sp)
c00014b0:	01412483          	lw	s1,20(sp)
c00014b4:	01012903          	lw	s2,16(sp)
c00014b8:	00c12983          	lw	s3,12(sp)
c00014bc:	00812a03          	lw	s4,8(sp)
c00014c0:	00412a83          	lw	s5,4(sp)
c00014c4:	00012b03          	lw	s6,0(sp)
c00014c8:	02010113          	addi	sp,sp,32
c00014cc:	00008067          	ret
c00014d0:	00000513          	li	a0,0
c00014d4:	fd5ff06f          	j	c00014a8 <dup_mmap+0x9c>
c00014d8:	0000c697          	auipc	a3,0xc
c00014dc:	1b468693          	addi	a3,a3,436 # c000d68c <commands+0x7f0>
c00014e0:	0000c617          	auipc	a2,0xc
c00014e4:	d9460613          	addi	a2,a2,-620 # c000d274 <commands+0x3d8>
c00014e8:	0c000593          	li	a1,192
c00014ec:	0000c517          	auipc	a0,0xc
c00014f0:	0d050513          	addi	a0,a0,208 # c000d5bc <commands+0x720>
c00014f4:	d5dfe0ef          	jal	ra,c0000250 <__panic>

c00014f8 <exit_mmap>:
c00014f8:	ff010113          	addi	sp,sp,-16
c00014fc:	00112623          	sw	ra,12(sp)
c0001500:	00812423          	sw	s0,8(sp)
c0001504:	00912223          	sw	s1,4(sp)
c0001508:	01212023          	sw	s2,0(sp)
c000150c:	06050663          	beqz	a0,c0001578 <exit_mmap+0x80>
c0001510:	01852783          	lw	a5,24(a0)
c0001514:	00050493          	mv	s1,a0
c0001518:	06079063          	bnez	a5,c0001578 <exit_mmap+0x80>
c000151c:	00452403          	lw	s0,4(a0)
c0001520:	00c52903          	lw	s2,12(a0)
c0001524:	02850e63          	beq	a0,s0,c0001560 <exit_mmap+0x68>
c0001528:	ff842603          	lw	a2,-8(s0)
c000152c:	ff442583          	lw	a1,-12(s0)
c0001530:	00090513          	mv	a0,s2
c0001534:	7d5020ef          	jal	ra,c0004508 <unmap_range>
c0001538:	00442403          	lw	s0,4(s0)
c000153c:	fe8496e3          	bne	s1,s0,c0001528 <exit_mmap+0x30>
c0001540:	00442483          	lw	s1,4(s0)
c0001544:	00940e63          	beq	s0,s1,c0001560 <exit_mmap+0x68>
c0001548:	ff84a603          	lw	a2,-8(s1)
c000154c:	ff44a583          	lw	a1,-12(s1)
c0001550:	00090513          	mv	a0,s2
c0001554:	12c030ef          	jal	ra,c0004680 <exit_range>
c0001558:	0044a483          	lw	s1,4(s1)
c000155c:	fe8496e3          	bne	s1,s0,c0001548 <exit_mmap+0x50>
c0001560:	00c12083          	lw	ra,12(sp)
c0001564:	00812403          	lw	s0,8(sp)
c0001568:	00412483          	lw	s1,4(sp)
c000156c:	00012903          	lw	s2,0(sp)
c0001570:	01010113          	addi	sp,sp,16
c0001574:	00008067          	ret
c0001578:	0000c697          	auipc	a3,0xc
c000157c:	13068693          	addi	a3,a3,304 # c000d6a8 <commands+0x80c>
c0001580:	0000c617          	auipc	a2,0xc
c0001584:	cf460613          	addi	a2,a2,-780 # c000d274 <commands+0x3d8>
c0001588:	0d600593          	li	a1,214
c000158c:	0000c517          	auipc	a0,0xc
c0001590:	03050513          	addi	a0,a0,48 # c000d5bc <commands+0x720>
c0001594:	cbdfe0ef          	jal	ra,c0000250 <__panic>

c0001598 <vmm_init>:
c0001598:	fe010113          	addi	sp,sp,-32
c000159c:	00112e23          	sw	ra,28(sp)
c00015a0:	00812c23          	sw	s0,24(sp)
c00015a4:	00912a23          	sw	s1,20(sp)
c00015a8:	01212823          	sw	s2,16(sp)
c00015ac:	01312623          	sw	s3,12(sp)
c00015b0:	01412423          	sw	s4,8(sp)
c00015b4:	01512223          	sw	s5,4(sp)
c00015b8:	405020ef          	jal	ra,c00041bc <nr_free_pages>
c00015bc:	401020ef          	jal	ra,c00041bc <nr_free_pages>
c00015c0:	abdff0ef          	jal	ra,c000107c <mm_create>
c00015c4:	00050493          	mv	s1,a0
c00015c8:	03200413          	li	s0,50
c00015cc:	01800913          	li	s2,24
c00015d0:	02051263          	bnez	a0,c00015f4 <vmm_init+0x5c>
c00015d4:	4640006f          	j	c0001a38 <vmm_init+0x4a0>
c00015d8:	00852223          	sw	s0,4(a0)
c00015dc:	00f52423          	sw	a5,8(a0)
c00015e0:	00052623          	sw	zero,12(a0)
c00015e4:	ffb40413          	addi	s0,s0,-5
c00015e8:	00048513          	mv	a0,s1
c00015ec:	badff0ef          	jal	ra,c0001198 <insert_vma_struct>
c00015f0:	02040c63          	beqz	s0,c0001628 <vmm_init+0x90>
c00015f4:	00090513          	mv	a0,s2
c00015f8:	78d000ef          	jal	ra,c0002584 <kmalloc>
c00015fc:	00050593          	mv	a1,a0
c0001600:	00240793          	addi	a5,s0,2
c0001604:	fc051ae3          	bnez	a0,c00015d8 <vmm_init+0x40>
c0001608:	0000c697          	auipc	a3,0xc
c000160c:	37468693          	addi	a3,a3,884 # c000d97c <commands+0xae0>
c0001610:	0000c617          	auipc	a2,0xc
c0001614:	c6460613          	addi	a2,a2,-924 # c000d274 <commands+0x3d8>
c0001618:	11300593          	li	a1,275
c000161c:	0000c517          	auipc	a0,0xc
c0001620:	fa050513          	addi	a0,a0,-96 # c000d5bc <commands+0x720>
c0001624:	c2dfe0ef          	jal	ra,c0000250 <__panic>
c0001628:	03700413          	li	s0,55
c000162c:	01800913          	li	s2,24
c0001630:	1f900993          	li	s3,505
c0001634:	0240006f          	j	c0001658 <vmm_init+0xc0>
c0001638:	00852223          	sw	s0,4(a0)
c000163c:	00f52423          	sw	a5,8(a0)
c0001640:	00052623          	sw	zero,12(a0)
c0001644:	00050593          	mv	a1,a0
c0001648:	00540413          	addi	s0,s0,5
c000164c:	00048513          	mv	a0,s1
c0001650:	b49ff0ef          	jal	ra,c0001198 <insert_vma_struct>
c0001654:	03340a63          	beq	s0,s3,c0001688 <vmm_init+0xf0>
c0001658:	00090513          	mv	a0,s2
c000165c:	729000ef          	jal	ra,c0002584 <kmalloc>
c0001660:	00240793          	addi	a5,s0,2
c0001664:	fc051ae3          	bnez	a0,c0001638 <vmm_init+0xa0>
c0001668:	0000c697          	auipc	a3,0xc
c000166c:	31468693          	addi	a3,a3,788 # c000d97c <commands+0xae0>
c0001670:	0000c617          	auipc	a2,0xc
c0001674:	c0460613          	addi	a2,a2,-1020 # c000d274 <commands+0x3d8>
c0001678:	11900593          	li	a1,281
c000167c:	0000c517          	auipc	a0,0xc
c0001680:	f4050513          	addi	a0,a0,-192 # c000d5bc <commands+0x720>
c0001684:	bcdfe0ef          	jal	ra,c0000250 <__panic>
c0001688:	0044a783          	lw	a5,4(s1)
c000168c:	00700713          	li	a4,7
c0001690:	1fb00593          	li	a1,507
c0001694:	2ef48263          	beq	s1,a5,c0001978 <vmm_init+0x3e0>
c0001698:	ff47a603          	lw	a2,-12(a5)
c000169c:	ffe70693          	addi	a3,a4,-2
c00016a0:	26d61c63          	bne	a2,a3,c0001918 <vmm_init+0x380>
c00016a4:	ff87a683          	lw	a3,-8(a5)
c00016a8:	26e69863          	bne	a3,a4,c0001918 <vmm_init+0x380>
c00016ac:	00570713          	addi	a4,a4,5
c00016b0:	0047a783          	lw	a5,4(a5)
c00016b4:	feb710e3          	bne	a4,a1,c0001694 <vmm_init+0xfc>
c00016b8:	00500413          	li	s0,5
c00016bc:	1f900a93          	li	s5,505
c00016c0:	00040593          	mv	a1,s0
c00016c4:	00048513          	mv	a0,s1
c00016c8:	a71ff0ef          	jal	ra,c0001138 <find_vma>
c00016cc:	00050913          	mv	s2,a0
c00016d0:	2e050463          	beqz	a0,c00019b8 <vmm_init+0x420>
c00016d4:	00140593          	addi	a1,s0,1
c00016d8:	00048513          	mv	a0,s1
c00016dc:	a5dff0ef          	jal	ra,c0001138 <find_vma>
c00016e0:	00050993          	mv	s3,a0
c00016e4:	2a050a63          	beqz	a0,c0001998 <vmm_init+0x400>
c00016e8:	00240a13          	addi	s4,s0,2
c00016ec:	000a0593          	mv	a1,s4
c00016f0:	00048513          	mv	a0,s1
c00016f4:	a45ff0ef          	jal	ra,c0001138 <find_vma>
c00016f8:	32051063          	bnez	a0,c0001a18 <vmm_init+0x480>
c00016fc:	00340593          	addi	a1,s0,3
c0001700:	00048513          	mv	a0,s1
c0001704:	a35ff0ef          	jal	ra,c0001138 <find_vma>
c0001708:	2e051863          	bnez	a0,c00019f8 <vmm_init+0x460>
c000170c:	00440593          	addi	a1,s0,4
c0001710:	00048513          	mv	a0,s1
c0001714:	a25ff0ef          	jal	ra,c0001138 <find_vma>
c0001718:	2c051063          	bnez	a0,c00019d8 <vmm_init+0x440>
c000171c:	00492783          	lw	a5,4(s2)
c0001720:	22f41c63          	bne	s0,a5,c0001958 <vmm_init+0x3c0>
c0001724:	00892783          	lw	a5,8(s2)
c0001728:	23479863          	bne	a5,s4,c0001958 <vmm_init+0x3c0>
c000172c:	0049a703          	lw	a4,4(s3)
c0001730:	20e41463          	bne	s0,a4,c0001938 <vmm_init+0x3a0>
c0001734:	0089a703          	lw	a4,8(s3)
c0001738:	20f71063          	bne	a4,a5,c0001938 <vmm_init+0x3a0>
c000173c:	00540413          	addi	s0,s0,5
c0001740:	f95410e3          	bne	s0,s5,c00016c0 <vmm_init+0x128>
c0001744:	00400413          	li	s0,4
c0001748:	fff00913          	li	s2,-1
c000174c:	00040593          	mv	a1,s0
c0001750:	00048513          	mv	a0,s1
c0001754:	9e5ff0ef          	jal	ra,c0001138 <find_vma>
c0001758:	02050e63          	beqz	a0,c0001794 <vmm_init+0x1fc>
c000175c:	00852683          	lw	a3,8(a0)
c0001760:	00452603          	lw	a2,4(a0)
c0001764:	00040593          	mv	a1,s0
c0001768:	0000c517          	auipc	a0,0xc
c000176c:	0dc50513          	addi	a0,a0,220 # c000d844 <commands+0x9a8>
c0001770:	96dfe0ef          	jal	ra,c00000dc <cprintf>
c0001774:	0000c697          	auipc	a3,0xc
c0001778:	0f868693          	addi	a3,a3,248 # c000d86c <commands+0x9d0>
c000177c:	0000c617          	auipc	a2,0xc
c0001780:	af860613          	addi	a2,a2,-1288 # c000d274 <commands+0x3d8>
c0001784:	13b00593          	li	a1,315
c0001788:	0000c517          	auipc	a0,0xc
c000178c:	e3450513          	addi	a0,a0,-460 # c000d5bc <commands+0x720>
c0001790:	ac1fe0ef          	jal	ra,c0000250 <__panic>
c0001794:	fff40413          	addi	s0,s0,-1
c0001798:	fb241ae3          	bne	s0,s2,c000174c <vmm_init+0x1b4>
c000179c:	00048513          	mv	a0,s1
c00017a0:	af9ff0ef          	jal	ra,c0001298 <mm_destroy>
c00017a4:	0000c517          	auipc	a0,0xc
c00017a8:	0dc50513          	addi	a0,a0,220 # c000d880 <commands+0x9e4>
c00017ac:	931fe0ef          	jal	ra,c00000dc <cprintf>
c00017b0:	20d020ef          	jal	ra,c00041bc <nr_free_pages>
c00017b4:	00050993          	mv	s3,a0
c00017b8:	00044917          	auipc	s2,0x44
c00017bc:	19090913          	addi	s2,s2,400 # c0045948 <check_mm_struct>
c00017c0:	8bdff0ef          	jal	ra,c000107c <mm_create>
c00017c4:	00a92023          	sw	a0,0(s2)
c00017c8:	00050413          	mv	s0,a0
c00017cc:	2a050663          	beqz	a0,c0001a78 <vmm_init+0x4e0>
c00017d0:	00044497          	auipc	s1,0x44
c00017d4:	1484a483          	lw	s1,328(s1) # c0045918 <boot_pgdir>
c00017d8:	0004a783          	lw	a5,0(s1)
c00017dc:	00952623          	sw	s1,12(a0)
c00017e0:	26079c63          	bnez	a5,c0001a58 <vmm_init+0x4c0>
c00017e4:	01800513          	li	a0,24
c00017e8:	59d000ef          	jal	ra,c0002584 <kmalloc>
c00017ec:	00050a13          	mv	s4,a0
c00017f0:	10050463          	beqz	a0,c00018f8 <vmm_init+0x360>
c00017f4:	004007b7          	lui	a5,0x400
c00017f8:	00fa2423          	sw	a5,8(s4)
c00017fc:	00200793          	li	a5,2
c0001800:	00050593          	mv	a1,a0
c0001804:	00fa2623          	sw	a5,12(s4)
c0001808:	00040513          	mv	a0,s0
c000180c:	000a2223          	sw	zero,4(s4)
c0001810:	989ff0ef          	jal	ra,c0001198 <insert_vma_struct>
c0001814:	10000593          	li	a1,256
c0001818:	00040513          	mv	a0,s0
c000181c:	91dff0ef          	jal	ra,c0001138 <find_vma>
c0001820:	00000793          	li	a5,0
c0001824:	06400713          	li	a4,100
c0001828:	2caa1463          	bne	s4,a0,c0001af0 <vmm_init+0x558>
c000182c:	10f78023          	sb	a5,256(a5) # 400100 <_binary_obj___user_matrix_out_size+0x3fd7b8>
c0001830:	00178793          	addi	a5,a5,1
c0001834:	fee79ce3          	bne	a5,a4,c000182c <vmm_init+0x294>
c0001838:	00001737          	lui	a4,0x1
c000183c:	35670713          	addi	a4,a4,854 # 1356 <_binary_obj___user_faultread_out_size-0xd52>
c0001840:	00000793          	li	a5,0
c0001844:	06400613          	li	a2,100
c0001848:	1007c683          	lbu	a3,256(a5)
c000184c:	00178793          	addi	a5,a5,1
c0001850:	40d70733          	sub	a4,a4,a3
c0001854:	fec79ae3          	bne	a5,a2,c0001848 <vmm_init+0x2b0>
c0001858:	26071c63          	bnez	a4,c0001ad0 <vmm_init+0x538>
c000185c:	00000593          	li	a1,0
c0001860:	00048513          	mv	a0,s1
c0001864:	759020ef          	jal	ra,c00047bc <page_remove>
c0001868:	0004a783          	lw	a5,0(s1)
c000186c:	00044717          	auipc	a4,0x44
c0001870:	0b072703          	lw	a4,176(a4) # c004591c <npage>
c0001874:	00279793          	slli	a5,a5,0x2
c0001878:	00c7d793          	srli	a5,a5,0xc
c000187c:	22e7fe63          	bleu	a4,a5,c0001ab8 <vmm_init+0x520>
c0001880:	0003b717          	auipc	a4,0x3b
c0001884:	c5472703          	lw	a4,-940(a4) # c003c4d4 <nbase>
c0001888:	40e787b3          	sub	a5,a5,a4
c000188c:	00579793          	slli	a5,a5,0x5
c0001890:	00044517          	auipc	a0,0x44
c0001894:	17852503          	lw	a0,376(a0) # c0045a08 <pages>
c0001898:	00f50533          	add	a0,a0,a5
c000189c:	00100593          	li	a1,1
c00018a0:	0b9020ef          	jal	ra,c0004158 <free_pages>
c00018a4:	0004a023          	sw	zero,0(s1)
c00018a8:	00042623          	sw	zero,12(s0)
c00018ac:	00040513          	mv	a0,s0
c00018b0:	9e9ff0ef          	jal	ra,c0001298 <mm_destroy>
c00018b4:	00092023          	sw	zero,0(s2)
c00018b8:	105020ef          	jal	ra,c00041bc <nr_free_pages>
c00018bc:	1ca99e63          	bne	s3,a0,c0001a98 <vmm_init+0x500>
c00018c0:	0000c517          	auipc	a0,0xc
c00018c4:	08850513          	addi	a0,a0,136 # c000d948 <commands+0xaac>
c00018c8:	815fe0ef          	jal	ra,c00000dc <cprintf>
c00018cc:	01c12083          	lw	ra,28(sp)
c00018d0:	01812403          	lw	s0,24(sp)
c00018d4:	01412483          	lw	s1,20(sp)
c00018d8:	01012903          	lw	s2,16(sp)
c00018dc:	00c12983          	lw	s3,12(sp)
c00018e0:	00812a03          	lw	s4,8(sp)
c00018e4:	00412a83          	lw	s5,4(sp)
c00018e8:	0000c517          	auipc	a0,0xc
c00018ec:	07c50513          	addi	a0,a0,124 # c000d964 <commands+0xac8>
c00018f0:	02010113          	addi	sp,sp,32
c00018f4:	fe8fe06f          	j	c00000dc <cprintf>
c00018f8:	0000c697          	auipc	a3,0xc
c00018fc:	08468693          	addi	a3,a3,132 # c000d97c <commands+0xae0>
c0001900:	0000c617          	auipc	a2,0xc
c0001904:	97460613          	addi	a2,a2,-1676 # c000d274 <commands+0x3d8>
c0001908:	15200593          	li	a1,338
c000190c:	0000c517          	auipc	a0,0xc
c0001910:	cb050513          	addi	a0,a0,-848 # c000d5bc <commands+0x720>
c0001914:	93dfe0ef          	jal	ra,c0000250 <__panic>
c0001918:	0000c697          	auipc	a3,0xc
c000191c:	e4468693          	addi	a3,a3,-444 # c000d75c <commands+0x8c0>
c0001920:	0000c617          	auipc	a2,0xc
c0001924:	95460613          	addi	a2,a2,-1708 # c000d274 <commands+0x3d8>
c0001928:	12200593          	li	a1,290
c000192c:	0000c517          	auipc	a0,0xc
c0001930:	c9050513          	addi	a0,a0,-880 # c000d5bc <commands+0x720>
c0001934:	91dfe0ef          	jal	ra,c0000250 <__panic>
c0001938:	0000c697          	auipc	a3,0xc
c000193c:	edc68693          	addi	a3,a3,-292 # c000d814 <commands+0x978>
c0001940:	0000c617          	auipc	a2,0xc
c0001944:	93460613          	addi	a2,a2,-1740 # c000d274 <commands+0x3d8>
c0001948:	13300593          	li	a1,307
c000194c:	0000c517          	auipc	a0,0xc
c0001950:	c7050513          	addi	a0,a0,-912 # c000d5bc <commands+0x720>
c0001954:	8fdfe0ef          	jal	ra,c0000250 <__panic>
c0001958:	0000c697          	auipc	a3,0xc
c000195c:	e8c68693          	addi	a3,a3,-372 # c000d7e4 <commands+0x948>
c0001960:	0000c617          	auipc	a2,0xc
c0001964:	91460613          	addi	a2,a2,-1772 # c000d274 <commands+0x3d8>
c0001968:	13200593          	li	a1,306
c000196c:	0000c517          	auipc	a0,0xc
c0001970:	c5050513          	addi	a0,a0,-944 # c000d5bc <commands+0x720>
c0001974:	8ddfe0ef          	jal	ra,c0000250 <__panic>
c0001978:	0000c697          	auipc	a3,0xc
c000197c:	dcc68693          	addi	a3,a3,-564 # c000d744 <commands+0x8a8>
c0001980:	0000c617          	auipc	a2,0xc
c0001984:	8f460613          	addi	a2,a2,-1804 # c000d274 <commands+0x3d8>
c0001988:	12000593          	li	a1,288
c000198c:	0000c517          	auipc	a0,0xc
c0001990:	c3050513          	addi	a0,a0,-976 # c000d5bc <commands+0x720>
c0001994:	8bdfe0ef          	jal	ra,c0000250 <__panic>
c0001998:	0000c697          	auipc	a3,0xc
c000199c:	e0c68693          	addi	a3,a3,-500 # c000d7a4 <commands+0x908>
c00019a0:	0000c617          	auipc	a2,0xc
c00019a4:	8d460613          	addi	a2,a2,-1836 # c000d274 <commands+0x3d8>
c00019a8:	12a00593          	li	a1,298
c00019ac:	0000c517          	auipc	a0,0xc
c00019b0:	c1050513          	addi	a0,a0,-1008 # c000d5bc <commands+0x720>
c00019b4:	89dfe0ef          	jal	ra,c0000250 <__panic>
c00019b8:	0000c697          	auipc	a3,0xc
c00019bc:	ddc68693          	addi	a3,a3,-548 # c000d794 <commands+0x8f8>
c00019c0:	0000c617          	auipc	a2,0xc
c00019c4:	8b460613          	addi	a2,a2,-1868 # c000d274 <commands+0x3d8>
c00019c8:	12800593          	li	a1,296
c00019cc:	0000c517          	auipc	a0,0xc
c00019d0:	bf050513          	addi	a0,a0,-1040 # c000d5bc <commands+0x720>
c00019d4:	87dfe0ef          	jal	ra,c0000250 <__panic>
c00019d8:	0000c697          	auipc	a3,0xc
c00019dc:	dfc68693          	addi	a3,a3,-516 # c000d7d4 <commands+0x938>
c00019e0:	0000c617          	auipc	a2,0xc
c00019e4:	89460613          	addi	a2,a2,-1900 # c000d274 <commands+0x3d8>
c00019e8:	13000593          	li	a1,304
c00019ec:	0000c517          	auipc	a0,0xc
c00019f0:	bd050513          	addi	a0,a0,-1072 # c000d5bc <commands+0x720>
c00019f4:	85dfe0ef          	jal	ra,c0000250 <__panic>
c00019f8:	0000c697          	auipc	a3,0xc
c00019fc:	dcc68693          	addi	a3,a3,-564 # c000d7c4 <commands+0x928>
c0001a00:	0000c617          	auipc	a2,0xc
c0001a04:	87460613          	addi	a2,a2,-1932 # c000d274 <commands+0x3d8>
c0001a08:	12e00593          	li	a1,302
c0001a0c:	0000c517          	auipc	a0,0xc
c0001a10:	bb050513          	addi	a0,a0,-1104 # c000d5bc <commands+0x720>
c0001a14:	83dfe0ef          	jal	ra,c0000250 <__panic>
c0001a18:	0000c697          	auipc	a3,0xc
c0001a1c:	d9c68693          	addi	a3,a3,-612 # c000d7b4 <commands+0x918>
c0001a20:	0000c617          	auipc	a2,0xc
c0001a24:	85460613          	addi	a2,a2,-1964 # c000d274 <commands+0x3d8>
c0001a28:	12c00593          	li	a1,300
c0001a2c:	0000c517          	auipc	a0,0xc
c0001a30:	b9050513          	addi	a0,a0,-1136 # c000d5bc <commands+0x720>
c0001a34:	81dfe0ef          	jal	ra,c0000250 <__panic>
c0001a38:	0000c697          	auipc	a3,0xc
c0001a3c:	d0068693          	addi	a3,a3,-768 # c000d738 <commands+0x89c>
c0001a40:	0000c617          	auipc	a2,0xc
c0001a44:	83460613          	addi	a2,a2,-1996 # c000d274 <commands+0x3d8>
c0001a48:	10c00593          	li	a1,268
c0001a4c:	0000c517          	auipc	a0,0xc
c0001a50:	b7050513          	addi	a0,a0,-1168 # c000d5bc <commands+0x720>
c0001a54:	ffcfe0ef          	jal	ra,c0000250 <__panic>
c0001a58:	0000c697          	auipc	a3,0xc
c0001a5c:	e6068693          	addi	a3,a3,-416 # c000d8b8 <commands+0xa1c>
c0001a60:	0000c617          	auipc	a2,0xc
c0001a64:	81460613          	addi	a2,a2,-2028 # c000d274 <commands+0x3d8>
c0001a68:	14f00593          	li	a1,335
c0001a6c:	0000c517          	auipc	a0,0xc
c0001a70:	b5050513          	addi	a0,a0,-1200 # c000d5bc <commands+0x720>
c0001a74:	fdcfe0ef          	jal	ra,c0000250 <__panic>
c0001a78:	0000c697          	auipc	a3,0xc
c0001a7c:	e2868693          	addi	a3,a3,-472 # c000d8a0 <commands+0xa04>
c0001a80:	0000b617          	auipc	a2,0xb
c0001a84:	7f460613          	addi	a2,a2,2036 # c000d274 <commands+0x3d8>
c0001a88:	14b00593          	li	a1,331
c0001a8c:	0000c517          	auipc	a0,0xc
c0001a90:	b3050513          	addi	a0,a0,-1232 # c000d5bc <commands+0x720>
c0001a94:	fbcfe0ef          	jal	ra,c0000250 <__panic>
c0001a98:	0000c697          	auipc	a3,0xc
c0001a9c:	e8868693          	addi	a3,a3,-376 # c000d920 <commands+0xa84>
c0001aa0:	0000b617          	auipc	a2,0xb
c0001aa4:	7d460613          	addi	a2,a2,2004 # c000d274 <commands+0x3d8>
c0001aa8:	16b00593          	li	a1,363
c0001aac:	0000c517          	auipc	a0,0xc
c0001ab0:	b1050513          	addi	a0,a0,-1264 # c000d5bc <commands+0x720>
c0001ab4:	f9cfe0ef          	jal	ra,c0000250 <__panic>
c0001ab8:	0000c617          	auipc	a2,0xc
c0001abc:	e3860613          	addi	a2,a2,-456 # c000d8f0 <commands+0xa54>
c0001ac0:	06100593          	li	a1,97
c0001ac4:	0000c517          	auipc	a0,0xc
c0001ac8:	e4c50513          	addi	a0,a0,-436 # c000d910 <commands+0xa74>
c0001acc:	f84fe0ef          	jal	ra,c0000250 <__panic>
c0001ad0:	0000c697          	auipc	a3,0xc
c0001ad4:	e1468693          	addi	a3,a3,-492 # c000d8e4 <commands+0xa48>
c0001ad8:	0000b617          	auipc	a2,0xb
c0001adc:	79c60613          	addi	a2,a2,1948 # c000d274 <commands+0x3d8>
c0001ae0:	16100593          	li	a1,353
c0001ae4:	0000c517          	auipc	a0,0xc
c0001ae8:	ad850513          	addi	a0,a0,-1320 # c000d5bc <commands+0x720>
c0001aec:	f64fe0ef          	jal	ra,c0000250 <__panic>
c0001af0:	0000c697          	auipc	a3,0xc
c0001af4:	dd868693          	addi	a3,a3,-552 # c000d8c8 <commands+0xa2c>
c0001af8:	0000b617          	auipc	a2,0xb
c0001afc:	77c60613          	addi	a2,a2,1916 # c000d274 <commands+0x3d8>
c0001b00:	15700593          	li	a1,343
c0001b04:	0000c517          	auipc	a0,0xc
c0001b08:	ab850513          	addi	a0,a0,-1352 # c000d5bc <commands+0x720>
c0001b0c:	f44fe0ef          	jal	ra,c0000250 <__panic>

c0001b10 <do_pgfault>:
c0001b10:	fd010113          	addi	sp,sp,-48
c0001b14:	00060593          	mv	a1,a2
c0001b18:	02812423          	sw	s0,40(sp)
c0001b1c:	02912223          	sw	s1,36(sp)
c0001b20:	02112623          	sw	ra,44(sp)
c0001b24:	03212023          	sw	s2,32(sp)
c0001b28:	01312e23          	sw	s3,28(sp)
c0001b2c:	00060413          	mv	s0,a2
c0001b30:	00050493          	mv	s1,a0
c0001b34:	e04ff0ef          	jal	ra,c0001138 <find_vma>
c0001b38:	00044797          	auipc	a5,0x44
c0001b3c:	dd07a783          	lw	a5,-560(a5) # c0045908 <pgfault_num>
c0001b40:	00178793          	addi	a5,a5,1
c0001b44:	00044297          	auipc	t0,0x44
c0001b48:	dcf2a223          	sw	a5,-572(t0) # c0045908 <pgfault_num>
c0001b4c:	10050c63          	beqz	a0,c0001c64 <do_pgfault+0x154>
c0001b50:	00452783          	lw	a5,4(a0)
c0001b54:	10f46863          	bltu	s0,a5,c0001c64 <do_pgfault+0x154>
c0001b58:	00c52783          	lw	a5,12(a0)
c0001b5c:	01000993          	li	s3,16
c0001b60:	0027f793          	andi	a5,a5,2
c0001b64:	0a079063          	bnez	a5,c0001c04 <do_pgfault+0xf4>
c0001b68:	fffff637          	lui	a2,0xfffff
c0001b6c:	00c4a503          	lw	a0,12(s1)
c0001b70:	00c47433          	and	s0,s0,a2
c0001b74:	00040593          	mv	a1,s0
c0001b78:	00100613          	li	a2,1
c0001b7c:	698020ef          	jal	ra,c0004214 <get_pte>
c0001b80:	10050863          	beqz	a0,c0001c90 <do_pgfault+0x180>
c0001b84:	00052583          	lw	a1,0(a0)
c0001b88:	0a058863          	beqz	a1,c0001c38 <do_pgfault+0x128>
c0001b8c:	00044797          	auipc	a5,0x44
c0001b90:	d887a783          	lw	a5,-632(a5) # c0045914 <swap_init_ok>
c0001b94:	0e078463          	beqz	a5,c0001c7c <do_pgfault+0x16c>
c0001b98:	00c10613          	addi	a2,sp,12
c0001b9c:	00040593          	mv	a1,s0
c0001ba0:	00048513          	mv	a0,s1
c0001ba4:	00012623          	sw	zero,12(sp)
c0001ba8:	63c010ef          	jal	ra,c00031e4 <swap_in>
c0001bac:	00050913          	mv	s2,a0
c0001bb0:	04051e63          	bnez	a0,c0001c0c <do_pgfault+0xfc>
c0001bb4:	00c12583          	lw	a1,12(sp)
c0001bb8:	00c4a503          	lw	a0,12(s1)
c0001bbc:	00098693          	mv	a3,s3
c0001bc0:	00040613          	mv	a2,s0
c0001bc4:	4a5020ef          	jal	ra,c0004868 <page_insert>
c0001bc8:	00c12603          	lw	a2,12(sp)
c0001bcc:	00100693          	li	a3,1
c0001bd0:	00040593          	mv	a1,s0
c0001bd4:	00048513          	mv	a0,s1
c0001bd8:	450010ef          	jal	ra,c0003028 <swap_map_swappable>
c0001bdc:	00c12783          	lw	a5,12(sp)
c0001be0:	0087ae23          	sw	s0,28(a5)
c0001be4:	02c12083          	lw	ra,44(sp)
c0001be8:	00090513          	mv	a0,s2
c0001bec:	02812403          	lw	s0,40(sp)
c0001bf0:	02412483          	lw	s1,36(sp)
c0001bf4:	02012903          	lw	s2,32(sp)
c0001bf8:	01c12983          	lw	s3,28(sp)
c0001bfc:	03010113          	addi	sp,sp,48
c0001c00:	00008067          	ret
c0001c04:	01700993          	li	s3,23
c0001c08:	f61ff06f          	j	c0001b68 <do_pgfault+0x58>
c0001c0c:	0000c517          	auipc	a0,0xc
c0001c10:	a3850513          	addi	a0,a0,-1480 # c000d644 <commands+0x7a8>
c0001c14:	cc8fe0ef          	jal	ra,c00000dc <cprintf>
c0001c18:	02c12083          	lw	ra,44(sp)
c0001c1c:	00090513          	mv	a0,s2
c0001c20:	02812403          	lw	s0,40(sp)
c0001c24:	02412483          	lw	s1,36(sp)
c0001c28:	02012903          	lw	s2,32(sp)
c0001c2c:	01c12983          	lw	s3,28(sp)
c0001c30:	03010113          	addi	sp,sp,48
c0001c34:	00008067          	ret
c0001c38:	00c4a503          	lw	a0,12(s1)
c0001c3c:	00098613          	mv	a2,s3
c0001c40:	00040593          	mv	a1,s0
c0001c44:	7f5020ef          	jal	ra,c0004c38 <pgdir_alloc_page>
c0001c48:	00000913          	li	s2,0
c0001c4c:	f8051ce3          	bnez	a0,c0001be4 <do_pgfault+0xd4>
c0001c50:	0000c517          	auipc	a0,0xc
c0001c54:	9cc50513          	addi	a0,a0,-1588 # c000d61c <commands+0x780>
c0001c58:	c84fe0ef          	jal	ra,c00000dc <cprintf>
c0001c5c:	ffc00913          	li	s2,-4
c0001c60:	f85ff06f          	j	c0001be4 <do_pgfault+0xd4>
c0001c64:	00040593          	mv	a1,s0
c0001c68:	0000c517          	auipc	a0,0xc
c0001c6c:	96450513          	addi	a0,a0,-1692 # c000d5cc <commands+0x730>
c0001c70:	c6cfe0ef          	jal	ra,c00000dc <cprintf>
c0001c74:	ffd00913          	li	s2,-3
c0001c78:	f6dff06f          	j	c0001be4 <do_pgfault+0xd4>
c0001c7c:	0000c517          	auipc	a0,0xc
c0001c80:	9e850513          	addi	a0,a0,-1560 # c000d664 <commands+0x7c8>
c0001c84:	c58fe0ef          	jal	ra,c00000dc <cprintf>
c0001c88:	ffc00913          	li	s2,-4
c0001c8c:	f59ff06f          	j	c0001be4 <do_pgfault+0xd4>
c0001c90:	0000c517          	auipc	a0,0xc
c0001c94:	96c50513          	addi	a0,a0,-1684 # c000d5fc <commands+0x760>
c0001c98:	c44fe0ef          	jal	ra,c00000dc <cprintf>
c0001c9c:	ffc00913          	li	s2,-4
c0001ca0:	f45ff06f          	j	c0001be4 <do_pgfault+0xd4>

c0001ca4 <user_mem_check>:
c0001ca4:	fe010113          	addi	sp,sp,-32
c0001ca8:	00812c23          	sw	s0,24(sp)
c0001cac:	00112e23          	sw	ra,28(sp)
c0001cb0:	00912a23          	sw	s1,20(sp)
c0001cb4:	01212823          	sw	s2,16(sp)
c0001cb8:	01312623          	sw	s3,12(sp)
c0001cbc:	01412423          	sw	s4,8(sp)
c0001cc0:	00058413          	mv	s0,a1
c0001cc4:	08050c63          	beqz	a0,c0001d5c <user_mem_check+0xb8>
c0001cc8:	002007b7          	lui	a5,0x200
c0001ccc:	06f5e663          	bltu	a1,a5,c0001d38 <user_mem_check+0x94>
c0001cd0:	00c584b3          	add	s1,a1,a2
c0001cd4:	0695f263          	bleu	s1,a1,c0001d38 <user_mem_check+0x94>
c0001cd8:	b00007b7          	lui	a5,0xb0000
c0001cdc:	0497ee63          	bltu	a5,s1,c0001d38 <user_mem_check+0x94>
c0001ce0:	00050913          	mv	s2,a0
c0001ce4:	00068993          	mv	s3,a3
c0001ce8:	00001a37          	lui	s4,0x1
c0001cec:	0240006f          	j	c0001d10 <user_mem_check+0x6c>
c0001cf0:	0027f693          	andi	a3,a5,2
c0001cf4:	01470733          	add	a4,a4,s4
c0001cf8:	0087f793          	andi	a5,a5,8
c0001cfc:	02068e63          	beqz	a3,c0001d38 <user_mem_check+0x94>
c0001d00:	00078463          	beqz	a5,c0001d08 <user_mem_check+0x64>
c0001d04:	02e46a63          	bltu	s0,a4,c0001d38 <user_mem_check+0x94>
c0001d08:	00852403          	lw	s0,8(a0)
c0001d0c:	06947463          	bleu	s1,s0,c0001d74 <user_mem_check+0xd0>
c0001d10:	00040593          	mv	a1,s0
c0001d14:	00090513          	mv	a0,s2
c0001d18:	c20ff0ef          	jal	ra,c0001138 <find_vma>
c0001d1c:	00050e63          	beqz	a0,c0001d38 <user_mem_check+0x94>
c0001d20:	00452703          	lw	a4,4(a0)
c0001d24:	00e46a63          	bltu	s0,a4,c0001d38 <user_mem_check+0x94>
c0001d28:	00c52783          	lw	a5,12(a0)
c0001d2c:	fc0992e3          	bnez	s3,c0001cf0 <user_mem_check+0x4c>
c0001d30:	0017f793          	andi	a5,a5,1
c0001d34:	fc079ae3          	bnez	a5,c0001d08 <user_mem_check+0x64>
c0001d38:	00000513          	li	a0,0
c0001d3c:	01c12083          	lw	ra,28(sp)
c0001d40:	01812403          	lw	s0,24(sp)
c0001d44:	01412483          	lw	s1,20(sp)
c0001d48:	01012903          	lw	s2,16(sp)
c0001d4c:	00c12983          	lw	s3,12(sp)
c0001d50:	00812a03          	lw	s4,8(sp)
c0001d54:	02010113          	addi	sp,sp,32
c0001d58:	00008067          	ret
c0001d5c:	c00007b7          	lui	a5,0xc0000
c0001d60:	fcf5ece3          	bltu	a1,a5,c0001d38 <user_mem_check+0x94>
c0001d64:	00c58633          	add	a2,a1,a2
c0001d68:	fcc5f8e3          	bleu	a2,a1,c0001d38 <user_mem_check+0x94>
c0001d6c:	f80007b7          	lui	a5,0xf8000
c0001d70:	fcc7e4e3          	bltu	a5,a2,c0001d38 <user_mem_check+0x94>
c0001d74:	00100513          	li	a0,1
c0001d78:	fc5ff06f          	j	c0001d3c <user_mem_check+0x98>

c0001d7c <_fifo_init_mm>:
c0001d7c:	00044797          	auipc	a5,0x44
c0001d80:	bd078793          	addi	a5,a5,-1072 # c004594c <pra_list_head>
c0001d84:	00f52a23          	sw	a5,20(a0)
c0001d88:	00f7a223          	sw	a5,4(a5)
c0001d8c:	00f7a023          	sw	a5,0(a5)
c0001d90:	00000513          	li	a0,0
c0001d94:	00008067          	ret

c0001d98 <_fifo_init>:
c0001d98:	00000513          	li	a0,0
c0001d9c:	00008067          	ret

c0001da0 <_fifo_set_unswappable>:
c0001da0:	00000513          	li	a0,0
c0001da4:	00008067          	ret

c0001da8 <_fifo_tick_event>:
c0001da8:	00000513          	li	a0,0
c0001dac:	00008067          	ret

c0001db0 <_fifo_check_swap>:
c0001db0:	fd010113          	addi	sp,sp,-48
c0001db4:	03212023          	sw	s2,32(sp)
c0001db8:	01312e23          	sw	s3,28(sp)
c0001dbc:	0000c517          	auipc	a0,0xc
c0001dc0:	bcc50513          	addi	a0,a0,-1076 # c000d988 <commands+0xaec>
c0001dc4:	00003937          	lui	s2,0x3
c0001dc8:	00c00993          	li	s3,12
c0001dcc:	02812423          	sw	s0,40(sp)
c0001dd0:	02112623          	sw	ra,44(sp)
c0001dd4:	02912223          	sw	s1,36(sp)
c0001dd8:	01412c23          	sw	s4,24(sp)
c0001ddc:	01512a23          	sw	s5,20(sp)
c0001de0:	01612823          	sw	s6,16(sp)
c0001de4:	01712623          	sw	s7,12(sp)
c0001de8:	01812423          	sw	s8,8(sp)
c0001dec:	af0fe0ef          	jal	ra,c00000dc <cprintf>
c0001df0:	01390023          	sb	s3,0(s2) # 3000 <_binary_obj___user_matrix_out_size+0x6b8>
c0001df4:	00044417          	auipc	s0,0x44
c0001df8:	b1442403          	lw	s0,-1260(s0) # c0045908 <pgfault_num>
c0001dfc:	00400793          	li	a5,4
c0001e00:	1af41c63          	bne	s0,a5,c0001fb8 <_fifo_check_swap+0x208>
c0001e04:	0000c517          	auipc	a0,0xc
c0001e08:	bd050513          	addi	a0,a0,-1072 # c000d9d4 <commands+0xb38>
c0001e0c:	00001ab7          	lui	s5,0x1
c0001e10:	00a00b13          	li	s6,10
c0001e14:	ac8fe0ef          	jal	ra,c00000dc <cprintf>
c0001e18:	016a8023          	sb	s6,0(s5) # 1000 <_binary_obj___user_faultread_out_size-0x10a8>
c0001e1c:	00044497          	auipc	s1,0x44
c0001e20:	aec4a483          	lw	s1,-1300(s1) # c0045908 <pgfault_num>
c0001e24:	30849a63          	bne	s1,s0,c0002138 <_fifo_check_swap+0x388>
c0001e28:	0000c517          	auipc	a0,0xc
c0001e2c:	bd450513          	addi	a0,a0,-1068 # c000d9fc <commands+0xb60>
c0001e30:	00004bb7          	lui	s7,0x4
c0001e34:	00d00c13          	li	s8,13
c0001e38:	aa4fe0ef          	jal	ra,c00000dc <cprintf>
c0001e3c:	018b8023          	sb	s8,0(s7) # 4000 <_binary_obj___user_matrix_out_size+0x16b8>
c0001e40:	00044a17          	auipc	s4,0x44
c0001e44:	ac8a2a03          	lw	s4,-1336(s4) # c0045908 <pgfault_num>
c0001e48:	2c9a1863          	bne	s4,s1,c0002118 <_fifo_check_swap+0x368>
c0001e4c:	0000c517          	auipc	a0,0xc
c0001e50:	bd850513          	addi	a0,a0,-1064 # c000da24 <commands+0xb88>
c0001e54:	00002437          	lui	s0,0x2
c0001e58:	00b00493          	li	s1,11
c0001e5c:	a80fe0ef          	jal	ra,c00000dc <cprintf>
c0001e60:	00940023          	sb	s1,0(s0) # 2000 <_binary_obj___user_faultread_out_size-0xa8>
c0001e64:	00044797          	auipc	a5,0x44
c0001e68:	aa47a783          	lw	a5,-1372(a5) # c0045908 <pgfault_num>
c0001e6c:	29479663          	bne	a5,s4,c00020f8 <_fifo_check_swap+0x348>
c0001e70:	0000c517          	auipc	a0,0xc
c0001e74:	bdc50513          	addi	a0,a0,-1060 # c000da4c <commands+0xbb0>
c0001e78:	a64fe0ef          	jal	ra,c00000dc <cprintf>
c0001e7c:	000057b7          	lui	a5,0x5
c0001e80:	00e00713          	li	a4,14
c0001e84:	00e78023          	sb	a4,0(a5) # 5000 <_binary_obj___user_matrix_out_size+0x26b8>
c0001e88:	00044a17          	auipc	s4,0x44
c0001e8c:	a80a2a03          	lw	s4,-1408(s4) # c0045908 <pgfault_num>
c0001e90:	00500793          	li	a5,5
c0001e94:	24fa1263          	bne	s4,a5,c00020d8 <_fifo_check_swap+0x328>
c0001e98:	0000c517          	auipc	a0,0xc
c0001e9c:	b8c50513          	addi	a0,a0,-1140 # c000da24 <commands+0xb88>
c0001ea0:	a3cfe0ef          	jal	ra,c00000dc <cprintf>
c0001ea4:	00940023          	sb	s1,0(s0)
c0001ea8:	00044797          	auipc	a5,0x44
c0001eac:	a607a783          	lw	a5,-1440(a5) # c0045908 <pgfault_num>
c0001eb0:	21479463          	bne	a5,s4,c00020b8 <_fifo_check_swap+0x308>
c0001eb4:	0000c517          	auipc	a0,0xc
c0001eb8:	b2050513          	addi	a0,a0,-1248 # c000d9d4 <commands+0xb38>
c0001ebc:	a20fe0ef          	jal	ra,c00000dc <cprintf>
c0001ec0:	016a8023          	sb	s6,0(s5)
c0001ec4:	00044717          	auipc	a4,0x44
c0001ec8:	a4472703          	lw	a4,-1468(a4) # c0045908 <pgfault_num>
c0001ecc:	00600793          	li	a5,6
c0001ed0:	1cf71463          	bne	a4,a5,c0002098 <_fifo_check_swap+0x2e8>
c0001ed4:	0000c517          	auipc	a0,0xc
c0001ed8:	b5050513          	addi	a0,a0,-1200 # c000da24 <commands+0xb88>
c0001edc:	a00fe0ef          	jal	ra,c00000dc <cprintf>
c0001ee0:	00940023          	sb	s1,0(s0)
c0001ee4:	00044717          	auipc	a4,0x44
c0001ee8:	a2472703          	lw	a4,-1500(a4) # c0045908 <pgfault_num>
c0001eec:	00700793          	li	a5,7
c0001ef0:	18f71463          	bne	a4,a5,c0002078 <_fifo_check_swap+0x2c8>
c0001ef4:	0000c517          	auipc	a0,0xc
c0001ef8:	a9450513          	addi	a0,a0,-1388 # c000d988 <commands+0xaec>
c0001efc:	9e0fe0ef          	jal	ra,c00000dc <cprintf>
c0001f00:	01390023          	sb	s3,0(s2)
c0001f04:	00044717          	auipc	a4,0x44
c0001f08:	a0472703          	lw	a4,-1532(a4) # c0045908 <pgfault_num>
c0001f0c:	00800793          	li	a5,8
c0001f10:	14f71463          	bne	a4,a5,c0002058 <_fifo_check_swap+0x2a8>
c0001f14:	0000c517          	auipc	a0,0xc
c0001f18:	ae850513          	addi	a0,a0,-1304 # c000d9fc <commands+0xb60>
c0001f1c:	9c0fe0ef          	jal	ra,c00000dc <cprintf>
c0001f20:	018b8023          	sb	s8,0(s7)
c0001f24:	00044717          	auipc	a4,0x44
c0001f28:	9e472703          	lw	a4,-1564(a4) # c0045908 <pgfault_num>
c0001f2c:	00900793          	li	a5,9
c0001f30:	10f71463          	bne	a4,a5,c0002038 <_fifo_check_swap+0x288>
c0001f34:	0000c517          	auipc	a0,0xc
c0001f38:	b1850513          	addi	a0,a0,-1256 # c000da4c <commands+0xbb0>
c0001f3c:	9a0fe0ef          	jal	ra,c00000dc <cprintf>
c0001f40:	000057b7          	lui	a5,0x5
c0001f44:	00e00713          	li	a4,14
c0001f48:	00e78023          	sb	a4,0(a5) # 5000 <_binary_obj___user_matrix_out_size+0x26b8>
c0001f4c:	00044417          	auipc	s0,0x44
c0001f50:	9bc42403          	lw	s0,-1604(s0) # c0045908 <pgfault_num>
c0001f54:	00a00793          	li	a5,10
c0001f58:	0cf41063          	bne	s0,a5,c0002018 <_fifo_check_swap+0x268>
c0001f5c:	0000c517          	auipc	a0,0xc
c0001f60:	a7850513          	addi	a0,a0,-1416 # c000d9d4 <commands+0xb38>
c0001f64:	978fe0ef          	jal	ra,c00000dc <cprintf>
c0001f68:	000017b7          	lui	a5,0x1
c0001f6c:	0007c783          	lbu	a5,0(a5) # 1000 <_binary_obj___user_faultread_out_size-0x10a8>
c0001f70:	08879463          	bne	a5,s0,c0001ff8 <_fifo_check_swap+0x248>
c0001f74:	00044717          	auipc	a4,0x44
c0001f78:	99472703          	lw	a4,-1644(a4) # c0045908 <pgfault_num>
c0001f7c:	00b00793          	li	a5,11
c0001f80:	04f71c63          	bne	a4,a5,c0001fd8 <_fifo_check_swap+0x228>
c0001f84:	02c12083          	lw	ra,44(sp)
c0001f88:	00000513          	li	a0,0
c0001f8c:	02812403          	lw	s0,40(sp)
c0001f90:	02412483          	lw	s1,36(sp)
c0001f94:	02012903          	lw	s2,32(sp)
c0001f98:	01c12983          	lw	s3,28(sp)
c0001f9c:	01812a03          	lw	s4,24(sp)
c0001fa0:	01412a83          	lw	s5,20(sp)
c0001fa4:	01012b03          	lw	s6,16(sp)
c0001fa8:	00c12b83          	lw	s7,12(sp)
c0001fac:	00812c03          	lw	s8,8(sp)
c0001fb0:	03010113          	addi	sp,sp,48
c0001fb4:	00008067          	ret
c0001fb8:	0000c697          	auipc	a3,0xc
c0001fbc:	9f868693          	addi	a3,a3,-1544 # c000d9b0 <commands+0xb14>
c0001fc0:	0000b617          	auipc	a2,0xb
c0001fc4:	2b460613          	addi	a2,a2,692 # c000d274 <commands+0x3d8>
c0001fc8:	05100593          	li	a1,81
c0001fcc:	0000c517          	auipc	a0,0xc
c0001fd0:	9f450513          	addi	a0,a0,-1548 # c000d9c0 <commands+0xb24>
c0001fd4:	a7cfe0ef          	jal	ra,c0000250 <__panic>
c0001fd8:	0000c697          	auipc	a3,0xc
c0001fdc:	b2068693          	addi	a3,a3,-1248 # c000daf8 <commands+0xc5c>
c0001fe0:	0000b617          	auipc	a2,0xb
c0001fe4:	29460613          	addi	a2,a2,660 # c000d274 <commands+0x3d8>
c0001fe8:	07300593          	li	a1,115
c0001fec:	0000c517          	auipc	a0,0xc
c0001ff0:	9d450513          	addi	a0,a0,-1580 # c000d9c0 <commands+0xb24>
c0001ff4:	a5cfe0ef          	jal	ra,c0000250 <__panic>
c0001ff8:	0000c697          	auipc	a3,0xc
c0001ffc:	adc68693          	addi	a3,a3,-1316 # c000dad4 <commands+0xc38>
c0002000:	0000b617          	auipc	a2,0xb
c0002004:	27460613          	addi	a2,a2,628 # c000d274 <commands+0x3d8>
c0002008:	07100593          	li	a1,113
c000200c:	0000c517          	auipc	a0,0xc
c0002010:	9b450513          	addi	a0,a0,-1612 # c000d9c0 <commands+0xb24>
c0002014:	a3cfe0ef          	jal	ra,c0000250 <__panic>
c0002018:	0000c697          	auipc	a3,0xc
c000201c:	aac68693          	addi	a3,a3,-1364 # c000dac4 <commands+0xc28>
c0002020:	0000b617          	auipc	a2,0xb
c0002024:	25460613          	addi	a2,a2,596 # c000d274 <commands+0x3d8>
c0002028:	06f00593          	li	a1,111
c000202c:	0000c517          	auipc	a0,0xc
c0002030:	99450513          	addi	a0,a0,-1644 # c000d9c0 <commands+0xb24>
c0002034:	a1cfe0ef          	jal	ra,c0000250 <__panic>
c0002038:	0000c697          	auipc	a3,0xc
c000203c:	a7c68693          	addi	a3,a3,-1412 # c000dab4 <commands+0xc18>
c0002040:	0000b617          	auipc	a2,0xb
c0002044:	23460613          	addi	a2,a2,564 # c000d274 <commands+0x3d8>
c0002048:	06c00593          	li	a1,108
c000204c:	0000c517          	auipc	a0,0xc
c0002050:	97450513          	addi	a0,a0,-1676 # c000d9c0 <commands+0xb24>
c0002054:	9fcfe0ef          	jal	ra,c0000250 <__panic>
c0002058:	0000c697          	auipc	a3,0xc
c000205c:	a4c68693          	addi	a3,a3,-1460 # c000daa4 <commands+0xc08>
c0002060:	0000b617          	auipc	a2,0xb
c0002064:	21460613          	addi	a2,a2,532 # c000d274 <commands+0x3d8>
c0002068:	06900593          	li	a1,105
c000206c:	0000c517          	auipc	a0,0xc
c0002070:	95450513          	addi	a0,a0,-1708 # c000d9c0 <commands+0xb24>
c0002074:	9dcfe0ef          	jal	ra,c0000250 <__panic>
c0002078:	0000c697          	auipc	a3,0xc
c000207c:	a1c68693          	addi	a3,a3,-1508 # c000da94 <commands+0xbf8>
c0002080:	0000b617          	auipc	a2,0xb
c0002084:	1f460613          	addi	a2,a2,500 # c000d274 <commands+0x3d8>
c0002088:	06600593          	li	a1,102
c000208c:	0000c517          	auipc	a0,0xc
c0002090:	93450513          	addi	a0,a0,-1740 # c000d9c0 <commands+0xb24>
c0002094:	9bcfe0ef          	jal	ra,c0000250 <__panic>
c0002098:	0000c697          	auipc	a3,0xc
c000209c:	9ec68693          	addi	a3,a3,-1556 # c000da84 <commands+0xbe8>
c00020a0:	0000b617          	auipc	a2,0xb
c00020a4:	1d460613          	addi	a2,a2,468 # c000d274 <commands+0x3d8>
c00020a8:	06300593          	li	a1,99
c00020ac:	0000c517          	auipc	a0,0xc
c00020b0:	91450513          	addi	a0,a0,-1772 # c000d9c0 <commands+0xb24>
c00020b4:	99cfe0ef          	jal	ra,c0000250 <__panic>
c00020b8:	0000c697          	auipc	a3,0xc
c00020bc:	9bc68693          	addi	a3,a3,-1604 # c000da74 <commands+0xbd8>
c00020c0:	0000b617          	auipc	a2,0xb
c00020c4:	1b460613          	addi	a2,a2,436 # c000d274 <commands+0x3d8>
c00020c8:	06000593          	li	a1,96
c00020cc:	0000c517          	auipc	a0,0xc
c00020d0:	8f450513          	addi	a0,a0,-1804 # c000d9c0 <commands+0xb24>
c00020d4:	97cfe0ef          	jal	ra,c0000250 <__panic>
c00020d8:	0000c697          	auipc	a3,0xc
c00020dc:	99c68693          	addi	a3,a3,-1636 # c000da74 <commands+0xbd8>
c00020e0:	0000b617          	auipc	a2,0xb
c00020e4:	19460613          	addi	a2,a2,404 # c000d274 <commands+0x3d8>
c00020e8:	05d00593          	li	a1,93
c00020ec:	0000c517          	auipc	a0,0xc
c00020f0:	8d450513          	addi	a0,a0,-1836 # c000d9c0 <commands+0xb24>
c00020f4:	95cfe0ef          	jal	ra,c0000250 <__panic>
c00020f8:	0000c697          	auipc	a3,0xc
c00020fc:	8b868693          	addi	a3,a3,-1864 # c000d9b0 <commands+0xb14>
c0002100:	0000b617          	auipc	a2,0xb
c0002104:	17460613          	addi	a2,a2,372 # c000d274 <commands+0x3d8>
c0002108:	05a00593          	li	a1,90
c000210c:	0000c517          	auipc	a0,0xc
c0002110:	8b450513          	addi	a0,a0,-1868 # c000d9c0 <commands+0xb24>
c0002114:	93cfe0ef          	jal	ra,c0000250 <__panic>
c0002118:	0000c697          	auipc	a3,0xc
c000211c:	89868693          	addi	a3,a3,-1896 # c000d9b0 <commands+0xb14>
c0002120:	0000b617          	auipc	a2,0xb
c0002124:	15460613          	addi	a2,a2,340 # c000d274 <commands+0x3d8>
c0002128:	05700593          	li	a1,87
c000212c:	0000c517          	auipc	a0,0xc
c0002130:	89450513          	addi	a0,a0,-1900 # c000d9c0 <commands+0xb24>
c0002134:	91cfe0ef          	jal	ra,c0000250 <__panic>
c0002138:	0000c697          	auipc	a3,0xc
c000213c:	87868693          	addi	a3,a3,-1928 # c000d9b0 <commands+0xb14>
c0002140:	0000b617          	auipc	a2,0xb
c0002144:	13460613          	addi	a2,a2,308 # c000d274 <commands+0x3d8>
c0002148:	05400593          	li	a1,84
c000214c:	0000c517          	auipc	a0,0xc
c0002150:	87450513          	addi	a0,a0,-1932 # c000d9c0 <commands+0xb24>
c0002154:	8fcfe0ef          	jal	ra,c0000250 <__panic>

c0002158 <_fifo_swap_out_victim>:
c0002158:	01452783          	lw	a5,20(a0)
c000215c:	ff010113          	addi	sp,sp,-16
c0002160:	00112623          	sw	ra,12(sp)
c0002164:	02078a63          	beqz	a5,c0002198 <_fifo_swap_out_victim+0x40>
c0002168:	04061863          	bnez	a2,c00021b8 <_fifo_swap_out_victim+0x60>
c000216c:	0047a783          	lw	a5,4(a5)
c0002170:	00c12083          	lw	ra,12(sp)
c0002174:	00000513          	li	a0,0
c0002178:	0007a683          	lw	a3,0(a5)
c000217c:	0047a703          	lw	a4,4(a5)
c0002180:	fec78793          	addi	a5,a5,-20
c0002184:	01010113          	addi	sp,sp,16
c0002188:	00e6a223          	sw	a4,4(a3)
c000218c:	00d72023          	sw	a3,0(a4)
c0002190:	00f5a023          	sw	a5,0(a1)
c0002194:	00008067          	ret
c0002198:	0000c697          	auipc	a3,0xc
c000219c:	99068693          	addi	a3,a3,-1648 # c000db28 <commands+0xc8c>
c00021a0:	0000b617          	auipc	a2,0xb
c00021a4:	0d460613          	addi	a2,a2,212 # c000d274 <commands+0x3d8>
c00021a8:	04100593          	li	a1,65
c00021ac:	0000c517          	auipc	a0,0xc
c00021b0:	81450513          	addi	a0,a0,-2028 # c000d9c0 <commands+0xb24>
c00021b4:	89cfe0ef          	jal	ra,c0000250 <__panic>
c00021b8:	0000c697          	auipc	a3,0xc
c00021bc:	98068693          	addi	a3,a3,-1664 # c000db38 <commands+0xc9c>
c00021c0:	0000b617          	auipc	a2,0xb
c00021c4:	0b460613          	addi	a2,a2,180 # c000d274 <commands+0x3d8>
c00021c8:	04200593          	li	a1,66
c00021cc:	0000b517          	auipc	a0,0xb
c00021d0:	7f450513          	addi	a0,a0,2036 # c000d9c0 <commands+0xb24>
c00021d4:	87cfe0ef          	jal	ra,c0000250 <__panic>

c00021d8 <_fifo_map_swappable>:
c00021d8:	01460713          	addi	a4,a2,20
c00021dc:	01452783          	lw	a5,20(a0)
c00021e0:	02070263          	beqz	a4,c0002204 <_fifo_map_swappable+0x2c>
c00021e4:	02078063          	beqz	a5,c0002204 <_fifo_map_swappable+0x2c>
c00021e8:	0007a683          	lw	a3,0(a5)
c00021ec:	00e7a023          	sw	a4,0(a5)
c00021f0:	00000513          	li	a0,0
c00021f4:	00e6a223          	sw	a4,4(a3)
c00021f8:	00f62c23          	sw	a5,24(a2)
c00021fc:	00d62a23          	sw	a3,20(a2)
c0002200:	00008067          	ret
c0002204:	ff010113          	addi	sp,sp,-16
c0002208:	0000c697          	auipc	a3,0xc
c000220c:	90068693          	addi	a3,a3,-1792 # c000db08 <commands+0xc6c>
c0002210:	0000b617          	auipc	a2,0xb
c0002214:	06460613          	addi	a2,a2,100 # c000d274 <commands+0x3d8>
c0002218:	03200593          	li	a1,50
c000221c:	0000b517          	auipc	a0,0xb
c0002220:	7a450513          	addi	a0,a0,1956 # c000d9c0 <commands+0xb24>
c0002224:	00112623          	sw	ra,12(sp)
c0002228:	828fe0ef          	jal	ra,c0000250 <__panic>

c000222c <slob_free>:
c000222c:	08050a63          	beqz	a0,c00022c0 <slob_free+0x94>
c0002230:	ff010113          	addi	sp,sp,-16
c0002234:	00112623          	sw	ra,12(sp)
c0002238:	00812423          	sw	s0,8(sp)
c000223c:	08059463          	bnez	a1,c00022c4 <slob_free+0x98>
c0002240:	00050413          	mv	s0,a0
c0002244:	100027f3          	csrr	a5,sstatus
c0002248:	0027f793          	andi	a5,a5,2
c000224c:	00000613          	li	a2,0
c0002250:	08079a63          	bnez	a5,c00022e4 <slob_free+0xb8>
c0002254:	0003a797          	auipc	a5,0x3a
c0002258:	27c7a783          	lw	a5,636(a5) # c003c4d0 <slobfree>
c000225c:	0047a703          	lw	a4,4(a5)
c0002260:	0087fc63          	bleu	s0,a5,c0002278 <slob_free+0x4c>
c0002264:	00e46e63          	bltu	s0,a4,c0002280 <slob_free+0x54>
c0002268:	00e7fc63          	bleu	a4,a5,c0002280 <slob_free+0x54>
c000226c:	00070793          	mv	a5,a4
c0002270:	0047a703          	lw	a4,4(a5)
c0002274:	fe87e8e3          	bltu	a5,s0,c0002264 <slob_free+0x38>
c0002278:	fee7eae3          	bltu	a5,a4,c000226c <slob_free+0x40>
c000227c:	fee478e3          	bleu	a4,s0,c000226c <slob_free+0x40>
c0002280:	00042583          	lw	a1,0(s0)
c0002284:	00359693          	slli	a3,a1,0x3
c0002288:	00d406b3          	add	a3,s0,a3
c000228c:	08d70663          	beq	a4,a3,c0002318 <slob_free+0xec>
c0002290:	00e42223          	sw	a4,4(s0)
c0002294:	0007a683          	lw	a3,0(a5)
c0002298:	00369713          	slli	a4,a3,0x3
c000229c:	00e78733          	add	a4,a5,a4
c00022a0:	06e40063          	beq	s0,a4,c0002300 <slob_free+0xd4>
c00022a4:	0087a223          	sw	s0,4(a5)
c00022a8:	0003a297          	auipc	t0,0x3a
c00022ac:	22f2a423          	sw	a5,552(t0) # c003c4d0 <slobfree>
c00022b0:	04061063          	bnez	a2,c00022f0 <slob_free+0xc4>
c00022b4:	00c12083          	lw	ra,12(sp)
c00022b8:	00812403          	lw	s0,8(sp)
c00022bc:	01010113          	addi	sp,sp,16
c00022c0:	00008067          	ret
c00022c4:	00758793          	addi	a5,a1,7
c00022c8:	0037d793          	srli	a5,a5,0x3
c00022cc:	00f52023          	sw	a5,0(a0)
c00022d0:	00050413          	mv	s0,a0
c00022d4:	100027f3          	csrr	a5,sstatus
c00022d8:	0027f793          	andi	a5,a5,2
c00022dc:	00000613          	li	a2,0
c00022e0:	f6078ae3          	beqz	a5,c0002254 <slob_free+0x28>
c00022e4:	d40fe0ef          	jal	ra,c0000824 <intr_disable>
c00022e8:	00100613          	li	a2,1
c00022ec:	f69ff06f          	j	c0002254 <slob_free+0x28>
c00022f0:	00c12083          	lw	ra,12(sp)
c00022f4:	00812403          	lw	s0,8(sp)
c00022f8:	01010113          	addi	sp,sp,16
c00022fc:	d20fe06f          	j	c000081c <intr_enable>
c0002300:	00042703          	lw	a4,0(s0)
c0002304:	00442583          	lw	a1,4(s0)
c0002308:	00d706b3          	add	a3,a4,a3
c000230c:	00d7a023          	sw	a3,0(a5)
c0002310:	00b7a223          	sw	a1,4(a5)
c0002314:	f95ff06f          	j	c00022a8 <slob_free+0x7c>
c0002318:	00072683          	lw	a3,0(a4)
c000231c:	00472703          	lw	a4,4(a4)
c0002320:	00b685b3          	add	a1,a3,a1
c0002324:	00b42023          	sw	a1,0(s0)
c0002328:	00e42223          	sw	a4,4(s0)
c000232c:	f69ff06f          	j	c0002294 <slob_free+0x68>

c0002330 <__slob_get_free_pages.isra.0>:
c0002330:	00100793          	li	a5,1
c0002334:	ff010113          	addi	sp,sp,-16
c0002338:	00a79533          	sll	a0,a5,a0
c000233c:	00112623          	sw	ra,12(sp)
c0002340:	565010ef          	jal	ra,c00040a4 <alloc_pages>
c0002344:	04050a63          	beqz	a0,c0002398 <__slob_get_free_pages.isra.0+0x68>
c0002348:	00043697          	auipc	a3,0x43
c000234c:	6c06a683          	lw	a3,1728(a3) # c0045a08 <pages>
c0002350:	40d506b3          	sub	a3,a0,a3
c0002354:	4056d693          	srai	a3,a3,0x5
c0002358:	0003a517          	auipc	a0,0x3a
c000235c:	17c52503          	lw	a0,380(a0) # c003c4d4 <nbase>
c0002360:	001007b7          	lui	a5,0x100
c0002364:	00a686b3          	add	a3,a3,a0
c0002368:	fff78793          	addi	a5,a5,-1 # fffff <_binary_obj___user_matrix_out_size+0xfd6b7>
c000236c:	00f6f7b3          	and	a5,a3,a5
c0002370:	00043717          	auipc	a4,0x43
c0002374:	5ac72703          	lw	a4,1452(a4) # c004591c <npage>
c0002378:	00c69693          	slli	a3,a3,0xc
c000237c:	02e7f263          	bleu	a4,a5,c00023a0 <__slob_get_free_pages.isra.0+0x70>
c0002380:	00043517          	auipc	a0,0x43
c0002384:	68052503          	lw	a0,1664(a0) # c0045a00 <va_pa_offset>
c0002388:	00a68533          	add	a0,a3,a0
c000238c:	00c12083          	lw	ra,12(sp)
c0002390:	01010113          	addi	sp,sp,16
c0002394:	00008067          	ret
c0002398:	00000513          	li	a0,0
c000239c:	ff1ff06f          	j	c000238c <__slob_get_free_pages.isra.0+0x5c>
c00023a0:	0000b617          	auipc	a2,0xb
c00023a4:	7b860613          	addi	a2,a2,1976 # c000db58 <commands+0xcbc>
c00023a8:	06800593          	li	a1,104
c00023ac:	0000b517          	auipc	a0,0xb
c00023b0:	56450513          	addi	a0,a0,1380 # c000d910 <commands+0xa74>
c00023b4:	e9dfd0ef          	jal	ra,c0000250 <__panic>

c00023b8 <slob_alloc.isra.1.constprop.3>:
c00023b8:	fd010113          	addi	sp,sp,-48
c00023bc:	02112623          	sw	ra,44(sp)
c00023c0:	02812423          	sw	s0,40(sp)
c00023c4:	02912223          	sw	s1,36(sp)
c00023c8:	03212023          	sw	s2,32(sp)
c00023cc:	01312e23          	sw	s3,28(sp)
c00023d0:	00850713          	addi	a4,a0,8
c00023d4:	000017b7          	lui	a5,0x1
c00023d8:	14f77e63          	bleu	a5,a4,c0002534 <slob_alloc.isra.1.constprop.3+0x17c>
c00023dc:	00750493          	addi	s1,a0,7
c00023e0:	0034d413          	srli	s0,s1,0x3
c00023e4:	10002673          	csrr	a2,sstatus
c00023e8:	00267613          	andi	a2,a2,2
c00023ec:	0e061e63          	bnez	a2,c00024e8 <slob_alloc.isra.1.constprop.3+0x130>
c00023f0:	0003a697          	auipc	a3,0x3a
c00023f4:	0e06a683          	lw	a3,224(a3) # c003c4d0 <slobfree>
c00023f8:	0046a783          	lw	a5,4(a3)
c00023fc:	0007a703          	lw	a4,0(a5) # 1000 <_binary_obj___user_faultread_out_size-0x10a8>
c0002400:	12875463          	ble	s0,a4,c0002528 <slob_alloc.isra.1.constprop.3+0x170>
c0002404:	00001937          	lui	s2,0x1
c0002408:	00100993          	li	s3,1
c000240c:	00f68c63          	beq	a3,a5,c0002424 <slob_alloc.isra.1.constprop.3+0x6c>
c0002410:	0047a503          	lw	a0,4(a5)
c0002414:	00052703          	lw	a4,0(a0)
c0002418:	04875463          	ble	s0,a4,c0002460 <slob_alloc.isra.1.constprop.3+0xa8>
c000241c:	00050793          	mv	a5,a0
c0002420:	fef698e3          	bne	a3,a5,c0002410 <slob_alloc.isra.1.constprop.3+0x58>
c0002424:	08061463          	bnez	a2,c00024ac <slob_alloc.isra.1.constprop.3+0xf4>
c0002428:	00000513          	li	a0,0
c000242c:	f05ff0ef          	jal	ra,c0002330 <__slob_get_free_pages.isra.0>
c0002430:	08050663          	beqz	a0,c00024bc <slob_alloc.isra.1.constprop.3+0x104>
c0002434:	00090593          	mv	a1,s2
c0002438:	df5ff0ef          	jal	ra,c000222c <slob_free>
c000243c:	10002673          	csrr	a2,sstatus
c0002440:	00267613          	andi	a2,a2,2
c0002444:	08061c63          	bnez	a2,c00024dc <slob_alloc.isra.1.constprop.3+0x124>
c0002448:	0003a697          	auipc	a3,0x3a
c000244c:	0886a683          	lw	a3,136(a3) # c003c4d0 <slobfree>
c0002450:	00068793          	mv	a5,a3
c0002454:	0047a503          	lw	a0,4(a5)
c0002458:	00052703          	lw	a4,0(a0)
c000245c:	fc8740e3          	blt	a4,s0,c000241c <slob_alloc.isra.1.constprop.3+0x64>
c0002460:	0ae40e63          	beq	s0,a4,c000251c <slob_alloc.isra.1.constprop.3+0x164>
c0002464:	ff84f693          	andi	a3,s1,-8
c0002468:	00d506b3          	add	a3,a0,a3
c000246c:	00d7a223          	sw	a3,4(a5)
c0002470:	00452583          	lw	a1,4(a0)
c0002474:	40870733          	sub	a4,a4,s0
c0002478:	00e6a023          	sw	a4,0(a3)
c000247c:	00b6a223          	sw	a1,4(a3)
c0002480:	00852023          	sw	s0,0(a0)
c0002484:	0003a297          	auipc	t0,0x3a
c0002488:	04f2a623          	sw	a5,76(t0) # c003c4d0 <slobfree>
c000248c:	06061463          	bnez	a2,c00024f4 <slob_alloc.isra.1.constprop.3+0x13c>
c0002490:	02c12083          	lw	ra,44(sp)
c0002494:	02812403          	lw	s0,40(sp)
c0002498:	02412483          	lw	s1,36(sp)
c000249c:	02012903          	lw	s2,32(sp)
c00024a0:	01c12983          	lw	s3,28(sp)
c00024a4:	03010113          	addi	sp,sp,48
c00024a8:	00008067          	ret
c00024ac:	b70fe0ef          	jal	ra,c000081c <intr_enable>
c00024b0:	00000513          	li	a0,0
c00024b4:	e7dff0ef          	jal	ra,c0002330 <__slob_get_free_pages.isra.0>
c00024b8:	f6051ee3          	bnez	a0,c0002434 <slob_alloc.isra.1.constprop.3+0x7c>
c00024bc:	02c12083          	lw	ra,44(sp)
c00024c0:	00000513          	li	a0,0
c00024c4:	02812403          	lw	s0,40(sp)
c00024c8:	02412483          	lw	s1,36(sp)
c00024cc:	02012903          	lw	s2,32(sp)
c00024d0:	01c12983          	lw	s3,28(sp)
c00024d4:	03010113          	addi	sp,sp,48
c00024d8:	00008067          	ret
c00024dc:	b48fe0ef          	jal	ra,c0000824 <intr_disable>
c00024e0:	00098613          	mv	a2,s3
c00024e4:	f65ff06f          	j	c0002448 <slob_alloc.isra.1.constprop.3+0x90>
c00024e8:	b3cfe0ef          	jal	ra,c0000824 <intr_disable>
c00024ec:	00100613          	li	a2,1
c00024f0:	f01ff06f          	j	c00023f0 <slob_alloc.isra.1.constprop.3+0x38>
c00024f4:	00a12623          	sw	a0,12(sp)
c00024f8:	b24fe0ef          	jal	ra,c000081c <intr_enable>
c00024fc:	02c12083          	lw	ra,44(sp)
c0002500:	00c12503          	lw	a0,12(sp)
c0002504:	02812403          	lw	s0,40(sp)
c0002508:	02412483          	lw	s1,36(sp)
c000250c:	02012903          	lw	s2,32(sp)
c0002510:	01c12983          	lw	s3,28(sp)
c0002514:	03010113          	addi	sp,sp,48
c0002518:	00008067          	ret
c000251c:	00452703          	lw	a4,4(a0)
c0002520:	00e7a223          	sw	a4,4(a5)
c0002524:	f61ff06f          	j	c0002484 <slob_alloc.isra.1.constprop.3+0xcc>
c0002528:	00078513          	mv	a0,a5
c000252c:	00068793          	mv	a5,a3
c0002530:	f31ff06f          	j	c0002460 <slob_alloc.isra.1.constprop.3+0xa8>
c0002534:	0000b697          	auipc	a3,0xb
c0002538:	68868693          	addi	a3,a3,1672 # c000dbbc <commands+0xd20>
c000253c:	0000b617          	auipc	a2,0xb
c0002540:	d3860613          	addi	a2,a2,-712 # c000d274 <commands+0x3d8>
c0002544:	06400593          	li	a1,100
c0002548:	0000b517          	auipc	a0,0xb
c000254c:	69450513          	addi	a0,a0,1684 # c000dbdc <commands+0xd40>
c0002550:	d01fd0ef          	jal	ra,c0000250 <__panic>

c0002554 <kmalloc_init>:
c0002554:	ff010113          	addi	sp,sp,-16
c0002558:	0000b517          	auipc	a0,0xb
c000255c:	69850513          	addi	a0,a0,1688 # c000dbf0 <commands+0xd54>
c0002560:	00112623          	sw	ra,12(sp)
c0002564:	b79fd0ef          	jal	ra,c00000dc <cprintf>
c0002568:	00c12083          	lw	ra,12(sp)
c000256c:	0000b517          	auipc	a0,0xb
c0002570:	63450513          	addi	a0,a0,1588 # c000dba0 <commands+0xd04>
c0002574:	01010113          	addi	sp,sp,16
c0002578:	b65fd06f          	j	c00000dc <cprintf>

c000257c <kallocated>:
c000257c:	00000513          	li	a0,0
c0002580:	00008067          	ret

c0002584 <kmalloc>:
c0002584:	ff010113          	addi	sp,sp,-16
c0002588:	00912223          	sw	s1,4(sp)
c000258c:	000014b7          	lui	s1,0x1
c0002590:	00812423          	sw	s0,8(sp)
c0002594:	00112623          	sw	ra,12(sp)
c0002598:	01212023          	sw	s2,0(sp)
c000259c:	ff748793          	addi	a5,s1,-9 # ff7 <_binary_obj___user_faultread_out_size-0x10b1>
c00025a0:	00050413          	mv	s0,a0
c00025a4:	02a7e863          	bltu	a5,a0,c00025d4 <kmalloc+0x50>
c00025a8:	00850513          	addi	a0,a0,8
c00025ac:	e0dff0ef          	jal	ra,c00023b8 <slob_alloc.isra.1.constprop.3>
c00025b0:	00850413          	addi	s0,a0,8
c00025b4:	0c050c63          	beqz	a0,c000268c <kmalloc+0x108>
c00025b8:	00c12083          	lw	ra,12(sp)
c00025bc:	00040513          	mv	a0,s0
c00025c0:	00412483          	lw	s1,4(sp)
c00025c4:	00812403          	lw	s0,8(sp)
c00025c8:	00012903          	lw	s2,0(sp)
c00025cc:	01010113          	addi	sp,sp,16
c00025d0:	00008067          	ret
c00025d4:	00c00513          	li	a0,12
c00025d8:	de1ff0ef          	jal	ra,c00023b8 <slob_alloc.isra.1.constprop.3>
c00025dc:	00050913          	mv	s2,a0
c00025e0:	0a050663          	beqz	a0,c000268c <kmalloc+0x108>
c00025e4:	00040793          	mv	a5,s0
c00025e8:	00000513          	li	a0,0
c00025ec:	0084da63          	ble	s0,s1,c0002600 <kmalloc+0x7c>
c00025f0:	00048713          	mv	a4,s1
c00025f4:	4017d793          	srai	a5,a5,0x1
c00025f8:	00150513          	addi	a0,a0,1
c00025fc:	fef74ce3          	blt	a4,a5,c00025f4 <kmalloc+0x70>
c0002600:	00a92023          	sw	a0,0(s2) # 1000 <_binary_obj___user_faultread_out_size-0x10a8>
c0002604:	d2dff0ef          	jal	ra,c0002330 <__slob_get_free_pages.isra.0>
c0002608:	00a92223          	sw	a0,4(s2)
c000260c:	00050413          	mv	s0,a0
c0002610:	08050263          	beqz	a0,c0002694 <kmalloc+0x110>
c0002614:	100027f3          	csrr	a5,sstatus
c0002618:	0027f793          	andi	a5,a5,2
c000261c:	02079a63          	bnez	a5,c0002650 <kmalloc+0xcc>
c0002620:	00c12083          	lw	ra,12(sp)
c0002624:	00043797          	auipc	a5,0x43
c0002628:	2e87a783          	lw	a5,744(a5) # c004590c <bigblocks>
c000262c:	00040513          	mv	a0,s0
c0002630:	00f92423          	sw	a5,8(s2)
c0002634:	00043297          	auipc	t0,0x43
c0002638:	2d22ac23          	sw	s2,728(t0) # c004590c <bigblocks>
c000263c:	00812403          	lw	s0,8(sp)
c0002640:	00412483          	lw	s1,4(sp)
c0002644:	00012903          	lw	s2,0(sp)
c0002648:	01010113          	addi	sp,sp,16
c000264c:	00008067          	ret
c0002650:	9d4fe0ef          	jal	ra,c0000824 <intr_disable>
c0002654:	00043797          	auipc	a5,0x43
c0002658:	2b87a783          	lw	a5,696(a5) # c004590c <bigblocks>
c000265c:	00f92423          	sw	a5,8(s2)
c0002660:	00043297          	auipc	t0,0x43
c0002664:	2b22a623          	sw	s2,684(t0) # c004590c <bigblocks>
c0002668:	9b4fe0ef          	jal	ra,c000081c <intr_enable>
c000266c:	00c12083          	lw	ra,12(sp)
c0002670:	00492403          	lw	s0,4(s2)
c0002674:	00412483          	lw	s1,4(sp)
c0002678:	00012903          	lw	s2,0(sp)
c000267c:	00040513          	mv	a0,s0
c0002680:	00812403          	lw	s0,8(sp)
c0002684:	01010113          	addi	sp,sp,16
c0002688:	00008067          	ret
c000268c:	00000413          	li	s0,0
c0002690:	f29ff06f          	j	c00025b8 <kmalloc+0x34>
c0002694:	00c00593          	li	a1,12
c0002698:	00090513          	mv	a0,s2
c000269c:	b91ff0ef          	jal	ra,c000222c <slob_free>
c00026a0:	f19ff06f          	j	c00025b8 <kmalloc+0x34>

c00026a4 <kfree>:
c00026a4:	12050c63          	beqz	a0,c00027dc <kfree+0x138>
c00026a8:	ff010113          	addi	sp,sp,-16
c00026ac:	00912223          	sw	s1,4(sp)
c00026b0:	00112623          	sw	ra,12(sp)
c00026b4:	00812423          	sw	s0,8(sp)
c00026b8:	01451793          	slli	a5,a0,0x14
c00026bc:	00050493          	mv	s1,a0
c00026c0:	04079263          	bnez	a5,c0002704 <kfree+0x60>
c00026c4:	100027f3          	csrr	a5,sstatus
c00026c8:	0027f793          	andi	a5,a5,2
c00026cc:	0c079663          	bnez	a5,c0002798 <kfree+0xf4>
c00026d0:	00043797          	auipc	a5,0x43
c00026d4:	23c7a783          	lw	a5,572(a5) # c004590c <bigblocks>
c00026d8:	02078663          	beqz	a5,c0002704 <kfree+0x60>
c00026dc:	0047a703          	lw	a4,4(a5)
c00026e0:	10e50063          	beq	a0,a4,c00027e0 <kfree+0x13c>
c00026e4:	00000693          	li	a3,0
c00026e8:	0100006f          	j	c00026f8 <kfree+0x54>
c00026ec:	00442703          	lw	a4,4(s0)
c00026f0:	02e48863          	beq	s1,a4,c0002720 <kfree+0x7c>
c00026f4:	00040793          	mv	a5,s0
c00026f8:	0087a403          	lw	s0,8(a5)
c00026fc:	fe0418e3          	bnez	s0,c00026ec <kfree+0x48>
c0002700:	0c069a63          	bnez	a3,c00027d4 <kfree+0x130>
c0002704:	ff848513          	addi	a0,s1,-8
c0002708:	00c12083          	lw	ra,12(sp)
c000270c:	00812403          	lw	s0,8(sp)
c0002710:	00412483          	lw	s1,4(sp)
c0002714:	00000593          	li	a1,0
c0002718:	01010113          	addi	sp,sp,16
c000271c:	b11ff06f          	j	c000222c <slob_free>
c0002720:	00842703          	lw	a4,8(s0)
c0002724:	00e7a423          	sw	a4,8(a5)
c0002728:	0a069263          	bnez	a3,c00027cc <kfree+0x128>
c000272c:	c00007b7          	lui	a5,0xc0000
c0002730:	00042703          	lw	a4,0(s0)
c0002734:	0cf4e263          	bltu	s1,a5,c00027f8 <kfree+0x154>
c0002738:	00043697          	auipc	a3,0x43
c000273c:	2c86a683          	lw	a3,712(a3) # c0045a00 <va_pa_offset>
c0002740:	40d484b3          	sub	s1,s1,a3
c0002744:	00c4d493          	srli	s1,s1,0xc
c0002748:	00043797          	auipc	a5,0x43
c000274c:	1d47a783          	lw	a5,468(a5) # c004591c <npage>
c0002750:	0cf4f263          	bleu	a5,s1,c0002814 <kfree+0x170>
c0002754:	0003a517          	auipc	a0,0x3a
c0002758:	d8052503          	lw	a0,-640(a0) # c003c4d4 <nbase>
c000275c:	40a484b3          	sub	s1,s1,a0
c0002760:	00549493          	slli	s1,s1,0x5
c0002764:	00043517          	auipc	a0,0x43
c0002768:	2a452503          	lw	a0,676(a0) # c0045a08 <pages>
c000276c:	00100593          	li	a1,1
c0002770:	00950533          	add	a0,a0,s1
c0002774:	00e595b3          	sll	a1,a1,a4
c0002778:	1e1010ef          	jal	ra,c0004158 <free_pages>
c000277c:	00040513          	mv	a0,s0
c0002780:	00c12083          	lw	ra,12(sp)
c0002784:	00812403          	lw	s0,8(sp)
c0002788:	00412483          	lw	s1,4(sp)
c000278c:	00c00593          	li	a1,12
c0002790:	01010113          	addi	sp,sp,16
c0002794:	a99ff06f          	j	c000222c <slob_free>
c0002798:	88cfe0ef          	jal	ra,c0000824 <intr_disable>
c000279c:	00043797          	auipc	a5,0x43
c00027a0:	1707a783          	lw	a5,368(a5) # c004590c <bigblocks>
c00027a4:	02078863          	beqz	a5,c00027d4 <kfree+0x130>
c00027a8:	0047a703          	lw	a4,4(a5)
c00027ac:	00e48663          	beq	s1,a4,c00027b8 <kfree+0x114>
c00027b0:	00100693          	li	a3,1
c00027b4:	f45ff06f          	j	c00026f8 <kfree+0x54>
c00027b8:	0087a703          	lw	a4,8(a5)
c00027bc:	00078413          	mv	s0,a5
c00027c0:	00043797          	auipc	a5,0x43
c00027c4:	14c78793          	addi	a5,a5,332 # c004590c <bigblocks>
c00027c8:	00e7a023          	sw	a4,0(a5)
c00027cc:	850fe0ef          	jal	ra,c000081c <intr_enable>
c00027d0:	f5dff06f          	j	c000272c <kfree+0x88>
c00027d4:	848fe0ef          	jal	ra,c000081c <intr_enable>
c00027d8:	f2dff06f          	j	c0002704 <kfree+0x60>
c00027dc:	00008067          	ret
c00027e0:	0087a703          	lw	a4,8(a5)
c00027e4:	00078413          	mv	s0,a5
c00027e8:	00043797          	auipc	a5,0x43
c00027ec:	12478793          	addi	a5,a5,292 # c004590c <bigblocks>
c00027f0:	00e7a023          	sw	a4,0(a5)
c00027f4:	f39ff06f          	j	c000272c <kfree+0x88>
c00027f8:	00048693          	mv	a3,s1
c00027fc:	0000b617          	auipc	a2,0xb
c0002800:	38060613          	addi	a2,a2,896 # c000db7c <commands+0xce0>
c0002804:	06d00593          	li	a1,109
c0002808:	0000b517          	auipc	a0,0xb
c000280c:	10850513          	addi	a0,a0,264 # c000d910 <commands+0xa74>
c0002810:	a41fd0ef          	jal	ra,c0000250 <__panic>
c0002814:	0000b617          	auipc	a2,0xb
c0002818:	0dc60613          	addi	a2,a2,220 # c000d8f0 <commands+0xa54>
c000281c:	06100593          	li	a1,97
c0002820:	0000b517          	auipc	a0,0xb
c0002824:	0f050513          	addi	a0,a0,240 # c000d910 <commands+0xa74>
c0002828:	a29fd0ef          	jal	ra,c0000250 <__panic>

c000282c <swap_init>:
c000282c:	fb010113          	addi	sp,sp,-80
c0002830:	04112623          	sw	ra,76(sp)
c0002834:	04812423          	sw	s0,72(sp)
c0002838:	04912223          	sw	s1,68(sp)
c000283c:	05212023          	sw	s2,64(sp)
c0002840:	03312e23          	sw	s3,60(sp)
c0002844:	03412c23          	sw	s4,56(sp)
c0002848:	03512a23          	sw	s5,52(sp)
c000284c:	03612823          	sw	s6,48(sp)
c0002850:	03712623          	sw	s7,44(sp)
c0002854:	03812423          	sw	s8,40(sp)
c0002858:	03912223          	sw	s9,36(sp)
c000285c:	03a12023          	sw	s10,32(sp)
c0002860:	01b12e23          	sw	s11,28(sp)
c0002864:	088040ef          	jal	ra,c00068ec <swapfs_init>
c0002868:	00043697          	auipc	a3,0x43
c000286c:	1606a683          	lw	a3,352(a3) # c00459c8 <max_swap_offset>
c0002870:	010007b7          	lui	a5,0x1000
c0002874:	ff968713          	addi	a4,a3,-7
c0002878:	ff878793          	addi	a5,a5,-8 # fffff8 <_binary_obj___user_matrix_out_size+0xffd6b0>
c000287c:	5ee7e263          	bltu	a5,a4,c0002e60 <swap_init+0x634>
c0002880:	0003a797          	auipc	a5,0x3a
c0002884:	c1078793          	addi	a5,a5,-1008 # c003c490 <swap_manager_fifo>
c0002888:	00043297          	auipc	t0,0x43
c000288c:	08f2a423          	sw	a5,136(t0) # c0045910 <sm>
c0002890:	0003a797          	auipc	a5,0x3a
c0002894:	c047a783          	lw	a5,-1020(a5) # c003c494 <swap_manager_fifo+0x4>
c0002898:	000780e7          	jalr	a5
c000289c:	00050a93          	mv	s5,a0
c00028a0:	04050263          	beqz	a0,c00028e4 <swap_init+0xb8>
c00028a4:	04c12083          	lw	ra,76(sp)
c00028a8:	000a8513          	mv	a0,s5
c00028ac:	04812403          	lw	s0,72(sp)
c00028b0:	04412483          	lw	s1,68(sp)
c00028b4:	04012903          	lw	s2,64(sp)
c00028b8:	03c12983          	lw	s3,60(sp)
c00028bc:	03812a03          	lw	s4,56(sp)
c00028c0:	03412a83          	lw	s5,52(sp)
c00028c4:	03012b03          	lw	s6,48(sp)
c00028c8:	02c12b83          	lw	s7,44(sp)
c00028cc:	02812c03          	lw	s8,40(sp)
c00028d0:	02412c83          	lw	s9,36(sp)
c00028d4:	02012d03          	lw	s10,32(sp)
c00028d8:	01c12d83          	lw	s11,28(sp)
c00028dc:	05010113          	addi	sp,sp,80
c00028e0:	00008067          	ret
c00028e4:	00043797          	auipc	a5,0x43
c00028e8:	02c7a783          	lw	a5,44(a5) # c0045910 <sm>
c00028ec:	0007a583          	lw	a1,0(a5)
c00028f0:	0000b517          	auipc	a0,0xb
c00028f4:	39050513          	addi	a0,a0,912 # c000dc80 <commands+0xde4>
c00028f8:	00100793          	li	a5,1
c00028fc:	00043297          	auipc	t0,0x43
c0002900:	00f2ac23          	sw	a5,24(t0) # c0045914 <swap_init_ok>
c0002904:	fd8fd0ef          	jal	ra,c00000dc <cprintf>
c0002908:	00043417          	auipc	s0,0x43
c000290c:	0e840413          	addi	s0,s0,232 # c00459f0 <free_area>
c0002910:	00043797          	auipc	a5,0x43
c0002914:	0e47a783          	lw	a5,228(a5) # c00459f4 <free_area+0x4>
c0002918:	3e878463          	beq	a5,s0,c0002d00 <swap_init+0x4d4>
c000291c:	ff87a703          	lw	a4,-8(a5)
c0002920:	00175713          	srli	a4,a4,0x1
c0002924:	00177713          	andi	a4,a4,1
c0002928:	3e070463          	beqz	a4,c0002d10 <swap_init+0x4e4>
c000292c:	00000d93          	li	s11,0
c0002930:	00000d13          	li	s10,0
c0002934:	0100006f          	j	c0002944 <swap_init+0x118>
c0002938:	ff87a683          	lw	a3,-8(a5)
c000293c:	0026f693          	andi	a3,a3,2
c0002940:	3c068863          	beqz	a3,c0002d10 <swap_init+0x4e4>
c0002944:	ffc7a683          	lw	a3,-4(a5)
c0002948:	0047a783          	lw	a5,4(a5)
c000294c:	001d0d13          	addi	s10,s10,1
c0002950:	00dd8db3          	add	s11,s11,a3
c0002954:	000d8493          	mv	s1,s11
c0002958:	fe8790e3          	bne	a5,s0,c0002938 <swap_init+0x10c>
c000295c:	061010ef          	jal	ra,c00041bc <nr_free_pages>
c0002960:	4ea49063          	bne	s1,a0,c0002e40 <swap_init+0x614>
c0002964:	000d8613          	mv	a2,s11
c0002968:	000d0593          	mv	a1,s10
c000296c:	0000b517          	auipc	a0,0xb
c0002970:	35450513          	addi	a0,a0,852 # c000dcc0 <commands+0xe24>
c0002974:	f68fd0ef          	jal	ra,c00000dc <cprintf>
c0002978:	f04fe0ef          	jal	ra,c000107c <mm_create>
c000297c:	00050a13          	mv	s4,a0
c0002980:	46050063          	beqz	a0,c0002de0 <swap_init+0x5b4>
c0002984:	00043797          	auipc	a5,0x43
c0002988:	fc47a783          	lw	a5,-60(a5) # c0045948 <check_mm_struct>
c000298c:	48079a63          	bnez	a5,c0002e20 <swap_init+0x5f4>
c0002990:	00043997          	auipc	s3,0x43
c0002994:	f889a983          	lw	s3,-120(s3) # c0045918 <boot_pgdir>
c0002998:	0009a783          	lw	a5,0(s3)
c000299c:	00043717          	auipc	a4,0x43
c00029a0:	fac70713          	addi	a4,a4,-84 # c0045948 <check_mm_struct>
c00029a4:	00a72023          	sw	a0,0(a4)
c00029a8:	01352623          	sw	s3,12(a0)
c00029ac:	64079663          	bnez	a5,c0002ff8 <swap_init+0x7cc>
c00029b0:	000065b7          	lui	a1,0x6
c00029b4:	00300613          	li	a2,3
c00029b8:	00001537          	lui	a0,0x1
c00029bc:	f2cfe0ef          	jal	ra,c00010e8 <vma_create>
c00029c0:	00050593          	mv	a1,a0
c00029c4:	42050e63          	beqz	a0,c0002e00 <swap_init+0x5d4>
c00029c8:	000a0513          	mv	a0,s4
c00029cc:	fccfe0ef          	jal	ra,c0001198 <insert_vma_struct>
c00029d0:	0000b517          	auipc	a0,0xb
c00029d4:	33050513          	addi	a0,a0,816 # c000dd00 <commands+0xe64>
c00029d8:	f04fd0ef          	jal	ra,c00000dc <cprintf>
c00029dc:	00ca2503          	lw	a0,12(s4)
c00029e0:	00100613          	li	a2,1
c00029e4:	000015b7          	lui	a1,0x1
c00029e8:	02d010ef          	jal	ra,c0004214 <get_pte>
c00029ec:	5e050663          	beqz	a0,c0002fd8 <swap_init+0x7ac>
c00029f0:	0000b517          	auipc	a0,0xb
c00029f4:	35850513          	addi	a0,a0,856 # c000dd48 <commands+0xeac>
c00029f8:	00043917          	auipc	s2,0x43
c00029fc:	f5c90913          	addi	s2,s2,-164 # c0045954 <check_rp>
c0002a00:	edcfd0ef          	jal	ra,c00000dc <cprintf>
c0002a04:	00043b17          	auipc	s6,0x43
c0002a08:	f60b0b13          	addi	s6,s6,-160 # c0045964 <swap_in_seq_no>
c0002a0c:	00090b93          	mv	s7,s2
c0002a10:	00100493          	li	s1,1
c0002a14:	00048513          	mv	a0,s1
c0002a18:	68c010ef          	jal	ra,c00040a4 <alloc_pages>
c0002a1c:	00aba023          	sw	a0,0(s7)
c0002a20:	38050063          	beqz	a0,c0002da0 <swap_init+0x574>
c0002a24:	00452783          	lw	a5,4(a0)
c0002a28:	0027f793          	andi	a5,a5,2
c0002a2c:	34079a63          	bnez	a5,c0002d80 <swap_init+0x554>
c0002a30:	004b8b93          	addi	s7,s7,4
c0002a34:	ff6b90e3          	bne	s7,s6,c0002a14 <swap_init+0x1e8>
c0002a38:	00043797          	auipc	a5,0x43
c0002a3c:	fb87a783          	lw	a5,-72(a5) # c00459f0 <free_area>
c0002a40:	00f12423          	sw	a5,8(sp)
c0002a44:	00043797          	auipc	a5,0x43
c0002a48:	fb47a783          	lw	a5,-76(a5) # c00459f8 <free_area+0x8>
c0002a4c:	00043c97          	auipc	s9,0x43
c0002a50:	fa8cac83          	lw	s9,-88(s9) # c00459f4 <free_area+0x4>
c0002a54:	00f12623          	sw	a5,12(sp)
c0002a58:	00842223          	sw	s0,4(s0)
c0002a5c:	00842023          	sw	s0,0(s0)
c0002a60:	00042423          	sw	zero,8(s0)
c0002a64:	00043497          	auipc	s1,0x43
c0002a68:	ef048493          	addi	s1,s1,-272 # c0045954 <check_rp>
c0002a6c:	00100b13          	li	s6,1
c0002a70:	0004a503          	lw	a0,0(s1)
c0002a74:	000b0593          	mv	a1,s6
c0002a78:	00448493          	addi	s1,s1,4
c0002a7c:	6dc010ef          	jal	ra,c0004158 <free_pages>
c0002a80:	ff7498e3          	bne	s1,s7,c0002a70 <swap_init+0x244>
c0002a84:	00043b17          	auipc	s6,0x43
c0002a88:	f74b2b03          	lw	s6,-140(s6) # c00459f8 <free_area+0x8>
c0002a8c:	00400793          	li	a5,4
c0002a90:	52fb1463          	bne	s6,a5,c0002fb8 <swap_init+0x78c>
c0002a94:	0000b517          	auipc	a0,0xb
c0002a98:	32c50513          	addi	a0,a0,812 # c000ddc0 <commands+0xf24>
c0002a9c:	e40fd0ef          	jal	ra,c00000dc <cprintf>
c0002aa0:	00001637          	lui	a2,0x1
c0002aa4:	00043297          	auipc	t0,0x43
c0002aa8:	e602a223          	sw	zero,-412(t0) # c0045908 <pgfault_num>
c0002aac:	00a00593          	li	a1,10
c0002ab0:	00b60023          	sb	a1,0(a2) # 1000 <_binary_obj___user_faultread_out_size-0x10a8>
c0002ab4:	00043797          	auipc	a5,0x43
c0002ab8:	e547a783          	lw	a5,-428(a5) # c0045908 <pgfault_num>
c0002abc:	00100513          	li	a0,1
c0002ac0:	4aa79c63          	bne	a5,a0,c0002f78 <swap_init+0x74c>
c0002ac4:	00b60823          	sb	a1,16(a2)
c0002ac8:	00043617          	auipc	a2,0x43
c0002acc:	e4062603          	lw	a2,-448(a2) # c0045908 <pgfault_num>
c0002ad0:	4cf61463          	bne	a2,a5,c0002f98 <swap_init+0x76c>
c0002ad4:	00002637          	lui	a2,0x2
c0002ad8:	00b00593          	li	a1,11
c0002adc:	00b60023          	sb	a1,0(a2) # 2000 <_binary_obj___user_faultread_out_size-0xa8>
c0002ae0:	00043797          	auipc	a5,0x43
c0002ae4:	e287a783          	lw	a5,-472(a5) # c0045908 <pgfault_num>
c0002ae8:	00200513          	li	a0,2
c0002aec:	40a79663          	bne	a5,a0,c0002ef8 <swap_init+0x6cc>
c0002af0:	00b60823          	sb	a1,16(a2)
c0002af4:	00043617          	auipc	a2,0x43
c0002af8:	e1462603          	lw	a2,-492(a2) # c0045908 <pgfault_num>
c0002afc:	40f61e63          	bne	a2,a5,c0002f18 <swap_init+0x6ec>
c0002b00:	00003637          	lui	a2,0x3
c0002b04:	00c00593          	li	a1,12
c0002b08:	00b60023          	sb	a1,0(a2) # 3000 <_binary_obj___user_matrix_out_size+0x6b8>
c0002b0c:	00043797          	auipc	a5,0x43
c0002b10:	dfc7a783          	lw	a5,-516(a5) # c0045908 <pgfault_num>
c0002b14:	00300513          	li	a0,3
c0002b18:	42a79063          	bne	a5,a0,c0002f38 <swap_init+0x70c>
c0002b1c:	00b60823          	sb	a1,16(a2)
c0002b20:	00043617          	auipc	a2,0x43
c0002b24:	de862603          	lw	a2,-536(a2) # c0045908 <pgfault_num>
c0002b28:	42f61863          	bne	a2,a5,c0002f58 <swap_init+0x72c>
c0002b2c:	00004637          	lui	a2,0x4
c0002b30:	00d00593          	li	a1,13
c0002b34:	00b60023          	sb	a1,0(a2) # 4000 <_binary_obj___user_matrix_out_size+0x16b8>
c0002b38:	00043797          	auipc	a5,0x43
c0002b3c:	dd07a783          	lw	a5,-560(a5) # c0045908 <pgfault_num>
c0002b40:	33679c63          	bne	a5,s6,c0002e78 <swap_init+0x64c>
c0002b44:	00b60823          	sb	a1,16(a2)
c0002b48:	00043617          	auipc	a2,0x43
c0002b4c:	dc062603          	lw	a2,-576(a2) # c0045908 <pgfault_num>
c0002b50:	34f61463          	bne	a2,a5,c0002e98 <swap_init+0x66c>
c0002b54:	00043897          	auipc	a7,0x43
c0002b58:	ea48a883          	lw	a7,-348(a7) # c00459f8 <free_area+0x8>
c0002b5c:	00043797          	auipc	a5,0x43
c0002b60:	e0878793          	addi	a5,a5,-504 # c0045964 <swap_in_seq_no>
c0002b64:	00043617          	auipc	a2,0x43
c0002b68:	e2860613          	addi	a2,a2,-472 # c004598c <swap_out_seq_no>
c0002b6c:	00043517          	auipc	a0,0x43
c0002b70:	e2050513          	addi	a0,a0,-480 # c004598c <swap_out_seq_no>
c0002b74:	fff00593          	li	a1,-1
c0002b78:	34089063          	bnez	a7,c0002eb8 <swap_init+0x68c>
c0002b7c:	00b7a023          	sw	a1,0(a5)
c0002b80:	00b62023          	sw	a1,0(a2)
c0002b84:	00478793          	addi	a5,a5,4
c0002b88:	00460613          	addi	a2,a2,4
c0002b8c:	fef518e3          	bne	a0,a5,c0002b7c <swap_init+0x350>
c0002b90:	0003a797          	auipc	a5,0x3a
c0002b94:	9447a783          	lw	a5,-1724(a5) # c003c4d4 <nbase>
c0002b98:	00001bb7          	lui	s7,0x1
c0002b9c:	00043b17          	auipc	s6,0x43
c0002ba0:	e44b0b13          	addi	s6,s6,-444 # c00459e0 <check_ptep>
c0002ba4:	00043c17          	auipc	s8,0x43
c0002ba8:	db0c0c13          	addi	s8,s8,-592 # c0045954 <check_rp>
c0002bac:	00f12223          	sw	a5,4(sp)
c0002bb0:	00000613          	li	a2,0
c0002bb4:	000b8593          	mv	a1,s7
c0002bb8:	00098513          	mv	a0,s3
c0002bbc:	000b2023          	sw	zero,0(s6)
c0002bc0:	654010ef          	jal	ra,c0004214 <get_pte>
c0002bc4:	00ab2023          	sw	a0,0(s6)
c0002bc8:	1e050c63          	beqz	a0,c0002dc0 <swap_init+0x594>
c0002bcc:	00052783          	lw	a5,0(a0)
c0002bd0:	0017f613          	andi	a2,a5,1
c0002bd4:	16060e63          	beqz	a2,c0002d50 <swap_init+0x524>
c0002bd8:	00279793          	slli	a5,a5,0x2
c0002bdc:	00c7d793          	srli	a5,a5,0xc
c0002be0:	00043617          	auipc	a2,0x43
c0002be4:	d3c62603          	lw	a2,-708(a2) # c004591c <npage>
c0002be8:	18c7f063          	bleu	a2,a5,c0002d68 <swap_init+0x53c>
c0002bec:	00412703          	lw	a4,4(sp)
c0002bf0:	000c2583          	lw	a1,0(s8)
c0002bf4:	00043617          	auipc	a2,0x43
c0002bf8:	e1462603          	lw	a2,-492(a2) # c0045a08 <pages>
c0002bfc:	40e787b3          	sub	a5,a5,a4
c0002c00:	00579793          	slli	a5,a5,0x5
c0002c04:	00f607b3          	add	a5,a2,a5
c0002c08:	12f59463          	bne	a1,a5,c0002d30 <swap_init+0x504>
c0002c0c:	000017b7          	lui	a5,0x1
c0002c10:	00fb8bb3          	add	s7,s7,a5
c0002c14:	000057b7          	lui	a5,0x5
c0002c18:	004b0b13          	addi	s6,s6,4
c0002c1c:	004c0c13          	addi	s8,s8,4
c0002c20:	f8fb98e3          	bne	s7,a5,c0002bb0 <swap_init+0x384>
c0002c24:	0000b517          	auipc	a0,0xb
c0002c28:	26850513          	addi	a0,a0,616 # c000de8c <commands+0xff0>
c0002c2c:	cb0fd0ef          	jal	ra,c00000dc <cprintf>
c0002c30:	00043797          	auipc	a5,0x43
c0002c34:	ce07a783          	lw	a5,-800(a5) # c0045910 <sm>
c0002c38:	01c7a783          	lw	a5,28(a5)
c0002c3c:	00100b93          	li	s7,1
c0002c40:	000780e7          	jalr	a5
c0002c44:	28051a63          	bnez	a0,c0002ed8 <swap_init+0x6ac>
c0002c48:	00092503          	lw	a0,0(s2)
c0002c4c:	000b8593          	mv	a1,s7
c0002c50:	00490913          	addi	s2,s2,4
c0002c54:	504010ef          	jal	ra,c0004158 <free_pages>
c0002c58:	fe9918e3          	bne	s2,s1,c0002c48 <swap_init+0x41c>
c0002c5c:	0009a783          	lw	a5,0(s3)
c0002c60:	00043617          	auipc	a2,0x43
c0002c64:	cbc62603          	lw	a2,-836(a2) # c004591c <npage>
c0002c68:	00279793          	slli	a5,a5,0x2
c0002c6c:	00c7d793          	srli	a5,a5,0xc
c0002c70:	0ec7fc63          	bleu	a2,a5,c0002d68 <swap_init+0x53c>
c0002c74:	00412703          	lw	a4,4(sp)
c0002c78:	00043517          	auipc	a0,0x43
c0002c7c:	d9052503          	lw	a0,-624(a0) # c0045a08 <pages>
c0002c80:	00100593          	li	a1,1
c0002c84:	40e787b3          	sub	a5,a5,a4
c0002c88:	00579793          	slli	a5,a5,0x5
c0002c8c:	00f50533          	add	a0,a0,a5
c0002c90:	4c8010ef          	jal	ra,c0004158 <free_pages>
c0002c94:	0009a023          	sw	zero,0(s3)
c0002c98:	000a2623          	sw	zero,12(s4)
c0002c9c:	000a0513          	mv	a0,s4
c0002ca0:	df8fe0ef          	jal	ra,c0001298 <mm_destroy>
c0002ca4:	00043797          	auipc	a5,0x43
c0002ca8:	ca478793          	addi	a5,a5,-860 # c0045948 <check_mm_struct>
c0002cac:	0007a023          	sw	zero,0(a5)
c0002cb0:	00c12783          	lw	a5,12(sp)
c0002cb4:	01942223          	sw	s9,4(s0)
c0002cb8:	00f42423          	sw	a5,8(s0)
c0002cbc:	00812783          	lw	a5,8(sp)
c0002cc0:	00f42023          	sw	a5,0(s0)
c0002cc4:	008c8c63          	beq	s9,s0,c0002cdc <swap_init+0x4b0>
c0002cc8:	ffcca783          	lw	a5,-4(s9)
c0002ccc:	004cac83          	lw	s9,4(s9)
c0002cd0:	fffd0d13          	addi	s10,s10,-1
c0002cd4:	40fd8db3          	sub	s11,s11,a5
c0002cd8:	fe8c98e3          	bne	s9,s0,c0002cc8 <swap_init+0x49c>
c0002cdc:	000d8613          	mv	a2,s11
c0002ce0:	000d0593          	mv	a1,s10
c0002ce4:	0000b517          	auipc	a0,0xb
c0002ce8:	1d850513          	addi	a0,a0,472 # c000debc <commands+0x1020>
c0002cec:	bf0fd0ef          	jal	ra,c00000dc <cprintf>
c0002cf0:	0000b517          	auipc	a0,0xb
c0002cf4:	1e850513          	addi	a0,a0,488 # c000ded8 <commands+0x103c>
c0002cf8:	be4fd0ef          	jal	ra,c00000dc <cprintf>
c0002cfc:	ba9ff06f          	j	c00028a4 <swap_init+0x78>
c0002d00:	00000d93          	li	s11,0
c0002d04:	00000d13          	li	s10,0
c0002d08:	00000493          	li	s1,0
c0002d0c:	c51ff06f          	j	c000295c <swap_init+0x130>
c0002d10:	0000b697          	auipc	a3,0xb
c0002d14:	f8468693          	addi	a3,a3,-124 # c000dc94 <commands+0xdf8>
c0002d18:	0000a617          	auipc	a2,0xa
c0002d1c:	55c60613          	addi	a2,a2,1372 # c000d274 <commands+0x3d8>
c0002d20:	0bc00593          	li	a1,188
c0002d24:	0000b517          	auipc	a0,0xb
c0002d28:	f4c50513          	addi	a0,a0,-180 # c000dc70 <commands+0xdd4>
c0002d2c:	d24fd0ef          	jal	ra,c0000250 <__panic>
c0002d30:	0000b697          	auipc	a3,0xb
c0002d34:	13468693          	addi	a3,a3,308 # c000de64 <commands+0xfc8>
c0002d38:	0000a617          	auipc	a2,0xa
c0002d3c:	53c60613          	addi	a2,a2,1340 # c000d274 <commands+0x3d8>
c0002d40:	0fc00593          	li	a1,252
c0002d44:	0000b517          	auipc	a0,0xb
c0002d48:	f2c50513          	addi	a0,a0,-212 # c000dc70 <commands+0xdd4>
c0002d4c:	d04fd0ef          	jal	ra,c0000250 <__panic>
c0002d50:	0000b617          	auipc	a2,0xb
c0002d54:	0f060613          	addi	a2,a2,240 # c000de40 <commands+0xfa4>
c0002d58:	07300593          	li	a1,115
c0002d5c:	0000b517          	auipc	a0,0xb
c0002d60:	bb450513          	addi	a0,a0,-1100 # c000d910 <commands+0xa74>
c0002d64:	cecfd0ef          	jal	ra,c0000250 <__panic>
c0002d68:	0000b617          	auipc	a2,0xb
c0002d6c:	b8860613          	addi	a2,a2,-1144 # c000d8f0 <commands+0xa54>
c0002d70:	06100593          	li	a1,97
c0002d74:	0000b517          	auipc	a0,0xb
c0002d78:	b9c50513          	addi	a0,a0,-1124 # c000d910 <commands+0xa74>
c0002d7c:	cd4fd0ef          	jal	ra,c0000250 <__panic>
c0002d80:	0000b697          	auipc	a3,0xb
c0002d84:	00068693          	mv	a3,a3
c0002d88:	0000a617          	auipc	a2,0xa
c0002d8c:	4ec60613          	addi	a2,a2,1260 # c000d274 <commands+0x3d8>
c0002d90:	0dd00593          	li	a1,221
c0002d94:	0000b517          	auipc	a0,0xb
c0002d98:	edc50513          	addi	a0,a0,-292 # c000dc70 <commands+0xdd4>
c0002d9c:	cb4fd0ef          	jal	ra,c0000250 <__panic>
c0002da0:	0000b697          	auipc	a3,0xb
c0002da4:	fcc68693          	addi	a3,a3,-52 # c000dd6c <commands+0xed0>
c0002da8:	0000a617          	auipc	a2,0xa
c0002dac:	4cc60613          	addi	a2,a2,1228 # c000d274 <commands+0x3d8>
c0002db0:	0dc00593          	li	a1,220
c0002db4:	0000b517          	auipc	a0,0xb
c0002db8:	ebc50513          	addi	a0,a0,-324 # c000dc70 <commands+0xdd4>
c0002dbc:	c94fd0ef          	jal	ra,c0000250 <__panic>
c0002dc0:	0000b697          	auipc	a3,0xb
c0002dc4:	06868693          	addi	a3,a3,104 # c000de28 <commands+0xf8c>
c0002dc8:	0000a617          	auipc	a2,0xa
c0002dcc:	4ac60613          	addi	a2,a2,1196 # c000d274 <commands+0x3d8>
c0002dd0:	0fb00593          	li	a1,251
c0002dd4:	0000b517          	auipc	a0,0xb
c0002dd8:	e9c50513          	addi	a0,a0,-356 # c000dc70 <commands+0xdd4>
c0002ddc:	c74fd0ef          	jal	ra,c0000250 <__panic>
c0002de0:	0000b697          	auipc	a3,0xb
c0002de4:	95868693          	addi	a3,a3,-1704 # c000d738 <commands+0x89c>
c0002de8:	0000a617          	auipc	a2,0xa
c0002dec:	48c60613          	addi	a2,a2,1164 # c000d274 <commands+0x3d8>
c0002df0:	0c400593          	li	a1,196
c0002df4:	0000b517          	auipc	a0,0xb
c0002df8:	e7c50513          	addi	a0,a0,-388 # c000dc70 <commands+0xdd4>
c0002dfc:	c54fd0ef          	jal	ra,c0000250 <__panic>
c0002e00:	0000b697          	auipc	a3,0xb
c0002e04:	b7c68693          	addi	a3,a3,-1156 # c000d97c <commands+0xae0>
c0002e08:	0000a617          	auipc	a2,0xa
c0002e0c:	46c60613          	addi	a2,a2,1132 # c000d274 <commands+0x3d8>
c0002e10:	0cf00593          	li	a1,207
c0002e14:	0000b517          	auipc	a0,0xb
c0002e18:	e5c50513          	addi	a0,a0,-420 # c000dc70 <commands+0xdd4>
c0002e1c:	c34fd0ef          	jal	ra,c0000250 <__panic>
c0002e20:	0000b697          	auipc	a3,0xb
c0002e24:	ec868693          	addi	a3,a3,-312 # c000dce8 <commands+0xe4c>
c0002e28:	0000a617          	auipc	a2,0xa
c0002e2c:	44c60613          	addi	a2,a2,1100 # c000d274 <commands+0x3d8>
c0002e30:	0c700593          	li	a1,199
c0002e34:	0000b517          	auipc	a0,0xb
c0002e38:	e3c50513          	addi	a0,a0,-452 # c000dc70 <commands+0xdd4>
c0002e3c:	c14fd0ef          	jal	ra,c0000250 <__panic>
c0002e40:	0000b697          	auipc	a3,0xb
c0002e44:	e6468693          	addi	a3,a3,-412 # c000dca4 <commands+0xe08>
c0002e48:	0000a617          	auipc	a2,0xa
c0002e4c:	42c60613          	addi	a2,a2,1068 # c000d274 <commands+0x3d8>
c0002e50:	0bf00593          	li	a1,191
c0002e54:	0000b517          	auipc	a0,0xb
c0002e58:	e1c50513          	addi	a0,a0,-484 # c000dc70 <commands+0xdd4>
c0002e5c:	bf4fd0ef          	jal	ra,c0000250 <__panic>
c0002e60:	0000b617          	auipc	a2,0xb
c0002e64:	df460613          	addi	a2,a2,-524 # c000dc54 <commands+0xdb8>
c0002e68:	02800593          	li	a1,40
c0002e6c:	0000b517          	auipc	a0,0xb
c0002e70:	e0450513          	addi	a0,a0,-508 # c000dc70 <commands+0xdd4>
c0002e74:	bdcfd0ef          	jal	ra,c0000250 <__panic>
c0002e78:	0000b697          	auipc	a3,0xb
c0002e7c:	b3868693          	addi	a3,a3,-1224 # c000d9b0 <commands+0xb14>
c0002e80:	0000a617          	auipc	a2,0xa
c0002e84:	3f460613          	addi	a2,a2,1012 # c000d274 <commands+0x3d8>
c0002e88:	09f00593          	li	a1,159
c0002e8c:	0000b517          	auipc	a0,0xb
c0002e90:	de450513          	addi	a0,a0,-540 # c000dc70 <commands+0xdd4>
c0002e94:	bbcfd0ef          	jal	ra,c0000250 <__panic>
c0002e98:	0000b697          	auipc	a3,0xb
c0002e9c:	b1868693          	addi	a3,a3,-1256 # c000d9b0 <commands+0xb14>
c0002ea0:	0000a617          	auipc	a2,0xa
c0002ea4:	3d460613          	addi	a2,a2,980 # c000d274 <commands+0x3d8>
c0002ea8:	0a100593          	li	a1,161
c0002eac:	0000b517          	auipc	a0,0xb
c0002eb0:	dc450513          	addi	a0,a0,-572 # c000dc70 <commands+0xdd4>
c0002eb4:	b9cfd0ef          	jal	ra,c0000250 <__panic>
c0002eb8:	0000b697          	auipc	a3,0xb
c0002ebc:	f6068693          	addi	a3,a3,-160 # c000de18 <commands+0xf7c>
c0002ec0:	0000a617          	auipc	a2,0xa
c0002ec4:	3b460613          	addi	a2,a2,948 # c000d274 <commands+0x3d8>
c0002ec8:	0f300593          	li	a1,243
c0002ecc:	0000b517          	auipc	a0,0xb
c0002ed0:	da450513          	addi	a0,a0,-604 # c000dc70 <commands+0xdd4>
c0002ed4:	b7cfd0ef          	jal	ra,c0000250 <__panic>
c0002ed8:	0000b697          	auipc	a3,0xb
c0002edc:	fdc68693          	addi	a3,a3,-36 # c000deb4 <commands+0x1018>
c0002ee0:	0000a617          	auipc	a2,0xa
c0002ee4:	39460613          	addi	a2,a2,916 # c000d274 <commands+0x3d8>
c0002ee8:	10200593          	li	a1,258
c0002eec:	0000b517          	auipc	a0,0xb
c0002ef0:	d8450513          	addi	a0,a0,-636 # c000dc70 <commands+0xdd4>
c0002ef4:	b5cfd0ef          	jal	ra,c0000250 <__panic>
c0002ef8:	0000b697          	auipc	a3,0xb
c0002efc:	f0068693          	addi	a3,a3,-256 # c000ddf8 <commands+0xf5c>
c0002f00:	0000a617          	auipc	a2,0xa
c0002f04:	37460613          	addi	a2,a2,884 # c000d274 <commands+0x3d8>
c0002f08:	09700593          	li	a1,151
c0002f0c:	0000b517          	auipc	a0,0xb
c0002f10:	d6450513          	addi	a0,a0,-668 # c000dc70 <commands+0xdd4>
c0002f14:	b3cfd0ef          	jal	ra,c0000250 <__panic>
c0002f18:	0000b697          	auipc	a3,0xb
c0002f1c:	ee068693          	addi	a3,a3,-288 # c000ddf8 <commands+0xf5c>
c0002f20:	0000a617          	auipc	a2,0xa
c0002f24:	35460613          	addi	a2,a2,852 # c000d274 <commands+0x3d8>
c0002f28:	09900593          	li	a1,153
c0002f2c:	0000b517          	auipc	a0,0xb
c0002f30:	d4450513          	addi	a0,a0,-700 # c000dc70 <commands+0xdd4>
c0002f34:	b1cfd0ef          	jal	ra,c0000250 <__panic>
c0002f38:	0000b697          	auipc	a3,0xb
c0002f3c:	ed068693          	addi	a3,a3,-304 # c000de08 <commands+0xf6c>
c0002f40:	0000a617          	auipc	a2,0xa
c0002f44:	33460613          	addi	a2,a2,820 # c000d274 <commands+0x3d8>
c0002f48:	09b00593          	li	a1,155
c0002f4c:	0000b517          	auipc	a0,0xb
c0002f50:	d2450513          	addi	a0,a0,-732 # c000dc70 <commands+0xdd4>
c0002f54:	afcfd0ef          	jal	ra,c0000250 <__panic>
c0002f58:	0000b697          	auipc	a3,0xb
c0002f5c:	eb068693          	addi	a3,a3,-336 # c000de08 <commands+0xf6c>
c0002f60:	0000a617          	auipc	a2,0xa
c0002f64:	31460613          	addi	a2,a2,788 # c000d274 <commands+0x3d8>
c0002f68:	09d00593          	li	a1,157
c0002f6c:	0000b517          	auipc	a0,0xb
c0002f70:	d0450513          	addi	a0,a0,-764 # c000dc70 <commands+0xdd4>
c0002f74:	adcfd0ef          	jal	ra,c0000250 <__panic>
c0002f78:	0000b697          	auipc	a3,0xb
c0002f7c:	e7068693          	addi	a3,a3,-400 # c000dde8 <commands+0xf4c>
c0002f80:	0000a617          	auipc	a2,0xa
c0002f84:	2f460613          	addi	a2,a2,756 # c000d274 <commands+0x3d8>
c0002f88:	09300593          	li	a1,147
c0002f8c:	0000b517          	auipc	a0,0xb
c0002f90:	ce450513          	addi	a0,a0,-796 # c000dc70 <commands+0xdd4>
c0002f94:	abcfd0ef          	jal	ra,c0000250 <__panic>
c0002f98:	0000b697          	auipc	a3,0xb
c0002f9c:	e5068693          	addi	a3,a3,-432 # c000dde8 <commands+0xf4c>
c0002fa0:	0000a617          	auipc	a2,0xa
c0002fa4:	2d460613          	addi	a2,a2,724 # c000d274 <commands+0x3d8>
c0002fa8:	09500593          	li	a1,149
c0002fac:	0000b517          	auipc	a0,0xb
c0002fb0:	cc450513          	addi	a0,a0,-828 # c000dc70 <commands+0xdd4>
c0002fb4:	a9cfd0ef          	jal	ra,c0000250 <__panic>
c0002fb8:	0000b697          	auipc	a3,0xb
c0002fbc:	de468693          	addi	a3,a3,-540 # c000dd9c <commands+0xf00>
c0002fc0:	0000a617          	auipc	a2,0xa
c0002fc4:	2b460613          	addi	a2,a2,692 # c000d274 <commands+0x3d8>
c0002fc8:	0ea00593          	li	a1,234
c0002fcc:	0000b517          	auipc	a0,0xb
c0002fd0:	ca450513          	addi	a0,a0,-860 # c000dc70 <commands+0xdd4>
c0002fd4:	a7cfd0ef          	jal	ra,c0000250 <__panic>
c0002fd8:	0000b697          	auipc	a3,0xb
c0002fdc:	d5c68693          	addi	a3,a3,-676 # c000dd34 <commands+0xe98>
c0002fe0:	0000a617          	auipc	a2,0xa
c0002fe4:	29460613          	addi	a2,a2,660 # c000d274 <commands+0x3d8>
c0002fe8:	0d700593          	li	a1,215
c0002fec:	0000b517          	auipc	a0,0xb
c0002ff0:	c8450513          	addi	a0,a0,-892 # c000dc70 <commands+0xdd4>
c0002ff4:	a5cfd0ef          	jal	ra,c0000250 <__panic>
c0002ff8:	0000b697          	auipc	a3,0xb
c0002ffc:	8c068693          	addi	a3,a3,-1856 # c000d8b8 <commands+0xa1c>
c0003000:	0000a617          	auipc	a2,0xa
c0003004:	27460613          	addi	a2,a2,628 # c000d274 <commands+0x3d8>
c0003008:	0cc00593          	li	a1,204
c000300c:	0000b517          	auipc	a0,0xb
c0003010:	c6450513          	addi	a0,a0,-924 # c000dc70 <commands+0xdd4>
c0003014:	a3cfd0ef          	jal	ra,c0000250 <__panic>

c0003018 <swap_init_mm>:
c0003018:	00043797          	auipc	a5,0x43
c000301c:	8f87a783          	lw	a5,-1800(a5) # c0045910 <sm>
c0003020:	0087a303          	lw	t1,8(a5)
c0003024:	00030067          	jr	t1

c0003028 <swap_map_swappable>:
c0003028:	00043797          	auipc	a5,0x43
c000302c:	8e87a783          	lw	a5,-1816(a5) # c0045910 <sm>
c0003030:	0107a303          	lw	t1,16(a5)
c0003034:	00030067          	jr	t1

c0003038 <swap_out>:
c0003038:	fc010113          	addi	sp,sp,-64
c000303c:	03312623          	sw	s3,44(sp)
c0003040:	02112e23          	sw	ra,60(sp)
c0003044:	02812c23          	sw	s0,56(sp)
c0003048:	02912a23          	sw	s1,52(sp)
c000304c:	03212823          	sw	s2,48(sp)
c0003050:	03412423          	sw	s4,40(sp)
c0003054:	03512223          	sw	s5,36(sp)
c0003058:	03612023          	sw	s6,32(sp)
c000305c:	01712e23          	sw	s7,28(sp)
c0003060:	01812c23          	sw	s8,24(sp)
c0003064:	00058993          	mv	s3,a1
c0003068:	10058863          	beqz	a1,c0003178 <swap_out+0x140>
c000306c:	00050913          	mv	s2,a0
c0003070:	00060a13          	mv	s4,a2
c0003074:	00000413          	li	s0,0
c0003078:	0000bb97          	auipc	s7,0xb
c000307c:	edcb8b93          	addi	s7,s7,-292 # c000df54 <commands+0x10b8>
c0003080:	00100b13          	li	s6,1
c0003084:	0000ba97          	auipc	s5,0xb
c0003088:	eb8a8a93          	addi	s5,s5,-328 # c000df3c <commands+0x10a0>
c000308c:	0340006f          	j	c00030c0 <swap_out+0x88>
c0003090:	000a8513          	mv	a0,s5
c0003094:	848fd0ef          	jal	ra,c00000dc <cprintf>
c0003098:	00043797          	auipc	a5,0x43
c000309c:	8787a783          	lw	a5,-1928(a5) # c0045910 <sm>
c00030a0:	0107a783          	lw	a5,16(a5)
c00030a4:	00c12603          	lw	a2,12(sp)
c00030a8:	00000693          	li	a3,0
c00030ac:	00048593          	mv	a1,s1
c00030b0:	00090513          	mv	a0,s2
c00030b4:	00140413          	addi	s0,s0,1
c00030b8:	000780e7          	jalr	a5
c00030bc:	0a898e63          	beq	s3,s0,c0003178 <swap_out+0x140>
c00030c0:	00043797          	auipc	a5,0x43
c00030c4:	8507a783          	lw	a5,-1968(a5) # c0045910 <sm>
c00030c8:	0187a783          	lw	a5,24(a5)
c00030cc:	000a0613          	mv	a2,s4
c00030d0:	00c10593          	addi	a1,sp,12
c00030d4:	00090513          	mv	a0,s2
c00030d8:	000780e7          	jalr	a5
c00030dc:	0c051863          	bnez	a0,c00031ac <swap_out+0x174>
c00030e0:	00c12783          	lw	a5,12(sp)
c00030e4:	00c92503          	lw	a0,12(s2)
c00030e8:	00000613          	li	a2,0
c00030ec:	01c7a483          	lw	s1,28(a5)
c00030f0:	00048593          	mv	a1,s1
c00030f4:	120010ef          	jal	ra,c0004214 <get_pte>
c00030f8:	00052783          	lw	a5,0(a0)
c00030fc:	00050c13          	mv	s8,a0
c0003100:	0017f793          	andi	a5,a5,1
c0003104:	0c078063          	beqz	a5,c00031c4 <swap_out+0x18c>
c0003108:	00c12583          	lw	a1,12(sp)
c000310c:	01c5a503          	lw	a0,28(a1) # 101c <_binary_obj___user_faultread_out_size-0x108c>
c0003110:	00c55513          	srli	a0,a0,0xc
c0003114:	00150513          	addi	a0,a0,1
c0003118:	00851513          	slli	a0,a0,0x8
c000311c:	0cd030ef          	jal	ra,c00069e8 <swapfs_write>
c0003120:	f60518e3          	bnez	a0,c0003090 <swap_out+0x58>
c0003124:	00c12783          	lw	a5,12(sp)
c0003128:	00048613          	mv	a2,s1
c000312c:	00040593          	mv	a1,s0
c0003130:	01c7a683          	lw	a3,28(a5)
c0003134:	000b8513          	mv	a0,s7
c0003138:	00140413          	addi	s0,s0,1
c000313c:	00c6d693          	srli	a3,a3,0xc
c0003140:	00168693          	addi	a3,a3,1
c0003144:	f99fc0ef          	jal	ra,c00000dc <cprintf>
c0003148:	00c12503          	lw	a0,12(sp)
c000314c:	000b0593          	mv	a1,s6
c0003150:	01c52783          	lw	a5,28(a0)
c0003154:	00c7d793          	srli	a5,a5,0xc
c0003158:	00178793          	addi	a5,a5,1
c000315c:	00879793          	slli	a5,a5,0x8
c0003160:	00fc2023          	sw	a5,0(s8)
c0003164:	7f5000ef          	jal	ra,c0004158 <free_pages>
c0003168:	00c92503          	lw	a0,12(s2)
c000316c:	00048593          	mv	a1,s1
c0003170:	2c1010ef          	jal	ra,c0004c30 <tlb_invalidate>
c0003174:	f48996e3          	bne	s3,s0,c00030c0 <swap_out+0x88>
c0003178:	03c12083          	lw	ra,60(sp)
c000317c:	00098513          	mv	a0,s3
c0003180:	03812403          	lw	s0,56(sp)
c0003184:	03412483          	lw	s1,52(sp)
c0003188:	03012903          	lw	s2,48(sp)
c000318c:	02c12983          	lw	s3,44(sp)
c0003190:	02812a03          	lw	s4,40(sp)
c0003194:	02412a83          	lw	s5,36(sp)
c0003198:	02012b03          	lw	s6,32(sp)
c000319c:	01c12b83          	lw	s7,28(sp)
c00031a0:	01812c03          	lw	s8,24(sp)
c00031a4:	04010113          	addi	sp,sp,64
c00031a8:	00008067          	ret
c00031ac:	00040593          	mv	a1,s0
c00031b0:	0000b517          	auipc	a0,0xb
c00031b4:	d4450513          	addi	a0,a0,-700 # c000def4 <commands+0x1058>
c00031b8:	f25fc0ef          	jal	ra,c00000dc <cprintf>
c00031bc:	00040993          	mv	s3,s0
c00031c0:	fb9ff06f          	j	c0003178 <swap_out+0x140>
c00031c4:	0000b697          	auipc	a3,0xb
c00031c8:	d6068693          	addi	a3,a3,-672 # c000df24 <commands+0x1088>
c00031cc:	0000a617          	auipc	a2,0xa
c00031d0:	0a860613          	addi	a2,a2,168 # c000d274 <commands+0x3d8>
c00031d4:	06800593          	li	a1,104
c00031d8:	0000b517          	auipc	a0,0xb
c00031dc:	a9850513          	addi	a0,a0,-1384 # c000dc70 <commands+0xdd4>
c00031e0:	870fd0ef          	jal	ra,c0000250 <__panic>

c00031e4 <swap_in>:
c00031e4:	fe010113          	addi	sp,sp,-32
c00031e8:	01212823          	sw	s2,16(sp)
c00031ec:	00050913          	mv	s2,a0
c00031f0:	00100513          	li	a0,1
c00031f4:	00912a23          	sw	s1,20(sp)
c00031f8:	01312623          	sw	s3,12(sp)
c00031fc:	00112e23          	sw	ra,28(sp)
c0003200:	00812c23          	sw	s0,24(sp)
c0003204:	00058493          	mv	s1,a1
c0003208:	00060993          	mv	s3,a2
c000320c:	699000ef          	jal	ra,c00040a4 <alloc_pages>
c0003210:	06050263          	beqz	a0,c0003274 <swap_in+0x90>
c0003214:	00050413          	mv	s0,a0
c0003218:	00c92503          	lw	a0,12(s2)
c000321c:	00000613          	li	a2,0
c0003220:	00048593          	mv	a1,s1
c0003224:	7f1000ef          	jal	ra,c0004214 <get_pte>
c0003228:	00050913          	mv	s2,a0
c000322c:	00052503          	lw	a0,0(a0)
c0003230:	00040593          	mv	a1,s0
c0003234:	704030ef          	jal	ra,c0006938 <swapfs_read>
c0003238:	00092583          	lw	a1,0(s2)
c000323c:	00048613          	mv	a2,s1
c0003240:	0000b517          	auipc	a0,0xb
c0003244:	9d450513          	addi	a0,a0,-1580 # c000dc14 <commands+0xd78>
c0003248:	0085d593          	srli	a1,a1,0x8
c000324c:	e91fc0ef          	jal	ra,c00000dc <cprintf>
c0003250:	01c12083          	lw	ra,28(sp)
c0003254:	0089a023          	sw	s0,0(s3)
c0003258:	00000513          	li	a0,0
c000325c:	01812403          	lw	s0,24(sp)
c0003260:	01412483          	lw	s1,20(sp)
c0003264:	01012903          	lw	s2,16(sp)
c0003268:	00c12983          	lw	s3,12(sp)
c000326c:	02010113          	addi	sp,sp,32
c0003270:	00008067          	ret
c0003274:	0000b697          	auipc	a3,0xb
c0003278:	99068693          	addi	a3,a3,-1648 # c000dc04 <commands+0xd68>
c000327c:	0000a617          	auipc	a2,0xa
c0003280:	ff860613          	addi	a2,a2,-8 # c000d274 <commands+0x3d8>
c0003284:	07e00593          	li	a1,126
c0003288:	0000b517          	auipc	a0,0xb
c000328c:	9e850513          	addi	a0,a0,-1560 # c000dc70 <commands+0xdd4>
c0003290:	fc1fc0ef          	jal	ra,c0000250 <__panic>

c0003294 <default_init>:
c0003294:	00042797          	auipc	a5,0x42
c0003298:	75c78793          	addi	a5,a5,1884 # c00459f0 <free_area>
c000329c:	00f7a223          	sw	a5,4(a5)
c00032a0:	00f7a023          	sw	a5,0(a5)
c00032a4:	0007a423          	sw	zero,8(a5)
c00032a8:	00008067          	ret

c00032ac <default_nr_free_pages>:
c00032ac:	00042517          	auipc	a0,0x42
c00032b0:	74c52503          	lw	a0,1868(a0) # c00459f8 <free_area+0x8>
c00032b4:	00008067          	ret

c00032b8 <default_free_pages>:
c00032b8:	ff010113          	addi	sp,sp,-16
c00032bc:	00112623          	sw	ra,12(sp)
c00032c0:	1e058e63          	beqz	a1,c00034bc <default_free_pages+0x204>
c00032c4:	00559693          	slli	a3,a1,0x5
c00032c8:	00d506b3          	add	a3,a0,a3
c00032cc:	04d50863          	beq	a0,a3,c000331c <default_free_pages+0x64>
c00032d0:	00452783          	lw	a5,4(a0)
c00032d4:	0017f793          	andi	a5,a5,1
c00032d8:	1c079263          	bnez	a5,c000349c <default_free_pages+0x1e4>
c00032dc:	00452783          	lw	a5,4(a0)
c00032e0:	0017d793          	srli	a5,a5,0x1
c00032e4:	0017f793          	andi	a5,a5,1
c00032e8:	1a079a63          	bnez	a5,c000349c <default_free_pages+0x1e4>
c00032ec:	00050793          	mv	a5,a0
c00032f0:	01c0006f          	j	c000330c <default_free_pages+0x54>
c00032f4:	0047a703          	lw	a4,4(a5)
c00032f8:	00177713          	andi	a4,a4,1
c00032fc:	1a071063          	bnez	a4,c000349c <default_free_pages+0x1e4>
c0003300:	0047a703          	lw	a4,4(a5)
c0003304:	00277713          	andi	a4,a4,2
c0003308:	18071a63          	bnez	a4,c000349c <default_free_pages+0x1e4>
c000330c:	0007a223          	sw	zero,4(a5)
c0003310:	0007a023          	sw	zero,0(a5)
c0003314:	02078793          	addi	a5,a5,32
c0003318:	fcd79ee3          	bne	a5,a3,c00032f4 <default_free_pages+0x3c>
c000331c:	00b52423          	sw	a1,8(a0)
c0003320:	00450313          	addi	t1,a0,4
c0003324:	00200793          	li	a5,2
c0003328:	40f3202f          	amoor.w	zero,a5,(t1)
c000332c:	00042797          	auipc	a5,0x42
c0003330:	6cc7a783          	lw	a5,1740(a5) # c00459f8 <free_area+0x8>
c0003334:	00b785b3          	add	a1,a5,a1
c0003338:	00042697          	auipc	a3,0x42
c000333c:	6b868693          	addi	a3,a3,1720 # c00459f0 <free_area>
c0003340:	00b6a423          	sw	a1,8(a3)
c0003344:	00042797          	auipc	a5,0x42
c0003348:	6b07a783          	lw	a5,1712(a5) # c00459f4 <free_area+0x4>
c000334c:	12d78863          	beq	a5,a3,c000347c <default_free_pages+0x1c4>
c0003350:	00042597          	auipc	a1,0x42
c0003354:	6a05a583          	lw	a1,1696(a1) # c00459f0 <free_area>
c0003358:	00000813          	li	a6,0
c000335c:	00c50613          	addi	a2,a0,12
c0003360:	00100893          	li	a7,1
c0003364:	0080006f          	j	c000336c <default_free_pages+0xb4>
c0003368:	00070793          	mv	a5,a4
c000336c:	ff478713          	addi	a4,a5,-12
c0003370:	02e56863          	bltu	a0,a4,c00033a0 <default_free_pages+0xe8>
c0003374:	0047a703          	lw	a4,4(a5)
c0003378:	fed718e3          	bne	a4,a3,c0003368 <default_free_pages+0xb0>
c000337c:	00c7a223          	sw	a2,4(a5)
c0003380:	00d52823          	sw	a3,16(a0)
c0003384:	00f52623          	sw	a5,12(a0)
c0003388:	0047a783          	lw	a5,4(a5)
c000338c:	00060593          	mv	a1,a2
c0003390:	06d78863          	beq	a5,a3,c0003400 <default_free_pages+0x148>
c0003394:	ff478713          	addi	a4,a5,-12
c0003398:	00088813          	mv	a6,a7
c000339c:	fce57ce3          	bleu	a4,a0,c0003374 <default_free_pages+0xbc>
c00033a0:	12081e63          	bnez	a6,c00034dc <default_free_pages+0x224>
c00033a4:	0007a583          	lw	a1,0(a5)
c00033a8:	00c7a023          	sw	a2,0(a5)
c00033ac:	00c5a223          	sw	a2,4(a1)
c00033b0:	00f52823          	sw	a5,16(a0)
c00033b4:	00b52623          	sw	a1,12(a0)
c00033b8:	06d58a63          	beq	a1,a3,c000342c <default_free_pages+0x174>
c00033bc:	ffc5a603          	lw	a2,-4(a1)
c00033c0:	ff458713          	addi	a4,a1,-12
c00033c4:	00561793          	slli	a5,a2,0x5
c00033c8:	00f707b3          	add	a5,a4,a5
c00033cc:	04f51a63          	bne	a0,a5,c0003420 <default_free_pages+0x168>
c00033d0:	00852783          	lw	a5,8(a0)
c00033d4:	00c78633          	add	a2,a5,a2
c00033d8:	fec5ae23          	sw	a2,-4(a1)
c00033dc:	ffd00793          	li	a5,-3
c00033e0:	60f3202f          	amoand.w	zero,a5,(t1)
c00033e4:	00c52803          	lw	a6,12(a0)
c00033e8:	01052603          	lw	a2,16(a0)
c00033ec:	00070513          	mv	a0,a4
c00033f0:	00c82223          	sw	a2,4(a6) # fffff004 <sbi_remote_fence_i+0xfffff714>
c00033f4:	0045a783          	lw	a5,4(a1)
c00033f8:	01062023          	sw	a6,0(a2)
c00033fc:	0280006f          	j	c0003424 <default_free_pages+0x16c>
c0003400:	00c52583          	lw	a1,12(a0)
c0003404:	00c7a023          	sw	a2,0(a5)
c0003408:	00f58e63          	beq	a1,a5,c0003424 <default_free_pages+0x16c>
c000340c:	ffc5a603          	lw	a2,-4(a1)
c0003410:	ff458713          	addi	a4,a1,-12
c0003414:	00561793          	slli	a5,a2,0x5
c0003418:	00f707b3          	add	a5,a4,a5
c000341c:	faf50ae3          	beq	a0,a5,c00033d0 <default_free_pages+0x118>
c0003420:	01052783          	lw	a5,16(a0)
c0003424:	ff478713          	addi	a4,a5,-12
c0003428:	00d78a63          	beq	a5,a3,c000343c <default_free_pages+0x184>
c000342c:	00852603          	lw	a2,8(a0)
c0003430:	00561693          	slli	a3,a2,0x5
c0003434:	00d506b3          	add	a3,a0,a3
c0003438:	00d70863          	beq	a4,a3,c0003448 <default_free_pages+0x190>
c000343c:	00c12083          	lw	ra,12(sp)
c0003440:	01010113          	addi	sp,sp,16
c0003444:	00008067          	ret
c0003448:	ffc7a703          	lw	a4,-4(a5)
c000344c:	ff878693          	addi	a3,a5,-8
c0003450:	00c70633          	add	a2,a4,a2
c0003454:	00c52423          	sw	a2,8(a0)
c0003458:	ffd00713          	li	a4,-3
c000345c:	60e6a02f          	amoand.w	zero,a4,(a3)
c0003460:	0007a703          	lw	a4,0(a5)
c0003464:	0047a783          	lw	a5,4(a5)
c0003468:	00c12083          	lw	ra,12(sp)
c000346c:	01010113          	addi	sp,sp,16
c0003470:	00f72223          	sw	a5,4(a4)
c0003474:	00e7a023          	sw	a4,0(a5)
c0003478:	00008067          	ret
c000347c:	00c12083          	lw	ra,12(sp)
c0003480:	00c50713          	addi	a4,a0,12
c0003484:	00e7a023          	sw	a4,0(a5)
c0003488:	00e7a223          	sw	a4,4(a5)
c000348c:	00f52823          	sw	a5,16(a0)
c0003490:	00f52623          	sw	a5,12(a0)
c0003494:	01010113          	addi	sp,sp,16
c0003498:	00008067          	ret
c000349c:	0000b697          	auipc	a3,0xb
c00034a0:	dc468693          	addi	a3,a3,-572 # c000e260 <commands+0x13c4>
c00034a4:	0000a617          	auipc	a2,0xa
c00034a8:	dd060613          	addi	a2,a2,-560 # c000d274 <commands+0x3d8>
c00034ac:	08300593          	li	a1,131
c00034b0:	0000b517          	auipc	a0,0xb
c00034b4:	dd850513          	addi	a0,a0,-552 # c000e288 <commands+0x13ec>
c00034b8:	d99fc0ef          	jal	ra,c0000250 <__panic>
c00034bc:	0000b697          	auipc	a3,0xb
c00034c0:	de468693          	addi	a3,a3,-540 # c000e2a0 <commands+0x1404>
c00034c4:	0000a617          	auipc	a2,0xa
c00034c8:	db060613          	addi	a2,a2,-592 # c000d274 <commands+0x3d8>
c00034cc:	08000593          	li	a1,128
c00034d0:	0000b517          	auipc	a0,0xb
c00034d4:	db850513          	addi	a0,a0,-584 # c000e288 <commands+0x13ec>
c00034d8:	d79fc0ef          	jal	ra,c0000250 <__panic>
c00034dc:	00b6a023          	sw	a1,0(a3)
c00034e0:	ec5ff06f          	j	c00033a4 <default_free_pages+0xec>

c00034e4 <default_init_memmap>:
c00034e4:	ff010113          	addi	sp,sp,-16
c00034e8:	00112623          	sw	ra,12(sp)
c00034ec:	12058e63          	beqz	a1,c0003628 <default_init_memmap+0x144>
c00034f0:	00559693          	slli	a3,a1,0x5
c00034f4:	00d506b3          	add	a3,a0,a3
c00034f8:	02d50c63          	beq	a0,a3,c0003530 <default_init_memmap+0x4c>
c00034fc:	00452703          	lw	a4,4(a0)
c0003500:	00050793          	mv	a5,a0
c0003504:	00177713          	andi	a4,a4,1
c0003508:	00071a63          	bnez	a4,c000351c <default_init_memmap+0x38>
c000350c:	0fc0006f          	j	c0003608 <default_init_memmap+0x124>
c0003510:	0047a703          	lw	a4,4(a5)
c0003514:	00177713          	andi	a4,a4,1
c0003518:	0e070863          	beqz	a4,c0003608 <default_init_memmap+0x124>
c000351c:	0007a423          	sw	zero,8(a5)
c0003520:	0007a223          	sw	zero,4(a5)
c0003524:	0007a023          	sw	zero,0(a5)
c0003528:	02078793          	addi	a5,a5,32
c000352c:	fed792e3          	bne	a5,a3,c0003510 <default_init_memmap+0x2c>
c0003530:	00b52423          	sw	a1,8(a0)
c0003534:	00200793          	li	a5,2
c0003538:	00450713          	addi	a4,a0,4
c000353c:	40f7202f          	amoor.w	zero,a5,(a4)
c0003540:	00042797          	auipc	a5,0x42
c0003544:	4b87a783          	lw	a5,1208(a5) # c00459f8 <free_area+0x8>
c0003548:	00b785b3          	add	a1,a5,a1
c000354c:	00042697          	auipc	a3,0x42
c0003550:	4a468693          	addi	a3,a3,1188 # c00459f0 <free_area>
c0003554:	00b6a423          	sw	a1,8(a3)
c0003558:	00042797          	auipc	a5,0x42
c000355c:	49c7a783          	lw	a5,1180(a5) # c00459f4 <free_area+0x4>
c0003560:	08d78463          	beq	a5,a3,c00035e8 <default_init_memmap+0x104>
c0003564:	00042597          	auipc	a1,0x42
c0003568:	48c5a583          	lw	a1,1164(a1) # c00459f0 <free_area>
c000356c:	00000813          	li	a6,0
c0003570:	00c50613          	addi	a2,a0,12
c0003574:	00100893          	li	a7,1
c0003578:	0080006f          	j	c0003580 <default_init_memmap+0x9c>
c000357c:	00070793          	mv	a5,a4
c0003580:	ff478713          	addi	a4,a5,-12
c0003584:	02e56863          	bltu	a0,a4,c00035b4 <default_init_memmap+0xd0>
c0003588:	0047a703          	lw	a4,4(a5)
c000358c:	fed718e3          	bne	a4,a3,c000357c <default_init_memmap+0x98>
c0003590:	00c7a223          	sw	a2,4(a5)
c0003594:	00d52823          	sw	a3,16(a0)
c0003598:	00f52623          	sw	a5,12(a0)
c000359c:	0047a783          	lw	a5,4(a5)
c00035a0:	00060593          	mv	a1,a2
c00035a4:	02d78a63          	beq	a5,a3,c00035d8 <default_init_memmap+0xf4>
c00035a8:	ff478713          	addi	a4,a5,-12
c00035ac:	00088813          	mv	a6,a7
c00035b0:	fce57ce3          	bleu	a4,a0,c0003588 <default_init_memmap+0xa4>
c00035b4:	08081a63          	bnez	a6,c0003648 <default_init_memmap+0x164>
c00035b8:	0007a703          	lw	a4,0(a5)
c00035bc:	00c12083          	lw	ra,12(sp)
c00035c0:	00c7a023          	sw	a2,0(a5)
c00035c4:	00c72223          	sw	a2,4(a4)
c00035c8:	00f52823          	sw	a5,16(a0)
c00035cc:	00e52623          	sw	a4,12(a0)
c00035d0:	01010113          	addi	sp,sp,16
c00035d4:	00008067          	ret
c00035d8:	00c12083          	lw	ra,12(sp)
c00035dc:	00c7a023          	sw	a2,0(a5)
c00035e0:	01010113          	addi	sp,sp,16
c00035e4:	00008067          	ret
c00035e8:	00c12083          	lw	ra,12(sp)
c00035ec:	00c50713          	addi	a4,a0,12
c00035f0:	00e7a023          	sw	a4,0(a5)
c00035f4:	00e7a223          	sw	a4,4(a5)
c00035f8:	00f52823          	sw	a5,16(a0)
c00035fc:	00f52623          	sw	a5,12(a0)
c0003600:	01010113          	addi	sp,sp,16
c0003604:	00008067          	ret
c0003608:	0000b697          	auipc	a3,0xb
c000360c:	ca068693          	addi	a3,a3,-864 # c000e2a8 <commands+0x140c>
c0003610:	0000a617          	auipc	a2,0xa
c0003614:	c6460613          	addi	a2,a2,-924 # c000d274 <commands+0x3d8>
c0003618:	04900593          	li	a1,73
c000361c:	0000b517          	auipc	a0,0xb
c0003620:	c6c50513          	addi	a0,a0,-916 # c000e288 <commands+0x13ec>
c0003624:	c2dfc0ef          	jal	ra,c0000250 <__panic>
c0003628:	0000b697          	auipc	a3,0xb
c000362c:	c7868693          	addi	a3,a3,-904 # c000e2a0 <commands+0x1404>
c0003630:	0000a617          	auipc	a2,0xa
c0003634:	c4460613          	addi	a2,a2,-956 # c000d274 <commands+0x3d8>
c0003638:	04600593          	li	a1,70
c000363c:	0000b517          	auipc	a0,0xb
c0003640:	c4c50513          	addi	a0,a0,-948 # c000e288 <commands+0x13ec>
c0003644:	c0dfc0ef          	jal	ra,c0000250 <__panic>
c0003648:	00b6a023          	sw	a1,0(a3)
c000364c:	f6dff06f          	j	c00035b8 <default_init_memmap+0xd4>

c0003650 <default_check>:
c0003650:	fd010113          	addi	sp,sp,-48
c0003654:	03212023          	sw	s2,32(sp)
c0003658:	02112623          	sw	ra,44(sp)
c000365c:	02812423          	sw	s0,40(sp)
c0003660:	02912223          	sw	s1,36(sp)
c0003664:	01312e23          	sw	s3,28(sp)
c0003668:	01412c23          	sw	s4,24(sp)
c000366c:	01512a23          	sw	s5,20(sp)
c0003670:	01612823          	sw	s6,16(sp)
c0003674:	01712623          	sw	s7,12(sp)
c0003678:	01812423          	sw	s8,8(sp)
c000367c:	01912223          	sw	s9,4(sp)
c0003680:	00042917          	auipc	s2,0x42
c0003684:	37090913          	addi	s2,s2,880 # c00459f0 <free_area>
c0003688:	00042797          	auipc	a5,0x42
c000368c:	36c7a783          	lw	a5,876(a5) # c00459f4 <free_area+0x4>
c0003690:	3d278663          	beq	a5,s2,c0003a5c <default_check+0x40c>
c0003694:	ff87a703          	lw	a4,-8(a5)
c0003698:	00175713          	srli	a4,a4,0x1
c000369c:	00177713          	andi	a4,a4,1
c00036a0:	3c070663          	beqz	a4,c0003a6c <default_check+0x41c>
c00036a4:	00000413          	li	s0,0
c00036a8:	00000493          	li	s1,0
c00036ac:	0100006f          	j	c00036bc <default_check+0x6c>
c00036b0:	ff87a703          	lw	a4,-8(a5)
c00036b4:	00277713          	andi	a4,a4,2
c00036b8:	3a070a63          	beqz	a4,c0003a6c <default_check+0x41c>
c00036bc:	ffc7a703          	lw	a4,-4(a5)
c00036c0:	0047a783          	lw	a5,4(a5)
c00036c4:	00148493          	addi	s1,s1,1
c00036c8:	00e40433          	add	s0,s0,a4
c00036cc:	00040993          	mv	s3,s0
c00036d0:	ff2790e3          	bne	a5,s2,c00036b0 <default_check+0x60>
c00036d4:	2e9000ef          	jal	ra,c00041bc <nr_free_pages>
c00036d8:	7ca99a63          	bne	s3,a0,c0003eac <default_check+0x85c>
c00036dc:	00100513          	li	a0,1
c00036e0:	1c5000ef          	jal	ra,c00040a4 <alloc_pages>
c00036e4:	00050a13          	mv	s4,a0
c00036e8:	000502e3          	beqz	a0,c0003eec <default_check+0x89c>
c00036ec:	00100513          	li	a0,1
c00036f0:	1b5000ef          	jal	ra,c00040a4 <alloc_pages>
c00036f4:	00050993          	mv	s3,a0
c00036f8:	7c050a63          	beqz	a0,c0003ecc <default_check+0x87c>
c00036fc:	00100513          	li	a0,1
c0003700:	1a5000ef          	jal	ra,c00040a4 <alloc_pages>
c0003704:	00050a93          	mv	s5,a0
c0003708:	56050263          	beqz	a0,c0003c6c <default_check+0x61c>
c000370c:	3b3a0063          	beq	s4,s3,c0003aac <default_check+0x45c>
c0003710:	38aa0e63          	beq	s4,a0,c0003aac <default_check+0x45c>
c0003714:	38a98c63          	beq	s3,a0,c0003aac <default_check+0x45c>
c0003718:	000a2783          	lw	a5,0(s4)
c000371c:	36079863          	bnez	a5,c0003a8c <default_check+0x43c>
c0003720:	0009a783          	lw	a5,0(s3)
c0003724:	36079463          	bnez	a5,c0003a8c <default_check+0x43c>
c0003728:	00052783          	lw	a5,0(a0)
c000372c:	36079063          	bnez	a5,c0003a8c <default_check+0x43c>
c0003730:	00042797          	auipc	a5,0x42
c0003734:	2d87a783          	lw	a5,728(a5) # c0045a08 <pages>
c0003738:	40fa0733          	sub	a4,s4,a5
c000373c:	00039617          	auipc	a2,0x39
c0003740:	d9862603          	lw	a2,-616(a2) # c003c4d4 <nbase>
c0003744:	40575713          	srai	a4,a4,0x5
c0003748:	00c70733          	add	a4,a4,a2
c000374c:	00042697          	auipc	a3,0x42
c0003750:	1d06a683          	lw	a3,464(a3) # c004591c <npage>
c0003754:	00c69693          	slli	a3,a3,0xc
c0003758:	00c71713          	slli	a4,a4,0xc
c000375c:	48d77863          	bleu	a3,a4,c0003bec <default_check+0x59c>
c0003760:	40f98733          	sub	a4,s3,a5
c0003764:	40575713          	srai	a4,a4,0x5
c0003768:	00c70733          	add	a4,a4,a2
c000376c:	00c71713          	slli	a4,a4,0xc
c0003770:	3ed77e63          	bleu	a3,a4,c0003b6c <default_check+0x51c>
c0003774:	40f507b3          	sub	a5,a0,a5
c0003778:	4057d793          	srai	a5,a5,0x5
c000377c:	00c787b3          	add	a5,a5,a2
c0003780:	00c79793          	slli	a5,a5,0xc
c0003784:	3cd7f463          	bleu	a3,a5,c0003b4c <default_check+0x4fc>
c0003788:	00100513          	li	a0,1
c000378c:	00042c17          	auipc	s8,0x42
c0003790:	264c2c03          	lw	s8,612(s8) # c00459f0 <free_area>
c0003794:	00042b97          	auipc	s7,0x42
c0003798:	260bab83          	lw	s7,608(s7) # c00459f4 <free_area+0x4>
c000379c:	00042b17          	auipc	s6,0x42
c00037a0:	25cb2b03          	lw	s6,604(s6) # c00459f8 <free_area+0x8>
c00037a4:	01292223          	sw	s2,4(s2)
c00037a8:	01292023          	sw	s2,0(s2)
c00037ac:	00092423          	sw	zero,8(s2)
c00037b0:	0f5000ef          	jal	ra,c00040a4 <alloc_pages>
c00037b4:	36051c63          	bnez	a0,c0003b2c <default_check+0x4dc>
c00037b8:	00100593          	li	a1,1
c00037bc:	000a0513          	mv	a0,s4
c00037c0:	199000ef          	jal	ra,c0004158 <free_pages>
c00037c4:	00100593          	li	a1,1
c00037c8:	00098513          	mv	a0,s3
c00037cc:	18d000ef          	jal	ra,c0004158 <free_pages>
c00037d0:	00100593          	li	a1,1
c00037d4:	000a8513          	mv	a0,s5
c00037d8:	181000ef          	jal	ra,c0004158 <free_pages>
c00037dc:	00042717          	auipc	a4,0x42
c00037e0:	21c72703          	lw	a4,540(a4) # c00459f8 <free_area+0x8>
c00037e4:	00300793          	li	a5,3
c00037e8:	32f71263          	bne	a4,a5,c0003b0c <default_check+0x4bc>
c00037ec:	00100513          	li	a0,1
c00037f0:	0b5000ef          	jal	ra,c00040a4 <alloc_pages>
c00037f4:	00050993          	mv	s3,a0
c00037f8:	2c050a63          	beqz	a0,c0003acc <default_check+0x47c>
c00037fc:	00100513          	li	a0,1
c0003800:	0a5000ef          	jal	ra,c00040a4 <alloc_pages>
c0003804:	00050a93          	mv	s5,a0
c0003808:	44050263          	beqz	a0,c0003c4c <default_check+0x5fc>
c000380c:	00100513          	li	a0,1
c0003810:	095000ef          	jal	ra,c00040a4 <alloc_pages>
c0003814:	00050a13          	mv	s4,a0
c0003818:	40050a63          	beqz	a0,c0003c2c <default_check+0x5dc>
c000381c:	00100513          	li	a0,1
c0003820:	085000ef          	jal	ra,c00040a4 <alloc_pages>
c0003824:	3e051463          	bnez	a0,c0003c0c <default_check+0x5bc>
c0003828:	00100593          	li	a1,1
c000382c:	00098513          	mv	a0,s3
c0003830:	129000ef          	jal	ra,c0004158 <free_pages>
c0003834:	00042797          	auipc	a5,0x42
c0003838:	1c07a783          	lw	a5,448(a5) # c00459f4 <free_area+0x4>
c000383c:	2b278863          	beq	a5,s2,c0003aec <default_check+0x49c>
c0003840:	00100513          	li	a0,1
c0003844:	061000ef          	jal	ra,c00040a4 <alloc_pages>
c0003848:	38a99263          	bne	s3,a0,c0003bcc <default_check+0x57c>
c000384c:	00100513          	li	a0,1
c0003850:	055000ef          	jal	ra,c00040a4 <alloc_pages>
c0003854:	34051c63          	bnez	a0,c0003bac <default_check+0x55c>
c0003858:	00042797          	auipc	a5,0x42
c000385c:	1a07a783          	lw	a5,416(a5) # c00459f8 <free_area+0x8>
c0003860:	32079663          	bnez	a5,c0003b8c <default_check+0x53c>
c0003864:	00098513          	mv	a0,s3
c0003868:	00100593          	li	a1,1
c000386c:	01892023          	sw	s8,0(s2)
c0003870:	01792223          	sw	s7,4(s2)
c0003874:	01692423          	sw	s6,8(s2)
c0003878:	0e1000ef          	jal	ra,c0004158 <free_pages>
c000387c:	00100593          	li	a1,1
c0003880:	000a8513          	mv	a0,s5
c0003884:	0d5000ef          	jal	ra,c0004158 <free_pages>
c0003888:	00100593          	li	a1,1
c000388c:	000a0513          	mv	a0,s4
c0003890:	0c9000ef          	jal	ra,c0004158 <free_pages>
c0003894:	00500513          	li	a0,5
c0003898:	00d000ef          	jal	ra,c00040a4 <alloc_pages>
c000389c:	00050993          	mv	s3,a0
c00038a0:	44050663          	beqz	a0,c0003cec <default_check+0x69c>
c00038a4:	00452783          	lw	a5,4(a0)
c00038a8:	0017d793          	srli	a5,a5,0x1
c00038ac:	0017f793          	andi	a5,a5,1
c00038b0:	58079e63          	bnez	a5,c0003e4c <default_check+0x7fc>
c00038b4:	00100513          	li	a0,1
c00038b8:	00042b97          	auipc	s7,0x42
c00038bc:	138bab83          	lw	s7,312(s7) # c00459f0 <free_area>
c00038c0:	00042b17          	auipc	s6,0x42
c00038c4:	134b2b03          	lw	s6,308(s6) # c00459f4 <free_area+0x4>
c00038c8:	01292023          	sw	s2,0(s2)
c00038cc:	01292223          	sw	s2,4(s2)
c00038d0:	7d4000ef          	jal	ra,c00040a4 <alloc_pages>
c00038d4:	54051c63          	bnez	a0,c0003e2c <default_check+0x7dc>
c00038d8:	04098a93          	addi	s5,s3,64
c00038dc:	000a8513          	mv	a0,s5
c00038e0:	00300593          	li	a1,3
c00038e4:	00042c17          	auipc	s8,0x42
c00038e8:	114c2c03          	lw	s8,276(s8) # c00459f8 <free_area+0x8>
c00038ec:	00092423          	sw	zero,8(s2)
c00038f0:	069000ef          	jal	ra,c0004158 <free_pages>
c00038f4:	00400513          	li	a0,4
c00038f8:	7ac000ef          	jal	ra,c00040a4 <alloc_pages>
c00038fc:	50051863          	bnez	a0,c0003e0c <default_check+0x7bc>
c0003900:	0449a783          	lw	a5,68(s3)
c0003904:	0017d793          	srli	a5,a5,0x1
c0003908:	0017f793          	andi	a5,a5,1
c000390c:	4e078063          	beqz	a5,c0003dec <default_check+0x79c>
c0003910:	0489a503          	lw	a0,72(s3)
c0003914:	00300793          	li	a5,3
c0003918:	4cf51a63          	bne	a0,a5,c0003dec <default_check+0x79c>
c000391c:	788000ef          	jal	ra,c00040a4 <alloc_pages>
c0003920:	00050a13          	mv	s4,a0
c0003924:	4a050463          	beqz	a0,c0003dcc <default_check+0x77c>
c0003928:	00100513          	li	a0,1
c000392c:	778000ef          	jal	ra,c00040a4 <alloc_pages>
c0003930:	46051e63          	bnez	a0,c0003dac <default_check+0x75c>
c0003934:	454a9c63          	bne	s5,s4,c0003d8c <default_check+0x73c>
c0003938:	00100593          	li	a1,1
c000393c:	00098513          	mv	a0,s3
c0003940:	019000ef          	jal	ra,c0004158 <free_pages>
c0003944:	00300593          	li	a1,3
c0003948:	000a8513          	mv	a0,s5
c000394c:	00d000ef          	jal	ra,c0004158 <free_pages>
c0003950:	0049a783          	lw	a5,4(s3)
c0003954:	02098c93          	addi	s9,s3,32
c0003958:	0017d793          	srli	a5,a5,0x1
c000395c:	0017f793          	andi	a5,a5,1
c0003960:	40078663          	beqz	a5,c0003d6c <default_check+0x71c>
c0003964:	0089aa03          	lw	s4,8(s3)
c0003968:	00100793          	li	a5,1
c000396c:	40fa1063          	bne	s4,a5,c0003d6c <default_check+0x71c>
c0003970:	0449a783          	lw	a5,68(s3)
c0003974:	0017d793          	srli	a5,a5,0x1
c0003978:	0017f793          	andi	a5,a5,1
c000397c:	3c078863          	beqz	a5,c0003d4c <default_check+0x6fc>
c0003980:	0489a703          	lw	a4,72(s3)
c0003984:	00300793          	li	a5,3
c0003988:	3cf71263          	bne	a4,a5,c0003d4c <default_check+0x6fc>
c000398c:	000a0513          	mv	a0,s4
c0003990:	714000ef          	jal	ra,c00040a4 <alloc_pages>
c0003994:	38a99c63          	bne	s3,a0,c0003d2c <default_check+0x6dc>
c0003998:	000a0593          	mv	a1,s4
c000399c:	7bc000ef          	jal	ra,c0004158 <free_pages>
c00039a0:	00200513          	li	a0,2
c00039a4:	700000ef          	jal	ra,c00040a4 <alloc_pages>
c00039a8:	36aa9263          	bne	s5,a0,c0003d0c <default_check+0x6bc>
c00039ac:	00200593          	li	a1,2
c00039b0:	7a8000ef          	jal	ra,c0004158 <free_pages>
c00039b4:	000a0593          	mv	a1,s4
c00039b8:	000c8513          	mv	a0,s9
c00039bc:	79c000ef          	jal	ra,c0004158 <free_pages>
c00039c0:	00500513          	li	a0,5
c00039c4:	6e0000ef          	jal	ra,c00040a4 <alloc_pages>
c00039c8:	00050993          	mv	s3,a0
c00039cc:	4a050063          	beqz	a0,c0003e6c <default_check+0x81c>
c00039d0:	000a0513          	mv	a0,s4
c00039d4:	6d0000ef          	jal	ra,c00040a4 <alloc_pages>
c00039d8:	2e051a63          	bnez	a0,c0003ccc <default_check+0x67c>
c00039dc:	00042797          	auipc	a5,0x42
c00039e0:	01c7a783          	lw	a5,28(a5) # c00459f8 <free_area+0x8>
c00039e4:	2c079463          	bnez	a5,c0003cac <default_check+0x65c>
c00039e8:	00500593          	li	a1,5
c00039ec:	00098513          	mv	a0,s3
c00039f0:	01892423          	sw	s8,8(s2)
c00039f4:	01792023          	sw	s7,0(s2)
c00039f8:	01692223          	sw	s6,4(s2)
c00039fc:	75c000ef          	jal	ra,c0004158 <free_pages>
c0003a00:	00042797          	auipc	a5,0x42
c0003a04:	ff47a783          	lw	a5,-12(a5) # c00459f4 <free_area+0x4>
c0003a08:	01278c63          	beq	a5,s2,c0003a20 <default_check+0x3d0>
c0003a0c:	ffc7a703          	lw	a4,-4(a5)
c0003a10:	0047a783          	lw	a5,4(a5)
c0003a14:	fff48493          	addi	s1,s1,-1
c0003a18:	40e40433          	sub	s0,s0,a4
c0003a1c:	ff2798e3          	bne	a5,s2,c0003a0c <default_check+0x3bc>
c0003a20:	26049663          	bnez	s1,c0003c8c <default_check+0x63c>
c0003a24:	46041463          	bnez	s0,c0003e8c <default_check+0x83c>
c0003a28:	02c12083          	lw	ra,44(sp)
c0003a2c:	02812403          	lw	s0,40(sp)
c0003a30:	02412483          	lw	s1,36(sp)
c0003a34:	02012903          	lw	s2,32(sp)
c0003a38:	01c12983          	lw	s3,28(sp)
c0003a3c:	01812a03          	lw	s4,24(sp)
c0003a40:	01412a83          	lw	s5,20(sp)
c0003a44:	01012b03          	lw	s6,16(sp)
c0003a48:	00c12b83          	lw	s7,12(sp)
c0003a4c:	00812c03          	lw	s8,8(sp)
c0003a50:	00412c83          	lw	s9,4(sp)
c0003a54:	03010113          	addi	sp,sp,48
c0003a58:	00008067          	ret
c0003a5c:	00000993          	li	s3,0
c0003a60:	00000413          	li	s0,0
c0003a64:	00000493          	li	s1,0
c0003a68:	c6dff06f          	j	c00036d4 <default_check+0x84>
c0003a6c:	0000a697          	auipc	a3,0xa
c0003a70:	22868693          	addi	a3,a3,552 # c000dc94 <commands+0xdf8>
c0003a74:	0000a617          	auipc	a2,0xa
c0003a78:	80060613          	addi	a2,a2,-2048 # c000d274 <commands+0x3d8>
c0003a7c:	0f000593          	li	a1,240
c0003a80:	0000b517          	auipc	a0,0xb
c0003a84:	80850513          	addi	a0,a0,-2040 # c000e288 <commands+0x13ec>
c0003a88:	fc8fc0ef          	jal	ra,c0000250 <__panic>
c0003a8c:	0000a697          	auipc	a3,0xa
c0003a90:	58068693          	addi	a3,a3,1408 # c000e00c <commands+0x1170>
c0003a94:	00009617          	auipc	a2,0x9
c0003a98:	7e060613          	addi	a2,a2,2016 # c000d274 <commands+0x3d8>
c0003a9c:	0be00593          	li	a1,190
c0003aa0:	0000a517          	auipc	a0,0xa
c0003aa4:	7e850513          	addi	a0,a0,2024 # c000e288 <commands+0x13ec>
c0003aa8:	fa8fc0ef          	jal	ra,c0000250 <__panic>
c0003aac:	0000a697          	auipc	a3,0xa
c0003ab0:	53c68693          	addi	a3,a3,1340 # c000dfe8 <commands+0x114c>
c0003ab4:	00009617          	auipc	a2,0x9
c0003ab8:	7c060613          	addi	a2,a2,1984 # c000d274 <commands+0x3d8>
c0003abc:	0bd00593          	li	a1,189
c0003ac0:	0000a517          	auipc	a0,0xa
c0003ac4:	7c850513          	addi	a0,a0,1992 # c000e288 <commands+0x13ec>
c0003ac8:	f88fc0ef          	jal	ra,c0000250 <__panic>
c0003acc:	0000a697          	auipc	a3,0xa
c0003ad0:	4c868693          	addi	a3,a3,1224 # c000df94 <commands+0x10f8>
c0003ad4:	00009617          	auipc	a2,0x9
c0003ad8:	7a060613          	addi	a2,a2,1952 # c000d274 <commands+0x3d8>
c0003adc:	0d200593          	li	a1,210
c0003ae0:	0000a517          	auipc	a0,0xa
c0003ae4:	7a850513          	addi	a0,a0,1960 # c000e288 <commands+0x13ec>
c0003ae8:	f68fc0ef          	jal	ra,c0000250 <__panic>
c0003aec:	0000a697          	auipc	a3,0xa
c0003af0:	5e468693          	addi	a3,a3,1508 # c000e0d0 <commands+0x1234>
c0003af4:	00009617          	auipc	a2,0x9
c0003af8:	78060613          	addi	a2,a2,1920 # c000d274 <commands+0x3d8>
c0003afc:	0d900593          	li	a1,217
c0003b00:	0000a517          	auipc	a0,0xa
c0003b04:	78850513          	addi	a0,a0,1928 # c000e288 <commands+0x13ec>
c0003b08:	f48fc0ef          	jal	ra,c0000250 <__panic>
c0003b0c:	0000a697          	auipc	a3,0xa
c0003b10:	5b468693          	addi	a3,a3,1460 # c000e0c0 <commands+0x1224>
c0003b14:	00009617          	auipc	a2,0x9
c0003b18:	76060613          	addi	a2,a2,1888 # c000d274 <commands+0x3d8>
c0003b1c:	0d000593          	li	a1,208
c0003b20:	0000a517          	auipc	a0,0xa
c0003b24:	76850513          	addi	a0,a0,1896 # c000e288 <commands+0x13ec>
c0003b28:	f28fc0ef          	jal	ra,c0000250 <__panic>
c0003b2c:	0000a697          	auipc	a3,0xa
c0003b30:	57c68693          	addi	a3,a3,1404 # c000e0a8 <commands+0x120c>
c0003b34:	00009617          	auipc	a2,0x9
c0003b38:	74060613          	addi	a2,a2,1856 # c000d274 <commands+0x3d8>
c0003b3c:	0cb00593          	li	a1,203
c0003b40:	0000a517          	auipc	a0,0xa
c0003b44:	74850513          	addi	a0,a0,1864 # c000e288 <commands+0x13ec>
c0003b48:	f08fc0ef          	jal	ra,c0000250 <__panic>
c0003b4c:	0000a697          	auipc	a3,0xa
c0003b50:	53c68693          	addi	a3,a3,1340 # c000e088 <commands+0x11ec>
c0003b54:	00009617          	auipc	a2,0x9
c0003b58:	72060613          	addi	a2,a2,1824 # c000d274 <commands+0x3d8>
c0003b5c:	0c200593          	li	a1,194
c0003b60:	0000a517          	auipc	a0,0xa
c0003b64:	72850513          	addi	a0,a0,1832 # c000e288 <commands+0x13ec>
c0003b68:	ee8fc0ef          	jal	ra,c0000250 <__panic>
c0003b6c:	0000a697          	auipc	a3,0xa
c0003b70:	4fc68693          	addi	a3,a3,1276 # c000e068 <commands+0x11cc>
c0003b74:	00009617          	auipc	a2,0x9
c0003b78:	70060613          	addi	a2,a2,1792 # c000d274 <commands+0x3d8>
c0003b7c:	0c100593          	li	a1,193
c0003b80:	0000a517          	auipc	a0,0xa
c0003b84:	70850513          	addi	a0,a0,1800 # c000e288 <commands+0x13ec>
c0003b88:	ec8fc0ef          	jal	ra,c0000250 <__panic>
c0003b8c:	0000a697          	auipc	a3,0xa
c0003b90:	28c68693          	addi	a3,a3,652 # c000de18 <commands+0xf7c>
c0003b94:	00009617          	auipc	a2,0x9
c0003b98:	6e060613          	addi	a2,a2,1760 # c000d274 <commands+0x3d8>
c0003b9c:	0df00593          	li	a1,223
c0003ba0:	0000a517          	auipc	a0,0xa
c0003ba4:	6e850513          	addi	a0,a0,1768 # c000e288 <commands+0x13ec>
c0003ba8:	ea8fc0ef          	jal	ra,c0000250 <__panic>
c0003bac:	0000a697          	auipc	a3,0xa
c0003bb0:	4fc68693          	addi	a3,a3,1276 # c000e0a8 <commands+0x120c>
c0003bb4:	00009617          	auipc	a2,0x9
c0003bb8:	6c060613          	addi	a2,a2,1728 # c000d274 <commands+0x3d8>
c0003bbc:	0dd00593          	li	a1,221
c0003bc0:	0000a517          	auipc	a0,0xa
c0003bc4:	6c850513          	addi	a0,a0,1736 # c000e288 <commands+0x13ec>
c0003bc8:	e88fc0ef          	jal	ra,c0000250 <__panic>
c0003bcc:	0000a697          	auipc	a3,0xa
c0003bd0:	51c68693          	addi	a3,a3,1308 # c000e0e8 <commands+0x124c>
c0003bd4:	00009617          	auipc	a2,0x9
c0003bd8:	6a060613          	addi	a2,a2,1696 # c000d274 <commands+0x3d8>
c0003bdc:	0dc00593          	li	a1,220
c0003be0:	0000a517          	auipc	a0,0xa
c0003be4:	6a850513          	addi	a0,a0,1704 # c000e288 <commands+0x13ec>
c0003be8:	e68fc0ef          	jal	ra,c0000250 <__panic>
c0003bec:	0000a697          	auipc	a3,0xa
c0003bf0:	45c68693          	addi	a3,a3,1116 # c000e048 <commands+0x11ac>
c0003bf4:	00009617          	auipc	a2,0x9
c0003bf8:	68060613          	addi	a2,a2,1664 # c000d274 <commands+0x3d8>
c0003bfc:	0c000593          	li	a1,192
c0003c00:	0000a517          	auipc	a0,0xa
c0003c04:	68850513          	addi	a0,a0,1672 # c000e288 <commands+0x13ec>
c0003c08:	e48fc0ef          	jal	ra,c0000250 <__panic>
c0003c0c:	0000a697          	auipc	a3,0xa
c0003c10:	49c68693          	addi	a3,a3,1180 # c000e0a8 <commands+0x120c>
c0003c14:	00009617          	auipc	a2,0x9
c0003c18:	66060613          	addi	a2,a2,1632 # c000d274 <commands+0x3d8>
c0003c1c:	0d600593          	li	a1,214
c0003c20:	0000a517          	auipc	a0,0xa
c0003c24:	66850513          	addi	a0,a0,1640 # c000e288 <commands+0x13ec>
c0003c28:	e28fc0ef          	jal	ra,c0000250 <__panic>
c0003c2c:	0000a697          	auipc	a3,0xa
c0003c30:	3a068693          	addi	a3,a3,928 # c000dfcc <commands+0x1130>
c0003c34:	00009617          	auipc	a2,0x9
c0003c38:	64060613          	addi	a2,a2,1600 # c000d274 <commands+0x3d8>
c0003c3c:	0d400593          	li	a1,212
c0003c40:	0000a517          	auipc	a0,0xa
c0003c44:	64850513          	addi	a0,a0,1608 # c000e288 <commands+0x13ec>
c0003c48:	e08fc0ef          	jal	ra,c0000250 <__panic>
c0003c4c:	0000a697          	auipc	a3,0xa
c0003c50:	36468693          	addi	a3,a3,868 # c000dfb0 <commands+0x1114>
c0003c54:	00009617          	auipc	a2,0x9
c0003c58:	62060613          	addi	a2,a2,1568 # c000d274 <commands+0x3d8>
c0003c5c:	0d300593          	li	a1,211
c0003c60:	0000a517          	auipc	a0,0xa
c0003c64:	62850513          	addi	a0,a0,1576 # c000e288 <commands+0x13ec>
c0003c68:	de8fc0ef          	jal	ra,c0000250 <__panic>
c0003c6c:	0000a697          	auipc	a3,0xa
c0003c70:	36068693          	addi	a3,a3,864 # c000dfcc <commands+0x1130>
c0003c74:	00009617          	auipc	a2,0x9
c0003c78:	60060613          	addi	a2,a2,1536 # c000d274 <commands+0x3d8>
c0003c7c:	0bb00593          	li	a1,187
c0003c80:	0000a517          	auipc	a0,0xa
c0003c84:	60850513          	addi	a0,a0,1544 # c000e288 <commands+0x13ec>
c0003c88:	dc8fc0ef          	jal	ra,c0000250 <__panic>
c0003c8c:	0000a697          	auipc	a3,0xa
c0003c90:	5bc68693          	addi	a3,a3,1468 # c000e248 <commands+0x13ac>
c0003c94:	00009617          	auipc	a2,0x9
c0003c98:	5e060613          	addi	a2,a2,1504 # c000d274 <commands+0x3d8>
c0003c9c:	12500593          	li	a1,293
c0003ca0:	0000a517          	auipc	a0,0xa
c0003ca4:	5e850513          	addi	a0,a0,1512 # c000e288 <commands+0x13ec>
c0003ca8:	da8fc0ef          	jal	ra,c0000250 <__panic>
c0003cac:	0000a697          	auipc	a3,0xa
c0003cb0:	16c68693          	addi	a3,a3,364 # c000de18 <commands+0xf7c>
c0003cb4:	00009617          	auipc	a2,0x9
c0003cb8:	5c060613          	addi	a2,a2,1472 # c000d274 <commands+0x3d8>
c0003cbc:	11a00593          	li	a1,282
c0003cc0:	0000a517          	auipc	a0,0xa
c0003cc4:	5c850513          	addi	a0,a0,1480 # c000e288 <commands+0x13ec>
c0003cc8:	d88fc0ef          	jal	ra,c0000250 <__panic>
c0003ccc:	0000a697          	auipc	a3,0xa
c0003cd0:	3dc68693          	addi	a3,a3,988 # c000e0a8 <commands+0x120c>
c0003cd4:	00009617          	auipc	a2,0x9
c0003cd8:	5a060613          	addi	a2,a2,1440 # c000d274 <commands+0x3d8>
c0003cdc:	11800593          	li	a1,280
c0003ce0:	0000a517          	auipc	a0,0xa
c0003ce4:	5a850513          	addi	a0,a0,1448 # c000e288 <commands+0x13ec>
c0003ce8:	d68fc0ef          	jal	ra,c0000250 <__panic>
c0003cec:	0000a697          	auipc	a3,0xa
c0003cf0:	41868693          	addi	a3,a3,1048 # c000e104 <commands+0x1268>
c0003cf4:	00009617          	auipc	a2,0x9
c0003cf8:	58060613          	addi	a2,a2,1408 # c000d274 <commands+0x3d8>
c0003cfc:	0f800593          	li	a1,248
c0003d00:	0000a517          	auipc	a0,0xa
c0003d04:	58850513          	addi	a0,a0,1416 # c000e288 <commands+0x13ec>
c0003d08:	d48fc0ef          	jal	ra,c0000250 <__panic>
c0003d0c:	0000a697          	auipc	a3,0xa
c0003d10:	4fc68693          	addi	a3,a3,1276 # c000e208 <commands+0x136c>
c0003d14:	00009617          	auipc	a2,0x9
c0003d18:	56060613          	addi	a2,a2,1376 # c000d274 <commands+0x3d8>
c0003d1c:	11200593          	li	a1,274
c0003d20:	0000a517          	auipc	a0,0xa
c0003d24:	56850513          	addi	a0,a0,1384 # c000e288 <commands+0x13ec>
c0003d28:	d28fc0ef          	jal	ra,c0000250 <__panic>
c0003d2c:	0000a697          	auipc	a3,0xa
c0003d30:	4bc68693          	addi	a3,a3,1212 # c000e1e8 <commands+0x134c>
c0003d34:	00009617          	auipc	a2,0x9
c0003d38:	54060613          	addi	a2,a2,1344 # c000d274 <commands+0x3d8>
c0003d3c:	11000593          	li	a1,272
c0003d40:	0000a517          	auipc	a0,0xa
c0003d44:	54850513          	addi	a0,a0,1352 # c000e288 <commands+0x13ec>
c0003d48:	d08fc0ef          	jal	ra,c0000250 <__panic>
c0003d4c:	0000a697          	auipc	a3,0xa
c0003d50:	47468693          	addi	a3,a3,1140 # c000e1c0 <commands+0x1324>
c0003d54:	00009617          	auipc	a2,0x9
c0003d58:	52060613          	addi	a2,a2,1312 # c000d274 <commands+0x3d8>
c0003d5c:	10e00593          	li	a1,270
c0003d60:	0000a517          	auipc	a0,0xa
c0003d64:	52850513          	addi	a0,a0,1320 # c000e288 <commands+0x13ec>
c0003d68:	ce8fc0ef          	jal	ra,c0000250 <__panic>
c0003d6c:	0000a697          	auipc	a3,0xa
c0003d70:	42c68693          	addi	a3,a3,1068 # c000e198 <commands+0x12fc>
c0003d74:	00009617          	auipc	a2,0x9
c0003d78:	50060613          	addi	a2,a2,1280 # c000d274 <commands+0x3d8>
c0003d7c:	10d00593          	li	a1,269
c0003d80:	0000a517          	auipc	a0,0xa
c0003d84:	50850513          	addi	a0,a0,1288 # c000e288 <commands+0x13ec>
c0003d88:	cc8fc0ef          	jal	ra,c0000250 <__panic>
c0003d8c:	0000a697          	auipc	a3,0xa
c0003d90:	3fc68693          	addi	a3,a3,1020 # c000e188 <commands+0x12ec>
c0003d94:	00009617          	auipc	a2,0x9
c0003d98:	4e060613          	addi	a2,a2,1248 # c000d274 <commands+0x3d8>
c0003d9c:	10800593          	li	a1,264
c0003da0:	0000a517          	auipc	a0,0xa
c0003da4:	4e850513          	addi	a0,a0,1256 # c000e288 <commands+0x13ec>
c0003da8:	ca8fc0ef          	jal	ra,c0000250 <__panic>
c0003dac:	0000a697          	auipc	a3,0xa
c0003db0:	2fc68693          	addi	a3,a3,764 # c000e0a8 <commands+0x120c>
c0003db4:	00009617          	auipc	a2,0x9
c0003db8:	4c060613          	addi	a2,a2,1216 # c000d274 <commands+0x3d8>
c0003dbc:	10700593          	li	a1,263
c0003dc0:	0000a517          	auipc	a0,0xa
c0003dc4:	4c850513          	addi	a0,a0,1224 # c000e288 <commands+0x13ec>
c0003dc8:	c88fc0ef          	jal	ra,c0000250 <__panic>
c0003dcc:	0000a697          	auipc	a3,0xa
c0003dd0:	39c68693          	addi	a3,a3,924 # c000e168 <commands+0x12cc>
c0003dd4:	00009617          	auipc	a2,0x9
c0003dd8:	4a060613          	addi	a2,a2,1184 # c000d274 <commands+0x3d8>
c0003ddc:	10600593          	li	a1,262
c0003de0:	0000a517          	auipc	a0,0xa
c0003de4:	4a850513          	addi	a0,a0,1192 # c000e288 <commands+0x13ec>
c0003de8:	c68fc0ef          	jal	ra,c0000250 <__panic>
c0003dec:	0000a697          	auipc	a3,0xa
c0003df0:	35068693          	addi	a3,a3,848 # c000e13c <commands+0x12a0>
c0003df4:	00009617          	auipc	a2,0x9
c0003df8:	48060613          	addi	a2,a2,1152 # c000d274 <commands+0x3d8>
c0003dfc:	10500593          	li	a1,261
c0003e00:	0000a517          	auipc	a0,0xa
c0003e04:	48850513          	addi	a0,a0,1160 # c000e288 <commands+0x13ec>
c0003e08:	c48fc0ef          	jal	ra,c0000250 <__panic>
c0003e0c:	0000a697          	auipc	a3,0xa
c0003e10:	31868693          	addi	a3,a3,792 # c000e124 <commands+0x1288>
c0003e14:	00009617          	auipc	a2,0x9
c0003e18:	46060613          	addi	a2,a2,1120 # c000d274 <commands+0x3d8>
c0003e1c:	10400593          	li	a1,260
c0003e20:	0000a517          	auipc	a0,0xa
c0003e24:	46850513          	addi	a0,a0,1128 # c000e288 <commands+0x13ec>
c0003e28:	c28fc0ef          	jal	ra,c0000250 <__panic>
c0003e2c:	0000a697          	auipc	a3,0xa
c0003e30:	27c68693          	addi	a3,a3,636 # c000e0a8 <commands+0x120c>
c0003e34:	00009617          	auipc	a2,0x9
c0003e38:	44060613          	addi	a2,a2,1088 # c000d274 <commands+0x3d8>
c0003e3c:	0fe00593          	li	a1,254
c0003e40:	0000a517          	auipc	a0,0xa
c0003e44:	44850513          	addi	a0,a0,1096 # c000e288 <commands+0x13ec>
c0003e48:	c08fc0ef          	jal	ra,c0000250 <__panic>
c0003e4c:	0000a697          	auipc	a3,0xa
c0003e50:	2c468693          	addi	a3,a3,708 # c000e110 <commands+0x1274>
c0003e54:	00009617          	auipc	a2,0x9
c0003e58:	42060613          	addi	a2,a2,1056 # c000d274 <commands+0x3d8>
c0003e5c:	0f900593          	li	a1,249
c0003e60:	0000a517          	auipc	a0,0xa
c0003e64:	42850513          	addi	a0,a0,1064 # c000e288 <commands+0x13ec>
c0003e68:	be8fc0ef          	jal	ra,c0000250 <__panic>
c0003e6c:	0000a697          	auipc	a3,0xa
c0003e70:	3bc68693          	addi	a3,a3,956 # c000e228 <commands+0x138c>
c0003e74:	00009617          	auipc	a2,0x9
c0003e78:	40060613          	addi	a2,a2,1024 # c000d274 <commands+0x3d8>
c0003e7c:	11700593          	li	a1,279
c0003e80:	0000a517          	auipc	a0,0xa
c0003e84:	40850513          	addi	a0,a0,1032 # c000e288 <commands+0x13ec>
c0003e88:	bc8fc0ef          	jal	ra,c0000250 <__panic>
c0003e8c:	0000a697          	auipc	a3,0xa
c0003e90:	3c868693          	addi	a3,a3,968 # c000e254 <commands+0x13b8>
c0003e94:	00009617          	auipc	a2,0x9
c0003e98:	3e060613          	addi	a2,a2,992 # c000d274 <commands+0x3d8>
c0003e9c:	12600593          	li	a1,294
c0003ea0:	0000a517          	auipc	a0,0xa
c0003ea4:	3e850513          	addi	a0,a0,1000 # c000e288 <commands+0x13ec>
c0003ea8:	ba8fc0ef          	jal	ra,c0000250 <__panic>
c0003eac:	0000a697          	auipc	a3,0xa
c0003eb0:	df868693          	addi	a3,a3,-520 # c000dca4 <commands+0xe08>
c0003eb4:	00009617          	auipc	a2,0x9
c0003eb8:	3c060613          	addi	a2,a2,960 # c000d274 <commands+0x3d8>
c0003ebc:	0f300593          	li	a1,243
c0003ec0:	0000a517          	auipc	a0,0xa
c0003ec4:	3c850513          	addi	a0,a0,968 # c000e288 <commands+0x13ec>
c0003ec8:	b88fc0ef          	jal	ra,c0000250 <__panic>
c0003ecc:	0000a697          	auipc	a3,0xa
c0003ed0:	0e468693          	addi	a3,a3,228 # c000dfb0 <commands+0x1114>
c0003ed4:	00009617          	auipc	a2,0x9
c0003ed8:	3a060613          	addi	a2,a2,928 # c000d274 <commands+0x3d8>
c0003edc:	0ba00593          	li	a1,186
c0003ee0:	0000a517          	auipc	a0,0xa
c0003ee4:	3a850513          	addi	a0,a0,936 # c000e288 <commands+0x13ec>
c0003ee8:	b68fc0ef          	jal	ra,c0000250 <__panic>
c0003eec:	0000a697          	auipc	a3,0xa
c0003ef0:	0a868693          	addi	a3,a3,168 # c000df94 <commands+0x10f8>
c0003ef4:	00009617          	auipc	a2,0x9
c0003ef8:	38060613          	addi	a2,a2,896 # c000d274 <commands+0x3d8>
c0003efc:	0b900593          	li	a1,185
c0003f00:	0000a517          	auipc	a0,0xa
c0003f04:	38850513          	addi	a0,a0,904 # c000e288 <commands+0x13ec>
c0003f08:	b48fc0ef          	jal	ra,c0000250 <__panic>

c0003f0c <default_alloc_pages>:
c0003f0c:	0a050263          	beqz	a0,c0003fb0 <default_alloc_pages+0xa4>
c0003f10:	00042597          	auipc	a1,0x42
c0003f14:	ae85a583          	lw	a1,-1304(a1) # c00459f8 <free_area+0x8>
c0003f18:	00050693          	mv	a3,a0
c0003f1c:	00042617          	auipc	a2,0x42
c0003f20:	ad460613          	addi	a2,a2,-1324 # c00459f0 <free_area>
c0003f24:	00a5ee63          	bltu	a1,a0,c0003f40 <default_alloc_pages+0x34>
c0003f28:	00060793          	mv	a5,a2
c0003f2c:	00c0006f          	j	c0003f38 <default_alloc_pages+0x2c>
c0003f30:	ffc7a703          	lw	a4,-4(a5)
c0003f34:	00d77a63          	bleu	a3,a4,c0003f48 <default_alloc_pages+0x3c>
c0003f38:	0047a783          	lw	a5,4(a5)
c0003f3c:	fec79ae3          	bne	a5,a2,c0003f30 <default_alloc_pages+0x24>
c0003f40:	00000513          	li	a0,0
c0003f44:	00008067          	ret
c0003f48:	ff478513          	addi	a0,a5,-12
c0003f4c:	fe050ce3          	beqz	a0,c0003f44 <default_alloc_pages+0x38>
c0003f50:	0007a803          	lw	a6,0(a5)
c0003f54:	0047a883          	lw	a7,4(a5)
c0003f58:	01182223          	sw	a7,4(a6)
c0003f5c:	0108a023          	sw	a6,0(a7)
c0003f60:	02e6fc63          	bleu	a4,a3,c0003f98 <default_alloc_pages+0x8c>
c0003f64:	00569893          	slli	a7,a3,0x5
c0003f68:	011508b3          	add	a7,a0,a7
c0003f6c:	40d70733          	sub	a4,a4,a3
c0003f70:	00e8a423          	sw	a4,8(a7)
c0003f74:	00488313          	addi	t1,a7,4
c0003f78:	00200713          	li	a4,2
c0003f7c:	40e3202f          	amoor.w	zero,a4,(t1)
c0003f80:	00482703          	lw	a4,4(a6)
c0003f84:	00c88313          	addi	t1,a7,12
c0003f88:	00672023          	sw	t1,0(a4)
c0003f8c:	00682223          	sw	t1,4(a6)
c0003f90:	00e8a823          	sw	a4,16(a7)
c0003f94:	0108a623          	sw	a6,12(a7)
c0003f98:	40d586b3          	sub	a3,a1,a3
c0003f9c:	00d62423          	sw	a3,8(a2)
c0003fa0:	ffd00713          	li	a4,-3
c0003fa4:	ff878793          	addi	a5,a5,-8
c0003fa8:	60e7a02f          	amoand.w	zero,a4,(a5)
c0003fac:	00008067          	ret
c0003fb0:	ff010113          	addi	sp,sp,-16
c0003fb4:	0000a697          	auipc	a3,0xa
c0003fb8:	2ec68693          	addi	a3,a3,748 # c000e2a0 <commands+0x1404>
c0003fbc:	00009617          	auipc	a2,0x9
c0003fc0:	2b860613          	addi	a2,a2,696 # c000d274 <commands+0x3d8>
c0003fc4:	06200593          	li	a1,98
c0003fc8:	0000a517          	auipc	a0,0xa
c0003fcc:	2c050513          	addi	a0,a0,704 # c000e288 <commands+0x13ec>
c0003fd0:	00112623          	sw	ra,12(sp)
c0003fd4:	a7cfc0ef          	jal	ra,c0000250 <__panic>

c0003fd8 <get_pgtable_items.isra.4.part.5>:
c0003fd8:	00050313          	mv	t1,a0
c0003fdc:	04a5f063          	bleu	a0,a1,c000401c <get_pgtable_items.isra.4.part.5+0x44>
c0003fe0:	00259813          	slli	a6,a1,0x2
c0003fe4:	010608b3          	add	a7,a2,a6
c0003fe8:	0008a783          	lw	a5,0(a7)
c0003fec:	0017f793          	andi	a5,a5,1
c0003ff0:	02079a63          	bnez	a5,c0004024 <get_pgtable_items.isra.4.part.5+0x4c>
c0003ff4:	00480813          	addi	a6,a6,4
c0003ff8:	01060833          	add	a6,a2,a6
c0003ffc:	0140006f          	j	c0004010 <get_pgtable_items.isra.4.part.5+0x38>
c0004000:	00082783          	lw	a5,0(a6)
c0004004:	00480813          	addi	a6,a6,4
c0004008:	0017f793          	andi	a5,a5,1
c000400c:	00079c63          	bnez	a5,c0004024 <get_pgtable_items.isra.4.part.5+0x4c>
c0004010:	00158593          	addi	a1,a1,1
c0004014:	00080893          	mv	a7,a6
c0004018:	fe6594e3          	bne	a1,t1,c0004000 <get_pgtable_items.isra.4.part.5+0x28>
c000401c:	00000513          	li	a0,0
c0004020:	00008067          	ret
c0004024:	00068463          	beqz	a3,c000402c <get_pgtable_items.isra.4.part.5+0x54>
c0004028:	00b6a023          	sw	a1,0(a3)
c000402c:	0008a503          	lw	a0,0(a7)
c0004030:	00158593          	addi	a1,a1,1
c0004034:	01f57513          	andi	a0,a0,31
c0004038:	0265fe63          	bleu	t1,a1,c0004074 <get_pgtable_items.isra.4.part.5+0x9c>
c000403c:	00259793          	slli	a5,a1,0x2
c0004040:	00f606b3          	add	a3,a2,a5
c0004044:	0006a683          	lw	a3,0(a3)
c0004048:	01f6f693          	andi	a3,a3,31
c000404c:	02a69463          	bne	a3,a0,c0004074 <get_pgtable_items.isra.4.part.5+0x9c>
c0004050:	ffc78793          	addi	a5,a5,-4
c0004054:	00f60633          	add	a2,a2,a5
c0004058:	0140006f          	j	c000406c <get_pgtable_items.isra.4.part.5+0x94>
c000405c:	00862783          	lw	a5,8(a2)
c0004060:	00460613          	addi	a2,a2,4
c0004064:	01f7f793          	andi	a5,a5,31
c0004068:	00d79663          	bne	a5,a3,c0004074 <get_pgtable_items.isra.4.part.5+0x9c>
c000406c:	00158593          	addi	a1,a1,1
c0004070:	fe65e6e3          	bltu	a1,t1,c000405c <get_pgtable_items.isra.4.part.5+0x84>
c0004074:	00070663          	beqz	a4,c0004080 <get_pgtable_items.isra.4.part.5+0xa8>
c0004078:	00b72023          	sw	a1,0(a4)
c000407c:	00008067          	ret
c0004080:	00008067          	ret

c0004084 <pa2page.part.6>:
c0004084:	ff010113          	addi	sp,sp,-16
c0004088:	0000a617          	auipc	a2,0xa
c000408c:	86860613          	addi	a2,a2,-1944 # c000d8f0 <commands+0xa54>
c0004090:	06100593          	li	a1,97
c0004094:	0000a517          	auipc	a0,0xa
c0004098:	87c50513          	addi	a0,a0,-1924 # c000d910 <commands+0xa74>
c000409c:	00112623          	sw	ra,12(sp)
c00040a0:	9b0fc0ef          	jal	ra,c0000250 <__panic>

c00040a4 <alloc_pages>:
c00040a4:	ff010113          	addi	sp,sp,-16
c00040a8:	00812423          	sw	s0,8(sp)
c00040ac:	01212023          	sw	s2,0(sp)
c00040b0:	00112623          	sw	ra,12(sp)
c00040b4:	00912223          	sw	s1,4(sp)
c00040b8:	00050413          	mv	s0,a0
c00040bc:	00100913          	li	s2,1
c00040c0:	0400006f          	j	c0004100 <alloc_pages+0x5c>
c00040c4:	00042797          	auipc	a5,0x42
c00040c8:	9387a783          	lw	a5,-1736(a5) # c00459fc <pmm_manager>
c00040cc:	00c7a783          	lw	a5,12(a5)
c00040d0:	000780e7          	jalr	a5
c00040d4:	00050493          	mv	s1,a0
c00040d8:	00000613          	li	a2,0
c00040dc:	00040593          	mv	a1,s0
c00040e0:	04049e63          	bnez	s1,c000413c <alloc_pages+0x98>
c00040e4:	04896c63          	bltu	s2,s0,c000413c <alloc_pages+0x98>
c00040e8:	00042797          	auipc	a5,0x42
c00040ec:	82c7a783          	lw	a5,-2004(a5) # c0045914 <swap_init_ok>
c00040f0:	04078663          	beqz	a5,c000413c <alloc_pages+0x98>
c00040f4:	00042517          	auipc	a0,0x42
c00040f8:	85452503          	lw	a0,-1964(a0) # c0045948 <check_mm_struct>
c00040fc:	f3dfe0ef          	jal	ra,c0003038 <swap_out>
c0004100:	100027f3          	csrr	a5,sstatus
c0004104:	0027f793          	andi	a5,a5,2
c0004108:	00040513          	mv	a0,s0
c000410c:	fa078ce3          	beqz	a5,c00040c4 <alloc_pages+0x20>
c0004110:	f14fc0ef          	jal	ra,c0000824 <intr_disable>
c0004114:	00042797          	auipc	a5,0x42
c0004118:	8e87a783          	lw	a5,-1816(a5) # c00459fc <pmm_manager>
c000411c:	00c7a783          	lw	a5,12(a5)
c0004120:	00040513          	mv	a0,s0
c0004124:	000780e7          	jalr	a5
c0004128:	00050493          	mv	s1,a0
c000412c:	ef0fc0ef          	jal	ra,c000081c <intr_enable>
c0004130:	00000613          	li	a2,0
c0004134:	00040593          	mv	a1,s0
c0004138:	fa0486e3          	beqz	s1,c00040e4 <alloc_pages+0x40>
c000413c:	00c12083          	lw	ra,12(sp)
c0004140:	00048513          	mv	a0,s1
c0004144:	00812403          	lw	s0,8(sp)
c0004148:	00412483          	lw	s1,4(sp)
c000414c:	00012903          	lw	s2,0(sp)
c0004150:	01010113          	addi	sp,sp,16
c0004154:	00008067          	ret

c0004158 <free_pages>:
c0004158:	100027f3          	csrr	a5,sstatus
c000415c:	0027f793          	andi	a5,a5,2
c0004160:	00079a63          	bnez	a5,c0004174 <free_pages+0x1c>
c0004164:	00042797          	auipc	a5,0x42
c0004168:	8987a783          	lw	a5,-1896(a5) # c00459fc <pmm_manager>
c000416c:	0107a303          	lw	t1,16(a5)
c0004170:	00030067          	jr	t1
c0004174:	ff010113          	addi	sp,sp,-16
c0004178:	00112623          	sw	ra,12(sp)
c000417c:	00812423          	sw	s0,8(sp)
c0004180:	00912223          	sw	s1,4(sp)
c0004184:	00050413          	mv	s0,a0
c0004188:	00058493          	mv	s1,a1
c000418c:	e98fc0ef          	jal	ra,c0000824 <intr_disable>
c0004190:	00042797          	auipc	a5,0x42
c0004194:	86c7a783          	lw	a5,-1940(a5) # c00459fc <pmm_manager>
c0004198:	0107a783          	lw	a5,16(a5)
c000419c:	00048593          	mv	a1,s1
c00041a0:	00040513          	mv	a0,s0
c00041a4:	000780e7          	jalr	a5
c00041a8:	00c12083          	lw	ra,12(sp)
c00041ac:	00812403          	lw	s0,8(sp)
c00041b0:	00412483          	lw	s1,4(sp)
c00041b4:	01010113          	addi	sp,sp,16
c00041b8:	e64fc06f          	j	c000081c <intr_enable>

c00041bc <nr_free_pages>:
c00041bc:	100027f3          	csrr	a5,sstatus
c00041c0:	0027f793          	andi	a5,a5,2
c00041c4:	00079a63          	bnez	a5,c00041d8 <nr_free_pages+0x1c>
c00041c8:	00042797          	auipc	a5,0x42
c00041cc:	8347a783          	lw	a5,-1996(a5) # c00459fc <pmm_manager>
c00041d0:	0147a303          	lw	t1,20(a5)
c00041d4:	00030067          	jr	t1
c00041d8:	ff010113          	addi	sp,sp,-16
c00041dc:	00112623          	sw	ra,12(sp)
c00041e0:	00812423          	sw	s0,8(sp)
c00041e4:	e40fc0ef          	jal	ra,c0000824 <intr_disable>
c00041e8:	00042797          	auipc	a5,0x42
c00041ec:	8147a783          	lw	a5,-2028(a5) # c00459fc <pmm_manager>
c00041f0:	0147a783          	lw	a5,20(a5)
c00041f4:	000780e7          	jalr	a5
c00041f8:	00050413          	mv	s0,a0
c00041fc:	e20fc0ef          	jal	ra,c000081c <intr_enable>
c0004200:	00c12083          	lw	ra,12(sp)
c0004204:	00040513          	mv	a0,s0
c0004208:	00812403          	lw	s0,8(sp)
c000420c:	01010113          	addi	sp,sp,16
c0004210:	00008067          	ret

c0004214 <get_pte>:
c0004214:	fe010113          	addi	sp,sp,-32
c0004218:	01212823          	sw	s2,16(sp)
c000421c:	0165d913          	srli	s2,a1,0x16
c0004220:	00291913          	slli	s2,s2,0x2
c0004224:	01250933          	add	s2,a0,s2
c0004228:	00092683          	lw	a3,0(s2)
c000422c:	00912a23          	sw	s1,20(sp)
c0004230:	00112e23          	sw	ra,28(sp)
c0004234:	00812c23          	sw	s0,24(sp)
c0004238:	01312623          	sw	s3,12(sp)
c000423c:	0016f793          	andi	a5,a3,1
c0004240:	00058493          	mv	s1,a1
c0004244:	08079663          	bnez	a5,c00042d0 <get_pte+0xbc>
c0004248:	0c060e63          	beqz	a2,c0004324 <get_pte+0x110>
c000424c:	00100513          	li	a0,1
c0004250:	e55ff0ef          	jal	ra,c00040a4 <alloc_pages>
c0004254:	00050413          	mv	s0,a0
c0004258:	0c050663          	beqz	a0,c0004324 <get_pte+0x110>
c000425c:	00041517          	auipc	a0,0x41
c0004260:	7ac52503          	lw	a0,1964(a0) # c0045a08 <pages>
c0004264:	00100793          	li	a5,1
c0004268:	40a40533          	sub	a0,s0,a0
c000426c:	00f42023          	sw	a5,0(s0)
c0004270:	40555513          	srai	a0,a0,0x5
c0004274:	000809b7          	lui	s3,0x80
c0004278:	001007b7          	lui	a5,0x100
c000427c:	01350533          	add	a0,a0,s3
c0004280:	fff78793          	addi	a5,a5,-1 # fffff <_binary_obj___user_matrix_out_size+0xfd6b7>
c0004284:	00f577b3          	and	a5,a0,a5
c0004288:	00041717          	auipc	a4,0x41
c000428c:	69472703          	lw	a4,1684(a4) # c004591c <npage>
c0004290:	00c51513          	slli	a0,a0,0xc
c0004294:	0ce7f463          	bleu	a4,a5,c000435c <get_pte+0x148>
c0004298:	00041797          	auipc	a5,0x41
c000429c:	7687a783          	lw	a5,1896(a5) # c0045a00 <va_pa_offset>
c00042a0:	00001637          	lui	a2,0x1
c00042a4:	00000593          	li	a1,0
c00042a8:	00f50533          	add	a0,a0,a5
c00042ac:	45c080ef          	jal	ra,c000c708 <memset>
c00042b0:	00041697          	auipc	a3,0x41
c00042b4:	7586a683          	lw	a3,1880(a3) # c0045a08 <pages>
c00042b8:	40d406b3          	sub	a3,s0,a3
c00042bc:	4056d693          	srai	a3,a3,0x5
c00042c0:	013686b3          	add	a3,a3,s3
c00042c4:	00a69693          	slli	a3,a3,0xa
c00042c8:	0116e693          	ori	a3,a3,17
c00042cc:	00d92023          	sw	a3,0(s2)
c00042d0:	00269693          	slli	a3,a3,0x2
c00042d4:	fffff537          	lui	a0,0xfffff
c00042d8:	00a6f6b3          	and	a3,a3,a0
c00042dc:	00c6d713          	srli	a4,a3,0xc
c00042e0:	00041797          	auipc	a5,0x41
c00042e4:	63c7a783          	lw	a5,1596(a5) # c004591c <npage>
c00042e8:	04f77e63          	bleu	a5,a4,c0004344 <get_pte+0x130>
c00042ec:	00c4d513          	srli	a0,s1,0xc
c00042f0:	01c12083          	lw	ra,28(sp)
c00042f4:	3ff57513          	andi	a0,a0,1023
c00042f8:	00041797          	auipc	a5,0x41
c00042fc:	7087a783          	lw	a5,1800(a5) # c0045a00 <va_pa_offset>
c0004300:	00f686b3          	add	a3,a3,a5
c0004304:	00251513          	slli	a0,a0,0x2
c0004308:	00a68533          	add	a0,a3,a0
c000430c:	01812403          	lw	s0,24(sp)
c0004310:	01412483          	lw	s1,20(sp)
c0004314:	01012903          	lw	s2,16(sp)
c0004318:	00c12983          	lw	s3,12(sp)
c000431c:	02010113          	addi	sp,sp,32
c0004320:	00008067          	ret
c0004324:	01c12083          	lw	ra,28(sp)
c0004328:	00000513          	li	a0,0
c000432c:	01812403          	lw	s0,24(sp)
c0004330:	01412483          	lw	s1,20(sp)
c0004334:	01012903          	lw	s2,16(sp)
c0004338:	00c12983          	lw	s3,12(sp)
c000433c:	02010113          	addi	sp,sp,32
c0004340:	00008067          	ret
c0004344:	0000a617          	auipc	a2,0xa
c0004348:	81460613          	addi	a2,a2,-2028 # c000db58 <commands+0xcbc>
c000434c:	12100593          	li	a1,289
c0004350:	0000a517          	auipc	a0,0xa
c0004354:	fec50513          	addi	a0,a0,-20 # c000e33c <default_pmm_manager+0x84>
c0004358:	ef9fb0ef          	jal	ra,c0000250 <__panic>
c000435c:	00050693          	mv	a3,a0
c0004360:	00009617          	auipc	a2,0x9
c0004364:	7f860613          	addi	a2,a2,2040 # c000db58 <commands+0xcbc>
c0004368:	11e00593          	li	a1,286
c000436c:	0000a517          	auipc	a0,0xa
c0004370:	fd050513          	addi	a0,a0,-48 # c000e33c <default_pmm_manager+0x84>
c0004374:	eddfb0ef          	jal	ra,c0000250 <__panic>

c0004378 <boot_map_segment>:
c0004378:	fe010113          	addi	sp,sp,-32
c000437c:	01312623          	sw	s3,12(sp)
c0004380:	000019b7          	lui	s3,0x1
c0004384:	00d5c7b3          	xor	a5,a1,a3
c0004388:	fff98813          	addi	a6,s3,-1 # fff <_binary_obj___user_faultread_out_size-0x10a9>
c000438c:	00112e23          	sw	ra,28(sp)
c0004390:	00812c23          	sw	s0,24(sp)
c0004394:	00912a23          	sw	s1,20(sp)
c0004398:	01212823          	sw	s2,16(sp)
c000439c:	01412423          	sw	s4,8(sp)
c00043a0:	01512223          	sw	s5,4(sp)
c00043a4:	01612023          	sw	s6,0(sp)
c00043a8:	0107f7b3          	and	a5,a5,a6
c00043ac:	0a079c63          	bnez	a5,c0004464 <boot_map_segment+0xec>
c00043b0:	010607b3          	add	a5,a2,a6
c00043b4:	0105f833          	and	a6,a1,a6
c00043b8:	010787b3          	add	a5,a5,a6
c00043bc:	fffff937          	lui	s2,0xfffff
c00043c0:	00c7d793          	srli	a5,a5,0xc
c00043c4:	0125f5b3          	and	a1,a1,s2
c00043c8:	0126f6b3          	and	a3,a3,s2
c00043cc:	04078863          	beqz	a5,c000441c <boot_map_segment+0xa4>
c00043d0:	00c79793          	slli	a5,a5,0xc
c00043d4:	00100b13          	li	s6,1
c00043d8:	00050a93          	mv	s5,a0
c00043dc:	00058413          	mv	s0,a1
c00043e0:	00b784b3          	add	s1,a5,a1
c00043e4:	40b68933          	sub	s2,a3,a1
c00043e8:	01676a33          	or	s4,a4,s6
c00043ec:	000b0613          	mv	a2,s6
c00043f0:	00040593          	mv	a1,s0
c00043f4:	000a8513          	mv	a0,s5
c00043f8:	e1dff0ef          	jal	ra,c0004214 <get_pte>
c00043fc:	008907b3          	add	a5,s2,s0
c0004400:	04050263          	beqz	a0,c0004444 <boot_map_segment+0xcc>
c0004404:	00c7d793          	srli	a5,a5,0xc
c0004408:	00a79793          	slli	a5,a5,0xa
c000440c:	0147e7b3          	or	a5,a5,s4
c0004410:	00f52023          	sw	a5,0(a0)
c0004414:	01340433          	add	s0,s0,s3
c0004418:	fc849ae3          	bne	s1,s0,c00043ec <boot_map_segment+0x74>
c000441c:	01c12083          	lw	ra,28(sp)
c0004420:	01812403          	lw	s0,24(sp)
c0004424:	01412483          	lw	s1,20(sp)
c0004428:	01012903          	lw	s2,16(sp)
c000442c:	00c12983          	lw	s3,12(sp)
c0004430:	00812a03          	lw	s4,8(sp)
c0004434:	00412a83          	lw	s5,4(sp)
c0004438:	00012b03          	lw	s6,0(sp)
c000443c:	02010113          	addi	sp,sp,32
c0004440:	00008067          	ret
c0004444:	0000a697          	auipc	a3,0xa
c0004448:	ebc68693          	addi	a3,a3,-324 # c000e300 <default_pmm_manager+0x48>
c000444c:	00009617          	auipc	a2,0x9
c0004450:	e2860613          	addi	a2,a2,-472 # c000d274 <commands+0x3d8>
c0004454:	0a500593          	li	a1,165
c0004458:	0000a517          	auipc	a0,0xa
c000445c:	ee450513          	addi	a0,a0,-284 # c000e33c <default_pmm_manager+0x84>
c0004460:	df1fb0ef          	jal	ra,c0000250 <__panic>
c0004464:	0000a697          	auipc	a3,0xa
c0004468:	e8468693          	addi	a3,a3,-380 # c000e2e8 <default_pmm_manager+0x30>
c000446c:	00009617          	auipc	a2,0x9
c0004470:	e0860613          	addi	a2,a2,-504 # c000d274 <commands+0x3d8>
c0004474:	09f00593          	li	a1,159
c0004478:	0000a517          	auipc	a0,0xa
c000447c:	ec450513          	addi	a0,a0,-316 # c000e33c <default_pmm_manager+0x84>
c0004480:	dd1fb0ef          	jal	ra,c0000250 <__panic>

c0004484 <get_page>:
c0004484:	ff010113          	addi	sp,sp,-16
c0004488:	00812423          	sw	s0,8(sp)
c000448c:	00060413          	mv	s0,a2
c0004490:	00000613          	li	a2,0
c0004494:	00112623          	sw	ra,12(sp)
c0004498:	d7dff0ef          	jal	ra,c0004214 <get_pte>
c000449c:	00040463          	beqz	s0,c00044a4 <get_page+0x20>
c00044a0:	00a42023          	sw	a0,0(s0)
c00044a4:	04050663          	beqz	a0,c00044f0 <get_page+0x6c>
c00044a8:	00052783          	lw	a5,0(a0)
c00044ac:	0017f713          	andi	a4,a5,1
c00044b0:	04070063          	beqz	a4,c00044f0 <get_page+0x6c>
c00044b4:	00279793          	slli	a5,a5,0x2
c00044b8:	00c7d793          	srli	a5,a5,0xc
c00044bc:	00041717          	auipc	a4,0x41
c00044c0:	46072703          	lw	a4,1120(a4) # c004591c <npage>
c00044c4:	04e7f063          	bleu	a4,a5,c0004504 <get_page+0x80>
c00044c8:	fff80537          	lui	a0,0xfff80
c00044cc:	00c12083          	lw	ra,12(sp)
c00044d0:	00a787b3          	add	a5,a5,a0
c00044d4:	00579793          	slli	a5,a5,0x5
c00044d8:	00041517          	auipc	a0,0x41
c00044dc:	53052503          	lw	a0,1328(a0) # c0045a08 <pages>
c00044e0:	00f50533          	add	a0,a0,a5
c00044e4:	00812403          	lw	s0,8(sp)
c00044e8:	01010113          	addi	sp,sp,16
c00044ec:	00008067          	ret
c00044f0:	00c12083          	lw	ra,12(sp)
c00044f4:	00000513          	li	a0,0
c00044f8:	00812403          	lw	s0,8(sp)
c00044fc:	01010113          	addi	sp,sp,16
c0004500:	00008067          	ret
c0004504:	b81ff0ef          	jal	ra,c0004084 <pa2page.part.6>

c0004508 <unmap_range>:
c0004508:	fd010113          	addi	sp,sp,-48
c000450c:	00c5e7b3          	or	a5,a1,a2
c0004510:	02112623          	sw	ra,44(sp)
c0004514:	02812423          	sw	s0,40(sp)
c0004518:	02912223          	sw	s1,36(sp)
c000451c:	03212023          	sw	s2,32(sp)
c0004520:	01312e23          	sw	s3,28(sp)
c0004524:	01412c23          	sw	s4,24(sp)
c0004528:	01512a23          	sw	s5,20(sp)
c000452c:	01612823          	sw	s6,16(sp)
c0004530:	01712623          	sw	s7,12(sp)
c0004534:	01812423          	sw	s8,8(sp)
c0004538:	01479713          	slli	a4,a5,0x14
c000453c:	12071063          	bnez	a4,c000465c <unmap_range+0x154>
c0004540:	002007b7          	lui	a5,0x200
c0004544:	00058413          	mv	s0,a1
c0004548:	0ef5ea63          	bltu	a1,a5,c000463c <unmap_range+0x134>
c000454c:	00060913          	mv	s2,a2
c0004550:	0ec5f663          	bleu	a2,a1,c000463c <unmap_range+0x134>
c0004554:	b00007b7          	lui	a5,0xb0000
c0004558:	00050993          	mv	s3,a0
c000455c:	00400b37          	lui	s6,0x400
c0004560:	ffc00ab7          	lui	s5,0xffc00
c0004564:	00001a37          	lui	s4,0x1
c0004568:	fff80bb7          	lui	s7,0xfff80
c000456c:	00100c13          	li	s8,1
c0004570:	0cc7e663          	bltu	a5,a2,c000463c <unmap_range+0x134>
c0004574:	00000613          	li	a2,0
c0004578:	00040593          	mv	a1,s0
c000457c:	00098513          	mv	a0,s3
c0004580:	c95ff0ef          	jal	ra,c0004214 <get_pte>
c0004584:	00050493          	mv	s1,a0
c0004588:	08050a63          	beqz	a0,c000461c <unmap_range+0x114>
c000458c:	00052783          	lw	a5,0(a0)
c0004590:	02079e63          	bnez	a5,c00045cc <unmap_range+0xc4>
c0004594:	01440433          	add	s0,s0,s4
c0004598:	fd246ee3          	bltu	s0,s2,c0004574 <unmap_range+0x6c>
c000459c:	02c12083          	lw	ra,44(sp)
c00045a0:	02812403          	lw	s0,40(sp)
c00045a4:	02412483          	lw	s1,36(sp)
c00045a8:	02012903          	lw	s2,32(sp)
c00045ac:	01c12983          	lw	s3,28(sp)
c00045b0:	01812a03          	lw	s4,24(sp)
c00045b4:	01412a83          	lw	s5,20(sp)
c00045b8:	01012b03          	lw	s6,16(sp)
c00045bc:	00c12b83          	lw	s7,12(sp)
c00045c0:	00812c03          	lw	s8,8(sp)
c00045c4:	03010113          	addi	sp,sp,48
c00045c8:	00008067          	ret
c00045cc:	0017f713          	andi	a4,a5,1
c00045d0:	fc0702e3          	beqz	a4,c0004594 <unmap_range+0x8c>
c00045d4:	00279793          	slli	a5,a5,0x2
c00045d8:	00c7d793          	srli	a5,a5,0xc
c00045dc:	00041717          	auipc	a4,0x41
c00045e0:	34072703          	lw	a4,832(a4) # c004591c <npage>
c00045e4:	08e7fc63          	bleu	a4,a5,c000467c <unmap_range+0x174>
c00045e8:	017787b3          	add	a5,a5,s7
c00045ec:	00579793          	slli	a5,a5,0x5
c00045f0:	00041517          	auipc	a0,0x41
c00045f4:	41852503          	lw	a0,1048(a0) # c0045a08 <pages>
c00045f8:	00f50533          	add	a0,a0,a5
c00045fc:	00052783          	lw	a5,0(a0)
c0004600:	fff78793          	addi	a5,a5,-1 # afffffff <sbi_remote_fence_i+0xb000070f>
c0004604:	00f52023          	sw	a5,0(a0)
c0004608:	02078463          	beqz	a5,c0004630 <unmap_range+0x128>
c000460c:	0004a023          	sw	zero,0(s1)
c0004610:	10440073          	sfence.vm	s0
c0004614:	01440433          	add	s0,s0,s4
c0004618:	f81ff06f          	j	c0004598 <unmap_range+0x90>
c000461c:	01640433          	add	s0,s0,s6
c0004620:	01547433          	and	s0,s0,s5
c0004624:	f6040ce3          	beqz	s0,c000459c <unmap_range+0x94>
c0004628:	f52466e3          	bltu	s0,s2,c0004574 <unmap_range+0x6c>
c000462c:	f71ff06f          	j	c000459c <unmap_range+0x94>
c0004630:	000c0593          	mv	a1,s8
c0004634:	b25ff0ef          	jal	ra,c0004158 <free_pages>
c0004638:	fd5ff06f          	j	c000460c <unmap_range+0x104>
c000463c:	0000a697          	auipc	a3,0xa
c0004640:	33468693          	addi	a3,a3,820 # c000e970 <default_pmm_manager+0x6b8>
c0004644:	00009617          	auipc	a2,0x9
c0004648:	c3060613          	addi	a2,a2,-976 # c000d274 <commands+0x3d8>
c000464c:	15900593          	li	a1,345
c0004650:	0000a517          	auipc	a0,0xa
c0004654:	cec50513          	addi	a0,a0,-788 # c000e33c <default_pmm_manager+0x84>
c0004658:	bf9fb0ef          	jal	ra,c0000250 <__panic>
c000465c:	0000a697          	auipc	a3,0xa
c0004660:	2e868693          	addi	a3,a3,744 # c000e944 <default_pmm_manager+0x68c>
c0004664:	00009617          	auipc	a2,0x9
c0004668:	c1060613          	addi	a2,a2,-1008 # c000d274 <commands+0x3d8>
c000466c:	15800593          	li	a1,344
c0004670:	0000a517          	auipc	a0,0xa
c0004674:	ccc50513          	addi	a0,a0,-820 # c000e33c <default_pmm_manager+0x84>
c0004678:	bd9fb0ef          	jal	ra,c0000250 <__panic>
c000467c:	a09ff0ef          	jal	ra,c0004084 <pa2page.part.6>

c0004680 <exit_range>:
c0004680:	fe010113          	addi	sp,sp,-32
c0004684:	00c5e7b3          	or	a5,a1,a2
c0004688:	00112e23          	sw	ra,28(sp)
c000468c:	00812c23          	sw	s0,24(sp)
c0004690:	00912a23          	sw	s1,20(sp)
c0004694:	01212823          	sw	s2,16(sp)
c0004698:	01312623          	sw	s3,12(sp)
c000469c:	01412423          	sw	s4,8(sp)
c00046a0:	01512223          	sw	s5,4(sp)
c00046a4:	01612023          	sw	s6,0(sp)
c00046a8:	01479713          	slli	a4,a5,0x14
c00046ac:	0e071863          	bnez	a4,c000479c <exit_range+0x11c>
c00046b0:	002007b7          	lui	a5,0x200
c00046b4:	0cf5e463          	bltu	a1,a5,c000477c <exit_range+0xfc>
c00046b8:	00060a13          	mv	s4,a2
c00046bc:	0cc5f063          	bleu	a2,a1,c000477c <exit_range+0xfc>
c00046c0:	ffc004b7          	lui	s1,0xffc00
c00046c4:	b00007b7          	lui	a5,0xb0000
c00046c8:	00050a93          	mv	s5,a0
c00046cc:	0095f4b3          	and	s1,a1,s1
c00046d0:	fff809b7          	lui	s3,0xfff80
c00046d4:	00100913          	li	s2,1
c00046d8:	00400b37          	lui	s6,0x400
c00046dc:	00c7f663          	bleu	a2,a5,c00046e8 <exit_range+0x68>
c00046e0:	09c0006f          	j	c000477c <exit_range+0xfc>
c00046e4:	0544fc63          	bleu	s4,s1,c000473c <exit_range+0xbc>
c00046e8:	0164d413          	srli	s0,s1,0x16
c00046ec:	00241413          	slli	s0,s0,0x2
c00046f0:	008a8433          	add	s0,s5,s0
c00046f4:	00042783          	lw	a5,0(s0)
c00046f8:	0017f713          	andi	a4,a5,1
c00046fc:	02070c63          	beqz	a4,c0004734 <exit_range+0xb4>
c0004700:	00279793          	slli	a5,a5,0x2
c0004704:	00c7d793          	srli	a5,a5,0xc
c0004708:	00041717          	auipc	a4,0x41
c000470c:	21472703          	lw	a4,532(a4) # c004591c <npage>
c0004710:	04e7fa63          	bleu	a4,a5,c0004764 <exit_range+0xe4>
c0004714:	013787b3          	add	a5,a5,s3
c0004718:	00579793          	slli	a5,a5,0x5
c000471c:	00041517          	auipc	a0,0x41
c0004720:	2ec52503          	lw	a0,748(a0) # c0045a08 <pages>
c0004724:	00090593          	mv	a1,s2
c0004728:	00f50533          	add	a0,a0,a5
c000472c:	a2dff0ef          	jal	ra,c0004158 <free_pages>
c0004730:	00042023          	sw	zero,0(s0)
c0004734:	016484b3          	add	s1,s1,s6
c0004738:	fa0496e3          	bnez	s1,c00046e4 <exit_range+0x64>
c000473c:	01c12083          	lw	ra,28(sp)
c0004740:	01812403          	lw	s0,24(sp)
c0004744:	01412483          	lw	s1,20(sp)
c0004748:	01012903          	lw	s2,16(sp)
c000474c:	00c12983          	lw	s3,12(sp)
c0004750:	00812a03          	lw	s4,8(sp)
c0004754:	00412a83          	lw	s5,4(sp)
c0004758:	00012b03          	lw	s6,0(sp)
c000475c:	02010113          	addi	sp,sp,32
c0004760:	00008067          	ret
c0004764:	00009617          	auipc	a2,0x9
c0004768:	18c60613          	addi	a2,a2,396 # c000d8f0 <commands+0xa54>
c000476c:	06100593          	li	a1,97
c0004770:	00009517          	auipc	a0,0x9
c0004774:	1a050513          	addi	a0,a0,416 # c000d910 <commands+0xa74>
c0004778:	ad9fb0ef          	jal	ra,c0000250 <__panic>
c000477c:	0000a697          	auipc	a3,0xa
c0004780:	1f468693          	addi	a3,a3,500 # c000e970 <default_pmm_manager+0x6b8>
c0004784:	00009617          	auipc	a2,0x9
c0004788:	af060613          	addi	a2,a2,-1296 # c000d274 <commands+0x3d8>
c000478c:	16a00593          	li	a1,362
c0004790:	0000a517          	auipc	a0,0xa
c0004794:	bac50513          	addi	a0,a0,-1108 # c000e33c <default_pmm_manager+0x84>
c0004798:	ab9fb0ef          	jal	ra,c0000250 <__panic>
c000479c:	0000a697          	auipc	a3,0xa
c00047a0:	1a868693          	addi	a3,a3,424 # c000e944 <default_pmm_manager+0x68c>
c00047a4:	00009617          	auipc	a2,0x9
c00047a8:	ad060613          	addi	a2,a2,-1328 # c000d274 <commands+0x3d8>
c00047ac:	16900593          	li	a1,361
c00047b0:	0000a517          	auipc	a0,0xa
c00047b4:	b8c50513          	addi	a0,a0,-1140 # c000e33c <default_pmm_manager+0x84>
c00047b8:	a99fb0ef          	jal	ra,c0000250 <__panic>

c00047bc <page_remove>:
c00047bc:	ff010113          	addi	sp,sp,-16
c00047c0:	00000613          	li	a2,0
c00047c4:	00912223          	sw	s1,4(sp)
c00047c8:	00112623          	sw	ra,12(sp)
c00047cc:	00812423          	sw	s0,8(sp)
c00047d0:	00058493          	mv	s1,a1
c00047d4:	a41ff0ef          	jal	ra,c0004214 <get_pte>
c00047d8:	00050a63          	beqz	a0,c00047ec <page_remove+0x30>
c00047dc:	00052783          	lw	a5,0(a0)
c00047e0:	00050413          	mv	s0,a0
c00047e4:	0017f713          	andi	a4,a5,1
c00047e8:	00071c63          	bnez	a4,c0004800 <page_remove+0x44>
c00047ec:	00c12083          	lw	ra,12(sp)
c00047f0:	00812403          	lw	s0,8(sp)
c00047f4:	00412483          	lw	s1,4(sp)
c00047f8:	01010113          	addi	sp,sp,16
c00047fc:	00008067          	ret
c0004800:	00279793          	slli	a5,a5,0x2
c0004804:	00c7d793          	srli	a5,a5,0xc
c0004808:	00041717          	auipc	a4,0x41
c000480c:	11472703          	lw	a4,276(a4) # c004591c <npage>
c0004810:	04e7fa63          	bleu	a4,a5,c0004864 <page_remove+0xa8>
c0004814:	fff80537          	lui	a0,0xfff80
c0004818:	00a787b3          	add	a5,a5,a0
c000481c:	00579793          	slli	a5,a5,0x5
c0004820:	00041517          	auipc	a0,0x41
c0004824:	1e852503          	lw	a0,488(a0) # c0045a08 <pages>
c0004828:	00f50533          	add	a0,a0,a5
c000482c:	00052783          	lw	a5,0(a0)
c0004830:	fff78793          	addi	a5,a5,-1 # afffffff <sbi_remote_fence_i+0xb000070f>
c0004834:	00f52023          	sw	a5,0(a0)
c0004838:	02078063          	beqz	a5,c0004858 <page_remove+0x9c>
c000483c:	00042023          	sw	zero,0(s0)
c0004840:	10448073          	sfence.vm	s1
c0004844:	00c12083          	lw	ra,12(sp)
c0004848:	00812403          	lw	s0,8(sp)
c000484c:	00412483          	lw	s1,4(sp)
c0004850:	01010113          	addi	sp,sp,16
c0004854:	00008067          	ret
c0004858:	00100593          	li	a1,1
c000485c:	8fdff0ef          	jal	ra,c0004158 <free_pages>
c0004860:	fddff06f          	j	c000483c <page_remove+0x80>
c0004864:	821ff0ef          	jal	ra,c0004084 <pa2page.part.6>

c0004868 <page_insert>:
c0004868:	fe010113          	addi	sp,sp,-32
c000486c:	01312623          	sw	s3,12(sp)
c0004870:	00060993          	mv	s3,a2
c0004874:	00812c23          	sw	s0,24(sp)
c0004878:	00100613          	li	a2,1
c000487c:	00058413          	mv	s0,a1
c0004880:	00098593          	mv	a1,s3
c0004884:	01212823          	sw	s2,16(sp)
c0004888:	00112e23          	sw	ra,28(sp)
c000488c:	00912a23          	sw	s1,20(sp)
c0004890:	00068913          	mv	s2,a3
c0004894:	981ff0ef          	jal	ra,c0004214 <get_pte>
c0004898:	0c050a63          	beqz	a0,c000496c <page_insert+0x104>
c000489c:	00042703          	lw	a4,0(s0)
c00048a0:	00050493          	mv	s1,a0
c00048a4:	00170793          	addi	a5,a4,1
c00048a8:	00f42023          	sw	a5,0(s0)
c00048ac:	00052783          	lw	a5,0(a0)
c00048b0:	0017f693          	andi	a3,a5,1
c00048b4:	04069863          	bnez	a3,c0004904 <page_insert+0x9c>
c00048b8:	00041697          	auipc	a3,0x41
c00048bc:	1506a683          	lw	a3,336(a3) # c0045a08 <pages>
c00048c0:	40d40433          	sub	s0,s0,a3
c00048c4:	40545413          	srai	s0,s0,0x5
c00048c8:	000806b7          	lui	a3,0x80
c00048cc:	00d40433          	add	s0,s0,a3
c00048d0:	00a41413          	slli	s0,s0,0xa
c00048d4:	00196693          	ori	a3,s2,1
c00048d8:	00d466b3          	or	a3,s0,a3
c00048dc:	00d4a023          	sw	a3,0(s1) # ffc00000 <sbi_remote_fence_i+0xffc00710>
c00048e0:	10498073          	sfence.vm	s3
c00048e4:	00000513          	li	a0,0
c00048e8:	01c12083          	lw	ra,28(sp)
c00048ec:	01812403          	lw	s0,24(sp)
c00048f0:	01412483          	lw	s1,20(sp)
c00048f4:	01012903          	lw	s2,16(sp)
c00048f8:	00c12983          	lw	s3,12(sp)
c00048fc:	02010113          	addi	sp,sp,32
c0004900:	00008067          	ret
c0004904:	00279793          	slli	a5,a5,0x2
c0004908:	00c7d793          	srli	a5,a5,0xc
c000490c:	00041697          	auipc	a3,0x41
c0004910:	0106a683          	lw	a3,16(a3) # c004591c <npage>
c0004914:	06d7f063          	bleu	a3,a5,c0004974 <page_insert+0x10c>
c0004918:	fff80537          	lui	a0,0xfff80
c000491c:	00a78533          	add	a0,a5,a0
c0004920:	00041697          	auipc	a3,0x41
c0004924:	0e86a683          	lw	a3,232(a3) # c0045a08 <pages>
c0004928:	00551513          	slli	a0,a0,0x5
c000492c:	00a68533          	add	a0,a3,a0
c0004930:	00a40e63          	beq	s0,a0,c000494c <page_insert+0xe4>
c0004934:	00052783          	lw	a5,0(a0) # fff80000 <sbi_remote_fence_i+0xfff80710>
c0004938:	fff78793          	addi	a5,a5,-1
c000493c:	00f52023          	sw	a5,0(a0)
c0004940:	00078a63          	beqz	a5,c0004954 <page_insert+0xec>
c0004944:	10498073          	sfence.vm	s3
c0004948:	f79ff06f          	j	c00048c0 <page_insert+0x58>
c000494c:	00e42023          	sw	a4,0(s0)
c0004950:	f71ff06f          	j	c00048c0 <page_insert+0x58>
c0004954:	00100593          	li	a1,1
c0004958:	801ff0ef          	jal	ra,c0004158 <free_pages>
c000495c:	00041697          	auipc	a3,0x41
c0004960:	0ac6a683          	lw	a3,172(a3) # c0045a08 <pages>
c0004964:	10498073          	sfence.vm	s3
c0004968:	f59ff06f          	j	c00048c0 <page_insert+0x58>
c000496c:	ffc00513          	li	a0,-4
c0004970:	f79ff06f          	j	c00048e8 <page_insert+0x80>
c0004974:	f10ff0ef          	jal	ra,c0004084 <pa2page.part.6>

c0004978 <copy_range>:
c0004978:	fc010113          	addi	sp,sp,-64
c000497c:	00d667b3          	or	a5,a2,a3
c0004980:	02112e23          	sw	ra,60(sp)
c0004984:	02812c23          	sw	s0,56(sp)
c0004988:	02912a23          	sw	s1,52(sp)
c000498c:	03212823          	sw	s2,48(sp)
c0004990:	03312623          	sw	s3,44(sp)
c0004994:	03412423          	sw	s4,40(sp)
c0004998:	03512223          	sw	s5,36(sp)
c000499c:	03612023          	sw	s6,32(sp)
c00049a0:	01712e23          	sw	s7,28(sp)
c00049a4:	01812c23          	sw	s8,24(sp)
c00049a8:	01912a23          	sw	s9,20(sp)
c00049ac:	01a12823          	sw	s10,16(sp)
c00049b0:	01b12623          	sw	s11,12(sp)
c00049b4:	01479713          	slli	a4,a5,0x14
c00049b8:	24071c63          	bnez	a4,c0004c10 <copy_range+0x298>
c00049bc:	002007b7          	lui	a5,0x200
c00049c0:	00060413          	mv	s0,a2
c00049c4:	1ef66863          	bltu	a2,a5,c0004bb4 <copy_range+0x23c>
c00049c8:	00068493          	mv	s1,a3
c00049cc:	1ed67463          	bleu	a3,a2,c0004bb4 <copy_range+0x23c>
c00049d0:	b00007b7          	lui	a5,0xb0000
c00049d4:	1ed7e063          	bltu	a5,a3,c0004bb4 <copy_range+0x23c>
c00049d8:	00100a37          	lui	s4,0x100
c00049dc:	00050b13          	mv	s6,a0
c00049e0:	00058993          	mv	s3,a1
c00049e4:	00001937          	lui	s2,0x1
c00049e8:	00100a93          	li	s5,1
c00049ec:	fff80cb7          	lui	s9,0xfff80
c00049f0:	00080bb7          	lui	s7,0x80
c00049f4:	fffa0a13          	addi	s4,s4,-1 # fffff <_binary_obj___user_matrix_out_size+0xfd6b7>
c00049f8:	00000613          	li	a2,0
c00049fc:	00040593          	mv	a1,s0
c0004a00:	00098513          	mv	a0,s3
c0004a04:	811ff0ef          	jal	ra,c0004214 <get_pte>
c0004a08:	00050c13          	mv	s8,a0
c0004a0c:	14050463          	beqz	a0,c0004b54 <copy_range+0x1dc>
c0004a10:	00052783          	lw	a5,0(a0)
c0004a14:	0017f793          	andi	a5,a5,1
c0004a18:	04079663          	bnez	a5,c0004a64 <copy_range+0xec>
c0004a1c:	01240433          	add	s0,s0,s2
c0004a20:	fc946ce3          	bltu	s0,s1,c00049f8 <copy_range+0x80>
c0004a24:	00000513          	li	a0,0
c0004a28:	03c12083          	lw	ra,60(sp)
c0004a2c:	03812403          	lw	s0,56(sp)
c0004a30:	03412483          	lw	s1,52(sp)
c0004a34:	03012903          	lw	s2,48(sp)
c0004a38:	02c12983          	lw	s3,44(sp)
c0004a3c:	02812a03          	lw	s4,40(sp)
c0004a40:	02412a83          	lw	s5,36(sp)
c0004a44:	02012b03          	lw	s6,32(sp)
c0004a48:	01c12b83          	lw	s7,28(sp)
c0004a4c:	01812c03          	lw	s8,24(sp)
c0004a50:	01412c83          	lw	s9,20(sp)
c0004a54:	01012d03          	lw	s10,16(sp)
c0004a58:	00c12d83          	lw	s11,12(sp)
c0004a5c:	04010113          	addi	sp,sp,64
c0004a60:	00008067          	ret
c0004a64:	000a8613          	mv	a2,s5
c0004a68:	00040593          	mv	a1,s0
c0004a6c:	000b0513          	mv	a0,s6
c0004a70:	fa4ff0ef          	jal	ra,c0004214 <get_pte>
c0004a74:	0e050e63          	beqz	a0,c0004b70 <copy_range+0x1f8>
c0004a78:	000c2783          	lw	a5,0(s8)
c0004a7c:	0017f713          	andi	a4,a5,1
c0004a80:	01f7fc13          	andi	s8,a5,31
c0004a84:	16070a63          	beqz	a4,c0004bf8 <copy_range+0x280>
c0004a88:	00279793          	slli	a5,a5,0x2
c0004a8c:	00c7d793          	srli	a5,a5,0xc
c0004a90:	00041717          	auipc	a4,0x41
c0004a94:	e8c72703          	lw	a4,-372(a4) # c004591c <npage>
c0004a98:	14e7fe63          	bleu	a4,a5,c0004bf4 <copy_range+0x27c>
c0004a9c:	019787b3          	add	a5,a5,s9
c0004aa0:	00579713          	slli	a4,a5,0x5
c0004aa4:	000a8513          	mv	a0,s5
c0004aa8:	00041797          	auipc	a5,0x41
c0004aac:	f607a783          	lw	a5,-160(a5) # c0045a08 <pages>
c0004ab0:	00e78db3          	add	s11,a5,a4
c0004ab4:	df0ff0ef          	jal	ra,c00040a4 <alloc_pages>
c0004ab8:	00050d13          	mv	s10,a0
c0004abc:	0c0d8c63          	beqz	s11,c0004b94 <copy_range+0x21c>
c0004ac0:	10050a63          	beqz	a0,c0004bd4 <copy_range+0x25c>
c0004ac4:	00041717          	auipc	a4,0x41
c0004ac8:	f4472703          	lw	a4,-188(a4) # c0045a08 <pages>
c0004acc:	40ed86b3          	sub	a3,s11,a4
c0004ad0:	4056d693          	srai	a3,a3,0x5
c0004ad4:	017686b3          	add	a3,a3,s7
c0004ad8:	0146f7b3          	and	a5,a3,s4
c0004adc:	00041617          	auipc	a2,0x41
c0004ae0:	e4062603          	lw	a2,-448(a2) # c004591c <npage>
c0004ae4:	00c69693          	slli	a3,a3,0xc
c0004ae8:	08c7fa63          	bleu	a2,a5,c0004b7c <copy_range+0x204>
c0004aec:	40e507b3          	sub	a5,a0,a4
c0004af0:	4057d793          	srai	a5,a5,0x5
c0004af4:	017787b3          	add	a5,a5,s7
c0004af8:	00041517          	auipc	a0,0x41
c0004afc:	f0852503          	lw	a0,-248(a0) # c0045a00 <va_pa_offset>
c0004b00:	0147f733          	and	a4,a5,s4
c0004b04:	00a685b3          	add	a1,a3,a0
c0004b08:	00c79793          	slli	a5,a5,0xc
c0004b0c:	06c77663          	bleu	a2,a4,c0004b78 <copy_range+0x200>
c0004b10:	00090613          	mv	a2,s2
c0004b14:	00a78533          	add	a0,a5,a0
c0004b18:	40d070ef          	jal	ra,c000c724 <memcpy>
c0004b1c:	000c0693          	mv	a3,s8
c0004b20:	00040613          	mv	a2,s0
c0004b24:	000d0593          	mv	a1,s10
c0004b28:	000b0513          	mv	a0,s6
c0004b2c:	d3dff0ef          	jal	ra,c0004868 <page_insert>
c0004b30:	ee0506e3          	beqz	a0,c0004a1c <copy_range+0xa4>
c0004b34:	00009697          	auipc	a3,0x9
c0004b38:	7fc68693          	addi	a3,a3,2044 # c000e330 <default_pmm_manager+0x78>
c0004b3c:	00008617          	auipc	a2,0x8
c0004b40:	73860613          	addi	a2,a2,1848 # c000d274 <commands+0x3d8>
c0004b44:	1b100593          	li	a1,433
c0004b48:	00009517          	auipc	a0,0x9
c0004b4c:	7f450513          	addi	a0,a0,2036 # c000e33c <default_pmm_manager+0x84>
c0004b50:	f00fb0ef          	jal	ra,c0000250 <__panic>
c0004b54:	004007b7          	lui	a5,0x400
c0004b58:	00f40433          	add	s0,s0,a5
c0004b5c:	ffc007b7          	lui	a5,0xffc00
c0004b60:	00f47433          	and	s0,s0,a5
c0004b64:	ec0400e3          	beqz	s0,c0004a24 <copy_range+0xac>
c0004b68:	e89468e3          	bltu	s0,s1,c00049f8 <copy_range+0x80>
c0004b6c:	eb9ff06f          	j	c0004a24 <copy_range+0xac>
c0004b70:	ffc00513          	li	a0,-4
c0004b74:	eb5ff06f          	j	c0004a28 <copy_range+0xb0>
c0004b78:	00078693          	mv	a3,a5
c0004b7c:	00009617          	auipc	a2,0x9
c0004b80:	fdc60613          	addi	a2,a2,-36 # c000db58 <commands+0xcbc>
c0004b84:	06800593          	li	a1,104
c0004b88:	00009517          	auipc	a0,0x9
c0004b8c:	d8850513          	addi	a0,a0,-632 # c000d910 <commands+0xa74>
c0004b90:	ec0fb0ef          	jal	ra,c0000250 <__panic>
c0004b94:	00009697          	auipc	a3,0x9
c0004b98:	77c68693          	addi	a3,a3,1916 # c000e310 <default_pmm_manager+0x58>
c0004b9c:	00008617          	auipc	a2,0x8
c0004ba0:	6d860613          	addi	a2,a2,1752 # c000d274 <commands+0x3d8>
c0004ba4:	19600593          	li	a1,406
c0004ba8:	00009517          	auipc	a0,0x9
c0004bac:	79450513          	addi	a0,a0,1940 # c000e33c <default_pmm_manager+0x84>
c0004bb0:	ea0fb0ef          	jal	ra,c0000250 <__panic>
c0004bb4:	0000a697          	auipc	a3,0xa
c0004bb8:	dbc68693          	addi	a3,a3,-580 # c000e970 <default_pmm_manager+0x6b8>
c0004bbc:	00008617          	auipc	a2,0x8
c0004bc0:	6b860613          	addi	a2,a2,1720 # c000d274 <commands+0x3d8>
c0004bc4:	18200593          	li	a1,386
c0004bc8:	00009517          	auipc	a0,0x9
c0004bcc:	77450513          	addi	a0,a0,1908 # c000e33c <default_pmm_manager+0x84>
c0004bd0:	e80fb0ef          	jal	ra,c0000250 <__panic>
c0004bd4:	00009697          	auipc	a3,0x9
c0004bd8:	74c68693          	addi	a3,a3,1868 # c000e320 <default_pmm_manager+0x68>
c0004bdc:	00008617          	auipc	a2,0x8
c0004be0:	69860613          	addi	a2,a2,1688 # c000d274 <commands+0x3d8>
c0004be4:	19700593          	li	a1,407
c0004be8:	00009517          	auipc	a0,0x9
c0004bec:	75450513          	addi	a0,a0,1876 # c000e33c <default_pmm_manager+0x84>
c0004bf0:	e60fb0ef          	jal	ra,c0000250 <__panic>
c0004bf4:	c90ff0ef          	jal	ra,c0004084 <pa2page.part.6>
c0004bf8:	00009617          	auipc	a2,0x9
c0004bfc:	24860613          	addi	a2,a2,584 # c000de40 <commands+0xfa4>
c0004c00:	07300593          	li	a1,115
c0004c04:	00009517          	auipc	a0,0x9
c0004c08:	d0c50513          	addi	a0,a0,-756 # c000d910 <commands+0xa74>
c0004c0c:	e44fb0ef          	jal	ra,c0000250 <__panic>
c0004c10:	0000a697          	auipc	a3,0xa
c0004c14:	d3468693          	addi	a3,a3,-716 # c000e944 <default_pmm_manager+0x68c>
c0004c18:	00008617          	auipc	a2,0x8
c0004c1c:	65c60613          	addi	a2,a2,1628 # c000d274 <commands+0x3d8>
c0004c20:	18100593          	li	a1,385
c0004c24:	00009517          	auipc	a0,0x9
c0004c28:	71850513          	addi	a0,a0,1816 # c000e33c <default_pmm_manager+0x84>
c0004c2c:	e24fb0ef          	jal	ra,c0000250 <__panic>

c0004c30 <tlb_invalidate>:
c0004c30:	10458073          	sfence.vm	a1
c0004c34:	00008067          	ret

c0004c38 <pgdir_alloc_page>:
c0004c38:	fe010113          	addi	sp,sp,-32
c0004c3c:	01212823          	sw	s2,16(sp)
c0004c40:	00050913          	mv	s2,a0
c0004c44:	00100513          	li	a0,1
c0004c48:	00812c23          	sw	s0,24(sp)
c0004c4c:	00912a23          	sw	s1,20(sp)
c0004c50:	01312623          	sw	s3,12(sp)
c0004c54:	00112e23          	sw	ra,28(sp)
c0004c58:	00058493          	mv	s1,a1
c0004c5c:	00060993          	mv	s3,a2
c0004c60:	c44ff0ef          	jal	ra,c00040a4 <alloc_pages>
c0004c64:	00050413          	mv	s0,a0
c0004c68:	04050a63          	beqz	a0,c0004cbc <pgdir_alloc_page+0x84>
c0004c6c:	00050593          	mv	a1,a0
c0004c70:	00098693          	mv	a3,s3
c0004c74:	00048613          	mv	a2,s1
c0004c78:	00090513          	mv	a0,s2
c0004c7c:	bedff0ef          	jal	ra,c0004868 <page_insert>
c0004c80:	06051e63          	bnez	a0,c0004cfc <pgdir_alloc_page+0xc4>
c0004c84:	00041797          	auipc	a5,0x41
c0004c88:	c907a783          	lw	a5,-880(a5) # c0045914 <swap_init_ok>
c0004c8c:	02078863          	beqz	a5,c0004cbc <pgdir_alloc_page+0x84>
c0004c90:	00041517          	auipc	a0,0x41
c0004c94:	cb852503          	lw	a0,-840(a0) # c0045948 <check_mm_struct>
c0004c98:	02050263          	beqz	a0,c0004cbc <pgdir_alloc_page+0x84>
c0004c9c:	00000693          	li	a3,0
c0004ca0:	00040613          	mv	a2,s0
c0004ca4:	00048593          	mv	a1,s1
c0004ca8:	b80fe0ef          	jal	ra,c0003028 <swap_map_swappable>
c0004cac:	00042703          	lw	a4,0(s0)
c0004cb0:	00942e23          	sw	s1,28(s0)
c0004cb4:	00100793          	li	a5,1
c0004cb8:	02f71263          	bne	a4,a5,c0004cdc <pgdir_alloc_page+0xa4>
c0004cbc:	01c12083          	lw	ra,28(sp)
c0004cc0:	00040513          	mv	a0,s0
c0004cc4:	01412483          	lw	s1,20(sp)
c0004cc8:	01812403          	lw	s0,24(sp)
c0004ccc:	01012903          	lw	s2,16(sp)
c0004cd0:	00c12983          	lw	s3,12(sp)
c0004cd4:	02010113          	addi	sp,sp,32
c0004cd8:	00008067          	ret
c0004cdc:	00009697          	auipc	a3,0x9
c0004ce0:	67068693          	addi	a3,a3,1648 # c000e34c <default_pmm_manager+0x94>
c0004ce4:	00008617          	auipc	a2,0x8
c0004ce8:	59060613          	addi	a2,a2,1424 # c000d274 <commands+0x3d8>
c0004cec:	1f100593          	li	a1,497
c0004cf0:	00009517          	auipc	a0,0x9
c0004cf4:	64c50513          	addi	a0,a0,1612 # c000e33c <default_pmm_manager+0x84>
c0004cf8:	d58fb0ef          	jal	ra,c0000250 <__panic>
c0004cfc:	00040513          	mv	a0,s0
c0004d00:	00100593          	li	a1,1
c0004d04:	c54ff0ef          	jal	ra,c0004158 <free_pages>
c0004d08:	00000413          	li	s0,0
c0004d0c:	fb1ff06f          	j	c0004cbc <pgdir_alloc_page+0x84>

c0004d10 <print_pgdir>:
c0004d10:	fa010113          	addi	sp,sp,-96
c0004d14:	0000a517          	auipc	a0,0xa
c0004d18:	b8450513          	addi	a0,a0,-1148 # c000e898 <default_pmm_manager+0x5e0>
c0004d1c:	05212823          	sw	s2,80(sp)
c0004d20:	04112e23          	sw	ra,92(sp)
c0004d24:	04812c23          	sw	s0,88(sp)
c0004d28:	04912a23          	sw	s1,84(sp)
c0004d2c:	05312623          	sw	s3,76(sp)
c0004d30:	05412423          	sw	s4,72(sp)
c0004d34:	05512223          	sw	s5,68(sp)
c0004d38:	05612023          	sw	s6,64(sp)
c0004d3c:	03712e23          	sw	s7,60(sp)
c0004d40:	03812c23          	sw	s8,56(sp)
c0004d44:	03912a23          	sw	s9,52(sp)
c0004d48:	03a12823          	sw	s10,48(sp)
c0004d4c:	03b12623          	sw	s11,44(sp)
c0004d50:	b8cfb0ef          	jal	ra,c00000dc <cprintf>
c0004d54:	00000593          	li	a1,0
c0004d58:	00012a23          	sw	zero,20(sp)
c0004d5c:	02d00913          	li	s2,45
c0004d60:	01410713          	addi	a4,sp,20
c0004d64:	01010693          	addi	a3,sp,16
c0004d68:	fafec637          	lui	a2,0xfafec
c0004d6c:	40000513          	li	a0,1024
c0004d70:	a68ff0ef          	jal	ra,c0003fd8 <get_pgtable_items.isra.4.part.5>
c0004d74:	00050413          	mv	s0,a0
c0004d78:	08050263          	beqz	a0,c0004dfc <print_pgdir+0xec>
c0004d7c:	01412583          	lw	a1,20(sp)
c0004d80:	01012783          	lw	a5,16(sp)
c0004d84:	01047513          	andi	a0,s0,16
c0004d88:	01659693          	slli	a3,a1,0x16
c0004d8c:	40f585b3          	sub	a1,a1,a5
c0004d90:	01679613          	slli	a2,a5,0x16
c0004d94:	01659713          	slli	a4,a1,0x16
c0004d98:	00090313          	mv	t1,s2
c0004d9c:	00050463          	beqz	a0,c0004da4 <print_pgdir+0x94>
c0004da0:	07500313          	li	t1,117
c0004da4:	00041b17          	auipc	s6,0x41
c0004da8:	b7cb0b13          	addi	s6,s6,-1156 # c0045920 <str.1990>
c0004dac:	07200793          	li	a5,114
c0004db0:	006b0023          	sb	t1,0(s6)
c0004db4:	00fb00a3          	sb	a5,1(s6)
c0004db8:	00447793          	andi	a5,s0,4
c0004dbc:	00090313          	mv	t1,s2
c0004dc0:	00078463          	beqz	a5,c0004dc8 <print_pgdir+0xb8>
c0004dc4:	07700313          	li	t1,119
c0004dc8:	00041797          	auipc	a5,0x41
c0004dcc:	b5878793          	addi	a5,a5,-1192 # c0045920 <str.1990>
c0004dd0:	0000a517          	auipc	a0,0xa
c0004dd4:	afc50513          	addi	a0,a0,-1284 # c000e8cc <default_pmm_manager+0x614>
c0004dd8:	006b0123          	sb	t1,2(s6)
c0004ddc:	000b01a3          	sb	zero,3(s6)
c0004de0:	afcfb0ef          	jal	ra,c00000dc <cprintf>
c0004de4:	00f47413          	andi	s0,s0,15
c0004de8:	00100793          	li	a5,1
c0004dec:	04f40c63          	beq	s0,a5,c0004e44 <print_pgdir+0x134>
c0004df0:	01412583          	lw	a1,20(sp)
c0004df4:	3ff00793          	li	a5,1023
c0004df8:	f6b7f4e3          	bleu	a1,a5,c0004d60 <print_pgdir+0x50>
c0004dfc:	0000a517          	auipc	a0,0xa
c0004e00:	b1450513          	addi	a0,a0,-1260 # c000e910 <default_pmm_manager+0x658>
c0004e04:	ad8fb0ef          	jal	ra,c00000dc <cprintf>
c0004e08:	05c12083          	lw	ra,92(sp)
c0004e0c:	05812403          	lw	s0,88(sp)
c0004e10:	05412483          	lw	s1,84(sp)
c0004e14:	05012903          	lw	s2,80(sp)
c0004e18:	04c12983          	lw	s3,76(sp)
c0004e1c:	04812a03          	lw	s4,72(sp)
c0004e20:	04412a83          	lw	s5,68(sp)
c0004e24:	04012b03          	lw	s6,64(sp)
c0004e28:	03c12b83          	lw	s7,60(sp)
c0004e2c:	03812c03          	lw	s8,56(sp)
c0004e30:	03412c83          	lw	s9,52(sp)
c0004e34:	03012d03          	lw	s10,48(sp)
c0004e38:	02c12d83          	lw	s11,44(sp)
c0004e3c:	06010113          	addi	sp,sp,96
c0004e40:	00008067          	ret
c0004e44:	01012783          	lw	a5,16(sp)
c0004e48:	00000413          	li	s0,0
c0004e4c:	00a79c93          	slli	s9,a5,0xa
c0004e50:	00c79313          	slli	t1,a5,0xc
c0004e54:	00279d93          	slli	s11,a5,0x2
c0004e58:	00f12623          	sw	a5,12(sp)
c0004e5c:	fafec7b7          	lui	a5,0xfafec
c0004e60:	01912e23          	sw	s9,28(sp)
c0004e64:	40600ab3          	neg	s5,t1
c0004e68:	400c8c93          	addi	s9,s9,1024 # fff80400 <sbi_remote_fence_i+0xfff80b10>
c0004e6c:	00fd8db3          	add	s11,s11,a5
c0004e70:	0140006f          	j	c0004e84 <print_pgdir+0x174>
c0004e74:	fffff7b7          	lui	a5,0xfffff
c0004e78:	00fa8ab3          	add	s5,s5,a5
c0004e7c:	400c8c93          	addi	s9,s9,1024
c0004e80:	004d8d93          	addi	s11,s11,4
c0004e84:	01412583          	lw	a1,20(sp)
c0004e88:	00c12783          	lw	a5,12(sp)
c0004e8c:	10b7fa63          	bleu	a1,a5,c0004fa0 <print_pgdir+0x290>
c0004e90:	00178793          	addi	a5,a5,1 # fffff001 <sbi_remote_fence_i+0xfffff711>
c0004e94:	00f12623          	sw	a5,12(sp)
c0004e98:	000da783          	lw	a5,0(s11)
c0004e9c:	fffff4b7          	lui	s1,0xfffff
c0004ea0:	00041717          	auipc	a4,0x41
c0004ea4:	a7c72703          	lw	a4,-1412(a4) # c004591c <npage>
c0004ea8:	00279793          	slli	a5,a5,0x2
c0004eac:	0097f7b3          	and	a5,a5,s1
c0004eb0:	00c7d693          	srli	a3,a5,0xc
c0004eb4:	01c12583          	lw	a1,28(sp)
c0004eb8:	07700a13          	li	s4,119
c0004ebc:	00041997          	auipc	s3,0x41
c0004ec0:	a6498993          	addi	s3,s3,-1436 # c0045920 <str.1990>
c0004ec4:	0ae6fc63          	bleu	a4,a3,c0004f7c <print_pgdir+0x26c>
c0004ec8:	fb95f6e3          	bleu	s9,a1,c0004e74 <print_pgdir+0x164>
c0004ecc:	00041697          	auipc	a3,0x41
c0004ed0:	b346a683          	lw	a3,-1228(a3) # c0045a00 <va_pa_offset>
c0004ed4:	00d787b3          	add	a5,a5,a3
c0004ed8:	01c10713          	addi	a4,sp,28
c0004edc:	01810693          	addi	a3,sp,24
c0004ee0:	01578633          	add	a2,a5,s5
c0004ee4:	000c8513          	mv	a0,s9
c0004ee8:	8f0ff0ef          	jal	ra,c0003fd8 <get_pgtable_items.isra.4.part.5>
c0004eec:	00050d13          	mv	s10,a0
c0004ef0:	f80502e3          	beqz	a0,c0004e74 <print_pgdir+0x164>
c0004ef4:	0aa40263          	beq	s0,a0,c0004f98 <print_pgdir+0x288>
c0004ef8:	04040c63          	beqz	s0,c0004f50 <print_pgdir+0x240>
c0004efc:	417c05b3          	sub	a1,s8,s7
c0004f00:	01047793          	andi	a5,s0,16
c0004f04:	00cb9613          	slli	a2,s7,0xc
c0004f08:	00cc1693          	slli	a3,s8,0xc
c0004f0c:	00c59713          	slli	a4,a1,0xc
c0004f10:	00090513          	mv	a0,s2
c0004f14:	00078463          	beqz	a5,c0004f1c <print_pgdir+0x20c>
c0004f18:	07500513          	li	a0,117
c0004f1c:	07200793          	li	a5,114
c0004f20:	00ab0023          	sb	a0,0(s6)
c0004f24:	00fb00a3          	sb	a5,1(s6)
c0004f28:	00447413          	andi	s0,s0,4
c0004f2c:	000a0e13          	mv	t3,s4
c0004f30:	00041463          	bnez	s0,c0004f38 <print_pgdir+0x228>
c0004f34:	00090e13          	mv	t3,s2
c0004f38:	00098793          	mv	a5,s3
c0004f3c:	0000a517          	auipc	a0,0xa
c0004f40:	9b050513          	addi	a0,a0,-1616 # c000e8ec <default_pmm_manager+0x634>
c0004f44:	01cb0123          	sb	t3,2(s6)
c0004f48:	000b01a3          	sb	zero,3(s6)
c0004f4c:	990fb0ef          	jal	ra,c00000dc <cprintf>
c0004f50:	01812b83          	lw	s7,24(sp)
c0004f54:	01c12c03          	lw	s8,28(sp)
c0004f58:	000da783          	lw	a5,0(s11)
c0004f5c:	00041717          	auipc	a4,0x41
c0004f60:	9c072703          	lw	a4,-1600(a4) # c004591c <npage>
c0004f64:	000c0593          	mv	a1,s8
c0004f68:	00279793          	slli	a5,a5,0x2
c0004f6c:	0097f7b3          	and	a5,a5,s1
c0004f70:	00c7d693          	srli	a3,a5,0xc
c0004f74:	000d0413          	mv	s0,s10
c0004f78:	f4e6e8e3          	bltu	a3,a4,c0004ec8 <print_pgdir+0x1b8>
c0004f7c:	00078693          	mv	a3,a5
c0004f80:	00009617          	auipc	a2,0x9
c0004f84:	bd860613          	addi	a2,a2,-1064 # c000db58 <commands+0xcbc>
c0004f88:	2a400593          	li	a1,676
c0004f8c:	00009517          	auipc	a0,0x9
c0004f90:	3b050513          	addi	a0,a0,944 # c000e33c <default_pmm_manager+0x84>
c0004f94:	abcfb0ef          	jal	ra,c0000250 <__panic>
c0004f98:	01c12c03          	lw	s8,28(sp)
c0004f9c:	fbdff06f          	j	c0004f58 <print_pgdir+0x248>
c0004fa0:	e4040ae3          	beqz	s0,c0004df4 <print_pgdir+0xe4>
c0004fa4:	417c05b3          	sub	a1,s8,s7
c0004fa8:	01047793          	andi	a5,s0,16
c0004fac:	00cb9613          	slli	a2,s7,0xc
c0004fb0:	00cc1693          	slli	a3,s8,0xc
c0004fb4:	00c59713          	slli	a4,a1,0xc
c0004fb8:	00090513          	mv	a0,s2
c0004fbc:	00078463          	beqz	a5,c0004fc4 <print_pgdir+0x2b4>
c0004fc0:	07500513          	li	a0,117
c0004fc4:	07200793          	li	a5,114
c0004fc8:	00ab0023          	sb	a0,0(s6)
c0004fcc:	00fb00a3          	sb	a5,1(s6)
c0004fd0:	00447413          	andi	s0,s0,4
c0004fd4:	00090313          	mv	t1,s2
c0004fd8:	00040463          	beqz	s0,c0004fe0 <print_pgdir+0x2d0>
c0004fdc:	07700313          	li	t1,119
c0004fe0:	00041797          	auipc	a5,0x41
c0004fe4:	94078793          	addi	a5,a5,-1728 # c0045920 <str.1990>
c0004fe8:	0000a517          	auipc	a0,0xa
c0004fec:	90450513          	addi	a0,a0,-1788 # c000e8ec <default_pmm_manager+0x634>
c0004ff0:	006b0123          	sb	t1,2(s6)
c0004ff4:	000b01a3          	sb	zero,3(s6)
c0004ff8:	8e4fb0ef          	jal	ra,c00000dc <cprintf>
c0004ffc:	df5ff06f          	j	c0004df0 <print_pgdir+0xe0>

c0005000 <pmm_init>:
c0005000:	fe010113          	addi	sp,sp,-32
c0005004:	00009597          	auipc	a1,0x9
c0005008:	2b45a583          	lw	a1,692(a1) # c000e2b8 <default_pmm_manager>
c000500c:	00009797          	auipc	a5,0x9
c0005010:	2ac78793          	addi	a5,a5,684 # c000e2b8 <default_pmm_manager>
c0005014:	00009517          	auipc	a0,0x9
c0005018:	34c50513          	addi	a0,a0,844 # c000e360 <default_pmm_manager+0xa8>
c000501c:	00112e23          	sw	ra,28(sp)
c0005020:	00812c23          	sw	s0,24(sp)
c0005024:	00912a23          	sw	s1,20(sp)
c0005028:	01212823          	sw	s2,16(sp)
c000502c:	00041297          	auipc	t0,0x41
c0005030:	9cf2a823          	sw	a5,-1584(t0) # c00459fc <pmm_manager>
c0005034:	8a8fb0ef          	jal	ra,c00000dc <cprintf>
c0005038:	00041797          	auipc	a5,0x41
c000503c:	9c47a783          	lw	a5,-1596(a5) # c00459fc <pmm_manager>
c0005040:	0047a783          	lw	a5,4(a5)
c0005044:	000780e7          	jalr	a5
c0005048:	3fffa317          	auipc	t1,0x3fffa
c000504c:	7b8300e7          	jalr	1976(t1) # fffff800 <sbi_hart_id>
c0005050:	00410593          	addi	a1,sp,4
c0005054:	3fffa317          	auipc	t1,0x3fffa
c0005058:	7cc300e7          	jalr	1996(t1) # fffff820 <sbi_query_memory>
c000505c:	32051ce3          	bnez	a0,c0005b94 <pmm_init+0xb94>
c0005060:	00412483          	lw	s1,4(sp)
c0005064:	00812903          	lw	s2,8(sp)
c0005068:	c00007b7          	lui	a5,0xc0000
c000506c:	409787b3          	sub	a5,a5,s1
c0005070:	00009517          	auipc	a0,0x9
c0005074:	33450513          	addi	a0,a0,820 # c000e3a4 <default_pmm_manager+0xec>
c0005078:	00041297          	auipc	t0,0x41
c000507c:	98f2a423          	sw	a5,-1656(t0) # c0045a00 <va_pa_offset>
c0005080:	01248433          	add	s0,s1,s2
c0005084:	858fb0ef          	jal	ra,c00000dc <cprintf>
c0005088:	00048613          	mv	a2,s1
c000508c:	fff40693          	addi	a3,s0,-1
c0005090:	00090593          	mv	a1,s2
c0005094:	00009517          	auipc	a0,0x9
c0005098:	32850513          	addi	a0,a0,808 # c000e3bc <default_pmm_manager+0x104>
c000509c:	840fb0ef          	jal	ra,c00000dc <cprintf>
c00050a0:	f80007b7          	lui	a5,0xf8000
c00050a4:	00040613          	mv	a2,s0
c00050a8:	0087f463          	bleu	s0,a5,c00050b0 <pmm_init+0xb0>
c00050ac:	00078613          	mv	a2,a5
c00050b0:	00c65613          	srli	a2,a2,0xc
c00050b4:	00041297          	auipc	t0,0x41
c00050b8:	86c2a423          	sw	a2,-1944(t0) # c004591c <npage>
c00050bc:	180027f3          	csrr	a5,sptbr
c00050c0:	00100737          	lui	a4,0x100
c00050c4:	fff70713          	addi	a4,a4,-1 # fffff <_binary_obj___user_matrix_out_size+0xfd6b7>
c00050c8:	00e7f733          	and	a4,a5,a4
c00050cc:	00c79793          	slli	a5,a5,0xc
c00050d0:	3ec77ae3          	bleu	a2,a4,c0005cc4 <pmm_init+0xcc4>
c00050d4:	00041317          	auipc	t1,0x41
c00050d8:	92c32303          	lw	t1,-1748(t1) # c0045a00 <va_pa_offset>
c00050dc:	00002737          	lui	a4,0x2
c00050e0:	006787b3          	add	a5,a5,t1
c00050e4:	00e787b3          	add	a5,a5,a4
c00050e8:	00001737          	lui	a4,0x1
c00050ec:	fff70713          	addi	a4,a4,-1 # fff <_binary_obj___user_faultread_out_size-0x10a9>
c00050f0:	00e787b3          	add	a5,a5,a4
c00050f4:	fffff737          	lui	a4,0xfffff
c00050f8:	00e7f7b3          	and	a5,a5,a4
c00050fc:	00041297          	auipc	t0,0x41
c0005100:	90f2a623          	sw	a5,-1780(t0) # c0045a08 <pages>
c0005104:	000805b7          	lui	a1,0x80
c0005108:	68b60463          	beq	a2,a1,c0005790 <pmm_init+0x790>
c000510c:	00041817          	auipc	a6,0x41
c0005110:	81082803          	lw	a6,-2032(a6) # c004591c <npage>
c0005114:	00000713          	li	a4,0
c0005118:	00078513          	mv	a0,a5
c000511c:	00100893          	li	a7,1
c0005120:	40b805b3          	sub	a1,a6,a1
c0005124:	0080006f          	j	c000512c <pmm_init+0x12c>
c0005128:	00050793          	mv	a5,a0
c000512c:	00571693          	slli	a3,a4,0x5
c0005130:	00d787b3          	add	a5,a5,a3
c0005134:	00478793          	addi	a5,a5,4 # f8000004 <sbi_remote_fence_i+0xf8000714>
c0005138:	4117a02f          	amoor.w	zero,a7,(a5)
c000513c:	00170713          	addi	a4,a4,1 # fffff001 <sbi_remote_fence_i+0xfffff711>
c0005140:	00080613          	mv	a2,a6
c0005144:	feb762e3          	bltu	a4,a1,c0005128 <pmm_init+0x128>
c0005148:	07f806b7          	lui	a3,0x7f80
c000514c:	00d606b3          	add	a3,a2,a3
c0005150:	00569693          	slli	a3,a3,0x5
c0005154:	00d506b3          	add	a3,a0,a3
c0005158:	c00007b7          	lui	a5,0xc0000
c000515c:	3af6e2e3          	bltu	a3,a5,c0005d00 <pmm_init+0xd00>
c0005160:	fffff737          	lui	a4,0xfffff
c0005164:	406686b3          	sub	a3,a3,t1
c0005168:	00e47433          	and	s0,s0,a4
c000516c:	0486f263          	bleu	s0,a3,c00051b0 <pmm_init+0x1b0>
c0005170:	000017b7          	lui	a5,0x1
c0005174:	fff78793          	addi	a5,a5,-1 # fff <_binary_obj___user_faultread_out_size-0x10a9>
c0005178:	00f686b3          	add	a3,a3,a5
c000517c:	00c6d793          	srli	a5,a3,0xc
c0005180:	10c7f2e3          	bleu	a2,a5,c0005a84 <pmm_init+0xa84>
c0005184:	00e6f6b3          	and	a3,a3,a4
c0005188:	fff80737          	lui	a4,0xfff80
c000518c:	00e787b3          	add	a5,a5,a4
c0005190:	00041717          	auipc	a4,0x41
c0005194:	86c72703          	lw	a4,-1940(a4) # c00459fc <pmm_manager>
c0005198:	00872703          	lw	a4,8(a4)
c000519c:	40d406b3          	sub	a3,s0,a3
c00051a0:	00579793          	slli	a5,a5,0x5
c00051a4:	00c6d593          	srli	a1,a3,0xc
c00051a8:	00f50533          	add	a0,a0,a5
c00051ac:	000700e7          	jalr	a4
c00051b0:	00041797          	auipc	a5,0x41
c00051b4:	84c7a783          	lw	a5,-1972(a5) # c00459fc <pmm_manager>
c00051b8:	0187a783          	lw	a5,24(a5)
c00051bc:	000780e7          	jalr	a5
c00051c0:	00009517          	auipc	a0,0x9
c00051c4:	22450513          	addi	a0,a0,548 # c000e3e4 <default_pmm_manager+0x12c>
c00051c8:	f15fa0ef          	jal	ra,c00000dc <cprintf>
c00051cc:	00100513          	li	a0,1
c00051d0:	ed5fe0ef          	jal	ra,c00040a4 <alloc_pages>
c00051d4:	08050ce3          	beqz	a0,c0005a6c <pmm_init+0xa6c>
c00051d8:	00041797          	auipc	a5,0x41
c00051dc:	8307a783          	lw	a5,-2000(a5) # c0045a08 <pages>
c00051e0:	40f507b3          	sub	a5,a0,a5
c00051e4:	00080737          	lui	a4,0x80
c00051e8:	4057d793          	srai	a5,a5,0x5
c00051ec:	00e787b3          	add	a5,a5,a4
c00051f0:	00100737          	lui	a4,0x100
c00051f4:	fff70713          	addi	a4,a4,-1 # fffff <_binary_obj___user_matrix_out_size+0xfd6b7>
c00051f8:	00e7f733          	and	a4,a5,a4
c00051fc:	00040697          	auipc	a3,0x40
c0005200:	7206a683          	lw	a3,1824(a3) # c004591c <npage>
c0005204:	00c79793          	slli	a5,a5,0xc
c0005208:	7cd77463          	bleu	a3,a4,c00059d0 <pmm_init+0x9d0>
c000520c:	00040717          	auipc	a4,0x40
c0005210:	7f472703          	lw	a4,2036(a4) # c0045a00 <va_pa_offset>
c0005214:	00e787b3          	add	a5,a5,a4
c0005218:	00078513          	mv	a0,a5
c000521c:	00001637          	lui	a2,0x1
c0005220:	00000593          	li	a1,0
c0005224:	00040297          	auipc	t0,0x40
c0005228:	6ef2aa23          	sw	a5,1780(t0) # c0045918 <boot_pgdir>
c000522c:	4dc070ef          	jal	ra,c000c708 <memset>
c0005230:	00040517          	auipc	a0,0x40
c0005234:	6e852503          	lw	a0,1768(a0) # c0045918 <boot_pgdir>
c0005238:	c00007b7          	lui	a5,0xc0000
c000523c:	76f56c63          	bltu	a0,a5,c00059b4 <pmm_init+0x9b4>
c0005240:	00040797          	auipc	a5,0x40
c0005244:	7c07a783          	lw	a5,1984(a5) # c0045a00 <va_pa_offset>
c0005248:	40f507b3          	sub	a5,a0,a5
c000524c:	00040297          	auipc	t0,0x40
c0005250:	7af2ac23          	sw	a5,1976(t0) # c0045a04 <boot_cr3>
c0005254:	00040717          	auipc	a4,0x40
c0005258:	6c872703          	lw	a4,1736(a4) # c004591c <npage>
c000525c:	000f87b7          	lui	a5,0xf8
c0005260:	7ee7e663          	bltu	a5,a4,c0005a4c <pmm_init+0xa4c>
c0005264:	7c050463          	beqz	a0,c0005a2c <pmm_init+0xa2c>
c0005268:	01451793          	slli	a5,a0,0x14
c000526c:	7c079063          	bnez	a5,c0005a2c <pmm_init+0xa2c>
c0005270:	00000613          	li	a2,0
c0005274:	00000593          	li	a1,0
c0005278:	a0cff0ef          	jal	ra,c0004484 <get_page>
c000527c:	78051863          	bnez	a0,c0005a0c <pmm_init+0xa0c>
c0005280:	00100513          	li	a0,1
c0005284:	e21fe0ef          	jal	ra,c00040a4 <alloc_pages>
c0005288:	00050493          	mv	s1,a0
c000528c:	00050593          	mv	a1,a0
c0005290:	00000693          	li	a3,0
c0005294:	00000613          	li	a2,0
c0005298:	00040517          	auipc	a0,0x40
c000529c:	68052503          	lw	a0,1664(a0) # c0045918 <boot_pgdir>
c00052a0:	dc8ff0ef          	jal	ra,c0004868 <page_insert>
c00052a4:	74051463          	bnez	a0,c00059ec <pmm_init+0x9ec>
c00052a8:	00000613          	li	a2,0
c00052ac:	00000593          	li	a1,0
c00052b0:	00040517          	auipc	a0,0x40
c00052b4:	66852503          	lw	a0,1640(a0) # c0045918 <boot_pgdir>
c00052b8:	f5dfe0ef          	jal	ra,c0004214 <get_pte>
c00052bc:	04050ee3          	beqz	a0,c0005b18 <pmm_init+0xb18>
c00052c0:	00052783          	lw	a5,0(a0)
c00052c4:	0017f713          	andi	a4,a5,1
c00052c8:	02070ce3          	beqz	a4,c0005b00 <pmm_init+0xb00>
c00052cc:	00279793          	slli	a5,a5,0x2
c00052d0:	00c7d793          	srli	a5,a5,0xc
c00052d4:	00040617          	auipc	a2,0x40
c00052d8:	64862603          	lw	a2,1608(a2) # c004591c <npage>
c00052dc:	7ac7f463          	bleu	a2,a5,c0005a84 <pmm_init+0xa84>
c00052e0:	fff80737          	lui	a4,0xfff80
c00052e4:	00e787b3          	add	a5,a5,a4
c00052e8:	00579793          	slli	a5,a5,0x5
c00052ec:	00040717          	auipc	a4,0x40
c00052f0:	71c72703          	lw	a4,1820(a4) # c0045a08 <pages>
c00052f4:	00f707b3          	add	a5,a4,a5
c00052f8:	7ef49463          	bne	s1,a5,c0005ae0 <pmm_init+0xae0>
c00052fc:	0004a903          	lw	s2,0(s1) # fffff000 <sbi_remote_fence_i+0xfffff710>
c0005300:	00100793          	li	a5,1
c0005304:	7af91e63          	bne	s2,a5,c0005ac0 <pmm_init+0xac0>
c0005308:	00040517          	auipc	a0,0x40
c000530c:	61052503          	lw	a0,1552(a0) # c0045918 <boot_pgdir>
c0005310:	00052683          	lw	a3,0(a0)
c0005314:	fffff7b7          	lui	a5,0xfffff
c0005318:	00269693          	slli	a3,a3,0x2
c000531c:	00f6f6b3          	and	a3,a3,a5
c0005320:	00c6d793          	srli	a5,a3,0xc
c0005324:	78c7f263          	bleu	a2,a5,c0005aa8 <pmm_init+0xaa8>
c0005328:	00040417          	auipc	s0,0x40
c000532c:	6d842403          	lw	s0,1752(s0) # c0045a00 <va_pa_offset>
c0005330:	008686b3          	add	a3,a3,s0
c0005334:	00000613          	li	a2,0
c0005338:	000015b7          	lui	a1,0x1
c000533c:	00468413          	addi	s0,a3,4
c0005340:	ed5fe0ef          	jal	ra,c0004214 <get_pte>
c0005344:	74a41263          	bne	s0,a0,c0005a88 <pmm_init+0xa88>
c0005348:	00090513          	mv	a0,s2
c000534c:	d59fe0ef          	jal	ra,c00040a4 <alloc_pages>
c0005350:	00050413          	mv	s0,a0
c0005354:	00050593          	mv	a1,a0
c0005358:	01400693          	li	a3,20
c000535c:	00001637          	lui	a2,0x1
c0005360:	00040517          	auipc	a0,0x40
c0005364:	5b852503          	lw	a0,1464(a0) # c0045918 <boot_pgdir>
c0005368:	d00ff0ef          	jal	ra,c0004868 <page_insert>
c000536c:	7e051663          	bnez	a0,c0005b58 <pmm_init+0xb58>
c0005370:	00000613          	li	a2,0
c0005374:	000015b7          	lui	a1,0x1
c0005378:	00040517          	auipc	a0,0x40
c000537c:	5a052503          	lw	a0,1440(a0) # c0045918 <boot_pgdir>
c0005380:	e95fe0ef          	jal	ra,c0004214 <get_pte>
c0005384:	7a050a63          	beqz	a0,c0005b38 <pmm_init+0xb38>
c0005388:	00052783          	lw	a5,0(a0)
c000538c:	0107f713          	andi	a4,a5,16
c0005390:	5c070263          	beqz	a4,c0005954 <pmm_init+0x954>
c0005394:	0047f793          	andi	a5,a5,4
c0005398:	58078e63          	beqz	a5,c0005934 <pmm_init+0x934>
c000539c:	00040517          	auipc	a0,0x40
c00053a0:	57c52503          	lw	a0,1404(a0) # c0045918 <boot_pgdir>
c00053a4:	00052783          	lw	a5,0(a0)
c00053a8:	0107f793          	andi	a5,a5,16
c00053ac:	56078463          	beqz	a5,c0005914 <pmm_init+0x914>
c00053b0:	00042903          	lw	s2,0(s0)
c00053b4:	00100793          	li	a5,1
c00053b8:	52f91e63          	bne	s2,a5,c00058f4 <pmm_init+0x8f4>
c00053bc:	00000693          	li	a3,0
c00053c0:	00001637          	lui	a2,0x1
c00053c4:	00048593          	mv	a1,s1
c00053c8:	ca0ff0ef          	jal	ra,c0004868 <page_insert>
c00053cc:	50051463          	bnez	a0,c00058d4 <pmm_init+0x8d4>
c00053d0:	0004a703          	lw	a4,0(s1)
c00053d4:	00200793          	li	a5,2
c00053d8:	4cf71e63          	bne	a4,a5,c00058b4 <pmm_init+0x8b4>
c00053dc:	00042783          	lw	a5,0(s0)
c00053e0:	4a079a63          	bnez	a5,c0005894 <pmm_init+0x894>
c00053e4:	00000613          	li	a2,0
c00053e8:	000015b7          	lui	a1,0x1
c00053ec:	00040517          	auipc	a0,0x40
c00053f0:	52c52503          	lw	a0,1324(a0) # c0045918 <boot_pgdir>
c00053f4:	e21fe0ef          	jal	ra,c0004214 <get_pte>
c00053f8:	46050e63          	beqz	a0,c0005874 <pmm_init+0x874>
c00053fc:	00052703          	lw	a4,0(a0)
c0005400:	00177793          	andi	a5,a4,1
c0005404:	6e078e63          	beqz	a5,c0005b00 <pmm_init+0xb00>
c0005408:	00271793          	slli	a5,a4,0x2
c000540c:	00c7d793          	srli	a5,a5,0xc
c0005410:	00040697          	auipc	a3,0x40
c0005414:	50c6a683          	lw	a3,1292(a3) # c004591c <npage>
c0005418:	66d7f663          	bleu	a3,a5,c0005a84 <pmm_init+0xa84>
c000541c:	fff806b7          	lui	a3,0xfff80
c0005420:	00d787b3          	add	a5,a5,a3
c0005424:	00579793          	slli	a5,a5,0x5
c0005428:	00040697          	auipc	a3,0x40
c000542c:	5e06a683          	lw	a3,1504(a3) # c0045a08 <pages>
c0005430:	00f687b3          	add	a5,a3,a5
c0005434:	42f49063          	bne	s1,a5,c0005854 <pmm_init+0x854>
c0005438:	01077713          	andi	a4,a4,16
c000543c:	3e071c63          	bnez	a4,c0005834 <pmm_init+0x834>
c0005440:	00000593          	li	a1,0
c0005444:	00040517          	auipc	a0,0x40
c0005448:	4d452503          	lw	a0,1236(a0) # c0045918 <boot_pgdir>
c000544c:	b70ff0ef          	jal	ra,c00047bc <page_remove>
c0005450:	0004a783          	lw	a5,0(s1)
c0005454:	3d279063          	bne	a5,s2,c0005814 <pmm_init+0x814>
c0005458:	00042783          	lw	a5,0(s0)
c000545c:	38079c63          	bnez	a5,c00057f4 <pmm_init+0x7f4>
c0005460:	000015b7          	lui	a1,0x1
c0005464:	00040517          	auipc	a0,0x40
c0005468:	4b452503          	lw	a0,1204(a0) # c0045918 <boot_pgdir>
c000546c:	b50ff0ef          	jal	ra,c00047bc <page_remove>
c0005470:	0004a783          	lw	a5,0(s1)
c0005474:	52079063          	bnez	a5,c0005994 <pmm_init+0x994>
c0005478:	00042783          	lw	a5,0(s0)
c000547c:	4e079c63          	bnez	a5,c0005974 <pmm_init+0x974>
c0005480:	00040797          	auipc	a5,0x40
c0005484:	4987a783          	lw	a5,1176(a5) # c0045918 <boot_pgdir>
c0005488:	0007a783          	lw	a5,0(a5)
c000548c:	00040717          	auipc	a4,0x40
c0005490:	49072703          	lw	a4,1168(a4) # c004591c <npage>
c0005494:	00279793          	slli	a5,a5,0x2
c0005498:	00c7d793          	srli	a5,a5,0xc
c000549c:	5ee7f463          	bleu	a4,a5,c0005a84 <pmm_init+0xa84>
c00054a0:	fff80737          	lui	a4,0xfff80
c00054a4:	00e787b3          	add	a5,a5,a4
c00054a8:	00579793          	slli	a5,a5,0x5
c00054ac:	00040517          	auipc	a0,0x40
c00054b0:	55c52503          	lw	a0,1372(a0) # c0045a08 <pages>
c00054b4:	00f50533          	add	a0,a0,a5
c00054b8:	00052583          	lw	a1,0(a0)
c00054bc:	00100793          	li	a5,1
c00054c0:	78f59263          	bne	a1,a5,c0005c44 <pmm_init+0xc44>
c00054c4:	c95fe0ef          	jal	ra,c0004158 <free_pages>
c00054c8:	00040797          	auipc	a5,0x40
c00054cc:	4507a783          	lw	a5,1104(a5) # c0045918 <boot_pgdir>
c00054d0:	0007a023          	sw	zero,0(a5)
c00054d4:	00009517          	auipc	a0,0x9
c00054d8:	1d450513          	addi	a0,a0,468 # c000e6a8 <default_pmm_manager+0x3f0>
c00054dc:	c01fa0ef          	jal	ra,c00000dc <cprintf>
c00054e0:	00040797          	auipc	a5,0x40
c00054e4:	5247a783          	lw	a5,1316(a5) # c0045a04 <boot_cr3>
c00054e8:	00c7d793          	srli	a5,a5,0xc
c00054ec:	00040517          	auipc	a0,0x40
c00054f0:	42c52503          	lw	a0,1068(a0) # c0045918 <boot_pgdir>
c00054f4:	00a79793          	slli	a5,a5,0xa
c00054f8:	00001437          	lui	s0,0x1
c00054fc:	00850733          	add	a4,a0,s0
c0005500:	0017e693          	ori	a3,a5,1
c0005504:	c00005b7          	lui	a1,0xc0000
c0005508:	0077e793          	ori	a5,a5,7
c000550c:	fad72623          	sw	a3,-84(a4) # fff7ffac <sbi_remote_fence_i+0xfff806bc>
c0005510:	00040697          	auipc	a3,0x40
c0005514:	4f06a683          	lw	a3,1264(a3) # c0045a00 <va_pa_offset>
c0005518:	faf72823          	sw	a5,-80(a4)
c000551c:	40d586b3          	sub	a3,a1,a3
c0005520:	00f00713          	li	a4,15
c0005524:	38000637          	lui	a2,0x38000
c0005528:	e51fe0ef          	jal	ra,c0004378 <boot_map_segment>
c000552c:	180027f3          	csrr	a5,sptbr
c0005530:	00100737          	lui	a4,0x100
c0005534:	fff70713          	addi	a4,a4,-1 # fffff <_binary_obj___user_matrix_out_size+0xfd6b7>
c0005538:	00e7f733          	and	a4,a5,a4
c000553c:	00040697          	auipc	a3,0x40
c0005540:	3e06a683          	lw	a3,992(a3) # c004591c <npage>
c0005544:	00c79793          	slli	a5,a5,0xc
c0005548:	62d77863          	bleu	a3,a4,c0005b78 <pmm_init+0xb78>
c000554c:	00040517          	auipc	a0,0x40
c0005550:	4b452503          	lw	a0,1204(a0) # c0045a00 <va_pa_offset>
c0005554:	00a78533          	add	a0,a5,a0
c0005558:	00000613          	li	a2,0
c000555c:	fff00593          	li	a1,-1
c0005560:	cb5fe0ef          	jal	ra,c0004214 <get_pte>
c0005564:	00052683          	lw	a3,0(a0)
c0005568:	fffff4b7          	lui	s1,0xfffff
c000556c:	00b00713          	li	a4,11
c0005570:	00269693          	slli	a3,a3,0x2
c0005574:	0096f6b3          	and	a3,a3,s1
c0005578:	00040613          	mv	a2,s0
c000557c:	00048593          	mv	a1,s1
c0005580:	00040517          	auipc	a0,0x40
c0005584:	39852503          	lw	a0,920(a0) # c0045918 <boot_pgdir>
c0005588:	df1fe0ef          	jal	ra,c0004378 <boot_map_segment>
c000558c:	00040797          	auipc	a5,0x40
c0005590:	4787a783          	lw	a5,1144(a5) # c0045a04 <boot_cr3>
c0005594:	00c7d793          	srli	a5,a5,0xc
c0005598:	18079073          	csrw	sptbr,a5
c000559c:	00040797          	auipc	a5,0x40
c00055a0:	3807a783          	lw	a5,896(a5) # c004591c <npage>
c00055a4:	000c0437          	lui	s0,0xc0
c00055a8:	00040517          	auipc	a0,0x40
c00055ac:	37052503          	lw	a0,880(a0) # c0045918 <boot_pgdir>
c00055b0:	00f46c63          	bltu	s0,a5,c00055c8 <pmm_init+0x5c8>
c00055b4:	04c0006f          	j	c0005600 <pmm_init+0x600>
c00055b8:	00c45793          	srli	a5,s0,0xc
c00055bc:	00040517          	auipc	a0,0x40
c00055c0:	35c52503          	lw	a0,860(a0) # c0045918 <boot_pgdir>
c00055c4:	1ee7fa63          	bleu	a4,a5,c00057b8 <pmm_init+0x7b8>
c00055c8:	00040597          	auipc	a1,0x40
c00055cc:	4385a583          	lw	a1,1080(a1) # c0045a00 <va_pa_offset>
c00055d0:	00000613          	li	a2,0
c00055d4:	00b405b3          	add	a1,s0,a1
c00055d8:	c3dfe0ef          	jal	ra,c0004214 <get_pte>
c00055dc:	1a050e63          	beqz	a0,c0005798 <pmm_init+0x798>
c00055e0:	00052783          	lw	a5,0(a0)
c00055e4:	00279793          	slli	a5,a5,0x2
c00055e8:	0097f7b3          	and	a5,a5,s1
c00055ec:	1e879463          	bne	a5,s0,c00057d4 <pmm_init+0x7d4>
c00055f0:	00140413          	addi	s0,s0,1 # c0001 <_binary_obj___user_matrix_out_size+0xbd6b9>
c00055f4:	00040717          	auipc	a4,0x40
c00055f8:	32872703          	lw	a4,808(a4) # c004591c <npage>
c00055fc:	fae46ee3          	bltu	s0,a4,c00055b8 <pmm_init+0x5b8>
c0005600:	00040697          	auipc	a3,0x40
c0005604:	3186a683          	lw	a3,792(a3) # c0045918 <boot_pgdir>
c0005608:	000014b7          	lui	s1,0x1
c000560c:	009687b3          	add	a5,a3,s1
c0005610:	fac7a783          	lw	a5,-84(a5)
c0005614:	fffff637          	lui	a2,0xfffff
c0005618:	c0000737          	lui	a4,0xc0000
c000561c:	00279793          	slli	a5,a5,0x2
c0005620:	00c7f7b3          	and	a5,a5,a2
c0005624:	60e6e463          	bltu	a3,a4,c0005c2c <pmm_init+0xc2c>
c0005628:	00040717          	auipc	a4,0x40
c000562c:	3d872703          	lw	a4,984(a4) # c0045a00 <va_pa_offset>
c0005630:	40e68733          	sub	a4,a3,a4
c0005634:	5ce79c63          	bne	a5,a4,c0005c0c <pmm_init+0xc0c>
c0005638:	0006a783          	lw	a5,0(a3)
c000563c:	5a079863          	bnez	a5,c0005bec <pmm_init+0xbec>
c0005640:	00100513          	li	a0,1
c0005644:	a61fe0ef          	jal	ra,c00040a4 <alloc_pages>
c0005648:	00050413          	mv	s0,a0
c000564c:	00050593          	mv	a1,a0
c0005650:	00600693          	li	a3,6
c0005654:	10000613          	li	a2,256
c0005658:	00040517          	auipc	a0,0x40
c000565c:	2c052503          	lw	a0,704(a0) # c0045918 <boot_pgdir>
c0005660:	a08ff0ef          	jal	ra,c0004868 <page_insert>
c0005664:	56051463          	bnez	a0,c0005bcc <pmm_init+0xbcc>
c0005668:	00042703          	lw	a4,0(s0)
c000566c:	00100793          	li	a5,1
c0005670:	62f71a63          	bne	a4,a5,c0005ca4 <pmm_init+0xca4>
c0005674:	00600693          	li	a3,6
c0005678:	10048613          	addi	a2,s1,256 # 1100 <_binary_obj___user_faultread_out_size-0xfa8>
c000567c:	00040593          	mv	a1,s0
c0005680:	00040517          	auipc	a0,0x40
c0005684:	29852503          	lw	a0,664(a0) # c0045918 <boot_pgdir>
c0005688:	9e0ff0ef          	jal	ra,c0004868 <page_insert>
c000568c:	5e051c63          	bnez	a0,c0005c84 <pmm_init+0xc84>
c0005690:	00042703          	lw	a4,0(s0)
c0005694:	00200793          	li	a5,2
c0005698:	5cf71663          	bne	a4,a5,c0005c64 <pmm_init+0xc64>
c000569c:	00009597          	auipc	a1,0x9
c00056a0:	16858593          	addi	a1,a1,360 # c000e804 <default_pmm_manager+0x54c>
c00056a4:	10000513          	li	a0,256
c00056a8:	7e5060ef          	jal	ra,c000c68c <strcpy>
c00056ac:	10048593          	addi	a1,s1,256
c00056b0:	10000513          	li	a0,256
c00056b4:	7f5060ef          	jal	ra,c000c6a8 <strcmp>
c00056b8:	62051463          	bnez	a0,c0005ce0 <pmm_init+0xce0>
c00056bc:	00040797          	auipc	a5,0x40
c00056c0:	34c7a783          	lw	a5,844(a5) # c0045a08 <pages>
c00056c4:	40f407b3          	sub	a5,s0,a5
c00056c8:	00080737          	lui	a4,0x80
c00056cc:	4057d793          	srai	a5,a5,0x5
c00056d0:	00e787b3          	add	a5,a5,a4
c00056d4:	00100737          	lui	a4,0x100
c00056d8:	fff70713          	addi	a4,a4,-1 # fffff <_binary_obj___user_matrix_out_size+0xfd6b7>
c00056dc:	00e7f733          	and	a4,a5,a4
c00056e0:	00040697          	auipc	a3,0x40
c00056e4:	23c6a683          	lw	a3,572(a3) # c004591c <npage>
c00056e8:	00c79793          	slli	a5,a5,0xc
c00056ec:	2ed77263          	bleu	a3,a4,c00059d0 <pmm_init+0x9d0>
c00056f0:	00040717          	auipc	a4,0x40
c00056f4:	31072703          	lw	a4,784(a4) # c0045a00 <va_pa_offset>
c00056f8:	00f707b3          	add	a5,a4,a5
c00056fc:	10078023          	sb	zero,256(a5)
c0005700:	10000513          	li	a0,256
c0005704:	71d060ef          	jal	ra,c000c620 <strlen>
c0005708:	4a051263          	bnez	a0,c0005bac <pmm_init+0xbac>
c000570c:	00100593          	li	a1,1
c0005710:	00040513          	mv	a0,s0
c0005714:	a45fe0ef          	jal	ra,c0004158 <free_pages>
c0005718:	00040797          	auipc	a5,0x40
c000571c:	2007a783          	lw	a5,512(a5) # c0045918 <boot_pgdir>
c0005720:	0007a783          	lw	a5,0(a5)
c0005724:	00040717          	auipc	a4,0x40
c0005728:	1f872703          	lw	a4,504(a4) # c004591c <npage>
c000572c:	00279793          	slli	a5,a5,0x2
c0005730:	00c7d793          	srli	a5,a5,0xc
c0005734:	34e7f863          	bleu	a4,a5,c0005a84 <pmm_init+0xa84>
c0005738:	fff80737          	lui	a4,0xfff80
c000573c:	00e787b3          	add	a5,a5,a4
c0005740:	00579793          	slli	a5,a5,0x5
c0005744:	00040517          	auipc	a0,0x40
c0005748:	2c452503          	lw	a0,708(a0) # c0045a08 <pages>
c000574c:	00100593          	li	a1,1
c0005750:	00f50533          	add	a0,a0,a5
c0005754:	a05fe0ef          	jal	ra,c0004158 <free_pages>
c0005758:	00040797          	auipc	a5,0x40
c000575c:	1c07a783          	lw	a5,448(a5) # c0045918 <boot_pgdir>
c0005760:	0007a023          	sw	zero,0(a5)
c0005764:	00009517          	auipc	a0,0x9
c0005768:	11450513          	addi	a0,a0,276 # c000e878 <default_pmm_manager+0x5c0>
c000576c:	971fa0ef          	jal	ra,c00000dc <cprintf>
c0005770:	da0ff0ef          	jal	ra,c0004d10 <print_pgdir>
c0005774:	de1fc0ef          	jal	ra,c0002554 <kmalloc_init>
c0005778:	01c12083          	lw	ra,28(sp)
c000577c:	01812403          	lw	s0,24(sp)
c0005780:	01412483          	lw	s1,20(sp)
c0005784:	01012903          	lw	s2,16(sp)
c0005788:	02010113          	addi	sp,sp,32
c000578c:	00008067          	ret
c0005790:	00078513          	mv	a0,a5
c0005794:	9b5ff06f          	j	c0005148 <pmm_init+0x148>
c0005798:	00009697          	auipc	a3,0x9
c000579c:	f2c68693          	addi	a3,a3,-212 # c000e6c4 <default_pmm_manager+0x40c>
c00057a0:	00008617          	auipc	a2,0x8
c00057a4:	ad460613          	addi	a2,a2,-1324 # c000d274 <commands+0x3d8>
c00057a8:	24300593          	li	a1,579
c00057ac:	00009517          	auipc	a0,0x9
c00057b0:	b9050513          	addi	a0,a0,-1136 # c000e33c <default_pmm_manager+0x84>
c00057b4:	a9dfa0ef          	jal	ra,c0000250 <__panic>
c00057b8:	00040693          	mv	a3,s0
c00057bc:	00008617          	auipc	a2,0x8
c00057c0:	39c60613          	addi	a2,a2,924 # c000db58 <commands+0xcbc>
c00057c4:	24300593          	li	a1,579
c00057c8:	00009517          	auipc	a0,0x9
c00057cc:	b7450513          	addi	a0,a0,-1164 # c000e33c <default_pmm_manager+0x84>
c00057d0:	a81fa0ef          	jal	ra,c0000250 <__panic>
c00057d4:	00009697          	auipc	a3,0x9
c00057d8:	f3068693          	addi	a3,a3,-208 # c000e704 <default_pmm_manager+0x44c>
c00057dc:	00008617          	auipc	a2,0x8
c00057e0:	a9860613          	addi	a2,a2,-1384 # c000d274 <commands+0x3d8>
c00057e4:	24400593          	li	a1,580
c00057e8:	00009517          	auipc	a0,0x9
c00057ec:	b5450513          	addi	a0,a0,-1196 # c000e33c <default_pmm_manager+0x84>
c00057f0:	a61fa0ef          	jal	ra,c0000250 <__panic>
c00057f4:	00009697          	auipc	a3,0x9
c00057f8:	e4c68693          	addi	a3,a3,-436 # c000e640 <default_pmm_manager+0x388>
c00057fc:	00008617          	auipc	a2,0x8
c0005800:	a7860613          	addi	a2,a2,-1416 # c000d274 <commands+0x3d8>
c0005804:	22d00593          	li	a1,557
c0005808:	00009517          	auipc	a0,0x9
c000580c:	b3450513          	addi	a0,a0,-1228 # c000e33c <default_pmm_manager+0x84>
c0005810:	a41fa0ef          	jal	ra,c0000250 <__panic>
c0005814:	00009697          	auipc	a3,0x9
c0005818:	cfc68693          	addi	a3,a3,-772 # c000e510 <default_pmm_manager+0x258>
c000581c:	00008617          	auipc	a2,0x8
c0005820:	a5860613          	addi	a2,a2,-1448 # c000d274 <commands+0x3d8>
c0005824:	22c00593          	li	a1,556
c0005828:	00009517          	auipc	a0,0x9
c000582c:	b1450513          	addi	a0,a0,-1260 # c000e33c <default_pmm_manager+0x84>
c0005830:	a21fa0ef          	jal	ra,c0000250 <__panic>
c0005834:	00009697          	auipc	a3,0x9
c0005838:	e2068693          	addi	a3,a3,-480 # c000e654 <default_pmm_manager+0x39c>
c000583c:	00008617          	auipc	a2,0x8
c0005840:	a3860613          	addi	a2,a2,-1480 # c000d274 <commands+0x3d8>
c0005844:	22900593          	li	a1,553
c0005848:	00009517          	auipc	a0,0x9
c000584c:	af450513          	addi	a0,a0,-1292 # c000e33c <default_pmm_manager+0x84>
c0005850:	a01fa0ef          	jal	ra,c0000250 <__panic>
c0005854:	00009697          	auipc	a3,0x9
c0005858:	ca468693          	addi	a3,a3,-860 # c000e4f8 <default_pmm_manager+0x240>
c000585c:	00008617          	auipc	a2,0x8
c0005860:	a1860613          	addi	a2,a2,-1512 # c000d274 <commands+0x3d8>
c0005864:	22800593          	li	a1,552
c0005868:	00009517          	auipc	a0,0x9
c000586c:	ad450513          	addi	a0,a0,-1324 # c000e33c <default_pmm_manager+0x84>
c0005870:	9e1fa0ef          	jal	ra,c0000250 <__panic>
c0005874:	00009697          	auipc	a3,0x9
c0005878:	d1068693          	addi	a3,a3,-752 # c000e584 <default_pmm_manager+0x2cc>
c000587c:	00008617          	auipc	a2,0x8
c0005880:	9f860613          	addi	a2,a2,-1544 # c000d274 <commands+0x3d8>
c0005884:	22700593          	li	a1,551
c0005888:	00009517          	auipc	a0,0x9
c000588c:	ab450513          	addi	a0,a0,-1356 # c000e33c <default_pmm_manager+0x84>
c0005890:	9c1fa0ef          	jal	ra,c0000250 <__panic>
c0005894:	00009697          	auipc	a3,0x9
c0005898:	dac68693          	addi	a3,a3,-596 # c000e640 <default_pmm_manager+0x388>
c000589c:	00008617          	auipc	a2,0x8
c00058a0:	9d860613          	addi	a2,a2,-1576 # c000d274 <commands+0x3d8>
c00058a4:	22600593          	li	a1,550
c00058a8:	00009517          	auipc	a0,0x9
c00058ac:	a9450513          	addi	a0,a0,-1388 # c000e33c <default_pmm_manager+0x84>
c00058b0:	9a1fa0ef          	jal	ra,c0000250 <__panic>
c00058b4:	00009697          	auipc	a3,0x9
c00058b8:	d7868693          	addi	a3,a3,-648 # c000e62c <default_pmm_manager+0x374>
c00058bc:	00008617          	auipc	a2,0x8
c00058c0:	9b860613          	addi	a2,a2,-1608 # c000d274 <commands+0x3d8>
c00058c4:	22500593          	li	a1,549
c00058c8:	00009517          	auipc	a0,0x9
c00058cc:	a7450513          	addi	a0,a0,-1420 # c000e33c <default_pmm_manager+0x84>
c00058d0:	981fa0ef          	jal	ra,c0000250 <__panic>
c00058d4:	00009697          	auipc	a3,0x9
c00058d8:	d2c68693          	addi	a3,a3,-724 # c000e600 <default_pmm_manager+0x348>
c00058dc:	00008617          	auipc	a2,0x8
c00058e0:	99860613          	addi	a2,a2,-1640 # c000d274 <commands+0x3d8>
c00058e4:	22400593          	li	a1,548
c00058e8:	00009517          	auipc	a0,0x9
c00058ec:	a5450513          	addi	a0,a0,-1452 # c000e33c <default_pmm_manager+0x84>
c00058f0:	961fa0ef          	jal	ra,c0000250 <__panic>
c00058f4:	00009697          	auipc	a3,0x9
c00058f8:	cf868693          	addi	a3,a3,-776 # c000e5ec <default_pmm_manager+0x334>
c00058fc:	00008617          	auipc	a2,0x8
c0005900:	97860613          	addi	a2,a2,-1672 # c000d274 <commands+0x3d8>
c0005904:	22200593          	li	a1,546
c0005908:	00009517          	auipc	a0,0x9
c000590c:	a3450513          	addi	a0,a0,-1484 # c000e33c <default_pmm_manager+0x84>
c0005910:	941fa0ef          	jal	ra,c0000250 <__panic>
c0005914:	00009697          	auipc	a3,0x9
c0005918:	cc068693          	addi	a3,a3,-832 # c000e5d4 <default_pmm_manager+0x31c>
c000591c:	00008617          	auipc	a2,0x8
c0005920:	95860613          	addi	a2,a2,-1704 # c000d274 <commands+0x3d8>
c0005924:	22100593          	li	a1,545
c0005928:	00009517          	auipc	a0,0x9
c000592c:	a1450513          	addi	a0,a0,-1516 # c000e33c <default_pmm_manager+0x84>
c0005930:	921fa0ef          	jal	ra,c0000250 <__panic>
c0005934:	00009697          	auipc	a3,0x9
c0005938:	c9068693          	addi	a3,a3,-880 # c000e5c4 <default_pmm_manager+0x30c>
c000593c:	00008617          	auipc	a2,0x8
c0005940:	93860613          	addi	a2,a2,-1736 # c000d274 <commands+0x3d8>
c0005944:	22000593          	li	a1,544
c0005948:	00009517          	auipc	a0,0x9
c000594c:	9f450513          	addi	a0,a0,-1548 # c000e33c <default_pmm_manager+0x84>
c0005950:	901fa0ef          	jal	ra,c0000250 <__panic>
c0005954:	00009697          	auipc	a3,0x9
c0005958:	c6068693          	addi	a3,a3,-928 # c000e5b4 <default_pmm_manager+0x2fc>
c000595c:	00008617          	auipc	a2,0x8
c0005960:	91860613          	addi	a2,a2,-1768 # c000d274 <commands+0x3d8>
c0005964:	21f00593          	li	a1,543
c0005968:	00009517          	auipc	a0,0x9
c000596c:	9d450513          	addi	a0,a0,-1580 # c000e33c <default_pmm_manager+0x84>
c0005970:	8e1fa0ef          	jal	ra,c0000250 <__panic>
c0005974:	00009697          	auipc	a3,0x9
c0005978:	ccc68693          	addi	a3,a3,-820 # c000e640 <default_pmm_manager+0x388>
c000597c:	00008617          	auipc	a2,0x8
c0005980:	8f860613          	addi	a2,a2,-1800 # c000d274 <commands+0x3d8>
c0005984:	23100593          	li	a1,561
c0005988:	00009517          	auipc	a0,0x9
c000598c:	9b450513          	addi	a0,a0,-1612 # c000e33c <default_pmm_manager+0x84>
c0005990:	8c1fa0ef          	jal	ra,c0000250 <__panic>
c0005994:	00009697          	auipc	a3,0x9
c0005998:	cd868693          	addi	a3,a3,-808 # c000e66c <default_pmm_manager+0x3b4>
c000599c:	00008617          	auipc	a2,0x8
c00059a0:	8d860613          	addi	a2,a2,-1832 # c000d274 <commands+0x3d8>
c00059a4:	23000593          	li	a1,560
c00059a8:	00009517          	auipc	a0,0x9
c00059ac:	99450513          	addi	a0,a0,-1644 # c000e33c <default_pmm_manager+0x84>
c00059b0:	8a1fa0ef          	jal	ra,c0000250 <__panic>
c00059b4:	00050693          	mv	a3,a0
c00059b8:	00008617          	auipc	a2,0x8
c00059bc:	1c460613          	addi	a2,a2,452 # c000db7c <commands+0xce0>
c00059c0:	0cf00593          	li	a1,207
c00059c4:	00009517          	auipc	a0,0x9
c00059c8:	97850513          	addi	a0,a0,-1672 # c000e33c <default_pmm_manager+0x84>
c00059cc:	885fa0ef          	jal	ra,c0000250 <__panic>
c00059d0:	00078693          	mv	a3,a5
c00059d4:	00008617          	auipc	a2,0x8
c00059d8:	18460613          	addi	a2,a2,388 # c000db58 <commands+0xcbc>
c00059dc:	06800593          	li	a1,104
c00059e0:	00008517          	auipc	a0,0x8
c00059e4:	f3050513          	addi	a0,a0,-208 # c000d910 <commands+0xa74>
c00059e8:	869fa0ef          	jal	ra,c0000250 <__panic>
c00059ec:	00009697          	auipc	a3,0x9
c00059f0:	ab068693          	addi	a3,a3,-1360 # c000e49c <default_pmm_manager+0x1e4>
c00059f4:	00008617          	auipc	a2,0x8
c00059f8:	88060613          	addi	a2,a2,-1920 # c000d274 <commands+0x3d8>
c00059fc:	21200593          	li	a1,530
c0005a00:	00009517          	auipc	a0,0x9
c0005a04:	93c50513          	addi	a0,a0,-1732 # c000e33c <default_pmm_manager+0x84>
c0005a08:	849fa0ef          	jal	ra,c0000250 <__panic>
c0005a0c:	00009697          	auipc	a3,0x9
c0005a10:	a6868693          	addi	a3,a3,-1432 # c000e474 <default_pmm_manager+0x1bc>
c0005a14:	00008617          	auipc	a2,0x8
c0005a18:	86060613          	addi	a2,a2,-1952 # c000d274 <commands+0x3d8>
c0005a1c:	20e00593          	li	a1,526
c0005a20:	00009517          	auipc	a0,0x9
c0005a24:	91c50513          	addi	a0,a0,-1764 # c000e33c <default_pmm_manager+0x84>
c0005a28:	829fa0ef          	jal	ra,c0000250 <__panic>
c0005a2c:	00009697          	auipc	a3,0x9
c0005a30:	a1068693          	addi	a3,a3,-1520 # c000e43c <default_pmm_manager+0x184>
c0005a34:	00008617          	auipc	a2,0x8
c0005a38:	84060613          	addi	a2,a2,-1984 # c000d274 <commands+0x3d8>
c0005a3c:	20d00593          	li	a1,525
c0005a40:	00009517          	auipc	a0,0x9
c0005a44:	8fc50513          	addi	a0,a0,-1796 # c000e33c <default_pmm_manager+0x84>
c0005a48:	809fa0ef          	jal	ra,c0000250 <__panic>
c0005a4c:	00009697          	auipc	a3,0x9
c0005a50:	9d468693          	addi	a3,a3,-1580 # c000e420 <default_pmm_manager+0x168>
c0005a54:	00008617          	auipc	a2,0x8
c0005a58:	82060613          	addi	a2,a2,-2016 # c000d274 <commands+0x3d8>
c0005a5c:	20c00593          	li	a1,524
c0005a60:	00009517          	auipc	a0,0x9
c0005a64:	8dc50513          	addi	a0,a0,-1828 # c000e33c <default_pmm_manager+0x84>
c0005a68:	fe8fa0ef          	jal	ra,c0000250 <__panic>
c0005a6c:	00009617          	auipc	a2,0x9
c0005a70:	99860613          	addi	a2,a2,-1640 # c000e404 <default_pmm_manager+0x14c>
c0005a74:	0b100593          	li	a1,177
c0005a78:	00009517          	auipc	a0,0x9
c0005a7c:	8c450513          	addi	a0,a0,-1852 # c000e33c <default_pmm_manager+0x84>
c0005a80:	fd0fa0ef          	jal	ra,c0000250 <__panic>
c0005a84:	e00fe0ef          	jal	ra,c0004084 <pa2page.part.6>
c0005a88:	00009697          	auipc	a3,0x9
c0005a8c:	a9c68693          	addi	a3,a3,-1380 # c000e524 <default_pmm_manager+0x26c>
c0005a90:	00007617          	auipc	a2,0x7
c0005a94:	7e460613          	addi	a2,a2,2020 # c000d274 <commands+0x3d8>
c0005a98:	21a00593          	li	a1,538
c0005a9c:	00009517          	auipc	a0,0x9
c0005aa0:	8a050513          	addi	a0,a0,-1888 # c000e33c <default_pmm_manager+0x84>
c0005aa4:	facfa0ef          	jal	ra,c0000250 <__panic>
c0005aa8:	00008617          	auipc	a2,0x8
c0005aac:	0b060613          	addi	a2,a2,176 # c000db58 <commands+0xcbc>
c0005ab0:	21900593          	li	a1,537
c0005ab4:	00009517          	auipc	a0,0x9
c0005ab8:	88850513          	addi	a0,a0,-1912 # c000e33c <default_pmm_manager+0x84>
c0005abc:	f94fa0ef          	jal	ra,c0000250 <__panic>
c0005ac0:	00009697          	auipc	a3,0x9
c0005ac4:	a5068693          	addi	a3,a3,-1456 # c000e510 <default_pmm_manager+0x258>
c0005ac8:	00007617          	auipc	a2,0x7
c0005acc:	7ac60613          	addi	a2,a2,1964 # c000d274 <commands+0x3d8>
c0005ad0:	21700593          	li	a1,535
c0005ad4:	00009517          	auipc	a0,0x9
c0005ad8:	86850513          	addi	a0,a0,-1944 # c000e33c <default_pmm_manager+0x84>
c0005adc:	f74fa0ef          	jal	ra,c0000250 <__panic>
c0005ae0:	00009697          	auipc	a3,0x9
c0005ae4:	a1868693          	addi	a3,a3,-1512 # c000e4f8 <default_pmm_manager+0x240>
c0005ae8:	00007617          	auipc	a2,0x7
c0005aec:	78c60613          	addi	a2,a2,1932 # c000d274 <commands+0x3d8>
c0005af0:	21600593          	li	a1,534
c0005af4:	00009517          	auipc	a0,0x9
c0005af8:	84850513          	addi	a0,a0,-1976 # c000e33c <default_pmm_manager+0x84>
c0005afc:	f54fa0ef          	jal	ra,c0000250 <__panic>
c0005b00:	00008617          	auipc	a2,0x8
c0005b04:	34060613          	addi	a2,a2,832 # c000de40 <commands+0xfa4>
c0005b08:	07300593          	li	a1,115
c0005b0c:	00008517          	auipc	a0,0x8
c0005b10:	e0450513          	addi	a0,a0,-508 # c000d910 <commands+0xa74>
c0005b14:	f3cfa0ef          	jal	ra,c0000250 <__panic>
c0005b18:	00009697          	auipc	a3,0x9
c0005b1c:	9b068693          	addi	a3,a3,-1616 # c000e4c8 <default_pmm_manager+0x210>
c0005b20:	00007617          	auipc	a2,0x7
c0005b24:	75460613          	addi	a2,a2,1876 # c000d274 <commands+0x3d8>
c0005b28:	21500593          	li	a1,533
c0005b2c:	00009517          	auipc	a0,0x9
c0005b30:	81050513          	addi	a0,a0,-2032 # c000e33c <default_pmm_manager+0x84>
c0005b34:	f1cfa0ef          	jal	ra,c0000250 <__panic>
c0005b38:	00009697          	auipc	a3,0x9
c0005b3c:	a4c68693          	addi	a3,a3,-1460 # c000e584 <default_pmm_manager+0x2cc>
c0005b40:	00007617          	auipc	a2,0x7
c0005b44:	73460613          	addi	a2,a2,1844 # c000d274 <commands+0x3d8>
c0005b48:	21e00593          	li	a1,542
c0005b4c:	00008517          	auipc	a0,0x8
c0005b50:	7f050513          	addi	a0,a0,2032 # c000e33c <default_pmm_manager+0x84>
c0005b54:	efcfa0ef          	jal	ra,c0000250 <__panic>
c0005b58:	00009697          	auipc	a3,0x9
c0005b5c:	9f468693          	addi	a3,a3,-1548 # c000e54c <default_pmm_manager+0x294>
c0005b60:	00007617          	auipc	a2,0x7
c0005b64:	71460613          	addi	a2,a2,1812 # c000d274 <commands+0x3d8>
c0005b68:	21d00593          	li	a1,541
c0005b6c:	00008517          	auipc	a0,0x8
c0005b70:	7d050513          	addi	a0,a0,2000 # c000e33c <default_pmm_manager+0x84>
c0005b74:	edcfa0ef          	jal	ra,c0000250 <__panic>
c0005b78:	00078693          	mv	a3,a5
c0005b7c:	00008617          	auipc	a2,0x8
c0005b80:	fdc60613          	addi	a2,a2,-36 # c000db58 <commands+0xcbc>
c0005b84:	0e300593          	li	a1,227
c0005b88:	00008517          	auipc	a0,0x8
c0005b8c:	7b450513          	addi	a0,a0,1972 # c000e33c <default_pmm_manager+0x84>
c0005b90:	ec0fa0ef          	jal	ra,c0000250 <__panic>
c0005b94:	00008617          	auipc	a2,0x8
c0005b98:	7e460613          	addi	a2,a2,2020 # c000e378 <default_pmm_manager+0xc0>
c0005b9c:	06d00593          	li	a1,109
c0005ba0:	00008517          	auipc	a0,0x8
c0005ba4:	79c50513          	addi	a0,a0,1948 # c000e33c <default_pmm_manager+0x84>
c0005ba8:	ea8fa0ef          	jal	ra,c0000250 <__panic>
c0005bac:	00009697          	auipc	a3,0x9
c0005bb0:	ca868693          	addi	a3,a3,-856 # c000e854 <default_pmm_manager+0x59c>
c0005bb4:	00007617          	auipc	a2,0x7
c0005bb8:	6c060613          	addi	a2,a2,1728 # c000d274 <commands+0x3d8>
c0005bbc:	25700593          	li	a1,599
c0005bc0:	00008517          	auipc	a0,0x8
c0005bc4:	77c50513          	addi	a0,a0,1916 # c000e33c <default_pmm_manager+0x84>
c0005bc8:	e88fa0ef          	jal	ra,c0000250 <__panic>
c0005bcc:	00009697          	auipc	a3,0x9
c0005bd0:	b9868693          	addi	a3,a3,-1128 # c000e764 <default_pmm_manager+0x4ac>
c0005bd4:	00007617          	auipc	a2,0x7
c0005bd8:	6a060613          	addi	a2,a2,1696 # c000d274 <commands+0x3d8>
c0005bdc:	24d00593          	li	a1,589
c0005be0:	00008517          	auipc	a0,0x8
c0005be4:	75c50513          	addi	a0,a0,1884 # c000e33c <default_pmm_manager+0x84>
c0005be8:	e68fa0ef          	jal	ra,c0000250 <__panic>
c0005bec:	00009697          	auipc	a3,0x9
c0005bf0:	b6468693          	addi	a3,a3,-1180 # c000e750 <default_pmm_manager+0x498>
c0005bf4:	00007617          	auipc	a2,0x7
c0005bf8:	68060613          	addi	a2,a2,1664 # c000d274 <commands+0x3d8>
c0005bfc:	24900593          	li	a1,585
c0005c00:	00008517          	auipc	a0,0x8
c0005c04:	73c50513          	addi	a0,a0,1852 # c000e33c <default_pmm_manager+0x84>
c0005c08:	e48fa0ef          	jal	ra,c0000250 <__panic>
c0005c0c:	00009697          	auipc	a3,0x9
c0005c10:	b1068693          	addi	a3,a3,-1264 # c000e71c <default_pmm_manager+0x464>
c0005c14:	00007617          	auipc	a2,0x7
c0005c18:	66060613          	addi	a2,a2,1632 # c000d274 <commands+0x3d8>
c0005c1c:	24700593          	li	a1,583
c0005c20:	00008517          	auipc	a0,0x8
c0005c24:	71c50513          	addi	a0,a0,1820 # c000e33c <default_pmm_manager+0x84>
c0005c28:	e28fa0ef          	jal	ra,c0000250 <__panic>
c0005c2c:	00008617          	auipc	a2,0x8
c0005c30:	f5060613          	addi	a2,a2,-176 # c000db7c <commands+0xce0>
c0005c34:	24700593          	li	a1,583
c0005c38:	00008517          	auipc	a0,0x8
c0005c3c:	70450513          	addi	a0,a0,1796 # c000e33c <default_pmm_manager+0x84>
c0005c40:	e10fa0ef          	jal	ra,c0000250 <__panic>
c0005c44:	00009697          	auipc	a3,0x9
c0005c48:	a3c68693          	addi	a3,a3,-1476 # c000e680 <default_pmm_manager+0x3c8>
c0005c4c:	00007617          	auipc	a2,0x7
c0005c50:	62860613          	addi	a2,a2,1576 # c000d274 <commands+0x3d8>
c0005c54:	23300593          	li	a1,563
c0005c58:	00008517          	auipc	a0,0x8
c0005c5c:	6e450513          	addi	a0,a0,1764 # c000e33c <default_pmm_manager+0x84>
c0005c60:	df0fa0ef          	jal	ra,c0000250 <__panic>
c0005c64:	00009697          	auipc	a3,0x9
c0005c68:	b8c68693          	addi	a3,a3,-1140 # c000e7f0 <default_pmm_manager+0x538>
c0005c6c:	00007617          	auipc	a2,0x7
c0005c70:	60860613          	addi	a2,a2,1544 # c000d274 <commands+0x3d8>
c0005c74:	25000593          	li	a1,592
c0005c78:	00008517          	auipc	a0,0x8
c0005c7c:	6c450513          	addi	a0,a0,1732 # c000e33c <default_pmm_manager+0x84>
c0005c80:	dd0fa0ef          	jal	ra,c0000250 <__panic>
c0005c84:	00009697          	auipc	a3,0x9
c0005c88:	b2c68693          	addi	a3,a3,-1236 # c000e7b0 <default_pmm_manager+0x4f8>
c0005c8c:	00007617          	auipc	a2,0x7
c0005c90:	5e860613          	addi	a2,a2,1512 # c000d274 <commands+0x3d8>
c0005c94:	24f00593          	li	a1,591
c0005c98:	00008517          	auipc	a0,0x8
c0005c9c:	6a450513          	addi	a0,a0,1700 # c000e33c <default_pmm_manager+0x84>
c0005ca0:	db0fa0ef          	jal	ra,c0000250 <__panic>
c0005ca4:	00009697          	auipc	a3,0x9
c0005ca8:	af868693          	addi	a3,a3,-1288 # c000e79c <default_pmm_manager+0x4e4>
c0005cac:	00007617          	auipc	a2,0x7
c0005cb0:	5c860613          	addi	a2,a2,1480 # c000d274 <commands+0x3d8>
c0005cb4:	24e00593          	li	a1,590
c0005cb8:	00008517          	auipc	a0,0x8
c0005cbc:	68450513          	addi	a0,a0,1668 # c000e33c <default_pmm_manager+0x84>
c0005cc0:	d90fa0ef          	jal	ra,c0000250 <__panic>
c0005cc4:	00078693          	mv	a3,a5
c0005cc8:	00008617          	auipc	a2,0x8
c0005ccc:	e9060613          	addi	a2,a2,-368 # c000db58 <commands+0xcbc>
c0005cd0:	08600593          	li	a1,134
c0005cd4:	00008517          	auipc	a0,0x8
c0005cd8:	66850513          	addi	a0,a0,1640 # c000e33c <default_pmm_manager+0x84>
c0005cdc:	d74fa0ef          	jal	ra,c0000250 <__panic>
c0005ce0:	00009697          	auipc	a3,0x9
c0005ce4:	b3c68693          	addi	a3,a3,-1220 # c000e81c <default_pmm_manager+0x564>
c0005ce8:	00007617          	auipc	a2,0x7
c0005cec:	58c60613          	addi	a2,a2,1420 # c000d274 <commands+0x3d8>
c0005cf0:	25400593          	li	a1,596
c0005cf4:	00008517          	auipc	a0,0x8
c0005cf8:	64850513          	addi	a0,a0,1608 # c000e33c <default_pmm_manager+0x84>
c0005cfc:	d54fa0ef          	jal	ra,c0000250 <__panic>
c0005d00:	00008617          	auipc	a2,0x8
c0005d04:	e7c60613          	addi	a2,a2,-388 # c000db7c <commands+0xce0>
c0005d08:	08c00593          	li	a1,140
c0005d0c:	00008517          	auipc	a0,0x8
c0005d10:	63050513          	addi	a0,a0,1584 # c000e33c <default_pmm_manager+0x84>
c0005d14:	d3cfa0ef          	jal	ra,c0000250 <__panic>

c0005d18 <phi_test_sema>:
c0005d18:	00040717          	auipc	a4,0x40
c0005d1c:	cf470713          	addi	a4,a4,-780 # c0045a0c <state_sema>
c0005d20:	00251793          	slli	a5,a0,0x2
c0005d24:	00f707b3          	add	a5,a4,a5
c0005d28:	0007a603          	lw	a2,0(a5)
c0005d2c:	00100693          	li	a3,1
c0005d30:	00d60463          	beq	a2,a3,c0005d38 <phi_test_sema+0x20>
c0005d34:	00008067          	ret
c0005d38:	00450693          	addi	a3,a0,4
c0005d3c:	00500593          	li	a1,5
c0005d40:	02b6e6b3          	rem	a3,a3,a1
c0005d44:	00200613          	li	a2,2
c0005d48:	00c696b3          	sll	a3,a3,a2
c0005d4c:	00d706b3          	add	a3,a4,a3
c0005d50:	0006a683          	lw	a3,0(a3)
c0005d54:	fec680e3          	beq	a3,a2,c0005d34 <phi_test_sema+0x1c>
c0005d58:	00150693          	addi	a3,a0,1
c0005d5c:	02b6e6b3          	rem	a3,a3,a1
c0005d60:	00c696b3          	sll	a3,a3,a2
c0005d64:	00d70733          	add	a4,a4,a3
c0005d68:	00072703          	lw	a4,0(a4)
c0005d6c:	fcc704e3          	beq	a4,a2,c0005d34 <phi_test_sema+0x1c>
c0005d70:	00151713          	slli	a4,a0,0x1
c0005d74:	00a70533          	add	a0,a4,a0
c0005d78:	00c51533          	sll	a0,a0,a2
c0005d7c:	00040717          	auipc	a4,0x40
c0005d80:	d0c70713          	addi	a4,a4,-756 # c0045a88 <s>
c0005d84:	00a70533          	add	a0,a4,a0
c0005d88:	00c7a023          	sw	a2,0(a5)
c0005d8c:	1210006f          	j	c00066ac <up>

c0005d90 <phi_take_forks_sema>:
c0005d90:	ff010113          	addi	sp,sp,-16
c0005d94:	00812423          	sw	s0,8(sp)
c0005d98:	00050413          	mv	s0,a0
c0005d9c:	00040517          	auipc	a0,0x40
c0005da0:	c9850513          	addi	a0,a0,-872 # c0045a34 <mutex>
c0005da4:	00112623          	sw	ra,12(sp)
c0005da8:	109000ef          	jal	ra,c00066b0 <down>
c0005dac:	00241713          	slli	a4,s0,0x2
c0005db0:	00040797          	auipc	a5,0x40
c0005db4:	c5c78793          	addi	a5,a5,-932 # c0045a0c <state_sema>
c0005db8:	00e787b3          	add	a5,a5,a4
c0005dbc:	00040513          	mv	a0,s0
c0005dc0:	00100713          	li	a4,1
c0005dc4:	00e7a023          	sw	a4,0(a5)
c0005dc8:	f51ff0ef          	jal	ra,c0005d18 <phi_test_sema>
c0005dcc:	00040517          	auipc	a0,0x40
c0005dd0:	c6850513          	addi	a0,a0,-920 # c0045a34 <mutex>
c0005dd4:	0d9000ef          	jal	ra,c00066ac <up>
c0005dd8:	00141793          	slli	a5,s0,0x1
c0005ddc:	008787b3          	add	a5,a5,s0
c0005de0:	00c12083          	lw	ra,12(sp)
c0005de4:	00812403          	lw	s0,8(sp)
c0005de8:	00279793          	slli	a5,a5,0x2
c0005dec:	00040517          	auipc	a0,0x40
c0005df0:	c9c50513          	addi	a0,a0,-868 # c0045a88 <s>
c0005df4:	00f50533          	add	a0,a0,a5
c0005df8:	01010113          	addi	sp,sp,16
c0005dfc:	0b50006f          	j	c00066b0 <down>

c0005e00 <phi_put_forks_sema>:
c0005e00:	ff010113          	addi	sp,sp,-16
c0005e04:	00812423          	sw	s0,8(sp)
c0005e08:	00050413          	mv	s0,a0
c0005e0c:	00040517          	auipc	a0,0x40
c0005e10:	c2850513          	addi	a0,a0,-984 # c0045a34 <mutex>
c0005e14:	00112623          	sw	ra,12(sp)
c0005e18:	00912223          	sw	s1,4(sp)
c0005e1c:	095000ef          	jal	ra,c00066b0 <down>
c0005e20:	00500493          	li	s1,5
c0005e24:	00440513          	addi	a0,s0,4
c0005e28:	02956533          	rem	a0,a0,s1
c0005e2c:	00241713          	slli	a4,s0,0x2
c0005e30:	00040797          	auipc	a5,0x40
c0005e34:	bdc78793          	addi	a5,a5,-1060 # c0045a0c <state_sema>
c0005e38:	00e787b3          	add	a5,a5,a4
c0005e3c:	0007a023          	sw	zero,0(a5)
c0005e40:	ed9ff0ef          	jal	ra,c0005d18 <phi_test_sema>
c0005e44:	00140513          	addi	a0,s0,1
c0005e48:	02956533          	rem	a0,a0,s1
c0005e4c:	ecdff0ef          	jal	ra,c0005d18 <phi_test_sema>
c0005e50:	00c12083          	lw	ra,12(sp)
c0005e54:	00812403          	lw	s0,8(sp)
c0005e58:	00412483          	lw	s1,4(sp)
c0005e5c:	00040517          	auipc	a0,0x40
c0005e60:	bd850513          	addi	a0,a0,-1064 # c0045a34 <mutex>
c0005e64:	01010113          	addi	sp,sp,16
c0005e68:	0450006f          	j	c00066ac <up>

c0005e6c <philosopher_using_semaphore>:
c0005e6c:	fe010113          	addi	sp,sp,-32
c0005e70:	00912a23          	sw	s1,20(sp)
c0005e74:	00050593          	mv	a1,a0
c0005e78:	00050493          	mv	s1,a0
c0005e7c:	00009517          	auipc	a0,0x9
c0005e80:	cb850513          	addi	a0,a0,-840 # c000eb34 <default_pmm_manager+0x87c>
c0005e84:	00812c23          	sw	s0,24(sp)
c0005e88:	01212823          	sw	s2,16(sp)
c0005e8c:	01312623          	sw	s3,12(sp)
c0005e90:	01412423          	sw	s4,8(sp)
c0005e94:	01512223          	sw	s5,4(sp)
c0005e98:	00112e23          	sw	ra,28(sp)
c0005e9c:	00100413          	li	s0,1
c0005ea0:	a3cfa0ef          	jal	ra,c00000dc <cprintf>
c0005ea4:	00009a97          	auipc	s5,0x9
c0005ea8:	cb0a8a93          	addi	s5,s5,-848 # c000eb54 <default_pmm_manager+0x89c>
c0005eac:	00a00913          	li	s2,10
c0005eb0:	00009a17          	auipc	s4,0x9
c0005eb4:	cd4a0a13          	addi	s4,s4,-812 # c000eb84 <default_pmm_manager+0x8cc>
c0005eb8:	00500993          	li	s3,5
c0005ebc:	00040593          	mv	a1,s0
c0005ec0:	00048613          	mv	a2,s1
c0005ec4:	000a8513          	mv	a0,s5
c0005ec8:	a14fa0ef          	jal	ra,c00000dc <cprintf>
c0005ecc:	00090513          	mv	a0,s2
c0005ed0:	4e0020ef          	jal	ra,c00083b0 <do_sleep>
c0005ed4:	00048513          	mv	a0,s1
c0005ed8:	eb9ff0ef          	jal	ra,c0005d90 <phi_take_forks_sema>
c0005edc:	00040593          	mv	a1,s0
c0005ee0:	00048613          	mv	a2,s1
c0005ee4:	000a0513          	mv	a0,s4
c0005ee8:	9f4fa0ef          	jal	ra,c00000dc <cprintf>
c0005eec:	00090513          	mv	a0,s2
c0005ef0:	4c0020ef          	jal	ra,c00083b0 <do_sleep>
c0005ef4:	00140413          	addi	s0,s0,1
c0005ef8:	00048513          	mv	a0,s1
c0005efc:	f05ff0ef          	jal	ra,c0005e00 <phi_put_forks_sema>
c0005f00:	fb341ee3          	bne	s0,s3,c0005ebc <philosopher_using_semaphore+0x50>
c0005f04:	00048593          	mv	a1,s1
c0005f08:	00009517          	auipc	a0,0x9
c0005f0c:	ca850513          	addi	a0,a0,-856 # c000ebb0 <default_pmm_manager+0x8f8>
c0005f10:	9ccfa0ef          	jal	ra,c00000dc <cprintf>
c0005f14:	01c12083          	lw	ra,28(sp)
c0005f18:	00000513          	li	a0,0
c0005f1c:	01812403          	lw	s0,24(sp)
c0005f20:	01412483          	lw	s1,20(sp)
c0005f24:	01012903          	lw	s2,16(sp)
c0005f28:	00c12983          	lw	s3,12(sp)
c0005f2c:	00812a03          	lw	s4,8(sp)
c0005f30:	00412a83          	lw	s5,4(sp)
c0005f34:	02010113          	addi	sp,sp,32
c0005f38:	00008067          	ret

c0005f3c <phi_test_condvar>:
c0005f3c:	fe010113          	addi	sp,sp,-32
c0005f40:	00912a23          	sw	s1,20(sp)
c0005f44:	00040797          	auipc	a5,0x40
c0005f48:	b1c78793          	addi	a5,a5,-1252 # c0045a60 <state_condvar>
c0005f4c:	00251493          	slli	s1,a0,0x2
c0005f50:	01212823          	sw	s2,16(sp)
c0005f54:	00978933          	add	s2,a5,s1
c0005f58:	00092683          	lw	a3,0(s2) # 1000 <_binary_obj___user_faultread_out_size-0x10a8>
c0005f5c:	00112e23          	sw	ra,28(sp)
c0005f60:	00812c23          	sw	s0,24(sp)
c0005f64:	01312623          	sw	s3,12(sp)
c0005f68:	00100713          	li	a4,1
c0005f6c:	02e68063          	beq	a3,a4,c0005f8c <phi_test_condvar+0x50>
c0005f70:	01c12083          	lw	ra,28(sp)
c0005f74:	01812403          	lw	s0,24(sp)
c0005f78:	01412483          	lw	s1,20(sp)
c0005f7c:	01012903          	lw	s2,16(sp)
c0005f80:	00c12983          	lw	s3,12(sp)
c0005f84:	02010113          	addi	sp,sp,32
c0005f88:	00008067          	ret
c0005f8c:	00450713          	addi	a4,a0,4
c0005f90:	00500693          	li	a3,5
c0005f94:	02d76733          	rem	a4,a4,a3
c0005f98:	00200993          	li	s3,2
c0005f9c:	01371733          	sll	a4,a4,s3
c0005fa0:	00e78733          	add	a4,a5,a4
c0005fa4:	00072703          	lw	a4,0(a4)
c0005fa8:	fd3704e3          	beq	a4,s3,c0005f70 <phi_test_condvar+0x34>
c0005fac:	00150713          	addi	a4,a0,1
c0005fb0:	02d76733          	rem	a4,a4,a3
c0005fb4:	01371733          	sll	a4,a4,s3
c0005fb8:	00e787b3          	add	a5,a5,a4
c0005fbc:	0007a783          	lw	a5,0(a5)
c0005fc0:	fb3788e3          	beq	a5,s3,c0005f70 <phi_test_condvar+0x34>
c0005fc4:	00050413          	mv	s0,a0
c0005fc8:	00050593          	mv	a1,a0
c0005fcc:	00009517          	auipc	a0,0x9
c0005fd0:	a6c50513          	addi	a0,a0,-1428 # c000ea38 <default_pmm_manager+0x780>
c0005fd4:	908fa0ef          	jal	ra,c00000dc <cprintf>
c0005fd8:	00040593          	mv	a1,s0
c0005fdc:	00009517          	auipc	a0,0x9
c0005fe0:	a9050513          	addi	a0,a0,-1392 # c000ea6c <default_pmm_manager+0x7b4>
c0005fe4:	01392023          	sw	s3,0(s2)
c0005fe8:	8f4fa0ef          	jal	ra,c00000dc <cprintf>
c0005fec:	00036797          	auipc	a5,0x36
c0005ff0:	4ec7a783          	lw	a5,1260(a5) # c003c4d8 <mtp>
c0005ff4:	00848533          	add	a0,s1,s0
c0005ff8:	01c7a783          	lw	a5,28(a5)
c0005ffc:	01351533          	sll	a0,a0,s3
c0006000:	01c12083          	lw	ra,28(sp)
c0006004:	01812403          	lw	s0,24(sp)
c0006008:	01412483          	lw	s1,20(sp)
c000600c:	01012903          	lw	s2,16(sp)
c0006010:	00c12983          	lw	s3,12(sp)
c0006014:	00a78533          	add	a0,a5,a0
c0006018:	02010113          	addi	sp,sp,32
c000601c:	7b40006f          	j	c00067d0 <cond_signal>

c0006020 <phi_take_forks_condvar>:
c0006020:	fe010113          	addi	sp,sp,-32
c0006024:	00912a23          	sw	s1,20(sp)
c0006028:	00050493          	mv	s1,a0
c000602c:	00036517          	auipc	a0,0x36
c0006030:	4ac52503          	lw	a0,1196(a0) # c003c4d8 <mtp>
c0006034:	00112e23          	sw	ra,28(sp)
c0006038:	00812c23          	sw	s0,24(sp)
c000603c:	01212823          	sw	s2,16(sp)
c0006040:	01312623          	sw	s3,12(sp)
c0006044:	00040417          	auipc	s0,0x40
c0006048:	a1c40413          	addi	s0,s0,-1508 # c0045a60 <state_condvar>
c000604c:	664000ef          	jal	ra,c00066b0 <down>
c0006050:	00249993          	slli	s3,s1,0x2
c0006054:	01340433          	add	s0,s0,s3
c0006058:	00100913          	li	s2,1
c000605c:	00048513          	mv	a0,s1
c0006060:	01242023          	sw	s2,0(s0)
c0006064:	ed9ff0ef          	jal	ra,c0005f3c <phi_test_condvar>
c0006068:	00042783          	lw	a5,0(s0)
c000606c:	03278a63          	beq	a5,s2,c00060a0 <phi_take_forks_condvar+0x80>
c0006070:	00036517          	auipc	a0,0x36
c0006074:	46852503          	lw	a0,1128(a0) # c003c4d8 <mtp>
c0006078:	01852783          	lw	a5,24(a0)
c000607c:	00f05463          	blez	a5,c0006084 <phi_take_forks_condvar+0x64>
c0006080:	00c50513          	addi	a0,a0,12
c0006084:	01c12083          	lw	ra,28(sp)
c0006088:	01812403          	lw	s0,24(sp)
c000608c:	01412483          	lw	s1,20(sp)
c0006090:	01012903          	lw	s2,16(sp)
c0006094:	00c12983          	lw	s3,12(sp)
c0006098:	02010113          	addi	sp,sp,32
c000609c:	6100006f          	j	c00066ac <up>
c00060a0:	00036797          	auipc	a5,0x36
c00060a4:	4387a783          	lw	a5,1080(a5) # c003c4d8 <mtp>
c00060a8:	01c7a503          	lw	a0,28(a5)
c00060ac:	009984b3          	add	s1,s3,s1
c00060b0:	00249493          	slli	s1,s1,0x2
c00060b4:	00950533          	add	a0,a0,s1
c00060b8:	7a8000ef          	jal	ra,c0006860 <cond_wait>
c00060bc:	fb5ff06f          	j	c0006070 <phi_take_forks_condvar+0x50>

c00060c0 <phi_put_forks_condvar>:
c00060c0:	ff010113          	addi	sp,sp,-16
c00060c4:	00812423          	sw	s0,8(sp)
c00060c8:	00050413          	mv	s0,a0
c00060cc:	00036517          	auipc	a0,0x36
c00060d0:	40c52503          	lw	a0,1036(a0) # c003c4d8 <mtp>
c00060d4:	00112623          	sw	ra,12(sp)
c00060d8:	00912223          	sw	s1,4(sp)
c00060dc:	5d4000ef          	jal	ra,c00066b0 <down>
c00060e0:	00500493          	li	s1,5
c00060e4:	00440513          	addi	a0,s0,4
c00060e8:	02956533          	rem	a0,a0,s1
c00060ec:	00241713          	slli	a4,s0,0x2
c00060f0:	00040797          	auipc	a5,0x40
c00060f4:	97078793          	addi	a5,a5,-1680 # c0045a60 <state_condvar>
c00060f8:	00e787b3          	add	a5,a5,a4
c00060fc:	0007a023          	sw	zero,0(a5)
c0006100:	e3dff0ef          	jal	ra,c0005f3c <phi_test_condvar>
c0006104:	00140513          	addi	a0,s0,1
c0006108:	02956533          	rem	a0,a0,s1
c000610c:	e31ff0ef          	jal	ra,c0005f3c <phi_test_condvar>
c0006110:	00036517          	auipc	a0,0x36
c0006114:	3c852503          	lw	a0,968(a0) # c003c4d8 <mtp>
c0006118:	01852783          	lw	a5,24(a0)
c000611c:	00f05463          	blez	a5,c0006124 <phi_put_forks_condvar+0x64>
c0006120:	00c50513          	addi	a0,a0,12
c0006124:	00c12083          	lw	ra,12(sp)
c0006128:	00812403          	lw	s0,8(sp)
c000612c:	00412483          	lw	s1,4(sp)
c0006130:	01010113          	addi	sp,sp,16
c0006134:	5780006f          	j	c00066ac <up>

c0006138 <philosopher_using_condvar>:
c0006138:	fe010113          	addi	sp,sp,-32
c000613c:	00912a23          	sw	s1,20(sp)
c0006140:	00050593          	mv	a1,a0
c0006144:	00050493          	mv	s1,a0
c0006148:	00009517          	auipc	a0,0x9
c000614c:	94c50513          	addi	a0,a0,-1716 # c000ea94 <default_pmm_manager+0x7dc>
c0006150:	00812c23          	sw	s0,24(sp)
c0006154:	01212823          	sw	s2,16(sp)
c0006158:	01312623          	sw	s3,12(sp)
c000615c:	01412423          	sw	s4,8(sp)
c0006160:	01512223          	sw	s5,4(sp)
c0006164:	00112e23          	sw	ra,28(sp)
c0006168:	00100413          	li	s0,1
c000616c:	f71f90ef          	jal	ra,c00000dc <cprintf>
c0006170:	00009a97          	auipc	s5,0x9
c0006174:	944a8a93          	addi	s5,s5,-1724 # c000eab4 <default_pmm_manager+0x7fc>
c0006178:	00a00913          	li	s2,10
c000617c:	00009a17          	auipc	s4,0x9
c0006180:	968a0a13          	addi	s4,s4,-1688 # c000eae4 <default_pmm_manager+0x82c>
c0006184:	00500993          	li	s3,5
c0006188:	00040593          	mv	a1,s0
c000618c:	00048613          	mv	a2,s1
c0006190:	000a8513          	mv	a0,s5
c0006194:	f49f90ef          	jal	ra,c00000dc <cprintf>
c0006198:	00090513          	mv	a0,s2
c000619c:	214020ef          	jal	ra,c00083b0 <do_sleep>
c00061a0:	00048513          	mv	a0,s1
c00061a4:	e7dff0ef          	jal	ra,c0006020 <phi_take_forks_condvar>
c00061a8:	00040593          	mv	a1,s0
c00061ac:	00048613          	mv	a2,s1
c00061b0:	000a0513          	mv	a0,s4
c00061b4:	f29f90ef          	jal	ra,c00000dc <cprintf>
c00061b8:	00090513          	mv	a0,s2
c00061bc:	1f4020ef          	jal	ra,c00083b0 <do_sleep>
c00061c0:	00140413          	addi	s0,s0,1
c00061c4:	00048513          	mv	a0,s1
c00061c8:	ef9ff0ef          	jal	ra,c00060c0 <phi_put_forks_condvar>
c00061cc:	fb341ee3          	bne	s0,s3,c0006188 <philosopher_using_condvar+0x50>
c00061d0:	00048593          	mv	a1,s1
c00061d4:	00009517          	auipc	a0,0x9
c00061d8:	94050513          	addi	a0,a0,-1728 # c000eb14 <default_pmm_manager+0x85c>
c00061dc:	f01f90ef          	jal	ra,c00000dc <cprintf>
c00061e0:	01c12083          	lw	ra,28(sp)
c00061e4:	00000513          	li	a0,0
c00061e8:	01812403          	lw	s0,24(sp)
c00061ec:	01412483          	lw	s1,20(sp)
c00061f0:	01012903          	lw	s2,16(sp)
c00061f4:	00c12983          	lw	s3,12(sp)
c00061f8:	00812a03          	lw	s4,8(sp)
c00061fc:	00412a83          	lw	s5,4(sp)
c0006200:	02010113          	addi	sp,sp,32
c0006204:	00008067          	ret

c0006208 <check_sync>:
c0006208:	fe010113          	addi	sp,sp,-32
c000620c:	00100593          	li	a1,1
c0006210:	00040517          	auipc	a0,0x40
c0006214:	82450513          	addi	a0,a0,-2012 # c0045a34 <mutex>
c0006218:	00812c23          	sw	s0,24(sp)
c000621c:	00912a23          	sw	s1,20(sp)
c0006220:	01212823          	sw	s2,16(sp)
c0006224:	01312623          	sw	s3,12(sp)
c0006228:	01412423          	sw	s4,8(sp)
c000622c:	01512223          	sw	s5,4(sp)
c0006230:	00112e23          	sw	ra,28(sp)
c0006234:	00040917          	auipc	s2,0x40
c0006238:	85490913          	addi	s2,s2,-1964 # c0045a88 <s>
c000623c:	464000ef          	jal	ra,c00066a0 <sem_init>
c0006240:	00040497          	auipc	s1,0x40
c0006244:	83448493          	addi	s1,s1,-1996 # c0045a74 <philosopher_proc_sema>
c0006248:	00000413          	li	s0,0
c000624c:	00000a97          	auipc	s5,0x0
c0006250:	c20a8a93          	addi	s5,s5,-992 # c0005e6c <philosopher_using_semaphore>
c0006254:	00008a17          	auipc	s4,0x8
c0006258:	780a0a13          	addi	s4,s4,1920 # c000e9d4 <default_pmm_manager+0x71c>
c000625c:	00500993          	li	s3,5
c0006260:	00000593          	li	a1,0
c0006264:	00090513          	mv	a0,s2
c0006268:	438000ef          	jal	ra,c00066a0 <sem_init>
c000626c:	00000613          	li	a2,0
c0006270:	00040593          	mv	a1,s0
c0006274:	000a8513          	mv	a0,s5
c0006278:	1ac010ef          	jal	ra,c0007424 <kernel_thread>
c000627c:	0aa05a63          	blez	a0,c0006330 <check_sync+0x128>
c0006280:	3c9000ef          	jal	ra,c0006e48 <find_proc>
c0006284:	00a4a023          	sw	a0,0(s1)
c0006288:	000a0593          	mv	a1,s4
c000628c:	00140413          	addi	s0,s0,1
c0006290:	00c90913          	addi	s2,s2,12
c0006294:	2d9000ef          	jal	ra,c0006d6c <set_proc_name>
c0006298:	00448493          	addi	s1,s1,4
c000629c:	fd3412e3          	bne	s0,s3,c0006260 <check_sync+0x58>
c00062a0:	00040593          	mv	a1,s0
c00062a4:	0003f517          	auipc	a0,0x3f
c00062a8:	79c50513          	addi	a0,a0,1948 # c0045a40 <mt>
c00062ac:	440000ef          	jal	ra,c00066ec <monitor_init>
c00062b0:	0003f997          	auipc	s3,0x3f
c00062b4:	7b098993          	addi	s3,s3,1968 # c0045a60 <state_condvar>
c00062b8:	0003f917          	auipc	s2,0x3f
c00062bc:	76890913          	addi	s2,s2,1896 # c0045a20 <philosopher_proc_condvar>
c00062c0:	00000493          	li	s1,0
c00062c4:	00000a97          	auipc	s5,0x0
c00062c8:	e74a8a93          	addi	s5,s5,-396 # c0006138 <philosopher_using_condvar>
c00062cc:	00008a17          	auipc	s4,0x8
c00062d0:	750a0a13          	addi	s4,s4,1872 # c000ea1c <default_pmm_manager+0x764>
c00062d4:	00000613          	li	a2,0
c00062d8:	00048593          	mv	a1,s1
c00062dc:	000a8513          	mv	a0,s5
c00062e0:	0009a023          	sw	zero,0(s3)
c00062e4:	140010ef          	jal	ra,c0007424 <kernel_thread>
c00062e8:	06a05063          	blez	a0,c0006348 <check_sync+0x140>
c00062ec:	35d000ef          	jal	ra,c0006e48 <find_proc>
c00062f0:	00a92023          	sw	a0,0(s2)
c00062f4:	000a0593          	mv	a1,s4
c00062f8:	00148493          	addi	s1,s1,1
c00062fc:	00498993          	addi	s3,s3,4
c0006300:	26d000ef          	jal	ra,c0006d6c <set_proc_name>
c0006304:	00490913          	addi	s2,s2,4
c0006308:	fc8496e3          	bne	s1,s0,c00062d4 <check_sync+0xcc>
c000630c:	01c12083          	lw	ra,28(sp)
c0006310:	01812403          	lw	s0,24(sp)
c0006314:	01412483          	lw	s1,20(sp)
c0006318:	01012903          	lw	s2,16(sp)
c000631c:	00c12983          	lw	s3,12(sp)
c0006320:	00812a03          	lw	s4,8(sp)
c0006324:	00412a83          	lw	s5,4(sp)
c0006328:	02010113          	addi	sp,sp,32
c000632c:	00008067          	ret
c0006330:	00008617          	auipc	a2,0x8
c0006334:	65860613          	addi	a2,a2,1624 # c000e988 <default_pmm_manager+0x6d0>
c0006338:	0f700593          	li	a1,247
c000633c:	00008517          	auipc	a0,0x8
c0006340:	68050513          	addi	a0,a0,1664 # c000e9bc <default_pmm_manager+0x704>
c0006344:	f0df90ef          	jal	ra,c0000250 <__panic>
c0006348:	00008617          	auipc	a2,0x8
c000634c:	6a460613          	addi	a2,a2,1700 # c000e9ec <default_pmm_manager+0x734>
c0006350:	10300593          	li	a1,259
c0006354:	00008517          	auipc	a0,0x8
c0006358:	66850513          	addi	a0,a0,1640 # c000e9bc <default_pmm_manager+0x704>
c000635c:	ef5f90ef          	jal	ra,c0000250 <__panic>

c0006360 <wait_queue_del.part.1>:
c0006360:	ff010113          	addi	sp,sp,-16
c0006364:	00009697          	auipc	a3,0x9
c0006368:	87c68693          	addi	a3,a3,-1924 # c000ebe0 <default_pmm_manager+0x928>
c000636c:	00007617          	auipc	a2,0x7
c0006370:	f0860613          	addi	a2,a2,-248 # c000d274 <commands+0x3d8>
c0006374:	01c00593          	li	a1,28
c0006378:	00009517          	auipc	a0,0x9
c000637c:	8a850513          	addi	a0,a0,-1880 # c000ec20 <default_pmm_manager+0x968>
c0006380:	00112623          	sw	ra,12(sp)
c0006384:	ecdf90ef          	jal	ra,c0000250 <__panic>

c0006388 <wait_queue_init>:
c0006388:	00a52223          	sw	a0,4(a0)
c000638c:	00a52023          	sw	a0,0(a0)
c0006390:	00008067          	ret

c0006394 <wait_queue_del>:
c0006394:	0105a703          	lw	a4,16(a1)
c0006398:	00c58793          	addi	a5,a1,12
c000639c:	02e78263          	beq	a5,a4,c00063c0 <wait_queue_del+0x2c>
c00063a0:	0085a683          	lw	a3,8(a1)
c00063a4:	00a69e63          	bne	a3,a0,c00063c0 <wait_queue_del+0x2c>
c00063a8:	00c5a683          	lw	a3,12(a1)
c00063ac:	00e6a223          	sw	a4,4(a3)
c00063b0:	00d72023          	sw	a3,0(a4)
c00063b4:	00f5a823          	sw	a5,16(a1)
c00063b8:	00f5a623          	sw	a5,12(a1)
c00063bc:	00008067          	ret
c00063c0:	ff010113          	addi	sp,sp,-16
c00063c4:	00112623          	sw	ra,12(sp)
c00063c8:	f99ff0ef          	jal	ra,c0006360 <wait_queue_del.part.1>

c00063cc <wait_queue_first>:
c00063cc:	00452783          	lw	a5,4(a0)
c00063d0:	00a78663          	beq	a5,a0,c00063dc <wait_queue_first+0x10>
c00063d4:	ff478513          	addi	a0,a5,-12
c00063d8:	00008067          	ret
c00063dc:	00000513          	li	a0,0
c00063e0:	00008067          	ret

c00063e4 <wait_in_queue>:
c00063e4:	01052783          	lw	a5,16(a0)
c00063e8:	00c50513          	addi	a0,a0,12
c00063ec:	40a78533          	sub	a0,a5,a0
c00063f0:	00a03533          	snez	a0,a0
c00063f4:	00008067          	ret

c00063f8 <wakeup_wait>:
c00063f8:	02068663          	beqz	a3,c0006424 <wakeup_wait+0x2c>
c00063fc:	0105a703          	lw	a4,16(a1)
c0006400:	00c58793          	addi	a5,a1,12
c0006404:	02e78663          	beq	a5,a4,c0006430 <wakeup_wait+0x38>
c0006408:	0085a683          	lw	a3,8(a1)
c000640c:	02d51263          	bne	a0,a3,c0006430 <wakeup_wait+0x38>
c0006410:	00c5a683          	lw	a3,12(a1)
c0006414:	00e6a223          	sw	a4,4(a3)
c0006418:	00d72023          	sw	a3,0(a4)
c000641c:	00f5a823          	sw	a5,16(a1)
c0006420:	00f5a623          	sw	a5,12(a1)
c0006424:	0005a503          	lw	a0,0(a1)
c0006428:	00c5a223          	sw	a2,4(a1)
c000642c:	0c40206f          	j	c00084f0 <wakeup_proc>
c0006430:	ff010113          	addi	sp,sp,-16
c0006434:	00112623          	sw	ra,12(sp)
c0006438:	f29ff0ef          	jal	ra,c0006360 <wait_queue_del.part.1>

c000643c <wait_current_set>:
c000643c:	0003f797          	auipc	a5,0x3f
c0006440:	4e87a783          	lw	a5,1256(a5) # c0045924 <current>
c0006444:	04078063          	beqz	a5,c0006484 <wait_current_set+0x48>
c0006448:	00c58713          	addi	a4,a1,12
c000644c:	800006b7          	lui	a3,0x80000
c0006450:	00e5a623          	sw	a4,12(a1)
c0006454:	00f5a023          	sw	a5,0(a1)
c0006458:	00d5a223          	sw	a3,4(a1)
c000645c:	00100693          	li	a3,1
c0006460:	00d7a023          	sw	a3,0(a5)
c0006464:	0ac7a423          	sw	a2,168(a5)
c0006468:	00052783          	lw	a5,0(a0)
c000646c:	00a5a423          	sw	a0,8(a1)
c0006470:	00e52023          	sw	a4,0(a0)
c0006474:	00e7a223          	sw	a4,4(a5)
c0006478:	00a5a823          	sw	a0,16(a1)
c000647c:	00f5a623          	sw	a5,12(a1)
c0006480:	00008067          	ret
c0006484:	ff010113          	addi	sp,sp,-16
c0006488:	00008697          	auipc	a3,0x8
c000648c:	74868693          	addi	a3,a3,1864 # c000ebd0 <default_pmm_manager+0x918>
c0006490:	00007617          	auipc	a2,0x7
c0006494:	de460613          	addi	a2,a2,-540 # c000d274 <commands+0x3d8>
c0006498:	07400593          	li	a1,116
c000649c:	00008517          	auipc	a0,0x8
c00064a0:	78450513          	addi	a0,a0,1924 # c000ec20 <default_pmm_manager+0x968>
c00064a4:	00112623          	sw	ra,12(sp)
c00064a8:	da9f90ef          	jal	ra,c0000250 <__panic>

c00064ac <__down.constprop.0>:
c00064ac:	fd010113          	addi	sp,sp,-48
c00064b0:	02812423          	sw	s0,40(sp)
c00064b4:	02112623          	sw	ra,44(sp)
c00064b8:	02912223          	sw	s1,36(sp)
c00064bc:	00050413          	mv	s0,a0
c00064c0:	100027f3          	csrr	a5,sstatus
c00064c4:	0027f793          	andi	a5,a5,2
c00064c8:	02079663          	bnez	a5,c00064f4 <__down.constprop.0+0x48>
c00064cc:	00052783          	lw	a5,0(a0)
c00064d0:	04f05a63          	blez	a5,c0006524 <__down.constprop.0+0x78>
c00064d4:	fff78793          	addi	a5,a5,-1
c00064d8:	00f42023          	sw	a5,0(s0)
c00064dc:	02c12083          	lw	ra,44(sp)
c00064e0:	00000513          	li	a0,0
c00064e4:	02812403          	lw	s0,40(sp)
c00064e8:	02412483          	lw	s1,36(sp)
c00064ec:	03010113          	addi	sp,sp,48
c00064f0:	00008067          	ret
c00064f4:	b30fa0ef          	jal	ra,c0000824 <intr_disable>
c00064f8:	00042783          	lw	a5,0(s0)
c00064fc:	0af05063          	blez	a5,c000659c <__down.constprop.0+0xf0>
c0006500:	fff78793          	addi	a5,a5,-1
c0006504:	00f42023          	sw	a5,0(s0)
c0006508:	b14fa0ef          	jal	ra,c000081c <intr_enable>
c000650c:	02c12083          	lw	ra,44(sp)
c0006510:	00000513          	li	a0,0
c0006514:	02812403          	lw	s0,40(sp)
c0006518:	02412483          	lw	s1,36(sp)
c000651c:	03010113          	addi	sp,sp,48
c0006520:	00008067          	ret
c0006524:	00450413          	addi	s0,a0,4
c0006528:	00c10493          	addi	s1,sp,12
c000652c:	10000613          	li	a2,256
c0006530:	00048593          	mv	a1,s1
c0006534:	00040513          	mv	a0,s0
c0006538:	f05ff0ef          	jal	ra,c000643c <wait_current_set>
c000653c:	0a4020ef          	jal	ra,c00085e0 <schedule>
c0006540:	100027f3          	csrr	a5,sstatus
c0006544:	0027f793          	andi	a5,a5,2
c0006548:	02079863          	bnez	a5,c0006578 <__down.constprop.0+0xcc>
c000654c:	00048513          	mv	a0,s1
c0006550:	e95ff0ef          	jal	ra,c00063e4 <wait_in_queue>
c0006554:	06051463          	bnez	a0,c00065bc <__down.constprop.0+0x110>
c0006558:	01012503          	lw	a0,16(sp)
c000655c:	10000793          	li	a5,256
c0006560:	f6f50ee3          	beq	a0,a5,c00064dc <__down.constprop.0+0x30>
c0006564:	02c12083          	lw	ra,44(sp)
c0006568:	02812403          	lw	s0,40(sp)
c000656c:	02412483          	lw	s1,36(sp)
c0006570:	03010113          	addi	sp,sp,48
c0006574:	00008067          	ret
c0006578:	aacfa0ef          	jal	ra,c0000824 <intr_disable>
c000657c:	00048513          	mv	a0,s1
c0006580:	e65ff0ef          	jal	ra,c00063e4 <wait_in_queue>
c0006584:	00050863          	beqz	a0,c0006594 <__down.constprop.0+0xe8>
c0006588:	00048593          	mv	a1,s1
c000658c:	00040513          	mv	a0,s0
c0006590:	e05ff0ef          	jal	ra,c0006394 <wait_queue_del>
c0006594:	a88fa0ef          	jal	ra,c000081c <intr_enable>
c0006598:	fc1ff06f          	j	c0006558 <__down.constprop.0+0xac>
c000659c:	00440413          	addi	s0,s0,4
c00065a0:	00c10493          	addi	s1,sp,12
c00065a4:	10000613          	li	a2,256
c00065a8:	00048593          	mv	a1,s1
c00065ac:	00040513          	mv	a0,s0
c00065b0:	e8dff0ef          	jal	ra,c000643c <wait_current_set>
c00065b4:	a68fa0ef          	jal	ra,c000081c <intr_enable>
c00065b8:	f85ff06f          	j	c000653c <__down.constprop.0+0x90>
c00065bc:	00048593          	mv	a1,s1
c00065c0:	00040513          	mv	a0,s0
c00065c4:	dd1ff0ef          	jal	ra,c0006394 <wait_queue_del>
c00065c8:	f91ff06f          	j	c0006558 <__down.constprop.0+0xac>

c00065cc <__up.constprop.1>:
c00065cc:	ff010113          	addi	sp,sp,-16
c00065d0:	00912223          	sw	s1,4(sp)
c00065d4:	00112623          	sw	ra,12(sp)
c00065d8:	00812423          	sw	s0,8(sp)
c00065dc:	01212023          	sw	s2,0(sp)
c00065e0:	00050493          	mv	s1,a0
c00065e4:	100027f3          	csrr	a5,sstatus
c00065e8:	0027f793          	andi	a5,a5,2
c00065ec:	00000913          	li	s2,0
c00065f0:	06079463          	bnez	a5,c0006658 <__up.constprop.1+0x8c>
c00065f4:	00448413          	addi	s0,s1,4
c00065f8:	00040513          	mv	a0,s0
c00065fc:	dd1ff0ef          	jal	ra,c00063cc <wait_queue_first>
c0006600:	06050863          	beqz	a0,c0006670 <__up.constprop.1+0xa4>
c0006604:	00052703          	lw	a4,0(a0)
c0006608:	10000793          	li	a5,256
c000660c:	0a872603          	lw	a2,168(a4)
c0006610:	06f61863          	bne	a2,a5,c0006680 <__up.constprop.1+0xb4>
c0006614:	00050593          	mv	a1,a0
c0006618:	00100693          	li	a3,1
c000661c:	00040513          	mv	a0,s0
c0006620:	dd9ff0ef          	jal	ra,c00063f8 <wakeup_wait>
c0006624:	00091e63          	bnez	s2,c0006640 <__up.constprop.1+0x74>
c0006628:	00c12083          	lw	ra,12(sp)
c000662c:	00812403          	lw	s0,8(sp)
c0006630:	00412483          	lw	s1,4(sp)
c0006634:	00012903          	lw	s2,0(sp)
c0006638:	01010113          	addi	sp,sp,16
c000663c:	00008067          	ret
c0006640:	00c12083          	lw	ra,12(sp)
c0006644:	00812403          	lw	s0,8(sp)
c0006648:	00412483          	lw	s1,4(sp)
c000664c:	00012903          	lw	s2,0(sp)
c0006650:	01010113          	addi	sp,sp,16
c0006654:	9c8fa06f          	j	c000081c <intr_enable>
c0006658:	9ccfa0ef          	jal	ra,c0000824 <intr_disable>
c000665c:	00448413          	addi	s0,s1,4
c0006660:	00040513          	mv	a0,s0
c0006664:	00100913          	li	s2,1
c0006668:	d65ff0ef          	jal	ra,c00063cc <wait_queue_first>
c000666c:	f8051ce3          	bnez	a0,c0006604 <__up.constprop.1+0x38>
c0006670:	0004a783          	lw	a5,0(s1)
c0006674:	00178793          	addi	a5,a5,1
c0006678:	00f4a023          	sw	a5,0(s1)
c000667c:	fa9ff06f          	j	c0006624 <__up.constprop.1+0x58>
c0006680:	00008697          	auipc	a3,0x8
c0006684:	5b468693          	addi	a3,a3,1460 # c000ec34 <default_pmm_manager+0x97c>
c0006688:	00007617          	auipc	a2,0x7
c000668c:	bec60613          	addi	a2,a2,-1044 # c000d274 <commands+0x3d8>
c0006690:	01900593          	li	a1,25
c0006694:	00008517          	auipc	a0,0x8
c0006698:	5c850513          	addi	a0,a0,1480 # c000ec5c <default_pmm_manager+0x9a4>
c000669c:	bb5f90ef          	jal	ra,c0000250 <__panic>

c00066a0 <sem_init>:
c00066a0:	00b52023          	sw	a1,0(a0)
c00066a4:	00450513          	addi	a0,a0,4
c00066a8:	ce1ff06f          	j	c0006388 <wait_queue_init>

c00066ac <up>:
c00066ac:	f21ff06f          	j	c00065cc <__up.constprop.1>

c00066b0 <down>:
c00066b0:	ff010113          	addi	sp,sp,-16
c00066b4:	00112623          	sw	ra,12(sp)
c00066b8:	df5ff0ef          	jal	ra,c00064ac <__down.constprop.0>
c00066bc:	00051863          	bnez	a0,c00066cc <down+0x1c>
c00066c0:	00c12083          	lw	ra,12(sp)
c00066c4:	01010113          	addi	sp,sp,16
c00066c8:	00008067          	ret
c00066cc:	00008697          	auipc	a3,0x8
c00066d0:	5a068693          	addi	a3,a3,1440 # c000ec6c <default_pmm_manager+0x9b4>
c00066d4:	00007617          	auipc	a2,0x7
c00066d8:	ba060613          	addi	a2,a2,-1120 # c000d274 <commands+0x3d8>
c00066dc:	04000593          	li	a1,64
c00066e0:	00008517          	auipc	a0,0x8
c00066e4:	57c50513          	addi	a0,a0,1404 # c000ec5c <default_pmm_manager+0x9a4>
c00066e8:	b69f90ef          	jal	ra,c0000250 <__panic>

c00066ec <monitor_init>:
c00066ec:	fe010113          	addi	sp,sp,-32
c00066f0:	00112e23          	sw	ra,28(sp)
c00066f4:	00812c23          	sw	s0,24(sp)
c00066f8:	00912a23          	sw	s1,20(sp)
c00066fc:	01212823          	sw	s2,16(sp)
c0006700:	01312623          	sw	s3,12(sp)
c0006704:	08058663          	beqz	a1,c0006790 <monitor_init+0xa4>
c0006708:	00058993          	mv	s3,a1
c000670c:	00052c23          	sw	zero,24(a0)
c0006710:	00100593          	li	a1,1
c0006714:	00052e23          	sw	zero,28(a0)
c0006718:	00050913          	mv	s2,a0
c000671c:	f85ff0ef          	jal	ra,c00066a0 <sem_init>
c0006720:	00000593          	li	a1,0
c0006724:	00c90513          	addi	a0,s2,12
c0006728:	f79ff0ef          	jal	ra,c00066a0 <sem_init>
c000672c:	00299513          	slli	a0,s3,0x2
c0006730:	01350533          	add	a0,a0,s3
c0006734:	00251513          	slli	a0,a0,0x2
c0006738:	e4dfb0ef          	jal	ra,c0002584 <kmalloc>
c000673c:	00a92e23          	sw	a0,28(s2)
c0006740:	00000413          	li	s0,0
c0006744:	00000493          	li	s1,0
c0006748:	06050463          	beqz	a0,c00067b0 <monitor_init+0xc4>
c000674c:	00850533          	add	a0,a0,s0
c0006750:	00052623          	sw	zero,12(a0)
c0006754:	00000593          	li	a1,0
c0006758:	f49ff0ef          	jal	ra,c00066a0 <sem_init>
c000675c:	01c92503          	lw	a0,28(s2)
c0006760:	00148493          	addi	s1,s1,1
c0006764:	008507b3          	add	a5,a0,s0
c0006768:	0127a823          	sw	s2,16(a5)
c000676c:	01440413          	addi	s0,s0,20
c0006770:	fd349ee3          	bne	s1,s3,c000674c <monitor_init+0x60>
c0006774:	01c12083          	lw	ra,28(sp)
c0006778:	01812403          	lw	s0,24(sp)
c000677c:	01412483          	lw	s1,20(sp)
c0006780:	01012903          	lw	s2,16(sp)
c0006784:	00c12983          	lw	s3,12(sp)
c0006788:	02010113          	addi	sp,sp,32
c000678c:	00008067          	ret
c0006790:	00008697          	auipc	a3,0x8
c0006794:	5fc68693          	addi	a3,a3,1532 # c000ed8c <default_pmm_manager+0xad4>
c0006798:	00007617          	auipc	a2,0x7
c000679c:	adc60613          	addi	a2,a2,-1316 # c000d274 <commands+0x3d8>
c00067a0:	00b00593          	li	a1,11
c00067a4:	00008517          	auipc	a0,0x8
c00067a8:	5f450513          	addi	a0,a0,1524 # c000ed98 <default_pmm_manager+0xae0>
c00067ac:	aa5f90ef          	jal	ra,c0000250 <__panic>
c00067b0:	00008697          	auipc	a3,0x8
c00067b4:	5fc68693          	addi	a3,a3,1532 # c000edac <default_pmm_manager+0xaf4>
c00067b8:	00007617          	auipc	a2,0x7
c00067bc:	abc60613          	addi	a2,a2,-1348 # c000d274 <commands+0x3d8>
c00067c0:	01100593          	li	a1,17
c00067c4:	00008517          	auipc	a0,0x8
c00067c8:	5d450513          	addi	a0,a0,1492 # c000ed98 <default_pmm_manager+0xae0>
c00067cc:	a85f90ef          	jal	ra,c0000250 <__panic>

c00067d0 <cond_signal>:
c00067d0:	01052783          	lw	a5,16(a0)
c00067d4:	00c52603          	lw	a2,12(a0)
c00067d8:	ff010113          	addi	sp,sp,-16
c00067dc:	0187a683          	lw	a3,24(a5)
c00067e0:	00812423          	sw	s0,8(sp)
c00067e4:	00050593          	mv	a1,a0
c00067e8:	00050413          	mv	s0,a0
c00067ec:	00008517          	auipc	a0,0x8
c00067f0:	48c50513          	addi	a0,a0,1164 # c000ec78 <default_pmm_manager+0x9c0>
c00067f4:	00112623          	sw	ra,12(sp)
c00067f8:	00912223          	sw	s1,4(sp)
c00067fc:	8e1f90ef          	jal	ra,c00000dc <cprintf>
c0006800:	00c42603          	lw	a2,12(s0)
c0006804:	02c05a63          	blez	a2,c0006838 <cond_signal+0x68>
c0006808:	01042483          	lw	s1,16(s0)
c000680c:	00040513          	mv	a0,s0
c0006810:	0184a783          	lw	a5,24(s1)
c0006814:	00178793          	addi	a5,a5,1
c0006818:	00f4ac23          	sw	a5,24(s1)
c000681c:	e91ff0ef          	jal	ra,c00066ac <up>
c0006820:	00c48513          	addi	a0,s1,12
c0006824:	e8dff0ef          	jal	ra,c00066b0 <down>
c0006828:	0184a783          	lw	a5,24(s1)
c000682c:	00c42603          	lw	a2,12(s0)
c0006830:	fff78793          	addi	a5,a5,-1
c0006834:	00f4ac23          	sw	a5,24(s1)
c0006838:	01042783          	lw	a5,16(s0)
c000683c:	00040593          	mv	a1,s0
c0006840:	00c12083          	lw	ra,12(sp)
c0006844:	00812403          	lw	s0,8(sp)
c0006848:	00412483          	lw	s1,4(sp)
c000684c:	0187a683          	lw	a3,24(a5)
c0006850:	00008517          	auipc	a0,0x8
c0006854:	47050513          	addi	a0,a0,1136 # c000ecc0 <default_pmm_manager+0xa08>
c0006858:	01010113          	addi	sp,sp,16
c000685c:	881f906f          	j	c00000dc <cprintf>

c0006860 <cond_wait>:
c0006860:	01052783          	lw	a5,16(a0)
c0006864:	00c52603          	lw	a2,12(a0)
c0006868:	ff010113          	addi	sp,sp,-16
c000686c:	0187a683          	lw	a3,24(a5)
c0006870:	00812423          	sw	s0,8(sp)
c0006874:	00050593          	mv	a1,a0
c0006878:	00050413          	mv	s0,a0
c000687c:	00008517          	auipc	a0,0x8
c0006880:	48850513          	addi	a0,a0,1160 # c000ed04 <default_pmm_manager+0xa4c>
c0006884:	00112623          	sw	ra,12(sp)
c0006888:	855f90ef          	jal	ra,c00000dc <cprintf>
c000688c:	01042503          	lw	a0,16(s0)
c0006890:	00c42783          	lw	a5,12(s0)
c0006894:	01852703          	lw	a4,24(a0)
c0006898:	00178793          	addi	a5,a5,1
c000689c:	00f42623          	sw	a5,12(s0)
c00068a0:	04e05263          	blez	a4,c00068e4 <cond_wait+0x84>
c00068a4:	00c50513          	addi	a0,a0,12
c00068a8:	e05ff0ef          	jal	ra,c00066ac <up>
c00068ac:	00040513          	mv	a0,s0
c00068b0:	e01ff0ef          	jal	ra,c00066b0 <down>
c00068b4:	00c42603          	lw	a2,12(s0)
c00068b8:	01042783          	lw	a5,16(s0)
c00068bc:	00040593          	mv	a1,s0
c00068c0:	fff60613          	addi	a2,a2,-1
c00068c4:	0187a683          	lw	a3,24(a5)
c00068c8:	00c12083          	lw	ra,12(sp)
c00068cc:	00c42623          	sw	a2,12(s0)
c00068d0:	00812403          	lw	s0,8(sp)
c00068d4:	00008517          	auipc	a0,0x8
c00068d8:	47450513          	addi	a0,a0,1140 # c000ed48 <default_pmm_manager+0xa90>
c00068dc:	01010113          	addi	sp,sp,16
c00068e0:	ffcf906f          	j	c00000dc <cprintf>
c00068e4:	dc9ff0ef          	jal	ra,c00066ac <up>
c00068e8:	fc5ff06f          	j	c00068ac <cond_wait+0x4c>

c00068ec <swapfs_init>:
c00068ec:	ff010113          	addi	sp,sp,-16
c00068f0:	00100513          	li	a0,1
c00068f4:	00112623          	sw	ra,12(sp)
c00068f8:	d91f90ef          	jal	ra,c0000688 <ide_device_valid>
c00068fc:	02050263          	beqz	a0,c0006920 <swapfs_init+0x34>
c0006900:	00100513          	li	a0,1
c0006904:	d8df90ef          	jal	ra,c0000690 <ide_device_size>
c0006908:	00c12083          	lw	ra,12(sp)
c000690c:	00355513          	srli	a0,a0,0x3
c0006910:	0003f297          	auipc	t0,0x3f
c0006914:	0aa2ac23          	sw	a0,184(t0) # c00459c8 <max_swap_offset>
c0006918:	01010113          	addi	sp,sp,16
c000691c:	00008067          	ret
c0006920:	00008617          	auipc	a2,0x8
c0006924:	49c60613          	addi	a2,a2,1180 # c000edbc <default_pmm_manager+0xb04>
c0006928:	00d00593          	li	a1,13
c000692c:	00008517          	auipc	a0,0x8
c0006930:	4ac50513          	addi	a0,a0,1196 # c000edd8 <default_pmm_manager+0xb20>
c0006934:	91df90ef          	jal	ra,c0000250 <__panic>

c0006938 <swapfs_read>:
c0006938:	ff010113          	addi	sp,sp,-16
c000693c:	00112623          	sw	ra,12(sp)
c0006940:	00855793          	srli	a5,a0,0x8
c0006944:	06078663          	beqz	a5,c00069b0 <swapfs_read+0x78>
c0006948:	0003f717          	auipc	a4,0x3f
c000694c:	08072703          	lw	a4,128(a4) # c00459c8 <max_swap_offset>
c0006950:	06e7f063          	bleu	a4,a5,c00069b0 <swapfs_read+0x78>
c0006954:	0003f617          	auipc	a2,0x3f
c0006958:	0b462603          	lw	a2,180(a2) # c0045a08 <pages>
c000695c:	40c58633          	sub	a2,a1,a2
c0006960:	40565613          	srai	a2,a2,0x5
c0006964:	00036597          	auipc	a1,0x36
c0006968:	b705a583          	lw	a1,-1168(a1) # c003c4d4 <nbase>
c000696c:	00100737          	lui	a4,0x100
c0006970:	00b60633          	add	a2,a2,a1
c0006974:	fff70713          	addi	a4,a4,-1 # fffff <_binary_obj___user_matrix_out_size+0xfd6b7>
c0006978:	00e67733          	and	a4,a2,a4
c000697c:	0003f697          	auipc	a3,0x3f
c0006980:	fa06a683          	lw	a3,-96(a3) # c004591c <npage>
c0006984:	00379593          	slli	a1,a5,0x3
c0006988:	00c61613          	slli	a2,a2,0xc
c000698c:	04d77063          	bleu	a3,a4,c00069cc <swapfs_read+0x94>
c0006990:	00c12083          	lw	ra,12(sp)
c0006994:	0003f797          	auipc	a5,0x3f
c0006998:	06c7a783          	lw	a5,108(a5) # c0045a00 <va_pa_offset>
c000699c:	00800693          	li	a3,8
c00069a0:	00f60633          	add	a2,a2,a5
c00069a4:	00100513          	li	a0,1
c00069a8:	01010113          	addi	sp,sp,16
c00069ac:	cedf906f          	j	c0000698 <ide_read_secs>
c00069b0:	00050693          	mv	a3,a0
c00069b4:	00008617          	auipc	a2,0x8
c00069b8:	43860613          	addi	a2,a2,1080 # c000edec <default_pmm_manager+0xb34>
c00069bc:	01400593          	li	a1,20
c00069c0:	00008517          	auipc	a0,0x8
c00069c4:	41850513          	addi	a0,a0,1048 # c000edd8 <default_pmm_manager+0xb20>
c00069c8:	889f90ef          	jal	ra,c0000250 <__panic>
c00069cc:	00060693          	mv	a3,a2
c00069d0:	06800593          	li	a1,104
c00069d4:	00007617          	auipc	a2,0x7
c00069d8:	18460613          	addi	a2,a2,388 # c000db58 <commands+0xcbc>
c00069dc:	00007517          	auipc	a0,0x7
c00069e0:	f3450513          	addi	a0,a0,-204 # c000d910 <commands+0xa74>
c00069e4:	86df90ef          	jal	ra,c0000250 <__panic>

c00069e8 <swapfs_write>:
c00069e8:	ff010113          	addi	sp,sp,-16
c00069ec:	00112623          	sw	ra,12(sp)
c00069f0:	00855793          	srli	a5,a0,0x8
c00069f4:	06078663          	beqz	a5,c0006a60 <swapfs_write+0x78>
c00069f8:	0003f717          	auipc	a4,0x3f
c00069fc:	fd072703          	lw	a4,-48(a4) # c00459c8 <max_swap_offset>
c0006a00:	06e7f063          	bleu	a4,a5,c0006a60 <swapfs_write+0x78>
c0006a04:	0003f617          	auipc	a2,0x3f
c0006a08:	00462603          	lw	a2,4(a2) # c0045a08 <pages>
c0006a0c:	40c58633          	sub	a2,a1,a2
c0006a10:	40565613          	srai	a2,a2,0x5
c0006a14:	00036597          	auipc	a1,0x36
c0006a18:	ac05a583          	lw	a1,-1344(a1) # c003c4d4 <nbase>
c0006a1c:	00100737          	lui	a4,0x100
c0006a20:	00b60633          	add	a2,a2,a1
c0006a24:	fff70713          	addi	a4,a4,-1 # fffff <_binary_obj___user_matrix_out_size+0xfd6b7>
c0006a28:	00e67733          	and	a4,a2,a4
c0006a2c:	0003f697          	auipc	a3,0x3f
c0006a30:	ef06a683          	lw	a3,-272(a3) # c004591c <npage>
c0006a34:	00379593          	slli	a1,a5,0x3
c0006a38:	00c61613          	slli	a2,a2,0xc
c0006a3c:	04d77063          	bleu	a3,a4,c0006a7c <swapfs_write+0x94>
c0006a40:	00c12083          	lw	ra,12(sp)
c0006a44:	0003f797          	auipc	a5,0x3f
c0006a48:	fbc7a783          	lw	a5,-68(a5) # c0045a00 <va_pa_offset>
c0006a4c:	00800693          	li	a3,8
c0006a50:	00f60633          	add	a2,a2,a5
c0006a54:	00100513          	li	a0,1
c0006a58:	01010113          	addi	sp,sp,16
c0006a5c:	c71f906f          	j	c00006cc <ide_write_secs>
c0006a60:	00050693          	mv	a3,a0
c0006a64:	00008617          	auipc	a2,0x8
c0006a68:	38860613          	addi	a2,a2,904 # c000edec <default_pmm_manager+0xb34>
c0006a6c:	01900593          	li	a1,25
c0006a70:	00008517          	auipc	a0,0x8
c0006a74:	36850513          	addi	a0,a0,872 # c000edd8 <default_pmm_manager+0xb20>
c0006a78:	fd8f90ef          	jal	ra,c0000250 <__panic>
c0006a7c:	00060693          	mv	a3,a2
c0006a80:	06800593          	li	a1,104
c0006a84:	00007617          	auipc	a2,0x7
c0006a88:	0d460613          	addi	a2,a2,212 # c000db58 <commands+0xcbc>
c0006a8c:	00007517          	auipc	a0,0x7
c0006a90:	e8450513          	addi	a0,a0,-380 # c000d910 <commands+0xa74>
c0006a94:	fbcf90ef          	jal	ra,c0000250 <__panic>

c0006a98 <switch_to>:
c0006a98:	00152023          	sw	ra,0(a0)
c0006a9c:	00252223          	sw	sp,4(a0)
c0006aa0:	00852423          	sw	s0,8(a0)
c0006aa4:	00952623          	sw	s1,12(a0)
c0006aa8:	01252823          	sw	s2,16(a0)
c0006aac:	01352a23          	sw	s3,20(a0)
c0006ab0:	01452c23          	sw	s4,24(a0)
c0006ab4:	01552e23          	sw	s5,28(a0)
c0006ab8:	03652023          	sw	s6,32(a0)
c0006abc:	03752223          	sw	s7,36(a0)
c0006ac0:	03852423          	sw	s8,40(a0)
c0006ac4:	03952623          	sw	s9,44(a0)
c0006ac8:	03a52823          	sw	s10,48(a0)
c0006acc:	03b52a23          	sw	s11,52(a0)
c0006ad0:	0005a083          	lw	ra,0(a1)
c0006ad4:	0045a103          	lw	sp,4(a1)
c0006ad8:	0085a403          	lw	s0,8(a1)
c0006adc:	00c5a483          	lw	s1,12(a1)
c0006ae0:	0105a903          	lw	s2,16(a1)
c0006ae4:	0145a983          	lw	s3,20(a1)
c0006ae8:	0185aa03          	lw	s4,24(a1)
c0006aec:	01c5aa83          	lw	s5,28(a1)
c0006af0:	0205ab03          	lw	s6,32(a1)
c0006af4:	0245ab83          	lw	s7,36(a1)
c0006af8:	0285ac03          	lw	s8,40(a1)
c0006afc:	02c5ac83          	lw	s9,44(a1)
c0006b00:	0305ad03          	lw	s10,48(a1)
c0006b04:	0345ad83          	lw	s11,52(a1)
c0006b08:	00008067          	ret

c0006b0c <kernel_thread_entry>:
c0006b0c:	00048513          	mv	a0,s1
c0006b10:	000400e7          	jalr	s0
c0006b14:	18d000ef          	jal	ra,c00074a0 <do_exit>

c0006b18 <alloc_proc>:
c0006b18:	ff010113          	addi	sp,sp,-16
c0006b1c:	0dc00513          	li	a0,220
c0006b20:	00812423          	sw	s0,8(sp)
c0006b24:	00112623          	sw	ra,12(sp)
c0006b28:	a5dfb0ef          	jal	ra,c0002584 <kmalloc>
c0006b2c:	00050413          	mv	s0,a0
c0006b30:	08050863          	beqz	a0,c0006bc0 <alloc_proc+0xa8>
c0006b34:	fff00793          	li	a5,-1
c0006b38:	00f52223          	sw	a5,4(a0)
c0006b3c:	03800613          	li	a2,56
c0006b40:	00000593          	li	a1,0
c0006b44:	00052023          	sw	zero,0(a0)
c0006b48:	00052423          	sw	zero,8(a0)
c0006b4c:	00052623          	sw	zero,12(a0)
c0006b50:	00052823          	sw	zero,16(a0)
c0006b54:	00052a23          	sw	zero,20(a0)
c0006b58:	00052c23          	sw	zero,24(a0)
c0006b5c:	01c50513          	addi	a0,a0,28
c0006b60:	3a9050ef          	jal	ra,c000c708 <memset>
c0006b64:	0003f797          	auipc	a5,0x3f
c0006b68:	ea07a783          	lw	a5,-352(a5) # c0045a04 <boot_cr3>
c0006b6c:	04f42c23          	sw	a5,88(s0)
c0006b70:	04042a23          	sw	zero,84(s0)
c0006b74:	04042e23          	sw	zero,92(s0)
c0006b78:	03200613          	li	a2,50
c0006b7c:	00000593          	li	a1,0
c0006b80:	06040513          	addi	a0,s0,96
c0006b84:	385050ef          	jal	ra,c000c708 <memset>
c0006b88:	0bc40793          	addi	a5,s0,188
c0006b8c:	0a042423          	sw	zero,168(s0)
c0006b90:	0a042823          	sw	zero,176(s0)
c0006b94:	0a042a23          	sw	zero,180(s0)
c0006b98:	0a042623          	sw	zero,172(s0)
c0006b9c:	0a042c23          	sw	zero,184(s0)
c0006ba0:	0cf42023          	sw	a5,192(s0)
c0006ba4:	0af42e23          	sw	a5,188(s0)
c0006ba8:	0c042223          	sw	zero,196(s0)
c0006bac:	0c042423          	sw	zero,200(s0)
c0006bb0:	0c042823          	sw	zero,208(s0)
c0006bb4:	0c042623          	sw	zero,204(s0)
c0006bb8:	0c042a23          	sw	zero,212(s0)
c0006bbc:	0c042c23          	sw	zero,216(s0)
c0006bc0:	00c12083          	lw	ra,12(sp)
c0006bc4:	00040513          	mv	a0,s0
c0006bc8:	00812403          	lw	s0,8(sp)
c0006bcc:	01010113          	addi	sp,sp,16
c0006bd0:	00008067          	ret

c0006bd4 <forkret>:
c0006bd4:	0003f797          	auipc	a5,0x3f
c0006bd8:	d507a783          	lw	a5,-688(a5) # c0045924 <current>
c0006bdc:	0547a503          	lw	a0,84(a5)
c0006be0:	c6cfa06f          	j	c000104c <forkrets>

c0006be4 <user_main>:
c0006be4:	0003f797          	auipc	a5,0x3f
c0006be8:	d407a783          	lw	a5,-704(a5) # c0045924 <current>
c0006bec:	0047a583          	lw	a1,4(a5)
c0006bf0:	fd010113          	addi	sp,sp,-48
c0006bf4:	00008617          	auipc	a2,0x8
c0006bf8:	5b060613          	addi	a2,a2,1456 # c000f1a4 <default_pmm_manager+0xeec>
c0006bfc:	00008517          	auipc	a0,0x8
c0006c00:	5b050513          	addi	a0,a0,1456 # c000f1ac <default_pmm_manager+0xef4>
c0006c04:	02112623          	sw	ra,44(sp)
c0006c08:	cd4f90ef          	jal	ra,c00000dc <cprintf>
c0006c0c:	00008797          	auipc	a5,0x8
c0006c10:	59878793          	addi	a5,a5,1432 # c000f1a4 <default_pmm_manager+0xeec>
c0006c14:	3fffc717          	auipc	a4,0x3fffc
c0006c18:	b8870713          	addi	a4,a4,-1144 # 279c <sbi_remote_fence_i+0x2eac>
c0006c1c:	00e12623          	sw	a4,12(sp)
c0006c20:	00078513          	mv	a0,a5
c0006c24:	00018717          	auipc	a4,0x18
c0006c28:	16870713          	addi	a4,a4,360 # c001ed8c <_binary_obj___user_exit_out_start>
c0006c2c:	00e12c23          	sw	a4,24(sp)
c0006c30:	00f12e23          	sw	a5,28(sp)
c0006c34:	1ed050ef          	jal	ra,c000c620 <strlen>
c0006c38:	00a12a23          	sw	a0,20(sp)
c0006c3c:	00400513          	li	a0,4
c0006c40:	01c12583          	lw	a1,28(sp)
c0006c44:	01412603          	lw	a2,20(sp)
c0006c48:	01812683          	lw	a3,24(sp)
c0006c4c:	00c12703          	lw	a4,12(sp)
c0006c50:	00a00893          	li	a7,10
c0006c54:	00000073          	ecall
c0006c58:	00a12823          	sw	a0,16(sp)
c0006c5c:	00008617          	auipc	a2,0x8
c0006c60:	57860613          	addi	a2,a2,1400 # c000f1d4 <default_pmm_manager+0xf1c>
c0006c64:	35700593          	li	a1,855
c0006c68:	00008517          	auipc	a0,0x8
c0006c6c:	58850513          	addi	a0,a0,1416 # c000f1f0 <default_pmm_manager+0xf38>
c0006c70:	de0f90ef          	jal	ra,c0000250 <__panic>

c0006c74 <setup_pgdir.isra.2>:
c0006c74:	fe010113          	addi	sp,sp,-32
c0006c78:	01212823          	sw	s2,16(sp)
c0006c7c:	00050913          	mv	s2,a0
c0006c80:	00100513          	li	a0,1
c0006c84:	00112e23          	sw	ra,28(sp)
c0006c88:	00812c23          	sw	s0,24(sp)
c0006c8c:	00912a23          	sw	s1,20(sp)
c0006c90:	01312623          	sw	s3,12(sp)
c0006c94:	c10fd0ef          	jal	ra,c00040a4 <alloc_pages>
c0006c98:	0a050a63          	beqz	a0,c0006d4c <setup_pgdir.isra.2+0xd8>
c0006c9c:	0003f697          	auipc	a3,0x3f
c0006ca0:	d6c6a683          	lw	a3,-660(a3) # c0045a08 <pages>
c0006ca4:	40d506b3          	sub	a3,a0,a3
c0006ca8:	00036997          	auipc	s3,0x36
c0006cac:	82c9a983          	lw	s3,-2004(s3) # c003c4d4 <nbase>
c0006cb0:	4056d693          	srai	a3,a3,0x5
c0006cb4:	001007b7          	lui	a5,0x100
c0006cb8:	013686b3          	add	a3,a3,s3
c0006cbc:	fff78793          	addi	a5,a5,-1 # fffff <_binary_obj___user_matrix_out_size+0xfd6b7>
c0006cc0:	00f6f7b3          	and	a5,a3,a5
c0006cc4:	0003f717          	auipc	a4,0x3f
c0006cc8:	c5872703          	lw	a4,-936(a4) # c004591c <npage>
c0006ccc:	00050413          	mv	s0,a0
c0006cd0:	00c69693          	slli	a3,a3,0xc
c0006cd4:	08e7f063          	bleu	a4,a5,c0006d54 <setup_pgdir.isra.2+0xe0>
c0006cd8:	0003f497          	auipc	s1,0x3f
c0006cdc:	d284a483          	lw	s1,-728(s1) # c0045a00 <va_pa_offset>
c0006ce0:	009684b3          	add	s1,a3,s1
c0006ce4:	00001637          	lui	a2,0x1
c0006ce8:	0003f597          	auipc	a1,0x3f
c0006cec:	c305a583          	lw	a1,-976(a1) # c0045918 <boot_pgdir>
c0006cf0:	00048513          	mv	a0,s1
c0006cf4:	231050ef          	jal	ra,c000c724 <memcpy>
c0006cf8:	0003f797          	auipc	a5,0x3f
c0006cfc:	d107a783          	lw	a5,-752(a5) # c0045a08 <pages>
c0006d00:	40f40433          	sub	s0,s0,a5
c0006d04:	40545413          	srai	s0,s0,0x5
c0006d08:	01340433          	add	s0,s0,s3
c0006d0c:	00a41413          	slli	s0,s0,0xa
c0006d10:	000017b7          	lui	a5,0x1
c0006d14:	00f487b3          	add	a5,s1,a5
c0006d18:	00146713          	ori	a4,s0,1
c0006d1c:	00746413          	ori	s0,s0,7
c0006d20:	fae7a623          	sw	a4,-84(a5) # fac <_binary_obj___user_faultread_out_size-0x10fc>
c0006d24:	fa87a823          	sw	s0,-80(a5)
c0006d28:	00992023          	sw	s1,0(s2)
c0006d2c:	00000513          	li	a0,0
c0006d30:	01c12083          	lw	ra,28(sp)
c0006d34:	01812403          	lw	s0,24(sp)
c0006d38:	01412483          	lw	s1,20(sp)
c0006d3c:	01012903          	lw	s2,16(sp)
c0006d40:	00c12983          	lw	s3,12(sp)
c0006d44:	02010113          	addi	sp,sp,32
c0006d48:	00008067          	ret
c0006d4c:	ffc00513          	li	a0,-4
c0006d50:	fe1ff06f          	j	c0006d30 <setup_pgdir.isra.2+0xbc>
c0006d54:	00007617          	auipc	a2,0x7
c0006d58:	e0460613          	addi	a2,a2,-508 # c000db58 <commands+0xcbc>
c0006d5c:	06800593          	li	a1,104
c0006d60:	00007517          	auipc	a0,0x7
c0006d64:	bb050513          	addi	a0,a0,-1104 # c000d910 <commands+0xa74>
c0006d68:	ce8f90ef          	jal	ra,c0000250 <__panic>

c0006d6c <set_proc_name>:
c0006d6c:	ff010113          	addi	sp,sp,-16
c0006d70:	00812423          	sw	s0,8(sp)
c0006d74:	06050413          	addi	s0,a0,96
c0006d78:	00912223          	sw	s1,4(sp)
c0006d7c:	03300613          	li	a2,51
c0006d80:	00058493          	mv	s1,a1
c0006d84:	00040513          	mv	a0,s0
c0006d88:	00000593          	li	a1,0
c0006d8c:	00112623          	sw	ra,12(sp)
c0006d90:	179050ef          	jal	ra,c000c708 <memset>
c0006d94:	00048593          	mv	a1,s1
c0006d98:	00040513          	mv	a0,s0
c0006d9c:	00c12083          	lw	ra,12(sp)
c0006da0:	00812403          	lw	s0,8(sp)
c0006da4:	00412483          	lw	s1,4(sp)
c0006da8:	03200613          	li	a2,50
c0006dac:	01010113          	addi	sp,sp,16
c0006db0:	1750506f          	j	c000c724 <memcpy>

c0006db4 <proc_run>:
c0006db4:	ff010113          	addi	sp,sp,-16
c0006db8:	00912223          	sw	s1,4(sp)
c0006dbc:	00112623          	sw	ra,12(sp)
c0006dc0:	00812423          	sw	s0,8(sp)
c0006dc4:	01212023          	sw	s2,0(sp)
c0006dc8:	0003f497          	auipc	s1,0x3f
c0006dcc:	b5c4a483          	lw	s1,-1188(s1) # c0045924 <current>
c0006dd0:	02a48e63          	beq	s1,a0,c0006e0c <proc_run+0x58>
c0006dd4:	00050413          	mv	s0,a0
c0006dd8:	100027f3          	csrr	a5,sstatus
c0006ddc:	0027f793          	andi	a5,a5,2
c0006de0:	00000913          	li	s2,0
c0006de4:	04079c63          	bnez	a5,c0006e3c <proc_run+0x88>
c0006de8:	05842783          	lw	a5,88(s0)
c0006dec:	0003f297          	auipc	t0,0x3f
c0006df0:	b282ac23          	sw	s0,-1224(t0) # c0045924 <current>
c0006df4:	00c7d793          	srli	a5,a5,0xc
c0006df8:	18079073          	csrw	sptbr,a5
c0006dfc:	01c40593          	addi	a1,s0,28
c0006e00:	01c48513          	addi	a0,s1,28
c0006e04:	c95ff0ef          	jal	ra,c0006a98 <switch_to>
c0006e08:	00091e63          	bnez	s2,c0006e24 <proc_run+0x70>
c0006e0c:	00c12083          	lw	ra,12(sp)
c0006e10:	00812403          	lw	s0,8(sp)
c0006e14:	00412483          	lw	s1,4(sp)
c0006e18:	00012903          	lw	s2,0(sp)
c0006e1c:	01010113          	addi	sp,sp,16
c0006e20:	00008067          	ret
c0006e24:	00c12083          	lw	ra,12(sp)
c0006e28:	00812403          	lw	s0,8(sp)
c0006e2c:	00412483          	lw	s1,4(sp)
c0006e30:	00012903          	lw	s2,0(sp)
c0006e34:	01010113          	addi	sp,sp,16
c0006e38:	9e5f906f          	j	c000081c <intr_enable>
c0006e3c:	9e9f90ef          	jal	ra,c0000824 <intr_disable>
c0006e40:	00100913          	li	s2,1
c0006e44:	fa5ff06f          	j	c0006de8 <proc_run+0x34>

c0006e48 <find_proc>:
c0006e48:	000027b7          	lui	a5,0x2
c0006e4c:	fff50713          	addi	a4,a0,-1
c0006e50:	ffe78793          	addi	a5,a5,-2 # 1ffe <_binary_obj___user_faultread_out_size-0xaa>
c0006e54:	06e7e663          	bltu	a5,a4,c0006ec0 <find_proc+0x78>
c0006e58:	ff010113          	addi	sp,sp,-16
c0006e5c:	00a00593          	li	a1,10
c0006e60:	00812423          	sw	s0,8(sp)
c0006e64:	00112623          	sw	ra,12(sp)
c0006e68:	00050413          	mv	s0,a0
c0006e6c:	6d1050ef          	jal	ra,c000cd3c <hash32>
c0006e70:	0003d797          	auipc	a5,0x3d
c0006e74:	a7878793          	addi	a5,a5,-1416 # c00438e8 <hash_list>
c0006e78:	00351513          	slli	a0,a0,0x3
c0006e7c:	00a78533          	add	a0,a5,a0
c0006e80:	00050793          	mv	a5,a0
c0006e84:	00c0006f          	j	c0006e90 <find_proc+0x48>
c0006e88:	f687a703          	lw	a4,-152(a5)
c0006e8c:	02e40063          	beq	s0,a4,c0006eac <find_proc+0x64>
c0006e90:	0047a783          	lw	a5,4(a5)
c0006e94:	fef51ae3          	bne	a0,a5,c0006e88 <find_proc+0x40>
c0006e98:	00c12083          	lw	ra,12(sp)
c0006e9c:	00000513          	li	a0,0
c0006ea0:	00812403          	lw	s0,8(sp)
c0006ea4:	01010113          	addi	sp,sp,16
c0006ea8:	00008067          	ret
c0006eac:	00c12083          	lw	ra,12(sp)
c0006eb0:	f6478513          	addi	a0,a5,-156
c0006eb4:	00812403          	lw	s0,8(sp)
c0006eb8:	01010113          	addi	sp,sp,16
c0006ebc:	00008067          	ret
c0006ec0:	00000513          	li	a0,0
c0006ec4:	00008067          	ret

c0006ec8 <do_fork>:
c0006ec8:	0003f717          	auipc	a4,0x3f
c0006ecc:	a6872703          	lw	a4,-1432(a4) # c0045930 <nr_process>
c0006ed0:	000017b7          	lui	a5,0x1
c0006ed4:	4af75063          	ble	a5,a4,c0007374 <do_fork+0x4ac>
c0006ed8:	fd010113          	addi	sp,sp,-48
c0006edc:	02812423          	sw	s0,40(sp)
c0006ee0:	02912223          	sw	s1,36(sp)
c0006ee4:	03212023          	sw	s2,32(sp)
c0006ee8:	01312e23          	sw	s3,28(sp)
c0006eec:	02112623          	sw	ra,44(sp)
c0006ef0:	01412c23          	sw	s4,24(sp)
c0006ef4:	01512a23          	sw	s5,20(sp)
c0006ef8:	01612823          	sw	s6,16(sp)
c0006efc:	01712623          	sw	s7,12(sp)
c0006f00:	00050993          	mv	s3,a0
c0006f04:	00058913          	mv	s2,a1
c0006f08:	00060493          	mv	s1,a2
c0006f0c:	c0dff0ef          	jal	ra,c0006b18 <alloc_proc>
c0006f10:	00050413          	mv	s0,a0
c0006f14:	44050263          	beqz	a0,c0007358 <do_fork+0x490>
c0006f18:	0003f797          	auipc	a5,0x3f
c0006f1c:	a0c7a783          	lw	a5,-1524(a5) # c0045924 <current>
c0006f20:	0a87a703          	lw	a4,168(a5)
c0006f24:	00f52a23          	sw	a5,20(a0)
c0006f28:	4c071263          	bnez	a4,c00073ec <do_fork+0x524>
c0006f2c:	00200513          	li	a0,2
c0006f30:	974fd0ef          	jal	ra,c00040a4 <alloc_pages>
c0006f34:	40050e63          	beqz	a0,c0007350 <do_fork+0x488>
c0006f38:	0003f697          	auipc	a3,0x3f
c0006f3c:	ad06a683          	lw	a3,-1328(a3) # c0045a08 <pages>
c0006f40:	40d506b3          	sub	a3,a0,a3
c0006f44:	00035a97          	auipc	s5,0x35
c0006f48:	590aaa83          	lw	s5,1424(s5) # c003c4d4 <nbase>
c0006f4c:	4056d693          	srai	a3,a3,0x5
c0006f50:	001007b7          	lui	a5,0x100
c0006f54:	015686b3          	add	a3,a3,s5
c0006f58:	fff78793          	addi	a5,a5,-1 # fffff <_binary_obj___user_matrix_out_size+0xfd6b7>
c0006f5c:	00f6f7b3          	and	a5,a3,a5
c0006f60:	0003f717          	auipc	a4,0x3f
c0006f64:	9bc72703          	lw	a4,-1604(a4) # c004591c <npage>
c0006f68:	00c69693          	slli	a3,a3,0xc
c0006f6c:	42e7f863          	bleu	a4,a5,c000739c <do_fork+0x4d4>
c0006f70:	0003f797          	auipc	a5,0x3f
c0006f74:	9b47a783          	lw	a5,-1612(a5) # c0045924 <current>
c0006f78:	0187aa03          	lw	s4,24(a5)
c0006f7c:	0003f797          	auipc	a5,0x3f
c0006f80:	a847a783          	lw	a5,-1404(a5) # c0045a00 <va_pa_offset>
c0006f84:	00f686b3          	add	a3,a3,a5
c0006f88:	00d42623          	sw	a3,12(s0)
c0006f8c:	020a0e63          	beqz	s4,c0006fc8 <do_fork+0x100>
c0006f90:	1009f993          	andi	s3,s3,256
c0006f94:	2c098263          	beqz	s3,c0007258 <do_fork+0x390>
c0006f98:	018a2783          	lw	a5,24(s4)
c0006f9c:	00ca2683          	lw	a3,12(s4)
c0006fa0:	c0000737          	lui	a4,0xc0000
c0006fa4:	00178793          	addi	a5,a5,1
c0006fa8:	00fa2c23          	sw	a5,24(s4)
c0006fac:	01442c23          	sw	s4,24(s0)
c0006fb0:	44e6ee63          	bltu	a3,a4,c000740c <do_fork+0x544>
c0006fb4:	0003f797          	auipc	a5,0x3f
c0006fb8:	a4c7a783          	lw	a5,-1460(a5) # c0045a00 <va_pa_offset>
c0006fbc:	40f686b3          	sub	a3,a3,a5
c0006fc0:	04d42c23          	sw	a3,88(s0)
c0006fc4:	00c42683          	lw	a3,12(s0)
c0006fc8:	00002737          	lui	a4,0x2
c0006fcc:	f7070713          	addi	a4,a4,-144 # 1f70 <_binary_obj___user_faultread_out_size-0x138>
c0006fd0:	00e68733          	add	a4,a3,a4
c0006fd4:	00048613          	mv	a2,s1
c0006fd8:	04e42a23          	sw	a4,84(s0)
c0006fdc:	00070793          	mv	a5,a4
c0006fe0:	08048593          	addi	a1,s1,128
c0006fe4:	00062f83          	lw	t6,0(a2)
c0006fe8:	00462f03          	lw	t5,4(a2)
c0006fec:	00862e83          	lw	t4,8(a2)
c0006ff0:	00c62e03          	lw	t3,12(a2)
c0006ff4:	01062303          	lw	t1,16(a2)
c0006ff8:	01462883          	lw	a7,20(a2)
c0006ffc:	01862803          	lw	a6,24(a2)
c0007000:	01c62503          	lw	a0,28(a2)
c0007004:	01f7a023          	sw	t6,0(a5)
c0007008:	01e7a223          	sw	t5,4(a5)
c000700c:	01d7a423          	sw	t4,8(a5)
c0007010:	01c7a623          	sw	t3,12(a5)
c0007014:	0067a823          	sw	t1,16(a5)
c0007018:	0117aa23          	sw	a7,20(a5)
c000701c:	0107ac23          	sw	a6,24(a5)
c0007020:	00a7ae23          	sw	a0,28(a5)
c0007024:	02060613          	addi	a2,a2,32
c0007028:	02078793          	addi	a5,a5,32
c000702c:	fab61ce3          	bne	a2,a1,c0006fe4 <do_fork+0x11c>
c0007030:	00062803          	lw	a6,0(a2)
c0007034:	00462503          	lw	a0,4(a2)
c0007038:	00862583          	lw	a1,8(a2)
c000703c:	00c62603          	lw	a2,12(a2)
c0007040:	0107a023          	sw	a6,0(a5)
c0007044:	00a7a223          	sw	a0,4(a5)
c0007048:	00b7a423          	sw	a1,8(a5)
c000704c:	00c7a623          	sw	a2,12(a5)
c0007050:	02072423          	sw	zero,40(a4)
c0007054:	16090c63          	beqz	s2,c00071cc <do_fork+0x304>
c0007058:	01272423          	sw	s2,8(a4)
c000705c:	00000797          	auipc	a5,0x0
c0007060:	b7878793          	addi	a5,a5,-1160 # c0006bd4 <forkret>
c0007064:	00f42e23          	sw	a5,28(s0)
c0007068:	02e42023          	sw	a4,32(s0)
c000706c:	100027f3          	csrr	a5,sstatus
c0007070:	0027f793          	andi	a5,a5,2
c0007074:	00000913          	li	s2,0
c0007078:	18079263          	bnez	a5,c00071fc <do_fork+0x334>
c000707c:	00035517          	auipc	a0,0x35
c0007080:	46052503          	lw	a0,1120(a0) # c003c4dc <last_pid.1728>
c0007084:	00035e17          	auipc	t3,0x35
c0007088:	458e0e13          	addi	t3,t3,1112 # c003c4dc <last_pid.1728>
c000708c:	00150513          	addi	a0,a0,1
c0007090:	00ae2023          	sw	a0,0(t3)
c0007094:	000027b7          	lui	a5,0x2
c0007098:	18f54663          	blt	a0,a5,c0007224 <do_fork+0x35c>
c000709c:	00100513          	li	a0,1
c00070a0:	00ae2023          	sw	a0,0(t3)
c00070a4:	000027b7          	lui	a5,0x2
c00070a8:	00035e97          	auipc	t4,0x35
c00070ac:	438e8e93          	addi	t4,t4,1080 # c003c4e0 <next_safe.1727>
c00070b0:	00fea023          	sw	a5,0(t4)
c00070b4:	00035817          	auipc	a6,0x35
c00070b8:	42882803          	lw	a6,1064(a6) # c003c4dc <last_pid.1728>
c00070bc:	00000593          	li	a1,0
c00070c0:	0003f497          	auipc	s1,0x3f
c00070c4:	a0448493          	addi	s1,s1,-1532 # c0045ac4 <proc_list>
c00070c8:	00078893          	mv	a7,a5
c00070cc:	00100613          	li	a2,1
c00070d0:	00058313          	mv	t1,a1
c00070d4:	00088693          	mv	a3,a7
c00070d8:	0003f797          	auipc	a5,0x3f
c00070dc:	9ec78793          	addi	a5,a5,-1556 # c0045ac4 <proc_list>
c00070e0:	0047a783          	lw	a5,4(a5)
c00070e4:	02978263          	beq	a5,s1,c0007108 <do_fork+0x240>
c00070e8:	f707a703          	lw	a4,-144(a5)
c00070ec:	14a70863          	beq	a4,a0,c000723c <do_fork+0x374>
c00070f0:	fee558e3          	ble	a4,a0,c00070e0 <do_fork+0x218>
c00070f4:	fed756e3          	ble	a3,a4,c00070e0 <do_fork+0x218>
c00070f8:	0047a783          	lw	a5,4(a5)
c00070fc:	00070693          	mv	a3,a4
c0007100:	00060313          	mv	t1,a2
c0007104:	fe9792e3          	bne	a5,s1,c00070e8 <do_fork+0x220>
c0007108:	2a059663          	bnez	a1,c00073b4 <do_fork+0x4ec>
c000710c:	26031863          	bnez	t1,c000737c <do_fork+0x4b4>
c0007110:	00a00593          	li	a1,10
c0007114:	00a42223          	sw	a0,4(s0)
c0007118:	425050ef          	jal	ra,c000cd3c <hash32>
c000711c:	0003c797          	auipc	a5,0x3c
c0007120:	7cc78793          	addi	a5,a5,1996 # c00438e8 <hash_list>
c0007124:	00351513          	slli	a0,a0,0x3
c0007128:	00a78533          	add	a0,a5,a0
c000712c:	00452583          	lw	a1,4(a0)
c0007130:	01442683          	lw	a3,20(s0)
c0007134:	09c40793          	addi	a5,s0,156
c0007138:	00f5a023          	sw	a5,0(a1)
c000713c:	00f52223          	sw	a5,4(a0)
c0007140:	0ac6a703          	lw	a4,172(a3)
c0007144:	0003f617          	auipc	a2,0x3f
c0007148:	98462603          	lw	a2,-1660(a2) # c0045ac8 <proc_list+0x4>
c000714c:	09440793          	addi	a5,s0,148
c0007150:	0ab42023          	sw	a1,160(s0)
c0007154:	08a42e23          	sw	a0,156(s0)
c0007158:	00f62023          	sw	a5,0(a2)
c000715c:	00f4a223          	sw	a5,4(s1)
c0007160:	08c42c23          	sw	a2,152(s0)
c0007164:	08942a23          	sw	s1,148(s0)
c0007168:	0a042823          	sw	zero,176(s0)
c000716c:	0ae42a23          	sw	a4,180(s0)
c0007170:	00070463          	beqz	a4,c0007178 <do_fork+0x2b0>
c0007174:	0a872823          	sw	s0,176(a4)
c0007178:	0003e797          	auipc	a5,0x3e
c000717c:	7b87a783          	lw	a5,1976(a5) # c0045930 <nr_process>
c0007180:	00178793          	addi	a5,a5,1
c0007184:	0a86a623          	sw	s0,172(a3)
c0007188:	0003e297          	auipc	t0,0x3e
c000718c:	7af2a423          	sw	a5,1960(t0) # c0045930 <nr_process>
c0007190:	0c091063          	bnez	s2,c0007250 <do_fork+0x388>
c0007194:	00040513          	mv	a0,s0
c0007198:	358010ef          	jal	ra,c00084f0 <wakeup_proc>
c000719c:	00442503          	lw	a0,4(s0)
c00071a0:	02c12083          	lw	ra,44(sp)
c00071a4:	02812403          	lw	s0,40(sp)
c00071a8:	02412483          	lw	s1,36(sp)
c00071ac:	02012903          	lw	s2,32(sp)
c00071b0:	01c12983          	lw	s3,28(sp)
c00071b4:	01812a03          	lw	s4,24(sp)
c00071b8:	01412a83          	lw	s5,20(sp)
c00071bc:	01012b03          	lw	s6,16(sp)
c00071c0:	00c12b83          	lw	s7,12(sp)
c00071c4:	03010113          	addi	sp,sp,48
c00071c8:	00008067          	ret
c00071cc:	00002937          	lui	s2,0x2
c00071d0:	f6c90913          	addi	s2,s2,-148 # 1f6c <_binary_obj___user_faultread_out_size-0x13c>
c00071d4:	01268933          	add	s2,a3,s2
c00071d8:	01272423          	sw	s2,8(a4)
c00071dc:	00000797          	auipc	a5,0x0
c00071e0:	9f878793          	addi	a5,a5,-1544 # c0006bd4 <forkret>
c00071e4:	00f42e23          	sw	a5,28(s0)
c00071e8:	02e42023          	sw	a4,32(s0)
c00071ec:	100027f3          	csrr	a5,sstatus
c00071f0:	0027f793          	andi	a5,a5,2
c00071f4:	00000913          	li	s2,0
c00071f8:	e80782e3          	beqz	a5,c000707c <do_fork+0x1b4>
c00071fc:	e28f90ef          	jal	ra,c0000824 <intr_disable>
c0007200:	00035517          	auipc	a0,0x35
c0007204:	2dc52503          	lw	a0,732(a0) # c003c4dc <last_pid.1728>
c0007208:	00035e17          	auipc	t3,0x35
c000720c:	2d4e0e13          	addi	t3,t3,724 # c003c4dc <last_pid.1728>
c0007210:	00150513          	addi	a0,a0,1
c0007214:	00ae2023          	sw	a0,0(t3)
c0007218:	000027b7          	lui	a5,0x2
c000721c:	00100913          	li	s2,1
c0007220:	e6f55ee3          	ble	a5,a0,c000709c <do_fork+0x1d4>
c0007224:	00035797          	auipc	a5,0x35
c0007228:	2bc7a783          	lw	a5,700(a5) # c003c4e0 <next_safe.1727>
c000722c:	0003f497          	auipc	s1,0x3f
c0007230:	89848493          	addi	s1,s1,-1896 # c0045ac4 <proc_list>
c0007234:	e6f558e3          	ble	a5,a0,c00070a4 <do_fork+0x1dc>
c0007238:	ed9ff06f          	j	c0007110 <do_fork+0x248>
c000723c:	00150513          	addi	a0,a0,1
c0007240:	12d55063          	ble	a3,a0,c0007360 <do_fork+0x498>
c0007244:	00050813          	mv	a6,a0
c0007248:	00060593          	mv	a1,a2
c000724c:	e95ff06f          	j	c00070e0 <do_fork+0x218>
c0007250:	dccf90ef          	jal	ra,c000081c <intr_enable>
c0007254:	f41ff06f          	j	c0007194 <do_fork+0x2cc>
c0007258:	e25f90ef          	jal	ra,c000107c <mm_create>
c000725c:	00050993          	mv	s3,a0
c0007260:	0a050663          	beqz	a0,c000730c <do_fork+0x444>
c0007264:	00c50513          	addi	a0,a0,12
c0007268:	a0dff0ef          	jal	ra,c0006c74 <setup_pgdir.isra.2>
c000726c:	08051c63          	bnez	a0,c0007304 <do_fork+0x43c>
c0007270:	01ca0b13          	addi	s6,s4,28
c0007274:	000b0513          	mv	a0,s6
c0007278:	c38ff0ef          	jal	ra,c00066b0 <down>
c000727c:	0003e797          	auipc	a5,0x3e
c0007280:	6a87a783          	lw	a5,1704(a5) # c0045924 <current>
c0007284:	00078663          	beqz	a5,c0007290 <do_fork+0x3c8>
c0007288:	0047a783          	lw	a5,4(a5)
c000728c:	02fa2423          	sw	a5,40(s4)
c0007290:	000a0593          	mv	a1,s4
c0007294:	00098513          	mv	a0,s3
c0007298:	974fa0ef          	jal	ra,c000140c <dup_mmap>
c000729c:	00050b93          	mv	s7,a0
c00072a0:	000b0513          	mv	a0,s6
c00072a4:	c08ff0ef          	jal	ra,c00066ac <up>
c00072a8:	020a2423          	sw	zero,40(s4)
c00072ac:	000b9663          	bnez	s7,c00072b8 <do_fork+0x3f0>
c00072b0:	00098a13          	mv	s4,s3
c00072b4:	ce5ff06f          	j	c0006f98 <do_fork+0xd0>
c00072b8:	00098513          	mv	a0,s3
c00072bc:	a3cfa0ef          	jal	ra,c00014f8 <exit_mmap>
c00072c0:	00c9a683          	lw	a3,12(s3)
c00072c4:	c00007b7          	lui	a5,0xc0000
c00072c8:	0af6ee63          	bltu	a3,a5,c0007384 <do_fork+0x4bc>
c00072cc:	0003e797          	auipc	a5,0x3e
c00072d0:	7347a783          	lw	a5,1844(a5) # c0045a00 <va_pa_offset>
c00072d4:	40f687b3          	sub	a5,a3,a5
c00072d8:	00c7d793          	srli	a5,a5,0xc
c00072dc:	0003e717          	auipc	a4,0x3e
c00072e0:	64072703          	lw	a4,1600(a4) # c004591c <npage>
c00072e4:	0ce7fc63          	bleu	a4,a5,c00073bc <do_fork+0x4f4>
c00072e8:	415787b3          	sub	a5,a5,s5
c00072ec:	00579793          	slli	a5,a5,0x5
c00072f0:	0003e517          	auipc	a0,0x3e
c00072f4:	71852503          	lw	a0,1816(a0) # c0045a08 <pages>
c00072f8:	00100593          	li	a1,1
c00072fc:	00f50533          	add	a0,a0,a5
c0007300:	e59fc0ef          	jal	ra,c0004158 <free_pages>
c0007304:	00098513          	mv	a0,s3
c0007308:	f91f90ef          	jal	ra,c0001298 <mm_destroy>
c000730c:	00c42683          	lw	a3,12(s0)
c0007310:	c00007b7          	lui	a5,0xc0000
c0007314:	0cf6e063          	bltu	a3,a5,c00073d4 <do_fork+0x50c>
c0007318:	0003e797          	auipc	a5,0x3e
c000731c:	6e87a783          	lw	a5,1768(a5) # c0045a00 <va_pa_offset>
c0007320:	40f687b3          	sub	a5,a3,a5
c0007324:	00c7d793          	srli	a5,a5,0xc
c0007328:	0003e717          	auipc	a4,0x3e
c000732c:	5f472703          	lw	a4,1524(a4) # c004591c <npage>
c0007330:	08e7f663          	bleu	a4,a5,c00073bc <do_fork+0x4f4>
c0007334:	415787b3          	sub	a5,a5,s5
c0007338:	00579793          	slli	a5,a5,0x5
c000733c:	0003e517          	auipc	a0,0x3e
c0007340:	6cc52503          	lw	a0,1740(a0) # c0045a08 <pages>
c0007344:	00200593          	li	a1,2
c0007348:	00f50533          	add	a0,a0,a5
c000734c:	e0dfc0ef          	jal	ra,c0004158 <free_pages>
c0007350:	00040513          	mv	a0,s0
c0007354:	b50fb0ef          	jal	ra,c00026a4 <kfree>
c0007358:	ffc00513          	li	a0,-4
c000735c:	e45ff06f          	j	c00071a0 <do_fork+0x2d8>
c0007360:	01154463          	blt	a0,a7,c0007368 <do_fork+0x4a0>
c0007364:	00100513          	li	a0,1
c0007368:	00060593          	mv	a1,a2
c000736c:	00050813          	mv	a6,a0
c0007370:	d61ff06f          	j	c00070d0 <do_fork+0x208>
c0007374:	ffb00513          	li	a0,-5
c0007378:	00008067          	ret
c000737c:	00dea023          	sw	a3,0(t4)
c0007380:	d91ff06f          	j	c0007110 <do_fork+0x248>
c0007384:	00006617          	auipc	a2,0x6
c0007388:	7f860613          	addi	a2,a2,2040 # c000db7c <commands+0xce0>
c000738c:	06d00593          	li	a1,109
c0007390:	00006517          	auipc	a0,0x6
c0007394:	58050513          	addi	a0,a0,1408 # c000d910 <commands+0xa74>
c0007398:	eb9f80ef          	jal	ra,c0000250 <__panic>
c000739c:	00006617          	auipc	a2,0x6
c00073a0:	7bc60613          	addi	a2,a2,1980 # c000db58 <commands+0xcbc>
c00073a4:	06800593          	li	a1,104
c00073a8:	00006517          	auipc	a0,0x6
c00073ac:	56850513          	addi	a0,a0,1384 # c000d910 <commands+0xa74>
c00073b0:	ea1f80ef          	jal	ra,c0000250 <__panic>
c00073b4:	010e2023          	sw	a6,0(t3)
c00073b8:	d55ff06f          	j	c000710c <do_fork+0x244>
c00073bc:	00006617          	auipc	a2,0x6
c00073c0:	53460613          	addi	a2,a2,1332 # c000d8f0 <commands+0xa54>
c00073c4:	06100593          	li	a1,97
c00073c8:	00006517          	auipc	a0,0x6
c00073cc:	54850513          	addi	a0,a0,1352 # c000d910 <commands+0xa74>
c00073d0:	e81f80ef          	jal	ra,c0000250 <__panic>
c00073d4:	00006617          	auipc	a2,0x6
c00073d8:	7a860613          	addi	a2,a2,1960 # c000db7c <commands+0xce0>
c00073dc:	06d00593          	li	a1,109
c00073e0:	00006517          	auipc	a0,0x6
c00073e4:	53050513          	addi	a0,a0,1328 # c000d910 <commands+0xa74>
c00073e8:	e69f80ef          	jal	ra,c0000250 <__panic>
c00073ec:	00008697          	auipc	a3,0x8
c00073f0:	bd468693          	addi	a3,a3,-1068 # c000efc0 <default_pmm_manager+0xd08>
c00073f4:	00006617          	auipc	a2,0x6
c00073f8:	e8060613          	addi	a2,a2,-384 # c000d274 <commands+0x3d8>
c00073fc:	1ba00593          	li	a1,442
c0007400:	00008517          	auipc	a0,0x8
c0007404:	df050513          	addi	a0,a0,-528 # c000f1f0 <default_pmm_manager+0xf38>
c0007408:	e49f80ef          	jal	ra,c0000250 <__panic>
c000740c:	00006617          	auipc	a2,0x6
c0007410:	77060613          	addi	a2,a2,1904 # c000db7c <commands+0xce0>
c0007414:	16d00593          	li	a1,365
c0007418:	00008517          	auipc	a0,0x8
c000741c:	dd850513          	addi	a0,a0,-552 # c000f1f0 <default_pmm_manager+0xf38>
c0007420:	e31f80ef          	jal	ra,c0000250 <__panic>

c0007424 <kernel_thread>:
c0007424:	f6010113          	addi	sp,sp,-160
c0007428:	08812c23          	sw	s0,152(sp)
c000742c:	08912a23          	sw	s1,148(sp)
c0007430:	09212823          	sw	s2,144(sp)
c0007434:	00058493          	mv	s1,a1
c0007438:	00050913          	mv	s2,a0
c000743c:	00060413          	mv	s0,a2
c0007440:	00000593          	li	a1,0
c0007444:	09000613          	li	a2,144
c0007448:	00010513          	mv	a0,sp
c000744c:	08112e23          	sw	ra,156(sp)
c0007450:	2b8050ef          	jal	ra,c000c708 <memset>
c0007454:	03212023          	sw	s2,32(sp)
c0007458:	02912223          	sw	s1,36(sp)
c000745c:	100027f3          	csrr	a5,sstatus
c0007460:	edd7f793          	andi	a5,a5,-291
c0007464:	1207e793          	ori	a5,a5,288
c0007468:	08f12023          	sw	a5,128(sp)
c000746c:	00010613          	mv	a2,sp
c0007470:	10046513          	ori	a0,s0,256
c0007474:	fffff797          	auipc	a5,0xfffff
c0007478:	69878793          	addi	a5,a5,1688 # c0006b0c <kernel_thread_entry>
c000747c:	00000593          	li	a1,0
c0007480:	08f12223          	sw	a5,132(sp)
c0007484:	a45ff0ef          	jal	ra,c0006ec8 <do_fork>
c0007488:	09c12083          	lw	ra,156(sp)
c000748c:	09812403          	lw	s0,152(sp)
c0007490:	09412483          	lw	s1,148(sp)
c0007494:	09012903          	lw	s2,144(sp)
c0007498:	0a010113          	addi	sp,sp,160
c000749c:	00008067          	ret

c00074a0 <do_exit>:
c00074a0:	ff010113          	addi	sp,sp,-16
c00074a4:	00112623          	sw	ra,12(sp)
c00074a8:	00812423          	sw	s0,8(sp)
c00074ac:	00912223          	sw	s1,4(sp)
c00074b0:	01212023          	sw	s2,0(sp)
c00074b4:	0003e697          	auipc	a3,0x3e
c00074b8:	4706a683          	lw	a3,1136(a3) # c0045924 <current>
c00074bc:	0003e797          	auipc	a5,0x3e
c00074c0:	46c7a783          	lw	a5,1132(a5) # c0045928 <idleproc>
c00074c4:	18f68a63          	beq	a3,a5,c0007658 <do_exit+0x1b8>
c00074c8:	0003e797          	auipc	a5,0x3e
c00074cc:	4647a783          	lw	a5,1124(a5) # c004592c <initproc>
c00074d0:	1af68063          	beq	a3,a5,c0007670 <do_exit+0x1d0>
c00074d4:	0186a403          	lw	s0,24(a3)
c00074d8:	00050493          	mv	s1,a0
c00074dc:	02040463          	beqz	s0,c0007504 <do_exit+0x64>
c00074e0:	0003e797          	auipc	a5,0x3e
c00074e4:	5247a783          	lw	a5,1316(a5) # c0045a04 <boot_cr3>
c00074e8:	00c7d793          	srli	a5,a5,0xc
c00074ec:	18079073          	csrw	sptbr,a5
c00074f0:	01842783          	lw	a5,24(s0)
c00074f4:	fff78793          	addi	a5,a5,-1
c00074f8:	00f42c23          	sw	a5,24(s0)
c00074fc:	0c078263          	beqz	a5,c00075c0 <do_exit+0x120>
c0007500:	0006ac23          	sw	zero,24(a3)
c0007504:	00300793          	li	a5,3
c0007508:	00f6a023          	sw	a5,0(a3)
c000750c:	0a96a223          	sw	s1,164(a3)
c0007510:	100027f3          	csrr	a5,sstatus
c0007514:	0027f793          	andi	a5,a5,2
c0007518:	00000913          	li	s2,0
c000751c:	10079863          	bnez	a5,c000762c <do_exit+0x18c>
c0007520:	0146a503          	lw	a0,20(a3)
c0007524:	800007b7          	lui	a5,0x80000
c0007528:	00178793          	addi	a5,a5,1 # 80000001 <sbi_remote_fence_i+0x80000711>
c000752c:	0a852703          	lw	a4,168(a0)
c0007530:	10f70c63          	beq	a4,a5,c0007648 <do_exit+0x1a8>
c0007534:	800004b7          	lui	s1,0x80000
c0007538:	00300413          	li	s0,3
c000753c:	00148493          	addi	s1,s1,1 # 80000001 <sbi_remote_fence_i+0x80000711>
c0007540:	0ac6a783          	lw	a5,172(a3)
c0007544:	04078863          	beqz	a5,c0007594 <do_exit+0xf4>
c0007548:	0b47a703          	lw	a4,180(a5)
c000754c:	0003e517          	auipc	a0,0x3e
c0007550:	3e052503          	lw	a0,992(a0) # c004592c <initproc>
c0007554:	0ae6a623          	sw	a4,172(a3)
c0007558:	0ac52703          	lw	a4,172(a0)
c000755c:	0a07a823          	sw	zero,176(a5)
c0007560:	0ae7aa23          	sw	a4,180(a5)
c0007564:	00070463          	beqz	a4,c000756c <do_exit+0xcc>
c0007568:	0af72823          	sw	a5,176(a4)
c000756c:	0007a703          	lw	a4,0(a5)
c0007570:	00a7aa23          	sw	a0,20(a5)
c0007574:	0af52623          	sw	a5,172(a0)
c0007578:	fc8714e3          	bne	a4,s0,c0007540 <do_exit+0xa0>
c000757c:	0a852783          	lw	a5,168(a0)
c0007580:	fc9790e3          	bne	a5,s1,c0007540 <do_exit+0xa0>
c0007584:	76d000ef          	jal	ra,c00084f0 <wakeup_proc>
c0007588:	0003e697          	auipc	a3,0x3e
c000758c:	39c6a683          	lw	a3,924(a3) # c0045924 <current>
c0007590:	fb1ff06f          	j	c0007540 <do_exit+0xa0>
c0007594:	0a091663          	bnez	s2,c0007640 <do_exit+0x1a0>
c0007598:	048010ef          	jal	ra,c00085e0 <schedule>
c000759c:	0003e797          	auipc	a5,0x3e
c00075a0:	3887a783          	lw	a5,904(a5) # c0045924 <current>
c00075a4:	0047a683          	lw	a3,4(a5)
c00075a8:	00008617          	auipc	a2,0x8
c00075ac:	9f860613          	addi	a2,a2,-1544 # c000efa0 <default_pmm_manager+0xce8>
c00075b0:	21100593          	li	a1,529
c00075b4:	00008517          	auipc	a0,0x8
c00075b8:	c3c50513          	addi	a0,a0,-964 # c000f1f0 <default_pmm_manager+0xf38>
c00075bc:	c95f80ef          	jal	ra,c0000250 <__panic>
c00075c0:	00040513          	mv	a0,s0
c00075c4:	f35f90ef          	jal	ra,c00014f8 <exit_mmap>
c00075c8:	00c42683          	lw	a3,12(s0)
c00075cc:	c00007b7          	lui	a5,0xc0000
c00075d0:	fff78793          	addi	a5,a5,-1 # bfffffff <sbi_remote_fence_i+0xc000070f>
c00075d4:	0cd7f663          	bleu	a3,a5,c00076a0 <do_exit+0x200>
c00075d8:	0003e797          	auipc	a5,0x3e
c00075dc:	4287a783          	lw	a5,1064(a5) # c0045a00 <va_pa_offset>
c00075e0:	40f687b3          	sub	a5,a3,a5
c00075e4:	00c7d793          	srli	a5,a5,0xc
c00075e8:	0003e717          	auipc	a4,0x3e
c00075ec:	33472703          	lw	a4,820(a4) # c004591c <npage>
c00075f0:	08e7fc63          	bleu	a4,a5,c0007688 <do_exit+0x1e8>
c00075f4:	00035717          	auipc	a4,0x35
c00075f8:	ee072703          	lw	a4,-288(a4) # c003c4d4 <nbase>
c00075fc:	40e787b3          	sub	a5,a5,a4
c0007600:	00579793          	slli	a5,a5,0x5
c0007604:	0003e517          	auipc	a0,0x3e
c0007608:	40452503          	lw	a0,1028(a0) # c0045a08 <pages>
c000760c:	00f50533          	add	a0,a0,a5
c0007610:	00100593          	li	a1,1
c0007614:	b45fc0ef          	jal	ra,c0004158 <free_pages>
c0007618:	00040513          	mv	a0,s0
c000761c:	c7df90ef          	jal	ra,c0001298 <mm_destroy>
c0007620:	0003e697          	auipc	a3,0x3e
c0007624:	3046a683          	lw	a3,772(a3) # c0045924 <current>
c0007628:	ed9ff06f          	j	c0007500 <do_exit+0x60>
c000762c:	9f8f90ef          	jal	ra,c0000824 <intr_disable>
c0007630:	00100913          	li	s2,1
c0007634:	0003e697          	auipc	a3,0x3e
c0007638:	2f06a683          	lw	a3,752(a3) # c0045924 <current>
c000763c:	ee5ff06f          	j	c0007520 <do_exit+0x80>
c0007640:	9dcf90ef          	jal	ra,c000081c <intr_enable>
c0007644:	f55ff06f          	j	c0007598 <do_exit+0xf8>
c0007648:	6a9000ef          	jal	ra,c00084f0 <wakeup_proc>
c000764c:	0003e697          	auipc	a3,0x3e
c0007650:	2d86a683          	lw	a3,728(a3) # c0045924 <current>
c0007654:	ee1ff06f          	j	c0007534 <do_exit+0x94>
c0007658:	00008617          	auipc	a2,0x8
c000765c:	92860613          	addi	a2,a2,-1752 # c000ef80 <default_pmm_manager+0xcc8>
c0007660:	1e200593          	li	a1,482
c0007664:	00008517          	auipc	a0,0x8
c0007668:	b8c50513          	addi	a0,a0,-1140 # c000f1f0 <default_pmm_manager+0xf38>
c000766c:	be5f80ef          	jal	ra,c0000250 <__panic>
c0007670:	00008617          	auipc	a2,0x8
c0007674:	92060613          	addi	a2,a2,-1760 # c000ef90 <default_pmm_manager+0xcd8>
c0007678:	1e500593          	li	a1,485
c000767c:	00008517          	auipc	a0,0x8
c0007680:	b7450513          	addi	a0,a0,-1164 # c000f1f0 <default_pmm_manager+0xf38>
c0007684:	bcdf80ef          	jal	ra,c0000250 <__panic>
c0007688:	00006617          	auipc	a2,0x6
c000768c:	26860613          	addi	a2,a2,616 # c000d8f0 <commands+0xa54>
c0007690:	06100593          	li	a1,97
c0007694:	00006517          	auipc	a0,0x6
c0007698:	27c50513          	addi	a0,a0,636 # c000d910 <commands+0xa74>
c000769c:	bb5f80ef          	jal	ra,c0000250 <__panic>
c00076a0:	00006617          	auipc	a2,0x6
c00076a4:	4dc60613          	addi	a2,a2,1244 # c000db7c <commands+0xce0>
c00076a8:	06d00593          	li	a1,109
c00076ac:	00006517          	auipc	a0,0x6
c00076b0:	26450513          	addi	a0,a0,612 # c000d910 <commands+0xa74>
c00076b4:	b9df80ef          	jal	ra,c0000250 <__panic>

c00076b8 <do_wait.part.5>:
c00076b8:	fe010113          	addi	sp,sp,-32
c00076bc:	01212823          	sw	s2,16(sp)
c00076c0:	01512223          	sw	s5,4(sp)
c00076c4:	80000937          	lui	s2,0x80000
c00076c8:	00100a93          	li	s5,1
c00076cc:	00912a23          	sw	s1,20(sp)
c00076d0:	01312623          	sw	s3,12(sp)
c00076d4:	01412423          	sw	s4,8(sp)
c00076d8:	00112e23          	sw	ra,28(sp)
c00076dc:	00812c23          	sw	s0,24(sp)
c00076e0:	00050993          	mv	s3,a0
c00076e4:	00058a13          	mv	s4,a1
c00076e8:	00300493          	li	s1,3
c00076ec:	01590933          	add	s2,s2,s5
c00076f0:	12099663          	bnez	s3,c000781c <do_wait.part.5+0x164>
c00076f4:	0003e717          	auipc	a4,0x3e
c00076f8:	23072703          	lw	a4,560(a4) # c0045924 <current>
c00076fc:	0ac72403          	lw	s0,172(a4)
c0007700:	00041863          	bnez	s0,c0007710 <do_wait.part.5+0x58>
c0007704:	17c0006f          	j	c0007880 <do_wait.part.5+0x1c8>
c0007708:	0b442403          	lw	s0,180(s0)
c000770c:	12040c63          	beqz	s0,c0007844 <do_wait.part.5+0x18c>
c0007710:	00042783          	lw	a5,0(s0)
c0007714:	fe979ae3          	bne	a5,s1,c0007708 <do_wait.part.5+0x50>
c0007718:	0003e797          	auipc	a5,0x3e
c000771c:	2107a783          	lw	a5,528(a5) # c0045928 <idleproc>
c0007720:	18878663          	beq	a5,s0,c00078ac <do_wait.part.5+0x1f4>
c0007724:	0003e797          	auipc	a5,0x3e
c0007728:	2087a783          	lw	a5,520(a5) # c004592c <initproc>
c000772c:	18f40063          	beq	s0,a5,c00078ac <do_wait.part.5+0x1f4>
c0007730:	000a0663          	beqz	s4,c000773c <do_wait.part.5+0x84>
c0007734:	0a442783          	lw	a5,164(s0)
c0007738:	00fa2023          	sw	a5,0(s4)
c000773c:	100027f3          	csrr	a5,sstatus
c0007740:	0027f793          	andi	a5,a5,2
c0007744:	00000613          	li	a2,0
c0007748:	12079263          	bnez	a5,c000786c <do_wait.part.5+0x1b4>
c000774c:	09c42683          	lw	a3,156(s0)
c0007750:	0a042703          	lw	a4,160(s0)
c0007754:	0b442783          	lw	a5,180(s0)
c0007758:	00e6a223          	sw	a4,4(a3)
c000775c:	00d72023          	sw	a3,0(a4)
c0007760:	09442683          	lw	a3,148(s0)
c0007764:	09842703          	lw	a4,152(s0)
c0007768:	00e6a223          	sw	a4,4(a3)
c000776c:	00d72023          	sw	a3,0(a4)
c0007770:	00078663          	beqz	a5,c000777c <do_wait.part.5+0xc4>
c0007774:	0b042703          	lw	a4,176(s0)
c0007778:	0ae7a823          	sw	a4,176(a5)
c000777c:	0b042703          	lw	a4,176(s0)
c0007780:	10070463          	beqz	a4,c0007888 <do_wait.part.5+0x1d0>
c0007784:	0af72a23          	sw	a5,180(a4)
c0007788:	0003e797          	auipc	a5,0x3e
c000778c:	1a87a783          	lw	a5,424(a5) # c0045930 <nr_process>
c0007790:	fff78793          	addi	a5,a5,-1
c0007794:	0003e297          	auipc	t0,0x3e
c0007798:	18f2ae23          	sw	a5,412(t0) # c0045930 <nr_process>
c000779c:	0c061e63          	bnez	a2,c0007878 <do_wait.part.5+0x1c0>
c00077a0:	00c42683          	lw	a3,12(s0)
c00077a4:	c00007b7          	lui	a5,0xc0000
c00077a8:	0ef6e663          	bltu	a3,a5,c0007894 <do_wait.part.5+0x1dc>
c00077ac:	0003e797          	auipc	a5,0x3e
c00077b0:	2547a783          	lw	a5,596(a5) # c0045a00 <va_pa_offset>
c00077b4:	40f686b3          	sub	a3,a3,a5
c00077b8:	00c6d693          	srli	a3,a3,0xc
c00077bc:	0003e797          	auipc	a5,0x3e
c00077c0:	1607a783          	lw	a5,352(a5) # c004591c <npage>
c00077c4:	10f6f063          	bleu	a5,a3,c00078c4 <do_wait.part.5+0x20c>
c00077c8:	00035517          	auipc	a0,0x35
c00077cc:	d0c52503          	lw	a0,-756(a0) # c003c4d4 <nbase>
c00077d0:	40a686b3          	sub	a3,a3,a0
c00077d4:	00569693          	slli	a3,a3,0x5
c00077d8:	0003e517          	auipc	a0,0x3e
c00077dc:	23052503          	lw	a0,560(a0) # c0045a08 <pages>
c00077e0:	00d50533          	add	a0,a0,a3
c00077e4:	00200593          	li	a1,2
c00077e8:	971fc0ef          	jal	ra,c0004158 <free_pages>
c00077ec:	00040513          	mv	a0,s0
c00077f0:	eb5fa0ef          	jal	ra,c00026a4 <kfree>
c00077f4:	00000513          	li	a0,0
c00077f8:	01c12083          	lw	ra,28(sp)
c00077fc:	01812403          	lw	s0,24(sp)
c0007800:	01412483          	lw	s1,20(sp)
c0007804:	01012903          	lw	s2,16(sp)
c0007808:	00c12983          	lw	s3,12(sp)
c000780c:	00812a03          	lw	s4,8(sp)
c0007810:	00412a83          	lw	s5,4(sp)
c0007814:	02010113          	addi	sp,sp,32
c0007818:	00008067          	ret
c000781c:	00098513          	mv	a0,s3
c0007820:	e28ff0ef          	jal	ra,c0006e48 <find_proc>
c0007824:	00050413          	mv	s0,a0
c0007828:	04050c63          	beqz	a0,c0007880 <do_wait.part.5+0x1c8>
c000782c:	01452703          	lw	a4,20(a0)
c0007830:	0003e797          	auipc	a5,0x3e
c0007834:	0f47a783          	lw	a5,244(a5) # c0045924 <current>
c0007838:	04f71463          	bne	a4,a5,c0007880 <do_wait.part.5+0x1c8>
c000783c:	00052783          	lw	a5,0(a0)
c0007840:	ec978ce3          	beq	a5,s1,c0007718 <do_wait.part.5+0x60>
c0007844:	01572023          	sw	s5,0(a4)
c0007848:	0b272423          	sw	s2,168(a4)
c000784c:	595000ef          	jal	ra,c00085e0 <schedule>
c0007850:	0003e797          	auipc	a5,0x3e
c0007854:	0d47a783          	lw	a5,212(a5) # c0045924 <current>
c0007858:	05c7a783          	lw	a5,92(a5)
c000785c:	0017f793          	andi	a5,a5,1
c0007860:	e80788e3          	beqz	a5,c00076f0 <do_wait.part.5+0x38>
c0007864:	ff700513          	li	a0,-9
c0007868:	c39ff0ef          	jal	ra,c00074a0 <do_exit>
c000786c:	fb9f80ef          	jal	ra,c0000824 <intr_disable>
c0007870:	00100613          	li	a2,1
c0007874:	ed9ff06f          	j	c000774c <do_wait.part.5+0x94>
c0007878:	fa5f80ef          	jal	ra,c000081c <intr_enable>
c000787c:	f25ff06f          	j	c00077a0 <do_wait.part.5+0xe8>
c0007880:	ffe00513          	li	a0,-2
c0007884:	f75ff06f          	j	c00077f8 <do_wait.part.5+0x140>
c0007888:	01442703          	lw	a4,20(s0)
c000788c:	0af72623          	sw	a5,172(a4)
c0007890:	ef9ff06f          	j	c0007788 <do_wait.part.5+0xd0>
c0007894:	00006617          	auipc	a2,0x6
c0007898:	2e860613          	addi	a2,a2,744 # c000db7c <commands+0xce0>
c000789c:	06d00593          	li	a1,109
c00078a0:	00006517          	auipc	a0,0x6
c00078a4:	07050513          	addi	a0,a0,112 # c000d910 <commands+0xa74>
c00078a8:	9a9f80ef          	jal	ra,c0000250 <__panic>
c00078ac:	00007617          	auipc	a2,0x7
c00078b0:	73060613          	addi	a2,a2,1840 # c000efdc <default_pmm_manager+0xd24>
c00078b4:	30700593          	li	a1,775
c00078b8:	00008517          	auipc	a0,0x8
c00078bc:	93850513          	addi	a0,a0,-1736 # c000f1f0 <default_pmm_manager+0xf38>
c00078c0:	991f80ef          	jal	ra,c0000250 <__panic>
c00078c4:	00006617          	auipc	a2,0x6
c00078c8:	02c60613          	addi	a2,a2,44 # c000d8f0 <commands+0xa54>
c00078cc:	06100593          	li	a1,97
c00078d0:	00006517          	auipc	a0,0x6
c00078d4:	04050513          	addi	a0,a0,64 # c000d910 <commands+0xa74>
c00078d8:	979f80ef          	jal	ra,c0000250 <__panic>

c00078dc <init_main>:
c00078dc:	ff010113          	addi	sp,sp,-16
c00078e0:	00112623          	sw	ra,12(sp)
c00078e4:	8d9fc0ef          	jal	ra,c00041bc <nr_free_pages>
c00078e8:	c95fa0ef          	jal	ra,c000257c <kallocated>
c00078ec:	00000613          	li	a2,0
c00078f0:	00000593          	li	a1,0
c00078f4:	fffff517          	auipc	a0,0xfffff
c00078f8:	2f050513          	addi	a0,a0,752 # c0006be4 <user_main>
c00078fc:	b29ff0ef          	jal	ra,c0007424 <kernel_thread>
c0007900:	0aa05a63          	blez	a0,c00079b4 <init_main+0xd8>
c0007904:	905fe0ef          	jal	ra,c0006208 <check_sync>
c0007908:	0080006f          	j	c0007910 <init_main+0x34>
c000790c:	4d5000ef          	jal	ra,c00085e0 <schedule>
c0007910:	00000593          	li	a1,0
c0007914:	00000513          	li	a0,0
c0007918:	da1ff0ef          	jal	ra,c00076b8 <do_wait.part.5>
c000791c:	fe0508e3          	beqz	a0,c000790c <init_main+0x30>
c0007920:	00007517          	auipc	a0,0x7
c0007924:	6f450513          	addi	a0,a0,1780 # c000f014 <default_pmm_manager+0xd5c>
c0007928:	fb4f80ef          	jal	ra,c00000dc <cprintf>
c000792c:	0003e797          	auipc	a5,0x3e
c0007930:	0007a783          	lw	a5,0(a5) # c004592c <initproc>
c0007934:	0ac7a703          	lw	a4,172(a5)
c0007938:	04071e63          	bnez	a4,c0007994 <init_main+0xb8>
c000793c:	0b07a703          	lw	a4,176(a5)
c0007940:	04071a63          	bnez	a4,c0007994 <init_main+0xb8>
c0007944:	0b47a703          	lw	a4,180(a5)
c0007948:	04071663          	bnez	a4,c0007994 <init_main+0xb8>
c000794c:	0003e697          	auipc	a3,0x3e
c0007950:	fe46a683          	lw	a3,-28(a3) # c0045930 <nr_process>
c0007954:	00200713          	li	a4,2
c0007958:	0ae69a63          	bne	a3,a4,c0007a0c <init_main+0x130>
c000795c:	09478793          	addi	a5,a5,148
c0007960:	0003e717          	auipc	a4,0x3e
c0007964:	16872703          	lw	a4,360(a4) # c0045ac8 <proc_list+0x4>
c0007968:	08e79263          	bne	a5,a4,c00079ec <init_main+0x110>
c000796c:	0003e717          	auipc	a4,0x3e
c0007970:	15872703          	lw	a4,344(a4) # c0045ac4 <proc_list>
c0007974:	04f71c63          	bne	a4,a5,c00079cc <init_main+0xf0>
c0007978:	00007517          	auipc	a0,0x7
c000797c:	77c50513          	addi	a0,a0,1916 # c000f0f4 <default_pmm_manager+0xe3c>
c0007980:	f5cf80ef          	jal	ra,c00000dc <cprintf>
c0007984:	00c12083          	lw	ra,12(sp)
c0007988:	00000513          	li	a0,0
c000798c:	01010113          	addi	sp,sp,16
c0007990:	00008067          	ret
c0007994:	00007697          	auipc	a3,0x7
c0007998:	6a468693          	addi	a3,a3,1700 # c000f038 <default_pmm_manager+0xd80>
c000799c:	00006617          	auipc	a2,0x6
c00079a0:	8d860613          	addi	a2,a2,-1832 # c000d274 <commands+0x3d8>
c00079a4:	36c00593          	li	a1,876
c00079a8:	00008517          	auipc	a0,0x8
c00079ac:	84850513          	addi	a0,a0,-1976 # c000f1f0 <default_pmm_manager+0xf38>
c00079b0:	8a1f80ef          	jal	ra,c0000250 <__panic>
c00079b4:	00007617          	auipc	a2,0x7
c00079b8:	64460613          	addi	a2,a2,1604 # c000eff8 <default_pmm_manager+0xd40>
c00079bc:	36200593          	li	a1,866
c00079c0:	00008517          	auipc	a0,0x8
c00079c4:	83050513          	addi	a0,a0,-2000 # c000f1f0 <default_pmm_manager+0xf38>
c00079c8:	889f80ef          	jal	ra,c0000250 <__panic>
c00079cc:	00007697          	auipc	a3,0x7
c00079d0:	6f868693          	addi	a3,a3,1784 # c000f0c4 <default_pmm_manager+0xe0c>
c00079d4:	00006617          	auipc	a2,0x6
c00079d8:	8a060613          	addi	a2,a2,-1888 # c000d274 <commands+0x3d8>
c00079dc:	36f00593          	li	a1,879
c00079e0:	00008517          	auipc	a0,0x8
c00079e4:	81050513          	addi	a0,a0,-2032 # c000f1f0 <default_pmm_manager+0xf38>
c00079e8:	869f80ef          	jal	ra,c0000250 <__panic>
c00079ec:	00007697          	auipc	a3,0x7
c00079f0:	6a868693          	addi	a3,a3,1704 # c000f094 <default_pmm_manager+0xddc>
c00079f4:	00006617          	auipc	a2,0x6
c00079f8:	88060613          	addi	a2,a2,-1920 # c000d274 <commands+0x3d8>
c00079fc:	36e00593          	li	a1,878
c0007a00:	00007517          	auipc	a0,0x7
c0007a04:	7f050513          	addi	a0,a0,2032 # c000f1f0 <default_pmm_manager+0xf38>
c0007a08:	849f80ef          	jal	ra,c0000250 <__panic>
c0007a0c:	00007697          	auipc	a3,0x7
c0007a10:	67868693          	addi	a3,a3,1656 # c000f084 <default_pmm_manager+0xdcc>
c0007a14:	00006617          	auipc	a2,0x6
c0007a18:	86060613          	addi	a2,a2,-1952 # c000d274 <commands+0x3d8>
c0007a1c:	36d00593          	li	a1,877
c0007a20:	00007517          	auipc	a0,0x7
c0007a24:	7d050513          	addi	a0,a0,2000 # c000f1f0 <default_pmm_manager+0xf38>
c0007a28:	829f80ef          	jal	ra,c0000250 <__panic>

c0007a2c <do_execve>:
c0007a2c:	f7010113          	addi	sp,sp,-144
c0007a30:	0003e797          	auipc	a5,0x3e
c0007a34:	ef47a783          	lw	a5,-268(a5) # c0045924 <current>
c0007a38:	09212023          	sw	s2,128(sp)
c0007a3c:	0187a903          	lw	s2,24(a5)
c0007a40:	08912223          	sw	s1,132(sp)
c0007a44:	07312e23          	sw	s3,124(sp)
c0007a48:	07912223          	sw	s9,100(sp)
c0007a4c:	00050993          	mv	s3,a0
c0007a50:	00058493          	mv	s1,a1
c0007a54:	00060c93          	mv	s9,a2
c0007a58:	00000693          	li	a3,0
c0007a5c:	00058613          	mv	a2,a1
c0007a60:	00050593          	mv	a1,a0
c0007a64:	00090513          	mv	a0,s2
c0007a68:	08112623          	sw	ra,140(sp)
c0007a6c:	08812423          	sw	s0,136(sp)
c0007a70:	07412c23          	sw	s4,120(sp)
c0007a74:	07512a23          	sw	s5,116(sp)
c0007a78:	07612823          	sw	s6,112(sp)
c0007a7c:	07712623          	sw	s7,108(sp)
c0007a80:	07812423          	sw	s8,104(sp)
c0007a84:	07a12023          	sw	s10,96(sp)
c0007a88:	05b12e23          	sw	s11,92(sp)
c0007a8c:	a18fa0ef          	jal	ra,c0001ca4 <user_mem_check>
c0007a90:	56050c63          	beqz	a0,c0008008 <do_execve+0x5dc>
c0007a94:	03300613          	li	a2,51
c0007a98:	00000593          	li	a1,0
c0007a9c:	01c10513          	addi	a0,sp,28
c0007aa0:	469040ef          	jal	ra,c000c708 <memset>
c0007aa4:	03200793          	li	a5,50
c0007aa8:	00048613          	mv	a2,s1
c0007aac:	0c97e463          	bltu	a5,s1,c0007b74 <do_execve+0x148>
c0007ab0:	00098593          	mv	a1,s3
c0007ab4:	01c10513          	addi	a0,sp,28
c0007ab8:	46d040ef          	jal	ra,c000c724 <memcpy>
c0007abc:	0c090663          	beqz	s2,c0007b88 <do_execve+0x15c>
c0007ac0:	0003e797          	auipc	a5,0x3e
c0007ac4:	f447a783          	lw	a5,-188(a5) # c0045a04 <boot_cr3>
c0007ac8:	00c7d793          	srli	a5,a5,0xc
c0007acc:	18079073          	csrw	sptbr,a5
c0007ad0:	01892783          	lw	a5,24(s2) # 80000018 <sbi_remote_fence_i+0x80000728>
c0007ad4:	fff78793          	addi	a5,a5,-1
c0007ad8:	00f92c23          	sw	a5,24(s2)
c0007adc:	36078e63          	beqz	a5,c0007e58 <do_execve+0x42c>
c0007ae0:	0003e797          	auipc	a5,0x3e
c0007ae4:	e447a783          	lw	a5,-444(a5) # c0045924 <current>
c0007ae8:	0007ac23          	sw	zero,24(a5)
c0007aec:	d90f90ef          	jal	ra,c000107c <mm_create>
c0007af0:	00050993          	mv	s3,a0
c0007af4:	52050263          	beqz	a0,c0008018 <do_execve+0x5ec>
c0007af8:	00c50513          	addi	a0,a0,12
c0007afc:	978ff0ef          	jal	ra,c0006c74 <setup_pgdir.isra.2>
c0007b00:	4e051063          	bnez	a0,c0007fe0 <do_execve+0x5b4>
c0007b04:	000ca703          	lw	a4,0(s9)
c0007b08:	464c47b7          	lui	a5,0x464c4
c0007b0c:	57f78793          	addi	a5,a5,1407 # 464c457f <_binary_obj___user_matrix_out_size+0x464c1c37>
c0007b10:	ff800493          	li	s1,-8
c0007b14:	08f70e63          	beq	a4,a5,c0007bb0 <do_execve+0x184>
c0007b18:	00c9a683          	lw	a3,12(s3)
c0007b1c:	c00007b7          	lui	a5,0xc0000
c0007b20:	52f6e063          	bltu	a3,a5,c0008040 <do_execve+0x614>
c0007b24:	0003e797          	auipc	a5,0x3e
c0007b28:	edc7a783          	lw	a5,-292(a5) # c0045a00 <va_pa_offset>
c0007b2c:	40f686b3          	sub	a3,a3,a5
c0007b30:	00c6d693          	srli	a3,a3,0xc
c0007b34:	0003e797          	auipc	a5,0x3e
c0007b38:	de87a783          	lw	a5,-536(a5) # c004591c <npage>
c0007b3c:	50f6fe63          	bleu	a5,a3,c0008058 <do_execve+0x62c>
c0007b40:	00035517          	auipc	a0,0x35
c0007b44:	99452503          	lw	a0,-1644(a0) # c003c4d4 <nbase>
c0007b48:	40a686b3          	sub	a3,a3,a0
c0007b4c:	00569693          	slli	a3,a3,0x5
c0007b50:	0003e517          	auipc	a0,0x3e
c0007b54:	eb852503          	lw	a0,-328(a0) # c0045a08 <pages>
c0007b58:	00d50533          	add	a0,a0,a3
c0007b5c:	00100593          	li	a1,1
c0007b60:	df8fc0ef          	jal	ra,c0004158 <free_pages>
c0007b64:	00098513          	mv	a0,s3
c0007b68:	f30f90ef          	jal	ra,c0001298 <mm_destroy>
c0007b6c:	00048513          	mv	a0,s1
c0007b70:	931ff0ef          	jal	ra,c00074a0 <do_exit>
c0007b74:	00078613          	mv	a2,a5
c0007b78:	00098593          	mv	a1,s3
c0007b7c:	01c10513          	addi	a0,sp,28
c0007b80:	3a5040ef          	jal	ra,c000c724 <memcpy>
c0007b84:	f2091ee3          	bnez	s2,c0007ac0 <do_execve+0x94>
c0007b88:	0003e797          	auipc	a5,0x3e
c0007b8c:	d9c7a783          	lw	a5,-612(a5) # c0045924 <current>
c0007b90:	0187a783          	lw	a5,24(a5)
c0007b94:	f4078ce3          	beqz	a5,c0007aec <do_execve+0xc0>
c0007b98:	00007617          	auipc	a2,0x7
c0007b9c:	27460613          	addi	a2,a2,628 # c000ee0c <default_pmm_manager+0xb54>
c0007ba0:	21b00593          	li	a1,539
c0007ba4:	00007517          	auipc	a0,0x7
c0007ba8:	64c50513          	addi	a0,a0,1612 # c000f1f0 <default_pmm_manager+0xf38>
c0007bac:	ea4f80ef          	jal	ra,c0000250 <__panic>
c0007bb0:	01ccaa03          	lw	s4,28(s9)
c0007bb4:	02ccdd03          	lhu	s10,44(s9)
c0007bb8:	014c8a33          	add	s4,s9,s4
c0007bbc:	005d1d13          	slli	s10,s10,0x5
c0007bc0:	01aa07b3          	add	a5,s4,s10
c0007bc4:	00f12423          	sw	a5,8(sp)
c0007bc8:	02fa7c63          	bleu	a5,s4,c0007c00 <do_execve+0x1d4>
c0007bcc:	00035797          	auipc	a5,0x35
c0007bd0:	9087a783          	lw	a5,-1784(a5) # c003c4d4 <nbase>
c0007bd4:	00100bb7          	lui	s7,0x100
c0007bd8:	00f12223          	sw	a5,4(sp)
c0007bdc:	fffb8b93          	addi	s7,s7,-1 # fffff <_binary_obj___user_matrix_out_size+0xfd6b7>
c0007be0:	00f12623          	sw	a5,12(sp)
c0007be4:	00f12023          	sw	a5,0(sp)
c0007be8:	000a2703          	lw	a4,0(s4)
c0007bec:	00100793          	li	a5,1
c0007bf0:	12f70e63          	beq	a4,a5,c0007d2c <do_execve+0x300>
c0007bf4:	00812783          	lw	a5,8(sp)
c0007bf8:	020a0a13          	addi	s4,s4,32
c0007bfc:	fefa66e3          	bltu	s4,a5,c0007be8 <do_execve+0x1bc>
c0007c00:	00000713          	li	a4,0
c0007c04:	00b00693          	li	a3,11
c0007c08:	00100637          	lui	a2,0x100
c0007c0c:	aff005b7          	lui	a1,0xaff00
c0007c10:	00098513          	mv	a0,s3
c0007c14:	ef8f90ef          	jal	ra,c000130c <mm_map>
c0007c18:	00050493          	mv	s1,a0
c0007c1c:	22051863          	bnez	a0,c0007e4c <do_execve+0x420>
c0007c20:	00c9a503          	lw	a0,12(s3)
c0007c24:	01f00613          	li	a2,31
c0007c28:	affff5b7          	lui	a1,0xaffff
c0007c2c:	80cfd0ef          	jal	ra,c0004c38 <pgdir_alloc_page>
c0007c30:	4a050c63          	beqz	a0,c00080e8 <do_execve+0x6bc>
c0007c34:	00c9a503          	lw	a0,12(s3)
c0007c38:	01f00613          	li	a2,31
c0007c3c:	afffe5b7          	lui	a1,0xafffe
c0007c40:	ff9fc0ef          	jal	ra,c0004c38 <pgdir_alloc_page>
c0007c44:	48050263          	beqz	a0,c00080c8 <do_execve+0x69c>
c0007c48:	00c9a503          	lw	a0,12(s3)
c0007c4c:	01f00613          	li	a2,31
c0007c50:	afffd5b7          	lui	a1,0xafffd
c0007c54:	fe5fc0ef          	jal	ra,c0004c38 <pgdir_alloc_page>
c0007c58:	44050863          	beqz	a0,c00080a8 <do_execve+0x67c>
c0007c5c:	00c9a503          	lw	a0,12(s3)
c0007c60:	01f00613          	li	a2,31
c0007c64:	afffc5b7          	lui	a1,0xafffc
c0007c68:	fd1fc0ef          	jal	ra,c0004c38 <pgdir_alloc_page>
c0007c6c:	40050e63          	beqz	a0,c0008088 <do_execve+0x65c>
c0007c70:	0189a703          	lw	a4,24(s3)
c0007c74:	00c9a683          	lw	a3,12(s3)
c0007c78:	0003e797          	auipc	a5,0x3e
c0007c7c:	cac7a783          	lw	a5,-852(a5) # c0045924 <current>
c0007c80:	00170713          	addi	a4,a4,1
c0007c84:	00e9ac23          	sw	a4,24(s3)
c0007c88:	0137ac23          	sw	s3,24(a5)
c0007c8c:	c0000737          	lui	a4,0xc0000
c0007c90:	3ee6e063          	bltu	a3,a4,c0008070 <do_execve+0x644>
c0007c94:	0003e717          	auipc	a4,0x3e
c0007c98:	d6c72703          	lw	a4,-660(a4) # c0045a00 <va_pa_offset>
c0007c9c:	40e686b3          	sub	a3,a3,a4
c0007ca0:	04d7ac23          	sw	a3,88(a5)
c0007ca4:	00c6d693          	srli	a3,a3,0xc
c0007ca8:	18069073          	csrw	sptbr,a3
c0007cac:	0547a403          	lw	s0,84(a5)
c0007cb0:	00000593          	li	a1,0
c0007cb4:	09000613          	li	a2,144
c0007cb8:	00040513          	mv	a0,s0
c0007cbc:	08042903          	lw	s2,128(s0)
c0007cc0:	249040ef          	jal	ra,c000c708 <memset>
c0007cc4:	018ca783          	lw	a5,24(s9)
c0007cc8:	edf97913          	andi	s2,s2,-289
c0007ccc:	b0000737          	lui	a4,0xb0000
c0007cd0:	00e42423          	sw	a4,8(s0)
c0007cd4:	08f42223          	sw	a5,132(s0)
c0007cd8:	09242023          	sw	s2,128(s0)
c0007cdc:	01c10593          	addi	a1,sp,28
c0007ce0:	0003e517          	auipc	a0,0x3e
c0007ce4:	c4452503          	lw	a0,-956(a0) # c0045924 <current>
c0007ce8:	884ff0ef          	jal	ra,c0006d6c <set_proc_name>
c0007cec:	08c12083          	lw	ra,140(sp)
c0007cf0:	00048513          	mv	a0,s1
c0007cf4:	08812403          	lw	s0,136(sp)
c0007cf8:	08412483          	lw	s1,132(sp)
c0007cfc:	08012903          	lw	s2,128(sp)
c0007d00:	07c12983          	lw	s3,124(sp)
c0007d04:	07812a03          	lw	s4,120(sp)
c0007d08:	07412a83          	lw	s5,116(sp)
c0007d0c:	07012b03          	lw	s6,112(sp)
c0007d10:	06c12b83          	lw	s7,108(sp)
c0007d14:	06812c03          	lw	s8,104(sp)
c0007d18:	06412c83          	lw	s9,100(sp)
c0007d1c:	06012d03          	lw	s10,96(sp)
c0007d20:	05c12d83          	lw	s11,92(sp)
c0007d24:	09010113          	addi	sp,sp,144
c0007d28:	00008067          	ret
c0007d2c:	014a2603          	lw	a2,20(s4)
c0007d30:	010a2783          	lw	a5,16(s4)
c0007d34:	2ef66663          	bltu	a2,a5,c0008020 <do_execve+0x5f4>
c0007d38:	018a2783          	lw	a5,24(s4)
c0007d3c:	0017f693          	andi	a3,a5,1
c0007d40:	0027f713          	andi	a4,a5,2
c0007d44:	00269693          	slli	a3,a3,0x2
c0007d48:	00070463          	beqz	a4,c0007d50 <do_execve+0x324>
c0007d4c:	0026e693          	ori	a3,a3,2
c0007d50:	0047f793          	andi	a5,a5,4
c0007d54:	00078463          	beqz	a5,c0007d5c <do_execve+0x330>
c0007d58:	0016e693          	ori	a3,a3,1
c0007d5c:	0016f793          	andi	a5,a3,1
c0007d60:	01300b13          	li	s6,19
c0007d64:	00079463          	bnez	a5,c0007d6c <do_execve+0x340>
c0007d68:	01100b13          	li	s6,17
c0007d6c:	0026f793          	andi	a5,a3,2
c0007d70:	00078463          	beqz	a5,c0007d78 <do_execve+0x34c>
c0007d74:	01700b13          	li	s6,23
c0007d78:	0046f793          	andi	a5,a3,4
c0007d7c:	00078463          	beqz	a5,c0007d84 <do_execve+0x358>
c0007d80:	008b6b13          	ori	s6,s6,8
c0007d84:	008a2583          	lw	a1,8(s4)
c0007d88:	00000713          	li	a4,0
c0007d8c:	00098513          	mv	a0,s3
c0007d90:	d7cf90ef          	jal	ra,c000130c <mm_map>
c0007d94:	00050493          	mv	s1,a0
c0007d98:	0a051a63          	bnez	a0,c0007e4c <do_execve+0x420>
c0007d9c:	008a2d03          	lw	s10,8(s4)
c0007da0:	010a2903          	lw	s2,16(s4)
c0007da4:	004a2483          	lw	s1,4(s4)
c0007da8:	fffff7b7          	lui	a5,0xfffff
c0007dac:	012d0933          	add	s2,s10,s2
c0007db0:	009c84b3          	add	s1,s9,s1
c0007db4:	00fd7db3          	and	s11,s10,a5
c0007db8:	252d7c63          	bleu	s2,s10,c0008010 <do_execve+0x5e4>
c0007dbc:	00001ab7          	lui	s5,0x1
c0007dc0:	0700006f          	j	c0007e30 <do_execve+0x404>
c0007dc4:	41bd0533          	sub	a0,s10,s11
c0007dc8:	015d8db3          	add	s11,s11,s5
c0007dcc:	40aa8c33          	sub	s8,s5,a0
c0007dd0:	01b97663          	bleu	s11,s2,c0007ddc <do_execve+0x3b0>
c0007dd4:	41bc0833          	sub	a6,s8,s11
c0007dd8:	01090c33          	add	s8,s2,a6
c0007ddc:	0003e697          	auipc	a3,0x3e
c0007de0:	c2c6a683          	lw	a3,-980(a3) # c0045a08 <pages>
c0007de4:	00012783          	lw	a5,0(sp)
c0007de8:	40d406b3          	sub	a3,s0,a3
c0007dec:	4056d693          	srai	a3,a3,0x5
c0007df0:	00f686b3          	add	a3,a3,a5
c0007df4:	0176f5b3          	and	a1,a3,s7
c0007df8:	0003e617          	auipc	a2,0x3e
c0007dfc:	b2462603          	lw	a2,-1244(a2) # c004591c <npage>
c0007e00:	00c69693          	slli	a3,a3,0xc
c0007e04:	22c5f263          	bleu	a2,a1,c0008028 <do_execve+0x5fc>
c0007e08:	0003e617          	auipc	a2,0x3e
c0007e0c:	bf862603          	lw	a2,-1032(a2) # c0045a00 <va_pa_offset>
c0007e10:	00c686b3          	add	a3,a3,a2
c0007e14:	00048593          	mv	a1,s1
c0007e18:	000c0613          	mv	a2,s8
c0007e1c:	00a68533          	add	a0,a3,a0
c0007e20:	018d0d33          	add	s10,s10,s8
c0007e24:	101040ef          	jal	ra,c000c724 <memcpy>
c0007e28:	018484b3          	add	s1,s1,s8
c0007e2c:	092d7663          	bleu	s2,s10,c0007eb8 <do_execve+0x48c>
c0007e30:	00c9a503          	lw	a0,12(s3)
c0007e34:	000b0613          	mv	a2,s6
c0007e38:	000d8593          	mv	a1,s11
c0007e3c:	dfdfc0ef          	jal	ra,c0004c38 <pgdir_alloc_page>
c0007e40:	00050413          	mv	s0,a0
c0007e44:	f80510e3          	bnez	a0,c0007dc4 <do_execve+0x398>
c0007e48:	ffc00493          	li	s1,-4
c0007e4c:	00098513          	mv	a0,s3
c0007e50:	ea8f90ef          	jal	ra,c00014f8 <exit_mmap>
c0007e54:	cc5ff06f          	j	c0007b18 <do_execve+0xec>
c0007e58:	00090513          	mv	a0,s2
c0007e5c:	e9cf90ef          	jal	ra,c00014f8 <exit_mmap>
c0007e60:	00c92683          	lw	a3,12(s2)
c0007e64:	c00007b7          	lui	a5,0xc0000
c0007e68:	1cf6ec63          	bltu	a3,a5,c0008040 <do_execve+0x614>
c0007e6c:	0003e797          	auipc	a5,0x3e
c0007e70:	b947a783          	lw	a5,-1132(a5) # c0045a00 <va_pa_offset>
c0007e74:	40f686b3          	sub	a3,a3,a5
c0007e78:	00c6d693          	srli	a3,a3,0xc
c0007e7c:	0003e797          	auipc	a5,0x3e
c0007e80:	aa07a783          	lw	a5,-1376(a5) # c004591c <npage>
c0007e84:	1cf6fa63          	bleu	a5,a3,c0008058 <do_execve+0x62c>
c0007e88:	00034517          	auipc	a0,0x34
c0007e8c:	64c52503          	lw	a0,1612(a0) # c003c4d4 <nbase>
c0007e90:	40a686b3          	sub	a3,a3,a0
c0007e94:	00569693          	slli	a3,a3,0x5
c0007e98:	0003e517          	auipc	a0,0x3e
c0007e9c:	b7052503          	lw	a0,-1168(a0) # c0045a08 <pages>
c0007ea0:	00d50533          	add	a0,a0,a3
c0007ea4:	00100593          	li	a1,1
c0007ea8:	ab0fc0ef          	jal	ra,c0004158 <free_pages>
c0007eac:	00090513          	mv	a0,s2
c0007eb0:	be8f90ef          	jal	ra,c0001298 <mm_destroy>
c0007eb4:	c2dff06f          	j	c0007ae0 <do_execve+0xb4>
c0007eb8:	008a2483          	lw	s1,8(s4)
c0007ebc:	014a2683          	lw	a3,20(s4)
c0007ec0:	00d484b3          	add	s1,s1,a3
c0007ec4:	09bd6863          	bltu	s10,s11,c0007f54 <do_execve+0x528>
c0007ec8:	00001937          	lui	s2,0x1
c0007ecc:	069d6663          	bltu	s10,s1,c0007f38 <do_execve+0x50c>
c0007ed0:	d25ff06f          	j	c0007bf4 <do_execve+0x1c8>
c0007ed4:	41bd0533          	sub	a0,s10,s11
c0007ed8:	012d8db3          	add	s11,s11,s2
c0007edc:	40a90633          	sub	a2,s2,a0
c0007ee0:	01b4f663          	bleu	s11,s1,c0007eec <do_execve+0x4c0>
c0007ee4:	41b60633          	sub	a2,a2,s11
c0007ee8:	00c48633          	add	a2,s1,a2
c0007eec:	0003e697          	auipc	a3,0x3e
c0007ef0:	b1c6a683          	lw	a3,-1252(a3) # c0045a08 <pages>
c0007ef4:	00412783          	lw	a5,4(sp)
c0007ef8:	40d406b3          	sub	a3,s0,a3
c0007efc:	4056d693          	srai	a3,a3,0x5
c0007f00:	00f686b3          	add	a3,a3,a5
c0007f04:	0176f833          	and	a6,a3,s7
c0007f08:	0003e597          	auipc	a1,0x3e
c0007f0c:	a145a583          	lw	a1,-1516(a1) # c004591c <npage>
c0007f10:	00c69693          	slli	a3,a3,0xc
c0007f14:	10b87a63          	bleu	a1,a6,c0008028 <do_execve+0x5fc>
c0007f18:	0003e597          	auipc	a1,0x3e
c0007f1c:	ae85a583          	lw	a1,-1304(a1) # c0045a00 <va_pa_offset>
c0007f20:	00b686b3          	add	a3,a3,a1
c0007f24:	00cd0d33          	add	s10,s10,a2
c0007f28:	00000593          	li	a1,0
c0007f2c:	00a68533          	add	a0,a3,a0
c0007f30:	7d8040ef          	jal	ra,c000c708 <memset>
c0007f34:	cc9d70e3          	bleu	s1,s10,c0007bf4 <do_execve+0x1c8>
c0007f38:	00c9a503          	lw	a0,12(s3)
c0007f3c:	000b0613          	mv	a2,s6
c0007f40:	000d8593          	mv	a1,s11
c0007f44:	cf5fc0ef          	jal	ra,c0004c38 <pgdir_alloc_page>
c0007f48:	00050413          	mv	s0,a0
c0007f4c:	f80514e3          	bnez	a0,c0007ed4 <do_execve+0x4a8>
c0007f50:	ef9ff06f          	j	c0007e48 <do_execve+0x41c>
c0007f54:	cba480e3          	beq	s1,s10,c0007bf4 <do_execve+0x1c8>
c0007f58:	41bd0933          	sub	s2,s10,s11
c0007f5c:	00001537          	lui	a0,0x1
c0007f60:	00a90533          	add	a0,s2,a0
c0007f64:	09b4e663          	bltu	s1,s11,c0007ff0 <do_execve+0x5c4>
c0007f68:	41200933          	neg	s2,s2
c0007f6c:	0003e697          	auipc	a3,0x3e
c0007f70:	a9c6a683          	lw	a3,-1380(a3) # c0045a08 <pages>
c0007f74:	00c12783          	lw	a5,12(sp)
c0007f78:	40d406b3          	sub	a3,s0,a3
c0007f7c:	4056d693          	srai	a3,a3,0x5
c0007f80:	00f686b3          	add	a3,a3,a5
c0007f84:	0176f5b3          	and	a1,a3,s7
c0007f88:	0003e617          	auipc	a2,0x3e
c0007f8c:	99462603          	lw	a2,-1644(a2) # c004591c <npage>
c0007f90:	00c69693          	slli	a3,a3,0xc
c0007f94:	08c5fa63          	bleu	a2,a1,c0008028 <do_execve+0x5fc>
c0007f98:	0003e617          	auipc	a2,0x3e
c0007f9c:	a6862603          	lw	a2,-1432(a2) # c0045a00 <va_pa_offset>
c0007fa0:	00c686b3          	add	a3,a3,a2
c0007fa4:	00000593          	li	a1,0
c0007fa8:	00090613          	mv	a2,s2
c0007fac:	00a68533          	add	a0,a3,a0
c0007fb0:	758040ef          	jal	ra,c000c708 <memset>
c0007fb4:	01a90733          	add	a4,s2,s10
c0007fb8:	05b4f263          	bleu	s11,s1,c0007ffc <do_execve+0x5d0>
c0007fbc:	c2e48ce3          	beq	s1,a4,c0007bf4 <do_execve+0x1c8>
c0007fc0:	00007697          	auipc	a3,0x7
c0007fc4:	e7468693          	addi	a3,a3,-396 # c000ee34 <default_pmm_manager+0xb7c>
c0007fc8:	00005617          	auipc	a2,0x5
c0007fcc:	2ac60613          	addi	a2,a2,684 # c000d274 <commands+0x3d8>
c0007fd0:	27000593          	li	a1,624
c0007fd4:	00007517          	auipc	a0,0x7
c0007fd8:	21c50513          	addi	a0,a0,540 # c000f1f0 <default_pmm_manager+0xf38>
c0007fdc:	a74f80ef          	jal	ra,c0000250 <__panic>
c0007fe0:	00098513          	mv	a0,s3
c0007fe4:	ab4f90ef          	jal	ra,c0001298 <mm_destroy>
c0007fe8:	ffc00493          	li	s1,-4
c0007fec:	b81ff06f          	j	c0007b6c <do_execve+0x140>
c0007ff0:	41b486b3          	sub	a3,s1,s11
c0007ff4:	41268933          	sub	s2,a3,s2
c0007ff8:	f75ff06f          	j	c0007f6c <do_execve+0x540>
c0007ffc:	fdb712e3          	bne	a4,s11,c0007fc0 <do_execve+0x594>
c0008000:	000d8d13          	mv	s10,s11
c0008004:	ec5ff06f          	j	c0007ec8 <do_execve+0x49c>
c0008008:	ffd00493          	li	s1,-3
c000800c:	ce1ff06f          	j	c0007cec <do_execve+0x2c0>
c0008010:	000d0493          	mv	s1,s10
c0008014:	ea9ff06f          	j	c0007ebc <do_execve+0x490>
c0008018:	ffc00493          	li	s1,-4
c000801c:	b51ff06f          	j	c0007b6c <do_execve+0x140>
c0008020:	ff800493          	li	s1,-8
c0008024:	e29ff06f          	j	c0007e4c <do_execve+0x420>
c0008028:	00006617          	auipc	a2,0x6
c000802c:	b3060613          	addi	a2,a2,-1232 # c000db58 <commands+0xcbc>
c0008030:	06800593          	li	a1,104
c0008034:	00006517          	auipc	a0,0x6
c0008038:	8dc50513          	addi	a0,a0,-1828 # c000d910 <commands+0xa74>
c000803c:	a14f80ef          	jal	ra,c0000250 <__panic>
c0008040:	00006617          	auipc	a2,0x6
c0008044:	b3c60613          	addi	a2,a2,-1220 # c000db7c <commands+0xce0>
c0008048:	06d00593          	li	a1,109
c000804c:	00006517          	auipc	a0,0x6
c0008050:	8c450513          	addi	a0,a0,-1852 # c000d910 <commands+0xa74>
c0008054:	9fcf80ef          	jal	ra,c0000250 <__panic>
c0008058:	00006617          	auipc	a2,0x6
c000805c:	89860613          	addi	a2,a2,-1896 # c000d8f0 <commands+0xa54>
c0008060:	06100593          	li	a1,97
c0008064:	00006517          	auipc	a0,0x6
c0008068:	8ac50513          	addi	a0,a0,-1876 # c000d910 <commands+0xa74>
c000806c:	9e4f80ef          	jal	ra,c0000250 <__panic>
c0008070:	00006617          	auipc	a2,0x6
c0008074:	b0c60613          	addi	a2,a2,-1268 # c000db7c <commands+0xce0>
c0008078:	28b00593          	li	a1,651
c000807c:	00007517          	auipc	a0,0x7
c0008080:	17450513          	addi	a0,a0,372 # c000f1f0 <default_pmm_manager+0xf38>
c0008084:	9ccf80ef          	jal	ra,c0000250 <__panic>
c0008088:	00007697          	auipc	a3,0x7
c000808c:	eb468693          	addi	a3,a3,-332 # c000ef3c <default_pmm_manager+0xc84>
c0008090:	00005617          	auipc	a2,0x5
c0008094:	1e460613          	addi	a2,a2,484 # c000d274 <commands+0x3d8>
c0008098:	28600593          	li	a1,646
c000809c:	00007517          	auipc	a0,0x7
c00080a0:	15450513          	addi	a0,a0,340 # c000f1f0 <default_pmm_manager+0xf38>
c00080a4:	9acf80ef          	jal	ra,c0000250 <__panic>
c00080a8:	00007697          	auipc	a3,0x7
c00080ac:	e5068693          	addi	a3,a3,-432 # c000eef8 <default_pmm_manager+0xc40>
c00080b0:	00005617          	auipc	a2,0x5
c00080b4:	1c460613          	addi	a2,a2,452 # c000d274 <commands+0x3d8>
c00080b8:	28500593          	li	a1,645
c00080bc:	00007517          	auipc	a0,0x7
c00080c0:	13450513          	addi	a0,a0,308 # c000f1f0 <default_pmm_manager+0xf38>
c00080c4:	98cf80ef          	jal	ra,c0000250 <__panic>
c00080c8:	00007697          	auipc	a3,0x7
c00080cc:	dec68693          	addi	a3,a3,-532 # c000eeb4 <default_pmm_manager+0xbfc>
c00080d0:	00005617          	auipc	a2,0x5
c00080d4:	1a460613          	addi	a2,a2,420 # c000d274 <commands+0x3d8>
c00080d8:	28400593          	li	a1,644
c00080dc:	00007517          	auipc	a0,0x7
c00080e0:	11450513          	addi	a0,a0,276 # c000f1f0 <default_pmm_manager+0xf38>
c00080e4:	96cf80ef          	jal	ra,c0000250 <__panic>
c00080e8:	00007697          	auipc	a3,0x7
c00080ec:	d8868693          	addi	a3,a3,-632 # c000ee70 <default_pmm_manager+0xbb8>
c00080f0:	00005617          	auipc	a2,0x5
c00080f4:	18460613          	addi	a2,a2,388 # c000d274 <commands+0x3d8>
c00080f8:	28300593          	li	a1,643
c00080fc:	00007517          	auipc	a0,0x7
c0008100:	0f450513          	addi	a0,a0,244 # c000f1f0 <default_pmm_manager+0xf38>
c0008104:	94cf80ef          	jal	ra,c0000250 <__panic>

c0008108 <do_yield>:
c0008108:	00100713          	li	a4,1
c000810c:	0003e797          	auipc	a5,0x3e
c0008110:	8187a783          	lw	a5,-2024(a5) # c0045924 <current>
c0008114:	00e7a823          	sw	a4,16(a5)
c0008118:	00000513          	li	a0,0
c000811c:	00008067          	ret

c0008120 <do_wait>:
c0008120:	ff010113          	addi	sp,sp,-16
c0008124:	00812423          	sw	s0,8(sp)
c0008128:	00912223          	sw	s1,4(sp)
c000812c:	00112623          	sw	ra,12(sp)
c0008130:	00058413          	mv	s0,a1
c0008134:	00050493          	mv	s1,a0
c0008138:	02058063          	beqz	a1,c0008158 <do_wait+0x38>
c000813c:	0003d797          	auipc	a5,0x3d
c0008140:	7e87a783          	lw	a5,2024(a5) # c0045924 <current>
c0008144:	0187a503          	lw	a0,24(a5)
c0008148:	00100693          	li	a3,1
c000814c:	00400613          	li	a2,4
c0008150:	b55f90ef          	jal	ra,c0001ca4 <user_mem_check>
c0008154:	02050063          	beqz	a0,c0008174 <do_wait+0x54>
c0008158:	00040593          	mv	a1,s0
c000815c:	00048513          	mv	a0,s1
c0008160:	00c12083          	lw	ra,12(sp)
c0008164:	00812403          	lw	s0,8(sp)
c0008168:	00412483          	lw	s1,4(sp)
c000816c:	01010113          	addi	sp,sp,16
c0008170:	d48ff06f          	j	c00076b8 <do_wait.part.5>
c0008174:	00c12083          	lw	ra,12(sp)
c0008178:	ffd00513          	li	a0,-3
c000817c:	00812403          	lw	s0,8(sp)
c0008180:	00412483          	lw	s1,4(sp)
c0008184:	01010113          	addi	sp,sp,16
c0008188:	00008067          	ret

c000818c <do_kill>:
c000818c:	ff010113          	addi	sp,sp,-16
c0008190:	00812423          	sw	s0,8(sp)
c0008194:	00112623          	sw	ra,12(sp)
c0008198:	cb1fe0ef          	jal	ra,c0006e48 <find_proc>
c000819c:	ffd00413          	li	s0,-3
c00081a0:	02050463          	beqz	a0,c00081c8 <do_kill+0x3c>
c00081a4:	05c52703          	lw	a4,92(a0)
c00081a8:	ff700413          	li	s0,-9
c00081ac:	00177693          	andi	a3,a4,1
c00081b0:	00069c63          	bnez	a3,c00081c8 <do_kill+0x3c>
c00081b4:	0a852683          	lw	a3,168(a0)
c00081b8:	00176713          	ori	a4,a4,1
c00081bc:	04e52e23          	sw	a4,92(a0)
c00081c0:	00000413          	li	s0,0
c00081c4:	0006cc63          	bltz	a3,c00081dc <do_kill+0x50>
c00081c8:	00c12083          	lw	ra,12(sp)
c00081cc:	00040513          	mv	a0,s0
c00081d0:	00812403          	lw	s0,8(sp)
c00081d4:	01010113          	addi	sp,sp,16
c00081d8:	00008067          	ret
c00081dc:	314000ef          	jal	ra,c00084f0 <wakeup_proc>
c00081e0:	00c12083          	lw	ra,12(sp)
c00081e4:	00040513          	mv	a0,s0
c00081e8:	00812403          	lw	s0,8(sp)
c00081ec:	01010113          	addi	sp,sp,16
c00081f0:	00008067          	ret

c00081f4 <proc_init>:
c00081f4:	ff010113          	addi	sp,sp,-16
c00081f8:	0003e797          	auipc	a5,0x3e
c00081fc:	8cc78793          	addi	a5,a5,-1844 # c0045ac4 <proc_list>
c0008200:	00112623          	sw	ra,12(sp)
c0008204:	00812423          	sw	s0,8(sp)
c0008208:	00f7a223          	sw	a5,4(a5)
c000820c:	00f7a023          	sw	a5,0(a5)
c0008210:	0003d717          	auipc	a4,0x3d
c0008214:	6d870713          	addi	a4,a4,1752 # c00458e8 <__rq>
c0008218:	0003b797          	auipc	a5,0x3b
c000821c:	6d078793          	addi	a5,a5,1744 # c00438e8 <hash_list>
c0008220:	00f7a223          	sw	a5,4(a5)
c0008224:	00f7a023          	sw	a5,0(a5)
c0008228:	00878793          	addi	a5,a5,8
c000822c:	fef71ae3          	bne	a4,a5,c0008220 <proc_init+0x2c>
c0008230:	8e9fe0ef          	jal	ra,c0006b18 <alloc_proc>
c0008234:	0003d297          	auipc	t0,0x3d
c0008238:	6ea2aa23          	sw	a0,1780(t0) # c0045928 <idleproc>
c000823c:	0a050e63          	beqz	a0,c00082f8 <proc_init+0x104>
c0008240:	00200713          	li	a4,2
c0008244:	00100413          	li	s0,1
c0008248:	00e52023          	sw	a4,0(a0)
c000824c:	00008717          	auipc	a4,0x8
c0008250:	db470713          	addi	a4,a4,-588 # c0010000 <bootstack>
c0008254:	00007597          	auipc	a1,0x7
c0008258:	ed458593          	addi	a1,a1,-300 # c000f128 <default_pmm_manager+0xe70>
c000825c:	00052223          	sw	zero,4(a0)
c0008260:	00e52623          	sw	a4,12(a0)
c0008264:	00852823          	sw	s0,16(a0)
c0008268:	b05fe0ef          	jal	ra,c0006d6c <set_proc_name>
c000826c:	0003d797          	auipc	a5,0x3d
c0008270:	6c47a783          	lw	a5,1732(a5) # c0045930 <nr_process>
c0008274:	008787b3          	add	a5,a5,s0
c0008278:	0003d297          	auipc	t0,0x3d
c000827c:	6af2ac23          	sw	a5,1720(t0) # c0045930 <nr_process>
c0008280:	00000613          	li	a2,0
c0008284:	0003d797          	auipc	a5,0x3d
c0008288:	6a47a783          	lw	a5,1700(a5) # c0045928 <idleproc>
c000828c:	00000593          	li	a1,0
c0008290:	fffff517          	auipc	a0,0xfffff
c0008294:	64c50513          	addi	a0,a0,1612 # c00078dc <init_main>
c0008298:	0003d297          	auipc	t0,0x3d
c000829c:	68f2a623          	sw	a5,1676(t0) # c0045924 <current>
c00082a0:	984ff0ef          	jal	ra,c0007424 <kernel_thread>
c00082a4:	0aa05663          	blez	a0,c0008350 <proc_init+0x15c>
c00082a8:	ba1fe0ef          	jal	ra,c0006e48 <find_proc>
c00082ac:	00007597          	auipc	a1,0x7
c00082b0:	ea058593          	addi	a1,a1,-352 # c000f14c <default_pmm_manager+0xe94>
c00082b4:	0003d297          	auipc	t0,0x3d
c00082b8:	66a2ac23          	sw	a0,1656(t0) # c004592c <initproc>
c00082bc:	ab1fe0ef          	jal	ra,c0006d6c <set_proc_name>
c00082c0:	0003d797          	auipc	a5,0x3d
c00082c4:	6687a783          	lw	a5,1640(a5) # c0045928 <idleproc>
c00082c8:	06078463          	beqz	a5,c0008330 <proc_init+0x13c>
c00082cc:	0047a783          	lw	a5,4(a5)
c00082d0:	06079063          	bnez	a5,c0008330 <proc_init+0x13c>
c00082d4:	0003d797          	auipc	a5,0x3d
c00082d8:	6587a783          	lw	a5,1624(a5) # c004592c <initproc>
c00082dc:	02078a63          	beqz	a5,c0008310 <proc_init+0x11c>
c00082e0:	0047a783          	lw	a5,4(a5)
c00082e4:	02879663          	bne	a5,s0,c0008310 <proc_init+0x11c>
c00082e8:	00c12083          	lw	ra,12(sp)
c00082ec:	00812403          	lw	s0,8(sp)
c00082f0:	01010113          	addi	sp,sp,16
c00082f4:	00008067          	ret
c00082f8:	00007617          	auipc	a2,0x7
c00082fc:	e1860613          	addi	a2,a2,-488 # c000f110 <default_pmm_manager+0xe58>
c0008300:	38100593          	li	a1,897
c0008304:	00007517          	auipc	a0,0x7
c0008308:	eec50513          	addi	a0,a0,-276 # c000f1f0 <default_pmm_manager+0xf38>
c000830c:	f45f70ef          	jal	ra,c0000250 <__panic>
c0008310:	00007697          	auipc	a3,0x7
c0008314:	e6c68693          	addi	a3,a3,-404 # c000f17c <default_pmm_manager+0xec4>
c0008318:	00005617          	auipc	a2,0x5
c000831c:	f5c60613          	addi	a2,a2,-164 # c000d274 <commands+0x3d8>
c0008320:	39600593          	li	a1,918
c0008324:	00007517          	auipc	a0,0x7
c0008328:	ecc50513          	addi	a0,a0,-308 # c000f1f0 <default_pmm_manager+0xf38>
c000832c:	f25f70ef          	jal	ra,c0000250 <__panic>
c0008330:	00007697          	auipc	a3,0x7
c0008334:	e2468693          	addi	a3,a3,-476 # c000f154 <default_pmm_manager+0xe9c>
c0008338:	00005617          	auipc	a2,0x5
c000833c:	f3c60613          	addi	a2,a2,-196 # c000d274 <commands+0x3d8>
c0008340:	39500593          	li	a1,917
c0008344:	00007517          	auipc	a0,0x7
c0008348:	eac50513          	addi	a0,a0,-340 # c000f1f0 <default_pmm_manager+0xf38>
c000834c:	f05f70ef          	jal	ra,c0000250 <__panic>
c0008350:	00007617          	auipc	a2,0x7
c0008354:	de060613          	addi	a2,a2,-544 # c000f130 <default_pmm_manager+0xe78>
c0008358:	38f00593          	li	a1,911
c000835c:	00007517          	auipc	a0,0x7
c0008360:	e9450513          	addi	a0,a0,-364 # c000f1f0 <default_pmm_manager+0xf38>
c0008364:	eedf70ef          	jal	ra,c0000250 <__panic>

c0008368 <cpu_idle>:
c0008368:	ff010113          	addi	sp,sp,-16
c000836c:	00112623          	sw	ra,12(sp)
c0008370:	0003d717          	auipc	a4,0x3d
c0008374:	5b472703          	lw	a4,1460(a4) # c0045924 <current>
c0008378:	01072783          	lw	a5,16(a4)
c000837c:	fe078ee3          	beqz	a5,c0008378 <cpu_idle+0x10>
c0008380:	260000ef          	jal	ra,c00085e0 <schedule>
c0008384:	fedff06f          	j	c0008370 <cpu_idle+0x8>

c0008388 <lab6_set_priority>:
c0008388:	00050a63          	beqz	a0,c000839c <lab6_set_priority+0x14>
c000838c:	0003d797          	auipc	a5,0x3d
c0008390:	5987a783          	lw	a5,1432(a5) # c0045924 <current>
c0008394:	0ca7ac23          	sw	a0,216(a5)
c0008398:	00008067          	ret
c000839c:	00100713          	li	a4,1
c00083a0:	0003d797          	auipc	a5,0x3d
c00083a4:	5847a783          	lw	a5,1412(a5) # c0045924 <current>
c00083a8:	0ce7ac23          	sw	a4,216(a5)
c00083ac:	00008067          	ret

c00083b0 <do_sleep>:
c00083b0:	06050e63          	beqz	a0,c000842c <do_sleep+0x7c>
c00083b4:	fe010113          	addi	sp,sp,-32
c00083b8:	00812c23          	sw	s0,24(sp)
c00083bc:	00112e23          	sw	ra,28(sp)
c00083c0:	00050413          	mv	s0,a0
c00083c4:	100027f3          	csrr	a5,sstatus
c00083c8:	0027f793          	andi	a5,a5,2
c00083cc:	06079463          	bnez	a5,c0008434 <do_sleep+0x84>
c00083d0:	0003d797          	auipc	a5,0x3d
c00083d4:	5547a783          	lw	a5,1364(a5) # c0045924 <current>
c00083d8:	00810713          	addi	a4,sp,8
c00083dc:	00a12023          	sw	a0,0(sp)
c00083e0:	00e12623          	sw	a4,12(sp)
c00083e4:	00e12423          	sw	a4,8(sp)
c00083e8:	00f12223          	sw	a5,4(sp)
c00083ec:	00100713          	li	a4,1
c00083f0:	00e7a023          	sw	a4,0(a5)
c00083f4:	80000737          	lui	a4,0x80000
c00083f8:	00270713          	addi	a4,a4,2 # 80000002 <sbi_remote_fence_i+0x80000712>
c00083fc:	0ae7a423          	sw	a4,168(a5)
c0008400:	00010513          	mv	a0,sp
c0008404:	00010413          	mv	s0,sp
c0008408:	2ec000ef          	jal	ra,c00086f4 <add_timer>
c000840c:	1d4000ef          	jal	ra,c00085e0 <schedule>
c0008410:	00040513          	mv	a0,s0
c0008414:	3f8000ef          	jal	ra,c000880c <del_timer>
c0008418:	01c12083          	lw	ra,28(sp)
c000841c:	00000513          	li	a0,0
c0008420:	01812403          	lw	s0,24(sp)
c0008424:	02010113          	addi	sp,sp,32
c0008428:	00008067          	ret
c000842c:	00000513          	li	a0,0
c0008430:	00008067          	ret
c0008434:	bf0f80ef          	jal	ra,c0000824 <intr_disable>
c0008438:	0003d797          	auipc	a5,0x3d
c000843c:	4ec7a783          	lw	a5,1260(a5) # c0045924 <current>
c0008440:	00810713          	addi	a4,sp,8
c0008444:	00812023          	sw	s0,0(sp)
c0008448:	00f12223          	sw	a5,4(sp)
c000844c:	00e12623          	sw	a4,12(sp)
c0008450:	00e12423          	sw	a4,8(sp)
c0008454:	00100713          	li	a4,1
c0008458:	00e7a023          	sw	a4,0(a5)
c000845c:	80000737          	lui	a4,0x80000
c0008460:	00270713          	addi	a4,a4,2 # 80000002 <sbi_remote_fence_i+0x80000712>
c0008464:	00010513          	mv	a0,sp
c0008468:	0ae7a423          	sw	a4,168(a5)
c000846c:	00010413          	mv	s0,sp
c0008470:	284000ef          	jal	ra,c00086f4 <add_timer>
c0008474:	ba8f80ef          	jal	ra,c000081c <intr_enable>
c0008478:	f95ff06f          	j	c000840c <do_sleep+0x5c>

c000847c <sched_init>:
c000847c:	ff010113          	addi	sp,sp,-16
c0008480:	00034697          	auipc	a3,0x34
c0008484:	03068693          	addi	a3,a3,48 # c003c4b0 <default_sched_class>
c0008488:	00112623          	sw	ra,12(sp)
c000848c:	00812423          	sw	s0,8(sp)
c0008490:	0003d797          	auipc	a5,0x3d
c0008494:	4ac78793          	addi	a5,a5,1196 # c004593c <timer_list>
c0008498:	0046a603          	lw	a2,4(a3)
c000849c:	0003d717          	auipc	a4,0x3d
c00084a0:	44c70713          	addi	a4,a4,1100 # c00458e8 <__rq>
c00084a4:	00f7a223          	sw	a5,4(a5)
c00084a8:	00f7a023          	sw	a5,0(a5)
c00084ac:	00500793          	li	a5,5
c00084b0:	0003d417          	auipc	s0,0x3d
c00084b4:	48840413          	addi	s0,s0,1160 # c0045938 <sched_class>
c00084b8:	00070513          	mv	a0,a4
c00084bc:	00f72623          	sw	a5,12(a4)
c00084c0:	00d42023          	sw	a3,0(s0)
c00084c4:	0003d297          	auipc	t0,0x3d
c00084c8:	46e2a823          	sw	a4,1136(t0) # c0045934 <rq>
c00084cc:	000600e7          	jalr	a2
c00084d0:	00042783          	lw	a5,0(s0)
c00084d4:	00c12083          	lw	ra,12(sp)
c00084d8:	00812403          	lw	s0,8(sp)
c00084dc:	0007a583          	lw	a1,0(a5)
c00084e0:	00007517          	auipc	a0,0x7
c00084e4:	dcc50513          	addi	a0,a0,-564 # c000f2ac <default_pmm_manager+0xff4>
c00084e8:	01010113          	addi	sp,sp,16
c00084ec:	bf1f706f          	j	c00000dc <cprintf>

c00084f0 <wakeup_proc>:
c00084f0:	00052703          	lw	a4,0(a0)
c00084f4:	ff010113          	addi	sp,sp,-16
c00084f8:	00112623          	sw	ra,12(sp)
c00084fc:	00812423          	sw	s0,8(sp)
c0008500:	00912223          	sw	s1,4(sp)
c0008504:	00300793          	li	a5,3
c0008508:	0af70c63          	beq	a4,a5,c00085c0 <wakeup_proc+0xd0>
c000850c:	00050413          	mv	s0,a0
c0008510:	100027f3          	csrr	a5,sstatus
c0008514:	0027f793          	andi	a5,a5,2
c0008518:	00000493          	li	s1,0
c000851c:	06079a63          	bnez	a5,c0008590 <wakeup_proc+0xa0>
c0008520:	00200793          	li	a5,2
c0008524:	08f70063          	beq	a4,a5,c00085a4 <wakeup_proc+0xb4>
c0008528:	00f42023          	sw	a5,0(s0)
c000852c:	0a042423          	sw	zero,168(s0)
c0008530:	0003d797          	auipc	a5,0x3d
c0008534:	3f47a783          	lw	a5,1012(a5) # c0045924 <current>
c0008538:	02f40663          	beq	s0,a5,c0008564 <wakeup_proc+0x74>
c000853c:	0003d797          	auipc	a5,0x3d
c0008540:	3ec7a783          	lw	a5,1004(a5) # c0045928 <idleproc>
c0008544:	02f40063          	beq	s0,a5,c0008564 <wakeup_proc+0x74>
c0008548:	0003d797          	auipc	a5,0x3d
c000854c:	3f07a783          	lw	a5,1008(a5) # c0045938 <sched_class>
c0008550:	0087a783          	lw	a5,8(a5)
c0008554:	00040593          	mv	a1,s0
c0008558:	0003d517          	auipc	a0,0x3d
c000855c:	3dc52503          	lw	a0,988(a0) # c0045934 <rq>
c0008560:	000780e7          	jalr	a5
c0008564:	00049c63          	bnez	s1,c000857c <wakeup_proc+0x8c>
c0008568:	00c12083          	lw	ra,12(sp)
c000856c:	00812403          	lw	s0,8(sp)
c0008570:	00412483          	lw	s1,4(sp)
c0008574:	01010113          	addi	sp,sp,16
c0008578:	00008067          	ret
c000857c:	00c12083          	lw	ra,12(sp)
c0008580:	00812403          	lw	s0,8(sp)
c0008584:	00412483          	lw	s1,4(sp)
c0008588:	01010113          	addi	sp,sp,16
c000858c:	a90f806f          	j	c000081c <intr_enable>
c0008590:	a94f80ef          	jal	ra,c0000824 <intr_disable>
c0008594:	00042703          	lw	a4,0(s0)
c0008598:	00200793          	li	a5,2
c000859c:	00100493          	li	s1,1
c00085a0:	f8f714e3          	bne	a4,a5,c0008528 <wakeup_proc+0x38>
c00085a4:	00007617          	auipc	a2,0x7
c00085a8:	d5060613          	addi	a2,a2,-688 # c000f2f4 <default_pmm_manager+0x103c>
c00085ac:	04800593          	li	a1,72
c00085b0:	00007517          	auipc	a0,0x7
c00085b4:	d2c50513          	addi	a0,a0,-724 # c000f2dc <default_pmm_manager+0x1024>
c00085b8:	d21f70ef          	jal	ra,c00002d8 <__warn>
c00085bc:	fa9ff06f          	j	c0008564 <wakeup_proc+0x74>
c00085c0:	00007697          	auipc	a3,0x7
c00085c4:	d0068693          	addi	a3,a3,-768 # c000f2c0 <default_pmm_manager+0x1008>
c00085c8:	00005617          	auipc	a2,0x5
c00085cc:	cac60613          	addi	a2,a2,-852 # c000d274 <commands+0x3d8>
c00085d0:	03c00593          	li	a1,60
c00085d4:	00007517          	auipc	a0,0x7
c00085d8:	d0850513          	addi	a0,a0,-760 # c000f2dc <default_pmm_manager+0x1024>
c00085dc:	c75f70ef          	jal	ra,c0000250 <__panic>

c00085e0 <schedule>:
c00085e0:	ff010113          	addi	sp,sp,-16
c00085e4:	00112623          	sw	ra,12(sp)
c00085e8:	00812423          	sw	s0,8(sp)
c00085ec:	00912223          	sw	s1,4(sp)
c00085f0:	100027f3          	csrr	a5,sstatus
c00085f4:	0027f793          	andi	a5,a5,2
c00085f8:	00000493          	li	s1,0
c00085fc:	0a079863          	bnez	a5,c00086ac <schedule+0xcc>
c0008600:	0003d597          	auipc	a1,0x3d
c0008604:	3245a583          	lw	a1,804(a1) # c0045924 <current>
c0008608:	0005a703          	lw	a4,0(a1)
c000860c:	0005a823          	sw	zero,16(a1)
c0008610:	00200793          	li	a5,2
c0008614:	0af70c63          	beq	a4,a5,c00086cc <schedule+0xec>
c0008618:	0003d797          	auipc	a5,0x3d
c000861c:	3207a783          	lw	a5,800(a5) # c0045938 <sched_class>
c0008620:	0107a783          	lw	a5,16(a5)
c0008624:	0003d517          	auipc	a0,0x3d
c0008628:	31052503          	lw	a0,784(a0) # c0045934 <rq>
c000862c:	000780e7          	jalr	a5
c0008630:	00050413          	mv	s0,a0
c0008634:	06050663          	beqz	a0,c00086a0 <schedule+0xc0>
c0008638:	0003d797          	auipc	a5,0x3d
c000863c:	3007a783          	lw	a5,768(a5) # c0045938 <sched_class>
c0008640:	00c7a783          	lw	a5,12(a5)
c0008644:	00050593          	mv	a1,a0
c0008648:	0003d517          	auipc	a0,0x3d
c000864c:	2ec52503          	lw	a0,748(a0) # c0045934 <rq>
c0008650:	000780e7          	jalr	a5
c0008654:	00842783          	lw	a5,8(s0)
c0008658:	0003d717          	auipc	a4,0x3d
c000865c:	2cc72703          	lw	a4,716(a4) # c0045924 <current>
c0008660:	00178793          	addi	a5,a5,1
c0008664:	00f42423          	sw	a5,8(s0)
c0008668:	00e40663          	beq	s0,a4,c0008674 <schedule+0x94>
c000866c:	00040513          	mv	a0,s0
c0008670:	f44fe0ef          	jal	ra,c0006db4 <proc_run>
c0008674:	00049c63          	bnez	s1,c000868c <schedule+0xac>
c0008678:	00c12083          	lw	ra,12(sp)
c000867c:	00812403          	lw	s0,8(sp)
c0008680:	00412483          	lw	s1,4(sp)
c0008684:	01010113          	addi	sp,sp,16
c0008688:	00008067          	ret
c000868c:	00c12083          	lw	ra,12(sp)
c0008690:	00812403          	lw	s0,8(sp)
c0008694:	00412483          	lw	s1,4(sp)
c0008698:	01010113          	addi	sp,sp,16
c000869c:	980f806f          	j	c000081c <intr_enable>
c00086a0:	0003d417          	auipc	s0,0x3d
c00086a4:	28842403          	lw	s0,648(s0) # c0045928 <idleproc>
c00086a8:	fadff06f          	j	c0008654 <schedule+0x74>
c00086ac:	978f80ef          	jal	ra,c0000824 <intr_disable>
c00086b0:	0003d597          	auipc	a1,0x3d
c00086b4:	2745a583          	lw	a1,628(a1) # c0045924 <current>
c00086b8:	0005a703          	lw	a4,0(a1)
c00086bc:	0005a823          	sw	zero,16(a1)
c00086c0:	00200793          	li	a5,2
c00086c4:	00100493          	li	s1,1
c00086c8:	f4f718e3          	bne	a4,a5,c0008618 <schedule+0x38>
c00086cc:	0003d797          	auipc	a5,0x3d
c00086d0:	25c7a783          	lw	a5,604(a5) # c0045928 <idleproc>
c00086d4:	f4f582e3          	beq	a1,a5,c0008618 <schedule+0x38>
c00086d8:	0003d797          	auipc	a5,0x3d
c00086dc:	2607a783          	lw	a5,608(a5) # c0045938 <sched_class>
c00086e0:	0087a783          	lw	a5,8(a5)
c00086e4:	0003d517          	auipc	a0,0x3d
c00086e8:	25052503          	lw	a0,592(a0) # c0045934 <rq>
c00086ec:	000780e7          	jalr	a5
c00086f0:	f29ff06f          	j	c0008618 <schedule+0x38>

c00086f4 <add_timer>:
c00086f4:	ff010113          	addi	sp,sp,-16
c00086f8:	00812423          	sw	s0,8(sp)
c00086fc:	00112623          	sw	ra,12(sp)
c0008700:	00050413          	mv	s0,a0
c0008704:	100027f3          	csrr	a5,sstatus
c0008708:	0027f793          	andi	a5,a5,2
c000870c:	00000513          	li	a0,0
c0008710:	0a079863          	bnez	a5,c00087c0 <add_timer+0xcc>
c0008714:	00042703          	lw	a4,0(s0)
c0008718:	0a070a63          	beqz	a4,c00087cc <add_timer+0xd8>
c000871c:	00442783          	lw	a5,4(s0)
c0008720:	0a078663          	beqz	a5,c00087cc <add_timer+0xd8>
c0008724:	00c42783          	lw	a5,12(s0)
c0008728:	00840593          	addi	a1,s0,8
c000872c:	0cf59063          	bne	a1,a5,c00087ec <add_timer+0xf8>
c0008730:	0003d617          	auipc	a2,0x3d
c0008734:	20c60613          	addi	a2,a2,524 # c004593c <timer_list>
c0008738:	0003d797          	auipc	a5,0x3d
c000873c:	2087a783          	lw	a5,520(a5) # c0045940 <timer_list+0x4>
c0008740:	00c79c63          	bne	a5,a2,c0008758 <add_timer+0x64>
c0008744:	04c0006f          	j	c0008790 <add_timer+0x9c>
c0008748:	0047a783          	lw	a5,4(a5)
c000874c:	40d70733          	sub	a4,a4,a3
c0008750:	00e42023          	sw	a4,0(s0)
c0008754:	02c78e63          	beq	a5,a2,c0008790 <add_timer+0x9c>
c0008758:	ff87a683          	lw	a3,-8(a5)
c000875c:	fed776e3          	bleu	a3,a4,c0008748 <add_timer+0x54>
c0008760:	40e68733          	sub	a4,a3,a4
c0008764:	fee7ac23          	sw	a4,-8(a5)
c0008768:	0007a703          	lw	a4,0(a5)
c000876c:	00b7a023          	sw	a1,0(a5)
c0008770:	00b72223          	sw	a1,4(a4)
c0008774:	00f42623          	sw	a5,12(s0)
c0008778:	00e42423          	sw	a4,8(s0)
c000877c:	02050a63          	beqz	a0,c00087b0 <add_timer+0xbc>
c0008780:	00c12083          	lw	ra,12(sp)
c0008784:	00812403          	lw	s0,8(sp)
c0008788:	01010113          	addi	sp,sp,16
c000878c:	890f806f          	j	c000081c <intr_enable>
c0008790:	0003d797          	auipc	a5,0x3d
c0008794:	1ac78793          	addi	a5,a5,428 # c004593c <timer_list>
c0008798:	0007a703          	lw	a4,0(a5)
c000879c:	00b7a023          	sw	a1,0(a5)
c00087a0:	00b72223          	sw	a1,4(a4)
c00087a4:	00f42623          	sw	a5,12(s0)
c00087a8:	00e42423          	sw	a4,8(s0)
c00087ac:	fc051ae3          	bnez	a0,c0008780 <add_timer+0x8c>
c00087b0:	00c12083          	lw	ra,12(sp)
c00087b4:	00812403          	lw	s0,8(sp)
c00087b8:	01010113          	addi	sp,sp,16
c00087bc:	00008067          	ret
c00087c0:	864f80ef          	jal	ra,c0000824 <intr_disable>
c00087c4:	00100513          	li	a0,1
c00087c8:	f4dff06f          	j	c0008714 <add_timer+0x20>
c00087cc:	00007697          	auipc	a3,0x7
c00087d0:	a3868693          	addi	a3,a3,-1480 # c000f204 <default_pmm_manager+0xf4c>
c00087d4:	00005617          	auipc	a2,0x5
c00087d8:	aa060613          	addi	a2,a2,-1376 # c000d274 <commands+0x3d8>
c00087dc:	06c00593          	li	a1,108
c00087e0:	00007517          	auipc	a0,0x7
c00087e4:	afc50513          	addi	a0,a0,-1284 # c000f2dc <default_pmm_manager+0x1024>
c00087e8:	a69f70ef          	jal	ra,c0000250 <__panic>
c00087ec:	00007697          	auipc	a3,0x7
c00087f0:	a4468693          	addi	a3,a3,-1468 # c000f230 <default_pmm_manager+0xf78>
c00087f4:	00005617          	auipc	a2,0x5
c00087f8:	a8060613          	addi	a2,a2,-1408 # c000d274 <commands+0x3d8>
c00087fc:	06d00593          	li	a1,109
c0008800:	00007517          	auipc	a0,0x7
c0008804:	adc50513          	addi	a0,a0,-1316 # c000f2dc <default_pmm_manager+0x1024>
c0008808:	a49f70ef          	jal	ra,c0000250 <__panic>

c000880c <del_timer>:
c000880c:	ff010113          	addi	sp,sp,-16
c0008810:	00812423          	sw	s0,8(sp)
c0008814:	00112623          	sw	ra,12(sp)
c0008818:	00050413          	mv	s0,a0
c000881c:	100027f3          	csrr	a5,sstatus
c0008820:	0027f793          	andi	a5,a5,2
c0008824:	02079e63          	bnez	a5,c0008860 <del_timer+0x54>
c0008828:	00c52783          	lw	a5,12(a0)
c000882c:	00850713          	addi	a4,a0,8
c0008830:	02f70063          	beq	a4,a5,c0008850 <del_timer+0x44>
c0008834:	00052683          	lw	a3,0(a0)
c0008838:	08069263          	bnez	a3,c00088bc <del_timer+0xb0>
c000883c:	00842683          	lw	a3,8(s0)
c0008840:	00f6a223          	sw	a5,4(a3)
c0008844:	00d7a023          	sw	a3,0(a5)
c0008848:	00e42623          	sw	a4,12(s0)
c000884c:	00e42423          	sw	a4,8(s0)
c0008850:	00c12083          	lw	ra,12(sp)
c0008854:	00812403          	lw	s0,8(sp)
c0008858:	01010113          	addi	sp,sp,16
c000885c:	00008067          	ret
c0008860:	fc5f70ef          	jal	ra,c0000824 <intr_disable>
c0008864:	00c42783          	lw	a5,12(s0)
c0008868:	00840713          	addi	a4,s0,8
c000886c:	04f70063          	beq	a4,a5,c00088ac <del_timer+0xa0>
c0008870:	00042683          	lw	a3,0(s0)
c0008874:	04068e63          	beqz	a3,c00088d0 <del_timer+0xc4>
c0008878:	0003d617          	auipc	a2,0x3d
c000887c:	0c460613          	addi	a2,a2,196 # c004593c <timer_list>
c0008880:	00100513          	li	a0,1
c0008884:	04c78663          	beq	a5,a2,c00088d0 <del_timer+0xc4>
c0008888:	ff87a603          	lw	a2,-8(a5)
c000888c:	00842583          	lw	a1,8(s0)
c0008890:	00d606b3          	add	a3,a2,a3
c0008894:	fed7ac23          	sw	a3,-8(a5)
c0008898:	00f5a223          	sw	a5,4(a1)
c000889c:	00b7a023          	sw	a1,0(a5)
c00088a0:	00e42623          	sw	a4,12(s0)
c00088a4:	00e42423          	sw	a4,8(s0)
c00088a8:	fa0504e3          	beqz	a0,c0008850 <del_timer+0x44>
c00088ac:	00c12083          	lw	ra,12(sp)
c00088b0:	00812403          	lw	s0,8(sp)
c00088b4:	01010113          	addi	sp,sp,16
c00088b8:	f65f706f          	j	c000081c <intr_enable>
c00088bc:	0003d617          	auipc	a2,0x3d
c00088c0:	08060613          	addi	a2,a2,128 # c004593c <timer_list>
c00088c4:	00000513          	li	a0,0
c00088c8:	fcc790e3          	bne	a5,a2,c0008888 <del_timer+0x7c>
c00088cc:	f71ff06f          	j	c000883c <del_timer+0x30>
c00088d0:	00842683          	lw	a3,8(s0)
c00088d4:	00f6a223          	sw	a5,4(a3)
c00088d8:	00d7a023          	sw	a3,0(a5)
c00088dc:	00e42623          	sw	a4,12(s0)
c00088e0:	00e42423          	sw	a4,8(s0)
c00088e4:	fc9ff06f          	j	c00088ac <del_timer+0xa0>

c00088e8 <run_timer_list>:
c00088e8:	fd010113          	addi	sp,sp,-48
c00088ec:	02112623          	sw	ra,44(sp)
c00088f0:	02812423          	sw	s0,40(sp)
c00088f4:	02912223          	sw	s1,36(sp)
c00088f8:	03212023          	sw	s2,32(sp)
c00088fc:	01312e23          	sw	s3,28(sp)
c0008900:	01412c23          	sw	s4,24(sp)
c0008904:	01512a23          	sw	s5,20(sp)
c0008908:	01612823          	sw	s6,16(sp)
c000890c:	01712623          	sw	s7,12(sp)
c0008910:	100027f3          	csrr	a5,sstatus
c0008914:	0027f793          	andi	a5,a5,2
c0008918:	00000b93          	li	s7,0
c000891c:	12079c63          	bnez	a5,c0008a54 <run_timer_list+0x16c>
c0008920:	0003d997          	auipc	s3,0x3d
c0008924:	01c98993          	addi	s3,s3,28 # c004593c <timer_list>
c0008928:	0003d417          	auipc	s0,0x3d
c000892c:	01842403          	lw	s0,24(s0) # c0045940 <timer_list+0x4>
c0008930:	09340863          	beq	s0,s3,c00089c0 <run_timer_list+0xd8>
c0008934:	ff842783          	lw	a5,-8(s0)
c0008938:	ff840913          	addi	s2,s0,-8
c000893c:	14078263          	beqz	a5,c0008a80 <run_timer_list+0x198>
c0008940:	fff78793          	addi	a5,a5,-1
c0008944:	fef42c23          	sw	a5,-8(s0)
c0008948:	06079c63          	bnez	a5,c00089c0 <run_timer_list+0xd8>
c000894c:	00007b17          	auipc	s6,0x7
c0008950:	940b0b13          	addi	s6,s6,-1728 # c000f28c <default_pmm_manager+0xfd4>
c0008954:	0a300a93          	li	s5,163
c0008958:	00007a17          	auipc	s4,0x7
c000895c:	984a0a13          	addi	s4,s4,-1660 # c000f2dc <default_pmm_manager+0x1024>
c0008960:	0280006f          	j	c0008988 <run_timer_list+0xa0>
c0008964:	0e07de63          	bgez	a5,c0008a60 <run_timer_list+0x178>
c0008968:	00048513          	mv	a0,s1
c000896c:	b85ff0ef          	jal	ra,c00084f0 <wakeup_proc>
c0008970:	00090513          	mv	a0,s2
c0008974:	e99ff0ef          	jal	ra,c000880c <del_timer>
c0008978:	05340463          	beq	s0,s3,c00089c0 <run_timer_list+0xd8>
c000897c:	ff842783          	lw	a5,-8(s0)
c0008980:	ff840913          	addi	s2,s0,-8
c0008984:	02079e63          	bnez	a5,c00089c0 <run_timer_list+0xd8>
c0008988:	00492483          	lw	s1,4(s2) # 1004 <_binary_obj___user_faultread_out_size-0x10a4>
c000898c:	00442403          	lw	s0,4(s0)
c0008990:	0a84a783          	lw	a5,168(s1)
c0008994:	fc0798e3          	bnez	a5,c0008964 <run_timer_list+0x7c>
c0008998:	0044a683          	lw	a3,4(s1)
c000899c:	000b0613          	mv	a2,s6
c00089a0:	000a8593          	mv	a1,s5
c00089a4:	000a0513          	mv	a0,s4
c00089a8:	931f70ef          	jal	ra,c00002d8 <__warn>
c00089ac:	00048513          	mv	a0,s1
c00089b0:	b41ff0ef          	jal	ra,c00084f0 <wakeup_proc>
c00089b4:	00090513          	mv	a0,s2
c00089b8:	e55ff0ef          	jal	ra,c000880c <del_timer>
c00089bc:	fd3410e3          	bne	s0,s3,c000897c <run_timer_list+0x94>
c00089c0:	0003d597          	auipc	a1,0x3d
c00089c4:	f645a583          	lw	a1,-156(a1) # c0045924 <current>
c00089c8:	0003d797          	auipc	a5,0x3d
c00089cc:	f607a783          	lw	a5,-160(a5) # c0045928 <idleproc>
c00089d0:	06f58c63          	beq	a1,a5,c0008a48 <run_timer_list+0x160>
c00089d4:	0003d797          	auipc	a5,0x3d
c00089d8:	f647a783          	lw	a5,-156(a5) # c0045938 <sched_class>
c00089dc:	0147a783          	lw	a5,20(a5)
c00089e0:	0003d517          	auipc	a0,0x3d
c00089e4:	f5452503          	lw	a0,-172(a0) # c0045934 <rq>
c00089e8:	000780e7          	jalr	a5
c00089ec:	020b9863          	bnez	s7,c0008a1c <run_timer_list+0x134>
c00089f0:	02c12083          	lw	ra,44(sp)
c00089f4:	02812403          	lw	s0,40(sp)
c00089f8:	02412483          	lw	s1,36(sp)
c00089fc:	02012903          	lw	s2,32(sp)
c0008a00:	01c12983          	lw	s3,28(sp)
c0008a04:	01812a03          	lw	s4,24(sp)
c0008a08:	01412a83          	lw	s5,20(sp)
c0008a0c:	01012b03          	lw	s6,16(sp)
c0008a10:	00c12b83          	lw	s7,12(sp)
c0008a14:	03010113          	addi	sp,sp,48
c0008a18:	00008067          	ret
c0008a1c:	02c12083          	lw	ra,44(sp)
c0008a20:	02812403          	lw	s0,40(sp)
c0008a24:	02412483          	lw	s1,36(sp)
c0008a28:	02012903          	lw	s2,32(sp)
c0008a2c:	01c12983          	lw	s3,28(sp)
c0008a30:	01812a03          	lw	s4,24(sp)
c0008a34:	01412a83          	lw	s5,20(sp)
c0008a38:	01012b03          	lw	s6,16(sp)
c0008a3c:	00c12b83          	lw	s7,12(sp)
c0008a40:	03010113          	addi	sp,sp,48
c0008a44:	dd9f706f          	j	c000081c <intr_enable>
c0008a48:	00100793          	li	a5,1
c0008a4c:	00f5a823          	sw	a5,16(a1)
c0008a50:	f9dff06f          	j	c00089ec <run_timer_list+0x104>
c0008a54:	dd1f70ef          	jal	ra,c0000824 <intr_disable>
c0008a58:	00100b93          	li	s7,1
c0008a5c:	ec5ff06f          	j	c0008920 <run_timer_list+0x38>
c0008a60:	00007697          	auipc	a3,0x7
c0008a64:	80868693          	addi	a3,a3,-2040 # c000f268 <default_pmm_manager+0xfb0>
c0008a68:	00005617          	auipc	a2,0x5
c0008a6c:	80c60613          	addi	a2,a2,-2036 # c000d274 <commands+0x3d8>
c0008a70:	0a000593          	li	a1,160
c0008a74:	00007517          	auipc	a0,0x7
c0008a78:	86850513          	addi	a0,a0,-1944 # c000f2dc <default_pmm_manager+0x1024>
c0008a7c:	fd4f70ef          	jal	ra,c0000250 <__panic>
c0008a80:	00006697          	auipc	a3,0x6
c0008a84:	7d468693          	addi	a3,a3,2004 # c000f254 <default_pmm_manager+0xf9c>
c0008a88:	00004617          	auipc	a2,0x4
c0008a8c:	7ec60613          	addi	a2,a2,2028 # c000d274 <commands+0x3d8>
c0008a90:	09a00593          	li	a1,154
c0008a94:	00007517          	auipc	a0,0x7
c0008a98:	84850513          	addi	a0,a0,-1976 # c000f2dc <default_pmm_manager+0x1024>
c0008a9c:	fb4f70ef          	jal	ra,c0000250 <__panic>

c0008aa0 <proc_stride_comp_f>:
c0008aa0:	00c52503          	lw	a0,12(a0)
c0008aa4:	00c5a783          	lw	a5,12(a1)
c0008aa8:	40f50533          	sub	a0,a0,a5
c0008aac:	00a05663          	blez	a0,c0008ab8 <proc_stride_comp_f+0x18>
c0008ab0:	00100513          	li	a0,1
c0008ab4:	00008067          	ret
c0008ab8:	00a03533          	snez	a0,a0
c0008abc:	40a00533          	neg	a0,a0
c0008ac0:	00008067          	ret

c0008ac4 <stride_init>:
c0008ac4:	00a52223          	sw	a0,4(a0)
c0008ac8:	00a52023          	sw	a0,0(a0)
c0008acc:	00052823          	sw	zero,16(a0)
c0008ad0:	00052423          	sw	zero,8(a0)
c0008ad4:	00008067          	ret

c0008ad8 <stride_pick_next>:
c0008ad8:	01052783          	lw	a5,16(a0)
c0008adc:	02078463          	beqz	a5,c0008b04 <stride_pick_next+0x2c>
c0008ae0:	0107a683          	lw	a3,16(a5)
c0008ae4:	f3878513          	addi	a0,a5,-200
c0008ae8:	00c7a603          	lw	a2,12(a5)
c0008aec:	40000737          	lui	a4,0x40000
c0008af0:	00068463          	beqz	a3,c0008af8 <stride_pick_next+0x20>
c0008af4:	02d75733          	divu	a4,a4,a3
c0008af8:	00c70733          	add	a4,a4,a2
c0008afc:	00e7a623          	sw	a4,12(a5)
c0008b00:	00008067          	ret
c0008b04:	00000513          	li	a0,0
c0008b08:	00008067          	ret

c0008b0c <stride_proc_tick>:
c0008b0c:	0c45a783          	lw	a5,196(a1)
c0008b10:	00f05663          	blez	a5,c0008b1c <stride_proc_tick+0x10>
c0008b14:	fff78793          	addi	a5,a5,-1
c0008b18:	0cf5a223          	sw	a5,196(a1)
c0008b1c:	00079663          	bnez	a5,c0008b28 <stride_proc_tick+0x1c>
c0008b20:	00100793          	li	a5,1
c0008b24:	00f5a823          	sw	a5,16(a1)
c0008b28:	00008067          	ret

c0008b2c <skew_heap_merge.constprop.3>:
c0008b2c:	fd010113          	addi	sp,sp,-48
c0008b30:	02812423          	sw	s0,40(sp)
c0008b34:	02112623          	sw	ra,44(sp)
c0008b38:	02912223          	sw	s1,36(sp)
c0008b3c:	03212023          	sw	s2,32(sp)
c0008b40:	01312e23          	sw	s3,28(sp)
c0008b44:	01412c23          	sw	s4,24(sp)
c0008b48:	01512a23          	sw	s5,20(sp)
c0008b4c:	01612823          	sw	s6,16(sp)
c0008b50:	01712623          	sw	s7,12(sp)
c0008b54:	01812423          	sw	s8,8(sp)
c0008b58:	00058413          	mv	s0,a1
c0008b5c:	1a050063          	beqz	a0,c0008cfc <skew_heap_merge.constprop.3+0x1d0>
c0008b60:	00050493          	mv	s1,a0
c0008b64:	00050793          	mv	a5,a0
c0008b68:	0a058863          	beqz	a1,c0008c18 <skew_heap_merge.constprop.3+0xec>
c0008b6c:	f35ff0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c0008b70:	fff00993          	li	s3,-1
c0008b74:	00050913          	mv	s2,a0
c0008b78:	13350a63          	beq	a0,s3,c0008cac <skew_heap_merge.constprop.3+0x180>
c0008b7c:	00842903          	lw	s2,8(s0)
c0008b80:	00442a83          	lw	s5,4(s0)
c0008b84:	0e090463          	beqz	s2,c0008c6c <skew_heap_merge.constprop.3+0x140>
c0008b88:	00090593          	mv	a1,s2
c0008b8c:	00048513          	mv	a0,s1
c0008b90:	f11ff0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c0008b94:	0b350c63          	beq	a0,s3,c0008c4c <skew_heap_merge.constprop.3+0x120>
c0008b98:	00892a03          	lw	s4,8(s2)
c0008b9c:	00492b83          	lw	s7,4(s2)
c0008ba0:	100a0263          	beqz	s4,c0008ca4 <skew_heap_merge.constprop.3+0x178>
c0008ba4:	000a0593          	mv	a1,s4
c0008ba8:	00048513          	mv	a0,s1
c0008bac:	ef5ff0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c0008bb0:	0d350a63          	beq	a0,s3,c0008c84 <skew_heap_merge.constprop.3+0x158>
c0008bb4:	008a2b03          	lw	s6,8(s4)
c0008bb8:	004a2c03          	lw	s8,4(s4)
c0008bbc:	160b0463          	beqz	s6,c0008d24 <skew_heap_merge.constprop.3+0x1f8>
c0008bc0:	000b0593          	mv	a1,s6
c0008bc4:	00048513          	mv	a0,s1
c0008bc8:	ed9ff0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c0008bcc:	13350c63          	beq	a0,s3,c0008d04 <skew_heap_merge.constprop.3+0x1d8>
c0008bd0:	008b2583          	lw	a1,8(s6)
c0008bd4:	004b2983          	lw	s3,4(s6)
c0008bd8:	00048513          	mv	a0,s1
c0008bdc:	f51ff0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c0008be0:	00ab2223          	sw	a0,4(s6)
c0008be4:	013b2423          	sw	s3,8(s6)
c0008be8:	00050463          	beqz	a0,c0008bf0 <skew_heap_merge.constprop.3+0xc4>
c0008bec:	01652023          	sw	s6,0(a0)
c0008bf0:	016a2223          	sw	s6,4(s4)
c0008bf4:	018a2423          	sw	s8,8(s4)
c0008bf8:	014b2023          	sw	s4,0(s6)
c0008bfc:	01492223          	sw	s4,4(s2)
c0008c00:	01792423          	sw	s7,8(s2)
c0008c04:	012a2023          	sw	s2,0(s4)
c0008c08:	01242223          	sw	s2,4(s0)
c0008c0c:	01542423          	sw	s5,8(s0)
c0008c10:	00892023          	sw	s0,0(s2)
c0008c14:	00040793          	mv	a5,s0
c0008c18:	02c12083          	lw	ra,44(sp)
c0008c1c:	00078513          	mv	a0,a5
c0008c20:	02812403          	lw	s0,40(sp)
c0008c24:	02412483          	lw	s1,36(sp)
c0008c28:	02012903          	lw	s2,32(sp)
c0008c2c:	01c12983          	lw	s3,28(sp)
c0008c30:	01812a03          	lw	s4,24(sp)
c0008c34:	01412a83          	lw	s5,20(sp)
c0008c38:	01012b03          	lw	s6,16(sp)
c0008c3c:	00c12b83          	lw	s7,12(sp)
c0008c40:	00812c03          	lw	s8,8(sp)
c0008c44:	03010113          	addi	sp,sp,48
c0008c48:	00008067          	ret
c0008c4c:	0084a503          	lw	a0,8(s1)
c0008c50:	0044a983          	lw	s3,4(s1)
c0008c54:	00090593          	mv	a1,s2
c0008c58:	ed5ff0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c0008c5c:	00a4a223          	sw	a0,4(s1)
c0008c60:	0134a423          	sw	s3,8(s1)
c0008c64:	00050463          	beqz	a0,c0008c6c <skew_heap_merge.constprop.3+0x140>
c0008c68:	00952023          	sw	s1,0(a0)
c0008c6c:	00048913          	mv	s2,s1
c0008c70:	01242223          	sw	s2,4(s0)
c0008c74:	01542423          	sw	s5,8(s0)
c0008c78:	00892023          	sw	s0,0(s2)
c0008c7c:	00040793          	mv	a5,s0
c0008c80:	f99ff06f          	j	c0008c18 <skew_heap_merge.constprop.3+0xec>
c0008c84:	0084a503          	lw	a0,8(s1)
c0008c88:	0044a983          	lw	s3,4(s1)
c0008c8c:	000a0593          	mv	a1,s4
c0008c90:	e9dff0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c0008c94:	00a4a223          	sw	a0,4(s1)
c0008c98:	0134a423          	sw	s3,8(s1)
c0008c9c:	00050463          	beqz	a0,c0008ca4 <skew_heap_merge.constprop.3+0x178>
c0008ca0:	00952023          	sw	s1,0(a0)
c0008ca4:	00048a13          	mv	s4,s1
c0008ca8:	f55ff06f          	j	c0008bfc <skew_heap_merge.constprop.3+0xd0>
c0008cac:	0084a983          	lw	s3,8(s1)
c0008cb0:	0044aa03          	lw	s4,4(s1)
c0008cb4:	02098a63          	beqz	s3,c0008ce8 <skew_heap_merge.constprop.3+0x1bc>
c0008cb8:	00040593          	mv	a1,s0
c0008cbc:	00098513          	mv	a0,s3
c0008cc0:	de1ff0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c0008cc4:	07250463          	beq	a0,s2,c0008d2c <skew_heap_merge.constprop.3+0x200>
c0008cc8:	00842583          	lw	a1,8(s0)
c0008ccc:	00442903          	lw	s2,4(s0)
c0008cd0:	00098513          	mv	a0,s3
c0008cd4:	e59ff0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c0008cd8:	00a42223          	sw	a0,4(s0)
c0008cdc:	01242423          	sw	s2,8(s0)
c0008ce0:	00050463          	beqz	a0,c0008ce8 <skew_heap_merge.constprop.3+0x1bc>
c0008ce4:	00852023          	sw	s0,0(a0)
c0008ce8:	0084a223          	sw	s0,4(s1)
c0008cec:	0144a423          	sw	s4,8(s1)
c0008cf0:	00942023          	sw	s1,0(s0)
c0008cf4:	00048793          	mv	a5,s1
c0008cf8:	f21ff06f          	j	c0008c18 <skew_heap_merge.constprop.3+0xec>
c0008cfc:	00058793          	mv	a5,a1
c0008d00:	f19ff06f          	j	c0008c18 <skew_heap_merge.constprop.3+0xec>
c0008d04:	0084a503          	lw	a0,8(s1)
c0008d08:	0044a983          	lw	s3,4(s1)
c0008d0c:	000b0593          	mv	a1,s6
c0008d10:	e1dff0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c0008d14:	00a4a223          	sw	a0,4(s1)
c0008d18:	0134a423          	sw	s3,8(s1)
c0008d1c:	00050463          	beqz	a0,c0008d24 <skew_heap_merge.constprop.3+0x1f8>
c0008d20:	00952023          	sw	s1,0(a0)
c0008d24:	00048b13          	mv	s6,s1
c0008d28:	ec9ff06f          	j	c0008bf0 <skew_heap_merge.constprop.3+0xc4>
c0008d2c:	0089a503          	lw	a0,8(s3)
c0008d30:	0049a903          	lw	s2,4(s3)
c0008d34:	00040593          	mv	a1,s0
c0008d38:	df5ff0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c0008d3c:	00a9a223          	sw	a0,4(s3)
c0008d40:	0129a423          	sw	s2,8(s3)
c0008d44:	00050863          	beqz	a0,c0008d54 <skew_heap_merge.constprop.3+0x228>
c0008d48:	01352023          	sw	s3,0(a0)
c0008d4c:	00098413          	mv	s0,s3
c0008d50:	f99ff06f          	j	c0008ce8 <skew_heap_merge.constprop.3+0x1bc>
c0008d54:	00098413          	mv	s0,s3
c0008d58:	f91ff06f          	j	c0008ce8 <skew_heap_merge.constprop.3+0x1bc>

c0008d5c <stride_enqueue>:
c0008d5c:	fb010113          	addi	sp,sp,-80
c0008d60:	03312e23          	sw	s3,60(sp)
c0008d64:	01052983          	lw	s3,16(a0)
c0008d68:	04812423          	sw	s0,72(sp)
c0008d6c:	04912223          	sw	s1,68(sp)
c0008d70:	05212023          	sw	s2,64(sp)
c0008d74:	04112623          	sw	ra,76(sp)
c0008d78:	03412c23          	sw	s4,56(sp)
c0008d7c:	03512a23          	sw	s5,52(sp)
c0008d80:	03612823          	sw	s6,48(sp)
c0008d84:	03712623          	sw	s7,44(sp)
c0008d88:	03812423          	sw	s8,40(sp)
c0008d8c:	03912223          	sw	s9,36(sp)
c0008d90:	03a12023          	sw	s10,32(sp)
c0008d94:	01b12e23          	sw	s11,28(sp)
c0008d98:	0c05a423          	sw	zero,200(a1)
c0008d9c:	0c05a823          	sw	zero,208(a1)
c0008da0:	0c05a623          	sw	zero,204(a1)
c0008da4:	00050493          	mv	s1,a0
c0008da8:	00058413          	mv	s0,a1
c0008dac:	0c858913          	addi	s2,a1,200
c0008db0:	02098463          	beqz	s3,c0008dd8 <stride_enqueue+0x7c>
c0008db4:	0c090263          	beqz	s2,c0008e78 <stride_enqueue+0x11c>
c0008db8:	00090593          	mv	a1,s2
c0008dbc:	00098513          	mv	a0,s3
c0008dc0:	ce1ff0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c0008dc4:	fff00793          	li	a5,-1
c0008dc8:	00050a13          	mv	s4,a0
c0008dcc:	06f50863          	beq	a0,a5,c0008e3c <stride_enqueue+0xe0>
c0008dd0:	0d342623          	sw	s3,204(s0)
c0008dd4:	0129a023          	sw	s2,0(s3)
c0008dd8:	0c442783          	lw	a5,196(s0)
c0008ddc:	0124a823          	sw	s2,16(s1)
c0008de0:	00c4a703          	lw	a4,12(s1)
c0008de4:	00078463          	beqz	a5,c0008dec <stride_enqueue+0x90>
c0008de8:	00f75463          	ble	a5,a4,c0008df0 <stride_enqueue+0x94>
c0008dec:	0ce42223          	sw	a4,196(s0)
c0008df0:	0084a783          	lw	a5,8(s1)
c0008df4:	04c12083          	lw	ra,76(sp)
c0008df8:	0a942c23          	sw	s1,184(s0)
c0008dfc:	00178793          	addi	a5,a5,1
c0008e00:	00f4a423          	sw	a5,8(s1)
c0008e04:	04812403          	lw	s0,72(sp)
c0008e08:	04412483          	lw	s1,68(sp)
c0008e0c:	04012903          	lw	s2,64(sp)
c0008e10:	03c12983          	lw	s3,60(sp)
c0008e14:	03812a03          	lw	s4,56(sp)
c0008e18:	03412a83          	lw	s5,52(sp)
c0008e1c:	03012b03          	lw	s6,48(sp)
c0008e20:	02c12b83          	lw	s7,44(sp)
c0008e24:	02812c03          	lw	s8,40(sp)
c0008e28:	02412c83          	lw	s9,36(sp)
c0008e2c:	02012d03          	lw	s10,32(sp)
c0008e30:	01c12d83          	lw	s11,28(sp)
c0008e34:	05010113          	addi	sp,sp,80
c0008e38:	00008067          	ret
c0008e3c:	0089aa83          	lw	s5,8(s3)
c0008e40:	0049ab03          	lw	s6,4(s3)
c0008e44:	020a8063          	beqz	s5,c0008e64 <stride_enqueue+0x108>
c0008e48:	00090593          	mv	a1,s2
c0008e4c:	000a8513          	mv	a0,s5
c0008e50:	c51ff0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c0008e54:	00050b93          	mv	s7,a0
c0008e58:	03450463          	beq	a0,s4,c0008e80 <stride_enqueue+0x124>
c0008e5c:	0d542623          	sw	s5,204(s0)
c0008e60:	012aa023          	sw	s2,0(s5) # 1000 <_binary_obj___user_faultread_out_size-0x10a8>
c0008e64:	0129a223          	sw	s2,4(s3)
c0008e68:	0169a423          	sw	s6,8(s3)
c0008e6c:	01392023          	sw	s3,0(s2)
c0008e70:	00098913          	mv	s2,s3
c0008e74:	f65ff06f          	j	c0008dd8 <stride_enqueue+0x7c>
c0008e78:	00098913          	mv	s2,s3
c0008e7c:	f5dff06f          	j	c0008dd8 <stride_enqueue+0x7c>
c0008e80:	008aaa03          	lw	s4,8(s5)
c0008e84:	004aac03          	lw	s8,4(s5)
c0008e88:	020a0063          	beqz	s4,c0008ea8 <stride_enqueue+0x14c>
c0008e8c:	00090593          	mv	a1,s2
c0008e90:	000a0513          	mv	a0,s4
c0008e94:	c0dff0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c0008e98:	00050c93          	mv	s9,a0
c0008e9c:	03750063          	beq	a0,s7,c0008ebc <stride_enqueue+0x160>
c0008ea0:	0d442623          	sw	s4,204(s0)
c0008ea4:	012a2023          	sw	s2,0(s4)
c0008ea8:	012aa223          	sw	s2,4(s5)
c0008eac:	018aa423          	sw	s8,8(s5)
c0008eb0:	01592023          	sw	s5,0(s2)
c0008eb4:	000a8913          	mv	s2,s5
c0008eb8:	fadff06f          	j	c0008e64 <stride_enqueue+0x108>
c0008ebc:	008a2b83          	lw	s7,8(s4)
c0008ec0:	004a2d03          	lw	s10,4(s4)
c0008ec4:	000b8e63          	beqz	s7,c0008ee0 <stride_enqueue+0x184>
c0008ec8:	00090593          	mv	a1,s2
c0008ecc:	000b8513          	mv	a0,s7
c0008ed0:	bd1ff0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c0008ed4:	03950063          	beq	a0,s9,c0008ef4 <stride_enqueue+0x198>
c0008ed8:	0d742623          	sw	s7,204(s0)
c0008edc:	012ba023          	sw	s2,0(s7)
c0008ee0:	012a2223          	sw	s2,4(s4)
c0008ee4:	01aa2423          	sw	s10,8(s4)
c0008ee8:	01492023          	sw	s4,0(s2)
c0008eec:	000a0913          	mv	s2,s4
c0008ef0:	fb9ff06f          	j	c0008ea8 <stride_enqueue+0x14c>
c0008ef4:	008bac83          	lw	s9,8(s7)
c0008ef8:	004bad83          	lw	s11,4(s7)
c0008efc:	020c8a63          	beqz	s9,c0008f30 <stride_enqueue+0x1d4>
c0008f00:	00090593          	mv	a1,s2
c0008f04:	000c8513          	mv	a0,s9
c0008f08:	b99ff0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c0008f0c:	fff00793          	li	a5,-1
c0008f10:	02f50a63          	beq	a0,a5,c0008f44 <stride_enqueue+0x1e8>
c0008f14:	00000593          	li	a1,0
c0008f18:	000c8513          	mv	a0,s9
c0008f1c:	c11ff0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c0008f20:	0ca42623          	sw	a0,204(s0)
c0008f24:	0c042823          	sw	zero,208(s0)
c0008f28:	00050463          	beqz	a0,c0008f30 <stride_enqueue+0x1d4>
c0008f2c:	01252023          	sw	s2,0(a0)
c0008f30:	012ba223          	sw	s2,4(s7)
c0008f34:	01bba423          	sw	s11,8(s7)
c0008f38:	01792023          	sw	s7,0(s2)
c0008f3c:	000b8913          	mv	s2,s7
c0008f40:	fa1ff06f          	j	c0008ee0 <stride_enqueue+0x184>
c0008f44:	004ca783          	lw	a5,4(s9)
c0008f48:	008ca503          	lw	a0,8(s9)
c0008f4c:	00090593          	mv	a1,s2
c0008f50:	00f12623          	sw	a5,12(sp)
c0008f54:	bd9ff0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c0008f58:	00c12783          	lw	a5,12(sp)
c0008f5c:	00aca223          	sw	a0,4(s9)
c0008f60:	00fca423          	sw	a5,8(s9)
c0008f64:	00050863          	beqz	a0,c0008f74 <stride_enqueue+0x218>
c0008f68:	01952023          	sw	s9,0(a0)
c0008f6c:	000c8913          	mv	s2,s9
c0008f70:	fc1ff06f          	j	c0008f30 <stride_enqueue+0x1d4>
c0008f74:	000c8913          	mv	s2,s9
c0008f78:	fb9ff06f          	j	c0008f30 <stride_enqueue+0x1d4>

c0008f7c <stride_dequeue>:
c0008f7c:	f8010113          	addi	sp,sp,-128
c0008f80:	05712e23          	sw	s7,92(sp)
c0008f84:	0b85ab83          	lw	s7,184(a1)
c0008f88:	06112e23          	sw	ra,124(sp)
c0008f8c:	06812c23          	sw	s0,120(sp)
c0008f90:	06912a23          	sw	s1,116(sp)
c0008f94:	07212823          	sw	s2,112(sp)
c0008f98:	07312623          	sw	s3,108(sp)
c0008f9c:	07412423          	sw	s4,104(sp)
c0008fa0:	07512223          	sw	s5,100(sp)
c0008fa4:	07612023          	sw	s6,96(sp)
c0008fa8:	05812c23          	sw	s8,88(sp)
c0008fac:	05912a23          	sw	s9,84(sp)
c0008fb0:	05a12823          	sw	s10,80(sp)
c0008fb4:	05b12623          	sw	s11,76(sp)
c0008fb8:	00ab8463          	beq	s7,a0,c0008fc0 <stride_dequeue+0x44>
c0008fbc:	7f40206f          	j	c000b7b0 <stride_dequeue+0x2834>
c0008fc0:	008ba403          	lw	s0,8(s7)
c0008fc4:	00040c13          	mv	s8,s0
c0008fc8:	00041463          	bnez	s0,c0008fd0 <stride_dequeue+0x54>
c0008fcc:	7e40206f          	j	c000b7b0 <stride_dequeue+0x2834>
c0008fd0:	0cc5ac83          	lw	s9,204(a1)
c0008fd4:	010ba483          	lw	s1,16(s7)
c0008fd8:	0c858913          	addi	s2,a1,200
c0008fdc:	0c85aa03          	lw	s4,200(a1)
c0008fe0:	0d05a983          	lw	s3,208(a1)
c0008fe4:	6a0c8a63          	beqz	s9,c0009698 <stride_dequeue+0x71c>
c0008fe8:	26098a63          	beqz	s3,c000925c <stride_dequeue+0x2e0>
c0008fec:	00098593          	mv	a1,s3
c0008ff0:	000c8513          	mv	a0,s9
c0008ff4:	aadff0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c0008ff8:	fff00a93          	li	s5,-1
c0008ffc:	00050b13          	mv	s6,a0
c0009000:	47550063          	beq	a0,s5,c0009460 <stride_dequeue+0x4e4>
c0009004:	0049a783          	lw	a5,4(s3)
c0009008:	0089ad03          	lw	s10,8(s3)
c000900c:	00f12423          	sw	a5,8(sp)
c0009010:	220d0c63          	beqz	s10,c0009248 <stride_dequeue+0x2cc>
c0009014:	000d0593          	mv	a1,s10
c0009018:	000c8513          	mv	a0,s9
c000901c:	a85ff0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c0009020:	00050b13          	mv	s6,a0
c0009024:	69550263          	beq	a0,s5,c00096a8 <stride_dequeue+0x72c>
c0009028:	004d2783          	lw	a5,4(s10)
c000902c:	008d2b03          	lw	s6,8(s10)
c0009030:	00f12623          	sw	a5,12(sp)
c0009034:	200b0063          	beqz	s6,c0009234 <stride_dequeue+0x2b8>
c0009038:	000b0593          	mv	a1,s6
c000903c:	000c8513          	mv	a0,s9
c0009040:	a61ff0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c0009044:	27550a63          	beq	a0,s5,c00092b8 <stride_dequeue+0x33c>
c0009048:	004b2783          	lw	a5,4(s6)
c000904c:	008b2a83          	lw	s5,8(s6)
c0009050:	00f12823          	sw	a5,16(sp)
c0009054:	1c0a8663          	beqz	s5,c0009220 <stride_dequeue+0x2a4>
c0009058:	000a8593          	mv	a1,s5
c000905c:	000c8513          	mv	a0,s9
c0009060:	a41ff0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c0009064:	fff00793          	li	a5,-1
c0009068:	00050d93          	mv	s11,a0
c000906c:	32f50ae3          	beq	a0,a5,c0009ba0 <stride_dequeue+0xc24>
c0009070:	00f12c23          	sw	a5,24(sp)
c0009074:	004aa783          	lw	a5,4(s5)
c0009078:	008aad83          	lw	s11,8(s5)
c000907c:	00f12a23          	sw	a5,20(sp)
c0009080:	180d8663          	beqz	s11,c000920c <stride_dequeue+0x290>
c0009084:	000d8593          	mv	a1,s11
c0009088:	000c8513          	mv	a0,s9
c000908c:	a15ff0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c0009090:	01812783          	lw	a5,24(sp)
c0009094:	00f500e3          	beq	a0,a5,c0009894 <stride_dequeue+0x918>
c0009098:	00f12e23          	sw	a5,28(sp)
c000909c:	004da783          	lw	a5,4(s11)
c00090a0:	008dae03          	lw	t3,8(s11)
c00090a4:	00f12c23          	sw	a5,24(sp)
c00090a8:	140e0863          	beqz	t3,c00091f8 <stride_dequeue+0x27c>
c00090ac:	000e0593          	mv	a1,t3
c00090b0:	000c8513          	mv	a0,s9
c00090b4:	03c12023          	sw	t3,32(sp)
c00090b8:	9e9ff0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c00090bc:	01c12783          	lw	a5,28(sp)
c00090c0:	02012e03          	lw	t3,32(sp)
c00090c4:	00f51463          	bne	a0,a5,c00090cc <stride_dequeue+0x150>
c00090c8:	4780106f          	j	c000a540 <stride_dequeue+0x15c4>
c00090cc:	02f12023          	sw	a5,32(sp)
c00090d0:	004e2783          	lw	a5,4(t3)
c00090d4:	008e2403          	lw	s0,8(t3)
c00090d8:	00f12e23          	sw	a5,28(sp)
c00090dc:	10040463          	beqz	s0,c00091e4 <stride_dequeue+0x268>
c00090e0:	00040593          	mv	a1,s0
c00090e4:	000c8513          	mv	a0,s9
c00090e8:	03c12223          	sw	t3,36(sp)
c00090ec:	9b5ff0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c00090f0:	02012783          	lw	a5,32(sp)
c00090f4:	02412e03          	lw	t3,36(sp)
c00090f8:	00f51463          	bne	a0,a5,c0009100 <stride_dequeue+0x184>
c00090fc:	3ad0106f          	j	c000aca8 <stride_dequeue+0x1d2c>
c0009100:	02f12223          	sw	a5,36(sp)
c0009104:	00442783          	lw	a5,4(s0)
c0009108:	00842f03          	lw	t5,8(s0)
c000910c:	02f12023          	sw	a5,32(sp)
c0009110:	0c0f0063          	beqz	t5,c00091d0 <stride_dequeue+0x254>
c0009114:	000f0593          	mv	a1,t5
c0009118:	000c8513          	mv	a0,s9
c000911c:	03c12623          	sw	t3,44(sp)
c0009120:	03e12423          	sw	t5,40(sp)
c0009124:	97dff0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c0009128:	02412783          	lw	a5,36(sp)
c000912c:	02812f03          	lw	t5,40(sp)
c0009130:	02c12e03          	lw	t3,44(sp)
c0009134:	00f51463          	bne	a0,a5,c000913c <stride_dequeue+0x1c0>
c0009138:	16c0206f          	j	c000b2a4 <stride_dequeue+0x2328>
c000913c:	004f2783          	lw	a5,4(t5)
c0009140:	008f2f83          	lw	t6,8(t5)
c0009144:	02f12223          	sw	a5,36(sp)
c0009148:	060f8a63          	beqz	t6,c00091bc <stride_dequeue+0x240>
c000914c:	000f8593          	mv	a1,t6
c0009150:	000c8513          	mv	a0,s9
c0009154:	03e12823          	sw	t5,48(sp)
c0009158:	03c12623          	sw	t3,44(sp)
c000915c:	03f12423          	sw	t6,40(sp)
c0009160:	941ff0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c0009164:	fff00593          	li	a1,-1
c0009168:	02812f83          	lw	t6,40(sp)
c000916c:	02c12e03          	lw	t3,44(sp)
c0009170:	03012f03          	lw	t5,48(sp)
c0009174:	00b51463          	bne	a0,a1,c000917c <stride_dequeue+0x200>
c0009178:	5080206f          	j	c000b680 <stride_dequeue+0x2704>
c000917c:	008fa583          	lw	a1,8(t6)
c0009180:	000c8513          	mv	a0,s9
c0009184:	004fac03          	lw	s8,4(t6)
c0009188:	03e12823          	sw	t5,48(sp)
c000918c:	03c12623          	sw	t3,44(sp)
c0009190:	03f12423          	sw	t6,40(sp)
c0009194:	999ff0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c0009198:	02812f83          	lw	t6,40(sp)
c000919c:	02c12e03          	lw	t3,44(sp)
c00091a0:	03012f03          	lw	t5,48(sp)
c00091a4:	018fa423          	sw	s8,8(t6)
c00091a8:	00afa223          	sw	a0,4(t6)
c00091ac:	008bac03          	lw	s8,8(s7)
c00091b0:	00050463          	beqz	a0,c00091b8 <stride_dequeue+0x23c>
c00091b4:	01f52023          	sw	t6,0(a0)
c00091b8:	000f8c93          	mv	s9,t6
c00091bc:	02412783          	lw	a5,36(sp)
c00091c0:	019f2223          	sw	s9,4(t5)
c00091c4:	00ff2423          	sw	a5,8(t5)
c00091c8:	01eca023          	sw	t5,0(s9)
c00091cc:	000f0c93          	mv	s9,t5
c00091d0:	02012783          	lw	a5,32(sp)
c00091d4:	01942223          	sw	s9,4(s0)
c00091d8:	00f42423          	sw	a5,8(s0)
c00091dc:	008ca023          	sw	s0,0(s9)
c00091e0:	00040c93          	mv	s9,s0
c00091e4:	01c12783          	lw	a5,28(sp)
c00091e8:	019e2223          	sw	s9,4(t3)
c00091ec:	00fe2423          	sw	a5,8(t3)
c00091f0:	01cca023          	sw	t3,0(s9)
c00091f4:	000e0c93          	mv	s9,t3
c00091f8:	01812783          	lw	a5,24(sp)
c00091fc:	019da223          	sw	s9,4(s11)
c0009200:	00fda423          	sw	a5,8(s11)
c0009204:	01bca023          	sw	s11,0(s9)
c0009208:	000d8c93          	mv	s9,s11
c000920c:	01412783          	lw	a5,20(sp)
c0009210:	019aa223          	sw	s9,4(s5)
c0009214:	00faa423          	sw	a5,8(s5)
c0009218:	015ca023          	sw	s5,0(s9)
c000921c:	000a8c93          	mv	s9,s5
c0009220:	01012783          	lw	a5,16(sp)
c0009224:	019b2223          	sw	s9,4(s6)
c0009228:	00fb2423          	sw	a5,8(s6)
c000922c:	016ca023          	sw	s6,0(s9)
c0009230:	000b0c93          	mv	s9,s6
c0009234:	00c12783          	lw	a5,12(sp)
c0009238:	019d2223          	sw	s9,4(s10)
c000923c:	00fd2423          	sw	a5,8(s10)
c0009240:	01aca023          	sw	s10,0(s9)
c0009244:	000d0c93          	mv	s9,s10
c0009248:	00812783          	lw	a5,8(sp)
c000924c:	0199a223          	sw	s9,4(s3)
c0009250:	00f9a423          	sw	a5,8(s3)
c0009254:	013ca023          	sw	s3,0(s9)
c0009258:	00098c93          	mv	s9,s3
c000925c:	014ca023          	sw	s4,0(s9)
c0009260:	420a0863          	beqz	s4,c0009690 <stride_dequeue+0x714>
c0009264:	004a2703          	lw	a4,4(s4)
c0009268:	62e90263          	beq	s2,a4,c000988c <stride_dequeue+0x910>
c000926c:	019a2423          	sw	s9,8(s4)
c0009270:	07c12083          	lw	ra,124(sp)
c0009274:	fffc0c13          	addi	s8,s8,-1
c0009278:	009ba823          	sw	s1,16(s7)
c000927c:	018ba423          	sw	s8,8(s7)
c0009280:	07812403          	lw	s0,120(sp)
c0009284:	07412483          	lw	s1,116(sp)
c0009288:	07012903          	lw	s2,112(sp)
c000928c:	06c12983          	lw	s3,108(sp)
c0009290:	06812a03          	lw	s4,104(sp)
c0009294:	06412a83          	lw	s5,100(sp)
c0009298:	06012b03          	lw	s6,96(sp)
c000929c:	05c12b83          	lw	s7,92(sp)
c00092a0:	05812c03          	lw	s8,88(sp)
c00092a4:	05412c83          	lw	s9,84(sp)
c00092a8:	05012d03          	lw	s10,80(sp)
c00092ac:	04c12d83          	lw	s11,76(sp)
c00092b0:	08010113          	addi	sp,sp,128
c00092b4:	00008067          	ret
c00092b8:	004ca783          	lw	a5,4(s9)
c00092bc:	008caa83          	lw	s5,8(s9)
c00092c0:	00f12823          	sw	a5,16(sp)
c00092c4:	180a8463          	beqz	s5,c000944c <stride_dequeue+0x4d0>
c00092c8:	000b0593          	mv	a1,s6
c00092cc:	000a8513          	mv	a0,s5
c00092d0:	fd0ff0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c00092d4:	fff00713          	li	a4,-1
c00092d8:	00050d93          	mv	s11,a0
c00092dc:	00e51463          	bne	a0,a4,c00092e4 <stride_dequeue+0x368>
c00092e0:	7b90006f          	j	c000a298 <stride_dequeue+0x131c>
c00092e4:	004b2783          	lw	a5,4(s6)
c00092e8:	008b2d83          	lw	s11,8(s6)
c00092ec:	00e12c23          	sw	a4,24(sp)
c00092f0:	00f12a23          	sw	a5,20(sp)
c00092f4:	140d8463          	beqz	s11,c000943c <stride_dequeue+0x4c0>
c00092f8:	000d8593          	mv	a1,s11
c00092fc:	000a8513          	mv	a0,s5
c0009300:	fa0ff0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c0009304:	01812703          	lw	a4,24(sp)
c0009308:	00e51463          	bne	a0,a4,c0009310 <stride_dequeue+0x394>
c000930c:	2a80106f          	j	c000a5b4 <stride_dequeue+0x1638>
c0009310:	004da783          	lw	a5,4(s11)
c0009314:	008dae83          	lw	t4,8(s11)
c0009318:	00e12e23          	sw	a4,28(sp)
c000931c:	00f12c23          	sw	a5,24(sp)
c0009320:	100e8463          	beqz	t4,c0009428 <stride_dequeue+0x4ac>
c0009324:	000e8593          	mv	a1,t4
c0009328:	000a8513          	mv	a0,s5
c000932c:	03d12023          	sw	t4,32(sp)
c0009330:	f70ff0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c0009334:	01c12703          	lw	a4,28(sp)
c0009338:	02012e83          	lw	t4,32(sp)
c000933c:	00e51463          	bne	a0,a4,c0009344 <stride_dequeue+0x3c8>
c0009340:	3b50106f          	j	c000aef4 <stride_dequeue+0x1f78>
c0009344:	02e12023          	sw	a4,32(sp)
c0009348:	004ea703          	lw	a4,4(t4)
c000934c:	008ea783          	lw	a5,8(t4)
c0009350:	00e12e23          	sw	a4,28(sp)
c0009354:	0c078063          	beqz	a5,c0009414 <stride_dequeue+0x498>
c0009358:	00078593          	mv	a1,a5
c000935c:	000a8513          	mv	a0,s5
c0009360:	03d12423          	sw	t4,40(sp)
c0009364:	02f12223          	sw	a5,36(sp)
c0009368:	f38ff0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000936c:	02012703          	lw	a4,32(sp)
c0009370:	02412783          	lw	a5,36(sp)
c0009374:	02812e83          	lw	t4,40(sp)
c0009378:	00e51463          	bne	a0,a4,c0009380 <stride_dequeue+0x404>
c000937c:	0840206f          	j	c000b400 <stride_dequeue+0x2484>
c0009380:	0087af03          	lw	t5,8(a5)
c0009384:	02e12023          	sw	a4,32(sp)
c0009388:	0047ac03          	lw	s8,4(a5)
c000938c:	000f1463          	bnez	t5,c0009394 <stride_dequeue+0x418>
c0009390:	3380206f          	j	c000b6c8 <stride_dequeue+0x274c>
c0009394:	000f0593          	mv	a1,t5
c0009398:	000a8513          	mv	a0,s5
c000939c:	02f12623          	sw	a5,44(sp)
c00093a0:	03d12423          	sw	t4,40(sp)
c00093a4:	03e12223          	sw	t5,36(sp)
c00093a8:	ef8ff0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c00093ac:	02012703          	lw	a4,32(sp)
c00093b0:	02412f03          	lw	t5,36(sp)
c00093b4:	02812e83          	lw	t4,40(sp)
c00093b8:	02c12783          	lw	a5,44(sp)
c00093bc:	00e51463          	bne	a0,a4,c00093c4 <stride_dequeue+0x448>
c00093c0:	54c0206f          	j	c000b90c <stride_dequeue+0x2990>
c00093c4:	008f2583          	lw	a1,8(t5)
c00093c8:	000a8513          	mv	a0,s5
c00093cc:	004f2403          	lw	s0,4(t5)
c00093d0:	02f12423          	sw	a5,40(sp)
c00093d4:	03d12223          	sw	t4,36(sp)
c00093d8:	03e12023          	sw	t5,32(sp)
c00093dc:	f50ff0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c00093e0:	02012f03          	lw	t5,32(sp)
c00093e4:	02412e83          	lw	t4,36(sp)
c00093e8:	02812783          	lw	a5,40(sp)
c00093ec:	00af2223          	sw	a0,4(t5)
c00093f0:	008f2423          	sw	s0,8(t5)
c00093f4:	00050463          	beqz	a0,c00093fc <stride_dequeue+0x480>
c00093f8:	01e52023          	sw	t5,0(a0)
c00093fc:	008ba403          	lw	s0,8(s7)
c0009400:	0187a423          	sw	s8,8(a5)
c0009404:	01e7a223          	sw	t5,4(a5)
c0009408:	00ff2023          	sw	a5,0(t5)
c000940c:	00040c13          	mv	s8,s0
c0009410:	00078a93          	mv	s5,a5
c0009414:	01c12783          	lw	a5,28(sp)
c0009418:	015ea223          	sw	s5,4(t4)
c000941c:	00fea423          	sw	a5,8(t4)
c0009420:	01daa023          	sw	t4,0(s5)
c0009424:	000e8a93          	mv	s5,t4
c0009428:	01812783          	lw	a5,24(sp)
c000942c:	015da223          	sw	s5,4(s11)
c0009430:	00fda423          	sw	a5,8(s11)
c0009434:	01baa023          	sw	s11,0(s5)
c0009438:	000d8a93          	mv	s5,s11
c000943c:	01412783          	lw	a5,20(sp)
c0009440:	015b2223          	sw	s5,4(s6)
c0009444:	00fb2423          	sw	a5,8(s6)
c0009448:	016aa023          	sw	s6,0(s5)
c000944c:	01012783          	lw	a5,16(sp)
c0009450:	016ca223          	sw	s6,4(s9)
c0009454:	00fca423          	sw	a5,8(s9)
c0009458:	019b2023          	sw	s9,0(s6)
c000945c:	dd9ff06f          	j	c0009234 <stride_dequeue+0x2b8>
c0009460:	004ca783          	lw	a5,4(s9)
c0009464:	008cad03          	lw	s10,8(s9)
c0009468:	00f12423          	sw	a5,8(sp)
c000946c:	200d0663          	beqz	s10,c0009678 <stride_dequeue+0x6fc>
c0009470:	00098593          	mv	a1,s3
c0009474:	000d0513          	mv	a0,s10
c0009478:	e28ff0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000947c:	00050a93          	mv	s5,a0
c0009480:	59650663          	beq	a0,s6,c0009a0c <stride_dequeue+0xa90>
c0009484:	0089ad83          	lw	s11,8(s3)
c0009488:	0049aa83          	lw	s5,4(s3)
c000948c:	1e0d8063          	beqz	s11,c000966c <stride_dequeue+0x6f0>
c0009490:	000d8593          	mv	a1,s11
c0009494:	000d0513          	mv	a0,s10
c0009498:	e08ff0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000949c:	076504e3          	beq	a0,s6,c0009d04 <stride_dequeue+0xd88>
c00094a0:	004da783          	lw	a5,4(s11)
c00094a4:	008dab03          	lw	s6,8(s11)
c00094a8:	00f12623          	sw	a5,12(sp)
c00094ac:	1a0b0663          	beqz	s6,c0009658 <stride_dequeue+0x6dc>
c00094b0:	000b0593          	mv	a1,s6
c00094b4:	000d0513          	mv	a0,s10
c00094b8:	de8ff0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c00094bc:	fff00313          	li	t1,-1
c00094c0:	306500e3          	beq	a0,t1,c0009fc0 <stride_dequeue+0x1044>
c00094c4:	004b2783          	lw	a5,4(s6)
c00094c8:	008b2883          	lw	a7,8(s6)
c00094cc:	00612a23          	sw	t1,20(sp)
c00094d0:	00f12823          	sw	a5,16(sp)
c00094d4:	16088863          	beqz	a7,c0009644 <stride_dequeue+0x6c8>
c00094d8:	00088593          	mv	a1,a7
c00094dc:	000d0513          	mv	a0,s10
c00094e0:	01112c23          	sw	a7,24(sp)
c00094e4:	dbcff0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c00094e8:	01412303          	lw	t1,20(sp)
c00094ec:	01812883          	lw	a7,24(sp)
c00094f0:	00651463          	bne	a0,t1,c00094f8 <stride_dequeue+0x57c>
c00094f4:	4400106f          	j	c000a934 <stride_dequeue+0x19b8>
c00094f8:	0048a783          	lw	a5,4(a7)
c00094fc:	0088ae03          	lw	t3,8(a7)
c0009500:	00612c23          	sw	t1,24(sp)
c0009504:	00f12a23          	sw	a5,20(sp)
c0009508:	120e0463          	beqz	t3,c0009630 <stride_dequeue+0x6b4>
c000950c:	000e0593          	mv	a1,t3
c0009510:	000d0513          	mv	a0,s10
c0009514:	03112023          	sw	a7,32(sp)
c0009518:	01c12e23          	sw	t3,28(sp)
c000951c:	d84ff0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c0009520:	01812303          	lw	t1,24(sp)
c0009524:	01c12e03          	lw	t3,28(sp)
c0009528:	02012883          	lw	a7,32(sp)
c000952c:	00651463          	bne	a0,t1,c0009534 <stride_dequeue+0x5b8>
c0009530:	3750106f          	j	c000b0a4 <stride_dequeue+0x2128>
c0009534:	004e2783          	lw	a5,4(t3)
c0009538:	008e2e83          	lw	t4,8(t3)
c000953c:	00612e23          	sw	t1,28(sp)
c0009540:	00f12c23          	sw	a5,24(sp)
c0009544:	0c0e8c63          	beqz	t4,c000961c <stride_dequeue+0x6a0>
c0009548:	000e8593          	mv	a1,t4
c000954c:	000d0513          	mv	a0,s10
c0009550:	03c12423          	sw	t3,40(sp)
c0009554:	03112223          	sw	a7,36(sp)
c0009558:	03d12023          	sw	t4,32(sp)
c000955c:	d44ff0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c0009560:	01c12303          	lw	t1,28(sp)
c0009564:	02012e83          	lw	t4,32(sp)
c0009568:	02412883          	lw	a7,36(sp)
c000956c:	02812e03          	lw	t3,40(sp)
c0009570:	00651463          	bne	a0,t1,c0009578 <stride_dequeue+0x5fc>
c0009574:	6bd0106f          	j	c000b430 <stride_dequeue+0x24b4>
c0009578:	008eaf03          	lw	t5,8(t4)
c000957c:	00612e23          	sw	t1,28(sp)
c0009580:	004eac03          	lw	s8,4(t4)
c0009584:	000f1463          	bnez	t5,c000958c <stride_dequeue+0x610>
c0009588:	14c0206f          	j	c000b6d4 <stride_dequeue+0x2758>
c000958c:	000f0593          	mv	a1,t5
c0009590:	000d0513          	mv	a0,s10
c0009594:	03d12623          	sw	t4,44(sp)
c0009598:	03c12423          	sw	t3,40(sp)
c000959c:	03112223          	sw	a7,36(sp)
c00095a0:	03e12023          	sw	t5,32(sp)
c00095a4:	cfcff0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c00095a8:	01c12303          	lw	t1,28(sp)
c00095ac:	02012f03          	lw	t5,32(sp)
c00095b0:	02412883          	lw	a7,36(sp)
c00095b4:	02812e03          	lw	t3,40(sp)
c00095b8:	02c12e83          	lw	t4,44(sp)
c00095bc:	00651463          	bne	a0,t1,c00095c4 <stride_dequeue+0x648>
c00095c0:	2a80206f          	j	c000b868 <stride_dequeue+0x28ec>
c00095c4:	008f2583          	lw	a1,8(t5)
c00095c8:	000d0513          	mv	a0,s10
c00095cc:	004f2403          	lw	s0,4(t5)
c00095d0:	03d12423          	sw	t4,40(sp)
c00095d4:	03c12223          	sw	t3,36(sp)
c00095d8:	03112023          	sw	a7,32(sp)
c00095dc:	01e12e23          	sw	t5,28(sp)
c00095e0:	d4cff0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c00095e4:	01c12f03          	lw	t5,28(sp)
c00095e8:	02012883          	lw	a7,32(sp)
c00095ec:	02412e03          	lw	t3,36(sp)
c00095f0:	00af2223          	sw	a0,4(t5)
c00095f4:	008f2423          	sw	s0,8(t5)
c00095f8:	02812e83          	lw	t4,40(sp)
c00095fc:	00050463          	beqz	a0,c0009604 <stride_dequeue+0x688>
c0009600:	01e52023          	sw	t5,0(a0)
c0009604:	008ba403          	lw	s0,8(s7)
c0009608:	018ea423          	sw	s8,8(t4)
c000960c:	01eea223          	sw	t5,4(t4)
c0009610:	01df2023          	sw	t4,0(t5)
c0009614:	00040c13          	mv	s8,s0
c0009618:	000e8d13          	mv	s10,t4
c000961c:	01812783          	lw	a5,24(sp)
c0009620:	01ae2223          	sw	s10,4(t3)
c0009624:	00fe2423          	sw	a5,8(t3)
c0009628:	01cd2023          	sw	t3,0(s10)
c000962c:	000e0d13          	mv	s10,t3
c0009630:	01412783          	lw	a5,20(sp)
c0009634:	01a8a223          	sw	s10,4(a7)
c0009638:	00f8a423          	sw	a5,8(a7)
c000963c:	011d2023          	sw	a7,0(s10)
c0009640:	00088d13          	mv	s10,a7
c0009644:	01012783          	lw	a5,16(sp)
c0009648:	01ab2223          	sw	s10,4(s6)
c000964c:	00fb2423          	sw	a5,8(s6)
c0009650:	016d2023          	sw	s6,0(s10)
c0009654:	000b0d13          	mv	s10,s6
c0009658:	00c12783          	lw	a5,12(sp)
c000965c:	01ada223          	sw	s10,4(s11)
c0009660:	00fda423          	sw	a5,8(s11)
c0009664:	01bd2023          	sw	s11,0(s10)
c0009668:	000d8d13          	mv	s10,s11
c000966c:	01a9a223          	sw	s10,4(s3)
c0009670:	0159a423          	sw	s5,8(s3)
c0009674:	013d2023          	sw	s3,0(s10)
c0009678:	00812783          	lw	a5,8(sp)
c000967c:	013ca223          	sw	s3,4(s9)
c0009680:	00fca423          	sw	a5,8(s9)
c0009684:	0199a023          	sw	s9,0(s3)
c0009688:	014ca023          	sw	s4,0(s9)
c000968c:	bd5ff06f          	j	c0009260 <stride_dequeue+0x2e4>
c0009690:	000c8493          	mv	s1,s9
c0009694:	bddff06f          	j	c0009270 <stride_dequeue+0x2f4>
c0009698:	bc0984e3          	beqz	s3,c0009260 <stride_dequeue+0x2e4>
c000969c:	00098c93          	mv	s9,s3
c00096a0:	014ca023          	sw	s4,0(s9)
c00096a4:	bbdff06f          	j	c0009260 <stride_dequeue+0x2e4>
c00096a8:	004ca783          	lw	a5,4(s9)
c00096ac:	008caa83          	lw	s5,8(s9)
c00096b0:	00f12623          	sw	a5,12(sp)
c00096b4:	1c0a8263          	beqz	s5,c0009878 <stride_dequeue+0x8fc>
c00096b8:	000d0593          	mv	a1,s10
c00096bc:	000a8513          	mv	a0,s5
c00096c0:	be0ff0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c00096c4:	7b650063          	beq	a0,s6,c0009e64 <stride_dequeue+0xee8>
c00096c8:	004d2783          	lw	a5,4(s10)
c00096cc:	008d2b03          	lw	s6,8(s10)
c00096d0:	00f12823          	sw	a5,16(sp)
c00096d4:	180b0a63          	beqz	s6,c0009868 <stride_dequeue+0x8ec>
c00096d8:	000b0593          	mv	a1,s6
c00096dc:	000a8513          	mv	a0,s5
c00096e0:	bc0ff0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c00096e4:	fff00793          	li	a5,-1
c00096e8:	00050d93          	mv	s11,a0
c00096ec:	24f508e3          	beq	a0,a5,c000a13c <stride_dequeue+0x11c0>
c00096f0:	00f12c23          	sw	a5,24(sp)
c00096f4:	004b2783          	lw	a5,4(s6)
c00096f8:	008b2e03          	lw	t3,8(s6)
c00096fc:	00f12a23          	sw	a5,20(sp)
c0009700:	140e0a63          	beqz	t3,c0009854 <stride_dequeue+0x8d8>
c0009704:	000e0593          	mv	a1,t3
c0009708:	000a8513          	mv	a0,s5
c000970c:	01c12e23          	sw	t3,28(sp)
c0009710:	b90ff0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c0009714:	01812783          	lw	a5,24(sp)
c0009718:	00050d93          	mv	s11,a0
c000971c:	01c12e03          	lw	t3,28(sp)
c0009720:	00f51463          	bne	a0,a5,c0009728 <stride_dequeue+0x7ac>
c0009724:	0540106f          	j	c000a778 <stride_dequeue+0x17fc>
c0009728:	00f12e23          	sw	a5,28(sp)
c000972c:	004e2783          	lw	a5,4(t3)
c0009730:	008e2d83          	lw	s11,8(t3)
c0009734:	00f12c23          	sw	a5,24(sp)
c0009738:	100d8463          	beqz	s11,c0009840 <stride_dequeue+0x8c4>
c000973c:	000d8593          	mv	a1,s11
c0009740:	000a8513          	mv	a0,s5
c0009744:	03c12023          	sw	t3,32(sp)
c0009748:	b58ff0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000974c:	01c12783          	lw	a5,28(sp)
c0009750:	02012e03          	lw	t3,32(sp)
c0009754:	00f51463          	bne	a0,a5,c000975c <stride_dequeue+0x7e0>
c0009758:	11d0106f          	j	c000b074 <stride_dequeue+0x20f8>
c000975c:	02f12023          	sw	a5,32(sp)
c0009760:	004da783          	lw	a5,4(s11)
c0009764:	008dae83          	lw	t4,8(s11)
c0009768:	00f12e23          	sw	a5,28(sp)
c000976c:	0c0e8063          	beqz	t4,c000982c <stride_dequeue+0x8b0>
c0009770:	000e8593          	mv	a1,t4
c0009774:	000a8513          	mv	a0,s5
c0009778:	03c12423          	sw	t3,40(sp)
c000977c:	03d12223          	sw	t4,36(sp)
c0009780:	b20ff0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c0009784:	02012783          	lw	a5,32(sp)
c0009788:	02412e83          	lw	t4,36(sp)
c000978c:	02812e03          	lw	t3,40(sp)
c0009790:	00f51463          	bne	a0,a5,c0009798 <stride_dequeue+0x81c>
c0009794:	43d0106f          	j	c000b3d0 <stride_dequeue+0x2454>
c0009798:	008eaf03          	lw	t5,8(t4)
c000979c:	02f12023          	sw	a5,32(sp)
c00097a0:	004eac03          	lw	s8,4(t4)
c00097a4:	000f1463          	bnez	t5,c00097ac <stride_dequeue+0x830>
c00097a8:	77d0106f          	j	c000b724 <stride_dequeue+0x27a8>
c00097ac:	000f0593          	mv	a1,t5
c00097b0:	000a8513          	mv	a0,s5
c00097b4:	03d12623          	sw	t4,44(sp)
c00097b8:	03c12423          	sw	t3,40(sp)
c00097bc:	03e12223          	sw	t5,36(sp)
c00097c0:	ae0ff0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c00097c4:	02012783          	lw	a5,32(sp)
c00097c8:	02412f03          	lw	t5,36(sp)
c00097cc:	02812e03          	lw	t3,40(sp)
c00097d0:	02c12e83          	lw	t4,44(sp)
c00097d4:	00f51463          	bne	a0,a5,c00097dc <stride_dequeue+0x860>
c00097d8:	01c0206f          	j	c000b7f4 <stride_dequeue+0x2878>
c00097dc:	008f2583          	lw	a1,8(t5)
c00097e0:	000a8513          	mv	a0,s5
c00097e4:	004f2403          	lw	s0,4(t5)
c00097e8:	03d12423          	sw	t4,40(sp)
c00097ec:	03c12223          	sw	t3,36(sp)
c00097f0:	03e12023          	sw	t5,32(sp)
c00097f4:	b38ff0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c00097f8:	02012f03          	lw	t5,32(sp)
c00097fc:	02412e03          	lw	t3,36(sp)
c0009800:	02812e83          	lw	t4,40(sp)
c0009804:	00af2223          	sw	a0,4(t5)
c0009808:	008f2423          	sw	s0,8(t5)
c000980c:	00050463          	beqz	a0,c0009814 <stride_dequeue+0x898>
c0009810:	01e52023          	sw	t5,0(a0)
c0009814:	008ba403          	lw	s0,8(s7)
c0009818:	018ea423          	sw	s8,8(t4)
c000981c:	01eea223          	sw	t5,4(t4)
c0009820:	01df2023          	sw	t4,0(t5)
c0009824:	00040c13          	mv	s8,s0
c0009828:	000e8a93          	mv	s5,t4
c000982c:	01c12783          	lw	a5,28(sp)
c0009830:	015da223          	sw	s5,4(s11)
c0009834:	00fda423          	sw	a5,8(s11)
c0009838:	01baa023          	sw	s11,0(s5)
c000983c:	000d8a93          	mv	s5,s11
c0009840:	01812783          	lw	a5,24(sp)
c0009844:	015e2223          	sw	s5,4(t3)
c0009848:	00fe2423          	sw	a5,8(t3)
c000984c:	01caa023          	sw	t3,0(s5)
c0009850:	000e0a93          	mv	s5,t3
c0009854:	01412783          	lw	a5,20(sp)
c0009858:	015b2223          	sw	s5,4(s6)
c000985c:	00fb2423          	sw	a5,8(s6)
c0009860:	016aa023          	sw	s6,0(s5)
c0009864:	000b0a93          	mv	s5,s6
c0009868:	01012783          	lw	a5,16(sp)
c000986c:	015d2223          	sw	s5,4(s10)
c0009870:	00fd2423          	sw	a5,8(s10)
c0009874:	01aaa023          	sw	s10,0(s5)
c0009878:	00c12783          	lw	a5,12(sp)
c000987c:	01aca223          	sw	s10,4(s9)
c0009880:	00fca423          	sw	a5,8(s9)
c0009884:	019d2023          	sw	s9,0(s10)
c0009888:	9c1ff06f          	j	c0009248 <stride_dequeue+0x2cc>
c000988c:	019a2223          	sw	s9,4(s4)
c0009890:	9e1ff06f          	j	c0009270 <stride_dequeue+0x2f4>
c0009894:	004ca783          	lw	a5,4(s9)
c0009898:	008cae83          	lw	t4,8(s9)
c000989c:	00a12e23          	sw	a0,28(sp)
c00098a0:	00f12c23          	sw	a5,24(sp)
c00098a4:	140e8a63          	beqz	t4,c00099f8 <stride_dequeue+0xa7c>
c00098a8:	000e8513          	mv	a0,t4
c00098ac:	000d8593          	mv	a1,s11
c00098b0:	03d12023          	sw	t4,32(sp)
c00098b4:	9ecff0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c00098b8:	01c12e03          	lw	t3,28(sp)
c00098bc:	02012e83          	lw	t4,32(sp)
c00098c0:	01c51463          	bne	a0,t3,c00098c8 <stride_dequeue+0x94c>
c00098c4:	4140106f          	j	c000acd8 <stride_dequeue+0x1d5c>
c00098c8:	004da783          	lw	a5,4(s11)
c00098cc:	008daf03          	lw	t5,8(s11)
c00098d0:	03c12023          	sw	t3,32(sp)
c00098d4:	00f12e23          	sw	a5,28(sp)
c00098d8:	100f0863          	beqz	t5,c00099e8 <stride_dequeue+0xa6c>
c00098dc:	000f0593          	mv	a1,t5
c00098e0:	000e8513          	mv	a0,t4
c00098e4:	03e12423          	sw	t5,40(sp)
c00098e8:	03d12223          	sw	t4,36(sp)
c00098ec:	9b4ff0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c00098f0:	02012e03          	lw	t3,32(sp)
c00098f4:	02412e83          	lw	t4,36(sp)
c00098f8:	02812f03          	lw	t5,40(sp)
c00098fc:	01c51463          	bne	a0,t3,c0009904 <stride_dequeue+0x988>
c0009900:	26d0106f          	j	c000b36c <stride_dequeue+0x23f0>
c0009904:	004f2783          	lw	a5,4(t5)
c0009908:	008f2c03          	lw	s8,8(t5)
c000990c:	03c12223          	sw	t3,36(sp)
c0009910:	02f12023          	sw	a5,32(sp)
c0009914:	000c1463          	bnez	s8,c000991c <stride_dequeue+0x9a0>
c0009918:	5f50106f          	j	c000b70c <stride_dequeue+0x2790>
c000991c:	000e8513          	mv	a0,t4
c0009920:	000c0593          	mv	a1,s8
c0009924:	03e12623          	sw	t5,44(sp)
c0009928:	03d12423          	sw	t4,40(sp)
c000992c:	974ff0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c0009930:	02412e03          	lw	t3,36(sp)
c0009934:	02812e83          	lw	t4,40(sp)
c0009938:	02c12f03          	lw	t5,44(sp)
c000993c:	01c51463          	bne	a0,t3,c0009944 <stride_dequeue+0x9c8>
c0009940:	7910106f          	j	c000b8d0 <stride_dequeue+0x2954>
c0009944:	004c2783          	lw	a5,4(s8)
c0009948:	008c2e03          	lw	t3,8(s8)
c000994c:	02f12223          	sw	a5,36(sp)
c0009950:	060e0863          	beqz	t3,c00099c0 <stride_dequeue+0xa44>
c0009954:	000e0593          	mv	a1,t3
c0009958:	000e8513          	mv	a0,t4
c000995c:	03e12823          	sw	t5,48(sp)
c0009960:	03c12623          	sw	t3,44(sp)
c0009964:	03d12423          	sw	t4,40(sp)
c0009968:	938ff0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000996c:	03012f03          	lw	t5,48(sp)
c0009970:	02c12e03          	lw	t3,44(sp)
c0009974:	fff00593          	li	a1,-1
c0009978:	03e12623          	sw	t5,44(sp)
c000997c:	02812e83          	lw	t4,40(sp)
c0009980:	00b51463          	bne	a0,a1,c0009988 <stride_dequeue+0xa0c>
c0009984:	50c0206f          	j	c000be90 <stride_dequeue+0x2f14>
c0009988:	008e2583          	lw	a1,8(t3)
c000998c:	000e8513          	mv	a0,t4
c0009990:	004e2403          	lw	s0,4(t3)
c0009994:	03c12423          	sw	t3,40(sp)
c0009998:	994ff0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000999c:	02812e03          	lw	t3,40(sp)
c00099a0:	02c12f03          	lw	t5,44(sp)
c00099a4:	00ae2223          	sw	a0,4(t3)
c00099a8:	008e2423          	sw	s0,8(t3)
c00099ac:	00051463          	bnez	a0,c00099b4 <stride_dequeue+0xa38>
c00099b0:	0b90206f          	j	c000c268 <stride_dequeue+0x32ec>
c00099b4:	008ba403          	lw	s0,8(s7)
c00099b8:	01c52023          	sw	t3,0(a0)
c00099bc:	000e0e93          	mv	t4,t3
c00099c0:	02412783          	lw	a5,36(sp)
c00099c4:	01dc2223          	sw	t4,4(s8)
c00099c8:	00fc2423          	sw	a5,8(s8)
c00099cc:	018ea023          	sw	s8,0(t4)
c00099d0:	02012783          	lw	a5,32(sp)
c00099d4:	018f2223          	sw	s8,4(t5)
c00099d8:	000f0e93          	mv	t4,t5
c00099dc:	00ff2423          	sw	a5,8(t5)
c00099e0:	01ec2023          	sw	t5,0(s8)
c00099e4:	00040c13          	mv	s8,s0
c00099e8:	01c12783          	lw	a5,28(sp)
c00099ec:	01dda223          	sw	t4,4(s11)
c00099f0:	00fda423          	sw	a5,8(s11)
c00099f4:	01bea023          	sw	s11,0(t4)
c00099f8:	01812783          	lw	a5,24(sp)
c00099fc:	01bca223          	sw	s11,4(s9)
c0009a00:	00fca423          	sw	a5,8(s9)
c0009a04:	019da023          	sw	s9,0(s11)
c0009a08:	805ff06f          	j	c000920c <stride_dequeue+0x290>
c0009a0c:	004d2783          	lw	a5,4(s10)
c0009a10:	008d2b03          	lw	s6,8(s10)
c0009a14:	00f12623          	sw	a5,12(sp)
c0009a18:	160b0863          	beqz	s6,c0009b88 <stride_dequeue+0xc0c>
c0009a1c:	00098593          	mv	a1,s3
c0009a20:	000b0513          	mv	a0,s6
c0009a24:	87cff0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c0009a28:	1d5506e3          	beq	a0,s5,c000a3f4 <stride_dequeue+0x1478>
c0009a2c:	0089ad83          	lw	s11,8(s3)
c0009a30:	0049aa83          	lw	s5,4(s3)
c0009a34:	140d8463          	beqz	s11,c0009b7c <stride_dequeue+0xc00>
c0009a38:	000d8593          	mv	a1,s11
c0009a3c:	000b0513          	mv	a0,s6
c0009a40:	860ff0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c0009a44:	fff00313          	li	t1,-1
c0009a48:	00651463          	bne	a0,t1,c0009a50 <stride_dequeue+0xad4>
c0009a4c:	1f80106f          	j	c000ac44 <stride_dequeue+0x1cc8>
c0009a50:	004da783          	lw	a5,4(s11)
c0009a54:	008da803          	lw	a6,8(s11)
c0009a58:	00612a23          	sw	t1,20(sp)
c0009a5c:	00f12823          	sw	a5,16(sp)
c0009a60:	10080463          	beqz	a6,c0009b68 <stride_dequeue+0xbec>
c0009a64:	00080593          	mv	a1,a6
c0009a68:	000b0513          	mv	a0,s6
c0009a6c:	01012c23          	sw	a6,24(sp)
c0009a70:	830ff0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c0009a74:	01412303          	lw	t1,20(sp)
c0009a78:	01812803          	lw	a6,24(sp)
c0009a7c:	00651463          	bne	a0,t1,c0009a84 <stride_dequeue+0xb08>
c0009a80:	6540106f          	j	c000b0d4 <stride_dequeue+0x2158>
c0009a84:	00482783          	lw	a5,4(a6)
c0009a88:	00882883          	lw	a7,8(a6)
c0009a8c:	00612c23          	sw	t1,24(sp)
c0009a90:	00f12a23          	sw	a5,20(sp)
c0009a94:	00089463          	bnez	a7,c0009a9c <stride_dequeue+0xb20>
c0009a98:	1d10106f          	j	c000b468 <stride_dequeue+0x24ec>
c0009a9c:	00088593          	mv	a1,a7
c0009aa0:	000b0513          	mv	a0,s6
c0009aa4:	03012023          	sw	a6,32(sp)
c0009aa8:	01112e23          	sw	a7,28(sp)
c0009aac:	ff5fe0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c0009ab0:	01812303          	lw	t1,24(sp)
c0009ab4:	01c12883          	lw	a7,28(sp)
c0009ab8:	02012803          	lw	a6,32(sp)
c0009abc:	00651463          	bne	a0,t1,c0009ac4 <stride_dequeue+0xb48>
c0009ac0:	20d0106f          	j	c000b4cc <stride_dequeue+0x2550>
c0009ac4:	0088ae03          	lw	t3,8(a7)
c0009ac8:	00612c23          	sw	t1,24(sp)
c0009acc:	0048ac03          	lw	s8,4(a7)
c0009ad0:	000e1463          	bnez	t3,c0009ad8 <stride_dequeue+0xb5c>
c0009ad4:	50d0106f          	j	c000b7e0 <stride_dequeue+0x2864>
c0009ad8:	000e0593          	mv	a1,t3
c0009adc:	000b0513          	mv	a0,s6
c0009ae0:	03112223          	sw	a7,36(sp)
c0009ae4:	03012023          	sw	a6,32(sp)
c0009ae8:	01c12e23          	sw	t3,28(sp)
c0009aec:	fb5fe0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c0009af0:	01812303          	lw	t1,24(sp)
c0009af4:	01c12e03          	lw	t3,28(sp)
c0009af8:	02012803          	lw	a6,32(sp)
c0009afc:	02412883          	lw	a7,36(sp)
c0009b00:	00651463          	bne	a0,t1,c0009b08 <stride_dequeue+0xb8c>
c0009b04:	6d90106f          	j	c000b9dc <stride_dequeue+0x2a60>
c0009b08:	008e2583          	lw	a1,8(t3)
c0009b0c:	000b0513          	mv	a0,s6
c0009b10:	004e2403          	lw	s0,4(t3)
c0009b14:	03112023          	sw	a7,32(sp)
c0009b18:	01012e23          	sw	a6,28(sp)
c0009b1c:	01c12c23          	sw	t3,24(sp)
c0009b20:	80cff0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c0009b24:	01812e03          	lw	t3,24(sp)
c0009b28:	01c12803          	lw	a6,28(sp)
c0009b2c:	02012883          	lw	a7,32(sp)
c0009b30:	00ae2223          	sw	a0,4(t3)
c0009b34:	008e2423          	sw	s0,8(t3)
c0009b38:	00050463          	beqz	a0,c0009b40 <stride_dequeue+0xbc4>
c0009b3c:	01c52023          	sw	t3,0(a0)
c0009b40:	008ba403          	lw	s0,8(s7)
c0009b44:	0188a423          	sw	s8,8(a7)
c0009b48:	01c8a223          	sw	t3,4(a7)
c0009b4c:	011e2023          	sw	a7,0(t3)
c0009b50:	00040c13          	mv	s8,s0
c0009b54:	01412783          	lw	a5,20(sp)
c0009b58:	01182223          	sw	a7,4(a6)
c0009b5c:	00080b13          	mv	s6,a6
c0009b60:	00f82423          	sw	a5,8(a6)
c0009b64:	0108a023          	sw	a6,0(a7)
c0009b68:	01012783          	lw	a5,16(sp)
c0009b6c:	016da223          	sw	s6,4(s11)
c0009b70:	00fda423          	sw	a5,8(s11)
c0009b74:	01bb2023          	sw	s11,0(s6)
c0009b78:	000d8b13          	mv	s6,s11
c0009b7c:	0169a223          	sw	s6,4(s3)
c0009b80:	0159a423          	sw	s5,8(s3)
c0009b84:	013b2023          	sw	s3,0(s6)
c0009b88:	00c12783          	lw	a5,12(sp)
c0009b8c:	013d2223          	sw	s3,4(s10)
c0009b90:	00fd2423          	sw	a5,8(s10)
c0009b94:	01a9a023          	sw	s10,0(s3)
c0009b98:	000d0993          	mv	s3,s10
c0009b9c:	addff06f          	j	c0009678 <stride_dequeue+0x6fc>
c0009ba0:	004ca783          	lw	a5,4(s9)
c0009ba4:	008cae03          	lw	t3,8(s9)
c0009ba8:	00f12a23          	sw	a5,20(sp)
c0009bac:	140e0263          	beqz	t3,c0009cf0 <stride_dequeue+0xd74>
c0009bb0:	000e0513          	mv	a0,t3
c0009bb4:	000a8593          	mv	a1,s5
c0009bb8:	01c12c23          	sw	t3,24(sp)
c0009bbc:	ee5fe0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c0009bc0:	01812e03          	lw	t3,24(sp)
c0009bc4:	5fb502e3          	beq	a0,s11,c000a9a8 <stride_dequeue+0x1a2c>
c0009bc8:	004aa783          	lw	a5,4(s5)
c0009bcc:	008aae83          	lw	t4,8(s5)
c0009bd0:	00f12c23          	sw	a5,24(sp)
c0009bd4:	100e8663          	beqz	t4,c0009ce0 <stride_dequeue+0xd64>
c0009bd8:	000e8593          	mv	a1,t4
c0009bdc:	000e0513          	mv	a0,t3
c0009be0:	03d12023          	sw	t4,32(sp)
c0009be4:	01c12e23          	sw	t3,28(sp)
c0009be8:	eb9fe0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c0009bec:	01c12e03          	lw	t3,28(sp)
c0009bf0:	02012e83          	lw	t4,32(sp)
c0009bf4:	01b51463          	bne	a0,s11,c0009bfc <stride_dequeue+0xc80>
c0009bf8:	15c0106f          	j	c000ad54 <stride_dequeue+0x1dd8>
c0009bfc:	004ea703          	lw	a4,4(t4)
c0009c00:	008ea783          	lw	a5,8(t4)
c0009c04:	00e12e23          	sw	a4,28(sp)
c0009c08:	0c078263          	beqz	a5,c0009ccc <stride_dequeue+0xd50>
c0009c0c:	00078593          	mv	a1,a5
c0009c10:	000e0513          	mv	a0,t3
c0009c14:	03d12423          	sw	t4,40(sp)
c0009c18:	02f12223          	sw	a5,36(sp)
c0009c1c:	03c12023          	sw	t3,32(sp)
c0009c20:	e81fe0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c0009c24:	02012e03          	lw	t3,32(sp)
c0009c28:	02412783          	lw	a5,36(sp)
c0009c2c:	02812e83          	lw	t4,40(sp)
c0009c30:	01b51463          	bne	a0,s11,c0009c38 <stride_dequeue+0xcbc>
c0009c34:	7680106f          	j	c000b39c <stride_dequeue+0x2420>
c0009c38:	0087af03          	lw	t5,8(a5)
c0009c3c:	0047ac03          	lw	s8,4(a5)
c0009c40:	000f1463          	bnez	t5,c0009c48 <stride_dequeue+0xccc>
c0009c44:	2d50106f          	j	c000b718 <stride_dequeue+0x279c>
c0009c48:	000f0593          	mv	a1,t5
c0009c4c:	000e0513          	mv	a0,t3
c0009c50:	02f12623          	sw	a5,44(sp)
c0009c54:	03d12423          	sw	t4,40(sp)
c0009c58:	03e12223          	sw	t5,36(sp)
c0009c5c:	03c12023          	sw	t3,32(sp)
c0009c60:	e41fe0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c0009c64:	02812e83          	lw	t4,40(sp)
c0009c68:	02c12783          	lw	a5,44(sp)
c0009c6c:	02412f03          	lw	t5,36(sp)
c0009c70:	03d12223          	sw	t4,36(sp)
c0009c74:	02f12423          	sw	a5,40(sp)
c0009c78:	02012e03          	lw	t3,32(sp)
c0009c7c:	01b51463          	bne	a0,s11,c0009c84 <stride_dequeue+0xd08>
c0009c80:	3b10106f          	j	c000b830 <stride_dequeue+0x28b4>
c0009c84:	008f2583          	lw	a1,8(t5)
c0009c88:	000e0513          	mv	a0,t3
c0009c8c:	004f2403          	lw	s0,4(t5)
c0009c90:	03e12023          	sw	t5,32(sp)
c0009c94:	e99fe0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c0009c98:	02012f03          	lw	t5,32(sp)
c0009c9c:	02412e83          	lw	t4,36(sp)
c0009ca0:	02812783          	lw	a5,40(sp)
c0009ca4:	00af2223          	sw	a0,4(t5)
c0009ca8:	008f2423          	sw	s0,8(t5)
c0009cac:	00050463          	beqz	a0,c0009cb4 <stride_dequeue+0xd38>
c0009cb0:	01e52023          	sw	t5,0(a0)
c0009cb4:	008ba403          	lw	s0,8(s7)
c0009cb8:	0187a423          	sw	s8,8(a5)
c0009cbc:	01e7a223          	sw	t5,4(a5)
c0009cc0:	00ff2023          	sw	a5,0(t5)
c0009cc4:	00040c13          	mv	s8,s0
c0009cc8:	00078e13          	mv	t3,a5
c0009ccc:	01c12783          	lw	a5,28(sp)
c0009cd0:	01cea223          	sw	t3,4(t4)
c0009cd4:	00fea423          	sw	a5,8(t4)
c0009cd8:	01de2023          	sw	t4,0(t3)
c0009cdc:	000e8e13          	mv	t3,t4
c0009ce0:	01812783          	lw	a5,24(sp)
c0009ce4:	01caa223          	sw	t3,4(s5)
c0009ce8:	00faa423          	sw	a5,8(s5)
c0009cec:	015e2023          	sw	s5,0(t3)
c0009cf0:	01412783          	lw	a5,20(sp)
c0009cf4:	015ca223          	sw	s5,4(s9)
c0009cf8:	00fca423          	sw	a5,8(s9)
c0009cfc:	019aa023          	sw	s9,0(s5)
c0009d00:	d20ff06f          	j	c0009220 <stride_dequeue+0x2a4>
c0009d04:	004d2783          	lw	a5,4(s10)
c0009d08:	008d2b03          	lw	s6,8(s10)
c0009d0c:	00f12623          	sw	a5,12(sp)
c0009d10:	140b0063          	beqz	s6,c0009e50 <stride_dequeue+0xed4>
c0009d14:	000d8593          	mv	a1,s11
c0009d18:	000b0513          	mv	a0,s6
c0009d1c:	d85fe0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c0009d20:	fff00313          	li	t1,-1
c0009d24:	6a650ce3          	beq	a0,t1,c000abdc <stride_dequeue+0x1c60>
c0009d28:	004da783          	lw	a5,4(s11)
c0009d2c:	008da803          	lw	a6,8(s11)
c0009d30:	00612a23          	sw	t1,20(sp)
c0009d34:	00f12823          	sw	a5,16(sp)
c0009d38:	10080463          	beqz	a6,c0009e40 <stride_dequeue+0xec4>
c0009d3c:	00080593          	mv	a1,a6
c0009d40:	000b0513          	mv	a0,s6
c0009d44:	01012c23          	sw	a6,24(sp)
c0009d48:	d59fe0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c0009d4c:	01412303          	lw	t1,20(sp)
c0009d50:	01812803          	lw	a6,24(sp)
c0009d54:	00651463          	bne	a0,t1,c0009d5c <stride_dequeue+0xde0>
c0009d58:	4840106f          	j	c000b1dc <stride_dequeue+0x2260>
c0009d5c:	00482783          	lw	a5,4(a6)
c0009d60:	00882883          	lw	a7,8(a6)
c0009d64:	00612c23          	sw	t1,24(sp)
c0009d68:	00f12a23          	sw	a5,20(sp)
c0009d6c:	00089463          	bnez	a7,c0009d74 <stride_dequeue+0xdf8>
c0009d70:	7100106f          	j	c000b480 <stride_dequeue+0x2504>
c0009d74:	00088593          	mv	a1,a7
c0009d78:	000b0513          	mv	a0,s6
c0009d7c:	03012023          	sw	a6,32(sp)
c0009d80:	01112e23          	sw	a7,28(sp)
c0009d84:	d1dfe0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c0009d88:	01812303          	lw	t1,24(sp)
c0009d8c:	01c12883          	lw	a7,28(sp)
c0009d90:	02012803          	lw	a6,32(sp)
c0009d94:	00651463          	bne	a0,t1,c0009d9c <stride_dequeue+0xe20>
c0009d98:	7000106f          	j	c000b498 <stride_dequeue+0x251c>
c0009d9c:	0088ae03          	lw	t3,8(a7)
c0009da0:	00612c23          	sw	t1,24(sp)
c0009da4:	0048ac03          	lw	s8,4(a7)
c0009da8:	000e1463          	bnez	t3,c0009db0 <stride_dequeue+0xe34>
c0009dac:	2290106f          	j	c000b7d4 <stride_dequeue+0x2858>
c0009db0:	000e0593          	mv	a1,t3
c0009db4:	000b0513          	mv	a0,s6
c0009db8:	03112223          	sw	a7,36(sp)
c0009dbc:	03012023          	sw	a6,32(sp)
c0009dc0:	01c12e23          	sw	t3,28(sp)
c0009dc4:	cddfe0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c0009dc8:	01812303          	lw	t1,24(sp)
c0009dcc:	01c12e03          	lw	t3,28(sp)
c0009dd0:	02012803          	lw	a6,32(sp)
c0009dd4:	02412883          	lw	a7,36(sp)
c0009dd8:	00651463          	bne	a0,t1,c0009de0 <stride_dequeue+0xe64>
c0009ddc:	5f50106f          	j	c000bbd0 <stride_dequeue+0x2c54>
c0009de0:	008e2583          	lw	a1,8(t3)
c0009de4:	000b0513          	mv	a0,s6
c0009de8:	004e2403          	lw	s0,4(t3)
c0009dec:	03112023          	sw	a7,32(sp)
c0009df0:	01012e23          	sw	a6,28(sp)
c0009df4:	01c12c23          	sw	t3,24(sp)
c0009df8:	d35fe0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c0009dfc:	01812e03          	lw	t3,24(sp)
c0009e00:	01c12803          	lw	a6,28(sp)
c0009e04:	02012883          	lw	a7,32(sp)
c0009e08:	00ae2223          	sw	a0,4(t3)
c0009e0c:	008e2423          	sw	s0,8(t3)
c0009e10:	00050463          	beqz	a0,c0009e18 <stride_dequeue+0xe9c>
c0009e14:	01c52023          	sw	t3,0(a0)
c0009e18:	008ba403          	lw	s0,8(s7)
c0009e1c:	0188a423          	sw	s8,8(a7)
c0009e20:	01c8a223          	sw	t3,4(a7)
c0009e24:	011e2023          	sw	a7,0(t3)
c0009e28:	00040c13          	mv	s8,s0
c0009e2c:	01412783          	lw	a5,20(sp)
c0009e30:	01182223          	sw	a7,4(a6)
c0009e34:	00080b13          	mv	s6,a6
c0009e38:	00f82423          	sw	a5,8(a6)
c0009e3c:	0108a023          	sw	a6,0(a7)
c0009e40:	01012783          	lw	a5,16(sp)
c0009e44:	016da223          	sw	s6,4(s11)
c0009e48:	00fda423          	sw	a5,8(s11)
c0009e4c:	01bb2023          	sw	s11,0(s6)
c0009e50:	00c12783          	lw	a5,12(sp)
c0009e54:	01bd2223          	sw	s11,4(s10)
c0009e58:	00fd2423          	sw	a5,8(s10)
c0009e5c:	01ada023          	sw	s10,0(s11)
c0009e60:	80dff06f          	j	c000966c <stride_dequeue+0x6f0>
c0009e64:	008aad83          	lw	s11,8(s5)
c0009e68:	004aab03          	lw	s6,4(s5)
c0009e6c:	140d8063          	beqz	s11,c0009fac <stride_dequeue+0x1030>
c0009e70:	000d0593          	mv	a1,s10
c0009e74:	000d8513          	mv	a0,s11
c0009e78:	c29fe0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c0009e7c:	fff00313          	li	t1,-1
c0009e80:	4e650ae3          	beq	a0,t1,c000ab74 <stride_dequeue+0x1bf8>
c0009e84:	004d2703          	lw	a4,4(s10)
c0009e88:	008d2783          	lw	a5,8(s10)
c0009e8c:	00612a23          	sw	t1,20(sp)
c0009e90:	00e12823          	sw	a4,16(sp)
c0009e94:	10078463          	beqz	a5,c0009f9c <stride_dequeue+0x1020>
c0009e98:	00078593          	mv	a1,a5
c0009e9c:	000d8513          	mv	a0,s11
c0009ea0:	00f12c23          	sw	a5,24(sp)
c0009ea4:	bfdfe0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c0009ea8:	01412303          	lw	t1,20(sp)
c0009eac:	01812783          	lw	a5,24(sp)
c0009eb0:	00651463          	bne	a0,t1,c0009eb8 <stride_dequeue+0xf3c>
c0009eb4:	3500106f          	j	c000b204 <stride_dequeue+0x2288>
c0009eb8:	0047a683          	lw	a3,4(a5)
c0009ebc:	0087a703          	lw	a4,8(a5)
c0009ec0:	00612c23          	sw	t1,24(sp)
c0009ec4:	00d12a23          	sw	a3,20(sp)
c0009ec8:	00071463          	bnez	a4,c0009ed0 <stride_dequeue+0xf54>
c0009ecc:	5c40106f          	j	c000b490 <stride_dequeue+0x2514>
c0009ed0:	00070593          	mv	a1,a4
c0009ed4:	000d8513          	mv	a0,s11
c0009ed8:	02f12023          	sw	a5,32(sp)
c0009edc:	00e12e23          	sw	a4,28(sp)
c0009ee0:	bc1fe0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c0009ee4:	01812303          	lw	t1,24(sp)
c0009ee8:	01c12703          	lw	a4,28(sp)
c0009eec:	02012783          	lw	a5,32(sp)
c0009ef0:	00651463          	bne	a0,t1,c0009ef8 <stride_dequeue+0xf7c>
c0009ef4:	60c0106f          	j	c000b500 <stride_dequeue+0x2584>
c0009ef8:	00872e03          	lw	t3,8(a4) # 40000008 <_binary_obj___user_matrix_out_size+0x3fffd6c0>
c0009efc:	00612c23          	sw	t1,24(sp)
c0009f00:	00472c03          	lw	s8,4(a4)
c0009f04:	000e1463          	bnez	t3,c0009f0c <stride_dequeue+0xf90>
c0009f08:	1c10106f          	j	c000b8c8 <stride_dequeue+0x294c>
c0009f0c:	000e0593          	mv	a1,t3
c0009f10:	000d8513          	mv	a0,s11
c0009f14:	02e12223          	sw	a4,36(sp)
c0009f18:	02f12023          	sw	a5,32(sp)
c0009f1c:	01c12e23          	sw	t3,28(sp)
c0009f20:	b81fe0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c0009f24:	01812303          	lw	t1,24(sp)
c0009f28:	01c12e03          	lw	t3,28(sp)
c0009f2c:	02012783          	lw	a5,32(sp)
c0009f30:	02412703          	lw	a4,36(sp)
c0009f34:	00651463          	bne	a0,t1,c0009f3c <stride_dequeue+0xfc0>
c0009f38:	2e10106f          	j	c000ba18 <stride_dequeue+0x2a9c>
c0009f3c:	008e2583          	lw	a1,8(t3)
c0009f40:	000d8513          	mv	a0,s11
c0009f44:	004e2403          	lw	s0,4(t3)
c0009f48:	02e12023          	sw	a4,32(sp)
c0009f4c:	00f12e23          	sw	a5,28(sp)
c0009f50:	01c12c23          	sw	t3,24(sp)
c0009f54:	bd9fe0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c0009f58:	01812e03          	lw	t3,24(sp)
c0009f5c:	01c12783          	lw	a5,28(sp)
c0009f60:	02012703          	lw	a4,32(sp)
c0009f64:	00ae2223          	sw	a0,4(t3)
c0009f68:	008e2423          	sw	s0,8(t3)
c0009f6c:	00050463          	beqz	a0,c0009f74 <stride_dequeue+0xff8>
c0009f70:	01c52023          	sw	t3,0(a0)
c0009f74:	008ba403          	lw	s0,8(s7)
c0009f78:	01872423          	sw	s8,8(a4)
c0009f7c:	01c72223          	sw	t3,4(a4)
c0009f80:	00ee2023          	sw	a4,0(t3)
c0009f84:	00040c13          	mv	s8,s0
c0009f88:	01412683          	lw	a3,20(sp)
c0009f8c:	00e7a223          	sw	a4,4(a5)
c0009f90:	00078d93          	mv	s11,a5
c0009f94:	00d7a423          	sw	a3,8(a5)
c0009f98:	00f72023          	sw	a5,0(a4)
c0009f9c:	01012783          	lw	a5,16(sp)
c0009fa0:	01bd2223          	sw	s11,4(s10)
c0009fa4:	00fd2423          	sw	a5,8(s10)
c0009fa8:	01ada023          	sw	s10,0(s11)
c0009fac:	01aaa223          	sw	s10,4(s5)
c0009fb0:	016aa423          	sw	s6,8(s5)
c0009fb4:	015d2023          	sw	s5,0(s10)
c0009fb8:	000a8d13          	mv	s10,s5
c0009fbc:	8bdff06f          	j	c0009878 <stride_dequeue+0x8fc>
c0009fc0:	004d2783          	lw	a5,4(s10)
c0009fc4:	008d2303          	lw	t1,8(s10)
c0009fc8:	00a12a23          	sw	a0,20(sp)
c0009fcc:	00f12823          	sw	a5,16(sp)
c0009fd0:	14030c63          	beqz	t1,c000a128 <stride_dequeue+0x11ac>
c0009fd4:	00030513          	mv	a0,t1
c0009fd8:	000b0593          	mv	a1,s6
c0009fdc:	00612c23          	sw	t1,24(sp)
c0009fe0:	ac1fe0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c0009fe4:	01412883          	lw	a7,20(sp)
c0009fe8:	01812303          	lw	t1,24(sp)
c0009fec:	01151463          	bne	a0,a7,c0009ff4 <stride_dequeue+0x1078>
c0009ff0:	23c0106f          	j	c000b22c <stride_dequeue+0x22b0>
c0009ff4:	004b2783          	lw	a5,4(s6)
c0009ff8:	008b2e03          	lw	t3,8(s6)
c0009ffc:	01112c23          	sw	a7,24(sp)
c000a000:	00f12a23          	sw	a5,20(sp)
c000a004:	000e1463          	bnez	t3,c000a00c <stride_dequeue+0x1090>
c000a008:	4680106f          	j	c000b470 <stride_dequeue+0x24f4>
c000a00c:	000e0593          	mv	a1,t3
c000a010:	00030513          	mv	a0,t1
c000a014:	03c12023          	sw	t3,32(sp)
c000a018:	00612e23          	sw	t1,28(sp)
c000a01c:	a85fe0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000a020:	01812883          	lw	a7,24(sp)
c000a024:	01c12303          	lw	t1,28(sp)
c000a028:	02012e03          	lw	t3,32(sp)
c000a02c:	01151463          	bne	a0,a7,c000a034 <stride_dequeue+0x10b8>
c000a030:	61c0106f          	j	c000b64c <stride_dequeue+0x26d0>
c000a034:	004e2783          	lw	a5,4(t3)
c000a038:	008e2c03          	lw	s8,8(t3)
c000a03c:	01112e23          	sw	a7,28(sp)
c000a040:	00f12c23          	sw	a5,24(sp)
c000a044:	000c1463          	bnez	s8,c000a04c <stride_dequeue+0x10d0>
c000a048:	0690106f          	j	c000b8b0 <stride_dequeue+0x2934>
c000a04c:	00030513          	mv	a0,t1
c000a050:	000c0593          	mv	a1,s8
c000a054:	03c12223          	sw	t3,36(sp)
c000a058:	02612023          	sw	t1,32(sp)
c000a05c:	a45fe0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000a060:	01c12883          	lw	a7,28(sp)
c000a064:	02012303          	lw	t1,32(sp)
c000a068:	02412e03          	lw	t3,36(sp)
c000a06c:	01151463          	bne	a0,a7,c000a074 <stride_dequeue+0x10f8>
c000a070:	3250106f          	j	c000bb94 <stride_dequeue+0x2c18>
c000a074:	004c2783          	lw	a5,4(s8)
c000a078:	008c2f03          	lw	t5,8(s8)
c000a07c:	03112623          	sw	a7,44(sp)
c000a080:	00f12e23          	sw	a5,28(sp)
c000a084:	060f0863          	beqz	t5,c000a0f4 <stride_dequeue+0x1178>
c000a088:	000f0593          	mv	a1,t5
c000a08c:	00030513          	mv	a0,t1
c000a090:	03c12423          	sw	t3,40(sp)
c000a094:	03e12223          	sw	t5,36(sp)
c000a098:	02612023          	sw	t1,32(sp)
c000a09c:	a05fe0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000a0a0:	02812e03          	lw	t3,40(sp)
c000a0a4:	02c12883          	lw	a7,44(sp)
c000a0a8:	02412f03          	lw	t5,36(sp)
c000a0ac:	03c12223          	sw	t3,36(sp)
c000a0b0:	02012303          	lw	t1,32(sp)
c000a0b4:	01151463          	bne	a0,a7,c000a0bc <stride_dequeue+0x1140>
c000a0b8:	5a90106f          	j	c000be60 <stride_dequeue+0x2ee4>
c000a0bc:	008f2583          	lw	a1,8(t5)
c000a0c0:	00030513          	mv	a0,t1
c000a0c4:	004f2403          	lw	s0,4(t5)
c000a0c8:	03e12023          	sw	t5,32(sp)
c000a0cc:	a61fe0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000a0d0:	02012f03          	lw	t5,32(sp)
c000a0d4:	02412e03          	lw	t3,36(sp)
c000a0d8:	00af2223          	sw	a0,4(t5)
c000a0dc:	008f2423          	sw	s0,8(t5)
c000a0e0:	00051463          	bnez	a0,c000a0e8 <stride_dequeue+0x116c>
c000a0e4:	2400206f          	j	c000c324 <stride_dequeue+0x33a8>
c000a0e8:	008ba403          	lw	s0,8(s7)
c000a0ec:	01e52023          	sw	t5,0(a0)
c000a0f0:	000f0313          	mv	t1,t5
c000a0f4:	01c12783          	lw	a5,28(sp)
c000a0f8:	006c2223          	sw	t1,4(s8)
c000a0fc:	00fc2423          	sw	a5,8(s8)
c000a100:	01832023          	sw	s8,0(t1)
c000a104:	01812783          	lw	a5,24(sp)
c000a108:	018e2223          	sw	s8,4(t3)
c000a10c:	00fe2423          	sw	a5,8(t3)
c000a110:	01cc2023          	sw	t3,0(s8)
c000a114:	00040c13          	mv	s8,s0
c000a118:	01412783          	lw	a5,20(sp)
c000a11c:	01cb2223          	sw	t3,4(s6)
c000a120:	00fb2423          	sw	a5,8(s6)
c000a124:	016e2023          	sw	s6,0(t3)
c000a128:	01012783          	lw	a5,16(sp)
c000a12c:	016d2223          	sw	s6,4(s10)
c000a130:	00fd2423          	sw	a5,8(s10)
c000a134:	01ab2023          	sw	s10,0(s6)
c000a138:	d20ff06f          	j	c0009658 <stride_dequeue+0x6dc>
c000a13c:	004aa703          	lw	a4,4(s5)
c000a140:	008aa783          	lw	a5,8(s5)
c000a144:	00e12a23          	sw	a4,20(sp)
c000a148:	12078e63          	beqz	a5,c000a284 <stride_dequeue+0x1308>
c000a14c:	00078513          	mv	a0,a5
c000a150:	000b0593          	mv	a1,s6
c000a154:	00f12c23          	sw	a5,24(sp)
c000a158:	949fe0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000a15c:	01812783          	lw	a5,24(sp)
c000a160:	01b51463          	bne	a0,s11,c000a168 <stride_dequeue+0x11ec>
c000a164:	0080106f          	j	c000b16c <stride_dequeue+0x21f0>
c000a168:	004b2703          	lw	a4,4(s6)
c000a16c:	008b2e03          	lw	t3,8(s6)
c000a170:	00e12c23          	sw	a4,24(sp)
c000a174:	000e1463          	bnez	t3,c000a17c <stride_dequeue+0x1200>
c000a178:	3100106f          	j	c000b488 <stride_dequeue+0x250c>
c000a17c:	000e0593          	mv	a1,t3
c000a180:	00078513          	mv	a0,a5
c000a184:	03c12023          	sw	t3,32(sp)
c000a188:	00f12e23          	sw	a5,28(sp)
c000a18c:	915fe0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000a190:	01c12783          	lw	a5,28(sp)
c000a194:	02012e03          	lw	t3,32(sp)
c000a198:	01b51463          	bne	a0,s11,c000a1a0 <stride_dequeue+0x1224>
c000a19c:	3c40106f          	j	c000b560 <stride_dequeue+0x25e4>
c000a1a0:	004e2703          	lw	a4,4(t3)
c000a1a4:	008e2c03          	lw	s8,8(t3)
c000a1a8:	00e12e23          	sw	a4,28(sp)
c000a1ac:	000c1463          	bnez	s8,c000a1b4 <stride_dequeue+0x1238>
c000a1b0:	63c0106f          	j	c000b7ec <stride_dequeue+0x2870>
c000a1b4:	00078513          	mv	a0,a5
c000a1b8:	000c0593          	mv	a1,s8
c000a1bc:	03c12223          	sw	t3,36(sp)
c000a1c0:	02f12023          	sw	a5,32(sp)
c000a1c4:	8ddfe0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000a1c8:	02012783          	lw	a5,32(sp)
c000a1cc:	02412e03          	lw	t3,36(sp)
c000a1d0:	01b51463          	bne	a0,s11,c000a1d8 <stride_dequeue+0x125c>
c000a1d4:	1050106f          	j	c000bad8 <stride_dequeue+0x2b5c>
c000a1d8:	004c2703          	lw	a4,4(s8)
c000a1dc:	008c2f03          	lw	t5,8(s8)
c000a1e0:	02e12023          	sw	a4,32(sp)
c000a1e4:	060f0663          	beqz	t5,c000a250 <stride_dequeue+0x12d4>
c000a1e8:	000f0593          	mv	a1,t5
c000a1ec:	00078513          	mv	a0,a5
c000a1f0:	03c12623          	sw	t3,44(sp)
c000a1f4:	03e12423          	sw	t5,40(sp)
c000a1f8:	02f12223          	sw	a5,36(sp)
c000a1fc:	8a5fe0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000a200:	02c12e03          	lw	t3,44(sp)
c000a204:	02812f03          	lw	t5,40(sp)
c000a208:	02412783          	lw	a5,36(sp)
c000a20c:	03c12423          	sw	t3,40(sp)
c000a210:	01b51463          	bne	a0,s11,c000a218 <stride_dequeue+0x129c>
c000a214:	5390106f          	j	c000bf4c <stride_dequeue+0x2fd0>
c000a218:	008f2583          	lw	a1,8(t5)
c000a21c:	00078513          	mv	a0,a5
c000a220:	004f2403          	lw	s0,4(t5)
c000a224:	03e12223          	sw	t5,36(sp)
c000a228:	905fe0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000a22c:	02412f03          	lw	t5,36(sp)
c000a230:	02812e03          	lw	t3,40(sp)
c000a234:	00af2223          	sw	a0,4(t5)
c000a238:	008f2423          	sw	s0,8(t5)
c000a23c:	00051463          	bnez	a0,c000a244 <stride_dequeue+0x12c8>
c000a240:	7690106f          	j	c000c1a8 <stride_dequeue+0x322c>
c000a244:	008ba403          	lw	s0,8(s7)
c000a248:	01e52023          	sw	t5,0(a0)
c000a24c:	000f0793          	mv	a5,t5
c000a250:	02012703          	lw	a4,32(sp)
c000a254:	00fc2223          	sw	a5,4(s8)
c000a258:	00ec2423          	sw	a4,8(s8)
c000a25c:	0187a023          	sw	s8,0(a5)
c000a260:	01c12783          	lw	a5,28(sp)
c000a264:	018e2223          	sw	s8,4(t3)
c000a268:	00fe2423          	sw	a5,8(t3)
c000a26c:	01cc2023          	sw	t3,0(s8)
c000a270:	00040c13          	mv	s8,s0
c000a274:	01812783          	lw	a5,24(sp)
c000a278:	01cb2223          	sw	t3,4(s6)
c000a27c:	00fb2423          	sw	a5,8(s6)
c000a280:	016e2023          	sw	s6,0(t3)
c000a284:	01412783          	lw	a5,20(sp)
c000a288:	016aa223          	sw	s6,4(s5)
c000a28c:	00faa423          	sw	a5,8(s5)
c000a290:	015b2023          	sw	s5,0(s6)
c000a294:	dd4ff06f          	j	c0009868 <stride_dequeue+0x8ec>
c000a298:	004aa703          	lw	a4,4(s5)
c000a29c:	008aa783          	lw	a5,8(s5)
c000a2a0:	00e12a23          	sw	a4,20(sp)
c000a2a4:	12078c63          	beqz	a5,c000a3dc <stride_dequeue+0x1460>
c000a2a8:	00078513          	mv	a0,a5
c000a2ac:	000b0593          	mv	a1,s6
c000a2b0:	00f12c23          	sw	a5,24(sp)
c000a2b4:	fecfe0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000a2b8:	01812783          	lw	a5,24(sp)
c000a2bc:	65b500e3          	beq	a0,s11,c000b0fc <stride_dequeue+0x2180>
c000a2c0:	004b2703          	lw	a4,4(s6)
c000a2c4:	008b2e03          	lw	t3,8(s6)
c000a2c8:	00e12c23          	sw	a4,24(sp)
c000a2cc:	000e1463          	bnez	t3,c000a2d4 <stride_dequeue+0x1358>
c000a2d0:	1a80106f          	j	c000b478 <stride_dequeue+0x24fc>
c000a2d4:	000e0593          	mv	a1,t3
c000a2d8:	00078513          	mv	a0,a5
c000a2dc:	03c12023          	sw	t3,32(sp)
c000a2e0:	00f12e23          	sw	a5,28(sp)
c000a2e4:	fbcfe0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000a2e8:	01c12783          	lw	a5,28(sp)
c000a2ec:	02012e03          	lw	t3,32(sp)
c000a2f0:	01b51463          	bne	a0,s11,c000a2f8 <stride_dequeue+0x137c>
c000a2f4:	29c0106f          	j	c000b590 <stride_dequeue+0x2614>
c000a2f8:	004e2703          	lw	a4,4(t3)
c000a2fc:	008e2c03          	lw	s8,8(t3)
c000a300:	00e12e23          	sw	a4,28(sp)
c000a304:	000c1463          	bnez	s8,c000a30c <stride_dequeue+0x1390>
c000a308:	5b40106f          	j	c000b8bc <stride_dequeue+0x2940>
c000a30c:	00078513          	mv	a0,a5
c000a310:	000c0593          	mv	a1,s8
c000a314:	03c12223          	sw	t3,36(sp)
c000a318:	02f12023          	sw	a5,32(sp)
c000a31c:	f84fe0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000a320:	02012783          	lw	a5,32(sp)
c000a324:	02412e03          	lw	t3,36(sp)
c000a328:	01b51463          	bne	a0,s11,c000a330 <stride_dequeue+0x13b4>
c000a32c:	0e10106f          	j	c000bc0c <stride_dequeue+0x2c90>
c000a330:	004c2703          	lw	a4,4(s8)
c000a334:	008c2f03          	lw	t5,8(s8)
c000a338:	02e12023          	sw	a4,32(sp)
c000a33c:	060f0663          	beqz	t5,c000a3a8 <stride_dequeue+0x142c>
c000a340:	000f0593          	mv	a1,t5
c000a344:	00078513          	mv	a0,a5
c000a348:	03c12623          	sw	t3,44(sp)
c000a34c:	03e12423          	sw	t5,40(sp)
c000a350:	02f12223          	sw	a5,36(sp)
c000a354:	f4cfe0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000a358:	02c12e03          	lw	t3,44(sp)
c000a35c:	02812f03          	lw	t5,40(sp)
c000a360:	02412783          	lw	a5,36(sp)
c000a364:	03c12423          	sw	t3,40(sp)
c000a368:	01b51463          	bne	a0,s11,c000a370 <stride_dequeue+0x13f4>
c000a36c:	3850106f          	j	c000bef0 <stride_dequeue+0x2f74>
c000a370:	008f2583          	lw	a1,8(t5)
c000a374:	00078513          	mv	a0,a5
c000a378:	004f2403          	lw	s0,4(t5)
c000a37c:	03e12223          	sw	t5,36(sp)
c000a380:	facfe0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000a384:	02412f03          	lw	t5,36(sp)
c000a388:	02812e03          	lw	t3,40(sp)
c000a38c:	00af2223          	sw	a0,4(t5)
c000a390:	008f2423          	sw	s0,8(t5)
c000a394:	00051463          	bnez	a0,c000a39c <stride_dequeue+0x1420>
c000a398:	5610106f          	j	c000c0f8 <stride_dequeue+0x317c>
c000a39c:	008ba403          	lw	s0,8(s7)
c000a3a0:	01e52023          	sw	t5,0(a0)
c000a3a4:	000f0793          	mv	a5,t5
c000a3a8:	02012703          	lw	a4,32(sp)
c000a3ac:	00fc2223          	sw	a5,4(s8)
c000a3b0:	00ec2423          	sw	a4,8(s8)
c000a3b4:	0187a023          	sw	s8,0(a5)
c000a3b8:	01c12783          	lw	a5,28(sp)
c000a3bc:	018e2223          	sw	s8,4(t3)
c000a3c0:	00fe2423          	sw	a5,8(t3)
c000a3c4:	01cc2023          	sw	t3,0(s8)
c000a3c8:	00040c13          	mv	s8,s0
c000a3cc:	01812783          	lw	a5,24(sp)
c000a3d0:	01cb2223          	sw	t3,4(s6)
c000a3d4:	00fb2423          	sw	a5,8(s6)
c000a3d8:	016e2023          	sw	s6,0(t3)
c000a3dc:	01412783          	lw	a5,20(sp)
c000a3e0:	016aa223          	sw	s6,4(s5)
c000a3e4:	00faa423          	sw	a5,8(s5)
c000a3e8:	015b2023          	sw	s5,0(s6)
c000a3ec:	000a8b13          	mv	s6,s5
c000a3f0:	85cff06f          	j	c000944c <stride_dequeue+0x4d0>
c000a3f4:	008b2d83          	lw	s11,8(s6)
c000a3f8:	004b2a83          	lw	s5,4(s6)
c000a3fc:	120d8663          	beqz	s11,c000a528 <stride_dequeue+0x15ac>
c000a400:	00098593          	mv	a1,s3
c000a404:	000d8513          	mv	a0,s11
c000a408:	e98fe0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000a40c:	fff00313          	li	t1,-1
c000a410:	00050c13          	mv	s8,a0
c000a414:	6c6500e3          	beq	a0,t1,c000b2d4 <stride_dequeue+0x2358>
c000a418:	0049a783          	lw	a5,4(s3)
c000a41c:	0089ac03          	lw	s8,8(s3)
c000a420:	00612a23          	sw	t1,20(sp)
c000a424:	00f12823          	sw	a5,16(sp)
c000a428:	000c1463          	bnez	s8,c000a430 <stride_dequeue+0x14b4>
c000a42c:	2900106f          	j	c000b6bc <stride_dequeue+0x2740>
c000a430:	000c0593          	mv	a1,s8
c000a434:	000d8513          	mv	a0,s11
c000a438:	e68fe0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000a43c:	01412303          	lw	t1,20(sp)
c000a440:	00651463          	bne	a0,t1,c000a448 <stride_dequeue+0x14cc>
c000a444:	2980106f          	j	c000b6dc <stride_dequeue+0x2760>
c000a448:	004c2783          	lw	a5,4(s8)
c000a44c:	008c2883          	lw	a7,8(s8)
c000a450:	00612c23          	sw	t1,24(sp)
c000a454:	00f12a23          	sw	a5,20(sp)
c000a458:	00089463          	bnez	a7,c000a460 <stride_dequeue+0x14e4>
c000a45c:	7300106f          	j	c000bb8c <stride_dequeue+0x2c10>
c000a460:	00088593          	mv	a1,a7
c000a464:	000d8513          	mv	a0,s11
c000a468:	01112e23          	sw	a7,28(sp)
c000a46c:	e34fe0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000a470:	01812303          	lw	t1,24(sp)
c000a474:	01c12883          	lw	a7,28(sp)
c000a478:	00651463          	bne	a0,t1,c000a480 <stride_dequeue+0x1504>
c000a47c:	1890106f          	j	c000be04 <stride_dequeue+0x2e88>
c000a480:	0048a783          	lw	a5,4(a7)
c000a484:	0088ae03          	lw	t3,8(a7)
c000a488:	02612223          	sw	t1,36(sp)
c000a48c:	00f12c23          	sw	a5,24(sp)
c000a490:	060e0463          	beqz	t3,c000a4f8 <stride_dequeue+0x157c>
c000a494:	000e0593          	mv	a1,t3
c000a498:	000d8513          	mv	a0,s11
c000a49c:	03112023          	sw	a7,32(sp)
c000a4a0:	01c12e23          	sw	t3,28(sp)
c000a4a4:	dfcfe0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000a4a8:	02412303          	lw	t1,36(sp)
c000a4ac:	01c12e03          	lw	t3,28(sp)
c000a4b0:	02012883          	lw	a7,32(sp)
c000a4b4:	00651463          	bne	a0,t1,c000a4bc <stride_dequeue+0x1540>
c000a4b8:	3710106f          	j	c000c028 <stride_dequeue+0x30ac>
c000a4bc:	008e2583          	lw	a1,8(t3)
c000a4c0:	000d8513          	mv	a0,s11
c000a4c4:	004e2403          	lw	s0,4(t3)
c000a4c8:	03112023          	sw	a7,32(sp)
c000a4cc:	01c12e23          	sw	t3,28(sp)
c000a4d0:	e5cfe0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000a4d4:	01c12e03          	lw	t3,28(sp)
c000a4d8:	02012883          	lw	a7,32(sp)
c000a4dc:	00ae2223          	sw	a0,4(t3)
c000a4e0:	008e2423          	sw	s0,8(t3)
c000a4e4:	00051463          	bnez	a0,c000a4ec <stride_dequeue+0x1570>
c000a4e8:	3c50106f          	j	c000c0ac <stride_dequeue+0x3130>
c000a4ec:	008ba403          	lw	s0,8(s7)
c000a4f0:	01c52023          	sw	t3,0(a0)
c000a4f4:	000e0d93          	mv	s11,t3
c000a4f8:	01812783          	lw	a5,24(sp)
c000a4fc:	01b8a223          	sw	s11,4(a7)
c000a500:	00f8a423          	sw	a5,8(a7)
c000a504:	011da023          	sw	a7,0(s11)
c000a508:	01412783          	lw	a5,20(sp)
c000a50c:	011c2223          	sw	a7,4(s8)
c000a510:	00fc2423          	sw	a5,8(s8)
c000a514:	0188a023          	sw	s8,0(a7)
c000a518:	01012783          	lw	a5,16(sp)
c000a51c:	0189a223          	sw	s8,4(s3)
c000a520:	00f9a423          	sw	a5,8(s3)
c000a524:	013c2023          	sw	s3,0(s8)
c000a528:	013b2223          	sw	s3,4(s6)
c000a52c:	015b2423          	sw	s5,8(s6)
c000a530:	0169a023          	sw	s6,0(s3)
c000a534:	00040c13          	mv	s8,s0
c000a538:	000b0993          	mv	s3,s6
c000a53c:	e4cff06f          	j	c0009b88 <stride_dequeue+0xc0c>
c000a540:	008ca783          	lw	a5,8(s9)
c000a544:	00a12e23          	sw	a0,28(sp)
c000a548:	004cac03          	lw	s8,4(s9)
c000a54c:	04078a63          	beqz	a5,c000a5a0 <stride_dequeue+0x1624>
c000a550:	000e0593          	mv	a1,t3
c000a554:	00078513          	mv	a0,a5
c000a558:	03c12223          	sw	t3,36(sp)
c000a55c:	02f12023          	sw	a5,32(sp)
c000a560:	d40fe0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000a564:	01c12703          	lw	a4,28(sp)
c000a568:	02012783          	lw	a5,32(sp)
c000a56c:	02412e03          	lw	t3,36(sp)
c000a570:	5ce504e3          	beq	a0,a4,c000b338 <stride_dequeue+0x23bc>
c000a574:	008e2583          	lw	a1,8(t3)
c000a578:	00078513          	mv	a0,a5
c000a57c:	004e2403          	lw	s0,4(t3)
c000a580:	01c12e23          	sw	t3,28(sp)
c000a584:	da8fe0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000a588:	01c12e03          	lw	t3,28(sp)
c000a58c:	00ae2223          	sw	a0,4(t3)
c000a590:	008e2423          	sw	s0,8(t3)
c000a594:	00050463          	beqz	a0,c000a59c <stride_dequeue+0x1620>
c000a598:	01c52023          	sw	t3,0(a0)
c000a59c:	008ba403          	lw	s0,8(s7)
c000a5a0:	018ca423          	sw	s8,8(s9)
c000a5a4:	01cca223          	sw	t3,4(s9)
c000a5a8:	019e2023          	sw	s9,0(t3)
c000a5ac:	00040c13          	mv	s8,s0
c000a5b0:	c49fe06f          	j	c00091f8 <stride_dequeue+0x27c>
c000a5b4:	004aa783          	lw	a5,4(s5)
c000a5b8:	008aac03          	lw	s8,8(s5)
c000a5bc:	00a12e23          	sw	a0,28(sp)
c000a5c0:	00f12c23          	sw	a5,24(sp)
c000a5c4:	180c0e63          	beqz	s8,c000a760 <stride_dequeue+0x17e4>
c000a5c8:	000d8593          	mv	a1,s11
c000a5cc:	000c0513          	mv	a0,s8
c000a5d0:	cd0fe0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000a5d4:	01c12783          	lw	a5,28(sp)
c000a5d8:	00f51463          	bne	a0,a5,c000a5e0 <stride_dequeue+0x1664>
c000a5dc:	7590006f          	j	c000b534 <stride_dequeue+0x25b8>
c000a5e0:	02f12023          	sw	a5,32(sp)
c000a5e4:	004da783          	lw	a5,4(s11)
c000a5e8:	008daf03          	lw	t5,8(s11)
c000a5ec:	00f12e23          	sw	a5,28(sp)
c000a5f0:	000f1463          	bnez	t5,c000a5f8 <stride_dequeue+0x167c>
c000a5f4:	35c0106f          	j	c000b950 <stride_dequeue+0x29d4>
c000a5f8:	000f0593          	mv	a1,t5
c000a5fc:	000c0513          	mv	a0,s8
c000a600:	03e12223          	sw	t5,36(sp)
c000a604:	c9cfe0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000a608:	02012783          	lw	a5,32(sp)
c000a60c:	02412f03          	lw	t5,36(sp)
c000a610:	00f51463          	bne	a0,a5,c000a618 <stride_dequeue+0x169c>
c000a614:	4f80106f          	j	c000bb0c <stride_dequeue+0x2b90>
c000a618:	02f12623          	sw	a5,44(sp)
c000a61c:	004f2703          	lw	a4,4(t5)
c000a620:	008f2783          	lw	a5,8(t5)
c000a624:	02e12223          	sw	a4,36(sp)
c000a628:	02f12023          	sw	a5,32(sp)
c000a62c:	10078a63          	beqz	a5,c000a740 <stride_dequeue+0x17c4>
c000a630:	00078593          	mv	a1,a5
c000a634:	000c0513          	mv	a0,s8
c000a638:	03e12423          	sw	t5,40(sp)
c000a63c:	c64fe0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000a640:	02c12783          	lw	a5,44(sp)
c000a644:	02812f03          	lw	t5,40(sp)
c000a648:	00f51463          	bne	a0,a5,c000a650 <stride_dequeue+0x16d4>
c000a64c:	1310106f          	j	c000bf7c <stride_dequeue+0x3000>
c000a650:	02012783          	lw	a5,32(sp)
c000a654:	0087a283          	lw	t0,8(a5)
c000a658:	0047a783          	lw	a5,4(a5)
c000a65c:	02f12423          	sw	a5,40(sp)
c000a660:	0c028463          	beqz	t0,c000a728 <stride_dequeue+0x17ac>
c000a664:	00028593          	mv	a1,t0
c000a668:	000c0513          	mv	a0,s8
c000a66c:	03e12823          	sw	t5,48(sp)
c000a670:	02512623          	sw	t0,44(sp)
c000a674:	c2cfe0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000a678:	fff00393          	li	t2,-1
c000a67c:	02c12283          	lw	t0,44(sp)
c000a680:	03012f03          	lw	t5,48(sp)
c000a684:	00751463          	bne	a0,t2,c000a68c <stride_dequeue+0x1710>
c000a688:	32d0106f          	j	c000c1b4 <stride_dequeue+0x3238>
c000a68c:	0042a783          	lw	a5,4(t0)
c000a690:	0082af83          	lw	t6,8(t0)
c000a694:	02712e23          	sw	t2,60(sp)
c000a698:	02f12623          	sw	a5,44(sp)
c000a69c:	060f8c63          	beqz	t6,c000a714 <stride_dequeue+0x1798>
c000a6a0:	000f8593          	mv	a1,t6
c000a6a4:	000c0513          	mv	a0,s8
c000a6a8:	02512c23          	sw	t0,56(sp)
c000a6ac:	03e12a23          	sw	t5,52(sp)
c000a6b0:	03f12823          	sw	t6,48(sp)
c000a6b4:	becfe0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000a6b8:	03c12383          	lw	t2,60(sp)
c000a6bc:	03012f83          	lw	t6,48(sp)
c000a6c0:	03412f03          	lw	t5,52(sp)
c000a6c4:	03812283          	lw	t0,56(sp)
c000a6c8:	00751463          	bne	a0,t2,c000a6d0 <stride_dequeue+0x1754>
c000a6cc:	4d50106f          	j	c000c3a0 <stride_dequeue+0x3424>
c000a6d0:	008fa583          	lw	a1,8(t6)
c000a6d4:	000c0513          	mv	a0,s8
c000a6d8:	004fa403          	lw	s0,4(t6)
c000a6dc:	02512c23          	sw	t0,56(sp)
c000a6e0:	03e12a23          	sw	t5,52(sp)
c000a6e4:	03f12823          	sw	t6,48(sp)
c000a6e8:	c44fe0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000a6ec:	03012f83          	lw	t6,48(sp)
c000a6f0:	03412f03          	lw	t5,52(sp)
c000a6f4:	03812283          	lw	t0,56(sp)
c000a6f8:	00afa223          	sw	a0,4(t6)
c000a6fc:	008fa423          	sw	s0,8(t6)
c000a700:	00051463          	bnez	a0,c000a708 <stride_dequeue+0x178c>
c000a704:	5290106f          	j	c000c42c <stride_dequeue+0x34b0>
c000a708:	008ba403          	lw	s0,8(s7)
c000a70c:	01f52023          	sw	t6,0(a0)
c000a710:	000f8c13          	mv	s8,t6
c000a714:	02c12783          	lw	a5,44(sp)
c000a718:	0182a223          	sw	s8,4(t0)
c000a71c:	00f2a423          	sw	a5,8(t0)
c000a720:	005c2023          	sw	t0,0(s8)
c000a724:	00028c13          	mv	s8,t0
c000a728:	02012783          	lw	a5,32(sp)
c000a72c:	02812703          	lw	a4,40(sp)
c000a730:	0187a223          	sw	s8,4(a5)
c000a734:	00e7a423          	sw	a4,8(a5)
c000a738:	00fc2023          	sw	a5,0(s8)
c000a73c:	00078c13          	mv	s8,a5
c000a740:	02412783          	lw	a5,36(sp)
c000a744:	018f2223          	sw	s8,4(t5)
c000a748:	00ff2423          	sw	a5,8(t5)
c000a74c:	01ec2023          	sw	t5,0(s8)
c000a750:	01c12783          	lw	a5,28(sp)
c000a754:	01eda223          	sw	t5,4(s11)
c000a758:	00fda423          	sw	a5,8(s11)
c000a75c:	01bf2023          	sw	s11,0(t5)
c000a760:	01812783          	lw	a5,24(sp)
c000a764:	01baa223          	sw	s11,4(s5)
c000a768:	00040c13          	mv	s8,s0
c000a76c:	00faa423          	sw	a5,8(s5)
c000a770:	015da023          	sw	s5,0(s11)
c000a774:	cc9fe06f          	j	c000943c <stride_dequeue+0x4c0>
c000a778:	004aa783          	lw	a5,4(s5)
c000a77c:	008aac03          	lw	s8,8(s5)
c000a780:	00f12c23          	sw	a5,24(sp)
c000a784:	180c0c63          	beqz	s8,c000a91c <stride_dequeue+0x19a0>
c000a788:	000e0593          	mv	a1,t3
c000a78c:	000c0513          	mv	a0,s8
c000a790:	b10fe0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000a794:	01c12e03          	lw	t3,28(sp)
c000a798:	63b504e3          	beq	a0,s11,c000b5c0 <stride_dequeue+0x2644>
c000a79c:	004e2783          	lw	a5,4(t3)
c000a7a0:	008e2f03          	lw	t5,8(t3)
c000a7a4:	00f12e23          	sw	a5,28(sp)
c000a7a8:	000f1463          	bnez	t5,c000a7b0 <stride_dequeue+0x1834>
c000a7ac:	19c0106f          	j	c000b948 <stride_dequeue+0x29cc>
c000a7b0:	000f0593          	mv	a1,t5
c000a7b4:	000c0513          	mv	a0,s8
c000a7b8:	03c12223          	sw	t3,36(sp)
c000a7bc:	03e12023          	sw	t5,32(sp)
c000a7c0:	ae0fe0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000a7c4:	02012f03          	lw	t5,32(sp)
c000a7c8:	02412e03          	lw	t3,36(sp)
c000a7cc:	01b51463          	bne	a0,s11,c000a7d4 <stride_dequeue+0x1858>
c000a7d0:	2840106f          	j	c000ba54 <stride_dequeue+0x2ad8>
c000a7d4:	008f2783          	lw	a5,8(t5)
c000a7d8:	004f2703          	lw	a4,4(t5)
c000a7dc:	02f12023          	sw	a5,32(sp)
c000a7e0:	02e12223          	sw	a4,36(sp)
c000a7e4:	10078c63          	beqz	a5,c000a8fc <stride_dequeue+0x1980>
c000a7e8:	00078593          	mv	a1,a5
c000a7ec:	000c0513          	mv	a0,s8
c000a7f0:	03e12623          	sw	t5,44(sp)
c000a7f4:	03c12423          	sw	t3,40(sp)
c000a7f8:	aa8fe0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000a7fc:	02812e03          	lw	t3,40(sp)
c000a800:	02c12f03          	lw	t5,44(sp)
c000a804:	01b51463          	bne	a0,s11,c000a80c <stride_dequeue+0x1890>
c000a808:	6280106f          	j	c000be30 <stride_dequeue+0x2eb4>
c000a80c:	02012783          	lw	a5,32(sp)
c000a810:	0087ad83          	lw	s11,8(a5)
c000a814:	0047a783          	lw	a5,4(a5)
c000a818:	02f12423          	sw	a5,40(sp)
c000a81c:	0c0d8463          	beqz	s11,c000a8e4 <stride_dequeue+0x1968>
c000a820:	000d8593          	mv	a1,s11
c000a824:	000c0513          	mv	a0,s8
c000a828:	03e12823          	sw	t5,48(sp)
c000a82c:	03c12623          	sw	t3,44(sp)
c000a830:	a70fe0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000a834:	fff00393          	li	t2,-1
c000a838:	02c12e03          	lw	t3,44(sp)
c000a83c:	03012f03          	lw	t5,48(sp)
c000a840:	00751463          	bne	a0,t2,c000a848 <stride_dequeue+0x18cc>
c000a844:	2ed0106f          	j	c000c330 <stride_dequeue+0x33b4>
c000a848:	004da783          	lw	a5,4(s11)
c000a84c:	008daf83          	lw	t6,8(s11)
c000a850:	02712e23          	sw	t2,60(sp)
c000a854:	02f12623          	sw	a5,44(sp)
c000a858:	060f8c63          	beqz	t6,c000a8d0 <stride_dequeue+0x1954>
c000a85c:	000f8593          	mv	a1,t6
c000a860:	000c0513          	mv	a0,s8
c000a864:	03e12c23          	sw	t5,56(sp)
c000a868:	03c12a23          	sw	t3,52(sp)
c000a86c:	03f12823          	sw	t6,48(sp)
c000a870:	a30fe0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000a874:	03c12383          	lw	t2,60(sp)
c000a878:	03012f83          	lw	t6,48(sp)
c000a87c:	03412e03          	lw	t3,52(sp)
c000a880:	03812f03          	lw	t5,56(sp)
c000a884:	00751463          	bne	a0,t2,c000a88c <stride_dequeue+0x1910>
c000a888:	0e90106f          	j	c000c170 <stride_dequeue+0x31f4>
c000a88c:	008fa583          	lw	a1,8(t6)
c000a890:	000c0513          	mv	a0,s8
c000a894:	004fa403          	lw	s0,4(t6)
c000a898:	03e12c23          	sw	t5,56(sp)
c000a89c:	03c12a23          	sw	t3,52(sp)
c000a8a0:	03f12823          	sw	t6,48(sp)
c000a8a4:	a88fe0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000a8a8:	03012f83          	lw	t6,48(sp)
c000a8ac:	03412e03          	lw	t3,52(sp)
c000a8b0:	03812f03          	lw	t5,56(sp)
c000a8b4:	00afa223          	sw	a0,4(t6)
c000a8b8:	008fa423          	sw	s0,8(t6)
c000a8bc:	00051463          	bnez	a0,c000a8c4 <stride_dequeue+0x1948>
c000a8c0:	3cd0106f          	j	c000c48c <stride_dequeue+0x3510>
c000a8c4:	008ba403          	lw	s0,8(s7)
c000a8c8:	01f52023          	sw	t6,0(a0)
c000a8cc:	000f8c13          	mv	s8,t6
c000a8d0:	02c12783          	lw	a5,44(sp)
c000a8d4:	018da223          	sw	s8,4(s11)
c000a8d8:	00fda423          	sw	a5,8(s11)
c000a8dc:	01bc2023          	sw	s11,0(s8)
c000a8e0:	000d8c13          	mv	s8,s11
c000a8e4:	02012783          	lw	a5,32(sp)
c000a8e8:	02812703          	lw	a4,40(sp)
c000a8ec:	0187a223          	sw	s8,4(a5)
c000a8f0:	00e7a423          	sw	a4,8(a5)
c000a8f4:	00fc2023          	sw	a5,0(s8)
c000a8f8:	00078c13          	mv	s8,a5
c000a8fc:	02412783          	lw	a5,36(sp)
c000a900:	018f2223          	sw	s8,4(t5)
c000a904:	00ff2423          	sw	a5,8(t5)
c000a908:	01ec2023          	sw	t5,0(s8)
c000a90c:	01c12783          	lw	a5,28(sp)
c000a910:	01ee2223          	sw	t5,4(t3)
c000a914:	00fe2423          	sw	a5,8(t3)
c000a918:	01cf2023          	sw	t3,0(t5)
c000a91c:	01812783          	lw	a5,24(sp)
c000a920:	01caa223          	sw	t3,4(s5)
c000a924:	00040c13          	mv	s8,s0
c000a928:	00faa423          	sw	a5,8(s5)
c000a92c:	015e2023          	sw	s5,0(t3)
c000a930:	f25fe06f          	j	c0009854 <stride_dequeue+0x8d8>
c000a934:	004d2783          	lw	a5,4(s10)
c000a938:	008d2c03          	lw	s8,8(s10)
c000a93c:	00a12c23          	sw	a0,24(sp)
c000a940:	00f12a23          	sw	a5,20(sp)
c000a944:	040c0663          	beqz	s8,c000a990 <stride_dequeue+0x1a14>
c000a948:	00088593          	mv	a1,a7
c000a94c:	000c0513          	mv	a0,s8
c000a950:	01112e23          	sw	a7,28(sp)
c000a954:	94cfe0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000a958:	01812783          	lw	a5,24(sp)
c000a95c:	01c12883          	lw	a7,28(sp)
c000a960:	4cf500e3          	beq	a0,a5,c000b620 <stride_dequeue+0x26a4>
c000a964:	0088a583          	lw	a1,8(a7)
c000a968:	000c0513          	mv	a0,s8
c000a96c:	0048a403          	lw	s0,4(a7)
c000a970:	01112c23          	sw	a7,24(sp)
c000a974:	9b8fe0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000a978:	01812883          	lw	a7,24(sp)
c000a97c:	00a8a223          	sw	a0,4(a7)
c000a980:	0088a423          	sw	s0,8(a7)
c000a984:	00050463          	beqz	a0,c000a98c <stride_dequeue+0x1a10>
c000a988:	01152023          	sw	a7,0(a0)
c000a98c:	008ba403          	lw	s0,8(s7)
c000a990:	01412783          	lw	a5,20(sp)
c000a994:	011d2223          	sw	a7,4(s10)
c000a998:	00040c13          	mv	s8,s0
c000a99c:	00fd2423          	sw	a5,8(s10)
c000a9a0:	01a8a023          	sw	s10,0(a7)
c000a9a4:	ca1fe06f          	j	c0009644 <stride_dequeue+0x6c8>
c000a9a8:	004e2783          	lw	a5,4(t3)
c000a9ac:	008e2d83          	lw	s11,8(t3)
c000a9b0:	00a12e23          	sw	a0,28(sp)
c000a9b4:	00f12c23          	sw	a5,24(sp)
c000a9b8:	1a0d8063          	beqz	s11,c000ab58 <stride_dequeue+0x1bdc>
c000a9bc:	000a8593          	mv	a1,s5
c000a9c0:	000d8513          	mv	a0,s11
c000a9c4:	03c12023          	sw	t3,32(sp)
c000a9c8:	8d8fe0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000a9cc:	01c12783          	lw	a5,28(sp)
c000a9d0:	02012e03          	lw	t3,32(sp)
c000a9d4:	40f50ce3          	beq	a0,a5,c000b5ec <stride_dequeue+0x2670>
c000a9d8:	02f12023          	sw	a5,32(sp)
c000a9dc:	004aa783          	lw	a5,4(s5)
c000a9e0:	008aac03          	lw	s8,8(s5)
c000a9e4:	00f12e23          	sw	a5,28(sp)
c000a9e8:	000c1463          	bnez	s8,c000a9f0 <stride_dequeue+0x1a74>
c000a9ec:	76d0006f          	j	c000b958 <stride_dequeue+0x29dc>
c000a9f0:	000c0593          	mv	a1,s8
c000a9f4:	000d8513          	mv	a0,s11
c000a9f8:	03c12223          	sw	t3,36(sp)
c000a9fc:	8a4fe0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000aa00:	02012783          	lw	a5,32(sp)
c000aa04:	02412e03          	lw	t3,36(sp)
c000aa08:	00f51463          	bne	a0,a5,c000aa10 <stride_dequeue+0x1a94>
c000aa0c:	7550006f          	j	c000b960 <stride_dequeue+0x29e4>
c000aa10:	02f12623          	sw	a5,44(sp)
c000aa14:	004c2703          	lw	a4,4(s8)
c000aa18:	008c2783          	lw	a5,8(s8)
c000aa1c:	02e12223          	sw	a4,36(sp)
c000aa20:	02f12023          	sw	a5,32(sp)
c000aa24:	10078a63          	beqz	a5,c000ab38 <stride_dequeue+0x1bbc>
c000aa28:	00078593          	mv	a1,a5
c000aa2c:	000d8513          	mv	a0,s11
c000aa30:	03c12423          	sw	t3,40(sp)
c000aa34:	86cfe0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000aa38:	02c12783          	lw	a5,44(sp)
c000aa3c:	02812e03          	lw	t3,40(sp)
c000aa40:	00f51463          	bne	a0,a5,c000aa48 <stride_dequeue+0x1acc>
c000aa44:	4dc0106f          	j	c000bf20 <stride_dequeue+0x2fa4>
c000aa48:	02012783          	lw	a5,32(sp)
c000aa4c:	0087a283          	lw	t0,8(a5)
c000aa50:	0047a783          	lw	a5,4(a5)
c000aa54:	02f12423          	sw	a5,40(sp)
c000aa58:	0c028463          	beqz	t0,c000ab20 <stride_dequeue+0x1ba4>
c000aa5c:	00028593          	mv	a1,t0
c000aa60:	000d8513          	mv	a0,s11
c000aa64:	03c12823          	sw	t3,48(sp)
c000aa68:	02512623          	sw	t0,44(sp)
c000aa6c:	834fe0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000aa70:	fff00393          	li	t2,-1
c000aa74:	02c12283          	lw	t0,44(sp)
c000aa78:	03012e03          	lw	t3,48(sp)
c000aa7c:	00751463          	bne	a0,t2,c000aa84 <stride_dequeue+0x1b08>
c000aa80:	6840106f          	j	c000c104 <stride_dequeue+0x3188>
c000aa84:	0042a783          	lw	a5,4(t0)
c000aa88:	0082af83          	lw	t6,8(t0)
c000aa8c:	02712e23          	sw	t2,60(sp)
c000aa90:	02f12623          	sw	a5,44(sp)
c000aa94:	060f8c63          	beqz	t6,c000ab0c <stride_dequeue+0x1b90>
c000aa98:	000f8593          	mv	a1,t6
c000aa9c:	000d8513          	mv	a0,s11
c000aaa0:	02512c23          	sw	t0,56(sp)
c000aaa4:	03c12a23          	sw	t3,52(sp)
c000aaa8:	03f12823          	sw	t6,48(sp)
c000aaac:	ff5fd0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000aab0:	03c12383          	lw	t2,60(sp)
c000aab4:	03012f83          	lw	t6,48(sp)
c000aab8:	03412e03          	lw	t3,52(sp)
c000aabc:	03812283          	lw	t0,56(sp)
c000aac0:	00751463          	bne	a0,t2,c000aac8 <stride_dequeue+0x1b4c>
c000aac4:	7380106f          	j	c000c1fc <stride_dequeue+0x3280>
c000aac8:	008fa583          	lw	a1,8(t6)
c000aacc:	000d8513          	mv	a0,s11
c000aad0:	004fa403          	lw	s0,4(t6)
c000aad4:	02512c23          	sw	t0,56(sp)
c000aad8:	03c12a23          	sw	t3,52(sp)
c000aadc:	03f12823          	sw	t6,48(sp)
c000aae0:	84cfe0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000aae4:	03012f83          	lw	t6,48(sp)
c000aae8:	03412e03          	lw	t3,52(sp)
c000aaec:	03812283          	lw	t0,56(sp)
c000aaf0:	00afa223          	sw	a0,4(t6)
c000aaf4:	008fa423          	sw	s0,8(t6)
c000aaf8:	00051463          	bnez	a0,c000ab00 <stride_dequeue+0x1b84>
c000aafc:	1550106f          	j	c000c450 <stride_dequeue+0x34d4>
c000ab00:	008ba403          	lw	s0,8(s7)
c000ab04:	01f52023          	sw	t6,0(a0)
c000ab08:	000f8d93          	mv	s11,t6
c000ab0c:	02c12783          	lw	a5,44(sp)
c000ab10:	01b2a223          	sw	s11,4(t0)
c000ab14:	00f2a423          	sw	a5,8(t0)
c000ab18:	005da023          	sw	t0,0(s11)
c000ab1c:	00028d93          	mv	s11,t0
c000ab20:	02012783          	lw	a5,32(sp)
c000ab24:	02812703          	lw	a4,40(sp)
c000ab28:	01b7a223          	sw	s11,4(a5)
c000ab2c:	00e7a423          	sw	a4,8(a5)
c000ab30:	00fda023          	sw	a5,0(s11)
c000ab34:	00078d93          	mv	s11,a5
c000ab38:	02412783          	lw	a5,36(sp)
c000ab3c:	01bc2223          	sw	s11,4(s8)
c000ab40:	00fc2423          	sw	a5,8(s8)
c000ab44:	018da023          	sw	s8,0(s11)
c000ab48:	01c12783          	lw	a5,28(sp)
c000ab4c:	018aa223          	sw	s8,4(s5)
c000ab50:	00faa423          	sw	a5,8(s5)
c000ab54:	015c2023          	sw	s5,0(s8)
c000ab58:	01812783          	lw	a5,24(sp)
c000ab5c:	015e2223          	sw	s5,4(t3)
c000ab60:	00040c13          	mv	s8,s0
c000ab64:	00fe2423          	sw	a5,8(t3)
c000ab68:	01caa023          	sw	t3,0(s5)
c000ab6c:	000e0a93          	mv	s5,t3
c000ab70:	980ff06f          	j	c0009cf0 <stride_dequeue+0xd74>
c000ab74:	004da783          	lw	a5,4(s11)
c000ab78:	008dac03          	lw	s8,8(s11)
c000ab7c:	00a12a23          	sw	a0,20(sp)
c000ab80:	00f12823          	sw	a5,16(sp)
c000ab84:	020c0e63          	beqz	s8,c000abc0 <stride_dequeue+0x1c44>
c000ab88:	000d0593          	mv	a1,s10
c000ab8c:	000c0513          	mv	a0,s8
c000ab90:	f11fd0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000ab94:	01412783          	lw	a5,20(sp)
c000ab98:	38f50ae3          	beq	a0,a5,c000b72c <stride_dequeue+0x27b0>
c000ab9c:	008d2583          	lw	a1,8(s10)
c000aba0:	004d2403          	lw	s0,4(s10)
c000aba4:	000c0513          	mv	a0,s8
c000aba8:	f85fd0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000abac:	00ad2223          	sw	a0,4(s10)
c000abb0:	008d2423          	sw	s0,8(s10)
c000abb4:	00050463          	beqz	a0,c000abbc <stride_dequeue+0x1c40>
c000abb8:	01a52023          	sw	s10,0(a0)
c000abbc:	008ba403          	lw	s0,8(s7)
c000abc0:	01012783          	lw	a5,16(sp)
c000abc4:	01ada223          	sw	s10,4(s11)
c000abc8:	00040c13          	mv	s8,s0
c000abcc:	00fda423          	sw	a5,8(s11)
c000abd0:	01bd2023          	sw	s11,0(s10)
c000abd4:	000d8d13          	mv	s10,s11
c000abd8:	bd4ff06f          	j	c0009fac <stride_dequeue+0x1030>
c000abdc:	004b2783          	lw	a5,4(s6)
c000abe0:	008b2c03          	lw	s8,8(s6)
c000abe4:	00a12a23          	sw	a0,20(sp)
c000abe8:	00f12823          	sw	a5,16(sp)
c000abec:	020c0e63          	beqz	s8,c000ac28 <stride_dequeue+0x1cac>
c000abf0:	000d8593          	mv	a1,s11
c000abf4:	000c0513          	mv	a0,s8
c000abf8:	ea9fd0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000abfc:	01412783          	lw	a5,20(sp)
c000ac00:	34f50ce3          	beq	a0,a5,c000b758 <stride_dequeue+0x27dc>
c000ac04:	008da583          	lw	a1,8(s11)
c000ac08:	004da403          	lw	s0,4(s11)
c000ac0c:	000c0513          	mv	a0,s8
c000ac10:	f1dfd0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000ac14:	00ada223          	sw	a0,4(s11)
c000ac18:	008da423          	sw	s0,8(s11)
c000ac1c:	00050463          	beqz	a0,c000ac24 <stride_dequeue+0x1ca8>
c000ac20:	01b52023          	sw	s11,0(a0)
c000ac24:	008ba403          	lw	s0,8(s7)
c000ac28:	01012783          	lw	a5,16(sp)
c000ac2c:	01bb2223          	sw	s11,4(s6)
c000ac30:	00040c13          	mv	s8,s0
c000ac34:	00fb2423          	sw	a5,8(s6)
c000ac38:	016da023          	sw	s6,0(s11)
c000ac3c:	000b0d93          	mv	s11,s6
c000ac40:	a10ff06f          	j	c0009e50 <stride_dequeue+0xed4>
c000ac44:	004b2783          	lw	a5,4(s6)
c000ac48:	008b2c03          	lw	s8,8(s6)
c000ac4c:	00a12a23          	sw	a0,20(sp)
c000ac50:	00f12823          	sw	a5,16(sp)
c000ac54:	020c0e63          	beqz	s8,c000ac90 <stride_dequeue+0x1d14>
c000ac58:	000d8593          	mv	a1,s11
c000ac5c:	000c0513          	mv	a0,s8
c000ac60:	e41fd0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000ac64:	01412783          	lw	a5,20(sp)
c000ac68:	30f50ee3          	beq	a0,a5,c000b784 <stride_dequeue+0x2808>
c000ac6c:	008da583          	lw	a1,8(s11)
c000ac70:	004da403          	lw	s0,4(s11)
c000ac74:	000c0513          	mv	a0,s8
c000ac78:	eb5fd0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000ac7c:	00ada223          	sw	a0,4(s11)
c000ac80:	008da423          	sw	s0,8(s11)
c000ac84:	00050463          	beqz	a0,c000ac8c <stride_dequeue+0x1d10>
c000ac88:	01b52023          	sw	s11,0(a0)
c000ac8c:	008ba403          	lw	s0,8(s7)
c000ac90:	01012783          	lw	a5,16(sp)
c000ac94:	01bb2223          	sw	s11,4(s6)
c000ac98:	00040c13          	mv	s8,s0
c000ac9c:	00fb2423          	sw	a5,8(s6)
c000aca0:	016da023          	sw	s6,0(s11)
c000aca4:	ed9fe06f          	j	c0009b7c <stride_dequeue+0xc00>
c000aca8:	008ca503          	lw	a0,8(s9)
c000acac:	004cac03          	lw	s8,4(s9)
c000acb0:	00040593          	mv	a1,s0
c000acb4:	03c12023          	sw	t3,32(sp)
c000acb8:	e75fd0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000acbc:	00aca223          	sw	a0,4(s9)
c000acc0:	018ca423          	sw	s8,8(s9)
c000acc4:	02012e03          	lw	t3,32(sp)
c000acc8:	00050463          	beqz	a0,c000acd0 <stride_dequeue+0x1d54>
c000accc:	01952023          	sw	s9,0(a0)
c000acd0:	008bac03          	lw	s8,8(s7)
c000acd4:	d10fe06f          	j	c00091e4 <stride_dequeue+0x268>
c000acd8:	008ea783          	lw	a5,8(t4)
c000acdc:	00a12e23          	sw	a0,28(sp)
c000ace0:	004eac03          	lw	s8,4(t4)
c000ace4:	04078c63          	beqz	a5,c000ad3c <stride_dequeue+0x1dc0>
c000ace8:	00078513          	mv	a0,a5
c000acec:	000d8593          	mv	a1,s11
c000acf0:	03d12223          	sw	t4,36(sp)
c000acf4:	02f12023          	sw	a5,32(sp)
c000acf8:	da9fd0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000acfc:	01c12703          	lw	a4,28(sp)
c000ad00:	02012783          	lw	a5,32(sp)
c000ad04:	02412e83          	lw	t4,36(sp)
c000ad08:	00e51463          	bne	a0,a4,c000ad10 <stride_dequeue+0x1d94>
c000ad0c:	7b10006f          	j	c000bcbc <stride_dequeue+0x2d40>
c000ad10:	008da583          	lw	a1,8(s11)
c000ad14:	004da403          	lw	s0,4(s11)
c000ad18:	00078513          	mv	a0,a5
c000ad1c:	01d12e23          	sw	t4,28(sp)
c000ad20:	e0dfd0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000ad24:	00ada223          	sw	a0,4(s11)
c000ad28:	008da423          	sw	s0,8(s11)
c000ad2c:	01c12e83          	lw	t4,28(sp)
c000ad30:	00050463          	beqz	a0,c000ad38 <stride_dequeue+0x1dbc>
c000ad34:	01b52023          	sw	s11,0(a0)
c000ad38:	008ba403          	lw	s0,8(s7)
c000ad3c:	01bea223          	sw	s11,4(t4)
c000ad40:	018ea423          	sw	s8,8(t4)
c000ad44:	01dda023          	sw	t4,0(s11)
c000ad48:	00040c13          	mv	s8,s0
c000ad4c:	000e8d93          	mv	s11,t4
c000ad50:	ca9fe06f          	j	c00099f8 <stride_dequeue+0xa7c>
c000ad54:	004e2783          	lw	a5,4(t3)
c000ad58:	008e2d83          	lw	s11,8(t3)
c000ad5c:	02a12023          	sw	a0,32(sp)
c000ad60:	00f12e23          	sw	a5,28(sp)
c000ad64:	160d8c63          	beqz	s11,c000aedc <stride_dequeue+0x1f60>
c000ad68:	000e8593          	mv	a1,t4
c000ad6c:	000d8513          	mv	a0,s11
c000ad70:	03c12423          	sw	t3,40(sp)
c000ad74:	03d12223          	sw	t4,36(sp)
c000ad78:	d29fd0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000ad7c:	02012783          	lw	a5,32(sp)
c000ad80:	02412e83          	lw	t4,36(sp)
c000ad84:	02812e03          	lw	t3,40(sp)
c000ad88:	00f51463          	bne	a0,a5,c000ad90 <stride_dequeue+0x1e14>
c000ad8c:	76d0006f          	j	c000bcf8 <stride_dequeue+0x2d7c>
c000ad90:	02f12623          	sw	a5,44(sp)
c000ad94:	004ea783          	lw	a5,4(t4)
c000ad98:	008eac03          	lw	s8,8(t4)
c000ad9c:	02f12023          	sw	a5,32(sp)
c000ada0:	120c0663          	beqz	s8,c000aecc <stride_dequeue+0x1f50>
c000ada4:	000c0593          	mv	a1,s8
c000ada8:	000d8513          	mv	a0,s11
c000adac:	03d12423          	sw	t4,40(sp)
c000adb0:	03c12223          	sw	t3,36(sp)
c000adb4:	cedfd0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000adb8:	02c12783          	lw	a5,44(sp)
c000adbc:	02412e03          	lw	t3,36(sp)
c000adc0:	02812e83          	lw	t4,40(sp)
c000adc4:	00f51463          	bne	a0,a5,c000adcc <stride_dequeue+0x1e50>
c000adc8:	0f80106f          	j	c000bec0 <stride_dequeue+0x2f44>
c000adcc:	004c2783          	lw	a5,4(s8)
c000add0:	008c2283          	lw	t0,8(s8)
c000add4:	02f12223          	sw	a5,36(sp)
c000add8:	0e028063          	beqz	t0,c000aeb8 <stride_dequeue+0x1f3c>
c000addc:	00028593          	mv	a1,t0
c000ade0:	000d8513          	mv	a0,s11
c000ade4:	03d12823          	sw	t4,48(sp)
c000ade8:	03c12623          	sw	t3,44(sp)
c000adec:	02512423          	sw	t0,40(sp)
c000adf0:	cb1fd0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000adf4:	fff00393          	li	t2,-1
c000adf8:	02812283          	lw	t0,40(sp)
c000adfc:	02c12e03          	lw	t3,44(sp)
c000ae00:	03012e83          	lw	t4,48(sp)
c000ae04:	00751463          	bne	a0,t2,c000ae0c <stride_dequeue+0x1e90>
c000ae08:	46c0106f          	j	c000c274 <stride_dequeue+0x32f8>
c000ae0c:	0042a783          	lw	a5,4(t0)
c000ae10:	0082af83          	lw	t6,8(t0)
c000ae14:	02712e23          	sw	t2,60(sp)
c000ae18:	02f12423          	sw	a5,40(sp)
c000ae1c:	080f8463          	beqz	t6,c000aea4 <stride_dequeue+0x1f28>
c000ae20:	000f8593          	mv	a1,t6
c000ae24:	000d8513          	mv	a0,s11
c000ae28:	02512c23          	sw	t0,56(sp)
c000ae2c:	03d12a23          	sw	t4,52(sp)
c000ae30:	03c12823          	sw	t3,48(sp)
c000ae34:	03f12623          	sw	t6,44(sp)
c000ae38:	c69fd0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000ae3c:	03c12383          	lw	t2,60(sp)
c000ae40:	02c12f83          	lw	t6,44(sp)
c000ae44:	03012e03          	lw	t3,48(sp)
c000ae48:	03412e83          	lw	t4,52(sp)
c000ae4c:	03812283          	lw	t0,56(sp)
c000ae50:	00751463          	bne	a0,t2,c000ae58 <stride_dequeue+0x1edc>
c000ae54:	4900106f          	j	c000c2e4 <stride_dequeue+0x3368>
c000ae58:	008fa583          	lw	a1,8(t6)
c000ae5c:	000d8513          	mv	a0,s11
c000ae60:	004fa403          	lw	s0,4(t6)
c000ae64:	02512c23          	sw	t0,56(sp)
c000ae68:	03d12a23          	sw	t4,52(sp)
c000ae6c:	03c12823          	sw	t3,48(sp)
c000ae70:	03f12623          	sw	t6,44(sp)
c000ae74:	cb9fd0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000ae78:	02c12f83          	lw	t6,44(sp)
c000ae7c:	03012e03          	lw	t3,48(sp)
c000ae80:	03412e83          	lw	t4,52(sp)
c000ae84:	00afa223          	sw	a0,4(t6)
c000ae88:	008fa423          	sw	s0,8(t6)
c000ae8c:	03812283          	lw	t0,56(sp)
c000ae90:	00051463          	bnez	a0,c000ae98 <stride_dequeue+0x1f1c>
c000ae94:	5b00106f          	j	c000c444 <stride_dequeue+0x34c8>
c000ae98:	008ba403          	lw	s0,8(s7)
c000ae9c:	01f52023          	sw	t6,0(a0)
c000aea0:	000f8d93          	mv	s11,t6
c000aea4:	02812783          	lw	a5,40(sp)
c000aea8:	01b2a223          	sw	s11,4(t0)
c000aeac:	00f2a423          	sw	a5,8(t0)
c000aeb0:	005da023          	sw	t0,0(s11)
c000aeb4:	00028d93          	mv	s11,t0
c000aeb8:	02412783          	lw	a5,36(sp)
c000aebc:	01bc2223          	sw	s11,4(s8)
c000aec0:	00fc2423          	sw	a5,8(s8)
c000aec4:	018da023          	sw	s8,0(s11)
c000aec8:	000c0d93          	mv	s11,s8
c000aecc:	02012783          	lw	a5,32(sp)
c000aed0:	01bea223          	sw	s11,4(t4)
c000aed4:	00fea423          	sw	a5,8(t4)
c000aed8:	01dda023          	sw	t4,0(s11)
c000aedc:	01c12783          	lw	a5,28(sp)
c000aee0:	01de2223          	sw	t4,4(t3)
c000aee4:	00040c13          	mv	s8,s0
c000aee8:	00fe2423          	sw	a5,8(t3)
c000aeec:	01cea023          	sw	t3,0(t4)
c000aef0:	df1fe06f          	j	c0009ce0 <stride_dequeue+0xd64>
c000aef4:	004aa783          	lw	a5,4(s5)
c000aef8:	008aac03          	lw	s8,8(s5)
c000aefc:	02a12023          	sw	a0,32(sp)
c000af00:	00f12e23          	sw	a5,28(sp)
c000af04:	140c0c63          	beqz	s8,c000b05c <stride_dequeue+0x20e0>
c000af08:	000e8593          	mv	a1,t4
c000af0c:	000c0513          	mv	a0,s8
c000af10:	03d12223          	sw	t4,36(sp)
c000af14:	b8dfd0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000af18:	02012783          	lw	a5,32(sp)
c000af1c:	02412e83          	lw	t4,36(sp)
c000af20:	52f500e3          	beq	a0,a5,c000bc40 <stride_dequeue+0x2cc4>
c000af24:	02f12623          	sw	a5,44(sp)
c000af28:	004ea703          	lw	a4,4(t4)
c000af2c:	008ea783          	lw	a5,8(t4)
c000af30:	02e12223          	sw	a4,36(sp)
c000af34:	02f12023          	sw	a5,32(sp)
c000af38:	10078a63          	beqz	a5,c000b04c <stride_dequeue+0x20d0>
c000af3c:	00078593          	mv	a1,a5
c000af40:	000c0513          	mv	a0,s8
c000af44:	03d12423          	sw	t4,40(sp)
c000af48:	b59fd0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000af4c:	02c12783          	lw	a5,44(sp)
c000af50:	02812e83          	lw	t4,40(sp)
c000af54:	00f51463          	bne	a0,a5,c000af5c <stride_dequeue+0x1fe0>
c000af58:	0800106f          	j	c000bfd8 <stride_dequeue+0x305c>
c000af5c:	02012783          	lw	a5,32(sp)
c000af60:	0087a283          	lw	t0,8(a5)
c000af64:	0047a783          	lw	a5,4(a5)
c000af68:	02f12423          	sw	a5,40(sp)
c000af6c:	0c028463          	beqz	t0,c000b034 <stride_dequeue+0x20b8>
c000af70:	00028593          	mv	a1,t0
c000af74:	000c0513          	mv	a0,s8
c000af78:	03d12823          	sw	t4,48(sp)
c000af7c:	02512623          	sw	t0,44(sp)
c000af80:	b21fd0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000af84:	fff00393          	li	t2,-1
c000af88:	02c12283          	lw	t0,44(sp)
c000af8c:	03012e83          	lw	t4,48(sp)
c000af90:	00751463          	bne	a0,t2,c000af98 <stride_dequeue+0x201c>
c000af94:	4500106f          	j	c000c3e4 <stride_dequeue+0x3468>
c000af98:	0042a783          	lw	a5,4(t0)
c000af9c:	0082af83          	lw	t6,8(t0)
c000afa0:	02712e23          	sw	t2,60(sp)
c000afa4:	02f12623          	sw	a5,44(sp)
c000afa8:	060f8c63          	beqz	t6,c000b020 <stride_dequeue+0x20a4>
c000afac:	000f8593          	mv	a1,t6
c000afb0:	000c0513          	mv	a0,s8
c000afb4:	02512c23          	sw	t0,56(sp)
c000afb8:	03d12a23          	sw	t4,52(sp)
c000afbc:	03f12823          	sw	t6,48(sp)
c000afc0:	ae1fd0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000afc4:	03c12383          	lw	t2,60(sp)
c000afc8:	03012f83          	lw	t6,48(sp)
c000afcc:	03412e83          	lw	t4,52(sp)
c000afd0:	03812283          	lw	t0,56(sp)
c000afd4:	00751463          	bne	a0,t2,c000afdc <stride_dequeue+0x2060>
c000afd8:	2d40106f          	j	c000c2ac <stride_dequeue+0x3330>
c000afdc:	008fa583          	lw	a1,8(t6)
c000afe0:	000c0513          	mv	a0,s8
c000afe4:	004fa403          	lw	s0,4(t6)
c000afe8:	02512c23          	sw	t0,56(sp)
c000afec:	03d12a23          	sw	t4,52(sp)
c000aff0:	03f12823          	sw	t6,48(sp)
c000aff4:	b39fd0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000aff8:	03012f83          	lw	t6,48(sp)
c000affc:	03412e83          	lw	t4,52(sp)
c000b000:	03812283          	lw	t0,56(sp)
c000b004:	00afa223          	sw	a0,4(t6)
c000b008:	008fa423          	sw	s0,8(t6)
c000b00c:	00051463          	bnez	a0,c000b014 <stride_dequeue+0x2098>
c000b010:	4280106f          	j	c000c438 <stride_dequeue+0x34bc>
c000b014:	008ba403          	lw	s0,8(s7)
c000b018:	01f52023          	sw	t6,0(a0)
c000b01c:	000f8c13          	mv	s8,t6
c000b020:	02c12783          	lw	a5,44(sp)
c000b024:	0182a223          	sw	s8,4(t0)
c000b028:	00f2a423          	sw	a5,8(t0)
c000b02c:	005c2023          	sw	t0,0(s8)
c000b030:	00028c13          	mv	s8,t0
c000b034:	02012783          	lw	a5,32(sp)
c000b038:	02812703          	lw	a4,40(sp)
c000b03c:	0187a223          	sw	s8,4(a5)
c000b040:	00e7a423          	sw	a4,8(a5)
c000b044:	00fc2023          	sw	a5,0(s8)
c000b048:	00078c13          	mv	s8,a5
c000b04c:	02412783          	lw	a5,36(sp)
c000b050:	018ea223          	sw	s8,4(t4)
c000b054:	00fea423          	sw	a5,8(t4)
c000b058:	01dc2023          	sw	t4,0(s8)
c000b05c:	01c12783          	lw	a5,28(sp)
c000b060:	01daa223          	sw	t4,4(s5)
c000b064:	00040c13          	mv	s8,s0
c000b068:	00faa423          	sw	a5,8(s5)
c000b06c:	015ea023          	sw	s5,0(t4)
c000b070:	bb8fe06f          	j	c0009428 <stride_dequeue+0x4ac>
c000b074:	008aa503          	lw	a0,8(s5)
c000b078:	004aa403          	lw	s0,4(s5)
c000b07c:	000d8593          	mv	a1,s11
c000b080:	01c12e23          	sw	t3,28(sp)
c000b084:	aa9fd0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000b088:	00aaa223          	sw	a0,4(s5)
c000b08c:	008aa423          	sw	s0,8(s5)
c000b090:	01c12e03          	lw	t3,28(sp)
c000b094:	00050463          	beqz	a0,c000b09c <stride_dequeue+0x2120>
c000b098:	01552023          	sw	s5,0(a0)
c000b09c:	008bac03          	lw	s8,8(s7)
c000b0a0:	fa0fe06f          	j	c0009840 <stride_dequeue+0x8c4>
c000b0a4:	008d2503          	lw	a0,8(s10)
c000b0a8:	004d2403          	lw	s0,4(s10)
c000b0ac:	000e0593          	mv	a1,t3
c000b0b0:	01112c23          	sw	a7,24(sp)
c000b0b4:	a79fd0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000b0b8:	00ad2223          	sw	a0,4(s10)
c000b0bc:	008d2423          	sw	s0,8(s10)
c000b0c0:	01812883          	lw	a7,24(sp)
c000b0c4:	00050463          	beqz	a0,c000b0cc <stride_dequeue+0x2150>
c000b0c8:	01a52023          	sw	s10,0(a0)
c000b0cc:	008bac03          	lw	s8,8(s7)
c000b0d0:	d60fe06f          	j	c0009630 <stride_dequeue+0x6b4>
c000b0d4:	008b2503          	lw	a0,8(s6)
c000b0d8:	004b2403          	lw	s0,4(s6)
c000b0dc:	00080593          	mv	a1,a6
c000b0e0:	a4dfd0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000b0e4:	00ab2223          	sw	a0,4(s6)
c000b0e8:	008b2423          	sw	s0,8(s6)
c000b0ec:	00050463          	beqz	a0,c000b0f4 <stride_dequeue+0x2178>
c000b0f0:	01652023          	sw	s6,0(a0)
c000b0f4:	008bac03          	lw	s8,8(s7)
c000b0f8:	a71fe06f          	j	c0009b68 <stride_dequeue+0xbec>
c000b0fc:	0087ac03          	lw	s8,8(a5)
c000b100:	00a12c23          	sw	a0,24(sp)
c000b104:	0047ad83          	lw	s11,4(a5)
c000b108:	040c0663          	beqz	s8,c000b154 <stride_dequeue+0x21d8>
c000b10c:	000b0593          	mv	a1,s6
c000b110:	000c0513          	mv	a0,s8
c000b114:	00f12e23          	sw	a5,28(sp)
c000b118:	989fd0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000b11c:	01c12783          	lw	a5,28(sp)
c000b120:	01812703          	lw	a4,24(sp)
c000b124:	00f12c23          	sw	a5,24(sp)
c000b128:	4ae506e3          	beq	a0,a4,c000bdd4 <stride_dequeue+0x2e58>
c000b12c:	008b2583          	lw	a1,8(s6)
c000b130:	004b2403          	lw	s0,4(s6)
c000b134:	000c0513          	mv	a0,s8
c000b138:	9f5fd0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000b13c:	00ab2223          	sw	a0,4(s6)
c000b140:	008b2423          	sw	s0,8(s6)
c000b144:	01812783          	lw	a5,24(sp)
c000b148:	00050463          	beqz	a0,c000b150 <stride_dequeue+0x21d4>
c000b14c:	01652023          	sw	s6,0(a0)
c000b150:	008ba403          	lw	s0,8(s7)
c000b154:	0167a223          	sw	s6,4(a5)
c000b158:	01b7a423          	sw	s11,8(a5)
c000b15c:	00fb2023          	sw	a5,0(s6)
c000b160:	00040c13          	mv	s8,s0
c000b164:	00078b13          	mv	s6,a5
c000b168:	a74ff06f          	j	c000a3dc <stride_dequeue+0x1460>
c000b16c:	0087ac03          	lw	s8,8(a5)
c000b170:	00a12c23          	sw	a0,24(sp)
c000b174:	0047ad83          	lw	s11,4(a5)
c000b178:	040c0663          	beqz	s8,c000b1c4 <stride_dequeue+0x2248>
c000b17c:	000b0593          	mv	a1,s6
c000b180:	000c0513          	mv	a0,s8
c000b184:	00f12e23          	sw	a5,28(sp)
c000b188:	919fd0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000b18c:	01c12783          	lw	a5,28(sp)
c000b190:	01812703          	lw	a4,24(sp)
c000b194:	00f12c23          	sw	a5,24(sp)
c000b198:	40e506e3          	beq	a0,a4,c000bda4 <stride_dequeue+0x2e28>
c000b19c:	008b2583          	lw	a1,8(s6)
c000b1a0:	004b2403          	lw	s0,4(s6)
c000b1a4:	000c0513          	mv	a0,s8
c000b1a8:	985fd0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000b1ac:	00ab2223          	sw	a0,4(s6)
c000b1b0:	008b2423          	sw	s0,8(s6)
c000b1b4:	01812783          	lw	a5,24(sp)
c000b1b8:	00050463          	beqz	a0,c000b1c0 <stride_dequeue+0x2244>
c000b1bc:	01652023          	sw	s6,0(a0)
c000b1c0:	008ba403          	lw	s0,8(s7)
c000b1c4:	0167a223          	sw	s6,4(a5)
c000b1c8:	01b7a423          	sw	s11,8(a5)
c000b1cc:	00fb2023          	sw	a5,0(s6)
c000b1d0:	00040c13          	mv	s8,s0
c000b1d4:	00078b13          	mv	s6,a5
c000b1d8:	8acff06f          	j	c000a284 <stride_dequeue+0x1308>
c000b1dc:	008b2503          	lw	a0,8(s6)
c000b1e0:	004b2403          	lw	s0,4(s6)
c000b1e4:	00080593          	mv	a1,a6
c000b1e8:	945fd0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000b1ec:	00ab2223          	sw	a0,4(s6)
c000b1f0:	008b2423          	sw	s0,8(s6)
c000b1f4:	00050463          	beqz	a0,c000b1fc <stride_dequeue+0x2280>
c000b1f8:	01652023          	sw	s6,0(a0)
c000b1fc:	008bac03          	lw	s8,8(s7)
c000b200:	c41fe06f          	j	c0009e40 <stride_dequeue+0xec4>
c000b204:	008da503          	lw	a0,8(s11)
c000b208:	004da403          	lw	s0,4(s11)
c000b20c:	00078593          	mv	a1,a5
c000b210:	91dfd0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000b214:	00ada223          	sw	a0,4(s11)
c000b218:	008da423          	sw	s0,8(s11)
c000b21c:	00050463          	beqz	a0,c000b224 <stride_dequeue+0x22a8>
c000b220:	01b52023          	sw	s11,0(a0)
c000b224:	008bac03          	lw	s8,8(s7)
c000b228:	d75fe06f          	j	c0009f9c <stride_dequeue+0x1020>
c000b22c:	00432783          	lw	a5,4(t1)
c000b230:	00832c03          	lw	s8,8(t1)
c000b234:	00a12c23          	sw	a0,24(sp)
c000b238:	00f12a23          	sw	a5,20(sp)
c000b23c:	040c0663          	beqz	s8,c000b288 <stride_dequeue+0x230c>
c000b240:	000b0593          	mv	a1,s6
c000b244:	000c0513          	mv	a0,s8
c000b248:	00612e23          	sw	t1,28(sp)
c000b24c:	855fd0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000b250:	01c12303          	lw	t1,28(sp)
c000b254:	01812783          	lw	a5,24(sp)
c000b258:	00612c23          	sw	t1,24(sp)
c000b25c:	30f50ce3          	beq	a0,a5,c000bd74 <stride_dequeue+0x2df8>
c000b260:	008b2583          	lw	a1,8(s6)
c000b264:	004b2403          	lw	s0,4(s6)
c000b268:	000c0513          	mv	a0,s8
c000b26c:	8c1fd0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000b270:	00ab2223          	sw	a0,4(s6)
c000b274:	008b2423          	sw	s0,8(s6)
c000b278:	01812303          	lw	t1,24(sp)
c000b27c:	00050463          	beqz	a0,c000b284 <stride_dequeue+0x2308>
c000b280:	01652023          	sw	s6,0(a0)
c000b284:	008ba403          	lw	s0,8(s7)
c000b288:	01412783          	lw	a5,20(sp)
c000b28c:	01632223          	sw	s6,4(t1)
c000b290:	00040c13          	mv	s8,s0
c000b294:	00f32423          	sw	a5,8(t1)
c000b298:	006b2023          	sw	t1,0(s6)
c000b29c:	00030b13          	mv	s6,t1
c000b2a0:	e89fe06f          	j	c000a128 <stride_dequeue+0x11ac>
c000b2a4:	008ca503          	lw	a0,8(s9)
c000b2a8:	004cac03          	lw	s8,4(s9)
c000b2ac:	000f0593          	mv	a1,t5
c000b2b0:	03c12223          	sw	t3,36(sp)
c000b2b4:	879fd0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000b2b8:	00aca223          	sw	a0,4(s9)
c000b2bc:	018ca423          	sw	s8,8(s9)
c000b2c0:	02412e03          	lw	t3,36(sp)
c000b2c4:	00050463          	beqz	a0,c000b2cc <stride_dequeue+0x2350>
c000b2c8:	01952023          	sw	s9,0(a0)
c000b2cc:	008bac03          	lw	s8,8(s7)
c000b2d0:	f01fd06f          	j	c00091d0 <stride_dequeue+0x254>
c000b2d4:	004da703          	lw	a4,4(s11)
c000b2d8:	008da783          	lw	a5,8(s11)
c000b2dc:	00e12823          	sw	a4,16(sp)
c000b2e0:	04078063          	beqz	a5,c000b320 <stride_dequeue+0x23a4>
c000b2e4:	00078513          	mv	a0,a5
c000b2e8:	00098593          	mv	a1,s3
c000b2ec:	00f12a23          	sw	a5,20(sp)
c000b2f0:	fb0fd0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000b2f4:	01412783          	lw	a5,20(sp)
c000b2f8:	4b8508e3          	beq	a0,s8,c000bfa8 <stride_dequeue+0x302c>
c000b2fc:	0089a583          	lw	a1,8(s3)
c000b300:	0049a403          	lw	s0,4(s3)
c000b304:	00078513          	mv	a0,a5
c000b308:	825fd0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000b30c:	00a9a223          	sw	a0,4(s3)
c000b310:	0089a423          	sw	s0,8(s3)
c000b314:	00050463          	beqz	a0,c000b31c <stride_dequeue+0x23a0>
c000b318:	01352023          	sw	s3,0(a0)
c000b31c:	008ba403          	lw	s0,8(s7)
c000b320:	01012783          	lw	a5,16(sp)
c000b324:	013da223          	sw	s3,4(s11)
c000b328:	00fda423          	sw	a5,8(s11)
c000b32c:	01b9a023          	sw	s11,0(s3)
c000b330:	000d8993          	mv	s3,s11
c000b334:	9f4ff06f          	j	c000a528 <stride_dequeue+0x15ac>
c000b338:	0087a503          	lw	a0,8(a5)
c000b33c:	000e0593          	mv	a1,t3
c000b340:	0047a403          	lw	s0,4(a5)
c000b344:	00f12e23          	sw	a5,28(sp)
c000b348:	fe4fd0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000b34c:	01c12783          	lw	a5,28(sp)
c000b350:	00a7a223          	sw	a0,4(a5)
c000b354:	0087a423          	sw	s0,8(a5)
c000b358:	4a050ce3          	beqz	a0,c000c010 <stride_dequeue+0x3094>
c000b35c:	00f52023          	sw	a5,0(a0)
c000b360:	00078e13          	mv	t3,a5
c000b364:	008ba403          	lw	s0,8(s7)
c000b368:	a38ff06f          	j	c000a5a0 <stride_dequeue+0x1624>
c000b36c:	008ea503          	lw	a0,8(t4)
c000b370:	000f0593          	mv	a1,t5
c000b374:	004ea403          	lw	s0,4(t4)
c000b378:	03d12023          	sw	t4,32(sp)
c000b37c:	fb0fd0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000b380:	02012e83          	lw	t4,32(sp)
c000b384:	00aea223          	sw	a0,4(t4)
c000b388:	008ea423          	sw	s0,8(t4)
c000b38c:	00050463          	beqz	a0,c000b394 <stride_dequeue+0x2418>
c000b390:	01d52023          	sw	t4,0(a0)
c000b394:	008bac03          	lw	s8,8(s7)
c000b398:	e50fe06f          	j	c00099e8 <stride_dequeue+0xa6c>
c000b39c:	008e2503          	lw	a0,8(t3)
c000b3a0:	00078593          	mv	a1,a5
c000b3a4:	004e2403          	lw	s0,4(t3)
c000b3a8:	03d12223          	sw	t4,36(sp)
c000b3ac:	f80fd0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000b3b0:	02012e03          	lw	t3,32(sp)
c000b3b4:	02412e83          	lw	t4,36(sp)
c000b3b8:	00ae2223          	sw	a0,4(t3)
c000b3bc:	008e2423          	sw	s0,8(t3)
c000b3c0:	00050463          	beqz	a0,c000b3c8 <stride_dequeue+0x244c>
c000b3c4:	01c52023          	sw	t3,0(a0)
c000b3c8:	008bac03          	lw	s8,8(s7)
c000b3cc:	901fe06f          	j	c0009ccc <stride_dequeue+0xd50>
c000b3d0:	008aa503          	lw	a0,8(s5)
c000b3d4:	004aa403          	lw	s0,4(s5)
c000b3d8:	000e8593          	mv	a1,t4
c000b3dc:	03c12023          	sw	t3,32(sp)
c000b3e0:	f4cfd0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000b3e4:	00aaa223          	sw	a0,4(s5)
c000b3e8:	008aa423          	sw	s0,8(s5)
c000b3ec:	02012e03          	lw	t3,32(sp)
c000b3f0:	00050463          	beqz	a0,c000b3f8 <stride_dequeue+0x247c>
c000b3f4:	01552023          	sw	s5,0(a0)
c000b3f8:	008bac03          	lw	s8,8(s7)
c000b3fc:	c30fe06f          	j	c000982c <stride_dequeue+0x8b0>
c000b400:	008aa503          	lw	a0,8(s5)
c000b404:	004aa403          	lw	s0,4(s5)
c000b408:	00078593          	mv	a1,a5
c000b40c:	03d12023          	sw	t4,32(sp)
c000b410:	f1cfd0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000b414:	00aaa223          	sw	a0,4(s5)
c000b418:	008aa423          	sw	s0,8(s5)
c000b41c:	02012e83          	lw	t4,32(sp)
c000b420:	00050463          	beqz	a0,c000b428 <stride_dequeue+0x24ac>
c000b424:	01552023          	sw	s5,0(a0)
c000b428:	008bac03          	lw	s8,8(s7)
c000b42c:	fe9fd06f          	j	c0009414 <stride_dequeue+0x498>
c000b430:	008d2503          	lw	a0,8(s10)
c000b434:	004d2403          	lw	s0,4(s10)
c000b438:	000e8593          	mv	a1,t4
c000b43c:	03c12023          	sw	t3,32(sp)
c000b440:	01112e23          	sw	a7,28(sp)
c000b444:	ee8fd0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000b448:	00ad2223          	sw	a0,4(s10)
c000b44c:	008d2423          	sw	s0,8(s10)
c000b450:	01c12883          	lw	a7,28(sp)
c000b454:	02012e03          	lw	t3,32(sp)
c000b458:	00050463          	beqz	a0,c000b460 <stride_dequeue+0x24e4>
c000b45c:	01a52023          	sw	s10,0(a0)
c000b460:	008bac03          	lw	s8,8(s7)
c000b464:	9b8fe06f          	j	c000961c <stride_dequeue+0x6a0>
c000b468:	000b0893          	mv	a7,s6
c000b46c:	ee8fe06f          	j	c0009b54 <stride_dequeue+0xbd8>
c000b470:	00030e13          	mv	t3,t1
c000b474:	ca5fe06f          	j	c000a118 <stride_dequeue+0x119c>
c000b478:	00078e13          	mv	t3,a5
c000b47c:	f51fe06f          	j	c000a3cc <stride_dequeue+0x1450>
c000b480:	000b0893          	mv	a7,s6
c000b484:	9a9fe06f          	j	c0009e2c <stride_dequeue+0xeb0>
c000b488:	00078e13          	mv	t3,a5
c000b48c:	de9fe06f          	j	c000a274 <stride_dequeue+0x12f8>
c000b490:	000d8713          	mv	a4,s11
c000b494:	af5fe06f          	j	c0009f88 <stride_dequeue+0x100c>
c000b498:	008b2503          	lw	a0,8(s6)
c000b49c:	004b2403          	lw	s0,4(s6)
c000b4a0:	00088593          	mv	a1,a7
c000b4a4:	01012c23          	sw	a6,24(sp)
c000b4a8:	e84fd0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000b4ac:	00ab2223          	sw	a0,4(s6)
c000b4b0:	008b2423          	sw	s0,8(s6)
c000b4b4:	01812803          	lw	a6,24(sp)
c000b4b8:	00050463          	beqz	a0,c000b4c0 <stride_dequeue+0x2544>
c000b4bc:	01652023          	sw	s6,0(a0)
c000b4c0:	008bac03          	lw	s8,8(s7)
c000b4c4:	000b0893          	mv	a7,s6
c000b4c8:	965fe06f          	j	c0009e2c <stride_dequeue+0xeb0>
c000b4cc:	008b2503          	lw	a0,8(s6)
c000b4d0:	004b2403          	lw	s0,4(s6)
c000b4d4:	00088593          	mv	a1,a7
c000b4d8:	01012c23          	sw	a6,24(sp)
c000b4dc:	e50fd0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000b4e0:	00ab2223          	sw	a0,4(s6)
c000b4e4:	008b2423          	sw	s0,8(s6)
c000b4e8:	01812803          	lw	a6,24(sp)
c000b4ec:	00050463          	beqz	a0,c000b4f4 <stride_dequeue+0x2578>
c000b4f0:	01652023          	sw	s6,0(a0)
c000b4f4:	008bac03          	lw	s8,8(s7)
c000b4f8:	000b0893          	mv	a7,s6
c000b4fc:	e58fe06f          	j	c0009b54 <stride_dequeue+0xbd8>
c000b500:	008da503          	lw	a0,8(s11)
c000b504:	004da403          	lw	s0,4(s11)
c000b508:	00070593          	mv	a1,a4
c000b50c:	00f12c23          	sw	a5,24(sp)
c000b510:	e1cfd0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000b514:	00ada223          	sw	a0,4(s11)
c000b518:	008da423          	sw	s0,8(s11)
c000b51c:	01812783          	lw	a5,24(sp)
c000b520:	00050463          	beqz	a0,c000b528 <stride_dequeue+0x25ac>
c000b524:	01b52023          	sw	s11,0(a0)
c000b528:	008bac03          	lw	s8,8(s7)
c000b52c:	000d8713          	mv	a4,s11
c000b530:	a59fe06f          	j	c0009f88 <stride_dequeue+0x100c>
c000b534:	008c2503          	lw	a0,8(s8)
c000b538:	004c2403          	lw	s0,4(s8)
c000b53c:	000d8593          	mv	a1,s11
c000b540:	decfd0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000b544:	00ac2223          	sw	a0,4(s8)
c000b548:	008c2423          	sw	s0,8(s8)
c000b54c:	300506e3          	beqz	a0,c000c058 <stride_dequeue+0x30dc>
c000b550:	01852023          	sw	s8,0(a0)
c000b554:	000c0d93          	mv	s11,s8
c000b558:	008ba403          	lw	s0,8(s7)
c000b55c:	a04ff06f          	j	c000a760 <stride_dequeue+0x17e4>
c000b560:	0087a503          	lw	a0,8(a5)
c000b564:	000e0593          	mv	a1,t3
c000b568:	0047a403          	lw	s0,4(a5)
c000b56c:	dc0fd0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000b570:	01c12783          	lw	a5,28(sp)
c000b574:	00a7a223          	sw	a0,4(a5)
c000b578:	0087a423          	sw	s0,8(a5)
c000b57c:	00050463          	beqz	a0,c000b584 <stride_dequeue+0x2608>
c000b580:	00f52023          	sw	a5,0(a0)
c000b584:	008bac03          	lw	s8,8(s7)
c000b588:	00078e13          	mv	t3,a5
c000b58c:	ce9fe06f          	j	c000a274 <stride_dequeue+0x12f8>
c000b590:	0087a503          	lw	a0,8(a5)
c000b594:	000e0593          	mv	a1,t3
c000b598:	0047a403          	lw	s0,4(a5)
c000b59c:	d90fd0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000b5a0:	01c12783          	lw	a5,28(sp)
c000b5a4:	00a7a223          	sw	a0,4(a5)
c000b5a8:	0087a423          	sw	s0,8(a5)
c000b5ac:	00050463          	beqz	a0,c000b5b4 <stride_dequeue+0x2638>
c000b5b0:	00f52023          	sw	a5,0(a0)
c000b5b4:	008bac03          	lw	s8,8(s7)
c000b5b8:	00078e13          	mv	t3,a5
c000b5bc:	e11fe06f          	j	c000a3cc <stride_dequeue+0x1450>
c000b5c0:	008c2503          	lw	a0,8(s8)
c000b5c4:	004c2403          	lw	s0,4(s8)
c000b5c8:	000e0593          	mv	a1,t3
c000b5cc:	d60fd0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000b5d0:	00ac2223          	sw	a0,4(s8)
c000b5d4:	008c2423          	sw	s0,8(s8)
c000b5d8:	220506e3          	beqz	a0,c000c004 <stride_dequeue+0x3088>
c000b5dc:	01852023          	sw	s8,0(a0)
c000b5e0:	000c0e13          	mv	t3,s8
c000b5e4:	008ba403          	lw	s0,8(s7)
c000b5e8:	b34ff06f          	j	c000a91c <stride_dequeue+0x19a0>
c000b5ec:	008da503          	lw	a0,8(s11)
c000b5f0:	004da403          	lw	s0,4(s11)
c000b5f4:	000a8593          	mv	a1,s5
c000b5f8:	01c12e23          	sw	t3,28(sp)
c000b5fc:	d30fd0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000b600:	00ada223          	sw	a0,4(s11)
c000b604:	008da423          	sw	s0,8(s11)
c000b608:	01c12e03          	lw	t3,28(sp)
c000b60c:	24050ce3          	beqz	a0,c000c064 <stride_dequeue+0x30e8>
c000b610:	01b52023          	sw	s11,0(a0)
c000b614:	000d8a93          	mv	s5,s11
c000b618:	008ba403          	lw	s0,8(s7)
c000b61c:	d3cff06f          	j	c000ab58 <stride_dequeue+0x1bdc>
c000b620:	008c2503          	lw	a0,8(s8)
c000b624:	004c2403          	lw	s0,4(s8)
c000b628:	00088593          	mv	a1,a7
c000b62c:	d00fd0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000b630:	00ac2223          	sw	a0,4(s8)
c000b634:	008c2423          	sw	s0,8(s8)
c000b638:	1e0502e3          	beqz	a0,c000c01c <stride_dequeue+0x30a0>
c000b63c:	01852023          	sw	s8,0(a0)
c000b640:	000c0893          	mv	a7,s8
c000b644:	008ba403          	lw	s0,8(s7)
c000b648:	b48ff06f          	j	c000a990 <stride_dequeue+0x1a14>
c000b64c:	00832503          	lw	a0,8(t1)
c000b650:	000e0593          	mv	a1,t3
c000b654:	00432403          	lw	s0,4(t1)
c000b658:	00612c23          	sw	t1,24(sp)
c000b65c:	cd0fd0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000b660:	01812303          	lw	t1,24(sp)
c000b664:	00a32223          	sw	a0,4(t1)
c000b668:	00832423          	sw	s0,8(t1)
c000b66c:	00050463          	beqz	a0,c000b674 <stride_dequeue+0x26f8>
c000b670:	00652023          	sw	t1,0(a0)
c000b674:	008bac03          	lw	s8,8(s7)
c000b678:	00030e13          	mv	t3,t1
c000b67c:	a9dfe06f          	j	c000a118 <stride_dequeue+0x119c>
c000b680:	008ca503          	lw	a0,8(s9)
c000b684:	004cac03          	lw	s8,4(s9)
c000b688:	000f8593          	mv	a1,t6
c000b68c:	03e12623          	sw	t5,44(sp)
c000b690:	03c12423          	sw	t3,40(sp)
c000b694:	c98fd0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000b698:	00aca223          	sw	a0,4(s9)
c000b69c:	018ca423          	sw	s8,8(s9)
c000b6a0:	02812e03          	lw	t3,40(sp)
c000b6a4:	02c12f03          	lw	t5,44(sp)
c000b6a8:	00050463          	beqz	a0,c000b6b0 <stride_dequeue+0x2734>
c000b6ac:	01952023          	sw	s9,0(a0)
c000b6b0:	008bac03          	lw	s8,8(s7)
c000b6b4:	b09fd06f          	j	c00091bc <stride_dequeue+0x240>
c000b6b8:	008ba403          	lw	s0,8(s7)
c000b6bc:	000d8c13          	mv	s8,s11
c000b6c0:	e59fe06f          	j	c000a518 <stride_dequeue+0x159c>
c000b6c4:	008ba403          	lw	s0,8(s7)
c000b6c8:	000a8f13          	mv	t5,s5
c000b6cc:	d35fd06f          	j	c0009400 <stride_dequeue+0x484>
c000b6d0:	008ba403          	lw	s0,8(s7)
c000b6d4:	000d0f13          	mv	t5,s10
c000b6d8:	f31fd06f          	j	c0009608 <stride_dequeue+0x68c>
c000b6dc:	008da503          	lw	a0,8(s11)
c000b6e0:	004da403          	lw	s0,4(s11)
c000b6e4:	000c0593          	mv	a1,s8
c000b6e8:	c44fd0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000b6ec:	00ada223          	sw	a0,4(s11)
c000b6f0:	008da423          	sw	s0,8(s11)
c000b6f4:	fc0502e3          	beqz	a0,c000b6b8 <stride_dequeue+0x273c>
c000b6f8:	01b52023          	sw	s11,0(a0)
c000b6fc:	000d8c13          	mv	s8,s11
c000b700:	008ba403          	lw	s0,8(s7)
c000b704:	e15fe06f          	j	c000a518 <stride_dequeue+0x159c>
c000b708:	008ba403          	lw	s0,8(s7)
c000b70c:	000e8c13          	mv	s8,t4
c000b710:	ac0fe06f          	j	c00099d0 <stride_dequeue+0xa54>
c000b714:	008ba403          	lw	s0,8(s7)
c000b718:	000e0f13          	mv	t5,t3
c000b71c:	d9cfe06f          	j	c0009cb8 <stride_dequeue+0xd3c>
c000b720:	008ba403          	lw	s0,8(s7)
c000b724:	000a8f13          	mv	t5,s5
c000b728:	8f0fe06f          	j	c0009818 <stride_dequeue+0x89c>
c000b72c:	008c2503          	lw	a0,8(s8)
c000b730:	004c2403          	lw	s0,4(s8)
c000b734:	000d0593          	mv	a1,s10
c000b738:	bf4fd0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000b73c:	00ac2223          	sw	a0,4(s8)
c000b740:	008c2423          	sw	s0,8(s8)
c000b744:	1a0504e3          	beqz	a0,c000c0ec <stride_dequeue+0x3170>
c000b748:	01852023          	sw	s8,0(a0)
c000b74c:	000c0d13          	mv	s10,s8
c000b750:	008ba403          	lw	s0,8(s7)
c000b754:	c6cff06f          	j	c000abc0 <stride_dequeue+0x1c44>
c000b758:	008c2503          	lw	a0,8(s8)
c000b75c:	004c2403          	lw	s0,4(s8)
c000b760:	000d8593          	mv	a1,s11
c000b764:	bc8fd0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000b768:	00ac2223          	sw	a0,4(s8)
c000b76c:	008c2423          	sw	s0,8(s8)
c000b770:	420502e3          	beqz	a0,c000c394 <stride_dequeue+0x3418>
c000b774:	01852023          	sw	s8,0(a0)
c000b778:	000c0d93          	mv	s11,s8
c000b77c:	008ba403          	lw	s0,8(s7)
c000b780:	ca8ff06f          	j	c000ac28 <stride_dequeue+0x1cac>
c000b784:	008c2503          	lw	a0,8(s8)
c000b788:	004c2403          	lw	s0,4(s8)
c000b78c:	000d8593          	mv	a1,s11
c000b790:	b9cfd0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000b794:	00ac2223          	sw	a0,4(s8)
c000b798:	008c2423          	sw	s0,8(s8)
c000b79c:	24050ae3          	beqz	a0,c000c1f0 <stride_dequeue+0x3274>
c000b7a0:	01852023          	sw	s8,0(a0)
c000b7a4:	000c0d93          	mv	s11,s8
c000b7a8:	008ba403          	lw	s0,8(s7)
c000b7ac:	ce4ff06f          	j	c000ac90 <stride_dequeue+0x1d14>
c000b7b0:	00004697          	auipc	a3,0x4
c000b7b4:	b7468693          	addi	a3,a3,-1164 # c000f324 <default_pmm_manager+0x106c>
c000b7b8:	00002617          	auipc	a2,0x2
c000b7bc:	abc60613          	addi	a2,a2,-1348 # c000d274 <commands+0x3d8>
c000b7c0:	06300593          	li	a1,99
c000b7c4:	00004517          	auipc	a0,0x4
c000b7c8:	b8450513          	addi	a0,a0,-1148 # c000f348 <default_pmm_manager+0x1090>
c000b7cc:	a85f40ef          	jal	ra,c0000250 <__panic>
c000b7d0:	008ba403          	lw	s0,8(s7)
c000b7d4:	000b0e13          	mv	t3,s6
c000b7d8:	e44fe06f          	j	c0009e1c <stride_dequeue+0xea0>
c000b7dc:	008ba403          	lw	s0,8(s7)
c000b7e0:	000b0e13          	mv	t3,s6
c000b7e4:	b60fe06f          	j	c0009b44 <stride_dequeue+0xbc8>
c000b7e8:	008ba403          	lw	s0,8(s7)
c000b7ec:	00078c13          	mv	s8,a5
c000b7f0:	a71fe06f          	j	c000a260 <stride_dequeue+0x12e4>
c000b7f4:	008aa503          	lw	a0,8(s5)
c000b7f8:	004aa403          	lw	s0,4(s5)
c000b7fc:	000f0593          	mv	a1,t5
c000b800:	03d12223          	sw	t4,36(sp)
c000b804:	03c12023          	sw	t3,32(sp)
c000b808:	b24fd0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000b80c:	00aaa223          	sw	a0,4(s5)
c000b810:	008aa423          	sw	s0,8(s5)
c000b814:	02012e03          	lw	t3,32(sp)
c000b818:	02412e83          	lw	t4,36(sp)
c000b81c:	f00502e3          	beqz	a0,c000b720 <stride_dequeue+0x27a4>
c000b820:	01552023          	sw	s5,0(a0)
c000b824:	000a8f13          	mv	t5,s5
c000b828:	008ba403          	lw	s0,8(s7)
c000b82c:	fedfd06f          	j	c0009818 <stride_dequeue+0x89c>
c000b830:	008e2503          	lw	a0,8(t3)
c000b834:	000f0593          	mv	a1,t5
c000b838:	004e2403          	lw	s0,4(t3)
c000b83c:	af0fd0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000b840:	02012e03          	lw	t3,32(sp)
c000b844:	02412e83          	lw	t4,36(sp)
c000b848:	02812783          	lw	a5,40(sp)
c000b84c:	00ae2223          	sw	a0,4(t3)
c000b850:	008e2423          	sw	s0,8(t3)
c000b854:	ec0500e3          	beqz	a0,c000b714 <stride_dequeue+0x2798>
c000b858:	01c52023          	sw	t3,0(a0)
c000b85c:	000e0f13          	mv	t5,t3
c000b860:	008ba403          	lw	s0,8(s7)
c000b864:	c54fe06f          	j	c0009cb8 <stride_dequeue+0xd3c>
c000b868:	008d2503          	lw	a0,8(s10)
c000b86c:	004d2403          	lw	s0,4(s10)
c000b870:	000f0593          	mv	a1,t5
c000b874:	03d12223          	sw	t4,36(sp)
c000b878:	03c12023          	sw	t3,32(sp)
c000b87c:	01112e23          	sw	a7,28(sp)
c000b880:	aacfd0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000b884:	00ad2223          	sw	a0,4(s10)
c000b888:	008d2423          	sw	s0,8(s10)
c000b88c:	01c12883          	lw	a7,28(sp)
c000b890:	02012e03          	lw	t3,32(sp)
c000b894:	02412e83          	lw	t4,36(sp)
c000b898:	e2050ce3          	beqz	a0,c000b6d0 <stride_dequeue+0x2754>
c000b89c:	01a52023          	sw	s10,0(a0)
c000b8a0:	000d0f13          	mv	t5,s10
c000b8a4:	008ba403          	lw	s0,8(s7)
c000b8a8:	d61fd06f          	j	c0009608 <stride_dequeue+0x68c>
c000b8ac:	008ba403          	lw	s0,8(s7)
c000b8b0:	00030c13          	mv	s8,t1
c000b8b4:	851fe06f          	j	c000a104 <stride_dequeue+0x1188>
c000b8b8:	008ba403          	lw	s0,8(s7)
c000b8bc:	00078c13          	mv	s8,a5
c000b8c0:	af9fe06f          	j	c000a3b8 <stride_dequeue+0x143c>
c000b8c4:	008ba403          	lw	s0,8(s7)
c000b8c8:	000d8e13          	mv	t3,s11
c000b8cc:	eacfe06f          	j	c0009f78 <stride_dequeue+0xffc>
c000b8d0:	008ea503          	lw	a0,8(t4)
c000b8d4:	000c0593          	mv	a1,s8
c000b8d8:	004ea403          	lw	s0,4(t4)
c000b8dc:	03e12423          	sw	t5,40(sp)
c000b8e0:	03d12223          	sw	t4,36(sp)
c000b8e4:	a48fd0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000b8e8:	02412e83          	lw	t4,36(sp)
c000b8ec:	02812f03          	lw	t5,40(sp)
c000b8f0:	00aea223          	sw	a0,4(t4)
c000b8f4:	008ea423          	sw	s0,8(t4)
c000b8f8:	e00508e3          	beqz	a0,c000b708 <stride_dequeue+0x278c>
c000b8fc:	01d52023          	sw	t4,0(a0)
c000b900:	000e8c13          	mv	s8,t4
c000b904:	008ba403          	lw	s0,8(s7)
c000b908:	8c8fe06f          	j	c00099d0 <stride_dequeue+0xa54>
c000b90c:	008aa503          	lw	a0,8(s5)
c000b910:	004aa403          	lw	s0,4(s5)
c000b914:	000f0593          	mv	a1,t5
c000b918:	02f12223          	sw	a5,36(sp)
c000b91c:	03d12023          	sw	t4,32(sp)
c000b920:	a0cfd0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000b924:	00aaa223          	sw	a0,4(s5)
c000b928:	008aa423          	sw	s0,8(s5)
c000b92c:	02012e83          	lw	t4,32(sp)
c000b930:	02412783          	lw	a5,36(sp)
c000b934:	d80508e3          	beqz	a0,c000b6c4 <stride_dequeue+0x2748>
c000b938:	01552023          	sw	s5,0(a0)
c000b93c:	000a8f13          	mv	t5,s5
c000b940:	008ba403          	lw	s0,8(s7)
c000b944:	abdfd06f          	j	c0009400 <stride_dequeue+0x484>
c000b948:	000c0f13          	mv	t5,s8
c000b94c:	fc1fe06f          	j	c000a90c <stride_dequeue+0x1990>
c000b950:	000c0f13          	mv	t5,s8
c000b954:	dfdfe06f          	j	c000a750 <stride_dequeue+0x17d4>
c000b958:	000d8c13          	mv	s8,s11
c000b95c:	9ecff06f          	j	c000ab48 <stride_dequeue+0x1bcc>
c000b960:	004da703          	lw	a4,4(s11)
c000b964:	008da783          	lw	a5,8(s11)
c000b968:	02a12623          	sw	a0,44(sp)
c000b96c:	02e12023          	sw	a4,32(sp)
c000b970:	04078a63          	beqz	a5,c000b9c4 <stride_dequeue+0x2a48>
c000b974:	00078513          	mv	a0,a5
c000b978:	000c0593          	mv	a1,s8
c000b97c:	03c12423          	sw	t3,40(sp)
c000b980:	02f12223          	sw	a5,36(sp)
c000b984:	91cfd0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000b988:	02c12703          	lw	a4,44(sp)
c000b98c:	02412783          	lw	a5,36(sp)
c000b990:	02812e03          	lw	t3,40(sp)
c000b994:	1ce506e3          	beq	a0,a4,c000c360 <stride_dequeue+0x33e4>
c000b998:	008c2583          	lw	a1,8(s8)
c000b99c:	004c2403          	lw	s0,4(s8)
c000b9a0:	00078513          	mv	a0,a5
c000b9a4:	03c12223          	sw	t3,36(sp)
c000b9a8:	984fd0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000b9ac:	00ac2223          	sw	a0,4(s8)
c000b9b0:	008c2423          	sw	s0,8(s8)
c000b9b4:	02412e03          	lw	t3,36(sp)
c000b9b8:	00050463          	beqz	a0,c000b9c0 <stride_dequeue+0x2a44>
c000b9bc:	01852023          	sw	s8,0(a0)
c000b9c0:	008ba403          	lw	s0,8(s7)
c000b9c4:	02012783          	lw	a5,32(sp)
c000b9c8:	018da223          	sw	s8,4(s11)
c000b9cc:	00fda423          	sw	a5,8(s11)
c000b9d0:	01bc2023          	sw	s11,0(s8)
c000b9d4:	000d8c13          	mv	s8,s11
c000b9d8:	970ff06f          	j	c000ab48 <stride_dequeue+0x1bcc>
c000b9dc:	008b2503          	lw	a0,8(s6)
c000b9e0:	004b2403          	lw	s0,4(s6)
c000b9e4:	000e0593          	mv	a1,t3
c000b9e8:	01112e23          	sw	a7,28(sp)
c000b9ec:	01012c23          	sw	a6,24(sp)
c000b9f0:	93cfd0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000b9f4:	00ab2223          	sw	a0,4(s6)
c000b9f8:	008b2423          	sw	s0,8(s6)
c000b9fc:	01812803          	lw	a6,24(sp)
c000ba00:	01c12883          	lw	a7,28(sp)
c000ba04:	dc050ce3          	beqz	a0,c000b7dc <stride_dequeue+0x2860>
c000ba08:	01652023          	sw	s6,0(a0)
c000ba0c:	000b0e13          	mv	t3,s6
c000ba10:	008ba403          	lw	s0,8(s7)
c000ba14:	930fe06f          	j	c0009b44 <stride_dequeue+0xbc8>
c000ba18:	008da503          	lw	a0,8(s11)
c000ba1c:	004da403          	lw	s0,4(s11)
c000ba20:	000e0593          	mv	a1,t3
c000ba24:	00e12e23          	sw	a4,28(sp)
c000ba28:	00f12c23          	sw	a5,24(sp)
c000ba2c:	900fd0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000ba30:	00ada223          	sw	a0,4(s11)
c000ba34:	008da423          	sw	s0,8(s11)
c000ba38:	01812783          	lw	a5,24(sp)
c000ba3c:	01c12703          	lw	a4,28(sp)
c000ba40:	e80502e3          	beqz	a0,c000b8c4 <stride_dequeue+0x2948>
c000ba44:	01b52023          	sw	s11,0(a0)
c000ba48:	000d8e13          	mv	t3,s11
c000ba4c:	008ba403          	lw	s0,8(s7)
c000ba50:	d28fe06f          	j	c0009f78 <stride_dequeue+0xffc>
c000ba54:	004c2783          	lw	a5,4(s8)
c000ba58:	008c2d83          	lw	s11,8(s8)
c000ba5c:	02a12623          	sw	a0,44(sp)
c000ba60:	02f12023          	sw	a5,32(sp)
c000ba64:	040d8e63          	beqz	s11,c000bac0 <stride_dequeue+0x2b44>
c000ba68:	000f0593          	mv	a1,t5
c000ba6c:	000d8513          	mv	a0,s11
c000ba70:	03c12423          	sw	t3,40(sp)
c000ba74:	03e12223          	sw	t5,36(sp)
c000ba78:	828fd0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000ba7c:	02c12f83          	lw	t6,44(sp)
c000ba80:	02412f03          	lw	t5,36(sp)
c000ba84:	02812e03          	lw	t3,40(sp)
c000ba88:	63f50863          	beq	a0,t6,c000c0b8 <stride_dequeue+0x313c>
c000ba8c:	008f2583          	lw	a1,8(t5)
c000ba90:	000d8513          	mv	a0,s11
c000ba94:	004f2403          	lw	s0,4(t5)
c000ba98:	03c12423          	sw	t3,40(sp)
c000ba9c:	03e12223          	sw	t5,36(sp)
c000baa0:	88cfd0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000baa4:	02412f03          	lw	t5,36(sp)
c000baa8:	02812e03          	lw	t3,40(sp)
c000baac:	00af2223          	sw	a0,4(t5)
c000bab0:	008f2423          	sw	s0,8(t5)
c000bab4:	00050463          	beqz	a0,c000babc <stride_dequeue+0x2b40>
c000bab8:	01e52023          	sw	t5,0(a0)
c000babc:	008ba403          	lw	s0,8(s7)
c000bac0:	02012783          	lw	a5,32(sp)
c000bac4:	01ec2223          	sw	t5,4(s8)
c000bac8:	00fc2423          	sw	a5,8(s8)
c000bacc:	018f2023          	sw	s8,0(t5)
c000bad0:	000c0f13          	mv	t5,s8
c000bad4:	e39fe06f          	j	c000a90c <stride_dequeue+0x1990>
c000bad8:	0087a503          	lw	a0,8(a5)
c000badc:	000c0593          	mv	a1,s8
c000bae0:	0047a403          	lw	s0,4(a5)
c000bae4:	848fd0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000bae8:	02012783          	lw	a5,32(sp)
c000baec:	02412e03          	lw	t3,36(sp)
c000baf0:	00a7a223          	sw	a0,4(a5)
c000baf4:	0087a423          	sw	s0,8(a5)
c000baf8:	ce0508e3          	beqz	a0,c000b7e8 <stride_dequeue+0x286c>
c000bafc:	00f52023          	sw	a5,0(a0)
c000bb00:	00078c13          	mv	s8,a5
c000bb04:	008ba403          	lw	s0,8(s7)
c000bb08:	f58fe06f          	j	c000a260 <stride_dequeue+0x12e4>
c000bb0c:	004c2703          	lw	a4,4(s8)
c000bb10:	008c2783          	lw	a5,8(s8)
c000bb14:	02a12623          	sw	a0,44(sp)
c000bb18:	02e12023          	sw	a4,32(sp)
c000bb1c:	04078a63          	beqz	a5,c000bb70 <stride_dequeue+0x2bf4>
c000bb20:	000f0593          	mv	a1,t5
c000bb24:	00078513          	mv	a0,a5
c000bb28:	03e12423          	sw	t5,40(sp)
c000bb2c:	02f12223          	sw	a5,36(sp)
c000bb30:	f71fc0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000bb34:	02c12f83          	lw	t6,44(sp)
c000bb38:	02412783          	lw	a5,36(sp)
c000bb3c:	02812f03          	lw	t5,40(sp)
c000bb40:	5ff50a63          	beq	a0,t6,c000c134 <stride_dequeue+0x31b8>
c000bb44:	008f2583          	lw	a1,8(t5)
c000bb48:	00078513          	mv	a0,a5
c000bb4c:	004f2403          	lw	s0,4(t5)
c000bb50:	03e12223          	sw	t5,36(sp)
c000bb54:	fd9fc0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000bb58:	02412f03          	lw	t5,36(sp)
c000bb5c:	00af2223          	sw	a0,4(t5)
c000bb60:	008f2423          	sw	s0,8(t5)
c000bb64:	00050463          	beqz	a0,c000bb6c <stride_dequeue+0x2bf0>
c000bb68:	01e52023          	sw	t5,0(a0)
c000bb6c:	008ba403          	lw	s0,8(s7)
c000bb70:	02012783          	lw	a5,32(sp)
c000bb74:	01ec2223          	sw	t5,4(s8)
c000bb78:	00fc2423          	sw	a5,8(s8)
c000bb7c:	018f2023          	sw	s8,0(t5)
c000bb80:	000c0f13          	mv	t5,s8
c000bb84:	bcdfe06f          	j	c000a750 <stride_dequeue+0x17d4>
c000bb88:	008ba403          	lw	s0,8(s7)
c000bb8c:	000d8893          	mv	a7,s11
c000bb90:	979fe06f          	j	c000a508 <stride_dequeue+0x158c>
c000bb94:	00832503          	lw	a0,8(t1)
c000bb98:	000c0593          	mv	a1,s8
c000bb9c:	00432403          	lw	s0,4(t1)
c000bba0:	03c12023          	sw	t3,32(sp)
c000bba4:	00612e23          	sw	t1,28(sp)
c000bba8:	f85fc0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000bbac:	01c12303          	lw	t1,28(sp)
c000bbb0:	02012e03          	lw	t3,32(sp)
c000bbb4:	00a32223          	sw	a0,4(t1)
c000bbb8:	00832423          	sw	s0,8(t1)
c000bbbc:	ce0508e3          	beqz	a0,c000b8ac <stride_dequeue+0x2930>
c000bbc0:	00652023          	sw	t1,0(a0)
c000bbc4:	00030c13          	mv	s8,t1
c000bbc8:	008ba403          	lw	s0,8(s7)
c000bbcc:	d38fe06f          	j	c000a104 <stride_dequeue+0x1188>
c000bbd0:	008b2503          	lw	a0,8(s6)
c000bbd4:	004b2403          	lw	s0,4(s6)
c000bbd8:	000e0593          	mv	a1,t3
c000bbdc:	01112e23          	sw	a7,28(sp)
c000bbe0:	01012c23          	sw	a6,24(sp)
c000bbe4:	f49fc0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000bbe8:	00ab2223          	sw	a0,4(s6)
c000bbec:	008b2423          	sw	s0,8(s6)
c000bbf0:	01812803          	lw	a6,24(sp)
c000bbf4:	01c12883          	lw	a7,28(sp)
c000bbf8:	bc050ce3          	beqz	a0,c000b7d0 <stride_dequeue+0x2854>
c000bbfc:	01652023          	sw	s6,0(a0)
c000bc00:	000b0e13          	mv	t3,s6
c000bc04:	008ba403          	lw	s0,8(s7)
c000bc08:	a14fe06f          	j	c0009e1c <stride_dequeue+0xea0>
c000bc0c:	0087a503          	lw	a0,8(a5)
c000bc10:	000c0593          	mv	a1,s8
c000bc14:	0047a403          	lw	s0,4(a5)
c000bc18:	f15fc0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000bc1c:	02012783          	lw	a5,32(sp)
c000bc20:	02412e03          	lw	t3,36(sp)
c000bc24:	00a7a223          	sw	a0,4(a5)
c000bc28:	0087a423          	sw	s0,8(a5)
c000bc2c:	c80506e3          	beqz	a0,c000b8b8 <stride_dequeue+0x293c>
c000bc30:	00f52023          	sw	a5,0(a0)
c000bc34:	00078c13          	mv	s8,a5
c000bc38:	008ba403          	lw	s0,8(s7)
c000bc3c:	f7cfe06f          	j	c000a3b8 <stride_dequeue+0x143c>
c000bc40:	004c2703          	lw	a4,4(s8)
c000bc44:	008c2783          	lw	a5,8(s8)
c000bc48:	02a12623          	sw	a0,44(sp)
c000bc4c:	02e12023          	sw	a4,32(sp)
c000bc50:	04078a63          	beqz	a5,c000bca4 <stride_dequeue+0x2d28>
c000bc54:	000e8593          	mv	a1,t4
c000bc58:	00078513          	mv	a0,a5
c000bc5c:	03d12423          	sw	t4,40(sp)
c000bc60:	02f12223          	sw	a5,36(sp)
c000bc64:	e3dfc0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000bc68:	02c12f83          	lw	t6,44(sp)
c000bc6c:	02412783          	lw	a5,36(sp)
c000bc70:	02812e83          	lw	t4,40(sp)
c000bc74:	3ff50e63          	beq	a0,t6,c000c070 <stride_dequeue+0x30f4>
c000bc78:	008ea583          	lw	a1,8(t4)
c000bc7c:	00078513          	mv	a0,a5
c000bc80:	004ea403          	lw	s0,4(t4)
c000bc84:	03d12223          	sw	t4,36(sp)
c000bc88:	ea5fc0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000bc8c:	02412e83          	lw	t4,36(sp)
c000bc90:	00aea223          	sw	a0,4(t4)
c000bc94:	008ea423          	sw	s0,8(t4)
c000bc98:	00050463          	beqz	a0,c000bca0 <stride_dequeue+0x2d24>
c000bc9c:	01d52023          	sw	t4,0(a0)
c000bca0:	008ba403          	lw	s0,8(s7)
c000bca4:	02012783          	lw	a5,32(sp)
c000bca8:	01dc2223          	sw	t4,4(s8)
c000bcac:	00fc2423          	sw	a5,8(s8)
c000bcb0:	018ea023          	sw	s8,0(t4)
c000bcb4:	000c0e93          	mv	t4,s8
c000bcb8:	ba4ff06f          	j	c000b05c <stride_dequeue+0x20e0>
c000bcbc:	0087a503          	lw	a0,8(a5)
c000bcc0:	000d8593          	mv	a1,s11
c000bcc4:	0047a403          	lw	s0,4(a5)
c000bcc8:	03d12023          	sw	t4,32(sp)
c000bccc:	00f12e23          	sw	a5,28(sp)
c000bcd0:	e5dfc0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000bcd4:	01c12783          	lw	a5,28(sp)
c000bcd8:	02012e83          	lw	t4,32(sp)
c000bcdc:	00a7a223          	sw	a0,4(a5)
c000bce0:	0087a423          	sw	s0,8(a5)
c000bce4:	3a050e63          	beqz	a0,c000c0a0 <stride_dequeue+0x3124>
c000bce8:	00f52023          	sw	a5,0(a0)
c000bcec:	00078d93          	mv	s11,a5
c000bcf0:	008ba403          	lw	s0,8(s7)
c000bcf4:	848ff06f          	j	c000ad3c <stride_dequeue+0x1dc0>
c000bcf8:	004da783          	lw	a5,4(s11)
c000bcfc:	008dac03          	lw	s8,8(s11)
c000bd00:	02a12623          	sw	a0,44(sp)
c000bd04:	02f12023          	sw	a5,32(sp)
c000bd08:	040c0a63          	beqz	s8,c000bd5c <stride_dequeue+0x2de0>
c000bd0c:	000e8593          	mv	a1,t4
c000bd10:	000c0513          	mv	a0,s8
c000bd14:	d8dfc0ef          	jal	ra,c0008aa0 <proc_stride_comp_f>
c000bd18:	02c12703          	lw	a4,44(sp)
c000bd1c:	02412e83          	lw	t4,36(sp)
c000bd20:	02812e03          	lw	t3,40(sp)
c000bd24:	50e50863          	beq	a0,a4,c000c234 <stride_dequeue+0x32b8>
c000bd28:	008ea583          	lw	a1,8(t4)
c000bd2c:	000c0513          	mv	a0,s8
c000bd30:	004ea403          	lw	s0,4(t4)
c000bd34:	03c12423          	sw	t3,40(sp)
c000bd38:	03d12223          	sw	t4,36(sp)
c000bd3c:	df1fc0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000bd40:	02412e83          	lw	t4,36(sp)
c000bd44:	02812e03          	lw	t3,40(sp)
c000bd48:	00aea223          	sw	a0,4(t4)
c000bd4c:	008ea423          	sw	s0,8(t4)
c000bd50:	00050463          	beqz	a0,c000bd58 <stride_dequeue+0x2ddc>
c000bd54:	01d52023          	sw	t4,0(a0)
c000bd58:	008ba403          	lw	s0,8(s7)
c000bd5c:	02012783          	lw	a5,32(sp)
c000bd60:	01dda223          	sw	t4,4(s11)
c000bd64:	00fda423          	sw	a5,8(s11)
c000bd68:	01bea023          	sw	s11,0(t4)
c000bd6c:	000d8e93          	mv	t4,s11
c000bd70:	96cff06f          	j	c000aedc <stride_dequeue+0x1f60>
c000bd74:	008c2503          	lw	a0,8(s8)
c000bd78:	004c2403          	lw	s0,4(s8)
c000bd7c:	000b0593          	mv	a1,s6
c000bd80:	dadfc0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000bd84:	00ac2223          	sw	a0,4(s8)
c000bd88:	008c2423          	sw	s0,8(s8)
c000bd8c:	01812303          	lw	t1,24(sp)
c000bd90:	44050a63          	beqz	a0,c000c1e4 <stride_dequeue+0x3268>
c000bd94:	01852023          	sw	s8,0(a0)
c000bd98:	000c0b13          	mv	s6,s8
c000bd9c:	008ba403          	lw	s0,8(s7)
c000bda0:	ce8ff06f          	j	c000b288 <stride_dequeue+0x230c>
c000bda4:	008c2503          	lw	a0,8(s8)
c000bda8:	004c2403          	lw	s0,4(s8)
c000bdac:	000b0593          	mv	a1,s6
c000bdb0:	d7dfc0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000bdb4:	00ac2223          	sw	a0,4(s8)
c000bdb8:	008c2423          	sw	s0,8(s8)
c000bdbc:	01812783          	lw	a5,24(sp)
c000bdc0:	3a050263          	beqz	a0,c000c164 <stride_dequeue+0x31e8>
c000bdc4:	01852023          	sw	s8,0(a0)
c000bdc8:	000c0b13          	mv	s6,s8
c000bdcc:	008ba403          	lw	s0,8(s7)
c000bdd0:	bf4ff06f          	j	c000b1c4 <stride_dequeue+0x2248>
c000bdd4:	008c2503          	lw	a0,8(s8)
c000bdd8:	004c2403          	lw	s0,4(s8)
c000bddc:	000b0593          	mv	a1,s6
c000bde0:	d4dfc0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000bde4:	00ac2223          	sw	a0,4(s8)
c000bde8:	008c2423          	sw	s0,8(s8)
c000bdec:	01812783          	lw	a5,24(sp)
c000bdf0:	5e050463          	beqz	a0,c000c3d8 <stride_dequeue+0x345c>
c000bdf4:	01852023          	sw	s8,0(a0)
c000bdf8:	000c0b13          	mv	s6,s8
c000bdfc:	008ba403          	lw	s0,8(s7)
c000be00:	b54ff06f          	j	c000b154 <stride_dequeue+0x21d8>
c000be04:	008da503          	lw	a0,8(s11)
c000be08:	004da403          	lw	s0,4(s11)
c000be0c:	00088593          	mv	a1,a7
c000be10:	d1dfc0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000be14:	00ada223          	sw	a0,4(s11)
c000be18:	008da423          	sw	s0,8(s11)
c000be1c:	d60506e3          	beqz	a0,c000bb88 <stride_dequeue+0x2c0c>
c000be20:	01b52023          	sw	s11,0(a0)
c000be24:	000d8893          	mv	a7,s11
c000be28:	008ba403          	lw	s0,8(s7)
c000be2c:	edcfe06f          	j	c000a508 <stride_dequeue+0x158c>
c000be30:	008c2503          	lw	a0,8(s8)
c000be34:	02012583          	lw	a1,32(sp)
c000be38:	004c2403          	lw	s0,4(s8)
c000be3c:	cf1fc0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000be40:	00ac2223          	sw	a0,4(s8)
c000be44:	008c2423          	sw	s0,8(s8)
c000be48:	02812e03          	lw	t3,40(sp)
c000be4c:	02c12f03          	lw	t5,44(sp)
c000be50:	00050463          	beqz	a0,c000be58 <stride_dequeue+0x2edc>
c000be54:	01852023          	sw	s8,0(a0)
c000be58:	008ba403          	lw	s0,8(s7)
c000be5c:	aa1fe06f          	j	c000a8fc <stride_dequeue+0x1980>
c000be60:	00832503          	lw	a0,8(t1)
c000be64:	000f0593          	mv	a1,t5
c000be68:	00432403          	lw	s0,4(t1)
c000be6c:	cc1fc0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000be70:	02012303          	lw	t1,32(sp)
c000be74:	02412e03          	lw	t3,36(sp)
c000be78:	00a32223          	sw	a0,4(t1)
c000be7c:	00832423          	sw	s0,8(t1)
c000be80:	00050463          	beqz	a0,c000be88 <stride_dequeue+0x2f0c>
c000be84:	00652023          	sw	t1,0(a0)
c000be88:	008ba403          	lw	s0,8(s7)
c000be8c:	a68fe06f          	j	c000a0f4 <stride_dequeue+0x1178>
c000be90:	008ea503          	lw	a0,8(t4)
c000be94:	000e0593          	mv	a1,t3
c000be98:	004ea403          	lw	s0,4(t4)
c000be9c:	c91fc0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000bea0:	02812e83          	lw	t4,40(sp)
c000bea4:	02c12f03          	lw	t5,44(sp)
c000bea8:	00aea223          	sw	a0,4(t4)
c000beac:	008ea423          	sw	s0,8(t4)
c000beb0:	00050463          	beqz	a0,c000beb8 <stride_dequeue+0x2f3c>
c000beb4:	01d52023          	sw	t4,0(a0)
c000beb8:	008ba403          	lw	s0,8(s7)
c000bebc:	b05fd06f          	j	c00099c0 <stride_dequeue+0xa44>
c000bec0:	008da503          	lw	a0,8(s11)
c000bec4:	004da403          	lw	s0,4(s11)
c000bec8:	000c0593          	mv	a1,s8
c000becc:	c61fc0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000bed0:	00ada223          	sw	a0,4(s11)
c000bed4:	008da423          	sw	s0,8(s11)
c000bed8:	02412e03          	lw	t3,36(sp)
c000bedc:	02812e83          	lw	t4,40(sp)
c000bee0:	00050463          	beqz	a0,c000bee8 <stride_dequeue+0x2f6c>
c000bee4:	01b52023          	sw	s11,0(a0)
c000bee8:	008ba403          	lw	s0,8(s7)
c000beec:	fe1fe06f          	j	c000aecc <stride_dequeue+0x1f50>
c000bef0:	0087a503          	lw	a0,8(a5)
c000bef4:	000f0593          	mv	a1,t5
c000bef8:	0047a403          	lw	s0,4(a5)
c000befc:	c31fc0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000bf00:	02412783          	lw	a5,36(sp)
c000bf04:	02812e03          	lw	t3,40(sp)
c000bf08:	00a7a223          	sw	a0,4(a5)
c000bf0c:	0087a423          	sw	s0,8(a5)
c000bf10:	00050463          	beqz	a0,c000bf18 <stride_dequeue+0x2f9c>
c000bf14:	00f52023          	sw	a5,0(a0)
c000bf18:	008ba403          	lw	s0,8(s7)
c000bf1c:	c8cfe06f          	j	c000a3a8 <stride_dequeue+0x142c>
c000bf20:	008da503          	lw	a0,8(s11)
c000bf24:	02012583          	lw	a1,32(sp)
c000bf28:	004da403          	lw	s0,4(s11)
c000bf2c:	c01fc0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000bf30:	00ada223          	sw	a0,4(s11)
c000bf34:	008da423          	sw	s0,8(s11)
c000bf38:	02812e03          	lw	t3,40(sp)
c000bf3c:	00050463          	beqz	a0,c000bf44 <stride_dequeue+0x2fc8>
c000bf40:	01b52023          	sw	s11,0(a0)
c000bf44:	008ba403          	lw	s0,8(s7)
c000bf48:	bf1fe06f          	j	c000ab38 <stride_dequeue+0x1bbc>
c000bf4c:	0087a503          	lw	a0,8(a5)
c000bf50:	000f0593          	mv	a1,t5
c000bf54:	0047a403          	lw	s0,4(a5)
c000bf58:	bd5fc0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000bf5c:	02412783          	lw	a5,36(sp)
c000bf60:	02812e03          	lw	t3,40(sp)
c000bf64:	00a7a223          	sw	a0,4(a5)
c000bf68:	0087a423          	sw	s0,8(a5)
c000bf6c:	00050463          	beqz	a0,c000bf74 <stride_dequeue+0x2ff8>
c000bf70:	00f52023          	sw	a5,0(a0)
c000bf74:	008ba403          	lw	s0,8(s7)
c000bf78:	ad8fe06f          	j	c000a250 <stride_dequeue+0x12d4>
c000bf7c:	008c2503          	lw	a0,8(s8)
c000bf80:	02012583          	lw	a1,32(sp)
c000bf84:	004c2403          	lw	s0,4(s8)
c000bf88:	ba5fc0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000bf8c:	00ac2223          	sw	a0,4(s8)
c000bf90:	008c2423          	sw	s0,8(s8)
c000bf94:	02812f03          	lw	t5,40(sp)
c000bf98:	00050463          	beqz	a0,c000bfa0 <stride_dequeue+0x3024>
c000bf9c:	01852023          	sw	s8,0(a0)
c000bfa0:	008ba403          	lw	s0,8(s7)
c000bfa4:	f9cfe06f          	j	c000a740 <stride_dequeue+0x17c4>
c000bfa8:	0087a503          	lw	a0,8(a5)
c000bfac:	00098593          	mv	a1,s3
c000bfb0:	0047a403          	lw	s0,4(a5)
c000bfb4:	b79fc0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000bfb8:	01412783          	lw	a5,20(sp)
c000bfbc:	00a7a223          	sw	a0,4(a5)
c000bfc0:	0087a423          	sw	s0,8(a5)
c000bfc4:	44050863          	beqz	a0,c000c414 <stride_dequeue+0x3498>
c000bfc8:	00f52023          	sw	a5,0(a0)
c000bfcc:	00078993          	mv	s3,a5
c000bfd0:	008ba403          	lw	s0,8(s7)
c000bfd4:	b4cff06f          	j	c000b320 <stride_dequeue+0x23a4>
c000bfd8:	008c2503          	lw	a0,8(s8)
c000bfdc:	02012583          	lw	a1,32(sp)
c000bfe0:	004c2403          	lw	s0,4(s8)
c000bfe4:	b49fc0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000bfe8:	00ac2223          	sw	a0,4(s8)
c000bfec:	008c2423          	sw	s0,8(s8)
c000bff0:	02812e83          	lw	t4,40(sp)
c000bff4:	00050463          	beqz	a0,c000bffc <stride_dequeue+0x3080>
c000bff8:	01852023          	sw	s8,0(a0)
c000bffc:	008ba403          	lw	s0,8(s7)
c000c000:	84cff06f          	j	c000b04c <stride_dequeue+0x20d0>
c000c004:	008ba403          	lw	s0,8(s7)
c000c008:	000c0e13          	mv	t3,s8
c000c00c:	911fe06f          	j	c000a91c <stride_dequeue+0x19a0>
c000c010:	008ba403          	lw	s0,8(s7)
c000c014:	00078e13          	mv	t3,a5
c000c018:	d88fe06f          	j	c000a5a0 <stride_dequeue+0x1624>
c000c01c:	008ba403          	lw	s0,8(s7)
c000c020:	000c0893          	mv	a7,s8
c000c024:	96dfe06f          	j	c000a990 <stride_dequeue+0x1a14>
c000c028:	008da503          	lw	a0,8(s11)
c000c02c:	004da403          	lw	s0,4(s11)
c000c030:	000e0593          	mv	a1,t3
c000c034:	01112e23          	sw	a7,28(sp)
c000c038:	af5fc0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000c03c:	00ada223          	sw	a0,4(s11)
c000c040:	008da423          	sw	s0,8(s11)
c000c044:	01c12883          	lw	a7,28(sp)
c000c048:	00050463          	beqz	a0,c000c050 <stride_dequeue+0x30d4>
c000c04c:	01b52023          	sw	s11,0(a0)
c000c050:	008ba403          	lw	s0,8(s7)
c000c054:	ca4fe06f          	j	c000a4f8 <stride_dequeue+0x157c>
c000c058:	008ba403          	lw	s0,8(s7)
c000c05c:	000c0d93          	mv	s11,s8
c000c060:	f00fe06f          	j	c000a760 <stride_dequeue+0x17e4>
c000c064:	008ba403          	lw	s0,8(s7)
c000c068:	000d8a93          	mv	s5,s11
c000c06c:	aedfe06f          	j	c000ab58 <stride_dequeue+0x1bdc>
c000c070:	0087a503          	lw	a0,8(a5)
c000c074:	000e8593          	mv	a1,t4
c000c078:	0047a403          	lw	s0,4(a5)
c000c07c:	ab1fc0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000c080:	02412783          	lw	a5,36(sp)
c000c084:	00a7a223          	sw	a0,4(a5)
c000c088:	0087a423          	sw	s0,8(a5)
c000c08c:	3c050e63          	beqz	a0,c000c468 <stride_dequeue+0x34ec>
c000c090:	00f52023          	sw	a5,0(a0)
c000c094:	00078e93          	mv	t4,a5
c000c098:	008ba403          	lw	s0,8(s7)
c000c09c:	c09ff06f          	j	c000bca4 <stride_dequeue+0x2d28>
c000c0a0:	008ba403          	lw	s0,8(s7)
c000c0a4:	00078d93          	mv	s11,a5
c000c0a8:	c95fe06f          	j	c000ad3c <stride_dequeue+0x1dc0>
c000c0ac:	008ba403          	lw	s0,8(s7)
c000c0b0:	000e0d93          	mv	s11,t3
c000c0b4:	c44fe06f          	j	c000a4f8 <stride_dequeue+0x157c>
c000c0b8:	008da503          	lw	a0,8(s11)
c000c0bc:	004da403          	lw	s0,4(s11)
c000c0c0:	000f0593          	mv	a1,t5
c000c0c4:	03c12223          	sw	t3,36(sp)
c000c0c8:	a65fc0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000c0cc:	00ada223          	sw	a0,4(s11)
c000c0d0:	008da423          	sw	s0,8(s11)
c000c0d4:	02412e03          	lw	t3,36(sp)
c000c0d8:	38050e63          	beqz	a0,c000c474 <stride_dequeue+0x34f8>
c000c0dc:	01b52023          	sw	s11,0(a0)
c000c0e0:	000d8f13          	mv	t5,s11
c000c0e4:	008ba403          	lw	s0,8(s7)
c000c0e8:	9d9ff06f          	j	c000bac0 <stride_dequeue+0x2b44>
c000c0ec:	008ba403          	lw	s0,8(s7)
c000c0f0:	000c0d13          	mv	s10,s8
c000c0f4:	acdfe06f          	j	c000abc0 <stride_dequeue+0x1c44>
c000c0f8:	008ba403          	lw	s0,8(s7)
c000c0fc:	000f0793          	mv	a5,t5
c000c100:	aa8fe06f          	j	c000a3a8 <stride_dequeue+0x142c>
c000c104:	008da503          	lw	a0,8(s11)
c000c108:	004da403          	lw	s0,4(s11)
c000c10c:	00028593          	mv	a1,t0
c000c110:	03c12623          	sw	t3,44(sp)
c000c114:	a19fc0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000c118:	00ada223          	sw	a0,4(s11)
c000c11c:	008da423          	sw	s0,8(s11)
c000c120:	02c12e03          	lw	t3,44(sp)
c000c124:	00050463          	beqz	a0,c000c12c <stride_dequeue+0x31b0>
c000c128:	01b52023          	sw	s11,0(a0)
c000c12c:	008ba403          	lw	s0,8(s7)
c000c130:	9f1fe06f          	j	c000ab20 <stride_dequeue+0x1ba4>
c000c134:	0087a503          	lw	a0,8(a5)
c000c138:	000f0593          	mv	a1,t5
c000c13c:	0047a403          	lw	s0,4(a5)
c000c140:	9edfc0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000c144:	02412783          	lw	a5,36(sp)
c000c148:	00a7a223          	sw	a0,4(a5)
c000c14c:	0087a423          	sw	s0,8(a5)
c000c150:	32050863          	beqz	a0,c000c480 <stride_dequeue+0x3504>
c000c154:	00f52023          	sw	a5,0(a0)
c000c158:	00078f13          	mv	t5,a5
c000c15c:	008ba403          	lw	s0,8(s7)
c000c160:	a11ff06f          	j	c000bb70 <stride_dequeue+0x2bf4>
c000c164:	008ba403          	lw	s0,8(s7)
c000c168:	000c0b13          	mv	s6,s8
c000c16c:	858ff06f          	j	c000b1c4 <stride_dequeue+0x2248>
c000c170:	008c2503          	lw	a0,8(s8)
c000c174:	004c2403          	lw	s0,4(s8)
c000c178:	000f8593          	mv	a1,t6
c000c17c:	03e12a23          	sw	t5,52(sp)
c000c180:	03c12823          	sw	t3,48(sp)
c000c184:	9a9fc0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000c188:	00ac2223          	sw	a0,4(s8)
c000c18c:	008c2423          	sw	s0,8(s8)
c000c190:	03012e03          	lw	t3,48(sp)
c000c194:	03412f03          	lw	t5,52(sp)
c000c198:	00050463          	beqz	a0,c000c1a0 <stride_dequeue+0x3224>
c000c19c:	01852023          	sw	s8,0(a0)
c000c1a0:	008ba403          	lw	s0,8(s7)
c000c1a4:	f2cfe06f          	j	c000a8d0 <stride_dequeue+0x1954>
c000c1a8:	008ba403          	lw	s0,8(s7)
c000c1ac:	000f0793          	mv	a5,t5
c000c1b0:	8a0fe06f          	j	c000a250 <stride_dequeue+0x12d4>
c000c1b4:	008c2503          	lw	a0,8(s8)
c000c1b8:	004c2403          	lw	s0,4(s8)
c000c1bc:	00028593          	mv	a1,t0
c000c1c0:	03e12623          	sw	t5,44(sp)
c000c1c4:	969fc0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000c1c8:	00ac2223          	sw	a0,4(s8)
c000c1cc:	008c2423          	sw	s0,8(s8)
c000c1d0:	02c12f03          	lw	t5,44(sp)
c000c1d4:	00050463          	beqz	a0,c000c1dc <stride_dequeue+0x3260>
c000c1d8:	01852023          	sw	s8,0(a0)
c000c1dc:	008ba403          	lw	s0,8(s7)
c000c1e0:	d48fe06f          	j	c000a728 <stride_dequeue+0x17ac>
c000c1e4:	008ba403          	lw	s0,8(s7)
c000c1e8:	000c0b13          	mv	s6,s8
c000c1ec:	89cff06f          	j	c000b288 <stride_dequeue+0x230c>
c000c1f0:	008ba403          	lw	s0,8(s7)
c000c1f4:	000c0d93          	mv	s11,s8
c000c1f8:	a99fe06f          	j	c000ac90 <stride_dequeue+0x1d14>
c000c1fc:	008da503          	lw	a0,8(s11)
c000c200:	004da403          	lw	s0,4(s11)
c000c204:	000f8593          	mv	a1,t6
c000c208:	02512a23          	sw	t0,52(sp)
c000c20c:	03c12823          	sw	t3,48(sp)
c000c210:	91dfc0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000c214:	00ada223          	sw	a0,4(s11)
c000c218:	008da423          	sw	s0,8(s11)
c000c21c:	03012e03          	lw	t3,48(sp)
c000c220:	03412283          	lw	t0,52(sp)
c000c224:	00050463          	beqz	a0,c000c22c <stride_dequeue+0x32b0>
c000c228:	01b52023          	sw	s11,0(a0)
c000c22c:	008ba403          	lw	s0,8(s7)
c000c230:	8ddfe06f          	j	c000ab0c <stride_dequeue+0x1b90>
c000c234:	008c2503          	lw	a0,8(s8)
c000c238:	004c2403          	lw	s0,4(s8)
c000c23c:	000e8593          	mv	a1,t4
c000c240:	03c12223          	sw	t3,36(sp)
c000c244:	8e9fc0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000c248:	00ac2223          	sw	a0,4(s8)
c000c24c:	008c2423          	sw	s0,8(s8)
c000c250:	02412e03          	lw	t3,36(sp)
c000c254:	20050463          	beqz	a0,c000c45c <stride_dequeue+0x34e0>
c000c258:	01852023          	sw	s8,0(a0)
c000c25c:	000c0e93          	mv	t4,s8
c000c260:	008ba403          	lw	s0,8(s7)
c000c264:	af9ff06f          	j	c000bd5c <stride_dequeue+0x2de0>
c000c268:	008ba403          	lw	s0,8(s7)
c000c26c:	000e0e93          	mv	t4,t3
c000c270:	f50fd06f          	j	c00099c0 <stride_dequeue+0xa44>
c000c274:	008da503          	lw	a0,8(s11)
c000c278:	004da403          	lw	s0,4(s11)
c000c27c:	00028593          	mv	a1,t0
c000c280:	03d12623          	sw	t4,44(sp)
c000c284:	03c12423          	sw	t3,40(sp)
c000c288:	8a5fc0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000c28c:	00ada223          	sw	a0,4(s11)
c000c290:	008da423          	sw	s0,8(s11)
c000c294:	02812e03          	lw	t3,40(sp)
c000c298:	02c12e83          	lw	t4,44(sp)
c000c29c:	00050463          	beqz	a0,c000c2a4 <stride_dequeue+0x3328>
c000c2a0:	01b52023          	sw	s11,0(a0)
c000c2a4:	008ba403          	lw	s0,8(s7)
c000c2a8:	c11fe06f          	j	c000aeb8 <stride_dequeue+0x1f3c>
c000c2ac:	008c2503          	lw	a0,8(s8)
c000c2b0:	004c2403          	lw	s0,4(s8)
c000c2b4:	000f8593          	mv	a1,t6
c000c2b8:	02512a23          	sw	t0,52(sp)
c000c2bc:	03d12823          	sw	t4,48(sp)
c000c2c0:	86dfc0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000c2c4:	00ac2223          	sw	a0,4(s8)
c000c2c8:	008c2423          	sw	s0,8(s8)
c000c2cc:	03012e83          	lw	t4,48(sp)
c000c2d0:	03412283          	lw	t0,52(sp)
c000c2d4:	00050463          	beqz	a0,c000c2dc <stride_dequeue+0x3360>
c000c2d8:	01852023          	sw	s8,0(a0)
c000c2dc:	008ba403          	lw	s0,8(s7)
c000c2e0:	d41fe06f          	j	c000b020 <stride_dequeue+0x20a4>
c000c2e4:	008da503          	lw	a0,8(s11)
c000c2e8:	004da403          	lw	s0,4(s11)
c000c2ec:	000f8593          	mv	a1,t6
c000c2f0:	02512a23          	sw	t0,52(sp)
c000c2f4:	03d12823          	sw	t4,48(sp)
c000c2f8:	03c12623          	sw	t3,44(sp)
c000c2fc:	831fc0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000c300:	00ada223          	sw	a0,4(s11)
c000c304:	008da423          	sw	s0,8(s11)
c000c308:	02c12e03          	lw	t3,44(sp)
c000c30c:	03012e83          	lw	t4,48(sp)
c000c310:	03412283          	lw	t0,52(sp)
c000c314:	00050463          	beqz	a0,c000c31c <stride_dequeue+0x33a0>
c000c318:	01b52023          	sw	s11,0(a0)
c000c31c:	008ba403          	lw	s0,8(s7)
c000c320:	b85fe06f          	j	c000aea4 <stride_dequeue+0x1f28>
c000c324:	008ba403          	lw	s0,8(s7)
c000c328:	000f0313          	mv	t1,t5
c000c32c:	dc9fd06f          	j	c000a0f4 <stride_dequeue+0x1178>
c000c330:	008c2503          	lw	a0,8(s8)
c000c334:	004c2403          	lw	s0,4(s8)
c000c338:	000d8593          	mv	a1,s11
c000c33c:	ff0fc0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000c340:	00ac2223          	sw	a0,4(s8)
c000c344:	008c2423          	sw	s0,8(s8)
c000c348:	02c12e03          	lw	t3,44(sp)
c000c34c:	03012f03          	lw	t5,48(sp)
c000c350:	00050463          	beqz	a0,c000c358 <stride_dequeue+0x33dc>
c000c354:	01852023          	sw	s8,0(a0)
c000c358:	008ba403          	lw	s0,8(s7)
c000c35c:	d88fe06f          	j	c000a8e4 <stride_dequeue+0x1968>
c000c360:	0087a503          	lw	a0,8(a5)
c000c364:	000c0593          	mv	a1,s8
c000c368:	0047a403          	lw	s0,4(a5)
c000c36c:	fc0fc0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000c370:	02412783          	lw	a5,36(sp)
c000c374:	02812e03          	lw	t3,40(sp)
c000c378:	00a7a223          	sw	a0,4(a5)
c000c37c:	0087a423          	sw	s0,8(a5)
c000c380:	0a050063          	beqz	a0,c000c420 <stride_dequeue+0x34a4>
c000c384:	00f52023          	sw	a5,0(a0)
c000c388:	00078c13          	mv	s8,a5
c000c38c:	008ba403          	lw	s0,8(s7)
c000c390:	e34ff06f          	j	c000b9c4 <stride_dequeue+0x2a48>
c000c394:	008ba403          	lw	s0,8(s7)
c000c398:	000c0d93          	mv	s11,s8
c000c39c:	88dfe06f          	j	c000ac28 <stride_dequeue+0x1cac>
c000c3a0:	008c2503          	lw	a0,8(s8)
c000c3a4:	004c2403          	lw	s0,4(s8)
c000c3a8:	000f8593          	mv	a1,t6
c000c3ac:	02512a23          	sw	t0,52(sp)
c000c3b0:	03e12823          	sw	t5,48(sp)
c000c3b4:	f78fc0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000c3b8:	00ac2223          	sw	a0,4(s8)
c000c3bc:	008c2423          	sw	s0,8(s8)
c000c3c0:	03012f03          	lw	t5,48(sp)
c000c3c4:	03412283          	lw	t0,52(sp)
c000c3c8:	00050463          	beqz	a0,c000c3d0 <stride_dequeue+0x3454>
c000c3cc:	01852023          	sw	s8,0(a0)
c000c3d0:	008ba403          	lw	s0,8(s7)
c000c3d4:	b40fe06f          	j	c000a714 <stride_dequeue+0x1798>
c000c3d8:	008ba403          	lw	s0,8(s7)
c000c3dc:	000c0b13          	mv	s6,s8
c000c3e0:	d75fe06f          	j	c000b154 <stride_dequeue+0x21d8>
c000c3e4:	008c2503          	lw	a0,8(s8)
c000c3e8:	004c2403          	lw	s0,4(s8)
c000c3ec:	00028593          	mv	a1,t0
c000c3f0:	03d12623          	sw	t4,44(sp)
c000c3f4:	f38fc0ef          	jal	ra,c0008b2c <skew_heap_merge.constprop.3>
c000c3f8:	00ac2223          	sw	a0,4(s8)
c000c3fc:	008c2423          	sw	s0,8(s8)
c000c400:	02c12e83          	lw	t4,44(sp)
c000c404:	00050463          	beqz	a0,c000c40c <stride_dequeue+0x3490>
c000c408:	01852023          	sw	s8,0(a0)
c000c40c:	008ba403          	lw	s0,8(s7)
c000c410:	c25fe06f          	j	c000b034 <stride_dequeue+0x20b8>
c000c414:	008ba403          	lw	s0,8(s7)
c000c418:	00078993          	mv	s3,a5
c000c41c:	f05fe06f          	j	c000b320 <stride_dequeue+0x23a4>
c000c420:	008ba403          	lw	s0,8(s7)
c000c424:	00078c13          	mv	s8,a5
c000c428:	d9cff06f          	j	c000b9c4 <stride_dequeue+0x2a48>
c000c42c:	008ba403          	lw	s0,8(s7)
c000c430:	000f8c13          	mv	s8,t6
c000c434:	ae0fe06f          	j	c000a714 <stride_dequeue+0x1798>
c000c438:	008ba403          	lw	s0,8(s7)
c000c43c:	000f8c13          	mv	s8,t6
c000c440:	be1fe06f          	j	c000b020 <stride_dequeue+0x20a4>
c000c444:	008ba403          	lw	s0,8(s7)
c000c448:	000f8d93          	mv	s11,t6
c000c44c:	a59fe06f          	j	c000aea4 <stride_dequeue+0x1f28>
c000c450:	008ba403          	lw	s0,8(s7)
c000c454:	000f8d93          	mv	s11,t6
c000c458:	eb4fe06f          	j	c000ab0c <stride_dequeue+0x1b90>
c000c45c:	008ba403          	lw	s0,8(s7)
c000c460:	000c0e93          	mv	t4,s8
c000c464:	8f9ff06f          	j	c000bd5c <stride_dequeue+0x2de0>
c000c468:	008ba403          	lw	s0,8(s7)
c000c46c:	00078e93          	mv	t4,a5
c000c470:	835ff06f          	j	c000bca4 <stride_dequeue+0x2d28>
c000c474:	008ba403          	lw	s0,8(s7)
c000c478:	000d8f13          	mv	t5,s11
c000c47c:	e44ff06f          	j	c000bac0 <stride_dequeue+0x2b44>
c000c480:	008ba403          	lw	s0,8(s7)
c000c484:	00078f13          	mv	t5,a5
c000c488:	ee8ff06f          	j	c000bb70 <stride_dequeue+0x2bf4>
c000c48c:	008ba403          	lw	s0,8(s7)
c000c490:	000f8c13          	mv	s8,t6
c000c494:	c3cfe06f          	j	c000a8d0 <stride_dequeue+0x1954>

c000c498 <sys_getpid>:
c000c498:	00039797          	auipc	a5,0x39
c000c49c:	48c7a783          	lw	a5,1164(a5) # c0045924 <current>
c000c4a0:	0047a503          	lw	a0,4(a5)
c000c4a4:	00008067          	ret

c000c4a8 <sys_gettime>:
c000c4a8:	00039517          	auipc	a0,0x39
c000c4ac:	49c52503          	lw	a0,1180(a0) # c0045944 <ticks>
c000c4b0:	00008067          	ret

c000c4b4 <sys_lab6_set_priority>:
c000c4b4:	00052503          	lw	a0,0(a0)
c000c4b8:	ff010113          	addi	sp,sp,-16
c000c4bc:	00112623          	sw	ra,12(sp)
c000c4c0:	ec9fb0ef          	jal	ra,c0008388 <lab6_set_priority>
c000c4c4:	00c12083          	lw	ra,12(sp)
c000c4c8:	00000513          	li	a0,0
c000c4cc:	01010113          	addi	sp,sp,16
c000c4d0:	00008067          	ret

c000c4d4 <sys_pgdir>:
c000c4d4:	ff010113          	addi	sp,sp,-16
c000c4d8:	00112623          	sw	ra,12(sp)
c000c4dc:	835f80ef          	jal	ra,c0004d10 <print_pgdir>
c000c4e0:	00c12083          	lw	ra,12(sp)
c000c4e4:	00000513          	li	a0,0
c000c4e8:	01010113          	addi	sp,sp,16
c000c4ec:	00008067          	ret

c000c4f0 <sys_putc>:
c000c4f0:	00052503          	lw	a0,0(a0)
c000c4f4:	ff010113          	addi	sp,sp,-16
c000c4f8:	00112623          	sw	ra,12(sp)
c000c4fc:	c39f30ef          	jal	ra,c0000134 <cputchar>
c000c500:	00c12083          	lw	ra,12(sp)
c000c504:	00000513          	li	a0,0
c000c508:	01010113          	addi	sp,sp,16
c000c50c:	00008067          	ret

c000c510 <sys_kill>:
c000c510:	00052503          	lw	a0,0(a0)
c000c514:	c79fb06f          	j	c000818c <do_kill>

c000c518 <sys_sleep>:
c000c518:	00052503          	lw	a0,0(a0)
c000c51c:	e95fb06f          	j	c00083b0 <do_sleep>

c000c520 <sys_yield>:
c000c520:	be9fb06f          	j	c0008108 <do_yield>

c000c524 <sys_exec>:
c000c524:	00c52683          	lw	a3,12(a0)
c000c528:	00852603          	lw	a2,8(a0)
c000c52c:	00452583          	lw	a1,4(a0)
c000c530:	00052503          	lw	a0,0(a0)
c000c534:	cf8fb06f          	j	c0007a2c <do_execve>

c000c538 <sys_wait>:
c000c538:	00452583          	lw	a1,4(a0)
c000c53c:	00052503          	lw	a0,0(a0)
c000c540:	be1fb06f          	j	c0008120 <do_wait>

c000c544 <sys_fork>:
c000c544:	00039797          	auipc	a5,0x39
c000c548:	3e07a783          	lw	a5,992(a5) # c0045924 <current>
c000c54c:	0547a603          	lw	a2,84(a5)
c000c550:	00000513          	li	a0,0
c000c554:	00862583          	lw	a1,8(a2)
c000c558:	971fa06f          	j	c0006ec8 <do_fork>

c000c55c <sys_exit>:
c000c55c:	00052503          	lw	a0,0(a0)
c000c560:	f41fa06f          	j	c00074a0 <do_exit>

c000c564 <syscall>:
c000c564:	fd010113          	addi	sp,sp,-48
c000c568:	00039797          	auipc	a5,0x39
c000c56c:	3bc7a783          	lw	a5,956(a5) # c0045924 <current>
c000c570:	02812423          	sw	s0,40(sp)
c000c574:	0547a403          	lw	s0,84(a5)
c000c578:	02912223          	sw	s1,36(sp)
c000c57c:	02112623          	sw	ra,44(sp)
c000c580:	02842483          	lw	s1,40(s0)
c000c584:	0ff00793          	li	a5,255
c000c588:	0697e263          	bltu	a5,s1,c000c5ec <syscall+0x88>
c000c58c:	00249713          	slli	a4,s1,0x2
c000c590:	00003797          	auipc	a5,0x3
c000c594:	e2478793          	addi	a5,a5,-476 # c000f3b4 <syscalls>
c000c598:	00e787b3          	add	a5,a5,a4
c000c59c:	0007a783          	lw	a5,0(a5)
c000c5a0:	04078663          	beqz	a5,c000c5ec <syscall+0x88>
c000c5a4:	02c42503          	lw	a0,44(s0)
c000c5a8:	03042583          	lw	a1,48(s0)
c000c5ac:	03442603          	lw	a2,52(s0)
c000c5b0:	03842683          	lw	a3,56(s0)
c000c5b4:	03c42703          	lw	a4,60(s0)
c000c5b8:	00a12623          	sw	a0,12(sp)
c000c5bc:	00b12823          	sw	a1,16(sp)
c000c5c0:	00c12a23          	sw	a2,20(sp)
c000c5c4:	00d12c23          	sw	a3,24(sp)
c000c5c8:	00e12e23          	sw	a4,28(sp)
c000c5cc:	00c10513          	addi	a0,sp,12
c000c5d0:	000780e7          	jalr	a5
c000c5d4:	02c12083          	lw	ra,44(sp)
c000c5d8:	02a42423          	sw	a0,40(s0)
c000c5dc:	02412483          	lw	s1,36(sp)
c000c5e0:	02812403          	lw	s0,40(sp)
c000c5e4:	03010113          	addi	sp,sp,48
c000c5e8:	00008067          	ret
c000c5ec:	00040513          	mv	a0,s0
c000c5f0:	c70f40ef          	jal	ra,c0000a60 <print_trapframe>
c000c5f4:	00039797          	auipc	a5,0x39
c000c5f8:	3307a783          	lw	a5,816(a5) # c0045924 <current>
c000c5fc:	0047a703          	lw	a4,4(a5)
c000c600:	00048693          	mv	a3,s1
c000c604:	06078793          	addi	a5,a5,96
c000c608:	00003617          	auipc	a2,0x3
c000c60c:	d6860613          	addi	a2,a2,-664 # c000f370 <default_pmm_manager+0x10b8>
c000c610:	07900593          	li	a1,121
c000c614:	00003517          	auipc	a0,0x3
c000c618:	d8850513          	addi	a0,a0,-632 # c000f39c <default_pmm_manager+0x10e4>
c000c61c:	c35f30ef          	jal	ra,c0000250 <__panic>

c000c620 <strlen>:
c000c620:	00054703          	lbu	a4,0(a0)
c000c624:	00050693          	mv	a3,a0
c000c628:	00150793          	addi	a5,a0,1
c000c62c:	00070c63          	beqz	a4,c000c644 <strlen+0x24>
c000c630:	40d78533          	sub	a0,a5,a3
c000c634:	00178793          	addi	a5,a5,1
c000c638:	fff7c703          	lbu	a4,-1(a5)
c000c63c:	fe071ae3          	bnez	a4,c000c630 <strlen+0x10>
c000c640:	00008067          	ret
c000c644:	00000513          	li	a0,0
c000c648:	00008067          	ret

c000c64c <strnlen>:
c000c64c:	00050693          	mv	a3,a0
c000c650:	02058a63          	beqz	a1,c000c684 <strnlen+0x38>
c000c654:	00054703          	lbu	a4,0(a0)
c000c658:	00150793          	addi	a5,a0,1
c000c65c:	02070463          	beqz	a4,c000c684 <strnlen+0x38>
c000c660:	00b505b3          	add	a1,a0,a1
c000c664:	0100006f          	j	c000c674 <strnlen+0x28>
c000c668:	00178793          	addi	a5,a5,1
c000c66c:	fff7c703          	lbu	a4,-1(a5)
c000c670:	00070863          	beqz	a4,c000c680 <strnlen+0x34>
c000c674:	40d78533          	sub	a0,a5,a3
c000c678:	feb798e3          	bne	a5,a1,c000c668 <strnlen+0x1c>
c000c67c:	00008067          	ret
c000c680:	00008067          	ret
c000c684:	00000513          	li	a0,0
c000c688:	00008067          	ret

c000c68c <strcpy>:
c000c68c:	00050793          	mv	a5,a0
c000c690:	00158593          	addi	a1,a1,1
c000c694:	fff5c703          	lbu	a4,-1(a1)
c000c698:	00178793          	addi	a5,a5,1
c000c69c:	fee78fa3          	sb	a4,-1(a5)
c000c6a0:	fe0718e3          	bnez	a4,c000c690 <strcpy+0x4>
c000c6a4:	00008067          	ret

c000c6a8 <strcmp>:
c000c6a8:	00054783          	lbu	a5,0(a0)
c000c6ac:	0005c703          	lbu	a4,0(a1)
c000c6b0:	02078263          	beqz	a5,c000c6d4 <strcmp+0x2c>
c000c6b4:	02e79063          	bne	a5,a4,c000c6d4 <strcmp+0x2c>
c000c6b8:	00150513          	addi	a0,a0,1
c000c6bc:	00054783          	lbu	a5,0(a0)
c000c6c0:	00158693          	addi	a3,a1,1
c000c6c4:	0015c703          	lbu	a4,1(a1)
c000c6c8:	00078663          	beqz	a5,c000c6d4 <strcmp+0x2c>
c000c6cc:	00068593          	mv	a1,a3
c000c6d0:	fee784e3          	beq	a5,a4,c000c6b8 <strcmp+0x10>
c000c6d4:	40e78533          	sub	a0,a5,a4
c000c6d8:	00008067          	ret

c000c6dc <strchr>:
c000c6dc:	00054783          	lbu	a5,0(a0)
c000c6e0:	00078e63          	beqz	a5,c000c6fc <strchr+0x20>
c000c6e4:	00f59663          	bne	a1,a5,c000c6f0 <strchr+0x14>
c000c6e8:	01c0006f          	j	c000c704 <strchr+0x28>
c000c6ec:	00b78a63          	beq	a5,a1,c000c700 <strchr+0x24>
c000c6f0:	00150513          	addi	a0,a0,1
c000c6f4:	00054783          	lbu	a5,0(a0)
c000c6f8:	fe079ae3          	bnez	a5,c000c6ec <strchr+0x10>
c000c6fc:	00000513          	li	a0,0
c000c700:	00008067          	ret
c000c704:	00008067          	ret

c000c708 <memset>:
c000c708:	00c50733          	add	a4,a0,a2
c000c70c:	00050793          	mv	a5,a0
c000c710:	00060863          	beqz	a2,c000c720 <memset+0x18>
c000c714:	00178793          	addi	a5,a5,1
c000c718:	feb78fa3          	sb	a1,-1(a5)
c000c71c:	fef71ce3          	bne	a4,a5,c000c714 <memset+0xc>
c000c720:	00008067          	ret

c000c724 <memcpy>:
c000c724:	00c586b3          	add	a3,a1,a2
c000c728:	00050793          	mv	a5,a0
c000c72c:	00060c63          	beqz	a2,c000c744 <memcpy+0x20>
c000c730:	00158593          	addi	a1,a1,1
c000c734:	fff5c703          	lbu	a4,-1(a1)
c000c738:	00178793          	addi	a5,a5,1
c000c73c:	fee78fa3          	sb	a4,-1(a5)
c000c740:	feb698e3          	bne	a3,a1,c000c730 <memcpy+0xc>
c000c744:	00008067          	ret

c000c748 <printnum>:
c000c748:	fe010113          	addi	sp,sp,-32
c000c74c:	00912a23          	sw	s1,20(sp)
c000c750:	01212823          	sw	s2,16(sp)
c000c754:	01312623          	sw	s3,12(sp)
c000c758:	01412423          	sw	s4,8(sp)
c000c75c:	00112e23          	sw	ra,28(sp)
c000c760:	00812c23          	sw	s0,24(sp)
c000c764:	00050493          	mv	s1,a0
c000c768:	00058913          	mv	s2,a1
c000c76c:	00080993          	mv	s3,a6
c000c770:	02e67a33          	remu	s4,a2,a4
c000c774:	04069e63          	bnez	a3,c000c7d0 <printnum+0x88>
c000c778:	04e67c63          	bleu	a4,a2,c000c7d0 <printnum+0x88>
c000c77c:	fff78413          	addi	s0,a5,-1
c000c780:	00805c63          	blez	s0,c000c798 <printnum+0x50>
c000c784:	fff40413          	addi	s0,s0,-1
c000c788:	00090593          	mv	a1,s2
c000c78c:	00098513          	mv	a0,s3
c000c790:	000480e7          	jalr	s1
c000c794:	fe0418e3          	bnez	s0,c000c784 <printnum+0x3c>
c000c798:	00003797          	auipc	a5,0x3
c000c79c:	1d878793          	addi	a5,a5,472 # c000f970 <error_string+0x64>
c000c7a0:	014787b3          	add	a5,a5,s4
c000c7a4:	00090593          	mv	a1,s2
c000c7a8:	00048313          	mv	t1,s1
c000c7ac:	01c12083          	lw	ra,28(sp)
c000c7b0:	01812403          	lw	s0,24(sp)
c000c7b4:	01412483          	lw	s1,20(sp)
c000c7b8:	01012903          	lw	s2,16(sp)
c000c7bc:	00c12983          	lw	s3,12(sp)
c000c7c0:	00812a03          	lw	s4,8(sp)
c000c7c4:	0007c503          	lbu	a0,0(a5)
c000c7c8:	02010113          	addi	sp,sp,32
c000c7cc:	00030067          	jr	t1
c000c7d0:	02e65633          	divu	a2,a2,a4
c000c7d4:	00098813          	mv	a6,s3
c000c7d8:	fff78793          	addi	a5,a5,-1
c000c7dc:	00000693          	li	a3,0
c000c7e0:	00090593          	mv	a1,s2
c000c7e4:	00048513          	mv	a0,s1
c000c7e8:	f61ff0ef          	jal	ra,c000c748 <printnum>
c000c7ec:	fadff06f          	j	c000c798 <printnum+0x50>

c000c7f0 <vprintfmt>:
c000c7f0:	fb010113          	addi	sp,sp,-80
c000c7f4:	05212023          	sw	s2,64(sp)
c000c7f8:	03312e23          	sw	s3,60(sp)
c000c7fc:	03412c23          	sw	s4,56(sp)
c000c800:	03512a23          	sw	s5,52(sp)
c000c804:	03612823          	sw	s6,48(sp)
c000c808:	03712623          	sw	s7,44(sp)
c000c80c:	03812423          	sw	s8,40(sp)
c000c810:	03912223          	sw	s9,36(sp)
c000c814:	04112623          	sw	ra,76(sp)
c000c818:	04812423          	sw	s0,72(sp)
c000c81c:	04912223          	sw	s1,68(sp)
c000c820:	03a12023          	sw	s10,32(sp)
c000c824:	01b12e23          	sw	s11,28(sp)
c000c828:	00050993          	mv	s3,a0
c000c82c:	00058913          	mv	s2,a1
c000c830:	00060c93          	mv	s9,a2
c000c834:	00068a93          	mv	s5,a3
c000c838:	00003a17          	auipc	s4,0x3
c000c83c:	f7ca0a13          	addi	s4,s4,-132 # c000f7b4 <syscalls+0x400>
c000c840:	02800c13          	li	s8,40
c000c844:	fff00b13          	li	s6,-1
c000c848:	05e00b93          	li	s7,94
c000c84c:	000cc503          	lbu	a0,0(s9)
c000c850:	02500493          	li	s1,37
c000c854:	001c8413          	addi	s0,s9,1
c000c858:	00950e63          	beq	a0,s1,c000c874 <vprintfmt+0x84>
c000c85c:	06050463          	beqz	a0,c000c8c4 <vprintfmt+0xd4>
c000c860:	00090593          	mv	a1,s2
c000c864:	00140413          	addi	s0,s0,1
c000c868:	000980e7          	jalr	s3
c000c86c:	fff44503          	lbu	a0,-1(s0)
c000c870:	fe9516e3          	bne	a0,s1,c000c85c <vprintfmt+0x6c>
c000c874:	00044e03          	lbu	t3,0(s0)
c000c878:	fff00d13          	li	s10,-1
c000c87c:	02000813          	li	a6,32
c000c880:	00000493          	li	s1,0
c000c884:	00000593          	li	a1,0
c000c888:	000d0d93          	mv	s11,s10
c000c88c:	05500693          	li	a3,85
c000c890:	00100313          	li	t1,1
c000c894:	03000893          	li	a7,48
c000c898:	00900613          	li	a2,9
c000c89c:	02d00513          	li	a0,45
c000c8a0:	fdde0713          	addi	a4,t3,-35
c000c8a4:	0ff77713          	andi	a4,a4,255
c000c8a8:	00140c93          	addi	s9,s0,1
c000c8ac:	32e6e463          	bltu	a3,a4,c000cbd4 <vprintfmt+0x3e4>
c000c8b0:	00271713          	slli	a4,a4,0x2
c000c8b4:	01470733          	add	a4,a4,s4
c000c8b8:	00072783          	lw	a5,0(a4)
c000c8bc:	014787b3          	add	a5,a5,s4
c000c8c0:	00078067          	jr	a5
c000c8c4:	04c12083          	lw	ra,76(sp)
c000c8c8:	04812403          	lw	s0,72(sp)
c000c8cc:	04412483          	lw	s1,68(sp)
c000c8d0:	04012903          	lw	s2,64(sp)
c000c8d4:	03c12983          	lw	s3,60(sp)
c000c8d8:	03812a03          	lw	s4,56(sp)
c000c8dc:	03412a83          	lw	s5,52(sp)
c000c8e0:	03012b03          	lw	s6,48(sp)
c000c8e4:	02c12b83          	lw	s7,44(sp)
c000c8e8:	02812c03          	lw	s8,40(sp)
c000c8ec:	02412c83          	lw	s9,36(sp)
c000c8f0:	02012d03          	lw	s10,32(sp)
c000c8f4:	01c12d83          	lw	s11,28(sp)
c000c8f8:	05010113          	addi	sp,sp,80
c000c8fc:	00008067          	ret
c000c900:	00100793          	li	a5,1
c000c904:	34b7c063          	blt	a5,a1,c000cc44 <vprintfmt+0x454>
c000c908:	000aa603          	lw	a2,0(s5)
c000c90c:	00000693          	li	a3,0
c000c910:	004a8a93          	addi	s5,s5,4
c000c914:	01000713          	li	a4,16
c000c918:	000d8793          	mv	a5,s11
c000c91c:	00090593          	mv	a1,s2
c000c920:	00098513          	mv	a0,s3
c000c924:	e25ff0ef          	jal	ra,c000c748 <printnum>
c000c928:	f25ff06f          	j	c000c84c <vprintfmt+0x5c>
c000c92c:	00144e03          	lbu	t3,1(s0)
c000c930:	00030493          	mv	s1,t1
c000c934:	000c8413          	mv	s0,s9
c000c938:	f69ff06f          	j	c000c8a0 <vprintfmt+0xb0>
c000c93c:	000aa503          	lw	a0,0(s5)
c000c940:	00090593          	mv	a1,s2
c000c944:	004a8a93          	addi	s5,s5,4
c000c948:	000980e7          	jalr	s3
c000c94c:	f01ff06f          	j	c000c84c <vprintfmt+0x5c>
c000c950:	00100793          	li	a5,1
c000c954:	30b7c663          	blt	a5,a1,c000cc60 <vprintfmt+0x470>
c000c958:	000aa603          	lw	a2,0(s5)
c000c95c:	004a8a93          	addi	s5,s5,4
c000c960:	41f65693          	srai	a3,a2,0x1f
c000c964:	00a00713          	li	a4,10
c000c968:	fa06d8e3          	bgez	a3,c000c918 <vprintfmt+0x128>
c000c96c:	00090593          	mv	a1,s2
c000c970:	02d00513          	li	a0,45
c000c974:	00d12623          	sw	a3,12(sp)
c000c978:	00c12423          	sw	a2,8(sp)
c000c97c:	00e12223          	sw	a4,4(sp)
c000c980:	01012023          	sw	a6,0(sp)
c000c984:	000980e7          	jalr	s3
c000c988:	00812603          	lw	a2,8(sp)
c000c98c:	00c12683          	lw	a3,12(sp)
c000c990:	00012803          	lw	a6,0(sp)
c000c994:	40c00633          	neg	a2,a2
c000c998:	00c037b3          	snez	a5,a2
c000c99c:	40d006b3          	neg	a3,a3
c000c9a0:	40f686b3          	sub	a3,a3,a5
c000c9a4:	00412703          	lw	a4,4(sp)
c000c9a8:	f71ff06f          	j	c000c918 <vprintfmt+0x128>
c000c9ac:	000aa783          	lw	a5,0(s5)
c000c9b0:	01800693          	li	a3,24
c000c9b4:	004a8a93          	addi	s5,s5,4
c000c9b8:	41f7d713          	srai	a4,a5,0x1f
c000c9bc:	00f747b3          	xor	a5,a4,a5
c000c9c0:	40e787b3          	sub	a5,a5,a4
c000c9c4:	2af6ca63          	blt	a3,a5,c000cc78 <vprintfmt+0x488>
c000c9c8:	00279693          	slli	a3,a5,0x2
c000c9cc:	00003717          	auipc	a4,0x3
c000c9d0:	f4070713          	addi	a4,a4,-192 # c000f90c <error_string>
c000c9d4:	00d70733          	add	a4,a4,a3
c000c9d8:	00072683          	lw	a3,0(a4)
c000c9dc:	28068e63          	beqz	a3,c000cc78 <vprintfmt+0x488>
c000c9e0:	00000617          	auipc	a2,0x0
c000c9e4:	39c60613          	addi	a2,a2,924 # c000cd7c <etext+0x24>
c000c9e8:	00090593          	mv	a1,s2
c000c9ec:	00098513          	mv	a0,s3
c000c9f0:	314000ef          	jal	ra,c000cd04 <printfmt>
c000c9f4:	e59ff06f          	j	c000c84c <vprintfmt+0x5c>
c000c9f8:	00144e03          	lbu	t3,1(s0)
c000c9fc:	00158593          	addi	a1,a1,1
c000ca00:	000c8413          	mv	s0,s9
c000ca04:	e9dff06f          	j	c000c8a0 <vprintfmt+0xb0>
c000ca08:	00100793          	li	a5,1
c000ca0c:	20b7c063          	blt	a5,a1,c000cc0c <vprintfmt+0x41c>
c000ca10:	000aa603          	lw	a2,0(s5)
c000ca14:	00000693          	li	a3,0
c000ca18:	004a8a93          	addi	s5,s5,4
c000ca1c:	00800713          	li	a4,8
c000ca20:	ef9ff06f          	j	c000c918 <vprintfmt+0x128>
c000ca24:	03000513          	li	a0,48
c000ca28:	00090593          	mv	a1,s2
c000ca2c:	01012023          	sw	a6,0(sp)
c000ca30:	000980e7          	jalr	s3
c000ca34:	00090593          	mv	a1,s2
c000ca38:	07800513          	li	a0,120
c000ca3c:	000980e7          	jalr	s3
c000ca40:	000aa603          	lw	a2,0(s5)
c000ca44:	00000693          	li	a3,0
c000ca48:	01000713          	li	a4,16
c000ca4c:	004a8a93          	addi	s5,s5,4
c000ca50:	00012803          	lw	a6,0(sp)
c000ca54:	ec5ff06f          	j	c000c918 <vprintfmt+0x128>
c000ca58:	000aa403          	lw	s0,0(s5)
c000ca5c:	004a8793          	addi	a5,s5,4
c000ca60:	00f12223          	sw	a5,4(sp)
c000ca64:	24040863          	beqz	s0,c000ccb4 <vprintfmt+0x4c4>
c000ca68:	05b05263          	blez	s11,c000caac <vprintfmt+0x2bc>
c000ca6c:	02d00793          	li	a5,45
c000ca70:	22f80263          	beq	a6,a5,c000cc94 <vprintfmt+0x4a4>
c000ca74:	000d0593          	mv	a1,s10
c000ca78:	00040513          	mv	a0,s0
c000ca7c:	01012023          	sw	a6,0(sp)
c000ca80:	bcdff0ef          	jal	ra,c000c64c <strnlen>
c000ca84:	40ad8db3          	sub	s11,s11,a0
c000ca88:	03b05263          	blez	s11,c000caac <vprintfmt+0x2bc>
c000ca8c:	00012803          	lw	a6,0(sp)
c000ca90:	00080513          	mv	a0,a6
c000ca94:	00090593          	mv	a1,s2
c000ca98:	01012023          	sw	a6,0(sp)
c000ca9c:	fffd8d93          	addi	s11,s11,-1
c000caa0:	000980e7          	jalr	s3
c000caa4:	00012803          	lw	a6,0(sp)
c000caa8:	fe0d94e3          	bnez	s11,c000ca90 <vprintfmt+0x2a0>
c000caac:	00044783          	lbu	a5,0(s0)
c000cab0:	00140a93          	addi	s5,s0,1
c000cab4:	00078513          	mv	a0,a5
c000cab8:	04078c63          	beqz	a5,c000cb10 <vprintfmt+0x320>
c000cabc:	03f00413          	li	s0,63
c000cac0:	000d4663          	bltz	s10,c000cacc <vprintfmt+0x2dc>
c000cac4:	fffd0d13          	addi	s10,s10,-1
c000cac8:	036d0663          	beq	s10,s6,c000caf4 <vprintfmt+0x304>
c000cacc:	00090593          	mv	a1,s2
c000cad0:	00048663          	beqz	s1,c000cadc <vprintfmt+0x2ec>
c000cad4:	fe078793          	addi	a5,a5,-32
c000cad8:	12fbe463          	bltu	s7,a5,c000cc00 <vprintfmt+0x410>
c000cadc:	000980e7          	jalr	s3
c000cae0:	001a8a93          	addi	s5,s5,1
c000cae4:	fffac783          	lbu	a5,-1(s5)
c000cae8:	fffd8d93          	addi	s11,s11,-1
c000caec:	00078513          	mv	a0,a5
c000caf0:	fc0798e3          	bnez	a5,c000cac0 <vprintfmt+0x2d0>
c000caf4:	01b05e63          	blez	s11,c000cb10 <vprintfmt+0x320>
c000caf8:	02000413          	li	s0,32
c000cafc:	fffd8d93          	addi	s11,s11,-1
c000cb00:	00090593          	mv	a1,s2
c000cb04:	00040513          	mv	a0,s0
c000cb08:	000980e7          	jalr	s3
c000cb0c:	fe0d98e3          	bnez	s11,c000cafc <vprintfmt+0x30c>
c000cb10:	00412a83          	lw	s5,4(sp)
c000cb14:	d39ff06f          	j	c000c84c <vprintfmt+0x5c>
c000cb18:	00100793          	li	a5,1
c000cb1c:	10b7c663          	blt	a5,a1,c000cc28 <vprintfmt+0x438>
c000cb20:	000aa603          	lw	a2,0(s5)
c000cb24:	00000693          	li	a3,0
c000cb28:	004a8a93          	addi	s5,s5,4
c000cb2c:	00a00713          	li	a4,10
c000cb30:	de9ff06f          	j	c000c918 <vprintfmt+0x128>
c000cb34:	00144e03          	lbu	t3,1(s0)
c000cb38:	00050813          	mv	a6,a0
c000cb3c:	000c8413          	mv	s0,s9
c000cb40:	d61ff06f          	j	c000c8a0 <vprintfmt+0xb0>
c000cb44:	00090593          	mv	a1,s2
c000cb48:	02500513          	li	a0,37
c000cb4c:	000980e7          	jalr	s3
c000cb50:	cfdff06f          	j	c000c84c <vprintfmt+0x5c>
c000cb54:	000aad03          	lw	s10,0(s5)
c000cb58:	00144e03          	lbu	t3,1(s0)
c000cb5c:	004a8a93          	addi	s5,s5,4
c000cb60:	000c8413          	mv	s0,s9
c000cb64:	d20ddee3          	bgez	s11,c000c8a0 <vprintfmt+0xb0>
c000cb68:	000d0d93          	mv	s11,s10
c000cb6c:	fff00d13          	li	s10,-1
c000cb70:	d31ff06f          	j	c000c8a0 <vprintfmt+0xb0>
c000cb74:	00144e03          	lbu	t3,1(s0)
c000cb78:	00088813          	mv	a6,a7
c000cb7c:	000c8413          	mv	s0,s9
c000cb80:	d21ff06f          	j	c000c8a0 <vprintfmt+0xb0>
c000cb84:	00144703          	lbu	a4,1(s0)
c000cb88:	fd0e0d13          	addi	s10,t3,-48
c000cb8c:	fd070793          	addi	a5,a4,-48
c000cb90:	14f66863          	bltu	a2,a5,c000cce0 <vprintfmt+0x4f0>
c000cb94:	000c8413          	mv	s0,s9
c000cb98:	002d1793          	slli	a5,s10,0x2
c000cb9c:	01a78d33          	add	s10,a5,s10
c000cba0:	00140413          	addi	s0,s0,1
c000cba4:	001d1d13          	slli	s10,s10,0x1
c000cba8:	00ed0d33          	add	s10,s10,a4
c000cbac:	00044703          	lbu	a4,0(s0)
c000cbb0:	fd0d0d13          	addi	s10,s10,-48
c000cbb4:	fd070793          	addi	a5,a4,-48
c000cbb8:	fef670e3          	bleu	a5,a2,c000cb98 <vprintfmt+0x3a8>
c000cbbc:	00070e13          	mv	t3,a4
c000cbc0:	fa5ff06f          	j	c000cb64 <vprintfmt+0x374>
c000cbc4:	0e0dc463          	bltz	s11,c000ccac <vprintfmt+0x4bc>
c000cbc8:	00144e03          	lbu	t3,1(s0)
c000cbcc:	000c8413          	mv	s0,s9
c000cbd0:	cd1ff06f          	j	c000c8a0 <vprintfmt+0xb0>
c000cbd4:	00090593          	mv	a1,s2
c000cbd8:	02500513          	li	a0,37
c000cbdc:	000980e7          	jalr	s3
c000cbe0:	fff44783          	lbu	a5,-1(s0)
c000cbe4:	02500713          	li	a4,37
c000cbe8:	00040c93          	mv	s9,s0
c000cbec:	c6e780e3          	beq	a5,a4,c000c84c <vprintfmt+0x5c>
c000cbf0:	fffc8c93          	addi	s9,s9,-1
c000cbf4:	fffcc783          	lbu	a5,-1(s9)
c000cbf8:	fee79ce3          	bne	a5,a4,c000cbf0 <vprintfmt+0x400>
c000cbfc:	c51ff06f          	j	c000c84c <vprintfmt+0x5c>
c000cc00:	00040513          	mv	a0,s0
c000cc04:	000980e7          	jalr	s3
c000cc08:	ed9ff06f          	j	c000cae0 <vprintfmt+0x2f0>
c000cc0c:	007a8793          	addi	a5,s5,7
c000cc10:	ff87f793          	andi	a5,a5,-8
c000cc14:	00878a93          	addi	s5,a5,8
c000cc18:	0007a603          	lw	a2,0(a5)
c000cc1c:	0047a683          	lw	a3,4(a5)
c000cc20:	00800713          	li	a4,8
c000cc24:	cf5ff06f          	j	c000c918 <vprintfmt+0x128>
c000cc28:	007a8793          	addi	a5,s5,7
c000cc2c:	ff87f793          	andi	a5,a5,-8
c000cc30:	00878a93          	addi	s5,a5,8
c000cc34:	0007a603          	lw	a2,0(a5)
c000cc38:	0047a683          	lw	a3,4(a5)
c000cc3c:	00a00713          	li	a4,10
c000cc40:	cd9ff06f          	j	c000c918 <vprintfmt+0x128>
c000cc44:	007a8793          	addi	a5,s5,7
c000cc48:	ff87f793          	andi	a5,a5,-8
c000cc4c:	00878a93          	addi	s5,a5,8
c000cc50:	0007a603          	lw	a2,0(a5)
c000cc54:	0047a683          	lw	a3,4(a5)
c000cc58:	01000713          	li	a4,16
c000cc5c:	cbdff06f          	j	c000c918 <vprintfmt+0x128>
c000cc60:	007a8793          	addi	a5,s5,7
c000cc64:	ff87f793          	andi	a5,a5,-8
c000cc68:	00878a93          	addi	s5,a5,8
c000cc6c:	0007a603          	lw	a2,0(a5)
c000cc70:	0047a683          	lw	a3,4(a5)
c000cc74:	cf1ff06f          	j	c000c964 <vprintfmt+0x174>
c000cc78:	00078693          	mv	a3,a5
c000cc7c:	00003617          	auipc	a2,0x3
c000cc80:	db460613          	addi	a2,a2,-588 # c000fa30 <error_string+0x124>
c000cc84:	00090593          	mv	a1,s2
c000cc88:	00098513          	mv	a0,s3
c000cc8c:	078000ef          	jal	ra,c000cd04 <printfmt>
c000cc90:	bbdff06f          	j	c000c84c <vprintfmt+0x5c>
c000cc94:	00044783          	lbu	a5,0(s0)
c000cc98:	00140a93          	addi	s5,s0,1
c000cc9c:	00078513          	mv	a0,a5
c000cca0:	e4078ce3          	beqz	a5,c000caf8 <vprintfmt+0x308>
c000cca4:	03f00413          	li	s0,63
c000cca8:	e19ff06f          	j	c000cac0 <vprintfmt+0x2d0>
c000ccac:	00000d93          	li	s11,0
c000ccb0:	f19ff06f          	j	c000cbc8 <vprintfmt+0x3d8>
c000ccb4:	03b05c63          	blez	s11,c000ccec <vprintfmt+0x4fc>
c000ccb8:	02d00793          	li	a5,45
c000ccbc:	00003417          	auipc	s0,0x3
c000ccc0:	d6c40413          	addi	s0,s0,-660 # c000fa28 <error_string+0x11c>
c000ccc4:	daf818e3          	bne	a6,a5,c000ca74 <vprintfmt+0x284>
c000ccc8:	00003a97          	auipc	s5,0x3
c000cccc:	d61a8a93          	addi	s5,s5,-671 # c000fa29 <error_string+0x11d>
c000ccd0:	000c0513          	mv	a0,s8
c000ccd4:	000c0793          	mv	a5,s8
c000ccd8:	03f00413          	li	s0,63
c000ccdc:	de5ff06f          	j	c000cac0 <vprintfmt+0x2d0>
c000cce0:	00070e13          	mv	t3,a4
c000cce4:	000c8413          	mv	s0,s9
c000cce8:	e7dff06f          	j	c000cb64 <vprintfmt+0x374>
c000ccec:	000c0793          	mv	a5,s8
c000ccf0:	000c0513          	mv	a0,s8
c000ccf4:	00003a97          	auipc	s5,0x3
c000ccf8:	d35a8a93          	addi	s5,s5,-715 # c000fa29 <error_string+0x11d>
c000ccfc:	03f00413          	li	s0,63
c000cd00:	dc1ff06f          	j	c000cac0 <vprintfmt+0x2d0>

c000cd04 <printfmt>:
c000cd04:	fc010113          	addi	sp,sp,-64
c000cd08:	02c10313          	addi	t1,sp,44
c000cd0c:	02d12623          	sw	a3,44(sp)
c000cd10:	00030693          	mv	a3,t1
c000cd14:	00112e23          	sw	ra,28(sp)
c000cd18:	02e12823          	sw	a4,48(sp)
c000cd1c:	02f12a23          	sw	a5,52(sp)
c000cd20:	03012c23          	sw	a6,56(sp)
c000cd24:	03112e23          	sw	a7,60(sp)
c000cd28:	00612623          	sw	t1,12(sp)
c000cd2c:	ac5ff0ef          	jal	ra,c000c7f0 <vprintfmt>
c000cd30:	01c12083          	lw	ra,28(sp)
c000cd34:	04010113          	addi	sp,sp,64
c000cd38:	00008067          	ret

c000cd3c <hash32>:
c000cd3c:	9e3707b7          	lui	a5,0x9e370
c000cd40:	00178793          	addi	a5,a5,1 # 9e370001 <sbi_remote_fence_i+0x9e370711>
c000cd44:	02f50533          	mul	a0,a0,a5
c000cd48:	02000793          	li	a5,32
c000cd4c:	40b785b3          	sub	a1,a5,a1
c000cd50:	00b55533          	srl	a0,a0,a1
c000cd54:	00008067          	ret
