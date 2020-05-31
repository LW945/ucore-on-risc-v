
bin/kernel:     file format elf32-littleriscv


Disassembly of section .text:

c0000000 <kern_entry>:
c0000000:	00011117          	auipc	sp,0x11
c0000004:	00010113          	mv	sp,sp
c0000008:	0040006f          	j	c000000c <kern_init>

c000000c <kern_init>:
c000000c:	00035517          	auipc	a0,0x35
c0000010:	7b850513          	addi	a0,a0,1976 # c00357c4 <edata>
c0000014:	0003f617          	auipc	a2,0x3f
c0000018:	ce060613          	addi	a2,a2,-800 # c003ecf4 <end>
c000001c:	ff010113          	addi	sp,sp,-16 # c0010ff0 <bootstack+0x1ff0>
c0000020:	40a60633          	sub	a2,a2,a0
c0000024:	00000593          	li	a1,0
c0000028:	00112623          	sw	ra,12(sp)
c000002c:	5e00b0ef          	jal	ra,c000b60c <memset>
c0000030:	754000ef          	jal	ra,c0000784 <cons_init>
c0000034:	0000c597          	auipc	a1,0xc
c0000038:	c2858593          	addi	a1,a1,-984 # c000bc5c <etext>
c000003c:	0000c517          	auipc	a0,0xc
c0000040:	c3c50513          	addi	a0,a0,-964 # c000bc78 <etext+0x1c>
c0000044:	098000ef          	jal	ra,c00000dc <cprintf>
c0000048:	2f8000ef          	jal	ra,c0000340 <print_kerninfo>
c000004c:	7e1040ef          	jal	ra,c000502c <pmm_init>
c0000050:	7c8000ef          	jal	ra,c0000818 <pic_init>
c0000054:	7d8000ef          	jal	ra,c000082c <idt_init>
c0000058:	56c010ef          	jal	ra,c00015c4 <vmm_init>
c000005c:	6d8070ef          	jal	ra,c0007734 <sched_init>
c0000060:	518070ef          	jal	ra,c0007578 <proc_init>
c0000064:	620000ef          	jal	ra,c0000684 <ide_init>
c0000068:	7f0020ef          	jal	ra,c0002858 <swap_init>
c000006c:	6d0000ef          	jal	ra,c000073c <clock_init>
c0000070:	7ac000ef          	jal	ra,c000081c <intr_enable>
c0000074:	678070ef          	jal	ra,c00076ec <cpu_idle>

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
c00000c8:	62c0b0ef          	jal	ra,c000b6f4 <vprintfmt>
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
c0000120:	5d40b0ef          	jal	ra,c000b6f4 <vprintfmt>
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
c0000184:	0000c517          	auipc	a0,0xc
c0000188:	afc50513          	addi	a0,a0,-1284 # c000bc80 <etext+0x24>
c000018c:	f51ff0ef          	jal	ra,c00000dc <cprintf>
c0000190:	00000493          	li	s1,0
c0000194:	01f00913          	li	s2,31
c0000198:	00d00993          	li	s3,13
c000019c:	00800a93          	li	s5,8
c00001a0:	00a00b13          	li	s6,10
c00001a4:	3fe00a13          	li	s4,1022
c00001a8:	00035b97          	auipc	s7,0x35
c00001ac:	620b8b93          	addi	s7,s7,1568 # c00357c8 <buf>
c00001b0:	f89ff0ef          	jal	ra,c0000138 <getchar>
c00001b4:	00050413          	mv	s0,a0
c00001b8:	06054863          	bltz	a0,c0000228 <readline+0xd4>
c00001bc:	06a95a63          	ble	a0,s2,c0000230 <readline+0xdc>
c00001c0:	049a5663          	ble	s1,s4,c000020c <readline+0xb8>
c00001c4:	ff3416e3          	bne	s0,s3,c00001b0 <readline+0x5c>
c00001c8:	00040513          	mv	a0,s0
c00001cc:	f69ff0ef          	jal	ra,c0000134 <cputchar>
c00001d0:	00035517          	auipc	a0,0x35
c00001d4:	5f850513          	addi	a0,a0,1528 # c00357c8 <buf>
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
c0000270:	0003f797          	auipc	a5,0x3f
c0000274:	96c7a783          	lw	a5,-1684(a5) # c003ebdc <is_panic>
c0000278:	00078a63          	beqz	a5,c000028c <__panic+0x3c>
c000027c:	5a8000ef          	jal	ra,c0000824 <intr_disable>
c0000280:	00000513          	li	a0,0
c0000284:	21c000ef          	jal	ra,c00004a0 <kmonitor>
c0000288:	ff9ff06f          	j	c0000280 <__panic+0x30>
c000028c:	00100713          	li	a4,1
c0000290:	0003f797          	auipc	a5,0x3f
c0000294:	94c78793          	addi	a5,a5,-1716 # c003ebdc <is_panic>
c0000298:	00e7a023          	sw	a4,0(a5)
c000029c:	00060413          	mv	s0,a2
c00002a0:	02c10793          	addi	a5,sp,44
c00002a4:	00058613          	mv	a2,a1
c00002a8:	00050593          	mv	a1,a0
c00002ac:	0000c517          	auipc	a0,0xc
c00002b0:	9d850513          	addi	a0,a0,-1576 # c000bc84 <etext+0x28>
c00002b4:	00f12623          	sw	a5,12(sp)
c00002b8:	e25ff0ef          	jal	ra,c00000dc <cprintf>
c00002bc:	00c12583          	lw	a1,12(sp)
c00002c0:	00040513          	mv	a0,s0
c00002c4:	de5ff0ef          	jal	ra,c00000a8 <vcprintf>
c00002c8:	0000d517          	auipc	a0,0xd
c00002cc:	2fc50513          	addi	a0,a0,764 # c000d5c4 <default_pmm_manager+0x408>
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
c00002f4:	0000c517          	auipc	a0,0xc
c00002f8:	9ac50513          	addi	a0,a0,-1620 # c000bca0 <etext+0x44>
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
c0000324:	0000d517          	auipc	a0,0xd
c0000328:	2a050513          	addi	a0,a0,672 # c000d5c4 <default_pmm_manager+0x408>
c000032c:	db1ff0ef          	jal	ra,c00000dc <cprintf>
c0000330:	01c12083          	lw	ra,28(sp)
c0000334:	01812403          	lw	s0,24(sp)
c0000338:	04010113          	addi	sp,sp,64
c000033c:	00008067          	ret

c0000340 <print_kerninfo>:
c0000340:	ff010113          	addi	sp,sp,-16
c0000344:	0000c517          	auipc	a0,0xc
c0000348:	9a450513          	addi	a0,a0,-1628 # c000bce8 <etext+0x8c>
c000034c:	00112623          	sw	ra,12(sp)
c0000350:	d8dff0ef          	jal	ra,c00000dc <cprintf>
c0000354:	00000597          	auipc	a1,0x0
c0000358:	cb858593          	addi	a1,a1,-840 # c000000c <kern_init>
c000035c:	0000c517          	auipc	a0,0xc
c0000360:	9a850513          	addi	a0,a0,-1624 # c000bd04 <etext+0xa8>
c0000364:	d79ff0ef          	jal	ra,c00000dc <cprintf>
c0000368:	0000c597          	auipc	a1,0xc
c000036c:	8f458593          	addi	a1,a1,-1804 # c000bc5c <etext>
c0000370:	0000c517          	auipc	a0,0xc
c0000374:	9b050513          	addi	a0,a0,-1616 # c000bd20 <etext+0xc4>
c0000378:	d65ff0ef          	jal	ra,c00000dc <cprintf>
c000037c:	00035597          	auipc	a1,0x35
c0000380:	44858593          	addi	a1,a1,1096 # c00357c4 <edata>
c0000384:	0000c517          	auipc	a0,0xc
c0000388:	9b850513          	addi	a0,a0,-1608 # c000bd3c <etext+0xe0>
c000038c:	d51ff0ef          	jal	ra,c00000dc <cprintf>
c0000390:	0003f597          	auipc	a1,0x3f
c0000394:	96458593          	addi	a1,a1,-1692 # c003ecf4 <end>
c0000398:	0000c517          	auipc	a0,0xc
c000039c:	9c050513          	addi	a0,a0,-1600 # c000bd58 <etext+0xfc>
c00003a0:	d3dff0ef          	jal	ra,c00000dc <cprintf>
c00003a4:	0003f597          	auipc	a1,0x3f
c00003a8:	d4f58593          	addi	a1,a1,-689 # c003f0f3 <end+0x3ff>
c00003ac:	00000797          	auipc	a5,0x0
c00003b0:	c6078793          	addi	a5,a5,-928 # c000000c <kern_init>
c00003b4:	40f587b3          	sub	a5,a1,a5
c00003b8:	41f7d593          	srai	a1,a5,0x1f
c00003bc:	3ff5f593          	andi	a1,a1,1023
c00003c0:	00c12083          	lw	ra,12(sp)
c00003c4:	00f585b3          	add	a1,a1,a5
c00003c8:	40a5d593          	srai	a1,a1,0xa
c00003cc:	0000c517          	auipc	a0,0xc
c00003d0:	9a850513          	addi	a0,a0,-1624 # c000bd74 <etext+0x118>
c00003d4:	01010113          	addi	sp,sp,16
c00003d8:	d05ff06f          	j	c00000dc <cprintf>

c00003dc <print_stackframe>:
c00003dc:	ff010113          	addi	sp,sp,-16
c00003e0:	0000c617          	auipc	a2,0xc
c00003e4:	8e060613          	addi	a2,a2,-1824 # c000bcc0 <etext+0x64>
c00003e8:	05b00593          	li	a1,91
c00003ec:	0000c517          	auipc	a0,0xc
c00003f0:	8e850513          	addi	a0,a0,-1816 # c000bcd4 <etext+0x78>
c00003f4:	00112623          	sw	ra,12(sp)
c00003f8:	e59ff0ef          	jal	ra,c0000250 <__panic>

c00003fc <mon_help>:
c00003fc:	ff010113          	addi	sp,sp,-16
c0000400:	0000c617          	auipc	a2,0xc
c0000404:	a5860613          	addi	a2,a2,-1448 # c000be58 <commands+0xb8>
c0000408:	0000c597          	auipc	a1,0xc
c000040c:	a7058593          	addi	a1,a1,-1424 # c000be78 <commands+0xd8>
c0000410:	0000c517          	auipc	a0,0xc
c0000414:	a7050513          	addi	a0,a0,-1424 # c000be80 <commands+0xe0>
c0000418:	00112623          	sw	ra,12(sp)
c000041c:	cc1ff0ef          	jal	ra,c00000dc <cprintf>
c0000420:	0000c617          	auipc	a2,0xc
c0000424:	a6c60613          	addi	a2,a2,-1428 # c000be8c <commands+0xec>
c0000428:	0000c597          	auipc	a1,0xc
c000042c:	a8c58593          	addi	a1,a1,-1396 # c000beb4 <commands+0x114>
c0000430:	0000c517          	auipc	a0,0xc
c0000434:	a5050513          	addi	a0,a0,-1456 # c000be80 <commands+0xe0>
c0000438:	ca5ff0ef          	jal	ra,c00000dc <cprintf>
c000043c:	0000c617          	auipc	a2,0xc
c0000440:	a8460613          	addi	a2,a2,-1404 # c000bec0 <commands+0x120>
c0000444:	0000c597          	auipc	a1,0xc
c0000448:	a9c58593          	addi	a1,a1,-1380 # c000bee0 <commands+0x140>
c000044c:	0000c517          	auipc	a0,0xc
c0000450:	a3450513          	addi	a0,a0,-1484 # c000be80 <commands+0xe0>
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
c00004ac:	0000c517          	auipc	a0,0xc
c00004b0:	91850513          	addi	a0,a0,-1768 # c000bdc4 <commands+0x24>
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
c00004e4:	0000c517          	auipc	a0,0xc
c00004e8:	90850513          	addi	a0,a0,-1784 # c000bdec <commands+0x4c>
c00004ec:	bf1ff0ef          	jal	ra,c00000dc <cprintf>
c00004f0:	000c0663          	beqz	s8,c00004fc <kmonitor+0x5c>
c00004f4:	000c0513          	mv	a0,s8
c00004f8:	568000ef          	jal	ra,c0000a60 <print_trapframe>
c00004fc:	3ffff317          	auipc	t1,0x3ffff
c0000500:	394300e7          	jalr	916(t1) # fffff890 <sbi_shutdown>
c0000504:	0000cc97          	auipc	s9,0xc
c0000508:	89cc8c93          	addi	s9,s9,-1892 # c000bda0 <commands>
c000050c:	0000c997          	auipc	s3,0xc
c0000510:	90898993          	addi	s3,s3,-1784 # c000be14 <commands+0x74>
c0000514:	0000c497          	auipc	s1,0xc
c0000518:	90448493          	addi	s1,s1,-1788 # c000be18 <commands+0x78>
c000051c:	00f00a13          	li	s4,15
c0000520:	01000b93          	li	s7,16
c0000524:	0000cb17          	auipc	s6,0xc
c0000528:	8fcb0b13          	addi	s6,s6,-1796 # c000be20 <commands+0x80>
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
c0000554:	0000cd17          	auipc	s10,0xc
c0000558:	84cd0d13          	addi	s10,s10,-1972 # c000bda0 <commands>
c000055c:	0000c517          	auipc	a0,0xc
c0000560:	91c50513          	addi	a0,a0,-1764 # c000be78 <commands+0xd8>
c0000564:	00000413          	li	s0,0
c0000568:	00cd0d13          	addi	s10,s10,12
c000056c:	0400b0ef          	jal	ra,c000b5ac <strcmp>
c0000570:	02050063          	beqz	a0,c0000590 <kmonitor+0xf0>
c0000574:	00140413          	addi	s0,s0,1
c0000578:	0f540c63          	beq	s0,s5,c0000670 <kmonitor+0x1d0>
c000057c:	000d2503          	lw	a0,0(s10)
c0000580:	00012583          	lw	a1,0(sp)
c0000584:	00cd0d13          	addi	s10,s10,12
c0000588:	0240b0ef          	jal	ra,c000b5ac <strcmp>
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
c00005f4:	7ed0a0ef          	jal	ra,c000b5e0 <strchr>
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
c000064c:	7950a0ef          	jal	ra,c000b5e0 <strchr>
c0000650:	fe0506e3          	beqz	a0,c000063c <kmonitor+0x19c>
c0000654:	00044583          	lbu	a1,0(s0)
c0000658:	ee058ae3          	beqz	a1,c000054c <kmonitor+0xac>
c000065c:	f95ff06f          	j	c00005f0 <kmonitor+0x150>
c0000660:	000b8593          	mv	a1,s7
c0000664:	000b0513          	mv	a0,s6
c0000668:	a75ff0ef          	jal	ra,c00000dc <cprintf>
c000066c:	fb1ff06f          	j	c000061c <kmonitor+0x17c>
c0000670:	00012583          	lw	a1,0(sp)
c0000674:	0000b517          	auipc	a0,0xb
c0000678:	7cc50513          	addi	a0,a0,1996 # c000be40 <commands+0xa0>
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
c0000698:	00035797          	auipc	a5,0x35
c000069c:	53078793          	addi	a5,a5,1328 # c0035bc8 <ide>
c00006a0:	00959593          	slli	a1,a1,0x9
c00006a4:	ff010113          	addi	sp,sp,-16
c00006a8:	00060513          	mv	a0,a2
c00006ac:	00b785b3          	add	a1,a5,a1
c00006b0:	00969613          	slli	a2,a3,0x9
c00006b4:	00112623          	sw	ra,12(sp)
c00006b8:	7710a0ef          	jal	ra,c000b628 <memcpy>
c00006bc:	00c12083          	lw	ra,12(sp)
c00006c0:	00000513          	li	a0,0
c00006c4:	01010113          	addi	sp,sp,16
c00006c8:	00008067          	ret

c00006cc <ide_write_secs>:
c00006cc:	00060713          	mv	a4,a2
c00006d0:	00959793          	slli	a5,a1,0x9
c00006d4:	00035517          	auipc	a0,0x35
c00006d8:	4f450513          	addi	a0,a0,1268 # c0035bc8 <ide>
c00006dc:	ff010113          	addi	sp,sp,-16
c00006e0:	00969613          	slli	a2,a3,0x9
c00006e4:	00070593          	mv	a1,a4
c00006e8:	00f50533          	add	a0,a0,a5
c00006ec:	00112623          	sw	ra,12(sp)
c00006f0:	7390a0ef          	jal	ra,c000b628 <memcpy>
c00006f4:	00c12083          	lw	ra,12(sp)
c00006f8:	00000513          	li	a0,0
c00006fc:	01010113          	addi	sp,sp,16
c0000700:	00008067          	ret

c0000704 <clock_set_next_event>:
c0000704:	c81027f3          	rdtimeh	a5
c0000708:	c01025f3          	rdtime	a1
c000070c:	c8102773          	rdtimeh	a4
c0000710:	fee79ae3          	bne	a5,a4,c0000704 <clock_set_next_event>
c0000714:	0003e717          	auipc	a4,0x3e
c0000718:	4cc70713          	addi	a4,a4,1228 # c003ebe0 <timebase>
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
c0000754:	0003e797          	auipc	a5,0x3e
c0000758:	48c78793          	addi	a5,a5,1164 # c003ebe0 <timebase>
c000075c:	0007a223          	sw	zero,4(a5)
c0000760:	00a7a023          	sw	a0,0(a5)
c0000764:	fa1ff0ef          	jal	ra,c0000704 <clock_set_next_event>
c0000768:	00c12083          	lw	ra,12(sp)
c000076c:	0000b517          	auipc	a0,0xb
c0000770:	78050513          	addi	a0,a0,1920 # c000beec <commands+0x14c>
c0000774:	0003e297          	auipc	t0,0x3e
c0000778:	4a02a823          	sw	zero,1200(t0) # c003ec24 <ticks>
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
c0000834:	6f478793          	addi	a5,a5,1780 # c0000f24 <__alltraps>
c0000838:	10579073          	csrw	stvec,a5
c000083c:	100167f3          	csrrsi	a5,sstatus,2
c0000840:	00008067          	ret

c0000844 <print_regs>:
c0000844:	00052583          	lw	a1,0(a0)
c0000848:	ff010113          	addi	sp,sp,-16
c000084c:	00812423          	sw	s0,8(sp)
c0000850:	00050413          	mv	s0,a0
c0000854:	0000c517          	auipc	a0,0xc
c0000858:	96850513          	addi	a0,a0,-1688 # c000c1bc <commands+0x41c>
c000085c:	00112623          	sw	ra,12(sp)
c0000860:	87dff0ef          	jal	ra,c00000dc <cprintf>
c0000864:	00442583          	lw	a1,4(s0)
c0000868:	0000c517          	auipc	a0,0xc
c000086c:	96850513          	addi	a0,a0,-1688 # c000c1d0 <commands+0x430>
c0000870:	86dff0ef          	jal	ra,c00000dc <cprintf>
c0000874:	00842583          	lw	a1,8(s0)
c0000878:	0000c517          	auipc	a0,0xc
c000087c:	96c50513          	addi	a0,a0,-1684 # c000c1e4 <commands+0x444>
c0000880:	85dff0ef          	jal	ra,c00000dc <cprintf>
c0000884:	00c42583          	lw	a1,12(s0)
c0000888:	0000c517          	auipc	a0,0xc
c000088c:	97050513          	addi	a0,a0,-1680 # c000c1f8 <commands+0x458>
c0000890:	84dff0ef          	jal	ra,c00000dc <cprintf>
c0000894:	01042583          	lw	a1,16(s0)
c0000898:	0000c517          	auipc	a0,0xc
c000089c:	97450513          	addi	a0,a0,-1676 # c000c20c <commands+0x46c>
c00008a0:	83dff0ef          	jal	ra,c00000dc <cprintf>
c00008a4:	01442583          	lw	a1,20(s0)
c00008a8:	0000c517          	auipc	a0,0xc
c00008ac:	97850513          	addi	a0,a0,-1672 # c000c220 <commands+0x480>
c00008b0:	82dff0ef          	jal	ra,c00000dc <cprintf>
c00008b4:	01842583          	lw	a1,24(s0)
c00008b8:	0000c517          	auipc	a0,0xc
c00008bc:	97c50513          	addi	a0,a0,-1668 # c000c234 <commands+0x494>
c00008c0:	81dff0ef          	jal	ra,c00000dc <cprintf>
c00008c4:	01c42583          	lw	a1,28(s0)
c00008c8:	0000c517          	auipc	a0,0xc
c00008cc:	98050513          	addi	a0,a0,-1664 # c000c248 <commands+0x4a8>
c00008d0:	80dff0ef          	jal	ra,c00000dc <cprintf>
c00008d4:	02042583          	lw	a1,32(s0)
c00008d8:	0000c517          	auipc	a0,0xc
c00008dc:	98450513          	addi	a0,a0,-1660 # c000c25c <commands+0x4bc>
c00008e0:	ffcff0ef          	jal	ra,c00000dc <cprintf>
c00008e4:	02442583          	lw	a1,36(s0)
c00008e8:	0000c517          	auipc	a0,0xc
c00008ec:	98850513          	addi	a0,a0,-1656 # c000c270 <commands+0x4d0>
c00008f0:	fecff0ef          	jal	ra,c00000dc <cprintf>
c00008f4:	02842583          	lw	a1,40(s0)
c00008f8:	0000c517          	auipc	a0,0xc
c00008fc:	98c50513          	addi	a0,a0,-1652 # c000c284 <commands+0x4e4>
c0000900:	fdcff0ef          	jal	ra,c00000dc <cprintf>
c0000904:	02c42583          	lw	a1,44(s0)
c0000908:	0000c517          	auipc	a0,0xc
c000090c:	99050513          	addi	a0,a0,-1648 # c000c298 <commands+0x4f8>
c0000910:	fccff0ef          	jal	ra,c00000dc <cprintf>
c0000914:	03042583          	lw	a1,48(s0)
c0000918:	0000c517          	auipc	a0,0xc
c000091c:	99450513          	addi	a0,a0,-1644 # c000c2ac <commands+0x50c>
c0000920:	fbcff0ef          	jal	ra,c00000dc <cprintf>
c0000924:	03442583          	lw	a1,52(s0)
c0000928:	0000c517          	auipc	a0,0xc
c000092c:	99850513          	addi	a0,a0,-1640 # c000c2c0 <commands+0x520>
c0000930:	facff0ef          	jal	ra,c00000dc <cprintf>
c0000934:	03842583          	lw	a1,56(s0)
c0000938:	0000c517          	auipc	a0,0xc
c000093c:	99c50513          	addi	a0,a0,-1636 # c000c2d4 <commands+0x534>
c0000940:	f9cff0ef          	jal	ra,c00000dc <cprintf>
c0000944:	03c42583          	lw	a1,60(s0)
c0000948:	0000c517          	auipc	a0,0xc
c000094c:	9a050513          	addi	a0,a0,-1632 # c000c2e8 <commands+0x548>
c0000950:	f8cff0ef          	jal	ra,c00000dc <cprintf>
c0000954:	04042583          	lw	a1,64(s0)
c0000958:	0000c517          	auipc	a0,0xc
c000095c:	9a450513          	addi	a0,a0,-1628 # c000c2fc <commands+0x55c>
c0000960:	f7cff0ef          	jal	ra,c00000dc <cprintf>
c0000964:	04442583          	lw	a1,68(s0)
c0000968:	0000c517          	auipc	a0,0xc
c000096c:	9a850513          	addi	a0,a0,-1624 # c000c310 <commands+0x570>
c0000970:	f6cff0ef          	jal	ra,c00000dc <cprintf>
c0000974:	04842583          	lw	a1,72(s0)
c0000978:	0000c517          	auipc	a0,0xc
c000097c:	9ac50513          	addi	a0,a0,-1620 # c000c324 <commands+0x584>
c0000980:	f5cff0ef          	jal	ra,c00000dc <cprintf>
c0000984:	04c42583          	lw	a1,76(s0)
c0000988:	0000c517          	auipc	a0,0xc
c000098c:	9b050513          	addi	a0,a0,-1616 # c000c338 <commands+0x598>
c0000990:	f4cff0ef          	jal	ra,c00000dc <cprintf>
c0000994:	05042583          	lw	a1,80(s0)
c0000998:	0000c517          	auipc	a0,0xc
c000099c:	9b450513          	addi	a0,a0,-1612 # c000c34c <commands+0x5ac>
c00009a0:	f3cff0ef          	jal	ra,c00000dc <cprintf>
c00009a4:	05442583          	lw	a1,84(s0)
c00009a8:	0000c517          	auipc	a0,0xc
c00009ac:	9b850513          	addi	a0,a0,-1608 # c000c360 <commands+0x5c0>
c00009b0:	f2cff0ef          	jal	ra,c00000dc <cprintf>
c00009b4:	05842583          	lw	a1,88(s0)
c00009b8:	0000c517          	auipc	a0,0xc
c00009bc:	9bc50513          	addi	a0,a0,-1604 # c000c374 <commands+0x5d4>
c00009c0:	f1cff0ef          	jal	ra,c00000dc <cprintf>
c00009c4:	05c42583          	lw	a1,92(s0)
c00009c8:	0000c517          	auipc	a0,0xc
c00009cc:	9c050513          	addi	a0,a0,-1600 # c000c388 <commands+0x5e8>
c00009d0:	f0cff0ef          	jal	ra,c00000dc <cprintf>
c00009d4:	06042583          	lw	a1,96(s0)
c00009d8:	0000c517          	auipc	a0,0xc
c00009dc:	9c450513          	addi	a0,a0,-1596 # c000c39c <commands+0x5fc>
c00009e0:	efcff0ef          	jal	ra,c00000dc <cprintf>
c00009e4:	06442583          	lw	a1,100(s0)
c00009e8:	0000c517          	auipc	a0,0xc
c00009ec:	9c850513          	addi	a0,a0,-1592 # c000c3b0 <commands+0x610>
c00009f0:	eecff0ef          	jal	ra,c00000dc <cprintf>
c00009f4:	06842583          	lw	a1,104(s0)
c00009f8:	0000c517          	auipc	a0,0xc
c00009fc:	9cc50513          	addi	a0,a0,-1588 # c000c3c4 <commands+0x624>
c0000a00:	edcff0ef          	jal	ra,c00000dc <cprintf>
c0000a04:	06c42583          	lw	a1,108(s0)
c0000a08:	0000c517          	auipc	a0,0xc
c0000a0c:	9d050513          	addi	a0,a0,-1584 # c000c3d8 <commands+0x638>
c0000a10:	eccff0ef          	jal	ra,c00000dc <cprintf>
c0000a14:	07042583          	lw	a1,112(s0)
c0000a18:	0000c517          	auipc	a0,0xc
c0000a1c:	9d450513          	addi	a0,a0,-1580 # c000c3ec <commands+0x64c>
c0000a20:	ebcff0ef          	jal	ra,c00000dc <cprintf>
c0000a24:	07442583          	lw	a1,116(s0)
c0000a28:	0000c517          	auipc	a0,0xc
c0000a2c:	9d850513          	addi	a0,a0,-1576 # c000c400 <commands+0x660>
c0000a30:	eacff0ef          	jal	ra,c00000dc <cprintf>
c0000a34:	07842583          	lw	a1,120(s0)
c0000a38:	0000c517          	auipc	a0,0xc
c0000a3c:	9dc50513          	addi	a0,a0,-1572 # c000c414 <commands+0x674>
c0000a40:	e9cff0ef          	jal	ra,c00000dc <cprintf>
c0000a44:	07c42583          	lw	a1,124(s0)
c0000a48:	00c12083          	lw	ra,12(sp)
c0000a4c:	00812403          	lw	s0,8(sp)
c0000a50:	0000c517          	auipc	a0,0xc
c0000a54:	9d850513          	addi	a0,a0,-1576 # c000c428 <commands+0x688>
c0000a58:	01010113          	addi	sp,sp,16
c0000a5c:	e80ff06f          	j	c00000dc <cprintf>

c0000a60 <print_trapframe>:
c0000a60:	ff010113          	addi	sp,sp,-16
c0000a64:	00050593          	mv	a1,a0
c0000a68:	00812423          	sw	s0,8(sp)
c0000a6c:	00050413          	mv	s0,a0
c0000a70:	0000c517          	auipc	a0,0xc
c0000a74:	9cc50513          	addi	a0,a0,-1588 # c000c43c <commands+0x69c>
c0000a78:	00112623          	sw	ra,12(sp)
c0000a7c:	e60ff0ef          	jal	ra,c00000dc <cprintf>
c0000a80:	00040513          	mv	a0,s0
c0000a84:	dc1ff0ef          	jal	ra,c0000844 <print_regs>
c0000a88:	08042583          	lw	a1,128(s0)
c0000a8c:	0000c517          	auipc	a0,0xc
c0000a90:	9c450513          	addi	a0,a0,-1596 # c000c450 <commands+0x6b0>
c0000a94:	e48ff0ef          	jal	ra,c00000dc <cprintf>
c0000a98:	08442583          	lw	a1,132(s0)
c0000a9c:	0000c517          	auipc	a0,0xc
c0000aa0:	9c850513          	addi	a0,a0,-1592 # c000c464 <commands+0x6c4>
c0000aa4:	e38ff0ef          	jal	ra,c00000dc <cprintf>
c0000aa8:	08842583          	lw	a1,136(s0)
c0000aac:	0000c517          	auipc	a0,0xc
c0000ab0:	9cc50513          	addi	a0,a0,-1588 # c000c478 <commands+0x6d8>
c0000ab4:	e28ff0ef          	jal	ra,c00000dc <cprintf>
c0000ab8:	08c42583          	lw	a1,140(s0)
c0000abc:	00c12083          	lw	ra,12(sp)
c0000ac0:	00812403          	lw	s0,8(sp)
c0000ac4:	0000c517          	auipc	a0,0xc
c0000ac8:	9c850513          	addi	a0,a0,-1592 # c000c48c <commands+0x6ec>
c0000acc:	01010113          	addi	sp,sp,16
c0000ad0:	e0cff06f          	j	c00000dc <cprintf>

c0000ad4 <pgfault_handler>:
c0000ad4:	ff010113          	addi	sp,sp,-16
c0000ad8:	00812423          	sw	s0,8(sp)
c0000adc:	00112623          	sw	ra,12(sp)
c0000ae0:	0003e797          	auipc	a5,0x3e
c0000ae4:	1487a783          	lw	a5,328(a5) # c003ec28 <check_mm_struct>
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
c0000b18:	0000b517          	auipc	a0,0xb
c0000b1c:	62c50513          	addi	a0,a0,1580 # c000c144 <commands+0x3a4>
c0000b20:	dbcff0ef          	jal	ra,c00000dc <cprintf>
c0000b24:	0003e517          	auipc	a0,0x3e
c0000b28:	10452503          	lw	a0,260(a0) # c003ec28 <check_mm_struct>
c0000b2c:	02050c63          	beqz	a0,c0000b64 <pgfault_handler+0x90>
c0000b30:	0003e717          	auipc	a4,0x3e
c0000b34:	0d472703          	lw	a4,212(a4) # c003ec04 <current>
c0000b38:	0003e797          	auipc	a5,0x3e
c0000b3c:	0d07a783          	lw	a5,208(a5) # c003ec08 <idleproc>
c0000b40:	04f71663          	bne	a4,a5,c0000b8c <pgfault_handler+0xb8>
c0000b44:	08842603          	lw	a2,136(s0)
c0000b48:	08c42583          	lw	a1,140(s0)
c0000b4c:	00c12083          	lw	ra,12(sp)
c0000b50:	00812403          	lw	s0,8(sp)
c0000b54:	01010113          	addi	sp,sp,16
c0000b58:	7e50006f          	j	c0001b3c <do_pgfault>
c0000b5c:	05500613          	li	a2,85
c0000b60:	fa5ff06f          	j	c0000b04 <pgfault_handler+0x30>
c0000b64:	0003e797          	auipc	a5,0x3e
c0000b68:	0a07a783          	lw	a5,160(a5) # c003ec04 <current>
c0000b6c:	04078063          	beqz	a5,c0000bac <pgfault_handler+0xd8>
c0000b70:	08842603          	lw	a2,136(s0)
c0000b74:	08c42583          	lw	a1,140(s0)
c0000b78:	00c12083          	lw	ra,12(sp)
c0000b7c:	00812403          	lw	s0,8(sp)
c0000b80:	0187a503          	lw	a0,24(a5)
c0000b84:	01010113          	addi	sp,sp,16
c0000b88:	7b50006f          	j	c0001b3c <do_pgfault>
c0000b8c:	0000b697          	auipc	a3,0xb
c0000b90:	5d868693          	addi	a3,a3,1496 # c000c164 <commands+0x3c4>
c0000b94:	0000b617          	auipc	a2,0xb
c0000b98:	5e460613          	addi	a2,a2,1508 # c000c178 <commands+0x3d8>
c0000b9c:	06900593          	li	a1,105
c0000ba0:	0000b517          	auipc	a0,0xb
c0000ba4:	5f050513          	addi	a0,a0,1520 # c000c190 <commands+0x3f0>
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
c0000bdc:	0000b517          	auipc	a0,0xb
c0000be0:	56850513          	addi	a0,a0,1384 # c000c144 <commands+0x3a4>
c0000be4:	cf8ff0ef          	jal	ra,c00000dc <cprintf>
c0000be8:	0000b617          	auipc	a2,0xb
c0000bec:	5bc60613          	addi	a2,a2,1468 # c000c1a4 <commands+0x404>
c0000bf0:	06f00593          	li	a1,111
c0000bf4:	0000b517          	auipc	a0,0xb
c0000bf8:	59c50513          	addi	a0,a0,1436 # c000c190 <commands+0x3f0>
c0000bfc:	e54ff0ef          	jal	ra,c0000250 <__panic>
c0000c00:	05700693          	li	a3,87
c0000c04:	fd9ff06f          	j	c0000bdc <pgfault_handler+0x108>

c0000c08 <interrupt_handler>:
c0000c08:	08c52783          	lw	a5,140(a0)
c0000c0c:	80000737          	lui	a4,0x80000
c0000c10:	fff74713          	not	a4,a4
c0000c14:	00e7f7b3          	and	a5,a5,a4
c0000c18:	00b00713          	li	a4,11
c0000c1c:	0af76863          	bltu	a4,a5,c0000ccc <interrupt_handler+0xc4>
c0000c20:	0000b717          	auipc	a4,0xb
c0000c24:	2e870713          	addi	a4,a4,744 # c000bf08 <commands+0x168>
c0000c28:	00279793          	slli	a5,a5,0x2
c0000c2c:	00e787b3          	add	a5,a5,a4
c0000c30:	0007a783          	lw	a5,0(a5)
c0000c34:	00e787b3          	add	a5,a5,a4
c0000c38:	00078067          	jr	a5
c0000c3c:	0000b517          	auipc	a0,0xb
c0000c40:	47050513          	addi	a0,a0,1136 # c000c0ac <commands+0x30c>
c0000c44:	c98ff06f          	j	c00000dc <cprintf>
c0000c48:	0000b517          	auipc	a0,0xb
c0000c4c:	4a050513          	addi	a0,a0,1184 # c000c0e8 <commands+0x348>
c0000c50:	c8cff06f          	j	c00000dc <cprintf>
c0000c54:	0000b517          	auipc	a0,0xb
c0000c58:	4b450513          	addi	a0,a0,1204 # c000c108 <commands+0x368>
c0000c5c:	c80ff06f          	j	c00000dc <cprintf>
c0000c60:	0000b517          	auipc	a0,0xb
c0000c64:	4c450513          	addi	a0,a0,1220 # c000c124 <commands+0x384>
c0000c68:	c74ff06f          	j	c00000dc <cprintf>
c0000c6c:	ff010113          	addi	sp,sp,-16
c0000c70:	00112623          	sw	ra,12(sp)
c0000c74:	a91ff0ef          	jal	ra,c0000704 <clock_set_next_event>
c0000c78:	0003e797          	auipc	a5,0x3e
c0000c7c:	fac7a783          	lw	a5,-84(a5) # c003ec24 <ticks>
c0000c80:	00178793          	addi	a5,a5,1
c0000c84:	0003e297          	auipc	t0,0x3e
c0000c88:	faf2a023          	sw	a5,-96(t0) # c003ec24 <ticks>
c0000c8c:	0003e717          	auipc	a4,0x3e
c0000c90:	f7c72703          	lw	a4,-132(a4) # c003ec08 <idleproc>
c0000c94:	0003e797          	auipc	a5,0x3e
c0000c98:	f707a783          	lw	a5,-144(a5) # c003ec04 <current>
c0000c9c:	02e78a63          	beq	a5,a4,c0000cd0 <interrupt_handler+0xc8>
c0000ca0:	0a07a703          	lw	a4,160(a5)
c0000ca4:	02070663          	beqz	a4,c0000cd0 <interrupt_handler+0xc8>
c0000ca8:	00e05663          	blez	a4,c0000cb4 <interrupt_handler+0xac>
c0000cac:	fff70713          	addi	a4,a4,-1
c0000cb0:	0ae7a023          	sw	a4,160(a5)
c0000cb4:	00c12083          	lw	ra,12(sp)
c0000cb8:	01010113          	addi	sp,sp,16
c0000cbc:	00008067          	ret
c0000cc0:	0000b517          	auipc	a0,0xb
c0000cc4:	40850513          	addi	a0,a0,1032 # c000c0c8 <commands+0x328>
c0000cc8:	c14ff06f          	j	c00000dc <cprintf>
c0000ccc:	d95ff06f          	j	c0000a60 <print_trapframe>
c0000cd0:	00100713          	li	a4,1
c0000cd4:	00e7a823          	sw	a4,16(a5)
c0000cd8:	fddff06f          	j	c0000cb4 <interrupt_handler+0xac>

c0000cdc <exception_handler>:
c0000cdc:	08c52783          	lw	a5,140(a0)
c0000ce0:	00b00693          	li	a3,11
c0000ce4:	16f6e063          	bltu	a3,a5,c0000e44 <exception_handler+0x168>
c0000ce8:	0000b717          	auipc	a4,0xb
c0000cec:	25070713          	addi	a4,a4,592 # c000bf38 <commands+0x198>
c0000cf0:	00279793          	slli	a5,a5,0x2
c0000cf4:	00e787b3          	add	a5,a5,a4
c0000cf8:	0007a783          	lw	a5,0(a5)
c0000cfc:	ff010113          	addi	sp,sp,-16
c0000d00:	00812423          	sw	s0,8(sp)
c0000d04:	00112623          	sw	ra,12(sp)
c0000d08:	00912223          	sw	s1,4(sp)
c0000d0c:	00e787b3          	add	a5,a5,a4
c0000d10:	00050413          	mv	s0,a0
c0000d14:	00078067          	jr	a5
c0000d18:	0000b517          	auipc	a0,0xb
c0000d1c:	33450513          	addi	a0,a0,820 # c000c04c <commands+0x2ac>
c0000d20:	bbcff0ef          	jal	ra,c00000dc <cprintf>
c0000d24:	08442783          	lw	a5,132(s0)
c0000d28:	00c12083          	lw	ra,12(sp)
c0000d2c:	00412483          	lw	s1,4(sp)
c0000d30:	00478793          	addi	a5,a5,4
c0000d34:	08f42223          	sw	a5,132(s0)
c0000d38:	00812403          	lw	s0,8(sp)
c0000d3c:	01010113          	addi	sp,sp,16
c0000d40:	7280a06f          	j	c000b468 <syscall>
c0000d44:	0000b517          	auipc	a0,0xb
c0000d48:	32850513          	addi	a0,a0,808 # c000c06c <commands+0x2cc>
c0000d4c:	00c12083          	lw	ra,12(sp)
c0000d50:	00812403          	lw	s0,8(sp)
c0000d54:	00412483          	lw	s1,4(sp)
c0000d58:	01010113          	addi	sp,sp,16
c0000d5c:	b80ff06f          	j	c00000dc <cprintf>
c0000d60:	0000b517          	auipc	a0,0xb
c0000d64:	32c50513          	addi	a0,a0,812 # c000c08c <commands+0x2ec>
c0000d68:	fe5ff06f          	j	c0000d4c <exception_handler+0x70>
c0000d6c:	0000b517          	auipc	a0,0xb
c0000d70:	1fc50513          	addi	a0,a0,508 # c000bf68 <commands+0x1c8>
c0000d74:	fd9ff06f          	j	c0000d4c <exception_handler+0x70>
c0000d78:	0000b517          	auipc	a0,0xb
c0000d7c:	21050513          	addi	a0,a0,528 # c000bf88 <commands+0x1e8>
c0000d80:	b5cff0ef          	jal	ra,c00000dc <cprintf>
c0000d84:	00040513          	mv	a0,s0
c0000d88:	cd9ff0ef          	jal	ra,c0000a60 <print_trapframe>
c0000d8c:	00c12083          	lw	ra,12(sp)
c0000d90:	00812403          	lw	s0,8(sp)
c0000d94:	00412483          	lw	s1,4(sp)
c0000d98:	01010113          	addi	sp,sp,16
c0000d9c:	3ffff317          	auipc	t1,0x3ffff
c0000da0:	af430067          	jr	-1292(t1) # fffff890 <sbi_shutdown>
c0000da4:	0000b517          	auipc	a0,0xb
c0000da8:	20050513          	addi	a0,a0,512 # c000bfa4 <commands+0x204>
c0000dac:	fd5ff06f          	j	c0000d80 <exception_handler+0xa4>
c0000db0:	0000b517          	auipc	a0,0xb
c0000db4:	20c50513          	addi	a0,a0,524 # c000bfbc <commands+0x21c>
c0000db8:	f95ff06f          	j	c0000d4c <exception_handler+0x70>
c0000dbc:	0000b517          	auipc	a0,0xb
c0000dc0:	20c50513          	addi	a0,a0,524 # c000bfc8 <commands+0x228>
c0000dc4:	f89ff06f          	j	c0000d4c <exception_handler+0x70>
c0000dc8:	0000b517          	auipc	a0,0xb
c0000dcc:	21c50513          	addi	a0,a0,540 # c000bfe4 <commands+0x244>
c0000dd0:	b0cff0ef          	jal	ra,c00000dc <cprintf>
c0000dd4:	00040513          	mv	a0,s0
c0000dd8:	cfdff0ef          	jal	ra,c0000ad4 <pgfault_handler>
c0000ddc:	00050493          	mv	s1,a0
c0000de0:	06051463          	bnez	a0,c0000e48 <exception_handler+0x16c>
c0000de4:	00c12083          	lw	ra,12(sp)
c0000de8:	00812403          	lw	s0,8(sp)
c0000dec:	00412483          	lw	s1,4(sp)
c0000df0:	01010113          	addi	sp,sp,16
c0000df4:	00008067          	ret
c0000df8:	0000b517          	auipc	a0,0xb
c0000dfc:	21c50513          	addi	a0,a0,540 # c000c014 <commands+0x274>
c0000e00:	f4dff06f          	j	c0000d4c <exception_handler+0x70>
c0000e04:	0000b517          	auipc	a0,0xb
c0000e08:	23050513          	addi	a0,a0,560 # c000c034 <commands+0x294>
c0000e0c:	ad0ff0ef          	jal	ra,c00000dc <cprintf>
c0000e10:	00040513          	mv	a0,s0
c0000e14:	cc1ff0ef          	jal	ra,c0000ad4 <pgfault_handler>
c0000e18:	00050493          	mv	s1,a0
c0000e1c:	fc0504e3          	beqz	a0,c0000de4 <exception_handler+0x108>
c0000e20:	00040513          	mv	a0,s0
c0000e24:	c3dff0ef          	jal	ra,c0000a60 <print_trapframe>
c0000e28:	00048693          	mv	a3,s1
c0000e2c:	0000b617          	auipc	a2,0xb
c0000e30:	1cc60613          	addi	a2,a2,460 # c000bff8 <commands+0x258>
c0000e34:	0d700593          	li	a1,215
c0000e38:	0000b517          	auipc	a0,0xb
c0000e3c:	35850513          	addi	a0,a0,856 # c000c190 <commands+0x3f0>
c0000e40:	c10ff0ef          	jal	ra,c0000250 <__panic>
c0000e44:	c1dff06f          	j	c0000a60 <print_trapframe>
c0000e48:	00040513          	mv	a0,s0
c0000e4c:	c15ff0ef          	jal	ra,c0000a60 <print_trapframe>
c0000e50:	00048693          	mv	a3,s1
c0000e54:	0000b617          	auipc	a2,0xb
c0000e58:	1a460613          	addi	a2,a2,420 # c000bff8 <commands+0x258>
c0000e5c:	0cd00593          	li	a1,205
c0000e60:	0000b517          	auipc	a0,0xb
c0000e64:	33050513          	addi	a0,a0,816 # c000c190 <commands+0x3f0>
c0000e68:	be8ff0ef          	jal	ra,c0000250 <__panic>

c0000e6c <trap>:
c0000e6c:	0003e717          	auipc	a4,0x3e
c0000e70:	d9872703          	lw	a4,-616(a4) # c003ec04 <current>
c0000e74:	0a070063          	beqz	a4,c0000f14 <trap+0xa8>
c0000e78:	ff010113          	addi	sp,sp,-16
c0000e7c:	00812423          	sw	s0,8(sp)
c0000e80:	08c52683          	lw	a3,140(a0)
c0000e84:	08052403          	lw	s0,128(a0)
c0000e88:	00912223          	sw	s1,4(sp)
c0000e8c:	00112623          	sw	ra,12(sp)
c0000e90:	05472483          	lw	s1,84(a4)
c0000e94:	04a72a23          	sw	a0,84(a4)
c0000e98:	10047413          	andi	s0,s0,256
c0000e9c:	0606c863          	bltz	a3,c0000f0c <trap+0xa0>
c0000ea0:	e3dff0ef          	jal	ra,c0000cdc <exception_handler>
c0000ea4:	0003e797          	auipc	a5,0x3e
c0000ea8:	d607a783          	lw	a5,-672(a5) # c003ec04 <current>
c0000eac:	0497aa23          	sw	s1,84(a5)
c0000eb0:	00041c63          	bnez	s0,c0000ec8 <trap+0x5c>
c0000eb4:	05c7a703          	lw	a4,92(a5)
c0000eb8:	00177713          	andi	a4,a4,1
c0000ebc:	02071a63          	bnez	a4,c0000ef0 <trap+0x84>
c0000ec0:	0107a783          	lw	a5,16(a5)
c0000ec4:	00079c63          	bnez	a5,c0000edc <trap+0x70>
c0000ec8:	00c12083          	lw	ra,12(sp)
c0000ecc:	00812403          	lw	s0,8(sp)
c0000ed0:	00412483          	lw	s1,4(sp)
c0000ed4:	01010113          	addi	sp,sp,16
c0000ed8:	00008067          	ret
c0000edc:	00c12083          	lw	ra,12(sp)
c0000ee0:	00812403          	lw	s0,8(sp)
c0000ee4:	00412483          	lw	s1,4(sp)
c0000ee8:	01010113          	addi	sp,sp,16
c0000eec:	1ad0606f          	j	c0007898 <schedule>
c0000ef0:	ff700513          	li	a0,-9
c0000ef4:	259050ef          	jal	ra,c000694c <do_exit>
c0000ef8:	0003e797          	auipc	a5,0x3e
c0000efc:	d0c7a783          	lw	a5,-756(a5) # c003ec04 <current>
c0000f00:	0107a783          	lw	a5,16(a5)
c0000f04:	fc0782e3          	beqz	a5,c0000ec8 <trap+0x5c>
c0000f08:	fd5ff06f          	j	c0000edc <trap+0x70>
c0000f0c:	cfdff0ef          	jal	ra,c0000c08 <interrupt_handler>
c0000f10:	f95ff06f          	j	c0000ea4 <trap+0x38>
c0000f14:	08c52783          	lw	a5,140(a0)
c0000f18:	0007c463          	bltz	a5,c0000f20 <trap+0xb4>
c0000f1c:	dc1ff06f          	j	c0000cdc <exception_handler>
c0000f20:	ce9ff06f          	j	c0000c08 <interrupt_handler>

c0000f24 <__alltraps>:
c0000f24:	14011173          	csrrw	sp,sscratch,sp
c0000f28:	00011463          	bnez	sp,c0000f30 <__alltraps+0xc>
c0000f2c:	14002173          	csrr	sp,sscratch
c0000f30:	f7010113          	addi	sp,sp,-144
c0000f34:	00012023          	sw	zero,0(sp)
c0000f38:	00112223          	sw	ra,4(sp)
c0000f3c:	00312623          	sw	gp,12(sp)
c0000f40:	00412823          	sw	tp,16(sp)
c0000f44:	00512a23          	sw	t0,20(sp)
c0000f48:	00612c23          	sw	t1,24(sp)
c0000f4c:	00712e23          	sw	t2,28(sp)
c0000f50:	02812023          	sw	s0,32(sp)
c0000f54:	02912223          	sw	s1,36(sp)
c0000f58:	02a12423          	sw	a0,40(sp)
c0000f5c:	02b12623          	sw	a1,44(sp)
c0000f60:	02c12823          	sw	a2,48(sp)
c0000f64:	02d12a23          	sw	a3,52(sp)
c0000f68:	02e12c23          	sw	a4,56(sp)
c0000f6c:	02f12e23          	sw	a5,60(sp)
c0000f70:	05012023          	sw	a6,64(sp)
c0000f74:	05112223          	sw	a7,68(sp)
c0000f78:	05212423          	sw	s2,72(sp)
c0000f7c:	05312623          	sw	s3,76(sp)
c0000f80:	05412823          	sw	s4,80(sp)
c0000f84:	05512a23          	sw	s5,84(sp)
c0000f88:	05612c23          	sw	s6,88(sp)
c0000f8c:	05712e23          	sw	s7,92(sp)
c0000f90:	07812023          	sw	s8,96(sp)
c0000f94:	07912223          	sw	s9,100(sp)
c0000f98:	07a12423          	sw	s10,104(sp)
c0000f9c:	07b12623          	sw	s11,108(sp)
c0000fa0:	07c12823          	sw	t3,112(sp)
c0000fa4:	07d12a23          	sw	t4,116(sp)
c0000fa8:	07e12c23          	sw	t5,120(sp)
c0000fac:	07f12e23          	sw	t6,124(sp)
c0000fb0:	14001473          	csrrw	s0,sscratch,zero
c0000fb4:	100024f3          	csrr	s1,sstatus
c0000fb8:	14102973          	csrr	s2,sepc
c0000fbc:	143029f3          	csrr	s3,sbadaddr
c0000fc0:	14202a73          	csrr	s4,scause
c0000fc4:	00812423          	sw	s0,8(sp)
c0000fc8:	08912023          	sw	s1,128(sp)
c0000fcc:	09212223          	sw	s2,132(sp)
c0000fd0:	09312423          	sw	s3,136(sp)
c0000fd4:	09412623          	sw	s4,140(sp)
c0000fd8:	00010513          	mv	a0,sp
c0000fdc:	e91ff0ef          	jal	ra,c0000e6c <trap>

c0000fe0 <__trapret>:
c0000fe0:	08012483          	lw	s1,128(sp)
c0000fe4:	08412903          	lw	s2,132(sp)
c0000fe8:	1004f413          	andi	s0,s1,256
c0000fec:	00041663          	bnez	s0,c0000ff8 <__trapret+0x18>
c0000ff0:	09010413          	addi	s0,sp,144
c0000ff4:	14041073          	csrw	sscratch,s0
c0000ff8:	10049073          	csrw	sstatus,s1
c0000ffc:	14191073          	csrw	sepc,s2
c0001000:	00412083          	lw	ra,4(sp)
c0001004:	00c12183          	lw	gp,12(sp)
c0001008:	01012203          	lw	tp,16(sp)
c000100c:	01412283          	lw	t0,20(sp)
c0001010:	01812303          	lw	t1,24(sp)
c0001014:	01c12383          	lw	t2,28(sp)
c0001018:	02012403          	lw	s0,32(sp)
c000101c:	02412483          	lw	s1,36(sp)
c0001020:	02812503          	lw	a0,40(sp)
c0001024:	02c12583          	lw	a1,44(sp)
c0001028:	03012603          	lw	a2,48(sp)
c000102c:	03412683          	lw	a3,52(sp)
c0001030:	03812703          	lw	a4,56(sp)
c0001034:	03c12783          	lw	a5,60(sp)
c0001038:	04012803          	lw	a6,64(sp)
c000103c:	04412883          	lw	a7,68(sp)
c0001040:	04812903          	lw	s2,72(sp)
c0001044:	04c12983          	lw	s3,76(sp)
c0001048:	05012a03          	lw	s4,80(sp)
c000104c:	05412a83          	lw	s5,84(sp)
c0001050:	05812b03          	lw	s6,88(sp)
c0001054:	05c12b83          	lw	s7,92(sp)
c0001058:	06012c03          	lw	s8,96(sp)
c000105c:	06412c83          	lw	s9,100(sp)
c0001060:	06812d03          	lw	s10,104(sp)
c0001064:	06c12d83          	lw	s11,108(sp)
c0001068:	07012e03          	lw	t3,112(sp)
c000106c:	07412e83          	lw	t4,116(sp)
c0001070:	07812f03          	lw	t5,120(sp)
c0001074:	07c12f83          	lw	t6,124(sp)
c0001078:	00812103          	lw	sp,8(sp)
c000107c:	10200073          	sret

c0001080 <forkrets>:
c0001080:	00050113          	mv	sp,a0
c0001084:	f5dff06f          	j	c0000fe0 <__trapret>

c0001088 <check_vma_overlap.isra.0.part.1>:
c0001088:	ff010113          	addi	sp,sp,-16
c000108c:	0000b697          	auipc	a3,0xb
c0001090:	41468693          	addi	a3,a3,1044 # c000c4a0 <commands+0x700>
c0001094:	0000b617          	auipc	a2,0xb
c0001098:	0e460613          	addi	a2,a2,228 # c000c178 <commands+0x3d8>
c000109c:	06b00593          	li	a1,107
c00010a0:	0000b517          	auipc	a0,0xb
c00010a4:	42050513          	addi	a0,a0,1056 # c000c4c0 <commands+0x720>
c00010a8:	00112623          	sw	ra,12(sp)
c00010ac:	9a4ff0ef          	jal	ra,c0000250 <__panic>

c00010b0 <mm_create>:
c00010b0:	ff010113          	addi	sp,sp,-16
c00010b4:	02000513          	li	a0,32
c00010b8:	00812423          	sw	s0,8(sp)
c00010bc:	00112623          	sw	ra,12(sp)
c00010c0:	4f0010ef          	jal	ra,c00025b0 <kmalloc>
c00010c4:	00050413          	mv	s0,a0
c00010c8:	02050863          	beqz	a0,c00010f8 <mm_create+0x48>
c00010cc:	00a42223          	sw	a0,4(s0)
c00010d0:	00a42023          	sw	a0,0(s0)
c00010d4:	00052423          	sw	zero,8(a0)
c00010d8:	00052623          	sw	zero,12(a0)
c00010dc:	00052823          	sw	zero,16(a0)
c00010e0:	0003e797          	auipc	a5,0x3e
c00010e4:	b147a783          	lw	a5,-1260(a5) # c003ebf4 <swap_init_ok>
c00010e8:	02079263          	bnez	a5,c000110c <mm_create+0x5c>
c00010ec:	00052a23          	sw	zero,20(a0)
c00010f0:	00042c23          	sw	zero,24(s0)
c00010f4:	00042e23          	sw	zero,28(s0)
c00010f8:	00c12083          	lw	ra,12(sp)
c00010fc:	00040513          	mv	a0,s0
c0001100:	00812403          	lw	s0,8(sp)
c0001104:	01010113          	addi	sp,sp,16
c0001108:	00008067          	ret
c000110c:	739010ef          	jal	ra,c0003044 <swap_init_mm>
c0001110:	fe1ff06f          	j	c00010f0 <mm_create+0x40>

c0001114 <vma_create>:
c0001114:	ff010113          	addi	sp,sp,-16
c0001118:	01212023          	sw	s2,0(sp)
c000111c:	00050913          	mv	s2,a0
c0001120:	01800513          	li	a0,24
c0001124:	00812423          	sw	s0,8(sp)
c0001128:	00912223          	sw	s1,4(sp)
c000112c:	00112623          	sw	ra,12(sp)
c0001130:	00058493          	mv	s1,a1
c0001134:	00060413          	mv	s0,a2
c0001138:	478010ef          	jal	ra,c00025b0 <kmalloc>
c000113c:	00050863          	beqz	a0,c000114c <vma_create+0x38>
c0001140:	01252223          	sw	s2,4(a0)
c0001144:	00952423          	sw	s1,8(a0)
c0001148:	00852623          	sw	s0,12(a0)
c000114c:	00c12083          	lw	ra,12(sp)
c0001150:	00812403          	lw	s0,8(sp)
c0001154:	00412483          	lw	s1,4(sp)
c0001158:	00012903          	lw	s2,0(sp)
c000115c:	01010113          	addi	sp,sp,16
c0001160:	00008067          	ret

c0001164 <find_vma>:
c0001164:	04050263          	beqz	a0,c00011a8 <find_vma+0x44>
c0001168:	00852783          	lw	a5,8(a0)
c000116c:	00078663          	beqz	a5,c0001178 <find_vma+0x14>
c0001170:	0047a703          	lw	a4,4(a5)
c0001174:	04e5f063          	bleu	a4,a1,c00011b4 <find_vma+0x50>
c0001178:	00050793          	mv	a5,a0
c000117c:	0047a783          	lw	a5,4(a5)
c0001180:	02f50463          	beq	a0,a5,c00011a8 <find_vma+0x44>
c0001184:	ff47a703          	lw	a4,-12(a5)
c0001188:	fee5eae3          	bltu	a1,a4,c000117c <find_vma+0x18>
c000118c:	ff87a703          	lw	a4,-8(a5)
c0001190:	fee5f6e3          	bleu	a4,a1,c000117c <find_vma+0x18>
c0001194:	ff078793          	addi	a5,a5,-16
c0001198:	00078863          	beqz	a5,c00011a8 <find_vma+0x44>
c000119c:	00f52423          	sw	a5,8(a0)
c00011a0:	00078513          	mv	a0,a5
c00011a4:	00008067          	ret
c00011a8:	00000793          	li	a5,0
c00011ac:	00078513          	mv	a0,a5
c00011b0:	00008067          	ret
c00011b4:	0087a703          	lw	a4,8(a5)
c00011b8:	fce5f0e3          	bleu	a4,a1,c0001178 <find_vma+0x14>
c00011bc:	00f52423          	sw	a5,8(a0)
c00011c0:	fe1ff06f          	j	c00011a0 <find_vma+0x3c>

c00011c4 <insert_vma_struct>:
c00011c4:	0045a603          	lw	a2,4(a1)
c00011c8:	0085a803          	lw	a6,8(a1)
c00011cc:	ff010113          	addi	sp,sp,-16
c00011d0:	00112623          	sw	ra,12(sp)
c00011d4:	00050713          	mv	a4,a0
c00011d8:	01066a63          	bltu	a2,a6,c00011ec <insert_vma_struct+0x28>
c00011dc:	0bc0006f          	j	c0001298 <insert_vma_struct+0xd4>
c00011e0:	ff47a683          	lw	a3,-12(a5)
c00011e4:	06d66663          	bltu	a2,a3,c0001250 <insert_vma_struct+0x8c>
c00011e8:	00078713          	mv	a4,a5
c00011ec:	00472783          	lw	a5,4(a4)
c00011f0:	fef518e3          	bne	a0,a5,c00011e0 <insert_vma_struct+0x1c>
c00011f4:	00050793          	mv	a5,a0
c00011f8:	0ca70263          	beq	a4,a0,c00012bc <insert_vma_struct+0xf8>
c00011fc:	ff872683          	lw	a3,-8(a4)
c0001200:	ff472883          	lw	a7,-12(a4)
c0001204:	0ad8fa63          	bleu	a3,a7,c00012b8 <insert_vma_struct+0xf4>
c0001208:	06d66863          	bltu	a2,a3,c0001278 <insert_vma_struct+0xb4>
c000120c:	00f50a63          	beq	a0,a5,c0001220 <insert_vma_struct+0x5c>
c0001210:	ff47a683          	lw	a3,-12(a5)
c0001214:	0706e263          	bltu	a3,a6,c0001278 <insert_vma_struct+0xb4>
c0001218:	ff87a603          	lw	a2,-8(a5)
c000121c:	02c6fe63          	bleu	a2,a3,c0001258 <insert_vma_struct+0x94>
c0001220:	01052683          	lw	a3,16(a0)
c0001224:	00a5a023          	sw	a0,0(a1)
c0001228:	01058613          	addi	a2,a1,16
c000122c:	00c7a023          	sw	a2,0(a5)
c0001230:	00c12083          	lw	ra,12(sp)
c0001234:	00c72223          	sw	a2,4(a4)
c0001238:	00f5aa23          	sw	a5,20(a1)
c000123c:	00e5a823          	sw	a4,16(a1)
c0001240:	00168793          	addi	a5,a3,1
c0001244:	00f52823          	sw	a5,16(a0)
c0001248:	01010113          	addi	sp,sp,16
c000124c:	00008067          	ret
c0001250:	fca702e3          	beq	a4,a0,c0001214 <insert_vma_struct+0x50>
c0001254:	fa9ff06f          	j	c00011fc <insert_vma_struct+0x38>
c0001258:	0000b697          	auipc	a3,0xb
c000125c:	3b068693          	addi	a3,a3,944 # c000c608 <commands+0x868>
c0001260:	0000b617          	auipc	a2,0xb
c0001264:	f1860613          	addi	a2,a2,-232 # c000c178 <commands+0x3d8>
c0001268:	06d00593          	li	a1,109
c000126c:	0000b517          	auipc	a0,0xb
c0001270:	25450513          	addi	a0,a0,596 # c000c4c0 <commands+0x720>
c0001274:	fddfe0ef          	jal	ra,c0000250 <__panic>
c0001278:	0000b697          	auipc	a3,0xb
c000127c:	37068693          	addi	a3,a3,880 # c000c5e8 <commands+0x848>
c0001280:	0000b617          	auipc	a2,0xb
c0001284:	ef860613          	addi	a2,a2,-264 # c000c178 <commands+0x3d8>
c0001288:	06c00593          	li	a1,108
c000128c:	0000b517          	auipc	a0,0xb
c0001290:	23450513          	addi	a0,a0,564 # c000c4c0 <commands+0x720>
c0001294:	fbdfe0ef          	jal	ra,c0000250 <__panic>
c0001298:	0000b697          	auipc	a3,0xb
c000129c:	33468693          	addi	a3,a3,820 # c000c5cc <commands+0x82c>
c00012a0:	0000b617          	auipc	a2,0xb
c00012a4:	ed860613          	addi	a2,a2,-296 # c000c178 <commands+0x3d8>
c00012a8:	07400593          	li	a1,116
c00012ac:	0000b517          	auipc	a0,0xb
c00012b0:	21450513          	addi	a0,a0,532 # c000c4c0 <commands+0x720>
c00012b4:	f9dfe0ef          	jal	ra,c0000250 <__panic>
c00012b8:	dd1ff0ef          	jal	ra,c0001088 <check_vma_overlap.isra.0.part.1>
c00012bc:	00070793          	mv	a5,a4
c00012c0:	f61ff06f          	j	c0001220 <insert_vma_struct+0x5c>

c00012c4 <mm_destroy>:
c00012c4:	01852783          	lw	a5,24(a0)
c00012c8:	ff010113          	addi	sp,sp,-16
c00012cc:	00112623          	sw	ra,12(sp)
c00012d0:	00812423          	sw	s0,8(sp)
c00012d4:	04079263          	bnez	a5,c0001318 <mm_destroy+0x54>
c00012d8:	00050413          	mv	s0,a0
c00012dc:	00452503          	lw	a0,4(a0)
c00012e0:	02a40263          	beq	s0,a0,c0001304 <mm_destroy+0x40>
c00012e4:	00052703          	lw	a4,0(a0)
c00012e8:	00452783          	lw	a5,4(a0)
c00012ec:	ff050513          	addi	a0,a0,-16
c00012f0:	00f72223          	sw	a5,4(a4)
c00012f4:	00e7a023          	sw	a4,0(a5)
c00012f8:	3d8010ef          	jal	ra,c00026d0 <kfree>
c00012fc:	00442503          	lw	a0,4(s0)
c0001300:	fea412e3          	bne	s0,a0,c00012e4 <mm_destroy+0x20>
c0001304:	00040513          	mv	a0,s0
c0001308:	00c12083          	lw	ra,12(sp)
c000130c:	00812403          	lw	s0,8(sp)
c0001310:	01010113          	addi	sp,sp,16
c0001314:	3bc0106f          	j	c00026d0 <kfree>
c0001318:	0000b697          	auipc	a3,0xb
c000131c:	31068693          	addi	a3,a3,784 # c000c628 <commands+0x888>
c0001320:	0000b617          	auipc	a2,0xb
c0001324:	e5860613          	addi	a2,a2,-424 # c000c178 <commands+0x3d8>
c0001328:	09400593          	li	a1,148
c000132c:	0000b517          	auipc	a0,0xb
c0001330:	19450513          	addi	a0,a0,404 # c000c4c0 <commands+0x720>
c0001334:	f1dfe0ef          	jal	ra,c0000250 <__panic>

c0001338 <mm_map>:
c0001338:	000017b7          	lui	a5,0x1
c000133c:	fe010113          	addi	sp,sp,-32
c0001340:	fff78793          	addi	a5,a5,-1 # fff <_binary_obj___user_faultread_out_size-0xf69>
c0001344:	fffff837          	lui	a6,0xfffff
c0001348:	00812c23          	sw	s0,24(sp)
c000134c:	00f60433          	add	s0,a2,a5
c0001350:	00912a23          	sw	s1,20(sp)
c0001354:	00b40433          	add	s0,s0,a1
c0001358:	00112e23          	sw	ra,28(sp)
c000135c:	01212823          	sw	s2,16(sp)
c0001360:	01312623          	sw	s3,12(sp)
c0001364:	01412423          	sw	s4,8(sp)
c0001368:	01512223          	sw	s5,4(sp)
c000136c:	0105f4b3          	and	s1,a1,a6
c0001370:	002007b7          	lui	a5,0x200
c0001374:	01047433          	and	s0,s0,a6
c0001378:	08f4e863          	bltu	s1,a5,c0001408 <mm_map+0xd0>
c000137c:	0884f663          	bleu	s0,s1,c0001408 <mm_map+0xd0>
c0001380:	b00007b7          	lui	a5,0xb0000
c0001384:	0887e263          	bltu	a5,s0,c0001408 <mm_map+0xd0>
c0001388:	00050993          	mv	s3,a0
c000138c:	00070a13          	mv	s4,a4
c0001390:	00068a93          	mv	s5,a3
c0001394:	08050263          	beqz	a0,c0001418 <mm_map+0xe0>
c0001398:	00048593          	mv	a1,s1
c000139c:	dc9ff0ef          	jal	ra,c0001164 <find_vma>
c00013a0:	00050663          	beqz	a0,c00013ac <mm_map+0x74>
c00013a4:	00452783          	lw	a5,4(a0)
c00013a8:	0687e063          	bltu	a5,s0,c0001408 <mm_map+0xd0>
c00013ac:	01800513          	li	a0,24
c00013b0:	200010ef          	jal	ra,c00025b0 <kmalloc>
c00013b4:	00050913          	mv	s2,a0
c00013b8:	ffc00513          	li	a0,-4
c00013bc:	02090463          	beqz	s2,c00013e4 <mm_map+0xac>
c00013c0:	00992223          	sw	s1,4(s2)
c00013c4:	00892423          	sw	s0,8(s2)
c00013c8:	01592623          	sw	s5,12(s2)
c00013cc:	00090593          	mv	a1,s2
c00013d0:	00098513          	mv	a0,s3
c00013d4:	df1ff0ef          	jal	ra,c00011c4 <insert_vma_struct>
c00013d8:	020a0c63          	beqz	s4,c0001410 <mm_map+0xd8>
c00013dc:	012a2023          	sw	s2,0(s4)
c00013e0:	00000513          	li	a0,0
c00013e4:	01c12083          	lw	ra,28(sp)
c00013e8:	01812403          	lw	s0,24(sp)
c00013ec:	01412483          	lw	s1,20(sp)
c00013f0:	01012903          	lw	s2,16(sp)
c00013f4:	00c12983          	lw	s3,12(sp)
c00013f8:	00812a03          	lw	s4,8(sp)
c00013fc:	00412a83          	lw	s5,4(sp)
c0001400:	02010113          	addi	sp,sp,32
c0001404:	00008067          	ret
c0001408:	ffd00513          	li	a0,-3
c000140c:	fd9ff06f          	j	c00013e4 <mm_map+0xac>
c0001410:	00000513          	li	a0,0
c0001414:	fd1ff06f          	j	c00013e4 <mm_map+0xac>
c0001418:	0000b697          	auipc	a3,0xb
c000141c:	22468693          	addi	a3,a3,548 # c000c63c <commands+0x89c>
c0001420:	0000b617          	auipc	a2,0xb
c0001424:	d5860613          	addi	a2,a2,-680 # c000c178 <commands+0x3d8>
c0001428:	0a700593          	li	a1,167
c000142c:	0000b517          	auipc	a0,0xb
c0001430:	09450513          	addi	a0,a0,148 # c000c4c0 <commands+0x720>
c0001434:	e1dfe0ef          	jal	ra,c0000250 <__panic>

c0001438 <dup_mmap>:
c0001438:	fe010113          	addi	sp,sp,-32
c000143c:	00112e23          	sw	ra,28(sp)
c0001440:	00812c23          	sw	s0,24(sp)
c0001444:	00912a23          	sw	s1,20(sp)
c0001448:	01212823          	sw	s2,16(sp)
c000144c:	01312623          	sw	s3,12(sp)
c0001450:	01412423          	sw	s4,8(sp)
c0001454:	01512223          	sw	s5,4(sp)
c0001458:	01612023          	sw	s6,0(sp)
c000145c:	0a050463          	beqz	a0,c0001504 <dup_mmap+0xcc>
c0001460:	00050913          	mv	s2,a0
c0001464:	00058493          	mv	s1,a1
c0001468:	00058413          	mv	s0,a1
c000146c:	01800b13          	li	s6,24
c0001470:	02059e63          	bnez	a1,c00014ac <dup_mmap+0x74>
c0001474:	0900006f          	j	c0001504 <dup_mmap+0xcc>
c0001478:	00050593          	mv	a1,a0
c000147c:	0157a223          	sw	s5,4(a5) # b0000004 <sbi_remote_fence_i+0xb0000714>
c0001480:	00090513          	mv	a0,s2
c0001484:	0147a423          	sw	s4,8(a5)
c0001488:	0137a623          	sw	s3,12(a5)
c000148c:	d39ff0ef          	jal	ra,c00011c4 <insert_vma_struct>
c0001490:	ff842683          	lw	a3,-8(s0)
c0001494:	ff442603          	lw	a2,-12(s0)
c0001498:	00c4a583          	lw	a1,12(s1)
c000149c:	00c92503          	lw	a0,12(s2)
c00014a0:	00000713          	li	a4,0
c00014a4:	500030ef          	jal	ra,c00049a4 <copy_range>
c00014a8:	02051463          	bnez	a0,c00014d0 <dup_mmap+0x98>
c00014ac:	00042403          	lw	s0,0(s0)
c00014b0:	04848663          	beq	s1,s0,c00014fc <dup_mmap+0xc4>
c00014b4:	000b0513          	mv	a0,s6
c00014b8:	ff442a83          	lw	s5,-12(s0)
c00014bc:	ff842a03          	lw	s4,-8(s0)
c00014c0:	ffc42983          	lw	s3,-4(s0)
c00014c4:	0ec010ef          	jal	ra,c00025b0 <kmalloc>
c00014c8:	00050793          	mv	a5,a0
c00014cc:	fa0516e3          	bnez	a0,c0001478 <dup_mmap+0x40>
c00014d0:	ffc00513          	li	a0,-4
c00014d4:	01c12083          	lw	ra,28(sp)
c00014d8:	01812403          	lw	s0,24(sp)
c00014dc:	01412483          	lw	s1,20(sp)
c00014e0:	01012903          	lw	s2,16(sp)
c00014e4:	00c12983          	lw	s3,12(sp)
c00014e8:	00812a03          	lw	s4,8(sp)
c00014ec:	00412a83          	lw	s5,4(sp)
c00014f0:	00012b03          	lw	s6,0(sp)
c00014f4:	02010113          	addi	sp,sp,32
c00014f8:	00008067          	ret
c00014fc:	00000513          	li	a0,0
c0001500:	fd5ff06f          	j	c00014d4 <dup_mmap+0x9c>
c0001504:	0000b697          	auipc	a3,0xb
c0001508:	08c68693          	addi	a3,a3,140 # c000c590 <commands+0x7f0>
c000150c:	0000b617          	auipc	a2,0xb
c0001510:	c6c60613          	addi	a2,a2,-916 # c000c178 <commands+0x3d8>
c0001514:	0c000593          	li	a1,192
c0001518:	0000b517          	auipc	a0,0xb
c000151c:	fa850513          	addi	a0,a0,-88 # c000c4c0 <commands+0x720>
c0001520:	d31fe0ef          	jal	ra,c0000250 <__panic>

c0001524 <exit_mmap>:
c0001524:	ff010113          	addi	sp,sp,-16
c0001528:	00112623          	sw	ra,12(sp)
c000152c:	00812423          	sw	s0,8(sp)
c0001530:	00912223          	sw	s1,4(sp)
c0001534:	01212023          	sw	s2,0(sp)
c0001538:	06050663          	beqz	a0,c00015a4 <exit_mmap+0x80>
c000153c:	01852783          	lw	a5,24(a0)
c0001540:	00050493          	mv	s1,a0
c0001544:	06079063          	bnez	a5,c00015a4 <exit_mmap+0x80>
c0001548:	00452403          	lw	s0,4(a0)
c000154c:	00c52903          	lw	s2,12(a0)
c0001550:	02850e63          	beq	a0,s0,c000158c <exit_mmap+0x68>
c0001554:	ff842603          	lw	a2,-8(s0)
c0001558:	ff442583          	lw	a1,-12(s0)
c000155c:	00090513          	mv	a0,s2
c0001560:	7d5020ef          	jal	ra,c0004534 <unmap_range>
c0001564:	00442403          	lw	s0,4(s0)
c0001568:	fe8496e3          	bne	s1,s0,c0001554 <exit_mmap+0x30>
c000156c:	00442483          	lw	s1,4(s0)
c0001570:	00940e63          	beq	s0,s1,c000158c <exit_mmap+0x68>
c0001574:	ff84a603          	lw	a2,-8(s1)
c0001578:	ff44a583          	lw	a1,-12(s1)
c000157c:	00090513          	mv	a0,s2
c0001580:	12c030ef          	jal	ra,c00046ac <exit_range>
c0001584:	0044a483          	lw	s1,4(s1)
c0001588:	fe8496e3          	bne	s1,s0,c0001574 <exit_mmap+0x50>
c000158c:	00c12083          	lw	ra,12(sp)
c0001590:	00812403          	lw	s0,8(sp)
c0001594:	00412483          	lw	s1,4(sp)
c0001598:	00012903          	lw	s2,0(sp)
c000159c:	01010113          	addi	sp,sp,16
c00015a0:	00008067          	ret
c00015a4:	0000b697          	auipc	a3,0xb
c00015a8:	00868693          	addi	a3,a3,8 # c000c5ac <commands+0x80c>
c00015ac:	0000b617          	auipc	a2,0xb
c00015b0:	bcc60613          	addi	a2,a2,-1076 # c000c178 <commands+0x3d8>
c00015b4:	0d600593          	li	a1,214
c00015b8:	0000b517          	auipc	a0,0xb
c00015bc:	f0850513          	addi	a0,a0,-248 # c000c4c0 <commands+0x720>
c00015c0:	c91fe0ef          	jal	ra,c0000250 <__panic>

c00015c4 <vmm_init>:
c00015c4:	fe010113          	addi	sp,sp,-32
c00015c8:	00112e23          	sw	ra,28(sp)
c00015cc:	00812c23          	sw	s0,24(sp)
c00015d0:	00912a23          	sw	s1,20(sp)
c00015d4:	01212823          	sw	s2,16(sp)
c00015d8:	01312623          	sw	s3,12(sp)
c00015dc:	01412423          	sw	s4,8(sp)
c00015e0:	01512223          	sw	s5,4(sp)
c00015e4:	405020ef          	jal	ra,c00041e8 <nr_free_pages>
c00015e8:	401020ef          	jal	ra,c00041e8 <nr_free_pages>
c00015ec:	ac5ff0ef          	jal	ra,c00010b0 <mm_create>
c00015f0:	00050493          	mv	s1,a0
c00015f4:	03200413          	li	s0,50
c00015f8:	01800913          	li	s2,24
c00015fc:	02051263          	bnez	a0,c0001620 <vmm_init+0x5c>
c0001600:	4640006f          	j	c0001a64 <vmm_init+0x4a0>
c0001604:	00852223          	sw	s0,4(a0)
c0001608:	00f52423          	sw	a5,8(a0)
c000160c:	00052623          	sw	zero,12(a0)
c0001610:	ffb40413          	addi	s0,s0,-5
c0001614:	00048513          	mv	a0,s1
c0001618:	badff0ef          	jal	ra,c00011c4 <insert_vma_struct>
c000161c:	02040c63          	beqz	s0,c0001654 <vmm_init+0x90>
c0001620:	00090513          	mv	a0,s2
c0001624:	78d000ef          	jal	ra,c00025b0 <kmalloc>
c0001628:	00050593          	mv	a1,a0
c000162c:	00240793          	addi	a5,s0,2
c0001630:	fc051ae3          	bnez	a0,c0001604 <vmm_init+0x40>
c0001634:	0000b697          	auipc	a3,0xb
c0001638:	24c68693          	addi	a3,a3,588 # c000c880 <commands+0xae0>
c000163c:	0000b617          	auipc	a2,0xb
c0001640:	b3c60613          	addi	a2,a2,-1220 # c000c178 <commands+0x3d8>
c0001644:	11300593          	li	a1,275
c0001648:	0000b517          	auipc	a0,0xb
c000164c:	e7850513          	addi	a0,a0,-392 # c000c4c0 <commands+0x720>
c0001650:	c01fe0ef          	jal	ra,c0000250 <__panic>
c0001654:	03700413          	li	s0,55
c0001658:	01800913          	li	s2,24
c000165c:	1f900993          	li	s3,505
c0001660:	0240006f          	j	c0001684 <vmm_init+0xc0>
c0001664:	00852223          	sw	s0,4(a0)
c0001668:	00f52423          	sw	a5,8(a0)
c000166c:	00052623          	sw	zero,12(a0)
c0001670:	00050593          	mv	a1,a0
c0001674:	00540413          	addi	s0,s0,5
c0001678:	00048513          	mv	a0,s1
c000167c:	b49ff0ef          	jal	ra,c00011c4 <insert_vma_struct>
c0001680:	03340a63          	beq	s0,s3,c00016b4 <vmm_init+0xf0>
c0001684:	00090513          	mv	a0,s2
c0001688:	729000ef          	jal	ra,c00025b0 <kmalloc>
c000168c:	00240793          	addi	a5,s0,2
c0001690:	fc051ae3          	bnez	a0,c0001664 <vmm_init+0xa0>
c0001694:	0000b697          	auipc	a3,0xb
c0001698:	1ec68693          	addi	a3,a3,492 # c000c880 <commands+0xae0>
c000169c:	0000b617          	auipc	a2,0xb
c00016a0:	adc60613          	addi	a2,a2,-1316 # c000c178 <commands+0x3d8>
c00016a4:	11900593          	li	a1,281
c00016a8:	0000b517          	auipc	a0,0xb
c00016ac:	e1850513          	addi	a0,a0,-488 # c000c4c0 <commands+0x720>
c00016b0:	ba1fe0ef          	jal	ra,c0000250 <__panic>
c00016b4:	0044a783          	lw	a5,4(s1)
c00016b8:	00700713          	li	a4,7
c00016bc:	1fb00593          	li	a1,507
c00016c0:	2ef48263          	beq	s1,a5,c00019a4 <vmm_init+0x3e0>
c00016c4:	ff47a603          	lw	a2,-12(a5)
c00016c8:	ffe70693          	addi	a3,a4,-2
c00016cc:	26d61c63          	bne	a2,a3,c0001944 <vmm_init+0x380>
c00016d0:	ff87a683          	lw	a3,-8(a5)
c00016d4:	26e69863          	bne	a3,a4,c0001944 <vmm_init+0x380>
c00016d8:	00570713          	addi	a4,a4,5
c00016dc:	0047a783          	lw	a5,4(a5)
c00016e0:	feb710e3          	bne	a4,a1,c00016c0 <vmm_init+0xfc>
c00016e4:	00500413          	li	s0,5
c00016e8:	1f900a93          	li	s5,505
c00016ec:	00040593          	mv	a1,s0
c00016f0:	00048513          	mv	a0,s1
c00016f4:	a71ff0ef          	jal	ra,c0001164 <find_vma>
c00016f8:	00050913          	mv	s2,a0
c00016fc:	2e050463          	beqz	a0,c00019e4 <vmm_init+0x420>
c0001700:	00140593          	addi	a1,s0,1
c0001704:	00048513          	mv	a0,s1
c0001708:	a5dff0ef          	jal	ra,c0001164 <find_vma>
c000170c:	00050993          	mv	s3,a0
c0001710:	2a050a63          	beqz	a0,c00019c4 <vmm_init+0x400>
c0001714:	00240a13          	addi	s4,s0,2
c0001718:	000a0593          	mv	a1,s4
c000171c:	00048513          	mv	a0,s1
c0001720:	a45ff0ef          	jal	ra,c0001164 <find_vma>
c0001724:	32051063          	bnez	a0,c0001a44 <vmm_init+0x480>
c0001728:	00340593          	addi	a1,s0,3
c000172c:	00048513          	mv	a0,s1
c0001730:	a35ff0ef          	jal	ra,c0001164 <find_vma>
c0001734:	2e051863          	bnez	a0,c0001a24 <vmm_init+0x460>
c0001738:	00440593          	addi	a1,s0,4
c000173c:	00048513          	mv	a0,s1
c0001740:	a25ff0ef          	jal	ra,c0001164 <find_vma>
c0001744:	2c051063          	bnez	a0,c0001a04 <vmm_init+0x440>
c0001748:	00492783          	lw	a5,4(s2)
c000174c:	22f41c63          	bne	s0,a5,c0001984 <vmm_init+0x3c0>
c0001750:	00892783          	lw	a5,8(s2)
c0001754:	23479863          	bne	a5,s4,c0001984 <vmm_init+0x3c0>
c0001758:	0049a703          	lw	a4,4(s3)
c000175c:	20e41463          	bne	s0,a4,c0001964 <vmm_init+0x3a0>
c0001760:	0089a703          	lw	a4,8(s3)
c0001764:	20f71063          	bne	a4,a5,c0001964 <vmm_init+0x3a0>
c0001768:	00540413          	addi	s0,s0,5
c000176c:	f95410e3          	bne	s0,s5,c00016ec <vmm_init+0x128>
c0001770:	00400413          	li	s0,4
c0001774:	fff00913          	li	s2,-1
c0001778:	00040593          	mv	a1,s0
c000177c:	00048513          	mv	a0,s1
c0001780:	9e5ff0ef          	jal	ra,c0001164 <find_vma>
c0001784:	02050e63          	beqz	a0,c00017c0 <vmm_init+0x1fc>
c0001788:	00852683          	lw	a3,8(a0)
c000178c:	00452603          	lw	a2,4(a0)
c0001790:	00040593          	mv	a1,s0
c0001794:	0000b517          	auipc	a0,0xb
c0001798:	fb450513          	addi	a0,a0,-76 # c000c748 <commands+0x9a8>
c000179c:	941fe0ef          	jal	ra,c00000dc <cprintf>
c00017a0:	0000b697          	auipc	a3,0xb
c00017a4:	fd068693          	addi	a3,a3,-48 # c000c770 <commands+0x9d0>
c00017a8:	0000b617          	auipc	a2,0xb
c00017ac:	9d060613          	addi	a2,a2,-1584 # c000c178 <commands+0x3d8>
c00017b0:	13b00593          	li	a1,315
c00017b4:	0000b517          	auipc	a0,0xb
c00017b8:	d0c50513          	addi	a0,a0,-756 # c000c4c0 <commands+0x720>
c00017bc:	a95fe0ef          	jal	ra,c0000250 <__panic>
c00017c0:	fff40413          	addi	s0,s0,-1
c00017c4:	fb241ae3          	bne	s0,s2,c0001778 <vmm_init+0x1b4>
c00017c8:	00048513          	mv	a0,s1
c00017cc:	af9ff0ef          	jal	ra,c00012c4 <mm_destroy>
c00017d0:	0000b517          	auipc	a0,0xb
c00017d4:	fb450513          	addi	a0,a0,-76 # c000c784 <commands+0x9e4>
c00017d8:	905fe0ef          	jal	ra,c00000dc <cprintf>
c00017dc:	20d020ef          	jal	ra,c00041e8 <nr_free_pages>
c00017e0:	00050993          	mv	s3,a0
c00017e4:	0003d917          	auipc	s2,0x3d
c00017e8:	44490913          	addi	s2,s2,1092 # c003ec28 <check_mm_struct>
c00017ec:	8c5ff0ef          	jal	ra,c00010b0 <mm_create>
c00017f0:	00a92023          	sw	a0,0(s2)
c00017f4:	00050413          	mv	s0,a0
c00017f8:	2a050663          	beqz	a0,c0001aa4 <vmm_init+0x4e0>
c00017fc:	0003d497          	auipc	s1,0x3d
c0001800:	3fc4a483          	lw	s1,1020(s1) # c003ebf8 <boot_pgdir>
c0001804:	0004a783          	lw	a5,0(s1)
c0001808:	00952623          	sw	s1,12(a0)
c000180c:	26079c63          	bnez	a5,c0001a84 <vmm_init+0x4c0>
c0001810:	01800513          	li	a0,24
c0001814:	59d000ef          	jal	ra,c00025b0 <kmalloc>
c0001818:	00050a13          	mv	s4,a0
c000181c:	10050463          	beqz	a0,c0001924 <vmm_init+0x360>
c0001820:	004007b7          	lui	a5,0x400
c0001824:	00fa2423          	sw	a5,8(s4)
c0001828:	00200793          	li	a5,2
c000182c:	00050593          	mv	a1,a0
c0001830:	00fa2623          	sw	a5,12(s4)
c0001834:	00040513          	mv	a0,s0
c0001838:	000a2223          	sw	zero,4(s4)
c000183c:	989ff0ef          	jal	ra,c00011c4 <insert_vma_struct>
c0001840:	10000593          	li	a1,256
c0001844:	00040513          	mv	a0,s0
c0001848:	91dff0ef          	jal	ra,c0001164 <find_vma>
c000184c:	00000793          	li	a5,0
c0001850:	06400713          	li	a4,100
c0001854:	2caa1463          	bne	s4,a0,c0001b1c <vmm_init+0x558>
c0001858:	10f78023          	sb	a5,256(a5) # 400100 <_binary_obj___user_matrix_out_size+0x3fd8f8>
c000185c:	00178793          	addi	a5,a5,1
c0001860:	fee79ce3          	bne	a5,a4,c0001858 <vmm_init+0x294>
c0001864:	00001737          	lui	a4,0x1
c0001868:	35670713          	addi	a4,a4,854 # 1356 <_binary_obj___user_faultread_out_size-0xc12>
c000186c:	00000793          	li	a5,0
c0001870:	06400613          	li	a2,100
c0001874:	1007c683          	lbu	a3,256(a5)
c0001878:	00178793          	addi	a5,a5,1
c000187c:	40d70733          	sub	a4,a4,a3
c0001880:	fec79ae3          	bne	a5,a2,c0001874 <vmm_init+0x2b0>
c0001884:	26071c63          	bnez	a4,c0001afc <vmm_init+0x538>
c0001888:	00000593          	li	a1,0
c000188c:	00048513          	mv	a0,s1
c0001890:	759020ef          	jal	ra,c00047e8 <page_remove>
c0001894:	0004a783          	lw	a5,0(s1)
c0001898:	0003d717          	auipc	a4,0x3d
c000189c:	36472703          	lw	a4,868(a4) # c003ebfc <npage>
c00018a0:	00279793          	slli	a5,a5,0x2
c00018a4:	00c7d793          	srli	a5,a5,0xc
c00018a8:	22e7fe63          	bleu	a4,a5,c0001ae4 <vmm_init+0x520>
c00018ac:	00034717          	auipc	a4,0x34
c00018b0:	f0c72703          	lw	a4,-244(a4) # c00357b8 <nbase>
c00018b4:	40e787b3          	sub	a5,a5,a4
c00018b8:	00579793          	slli	a5,a5,0x5
c00018bc:	0003d517          	auipc	a0,0x3d
c00018c0:	42c52503          	lw	a0,1068(a0) # c003ece8 <pages>
c00018c4:	00f50533          	add	a0,a0,a5
c00018c8:	00100593          	li	a1,1
c00018cc:	0b9020ef          	jal	ra,c0004184 <free_pages>
c00018d0:	0004a023          	sw	zero,0(s1)
c00018d4:	00042623          	sw	zero,12(s0)
c00018d8:	00040513          	mv	a0,s0
c00018dc:	9e9ff0ef          	jal	ra,c00012c4 <mm_destroy>
c00018e0:	00092023          	sw	zero,0(s2)
c00018e4:	105020ef          	jal	ra,c00041e8 <nr_free_pages>
c00018e8:	1ca99e63          	bne	s3,a0,c0001ac4 <vmm_init+0x500>
c00018ec:	0000b517          	auipc	a0,0xb
c00018f0:	f6050513          	addi	a0,a0,-160 # c000c84c <commands+0xaac>
c00018f4:	fe8fe0ef          	jal	ra,c00000dc <cprintf>
c00018f8:	01c12083          	lw	ra,28(sp)
c00018fc:	01812403          	lw	s0,24(sp)
c0001900:	01412483          	lw	s1,20(sp)
c0001904:	01012903          	lw	s2,16(sp)
c0001908:	00c12983          	lw	s3,12(sp)
c000190c:	00812a03          	lw	s4,8(sp)
c0001910:	00412a83          	lw	s5,4(sp)
c0001914:	0000b517          	auipc	a0,0xb
c0001918:	f5450513          	addi	a0,a0,-172 # c000c868 <commands+0xac8>
c000191c:	02010113          	addi	sp,sp,32
c0001920:	fbcfe06f          	j	c00000dc <cprintf>
c0001924:	0000b697          	auipc	a3,0xb
c0001928:	f5c68693          	addi	a3,a3,-164 # c000c880 <commands+0xae0>
c000192c:	0000b617          	auipc	a2,0xb
c0001930:	84c60613          	addi	a2,a2,-1972 # c000c178 <commands+0x3d8>
c0001934:	15200593          	li	a1,338
c0001938:	0000b517          	auipc	a0,0xb
c000193c:	b8850513          	addi	a0,a0,-1144 # c000c4c0 <commands+0x720>
c0001940:	911fe0ef          	jal	ra,c0000250 <__panic>
c0001944:	0000b697          	auipc	a3,0xb
c0001948:	d1c68693          	addi	a3,a3,-740 # c000c660 <commands+0x8c0>
c000194c:	0000b617          	auipc	a2,0xb
c0001950:	82c60613          	addi	a2,a2,-2004 # c000c178 <commands+0x3d8>
c0001954:	12200593          	li	a1,290
c0001958:	0000b517          	auipc	a0,0xb
c000195c:	b6850513          	addi	a0,a0,-1176 # c000c4c0 <commands+0x720>
c0001960:	8f1fe0ef          	jal	ra,c0000250 <__panic>
c0001964:	0000b697          	auipc	a3,0xb
c0001968:	db468693          	addi	a3,a3,-588 # c000c718 <commands+0x978>
c000196c:	0000b617          	auipc	a2,0xb
c0001970:	80c60613          	addi	a2,a2,-2036 # c000c178 <commands+0x3d8>
c0001974:	13300593          	li	a1,307
c0001978:	0000b517          	auipc	a0,0xb
c000197c:	b4850513          	addi	a0,a0,-1208 # c000c4c0 <commands+0x720>
c0001980:	8d1fe0ef          	jal	ra,c0000250 <__panic>
c0001984:	0000b697          	auipc	a3,0xb
c0001988:	d6468693          	addi	a3,a3,-668 # c000c6e8 <commands+0x948>
c000198c:	0000a617          	auipc	a2,0xa
c0001990:	7ec60613          	addi	a2,a2,2028 # c000c178 <commands+0x3d8>
c0001994:	13200593          	li	a1,306
c0001998:	0000b517          	auipc	a0,0xb
c000199c:	b2850513          	addi	a0,a0,-1240 # c000c4c0 <commands+0x720>
c00019a0:	8b1fe0ef          	jal	ra,c0000250 <__panic>
c00019a4:	0000b697          	auipc	a3,0xb
c00019a8:	ca468693          	addi	a3,a3,-860 # c000c648 <commands+0x8a8>
c00019ac:	0000a617          	auipc	a2,0xa
c00019b0:	7cc60613          	addi	a2,a2,1996 # c000c178 <commands+0x3d8>
c00019b4:	12000593          	li	a1,288
c00019b8:	0000b517          	auipc	a0,0xb
c00019bc:	b0850513          	addi	a0,a0,-1272 # c000c4c0 <commands+0x720>
c00019c0:	891fe0ef          	jal	ra,c0000250 <__panic>
c00019c4:	0000b697          	auipc	a3,0xb
c00019c8:	ce468693          	addi	a3,a3,-796 # c000c6a8 <commands+0x908>
c00019cc:	0000a617          	auipc	a2,0xa
c00019d0:	7ac60613          	addi	a2,a2,1964 # c000c178 <commands+0x3d8>
c00019d4:	12a00593          	li	a1,298
c00019d8:	0000b517          	auipc	a0,0xb
c00019dc:	ae850513          	addi	a0,a0,-1304 # c000c4c0 <commands+0x720>
c00019e0:	871fe0ef          	jal	ra,c0000250 <__panic>
c00019e4:	0000b697          	auipc	a3,0xb
c00019e8:	cb468693          	addi	a3,a3,-844 # c000c698 <commands+0x8f8>
c00019ec:	0000a617          	auipc	a2,0xa
c00019f0:	78c60613          	addi	a2,a2,1932 # c000c178 <commands+0x3d8>
c00019f4:	12800593          	li	a1,296
c00019f8:	0000b517          	auipc	a0,0xb
c00019fc:	ac850513          	addi	a0,a0,-1336 # c000c4c0 <commands+0x720>
c0001a00:	851fe0ef          	jal	ra,c0000250 <__panic>
c0001a04:	0000b697          	auipc	a3,0xb
c0001a08:	cd468693          	addi	a3,a3,-812 # c000c6d8 <commands+0x938>
c0001a0c:	0000a617          	auipc	a2,0xa
c0001a10:	76c60613          	addi	a2,a2,1900 # c000c178 <commands+0x3d8>
c0001a14:	13000593          	li	a1,304
c0001a18:	0000b517          	auipc	a0,0xb
c0001a1c:	aa850513          	addi	a0,a0,-1368 # c000c4c0 <commands+0x720>
c0001a20:	831fe0ef          	jal	ra,c0000250 <__panic>
c0001a24:	0000b697          	auipc	a3,0xb
c0001a28:	ca468693          	addi	a3,a3,-860 # c000c6c8 <commands+0x928>
c0001a2c:	0000a617          	auipc	a2,0xa
c0001a30:	74c60613          	addi	a2,a2,1868 # c000c178 <commands+0x3d8>
c0001a34:	12e00593          	li	a1,302
c0001a38:	0000b517          	auipc	a0,0xb
c0001a3c:	a8850513          	addi	a0,a0,-1400 # c000c4c0 <commands+0x720>
c0001a40:	811fe0ef          	jal	ra,c0000250 <__panic>
c0001a44:	0000b697          	auipc	a3,0xb
c0001a48:	c7468693          	addi	a3,a3,-908 # c000c6b8 <commands+0x918>
c0001a4c:	0000a617          	auipc	a2,0xa
c0001a50:	72c60613          	addi	a2,a2,1836 # c000c178 <commands+0x3d8>
c0001a54:	12c00593          	li	a1,300
c0001a58:	0000b517          	auipc	a0,0xb
c0001a5c:	a6850513          	addi	a0,a0,-1432 # c000c4c0 <commands+0x720>
c0001a60:	ff0fe0ef          	jal	ra,c0000250 <__panic>
c0001a64:	0000b697          	auipc	a3,0xb
c0001a68:	bd868693          	addi	a3,a3,-1064 # c000c63c <commands+0x89c>
c0001a6c:	0000a617          	auipc	a2,0xa
c0001a70:	70c60613          	addi	a2,a2,1804 # c000c178 <commands+0x3d8>
c0001a74:	10c00593          	li	a1,268
c0001a78:	0000b517          	auipc	a0,0xb
c0001a7c:	a4850513          	addi	a0,a0,-1464 # c000c4c0 <commands+0x720>
c0001a80:	fd0fe0ef          	jal	ra,c0000250 <__panic>
c0001a84:	0000b697          	auipc	a3,0xb
c0001a88:	d3868693          	addi	a3,a3,-712 # c000c7bc <commands+0xa1c>
c0001a8c:	0000a617          	auipc	a2,0xa
c0001a90:	6ec60613          	addi	a2,a2,1772 # c000c178 <commands+0x3d8>
c0001a94:	14f00593          	li	a1,335
c0001a98:	0000b517          	auipc	a0,0xb
c0001a9c:	a2850513          	addi	a0,a0,-1496 # c000c4c0 <commands+0x720>
c0001aa0:	fb0fe0ef          	jal	ra,c0000250 <__panic>
c0001aa4:	0000b697          	auipc	a3,0xb
c0001aa8:	d0068693          	addi	a3,a3,-768 # c000c7a4 <commands+0xa04>
c0001aac:	0000a617          	auipc	a2,0xa
c0001ab0:	6cc60613          	addi	a2,a2,1740 # c000c178 <commands+0x3d8>
c0001ab4:	14b00593          	li	a1,331
c0001ab8:	0000b517          	auipc	a0,0xb
c0001abc:	a0850513          	addi	a0,a0,-1528 # c000c4c0 <commands+0x720>
c0001ac0:	f90fe0ef          	jal	ra,c0000250 <__panic>
c0001ac4:	0000b697          	auipc	a3,0xb
c0001ac8:	d6068693          	addi	a3,a3,-672 # c000c824 <commands+0xa84>
c0001acc:	0000a617          	auipc	a2,0xa
c0001ad0:	6ac60613          	addi	a2,a2,1708 # c000c178 <commands+0x3d8>
c0001ad4:	16b00593          	li	a1,363
c0001ad8:	0000b517          	auipc	a0,0xb
c0001adc:	9e850513          	addi	a0,a0,-1560 # c000c4c0 <commands+0x720>
c0001ae0:	f70fe0ef          	jal	ra,c0000250 <__panic>
c0001ae4:	0000b617          	auipc	a2,0xb
c0001ae8:	d1060613          	addi	a2,a2,-752 # c000c7f4 <commands+0xa54>
c0001aec:	06100593          	li	a1,97
c0001af0:	0000b517          	auipc	a0,0xb
c0001af4:	d2450513          	addi	a0,a0,-732 # c000c814 <commands+0xa74>
c0001af8:	f58fe0ef          	jal	ra,c0000250 <__panic>
c0001afc:	0000b697          	auipc	a3,0xb
c0001b00:	cec68693          	addi	a3,a3,-788 # c000c7e8 <commands+0xa48>
c0001b04:	0000a617          	auipc	a2,0xa
c0001b08:	67460613          	addi	a2,a2,1652 # c000c178 <commands+0x3d8>
c0001b0c:	16100593          	li	a1,353
c0001b10:	0000b517          	auipc	a0,0xb
c0001b14:	9b050513          	addi	a0,a0,-1616 # c000c4c0 <commands+0x720>
c0001b18:	f38fe0ef          	jal	ra,c0000250 <__panic>
c0001b1c:	0000b697          	auipc	a3,0xb
c0001b20:	cb068693          	addi	a3,a3,-848 # c000c7cc <commands+0xa2c>
c0001b24:	0000a617          	auipc	a2,0xa
c0001b28:	65460613          	addi	a2,a2,1620 # c000c178 <commands+0x3d8>
c0001b2c:	15700593          	li	a1,343
c0001b30:	0000b517          	auipc	a0,0xb
c0001b34:	99050513          	addi	a0,a0,-1648 # c000c4c0 <commands+0x720>
c0001b38:	f18fe0ef          	jal	ra,c0000250 <__panic>

c0001b3c <do_pgfault>:
c0001b3c:	fd010113          	addi	sp,sp,-48
c0001b40:	00060593          	mv	a1,a2
c0001b44:	02812423          	sw	s0,40(sp)
c0001b48:	02912223          	sw	s1,36(sp)
c0001b4c:	02112623          	sw	ra,44(sp)
c0001b50:	03212023          	sw	s2,32(sp)
c0001b54:	01312e23          	sw	s3,28(sp)
c0001b58:	00060413          	mv	s0,a2
c0001b5c:	00050493          	mv	s1,a0
c0001b60:	e04ff0ef          	jal	ra,c0001164 <find_vma>
c0001b64:	0003d797          	auipc	a5,0x3d
c0001b68:	0847a783          	lw	a5,132(a5) # c003ebe8 <pgfault_num>
c0001b6c:	00178793          	addi	a5,a5,1
c0001b70:	0003d297          	auipc	t0,0x3d
c0001b74:	06f2ac23          	sw	a5,120(t0) # c003ebe8 <pgfault_num>
c0001b78:	10050c63          	beqz	a0,c0001c90 <do_pgfault+0x154>
c0001b7c:	00452783          	lw	a5,4(a0)
c0001b80:	10f46863          	bltu	s0,a5,c0001c90 <do_pgfault+0x154>
c0001b84:	00c52783          	lw	a5,12(a0)
c0001b88:	01000993          	li	s3,16
c0001b8c:	0027f793          	andi	a5,a5,2
c0001b90:	0a079063          	bnez	a5,c0001c30 <do_pgfault+0xf4>
c0001b94:	fffff637          	lui	a2,0xfffff
c0001b98:	00c4a503          	lw	a0,12(s1)
c0001b9c:	00c47433          	and	s0,s0,a2
c0001ba0:	00040593          	mv	a1,s0
c0001ba4:	00100613          	li	a2,1
c0001ba8:	698020ef          	jal	ra,c0004240 <get_pte>
c0001bac:	10050863          	beqz	a0,c0001cbc <do_pgfault+0x180>
c0001bb0:	00052583          	lw	a1,0(a0)
c0001bb4:	0a058863          	beqz	a1,c0001c64 <do_pgfault+0x128>
c0001bb8:	0003d797          	auipc	a5,0x3d
c0001bbc:	03c7a783          	lw	a5,60(a5) # c003ebf4 <swap_init_ok>
c0001bc0:	0e078463          	beqz	a5,c0001ca8 <do_pgfault+0x16c>
c0001bc4:	00c10613          	addi	a2,sp,12
c0001bc8:	00040593          	mv	a1,s0
c0001bcc:	00048513          	mv	a0,s1
c0001bd0:	00012623          	sw	zero,12(sp)
c0001bd4:	63c010ef          	jal	ra,c0003210 <swap_in>
c0001bd8:	00050913          	mv	s2,a0
c0001bdc:	04051e63          	bnez	a0,c0001c38 <do_pgfault+0xfc>
c0001be0:	00c12583          	lw	a1,12(sp)
c0001be4:	00c4a503          	lw	a0,12(s1)
c0001be8:	00098693          	mv	a3,s3
c0001bec:	00040613          	mv	a2,s0
c0001bf0:	4a5020ef          	jal	ra,c0004894 <page_insert>
c0001bf4:	00c12603          	lw	a2,12(sp)
c0001bf8:	00100693          	li	a3,1
c0001bfc:	00040593          	mv	a1,s0
c0001c00:	00048513          	mv	a0,s1
c0001c04:	450010ef          	jal	ra,c0003054 <swap_map_swappable>
c0001c08:	00c12783          	lw	a5,12(sp)
c0001c0c:	0087ae23          	sw	s0,28(a5)
c0001c10:	02c12083          	lw	ra,44(sp)
c0001c14:	00090513          	mv	a0,s2
c0001c18:	02812403          	lw	s0,40(sp)
c0001c1c:	02412483          	lw	s1,36(sp)
c0001c20:	02012903          	lw	s2,32(sp)
c0001c24:	01c12983          	lw	s3,28(sp)
c0001c28:	03010113          	addi	sp,sp,48
c0001c2c:	00008067          	ret
c0001c30:	01700993          	li	s3,23
c0001c34:	f61ff06f          	j	c0001b94 <do_pgfault+0x58>
c0001c38:	0000b517          	auipc	a0,0xb
c0001c3c:	91050513          	addi	a0,a0,-1776 # c000c548 <commands+0x7a8>
c0001c40:	c9cfe0ef          	jal	ra,c00000dc <cprintf>
c0001c44:	02c12083          	lw	ra,44(sp)
c0001c48:	00090513          	mv	a0,s2
c0001c4c:	02812403          	lw	s0,40(sp)
c0001c50:	02412483          	lw	s1,36(sp)
c0001c54:	02012903          	lw	s2,32(sp)
c0001c58:	01c12983          	lw	s3,28(sp)
c0001c5c:	03010113          	addi	sp,sp,48
c0001c60:	00008067          	ret
c0001c64:	00c4a503          	lw	a0,12(s1)
c0001c68:	00098613          	mv	a2,s3
c0001c6c:	00040593          	mv	a1,s0
c0001c70:	7f5020ef          	jal	ra,c0004c64 <pgdir_alloc_page>
c0001c74:	00000913          	li	s2,0
c0001c78:	f8051ce3          	bnez	a0,c0001c10 <do_pgfault+0xd4>
c0001c7c:	0000b517          	auipc	a0,0xb
c0001c80:	8a450513          	addi	a0,a0,-1884 # c000c520 <commands+0x780>
c0001c84:	c58fe0ef          	jal	ra,c00000dc <cprintf>
c0001c88:	ffc00913          	li	s2,-4
c0001c8c:	f85ff06f          	j	c0001c10 <do_pgfault+0xd4>
c0001c90:	00040593          	mv	a1,s0
c0001c94:	0000b517          	auipc	a0,0xb
c0001c98:	83c50513          	addi	a0,a0,-1988 # c000c4d0 <commands+0x730>
c0001c9c:	c40fe0ef          	jal	ra,c00000dc <cprintf>
c0001ca0:	ffd00913          	li	s2,-3
c0001ca4:	f6dff06f          	j	c0001c10 <do_pgfault+0xd4>
c0001ca8:	0000b517          	auipc	a0,0xb
c0001cac:	8c050513          	addi	a0,a0,-1856 # c000c568 <commands+0x7c8>
c0001cb0:	c2cfe0ef          	jal	ra,c00000dc <cprintf>
c0001cb4:	ffc00913          	li	s2,-4
c0001cb8:	f59ff06f          	j	c0001c10 <do_pgfault+0xd4>
c0001cbc:	0000b517          	auipc	a0,0xb
c0001cc0:	84450513          	addi	a0,a0,-1980 # c000c500 <commands+0x760>
c0001cc4:	c18fe0ef          	jal	ra,c00000dc <cprintf>
c0001cc8:	ffc00913          	li	s2,-4
c0001ccc:	f45ff06f          	j	c0001c10 <do_pgfault+0xd4>

c0001cd0 <user_mem_check>:
c0001cd0:	fe010113          	addi	sp,sp,-32
c0001cd4:	00812c23          	sw	s0,24(sp)
c0001cd8:	00112e23          	sw	ra,28(sp)
c0001cdc:	00912a23          	sw	s1,20(sp)
c0001ce0:	01212823          	sw	s2,16(sp)
c0001ce4:	01312623          	sw	s3,12(sp)
c0001ce8:	01412423          	sw	s4,8(sp)
c0001cec:	00058413          	mv	s0,a1
c0001cf0:	08050c63          	beqz	a0,c0001d88 <user_mem_check+0xb8>
c0001cf4:	002007b7          	lui	a5,0x200
c0001cf8:	06f5e663          	bltu	a1,a5,c0001d64 <user_mem_check+0x94>
c0001cfc:	00c584b3          	add	s1,a1,a2
c0001d00:	0695f263          	bleu	s1,a1,c0001d64 <user_mem_check+0x94>
c0001d04:	b00007b7          	lui	a5,0xb0000
c0001d08:	0497ee63          	bltu	a5,s1,c0001d64 <user_mem_check+0x94>
c0001d0c:	00050913          	mv	s2,a0
c0001d10:	00068993          	mv	s3,a3
c0001d14:	00001a37          	lui	s4,0x1
c0001d18:	0240006f          	j	c0001d3c <user_mem_check+0x6c>
c0001d1c:	0027f693          	andi	a3,a5,2
c0001d20:	01470733          	add	a4,a4,s4
c0001d24:	0087f793          	andi	a5,a5,8
c0001d28:	02068e63          	beqz	a3,c0001d64 <user_mem_check+0x94>
c0001d2c:	00078463          	beqz	a5,c0001d34 <user_mem_check+0x64>
c0001d30:	02e46a63          	bltu	s0,a4,c0001d64 <user_mem_check+0x94>
c0001d34:	00852403          	lw	s0,8(a0)
c0001d38:	06947463          	bleu	s1,s0,c0001da0 <user_mem_check+0xd0>
c0001d3c:	00040593          	mv	a1,s0
c0001d40:	00090513          	mv	a0,s2
c0001d44:	c20ff0ef          	jal	ra,c0001164 <find_vma>
c0001d48:	00050e63          	beqz	a0,c0001d64 <user_mem_check+0x94>
c0001d4c:	00452703          	lw	a4,4(a0)
c0001d50:	00e46a63          	bltu	s0,a4,c0001d64 <user_mem_check+0x94>
c0001d54:	00c52783          	lw	a5,12(a0)
c0001d58:	fc0992e3          	bnez	s3,c0001d1c <user_mem_check+0x4c>
c0001d5c:	0017f793          	andi	a5,a5,1
c0001d60:	fc079ae3          	bnez	a5,c0001d34 <user_mem_check+0x64>
c0001d64:	00000513          	li	a0,0
c0001d68:	01c12083          	lw	ra,28(sp)
c0001d6c:	01812403          	lw	s0,24(sp)
c0001d70:	01412483          	lw	s1,20(sp)
c0001d74:	01012903          	lw	s2,16(sp)
c0001d78:	00c12983          	lw	s3,12(sp)
c0001d7c:	00812a03          	lw	s4,8(sp)
c0001d80:	02010113          	addi	sp,sp,32
c0001d84:	00008067          	ret
c0001d88:	c00007b7          	lui	a5,0xc0000
c0001d8c:	fcf5ece3          	bltu	a1,a5,c0001d64 <user_mem_check+0x94>
c0001d90:	00c58633          	add	a2,a1,a2
c0001d94:	fcc5f8e3          	bleu	a2,a1,c0001d64 <user_mem_check+0x94>
c0001d98:	f80007b7          	lui	a5,0xf8000
c0001d9c:	fcc7e4e3          	bltu	a5,a2,c0001d64 <user_mem_check+0x94>
c0001da0:	00100513          	li	a0,1
c0001da4:	fc5ff06f          	j	c0001d68 <user_mem_check+0x98>

c0001da8 <_fifo_init_mm>:
c0001da8:	0003d797          	auipc	a5,0x3d
c0001dac:	e8478793          	addi	a5,a5,-380 # c003ec2c <pra_list_head>
c0001db0:	00f52a23          	sw	a5,20(a0)
c0001db4:	00f7a223          	sw	a5,4(a5)
c0001db8:	00f7a023          	sw	a5,0(a5)
c0001dbc:	00000513          	li	a0,0
c0001dc0:	00008067          	ret

c0001dc4 <_fifo_init>:
c0001dc4:	00000513          	li	a0,0
c0001dc8:	00008067          	ret

c0001dcc <_fifo_set_unswappable>:
c0001dcc:	00000513          	li	a0,0
c0001dd0:	00008067          	ret

c0001dd4 <_fifo_tick_event>:
c0001dd4:	00000513          	li	a0,0
c0001dd8:	00008067          	ret

c0001ddc <_fifo_check_swap>:
c0001ddc:	fd010113          	addi	sp,sp,-48
c0001de0:	03212023          	sw	s2,32(sp)
c0001de4:	01312e23          	sw	s3,28(sp)
c0001de8:	0000b517          	auipc	a0,0xb
c0001dec:	aa450513          	addi	a0,a0,-1372 # c000c88c <commands+0xaec>
c0001df0:	00003937          	lui	s2,0x3
c0001df4:	00c00993          	li	s3,12
c0001df8:	02812423          	sw	s0,40(sp)
c0001dfc:	02112623          	sw	ra,44(sp)
c0001e00:	02912223          	sw	s1,36(sp)
c0001e04:	01412c23          	sw	s4,24(sp)
c0001e08:	01512a23          	sw	s5,20(sp)
c0001e0c:	01612823          	sw	s6,16(sp)
c0001e10:	01712623          	sw	s7,12(sp)
c0001e14:	01812423          	sw	s8,8(sp)
c0001e18:	ac4fe0ef          	jal	ra,c00000dc <cprintf>
c0001e1c:	01390023          	sb	s3,0(s2) # 3000 <_binary_obj___user_matrix_out_size+0x7f8>
c0001e20:	0003d417          	auipc	s0,0x3d
c0001e24:	dc842403          	lw	s0,-568(s0) # c003ebe8 <pgfault_num>
c0001e28:	00400793          	li	a5,4
c0001e2c:	1af41c63          	bne	s0,a5,c0001fe4 <_fifo_check_swap+0x208>
c0001e30:	0000b517          	auipc	a0,0xb
c0001e34:	aa850513          	addi	a0,a0,-1368 # c000c8d8 <commands+0xb38>
c0001e38:	00001ab7          	lui	s5,0x1
c0001e3c:	00a00b13          	li	s6,10
c0001e40:	a9cfe0ef          	jal	ra,c00000dc <cprintf>
c0001e44:	016a8023          	sb	s6,0(s5) # 1000 <_binary_obj___user_faultread_out_size-0xf68>
c0001e48:	0003d497          	auipc	s1,0x3d
c0001e4c:	da04a483          	lw	s1,-608(s1) # c003ebe8 <pgfault_num>
c0001e50:	30849a63          	bne	s1,s0,c0002164 <_fifo_check_swap+0x388>
c0001e54:	0000b517          	auipc	a0,0xb
c0001e58:	aac50513          	addi	a0,a0,-1364 # c000c900 <commands+0xb60>
c0001e5c:	00004bb7          	lui	s7,0x4
c0001e60:	00d00c13          	li	s8,13
c0001e64:	a78fe0ef          	jal	ra,c00000dc <cprintf>
c0001e68:	018b8023          	sb	s8,0(s7) # 4000 <_binary_obj___user_matrix_out_size+0x17f8>
c0001e6c:	0003da17          	auipc	s4,0x3d
c0001e70:	d7ca2a03          	lw	s4,-644(s4) # c003ebe8 <pgfault_num>
c0001e74:	2c9a1863          	bne	s4,s1,c0002144 <_fifo_check_swap+0x368>
c0001e78:	0000b517          	auipc	a0,0xb
c0001e7c:	ab050513          	addi	a0,a0,-1360 # c000c928 <commands+0xb88>
c0001e80:	00002437          	lui	s0,0x2
c0001e84:	00b00493          	li	s1,11
c0001e88:	a54fe0ef          	jal	ra,c00000dc <cprintf>
c0001e8c:	00940023          	sb	s1,0(s0) # 2000 <_binary_obj___user_softint_out_size+0x94>
c0001e90:	0003d797          	auipc	a5,0x3d
c0001e94:	d587a783          	lw	a5,-680(a5) # c003ebe8 <pgfault_num>
c0001e98:	29479663          	bne	a5,s4,c0002124 <_fifo_check_swap+0x348>
c0001e9c:	0000b517          	auipc	a0,0xb
c0001ea0:	ab450513          	addi	a0,a0,-1356 # c000c950 <commands+0xbb0>
c0001ea4:	a38fe0ef          	jal	ra,c00000dc <cprintf>
c0001ea8:	000057b7          	lui	a5,0x5
c0001eac:	00e00713          	li	a4,14
c0001eb0:	00e78023          	sb	a4,0(a5) # 5000 <_binary_obj___user_matrix_out_size+0x27f8>
c0001eb4:	0003da17          	auipc	s4,0x3d
c0001eb8:	d34a2a03          	lw	s4,-716(s4) # c003ebe8 <pgfault_num>
c0001ebc:	00500793          	li	a5,5
c0001ec0:	24fa1263          	bne	s4,a5,c0002104 <_fifo_check_swap+0x328>
c0001ec4:	0000b517          	auipc	a0,0xb
c0001ec8:	a6450513          	addi	a0,a0,-1436 # c000c928 <commands+0xb88>
c0001ecc:	a10fe0ef          	jal	ra,c00000dc <cprintf>
c0001ed0:	00940023          	sb	s1,0(s0)
c0001ed4:	0003d797          	auipc	a5,0x3d
c0001ed8:	d147a783          	lw	a5,-748(a5) # c003ebe8 <pgfault_num>
c0001edc:	21479463          	bne	a5,s4,c00020e4 <_fifo_check_swap+0x308>
c0001ee0:	0000b517          	auipc	a0,0xb
c0001ee4:	9f850513          	addi	a0,a0,-1544 # c000c8d8 <commands+0xb38>
c0001ee8:	9f4fe0ef          	jal	ra,c00000dc <cprintf>
c0001eec:	016a8023          	sb	s6,0(s5)
c0001ef0:	0003d717          	auipc	a4,0x3d
c0001ef4:	cf872703          	lw	a4,-776(a4) # c003ebe8 <pgfault_num>
c0001ef8:	00600793          	li	a5,6
c0001efc:	1cf71463          	bne	a4,a5,c00020c4 <_fifo_check_swap+0x2e8>
c0001f00:	0000b517          	auipc	a0,0xb
c0001f04:	a2850513          	addi	a0,a0,-1496 # c000c928 <commands+0xb88>
c0001f08:	9d4fe0ef          	jal	ra,c00000dc <cprintf>
c0001f0c:	00940023          	sb	s1,0(s0)
c0001f10:	0003d717          	auipc	a4,0x3d
c0001f14:	cd872703          	lw	a4,-808(a4) # c003ebe8 <pgfault_num>
c0001f18:	00700793          	li	a5,7
c0001f1c:	18f71463          	bne	a4,a5,c00020a4 <_fifo_check_swap+0x2c8>
c0001f20:	0000b517          	auipc	a0,0xb
c0001f24:	96c50513          	addi	a0,a0,-1684 # c000c88c <commands+0xaec>
c0001f28:	9b4fe0ef          	jal	ra,c00000dc <cprintf>
c0001f2c:	01390023          	sb	s3,0(s2)
c0001f30:	0003d717          	auipc	a4,0x3d
c0001f34:	cb872703          	lw	a4,-840(a4) # c003ebe8 <pgfault_num>
c0001f38:	00800793          	li	a5,8
c0001f3c:	14f71463          	bne	a4,a5,c0002084 <_fifo_check_swap+0x2a8>
c0001f40:	0000b517          	auipc	a0,0xb
c0001f44:	9c050513          	addi	a0,a0,-1600 # c000c900 <commands+0xb60>
c0001f48:	994fe0ef          	jal	ra,c00000dc <cprintf>
c0001f4c:	018b8023          	sb	s8,0(s7)
c0001f50:	0003d717          	auipc	a4,0x3d
c0001f54:	c9872703          	lw	a4,-872(a4) # c003ebe8 <pgfault_num>
c0001f58:	00900793          	li	a5,9
c0001f5c:	10f71463          	bne	a4,a5,c0002064 <_fifo_check_swap+0x288>
c0001f60:	0000b517          	auipc	a0,0xb
c0001f64:	9f050513          	addi	a0,a0,-1552 # c000c950 <commands+0xbb0>
c0001f68:	974fe0ef          	jal	ra,c00000dc <cprintf>
c0001f6c:	000057b7          	lui	a5,0x5
c0001f70:	00e00713          	li	a4,14
c0001f74:	00e78023          	sb	a4,0(a5) # 5000 <_binary_obj___user_matrix_out_size+0x27f8>
c0001f78:	0003d417          	auipc	s0,0x3d
c0001f7c:	c7042403          	lw	s0,-912(s0) # c003ebe8 <pgfault_num>
c0001f80:	00a00793          	li	a5,10
c0001f84:	0cf41063          	bne	s0,a5,c0002044 <_fifo_check_swap+0x268>
c0001f88:	0000b517          	auipc	a0,0xb
c0001f8c:	95050513          	addi	a0,a0,-1712 # c000c8d8 <commands+0xb38>
c0001f90:	94cfe0ef          	jal	ra,c00000dc <cprintf>
c0001f94:	000017b7          	lui	a5,0x1
c0001f98:	0007c783          	lbu	a5,0(a5) # 1000 <_binary_obj___user_faultread_out_size-0xf68>
c0001f9c:	08879463          	bne	a5,s0,c0002024 <_fifo_check_swap+0x248>
c0001fa0:	0003d717          	auipc	a4,0x3d
c0001fa4:	c4872703          	lw	a4,-952(a4) # c003ebe8 <pgfault_num>
c0001fa8:	00b00793          	li	a5,11
c0001fac:	04f71c63          	bne	a4,a5,c0002004 <_fifo_check_swap+0x228>
c0001fb0:	02c12083          	lw	ra,44(sp)
c0001fb4:	00000513          	li	a0,0
c0001fb8:	02812403          	lw	s0,40(sp)
c0001fbc:	02412483          	lw	s1,36(sp)
c0001fc0:	02012903          	lw	s2,32(sp)
c0001fc4:	01c12983          	lw	s3,28(sp)
c0001fc8:	01812a03          	lw	s4,24(sp)
c0001fcc:	01412a83          	lw	s5,20(sp)
c0001fd0:	01012b03          	lw	s6,16(sp)
c0001fd4:	00c12b83          	lw	s7,12(sp)
c0001fd8:	00812c03          	lw	s8,8(sp)
c0001fdc:	03010113          	addi	sp,sp,48
c0001fe0:	00008067          	ret
c0001fe4:	0000b697          	auipc	a3,0xb
c0001fe8:	8d068693          	addi	a3,a3,-1840 # c000c8b4 <commands+0xb14>
c0001fec:	0000a617          	auipc	a2,0xa
c0001ff0:	18c60613          	addi	a2,a2,396 # c000c178 <commands+0x3d8>
c0001ff4:	05100593          	li	a1,81
c0001ff8:	0000b517          	auipc	a0,0xb
c0001ffc:	8cc50513          	addi	a0,a0,-1844 # c000c8c4 <commands+0xb24>
c0002000:	a50fe0ef          	jal	ra,c0000250 <__panic>
c0002004:	0000b697          	auipc	a3,0xb
c0002008:	9f868693          	addi	a3,a3,-1544 # c000c9fc <commands+0xc5c>
c000200c:	0000a617          	auipc	a2,0xa
c0002010:	16c60613          	addi	a2,a2,364 # c000c178 <commands+0x3d8>
c0002014:	07300593          	li	a1,115
c0002018:	0000b517          	auipc	a0,0xb
c000201c:	8ac50513          	addi	a0,a0,-1876 # c000c8c4 <commands+0xb24>
c0002020:	a30fe0ef          	jal	ra,c0000250 <__panic>
c0002024:	0000b697          	auipc	a3,0xb
c0002028:	9b468693          	addi	a3,a3,-1612 # c000c9d8 <commands+0xc38>
c000202c:	0000a617          	auipc	a2,0xa
c0002030:	14c60613          	addi	a2,a2,332 # c000c178 <commands+0x3d8>
c0002034:	07100593          	li	a1,113
c0002038:	0000b517          	auipc	a0,0xb
c000203c:	88c50513          	addi	a0,a0,-1908 # c000c8c4 <commands+0xb24>
c0002040:	a10fe0ef          	jal	ra,c0000250 <__panic>
c0002044:	0000b697          	auipc	a3,0xb
c0002048:	98468693          	addi	a3,a3,-1660 # c000c9c8 <commands+0xc28>
c000204c:	0000a617          	auipc	a2,0xa
c0002050:	12c60613          	addi	a2,a2,300 # c000c178 <commands+0x3d8>
c0002054:	06f00593          	li	a1,111
c0002058:	0000b517          	auipc	a0,0xb
c000205c:	86c50513          	addi	a0,a0,-1940 # c000c8c4 <commands+0xb24>
c0002060:	9f0fe0ef          	jal	ra,c0000250 <__panic>
c0002064:	0000b697          	auipc	a3,0xb
c0002068:	95468693          	addi	a3,a3,-1708 # c000c9b8 <commands+0xc18>
c000206c:	0000a617          	auipc	a2,0xa
c0002070:	10c60613          	addi	a2,a2,268 # c000c178 <commands+0x3d8>
c0002074:	06c00593          	li	a1,108
c0002078:	0000b517          	auipc	a0,0xb
c000207c:	84c50513          	addi	a0,a0,-1972 # c000c8c4 <commands+0xb24>
c0002080:	9d0fe0ef          	jal	ra,c0000250 <__panic>
c0002084:	0000b697          	auipc	a3,0xb
c0002088:	92468693          	addi	a3,a3,-1756 # c000c9a8 <commands+0xc08>
c000208c:	0000a617          	auipc	a2,0xa
c0002090:	0ec60613          	addi	a2,a2,236 # c000c178 <commands+0x3d8>
c0002094:	06900593          	li	a1,105
c0002098:	0000b517          	auipc	a0,0xb
c000209c:	82c50513          	addi	a0,a0,-2004 # c000c8c4 <commands+0xb24>
c00020a0:	9b0fe0ef          	jal	ra,c0000250 <__panic>
c00020a4:	0000b697          	auipc	a3,0xb
c00020a8:	8f468693          	addi	a3,a3,-1804 # c000c998 <commands+0xbf8>
c00020ac:	0000a617          	auipc	a2,0xa
c00020b0:	0cc60613          	addi	a2,a2,204 # c000c178 <commands+0x3d8>
c00020b4:	06600593          	li	a1,102
c00020b8:	0000b517          	auipc	a0,0xb
c00020bc:	80c50513          	addi	a0,a0,-2036 # c000c8c4 <commands+0xb24>
c00020c0:	990fe0ef          	jal	ra,c0000250 <__panic>
c00020c4:	0000b697          	auipc	a3,0xb
c00020c8:	8c468693          	addi	a3,a3,-1852 # c000c988 <commands+0xbe8>
c00020cc:	0000a617          	auipc	a2,0xa
c00020d0:	0ac60613          	addi	a2,a2,172 # c000c178 <commands+0x3d8>
c00020d4:	06300593          	li	a1,99
c00020d8:	0000a517          	auipc	a0,0xa
c00020dc:	7ec50513          	addi	a0,a0,2028 # c000c8c4 <commands+0xb24>
c00020e0:	970fe0ef          	jal	ra,c0000250 <__panic>
c00020e4:	0000b697          	auipc	a3,0xb
c00020e8:	89468693          	addi	a3,a3,-1900 # c000c978 <commands+0xbd8>
c00020ec:	0000a617          	auipc	a2,0xa
c00020f0:	08c60613          	addi	a2,a2,140 # c000c178 <commands+0x3d8>
c00020f4:	06000593          	li	a1,96
c00020f8:	0000a517          	auipc	a0,0xa
c00020fc:	7cc50513          	addi	a0,a0,1996 # c000c8c4 <commands+0xb24>
c0002100:	950fe0ef          	jal	ra,c0000250 <__panic>
c0002104:	0000b697          	auipc	a3,0xb
c0002108:	87468693          	addi	a3,a3,-1932 # c000c978 <commands+0xbd8>
c000210c:	0000a617          	auipc	a2,0xa
c0002110:	06c60613          	addi	a2,a2,108 # c000c178 <commands+0x3d8>
c0002114:	05d00593          	li	a1,93
c0002118:	0000a517          	auipc	a0,0xa
c000211c:	7ac50513          	addi	a0,a0,1964 # c000c8c4 <commands+0xb24>
c0002120:	930fe0ef          	jal	ra,c0000250 <__panic>
c0002124:	0000a697          	auipc	a3,0xa
c0002128:	79068693          	addi	a3,a3,1936 # c000c8b4 <commands+0xb14>
c000212c:	0000a617          	auipc	a2,0xa
c0002130:	04c60613          	addi	a2,a2,76 # c000c178 <commands+0x3d8>
c0002134:	05a00593          	li	a1,90
c0002138:	0000a517          	auipc	a0,0xa
c000213c:	78c50513          	addi	a0,a0,1932 # c000c8c4 <commands+0xb24>
c0002140:	910fe0ef          	jal	ra,c0000250 <__panic>
c0002144:	0000a697          	auipc	a3,0xa
c0002148:	77068693          	addi	a3,a3,1904 # c000c8b4 <commands+0xb14>
c000214c:	0000a617          	auipc	a2,0xa
c0002150:	02c60613          	addi	a2,a2,44 # c000c178 <commands+0x3d8>
c0002154:	05700593          	li	a1,87
c0002158:	0000a517          	auipc	a0,0xa
c000215c:	76c50513          	addi	a0,a0,1900 # c000c8c4 <commands+0xb24>
c0002160:	8f0fe0ef          	jal	ra,c0000250 <__panic>
c0002164:	0000a697          	auipc	a3,0xa
c0002168:	75068693          	addi	a3,a3,1872 # c000c8b4 <commands+0xb14>
c000216c:	0000a617          	auipc	a2,0xa
c0002170:	00c60613          	addi	a2,a2,12 # c000c178 <commands+0x3d8>
c0002174:	05400593          	li	a1,84
c0002178:	0000a517          	auipc	a0,0xa
c000217c:	74c50513          	addi	a0,a0,1868 # c000c8c4 <commands+0xb24>
c0002180:	8d0fe0ef          	jal	ra,c0000250 <__panic>

c0002184 <_fifo_swap_out_victim>:
c0002184:	01452783          	lw	a5,20(a0)
c0002188:	ff010113          	addi	sp,sp,-16
c000218c:	00112623          	sw	ra,12(sp)
c0002190:	02078a63          	beqz	a5,c00021c4 <_fifo_swap_out_victim+0x40>
c0002194:	04061863          	bnez	a2,c00021e4 <_fifo_swap_out_victim+0x60>
c0002198:	0047a783          	lw	a5,4(a5)
c000219c:	00c12083          	lw	ra,12(sp)
c00021a0:	00000513          	li	a0,0
c00021a4:	0007a683          	lw	a3,0(a5)
c00021a8:	0047a703          	lw	a4,4(a5)
c00021ac:	fec78793          	addi	a5,a5,-20
c00021b0:	01010113          	addi	sp,sp,16
c00021b4:	00e6a223          	sw	a4,4(a3)
c00021b8:	00d72023          	sw	a3,0(a4)
c00021bc:	00f5a023          	sw	a5,0(a1)
c00021c0:	00008067          	ret
c00021c4:	0000b697          	auipc	a3,0xb
c00021c8:	86868693          	addi	a3,a3,-1944 # c000ca2c <commands+0xc8c>
c00021cc:	0000a617          	auipc	a2,0xa
c00021d0:	fac60613          	addi	a2,a2,-84 # c000c178 <commands+0x3d8>
c00021d4:	04100593          	li	a1,65
c00021d8:	0000a517          	auipc	a0,0xa
c00021dc:	6ec50513          	addi	a0,a0,1772 # c000c8c4 <commands+0xb24>
c00021e0:	870fe0ef          	jal	ra,c0000250 <__panic>
c00021e4:	0000b697          	auipc	a3,0xb
c00021e8:	85868693          	addi	a3,a3,-1960 # c000ca3c <commands+0xc9c>
c00021ec:	0000a617          	auipc	a2,0xa
c00021f0:	f8c60613          	addi	a2,a2,-116 # c000c178 <commands+0x3d8>
c00021f4:	04200593          	li	a1,66
c00021f8:	0000a517          	auipc	a0,0xa
c00021fc:	6cc50513          	addi	a0,a0,1740 # c000c8c4 <commands+0xb24>
c0002200:	850fe0ef          	jal	ra,c0000250 <__panic>

c0002204 <_fifo_map_swappable>:
c0002204:	01460713          	addi	a4,a2,20
c0002208:	01452783          	lw	a5,20(a0)
c000220c:	02070263          	beqz	a4,c0002230 <_fifo_map_swappable+0x2c>
c0002210:	02078063          	beqz	a5,c0002230 <_fifo_map_swappable+0x2c>
c0002214:	0007a683          	lw	a3,0(a5)
c0002218:	00e7a023          	sw	a4,0(a5)
c000221c:	00000513          	li	a0,0
c0002220:	00e6a223          	sw	a4,4(a3)
c0002224:	00f62c23          	sw	a5,24(a2)
c0002228:	00d62a23          	sw	a3,20(a2)
c000222c:	00008067          	ret
c0002230:	ff010113          	addi	sp,sp,-16
c0002234:	0000a697          	auipc	a3,0xa
c0002238:	7d868693          	addi	a3,a3,2008 # c000ca0c <commands+0xc6c>
c000223c:	0000a617          	auipc	a2,0xa
c0002240:	f3c60613          	addi	a2,a2,-196 # c000c178 <commands+0x3d8>
c0002244:	03200593          	li	a1,50
c0002248:	0000a517          	auipc	a0,0xa
c000224c:	67c50513          	addi	a0,a0,1660 # c000c8c4 <commands+0xb24>
c0002250:	00112623          	sw	ra,12(sp)
c0002254:	ffdfd0ef          	jal	ra,c0000250 <__panic>

c0002258 <slob_free>:
c0002258:	08050a63          	beqz	a0,c00022ec <slob_free+0x94>
c000225c:	ff010113          	addi	sp,sp,-16
c0002260:	00112623          	sw	ra,12(sp)
c0002264:	00812423          	sw	s0,8(sp)
c0002268:	08059463          	bnez	a1,c00022f0 <slob_free+0x98>
c000226c:	00050413          	mv	s0,a0
c0002270:	100027f3          	csrr	a5,sstatus
c0002274:	0027f793          	andi	a5,a5,2
c0002278:	00000613          	li	a2,0
c000227c:	08079a63          	bnez	a5,c0002310 <slob_free+0xb8>
c0002280:	00033797          	auipc	a5,0x33
c0002284:	5347a783          	lw	a5,1332(a5) # c00357b4 <slobfree>
c0002288:	0047a703          	lw	a4,4(a5)
c000228c:	0087fc63          	bleu	s0,a5,c00022a4 <slob_free+0x4c>
c0002290:	00e46e63          	bltu	s0,a4,c00022ac <slob_free+0x54>
c0002294:	00e7fc63          	bleu	a4,a5,c00022ac <slob_free+0x54>
c0002298:	00070793          	mv	a5,a4
c000229c:	0047a703          	lw	a4,4(a5)
c00022a0:	fe87e8e3          	bltu	a5,s0,c0002290 <slob_free+0x38>
c00022a4:	fee7eae3          	bltu	a5,a4,c0002298 <slob_free+0x40>
c00022a8:	fee478e3          	bleu	a4,s0,c0002298 <slob_free+0x40>
c00022ac:	00042583          	lw	a1,0(s0)
c00022b0:	00359693          	slli	a3,a1,0x3
c00022b4:	00d406b3          	add	a3,s0,a3
c00022b8:	08d70663          	beq	a4,a3,c0002344 <slob_free+0xec>
c00022bc:	00e42223          	sw	a4,4(s0)
c00022c0:	0007a683          	lw	a3,0(a5)
c00022c4:	00369713          	slli	a4,a3,0x3
c00022c8:	00e78733          	add	a4,a5,a4
c00022cc:	06e40063          	beq	s0,a4,c000232c <slob_free+0xd4>
c00022d0:	0087a223          	sw	s0,4(a5)
c00022d4:	00033297          	auipc	t0,0x33
c00022d8:	4ef2a023          	sw	a5,1248(t0) # c00357b4 <slobfree>
c00022dc:	04061063          	bnez	a2,c000231c <slob_free+0xc4>
c00022e0:	00c12083          	lw	ra,12(sp)
c00022e4:	00812403          	lw	s0,8(sp)
c00022e8:	01010113          	addi	sp,sp,16
c00022ec:	00008067          	ret
c00022f0:	00758793          	addi	a5,a1,7
c00022f4:	0037d793          	srli	a5,a5,0x3
c00022f8:	00f52023          	sw	a5,0(a0)
c00022fc:	00050413          	mv	s0,a0
c0002300:	100027f3          	csrr	a5,sstatus
c0002304:	0027f793          	andi	a5,a5,2
c0002308:	00000613          	li	a2,0
c000230c:	f6078ae3          	beqz	a5,c0002280 <slob_free+0x28>
c0002310:	d14fe0ef          	jal	ra,c0000824 <intr_disable>
c0002314:	00100613          	li	a2,1
c0002318:	f69ff06f          	j	c0002280 <slob_free+0x28>
c000231c:	00c12083          	lw	ra,12(sp)
c0002320:	00812403          	lw	s0,8(sp)
c0002324:	01010113          	addi	sp,sp,16
c0002328:	cf4fe06f          	j	c000081c <intr_enable>
c000232c:	00042703          	lw	a4,0(s0)
c0002330:	00442583          	lw	a1,4(s0)
c0002334:	00d706b3          	add	a3,a4,a3
c0002338:	00d7a023          	sw	a3,0(a5)
c000233c:	00b7a223          	sw	a1,4(a5)
c0002340:	f95ff06f          	j	c00022d4 <slob_free+0x7c>
c0002344:	00072683          	lw	a3,0(a4)
c0002348:	00472703          	lw	a4,4(a4)
c000234c:	00b685b3          	add	a1,a3,a1
c0002350:	00b42023          	sw	a1,0(s0)
c0002354:	00e42223          	sw	a4,4(s0)
c0002358:	f69ff06f          	j	c00022c0 <slob_free+0x68>

c000235c <__slob_get_free_pages.isra.0>:
c000235c:	00100793          	li	a5,1
c0002360:	ff010113          	addi	sp,sp,-16
c0002364:	00a79533          	sll	a0,a5,a0
c0002368:	00112623          	sw	ra,12(sp)
c000236c:	565010ef          	jal	ra,c00040d0 <alloc_pages>
c0002370:	04050a63          	beqz	a0,c00023c4 <__slob_get_free_pages.isra.0+0x68>
c0002374:	0003d697          	auipc	a3,0x3d
c0002378:	9746a683          	lw	a3,-1676(a3) # c003ece8 <pages>
c000237c:	40d506b3          	sub	a3,a0,a3
c0002380:	4056d693          	srai	a3,a3,0x5
c0002384:	00033517          	auipc	a0,0x33
c0002388:	43452503          	lw	a0,1076(a0) # c00357b8 <nbase>
c000238c:	001007b7          	lui	a5,0x100
c0002390:	00a686b3          	add	a3,a3,a0
c0002394:	fff78793          	addi	a5,a5,-1 # fffff <_binary_obj___user_matrix_out_size+0xfd7f7>
c0002398:	00f6f7b3          	and	a5,a3,a5
c000239c:	0003d717          	auipc	a4,0x3d
c00023a0:	86072703          	lw	a4,-1952(a4) # c003ebfc <npage>
c00023a4:	00c69693          	slli	a3,a3,0xc
c00023a8:	02e7f263          	bleu	a4,a5,c00023cc <__slob_get_free_pages.isra.0+0x70>
c00023ac:	0003d517          	auipc	a0,0x3d
c00023b0:	93452503          	lw	a0,-1740(a0) # c003ece0 <va_pa_offset>
c00023b4:	00a68533          	add	a0,a3,a0
c00023b8:	00c12083          	lw	ra,12(sp)
c00023bc:	01010113          	addi	sp,sp,16
c00023c0:	00008067          	ret
c00023c4:	00000513          	li	a0,0
c00023c8:	ff1ff06f          	j	c00023b8 <__slob_get_free_pages.isra.0+0x5c>
c00023cc:	0000a617          	auipc	a2,0xa
c00023d0:	69060613          	addi	a2,a2,1680 # c000ca5c <commands+0xcbc>
c00023d4:	06800593          	li	a1,104
c00023d8:	0000a517          	auipc	a0,0xa
c00023dc:	43c50513          	addi	a0,a0,1084 # c000c814 <commands+0xa74>
c00023e0:	e71fd0ef          	jal	ra,c0000250 <__panic>

c00023e4 <slob_alloc.isra.1.constprop.3>:
c00023e4:	fd010113          	addi	sp,sp,-48
c00023e8:	02112623          	sw	ra,44(sp)
c00023ec:	02812423          	sw	s0,40(sp)
c00023f0:	02912223          	sw	s1,36(sp)
c00023f4:	03212023          	sw	s2,32(sp)
c00023f8:	01312e23          	sw	s3,28(sp)
c00023fc:	00850713          	addi	a4,a0,8
c0002400:	000017b7          	lui	a5,0x1
c0002404:	14f77e63          	bleu	a5,a4,c0002560 <slob_alloc.isra.1.constprop.3+0x17c>
c0002408:	00750493          	addi	s1,a0,7
c000240c:	0034d413          	srli	s0,s1,0x3
c0002410:	10002673          	csrr	a2,sstatus
c0002414:	00267613          	andi	a2,a2,2
c0002418:	0e061e63          	bnez	a2,c0002514 <slob_alloc.isra.1.constprop.3+0x130>
c000241c:	00033697          	auipc	a3,0x33
c0002420:	3986a683          	lw	a3,920(a3) # c00357b4 <slobfree>
c0002424:	0046a783          	lw	a5,4(a3)
c0002428:	0007a703          	lw	a4,0(a5) # 1000 <_binary_obj___user_faultread_out_size-0xf68>
c000242c:	12875463          	ble	s0,a4,c0002554 <slob_alloc.isra.1.constprop.3+0x170>
c0002430:	00001937          	lui	s2,0x1
c0002434:	00100993          	li	s3,1
c0002438:	00f68c63          	beq	a3,a5,c0002450 <slob_alloc.isra.1.constprop.3+0x6c>
c000243c:	0047a503          	lw	a0,4(a5)
c0002440:	00052703          	lw	a4,0(a0)
c0002444:	04875463          	ble	s0,a4,c000248c <slob_alloc.isra.1.constprop.3+0xa8>
c0002448:	00050793          	mv	a5,a0
c000244c:	fef698e3          	bne	a3,a5,c000243c <slob_alloc.isra.1.constprop.3+0x58>
c0002450:	08061463          	bnez	a2,c00024d8 <slob_alloc.isra.1.constprop.3+0xf4>
c0002454:	00000513          	li	a0,0
c0002458:	f05ff0ef          	jal	ra,c000235c <__slob_get_free_pages.isra.0>
c000245c:	08050663          	beqz	a0,c00024e8 <slob_alloc.isra.1.constprop.3+0x104>
c0002460:	00090593          	mv	a1,s2
c0002464:	df5ff0ef          	jal	ra,c0002258 <slob_free>
c0002468:	10002673          	csrr	a2,sstatus
c000246c:	00267613          	andi	a2,a2,2
c0002470:	08061c63          	bnez	a2,c0002508 <slob_alloc.isra.1.constprop.3+0x124>
c0002474:	00033697          	auipc	a3,0x33
c0002478:	3406a683          	lw	a3,832(a3) # c00357b4 <slobfree>
c000247c:	00068793          	mv	a5,a3
c0002480:	0047a503          	lw	a0,4(a5)
c0002484:	00052703          	lw	a4,0(a0)
c0002488:	fc8740e3          	blt	a4,s0,c0002448 <slob_alloc.isra.1.constprop.3+0x64>
c000248c:	0ae40e63          	beq	s0,a4,c0002548 <slob_alloc.isra.1.constprop.3+0x164>
c0002490:	ff84f693          	andi	a3,s1,-8
c0002494:	00d506b3          	add	a3,a0,a3
c0002498:	00d7a223          	sw	a3,4(a5)
c000249c:	00452583          	lw	a1,4(a0)
c00024a0:	40870733          	sub	a4,a4,s0
c00024a4:	00e6a023          	sw	a4,0(a3)
c00024a8:	00b6a223          	sw	a1,4(a3)
c00024ac:	00852023          	sw	s0,0(a0)
c00024b0:	00033297          	auipc	t0,0x33
c00024b4:	30f2a223          	sw	a5,772(t0) # c00357b4 <slobfree>
c00024b8:	06061463          	bnez	a2,c0002520 <slob_alloc.isra.1.constprop.3+0x13c>
c00024bc:	02c12083          	lw	ra,44(sp)
c00024c0:	02812403          	lw	s0,40(sp)
c00024c4:	02412483          	lw	s1,36(sp)
c00024c8:	02012903          	lw	s2,32(sp)
c00024cc:	01c12983          	lw	s3,28(sp)
c00024d0:	03010113          	addi	sp,sp,48
c00024d4:	00008067          	ret
c00024d8:	b44fe0ef          	jal	ra,c000081c <intr_enable>
c00024dc:	00000513          	li	a0,0
c00024e0:	e7dff0ef          	jal	ra,c000235c <__slob_get_free_pages.isra.0>
c00024e4:	f6051ee3          	bnez	a0,c0002460 <slob_alloc.isra.1.constprop.3+0x7c>
c00024e8:	02c12083          	lw	ra,44(sp)
c00024ec:	00000513          	li	a0,0
c00024f0:	02812403          	lw	s0,40(sp)
c00024f4:	02412483          	lw	s1,36(sp)
c00024f8:	02012903          	lw	s2,32(sp)
c00024fc:	01c12983          	lw	s3,28(sp)
c0002500:	03010113          	addi	sp,sp,48
c0002504:	00008067          	ret
c0002508:	b1cfe0ef          	jal	ra,c0000824 <intr_disable>
c000250c:	00098613          	mv	a2,s3
c0002510:	f65ff06f          	j	c0002474 <slob_alloc.isra.1.constprop.3+0x90>
c0002514:	b10fe0ef          	jal	ra,c0000824 <intr_disable>
c0002518:	00100613          	li	a2,1
c000251c:	f01ff06f          	j	c000241c <slob_alloc.isra.1.constprop.3+0x38>
c0002520:	00a12623          	sw	a0,12(sp)
c0002524:	af8fe0ef          	jal	ra,c000081c <intr_enable>
c0002528:	02c12083          	lw	ra,44(sp)
c000252c:	00c12503          	lw	a0,12(sp)
c0002530:	02812403          	lw	s0,40(sp)
c0002534:	02412483          	lw	s1,36(sp)
c0002538:	02012903          	lw	s2,32(sp)
c000253c:	01c12983          	lw	s3,28(sp)
c0002540:	03010113          	addi	sp,sp,48
c0002544:	00008067          	ret
c0002548:	00452703          	lw	a4,4(a0)
c000254c:	00e7a223          	sw	a4,4(a5)
c0002550:	f61ff06f          	j	c00024b0 <slob_alloc.isra.1.constprop.3+0xcc>
c0002554:	00078513          	mv	a0,a5
c0002558:	00068793          	mv	a5,a3
c000255c:	f31ff06f          	j	c000248c <slob_alloc.isra.1.constprop.3+0xa8>
c0002560:	0000a697          	auipc	a3,0xa
c0002564:	56068693          	addi	a3,a3,1376 # c000cac0 <commands+0xd20>
c0002568:	0000a617          	auipc	a2,0xa
c000256c:	c1060613          	addi	a2,a2,-1008 # c000c178 <commands+0x3d8>
c0002570:	06400593          	li	a1,100
c0002574:	0000a517          	auipc	a0,0xa
c0002578:	56c50513          	addi	a0,a0,1388 # c000cae0 <commands+0xd40>
c000257c:	cd5fd0ef          	jal	ra,c0000250 <__panic>

c0002580 <kmalloc_init>:
c0002580:	ff010113          	addi	sp,sp,-16
c0002584:	0000a517          	auipc	a0,0xa
c0002588:	57050513          	addi	a0,a0,1392 # c000caf4 <commands+0xd54>
c000258c:	00112623          	sw	ra,12(sp)
c0002590:	b4dfd0ef          	jal	ra,c00000dc <cprintf>
c0002594:	00c12083          	lw	ra,12(sp)
c0002598:	0000a517          	auipc	a0,0xa
c000259c:	50c50513          	addi	a0,a0,1292 # c000caa4 <commands+0xd04>
c00025a0:	01010113          	addi	sp,sp,16
c00025a4:	b39fd06f          	j	c00000dc <cprintf>

c00025a8 <kallocated>:
c00025a8:	00000513          	li	a0,0
c00025ac:	00008067          	ret

c00025b0 <kmalloc>:
c00025b0:	ff010113          	addi	sp,sp,-16
c00025b4:	00912223          	sw	s1,4(sp)
c00025b8:	000014b7          	lui	s1,0x1
c00025bc:	00812423          	sw	s0,8(sp)
c00025c0:	00112623          	sw	ra,12(sp)
c00025c4:	01212023          	sw	s2,0(sp)
c00025c8:	ff748793          	addi	a5,s1,-9 # ff7 <_binary_obj___user_faultread_out_size-0xf71>
c00025cc:	00050413          	mv	s0,a0
c00025d0:	02a7e863          	bltu	a5,a0,c0002600 <kmalloc+0x50>
c00025d4:	00850513          	addi	a0,a0,8
c00025d8:	e0dff0ef          	jal	ra,c00023e4 <slob_alloc.isra.1.constprop.3>
c00025dc:	00850413          	addi	s0,a0,8
c00025e0:	0c050c63          	beqz	a0,c00026b8 <kmalloc+0x108>
c00025e4:	00c12083          	lw	ra,12(sp)
c00025e8:	00040513          	mv	a0,s0
c00025ec:	00412483          	lw	s1,4(sp)
c00025f0:	00812403          	lw	s0,8(sp)
c00025f4:	00012903          	lw	s2,0(sp)
c00025f8:	01010113          	addi	sp,sp,16
c00025fc:	00008067          	ret
c0002600:	00c00513          	li	a0,12
c0002604:	de1ff0ef          	jal	ra,c00023e4 <slob_alloc.isra.1.constprop.3>
c0002608:	00050913          	mv	s2,a0
c000260c:	0a050663          	beqz	a0,c00026b8 <kmalloc+0x108>
c0002610:	00040793          	mv	a5,s0
c0002614:	00000513          	li	a0,0
c0002618:	0084da63          	ble	s0,s1,c000262c <kmalloc+0x7c>
c000261c:	00048713          	mv	a4,s1
c0002620:	4017d793          	srai	a5,a5,0x1
c0002624:	00150513          	addi	a0,a0,1
c0002628:	fef74ce3          	blt	a4,a5,c0002620 <kmalloc+0x70>
c000262c:	00a92023          	sw	a0,0(s2) # 1000 <_binary_obj___user_faultread_out_size-0xf68>
c0002630:	d2dff0ef          	jal	ra,c000235c <__slob_get_free_pages.isra.0>
c0002634:	00a92223          	sw	a0,4(s2)
c0002638:	00050413          	mv	s0,a0
c000263c:	08050263          	beqz	a0,c00026c0 <kmalloc+0x110>
c0002640:	100027f3          	csrr	a5,sstatus
c0002644:	0027f793          	andi	a5,a5,2
c0002648:	02079a63          	bnez	a5,c000267c <kmalloc+0xcc>
c000264c:	00c12083          	lw	ra,12(sp)
c0002650:	0003c797          	auipc	a5,0x3c
c0002654:	59c7a783          	lw	a5,1436(a5) # c003ebec <bigblocks>
c0002658:	00040513          	mv	a0,s0
c000265c:	00f92423          	sw	a5,8(s2)
c0002660:	0003c297          	auipc	t0,0x3c
c0002664:	5922a623          	sw	s2,1420(t0) # c003ebec <bigblocks>
c0002668:	00812403          	lw	s0,8(sp)
c000266c:	00412483          	lw	s1,4(sp)
c0002670:	00012903          	lw	s2,0(sp)
c0002674:	01010113          	addi	sp,sp,16
c0002678:	00008067          	ret
c000267c:	9a8fe0ef          	jal	ra,c0000824 <intr_disable>
c0002680:	0003c797          	auipc	a5,0x3c
c0002684:	56c7a783          	lw	a5,1388(a5) # c003ebec <bigblocks>
c0002688:	00f92423          	sw	a5,8(s2)
c000268c:	0003c297          	auipc	t0,0x3c
c0002690:	5722a023          	sw	s2,1376(t0) # c003ebec <bigblocks>
c0002694:	988fe0ef          	jal	ra,c000081c <intr_enable>
c0002698:	00c12083          	lw	ra,12(sp)
c000269c:	00492403          	lw	s0,4(s2)
c00026a0:	00412483          	lw	s1,4(sp)
c00026a4:	00012903          	lw	s2,0(sp)
c00026a8:	00040513          	mv	a0,s0
c00026ac:	00812403          	lw	s0,8(sp)
c00026b0:	01010113          	addi	sp,sp,16
c00026b4:	00008067          	ret
c00026b8:	00000413          	li	s0,0
c00026bc:	f29ff06f          	j	c00025e4 <kmalloc+0x34>
c00026c0:	00c00593          	li	a1,12
c00026c4:	00090513          	mv	a0,s2
c00026c8:	b91ff0ef          	jal	ra,c0002258 <slob_free>
c00026cc:	f19ff06f          	j	c00025e4 <kmalloc+0x34>

c00026d0 <kfree>:
c00026d0:	12050c63          	beqz	a0,c0002808 <kfree+0x138>
c00026d4:	ff010113          	addi	sp,sp,-16
c00026d8:	00912223          	sw	s1,4(sp)
c00026dc:	00112623          	sw	ra,12(sp)
c00026e0:	00812423          	sw	s0,8(sp)
c00026e4:	01451793          	slli	a5,a0,0x14
c00026e8:	00050493          	mv	s1,a0
c00026ec:	04079263          	bnez	a5,c0002730 <kfree+0x60>
c00026f0:	100027f3          	csrr	a5,sstatus
c00026f4:	0027f793          	andi	a5,a5,2
c00026f8:	0c079663          	bnez	a5,c00027c4 <kfree+0xf4>
c00026fc:	0003c797          	auipc	a5,0x3c
c0002700:	4f07a783          	lw	a5,1264(a5) # c003ebec <bigblocks>
c0002704:	02078663          	beqz	a5,c0002730 <kfree+0x60>
c0002708:	0047a703          	lw	a4,4(a5)
c000270c:	10e50063          	beq	a0,a4,c000280c <kfree+0x13c>
c0002710:	00000693          	li	a3,0
c0002714:	0100006f          	j	c0002724 <kfree+0x54>
c0002718:	00442703          	lw	a4,4(s0)
c000271c:	02e48863          	beq	s1,a4,c000274c <kfree+0x7c>
c0002720:	00040793          	mv	a5,s0
c0002724:	0087a403          	lw	s0,8(a5)
c0002728:	fe0418e3          	bnez	s0,c0002718 <kfree+0x48>
c000272c:	0c069a63          	bnez	a3,c0002800 <kfree+0x130>
c0002730:	ff848513          	addi	a0,s1,-8
c0002734:	00c12083          	lw	ra,12(sp)
c0002738:	00812403          	lw	s0,8(sp)
c000273c:	00412483          	lw	s1,4(sp)
c0002740:	00000593          	li	a1,0
c0002744:	01010113          	addi	sp,sp,16
c0002748:	b11ff06f          	j	c0002258 <slob_free>
c000274c:	00842703          	lw	a4,8(s0)
c0002750:	00e7a423          	sw	a4,8(a5)
c0002754:	0a069263          	bnez	a3,c00027f8 <kfree+0x128>
c0002758:	c00007b7          	lui	a5,0xc0000
c000275c:	00042703          	lw	a4,0(s0)
c0002760:	0cf4e263          	bltu	s1,a5,c0002824 <kfree+0x154>
c0002764:	0003c697          	auipc	a3,0x3c
c0002768:	57c6a683          	lw	a3,1404(a3) # c003ece0 <va_pa_offset>
c000276c:	40d484b3          	sub	s1,s1,a3
c0002770:	00c4d493          	srli	s1,s1,0xc
c0002774:	0003c797          	auipc	a5,0x3c
c0002778:	4887a783          	lw	a5,1160(a5) # c003ebfc <npage>
c000277c:	0cf4f263          	bleu	a5,s1,c0002840 <kfree+0x170>
c0002780:	00033517          	auipc	a0,0x33
c0002784:	03852503          	lw	a0,56(a0) # c00357b8 <nbase>
c0002788:	40a484b3          	sub	s1,s1,a0
c000278c:	00549493          	slli	s1,s1,0x5
c0002790:	0003c517          	auipc	a0,0x3c
c0002794:	55852503          	lw	a0,1368(a0) # c003ece8 <pages>
c0002798:	00100593          	li	a1,1
c000279c:	00950533          	add	a0,a0,s1
c00027a0:	00e595b3          	sll	a1,a1,a4
c00027a4:	1e1010ef          	jal	ra,c0004184 <free_pages>
c00027a8:	00040513          	mv	a0,s0
c00027ac:	00c12083          	lw	ra,12(sp)
c00027b0:	00812403          	lw	s0,8(sp)
c00027b4:	00412483          	lw	s1,4(sp)
c00027b8:	00c00593          	li	a1,12
c00027bc:	01010113          	addi	sp,sp,16
c00027c0:	a99ff06f          	j	c0002258 <slob_free>
c00027c4:	860fe0ef          	jal	ra,c0000824 <intr_disable>
c00027c8:	0003c797          	auipc	a5,0x3c
c00027cc:	4247a783          	lw	a5,1060(a5) # c003ebec <bigblocks>
c00027d0:	02078863          	beqz	a5,c0002800 <kfree+0x130>
c00027d4:	0047a703          	lw	a4,4(a5)
c00027d8:	00e48663          	beq	s1,a4,c00027e4 <kfree+0x114>
c00027dc:	00100693          	li	a3,1
c00027e0:	f45ff06f          	j	c0002724 <kfree+0x54>
c00027e4:	0087a703          	lw	a4,8(a5)
c00027e8:	00078413          	mv	s0,a5
c00027ec:	0003c797          	auipc	a5,0x3c
c00027f0:	40078793          	addi	a5,a5,1024 # c003ebec <bigblocks>
c00027f4:	00e7a023          	sw	a4,0(a5)
c00027f8:	824fe0ef          	jal	ra,c000081c <intr_enable>
c00027fc:	f5dff06f          	j	c0002758 <kfree+0x88>
c0002800:	81cfe0ef          	jal	ra,c000081c <intr_enable>
c0002804:	f2dff06f          	j	c0002730 <kfree+0x60>
c0002808:	00008067          	ret
c000280c:	0087a703          	lw	a4,8(a5)
c0002810:	00078413          	mv	s0,a5
c0002814:	0003c797          	auipc	a5,0x3c
c0002818:	3d878793          	addi	a5,a5,984 # c003ebec <bigblocks>
c000281c:	00e7a023          	sw	a4,0(a5)
c0002820:	f39ff06f          	j	c0002758 <kfree+0x88>
c0002824:	00048693          	mv	a3,s1
c0002828:	0000a617          	auipc	a2,0xa
c000282c:	25860613          	addi	a2,a2,600 # c000ca80 <commands+0xce0>
c0002830:	06d00593          	li	a1,109
c0002834:	0000a517          	auipc	a0,0xa
c0002838:	fe050513          	addi	a0,a0,-32 # c000c814 <commands+0xa74>
c000283c:	a15fd0ef          	jal	ra,c0000250 <__panic>
c0002840:	0000a617          	auipc	a2,0xa
c0002844:	fb460613          	addi	a2,a2,-76 # c000c7f4 <commands+0xa54>
c0002848:	06100593          	li	a1,97
c000284c:	0000a517          	auipc	a0,0xa
c0002850:	fc850513          	addi	a0,a0,-56 # c000c814 <commands+0xa74>
c0002854:	9fdfd0ef          	jal	ra,c0000250 <__panic>

c0002858 <swap_init>:
c0002858:	fb010113          	addi	sp,sp,-80
c000285c:	04112623          	sw	ra,76(sp)
c0002860:	04812423          	sw	s0,72(sp)
c0002864:	04912223          	sw	s1,68(sp)
c0002868:	05212023          	sw	s2,64(sp)
c000286c:	03312e23          	sw	s3,60(sp)
c0002870:	03412c23          	sw	s4,56(sp)
c0002874:	03512a23          	sw	s5,52(sp)
c0002878:	03612823          	sw	s6,48(sp)
c000287c:	03712623          	sw	s7,44(sp)
c0002880:	03812423          	sw	s8,40(sp)
c0002884:	03912223          	sw	s9,36(sp)
c0002888:	03a12023          	sw	s10,32(sp)
c000288c:	01b12e23          	sw	s11,28(sp)
c0002890:	4b4030ef          	jal	ra,c0005d44 <swapfs_init>
c0002894:	0003c697          	auipc	a3,0x3c
c0002898:	4146a683          	lw	a3,1044(a3) # c003eca8 <max_swap_offset>
c000289c:	010007b7          	lui	a5,0x1000
c00028a0:	ff968713          	addi	a4,a3,-7
c00028a4:	ff878793          	addi	a5,a5,-8 # fffff8 <_binary_obj___user_matrix_out_size+0xffd7f0>
c00028a8:	5ee7e263          	bltu	a5,a4,c0002e8c <swap_init+0x634>
c00028ac:	00033797          	auipc	a5,0x33
c00028b0:	ec878793          	addi	a5,a5,-312 # c0035774 <swap_manager_fifo>
c00028b4:	0003c297          	auipc	t0,0x3c
c00028b8:	32f2ae23          	sw	a5,828(t0) # c003ebf0 <sm>
c00028bc:	00033797          	auipc	a5,0x33
c00028c0:	ebc7a783          	lw	a5,-324(a5) # c0035778 <swap_manager_fifo+0x4>
c00028c4:	000780e7          	jalr	a5
c00028c8:	00050a93          	mv	s5,a0
c00028cc:	04050263          	beqz	a0,c0002910 <swap_init+0xb8>
c00028d0:	04c12083          	lw	ra,76(sp)
c00028d4:	000a8513          	mv	a0,s5
c00028d8:	04812403          	lw	s0,72(sp)
c00028dc:	04412483          	lw	s1,68(sp)
c00028e0:	04012903          	lw	s2,64(sp)
c00028e4:	03c12983          	lw	s3,60(sp)
c00028e8:	03812a03          	lw	s4,56(sp)
c00028ec:	03412a83          	lw	s5,52(sp)
c00028f0:	03012b03          	lw	s6,48(sp)
c00028f4:	02c12b83          	lw	s7,44(sp)
c00028f8:	02812c03          	lw	s8,40(sp)
c00028fc:	02412c83          	lw	s9,36(sp)
c0002900:	02012d03          	lw	s10,32(sp)
c0002904:	01c12d83          	lw	s11,28(sp)
c0002908:	05010113          	addi	sp,sp,80
c000290c:	00008067          	ret
c0002910:	0003c797          	auipc	a5,0x3c
c0002914:	2e07a783          	lw	a5,736(a5) # c003ebf0 <sm>
c0002918:	0007a583          	lw	a1,0(a5)
c000291c:	0000a517          	auipc	a0,0xa
c0002920:	26850513          	addi	a0,a0,616 # c000cb84 <commands+0xde4>
c0002924:	00100793          	li	a5,1
c0002928:	0003c297          	auipc	t0,0x3c
c000292c:	2cf2a623          	sw	a5,716(t0) # c003ebf4 <swap_init_ok>
c0002930:	facfd0ef          	jal	ra,c00000dc <cprintf>
c0002934:	0003c417          	auipc	s0,0x3c
c0002938:	39c40413          	addi	s0,s0,924 # c003ecd0 <free_area>
c000293c:	0003c797          	auipc	a5,0x3c
c0002940:	3987a783          	lw	a5,920(a5) # c003ecd4 <free_area+0x4>
c0002944:	3e878463          	beq	a5,s0,c0002d2c <swap_init+0x4d4>
c0002948:	ff87a703          	lw	a4,-8(a5)
c000294c:	00175713          	srli	a4,a4,0x1
c0002950:	00177713          	andi	a4,a4,1
c0002954:	3e070463          	beqz	a4,c0002d3c <swap_init+0x4e4>
c0002958:	00000d93          	li	s11,0
c000295c:	00000d13          	li	s10,0
c0002960:	0100006f          	j	c0002970 <swap_init+0x118>
c0002964:	ff87a683          	lw	a3,-8(a5)
c0002968:	0026f693          	andi	a3,a3,2
c000296c:	3c068863          	beqz	a3,c0002d3c <swap_init+0x4e4>
c0002970:	ffc7a683          	lw	a3,-4(a5)
c0002974:	0047a783          	lw	a5,4(a5)
c0002978:	001d0d13          	addi	s10,s10,1
c000297c:	00dd8db3          	add	s11,s11,a3
c0002980:	000d8493          	mv	s1,s11
c0002984:	fe8790e3          	bne	a5,s0,c0002964 <swap_init+0x10c>
c0002988:	061010ef          	jal	ra,c00041e8 <nr_free_pages>
c000298c:	4ea49063          	bne	s1,a0,c0002e6c <swap_init+0x614>
c0002990:	000d8613          	mv	a2,s11
c0002994:	000d0593          	mv	a1,s10
c0002998:	0000a517          	auipc	a0,0xa
c000299c:	22c50513          	addi	a0,a0,556 # c000cbc4 <commands+0xe24>
c00029a0:	f3cfd0ef          	jal	ra,c00000dc <cprintf>
c00029a4:	f0cfe0ef          	jal	ra,c00010b0 <mm_create>
c00029a8:	00050a13          	mv	s4,a0
c00029ac:	46050063          	beqz	a0,c0002e0c <swap_init+0x5b4>
c00029b0:	0003c797          	auipc	a5,0x3c
c00029b4:	2787a783          	lw	a5,632(a5) # c003ec28 <check_mm_struct>
c00029b8:	48079a63          	bnez	a5,c0002e4c <swap_init+0x5f4>
c00029bc:	0003c997          	auipc	s3,0x3c
c00029c0:	23c9a983          	lw	s3,572(s3) # c003ebf8 <boot_pgdir>
c00029c4:	0009a783          	lw	a5,0(s3)
c00029c8:	0003c717          	auipc	a4,0x3c
c00029cc:	26070713          	addi	a4,a4,608 # c003ec28 <check_mm_struct>
c00029d0:	00a72023          	sw	a0,0(a4)
c00029d4:	01352623          	sw	s3,12(a0)
c00029d8:	64079663          	bnez	a5,c0003024 <swap_init+0x7cc>
c00029dc:	000065b7          	lui	a1,0x6
c00029e0:	00300613          	li	a2,3
c00029e4:	00001537          	lui	a0,0x1
c00029e8:	f2cfe0ef          	jal	ra,c0001114 <vma_create>
c00029ec:	00050593          	mv	a1,a0
c00029f0:	42050e63          	beqz	a0,c0002e2c <swap_init+0x5d4>
c00029f4:	000a0513          	mv	a0,s4
c00029f8:	fccfe0ef          	jal	ra,c00011c4 <insert_vma_struct>
c00029fc:	0000a517          	auipc	a0,0xa
c0002a00:	20850513          	addi	a0,a0,520 # c000cc04 <commands+0xe64>
c0002a04:	ed8fd0ef          	jal	ra,c00000dc <cprintf>
c0002a08:	00ca2503          	lw	a0,12(s4)
c0002a0c:	00100613          	li	a2,1
c0002a10:	000015b7          	lui	a1,0x1
c0002a14:	02d010ef          	jal	ra,c0004240 <get_pte>
c0002a18:	5e050663          	beqz	a0,c0003004 <swap_init+0x7ac>
c0002a1c:	0000a517          	auipc	a0,0xa
c0002a20:	23050513          	addi	a0,a0,560 # c000cc4c <commands+0xeac>
c0002a24:	0003c917          	auipc	s2,0x3c
c0002a28:	21090913          	addi	s2,s2,528 # c003ec34 <check_rp>
c0002a2c:	eb0fd0ef          	jal	ra,c00000dc <cprintf>
c0002a30:	0003cb17          	auipc	s6,0x3c
c0002a34:	214b0b13          	addi	s6,s6,532 # c003ec44 <swap_in_seq_no>
c0002a38:	00090b93          	mv	s7,s2
c0002a3c:	00100493          	li	s1,1
c0002a40:	00048513          	mv	a0,s1
c0002a44:	68c010ef          	jal	ra,c00040d0 <alloc_pages>
c0002a48:	00aba023          	sw	a0,0(s7)
c0002a4c:	38050063          	beqz	a0,c0002dcc <swap_init+0x574>
c0002a50:	00452783          	lw	a5,4(a0)
c0002a54:	0027f793          	andi	a5,a5,2
c0002a58:	34079a63          	bnez	a5,c0002dac <swap_init+0x554>
c0002a5c:	004b8b93          	addi	s7,s7,4
c0002a60:	ff6b90e3          	bne	s7,s6,c0002a40 <swap_init+0x1e8>
c0002a64:	0003c797          	auipc	a5,0x3c
c0002a68:	26c7a783          	lw	a5,620(a5) # c003ecd0 <free_area>
c0002a6c:	00f12423          	sw	a5,8(sp)
c0002a70:	0003c797          	auipc	a5,0x3c
c0002a74:	2687a783          	lw	a5,616(a5) # c003ecd8 <free_area+0x8>
c0002a78:	0003cc97          	auipc	s9,0x3c
c0002a7c:	25ccac83          	lw	s9,604(s9) # c003ecd4 <free_area+0x4>
c0002a80:	00f12623          	sw	a5,12(sp)
c0002a84:	00842223          	sw	s0,4(s0)
c0002a88:	00842023          	sw	s0,0(s0)
c0002a8c:	00042423          	sw	zero,8(s0)
c0002a90:	0003c497          	auipc	s1,0x3c
c0002a94:	1a448493          	addi	s1,s1,420 # c003ec34 <check_rp>
c0002a98:	00100b13          	li	s6,1
c0002a9c:	0004a503          	lw	a0,0(s1)
c0002aa0:	000b0593          	mv	a1,s6
c0002aa4:	00448493          	addi	s1,s1,4
c0002aa8:	6dc010ef          	jal	ra,c0004184 <free_pages>
c0002aac:	ff7498e3          	bne	s1,s7,c0002a9c <swap_init+0x244>
c0002ab0:	0003cb17          	auipc	s6,0x3c
c0002ab4:	228b2b03          	lw	s6,552(s6) # c003ecd8 <free_area+0x8>
c0002ab8:	00400793          	li	a5,4
c0002abc:	52fb1463          	bne	s6,a5,c0002fe4 <swap_init+0x78c>
c0002ac0:	0000a517          	auipc	a0,0xa
c0002ac4:	20450513          	addi	a0,a0,516 # c000ccc4 <commands+0xf24>
c0002ac8:	e14fd0ef          	jal	ra,c00000dc <cprintf>
c0002acc:	00001637          	lui	a2,0x1
c0002ad0:	0003c297          	auipc	t0,0x3c
c0002ad4:	1002ac23          	sw	zero,280(t0) # c003ebe8 <pgfault_num>
c0002ad8:	00a00593          	li	a1,10
c0002adc:	00b60023          	sb	a1,0(a2) # 1000 <_binary_obj___user_faultread_out_size-0xf68>
c0002ae0:	0003c797          	auipc	a5,0x3c
c0002ae4:	1087a783          	lw	a5,264(a5) # c003ebe8 <pgfault_num>
c0002ae8:	00100513          	li	a0,1
c0002aec:	4aa79c63          	bne	a5,a0,c0002fa4 <swap_init+0x74c>
c0002af0:	00b60823          	sb	a1,16(a2)
c0002af4:	0003c617          	auipc	a2,0x3c
c0002af8:	0f462603          	lw	a2,244(a2) # c003ebe8 <pgfault_num>
c0002afc:	4cf61463          	bne	a2,a5,c0002fc4 <swap_init+0x76c>
c0002b00:	00002637          	lui	a2,0x2
c0002b04:	00b00593          	li	a1,11
c0002b08:	00b60023          	sb	a1,0(a2) # 2000 <_binary_obj___user_softint_out_size+0x94>
c0002b0c:	0003c797          	auipc	a5,0x3c
c0002b10:	0dc7a783          	lw	a5,220(a5) # c003ebe8 <pgfault_num>
c0002b14:	00200513          	li	a0,2
c0002b18:	40a79663          	bne	a5,a0,c0002f24 <swap_init+0x6cc>
c0002b1c:	00b60823          	sb	a1,16(a2)
c0002b20:	0003c617          	auipc	a2,0x3c
c0002b24:	0c862603          	lw	a2,200(a2) # c003ebe8 <pgfault_num>
c0002b28:	40f61e63          	bne	a2,a5,c0002f44 <swap_init+0x6ec>
c0002b2c:	00003637          	lui	a2,0x3
c0002b30:	00c00593          	li	a1,12
c0002b34:	00b60023          	sb	a1,0(a2) # 3000 <_binary_obj___user_matrix_out_size+0x7f8>
c0002b38:	0003c797          	auipc	a5,0x3c
c0002b3c:	0b07a783          	lw	a5,176(a5) # c003ebe8 <pgfault_num>
c0002b40:	00300513          	li	a0,3
c0002b44:	42a79063          	bne	a5,a0,c0002f64 <swap_init+0x70c>
c0002b48:	00b60823          	sb	a1,16(a2)
c0002b4c:	0003c617          	auipc	a2,0x3c
c0002b50:	09c62603          	lw	a2,156(a2) # c003ebe8 <pgfault_num>
c0002b54:	42f61863          	bne	a2,a5,c0002f84 <swap_init+0x72c>
c0002b58:	00004637          	lui	a2,0x4
c0002b5c:	00d00593          	li	a1,13
c0002b60:	00b60023          	sb	a1,0(a2) # 4000 <_binary_obj___user_matrix_out_size+0x17f8>
c0002b64:	0003c797          	auipc	a5,0x3c
c0002b68:	0847a783          	lw	a5,132(a5) # c003ebe8 <pgfault_num>
c0002b6c:	33679c63          	bne	a5,s6,c0002ea4 <swap_init+0x64c>
c0002b70:	00b60823          	sb	a1,16(a2)
c0002b74:	0003c617          	auipc	a2,0x3c
c0002b78:	07462603          	lw	a2,116(a2) # c003ebe8 <pgfault_num>
c0002b7c:	34f61463          	bne	a2,a5,c0002ec4 <swap_init+0x66c>
c0002b80:	0003c897          	auipc	a7,0x3c
c0002b84:	1588a883          	lw	a7,344(a7) # c003ecd8 <free_area+0x8>
c0002b88:	0003c797          	auipc	a5,0x3c
c0002b8c:	0bc78793          	addi	a5,a5,188 # c003ec44 <swap_in_seq_no>
c0002b90:	0003c617          	auipc	a2,0x3c
c0002b94:	0dc60613          	addi	a2,a2,220 # c003ec6c <swap_out_seq_no>
c0002b98:	0003c517          	auipc	a0,0x3c
c0002b9c:	0d450513          	addi	a0,a0,212 # c003ec6c <swap_out_seq_no>
c0002ba0:	fff00593          	li	a1,-1
c0002ba4:	34089063          	bnez	a7,c0002ee4 <swap_init+0x68c>
c0002ba8:	00b7a023          	sw	a1,0(a5)
c0002bac:	00b62023          	sw	a1,0(a2)
c0002bb0:	00478793          	addi	a5,a5,4
c0002bb4:	00460613          	addi	a2,a2,4
c0002bb8:	fef518e3          	bne	a0,a5,c0002ba8 <swap_init+0x350>
c0002bbc:	00033797          	auipc	a5,0x33
c0002bc0:	bfc7a783          	lw	a5,-1028(a5) # c00357b8 <nbase>
c0002bc4:	00001bb7          	lui	s7,0x1
c0002bc8:	0003cb17          	auipc	s6,0x3c
c0002bcc:	0f8b0b13          	addi	s6,s6,248 # c003ecc0 <check_ptep>
c0002bd0:	0003cc17          	auipc	s8,0x3c
c0002bd4:	064c0c13          	addi	s8,s8,100 # c003ec34 <check_rp>
c0002bd8:	00f12223          	sw	a5,4(sp)
c0002bdc:	00000613          	li	a2,0
c0002be0:	000b8593          	mv	a1,s7
c0002be4:	00098513          	mv	a0,s3
c0002be8:	000b2023          	sw	zero,0(s6)
c0002bec:	654010ef          	jal	ra,c0004240 <get_pte>
c0002bf0:	00ab2023          	sw	a0,0(s6)
c0002bf4:	1e050c63          	beqz	a0,c0002dec <swap_init+0x594>
c0002bf8:	00052783          	lw	a5,0(a0)
c0002bfc:	0017f613          	andi	a2,a5,1
c0002c00:	16060e63          	beqz	a2,c0002d7c <swap_init+0x524>
c0002c04:	00279793          	slli	a5,a5,0x2
c0002c08:	00c7d793          	srli	a5,a5,0xc
c0002c0c:	0003c617          	auipc	a2,0x3c
c0002c10:	ff062603          	lw	a2,-16(a2) # c003ebfc <npage>
c0002c14:	18c7f063          	bleu	a2,a5,c0002d94 <swap_init+0x53c>
c0002c18:	00412703          	lw	a4,4(sp)
c0002c1c:	000c2583          	lw	a1,0(s8)
c0002c20:	0003c617          	auipc	a2,0x3c
c0002c24:	0c862603          	lw	a2,200(a2) # c003ece8 <pages>
c0002c28:	40e787b3          	sub	a5,a5,a4
c0002c2c:	00579793          	slli	a5,a5,0x5
c0002c30:	00f607b3          	add	a5,a2,a5
c0002c34:	12f59463          	bne	a1,a5,c0002d5c <swap_init+0x504>
c0002c38:	000017b7          	lui	a5,0x1
c0002c3c:	00fb8bb3          	add	s7,s7,a5
c0002c40:	000057b7          	lui	a5,0x5
c0002c44:	004b0b13          	addi	s6,s6,4
c0002c48:	004c0c13          	addi	s8,s8,4
c0002c4c:	f8fb98e3          	bne	s7,a5,c0002bdc <swap_init+0x384>
c0002c50:	0000a517          	auipc	a0,0xa
c0002c54:	14050513          	addi	a0,a0,320 # c000cd90 <commands+0xff0>
c0002c58:	c84fd0ef          	jal	ra,c00000dc <cprintf>
c0002c5c:	0003c797          	auipc	a5,0x3c
c0002c60:	f947a783          	lw	a5,-108(a5) # c003ebf0 <sm>
c0002c64:	01c7a783          	lw	a5,28(a5)
c0002c68:	00100b93          	li	s7,1
c0002c6c:	000780e7          	jalr	a5
c0002c70:	28051a63          	bnez	a0,c0002f04 <swap_init+0x6ac>
c0002c74:	00092503          	lw	a0,0(s2)
c0002c78:	000b8593          	mv	a1,s7
c0002c7c:	00490913          	addi	s2,s2,4
c0002c80:	504010ef          	jal	ra,c0004184 <free_pages>
c0002c84:	fe9918e3          	bne	s2,s1,c0002c74 <swap_init+0x41c>
c0002c88:	0009a783          	lw	a5,0(s3)
c0002c8c:	0003c617          	auipc	a2,0x3c
c0002c90:	f7062603          	lw	a2,-144(a2) # c003ebfc <npage>
c0002c94:	00279793          	slli	a5,a5,0x2
c0002c98:	00c7d793          	srli	a5,a5,0xc
c0002c9c:	0ec7fc63          	bleu	a2,a5,c0002d94 <swap_init+0x53c>
c0002ca0:	00412703          	lw	a4,4(sp)
c0002ca4:	0003c517          	auipc	a0,0x3c
c0002ca8:	04452503          	lw	a0,68(a0) # c003ece8 <pages>
c0002cac:	00100593          	li	a1,1
c0002cb0:	40e787b3          	sub	a5,a5,a4
c0002cb4:	00579793          	slli	a5,a5,0x5
c0002cb8:	00f50533          	add	a0,a0,a5
c0002cbc:	4c8010ef          	jal	ra,c0004184 <free_pages>
c0002cc0:	0009a023          	sw	zero,0(s3)
c0002cc4:	000a2623          	sw	zero,12(s4)
c0002cc8:	000a0513          	mv	a0,s4
c0002ccc:	df8fe0ef          	jal	ra,c00012c4 <mm_destroy>
c0002cd0:	0003c797          	auipc	a5,0x3c
c0002cd4:	f5878793          	addi	a5,a5,-168 # c003ec28 <check_mm_struct>
c0002cd8:	0007a023          	sw	zero,0(a5)
c0002cdc:	00c12783          	lw	a5,12(sp)
c0002ce0:	01942223          	sw	s9,4(s0)
c0002ce4:	00f42423          	sw	a5,8(s0)
c0002ce8:	00812783          	lw	a5,8(sp)
c0002cec:	00f42023          	sw	a5,0(s0)
c0002cf0:	008c8c63          	beq	s9,s0,c0002d08 <swap_init+0x4b0>
c0002cf4:	ffcca783          	lw	a5,-4(s9)
c0002cf8:	004cac83          	lw	s9,4(s9)
c0002cfc:	fffd0d13          	addi	s10,s10,-1
c0002d00:	40fd8db3          	sub	s11,s11,a5
c0002d04:	fe8c98e3          	bne	s9,s0,c0002cf4 <swap_init+0x49c>
c0002d08:	000d8613          	mv	a2,s11
c0002d0c:	000d0593          	mv	a1,s10
c0002d10:	0000a517          	auipc	a0,0xa
c0002d14:	0b050513          	addi	a0,a0,176 # c000cdc0 <commands+0x1020>
c0002d18:	bc4fd0ef          	jal	ra,c00000dc <cprintf>
c0002d1c:	0000a517          	auipc	a0,0xa
c0002d20:	0c050513          	addi	a0,a0,192 # c000cddc <commands+0x103c>
c0002d24:	bb8fd0ef          	jal	ra,c00000dc <cprintf>
c0002d28:	ba9ff06f          	j	c00028d0 <swap_init+0x78>
c0002d2c:	00000d93          	li	s11,0
c0002d30:	00000d13          	li	s10,0
c0002d34:	00000493          	li	s1,0
c0002d38:	c51ff06f          	j	c0002988 <swap_init+0x130>
c0002d3c:	0000a697          	auipc	a3,0xa
c0002d40:	e5c68693          	addi	a3,a3,-420 # c000cb98 <commands+0xdf8>
c0002d44:	00009617          	auipc	a2,0x9
c0002d48:	43460613          	addi	a2,a2,1076 # c000c178 <commands+0x3d8>
c0002d4c:	0c000593          	li	a1,192
c0002d50:	0000a517          	auipc	a0,0xa
c0002d54:	e2450513          	addi	a0,a0,-476 # c000cb74 <commands+0xdd4>
c0002d58:	cf8fd0ef          	jal	ra,c0000250 <__panic>
c0002d5c:	0000a697          	auipc	a3,0xa
c0002d60:	00c68693          	addi	a3,a3,12 # c000cd68 <commands+0xfc8>
c0002d64:	00009617          	auipc	a2,0x9
c0002d68:	41460613          	addi	a2,a2,1044 # c000c178 <commands+0x3d8>
c0002d6c:	10000593          	li	a1,256
c0002d70:	0000a517          	auipc	a0,0xa
c0002d74:	e0450513          	addi	a0,a0,-508 # c000cb74 <commands+0xdd4>
c0002d78:	cd8fd0ef          	jal	ra,c0000250 <__panic>
c0002d7c:	0000a617          	auipc	a2,0xa
c0002d80:	fc860613          	addi	a2,a2,-56 # c000cd44 <commands+0xfa4>
c0002d84:	07300593          	li	a1,115
c0002d88:	0000a517          	auipc	a0,0xa
c0002d8c:	a8c50513          	addi	a0,a0,-1396 # c000c814 <commands+0xa74>
c0002d90:	cc0fd0ef          	jal	ra,c0000250 <__panic>
c0002d94:	0000a617          	auipc	a2,0xa
c0002d98:	a6060613          	addi	a2,a2,-1440 # c000c7f4 <commands+0xa54>
c0002d9c:	06100593          	li	a1,97
c0002da0:	0000a517          	auipc	a0,0xa
c0002da4:	a7450513          	addi	a0,a0,-1420 # c000c814 <commands+0xa74>
c0002da8:	ca8fd0ef          	jal	ra,c0000250 <__panic>
c0002dac:	0000a697          	auipc	a3,0xa
c0002db0:	ed868693          	addi	a3,a3,-296 # c000cc84 <commands+0xee4>
c0002db4:	00009617          	auipc	a2,0x9
c0002db8:	3c460613          	addi	a2,a2,964 # c000c178 <commands+0x3d8>
c0002dbc:	0e100593          	li	a1,225
c0002dc0:	0000a517          	auipc	a0,0xa
c0002dc4:	db450513          	addi	a0,a0,-588 # c000cb74 <commands+0xdd4>
c0002dc8:	c88fd0ef          	jal	ra,c0000250 <__panic>
c0002dcc:	0000a697          	auipc	a3,0xa
c0002dd0:	ea468693          	addi	a3,a3,-348 # c000cc70 <commands+0xed0>
c0002dd4:	00009617          	auipc	a2,0x9
c0002dd8:	3a460613          	addi	a2,a2,932 # c000c178 <commands+0x3d8>
c0002ddc:	0e000593          	li	a1,224
c0002de0:	0000a517          	auipc	a0,0xa
c0002de4:	d9450513          	addi	a0,a0,-620 # c000cb74 <commands+0xdd4>
c0002de8:	c68fd0ef          	jal	ra,c0000250 <__panic>
c0002dec:	0000a697          	auipc	a3,0xa
c0002df0:	f4068693          	addi	a3,a3,-192 # c000cd2c <commands+0xf8c>
c0002df4:	00009617          	auipc	a2,0x9
c0002df8:	38460613          	addi	a2,a2,900 # c000c178 <commands+0x3d8>
c0002dfc:	0ff00593          	li	a1,255
c0002e00:	0000a517          	auipc	a0,0xa
c0002e04:	d7450513          	addi	a0,a0,-652 # c000cb74 <commands+0xdd4>
c0002e08:	c48fd0ef          	jal	ra,c0000250 <__panic>
c0002e0c:	0000a697          	auipc	a3,0xa
c0002e10:	83068693          	addi	a3,a3,-2000 # c000c63c <commands+0x89c>
c0002e14:	00009617          	auipc	a2,0x9
c0002e18:	36460613          	addi	a2,a2,868 # c000c178 <commands+0x3d8>
c0002e1c:	0c800593          	li	a1,200
c0002e20:	0000a517          	auipc	a0,0xa
c0002e24:	d5450513          	addi	a0,a0,-684 # c000cb74 <commands+0xdd4>
c0002e28:	c28fd0ef          	jal	ra,c0000250 <__panic>
c0002e2c:	0000a697          	auipc	a3,0xa
c0002e30:	a5468693          	addi	a3,a3,-1452 # c000c880 <commands+0xae0>
c0002e34:	00009617          	auipc	a2,0x9
c0002e38:	34460613          	addi	a2,a2,836 # c000c178 <commands+0x3d8>
c0002e3c:	0d300593          	li	a1,211
c0002e40:	0000a517          	auipc	a0,0xa
c0002e44:	d3450513          	addi	a0,a0,-716 # c000cb74 <commands+0xdd4>
c0002e48:	c08fd0ef          	jal	ra,c0000250 <__panic>
c0002e4c:	0000a697          	auipc	a3,0xa
c0002e50:	da068693          	addi	a3,a3,-608 # c000cbec <commands+0xe4c>
c0002e54:	00009617          	auipc	a2,0x9
c0002e58:	32460613          	addi	a2,a2,804 # c000c178 <commands+0x3d8>
c0002e5c:	0cb00593          	li	a1,203
c0002e60:	0000a517          	auipc	a0,0xa
c0002e64:	d1450513          	addi	a0,a0,-748 # c000cb74 <commands+0xdd4>
c0002e68:	be8fd0ef          	jal	ra,c0000250 <__panic>
c0002e6c:	0000a697          	auipc	a3,0xa
c0002e70:	d3c68693          	addi	a3,a3,-708 # c000cba8 <commands+0xe08>
c0002e74:	00009617          	auipc	a2,0x9
c0002e78:	30460613          	addi	a2,a2,772 # c000c178 <commands+0x3d8>
c0002e7c:	0c300593          	li	a1,195
c0002e80:	0000a517          	auipc	a0,0xa
c0002e84:	cf450513          	addi	a0,a0,-780 # c000cb74 <commands+0xdd4>
c0002e88:	bc8fd0ef          	jal	ra,c0000250 <__panic>
c0002e8c:	0000a617          	auipc	a2,0xa
c0002e90:	ccc60613          	addi	a2,a2,-820 # c000cb58 <commands+0xdb8>
c0002e94:	02c00593          	li	a1,44
c0002e98:	0000a517          	auipc	a0,0xa
c0002e9c:	cdc50513          	addi	a0,a0,-804 # c000cb74 <commands+0xdd4>
c0002ea0:	bb0fd0ef          	jal	ra,c0000250 <__panic>
c0002ea4:	0000a697          	auipc	a3,0xa
c0002ea8:	a1068693          	addi	a3,a3,-1520 # c000c8b4 <commands+0xb14>
c0002eac:	00009617          	auipc	a2,0x9
c0002eb0:	2cc60613          	addi	a2,a2,716 # c000c178 <commands+0x3d8>
c0002eb4:	0a300593          	li	a1,163
c0002eb8:	0000a517          	auipc	a0,0xa
c0002ebc:	cbc50513          	addi	a0,a0,-836 # c000cb74 <commands+0xdd4>
c0002ec0:	b90fd0ef          	jal	ra,c0000250 <__panic>
c0002ec4:	0000a697          	auipc	a3,0xa
c0002ec8:	9f068693          	addi	a3,a3,-1552 # c000c8b4 <commands+0xb14>
c0002ecc:	00009617          	auipc	a2,0x9
c0002ed0:	2ac60613          	addi	a2,a2,684 # c000c178 <commands+0x3d8>
c0002ed4:	0a500593          	li	a1,165
c0002ed8:	0000a517          	auipc	a0,0xa
c0002edc:	c9c50513          	addi	a0,a0,-868 # c000cb74 <commands+0xdd4>
c0002ee0:	b70fd0ef          	jal	ra,c0000250 <__panic>
c0002ee4:	0000a697          	auipc	a3,0xa
c0002ee8:	e3868693          	addi	a3,a3,-456 # c000cd1c <commands+0xf7c>
c0002eec:	00009617          	auipc	a2,0x9
c0002ef0:	28c60613          	addi	a2,a2,652 # c000c178 <commands+0x3d8>
c0002ef4:	0f700593          	li	a1,247
c0002ef8:	0000a517          	auipc	a0,0xa
c0002efc:	c7c50513          	addi	a0,a0,-900 # c000cb74 <commands+0xdd4>
c0002f00:	b50fd0ef          	jal	ra,c0000250 <__panic>
c0002f04:	0000a697          	auipc	a3,0xa
c0002f08:	eb468693          	addi	a3,a3,-332 # c000cdb8 <commands+0x1018>
c0002f0c:	00009617          	auipc	a2,0x9
c0002f10:	26c60613          	addi	a2,a2,620 # c000c178 <commands+0x3d8>
c0002f14:	10600593          	li	a1,262
c0002f18:	0000a517          	auipc	a0,0xa
c0002f1c:	c5c50513          	addi	a0,a0,-932 # c000cb74 <commands+0xdd4>
c0002f20:	b30fd0ef          	jal	ra,c0000250 <__panic>
c0002f24:	0000a697          	auipc	a3,0xa
c0002f28:	dd868693          	addi	a3,a3,-552 # c000ccfc <commands+0xf5c>
c0002f2c:	00009617          	auipc	a2,0x9
c0002f30:	24c60613          	addi	a2,a2,588 # c000c178 <commands+0x3d8>
c0002f34:	09b00593          	li	a1,155
c0002f38:	0000a517          	auipc	a0,0xa
c0002f3c:	c3c50513          	addi	a0,a0,-964 # c000cb74 <commands+0xdd4>
c0002f40:	b10fd0ef          	jal	ra,c0000250 <__panic>
c0002f44:	0000a697          	auipc	a3,0xa
c0002f48:	db868693          	addi	a3,a3,-584 # c000ccfc <commands+0xf5c>
c0002f4c:	00009617          	auipc	a2,0x9
c0002f50:	22c60613          	addi	a2,a2,556 # c000c178 <commands+0x3d8>
c0002f54:	09d00593          	li	a1,157
c0002f58:	0000a517          	auipc	a0,0xa
c0002f5c:	c1c50513          	addi	a0,a0,-996 # c000cb74 <commands+0xdd4>
c0002f60:	af0fd0ef          	jal	ra,c0000250 <__panic>
c0002f64:	0000a697          	auipc	a3,0xa
c0002f68:	da868693          	addi	a3,a3,-600 # c000cd0c <commands+0xf6c>
c0002f6c:	00009617          	auipc	a2,0x9
c0002f70:	20c60613          	addi	a2,a2,524 # c000c178 <commands+0x3d8>
c0002f74:	09f00593          	li	a1,159
c0002f78:	0000a517          	auipc	a0,0xa
c0002f7c:	bfc50513          	addi	a0,a0,-1028 # c000cb74 <commands+0xdd4>
c0002f80:	ad0fd0ef          	jal	ra,c0000250 <__panic>
c0002f84:	0000a697          	auipc	a3,0xa
c0002f88:	d8868693          	addi	a3,a3,-632 # c000cd0c <commands+0xf6c>
c0002f8c:	00009617          	auipc	a2,0x9
c0002f90:	1ec60613          	addi	a2,a2,492 # c000c178 <commands+0x3d8>
c0002f94:	0a100593          	li	a1,161
c0002f98:	0000a517          	auipc	a0,0xa
c0002f9c:	bdc50513          	addi	a0,a0,-1060 # c000cb74 <commands+0xdd4>
c0002fa0:	ab0fd0ef          	jal	ra,c0000250 <__panic>
c0002fa4:	0000a697          	auipc	a3,0xa
c0002fa8:	d4868693          	addi	a3,a3,-696 # c000ccec <commands+0xf4c>
c0002fac:	00009617          	auipc	a2,0x9
c0002fb0:	1cc60613          	addi	a2,a2,460 # c000c178 <commands+0x3d8>
c0002fb4:	09700593          	li	a1,151
c0002fb8:	0000a517          	auipc	a0,0xa
c0002fbc:	bbc50513          	addi	a0,a0,-1092 # c000cb74 <commands+0xdd4>
c0002fc0:	a90fd0ef          	jal	ra,c0000250 <__panic>
c0002fc4:	0000a697          	auipc	a3,0xa
c0002fc8:	d2868693          	addi	a3,a3,-728 # c000ccec <commands+0xf4c>
c0002fcc:	00009617          	auipc	a2,0x9
c0002fd0:	1ac60613          	addi	a2,a2,428 # c000c178 <commands+0x3d8>
c0002fd4:	09900593          	li	a1,153
c0002fd8:	0000a517          	auipc	a0,0xa
c0002fdc:	b9c50513          	addi	a0,a0,-1124 # c000cb74 <commands+0xdd4>
c0002fe0:	a70fd0ef          	jal	ra,c0000250 <__panic>
c0002fe4:	0000a697          	auipc	a3,0xa
c0002fe8:	cbc68693          	addi	a3,a3,-836 # c000cca0 <commands+0xf00>
c0002fec:	00009617          	auipc	a2,0x9
c0002ff0:	18c60613          	addi	a2,a2,396 # c000c178 <commands+0x3d8>
c0002ff4:	0ee00593          	li	a1,238
c0002ff8:	0000a517          	auipc	a0,0xa
c0002ffc:	b7c50513          	addi	a0,a0,-1156 # c000cb74 <commands+0xdd4>
c0003000:	a50fd0ef          	jal	ra,c0000250 <__panic>
c0003004:	0000a697          	auipc	a3,0xa
c0003008:	c3468693          	addi	a3,a3,-972 # c000cc38 <commands+0xe98>
c000300c:	00009617          	auipc	a2,0x9
c0003010:	16c60613          	addi	a2,a2,364 # c000c178 <commands+0x3d8>
c0003014:	0db00593          	li	a1,219
c0003018:	0000a517          	auipc	a0,0xa
c000301c:	b5c50513          	addi	a0,a0,-1188 # c000cb74 <commands+0xdd4>
c0003020:	a30fd0ef          	jal	ra,c0000250 <__panic>
c0003024:	00009697          	auipc	a3,0x9
c0003028:	79868693          	addi	a3,a3,1944 # c000c7bc <commands+0xa1c>
c000302c:	00009617          	auipc	a2,0x9
c0003030:	14c60613          	addi	a2,a2,332 # c000c178 <commands+0x3d8>
c0003034:	0d000593          	li	a1,208
c0003038:	0000a517          	auipc	a0,0xa
c000303c:	b3c50513          	addi	a0,a0,-1220 # c000cb74 <commands+0xdd4>
c0003040:	a10fd0ef          	jal	ra,c0000250 <__panic>

c0003044 <swap_init_mm>:
c0003044:	0003c797          	auipc	a5,0x3c
c0003048:	bac7a783          	lw	a5,-1108(a5) # c003ebf0 <sm>
c000304c:	0087a303          	lw	t1,8(a5)
c0003050:	00030067          	jr	t1

c0003054 <swap_map_swappable>:
c0003054:	0003c797          	auipc	a5,0x3c
c0003058:	b9c7a783          	lw	a5,-1124(a5) # c003ebf0 <sm>
c000305c:	0107a303          	lw	t1,16(a5)
c0003060:	00030067          	jr	t1

c0003064 <swap_out>:
c0003064:	fc010113          	addi	sp,sp,-64
c0003068:	03312623          	sw	s3,44(sp)
c000306c:	02112e23          	sw	ra,60(sp)
c0003070:	02812c23          	sw	s0,56(sp)
c0003074:	02912a23          	sw	s1,52(sp)
c0003078:	03212823          	sw	s2,48(sp)
c000307c:	03412423          	sw	s4,40(sp)
c0003080:	03512223          	sw	s5,36(sp)
c0003084:	03612023          	sw	s6,32(sp)
c0003088:	01712e23          	sw	s7,28(sp)
c000308c:	01812c23          	sw	s8,24(sp)
c0003090:	00058993          	mv	s3,a1
c0003094:	10058863          	beqz	a1,c00031a4 <swap_out+0x140>
c0003098:	00050913          	mv	s2,a0
c000309c:	00060a13          	mv	s4,a2
c00030a0:	00000413          	li	s0,0
c00030a4:	0000ab97          	auipc	s7,0xa
c00030a8:	db4b8b93          	addi	s7,s7,-588 # c000ce58 <commands+0x10b8>
c00030ac:	00100b13          	li	s6,1
c00030b0:	0000aa97          	auipc	s5,0xa
c00030b4:	d90a8a93          	addi	s5,s5,-624 # c000ce40 <commands+0x10a0>
c00030b8:	0340006f          	j	c00030ec <swap_out+0x88>
c00030bc:	000a8513          	mv	a0,s5
c00030c0:	81cfd0ef          	jal	ra,c00000dc <cprintf>
c00030c4:	0003c797          	auipc	a5,0x3c
c00030c8:	b2c7a783          	lw	a5,-1236(a5) # c003ebf0 <sm>
c00030cc:	0107a783          	lw	a5,16(a5)
c00030d0:	00c12603          	lw	a2,12(sp)
c00030d4:	00000693          	li	a3,0
c00030d8:	00048593          	mv	a1,s1
c00030dc:	00090513          	mv	a0,s2
c00030e0:	00140413          	addi	s0,s0,1
c00030e4:	000780e7          	jalr	a5
c00030e8:	0a898e63          	beq	s3,s0,c00031a4 <swap_out+0x140>
c00030ec:	0003c797          	auipc	a5,0x3c
c00030f0:	b047a783          	lw	a5,-1276(a5) # c003ebf0 <sm>
c00030f4:	0187a783          	lw	a5,24(a5)
c00030f8:	000a0613          	mv	a2,s4
c00030fc:	00c10593          	addi	a1,sp,12
c0003100:	00090513          	mv	a0,s2
c0003104:	000780e7          	jalr	a5
c0003108:	0c051863          	bnez	a0,c00031d8 <swap_out+0x174>
c000310c:	00c12783          	lw	a5,12(sp)
c0003110:	00c92503          	lw	a0,12(s2)
c0003114:	00000613          	li	a2,0
c0003118:	01c7a483          	lw	s1,28(a5)
c000311c:	00048593          	mv	a1,s1
c0003120:	120010ef          	jal	ra,c0004240 <get_pte>
c0003124:	00052783          	lw	a5,0(a0)
c0003128:	00050c13          	mv	s8,a0
c000312c:	0017f793          	andi	a5,a5,1
c0003130:	0c078063          	beqz	a5,c00031f0 <swap_out+0x18c>
c0003134:	00c12583          	lw	a1,12(sp)
c0003138:	01c5a503          	lw	a0,28(a1) # 101c <_binary_obj___user_faultread_out_size-0xf4c>
c000313c:	00c55513          	srli	a0,a0,0xc
c0003140:	00150513          	addi	a0,a0,1
c0003144:	00851513          	slli	a0,a0,0x8
c0003148:	4f9020ef          	jal	ra,c0005e40 <swapfs_write>
c000314c:	f60518e3          	bnez	a0,c00030bc <swap_out+0x58>
c0003150:	00c12783          	lw	a5,12(sp)
c0003154:	00048613          	mv	a2,s1
c0003158:	00040593          	mv	a1,s0
c000315c:	01c7a683          	lw	a3,28(a5)
c0003160:	000b8513          	mv	a0,s7
c0003164:	00140413          	addi	s0,s0,1
c0003168:	00c6d693          	srli	a3,a3,0xc
c000316c:	00168693          	addi	a3,a3,1
c0003170:	f6dfc0ef          	jal	ra,c00000dc <cprintf>
c0003174:	00c12503          	lw	a0,12(sp)
c0003178:	000b0593          	mv	a1,s6
c000317c:	01c52783          	lw	a5,28(a0)
c0003180:	00c7d793          	srli	a5,a5,0xc
c0003184:	00178793          	addi	a5,a5,1
c0003188:	00879793          	slli	a5,a5,0x8
c000318c:	00fc2023          	sw	a5,0(s8)
c0003190:	7f5000ef          	jal	ra,c0004184 <free_pages>
c0003194:	00c92503          	lw	a0,12(s2)
c0003198:	00048593          	mv	a1,s1
c000319c:	2c1010ef          	jal	ra,c0004c5c <tlb_invalidate>
c00031a0:	f48996e3          	bne	s3,s0,c00030ec <swap_out+0x88>
c00031a4:	03c12083          	lw	ra,60(sp)
c00031a8:	00098513          	mv	a0,s3
c00031ac:	03812403          	lw	s0,56(sp)
c00031b0:	03412483          	lw	s1,52(sp)
c00031b4:	03012903          	lw	s2,48(sp)
c00031b8:	02c12983          	lw	s3,44(sp)
c00031bc:	02812a03          	lw	s4,40(sp)
c00031c0:	02412a83          	lw	s5,36(sp)
c00031c4:	02012b03          	lw	s6,32(sp)
c00031c8:	01c12b83          	lw	s7,28(sp)
c00031cc:	01812c03          	lw	s8,24(sp)
c00031d0:	04010113          	addi	sp,sp,64
c00031d4:	00008067          	ret
c00031d8:	00040593          	mv	a1,s0
c00031dc:	0000a517          	auipc	a0,0xa
c00031e0:	c1c50513          	addi	a0,a0,-996 # c000cdf8 <commands+0x1058>
c00031e4:	ef9fc0ef          	jal	ra,c00000dc <cprintf>
c00031e8:	00040993          	mv	s3,s0
c00031ec:	fb9ff06f          	j	c00031a4 <swap_out+0x140>
c00031f0:	0000a697          	auipc	a3,0xa
c00031f4:	c3868693          	addi	a3,a3,-968 # c000ce28 <commands+0x1088>
c00031f8:	00009617          	auipc	a2,0x9
c00031fc:	f8060613          	addi	a2,a2,-128 # c000c178 <commands+0x3d8>
c0003200:	06c00593          	li	a1,108
c0003204:	0000a517          	auipc	a0,0xa
c0003208:	97050513          	addi	a0,a0,-1680 # c000cb74 <commands+0xdd4>
c000320c:	844fd0ef          	jal	ra,c0000250 <__panic>

c0003210 <swap_in>:
c0003210:	fe010113          	addi	sp,sp,-32
c0003214:	01212823          	sw	s2,16(sp)
c0003218:	00050913          	mv	s2,a0
c000321c:	00100513          	li	a0,1
c0003220:	00912a23          	sw	s1,20(sp)
c0003224:	01312623          	sw	s3,12(sp)
c0003228:	00112e23          	sw	ra,28(sp)
c000322c:	00812c23          	sw	s0,24(sp)
c0003230:	00058493          	mv	s1,a1
c0003234:	00060993          	mv	s3,a2
c0003238:	699000ef          	jal	ra,c00040d0 <alloc_pages>
c000323c:	06050263          	beqz	a0,c00032a0 <swap_in+0x90>
c0003240:	00050413          	mv	s0,a0
c0003244:	00c92503          	lw	a0,12(s2)
c0003248:	00000613          	li	a2,0
c000324c:	00048593          	mv	a1,s1
c0003250:	7f1000ef          	jal	ra,c0004240 <get_pte>
c0003254:	00050913          	mv	s2,a0
c0003258:	00052503          	lw	a0,0(a0)
c000325c:	00040593          	mv	a1,s0
c0003260:	331020ef          	jal	ra,c0005d90 <swapfs_read>
c0003264:	00092583          	lw	a1,0(s2)
c0003268:	00048613          	mv	a2,s1
c000326c:	0000a517          	auipc	a0,0xa
c0003270:	8ac50513          	addi	a0,a0,-1876 # c000cb18 <commands+0xd78>
c0003274:	0085d593          	srli	a1,a1,0x8
c0003278:	e65fc0ef          	jal	ra,c00000dc <cprintf>
c000327c:	01c12083          	lw	ra,28(sp)
c0003280:	0089a023          	sw	s0,0(s3)
c0003284:	00000513          	li	a0,0
c0003288:	01812403          	lw	s0,24(sp)
c000328c:	01412483          	lw	s1,20(sp)
c0003290:	01012903          	lw	s2,16(sp)
c0003294:	00c12983          	lw	s3,12(sp)
c0003298:	02010113          	addi	sp,sp,32
c000329c:	00008067          	ret
c00032a0:	0000a697          	auipc	a3,0xa
c00032a4:	86868693          	addi	a3,a3,-1944 # c000cb08 <commands+0xd68>
c00032a8:	00009617          	auipc	a2,0x9
c00032ac:	ed060613          	addi	a2,a2,-304 # c000c178 <commands+0x3d8>
c00032b0:	08200593          	li	a1,130
c00032b4:	0000a517          	auipc	a0,0xa
c00032b8:	8c050513          	addi	a0,a0,-1856 # c000cb74 <commands+0xdd4>
c00032bc:	f95fc0ef          	jal	ra,c0000250 <__panic>

c00032c0 <default_init>:
c00032c0:	0003c797          	auipc	a5,0x3c
c00032c4:	a1078793          	addi	a5,a5,-1520 # c003ecd0 <free_area>
c00032c8:	00f7a223          	sw	a5,4(a5)
c00032cc:	00f7a023          	sw	a5,0(a5)
c00032d0:	0007a423          	sw	zero,8(a5)
c00032d4:	00008067          	ret

c00032d8 <default_nr_free_pages>:
c00032d8:	0003c517          	auipc	a0,0x3c
c00032dc:	a0052503          	lw	a0,-1536(a0) # c003ecd8 <free_area+0x8>
c00032e0:	00008067          	ret

c00032e4 <default_free_pages>:
c00032e4:	ff010113          	addi	sp,sp,-16
c00032e8:	00112623          	sw	ra,12(sp)
c00032ec:	1e058e63          	beqz	a1,c00034e8 <default_free_pages+0x204>
c00032f0:	00559693          	slli	a3,a1,0x5
c00032f4:	00d506b3          	add	a3,a0,a3
c00032f8:	04d50863          	beq	a0,a3,c0003348 <default_free_pages+0x64>
c00032fc:	00452783          	lw	a5,4(a0)
c0003300:	0017f793          	andi	a5,a5,1
c0003304:	1c079263          	bnez	a5,c00034c8 <default_free_pages+0x1e4>
c0003308:	00452783          	lw	a5,4(a0)
c000330c:	0017d793          	srli	a5,a5,0x1
c0003310:	0017f793          	andi	a5,a5,1
c0003314:	1a079a63          	bnez	a5,c00034c8 <default_free_pages+0x1e4>
c0003318:	00050793          	mv	a5,a0
c000331c:	01c0006f          	j	c0003338 <default_free_pages+0x54>
c0003320:	0047a703          	lw	a4,4(a5)
c0003324:	00177713          	andi	a4,a4,1
c0003328:	1a071063          	bnez	a4,c00034c8 <default_free_pages+0x1e4>
c000332c:	0047a703          	lw	a4,4(a5)
c0003330:	00277713          	andi	a4,a4,2
c0003334:	18071a63          	bnez	a4,c00034c8 <default_free_pages+0x1e4>
c0003338:	0007a223          	sw	zero,4(a5)
c000333c:	0007a023          	sw	zero,0(a5)
c0003340:	02078793          	addi	a5,a5,32
c0003344:	fcd79ee3          	bne	a5,a3,c0003320 <default_free_pages+0x3c>
c0003348:	00b52423          	sw	a1,8(a0)
c000334c:	00450313          	addi	t1,a0,4
c0003350:	00200793          	li	a5,2
c0003354:	40f3202f          	amoor.w	zero,a5,(t1)
c0003358:	0003c797          	auipc	a5,0x3c
c000335c:	9807a783          	lw	a5,-1664(a5) # c003ecd8 <free_area+0x8>
c0003360:	00b785b3          	add	a1,a5,a1
c0003364:	0003c697          	auipc	a3,0x3c
c0003368:	96c68693          	addi	a3,a3,-1684 # c003ecd0 <free_area>
c000336c:	00b6a423          	sw	a1,8(a3)
c0003370:	0003c797          	auipc	a5,0x3c
c0003374:	9647a783          	lw	a5,-1692(a5) # c003ecd4 <free_area+0x4>
c0003378:	12d78863          	beq	a5,a3,c00034a8 <default_free_pages+0x1c4>
c000337c:	0003c597          	auipc	a1,0x3c
c0003380:	9545a583          	lw	a1,-1708(a1) # c003ecd0 <free_area>
c0003384:	00000813          	li	a6,0
c0003388:	00c50613          	addi	a2,a0,12
c000338c:	00100893          	li	a7,1
c0003390:	0080006f          	j	c0003398 <default_free_pages+0xb4>
c0003394:	00070793          	mv	a5,a4
c0003398:	ff478713          	addi	a4,a5,-12
c000339c:	02e56863          	bltu	a0,a4,c00033cc <default_free_pages+0xe8>
c00033a0:	0047a703          	lw	a4,4(a5)
c00033a4:	fed718e3          	bne	a4,a3,c0003394 <default_free_pages+0xb0>
c00033a8:	00c7a223          	sw	a2,4(a5)
c00033ac:	00d52823          	sw	a3,16(a0)
c00033b0:	00f52623          	sw	a5,12(a0)
c00033b4:	0047a783          	lw	a5,4(a5)
c00033b8:	00060593          	mv	a1,a2
c00033bc:	06d78863          	beq	a5,a3,c000342c <default_free_pages+0x148>
c00033c0:	ff478713          	addi	a4,a5,-12
c00033c4:	00088813          	mv	a6,a7
c00033c8:	fce57ce3          	bleu	a4,a0,c00033a0 <default_free_pages+0xbc>
c00033cc:	12081e63          	bnez	a6,c0003508 <default_free_pages+0x224>
c00033d0:	0007a583          	lw	a1,0(a5)
c00033d4:	00c7a023          	sw	a2,0(a5)
c00033d8:	00c5a223          	sw	a2,4(a1)
c00033dc:	00f52823          	sw	a5,16(a0)
c00033e0:	00b52623          	sw	a1,12(a0)
c00033e4:	06d58a63          	beq	a1,a3,c0003458 <default_free_pages+0x174>
c00033e8:	ffc5a603          	lw	a2,-4(a1)
c00033ec:	ff458713          	addi	a4,a1,-12
c00033f0:	00561793          	slli	a5,a2,0x5
c00033f4:	00f707b3          	add	a5,a4,a5
c00033f8:	04f51a63          	bne	a0,a5,c000344c <default_free_pages+0x168>
c00033fc:	00852783          	lw	a5,8(a0)
c0003400:	00c78633          	add	a2,a5,a2
c0003404:	fec5ae23          	sw	a2,-4(a1)
c0003408:	ffd00793          	li	a5,-3
c000340c:	60f3202f          	amoand.w	zero,a5,(t1)
c0003410:	00c52803          	lw	a6,12(a0)
c0003414:	01052603          	lw	a2,16(a0)
c0003418:	00070513          	mv	a0,a4
c000341c:	00c82223          	sw	a2,4(a6) # fffff004 <sbi_remote_fence_i+0xfffff714>
c0003420:	0045a783          	lw	a5,4(a1)
c0003424:	01062023          	sw	a6,0(a2)
c0003428:	0280006f          	j	c0003450 <default_free_pages+0x16c>
c000342c:	00c52583          	lw	a1,12(a0)
c0003430:	00c7a023          	sw	a2,0(a5)
c0003434:	00f58e63          	beq	a1,a5,c0003450 <default_free_pages+0x16c>
c0003438:	ffc5a603          	lw	a2,-4(a1)
c000343c:	ff458713          	addi	a4,a1,-12
c0003440:	00561793          	slli	a5,a2,0x5
c0003444:	00f707b3          	add	a5,a4,a5
c0003448:	faf50ae3          	beq	a0,a5,c00033fc <default_free_pages+0x118>
c000344c:	01052783          	lw	a5,16(a0)
c0003450:	ff478713          	addi	a4,a5,-12
c0003454:	00d78a63          	beq	a5,a3,c0003468 <default_free_pages+0x184>
c0003458:	00852603          	lw	a2,8(a0)
c000345c:	00561693          	slli	a3,a2,0x5
c0003460:	00d506b3          	add	a3,a0,a3
c0003464:	00d70863          	beq	a4,a3,c0003474 <default_free_pages+0x190>
c0003468:	00c12083          	lw	ra,12(sp)
c000346c:	01010113          	addi	sp,sp,16
c0003470:	00008067          	ret
c0003474:	ffc7a703          	lw	a4,-4(a5)
c0003478:	ff878693          	addi	a3,a5,-8
c000347c:	00c70633          	add	a2,a4,a2
c0003480:	00c52423          	sw	a2,8(a0)
c0003484:	ffd00713          	li	a4,-3
c0003488:	60e6a02f          	amoand.w	zero,a4,(a3)
c000348c:	0007a703          	lw	a4,0(a5)
c0003490:	0047a783          	lw	a5,4(a5)
c0003494:	00c12083          	lw	ra,12(sp)
c0003498:	01010113          	addi	sp,sp,16
c000349c:	00f72223          	sw	a5,4(a4)
c00034a0:	00e7a023          	sw	a4,0(a5)
c00034a4:	00008067          	ret
c00034a8:	00c12083          	lw	ra,12(sp)
c00034ac:	00c50713          	addi	a4,a0,12
c00034b0:	00e7a023          	sw	a4,0(a5)
c00034b4:	00e7a223          	sw	a4,4(a5)
c00034b8:	00f52823          	sw	a5,16(a0)
c00034bc:	00f52623          	sw	a5,12(a0)
c00034c0:	01010113          	addi	sp,sp,16
c00034c4:	00008067          	ret
c00034c8:	0000a697          	auipc	a3,0xa
c00034cc:	c9c68693          	addi	a3,a3,-868 # c000d164 <commands+0x13c4>
c00034d0:	00009617          	auipc	a2,0x9
c00034d4:	ca860613          	addi	a2,a2,-856 # c000c178 <commands+0x3d8>
c00034d8:	08300593          	li	a1,131
c00034dc:	0000a517          	auipc	a0,0xa
c00034e0:	cb050513          	addi	a0,a0,-848 # c000d18c <commands+0x13ec>
c00034e4:	d6dfc0ef          	jal	ra,c0000250 <__panic>
c00034e8:	0000a697          	auipc	a3,0xa
c00034ec:	cbc68693          	addi	a3,a3,-836 # c000d1a4 <commands+0x1404>
c00034f0:	00009617          	auipc	a2,0x9
c00034f4:	c8860613          	addi	a2,a2,-888 # c000c178 <commands+0x3d8>
c00034f8:	08000593          	li	a1,128
c00034fc:	0000a517          	auipc	a0,0xa
c0003500:	c9050513          	addi	a0,a0,-880 # c000d18c <commands+0x13ec>
c0003504:	d4dfc0ef          	jal	ra,c0000250 <__panic>
c0003508:	00b6a023          	sw	a1,0(a3)
c000350c:	ec5ff06f          	j	c00033d0 <default_free_pages+0xec>

c0003510 <default_init_memmap>:
c0003510:	ff010113          	addi	sp,sp,-16
c0003514:	00112623          	sw	ra,12(sp)
c0003518:	12058e63          	beqz	a1,c0003654 <default_init_memmap+0x144>
c000351c:	00559693          	slli	a3,a1,0x5
c0003520:	00d506b3          	add	a3,a0,a3
c0003524:	02d50c63          	beq	a0,a3,c000355c <default_init_memmap+0x4c>
c0003528:	00452703          	lw	a4,4(a0)
c000352c:	00050793          	mv	a5,a0
c0003530:	00177713          	andi	a4,a4,1
c0003534:	00071a63          	bnez	a4,c0003548 <default_init_memmap+0x38>
c0003538:	0fc0006f          	j	c0003634 <default_init_memmap+0x124>
c000353c:	0047a703          	lw	a4,4(a5)
c0003540:	00177713          	andi	a4,a4,1
c0003544:	0e070863          	beqz	a4,c0003634 <default_init_memmap+0x124>
c0003548:	0007a423          	sw	zero,8(a5)
c000354c:	0007a223          	sw	zero,4(a5)
c0003550:	0007a023          	sw	zero,0(a5)
c0003554:	02078793          	addi	a5,a5,32
c0003558:	fed792e3          	bne	a5,a3,c000353c <default_init_memmap+0x2c>
c000355c:	00b52423          	sw	a1,8(a0)
c0003560:	00200793          	li	a5,2
c0003564:	00450713          	addi	a4,a0,4
c0003568:	40f7202f          	amoor.w	zero,a5,(a4)
c000356c:	0003b797          	auipc	a5,0x3b
c0003570:	76c7a783          	lw	a5,1900(a5) # c003ecd8 <free_area+0x8>
c0003574:	00b785b3          	add	a1,a5,a1
c0003578:	0003b697          	auipc	a3,0x3b
c000357c:	75868693          	addi	a3,a3,1880 # c003ecd0 <free_area>
c0003580:	00b6a423          	sw	a1,8(a3)
c0003584:	0003b797          	auipc	a5,0x3b
c0003588:	7507a783          	lw	a5,1872(a5) # c003ecd4 <free_area+0x4>
c000358c:	08d78463          	beq	a5,a3,c0003614 <default_init_memmap+0x104>
c0003590:	0003b597          	auipc	a1,0x3b
c0003594:	7405a583          	lw	a1,1856(a1) # c003ecd0 <free_area>
c0003598:	00000813          	li	a6,0
c000359c:	00c50613          	addi	a2,a0,12
c00035a0:	00100893          	li	a7,1
c00035a4:	0080006f          	j	c00035ac <default_init_memmap+0x9c>
c00035a8:	00070793          	mv	a5,a4
c00035ac:	ff478713          	addi	a4,a5,-12
c00035b0:	02e56863          	bltu	a0,a4,c00035e0 <default_init_memmap+0xd0>
c00035b4:	0047a703          	lw	a4,4(a5)
c00035b8:	fed718e3          	bne	a4,a3,c00035a8 <default_init_memmap+0x98>
c00035bc:	00c7a223          	sw	a2,4(a5)
c00035c0:	00d52823          	sw	a3,16(a0)
c00035c4:	00f52623          	sw	a5,12(a0)
c00035c8:	0047a783          	lw	a5,4(a5)
c00035cc:	00060593          	mv	a1,a2
c00035d0:	02d78a63          	beq	a5,a3,c0003604 <default_init_memmap+0xf4>
c00035d4:	ff478713          	addi	a4,a5,-12
c00035d8:	00088813          	mv	a6,a7
c00035dc:	fce57ce3          	bleu	a4,a0,c00035b4 <default_init_memmap+0xa4>
c00035e0:	08081a63          	bnez	a6,c0003674 <default_init_memmap+0x164>
c00035e4:	0007a703          	lw	a4,0(a5)
c00035e8:	00c12083          	lw	ra,12(sp)
c00035ec:	00c7a023          	sw	a2,0(a5)
c00035f0:	00c72223          	sw	a2,4(a4)
c00035f4:	00f52823          	sw	a5,16(a0)
c00035f8:	00e52623          	sw	a4,12(a0)
c00035fc:	01010113          	addi	sp,sp,16
c0003600:	00008067          	ret
c0003604:	00c12083          	lw	ra,12(sp)
c0003608:	00c7a023          	sw	a2,0(a5)
c000360c:	01010113          	addi	sp,sp,16
c0003610:	00008067          	ret
c0003614:	00c12083          	lw	ra,12(sp)
c0003618:	00c50713          	addi	a4,a0,12
c000361c:	00e7a023          	sw	a4,0(a5)
c0003620:	00e7a223          	sw	a4,4(a5)
c0003624:	00f52823          	sw	a5,16(a0)
c0003628:	00f52623          	sw	a5,12(a0)
c000362c:	01010113          	addi	sp,sp,16
c0003630:	00008067          	ret
c0003634:	0000a697          	auipc	a3,0xa
c0003638:	b7868693          	addi	a3,a3,-1160 # c000d1ac <commands+0x140c>
c000363c:	00009617          	auipc	a2,0x9
c0003640:	b3c60613          	addi	a2,a2,-1220 # c000c178 <commands+0x3d8>
c0003644:	04900593          	li	a1,73
c0003648:	0000a517          	auipc	a0,0xa
c000364c:	b4450513          	addi	a0,a0,-1212 # c000d18c <commands+0x13ec>
c0003650:	c01fc0ef          	jal	ra,c0000250 <__panic>
c0003654:	0000a697          	auipc	a3,0xa
c0003658:	b5068693          	addi	a3,a3,-1200 # c000d1a4 <commands+0x1404>
c000365c:	00009617          	auipc	a2,0x9
c0003660:	b1c60613          	addi	a2,a2,-1252 # c000c178 <commands+0x3d8>
c0003664:	04600593          	li	a1,70
c0003668:	0000a517          	auipc	a0,0xa
c000366c:	b2450513          	addi	a0,a0,-1244 # c000d18c <commands+0x13ec>
c0003670:	be1fc0ef          	jal	ra,c0000250 <__panic>
c0003674:	00b6a023          	sw	a1,0(a3)
c0003678:	f6dff06f          	j	c00035e4 <default_init_memmap+0xd4>

c000367c <default_check>:
c000367c:	fd010113          	addi	sp,sp,-48
c0003680:	03212023          	sw	s2,32(sp)
c0003684:	02112623          	sw	ra,44(sp)
c0003688:	02812423          	sw	s0,40(sp)
c000368c:	02912223          	sw	s1,36(sp)
c0003690:	01312e23          	sw	s3,28(sp)
c0003694:	01412c23          	sw	s4,24(sp)
c0003698:	01512a23          	sw	s5,20(sp)
c000369c:	01612823          	sw	s6,16(sp)
c00036a0:	01712623          	sw	s7,12(sp)
c00036a4:	01812423          	sw	s8,8(sp)
c00036a8:	01912223          	sw	s9,4(sp)
c00036ac:	0003b917          	auipc	s2,0x3b
c00036b0:	62490913          	addi	s2,s2,1572 # c003ecd0 <free_area>
c00036b4:	0003b797          	auipc	a5,0x3b
c00036b8:	6207a783          	lw	a5,1568(a5) # c003ecd4 <free_area+0x4>
c00036bc:	3d278663          	beq	a5,s2,c0003a88 <default_check+0x40c>
c00036c0:	ff87a703          	lw	a4,-8(a5)
c00036c4:	00175713          	srli	a4,a4,0x1
c00036c8:	00177713          	andi	a4,a4,1
c00036cc:	3c070663          	beqz	a4,c0003a98 <default_check+0x41c>
c00036d0:	00000413          	li	s0,0
c00036d4:	00000493          	li	s1,0
c00036d8:	0100006f          	j	c00036e8 <default_check+0x6c>
c00036dc:	ff87a703          	lw	a4,-8(a5)
c00036e0:	00277713          	andi	a4,a4,2
c00036e4:	3a070a63          	beqz	a4,c0003a98 <default_check+0x41c>
c00036e8:	ffc7a703          	lw	a4,-4(a5)
c00036ec:	0047a783          	lw	a5,4(a5)
c00036f0:	00148493          	addi	s1,s1,1
c00036f4:	00e40433          	add	s0,s0,a4
c00036f8:	00040993          	mv	s3,s0
c00036fc:	ff2790e3          	bne	a5,s2,c00036dc <default_check+0x60>
c0003700:	2e9000ef          	jal	ra,c00041e8 <nr_free_pages>
c0003704:	7ca99a63          	bne	s3,a0,c0003ed8 <default_check+0x85c>
c0003708:	00100513          	li	a0,1
c000370c:	1c5000ef          	jal	ra,c00040d0 <alloc_pages>
c0003710:	00050a13          	mv	s4,a0
c0003714:	000502e3          	beqz	a0,c0003f18 <default_check+0x89c>
c0003718:	00100513          	li	a0,1
c000371c:	1b5000ef          	jal	ra,c00040d0 <alloc_pages>
c0003720:	00050993          	mv	s3,a0
c0003724:	7c050a63          	beqz	a0,c0003ef8 <default_check+0x87c>
c0003728:	00100513          	li	a0,1
c000372c:	1a5000ef          	jal	ra,c00040d0 <alloc_pages>
c0003730:	00050a93          	mv	s5,a0
c0003734:	56050263          	beqz	a0,c0003c98 <default_check+0x61c>
c0003738:	3b3a0063          	beq	s4,s3,c0003ad8 <default_check+0x45c>
c000373c:	38aa0e63          	beq	s4,a0,c0003ad8 <default_check+0x45c>
c0003740:	38a98c63          	beq	s3,a0,c0003ad8 <default_check+0x45c>
c0003744:	000a2783          	lw	a5,0(s4)
c0003748:	36079863          	bnez	a5,c0003ab8 <default_check+0x43c>
c000374c:	0009a783          	lw	a5,0(s3)
c0003750:	36079463          	bnez	a5,c0003ab8 <default_check+0x43c>
c0003754:	00052783          	lw	a5,0(a0)
c0003758:	36079063          	bnez	a5,c0003ab8 <default_check+0x43c>
c000375c:	0003b797          	auipc	a5,0x3b
c0003760:	58c7a783          	lw	a5,1420(a5) # c003ece8 <pages>
c0003764:	40fa0733          	sub	a4,s4,a5
c0003768:	00032617          	auipc	a2,0x32
c000376c:	05062603          	lw	a2,80(a2) # c00357b8 <nbase>
c0003770:	40575713          	srai	a4,a4,0x5
c0003774:	00c70733          	add	a4,a4,a2
c0003778:	0003b697          	auipc	a3,0x3b
c000377c:	4846a683          	lw	a3,1156(a3) # c003ebfc <npage>
c0003780:	00c69693          	slli	a3,a3,0xc
c0003784:	00c71713          	slli	a4,a4,0xc
c0003788:	48d77863          	bleu	a3,a4,c0003c18 <default_check+0x59c>
c000378c:	40f98733          	sub	a4,s3,a5
c0003790:	40575713          	srai	a4,a4,0x5
c0003794:	00c70733          	add	a4,a4,a2
c0003798:	00c71713          	slli	a4,a4,0xc
c000379c:	3ed77e63          	bleu	a3,a4,c0003b98 <default_check+0x51c>
c00037a0:	40f507b3          	sub	a5,a0,a5
c00037a4:	4057d793          	srai	a5,a5,0x5
c00037a8:	00c787b3          	add	a5,a5,a2
c00037ac:	00c79793          	slli	a5,a5,0xc
c00037b0:	3cd7f463          	bleu	a3,a5,c0003b78 <default_check+0x4fc>
c00037b4:	00100513          	li	a0,1
c00037b8:	0003bc17          	auipc	s8,0x3b
c00037bc:	518c2c03          	lw	s8,1304(s8) # c003ecd0 <free_area>
c00037c0:	0003bb97          	auipc	s7,0x3b
c00037c4:	514bab83          	lw	s7,1300(s7) # c003ecd4 <free_area+0x4>
c00037c8:	0003bb17          	auipc	s6,0x3b
c00037cc:	510b2b03          	lw	s6,1296(s6) # c003ecd8 <free_area+0x8>
c00037d0:	01292223          	sw	s2,4(s2)
c00037d4:	01292023          	sw	s2,0(s2)
c00037d8:	00092423          	sw	zero,8(s2)
c00037dc:	0f5000ef          	jal	ra,c00040d0 <alloc_pages>
c00037e0:	36051c63          	bnez	a0,c0003b58 <default_check+0x4dc>
c00037e4:	00100593          	li	a1,1
c00037e8:	000a0513          	mv	a0,s4
c00037ec:	199000ef          	jal	ra,c0004184 <free_pages>
c00037f0:	00100593          	li	a1,1
c00037f4:	00098513          	mv	a0,s3
c00037f8:	18d000ef          	jal	ra,c0004184 <free_pages>
c00037fc:	00100593          	li	a1,1
c0003800:	000a8513          	mv	a0,s5
c0003804:	181000ef          	jal	ra,c0004184 <free_pages>
c0003808:	0003b717          	auipc	a4,0x3b
c000380c:	4d072703          	lw	a4,1232(a4) # c003ecd8 <free_area+0x8>
c0003810:	00300793          	li	a5,3
c0003814:	32f71263          	bne	a4,a5,c0003b38 <default_check+0x4bc>
c0003818:	00100513          	li	a0,1
c000381c:	0b5000ef          	jal	ra,c00040d0 <alloc_pages>
c0003820:	00050993          	mv	s3,a0
c0003824:	2c050a63          	beqz	a0,c0003af8 <default_check+0x47c>
c0003828:	00100513          	li	a0,1
c000382c:	0a5000ef          	jal	ra,c00040d0 <alloc_pages>
c0003830:	00050a93          	mv	s5,a0
c0003834:	44050263          	beqz	a0,c0003c78 <default_check+0x5fc>
c0003838:	00100513          	li	a0,1
c000383c:	095000ef          	jal	ra,c00040d0 <alloc_pages>
c0003840:	00050a13          	mv	s4,a0
c0003844:	40050a63          	beqz	a0,c0003c58 <default_check+0x5dc>
c0003848:	00100513          	li	a0,1
c000384c:	085000ef          	jal	ra,c00040d0 <alloc_pages>
c0003850:	3e051463          	bnez	a0,c0003c38 <default_check+0x5bc>
c0003854:	00100593          	li	a1,1
c0003858:	00098513          	mv	a0,s3
c000385c:	129000ef          	jal	ra,c0004184 <free_pages>
c0003860:	0003b797          	auipc	a5,0x3b
c0003864:	4747a783          	lw	a5,1140(a5) # c003ecd4 <free_area+0x4>
c0003868:	2b278863          	beq	a5,s2,c0003b18 <default_check+0x49c>
c000386c:	00100513          	li	a0,1
c0003870:	061000ef          	jal	ra,c00040d0 <alloc_pages>
c0003874:	38a99263          	bne	s3,a0,c0003bf8 <default_check+0x57c>
c0003878:	00100513          	li	a0,1
c000387c:	055000ef          	jal	ra,c00040d0 <alloc_pages>
c0003880:	34051c63          	bnez	a0,c0003bd8 <default_check+0x55c>
c0003884:	0003b797          	auipc	a5,0x3b
c0003888:	4547a783          	lw	a5,1108(a5) # c003ecd8 <free_area+0x8>
c000388c:	32079663          	bnez	a5,c0003bb8 <default_check+0x53c>
c0003890:	00098513          	mv	a0,s3
c0003894:	00100593          	li	a1,1
c0003898:	01892023          	sw	s8,0(s2)
c000389c:	01792223          	sw	s7,4(s2)
c00038a0:	01692423          	sw	s6,8(s2)
c00038a4:	0e1000ef          	jal	ra,c0004184 <free_pages>
c00038a8:	00100593          	li	a1,1
c00038ac:	000a8513          	mv	a0,s5
c00038b0:	0d5000ef          	jal	ra,c0004184 <free_pages>
c00038b4:	00100593          	li	a1,1
c00038b8:	000a0513          	mv	a0,s4
c00038bc:	0c9000ef          	jal	ra,c0004184 <free_pages>
c00038c0:	00500513          	li	a0,5
c00038c4:	00d000ef          	jal	ra,c00040d0 <alloc_pages>
c00038c8:	00050993          	mv	s3,a0
c00038cc:	44050663          	beqz	a0,c0003d18 <default_check+0x69c>
c00038d0:	00452783          	lw	a5,4(a0)
c00038d4:	0017d793          	srli	a5,a5,0x1
c00038d8:	0017f793          	andi	a5,a5,1
c00038dc:	58079e63          	bnez	a5,c0003e78 <default_check+0x7fc>
c00038e0:	00100513          	li	a0,1
c00038e4:	0003bb97          	auipc	s7,0x3b
c00038e8:	3ecbab83          	lw	s7,1004(s7) # c003ecd0 <free_area>
c00038ec:	0003bb17          	auipc	s6,0x3b
c00038f0:	3e8b2b03          	lw	s6,1000(s6) # c003ecd4 <free_area+0x4>
c00038f4:	01292023          	sw	s2,0(s2)
c00038f8:	01292223          	sw	s2,4(s2)
c00038fc:	7d4000ef          	jal	ra,c00040d0 <alloc_pages>
c0003900:	54051c63          	bnez	a0,c0003e58 <default_check+0x7dc>
c0003904:	04098a93          	addi	s5,s3,64
c0003908:	000a8513          	mv	a0,s5
c000390c:	00300593          	li	a1,3
c0003910:	0003bc17          	auipc	s8,0x3b
c0003914:	3c8c2c03          	lw	s8,968(s8) # c003ecd8 <free_area+0x8>
c0003918:	00092423          	sw	zero,8(s2)
c000391c:	069000ef          	jal	ra,c0004184 <free_pages>
c0003920:	00400513          	li	a0,4
c0003924:	7ac000ef          	jal	ra,c00040d0 <alloc_pages>
c0003928:	50051863          	bnez	a0,c0003e38 <default_check+0x7bc>
c000392c:	0449a783          	lw	a5,68(s3)
c0003930:	0017d793          	srli	a5,a5,0x1
c0003934:	0017f793          	andi	a5,a5,1
c0003938:	4e078063          	beqz	a5,c0003e18 <default_check+0x79c>
c000393c:	0489a503          	lw	a0,72(s3)
c0003940:	00300793          	li	a5,3
c0003944:	4cf51a63          	bne	a0,a5,c0003e18 <default_check+0x79c>
c0003948:	788000ef          	jal	ra,c00040d0 <alloc_pages>
c000394c:	00050a13          	mv	s4,a0
c0003950:	4a050463          	beqz	a0,c0003df8 <default_check+0x77c>
c0003954:	00100513          	li	a0,1
c0003958:	778000ef          	jal	ra,c00040d0 <alloc_pages>
c000395c:	46051e63          	bnez	a0,c0003dd8 <default_check+0x75c>
c0003960:	454a9c63          	bne	s5,s4,c0003db8 <default_check+0x73c>
c0003964:	00100593          	li	a1,1
c0003968:	00098513          	mv	a0,s3
c000396c:	019000ef          	jal	ra,c0004184 <free_pages>
c0003970:	00300593          	li	a1,3
c0003974:	000a8513          	mv	a0,s5
c0003978:	00d000ef          	jal	ra,c0004184 <free_pages>
c000397c:	0049a783          	lw	a5,4(s3)
c0003980:	02098c93          	addi	s9,s3,32
c0003984:	0017d793          	srli	a5,a5,0x1
c0003988:	0017f793          	andi	a5,a5,1
c000398c:	40078663          	beqz	a5,c0003d98 <default_check+0x71c>
c0003990:	0089aa03          	lw	s4,8(s3)
c0003994:	00100793          	li	a5,1
c0003998:	40fa1063          	bne	s4,a5,c0003d98 <default_check+0x71c>
c000399c:	0449a783          	lw	a5,68(s3)
c00039a0:	0017d793          	srli	a5,a5,0x1
c00039a4:	0017f793          	andi	a5,a5,1
c00039a8:	3c078863          	beqz	a5,c0003d78 <default_check+0x6fc>
c00039ac:	0489a703          	lw	a4,72(s3)
c00039b0:	00300793          	li	a5,3
c00039b4:	3cf71263          	bne	a4,a5,c0003d78 <default_check+0x6fc>
c00039b8:	000a0513          	mv	a0,s4
c00039bc:	714000ef          	jal	ra,c00040d0 <alloc_pages>
c00039c0:	38a99c63          	bne	s3,a0,c0003d58 <default_check+0x6dc>
c00039c4:	000a0593          	mv	a1,s4
c00039c8:	7bc000ef          	jal	ra,c0004184 <free_pages>
c00039cc:	00200513          	li	a0,2
c00039d0:	700000ef          	jal	ra,c00040d0 <alloc_pages>
c00039d4:	36aa9263          	bne	s5,a0,c0003d38 <default_check+0x6bc>
c00039d8:	00200593          	li	a1,2
c00039dc:	7a8000ef          	jal	ra,c0004184 <free_pages>
c00039e0:	000a0593          	mv	a1,s4
c00039e4:	000c8513          	mv	a0,s9
c00039e8:	79c000ef          	jal	ra,c0004184 <free_pages>
c00039ec:	00500513          	li	a0,5
c00039f0:	6e0000ef          	jal	ra,c00040d0 <alloc_pages>
c00039f4:	00050993          	mv	s3,a0
c00039f8:	4a050063          	beqz	a0,c0003e98 <default_check+0x81c>
c00039fc:	000a0513          	mv	a0,s4
c0003a00:	6d0000ef          	jal	ra,c00040d0 <alloc_pages>
c0003a04:	2e051a63          	bnez	a0,c0003cf8 <default_check+0x67c>
c0003a08:	0003b797          	auipc	a5,0x3b
c0003a0c:	2d07a783          	lw	a5,720(a5) # c003ecd8 <free_area+0x8>
c0003a10:	2c079463          	bnez	a5,c0003cd8 <default_check+0x65c>
c0003a14:	00500593          	li	a1,5
c0003a18:	00098513          	mv	a0,s3
c0003a1c:	01892423          	sw	s8,8(s2)
c0003a20:	01792023          	sw	s7,0(s2)
c0003a24:	01692223          	sw	s6,4(s2)
c0003a28:	75c000ef          	jal	ra,c0004184 <free_pages>
c0003a2c:	0003b797          	auipc	a5,0x3b
c0003a30:	2a87a783          	lw	a5,680(a5) # c003ecd4 <free_area+0x4>
c0003a34:	01278c63          	beq	a5,s2,c0003a4c <default_check+0x3d0>
c0003a38:	ffc7a703          	lw	a4,-4(a5)
c0003a3c:	0047a783          	lw	a5,4(a5)
c0003a40:	fff48493          	addi	s1,s1,-1
c0003a44:	40e40433          	sub	s0,s0,a4
c0003a48:	ff2798e3          	bne	a5,s2,c0003a38 <default_check+0x3bc>
c0003a4c:	26049663          	bnez	s1,c0003cb8 <default_check+0x63c>
c0003a50:	46041463          	bnez	s0,c0003eb8 <default_check+0x83c>
c0003a54:	02c12083          	lw	ra,44(sp)
c0003a58:	02812403          	lw	s0,40(sp)
c0003a5c:	02412483          	lw	s1,36(sp)
c0003a60:	02012903          	lw	s2,32(sp)
c0003a64:	01c12983          	lw	s3,28(sp)
c0003a68:	01812a03          	lw	s4,24(sp)
c0003a6c:	01412a83          	lw	s5,20(sp)
c0003a70:	01012b03          	lw	s6,16(sp)
c0003a74:	00c12b83          	lw	s7,12(sp)
c0003a78:	00812c03          	lw	s8,8(sp)
c0003a7c:	00412c83          	lw	s9,4(sp)
c0003a80:	03010113          	addi	sp,sp,48
c0003a84:	00008067          	ret
c0003a88:	00000993          	li	s3,0
c0003a8c:	00000413          	li	s0,0
c0003a90:	00000493          	li	s1,0
c0003a94:	c6dff06f          	j	c0003700 <default_check+0x84>
c0003a98:	00009697          	auipc	a3,0x9
c0003a9c:	10068693          	addi	a3,a3,256 # c000cb98 <commands+0xdf8>
c0003aa0:	00008617          	auipc	a2,0x8
c0003aa4:	6d860613          	addi	a2,a2,1752 # c000c178 <commands+0x3d8>
c0003aa8:	0f000593          	li	a1,240
c0003aac:	00009517          	auipc	a0,0x9
c0003ab0:	6e050513          	addi	a0,a0,1760 # c000d18c <commands+0x13ec>
c0003ab4:	f9cfc0ef          	jal	ra,c0000250 <__panic>
c0003ab8:	00009697          	auipc	a3,0x9
c0003abc:	45868693          	addi	a3,a3,1112 # c000cf10 <commands+0x1170>
c0003ac0:	00008617          	auipc	a2,0x8
c0003ac4:	6b860613          	addi	a2,a2,1720 # c000c178 <commands+0x3d8>
c0003ac8:	0be00593          	li	a1,190
c0003acc:	00009517          	auipc	a0,0x9
c0003ad0:	6c050513          	addi	a0,a0,1728 # c000d18c <commands+0x13ec>
c0003ad4:	f7cfc0ef          	jal	ra,c0000250 <__panic>
c0003ad8:	00009697          	auipc	a3,0x9
c0003adc:	41468693          	addi	a3,a3,1044 # c000ceec <commands+0x114c>
c0003ae0:	00008617          	auipc	a2,0x8
c0003ae4:	69860613          	addi	a2,a2,1688 # c000c178 <commands+0x3d8>
c0003ae8:	0bd00593          	li	a1,189
c0003aec:	00009517          	auipc	a0,0x9
c0003af0:	6a050513          	addi	a0,a0,1696 # c000d18c <commands+0x13ec>
c0003af4:	f5cfc0ef          	jal	ra,c0000250 <__panic>
c0003af8:	00009697          	auipc	a3,0x9
c0003afc:	3a068693          	addi	a3,a3,928 # c000ce98 <commands+0x10f8>
c0003b00:	00008617          	auipc	a2,0x8
c0003b04:	67860613          	addi	a2,a2,1656 # c000c178 <commands+0x3d8>
c0003b08:	0d200593          	li	a1,210
c0003b0c:	00009517          	auipc	a0,0x9
c0003b10:	68050513          	addi	a0,a0,1664 # c000d18c <commands+0x13ec>
c0003b14:	f3cfc0ef          	jal	ra,c0000250 <__panic>
c0003b18:	00009697          	auipc	a3,0x9
c0003b1c:	4bc68693          	addi	a3,a3,1212 # c000cfd4 <commands+0x1234>
c0003b20:	00008617          	auipc	a2,0x8
c0003b24:	65860613          	addi	a2,a2,1624 # c000c178 <commands+0x3d8>
c0003b28:	0d900593          	li	a1,217
c0003b2c:	00009517          	auipc	a0,0x9
c0003b30:	66050513          	addi	a0,a0,1632 # c000d18c <commands+0x13ec>
c0003b34:	f1cfc0ef          	jal	ra,c0000250 <__panic>
c0003b38:	00009697          	auipc	a3,0x9
c0003b3c:	48c68693          	addi	a3,a3,1164 # c000cfc4 <commands+0x1224>
c0003b40:	00008617          	auipc	a2,0x8
c0003b44:	63860613          	addi	a2,a2,1592 # c000c178 <commands+0x3d8>
c0003b48:	0d000593          	li	a1,208
c0003b4c:	00009517          	auipc	a0,0x9
c0003b50:	64050513          	addi	a0,a0,1600 # c000d18c <commands+0x13ec>
c0003b54:	efcfc0ef          	jal	ra,c0000250 <__panic>
c0003b58:	00009697          	auipc	a3,0x9
c0003b5c:	45468693          	addi	a3,a3,1108 # c000cfac <commands+0x120c>
c0003b60:	00008617          	auipc	a2,0x8
c0003b64:	61860613          	addi	a2,a2,1560 # c000c178 <commands+0x3d8>
c0003b68:	0cb00593          	li	a1,203
c0003b6c:	00009517          	auipc	a0,0x9
c0003b70:	62050513          	addi	a0,a0,1568 # c000d18c <commands+0x13ec>
c0003b74:	edcfc0ef          	jal	ra,c0000250 <__panic>
c0003b78:	00009697          	auipc	a3,0x9
c0003b7c:	41468693          	addi	a3,a3,1044 # c000cf8c <commands+0x11ec>
c0003b80:	00008617          	auipc	a2,0x8
c0003b84:	5f860613          	addi	a2,a2,1528 # c000c178 <commands+0x3d8>
c0003b88:	0c200593          	li	a1,194
c0003b8c:	00009517          	auipc	a0,0x9
c0003b90:	60050513          	addi	a0,a0,1536 # c000d18c <commands+0x13ec>
c0003b94:	ebcfc0ef          	jal	ra,c0000250 <__panic>
c0003b98:	00009697          	auipc	a3,0x9
c0003b9c:	3d468693          	addi	a3,a3,980 # c000cf6c <commands+0x11cc>
c0003ba0:	00008617          	auipc	a2,0x8
c0003ba4:	5d860613          	addi	a2,a2,1496 # c000c178 <commands+0x3d8>
c0003ba8:	0c100593          	li	a1,193
c0003bac:	00009517          	auipc	a0,0x9
c0003bb0:	5e050513          	addi	a0,a0,1504 # c000d18c <commands+0x13ec>
c0003bb4:	e9cfc0ef          	jal	ra,c0000250 <__panic>
c0003bb8:	00009697          	auipc	a3,0x9
c0003bbc:	16468693          	addi	a3,a3,356 # c000cd1c <commands+0xf7c>
c0003bc0:	00008617          	auipc	a2,0x8
c0003bc4:	5b860613          	addi	a2,a2,1464 # c000c178 <commands+0x3d8>
c0003bc8:	0df00593          	li	a1,223
c0003bcc:	00009517          	auipc	a0,0x9
c0003bd0:	5c050513          	addi	a0,a0,1472 # c000d18c <commands+0x13ec>
c0003bd4:	e7cfc0ef          	jal	ra,c0000250 <__panic>
c0003bd8:	00009697          	auipc	a3,0x9
c0003bdc:	3d468693          	addi	a3,a3,980 # c000cfac <commands+0x120c>
c0003be0:	00008617          	auipc	a2,0x8
c0003be4:	59860613          	addi	a2,a2,1432 # c000c178 <commands+0x3d8>
c0003be8:	0dd00593          	li	a1,221
c0003bec:	00009517          	auipc	a0,0x9
c0003bf0:	5a050513          	addi	a0,a0,1440 # c000d18c <commands+0x13ec>
c0003bf4:	e5cfc0ef          	jal	ra,c0000250 <__panic>
c0003bf8:	00009697          	auipc	a3,0x9
c0003bfc:	3f468693          	addi	a3,a3,1012 # c000cfec <commands+0x124c>
c0003c00:	00008617          	auipc	a2,0x8
c0003c04:	57860613          	addi	a2,a2,1400 # c000c178 <commands+0x3d8>
c0003c08:	0dc00593          	li	a1,220
c0003c0c:	00009517          	auipc	a0,0x9
c0003c10:	58050513          	addi	a0,a0,1408 # c000d18c <commands+0x13ec>
c0003c14:	e3cfc0ef          	jal	ra,c0000250 <__panic>
c0003c18:	00009697          	auipc	a3,0x9
c0003c1c:	33468693          	addi	a3,a3,820 # c000cf4c <commands+0x11ac>
c0003c20:	00008617          	auipc	a2,0x8
c0003c24:	55860613          	addi	a2,a2,1368 # c000c178 <commands+0x3d8>
c0003c28:	0c000593          	li	a1,192
c0003c2c:	00009517          	auipc	a0,0x9
c0003c30:	56050513          	addi	a0,a0,1376 # c000d18c <commands+0x13ec>
c0003c34:	e1cfc0ef          	jal	ra,c0000250 <__panic>
c0003c38:	00009697          	auipc	a3,0x9
c0003c3c:	37468693          	addi	a3,a3,884 # c000cfac <commands+0x120c>
c0003c40:	00008617          	auipc	a2,0x8
c0003c44:	53860613          	addi	a2,a2,1336 # c000c178 <commands+0x3d8>
c0003c48:	0d600593          	li	a1,214
c0003c4c:	00009517          	auipc	a0,0x9
c0003c50:	54050513          	addi	a0,a0,1344 # c000d18c <commands+0x13ec>
c0003c54:	dfcfc0ef          	jal	ra,c0000250 <__panic>
c0003c58:	00009697          	auipc	a3,0x9
c0003c5c:	27868693          	addi	a3,a3,632 # c000ced0 <commands+0x1130>
c0003c60:	00008617          	auipc	a2,0x8
c0003c64:	51860613          	addi	a2,a2,1304 # c000c178 <commands+0x3d8>
c0003c68:	0d400593          	li	a1,212
c0003c6c:	00009517          	auipc	a0,0x9
c0003c70:	52050513          	addi	a0,a0,1312 # c000d18c <commands+0x13ec>
c0003c74:	ddcfc0ef          	jal	ra,c0000250 <__panic>
c0003c78:	00009697          	auipc	a3,0x9
c0003c7c:	23c68693          	addi	a3,a3,572 # c000ceb4 <commands+0x1114>
c0003c80:	00008617          	auipc	a2,0x8
c0003c84:	4f860613          	addi	a2,a2,1272 # c000c178 <commands+0x3d8>
c0003c88:	0d300593          	li	a1,211
c0003c8c:	00009517          	auipc	a0,0x9
c0003c90:	50050513          	addi	a0,a0,1280 # c000d18c <commands+0x13ec>
c0003c94:	dbcfc0ef          	jal	ra,c0000250 <__panic>
c0003c98:	00009697          	auipc	a3,0x9
c0003c9c:	23868693          	addi	a3,a3,568 # c000ced0 <commands+0x1130>
c0003ca0:	00008617          	auipc	a2,0x8
c0003ca4:	4d860613          	addi	a2,a2,1240 # c000c178 <commands+0x3d8>
c0003ca8:	0bb00593          	li	a1,187
c0003cac:	00009517          	auipc	a0,0x9
c0003cb0:	4e050513          	addi	a0,a0,1248 # c000d18c <commands+0x13ec>
c0003cb4:	d9cfc0ef          	jal	ra,c0000250 <__panic>
c0003cb8:	00009697          	auipc	a3,0x9
c0003cbc:	49468693          	addi	a3,a3,1172 # c000d14c <commands+0x13ac>
c0003cc0:	00008617          	auipc	a2,0x8
c0003cc4:	4b860613          	addi	a2,a2,1208 # c000c178 <commands+0x3d8>
c0003cc8:	12500593          	li	a1,293
c0003ccc:	00009517          	auipc	a0,0x9
c0003cd0:	4c050513          	addi	a0,a0,1216 # c000d18c <commands+0x13ec>
c0003cd4:	d7cfc0ef          	jal	ra,c0000250 <__panic>
c0003cd8:	00009697          	auipc	a3,0x9
c0003cdc:	04468693          	addi	a3,a3,68 # c000cd1c <commands+0xf7c>
c0003ce0:	00008617          	auipc	a2,0x8
c0003ce4:	49860613          	addi	a2,a2,1176 # c000c178 <commands+0x3d8>
c0003ce8:	11a00593          	li	a1,282
c0003cec:	00009517          	auipc	a0,0x9
c0003cf0:	4a050513          	addi	a0,a0,1184 # c000d18c <commands+0x13ec>
c0003cf4:	d5cfc0ef          	jal	ra,c0000250 <__panic>
c0003cf8:	00009697          	auipc	a3,0x9
c0003cfc:	2b468693          	addi	a3,a3,692 # c000cfac <commands+0x120c>
c0003d00:	00008617          	auipc	a2,0x8
c0003d04:	47860613          	addi	a2,a2,1144 # c000c178 <commands+0x3d8>
c0003d08:	11800593          	li	a1,280
c0003d0c:	00009517          	auipc	a0,0x9
c0003d10:	48050513          	addi	a0,a0,1152 # c000d18c <commands+0x13ec>
c0003d14:	d3cfc0ef          	jal	ra,c0000250 <__panic>
c0003d18:	00009697          	auipc	a3,0x9
c0003d1c:	2f068693          	addi	a3,a3,752 # c000d008 <commands+0x1268>
c0003d20:	00008617          	auipc	a2,0x8
c0003d24:	45860613          	addi	a2,a2,1112 # c000c178 <commands+0x3d8>
c0003d28:	0f800593          	li	a1,248
c0003d2c:	00009517          	auipc	a0,0x9
c0003d30:	46050513          	addi	a0,a0,1120 # c000d18c <commands+0x13ec>
c0003d34:	d1cfc0ef          	jal	ra,c0000250 <__panic>
c0003d38:	00009697          	auipc	a3,0x9
c0003d3c:	3d468693          	addi	a3,a3,980 # c000d10c <commands+0x136c>
c0003d40:	00008617          	auipc	a2,0x8
c0003d44:	43860613          	addi	a2,a2,1080 # c000c178 <commands+0x3d8>
c0003d48:	11200593          	li	a1,274
c0003d4c:	00009517          	auipc	a0,0x9
c0003d50:	44050513          	addi	a0,a0,1088 # c000d18c <commands+0x13ec>
c0003d54:	cfcfc0ef          	jal	ra,c0000250 <__panic>
c0003d58:	00009697          	auipc	a3,0x9
c0003d5c:	39468693          	addi	a3,a3,916 # c000d0ec <commands+0x134c>
c0003d60:	00008617          	auipc	a2,0x8
c0003d64:	41860613          	addi	a2,a2,1048 # c000c178 <commands+0x3d8>
c0003d68:	11000593          	li	a1,272
c0003d6c:	00009517          	auipc	a0,0x9
c0003d70:	42050513          	addi	a0,a0,1056 # c000d18c <commands+0x13ec>
c0003d74:	cdcfc0ef          	jal	ra,c0000250 <__panic>
c0003d78:	00009697          	auipc	a3,0x9
c0003d7c:	34c68693          	addi	a3,a3,844 # c000d0c4 <commands+0x1324>
c0003d80:	00008617          	auipc	a2,0x8
c0003d84:	3f860613          	addi	a2,a2,1016 # c000c178 <commands+0x3d8>
c0003d88:	10e00593          	li	a1,270
c0003d8c:	00009517          	auipc	a0,0x9
c0003d90:	40050513          	addi	a0,a0,1024 # c000d18c <commands+0x13ec>
c0003d94:	cbcfc0ef          	jal	ra,c0000250 <__panic>
c0003d98:	00009697          	auipc	a3,0x9
c0003d9c:	30468693          	addi	a3,a3,772 # c000d09c <commands+0x12fc>
c0003da0:	00008617          	auipc	a2,0x8
c0003da4:	3d860613          	addi	a2,a2,984 # c000c178 <commands+0x3d8>
c0003da8:	10d00593          	li	a1,269
c0003dac:	00009517          	auipc	a0,0x9
c0003db0:	3e050513          	addi	a0,a0,992 # c000d18c <commands+0x13ec>
c0003db4:	c9cfc0ef          	jal	ra,c0000250 <__panic>
c0003db8:	00009697          	auipc	a3,0x9
c0003dbc:	2d468693          	addi	a3,a3,724 # c000d08c <commands+0x12ec>
c0003dc0:	00008617          	auipc	a2,0x8
c0003dc4:	3b860613          	addi	a2,a2,952 # c000c178 <commands+0x3d8>
c0003dc8:	10800593          	li	a1,264
c0003dcc:	00009517          	auipc	a0,0x9
c0003dd0:	3c050513          	addi	a0,a0,960 # c000d18c <commands+0x13ec>
c0003dd4:	c7cfc0ef          	jal	ra,c0000250 <__panic>
c0003dd8:	00009697          	auipc	a3,0x9
c0003ddc:	1d468693          	addi	a3,a3,468 # c000cfac <commands+0x120c>
c0003de0:	00008617          	auipc	a2,0x8
c0003de4:	39860613          	addi	a2,a2,920 # c000c178 <commands+0x3d8>
c0003de8:	10700593          	li	a1,263
c0003dec:	00009517          	auipc	a0,0x9
c0003df0:	3a050513          	addi	a0,a0,928 # c000d18c <commands+0x13ec>
c0003df4:	c5cfc0ef          	jal	ra,c0000250 <__panic>
c0003df8:	00009697          	auipc	a3,0x9
c0003dfc:	27468693          	addi	a3,a3,628 # c000d06c <commands+0x12cc>
c0003e00:	00008617          	auipc	a2,0x8
c0003e04:	37860613          	addi	a2,a2,888 # c000c178 <commands+0x3d8>
c0003e08:	10600593          	li	a1,262
c0003e0c:	00009517          	auipc	a0,0x9
c0003e10:	38050513          	addi	a0,a0,896 # c000d18c <commands+0x13ec>
c0003e14:	c3cfc0ef          	jal	ra,c0000250 <__panic>
c0003e18:	00009697          	auipc	a3,0x9
c0003e1c:	22868693          	addi	a3,a3,552 # c000d040 <commands+0x12a0>
c0003e20:	00008617          	auipc	a2,0x8
c0003e24:	35860613          	addi	a2,a2,856 # c000c178 <commands+0x3d8>
c0003e28:	10500593          	li	a1,261
c0003e2c:	00009517          	auipc	a0,0x9
c0003e30:	36050513          	addi	a0,a0,864 # c000d18c <commands+0x13ec>
c0003e34:	c1cfc0ef          	jal	ra,c0000250 <__panic>
c0003e38:	00009697          	auipc	a3,0x9
c0003e3c:	1f068693          	addi	a3,a3,496 # c000d028 <commands+0x1288>
c0003e40:	00008617          	auipc	a2,0x8
c0003e44:	33860613          	addi	a2,a2,824 # c000c178 <commands+0x3d8>
c0003e48:	10400593          	li	a1,260
c0003e4c:	00009517          	auipc	a0,0x9
c0003e50:	34050513          	addi	a0,a0,832 # c000d18c <commands+0x13ec>
c0003e54:	bfcfc0ef          	jal	ra,c0000250 <__panic>
c0003e58:	00009697          	auipc	a3,0x9
c0003e5c:	15468693          	addi	a3,a3,340 # c000cfac <commands+0x120c>
c0003e60:	00008617          	auipc	a2,0x8
c0003e64:	31860613          	addi	a2,a2,792 # c000c178 <commands+0x3d8>
c0003e68:	0fe00593          	li	a1,254
c0003e6c:	00009517          	auipc	a0,0x9
c0003e70:	32050513          	addi	a0,a0,800 # c000d18c <commands+0x13ec>
c0003e74:	bdcfc0ef          	jal	ra,c0000250 <__panic>
c0003e78:	00009697          	auipc	a3,0x9
c0003e7c:	19c68693          	addi	a3,a3,412 # c000d014 <commands+0x1274>
c0003e80:	00008617          	auipc	a2,0x8
c0003e84:	2f860613          	addi	a2,a2,760 # c000c178 <commands+0x3d8>
c0003e88:	0f900593          	li	a1,249
c0003e8c:	00009517          	auipc	a0,0x9
c0003e90:	30050513          	addi	a0,a0,768 # c000d18c <commands+0x13ec>
c0003e94:	bbcfc0ef          	jal	ra,c0000250 <__panic>
c0003e98:	00009697          	auipc	a3,0x9
c0003e9c:	29468693          	addi	a3,a3,660 # c000d12c <commands+0x138c>
c0003ea0:	00008617          	auipc	a2,0x8
c0003ea4:	2d860613          	addi	a2,a2,728 # c000c178 <commands+0x3d8>
c0003ea8:	11700593          	li	a1,279
c0003eac:	00009517          	auipc	a0,0x9
c0003eb0:	2e050513          	addi	a0,a0,736 # c000d18c <commands+0x13ec>
c0003eb4:	b9cfc0ef          	jal	ra,c0000250 <__panic>
c0003eb8:	00009697          	auipc	a3,0x9
c0003ebc:	2a068693          	addi	a3,a3,672 # c000d158 <commands+0x13b8>
c0003ec0:	00008617          	auipc	a2,0x8
c0003ec4:	2b860613          	addi	a2,a2,696 # c000c178 <commands+0x3d8>
c0003ec8:	12600593          	li	a1,294
c0003ecc:	00009517          	auipc	a0,0x9
c0003ed0:	2c050513          	addi	a0,a0,704 # c000d18c <commands+0x13ec>
c0003ed4:	b7cfc0ef          	jal	ra,c0000250 <__panic>
c0003ed8:	00009697          	auipc	a3,0x9
c0003edc:	cd068693          	addi	a3,a3,-816 # c000cba8 <commands+0xe08>
c0003ee0:	00008617          	auipc	a2,0x8
c0003ee4:	29860613          	addi	a2,a2,664 # c000c178 <commands+0x3d8>
c0003ee8:	0f300593          	li	a1,243
c0003eec:	00009517          	auipc	a0,0x9
c0003ef0:	2a050513          	addi	a0,a0,672 # c000d18c <commands+0x13ec>
c0003ef4:	b5cfc0ef          	jal	ra,c0000250 <__panic>
c0003ef8:	00009697          	auipc	a3,0x9
c0003efc:	fbc68693          	addi	a3,a3,-68 # c000ceb4 <commands+0x1114>
c0003f00:	00008617          	auipc	a2,0x8
c0003f04:	27860613          	addi	a2,a2,632 # c000c178 <commands+0x3d8>
c0003f08:	0ba00593          	li	a1,186
c0003f0c:	00009517          	auipc	a0,0x9
c0003f10:	28050513          	addi	a0,a0,640 # c000d18c <commands+0x13ec>
c0003f14:	b3cfc0ef          	jal	ra,c0000250 <__panic>
c0003f18:	00009697          	auipc	a3,0x9
c0003f1c:	f8068693          	addi	a3,a3,-128 # c000ce98 <commands+0x10f8>
c0003f20:	00008617          	auipc	a2,0x8
c0003f24:	25860613          	addi	a2,a2,600 # c000c178 <commands+0x3d8>
c0003f28:	0b900593          	li	a1,185
c0003f2c:	00009517          	auipc	a0,0x9
c0003f30:	26050513          	addi	a0,a0,608 # c000d18c <commands+0x13ec>
c0003f34:	b1cfc0ef          	jal	ra,c0000250 <__panic>

c0003f38 <default_alloc_pages>:
c0003f38:	0a050263          	beqz	a0,c0003fdc <default_alloc_pages+0xa4>
c0003f3c:	0003b597          	auipc	a1,0x3b
c0003f40:	d9c5a583          	lw	a1,-612(a1) # c003ecd8 <free_area+0x8>
c0003f44:	00050693          	mv	a3,a0
c0003f48:	0003b617          	auipc	a2,0x3b
c0003f4c:	d8860613          	addi	a2,a2,-632 # c003ecd0 <free_area>
c0003f50:	00a5ee63          	bltu	a1,a0,c0003f6c <default_alloc_pages+0x34>
c0003f54:	00060793          	mv	a5,a2
c0003f58:	00c0006f          	j	c0003f64 <default_alloc_pages+0x2c>
c0003f5c:	ffc7a703          	lw	a4,-4(a5)
c0003f60:	00d77a63          	bleu	a3,a4,c0003f74 <default_alloc_pages+0x3c>
c0003f64:	0047a783          	lw	a5,4(a5)
c0003f68:	fec79ae3          	bne	a5,a2,c0003f5c <default_alloc_pages+0x24>
c0003f6c:	00000513          	li	a0,0
c0003f70:	00008067          	ret
c0003f74:	ff478513          	addi	a0,a5,-12
c0003f78:	fe050ce3          	beqz	a0,c0003f70 <default_alloc_pages+0x38>
c0003f7c:	0007a803          	lw	a6,0(a5)
c0003f80:	0047a883          	lw	a7,4(a5)
c0003f84:	01182223          	sw	a7,4(a6)
c0003f88:	0108a023          	sw	a6,0(a7)
c0003f8c:	02e6fc63          	bleu	a4,a3,c0003fc4 <default_alloc_pages+0x8c>
c0003f90:	00569893          	slli	a7,a3,0x5
c0003f94:	011508b3          	add	a7,a0,a7
c0003f98:	40d70733          	sub	a4,a4,a3
c0003f9c:	00e8a423          	sw	a4,8(a7)
c0003fa0:	00488313          	addi	t1,a7,4
c0003fa4:	00200713          	li	a4,2
c0003fa8:	40e3202f          	amoor.w	zero,a4,(t1)
c0003fac:	00482703          	lw	a4,4(a6)
c0003fb0:	00c88313          	addi	t1,a7,12
c0003fb4:	00672023          	sw	t1,0(a4)
c0003fb8:	00682223          	sw	t1,4(a6)
c0003fbc:	00e8a823          	sw	a4,16(a7)
c0003fc0:	0108a623          	sw	a6,12(a7)
c0003fc4:	40d586b3          	sub	a3,a1,a3
c0003fc8:	00d62423          	sw	a3,8(a2)
c0003fcc:	ffd00713          	li	a4,-3
c0003fd0:	ff878793          	addi	a5,a5,-8
c0003fd4:	60e7a02f          	amoand.w	zero,a4,(a5)
c0003fd8:	00008067          	ret
c0003fdc:	ff010113          	addi	sp,sp,-16
c0003fe0:	00009697          	auipc	a3,0x9
c0003fe4:	1c468693          	addi	a3,a3,452 # c000d1a4 <commands+0x1404>
c0003fe8:	00008617          	auipc	a2,0x8
c0003fec:	19060613          	addi	a2,a2,400 # c000c178 <commands+0x3d8>
c0003ff0:	06200593          	li	a1,98
c0003ff4:	00009517          	auipc	a0,0x9
c0003ff8:	19850513          	addi	a0,a0,408 # c000d18c <commands+0x13ec>
c0003ffc:	00112623          	sw	ra,12(sp)
c0004000:	a50fc0ef          	jal	ra,c0000250 <__panic>

c0004004 <get_pgtable_items.isra.4.part.5>:
c0004004:	00050313          	mv	t1,a0
c0004008:	04a5f063          	bleu	a0,a1,c0004048 <get_pgtable_items.isra.4.part.5+0x44>
c000400c:	00259813          	slli	a6,a1,0x2
c0004010:	010608b3          	add	a7,a2,a6
c0004014:	0008a783          	lw	a5,0(a7)
c0004018:	0017f793          	andi	a5,a5,1
c000401c:	02079a63          	bnez	a5,c0004050 <get_pgtable_items.isra.4.part.5+0x4c>
c0004020:	00480813          	addi	a6,a6,4
c0004024:	01060833          	add	a6,a2,a6
c0004028:	0140006f          	j	c000403c <get_pgtable_items.isra.4.part.5+0x38>
c000402c:	00082783          	lw	a5,0(a6)
c0004030:	00480813          	addi	a6,a6,4
c0004034:	0017f793          	andi	a5,a5,1
c0004038:	00079c63          	bnez	a5,c0004050 <get_pgtable_items.isra.4.part.5+0x4c>
c000403c:	00158593          	addi	a1,a1,1
c0004040:	00080893          	mv	a7,a6
c0004044:	fe6594e3          	bne	a1,t1,c000402c <get_pgtable_items.isra.4.part.5+0x28>
c0004048:	00000513          	li	a0,0
c000404c:	00008067          	ret
c0004050:	00068463          	beqz	a3,c0004058 <get_pgtable_items.isra.4.part.5+0x54>
c0004054:	00b6a023          	sw	a1,0(a3)
c0004058:	0008a503          	lw	a0,0(a7)
c000405c:	00158593          	addi	a1,a1,1
c0004060:	01f57513          	andi	a0,a0,31
c0004064:	0265fe63          	bleu	t1,a1,c00040a0 <get_pgtable_items.isra.4.part.5+0x9c>
c0004068:	00259793          	slli	a5,a1,0x2
c000406c:	00f606b3          	add	a3,a2,a5
c0004070:	0006a683          	lw	a3,0(a3)
c0004074:	01f6f693          	andi	a3,a3,31
c0004078:	02a69463          	bne	a3,a0,c00040a0 <get_pgtable_items.isra.4.part.5+0x9c>
c000407c:	ffc78793          	addi	a5,a5,-4
c0004080:	00f60633          	add	a2,a2,a5
c0004084:	0140006f          	j	c0004098 <get_pgtable_items.isra.4.part.5+0x94>
c0004088:	00862783          	lw	a5,8(a2)
c000408c:	00460613          	addi	a2,a2,4
c0004090:	01f7f793          	andi	a5,a5,31
c0004094:	00d79663          	bne	a5,a3,c00040a0 <get_pgtable_items.isra.4.part.5+0x9c>
c0004098:	00158593          	addi	a1,a1,1
c000409c:	fe65e6e3          	bltu	a1,t1,c0004088 <get_pgtable_items.isra.4.part.5+0x84>
c00040a0:	00070663          	beqz	a4,c00040ac <get_pgtable_items.isra.4.part.5+0xa8>
c00040a4:	00b72023          	sw	a1,0(a4)
c00040a8:	00008067          	ret
c00040ac:	00008067          	ret

c00040b0 <pa2page.part.6>:
c00040b0:	ff010113          	addi	sp,sp,-16
c00040b4:	00008617          	auipc	a2,0x8
c00040b8:	74060613          	addi	a2,a2,1856 # c000c7f4 <commands+0xa54>
c00040bc:	06100593          	li	a1,97
c00040c0:	00008517          	auipc	a0,0x8
c00040c4:	75450513          	addi	a0,a0,1876 # c000c814 <commands+0xa74>
c00040c8:	00112623          	sw	ra,12(sp)
c00040cc:	984fc0ef          	jal	ra,c0000250 <__panic>

c00040d0 <alloc_pages>:
c00040d0:	ff010113          	addi	sp,sp,-16
c00040d4:	00812423          	sw	s0,8(sp)
c00040d8:	01212023          	sw	s2,0(sp)
c00040dc:	00112623          	sw	ra,12(sp)
c00040e0:	00912223          	sw	s1,4(sp)
c00040e4:	00050413          	mv	s0,a0
c00040e8:	00100913          	li	s2,1
c00040ec:	0400006f          	j	c000412c <alloc_pages+0x5c>
c00040f0:	0003b797          	auipc	a5,0x3b
c00040f4:	bec7a783          	lw	a5,-1044(a5) # c003ecdc <pmm_manager>
c00040f8:	00c7a783          	lw	a5,12(a5)
c00040fc:	000780e7          	jalr	a5
c0004100:	00050493          	mv	s1,a0
c0004104:	00000613          	li	a2,0
c0004108:	00040593          	mv	a1,s0
c000410c:	04049e63          	bnez	s1,c0004168 <alloc_pages+0x98>
c0004110:	04896c63          	bltu	s2,s0,c0004168 <alloc_pages+0x98>
c0004114:	0003b797          	auipc	a5,0x3b
c0004118:	ae07a783          	lw	a5,-1312(a5) # c003ebf4 <swap_init_ok>
c000411c:	04078663          	beqz	a5,c0004168 <alloc_pages+0x98>
c0004120:	0003b517          	auipc	a0,0x3b
c0004124:	b0852503          	lw	a0,-1272(a0) # c003ec28 <check_mm_struct>
c0004128:	f3dfe0ef          	jal	ra,c0003064 <swap_out>
c000412c:	100027f3          	csrr	a5,sstatus
c0004130:	0027f793          	andi	a5,a5,2
c0004134:	00040513          	mv	a0,s0
c0004138:	fa078ce3          	beqz	a5,c00040f0 <alloc_pages+0x20>
c000413c:	ee8fc0ef          	jal	ra,c0000824 <intr_disable>
c0004140:	0003b797          	auipc	a5,0x3b
c0004144:	b9c7a783          	lw	a5,-1124(a5) # c003ecdc <pmm_manager>
c0004148:	00c7a783          	lw	a5,12(a5)
c000414c:	00040513          	mv	a0,s0
c0004150:	000780e7          	jalr	a5
c0004154:	00050493          	mv	s1,a0
c0004158:	ec4fc0ef          	jal	ra,c000081c <intr_enable>
c000415c:	00000613          	li	a2,0
c0004160:	00040593          	mv	a1,s0
c0004164:	fa0486e3          	beqz	s1,c0004110 <alloc_pages+0x40>
c0004168:	00c12083          	lw	ra,12(sp)
c000416c:	00048513          	mv	a0,s1
c0004170:	00812403          	lw	s0,8(sp)
c0004174:	00412483          	lw	s1,4(sp)
c0004178:	00012903          	lw	s2,0(sp)
c000417c:	01010113          	addi	sp,sp,16
c0004180:	00008067          	ret

c0004184 <free_pages>:
c0004184:	100027f3          	csrr	a5,sstatus
c0004188:	0027f793          	andi	a5,a5,2
c000418c:	00079a63          	bnez	a5,c00041a0 <free_pages+0x1c>
c0004190:	0003b797          	auipc	a5,0x3b
c0004194:	b4c7a783          	lw	a5,-1204(a5) # c003ecdc <pmm_manager>
c0004198:	0107a303          	lw	t1,16(a5)
c000419c:	00030067          	jr	t1
c00041a0:	ff010113          	addi	sp,sp,-16
c00041a4:	00112623          	sw	ra,12(sp)
c00041a8:	00812423          	sw	s0,8(sp)
c00041ac:	00912223          	sw	s1,4(sp)
c00041b0:	00050413          	mv	s0,a0
c00041b4:	00058493          	mv	s1,a1
c00041b8:	e6cfc0ef          	jal	ra,c0000824 <intr_disable>
c00041bc:	0003b797          	auipc	a5,0x3b
c00041c0:	b207a783          	lw	a5,-1248(a5) # c003ecdc <pmm_manager>
c00041c4:	0107a783          	lw	a5,16(a5)
c00041c8:	00048593          	mv	a1,s1
c00041cc:	00040513          	mv	a0,s0
c00041d0:	000780e7          	jalr	a5
c00041d4:	00c12083          	lw	ra,12(sp)
c00041d8:	00812403          	lw	s0,8(sp)
c00041dc:	00412483          	lw	s1,4(sp)
c00041e0:	01010113          	addi	sp,sp,16
c00041e4:	e38fc06f          	j	c000081c <intr_enable>

c00041e8 <nr_free_pages>:
c00041e8:	100027f3          	csrr	a5,sstatus
c00041ec:	0027f793          	andi	a5,a5,2
c00041f0:	00079a63          	bnez	a5,c0004204 <nr_free_pages+0x1c>
c00041f4:	0003b797          	auipc	a5,0x3b
c00041f8:	ae87a783          	lw	a5,-1304(a5) # c003ecdc <pmm_manager>
c00041fc:	0147a303          	lw	t1,20(a5)
c0004200:	00030067          	jr	t1
c0004204:	ff010113          	addi	sp,sp,-16
c0004208:	00112623          	sw	ra,12(sp)
c000420c:	00812423          	sw	s0,8(sp)
c0004210:	e14fc0ef          	jal	ra,c0000824 <intr_disable>
c0004214:	0003b797          	auipc	a5,0x3b
c0004218:	ac87a783          	lw	a5,-1336(a5) # c003ecdc <pmm_manager>
c000421c:	0147a783          	lw	a5,20(a5)
c0004220:	000780e7          	jalr	a5
c0004224:	00050413          	mv	s0,a0
c0004228:	df4fc0ef          	jal	ra,c000081c <intr_enable>
c000422c:	00c12083          	lw	ra,12(sp)
c0004230:	00040513          	mv	a0,s0
c0004234:	00812403          	lw	s0,8(sp)
c0004238:	01010113          	addi	sp,sp,16
c000423c:	00008067          	ret

c0004240 <get_pte>:
c0004240:	fe010113          	addi	sp,sp,-32
c0004244:	01212823          	sw	s2,16(sp)
c0004248:	0165d913          	srli	s2,a1,0x16
c000424c:	00291913          	slli	s2,s2,0x2
c0004250:	01250933          	add	s2,a0,s2
c0004254:	00092683          	lw	a3,0(s2)
c0004258:	00912a23          	sw	s1,20(sp)
c000425c:	00112e23          	sw	ra,28(sp)
c0004260:	00812c23          	sw	s0,24(sp)
c0004264:	01312623          	sw	s3,12(sp)
c0004268:	0016f793          	andi	a5,a3,1
c000426c:	00058493          	mv	s1,a1
c0004270:	08079663          	bnez	a5,c00042fc <get_pte+0xbc>
c0004274:	0c060e63          	beqz	a2,c0004350 <get_pte+0x110>
c0004278:	00100513          	li	a0,1
c000427c:	e55ff0ef          	jal	ra,c00040d0 <alloc_pages>
c0004280:	00050413          	mv	s0,a0
c0004284:	0c050663          	beqz	a0,c0004350 <get_pte+0x110>
c0004288:	0003b517          	auipc	a0,0x3b
c000428c:	a6052503          	lw	a0,-1440(a0) # c003ece8 <pages>
c0004290:	00100793          	li	a5,1
c0004294:	40a40533          	sub	a0,s0,a0
c0004298:	00f42023          	sw	a5,0(s0)
c000429c:	40555513          	srai	a0,a0,0x5
c00042a0:	000809b7          	lui	s3,0x80
c00042a4:	001007b7          	lui	a5,0x100
c00042a8:	01350533          	add	a0,a0,s3
c00042ac:	fff78793          	addi	a5,a5,-1 # fffff <_binary_obj___user_matrix_out_size+0xfd7f7>
c00042b0:	00f577b3          	and	a5,a0,a5
c00042b4:	0003b717          	auipc	a4,0x3b
c00042b8:	94872703          	lw	a4,-1720(a4) # c003ebfc <npage>
c00042bc:	00c51513          	slli	a0,a0,0xc
c00042c0:	0ce7f463          	bleu	a4,a5,c0004388 <get_pte+0x148>
c00042c4:	0003b797          	auipc	a5,0x3b
c00042c8:	a1c7a783          	lw	a5,-1508(a5) # c003ece0 <va_pa_offset>
c00042cc:	00001637          	lui	a2,0x1
c00042d0:	00000593          	li	a1,0
c00042d4:	00f50533          	add	a0,a0,a5
c00042d8:	334070ef          	jal	ra,c000b60c <memset>
c00042dc:	0003b697          	auipc	a3,0x3b
c00042e0:	a0c6a683          	lw	a3,-1524(a3) # c003ece8 <pages>
c00042e4:	40d406b3          	sub	a3,s0,a3
c00042e8:	4056d693          	srai	a3,a3,0x5
c00042ec:	013686b3          	add	a3,a3,s3
c00042f0:	00a69693          	slli	a3,a3,0xa
c00042f4:	0116e693          	ori	a3,a3,17
c00042f8:	00d92023          	sw	a3,0(s2)
c00042fc:	00269693          	slli	a3,a3,0x2
c0004300:	fffff537          	lui	a0,0xfffff
c0004304:	00a6f6b3          	and	a3,a3,a0
c0004308:	00c6d713          	srli	a4,a3,0xc
c000430c:	0003b797          	auipc	a5,0x3b
c0004310:	8f07a783          	lw	a5,-1808(a5) # c003ebfc <npage>
c0004314:	04f77e63          	bleu	a5,a4,c0004370 <get_pte+0x130>
c0004318:	00c4d513          	srli	a0,s1,0xc
c000431c:	01c12083          	lw	ra,28(sp)
c0004320:	3ff57513          	andi	a0,a0,1023
c0004324:	0003b797          	auipc	a5,0x3b
c0004328:	9bc7a783          	lw	a5,-1604(a5) # c003ece0 <va_pa_offset>
c000432c:	00f686b3          	add	a3,a3,a5
c0004330:	00251513          	slli	a0,a0,0x2
c0004334:	00a68533          	add	a0,a3,a0
c0004338:	01812403          	lw	s0,24(sp)
c000433c:	01412483          	lw	s1,20(sp)
c0004340:	01012903          	lw	s2,16(sp)
c0004344:	00c12983          	lw	s3,12(sp)
c0004348:	02010113          	addi	sp,sp,32
c000434c:	00008067          	ret
c0004350:	01c12083          	lw	ra,28(sp)
c0004354:	00000513          	li	a0,0
c0004358:	01812403          	lw	s0,24(sp)
c000435c:	01412483          	lw	s1,20(sp)
c0004360:	01012903          	lw	s2,16(sp)
c0004364:	00c12983          	lw	s3,12(sp)
c0004368:	02010113          	addi	sp,sp,32
c000436c:	00008067          	ret
c0004370:	00008617          	auipc	a2,0x8
c0004374:	6ec60613          	addi	a2,a2,1772 # c000ca5c <commands+0xcbc>
c0004378:	12800593          	li	a1,296
c000437c:	00009517          	auipc	a0,0x9
c0004380:	ec450513          	addi	a0,a0,-316 # c000d240 <default_pmm_manager+0x84>
c0004384:	ecdfb0ef          	jal	ra,c0000250 <__panic>
c0004388:	00050693          	mv	a3,a0
c000438c:	00008617          	auipc	a2,0x8
c0004390:	6d060613          	addi	a2,a2,1744 # c000ca5c <commands+0xcbc>
c0004394:	12500593          	li	a1,293
c0004398:	00009517          	auipc	a0,0x9
c000439c:	ea850513          	addi	a0,a0,-344 # c000d240 <default_pmm_manager+0x84>
c00043a0:	eb1fb0ef          	jal	ra,c0000250 <__panic>

c00043a4 <boot_map_segment>:
c00043a4:	fe010113          	addi	sp,sp,-32
c00043a8:	01312623          	sw	s3,12(sp)
c00043ac:	000019b7          	lui	s3,0x1
c00043b0:	00d5c7b3          	xor	a5,a1,a3
c00043b4:	fff98813          	addi	a6,s3,-1 # fff <_binary_obj___user_faultread_out_size-0xf69>
c00043b8:	00112e23          	sw	ra,28(sp)
c00043bc:	00812c23          	sw	s0,24(sp)
c00043c0:	00912a23          	sw	s1,20(sp)
c00043c4:	01212823          	sw	s2,16(sp)
c00043c8:	01412423          	sw	s4,8(sp)
c00043cc:	01512223          	sw	s5,4(sp)
c00043d0:	01612023          	sw	s6,0(sp)
c00043d4:	0107f7b3          	and	a5,a5,a6
c00043d8:	0a079c63          	bnez	a5,c0004490 <boot_map_segment+0xec>
c00043dc:	010607b3          	add	a5,a2,a6
c00043e0:	0105f833          	and	a6,a1,a6
c00043e4:	010787b3          	add	a5,a5,a6
c00043e8:	fffff937          	lui	s2,0xfffff
c00043ec:	00c7d793          	srli	a5,a5,0xc
c00043f0:	0125f5b3          	and	a1,a1,s2
c00043f4:	0126f6b3          	and	a3,a3,s2
c00043f8:	04078863          	beqz	a5,c0004448 <boot_map_segment+0xa4>
c00043fc:	00c79793          	slli	a5,a5,0xc
c0004400:	00100b13          	li	s6,1
c0004404:	00050a93          	mv	s5,a0
c0004408:	00058413          	mv	s0,a1
c000440c:	00b784b3          	add	s1,a5,a1
c0004410:	40b68933          	sub	s2,a3,a1
c0004414:	01676a33          	or	s4,a4,s6
c0004418:	000b0613          	mv	a2,s6
c000441c:	00040593          	mv	a1,s0
c0004420:	000a8513          	mv	a0,s5
c0004424:	e1dff0ef          	jal	ra,c0004240 <get_pte>
c0004428:	008907b3          	add	a5,s2,s0
c000442c:	04050263          	beqz	a0,c0004470 <boot_map_segment+0xcc>
c0004430:	00c7d793          	srli	a5,a5,0xc
c0004434:	00a79793          	slli	a5,a5,0xa
c0004438:	0147e7b3          	or	a5,a5,s4
c000443c:	00f52023          	sw	a5,0(a0)
c0004440:	01340433          	add	s0,s0,s3
c0004444:	fc849ae3          	bne	s1,s0,c0004418 <boot_map_segment+0x74>
c0004448:	01c12083          	lw	ra,28(sp)
c000444c:	01812403          	lw	s0,24(sp)
c0004450:	01412483          	lw	s1,20(sp)
c0004454:	01012903          	lw	s2,16(sp)
c0004458:	00c12983          	lw	s3,12(sp)
c000445c:	00812a03          	lw	s4,8(sp)
c0004460:	00412a83          	lw	s5,4(sp)
c0004464:	00012b03          	lw	s6,0(sp)
c0004468:	02010113          	addi	sp,sp,32
c000446c:	00008067          	ret
c0004470:	00009697          	auipc	a3,0x9
c0004474:	d9468693          	addi	a3,a3,-620 # c000d204 <default_pmm_manager+0x48>
c0004478:	00008617          	auipc	a2,0x8
c000447c:	d0060613          	addi	a2,a2,-768 # c000c178 <commands+0x3d8>
c0004480:	0ac00593          	li	a1,172
c0004484:	00009517          	auipc	a0,0x9
c0004488:	dbc50513          	addi	a0,a0,-580 # c000d240 <default_pmm_manager+0x84>
c000448c:	dc5fb0ef          	jal	ra,c0000250 <__panic>
c0004490:	00009697          	auipc	a3,0x9
c0004494:	d5c68693          	addi	a3,a3,-676 # c000d1ec <default_pmm_manager+0x30>
c0004498:	00008617          	auipc	a2,0x8
c000449c:	ce060613          	addi	a2,a2,-800 # c000c178 <commands+0x3d8>
c00044a0:	0a600593          	li	a1,166
c00044a4:	00009517          	auipc	a0,0x9
c00044a8:	d9c50513          	addi	a0,a0,-612 # c000d240 <default_pmm_manager+0x84>
c00044ac:	da5fb0ef          	jal	ra,c0000250 <__panic>

c00044b0 <get_page>:
c00044b0:	ff010113          	addi	sp,sp,-16
c00044b4:	00812423          	sw	s0,8(sp)
c00044b8:	00060413          	mv	s0,a2
c00044bc:	00000613          	li	a2,0
c00044c0:	00112623          	sw	ra,12(sp)
c00044c4:	d7dff0ef          	jal	ra,c0004240 <get_pte>
c00044c8:	00040463          	beqz	s0,c00044d0 <get_page+0x20>
c00044cc:	00a42023          	sw	a0,0(s0)
c00044d0:	04050663          	beqz	a0,c000451c <get_page+0x6c>
c00044d4:	00052783          	lw	a5,0(a0)
c00044d8:	0017f713          	andi	a4,a5,1
c00044dc:	04070063          	beqz	a4,c000451c <get_page+0x6c>
c00044e0:	00279793          	slli	a5,a5,0x2
c00044e4:	00c7d793          	srli	a5,a5,0xc
c00044e8:	0003a717          	auipc	a4,0x3a
c00044ec:	71472703          	lw	a4,1812(a4) # c003ebfc <npage>
c00044f0:	04e7f063          	bleu	a4,a5,c0004530 <get_page+0x80>
c00044f4:	fff80537          	lui	a0,0xfff80
c00044f8:	00c12083          	lw	ra,12(sp)
c00044fc:	00a787b3          	add	a5,a5,a0
c0004500:	00579793          	slli	a5,a5,0x5
c0004504:	0003a517          	auipc	a0,0x3a
c0004508:	7e452503          	lw	a0,2020(a0) # c003ece8 <pages>
c000450c:	00f50533          	add	a0,a0,a5
c0004510:	00812403          	lw	s0,8(sp)
c0004514:	01010113          	addi	sp,sp,16
c0004518:	00008067          	ret
c000451c:	00c12083          	lw	ra,12(sp)
c0004520:	00000513          	li	a0,0
c0004524:	00812403          	lw	s0,8(sp)
c0004528:	01010113          	addi	sp,sp,16
c000452c:	00008067          	ret
c0004530:	b81ff0ef          	jal	ra,c00040b0 <pa2page.part.6>

c0004534 <unmap_range>:
c0004534:	fd010113          	addi	sp,sp,-48
c0004538:	00c5e7b3          	or	a5,a1,a2
c000453c:	02112623          	sw	ra,44(sp)
c0004540:	02812423          	sw	s0,40(sp)
c0004544:	02912223          	sw	s1,36(sp)
c0004548:	03212023          	sw	s2,32(sp)
c000454c:	01312e23          	sw	s3,28(sp)
c0004550:	01412c23          	sw	s4,24(sp)
c0004554:	01512a23          	sw	s5,20(sp)
c0004558:	01612823          	sw	s6,16(sp)
c000455c:	01712623          	sw	s7,12(sp)
c0004560:	01812423          	sw	s8,8(sp)
c0004564:	01479713          	slli	a4,a5,0x14
c0004568:	12071063          	bnez	a4,c0004688 <unmap_range+0x154>
c000456c:	002007b7          	lui	a5,0x200
c0004570:	00058413          	mv	s0,a1
c0004574:	0ef5ea63          	bltu	a1,a5,c0004668 <unmap_range+0x134>
c0004578:	00060913          	mv	s2,a2
c000457c:	0ec5f663          	bleu	a2,a1,c0004668 <unmap_range+0x134>
c0004580:	b00007b7          	lui	a5,0xb0000
c0004584:	00050993          	mv	s3,a0
c0004588:	00400b37          	lui	s6,0x400
c000458c:	ffc00ab7          	lui	s5,0xffc00
c0004590:	00001a37          	lui	s4,0x1
c0004594:	fff80bb7          	lui	s7,0xfff80
c0004598:	00100c13          	li	s8,1
c000459c:	0cc7e663          	bltu	a5,a2,c0004668 <unmap_range+0x134>
c00045a0:	00000613          	li	a2,0
c00045a4:	00040593          	mv	a1,s0
c00045a8:	00098513          	mv	a0,s3
c00045ac:	c95ff0ef          	jal	ra,c0004240 <get_pte>
c00045b0:	00050493          	mv	s1,a0
c00045b4:	08050a63          	beqz	a0,c0004648 <unmap_range+0x114>
c00045b8:	00052783          	lw	a5,0(a0)
c00045bc:	02079e63          	bnez	a5,c00045f8 <unmap_range+0xc4>
c00045c0:	01440433          	add	s0,s0,s4
c00045c4:	fd246ee3          	bltu	s0,s2,c00045a0 <unmap_range+0x6c>
c00045c8:	02c12083          	lw	ra,44(sp)
c00045cc:	02812403          	lw	s0,40(sp)
c00045d0:	02412483          	lw	s1,36(sp)
c00045d4:	02012903          	lw	s2,32(sp)
c00045d8:	01c12983          	lw	s3,28(sp)
c00045dc:	01812a03          	lw	s4,24(sp)
c00045e0:	01412a83          	lw	s5,20(sp)
c00045e4:	01012b03          	lw	s6,16(sp)
c00045e8:	00c12b83          	lw	s7,12(sp)
c00045ec:	00812c03          	lw	s8,8(sp)
c00045f0:	03010113          	addi	sp,sp,48
c00045f4:	00008067          	ret
c00045f8:	0017f713          	andi	a4,a5,1
c00045fc:	fc0702e3          	beqz	a4,c00045c0 <unmap_range+0x8c>
c0004600:	00279793          	slli	a5,a5,0x2
c0004604:	00c7d793          	srli	a5,a5,0xc
c0004608:	0003a717          	auipc	a4,0x3a
c000460c:	5f472703          	lw	a4,1524(a4) # c003ebfc <npage>
c0004610:	08e7fc63          	bleu	a4,a5,c00046a8 <unmap_range+0x174>
c0004614:	017787b3          	add	a5,a5,s7
c0004618:	00579793          	slli	a5,a5,0x5
c000461c:	0003a517          	auipc	a0,0x3a
c0004620:	6cc52503          	lw	a0,1740(a0) # c003ece8 <pages>
c0004624:	00f50533          	add	a0,a0,a5
c0004628:	00052783          	lw	a5,0(a0)
c000462c:	fff78793          	addi	a5,a5,-1 # afffffff <sbi_remote_fence_i+0xb000070f>
c0004630:	00f52023          	sw	a5,0(a0)
c0004634:	02078463          	beqz	a5,c000465c <unmap_range+0x128>
c0004638:	0004a023          	sw	zero,0(s1)
c000463c:	10440073          	sfence.vm	s0
c0004640:	01440433          	add	s0,s0,s4
c0004644:	f81ff06f          	j	c00045c4 <unmap_range+0x90>
c0004648:	01640433          	add	s0,s0,s6
c000464c:	01547433          	and	s0,s0,s5
c0004650:	f6040ce3          	beqz	s0,c00045c8 <unmap_range+0x94>
c0004654:	f52466e3          	bltu	s0,s2,c00045a0 <unmap_range+0x6c>
c0004658:	f71ff06f          	j	c00045c8 <unmap_range+0x94>
c000465c:	000c0593          	mv	a1,s8
c0004660:	b25ff0ef          	jal	ra,c0004184 <free_pages>
c0004664:	fd5ff06f          	j	c0004638 <unmap_range+0x104>
c0004668:	00009697          	auipc	a3,0x9
c000466c:	20c68693          	addi	a3,a3,524 # c000d874 <default_pmm_manager+0x6b8>
c0004670:	00008617          	auipc	a2,0x8
c0004674:	b0860613          	addi	a2,a2,-1272 # c000c178 <commands+0x3d8>
c0004678:	16000593          	li	a1,352
c000467c:	00009517          	auipc	a0,0x9
c0004680:	bc450513          	addi	a0,a0,-1084 # c000d240 <default_pmm_manager+0x84>
c0004684:	bcdfb0ef          	jal	ra,c0000250 <__panic>
c0004688:	00009697          	auipc	a3,0x9
c000468c:	1c068693          	addi	a3,a3,448 # c000d848 <default_pmm_manager+0x68c>
c0004690:	00008617          	auipc	a2,0x8
c0004694:	ae860613          	addi	a2,a2,-1304 # c000c178 <commands+0x3d8>
c0004698:	15f00593          	li	a1,351
c000469c:	00009517          	auipc	a0,0x9
c00046a0:	ba450513          	addi	a0,a0,-1116 # c000d240 <default_pmm_manager+0x84>
c00046a4:	badfb0ef          	jal	ra,c0000250 <__panic>
c00046a8:	a09ff0ef          	jal	ra,c00040b0 <pa2page.part.6>

c00046ac <exit_range>:
c00046ac:	fe010113          	addi	sp,sp,-32
c00046b0:	00c5e7b3          	or	a5,a1,a2
c00046b4:	00112e23          	sw	ra,28(sp)
c00046b8:	00812c23          	sw	s0,24(sp)
c00046bc:	00912a23          	sw	s1,20(sp)
c00046c0:	01212823          	sw	s2,16(sp)
c00046c4:	01312623          	sw	s3,12(sp)
c00046c8:	01412423          	sw	s4,8(sp)
c00046cc:	01512223          	sw	s5,4(sp)
c00046d0:	01612023          	sw	s6,0(sp)
c00046d4:	01479713          	slli	a4,a5,0x14
c00046d8:	0e071863          	bnez	a4,c00047c8 <exit_range+0x11c>
c00046dc:	002007b7          	lui	a5,0x200
c00046e0:	0cf5e463          	bltu	a1,a5,c00047a8 <exit_range+0xfc>
c00046e4:	00060a13          	mv	s4,a2
c00046e8:	0cc5f063          	bleu	a2,a1,c00047a8 <exit_range+0xfc>
c00046ec:	ffc004b7          	lui	s1,0xffc00
c00046f0:	b00007b7          	lui	a5,0xb0000
c00046f4:	00050a93          	mv	s5,a0
c00046f8:	0095f4b3          	and	s1,a1,s1
c00046fc:	fff809b7          	lui	s3,0xfff80
c0004700:	00100913          	li	s2,1
c0004704:	00400b37          	lui	s6,0x400
c0004708:	00c7f663          	bleu	a2,a5,c0004714 <exit_range+0x68>
c000470c:	09c0006f          	j	c00047a8 <exit_range+0xfc>
c0004710:	0544fc63          	bleu	s4,s1,c0004768 <exit_range+0xbc>
c0004714:	0164d413          	srli	s0,s1,0x16
c0004718:	00241413          	slli	s0,s0,0x2
c000471c:	008a8433          	add	s0,s5,s0
c0004720:	00042783          	lw	a5,0(s0)
c0004724:	0017f713          	andi	a4,a5,1
c0004728:	02070c63          	beqz	a4,c0004760 <exit_range+0xb4>
c000472c:	00279793          	slli	a5,a5,0x2
c0004730:	00c7d793          	srli	a5,a5,0xc
c0004734:	0003a717          	auipc	a4,0x3a
c0004738:	4c872703          	lw	a4,1224(a4) # c003ebfc <npage>
c000473c:	04e7fa63          	bleu	a4,a5,c0004790 <exit_range+0xe4>
c0004740:	013787b3          	add	a5,a5,s3
c0004744:	00579793          	slli	a5,a5,0x5
c0004748:	0003a517          	auipc	a0,0x3a
c000474c:	5a052503          	lw	a0,1440(a0) # c003ece8 <pages>
c0004750:	00090593          	mv	a1,s2
c0004754:	00f50533          	add	a0,a0,a5
c0004758:	a2dff0ef          	jal	ra,c0004184 <free_pages>
c000475c:	00042023          	sw	zero,0(s0)
c0004760:	016484b3          	add	s1,s1,s6
c0004764:	fa0496e3          	bnez	s1,c0004710 <exit_range+0x64>
c0004768:	01c12083          	lw	ra,28(sp)
c000476c:	01812403          	lw	s0,24(sp)
c0004770:	01412483          	lw	s1,20(sp)
c0004774:	01012903          	lw	s2,16(sp)
c0004778:	00c12983          	lw	s3,12(sp)
c000477c:	00812a03          	lw	s4,8(sp)
c0004780:	00412a83          	lw	s5,4(sp)
c0004784:	00012b03          	lw	s6,0(sp)
c0004788:	02010113          	addi	sp,sp,32
c000478c:	00008067          	ret
c0004790:	00008617          	auipc	a2,0x8
c0004794:	06460613          	addi	a2,a2,100 # c000c7f4 <commands+0xa54>
c0004798:	06100593          	li	a1,97
c000479c:	00008517          	auipc	a0,0x8
c00047a0:	07850513          	addi	a0,a0,120 # c000c814 <commands+0xa74>
c00047a4:	aadfb0ef          	jal	ra,c0000250 <__panic>
c00047a8:	00009697          	auipc	a3,0x9
c00047ac:	0cc68693          	addi	a3,a3,204 # c000d874 <default_pmm_manager+0x6b8>
c00047b0:	00008617          	auipc	a2,0x8
c00047b4:	9c860613          	addi	a2,a2,-1592 # c000c178 <commands+0x3d8>
c00047b8:	17100593          	li	a1,369
c00047bc:	00009517          	auipc	a0,0x9
c00047c0:	a8450513          	addi	a0,a0,-1404 # c000d240 <default_pmm_manager+0x84>
c00047c4:	a8dfb0ef          	jal	ra,c0000250 <__panic>
c00047c8:	00009697          	auipc	a3,0x9
c00047cc:	08068693          	addi	a3,a3,128 # c000d848 <default_pmm_manager+0x68c>
c00047d0:	00008617          	auipc	a2,0x8
c00047d4:	9a860613          	addi	a2,a2,-1624 # c000c178 <commands+0x3d8>
c00047d8:	17000593          	li	a1,368
c00047dc:	00009517          	auipc	a0,0x9
c00047e0:	a6450513          	addi	a0,a0,-1436 # c000d240 <default_pmm_manager+0x84>
c00047e4:	a6dfb0ef          	jal	ra,c0000250 <__panic>

c00047e8 <page_remove>:
c00047e8:	ff010113          	addi	sp,sp,-16
c00047ec:	00000613          	li	a2,0
c00047f0:	00912223          	sw	s1,4(sp)
c00047f4:	00112623          	sw	ra,12(sp)
c00047f8:	00812423          	sw	s0,8(sp)
c00047fc:	00058493          	mv	s1,a1
c0004800:	a41ff0ef          	jal	ra,c0004240 <get_pte>
c0004804:	00050a63          	beqz	a0,c0004818 <page_remove+0x30>
c0004808:	00052783          	lw	a5,0(a0)
c000480c:	00050413          	mv	s0,a0
c0004810:	0017f713          	andi	a4,a5,1
c0004814:	00071c63          	bnez	a4,c000482c <page_remove+0x44>
c0004818:	00c12083          	lw	ra,12(sp)
c000481c:	00812403          	lw	s0,8(sp)
c0004820:	00412483          	lw	s1,4(sp)
c0004824:	01010113          	addi	sp,sp,16
c0004828:	00008067          	ret
c000482c:	00279793          	slli	a5,a5,0x2
c0004830:	00c7d793          	srli	a5,a5,0xc
c0004834:	0003a717          	auipc	a4,0x3a
c0004838:	3c872703          	lw	a4,968(a4) # c003ebfc <npage>
c000483c:	04e7fa63          	bleu	a4,a5,c0004890 <page_remove+0xa8>
c0004840:	fff80537          	lui	a0,0xfff80
c0004844:	00a787b3          	add	a5,a5,a0
c0004848:	00579793          	slli	a5,a5,0x5
c000484c:	0003a517          	auipc	a0,0x3a
c0004850:	49c52503          	lw	a0,1180(a0) # c003ece8 <pages>
c0004854:	00f50533          	add	a0,a0,a5
c0004858:	00052783          	lw	a5,0(a0)
c000485c:	fff78793          	addi	a5,a5,-1 # afffffff <sbi_remote_fence_i+0xb000070f>
c0004860:	00f52023          	sw	a5,0(a0)
c0004864:	02078063          	beqz	a5,c0004884 <page_remove+0x9c>
c0004868:	00042023          	sw	zero,0(s0)
c000486c:	10448073          	sfence.vm	s1
c0004870:	00c12083          	lw	ra,12(sp)
c0004874:	00812403          	lw	s0,8(sp)
c0004878:	00412483          	lw	s1,4(sp)
c000487c:	01010113          	addi	sp,sp,16
c0004880:	00008067          	ret
c0004884:	00100593          	li	a1,1
c0004888:	8fdff0ef          	jal	ra,c0004184 <free_pages>
c000488c:	fddff06f          	j	c0004868 <page_remove+0x80>
c0004890:	821ff0ef          	jal	ra,c00040b0 <pa2page.part.6>

c0004894 <page_insert>:
c0004894:	fe010113          	addi	sp,sp,-32
c0004898:	01312623          	sw	s3,12(sp)
c000489c:	00060993          	mv	s3,a2
c00048a0:	00812c23          	sw	s0,24(sp)
c00048a4:	00100613          	li	a2,1
c00048a8:	00058413          	mv	s0,a1
c00048ac:	00098593          	mv	a1,s3
c00048b0:	01212823          	sw	s2,16(sp)
c00048b4:	00112e23          	sw	ra,28(sp)
c00048b8:	00912a23          	sw	s1,20(sp)
c00048bc:	00068913          	mv	s2,a3
c00048c0:	981ff0ef          	jal	ra,c0004240 <get_pte>
c00048c4:	0c050a63          	beqz	a0,c0004998 <page_insert+0x104>
c00048c8:	00042703          	lw	a4,0(s0)
c00048cc:	00050493          	mv	s1,a0
c00048d0:	00170793          	addi	a5,a4,1
c00048d4:	00f42023          	sw	a5,0(s0)
c00048d8:	00052783          	lw	a5,0(a0)
c00048dc:	0017f693          	andi	a3,a5,1
c00048e0:	04069863          	bnez	a3,c0004930 <page_insert+0x9c>
c00048e4:	0003a697          	auipc	a3,0x3a
c00048e8:	4046a683          	lw	a3,1028(a3) # c003ece8 <pages>
c00048ec:	40d40433          	sub	s0,s0,a3
c00048f0:	40545413          	srai	s0,s0,0x5
c00048f4:	000806b7          	lui	a3,0x80
c00048f8:	00d40433          	add	s0,s0,a3
c00048fc:	00a41413          	slli	s0,s0,0xa
c0004900:	00196693          	ori	a3,s2,1
c0004904:	00d466b3          	or	a3,s0,a3
c0004908:	00d4a023          	sw	a3,0(s1) # ffc00000 <sbi_remote_fence_i+0xffc00710>
c000490c:	10498073          	sfence.vm	s3
c0004910:	00000513          	li	a0,0
c0004914:	01c12083          	lw	ra,28(sp)
c0004918:	01812403          	lw	s0,24(sp)
c000491c:	01412483          	lw	s1,20(sp)
c0004920:	01012903          	lw	s2,16(sp)
c0004924:	00c12983          	lw	s3,12(sp)
c0004928:	02010113          	addi	sp,sp,32
c000492c:	00008067          	ret
c0004930:	00279793          	slli	a5,a5,0x2
c0004934:	00c7d793          	srli	a5,a5,0xc
c0004938:	0003a697          	auipc	a3,0x3a
c000493c:	2c46a683          	lw	a3,708(a3) # c003ebfc <npage>
c0004940:	06d7f063          	bleu	a3,a5,c00049a0 <page_insert+0x10c>
c0004944:	fff80537          	lui	a0,0xfff80
c0004948:	00a78533          	add	a0,a5,a0
c000494c:	0003a697          	auipc	a3,0x3a
c0004950:	39c6a683          	lw	a3,924(a3) # c003ece8 <pages>
c0004954:	00551513          	slli	a0,a0,0x5
c0004958:	00a68533          	add	a0,a3,a0
c000495c:	00a40e63          	beq	s0,a0,c0004978 <page_insert+0xe4>
c0004960:	00052783          	lw	a5,0(a0) # fff80000 <sbi_remote_fence_i+0xfff80710>
c0004964:	fff78793          	addi	a5,a5,-1
c0004968:	00f52023          	sw	a5,0(a0)
c000496c:	00078a63          	beqz	a5,c0004980 <page_insert+0xec>
c0004970:	10498073          	sfence.vm	s3
c0004974:	f79ff06f          	j	c00048ec <page_insert+0x58>
c0004978:	00e42023          	sw	a4,0(s0)
c000497c:	f71ff06f          	j	c00048ec <page_insert+0x58>
c0004980:	00100593          	li	a1,1
c0004984:	801ff0ef          	jal	ra,c0004184 <free_pages>
c0004988:	0003a697          	auipc	a3,0x3a
c000498c:	3606a683          	lw	a3,864(a3) # c003ece8 <pages>
c0004990:	10498073          	sfence.vm	s3
c0004994:	f59ff06f          	j	c00048ec <page_insert+0x58>
c0004998:	ffc00513          	li	a0,-4
c000499c:	f79ff06f          	j	c0004914 <page_insert+0x80>
c00049a0:	f10ff0ef          	jal	ra,c00040b0 <pa2page.part.6>

c00049a4 <copy_range>:
c00049a4:	fc010113          	addi	sp,sp,-64
c00049a8:	00d667b3          	or	a5,a2,a3
c00049ac:	02112e23          	sw	ra,60(sp)
c00049b0:	02812c23          	sw	s0,56(sp)
c00049b4:	02912a23          	sw	s1,52(sp)
c00049b8:	03212823          	sw	s2,48(sp)
c00049bc:	03312623          	sw	s3,44(sp)
c00049c0:	03412423          	sw	s4,40(sp)
c00049c4:	03512223          	sw	s5,36(sp)
c00049c8:	03612023          	sw	s6,32(sp)
c00049cc:	01712e23          	sw	s7,28(sp)
c00049d0:	01812c23          	sw	s8,24(sp)
c00049d4:	01912a23          	sw	s9,20(sp)
c00049d8:	01a12823          	sw	s10,16(sp)
c00049dc:	01b12623          	sw	s11,12(sp)
c00049e0:	01479713          	slli	a4,a5,0x14
c00049e4:	24071c63          	bnez	a4,c0004c3c <copy_range+0x298>
c00049e8:	002007b7          	lui	a5,0x200
c00049ec:	00060413          	mv	s0,a2
c00049f0:	1ef66863          	bltu	a2,a5,c0004be0 <copy_range+0x23c>
c00049f4:	00068493          	mv	s1,a3
c00049f8:	1ed67463          	bleu	a3,a2,c0004be0 <copy_range+0x23c>
c00049fc:	b00007b7          	lui	a5,0xb0000
c0004a00:	1ed7e063          	bltu	a5,a3,c0004be0 <copy_range+0x23c>
c0004a04:	00100a37          	lui	s4,0x100
c0004a08:	00050b13          	mv	s6,a0
c0004a0c:	00058993          	mv	s3,a1
c0004a10:	00001937          	lui	s2,0x1
c0004a14:	00100a93          	li	s5,1
c0004a18:	fff80cb7          	lui	s9,0xfff80
c0004a1c:	00080bb7          	lui	s7,0x80
c0004a20:	fffa0a13          	addi	s4,s4,-1 # fffff <_binary_obj___user_matrix_out_size+0xfd7f7>
c0004a24:	00000613          	li	a2,0
c0004a28:	00040593          	mv	a1,s0
c0004a2c:	00098513          	mv	a0,s3
c0004a30:	811ff0ef          	jal	ra,c0004240 <get_pte>
c0004a34:	00050c13          	mv	s8,a0
c0004a38:	14050463          	beqz	a0,c0004b80 <copy_range+0x1dc>
c0004a3c:	00052783          	lw	a5,0(a0)
c0004a40:	0017f793          	andi	a5,a5,1
c0004a44:	04079663          	bnez	a5,c0004a90 <copy_range+0xec>
c0004a48:	01240433          	add	s0,s0,s2
c0004a4c:	fc946ce3          	bltu	s0,s1,c0004a24 <copy_range+0x80>
c0004a50:	00000513          	li	a0,0
c0004a54:	03c12083          	lw	ra,60(sp)
c0004a58:	03812403          	lw	s0,56(sp)
c0004a5c:	03412483          	lw	s1,52(sp)
c0004a60:	03012903          	lw	s2,48(sp)
c0004a64:	02c12983          	lw	s3,44(sp)
c0004a68:	02812a03          	lw	s4,40(sp)
c0004a6c:	02412a83          	lw	s5,36(sp)
c0004a70:	02012b03          	lw	s6,32(sp)
c0004a74:	01c12b83          	lw	s7,28(sp)
c0004a78:	01812c03          	lw	s8,24(sp)
c0004a7c:	01412c83          	lw	s9,20(sp)
c0004a80:	01012d03          	lw	s10,16(sp)
c0004a84:	00c12d83          	lw	s11,12(sp)
c0004a88:	04010113          	addi	sp,sp,64
c0004a8c:	00008067          	ret
c0004a90:	000a8613          	mv	a2,s5
c0004a94:	00040593          	mv	a1,s0
c0004a98:	000b0513          	mv	a0,s6
c0004a9c:	fa4ff0ef          	jal	ra,c0004240 <get_pte>
c0004aa0:	0e050e63          	beqz	a0,c0004b9c <copy_range+0x1f8>
c0004aa4:	000c2783          	lw	a5,0(s8)
c0004aa8:	0017f713          	andi	a4,a5,1
c0004aac:	01f7fc13          	andi	s8,a5,31
c0004ab0:	16070a63          	beqz	a4,c0004c24 <copy_range+0x280>
c0004ab4:	00279793          	slli	a5,a5,0x2
c0004ab8:	00c7d793          	srli	a5,a5,0xc
c0004abc:	0003a717          	auipc	a4,0x3a
c0004ac0:	14072703          	lw	a4,320(a4) # c003ebfc <npage>
c0004ac4:	14e7fe63          	bleu	a4,a5,c0004c20 <copy_range+0x27c>
c0004ac8:	019787b3          	add	a5,a5,s9
c0004acc:	00579713          	slli	a4,a5,0x5
c0004ad0:	000a8513          	mv	a0,s5
c0004ad4:	0003a797          	auipc	a5,0x3a
c0004ad8:	2147a783          	lw	a5,532(a5) # c003ece8 <pages>
c0004adc:	00e78db3          	add	s11,a5,a4
c0004ae0:	df0ff0ef          	jal	ra,c00040d0 <alloc_pages>
c0004ae4:	00050d13          	mv	s10,a0
c0004ae8:	0c0d8c63          	beqz	s11,c0004bc0 <copy_range+0x21c>
c0004aec:	10050a63          	beqz	a0,c0004c00 <copy_range+0x25c>
c0004af0:	0003a717          	auipc	a4,0x3a
c0004af4:	1f872703          	lw	a4,504(a4) # c003ece8 <pages>
c0004af8:	40ed86b3          	sub	a3,s11,a4
c0004afc:	4056d693          	srai	a3,a3,0x5
c0004b00:	017686b3          	add	a3,a3,s7
c0004b04:	0146f7b3          	and	a5,a3,s4
c0004b08:	0003a617          	auipc	a2,0x3a
c0004b0c:	0f462603          	lw	a2,244(a2) # c003ebfc <npage>
c0004b10:	00c69693          	slli	a3,a3,0xc
c0004b14:	08c7fa63          	bleu	a2,a5,c0004ba8 <copy_range+0x204>
c0004b18:	40e507b3          	sub	a5,a0,a4
c0004b1c:	4057d793          	srai	a5,a5,0x5
c0004b20:	017787b3          	add	a5,a5,s7
c0004b24:	0003a517          	auipc	a0,0x3a
c0004b28:	1bc52503          	lw	a0,444(a0) # c003ece0 <va_pa_offset>
c0004b2c:	0147f733          	and	a4,a5,s4
c0004b30:	00a685b3          	add	a1,a3,a0
c0004b34:	00c79793          	slli	a5,a5,0xc
c0004b38:	06c77663          	bleu	a2,a4,c0004ba4 <copy_range+0x200>
c0004b3c:	00090613          	mv	a2,s2
c0004b40:	00a78533          	add	a0,a5,a0
c0004b44:	2e5060ef          	jal	ra,c000b628 <memcpy>
c0004b48:	000c0693          	mv	a3,s8
c0004b4c:	00040613          	mv	a2,s0
c0004b50:	000d0593          	mv	a1,s10
c0004b54:	000b0513          	mv	a0,s6
c0004b58:	d3dff0ef          	jal	ra,c0004894 <page_insert>
c0004b5c:	ee0506e3          	beqz	a0,c0004a48 <copy_range+0xa4>
c0004b60:	00008697          	auipc	a3,0x8
c0004b64:	6d468693          	addi	a3,a3,1748 # c000d234 <default_pmm_manager+0x78>
c0004b68:	00007617          	auipc	a2,0x7
c0004b6c:	61060613          	addi	a2,a2,1552 # c000c178 <commands+0x3d8>
c0004b70:	1b900593          	li	a1,441
c0004b74:	00008517          	auipc	a0,0x8
c0004b78:	6cc50513          	addi	a0,a0,1740 # c000d240 <default_pmm_manager+0x84>
c0004b7c:	ed4fb0ef          	jal	ra,c0000250 <__panic>
c0004b80:	004007b7          	lui	a5,0x400
c0004b84:	00f40433          	add	s0,s0,a5
c0004b88:	ffc007b7          	lui	a5,0xffc00
c0004b8c:	00f47433          	and	s0,s0,a5
c0004b90:	ec0400e3          	beqz	s0,c0004a50 <copy_range+0xac>
c0004b94:	e89468e3          	bltu	s0,s1,c0004a24 <copy_range+0x80>
c0004b98:	eb9ff06f          	j	c0004a50 <copy_range+0xac>
c0004b9c:	ffc00513          	li	a0,-4
c0004ba0:	eb5ff06f          	j	c0004a54 <copy_range+0xb0>
c0004ba4:	00078693          	mv	a3,a5
c0004ba8:	00008617          	auipc	a2,0x8
c0004bac:	eb460613          	addi	a2,a2,-332 # c000ca5c <commands+0xcbc>
c0004bb0:	06800593          	li	a1,104
c0004bb4:	00008517          	auipc	a0,0x8
c0004bb8:	c6050513          	addi	a0,a0,-928 # c000c814 <commands+0xa74>
c0004bbc:	e94fb0ef          	jal	ra,c0000250 <__panic>
c0004bc0:	00008697          	auipc	a3,0x8
c0004bc4:	65468693          	addi	a3,a3,1620 # c000d214 <default_pmm_manager+0x58>
c0004bc8:	00007617          	auipc	a2,0x7
c0004bcc:	5b060613          	addi	a2,a2,1456 # c000c178 <commands+0x3d8>
c0004bd0:	19e00593          	li	a1,414
c0004bd4:	00008517          	auipc	a0,0x8
c0004bd8:	66c50513          	addi	a0,a0,1644 # c000d240 <default_pmm_manager+0x84>
c0004bdc:	e74fb0ef          	jal	ra,c0000250 <__panic>
c0004be0:	00009697          	auipc	a3,0x9
c0004be4:	c9468693          	addi	a3,a3,-876 # c000d874 <default_pmm_manager+0x6b8>
c0004be8:	00007617          	auipc	a2,0x7
c0004bec:	59060613          	addi	a2,a2,1424 # c000c178 <commands+0x3d8>
c0004bf0:	18a00593          	li	a1,394
c0004bf4:	00008517          	auipc	a0,0x8
c0004bf8:	64c50513          	addi	a0,a0,1612 # c000d240 <default_pmm_manager+0x84>
c0004bfc:	e54fb0ef          	jal	ra,c0000250 <__panic>
c0004c00:	00008697          	auipc	a3,0x8
c0004c04:	62468693          	addi	a3,a3,1572 # c000d224 <default_pmm_manager+0x68>
c0004c08:	00007617          	auipc	a2,0x7
c0004c0c:	57060613          	addi	a2,a2,1392 # c000c178 <commands+0x3d8>
c0004c10:	19f00593          	li	a1,415
c0004c14:	00008517          	auipc	a0,0x8
c0004c18:	62c50513          	addi	a0,a0,1580 # c000d240 <default_pmm_manager+0x84>
c0004c1c:	e34fb0ef          	jal	ra,c0000250 <__panic>
c0004c20:	c90ff0ef          	jal	ra,c00040b0 <pa2page.part.6>
c0004c24:	00008617          	auipc	a2,0x8
c0004c28:	12060613          	addi	a2,a2,288 # c000cd44 <commands+0xfa4>
c0004c2c:	07300593          	li	a1,115
c0004c30:	00008517          	auipc	a0,0x8
c0004c34:	be450513          	addi	a0,a0,-1052 # c000c814 <commands+0xa74>
c0004c38:	e18fb0ef          	jal	ra,c0000250 <__panic>
c0004c3c:	00009697          	auipc	a3,0x9
c0004c40:	c0c68693          	addi	a3,a3,-1012 # c000d848 <default_pmm_manager+0x68c>
c0004c44:	00007617          	auipc	a2,0x7
c0004c48:	53460613          	addi	a2,a2,1332 # c000c178 <commands+0x3d8>
c0004c4c:	18900593          	li	a1,393
c0004c50:	00008517          	auipc	a0,0x8
c0004c54:	5f050513          	addi	a0,a0,1520 # c000d240 <default_pmm_manager+0x84>
c0004c58:	df8fb0ef          	jal	ra,c0000250 <__panic>

c0004c5c <tlb_invalidate>:
c0004c5c:	10458073          	sfence.vm	a1
c0004c60:	00008067          	ret

c0004c64 <pgdir_alloc_page>:
c0004c64:	fe010113          	addi	sp,sp,-32
c0004c68:	01212823          	sw	s2,16(sp)
c0004c6c:	00050913          	mv	s2,a0
c0004c70:	00100513          	li	a0,1
c0004c74:	00812c23          	sw	s0,24(sp)
c0004c78:	00912a23          	sw	s1,20(sp)
c0004c7c:	01312623          	sw	s3,12(sp)
c0004c80:	00112e23          	sw	ra,28(sp)
c0004c84:	00058493          	mv	s1,a1
c0004c88:	00060993          	mv	s3,a2
c0004c8c:	c44ff0ef          	jal	ra,c00040d0 <alloc_pages>
c0004c90:	00050413          	mv	s0,a0
c0004c94:	04050a63          	beqz	a0,c0004ce8 <pgdir_alloc_page+0x84>
c0004c98:	00050593          	mv	a1,a0
c0004c9c:	00098693          	mv	a3,s3
c0004ca0:	00048613          	mv	a2,s1
c0004ca4:	00090513          	mv	a0,s2
c0004ca8:	bedff0ef          	jal	ra,c0004894 <page_insert>
c0004cac:	06051e63          	bnez	a0,c0004d28 <pgdir_alloc_page+0xc4>
c0004cb0:	0003a797          	auipc	a5,0x3a
c0004cb4:	f447a783          	lw	a5,-188(a5) # c003ebf4 <swap_init_ok>
c0004cb8:	02078863          	beqz	a5,c0004ce8 <pgdir_alloc_page+0x84>
c0004cbc:	0003a517          	auipc	a0,0x3a
c0004cc0:	f6c52503          	lw	a0,-148(a0) # c003ec28 <check_mm_struct>
c0004cc4:	02050263          	beqz	a0,c0004ce8 <pgdir_alloc_page+0x84>
c0004cc8:	00000693          	li	a3,0
c0004ccc:	00040613          	mv	a2,s0
c0004cd0:	00048593          	mv	a1,s1
c0004cd4:	b80fe0ef          	jal	ra,c0003054 <swap_map_swappable>
c0004cd8:	00042703          	lw	a4,0(s0)
c0004cdc:	00942e23          	sw	s1,28(s0)
c0004ce0:	00100793          	li	a5,1
c0004ce4:	02f71263          	bne	a4,a5,c0004d08 <pgdir_alloc_page+0xa4>
c0004ce8:	01c12083          	lw	ra,28(sp)
c0004cec:	00040513          	mv	a0,s0
c0004cf0:	01412483          	lw	s1,20(sp)
c0004cf4:	01812403          	lw	s0,24(sp)
c0004cf8:	01012903          	lw	s2,16(sp)
c0004cfc:	00c12983          	lw	s3,12(sp)
c0004d00:	02010113          	addi	sp,sp,32
c0004d04:	00008067          	ret
c0004d08:	00008697          	auipc	a3,0x8
c0004d0c:	54868693          	addi	a3,a3,1352 # c000d250 <default_pmm_manager+0x94>
c0004d10:	00007617          	auipc	a2,0x7
c0004d14:	46860613          	addi	a2,a2,1128 # c000c178 <commands+0x3d8>
c0004d18:	1f900593          	li	a1,505
c0004d1c:	00008517          	auipc	a0,0x8
c0004d20:	52450513          	addi	a0,a0,1316 # c000d240 <default_pmm_manager+0x84>
c0004d24:	d2cfb0ef          	jal	ra,c0000250 <__panic>
c0004d28:	00040513          	mv	a0,s0
c0004d2c:	00100593          	li	a1,1
c0004d30:	c54ff0ef          	jal	ra,c0004184 <free_pages>
c0004d34:	00000413          	li	s0,0
c0004d38:	fb1ff06f          	j	c0004ce8 <pgdir_alloc_page+0x84>

c0004d3c <print_pgdir>:
c0004d3c:	fa010113          	addi	sp,sp,-96
c0004d40:	00009517          	auipc	a0,0x9
c0004d44:	a5c50513          	addi	a0,a0,-1444 # c000d79c <default_pmm_manager+0x5e0>
c0004d48:	05212823          	sw	s2,80(sp)
c0004d4c:	04112e23          	sw	ra,92(sp)
c0004d50:	04812c23          	sw	s0,88(sp)
c0004d54:	04912a23          	sw	s1,84(sp)
c0004d58:	05312623          	sw	s3,76(sp)
c0004d5c:	05412423          	sw	s4,72(sp)
c0004d60:	05512223          	sw	s5,68(sp)
c0004d64:	05612023          	sw	s6,64(sp)
c0004d68:	03712e23          	sw	s7,60(sp)
c0004d6c:	03812c23          	sw	s8,56(sp)
c0004d70:	03912a23          	sw	s9,52(sp)
c0004d74:	03a12823          	sw	s10,48(sp)
c0004d78:	03b12623          	sw	s11,44(sp)
c0004d7c:	b60fb0ef          	jal	ra,c00000dc <cprintf>
c0004d80:	00000593          	li	a1,0
c0004d84:	00012a23          	sw	zero,20(sp)
c0004d88:	02d00913          	li	s2,45
c0004d8c:	01410713          	addi	a4,sp,20
c0004d90:	01010693          	addi	a3,sp,16
c0004d94:	fafec637          	lui	a2,0xfafec
c0004d98:	40000513          	li	a0,1024
c0004d9c:	a68ff0ef          	jal	ra,c0004004 <get_pgtable_items.isra.4.part.5>
c0004da0:	00050413          	mv	s0,a0
c0004da4:	08050263          	beqz	a0,c0004e28 <print_pgdir+0xec>
c0004da8:	01412583          	lw	a1,20(sp)
c0004dac:	01012783          	lw	a5,16(sp)
c0004db0:	01047513          	andi	a0,s0,16
c0004db4:	01659693          	slli	a3,a1,0x16
c0004db8:	40f585b3          	sub	a1,a1,a5
c0004dbc:	01679613          	slli	a2,a5,0x16
c0004dc0:	01659713          	slli	a4,a1,0x16
c0004dc4:	00090313          	mv	t1,s2
c0004dc8:	00050463          	beqz	a0,c0004dd0 <print_pgdir+0x94>
c0004dcc:	07500313          	li	t1,117
c0004dd0:	0003ab17          	auipc	s6,0x3a
c0004dd4:	e30b0b13          	addi	s6,s6,-464 # c003ec00 <str.1787>
c0004dd8:	07200793          	li	a5,114
c0004ddc:	006b0023          	sb	t1,0(s6)
c0004de0:	00fb00a3          	sb	a5,1(s6)
c0004de4:	00447793          	andi	a5,s0,4
c0004de8:	00090313          	mv	t1,s2
c0004dec:	00078463          	beqz	a5,c0004df4 <print_pgdir+0xb8>
c0004df0:	07700313          	li	t1,119
c0004df4:	0003a797          	auipc	a5,0x3a
c0004df8:	e0c78793          	addi	a5,a5,-500 # c003ec00 <str.1787>
c0004dfc:	00009517          	auipc	a0,0x9
c0004e00:	9d450513          	addi	a0,a0,-1580 # c000d7d0 <default_pmm_manager+0x614>
c0004e04:	006b0123          	sb	t1,2(s6)
c0004e08:	000b01a3          	sb	zero,3(s6)
c0004e0c:	ad0fb0ef          	jal	ra,c00000dc <cprintf>
c0004e10:	00f47413          	andi	s0,s0,15
c0004e14:	00100793          	li	a5,1
c0004e18:	04f40c63          	beq	s0,a5,c0004e70 <print_pgdir+0x134>
c0004e1c:	01412583          	lw	a1,20(sp)
c0004e20:	3ff00793          	li	a5,1023
c0004e24:	f6b7f4e3          	bleu	a1,a5,c0004d8c <print_pgdir+0x50>
c0004e28:	00009517          	auipc	a0,0x9
c0004e2c:	9ec50513          	addi	a0,a0,-1556 # c000d814 <default_pmm_manager+0x658>
c0004e30:	aacfb0ef          	jal	ra,c00000dc <cprintf>
c0004e34:	05c12083          	lw	ra,92(sp)
c0004e38:	05812403          	lw	s0,88(sp)
c0004e3c:	05412483          	lw	s1,84(sp)
c0004e40:	05012903          	lw	s2,80(sp)
c0004e44:	04c12983          	lw	s3,76(sp)
c0004e48:	04812a03          	lw	s4,72(sp)
c0004e4c:	04412a83          	lw	s5,68(sp)
c0004e50:	04012b03          	lw	s6,64(sp)
c0004e54:	03c12b83          	lw	s7,60(sp)
c0004e58:	03812c03          	lw	s8,56(sp)
c0004e5c:	03412c83          	lw	s9,52(sp)
c0004e60:	03012d03          	lw	s10,48(sp)
c0004e64:	02c12d83          	lw	s11,44(sp)
c0004e68:	06010113          	addi	sp,sp,96
c0004e6c:	00008067          	ret
c0004e70:	01012783          	lw	a5,16(sp)
c0004e74:	00000413          	li	s0,0
c0004e78:	00a79c93          	slli	s9,a5,0xa
c0004e7c:	00c79313          	slli	t1,a5,0xc
c0004e80:	00279d93          	slli	s11,a5,0x2
c0004e84:	00f12623          	sw	a5,12(sp)
c0004e88:	fafec7b7          	lui	a5,0xfafec
c0004e8c:	01912e23          	sw	s9,28(sp)
c0004e90:	40600ab3          	neg	s5,t1
c0004e94:	400c8c93          	addi	s9,s9,1024 # fff80400 <sbi_remote_fence_i+0xfff80b10>
c0004e98:	00fd8db3          	add	s11,s11,a5
c0004e9c:	0140006f          	j	c0004eb0 <print_pgdir+0x174>
c0004ea0:	fffff7b7          	lui	a5,0xfffff
c0004ea4:	00fa8ab3          	add	s5,s5,a5
c0004ea8:	400c8c93          	addi	s9,s9,1024
c0004eac:	004d8d93          	addi	s11,s11,4
c0004eb0:	01412583          	lw	a1,20(sp)
c0004eb4:	00c12783          	lw	a5,12(sp)
c0004eb8:	10b7fa63          	bleu	a1,a5,c0004fcc <print_pgdir+0x290>
c0004ebc:	00178793          	addi	a5,a5,1 # fffff001 <sbi_remote_fence_i+0xfffff711>
c0004ec0:	00f12623          	sw	a5,12(sp)
c0004ec4:	000da783          	lw	a5,0(s11)
c0004ec8:	fffff4b7          	lui	s1,0xfffff
c0004ecc:	0003a717          	auipc	a4,0x3a
c0004ed0:	d3072703          	lw	a4,-720(a4) # c003ebfc <npage>
c0004ed4:	00279793          	slli	a5,a5,0x2
c0004ed8:	0097f7b3          	and	a5,a5,s1
c0004edc:	00c7d693          	srli	a3,a5,0xc
c0004ee0:	01c12583          	lw	a1,28(sp)
c0004ee4:	07700a13          	li	s4,119
c0004ee8:	0003a997          	auipc	s3,0x3a
c0004eec:	d1898993          	addi	s3,s3,-744 # c003ec00 <str.1787>
c0004ef0:	0ae6fc63          	bleu	a4,a3,c0004fa8 <print_pgdir+0x26c>
c0004ef4:	fb95f6e3          	bleu	s9,a1,c0004ea0 <print_pgdir+0x164>
c0004ef8:	0003a697          	auipc	a3,0x3a
c0004efc:	de86a683          	lw	a3,-536(a3) # c003ece0 <va_pa_offset>
c0004f00:	00d787b3          	add	a5,a5,a3
c0004f04:	01c10713          	addi	a4,sp,28
c0004f08:	01810693          	addi	a3,sp,24
c0004f0c:	01578633          	add	a2,a5,s5
c0004f10:	000c8513          	mv	a0,s9
c0004f14:	8f0ff0ef          	jal	ra,c0004004 <get_pgtable_items.isra.4.part.5>
c0004f18:	00050d13          	mv	s10,a0
c0004f1c:	f80502e3          	beqz	a0,c0004ea0 <print_pgdir+0x164>
c0004f20:	0aa40263          	beq	s0,a0,c0004fc4 <print_pgdir+0x288>
c0004f24:	04040c63          	beqz	s0,c0004f7c <print_pgdir+0x240>
c0004f28:	417c05b3          	sub	a1,s8,s7
c0004f2c:	01047793          	andi	a5,s0,16
c0004f30:	00cb9613          	slli	a2,s7,0xc
c0004f34:	00cc1693          	slli	a3,s8,0xc
c0004f38:	00c59713          	slli	a4,a1,0xc
c0004f3c:	00090513          	mv	a0,s2
c0004f40:	00078463          	beqz	a5,c0004f48 <print_pgdir+0x20c>
c0004f44:	07500513          	li	a0,117
c0004f48:	07200793          	li	a5,114
c0004f4c:	00ab0023          	sb	a0,0(s6)
c0004f50:	00fb00a3          	sb	a5,1(s6)
c0004f54:	00447413          	andi	s0,s0,4
c0004f58:	000a0e13          	mv	t3,s4
c0004f5c:	00041463          	bnez	s0,c0004f64 <print_pgdir+0x228>
c0004f60:	00090e13          	mv	t3,s2
c0004f64:	00098793          	mv	a5,s3
c0004f68:	00009517          	auipc	a0,0x9
c0004f6c:	88850513          	addi	a0,a0,-1912 # c000d7f0 <default_pmm_manager+0x634>
c0004f70:	01cb0123          	sb	t3,2(s6)
c0004f74:	000b01a3          	sb	zero,3(s6)
c0004f78:	964fb0ef          	jal	ra,c00000dc <cprintf>
c0004f7c:	01812b83          	lw	s7,24(sp)
c0004f80:	01c12c03          	lw	s8,28(sp)
c0004f84:	000da783          	lw	a5,0(s11)
c0004f88:	0003a717          	auipc	a4,0x3a
c0004f8c:	c7472703          	lw	a4,-908(a4) # c003ebfc <npage>
c0004f90:	000c0593          	mv	a1,s8
c0004f94:	00279793          	slli	a5,a5,0x2
c0004f98:	0097f7b3          	and	a5,a5,s1
c0004f9c:	00c7d693          	srli	a3,a5,0xc
c0004fa0:	000d0413          	mv	s0,s10
c0004fa4:	f4e6e8e3          	bltu	a3,a4,c0004ef4 <print_pgdir+0x1b8>
c0004fa8:	00078693          	mv	a3,a5
c0004fac:	00008617          	auipc	a2,0x8
c0004fb0:	ab060613          	addi	a2,a2,-1360 # c000ca5c <commands+0xcbc>
c0004fb4:	2ac00593          	li	a1,684
c0004fb8:	00008517          	auipc	a0,0x8
c0004fbc:	28850513          	addi	a0,a0,648 # c000d240 <default_pmm_manager+0x84>
c0004fc0:	a90fb0ef          	jal	ra,c0000250 <__panic>
c0004fc4:	01c12c03          	lw	s8,28(sp)
c0004fc8:	fbdff06f          	j	c0004f84 <print_pgdir+0x248>
c0004fcc:	e4040ae3          	beqz	s0,c0004e20 <print_pgdir+0xe4>
c0004fd0:	417c05b3          	sub	a1,s8,s7
c0004fd4:	01047793          	andi	a5,s0,16
c0004fd8:	00cb9613          	slli	a2,s7,0xc
c0004fdc:	00cc1693          	slli	a3,s8,0xc
c0004fe0:	00c59713          	slli	a4,a1,0xc
c0004fe4:	00090513          	mv	a0,s2
c0004fe8:	00078463          	beqz	a5,c0004ff0 <print_pgdir+0x2b4>
c0004fec:	07500513          	li	a0,117
c0004ff0:	07200793          	li	a5,114
c0004ff4:	00ab0023          	sb	a0,0(s6)
c0004ff8:	00fb00a3          	sb	a5,1(s6)
c0004ffc:	00447413          	andi	s0,s0,4
c0005000:	00090313          	mv	t1,s2
c0005004:	00040463          	beqz	s0,c000500c <print_pgdir+0x2d0>
c0005008:	07700313          	li	t1,119
c000500c:	0003a797          	auipc	a5,0x3a
c0005010:	bf478793          	addi	a5,a5,-1036 # c003ec00 <str.1787>
c0005014:	00008517          	auipc	a0,0x8
c0005018:	7dc50513          	addi	a0,a0,2012 # c000d7f0 <default_pmm_manager+0x634>
c000501c:	006b0123          	sb	t1,2(s6)
c0005020:	000b01a3          	sb	zero,3(s6)
c0005024:	8b8fb0ef          	jal	ra,c00000dc <cprintf>
c0005028:	df5ff06f          	j	c0004e1c <print_pgdir+0xe0>

c000502c <pmm_init>:
c000502c:	fe010113          	addi	sp,sp,-32
c0005030:	00008597          	auipc	a1,0x8
c0005034:	18c5a583          	lw	a1,396(a1) # c000d1bc <default_pmm_manager>
c0005038:	00008797          	auipc	a5,0x8
c000503c:	18478793          	addi	a5,a5,388 # c000d1bc <default_pmm_manager>
c0005040:	00008517          	auipc	a0,0x8
c0005044:	22450513          	addi	a0,a0,548 # c000d264 <default_pmm_manager+0xa8>
c0005048:	00112e23          	sw	ra,28(sp)
c000504c:	00812c23          	sw	s0,24(sp)
c0005050:	00912a23          	sw	s1,20(sp)
c0005054:	01212823          	sw	s2,16(sp)
c0005058:	0003a297          	auipc	t0,0x3a
c000505c:	c8f2a223          	sw	a5,-892(t0) # c003ecdc <pmm_manager>
c0005060:	87cfb0ef          	jal	ra,c00000dc <cprintf>
c0005064:	0003a797          	auipc	a5,0x3a
c0005068:	c787a783          	lw	a5,-904(a5) # c003ecdc <pmm_manager>
c000506c:	0047a783          	lw	a5,4(a5)
c0005070:	000780e7          	jalr	a5
c0005074:	3fffa317          	auipc	t1,0x3fffa
c0005078:	78c300e7          	jalr	1932(t1) # fffff800 <sbi_hart_id>
c000507c:	00410593          	addi	a1,sp,4
c0005080:	3fffa317          	auipc	t1,0x3fffa
c0005084:	7a0300e7          	jalr	1952(t1) # fffff820 <sbi_query_memory>
c0005088:	32051ce3          	bnez	a0,c0005bc0 <pmm_init+0xb94>
c000508c:	00412483          	lw	s1,4(sp)
c0005090:	00812903          	lw	s2,8(sp)
c0005094:	c00007b7          	lui	a5,0xc0000
c0005098:	409787b3          	sub	a5,a5,s1
c000509c:	00008517          	auipc	a0,0x8
c00050a0:	20c50513          	addi	a0,a0,524 # c000d2a8 <default_pmm_manager+0xec>
c00050a4:	0003a297          	auipc	t0,0x3a
c00050a8:	c2f2ae23          	sw	a5,-964(t0) # c003ece0 <va_pa_offset>
c00050ac:	01248433          	add	s0,s1,s2
c00050b0:	82cfb0ef          	jal	ra,c00000dc <cprintf>
c00050b4:	00048613          	mv	a2,s1
c00050b8:	fff40693          	addi	a3,s0,-1
c00050bc:	00090593          	mv	a1,s2
c00050c0:	00008517          	auipc	a0,0x8
c00050c4:	20050513          	addi	a0,a0,512 # c000d2c0 <default_pmm_manager+0x104>
c00050c8:	814fb0ef          	jal	ra,c00000dc <cprintf>
c00050cc:	f80007b7          	lui	a5,0xf8000
c00050d0:	00040613          	mv	a2,s0
c00050d4:	0087f463          	bleu	s0,a5,c00050dc <pmm_init+0xb0>
c00050d8:	00078613          	mv	a2,a5
c00050dc:	00c65613          	srli	a2,a2,0xc
c00050e0:	0003a297          	auipc	t0,0x3a
c00050e4:	b0c2ae23          	sw	a2,-1252(t0) # c003ebfc <npage>
c00050e8:	180027f3          	csrr	a5,sptbr
c00050ec:	00100737          	lui	a4,0x100
c00050f0:	fff70713          	addi	a4,a4,-1 # fffff <_binary_obj___user_matrix_out_size+0xfd7f7>
c00050f4:	00e7f733          	and	a4,a5,a4
c00050f8:	00c79793          	slli	a5,a5,0xc
c00050fc:	3ec77ae3          	bleu	a2,a4,c0005cf0 <pmm_init+0xcc4>
c0005100:	0003a317          	auipc	t1,0x3a
c0005104:	be032303          	lw	t1,-1056(t1) # c003ece0 <va_pa_offset>
c0005108:	00002737          	lui	a4,0x2
c000510c:	006787b3          	add	a5,a5,t1
c0005110:	00e787b3          	add	a5,a5,a4
c0005114:	00001737          	lui	a4,0x1
c0005118:	fff70713          	addi	a4,a4,-1 # fff <_binary_obj___user_faultread_out_size-0xf69>
c000511c:	00e787b3          	add	a5,a5,a4
c0005120:	fffff737          	lui	a4,0xfffff
c0005124:	00e7f7b3          	and	a5,a5,a4
c0005128:	0003a297          	auipc	t0,0x3a
c000512c:	bcf2a023          	sw	a5,-1088(t0) # c003ece8 <pages>
c0005130:	000805b7          	lui	a1,0x80
c0005134:	68b60463          	beq	a2,a1,c00057bc <pmm_init+0x790>
c0005138:	0003a817          	auipc	a6,0x3a
c000513c:	ac482803          	lw	a6,-1340(a6) # c003ebfc <npage>
c0005140:	00000713          	li	a4,0
c0005144:	00078513          	mv	a0,a5
c0005148:	00100893          	li	a7,1
c000514c:	40b805b3          	sub	a1,a6,a1
c0005150:	0080006f          	j	c0005158 <pmm_init+0x12c>
c0005154:	00050793          	mv	a5,a0
c0005158:	00571693          	slli	a3,a4,0x5
c000515c:	00d787b3          	add	a5,a5,a3
c0005160:	00478793          	addi	a5,a5,4 # f8000004 <sbi_remote_fence_i+0xf8000714>
c0005164:	4117a02f          	amoor.w	zero,a7,(a5)
c0005168:	00170713          	addi	a4,a4,1 # fffff001 <sbi_remote_fence_i+0xfffff711>
c000516c:	00080613          	mv	a2,a6
c0005170:	feb762e3          	bltu	a4,a1,c0005154 <pmm_init+0x128>
c0005174:	07f806b7          	lui	a3,0x7f80
c0005178:	00d606b3          	add	a3,a2,a3
c000517c:	00569693          	slli	a3,a3,0x5
c0005180:	00d506b3          	add	a3,a0,a3
c0005184:	c00007b7          	lui	a5,0xc0000
c0005188:	3af6e2e3          	bltu	a3,a5,c0005d2c <pmm_init+0xd00>
c000518c:	fffff737          	lui	a4,0xfffff
c0005190:	406686b3          	sub	a3,a3,t1
c0005194:	00e47433          	and	s0,s0,a4
c0005198:	0486f263          	bleu	s0,a3,c00051dc <pmm_init+0x1b0>
c000519c:	000017b7          	lui	a5,0x1
c00051a0:	fff78793          	addi	a5,a5,-1 # fff <_binary_obj___user_faultread_out_size-0xf69>
c00051a4:	00f686b3          	add	a3,a3,a5
c00051a8:	00c6d793          	srli	a5,a3,0xc
c00051ac:	10c7f2e3          	bleu	a2,a5,c0005ab0 <pmm_init+0xa84>
c00051b0:	00e6f6b3          	and	a3,a3,a4
c00051b4:	fff80737          	lui	a4,0xfff80
c00051b8:	00e787b3          	add	a5,a5,a4
c00051bc:	0003a717          	auipc	a4,0x3a
c00051c0:	b2072703          	lw	a4,-1248(a4) # c003ecdc <pmm_manager>
c00051c4:	00872703          	lw	a4,8(a4)
c00051c8:	40d406b3          	sub	a3,s0,a3
c00051cc:	00579793          	slli	a5,a5,0x5
c00051d0:	00c6d593          	srli	a1,a3,0xc
c00051d4:	00f50533          	add	a0,a0,a5
c00051d8:	000700e7          	jalr	a4
c00051dc:	0003a797          	auipc	a5,0x3a
c00051e0:	b007a783          	lw	a5,-1280(a5) # c003ecdc <pmm_manager>
c00051e4:	0187a783          	lw	a5,24(a5)
c00051e8:	000780e7          	jalr	a5
c00051ec:	00008517          	auipc	a0,0x8
c00051f0:	0fc50513          	addi	a0,a0,252 # c000d2e8 <default_pmm_manager+0x12c>
c00051f4:	ee9fa0ef          	jal	ra,c00000dc <cprintf>
c00051f8:	00100513          	li	a0,1
c00051fc:	ed5fe0ef          	jal	ra,c00040d0 <alloc_pages>
c0005200:	08050ce3          	beqz	a0,c0005a98 <pmm_init+0xa6c>
c0005204:	0003a797          	auipc	a5,0x3a
c0005208:	ae47a783          	lw	a5,-1308(a5) # c003ece8 <pages>
c000520c:	40f507b3          	sub	a5,a0,a5
c0005210:	00080737          	lui	a4,0x80
c0005214:	4057d793          	srai	a5,a5,0x5
c0005218:	00e787b3          	add	a5,a5,a4
c000521c:	00100737          	lui	a4,0x100
c0005220:	fff70713          	addi	a4,a4,-1 # fffff <_binary_obj___user_matrix_out_size+0xfd7f7>
c0005224:	00e7f733          	and	a4,a5,a4
c0005228:	0003a697          	auipc	a3,0x3a
c000522c:	9d46a683          	lw	a3,-1580(a3) # c003ebfc <npage>
c0005230:	00c79793          	slli	a5,a5,0xc
c0005234:	7cd77463          	bleu	a3,a4,c00059fc <pmm_init+0x9d0>
c0005238:	0003a717          	auipc	a4,0x3a
c000523c:	aa872703          	lw	a4,-1368(a4) # c003ece0 <va_pa_offset>
c0005240:	00e787b3          	add	a5,a5,a4
c0005244:	00078513          	mv	a0,a5
c0005248:	00001637          	lui	a2,0x1
c000524c:	00000593          	li	a1,0
c0005250:	0003a297          	auipc	t0,0x3a
c0005254:	9af2a423          	sw	a5,-1624(t0) # c003ebf8 <boot_pgdir>
c0005258:	3b4060ef          	jal	ra,c000b60c <memset>
c000525c:	0003a517          	auipc	a0,0x3a
c0005260:	99c52503          	lw	a0,-1636(a0) # c003ebf8 <boot_pgdir>
c0005264:	c00007b7          	lui	a5,0xc0000
c0005268:	76f56c63          	bltu	a0,a5,c00059e0 <pmm_init+0x9b4>
c000526c:	0003a797          	auipc	a5,0x3a
c0005270:	a747a783          	lw	a5,-1420(a5) # c003ece0 <va_pa_offset>
c0005274:	40f507b3          	sub	a5,a0,a5
c0005278:	0003a297          	auipc	t0,0x3a
c000527c:	a6f2a623          	sw	a5,-1428(t0) # c003ece4 <boot_cr3>
c0005280:	0003a717          	auipc	a4,0x3a
c0005284:	97c72703          	lw	a4,-1668(a4) # c003ebfc <npage>
c0005288:	000f87b7          	lui	a5,0xf8
c000528c:	7ee7e663          	bltu	a5,a4,c0005a78 <pmm_init+0xa4c>
c0005290:	7c050463          	beqz	a0,c0005a58 <pmm_init+0xa2c>
c0005294:	01451793          	slli	a5,a0,0x14
c0005298:	7c079063          	bnez	a5,c0005a58 <pmm_init+0xa2c>
c000529c:	00000613          	li	a2,0
c00052a0:	00000593          	li	a1,0
c00052a4:	a0cff0ef          	jal	ra,c00044b0 <get_page>
c00052a8:	78051863          	bnez	a0,c0005a38 <pmm_init+0xa0c>
c00052ac:	00100513          	li	a0,1
c00052b0:	e21fe0ef          	jal	ra,c00040d0 <alloc_pages>
c00052b4:	00050493          	mv	s1,a0
c00052b8:	00050593          	mv	a1,a0
c00052bc:	00000693          	li	a3,0
c00052c0:	00000613          	li	a2,0
c00052c4:	0003a517          	auipc	a0,0x3a
c00052c8:	93452503          	lw	a0,-1740(a0) # c003ebf8 <boot_pgdir>
c00052cc:	dc8ff0ef          	jal	ra,c0004894 <page_insert>
c00052d0:	74051463          	bnez	a0,c0005a18 <pmm_init+0x9ec>
c00052d4:	00000613          	li	a2,0
c00052d8:	00000593          	li	a1,0
c00052dc:	0003a517          	auipc	a0,0x3a
c00052e0:	91c52503          	lw	a0,-1764(a0) # c003ebf8 <boot_pgdir>
c00052e4:	f5dfe0ef          	jal	ra,c0004240 <get_pte>
c00052e8:	04050ee3          	beqz	a0,c0005b44 <pmm_init+0xb18>
c00052ec:	00052783          	lw	a5,0(a0)
c00052f0:	0017f713          	andi	a4,a5,1
c00052f4:	02070ce3          	beqz	a4,c0005b2c <pmm_init+0xb00>
c00052f8:	00279793          	slli	a5,a5,0x2
c00052fc:	00c7d793          	srli	a5,a5,0xc
c0005300:	0003a617          	auipc	a2,0x3a
c0005304:	8fc62603          	lw	a2,-1796(a2) # c003ebfc <npage>
c0005308:	7ac7f463          	bleu	a2,a5,c0005ab0 <pmm_init+0xa84>
c000530c:	fff80737          	lui	a4,0xfff80
c0005310:	00e787b3          	add	a5,a5,a4
c0005314:	00579793          	slli	a5,a5,0x5
c0005318:	0003a717          	auipc	a4,0x3a
c000531c:	9d072703          	lw	a4,-1584(a4) # c003ece8 <pages>
c0005320:	00f707b3          	add	a5,a4,a5
c0005324:	7ef49463          	bne	s1,a5,c0005b0c <pmm_init+0xae0>
c0005328:	0004a903          	lw	s2,0(s1) # fffff000 <sbi_remote_fence_i+0xfffff710>
c000532c:	00100793          	li	a5,1
c0005330:	7af91e63          	bne	s2,a5,c0005aec <pmm_init+0xac0>
c0005334:	0003a517          	auipc	a0,0x3a
c0005338:	8c452503          	lw	a0,-1852(a0) # c003ebf8 <boot_pgdir>
c000533c:	00052683          	lw	a3,0(a0)
c0005340:	fffff7b7          	lui	a5,0xfffff
c0005344:	00269693          	slli	a3,a3,0x2
c0005348:	00f6f6b3          	and	a3,a3,a5
c000534c:	00c6d793          	srli	a5,a3,0xc
c0005350:	78c7f263          	bleu	a2,a5,c0005ad4 <pmm_init+0xaa8>
c0005354:	0003a417          	auipc	s0,0x3a
c0005358:	98c42403          	lw	s0,-1652(s0) # c003ece0 <va_pa_offset>
c000535c:	008686b3          	add	a3,a3,s0
c0005360:	00000613          	li	a2,0
c0005364:	000015b7          	lui	a1,0x1
c0005368:	00468413          	addi	s0,a3,4
c000536c:	ed5fe0ef          	jal	ra,c0004240 <get_pte>
c0005370:	74a41263          	bne	s0,a0,c0005ab4 <pmm_init+0xa88>
c0005374:	00090513          	mv	a0,s2
c0005378:	d59fe0ef          	jal	ra,c00040d0 <alloc_pages>
c000537c:	00050413          	mv	s0,a0
c0005380:	00050593          	mv	a1,a0
c0005384:	01400693          	li	a3,20
c0005388:	00001637          	lui	a2,0x1
c000538c:	0003a517          	auipc	a0,0x3a
c0005390:	86c52503          	lw	a0,-1940(a0) # c003ebf8 <boot_pgdir>
c0005394:	d00ff0ef          	jal	ra,c0004894 <page_insert>
c0005398:	7e051663          	bnez	a0,c0005b84 <pmm_init+0xb58>
c000539c:	00000613          	li	a2,0
c00053a0:	000015b7          	lui	a1,0x1
c00053a4:	0003a517          	auipc	a0,0x3a
c00053a8:	85452503          	lw	a0,-1964(a0) # c003ebf8 <boot_pgdir>
c00053ac:	e95fe0ef          	jal	ra,c0004240 <get_pte>
c00053b0:	7a050a63          	beqz	a0,c0005b64 <pmm_init+0xb38>
c00053b4:	00052783          	lw	a5,0(a0)
c00053b8:	0107f713          	andi	a4,a5,16
c00053bc:	5c070263          	beqz	a4,c0005980 <pmm_init+0x954>
c00053c0:	0047f793          	andi	a5,a5,4
c00053c4:	58078e63          	beqz	a5,c0005960 <pmm_init+0x934>
c00053c8:	0003a517          	auipc	a0,0x3a
c00053cc:	83052503          	lw	a0,-2000(a0) # c003ebf8 <boot_pgdir>
c00053d0:	00052783          	lw	a5,0(a0)
c00053d4:	0107f793          	andi	a5,a5,16
c00053d8:	56078463          	beqz	a5,c0005940 <pmm_init+0x914>
c00053dc:	00042903          	lw	s2,0(s0)
c00053e0:	00100793          	li	a5,1
c00053e4:	52f91e63          	bne	s2,a5,c0005920 <pmm_init+0x8f4>
c00053e8:	00000693          	li	a3,0
c00053ec:	00001637          	lui	a2,0x1
c00053f0:	00048593          	mv	a1,s1
c00053f4:	ca0ff0ef          	jal	ra,c0004894 <page_insert>
c00053f8:	50051463          	bnez	a0,c0005900 <pmm_init+0x8d4>
c00053fc:	0004a703          	lw	a4,0(s1)
c0005400:	00200793          	li	a5,2
c0005404:	4cf71e63          	bne	a4,a5,c00058e0 <pmm_init+0x8b4>
c0005408:	00042783          	lw	a5,0(s0)
c000540c:	4a079a63          	bnez	a5,c00058c0 <pmm_init+0x894>
c0005410:	00000613          	li	a2,0
c0005414:	000015b7          	lui	a1,0x1
c0005418:	00039517          	auipc	a0,0x39
c000541c:	7e052503          	lw	a0,2016(a0) # c003ebf8 <boot_pgdir>
c0005420:	e21fe0ef          	jal	ra,c0004240 <get_pte>
c0005424:	46050e63          	beqz	a0,c00058a0 <pmm_init+0x874>
c0005428:	00052703          	lw	a4,0(a0)
c000542c:	00177793          	andi	a5,a4,1
c0005430:	6e078e63          	beqz	a5,c0005b2c <pmm_init+0xb00>
c0005434:	00271793          	slli	a5,a4,0x2
c0005438:	00c7d793          	srli	a5,a5,0xc
c000543c:	00039697          	auipc	a3,0x39
c0005440:	7c06a683          	lw	a3,1984(a3) # c003ebfc <npage>
c0005444:	66d7f663          	bleu	a3,a5,c0005ab0 <pmm_init+0xa84>
c0005448:	fff806b7          	lui	a3,0xfff80
c000544c:	00d787b3          	add	a5,a5,a3
c0005450:	00579793          	slli	a5,a5,0x5
c0005454:	0003a697          	auipc	a3,0x3a
c0005458:	8946a683          	lw	a3,-1900(a3) # c003ece8 <pages>
c000545c:	00f687b3          	add	a5,a3,a5
c0005460:	42f49063          	bne	s1,a5,c0005880 <pmm_init+0x854>
c0005464:	01077713          	andi	a4,a4,16
c0005468:	3e071c63          	bnez	a4,c0005860 <pmm_init+0x834>
c000546c:	00000593          	li	a1,0
c0005470:	00039517          	auipc	a0,0x39
c0005474:	78852503          	lw	a0,1928(a0) # c003ebf8 <boot_pgdir>
c0005478:	b70ff0ef          	jal	ra,c00047e8 <page_remove>
c000547c:	0004a783          	lw	a5,0(s1)
c0005480:	3d279063          	bne	a5,s2,c0005840 <pmm_init+0x814>
c0005484:	00042783          	lw	a5,0(s0)
c0005488:	38079c63          	bnez	a5,c0005820 <pmm_init+0x7f4>
c000548c:	000015b7          	lui	a1,0x1
c0005490:	00039517          	auipc	a0,0x39
c0005494:	76852503          	lw	a0,1896(a0) # c003ebf8 <boot_pgdir>
c0005498:	b50ff0ef          	jal	ra,c00047e8 <page_remove>
c000549c:	0004a783          	lw	a5,0(s1)
c00054a0:	52079063          	bnez	a5,c00059c0 <pmm_init+0x994>
c00054a4:	00042783          	lw	a5,0(s0)
c00054a8:	4e079c63          	bnez	a5,c00059a0 <pmm_init+0x974>
c00054ac:	00039797          	auipc	a5,0x39
c00054b0:	74c7a783          	lw	a5,1868(a5) # c003ebf8 <boot_pgdir>
c00054b4:	0007a783          	lw	a5,0(a5)
c00054b8:	00039717          	auipc	a4,0x39
c00054bc:	74472703          	lw	a4,1860(a4) # c003ebfc <npage>
c00054c0:	00279793          	slli	a5,a5,0x2
c00054c4:	00c7d793          	srli	a5,a5,0xc
c00054c8:	5ee7f463          	bleu	a4,a5,c0005ab0 <pmm_init+0xa84>
c00054cc:	fff80737          	lui	a4,0xfff80
c00054d0:	00e787b3          	add	a5,a5,a4
c00054d4:	00579793          	slli	a5,a5,0x5
c00054d8:	0003a517          	auipc	a0,0x3a
c00054dc:	81052503          	lw	a0,-2032(a0) # c003ece8 <pages>
c00054e0:	00f50533          	add	a0,a0,a5
c00054e4:	00052583          	lw	a1,0(a0)
c00054e8:	00100793          	li	a5,1
c00054ec:	78f59263          	bne	a1,a5,c0005c70 <pmm_init+0xc44>
c00054f0:	c95fe0ef          	jal	ra,c0004184 <free_pages>
c00054f4:	00039797          	auipc	a5,0x39
c00054f8:	7047a783          	lw	a5,1796(a5) # c003ebf8 <boot_pgdir>
c00054fc:	0007a023          	sw	zero,0(a5)
c0005500:	00008517          	auipc	a0,0x8
c0005504:	0ac50513          	addi	a0,a0,172 # c000d5ac <default_pmm_manager+0x3f0>
c0005508:	bd5fa0ef          	jal	ra,c00000dc <cprintf>
c000550c:	00039797          	auipc	a5,0x39
c0005510:	7d87a783          	lw	a5,2008(a5) # c003ece4 <boot_cr3>
c0005514:	00c7d793          	srli	a5,a5,0xc
c0005518:	00039517          	auipc	a0,0x39
c000551c:	6e052503          	lw	a0,1760(a0) # c003ebf8 <boot_pgdir>
c0005520:	00a79793          	slli	a5,a5,0xa
c0005524:	00001437          	lui	s0,0x1
c0005528:	00850733          	add	a4,a0,s0
c000552c:	0017e693          	ori	a3,a5,1
c0005530:	c00005b7          	lui	a1,0xc0000
c0005534:	0077e793          	ori	a5,a5,7
c0005538:	fad72623          	sw	a3,-84(a4) # fff7ffac <sbi_remote_fence_i+0xfff806bc>
c000553c:	00039697          	auipc	a3,0x39
c0005540:	7a46a683          	lw	a3,1956(a3) # c003ece0 <va_pa_offset>
c0005544:	faf72823          	sw	a5,-80(a4)
c0005548:	40d586b3          	sub	a3,a1,a3
c000554c:	00f00713          	li	a4,15
c0005550:	38000637          	lui	a2,0x38000
c0005554:	e51fe0ef          	jal	ra,c00043a4 <boot_map_segment>
c0005558:	180027f3          	csrr	a5,sptbr
c000555c:	00100737          	lui	a4,0x100
c0005560:	fff70713          	addi	a4,a4,-1 # fffff <_binary_obj___user_matrix_out_size+0xfd7f7>
c0005564:	00e7f733          	and	a4,a5,a4
c0005568:	00039697          	auipc	a3,0x39
c000556c:	6946a683          	lw	a3,1684(a3) # c003ebfc <npage>
c0005570:	00c79793          	slli	a5,a5,0xc
c0005574:	62d77863          	bleu	a3,a4,c0005ba4 <pmm_init+0xb78>
c0005578:	00039517          	auipc	a0,0x39
c000557c:	76852503          	lw	a0,1896(a0) # c003ece0 <va_pa_offset>
c0005580:	00a78533          	add	a0,a5,a0
c0005584:	00000613          	li	a2,0
c0005588:	fff00593          	li	a1,-1
c000558c:	cb5fe0ef          	jal	ra,c0004240 <get_pte>
c0005590:	00052683          	lw	a3,0(a0)
c0005594:	fffff4b7          	lui	s1,0xfffff
c0005598:	00b00713          	li	a4,11
c000559c:	00269693          	slli	a3,a3,0x2
c00055a0:	0096f6b3          	and	a3,a3,s1
c00055a4:	00040613          	mv	a2,s0
c00055a8:	00048593          	mv	a1,s1
c00055ac:	00039517          	auipc	a0,0x39
c00055b0:	64c52503          	lw	a0,1612(a0) # c003ebf8 <boot_pgdir>
c00055b4:	df1fe0ef          	jal	ra,c00043a4 <boot_map_segment>
c00055b8:	00039797          	auipc	a5,0x39
c00055bc:	72c7a783          	lw	a5,1836(a5) # c003ece4 <boot_cr3>
c00055c0:	00c7d793          	srli	a5,a5,0xc
c00055c4:	18079073          	csrw	sptbr,a5
c00055c8:	00039797          	auipc	a5,0x39
c00055cc:	6347a783          	lw	a5,1588(a5) # c003ebfc <npage>
c00055d0:	000c0437          	lui	s0,0xc0
c00055d4:	00039517          	auipc	a0,0x39
c00055d8:	62452503          	lw	a0,1572(a0) # c003ebf8 <boot_pgdir>
c00055dc:	00f46c63          	bltu	s0,a5,c00055f4 <pmm_init+0x5c8>
c00055e0:	04c0006f          	j	c000562c <pmm_init+0x600>
c00055e4:	00c45793          	srli	a5,s0,0xc
c00055e8:	00039517          	auipc	a0,0x39
c00055ec:	61052503          	lw	a0,1552(a0) # c003ebf8 <boot_pgdir>
c00055f0:	1ee7fa63          	bleu	a4,a5,c00057e4 <pmm_init+0x7b8>
c00055f4:	00039597          	auipc	a1,0x39
c00055f8:	6ec5a583          	lw	a1,1772(a1) # c003ece0 <va_pa_offset>
c00055fc:	00000613          	li	a2,0
c0005600:	00b405b3          	add	a1,s0,a1
c0005604:	c3dfe0ef          	jal	ra,c0004240 <get_pte>
c0005608:	1a050e63          	beqz	a0,c00057c4 <pmm_init+0x798>
c000560c:	00052783          	lw	a5,0(a0)
c0005610:	00279793          	slli	a5,a5,0x2
c0005614:	0097f7b3          	and	a5,a5,s1
c0005618:	1e879463          	bne	a5,s0,c0005800 <pmm_init+0x7d4>
c000561c:	00140413          	addi	s0,s0,1 # c0001 <_binary_obj___user_matrix_out_size+0xbd7f9>
c0005620:	00039717          	auipc	a4,0x39
c0005624:	5dc72703          	lw	a4,1500(a4) # c003ebfc <npage>
c0005628:	fae46ee3          	bltu	s0,a4,c00055e4 <pmm_init+0x5b8>
c000562c:	00039697          	auipc	a3,0x39
c0005630:	5cc6a683          	lw	a3,1484(a3) # c003ebf8 <boot_pgdir>
c0005634:	000014b7          	lui	s1,0x1
c0005638:	009687b3          	add	a5,a3,s1
c000563c:	fac7a783          	lw	a5,-84(a5)
c0005640:	fffff637          	lui	a2,0xfffff
c0005644:	c0000737          	lui	a4,0xc0000
c0005648:	00279793          	slli	a5,a5,0x2
c000564c:	00c7f7b3          	and	a5,a5,a2
c0005650:	60e6e463          	bltu	a3,a4,c0005c58 <pmm_init+0xc2c>
c0005654:	00039717          	auipc	a4,0x39
c0005658:	68c72703          	lw	a4,1676(a4) # c003ece0 <va_pa_offset>
c000565c:	40e68733          	sub	a4,a3,a4
c0005660:	5ce79c63          	bne	a5,a4,c0005c38 <pmm_init+0xc0c>
c0005664:	0006a783          	lw	a5,0(a3)
c0005668:	5a079863          	bnez	a5,c0005c18 <pmm_init+0xbec>
c000566c:	00100513          	li	a0,1
c0005670:	a61fe0ef          	jal	ra,c00040d0 <alloc_pages>
c0005674:	00050413          	mv	s0,a0
c0005678:	00050593          	mv	a1,a0
c000567c:	00600693          	li	a3,6
c0005680:	10000613          	li	a2,256
c0005684:	00039517          	auipc	a0,0x39
c0005688:	57452503          	lw	a0,1396(a0) # c003ebf8 <boot_pgdir>
c000568c:	a08ff0ef          	jal	ra,c0004894 <page_insert>
c0005690:	56051463          	bnez	a0,c0005bf8 <pmm_init+0xbcc>
c0005694:	00042703          	lw	a4,0(s0)
c0005698:	00100793          	li	a5,1
c000569c:	62f71a63          	bne	a4,a5,c0005cd0 <pmm_init+0xca4>
c00056a0:	00600693          	li	a3,6
c00056a4:	10048613          	addi	a2,s1,256 # 1100 <_binary_obj___user_faultread_out_size-0xe68>
c00056a8:	00040593          	mv	a1,s0
c00056ac:	00039517          	auipc	a0,0x39
c00056b0:	54c52503          	lw	a0,1356(a0) # c003ebf8 <boot_pgdir>
c00056b4:	9e0ff0ef          	jal	ra,c0004894 <page_insert>
c00056b8:	5e051c63          	bnez	a0,c0005cb0 <pmm_init+0xc84>
c00056bc:	00042703          	lw	a4,0(s0)
c00056c0:	00200793          	li	a5,2
c00056c4:	5cf71663          	bne	a4,a5,c0005c90 <pmm_init+0xc64>
c00056c8:	00008597          	auipc	a1,0x8
c00056cc:	04058593          	addi	a1,a1,64 # c000d708 <default_pmm_manager+0x54c>
c00056d0:	10000513          	li	a0,256
c00056d4:	6bd050ef          	jal	ra,c000b590 <strcpy>
c00056d8:	10048593          	addi	a1,s1,256
c00056dc:	10000513          	li	a0,256
c00056e0:	6cd050ef          	jal	ra,c000b5ac <strcmp>
c00056e4:	62051463          	bnez	a0,c0005d0c <pmm_init+0xce0>
c00056e8:	00039797          	auipc	a5,0x39
c00056ec:	6007a783          	lw	a5,1536(a5) # c003ece8 <pages>
c00056f0:	40f407b3          	sub	a5,s0,a5
c00056f4:	00080737          	lui	a4,0x80
c00056f8:	4057d793          	srai	a5,a5,0x5
c00056fc:	00e787b3          	add	a5,a5,a4
c0005700:	00100737          	lui	a4,0x100
c0005704:	fff70713          	addi	a4,a4,-1 # fffff <_binary_obj___user_matrix_out_size+0xfd7f7>
c0005708:	00e7f733          	and	a4,a5,a4
c000570c:	00039697          	auipc	a3,0x39
c0005710:	4f06a683          	lw	a3,1264(a3) # c003ebfc <npage>
c0005714:	00c79793          	slli	a5,a5,0xc
c0005718:	2ed77263          	bleu	a3,a4,c00059fc <pmm_init+0x9d0>
c000571c:	00039717          	auipc	a4,0x39
c0005720:	5c472703          	lw	a4,1476(a4) # c003ece0 <va_pa_offset>
c0005724:	00f707b3          	add	a5,a4,a5
c0005728:	10078023          	sb	zero,256(a5)
c000572c:	10000513          	li	a0,256
c0005730:	5f5050ef          	jal	ra,c000b524 <strlen>
c0005734:	4a051263          	bnez	a0,c0005bd8 <pmm_init+0xbac>
c0005738:	00100593          	li	a1,1
c000573c:	00040513          	mv	a0,s0
c0005740:	a45fe0ef          	jal	ra,c0004184 <free_pages>
c0005744:	00039797          	auipc	a5,0x39
c0005748:	4b47a783          	lw	a5,1204(a5) # c003ebf8 <boot_pgdir>
c000574c:	0007a783          	lw	a5,0(a5)
c0005750:	00039717          	auipc	a4,0x39
c0005754:	4ac72703          	lw	a4,1196(a4) # c003ebfc <npage>
c0005758:	00279793          	slli	a5,a5,0x2
c000575c:	00c7d793          	srli	a5,a5,0xc
c0005760:	34e7f863          	bleu	a4,a5,c0005ab0 <pmm_init+0xa84>
c0005764:	fff80737          	lui	a4,0xfff80
c0005768:	00e787b3          	add	a5,a5,a4
c000576c:	00579793          	slli	a5,a5,0x5
c0005770:	00039517          	auipc	a0,0x39
c0005774:	57852503          	lw	a0,1400(a0) # c003ece8 <pages>
c0005778:	00100593          	li	a1,1
c000577c:	00f50533          	add	a0,a0,a5
c0005780:	a05fe0ef          	jal	ra,c0004184 <free_pages>
c0005784:	00039797          	auipc	a5,0x39
c0005788:	4747a783          	lw	a5,1140(a5) # c003ebf8 <boot_pgdir>
c000578c:	0007a023          	sw	zero,0(a5)
c0005790:	00008517          	auipc	a0,0x8
c0005794:	fec50513          	addi	a0,a0,-20 # c000d77c <default_pmm_manager+0x5c0>
c0005798:	945fa0ef          	jal	ra,c00000dc <cprintf>
c000579c:	da0ff0ef          	jal	ra,c0004d3c <print_pgdir>
c00057a0:	de1fc0ef          	jal	ra,c0002580 <kmalloc_init>
c00057a4:	01c12083          	lw	ra,28(sp)
c00057a8:	01812403          	lw	s0,24(sp)
c00057ac:	01412483          	lw	s1,20(sp)
c00057b0:	01012903          	lw	s2,16(sp)
c00057b4:	02010113          	addi	sp,sp,32
c00057b8:	00008067          	ret
c00057bc:	00078513          	mv	a0,a5
c00057c0:	9b5ff06f          	j	c0005174 <pmm_init+0x148>
c00057c4:	00008697          	auipc	a3,0x8
c00057c8:	e0468693          	addi	a3,a3,-508 # c000d5c8 <default_pmm_manager+0x40c>
c00057cc:	00007617          	auipc	a2,0x7
c00057d0:	9ac60613          	addi	a2,a2,-1620 # c000c178 <commands+0x3d8>
c00057d4:	24b00593          	li	a1,587
c00057d8:	00008517          	auipc	a0,0x8
c00057dc:	a6850513          	addi	a0,a0,-1432 # c000d240 <default_pmm_manager+0x84>
c00057e0:	a71fa0ef          	jal	ra,c0000250 <__panic>
c00057e4:	00040693          	mv	a3,s0
c00057e8:	00007617          	auipc	a2,0x7
c00057ec:	27460613          	addi	a2,a2,628 # c000ca5c <commands+0xcbc>
c00057f0:	24b00593          	li	a1,587
c00057f4:	00008517          	auipc	a0,0x8
c00057f8:	a4c50513          	addi	a0,a0,-1460 # c000d240 <default_pmm_manager+0x84>
c00057fc:	a55fa0ef          	jal	ra,c0000250 <__panic>
c0005800:	00008697          	auipc	a3,0x8
c0005804:	e0868693          	addi	a3,a3,-504 # c000d608 <default_pmm_manager+0x44c>
c0005808:	00007617          	auipc	a2,0x7
c000580c:	97060613          	addi	a2,a2,-1680 # c000c178 <commands+0x3d8>
c0005810:	24c00593          	li	a1,588
c0005814:	00008517          	auipc	a0,0x8
c0005818:	a2c50513          	addi	a0,a0,-1492 # c000d240 <default_pmm_manager+0x84>
c000581c:	a35fa0ef          	jal	ra,c0000250 <__panic>
c0005820:	00008697          	auipc	a3,0x8
c0005824:	d2468693          	addi	a3,a3,-732 # c000d544 <default_pmm_manager+0x388>
c0005828:	00007617          	auipc	a2,0x7
c000582c:	95060613          	addi	a2,a2,-1712 # c000c178 <commands+0x3d8>
c0005830:	23500593          	li	a1,565
c0005834:	00008517          	auipc	a0,0x8
c0005838:	a0c50513          	addi	a0,a0,-1524 # c000d240 <default_pmm_manager+0x84>
c000583c:	a15fa0ef          	jal	ra,c0000250 <__panic>
c0005840:	00008697          	auipc	a3,0x8
c0005844:	bd468693          	addi	a3,a3,-1068 # c000d414 <default_pmm_manager+0x258>
c0005848:	00007617          	auipc	a2,0x7
c000584c:	93060613          	addi	a2,a2,-1744 # c000c178 <commands+0x3d8>
c0005850:	23400593          	li	a1,564
c0005854:	00008517          	auipc	a0,0x8
c0005858:	9ec50513          	addi	a0,a0,-1556 # c000d240 <default_pmm_manager+0x84>
c000585c:	9f5fa0ef          	jal	ra,c0000250 <__panic>
c0005860:	00008697          	auipc	a3,0x8
c0005864:	cf868693          	addi	a3,a3,-776 # c000d558 <default_pmm_manager+0x39c>
c0005868:	00007617          	auipc	a2,0x7
c000586c:	91060613          	addi	a2,a2,-1776 # c000c178 <commands+0x3d8>
c0005870:	23100593          	li	a1,561
c0005874:	00008517          	auipc	a0,0x8
c0005878:	9cc50513          	addi	a0,a0,-1588 # c000d240 <default_pmm_manager+0x84>
c000587c:	9d5fa0ef          	jal	ra,c0000250 <__panic>
c0005880:	00008697          	auipc	a3,0x8
c0005884:	b7c68693          	addi	a3,a3,-1156 # c000d3fc <default_pmm_manager+0x240>
c0005888:	00007617          	auipc	a2,0x7
c000588c:	8f060613          	addi	a2,a2,-1808 # c000c178 <commands+0x3d8>
c0005890:	23000593          	li	a1,560
c0005894:	00008517          	auipc	a0,0x8
c0005898:	9ac50513          	addi	a0,a0,-1620 # c000d240 <default_pmm_manager+0x84>
c000589c:	9b5fa0ef          	jal	ra,c0000250 <__panic>
c00058a0:	00008697          	auipc	a3,0x8
c00058a4:	be868693          	addi	a3,a3,-1048 # c000d488 <default_pmm_manager+0x2cc>
c00058a8:	00007617          	auipc	a2,0x7
c00058ac:	8d060613          	addi	a2,a2,-1840 # c000c178 <commands+0x3d8>
c00058b0:	22f00593          	li	a1,559
c00058b4:	00008517          	auipc	a0,0x8
c00058b8:	98c50513          	addi	a0,a0,-1652 # c000d240 <default_pmm_manager+0x84>
c00058bc:	995fa0ef          	jal	ra,c0000250 <__panic>
c00058c0:	00008697          	auipc	a3,0x8
c00058c4:	c8468693          	addi	a3,a3,-892 # c000d544 <default_pmm_manager+0x388>
c00058c8:	00007617          	auipc	a2,0x7
c00058cc:	8b060613          	addi	a2,a2,-1872 # c000c178 <commands+0x3d8>
c00058d0:	22e00593          	li	a1,558
c00058d4:	00008517          	auipc	a0,0x8
c00058d8:	96c50513          	addi	a0,a0,-1684 # c000d240 <default_pmm_manager+0x84>
c00058dc:	975fa0ef          	jal	ra,c0000250 <__panic>
c00058e0:	00008697          	auipc	a3,0x8
c00058e4:	c5068693          	addi	a3,a3,-944 # c000d530 <default_pmm_manager+0x374>
c00058e8:	00007617          	auipc	a2,0x7
c00058ec:	89060613          	addi	a2,a2,-1904 # c000c178 <commands+0x3d8>
c00058f0:	22d00593          	li	a1,557
c00058f4:	00008517          	auipc	a0,0x8
c00058f8:	94c50513          	addi	a0,a0,-1716 # c000d240 <default_pmm_manager+0x84>
c00058fc:	955fa0ef          	jal	ra,c0000250 <__panic>
c0005900:	00008697          	auipc	a3,0x8
c0005904:	c0468693          	addi	a3,a3,-1020 # c000d504 <default_pmm_manager+0x348>
c0005908:	00007617          	auipc	a2,0x7
c000590c:	87060613          	addi	a2,a2,-1936 # c000c178 <commands+0x3d8>
c0005910:	22c00593          	li	a1,556
c0005914:	00008517          	auipc	a0,0x8
c0005918:	92c50513          	addi	a0,a0,-1748 # c000d240 <default_pmm_manager+0x84>
c000591c:	935fa0ef          	jal	ra,c0000250 <__panic>
c0005920:	00008697          	auipc	a3,0x8
c0005924:	bd068693          	addi	a3,a3,-1072 # c000d4f0 <default_pmm_manager+0x334>
c0005928:	00007617          	auipc	a2,0x7
c000592c:	85060613          	addi	a2,a2,-1968 # c000c178 <commands+0x3d8>
c0005930:	22a00593          	li	a1,554
c0005934:	00008517          	auipc	a0,0x8
c0005938:	90c50513          	addi	a0,a0,-1780 # c000d240 <default_pmm_manager+0x84>
c000593c:	915fa0ef          	jal	ra,c0000250 <__panic>
c0005940:	00008697          	auipc	a3,0x8
c0005944:	b9868693          	addi	a3,a3,-1128 # c000d4d8 <default_pmm_manager+0x31c>
c0005948:	00007617          	auipc	a2,0x7
c000594c:	83060613          	addi	a2,a2,-2000 # c000c178 <commands+0x3d8>
c0005950:	22900593          	li	a1,553
c0005954:	00008517          	auipc	a0,0x8
c0005958:	8ec50513          	addi	a0,a0,-1812 # c000d240 <default_pmm_manager+0x84>
c000595c:	8f5fa0ef          	jal	ra,c0000250 <__panic>
c0005960:	00008697          	auipc	a3,0x8
c0005964:	b6868693          	addi	a3,a3,-1176 # c000d4c8 <default_pmm_manager+0x30c>
c0005968:	00007617          	auipc	a2,0x7
c000596c:	81060613          	addi	a2,a2,-2032 # c000c178 <commands+0x3d8>
c0005970:	22800593          	li	a1,552
c0005974:	00008517          	auipc	a0,0x8
c0005978:	8cc50513          	addi	a0,a0,-1844 # c000d240 <default_pmm_manager+0x84>
c000597c:	8d5fa0ef          	jal	ra,c0000250 <__panic>
c0005980:	00008697          	auipc	a3,0x8
c0005984:	b3868693          	addi	a3,a3,-1224 # c000d4b8 <default_pmm_manager+0x2fc>
c0005988:	00006617          	auipc	a2,0x6
c000598c:	7f060613          	addi	a2,a2,2032 # c000c178 <commands+0x3d8>
c0005990:	22700593          	li	a1,551
c0005994:	00008517          	auipc	a0,0x8
c0005998:	8ac50513          	addi	a0,a0,-1876 # c000d240 <default_pmm_manager+0x84>
c000599c:	8b5fa0ef          	jal	ra,c0000250 <__panic>
c00059a0:	00008697          	auipc	a3,0x8
c00059a4:	ba468693          	addi	a3,a3,-1116 # c000d544 <default_pmm_manager+0x388>
c00059a8:	00006617          	auipc	a2,0x6
c00059ac:	7d060613          	addi	a2,a2,2000 # c000c178 <commands+0x3d8>
c00059b0:	23900593          	li	a1,569
c00059b4:	00008517          	auipc	a0,0x8
c00059b8:	88c50513          	addi	a0,a0,-1908 # c000d240 <default_pmm_manager+0x84>
c00059bc:	895fa0ef          	jal	ra,c0000250 <__panic>
c00059c0:	00008697          	auipc	a3,0x8
c00059c4:	bb068693          	addi	a3,a3,-1104 # c000d570 <default_pmm_manager+0x3b4>
c00059c8:	00006617          	auipc	a2,0x6
c00059cc:	7b060613          	addi	a2,a2,1968 # c000c178 <commands+0x3d8>
c00059d0:	23800593          	li	a1,568
c00059d4:	00008517          	auipc	a0,0x8
c00059d8:	86c50513          	addi	a0,a0,-1940 # c000d240 <default_pmm_manager+0x84>
c00059dc:	875fa0ef          	jal	ra,c0000250 <__panic>
c00059e0:	00050693          	mv	a3,a0
c00059e4:	00007617          	auipc	a2,0x7
c00059e8:	09c60613          	addi	a2,a2,156 # c000ca80 <commands+0xce0>
c00059ec:	0d600593          	li	a1,214
c00059f0:	00008517          	auipc	a0,0x8
c00059f4:	85050513          	addi	a0,a0,-1968 # c000d240 <default_pmm_manager+0x84>
c00059f8:	859fa0ef          	jal	ra,c0000250 <__panic>
c00059fc:	00078693          	mv	a3,a5
c0005a00:	00007617          	auipc	a2,0x7
c0005a04:	05c60613          	addi	a2,a2,92 # c000ca5c <commands+0xcbc>
c0005a08:	06800593          	li	a1,104
c0005a0c:	00007517          	auipc	a0,0x7
c0005a10:	e0850513          	addi	a0,a0,-504 # c000c814 <commands+0xa74>
c0005a14:	83dfa0ef          	jal	ra,c0000250 <__panic>
c0005a18:	00008697          	auipc	a3,0x8
c0005a1c:	98868693          	addi	a3,a3,-1656 # c000d3a0 <default_pmm_manager+0x1e4>
c0005a20:	00006617          	auipc	a2,0x6
c0005a24:	75860613          	addi	a2,a2,1880 # c000c178 <commands+0x3d8>
c0005a28:	21a00593          	li	a1,538
c0005a2c:	00008517          	auipc	a0,0x8
c0005a30:	81450513          	addi	a0,a0,-2028 # c000d240 <default_pmm_manager+0x84>
c0005a34:	81dfa0ef          	jal	ra,c0000250 <__panic>
c0005a38:	00008697          	auipc	a3,0x8
c0005a3c:	94068693          	addi	a3,a3,-1728 # c000d378 <default_pmm_manager+0x1bc>
c0005a40:	00006617          	auipc	a2,0x6
c0005a44:	73860613          	addi	a2,a2,1848 # c000c178 <commands+0x3d8>
c0005a48:	21600593          	li	a1,534
c0005a4c:	00007517          	auipc	a0,0x7
c0005a50:	7f450513          	addi	a0,a0,2036 # c000d240 <default_pmm_manager+0x84>
c0005a54:	ffcfa0ef          	jal	ra,c0000250 <__panic>
c0005a58:	00008697          	auipc	a3,0x8
c0005a5c:	8e868693          	addi	a3,a3,-1816 # c000d340 <default_pmm_manager+0x184>
c0005a60:	00006617          	auipc	a2,0x6
c0005a64:	71860613          	addi	a2,a2,1816 # c000c178 <commands+0x3d8>
c0005a68:	21500593          	li	a1,533
c0005a6c:	00007517          	auipc	a0,0x7
c0005a70:	7d450513          	addi	a0,a0,2004 # c000d240 <default_pmm_manager+0x84>
c0005a74:	fdcfa0ef          	jal	ra,c0000250 <__panic>
c0005a78:	00008697          	auipc	a3,0x8
c0005a7c:	8ac68693          	addi	a3,a3,-1876 # c000d324 <default_pmm_manager+0x168>
c0005a80:	00006617          	auipc	a2,0x6
c0005a84:	6f860613          	addi	a2,a2,1784 # c000c178 <commands+0x3d8>
c0005a88:	21400593          	li	a1,532
c0005a8c:	00007517          	auipc	a0,0x7
c0005a90:	7b450513          	addi	a0,a0,1972 # c000d240 <default_pmm_manager+0x84>
c0005a94:	fbcfa0ef          	jal	ra,c0000250 <__panic>
c0005a98:	00008617          	auipc	a2,0x8
c0005a9c:	87060613          	addi	a2,a2,-1936 # c000d308 <default_pmm_manager+0x14c>
c0005aa0:	0b800593          	li	a1,184
c0005aa4:	00007517          	auipc	a0,0x7
c0005aa8:	79c50513          	addi	a0,a0,1948 # c000d240 <default_pmm_manager+0x84>
c0005aac:	fa4fa0ef          	jal	ra,c0000250 <__panic>
c0005ab0:	e00fe0ef          	jal	ra,c00040b0 <pa2page.part.6>
c0005ab4:	00008697          	auipc	a3,0x8
c0005ab8:	97468693          	addi	a3,a3,-1676 # c000d428 <default_pmm_manager+0x26c>
c0005abc:	00006617          	auipc	a2,0x6
c0005ac0:	6bc60613          	addi	a2,a2,1724 # c000c178 <commands+0x3d8>
c0005ac4:	22200593          	li	a1,546
c0005ac8:	00007517          	auipc	a0,0x7
c0005acc:	77850513          	addi	a0,a0,1912 # c000d240 <default_pmm_manager+0x84>
c0005ad0:	f80fa0ef          	jal	ra,c0000250 <__panic>
c0005ad4:	00007617          	auipc	a2,0x7
c0005ad8:	f8860613          	addi	a2,a2,-120 # c000ca5c <commands+0xcbc>
c0005adc:	22100593          	li	a1,545
c0005ae0:	00007517          	auipc	a0,0x7
c0005ae4:	76050513          	addi	a0,a0,1888 # c000d240 <default_pmm_manager+0x84>
c0005ae8:	f68fa0ef          	jal	ra,c0000250 <__panic>
c0005aec:	00008697          	auipc	a3,0x8
c0005af0:	92868693          	addi	a3,a3,-1752 # c000d414 <default_pmm_manager+0x258>
c0005af4:	00006617          	auipc	a2,0x6
c0005af8:	68460613          	addi	a2,a2,1668 # c000c178 <commands+0x3d8>
c0005afc:	21f00593          	li	a1,543
c0005b00:	00007517          	auipc	a0,0x7
c0005b04:	74050513          	addi	a0,a0,1856 # c000d240 <default_pmm_manager+0x84>
c0005b08:	f48fa0ef          	jal	ra,c0000250 <__panic>
c0005b0c:	00008697          	auipc	a3,0x8
c0005b10:	8f068693          	addi	a3,a3,-1808 # c000d3fc <default_pmm_manager+0x240>
c0005b14:	00006617          	auipc	a2,0x6
c0005b18:	66460613          	addi	a2,a2,1636 # c000c178 <commands+0x3d8>
c0005b1c:	21e00593          	li	a1,542
c0005b20:	00007517          	auipc	a0,0x7
c0005b24:	72050513          	addi	a0,a0,1824 # c000d240 <default_pmm_manager+0x84>
c0005b28:	f28fa0ef          	jal	ra,c0000250 <__panic>
c0005b2c:	00007617          	auipc	a2,0x7
c0005b30:	21860613          	addi	a2,a2,536 # c000cd44 <commands+0xfa4>
c0005b34:	07300593          	li	a1,115
c0005b38:	00007517          	auipc	a0,0x7
c0005b3c:	cdc50513          	addi	a0,a0,-804 # c000c814 <commands+0xa74>
c0005b40:	f10fa0ef          	jal	ra,c0000250 <__panic>
c0005b44:	00008697          	auipc	a3,0x8
c0005b48:	88868693          	addi	a3,a3,-1912 # c000d3cc <default_pmm_manager+0x210>
c0005b4c:	00006617          	auipc	a2,0x6
c0005b50:	62c60613          	addi	a2,a2,1580 # c000c178 <commands+0x3d8>
c0005b54:	21d00593          	li	a1,541
c0005b58:	00007517          	auipc	a0,0x7
c0005b5c:	6e850513          	addi	a0,a0,1768 # c000d240 <default_pmm_manager+0x84>
c0005b60:	ef0fa0ef          	jal	ra,c0000250 <__panic>
c0005b64:	00008697          	auipc	a3,0x8
c0005b68:	92468693          	addi	a3,a3,-1756 # c000d488 <default_pmm_manager+0x2cc>
c0005b6c:	00006617          	auipc	a2,0x6
c0005b70:	60c60613          	addi	a2,a2,1548 # c000c178 <commands+0x3d8>
c0005b74:	22600593          	li	a1,550
c0005b78:	00007517          	auipc	a0,0x7
c0005b7c:	6c850513          	addi	a0,a0,1736 # c000d240 <default_pmm_manager+0x84>
c0005b80:	ed0fa0ef          	jal	ra,c0000250 <__panic>
c0005b84:	00008697          	auipc	a3,0x8
c0005b88:	8cc68693          	addi	a3,a3,-1844 # c000d450 <default_pmm_manager+0x294>
c0005b8c:	00006617          	auipc	a2,0x6
c0005b90:	5ec60613          	addi	a2,a2,1516 # c000c178 <commands+0x3d8>
c0005b94:	22500593          	li	a1,549
c0005b98:	00007517          	auipc	a0,0x7
c0005b9c:	6a850513          	addi	a0,a0,1704 # c000d240 <default_pmm_manager+0x84>
c0005ba0:	eb0fa0ef          	jal	ra,c0000250 <__panic>
c0005ba4:	00078693          	mv	a3,a5
c0005ba8:	00007617          	auipc	a2,0x7
c0005bac:	eb460613          	addi	a2,a2,-332 # c000ca5c <commands+0xcbc>
c0005bb0:	0ea00593          	li	a1,234
c0005bb4:	00007517          	auipc	a0,0x7
c0005bb8:	68c50513          	addi	a0,a0,1676 # c000d240 <default_pmm_manager+0x84>
c0005bbc:	e94fa0ef          	jal	ra,c0000250 <__panic>
c0005bc0:	00007617          	auipc	a2,0x7
c0005bc4:	6bc60613          	addi	a2,a2,1724 # c000d27c <default_pmm_manager+0xc0>
c0005bc8:	07300593          	li	a1,115
c0005bcc:	00007517          	auipc	a0,0x7
c0005bd0:	67450513          	addi	a0,a0,1652 # c000d240 <default_pmm_manager+0x84>
c0005bd4:	e7cfa0ef          	jal	ra,c0000250 <__panic>
c0005bd8:	00008697          	auipc	a3,0x8
c0005bdc:	b8068693          	addi	a3,a3,-1152 # c000d758 <default_pmm_manager+0x59c>
c0005be0:	00006617          	auipc	a2,0x6
c0005be4:	59860613          	addi	a2,a2,1432 # c000c178 <commands+0x3d8>
c0005be8:	25f00593          	li	a1,607
c0005bec:	00007517          	auipc	a0,0x7
c0005bf0:	65450513          	addi	a0,a0,1620 # c000d240 <default_pmm_manager+0x84>
c0005bf4:	e5cfa0ef          	jal	ra,c0000250 <__panic>
c0005bf8:	00008697          	auipc	a3,0x8
c0005bfc:	a7068693          	addi	a3,a3,-1424 # c000d668 <default_pmm_manager+0x4ac>
c0005c00:	00006617          	auipc	a2,0x6
c0005c04:	57860613          	addi	a2,a2,1400 # c000c178 <commands+0x3d8>
c0005c08:	25500593          	li	a1,597
c0005c0c:	00007517          	auipc	a0,0x7
c0005c10:	63450513          	addi	a0,a0,1588 # c000d240 <default_pmm_manager+0x84>
c0005c14:	e3cfa0ef          	jal	ra,c0000250 <__panic>
c0005c18:	00008697          	auipc	a3,0x8
c0005c1c:	a3c68693          	addi	a3,a3,-1476 # c000d654 <default_pmm_manager+0x498>
c0005c20:	00006617          	auipc	a2,0x6
c0005c24:	55860613          	addi	a2,a2,1368 # c000c178 <commands+0x3d8>
c0005c28:	25100593          	li	a1,593
c0005c2c:	00007517          	auipc	a0,0x7
c0005c30:	61450513          	addi	a0,a0,1556 # c000d240 <default_pmm_manager+0x84>
c0005c34:	e1cfa0ef          	jal	ra,c0000250 <__panic>
c0005c38:	00008697          	auipc	a3,0x8
c0005c3c:	9e868693          	addi	a3,a3,-1560 # c000d620 <default_pmm_manager+0x464>
c0005c40:	00006617          	auipc	a2,0x6
c0005c44:	53860613          	addi	a2,a2,1336 # c000c178 <commands+0x3d8>
c0005c48:	24f00593          	li	a1,591
c0005c4c:	00007517          	auipc	a0,0x7
c0005c50:	5f450513          	addi	a0,a0,1524 # c000d240 <default_pmm_manager+0x84>
c0005c54:	dfcfa0ef          	jal	ra,c0000250 <__panic>
c0005c58:	00007617          	auipc	a2,0x7
c0005c5c:	e2860613          	addi	a2,a2,-472 # c000ca80 <commands+0xce0>
c0005c60:	24f00593          	li	a1,591
c0005c64:	00007517          	auipc	a0,0x7
c0005c68:	5dc50513          	addi	a0,a0,1500 # c000d240 <default_pmm_manager+0x84>
c0005c6c:	de4fa0ef          	jal	ra,c0000250 <__panic>
c0005c70:	00008697          	auipc	a3,0x8
c0005c74:	91468693          	addi	a3,a3,-1772 # c000d584 <default_pmm_manager+0x3c8>
c0005c78:	00006617          	auipc	a2,0x6
c0005c7c:	50060613          	addi	a2,a2,1280 # c000c178 <commands+0x3d8>
c0005c80:	23b00593          	li	a1,571
c0005c84:	00007517          	auipc	a0,0x7
c0005c88:	5bc50513          	addi	a0,a0,1468 # c000d240 <default_pmm_manager+0x84>
c0005c8c:	dc4fa0ef          	jal	ra,c0000250 <__panic>
c0005c90:	00008697          	auipc	a3,0x8
c0005c94:	a6468693          	addi	a3,a3,-1436 # c000d6f4 <default_pmm_manager+0x538>
c0005c98:	00006617          	auipc	a2,0x6
c0005c9c:	4e060613          	addi	a2,a2,1248 # c000c178 <commands+0x3d8>
c0005ca0:	25800593          	li	a1,600
c0005ca4:	00007517          	auipc	a0,0x7
c0005ca8:	59c50513          	addi	a0,a0,1436 # c000d240 <default_pmm_manager+0x84>
c0005cac:	da4fa0ef          	jal	ra,c0000250 <__panic>
c0005cb0:	00008697          	auipc	a3,0x8
c0005cb4:	a0468693          	addi	a3,a3,-1532 # c000d6b4 <default_pmm_manager+0x4f8>
c0005cb8:	00006617          	auipc	a2,0x6
c0005cbc:	4c060613          	addi	a2,a2,1216 # c000c178 <commands+0x3d8>
c0005cc0:	25700593          	li	a1,599
c0005cc4:	00007517          	auipc	a0,0x7
c0005cc8:	57c50513          	addi	a0,a0,1404 # c000d240 <default_pmm_manager+0x84>
c0005ccc:	d84fa0ef          	jal	ra,c0000250 <__panic>
c0005cd0:	00008697          	auipc	a3,0x8
c0005cd4:	9d068693          	addi	a3,a3,-1584 # c000d6a0 <default_pmm_manager+0x4e4>
c0005cd8:	00006617          	auipc	a2,0x6
c0005cdc:	4a060613          	addi	a2,a2,1184 # c000c178 <commands+0x3d8>
c0005ce0:	25600593          	li	a1,598
c0005ce4:	00007517          	auipc	a0,0x7
c0005ce8:	55c50513          	addi	a0,a0,1372 # c000d240 <default_pmm_manager+0x84>
c0005cec:	d64fa0ef          	jal	ra,c0000250 <__panic>
c0005cf0:	00078693          	mv	a3,a5
c0005cf4:	00007617          	auipc	a2,0x7
c0005cf8:	d6860613          	addi	a2,a2,-664 # c000ca5c <commands+0xcbc>
c0005cfc:	08b00593          	li	a1,139
c0005d00:	00007517          	auipc	a0,0x7
c0005d04:	54050513          	addi	a0,a0,1344 # c000d240 <default_pmm_manager+0x84>
c0005d08:	d48fa0ef          	jal	ra,c0000250 <__panic>
c0005d0c:	00008697          	auipc	a3,0x8
c0005d10:	a1468693          	addi	a3,a3,-1516 # c000d720 <default_pmm_manager+0x564>
c0005d14:	00006617          	auipc	a2,0x6
c0005d18:	46460613          	addi	a2,a2,1124 # c000c178 <commands+0x3d8>
c0005d1c:	25c00593          	li	a1,604
c0005d20:	00007517          	auipc	a0,0x7
c0005d24:	52050513          	addi	a0,a0,1312 # c000d240 <default_pmm_manager+0x84>
c0005d28:	d28fa0ef          	jal	ra,c0000250 <__panic>
c0005d2c:	00007617          	auipc	a2,0x7
c0005d30:	d5460613          	addi	a2,a2,-684 # c000ca80 <commands+0xce0>
c0005d34:	09100593          	li	a1,145
c0005d38:	00007517          	auipc	a0,0x7
c0005d3c:	50850513          	addi	a0,a0,1288 # c000d240 <default_pmm_manager+0x84>
c0005d40:	d10fa0ef          	jal	ra,c0000250 <__panic>

c0005d44 <swapfs_init>:
c0005d44:	ff010113          	addi	sp,sp,-16
c0005d48:	00100513          	li	a0,1
c0005d4c:	00112623          	sw	ra,12(sp)
c0005d50:	939fa0ef          	jal	ra,c0000688 <ide_device_valid>
c0005d54:	02050263          	beqz	a0,c0005d78 <swapfs_init+0x34>
c0005d58:	00100513          	li	a0,1
c0005d5c:	935fa0ef          	jal	ra,c0000690 <ide_device_size>
c0005d60:	00c12083          	lw	ra,12(sp)
c0005d64:	00355513          	srli	a0,a0,0x3
c0005d68:	00039297          	auipc	t0,0x39
c0005d6c:	f4a2a023          	sw	a0,-192(t0) # c003eca8 <max_swap_offset>
c0005d70:	01010113          	addi	sp,sp,16
c0005d74:	00008067          	ret
c0005d78:	00008617          	auipc	a2,0x8
c0005d7c:	b1460613          	addi	a2,a2,-1260 # c000d88c <default_pmm_manager+0x6d0>
c0005d80:	00d00593          	li	a1,13
c0005d84:	00008517          	auipc	a0,0x8
c0005d88:	b2450513          	addi	a0,a0,-1244 # c000d8a8 <default_pmm_manager+0x6ec>
c0005d8c:	cc4fa0ef          	jal	ra,c0000250 <__panic>

c0005d90 <swapfs_read>:
c0005d90:	ff010113          	addi	sp,sp,-16
c0005d94:	00112623          	sw	ra,12(sp)
c0005d98:	00855793          	srli	a5,a0,0x8
c0005d9c:	06078663          	beqz	a5,c0005e08 <swapfs_read+0x78>
c0005da0:	00039717          	auipc	a4,0x39
c0005da4:	f0872703          	lw	a4,-248(a4) # c003eca8 <max_swap_offset>
c0005da8:	06e7f063          	bleu	a4,a5,c0005e08 <swapfs_read+0x78>
c0005dac:	00039617          	auipc	a2,0x39
c0005db0:	f3c62603          	lw	a2,-196(a2) # c003ece8 <pages>
c0005db4:	40c58633          	sub	a2,a1,a2
c0005db8:	40565613          	srai	a2,a2,0x5
c0005dbc:	00030597          	auipc	a1,0x30
c0005dc0:	9fc5a583          	lw	a1,-1540(a1) # c00357b8 <nbase>
c0005dc4:	00100737          	lui	a4,0x100
c0005dc8:	00b60633          	add	a2,a2,a1
c0005dcc:	fff70713          	addi	a4,a4,-1 # fffff <_binary_obj___user_matrix_out_size+0xfd7f7>
c0005dd0:	00e67733          	and	a4,a2,a4
c0005dd4:	00039697          	auipc	a3,0x39
c0005dd8:	e286a683          	lw	a3,-472(a3) # c003ebfc <npage>
c0005ddc:	00379593          	slli	a1,a5,0x3
c0005de0:	00c61613          	slli	a2,a2,0xc
c0005de4:	04d77063          	bleu	a3,a4,c0005e24 <swapfs_read+0x94>
c0005de8:	00c12083          	lw	ra,12(sp)
c0005dec:	00039797          	auipc	a5,0x39
c0005df0:	ef47a783          	lw	a5,-268(a5) # c003ece0 <va_pa_offset>
c0005df4:	00800693          	li	a3,8
c0005df8:	00f60633          	add	a2,a2,a5
c0005dfc:	00100513          	li	a0,1
c0005e00:	01010113          	addi	sp,sp,16
c0005e04:	895fa06f          	j	c0000698 <ide_read_secs>
c0005e08:	00050693          	mv	a3,a0
c0005e0c:	00008617          	auipc	a2,0x8
c0005e10:	ab060613          	addi	a2,a2,-1360 # c000d8bc <default_pmm_manager+0x700>
c0005e14:	01400593          	li	a1,20
c0005e18:	00008517          	auipc	a0,0x8
c0005e1c:	a9050513          	addi	a0,a0,-1392 # c000d8a8 <default_pmm_manager+0x6ec>
c0005e20:	c30fa0ef          	jal	ra,c0000250 <__panic>
c0005e24:	00060693          	mv	a3,a2
c0005e28:	06800593          	li	a1,104
c0005e2c:	00007617          	auipc	a2,0x7
c0005e30:	c3060613          	addi	a2,a2,-976 # c000ca5c <commands+0xcbc>
c0005e34:	00007517          	auipc	a0,0x7
c0005e38:	9e050513          	addi	a0,a0,-1568 # c000c814 <commands+0xa74>
c0005e3c:	c14fa0ef          	jal	ra,c0000250 <__panic>

c0005e40 <swapfs_write>:
c0005e40:	ff010113          	addi	sp,sp,-16
c0005e44:	00112623          	sw	ra,12(sp)
c0005e48:	00855793          	srli	a5,a0,0x8
c0005e4c:	06078663          	beqz	a5,c0005eb8 <swapfs_write+0x78>
c0005e50:	00039717          	auipc	a4,0x39
c0005e54:	e5872703          	lw	a4,-424(a4) # c003eca8 <max_swap_offset>
c0005e58:	06e7f063          	bleu	a4,a5,c0005eb8 <swapfs_write+0x78>
c0005e5c:	00039617          	auipc	a2,0x39
c0005e60:	e8c62603          	lw	a2,-372(a2) # c003ece8 <pages>
c0005e64:	40c58633          	sub	a2,a1,a2
c0005e68:	40565613          	srai	a2,a2,0x5
c0005e6c:	00030597          	auipc	a1,0x30
c0005e70:	94c5a583          	lw	a1,-1716(a1) # c00357b8 <nbase>
c0005e74:	00100737          	lui	a4,0x100
c0005e78:	00b60633          	add	a2,a2,a1
c0005e7c:	fff70713          	addi	a4,a4,-1 # fffff <_binary_obj___user_matrix_out_size+0xfd7f7>
c0005e80:	00e67733          	and	a4,a2,a4
c0005e84:	00039697          	auipc	a3,0x39
c0005e88:	d786a683          	lw	a3,-648(a3) # c003ebfc <npage>
c0005e8c:	00379593          	slli	a1,a5,0x3
c0005e90:	00c61613          	slli	a2,a2,0xc
c0005e94:	04d77063          	bleu	a3,a4,c0005ed4 <swapfs_write+0x94>
c0005e98:	00c12083          	lw	ra,12(sp)
c0005e9c:	00039797          	auipc	a5,0x39
c0005ea0:	e447a783          	lw	a5,-444(a5) # c003ece0 <va_pa_offset>
c0005ea4:	00800693          	li	a3,8
c0005ea8:	00f60633          	add	a2,a2,a5
c0005eac:	00100513          	li	a0,1
c0005eb0:	01010113          	addi	sp,sp,16
c0005eb4:	819fa06f          	j	c00006cc <ide_write_secs>
c0005eb8:	00050693          	mv	a3,a0
c0005ebc:	00008617          	auipc	a2,0x8
c0005ec0:	a0060613          	addi	a2,a2,-1536 # c000d8bc <default_pmm_manager+0x700>
c0005ec4:	01900593          	li	a1,25
c0005ec8:	00008517          	auipc	a0,0x8
c0005ecc:	9e050513          	addi	a0,a0,-1568 # c000d8a8 <default_pmm_manager+0x6ec>
c0005ed0:	b80fa0ef          	jal	ra,c0000250 <__panic>
c0005ed4:	00060693          	mv	a3,a2
c0005ed8:	06800593          	li	a1,104
c0005edc:	00007617          	auipc	a2,0x7
c0005ee0:	b8060613          	addi	a2,a2,-1152 # c000ca5c <commands+0xcbc>
c0005ee4:	00007517          	auipc	a0,0x7
c0005ee8:	93050513          	addi	a0,a0,-1744 # c000c814 <commands+0xa74>
c0005eec:	b64fa0ef          	jal	ra,c0000250 <__panic>

c0005ef0 <switch_to>:
c0005ef0:	00152023          	sw	ra,0(a0)
c0005ef4:	00252223          	sw	sp,4(a0)
c0005ef8:	00852423          	sw	s0,8(a0)
c0005efc:	00952623          	sw	s1,12(a0)
c0005f00:	01252823          	sw	s2,16(a0)
c0005f04:	01352a23          	sw	s3,20(a0)
c0005f08:	01452c23          	sw	s4,24(a0)
c0005f0c:	01552e23          	sw	s5,28(a0)
c0005f10:	03652023          	sw	s6,32(a0)
c0005f14:	03752223          	sw	s7,36(a0)
c0005f18:	03852423          	sw	s8,40(a0)
c0005f1c:	03952623          	sw	s9,44(a0)
c0005f20:	03a52823          	sw	s10,48(a0)
c0005f24:	03b52a23          	sw	s11,52(a0)
c0005f28:	0005a083          	lw	ra,0(a1)
c0005f2c:	0045a103          	lw	sp,4(a1)
c0005f30:	0085a403          	lw	s0,8(a1)
c0005f34:	00c5a483          	lw	s1,12(a1)
c0005f38:	0105a903          	lw	s2,16(a1)
c0005f3c:	0145a983          	lw	s3,20(a1)
c0005f40:	0185aa03          	lw	s4,24(a1)
c0005f44:	01c5aa83          	lw	s5,28(a1)
c0005f48:	0205ab03          	lw	s6,32(a1)
c0005f4c:	0245ab83          	lw	s7,36(a1)
c0005f50:	0285ac03          	lw	s8,40(a1)
c0005f54:	02c5ac83          	lw	s9,44(a1)
c0005f58:	0305ad03          	lw	s10,48(a1)
c0005f5c:	0345ad83          	lw	s11,52(a1)
c0005f60:	00008067          	ret

c0005f64 <kernel_thread_entry>:
c0005f64:	00048513          	mv	a0,s1
c0005f68:	000400e7          	jalr	s0
c0005f6c:	1e1000ef          	jal	ra,c000694c <do_exit>

c0005f70 <alloc_proc>:
c0005f70:	ff010113          	addi	sp,sp,-16
c0005f74:	0b800513          	li	a0,184
c0005f78:	00812423          	sw	s0,8(sp)
c0005f7c:	00112623          	sw	ra,12(sp)
c0005f80:	e30fc0ef          	jal	ra,c00025b0 <kmalloc>
c0005f84:	00050413          	mv	s0,a0
c0005f88:	08050863          	beqz	a0,c0006018 <alloc_proc+0xa8>
c0005f8c:	fff00793          	li	a5,-1
c0005f90:	00f52223          	sw	a5,4(a0)
c0005f94:	03800613          	li	a2,56
c0005f98:	00000593          	li	a1,0
c0005f9c:	00052023          	sw	zero,0(a0)
c0005fa0:	00052423          	sw	zero,8(a0)
c0005fa4:	00052623          	sw	zero,12(a0)
c0005fa8:	00052823          	sw	zero,16(a0)
c0005fac:	00052a23          	sw	zero,20(a0)
c0005fb0:	00052c23          	sw	zero,24(a0)
c0005fb4:	01c50513          	addi	a0,a0,28
c0005fb8:	654050ef          	jal	ra,c000b60c <memset>
c0005fbc:	00039797          	auipc	a5,0x39
c0005fc0:	d287a783          	lw	a5,-728(a5) # c003ece4 <boot_cr3>
c0005fc4:	04f42c23          	sw	a5,88(s0)
c0005fc8:	04042a23          	sw	zero,84(s0)
c0005fcc:	04042e23          	sw	zero,92(s0)
c0005fd0:	00f00613          	li	a2,15
c0005fd4:	00000593          	li	a1,0
c0005fd8:	06040513          	addi	a0,s0,96
c0005fdc:	630050ef          	jal	ra,c000b60c <memset>
c0005fe0:	09840793          	addi	a5,s0,152
c0005fe4:	08042223          	sw	zero,132(s0)
c0005fe8:	08042623          	sw	zero,140(s0)
c0005fec:	08042823          	sw	zero,144(s0)
c0005ff0:	08042423          	sw	zero,136(s0)
c0005ff4:	08042a23          	sw	zero,148(s0)
c0005ff8:	08f42e23          	sw	a5,156(s0)
c0005ffc:	08f42c23          	sw	a5,152(s0)
c0006000:	0a042023          	sw	zero,160(s0)
c0006004:	0a042223          	sw	zero,164(s0)
c0006008:	0a042623          	sw	zero,172(s0)
c000600c:	0a042423          	sw	zero,168(s0)
c0006010:	0a042823          	sw	zero,176(s0)
c0006014:	0a042a23          	sw	zero,180(s0)
c0006018:	00c12083          	lw	ra,12(sp)
c000601c:	00040513          	mv	a0,s0
c0006020:	00812403          	lw	s0,8(sp)
c0006024:	01010113          	addi	sp,sp,16
c0006028:	00008067          	ret

c000602c <forkret>:
c000602c:	00039797          	auipc	a5,0x39
c0006030:	bd87a783          	lw	a5,-1064(a5) # c003ec04 <current>
c0006034:	0547a503          	lw	a0,84(a5)
c0006038:	848fb06f          	j	c0001080 <forkrets>

c000603c <user_main>:
c000603c:	00039797          	auipc	a5,0x39
c0006040:	bc87a783          	lw	a5,-1080(a5) # c003ec04 <current>
c0006044:	0047a583          	lw	a1,4(a5)
c0006048:	fd010113          	addi	sp,sp,-48
c000604c:	00008617          	auipc	a2,0x8
c0006050:	c4c60613          	addi	a2,a2,-948 # c000dc98 <default_pmm_manager+0xadc>
c0006054:	00008517          	auipc	a0,0x8
c0006058:	c4c50513          	addi	a0,a0,-948 # c000dca0 <default_pmm_manager+0xae4>
c000605c:	02112623          	sw	ra,44(sp)
c0006060:	87cfa0ef          	jal	ra,c00000dc <cprintf>
c0006064:	00008797          	auipc	a5,0x8
c0006068:	c3478793          	addi	a5,a5,-972 # c000dc98 <default_pmm_manager+0xadc>
c000606c:	3fffc717          	auipc	a4,0x3fffc
c0006070:	5f070713          	addi	a4,a4,1520 # 265c <sbi_remote_fence_i+0x2d6c>
c0006074:	00e12623          	sw	a4,12(sp)
c0006078:	00078513          	mv	a0,a5
c000607c:	00017717          	auipc	a4,0x17
c0006080:	59070713          	addi	a4,a4,1424 # c001d60c <_binary_obj___user_exit_out_start>
c0006084:	00e12c23          	sw	a4,24(sp)
c0006088:	00f12e23          	sw	a5,28(sp)
c000608c:	498050ef          	jal	ra,c000b524 <strlen>
c0006090:	00a12a23          	sw	a0,20(sp)
c0006094:	00400513          	li	a0,4
c0006098:	01c12583          	lw	a1,28(sp)
c000609c:	01412603          	lw	a2,20(sp)
c00060a0:	01812683          	lw	a3,24(sp)
c00060a4:	00c12703          	lw	a4,12(sp)
c00060a8:	00a00893          	li	a7,10
c00060ac:	00000073          	ecall
c00060b0:	00a12823          	sw	a0,16(sp)
c00060b4:	00008617          	auipc	a2,0x8
c00060b8:	c1460613          	addi	a2,a2,-1004 # c000dcc8 <default_pmm_manager+0xb0c>
c00060bc:	36100593          	li	a1,865
c00060c0:	00008517          	auipc	a0,0x8
c00060c4:	c2450513          	addi	a0,a0,-988 # c000dce4 <default_pmm_manager+0xb28>
c00060c8:	988fa0ef          	jal	ra,c0000250 <__panic>

c00060cc <put_pgdir>:
c00060cc:	00c52683          	lw	a3,12(a0)
c00060d0:	ff010113          	addi	sp,sp,-16
c00060d4:	00112623          	sw	ra,12(sp)
c00060d8:	c00007b7          	lui	a5,0xc0000
c00060dc:	04f6e663          	bltu	a3,a5,c0006128 <put_pgdir+0x5c>
c00060e0:	00039517          	auipc	a0,0x39
c00060e4:	c0052503          	lw	a0,-1024(a0) # c003ece0 <va_pa_offset>
c00060e8:	40a686b3          	sub	a3,a3,a0
c00060ec:	00c6d693          	srli	a3,a3,0xc
c00060f0:	00039797          	auipc	a5,0x39
c00060f4:	b0c7a783          	lw	a5,-1268(a5) # c003ebfc <npage>
c00060f8:	04f6f463          	bleu	a5,a3,c0006140 <put_pgdir+0x74>
c00060fc:	0002f517          	auipc	a0,0x2f
c0006100:	6bc52503          	lw	a0,1724(a0) # c00357b8 <nbase>
c0006104:	40a686b3          	sub	a3,a3,a0
c0006108:	00c12083          	lw	ra,12(sp)
c000610c:	00569693          	slli	a3,a3,0x5
c0006110:	00039517          	auipc	a0,0x39
c0006114:	bd852503          	lw	a0,-1064(a0) # c003ece8 <pages>
c0006118:	00100593          	li	a1,1
c000611c:	00d50533          	add	a0,a0,a3
c0006120:	01010113          	addi	sp,sp,16
c0006124:	860fe06f          	j	c0004184 <free_pages>
c0006128:	00007617          	auipc	a2,0x7
c000612c:	95860613          	addi	a2,a2,-1704 # c000ca80 <commands+0xce0>
c0006130:	06d00593          	li	a1,109
c0006134:	00006517          	auipc	a0,0x6
c0006138:	6e050513          	addi	a0,a0,1760 # c000c814 <commands+0xa74>
c000613c:	914fa0ef          	jal	ra,c0000250 <__panic>
c0006140:	00006617          	auipc	a2,0x6
c0006144:	6b460613          	addi	a2,a2,1716 # c000c7f4 <commands+0xa54>
c0006148:	06100593          	li	a1,97
c000614c:	00006517          	auipc	a0,0x6
c0006150:	6c850513          	addi	a0,a0,1736 # c000c814 <commands+0xa74>
c0006154:	8fcfa0ef          	jal	ra,c0000250 <__panic>

c0006158 <setup_pgdir>:
c0006158:	fe010113          	addi	sp,sp,-32
c000615c:	01212823          	sw	s2,16(sp)
c0006160:	00050913          	mv	s2,a0
c0006164:	00100513          	li	a0,1
c0006168:	00112e23          	sw	ra,28(sp)
c000616c:	00812c23          	sw	s0,24(sp)
c0006170:	00912a23          	sw	s1,20(sp)
c0006174:	01312623          	sw	s3,12(sp)
c0006178:	f59fd0ef          	jal	ra,c00040d0 <alloc_pages>
c000617c:	0a050a63          	beqz	a0,c0006230 <setup_pgdir+0xd8>
c0006180:	00039697          	auipc	a3,0x39
c0006184:	b686a683          	lw	a3,-1176(a3) # c003ece8 <pages>
c0006188:	40d506b3          	sub	a3,a0,a3
c000618c:	0002f997          	auipc	s3,0x2f
c0006190:	62c9a983          	lw	s3,1580(s3) # c00357b8 <nbase>
c0006194:	4056d693          	srai	a3,a3,0x5
c0006198:	001007b7          	lui	a5,0x100
c000619c:	013686b3          	add	a3,a3,s3
c00061a0:	fff78793          	addi	a5,a5,-1 # fffff <_binary_obj___user_matrix_out_size+0xfd7f7>
c00061a4:	00f6f7b3          	and	a5,a3,a5
c00061a8:	00039717          	auipc	a4,0x39
c00061ac:	a5472703          	lw	a4,-1452(a4) # c003ebfc <npage>
c00061b0:	00050413          	mv	s0,a0
c00061b4:	00c69693          	slli	a3,a3,0xc
c00061b8:	08e7f063          	bleu	a4,a5,c0006238 <setup_pgdir+0xe0>
c00061bc:	00039497          	auipc	s1,0x39
c00061c0:	b244a483          	lw	s1,-1244(s1) # c003ece0 <va_pa_offset>
c00061c4:	009684b3          	add	s1,a3,s1
c00061c8:	00001637          	lui	a2,0x1
c00061cc:	00039597          	auipc	a1,0x39
c00061d0:	a2c5a583          	lw	a1,-1492(a1) # c003ebf8 <boot_pgdir>
c00061d4:	00048513          	mv	a0,s1
c00061d8:	450050ef          	jal	ra,c000b628 <memcpy>
c00061dc:	00039797          	auipc	a5,0x39
c00061e0:	b0c7a783          	lw	a5,-1268(a5) # c003ece8 <pages>
c00061e4:	40f40433          	sub	s0,s0,a5
c00061e8:	40545413          	srai	s0,s0,0x5
c00061ec:	01340433          	add	s0,s0,s3
c00061f0:	00a41413          	slli	s0,s0,0xa
c00061f4:	000017b7          	lui	a5,0x1
c00061f8:	00f487b3          	add	a5,s1,a5
c00061fc:	00146713          	ori	a4,s0,1
c0006200:	00746413          	ori	s0,s0,7
c0006204:	fae7a623          	sw	a4,-84(a5) # fac <_binary_obj___user_faultread_out_size-0xfbc>
c0006208:	fa87a823          	sw	s0,-80(a5)
c000620c:	00992623          	sw	s1,12(s2) # 100c <_binary_obj___user_faultread_out_size-0xf5c>
c0006210:	00000513          	li	a0,0
c0006214:	01c12083          	lw	ra,28(sp)
c0006218:	01812403          	lw	s0,24(sp)
c000621c:	01412483          	lw	s1,20(sp)
c0006220:	01012903          	lw	s2,16(sp)
c0006224:	00c12983          	lw	s3,12(sp)
c0006228:	02010113          	addi	sp,sp,32
c000622c:	00008067          	ret
c0006230:	ffc00513          	li	a0,-4
c0006234:	fe1ff06f          	j	c0006214 <setup_pgdir+0xbc>
c0006238:	00007617          	auipc	a2,0x7
c000623c:	82460613          	addi	a2,a2,-2012 # c000ca5c <commands+0xcbc>
c0006240:	06800593          	li	a1,104
c0006244:	00006517          	auipc	a0,0x6
c0006248:	5d050513          	addi	a0,a0,1488 # c000c814 <commands+0xa74>
c000624c:	804fa0ef          	jal	ra,c0000250 <__panic>

c0006250 <set_proc_name>:
c0006250:	ff010113          	addi	sp,sp,-16
c0006254:	00812423          	sw	s0,8(sp)
c0006258:	06050413          	addi	s0,a0,96
c000625c:	00912223          	sw	s1,4(sp)
c0006260:	01000613          	li	a2,16
c0006264:	00058493          	mv	s1,a1
c0006268:	00040513          	mv	a0,s0
c000626c:	00000593          	li	a1,0
c0006270:	00112623          	sw	ra,12(sp)
c0006274:	398050ef          	jal	ra,c000b60c <memset>
c0006278:	00048593          	mv	a1,s1
c000627c:	00040513          	mv	a0,s0
c0006280:	00c12083          	lw	ra,12(sp)
c0006284:	00812403          	lw	s0,8(sp)
c0006288:	00412483          	lw	s1,4(sp)
c000628c:	00f00613          	li	a2,15
c0006290:	01010113          	addi	sp,sp,16
c0006294:	3940506f          	j	c000b628 <memcpy>

c0006298 <proc_run>:
c0006298:	ff010113          	addi	sp,sp,-16
c000629c:	00912223          	sw	s1,4(sp)
c00062a0:	00112623          	sw	ra,12(sp)
c00062a4:	00812423          	sw	s0,8(sp)
c00062a8:	01212023          	sw	s2,0(sp)
c00062ac:	00039497          	auipc	s1,0x39
c00062b0:	9584a483          	lw	s1,-1704(s1) # c003ec04 <current>
c00062b4:	02a48e63          	beq	s1,a0,c00062f0 <proc_run+0x58>
c00062b8:	00050413          	mv	s0,a0
c00062bc:	100027f3          	csrr	a5,sstatus
c00062c0:	0027f793          	andi	a5,a5,2
c00062c4:	00000913          	li	s2,0
c00062c8:	04079c63          	bnez	a5,c0006320 <proc_run+0x88>
c00062cc:	05842783          	lw	a5,88(s0)
c00062d0:	00039297          	auipc	t0,0x39
c00062d4:	9282aa23          	sw	s0,-1740(t0) # c003ec04 <current>
c00062d8:	00c7d793          	srli	a5,a5,0xc
c00062dc:	18079073          	csrw	sptbr,a5
c00062e0:	01c40593          	addi	a1,s0,28
c00062e4:	01c48513          	addi	a0,s1,28
c00062e8:	c09ff0ef          	jal	ra,c0005ef0 <switch_to>
c00062ec:	00091e63          	bnez	s2,c0006308 <proc_run+0x70>
c00062f0:	00c12083          	lw	ra,12(sp)
c00062f4:	00812403          	lw	s0,8(sp)
c00062f8:	00412483          	lw	s1,4(sp)
c00062fc:	00012903          	lw	s2,0(sp)
c0006300:	01010113          	addi	sp,sp,16
c0006304:	00008067          	ret
c0006308:	00c12083          	lw	ra,12(sp)
c000630c:	00812403          	lw	s0,8(sp)
c0006310:	00412483          	lw	s1,4(sp)
c0006314:	00012903          	lw	s2,0(sp)
c0006318:	01010113          	addi	sp,sp,16
c000631c:	d00fa06f          	j	c000081c <intr_enable>
c0006320:	d04fa0ef          	jal	ra,c0000824 <intr_disable>
c0006324:	00100913          	li	s2,1
c0006328:	fa5ff06f          	j	c00062cc <proc_run+0x34>

c000632c <find_proc>:
c000632c:	000027b7          	lui	a5,0x2
c0006330:	fff50713          	addi	a4,a0,-1
c0006334:	ffe78793          	addi	a5,a5,-2 # 1ffe <_binary_obj___user_softint_out_size+0x92>
c0006338:	06e7e663          	bltu	a5,a4,c00063a4 <find_proc+0x78>
c000633c:	ff010113          	addi	sp,sp,-16
c0006340:	00a00593          	li	a1,10
c0006344:	00812423          	sw	s0,8(sp)
c0006348:	00112623          	sw	ra,12(sp)
c000634c:	00050413          	mv	s0,a0
c0006350:	0f1050ef          	jal	ra,c000bc40 <hash32>
c0006354:	00037797          	auipc	a5,0x37
c0006358:	87478793          	addi	a5,a5,-1932 # c003cbc8 <hash_list>
c000635c:	00351513          	slli	a0,a0,0x3
c0006360:	00a78533          	add	a0,a5,a0
c0006364:	00050793          	mv	a5,a0
c0006368:	00c0006f          	j	c0006374 <find_proc+0x48>
c000636c:	f8c7a703          	lw	a4,-116(a5)
c0006370:	02e40063          	beq	s0,a4,c0006390 <find_proc+0x64>
c0006374:	0047a783          	lw	a5,4(a5)
c0006378:	fef51ae3          	bne	a0,a5,c000636c <find_proc+0x40>
c000637c:	00c12083          	lw	ra,12(sp)
c0006380:	00000513          	li	a0,0
c0006384:	00812403          	lw	s0,8(sp)
c0006388:	01010113          	addi	sp,sp,16
c000638c:	00008067          	ret
c0006390:	00c12083          	lw	ra,12(sp)
c0006394:	f8878513          	addi	a0,a5,-120
c0006398:	00812403          	lw	s0,8(sp)
c000639c:	01010113          	addi	sp,sp,16
c00063a0:	00008067          	ret
c00063a4:	00000513          	li	a0,0
c00063a8:	00008067          	ret

c00063ac <do_fork>:
c00063ac:	00039717          	auipc	a4,0x39
c00063b0:	86472703          	lw	a4,-1948(a4) # c003ec10 <nr_process>
c00063b4:	000017b7          	lui	a5,0x1
c00063b8:	46f75463          	ble	a5,a4,c0006820 <do_fork+0x474>
c00063bc:	fd010113          	addi	sp,sp,-48
c00063c0:	02812423          	sw	s0,40(sp)
c00063c4:	02912223          	sw	s1,36(sp)
c00063c8:	03212023          	sw	s2,32(sp)
c00063cc:	01312e23          	sw	s3,28(sp)
c00063d0:	02112623          	sw	ra,44(sp)
c00063d4:	01412c23          	sw	s4,24(sp)
c00063d8:	01512a23          	sw	s5,20(sp)
c00063dc:	01612823          	sw	s6,16(sp)
c00063e0:	01712623          	sw	s7,12(sp)
c00063e4:	00050993          	mv	s3,a0
c00063e8:	00058913          	mv	s2,a1
c00063ec:	00060493          	mv	s1,a2
c00063f0:	b81ff0ef          	jal	ra,c0005f70 <alloc_proc>
c00063f4:	00050413          	mv	s0,a0
c00063f8:	40050663          	beqz	a0,c0006804 <do_fork+0x458>
c00063fc:	00039797          	auipc	a5,0x39
c0006400:	8087a783          	lw	a5,-2040(a5) # c003ec04 <current>
c0006404:	0847a703          	lw	a4,132(a5)
c0006408:	00f52a23          	sw	a5,20(a0)
c000640c:	4a071263          	bnez	a4,c00068b0 <do_fork+0x504>
c0006410:	00200513          	li	a0,2
c0006414:	cbdfd0ef          	jal	ra,c00040d0 <alloc_pages>
c0006418:	3e050263          	beqz	a0,c00067fc <do_fork+0x450>
c000641c:	00039697          	auipc	a3,0x39
c0006420:	8cc6a683          	lw	a3,-1844(a3) # c003ece8 <pages>
c0006424:	40d506b3          	sub	a3,a0,a3
c0006428:	4056d693          	srai	a3,a3,0x5
c000642c:	0002fa17          	auipc	s4,0x2f
c0006430:	38ca2a03          	lw	s4,908(s4) # c00357b8 <nbase>
c0006434:	001007b7          	lui	a5,0x100
c0006438:	014686b3          	add	a3,a3,s4
c000643c:	fff78793          	addi	a5,a5,-1 # fffff <_binary_obj___user_matrix_out_size+0xfd7f7>
c0006440:	00f6f7b3          	and	a5,a3,a5
c0006444:	00038717          	auipc	a4,0x38
c0006448:	7b872703          	lw	a4,1976(a4) # c003ebfc <npage>
c000644c:	00c69693          	slli	a3,a3,0xc
c0006450:	42e7fc63          	bleu	a4,a5,c0006888 <do_fork+0x4dc>
c0006454:	00038797          	auipc	a5,0x38
c0006458:	7b07a783          	lw	a5,1968(a5) # c003ec04 <current>
c000645c:	0187aa83          	lw	s5,24(a5)
c0006460:	00039797          	auipc	a5,0x39
c0006464:	8807a783          	lw	a5,-1920(a5) # c003ece0 <va_pa_offset>
c0006468:	00f686b3          	add	a3,a3,a5
c000646c:	00d42623          	sw	a3,12(s0)
c0006470:	020a8e63          	beqz	s5,c00064ac <do_fork+0x100>
c0006474:	1009f993          	andi	s3,s3,256
c0006478:	2c098263          	beqz	s3,c000673c <do_fork+0x390>
c000647c:	018aa783          	lw	a5,24(s5) # ffc00018 <sbi_remote_fence_i+0xffc00728>
c0006480:	00caa683          	lw	a3,12(s5)
c0006484:	c0000737          	lui	a4,0xc0000
c0006488:	00178793          	addi	a5,a5,1
c000648c:	00faac23          	sw	a5,24(s5)
c0006490:	01542c23          	sw	s5,24(s0)
c0006494:	3ce6ee63          	bltu	a3,a4,c0006870 <do_fork+0x4c4>
c0006498:	00039797          	auipc	a5,0x39
c000649c:	8487a783          	lw	a5,-1976(a5) # c003ece0 <va_pa_offset>
c00064a0:	40f686b3          	sub	a3,a3,a5
c00064a4:	04d42c23          	sw	a3,88(s0)
c00064a8:	00c42683          	lw	a3,12(s0)
c00064ac:	00002737          	lui	a4,0x2
c00064b0:	f7070713          	addi	a4,a4,-144 # 1f70 <_binary_obj___user_softint_out_size+0x4>
c00064b4:	00e68733          	add	a4,a3,a4
c00064b8:	00048613          	mv	a2,s1
c00064bc:	04e42a23          	sw	a4,84(s0)
c00064c0:	00070793          	mv	a5,a4
c00064c4:	08048593          	addi	a1,s1,128
c00064c8:	00062f83          	lw	t6,0(a2)
c00064cc:	00462f03          	lw	t5,4(a2)
c00064d0:	00862e83          	lw	t4,8(a2)
c00064d4:	00c62e03          	lw	t3,12(a2)
c00064d8:	01062303          	lw	t1,16(a2)
c00064dc:	01462883          	lw	a7,20(a2)
c00064e0:	01862803          	lw	a6,24(a2)
c00064e4:	01c62503          	lw	a0,28(a2)
c00064e8:	01f7a023          	sw	t6,0(a5)
c00064ec:	01e7a223          	sw	t5,4(a5)
c00064f0:	01d7a423          	sw	t4,8(a5)
c00064f4:	01c7a623          	sw	t3,12(a5)
c00064f8:	0067a823          	sw	t1,16(a5)
c00064fc:	0117aa23          	sw	a7,20(a5)
c0006500:	0107ac23          	sw	a6,24(a5)
c0006504:	00a7ae23          	sw	a0,28(a5)
c0006508:	02060613          	addi	a2,a2,32
c000650c:	02078793          	addi	a5,a5,32
c0006510:	fab61ce3          	bne	a2,a1,c00064c8 <do_fork+0x11c>
c0006514:	00062803          	lw	a6,0(a2)
c0006518:	00462503          	lw	a0,4(a2)
c000651c:	00862583          	lw	a1,8(a2)
c0006520:	00c62603          	lw	a2,12(a2)
c0006524:	0107a023          	sw	a6,0(a5)
c0006528:	00a7a223          	sw	a0,4(a5)
c000652c:	00b7a423          	sw	a1,8(a5)
c0006530:	00c7a623          	sw	a2,12(a5)
c0006534:	02072423          	sw	zero,40(a4)
c0006538:	16090c63          	beqz	s2,c00066b0 <do_fork+0x304>
c000653c:	01272423          	sw	s2,8(a4)
c0006540:	00000797          	auipc	a5,0x0
c0006544:	aec78793          	addi	a5,a5,-1300 # c000602c <forkret>
c0006548:	00f42e23          	sw	a5,28(s0)
c000654c:	02e42023          	sw	a4,32(s0)
c0006550:	100027f3          	csrr	a5,sstatus
c0006554:	0027f793          	andi	a5,a5,2
c0006558:	00000913          	li	s2,0
c000655c:	18079263          	bnez	a5,c00066e0 <do_fork+0x334>
c0006560:	0002f517          	auipc	a0,0x2f
c0006564:	25c52503          	lw	a0,604(a0) # c00357bc <last_pid.1661>
c0006568:	0002fe17          	auipc	t3,0x2f
c000656c:	254e0e13          	addi	t3,t3,596 # c00357bc <last_pid.1661>
c0006570:	00150513          	addi	a0,a0,1
c0006574:	00ae2023          	sw	a0,0(t3)
c0006578:	000027b7          	lui	a5,0x2
c000657c:	18f54663          	blt	a0,a5,c0006708 <do_fork+0x35c>
c0006580:	00100513          	li	a0,1
c0006584:	00ae2023          	sw	a0,0(t3)
c0006588:	000027b7          	lui	a5,0x2
c000658c:	0002fe97          	auipc	t4,0x2f
c0006590:	234e8e93          	addi	t4,t4,564 # c00357c0 <next_safe.1660>
c0006594:	00fea023          	sw	a5,0(t4)
c0006598:	0002f817          	auipc	a6,0x2f
c000659c:	22482803          	lw	a6,548(a6) # c00357bc <last_pid.1661>
c00065a0:	00000593          	li	a1,0
c00065a4:	00038497          	auipc	s1,0x38
c00065a8:	74848493          	addi	s1,s1,1864 # c003ecec <proc_list>
c00065ac:	00078893          	mv	a7,a5
c00065b0:	00100613          	li	a2,1
c00065b4:	00058313          	mv	t1,a1
c00065b8:	00088693          	mv	a3,a7
c00065bc:	00038797          	auipc	a5,0x38
c00065c0:	73078793          	addi	a5,a5,1840 # c003ecec <proc_list>
c00065c4:	0047a783          	lw	a5,4(a5)
c00065c8:	02978263          	beq	a5,s1,c00065ec <do_fork+0x240>
c00065cc:	f947a703          	lw	a4,-108(a5)
c00065d0:	14a70863          	beq	a4,a0,c0006720 <do_fork+0x374>
c00065d4:	fee558e3          	ble	a4,a0,c00065c4 <do_fork+0x218>
c00065d8:	fed756e3          	ble	a3,a4,c00065c4 <do_fork+0x218>
c00065dc:	0047a783          	lw	a5,4(a5)
c00065e0:	00070693          	mv	a3,a4
c00065e4:	00060313          	mv	t1,a2
c00065e8:	fe9792e3          	bne	a5,s1,c00065cc <do_fork+0x220>
c00065ec:	2a059a63          	bnez	a1,c00068a0 <do_fork+0x4f4>
c00065f0:	2a031c63          	bnez	t1,c00068a8 <do_fork+0x4fc>
c00065f4:	00a00593          	li	a1,10
c00065f8:	00a42223          	sw	a0,4(s0)
c00065fc:	644050ef          	jal	ra,c000bc40 <hash32>
c0006600:	00036797          	auipc	a5,0x36
c0006604:	5c878793          	addi	a5,a5,1480 # c003cbc8 <hash_list>
c0006608:	00351513          	slli	a0,a0,0x3
c000660c:	00a78533          	add	a0,a5,a0
c0006610:	00452583          	lw	a1,4(a0)
c0006614:	01442683          	lw	a3,20(s0)
c0006618:	07840793          	addi	a5,s0,120
c000661c:	00f5a023          	sw	a5,0(a1)
c0006620:	00f52223          	sw	a5,4(a0)
c0006624:	0886a703          	lw	a4,136(a3)
c0006628:	00038617          	auipc	a2,0x38
c000662c:	6c862603          	lw	a2,1736(a2) # c003ecf0 <proc_list+0x4>
c0006630:	07040793          	addi	a5,s0,112
c0006634:	06b42e23          	sw	a1,124(s0)
c0006638:	06a42c23          	sw	a0,120(s0)
c000663c:	00f62023          	sw	a5,0(a2)
c0006640:	00f4a223          	sw	a5,4(s1)
c0006644:	06c42a23          	sw	a2,116(s0)
c0006648:	06942823          	sw	s1,112(s0)
c000664c:	08042623          	sw	zero,140(s0)
c0006650:	08e42823          	sw	a4,144(s0)
c0006654:	00070463          	beqz	a4,c000665c <do_fork+0x2b0>
c0006658:	08872623          	sw	s0,140(a4)
c000665c:	00038797          	auipc	a5,0x38
c0006660:	5b47a783          	lw	a5,1460(a5) # c003ec10 <nr_process>
c0006664:	00178793          	addi	a5,a5,1
c0006668:	0886a423          	sw	s0,136(a3)
c000666c:	00038297          	auipc	t0,0x38
c0006670:	5af2a223          	sw	a5,1444(t0) # c003ec10 <nr_process>
c0006674:	0c091063          	bnez	s2,c0006734 <do_fork+0x388>
c0006678:	00040513          	mv	a0,s0
c000667c:	12c010ef          	jal	ra,c00077a8 <wakeup_proc>
c0006680:	00442503          	lw	a0,4(s0)
c0006684:	02c12083          	lw	ra,44(sp)
c0006688:	02812403          	lw	s0,40(sp)
c000668c:	02412483          	lw	s1,36(sp)
c0006690:	02012903          	lw	s2,32(sp)
c0006694:	01c12983          	lw	s3,28(sp)
c0006698:	01812a03          	lw	s4,24(sp)
c000669c:	01412a83          	lw	s5,20(sp)
c00066a0:	01012b03          	lw	s6,16(sp)
c00066a4:	00c12b83          	lw	s7,12(sp)
c00066a8:	03010113          	addi	sp,sp,48
c00066ac:	00008067          	ret
c00066b0:	00002937          	lui	s2,0x2
c00066b4:	f6c90913          	addi	s2,s2,-148 # 1f6c <_binary_obj___user_softint_out_size>
c00066b8:	01268933          	add	s2,a3,s2
c00066bc:	01272423          	sw	s2,8(a4)
c00066c0:	00000797          	auipc	a5,0x0
c00066c4:	96c78793          	addi	a5,a5,-1684 # c000602c <forkret>
c00066c8:	00f42e23          	sw	a5,28(s0)
c00066cc:	02e42023          	sw	a4,32(s0)
c00066d0:	100027f3          	csrr	a5,sstatus
c00066d4:	0027f793          	andi	a5,a5,2
c00066d8:	00000913          	li	s2,0
c00066dc:	e80782e3          	beqz	a5,c0006560 <do_fork+0x1b4>
c00066e0:	944fa0ef          	jal	ra,c0000824 <intr_disable>
c00066e4:	0002f517          	auipc	a0,0x2f
c00066e8:	0d852503          	lw	a0,216(a0) # c00357bc <last_pid.1661>
c00066ec:	0002fe17          	auipc	t3,0x2f
c00066f0:	0d0e0e13          	addi	t3,t3,208 # c00357bc <last_pid.1661>
c00066f4:	00150513          	addi	a0,a0,1
c00066f8:	00ae2023          	sw	a0,0(t3)
c00066fc:	000027b7          	lui	a5,0x2
c0006700:	00100913          	li	s2,1
c0006704:	e6f55ee3          	ble	a5,a0,c0006580 <do_fork+0x1d4>
c0006708:	0002f797          	auipc	a5,0x2f
c000670c:	0b87a783          	lw	a5,184(a5) # c00357c0 <next_safe.1660>
c0006710:	00038497          	auipc	s1,0x38
c0006714:	5dc48493          	addi	s1,s1,1500 # c003ecec <proc_list>
c0006718:	e6f558e3          	ble	a5,a0,c0006588 <do_fork+0x1dc>
c000671c:	ed9ff06f          	j	c00065f4 <do_fork+0x248>
c0006720:	00150513          	addi	a0,a0,1
c0006724:	0ed55463          	ble	a3,a0,c000680c <do_fork+0x460>
c0006728:	00050813          	mv	a6,a0
c000672c:	00060593          	mv	a1,a2
c0006730:	e95ff06f          	j	c00065c4 <do_fork+0x218>
c0006734:	8e8fa0ef          	jal	ra,c000081c <intr_enable>
c0006738:	f41ff06f          	j	c0006678 <do_fork+0x2cc>
c000673c:	975fa0ef          	jal	ra,c00010b0 <mm_create>
c0006740:	00050b93          	mv	s7,a0
c0006744:	06050a63          	beqz	a0,c00067b8 <do_fork+0x40c>
c0006748:	a11ff0ef          	jal	ra,c0006158 <setup_pgdir>
c000674c:	06051263          	bnez	a0,c00067b0 <do_fork+0x404>
c0006750:	01ca8993          	addi	s3,s5,28
c0006754:	00100793          	li	a5,1
c0006758:	40f9a7af          	amoor.w	a5,a5,(s3)
c000675c:	0017f793          	andi	a5,a5,1
c0006760:	00100b13          	li	s6,1
c0006764:	00078a63          	beqz	a5,c0006778 <do_fork+0x3cc>
c0006768:	130010ef          	jal	ra,c0007898 <schedule>
c000676c:	4169a7af          	amoor.w	a5,s6,(s3)
c0006770:	0017f793          	andi	a5,a5,1
c0006774:	fe079ae3          	bnez	a5,c0006768 <do_fork+0x3bc>
c0006778:	000a8593          	mv	a1,s5
c000677c:	000b8513          	mv	a0,s7
c0006780:	cb9fa0ef          	jal	ra,c0001438 <dup_mmap>
c0006784:	ffe00793          	li	a5,-2
c0006788:	60f9a7af          	amoand.w	a5,a5,(s3)
c000678c:	0017f793          	andi	a5,a5,1
c0006790:	0c078463          	beqz	a5,c0006858 <do_fork+0x4ac>
c0006794:	00051663          	bnez	a0,c00067a0 <do_fork+0x3f4>
c0006798:	000b8a93          	mv	s5,s7
c000679c:	ce1ff06f          	j	c000647c <do_fork+0xd0>
c00067a0:	000b8513          	mv	a0,s7
c00067a4:	d81fa0ef          	jal	ra,c0001524 <exit_mmap>
c00067a8:	000b8513          	mv	a0,s7
c00067ac:	921ff0ef          	jal	ra,c00060cc <put_pgdir>
c00067b0:	000b8513          	mv	a0,s7
c00067b4:	b11fa0ef          	jal	ra,c00012c4 <mm_destroy>
c00067b8:	00c42683          	lw	a3,12(s0)
c00067bc:	c00007b7          	lui	a5,0xc0000
c00067c0:	08f6e063          	bltu	a3,a5,c0006840 <do_fork+0x494>
c00067c4:	00038797          	auipc	a5,0x38
c00067c8:	51c7a783          	lw	a5,1308(a5) # c003ece0 <va_pa_offset>
c00067cc:	40f687b3          	sub	a5,a3,a5
c00067d0:	00c7d793          	srli	a5,a5,0xc
c00067d4:	00038717          	auipc	a4,0x38
c00067d8:	42872703          	lw	a4,1064(a4) # c003ebfc <npage>
c00067dc:	04e7f663          	bleu	a4,a5,c0006828 <do_fork+0x47c>
c00067e0:	414787b3          	sub	a5,a5,s4
c00067e4:	00579793          	slli	a5,a5,0x5
c00067e8:	00038517          	auipc	a0,0x38
c00067ec:	50052503          	lw	a0,1280(a0) # c003ece8 <pages>
c00067f0:	00200593          	li	a1,2
c00067f4:	00f50533          	add	a0,a0,a5
c00067f8:	98dfd0ef          	jal	ra,c0004184 <free_pages>
c00067fc:	00040513          	mv	a0,s0
c0006800:	ed1fb0ef          	jal	ra,c00026d0 <kfree>
c0006804:	ffc00513          	li	a0,-4
c0006808:	e7dff06f          	j	c0006684 <do_fork+0x2d8>
c000680c:	01154463          	blt	a0,a7,c0006814 <do_fork+0x468>
c0006810:	00100513          	li	a0,1
c0006814:	00060593          	mv	a1,a2
c0006818:	00050813          	mv	a6,a0
c000681c:	d99ff06f          	j	c00065b4 <do_fork+0x208>
c0006820:	ffb00513          	li	a0,-5
c0006824:	00008067          	ret
c0006828:	00006617          	auipc	a2,0x6
c000682c:	fcc60613          	addi	a2,a2,-52 # c000c7f4 <commands+0xa54>
c0006830:	06100593          	li	a1,97
c0006834:	00006517          	auipc	a0,0x6
c0006838:	fe050513          	addi	a0,a0,-32 # c000c814 <commands+0xa74>
c000683c:	a15f90ef          	jal	ra,c0000250 <__panic>
c0006840:	00006617          	auipc	a2,0x6
c0006844:	24060613          	addi	a2,a2,576 # c000ca80 <commands+0xce0>
c0006848:	06d00593          	li	a1,109
c000684c:	00006517          	auipc	a0,0x6
c0006850:	fc850513          	addi	a0,a0,-56 # c000c814 <commands+0xa74>
c0006854:	9fdf90ef          	jal	ra,c0000250 <__panic>
c0006858:	00007617          	auipc	a2,0x7
c000685c:	25460613          	addi	a2,a2,596 # c000daac <default_pmm_manager+0x8f0>
c0006860:	03400593          	li	a1,52
c0006864:	00007517          	auipc	a0,0x7
c0006868:	25850513          	addi	a0,a0,600 # c000dabc <default_pmm_manager+0x900>
c000686c:	9e5f90ef          	jal	ra,c0000250 <__panic>
c0006870:	00006617          	auipc	a2,0x6
c0006874:	21060613          	addi	a2,a2,528 # c000ca80 <commands+0xce0>
c0006878:	16d00593          	li	a1,365
c000687c:	00007517          	auipc	a0,0x7
c0006880:	46850513          	addi	a0,a0,1128 # c000dce4 <default_pmm_manager+0xb28>
c0006884:	9cdf90ef          	jal	ra,c0000250 <__panic>
c0006888:	00006617          	auipc	a2,0x6
c000688c:	1d460613          	addi	a2,a2,468 # c000ca5c <commands+0xcbc>
c0006890:	06800593          	li	a1,104
c0006894:	00006517          	auipc	a0,0x6
c0006898:	f8050513          	addi	a0,a0,-128 # c000c814 <commands+0xa74>
c000689c:	9b5f90ef          	jal	ra,c0000250 <__panic>
c00068a0:	010e2023          	sw	a6,0(t3)
c00068a4:	d4dff06f          	j	c00065f0 <do_fork+0x244>
c00068a8:	00dea023          	sw	a3,0(t4)
c00068ac:	d49ff06f          	j	c00065f4 <do_fork+0x248>
c00068b0:	00007697          	auipc	a3,0x7
c00068b4:	1e068693          	addi	a3,a3,480 # c000da90 <default_pmm_manager+0x8d4>
c00068b8:	00006617          	auipc	a2,0x6
c00068bc:	8c060613          	addi	a2,a2,-1856 # c000c178 <commands+0x3d8>
c00068c0:	1ba00593          	li	a1,442
c00068c4:	00007517          	auipc	a0,0x7
c00068c8:	42050513          	addi	a0,a0,1056 # c000dce4 <default_pmm_manager+0xb28>
c00068cc:	985f90ef          	jal	ra,c0000250 <__panic>

c00068d0 <kernel_thread>:
c00068d0:	f6010113          	addi	sp,sp,-160
c00068d4:	08812c23          	sw	s0,152(sp)
c00068d8:	08912a23          	sw	s1,148(sp)
c00068dc:	09212823          	sw	s2,144(sp)
c00068e0:	00058493          	mv	s1,a1
c00068e4:	00050913          	mv	s2,a0
c00068e8:	00060413          	mv	s0,a2
c00068ec:	00000593          	li	a1,0
c00068f0:	09000613          	li	a2,144
c00068f4:	00010513          	mv	a0,sp
c00068f8:	08112e23          	sw	ra,156(sp)
c00068fc:	511040ef          	jal	ra,c000b60c <memset>
c0006900:	03212023          	sw	s2,32(sp)
c0006904:	02912223          	sw	s1,36(sp)
c0006908:	100027f3          	csrr	a5,sstatus
c000690c:	edd7f793          	andi	a5,a5,-291
c0006910:	1207e793          	ori	a5,a5,288
c0006914:	08f12023          	sw	a5,128(sp)
c0006918:	00010613          	mv	a2,sp
c000691c:	10046513          	ori	a0,s0,256
c0006920:	fffff797          	auipc	a5,0xfffff
c0006924:	64478793          	addi	a5,a5,1604 # c0005f64 <kernel_thread_entry>
c0006928:	00000593          	li	a1,0
c000692c:	08f12223          	sw	a5,132(sp)
c0006930:	a7dff0ef          	jal	ra,c00063ac <do_fork>
c0006934:	09c12083          	lw	ra,156(sp)
c0006938:	09812403          	lw	s0,152(sp)
c000693c:	09412483          	lw	s1,148(sp)
c0006940:	09012903          	lw	s2,144(sp)
c0006944:	0a010113          	addi	sp,sp,160
c0006948:	00008067          	ret

c000694c <do_exit>:
c000694c:	ff010113          	addi	sp,sp,-16
c0006950:	00112623          	sw	ra,12(sp)
c0006954:	00812423          	sw	s0,8(sp)
c0006958:	00912223          	sw	s1,4(sp)
c000695c:	01212023          	sw	s2,0(sp)
c0006960:	00038697          	auipc	a3,0x38
c0006964:	2a46a683          	lw	a3,676(a3) # c003ec04 <current>
c0006968:	00038797          	auipc	a5,0x38
c000696c:	2a07a783          	lw	a5,672(a5) # c003ec08 <idleproc>
c0006970:	14f68663          	beq	a3,a5,c0006abc <do_exit+0x170>
c0006974:	00038797          	auipc	a5,0x38
c0006978:	2987a783          	lw	a5,664(a5) # c003ec0c <initproc>
c000697c:	14f68c63          	beq	a3,a5,c0006ad4 <do_exit+0x188>
c0006980:	0186a403          	lw	s0,24(a3)
c0006984:	00050493          	mv	s1,a0
c0006988:	02040463          	beqz	s0,c00069b0 <do_exit+0x64>
c000698c:	00038797          	auipc	a5,0x38
c0006990:	3587a783          	lw	a5,856(a5) # c003ece4 <boot_cr3>
c0006994:	00c7d793          	srli	a5,a5,0xc
c0006998:	18079073          	csrw	sptbr,a5
c000699c:	01842783          	lw	a5,24(s0)
c00069a0:	fff78793          	addi	a5,a5,-1
c00069a4:	00f42c23          	sw	a5,24(s0)
c00069a8:	0c078263          	beqz	a5,c0006a6c <do_exit+0x120>
c00069ac:	0006ac23          	sw	zero,24(a3)
c00069b0:	00300793          	li	a5,3
c00069b4:	00f6a023          	sw	a5,0(a3)
c00069b8:	0896a023          	sw	s1,128(a3)
c00069bc:	100027f3          	csrr	a5,sstatus
c00069c0:	0027f793          	andi	a5,a5,2
c00069c4:	00000913          	li	s2,0
c00069c8:	0c079463          	bnez	a5,c0006a90 <do_exit+0x144>
c00069cc:	0146a503          	lw	a0,20(a3)
c00069d0:	800007b7          	lui	a5,0x80000
c00069d4:	00178793          	addi	a5,a5,1 # 80000001 <sbi_remote_fence_i+0x80000711>
c00069d8:	08452703          	lw	a4,132(a0)
c00069dc:	0cf70863          	beq	a4,a5,c0006aac <do_exit+0x160>
c00069e0:	800004b7          	lui	s1,0x80000
c00069e4:	00300413          	li	s0,3
c00069e8:	00148493          	addi	s1,s1,1 # 80000001 <sbi_remote_fence_i+0x80000711>
c00069ec:	0886a783          	lw	a5,136(a3)
c00069f0:	04078863          	beqz	a5,c0006a40 <do_exit+0xf4>
c00069f4:	0907a703          	lw	a4,144(a5)
c00069f8:	00038517          	auipc	a0,0x38
c00069fc:	21452503          	lw	a0,532(a0) # c003ec0c <initproc>
c0006a00:	08e6a423          	sw	a4,136(a3)
c0006a04:	08852703          	lw	a4,136(a0)
c0006a08:	0807a623          	sw	zero,140(a5)
c0006a0c:	08e7a823          	sw	a4,144(a5)
c0006a10:	00070463          	beqz	a4,c0006a18 <do_exit+0xcc>
c0006a14:	08f72623          	sw	a5,140(a4)
c0006a18:	0007a703          	lw	a4,0(a5)
c0006a1c:	00a7aa23          	sw	a0,20(a5)
c0006a20:	08f52423          	sw	a5,136(a0)
c0006a24:	fc8714e3          	bne	a4,s0,c00069ec <do_exit+0xa0>
c0006a28:	08452783          	lw	a5,132(a0)
c0006a2c:	fc9790e3          	bne	a5,s1,c00069ec <do_exit+0xa0>
c0006a30:	579000ef          	jal	ra,c00077a8 <wakeup_proc>
c0006a34:	00038697          	auipc	a3,0x38
c0006a38:	1d06a683          	lw	a3,464(a3) # c003ec04 <current>
c0006a3c:	fb1ff06f          	j	c00069ec <do_exit+0xa0>
c0006a40:	06091263          	bnez	s2,c0006aa4 <do_exit+0x158>
c0006a44:	655000ef          	jal	ra,c0007898 <schedule>
c0006a48:	00038797          	auipc	a5,0x38
c0006a4c:	1bc7a783          	lw	a5,444(a5) # c003ec04 <current>
c0006a50:	0047a683          	lw	a3,4(a5)
c0006a54:	00007617          	auipc	a2,0x7
c0006a58:	01c60613          	addi	a2,a2,28 # c000da70 <default_pmm_manager+0x8b4>
c0006a5c:	21000593          	li	a1,528
c0006a60:	00007517          	auipc	a0,0x7
c0006a64:	28450513          	addi	a0,a0,644 # c000dce4 <default_pmm_manager+0xb28>
c0006a68:	fe8f90ef          	jal	ra,c0000250 <__panic>
c0006a6c:	00040513          	mv	a0,s0
c0006a70:	ab5fa0ef          	jal	ra,c0001524 <exit_mmap>
c0006a74:	00040513          	mv	a0,s0
c0006a78:	e54ff0ef          	jal	ra,c00060cc <put_pgdir>
c0006a7c:	00040513          	mv	a0,s0
c0006a80:	845fa0ef          	jal	ra,c00012c4 <mm_destroy>
c0006a84:	00038697          	auipc	a3,0x38
c0006a88:	1806a683          	lw	a3,384(a3) # c003ec04 <current>
c0006a8c:	f21ff06f          	j	c00069ac <do_exit+0x60>
c0006a90:	d95f90ef          	jal	ra,c0000824 <intr_disable>
c0006a94:	00100913          	li	s2,1
c0006a98:	00038697          	auipc	a3,0x38
c0006a9c:	16c6a683          	lw	a3,364(a3) # c003ec04 <current>
c0006aa0:	f2dff06f          	j	c00069cc <do_exit+0x80>
c0006aa4:	d79f90ef          	jal	ra,c000081c <intr_enable>
c0006aa8:	f9dff06f          	j	c0006a44 <do_exit+0xf8>
c0006aac:	4fd000ef          	jal	ra,c00077a8 <wakeup_proc>
c0006ab0:	00038697          	auipc	a3,0x38
c0006ab4:	1546a683          	lw	a3,340(a3) # c003ec04 <current>
c0006ab8:	f29ff06f          	j	c00069e0 <do_exit+0x94>
c0006abc:	00007617          	auipc	a2,0x7
c0006ac0:	f9460613          	addi	a2,a2,-108 # c000da50 <default_pmm_manager+0x894>
c0006ac4:	1e100593          	li	a1,481
c0006ac8:	00007517          	auipc	a0,0x7
c0006acc:	21c50513          	addi	a0,a0,540 # c000dce4 <default_pmm_manager+0xb28>
c0006ad0:	f80f90ef          	jal	ra,c0000250 <__panic>
c0006ad4:	00007617          	auipc	a2,0x7
c0006ad8:	f8c60613          	addi	a2,a2,-116 # c000da60 <default_pmm_manager+0x8a4>
c0006adc:	1e400593          	li	a1,484
c0006ae0:	00007517          	auipc	a0,0x7
c0006ae4:	20450513          	addi	a0,a0,516 # c000dce4 <default_pmm_manager+0xb28>
c0006ae8:	f68f90ef          	jal	ra,c0000250 <__panic>

c0006aec <do_wait.part.1>:
c0006aec:	fe010113          	addi	sp,sp,-32
c0006af0:	01212823          	sw	s2,16(sp)
c0006af4:	01512223          	sw	s5,4(sp)
c0006af8:	80000937          	lui	s2,0x80000
c0006afc:	00100a93          	li	s5,1
c0006b00:	00912a23          	sw	s1,20(sp)
c0006b04:	01312623          	sw	s3,12(sp)
c0006b08:	01412423          	sw	s4,8(sp)
c0006b0c:	00112e23          	sw	ra,28(sp)
c0006b10:	00812c23          	sw	s0,24(sp)
c0006b14:	00050993          	mv	s3,a0
c0006b18:	00058a13          	mv	s4,a1
c0006b1c:	00300493          	li	s1,3
c0006b20:	01590933          	add	s2,s2,s5
c0006b24:	12099663          	bnez	s3,c0006c50 <do_wait.part.1+0x164>
c0006b28:	00038717          	auipc	a4,0x38
c0006b2c:	0dc72703          	lw	a4,220(a4) # c003ec04 <current>
c0006b30:	08872403          	lw	s0,136(a4)
c0006b34:	00041863          	bnez	s0,c0006b44 <do_wait.part.1+0x58>
c0006b38:	17c0006f          	j	c0006cb4 <do_wait.part.1+0x1c8>
c0006b3c:	09042403          	lw	s0,144(s0)
c0006b40:	12040c63          	beqz	s0,c0006c78 <do_wait.part.1+0x18c>
c0006b44:	00042783          	lw	a5,0(s0)
c0006b48:	fe979ae3          	bne	a5,s1,c0006b3c <do_wait.part.1+0x50>
c0006b4c:	00038797          	auipc	a5,0x38
c0006b50:	0bc7a783          	lw	a5,188(a5) # c003ec08 <idleproc>
c0006b54:	18878663          	beq	a5,s0,c0006ce0 <do_wait.part.1+0x1f4>
c0006b58:	00038797          	auipc	a5,0x38
c0006b5c:	0b47a783          	lw	a5,180(a5) # c003ec0c <initproc>
c0006b60:	18f40063          	beq	s0,a5,c0006ce0 <do_wait.part.1+0x1f4>
c0006b64:	000a0663          	beqz	s4,c0006b70 <do_wait.part.1+0x84>
c0006b68:	08042783          	lw	a5,128(s0)
c0006b6c:	00fa2023          	sw	a5,0(s4)
c0006b70:	100027f3          	csrr	a5,sstatus
c0006b74:	0027f793          	andi	a5,a5,2
c0006b78:	00000613          	li	a2,0
c0006b7c:	12079263          	bnez	a5,c0006ca0 <do_wait.part.1+0x1b4>
c0006b80:	07842683          	lw	a3,120(s0)
c0006b84:	07c42703          	lw	a4,124(s0)
c0006b88:	09042783          	lw	a5,144(s0)
c0006b8c:	00e6a223          	sw	a4,4(a3)
c0006b90:	00d72023          	sw	a3,0(a4)
c0006b94:	07042683          	lw	a3,112(s0)
c0006b98:	07442703          	lw	a4,116(s0)
c0006b9c:	00e6a223          	sw	a4,4(a3)
c0006ba0:	00d72023          	sw	a3,0(a4)
c0006ba4:	00078663          	beqz	a5,c0006bb0 <do_wait.part.1+0xc4>
c0006ba8:	08c42703          	lw	a4,140(s0)
c0006bac:	08e7a623          	sw	a4,140(a5)
c0006bb0:	08c42703          	lw	a4,140(s0)
c0006bb4:	10070463          	beqz	a4,c0006cbc <do_wait.part.1+0x1d0>
c0006bb8:	08f72823          	sw	a5,144(a4)
c0006bbc:	00038797          	auipc	a5,0x38
c0006bc0:	0547a783          	lw	a5,84(a5) # c003ec10 <nr_process>
c0006bc4:	fff78793          	addi	a5,a5,-1
c0006bc8:	00038297          	auipc	t0,0x38
c0006bcc:	04f2a423          	sw	a5,72(t0) # c003ec10 <nr_process>
c0006bd0:	0c061e63          	bnez	a2,c0006cac <do_wait.part.1+0x1c0>
c0006bd4:	00c42683          	lw	a3,12(s0)
c0006bd8:	c00007b7          	lui	a5,0xc0000
c0006bdc:	0ef6e663          	bltu	a3,a5,c0006cc8 <do_wait.part.1+0x1dc>
c0006be0:	00038797          	auipc	a5,0x38
c0006be4:	1007a783          	lw	a5,256(a5) # c003ece0 <va_pa_offset>
c0006be8:	40f686b3          	sub	a3,a3,a5
c0006bec:	00c6d693          	srli	a3,a3,0xc
c0006bf0:	00038797          	auipc	a5,0x38
c0006bf4:	00c7a783          	lw	a5,12(a5) # c003ebfc <npage>
c0006bf8:	10f6f063          	bleu	a5,a3,c0006cf8 <do_wait.part.1+0x20c>
c0006bfc:	0002f517          	auipc	a0,0x2f
c0006c00:	bbc52503          	lw	a0,-1092(a0) # c00357b8 <nbase>
c0006c04:	40a686b3          	sub	a3,a3,a0
c0006c08:	00569693          	slli	a3,a3,0x5
c0006c0c:	00038517          	auipc	a0,0x38
c0006c10:	0dc52503          	lw	a0,220(a0) # c003ece8 <pages>
c0006c14:	00d50533          	add	a0,a0,a3
c0006c18:	00200593          	li	a1,2
c0006c1c:	d68fd0ef          	jal	ra,c0004184 <free_pages>
c0006c20:	00040513          	mv	a0,s0
c0006c24:	aadfb0ef          	jal	ra,c00026d0 <kfree>
c0006c28:	00000513          	li	a0,0
c0006c2c:	01c12083          	lw	ra,28(sp)
c0006c30:	01812403          	lw	s0,24(sp)
c0006c34:	01412483          	lw	s1,20(sp)
c0006c38:	01012903          	lw	s2,16(sp)
c0006c3c:	00c12983          	lw	s3,12(sp)
c0006c40:	00812a03          	lw	s4,8(sp)
c0006c44:	00412a83          	lw	s5,4(sp)
c0006c48:	02010113          	addi	sp,sp,32
c0006c4c:	00008067          	ret
c0006c50:	00098513          	mv	a0,s3
c0006c54:	ed8ff0ef          	jal	ra,c000632c <find_proc>
c0006c58:	00050413          	mv	s0,a0
c0006c5c:	04050c63          	beqz	a0,c0006cb4 <do_wait.part.1+0x1c8>
c0006c60:	01452703          	lw	a4,20(a0)
c0006c64:	00038797          	auipc	a5,0x38
c0006c68:	fa07a783          	lw	a5,-96(a5) # c003ec04 <current>
c0006c6c:	04f71463          	bne	a4,a5,c0006cb4 <do_wait.part.1+0x1c8>
c0006c70:	00052783          	lw	a5,0(a0)
c0006c74:	ec978ce3          	beq	a5,s1,c0006b4c <do_wait.part.1+0x60>
c0006c78:	01572023          	sw	s5,0(a4)
c0006c7c:	09272223          	sw	s2,132(a4)
c0006c80:	419000ef          	jal	ra,c0007898 <schedule>
c0006c84:	00038797          	auipc	a5,0x38
c0006c88:	f807a783          	lw	a5,-128(a5) # c003ec04 <current>
c0006c8c:	05c7a783          	lw	a5,92(a5)
c0006c90:	0017f793          	andi	a5,a5,1
c0006c94:	e80788e3          	beqz	a5,c0006b24 <do_wait.part.1+0x38>
c0006c98:	ff700513          	li	a0,-9
c0006c9c:	cb1ff0ef          	jal	ra,c000694c <do_exit>
c0006ca0:	b85f90ef          	jal	ra,c0000824 <intr_disable>
c0006ca4:	00100613          	li	a2,1
c0006ca8:	ed9ff06f          	j	c0006b80 <do_wait.part.1+0x94>
c0006cac:	b71f90ef          	jal	ra,c000081c <intr_enable>
c0006cb0:	f25ff06f          	j	c0006bd4 <do_wait.part.1+0xe8>
c0006cb4:	ffe00513          	li	a0,-2
c0006cb8:	f75ff06f          	j	c0006c2c <do_wait.part.1+0x140>
c0006cbc:	01442703          	lw	a4,20(s0)
c0006cc0:	08f72423          	sw	a5,136(a4)
c0006cc4:	ef9ff06f          	j	c0006bbc <do_wait.part.1+0xd0>
c0006cc8:	00006617          	auipc	a2,0x6
c0006ccc:	db860613          	addi	a2,a2,-584 # c000ca80 <commands+0xce0>
c0006cd0:	06d00593          	li	a1,109
c0006cd4:	00006517          	auipc	a0,0x6
c0006cd8:	b4050513          	addi	a0,a0,-1216 # c000c814 <commands+0xa74>
c0006cdc:	d74f90ef          	jal	ra,c0000250 <__panic>
c0006ce0:	00007617          	auipc	a2,0x7
c0006ce4:	df060613          	addi	a2,a2,-528 # c000dad0 <default_pmm_manager+0x914>
c0006ce8:	30c00593          	li	a1,780
c0006cec:	00007517          	auipc	a0,0x7
c0006cf0:	ff850513          	addi	a0,a0,-8 # c000dce4 <default_pmm_manager+0xb28>
c0006cf4:	d5cf90ef          	jal	ra,c0000250 <__panic>
c0006cf8:	00006617          	auipc	a2,0x6
c0006cfc:	afc60613          	addi	a2,a2,-1284 # c000c7f4 <commands+0xa54>
c0006d00:	06100593          	li	a1,97
c0006d04:	00006517          	auipc	a0,0x6
c0006d08:	b1050513          	addi	a0,a0,-1264 # c000c814 <commands+0xa74>
c0006d0c:	d44f90ef          	jal	ra,c0000250 <__panic>

c0006d10 <init_main>:
c0006d10:	ff010113          	addi	sp,sp,-16
c0006d14:	00112623          	sw	ra,12(sp)
c0006d18:	cd0fd0ef          	jal	ra,c00041e8 <nr_free_pages>
c0006d1c:	88dfb0ef          	jal	ra,c00025a8 <kallocated>
c0006d20:	00000613          	li	a2,0
c0006d24:	00000593          	li	a1,0
c0006d28:	fffff517          	auipc	a0,0xfffff
c0006d2c:	31450513          	addi	a0,a0,788 # c000603c <user_main>
c0006d30:	ba1ff0ef          	jal	ra,c00068d0 <kernel_thread>
c0006d34:	00a04663          	bgtz	a0,c0006d40 <init_main+0x30>
c0006d38:	0ac0006f          	j	c0006de4 <init_main+0xd4>
c0006d3c:	35d000ef          	jal	ra,c0007898 <schedule>
c0006d40:	00000593          	li	a1,0
c0006d44:	00000513          	li	a0,0
c0006d48:	da5ff0ef          	jal	ra,c0006aec <do_wait.part.1>
c0006d4c:	fe0508e3          	beqz	a0,c0006d3c <init_main+0x2c>
c0006d50:	00007517          	auipc	a0,0x7
c0006d54:	db850513          	addi	a0,a0,-584 # c000db08 <default_pmm_manager+0x94c>
c0006d58:	b84f90ef          	jal	ra,c00000dc <cprintf>
c0006d5c:	00038797          	auipc	a5,0x38
c0006d60:	eb07a783          	lw	a5,-336(a5) # c003ec0c <initproc>
c0006d64:	0887a703          	lw	a4,136(a5)
c0006d68:	04071e63          	bnez	a4,c0006dc4 <init_main+0xb4>
c0006d6c:	08c7a703          	lw	a4,140(a5)
c0006d70:	04071a63          	bnez	a4,c0006dc4 <init_main+0xb4>
c0006d74:	0907a703          	lw	a4,144(a5)
c0006d78:	04071663          	bnez	a4,c0006dc4 <init_main+0xb4>
c0006d7c:	00038697          	auipc	a3,0x38
c0006d80:	e946a683          	lw	a3,-364(a3) # c003ec10 <nr_process>
c0006d84:	00200713          	li	a4,2
c0006d88:	0ae69a63          	bne	a3,a4,c0006e3c <init_main+0x12c>
c0006d8c:	07078793          	addi	a5,a5,112
c0006d90:	00038717          	auipc	a4,0x38
c0006d94:	f6072703          	lw	a4,-160(a4) # c003ecf0 <proc_list+0x4>
c0006d98:	08e79263          	bne	a5,a4,c0006e1c <init_main+0x10c>
c0006d9c:	00038717          	auipc	a4,0x38
c0006da0:	f5072703          	lw	a4,-176(a4) # c003ecec <proc_list>
c0006da4:	04f71c63          	bne	a4,a5,c0006dfc <init_main+0xec>
c0006da8:	00007517          	auipc	a0,0x7
c0006dac:	e4050513          	addi	a0,a0,-448 # c000dbe8 <default_pmm_manager+0xa2c>
c0006db0:	b2cf90ef          	jal	ra,c00000dc <cprintf>
c0006db4:	00c12083          	lw	ra,12(sp)
c0006db8:	00000513          	li	a0,0
c0006dbc:	01010113          	addi	sp,sp,16
c0006dc0:	00008067          	ret
c0006dc4:	00007697          	auipc	a3,0x7
c0006dc8:	d6868693          	addi	a3,a3,-664 # c000db2c <default_pmm_manager+0x970>
c0006dcc:	00005617          	auipc	a2,0x5
c0006dd0:	3ac60613          	addi	a2,a2,940 # c000c178 <commands+0x3d8>
c0006dd4:	37400593          	li	a1,884
c0006dd8:	00007517          	auipc	a0,0x7
c0006ddc:	f0c50513          	addi	a0,a0,-244 # c000dce4 <default_pmm_manager+0xb28>
c0006de0:	c70f90ef          	jal	ra,c0000250 <__panic>
c0006de4:	00007617          	auipc	a2,0x7
c0006de8:	d0860613          	addi	a2,a2,-760 # c000daec <default_pmm_manager+0x930>
c0006dec:	36c00593          	li	a1,876
c0006df0:	00007517          	auipc	a0,0x7
c0006df4:	ef450513          	addi	a0,a0,-268 # c000dce4 <default_pmm_manager+0xb28>
c0006df8:	c58f90ef          	jal	ra,c0000250 <__panic>
c0006dfc:	00007697          	auipc	a3,0x7
c0006e00:	dbc68693          	addi	a3,a3,-580 # c000dbb8 <default_pmm_manager+0x9fc>
c0006e04:	00005617          	auipc	a2,0x5
c0006e08:	37460613          	addi	a2,a2,884 # c000c178 <commands+0x3d8>
c0006e0c:	37700593          	li	a1,887
c0006e10:	00007517          	auipc	a0,0x7
c0006e14:	ed450513          	addi	a0,a0,-300 # c000dce4 <default_pmm_manager+0xb28>
c0006e18:	c38f90ef          	jal	ra,c0000250 <__panic>
c0006e1c:	00007697          	auipc	a3,0x7
c0006e20:	d6c68693          	addi	a3,a3,-660 # c000db88 <default_pmm_manager+0x9cc>
c0006e24:	00005617          	auipc	a2,0x5
c0006e28:	35460613          	addi	a2,a2,852 # c000c178 <commands+0x3d8>
c0006e2c:	37600593          	li	a1,886
c0006e30:	00007517          	auipc	a0,0x7
c0006e34:	eb450513          	addi	a0,a0,-332 # c000dce4 <default_pmm_manager+0xb28>
c0006e38:	c18f90ef          	jal	ra,c0000250 <__panic>
c0006e3c:	00007697          	auipc	a3,0x7
c0006e40:	d3c68693          	addi	a3,a3,-708 # c000db78 <default_pmm_manager+0x9bc>
c0006e44:	00005617          	auipc	a2,0x5
c0006e48:	33460613          	addi	a2,a2,820 # c000c178 <commands+0x3d8>
c0006e4c:	37500593          	li	a1,885
c0006e50:	00007517          	auipc	a0,0x7
c0006e54:	e9450513          	addi	a0,a0,-364 # c000dce4 <default_pmm_manager+0xb28>
c0006e58:	bf8f90ef          	jal	ra,c0000250 <__panic>

c0006e5c <do_execve>:
c0006e5c:	fa010113          	addi	sp,sp,-96
c0006e60:	00038797          	auipc	a5,0x38
c0006e64:	da47a783          	lw	a5,-604(a5) # c003ec04 <current>
c0006e68:	05212823          	sw	s2,80(sp)
c0006e6c:	0187a903          	lw	s2,24(a5)
c0006e70:	04912a23          	sw	s1,84(sp)
c0006e74:	05312623          	sw	s3,76(sp)
c0006e78:	03912a23          	sw	s9,52(sp)
c0006e7c:	00050993          	mv	s3,a0
c0006e80:	00058493          	mv	s1,a1
c0006e84:	00060c93          	mv	s9,a2
c0006e88:	00000693          	li	a3,0
c0006e8c:	00058613          	mv	a2,a1
c0006e90:	00050593          	mv	a1,a0
c0006e94:	00090513          	mv	a0,s2
c0006e98:	04112e23          	sw	ra,92(sp)
c0006e9c:	04812c23          	sw	s0,88(sp)
c0006ea0:	05412423          	sw	s4,72(sp)
c0006ea4:	05512223          	sw	s5,68(sp)
c0006ea8:	05612023          	sw	s6,64(sp)
c0006eac:	03712e23          	sw	s7,60(sp)
c0006eb0:	03812c23          	sw	s8,56(sp)
c0006eb4:	03a12823          	sw	s10,48(sp)
c0006eb8:	03b12623          	sw	s11,44(sp)
c0006ebc:	e15fa0ef          	jal	ra,c0001cd0 <user_mem_check>
c0006ec0:	4e050e63          	beqz	a0,c00073bc <do_execve+0x560>
c0006ec4:	01000613          	li	a2,16
c0006ec8:	00c10533          	add	a0,sp,a2
c0006ecc:	00000593          	li	a1,0
c0006ed0:	73c040ef          	jal	ra,c000b60c <memset>
c0006ed4:	00f00793          	li	a5,15
c0006ed8:	00048613          	mv	a2,s1
c0006edc:	0897e063          	bltu	a5,s1,c0006f5c <do_execve+0x100>
c0006ee0:	00098593          	mv	a1,s3
c0006ee4:	01010513          	addi	a0,sp,16
c0006ee8:	740040ef          	jal	ra,c000b628 <memcpy>
c0006eec:	08090263          	beqz	s2,c0006f70 <do_execve+0x114>
c0006ef0:	00038797          	auipc	a5,0x38
c0006ef4:	df47a783          	lw	a5,-524(a5) # c003ece4 <boot_cr3>
c0006ef8:	00c7d793          	srli	a5,a5,0xc
c0006efc:	18079073          	csrw	sptbr,a5
c0006f00:	01892783          	lw	a5,24(s2) # 80000018 <sbi_remote_fence_i+0x80000728>
c0006f04:	fff78793          	addi	a5,a5,-1
c0006f08:	00f92c23          	sw	a5,24(s2)
c0006f0c:	34078263          	beqz	a5,c0007250 <do_execve+0x3f4>
c0006f10:	00038797          	auipc	a5,0x38
c0006f14:	cf47a783          	lw	a5,-780(a5) # c003ec04 <current>
c0006f18:	0007ac23          	sw	zero,24(a5)
c0006f1c:	994fa0ef          	jal	ra,c00010b0 <mm_create>
c0006f20:	00050993          	mv	s3,a0
c0006f24:	4a050463          	beqz	a0,c00073cc <do_execve+0x570>
c0006f28:	a30ff0ef          	jal	ra,c0006158 <setup_pgdir>
c0006f2c:	46051463          	bnez	a0,c0007394 <do_execve+0x538>
c0006f30:	000ca703          	lw	a4,0(s9)
c0006f34:	464c47b7          	lui	a5,0x464c4
c0006f38:	57f78793          	addi	a5,a5,1407 # 464c457f <_binary_obj___user_matrix_out_size+0x464c1d77>
c0006f3c:	04f70e63          	beq	a4,a5,c0006f98 <do_execve+0x13c>
c0006f40:	00098513          	mv	a0,s3
c0006f44:	988ff0ef          	jal	ra,c00060cc <put_pgdir>
c0006f48:	00098513          	mv	a0,s3
c0006f4c:	b78fa0ef          	jal	ra,c00012c4 <mm_destroy>
c0006f50:	ff800913          	li	s2,-8
c0006f54:	00090513          	mv	a0,s2
c0006f58:	9f5ff0ef          	jal	ra,c000694c <do_exit>
c0006f5c:	00078613          	mv	a2,a5
c0006f60:	00098593          	mv	a1,s3
c0006f64:	01010513          	addi	a0,sp,16
c0006f68:	6c0040ef          	jal	ra,c000b628 <memcpy>
c0006f6c:	f80912e3          	bnez	s2,c0006ef0 <do_execve+0x94>
c0006f70:	00038797          	auipc	a5,0x38
c0006f74:	c947a783          	lw	a5,-876(a5) # c003ec04 <current>
c0006f78:	0187a783          	lw	a5,24(a5)
c0006f7c:	fa0780e3          	beqz	a5,c0006f1c <do_execve+0xc0>
c0006f80:	00007617          	auipc	a2,0x7
c0006f84:	95c60613          	addi	a2,a2,-1700 # c000d8dc <default_pmm_manager+0x720>
c0006f88:	21a00593          	li	a1,538
c0006f8c:	00007517          	auipc	a0,0x7
c0006f90:	d5850513          	addi	a0,a0,-680 # c000dce4 <default_pmm_manager+0xb28>
c0006f94:	abcf90ef          	jal	ra,c0000250 <__panic>
c0006f98:	01ccaa03          	lw	s4,28(s9)
c0006f9c:	02ccdd03          	lhu	s10,44(s9)
c0006fa0:	014c8a33          	add	s4,s9,s4
c0006fa4:	005d1d13          	slli	s10,s10,0x5
c0006fa8:	01aa07b3          	add	a5,s4,s10
c0006fac:	00f12423          	sw	a5,8(sp)
c0006fb0:	02fa7c63          	bleu	a5,s4,c0006fe8 <do_execve+0x18c>
c0006fb4:	0002f797          	auipc	a5,0x2f
c0006fb8:	8047a783          	lw	a5,-2044(a5) # c00357b8 <nbase>
c0006fbc:	00100bb7          	lui	s7,0x100
c0006fc0:	00f12223          	sw	a5,4(sp)
c0006fc4:	fffb8b93          	addi	s7,s7,-1 # fffff <_binary_obj___user_matrix_out_size+0xfd7f7>
c0006fc8:	00f12623          	sw	a5,12(sp)
c0006fcc:	00f12023          	sw	a5,0(sp)
c0006fd0:	000a2703          	lw	a4,0(s4)
c0006fd4:	00100793          	li	a5,1
c0006fd8:	12f70e63          	beq	a4,a5,c0007114 <do_execve+0x2b8>
c0006fdc:	00812783          	lw	a5,8(sp)
c0006fe0:	020a0a13          	addi	s4,s4,32
c0006fe4:	fefa66e3          	bltu	s4,a5,c0006fd0 <do_execve+0x174>
c0006fe8:	00000713          	li	a4,0
c0006fec:	00b00693          	li	a3,11
c0006ff0:	00100637          	lui	a2,0x100
c0006ff4:	aff005b7          	lui	a1,0xaff00
c0006ff8:	00098513          	mv	a0,s3
c0006ffc:	b3cfa0ef          	jal	ra,c0001338 <mm_map>
c0007000:	00050913          	mv	s2,a0
c0007004:	22051863          	bnez	a0,c0007234 <do_execve+0x3d8>
c0007008:	00c9a503          	lw	a0,12(s3)
c000700c:	01f00613          	li	a2,31
c0007010:	affff5b7          	lui	a1,0xaffff
c0007014:	c51fd0ef          	jal	ra,c0004c64 <pgdir_alloc_page>
c0007018:	44050a63          	beqz	a0,c000746c <do_execve+0x610>
c000701c:	00c9a503          	lw	a0,12(s3)
c0007020:	01f00613          	li	a2,31
c0007024:	afffe5b7          	lui	a1,0xafffe
c0007028:	c3dfd0ef          	jal	ra,c0004c64 <pgdir_alloc_page>
c000702c:	42050063          	beqz	a0,c000744c <do_execve+0x5f0>
c0007030:	00c9a503          	lw	a0,12(s3)
c0007034:	01f00613          	li	a2,31
c0007038:	afffd5b7          	lui	a1,0xafffd
c000703c:	c29fd0ef          	jal	ra,c0004c64 <pgdir_alloc_page>
c0007040:	3e050663          	beqz	a0,c000742c <do_execve+0x5d0>
c0007044:	00c9a503          	lw	a0,12(s3)
c0007048:	01f00613          	li	a2,31
c000704c:	afffc5b7          	lui	a1,0xafffc
c0007050:	c15fd0ef          	jal	ra,c0004c64 <pgdir_alloc_page>
c0007054:	3a050c63          	beqz	a0,c000740c <do_execve+0x5b0>
c0007058:	0189a703          	lw	a4,24(s3)
c000705c:	00c9a683          	lw	a3,12(s3)
c0007060:	00038797          	auipc	a5,0x38
c0007064:	ba47a783          	lw	a5,-1116(a5) # c003ec04 <current>
c0007068:	00170713          	addi	a4,a4,1
c000706c:	00e9ac23          	sw	a4,24(s3)
c0007070:	0137ac23          	sw	s3,24(a5)
c0007074:	c0000737          	lui	a4,0xc0000
c0007078:	36e6ee63          	bltu	a3,a4,c00073f4 <do_execve+0x598>
c000707c:	00038717          	auipc	a4,0x38
c0007080:	c6472703          	lw	a4,-924(a4) # c003ece0 <va_pa_offset>
c0007084:	40e686b3          	sub	a3,a3,a4
c0007088:	04d7ac23          	sw	a3,88(a5)
c000708c:	00c6d693          	srli	a3,a3,0xc
c0007090:	18069073          	csrw	sptbr,a3
c0007094:	0547a403          	lw	s0,84(a5)
c0007098:	00000593          	li	a1,0
c000709c:	09000613          	li	a2,144
c00070a0:	00040513          	mv	a0,s0
c00070a4:	08042483          	lw	s1,128(s0)
c00070a8:	564040ef          	jal	ra,c000b60c <memset>
c00070ac:	018ca783          	lw	a5,24(s9)
c00070b0:	edf4f493          	andi	s1,s1,-289
c00070b4:	b0000737          	lui	a4,0xb0000
c00070b8:	00e42423          	sw	a4,8(s0)
c00070bc:	08f42223          	sw	a5,132(s0)
c00070c0:	08942023          	sw	s1,128(s0)
c00070c4:	01010593          	addi	a1,sp,16
c00070c8:	00038517          	auipc	a0,0x38
c00070cc:	b3c52503          	lw	a0,-1220(a0) # c003ec04 <current>
c00070d0:	980ff0ef          	jal	ra,c0006250 <set_proc_name>
c00070d4:	05c12083          	lw	ra,92(sp)
c00070d8:	00090513          	mv	a0,s2
c00070dc:	05812403          	lw	s0,88(sp)
c00070e0:	05412483          	lw	s1,84(sp)
c00070e4:	05012903          	lw	s2,80(sp)
c00070e8:	04c12983          	lw	s3,76(sp)
c00070ec:	04812a03          	lw	s4,72(sp)
c00070f0:	04412a83          	lw	s5,68(sp)
c00070f4:	04012b03          	lw	s6,64(sp)
c00070f8:	03c12b83          	lw	s7,60(sp)
c00070fc:	03812c03          	lw	s8,56(sp)
c0007100:	03412c83          	lw	s9,52(sp)
c0007104:	03012d03          	lw	s10,48(sp)
c0007108:	02c12d83          	lw	s11,44(sp)
c000710c:	06010113          	addi	sp,sp,96
c0007110:	00008067          	ret
c0007114:	014a2603          	lw	a2,20(s4)
c0007118:	010a2783          	lw	a5,16(s4)
c000711c:	2af66c63          	bltu	a2,a5,c00073d4 <do_execve+0x578>
c0007120:	018a2783          	lw	a5,24(s4)
c0007124:	0017f693          	andi	a3,a5,1
c0007128:	0027f713          	andi	a4,a5,2
c000712c:	00269693          	slli	a3,a3,0x2
c0007130:	00070463          	beqz	a4,c0007138 <do_execve+0x2dc>
c0007134:	0026e693          	ori	a3,a3,2
c0007138:	0047f793          	andi	a5,a5,4
c000713c:	00078463          	beqz	a5,c0007144 <do_execve+0x2e8>
c0007140:	0016e693          	ori	a3,a3,1
c0007144:	0016f793          	andi	a5,a3,1
c0007148:	01300b13          	li	s6,19
c000714c:	00079463          	bnez	a5,c0007154 <do_execve+0x2f8>
c0007150:	01100b13          	li	s6,17
c0007154:	0026f793          	andi	a5,a3,2
c0007158:	00078463          	beqz	a5,c0007160 <do_execve+0x304>
c000715c:	01700b13          	li	s6,23
c0007160:	0046f793          	andi	a5,a3,4
c0007164:	00078463          	beqz	a5,c000716c <do_execve+0x310>
c0007168:	008b6b13          	ori	s6,s6,8
c000716c:	008a2583          	lw	a1,8(s4)
c0007170:	00000713          	li	a4,0
c0007174:	00098513          	mv	a0,s3
c0007178:	9c0fa0ef          	jal	ra,c0001338 <mm_map>
c000717c:	00050913          	mv	s2,a0
c0007180:	0a051a63          	bnez	a0,c0007234 <do_execve+0x3d8>
c0007184:	008a2d03          	lw	s10,8(s4)
c0007188:	010a2903          	lw	s2,16(s4)
c000718c:	004a2483          	lw	s1,4(s4)
c0007190:	fffff7b7          	lui	a5,0xfffff
c0007194:	012d0933          	add	s2,s10,s2
c0007198:	009c84b3          	add	s1,s9,s1
c000719c:	00fd7db3          	and	s11,s10,a5
c00071a0:	232d7263          	bleu	s2,s10,c00073c4 <do_execve+0x568>
c00071a4:	00001ab7          	lui	s5,0x1
c00071a8:	0700006f          	j	c0007218 <do_execve+0x3bc>
c00071ac:	41bd0533          	sub	a0,s10,s11
c00071b0:	015d8db3          	add	s11,s11,s5
c00071b4:	40aa8c33          	sub	s8,s5,a0
c00071b8:	01b97663          	bleu	s11,s2,c00071c4 <do_execve+0x368>
c00071bc:	41bc0833          	sub	a6,s8,s11
c00071c0:	01090c33          	add	s8,s2,a6
c00071c4:	00038697          	auipc	a3,0x38
c00071c8:	b246a683          	lw	a3,-1244(a3) # c003ece8 <pages>
c00071cc:	00012783          	lw	a5,0(sp)
c00071d0:	40d406b3          	sub	a3,s0,a3
c00071d4:	4056d693          	srai	a3,a3,0x5
c00071d8:	00f686b3          	add	a3,a3,a5
c00071dc:	0176f5b3          	and	a1,a3,s7
c00071e0:	00038617          	auipc	a2,0x38
c00071e4:	a1c62603          	lw	a2,-1508(a2) # c003ebfc <npage>
c00071e8:	00c69693          	slli	a3,a3,0xc
c00071ec:	1ec5f863          	bleu	a2,a1,c00073dc <do_execve+0x580>
c00071f0:	00038617          	auipc	a2,0x38
c00071f4:	af062603          	lw	a2,-1296(a2) # c003ece0 <va_pa_offset>
c00071f8:	00c686b3          	add	a3,a3,a2
c00071fc:	00048593          	mv	a1,s1
c0007200:	000c0613          	mv	a2,s8
c0007204:	00a68533          	add	a0,a3,a0
c0007208:	018d0d33          	add	s10,s10,s8
c000720c:	41c040ef          	jal	ra,c000b628 <memcpy>
c0007210:	018484b3          	add	s1,s1,s8
c0007214:	052d7c63          	bleu	s2,s10,c000726c <do_execve+0x410>
c0007218:	00c9a503          	lw	a0,12(s3)
c000721c:	000b0613          	mv	a2,s6
c0007220:	000d8593          	mv	a1,s11
c0007224:	a41fd0ef          	jal	ra,c0004c64 <pgdir_alloc_page>
c0007228:	00050413          	mv	s0,a0
c000722c:	f80510e3          	bnez	a0,c00071ac <do_execve+0x350>
c0007230:	ffc00913          	li	s2,-4
c0007234:	00098513          	mv	a0,s3
c0007238:	aecfa0ef          	jal	ra,c0001524 <exit_mmap>
c000723c:	00098513          	mv	a0,s3
c0007240:	e8dfe0ef          	jal	ra,c00060cc <put_pgdir>
c0007244:	00098513          	mv	a0,s3
c0007248:	87cfa0ef          	jal	ra,c00012c4 <mm_destroy>
c000724c:	d09ff06f          	j	c0006f54 <do_execve+0xf8>
c0007250:	00090513          	mv	a0,s2
c0007254:	ad0fa0ef          	jal	ra,c0001524 <exit_mmap>
c0007258:	00090513          	mv	a0,s2
c000725c:	e71fe0ef          	jal	ra,c00060cc <put_pgdir>
c0007260:	00090513          	mv	a0,s2
c0007264:	860fa0ef          	jal	ra,c00012c4 <mm_destroy>
c0007268:	ca9ff06f          	j	c0006f10 <do_execve+0xb4>
c000726c:	008a2483          	lw	s1,8(s4)
c0007270:	014a2683          	lw	a3,20(s4)
c0007274:	00d484b3          	add	s1,s1,a3
c0007278:	09bd6863          	bltu	s10,s11,c0007308 <do_execve+0x4ac>
c000727c:	00001937          	lui	s2,0x1
c0007280:	069d6663          	bltu	s10,s1,c00072ec <do_execve+0x490>
c0007284:	d59ff06f          	j	c0006fdc <do_execve+0x180>
c0007288:	41bd0533          	sub	a0,s10,s11
c000728c:	012d8db3          	add	s11,s11,s2
c0007290:	40a90633          	sub	a2,s2,a0
c0007294:	01b4f663          	bleu	s11,s1,c00072a0 <do_execve+0x444>
c0007298:	41b60633          	sub	a2,a2,s11
c000729c:	00c48633          	add	a2,s1,a2
c00072a0:	00038697          	auipc	a3,0x38
c00072a4:	a486a683          	lw	a3,-1464(a3) # c003ece8 <pages>
c00072a8:	00412783          	lw	a5,4(sp)
c00072ac:	40d406b3          	sub	a3,s0,a3
c00072b0:	4056d693          	srai	a3,a3,0x5
c00072b4:	00f686b3          	add	a3,a3,a5
c00072b8:	0176f833          	and	a6,a3,s7
c00072bc:	00038597          	auipc	a1,0x38
c00072c0:	9405a583          	lw	a1,-1728(a1) # c003ebfc <npage>
c00072c4:	00c69693          	slli	a3,a3,0xc
c00072c8:	10b87a63          	bleu	a1,a6,c00073dc <do_execve+0x580>
c00072cc:	00038597          	auipc	a1,0x38
c00072d0:	a145a583          	lw	a1,-1516(a1) # c003ece0 <va_pa_offset>
c00072d4:	00b686b3          	add	a3,a3,a1
c00072d8:	00cd0d33          	add	s10,s10,a2
c00072dc:	00000593          	li	a1,0
c00072e0:	00a68533          	add	a0,a3,a0
c00072e4:	328040ef          	jal	ra,c000b60c <memset>
c00072e8:	ce9d7ae3          	bleu	s1,s10,c0006fdc <do_execve+0x180>
c00072ec:	00c9a503          	lw	a0,12(s3)
c00072f0:	000b0613          	mv	a2,s6
c00072f4:	000d8593          	mv	a1,s11
c00072f8:	96dfd0ef          	jal	ra,c0004c64 <pgdir_alloc_page>
c00072fc:	00050413          	mv	s0,a0
c0007300:	f80514e3          	bnez	a0,c0007288 <do_execve+0x42c>
c0007304:	f2dff06f          	j	c0007230 <do_execve+0x3d4>
c0007308:	cda48ae3          	beq	s1,s10,c0006fdc <do_execve+0x180>
c000730c:	41bd0933          	sub	s2,s10,s11
c0007310:	00001537          	lui	a0,0x1
c0007314:	00a90533          	add	a0,s2,a0
c0007318:	09b4e663          	bltu	s1,s11,c00073a4 <do_execve+0x548>
c000731c:	41200933          	neg	s2,s2
c0007320:	00038697          	auipc	a3,0x38
c0007324:	9c86a683          	lw	a3,-1592(a3) # c003ece8 <pages>
c0007328:	00c12783          	lw	a5,12(sp)
c000732c:	40d406b3          	sub	a3,s0,a3
c0007330:	4056d693          	srai	a3,a3,0x5
c0007334:	00f686b3          	add	a3,a3,a5
c0007338:	0176f5b3          	and	a1,a3,s7
c000733c:	00038617          	auipc	a2,0x38
c0007340:	8c062603          	lw	a2,-1856(a2) # c003ebfc <npage>
c0007344:	00c69693          	slli	a3,a3,0xc
c0007348:	08c5fa63          	bleu	a2,a1,c00073dc <do_execve+0x580>
c000734c:	00038617          	auipc	a2,0x38
c0007350:	99462603          	lw	a2,-1644(a2) # c003ece0 <va_pa_offset>
c0007354:	00c686b3          	add	a3,a3,a2
c0007358:	00000593          	li	a1,0
c000735c:	00090613          	mv	a2,s2
c0007360:	00a68533          	add	a0,a3,a0
c0007364:	2a8040ef          	jal	ra,c000b60c <memset>
c0007368:	01a90733          	add	a4,s2,s10
c000736c:	05b4f263          	bleu	s11,s1,c00073b0 <do_execve+0x554>
c0007370:	c6e486e3          	beq	s1,a4,c0006fdc <do_execve+0x180>
c0007374:	00006697          	auipc	a3,0x6
c0007378:	59068693          	addi	a3,a3,1424 # c000d904 <default_pmm_manager+0x748>
c000737c:	00005617          	auipc	a2,0x5
c0007380:	dfc60613          	addi	a2,a2,-516 # c000c178 <commands+0x3d8>
c0007384:	26f00593          	li	a1,623
c0007388:	00007517          	auipc	a0,0x7
c000738c:	95c50513          	addi	a0,a0,-1700 # c000dce4 <default_pmm_manager+0xb28>
c0007390:	ec1f80ef          	jal	ra,c0000250 <__panic>
c0007394:	00098513          	mv	a0,s3
c0007398:	f2df90ef          	jal	ra,c00012c4 <mm_destroy>
c000739c:	ffc00913          	li	s2,-4
c00073a0:	bb5ff06f          	j	c0006f54 <do_execve+0xf8>
c00073a4:	41b486b3          	sub	a3,s1,s11
c00073a8:	41268933          	sub	s2,a3,s2
c00073ac:	f75ff06f          	j	c0007320 <do_execve+0x4c4>
c00073b0:	fdb712e3          	bne	a4,s11,c0007374 <do_execve+0x518>
c00073b4:	000d8d13          	mv	s10,s11
c00073b8:	ec5ff06f          	j	c000727c <do_execve+0x420>
c00073bc:	ffd00913          	li	s2,-3
c00073c0:	d15ff06f          	j	c00070d4 <do_execve+0x278>
c00073c4:	000d0493          	mv	s1,s10
c00073c8:	ea9ff06f          	j	c0007270 <do_execve+0x414>
c00073cc:	ffc00913          	li	s2,-4
c00073d0:	b85ff06f          	j	c0006f54 <do_execve+0xf8>
c00073d4:	ff800913          	li	s2,-8
c00073d8:	e5dff06f          	j	c0007234 <do_execve+0x3d8>
c00073dc:	00005617          	auipc	a2,0x5
c00073e0:	68060613          	addi	a2,a2,1664 # c000ca5c <commands+0xcbc>
c00073e4:	06800593          	li	a1,104
c00073e8:	00005517          	auipc	a0,0x5
c00073ec:	42c50513          	addi	a0,a0,1068 # c000c814 <commands+0xa74>
c00073f0:	e61f80ef          	jal	ra,c0000250 <__panic>
c00073f4:	00005617          	auipc	a2,0x5
c00073f8:	68c60613          	addi	a2,a2,1676 # c000ca80 <commands+0xce0>
c00073fc:	28a00593          	li	a1,650
c0007400:	00007517          	auipc	a0,0x7
c0007404:	8e450513          	addi	a0,a0,-1820 # c000dce4 <default_pmm_manager+0xb28>
c0007408:	e49f80ef          	jal	ra,c0000250 <__panic>
c000740c:	00006697          	auipc	a3,0x6
c0007410:	60068693          	addi	a3,a3,1536 # c000da0c <default_pmm_manager+0x850>
c0007414:	00005617          	auipc	a2,0x5
c0007418:	d6460613          	addi	a2,a2,-668 # c000c178 <commands+0x3d8>
c000741c:	28500593          	li	a1,645
c0007420:	00007517          	auipc	a0,0x7
c0007424:	8c450513          	addi	a0,a0,-1852 # c000dce4 <default_pmm_manager+0xb28>
c0007428:	e29f80ef          	jal	ra,c0000250 <__panic>
c000742c:	00006697          	auipc	a3,0x6
c0007430:	59c68693          	addi	a3,a3,1436 # c000d9c8 <default_pmm_manager+0x80c>
c0007434:	00005617          	auipc	a2,0x5
c0007438:	d4460613          	addi	a2,a2,-700 # c000c178 <commands+0x3d8>
c000743c:	28400593          	li	a1,644
c0007440:	00007517          	auipc	a0,0x7
c0007444:	8a450513          	addi	a0,a0,-1884 # c000dce4 <default_pmm_manager+0xb28>
c0007448:	e09f80ef          	jal	ra,c0000250 <__panic>
c000744c:	00006697          	auipc	a3,0x6
c0007450:	53868693          	addi	a3,a3,1336 # c000d984 <default_pmm_manager+0x7c8>
c0007454:	00005617          	auipc	a2,0x5
c0007458:	d2460613          	addi	a2,a2,-732 # c000c178 <commands+0x3d8>
c000745c:	28300593          	li	a1,643
c0007460:	00007517          	auipc	a0,0x7
c0007464:	88450513          	addi	a0,a0,-1916 # c000dce4 <default_pmm_manager+0xb28>
c0007468:	de9f80ef          	jal	ra,c0000250 <__panic>
c000746c:	00006697          	auipc	a3,0x6
c0007470:	4d468693          	addi	a3,a3,1236 # c000d940 <default_pmm_manager+0x784>
c0007474:	00005617          	auipc	a2,0x5
c0007478:	d0460613          	addi	a2,a2,-764 # c000c178 <commands+0x3d8>
c000747c:	28200593          	li	a1,642
c0007480:	00007517          	auipc	a0,0x7
c0007484:	86450513          	addi	a0,a0,-1948 # c000dce4 <default_pmm_manager+0xb28>
c0007488:	dc9f80ef          	jal	ra,c0000250 <__panic>

c000748c <do_yield>:
c000748c:	00100713          	li	a4,1
c0007490:	00037797          	auipc	a5,0x37
c0007494:	7747a783          	lw	a5,1908(a5) # c003ec04 <current>
c0007498:	00e7a823          	sw	a4,16(a5)
c000749c:	00000513          	li	a0,0
c00074a0:	00008067          	ret

c00074a4 <do_wait>:
c00074a4:	ff010113          	addi	sp,sp,-16
c00074a8:	00812423          	sw	s0,8(sp)
c00074ac:	00912223          	sw	s1,4(sp)
c00074b0:	00112623          	sw	ra,12(sp)
c00074b4:	00058413          	mv	s0,a1
c00074b8:	00050493          	mv	s1,a0
c00074bc:	02058063          	beqz	a1,c00074dc <do_wait+0x38>
c00074c0:	00037797          	auipc	a5,0x37
c00074c4:	7447a783          	lw	a5,1860(a5) # c003ec04 <current>
c00074c8:	0187a503          	lw	a0,24(a5)
c00074cc:	00100693          	li	a3,1
c00074d0:	00400613          	li	a2,4
c00074d4:	ffcfa0ef          	jal	ra,c0001cd0 <user_mem_check>
c00074d8:	02050063          	beqz	a0,c00074f8 <do_wait+0x54>
c00074dc:	00040593          	mv	a1,s0
c00074e0:	00048513          	mv	a0,s1
c00074e4:	00c12083          	lw	ra,12(sp)
c00074e8:	00812403          	lw	s0,8(sp)
c00074ec:	00412483          	lw	s1,4(sp)
c00074f0:	01010113          	addi	sp,sp,16
c00074f4:	df8ff06f          	j	c0006aec <do_wait.part.1>
c00074f8:	00c12083          	lw	ra,12(sp)
c00074fc:	ffd00513          	li	a0,-3
c0007500:	00812403          	lw	s0,8(sp)
c0007504:	00412483          	lw	s1,4(sp)
c0007508:	01010113          	addi	sp,sp,16
c000750c:	00008067          	ret

c0007510 <do_kill>:
c0007510:	ff010113          	addi	sp,sp,-16
c0007514:	00812423          	sw	s0,8(sp)
c0007518:	00112623          	sw	ra,12(sp)
c000751c:	e11fe0ef          	jal	ra,c000632c <find_proc>
c0007520:	ffd00413          	li	s0,-3
c0007524:	02050463          	beqz	a0,c000754c <do_kill+0x3c>
c0007528:	05c52703          	lw	a4,92(a0)
c000752c:	ff700413          	li	s0,-9
c0007530:	00177693          	andi	a3,a4,1
c0007534:	00069c63          	bnez	a3,c000754c <do_kill+0x3c>
c0007538:	08452683          	lw	a3,132(a0)
c000753c:	00176713          	ori	a4,a4,1
c0007540:	04e52e23          	sw	a4,92(a0)
c0007544:	00000413          	li	s0,0
c0007548:	0006cc63          	bltz	a3,c0007560 <do_kill+0x50>
c000754c:	00c12083          	lw	ra,12(sp)
c0007550:	00040513          	mv	a0,s0
c0007554:	00812403          	lw	s0,8(sp)
c0007558:	01010113          	addi	sp,sp,16
c000755c:	00008067          	ret
c0007560:	248000ef          	jal	ra,c00077a8 <wakeup_proc>
c0007564:	00c12083          	lw	ra,12(sp)
c0007568:	00040513          	mv	a0,s0
c000756c:	00812403          	lw	s0,8(sp)
c0007570:	01010113          	addi	sp,sp,16
c0007574:	00008067          	ret

c0007578 <proc_init>:
c0007578:	ff010113          	addi	sp,sp,-16
c000757c:	00037797          	auipc	a5,0x37
c0007580:	77078793          	addi	a5,a5,1904 # c003ecec <proc_list>
c0007584:	00112623          	sw	ra,12(sp)
c0007588:	00812423          	sw	s0,8(sp)
c000758c:	00f7a223          	sw	a5,4(a5)
c0007590:	00f7a023          	sw	a5,0(a5)
c0007594:	00037717          	auipc	a4,0x37
c0007598:	63470713          	addi	a4,a4,1588 # c003ebc8 <__rq>
c000759c:	00035797          	auipc	a5,0x35
c00075a0:	62c78793          	addi	a5,a5,1580 # c003cbc8 <hash_list>
c00075a4:	00f7a223          	sw	a5,4(a5)
c00075a8:	00f7a023          	sw	a5,0(a5)
c00075ac:	00878793          	addi	a5,a5,8
c00075b0:	fef71ae3          	bne	a4,a5,c00075a4 <proc_init+0x2c>
c00075b4:	9bdfe0ef          	jal	ra,c0005f70 <alloc_proc>
c00075b8:	00037297          	auipc	t0,0x37
c00075bc:	64a2a823          	sw	a0,1616(t0) # c003ec08 <idleproc>
c00075c0:	0a050e63          	beqz	a0,c000767c <proc_init+0x104>
c00075c4:	00200713          	li	a4,2
c00075c8:	00100413          	li	s0,1
c00075cc:	00e52023          	sw	a4,0(a0)
c00075d0:	00008717          	auipc	a4,0x8
c00075d4:	a3070713          	addi	a4,a4,-1488 # c000f000 <bootstack>
c00075d8:	00006597          	auipc	a1,0x6
c00075dc:	64458593          	addi	a1,a1,1604 # c000dc1c <default_pmm_manager+0xa60>
c00075e0:	00052223          	sw	zero,4(a0)
c00075e4:	00e52623          	sw	a4,12(a0)
c00075e8:	00852823          	sw	s0,16(a0)
c00075ec:	c65fe0ef          	jal	ra,c0006250 <set_proc_name>
c00075f0:	00037797          	auipc	a5,0x37
c00075f4:	6207a783          	lw	a5,1568(a5) # c003ec10 <nr_process>
c00075f8:	008787b3          	add	a5,a5,s0
c00075fc:	00037297          	auipc	t0,0x37
c0007600:	60f2aa23          	sw	a5,1556(t0) # c003ec10 <nr_process>
c0007604:	00000613          	li	a2,0
c0007608:	00037797          	auipc	a5,0x37
c000760c:	6007a783          	lw	a5,1536(a5) # c003ec08 <idleproc>
c0007610:	00000593          	li	a1,0
c0007614:	fffff517          	auipc	a0,0xfffff
c0007618:	6fc50513          	addi	a0,a0,1788 # c0006d10 <init_main>
c000761c:	00037297          	auipc	t0,0x37
c0007620:	5ef2a423          	sw	a5,1512(t0) # c003ec04 <current>
c0007624:	aacff0ef          	jal	ra,c00068d0 <kernel_thread>
c0007628:	0aa05663          	blez	a0,c00076d4 <proc_init+0x15c>
c000762c:	d01fe0ef          	jal	ra,c000632c <find_proc>
c0007630:	00006597          	auipc	a1,0x6
c0007634:	61058593          	addi	a1,a1,1552 # c000dc40 <default_pmm_manager+0xa84>
c0007638:	00037297          	auipc	t0,0x37
c000763c:	5ca2aa23          	sw	a0,1492(t0) # c003ec0c <initproc>
c0007640:	c11fe0ef          	jal	ra,c0006250 <set_proc_name>
c0007644:	00037797          	auipc	a5,0x37
c0007648:	5c47a783          	lw	a5,1476(a5) # c003ec08 <idleproc>
c000764c:	06078463          	beqz	a5,c00076b4 <proc_init+0x13c>
c0007650:	0047a783          	lw	a5,4(a5)
c0007654:	06079063          	bnez	a5,c00076b4 <proc_init+0x13c>
c0007658:	00037797          	auipc	a5,0x37
c000765c:	5b47a783          	lw	a5,1460(a5) # c003ec0c <initproc>
c0007660:	02078a63          	beqz	a5,c0007694 <proc_init+0x11c>
c0007664:	0047a783          	lw	a5,4(a5)
c0007668:	02879663          	bne	a5,s0,c0007694 <proc_init+0x11c>
c000766c:	00c12083          	lw	ra,12(sp)
c0007670:	00812403          	lw	s0,8(sp)
c0007674:	01010113          	addi	sp,sp,16
c0007678:	00008067          	ret
c000767c:	00006617          	auipc	a2,0x6
c0007680:	58860613          	addi	a2,a2,1416 # c000dc04 <default_pmm_manager+0xa48>
c0007684:	38900593          	li	a1,905
c0007688:	00006517          	auipc	a0,0x6
c000768c:	65c50513          	addi	a0,a0,1628 # c000dce4 <default_pmm_manager+0xb28>
c0007690:	bc1f80ef          	jal	ra,c0000250 <__panic>
c0007694:	00006697          	auipc	a3,0x6
c0007698:	5dc68693          	addi	a3,a3,1500 # c000dc70 <default_pmm_manager+0xab4>
c000769c:	00005617          	auipc	a2,0x5
c00076a0:	adc60613          	addi	a2,a2,-1316 # c000c178 <commands+0x3d8>
c00076a4:	39e00593          	li	a1,926
c00076a8:	00006517          	auipc	a0,0x6
c00076ac:	63c50513          	addi	a0,a0,1596 # c000dce4 <default_pmm_manager+0xb28>
c00076b0:	ba1f80ef          	jal	ra,c0000250 <__panic>
c00076b4:	00006697          	auipc	a3,0x6
c00076b8:	59468693          	addi	a3,a3,1428 # c000dc48 <default_pmm_manager+0xa8c>
c00076bc:	00005617          	auipc	a2,0x5
c00076c0:	abc60613          	addi	a2,a2,-1348 # c000c178 <commands+0x3d8>
c00076c4:	39d00593          	li	a1,925
c00076c8:	00006517          	auipc	a0,0x6
c00076cc:	61c50513          	addi	a0,a0,1564 # c000dce4 <default_pmm_manager+0xb28>
c00076d0:	b81f80ef          	jal	ra,c0000250 <__panic>
c00076d4:	00006617          	auipc	a2,0x6
c00076d8:	55060613          	addi	a2,a2,1360 # c000dc24 <default_pmm_manager+0xa68>
c00076dc:	39700593          	li	a1,919
c00076e0:	00006517          	auipc	a0,0x6
c00076e4:	60450513          	addi	a0,a0,1540 # c000dce4 <default_pmm_manager+0xb28>
c00076e8:	b69f80ef          	jal	ra,c0000250 <__panic>

c00076ec <cpu_idle>:
c00076ec:	ff010113          	addi	sp,sp,-16
c00076f0:	00112623          	sw	ra,12(sp)
c00076f4:	00037717          	auipc	a4,0x37
c00076f8:	51072703          	lw	a4,1296(a4) # c003ec04 <current>
c00076fc:	01072783          	lw	a5,16(a4)
c0007700:	fe078ee3          	beqz	a5,c00076fc <cpu_idle+0x10>
c0007704:	194000ef          	jal	ra,c0007898 <schedule>
c0007708:	fedff06f          	j	c00076f4 <cpu_idle+0x8>

c000770c <lab6_set_priority>:
c000770c:	00050a63          	beqz	a0,c0007720 <lab6_set_priority+0x14>
c0007710:	00037797          	auipc	a5,0x37
c0007714:	4f47a783          	lw	a5,1268(a5) # c003ec04 <current>
c0007718:	0aa7aa23          	sw	a0,180(a5)
c000771c:	00008067          	ret
c0007720:	00100713          	li	a4,1
c0007724:	00037797          	auipc	a5,0x37
c0007728:	4e07a783          	lw	a5,1248(a5) # c003ec04 <current>
c000772c:	0ae7aa23          	sw	a4,180(a5)
c0007730:	00008067          	ret

c0007734 <sched_init>:
c0007734:	ff010113          	addi	sp,sp,-16
c0007738:	0002e697          	auipc	a3,0x2e
c000773c:	05c68693          	addi	a3,a3,92 # c0035794 <default_sched_class>
c0007740:	00112623          	sw	ra,12(sp)
c0007744:	00812423          	sw	s0,8(sp)
c0007748:	00037797          	auipc	a5,0x37
c000774c:	4d478793          	addi	a5,a5,1236 # c003ec1c <timer_list>
c0007750:	0046a603          	lw	a2,4(a3)
c0007754:	00037717          	auipc	a4,0x37
c0007758:	47470713          	addi	a4,a4,1140 # c003ebc8 <__rq>
c000775c:	00f7a223          	sw	a5,4(a5)
c0007760:	00f7a023          	sw	a5,0(a5)
c0007764:	00500793          	li	a5,5
c0007768:	00037417          	auipc	s0,0x37
c000776c:	4b040413          	addi	s0,s0,1200 # c003ec18 <sched_class>
c0007770:	00070513          	mv	a0,a4
c0007774:	00f72623          	sw	a5,12(a4)
c0007778:	00d42023          	sw	a3,0(s0)
c000777c:	00037297          	auipc	t0,0x37
c0007780:	48e2ac23          	sw	a4,1176(t0) # c003ec14 <rq>
c0007784:	000600e7          	jalr	a2
c0007788:	00042783          	lw	a5,0(s0)
c000778c:	00c12083          	lw	ra,12(sp)
c0007790:	00812403          	lw	s0,8(sp)
c0007794:	0007a583          	lw	a1,0(a5)
c0007798:	00006517          	auipc	a0,0x6
c000779c:	56050513          	addi	a0,a0,1376 # c000dcf8 <default_pmm_manager+0xb3c>
c00077a0:	01010113          	addi	sp,sp,16
c00077a4:	939f806f          	j	c00000dc <cprintf>

c00077a8 <wakeup_proc>:
c00077a8:	00052703          	lw	a4,0(a0)
c00077ac:	ff010113          	addi	sp,sp,-16
c00077b0:	00112623          	sw	ra,12(sp)
c00077b4:	00812423          	sw	s0,8(sp)
c00077b8:	00912223          	sw	s1,4(sp)
c00077bc:	00300793          	li	a5,3
c00077c0:	0af70c63          	beq	a4,a5,c0007878 <wakeup_proc+0xd0>
c00077c4:	00050413          	mv	s0,a0
c00077c8:	100027f3          	csrr	a5,sstatus
c00077cc:	0027f793          	andi	a5,a5,2
c00077d0:	00000493          	li	s1,0
c00077d4:	06079a63          	bnez	a5,c0007848 <wakeup_proc+0xa0>
c00077d8:	00200793          	li	a5,2
c00077dc:	08f70063          	beq	a4,a5,c000785c <wakeup_proc+0xb4>
c00077e0:	00f42023          	sw	a5,0(s0)
c00077e4:	08042223          	sw	zero,132(s0)
c00077e8:	00037797          	auipc	a5,0x37
c00077ec:	41c7a783          	lw	a5,1052(a5) # c003ec04 <current>
c00077f0:	02f40663          	beq	s0,a5,c000781c <wakeup_proc+0x74>
c00077f4:	00037797          	auipc	a5,0x37
c00077f8:	4147a783          	lw	a5,1044(a5) # c003ec08 <idleproc>
c00077fc:	02f40063          	beq	s0,a5,c000781c <wakeup_proc+0x74>
c0007800:	00037797          	auipc	a5,0x37
c0007804:	4187a783          	lw	a5,1048(a5) # c003ec18 <sched_class>
c0007808:	0087a783          	lw	a5,8(a5)
c000780c:	00040593          	mv	a1,s0
c0007810:	00037517          	auipc	a0,0x37
c0007814:	40452503          	lw	a0,1028(a0) # c003ec14 <rq>
c0007818:	000780e7          	jalr	a5
c000781c:	00049c63          	bnez	s1,c0007834 <wakeup_proc+0x8c>
c0007820:	00c12083          	lw	ra,12(sp)
c0007824:	00812403          	lw	s0,8(sp)
c0007828:	00412483          	lw	s1,4(sp)
c000782c:	01010113          	addi	sp,sp,16
c0007830:	00008067          	ret
c0007834:	00c12083          	lw	ra,12(sp)
c0007838:	00812403          	lw	s0,8(sp)
c000783c:	00412483          	lw	s1,4(sp)
c0007840:	01010113          	addi	sp,sp,16
c0007844:	fd9f806f          	j	c000081c <intr_enable>
c0007848:	fddf80ef          	jal	ra,c0000824 <intr_disable>
c000784c:	00042703          	lw	a4,0(s0)
c0007850:	00200793          	li	a5,2
c0007854:	00100493          	li	s1,1
c0007858:	f8f714e3          	bne	a4,a5,c00077e0 <wakeup_proc+0x38>
c000785c:	00006617          	auipc	a2,0x6
c0007860:	4e460613          	addi	a2,a2,1252 # c000dd40 <default_pmm_manager+0xb84>
c0007864:	04800593          	li	a1,72
c0007868:	00006517          	auipc	a0,0x6
c000786c:	4c050513          	addi	a0,a0,1216 # c000dd28 <default_pmm_manager+0xb6c>
c0007870:	a69f80ef          	jal	ra,c00002d8 <__warn>
c0007874:	fa9ff06f          	j	c000781c <wakeup_proc+0x74>
c0007878:	00006697          	auipc	a3,0x6
c000787c:	49468693          	addi	a3,a3,1172 # c000dd0c <default_pmm_manager+0xb50>
c0007880:	00005617          	auipc	a2,0x5
c0007884:	8f860613          	addi	a2,a2,-1800 # c000c178 <commands+0x3d8>
c0007888:	03c00593          	li	a1,60
c000788c:	00006517          	auipc	a0,0x6
c0007890:	49c50513          	addi	a0,a0,1180 # c000dd28 <default_pmm_manager+0xb6c>
c0007894:	9bdf80ef          	jal	ra,c0000250 <__panic>

c0007898 <schedule>:
c0007898:	ff010113          	addi	sp,sp,-16
c000789c:	00112623          	sw	ra,12(sp)
c00078a0:	00812423          	sw	s0,8(sp)
c00078a4:	00912223          	sw	s1,4(sp)
c00078a8:	100027f3          	csrr	a5,sstatus
c00078ac:	0027f793          	andi	a5,a5,2
c00078b0:	00000493          	li	s1,0
c00078b4:	0a079863          	bnez	a5,c0007964 <schedule+0xcc>
c00078b8:	00037597          	auipc	a1,0x37
c00078bc:	34c5a583          	lw	a1,844(a1) # c003ec04 <current>
c00078c0:	0005a703          	lw	a4,0(a1)
c00078c4:	0005a823          	sw	zero,16(a1)
c00078c8:	00200793          	li	a5,2
c00078cc:	0af70c63          	beq	a4,a5,c0007984 <schedule+0xec>
c00078d0:	00037797          	auipc	a5,0x37
c00078d4:	3487a783          	lw	a5,840(a5) # c003ec18 <sched_class>
c00078d8:	0107a783          	lw	a5,16(a5)
c00078dc:	00037517          	auipc	a0,0x37
c00078e0:	33852503          	lw	a0,824(a0) # c003ec14 <rq>
c00078e4:	000780e7          	jalr	a5
c00078e8:	00050413          	mv	s0,a0
c00078ec:	06050663          	beqz	a0,c0007958 <schedule+0xc0>
c00078f0:	00037797          	auipc	a5,0x37
c00078f4:	3287a783          	lw	a5,808(a5) # c003ec18 <sched_class>
c00078f8:	00c7a783          	lw	a5,12(a5)
c00078fc:	00050593          	mv	a1,a0
c0007900:	00037517          	auipc	a0,0x37
c0007904:	31452503          	lw	a0,788(a0) # c003ec14 <rq>
c0007908:	000780e7          	jalr	a5
c000790c:	00842783          	lw	a5,8(s0)
c0007910:	00037717          	auipc	a4,0x37
c0007914:	2f472703          	lw	a4,756(a4) # c003ec04 <current>
c0007918:	00178793          	addi	a5,a5,1
c000791c:	00f42423          	sw	a5,8(s0)
c0007920:	00e40663          	beq	s0,a4,c000792c <schedule+0x94>
c0007924:	00040513          	mv	a0,s0
c0007928:	971fe0ef          	jal	ra,c0006298 <proc_run>
c000792c:	00049c63          	bnez	s1,c0007944 <schedule+0xac>
c0007930:	00c12083          	lw	ra,12(sp)
c0007934:	00812403          	lw	s0,8(sp)
c0007938:	00412483          	lw	s1,4(sp)
c000793c:	01010113          	addi	sp,sp,16
c0007940:	00008067          	ret
c0007944:	00c12083          	lw	ra,12(sp)
c0007948:	00812403          	lw	s0,8(sp)
c000794c:	00412483          	lw	s1,4(sp)
c0007950:	01010113          	addi	sp,sp,16
c0007954:	ec9f806f          	j	c000081c <intr_enable>
c0007958:	00037417          	auipc	s0,0x37
c000795c:	2b042403          	lw	s0,688(s0) # c003ec08 <idleproc>
c0007960:	fadff06f          	j	c000790c <schedule+0x74>
c0007964:	ec1f80ef          	jal	ra,c0000824 <intr_disable>
c0007968:	00037597          	auipc	a1,0x37
c000796c:	29c5a583          	lw	a1,668(a1) # c003ec04 <current>
c0007970:	0005a703          	lw	a4,0(a1)
c0007974:	0005a823          	sw	zero,16(a1)
c0007978:	00200793          	li	a5,2
c000797c:	00100493          	li	s1,1
c0007980:	f4f718e3          	bne	a4,a5,c00078d0 <schedule+0x38>
c0007984:	00037797          	auipc	a5,0x37
c0007988:	2847a783          	lw	a5,644(a5) # c003ec08 <idleproc>
c000798c:	f4f582e3          	beq	a1,a5,c00078d0 <schedule+0x38>
c0007990:	00037797          	auipc	a5,0x37
c0007994:	2887a783          	lw	a5,648(a5) # c003ec18 <sched_class>
c0007998:	0087a783          	lw	a5,8(a5)
c000799c:	00037517          	auipc	a0,0x37
c00079a0:	27852503          	lw	a0,632(a0) # c003ec14 <rq>
c00079a4:	000780e7          	jalr	a5
c00079a8:	f29ff06f          	j	c00078d0 <schedule+0x38>

c00079ac <proc_stride_comp_f>:
c00079ac:	00c52503          	lw	a0,12(a0)
c00079b0:	00c5a783          	lw	a5,12(a1)
c00079b4:	40f50533          	sub	a0,a0,a5
c00079b8:	00a05663          	blez	a0,c00079c4 <proc_stride_comp_f+0x18>
c00079bc:	00100513          	li	a0,1
c00079c0:	00008067          	ret
c00079c4:	00a03533          	snez	a0,a0
c00079c8:	40a00533          	neg	a0,a0
c00079cc:	00008067          	ret

c00079d0 <stride_init>:
c00079d0:	00a52223          	sw	a0,4(a0)
c00079d4:	00a52023          	sw	a0,0(a0)
c00079d8:	00052823          	sw	zero,16(a0)
c00079dc:	00052423          	sw	zero,8(a0)
c00079e0:	00008067          	ret

c00079e4 <stride_pick_next>:
c00079e4:	01052783          	lw	a5,16(a0)
c00079e8:	02078463          	beqz	a5,c0007a10 <stride_pick_next+0x2c>
c00079ec:	0107a683          	lw	a3,16(a5)
c00079f0:	f5c78513          	addi	a0,a5,-164
c00079f4:	00c7a603          	lw	a2,12(a5)
c00079f8:	40000737          	lui	a4,0x40000
c00079fc:	00068463          	beqz	a3,c0007a04 <stride_pick_next+0x20>
c0007a00:	02d75733          	divu	a4,a4,a3
c0007a04:	00c70733          	add	a4,a4,a2
c0007a08:	00e7a623          	sw	a4,12(a5)
c0007a0c:	00008067          	ret
c0007a10:	00000513          	li	a0,0
c0007a14:	00008067          	ret

c0007a18 <stride_proc_tick>:
c0007a18:	0a05a783          	lw	a5,160(a1)
c0007a1c:	00f05663          	blez	a5,c0007a28 <stride_proc_tick+0x10>
c0007a20:	fff78793          	addi	a5,a5,-1
c0007a24:	0af5a023          	sw	a5,160(a1)
c0007a28:	00079663          	bnez	a5,c0007a34 <stride_proc_tick+0x1c>
c0007a2c:	00100793          	li	a5,1
c0007a30:	00f5a823          	sw	a5,16(a1)
c0007a34:	00008067          	ret

c0007a38 <skew_heap_merge.constprop.3>:
c0007a38:	fd010113          	addi	sp,sp,-48
c0007a3c:	02812423          	sw	s0,40(sp)
c0007a40:	02112623          	sw	ra,44(sp)
c0007a44:	02912223          	sw	s1,36(sp)
c0007a48:	03212023          	sw	s2,32(sp)
c0007a4c:	01312e23          	sw	s3,28(sp)
c0007a50:	01412c23          	sw	s4,24(sp)
c0007a54:	01512a23          	sw	s5,20(sp)
c0007a58:	01612823          	sw	s6,16(sp)
c0007a5c:	01712623          	sw	s7,12(sp)
c0007a60:	01812423          	sw	s8,8(sp)
c0007a64:	00058413          	mv	s0,a1
c0007a68:	1a050063          	beqz	a0,c0007c08 <skew_heap_merge.constprop.3+0x1d0>
c0007a6c:	00050493          	mv	s1,a0
c0007a70:	00050793          	mv	a5,a0
c0007a74:	0a058863          	beqz	a1,c0007b24 <skew_heap_merge.constprop.3+0xec>
c0007a78:	f35ff0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0007a7c:	fff00993          	li	s3,-1
c0007a80:	00050913          	mv	s2,a0
c0007a84:	13350a63          	beq	a0,s3,c0007bb8 <skew_heap_merge.constprop.3+0x180>
c0007a88:	00842903          	lw	s2,8(s0)
c0007a8c:	00442a83          	lw	s5,4(s0)
c0007a90:	0e090463          	beqz	s2,c0007b78 <skew_heap_merge.constprop.3+0x140>
c0007a94:	00090593          	mv	a1,s2
c0007a98:	00048513          	mv	a0,s1
c0007a9c:	f11ff0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0007aa0:	0b350c63          	beq	a0,s3,c0007b58 <skew_heap_merge.constprop.3+0x120>
c0007aa4:	00892a03          	lw	s4,8(s2) # 1008 <_binary_obj___user_faultread_out_size-0xf60>
c0007aa8:	00492b83          	lw	s7,4(s2)
c0007aac:	100a0263          	beqz	s4,c0007bb0 <skew_heap_merge.constprop.3+0x178>
c0007ab0:	000a0593          	mv	a1,s4
c0007ab4:	00048513          	mv	a0,s1
c0007ab8:	ef5ff0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0007abc:	0d350a63          	beq	a0,s3,c0007b90 <skew_heap_merge.constprop.3+0x158>
c0007ac0:	008a2b03          	lw	s6,8(s4)
c0007ac4:	004a2c03          	lw	s8,4(s4)
c0007ac8:	160b0463          	beqz	s6,c0007c30 <skew_heap_merge.constprop.3+0x1f8>
c0007acc:	000b0593          	mv	a1,s6
c0007ad0:	00048513          	mv	a0,s1
c0007ad4:	ed9ff0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0007ad8:	13350c63          	beq	a0,s3,c0007c10 <skew_heap_merge.constprop.3+0x1d8>
c0007adc:	008b2583          	lw	a1,8(s6)
c0007ae0:	004b2983          	lw	s3,4(s6)
c0007ae4:	00048513          	mv	a0,s1
c0007ae8:	f51ff0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c0007aec:	00ab2223          	sw	a0,4(s6)
c0007af0:	013b2423          	sw	s3,8(s6)
c0007af4:	00050463          	beqz	a0,c0007afc <skew_heap_merge.constprop.3+0xc4>
c0007af8:	01652023          	sw	s6,0(a0)
c0007afc:	016a2223          	sw	s6,4(s4)
c0007b00:	018a2423          	sw	s8,8(s4)
c0007b04:	014b2023          	sw	s4,0(s6)
c0007b08:	01492223          	sw	s4,4(s2)
c0007b0c:	01792423          	sw	s7,8(s2)
c0007b10:	012a2023          	sw	s2,0(s4)
c0007b14:	01242223          	sw	s2,4(s0)
c0007b18:	01542423          	sw	s5,8(s0)
c0007b1c:	00892023          	sw	s0,0(s2)
c0007b20:	00040793          	mv	a5,s0
c0007b24:	02c12083          	lw	ra,44(sp)
c0007b28:	00078513          	mv	a0,a5
c0007b2c:	02812403          	lw	s0,40(sp)
c0007b30:	02412483          	lw	s1,36(sp)
c0007b34:	02012903          	lw	s2,32(sp)
c0007b38:	01c12983          	lw	s3,28(sp)
c0007b3c:	01812a03          	lw	s4,24(sp)
c0007b40:	01412a83          	lw	s5,20(sp)
c0007b44:	01012b03          	lw	s6,16(sp)
c0007b48:	00c12b83          	lw	s7,12(sp)
c0007b4c:	00812c03          	lw	s8,8(sp)
c0007b50:	03010113          	addi	sp,sp,48
c0007b54:	00008067          	ret
c0007b58:	0084a503          	lw	a0,8(s1)
c0007b5c:	0044a983          	lw	s3,4(s1)
c0007b60:	00090593          	mv	a1,s2
c0007b64:	ed5ff0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c0007b68:	00a4a223          	sw	a0,4(s1)
c0007b6c:	0134a423          	sw	s3,8(s1)
c0007b70:	00050463          	beqz	a0,c0007b78 <skew_heap_merge.constprop.3+0x140>
c0007b74:	00952023          	sw	s1,0(a0)
c0007b78:	00048913          	mv	s2,s1
c0007b7c:	01242223          	sw	s2,4(s0)
c0007b80:	01542423          	sw	s5,8(s0)
c0007b84:	00892023          	sw	s0,0(s2)
c0007b88:	00040793          	mv	a5,s0
c0007b8c:	f99ff06f          	j	c0007b24 <skew_heap_merge.constprop.3+0xec>
c0007b90:	0084a503          	lw	a0,8(s1)
c0007b94:	0044a983          	lw	s3,4(s1)
c0007b98:	000a0593          	mv	a1,s4
c0007b9c:	e9dff0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c0007ba0:	00a4a223          	sw	a0,4(s1)
c0007ba4:	0134a423          	sw	s3,8(s1)
c0007ba8:	00050463          	beqz	a0,c0007bb0 <skew_heap_merge.constprop.3+0x178>
c0007bac:	00952023          	sw	s1,0(a0)
c0007bb0:	00048a13          	mv	s4,s1
c0007bb4:	f55ff06f          	j	c0007b08 <skew_heap_merge.constprop.3+0xd0>
c0007bb8:	0084a983          	lw	s3,8(s1)
c0007bbc:	0044aa03          	lw	s4,4(s1)
c0007bc0:	02098a63          	beqz	s3,c0007bf4 <skew_heap_merge.constprop.3+0x1bc>
c0007bc4:	00040593          	mv	a1,s0
c0007bc8:	00098513          	mv	a0,s3
c0007bcc:	de1ff0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0007bd0:	07250463          	beq	a0,s2,c0007c38 <skew_heap_merge.constprop.3+0x200>
c0007bd4:	00842583          	lw	a1,8(s0)
c0007bd8:	00442903          	lw	s2,4(s0)
c0007bdc:	00098513          	mv	a0,s3
c0007be0:	e59ff0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c0007be4:	00a42223          	sw	a0,4(s0)
c0007be8:	01242423          	sw	s2,8(s0)
c0007bec:	00050463          	beqz	a0,c0007bf4 <skew_heap_merge.constprop.3+0x1bc>
c0007bf0:	00852023          	sw	s0,0(a0)
c0007bf4:	0084a223          	sw	s0,4(s1)
c0007bf8:	0144a423          	sw	s4,8(s1)
c0007bfc:	00942023          	sw	s1,0(s0)
c0007c00:	00048793          	mv	a5,s1
c0007c04:	f21ff06f          	j	c0007b24 <skew_heap_merge.constprop.3+0xec>
c0007c08:	00058793          	mv	a5,a1
c0007c0c:	f19ff06f          	j	c0007b24 <skew_heap_merge.constprop.3+0xec>
c0007c10:	0084a503          	lw	a0,8(s1)
c0007c14:	0044a983          	lw	s3,4(s1)
c0007c18:	000b0593          	mv	a1,s6
c0007c1c:	e1dff0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c0007c20:	00a4a223          	sw	a0,4(s1)
c0007c24:	0134a423          	sw	s3,8(s1)
c0007c28:	00050463          	beqz	a0,c0007c30 <skew_heap_merge.constprop.3+0x1f8>
c0007c2c:	00952023          	sw	s1,0(a0)
c0007c30:	00048b13          	mv	s6,s1
c0007c34:	ec9ff06f          	j	c0007afc <skew_heap_merge.constprop.3+0xc4>
c0007c38:	0089a503          	lw	a0,8(s3)
c0007c3c:	0049a903          	lw	s2,4(s3)
c0007c40:	00040593          	mv	a1,s0
c0007c44:	df5ff0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c0007c48:	00a9a223          	sw	a0,4(s3)
c0007c4c:	0129a423          	sw	s2,8(s3)
c0007c50:	00050863          	beqz	a0,c0007c60 <skew_heap_merge.constprop.3+0x228>
c0007c54:	01352023          	sw	s3,0(a0)
c0007c58:	00098413          	mv	s0,s3
c0007c5c:	f99ff06f          	j	c0007bf4 <skew_heap_merge.constprop.3+0x1bc>
c0007c60:	00098413          	mv	s0,s3
c0007c64:	f91ff06f          	j	c0007bf4 <skew_heap_merge.constprop.3+0x1bc>

c0007c68 <stride_enqueue>:
c0007c68:	fb010113          	addi	sp,sp,-80
c0007c6c:	03312e23          	sw	s3,60(sp)
c0007c70:	01052983          	lw	s3,16(a0)
c0007c74:	04812423          	sw	s0,72(sp)
c0007c78:	04912223          	sw	s1,68(sp)
c0007c7c:	05212023          	sw	s2,64(sp)
c0007c80:	04112623          	sw	ra,76(sp)
c0007c84:	03412c23          	sw	s4,56(sp)
c0007c88:	03512a23          	sw	s5,52(sp)
c0007c8c:	03612823          	sw	s6,48(sp)
c0007c90:	03712623          	sw	s7,44(sp)
c0007c94:	03812423          	sw	s8,40(sp)
c0007c98:	03912223          	sw	s9,36(sp)
c0007c9c:	03a12023          	sw	s10,32(sp)
c0007ca0:	01b12e23          	sw	s11,28(sp)
c0007ca4:	0a05a223          	sw	zero,164(a1)
c0007ca8:	0a05a623          	sw	zero,172(a1)
c0007cac:	0a05a423          	sw	zero,168(a1)
c0007cb0:	00050493          	mv	s1,a0
c0007cb4:	00058413          	mv	s0,a1
c0007cb8:	0a458913          	addi	s2,a1,164
c0007cbc:	02098463          	beqz	s3,c0007ce4 <stride_enqueue+0x7c>
c0007cc0:	0c090263          	beqz	s2,c0007d84 <stride_enqueue+0x11c>
c0007cc4:	00090593          	mv	a1,s2
c0007cc8:	00098513          	mv	a0,s3
c0007ccc:	ce1ff0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0007cd0:	fff00793          	li	a5,-1
c0007cd4:	00050a13          	mv	s4,a0
c0007cd8:	06f50863          	beq	a0,a5,c0007d48 <stride_enqueue+0xe0>
c0007cdc:	0b342423          	sw	s3,168(s0)
c0007ce0:	0129a023          	sw	s2,0(s3)
c0007ce4:	0a042783          	lw	a5,160(s0)
c0007ce8:	0124a823          	sw	s2,16(s1)
c0007cec:	00c4a703          	lw	a4,12(s1)
c0007cf0:	00078463          	beqz	a5,c0007cf8 <stride_enqueue+0x90>
c0007cf4:	00f75463          	ble	a5,a4,c0007cfc <stride_enqueue+0x94>
c0007cf8:	0ae42023          	sw	a4,160(s0)
c0007cfc:	0084a783          	lw	a5,8(s1)
c0007d00:	04c12083          	lw	ra,76(sp)
c0007d04:	08942a23          	sw	s1,148(s0)
c0007d08:	00178793          	addi	a5,a5,1
c0007d0c:	00f4a423          	sw	a5,8(s1)
c0007d10:	04812403          	lw	s0,72(sp)
c0007d14:	04412483          	lw	s1,68(sp)
c0007d18:	04012903          	lw	s2,64(sp)
c0007d1c:	03c12983          	lw	s3,60(sp)
c0007d20:	03812a03          	lw	s4,56(sp)
c0007d24:	03412a83          	lw	s5,52(sp)
c0007d28:	03012b03          	lw	s6,48(sp)
c0007d2c:	02c12b83          	lw	s7,44(sp)
c0007d30:	02812c03          	lw	s8,40(sp)
c0007d34:	02412c83          	lw	s9,36(sp)
c0007d38:	02012d03          	lw	s10,32(sp)
c0007d3c:	01c12d83          	lw	s11,28(sp)
c0007d40:	05010113          	addi	sp,sp,80
c0007d44:	00008067          	ret
c0007d48:	0089aa83          	lw	s5,8(s3)
c0007d4c:	0049ab03          	lw	s6,4(s3)
c0007d50:	020a8063          	beqz	s5,c0007d70 <stride_enqueue+0x108>
c0007d54:	00090593          	mv	a1,s2
c0007d58:	000a8513          	mv	a0,s5
c0007d5c:	c51ff0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0007d60:	00050b93          	mv	s7,a0
c0007d64:	03450463          	beq	a0,s4,c0007d8c <stride_enqueue+0x124>
c0007d68:	0b542423          	sw	s5,168(s0)
c0007d6c:	012aa023          	sw	s2,0(s5) # 1000 <_binary_obj___user_faultread_out_size-0xf68>
c0007d70:	0129a223          	sw	s2,4(s3)
c0007d74:	0169a423          	sw	s6,8(s3)
c0007d78:	01392023          	sw	s3,0(s2)
c0007d7c:	00098913          	mv	s2,s3
c0007d80:	f65ff06f          	j	c0007ce4 <stride_enqueue+0x7c>
c0007d84:	00098913          	mv	s2,s3
c0007d88:	f5dff06f          	j	c0007ce4 <stride_enqueue+0x7c>
c0007d8c:	008aaa03          	lw	s4,8(s5)
c0007d90:	004aac03          	lw	s8,4(s5)
c0007d94:	020a0063          	beqz	s4,c0007db4 <stride_enqueue+0x14c>
c0007d98:	00090593          	mv	a1,s2
c0007d9c:	000a0513          	mv	a0,s4
c0007da0:	c0dff0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0007da4:	00050c93          	mv	s9,a0
c0007da8:	03750063          	beq	a0,s7,c0007dc8 <stride_enqueue+0x160>
c0007dac:	0b442423          	sw	s4,168(s0)
c0007db0:	012a2023          	sw	s2,0(s4)
c0007db4:	012aa223          	sw	s2,4(s5)
c0007db8:	018aa423          	sw	s8,8(s5)
c0007dbc:	01592023          	sw	s5,0(s2)
c0007dc0:	000a8913          	mv	s2,s5
c0007dc4:	fadff06f          	j	c0007d70 <stride_enqueue+0x108>
c0007dc8:	008a2b83          	lw	s7,8(s4)
c0007dcc:	004a2d03          	lw	s10,4(s4)
c0007dd0:	000b8e63          	beqz	s7,c0007dec <stride_enqueue+0x184>
c0007dd4:	00090593          	mv	a1,s2
c0007dd8:	000b8513          	mv	a0,s7
c0007ddc:	bd1ff0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0007de0:	03950063          	beq	a0,s9,c0007e00 <stride_enqueue+0x198>
c0007de4:	0b742423          	sw	s7,168(s0)
c0007de8:	012ba023          	sw	s2,0(s7)
c0007dec:	012a2223          	sw	s2,4(s4)
c0007df0:	01aa2423          	sw	s10,8(s4)
c0007df4:	01492023          	sw	s4,0(s2)
c0007df8:	000a0913          	mv	s2,s4
c0007dfc:	fb9ff06f          	j	c0007db4 <stride_enqueue+0x14c>
c0007e00:	008bac83          	lw	s9,8(s7)
c0007e04:	004bad83          	lw	s11,4(s7)
c0007e08:	020c8a63          	beqz	s9,c0007e3c <stride_enqueue+0x1d4>
c0007e0c:	00090593          	mv	a1,s2
c0007e10:	000c8513          	mv	a0,s9
c0007e14:	b99ff0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0007e18:	fff00793          	li	a5,-1
c0007e1c:	02f50a63          	beq	a0,a5,c0007e50 <stride_enqueue+0x1e8>
c0007e20:	00000593          	li	a1,0
c0007e24:	000c8513          	mv	a0,s9
c0007e28:	c11ff0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c0007e2c:	0aa42423          	sw	a0,168(s0)
c0007e30:	0a042623          	sw	zero,172(s0)
c0007e34:	00050463          	beqz	a0,c0007e3c <stride_enqueue+0x1d4>
c0007e38:	01252023          	sw	s2,0(a0)
c0007e3c:	012ba223          	sw	s2,4(s7)
c0007e40:	01bba423          	sw	s11,8(s7)
c0007e44:	01792023          	sw	s7,0(s2)
c0007e48:	000b8913          	mv	s2,s7
c0007e4c:	fa1ff06f          	j	c0007dec <stride_enqueue+0x184>
c0007e50:	004ca783          	lw	a5,4(s9)
c0007e54:	008ca503          	lw	a0,8(s9)
c0007e58:	00090593          	mv	a1,s2
c0007e5c:	00f12623          	sw	a5,12(sp)
c0007e60:	bd9ff0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c0007e64:	00c12783          	lw	a5,12(sp)
c0007e68:	00aca223          	sw	a0,4(s9)
c0007e6c:	00fca423          	sw	a5,8(s9)
c0007e70:	00050863          	beqz	a0,c0007e80 <stride_enqueue+0x218>
c0007e74:	01952023          	sw	s9,0(a0)
c0007e78:	000c8913          	mv	s2,s9
c0007e7c:	fc1ff06f          	j	c0007e3c <stride_enqueue+0x1d4>
c0007e80:	000c8913          	mv	s2,s9
c0007e84:	fb9ff06f          	j	c0007e3c <stride_enqueue+0x1d4>

c0007e88 <stride_dequeue>:
c0007e88:	f8010113          	addi	sp,sp,-128
c0007e8c:	05712e23          	sw	s7,92(sp)
c0007e90:	0945ab83          	lw	s7,148(a1)
c0007e94:	06112e23          	sw	ra,124(sp)
c0007e98:	06812c23          	sw	s0,120(sp)
c0007e9c:	06912a23          	sw	s1,116(sp)
c0007ea0:	07212823          	sw	s2,112(sp)
c0007ea4:	07312623          	sw	s3,108(sp)
c0007ea8:	07412423          	sw	s4,104(sp)
c0007eac:	07512223          	sw	s5,100(sp)
c0007eb0:	07612023          	sw	s6,96(sp)
c0007eb4:	05812c23          	sw	s8,88(sp)
c0007eb8:	05912a23          	sw	s9,84(sp)
c0007ebc:	05a12823          	sw	s10,80(sp)
c0007ec0:	05b12623          	sw	s11,76(sp)
c0007ec4:	00ab8463          	beq	s7,a0,c0007ecc <stride_dequeue+0x44>
c0007ec8:	7f40206f          	j	c000a6bc <stride_dequeue+0x2834>
c0007ecc:	008ba403          	lw	s0,8(s7)
c0007ed0:	00040c13          	mv	s8,s0
c0007ed4:	00041463          	bnez	s0,c0007edc <stride_dequeue+0x54>
c0007ed8:	7e40206f          	j	c000a6bc <stride_dequeue+0x2834>
c0007edc:	0a85ac83          	lw	s9,168(a1)
c0007ee0:	010ba483          	lw	s1,16(s7)
c0007ee4:	0a458913          	addi	s2,a1,164
c0007ee8:	0a45aa03          	lw	s4,164(a1)
c0007eec:	0ac5a983          	lw	s3,172(a1)
c0007ef0:	6a0c8a63          	beqz	s9,c00085a4 <stride_dequeue+0x71c>
c0007ef4:	26098a63          	beqz	s3,c0008168 <stride_dequeue+0x2e0>
c0007ef8:	00098593          	mv	a1,s3
c0007efc:	000c8513          	mv	a0,s9
c0007f00:	aadff0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0007f04:	fff00a93          	li	s5,-1
c0007f08:	00050b13          	mv	s6,a0
c0007f0c:	47550063          	beq	a0,s5,c000836c <stride_dequeue+0x4e4>
c0007f10:	0049a783          	lw	a5,4(s3)
c0007f14:	0089ad03          	lw	s10,8(s3)
c0007f18:	00f12423          	sw	a5,8(sp)
c0007f1c:	220d0c63          	beqz	s10,c0008154 <stride_dequeue+0x2cc>
c0007f20:	000d0593          	mv	a1,s10
c0007f24:	000c8513          	mv	a0,s9
c0007f28:	a85ff0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0007f2c:	00050b13          	mv	s6,a0
c0007f30:	69550263          	beq	a0,s5,c00085b4 <stride_dequeue+0x72c>
c0007f34:	004d2783          	lw	a5,4(s10)
c0007f38:	008d2b03          	lw	s6,8(s10)
c0007f3c:	00f12623          	sw	a5,12(sp)
c0007f40:	200b0063          	beqz	s6,c0008140 <stride_dequeue+0x2b8>
c0007f44:	000b0593          	mv	a1,s6
c0007f48:	000c8513          	mv	a0,s9
c0007f4c:	a61ff0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0007f50:	27550a63          	beq	a0,s5,c00081c4 <stride_dequeue+0x33c>
c0007f54:	004b2783          	lw	a5,4(s6)
c0007f58:	008b2a83          	lw	s5,8(s6)
c0007f5c:	00f12823          	sw	a5,16(sp)
c0007f60:	1c0a8663          	beqz	s5,c000812c <stride_dequeue+0x2a4>
c0007f64:	000a8593          	mv	a1,s5
c0007f68:	000c8513          	mv	a0,s9
c0007f6c:	a41ff0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0007f70:	fff00793          	li	a5,-1
c0007f74:	00050d93          	mv	s11,a0
c0007f78:	32f50ae3          	beq	a0,a5,c0008aac <stride_dequeue+0xc24>
c0007f7c:	00f12c23          	sw	a5,24(sp)
c0007f80:	004aa783          	lw	a5,4(s5)
c0007f84:	008aad83          	lw	s11,8(s5)
c0007f88:	00f12a23          	sw	a5,20(sp)
c0007f8c:	180d8663          	beqz	s11,c0008118 <stride_dequeue+0x290>
c0007f90:	000d8593          	mv	a1,s11
c0007f94:	000c8513          	mv	a0,s9
c0007f98:	a15ff0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0007f9c:	01812783          	lw	a5,24(sp)
c0007fa0:	00f500e3          	beq	a0,a5,c00087a0 <stride_dequeue+0x918>
c0007fa4:	00f12e23          	sw	a5,28(sp)
c0007fa8:	004da783          	lw	a5,4(s11)
c0007fac:	008dae03          	lw	t3,8(s11)
c0007fb0:	00f12c23          	sw	a5,24(sp)
c0007fb4:	140e0863          	beqz	t3,c0008104 <stride_dequeue+0x27c>
c0007fb8:	000e0593          	mv	a1,t3
c0007fbc:	000c8513          	mv	a0,s9
c0007fc0:	03c12023          	sw	t3,32(sp)
c0007fc4:	9e9ff0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0007fc8:	01c12783          	lw	a5,28(sp)
c0007fcc:	02012e03          	lw	t3,32(sp)
c0007fd0:	00f51463          	bne	a0,a5,c0007fd8 <stride_dequeue+0x150>
c0007fd4:	4780106f          	j	c000944c <stride_dequeue+0x15c4>
c0007fd8:	02f12023          	sw	a5,32(sp)
c0007fdc:	004e2783          	lw	a5,4(t3)
c0007fe0:	008e2403          	lw	s0,8(t3)
c0007fe4:	00f12e23          	sw	a5,28(sp)
c0007fe8:	10040463          	beqz	s0,c00080f0 <stride_dequeue+0x268>
c0007fec:	00040593          	mv	a1,s0
c0007ff0:	000c8513          	mv	a0,s9
c0007ff4:	03c12223          	sw	t3,36(sp)
c0007ff8:	9b5ff0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0007ffc:	02012783          	lw	a5,32(sp)
c0008000:	02412e03          	lw	t3,36(sp)
c0008004:	00f51463          	bne	a0,a5,c000800c <stride_dequeue+0x184>
c0008008:	3ad0106f          	j	c0009bb4 <stride_dequeue+0x1d2c>
c000800c:	02f12223          	sw	a5,36(sp)
c0008010:	00442783          	lw	a5,4(s0)
c0008014:	00842f03          	lw	t5,8(s0)
c0008018:	02f12023          	sw	a5,32(sp)
c000801c:	0c0f0063          	beqz	t5,c00080dc <stride_dequeue+0x254>
c0008020:	000f0593          	mv	a1,t5
c0008024:	000c8513          	mv	a0,s9
c0008028:	03c12623          	sw	t3,44(sp)
c000802c:	03e12423          	sw	t5,40(sp)
c0008030:	97dff0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0008034:	02412783          	lw	a5,36(sp)
c0008038:	02812f03          	lw	t5,40(sp)
c000803c:	02c12e03          	lw	t3,44(sp)
c0008040:	00f51463          	bne	a0,a5,c0008048 <stride_dequeue+0x1c0>
c0008044:	16c0206f          	j	c000a1b0 <stride_dequeue+0x2328>
c0008048:	004f2783          	lw	a5,4(t5)
c000804c:	008f2f83          	lw	t6,8(t5)
c0008050:	02f12223          	sw	a5,36(sp)
c0008054:	060f8a63          	beqz	t6,c00080c8 <stride_dequeue+0x240>
c0008058:	000f8593          	mv	a1,t6
c000805c:	000c8513          	mv	a0,s9
c0008060:	03e12823          	sw	t5,48(sp)
c0008064:	03c12623          	sw	t3,44(sp)
c0008068:	03f12423          	sw	t6,40(sp)
c000806c:	941ff0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0008070:	fff00593          	li	a1,-1
c0008074:	02812f83          	lw	t6,40(sp)
c0008078:	02c12e03          	lw	t3,44(sp)
c000807c:	03012f03          	lw	t5,48(sp)
c0008080:	00b51463          	bne	a0,a1,c0008088 <stride_dequeue+0x200>
c0008084:	5080206f          	j	c000a58c <stride_dequeue+0x2704>
c0008088:	008fa583          	lw	a1,8(t6)
c000808c:	000c8513          	mv	a0,s9
c0008090:	004fac03          	lw	s8,4(t6)
c0008094:	03e12823          	sw	t5,48(sp)
c0008098:	03c12623          	sw	t3,44(sp)
c000809c:	03f12423          	sw	t6,40(sp)
c00080a0:	999ff0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c00080a4:	02812f83          	lw	t6,40(sp)
c00080a8:	02c12e03          	lw	t3,44(sp)
c00080ac:	03012f03          	lw	t5,48(sp)
c00080b0:	018fa423          	sw	s8,8(t6)
c00080b4:	00afa223          	sw	a0,4(t6)
c00080b8:	008bac03          	lw	s8,8(s7)
c00080bc:	00050463          	beqz	a0,c00080c4 <stride_dequeue+0x23c>
c00080c0:	01f52023          	sw	t6,0(a0)
c00080c4:	000f8c93          	mv	s9,t6
c00080c8:	02412783          	lw	a5,36(sp)
c00080cc:	019f2223          	sw	s9,4(t5)
c00080d0:	00ff2423          	sw	a5,8(t5)
c00080d4:	01eca023          	sw	t5,0(s9)
c00080d8:	000f0c93          	mv	s9,t5
c00080dc:	02012783          	lw	a5,32(sp)
c00080e0:	01942223          	sw	s9,4(s0)
c00080e4:	00f42423          	sw	a5,8(s0)
c00080e8:	008ca023          	sw	s0,0(s9)
c00080ec:	00040c93          	mv	s9,s0
c00080f0:	01c12783          	lw	a5,28(sp)
c00080f4:	019e2223          	sw	s9,4(t3)
c00080f8:	00fe2423          	sw	a5,8(t3)
c00080fc:	01cca023          	sw	t3,0(s9)
c0008100:	000e0c93          	mv	s9,t3
c0008104:	01812783          	lw	a5,24(sp)
c0008108:	019da223          	sw	s9,4(s11)
c000810c:	00fda423          	sw	a5,8(s11)
c0008110:	01bca023          	sw	s11,0(s9)
c0008114:	000d8c93          	mv	s9,s11
c0008118:	01412783          	lw	a5,20(sp)
c000811c:	019aa223          	sw	s9,4(s5)
c0008120:	00faa423          	sw	a5,8(s5)
c0008124:	015ca023          	sw	s5,0(s9)
c0008128:	000a8c93          	mv	s9,s5
c000812c:	01012783          	lw	a5,16(sp)
c0008130:	019b2223          	sw	s9,4(s6)
c0008134:	00fb2423          	sw	a5,8(s6)
c0008138:	016ca023          	sw	s6,0(s9)
c000813c:	000b0c93          	mv	s9,s6
c0008140:	00c12783          	lw	a5,12(sp)
c0008144:	019d2223          	sw	s9,4(s10)
c0008148:	00fd2423          	sw	a5,8(s10)
c000814c:	01aca023          	sw	s10,0(s9)
c0008150:	000d0c93          	mv	s9,s10
c0008154:	00812783          	lw	a5,8(sp)
c0008158:	0199a223          	sw	s9,4(s3)
c000815c:	00f9a423          	sw	a5,8(s3)
c0008160:	013ca023          	sw	s3,0(s9)
c0008164:	00098c93          	mv	s9,s3
c0008168:	014ca023          	sw	s4,0(s9)
c000816c:	420a0863          	beqz	s4,c000859c <stride_dequeue+0x714>
c0008170:	004a2703          	lw	a4,4(s4)
c0008174:	62e90263          	beq	s2,a4,c0008798 <stride_dequeue+0x910>
c0008178:	019a2423          	sw	s9,8(s4)
c000817c:	07c12083          	lw	ra,124(sp)
c0008180:	fffc0c13          	addi	s8,s8,-1
c0008184:	009ba823          	sw	s1,16(s7)
c0008188:	018ba423          	sw	s8,8(s7)
c000818c:	07812403          	lw	s0,120(sp)
c0008190:	07412483          	lw	s1,116(sp)
c0008194:	07012903          	lw	s2,112(sp)
c0008198:	06c12983          	lw	s3,108(sp)
c000819c:	06812a03          	lw	s4,104(sp)
c00081a0:	06412a83          	lw	s5,100(sp)
c00081a4:	06012b03          	lw	s6,96(sp)
c00081a8:	05c12b83          	lw	s7,92(sp)
c00081ac:	05812c03          	lw	s8,88(sp)
c00081b0:	05412c83          	lw	s9,84(sp)
c00081b4:	05012d03          	lw	s10,80(sp)
c00081b8:	04c12d83          	lw	s11,76(sp)
c00081bc:	08010113          	addi	sp,sp,128
c00081c0:	00008067          	ret
c00081c4:	004ca783          	lw	a5,4(s9)
c00081c8:	008caa83          	lw	s5,8(s9)
c00081cc:	00f12823          	sw	a5,16(sp)
c00081d0:	180a8463          	beqz	s5,c0008358 <stride_dequeue+0x4d0>
c00081d4:	000b0593          	mv	a1,s6
c00081d8:	000a8513          	mv	a0,s5
c00081dc:	fd0ff0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c00081e0:	fff00713          	li	a4,-1
c00081e4:	00050d93          	mv	s11,a0
c00081e8:	00e51463          	bne	a0,a4,c00081f0 <stride_dequeue+0x368>
c00081ec:	7b90006f          	j	c00091a4 <stride_dequeue+0x131c>
c00081f0:	004b2783          	lw	a5,4(s6)
c00081f4:	008b2d83          	lw	s11,8(s6)
c00081f8:	00e12c23          	sw	a4,24(sp)
c00081fc:	00f12a23          	sw	a5,20(sp)
c0008200:	140d8463          	beqz	s11,c0008348 <stride_dequeue+0x4c0>
c0008204:	000d8593          	mv	a1,s11
c0008208:	000a8513          	mv	a0,s5
c000820c:	fa0ff0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0008210:	01812703          	lw	a4,24(sp)
c0008214:	00e51463          	bne	a0,a4,c000821c <stride_dequeue+0x394>
c0008218:	2a80106f          	j	c00094c0 <stride_dequeue+0x1638>
c000821c:	004da783          	lw	a5,4(s11)
c0008220:	008dae83          	lw	t4,8(s11)
c0008224:	00e12e23          	sw	a4,28(sp)
c0008228:	00f12c23          	sw	a5,24(sp)
c000822c:	100e8463          	beqz	t4,c0008334 <stride_dequeue+0x4ac>
c0008230:	000e8593          	mv	a1,t4
c0008234:	000a8513          	mv	a0,s5
c0008238:	03d12023          	sw	t4,32(sp)
c000823c:	f70ff0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0008240:	01c12703          	lw	a4,28(sp)
c0008244:	02012e83          	lw	t4,32(sp)
c0008248:	00e51463          	bne	a0,a4,c0008250 <stride_dequeue+0x3c8>
c000824c:	3b50106f          	j	c0009e00 <stride_dequeue+0x1f78>
c0008250:	02e12023          	sw	a4,32(sp)
c0008254:	004ea703          	lw	a4,4(t4)
c0008258:	008ea783          	lw	a5,8(t4)
c000825c:	00e12e23          	sw	a4,28(sp)
c0008260:	0c078063          	beqz	a5,c0008320 <stride_dequeue+0x498>
c0008264:	00078593          	mv	a1,a5
c0008268:	000a8513          	mv	a0,s5
c000826c:	03d12423          	sw	t4,40(sp)
c0008270:	02f12223          	sw	a5,36(sp)
c0008274:	f38ff0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0008278:	02012703          	lw	a4,32(sp)
c000827c:	02412783          	lw	a5,36(sp)
c0008280:	02812e83          	lw	t4,40(sp)
c0008284:	00e51463          	bne	a0,a4,c000828c <stride_dequeue+0x404>
c0008288:	0840206f          	j	c000a30c <stride_dequeue+0x2484>
c000828c:	0087af03          	lw	t5,8(a5)
c0008290:	02e12023          	sw	a4,32(sp)
c0008294:	0047ac03          	lw	s8,4(a5)
c0008298:	000f1463          	bnez	t5,c00082a0 <stride_dequeue+0x418>
c000829c:	3380206f          	j	c000a5d4 <stride_dequeue+0x274c>
c00082a0:	000f0593          	mv	a1,t5
c00082a4:	000a8513          	mv	a0,s5
c00082a8:	02f12623          	sw	a5,44(sp)
c00082ac:	03d12423          	sw	t4,40(sp)
c00082b0:	03e12223          	sw	t5,36(sp)
c00082b4:	ef8ff0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c00082b8:	02012703          	lw	a4,32(sp)
c00082bc:	02412f03          	lw	t5,36(sp)
c00082c0:	02812e83          	lw	t4,40(sp)
c00082c4:	02c12783          	lw	a5,44(sp)
c00082c8:	00e51463          	bne	a0,a4,c00082d0 <stride_dequeue+0x448>
c00082cc:	54c0206f          	j	c000a818 <stride_dequeue+0x2990>
c00082d0:	008f2583          	lw	a1,8(t5)
c00082d4:	000a8513          	mv	a0,s5
c00082d8:	004f2403          	lw	s0,4(t5)
c00082dc:	02f12423          	sw	a5,40(sp)
c00082e0:	03d12223          	sw	t4,36(sp)
c00082e4:	03e12023          	sw	t5,32(sp)
c00082e8:	f50ff0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c00082ec:	02012f03          	lw	t5,32(sp)
c00082f0:	02412e83          	lw	t4,36(sp)
c00082f4:	02812783          	lw	a5,40(sp)
c00082f8:	00af2223          	sw	a0,4(t5)
c00082fc:	008f2423          	sw	s0,8(t5)
c0008300:	00050463          	beqz	a0,c0008308 <stride_dequeue+0x480>
c0008304:	01e52023          	sw	t5,0(a0)
c0008308:	008ba403          	lw	s0,8(s7)
c000830c:	0187a423          	sw	s8,8(a5)
c0008310:	01e7a223          	sw	t5,4(a5)
c0008314:	00ff2023          	sw	a5,0(t5)
c0008318:	00040c13          	mv	s8,s0
c000831c:	00078a93          	mv	s5,a5
c0008320:	01c12783          	lw	a5,28(sp)
c0008324:	015ea223          	sw	s5,4(t4)
c0008328:	00fea423          	sw	a5,8(t4)
c000832c:	01daa023          	sw	t4,0(s5)
c0008330:	000e8a93          	mv	s5,t4
c0008334:	01812783          	lw	a5,24(sp)
c0008338:	015da223          	sw	s5,4(s11)
c000833c:	00fda423          	sw	a5,8(s11)
c0008340:	01baa023          	sw	s11,0(s5)
c0008344:	000d8a93          	mv	s5,s11
c0008348:	01412783          	lw	a5,20(sp)
c000834c:	015b2223          	sw	s5,4(s6)
c0008350:	00fb2423          	sw	a5,8(s6)
c0008354:	016aa023          	sw	s6,0(s5)
c0008358:	01012783          	lw	a5,16(sp)
c000835c:	016ca223          	sw	s6,4(s9)
c0008360:	00fca423          	sw	a5,8(s9)
c0008364:	019b2023          	sw	s9,0(s6)
c0008368:	dd9ff06f          	j	c0008140 <stride_dequeue+0x2b8>
c000836c:	004ca783          	lw	a5,4(s9)
c0008370:	008cad03          	lw	s10,8(s9)
c0008374:	00f12423          	sw	a5,8(sp)
c0008378:	200d0663          	beqz	s10,c0008584 <stride_dequeue+0x6fc>
c000837c:	00098593          	mv	a1,s3
c0008380:	000d0513          	mv	a0,s10
c0008384:	e28ff0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0008388:	00050a93          	mv	s5,a0
c000838c:	59650663          	beq	a0,s6,c0008918 <stride_dequeue+0xa90>
c0008390:	0089ad83          	lw	s11,8(s3)
c0008394:	0049aa83          	lw	s5,4(s3)
c0008398:	1e0d8063          	beqz	s11,c0008578 <stride_dequeue+0x6f0>
c000839c:	000d8593          	mv	a1,s11
c00083a0:	000d0513          	mv	a0,s10
c00083a4:	e08ff0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c00083a8:	076504e3          	beq	a0,s6,c0008c10 <stride_dequeue+0xd88>
c00083ac:	004da783          	lw	a5,4(s11)
c00083b0:	008dab03          	lw	s6,8(s11)
c00083b4:	00f12623          	sw	a5,12(sp)
c00083b8:	1a0b0663          	beqz	s6,c0008564 <stride_dequeue+0x6dc>
c00083bc:	000b0593          	mv	a1,s6
c00083c0:	000d0513          	mv	a0,s10
c00083c4:	de8ff0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c00083c8:	fff00313          	li	t1,-1
c00083cc:	306500e3          	beq	a0,t1,c0008ecc <stride_dequeue+0x1044>
c00083d0:	004b2783          	lw	a5,4(s6)
c00083d4:	008b2883          	lw	a7,8(s6)
c00083d8:	00612a23          	sw	t1,20(sp)
c00083dc:	00f12823          	sw	a5,16(sp)
c00083e0:	16088863          	beqz	a7,c0008550 <stride_dequeue+0x6c8>
c00083e4:	00088593          	mv	a1,a7
c00083e8:	000d0513          	mv	a0,s10
c00083ec:	01112c23          	sw	a7,24(sp)
c00083f0:	dbcff0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c00083f4:	01412303          	lw	t1,20(sp)
c00083f8:	01812883          	lw	a7,24(sp)
c00083fc:	00651463          	bne	a0,t1,c0008404 <stride_dequeue+0x57c>
c0008400:	4400106f          	j	c0009840 <stride_dequeue+0x19b8>
c0008404:	0048a783          	lw	a5,4(a7)
c0008408:	0088ae03          	lw	t3,8(a7)
c000840c:	00612c23          	sw	t1,24(sp)
c0008410:	00f12a23          	sw	a5,20(sp)
c0008414:	120e0463          	beqz	t3,c000853c <stride_dequeue+0x6b4>
c0008418:	000e0593          	mv	a1,t3
c000841c:	000d0513          	mv	a0,s10
c0008420:	03112023          	sw	a7,32(sp)
c0008424:	01c12e23          	sw	t3,28(sp)
c0008428:	d84ff0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c000842c:	01812303          	lw	t1,24(sp)
c0008430:	01c12e03          	lw	t3,28(sp)
c0008434:	02012883          	lw	a7,32(sp)
c0008438:	00651463          	bne	a0,t1,c0008440 <stride_dequeue+0x5b8>
c000843c:	3750106f          	j	c0009fb0 <stride_dequeue+0x2128>
c0008440:	004e2783          	lw	a5,4(t3)
c0008444:	008e2e83          	lw	t4,8(t3)
c0008448:	00612e23          	sw	t1,28(sp)
c000844c:	00f12c23          	sw	a5,24(sp)
c0008450:	0c0e8c63          	beqz	t4,c0008528 <stride_dequeue+0x6a0>
c0008454:	000e8593          	mv	a1,t4
c0008458:	000d0513          	mv	a0,s10
c000845c:	03c12423          	sw	t3,40(sp)
c0008460:	03112223          	sw	a7,36(sp)
c0008464:	03d12023          	sw	t4,32(sp)
c0008468:	d44ff0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c000846c:	01c12303          	lw	t1,28(sp)
c0008470:	02012e83          	lw	t4,32(sp)
c0008474:	02412883          	lw	a7,36(sp)
c0008478:	02812e03          	lw	t3,40(sp)
c000847c:	00651463          	bne	a0,t1,c0008484 <stride_dequeue+0x5fc>
c0008480:	6bd0106f          	j	c000a33c <stride_dequeue+0x24b4>
c0008484:	008eaf03          	lw	t5,8(t4)
c0008488:	00612e23          	sw	t1,28(sp)
c000848c:	004eac03          	lw	s8,4(t4)
c0008490:	000f1463          	bnez	t5,c0008498 <stride_dequeue+0x610>
c0008494:	14c0206f          	j	c000a5e0 <stride_dequeue+0x2758>
c0008498:	000f0593          	mv	a1,t5
c000849c:	000d0513          	mv	a0,s10
c00084a0:	03d12623          	sw	t4,44(sp)
c00084a4:	03c12423          	sw	t3,40(sp)
c00084a8:	03112223          	sw	a7,36(sp)
c00084ac:	03e12023          	sw	t5,32(sp)
c00084b0:	cfcff0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c00084b4:	01c12303          	lw	t1,28(sp)
c00084b8:	02012f03          	lw	t5,32(sp)
c00084bc:	02412883          	lw	a7,36(sp)
c00084c0:	02812e03          	lw	t3,40(sp)
c00084c4:	02c12e83          	lw	t4,44(sp)
c00084c8:	00651463          	bne	a0,t1,c00084d0 <stride_dequeue+0x648>
c00084cc:	2a80206f          	j	c000a774 <stride_dequeue+0x28ec>
c00084d0:	008f2583          	lw	a1,8(t5)
c00084d4:	000d0513          	mv	a0,s10
c00084d8:	004f2403          	lw	s0,4(t5)
c00084dc:	03d12423          	sw	t4,40(sp)
c00084e0:	03c12223          	sw	t3,36(sp)
c00084e4:	03112023          	sw	a7,32(sp)
c00084e8:	01e12e23          	sw	t5,28(sp)
c00084ec:	d4cff0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c00084f0:	01c12f03          	lw	t5,28(sp)
c00084f4:	02012883          	lw	a7,32(sp)
c00084f8:	02412e03          	lw	t3,36(sp)
c00084fc:	00af2223          	sw	a0,4(t5)
c0008500:	008f2423          	sw	s0,8(t5)
c0008504:	02812e83          	lw	t4,40(sp)
c0008508:	00050463          	beqz	a0,c0008510 <stride_dequeue+0x688>
c000850c:	01e52023          	sw	t5,0(a0)
c0008510:	008ba403          	lw	s0,8(s7)
c0008514:	018ea423          	sw	s8,8(t4)
c0008518:	01eea223          	sw	t5,4(t4)
c000851c:	01df2023          	sw	t4,0(t5)
c0008520:	00040c13          	mv	s8,s0
c0008524:	000e8d13          	mv	s10,t4
c0008528:	01812783          	lw	a5,24(sp)
c000852c:	01ae2223          	sw	s10,4(t3)
c0008530:	00fe2423          	sw	a5,8(t3)
c0008534:	01cd2023          	sw	t3,0(s10)
c0008538:	000e0d13          	mv	s10,t3
c000853c:	01412783          	lw	a5,20(sp)
c0008540:	01a8a223          	sw	s10,4(a7)
c0008544:	00f8a423          	sw	a5,8(a7)
c0008548:	011d2023          	sw	a7,0(s10)
c000854c:	00088d13          	mv	s10,a7
c0008550:	01012783          	lw	a5,16(sp)
c0008554:	01ab2223          	sw	s10,4(s6)
c0008558:	00fb2423          	sw	a5,8(s6)
c000855c:	016d2023          	sw	s6,0(s10)
c0008560:	000b0d13          	mv	s10,s6
c0008564:	00c12783          	lw	a5,12(sp)
c0008568:	01ada223          	sw	s10,4(s11)
c000856c:	00fda423          	sw	a5,8(s11)
c0008570:	01bd2023          	sw	s11,0(s10)
c0008574:	000d8d13          	mv	s10,s11
c0008578:	01a9a223          	sw	s10,4(s3)
c000857c:	0159a423          	sw	s5,8(s3)
c0008580:	013d2023          	sw	s3,0(s10)
c0008584:	00812783          	lw	a5,8(sp)
c0008588:	013ca223          	sw	s3,4(s9)
c000858c:	00fca423          	sw	a5,8(s9)
c0008590:	0199a023          	sw	s9,0(s3)
c0008594:	014ca023          	sw	s4,0(s9)
c0008598:	bd5ff06f          	j	c000816c <stride_dequeue+0x2e4>
c000859c:	000c8493          	mv	s1,s9
c00085a0:	bddff06f          	j	c000817c <stride_dequeue+0x2f4>
c00085a4:	bc0984e3          	beqz	s3,c000816c <stride_dequeue+0x2e4>
c00085a8:	00098c93          	mv	s9,s3
c00085ac:	014ca023          	sw	s4,0(s9)
c00085b0:	bbdff06f          	j	c000816c <stride_dequeue+0x2e4>
c00085b4:	004ca783          	lw	a5,4(s9)
c00085b8:	008caa83          	lw	s5,8(s9)
c00085bc:	00f12623          	sw	a5,12(sp)
c00085c0:	1c0a8263          	beqz	s5,c0008784 <stride_dequeue+0x8fc>
c00085c4:	000d0593          	mv	a1,s10
c00085c8:	000a8513          	mv	a0,s5
c00085cc:	be0ff0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c00085d0:	7b650063          	beq	a0,s6,c0008d70 <stride_dequeue+0xee8>
c00085d4:	004d2783          	lw	a5,4(s10)
c00085d8:	008d2b03          	lw	s6,8(s10)
c00085dc:	00f12823          	sw	a5,16(sp)
c00085e0:	180b0a63          	beqz	s6,c0008774 <stride_dequeue+0x8ec>
c00085e4:	000b0593          	mv	a1,s6
c00085e8:	000a8513          	mv	a0,s5
c00085ec:	bc0ff0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c00085f0:	fff00793          	li	a5,-1
c00085f4:	00050d93          	mv	s11,a0
c00085f8:	24f508e3          	beq	a0,a5,c0009048 <stride_dequeue+0x11c0>
c00085fc:	00f12c23          	sw	a5,24(sp)
c0008600:	004b2783          	lw	a5,4(s6)
c0008604:	008b2e03          	lw	t3,8(s6)
c0008608:	00f12a23          	sw	a5,20(sp)
c000860c:	140e0a63          	beqz	t3,c0008760 <stride_dequeue+0x8d8>
c0008610:	000e0593          	mv	a1,t3
c0008614:	000a8513          	mv	a0,s5
c0008618:	01c12e23          	sw	t3,28(sp)
c000861c:	b90ff0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0008620:	01812783          	lw	a5,24(sp)
c0008624:	00050d93          	mv	s11,a0
c0008628:	01c12e03          	lw	t3,28(sp)
c000862c:	00f51463          	bne	a0,a5,c0008634 <stride_dequeue+0x7ac>
c0008630:	0540106f          	j	c0009684 <stride_dequeue+0x17fc>
c0008634:	00f12e23          	sw	a5,28(sp)
c0008638:	004e2783          	lw	a5,4(t3)
c000863c:	008e2d83          	lw	s11,8(t3)
c0008640:	00f12c23          	sw	a5,24(sp)
c0008644:	100d8463          	beqz	s11,c000874c <stride_dequeue+0x8c4>
c0008648:	000d8593          	mv	a1,s11
c000864c:	000a8513          	mv	a0,s5
c0008650:	03c12023          	sw	t3,32(sp)
c0008654:	b58ff0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0008658:	01c12783          	lw	a5,28(sp)
c000865c:	02012e03          	lw	t3,32(sp)
c0008660:	00f51463          	bne	a0,a5,c0008668 <stride_dequeue+0x7e0>
c0008664:	11d0106f          	j	c0009f80 <stride_dequeue+0x20f8>
c0008668:	02f12023          	sw	a5,32(sp)
c000866c:	004da783          	lw	a5,4(s11)
c0008670:	008dae83          	lw	t4,8(s11)
c0008674:	00f12e23          	sw	a5,28(sp)
c0008678:	0c0e8063          	beqz	t4,c0008738 <stride_dequeue+0x8b0>
c000867c:	000e8593          	mv	a1,t4
c0008680:	000a8513          	mv	a0,s5
c0008684:	03c12423          	sw	t3,40(sp)
c0008688:	03d12223          	sw	t4,36(sp)
c000868c:	b20ff0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0008690:	02012783          	lw	a5,32(sp)
c0008694:	02412e83          	lw	t4,36(sp)
c0008698:	02812e03          	lw	t3,40(sp)
c000869c:	00f51463          	bne	a0,a5,c00086a4 <stride_dequeue+0x81c>
c00086a0:	43d0106f          	j	c000a2dc <stride_dequeue+0x2454>
c00086a4:	008eaf03          	lw	t5,8(t4)
c00086a8:	02f12023          	sw	a5,32(sp)
c00086ac:	004eac03          	lw	s8,4(t4)
c00086b0:	000f1463          	bnez	t5,c00086b8 <stride_dequeue+0x830>
c00086b4:	77d0106f          	j	c000a630 <stride_dequeue+0x27a8>
c00086b8:	000f0593          	mv	a1,t5
c00086bc:	000a8513          	mv	a0,s5
c00086c0:	03d12623          	sw	t4,44(sp)
c00086c4:	03c12423          	sw	t3,40(sp)
c00086c8:	03e12223          	sw	t5,36(sp)
c00086cc:	ae0ff0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c00086d0:	02012783          	lw	a5,32(sp)
c00086d4:	02412f03          	lw	t5,36(sp)
c00086d8:	02812e03          	lw	t3,40(sp)
c00086dc:	02c12e83          	lw	t4,44(sp)
c00086e0:	00f51463          	bne	a0,a5,c00086e8 <stride_dequeue+0x860>
c00086e4:	01c0206f          	j	c000a700 <stride_dequeue+0x2878>
c00086e8:	008f2583          	lw	a1,8(t5)
c00086ec:	000a8513          	mv	a0,s5
c00086f0:	004f2403          	lw	s0,4(t5)
c00086f4:	03d12423          	sw	t4,40(sp)
c00086f8:	03c12223          	sw	t3,36(sp)
c00086fc:	03e12023          	sw	t5,32(sp)
c0008700:	b38ff0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c0008704:	02012f03          	lw	t5,32(sp)
c0008708:	02412e03          	lw	t3,36(sp)
c000870c:	02812e83          	lw	t4,40(sp)
c0008710:	00af2223          	sw	a0,4(t5)
c0008714:	008f2423          	sw	s0,8(t5)
c0008718:	00050463          	beqz	a0,c0008720 <stride_dequeue+0x898>
c000871c:	01e52023          	sw	t5,0(a0)
c0008720:	008ba403          	lw	s0,8(s7)
c0008724:	018ea423          	sw	s8,8(t4)
c0008728:	01eea223          	sw	t5,4(t4)
c000872c:	01df2023          	sw	t4,0(t5)
c0008730:	00040c13          	mv	s8,s0
c0008734:	000e8a93          	mv	s5,t4
c0008738:	01c12783          	lw	a5,28(sp)
c000873c:	015da223          	sw	s5,4(s11)
c0008740:	00fda423          	sw	a5,8(s11)
c0008744:	01baa023          	sw	s11,0(s5)
c0008748:	000d8a93          	mv	s5,s11
c000874c:	01812783          	lw	a5,24(sp)
c0008750:	015e2223          	sw	s5,4(t3)
c0008754:	00fe2423          	sw	a5,8(t3)
c0008758:	01caa023          	sw	t3,0(s5)
c000875c:	000e0a93          	mv	s5,t3
c0008760:	01412783          	lw	a5,20(sp)
c0008764:	015b2223          	sw	s5,4(s6)
c0008768:	00fb2423          	sw	a5,8(s6)
c000876c:	016aa023          	sw	s6,0(s5)
c0008770:	000b0a93          	mv	s5,s6
c0008774:	01012783          	lw	a5,16(sp)
c0008778:	015d2223          	sw	s5,4(s10)
c000877c:	00fd2423          	sw	a5,8(s10)
c0008780:	01aaa023          	sw	s10,0(s5)
c0008784:	00c12783          	lw	a5,12(sp)
c0008788:	01aca223          	sw	s10,4(s9)
c000878c:	00fca423          	sw	a5,8(s9)
c0008790:	019d2023          	sw	s9,0(s10)
c0008794:	9c1ff06f          	j	c0008154 <stride_dequeue+0x2cc>
c0008798:	019a2223          	sw	s9,4(s4)
c000879c:	9e1ff06f          	j	c000817c <stride_dequeue+0x2f4>
c00087a0:	004ca783          	lw	a5,4(s9)
c00087a4:	008cae83          	lw	t4,8(s9)
c00087a8:	00a12e23          	sw	a0,28(sp)
c00087ac:	00f12c23          	sw	a5,24(sp)
c00087b0:	140e8a63          	beqz	t4,c0008904 <stride_dequeue+0xa7c>
c00087b4:	000e8513          	mv	a0,t4
c00087b8:	000d8593          	mv	a1,s11
c00087bc:	03d12023          	sw	t4,32(sp)
c00087c0:	9ecff0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c00087c4:	01c12e03          	lw	t3,28(sp)
c00087c8:	02012e83          	lw	t4,32(sp)
c00087cc:	01c51463          	bne	a0,t3,c00087d4 <stride_dequeue+0x94c>
c00087d0:	4140106f          	j	c0009be4 <stride_dequeue+0x1d5c>
c00087d4:	004da783          	lw	a5,4(s11)
c00087d8:	008daf03          	lw	t5,8(s11)
c00087dc:	03c12023          	sw	t3,32(sp)
c00087e0:	00f12e23          	sw	a5,28(sp)
c00087e4:	100f0863          	beqz	t5,c00088f4 <stride_dequeue+0xa6c>
c00087e8:	000f0593          	mv	a1,t5
c00087ec:	000e8513          	mv	a0,t4
c00087f0:	03e12423          	sw	t5,40(sp)
c00087f4:	03d12223          	sw	t4,36(sp)
c00087f8:	9b4ff0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c00087fc:	02012e03          	lw	t3,32(sp)
c0008800:	02412e83          	lw	t4,36(sp)
c0008804:	02812f03          	lw	t5,40(sp)
c0008808:	01c51463          	bne	a0,t3,c0008810 <stride_dequeue+0x988>
c000880c:	26d0106f          	j	c000a278 <stride_dequeue+0x23f0>
c0008810:	004f2783          	lw	a5,4(t5)
c0008814:	008f2c03          	lw	s8,8(t5)
c0008818:	03c12223          	sw	t3,36(sp)
c000881c:	02f12023          	sw	a5,32(sp)
c0008820:	000c1463          	bnez	s8,c0008828 <stride_dequeue+0x9a0>
c0008824:	5f50106f          	j	c000a618 <stride_dequeue+0x2790>
c0008828:	000e8513          	mv	a0,t4
c000882c:	000c0593          	mv	a1,s8
c0008830:	03e12623          	sw	t5,44(sp)
c0008834:	03d12423          	sw	t4,40(sp)
c0008838:	974ff0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c000883c:	02412e03          	lw	t3,36(sp)
c0008840:	02812e83          	lw	t4,40(sp)
c0008844:	02c12f03          	lw	t5,44(sp)
c0008848:	01c51463          	bne	a0,t3,c0008850 <stride_dequeue+0x9c8>
c000884c:	7910106f          	j	c000a7dc <stride_dequeue+0x2954>
c0008850:	004c2783          	lw	a5,4(s8)
c0008854:	008c2e03          	lw	t3,8(s8)
c0008858:	02f12223          	sw	a5,36(sp)
c000885c:	060e0863          	beqz	t3,c00088cc <stride_dequeue+0xa44>
c0008860:	000e0593          	mv	a1,t3
c0008864:	000e8513          	mv	a0,t4
c0008868:	03e12823          	sw	t5,48(sp)
c000886c:	03c12623          	sw	t3,44(sp)
c0008870:	03d12423          	sw	t4,40(sp)
c0008874:	938ff0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0008878:	03012f03          	lw	t5,48(sp)
c000887c:	02c12e03          	lw	t3,44(sp)
c0008880:	fff00593          	li	a1,-1
c0008884:	03e12623          	sw	t5,44(sp)
c0008888:	02812e83          	lw	t4,40(sp)
c000888c:	00b51463          	bne	a0,a1,c0008894 <stride_dequeue+0xa0c>
c0008890:	50c0206f          	j	c000ad9c <stride_dequeue+0x2f14>
c0008894:	008e2583          	lw	a1,8(t3)
c0008898:	000e8513          	mv	a0,t4
c000889c:	004e2403          	lw	s0,4(t3)
c00088a0:	03c12423          	sw	t3,40(sp)
c00088a4:	994ff0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c00088a8:	02812e03          	lw	t3,40(sp)
c00088ac:	02c12f03          	lw	t5,44(sp)
c00088b0:	00ae2223          	sw	a0,4(t3)
c00088b4:	008e2423          	sw	s0,8(t3)
c00088b8:	00051463          	bnez	a0,c00088c0 <stride_dequeue+0xa38>
c00088bc:	0b90206f          	j	c000b174 <stride_dequeue+0x32ec>
c00088c0:	008ba403          	lw	s0,8(s7)
c00088c4:	01c52023          	sw	t3,0(a0)
c00088c8:	000e0e93          	mv	t4,t3
c00088cc:	02412783          	lw	a5,36(sp)
c00088d0:	01dc2223          	sw	t4,4(s8)
c00088d4:	00fc2423          	sw	a5,8(s8)
c00088d8:	018ea023          	sw	s8,0(t4)
c00088dc:	02012783          	lw	a5,32(sp)
c00088e0:	018f2223          	sw	s8,4(t5)
c00088e4:	000f0e93          	mv	t4,t5
c00088e8:	00ff2423          	sw	a5,8(t5)
c00088ec:	01ec2023          	sw	t5,0(s8)
c00088f0:	00040c13          	mv	s8,s0
c00088f4:	01c12783          	lw	a5,28(sp)
c00088f8:	01dda223          	sw	t4,4(s11)
c00088fc:	00fda423          	sw	a5,8(s11)
c0008900:	01bea023          	sw	s11,0(t4)
c0008904:	01812783          	lw	a5,24(sp)
c0008908:	01bca223          	sw	s11,4(s9)
c000890c:	00fca423          	sw	a5,8(s9)
c0008910:	019da023          	sw	s9,0(s11)
c0008914:	805ff06f          	j	c0008118 <stride_dequeue+0x290>
c0008918:	004d2783          	lw	a5,4(s10)
c000891c:	008d2b03          	lw	s6,8(s10)
c0008920:	00f12623          	sw	a5,12(sp)
c0008924:	160b0863          	beqz	s6,c0008a94 <stride_dequeue+0xc0c>
c0008928:	00098593          	mv	a1,s3
c000892c:	000b0513          	mv	a0,s6
c0008930:	87cff0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0008934:	1d5506e3          	beq	a0,s5,c0009300 <stride_dequeue+0x1478>
c0008938:	0089ad83          	lw	s11,8(s3)
c000893c:	0049aa83          	lw	s5,4(s3)
c0008940:	140d8463          	beqz	s11,c0008a88 <stride_dequeue+0xc00>
c0008944:	000d8593          	mv	a1,s11
c0008948:	000b0513          	mv	a0,s6
c000894c:	860ff0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0008950:	fff00313          	li	t1,-1
c0008954:	00651463          	bne	a0,t1,c000895c <stride_dequeue+0xad4>
c0008958:	1f80106f          	j	c0009b50 <stride_dequeue+0x1cc8>
c000895c:	004da783          	lw	a5,4(s11)
c0008960:	008da803          	lw	a6,8(s11)
c0008964:	00612a23          	sw	t1,20(sp)
c0008968:	00f12823          	sw	a5,16(sp)
c000896c:	10080463          	beqz	a6,c0008a74 <stride_dequeue+0xbec>
c0008970:	00080593          	mv	a1,a6
c0008974:	000b0513          	mv	a0,s6
c0008978:	01012c23          	sw	a6,24(sp)
c000897c:	830ff0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0008980:	01412303          	lw	t1,20(sp)
c0008984:	01812803          	lw	a6,24(sp)
c0008988:	00651463          	bne	a0,t1,c0008990 <stride_dequeue+0xb08>
c000898c:	6540106f          	j	c0009fe0 <stride_dequeue+0x2158>
c0008990:	00482783          	lw	a5,4(a6)
c0008994:	00882883          	lw	a7,8(a6)
c0008998:	00612c23          	sw	t1,24(sp)
c000899c:	00f12a23          	sw	a5,20(sp)
c00089a0:	00089463          	bnez	a7,c00089a8 <stride_dequeue+0xb20>
c00089a4:	1d10106f          	j	c000a374 <stride_dequeue+0x24ec>
c00089a8:	00088593          	mv	a1,a7
c00089ac:	000b0513          	mv	a0,s6
c00089b0:	03012023          	sw	a6,32(sp)
c00089b4:	01112e23          	sw	a7,28(sp)
c00089b8:	ff5fe0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c00089bc:	01812303          	lw	t1,24(sp)
c00089c0:	01c12883          	lw	a7,28(sp)
c00089c4:	02012803          	lw	a6,32(sp)
c00089c8:	00651463          	bne	a0,t1,c00089d0 <stride_dequeue+0xb48>
c00089cc:	20d0106f          	j	c000a3d8 <stride_dequeue+0x2550>
c00089d0:	0088ae03          	lw	t3,8(a7)
c00089d4:	00612c23          	sw	t1,24(sp)
c00089d8:	0048ac03          	lw	s8,4(a7)
c00089dc:	000e1463          	bnez	t3,c00089e4 <stride_dequeue+0xb5c>
c00089e0:	50d0106f          	j	c000a6ec <stride_dequeue+0x2864>
c00089e4:	000e0593          	mv	a1,t3
c00089e8:	000b0513          	mv	a0,s6
c00089ec:	03112223          	sw	a7,36(sp)
c00089f0:	03012023          	sw	a6,32(sp)
c00089f4:	01c12e23          	sw	t3,28(sp)
c00089f8:	fb5fe0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c00089fc:	01812303          	lw	t1,24(sp)
c0008a00:	01c12e03          	lw	t3,28(sp)
c0008a04:	02012803          	lw	a6,32(sp)
c0008a08:	02412883          	lw	a7,36(sp)
c0008a0c:	00651463          	bne	a0,t1,c0008a14 <stride_dequeue+0xb8c>
c0008a10:	6d90106f          	j	c000a8e8 <stride_dequeue+0x2a60>
c0008a14:	008e2583          	lw	a1,8(t3)
c0008a18:	000b0513          	mv	a0,s6
c0008a1c:	004e2403          	lw	s0,4(t3)
c0008a20:	03112023          	sw	a7,32(sp)
c0008a24:	01012e23          	sw	a6,28(sp)
c0008a28:	01c12c23          	sw	t3,24(sp)
c0008a2c:	80cff0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c0008a30:	01812e03          	lw	t3,24(sp)
c0008a34:	01c12803          	lw	a6,28(sp)
c0008a38:	02012883          	lw	a7,32(sp)
c0008a3c:	00ae2223          	sw	a0,4(t3)
c0008a40:	008e2423          	sw	s0,8(t3)
c0008a44:	00050463          	beqz	a0,c0008a4c <stride_dequeue+0xbc4>
c0008a48:	01c52023          	sw	t3,0(a0)
c0008a4c:	008ba403          	lw	s0,8(s7)
c0008a50:	0188a423          	sw	s8,8(a7)
c0008a54:	01c8a223          	sw	t3,4(a7)
c0008a58:	011e2023          	sw	a7,0(t3)
c0008a5c:	00040c13          	mv	s8,s0
c0008a60:	01412783          	lw	a5,20(sp)
c0008a64:	01182223          	sw	a7,4(a6)
c0008a68:	00080b13          	mv	s6,a6
c0008a6c:	00f82423          	sw	a5,8(a6)
c0008a70:	0108a023          	sw	a6,0(a7)
c0008a74:	01012783          	lw	a5,16(sp)
c0008a78:	016da223          	sw	s6,4(s11)
c0008a7c:	00fda423          	sw	a5,8(s11)
c0008a80:	01bb2023          	sw	s11,0(s6)
c0008a84:	000d8b13          	mv	s6,s11
c0008a88:	0169a223          	sw	s6,4(s3)
c0008a8c:	0159a423          	sw	s5,8(s3)
c0008a90:	013b2023          	sw	s3,0(s6)
c0008a94:	00c12783          	lw	a5,12(sp)
c0008a98:	013d2223          	sw	s3,4(s10)
c0008a9c:	00fd2423          	sw	a5,8(s10)
c0008aa0:	01a9a023          	sw	s10,0(s3)
c0008aa4:	000d0993          	mv	s3,s10
c0008aa8:	addff06f          	j	c0008584 <stride_dequeue+0x6fc>
c0008aac:	004ca783          	lw	a5,4(s9)
c0008ab0:	008cae03          	lw	t3,8(s9)
c0008ab4:	00f12a23          	sw	a5,20(sp)
c0008ab8:	140e0263          	beqz	t3,c0008bfc <stride_dequeue+0xd74>
c0008abc:	000e0513          	mv	a0,t3
c0008ac0:	000a8593          	mv	a1,s5
c0008ac4:	01c12c23          	sw	t3,24(sp)
c0008ac8:	ee5fe0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0008acc:	01812e03          	lw	t3,24(sp)
c0008ad0:	5fb502e3          	beq	a0,s11,c00098b4 <stride_dequeue+0x1a2c>
c0008ad4:	004aa783          	lw	a5,4(s5)
c0008ad8:	008aae83          	lw	t4,8(s5)
c0008adc:	00f12c23          	sw	a5,24(sp)
c0008ae0:	100e8663          	beqz	t4,c0008bec <stride_dequeue+0xd64>
c0008ae4:	000e8593          	mv	a1,t4
c0008ae8:	000e0513          	mv	a0,t3
c0008aec:	03d12023          	sw	t4,32(sp)
c0008af0:	01c12e23          	sw	t3,28(sp)
c0008af4:	eb9fe0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0008af8:	01c12e03          	lw	t3,28(sp)
c0008afc:	02012e83          	lw	t4,32(sp)
c0008b00:	01b51463          	bne	a0,s11,c0008b08 <stride_dequeue+0xc80>
c0008b04:	15c0106f          	j	c0009c60 <stride_dequeue+0x1dd8>
c0008b08:	004ea703          	lw	a4,4(t4)
c0008b0c:	008ea783          	lw	a5,8(t4)
c0008b10:	00e12e23          	sw	a4,28(sp)
c0008b14:	0c078263          	beqz	a5,c0008bd8 <stride_dequeue+0xd50>
c0008b18:	00078593          	mv	a1,a5
c0008b1c:	000e0513          	mv	a0,t3
c0008b20:	03d12423          	sw	t4,40(sp)
c0008b24:	02f12223          	sw	a5,36(sp)
c0008b28:	03c12023          	sw	t3,32(sp)
c0008b2c:	e81fe0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0008b30:	02012e03          	lw	t3,32(sp)
c0008b34:	02412783          	lw	a5,36(sp)
c0008b38:	02812e83          	lw	t4,40(sp)
c0008b3c:	01b51463          	bne	a0,s11,c0008b44 <stride_dequeue+0xcbc>
c0008b40:	7680106f          	j	c000a2a8 <stride_dequeue+0x2420>
c0008b44:	0087af03          	lw	t5,8(a5)
c0008b48:	0047ac03          	lw	s8,4(a5)
c0008b4c:	000f1463          	bnez	t5,c0008b54 <stride_dequeue+0xccc>
c0008b50:	2d50106f          	j	c000a624 <stride_dequeue+0x279c>
c0008b54:	000f0593          	mv	a1,t5
c0008b58:	000e0513          	mv	a0,t3
c0008b5c:	02f12623          	sw	a5,44(sp)
c0008b60:	03d12423          	sw	t4,40(sp)
c0008b64:	03e12223          	sw	t5,36(sp)
c0008b68:	03c12023          	sw	t3,32(sp)
c0008b6c:	e41fe0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0008b70:	02812e83          	lw	t4,40(sp)
c0008b74:	02c12783          	lw	a5,44(sp)
c0008b78:	02412f03          	lw	t5,36(sp)
c0008b7c:	03d12223          	sw	t4,36(sp)
c0008b80:	02f12423          	sw	a5,40(sp)
c0008b84:	02012e03          	lw	t3,32(sp)
c0008b88:	01b51463          	bne	a0,s11,c0008b90 <stride_dequeue+0xd08>
c0008b8c:	3b10106f          	j	c000a73c <stride_dequeue+0x28b4>
c0008b90:	008f2583          	lw	a1,8(t5)
c0008b94:	000e0513          	mv	a0,t3
c0008b98:	004f2403          	lw	s0,4(t5)
c0008b9c:	03e12023          	sw	t5,32(sp)
c0008ba0:	e99fe0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c0008ba4:	02012f03          	lw	t5,32(sp)
c0008ba8:	02412e83          	lw	t4,36(sp)
c0008bac:	02812783          	lw	a5,40(sp)
c0008bb0:	00af2223          	sw	a0,4(t5)
c0008bb4:	008f2423          	sw	s0,8(t5)
c0008bb8:	00050463          	beqz	a0,c0008bc0 <stride_dequeue+0xd38>
c0008bbc:	01e52023          	sw	t5,0(a0)
c0008bc0:	008ba403          	lw	s0,8(s7)
c0008bc4:	0187a423          	sw	s8,8(a5)
c0008bc8:	01e7a223          	sw	t5,4(a5)
c0008bcc:	00ff2023          	sw	a5,0(t5)
c0008bd0:	00040c13          	mv	s8,s0
c0008bd4:	00078e13          	mv	t3,a5
c0008bd8:	01c12783          	lw	a5,28(sp)
c0008bdc:	01cea223          	sw	t3,4(t4)
c0008be0:	00fea423          	sw	a5,8(t4)
c0008be4:	01de2023          	sw	t4,0(t3)
c0008be8:	000e8e13          	mv	t3,t4
c0008bec:	01812783          	lw	a5,24(sp)
c0008bf0:	01caa223          	sw	t3,4(s5)
c0008bf4:	00faa423          	sw	a5,8(s5)
c0008bf8:	015e2023          	sw	s5,0(t3)
c0008bfc:	01412783          	lw	a5,20(sp)
c0008c00:	015ca223          	sw	s5,4(s9)
c0008c04:	00fca423          	sw	a5,8(s9)
c0008c08:	019aa023          	sw	s9,0(s5)
c0008c0c:	d20ff06f          	j	c000812c <stride_dequeue+0x2a4>
c0008c10:	004d2783          	lw	a5,4(s10)
c0008c14:	008d2b03          	lw	s6,8(s10)
c0008c18:	00f12623          	sw	a5,12(sp)
c0008c1c:	140b0063          	beqz	s6,c0008d5c <stride_dequeue+0xed4>
c0008c20:	000d8593          	mv	a1,s11
c0008c24:	000b0513          	mv	a0,s6
c0008c28:	d85fe0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0008c2c:	fff00313          	li	t1,-1
c0008c30:	6a650ce3          	beq	a0,t1,c0009ae8 <stride_dequeue+0x1c60>
c0008c34:	004da783          	lw	a5,4(s11)
c0008c38:	008da803          	lw	a6,8(s11)
c0008c3c:	00612a23          	sw	t1,20(sp)
c0008c40:	00f12823          	sw	a5,16(sp)
c0008c44:	10080463          	beqz	a6,c0008d4c <stride_dequeue+0xec4>
c0008c48:	00080593          	mv	a1,a6
c0008c4c:	000b0513          	mv	a0,s6
c0008c50:	01012c23          	sw	a6,24(sp)
c0008c54:	d59fe0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0008c58:	01412303          	lw	t1,20(sp)
c0008c5c:	01812803          	lw	a6,24(sp)
c0008c60:	00651463          	bne	a0,t1,c0008c68 <stride_dequeue+0xde0>
c0008c64:	4840106f          	j	c000a0e8 <stride_dequeue+0x2260>
c0008c68:	00482783          	lw	a5,4(a6)
c0008c6c:	00882883          	lw	a7,8(a6)
c0008c70:	00612c23          	sw	t1,24(sp)
c0008c74:	00f12a23          	sw	a5,20(sp)
c0008c78:	00089463          	bnez	a7,c0008c80 <stride_dequeue+0xdf8>
c0008c7c:	7100106f          	j	c000a38c <stride_dequeue+0x2504>
c0008c80:	00088593          	mv	a1,a7
c0008c84:	000b0513          	mv	a0,s6
c0008c88:	03012023          	sw	a6,32(sp)
c0008c8c:	01112e23          	sw	a7,28(sp)
c0008c90:	d1dfe0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0008c94:	01812303          	lw	t1,24(sp)
c0008c98:	01c12883          	lw	a7,28(sp)
c0008c9c:	02012803          	lw	a6,32(sp)
c0008ca0:	00651463          	bne	a0,t1,c0008ca8 <stride_dequeue+0xe20>
c0008ca4:	7000106f          	j	c000a3a4 <stride_dequeue+0x251c>
c0008ca8:	0088ae03          	lw	t3,8(a7)
c0008cac:	00612c23          	sw	t1,24(sp)
c0008cb0:	0048ac03          	lw	s8,4(a7)
c0008cb4:	000e1463          	bnez	t3,c0008cbc <stride_dequeue+0xe34>
c0008cb8:	2290106f          	j	c000a6e0 <stride_dequeue+0x2858>
c0008cbc:	000e0593          	mv	a1,t3
c0008cc0:	000b0513          	mv	a0,s6
c0008cc4:	03112223          	sw	a7,36(sp)
c0008cc8:	03012023          	sw	a6,32(sp)
c0008ccc:	01c12e23          	sw	t3,28(sp)
c0008cd0:	cddfe0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0008cd4:	01812303          	lw	t1,24(sp)
c0008cd8:	01c12e03          	lw	t3,28(sp)
c0008cdc:	02012803          	lw	a6,32(sp)
c0008ce0:	02412883          	lw	a7,36(sp)
c0008ce4:	00651463          	bne	a0,t1,c0008cec <stride_dequeue+0xe64>
c0008ce8:	5f50106f          	j	c000aadc <stride_dequeue+0x2c54>
c0008cec:	008e2583          	lw	a1,8(t3)
c0008cf0:	000b0513          	mv	a0,s6
c0008cf4:	004e2403          	lw	s0,4(t3)
c0008cf8:	03112023          	sw	a7,32(sp)
c0008cfc:	01012e23          	sw	a6,28(sp)
c0008d00:	01c12c23          	sw	t3,24(sp)
c0008d04:	d35fe0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c0008d08:	01812e03          	lw	t3,24(sp)
c0008d0c:	01c12803          	lw	a6,28(sp)
c0008d10:	02012883          	lw	a7,32(sp)
c0008d14:	00ae2223          	sw	a0,4(t3)
c0008d18:	008e2423          	sw	s0,8(t3)
c0008d1c:	00050463          	beqz	a0,c0008d24 <stride_dequeue+0xe9c>
c0008d20:	01c52023          	sw	t3,0(a0)
c0008d24:	008ba403          	lw	s0,8(s7)
c0008d28:	0188a423          	sw	s8,8(a7)
c0008d2c:	01c8a223          	sw	t3,4(a7)
c0008d30:	011e2023          	sw	a7,0(t3)
c0008d34:	00040c13          	mv	s8,s0
c0008d38:	01412783          	lw	a5,20(sp)
c0008d3c:	01182223          	sw	a7,4(a6)
c0008d40:	00080b13          	mv	s6,a6
c0008d44:	00f82423          	sw	a5,8(a6)
c0008d48:	0108a023          	sw	a6,0(a7)
c0008d4c:	01012783          	lw	a5,16(sp)
c0008d50:	016da223          	sw	s6,4(s11)
c0008d54:	00fda423          	sw	a5,8(s11)
c0008d58:	01bb2023          	sw	s11,0(s6)
c0008d5c:	00c12783          	lw	a5,12(sp)
c0008d60:	01bd2223          	sw	s11,4(s10)
c0008d64:	00fd2423          	sw	a5,8(s10)
c0008d68:	01ada023          	sw	s10,0(s11)
c0008d6c:	80dff06f          	j	c0008578 <stride_dequeue+0x6f0>
c0008d70:	008aad83          	lw	s11,8(s5)
c0008d74:	004aab03          	lw	s6,4(s5)
c0008d78:	140d8063          	beqz	s11,c0008eb8 <stride_dequeue+0x1030>
c0008d7c:	000d0593          	mv	a1,s10
c0008d80:	000d8513          	mv	a0,s11
c0008d84:	c29fe0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0008d88:	fff00313          	li	t1,-1
c0008d8c:	4e650ae3          	beq	a0,t1,c0009a80 <stride_dequeue+0x1bf8>
c0008d90:	004d2703          	lw	a4,4(s10)
c0008d94:	008d2783          	lw	a5,8(s10)
c0008d98:	00612a23          	sw	t1,20(sp)
c0008d9c:	00e12823          	sw	a4,16(sp)
c0008da0:	10078463          	beqz	a5,c0008ea8 <stride_dequeue+0x1020>
c0008da4:	00078593          	mv	a1,a5
c0008da8:	000d8513          	mv	a0,s11
c0008dac:	00f12c23          	sw	a5,24(sp)
c0008db0:	bfdfe0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0008db4:	01412303          	lw	t1,20(sp)
c0008db8:	01812783          	lw	a5,24(sp)
c0008dbc:	00651463          	bne	a0,t1,c0008dc4 <stride_dequeue+0xf3c>
c0008dc0:	3500106f          	j	c000a110 <stride_dequeue+0x2288>
c0008dc4:	0047a683          	lw	a3,4(a5)
c0008dc8:	0087a703          	lw	a4,8(a5)
c0008dcc:	00612c23          	sw	t1,24(sp)
c0008dd0:	00d12a23          	sw	a3,20(sp)
c0008dd4:	00071463          	bnez	a4,c0008ddc <stride_dequeue+0xf54>
c0008dd8:	5c40106f          	j	c000a39c <stride_dequeue+0x2514>
c0008ddc:	00070593          	mv	a1,a4
c0008de0:	000d8513          	mv	a0,s11
c0008de4:	02f12023          	sw	a5,32(sp)
c0008de8:	00e12e23          	sw	a4,28(sp)
c0008dec:	bc1fe0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0008df0:	01812303          	lw	t1,24(sp)
c0008df4:	01c12703          	lw	a4,28(sp)
c0008df8:	02012783          	lw	a5,32(sp)
c0008dfc:	00651463          	bne	a0,t1,c0008e04 <stride_dequeue+0xf7c>
c0008e00:	60c0106f          	j	c000a40c <stride_dequeue+0x2584>
c0008e04:	00872e03          	lw	t3,8(a4) # 40000008 <_binary_obj___user_matrix_out_size+0x3fffd800>
c0008e08:	00612c23          	sw	t1,24(sp)
c0008e0c:	00472c03          	lw	s8,4(a4)
c0008e10:	000e1463          	bnez	t3,c0008e18 <stride_dequeue+0xf90>
c0008e14:	1c10106f          	j	c000a7d4 <stride_dequeue+0x294c>
c0008e18:	000e0593          	mv	a1,t3
c0008e1c:	000d8513          	mv	a0,s11
c0008e20:	02e12223          	sw	a4,36(sp)
c0008e24:	02f12023          	sw	a5,32(sp)
c0008e28:	01c12e23          	sw	t3,28(sp)
c0008e2c:	b81fe0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0008e30:	01812303          	lw	t1,24(sp)
c0008e34:	01c12e03          	lw	t3,28(sp)
c0008e38:	02012783          	lw	a5,32(sp)
c0008e3c:	02412703          	lw	a4,36(sp)
c0008e40:	00651463          	bne	a0,t1,c0008e48 <stride_dequeue+0xfc0>
c0008e44:	2e10106f          	j	c000a924 <stride_dequeue+0x2a9c>
c0008e48:	008e2583          	lw	a1,8(t3)
c0008e4c:	000d8513          	mv	a0,s11
c0008e50:	004e2403          	lw	s0,4(t3)
c0008e54:	02e12023          	sw	a4,32(sp)
c0008e58:	00f12e23          	sw	a5,28(sp)
c0008e5c:	01c12c23          	sw	t3,24(sp)
c0008e60:	bd9fe0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c0008e64:	01812e03          	lw	t3,24(sp)
c0008e68:	01c12783          	lw	a5,28(sp)
c0008e6c:	02012703          	lw	a4,32(sp)
c0008e70:	00ae2223          	sw	a0,4(t3)
c0008e74:	008e2423          	sw	s0,8(t3)
c0008e78:	00050463          	beqz	a0,c0008e80 <stride_dequeue+0xff8>
c0008e7c:	01c52023          	sw	t3,0(a0)
c0008e80:	008ba403          	lw	s0,8(s7)
c0008e84:	01872423          	sw	s8,8(a4)
c0008e88:	01c72223          	sw	t3,4(a4)
c0008e8c:	00ee2023          	sw	a4,0(t3)
c0008e90:	00040c13          	mv	s8,s0
c0008e94:	01412683          	lw	a3,20(sp)
c0008e98:	00e7a223          	sw	a4,4(a5)
c0008e9c:	00078d93          	mv	s11,a5
c0008ea0:	00d7a423          	sw	a3,8(a5)
c0008ea4:	00f72023          	sw	a5,0(a4)
c0008ea8:	01012783          	lw	a5,16(sp)
c0008eac:	01bd2223          	sw	s11,4(s10)
c0008eb0:	00fd2423          	sw	a5,8(s10)
c0008eb4:	01ada023          	sw	s10,0(s11)
c0008eb8:	01aaa223          	sw	s10,4(s5)
c0008ebc:	016aa423          	sw	s6,8(s5)
c0008ec0:	015d2023          	sw	s5,0(s10)
c0008ec4:	000a8d13          	mv	s10,s5
c0008ec8:	8bdff06f          	j	c0008784 <stride_dequeue+0x8fc>
c0008ecc:	004d2783          	lw	a5,4(s10)
c0008ed0:	008d2303          	lw	t1,8(s10)
c0008ed4:	00a12a23          	sw	a0,20(sp)
c0008ed8:	00f12823          	sw	a5,16(sp)
c0008edc:	14030c63          	beqz	t1,c0009034 <stride_dequeue+0x11ac>
c0008ee0:	00030513          	mv	a0,t1
c0008ee4:	000b0593          	mv	a1,s6
c0008ee8:	00612c23          	sw	t1,24(sp)
c0008eec:	ac1fe0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0008ef0:	01412883          	lw	a7,20(sp)
c0008ef4:	01812303          	lw	t1,24(sp)
c0008ef8:	01151463          	bne	a0,a7,c0008f00 <stride_dequeue+0x1078>
c0008efc:	23c0106f          	j	c000a138 <stride_dequeue+0x22b0>
c0008f00:	004b2783          	lw	a5,4(s6)
c0008f04:	008b2e03          	lw	t3,8(s6)
c0008f08:	01112c23          	sw	a7,24(sp)
c0008f0c:	00f12a23          	sw	a5,20(sp)
c0008f10:	000e1463          	bnez	t3,c0008f18 <stride_dequeue+0x1090>
c0008f14:	4680106f          	j	c000a37c <stride_dequeue+0x24f4>
c0008f18:	000e0593          	mv	a1,t3
c0008f1c:	00030513          	mv	a0,t1
c0008f20:	03c12023          	sw	t3,32(sp)
c0008f24:	00612e23          	sw	t1,28(sp)
c0008f28:	a85fe0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0008f2c:	01812883          	lw	a7,24(sp)
c0008f30:	01c12303          	lw	t1,28(sp)
c0008f34:	02012e03          	lw	t3,32(sp)
c0008f38:	01151463          	bne	a0,a7,c0008f40 <stride_dequeue+0x10b8>
c0008f3c:	61c0106f          	j	c000a558 <stride_dequeue+0x26d0>
c0008f40:	004e2783          	lw	a5,4(t3)
c0008f44:	008e2c03          	lw	s8,8(t3)
c0008f48:	01112e23          	sw	a7,28(sp)
c0008f4c:	00f12c23          	sw	a5,24(sp)
c0008f50:	000c1463          	bnez	s8,c0008f58 <stride_dequeue+0x10d0>
c0008f54:	0690106f          	j	c000a7bc <stride_dequeue+0x2934>
c0008f58:	00030513          	mv	a0,t1
c0008f5c:	000c0593          	mv	a1,s8
c0008f60:	03c12223          	sw	t3,36(sp)
c0008f64:	02612023          	sw	t1,32(sp)
c0008f68:	a45fe0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0008f6c:	01c12883          	lw	a7,28(sp)
c0008f70:	02012303          	lw	t1,32(sp)
c0008f74:	02412e03          	lw	t3,36(sp)
c0008f78:	01151463          	bne	a0,a7,c0008f80 <stride_dequeue+0x10f8>
c0008f7c:	3250106f          	j	c000aaa0 <stride_dequeue+0x2c18>
c0008f80:	004c2783          	lw	a5,4(s8)
c0008f84:	008c2f03          	lw	t5,8(s8)
c0008f88:	03112623          	sw	a7,44(sp)
c0008f8c:	00f12e23          	sw	a5,28(sp)
c0008f90:	060f0863          	beqz	t5,c0009000 <stride_dequeue+0x1178>
c0008f94:	000f0593          	mv	a1,t5
c0008f98:	00030513          	mv	a0,t1
c0008f9c:	03c12423          	sw	t3,40(sp)
c0008fa0:	03e12223          	sw	t5,36(sp)
c0008fa4:	02612023          	sw	t1,32(sp)
c0008fa8:	a05fe0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0008fac:	02812e03          	lw	t3,40(sp)
c0008fb0:	02c12883          	lw	a7,44(sp)
c0008fb4:	02412f03          	lw	t5,36(sp)
c0008fb8:	03c12223          	sw	t3,36(sp)
c0008fbc:	02012303          	lw	t1,32(sp)
c0008fc0:	01151463          	bne	a0,a7,c0008fc8 <stride_dequeue+0x1140>
c0008fc4:	5a90106f          	j	c000ad6c <stride_dequeue+0x2ee4>
c0008fc8:	008f2583          	lw	a1,8(t5)
c0008fcc:	00030513          	mv	a0,t1
c0008fd0:	004f2403          	lw	s0,4(t5)
c0008fd4:	03e12023          	sw	t5,32(sp)
c0008fd8:	a61fe0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c0008fdc:	02012f03          	lw	t5,32(sp)
c0008fe0:	02412e03          	lw	t3,36(sp)
c0008fe4:	00af2223          	sw	a0,4(t5)
c0008fe8:	008f2423          	sw	s0,8(t5)
c0008fec:	00051463          	bnez	a0,c0008ff4 <stride_dequeue+0x116c>
c0008ff0:	2400206f          	j	c000b230 <stride_dequeue+0x33a8>
c0008ff4:	008ba403          	lw	s0,8(s7)
c0008ff8:	01e52023          	sw	t5,0(a0)
c0008ffc:	000f0313          	mv	t1,t5
c0009000:	01c12783          	lw	a5,28(sp)
c0009004:	006c2223          	sw	t1,4(s8)
c0009008:	00fc2423          	sw	a5,8(s8)
c000900c:	01832023          	sw	s8,0(t1)
c0009010:	01812783          	lw	a5,24(sp)
c0009014:	018e2223          	sw	s8,4(t3)
c0009018:	00fe2423          	sw	a5,8(t3)
c000901c:	01cc2023          	sw	t3,0(s8)
c0009020:	00040c13          	mv	s8,s0
c0009024:	01412783          	lw	a5,20(sp)
c0009028:	01cb2223          	sw	t3,4(s6)
c000902c:	00fb2423          	sw	a5,8(s6)
c0009030:	016e2023          	sw	s6,0(t3)
c0009034:	01012783          	lw	a5,16(sp)
c0009038:	016d2223          	sw	s6,4(s10)
c000903c:	00fd2423          	sw	a5,8(s10)
c0009040:	01ab2023          	sw	s10,0(s6)
c0009044:	d20ff06f          	j	c0008564 <stride_dequeue+0x6dc>
c0009048:	004aa703          	lw	a4,4(s5)
c000904c:	008aa783          	lw	a5,8(s5)
c0009050:	00e12a23          	sw	a4,20(sp)
c0009054:	12078e63          	beqz	a5,c0009190 <stride_dequeue+0x1308>
c0009058:	00078513          	mv	a0,a5
c000905c:	000b0593          	mv	a1,s6
c0009060:	00f12c23          	sw	a5,24(sp)
c0009064:	949fe0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0009068:	01812783          	lw	a5,24(sp)
c000906c:	01b51463          	bne	a0,s11,c0009074 <stride_dequeue+0x11ec>
c0009070:	0080106f          	j	c000a078 <stride_dequeue+0x21f0>
c0009074:	004b2703          	lw	a4,4(s6)
c0009078:	008b2e03          	lw	t3,8(s6)
c000907c:	00e12c23          	sw	a4,24(sp)
c0009080:	000e1463          	bnez	t3,c0009088 <stride_dequeue+0x1200>
c0009084:	3100106f          	j	c000a394 <stride_dequeue+0x250c>
c0009088:	000e0593          	mv	a1,t3
c000908c:	00078513          	mv	a0,a5
c0009090:	03c12023          	sw	t3,32(sp)
c0009094:	00f12e23          	sw	a5,28(sp)
c0009098:	915fe0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c000909c:	01c12783          	lw	a5,28(sp)
c00090a0:	02012e03          	lw	t3,32(sp)
c00090a4:	01b51463          	bne	a0,s11,c00090ac <stride_dequeue+0x1224>
c00090a8:	3c40106f          	j	c000a46c <stride_dequeue+0x25e4>
c00090ac:	004e2703          	lw	a4,4(t3)
c00090b0:	008e2c03          	lw	s8,8(t3)
c00090b4:	00e12e23          	sw	a4,28(sp)
c00090b8:	000c1463          	bnez	s8,c00090c0 <stride_dequeue+0x1238>
c00090bc:	63c0106f          	j	c000a6f8 <stride_dequeue+0x2870>
c00090c0:	00078513          	mv	a0,a5
c00090c4:	000c0593          	mv	a1,s8
c00090c8:	03c12223          	sw	t3,36(sp)
c00090cc:	02f12023          	sw	a5,32(sp)
c00090d0:	8ddfe0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c00090d4:	02012783          	lw	a5,32(sp)
c00090d8:	02412e03          	lw	t3,36(sp)
c00090dc:	01b51463          	bne	a0,s11,c00090e4 <stride_dequeue+0x125c>
c00090e0:	1050106f          	j	c000a9e4 <stride_dequeue+0x2b5c>
c00090e4:	004c2703          	lw	a4,4(s8)
c00090e8:	008c2f03          	lw	t5,8(s8)
c00090ec:	02e12023          	sw	a4,32(sp)
c00090f0:	060f0663          	beqz	t5,c000915c <stride_dequeue+0x12d4>
c00090f4:	000f0593          	mv	a1,t5
c00090f8:	00078513          	mv	a0,a5
c00090fc:	03c12623          	sw	t3,44(sp)
c0009100:	03e12423          	sw	t5,40(sp)
c0009104:	02f12223          	sw	a5,36(sp)
c0009108:	8a5fe0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c000910c:	02c12e03          	lw	t3,44(sp)
c0009110:	02812f03          	lw	t5,40(sp)
c0009114:	02412783          	lw	a5,36(sp)
c0009118:	03c12423          	sw	t3,40(sp)
c000911c:	01b51463          	bne	a0,s11,c0009124 <stride_dequeue+0x129c>
c0009120:	5390106f          	j	c000ae58 <stride_dequeue+0x2fd0>
c0009124:	008f2583          	lw	a1,8(t5)
c0009128:	00078513          	mv	a0,a5
c000912c:	004f2403          	lw	s0,4(t5)
c0009130:	03e12223          	sw	t5,36(sp)
c0009134:	905fe0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c0009138:	02412f03          	lw	t5,36(sp)
c000913c:	02812e03          	lw	t3,40(sp)
c0009140:	00af2223          	sw	a0,4(t5)
c0009144:	008f2423          	sw	s0,8(t5)
c0009148:	00051463          	bnez	a0,c0009150 <stride_dequeue+0x12c8>
c000914c:	7690106f          	j	c000b0b4 <stride_dequeue+0x322c>
c0009150:	008ba403          	lw	s0,8(s7)
c0009154:	01e52023          	sw	t5,0(a0)
c0009158:	000f0793          	mv	a5,t5
c000915c:	02012703          	lw	a4,32(sp)
c0009160:	00fc2223          	sw	a5,4(s8)
c0009164:	00ec2423          	sw	a4,8(s8)
c0009168:	0187a023          	sw	s8,0(a5)
c000916c:	01c12783          	lw	a5,28(sp)
c0009170:	018e2223          	sw	s8,4(t3)
c0009174:	00fe2423          	sw	a5,8(t3)
c0009178:	01cc2023          	sw	t3,0(s8)
c000917c:	00040c13          	mv	s8,s0
c0009180:	01812783          	lw	a5,24(sp)
c0009184:	01cb2223          	sw	t3,4(s6)
c0009188:	00fb2423          	sw	a5,8(s6)
c000918c:	016e2023          	sw	s6,0(t3)
c0009190:	01412783          	lw	a5,20(sp)
c0009194:	016aa223          	sw	s6,4(s5)
c0009198:	00faa423          	sw	a5,8(s5)
c000919c:	015b2023          	sw	s5,0(s6)
c00091a0:	dd4ff06f          	j	c0008774 <stride_dequeue+0x8ec>
c00091a4:	004aa703          	lw	a4,4(s5)
c00091a8:	008aa783          	lw	a5,8(s5)
c00091ac:	00e12a23          	sw	a4,20(sp)
c00091b0:	12078c63          	beqz	a5,c00092e8 <stride_dequeue+0x1460>
c00091b4:	00078513          	mv	a0,a5
c00091b8:	000b0593          	mv	a1,s6
c00091bc:	00f12c23          	sw	a5,24(sp)
c00091c0:	fecfe0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c00091c4:	01812783          	lw	a5,24(sp)
c00091c8:	65b500e3          	beq	a0,s11,c000a008 <stride_dequeue+0x2180>
c00091cc:	004b2703          	lw	a4,4(s6)
c00091d0:	008b2e03          	lw	t3,8(s6)
c00091d4:	00e12c23          	sw	a4,24(sp)
c00091d8:	000e1463          	bnez	t3,c00091e0 <stride_dequeue+0x1358>
c00091dc:	1a80106f          	j	c000a384 <stride_dequeue+0x24fc>
c00091e0:	000e0593          	mv	a1,t3
c00091e4:	00078513          	mv	a0,a5
c00091e8:	03c12023          	sw	t3,32(sp)
c00091ec:	00f12e23          	sw	a5,28(sp)
c00091f0:	fbcfe0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c00091f4:	01c12783          	lw	a5,28(sp)
c00091f8:	02012e03          	lw	t3,32(sp)
c00091fc:	01b51463          	bne	a0,s11,c0009204 <stride_dequeue+0x137c>
c0009200:	29c0106f          	j	c000a49c <stride_dequeue+0x2614>
c0009204:	004e2703          	lw	a4,4(t3)
c0009208:	008e2c03          	lw	s8,8(t3)
c000920c:	00e12e23          	sw	a4,28(sp)
c0009210:	000c1463          	bnez	s8,c0009218 <stride_dequeue+0x1390>
c0009214:	5b40106f          	j	c000a7c8 <stride_dequeue+0x2940>
c0009218:	00078513          	mv	a0,a5
c000921c:	000c0593          	mv	a1,s8
c0009220:	03c12223          	sw	t3,36(sp)
c0009224:	02f12023          	sw	a5,32(sp)
c0009228:	f84fe0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c000922c:	02012783          	lw	a5,32(sp)
c0009230:	02412e03          	lw	t3,36(sp)
c0009234:	01b51463          	bne	a0,s11,c000923c <stride_dequeue+0x13b4>
c0009238:	0e10106f          	j	c000ab18 <stride_dequeue+0x2c90>
c000923c:	004c2703          	lw	a4,4(s8)
c0009240:	008c2f03          	lw	t5,8(s8)
c0009244:	02e12023          	sw	a4,32(sp)
c0009248:	060f0663          	beqz	t5,c00092b4 <stride_dequeue+0x142c>
c000924c:	000f0593          	mv	a1,t5
c0009250:	00078513          	mv	a0,a5
c0009254:	03c12623          	sw	t3,44(sp)
c0009258:	03e12423          	sw	t5,40(sp)
c000925c:	02f12223          	sw	a5,36(sp)
c0009260:	f4cfe0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0009264:	02c12e03          	lw	t3,44(sp)
c0009268:	02812f03          	lw	t5,40(sp)
c000926c:	02412783          	lw	a5,36(sp)
c0009270:	03c12423          	sw	t3,40(sp)
c0009274:	01b51463          	bne	a0,s11,c000927c <stride_dequeue+0x13f4>
c0009278:	3850106f          	j	c000adfc <stride_dequeue+0x2f74>
c000927c:	008f2583          	lw	a1,8(t5)
c0009280:	00078513          	mv	a0,a5
c0009284:	004f2403          	lw	s0,4(t5)
c0009288:	03e12223          	sw	t5,36(sp)
c000928c:	facfe0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c0009290:	02412f03          	lw	t5,36(sp)
c0009294:	02812e03          	lw	t3,40(sp)
c0009298:	00af2223          	sw	a0,4(t5)
c000929c:	008f2423          	sw	s0,8(t5)
c00092a0:	00051463          	bnez	a0,c00092a8 <stride_dequeue+0x1420>
c00092a4:	5610106f          	j	c000b004 <stride_dequeue+0x317c>
c00092a8:	008ba403          	lw	s0,8(s7)
c00092ac:	01e52023          	sw	t5,0(a0)
c00092b0:	000f0793          	mv	a5,t5
c00092b4:	02012703          	lw	a4,32(sp)
c00092b8:	00fc2223          	sw	a5,4(s8)
c00092bc:	00ec2423          	sw	a4,8(s8)
c00092c0:	0187a023          	sw	s8,0(a5)
c00092c4:	01c12783          	lw	a5,28(sp)
c00092c8:	018e2223          	sw	s8,4(t3)
c00092cc:	00fe2423          	sw	a5,8(t3)
c00092d0:	01cc2023          	sw	t3,0(s8)
c00092d4:	00040c13          	mv	s8,s0
c00092d8:	01812783          	lw	a5,24(sp)
c00092dc:	01cb2223          	sw	t3,4(s6)
c00092e0:	00fb2423          	sw	a5,8(s6)
c00092e4:	016e2023          	sw	s6,0(t3)
c00092e8:	01412783          	lw	a5,20(sp)
c00092ec:	016aa223          	sw	s6,4(s5)
c00092f0:	00faa423          	sw	a5,8(s5)
c00092f4:	015b2023          	sw	s5,0(s6)
c00092f8:	000a8b13          	mv	s6,s5
c00092fc:	85cff06f          	j	c0008358 <stride_dequeue+0x4d0>
c0009300:	008b2d83          	lw	s11,8(s6)
c0009304:	004b2a83          	lw	s5,4(s6)
c0009308:	120d8663          	beqz	s11,c0009434 <stride_dequeue+0x15ac>
c000930c:	00098593          	mv	a1,s3
c0009310:	000d8513          	mv	a0,s11
c0009314:	e98fe0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0009318:	fff00313          	li	t1,-1
c000931c:	00050c13          	mv	s8,a0
c0009320:	6c6500e3          	beq	a0,t1,c000a1e0 <stride_dequeue+0x2358>
c0009324:	0049a783          	lw	a5,4(s3)
c0009328:	0089ac03          	lw	s8,8(s3)
c000932c:	00612a23          	sw	t1,20(sp)
c0009330:	00f12823          	sw	a5,16(sp)
c0009334:	000c1463          	bnez	s8,c000933c <stride_dequeue+0x14b4>
c0009338:	2900106f          	j	c000a5c8 <stride_dequeue+0x2740>
c000933c:	000c0593          	mv	a1,s8
c0009340:	000d8513          	mv	a0,s11
c0009344:	e68fe0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0009348:	01412303          	lw	t1,20(sp)
c000934c:	00651463          	bne	a0,t1,c0009354 <stride_dequeue+0x14cc>
c0009350:	2980106f          	j	c000a5e8 <stride_dequeue+0x2760>
c0009354:	004c2783          	lw	a5,4(s8)
c0009358:	008c2883          	lw	a7,8(s8)
c000935c:	00612c23          	sw	t1,24(sp)
c0009360:	00f12a23          	sw	a5,20(sp)
c0009364:	00089463          	bnez	a7,c000936c <stride_dequeue+0x14e4>
c0009368:	7300106f          	j	c000aa98 <stride_dequeue+0x2c10>
c000936c:	00088593          	mv	a1,a7
c0009370:	000d8513          	mv	a0,s11
c0009374:	01112e23          	sw	a7,28(sp)
c0009378:	e34fe0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c000937c:	01812303          	lw	t1,24(sp)
c0009380:	01c12883          	lw	a7,28(sp)
c0009384:	00651463          	bne	a0,t1,c000938c <stride_dequeue+0x1504>
c0009388:	1890106f          	j	c000ad10 <stride_dequeue+0x2e88>
c000938c:	0048a783          	lw	a5,4(a7)
c0009390:	0088ae03          	lw	t3,8(a7)
c0009394:	02612223          	sw	t1,36(sp)
c0009398:	00f12c23          	sw	a5,24(sp)
c000939c:	060e0463          	beqz	t3,c0009404 <stride_dequeue+0x157c>
c00093a0:	000e0593          	mv	a1,t3
c00093a4:	000d8513          	mv	a0,s11
c00093a8:	03112023          	sw	a7,32(sp)
c00093ac:	01c12e23          	sw	t3,28(sp)
c00093b0:	dfcfe0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c00093b4:	02412303          	lw	t1,36(sp)
c00093b8:	01c12e03          	lw	t3,28(sp)
c00093bc:	02012883          	lw	a7,32(sp)
c00093c0:	00651463          	bne	a0,t1,c00093c8 <stride_dequeue+0x1540>
c00093c4:	3710106f          	j	c000af34 <stride_dequeue+0x30ac>
c00093c8:	008e2583          	lw	a1,8(t3)
c00093cc:	000d8513          	mv	a0,s11
c00093d0:	004e2403          	lw	s0,4(t3)
c00093d4:	03112023          	sw	a7,32(sp)
c00093d8:	01c12e23          	sw	t3,28(sp)
c00093dc:	e5cfe0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c00093e0:	01c12e03          	lw	t3,28(sp)
c00093e4:	02012883          	lw	a7,32(sp)
c00093e8:	00ae2223          	sw	a0,4(t3)
c00093ec:	008e2423          	sw	s0,8(t3)
c00093f0:	00051463          	bnez	a0,c00093f8 <stride_dequeue+0x1570>
c00093f4:	3c50106f          	j	c000afb8 <stride_dequeue+0x3130>
c00093f8:	008ba403          	lw	s0,8(s7)
c00093fc:	01c52023          	sw	t3,0(a0)
c0009400:	000e0d93          	mv	s11,t3
c0009404:	01812783          	lw	a5,24(sp)
c0009408:	01b8a223          	sw	s11,4(a7)
c000940c:	00f8a423          	sw	a5,8(a7)
c0009410:	011da023          	sw	a7,0(s11)
c0009414:	01412783          	lw	a5,20(sp)
c0009418:	011c2223          	sw	a7,4(s8)
c000941c:	00fc2423          	sw	a5,8(s8)
c0009420:	0188a023          	sw	s8,0(a7)
c0009424:	01012783          	lw	a5,16(sp)
c0009428:	0189a223          	sw	s8,4(s3)
c000942c:	00f9a423          	sw	a5,8(s3)
c0009430:	013c2023          	sw	s3,0(s8)
c0009434:	013b2223          	sw	s3,4(s6)
c0009438:	015b2423          	sw	s5,8(s6)
c000943c:	0169a023          	sw	s6,0(s3)
c0009440:	00040c13          	mv	s8,s0
c0009444:	000b0993          	mv	s3,s6
c0009448:	e4cff06f          	j	c0008a94 <stride_dequeue+0xc0c>
c000944c:	008ca783          	lw	a5,8(s9)
c0009450:	00a12e23          	sw	a0,28(sp)
c0009454:	004cac03          	lw	s8,4(s9)
c0009458:	04078a63          	beqz	a5,c00094ac <stride_dequeue+0x1624>
c000945c:	000e0593          	mv	a1,t3
c0009460:	00078513          	mv	a0,a5
c0009464:	03c12223          	sw	t3,36(sp)
c0009468:	02f12023          	sw	a5,32(sp)
c000946c:	d40fe0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0009470:	01c12703          	lw	a4,28(sp)
c0009474:	02012783          	lw	a5,32(sp)
c0009478:	02412e03          	lw	t3,36(sp)
c000947c:	5ce504e3          	beq	a0,a4,c000a244 <stride_dequeue+0x23bc>
c0009480:	008e2583          	lw	a1,8(t3)
c0009484:	00078513          	mv	a0,a5
c0009488:	004e2403          	lw	s0,4(t3)
c000948c:	01c12e23          	sw	t3,28(sp)
c0009490:	da8fe0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c0009494:	01c12e03          	lw	t3,28(sp)
c0009498:	00ae2223          	sw	a0,4(t3)
c000949c:	008e2423          	sw	s0,8(t3)
c00094a0:	00050463          	beqz	a0,c00094a8 <stride_dequeue+0x1620>
c00094a4:	01c52023          	sw	t3,0(a0)
c00094a8:	008ba403          	lw	s0,8(s7)
c00094ac:	018ca423          	sw	s8,8(s9)
c00094b0:	01cca223          	sw	t3,4(s9)
c00094b4:	019e2023          	sw	s9,0(t3)
c00094b8:	00040c13          	mv	s8,s0
c00094bc:	c49fe06f          	j	c0008104 <stride_dequeue+0x27c>
c00094c0:	004aa783          	lw	a5,4(s5)
c00094c4:	008aac03          	lw	s8,8(s5)
c00094c8:	00a12e23          	sw	a0,28(sp)
c00094cc:	00f12c23          	sw	a5,24(sp)
c00094d0:	180c0e63          	beqz	s8,c000966c <stride_dequeue+0x17e4>
c00094d4:	000d8593          	mv	a1,s11
c00094d8:	000c0513          	mv	a0,s8
c00094dc:	cd0fe0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c00094e0:	01c12783          	lw	a5,28(sp)
c00094e4:	00f51463          	bne	a0,a5,c00094ec <stride_dequeue+0x1664>
c00094e8:	7590006f          	j	c000a440 <stride_dequeue+0x25b8>
c00094ec:	02f12023          	sw	a5,32(sp)
c00094f0:	004da783          	lw	a5,4(s11)
c00094f4:	008daf03          	lw	t5,8(s11)
c00094f8:	00f12e23          	sw	a5,28(sp)
c00094fc:	000f1463          	bnez	t5,c0009504 <stride_dequeue+0x167c>
c0009500:	35c0106f          	j	c000a85c <stride_dequeue+0x29d4>
c0009504:	000f0593          	mv	a1,t5
c0009508:	000c0513          	mv	a0,s8
c000950c:	03e12223          	sw	t5,36(sp)
c0009510:	c9cfe0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0009514:	02012783          	lw	a5,32(sp)
c0009518:	02412f03          	lw	t5,36(sp)
c000951c:	00f51463          	bne	a0,a5,c0009524 <stride_dequeue+0x169c>
c0009520:	4f80106f          	j	c000aa18 <stride_dequeue+0x2b90>
c0009524:	02f12623          	sw	a5,44(sp)
c0009528:	004f2703          	lw	a4,4(t5)
c000952c:	008f2783          	lw	a5,8(t5)
c0009530:	02e12223          	sw	a4,36(sp)
c0009534:	02f12023          	sw	a5,32(sp)
c0009538:	10078a63          	beqz	a5,c000964c <stride_dequeue+0x17c4>
c000953c:	00078593          	mv	a1,a5
c0009540:	000c0513          	mv	a0,s8
c0009544:	03e12423          	sw	t5,40(sp)
c0009548:	c64fe0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c000954c:	02c12783          	lw	a5,44(sp)
c0009550:	02812f03          	lw	t5,40(sp)
c0009554:	00f51463          	bne	a0,a5,c000955c <stride_dequeue+0x16d4>
c0009558:	1310106f          	j	c000ae88 <stride_dequeue+0x3000>
c000955c:	02012783          	lw	a5,32(sp)
c0009560:	0087a283          	lw	t0,8(a5)
c0009564:	0047a783          	lw	a5,4(a5)
c0009568:	02f12423          	sw	a5,40(sp)
c000956c:	0c028463          	beqz	t0,c0009634 <stride_dequeue+0x17ac>
c0009570:	00028593          	mv	a1,t0
c0009574:	000c0513          	mv	a0,s8
c0009578:	03e12823          	sw	t5,48(sp)
c000957c:	02512623          	sw	t0,44(sp)
c0009580:	c2cfe0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0009584:	fff00393          	li	t2,-1
c0009588:	02c12283          	lw	t0,44(sp)
c000958c:	03012f03          	lw	t5,48(sp)
c0009590:	00751463          	bne	a0,t2,c0009598 <stride_dequeue+0x1710>
c0009594:	32d0106f          	j	c000b0c0 <stride_dequeue+0x3238>
c0009598:	0042a783          	lw	a5,4(t0)
c000959c:	0082af83          	lw	t6,8(t0)
c00095a0:	02712e23          	sw	t2,60(sp)
c00095a4:	02f12623          	sw	a5,44(sp)
c00095a8:	060f8c63          	beqz	t6,c0009620 <stride_dequeue+0x1798>
c00095ac:	000f8593          	mv	a1,t6
c00095b0:	000c0513          	mv	a0,s8
c00095b4:	02512c23          	sw	t0,56(sp)
c00095b8:	03e12a23          	sw	t5,52(sp)
c00095bc:	03f12823          	sw	t6,48(sp)
c00095c0:	becfe0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c00095c4:	03c12383          	lw	t2,60(sp)
c00095c8:	03012f83          	lw	t6,48(sp)
c00095cc:	03412f03          	lw	t5,52(sp)
c00095d0:	03812283          	lw	t0,56(sp)
c00095d4:	00751463          	bne	a0,t2,c00095dc <stride_dequeue+0x1754>
c00095d8:	4d50106f          	j	c000b2ac <stride_dequeue+0x3424>
c00095dc:	008fa583          	lw	a1,8(t6)
c00095e0:	000c0513          	mv	a0,s8
c00095e4:	004fa403          	lw	s0,4(t6)
c00095e8:	02512c23          	sw	t0,56(sp)
c00095ec:	03e12a23          	sw	t5,52(sp)
c00095f0:	03f12823          	sw	t6,48(sp)
c00095f4:	c44fe0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c00095f8:	03012f83          	lw	t6,48(sp)
c00095fc:	03412f03          	lw	t5,52(sp)
c0009600:	03812283          	lw	t0,56(sp)
c0009604:	00afa223          	sw	a0,4(t6)
c0009608:	008fa423          	sw	s0,8(t6)
c000960c:	00051463          	bnez	a0,c0009614 <stride_dequeue+0x178c>
c0009610:	5290106f          	j	c000b338 <stride_dequeue+0x34b0>
c0009614:	008ba403          	lw	s0,8(s7)
c0009618:	01f52023          	sw	t6,0(a0)
c000961c:	000f8c13          	mv	s8,t6
c0009620:	02c12783          	lw	a5,44(sp)
c0009624:	0182a223          	sw	s8,4(t0)
c0009628:	00f2a423          	sw	a5,8(t0)
c000962c:	005c2023          	sw	t0,0(s8)
c0009630:	00028c13          	mv	s8,t0
c0009634:	02012783          	lw	a5,32(sp)
c0009638:	02812703          	lw	a4,40(sp)
c000963c:	0187a223          	sw	s8,4(a5)
c0009640:	00e7a423          	sw	a4,8(a5)
c0009644:	00fc2023          	sw	a5,0(s8)
c0009648:	00078c13          	mv	s8,a5
c000964c:	02412783          	lw	a5,36(sp)
c0009650:	018f2223          	sw	s8,4(t5)
c0009654:	00ff2423          	sw	a5,8(t5)
c0009658:	01ec2023          	sw	t5,0(s8)
c000965c:	01c12783          	lw	a5,28(sp)
c0009660:	01eda223          	sw	t5,4(s11)
c0009664:	00fda423          	sw	a5,8(s11)
c0009668:	01bf2023          	sw	s11,0(t5)
c000966c:	01812783          	lw	a5,24(sp)
c0009670:	01baa223          	sw	s11,4(s5)
c0009674:	00040c13          	mv	s8,s0
c0009678:	00faa423          	sw	a5,8(s5)
c000967c:	015da023          	sw	s5,0(s11)
c0009680:	cc9fe06f          	j	c0008348 <stride_dequeue+0x4c0>
c0009684:	004aa783          	lw	a5,4(s5)
c0009688:	008aac03          	lw	s8,8(s5)
c000968c:	00f12c23          	sw	a5,24(sp)
c0009690:	180c0c63          	beqz	s8,c0009828 <stride_dequeue+0x19a0>
c0009694:	000e0593          	mv	a1,t3
c0009698:	000c0513          	mv	a0,s8
c000969c:	b10fe0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c00096a0:	01c12e03          	lw	t3,28(sp)
c00096a4:	63b504e3          	beq	a0,s11,c000a4cc <stride_dequeue+0x2644>
c00096a8:	004e2783          	lw	a5,4(t3)
c00096ac:	008e2f03          	lw	t5,8(t3)
c00096b0:	00f12e23          	sw	a5,28(sp)
c00096b4:	000f1463          	bnez	t5,c00096bc <stride_dequeue+0x1834>
c00096b8:	19c0106f          	j	c000a854 <stride_dequeue+0x29cc>
c00096bc:	000f0593          	mv	a1,t5
c00096c0:	000c0513          	mv	a0,s8
c00096c4:	03c12223          	sw	t3,36(sp)
c00096c8:	03e12023          	sw	t5,32(sp)
c00096cc:	ae0fe0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c00096d0:	02012f03          	lw	t5,32(sp)
c00096d4:	02412e03          	lw	t3,36(sp)
c00096d8:	01b51463          	bne	a0,s11,c00096e0 <stride_dequeue+0x1858>
c00096dc:	2840106f          	j	c000a960 <stride_dequeue+0x2ad8>
c00096e0:	008f2783          	lw	a5,8(t5)
c00096e4:	004f2703          	lw	a4,4(t5)
c00096e8:	02f12023          	sw	a5,32(sp)
c00096ec:	02e12223          	sw	a4,36(sp)
c00096f0:	10078c63          	beqz	a5,c0009808 <stride_dequeue+0x1980>
c00096f4:	00078593          	mv	a1,a5
c00096f8:	000c0513          	mv	a0,s8
c00096fc:	03e12623          	sw	t5,44(sp)
c0009700:	03c12423          	sw	t3,40(sp)
c0009704:	aa8fe0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0009708:	02812e03          	lw	t3,40(sp)
c000970c:	02c12f03          	lw	t5,44(sp)
c0009710:	01b51463          	bne	a0,s11,c0009718 <stride_dequeue+0x1890>
c0009714:	6280106f          	j	c000ad3c <stride_dequeue+0x2eb4>
c0009718:	02012783          	lw	a5,32(sp)
c000971c:	0087ad83          	lw	s11,8(a5)
c0009720:	0047a783          	lw	a5,4(a5)
c0009724:	02f12423          	sw	a5,40(sp)
c0009728:	0c0d8463          	beqz	s11,c00097f0 <stride_dequeue+0x1968>
c000972c:	000d8593          	mv	a1,s11
c0009730:	000c0513          	mv	a0,s8
c0009734:	03e12823          	sw	t5,48(sp)
c0009738:	03c12623          	sw	t3,44(sp)
c000973c:	a70fe0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0009740:	fff00393          	li	t2,-1
c0009744:	02c12e03          	lw	t3,44(sp)
c0009748:	03012f03          	lw	t5,48(sp)
c000974c:	00751463          	bne	a0,t2,c0009754 <stride_dequeue+0x18cc>
c0009750:	2ed0106f          	j	c000b23c <stride_dequeue+0x33b4>
c0009754:	004da783          	lw	a5,4(s11)
c0009758:	008daf83          	lw	t6,8(s11)
c000975c:	02712e23          	sw	t2,60(sp)
c0009760:	02f12623          	sw	a5,44(sp)
c0009764:	060f8c63          	beqz	t6,c00097dc <stride_dequeue+0x1954>
c0009768:	000f8593          	mv	a1,t6
c000976c:	000c0513          	mv	a0,s8
c0009770:	03e12c23          	sw	t5,56(sp)
c0009774:	03c12a23          	sw	t3,52(sp)
c0009778:	03f12823          	sw	t6,48(sp)
c000977c:	a30fe0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0009780:	03c12383          	lw	t2,60(sp)
c0009784:	03012f83          	lw	t6,48(sp)
c0009788:	03412e03          	lw	t3,52(sp)
c000978c:	03812f03          	lw	t5,56(sp)
c0009790:	00751463          	bne	a0,t2,c0009798 <stride_dequeue+0x1910>
c0009794:	0e90106f          	j	c000b07c <stride_dequeue+0x31f4>
c0009798:	008fa583          	lw	a1,8(t6)
c000979c:	000c0513          	mv	a0,s8
c00097a0:	004fa403          	lw	s0,4(t6)
c00097a4:	03e12c23          	sw	t5,56(sp)
c00097a8:	03c12a23          	sw	t3,52(sp)
c00097ac:	03f12823          	sw	t6,48(sp)
c00097b0:	a88fe0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c00097b4:	03012f83          	lw	t6,48(sp)
c00097b8:	03412e03          	lw	t3,52(sp)
c00097bc:	03812f03          	lw	t5,56(sp)
c00097c0:	00afa223          	sw	a0,4(t6)
c00097c4:	008fa423          	sw	s0,8(t6)
c00097c8:	00051463          	bnez	a0,c00097d0 <stride_dequeue+0x1948>
c00097cc:	3cd0106f          	j	c000b398 <stride_dequeue+0x3510>
c00097d0:	008ba403          	lw	s0,8(s7)
c00097d4:	01f52023          	sw	t6,0(a0)
c00097d8:	000f8c13          	mv	s8,t6
c00097dc:	02c12783          	lw	a5,44(sp)
c00097e0:	018da223          	sw	s8,4(s11)
c00097e4:	00fda423          	sw	a5,8(s11)
c00097e8:	01bc2023          	sw	s11,0(s8)
c00097ec:	000d8c13          	mv	s8,s11
c00097f0:	02012783          	lw	a5,32(sp)
c00097f4:	02812703          	lw	a4,40(sp)
c00097f8:	0187a223          	sw	s8,4(a5)
c00097fc:	00e7a423          	sw	a4,8(a5)
c0009800:	00fc2023          	sw	a5,0(s8)
c0009804:	00078c13          	mv	s8,a5
c0009808:	02412783          	lw	a5,36(sp)
c000980c:	018f2223          	sw	s8,4(t5)
c0009810:	00ff2423          	sw	a5,8(t5)
c0009814:	01ec2023          	sw	t5,0(s8)
c0009818:	01c12783          	lw	a5,28(sp)
c000981c:	01ee2223          	sw	t5,4(t3)
c0009820:	00fe2423          	sw	a5,8(t3)
c0009824:	01cf2023          	sw	t3,0(t5)
c0009828:	01812783          	lw	a5,24(sp)
c000982c:	01caa223          	sw	t3,4(s5)
c0009830:	00040c13          	mv	s8,s0
c0009834:	00faa423          	sw	a5,8(s5)
c0009838:	015e2023          	sw	s5,0(t3)
c000983c:	f25fe06f          	j	c0008760 <stride_dequeue+0x8d8>
c0009840:	004d2783          	lw	a5,4(s10)
c0009844:	008d2c03          	lw	s8,8(s10)
c0009848:	00a12c23          	sw	a0,24(sp)
c000984c:	00f12a23          	sw	a5,20(sp)
c0009850:	040c0663          	beqz	s8,c000989c <stride_dequeue+0x1a14>
c0009854:	00088593          	mv	a1,a7
c0009858:	000c0513          	mv	a0,s8
c000985c:	01112e23          	sw	a7,28(sp)
c0009860:	94cfe0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0009864:	01812783          	lw	a5,24(sp)
c0009868:	01c12883          	lw	a7,28(sp)
c000986c:	4cf500e3          	beq	a0,a5,c000a52c <stride_dequeue+0x26a4>
c0009870:	0088a583          	lw	a1,8(a7)
c0009874:	000c0513          	mv	a0,s8
c0009878:	0048a403          	lw	s0,4(a7)
c000987c:	01112c23          	sw	a7,24(sp)
c0009880:	9b8fe0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c0009884:	01812883          	lw	a7,24(sp)
c0009888:	00a8a223          	sw	a0,4(a7)
c000988c:	0088a423          	sw	s0,8(a7)
c0009890:	00050463          	beqz	a0,c0009898 <stride_dequeue+0x1a10>
c0009894:	01152023          	sw	a7,0(a0)
c0009898:	008ba403          	lw	s0,8(s7)
c000989c:	01412783          	lw	a5,20(sp)
c00098a0:	011d2223          	sw	a7,4(s10)
c00098a4:	00040c13          	mv	s8,s0
c00098a8:	00fd2423          	sw	a5,8(s10)
c00098ac:	01a8a023          	sw	s10,0(a7)
c00098b0:	ca1fe06f          	j	c0008550 <stride_dequeue+0x6c8>
c00098b4:	004e2783          	lw	a5,4(t3)
c00098b8:	008e2d83          	lw	s11,8(t3)
c00098bc:	00a12e23          	sw	a0,28(sp)
c00098c0:	00f12c23          	sw	a5,24(sp)
c00098c4:	1a0d8063          	beqz	s11,c0009a64 <stride_dequeue+0x1bdc>
c00098c8:	000a8593          	mv	a1,s5
c00098cc:	000d8513          	mv	a0,s11
c00098d0:	03c12023          	sw	t3,32(sp)
c00098d4:	8d8fe0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c00098d8:	01c12783          	lw	a5,28(sp)
c00098dc:	02012e03          	lw	t3,32(sp)
c00098e0:	40f50ce3          	beq	a0,a5,c000a4f8 <stride_dequeue+0x2670>
c00098e4:	02f12023          	sw	a5,32(sp)
c00098e8:	004aa783          	lw	a5,4(s5)
c00098ec:	008aac03          	lw	s8,8(s5)
c00098f0:	00f12e23          	sw	a5,28(sp)
c00098f4:	000c1463          	bnez	s8,c00098fc <stride_dequeue+0x1a74>
c00098f8:	76d0006f          	j	c000a864 <stride_dequeue+0x29dc>
c00098fc:	000c0593          	mv	a1,s8
c0009900:	000d8513          	mv	a0,s11
c0009904:	03c12223          	sw	t3,36(sp)
c0009908:	8a4fe0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c000990c:	02012783          	lw	a5,32(sp)
c0009910:	02412e03          	lw	t3,36(sp)
c0009914:	00f51463          	bne	a0,a5,c000991c <stride_dequeue+0x1a94>
c0009918:	7550006f          	j	c000a86c <stride_dequeue+0x29e4>
c000991c:	02f12623          	sw	a5,44(sp)
c0009920:	004c2703          	lw	a4,4(s8)
c0009924:	008c2783          	lw	a5,8(s8)
c0009928:	02e12223          	sw	a4,36(sp)
c000992c:	02f12023          	sw	a5,32(sp)
c0009930:	10078a63          	beqz	a5,c0009a44 <stride_dequeue+0x1bbc>
c0009934:	00078593          	mv	a1,a5
c0009938:	000d8513          	mv	a0,s11
c000993c:	03c12423          	sw	t3,40(sp)
c0009940:	86cfe0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0009944:	02c12783          	lw	a5,44(sp)
c0009948:	02812e03          	lw	t3,40(sp)
c000994c:	00f51463          	bne	a0,a5,c0009954 <stride_dequeue+0x1acc>
c0009950:	4dc0106f          	j	c000ae2c <stride_dequeue+0x2fa4>
c0009954:	02012783          	lw	a5,32(sp)
c0009958:	0087a283          	lw	t0,8(a5)
c000995c:	0047a783          	lw	a5,4(a5)
c0009960:	02f12423          	sw	a5,40(sp)
c0009964:	0c028463          	beqz	t0,c0009a2c <stride_dequeue+0x1ba4>
c0009968:	00028593          	mv	a1,t0
c000996c:	000d8513          	mv	a0,s11
c0009970:	03c12823          	sw	t3,48(sp)
c0009974:	02512623          	sw	t0,44(sp)
c0009978:	834fe0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c000997c:	fff00393          	li	t2,-1
c0009980:	02c12283          	lw	t0,44(sp)
c0009984:	03012e03          	lw	t3,48(sp)
c0009988:	00751463          	bne	a0,t2,c0009990 <stride_dequeue+0x1b08>
c000998c:	6840106f          	j	c000b010 <stride_dequeue+0x3188>
c0009990:	0042a783          	lw	a5,4(t0)
c0009994:	0082af83          	lw	t6,8(t0)
c0009998:	02712e23          	sw	t2,60(sp)
c000999c:	02f12623          	sw	a5,44(sp)
c00099a0:	060f8c63          	beqz	t6,c0009a18 <stride_dequeue+0x1b90>
c00099a4:	000f8593          	mv	a1,t6
c00099a8:	000d8513          	mv	a0,s11
c00099ac:	02512c23          	sw	t0,56(sp)
c00099b0:	03c12a23          	sw	t3,52(sp)
c00099b4:	03f12823          	sw	t6,48(sp)
c00099b8:	ff5fd0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c00099bc:	03c12383          	lw	t2,60(sp)
c00099c0:	03012f83          	lw	t6,48(sp)
c00099c4:	03412e03          	lw	t3,52(sp)
c00099c8:	03812283          	lw	t0,56(sp)
c00099cc:	00751463          	bne	a0,t2,c00099d4 <stride_dequeue+0x1b4c>
c00099d0:	7380106f          	j	c000b108 <stride_dequeue+0x3280>
c00099d4:	008fa583          	lw	a1,8(t6)
c00099d8:	000d8513          	mv	a0,s11
c00099dc:	004fa403          	lw	s0,4(t6)
c00099e0:	02512c23          	sw	t0,56(sp)
c00099e4:	03c12a23          	sw	t3,52(sp)
c00099e8:	03f12823          	sw	t6,48(sp)
c00099ec:	84cfe0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c00099f0:	03012f83          	lw	t6,48(sp)
c00099f4:	03412e03          	lw	t3,52(sp)
c00099f8:	03812283          	lw	t0,56(sp)
c00099fc:	00afa223          	sw	a0,4(t6)
c0009a00:	008fa423          	sw	s0,8(t6)
c0009a04:	00051463          	bnez	a0,c0009a0c <stride_dequeue+0x1b84>
c0009a08:	1550106f          	j	c000b35c <stride_dequeue+0x34d4>
c0009a0c:	008ba403          	lw	s0,8(s7)
c0009a10:	01f52023          	sw	t6,0(a0)
c0009a14:	000f8d93          	mv	s11,t6
c0009a18:	02c12783          	lw	a5,44(sp)
c0009a1c:	01b2a223          	sw	s11,4(t0)
c0009a20:	00f2a423          	sw	a5,8(t0)
c0009a24:	005da023          	sw	t0,0(s11)
c0009a28:	00028d93          	mv	s11,t0
c0009a2c:	02012783          	lw	a5,32(sp)
c0009a30:	02812703          	lw	a4,40(sp)
c0009a34:	01b7a223          	sw	s11,4(a5)
c0009a38:	00e7a423          	sw	a4,8(a5)
c0009a3c:	00fda023          	sw	a5,0(s11)
c0009a40:	00078d93          	mv	s11,a5
c0009a44:	02412783          	lw	a5,36(sp)
c0009a48:	01bc2223          	sw	s11,4(s8)
c0009a4c:	00fc2423          	sw	a5,8(s8)
c0009a50:	018da023          	sw	s8,0(s11)
c0009a54:	01c12783          	lw	a5,28(sp)
c0009a58:	018aa223          	sw	s8,4(s5)
c0009a5c:	00faa423          	sw	a5,8(s5)
c0009a60:	015c2023          	sw	s5,0(s8)
c0009a64:	01812783          	lw	a5,24(sp)
c0009a68:	015e2223          	sw	s5,4(t3)
c0009a6c:	00040c13          	mv	s8,s0
c0009a70:	00fe2423          	sw	a5,8(t3)
c0009a74:	01caa023          	sw	t3,0(s5)
c0009a78:	000e0a93          	mv	s5,t3
c0009a7c:	980ff06f          	j	c0008bfc <stride_dequeue+0xd74>
c0009a80:	004da783          	lw	a5,4(s11)
c0009a84:	008dac03          	lw	s8,8(s11)
c0009a88:	00a12a23          	sw	a0,20(sp)
c0009a8c:	00f12823          	sw	a5,16(sp)
c0009a90:	020c0e63          	beqz	s8,c0009acc <stride_dequeue+0x1c44>
c0009a94:	000d0593          	mv	a1,s10
c0009a98:	000c0513          	mv	a0,s8
c0009a9c:	f11fd0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0009aa0:	01412783          	lw	a5,20(sp)
c0009aa4:	38f50ae3          	beq	a0,a5,c000a638 <stride_dequeue+0x27b0>
c0009aa8:	008d2583          	lw	a1,8(s10)
c0009aac:	004d2403          	lw	s0,4(s10)
c0009ab0:	000c0513          	mv	a0,s8
c0009ab4:	f85fd0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c0009ab8:	00ad2223          	sw	a0,4(s10)
c0009abc:	008d2423          	sw	s0,8(s10)
c0009ac0:	00050463          	beqz	a0,c0009ac8 <stride_dequeue+0x1c40>
c0009ac4:	01a52023          	sw	s10,0(a0)
c0009ac8:	008ba403          	lw	s0,8(s7)
c0009acc:	01012783          	lw	a5,16(sp)
c0009ad0:	01ada223          	sw	s10,4(s11)
c0009ad4:	00040c13          	mv	s8,s0
c0009ad8:	00fda423          	sw	a5,8(s11)
c0009adc:	01bd2023          	sw	s11,0(s10)
c0009ae0:	000d8d13          	mv	s10,s11
c0009ae4:	bd4ff06f          	j	c0008eb8 <stride_dequeue+0x1030>
c0009ae8:	004b2783          	lw	a5,4(s6)
c0009aec:	008b2c03          	lw	s8,8(s6)
c0009af0:	00a12a23          	sw	a0,20(sp)
c0009af4:	00f12823          	sw	a5,16(sp)
c0009af8:	020c0e63          	beqz	s8,c0009b34 <stride_dequeue+0x1cac>
c0009afc:	000d8593          	mv	a1,s11
c0009b00:	000c0513          	mv	a0,s8
c0009b04:	ea9fd0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0009b08:	01412783          	lw	a5,20(sp)
c0009b0c:	34f50ce3          	beq	a0,a5,c000a664 <stride_dequeue+0x27dc>
c0009b10:	008da583          	lw	a1,8(s11)
c0009b14:	004da403          	lw	s0,4(s11)
c0009b18:	000c0513          	mv	a0,s8
c0009b1c:	f1dfd0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c0009b20:	00ada223          	sw	a0,4(s11)
c0009b24:	008da423          	sw	s0,8(s11)
c0009b28:	00050463          	beqz	a0,c0009b30 <stride_dequeue+0x1ca8>
c0009b2c:	01b52023          	sw	s11,0(a0)
c0009b30:	008ba403          	lw	s0,8(s7)
c0009b34:	01012783          	lw	a5,16(sp)
c0009b38:	01bb2223          	sw	s11,4(s6)
c0009b3c:	00040c13          	mv	s8,s0
c0009b40:	00fb2423          	sw	a5,8(s6)
c0009b44:	016da023          	sw	s6,0(s11)
c0009b48:	000b0d93          	mv	s11,s6
c0009b4c:	a10ff06f          	j	c0008d5c <stride_dequeue+0xed4>
c0009b50:	004b2783          	lw	a5,4(s6)
c0009b54:	008b2c03          	lw	s8,8(s6)
c0009b58:	00a12a23          	sw	a0,20(sp)
c0009b5c:	00f12823          	sw	a5,16(sp)
c0009b60:	020c0e63          	beqz	s8,c0009b9c <stride_dequeue+0x1d14>
c0009b64:	000d8593          	mv	a1,s11
c0009b68:	000c0513          	mv	a0,s8
c0009b6c:	e41fd0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0009b70:	01412783          	lw	a5,20(sp)
c0009b74:	30f50ee3          	beq	a0,a5,c000a690 <stride_dequeue+0x2808>
c0009b78:	008da583          	lw	a1,8(s11)
c0009b7c:	004da403          	lw	s0,4(s11)
c0009b80:	000c0513          	mv	a0,s8
c0009b84:	eb5fd0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c0009b88:	00ada223          	sw	a0,4(s11)
c0009b8c:	008da423          	sw	s0,8(s11)
c0009b90:	00050463          	beqz	a0,c0009b98 <stride_dequeue+0x1d10>
c0009b94:	01b52023          	sw	s11,0(a0)
c0009b98:	008ba403          	lw	s0,8(s7)
c0009b9c:	01012783          	lw	a5,16(sp)
c0009ba0:	01bb2223          	sw	s11,4(s6)
c0009ba4:	00040c13          	mv	s8,s0
c0009ba8:	00fb2423          	sw	a5,8(s6)
c0009bac:	016da023          	sw	s6,0(s11)
c0009bb0:	ed9fe06f          	j	c0008a88 <stride_dequeue+0xc00>
c0009bb4:	008ca503          	lw	a0,8(s9)
c0009bb8:	004cac03          	lw	s8,4(s9)
c0009bbc:	00040593          	mv	a1,s0
c0009bc0:	03c12023          	sw	t3,32(sp)
c0009bc4:	e75fd0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c0009bc8:	00aca223          	sw	a0,4(s9)
c0009bcc:	018ca423          	sw	s8,8(s9)
c0009bd0:	02012e03          	lw	t3,32(sp)
c0009bd4:	00050463          	beqz	a0,c0009bdc <stride_dequeue+0x1d54>
c0009bd8:	01952023          	sw	s9,0(a0)
c0009bdc:	008bac03          	lw	s8,8(s7)
c0009be0:	d10fe06f          	j	c00080f0 <stride_dequeue+0x268>
c0009be4:	008ea783          	lw	a5,8(t4)
c0009be8:	00a12e23          	sw	a0,28(sp)
c0009bec:	004eac03          	lw	s8,4(t4)
c0009bf0:	04078c63          	beqz	a5,c0009c48 <stride_dequeue+0x1dc0>
c0009bf4:	00078513          	mv	a0,a5
c0009bf8:	000d8593          	mv	a1,s11
c0009bfc:	03d12223          	sw	t4,36(sp)
c0009c00:	02f12023          	sw	a5,32(sp)
c0009c04:	da9fd0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0009c08:	01c12703          	lw	a4,28(sp)
c0009c0c:	02012783          	lw	a5,32(sp)
c0009c10:	02412e83          	lw	t4,36(sp)
c0009c14:	00e51463          	bne	a0,a4,c0009c1c <stride_dequeue+0x1d94>
c0009c18:	7b10006f          	j	c000abc8 <stride_dequeue+0x2d40>
c0009c1c:	008da583          	lw	a1,8(s11)
c0009c20:	004da403          	lw	s0,4(s11)
c0009c24:	00078513          	mv	a0,a5
c0009c28:	01d12e23          	sw	t4,28(sp)
c0009c2c:	e0dfd0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c0009c30:	00ada223          	sw	a0,4(s11)
c0009c34:	008da423          	sw	s0,8(s11)
c0009c38:	01c12e83          	lw	t4,28(sp)
c0009c3c:	00050463          	beqz	a0,c0009c44 <stride_dequeue+0x1dbc>
c0009c40:	01b52023          	sw	s11,0(a0)
c0009c44:	008ba403          	lw	s0,8(s7)
c0009c48:	01bea223          	sw	s11,4(t4)
c0009c4c:	018ea423          	sw	s8,8(t4)
c0009c50:	01dda023          	sw	t4,0(s11)
c0009c54:	00040c13          	mv	s8,s0
c0009c58:	000e8d93          	mv	s11,t4
c0009c5c:	ca9fe06f          	j	c0008904 <stride_dequeue+0xa7c>
c0009c60:	004e2783          	lw	a5,4(t3)
c0009c64:	008e2d83          	lw	s11,8(t3)
c0009c68:	02a12023          	sw	a0,32(sp)
c0009c6c:	00f12e23          	sw	a5,28(sp)
c0009c70:	160d8c63          	beqz	s11,c0009de8 <stride_dequeue+0x1f60>
c0009c74:	000e8593          	mv	a1,t4
c0009c78:	000d8513          	mv	a0,s11
c0009c7c:	03c12423          	sw	t3,40(sp)
c0009c80:	03d12223          	sw	t4,36(sp)
c0009c84:	d29fd0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0009c88:	02012783          	lw	a5,32(sp)
c0009c8c:	02412e83          	lw	t4,36(sp)
c0009c90:	02812e03          	lw	t3,40(sp)
c0009c94:	00f51463          	bne	a0,a5,c0009c9c <stride_dequeue+0x1e14>
c0009c98:	76d0006f          	j	c000ac04 <stride_dequeue+0x2d7c>
c0009c9c:	02f12623          	sw	a5,44(sp)
c0009ca0:	004ea783          	lw	a5,4(t4)
c0009ca4:	008eac03          	lw	s8,8(t4)
c0009ca8:	02f12023          	sw	a5,32(sp)
c0009cac:	120c0663          	beqz	s8,c0009dd8 <stride_dequeue+0x1f50>
c0009cb0:	000c0593          	mv	a1,s8
c0009cb4:	000d8513          	mv	a0,s11
c0009cb8:	03d12423          	sw	t4,40(sp)
c0009cbc:	03c12223          	sw	t3,36(sp)
c0009cc0:	cedfd0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0009cc4:	02c12783          	lw	a5,44(sp)
c0009cc8:	02412e03          	lw	t3,36(sp)
c0009ccc:	02812e83          	lw	t4,40(sp)
c0009cd0:	00f51463          	bne	a0,a5,c0009cd8 <stride_dequeue+0x1e50>
c0009cd4:	0f80106f          	j	c000adcc <stride_dequeue+0x2f44>
c0009cd8:	004c2783          	lw	a5,4(s8)
c0009cdc:	008c2283          	lw	t0,8(s8)
c0009ce0:	02f12223          	sw	a5,36(sp)
c0009ce4:	0e028063          	beqz	t0,c0009dc4 <stride_dequeue+0x1f3c>
c0009ce8:	00028593          	mv	a1,t0
c0009cec:	000d8513          	mv	a0,s11
c0009cf0:	03d12823          	sw	t4,48(sp)
c0009cf4:	03c12623          	sw	t3,44(sp)
c0009cf8:	02512423          	sw	t0,40(sp)
c0009cfc:	cb1fd0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0009d00:	fff00393          	li	t2,-1
c0009d04:	02812283          	lw	t0,40(sp)
c0009d08:	02c12e03          	lw	t3,44(sp)
c0009d0c:	03012e83          	lw	t4,48(sp)
c0009d10:	00751463          	bne	a0,t2,c0009d18 <stride_dequeue+0x1e90>
c0009d14:	46c0106f          	j	c000b180 <stride_dequeue+0x32f8>
c0009d18:	0042a783          	lw	a5,4(t0)
c0009d1c:	0082af83          	lw	t6,8(t0)
c0009d20:	02712e23          	sw	t2,60(sp)
c0009d24:	02f12423          	sw	a5,40(sp)
c0009d28:	080f8463          	beqz	t6,c0009db0 <stride_dequeue+0x1f28>
c0009d2c:	000f8593          	mv	a1,t6
c0009d30:	000d8513          	mv	a0,s11
c0009d34:	02512c23          	sw	t0,56(sp)
c0009d38:	03d12a23          	sw	t4,52(sp)
c0009d3c:	03c12823          	sw	t3,48(sp)
c0009d40:	03f12623          	sw	t6,44(sp)
c0009d44:	c69fd0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0009d48:	03c12383          	lw	t2,60(sp)
c0009d4c:	02c12f83          	lw	t6,44(sp)
c0009d50:	03012e03          	lw	t3,48(sp)
c0009d54:	03412e83          	lw	t4,52(sp)
c0009d58:	03812283          	lw	t0,56(sp)
c0009d5c:	00751463          	bne	a0,t2,c0009d64 <stride_dequeue+0x1edc>
c0009d60:	4900106f          	j	c000b1f0 <stride_dequeue+0x3368>
c0009d64:	008fa583          	lw	a1,8(t6)
c0009d68:	000d8513          	mv	a0,s11
c0009d6c:	004fa403          	lw	s0,4(t6)
c0009d70:	02512c23          	sw	t0,56(sp)
c0009d74:	03d12a23          	sw	t4,52(sp)
c0009d78:	03c12823          	sw	t3,48(sp)
c0009d7c:	03f12623          	sw	t6,44(sp)
c0009d80:	cb9fd0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c0009d84:	02c12f83          	lw	t6,44(sp)
c0009d88:	03012e03          	lw	t3,48(sp)
c0009d8c:	03412e83          	lw	t4,52(sp)
c0009d90:	00afa223          	sw	a0,4(t6)
c0009d94:	008fa423          	sw	s0,8(t6)
c0009d98:	03812283          	lw	t0,56(sp)
c0009d9c:	00051463          	bnez	a0,c0009da4 <stride_dequeue+0x1f1c>
c0009da0:	5b00106f          	j	c000b350 <stride_dequeue+0x34c8>
c0009da4:	008ba403          	lw	s0,8(s7)
c0009da8:	01f52023          	sw	t6,0(a0)
c0009dac:	000f8d93          	mv	s11,t6
c0009db0:	02812783          	lw	a5,40(sp)
c0009db4:	01b2a223          	sw	s11,4(t0)
c0009db8:	00f2a423          	sw	a5,8(t0)
c0009dbc:	005da023          	sw	t0,0(s11)
c0009dc0:	00028d93          	mv	s11,t0
c0009dc4:	02412783          	lw	a5,36(sp)
c0009dc8:	01bc2223          	sw	s11,4(s8)
c0009dcc:	00fc2423          	sw	a5,8(s8)
c0009dd0:	018da023          	sw	s8,0(s11)
c0009dd4:	000c0d93          	mv	s11,s8
c0009dd8:	02012783          	lw	a5,32(sp)
c0009ddc:	01bea223          	sw	s11,4(t4)
c0009de0:	00fea423          	sw	a5,8(t4)
c0009de4:	01dda023          	sw	t4,0(s11)
c0009de8:	01c12783          	lw	a5,28(sp)
c0009dec:	01de2223          	sw	t4,4(t3)
c0009df0:	00040c13          	mv	s8,s0
c0009df4:	00fe2423          	sw	a5,8(t3)
c0009df8:	01cea023          	sw	t3,0(t4)
c0009dfc:	df1fe06f          	j	c0008bec <stride_dequeue+0xd64>
c0009e00:	004aa783          	lw	a5,4(s5)
c0009e04:	008aac03          	lw	s8,8(s5)
c0009e08:	02a12023          	sw	a0,32(sp)
c0009e0c:	00f12e23          	sw	a5,28(sp)
c0009e10:	140c0c63          	beqz	s8,c0009f68 <stride_dequeue+0x20e0>
c0009e14:	000e8593          	mv	a1,t4
c0009e18:	000c0513          	mv	a0,s8
c0009e1c:	03d12223          	sw	t4,36(sp)
c0009e20:	b8dfd0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0009e24:	02012783          	lw	a5,32(sp)
c0009e28:	02412e83          	lw	t4,36(sp)
c0009e2c:	52f500e3          	beq	a0,a5,c000ab4c <stride_dequeue+0x2cc4>
c0009e30:	02f12623          	sw	a5,44(sp)
c0009e34:	004ea703          	lw	a4,4(t4)
c0009e38:	008ea783          	lw	a5,8(t4)
c0009e3c:	02e12223          	sw	a4,36(sp)
c0009e40:	02f12023          	sw	a5,32(sp)
c0009e44:	10078a63          	beqz	a5,c0009f58 <stride_dequeue+0x20d0>
c0009e48:	00078593          	mv	a1,a5
c0009e4c:	000c0513          	mv	a0,s8
c0009e50:	03d12423          	sw	t4,40(sp)
c0009e54:	b59fd0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0009e58:	02c12783          	lw	a5,44(sp)
c0009e5c:	02812e83          	lw	t4,40(sp)
c0009e60:	00f51463          	bne	a0,a5,c0009e68 <stride_dequeue+0x1fe0>
c0009e64:	0800106f          	j	c000aee4 <stride_dequeue+0x305c>
c0009e68:	02012783          	lw	a5,32(sp)
c0009e6c:	0087a283          	lw	t0,8(a5)
c0009e70:	0047a783          	lw	a5,4(a5)
c0009e74:	02f12423          	sw	a5,40(sp)
c0009e78:	0c028463          	beqz	t0,c0009f40 <stride_dequeue+0x20b8>
c0009e7c:	00028593          	mv	a1,t0
c0009e80:	000c0513          	mv	a0,s8
c0009e84:	03d12823          	sw	t4,48(sp)
c0009e88:	02512623          	sw	t0,44(sp)
c0009e8c:	b21fd0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0009e90:	fff00393          	li	t2,-1
c0009e94:	02c12283          	lw	t0,44(sp)
c0009e98:	03012e83          	lw	t4,48(sp)
c0009e9c:	00751463          	bne	a0,t2,c0009ea4 <stride_dequeue+0x201c>
c0009ea0:	4500106f          	j	c000b2f0 <stride_dequeue+0x3468>
c0009ea4:	0042a783          	lw	a5,4(t0)
c0009ea8:	0082af83          	lw	t6,8(t0)
c0009eac:	02712e23          	sw	t2,60(sp)
c0009eb0:	02f12623          	sw	a5,44(sp)
c0009eb4:	060f8c63          	beqz	t6,c0009f2c <stride_dequeue+0x20a4>
c0009eb8:	000f8593          	mv	a1,t6
c0009ebc:	000c0513          	mv	a0,s8
c0009ec0:	02512c23          	sw	t0,56(sp)
c0009ec4:	03d12a23          	sw	t4,52(sp)
c0009ec8:	03f12823          	sw	t6,48(sp)
c0009ecc:	ae1fd0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c0009ed0:	03c12383          	lw	t2,60(sp)
c0009ed4:	03012f83          	lw	t6,48(sp)
c0009ed8:	03412e83          	lw	t4,52(sp)
c0009edc:	03812283          	lw	t0,56(sp)
c0009ee0:	00751463          	bne	a0,t2,c0009ee8 <stride_dequeue+0x2060>
c0009ee4:	2d40106f          	j	c000b1b8 <stride_dequeue+0x3330>
c0009ee8:	008fa583          	lw	a1,8(t6)
c0009eec:	000c0513          	mv	a0,s8
c0009ef0:	004fa403          	lw	s0,4(t6)
c0009ef4:	02512c23          	sw	t0,56(sp)
c0009ef8:	03d12a23          	sw	t4,52(sp)
c0009efc:	03f12823          	sw	t6,48(sp)
c0009f00:	b39fd0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c0009f04:	03012f83          	lw	t6,48(sp)
c0009f08:	03412e83          	lw	t4,52(sp)
c0009f0c:	03812283          	lw	t0,56(sp)
c0009f10:	00afa223          	sw	a0,4(t6)
c0009f14:	008fa423          	sw	s0,8(t6)
c0009f18:	00051463          	bnez	a0,c0009f20 <stride_dequeue+0x2098>
c0009f1c:	4280106f          	j	c000b344 <stride_dequeue+0x34bc>
c0009f20:	008ba403          	lw	s0,8(s7)
c0009f24:	01f52023          	sw	t6,0(a0)
c0009f28:	000f8c13          	mv	s8,t6
c0009f2c:	02c12783          	lw	a5,44(sp)
c0009f30:	0182a223          	sw	s8,4(t0)
c0009f34:	00f2a423          	sw	a5,8(t0)
c0009f38:	005c2023          	sw	t0,0(s8)
c0009f3c:	00028c13          	mv	s8,t0
c0009f40:	02012783          	lw	a5,32(sp)
c0009f44:	02812703          	lw	a4,40(sp)
c0009f48:	0187a223          	sw	s8,4(a5)
c0009f4c:	00e7a423          	sw	a4,8(a5)
c0009f50:	00fc2023          	sw	a5,0(s8)
c0009f54:	00078c13          	mv	s8,a5
c0009f58:	02412783          	lw	a5,36(sp)
c0009f5c:	018ea223          	sw	s8,4(t4)
c0009f60:	00fea423          	sw	a5,8(t4)
c0009f64:	01dc2023          	sw	t4,0(s8)
c0009f68:	01c12783          	lw	a5,28(sp)
c0009f6c:	01daa223          	sw	t4,4(s5)
c0009f70:	00040c13          	mv	s8,s0
c0009f74:	00faa423          	sw	a5,8(s5)
c0009f78:	015ea023          	sw	s5,0(t4)
c0009f7c:	bb8fe06f          	j	c0008334 <stride_dequeue+0x4ac>
c0009f80:	008aa503          	lw	a0,8(s5)
c0009f84:	004aa403          	lw	s0,4(s5)
c0009f88:	000d8593          	mv	a1,s11
c0009f8c:	01c12e23          	sw	t3,28(sp)
c0009f90:	aa9fd0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c0009f94:	00aaa223          	sw	a0,4(s5)
c0009f98:	008aa423          	sw	s0,8(s5)
c0009f9c:	01c12e03          	lw	t3,28(sp)
c0009fa0:	00050463          	beqz	a0,c0009fa8 <stride_dequeue+0x2120>
c0009fa4:	01552023          	sw	s5,0(a0)
c0009fa8:	008bac03          	lw	s8,8(s7)
c0009fac:	fa0fe06f          	j	c000874c <stride_dequeue+0x8c4>
c0009fb0:	008d2503          	lw	a0,8(s10)
c0009fb4:	004d2403          	lw	s0,4(s10)
c0009fb8:	000e0593          	mv	a1,t3
c0009fbc:	01112c23          	sw	a7,24(sp)
c0009fc0:	a79fd0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c0009fc4:	00ad2223          	sw	a0,4(s10)
c0009fc8:	008d2423          	sw	s0,8(s10)
c0009fcc:	01812883          	lw	a7,24(sp)
c0009fd0:	00050463          	beqz	a0,c0009fd8 <stride_dequeue+0x2150>
c0009fd4:	01a52023          	sw	s10,0(a0)
c0009fd8:	008bac03          	lw	s8,8(s7)
c0009fdc:	d60fe06f          	j	c000853c <stride_dequeue+0x6b4>
c0009fe0:	008b2503          	lw	a0,8(s6)
c0009fe4:	004b2403          	lw	s0,4(s6)
c0009fe8:	00080593          	mv	a1,a6
c0009fec:	a4dfd0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c0009ff0:	00ab2223          	sw	a0,4(s6)
c0009ff4:	008b2423          	sw	s0,8(s6)
c0009ff8:	00050463          	beqz	a0,c000a000 <stride_dequeue+0x2178>
c0009ffc:	01652023          	sw	s6,0(a0)
c000a000:	008bac03          	lw	s8,8(s7)
c000a004:	a71fe06f          	j	c0008a74 <stride_dequeue+0xbec>
c000a008:	0087ac03          	lw	s8,8(a5)
c000a00c:	00a12c23          	sw	a0,24(sp)
c000a010:	0047ad83          	lw	s11,4(a5)
c000a014:	040c0663          	beqz	s8,c000a060 <stride_dequeue+0x21d8>
c000a018:	000b0593          	mv	a1,s6
c000a01c:	000c0513          	mv	a0,s8
c000a020:	00f12e23          	sw	a5,28(sp)
c000a024:	989fd0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c000a028:	01c12783          	lw	a5,28(sp)
c000a02c:	01812703          	lw	a4,24(sp)
c000a030:	00f12c23          	sw	a5,24(sp)
c000a034:	4ae506e3          	beq	a0,a4,c000ace0 <stride_dequeue+0x2e58>
c000a038:	008b2583          	lw	a1,8(s6)
c000a03c:	004b2403          	lw	s0,4(s6)
c000a040:	000c0513          	mv	a0,s8
c000a044:	9f5fd0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000a048:	00ab2223          	sw	a0,4(s6)
c000a04c:	008b2423          	sw	s0,8(s6)
c000a050:	01812783          	lw	a5,24(sp)
c000a054:	00050463          	beqz	a0,c000a05c <stride_dequeue+0x21d4>
c000a058:	01652023          	sw	s6,0(a0)
c000a05c:	008ba403          	lw	s0,8(s7)
c000a060:	0167a223          	sw	s6,4(a5)
c000a064:	01b7a423          	sw	s11,8(a5)
c000a068:	00fb2023          	sw	a5,0(s6)
c000a06c:	00040c13          	mv	s8,s0
c000a070:	00078b13          	mv	s6,a5
c000a074:	a74ff06f          	j	c00092e8 <stride_dequeue+0x1460>
c000a078:	0087ac03          	lw	s8,8(a5)
c000a07c:	00a12c23          	sw	a0,24(sp)
c000a080:	0047ad83          	lw	s11,4(a5)
c000a084:	040c0663          	beqz	s8,c000a0d0 <stride_dequeue+0x2248>
c000a088:	000b0593          	mv	a1,s6
c000a08c:	000c0513          	mv	a0,s8
c000a090:	00f12e23          	sw	a5,28(sp)
c000a094:	919fd0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c000a098:	01c12783          	lw	a5,28(sp)
c000a09c:	01812703          	lw	a4,24(sp)
c000a0a0:	00f12c23          	sw	a5,24(sp)
c000a0a4:	40e506e3          	beq	a0,a4,c000acb0 <stride_dequeue+0x2e28>
c000a0a8:	008b2583          	lw	a1,8(s6)
c000a0ac:	004b2403          	lw	s0,4(s6)
c000a0b0:	000c0513          	mv	a0,s8
c000a0b4:	985fd0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000a0b8:	00ab2223          	sw	a0,4(s6)
c000a0bc:	008b2423          	sw	s0,8(s6)
c000a0c0:	01812783          	lw	a5,24(sp)
c000a0c4:	00050463          	beqz	a0,c000a0cc <stride_dequeue+0x2244>
c000a0c8:	01652023          	sw	s6,0(a0)
c000a0cc:	008ba403          	lw	s0,8(s7)
c000a0d0:	0167a223          	sw	s6,4(a5)
c000a0d4:	01b7a423          	sw	s11,8(a5)
c000a0d8:	00fb2023          	sw	a5,0(s6)
c000a0dc:	00040c13          	mv	s8,s0
c000a0e0:	00078b13          	mv	s6,a5
c000a0e4:	8acff06f          	j	c0009190 <stride_dequeue+0x1308>
c000a0e8:	008b2503          	lw	a0,8(s6)
c000a0ec:	004b2403          	lw	s0,4(s6)
c000a0f0:	00080593          	mv	a1,a6
c000a0f4:	945fd0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000a0f8:	00ab2223          	sw	a0,4(s6)
c000a0fc:	008b2423          	sw	s0,8(s6)
c000a100:	00050463          	beqz	a0,c000a108 <stride_dequeue+0x2280>
c000a104:	01652023          	sw	s6,0(a0)
c000a108:	008bac03          	lw	s8,8(s7)
c000a10c:	c41fe06f          	j	c0008d4c <stride_dequeue+0xec4>
c000a110:	008da503          	lw	a0,8(s11)
c000a114:	004da403          	lw	s0,4(s11)
c000a118:	00078593          	mv	a1,a5
c000a11c:	91dfd0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000a120:	00ada223          	sw	a0,4(s11)
c000a124:	008da423          	sw	s0,8(s11)
c000a128:	00050463          	beqz	a0,c000a130 <stride_dequeue+0x22a8>
c000a12c:	01b52023          	sw	s11,0(a0)
c000a130:	008bac03          	lw	s8,8(s7)
c000a134:	d75fe06f          	j	c0008ea8 <stride_dequeue+0x1020>
c000a138:	00432783          	lw	a5,4(t1)
c000a13c:	00832c03          	lw	s8,8(t1)
c000a140:	00a12c23          	sw	a0,24(sp)
c000a144:	00f12a23          	sw	a5,20(sp)
c000a148:	040c0663          	beqz	s8,c000a194 <stride_dequeue+0x230c>
c000a14c:	000b0593          	mv	a1,s6
c000a150:	000c0513          	mv	a0,s8
c000a154:	00612e23          	sw	t1,28(sp)
c000a158:	855fd0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c000a15c:	01c12303          	lw	t1,28(sp)
c000a160:	01812783          	lw	a5,24(sp)
c000a164:	00612c23          	sw	t1,24(sp)
c000a168:	30f50ce3          	beq	a0,a5,c000ac80 <stride_dequeue+0x2df8>
c000a16c:	008b2583          	lw	a1,8(s6)
c000a170:	004b2403          	lw	s0,4(s6)
c000a174:	000c0513          	mv	a0,s8
c000a178:	8c1fd0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000a17c:	00ab2223          	sw	a0,4(s6)
c000a180:	008b2423          	sw	s0,8(s6)
c000a184:	01812303          	lw	t1,24(sp)
c000a188:	00050463          	beqz	a0,c000a190 <stride_dequeue+0x2308>
c000a18c:	01652023          	sw	s6,0(a0)
c000a190:	008ba403          	lw	s0,8(s7)
c000a194:	01412783          	lw	a5,20(sp)
c000a198:	01632223          	sw	s6,4(t1)
c000a19c:	00040c13          	mv	s8,s0
c000a1a0:	00f32423          	sw	a5,8(t1)
c000a1a4:	006b2023          	sw	t1,0(s6)
c000a1a8:	00030b13          	mv	s6,t1
c000a1ac:	e89fe06f          	j	c0009034 <stride_dequeue+0x11ac>
c000a1b0:	008ca503          	lw	a0,8(s9)
c000a1b4:	004cac03          	lw	s8,4(s9)
c000a1b8:	000f0593          	mv	a1,t5
c000a1bc:	03c12223          	sw	t3,36(sp)
c000a1c0:	879fd0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000a1c4:	00aca223          	sw	a0,4(s9)
c000a1c8:	018ca423          	sw	s8,8(s9)
c000a1cc:	02412e03          	lw	t3,36(sp)
c000a1d0:	00050463          	beqz	a0,c000a1d8 <stride_dequeue+0x2350>
c000a1d4:	01952023          	sw	s9,0(a0)
c000a1d8:	008bac03          	lw	s8,8(s7)
c000a1dc:	f01fd06f          	j	c00080dc <stride_dequeue+0x254>
c000a1e0:	004da703          	lw	a4,4(s11)
c000a1e4:	008da783          	lw	a5,8(s11)
c000a1e8:	00e12823          	sw	a4,16(sp)
c000a1ec:	04078063          	beqz	a5,c000a22c <stride_dequeue+0x23a4>
c000a1f0:	00078513          	mv	a0,a5
c000a1f4:	00098593          	mv	a1,s3
c000a1f8:	00f12a23          	sw	a5,20(sp)
c000a1fc:	fb0fd0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c000a200:	01412783          	lw	a5,20(sp)
c000a204:	4b8508e3          	beq	a0,s8,c000aeb4 <stride_dequeue+0x302c>
c000a208:	0089a583          	lw	a1,8(s3)
c000a20c:	0049a403          	lw	s0,4(s3)
c000a210:	00078513          	mv	a0,a5
c000a214:	825fd0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000a218:	00a9a223          	sw	a0,4(s3)
c000a21c:	0089a423          	sw	s0,8(s3)
c000a220:	00050463          	beqz	a0,c000a228 <stride_dequeue+0x23a0>
c000a224:	01352023          	sw	s3,0(a0)
c000a228:	008ba403          	lw	s0,8(s7)
c000a22c:	01012783          	lw	a5,16(sp)
c000a230:	013da223          	sw	s3,4(s11)
c000a234:	00fda423          	sw	a5,8(s11)
c000a238:	01b9a023          	sw	s11,0(s3)
c000a23c:	000d8993          	mv	s3,s11
c000a240:	9f4ff06f          	j	c0009434 <stride_dequeue+0x15ac>
c000a244:	0087a503          	lw	a0,8(a5)
c000a248:	000e0593          	mv	a1,t3
c000a24c:	0047a403          	lw	s0,4(a5)
c000a250:	00f12e23          	sw	a5,28(sp)
c000a254:	fe4fd0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000a258:	01c12783          	lw	a5,28(sp)
c000a25c:	00a7a223          	sw	a0,4(a5)
c000a260:	0087a423          	sw	s0,8(a5)
c000a264:	4a050ce3          	beqz	a0,c000af1c <stride_dequeue+0x3094>
c000a268:	00f52023          	sw	a5,0(a0)
c000a26c:	00078e13          	mv	t3,a5
c000a270:	008ba403          	lw	s0,8(s7)
c000a274:	a38ff06f          	j	c00094ac <stride_dequeue+0x1624>
c000a278:	008ea503          	lw	a0,8(t4)
c000a27c:	000f0593          	mv	a1,t5
c000a280:	004ea403          	lw	s0,4(t4)
c000a284:	03d12023          	sw	t4,32(sp)
c000a288:	fb0fd0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000a28c:	02012e83          	lw	t4,32(sp)
c000a290:	00aea223          	sw	a0,4(t4)
c000a294:	008ea423          	sw	s0,8(t4)
c000a298:	00050463          	beqz	a0,c000a2a0 <stride_dequeue+0x2418>
c000a29c:	01d52023          	sw	t4,0(a0)
c000a2a0:	008bac03          	lw	s8,8(s7)
c000a2a4:	e50fe06f          	j	c00088f4 <stride_dequeue+0xa6c>
c000a2a8:	008e2503          	lw	a0,8(t3)
c000a2ac:	00078593          	mv	a1,a5
c000a2b0:	004e2403          	lw	s0,4(t3)
c000a2b4:	03d12223          	sw	t4,36(sp)
c000a2b8:	f80fd0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000a2bc:	02012e03          	lw	t3,32(sp)
c000a2c0:	02412e83          	lw	t4,36(sp)
c000a2c4:	00ae2223          	sw	a0,4(t3)
c000a2c8:	008e2423          	sw	s0,8(t3)
c000a2cc:	00050463          	beqz	a0,c000a2d4 <stride_dequeue+0x244c>
c000a2d0:	01c52023          	sw	t3,0(a0)
c000a2d4:	008bac03          	lw	s8,8(s7)
c000a2d8:	901fe06f          	j	c0008bd8 <stride_dequeue+0xd50>
c000a2dc:	008aa503          	lw	a0,8(s5)
c000a2e0:	004aa403          	lw	s0,4(s5)
c000a2e4:	000e8593          	mv	a1,t4
c000a2e8:	03c12023          	sw	t3,32(sp)
c000a2ec:	f4cfd0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000a2f0:	00aaa223          	sw	a0,4(s5)
c000a2f4:	008aa423          	sw	s0,8(s5)
c000a2f8:	02012e03          	lw	t3,32(sp)
c000a2fc:	00050463          	beqz	a0,c000a304 <stride_dequeue+0x247c>
c000a300:	01552023          	sw	s5,0(a0)
c000a304:	008bac03          	lw	s8,8(s7)
c000a308:	c30fe06f          	j	c0008738 <stride_dequeue+0x8b0>
c000a30c:	008aa503          	lw	a0,8(s5)
c000a310:	004aa403          	lw	s0,4(s5)
c000a314:	00078593          	mv	a1,a5
c000a318:	03d12023          	sw	t4,32(sp)
c000a31c:	f1cfd0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000a320:	00aaa223          	sw	a0,4(s5)
c000a324:	008aa423          	sw	s0,8(s5)
c000a328:	02012e83          	lw	t4,32(sp)
c000a32c:	00050463          	beqz	a0,c000a334 <stride_dequeue+0x24ac>
c000a330:	01552023          	sw	s5,0(a0)
c000a334:	008bac03          	lw	s8,8(s7)
c000a338:	fe9fd06f          	j	c0008320 <stride_dequeue+0x498>
c000a33c:	008d2503          	lw	a0,8(s10)
c000a340:	004d2403          	lw	s0,4(s10)
c000a344:	000e8593          	mv	a1,t4
c000a348:	03c12023          	sw	t3,32(sp)
c000a34c:	01112e23          	sw	a7,28(sp)
c000a350:	ee8fd0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000a354:	00ad2223          	sw	a0,4(s10)
c000a358:	008d2423          	sw	s0,8(s10)
c000a35c:	01c12883          	lw	a7,28(sp)
c000a360:	02012e03          	lw	t3,32(sp)
c000a364:	00050463          	beqz	a0,c000a36c <stride_dequeue+0x24e4>
c000a368:	01a52023          	sw	s10,0(a0)
c000a36c:	008bac03          	lw	s8,8(s7)
c000a370:	9b8fe06f          	j	c0008528 <stride_dequeue+0x6a0>
c000a374:	000b0893          	mv	a7,s6
c000a378:	ee8fe06f          	j	c0008a60 <stride_dequeue+0xbd8>
c000a37c:	00030e13          	mv	t3,t1
c000a380:	ca5fe06f          	j	c0009024 <stride_dequeue+0x119c>
c000a384:	00078e13          	mv	t3,a5
c000a388:	f51fe06f          	j	c00092d8 <stride_dequeue+0x1450>
c000a38c:	000b0893          	mv	a7,s6
c000a390:	9a9fe06f          	j	c0008d38 <stride_dequeue+0xeb0>
c000a394:	00078e13          	mv	t3,a5
c000a398:	de9fe06f          	j	c0009180 <stride_dequeue+0x12f8>
c000a39c:	000d8713          	mv	a4,s11
c000a3a0:	af5fe06f          	j	c0008e94 <stride_dequeue+0x100c>
c000a3a4:	008b2503          	lw	a0,8(s6)
c000a3a8:	004b2403          	lw	s0,4(s6)
c000a3ac:	00088593          	mv	a1,a7
c000a3b0:	01012c23          	sw	a6,24(sp)
c000a3b4:	e84fd0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000a3b8:	00ab2223          	sw	a0,4(s6)
c000a3bc:	008b2423          	sw	s0,8(s6)
c000a3c0:	01812803          	lw	a6,24(sp)
c000a3c4:	00050463          	beqz	a0,c000a3cc <stride_dequeue+0x2544>
c000a3c8:	01652023          	sw	s6,0(a0)
c000a3cc:	008bac03          	lw	s8,8(s7)
c000a3d0:	000b0893          	mv	a7,s6
c000a3d4:	965fe06f          	j	c0008d38 <stride_dequeue+0xeb0>
c000a3d8:	008b2503          	lw	a0,8(s6)
c000a3dc:	004b2403          	lw	s0,4(s6)
c000a3e0:	00088593          	mv	a1,a7
c000a3e4:	01012c23          	sw	a6,24(sp)
c000a3e8:	e50fd0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000a3ec:	00ab2223          	sw	a0,4(s6)
c000a3f0:	008b2423          	sw	s0,8(s6)
c000a3f4:	01812803          	lw	a6,24(sp)
c000a3f8:	00050463          	beqz	a0,c000a400 <stride_dequeue+0x2578>
c000a3fc:	01652023          	sw	s6,0(a0)
c000a400:	008bac03          	lw	s8,8(s7)
c000a404:	000b0893          	mv	a7,s6
c000a408:	e58fe06f          	j	c0008a60 <stride_dequeue+0xbd8>
c000a40c:	008da503          	lw	a0,8(s11)
c000a410:	004da403          	lw	s0,4(s11)
c000a414:	00070593          	mv	a1,a4
c000a418:	00f12c23          	sw	a5,24(sp)
c000a41c:	e1cfd0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000a420:	00ada223          	sw	a0,4(s11)
c000a424:	008da423          	sw	s0,8(s11)
c000a428:	01812783          	lw	a5,24(sp)
c000a42c:	00050463          	beqz	a0,c000a434 <stride_dequeue+0x25ac>
c000a430:	01b52023          	sw	s11,0(a0)
c000a434:	008bac03          	lw	s8,8(s7)
c000a438:	000d8713          	mv	a4,s11
c000a43c:	a59fe06f          	j	c0008e94 <stride_dequeue+0x100c>
c000a440:	008c2503          	lw	a0,8(s8)
c000a444:	004c2403          	lw	s0,4(s8)
c000a448:	000d8593          	mv	a1,s11
c000a44c:	decfd0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000a450:	00ac2223          	sw	a0,4(s8)
c000a454:	008c2423          	sw	s0,8(s8)
c000a458:	300506e3          	beqz	a0,c000af64 <stride_dequeue+0x30dc>
c000a45c:	01852023          	sw	s8,0(a0)
c000a460:	000c0d93          	mv	s11,s8
c000a464:	008ba403          	lw	s0,8(s7)
c000a468:	a04ff06f          	j	c000966c <stride_dequeue+0x17e4>
c000a46c:	0087a503          	lw	a0,8(a5)
c000a470:	000e0593          	mv	a1,t3
c000a474:	0047a403          	lw	s0,4(a5)
c000a478:	dc0fd0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000a47c:	01c12783          	lw	a5,28(sp)
c000a480:	00a7a223          	sw	a0,4(a5)
c000a484:	0087a423          	sw	s0,8(a5)
c000a488:	00050463          	beqz	a0,c000a490 <stride_dequeue+0x2608>
c000a48c:	00f52023          	sw	a5,0(a0)
c000a490:	008bac03          	lw	s8,8(s7)
c000a494:	00078e13          	mv	t3,a5
c000a498:	ce9fe06f          	j	c0009180 <stride_dequeue+0x12f8>
c000a49c:	0087a503          	lw	a0,8(a5)
c000a4a0:	000e0593          	mv	a1,t3
c000a4a4:	0047a403          	lw	s0,4(a5)
c000a4a8:	d90fd0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000a4ac:	01c12783          	lw	a5,28(sp)
c000a4b0:	00a7a223          	sw	a0,4(a5)
c000a4b4:	0087a423          	sw	s0,8(a5)
c000a4b8:	00050463          	beqz	a0,c000a4c0 <stride_dequeue+0x2638>
c000a4bc:	00f52023          	sw	a5,0(a0)
c000a4c0:	008bac03          	lw	s8,8(s7)
c000a4c4:	00078e13          	mv	t3,a5
c000a4c8:	e11fe06f          	j	c00092d8 <stride_dequeue+0x1450>
c000a4cc:	008c2503          	lw	a0,8(s8)
c000a4d0:	004c2403          	lw	s0,4(s8)
c000a4d4:	000e0593          	mv	a1,t3
c000a4d8:	d60fd0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000a4dc:	00ac2223          	sw	a0,4(s8)
c000a4e0:	008c2423          	sw	s0,8(s8)
c000a4e4:	220506e3          	beqz	a0,c000af10 <stride_dequeue+0x3088>
c000a4e8:	01852023          	sw	s8,0(a0)
c000a4ec:	000c0e13          	mv	t3,s8
c000a4f0:	008ba403          	lw	s0,8(s7)
c000a4f4:	b34ff06f          	j	c0009828 <stride_dequeue+0x19a0>
c000a4f8:	008da503          	lw	a0,8(s11)
c000a4fc:	004da403          	lw	s0,4(s11)
c000a500:	000a8593          	mv	a1,s5
c000a504:	01c12e23          	sw	t3,28(sp)
c000a508:	d30fd0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000a50c:	00ada223          	sw	a0,4(s11)
c000a510:	008da423          	sw	s0,8(s11)
c000a514:	01c12e03          	lw	t3,28(sp)
c000a518:	24050ce3          	beqz	a0,c000af70 <stride_dequeue+0x30e8>
c000a51c:	01b52023          	sw	s11,0(a0)
c000a520:	000d8a93          	mv	s5,s11
c000a524:	008ba403          	lw	s0,8(s7)
c000a528:	d3cff06f          	j	c0009a64 <stride_dequeue+0x1bdc>
c000a52c:	008c2503          	lw	a0,8(s8)
c000a530:	004c2403          	lw	s0,4(s8)
c000a534:	00088593          	mv	a1,a7
c000a538:	d00fd0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000a53c:	00ac2223          	sw	a0,4(s8)
c000a540:	008c2423          	sw	s0,8(s8)
c000a544:	1e0502e3          	beqz	a0,c000af28 <stride_dequeue+0x30a0>
c000a548:	01852023          	sw	s8,0(a0)
c000a54c:	000c0893          	mv	a7,s8
c000a550:	008ba403          	lw	s0,8(s7)
c000a554:	b48ff06f          	j	c000989c <stride_dequeue+0x1a14>
c000a558:	00832503          	lw	a0,8(t1)
c000a55c:	000e0593          	mv	a1,t3
c000a560:	00432403          	lw	s0,4(t1)
c000a564:	00612c23          	sw	t1,24(sp)
c000a568:	cd0fd0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000a56c:	01812303          	lw	t1,24(sp)
c000a570:	00a32223          	sw	a0,4(t1)
c000a574:	00832423          	sw	s0,8(t1)
c000a578:	00050463          	beqz	a0,c000a580 <stride_dequeue+0x26f8>
c000a57c:	00652023          	sw	t1,0(a0)
c000a580:	008bac03          	lw	s8,8(s7)
c000a584:	00030e13          	mv	t3,t1
c000a588:	a9dfe06f          	j	c0009024 <stride_dequeue+0x119c>
c000a58c:	008ca503          	lw	a0,8(s9)
c000a590:	004cac03          	lw	s8,4(s9)
c000a594:	000f8593          	mv	a1,t6
c000a598:	03e12623          	sw	t5,44(sp)
c000a59c:	03c12423          	sw	t3,40(sp)
c000a5a0:	c98fd0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000a5a4:	00aca223          	sw	a0,4(s9)
c000a5a8:	018ca423          	sw	s8,8(s9)
c000a5ac:	02812e03          	lw	t3,40(sp)
c000a5b0:	02c12f03          	lw	t5,44(sp)
c000a5b4:	00050463          	beqz	a0,c000a5bc <stride_dequeue+0x2734>
c000a5b8:	01952023          	sw	s9,0(a0)
c000a5bc:	008bac03          	lw	s8,8(s7)
c000a5c0:	b09fd06f          	j	c00080c8 <stride_dequeue+0x240>
c000a5c4:	008ba403          	lw	s0,8(s7)
c000a5c8:	000d8c13          	mv	s8,s11
c000a5cc:	e59fe06f          	j	c0009424 <stride_dequeue+0x159c>
c000a5d0:	008ba403          	lw	s0,8(s7)
c000a5d4:	000a8f13          	mv	t5,s5
c000a5d8:	d35fd06f          	j	c000830c <stride_dequeue+0x484>
c000a5dc:	008ba403          	lw	s0,8(s7)
c000a5e0:	000d0f13          	mv	t5,s10
c000a5e4:	f31fd06f          	j	c0008514 <stride_dequeue+0x68c>
c000a5e8:	008da503          	lw	a0,8(s11)
c000a5ec:	004da403          	lw	s0,4(s11)
c000a5f0:	000c0593          	mv	a1,s8
c000a5f4:	c44fd0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000a5f8:	00ada223          	sw	a0,4(s11)
c000a5fc:	008da423          	sw	s0,8(s11)
c000a600:	fc0502e3          	beqz	a0,c000a5c4 <stride_dequeue+0x273c>
c000a604:	01b52023          	sw	s11,0(a0)
c000a608:	000d8c13          	mv	s8,s11
c000a60c:	008ba403          	lw	s0,8(s7)
c000a610:	e15fe06f          	j	c0009424 <stride_dequeue+0x159c>
c000a614:	008ba403          	lw	s0,8(s7)
c000a618:	000e8c13          	mv	s8,t4
c000a61c:	ac0fe06f          	j	c00088dc <stride_dequeue+0xa54>
c000a620:	008ba403          	lw	s0,8(s7)
c000a624:	000e0f13          	mv	t5,t3
c000a628:	d9cfe06f          	j	c0008bc4 <stride_dequeue+0xd3c>
c000a62c:	008ba403          	lw	s0,8(s7)
c000a630:	000a8f13          	mv	t5,s5
c000a634:	8f0fe06f          	j	c0008724 <stride_dequeue+0x89c>
c000a638:	008c2503          	lw	a0,8(s8)
c000a63c:	004c2403          	lw	s0,4(s8)
c000a640:	000d0593          	mv	a1,s10
c000a644:	bf4fd0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000a648:	00ac2223          	sw	a0,4(s8)
c000a64c:	008c2423          	sw	s0,8(s8)
c000a650:	1a0504e3          	beqz	a0,c000aff8 <stride_dequeue+0x3170>
c000a654:	01852023          	sw	s8,0(a0)
c000a658:	000c0d13          	mv	s10,s8
c000a65c:	008ba403          	lw	s0,8(s7)
c000a660:	c6cff06f          	j	c0009acc <stride_dequeue+0x1c44>
c000a664:	008c2503          	lw	a0,8(s8)
c000a668:	004c2403          	lw	s0,4(s8)
c000a66c:	000d8593          	mv	a1,s11
c000a670:	bc8fd0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000a674:	00ac2223          	sw	a0,4(s8)
c000a678:	008c2423          	sw	s0,8(s8)
c000a67c:	420502e3          	beqz	a0,c000b2a0 <stride_dequeue+0x3418>
c000a680:	01852023          	sw	s8,0(a0)
c000a684:	000c0d93          	mv	s11,s8
c000a688:	008ba403          	lw	s0,8(s7)
c000a68c:	ca8ff06f          	j	c0009b34 <stride_dequeue+0x1cac>
c000a690:	008c2503          	lw	a0,8(s8)
c000a694:	004c2403          	lw	s0,4(s8)
c000a698:	000d8593          	mv	a1,s11
c000a69c:	b9cfd0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000a6a0:	00ac2223          	sw	a0,4(s8)
c000a6a4:	008c2423          	sw	s0,8(s8)
c000a6a8:	24050ae3          	beqz	a0,c000b0fc <stride_dequeue+0x3274>
c000a6ac:	01852023          	sw	s8,0(a0)
c000a6b0:	000c0d93          	mv	s11,s8
c000a6b4:	008ba403          	lw	s0,8(s7)
c000a6b8:	ce4ff06f          	j	c0009b9c <stride_dequeue+0x1d14>
c000a6bc:	00003697          	auipc	a3,0x3
c000a6c0:	6b468693          	addi	a3,a3,1716 # c000dd70 <default_pmm_manager+0xbb4>
c000a6c4:	00002617          	auipc	a2,0x2
c000a6c8:	ab460613          	addi	a2,a2,-1356 # c000c178 <commands+0x3d8>
c000a6cc:	06300593          	li	a1,99
c000a6d0:	00003517          	auipc	a0,0x3
c000a6d4:	6c450513          	addi	a0,a0,1732 # c000dd94 <default_pmm_manager+0xbd8>
c000a6d8:	b79f50ef          	jal	ra,c0000250 <__panic>
c000a6dc:	008ba403          	lw	s0,8(s7)
c000a6e0:	000b0e13          	mv	t3,s6
c000a6e4:	e44fe06f          	j	c0008d28 <stride_dequeue+0xea0>
c000a6e8:	008ba403          	lw	s0,8(s7)
c000a6ec:	000b0e13          	mv	t3,s6
c000a6f0:	b60fe06f          	j	c0008a50 <stride_dequeue+0xbc8>
c000a6f4:	008ba403          	lw	s0,8(s7)
c000a6f8:	00078c13          	mv	s8,a5
c000a6fc:	a71fe06f          	j	c000916c <stride_dequeue+0x12e4>
c000a700:	008aa503          	lw	a0,8(s5)
c000a704:	004aa403          	lw	s0,4(s5)
c000a708:	000f0593          	mv	a1,t5
c000a70c:	03d12223          	sw	t4,36(sp)
c000a710:	03c12023          	sw	t3,32(sp)
c000a714:	b24fd0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000a718:	00aaa223          	sw	a0,4(s5)
c000a71c:	008aa423          	sw	s0,8(s5)
c000a720:	02012e03          	lw	t3,32(sp)
c000a724:	02412e83          	lw	t4,36(sp)
c000a728:	f00502e3          	beqz	a0,c000a62c <stride_dequeue+0x27a4>
c000a72c:	01552023          	sw	s5,0(a0)
c000a730:	000a8f13          	mv	t5,s5
c000a734:	008ba403          	lw	s0,8(s7)
c000a738:	fedfd06f          	j	c0008724 <stride_dequeue+0x89c>
c000a73c:	008e2503          	lw	a0,8(t3)
c000a740:	000f0593          	mv	a1,t5
c000a744:	004e2403          	lw	s0,4(t3)
c000a748:	af0fd0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000a74c:	02012e03          	lw	t3,32(sp)
c000a750:	02412e83          	lw	t4,36(sp)
c000a754:	02812783          	lw	a5,40(sp)
c000a758:	00ae2223          	sw	a0,4(t3)
c000a75c:	008e2423          	sw	s0,8(t3)
c000a760:	ec0500e3          	beqz	a0,c000a620 <stride_dequeue+0x2798>
c000a764:	01c52023          	sw	t3,0(a0)
c000a768:	000e0f13          	mv	t5,t3
c000a76c:	008ba403          	lw	s0,8(s7)
c000a770:	c54fe06f          	j	c0008bc4 <stride_dequeue+0xd3c>
c000a774:	008d2503          	lw	a0,8(s10)
c000a778:	004d2403          	lw	s0,4(s10)
c000a77c:	000f0593          	mv	a1,t5
c000a780:	03d12223          	sw	t4,36(sp)
c000a784:	03c12023          	sw	t3,32(sp)
c000a788:	01112e23          	sw	a7,28(sp)
c000a78c:	aacfd0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000a790:	00ad2223          	sw	a0,4(s10)
c000a794:	008d2423          	sw	s0,8(s10)
c000a798:	01c12883          	lw	a7,28(sp)
c000a79c:	02012e03          	lw	t3,32(sp)
c000a7a0:	02412e83          	lw	t4,36(sp)
c000a7a4:	e2050ce3          	beqz	a0,c000a5dc <stride_dequeue+0x2754>
c000a7a8:	01a52023          	sw	s10,0(a0)
c000a7ac:	000d0f13          	mv	t5,s10
c000a7b0:	008ba403          	lw	s0,8(s7)
c000a7b4:	d61fd06f          	j	c0008514 <stride_dequeue+0x68c>
c000a7b8:	008ba403          	lw	s0,8(s7)
c000a7bc:	00030c13          	mv	s8,t1
c000a7c0:	851fe06f          	j	c0009010 <stride_dequeue+0x1188>
c000a7c4:	008ba403          	lw	s0,8(s7)
c000a7c8:	00078c13          	mv	s8,a5
c000a7cc:	af9fe06f          	j	c00092c4 <stride_dequeue+0x143c>
c000a7d0:	008ba403          	lw	s0,8(s7)
c000a7d4:	000d8e13          	mv	t3,s11
c000a7d8:	eacfe06f          	j	c0008e84 <stride_dequeue+0xffc>
c000a7dc:	008ea503          	lw	a0,8(t4)
c000a7e0:	000c0593          	mv	a1,s8
c000a7e4:	004ea403          	lw	s0,4(t4)
c000a7e8:	03e12423          	sw	t5,40(sp)
c000a7ec:	03d12223          	sw	t4,36(sp)
c000a7f0:	a48fd0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000a7f4:	02412e83          	lw	t4,36(sp)
c000a7f8:	02812f03          	lw	t5,40(sp)
c000a7fc:	00aea223          	sw	a0,4(t4)
c000a800:	008ea423          	sw	s0,8(t4)
c000a804:	e00508e3          	beqz	a0,c000a614 <stride_dequeue+0x278c>
c000a808:	01d52023          	sw	t4,0(a0)
c000a80c:	000e8c13          	mv	s8,t4
c000a810:	008ba403          	lw	s0,8(s7)
c000a814:	8c8fe06f          	j	c00088dc <stride_dequeue+0xa54>
c000a818:	008aa503          	lw	a0,8(s5)
c000a81c:	004aa403          	lw	s0,4(s5)
c000a820:	000f0593          	mv	a1,t5
c000a824:	02f12223          	sw	a5,36(sp)
c000a828:	03d12023          	sw	t4,32(sp)
c000a82c:	a0cfd0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000a830:	00aaa223          	sw	a0,4(s5)
c000a834:	008aa423          	sw	s0,8(s5)
c000a838:	02012e83          	lw	t4,32(sp)
c000a83c:	02412783          	lw	a5,36(sp)
c000a840:	d80508e3          	beqz	a0,c000a5d0 <stride_dequeue+0x2748>
c000a844:	01552023          	sw	s5,0(a0)
c000a848:	000a8f13          	mv	t5,s5
c000a84c:	008ba403          	lw	s0,8(s7)
c000a850:	abdfd06f          	j	c000830c <stride_dequeue+0x484>
c000a854:	000c0f13          	mv	t5,s8
c000a858:	fc1fe06f          	j	c0009818 <stride_dequeue+0x1990>
c000a85c:	000c0f13          	mv	t5,s8
c000a860:	dfdfe06f          	j	c000965c <stride_dequeue+0x17d4>
c000a864:	000d8c13          	mv	s8,s11
c000a868:	9ecff06f          	j	c0009a54 <stride_dequeue+0x1bcc>
c000a86c:	004da703          	lw	a4,4(s11)
c000a870:	008da783          	lw	a5,8(s11)
c000a874:	02a12623          	sw	a0,44(sp)
c000a878:	02e12023          	sw	a4,32(sp)
c000a87c:	04078a63          	beqz	a5,c000a8d0 <stride_dequeue+0x2a48>
c000a880:	00078513          	mv	a0,a5
c000a884:	000c0593          	mv	a1,s8
c000a888:	03c12423          	sw	t3,40(sp)
c000a88c:	02f12223          	sw	a5,36(sp)
c000a890:	91cfd0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c000a894:	02c12703          	lw	a4,44(sp)
c000a898:	02412783          	lw	a5,36(sp)
c000a89c:	02812e03          	lw	t3,40(sp)
c000a8a0:	1ce506e3          	beq	a0,a4,c000b26c <stride_dequeue+0x33e4>
c000a8a4:	008c2583          	lw	a1,8(s8)
c000a8a8:	004c2403          	lw	s0,4(s8)
c000a8ac:	00078513          	mv	a0,a5
c000a8b0:	03c12223          	sw	t3,36(sp)
c000a8b4:	984fd0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000a8b8:	00ac2223          	sw	a0,4(s8)
c000a8bc:	008c2423          	sw	s0,8(s8)
c000a8c0:	02412e03          	lw	t3,36(sp)
c000a8c4:	00050463          	beqz	a0,c000a8cc <stride_dequeue+0x2a44>
c000a8c8:	01852023          	sw	s8,0(a0)
c000a8cc:	008ba403          	lw	s0,8(s7)
c000a8d0:	02012783          	lw	a5,32(sp)
c000a8d4:	018da223          	sw	s8,4(s11)
c000a8d8:	00fda423          	sw	a5,8(s11)
c000a8dc:	01bc2023          	sw	s11,0(s8)
c000a8e0:	000d8c13          	mv	s8,s11
c000a8e4:	970ff06f          	j	c0009a54 <stride_dequeue+0x1bcc>
c000a8e8:	008b2503          	lw	a0,8(s6)
c000a8ec:	004b2403          	lw	s0,4(s6)
c000a8f0:	000e0593          	mv	a1,t3
c000a8f4:	01112e23          	sw	a7,28(sp)
c000a8f8:	01012c23          	sw	a6,24(sp)
c000a8fc:	93cfd0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000a900:	00ab2223          	sw	a0,4(s6)
c000a904:	008b2423          	sw	s0,8(s6)
c000a908:	01812803          	lw	a6,24(sp)
c000a90c:	01c12883          	lw	a7,28(sp)
c000a910:	dc050ce3          	beqz	a0,c000a6e8 <stride_dequeue+0x2860>
c000a914:	01652023          	sw	s6,0(a0)
c000a918:	000b0e13          	mv	t3,s6
c000a91c:	008ba403          	lw	s0,8(s7)
c000a920:	930fe06f          	j	c0008a50 <stride_dequeue+0xbc8>
c000a924:	008da503          	lw	a0,8(s11)
c000a928:	004da403          	lw	s0,4(s11)
c000a92c:	000e0593          	mv	a1,t3
c000a930:	00e12e23          	sw	a4,28(sp)
c000a934:	00f12c23          	sw	a5,24(sp)
c000a938:	900fd0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000a93c:	00ada223          	sw	a0,4(s11)
c000a940:	008da423          	sw	s0,8(s11)
c000a944:	01812783          	lw	a5,24(sp)
c000a948:	01c12703          	lw	a4,28(sp)
c000a94c:	e80502e3          	beqz	a0,c000a7d0 <stride_dequeue+0x2948>
c000a950:	01b52023          	sw	s11,0(a0)
c000a954:	000d8e13          	mv	t3,s11
c000a958:	008ba403          	lw	s0,8(s7)
c000a95c:	d28fe06f          	j	c0008e84 <stride_dequeue+0xffc>
c000a960:	004c2783          	lw	a5,4(s8)
c000a964:	008c2d83          	lw	s11,8(s8)
c000a968:	02a12623          	sw	a0,44(sp)
c000a96c:	02f12023          	sw	a5,32(sp)
c000a970:	040d8e63          	beqz	s11,c000a9cc <stride_dequeue+0x2b44>
c000a974:	000f0593          	mv	a1,t5
c000a978:	000d8513          	mv	a0,s11
c000a97c:	03c12423          	sw	t3,40(sp)
c000a980:	03e12223          	sw	t5,36(sp)
c000a984:	828fd0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c000a988:	02c12f83          	lw	t6,44(sp)
c000a98c:	02412f03          	lw	t5,36(sp)
c000a990:	02812e03          	lw	t3,40(sp)
c000a994:	63f50863          	beq	a0,t6,c000afc4 <stride_dequeue+0x313c>
c000a998:	008f2583          	lw	a1,8(t5)
c000a99c:	000d8513          	mv	a0,s11
c000a9a0:	004f2403          	lw	s0,4(t5)
c000a9a4:	03c12423          	sw	t3,40(sp)
c000a9a8:	03e12223          	sw	t5,36(sp)
c000a9ac:	88cfd0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000a9b0:	02412f03          	lw	t5,36(sp)
c000a9b4:	02812e03          	lw	t3,40(sp)
c000a9b8:	00af2223          	sw	a0,4(t5)
c000a9bc:	008f2423          	sw	s0,8(t5)
c000a9c0:	00050463          	beqz	a0,c000a9c8 <stride_dequeue+0x2b40>
c000a9c4:	01e52023          	sw	t5,0(a0)
c000a9c8:	008ba403          	lw	s0,8(s7)
c000a9cc:	02012783          	lw	a5,32(sp)
c000a9d0:	01ec2223          	sw	t5,4(s8)
c000a9d4:	00fc2423          	sw	a5,8(s8)
c000a9d8:	018f2023          	sw	s8,0(t5)
c000a9dc:	000c0f13          	mv	t5,s8
c000a9e0:	e39fe06f          	j	c0009818 <stride_dequeue+0x1990>
c000a9e4:	0087a503          	lw	a0,8(a5)
c000a9e8:	000c0593          	mv	a1,s8
c000a9ec:	0047a403          	lw	s0,4(a5)
c000a9f0:	848fd0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000a9f4:	02012783          	lw	a5,32(sp)
c000a9f8:	02412e03          	lw	t3,36(sp)
c000a9fc:	00a7a223          	sw	a0,4(a5)
c000aa00:	0087a423          	sw	s0,8(a5)
c000aa04:	ce0508e3          	beqz	a0,c000a6f4 <stride_dequeue+0x286c>
c000aa08:	00f52023          	sw	a5,0(a0)
c000aa0c:	00078c13          	mv	s8,a5
c000aa10:	008ba403          	lw	s0,8(s7)
c000aa14:	f58fe06f          	j	c000916c <stride_dequeue+0x12e4>
c000aa18:	004c2703          	lw	a4,4(s8)
c000aa1c:	008c2783          	lw	a5,8(s8)
c000aa20:	02a12623          	sw	a0,44(sp)
c000aa24:	02e12023          	sw	a4,32(sp)
c000aa28:	04078a63          	beqz	a5,c000aa7c <stride_dequeue+0x2bf4>
c000aa2c:	000f0593          	mv	a1,t5
c000aa30:	00078513          	mv	a0,a5
c000aa34:	03e12423          	sw	t5,40(sp)
c000aa38:	02f12223          	sw	a5,36(sp)
c000aa3c:	f71fc0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c000aa40:	02c12f83          	lw	t6,44(sp)
c000aa44:	02412783          	lw	a5,36(sp)
c000aa48:	02812f03          	lw	t5,40(sp)
c000aa4c:	5ff50a63          	beq	a0,t6,c000b040 <stride_dequeue+0x31b8>
c000aa50:	008f2583          	lw	a1,8(t5)
c000aa54:	00078513          	mv	a0,a5
c000aa58:	004f2403          	lw	s0,4(t5)
c000aa5c:	03e12223          	sw	t5,36(sp)
c000aa60:	fd9fc0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000aa64:	02412f03          	lw	t5,36(sp)
c000aa68:	00af2223          	sw	a0,4(t5)
c000aa6c:	008f2423          	sw	s0,8(t5)
c000aa70:	00050463          	beqz	a0,c000aa78 <stride_dequeue+0x2bf0>
c000aa74:	01e52023          	sw	t5,0(a0)
c000aa78:	008ba403          	lw	s0,8(s7)
c000aa7c:	02012783          	lw	a5,32(sp)
c000aa80:	01ec2223          	sw	t5,4(s8)
c000aa84:	00fc2423          	sw	a5,8(s8)
c000aa88:	018f2023          	sw	s8,0(t5)
c000aa8c:	000c0f13          	mv	t5,s8
c000aa90:	bcdfe06f          	j	c000965c <stride_dequeue+0x17d4>
c000aa94:	008ba403          	lw	s0,8(s7)
c000aa98:	000d8893          	mv	a7,s11
c000aa9c:	979fe06f          	j	c0009414 <stride_dequeue+0x158c>
c000aaa0:	00832503          	lw	a0,8(t1)
c000aaa4:	000c0593          	mv	a1,s8
c000aaa8:	00432403          	lw	s0,4(t1)
c000aaac:	03c12023          	sw	t3,32(sp)
c000aab0:	00612e23          	sw	t1,28(sp)
c000aab4:	f85fc0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000aab8:	01c12303          	lw	t1,28(sp)
c000aabc:	02012e03          	lw	t3,32(sp)
c000aac0:	00a32223          	sw	a0,4(t1)
c000aac4:	00832423          	sw	s0,8(t1)
c000aac8:	ce0508e3          	beqz	a0,c000a7b8 <stride_dequeue+0x2930>
c000aacc:	00652023          	sw	t1,0(a0)
c000aad0:	00030c13          	mv	s8,t1
c000aad4:	008ba403          	lw	s0,8(s7)
c000aad8:	d38fe06f          	j	c0009010 <stride_dequeue+0x1188>
c000aadc:	008b2503          	lw	a0,8(s6)
c000aae0:	004b2403          	lw	s0,4(s6)
c000aae4:	000e0593          	mv	a1,t3
c000aae8:	01112e23          	sw	a7,28(sp)
c000aaec:	01012c23          	sw	a6,24(sp)
c000aaf0:	f49fc0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000aaf4:	00ab2223          	sw	a0,4(s6)
c000aaf8:	008b2423          	sw	s0,8(s6)
c000aafc:	01812803          	lw	a6,24(sp)
c000ab00:	01c12883          	lw	a7,28(sp)
c000ab04:	bc050ce3          	beqz	a0,c000a6dc <stride_dequeue+0x2854>
c000ab08:	01652023          	sw	s6,0(a0)
c000ab0c:	000b0e13          	mv	t3,s6
c000ab10:	008ba403          	lw	s0,8(s7)
c000ab14:	a14fe06f          	j	c0008d28 <stride_dequeue+0xea0>
c000ab18:	0087a503          	lw	a0,8(a5)
c000ab1c:	000c0593          	mv	a1,s8
c000ab20:	0047a403          	lw	s0,4(a5)
c000ab24:	f15fc0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000ab28:	02012783          	lw	a5,32(sp)
c000ab2c:	02412e03          	lw	t3,36(sp)
c000ab30:	00a7a223          	sw	a0,4(a5)
c000ab34:	0087a423          	sw	s0,8(a5)
c000ab38:	c80506e3          	beqz	a0,c000a7c4 <stride_dequeue+0x293c>
c000ab3c:	00f52023          	sw	a5,0(a0)
c000ab40:	00078c13          	mv	s8,a5
c000ab44:	008ba403          	lw	s0,8(s7)
c000ab48:	f7cfe06f          	j	c00092c4 <stride_dequeue+0x143c>
c000ab4c:	004c2703          	lw	a4,4(s8)
c000ab50:	008c2783          	lw	a5,8(s8)
c000ab54:	02a12623          	sw	a0,44(sp)
c000ab58:	02e12023          	sw	a4,32(sp)
c000ab5c:	04078a63          	beqz	a5,c000abb0 <stride_dequeue+0x2d28>
c000ab60:	000e8593          	mv	a1,t4
c000ab64:	00078513          	mv	a0,a5
c000ab68:	03d12423          	sw	t4,40(sp)
c000ab6c:	02f12223          	sw	a5,36(sp)
c000ab70:	e3dfc0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c000ab74:	02c12f83          	lw	t6,44(sp)
c000ab78:	02412783          	lw	a5,36(sp)
c000ab7c:	02812e83          	lw	t4,40(sp)
c000ab80:	3ff50e63          	beq	a0,t6,c000af7c <stride_dequeue+0x30f4>
c000ab84:	008ea583          	lw	a1,8(t4)
c000ab88:	00078513          	mv	a0,a5
c000ab8c:	004ea403          	lw	s0,4(t4)
c000ab90:	03d12223          	sw	t4,36(sp)
c000ab94:	ea5fc0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000ab98:	02412e83          	lw	t4,36(sp)
c000ab9c:	00aea223          	sw	a0,4(t4)
c000aba0:	008ea423          	sw	s0,8(t4)
c000aba4:	00050463          	beqz	a0,c000abac <stride_dequeue+0x2d24>
c000aba8:	01d52023          	sw	t4,0(a0)
c000abac:	008ba403          	lw	s0,8(s7)
c000abb0:	02012783          	lw	a5,32(sp)
c000abb4:	01dc2223          	sw	t4,4(s8)
c000abb8:	00fc2423          	sw	a5,8(s8)
c000abbc:	018ea023          	sw	s8,0(t4)
c000abc0:	000c0e93          	mv	t4,s8
c000abc4:	ba4ff06f          	j	c0009f68 <stride_dequeue+0x20e0>
c000abc8:	0087a503          	lw	a0,8(a5)
c000abcc:	000d8593          	mv	a1,s11
c000abd0:	0047a403          	lw	s0,4(a5)
c000abd4:	03d12023          	sw	t4,32(sp)
c000abd8:	00f12e23          	sw	a5,28(sp)
c000abdc:	e5dfc0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000abe0:	01c12783          	lw	a5,28(sp)
c000abe4:	02012e83          	lw	t4,32(sp)
c000abe8:	00a7a223          	sw	a0,4(a5)
c000abec:	0087a423          	sw	s0,8(a5)
c000abf0:	3a050e63          	beqz	a0,c000afac <stride_dequeue+0x3124>
c000abf4:	00f52023          	sw	a5,0(a0)
c000abf8:	00078d93          	mv	s11,a5
c000abfc:	008ba403          	lw	s0,8(s7)
c000ac00:	848ff06f          	j	c0009c48 <stride_dequeue+0x1dc0>
c000ac04:	004da783          	lw	a5,4(s11)
c000ac08:	008dac03          	lw	s8,8(s11)
c000ac0c:	02a12623          	sw	a0,44(sp)
c000ac10:	02f12023          	sw	a5,32(sp)
c000ac14:	040c0a63          	beqz	s8,c000ac68 <stride_dequeue+0x2de0>
c000ac18:	000e8593          	mv	a1,t4
c000ac1c:	000c0513          	mv	a0,s8
c000ac20:	d8dfc0ef          	jal	ra,c00079ac <proc_stride_comp_f>
c000ac24:	02c12703          	lw	a4,44(sp)
c000ac28:	02412e83          	lw	t4,36(sp)
c000ac2c:	02812e03          	lw	t3,40(sp)
c000ac30:	50e50863          	beq	a0,a4,c000b140 <stride_dequeue+0x32b8>
c000ac34:	008ea583          	lw	a1,8(t4)
c000ac38:	000c0513          	mv	a0,s8
c000ac3c:	004ea403          	lw	s0,4(t4)
c000ac40:	03c12423          	sw	t3,40(sp)
c000ac44:	03d12223          	sw	t4,36(sp)
c000ac48:	df1fc0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000ac4c:	02412e83          	lw	t4,36(sp)
c000ac50:	02812e03          	lw	t3,40(sp)
c000ac54:	00aea223          	sw	a0,4(t4)
c000ac58:	008ea423          	sw	s0,8(t4)
c000ac5c:	00050463          	beqz	a0,c000ac64 <stride_dequeue+0x2ddc>
c000ac60:	01d52023          	sw	t4,0(a0)
c000ac64:	008ba403          	lw	s0,8(s7)
c000ac68:	02012783          	lw	a5,32(sp)
c000ac6c:	01dda223          	sw	t4,4(s11)
c000ac70:	00fda423          	sw	a5,8(s11)
c000ac74:	01bea023          	sw	s11,0(t4)
c000ac78:	000d8e93          	mv	t4,s11
c000ac7c:	96cff06f          	j	c0009de8 <stride_dequeue+0x1f60>
c000ac80:	008c2503          	lw	a0,8(s8)
c000ac84:	004c2403          	lw	s0,4(s8)
c000ac88:	000b0593          	mv	a1,s6
c000ac8c:	dadfc0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000ac90:	00ac2223          	sw	a0,4(s8)
c000ac94:	008c2423          	sw	s0,8(s8)
c000ac98:	01812303          	lw	t1,24(sp)
c000ac9c:	44050a63          	beqz	a0,c000b0f0 <stride_dequeue+0x3268>
c000aca0:	01852023          	sw	s8,0(a0)
c000aca4:	000c0b13          	mv	s6,s8
c000aca8:	008ba403          	lw	s0,8(s7)
c000acac:	ce8ff06f          	j	c000a194 <stride_dequeue+0x230c>
c000acb0:	008c2503          	lw	a0,8(s8)
c000acb4:	004c2403          	lw	s0,4(s8)
c000acb8:	000b0593          	mv	a1,s6
c000acbc:	d7dfc0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000acc0:	00ac2223          	sw	a0,4(s8)
c000acc4:	008c2423          	sw	s0,8(s8)
c000acc8:	01812783          	lw	a5,24(sp)
c000accc:	3a050263          	beqz	a0,c000b070 <stride_dequeue+0x31e8>
c000acd0:	01852023          	sw	s8,0(a0)
c000acd4:	000c0b13          	mv	s6,s8
c000acd8:	008ba403          	lw	s0,8(s7)
c000acdc:	bf4ff06f          	j	c000a0d0 <stride_dequeue+0x2248>
c000ace0:	008c2503          	lw	a0,8(s8)
c000ace4:	004c2403          	lw	s0,4(s8)
c000ace8:	000b0593          	mv	a1,s6
c000acec:	d4dfc0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000acf0:	00ac2223          	sw	a0,4(s8)
c000acf4:	008c2423          	sw	s0,8(s8)
c000acf8:	01812783          	lw	a5,24(sp)
c000acfc:	5e050463          	beqz	a0,c000b2e4 <stride_dequeue+0x345c>
c000ad00:	01852023          	sw	s8,0(a0)
c000ad04:	000c0b13          	mv	s6,s8
c000ad08:	008ba403          	lw	s0,8(s7)
c000ad0c:	b54ff06f          	j	c000a060 <stride_dequeue+0x21d8>
c000ad10:	008da503          	lw	a0,8(s11)
c000ad14:	004da403          	lw	s0,4(s11)
c000ad18:	00088593          	mv	a1,a7
c000ad1c:	d1dfc0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000ad20:	00ada223          	sw	a0,4(s11)
c000ad24:	008da423          	sw	s0,8(s11)
c000ad28:	d60506e3          	beqz	a0,c000aa94 <stride_dequeue+0x2c0c>
c000ad2c:	01b52023          	sw	s11,0(a0)
c000ad30:	000d8893          	mv	a7,s11
c000ad34:	008ba403          	lw	s0,8(s7)
c000ad38:	edcfe06f          	j	c0009414 <stride_dequeue+0x158c>
c000ad3c:	008c2503          	lw	a0,8(s8)
c000ad40:	02012583          	lw	a1,32(sp)
c000ad44:	004c2403          	lw	s0,4(s8)
c000ad48:	cf1fc0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000ad4c:	00ac2223          	sw	a0,4(s8)
c000ad50:	008c2423          	sw	s0,8(s8)
c000ad54:	02812e03          	lw	t3,40(sp)
c000ad58:	02c12f03          	lw	t5,44(sp)
c000ad5c:	00050463          	beqz	a0,c000ad64 <stride_dequeue+0x2edc>
c000ad60:	01852023          	sw	s8,0(a0)
c000ad64:	008ba403          	lw	s0,8(s7)
c000ad68:	aa1fe06f          	j	c0009808 <stride_dequeue+0x1980>
c000ad6c:	00832503          	lw	a0,8(t1)
c000ad70:	000f0593          	mv	a1,t5
c000ad74:	00432403          	lw	s0,4(t1)
c000ad78:	cc1fc0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000ad7c:	02012303          	lw	t1,32(sp)
c000ad80:	02412e03          	lw	t3,36(sp)
c000ad84:	00a32223          	sw	a0,4(t1)
c000ad88:	00832423          	sw	s0,8(t1)
c000ad8c:	00050463          	beqz	a0,c000ad94 <stride_dequeue+0x2f0c>
c000ad90:	00652023          	sw	t1,0(a0)
c000ad94:	008ba403          	lw	s0,8(s7)
c000ad98:	a68fe06f          	j	c0009000 <stride_dequeue+0x1178>
c000ad9c:	008ea503          	lw	a0,8(t4)
c000ada0:	000e0593          	mv	a1,t3
c000ada4:	004ea403          	lw	s0,4(t4)
c000ada8:	c91fc0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000adac:	02812e83          	lw	t4,40(sp)
c000adb0:	02c12f03          	lw	t5,44(sp)
c000adb4:	00aea223          	sw	a0,4(t4)
c000adb8:	008ea423          	sw	s0,8(t4)
c000adbc:	00050463          	beqz	a0,c000adc4 <stride_dequeue+0x2f3c>
c000adc0:	01d52023          	sw	t4,0(a0)
c000adc4:	008ba403          	lw	s0,8(s7)
c000adc8:	b05fd06f          	j	c00088cc <stride_dequeue+0xa44>
c000adcc:	008da503          	lw	a0,8(s11)
c000add0:	004da403          	lw	s0,4(s11)
c000add4:	000c0593          	mv	a1,s8
c000add8:	c61fc0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000addc:	00ada223          	sw	a0,4(s11)
c000ade0:	008da423          	sw	s0,8(s11)
c000ade4:	02412e03          	lw	t3,36(sp)
c000ade8:	02812e83          	lw	t4,40(sp)
c000adec:	00050463          	beqz	a0,c000adf4 <stride_dequeue+0x2f6c>
c000adf0:	01b52023          	sw	s11,0(a0)
c000adf4:	008ba403          	lw	s0,8(s7)
c000adf8:	fe1fe06f          	j	c0009dd8 <stride_dequeue+0x1f50>
c000adfc:	0087a503          	lw	a0,8(a5)
c000ae00:	000f0593          	mv	a1,t5
c000ae04:	0047a403          	lw	s0,4(a5)
c000ae08:	c31fc0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000ae0c:	02412783          	lw	a5,36(sp)
c000ae10:	02812e03          	lw	t3,40(sp)
c000ae14:	00a7a223          	sw	a0,4(a5)
c000ae18:	0087a423          	sw	s0,8(a5)
c000ae1c:	00050463          	beqz	a0,c000ae24 <stride_dequeue+0x2f9c>
c000ae20:	00f52023          	sw	a5,0(a0)
c000ae24:	008ba403          	lw	s0,8(s7)
c000ae28:	c8cfe06f          	j	c00092b4 <stride_dequeue+0x142c>
c000ae2c:	008da503          	lw	a0,8(s11)
c000ae30:	02012583          	lw	a1,32(sp)
c000ae34:	004da403          	lw	s0,4(s11)
c000ae38:	c01fc0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000ae3c:	00ada223          	sw	a0,4(s11)
c000ae40:	008da423          	sw	s0,8(s11)
c000ae44:	02812e03          	lw	t3,40(sp)
c000ae48:	00050463          	beqz	a0,c000ae50 <stride_dequeue+0x2fc8>
c000ae4c:	01b52023          	sw	s11,0(a0)
c000ae50:	008ba403          	lw	s0,8(s7)
c000ae54:	bf1fe06f          	j	c0009a44 <stride_dequeue+0x1bbc>
c000ae58:	0087a503          	lw	a0,8(a5)
c000ae5c:	000f0593          	mv	a1,t5
c000ae60:	0047a403          	lw	s0,4(a5)
c000ae64:	bd5fc0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000ae68:	02412783          	lw	a5,36(sp)
c000ae6c:	02812e03          	lw	t3,40(sp)
c000ae70:	00a7a223          	sw	a0,4(a5)
c000ae74:	0087a423          	sw	s0,8(a5)
c000ae78:	00050463          	beqz	a0,c000ae80 <stride_dequeue+0x2ff8>
c000ae7c:	00f52023          	sw	a5,0(a0)
c000ae80:	008ba403          	lw	s0,8(s7)
c000ae84:	ad8fe06f          	j	c000915c <stride_dequeue+0x12d4>
c000ae88:	008c2503          	lw	a0,8(s8)
c000ae8c:	02012583          	lw	a1,32(sp)
c000ae90:	004c2403          	lw	s0,4(s8)
c000ae94:	ba5fc0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000ae98:	00ac2223          	sw	a0,4(s8)
c000ae9c:	008c2423          	sw	s0,8(s8)
c000aea0:	02812f03          	lw	t5,40(sp)
c000aea4:	00050463          	beqz	a0,c000aeac <stride_dequeue+0x3024>
c000aea8:	01852023          	sw	s8,0(a0)
c000aeac:	008ba403          	lw	s0,8(s7)
c000aeb0:	f9cfe06f          	j	c000964c <stride_dequeue+0x17c4>
c000aeb4:	0087a503          	lw	a0,8(a5)
c000aeb8:	00098593          	mv	a1,s3
c000aebc:	0047a403          	lw	s0,4(a5)
c000aec0:	b79fc0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000aec4:	01412783          	lw	a5,20(sp)
c000aec8:	00a7a223          	sw	a0,4(a5)
c000aecc:	0087a423          	sw	s0,8(a5)
c000aed0:	44050863          	beqz	a0,c000b320 <stride_dequeue+0x3498>
c000aed4:	00f52023          	sw	a5,0(a0)
c000aed8:	00078993          	mv	s3,a5
c000aedc:	008ba403          	lw	s0,8(s7)
c000aee0:	b4cff06f          	j	c000a22c <stride_dequeue+0x23a4>
c000aee4:	008c2503          	lw	a0,8(s8)
c000aee8:	02012583          	lw	a1,32(sp)
c000aeec:	004c2403          	lw	s0,4(s8)
c000aef0:	b49fc0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000aef4:	00ac2223          	sw	a0,4(s8)
c000aef8:	008c2423          	sw	s0,8(s8)
c000aefc:	02812e83          	lw	t4,40(sp)
c000af00:	00050463          	beqz	a0,c000af08 <stride_dequeue+0x3080>
c000af04:	01852023          	sw	s8,0(a0)
c000af08:	008ba403          	lw	s0,8(s7)
c000af0c:	84cff06f          	j	c0009f58 <stride_dequeue+0x20d0>
c000af10:	008ba403          	lw	s0,8(s7)
c000af14:	000c0e13          	mv	t3,s8
c000af18:	911fe06f          	j	c0009828 <stride_dequeue+0x19a0>
c000af1c:	008ba403          	lw	s0,8(s7)
c000af20:	00078e13          	mv	t3,a5
c000af24:	d88fe06f          	j	c00094ac <stride_dequeue+0x1624>
c000af28:	008ba403          	lw	s0,8(s7)
c000af2c:	000c0893          	mv	a7,s8
c000af30:	96dfe06f          	j	c000989c <stride_dequeue+0x1a14>
c000af34:	008da503          	lw	a0,8(s11)
c000af38:	004da403          	lw	s0,4(s11)
c000af3c:	000e0593          	mv	a1,t3
c000af40:	01112e23          	sw	a7,28(sp)
c000af44:	af5fc0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000af48:	00ada223          	sw	a0,4(s11)
c000af4c:	008da423          	sw	s0,8(s11)
c000af50:	01c12883          	lw	a7,28(sp)
c000af54:	00050463          	beqz	a0,c000af5c <stride_dequeue+0x30d4>
c000af58:	01b52023          	sw	s11,0(a0)
c000af5c:	008ba403          	lw	s0,8(s7)
c000af60:	ca4fe06f          	j	c0009404 <stride_dequeue+0x157c>
c000af64:	008ba403          	lw	s0,8(s7)
c000af68:	000c0d93          	mv	s11,s8
c000af6c:	f00fe06f          	j	c000966c <stride_dequeue+0x17e4>
c000af70:	008ba403          	lw	s0,8(s7)
c000af74:	000d8a93          	mv	s5,s11
c000af78:	aedfe06f          	j	c0009a64 <stride_dequeue+0x1bdc>
c000af7c:	0087a503          	lw	a0,8(a5)
c000af80:	000e8593          	mv	a1,t4
c000af84:	0047a403          	lw	s0,4(a5)
c000af88:	ab1fc0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000af8c:	02412783          	lw	a5,36(sp)
c000af90:	00a7a223          	sw	a0,4(a5)
c000af94:	0087a423          	sw	s0,8(a5)
c000af98:	3c050e63          	beqz	a0,c000b374 <stride_dequeue+0x34ec>
c000af9c:	00f52023          	sw	a5,0(a0)
c000afa0:	00078e93          	mv	t4,a5
c000afa4:	008ba403          	lw	s0,8(s7)
c000afa8:	c09ff06f          	j	c000abb0 <stride_dequeue+0x2d28>
c000afac:	008ba403          	lw	s0,8(s7)
c000afb0:	00078d93          	mv	s11,a5
c000afb4:	c95fe06f          	j	c0009c48 <stride_dequeue+0x1dc0>
c000afb8:	008ba403          	lw	s0,8(s7)
c000afbc:	000e0d93          	mv	s11,t3
c000afc0:	c44fe06f          	j	c0009404 <stride_dequeue+0x157c>
c000afc4:	008da503          	lw	a0,8(s11)
c000afc8:	004da403          	lw	s0,4(s11)
c000afcc:	000f0593          	mv	a1,t5
c000afd0:	03c12223          	sw	t3,36(sp)
c000afd4:	a65fc0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000afd8:	00ada223          	sw	a0,4(s11)
c000afdc:	008da423          	sw	s0,8(s11)
c000afe0:	02412e03          	lw	t3,36(sp)
c000afe4:	38050e63          	beqz	a0,c000b380 <stride_dequeue+0x34f8>
c000afe8:	01b52023          	sw	s11,0(a0)
c000afec:	000d8f13          	mv	t5,s11
c000aff0:	008ba403          	lw	s0,8(s7)
c000aff4:	9d9ff06f          	j	c000a9cc <stride_dequeue+0x2b44>
c000aff8:	008ba403          	lw	s0,8(s7)
c000affc:	000c0d13          	mv	s10,s8
c000b000:	acdfe06f          	j	c0009acc <stride_dequeue+0x1c44>
c000b004:	008ba403          	lw	s0,8(s7)
c000b008:	000f0793          	mv	a5,t5
c000b00c:	aa8fe06f          	j	c00092b4 <stride_dequeue+0x142c>
c000b010:	008da503          	lw	a0,8(s11)
c000b014:	004da403          	lw	s0,4(s11)
c000b018:	00028593          	mv	a1,t0
c000b01c:	03c12623          	sw	t3,44(sp)
c000b020:	a19fc0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000b024:	00ada223          	sw	a0,4(s11)
c000b028:	008da423          	sw	s0,8(s11)
c000b02c:	02c12e03          	lw	t3,44(sp)
c000b030:	00050463          	beqz	a0,c000b038 <stride_dequeue+0x31b0>
c000b034:	01b52023          	sw	s11,0(a0)
c000b038:	008ba403          	lw	s0,8(s7)
c000b03c:	9f1fe06f          	j	c0009a2c <stride_dequeue+0x1ba4>
c000b040:	0087a503          	lw	a0,8(a5)
c000b044:	000f0593          	mv	a1,t5
c000b048:	0047a403          	lw	s0,4(a5)
c000b04c:	9edfc0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000b050:	02412783          	lw	a5,36(sp)
c000b054:	00a7a223          	sw	a0,4(a5)
c000b058:	0087a423          	sw	s0,8(a5)
c000b05c:	32050863          	beqz	a0,c000b38c <stride_dequeue+0x3504>
c000b060:	00f52023          	sw	a5,0(a0)
c000b064:	00078f13          	mv	t5,a5
c000b068:	008ba403          	lw	s0,8(s7)
c000b06c:	a11ff06f          	j	c000aa7c <stride_dequeue+0x2bf4>
c000b070:	008ba403          	lw	s0,8(s7)
c000b074:	000c0b13          	mv	s6,s8
c000b078:	858ff06f          	j	c000a0d0 <stride_dequeue+0x2248>
c000b07c:	008c2503          	lw	a0,8(s8)
c000b080:	004c2403          	lw	s0,4(s8)
c000b084:	000f8593          	mv	a1,t6
c000b088:	03e12a23          	sw	t5,52(sp)
c000b08c:	03c12823          	sw	t3,48(sp)
c000b090:	9a9fc0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000b094:	00ac2223          	sw	a0,4(s8)
c000b098:	008c2423          	sw	s0,8(s8)
c000b09c:	03012e03          	lw	t3,48(sp)
c000b0a0:	03412f03          	lw	t5,52(sp)
c000b0a4:	00050463          	beqz	a0,c000b0ac <stride_dequeue+0x3224>
c000b0a8:	01852023          	sw	s8,0(a0)
c000b0ac:	008ba403          	lw	s0,8(s7)
c000b0b0:	f2cfe06f          	j	c00097dc <stride_dequeue+0x1954>
c000b0b4:	008ba403          	lw	s0,8(s7)
c000b0b8:	000f0793          	mv	a5,t5
c000b0bc:	8a0fe06f          	j	c000915c <stride_dequeue+0x12d4>
c000b0c0:	008c2503          	lw	a0,8(s8)
c000b0c4:	004c2403          	lw	s0,4(s8)
c000b0c8:	00028593          	mv	a1,t0
c000b0cc:	03e12623          	sw	t5,44(sp)
c000b0d0:	969fc0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000b0d4:	00ac2223          	sw	a0,4(s8)
c000b0d8:	008c2423          	sw	s0,8(s8)
c000b0dc:	02c12f03          	lw	t5,44(sp)
c000b0e0:	00050463          	beqz	a0,c000b0e8 <stride_dequeue+0x3260>
c000b0e4:	01852023          	sw	s8,0(a0)
c000b0e8:	008ba403          	lw	s0,8(s7)
c000b0ec:	d48fe06f          	j	c0009634 <stride_dequeue+0x17ac>
c000b0f0:	008ba403          	lw	s0,8(s7)
c000b0f4:	000c0b13          	mv	s6,s8
c000b0f8:	89cff06f          	j	c000a194 <stride_dequeue+0x230c>
c000b0fc:	008ba403          	lw	s0,8(s7)
c000b100:	000c0d93          	mv	s11,s8
c000b104:	a99fe06f          	j	c0009b9c <stride_dequeue+0x1d14>
c000b108:	008da503          	lw	a0,8(s11)
c000b10c:	004da403          	lw	s0,4(s11)
c000b110:	000f8593          	mv	a1,t6
c000b114:	02512a23          	sw	t0,52(sp)
c000b118:	03c12823          	sw	t3,48(sp)
c000b11c:	91dfc0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000b120:	00ada223          	sw	a0,4(s11)
c000b124:	008da423          	sw	s0,8(s11)
c000b128:	03012e03          	lw	t3,48(sp)
c000b12c:	03412283          	lw	t0,52(sp)
c000b130:	00050463          	beqz	a0,c000b138 <stride_dequeue+0x32b0>
c000b134:	01b52023          	sw	s11,0(a0)
c000b138:	008ba403          	lw	s0,8(s7)
c000b13c:	8ddfe06f          	j	c0009a18 <stride_dequeue+0x1b90>
c000b140:	008c2503          	lw	a0,8(s8)
c000b144:	004c2403          	lw	s0,4(s8)
c000b148:	000e8593          	mv	a1,t4
c000b14c:	03c12223          	sw	t3,36(sp)
c000b150:	8e9fc0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000b154:	00ac2223          	sw	a0,4(s8)
c000b158:	008c2423          	sw	s0,8(s8)
c000b15c:	02412e03          	lw	t3,36(sp)
c000b160:	20050463          	beqz	a0,c000b368 <stride_dequeue+0x34e0>
c000b164:	01852023          	sw	s8,0(a0)
c000b168:	000c0e93          	mv	t4,s8
c000b16c:	008ba403          	lw	s0,8(s7)
c000b170:	af9ff06f          	j	c000ac68 <stride_dequeue+0x2de0>
c000b174:	008ba403          	lw	s0,8(s7)
c000b178:	000e0e93          	mv	t4,t3
c000b17c:	f50fd06f          	j	c00088cc <stride_dequeue+0xa44>
c000b180:	008da503          	lw	a0,8(s11)
c000b184:	004da403          	lw	s0,4(s11)
c000b188:	00028593          	mv	a1,t0
c000b18c:	03d12623          	sw	t4,44(sp)
c000b190:	03c12423          	sw	t3,40(sp)
c000b194:	8a5fc0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000b198:	00ada223          	sw	a0,4(s11)
c000b19c:	008da423          	sw	s0,8(s11)
c000b1a0:	02812e03          	lw	t3,40(sp)
c000b1a4:	02c12e83          	lw	t4,44(sp)
c000b1a8:	00050463          	beqz	a0,c000b1b0 <stride_dequeue+0x3328>
c000b1ac:	01b52023          	sw	s11,0(a0)
c000b1b0:	008ba403          	lw	s0,8(s7)
c000b1b4:	c11fe06f          	j	c0009dc4 <stride_dequeue+0x1f3c>
c000b1b8:	008c2503          	lw	a0,8(s8)
c000b1bc:	004c2403          	lw	s0,4(s8)
c000b1c0:	000f8593          	mv	a1,t6
c000b1c4:	02512a23          	sw	t0,52(sp)
c000b1c8:	03d12823          	sw	t4,48(sp)
c000b1cc:	86dfc0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000b1d0:	00ac2223          	sw	a0,4(s8)
c000b1d4:	008c2423          	sw	s0,8(s8)
c000b1d8:	03012e83          	lw	t4,48(sp)
c000b1dc:	03412283          	lw	t0,52(sp)
c000b1e0:	00050463          	beqz	a0,c000b1e8 <stride_dequeue+0x3360>
c000b1e4:	01852023          	sw	s8,0(a0)
c000b1e8:	008ba403          	lw	s0,8(s7)
c000b1ec:	d41fe06f          	j	c0009f2c <stride_dequeue+0x20a4>
c000b1f0:	008da503          	lw	a0,8(s11)
c000b1f4:	004da403          	lw	s0,4(s11)
c000b1f8:	000f8593          	mv	a1,t6
c000b1fc:	02512a23          	sw	t0,52(sp)
c000b200:	03d12823          	sw	t4,48(sp)
c000b204:	03c12623          	sw	t3,44(sp)
c000b208:	831fc0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000b20c:	00ada223          	sw	a0,4(s11)
c000b210:	008da423          	sw	s0,8(s11)
c000b214:	02c12e03          	lw	t3,44(sp)
c000b218:	03012e83          	lw	t4,48(sp)
c000b21c:	03412283          	lw	t0,52(sp)
c000b220:	00050463          	beqz	a0,c000b228 <stride_dequeue+0x33a0>
c000b224:	01b52023          	sw	s11,0(a0)
c000b228:	008ba403          	lw	s0,8(s7)
c000b22c:	b85fe06f          	j	c0009db0 <stride_dequeue+0x1f28>
c000b230:	008ba403          	lw	s0,8(s7)
c000b234:	000f0313          	mv	t1,t5
c000b238:	dc9fd06f          	j	c0009000 <stride_dequeue+0x1178>
c000b23c:	008c2503          	lw	a0,8(s8)
c000b240:	004c2403          	lw	s0,4(s8)
c000b244:	000d8593          	mv	a1,s11
c000b248:	ff0fc0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000b24c:	00ac2223          	sw	a0,4(s8)
c000b250:	008c2423          	sw	s0,8(s8)
c000b254:	02c12e03          	lw	t3,44(sp)
c000b258:	03012f03          	lw	t5,48(sp)
c000b25c:	00050463          	beqz	a0,c000b264 <stride_dequeue+0x33dc>
c000b260:	01852023          	sw	s8,0(a0)
c000b264:	008ba403          	lw	s0,8(s7)
c000b268:	d88fe06f          	j	c00097f0 <stride_dequeue+0x1968>
c000b26c:	0087a503          	lw	a0,8(a5)
c000b270:	000c0593          	mv	a1,s8
c000b274:	0047a403          	lw	s0,4(a5)
c000b278:	fc0fc0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000b27c:	02412783          	lw	a5,36(sp)
c000b280:	02812e03          	lw	t3,40(sp)
c000b284:	00a7a223          	sw	a0,4(a5)
c000b288:	0087a423          	sw	s0,8(a5)
c000b28c:	0a050063          	beqz	a0,c000b32c <stride_dequeue+0x34a4>
c000b290:	00f52023          	sw	a5,0(a0)
c000b294:	00078c13          	mv	s8,a5
c000b298:	008ba403          	lw	s0,8(s7)
c000b29c:	e34ff06f          	j	c000a8d0 <stride_dequeue+0x2a48>
c000b2a0:	008ba403          	lw	s0,8(s7)
c000b2a4:	000c0d93          	mv	s11,s8
c000b2a8:	88dfe06f          	j	c0009b34 <stride_dequeue+0x1cac>
c000b2ac:	008c2503          	lw	a0,8(s8)
c000b2b0:	004c2403          	lw	s0,4(s8)
c000b2b4:	000f8593          	mv	a1,t6
c000b2b8:	02512a23          	sw	t0,52(sp)
c000b2bc:	03e12823          	sw	t5,48(sp)
c000b2c0:	f78fc0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000b2c4:	00ac2223          	sw	a0,4(s8)
c000b2c8:	008c2423          	sw	s0,8(s8)
c000b2cc:	03012f03          	lw	t5,48(sp)
c000b2d0:	03412283          	lw	t0,52(sp)
c000b2d4:	00050463          	beqz	a0,c000b2dc <stride_dequeue+0x3454>
c000b2d8:	01852023          	sw	s8,0(a0)
c000b2dc:	008ba403          	lw	s0,8(s7)
c000b2e0:	b40fe06f          	j	c0009620 <stride_dequeue+0x1798>
c000b2e4:	008ba403          	lw	s0,8(s7)
c000b2e8:	000c0b13          	mv	s6,s8
c000b2ec:	d75fe06f          	j	c000a060 <stride_dequeue+0x21d8>
c000b2f0:	008c2503          	lw	a0,8(s8)
c000b2f4:	004c2403          	lw	s0,4(s8)
c000b2f8:	00028593          	mv	a1,t0
c000b2fc:	03d12623          	sw	t4,44(sp)
c000b300:	f38fc0ef          	jal	ra,c0007a38 <skew_heap_merge.constprop.3>
c000b304:	00ac2223          	sw	a0,4(s8)
c000b308:	008c2423          	sw	s0,8(s8)
c000b30c:	02c12e83          	lw	t4,44(sp)
c000b310:	00050463          	beqz	a0,c000b318 <stride_dequeue+0x3490>
c000b314:	01852023          	sw	s8,0(a0)
c000b318:	008ba403          	lw	s0,8(s7)
c000b31c:	c25fe06f          	j	c0009f40 <stride_dequeue+0x20b8>
c000b320:	008ba403          	lw	s0,8(s7)
c000b324:	00078993          	mv	s3,a5
c000b328:	f05fe06f          	j	c000a22c <stride_dequeue+0x23a4>
c000b32c:	008ba403          	lw	s0,8(s7)
c000b330:	00078c13          	mv	s8,a5
c000b334:	d9cff06f          	j	c000a8d0 <stride_dequeue+0x2a48>
c000b338:	008ba403          	lw	s0,8(s7)
c000b33c:	000f8c13          	mv	s8,t6
c000b340:	ae0fe06f          	j	c0009620 <stride_dequeue+0x1798>
c000b344:	008ba403          	lw	s0,8(s7)
c000b348:	000f8c13          	mv	s8,t6
c000b34c:	be1fe06f          	j	c0009f2c <stride_dequeue+0x20a4>
c000b350:	008ba403          	lw	s0,8(s7)
c000b354:	000f8d93          	mv	s11,t6
c000b358:	a59fe06f          	j	c0009db0 <stride_dequeue+0x1f28>
c000b35c:	008ba403          	lw	s0,8(s7)
c000b360:	000f8d93          	mv	s11,t6
c000b364:	eb4fe06f          	j	c0009a18 <stride_dequeue+0x1b90>
c000b368:	008ba403          	lw	s0,8(s7)
c000b36c:	000c0e93          	mv	t4,s8
c000b370:	8f9ff06f          	j	c000ac68 <stride_dequeue+0x2de0>
c000b374:	008ba403          	lw	s0,8(s7)
c000b378:	00078e93          	mv	t4,a5
c000b37c:	835ff06f          	j	c000abb0 <stride_dequeue+0x2d28>
c000b380:	008ba403          	lw	s0,8(s7)
c000b384:	000d8f13          	mv	t5,s11
c000b388:	e44ff06f          	j	c000a9cc <stride_dequeue+0x2b44>
c000b38c:	008ba403          	lw	s0,8(s7)
c000b390:	00078f13          	mv	t5,a5
c000b394:	ee8ff06f          	j	c000aa7c <stride_dequeue+0x2bf4>
c000b398:	008ba403          	lw	s0,8(s7)
c000b39c:	000f8c13          	mv	s8,t6
c000b3a0:	c3cfe06f          	j	c00097dc <stride_dequeue+0x1954>

c000b3a4 <sys_getpid>:
c000b3a4:	00034797          	auipc	a5,0x34
c000b3a8:	8607a783          	lw	a5,-1952(a5) # c003ec04 <current>
c000b3ac:	0047a503          	lw	a0,4(a5)
c000b3b0:	00008067          	ret

c000b3b4 <sys_gettime>:
c000b3b4:	00034517          	auipc	a0,0x34
c000b3b8:	87052503          	lw	a0,-1936(a0) # c003ec24 <ticks>
c000b3bc:	00008067          	ret

c000b3c0 <sys_lab6_set_priority>:
c000b3c0:	00052503          	lw	a0,0(a0)
c000b3c4:	ff010113          	addi	sp,sp,-16
c000b3c8:	00112623          	sw	ra,12(sp)
c000b3cc:	b40fc0ef          	jal	ra,c000770c <lab6_set_priority>
c000b3d0:	00c12083          	lw	ra,12(sp)
c000b3d4:	00000513          	li	a0,0
c000b3d8:	01010113          	addi	sp,sp,16
c000b3dc:	00008067          	ret

c000b3e0 <sys_pgdir>:
c000b3e0:	ff010113          	addi	sp,sp,-16
c000b3e4:	00112623          	sw	ra,12(sp)
c000b3e8:	955f90ef          	jal	ra,c0004d3c <print_pgdir>
c000b3ec:	00c12083          	lw	ra,12(sp)
c000b3f0:	00000513          	li	a0,0
c000b3f4:	01010113          	addi	sp,sp,16
c000b3f8:	00008067          	ret

c000b3fc <sys_putc>:
c000b3fc:	00052503          	lw	a0,0(a0)
c000b400:	ff010113          	addi	sp,sp,-16
c000b404:	00112623          	sw	ra,12(sp)
c000b408:	d2df40ef          	jal	ra,c0000134 <cputchar>
c000b40c:	00c12083          	lw	ra,12(sp)
c000b410:	00000513          	li	a0,0
c000b414:	01010113          	addi	sp,sp,16
c000b418:	00008067          	ret

c000b41c <sys_kill>:
c000b41c:	00052503          	lw	a0,0(a0)
c000b420:	8f0fc06f          	j	c0007510 <do_kill>

c000b424 <sys_yield>:
c000b424:	868fc06f          	j	c000748c <do_yield>

c000b428 <sys_exec>:
c000b428:	00c52683          	lw	a3,12(a0)
c000b42c:	00852603          	lw	a2,8(a0)
c000b430:	00452583          	lw	a1,4(a0)
c000b434:	00052503          	lw	a0,0(a0)
c000b438:	a25fb06f          	j	c0006e5c <do_execve>

c000b43c <sys_wait>:
c000b43c:	00452583          	lw	a1,4(a0)
c000b440:	00052503          	lw	a0,0(a0)
c000b444:	860fc06f          	j	c00074a4 <do_wait>

c000b448 <sys_fork>:
c000b448:	00033797          	auipc	a5,0x33
c000b44c:	7bc7a783          	lw	a5,1980(a5) # c003ec04 <current>
c000b450:	0547a603          	lw	a2,84(a5)
c000b454:	00000513          	li	a0,0
c000b458:	00862583          	lw	a1,8(a2)
c000b45c:	f51fa06f          	j	c00063ac <do_fork>

c000b460 <sys_exit>:
c000b460:	00052503          	lw	a0,0(a0)
c000b464:	ce8fb06f          	j	c000694c <do_exit>

c000b468 <syscall>:
c000b468:	fd010113          	addi	sp,sp,-48
c000b46c:	00033797          	auipc	a5,0x33
c000b470:	7987a783          	lw	a5,1944(a5) # c003ec04 <current>
c000b474:	02812423          	sw	s0,40(sp)
c000b478:	0547a403          	lw	s0,84(a5)
c000b47c:	02912223          	sw	s1,36(sp)
c000b480:	02112623          	sw	ra,44(sp)
c000b484:	02842483          	lw	s1,40(s0)
c000b488:	0ff00793          	li	a5,255
c000b48c:	0697e263          	bltu	a5,s1,c000b4f0 <syscall+0x88>
c000b490:	00249713          	slli	a4,s1,0x2
c000b494:	00003797          	auipc	a5,0x3
c000b498:	96c78793          	addi	a5,a5,-1684 # c000de00 <syscalls>
c000b49c:	00e787b3          	add	a5,a5,a4
c000b4a0:	0007a783          	lw	a5,0(a5)
c000b4a4:	04078663          	beqz	a5,c000b4f0 <syscall+0x88>
c000b4a8:	02c42503          	lw	a0,44(s0)
c000b4ac:	03042583          	lw	a1,48(s0)
c000b4b0:	03442603          	lw	a2,52(s0)
c000b4b4:	03842683          	lw	a3,56(s0)
c000b4b8:	03c42703          	lw	a4,60(s0)
c000b4bc:	00a12623          	sw	a0,12(sp)
c000b4c0:	00b12823          	sw	a1,16(sp)
c000b4c4:	00c12a23          	sw	a2,20(sp)
c000b4c8:	00d12c23          	sw	a3,24(sp)
c000b4cc:	00e12e23          	sw	a4,28(sp)
c000b4d0:	00c10513          	addi	a0,sp,12
c000b4d4:	000780e7          	jalr	a5
c000b4d8:	02c12083          	lw	ra,44(sp)
c000b4dc:	02a42423          	sw	a0,40(s0)
c000b4e0:	02412483          	lw	s1,36(sp)
c000b4e4:	02812403          	lw	s0,40(sp)
c000b4e8:	03010113          	addi	sp,sp,48
c000b4ec:	00008067          	ret
c000b4f0:	00040513          	mv	a0,s0
c000b4f4:	d6cf50ef          	jal	ra,c0000a60 <print_trapframe>
c000b4f8:	00033797          	auipc	a5,0x33
c000b4fc:	70c7a783          	lw	a5,1804(a5) # c003ec04 <current>
c000b500:	0047a703          	lw	a4,4(a5)
c000b504:	00048693          	mv	a3,s1
c000b508:	06078793          	addi	a5,a5,96
c000b50c:	00003617          	auipc	a2,0x3
c000b510:	8b060613          	addi	a2,a2,-1872 # c000ddbc <default_pmm_manager+0xc00>
c000b514:	07900593          	li	a1,121
c000b518:	00003517          	auipc	a0,0x3
c000b51c:	8d050513          	addi	a0,a0,-1840 # c000dde8 <default_pmm_manager+0xc2c>
c000b520:	d31f40ef          	jal	ra,c0000250 <__panic>

c000b524 <strlen>:
c000b524:	00054703          	lbu	a4,0(a0)
c000b528:	00050693          	mv	a3,a0
c000b52c:	00150793          	addi	a5,a0,1
c000b530:	00070c63          	beqz	a4,c000b548 <strlen+0x24>
c000b534:	40d78533          	sub	a0,a5,a3
c000b538:	00178793          	addi	a5,a5,1
c000b53c:	fff7c703          	lbu	a4,-1(a5)
c000b540:	fe071ae3          	bnez	a4,c000b534 <strlen+0x10>
c000b544:	00008067          	ret
c000b548:	00000513          	li	a0,0
c000b54c:	00008067          	ret

c000b550 <strnlen>:
c000b550:	00050693          	mv	a3,a0
c000b554:	02058a63          	beqz	a1,c000b588 <strnlen+0x38>
c000b558:	00054703          	lbu	a4,0(a0)
c000b55c:	00150793          	addi	a5,a0,1
c000b560:	02070463          	beqz	a4,c000b588 <strnlen+0x38>
c000b564:	00b505b3          	add	a1,a0,a1
c000b568:	0100006f          	j	c000b578 <strnlen+0x28>
c000b56c:	00178793          	addi	a5,a5,1
c000b570:	fff7c703          	lbu	a4,-1(a5)
c000b574:	00070863          	beqz	a4,c000b584 <strnlen+0x34>
c000b578:	40d78533          	sub	a0,a5,a3
c000b57c:	feb798e3          	bne	a5,a1,c000b56c <strnlen+0x1c>
c000b580:	00008067          	ret
c000b584:	00008067          	ret
c000b588:	00000513          	li	a0,0
c000b58c:	00008067          	ret

c000b590 <strcpy>:
c000b590:	00050793          	mv	a5,a0
c000b594:	00158593          	addi	a1,a1,1
c000b598:	fff5c703          	lbu	a4,-1(a1)
c000b59c:	00178793          	addi	a5,a5,1
c000b5a0:	fee78fa3          	sb	a4,-1(a5)
c000b5a4:	fe0718e3          	bnez	a4,c000b594 <strcpy+0x4>
c000b5a8:	00008067          	ret

c000b5ac <strcmp>:
c000b5ac:	00054783          	lbu	a5,0(a0)
c000b5b0:	0005c703          	lbu	a4,0(a1)
c000b5b4:	02078263          	beqz	a5,c000b5d8 <strcmp+0x2c>
c000b5b8:	02e79063          	bne	a5,a4,c000b5d8 <strcmp+0x2c>
c000b5bc:	00150513          	addi	a0,a0,1
c000b5c0:	00054783          	lbu	a5,0(a0)
c000b5c4:	00158693          	addi	a3,a1,1
c000b5c8:	0015c703          	lbu	a4,1(a1)
c000b5cc:	00078663          	beqz	a5,c000b5d8 <strcmp+0x2c>
c000b5d0:	00068593          	mv	a1,a3
c000b5d4:	fee784e3          	beq	a5,a4,c000b5bc <strcmp+0x10>
c000b5d8:	40e78533          	sub	a0,a5,a4
c000b5dc:	00008067          	ret

c000b5e0 <strchr>:
c000b5e0:	00054783          	lbu	a5,0(a0)
c000b5e4:	00078e63          	beqz	a5,c000b600 <strchr+0x20>
c000b5e8:	00f59663          	bne	a1,a5,c000b5f4 <strchr+0x14>
c000b5ec:	01c0006f          	j	c000b608 <strchr+0x28>
c000b5f0:	00b78a63          	beq	a5,a1,c000b604 <strchr+0x24>
c000b5f4:	00150513          	addi	a0,a0,1
c000b5f8:	00054783          	lbu	a5,0(a0)
c000b5fc:	fe079ae3          	bnez	a5,c000b5f0 <strchr+0x10>
c000b600:	00000513          	li	a0,0
c000b604:	00008067          	ret
c000b608:	00008067          	ret

c000b60c <memset>:
c000b60c:	00c50733          	add	a4,a0,a2
c000b610:	00050793          	mv	a5,a0
c000b614:	00060863          	beqz	a2,c000b624 <memset+0x18>
c000b618:	00178793          	addi	a5,a5,1
c000b61c:	feb78fa3          	sb	a1,-1(a5)
c000b620:	fef71ce3          	bne	a4,a5,c000b618 <memset+0xc>
c000b624:	00008067          	ret

c000b628 <memcpy>:
c000b628:	00c586b3          	add	a3,a1,a2
c000b62c:	00050793          	mv	a5,a0
c000b630:	00060c63          	beqz	a2,c000b648 <memcpy+0x20>
c000b634:	00158593          	addi	a1,a1,1
c000b638:	fff5c703          	lbu	a4,-1(a1)
c000b63c:	00178793          	addi	a5,a5,1
c000b640:	fee78fa3          	sb	a4,-1(a5)
c000b644:	feb698e3          	bne	a3,a1,c000b634 <memcpy+0xc>
c000b648:	00008067          	ret

c000b64c <printnum>:
c000b64c:	fe010113          	addi	sp,sp,-32
c000b650:	00912a23          	sw	s1,20(sp)
c000b654:	01212823          	sw	s2,16(sp)
c000b658:	01312623          	sw	s3,12(sp)
c000b65c:	01412423          	sw	s4,8(sp)
c000b660:	00112e23          	sw	ra,28(sp)
c000b664:	00812c23          	sw	s0,24(sp)
c000b668:	00050493          	mv	s1,a0
c000b66c:	00058913          	mv	s2,a1
c000b670:	00080993          	mv	s3,a6
c000b674:	02e67a33          	remu	s4,a2,a4
c000b678:	04069e63          	bnez	a3,c000b6d4 <printnum+0x88>
c000b67c:	04e67c63          	bleu	a4,a2,c000b6d4 <printnum+0x88>
c000b680:	fff78413          	addi	s0,a5,-1
c000b684:	00805c63          	blez	s0,c000b69c <printnum+0x50>
c000b688:	fff40413          	addi	s0,s0,-1
c000b68c:	00090593          	mv	a1,s2
c000b690:	00098513          	mv	a0,s3
c000b694:	000480e7          	jalr	s1
c000b698:	fe0418e3          	bnez	s0,c000b688 <printnum+0x3c>
c000b69c:	00003797          	auipc	a5,0x3
c000b6a0:	d2078793          	addi	a5,a5,-736 # c000e3bc <error_string+0x64>
c000b6a4:	014787b3          	add	a5,a5,s4
c000b6a8:	00090593          	mv	a1,s2
c000b6ac:	00048313          	mv	t1,s1
c000b6b0:	01c12083          	lw	ra,28(sp)
c000b6b4:	01812403          	lw	s0,24(sp)
c000b6b8:	01412483          	lw	s1,20(sp)
c000b6bc:	01012903          	lw	s2,16(sp)
c000b6c0:	00c12983          	lw	s3,12(sp)
c000b6c4:	00812a03          	lw	s4,8(sp)
c000b6c8:	0007c503          	lbu	a0,0(a5)
c000b6cc:	02010113          	addi	sp,sp,32
c000b6d0:	00030067          	jr	t1
c000b6d4:	02e65633          	divu	a2,a2,a4
c000b6d8:	00098813          	mv	a6,s3
c000b6dc:	fff78793          	addi	a5,a5,-1
c000b6e0:	00000693          	li	a3,0
c000b6e4:	00090593          	mv	a1,s2
c000b6e8:	00048513          	mv	a0,s1
c000b6ec:	f61ff0ef          	jal	ra,c000b64c <printnum>
c000b6f0:	fadff06f          	j	c000b69c <printnum+0x50>

c000b6f4 <vprintfmt>:
c000b6f4:	fb010113          	addi	sp,sp,-80
c000b6f8:	05212023          	sw	s2,64(sp)
c000b6fc:	03312e23          	sw	s3,60(sp)
c000b700:	03412c23          	sw	s4,56(sp)
c000b704:	03512a23          	sw	s5,52(sp)
c000b708:	03612823          	sw	s6,48(sp)
c000b70c:	03712623          	sw	s7,44(sp)
c000b710:	03812423          	sw	s8,40(sp)
c000b714:	03912223          	sw	s9,36(sp)
c000b718:	04112623          	sw	ra,76(sp)
c000b71c:	04812423          	sw	s0,72(sp)
c000b720:	04912223          	sw	s1,68(sp)
c000b724:	03a12023          	sw	s10,32(sp)
c000b728:	01b12e23          	sw	s11,28(sp)
c000b72c:	00050993          	mv	s3,a0
c000b730:	00058913          	mv	s2,a1
c000b734:	00060c93          	mv	s9,a2
c000b738:	00068a93          	mv	s5,a3
c000b73c:	00003a17          	auipc	s4,0x3
c000b740:	ac4a0a13          	addi	s4,s4,-1340 # c000e200 <syscalls+0x400>
c000b744:	02800c13          	li	s8,40
c000b748:	fff00b13          	li	s6,-1
c000b74c:	05e00b93          	li	s7,94
c000b750:	000cc503          	lbu	a0,0(s9)
c000b754:	02500493          	li	s1,37
c000b758:	001c8413          	addi	s0,s9,1
c000b75c:	00950e63          	beq	a0,s1,c000b778 <vprintfmt+0x84>
c000b760:	06050463          	beqz	a0,c000b7c8 <vprintfmt+0xd4>
c000b764:	00090593          	mv	a1,s2
c000b768:	00140413          	addi	s0,s0,1
c000b76c:	000980e7          	jalr	s3
c000b770:	fff44503          	lbu	a0,-1(s0)
c000b774:	fe9516e3          	bne	a0,s1,c000b760 <vprintfmt+0x6c>
c000b778:	00044e03          	lbu	t3,0(s0)
c000b77c:	fff00d13          	li	s10,-1
c000b780:	02000813          	li	a6,32
c000b784:	00000493          	li	s1,0
c000b788:	00000593          	li	a1,0
c000b78c:	000d0d93          	mv	s11,s10
c000b790:	05500693          	li	a3,85
c000b794:	00100313          	li	t1,1
c000b798:	03000893          	li	a7,48
c000b79c:	00900613          	li	a2,9
c000b7a0:	02d00513          	li	a0,45
c000b7a4:	fdde0713          	addi	a4,t3,-35
c000b7a8:	0ff77713          	andi	a4,a4,255
c000b7ac:	00140c93          	addi	s9,s0,1
c000b7b0:	32e6e463          	bltu	a3,a4,c000bad8 <vprintfmt+0x3e4>
c000b7b4:	00271713          	slli	a4,a4,0x2
c000b7b8:	01470733          	add	a4,a4,s4
c000b7bc:	00072783          	lw	a5,0(a4)
c000b7c0:	014787b3          	add	a5,a5,s4
c000b7c4:	00078067          	jr	a5
c000b7c8:	04c12083          	lw	ra,76(sp)
c000b7cc:	04812403          	lw	s0,72(sp)
c000b7d0:	04412483          	lw	s1,68(sp)
c000b7d4:	04012903          	lw	s2,64(sp)
c000b7d8:	03c12983          	lw	s3,60(sp)
c000b7dc:	03812a03          	lw	s4,56(sp)
c000b7e0:	03412a83          	lw	s5,52(sp)
c000b7e4:	03012b03          	lw	s6,48(sp)
c000b7e8:	02c12b83          	lw	s7,44(sp)
c000b7ec:	02812c03          	lw	s8,40(sp)
c000b7f0:	02412c83          	lw	s9,36(sp)
c000b7f4:	02012d03          	lw	s10,32(sp)
c000b7f8:	01c12d83          	lw	s11,28(sp)
c000b7fc:	05010113          	addi	sp,sp,80
c000b800:	00008067          	ret
c000b804:	00100793          	li	a5,1
c000b808:	34b7c063          	blt	a5,a1,c000bb48 <vprintfmt+0x454>
c000b80c:	000aa603          	lw	a2,0(s5)
c000b810:	00000693          	li	a3,0
c000b814:	004a8a93          	addi	s5,s5,4
c000b818:	01000713          	li	a4,16
c000b81c:	000d8793          	mv	a5,s11
c000b820:	00090593          	mv	a1,s2
c000b824:	00098513          	mv	a0,s3
c000b828:	e25ff0ef          	jal	ra,c000b64c <printnum>
c000b82c:	f25ff06f          	j	c000b750 <vprintfmt+0x5c>
c000b830:	00144e03          	lbu	t3,1(s0)
c000b834:	00030493          	mv	s1,t1
c000b838:	000c8413          	mv	s0,s9
c000b83c:	f69ff06f          	j	c000b7a4 <vprintfmt+0xb0>
c000b840:	000aa503          	lw	a0,0(s5)
c000b844:	00090593          	mv	a1,s2
c000b848:	004a8a93          	addi	s5,s5,4
c000b84c:	000980e7          	jalr	s3
c000b850:	f01ff06f          	j	c000b750 <vprintfmt+0x5c>
c000b854:	00100793          	li	a5,1
c000b858:	30b7c663          	blt	a5,a1,c000bb64 <vprintfmt+0x470>
c000b85c:	000aa603          	lw	a2,0(s5)
c000b860:	004a8a93          	addi	s5,s5,4
c000b864:	41f65693          	srai	a3,a2,0x1f
c000b868:	00a00713          	li	a4,10
c000b86c:	fa06d8e3          	bgez	a3,c000b81c <vprintfmt+0x128>
c000b870:	00090593          	mv	a1,s2
c000b874:	02d00513          	li	a0,45
c000b878:	00d12623          	sw	a3,12(sp)
c000b87c:	00c12423          	sw	a2,8(sp)
c000b880:	00e12223          	sw	a4,4(sp)
c000b884:	01012023          	sw	a6,0(sp)
c000b888:	000980e7          	jalr	s3
c000b88c:	00812603          	lw	a2,8(sp)
c000b890:	00c12683          	lw	a3,12(sp)
c000b894:	00012803          	lw	a6,0(sp)
c000b898:	40c00633          	neg	a2,a2
c000b89c:	00c037b3          	snez	a5,a2
c000b8a0:	40d006b3          	neg	a3,a3
c000b8a4:	40f686b3          	sub	a3,a3,a5
c000b8a8:	00412703          	lw	a4,4(sp)
c000b8ac:	f71ff06f          	j	c000b81c <vprintfmt+0x128>
c000b8b0:	000aa783          	lw	a5,0(s5)
c000b8b4:	01800693          	li	a3,24
c000b8b8:	004a8a93          	addi	s5,s5,4
c000b8bc:	41f7d713          	srai	a4,a5,0x1f
c000b8c0:	00f747b3          	xor	a5,a4,a5
c000b8c4:	40e787b3          	sub	a5,a5,a4
c000b8c8:	2af6ca63          	blt	a3,a5,c000bb7c <vprintfmt+0x488>
c000b8cc:	00279693          	slli	a3,a5,0x2
c000b8d0:	00003717          	auipc	a4,0x3
c000b8d4:	a8870713          	addi	a4,a4,-1400 # c000e358 <error_string>
c000b8d8:	00d70733          	add	a4,a4,a3
c000b8dc:	00072683          	lw	a3,0(a4)
c000b8e0:	28068e63          	beqz	a3,c000bb7c <vprintfmt+0x488>
c000b8e4:	00000617          	auipc	a2,0x0
c000b8e8:	39c60613          	addi	a2,a2,924 # c000bc80 <etext+0x24>
c000b8ec:	00090593          	mv	a1,s2
c000b8f0:	00098513          	mv	a0,s3
c000b8f4:	314000ef          	jal	ra,c000bc08 <printfmt>
c000b8f8:	e59ff06f          	j	c000b750 <vprintfmt+0x5c>
c000b8fc:	00144e03          	lbu	t3,1(s0)
c000b900:	00158593          	addi	a1,a1,1
c000b904:	000c8413          	mv	s0,s9
c000b908:	e9dff06f          	j	c000b7a4 <vprintfmt+0xb0>
c000b90c:	00100793          	li	a5,1
c000b910:	20b7c063          	blt	a5,a1,c000bb10 <vprintfmt+0x41c>
c000b914:	000aa603          	lw	a2,0(s5)
c000b918:	00000693          	li	a3,0
c000b91c:	004a8a93          	addi	s5,s5,4
c000b920:	00800713          	li	a4,8
c000b924:	ef9ff06f          	j	c000b81c <vprintfmt+0x128>
c000b928:	03000513          	li	a0,48
c000b92c:	00090593          	mv	a1,s2
c000b930:	01012023          	sw	a6,0(sp)
c000b934:	000980e7          	jalr	s3
c000b938:	00090593          	mv	a1,s2
c000b93c:	07800513          	li	a0,120
c000b940:	000980e7          	jalr	s3
c000b944:	000aa603          	lw	a2,0(s5)
c000b948:	00000693          	li	a3,0
c000b94c:	01000713          	li	a4,16
c000b950:	004a8a93          	addi	s5,s5,4
c000b954:	00012803          	lw	a6,0(sp)
c000b958:	ec5ff06f          	j	c000b81c <vprintfmt+0x128>
c000b95c:	000aa403          	lw	s0,0(s5)
c000b960:	004a8793          	addi	a5,s5,4
c000b964:	00f12223          	sw	a5,4(sp)
c000b968:	24040863          	beqz	s0,c000bbb8 <vprintfmt+0x4c4>
c000b96c:	05b05263          	blez	s11,c000b9b0 <vprintfmt+0x2bc>
c000b970:	02d00793          	li	a5,45
c000b974:	22f80263          	beq	a6,a5,c000bb98 <vprintfmt+0x4a4>
c000b978:	000d0593          	mv	a1,s10
c000b97c:	00040513          	mv	a0,s0
c000b980:	01012023          	sw	a6,0(sp)
c000b984:	bcdff0ef          	jal	ra,c000b550 <strnlen>
c000b988:	40ad8db3          	sub	s11,s11,a0
c000b98c:	03b05263          	blez	s11,c000b9b0 <vprintfmt+0x2bc>
c000b990:	00012803          	lw	a6,0(sp)
c000b994:	00080513          	mv	a0,a6
c000b998:	00090593          	mv	a1,s2
c000b99c:	01012023          	sw	a6,0(sp)
c000b9a0:	fffd8d93          	addi	s11,s11,-1
c000b9a4:	000980e7          	jalr	s3
c000b9a8:	00012803          	lw	a6,0(sp)
c000b9ac:	fe0d94e3          	bnez	s11,c000b994 <vprintfmt+0x2a0>
c000b9b0:	00044783          	lbu	a5,0(s0)
c000b9b4:	00140a93          	addi	s5,s0,1
c000b9b8:	00078513          	mv	a0,a5
c000b9bc:	04078c63          	beqz	a5,c000ba14 <vprintfmt+0x320>
c000b9c0:	03f00413          	li	s0,63
c000b9c4:	000d4663          	bltz	s10,c000b9d0 <vprintfmt+0x2dc>
c000b9c8:	fffd0d13          	addi	s10,s10,-1
c000b9cc:	036d0663          	beq	s10,s6,c000b9f8 <vprintfmt+0x304>
c000b9d0:	00090593          	mv	a1,s2
c000b9d4:	00048663          	beqz	s1,c000b9e0 <vprintfmt+0x2ec>
c000b9d8:	fe078793          	addi	a5,a5,-32
c000b9dc:	12fbe463          	bltu	s7,a5,c000bb04 <vprintfmt+0x410>
c000b9e0:	000980e7          	jalr	s3
c000b9e4:	001a8a93          	addi	s5,s5,1
c000b9e8:	fffac783          	lbu	a5,-1(s5)
c000b9ec:	fffd8d93          	addi	s11,s11,-1
c000b9f0:	00078513          	mv	a0,a5
c000b9f4:	fc0798e3          	bnez	a5,c000b9c4 <vprintfmt+0x2d0>
c000b9f8:	01b05e63          	blez	s11,c000ba14 <vprintfmt+0x320>
c000b9fc:	02000413          	li	s0,32
c000ba00:	fffd8d93          	addi	s11,s11,-1
c000ba04:	00090593          	mv	a1,s2
c000ba08:	00040513          	mv	a0,s0
c000ba0c:	000980e7          	jalr	s3
c000ba10:	fe0d98e3          	bnez	s11,c000ba00 <vprintfmt+0x30c>
c000ba14:	00412a83          	lw	s5,4(sp)
c000ba18:	d39ff06f          	j	c000b750 <vprintfmt+0x5c>
c000ba1c:	00100793          	li	a5,1
c000ba20:	10b7c663          	blt	a5,a1,c000bb2c <vprintfmt+0x438>
c000ba24:	000aa603          	lw	a2,0(s5)
c000ba28:	00000693          	li	a3,0
c000ba2c:	004a8a93          	addi	s5,s5,4
c000ba30:	00a00713          	li	a4,10
c000ba34:	de9ff06f          	j	c000b81c <vprintfmt+0x128>
c000ba38:	00144e03          	lbu	t3,1(s0)
c000ba3c:	00050813          	mv	a6,a0
c000ba40:	000c8413          	mv	s0,s9
c000ba44:	d61ff06f          	j	c000b7a4 <vprintfmt+0xb0>
c000ba48:	00090593          	mv	a1,s2
c000ba4c:	02500513          	li	a0,37
c000ba50:	000980e7          	jalr	s3
c000ba54:	cfdff06f          	j	c000b750 <vprintfmt+0x5c>
c000ba58:	000aad03          	lw	s10,0(s5)
c000ba5c:	00144e03          	lbu	t3,1(s0)
c000ba60:	004a8a93          	addi	s5,s5,4
c000ba64:	000c8413          	mv	s0,s9
c000ba68:	d20ddee3          	bgez	s11,c000b7a4 <vprintfmt+0xb0>
c000ba6c:	000d0d93          	mv	s11,s10
c000ba70:	fff00d13          	li	s10,-1
c000ba74:	d31ff06f          	j	c000b7a4 <vprintfmt+0xb0>
c000ba78:	00144e03          	lbu	t3,1(s0)
c000ba7c:	00088813          	mv	a6,a7
c000ba80:	000c8413          	mv	s0,s9
c000ba84:	d21ff06f          	j	c000b7a4 <vprintfmt+0xb0>
c000ba88:	00144703          	lbu	a4,1(s0)
c000ba8c:	fd0e0d13          	addi	s10,t3,-48
c000ba90:	fd070793          	addi	a5,a4,-48
c000ba94:	14f66863          	bltu	a2,a5,c000bbe4 <vprintfmt+0x4f0>
c000ba98:	000c8413          	mv	s0,s9
c000ba9c:	002d1793          	slli	a5,s10,0x2
c000baa0:	01a78d33          	add	s10,a5,s10
c000baa4:	00140413          	addi	s0,s0,1
c000baa8:	001d1d13          	slli	s10,s10,0x1
c000baac:	00ed0d33          	add	s10,s10,a4
c000bab0:	00044703          	lbu	a4,0(s0)
c000bab4:	fd0d0d13          	addi	s10,s10,-48
c000bab8:	fd070793          	addi	a5,a4,-48
c000babc:	fef670e3          	bleu	a5,a2,c000ba9c <vprintfmt+0x3a8>
c000bac0:	00070e13          	mv	t3,a4
c000bac4:	fa5ff06f          	j	c000ba68 <vprintfmt+0x374>
c000bac8:	0e0dc463          	bltz	s11,c000bbb0 <vprintfmt+0x4bc>
c000bacc:	00144e03          	lbu	t3,1(s0)
c000bad0:	000c8413          	mv	s0,s9
c000bad4:	cd1ff06f          	j	c000b7a4 <vprintfmt+0xb0>
c000bad8:	00090593          	mv	a1,s2
c000badc:	02500513          	li	a0,37
c000bae0:	000980e7          	jalr	s3
c000bae4:	fff44783          	lbu	a5,-1(s0)
c000bae8:	02500713          	li	a4,37
c000baec:	00040c93          	mv	s9,s0
c000baf0:	c6e780e3          	beq	a5,a4,c000b750 <vprintfmt+0x5c>
c000baf4:	fffc8c93          	addi	s9,s9,-1
c000baf8:	fffcc783          	lbu	a5,-1(s9)
c000bafc:	fee79ce3          	bne	a5,a4,c000baf4 <vprintfmt+0x400>
c000bb00:	c51ff06f          	j	c000b750 <vprintfmt+0x5c>
c000bb04:	00040513          	mv	a0,s0
c000bb08:	000980e7          	jalr	s3
c000bb0c:	ed9ff06f          	j	c000b9e4 <vprintfmt+0x2f0>
c000bb10:	007a8793          	addi	a5,s5,7
c000bb14:	ff87f793          	andi	a5,a5,-8
c000bb18:	00878a93          	addi	s5,a5,8
c000bb1c:	0007a603          	lw	a2,0(a5)
c000bb20:	0047a683          	lw	a3,4(a5)
c000bb24:	00800713          	li	a4,8
c000bb28:	cf5ff06f          	j	c000b81c <vprintfmt+0x128>
c000bb2c:	007a8793          	addi	a5,s5,7
c000bb30:	ff87f793          	andi	a5,a5,-8
c000bb34:	00878a93          	addi	s5,a5,8
c000bb38:	0007a603          	lw	a2,0(a5)
c000bb3c:	0047a683          	lw	a3,4(a5)
c000bb40:	00a00713          	li	a4,10
c000bb44:	cd9ff06f          	j	c000b81c <vprintfmt+0x128>
c000bb48:	007a8793          	addi	a5,s5,7
c000bb4c:	ff87f793          	andi	a5,a5,-8
c000bb50:	00878a93          	addi	s5,a5,8
c000bb54:	0007a603          	lw	a2,0(a5)
c000bb58:	0047a683          	lw	a3,4(a5)
c000bb5c:	01000713          	li	a4,16
c000bb60:	cbdff06f          	j	c000b81c <vprintfmt+0x128>
c000bb64:	007a8793          	addi	a5,s5,7
c000bb68:	ff87f793          	andi	a5,a5,-8
c000bb6c:	00878a93          	addi	s5,a5,8
c000bb70:	0007a603          	lw	a2,0(a5)
c000bb74:	0047a683          	lw	a3,4(a5)
c000bb78:	cf1ff06f          	j	c000b868 <vprintfmt+0x174>
c000bb7c:	00078693          	mv	a3,a5
c000bb80:	00003617          	auipc	a2,0x3
c000bb84:	8fc60613          	addi	a2,a2,-1796 # c000e47c <error_string+0x124>
c000bb88:	00090593          	mv	a1,s2
c000bb8c:	00098513          	mv	a0,s3
c000bb90:	078000ef          	jal	ra,c000bc08 <printfmt>
c000bb94:	bbdff06f          	j	c000b750 <vprintfmt+0x5c>
c000bb98:	00044783          	lbu	a5,0(s0)
c000bb9c:	00140a93          	addi	s5,s0,1
c000bba0:	00078513          	mv	a0,a5
c000bba4:	e4078ce3          	beqz	a5,c000b9fc <vprintfmt+0x308>
c000bba8:	03f00413          	li	s0,63
c000bbac:	e19ff06f          	j	c000b9c4 <vprintfmt+0x2d0>
c000bbb0:	00000d93          	li	s11,0
c000bbb4:	f19ff06f          	j	c000bacc <vprintfmt+0x3d8>
c000bbb8:	03b05c63          	blez	s11,c000bbf0 <vprintfmt+0x4fc>
c000bbbc:	02d00793          	li	a5,45
c000bbc0:	00003417          	auipc	s0,0x3
c000bbc4:	8b440413          	addi	s0,s0,-1868 # c000e474 <error_string+0x11c>
c000bbc8:	daf818e3          	bne	a6,a5,c000b978 <vprintfmt+0x284>
c000bbcc:	00003a97          	auipc	s5,0x3
c000bbd0:	8a9a8a93          	addi	s5,s5,-1879 # c000e475 <error_string+0x11d>
c000bbd4:	000c0513          	mv	a0,s8
c000bbd8:	000c0793          	mv	a5,s8
c000bbdc:	03f00413          	li	s0,63
c000bbe0:	de5ff06f          	j	c000b9c4 <vprintfmt+0x2d0>
c000bbe4:	00070e13          	mv	t3,a4
c000bbe8:	000c8413          	mv	s0,s9
c000bbec:	e7dff06f          	j	c000ba68 <vprintfmt+0x374>
c000bbf0:	000c0793          	mv	a5,s8
c000bbf4:	000c0513          	mv	a0,s8
c000bbf8:	00003a97          	auipc	s5,0x3
c000bbfc:	87da8a93          	addi	s5,s5,-1923 # c000e475 <error_string+0x11d>
c000bc00:	03f00413          	li	s0,63
c000bc04:	dc1ff06f          	j	c000b9c4 <vprintfmt+0x2d0>

c000bc08 <printfmt>:
c000bc08:	fc010113          	addi	sp,sp,-64
c000bc0c:	02c10313          	addi	t1,sp,44
c000bc10:	02d12623          	sw	a3,44(sp)
c000bc14:	00030693          	mv	a3,t1
c000bc18:	00112e23          	sw	ra,28(sp)
c000bc1c:	02e12823          	sw	a4,48(sp)
c000bc20:	02f12a23          	sw	a5,52(sp)
c000bc24:	03012c23          	sw	a6,56(sp)
c000bc28:	03112e23          	sw	a7,60(sp)
c000bc2c:	00612623          	sw	t1,12(sp)
c000bc30:	ac5ff0ef          	jal	ra,c000b6f4 <vprintfmt>
c000bc34:	01c12083          	lw	ra,28(sp)
c000bc38:	04010113          	addi	sp,sp,64
c000bc3c:	00008067          	ret

c000bc40 <hash32>:
c000bc40:	9e3707b7          	lui	a5,0x9e370
c000bc44:	00178793          	addi	a5,a5,1 # 9e370001 <sbi_remote_fence_i+0x9e370711>
c000bc48:	02f50533          	mul	a0,a0,a5
c000bc4c:	02000793          	li	a5,32
c000bc50:	40b785b3          	sub	a1,a5,a1
c000bc54:	00b55533          	srl	a0,a0,a1
c000bc58:	00008067          	ret
