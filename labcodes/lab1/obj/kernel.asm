
bin/kernel:     file format elf32-littleriscv


Disassembly of section .text:

c0000000 <kern_entry>:
c0000000:	00004117          	auipc	sp,0x4
c0000004:	00010113          	mv	sp,sp
c0000008:	0040006f          	j	c000000c <kern_init>

c000000c <kern_init>:
c000000c:	00004517          	auipc	a0,0x4
c0000010:	ff450513          	addi	a0,a0,-12 # c0004000 <bootstacktop>
c0000014:	00004617          	auipc	a2,0x4
c0000018:	ff860613          	addi	a2,a2,-8 # c000400c <end>
c000001c:	ff010113          	addi	sp,sp,-16 # c0003ff0 <bootstack+0x1ff0>
c0000020:	40a60633          	sub	a2,a2,a0
c0000024:	00000593          	li	a1,0
c0000028:	00112623          	sw	ra,12(sp)
c000002c:	700000ef          	jal	ra,c000072c <memset>
c0000030:	1d8000ef          	jal	ra,c0000208 <cons_init>
c0000034:	00001597          	auipc	a1,0x1
c0000038:	d0858593          	addi	a1,a1,-760 # c0000d3c <etext>
c000003c:	00001517          	auipc	a0,0x1
c0000040:	d2050513          	addi	a0,a0,-736 # c0000d5c <etext+0x20>
c0000044:	050000ef          	jal	ra,c0000094 <cprintf>
c0000048:	0a4000ef          	jal	ra,c00000ec <print_kerninfo>
c000004c:	69c000ef          	jal	ra,c00006e8 <pmm_init>
c0000050:	1c8000ef          	jal	ra,c0000218 <pic_init>
c0000054:	1d0000ef          	jal	ra,c0000224 <idt_init>
c0000058:	168000ef          	jal	ra,c00001c0 <clock_init>
c000005c:	1c0000ef          	jal	ra,c000021c <intr_enable>
c0000060:	0000006f          	j	c0000060 <kern_init+0x54>

c0000064 <cputch>:
c0000064:	ff010113          	addi	sp,sp,-16
c0000068:	00112623          	sw	ra,12(sp)
c000006c:	00812423          	sw	s0,8(sp)
c0000070:	00058413          	mv	s0,a1
c0000074:	198000ef          	jal	ra,c000020c <cons_putc>
c0000078:	00042783          	lw	a5,0(s0)
c000007c:	00c12083          	lw	ra,12(sp)
c0000080:	00178793          	addi	a5,a5,1
c0000084:	00f42023          	sw	a5,0(s0)
c0000088:	00812403          	lw	s0,8(sp)
c000008c:	01010113          	addi	sp,sp,16
c0000090:	00008067          	ret

c0000094 <cprintf>:
c0000094:	fc010113          	addi	sp,sp,-64
c0000098:	02410313          	addi	t1,sp,36
c000009c:	02b12223          	sw	a1,36(sp)
c00000a0:	02c12423          	sw	a2,40(sp)
c00000a4:	02d12623          	sw	a3,44(sp)
c00000a8:	00050613          	mv	a2,a0
c00000ac:	00c10593          	addi	a1,sp,12
c00000b0:	00000517          	auipc	a0,0x0
c00000b4:	fb450513          	addi	a0,a0,-76 # c0000064 <cputch>
c00000b8:	00030693          	mv	a3,t1
c00000bc:	00112e23          	sw	ra,28(sp)
c00000c0:	02e12823          	sw	a4,48(sp)
c00000c4:	02f12a23          	sw	a5,52(sp)
c00000c8:	03012c23          	sw	a6,56(sp)
c00000cc:	03112e23          	sw	a7,60(sp)
c00000d0:	00612423          	sw	t1,8(sp)
c00000d4:	00012623          	sw	zero,12(sp)
c00000d8:	718000ef          	jal	ra,c00007f0 <vprintfmt>
c00000dc:	01c12083          	lw	ra,28(sp)
c00000e0:	00c12503          	lw	a0,12(sp)
c00000e4:	04010113          	addi	sp,sp,64
c00000e8:	00008067          	ret

c00000ec <print_kerninfo>:
c00000ec:	ff010113          	addi	sp,sp,-16
c00000f0:	00001517          	auipc	a0,0x1
c00000f4:	c7450513          	addi	a0,a0,-908 # c0000d64 <etext+0x28>
c00000f8:	00112623          	sw	ra,12(sp)
c00000fc:	f99ff0ef          	jal	ra,c0000094 <cprintf>
c0000100:	00000597          	auipc	a1,0x0
c0000104:	f0c58593          	addi	a1,a1,-244 # c000000c <kern_init>
c0000108:	00001517          	auipc	a0,0x1
c000010c:	c7850513          	addi	a0,a0,-904 # c0000d80 <etext+0x44>
c0000110:	f85ff0ef          	jal	ra,c0000094 <cprintf>
c0000114:	00001597          	auipc	a1,0x1
c0000118:	c2858593          	addi	a1,a1,-984 # c0000d3c <etext>
c000011c:	00001517          	auipc	a0,0x1
c0000120:	c8050513          	addi	a0,a0,-896 # c0000d9c <etext+0x60>
c0000124:	f71ff0ef          	jal	ra,c0000094 <cprintf>
c0000128:	00004597          	auipc	a1,0x4
c000012c:	ed858593          	addi	a1,a1,-296 # c0004000 <bootstacktop>
c0000130:	00001517          	auipc	a0,0x1
c0000134:	c8850513          	addi	a0,a0,-888 # c0000db8 <etext+0x7c>
c0000138:	f5dff0ef          	jal	ra,c0000094 <cprintf>
c000013c:	00004597          	auipc	a1,0x4
c0000140:	ed058593          	addi	a1,a1,-304 # c000400c <end>
c0000144:	00001517          	auipc	a0,0x1
c0000148:	c9050513          	addi	a0,a0,-880 # c0000dd4 <etext+0x98>
c000014c:	f49ff0ef          	jal	ra,c0000094 <cprintf>
c0000150:	00004597          	auipc	a1,0x4
c0000154:	2bb58593          	addi	a1,a1,699 # c000440b <end+0x3ff>
c0000158:	00000797          	auipc	a5,0x0
c000015c:	eb478793          	addi	a5,a5,-332 # c000000c <kern_init>
c0000160:	40f587b3          	sub	a5,a1,a5
c0000164:	41f7d593          	srai	a1,a5,0x1f
c0000168:	3ff5f593          	andi	a1,a1,1023
c000016c:	00c12083          	lw	ra,12(sp)
c0000170:	00f585b3          	add	a1,a1,a5
c0000174:	40a5d593          	srai	a1,a1,0xa
c0000178:	00001517          	auipc	a0,0x1
c000017c:	c7850513          	addi	a0,a0,-904 # c0000df0 <etext+0xb4>
c0000180:	01010113          	addi	sp,sp,16
c0000184:	f11ff06f          	j	c0000094 <cprintf>

c0000188 <clock_set_next_event>:
c0000188:	c81027f3          	rdtimeh	a5
c000018c:	c01025f3          	rdtime	a1
c0000190:	c8102773          	rdtimeh	a4
c0000194:	fee79ae3          	bne	a5,a4,c0000188 <clock_set_next_event>
c0000198:	00004717          	auipc	a4,0x4
c000019c:	e6870713          	addi	a4,a4,-408 # c0004000 <bootstacktop>
c00001a0:	00072503          	lw	a0,0(a4)
c00001a4:	00472703          	lw	a4,4(a4)
c00001a8:	00a58533          	add	a0,a1,a0
c00001ac:	00b535b3          	sltu	a1,a0,a1
c00001b0:	00e787b3          	add	a5,a5,a4
c00001b4:	00f585b3          	add	a1,a1,a5
c00001b8:	3ffff317          	auipc	t1,0x3ffff
c00001bc:	6e830067          	jr	1768(t1) # fffff8a0 <sbi_set_timer>

c00001c0 <clock_init>:
c00001c0:	ff010113          	addi	sp,sp,-16
c00001c4:	00112623          	sw	ra,12(sp)
c00001c8:	3ffff317          	auipc	t1,0x3ffff
c00001cc:	6b8300e7          	jalr	1720(t1) # fffff880 <sbi_timebase>
c00001d0:	1f400793          	li	a5,500
c00001d4:	02f55533          	divu	a0,a0,a5
c00001d8:	00004797          	auipc	a5,0x4
c00001dc:	e2878793          	addi	a5,a5,-472 # c0004000 <bootstacktop>
c00001e0:	0007a223          	sw	zero,4(a5)
c00001e4:	00a7a023          	sw	a0,0(a5)
c00001e8:	fa1ff0ef          	jal	ra,c0000188 <clock_set_next_event>
c00001ec:	00c12083          	lw	ra,12(sp)
c00001f0:	00001517          	auipc	a0,0x1
c00001f4:	c2c50513          	addi	a0,a0,-980 # c0000e1c <etext+0xe0>
c00001f8:	00004297          	auipc	t0,0x4
c00001fc:	e002a823          	sw	zero,-496(t0) # c0004008 <ticks>
c0000200:	01010113          	addi	sp,sp,16
c0000204:	e91ff06f          	j	c0000094 <cprintf>

c0000208 <cons_init>:
c0000208:	00008067          	ret

c000020c <cons_putc>:
c000020c:	0ff57513          	andi	a0,a0,255
c0000210:	3ffff317          	auipc	t1,0x3ffff
c0000214:	62030067          	jr	1568(t1) # fffff830 <sbi_console_putchar>

c0000218 <pic_init>:
c0000218:	00008067          	ret

c000021c <intr_enable>:
c000021c:	100167f3          	csrrsi	a5,sstatus,2
c0000220:	00008067          	ret

c0000224 <idt_init>:
c0000224:	14005073          	csrwi	sscratch,0
c0000228:	00000797          	auipc	a5,0x0
c000022c:	37c78793          	addi	a5,a5,892 # c00005a4 <__alltraps>
c0000230:	10579073          	csrw	stvec,a5
c0000234:	00008067          	ret

c0000238 <print_regs>:
c0000238:	00052583          	lw	a1,0(a0)
c000023c:	ff010113          	addi	sp,sp,-16
c0000240:	00812423          	sw	s0,8(sp)
c0000244:	00050413          	mv	s0,a0
c0000248:	00001517          	auipc	a0,0x1
c000024c:	cc450513          	addi	a0,a0,-828 # c0000f0c <etext+0x1d0>
c0000250:	00112623          	sw	ra,12(sp)
c0000254:	e41ff0ef          	jal	ra,c0000094 <cprintf>
c0000258:	00442583          	lw	a1,4(s0)
c000025c:	00001517          	auipc	a0,0x1
c0000260:	cc450513          	addi	a0,a0,-828 # c0000f20 <etext+0x1e4>
c0000264:	e31ff0ef          	jal	ra,c0000094 <cprintf>
c0000268:	00842583          	lw	a1,8(s0)
c000026c:	00001517          	auipc	a0,0x1
c0000270:	cc850513          	addi	a0,a0,-824 # c0000f34 <etext+0x1f8>
c0000274:	e21ff0ef          	jal	ra,c0000094 <cprintf>
c0000278:	00c42583          	lw	a1,12(s0)
c000027c:	00001517          	auipc	a0,0x1
c0000280:	ccc50513          	addi	a0,a0,-820 # c0000f48 <etext+0x20c>
c0000284:	e11ff0ef          	jal	ra,c0000094 <cprintf>
c0000288:	01042583          	lw	a1,16(s0)
c000028c:	00001517          	auipc	a0,0x1
c0000290:	cd050513          	addi	a0,a0,-816 # c0000f5c <etext+0x220>
c0000294:	e01ff0ef          	jal	ra,c0000094 <cprintf>
c0000298:	01442583          	lw	a1,20(s0)
c000029c:	00001517          	auipc	a0,0x1
c00002a0:	cd450513          	addi	a0,a0,-812 # c0000f70 <etext+0x234>
c00002a4:	df1ff0ef          	jal	ra,c0000094 <cprintf>
c00002a8:	01842583          	lw	a1,24(s0)
c00002ac:	00001517          	auipc	a0,0x1
c00002b0:	cd850513          	addi	a0,a0,-808 # c0000f84 <etext+0x248>
c00002b4:	de1ff0ef          	jal	ra,c0000094 <cprintf>
c00002b8:	01c42583          	lw	a1,28(s0)
c00002bc:	00001517          	auipc	a0,0x1
c00002c0:	cdc50513          	addi	a0,a0,-804 # c0000f98 <etext+0x25c>
c00002c4:	dd1ff0ef          	jal	ra,c0000094 <cprintf>
c00002c8:	02042583          	lw	a1,32(s0)
c00002cc:	00001517          	auipc	a0,0x1
c00002d0:	ce050513          	addi	a0,a0,-800 # c0000fac <etext+0x270>
c00002d4:	dc1ff0ef          	jal	ra,c0000094 <cprintf>
c00002d8:	02442583          	lw	a1,36(s0)
c00002dc:	00001517          	auipc	a0,0x1
c00002e0:	ce450513          	addi	a0,a0,-796 # c0000fc0 <etext+0x284>
c00002e4:	db1ff0ef          	jal	ra,c0000094 <cprintf>
c00002e8:	02842583          	lw	a1,40(s0)
c00002ec:	00001517          	auipc	a0,0x1
c00002f0:	ce850513          	addi	a0,a0,-792 # c0000fd4 <etext+0x298>
c00002f4:	da1ff0ef          	jal	ra,c0000094 <cprintf>
c00002f8:	02c42583          	lw	a1,44(s0)
c00002fc:	00001517          	auipc	a0,0x1
c0000300:	cec50513          	addi	a0,a0,-788 # c0000fe8 <etext+0x2ac>
c0000304:	d91ff0ef          	jal	ra,c0000094 <cprintf>
c0000308:	03042583          	lw	a1,48(s0)
c000030c:	00001517          	auipc	a0,0x1
c0000310:	cf050513          	addi	a0,a0,-784 # c0000ffc <etext+0x2c0>
c0000314:	d81ff0ef          	jal	ra,c0000094 <cprintf>
c0000318:	03442583          	lw	a1,52(s0)
c000031c:	00001517          	auipc	a0,0x1
c0000320:	cf450513          	addi	a0,a0,-780 # c0001010 <etext+0x2d4>
c0000324:	d71ff0ef          	jal	ra,c0000094 <cprintf>
c0000328:	03842583          	lw	a1,56(s0)
c000032c:	00001517          	auipc	a0,0x1
c0000330:	cf850513          	addi	a0,a0,-776 # c0001024 <etext+0x2e8>
c0000334:	d61ff0ef          	jal	ra,c0000094 <cprintf>
c0000338:	03c42583          	lw	a1,60(s0)
c000033c:	00001517          	auipc	a0,0x1
c0000340:	cfc50513          	addi	a0,a0,-772 # c0001038 <etext+0x2fc>
c0000344:	d51ff0ef          	jal	ra,c0000094 <cprintf>
c0000348:	04042583          	lw	a1,64(s0)
c000034c:	00001517          	auipc	a0,0x1
c0000350:	d0050513          	addi	a0,a0,-768 # c000104c <etext+0x310>
c0000354:	d41ff0ef          	jal	ra,c0000094 <cprintf>
c0000358:	04442583          	lw	a1,68(s0)
c000035c:	00001517          	auipc	a0,0x1
c0000360:	d0450513          	addi	a0,a0,-764 # c0001060 <etext+0x324>
c0000364:	d31ff0ef          	jal	ra,c0000094 <cprintf>
c0000368:	04842583          	lw	a1,72(s0)
c000036c:	00001517          	auipc	a0,0x1
c0000370:	d0850513          	addi	a0,a0,-760 # c0001074 <etext+0x338>
c0000374:	d21ff0ef          	jal	ra,c0000094 <cprintf>
c0000378:	04c42583          	lw	a1,76(s0)
c000037c:	00001517          	auipc	a0,0x1
c0000380:	d0c50513          	addi	a0,a0,-756 # c0001088 <etext+0x34c>
c0000384:	d11ff0ef          	jal	ra,c0000094 <cprintf>
c0000388:	05042583          	lw	a1,80(s0)
c000038c:	00001517          	auipc	a0,0x1
c0000390:	d1050513          	addi	a0,a0,-752 # c000109c <etext+0x360>
c0000394:	d01ff0ef          	jal	ra,c0000094 <cprintf>
c0000398:	05442583          	lw	a1,84(s0)
c000039c:	00001517          	auipc	a0,0x1
c00003a0:	d1450513          	addi	a0,a0,-748 # c00010b0 <etext+0x374>
c00003a4:	cf1ff0ef          	jal	ra,c0000094 <cprintf>
c00003a8:	05842583          	lw	a1,88(s0)
c00003ac:	00001517          	auipc	a0,0x1
c00003b0:	d1850513          	addi	a0,a0,-744 # c00010c4 <etext+0x388>
c00003b4:	ce1ff0ef          	jal	ra,c0000094 <cprintf>
c00003b8:	05c42583          	lw	a1,92(s0)
c00003bc:	00001517          	auipc	a0,0x1
c00003c0:	d1c50513          	addi	a0,a0,-740 # c00010d8 <etext+0x39c>
c00003c4:	cd1ff0ef          	jal	ra,c0000094 <cprintf>
c00003c8:	06042583          	lw	a1,96(s0)
c00003cc:	00001517          	auipc	a0,0x1
c00003d0:	d2050513          	addi	a0,a0,-736 # c00010ec <etext+0x3b0>
c00003d4:	cc1ff0ef          	jal	ra,c0000094 <cprintf>
c00003d8:	06442583          	lw	a1,100(s0)
c00003dc:	00001517          	auipc	a0,0x1
c00003e0:	d2450513          	addi	a0,a0,-732 # c0001100 <etext+0x3c4>
c00003e4:	cb1ff0ef          	jal	ra,c0000094 <cprintf>
c00003e8:	06842583          	lw	a1,104(s0)
c00003ec:	00001517          	auipc	a0,0x1
c00003f0:	d2850513          	addi	a0,a0,-728 # c0001114 <etext+0x3d8>
c00003f4:	ca1ff0ef          	jal	ra,c0000094 <cprintf>
c00003f8:	06c42583          	lw	a1,108(s0)
c00003fc:	00001517          	auipc	a0,0x1
c0000400:	d2c50513          	addi	a0,a0,-724 # c0001128 <etext+0x3ec>
c0000404:	c91ff0ef          	jal	ra,c0000094 <cprintf>
c0000408:	07042583          	lw	a1,112(s0)
c000040c:	00001517          	auipc	a0,0x1
c0000410:	d3050513          	addi	a0,a0,-720 # c000113c <etext+0x400>
c0000414:	c81ff0ef          	jal	ra,c0000094 <cprintf>
c0000418:	07442583          	lw	a1,116(s0)
c000041c:	00001517          	auipc	a0,0x1
c0000420:	d3450513          	addi	a0,a0,-716 # c0001150 <etext+0x414>
c0000424:	c71ff0ef          	jal	ra,c0000094 <cprintf>
c0000428:	07842583          	lw	a1,120(s0)
c000042c:	00001517          	auipc	a0,0x1
c0000430:	d3850513          	addi	a0,a0,-712 # c0001164 <etext+0x428>
c0000434:	c61ff0ef          	jal	ra,c0000094 <cprintf>
c0000438:	07c42583          	lw	a1,124(s0)
c000043c:	00c12083          	lw	ra,12(sp)
c0000440:	00812403          	lw	s0,8(sp)
c0000444:	00001517          	auipc	a0,0x1
c0000448:	d3450513          	addi	a0,a0,-716 # c0001178 <etext+0x43c>
c000044c:	01010113          	addi	sp,sp,16
c0000450:	c45ff06f          	j	c0000094 <cprintf>

c0000454 <print_trapframe>:
c0000454:	ff010113          	addi	sp,sp,-16
c0000458:	00050593          	mv	a1,a0
c000045c:	00812423          	sw	s0,8(sp)
c0000460:	00050413          	mv	s0,a0
c0000464:	00001517          	auipc	a0,0x1
c0000468:	d2850513          	addi	a0,a0,-728 # c000118c <etext+0x450>
c000046c:	00112623          	sw	ra,12(sp)
c0000470:	c25ff0ef          	jal	ra,c0000094 <cprintf>
c0000474:	00040513          	mv	a0,s0
c0000478:	dc1ff0ef          	jal	ra,c0000238 <print_regs>
c000047c:	08042583          	lw	a1,128(s0)
c0000480:	00001517          	auipc	a0,0x1
c0000484:	d2050513          	addi	a0,a0,-736 # c00011a0 <etext+0x464>
c0000488:	c0dff0ef          	jal	ra,c0000094 <cprintf>
c000048c:	08442583          	lw	a1,132(s0)
c0000490:	00001517          	auipc	a0,0x1
c0000494:	d2450513          	addi	a0,a0,-732 # c00011b4 <etext+0x478>
c0000498:	bfdff0ef          	jal	ra,c0000094 <cprintf>
c000049c:	08842583          	lw	a1,136(s0)
c00004a0:	00001517          	auipc	a0,0x1
c00004a4:	d2850513          	addi	a0,a0,-728 # c00011c8 <etext+0x48c>
c00004a8:	bedff0ef          	jal	ra,c0000094 <cprintf>
c00004ac:	08c42583          	lw	a1,140(s0)
c00004b0:	00c12083          	lw	ra,12(sp)
c00004b4:	00812403          	lw	s0,8(sp)
c00004b8:	00001517          	auipc	a0,0x1
c00004bc:	d2450513          	addi	a0,a0,-732 # c00011dc <etext+0x4a0>
c00004c0:	01010113          	addi	sp,sp,16
c00004c4:	bd1ff06f          	j	c0000094 <cprintf>

c00004c8 <interrupt_handler>:
c00004c8:	08c52783          	lw	a5,140(a0)
c00004cc:	80000737          	lui	a4,0x80000
c00004d0:	fff74713          	not	a4,a4
c00004d4:	00e7f7b3          	and	a5,a5,a4
c00004d8:	00b00713          	li	a4,11
c00004dc:	08f76a63          	bltu	a4,a5,c0000570 <interrupt_handler+0xa8>
c00004e0:	00001717          	auipc	a4,0x1
c00004e4:	95870713          	addi	a4,a4,-1704 # c0000e38 <etext+0xfc>
c00004e8:	00279793          	slli	a5,a5,0x2
c00004ec:	00e787b3          	add	a5,a5,a4
c00004f0:	0007a783          	lw	a5,0(a5)
c00004f4:	00e787b3          	add	a5,a5,a4
c00004f8:	00078067          	jr	a5
c00004fc:	00001517          	auipc	a0,0x1
c0000500:	96c50513          	addi	a0,a0,-1684 # c0000e68 <etext+0x12c>
c0000504:	b91ff06f          	j	c0000094 <cprintf>
c0000508:	00001517          	auipc	a0,0x1
c000050c:	99c50513          	addi	a0,a0,-1636 # c0000ea4 <etext+0x168>
c0000510:	b85ff06f          	j	c0000094 <cprintf>
c0000514:	00001517          	auipc	a0,0x1
c0000518:	9b050513          	addi	a0,a0,-1616 # c0000ec4 <etext+0x188>
c000051c:	b79ff06f          	j	c0000094 <cprintf>
c0000520:	00001517          	auipc	a0,0x1
c0000524:	9cc50513          	addi	a0,a0,-1588 # c0000eec <etext+0x1b0>
c0000528:	b6dff06f          	j	c0000094 <cprintf>
c000052c:	ff010113          	addi	sp,sp,-16
c0000530:	00112623          	sw	ra,12(sp)
c0000534:	c55ff0ef          	jal	ra,c0000188 <clock_set_next_event>
c0000538:	00004797          	auipc	a5,0x4
c000053c:	ad07a783          	lw	a5,-1328(a5) # c0004008 <ticks>
c0000540:	00178793          	addi	a5,a5,1
c0000544:	06400593          	li	a1,100
c0000548:	02b7f733          	remu	a4,a5,a1
c000054c:	00004297          	auipc	t0,0x4
c0000550:	aaf2ae23          	sw	a5,-1348(t0) # c0004008 <ticks>
c0000554:	02070063          	beqz	a4,c0000574 <interrupt_handler+0xac>
c0000558:	00c12083          	lw	ra,12(sp)
c000055c:	01010113          	addi	sp,sp,16
c0000560:	00008067          	ret
c0000564:	00001517          	auipc	a0,0x1
c0000568:	92050513          	addi	a0,a0,-1760 # c0000e84 <etext+0x148>
c000056c:	b29ff06f          	j	c0000094 <cprintf>
c0000570:	ee5ff06f          	j	c0000454 <print_trapframe>
c0000574:	00c12083          	lw	ra,12(sp)
c0000578:	00001517          	auipc	a0,0x1
c000057c:	96850513          	addi	a0,a0,-1688 # c0000ee0 <etext+0x1a4>
c0000580:	01010113          	addi	sp,sp,16
c0000584:	b11ff06f          	j	c0000094 <cprintf>

c0000588 <trap>:
c0000588:	08c52783          	lw	a5,140(a0)
c000058c:	0007ca63          	bltz	a5,c00005a0 <trap+0x18>
c0000590:	00b00713          	li	a4,11
c0000594:	00f76463          	bltu	a4,a5,c000059c <trap+0x14>
c0000598:	00008067          	ret
c000059c:	eb9ff06f          	j	c0000454 <print_trapframe>
c00005a0:	f29ff06f          	j	c00004c8 <interrupt_handler>

c00005a4 <__alltraps>:
c00005a4:	14011073          	csrw	sscratch,sp
c00005a8:	f7010113          	addi	sp,sp,-144
c00005ac:	00012023          	sw	zero,0(sp)
c00005b0:	00112223          	sw	ra,4(sp)
c00005b4:	00312623          	sw	gp,12(sp)
c00005b8:	00412823          	sw	tp,16(sp)
c00005bc:	00512a23          	sw	t0,20(sp)
c00005c0:	00612c23          	sw	t1,24(sp)
c00005c4:	00712e23          	sw	t2,28(sp)
c00005c8:	02812023          	sw	s0,32(sp)
c00005cc:	02912223          	sw	s1,36(sp)
c00005d0:	02a12423          	sw	a0,40(sp)
c00005d4:	02b12623          	sw	a1,44(sp)
c00005d8:	02c12823          	sw	a2,48(sp)
c00005dc:	02d12a23          	sw	a3,52(sp)
c00005e0:	02e12c23          	sw	a4,56(sp)
c00005e4:	02f12e23          	sw	a5,60(sp)
c00005e8:	05012023          	sw	a6,64(sp)
c00005ec:	05112223          	sw	a7,68(sp)
c00005f0:	05212423          	sw	s2,72(sp)
c00005f4:	05312623          	sw	s3,76(sp)
c00005f8:	05412823          	sw	s4,80(sp)
c00005fc:	05512a23          	sw	s5,84(sp)
c0000600:	05612c23          	sw	s6,88(sp)
c0000604:	05712e23          	sw	s7,92(sp)
c0000608:	07812023          	sw	s8,96(sp)
c000060c:	07912223          	sw	s9,100(sp)
c0000610:	07a12423          	sw	s10,104(sp)
c0000614:	07b12623          	sw	s11,108(sp)
c0000618:	07c12823          	sw	t3,112(sp)
c000061c:	07d12a23          	sw	t4,116(sp)
c0000620:	07e12c23          	sw	t5,120(sp)
c0000624:	07f12e23          	sw	t6,124(sp)
c0000628:	14001473          	csrrw	s0,sscratch,zero
c000062c:	100024f3          	csrr	s1,sstatus
c0000630:	14102973          	csrr	s2,sepc
c0000634:	143029f3          	csrr	s3,sbadaddr
c0000638:	14202a73          	csrr	s4,scause
c000063c:	00812423          	sw	s0,8(sp)
c0000640:	08912023          	sw	s1,128(sp)
c0000644:	09212223          	sw	s2,132(sp)
c0000648:	09312423          	sw	s3,136(sp)
c000064c:	09412623          	sw	s4,140(sp)
c0000650:	00010513          	mv	a0,sp
c0000654:	f35ff0ef          	jal	ra,c0000588 <trap>

c0000658 <__trapret>:
c0000658:	08012483          	lw	s1,128(sp)
c000065c:	08412903          	lw	s2,132(sp)
c0000660:	10049073          	csrw	sstatus,s1
c0000664:	14191073          	csrw	sepc,s2
c0000668:	00412083          	lw	ra,4(sp)
c000066c:	00c12183          	lw	gp,12(sp)
c0000670:	01012203          	lw	tp,16(sp)
c0000674:	01412283          	lw	t0,20(sp)
c0000678:	01812303          	lw	t1,24(sp)
c000067c:	01c12383          	lw	t2,28(sp)
c0000680:	02012403          	lw	s0,32(sp)
c0000684:	02412483          	lw	s1,36(sp)
c0000688:	02812503          	lw	a0,40(sp)
c000068c:	02c12583          	lw	a1,44(sp)
c0000690:	03012603          	lw	a2,48(sp)
c0000694:	03412683          	lw	a3,52(sp)
c0000698:	03812703          	lw	a4,56(sp)
c000069c:	03c12783          	lw	a5,60(sp)
c00006a0:	04012803          	lw	a6,64(sp)
c00006a4:	04412883          	lw	a7,68(sp)
c00006a8:	04812903          	lw	s2,72(sp)
c00006ac:	04c12983          	lw	s3,76(sp)
c00006b0:	05012a03          	lw	s4,80(sp)
c00006b4:	05412a83          	lw	s5,84(sp)
c00006b8:	05812b03          	lw	s6,88(sp)
c00006bc:	05c12b83          	lw	s7,92(sp)
c00006c0:	06012c03          	lw	s8,96(sp)
c00006c4:	06412c83          	lw	s9,100(sp)
c00006c8:	06812d03          	lw	s10,104(sp)
c00006cc:	06c12d83          	lw	s11,108(sp)
c00006d0:	07012e03          	lw	t3,112(sp)
c00006d4:	07412e83          	lw	t4,116(sp)
c00006d8:	07812f03          	lw	t5,120(sp)
c00006dc:	07c12f83          	lw	t6,124(sp)
c00006e0:	00812103          	lw	sp,8(sp)
c00006e4:	10200073          	sret

c00006e8 <pmm_init>:
c00006e8:	00008067          	ret

c00006ec <strnlen>:
c00006ec:	00050693          	mv	a3,a0
c00006f0:	02058a63          	beqz	a1,c0000724 <strnlen+0x38>
c00006f4:	00054703          	lbu	a4,0(a0)
c00006f8:	00150793          	addi	a5,a0,1
c00006fc:	02070463          	beqz	a4,c0000724 <strnlen+0x38>
c0000700:	00b505b3          	add	a1,a0,a1
c0000704:	0100006f          	j	c0000714 <strnlen+0x28>
c0000708:	00178793          	addi	a5,a5,1
c000070c:	fff7c703          	lbu	a4,-1(a5)
c0000710:	00070863          	beqz	a4,c0000720 <strnlen+0x34>
c0000714:	40d78533          	sub	a0,a5,a3
c0000718:	feb798e3          	bne	a5,a1,c0000708 <strnlen+0x1c>
c000071c:	00008067          	ret
c0000720:	00008067          	ret
c0000724:	00000513          	li	a0,0
c0000728:	00008067          	ret

c000072c <memset>:
c000072c:	00c50733          	add	a4,a0,a2
c0000730:	00050793          	mv	a5,a0
c0000734:	00060863          	beqz	a2,c0000744 <memset+0x18>
c0000738:	00178793          	addi	a5,a5,1
c000073c:	feb78fa3          	sb	a1,-1(a5)
c0000740:	fef71ce3          	bne	a4,a5,c0000738 <memset+0xc>
c0000744:	00008067          	ret

c0000748 <printnum>:
c0000748:	fe010113          	addi	sp,sp,-32
c000074c:	00912a23          	sw	s1,20(sp)
c0000750:	01212823          	sw	s2,16(sp)
c0000754:	01312623          	sw	s3,12(sp)
c0000758:	01412423          	sw	s4,8(sp)
c000075c:	00112e23          	sw	ra,28(sp)
c0000760:	00812c23          	sw	s0,24(sp)
c0000764:	00050493          	mv	s1,a0
c0000768:	00058913          	mv	s2,a1
c000076c:	00080993          	mv	s3,a6
c0000770:	02e67a33          	remu	s4,a2,a4
c0000774:	04069e63          	bnez	a3,c00007d0 <printnum+0x88>
c0000778:	04e67c63          	bleu	a4,a2,c00007d0 <printnum+0x88>
c000077c:	fff78413          	addi	s0,a5,-1
c0000780:	00805c63          	blez	s0,c0000798 <printnum+0x50>
c0000784:	fff40413          	addi	s0,s0,-1
c0000788:	00090593          	mv	a1,s2
c000078c:	00098513          	mv	a0,s3
c0000790:	000480e7          	jalr	s1
c0000794:	fe0418e3          	bnez	s0,c0000784 <printnum+0x3c>
c0000798:	00001797          	auipc	a5,0x1
c000079c:	bcc78793          	addi	a5,a5,-1076 # c0001364 <error_string+0x1c>
c00007a0:	014787b3          	add	a5,a5,s4
c00007a4:	00090593          	mv	a1,s2
c00007a8:	00048313          	mv	t1,s1
c00007ac:	01c12083          	lw	ra,28(sp)
c00007b0:	01812403          	lw	s0,24(sp)
c00007b4:	01412483          	lw	s1,20(sp)
c00007b8:	01012903          	lw	s2,16(sp)
c00007bc:	00c12983          	lw	s3,12(sp)
c00007c0:	00812a03          	lw	s4,8(sp)
c00007c4:	0007c503          	lbu	a0,0(a5)
c00007c8:	02010113          	addi	sp,sp,32
c00007cc:	00030067          	jr	t1
c00007d0:	02e65633          	divu	a2,a2,a4
c00007d4:	00098813          	mv	a6,s3
c00007d8:	fff78793          	addi	a5,a5,-1
c00007dc:	00000693          	li	a3,0
c00007e0:	00090593          	mv	a1,s2
c00007e4:	00048513          	mv	a0,s1
c00007e8:	f61ff0ef          	jal	ra,c0000748 <printnum>
c00007ec:	fadff06f          	j	c0000798 <printnum+0x50>

c00007f0 <vprintfmt>:
c00007f0:	fb010113          	addi	sp,sp,-80
c00007f4:	05212023          	sw	s2,64(sp)
c00007f8:	03312e23          	sw	s3,60(sp)
c00007fc:	03412c23          	sw	s4,56(sp)
c0000800:	03512a23          	sw	s5,52(sp)
c0000804:	03612823          	sw	s6,48(sp)
c0000808:	03712623          	sw	s7,44(sp)
c000080c:	03812423          	sw	s8,40(sp)
c0000810:	03912223          	sw	s9,36(sp)
c0000814:	04112623          	sw	ra,76(sp)
c0000818:	04812423          	sw	s0,72(sp)
c000081c:	04912223          	sw	s1,68(sp)
c0000820:	03a12023          	sw	s10,32(sp)
c0000824:	01b12e23          	sw	s11,28(sp)
c0000828:	00050993          	mv	s3,a0
c000082c:	00058913          	mv	s2,a1
c0000830:	00060c93          	mv	s9,a2
c0000834:	00068a93          	mv	s5,a3
c0000838:	00001a17          	auipc	s4,0x1
c000083c:	9b8a0a13          	addi	s4,s4,-1608 # c00011f0 <etext+0x4b4>
c0000840:	02800c13          	li	s8,40
c0000844:	fff00b13          	li	s6,-1
c0000848:	05e00b93          	li	s7,94
c000084c:	000cc503          	lbu	a0,0(s9)
c0000850:	02500493          	li	s1,37
c0000854:	001c8413          	addi	s0,s9,1
c0000858:	00950e63          	beq	a0,s1,c0000874 <vprintfmt+0x84>
c000085c:	06050463          	beqz	a0,c00008c4 <vprintfmt+0xd4>
c0000860:	00090593          	mv	a1,s2
c0000864:	00140413          	addi	s0,s0,1
c0000868:	000980e7          	jalr	s3
c000086c:	fff44503          	lbu	a0,-1(s0)
c0000870:	fe9516e3          	bne	a0,s1,c000085c <vprintfmt+0x6c>
c0000874:	00044e03          	lbu	t3,0(s0)
c0000878:	fff00d13          	li	s10,-1
c000087c:	02000813          	li	a6,32
c0000880:	00000493          	li	s1,0
c0000884:	00000593          	li	a1,0
c0000888:	000d0d93          	mv	s11,s10
c000088c:	05500693          	li	a3,85
c0000890:	00100313          	li	t1,1
c0000894:	03000893          	li	a7,48
c0000898:	00900613          	li	a2,9
c000089c:	02d00513          	li	a0,45
c00008a0:	fdde0713          	addi	a4,t3,-35
c00008a4:	0ff77713          	andi	a4,a4,255
c00008a8:	00140c93          	addi	s9,s0,1
c00008ac:	32e6e463          	bltu	a3,a4,c0000bd4 <vprintfmt+0x3e4>
c00008b0:	00271713          	slli	a4,a4,0x2
c00008b4:	01470733          	add	a4,a4,s4
c00008b8:	00072783          	lw	a5,0(a4)
c00008bc:	014787b3          	add	a5,a5,s4
c00008c0:	00078067          	jr	a5
c00008c4:	04c12083          	lw	ra,76(sp)
c00008c8:	04812403          	lw	s0,72(sp)
c00008cc:	04412483          	lw	s1,68(sp)
c00008d0:	04012903          	lw	s2,64(sp)
c00008d4:	03c12983          	lw	s3,60(sp)
c00008d8:	03812a03          	lw	s4,56(sp)
c00008dc:	03412a83          	lw	s5,52(sp)
c00008e0:	03012b03          	lw	s6,48(sp)
c00008e4:	02c12b83          	lw	s7,44(sp)
c00008e8:	02812c03          	lw	s8,40(sp)
c00008ec:	02412c83          	lw	s9,36(sp)
c00008f0:	02012d03          	lw	s10,32(sp)
c00008f4:	01c12d83          	lw	s11,28(sp)
c00008f8:	05010113          	addi	sp,sp,80
c00008fc:	00008067          	ret
c0000900:	00100793          	li	a5,1
c0000904:	34b7c063          	blt	a5,a1,c0000c44 <vprintfmt+0x454>
c0000908:	000aa603          	lw	a2,0(s5)
c000090c:	00000693          	li	a3,0
c0000910:	004a8a93          	addi	s5,s5,4
c0000914:	01000713          	li	a4,16
c0000918:	000d8793          	mv	a5,s11
c000091c:	00090593          	mv	a1,s2
c0000920:	00098513          	mv	a0,s3
c0000924:	e25ff0ef          	jal	ra,c0000748 <printnum>
c0000928:	f25ff06f          	j	c000084c <vprintfmt+0x5c>
c000092c:	00144e03          	lbu	t3,1(s0)
c0000930:	00030493          	mv	s1,t1
c0000934:	000c8413          	mv	s0,s9
c0000938:	f69ff06f          	j	c00008a0 <vprintfmt+0xb0>
c000093c:	000aa503          	lw	a0,0(s5)
c0000940:	00090593          	mv	a1,s2
c0000944:	004a8a93          	addi	s5,s5,4
c0000948:	000980e7          	jalr	s3
c000094c:	f01ff06f          	j	c000084c <vprintfmt+0x5c>
c0000950:	00100793          	li	a5,1
c0000954:	30b7c663          	blt	a5,a1,c0000c60 <vprintfmt+0x470>
c0000958:	000aa603          	lw	a2,0(s5)
c000095c:	004a8a93          	addi	s5,s5,4
c0000960:	41f65693          	srai	a3,a2,0x1f
c0000964:	00a00713          	li	a4,10
c0000968:	fa06d8e3          	bgez	a3,c0000918 <vprintfmt+0x128>
c000096c:	00090593          	mv	a1,s2
c0000970:	02d00513          	li	a0,45
c0000974:	00d12623          	sw	a3,12(sp)
c0000978:	00c12423          	sw	a2,8(sp)
c000097c:	00e12223          	sw	a4,4(sp)
c0000980:	01012023          	sw	a6,0(sp)
c0000984:	000980e7          	jalr	s3
c0000988:	00812603          	lw	a2,8(sp)
c000098c:	00c12683          	lw	a3,12(sp)
c0000990:	00012803          	lw	a6,0(sp)
c0000994:	40c00633          	neg	a2,a2
c0000998:	00c037b3          	snez	a5,a2
c000099c:	40d006b3          	neg	a3,a3
c00009a0:	40f686b3          	sub	a3,a3,a5
c00009a4:	00412703          	lw	a4,4(sp)
c00009a8:	f71ff06f          	j	c0000918 <vprintfmt+0x128>
c00009ac:	000aa783          	lw	a5,0(s5)
c00009b0:	00600693          	li	a3,6
c00009b4:	004a8a93          	addi	s5,s5,4
c00009b8:	41f7d713          	srai	a4,a5,0x1f
c00009bc:	00f747b3          	xor	a5,a4,a5
c00009c0:	40e787b3          	sub	a5,a5,a4
c00009c4:	2af6ca63          	blt	a3,a5,c0000c78 <vprintfmt+0x488>
c00009c8:	00279693          	slli	a3,a5,0x2
c00009cc:	00001717          	auipc	a4,0x1
c00009d0:	97c70713          	addi	a4,a4,-1668 # c0001348 <error_string>
c00009d4:	00d70733          	add	a4,a4,a3
c00009d8:	00072683          	lw	a3,0(a4)
c00009dc:	28068e63          	beqz	a3,c0000c78 <vprintfmt+0x488>
c00009e0:	00001617          	auipc	a2,0x1
c00009e4:	a1860613          	addi	a2,a2,-1512 # c00013f8 <error_string+0xb0>
c00009e8:	00090593          	mv	a1,s2
c00009ec:	00098513          	mv	a0,s3
c00009f0:	314000ef          	jal	ra,c0000d04 <printfmt>
c00009f4:	e59ff06f          	j	c000084c <vprintfmt+0x5c>
c00009f8:	00144e03          	lbu	t3,1(s0)
c00009fc:	00158593          	addi	a1,a1,1
c0000a00:	000c8413          	mv	s0,s9
c0000a04:	e9dff06f          	j	c00008a0 <vprintfmt+0xb0>
c0000a08:	00100793          	li	a5,1
c0000a0c:	20b7c063          	blt	a5,a1,c0000c0c <vprintfmt+0x41c>
c0000a10:	000aa603          	lw	a2,0(s5)
c0000a14:	00000693          	li	a3,0
c0000a18:	004a8a93          	addi	s5,s5,4
c0000a1c:	00800713          	li	a4,8
c0000a20:	ef9ff06f          	j	c0000918 <vprintfmt+0x128>
c0000a24:	03000513          	li	a0,48
c0000a28:	00090593          	mv	a1,s2
c0000a2c:	01012023          	sw	a6,0(sp)
c0000a30:	000980e7          	jalr	s3
c0000a34:	00090593          	mv	a1,s2
c0000a38:	07800513          	li	a0,120
c0000a3c:	000980e7          	jalr	s3
c0000a40:	000aa603          	lw	a2,0(s5)
c0000a44:	00000693          	li	a3,0
c0000a48:	01000713          	li	a4,16
c0000a4c:	004a8a93          	addi	s5,s5,4
c0000a50:	00012803          	lw	a6,0(sp)
c0000a54:	ec5ff06f          	j	c0000918 <vprintfmt+0x128>
c0000a58:	000aa403          	lw	s0,0(s5)
c0000a5c:	004a8793          	addi	a5,s5,4
c0000a60:	00f12223          	sw	a5,4(sp)
c0000a64:	24040863          	beqz	s0,c0000cb4 <vprintfmt+0x4c4>
c0000a68:	05b05263          	blez	s11,c0000aac <vprintfmt+0x2bc>
c0000a6c:	02d00793          	li	a5,45
c0000a70:	22f80263          	beq	a6,a5,c0000c94 <vprintfmt+0x4a4>
c0000a74:	000d0593          	mv	a1,s10
c0000a78:	00040513          	mv	a0,s0
c0000a7c:	01012023          	sw	a6,0(sp)
c0000a80:	c6dff0ef          	jal	ra,c00006ec <strnlen>
c0000a84:	40ad8db3          	sub	s11,s11,a0
c0000a88:	03b05263          	blez	s11,c0000aac <vprintfmt+0x2bc>
c0000a8c:	00012803          	lw	a6,0(sp)
c0000a90:	00080513          	mv	a0,a6
c0000a94:	00090593          	mv	a1,s2
c0000a98:	01012023          	sw	a6,0(sp)
c0000a9c:	fffd8d93          	addi	s11,s11,-1
c0000aa0:	000980e7          	jalr	s3
c0000aa4:	00012803          	lw	a6,0(sp)
c0000aa8:	fe0d94e3          	bnez	s11,c0000a90 <vprintfmt+0x2a0>
c0000aac:	00044783          	lbu	a5,0(s0)
c0000ab0:	00140a93          	addi	s5,s0,1
c0000ab4:	00078513          	mv	a0,a5
c0000ab8:	04078c63          	beqz	a5,c0000b10 <vprintfmt+0x320>
c0000abc:	03f00413          	li	s0,63
c0000ac0:	000d4663          	bltz	s10,c0000acc <vprintfmt+0x2dc>
c0000ac4:	fffd0d13          	addi	s10,s10,-1
c0000ac8:	036d0663          	beq	s10,s6,c0000af4 <vprintfmt+0x304>
c0000acc:	00090593          	mv	a1,s2
c0000ad0:	00048663          	beqz	s1,c0000adc <vprintfmt+0x2ec>
c0000ad4:	fe078793          	addi	a5,a5,-32
c0000ad8:	12fbe463          	bltu	s7,a5,c0000c00 <vprintfmt+0x410>
c0000adc:	000980e7          	jalr	s3
c0000ae0:	001a8a93          	addi	s5,s5,1
c0000ae4:	fffac783          	lbu	a5,-1(s5)
c0000ae8:	fffd8d93          	addi	s11,s11,-1
c0000aec:	00078513          	mv	a0,a5
c0000af0:	fc0798e3          	bnez	a5,c0000ac0 <vprintfmt+0x2d0>
c0000af4:	01b05e63          	blez	s11,c0000b10 <vprintfmt+0x320>
c0000af8:	02000413          	li	s0,32
c0000afc:	fffd8d93          	addi	s11,s11,-1
c0000b00:	00090593          	mv	a1,s2
c0000b04:	00040513          	mv	a0,s0
c0000b08:	000980e7          	jalr	s3
c0000b0c:	fe0d98e3          	bnez	s11,c0000afc <vprintfmt+0x30c>
c0000b10:	00412a83          	lw	s5,4(sp)
c0000b14:	d39ff06f          	j	c000084c <vprintfmt+0x5c>
c0000b18:	00100793          	li	a5,1
c0000b1c:	10b7c663          	blt	a5,a1,c0000c28 <vprintfmt+0x438>
c0000b20:	000aa603          	lw	a2,0(s5)
c0000b24:	00000693          	li	a3,0
c0000b28:	004a8a93          	addi	s5,s5,4
c0000b2c:	00a00713          	li	a4,10
c0000b30:	de9ff06f          	j	c0000918 <vprintfmt+0x128>
c0000b34:	00144e03          	lbu	t3,1(s0)
c0000b38:	00050813          	mv	a6,a0
c0000b3c:	000c8413          	mv	s0,s9
c0000b40:	d61ff06f          	j	c00008a0 <vprintfmt+0xb0>
c0000b44:	00090593          	mv	a1,s2
c0000b48:	02500513          	li	a0,37
c0000b4c:	000980e7          	jalr	s3
c0000b50:	cfdff06f          	j	c000084c <vprintfmt+0x5c>
c0000b54:	000aad03          	lw	s10,0(s5)
c0000b58:	00144e03          	lbu	t3,1(s0)
c0000b5c:	004a8a93          	addi	s5,s5,4
c0000b60:	000c8413          	mv	s0,s9
c0000b64:	d20ddee3          	bgez	s11,c00008a0 <vprintfmt+0xb0>
c0000b68:	000d0d93          	mv	s11,s10
c0000b6c:	fff00d13          	li	s10,-1
c0000b70:	d31ff06f          	j	c00008a0 <vprintfmt+0xb0>
c0000b74:	00144e03          	lbu	t3,1(s0)
c0000b78:	00088813          	mv	a6,a7
c0000b7c:	000c8413          	mv	s0,s9
c0000b80:	d21ff06f          	j	c00008a0 <vprintfmt+0xb0>
c0000b84:	00144703          	lbu	a4,1(s0)
c0000b88:	fd0e0d13          	addi	s10,t3,-48
c0000b8c:	fd070793          	addi	a5,a4,-48
c0000b90:	14f66863          	bltu	a2,a5,c0000ce0 <vprintfmt+0x4f0>
c0000b94:	000c8413          	mv	s0,s9
c0000b98:	002d1793          	slli	a5,s10,0x2
c0000b9c:	01a78d33          	add	s10,a5,s10
c0000ba0:	00140413          	addi	s0,s0,1
c0000ba4:	001d1d13          	slli	s10,s10,0x1
c0000ba8:	00ed0d33          	add	s10,s10,a4
c0000bac:	00044703          	lbu	a4,0(s0)
c0000bb0:	fd0d0d13          	addi	s10,s10,-48
c0000bb4:	fd070793          	addi	a5,a4,-48
c0000bb8:	fef670e3          	bleu	a5,a2,c0000b98 <vprintfmt+0x3a8>
c0000bbc:	00070e13          	mv	t3,a4
c0000bc0:	fa5ff06f          	j	c0000b64 <vprintfmt+0x374>
c0000bc4:	0e0dc463          	bltz	s11,c0000cac <vprintfmt+0x4bc>
c0000bc8:	00144e03          	lbu	t3,1(s0)
c0000bcc:	000c8413          	mv	s0,s9
c0000bd0:	cd1ff06f          	j	c00008a0 <vprintfmt+0xb0>
c0000bd4:	00090593          	mv	a1,s2
c0000bd8:	02500513          	li	a0,37
c0000bdc:	000980e7          	jalr	s3
c0000be0:	fff44783          	lbu	a5,-1(s0)
c0000be4:	02500713          	li	a4,37
c0000be8:	00040c93          	mv	s9,s0
c0000bec:	c6e780e3          	beq	a5,a4,c000084c <vprintfmt+0x5c>
c0000bf0:	fffc8c93          	addi	s9,s9,-1
c0000bf4:	fffcc783          	lbu	a5,-1(s9)
c0000bf8:	fee79ce3          	bne	a5,a4,c0000bf0 <vprintfmt+0x400>
c0000bfc:	c51ff06f          	j	c000084c <vprintfmt+0x5c>
c0000c00:	00040513          	mv	a0,s0
c0000c04:	000980e7          	jalr	s3
c0000c08:	ed9ff06f          	j	c0000ae0 <vprintfmt+0x2f0>
c0000c0c:	007a8793          	addi	a5,s5,7
c0000c10:	ff87f793          	andi	a5,a5,-8
c0000c14:	00878a93          	addi	s5,a5,8
c0000c18:	0007a603          	lw	a2,0(a5)
c0000c1c:	0047a683          	lw	a3,4(a5)
c0000c20:	00800713          	li	a4,8
c0000c24:	cf5ff06f          	j	c0000918 <vprintfmt+0x128>
c0000c28:	007a8793          	addi	a5,s5,7
c0000c2c:	ff87f793          	andi	a5,a5,-8
c0000c30:	00878a93          	addi	s5,a5,8
c0000c34:	0007a603          	lw	a2,0(a5)
c0000c38:	0047a683          	lw	a3,4(a5)
c0000c3c:	00a00713          	li	a4,10
c0000c40:	cd9ff06f          	j	c0000918 <vprintfmt+0x128>
c0000c44:	007a8793          	addi	a5,s5,7
c0000c48:	ff87f793          	andi	a5,a5,-8
c0000c4c:	00878a93          	addi	s5,a5,8
c0000c50:	0007a603          	lw	a2,0(a5)
c0000c54:	0047a683          	lw	a3,4(a5)
c0000c58:	01000713          	li	a4,16
c0000c5c:	cbdff06f          	j	c0000918 <vprintfmt+0x128>
c0000c60:	007a8793          	addi	a5,s5,7
c0000c64:	ff87f793          	andi	a5,a5,-8
c0000c68:	00878a93          	addi	s5,a5,8
c0000c6c:	0007a603          	lw	a2,0(a5)
c0000c70:	0047a683          	lw	a3,4(a5)
c0000c74:	cf1ff06f          	j	c0000964 <vprintfmt+0x174>
c0000c78:	00078693          	mv	a3,a5
c0000c7c:	00000617          	auipc	a2,0x0
c0000c80:	77060613          	addi	a2,a2,1904 # c00013ec <error_string+0xa4>
c0000c84:	00090593          	mv	a1,s2
c0000c88:	00098513          	mv	a0,s3
c0000c8c:	078000ef          	jal	ra,c0000d04 <printfmt>
c0000c90:	bbdff06f          	j	c000084c <vprintfmt+0x5c>
c0000c94:	00044783          	lbu	a5,0(s0)
c0000c98:	00140a93          	addi	s5,s0,1
c0000c9c:	00078513          	mv	a0,a5
c0000ca0:	e4078ce3          	beqz	a5,c0000af8 <vprintfmt+0x308>
c0000ca4:	03f00413          	li	s0,63
c0000ca8:	e19ff06f          	j	c0000ac0 <vprintfmt+0x2d0>
c0000cac:	00000d93          	li	s11,0
c0000cb0:	f19ff06f          	j	c0000bc8 <vprintfmt+0x3d8>
c0000cb4:	03b05c63          	blez	s11,c0000cec <vprintfmt+0x4fc>
c0000cb8:	02d00793          	li	a5,45
c0000cbc:	00000417          	auipc	s0,0x0
c0000cc0:	72840413          	addi	s0,s0,1832 # c00013e4 <error_string+0x9c>
c0000cc4:	daf818e3          	bne	a6,a5,c0000a74 <vprintfmt+0x284>
c0000cc8:	00000a97          	auipc	s5,0x0
c0000ccc:	71da8a93          	addi	s5,s5,1821 # c00013e5 <error_string+0x9d>
c0000cd0:	000c0513          	mv	a0,s8
c0000cd4:	000c0793          	mv	a5,s8
c0000cd8:	03f00413          	li	s0,63
c0000cdc:	de5ff06f          	j	c0000ac0 <vprintfmt+0x2d0>
c0000ce0:	00070e13          	mv	t3,a4
c0000ce4:	000c8413          	mv	s0,s9
c0000ce8:	e7dff06f          	j	c0000b64 <vprintfmt+0x374>
c0000cec:	000c0793          	mv	a5,s8
c0000cf0:	000c0513          	mv	a0,s8
c0000cf4:	00000a97          	auipc	s5,0x0
c0000cf8:	6f1a8a93          	addi	s5,s5,1777 # c00013e5 <error_string+0x9d>
c0000cfc:	03f00413          	li	s0,63
c0000d00:	dc1ff06f          	j	c0000ac0 <vprintfmt+0x2d0>

c0000d04 <printfmt>:
c0000d04:	fc010113          	addi	sp,sp,-64
c0000d08:	02c10313          	addi	t1,sp,44
c0000d0c:	02d12623          	sw	a3,44(sp)
c0000d10:	00030693          	mv	a3,t1
c0000d14:	00112e23          	sw	ra,28(sp)
c0000d18:	02e12823          	sw	a4,48(sp)
c0000d1c:	02f12a23          	sw	a5,52(sp)
c0000d20:	03012c23          	sw	a6,56(sp)
c0000d24:	03112e23          	sw	a7,60(sp)
c0000d28:	00612623          	sw	t1,12(sp)
c0000d2c:	ac5ff0ef          	jal	ra,c00007f0 <vprintfmt>
c0000d30:	01c12083          	lw	ra,28(sp)
c0000d34:	04010113          	addi	sp,sp,64
c0000d38:	00008067          	ret
