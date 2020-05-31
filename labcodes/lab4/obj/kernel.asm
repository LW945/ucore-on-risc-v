
bin/kernel:     file format elf32-littleriscv


Disassembly of section .text:

c0000000 <kern_entry>:
c0000000:	0000b117          	auipc	sp,0xb
c0000004:	00010113          	mv	sp,sp
c0000008:	0040006f          	j	c000000c <kern_init>

c000000c <kern_init>:
c000000c:	0000b517          	auipc	a0,0xb
c0000010:	02c50513          	addi	a0,a0,44 # c000b038 <edata>
c0000014:	00014617          	auipc	a2,0x14
c0000018:	54060613          	addi	a2,a2,1344 # c0014554 <end>
c000001c:	ff010113          	addi	sp,sp,-16 # c000aff0 <bootstack+0x1ff0>
c0000020:	40a60633          	sub	a2,a2,a0
c0000024:	00000593          	li	a1,0
c0000028:	00112623          	sw	ra,12(sp)
c000002c:	605050ef          	jal	ra,c0005e30 <memset>
c0000030:	6e8000ef          	jal	ra,c0000718 <cons_init>
c0000034:	00006597          	auipc	a1,0x6
c0000038:	44c58593          	addi	a1,a1,1100 # c0006480 <etext>
c000003c:	00006517          	auipc	a0,0x6
c0000040:	46050513          	addi	a0,a0,1120 # c000649c <etext+0x1c>
c0000044:	094000ef          	jal	ra,c00000d8 <cprintf>
c0000048:	28c000ef          	jal	ra,c00002d4 <print_kerninfo>
c000004c:	490040ef          	jal	ra,c00044dc <pmm_init>
c0000050:	75c000ef          	jal	ra,c00007ac <pic_init>
c0000054:	7f0000ef          	jal	ra,c0000844 <idt_init>
c0000058:	0b8010ef          	jal	ra,c0001110 <vmm_init>
c000005c:	22d050ef          	jal	ra,c0005a88 <proc_init>
c0000060:	5b8000ef          	jal	ra,c0000618 <ide_init>
c0000064:	260020ef          	jal	ra,c00022c4 <swap_init>
c0000068:	668000ef          	jal	ra,c00006d0 <clock_init>
c000006c:	744000ef          	jal	ra,c00007b0 <intr_enable>
c0000070:	391050ef          	jal	ra,c0005c00 <cpu_idle>

c0000074 <cputch>:
c0000074:	ff010113          	addi	sp,sp,-16
c0000078:	00112623          	sw	ra,12(sp)
c000007c:	00812423          	sw	s0,8(sp)
c0000080:	00058413          	mv	s0,a1
c0000084:	698000ef          	jal	ra,c000071c <cons_putc>
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
c00000c4:	655050ef          	jal	ra,c0005f18 <vprintfmt>
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
c000011c:	5fd050ef          	jal	ra,c0005f18 <vprintfmt>
c0000120:	01c12083          	lw	ra,28(sp)
c0000124:	00c12503          	lw	a0,12(sp)
c0000128:	04010113          	addi	sp,sp,64
c000012c:	00008067          	ret

c0000130 <cputchar>:
c0000130:	5ec0006f          	j	c000071c <cons_putc>

c0000134 <getchar>:
c0000134:	ff010113          	addi	sp,sp,-16
c0000138:	00112623          	sw	ra,12(sp)
c000013c:	628000ef          	jal	ra,c0000764 <cons_getc>
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
c0000180:	00006517          	auipc	a0,0x6
c0000184:	32450513          	addi	a0,a0,804 # c00064a4 <etext+0x24>
c0000188:	f51ff0ef          	jal	ra,c00000d8 <cprintf>
c000018c:	00000493          	li	s1,0
c0000190:	01f00913          	li	s2,31
c0000194:	00d00993          	li	s3,13
c0000198:	00800a93          	li	s5,8
c000019c:	00a00b13          	li	s6,10
c00001a0:	3fe00a13          	li	s4,1022
c00001a4:	0000bb97          	auipc	s7,0xb
c00001a8:	e94b8b93          	addi	s7,s7,-364 # c000b038 <edata>
c00001ac:	f89ff0ef          	jal	ra,c0000134 <getchar>
c00001b0:	00050413          	mv	s0,a0
c00001b4:	06054863          	bltz	a0,c0000224 <readline+0xd4>
c00001b8:	06a95a63          	ble	a0,s2,c000022c <readline+0xdc>
c00001bc:	049a5663          	ble	s1,s4,c0000208 <readline+0xb8>
c00001c0:	ff3416e3          	bne	s0,s3,c00001ac <readline+0x5c>
c00001c4:	00040513          	mv	a0,s0
c00001c8:	f69ff0ef          	jal	ra,c0000130 <cputchar>
c00001cc:	0000b517          	auipc	a0,0xb
c00001d0:	e6c50513          	addi	a0,a0,-404 # c000b038 <edata>
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
c000026c:	00014797          	auipc	a5,0x14
c0000270:	1dc7a783          	lw	a5,476(a5) # c0014448 <is_panic>
c0000274:	00078a63          	beqz	a5,c0000288 <__panic+0x3c>
c0000278:	540000ef          	jal	ra,c00007b8 <intr_disable>
c000027c:	00000513          	li	a0,0
c0000280:	1b4000ef          	jal	ra,c0000434 <kmonitor>
c0000284:	ff9ff06f          	j	c000027c <__panic+0x30>
c0000288:	00100713          	li	a4,1
c000028c:	00014797          	auipc	a5,0x14
c0000290:	1bc78793          	addi	a5,a5,444 # c0014448 <is_panic>
c0000294:	00e7a023          	sw	a4,0(a5)
c0000298:	00060413          	mv	s0,a2
c000029c:	02c10793          	addi	a5,sp,44
c00002a0:	00058613          	mv	a2,a1
c00002a4:	00050593          	mv	a1,a0
c00002a8:	00006517          	auipc	a0,0x6
c00002ac:	20050513          	addi	a0,a0,512 # c00064a8 <etext+0x28>
c00002b0:	00f12623          	sw	a5,12(sp)
c00002b4:	e25ff0ef          	jal	ra,c00000d8 <cprintf>
c00002b8:	00c12583          	lw	a1,12(sp)
c00002bc:	00040513          	mv	a0,s0
c00002c0:	de5ff0ef          	jal	ra,c00000a4 <vcprintf>
c00002c4:	00008517          	auipc	a0,0x8
c00002c8:	aa050513          	addi	a0,a0,-1376 # c0007d64 <default_pmm_manager+0x3dc>
c00002cc:	e0dff0ef          	jal	ra,c00000d8 <cprintf>
c00002d0:	fa9ff06f          	j	c0000278 <__panic+0x2c>

c00002d4 <print_kerninfo>:
c00002d4:	ff010113          	addi	sp,sp,-16
c00002d8:	00006517          	auipc	a0,0x6
c00002dc:	21450513          	addi	a0,a0,532 # c00064ec <etext+0x6c>
c00002e0:	00112623          	sw	ra,12(sp)
c00002e4:	df5ff0ef          	jal	ra,c00000d8 <cprintf>
c00002e8:	00000597          	auipc	a1,0x0
c00002ec:	d2458593          	addi	a1,a1,-732 # c000000c <kern_init>
c00002f0:	00006517          	auipc	a0,0x6
c00002f4:	21850513          	addi	a0,a0,536 # c0006508 <etext+0x88>
c00002f8:	de1ff0ef          	jal	ra,c00000d8 <cprintf>
c00002fc:	00006597          	auipc	a1,0x6
c0000300:	18458593          	addi	a1,a1,388 # c0006480 <etext>
c0000304:	00006517          	auipc	a0,0x6
c0000308:	22050513          	addi	a0,a0,544 # c0006524 <etext+0xa4>
c000030c:	dcdff0ef          	jal	ra,c00000d8 <cprintf>
c0000310:	0000b597          	auipc	a1,0xb
c0000314:	d2858593          	addi	a1,a1,-728 # c000b038 <edata>
c0000318:	00006517          	auipc	a0,0x6
c000031c:	22850513          	addi	a0,a0,552 # c0006540 <etext+0xc0>
c0000320:	db9ff0ef          	jal	ra,c00000d8 <cprintf>
c0000324:	00014597          	auipc	a1,0x14
c0000328:	23058593          	addi	a1,a1,560 # c0014554 <end>
c000032c:	00006517          	auipc	a0,0x6
c0000330:	23050513          	addi	a0,a0,560 # c000655c <etext+0xdc>
c0000334:	da5ff0ef          	jal	ra,c00000d8 <cprintf>
c0000338:	00014597          	auipc	a1,0x14
c000033c:	61b58593          	addi	a1,a1,1563 # c0014953 <end+0x3ff>
c0000340:	00000797          	auipc	a5,0x0
c0000344:	ccc78793          	addi	a5,a5,-820 # c000000c <kern_init>
c0000348:	40f587b3          	sub	a5,a1,a5
c000034c:	41f7d593          	srai	a1,a5,0x1f
c0000350:	3ff5f593          	andi	a1,a1,1023
c0000354:	00c12083          	lw	ra,12(sp)
c0000358:	00f585b3          	add	a1,a1,a5
c000035c:	40a5d593          	srai	a1,a1,0xa
c0000360:	00006517          	auipc	a0,0x6
c0000364:	21850513          	addi	a0,a0,536 # c0006578 <etext+0xf8>
c0000368:	01010113          	addi	sp,sp,16
c000036c:	d6dff06f          	j	c00000d8 <cprintf>

c0000370 <print_stackframe>:
c0000370:	ff010113          	addi	sp,sp,-16
c0000374:	00006617          	auipc	a2,0x6
c0000378:	15060613          	addi	a2,a2,336 # c00064c4 <etext+0x44>
c000037c:	05b00593          	li	a1,91
c0000380:	00006517          	auipc	a0,0x6
c0000384:	15850513          	addi	a0,a0,344 # c00064d8 <etext+0x58>
c0000388:	00112623          	sw	ra,12(sp)
c000038c:	ec1ff0ef          	jal	ra,c000024c <__panic>

c0000390 <mon_help>:
c0000390:	ff010113          	addi	sp,sp,-16
c0000394:	00006617          	auipc	a2,0x6
c0000398:	2c860613          	addi	a2,a2,712 # c000665c <commands+0xb8>
c000039c:	00006597          	auipc	a1,0x6
c00003a0:	2e058593          	addi	a1,a1,736 # c000667c <commands+0xd8>
c00003a4:	00006517          	auipc	a0,0x6
c00003a8:	2e050513          	addi	a0,a0,736 # c0006684 <commands+0xe0>
c00003ac:	00112623          	sw	ra,12(sp)
c00003b0:	d29ff0ef          	jal	ra,c00000d8 <cprintf>
c00003b4:	00006617          	auipc	a2,0x6
c00003b8:	2dc60613          	addi	a2,a2,732 # c0006690 <commands+0xec>
c00003bc:	00006597          	auipc	a1,0x6
c00003c0:	2fc58593          	addi	a1,a1,764 # c00066b8 <commands+0x114>
c00003c4:	00006517          	auipc	a0,0x6
c00003c8:	2c050513          	addi	a0,a0,704 # c0006684 <commands+0xe0>
c00003cc:	d0dff0ef          	jal	ra,c00000d8 <cprintf>
c00003d0:	00006617          	auipc	a2,0x6
c00003d4:	2f460613          	addi	a2,a2,756 # c00066c4 <commands+0x120>
c00003d8:	00006597          	auipc	a1,0x6
c00003dc:	30c58593          	addi	a1,a1,780 # c00066e4 <commands+0x140>
c00003e0:	00006517          	auipc	a0,0x6
c00003e4:	2a450513          	addi	a0,a0,676 # c0006684 <commands+0xe0>
c00003e8:	cf1ff0ef          	jal	ra,c00000d8 <cprintf>
c00003ec:	00c12083          	lw	ra,12(sp)
c00003f0:	00000513          	li	a0,0
c00003f4:	01010113          	addi	sp,sp,16
c00003f8:	00008067          	ret

c00003fc <mon_kerninfo>:
c00003fc:	ff010113          	addi	sp,sp,-16
c0000400:	00112623          	sw	ra,12(sp)
c0000404:	ed1ff0ef          	jal	ra,c00002d4 <print_kerninfo>
c0000408:	00c12083          	lw	ra,12(sp)
c000040c:	00000513          	li	a0,0
c0000410:	01010113          	addi	sp,sp,16
c0000414:	00008067          	ret

c0000418 <mon_backtrace>:
c0000418:	ff010113          	addi	sp,sp,-16
c000041c:	00112623          	sw	ra,12(sp)
c0000420:	f51ff0ef          	jal	ra,c0000370 <print_stackframe>
c0000424:	00c12083          	lw	ra,12(sp)
c0000428:	00000513          	li	a0,0
c000042c:	01010113          	addi	sp,sp,16
c0000430:	00008067          	ret

c0000434 <kmonitor>:
c0000434:	f9010113          	addi	sp,sp,-112
c0000438:	05812423          	sw	s8,72(sp)
c000043c:	00050c13          	mv	s8,a0
c0000440:	00006517          	auipc	a0,0x6
c0000444:	18850513          	addi	a0,a0,392 # c00065c8 <commands+0x24>
c0000448:	06112623          	sw	ra,108(sp)
c000044c:	06812423          	sw	s0,104(sp)
c0000450:	06912223          	sw	s1,100(sp)
c0000454:	07212023          	sw	s2,96(sp)
c0000458:	05312e23          	sw	s3,92(sp)
c000045c:	05412c23          	sw	s4,88(sp)
c0000460:	05512a23          	sw	s5,84(sp)
c0000464:	05612823          	sw	s6,80(sp)
c0000468:	05712623          	sw	s7,76(sp)
c000046c:	05912223          	sw	s9,68(sp)
c0000470:	05a12023          	sw	s10,64(sp)
c0000474:	c65ff0ef          	jal	ra,c00000d8 <cprintf>
c0000478:	00006517          	auipc	a0,0x6
c000047c:	17850513          	addi	a0,a0,376 # c00065f0 <commands+0x4c>
c0000480:	c59ff0ef          	jal	ra,c00000d8 <cprintf>
c0000484:	000c0663          	beqz	s8,c0000490 <kmonitor+0x5c>
c0000488:	000c0513          	mv	a0,s8
c000048c:	5ec000ef          	jal	ra,c0000a78 <print_trapframe>
c0000490:	3ffff317          	auipc	t1,0x3ffff
c0000494:	400300e7          	jalr	1024(t1) # fffff890 <sbi_shutdown>
c0000498:	00006c97          	auipc	s9,0x6
c000049c:	10cc8c93          	addi	s9,s9,268 # c00065a4 <commands>
c00004a0:	00006997          	auipc	s3,0x6
c00004a4:	17898993          	addi	s3,s3,376 # c0006618 <commands+0x74>
c00004a8:	00006497          	auipc	s1,0x6
c00004ac:	17448493          	addi	s1,s1,372 # c000661c <commands+0x78>
c00004b0:	00f00a13          	li	s4,15
c00004b4:	01000b93          	li	s7,16
c00004b8:	00006b17          	auipc	s6,0x6
c00004bc:	16cb0b13          	addi	s6,s6,364 # c0006624 <commands+0x80>
c00004c0:	00300a93          	li	s5,3
c00004c4:	00098513          	mv	a0,s3
c00004c8:	c89ff0ef          	jal	ra,c0000150 <readline>
c00004cc:	00050413          	mv	s0,a0
c00004d0:	fe050ae3          	beqz	a0,c00004c4 <kmonitor+0x90>
c00004d4:	00054583          	lbu	a1,0(a0)
c00004d8:	00000913          	li	s2,0
c00004dc:	0a059463          	bnez	a1,c0000584 <kmonitor+0x150>
c00004e0:	fe0902e3          	beqz	s2,c00004c4 <kmonitor+0x90>
c00004e4:	00012583          	lw	a1,0(sp)
c00004e8:	00006d17          	auipc	s10,0x6
c00004ec:	0bcd0d13          	addi	s10,s10,188 # c00065a4 <commands>
c00004f0:	00006517          	auipc	a0,0x6
c00004f4:	18c50513          	addi	a0,a0,396 # c000667c <commands+0xd8>
c00004f8:	00000413          	li	s0,0
c00004fc:	00cd0d13          	addi	s10,s10,12
c0000500:	0d1050ef          	jal	ra,c0005dd0 <strcmp>
c0000504:	02050063          	beqz	a0,c0000524 <kmonitor+0xf0>
c0000508:	00140413          	addi	s0,s0,1
c000050c:	0f540c63          	beq	s0,s5,c0000604 <kmonitor+0x1d0>
c0000510:	000d2503          	lw	a0,0(s10)
c0000514:	00012583          	lw	a1,0(sp)
c0000518:	00cd0d13          	addi	s10,s10,12
c000051c:	0b5050ef          	jal	ra,c0005dd0 <strcmp>
c0000520:	fe0514e3          	bnez	a0,c0000508 <kmonitor+0xd4>
c0000524:	00141793          	slli	a5,s0,0x1
c0000528:	008787b3          	add	a5,a5,s0
c000052c:	00279793          	slli	a5,a5,0x2
c0000530:	00fc87b3          	add	a5,s9,a5
c0000534:	0087a783          	lw	a5,8(a5)
c0000538:	000c0613          	mv	a2,s8
c000053c:	00410593          	addi	a1,sp,4
c0000540:	fff90513          	addi	a0,s2,-1
c0000544:	000780e7          	jalr	a5
c0000548:	f6055ee3          	bgez	a0,c00004c4 <kmonitor+0x90>
c000054c:	06c12083          	lw	ra,108(sp)
c0000550:	06812403          	lw	s0,104(sp)
c0000554:	06412483          	lw	s1,100(sp)
c0000558:	06012903          	lw	s2,96(sp)
c000055c:	05c12983          	lw	s3,92(sp)
c0000560:	05812a03          	lw	s4,88(sp)
c0000564:	05412a83          	lw	s5,84(sp)
c0000568:	05012b03          	lw	s6,80(sp)
c000056c:	04c12b83          	lw	s7,76(sp)
c0000570:	04812c03          	lw	s8,72(sp)
c0000574:	04412c83          	lw	s9,68(sp)
c0000578:	04012d03          	lw	s10,64(sp)
c000057c:	07010113          	addi	sp,sp,112
c0000580:	00008067          	ret
c0000584:	00048513          	mv	a0,s1
c0000588:	07d050ef          	jal	ra,c0005e04 <strchr>
c000058c:	00050c63          	beqz	a0,c00005a4 <kmonitor+0x170>
c0000590:	00144583          	lbu	a1,1(s0)
c0000594:	00040023          	sb	zero,0(s0)
c0000598:	00140413          	addi	s0,s0,1
c000059c:	f40582e3          	beqz	a1,c00004e0 <kmonitor+0xac>
c00005a0:	fe5ff06f          	j	c0000584 <kmonitor+0x150>
c00005a4:	00044783          	lbu	a5,0(s0)
c00005a8:	f2078ce3          	beqz	a5,c00004e0 <kmonitor+0xac>
c00005ac:	05490463          	beq	s2,s4,c00005f4 <kmonitor+0x1c0>
c00005b0:	00291793          	slli	a5,s2,0x2
c00005b4:	04010713          	addi	a4,sp,64
c00005b8:	00f707b3          	add	a5,a4,a5
c00005bc:	fc87a023          	sw	s0,-64(a5)
c00005c0:	00044583          	lbu	a1,0(s0)
c00005c4:	00190913          	addi	s2,s2,1
c00005c8:	00059a63          	bnez	a1,c00005dc <kmonitor+0x1a8>
c00005cc:	f19ff06f          	j	c00004e4 <kmonitor+0xb0>
c00005d0:	00140413          	addi	s0,s0,1
c00005d4:	00044583          	lbu	a1,0(s0)
c00005d8:	f00586e3          	beqz	a1,c00004e4 <kmonitor+0xb0>
c00005dc:	00048513          	mv	a0,s1
c00005e0:	025050ef          	jal	ra,c0005e04 <strchr>
c00005e4:	fe0506e3          	beqz	a0,c00005d0 <kmonitor+0x19c>
c00005e8:	00044583          	lbu	a1,0(s0)
c00005ec:	ee058ae3          	beqz	a1,c00004e0 <kmonitor+0xac>
c00005f0:	f95ff06f          	j	c0000584 <kmonitor+0x150>
c00005f4:	000b8593          	mv	a1,s7
c00005f8:	000b0513          	mv	a0,s6
c00005fc:	addff0ef          	jal	ra,c00000d8 <cprintf>
c0000600:	fb1ff06f          	j	c00005b0 <kmonitor+0x17c>
c0000604:	00012583          	lw	a1,0(sp)
c0000608:	00006517          	auipc	a0,0x6
c000060c:	03c50513          	addi	a0,a0,60 # c0006644 <commands+0xa0>
c0000610:	ac9ff0ef          	jal	ra,c00000d8 <cprintf>
c0000614:	eb1ff06f          	j	c00004c4 <kmonitor+0x90>

c0000618 <ide_init>:
c0000618:	00008067          	ret

c000061c <ide_device_valid>:
c000061c:	00253513          	sltiu	a0,a0,2
c0000620:	00008067          	ret

c0000624 <ide_device_size>:
c0000624:	03800513          	li	a0,56
c0000628:	00008067          	ret

c000062c <ide_read_secs>:
c000062c:	0000b797          	auipc	a5,0xb
c0000630:	e0c78793          	addi	a5,a5,-500 # c000b438 <ide>
c0000634:	00959593          	slli	a1,a1,0x9
c0000638:	ff010113          	addi	sp,sp,-16
c000063c:	00060513          	mv	a0,a2
c0000640:	00b785b3          	add	a1,a5,a1
c0000644:	00969613          	slli	a2,a3,0x9
c0000648:	00112623          	sw	ra,12(sp)
c000064c:	001050ef          	jal	ra,c0005e4c <memcpy>
c0000650:	00c12083          	lw	ra,12(sp)
c0000654:	00000513          	li	a0,0
c0000658:	01010113          	addi	sp,sp,16
c000065c:	00008067          	ret

c0000660 <ide_write_secs>:
c0000660:	00060713          	mv	a4,a2
c0000664:	00959793          	slli	a5,a1,0x9
c0000668:	0000b517          	auipc	a0,0xb
c000066c:	dd050513          	addi	a0,a0,-560 # c000b438 <ide>
c0000670:	ff010113          	addi	sp,sp,-16
c0000674:	00969613          	slli	a2,a3,0x9
c0000678:	00070593          	mv	a1,a4
c000067c:	00f50533          	add	a0,a0,a5
c0000680:	00112623          	sw	ra,12(sp)
c0000684:	7c8050ef          	jal	ra,c0005e4c <memcpy>
c0000688:	00c12083          	lw	ra,12(sp)
c000068c:	00000513          	li	a0,0
c0000690:	01010113          	addi	sp,sp,16
c0000694:	00008067          	ret

c0000698 <clock_set_next_event>:
c0000698:	c81027f3          	rdtimeh	a5
c000069c:	c01025f3          	rdtime	a1
c00006a0:	c8102773          	rdtimeh	a4
c00006a4:	fee79ae3          	bne	a5,a4,c0000698 <clock_set_next_event>
c00006a8:	00014717          	auipc	a4,0x14
c00006ac:	da870713          	addi	a4,a4,-600 # c0014450 <timebase>
c00006b0:	00072503          	lw	a0,0(a4)
c00006b4:	00472703          	lw	a4,4(a4)
c00006b8:	00a58533          	add	a0,a1,a0
c00006bc:	00b535b3          	sltu	a1,a0,a1
c00006c0:	00e787b3          	add	a5,a5,a4
c00006c4:	00f585b3          	add	a1,a1,a5
c00006c8:	3ffff317          	auipc	t1,0x3ffff
c00006cc:	1d830067          	jr	472(t1) # fffff8a0 <sbi_set_timer>

c00006d0 <clock_init>:
c00006d0:	ff010113          	addi	sp,sp,-16
c00006d4:	00112623          	sw	ra,12(sp)
c00006d8:	3ffff317          	auipc	t1,0x3ffff
c00006dc:	1a8300e7          	jalr	424(t1) # fffff880 <sbi_timebase>
c00006e0:	1f400793          	li	a5,500
c00006e4:	02f55533          	divu	a0,a0,a5
c00006e8:	00014797          	auipc	a5,0x14
c00006ec:	d6878793          	addi	a5,a5,-664 # c0014450 <timebase>
c00006f0:	0007a223          	sw	zero,4(a5)
c00006f4:	00a7a023          	sw	a0,0(a5)
c00006f8:	fa1ff0ef          	jal	ra,c0000698 <clock_set_next_event>
c00006fc:	00c12083          	lw	ra,12(sp)
c0000700:	00006517          	auipc	a0,0x6
c0000704:	ff050513          	addi	a0,a0,-16 # c00066f0 <commands+0x14c>
c0000708:	00014297          	auipc	t0,0x14
c000070c:	d602ae23          	sw	zero,-644(t0) # c0014484 <ticks>
c0000710:	01010113          	addi	sp,sp,16
c0000714:	9c5ff06f          	j	c00000d8 <cprintf>

c0000718 <cons_init>:
c0000718:	00008067          	ret

c000071c <cons_putc>:
c000071c:	100027f3          	csrr	a5,sstatus
c0000720:	0027f793          	andi	a5,a5,2
c0000724:	00079863          	bnez	a5,c0000734 <cons_putc+0x18>
c0000728:	0ff57513          	andi	a0,a0,255
c000072c:	3ffff317          	auipc	t1,0x3ffff
c0000730:	10430067          	jr	260(t1) # fffff830 <sbi_console_putchar>
c0000734:	ff010113          	addi	sp,sp,-16
c0000738:	00112623          	sw	ra,12(sp)
c000073c:	00812423          	sw	s0,8(sp)
c0000740:	00050413          	mv	s0,a0
c0000744:	074000ef          	jal	ra,c00007b8 <intr_disable>
c0000748:	0ff47513          	andi	a0,s0,255
c000074c:	3ffff317          	auipc	t1,0x3ffff
c0000750:	0e4300e7          	jalr	228(t1) # fffff830 <sbi_console_putchar>
c0000754:	00c12083          	lw	ra,12(sp)
c0000758:	00812403          	lw	s0,8(sp)
c000075c:	01010113          	addi	sp,sp,16
c0000760:	0500006f          	j	c00007b0 <intr_enable>

c0000764 <cons_getc>:
c0000764:	100027f3          	csrr	a5,sstatus
c0000768:	0027f793          	andi	a5,a5,2
c000076c:	00079663          	bnez	a5,c0000778 <cons_getc+0x14>
c0000770:	3ffff317          	auipc	t1,0x3ffff
c0000774:	0d030067          	jr	208(t1) # fffff840 <sbi_console_getchar>
c0000778:	ff010113          	addi	sp,sp,-16
c000077c:	00112623          	sw	ra,12(sp)
c0000780:	00812423          	sw	s0,8(sp)
c0000784:	034000ef          	jal	ra,c00007b8 <intr_disable>
c0000788:	3ffff317          	auipc	t1,0x3ffff
c000078c:	0b8300e7          	jalr	184(t1) # fffff840 <sbi_console_getchar>
c0000790:	00050413          	mv	s0,a0
c0000794:	01c000ef          	jal	ra,c00007b0 <intr_enable>
c0000798:	00c12083          	lw	ra,12(sp)
c000079c:	00040513          	mv	a0,s0
c00007a0:	00812403          	lw	s0,8(sp)
c00007a4:	01010113          	addi	sp,sp,16
c00007a8:	00008067          	ret

c00007ac <pic_init>:
c00007ac:	00008067          	ret

c00007b0 <intr_enable>:
c00007b0:	100167f3          	csrrsi	a5,sstatus,2
c00007b4:	00008067          	ret

c00007b8 <intr_disable>:
c00007b8:	100177f3          	csrrci	a5,sstatus,2
c00007bc:	00008067          	ret

c00007c0 <pgfault_handler>:
c00007c0:	08052783          	lw	a5,128(a0)
c00007c4:	ff010113          	addi	sp,sp,-16
c00007c8:	00812423          	sw	s0,8(sp)
c00007cc:	00112623          	sw	ra,12(sp)
c00007d0:	1007f793          	andi	a5,a5,256
c00007d4:	00050413          	mv	s0,a0
c00007d8:	08852583          	lw	a1,136(a0)
c00007dc:	05500613          	li	a2,85
c00007e0:	00078463          	beqz	a5,c00007e8 <pgfault_handler+0x28>
c00007e4:	04b00613          	li	a2,75
c00007e8:	08c42703          	lw	a4,140(s0)
c00007ec:	00700793          	li	a5,7
c00007f0:	05700693          	li	a3,87
c00007f4:	00f70463          	beq	a4,a5,c00007fc <pgfault_handler+0x3c>
c00007f8:	05200693          	li	a3,82
c00007fc:	00006517          	auipc	a0,0x6
c0000800:	17850513          	addi	a0,a0,376 # c0006974 <commands+0x3d0>
c0000804:	8d5ff0ef          	jal	ra,c00000d8 <cprintf>
c0000808:	00014517          	auipc	a0,0x14
c000080c:	c8052503          	lw	a0,-896(a0) # c0014488 <check_mm_struct>
c0000810:	00050e63          	beqz	a0,c000082c <pgfault_handler+0x6c>
c0000814:	08842603          	lw	a2,136(s0)
c0000818:	08c42583          	lw	a1,140(s0)
c000081c:	00c12083          	lw	ra,12(sp)
c0000820:	00812403          	lw	s0,8(sp)
c0000824:	01010113          	addi	sp,sp,16
c0000828:	6610006f          	j	c0001688 <do_pgfault>
c000082c:	00006617          	auipc	a2,0x6
c0000830:	16860613          	addi	a2,a2,360 # c0006994 <commands+0x3f0>
c0000834:	06100593          	li	a1,97
c0000838:	00006517          	auipc	a0,0x6
c000083c:	17450513          	addi	a0,a0,372 # c00069ac <commands+0x408>
c0000840:	a0dff0ef          	jal	ra,c000024c <__panic>

c0000844 <idt_init>:
c0000844:	14005073          	csrwi	sscratch,0
c0000848:	00000797          	auipc	a5,0x0
c000084c:	4f078793          	addi	a5,a5,1264 # c0000d38 <__alltraps>
c0000850:	10579073          	csrw	stvec,a5
c0000854:	100167f3          	csrrsi	a5,sstatus,2
c0000858:	00008067          	ret

c000085c <print_regs>:
c000085c:	00052583          	lw	a1,0(a0)
c0000860:	ff010113          	addi	sp,sp,-16
c0000864:	00812423          	sw	s0,8(sp)
c0000868:	00050413          	mv	s0,a0
c000086c:	00006517          	auipc	a0,0x6
c0000870:	15450513          	addi	a0,a0,340 # c00069c0 <commands+0x41c>
c0000874:	00112623          	sw	ra,12(sp)
c0000878:	861ff0ef          	jal	ra,c00000d8 <cprintf>
c000087c:	00442583          	lw	a1,4(s0)
c0000880:	00006517          	auipc	a0,0x6
c0000884:	15450513          	addi	a0,a0,340 # c00069d4 <commands+0x430>
c0000888:	851ff0ef          	jal	ra,c00000d8 <cprintf>
c000088c:	00842583          	lw	a1,8(s0)
c0000890:	00006517          	auipc	a0,0x6
c0000894:	15850513          	addi	a0,a0,344 # c00069e8 <commands+0x444>
c0000898:	841ff0ef          	jal	ra,c00000d8 <cprintf>
c000089c:	00c42583          	lw	a1,12(s0)
c00008a0:	00006517          	auipc	a0,0x6
c00008a4:	15c50513          	addi	a0,a0,348 # c00069fc <commands+0x458>
c00008a8:	831ff0ef          	jal	ra,c00000d8 <cprintf>
c00008ac:	01042583          	lw	a1,16(s0)
c00008b0:	00006517          	auipc	a0,0x6
c00008b4:	16050513          	addi	a0,a0,352 # c0006a10 <commands+0x46c>
c00008b8:	821ff0ef          	jal	ra,c00000d8 <cprintf>
c00008bc:	01442583          	lw	a1,20(s0)
c00008c0:	00006517          	auipc	a0,0x6
c00008c4:	16450513          	addi	a0,a0,356 # c0006a24 <commands+0x480>
c00008c8:	811ff0ef          	jal	ra,c00000d8 <cprintf>
c00008cc:	01842583          	lw	a1,24(s0)
c00008d0:	00006517          	auipc	a0,0x6
c00008d4:	16850513          	addi	a0,a0,360 # c0006a38 <commands+0x494>
c00008d8:	801ff0ef          	jal	ra,c00000d8 <cprintf>
c00008dc:	01c42583          	lw	a1,28(s0)
c00008e0:	00006517          	auipc	a0,0x6
c00008e4:	16c50513          	addi	a0,a0,364 # c0006a4c <commands+0x4a8>
c00008e8:	ff0ff0ef          	jal	ra,c00000d8 <cprintf>
c00008ec:	02042583          	lw	a1,32(s0)
c00008f0:	00006517          	auipc	a0,0x6
c00008f4:	17050513          	addi	a0,a0,368 # c0006a60 <commands+0x4bc>
c00008f8:	fe0ff0ef          	jal	ra,c00000d8 <cprintf>
c00008fc:	02442583          	lw	a1,36(s0)
c0000900:	00006517          	auipc	a0,0x6
c0000904:	17450513          	addi	a0,a0,372 # c0006a74 <commands+0x4d0>
c0000908:	fd0ff0ef          	jal	ra,c00000d8 <cprintf>
c000090c:	02842583          	lw	a1,40(s0)
c0000910:	00006517          	auipc	a0,0x6
c0000914:	17850513          	addi	a0,a0,376 # c0006a88 <commands+0x4e4>
c0000918:	fc0ff0ef          	jal	ra,c00000d8 <cprintf>
c000091c:	02c42583          	lw	a1,44(s0)
c0000920:	00006517          	auipc	a0,0x6
c0000924:	17c50513          	addi	a0,a0,380 # c0006a9c <commands+0x4f8>
c0000928:	fb0ff0ef          	jal	ra,c00000d8 <cprintf>
c000092c:	03042583          	lw	a1,48(s0)
c0000930:	00006517          	auipc	a0,0x6
c0000934:	18050513          	addi	a0,a0,384 # c0006ab0 <commands+0x50c>
c0000938:	fa0ff0ef          	jal	ra,c00000d8 <cprintf>
c000093c:	03442583          	lw	a1,52(s0)
c0000940:	00006517          	auipc	a0,0x6
c0000944:	18450513          	addi	a0,a0,388 # c0006ac4 <commands+0x520>
c0000948:	f90ff0ef          	jal	ra,c00000d8 <cprintf>
c000094c:	03842583          	lw	a1,56(s0)
c0000950:	00006517          	auipc	a0,0x6
c0000954:	18850513          	addi	a0,a0,392 # c0006ad8 <commands+0x534>
c0000958:	f80ff0ef          	jal	ra,c00000d8 <cprintf>
c000095c:	03c42583          	lw	a1,60(s0)
c0000960:	00006517          	auipc	a0,0x6
c0000964:	18c50513          	addi	a0,a0,396 # c0006aec <commands+0x548>
c0000968:	f70ff0ef          	jal	ra,c00000d8 <cprintf>
c000096c:	04042583          	lw	a1,64(s0)
c0000970:	00006517          	auipc	a0,0x6
c0000974:	19050513          	addi	a0,a0,400 # c0006b00 <commands+0x55c>
c0000978:	f60ff0ef          	jal	ra,c00000d8 <cprintf>
c000097c:	04442583          	lw	a1,68(s0)
c0000980:	00006517          	auipc	a0,0x6
c0000984:	19450513          	addi	a0,a0,404 # c0006b14 <commands+0x570>
c0000988:	f50ff0ef          	jal	ra,c00000d8 <cprintf>
c000098c:	04842583          	lw	a1,72(s0)
c0000990:	00006517          	auipc	a0,0x6
c0000994:	19850513          	addi	a0,a0,408 # c0006b28 <commands+0x584>
c0000998:	f40ff0ef          	jal	ra,c00000d8 <cprintf>
c000099c:	04c42583          	lw	a1,76(s0)
c00009a0:	00006517          	auipc	a0,0x6
c00009a4:	19c50513          	addi	a0,a0,412 # c0006b3c <commands+0x598>
c00009a8:	f30ff0ef          	jal	ra,c00000d8 <cprintf>
c00009ac:	05042583          	lw	a1,80(s0)
c00009b0:	00006517          	auipc	a0,0x6
c00009b4:	1a050513          	addi	a0,a0,416 # c0006b50 <commands+0x5ac>
c00009b8:	f20ff0ef          	jal	ra,c00000d8 <cprintf>
c00009bc:	05442583          	lw	a1,84(s0)
c00009c0:	00006517          	auipc	a0,0x6
c00009c4:	1a450513          	addi	a0,a0,420 # c0006b64 <commands+0x5c0>
c00009c8:	f10ff0ef          	jal	ra,c00000d8 <cprintf>
c00009cc:	05842583          	lw	a1,88(s0)
c00009d0:	00006517          	auipc	a0,0x6
c00009d4:	1a850513          	addi	a0,a0,424 # c0006b78 <commands+0x5d4>
c00009d8:	f00ff0ef          	jal	ra,c00000d8 <cprintf>
c00009dc:	05c42583          	lw	a1,92(s0)
c00009e0:	00006517          	auipc	a0,0x6
c00009e4:	1ac50513          	addi	a0,a0,428 # c0006b8c <commands+0x5e8>
c00009e8:	ef0ff0ef          	jal	ra,c00000d8 <cprintf>
c00009ec:	06042583          	lw	a1,96(s0)
c00009f0:	00006517          	auipc	a0,0x6
c00009f4:	1b050513          	addi	a0,a0,432 # c0006ba0 <commands+0x5fc>
c00009f8:	ee0ff0ef          	jal	ra,c00000d8 <cprintf>
c00009fc:	06442583          	lw	a1,100(s0)
c0000a00:	00006517          	auipc	a0,0x6
c0000a04:	1b450513          	addi	a0,a0,436 # c0006bb4 <commands+0x610>
c0000a08:	ed0ff0ef          	jal	ra,c00000d8 <cprintf>
c0000a0c:	06842583          	lw	a1,104(s0)
c0000a10:	00006517          	auipc	a0,0x6
c0000a14:	1b850513          	addi	a0,a0,440 # c0006bc8 <commands+0x624>
c0000a18:	ec0ff0ef          	jal	ra,c00000d8 <cprintf>
c0000a1c:	06c42583          	lw	a1,108(s0)
c0000a20:	00006517          	auipc	a0,0x6
c0000a24:	1bc50513          	addi	a0,a0,444 # c0006bdc <commands+0x638>
c0000a28:	eb0ff0ef          	jal	ra,c00000d8 <cprintf>
c0000a2c:	07042583          	lw	a1,112(s0)
c0000a30:	00006517          	auipc	a0,0x6
c0000a34:	1c050513          	addi	a0,a0,448 # c0006bf0 <commands+0x64c>
c0000a38:	ea0ff0ef          	jal	ra,c00000d8 <cprintf>
c0000a3c:	07442583          	lw	a1,116(s0)
c0000a40:	00006517          	auipc	a0,0x6
c0000a44:	1c450513          	addi	a0,a0,452 # c0006c04 <commands+0x660>
c0000a48:	e90ff0ef          	jal	ra,c00000d8 <cprintf>
c0000a4c:	07842583          	lw	a1,120(s0)
c0000a50:	00006517          	auipc	a0,0x6
c0000a54:	1c850513          	addi	a0,a0,456 # c0006c18 <commands+0x674>
c0000a58:	e80ff0ef          	jal	ra,c00000d8 <cprintf>
c0000a5c:	07c42583          	lw	a1,124(s0)
c0000a60:	00c12083          	lw	ra,12(sp)
c0000a64:	00812403          	lw	s0,8(sp)
c0000a68:	00006517          	auipc	a0,0x6
c0000a6c:	1c450513          	addi	a0,a0,452 # c0006c2c <commands+0x688>
c0000a70:	01010113          	addi	sp,sp,16
c0000a74:	e64ff06f          	j	c00000d8 <cprintf>

c0000a78 <print_trapframe>:
c0000a78:	ff010113          	addi	sp,sp,-16
c0000a7c:	00050593          	mv	a1,a0
c0000a80:	00812423          	sw	s0,8(sp)
c0000a84:	00050413          	mv	s0,a0
c0000a88:	00006517          	auipc	a0,0x6
c0000a8c:	1b850513          	addi	a0,a0,440 # c0006c40 <commands+0x69c>
c0000a90:	00112623          	sw	ra,12(sp)
c0000a94:	e44ff0ef          	jal	ra,c00000d8 <cprintf>
c0000a98:	00040513          	mv	a0,s0
c0000a9c:	dc1ff0ef          	jal	ra,c000085c <print_regs>
c0000aa0:	08042583          	lw	a1,128(s0)
c0000aa4:	00006517          	auipc	a0,0x6
c0000aa8:	1b050513          	addi	a0,a0,432 # c0006c54 <commands+0x6b0>
c0000aac:	e2cff0ef          	jal	ra,c00000d8 <cprintf>
c0000ab0:	08442583          	lw	a1,132(s0)
c0000ab4:	00006517          	auipc	a0,0x6
c0000ab8:	1b450513          	addi	a0,a0,436 # c0006c68 <commands+0x6c4>
c0000abc:	e1cff0ef          	jal	ra,c00000d8 <cprintf>
c0000ac0:	08842583          	lw	a1,136(s0)
c0000ac4:	00006517          	auipc	a0,0x6
c0000ac8:	1b850513          	addi	a0,a0,440 # c0006c7c <commands+0x6d8>
c0000acc:	e0cff0ef          	jal	ra,c00000d8 <cprintf>
c0000ad0:	08c42583          	lw	a1,140(s0)
c0000ad4:	00c12083          	lw	ra,12(sp)
c0000ad8:	00812403          	lw	s0,8(sp)
c0000adc:	00006517          	auipc	a0,0x6
c0000ae0:	1b450513          	addi	a0,a0,436 # c0006c90 <commands+0x6ec>
c0000ae4:	01010113          	addi	sp,sp,16
c0000ae8:	df0ff06f          	j	c00000d8 <cprintf>

c0000aec <interrupt_handler>:
c0000aec:	08c52783          	lw	a5,140(a0)
c0000af0:	80000737          	lui	a4,0x80000
c0000af4:	fff74713          	not	a4,a4
c0000af8:	00e7f7b3          	and	a5,a5,a4
c0000afc:	00b00713          	li	a4,11
c0000b00:	08f76a63          	bltu	a4,a5,c0000b94 <interrupt_handler+0xa8>
c0000b04:	00006717          	auipc	a4,0x6
c0000b08:	c0870713          	addi	a4,a4,-1016 # c000670c <commands+0x168>
c0000b0c:	00279793          	slli	a5,a5,0x2
c0000b10:	00e787b3          	add	a5,a5,a4
c0000b14:	0007a783          	lw	a5,0(a5)
c0000b18:	00e787b3          	add	a5,a5,a4
c0000b1c:	00078067          	jr	a5
c0000b20:	00006517          	auipc	a0,0x6
c0000b24:	db050513          	addi	a0,a0,-592 # c00068d0 <commands+0x32c>
c0000b28:	db0ff06f          	j	c00000d8 <cprintf>
c0000b2c:	00006517          	auipc	a0,0x6
c0000b30:	de050513          	addi	a0,a0,-544 # c000690c <commands+0x368>
c0000b34:	da4ff06f          	j	c00000d8 <cprintf>
c0000b38:	00006517          	auipc	a0,0x6
c0000b3c:	df450513          	addi	a0,a0,-524 # c000692c <commands+0x388>
c0000b40:	d98ff06f          	j	c00000d8 <cprintf>
c0000b44:	00006517          	auipc	a0,0x6
c0000b48:	e1050513          	addi	a0,a0,-496 # c0006954 <commands+0x3b0>
c0000b4c:	d8cff06f          	j	c00000d8 <cprintf>
c0000b50:	ff010113          	addi	sp,sp,-16
c0000b54:	00112623          	sw	ra,12(sp)
c0000b58:	b41ff0ef          	jal	ra,c0000698 <clock_set_next_event>
c0000b5c:	00014797          	auipc	a5,0x14
c0000b60:	9287a783          	lw	a5,-1752(a5) # c0014484 <ticks>
c0000b64:	00178793          	addi	a5,a5,1
c0000b68:	06400593          	li	a1,100
c0000b6c:	02b7f733          	remu	a4,a5,a1
c0000b70:	00014297          	auipc	t0,0x14
c0000b74:	90f2aa23          	sw	a5,-1772(t0) # c0014484 <ticks>
c0000b78:	02070063          	beqz	a4,c0000b98 <interrupt_handler+0xac>
c0000b7c:	00c12083          	lw	ra,12(sp)
c0000b80:	01010113          	addi	sp,sp,16
c0000b84:	00008067          	ret
c0000b88:	00006517          	auipc	a0,0x6
c0000b8c:	d6450513          	addi	a0,a0,-668 # c00068ec <commands+0x348>
c0000b90:	d48ff06f          	j	c00000d8 <cprintf>
c0000b94:	ee5ff06f          	j	c0000a78 <print_trapframe>
c0000b98:	00c12083          	lw	ra,12(sp)
c0000b9c:	00006517          	auipc	a0,0x6
c0000ba0:	dac50513          	addi	a0,a0,-596 # c0006948 <commands+0x3a4>
c0000ba4:	01010113          	addi	sp,sp,16
c0000ba8:	d30ff06f          	j	c00000d8 <cprintf>

c0000bac <exception_handler>:
c0000bac:	08c52783          	lw	a5,140(a0)
c0000bb0:	00b00693          	li	a3,11
c0000bb4:	14f6e663          	bltu	a3,a5,c0000d00 <exception_handler+0x154>
c0000bb8:	00006717          	auipc	a4,0x6
c0000bbc:	b8470713          	addi	a4,a4,-1148 # c000673c <commands+0x198>
c0000bc0:	00279793          	slli	a5,a5,0x2
c0000bc4:	00e787b3          	add	a5,a5,a4
c0000bc8:	0007a783          	lw	a5,0(a5)
c0000bcc:	ff010113          	addi	sp,sp,-16
c0000bd0:	00812423          	sw	s0,8(sp)
c0000bd4:	00112623          	sw	ra,12(sp)
c0000bd8:	00912223          	sw	s1,4(sp)
c0000bdc:	00e787b3          	add	a5,a5,a4
c0000be0:	00050413          	mv	s0,a0
c0000be4:	00078067          	jr	a5
c0000be8:	00006517          	auipc	a0,0x6
c0000bec:	ca850513          	addi	a0,a0,-856 # c0006890 <commands+0x2ec>
c0000bf0:	00c12083          	lw	ra,12(sp)
c0000bf4:	00812403          	lw	s0,8(sp)
c0000bf8:	00412483          	lw	s1,4(sp)
c0000bfc:	01010113          	addi	sp,sp,16
c0000c00:	cd8ff06f          	j	c00000d8 <cprintf>
c0000c04:	00006517          	auipc	a0,0x6
c0000c08:	cac50513          	addi	a0,a0,-852 # c00068b0 <commands+0x30c>
c0000c0c:	fe5ff06f          	j	c0000bf0 <exception_handler+0x44>
c0000c10:	00006517          	auipc	a0,0x6
c0000c14:	b5c50513          	addi	a0,a0,-1188 # c000676c <commands+0x1c8>
c0000c18:	fd9ff06f          	j	c0000bf0 <exception_handler+0x44>
c0000c1c:	00006517          	auipc	a0,0x6
c0000c20:	b7050513          	addi	a0,a0,-1168 # c000678c <commands+0x1e8>
c0000c24:	cb4ff0ef          	jal	ra,c00000d8 <cprintf>
c0000c28:	00040513          	mv	a0,s0
c0000c2c:	e4dff0ef          	jal	ra,c0000a78 <print_trapframe>
c0000c30:	00c12083          	lw	ra,12(sp)
c0000c34:	00812403          	lw	s0,8(sp)
c0000c38:	00412483          	lw	s1,4(sp)
c0000c3c:	01010113          	addi	sp,sp,16
c0000c40:	3ffff317          	auipc	t1,0x3ffff
c0000c44:	c5030067          	jr	-944(t1) # fffff890 <sbi_shutdown>
c0000c48:	00006517          	auipc	a0,0x6
c0000c4c:	b6050513          	addi	a0,a0,-1184 # c00067a8 <commands+0x204>
c0000c50:	fa1ff06f          	j	c0000bf0 <exception_handler+0x44>
c0000c54:	00006517          	auipc	a0,0x6
c0000c58:	b6c50513          	addi	a0,a0,-1172 # c00067c0 <commands+0x21c>
c0000c5c:	f95ff06f          	j	c0000bf0 <exception_handler+0x44>
c0000c60:	00006517          	auipc	a0,0x6
c0000c64:	b6c50513          	addi	a0,a0,-1172 # c00067cc <commands+0x228>
c0000c68:	f89ff06f          	j	c0000bf0 <exception_handler+0x44>
c0000c6c:	00006517          	auipc	a0,0x6
c0000c70:	b7c50513          	addi	a0,a0,-1156 # c00067e8 <commands+0x244>
c0000c74:	c64ff0ef          	jal	ra,c00000d8 <cprintf>
c0000c78:	00040513          	mv	a0,s0
c0000c7c:	b45ff0ef          	jal	ra,c00007c0 <pgfault_handler>
c0000c80:	00050493          	mv	s1,a0
c0000c84:	08051063          	bnez	a0,c0000d04 <exception_handler+0x158>
c0000c88:	00c12083          	lw	ra,12(sp)
c0000c8c:	00812403          	lw	s0,8(sp)
c0000c90:	00412483          	lw	s1,4(sp)
c0000c94:	01010113          	addi	sp,sp,16
c0000c98:	00008067          	ret
c0000c9c:	00006517          	auipc	a0,0x6
c0000ca0:	b7c50513          	addi	a0,a0,-1156 # c0006818 <commands+0x274>
c0000ca4:	f4dff06f          	j	c0000bf0 <exception_handler+0x44>
c0000ca8:	00006517          	auipc	a0,0x6
c0000cac:	b9050513          	addi	a0,a0,-1136 # c0006838 <commands+0x294>
c0000cb0:	c28ff0ef          	jal	ra,c00000d8 <cprintf>
c0000cb4:	00040513          	mv	a0,s0
c0000cb8:	b09ff0ef          	jal	ra,c00007c0 <pgfault_handler>
c0000cbc:	00050493          	mv	s1,a0
c0000cc0:	fc0504e3          	beqz	a0,c0000c88 <exception_handler+0xdc>
c0000cc4:	00040513          	mv	a0,s0
c0000cc8:	db1ff0ef          	jal	ra,c0000a78 <print_trapframe>
c0000ccc:	00048693          	mv	a3,s1
c0000cd0:	00006617          	auipc	a2,0x6
c0000cd4:	b2c60613          	addi	a2,a2,-1236 # c00067fc <commands+0x258>
c0000cd8:	0be00593          	li	a1,190
c0000cdc:	00006517          	auipc	a0,0x6
c0000ce0:	cd050513          	addi	a0,a0,-816 # c00069ac <commands+0x408>
c0000ce4:	d68ff0ef          	jal	ra,c000024c <__panic>
c0000ce8:	00006517          	auipc	a0,0x6
c0000cec:	b6850513          	addi	a0,a0,-1176 # c0006850 <commands+0x2ac>
c0000cf0:	f01ff06f          	j	c0000bf0 <exception_handler+0x44>
c0000cf4:	00006517          	auipc	a0,0x6
c0000cf8:	b7c50513          	addi	a0,a0,-1156 # c0006870 <commands+0x2cc>
c0000cfc:	ef5ff06f          	j	c0000bf0 <exception_handler+0x44>
c0000d00:	d79ff06f          	j	c0000a78 <print_trapframe>
c0000d04:	00040513          	mv	a0,s0
c0000d08:	d71ff0ef          	jal	ra,c0000a78 <print_trapframe>
c0000d0c:	00048693          	mv	a3,s1
c0000d10:	00006617          	auipc	a2,0x6
c0000d14:	aec60613          	addi	a2,a2,-1300 # c00067fc <commands+0x258>
c0000d18:	0b400593          	li	a1,180
c0000d1c:	00006517          	auipc	a0,0x6
c0000d20:	c9050513          	addi	a0,a0,-880 # c00069ac <commands+0x408>
c0000d24:	d28ff0ef          	jal	ra,c000024c <__panic>

c0000d28 <trap>:
c0000d28:	08c52783          	lw	a5,140(a0)
c0000d2c:	0007c463          	bltz	a5,c0000d34 <trap+0xc>
c0000d30:	e7dff06f          	j	c0000bac <exception_handler>
c0000d34:	db9ff06f          	j	c0000aec <interrupt_handler>

c0000d38 <__alltraps>:
c0000d38:	14011073          	csrw	sscratch,sp
c0000d3c:	f7010113          	addi	sp,sp,-144
c0000d40:	00112223          	sw	ra,4(sp)
c0000d44:	00312623          	sw	gp,12(sp)
c0000d48:	00412823          	sw	tp,16(sp)
c0000d4c:	00512a23          	sw	t0,20(sp)
c0000d50:	00612c23          	sw	t1,24(sp)
c0000d54:	00712e23          	sw	t2,28(sp)
c0000d58:	02812023          	sw	s0,32(sp)
c0000d5c:	02912223          	sw	s1,36(sp)
c0000d60:	02a12423          	sw	a0,40(sp)
c0000d64:	02b12623          	sw	a1,44(sp)
c0000d68:	02c12823          	sw	a2,48(sp)
c0000d6c:	02d12a23          	sw	a3,52(sp)
c0000d70:	02e12c23          	sw	a4,56(sp)
c0000d74:	02f12e23          	sw	a5,60(sp)
c0000d78:	05012023          	sw	a6,64(sp)
c0000d7c:	05112223          	sw	a7,68(sp)
c0000d80:	05212423          	sw	s2,72(sp)
c0000d84:	05312623          	sw	s3,76(sp)
c0000d88:	05412823          	sw	s4,80(sp)
c0000d8c:	05512a23          	sw	s5,84(sp)
c0000d90:	05612c23          	sw	s6,88(sp)
c0000d94:	05712e23          	sw	s7,92(sp)
c0000d98:	07812023          	sw	s8,96(sp)
c0000d9c:	07912223          	sw	s9,100(sp)
c0000da0:	07a12423          	sw	s10,104(sp)
c0000da4:	07b12623          	sw	s11,108(sp)
c0000da8:	07c12823          	sw	t3,112(sp)
c0000dac:	07d12a23          	sw	t4,116(sp)
c0000db0:	07e12c23          	sw	t5,120(sp)
c0000db4:	07f12e23          	sw	t6,124(sp)
c0000db8:	14002473          	csrr	s0,sscratch
c0000dbc:	100024f3          	csrr	s1,sstatus
c0000dc0:	14102973          	csrr	s2,sepc
c0000dc4:	143029f3          	csrr	s3,sbadaddr
c0000dc8:	14202a73          	csrr	s4,scause
c0000dcc:	00812423          	sw	s0,8(sp)
c0000dd0:	08912023          	sw	s1,128(sp)
c0000dd4:	09212223          	sw	s2,132(sp)
c0000dd8:	09312423          	sw	s3,136(sp)
c0000ddc:	09412623          	sw	s4,140(sp)
c0000de0:	00010513          	mv	a0,sp
c0000de4:	f45ff0ef          	jal	ra,c0000d28 <trap>

c0000de8 <__trapret>:
c0000de8:	08012483          	lw	s1,128(sp)
c0000dec:	08412903          	lw	s2,132(sp)
c0000df0:	10049073          	csrw	sstatus,s1
c0000df4:	14191073          	csrw	sepc,s2
c0000df8:	00412083          	lw	ra,4(sp)
c0000dfc:	00c12183          	lw	gp,12(sp)
c0000e00:	01012203          	lw	tp,16(sp)
c0000e04:	01412283          	lw	t0,20(sp)
c0000e08:	01812303          	lw	t1,24(sp)
c0000e0c:	01c12383          	lw	t2,28(sp)
c0000e10:	02012403          	lw	s0,32(sp)
c0000e14:	02412483          	lw	s1,36(sp)
c0000e18:	02812503          	lw	a0,40(sp)
c0000e1c:	02c12583          	lw	a1,44(sp)
c0000e20:	03012603          	lw	a2,48(sp)
c0000e24:	03412683          	lw	a3,52(sp)
c0000e28:	03812703          	lw	a4,56(sp)
c0000e2c:	03c12783          	lw	a5,60(sp)
c0000e30:	04012803          	lw	a6,64(sp)
c0000e34:	04412883          	lw	a7,68(sp)
c0000e38:	04812903          	lw	s2,72(sp)
c0000e3c:	04c12983          	lw	s3,76(sp)
c0000e40:	05012a03          	lw	s4,80(sp)
c0000e44:	05412a83          	lw	s5,84(sp)
c0000e48:	05812b03          	lw	s6,88(sp)
c0000e4c:	05c12b83          	lw	s7,92(sp)
c0000e50:	06012c03          	lw	s8,96(sp)
c0000e54:	06412c83          	lw	s9,100(sp)
c0000e58:	06812d03          	lw	s10,104(sp)
c0000e5c:	06c12d83          	lw	s11,108(sp)
c0000e60:	07012e03          	lw	t3,112(sp)
c0000e64:	07412e83          	lw	t4,116(sp)
c0000e68:	07812f03          	lw	t5,120(sp)
c0000e6c:	07c12f83          	lw	t6,124(sp)
c0000e70:	00812103          	lw	sp,8(sp)
c0000e74:	10200073          	sret

c0000e78 <forkrets>:
c0000e78:	00050113          	mv	sp,a0
c0000e7c:	f6dff06f          	j	c0000de8 <__trapret>

c0000e80 <check_vma_overlap.isra.0.part.1>:
c0000e80:	ff010113          	addi	sp,sp,-16
c0000e84:	00006697          	auipc	a3,0x6
c0000e88:	e2068693          	addi	a3,a3,-480 # c0006ca4 <commands+0x700>
c0000e8c:	00006617          	auipc	a2,0x6
c0000e90:	e3860613          	addi	a2,a2,-456 # c0006cc4 <commands+0x720>
c0000e94:	06800593          	li	a1,104
c0000e98:	00006517          	auipc	a0,0x6
c0000e9c:	e4450513          	addi	a0,a0,-444 # c0006cdc <commands+0x738>
c0000ea0:	00112623          	sw	ra,12(sp)
c0000ea4:	ba8ff0ef          	jal	ra,c000024c <__panic>

c0000ea8 <mm_create>:
c0000ea8:	ff010113          	addi	sp,sp,-16
c0000eac:	01800513          	li	a0,24
c0000eb0:	00812423          	sw	s0,8(sp)
c0000eb4:	00112623          	sw	ra,12(sp)
c0000eb8:	164010ef          	jal	ra,c000201c <kmalloc>
c0000ebc:	00050413          	mv	s0,a0
c0000ec0:	02050463          	beqz	a0,c0000ee8 <mm_create+0x40>
c0000ec4:	00a42223          	sw	a0,4(s0)
c0000ec8:	00a42023          	sw	a0,0(s0)
c0000ecc:	00052423          	sw	zero,8(a0)
c0000ed0:	00052623          	sw	zero,12(a0)
c0000ed4:	00052823          	sw	zero,16(a0)
c0000ed8:	00013797          	auipc	a5,0x13
c0000edc:	58c7a783          	lw	a5,1420(a5) # c0014464 <swap_init_ok>
c0000ee0:	00079e63          	bnez	a5,c0000efc <mm_create+0x54>
c0000ee4:	00052a23          	sw	zero,20(a0)
c0000ee8:	00c12083          	lw	ra,12(sp)
c0000eec:	00040513          	mv	a0,s0
c0000ef0:	00812403          	lw	s0,8(sp)
c0000ef4:	01010113          	addi	sp,sp,16
c0000ef8:	00008067          	ret
c0000efc:	369010ef          	jal	ra,c0002a64 <swap_init_mm>
c0000f00:	00c12083          	lw	ra,12(sp)
c0000f04:	00040513          	mv	a0,s0
c0000f08:	00812403          	lw	s0,8(sp)
c0000f0c:	01010113          	addi	sp,sp,16
c0000f10:	00008067          	ret

c0000f14 <vma_create>:
c0000f14:	ff010113          	addi	sp,sp,-16
c0000f18:	01212023          	sw	s2,0(sp)
c0000f1c:	00050913          	mv	s2,a0
c0000f20:	01800513          	li	a0,24
c0000f24:	00812423          	sw	s0,8(sp)
c0000f28:	00912223          	sw	s1,4(sp)
c0000f2c:	00112623          	sw	ra,12(sp)
c0000f30:	00058493          	mv	s1,a1
c0000f34:	00060413          	mv	s0,a2
c0000f38:	0e4010ef          	jal	ra,c000201c <kmalloc>
c0000f3c:	00050863          	beqz	a0,c0000f4c <vma_create+0x38>
c0000f40:	01252223          	sw	s2,4(a0)
c0000f44:	00952423          	sw	s1,8(a0)
c0000f48:	00852623          	sw	s0,12(a0)
c0000f4c:	00c12083          	lw	ra,12(sp)
c0000f50:	00812403          	lw	s0,8(sp)
c0000f54:	00412483          	lw	s1,4(sp)
c0000f58:	00012903          	lw	s2,0(sp)
c0000f5c:	01010113          	addi	sp,sp,16
c0000f60:	00008067          	ret

c0000f64 <find_vma>:
c0000f64:	04050263          	beqz	a0,c0000fa8 <find_vma+0x44>
c0000f68:	00852783          	lw	a5,8(a0)
c0000f6c:	00078663          	beqz	a5,c0000f78 <find_vma+0x14>
c0000f70:	0047a703          	lw	a4,4(a5)
c0000f74:	04e5f063          	bleu	a4,a1,c0000fb4 <find_vma+0x50>
c0000f78:	00050793          	mv	a5,a0
c0000f7c:	0047a783          	lw	a5,4(a5)
c0000f80:	02f50463          	beq	a0,a5,c0000fa8 <find_vma+0x44>
c0000f84:	ff47a703          	lw	a4,-12(a5)
c0000f88:	fee5eae3          	bltu	a1,a4,c0000f7c <find_vma+0x18>
c0000f8c:	ff87a703          	lw	a4,-8(a5)
c0000f90:	fee5f6e3          	bleu	a4,a1,c0000f7c <find_vma+0x18>
c0000f94:	ff078793          	addi	a5,a5,-16
c0000f98:	00078863          	beqz	a5,c0000fa8 <find_vma+0x44>
c0000f9c:	00f52423          	sw	a5,8(a0)
c0000fa0:	00078513          	mv	a0,a5
c0000fa4:	00008067          	ret
c0000fa8:	00000793          	li	a5,0
c0000fac:	00078513          	mv	a0,a5
c0000fb0:	00008067          	ret
c0000fb4:	0087a703          	lw	a4,8(a5)
c0000fb8:	fce5f0e3          	bleu	a4,a1,c0000f78 <find_vma+0x14>
c0000fbc:	00f52423          	sw	a5,8(a0)
c0000fc0:	fe1ff06f          	j	c0000fa0 <find_vma+0x3c>

c0000fc4 <insert_vma_struct>:
c0000fc4:	0045a603          	lw	a2,4(a1)
c0000fc8:	0085a803          	lw	a6,8(a1)
c0000fcc:	ff010113          	addi	sp,sp,-16
c0000fd0:	00112623          	sw	ra,12(sp)
c0000fd4:	00050713          	mv	a4,a0
c0000fd8:	01066a63          	bltu	a2,a6,c0000fec <insert_vma_struct+0x28>
c0000fdc:	0bc0006f          	j	c0001098 <insert_vma_struct+0xd4>
c0000fe0:	ff47a683          	lw	a3,-12(a5)
c0000fe4:	06d66663          	bltu	a2,a3,c0001050 <insert_vma_struct+0x8c>
c0000fe8:	00078713          	mv	a4,a5
c0000fec:	00472783          	lw	a5,4(a4)
c0000ff0:	fef518e3          	bne	a0,a5,c0000fe0 <insert_vma_struct+0x1c>
c0000ff4:	00050793          	mv	a5,a0
c0000ff8:	0ca70263          	beq	a4,a0,c00010bc <insert_vma_struct+0xf8>
c0000ffc:	ff872683          	lw	a3,-8(a4)
c0001000:	ff472883          	lw	a7,-12(a4)
c0001004:	0ad8fa63          	bleu	a3,a7,c00010b8 <insert_vma_struct+0xf4>
c0001008:	06d66863          	bltu	a2,a3,c0001078 <insert_vma_struct+0xb4>
c000100c:	00f50a63          	beq	a0,a5,c0001020 <insert_vma_struct+0x5c>
c0001010:	ff47a683          	lw	a3,-12(a5)
c0001014:	0706e263          	bltu	a3,a6,c0001078 <insert_vma_struct+0xb4>
c0001018:	ff87a603          	lw	a2,-8(a5)
c000101c:	02c6fe63          	bleu	a2,a3,c0001058 <insert_vma_struct+0x94>
c0001020:	01052683          	lw	a3,16(a0)
c0001024:	00a5a023          	sw	a0,0(a1)
c0001028:	01058613          	addi	a2,a1,16
c000102c:	00c7a023          	sw	a2,0(a5)
c0001030:	00c12083          	lw	ra,12(sp)
c0001034:	00c72223          	sw	a2,4(a4)
c0001038:	00f5aa23          	sw	a5,20(a1)
c000103c:	00e5a823          	sw	a4,16(a1)
c0001040:	00168793          	addi	a5,a3,1
c0001044:	00f52823          	sw	a5,16(a0)
c0001048:	01010113          	addi	sp,sp,16
c000104c:	00008067          	ret
c0001050:	fca702e3          	beq	a4,a0,c0001014 <insert_vma_struct+0x50>
c0001054:	fa9ff06f          	j	c0000ffc <insert_vma_struct+0x38>
c0001058:	00006697          	auipc	a3,0x6
c000105c:	d9068693          	addi	a3,a3,-624 # c0006de8 <commands+0x844>
c0001060:	00006617          	auipc	a2,0x6
c0001064:	c6460613          	addi	a2,a2,-924 # c0006cc4 <commands+0x720>
c0001068:	06a00593          	li	a1,106
c000106c:	00006517          	auipc	a0,0x6
c0001070:	c7050513          	addi	a0,a0,-912 # c0006cdc <commands+0x738>
c0001074:	9d8ff0ef          	jal	ra,c000024c <__panic>
c0001078:	00006697          	auipc	a3,0x6
c000107c:	d5068693          	addi	a3,a3,-688 # c0006dc8 <commands+0x824>
c0001080:	00006617          	auipc	a2,0x6
c0001084:	c4460613          	addi	a2,a2,-956 # c0006cc4 <commands+0x720>
c0001088:	06900593          	li	a1,105
c000108c:	00006517          	auipc	a0,0x6
c0001090:	c5050513          	addi	a0,a0,-944 # c0006cdc <commands+0x738>
c0001094:	9b8ff0ef          	jal	ra,c000024c <__panic>
c0001098:	00006697          	auipc	a3,0x6
c000109c:	d1468693          	addi	a3,a3,-748 # c0006dac <commands+0x808>
c00010a0:	00006617          	auipc	a2,0x6
c00010a4:	c2460613          	addi	a2,a2,-988 # c0006cc4 <commands+0x720>
c00010a8:	07100593          	li	a1,113
c00010ac:	00006517          	auipc	a0,0x6
c00010b0:	c3050513          	addi	a0,a0,-976 # c0006cdc <commands+0x738>
c00010b4:	998ff0ef          	jal	ra,c000024c <__panic>
c00010b8:	dc9ff0ef          	jal	ra,c0000e80 <check_vma_overlap.isra.0.part.1>
c00010bc:	00070793          	mv	a5,a4
c00010c0:	f61ff06f          	j	c0001020 <insert_vma_struct+0x5c>

c00010c4 <mm_destroy>:
c00010c4:	ff010113          	addi	sp,sp,-16
c00010c8:	00812423          	sw	s0,8(sp)
c00010cc:	00050413          	mv	s0,a0
c00010d0:	00452503          	lw	a0,4(a0)
c00010d4:	00112623          	sw	ra,12(sp)
c00010d8:	02a40263          	beq	s0,a0,c00010fc <mm_destroy+0x38>
c00010dc:	00052703          	lw	a4,0(a0)
c00010e0:	00452783          	lw	a5,4(a0)
c00010e4:	ff050513          	addi	a0,a0,-16
c00010e8:	00f72223          	sw	a5,4(a4)
c00010ec:	00e7a023          	sw	a4,0(a5)
c00010f0:	04c010ef          	jal	ra,c000213c <kfree>
c00010f4:	00442503          	lw	a0,4(s0)
c00010f8:	fea412e3          	bne	s0,a0,c00010dc <mm_destroy+0x18>
c00010fc:	00040513          	mv	a0,s0
c0001100:	00c12083          	lw	ra,12(sp)
c0001104:	00812403          	lw	s0,8(sp)
c0001108:	01010113          	addi	sp,sp,16
c000110c:	0300106f          	j	c000213c <kfree>

c0001110 <vmm_init>:
c0001110:	fe010113          	addi	sp,sp,-32
c0001114:	00112e23          	sw	ra,28(sp)
c0001118:	00812c23          	sw	s0,24(sp)
c000111c:	00912a23          	sw	s1,20(sp)
c0001120:	01212823          	sw	s2,16(sp)
c0001124:	01312623          	sw	s3,12(sp)
c0001128:	01412423          	sw	s4,8(sp)
c000112c:	01512223          	sw	s5,4(sp)
c0001130:	2d9020ef          	jal	ra,c0003c08 <nr_free_pages>
c0001134:	2d5020ef          	jal	ra,c0003c08 <nr_free_pages>
c0001138:	d71ff0ef          	jal	ra,c0000ea8 <mm_create>
c000113c:	00050493          	mv	s1,a0
c0001140:	03200413          	li	s0,50
c0001144:	01800913          	li	s2,24
c0001148:	02051263          	bnez	a0,c000116c <vmm_init+0x5c>
c000114c:	4640006f          	j	c00015b0 <vmm_init+0x4a0>
c0001150:	00852223          	sw	s0,4(a0)
c0001154:	00f52423          	sw	a5,8(a0)
c0001158:	00052623          	sw	zero,12(a0)
c000115c:	ffb40413          	addi	s0,s0,-5
c0001160:	00048513          	mv	a0,s1
c0001164:	e61ff0ef          	jal	ra,c0000fc4 <insert_vma_struct>
c0001168:	02040c63          	beqz	s0,c00011a0 <vmm_init+0x90>
c000116c:	00090513          	mv	a0,s2
c0001170:	6ad000ef          	jal	ra,c000201c <kmalloc>
c0001174:	00050593          	mv	a1,a0
c0001178:	00240793          	addi	a5,s0,2
c000117c:	fc051ae3          	bnez	a0,c0001150 <vmm_init+0x40>
c0001180:	00006697          	auipc	a3,0x6
c0001184:	ecc68693          	addi	a3,a3,-308 # c000704c <commands+0xaa8>
c0001188:	00006617          	auipc	a2,0x6
c000118c:	b3c60613          	addi	a2,a2,-1220 # c0006cc4 <commands+0x720>
c0001190:	0b900593          	li	a1,185
c0001194:	00006517          	auipc	a0,0x6
c0001198:	b4850513          	addi	a0,a0,-1208 # c0006cdc <commands+0x738>
c000119c:	8b0ff0ef          	jal	ra,c000024c <__panic>
c00011a0:	03700413          	li	s0,55
c00011a4:	01800913          	li	s2,24
c00011a8:	1f900993          	li	s3,505
c00011ac:	0240006f          	j	c00011d0 <vmm_init+0xc0>
c00011b0:	00852223          	sw	s0,4(a0)
c00011b4:	00f52423          	sw	a5,8(a0)
c00011b8:	00052623          	sw	zero,12(a0)
c00011bc:	00050593          	mv	a1,a0
c00011c0:	00540413          	addi	s0,s0,5
c00011c4:	00048513          	mv	a0,s1
c00011c8:	dfdff0ef          	jal	ra,c0000fc4 <insert_vma_struct>
c00011cc:	03340a63          	beq	s0,s3,c0001200 <vmm_init+0xf0>
c00011d0:	00090513          	mv	a0,s2
c00011d4:	649000ef          	jal	ra,c000201c <kmalloc>
c00011d8:	00240793          	addi	a5,s0,2
c00011dc:	fc051ae3          	bnez	a0,c00011b0 <vmm_init+0xa0>
c00011e0:	00006697          	auipc	a3,0x6
c00011e4:	e6c68693          	addi	a3,a3,-404 # c000704c <commands+0xaa8>
c00011e8:	00006617          	auipc	a2,0x6
c00011ec:	adc60613          	addi	a2,a2,-1316 # c0006cc4 <commands+0x720>
c00011f0:	0bf00593          	li	a1,191
c00011f4:	00006517          	auipc	a0,0x6
c00011f8:	ae850513          	addi	a0,a0,-1304 # c0006cdc <commands+0x738>
c00011fc:	850ff0ef          	jal	ra,c000024c <__panic>
c0001200:	0044a783          	lw	a5,4(s1)
c0001204:	00700713          	li	a4,7
c0001208:	1fb00593          	li	a1,507
c000120c:	2ef48263          	beq	s1,a5,c00014f0 <vmm_init+0x3e0>
c0001210:	ff47a603          	lw	a2,-12(a5)
c0001214:	ffe70693          	addi	a3,a4,-2
c0001218:	26d61c63          	bne	a2,a3,c0001490 <vmm_init+0x380>
c000121c:	ff87a683          	lw	a3,-8(a5)
c0001220:	26e69863          	bne	a3,a4,c0001490 <vmm_init+0x380>
c0001224:	00570713          	addi	a4,a4,5
c0001228:	0047a783          	lw	a5,4(a5)
c000122c:	feb710e3          	bne	a4,a1,c000120c <vmm_init+0xfc>
c0001230:	00500413          	li	s0,5
c0001234:	1f900a93          	li	s5,505
c0001238:	00040593          	mv	a1,s0
c000123c:	00048513          	mv	a0,s1
c0001240:	d25ff0ef          	jal	ra,c0000f64 <find_vma>
c0001244:	00050913          	mv	s2,a0
c0001248:	2e050463          	beqz	a0,c0001530 <vmm_init+0x420>
c000124c:	00140593          	addi	a1,s0,1
c0001250:	00048513          	mv	a0,s1
c0001254:	d11ff0ef          	jal	ra,c0000f64 <find_vma>
c0001258:	00050993          	mv	s3,a0
c000125c:	2a050a63          	beqz	a0,c0001510 <vmm_init+0x400>
c0001260:	00240a13          	addi	s4,s0,2
c0001264:	000a0593          	mv	a1,s4
c0001268:	00048513          	mv	a0,s1
c000126c:	cf9ff0ef          	jal	ra,c0000f64 <find_vma>
c0001270:	32051063          	bnez	a0,c0001590 <vmm_init+0x480>
c0001274:	00340593          	addi	a1,s0,3
c0001278:	00048513          	mv	a0,s1
c000127c:	ce9ff0ef          	jal	ra,c0000f64 <find_vma>
c0001280:	2e051863          	bnez	a0,c0001570 <vmm_init+0x460>
c0001284:	00440593          	addi	a1,s0,4
c0001288:	00048513          	mv	a0,s1
c000128c:	cd9ff0ef          	jal	ra,c0000f64 <find_vma>
c0001290:	2c051063          	bnez	a0,c0001550 <vmm_init+0x440>
c0001294:	00492783          	lw	a5,4(s2)
c0001298:	22f41c63          	bne	s0,a5,c00014d0 <vmm_init+0x3c0>
c000129c:	00892783          	lw	a5,8(s2)
c00012a0:	23479863          	bne	a5,s4,c00014d0 <vmm_init+0x3c0>
c00012a4:	0049a703          	lw	a4,4(s3)
c00012a8:	20e41463          	bne	s0,a4,c00014b0 <vmm_init+0x3a0>
c00012ac:	0089a703          	lw	a4,8(s3)
c00012b0:	20f71063          	bne	a4,a5,c00014b0 <vmm_init+0x3a0>
c00012b4:	00540413          	addi	s0,s0,5
c00012b8:	f95410e3          	bne	s0,s5,c0001238 <vmm_init+0x128>
c00012bc:	00400413          	li	s0,4
c00012c0:	fff00913          	li	s2,-1
c00012c4:	00040593          	mv	a1,s0
c00012c8:	00048513          	mv	a0,s1
c00012cc:	c99ff0ef          	jal	ra,c0000f64 <find_vma>
c00012d0:	02050e63          	beqz	a0,c000130c <vmm_init+0x1fc>
c00012d4:	00852683          	lw	a3,8(a0)
c00012d8:	00452603          	lw	a2,4(a0)
c00012dc:	00040593          	mv	a1,s0
c00012e0:	00006517          	auipc	a0,0x6
c00012e4:	c3450513          	addi	a0,a0,-972 # c0006f14 <commands+0x970>
c00012e8:	df1fe0ef          	jal	ra,c00000d8 <cprintf>
c00012ec:	00006697          	auipc	a3,0x6
c00012f0:	c5068693          	addi	a3,a3,-944 # c0006f3c <commands+0x998>
c00012f4:	00006617          	auipc	a2,0x6
c00012f8:	9d060613          	addi	a2,a2,-1584 # c0006cc4 <commands+0x720>
c00012fc:	0e100593          	li	a1,225
c0001300:	00006517          	auipc	a0,0x6
c0001304:	9dc50513          	addi	a0,a0,-1572 # c0006cdc <commands+0x738>
c0001308:	f45fe0ef          	jal	ra,c000024c <__panic>
c000130c:	fff40413          	addi	s0,s0,-1
c0001310:	fb241ae3          	bne	s0,s2,c00012c4 <vmm_init+0x1b4>
c0001314:	00048513          	mv	a0,s1
c0001318:	dadff0ef          	jal	ra,c00010c4 <mm_destroy>
c000131c:	00006517          	auipc	a0,0x6
c0001320:	c3450513          	addi	a0,a0,-972 # c0006f50 <commands+0x9ac>
c0001324:	db5fe0ef          	jal	ra,c00000d8 <cprintf>
c0001328:	0e1020ef          	jal	ra,c0003c08 <nr_free_pages>
c000132c:	00050993          	mv	s3,a0
c0001330:	00013917          	auipc	s2,0x13
c0001334:	15890913          	addi	s2,s2,344 # c0014488 <check_mm_struct>
c0001338:	b71ff0ef          	jal	ra,c0000ea8 <mm_create>
c000133c:	00a92023          	sw	a0,0(s2)
c0001340:	00050413          	mv	s0,a0
c0001344:	2a050663          	beqz	a0,c00015f0 <vmm_init+0x4e0>
c0001348:	00013497          	auipc	s1,0x13
c000134c:	1204a483          	lw	s1,288(s1) # c0014468 <boot_pgdir>
c0001350:	0004a783          	lw	a5,0(s1)
c0001354:	00952623          	sw	s1,12(a0)
c0001358:	26079c63          	bnez	a5,c00015d0 <vmm_init+0x4c0>
c000135c:	01800513          	li	a0,24
c0001360:	4bd000ef          	jal	ra,c000201c <kmalloc>
c0001364:	00050a13          	mv	s4,a0
c0001368:	10050463          	beqz	a0,c0001470 <vmm_init+0x360>
c000136c:	004007b7          	lui	a5,0x400
c0001370:	00fa2423          	sw	a5,8(s4)
c0001374:	00200793          	li	a5,2
c0001378:	00050593          	mv	a1,a0
c000137c:	00fa2623          	sw	a5,12(s4)
c0001380:	00040513          	mv	a0,s0
c0001384:	000a2223          	sw	zero,4(s4)
c0001388:	c3dff0ef          	jal	ra,c0000fc4 <insert_vma_struct>
c000138c:	10000593          	li	a1,256
c0001390:	00040513          	mv	a0,s0
c0001394:	bd1ff0ef          	jal	ra,c0000f64 <find_vma>
c0001398:	00000793          	li	a5,0
c000139c:	06400713          	li	a4,100
c00013a0:	2caa1463          	bne	s4,a0,c0001668 <vmm_init+0x558>
c00013a4:	10f78023          	sb	a5,256(a5) # 400100 <BASE_ADDRESS-0xbfbfff00>
c00013a8:	00178793          	addi	a5,a5,1
c00013ac:	fee79ce3          	bne	a5,a4,c00013a4 <vmm_init+0x294>
c00013b0:	00001737          	lui	a4,0x1
c00013b4:	35670713          	addi	a4,a4,854 # 1356 <BASE_ADDRESS-0xbfffecaa>
c00013b8:	00000793          	li	a5,0
c00013bc:	06400613          	li	a2,100
c00013c0:	1007c683          	lbu	a3,256(a5)
c00013c4:	00178793          	addi	a5,a5,1
c00013c8:	40d70733          	sub	a4,a4,a3
c00013cc:	fec79ae3          	bne	a5,a2,c00013c0 <vmm_init+0x2b0>
c00013d0:	26071c63          	bnez	a4,c0001648 <vmm_init+0x538>
c00013d4:	00000593          	li	a1,0
c00013d8:	00048513          	mv	a0,s1
c00013dc:	379020ef          	jal	ra,c0003f54 <page_remove>
c00013e0:	0004a783          	lw	a5,0(s1)
c00013e4:	00013717          	auipc	a4,0x13
c00013e8:	08872703          	lw	a4,136(a4) # c001446c <npage>
c00013ec:	00279793          	slli	a5,a5,0x2
c00013f0:	00c7d793          	srli	a5,a5,0xc
c00013f4:	22e7fe63          	bleu	a4,a5,c0001630 <vmm_init+0x520>
c00013f8:	0000a717          	auipc	a4,0xa
c00013fc:	c3472703          	lw	a4,-972(a4) # c000b02c <nbase>
c0001400:	40e787b3          	sub	a5,a5,a4
c0001404:	00579793          	slli	a5,a5,0x5
c0001408:	00013517          	auipc	a0,0x13
c000140c:	14052503          	lw	a0,320(a0) # c0014548 <pages>
c0001410:	00f50533          	add	a0,a0,a5
c0001414:	00100593          	li	a1,1
c0001418:	78c020ef          	jal	ra,c0003ba4 <free_pages>
c000141c:	0004a023          	sw	zero,0(s1)
c0001420:	00042623          	sw	zero,12(s0)
c0001424:	00040513          	mv	a0,s0
c0001428:	c9dff0ef          	jal	ra,c00010c4 <mm_destroy>
c000142c:	00092023          	sw	zero,0(s2)
c0001430:	7d8020ef          	jal	ra,c0003c08 <nr_free_pages>
c0001434:	1ca99e63          	bne	s3,a0,c0001610 <vmm_init+0x500>
c0001438:	00006517          	auipc	a0,0x6
c000143c:	be050513          	addi	a0,a0,-1056 # c0007018 <commands+0xa74>
c0001440:	c99fe0ef          	jal	ra,c00000d8 <cprintf>
c0001444:	01c12083          	lw	ra,28(sp)
c0001448:	01812403          	lw	s0,24(sp)
c000144c:	01412483          	lw	s1,20(sp)
c0001450:	01012903          	lw	s2,16(sp)
c0001454:	00c12983          	lw	s3,12(sp)
c0001458:	00812a03          	lw	s4,8(sp)
c000145c:	00412a83          	lw	s5,4(sp)
c0001460:	00006517          	auipc	a0,0x6
c0001464:	bd450513          	addi	a0,a0,-1068 # c0007034 <commands+0xa90>
c0001468:	02010113          	addi	sp,sp,32
c000146c:	c6dfe06f          	j	c00000d8 <cprintf>
c0001470:	00006697          	auipc	a3,0x6
c0001474:	bdc68693          	addi	a3,a3,-1060 # c000704c <commands+0xaa8>
c0001478:	00006617          	auipc	a2,0x6
c000147c:	84c60613          	addi	a2,a2,-1972 # c0006cc4 <commands+0x720>
c0001480:	0f800593          	li	a1,248
c0001484:	00006517          	auipc	a0,0x6
c0001488:	85850513          	addi	a0,a0,-1960 # c0006cdc <commands+0x738>
c000148c:	dc1fe0ef          	jal	ra,c000024c <__panic>
c0001490:	00006697          	auipc	a3,0x6
c0001494:	99c68693          	addi	a3,a3,-1636 # c0006e2c <commands+0x888>
c0001498:	00006617          	auipc	a2,0x6
c000149c:	82c60613          	addi	a2,a2,-2004 # c0006cc4 <commands+0x720>
c00014a0:	0c800593          	li	a1,200
c00014a4:	00006517          	auipc	a0,0x6
c00014a8:	83850513          	addi	a0,a0,-1992 # c0006cdc <commands+0x738>
c00014ac:	da1fe0ef          	jal	ra,c000024c <__panic>
c00014b0:	00006697          	auipc	a3,0x6
c00014b4:	a3468693          	addi	a3,a3,-1484 # c0006ee4 <commands+0x940>
c00014b8:	00006617          	auipc	a2,0x6
c00014bc:	80c60613          	addi	a2,a2,-2036 # c0006cc4 <commands+0x720>
c00014c0:	0d900593          	li	a1,217
c00014c4:	00006517          	auipc	a0,0x6
c00014c8:	81850513          	addi	a0,a0,-2024 # c0006cdc <commands+0x738>
c00014cc:	d81fe0ef          	jal	ra,c000024c <__panic>
c00014d0:	00006697          	auipc	a3,0x6
c00014d4:	9e468693          	addi	a3,a3,-1564 # c0006eb4 <commands+0x910>
c00014d8:	00005617          	auipc	a2,0x5
c00014dc:	7ec60613          	addi	a2,a2,2028 # c0006cc4 <commands+0x720>
c00014e0:	0d800593          	li	a1,216
c00014e4:	00005517          	auipc	a0,0x5
c00014e8:	7f850513          	addi	a0,a0,2040 # c0006cdc <commands+0x738>
c00014ec:	d61fe0ef          	jal	ra,c000024c <__panic>
c00014f0:	00006697          	auipc	a3,0x6
c00014f4:	92468693          	addi	a3,a3,-1756 # c0006e14 <commands+0x870>
c00014f8:	00005617          	auipc	a2,0x5
c00014fc:	7cc60613          	addi	a2,a2,1996 # c0006cc4 <commands+0x720>
c0001500:	0c600593          	li	a1,198
c0001504:	00005517          	auipc	a0,0x5
c0001508:	7d850513          	addi	a0,a0,2008 # c0006cdc <commands+0x738>
c000150c:	d41fe0ef          	jal	ra,c000024c <__panic>
c0001510:	00006697          	auipc	a3,0x6
c0001514:	96468693          	addi	a3,a3,-1692 # c0006e74 <commands+0x8d0>
c0001518:	00005617          	auipc	a2,0x5
c000151c:	7ac60613          	addi	a2,a2,1964 # c0006cc4 <commands+0x720>
c0001520:	0d000593          	li	a1,208
c0001524:	00005517          	auipc	a0,0x5
c0001528:	7b850513          	addi	a0,a0,1976 # c0006cdc <commands+0x738>
c000152c:	d21fe0ef          	jal	ra,c000024c <__panic>
c0001530:	00006697          	auipc	a3,0x6
c0001534:	93468693          	addi	a3,a3,-1740 # c0006e64 <commands+0x8c0>
c0001538:	00005617          	auipc	a2,0x5
c000153c:	78c60613          	addi	a2,a2,1932 # c0006cc4 <commands+0x720>
c0001540:	0ce00593          	li	a1,206
c0001544:	00005517          	auipc	a0,0x5
c0001548:	79850513          	addi	a0,a0,1944 # c0006cdc <commands+0x738>
c000154c:	d01fe0ef          	jal	ra,c000024c <__panic>
c0001550:	00006697          	auipc	a3,0x6
c0001554:	95468693          	addi	a3,a3,-1708 # c0006ea4 <commands+0x900>
c0001558:	00005617          	auipc	a2,0x5
c000155c:	76c60613          	addi	a2,a2,1900 # c0006cc4 <commands+0x720>
c0001560:	0d600593          	li	a1,214
c0001564:	00005517          	auipc	a0,0x5
c0001568:	77850513          	addi	a0,a0,1912 # c0006cdc <commands+0x738>
c000156c:	ce1fe0ef          	jal	ra,c000024c <__panic>
c0001570:	00006697          	auipc	a3,0x6
c0001574:	92468693          	addi	a3,a3,-1756 # c0006e94 <commands+0x8f0>
c0001578:	00005617          	auipc	a2,0x5
c000157c:	74c60613          	addi	a2,a2,1868 # c0006cc4 <commands+0x720>
c0001580:	0d400593          	li	a1,212
c0001584:	00005517          	auipc	a0,0x5
c0001588:	75850513          	addi	a0,a0,1880 # c0006cdc <commands+0x738>
c000158c:	cc1fe0ef          	jal	ra,c000024c <__panic>
c0001590:	00006697          	auipc	a3,0x6
c0001594:	8f468693          	addi	a3,a3,-1804 # c0006e84 <commands+0x8e0>
c0001598:	00005617          	auipc	a2,0x5
c000159c:	72c60613          	addi	a2,a2,1836 # c0006cc4 <commands+0x720>
c00015a0:	0d200593          	li	a1,210
c00015a4:	00005517          	auipc	a0,0x5
c00015a8:	73850513          	addi	a0,a0,1848 # c0006cdc <commands+0x738>
c00015ac:	ca1fe0ef          	jal	ra,c000024c <__panic>
c00015b0:	00006697          	auipc	a3,0x6
c00015b4:	85868693          	addi	a3,a3,-1960 # c0006e08 <commands+0x864>
c00015b8:	00005617          	auipc	a2,0x5
c00015bc:	70c60613          	addi	a2,a2,1804 # c0006cc4 <commands+0x720>
c00015c0:	0b200593          	li	a1,178
c00015c4:	00005517          	auipc	a0,0x5
c00015c8:	71850513          	addi	a0,a0,1816 # c0006cdc <commands+0x738>
c00015cc:	c81fe0ef          	jal	ra,c000024c <__panic>
c00015d0:	00006697          	auipc	a3,0x6
c00015d4:	9b868693          	addi	a3,a3,-1608 # c0006f88 <commands+0x9e4>
c00015d8:	00005617          	auipc	a2,0x5
c00015dc:	6ec60613          	addi	a2,a2,1772 # c0006cc4 <commands+0x720>
c00015e0:	0f500593          	li	a1,245
c00015e4:	00005517          	auipc	a0,0x5
c00015e8:	6f850513          	addi	a0,a0,1784 # c0006cdc <commands+0x738>
c00015ec:	c61fe0ef          	jal	ra,c000024c <__panic>
c00015f0:	00006697          	auipc	a3,0x6
c00015f4:	98068693          	addi	a3,a3,-1664 # c0006f70 <commands+0x9cc>
c00015f8:	00005617          	auipc	a2,0x5
c00015fc:	6cc60613          	addi	a2,a2,1740 # c0006cc4 <commands+0x720>
c0001600:	0f100593          	li	a1,241
c0001604:	00005517          	auipc	a0,0x5
c0001608:	6d850513          	addi	a0,a0,1752 # c0006cdc <commands+0x738>
c000160c:	c41fe0ef          	jal	ra,c000024c <__panic>
c0001610:	00006697          	auipc	a3,0x6
c0001614:	9e068693          	addi	a3,a3,-1568 # c0006ff0 <commands+0xa4c>
c0001618:	00005617          	auipc	a2,0x5
c000161c:	6ac60613          	addi	a2,a2,1708 # c0006cc4 <commands+0x720>
c0001620:	11100593          	li	a1,273
c0001624:	00005517          	auipc	a0,0x5
c0001628:	6b850513          	addi	a0,a0,1720 # c0006cdc <commands+0x738>
c000162c:	c21fe0ef          	jal	ra,c000024c <__panic>
c0001630:	00006617          	auipc	a2,0x6
c0001634:	99060613          	addi	a2,a2,-1648 # c0006fc0 <commands+0xa1c>
c0001638:	06200593          	li	a1,98
c000163c:	00006517          	auipc	a0,0x6
c0001640:	9a450513          	addi	a0,a0,-1628 # c0006fe0 <commands+0xa3c>
c0001644:	c09fe0ef          	jal	ra,c000024c <__panic>
c0001648:	00006697          	auipc	a3,0x6
c000164c:	96c68693          	addi	a3,a3,-1684 # c0006fb4 <commands+0xa10>
c0001650:	00005617          	auipc	a2,0x5
c0001654:	67460613          	addi	a2,a2,1652 # c0006cc4 <commands+0x720>
c0001658:	10700593          	li	a1,263
c000165c:	00005517          	auipc	a0,0x5
c0001660:	68050513          	addi	a0,a0,1664 # c0006cdc <commands+0x738>
c0001664:	be9fe0ef          	jal	ra,c000024c <__panic>
c0001668:	00006697          	auipc	a3,0x6
c000166c:	93068693          	addi	a3,a3,-1744 # c0006f98 <commands+0x9f4>
c0001670:	00005617          	auipc	a2,0x5
c0001674:	65460613          	addi	a2,a2,1620 # c0006cc4 <commands+0x720>
c0001678:	0fd00593          	li	a1,253
c000167c:	00005517          	auipc	a0,0x5
c0001680:	66050513          	addi	a0,a0,1632 # c0006cdc <commands+0x738>
c0001684:	bc9fe0ef          	jal	ra,c000024c <__panic>

c0001688 <do_pgfault>:
c0001688:	fd010113          	addi	sp,sp,-48
c000168c:	00060593          	mv	a1,a2
c0001690:	02812423          	sw	s0,40(sp)
c0001694:	02912223          	sw	s1,36(sp)
c0001698:	02112623          	sw	ra,44(sp)
c000169c:	03212023          	sw	s2,32(sp)
c00016a0:	01312e23          	sw	s3,28(sp)
c00016a4:	00060413          	mv	s0,a2
c00016a8:	00050493          	mv	s1,a0
c00016ac:	8b9ff0ef          	jal	ra,c0000f64 <find_vma>
c00016b0:	00013797          	auipc	a5,0x13
c00016b4:	da87a783          	lw	a5,-600(a5) # c0014458 <pgfault_num>
c00016b8:	00178793          	addi	a5,a5,1
c00016bc:	00013297          	auipc	t0,0x13
c00016c0:	d8f2ae23          	sw	a5,-612(t0) # c0014458 <pgfault_num>
c00016c4:	10050c63          	beqz	a0,c00017dc <do_pgfault+0x154>
c00016c8:	00452783          	lw	a5,4(a0)
c00016cc:	10f46863          	bltu	s0,a5,c00017dc <do_pgfault+0x154>
c00016d0:	00c52783          	lw	a5,12(a0)
c00016d4:	01000993          	li	s3,16
c00016d8:	0027f793          	andi	a5,a5,2
c00016dc:	0a079063          	bnez	a5,c000177c <do_pgfault+0xf4>
c00016e0:	fffff637          	lui	a2,0xfffff
c00016e4:	00c4a503          	lw	a0,12(s1)
c00016e8:	00c47433          	and	s0,s0,a2
c00016ec:	00040593          	mv	a1,s0
c00016f0:	00100613          	li	a2,1
c00016f4:	56c020ef          	jal	ra,c0003c60 <get_pte>
c00016f8:	10050863          	beqz	a0,c0001808 <do_pgfault+0x180>
c00016fc:	00052583          	lw	a1,0(a0)
c0001700:	0a058863          	beqz	a1,c00017b0 <do_pgfault+0x128>
c0001704:	00013797          	auipc	a5,0x13
c0001708:	d607a783          	lw	a5,-672(a5) # c0014464 <swap_init_ok>
c000170c:	0e078463          	beqz	a5,c00017f4 <do_pgfault+0x16c>
c0001710:	00c10613          	addi	a2,sp,12
c0001714:	00040593          	mv	a1,s0
c0001718:	00048513          	mv	a0,s1
c000171c:	00012623          	sw	zero,12(sp)
c0001720:	510010ef          	jal	ra,c0002c30 <swap_in>
c0001724:	00050913          	mv	s2,a0
c0001728:	04051e63          	bnez	a0,c0001784 <do_pgfault+0xfc>
c000172c:	00c12583          	lw	a1,12(sp)
c0001730:	00c4a503          	lw	a0,12(s1)
c0001734:	00098693          	mv	a3,s3
c0001738:	00040613          	mv	a2,s0
c000173c:	0c5020ef          	jal	ra,c0004000 <page_insert>
c0001740:	00c12603          	lw	a2,12(sp)
c0001744:	00100693          	li	a3,1
c0001748:	00040593          	mv	a1,s0
c000174c:	00048513          	mv	a0,s1
c0001750:	324010ef          	jal	ra,c0002a74 <swap_map_swappable>
c0001754:	00c12783          	lw	a5,12(sp)
c0001758:	0087ae23          	sw	s0,28(a5)
c000175c:	02c12083          	lw	ra,44(sp)
c0001760:	00090513          	mv	a0,s2
c0001764:	02812403          	lw	s0,40(sp)
c0001768:	02412483          	lw	s1,36(sp)
c000176c:	02012903          	lw	s2,32(sp)
c0001770:	01c12983          	lw	s3,28(sp)
c0001774:	03010113          	addi	sp,sp,48
c0001778:	00008067          	ret
c000177c:	01700993          	li	s3,23
c0001780:	f61ff06f          	j	c00016e0 <do_pgfault+0x58>
c0001784:	00005517          	auipc	a0,0x5
c0001788:	5e050513          	addi	a0,a0,1504 # c0006d64 <commands+0x7c0>
c000178c:	94dfe0ef          	jal	ra,c00000d8 <cprintf>
c0001790:	02c12083          	lw	ra,44(sp)
c0001794:	00090513          	mv	a0,s2
c0001798:	02812403          	lw	s0,40(sp)
c000179c:	02412483          	lw	s1,36(sp)
c00017a0:	02012903          	lw	s2,32(sp)
c00017a4:	01c12983          	lw	s3,28(sp)
c00017a8:	03010113          	addi	sp,sp,48
c00017ac:	00008067          	ret
c00017b0:	00c4a503          	lw	a0,12(s1)
c00017b4:	00098613          	mv	a2,s3
c00017b8:	00040593          	mv	a1,s0
c00017bc:	15d020ef          	jal	ra,c0004118 <pgdir_alloc_page>
c00017c0:	00000913          	li	s2,0
c00017c4:	f8051ce3          	bnez	a0,c000175c <do_pgfault+0xd4>
c00017c8:	00005517          	auipc	a0,0x5
c00017cc:	57450513          	addi	a0,a0,1396 # c0006d3c <commands+0x798>
c00017d0:	909fe0ef          	jal	ra,c00000d8 <cprintf>
c00017d4:	ffc00913          	li	s2,-4
c00017d8:	f85ff06f          	j	c000175c <do_pgfault+0xd4>
c00017dc:	00040593          	mv	a1,s0
c00017e0:	00005517          	auipc	a0,0x5
c00017e4:	50c50513          	addi	a0,a0,1292 # c0006cec <commands+0x748>
c00017e8:	8f1fe0ef          	jal	ra,c00000d8 <cprintf>
c00017ec:	ffd00913          	li	s2,-3
c00017f0:	f6dff06f          	j	c000175c <do_pgfault+0xd4>
c00017f4:	00005517          	auipc	a0,0x5
c00017f8:	59050513          	addi	a0,a0,1424 # c0006d84 <commands+0x7e0>
c00017fc:	8ddfe0ef          	jal	ra,c00000d8 <cprintf>
c0001800:	ffc00913          	li	s2,-4
c0001804:	f59ff06f          	j	c000175c <do_pgfault+0xd4>
c0001808:	00005517          	auipc	a0,0x5
c000180c:	51450513          	addi	a0,a0,1300 # c0006d1c <commands+0x778>
c0001810:	8c9fe0ef          	jal	ra,c00000d8 <cprintf>
c0001814:	ffc00913          	li	s2,-4
c0001818:	f45ff06f          	j	c000175c <do_pgfault+0xd4>

c000181c <_fifo_init_mm>:
c000181c:	00013797          	auipc	a5,0x13
c0001820:	c7078793          	addi	a5,a5,-912 # c001448c <pra_list_head>
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
c0001860:	7fc50513          	addi	a0,a0,2044 # c0007058 <commands+0xab4>
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
c000188c:	84dfe0ef          	jal	ra,c00000d8 <cprintf>
c0001890:	01390023          	sb	s3,0(s2) # 3000 <BASE_ADDRESS-0xbfffd000>
c0001894:	00013417          	auipc	s0,0x13
c0001898:	bc442403          	lw	s0,-1084(s0) # c0014458 <pgfault_num>
c000189c:	00400793          	li	a5,4
c00018a0:	1af41c63          	bne	s0,a5,c0001a58 <_fifo_check_swap+0x208>
c00018a4:	00006517          	auipc	a0,0x6
c00018a8:	80050513          	addi	a0,a0,-2048 # c00070a4 <commands+0xb00>
c00018ac:	00001ab7          	lui	s5,0x1
c00018b0:	00a00b13          	li	s6,10
c00018b4:	825fe0ef          	jal	ra,c00000d8 <cprintf>
c00018b8:	016a8023          	sb	s6,0(s5) # 1000 <BASE_ADDRESS-0xbffff000>
c00018bc:	00013497          	auipc	s1,0x13
c00018c0:	b9c4a483          	lw	s1,-1124(s1) # c0014458 <pgfault_num>
c00018c4:	30849a63          	bne	s1,s0,c0001bd8 <_fifo_check_swap+0x388>
c00018c8:	00006517          	auipc	a0,0x6
c00018cc:	80450513          	addi	a0,a0,-2044 # c00070cc <commands+0xb28>
c00018d0:	00004bb7          	lui	s7,0x4
c00018d4:	00d00c13          	li	s8,13
c00018d8:	801fe0ef          	jal	ra,c00000d8 <cprintf>
c00018dc:	018b8023          	sb	s8,0(s7) # 4000 <BASE_ADDRESS-0xbfffc000>
c00018e0:	00013a17          	auipc	s4,0x13
c00018e4:	b78a2a03          	lw	s4,-1160(s4) # c0014458 <pgfault_num>
c00018e8:	2c9a1863          	bne	s4,s1,c0001bb8 <_fifo_check_swap+0x368>
c00018ec:	00006517          	auipc	a0,0x6
c00018f0:	80850513          	addi	a0,a0,-2040 # c00070f4 <commands+0xb50>
c00018f4:	00002437          	lui	s0,0x2
c00018f8:	00b00493          	li	s1,11
c00018fc:	fdcfe0ef          	jal	ra,c00000d8 <cprintf>
c0001900:	00940023          	sb	s1,0(s0) # 2000 <BASE_ADDRESS-0xbfffe000>
c0001904:	00013797          	auipc	a5,0x13
c0001908:	b547a783          	lw	a5,-1196(a5) # c0014458 <pgfault_num>
c000190c:	29479663          	bne	a5,s4,c0001b98 <_fifo_check_swap+0x348>
c0001910:	00006517          	auipc	a0,0x6
c0001914:	80c50513          	addi	a0,a0,-2036 # c000711c <commands+0xb78>
c0001918:	fc0fe0ef          	jal	ra,c00000d8 <cprintf>
c000191c:	000057b7          	lui	a5,0x5
c0001920:	00e00713          	li	a4,14
c0001924:	00e78023          	sb	a4,0(a5) # 5000 <BASE_ADDRESS-0xbfffb000>
c0001928:	00013a17          	auipc	s4,0x13
c000192c:	b30a2a03          	lw	s4,-1232(s4) # c0014458 <pgfault_num>
c0001930:	00500793          	li	a5,5
c0001934:	24fa1263          	bne	s4,a5,c0001b78 <_fifo_check_swap+0x328>
c0001938:	00005517          	auipc	a0,0x5
c000193c:	7bc50513          	addi	a0,a0,1980 # c00070f4 <commands+0xb50>
c0001940:	f98fe0ef          	jal	ra,c00000d8 <cprintf>
c0001944:	00940023          	sb	s1,0(s0)
c0001948:	00013797          	auipc	a5,0x13
c000194c:	b107a783          	lw	a5,-1264(a5) # c0014458 <pgfault_num>
c0001950:	21479463          	bne	a5,s4,c0001b58 <_fifo_check_swap+0x308>
c0001954:	00005517          	auipc	a0,0x5
c0001958:	75050513          	addi	a0,a0,1872 # c00070a4 <commands+0xb00>
c000195c:	f7cfe0ef          	jal	ra,c00000d8 <cprintf>
c0001960:	016a8023          	sb	s6,0(s5)
c0001964:	00013717          	auipc	a4,0x13
c0001968:	af472703          	lw	a4,-1292(a4) # c0014458 <pgfault_num>
c000196c:	00600793          	li	a5,6
c0001970:	1cf71463          	bne	a4,a5,c0001b38 <_fifo_check_swap+0x2e8>
c0001974:	00005517          	auipc	a0,0x5
c0001978:	78050513          	addi	a0,a0,1920 # c00070f4 <commands+0xb50>
c000197c:	f5cfe0ef          	jal	ra,c00000d8 <cprintf>
c0001980:	00940023          	sb	s1,0(s0)
c0001984:	00013717          	auipc	a4,0x13
c0001988:	ad472703          	lw	a4,-1324(a4) # c0014458 <pgfault_num>
c000198c:	00700793          	li	a5,7
c0001990:	18f71463          	bne	a4,a5,c0001b18 <_fifo_check_swap+0x2c8>
c0001994:	00005517          	auipc	a0,0x5
c0001998:	6c450513          	addi	a0,a0,1732 # c0007058 <commands+0xab4>
c000199c:	f3cfe0ef          	jal	ra,c00000d8 <cprintf>
c00019a0:	01390023          	sb	s3,0(s2)
c00019a4:	00013717          	auipc	a4,0x13
c00019a8:	ab472703          	lw	a4,-1356(a4) # c0014458 <pgfault_num>
c00019ac:	00800793          	li	a5,8
c00019b0:	14f71463          	bne	a4,a5,c0001af8 <_fifo_check_swap+0x2a8>
c00019b4:	00005517          	auipc	a0,0x5
c00019b8:	71850513          	addi	a0,a0,1816 # c00070cc <commands+0xb28>
c00019bc:	f1cfe0ef          	jal	ra,c00000d8 <cprintf>
c00019c0:	018b8023          	sb	s8,0(s7)
c00019c4:	00013717          	auipc	a4,0x13
c00019c8:	a9472703          	lw	a4,-1388(a4) # c0014458 <pgfault_num>
c00019cc:	00900793          	li	a5,9
c00019d0:	10f71463          	bne	a4,a5,c0001ad8 <_fifo_check_swap+0x288>
c00019d4:	00005517          	auipc	a0,0x5
c00019d8:	74850513          	addi	a0,a0,1864 # c000711c <commands+0xb78>
c00019dc:	efcfe0ef          	jal	ra,c00000d8 <cprintf>
c00019e0:	000057b7          	lui	a5,0x5
c00019e4:	00e00713          	li	a4,14
c00019e8:	00e78023          	sb	a4,0(a5) # 5000 <BASE_ADDRESS-0xbfffb000>
c00019ec:	00013417          	auipc	s0,0x13
c00019f0:	a6c42403          	lw	s0,-1428(s0) # c0014458 <pgfault_num>
c00019f4:	00a00793          	li	a5,10
c00019f8:	0cf41063          	bne	s0,a5,c0001ab8 <_fifo_check_swap+0x268>
c00019fc:	00005517          	auipc	a0,0x5
c0001a00:	6a850513          	addi	a0,a0,1704 # c00070a4 <commands+0xb00>
c0001a04:	ed4fe0ef          	jal	ra,c00000d8 <cprintf>
c0001a08:	000017b7          	lui	a5,0x1
c0001a0c:	0007c783          	lbu	a5,0(a5) # 1000 <BASE_ADDRESS-0xbffff000>
c0001a10:	08879463          	bne	a5,s0,c0001a98 <_fifo_check_swap+0x248>
c0001a14:	00013717          	auipc	a4,0x13
c0001a18:	a4472703          	lw	a4,-1468(a4) # c0014458 <pgfault_num>
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
c0001a58:	00005697          	auipc	a3,0x5
c0001a5c:	62868693          	addi	a3,a3,1576 # c0007080 <commands+0xadc>
c0001a60:	00005617          	auipc	a2,0x5
c0001a64:	26460613          	addi	a2,a2,612 # c0006cc4 <commands+0x720>
c0001a68:	05100593          	li	a1,81
c0001a6c:	00005517          	auipc	a0,0x5
c0001a70:	62450513          	addi	a0,a0,1572 # c0007090 <commands+0xaec>
c0001a74:	fd8fe0ef          	jal	ra,c000024c <__panic>
c0001a78:	00005697          	auipc	a3,0x5
c0001a7c:	75068693          	addi	a3,a3,1872 # c00071c8 <commands+0xc24>
c0001a80:	00005617          	auipc	a2,0x5
c0001a84:	24460613          	addi	a2,a2,580 # c0006cc4 <commands+0x720>
c0001a88:	07300593          	li	a1,115
c0001a8c:	00005517          	auipc	a0,0x5
c0001a90:	60450513          	addi	a0,a0,1540 # c0007090 <commands+0xaec>
c0001a94:	fb8fe0ef          	jal	ra,c000024c <__panic>
c0001a98:	00005697          	auipc	a3,0x5
c0001a9c:	70c68693          	addi	a3,a3,1804 # c00071a4 <commands+0xc00>
c0001aa0:	00005617          	auipc	a2,0x5
c0001aa4:	22460613          	addi	a2,a2,548 # c0006cc4 <commands+0x720>
c0001aa8:	07100593          	li	a1,113
c0001aac:	00005517          	auipc	a0,0x5
c0001ab0:	5e450513          	addi	a0,a0,1508 # c0007090 <commands+0xaec>
c0001ab4:	f98fe0ef          	jal	ra,c000024c <__panic>
c0001ab8:	00005697          	auipc	a3,0x5
c0001abc:	6dc68693          	addi	a3,a3,1756 # c0007194 <commands+0xbf0>
c0001ac0:	00005617          	auipc	a2,0x5
c0001ac4:	20460613          	addi	a2,a2,516 # c0006cc4 <commands+0x720>
c0001ac8:	06f00593          	li	a1,111
c0001acc:	00005517          	auipc	a0,0x5
c0001ad0:	5c450513          	addi	a0,a0,1476 # c0007090 <commands+0xaec>
c0001ad4:	f78fe0ef          	jal	ra,c000024c <__panic>
c0001ad8:	00005697          	auipc	a3,0x5
c0001adc:	6ac68693          	addi	a3,a3,1708 # c0007184 <commands+0xbe0>
c0001ae0:	00005617          	auipc	a2,0x5
c0001ae4:	1e460613          	addi	a2,a2,484 # c0006cc4 <commands+0x720>
c0001ae8:	06c00593          	li	a1,108
c0001aec:	00005517          	auipc	a0,0x5
c0001af0:	5a450513          	addi	a0,a0,1444 # c0007090 <commands+0xaec>
c0001af4:	f58fe0ef          	jal	ra,c000024c <__panic>
c0001af8:	00005697          	auipc	a3,0x5
c0001afc:	67c68693          	addi	a3,a3,1660 # c0007174 <commands+0xbd0>
c0001b00:	00005617          	auipc	a2,0x5
c0001b04:	1c460613          	addi	a2,a2,452 # c0006cc4 <commands+0x720>
c0001b08:	06900593          	li	a1,105
c0001b0c:	00005517          	auipc	a0,0x5
c0001b10:	58450513          	addi	a0,a0,1412 # c0007090 <commands+0xaec>
c0001b14:	f38fe0ef          	jal	ra,c000024c <__panic>
c0001b18:	00005697          	auipc	a3,0x5
c0001b1c:	64c68693          	addi	a3,a3,1612 # c0007164 <commands+0xbc0>
c0001b20:	00005617          	auipc	a2,0x5
c0001b24:	1a460613          	addi	a2,a2,420 # c0006cc4 <commands+0x720>
c0001b28:	06600593          	li	a1,102
c0001b2c:	00005517          	auipc	a0,0x5
c0001b30:	56450513          	addi	a0,a0,1380 # c0007090 <commands+0xaec>
c0001b34:	f18fe0ef          	jal	ra,c000024c <__panic>
c0001b38:	00005697          	auipc	a3,0x5
c0001b3c:	61c68693          	addi	a3,a3,1564 # c0007154 <commands+0xbb0>
c0001b40:	00005617          	auipc	a2,0x5
c0001b44:	18460613          	addi	a2,a2,388 # c0006cc4 <commands+0x720>
c0001b48:	06300593          	li	a1,99
c0001b4c:	00005517          	auipc	a0,0x5
c0001b50:	54450513          	addi	a0,a0,1348 # c0007090 <commands+0xaec>
c0001b54:	ef8fe0ef          	jal	ra,c000024c <__panic>
c0001b58:	00005697          	auipc	a3,0x5
c0001b5c:	5ec68693          	addi	a3,a3,1516 # c0007144 <commands+0xba0>
c0001b60:	00005617          	auipc	a2,0x5
c0001b64:	16460613          	addi	a2,a2,356 # c0006cc4 <commands+0x720>
c0001b68:	06000593          	li	a1,96
c0001b6c:	00005517          	auipc	a0,0x5
c0001b70:	52450513          	addi	a0,a0,1316 # c0007090 <commands+0xaec>
c0001b74:	ed8fe0ef          	jal	ra,c000024c <__panic>
c0001b78:	00005697          	auipc	a3,0x5
c0001b7c:	5cc68693          	addi	a3,a3,1484 # c0007144 <commands+0xba0>
c0001b80:	00005617          	auipc	a2,0x5
c0001b84:	14460613          	addi	a2,a2,324 # c0006cc4 <commands+0x720>
c0001b88:	05d00593          	li	a1,93
c0001b8c:	00005517          	auipc	a0,0x5
c0001b90:	50450513          	addi	a0,a0,1284 # c0007090 <commands+0xaec>
c0001b94:	eb8fe0ef          	jal	ra,c000024c <__panic>
c0001b98:	00005697          	auipc	a3,0x5
c0001b9c:	4e868693          	addi	a3,a3,1256 # c0007080 <commands+0xadc>
c0001ba0:	00005617          	auipc	a2,0x5
c0001ba4:	12460613          	addi	a2,a2,292 # c0006cc4 <commands+0x720>
c0001ba8:	05a00593          	li	a1,90
c0001bac:	00005517          	auipc	a0,0x5
c0001bb0:	4e450513          	addi	a0,a0,1252 # c0007090 <commands+0xaec>
c0001bb4:	e98fe0ef          	jal	ra,c000024c <__panic>
c0001bb8:	00005697          	auipc	a3,0x5
c0001bbc:	4c868693          	addi	a3,a3,1224 # c0007080 <commands+0xadc>
c0001bc0:	00005617          	auipc	a2,0x5
c0001bc4:	10460613          	addi	a2,a2,260 # c0006cc4 <commands+0x720>
c0001bc8:	05700593          	li	a1,87
c0001bcc:	00005517          	auipc	a0,0x5
c0001bd0:	4c450513          	addi	a0,a0,1220 # c0007090 <commands+0xaec>
c0001bd4:	e78fe0ef          	jal	ra,c000024c <__panic>
c0001bd8:	00005697          	auipc	a3,0x5
c0001bdc:	4a868693          	addi	a3,a3,1192 # c0007080 <commands+0xadc>
c0001be0:	00005617          	auipc	a2,0x5
c0001be4:	0e460613          	addi	a2,a2,228 # c0006cc4 <commands+0x720>
c0001be8:	05400593          	li	a1,84
c0001bec:	00005517          	auipc	a0,0x5
c0001bf0:	4a450513          	addi	a0,a0,1188 # c0007090 <commands+0xaec>
c0001bf4:	e58fe0ef          	jal	ra,c000024c <__panic>

c0001bf8 <_fifo_swap_out_victim>:
c0001bf8:	01452783          	lw	a5,20(a0)
c0001bfc:	ff010113          	addi	sp,sp,-16
c0001c00:	00112623          	sw	ra,12(sp)
c0001c04:	02078a63          	beqz	a5,c0001c38 <_fifo_swap_out_victim+0x40>
c0001c08:	04061863          	bnez	a2,c0001c58 <_fifo_swap_out_victim+0x60>
c0001c0c:	0047a783          	lw	a5,4(a5)
c0001c10:	00c12083          	lw	ra,12(sp)
c0001c14:	00000513          	li	a0,0
c0001c18:	0007a683          	lw	a3,0(a5)
c0001c1c:	0047a703          	lw	a4,4(a5)
c0001c20:	fec78793          	addi	a5,a5,-20
c0001c24:	01010113          	addi	sp,sp,16
c0001c28:	00e6a223          	sw	a4,4(a3)
c0001c2c:	00d72023          	sw	a3,0(a4)
c0001c30:	00f5a023          	sw	a5,0(a1)
c0001c34:	00008067          	ret
c0001c38:	00005697          	auipc	a3,0x5
c0001c3c:	5c068693          	addi	a3,a3,1472 # c00071f8 <commands+0xc54>
c0001c40:	00005617          	auipc	a2,0x5
c0001c44:	08460613          	addi	a2,a2,132 # c0006cc4 <commands+0x720>
c0001c48:	04100593          	li	a1,65
c0001c4c:	00005517          	auipc	a0,0x5
c0001c50:	44450513          	addi	a0,a0,1092 # c0007090 <commands+0xaec>
c0001c54:	df8fe0ef          	jal	ra,c000024c <__panic>
c0001c58:	00005697          	auipc	a3,0x5
c0001c5c:	5b068693          	addi	a3,a3,1456 # c0007208 <commands+0xc64>
c0001c60:	00005617          	auipc	a2,0x5
c0001c64:	06460613          	addi	a2,a2,100 # c0006cc4 <commands+0x720>
c0001c68:	04200593          	li	a1,66
c0001c6c:	00005517          	auipc	a0,0x5
c0001c70:	42450513          	addi	a0,a0,1060 # c0007090 <commands+0xaec>
c0001c74:	dd8fe0ef          	jal	ra,c000024c <__panic>

c0001c78 <_fifo_map_swappable>:
c0001c78:	01460713          	addi	a4,a2,20
c0001c7c:	01452783          	lw	a5,20(a0)
c0001c80:	02070263          	beqz	a4,c0001ca4 <_fifo_map_swappable+0x2c>
c0001c84:	02078063          	beqz	a5,c0001ca4 <_fifo_map_swappable+0x2c>
c0001c88:	0007a683          	lw	a3,0(a5)
c0001c8c:	00e7a023          	sw	a4,0(a5)
c0001c90:	00000513          	li	a0,0
c0001c94:	00e6a223          	sw	a4,4(a3)
c0001c98:	00f62c23          	sw	a5,24(a2)
c0001c9c:	00d62a23          	sw	a3,20(a2)
c0001ca0:	00008067          	ret
c0001ca4:	ff010113          	addi	sp,sp,-16
c0001ca8:	00005697          	auipc	a3,0x5
c0001cac:	53068693          	addi	a3,a3,1328 # c00071d8 <commands+0xc34>
c0001cb0:	00005617          	auipc	a2,0x5
c0001cb4:	01460613          	addi	a2,a2,20 # c0006cc4 <commands+0x720>
c0001cb8:	03200593          	li	a1,50
c0001cbc:	00005517          	auipc	a0,0x5
c0001cc0:	3d450513          	addi	a0,a0,980 # c0007090 <commands+0xaec>
c0001cc4:	00112623          	sw	ra,12(sp)
c0001cc8:	d84fe0ef          	jal	ra,c000024c <__panic>

c0001ccc <slob_free>:
c0001ccc:	08050a63          	beqz	a0,c0001d60 <slob_free+0x94>
c0001cd0:	ff010113          	addi	sp,sp,-16
c0001cd4:	00112623          	sw	ra,12(sp)
c0001cd8:	00812423          	sw	s0,8(sp)
c0001cdc:	08059463          	bnez	a1,c0001d64 <slob_free+0x98>
c0001ce0:	00050413          	mv	s0,a0
c0001ce4:	100027f3          	csrr	a5,sstatus
c0001ce8:	0027f793          	andi	a5,a5,2
c0001cec:	00000613          	li	a2,0
c0001cf0:	08079a63          	bnez	a5,c0001d84 <slob_free+0xb8>
c0001cf4:	00009797          	auipc	a5,0x9
c0001cf8:	3347a783          	lw	a5,820(a5) # c000b028 <slobfree>
c0001cfc:	0047a703          	lw	a4,4(a5)
c0001d00:	0087fc63          	bleu	s0,a5,c0001d18 <slob_free+0x4c>
c0001d04:	00e46e63          	bltu	s0,a4,c0001d20 <slob_free+0x54>
c0001d08:	00e7fc63          	bleu	a4,a5,c0001d20 <slob_free+0x54>
c0001d0c:	00070793          	mv	a5,a4
c0001d10:	0047a703          	lw	a4,4(a5)
c0001d14:	fe87e8e3          	bltu	a5,s0,c0001d04 <slob_free+0x38>
c0001d18:	fee7eae3          	bltu	a5,a4,c0001d0c <slob_free+0x40>
c0001d1c:	fee478e3          	bleu	a4,s0,c0001d0c <slob_free+0x40>
c0001d20:	00042583          	lw	a1,0(s0)
c0001d24:	00359693          	slli	a3,a1,0x3
c0001d28:	00d406b3          	add	a3,s0,a3
c0001d2c:	08d70663          	beq	a4,a3,c0001db8 <slob_free+0xec>
c0001d30:	00e42223          	sw	a4,4(s0)
c0001d34:	0007a683          	lw	a3,0(a5)
c0001d38:	00369713          	slli	a4,a3,0x3
c0001d3c:	00e78733          	add	a4,a5,a4
c0001d40:	06e40063          	beq	s0,a4,c0001da0 <slob_free+0xd4>
c0001d44:	0087a223          	sw	s0,4(a5)
c0001d48:	00009297          	auipc	t0,0x9
c0001d4c:	2ef2a023          	sw	a5,736(t0) # c000b028 <slobfree>
c0001d50:	04061063          	bnez	a2,c0001d90 <slob_free+0xc4>
c0001d54:	00c12083          	lw	ra,12(sp)
c0001d58:	00812403          	lw	s0,8(sp)
c0001d5c:	01010113          	addi	sp,sp,16
c0001d60:	00008067          	ret
c0001d64:	00758793          	addi	a5,a1,7
c0001d68:	0037d793          	srli	a5,a5,0x3
c0001d6c:	00f52023          	sw	a5,0(a0)
c0001d70:	00050413          	mv	s0,a0
c0001d74:	100027f3          	csrr	a5,sstatus
c0001d78:	0027f793          	andi	a5,a5,2
c0001d7c:	00000613          	li	a2,0
c0001d80:	f6078ae3          	beqz	a5,c0001cf4 <slob_free+0x28>
c0001d84:	a35fe0ef          	jal	ra,c00007b8 <intr_disable>
c0001d88:	00100613          	li	a2,1
c0001d8c:	f69ff06f          	j	c0001cf4 <slob_free+0x28>
c0001d90:	00c12083          	lw	ra,12(sp)
c0001d94:	00812403          	lw	s0,8(sp)
c0001d98:	01010113          	addi	sp,sp,16
c0001d9c:	a15fe06f          	j	c00007b0 <intr_enable>
c0001da0:	00042703          	lw	a4,0(s0)
c0001da4:	00442583          	lw	a1,4(s0)
c0001da8:	00d706b3          	add	a3,a4,a3
c0001dac:	00d7a023          	sw	a3,0(a5)
c0001db0:	00b7a223          	sw	a1,4(a5)
c0001db4:	f95ff06f          	j	c0001d48 <slob_free+0x7c>
c0001db8:	00072683          	lw	a3,0(a4)
c0001dbc:	00472703          	lw	a4,4(a4)
c0001dc0:	00b685b3          	add	a1,a3,a1
c0001dc4:	00b42023          	sw	a1,0(s0)
c0001dc8:	00e42223          	sw	a4,4(s0)
c0001dcc:	f69ff06f          	j	c0001d34 <slob_free+0x68>

c0001dd0 <__slob_get_free_pages.isra.0>:
c0001dd0:	00100793          	li	a5,1
c0001dd4:	ff010113          	addi	sp,sp,-16
c0001dd8:	00a79533          	sll	a0,a5,a0
c0001ddc:	00112623          	sw	ra,12(sp)
c0001de0:	511010ef          	jal	ra,c0003af0 <alloc_pages>
c0001de4:	04050a63          	beqz	a0,c0001e38 <__slob_get_free_pages.isra.0+0x68>
c0001de8:	00012697          	auipc	a3,0x12
c0001dec:	7606a683          	lw	a3,1888(a3) # c0014548 <pages>
c0001df0:	40d506b3          	sub	a3,a0,a3
c0001df4:	4056d693          	srai	a3,a3,0x5
c0001df8:	00009517          	auipc	a0,0x9
c0001dfc:	23452503          	lw	a0,564(a0) # c000b02c <nbase>
c0001e00:	001007b7          	lui	a5,0x100
c0001e04:	00a686b3          	add	a3,a3,a0
c0001e08:	fff78793          	addi	a5,a5,-1 # fffff <BASE_ADDRESS-0xbff00001>
c0001e0c:	00f6f7b3          	and	a5,a3,a5
c0001e10:	00012717          	auipc	a4,0x12
c0001e14:	65c72703          	lw	a4,1628(a4) # c001446c <npage>
c0001e18:	00c69693          	slli	a3,a3,0xc
c0001e1c:	02e7f263          	bleu	a4,a5,c0001e40 <__slob_get_free_pages.isra.0+0x70>
c0001e20:	00012517          	auipc	a0,0x12
c0001e24:	72052503          	lw	a0,1824(a0) # c0014540 <va_pa_offset>
c0001e28:	00a68533          	add	a0,a3,a0
c0001e2c:	00c12083          	lw	ra,12(sp)
c0001e30:	01010113          	addi	sp,sp,16
c0001e34:	00008067          	ret
c0001e38:	00000513          	li	a0,0
c0001e3c:	ff1ff06f          	j	c0001e2c <__slob_get_free_pages.isra.0+0x5c>
c0001e40:	00005617          	auipc	a2,0x5
c0001e44:	3e860613          	addi	a2,a2,1000 # c0007228 <commands+0xc84>
c0001e48:	06900593          	li	a1,105
c0001e4c:	00005517          	auipc	a0,0x5
c0001e50:	19450513          	addi	a0,a0,404 # c0006fe0 <commands+0xa3c>
c0001e54:	bf8fe0ef          	jal	ra,c000024c <__panic>

c0001e58 <slob_alloc.isra.1.constprop.3>:
c0001e58:	fd010113          	addi	sp,sp,-48
c0001e5c:	02112623          	sw	ra,44(sp)
c0001e60:	02812423          	sw	s0,40(sp)
c0001e64:	02912223          	sw	s1,36(sp)
c0001e68:	03212023          	sw	s2,32(sp)
c0001e6c:	01312e23          	sw	s3,28(sp)
c0001e70:	00850713          	addi	a4,a0,8
c0001e74:	000017b7          	lui	a5,0x1
c0001e78:	14f77e63          	bleu	a5,a4,c0001fd4 <slob_alloc.isra.1.constprop.3+0x17c>
c0001e7c:	00750493          	addi	s1,a0,7
c0001e80:	0034d413          	srli	s0,s1,0x3
c0001e84:	10002673          	csrr	a2,sstatus
c0001e88:	00267613          	andi	a2,a2,2
c0001e8c:	0e061e63          	bnez	a2,c0001f88 <slob_alloc.isra.1.constprop.3+0x130>
c0001e90:	00009697          	auipc	a3,0x9
c0001e94:	1986a683          	lw	a3,408(a3) # c000b028 <slobfree>
c0001e98:	0046a783          	lw	a5,4(a3)
c0001e9c:	0007a703          	lw	a4,0(a5) # 1000 <BASE_ADDRESS-0xbffff000>
c0001ea0:	12875463          	ble	s0,a4,c0001fc8 <slob_alloc.isra.1.constprop.3+0x170>
c0001ea4:	00001937          	lui	s2,0x1
c0001ea8:	00100993          	li	s3,1
c0001eac:	00f68c63          	beq	a3,a5,c0001ec4 <slob_alloc.isra.1.constprop.3+0x6c>
c0001eb0:	0047a503          	lw	a0,4(a5)
c0001eb4:	00052703          	lw	a4,0(a0)
c0001eb8:	04875463          	ble	s0,a4,c0001f00 <slob_alloc.isra.1.constprop.3+0xa8>
c0001ebc:	00050793          	mv	a5,a0
c0001ec0:	fef698e3          	bne	a3,a5,c0001eb0 <slob_alloc.isra.1.constprop.3+0x58>
c0001ec4:	08061463          	bnez	a2,c0001f4c <slob_alloc.isra.1.constprop.3+0xf4>
c0001ec8:	00000513          	li	a0,0
c0001ecc:	f05ff0ef          	jal	ra,c0001dd0 <__slob_get_free_pages.isra.0>
c0001ed0:	08050663          	beqz	a0,c0001f5c <slob_alloc.isra.1.constprop.3+0x104>
c0001ed4:	00090593          	mv	a1,s2
c0001ed8:	df5ff0ef          	jal	ra,c0001ccc <slob_free>
c0001edc:	10002673          	csrr	a2,sstatus
c0001ee0:	00267613          	andi	a2,a2,2
c0001ee4:	08061c63          	bnez	a2,c0001f7c <slob_alloc.isra.1.constprop.3+0x124>
c0001ee8:	00009697          	auipc	a3,0x9
c0001eec:	1406a683          	lw	a3,320(a3) # c000b028 <slobfree>
c0001ef0:	00068793          	mv	a5,a3
c0001ef4:	0047a503          	lw	a0,4(a5)
c0001ef8:	00052703          	lw	a4,0(a0)
c0001efc:	fc8740e3          	blt	a4,s0,c0001ebc <slob_alloc.isra.1.constprop.3+0x64>
c0001f00:	0ae40e63          	beq	s0,a4,c0001fbc <slob_alloc.isra.1.constprop.3+0x164>
c0001f04:	ff84f693          	andi	a3,s1,-8
c0001f08:	00d506b3          	add	a3,a0,a3
c0001f0c:	00d7a223          	sw	a3,4(a5)
c0001f10:	00452583          	lw	a1,4(a0)
c0001f14:	40870733          	sub	a4,a4,s0
c0001f18:	00e6a023          	sw	a4,0(a3)
c0001f1c:	00b6a223          	sw	a1,4(a3)
c0001f20:	00852023          	sw	s0,0(a0)
c0001f24:	00009297          	auipc	t0,0x9
c0001f28:	10f2a223          	sw	a5,260(t0) # c000b028 <slobfree>
c0001f2c:	06061463          	bnez	a2,c0001f94 <slob_alloc.isra.1.constprop.3+0x13c>
c0001f30:	02c12083          	lw	ra,44(sp)
c0001f34:	02812403          	lw	s0,40(sp)
c0001f38:	02412483          	lw	s1,36(sp)
c0001f3c:	02012903          	lw	s2,32(sp)
c0001f40:	01c12983          	lw	s3,28(sp)
c0001f44:	03010113          	addi	sp,sp,48
c0001f48:	00008067          	ret
c0001f4c:	865fe0ef          	jal	ra,c00007b0 <intr_enable>
c0001f50:	00000513          	li	a0,0
c0001f54:	e7dff0ef          	jal	ra,c0001dd0 <__slob_get_free_pages.isra.0>
c0001f58:	f6051ee3          	bnez	a0,c0001ed4 <slob_alloc.isra.1.constprop.3+0x7c>
c0001f5c:	02c12083          	lw	ra,44(sp)
c0001f60:	00000513          	li	a0,0
c0001f64:	02812403          	lw	s0,40(sp)
c0001f68:	02412483          	lw	s1,36(sp)
c0001f6c:	02012903          	lw	s2,32(sp)
c0001f70:	01c12983          	lw	s3,28(sp)
c0001f74:	03010113          	addi	sp,sp,48
c0001f78:	00008067          	ret
c0001f7c:	83dfe0ef          	jal	ra,c00007b8 <intr_disable>
c0001f80:	00098613          	mv	a2,s3
c0001f84:	f65ff06f          	j	c0001ee8 <slob_alloc.isra.1.constprop.3+0x90>
c0001f88:	831fe0ef          	jal	ra,c00007b8 <intr_disable>
c0001f8c:	00100613          	li	a2,1
c0001f90:	f01ff06f          	j	c0001e90 <slob_alloc.isra.1.constprop.3+0x38>
c0001f94:	00a12623          	sw	a0,12(sp)
c0001f98:	819fe0ef          	jal	ra,c00007b0 <intr_enable>
c0001f9c:	02c12083          	lw	ra,44(sp)
c0001fa0:	00c12503          	lw	a0,12(sp)
c0001fa4:	02812403          	lw	s0,40(sp)
c0001fa8:	02412483          	lw	s1,36(sp)
c0001fac:	02012903          	lw	s2,32(sp)
c0001fb0:	01c12983          	lw	s3,28(sp)
c0001fb4:	03010113          	addi	sp,sp,48
c0001fb8:	00008067          	ret
c0001fbc:	00452703          	lw	a4,4(a0)
c0001fc0:	00e7a223          	sw	a4,4(a5)
c0001fc4:	f61ff06f          	j	c0001f24 <slob_alloc.isra.1.constprop.3+0xcc>
c0001fc8:	00078513          	mv	a0,a5
c0001fcc:	00068793          	mv	a5,a3
c0001fd0:	f31ff06f          	j	c0001f00 <slob_alloc.isra.1.constprop.3+0xa8>
c0001fd4:	00005697          	auipc	a3,0x5
c0001fd8:	2b868693          	addi	a3,a3,696 # c000728c <commands+0xce8>
c0001fdc:	00005617          	auipc	a2,0x5
c0001fe0:	ce860613          	addi	a2,a2,-792 # c0006cc4 <commands+0x720>
c0001fe4:	06300593          	li	a1,99
c0001fe8:	00005517          	auipc	a0,0x5
c0001fec:	2c450513          	addi	a0,a0,708 # c00072ac <commands+0xd08>
c0001ff0:	a5cfe0ef          	jal	ra,c000024c <__panic>

c0001ff4 <kmalloc_init>:
c0001ff4:	ff010113          	addi	sp,sp,-16
c0001ff8:	00005517          	auipc	a0,0x5
c0001ffc:	2c850513          	addi	a0,a0,712 # c00072c0 <commands+0xd1c>
c0002000:	00112623          	sw	ra,12(sp)
c0002004:	8d4fe0ef          	jal	ra,c00000d8 <cprintf>
c0002008:	00c12083          	lw	ra,12(sp)
c000200c:	00005517          	auipc	a0,0x5
c0002010:	26450513          	addi	a0,a0,612 # c0007270 <commands+0xccc>
c0002014:	01010113          	addi	sp,sp,16
c0002018:	8c0fe06f          	j	c00000d8 <cprintf>

c000201c <kmalloc>:
c000201c:	ff010113          	addi	sp,sp,-16
c0002020:	00912223          	sw	s1,4(sp)
c0002024:	000014b7          	lui	s1,0x1
c0002028:	00812423          	sw	s0,8(sp)
c000202c:	00112623          	sw	ra,12(sp)
c0002030:	01212023          	sw	s2,0(sp)
c0002034:	ff748793          	addi	a5,s1,-9 # ff7 <BASE_ADDRESS-0xbffff009>
c0002038:	00050413          	mv	s0,a0
c000203c:	02a7e863          	bltu	a5,a0,c000206c <kmalloc+0x50>
c0002040:	00850513          	addi	a0,a0,8
c0002044:	e15ff0ef          	jal	ra,c0001e58 <slob_alloc.isra.1.constprop.3>
c0002048:	00850413          	addi	s0,a0,8
c000204c:	0c050c63          	beqz	a0,c0002124 <kmalloc+0x108>
c0002050:	00c12083          	lw	ra,12(sp)
c0002054:	00040513          	mv	a0,s0
c0002058:	00412483          	lw	s1,4(sp)
c000205c:	00812403          	lw	s0,8(sp)
c0002060:	00012903          	lw	s2,0(sp)
c0002064:	01010113          	addi	sp,sp,16
c0002068:	00008067          	ret
c000206c:	00c00513          	li	a0,12
c0002070:	de9ff0ef          	jal	ra,c0001e58 <slob_alloc.isra.1.constprop.3>
c0002074:	00050913          	mv	s2,a0
c0002078:	0a050663          	beqz	a0,c0002124 <kmalloc+0x108>
c000207c:	00040793          	mv	a5,s0
c0002080:	00000513          	li	a0,0
c0002084:	0084da63          	ble	s0,s1,c0002098 <kmalloc+0x7c>
c0002088:	00048713          	mv	a4,s1
c000208c:	4017d793          	srai	a5,a5,0x1
c0002090:	00150513          	addi	a0,a0,1
c0002094:	fef74ce3          	blt	a4,a5,c000208c <kmalloc+0x70>
c0002098:	00a92023          	sw	a0,0(s2) # 1000 <BASE_ADDRESS-0xbffff000>
c000209c:	d35ff0ef          	jal	ra,c0001dd0 <__slob_get_free_pages.isra.0>
c00020a0:	00a92223          	sw	a0,4(s2)
c00020a4:	00050413          	mv	s0,a0
c00020a8:	08050263          	beqz	a0,c000212c <kmalloc+0x110>
c00020ac:	100027f3          	csrr	a5,sstatus
c00020b0:	0027f793          	andi	a5,a5,2
c00020b4:	02079a63          	bnez	a5,c00020e8 <kmalloc+0xcc>
c00020b8:	00c12083          	lw	ra,12(sp)
c00020bc:	00012797          	auipc	a5,0x12
c00020c0:	3a07a783          	lw	a5,928(a5) # c001445c <bigblocks>
c00020c4:	00040513          	mv	a0,s0
c00020c8:	00f92423          	sw	a5,8(s2)
c00020cc:	00012297          	auipc	t0,0x12
c00020d0:	3922a823          	sw	s2,912(t0) # c001445c <bigblocks>
c00020d4:	00812403          	lw	s0,8(sp)
c00020d8:	00412483          	lw	s1,4(sp)
c00020dc:	00012903          	lw	s2,0(sp)
c00020e0:	01010113          	addi	sp,sp,16
c00020e4:	00008067          	ret
c00020e8:	ed0fe0ef          	jal	ra,c00007b8 <intr_disable>
c00020ec:	00012797          	auipc	a5,0x12
c00020f0:	3707a783          	lw	a5,880(a5) # c001445c <bigblocks>
c00020f4:	00f92423          	sw	a5,8(s2)
c00020f8:	00012297          	auipc	t0,0x12
c00020fc:	3722a223          	sw	s2,868(t0) # c001445c <bigblocks>
c0002100:	eb0fe0ef          	jal	ra,c00007b0 <intr_enable>
c0002104:	00c12083          	lw	ra,12(sp)
c0002108:	00492403          	lw	s0,4(s2)
c000210c:	00412483          	lw	s1,4(sp)
c0002110:	00012903          	lw	s2,0(sp)
c0002114:	00040513          	mv	a0,s0
c0002118:	00812403          	lw	s0,8(sp)
c000211c:	01010113          	addi	sp,sp,16
c0002120:	00008067          	ret
c0002124:	00000413          	li	s0,0
c0002128:	f29ff06f          	j	c0002050 <kmalloc+0x34>
c000212c:	00c00593          	li	a1,12
c0002130:	00090513          	mv	a0,s2
c0002134:	b99ff0ef          	jal	ra,c0001ccc <slob_free>
c0002138:	f19ff06f          	j	c0002050 <kmalloc+0x34>

c000213c <kfree>:
c000213c:	12050c63          	beqz	a0,c0002274 <kfree+0x138>
c0002140:	ff010113          	addi	sp,sp,-16
c0002144:	00912223          	sw	s1,4(sp)
c0002148:	00112623          	sw	ra,12(sp)
c000214c:	00812423          	sw	s0,8(sp)
c0002150:	01451793          	slli	a5,a0,0x14
c0002154:	00050493          	mv	s1,a0
c0002158:	04079263          	bnez	a5,c000219c <kfree+0x60>
c000215c:	100027f3          	csrr	a5,sstatus
c0002160:	0027f793          	andi	a5,a5,2
c0002164:	0c079663          	bnez	a5,c0002230 <kfree+0xf4>
c0002168:	00012797          	auipc	a5,0x12
c000216c:	2f47a783          	lw	a5,756(a5) # c001445c <bigblocks>
c0002170:	02078663          	beqz	a5,c000219c <kfree+0x60>
c0002174:	0047a703          	lw	a4,4(a5)
c0002178:	10e50063          	beq	a0,a4,c0002278 <kfree+0x13c>
c000217c:	00000693          	li	a3,0
c0002180:	0100006f          	j	c0002190 <kfree+0x54>
c0002184:	00442703          	lw	a4,4(s0)
c0002188:	02e48863          	beq	s1,a4,c00021b8 <kfree+0x7c>
c000218c:	00040793          	mv	a5,s0
c0002190:	0087a403          	lw	s0,8(a5)
c0002194:	fe0418e3          	bnez	s0,c0002184 <kfree+0x48>
c0002198:	0c069a63          	bnez	a3,c000226c <kfree+0x130>
c000219c:	ff848513          	addi	a0,s1,-8
c00021a0:	00c12083          	lw	ra,12(sp)
c00021a4:	00812403          	lw	s0,8(sp)
c00021a8:	00412483          	lw	s1,4(sp)
c00021ac:	00000593          	li	a1,0
c00021b0:	01010113          	addi	sp,sp,16
c00021b4:	b19ff06f          	j	c0001ccc <slob_free>
c00021b8:	00842703          	lw	a4,8(s0)
c00021bc:	00e7a423          	sw	a4,8(a5)
c00021c0:	0a069263          	bnez	a3,c0002264 <kfree+0x128>
c00021c4:	c00007b7          	lui	a5,0xc0000
c00021c8:	00042703          	lw	a4,0(s0)
c00021cc:	0cf4e263          	bltu	s1,a5,c0002290 <kfree+0x154>
c00021d0:	00012697          	auipc	a3,0x12
c00021d4:	3706a683          	lw	a3,880(a3) # c0014540 <va_pa_offset>
c00021d8:	40d484b3          	sub	s1,s1,a3
c00021dc:	00c4d493          	srli	s1,s1,0xc
c00021e0:	00012797          	auipc	a5,0x12
c00021e4:	28c7a783          	lw	a5,652(a5) # c001446c <npage>
c00021e8:	0cf4f263          	bleu	a5,s1,c00022ac <kfree+0x170>
c00021ec:	00009517          	auipc	a0,0x9
c00021f0:	e4052503          	lw	a0,-448(a0) # c000b02c <nbase>
c00021f4:	40a484b3          	sub	s1,s1,a0
c00021f8:	00549493          	slli	s1,s1,0x5
c00021fc:	00012517          	auipc	a0,0x12
c0002200:	34c52503          	lw	a0,844(a0) # c0014548 <pages>
c0002204:	00100593          	li	a1,1
c0002208:	00950533          	add	a0,a0,s1
c000220c:	00e595b3          	sll	a1,a1,a4
c0002210:	195010ef          	jal	ra,c0003ba4 <free_pages>
c0002214:	00040513          	mv	a0,s0
c0002218:	00c12083          	lw	ra,12(sp)
c000221c:	00812403          	lw	s0,8(sp)
c0002220:	00412483          	lw	s1,4(sp)
c0002224:	00c00593          	li	a1,12
c0002228:	01010113          	addi	sp,sp,16
c000222c:	aa1ff06f          	j	c0001ccc <slob_free>
c0002230:	d88fe0ef          	jal	ra,c00007b8 <intr_disable>
c0002234:	00012797          	auipc	a5,0x12
c0002238:	2287a783          	lw	a5,552(a5) # c001445c <bigblocks>
c000223c:	02078863          	beqz	a5,c000226c <kfree+0x130>
c0002240:	0047a703          	lw	a4,4(a5)
c0002244:	00e48663          	beq	s1,a4,c0002250 <kfree+0x114>
c0002248:	00100693          	li	a3,1
c000224c:	f45ff06f          	j	c0002190 <kfree+0x54>
c0002250:	0087a703          	lw	a4,8(a5)
c0002254:	00078413          	mv	s0,a5
c0002258:	00012797          	auipc	a5,0x12
c000225c:	20478793          	addi	a5,a5,516 # c001445c <bigblocks>
c0002260:	00e7a023          	sw	a4,0(a5)
c0002264:	d4cfe0ef          	jal	ra,c00007b0 <intr_enable>
c0002268:	f5dff06f          	j	c00021c4 <kfree+0x88>
c000226c:	d44fe0ef          	jal	ra,c00007b0 <intr_enable>
c0002270:	f2dff06f          	j	c000219c <kfree+0x60>
c0002274:	00008067          	ret
c0002278:	0087a703          	lw	a4,8(a5)
c000227c:	00078413          	mv	s0,a5
c0002280:	00012797          	auipc	a5,0x12
c0002284:	1dc78793          	addi	a5,a5,476 # c001445c <bigblocks>
c0002288:	00e7a023          	sw	a4,0(a5)
c000228c:	f39ff06f          	j	c00021c4 <kfree+0x88>
c0002290:	00048693          	mv	a3,s1
c0002294:	00005617          	auipc	a2,0x5
c0002298:	fb860613          	addi	a2,a2,-72 # c000724c <commands+0xca8>
c000229c:	06e00593          	li	a1,110
c00022a0:	00005517          	auipc	a0,0x5
c00022a4:	d4050513          	addi	a0,a0,-704 # c0006fe0 <commands+0xa3c>
c00022a8:	fa5fd0ef          	jal	ra,c000024c <__panic>
c00022ac:	00005617          	auipc	a2,0x5
c00022b0:	d1460613          	addi	a2,a2,-748 # c0006fc0 <commands+0xa1c>
c00022b4:	06200593          	li	a1,98
c00022b8:	00005517          	auipc	a0,0x5
c00022bc:	d2850513          	addi	a0,a0,-728 # c0006fe0 <commands+0xa3c>
c00022c0:	f8dfd0ef          	jal	ra,c000024c <__panic>

c00022c4 <swap_init>:
c00022c4:	fb010113          	addi	sp,sp,-80
c00022c8:	04112623          	sw	ra,76(sp)
c00022cc:	04812423          	sw	s0,72(sp)
c00022d0:	04912223          	sw	s1,68(sp)
c00022d4:	05212023          	sw	s2,64(sp)
c00022d8:	03312e23          	sw	s3,60(sp)
c00022dc:	03412c23          	sw	s4,56(sp)
c00022e0:	03512a23          	sw	s5,52(sp)
c00022e4:	03612823          	sw	s6,48(sp)
c00022e8:	03712623          	sw	s7,44(sp)
c00022ec:	03812423          	sw	s8,40(sp)
c00022f0:	03912223          	sw	s9,36(sp)
c00022f4:	03a12023          	sw	s10,32(sp)
c00022f8:	01b12e23          	sw	s11,28(sp)
c00022fc:	6f9020ef          	jal	ra,c00051f4 <swapfs_init>
c0002300:	00012697          	auipc	a3,0x12
c0002304:	2086a683          	lw	a3,520(a3) # c0014508 <max_swap_offset>
c0002308:	010007b7          	lui	a5,0x1000
c000230c:	ff968713          	addi	a4,a3,-7
c0002310:	ff878793          	addi	a5,a5,-8 # fffff8 <BASE_ADDRESS-0xbf000008>
c0002314:	58e7ec63          	bltu	a5,a4,c00028ac <swap_init+0x5e8>
c0002318:	00009797          	auipc	a5,0x9
c000231c:	ce878793          	addi	a5,a5,-792 # c000b000 <swap_manager_fifo>
c0002320:	00012297          	auipc	t0,0x12
c0002324:	14f2a023          	sw	a5,320(t0) # c0014460 <sm>
c0002328:	00009797          	auipc	a5,0x9
c000232c:	cdc7a783          	lw	a5,-804(a5) # c000b004 <swap_manager_fifo+0x4>
c0002330:	000780e7          	jalr	a5
c0002334:	00050a13          	mv	s4,a0
c0002338:	04050263          	beqz	a0,c000237c <swap_init+0xb8>
c000233c:	04c12083          	lw	ra,76(sp)
c0002340:	000a0513          	mv	a0,s4
c0002344:	04812403          	lw	s0,72(sp)
c0002348:	04412483          	lw	s1,68(sp)
c000234c:	04012903          	lw	s2,64(sp)
c0002350:	03c12983          	lw	s3,60(sp)
c0002354:	03812a03          	lw	s4,56(sp)
c0002358:	03412a83          	lw	s5,52(sp)
c000235c:	03012b03          	lw	s6,48(sp)
c0002360:	02c12b83          	lw	s7,44(sp)
c0002364:	02812c03          	lw	s8,40(sp)
c0002368:	02412c83          	lw	s9,36(sp)
c000236c:	02012d03          	lw	s10,32(sp)
c0002370:	01c12d83          	lw	s11,28(sp)
c0002374:	05010113          	addi	sp,sp,80
c0002378:	00008067          	ret
c000237c:	00012797          	auipc	a5,0x12
c0002380:	0e47a783          	lw	a5,228(a5) # c0014460 <sm>
c0002384:	0007a583          	lw	a1,0(a5)
c0002388:	00005517          	auipc	a0,0x5
c000238c:	fc850513          	addi	a0,a0,-56 # c0007350 <commands+0xdac>
c0002390:	00100793          	li	a5,1
c0002394:	00012297          	auipc	t0,0x12
c0002398:	0cf2a823          	sw	a5,208(t0) # c0014464 <swap_init_ok>
c000239c:	d3dfd0ef          	jal	ra,c00000d8 <cprintf>
c00023a0:	00012497          	auipc	s1,0x12
c00023a4:	19048493          	addi	s1,s1,400 # c0014530 <free_area>
c00023a8:	00012797          	auipc	a5,0x12
c00023ac:	18c7a783          	lw	a5,396(a5) # c0014534 <free_area+0x4>
c00023b0:	38978e63          	beq	a5,s1,c000274c <swap_init+0x488>
c00023b4:	ff87a703          	lw	a4,-8(a5)
c00023b8:	00175713          	srli	a4,a4,0x1
c00023bc:	00177713          	andi	a4,a4,1
c00023c0:	38070e63          	beqz	a4,c000275c <swap_init+0x498>
c00023c4:	00000413          	li	s0,0
c00023c8:	00000d13          	li	s10,0
c00023cc:	0100006f          	j	c00023dc <swap_init+0x118>
c00023d0:	ff87a703          	lw	a4,-8(a5)
c00023d4:	00277713          	andi	a4,a4,2
c00023d8:	38070263          	beqz	a4,c000275c <swap_init+0x498>
c00023dc:	ffc7a703          	lw	a4,-4(a5)
c00023e0:	0047a783          	lw	a5,4(a5)
c00023e4:	001d0d13          	addi	s10,s10,1
c00023e8:	00e40433          	add	s0,s0,a4
c00023ec:	00040913          	mv	s2,s0
c00023f0:	fe9790e3          	bne	a5,s1,c00023d0 <swap_init+0x10c>
c00023f4:	015010ef          	jal	ra,c0003c08 <nr_free_pages>
c00023f8:	48a91a63          	bne	s2,a0,c000288c <swap_init+0x5c8>
c00023fc:	00040613          	mv	a2,s0
c0002400:	000d0593          	mv	a1,s10
c0002404:	00005517          	auipc	a0,0x5
c0002408:	f8c50513          	addi	a0,a0,-116 # c0007390 <commands+0xdec>
c000240c:	ccdfd0ef          	jal	ra,c00000d8 <cprintf>
c0002410:	a99fe0ef          	jal	ra,c0000ea8 <mm_create>
c0002414:	00050a93          	mv	s5,a0
c0002418:	40050a63          	beqz	a0,c000282c <swap_init+0x568>
c000241c:	00012797          	auipc	a5,0x12
c0002420:	06c7a783          	lw	a5,108(a5) # c0014488 <check_mm_struct>
c0002424:	44079463          	bnez	a5,c000286c <swap_init+0x5a8>
c0002428:	00012b17          	auipc	s6,0x12
c000242c:	040b2b03          	lw	s6,64(s6) # c0014468 <boot_pgdir>
c0002430:	000b2783          	lw	a5,0(s6)
c0002434:	00012717          	auipc	a4,0x12
c0002438:	05470713          	addi	a4,a4,84 # c0014488 <check_mm_struct>
c000243c:	00a72023          	sw	a0,0(a4)
c0002440:	01652623          	sw	s6,12(a0)
c0002444:	60079063          	bnez	a5,c0002a44 <swap_init+0x780>
c0002448:	000065b7          	lui	a1,0x6
c000244c:	00300613          	li	a2,3
c0002450:	00001537          	lui	a0,0x1
c0002454:	ac1fe0ef          	jal	ra,c0000f14 <vma_create>
c0002458:	00050593          	mv	a1,a0
c000245c:	3e050863          	beqz	a0,c000284c <swap_init+0x588>
c0002460:	000a8513          	mv	a0,s5
c0002464:	b61fe0ef          	jal	ra,c0000fc4 <insert_vma_struct>
c0002468:	00005517          	auipc	a0,0x5
c000246c:	f6850513          	addi	a0,a0,-152 # c00073d0 <commands+0xe2c>
c0002470:	c69fd0ef          	jal	ra,c00000d8 <cprintf>
c0002474:	00caa503          	lw	a0,12(s5)
c0002478:	00100613          	li	a2,1
c000247c:	000015b7          	lui	a1,0x1
c0002480:	7e0010ef          	jal	ra,c0003c60 <get_pte>
c0002484:	5a050063          	beqz	a0,c0002a24 <swap_init+0x760>
c0002488:	00005517          	auipc	a0,0x5
c000248c:	f9050513          	addi	a0,a0,-112 # c0007418 <commands+0xe74>
c0002490:	00012997          	auipc	s3,0x12
c0002494:	00498993          	addi	s3,s3,4 # c0014494 <check_rp>
c0002498:	c41fd0ef          	jal	ra,c00000d8 <cprintf>
c000249c:	00012b97          	auipc	s7,0x12
c00024a0:	008b8b93          	addi	s7,s7,8 # c00144a4 <swap_in_seq_no>
c00024a4:	00098c13          	mv	s8,s3
c00024a8:	00100913          	li	s2,1
c00024ac:	00090513          	mv	a0,s2
c00024b0:	640010ef          	jal	ra,c0003af0 <alloc_pages>
c00024b4:	00ac2023          	sw	a0,0(s8)
c00024b8:	32050a63          	beqz	a0,c00027ec <swap_init+0x528>
c00024bc:	00452783          	lw	a5,4(a0)
c00024c0:	0027f793          	andi	a5,a5,2
c00024c4:	30079463          	bnez	a5,c00027cc <swap_init+0x508>
c00024c8:	004c0c13          	addi	s8,s8,4
c00024cc:	ff7c10e3          	bne	s8,s7,c00024ac <swap_init+0x1e8>
c00024d0:	00012797          	auipc	a5,0x12
c00024d4:	0607a783          	lw	a5,96(a5) # c0014530 <free_area>
c00024d8:	00f12423          	sw	a5,8(sp)
c00024dc:	00012797          	auipc	a5,0x12
c00024e0:	05c7a783          	lw	a5,92(a5) # c0014538 <free_area+0x8>
c00024e4:	00012d97          	auipc	s11,0x12
c00024e8:	050dad83          	lw	s11,80(s11) # c0014534 <free_area+0x4>
c00024ec:	00f12623          	sw	a5,12(sp)
c00024f0:	0094a223          	sw	s1,4(s1)
c00024f4:	0094a023          	sw	s1,0(s1)
c00024f8:	0004a423          	sw	zero,8(s1)
c00024fc:	00012917          	auipc	s2,0x12
c0002500:	f9890913          	addi	s2,s2,-104 # c0014494 <check_rp>
c0002504:	00100b93          	li	s7,1
c0002508:	00092503          	lw	a0,0(s2)
c000250c:	000b8593          	mv	a1,s7
c0002510:	00490913          	addi	s2,s2,4
c0002514:	690010ef          	jal	ra,c0003ba4 <free_pages>
c0002518:	ff8918e3          	bne	s2,s8,c0002508 <swap_init+0x244>
c000251c:	00012b97          	auipc	s7,0x12
c0002520:	01cbab83          	lw	s7,28(s7) # c0014538 <free_area+0x8>
c0002524:	00400793          	li	a5,4
c0002528:	4cfb9e63          	bne	s7,a5,c0002a04 <swap_init+0x740>
c000252c:	00005517          	auipc	a0,0x5
c0002530:	f6450513          	addi	a0,a0,-156 # c0007490 <commands+0xeec>
c0002534:	ba5fd0ef          	jal	ra,c00000d8 <cprintf>
c0002538:	00001637          	lui	a2,0x1
c000253c:	00012297          	auipc	t0,0x12
c0002540:	f002ae23          	sw	zero,-228(t0) # c0014458 <pgfault_num>
c0002544:	00a00593          	li	a1,10
c0002548:	00b60023          	sb	a1,0(a2) # 1000 <BASE_ADDRESS-0xbffff000>
c000254c:	00012797          	auipc	a5,0x12
c0002550:	f0c7a783          	lw	a5,-244(a5) # c0014458 <pgfault_num>
c0002554:	00100513          	li	a0,1
c0002558:	46a79663          	bne	a5,a0,c00029c4 <swap_init+0x700>
c000255c:	00b60823          	sb	a1,16(a2)
c0002560:	00012617          	auipc	a2,0x12
c0002564:	ef862603          	lw	a2,-264(a2) # c0014458 <pgfault_num>
c0002568:	46f61e63          	bne	a2,a5,c00029e4 <swap_init+0x720>
c000256c:	00002637          	lui	a2,0x2
c0002570:	00b00593          	li	a1,11
c0002574:	00b60023          	sb	a1,0(a2) # 2000 <BASE_ADDRESS-0xbfffe000>
c0002578:	00012797          	auipc	a5,0x12
c000257c:	ee07a783          	lw	a5,-288(a5) # c0014458 <pgfault_num>
c0002580:	00200513          	li	a0,2
c0002584:	3ca79063          	bne	a5,a0,c0002944 <swap_init+0x680>
c0002588:	00b60823          	sb	a1,16(a2)
c000258c:	00012617          	auipc	a2,0x12
c0002590:	ecc62603          	lw	a2,-308(a2) # c0014458 <pgfault_num>
c0002594:	3cf61863          	bne	a2,a5,c0002964 <swap_init+0x6a0>
c0002598:	00003637          	lui	a2,0x3
c000259c:	00c00593          	li	a1,12
c00025a0:	00b60023          	sb	a1,0(a2) # 3000 <BASE_ADDRESS-0xbfffd000>
c00025a4:	00012797          	auipc	a5,0x12
c00025a8:	eb47a783          	lw	a5,-332(a5) # c0014458 <pgfault_num>
c00025ac:	00300513          	li	a0,3
c00025b0:	3ca79a63          	bne	a5,a0,c0002984 <swap_init+0x6c0>
c00025b4:	00b60823          	sb	a1,16(a2)
c00025b8:	00012617          	auipc	a2,0x12
c00025bc:	ea062603          	lw	a2,-352(a2) # c0014458 <pgfault_num>
c00025c0:	3ef61263          	bne	a2,a5,c00029a4 <swap_init+0x6e0>
c00025c4:	00004637          	lui	a2,0x4
c00025c8:	00d00593          	li	a1,13
c00025cc:	00b60023          	sb	a1,0(a2) # 4000 <BASE_ADDRESS-0xbfffc000>
c00025d0:	00012797          	auipc	a5,0x12
c00025d4:	e887a783          	lw	a5,-376(a5) # c0014458 <pgfault_num>
c00025d8:	2f779663          	bne	a5,s7,c00028c4 <swap_init+0x600>
c00025dc:	00b60823          	sb	a1,16(a2)
c00025e0:	00012617          	auipc	a2,0x12
c00025e4:	e7862603          	lw	a2,-392(a2) # c0014458 <pgfault_num>
c00025e8:	2ef61e63          	bne	a2,a5,c00028e4 <swap_init+0x620>
c00025ec:	00012817          	auipc	a6,0x12
c00025f0:	f4c82803          	lw	a6,-180(a6) # c0014538 <free_area+0x8>
c00025f4:	00012797          	auipc	a5,0x12
c00025f8:	eb078793          	addi	a5,a5,-336 # c00144a4 <swap_in_seq_no>
c00025fc:	00012617          	auipc	a2,0x12
c0002600:	ed060613          	addi	a2,a2,-304 # c00144cc <swap_out_seq_no>
c0002604:	00012517          	auipc	a0,0x12
c0002608:	ec850513          	addi	a0,a0,-312 # c00144cc <swap_out_seq_no>
c000260c:	fff00593          	li	a1,-1
c0002610:	2e081a63          	bnez	a6,c0002904 <swap_init+0x640>
c0002614:	00b7a023          	sw	a1,0(a5)
c0002618:	00b62023          	sw	a1,0(a2)
c000261c:	00478793          	addi	a5,a5,4
c0002620:	00460613          	addi	a2,a2,4
c0002624:	fef518e3          	bne	a0,a5,c0002614 <swap_init+0x350>
c0002628:	00009797          	auipc	a5,0x9
c000262c:	a047a783          	lw	a5,-1532(a5) # c000b02c <nbase>
c0002630:	00001bb7          	lui	s7,0x1
c0002634:	00012c97          	auipc	s9,0x12
c0002638:	eecc8c93          	addi	s9,s9,-276 # c0014520 <check_ptep>
c000263c:	00012c17          	auipc	s8,0x12
c0002640:	e58c0c13          	addi	s8,s8,-424 # c0014494 <check_rp>
c0002644:	00f12223          	sw	a5,4(sp)
c0002648:	00000613          	li	a2,0
c000264c:	000b8593          	mv	a1,s7
c0002650:	000b0513          	mv	a0,s6
c0002654:	000ca023          	sw	zero,0(s9)
c0002658:	608010ef          	jal	ra,c0003c60 <get_pte>
c000265c:	00aca023          	sw	a0,0(s9)
c0002660:	1a050663          	beqz	a0,c000280c <swap_init+0x548>
c0002664:	00052783          	lw	a5,0(a0)
c0002668:	0017f613          	andi	a2,a5,1
c000266c:	12060863          	beqz	a2,c000279c <swap_init+0x4d8>
c0002670:	00279793          	slli	a5,a5,0x2
c0002674:	00c7d793          	srli	a5,a5,0xc
c0002678:	00012617          	auipc	a2,0x12
c000267c:	df462603          	lw	a2,-524(a2) # c001446c <npage>
c0002680:	12c7fa63          	bleu	a2,a5,c00027b4 <swap_init+0x4f0>
c0002684:	00412703          	lw	a4,4(sp)
c0002688:	000c2583          	lw	a1,0(s8)
c000268c:	00012617          	auipc	a2,0x12
c0002690:	ebc62603          	lw	a2,-324(a2) # c0014548 <pages>
c0002694:	40e787b3          	sub	a5,a5,a4
c0002698:	00579793          	slli	a5,a5,0x5
c000269c:	00f607b3          	add	a5,a2,a5
c00026a0:	0cf59e63          	bne	a1,a5,c000277c <swap_init+0x4b8>
c00026a4:	000017b7          	lui	a5,0x1
c00026a8:	00fb8bb3          	add	s7,s7,a5
c00026ac:	000057b7          	lui	a5,0x5
c00026b0:	004c8c93          	addi	s9,s9,4
c00026b4:	004c0c13          	addi	s8,s8,4
c00026b8:	f8fb98e3          	bne	s7,a5,c0002648 <swap_init+0x384>
c00026bc:	00005517          	auipc	a0,0x5
c00026c0:	ea050513          	addi	a0,a0,-352 # c000755c <commands+0xfb8>
c00026c4:	a15fd0ef          	jal	ra,c00000d8 <cprintf>
c00026c8:	00012797          	auipc	a5,0x12
c00026cc:	d987a783          	lw	a5,-616(a5) # c0014460 <sm>
c00026d0:	01c7a783          	lw	a5,28(a5)
c00026d4:	00100b13          	li	s6,1
c00026d8:	000780e7          	jalr	a5
c00026dc:	24051463          	bnez	a0,c0002924 <swap_init+0x660>
c00026e0:	0009a503          	lw	a0,0(s3)
c00026e4:	000b0593          	mv	a1,s6
c00026e8:	00498993          	addi	s3,s3,4
c00026ec:	4b8010ef          	jal	ra,c0003ba4 <free_pages>
c00026f0:	ff2998e3          	bne	s3,s2,c00026e0 <swap_init+0x41c>
c00026f4:	000a8513          	mv	a0,s5
c00026f8:	9cdfe0ef          	jal	ra,c00010c4 <mm_destroy>
c00026fc:	00c12783          	lw	a5,12(sp)
c0002700:	01b4a223          	sw	s11,4(s1)
c0002704:	00f4a423          	sw	a5,8(s1)
c0002708:	00812783          	lw	a5,8(sp)
c000270c:	00f4a023          	sw	a5,0(s1)
c0002710:	009d8c63          	beq	s11,s1,c0002728 <swap_init+0x464>
c0002714:	ffcda783          	lw	a5,-4(s11)
c0002718:	004dad83          	lw	s11,4(s11)
c000271c:	fffd0d13          	addi	s10,s10,-1
c0002720:	40f40433          	sub	s0,s0,a5
c0002724:	fe9d98e3          	bne	s11,s1,c0002714 <swap_init+0x450>
c0002728:	00040613          	mv	a2,s0
c000272c:	000d0593          	mv	a1,s10
c0002730:	00005517          	auipc	a0,0x5
c0002734:	e5c50513          	addi	a0,a0,-420 # c000758c <commands+0xfe8>
c0002738:	9a1fd0ef          	jal	ra,c00000d8 <cprintf>
c000273c:	00005517          	auipc	a0,0x5
c0002740:	e6c50513          	addi	a0,a0,-404 # c00075a8 <commands+0x1004>
c0002744:	995fd0ef          	jal	ra,c00000d8 <cprintf>
c0002748:	bf5ff06f          	j	c000233c <swap_init+0x78>
c000274c:	00000413          	li	s0,0
c0002750:	00000d13          	li	s10,0
c0002754:	00000913          	li	s2,0
c0002758:	c9dff06f          	j	c00023f4 <swap_init+0x130>
c000275c:	00005697          	auipc	a3,0x5
c0002760:	c0868693          	addi	a3,a3,-1016 # c0007364 <commands+0xdc0>
c0002764:	00004617          	auipc	a2,0x4
c0002768:	56060613          	addi	a2,a2,1376 # c0006cc4 <commands+0x720>
c000276c:	0bd00593          	li	a1,189
c0002770:	00005517          	auipc	a0,0x5
c0002774:	bd050513          	addi	a0,a0,-1072 # c0007340 <commands+0xd9c>
c0002778:	ad5fd0ef          	jal	ra,c000024c <__panic>
c000277c:	00005697          	auipc	a3,0x5
c0002780:	db868693          	addi	a3,a3,-584 # c0007534 <commands+0xf90>
c0002784:	00004617          	auipc	a2,0x4
c0002788:	54060613          	addi	a2,a2,1344 # c0006cc4 <commands+0x720>
c000278c:	0fd00593          	li	a1,253
c0002790:	00005517          	auipc	a0,0x5
c0002794:	bb050513          	addi	a0,a0,-1104 # c0007340 <commands+0xd9c>
c0002798:	ab5fd0ef          	jal	ra,c000024c <__panic>
c000279c:	00005617          	auipc	a2,0x5
c00027a0:	d7460613          	addi	a2,a2,-652 # c0007510 <commands+0xf6c>
c00027a4:	07400593          	li	a1,116
c00027a8:	00005517          	auipc	a0,0x5
c00027ac:	83850513          	addi	a0,a0,-1992 # c0006fe0 <commands+0xa3c>
c00027b0:	a9dfd0ef          	jal	ra,c000024c <__panic>
c00027b4:	00005617          	auipc	a2,0x5
c00027b8:	80c60613          	addi	a2,a2,-2036 # c0006fc0 <commands+0xa1c>
c00027bc:	06200593          	li	a1,98
c00027c0:	00005517          	auipc	a0,0x5
c00027c4:	82050513          	addi	a0,a0,-2016 # c0006fe0 <commands+0xa3c>
c00027c8:	a85fd0ef          	jal	ra,c000024c <__panic>
c00027cc:	00005697          	auipc	a3,0x5
c00027d0:	c8468693          	addi	a3,a3,-892 # c0007450 <commands+0xeac>
c00027d4:	00004617          	auipc	a2,0x4
c00027d8:	4f060613          	addi	a2,a2,1264 # c0006cc4 <commands+0x720>
c00027dc:	0de00593          	li	a1,222
c00027e0:	00005517          	auipc	a0,0x5
c00027e4:	b6050513          	addi	a0,a0,-1184 # c0007340 <commands+0xd9c>
c00027e8:	a65fd0ef          	jal	ra,c000024c <__panic>
c00027ec:	00005697          	auipc	a3,0x5
c00027f0:	c5068693          	addi	a3,a3,-944 # c000743c <commands+0xe98>
c00027f4:	00004617          	auipc	a2,0x4
c00027f8:	4d060613          	addi	a2,a2,1232 # c0006cc4 <commands+0x720>
c00027fc:	0dd00593          	li	a1,221
c0002800:	00005517          	auipc	a0,0x5
c0002804:	b4050513          	addi	a0,a0,-1216 # c0007340 <commands+0xd9c>
c0002808:	a45fd0ef          	jal	ra,c000024c <__panic>
c000280c:	00005697          	auipc	a3,0x5
c0002810:	cec68693          	addi	a3,a3,-788 # c00074f8 <commands+0xf54>
c0002814:	00004617          	auipc	a2,0x4
c0002818:	4b060613          	addi	a2,a2,1200 # c0006cc4 <commands+0x720>
c000281c:	0fc00593          	li	a1,252
c0002820:	00005517          	auipc	a0,0x5
c0002824:	b2050513          	addi	a0,a0,-1248 # c0007340 <commands+0xd9c>
c0002828:	a25fd0ef          	jal	ra,c000024c <__panic>
c000282c:	00004697          	auipc	a3,0x4
c0002830:	5dc68693          	addi	a3,a3,1500 # c0006e08 <commands+0x864>
c0002834:	00004617          	auipc	a2,0x4
c0002838:	49060613          	addi	a2,a2,1168 # c0006cc4 <commands+0x720>
c000283c:	0c500593          	li	a1,197
c0002840:	00005517          	auipc	a0,0x5
c0002844:	b0050513          	addi	a0,a0,-1280 # c0007340 <commands+0xd9c>
c0002848:	a05fd0ef          	jal	ra,c000024c <__panic>
c000284c:	00005697          	auipc	a3,0x5
c0002850:	80068693          	addi	a3,a3,-2048 # c000704c <commands+0xaa8>
c0002854:	00004617          	auipc	a2,0x4
c0002858:	47060613          	addi	a2,a2,1136 # c0006cc4 <commands+0x720>
c000285c:	0d000593          	li	a1,208
c0002860:	00005517          	auipc	a0,0x5
c0002864:	ae050513          	addi	a0,a0,-1312 # c0007340 <commands+0xd9c>
c0002868:	9e5fd0ef          	jal	ra,c000024c <__panic>
c000286c:	00005697          	auipc	a3,0x5
c0002870:	b4c68693          	addi	a3,a3,-1204 # c00073b8 <commands+0xe14>
c0002874:	00004617          	auipc	a2,0x4
c0002878:	45060613          	addi	a2,a2,1104 # c0006cc4 <commands+0x720>
c000287c:	0c800593          	li	a1,200
c0002880:	00005517          	auipc	a0,0x5
c0002884:	ac050513          	addi	a0,a0,-1344 # c0007340 <commands+0xd9c>
c0002888:	9c5fd0ef          	jal	ra,c000024c <__panic>
c000288c:	00005697          	auipc	a3,0x5
c0002890:	ae868693          	addi	a3,a3,-1304 # c0007374 <commands+0xdd0>
c0002894:	00004617          	auipc	a2,0x4
c0002898:	43060613          	addi	a2,a2,1072 # c0006cc4 <commands+0x720>
c000289c:	0c000593          	li	a1,192
c00028a0:	00005517          	auipc	a0,0x5
c00028a4:	aa050513          	addi	a0,a0,-1376 # c0007340 <commands+0xd9c>
c00028a8:	9a5fd0ef          	jal	ra,c000024c <__panic>
c00028ac:	00005617          	auipc	a2,0x5
c00028b0:	a7860613          	addi	a2,a2,-1416 # c0007324 <commands+0xd80>
c00028b4:	02a00593          	li	a1,42
c00028b8:	00005517          	auipc	a0,0x5
c00028bc:	a8850513          	addi	a0,a0,-1400 # c0007340 <commands+0xd9c>
c00028c0:	98dfd0ef          	jal	ra,c000024c <__panic>
c00028c4:	00004697          	auipc	a3,0x4
c00028c8:	7bc68693          	addi	a3,a3,1980 # c0007080 <commands+0xadc>
c00028cc:	00004617          	auipc	a2,0x4
c00028d0:	3f860613          	addi	a2,a2,1016 # c0006cc4 <commands+0x720>
c00028d4:	0a000593          	li	a1,160
c00028d8:	00005517          	auipc	a0,0x5
c00028dc:	a6850513          	addi	a0,a0,-1432 # c0007340 <commands+0xd9c>
c00028e0:	96dfd0ef          	jal	ra,c000024c <__panic>
c00028e4:	00004697          	auipc	a3,0x4
c00028e8:	79c68693          	addi	a3,a3,1948 # c0007080 <commands+0xadc>
c00028ec:	00004617          	auipc	a2,0x4
c00028f0:	3d860613          	addi	a2,a2,984 # c0006cc4 <commands+0x720>
c00028f4:	0a200593          	li	a1,162
c00028f8:	00005517          	auipc	a0,0x5
c00028fc:	a4850513          	addi	a0,a0,-1464 # c0007340 <commands+0xd9c>
c0002900:	94dfd0ef          	jal	ra,c000024c <__panic>
c0002904:	00005697          	auipc	a3,0x5
c0002908:	be468693          	addi	a3,a3,-1052 # c00074e8 <commands+0xf44>
c000290c:	00004617          	auipc	a2,0x4
c0002910:	3b860613          	addi	a2,a2,952 # c0006cc4 <commands+0x720>
c0002914:	0f400593          	li	a1,244
c0002918:	00005517          	auipc	a0,0x5
c000291c:	a2850513          	addi	a0,a0,-1496 # c0007340 <commands+0xd9c>
c0002920:	92dfd0ef          	jal	ra,c000024c <__panic>
c0002924:	00005697          	auipc	a3,0x5
c0002928:	c6068693          	addi	a3,a3,-928 # c0007584 <commands+0xfe0>
c000292c:	00004617          	auipc	a2,0x4
c0002930:	39860613          	addi	a2,a2,920 # c0006cc4 <commands+0x720>
c0002934:	10300593          	li	a1,259
c0002938:	00005517          	auipc	a0,0x5
c000293c:	a0850513          	addi	a0,a0,-1528 # c0007340 <commands+0xd9c>
c0002940:	90dfd0ef          	jal	ra,c000024c <__panic>
c0002944:	00005697          	auipc	a3,0x5
c0002948:	b8468693          	addi	a3,a3,-1148 # c00074c8 <commands+0xf24>
c000294c:	00004617          	auipc	a2,0x4
c0002950:	37860613          	addi	a2,a2,888 # c0006cc4 <commands+0x720>
c0002954:	09800593          	li	a1,152
c0002958:	00005517          	auipc	a0,0x5
c000295c:	9e850513          	addi	a0,a0,-1560 # c0007340 <commands+0xd9c>
c0002960:	8edfd0ef          	jal	ra,c000024c <__panic>
c0002964:	00005697          	auipc	a3,0x5
c0002968:	b6468693          	addi	a3,a3,-1180 # c00074c8 <commands+0xf24>
c000296c:	00004617          	auipc	a2,0x4
c0002970:	35860613          	addi	a2,a2,856 # c0006cc4 <commands+0x720>
c0002974:	09a00593          	li	a1,154
c0002978:	00005517          	auipc	a0,0x5
c000297c:	9c850513          	addi	a0,a0,-1592 # c0007340 <commands+0xd9c>
c0002980:	8cdfd0ef          	jal	ra,c000024c <__panic>
c0002984:	00005697          	auipc	a3,0x5
c0002988:	b5468693          	addi	a3,a3,-1196 # c00074d8 <commands+0xf34>
c000298c:	00004617          	auipc	a2,0x4
c0002990:	33860613          	addi	a2,a2,824 # c0006cc4 <commands+0x720>
c0002994:	09c00593          	li	a1,156
c0002998:	00005517          	auipc	a0,0x5
c000299c:	9a850513          	addi	a0,a0,-1624 # c0007340 <commands+0xd9c>
c00029a0:	8adfd0ef          	jal	ra,c000024c <__panic>
c00029a4:	00005697          	auipc	a3,0x5
c00029a8:	b3468693          	addi	a3,a3,-1228 # c00074d8 <commands+0xf34>
c00029ac:	00004617          	auipc	a2,0x4
c00029b0:	31860613          	addi	a2,a2,792 # c0006cc4 <commands+0x720>
c00029b4:	09e00593          	li	a1,158
c00029b8:	00005517          	auipc	a0,0x5
c00029bc:	98850513          	addi	a0,a0,-1656 # c0007340 <commands+0xd9c>
c00029c0:	88dfd0ef          	jal	ra,c000024c <__panic>
c00029c4:	00005697          	auipc	a3,0x5
c00029c8:	af468693          	addi	a3,a3,-1292 # c00074b8 <commands+0xf14>
c00029cc:	00004617          	auipc	a2,0x4
c00029d0:	2f860613          	addi	a2,a2,760 # c0006cc4 <commands+0x720>
c00029d4:	09400593          	li	a1,148
c00029d8:	00005517          	auipc	a0,0x5
c00029dc:	96850513          	addi	a0,a0,-1688 # c0007340 <commands+0xd9c>
c00029e0:	86dfd0ef          	jal	ra,c000024c <__panic>
c00029e4:	00005697          	auipc	a3,0x5
c00029e8:	ad468693          	addi	a3,a3,-1324 # c00074b8 <commands+0xf14>
c00029ec:	00004617          	auipc	a2,0x4
c00029f0:	2d860613          	addi	a2,a2,728 # c0006cc4 <commands+0x720>
c00029f4:	09600593          	li	a1,150
c00029f8:	00005517          	auipc	a0,0x5
c00029fc:	94850513          	addi	a0,a0,-1720 # c0007340 <commands+0xd9c>
c0002a00:	84dfd0ef          	jal	ra,c000024c <__panic>
c0002a04:	00005697          	auipc	a3,0x5
c0002a08:	a6868693          	addi	a3,a3,-1432 # c000746c <commands+0xec8>
c0002a0c:	00004617          	auipc	a2,0x4
c0002a10:	2b860613          	addi	a2,a2,696 # c0006cc4 <commands+0x720>
c0002a14:	0eb00593          	li	a1,235
c0002a18:	00005517          	auipc	a0,0x5
c0002a1c:	92850513          	addi	a0,a0,-1752 # c0007340 <commands+0xd9c>
c0002a20:	82dfd0ef          	jal	ra,c000024c <__panic>
c0002a24:	00005697          	auipc	a3,0x5
c0002a28:	9e068693          	addi	a3,a3,-1568 # c0007404 <commands+0xe60>
c0002a2c:	00004617          	auipc	a2,0x4
c0002a30:	29860613          	addi	a2,a2,664 # c0006cc4 <commands+0x720>
c0002a34:	0d800593          	li	a1,216
c0002a38:	00005517          	auipc	a0,0x5
c0002a3c:	90850513          	addi	a0,a0,-1784 # c0007340 <commands+0xd9c>
c0002a40:	80dfd0ef          	jal	ra,c000024c <__panic>
c0002a44:	00004697          	auipc	a3,0x4
c0002a48:	54468693          	addi	a3,a3,1348 # c0006f88 <commands+0x9e4>
c0002a4c:	00004617          	auipc	a2,0x4
c0002a50:	27860613          	addi	a2,a2,632 # c0006cc4 <commands+0x720>
c0002a54:	0cd00593          	li	a1,205
c0002a58:	00005517          	auipc	a0,0x5
c0002a5c:	8e850513          	addi	a0,a0,-1816 # c0007340 <commands+0xd9c>
c0002a60:	fecfd0ef          	jal	ra,c000024c <__panic>

c0002a64 <swap_init_mm>:
c0002a64:	00012797          	auipc	a5,0x12
c0002a68:	9fc7a783          	lw	a5,-1540(a5) # c0014460 <sm>
c0002a6c:	0087a303          	lw	t1,8(a5)
c0002a70:	00030067          	jr	t1

c0002a74 <swap_map_swappable>:
c0002a74:	00012797          	auipc	a5,0x12
c0002a78:	9ec7a783          	lw	a5,-1556(a5) # c0014460 <sm>
c0002a7c:	0107a303          	lw	t1,16(a5)
c0002a80:	00030067          	jr	t1

c0002a84 <swap_out>:
c0002a84:	fc010113          	addi	sp,sp,-64
c0002a88:	03312623          	sw	s3,44(sp)
c0002a8c:	02112e23          	sw	ra,60(sp)
c0002a90:	02812c23          	sw	s0,56(sp)
c0002a94:	02912a23          	sw	s1,52(sp)
c0002a98:	03212823          	sw	s2,48(sp)
c0002a9c:	03412423          	sw	s4,40(sp)
c0002aa0:	03512223          	sw	s5,36(sp)
c0002aa4:	03612023          	sw	s6,32(sp)
c0002aa8:	01712e23          	sw	s7,28(sp)
c0002aac:	01812c23          	sw	s8,24(sp)
c0002ab0:	00058993          	mv	s3,a1
c0002ab4:	10058863          	beqz	a1,c0002bc4 <swap_out+0x140>
c0002ab8:	00050913          	mv	s2,a0
c0002abc:	00060a13          	mv	s4,a2
c0002ac0:	00000413          	li	s0,0
c0002ac4:	00005b97          	auipc	s7,0x5
c0002ac8:	b60b8b93          	addi	s7,s7,-1184 # c0007624 <commands+0x1080>
c0002acc:	00100b13          	li	s6,1
c0002ad0:	00005a97          	auipc	s5,0x5
c0002ad4:	b3ca8a93          	addi	s5,s5,-1220 # c000760c <commands+0x1068>
c0002ad8:	0340006f          	j	c0002b0c <swap_out+0x88>
c0002adc:	000a8513          	mv	a0,s5
c0002ae0:	df8fd0ef          	jal	ra,c00000d8 <cprintf>
c0002ae4:	00012797          	auipc	a5,0x12
c0002ae8:	97c7a783          	lw	a5,-1668(a5) # c0014460 <sm>
c0002aec:	0107a783          	lw	a5,16(a5)
c0002af0:	00c12603          	lw	a2,12(sp)
c0002af4:	00000693          	li	a3,0
c0002af8:	00048593          	mv	a1,s1
c0002afc:	00090513          	mv	a0,s2
c0002b00:	00140413          	addi	s0,s0,1
c0002b04:	000780e7          	jalr	a5
c0002b08:	0a898e63          	beq	s3,s0,c0002bc4 <swap_out+0x140>
c0002b0c:	00012797          	auipc	a5,0x12
c0002b10:	9547a783          	lw	a5,-1708(a5) # c0014460 <sm>
c0002b14:	0187a783          	lw	a5,24(a5)
c0002b18:	000a0613          	mv	a2,s4
c0002b1c:	00c10593          	addi	a1,sp,12
c0002b20:	00090513          	mv	a0,s2
c0002b24:	000780e7          	jalr	a5
c0002b28:	0c051863          	bnez	a0,c0002bf8 <swap_out+0x174>
c0002b2c:	00c12783          	lw	a5,12(sp)
c0002b30:	00c92503          	lw	a0,12(s2)
c0002b34:	00000613          	li	a2,0
c0002b38:	01c7a483          	lw	s1,28(a5)
c0002b3c:	00048593          	mv	a1,s1
c0002b40:	120010ef          	jal	ra,c0003c60 <get_pte>
c0002b44:	00052783          	lw	a5,0(a0)
c0002b48:	00050c13          	mv	s8,a0
c0002b4c:	0017f793          	andi	a5,a5,1
c0002b50:	0c078063          	beqz	a5,c0002c10 <swap_out+0x18c>
c0002b54:	00c12583          	lw	a1,12(sp)
c0002b58:	01c5a503          	lw	a0,28(a1) # 101c <BASE_ADDRESS-0xbfffefe4>
c0002b5c:	00c55513          	srli	a0,a0,0xc
c0002b60:	00150513          	addi	a0,a0,1
c0002b64:	00851513          	slli	a0,a0,0x8
c0002b68:	788020ef          	jal	ra,c00052f0 <swapfs_write>
c0002b6c:	f60518e3          	bnez	a0,c0002adc <swap_out+0x58>
c0002b70:	00c12783          	lw	a5,12(sp)
c0002b74:	00048613          	mv	a2,s1
c0002b78:	00040593          	mv	a1,s0
c0002b7c:	01c7a683          	lw	a3,28(a5)
c0002b80:	000b8513          	mv	a0,s7
c0002b84:	00140413          	addi	s0,s0,1
c0002b88:	00c6d693          	srli	a3,a3,0xc
c0002b8c:	00168693          	addi	a3,a3,1
c0002b90:	d48fd0ef          	jal	ra,c00000d8 <cprintf>
c0002b94:	00c12503          	lw	a0,12(sp)
c0002b98:	000b0593          	mv	a1,s6
c0002b9c:	01c52783          	lw	a5,28(a0)
c0002ba0:	00c7d793          	srli	a5,a5,0xc
c0002ba4:	00178793          	addi	a5,a5,1
c0002ba8:	00879793          	slli	a5,a5,0x8
c0002bac:	00fc2023          	sw	a5,0(s8)
c0002bb0:	7f5000ef          	jal	ra,c0003ba4 <free_pages>
c0002bb4:	00c92503          	lw	a0,12(s2)
c0002bb8:	00048593          	mv	a1,s1
c0002bbc:	554010ef          	jal	ra,c0004110 <tlb_invalidate>
c0002bc0:	f48996e3          	bne	s3,s0,c0002b0c <swap_out+0x88>
c0002bc4:	03c12083          	lw	ra,60(sp)
c0002bc8:	00098513          	mv	a0,s3
c0002bcc:	03812403          	lw	s0,56(sp)
c0002bd0:	03412483          	lw	s1,52(sp)
c0002bd4:	03012903          	lw	s2,48(sp)
c0002bd8:	02c12983          	lw	s3,44(sp)
c0002bdc:	02812a03          	lw	s4,40(sp)
c0002be0:	02412a83          	lw	s5,36(sp)
c0002be4:	02012b03          	lw	s6,32(sp)
c0002be8:	01c12b83          	lw	s7,28(sp)
c0002bec:	01812c03          	lw	s8,24(sp)
c0002bf0:	04010113          	addi	sp,sp,64
c0002bf4:	00008067          	ret
c0002bf8:	00040593          	mv	a1,s0
c0002bfc:	00005517          	auipc	a0,0x5
c0002c00:	9c850513          	addi	a0,a0,-1592 # c00075c4 <commands+0x1020>
c0002c04:	cd4fd0ef          	jal	ra,c00000d8 <cprintf>
c0002c08:	00040993          	mv	s3,s0
c0002c0c:	fb9ff06f          	j	c0002bc4 <swap_out+0x140>
c0002c10:	00005697          	auipc	a3,0x5
c0002c14:	9e468693          	addi	a3,a3,-1564 # c00075f4 <commands+0x1050>
c0002c18:	00004617          	auipc	a2,0x4
c0002c1c:	0ac60613          	addi	a2,a2,172 # c0006cc4 <commands+0x720>
c0002c20:	06900593          	li	a1,105
c0002c24:	00004517          	auipc	a0,0x4
c0002c28:	71c50513          	addi	a0,a0,1820 # c0007340 <commands+0xd9c>
c0002c2c:	e20fd0ef          	jal	ra,c000024c <__panic>

c0002c30 <swap_in>:
c0002c30:	fe010113          	addi	sp,sp,-32
c0002c34:	01212823          	sw	s2,16(sp)
c0002c38:	00050913          	mv	s2,a0
c0002c3c:	00100513          	li	a0,1
c0002c40:	00912a23          	sw	s1,20(sp)
c0002c44:	01312623          	sw	s3,12(sp)
c0002c48:	00112e23          	sw	ra,28(sp)
c0002c4c:	00812c23          	sw	s0,24(sp)
c0002c50:	00058493          	mv	s1,a1
c0002c54:	00060993          	mv	s3,a2
c0002c58:	699000ef          	jal	ra,c0003af0 <alloc_pages>
c0002c5c:	06050263          	beqz	a0,c0002cc0 <swap_in+0x90>
c0002c60:	00050413          	mv	s0,a0
c0002c64:	00c92503          	lw	a0,12(s2)
c0002c68:	00000613          	li	a2,0
c0002c6c:	00048593          	mv	a1,s1
c0002c70:	7f1000ef          	jal	ra,c0003c60 <get_pte>
c0002c74:	00050913          	mv	s2,a0
c0002c78:	00052503          	lw	a0,0(a0)
c0002c7c:	00040593          	mv	a1,s0
c0002c80:	5c0020ef          	jal	ra,c0005240 <swapfs_read>
c0002c84:	00092583          	lw	a1,0(s2)
c0002c88:	00048613          	mv	a2,s1
c0002c8c:	00004517          	auipc	a0,0x4
c0002c90:	65850513          	addi	a0,a0,1624 # c00072e4 <commands+0xd40>
c0002c94:	0085d593          	srli	a1,a1,0x8
c0002c98:	c40fd0ef          	jal	ra,c00000d8 <cprintf>
c0002c9c:	01c12083          	lw	ra,28(sp)
c0002ca0:	0089a023          	sw	s0,0(s3)
c0002ca4:	00000513          	li	a0,0
c0002ca8:	01812403          	lw	s0,24(sp)
c0002cac:	01412483          	lw	s1,20(sp)
c0002cb0:	01012903          	lw	s2,16(sp)
c0002cb4:	00c12983          	lw	s3,12(sp)
c0002cb8:	02010113          	addi	sp,sp,32
c0002cbc:	00008067          	ret
c0002cc0:	00004697          	auipc	a3,0x4
c0002cc4:	61468693          	addi	a3,a3,1556 # c00072d4 <commands+0xd30>
c0002cc8:	00004617          	auipc	a2,0x4
c0002ccc:	ffc60613          	addi	a2,a2,-4 # c0006cc4 <commands+0x720>
c0002cd0:	07f00593          	li	a1,127
c0002cd4:	00004517          	auipc	a0,0x4
c0002cd8:	66c50513          	addi	a0,a0,1644 # c0007340 <commands+0xd9c>
c0002cdc:	d70fd0ef          	jal	ra,c000024c <__panic>

c0002ce0 <default_init>:
c0002ce0:	00012797          	auipc	a5,0x12
c0002ce4:	85078793          	addi	a5,a5,-1968 # c0014530 <free_area>
c0002ce8:	00f7a223          	sw	a5,4(a5)
c0002cec:	00f7a023          	sw	a5,0(a5)
c0002cf0:	0007a423          	sw	zero,8(a5)
c0002cf4:	00008067          	ret

c0002cf8 <default_nr_free_pages>:
c0002cf8:	00012517          	auipc	a0,0x12
c0002cfc:	84052503          	lw	a0,-1984(a0) # c0014538 <free_area+0x8>
c0002d00:	00008067          	ret

c0002d04 <default_free_pages>:
c0002d04:	ff010113          	addi	sp,sp,-16
c0002d08:	00112623          	sw	ra,12(sp)
c0002d0c:	1e058e63          	beqz	a1,c0002f08 <default_free_pages+0x204>
c0002d10:	00559693          	slli	a3,a1,0x5
c0002d14:	00d506b3          	add	a3,a0,a3
c0002d18:	04d50863          	beq	a0,a3,c0002d68 <default_free_pages+0x64>
c0002d1c:	00452783          	lw	a5,4(a0)
c0002d20:	0017f793          	andi	a5,a5,1
c0002d24:	1c079263          	bnez	a5,c0002ee8 <default_free_pages+0x1e4>
c0002d28:	00452783          	lw	a5,4(a0)
c0002d2c:	0017d793          	srli	a5,a5,0x1
c0002d30:	0017f793          	andi	a5,a5,1
c0002d34:	1a079a63          	bnez	a5,c0002ee8 <default_free_pages+0x1e4>
c0002d38:	00050793          	mv	a5,a0
c0002d3c:	01c0006f          	j	c0002d58 <default_free_pages+0x54>
c0002d40:	0047a703          	lw	a4,4(a5)
c0002d44:	00177713          	andi	a4,a4,1
c0002d48:	1a071063          	bnez	a4,c0002ee8 <default_free_pages+0x1e4>
c0002d4c:	0047a703          	lw	a4,4(a5)
c0002d50:	00277713          	andi	a4,a4,2
c0002d54:	18071a63          	bnez	a4,c0002ee8 <default_free_pages+0x1e4>
c0002d58:	0007a223          	sw	zero,4(a5)
c0002d5c:	0007a023          	sw	zero,0(a5)
c0002d60:	02078793          	addi	a5,a5,32
c0002d64:	fcd79ee3          	bne	a5,a3,c0002d40 <default_free_pages+0x3c>
c0002d68:	00b52423          	sw	a1,8(a0)
c0002d6c:	00450313          	addi	t1,a0,4
c0002d70:	00200793          	li	a5,2
c0002d74:	40f3202f          	amoor.w	zero,a5,(t1)
c0002d78:	00011797          	auipc	a5,0x11
c0002d7c:	7c07a783          	lw	a5,1984(a5) # c0014538 <free_area+0x8>
c0002d80:	00b785b3          	add	a1,a5,a1
c0002d84:	00011697          	auipc	a3,0x11
c0002d88:	7ac68693          	addi	a3,a3,1964 # c0014530 <free_area>
c0002d8c:	00b6a423          	sw	a1,8(a3)
c0002d90:	00011797          	auipc	a5,0x11
c0002d94:	7a47a783          	lw	a5,1956(a5) # c0014534 <free_area+0x4>
c0002d98:	12d78863          	beq	a5,a3,c0002ec8 <default_free_pages+0x1c4>
c0002d9c:	00011597          	auipc	a1,0x11
c0002da0:	7945a583          	lw	a1,1940(a1) # c0014530 <free_area>
c0002da4:	00000813          	li	a6,0
c0002da8:	00c50613          	addi	a2,a0,12
c0002dac:	00100893          	li	a7,1
c0002db0:	0080006f          	j	c0002db8 <default_free_pages+0xb4>
c0002db4:	00070793          	mv	a5,a4
c0002db8:	ff478713          	addi	a4,a5,-12
c0002dbc:	02e56863          	bltu	a0,a4,c0002dec <default_free_pages+0xe8>
c0002dc0:	0047a703          	lw	a4,4(a5)
c0002dc4:	fed718e3          	bne	a4,a3,c0002db4 <default_free_pages+0xb0>
c0002dc8:	00c7a223          	sw	a2,4(a5)
c0002dcc:	00d52823          	sw	a3,16(a0)
c0002dd0:	00f52623          	sw	a5,12(a0)
c0002dd4:	0047a783          	lw	a5,4(a5)
c0002dd8:	00060593          	mv	a1,a2
c0002ddc:	06d78863          	beq	a5,a3,c0002e4c <default_free_pages+0x148>
c0002de0:	ff478713          	addi	a4,a5,-12
c0002de4:	00088813          	mv	a6,a7
c0002de8:	fce57ce3          	bleu	a4,a0,c0002dc0 <default_free_pages+0xbc>
c0002dec:	12081e63          	bnez	a6,c0002f28 <default_free_pages+0x224>
c0002df0:	0007a583          	lw	a1,0(a5)
c0002df4:	00c7a023          	sw	a2,0(a5)
c0002df8:	00c5a223          	sw	a2,4(a1)
c0002dfc:	00f52823          	sw	a5,16(a0)
c0002e00:	00b52623          	sw	a1,12(a0)
c0002e04:	06d58a63          	beq	a1,a3,c0002e78 <default_free_pages+0x174>
c0002e08:	ffc5a603          	lw	a2,-4(a1)
c0002e0c:	ff458713          	addi	a4,a1,-12
c0002e10:	00561793          	slli	a5,a2,0x5
c0002e14:	00f707b3          	add	a5,a4,a5
c0002e18:	04f51a63          	bne	a0,a5,c0002e6c <default_free_pages+0x168>
c0002e1c:	00852783          	lw	a5,8(a0)
c0002e20:	00c78633          	add	a2,a5,a2
c0002e24:	fec5ae23          	sw	a2,-4(a1)
c0002e28:	ffd00793          	li	a5,-3
c0002e2c:	60f3202f          	amoand.w	zero,a5,(t1)
c0002e30:	00c52803          	lw	a6,12(a0)
c0002e34:	01052603          	lw	a2,16(a0)
c0002e38:	00070513          	mv	a0,a4
c0002e3c:	00c82223          	sw	a2,4(a6)
c0002e40:	0045a783          	lw	a5,4(a1)
c0002e44:	01062023          	sw	a6,0(a2)
c0002e48:	0280006f          	j	c0002e70 <default_free_pages+0x16c>
c0002e4c:	00c52583          	lw	a1,12(a0)
c0002e50:	00c7a023          	sw	a2,0(a5)
c0002e54:	00f58e63          	beq	a1,a5,c0002e70 <default_free_pages+0x16c>
c0002e58:	ffc5a603          	lw	a2,-4(a1)
c0002e5c:	ff458713          	addi	a4,a1,-12
c0002e60:	00561793          	slli	a5,a2,0x5
c0002e64:	00f707b3          	add	a5,a4,a5
c0002e68:	faf50ae3          	beq	a0,a5,c0002e1c <default_free_pages+0x118>
c0002e6c:	01052783          	lw	a5,16(a0)
c0002e70:	ff478713          	addi	a4,a5,-12
c0002e74:	00d78a63          	beq	a5,a3,c0002e88 <default_free_pages+0x184>
c0002e78:	00852603          	lw	a2,8(a0)
c0002e7c:	00561693          	slli	a3,a2,0x5
c0002e80:	00d506b3          	add	a3,a0,a3
c0002e84:	00d70863          	beq	a4,a3,c0002e94 <default_free_pages+0x190>
c0002e88:	00c12083          	lw	ra,12(sp)
c0002e8c:	01010113          	addi	sp,sp,16
c0002e90:	00008067          	ret
c0002e94:	ffc7a703          	lw	a4,-4(a5)
c0002e98:	ff878693          	addi	a3,a5,-8
c0002e9c:	00c70633          	add	a2,a4,a2
c0002ea0:	00c52423          	sw	a2,8(a0)
c0002ea4:	ffd00713          	li	a4,-3
c0002ea8:	60e6a02f          	amoand.w	zero,a4,(a3)
c0002eac:	0007a703          	lw	a4,0(a5)
c0002eb0:	0047a783          	lw	a5,4(a5)
c0002eb4:	00c12083          	lw	ra,12(sp)
c0002eb8:	01010113          	addi	sp,sp,16
c0002ebc:	00f72223          	sw	a5,4(a4)
c0002ec0:	00e7a023          	sw	a4,0(a5)
c0002ec4:	00008067          	ret
c0002ec8:	00c12083          	lw	ra,12(sp)
c0002ecc:	00c50713          	addi	a4,a0,12
c0002ed0:	00e7a023          	sw	a4,0(a5)
c0002ed4:	00e7a223          	sw	a4,4(a5)
c0002ed8:	00f52823          	sw	a5,16(a0)
c0002edc:	00f52623          	sw	a5,12(a0)
c0002ee0:	01010113          	addi	sp,sp,16
c0002ee4:	00008067          	ret
c0002ee8:	00005697          	auipc	a3,0x5
c0002eec:	a4868693          	addi	a3,a3,-1464 # c0007930 <commands+0x138c>
c0002ef0:	00004617          	auipc	a2,0x4
c0002ef4:	dd460613          	addi	a2,a2,-556 # c0006cc4 <commands+0x720>
c0002ef8:	08300593          	li	a1,131
c0002efc:	00005517          	auipc	a0,0x5
c0002f00:	a5c50513          	addi	a0,a0,-1444 # c0007958 <commands+0x13b4>
c0002f04:	b48fd0ef          	jal	ra,c000024c <__panic>
c0002f08:	00005697          	auipc	a3,0x5
c0002f0c:	a6868693          	addi	a3,a3,-1432 # c0007970 <commands+0x13cc>
c0002f10:	00004617          	auipc	a2,0x4
c0002f14:	db460613          	addi	a2,a2,-588 # c0006cc4 <commands+0x720>
c0002f18:	08000593          	li	a1,128
c0002f1c:	00005517          	auipc	a0,0x5
c0002f20:	a3c50513          	addi	a0,a0,-1476 # c0007958 <commands+0x13b4>
c0002f24:	b28fd0ef          	jal	ra,c000024c <__panic>
c0002f28:	00b6a023          	sw	a1,0(a3)
c0002f2c:	ec5ff06f          	j	c0002df0 <default_free_pages+0xec>

c0002f30 <default_init_memmap>:
c0002f30:	ff010113          	addi	sp,sp,-16
c0002f34:	00112623          	sw	ra,12(sp)
c0002f38:	12058e63          	beqz	a1,c0003074 <default_init_memmap+0x144>
c0002f3c:	00559693          	slli	a3,a1,0x5
c0002f40:	00d506b3          	add	a3,a0,a3
c0002f44:	02d50c63          	beq	a0,a3,c0002f7c <default_init_memmap+0x4c>
c0002f48:	00452703          	lw	a4,4(a0)
c0002f4c:	00050793          	mv	a5,a0
c0002f50:	00177713          	andi	a4,a4,1
c0002f54:	00071a63          	bnez	a4,c0002f68 <default_init_memmap+0x38>
c0002f58:	0fc0006f          	j	c0003054 <default_init_memmap+0x124>
c0002f5c:	0047a703          	lw	a4,4(a5)
c0002f60:	00177713          	andi	a4,a4,1
c0002f64:	0e070863          	beqz	a4,c0003054 <default_init_memmap+0x124>
c0002f68:	0007a423          	sw	zero,8(a5)
c0002f6c:	0007a223          	sw	zero,4(a5)
c0002f70:	0007a023          	sw	zero,0(a5)
c0002f74:	02078793          	addi	a5,a5,32
c0002f78:	fed792e3          	bne	a5,a3,c0002f5c <default_init_memmap+0x2c>
c0002f7c:	00b52423          	sw	a1,8(a0)
c0002f80:	00200793          	li	a5,2
c0002f84:	00450713          	addi	a4,a0,4
c0002f88:	40f7202f          	amoor.w	zero,a5,(a4)
c0002f8c:	00011797          	auipc	a5,0x11
c0002f90:	5ac7a783          	lw	a5,1452(a5) # c0014538 <free_area+0x8>
c0002f94:	00b785b3          	add	a1,a5,a1
c0002f98:	00011697          	auipc	a3,0x11
c0002f9c:	59868693          	addi	a3,a3,1432 # c0014530 <free_area>
c0002fa0:	00b6a423          	sw	a1,8(a3)
c0002fa4:	00011797          	auipc	a5,0x11
c0002fa8:	5907a783          	lw	a5,1424(a5) # c0014534 <free_area+0x4>
c0002fac:	08d78463          	beq	a5,a3,c0003034 <default_init_memmap+0x104>
c0002fb0:	00011597          	auipc	a1,0x11
c0002fb4:	5805a583          	lw	a1,1408(a1) # c0014530 <free_area>
c0002fb8:	00000813          	li	a6,0
c0002fbc:	00c50613          	addi	a2,a0,12
c0002fc0:	00100893          	li	a7,1
c0002fc4:	0080006f          	j	c0002fcc <default_init_memmap+0x9c>
c0002fc8:	00070793          	mv	a5,a4
c0002fcc:	ff478713          	addi	a4,a5,-12
c0002fd0:	02e56863          	bltu	a0,a4,c0003000 <default_init_memmap+0xd0>
c0002fd4:	0047a703          	lw	a4,4(a5)
c0002fd8:	fed718e3          	bne	a4,a3,c0002fc8 <default_init_memmap+0x98>
c0002fdc:	00c7a223          	sw	a2,4(a5)
c0002fe0:	00d52823          	sw	a3,16(a0)
c0002fe4:	00f52623          	sw	a5,12(a0)
c0002fe8:	0047a783          	lw	a5,4(a5)
c0002fec:	00060593          	mv	a1,a2
c0002ff0:	02d78a63          	beq	a5,a3,c0003024 <default_init_memmap+0xf4>
c0002ff4:	ff478713          	addi	a4,a5,-12
c0002ff8:	00088813          	mv	a6,a7
c0002ffc:	fce57ce3          	bleu	a4,a0,c0002fd4 <default_init_memmap+0xa4>
c0003000:	08081a63          	bnez	a6,c0003094 <default_init_memmap+0x164>
c0003004:	0007a703          	lw	a4,0(a5)
c0003008:	00c12083          	lw	ra,12(sp)
c000300c:	00c7a023          	sw	a2,0(a5)
c0003010:	00c72223          	sw	a2,4(a4)
c0003014:	00f52823          	sw	a5,16(a0)
c0003018:	00e52623          	sw	a4,12(a0)
c000301c:	01010113          	addi	sp,sp,16
c0003020:	00008067          	ret
c0003024:	00c12083          	lw	ra,12(sp)
c0003028:	00c7a023          	sw	a2,0(a5)
c000302c:	01010113          	addi	sp,sp,16
c0003030:	00008067          	ret
c0003034:	00c12083          	lw	ra,12(sp)
c0003038:	00c50713          	addi	a4,a0,12
c000303c:	00e7a023          	sw	a4,0(a5)
c0003040:	00e7a223          	sw	a4,4(a5)
c0003044:	00f52823          	sw	a5,16(a0)
c0003048:	00f52623          	sw	a5,12(a0)
c000304c:	01010113          	addi	sp,sp,16
c0003050:	00008067          	ret
c0003054:	00005697          	auipc	a3,0x5
c0003058:	92468693          	addi	a3,a3,-1756 # c0007978 <commands+0x13d4>
c000305c:	00004617          	auipc	a2,0x4
c0003060:	c6860613          	addi	a2,a2,-920 # c0006cc4 <commands+0x720>
c0003064:	04900593          	li	a1,73
c0003068:	00005517          	auipc	a0,0x5
c000306c:	8f050513          	addi	a0,a0,-1808 # c0007958 <commands+0x13b4>
c0003070:	9dcfd0ef          	jal	ra,c000024c <__panic>
c0003074:	00005697          	auipc	a3,0x5
c0003078:	8fc68693          	addi	a3,a3,-1796 # c0007970 <commands+0x13cc>
c000307c:	00004617          	auipc	a2,0x4
c0003080:	c4860613          	addi	a2,a2,-952 # c0006cc4 <commands+0x720>
c0003084:	04600593          	li	a1,70
c0003088:	00005517          	auipc	a0,0x5
c000308c:	8d050513          	addi	a0,a0,-1840 # c0007958 <commands+0x13b4>
c0003090:	9bcfd0ef          	jal	ra,c000024c <__panic>
c0003094:	00b6a023          	sw	a1,0(a3)
c0003098:	f6dff06f          	j	c0003004 <default_init_memmap+0xd4>

c000309c <default_check>:
c000309c:	fd010113          	addi	sp,sp,-48
c00030a0:	03212023          	sw	s2,32(sp)
c00030a4:	02112623          	sw	ra,44(sp)
c00030a8:	02812423          	sw	s0,40(sp)
c00030ac:	02912223          	sw	s1,36(sp)
c00030b0:	01312e23          	sw	s3,28(sp)
c00030b4:	01412c23          	sw	s4,24(sp)
c00030b8:	01512a23          	sw	s5,20(sp)
c00030bc:	01612823          	sw	s6,16(sp)
c00030c0:	01712623          	sw	s7,12(sp)
c00030c4:	01812423          	sw	s8,8(sp)
c00030c8:	01912223          	sw	s9,4(sp)
c00030cc:	00011917          	auipc	s2,0x11
c00030d0:	46490913          	addi	s2,s2,1124 # c0014530 <free_area>
c00030d4:	00011797          	auipc	a5,0x11
c00030d8:	4607a783          	lw	a5,1120(a5) # c0014534 <free_area+0x4>
c00030dc:	3d278663          	beq	a5,s2,c00034a8 <default_check+0x40c>
c00030e0:	ff87a703          	lw	a4,-8(a5)
c00030e4:	00175713          	srli	a4,a4,0x1
c00030e8:	00177713          	andi	a4,a4,1
c00030ec:	3c070663          	beqz	a4,c00034b8 <default_check+0x41c>
c00030f0:	00000413          	li	s0,0
c00030f4:	00000493          	li	s1,0
c00030f8:	0100006f          	j	c0003108 <default_check+0x6c>
c00030fc:	ff87a703          	lw	a4,-8(a5)
c0003100:	00277713          	andi	a4,a4,2
c0003104:	3a070a63          	beqz	a4,c00034b8 <default_check+0x41c>
c0003108:	ffc7a703          	lw	a4,-4(a5)
c000310c:	0047a783          	lw	a5,4(a5)
c0003110:	00148493          	addi	s1,s1,1
c0003114:	00e40433          	add	s0,s0,a4
c0003118:	00040993          	mv	s3,s0
c000311c:	ff2790e3          	bne	a5,s2,c00030fc <default_check+0x60>
c0003120:	2e9000ef          	jal	ra,c0003c08 <nr_free_pages>
c0003124:	7ca99a63          	bne	s3,a0,c00038f8 <default_check+0x85c>
c0003128:	00100513          	li	a0,1
c000312c:	1c5000ef          	jal	ra,c0003af0 <alloc_pages>
c0003130:	00050a13          	mv	s4,a0
c0003134:	000502e3          	beqz	a0,c0003938 <default_check+0x89c>
c0003138:	00100513          	li	a0,1
c000313c:	1b5000ef          	jal	ra,c0003af0 <alloc_pages>
c0003140:	00050993          	mv	s3,a0
c0003144:	7c050a63          	beqz	a0,c0003918 <default_check+0x87c>
c0003148:	00100513          	li	a0,1
c000314c:	1a5000ef          	jal	ra,c0003af0 <alloc_pages>
c0003150:	00050a93          	mv	s5,a0
c0003154:	56050263          	beqz	a0,c00036b8 <default_check+0x61c>
c0003158:	3b3a0063          	beq	s4,s3,c00034f8 <default_check+0x45c>
c000315c:	38aa0e63          	beq	s4,a0,c00034f8 <default_check+0x45c>
c0003160:	38a98c63          	beq	s3,a0,c00034f8 <default_check+0x45c>
c0003164:	000a2783          	lw	a5,0(s4)
c0003168:	36079863          	bnez	a5,c00034d8 <default_check+0x43c>
c000316c:	0009a783          	lw	a5,0(s3)
c0003170:	36079463          	bnez	a5,c00034d8 <default_check+0x43c>
c0003174:	00052783          	lw	a5,0(a0)
c0003178:	36079063          	bnez	a5,c00034d8 <default_check+0x43c>
c000317c:	00011797          	auipc	a5,0x11
c0003180:	3cc7a783          	lw	a5,972(a5) # c0014548 <pages>
c0003184:	40fa0733          	sub	a4,s4,a5
c0003188:	00008617          	auipc	a2,0x8
c000318c:	ea462603          	lw	a2,-348(a2) # c000b02c <nbase>
c0003190:	40575713          	srai	a4,a4,0x5
c0003194:	00c70733          	add	a4,a4,a2
c0003198:	00011697          	auipc	a3,0x11
c000319c:	2d46a683          	lw	a3,724(a3) # c001446c <npage>
c00031a0:	00c69693          	slli	a3,a3,0xc
c00031a4:	00c71713          	slli	a4,a4,0xc
c00031a8:	48d77863          	bleu	a3,a4,c0003638 <default_check+0x59c>
c00031ac:	40f98733          	sub	a4,s3,a5
c00031b0:	40575713          	srai	a4,a4,0x5
c00031b4:	00c70733          	add	a4,a4,a2
c00031b8:	00c71713          	slli	a4,a4,0xc
c00031bc:	3ed77e63          	bleu	a3,a4,c00035b8 <default_check+0x51c>
c00031c0:	40f507b3          	sub	a5,a0,a5
c00031c4:	4057d793          	srai	a5,a5,0x5
c00031c8:	00c787b3          	add	a5,a5,a2
c00031cc:	00c79793          	slli	a5,a5,0xc
c00031d0:	3cd7f463          	bleu	a3,a5,c0003598 <default_check+0x4fc>
c00031d4:	00100513          	li	a0,1
c00031d8:	00011c17          	auipc	s8,0x11
c00031dc:	358c2c03          	lw	s8,856(s8) # c0014530 <free_area>
c00031e0:	00011b97          	auipc	s7,0x11
c00031e4:	354bab83          	lw	s7,852(s7) # c0014534 <free_area+0x4>
c00031e8:	00011b17          	auipc	s6,0x11
c00031ec:	350b2b03          	lw	s6,848(s6) # c0014538 <free_area+0x8>
c00031f0:	01292223          	sw	s2,4(s2)
c00031f4:	01292023          	sw	s2,0(s2)
c00031f8:	00092423          	sw	zero,8(s2)
c00031fc:	0f5000ef          	jal	ra,c0003af0 <alloc_pages>
c0003200:	36051c63          	bnez	a0,c0003578 <default_check+0x4dc>
c0003204:	00100593          	li	a1,1
c0003208:	000a0513          	mv	a0,s4
c000320c:	199000ef          	jal	ra,c0003ba4 <free_pages>
c0003210:	00100593          	li	a1,1
c0003214:	00098513          	mv	a0,s3
c0003218:	18d000ef          	jal	ra,c0003ba4 <free_pages>
c000321c:	00100593          	li	a1,1
c0003220:	000a8513          	mv	a0,s5
c0003224:	181000ef          	jal	ra,c0003ba4 <free_pages>
c0003228:	00011717          	auipc	a4,0x11
c000322c:	31072703          	lw	a4,784(a4) # c0014538 <free_area+0x8>
c0003230:	00300793          	li	a5,3
c0003234:	32f71263          	bne	a4,a5,c0003558 <default_check+0x4bc>
c0003238:	00100513          	li	a0,1
c000323c:	0b5000ef          	jal	ra,c0003af0 <alloc_pages>
c0003240:	00050993          	mv	s3,a0
c0003244:	2c050a63          	beqz	a0,c0003518 <default_check+0x47c>
c0003248:	00100513          	li	a0,1
c000324c:	0a5000ef          	jal	ra,c0003af0 <alloc_pages>
c0003250:	00050a93          	mv	s5,a0
c0003254:	44050263          	beqz	a0,c0003698 <default_check+0x5fc>
c0003258:	00100513          	li	a0,1
c000325c:	095000ef          	jal	ra,c0003af0 <alloc_pages>
c0003260:	00050a13          	mv	s4,a0
c0003264:	40050a63          	beqz	a0,c0003678 <default_check+0x5dc>
c0003268:	00100513          	li	a0,1
c000326c:	085000ef          	jal	ra,c0003af0 <alloc_pages>
c0003270:	3e051463          	bnez	a0,c0003658 <default_check+0x5bc>
c0003274:	00100593          	li	a1,1
c0003278:	00098513          	mv	a0,s3
c000327c:	129000ef          	jal	ra,c0003ba4 <free_pages>
c0003280:	00011797          	auipc	a5,0x11
c0003284:	2b47a783          	lw	a5,692(a5) # c0014534 <free_area+0x4>
c0003288:	2b278863          	beq	a5,s2,c0003538 <default_check+0x49c>
c000328c:	00100513          	li	a0,1
c0003290:	061000ef          	jal	ra,c0003af0 <alloc_pages>
c0003294:	38a99263          	bne	s3,a0,c0003618 <default_check+0x57c>
c0003298:	00100513          	li	a0,1
c000329c:	055000ef          	jal	ra,c0003af0 <alloc_pages>
c00032a0:	34051c63          	bnez	a0,c00035f8 <default_check+0x55c>
c00032a4:	00011797          	auipc	a5,0x11
c00032a8:	2947a783          	lw	a5,660(a5) # c0014538 <free_area+0x8>
c00032ac:	32079663          	bnez	a5,c00035d8 <default_check+0x53c>
c00032b0:	00098513          	mv	a0,s3
c00032b4:	00100593          	li	a1,1
c00032b8:	01892023          	sw	s8,0(s2)
c00032bc:	01792223          	sw	s7,4(s2)
c00032c0:	01692423          	sw	s6,8(s2)
c00032c4:	0e1000ef          	jal	ra,c0003ba4 <free_pages>
c00032c8:	00100593          	li	a1,1
c00032cc:	000a8513          	mv	a0,s5
c00032d0:	0d5000ef          	jal	ra,c0003ba4 <free_pages>
c00032d4:	00100593          	li	a1,1
c00032d8:	000a0513          	mv	a0,s4
c00032dc:	0c9000ef          	jal	ra,c0003ba4 <free_pages>
c00032e0:	00500513          	li	a0,5
c00032e4:	00d000ef          	jal	ra,c0003af0 <alloc_pages>
c00032e8:	00050993          	mv	s3,a0
c00032ec:	44050663          	beqz	a0,c0003738 <default_check+0x69c>
c00032f0:	00452783          	lw	a5,4(a0)
c00032f4:	0017d793          	srli	a5,a5,0x1
c00032f8:	0017f793          	andi	a5,a5,1
c00032fc:	58079e63          	bnez	a5,c0003898 <default_check+0x7fc>
c0003300:	00100513          	li	a0,1
c0003304:	00011b97          	auipc	s7,0x11
c0003308:	22cbab83          	lw	s7,556(s7) # c0014530 <free_area>
c000330c:	00011b17          	auipc	s6,0x11
c0003310:	228b2b03          	lw	s6,552(s6) # c0014534 <free_area+0x4>
c0003314:	01292023          	sw	s2,0(s2)
c0003318:	01292223          	sw	s2,4(s2)
c000331c:	7d4000ef          	jal	ra,c0003af0 <alloc_pages>
c0003320:	54051c63          	bnez	a0,c0003878 <default_check+0x7dc>
c0003324:	04098a93          	addi	s5,s3,64
c0003328:	000a8513          	mv	a0,s5
c000332c:	00300593          	li	a1,3
c0003330:	00011c17          	auipc	s8,0x11
c0003334:	208c2c03          	lw	s8,520(s8) # c0014538 <free_area+0x8>
c0003338:	00092423          	sw	zero,8(s2)
c000333c:	069000ef          	jal	ra,c0003ba4 <free_pages>
c0003340:	00400513          	li	a0,4
c0003344:	7ac000ef          	jal	ra,c0003af0 <alloc_pages>
c0003348:	50051863          	bnez	a0,c0003858 <default_check+0x7bc>
c000334c:	0449a783          	lw	a5,68(s3)
c0003350:	0017d793          	srli	a5,a5,0x1
c0003354:	0017f793          	andi	a5,a5,1
c0003358:	4e078063          	beqz	a5,c0003838 <default_check+0x79c>
c000335c:	0489a503          	lw	a0,72(s3)
c0003360:	00300793          	li	a5,3
c0003364:	4cf51a63          	bne	a0,a5,c0003838 <default_check+0x79c>
c0003368:	788000ef          	jal	ra,c0003af0 <alloc_pages>
c000336c:	00050a13          	mv	s4,a0
c0003370:	4a050463          	beqz	a0,c0003818 <default_check+0x77c>
c0003374:	00100513          	li	a0,1
c0003378:	778000ef          	jal	ra,c0003af0 <alloc_pages>
c000337c:	46051e63          	bnez	a0,c00037f8 <default_check+0x75c>
c0003380:	454a9c63          	bne	s5,s4,c00037d8 <default_check+0x73c>
c0003384:	00100593          	li	a1,1
c0003388:	00098513          	mv	a0,s3
c000338c:	019000ef          	jal	ra,c0003ba4 <free_pages>
c0003390:	00300593          	li	a1,3
c0003394:	000a8513          	mv	a0,s5
c0003398:	00d000ef          	jal	ra,c0003ba4 <free_pages>
c000339c:	0049a783          	lw	a5,4(s3)
c00033a0:	02098c93          	addi	s9,s3,32
c00033a4:	0017d793          	srli	a5,a5,0x1
c00033a8:	0017f793          	andi	a5,a5,1
c00033ac:	40078663          	beqz	a5,c00037b8 <default_check+0x71c>
c00033b0:	0089aa03          	lw	s4,8(s3)
c00033b4:	00100793          	li	a5,1
c00033b8:	40fa1063          	bne	s4,a5,c00037b8 <default_check+0x71c>
c00033bc:	0449a783          	lw	a5,68(s3)
c00033c0:	0017d793          	srli	a5,a5,0x1
c00033c4:	0017f793          	andi	a5,a5,1
c00033c8:	3c078863          	beqz	a5,c0003798 <default_check+0x6fc>
c00033cc:	0489a703          	lw	a4,72(s3)
c00033d0:	00300793          	li	a5,3
c00033d4:	3cf71263          	bne	a4,a5,c0003798 <default_check+0x6fc>
c00033d8:	000a0513          	mv	a0,s4
c00033dc:	714000ef          	jal	ra,c0003af0 <alloc_pages>
c00033e0:	38a99c63          	bne	s3,a0,c0003778 <default_check+0x6dc>
c00033e4:	000a0593          	mv	a1,s4
c00033e8:	7bc000ef          	jal	ra,c0003ba4 <free_pages>
c00033ec:	00200513          	li	a0,2
c00033f0:	700000ef          	jal	ra,c0003af0 <alloc_pages>
c00033f4:	36aa9263          	bne	s5,a0,c0003758 <default_check+0x6bc>
c00033f8:	00200593          	li	a1,2
c00033fc:	7a8000ef          	jal	ra,c0003ba4 <free_pages>
c0003400:	000a0593          	mv	a1,s4
c0003404:	000c8513          	mv	a0,s9
c0003408:	79c000ef          	jal	ra,c0003ba4 <free_pages>
c000340c:	00500513          	li	a0,5
c0003410:	6e0000ef          	jal	ra,c0003af0 <alloc_pages>
c0003414:	00050993          	mv	s3,a0
c0003418:	4a050063          	beqz	a0,c00038b8 <default_check+0x81c>
c000341c:	000a0513          	mv	a0,s4
c0003420:	6d0000ef          	jal	ra,c0003af0 <alloc_pages>
c0003424:	2e051a63          	bnez	a0,c0003718 <default_check+0x67c>
c0003428:	00011797          	auipc	a5,0x11
c000342c:	1107a783          	lw	a5,272(a5) # c0014538 <free_area+0x8>
c0003430:	2c079463          	bnez	a5,c00036f8 <default_check+0x65c>
c0003434:	00500593          	li	a1,5
c0003438:	00098513          	mv	a0,s3
c000343c:	01892423          	sw	s8,8(s2)
c0003440:	01792023          	sw	s7,0(s2)
c0003444:	01692223          	sw	s6,4(s2)
c0003448:	75c000ef          	jal	ra,c0003ba4 <free_pages>
c000344c:	00011797          	auipc	a5,0x11
c0003450:	0e87a783          	lw	a5,232(a5) # c0014534 <free_area+0x4>
c0003454:	01278c63          	beq	a5,s2,c000346c <default_check+0x3d0>
c0003458:	ffc7a703          	lw	a4,-4(a5)
c000345c:	0047a783          	lw	a5,4(a5)
c0003460:	fff48493          	addi	s1,s1,-1
c0003464:	40e40433          	sub	s0,s0,a4
c0003468:	ff2798e3          	bne	a5,s2,c0003458 <default_check+0x3bc>
c000346c:	26049663          	bnez	s1,c00036d8 <default_check+0x63c>
c0003470:	46041463          	bnez	s0,c00038d8 <default_check+0x83c>
c0003474:	02c12083          	lw	ra,44(sp)
c0003478:	02812403          	lw	s0,40(sp)
c000347c:	02412483          	lw	s1,36(sp)
c0003480:	02012903          	lw	s2,32(sp)
c0003484:	01c12983          	lw	s3,28(sp)
c0003488:	01812a03          	lw	s4,24(sp)
c000348c:	01412a83          	lw	s5,20(sp)
c0003490:	01012b03          	lw	s6,16(sp)
c0003494:	00c12b83          	lw	s7,12(sp)
c0003498:	00812c03          	lw	s8,8(sp)
c000349c:	00412c83          	lw	s9,4(sp)
c00034a0:	03010113          	addi	sp,sp,48
c00034a4:	00008067          	ret
c00034a8:	00000993          	li	s3,0
c00034ac:	00000413          	li	s0,0
c00034b0:	00000493          	li	s1,0
c00034b4:	c6dff06f          	j	c0003120 <default_check+0x84>
c00034b8:	00004697          	auipc	a3,0x4
c00034bc:	eac68693          	addi	a3,a3,-340 # c0007364 <commands+0xdc0>
c00034c0:	00004617          	auipc	a2,0x4
c00034c4:	80460613          	addi	a2,a2,-2044 # c0006cc4 <commands+0x720>
c00034c8:	0f000593          	li	a1,240
c00034cc:	00004517          	auipc	a0,0x4
c00034d0:	48c50513          	addi	a0,a0,1164 # c0007958 <commands+0x13b4>
c00034d4:	d79fc0ef          	jal	ra,c000024c <__panic>
c00034d8:	00004697          	auipc	a3,0x4
c00034dc:	20468693          	addi	a3,a3,516 # c00076dc <commands+0x1138>
c00034e0:	00003617          	auipc	a2,0x3
c00034e4:	7e460613          	addi	a2,a2,2020 # c0006cc4 <commands+0x720>
c00034e8:	0be00593          	li	a1,190
c00034ec:	00004517          	auipc	a0,0x4
c00034f0:	46c50513          	addi	a0,a0,1132 # c0007958 <commands+0x13b4>
c00034f4:	d59fc0ef          	jal	ra,c000024c <__panic>
c00034f8:	00004697          	auipc	a3,0x4
c00034fc:	1c068693          	addi	a3,a3,448 # c00076b8 <commands+0x1114>
c0003500:	00003617          	auipc	a2,0x3
c0003504:	7c460613          	addi	a2,a2,1988 # c0006cc4 <commands+0x720>
c0003508:	0bd00593          	li	a1,189
c000350c:	00004517          	auipc	a0,0x4
c0003510:	44c50513          	addi	a0,a0,1100 # c0007958 <commands+0x13b4>
c0003514:	d39fc0ef          	jal	ra,c000024c <__panic>
c0003518:	00004697          	auipc	a3,0x4
c000351c:	14c68693          	addi	a3,a3,332 # c0007664 <commands+0x10c0>
c0003520:	00003617          	auipc	a2,0x3
c0003524:	7a460613          	addi	a2,a2,1956 # c0006cc4 <commands+0x720>
c0003528:	0d200593          	li	a1,210
c000352c:	00004517          	auipc	a0,0x4
c0003530:	42c50513          	addi	a0,a0,1068 # c0007958 <commands+0x13b4>
c0003534:	d19fc0ef          	jal	ra,c000024c <__panic>
c0003538:	00004697          	auipc	a3,0x4
c000353c:	26868693          	addi	a3,a3,616 # c00077a0 <commands+0x11fc>
c0003540:	00003617          	auipc	a2,0x3
c0003544:	78460613          	addi	a2,a2,1924 # c0006cc4 <commands+0x720>
c0003548:	0d900593          	li	a1,217
c000354c:	00004517          	auipc	a0,0x4
c0003550:	40c50513          	addi	a0,a0,1036 # c0007958 <commands+0x13b4>
c0003554:	cf9fc0ef          	jal	ra,c000024c <__panic>
c0003558:	00004697          	auipc	a3,0x4
c000355c:	23868693          	addi	a3,a3,568 # c0007790 <commands+0x11ec>
c0003560:	00003617          	auipc	a2,0x3
c0003564:	76460613          	addi	a2,a2,1892 # c0006cc4 <commands+0x720>
c0003568:	0d000593          	li	a1,208
c000356c:	00004517          	auipc	a0,0x4
c0003570:	3ec50513          	addi	a0,a0,1004 # c0007958 <commands+0x13b4>
c0003574:	cd9fc0ef          	jal	ra,c000024c <__panic>
c0003578:	00004697          	auipc	a3,0x4
c000357c:	20068693          	addi	a3,a3,512 # c0007778 <commands+0x11d4>
c0003580:	00003617          	auipc	a2,0x3
c0003584:	74460613          	addi	a2,a2,1860 # c0006cc4 <commands+0x720>
c0003588:	0cb00593          	li	a1,203
c000358c:	00004517          	auipc	a0,0x4
c0003590:	3cc50513          	addi	a0,a0,972 # c0007958 <commands+0x13b4>
c0003594:	cb9fc0ef          	jal	ra,c000024c <__panic>
c0003598:	00004697          	auipc	a3,0x4
c000359c:	1c068693          	addi	a3,a3,448 # c0007758 <commands+0x11b4>
c00035a0:	00003617          	auipc	a2,0x3
c00035a4:	72460613          	addi	a2,a2,1828 # c0006cc4 <commands+0x720>
c00035a8:	0c200593          	li	a1,194
c00035ac:	00004517          	auipc	a0,0x4
c00035b0:	3ac50513          	addi	a0,a0,940 # c0007958 <commands+0x13b4>
c00035b4:	c99fc0ef          	jal	ra,c000024c <__panic>
c00035b8:	00004697          	auipc	a3,0x4
c00035bc:	18068693          	addi	a3,a3,384 # c0007738 <commands+0x1194>
c00035c0:	00003617          	auipc	a2,0x3
c00035c4:	70460613          	addi	a2,a2,1796 # c0006cc4 <commands+0x720>
c00035c8:	0c100593          	li	a1,193
c00035cc:	00004517          	auipc	a0,0x4
c00035d0:	38c50513          	addi	a0,a0,908 # c0007958 <commands+0x13b4>
c00035d4:	c79fc0ef          	jal	ra,c000024c <__panic>
c00035d8:	00004697          	auipc	a3,0x4
c00035dc:	f1068693          	addi	a3,a3,-240 # c00074e8 <commands+0xf44>
c00035e0:	00003617          	auipc	a2,0x3
c00035e4:	6e460613          	addi	a2,a2,1764 # c0006cc4 <commands+0x720>
c00035e8:	0df00593          	li	a1,223
c00035ec:	00004517          	auipc	a0,0x4
c00035f0:	36c50513          	addi	a0,a0,876 # c0007958 <commands+0x13b4>
c00035f4:	c59fc0ef          	jal	ra,c000024c <__panic>
c00035f8:	00004697          	auipc	a3,0x4
c00035fc:	18068693          	addi	a3,a3,384 # c0007778 <commands+0x11d4>
c0003600:	00003617          	auipc	a2,0x3
c0003604:	6c460613          	addi	a2,a2,1732 # c0006cc4 <commands+0x720>
c0003608:	0dd00593          	li	a1,221
c000360c:	00004517          	auipc	a0,0x4
c0003610:	34c50513          	addi	a0,a0,844 # c0007958 <commands+0x13b4>
c0003614:	c39fc0ef          	jal	ra,c000024c <__panic>
c0003618:	00004697          	auipc	a3,0x4
c000361c:	1a068693          	addi	a3,a3,416 # c00077b8 <commands+0x1214>
c0003620:	00003617          	auipc	a2,0x3
c0003624:	6a460613          	addi	a2,a2,1700 # c0006cc4 <commands+0x720>
c0003628:	0dc00593          	li	a1,220
c000362c:	00004517          	auipc	a0,0x4
c0003630:	32c50513          	addi	a0,a0,812 # c0007958 <commands+0x13b4>
c0003634:	c19fc0ef          	jal	ra,c000024c <__panic>
c0003638:	00004697          	auipc	a3,0x4
c000363c:	0e068693          	addi	a3,a3,224 # c0007718 <commands+0x1174>
c0003640:	00003617          	auipc	a2,0x3
c0003644:	68460613          	addi	a2,a2,1668 # c0006cc4 <commands+0x720>
c0003648:	0c000593          	li	a1,192
c000364c:	00004517          	auipc	a0,0x4
c0003650:	30c50513          	addi	a0,a0,780 # c0007958 <commands+0x13b4>
c0003654:	bf9fc0ef          	jal	ra,c000024c <__panic>
c0003658:	00004697          	auipc	a3,0x4
c000365c:	12068693          	addi	a3,a3,288 # c0007778 <commands+0x11d4>
c0003660:	00003617          	auipc	a2,0x3
c0003664:	66460613          	addi	a2,a2,1636 # c0006cc4 <commands+0x720>
c0003668:	0d600593          	li	a1,214
c000366c:	00004517          	auipc	a0,0x4
c0003670:	2ec50513          	addi	a0,a0,748 # c0007958 <commands+0x13b4>
c0003674:	bd9fc0ef          	jal	ra,c000024c <__panic>
c0003678:	00004697          	auipc	a3,0x4
c000367c:	02468693          	addi	a3,a3,36 # c000769c <commands+0x10f8>
c0003680:	00003617          	auipc	a2,0x3
c0003684:	64460613          	addi	a2,a2,1604 # c0006cc4 <commands+0x720>
c0003688:	0d400593          	li	a1,212
c000368c:	00004517          	auipc	a0,0x4
c0003690:	2cc50513          	addi	a0,a0,716 # c0007958 <commands+0x13b4>
c0003694:	bb9fc0ef          	jal	ra,c000024c <__panic>
c0003698:	00004697          	auipc	a3,0x4
c000369c:	fe868693          	addi	a3,a3,-24 # c0007680 <commands+0x10dc>
c00036a0:	00003617          	auipc	a2,0x3
c00036a4:	62460613          	addi	a2,a2,1572 # c0006cc4 <commands+0x720>
c00036a8:	0d300593          	li	a1,211
c00036ac:	00004517          	auipc	a0,0x4
c00036b0:	2ac50513          	addi	a0,a0,684 # c0007958 <commands+0x13b4>
c00036b4:	b99fc0ef          	jal	ra,c000024c <__panic>
c00036b8:	00004697          	auipc	a3,0x4
c00036bc:	fe468693          	addi	a3,a3,-28 # c000769c <commands+0x10f8>
c00036c0:	00003617          	auipc	a2,0x3
c00036c4:	60460613          	addi	a2,a2,1540 # c0006cc4 <commands+0x720>
c00036c8:	0bb00593          	li	a1,187
c00036cc:	00004517          	auipc	a0,0x4
c00036d0:	28c50513          	addi	a0,a0,652 # c0007958 <commands+0x13b4>
c00036d4:	b79fc0ef          	jal	ra,c000024c <__panic>
c00036d8:	00004697          	auipc	a3,0x4
c00036dc:	24068693          	addi	a3,a3,576 # c0007918 <commands+0x1374>
c00036e0:	00003617          	auipc	a2,0x3
c00036e4:	5e460613          	addi	a2,a2,1508 # c0006cc4 <commands+0x720>
c00036e8:	12500593          	li	a1,293
c00036ec:	00004517          	auipc	a0,0x4
c00036f0:	26c50513          	addi	a0,a0,620 # c0007958 <commands+0x13b4>
c00036f4:	b59fc0ef          	jal	ra,c000024c <__panic>
c00036f8:	00004697          	auipc	a3,0x4
c00036fc:	df068693          	addi	a3,a3,-528 # c00074e8 <commands+0xf44>
c0003700:	00003617          	auipc	a2,0x3
c0003704:	5c460613          	addi	a2,a2,1476 # c0006cc4 <commands+0x720>
c0003708:	11a00593          	li	a1,282
c000370c:	00004517          	auipc	a0,0x4
c0003710:	24c50513          	addi	a0,a0,588 # c0007958 <commands+0x13b4>
c0003714:	b39fc0ef          	jal	ra,c000024c <__panic>
c0003718:	00004697          	auipc	a3,0x4
c000371c:	06068693          	addi	a3,a3,96 # c0007778 <commands+0x11d4>
c0003720:	00003617          	auipc	a2,0x3
c0003724:	5a460613          	addi	a2,a2,1444 # c0006cc4 <commands+0x720>
c0003728:	11800593          	li	a1,280
c000372c:	00004517          	auipc	a0,0x4
c0003730:	22c50513          	addi	a0,a0,556 # c0007958 <commands+0x13b4>
c0003734:	b19fc0ef          	jal	ra,c000024c <__panic>
c0003738:	00004697          	auipc	a3,0x4
c000373c:	09c68693          	addi	a3,a3,156 # c00077d4 <commands+0x1230>
c0003740:	00003617          	auipc	a2,0x3
c0003744:	58460613          	addi	a2,a2,1412 # c0006cc4 <commands+0x720>
c0003748:	0f800593          	li	a1,248
c000374c:	00004517          	auipc	a0,0x4
c0003750:	20c50513          	addi	a0,a0,524 # c0007958 <commands+0x13b4>
c0003754:	af9fc0ef          	jal	ra,c000024c <__panic>
c0003758:	00004697          	auipc	a3,0x4
c000375c:	18068693          	addi	a3,a3,384 # c00078d8 <commands+0x1334>
c0003760:	00003617          	auipc	a2,0x3
c0003764:	56460613          	addi	a2,a2,1380 # c0006cc4 <commands+0x720>
c0003768:	11200593          	li	a1,274
c000376c:	00004517          	auipc	a0,0x4
c0003770:	1ec50513          	addi	a0,a0,492 # c0007958 <commands+0x13b4>
c0003774:	ad9fc0ef          	jal	ra,c000024c <__panic>
c0003778:	00004697          	auipc	a3,0x4
c000377c:	14068693          	addi	a3,a3,320 # c00078b8 <commands+0x1314>
c0003780:	00003617          	auipc	a2,0x3
c0003784:	54460613          	addi	a2,a2,1348 # c0006cc4 <commands+0x720>
c0003788:	11000593          	li	a1,272
c000378c:	00004517          	auipc	a0,0x4
c0003790:	1cc50513          	addi	a0,a0,460 # c0007958 <commands+0x13b4>
c0003794:	ab9fc0ef          	jal	ra,c000024c <__panic>
c0003798:	00004697          	auipc	a3,0x4
c000379c:	0f868693          	addi	a3,a3,248 # c0007890 <commands+0x12ec>
c00037a0:	00003617          	auipc	a2,0x3
c00037a4:	52460613          	addi	a2,a2,1316 # c0006cc4 <commands+0x720>
c00037a8:	10e00593          	li	a1,270
c00037ac:	00004517          	auipc	a0,0x4
c00037b0:	1ac50513          	addi	a0,a0,428 # c0007958 <commands+0x13b4>
c00037b4:	a99fc0ef          	jal	ra,c000024c <__panic>
c00037b8:	00004697          	auipc	a3,0x4
c00037bc:	0b068693          	addi	a3,a3,176 # c0007868 <commands+0x12c4>
c00037c0:	00003617          	auipc	a2,0x3
c00037c4:	50460613          	addi	a2,a2,1284 # c0006cc4 <commands+0x720>
c00037c8:	10d00593          	li	a1,269
c00037cc:	00004517          	auipc	a0,0x4
c00037d0:	18c50513          	addi	a0,a0,396 # c0007958 <commands+0x13b4>
c00037d4:	a79fc0ef          	jal	ra,c000024c <__panic>
c00037d8:	00004697          	auipc	a3,0x4
c00037dc:	08068693          	addi	a3,a3,128 # c0007858 <commands+0x12b4>
c00037e0:	00003617          	auipc	a2,0x3
c00037e4:	4e460613          	addi	a2,a2,1252 # c0006cc4 <commands+0x720>
c00037e8:	10800593          	li	a1,264
c00037ec:	00004517          	auipc	a0,0x4
c00037f0:	16c50513          	addi	a0,a0,364 # c0007958 <commands+0x13b4>
c00037f4:	a59fc0ef          	jal	ra,c000024c <__panic>
c00037f8:	00004697          	auipc	a3,0x4
c00037fc:	f8068693          	addi	a3,a3,-128 # c0007778 <commands+0x11d4>
c0003800:	00003617          	auipc	a2,0x3
c0003804:	4c460613          	addi	a2,a2,1220 # c0006cc4 <commands+0x720>
c0003808:	10700593          	li	a1,263
c000380c:	00004517          	auipc	a0,0x4
c0003810:	14c50513          	addi	a0,a0,332 # c0007958 <commands+0x13b4>
c0003814:	a39fc0ef          	jal	ra,c000024c <__panic>
c0003818:	00004697          	auipc	a3,0x4
c000381c:	02068693          	addi	a3,a3,32 # c0007838 <commands+0x1294>
c0003820:	00003617          	auipc	a2,0x3
c0003824:	4a460613          	addi	a2,a2,1188 # c0006cc4 <commands+0x720>
c0003828:	10600593          	li	a1,262
c000382c:	00004517          	auipc	a0,0x4
c0003830:	12c50513          	addi	a0,a0,300 # c0007958 <commands+0x13b4>
c0003834:	a19fc0ef          	jal	ra,c000024c <__panic>
c0003838:	00004697          	auipc	a3,0x4
c000383c:	fd468693          	addi	a3,a3,-44 # c000780c <commands+0x1268>
c0003840:	00003617          	auipc	a2,0x3
c0003844:	48460613          	addi	a2,a2,1156 # c0006cc4 <commands+0x720>
c0003848:	10500593          	li	a1,261
c000384c:	00004517          	auipc	a0,0x4
c0003850:	10c50513          	addi	a0,a0,268 # c0007958 <commands+0x13b4>
c0003854:	9f9fc0ef          	jal	ra,c000024c <__panic>
c0003858:	00004697          	auipc	a3,0x4
c000385c:	f9c68693          	addi	a3,a3,-100 # c00077f4 <commands+0x1250>
c0003860:	00003617          	auipc	a2,0x3
c0003864:	46460613          	addi	a2,a2,1124 # c0006cc4 <commands+0x720>
c0003868:	10400593          	li	a1,260
c000386c:	00004517          	auipc	a0,0x4
c0003870:	0ec50513          	addi	a0,a0,236 # c0007958 <commands+0x13b4>
c0003874:	9d9fc0ef          	jal	ra,c000024c <__panic>
c0003878:	00004697          	auipc	a3,0x4
c000387c:	f0068693          	addi	a3,a3,-256 # c0007778 <commands+0x11d4>
c0003880:	00003617          	auipc	a2,0x3
c0003884:	44460613          	addi	a2,a2,1092 # c0006cc4 <commands+0x720>
c0003888:	0fe00593          	li	a1,254
c000388c:	00004517          	auipc	a0,0x4
c0003890:	0cc50513          	addi	a0,a0,204 # c0007958 <commands+0x13b4>
c0003894:	9b9fc0ef          	jal	ra,c000024c <__panic>
c0003898:	00004697          	auipc	a3,0x4
c000389c:	f4868693          	addi	a3,a3,-184 # c00077e0 <commands+0x123c>
c00038a0:	00003617          	auipc	a2,0x3
c00038a4:	42460613          	addi	a2,a2,1060 # c0006cc4 <commands+0x720>
c00038a8:	0f900593          	li	a1,249
c00038ac:	00004517          	auipc	a0,0x4
c00038b0:	0ac50513          	addi	a0,a0,172 # c0007958 <commands+0x13b4>
c00038b4:	999fc0ef          	jal	ra,c000024c <__panic>
c00038b8:	00004697          	auipc	a3,0x4
c00038bc:	04068693          	addi	a3,a3,64 # c00078f8 <commands+0x1354>
c00038c0:	00003617          	auipc	a2,0x3
c00038c4:	40460613          	addi	a2,a2,1028 # c0006cc4 <commands+0x720>
c00038c8:	11700593          	li	a1,279
c00038cc:	00004517          	auipc	a0,0x4
c00038d0:	08c50513          	addi	a0,a0,140 # c0007958 <commands+0x13b4>
c00038d4:	979fc0ef          	jal	ra,c000024c <__panic>
c00038d8:	00004697          	auipc	a3,0x4
c00038dc:	04c68693          	addi	a3,a3,76 # c0007924 <commands+0x1380>
c00038e0:	00003617          	auipc	a2,0x3
c00038e4:	3e460613          	addi	a2,a2,996 # c0006cc4 <commands+0x720>
c00038e8:	12600593          	li	a1,294
c00038ec:	00004517          	auipc	a0,0x4
c00038f0:	06c50513          	addi	a0,a0,108 # c0007958 <commands+0x13b4>
c00038f4:	959fc0ef          	jal	ra,c000024c <__panic>
c00038f8:	00004697          	auipc	a3,0x4
c00038fc:	a7c68693          	addi	a3,a3,-1412 # c0007374 <commands+0xdd0>
c0003900:	00003617          	auipc	a2,0x3
c0003904:	3c460613          	addi	a2,a2,964 # c0006cc4 <commands+0x720>
c0003908:	0f300593          	li	a1,243
c000390c:	00004517          	auipc	a0,0x4
c0003910:	04c50513          	addi	a0,a0,76 # c0007958 <commands+0x13b4>
c0003914:	939fc0ef          	jal	ra,c000024c <__panic>
c0003918:	00004697          	auipc	a3,0x4
c000391c:	d6868693          	addi	a3,a3,-664 # c0007680 <commands+0x10dc>
c0003920:	00003617          	auipc	a2,0x3
c0003924:	3a460613          	addi	a2,a2,932 # c0006cc4 <commands+0x720>
c0003928:	0ba00593          	li	a1,186
c000392c:	00004517          	auipc	a0,0x4
c0003930:	02c50513          	addi	a0,a0,44 # c0007958 <commands+0x13b4>
c0003934:	919fc0ef          	jal	ra,c000024c <__panic>
c0003938:	00004697          	auipc	a3,0x4
c000393c:	d2c68693          	addi	a3,a3,-724 # c0007664 <commands+0x10c0>
c0003940:	00003617          	auipc	a2,0x3
c0003944:	38460613          	addi	a2,a2,900 # c0006cc4 <commands+0x720>
c0003948:	0b900593          	li	a1,185
c000394c:	00004517          	auipc	a0,0x4
c0003950:	00c50513          	addi	a0,a0,12 # c0007958 <commands+0x13b4>
c0003954:	8f9fc0ef          	jal	ra,c000024c <__panic>

c0003958 <default_alloc_pages>:
c0003958:	0a050263          	beqz	a0,c00039fc <default_alloc_pages+0xa4>
c000395c:	00011597          	auipc	a1,0x11
c0003960:	bdc5a583          	lw	a1,-1060(a1) # c0014538 <free_area+0x8>
c0003964:	00050693          	mv	a3,a0
c0003968:	00011617          	auipc	a2,0x11
c000396c:	bc860613          	addi	a2,a2,-1080 # c0014530 <free_area>
c0003970:	00a5ee63          	bltu	a1,a0,c000398c <default_alloc_pages+0x34>
c0003974:	00060793          	mv	a5,a2
c0003978:	00c0006f          	j	c0003984 <default_alloc_pages+0x2c>
c000397c:	ffc7a703          	lw	a4,-4(a5)
c0003980:	00d77a63          	bleu	a3,a4,c0003994 <default_alloc_pages+0x3c>
c0003984:	0047a783          	lw	a5,4(a5)
c0003988:	fec79ae3          	bne	a5,a2,c000397c <default_alloc_pages+0x24>
c000398c:	00000513          	li	a0,0
c0003990:	00008067          	ret
c0003994:	ff478513          	addi	a0,a5,-12
c0003998:	fe050ce3          	beqz	a0,c0003990 <default_alloc_pages+0x38>
c000399c:	0007a803          	lw	a6,0(a5)
c00039a0:	0047a883          	lw	a7,4(a5)
c00039a4:	01182223          	sw	a7,4(a6)
c00039a8:	0108a023          	sw	a6,0(a7)
c00039ac:	02e6fc63          	bleu	a4,a3,c00039e4 <default_alloc_pages+0x8c>
c00039b0:	00569893          	slli	a7,a3,0x5
c00039b4:	011508b3          	add	a7,a0,a7
c00039b8:	40d70733          	sub	a4,a4,a3
c00039bc:	00e8a423          	sw	a4,8(a7)
c00039c0:	00488313          	addi	t1,a7,4
c00039c4:	00200713          	li	a4,2
c00039c8:	40e3202f          	amoor.w	zero,a4,(t1)
c00039cc:	00482703          	lw	a4,4(a6)
c00039d0:	00c88313          	addi	t1,a7,12
c00039d4:	00672023          	sw	t1,0(a4)
c00039d8:	00682223          	sw	t1,4(a6)
c00039dc:	00e8a823          	sw	a4,16(a7)
c00039e0:	0108a623          	sw	a6,12(a7)
c00039e4:	40d586b3          	sub	a3,a1,a3
c00039e8:	00d62423          	sw	a3,8(a2)
c00039ec:	ffd00713          	li	a4,-3
c00039f0:	ff878793          	addi	a5,a5,-8
c00039f4:	60e7a02f          	amoand.w	zero,a4,(a5)
c00039f8:	00008067          	ret
c00039fc:	ff010113          	addi	sp,sp,-16
c0003a00:	00004697          	auipc	a3,0x4
c0003a04:	f7068693          	addi	a3,a3,-144 # c0007970 <commands+0x13cc>
c0003a08:	00003617          	auipc	a2,0x3
c0003a0c:	2bc60613          	addi	a2,a2,700 # c0006cc4 <commands+0x720>
c0003a10:	06200593          	li	a1,98
c0003a14:	00004517          	auipc	a0,0x4
c0003a18:	f4450513          	addi	a0,a0,-188 # c0007958 <commands+0x13b4>
c0003a1c:	00112623          	sw	ra,12(sp)
c0003a20:	82dfc0ef          	jal	ra,c000024c <__panic>

c0003a24 <get_pgtable_items.isra.4.part.5>:
c0003a24:	00050313          	mv	t1,a0
c0003a28:	04a5f063          	bleu	a0,a1,c0003a68 <get_pgtable_items.isra.4.part.5+0x44>
c0003a2c:	00259813          	slli	a6,a1,0x2
c0003a30:	010608b3          	add	a7,a2,a6
c0003a34:	0008a783          	lw	a5,0(a7)
c0003a38:	0017f793          	andi	a5,a5,1
c0003a3c:	02079a63          	bnez	a5,c0003a70 <get_pgtable_items.isra.4.part.5+0x4c>
c0003a40:	00480813          	addi	a6,a6,4
c0003a44:	01060833          	add	a6,a2,a6
c0003a48:	0140006f          	j	c0003a5c <get_pgtable_items.isra.4.part.5+0x38>
c0003a4c:	00082783          	lw	a5,0(a6)
c0003a50:	00480813          	addi	a6,a6,4
c0003a54:	0017f793          	andi	a5,a5,1
c0003a58:	00079c63          	bnez	a5,c0003a70 <get_pgtable_items.isra.4.part.5+0x4c>
c0003a5c:	00158593          	addi	a1,a1,1
c0003a60:	00080893          	mv	a7,a6
c0003a64:	fe6594e3          	bne	a1,t1,c0003a4c <get_pgtable_items.isra.4.part.5+0x28>
c0003a68:	00000513          	li	a0,0
c0003a6c:	00008067          	ret
c0003a70:	00068463          	beqz	a3,c0003a78 <get_pgtable_items.isra.4.part.5+0x54>
c0003a74:	00b6a023          	sw	a1,0(a3)
c0003a78:	0008a503          	lw	a0,0(a7)
c0003a7c:	00158593          	addi	a1,a1,1
c0003a80:	01f57513          	andi	a0,a0,31
c0003a84:	0265fe63          	bleu	t1,a1,c0003ac0 <get_pgtable_items.isra.4.part.5+0x9c>
c0003a88:	00259793          	slli	a5,a1,0x2
c0003a8c:	00f606b3          	add	a3,a2,a5
c0003a90:	0006a683          	lw	a3,0(a3)
c0003a94:	01f6f693          	andi	a3,a3,31
c0003a98:	02a69463          	bne	a3,a0,c0003ac0 <get_pgtable_items.isra.4.part.5+0x9c>
c0003a9c:	ffc78793          	addi	a5,a5,-4
c0003aa0:	00f60633          	add	a2,a2,a5
c0003aa4:	0140006f          	j	c0003ab8 <get_pgtable_items.isra.4.part.5+0x94>
c0003aa8:	00862783          	lw	a5,8(a2)
c0003aac:	00460613          	addi	a2,a2,4
c0003ab0:	01f7f793          	andi	a5,a5,31
c0003ab4:	00d79663          	bne	a5,a3,c0003ac0 <get_pgtable_items.isra.4.part.5+0x9c>
c0003ab8:	00158593          	addi	a1,a1,1
c0003abc:	fe65e6e3          	bltu	a1,t1,c0003aa8 <get_pgtable_items.isra.4.part.5+0x84>
c0003ac0:	00070663          	beqz	a4,c0003acc <get_pgtable_items.isra.4.part.5+0xa8>
c0003ac4:	00b72023          	sw	a1,0(a4)
c0003ac8:	00008067          	ret
c0003acc:	00008067          	ret

c0003ad0 <pa2page.part.6>:
c0003ad0:	ff010113          	addi	sp,sp,-16
c0003ad4:	00003617          	auipc	a2,0x3
c0003ad8:	4ec60613          	addi	a2,a2,1260 # c0006fc0 <commands+0xa1c>
c0003adc:	06200593          	li	a1,98
c0003ae0:	00003517          	auipc	a0,0x3
c0003ae4:	50050513          	addi	a0,a0,1280 # c0006fe0 <commands+0xa3c>
c0003ae8:	00112623          	sw	ra,12(sp)
c0003aec:	f60fc0ef          	jal	ra,c000024c <__panic>

c0003af0 <alloc_pages>:
c0003af0:	ff010113          	addi	sp,sp,-16
c0003af4:	00812423          	sw	s0,8(sp)
c0003af8:	01212023          	sw	s2,0(sp)
c0003afc:	00112623          	sw	ra,12(sp)
c0003b00:	00912223          	sw	s1,4(sp)
c0003b04:	00050413          	mv	s0,a0
c0003b08:	00100913          	li	s2,1
c0003b0c:	0400006f          	j	c0003b4c <alloc_pages+0x5c>
c0003b10:	00011797          	auipc	a5,0x11
c0003b14:	a2c7a783          	lw	a5,-1492(a5) # c001453c <pmm_manager>
c0003b18:	00c7a783          	lw	a5,12(a5)
c0003b1c:	000780e7          	jalr	a5
c0003b20:	00050493          	mv	s1,a0
c0003b24:	00000613          	li	a2,0
c0003b28:	00040593          	mv	a1,s0
c0003b2c:	04049e63          	bnez	s1,c0003b88 <alloc_pages+0x98>
c0003b30:	04896c63          	bltu	s2,s0,c0003b88 <alloc_pages+0x98>
c0003b34:	00011797          	auipc	a5,0x11
c0003b38:	9307a783          	lw	a5,-1744(a5) # c0014464 <swap_init_ok>
c0003b3c:	04078663          	beqz	a5,c0003b88 <alloc_pages+0x98>
c0003b40:	00011517          	auipc	a0,0x11
c0003b44:	94852503          	lw	a0,-1720(a0) # c0014488 <check_mm_struct>
c0003b48:	f3dfe0ef          	jal	ra,c0002a84 <swap_out>
c0003b4c:	100027f3          	csrr	a5,sstatus
c0003b50:	0027f793          	andi	a5,a5,2
c0003b54:	00040513          	mv	a0,s0
c0003b58:	fa078ce3          	beqz	a5,c0003b10 <alloc_pages+0x20>
c0003b5c:	c5dfc0ef          	jal	ra,c00007b8 <intr_disable>
c0003b60:	00011797          	auipc	a5,0x11
c0003b64:	9dc7a783          	lw	a5,-1572(a5) # c001453c <pmm_manager>
c0003b68:	00c7a783          	lw	a5,12(a5)
c0003b6c:	00040513          	mv	a0,s0
c0003b70:	000780e7          	jalr	a5
c0003b74:	00050493          	mv	s1,a0
c0003b78:	c39fc0ef          	jal	ra,c00007b0 <intr_enable>
c0003b7c:	00000613          	li	a2,0
c0003b80:	00040593          	mv	a1,s0
c0003b84:	fa0486e3          	beqz	s1,c0003b30 <alloc_pages+0x40>
c0003b88:	00c12083          	lw	ra,12(sp)
c0003b8c:	00048513          	mv	a0,s1
c0003b90:	00812403          	lw	s0,8(sp)
c0003b94:	00412483          	lw	s1,4(sp)
c0003b98:	00012903          	lw	s2,0(sp)
c0003b9c:	01010113          	addi	sp,sp,16
c0003ba0:	00008067          	ret

c0003ba4 <free_pages>:
c0003ba4:	100027f3          	csrr	a5,sstatus
c0003ba8:	0027f793          	andi	a5,a5,2
c0003bac:	00079a63          	bnez	a5,c0003bc0 <free_pages+0x1c>
c0003bb0:	00011797          	auipc	a5,0x11
c0003bb4:	98c7a783          	lw	a5,-1652(a5) # c001453c <pmm_manager>
c0003bb8:	0107a303          	lw	t1,16(a5)
c0003bbc:	00030067          	jr	t1
c0003bc0:	ff010113          	addi	sp,sp,-16
c0003bc4:	00112623          	sw	ra,12(sp)
c0003bc8:	00812423          	sw	s0,8(sp)
c0003bcc:	00912223          	sw	s1,4(sp)
c0003bd0:	00050413          	mv	s0,a0
c0003bd4:	00058493          	mv	s1,a1
c0003bd8:	be1fc0ef          	jal	ra,c00007b8 <intr_disable>
c0003bdc:	00011797          	auipc	a5,0x11
c0003be0:	9607a783          	lw	a5,-1696(a5) # c001453c <pmm_manager>
c0003be4:	0107a783          	lw	a5,16(a5)
c0003be8:	00048593          	mv	a1,s1
c0003bec:	00040513          	mv	a0,s0
c0003bf0:	000780e7          	jalr	a5
c0003bf4:	00c12083          	lw	ra,12(sp)
c0003bf8:	00812403          	lw	s0,8(sp)
c0003bfc:	00412483          	lw	s1,4(sp)
c0003c00:	01010113          	addi	sp,sp,16
c0003c04:	badfc06f          	j	c00007b0 <intr_enable>

c0003c08 <nr_free_pages>:
c0003c08:	100027f3          	csrr	a5,sstatus
c0003c0c:	0027f793          	andi	a5,a5,2
c0003c10:	00079a63          	bnez	a5,c0003c24 <nr_free_pages+0x1c>
c0003c14:	00011797          	auipc	a5,0x11
c0003c18:	9287a783          	lw	a5,-1752(a5) # c001453c <pmm_manager>
c0003c1c:	0147a303          	lw	t1,20(a5)
c0003c20:	00030067          	jr	t1
c0003c24:	ff010113          	addi	sp,sp,-16
c0003c28:	00112623          	sw	ra,12(sp)
c0003c2c:	00812423          	sw	s0,8(sp)
c0003c30:	b89fc0ef          	jal	ra,c00007b8 <intr_disable>
c0003c34:	00011797          	auipc	a5,0x11
c0003c38:	9087a783          	lw	a5,-1784(a5) # c001453c <pmm_manager>
c0003c3c:	0147a783          	lw	a5,20(a5)
c0003c40:	000780e7          	jalr	a5
c0003c44:	00050413          	mv	s0,a0
c0003c48:	b69fc0ef          	jal	ra,c00007b0 <intr_enable>
c0003c4c:	00c12083          	lw	ra,12(sp)
c0003c50:	00040513          	mv	a0,s0
c0003c54:	00812403          	lw	s0,8(sp)
c0003c58:	01010113          	addi	sp,sp,16
c0003c5c:	00008067          	ret

c0003c60 <get_pte>:
c0003c60:	fe010113          	addi	sp,sp,-32
c0003c64:	01212823          	sw	s2,16(sp)
c0003c68:	0165d913          	srli	s2,a1,0x16
c0003c6c:	00291913          	slli	s2,s2,0x2
c0003c70:	01250933          	add	s2,a0,s2
c0003c74:	00092683          	lw	a3,0(s2)
c0003c78:	00912a23          	sw	s1,20(sp)
c0003c7c:	00112e23          	sw	ra,28(sp)
c0003c80:	00812c23          	sw	s0,24(sp)
c0003c84:	01312623          	sw	s3,12(sp)
c0003c88:	0016f793          	andi	a5,a3,1
c0003c8c:	00058493          	mv	s1,a1
c0003c90:	08079663          	bnez	a5,c0003d1c <get_pte+0xbc>
c0003c94:	0c060e63          	beqz	a2,c0003d70 <get_pte+0x110>
c0003c98:	00100513          	li	a0,1
c0003c9c:	e55ff0ef          	jal	ra,c0003af0 <alloc_pages>
c0003ca0:	00050413          	mv	s0,a0
c0003ca4:	0c050663          	beqz	a0,c0003d70 <get_pte+0x110>
c0003ca8:	00011517          	auipc	a0,0x11
c0003cac:	8a052503          	lw	a0,-1888(a0) # c0014548 <pages>
c0003cb0:	00100793          	li	a5,1
c0003cb4:	40a40533          	sub	a0,s0,a0
c0003cb8:	00f42023          	sw	a5,0(s0)
c0003cbc:	40555513          	srai	a0,a0,0x5
c0003cc0:	000809b7          	lui	s3,0x80
c0003cc4:	001007b7          	lui	a5,0x100
c0003cc8:	01350533          	add	a0,a0,s3
c0003ccc:	fff78793          	addi	a5,a5,-1 # fffff <BASE_ADDRESS-0xbff00001>
c0003cd0:	00f577b3          	and	a5,a0,a5
c0003cd4:	00010717          	auipc	a4,0x10
c0003cd8:	79872703          	lw	a4,1944(a4) # c001446c <npage>
c0003cdc:	00c51513          	slli	a0,a0,0xc
c0003ce0:	0ce7f463          	bleu	a4,a5,c0003da8 <get_pte+0x148>
c0003ce4:	00011797          	auipc	a5,0x11
c0003ce8:	85c7a783          	lw	a5,-1956(a5) # c0014540 <va_pa_offset>
c0003cec:	00001637          	lui	a2,0x1
c0003cf0:	00000593          	li	a1,0
c0003cf4:	00f50533          	add	a0,a0,a5
c0003cf8:	138020ef          	jal	ra,c0005e30 <memset>
c0003cfc:	00011697          	auipc	a3,0x11
c0003d00:	84c6a683          	lw	a3,-1972(a3) # c0014548 <pages>
c0003d04:	40d406b3          	sub	a3,s0,a3
c0003d08:	4056d693          	srai	a3,a3,0x5
c0003d0c:	013686b3          	add	a3,a3,s3
c0003d10:	00a69693          	slli	a3,a3,0xa
c0003d14:	0116e693          	ori	a3,a3,17
c0003d18:	00d92023          	sw	a3,0(s2)
c0003d1c:	00269693          	slli	a3,a3,0x2
c0003d20:	fffff537          	lui	a0,0xfffff
c0003d24:	00a6f6b3          	and	a3,a3,a0
c0003d28:	00c6d713          	srli	a4,a3,0xc
c0003d2c:	00010797          	auipc	a5,0x10
c0003d30:	7407a783          	lw	a5,1856(a5) # c001446c <npage>
c0003d34:	04f77e63          	bleu	a5,a4,c0003d90 <get_pte+0x130>
c0003d38:	00c4d513          	srli	a0,s1,0xc
c0003d3c:	01c12083          	lw	ra,28(sp)
c0003d40:	3ff57513          	andi	a0,a0,1023
c0003d44:	00010797          	auipc	a5,0x10
c0003d48:	7fc7a783          	lw	a5,2044(a5) # c0014540 <va_pa_offset>
c0003d4c:	00f686b3          	add	a3,a3,a5
c0003d50:	00251513          	slli	a0,a0,0x2
c0003d54:	00a68533          	add	a0,a3,a0
c0003d58:	01812403          	lw	s0,24(sp)
c0003d5c:	01412483          	lw	s1,20(sp)
c0003d60:	01012903          	lw	s2,16(sp)
c0003d64:	00c12983          	lw	s3,12(sp)
c0003d68:	02010113          	addi	sp,sp,32
c0003d6c:	00008067          	ret
c0003d70:	01c12083          	lw	ra,28(sp)
c0003d74:	00000513          	li	a0,0
c0003d78:	01812403          	lw	s0,24(sp)
c0003d7c:	01412483          	lw	s1,20(sp)
c0003d80:	01012903          	lw	s2,16(sp)
c0003d84:	00c12983          	lw	s3,12(sp)
c0003d88:	02010113          	addi	sp,sp,32
c0003d8c:	00008067          	ret
c0003d90:	00003617          	auipc	a2,0x3
c0003d94:	49860613          	addi	a2,a2,1176 # c0007228 <commands+0xc84>
c0003d98:	12e00593          	li	a1,302
c0003d9c:	00004517          	auipc	a0,0x4
c0003da0:	c4450513          	addi	a0,a0,-956 # c00079e0 <default_pmm_manager+0x58>
c0003da4:	ca8fc0ef          	jal	ra,c000024c <__panic>
c0003da8:	00050693          	mv	a3,a0
c0003dac:	00003617          	auipc	a2,0x3
c0003db0:	47c60613          	addi	a2,a2,1148 # c0007228 <commands+0xc84>
c0003db4:	12b00593          	li	a1,299
c0003db8:	00004517          	auipc	a0,0x4
c0003dbc:	c2850513          	addi	a0,a0,-984 # c00079e0 <default_pmm_manager+0x58>
c0003dc0:	c8cfc0ef          	jal	ra,c000024c <__panic>

c0003dc4 <boot_map_segment>:
c0003dc4:	fe010113          	addi	sp,sp,-32
c0003dc8:	01312623          	sw	s3,12(sp)
c0003dcc:	000019b7          	lui	s3,0x1
c0003dd0:	00d5c7b3          	xor	a5,a1,a3
c0003dd4:	fff98813          	addi	a6,s3,-1 # fff <BASE_ADDRESS-0xbffff001>
c0003dd8:	00112e23          	sw	ra,28(sp)
c0003ddc:	00812c23          	sw	s0,24(sp)
c0003de0:	00912a23          	sw	s1,20(sp)
c0003de4:	01212823          	sw	s2,16(sp)
c0003de8:	01412423          	sw	s4,8(sp)
c0003dec:	01512223          	sw	s5,4(sp)
c0003df0:	01612023          	sw	s6,0(sp)
c0003df4:	0107f7b3          	and	a5,a5,a6
c0003df8:	0a079c63          	bnez	a5,c0003eb0 <boot_map_segment+0xec>
c0003dfc:	010607b3          	add	a5,a2,a6
c0003e00:	0105f833          	and	a6,a1,a6
c0003e04:	010787b3          	add	a5,a5,a6
c0003e08:	fffff937          	lui	s2,0xfffff
c0003e0c:	00c7d793          	srli	a5,a5,0xc
c0003e10:	0125f5b3          	and	a1,a1,s2
c0003e14:	0126f6b3          	and	a3,a3,s2
c0003e18:	04078863          	beqz	a5,c0003e68 <boot_map_segment+0xa4>
c0003e1c:	00c79793          	slli	a5,a5,0xc
c0003e20:	00100b13          	li	s6,1
c0003e24:	00050a93          	mv	s5,a0
c0003e28:	00058413          	mv	s0,a1
c0003e2c:	00b784b3          	add	s1,a5,a1
c0003e30:	40b68933          	sub	s2,a3,a1
c0003e34:	01676a33          	or	s4,a4,s6
c0003e38:	000b0613          	mv	a2,s6
c0003e3c:	00040593          	mv	a1,s0
c0003e40:	000a8513          	mv	a0,s5
c0003e44:	e1dff0ef          	jal	ra,c0003c60 <get_pte>
c0003e48:	008907b3          	add	a5,s2,s0
c0003e4c:	04050263          	beqz	a0,c0003e90 <boot_map_segment+0xcc>
c0003e50:	00c7d793          	srli	a5,a5,0xc
c0003e54:	00a79793          	slli	a5,a5,0xa
c0003e58:	0147e7b3          	or	a5,a5,s4
c0003e5c:	00f52023          	sw	a5,0(a0)
c0003e60:	01340433          	add	s0,s0,s3
c0003e64:	fc849ae3          	bne	s1,s0,c0003e38 <boot_map_segment+0x74>
c0003e68:	01c12083          	lw	ra,28(sp)
c0003e6c:	01812403          	lw	s0,24(sp)
c0003e70:	01412483          	lw	s1,20(sp)
c0003e74:	01012903          	lw	s2,16(sp)
c0003e78:	00c12983          	lw	s3,12(sp)
c0003e7c:	00812a03          	lw	s4,8(sp)
c0003e80:	00412a83          	lw	s5,4(sp)
c0003e84:	00012b03          	lw	s6,0(sp)
c0003e88:	02010113          	addi	sp,sp,32
c0003e8c:	00008067          	ret
c0003e90:	00004697          	auipc	a3,0x4
c0003e94:	b4068693          	addi	a3,a3,-1216 # c00079d0 <default_pmm_manager+0x48>
c0003e98:	00003617          	auipc	a2,0x3
c0003e9c:	e2c60613          	addi	a2,a2,-468 # c0006cc4 <commands+0x720>
c0003ea0:	0ac00593          	li	a1,172
c0003ea4:	00004517          	auipc	a0,0x4
c0003ea8:	b3c50513          	addi	a0,a0,-1220 # c00079e0 <default_pmm_manager+0x58>
c0003eac:	ba0fc0ef          	jal	ra,c000024c <__panic>
c0003eb0:	00004697          	auipc	a3,0x4
c0003eb4:	b0868693          	addi	a3,a3,-1272 # c00079b8 <default_pmm_manager+0x30>
c0003eb8:	00003617          	auipc	a2,0x3
c0003ebc:	e0c60613          	addi	a2,a2,-500 # c0006cc4 <commands+0x720>
c0003ec0:	0a600593          	li	a1,166
c0003ec4:	00004517          	auipc	a0,0x4
c0003ec8:	b1c50513          	addi	a0,a0,-1252 # c00079e0 <default_pmm_manager+0x58>
c0003ecc:	b80fc0ef          	jal	ra,c000024c <__panic>

c0003ed0 <get_page>:
c0003ed0:	ff010113          	addi	sp,sp,-16
c0003ed4:	00812423          	sw	s0,8(sp)
c0003ed8:	00060413          	mv	s0,a2
c0003edc:	00000613          	li	a2,0
c0003ee0:	00112623          	sw	ra,12(sp)
c0003ee4:	d7dff0ef          	jal	ra,c0003c60 <get_pte>
c0003ee8:	00040463          	beqz	s0,c0003ef0 <get_page+0x20>
c0003eec:	00a42023          	sw	a0,0(s0)
c0003ef0:	04050663          	beqz	a0,c0003f3c <get_page+0x6c>
c0003ef4:	00052783          	lw	a5,0(a0)
c0003ef8:	0017f713          	andi	a4,a5,1
c0003efc:	04070063          	beqz	a4,c0003f3c <get_page+0x6c>
c0003f00:	00279793          	slli	a5,a5,0x2
c0003f04:	00c7d793          	srli	a5,a5,0xc
c0003f08:	00010717          	auipc	a4,0x10
c0003f0c:	56472703          	lw	a4,1380(a4) # c001446c <npage>
c0003f10:	04e7f063          	bleu	a4,a5,c0003f50 <get_page+0x80>
c0003f14:	fff80537          	lui	a0,0xfff80
c0003f18:	00c12083          	lw	ra,12(sp)
c0003f1c:	00a787b3          	add	a5,a5,a0
c0003f20:	00579793          	slli	a5,a5,0x5
c0003f24:	00010517          	auipc	a0,0x10
c0003f28:	62452503          	lw	a0,1572(a0) # c0014548 <pages>
c0003f2c:	00f50533          	add	a0,a0,a5
c0003f30:	00812403          	lw	s0,8(sp)
c0003f34:	01010113          	addi	sp,sp,16
c0003f38:	00008067          	ret
c0003f3c:	00c12083          	lw	ra,12(sp)
c0003f40:	00000513          	li	a0,0
c0003f44:	00812403          	lw	s0,8(sp)
c0003f48:	01010113          	addi	sp,sp,16
c0003f4c:	00008067          	ret
c0003f50:	b81ff0ef          	jal	ra,c0003ad0 <pa2page.part.6>

c0003f54 <page_remove>:
c0003f54:	ff010113          	addi	sp,sp,-16
c0003f58:	00000613          	li	a2,0
c0003f5c:	00912223          	sw	s1,4(sp)
c0003f60:	00112623          	sw	ra,12(sp)
c0003f64:	00812423          	sw	s0,8(sp)
c0003f68:	00058493          	mv	s1,a1
c0003f6c:	cf5ff0ef          	jal	ra,c0003c60 <get_pte>
c0003f70:	00050a63          	beqz	a0,c0003f84 <page_remove+0x30>
c0003f74:	00052783          	lw	a5,0(a0)
c0003f78:	00050413          	mv	s0,a0
c0003f7c:	0017f713          	andi	a4,a5,1
c0003f80:	00071c63          	bnez	a4,c0003f98 <page_remove+0x44>
c0003f84:	00c12083          	lw	ra,12(sp)
c0003f88:	00812403          	lw	s0,8(sp)
c0003f8c:	00412483          	lw	s1,4(sp)
c0003f90:	01010113          	addi	sp,sp,16
c0003f94:	00008067          	ret
c0003f98:	00279793          	slli	a5,a5,0x2
c0003f9c:	00c7d793          	srli	a5,a5,0xc
c0003fa0:	00010717          	auipc	a4,0x10
c0003fa4:	4cc72703          	lw	a4,1228(a4) # c001446c <npage>
c0003fa8:	04e7fa63          	bleu	a4,a5,c0003ffc <page_remove+0xa8>
c0003fac:	fff80537          	lui	a0,0xfff80
c0003fb0:	00a787b3          	add	a5,a5,a0
c0003fb4:	00579793          	slli	a5,a5,0x5
c0003fb8:	00010517          	auipc	a0,0x10
c0003fbc:	59052503          	lw	a0,1424(a0) # c0014548 <pages>
c0003fc0:	00f50533          	add	a0,a0,a5
c0003fc4:	00052783          	lw	a5,0(a0)
c0003fc8:	fff78793          	addi	a5,a5,-1
c0003fcc:	00f52023          	sw	a5,0(a0)
c0003fd0:	02078063          	beqz	a5,c0003ff0 <page_remove+0x9c>
c0003fd4:	00042023          	sw	zero,0(s0)
c0003fd8:	10448073          	sfence.vm	s1
c0003fdc:	00c12083          	lw	ra,12(sp)
c0003fe0:	00812403          	lw	s0,8(sp)
c0003fe4:	00412483          	lw	s1,4(sp)
c0003fe8:	01010113          	addi	sp,sp,16
c0003fec:	00008067          	ret
c0003ff0:	00100593          	li	a1,1
c0003ff4:	bb1ff0ef          	jal	ra,c0003ba4 <free_pages>
c0003ff8:	fddff06f          	j	c0003fd4 <page_remove+0x80>
c0003ffc:	ad5ff0ef          	jal	ra,c0003ad0 <pa2page.part.6>

c0004000 <page_insert>:
c0004000:	fe010113          	addi	sp,sp,-32
c0004004:	01312623          	sw	s3,12(sp)
c0004008:	00060993          	mv	s3,a2
c000400c:	00812c23          	sw	s0,24(sp)
c0004010:	00100613          	li	a2,1
c0004014:	00058413          	mv	s0,a1
c0004018:	00098593          	mv	a1,s3
c000401c:	01212823          	sw	s2,16(sp)
c0004020:	00112e23          	sw	ra,28(sp)
c0004024:	00912a23          	sw	s1,20(sp)
c0004028:	00068913          	mv	s2,a3
c000402c:	c35ff0ef          	jal	ra,c0003c60 <get_pte>
c0004030:	0c050a63          	beqz	a0,c0004104 <page_insert+0x104>
c0004034:	00042703          	lw	a4,0(s0)
c0004038:	00050493          	mv	s1,a0
c000403c:	00170793          	addi	a5,a4,1
c0004040:	00f42023          	sw	a5,0(s0)
c0004044:	00052783          	lw	a5,0(a0)
c0004048:	0017f693          	andi	a3,a5,1
c000404c:	04069863          	bnez	a3,c000409c <page_insert+0x9c>
c0004050:	00010697          	auipc	a3,0x10
c0004054:	4f86a683          	lw	a3,1272(a3) # c0014548 <pages>
c0004058:	40d40433          	sub	s0,s0,a3
c000405c:	40545413          	srai	s0,s0,0x5
c0004060:	000806b7          	lui	a3,0x80
c0004064:	00d40433          	add	s0,s0,a3
c0004068:	00a41413          	slli	s0,s0,0xa
c000406c:	00196693          	ori	a3,s2,1
c0004070:	00d466b3          	or	a3,s0,a3
c0004074:	00d4a023          	sw	a3,0(s1)
c0004078:	10498073          	sfence.vm	s3
c000407c:	00000513          	li	a0,0
c0004080:	01c12083          	lw	ra,28(sp)
c0004084:	01812403          	lw	s0,24(sp)
c0004088:	01412483          	lw	s1,20(sp)
c000408c:	01012903          	lw	s2,16(sp)
c0004090:	00c12983          	lw	s3,12(sp)
c0004094:	02010113          	addi	sp,sp,32
c0004098:	00008067          	ret
c000409c:	00279793          	slli	a5,a5,0x2
c00040a0:	00c7d793          	srli	a5,a5,0xc
c00040a4:	00010697          	auipc	a3,0x10
c00040a8:	3c86a683          	lw	a3,968(a3) # c001446c <npage>
c00040ac:	06d7f063          	bleu	a3,a5,c000410c <page_insert+0x10c>
c00040b0:	fff80537          	lui	a0,0xfff80
c00040b4:	00a78533          	add	a0,a5,a0
c00040b8:	00010697          	auipc	a3,0x10
c00040bc:	4906a683          	lw	a3,1168(a3) # c0014548 <pages>
c00040c0:	00551513          	slli	a0,a0,0x5
c00040c4:	00a68533          	add	a0,a3,a0
c00040c8:	00a40e63          	beq	s0,a0,c00040e4 <page_insert+0xe4>
c00040cc:	00052783          	lw	a5,0(a0) # fff80000 <sbi_remote_fence_i+0xfff80710>
c00040d0:	fff78793          	addi	a5,a5,-1
c00040d4:	00f52023          	sw	a5,0(a0)
c00040d8:	00078a63          	beqz	a5,c00040ec <page_insert+0xec>
c00040dc:	10498073          	sfence.vm	s3
c00040e0:	f79ff06f          	j	c0004058 <page_insert+0x58>
c00040e4:	00e42023          	sw	a4,0(s0)
c00040e8:	f71ff06f          	j	c0004058 <page_insert+0x58>
c00040ec:	00100593          	li	a1,1
c00040f0:	ab5ff0ef          	jal	ra,c0003ba4 <free_pages>
c00040f4:	00010697          	auipc	a3,0x10
c00040f8:	4546a683          	lw	a3,1108(a3) # c0014548 <pages>
c00040fc:	10498073          	sfence.vm	s3
c0004100:	f59ff06f          	j	c0004058 <page_insert+0x58>
c0004104:	ffc00513          	li	a0,-4
c0004108:	f79ff06f          	j	c0004080 <page_insert+0x80>
c000410c:	9c5ff0ef          	jal	ra,c0003ad0 <pa2page.part.6>

c0004110 <tlb_invalidate>:
c0004110:	10458073          	sfence.vm	a1
c0004114:	00008067          	ret

c0004118 <pgdir_alloc_page>:
c0004118:	fe010113          	addi	sp,sp,-32
c000411c:	01212823          	sw	s2,16(sp)
c0004120:	00050913          	mv	s2,a0
c0004124:	00100513          	li	a0,1
c0004128:	00812c23          	sw	s0,24(sp)
c000412c:	00912a23          	sw	s1,20(sp)
c0004130:	01312623          	sw	s3,12(sp)
c0004134:	00112e23          	sw	ra,28(sp)
c0004138:	00058493          	mv	s1,a1
c000413c:	00060993          	mv	s3,a2
c0004140:	9b1ff0ef          	jal	ra,c0003af0 <alloc_pages>
c0004144:	00050413          	mv	s0,a0
c0004148:	02050463          	beqz	a0,c0004170 <pgdir_alloc_page+0x58>
c000414c:	00050593          	mv	a1,a0
c0004150:	00098693          	mv	a3,s3
c0004154:	00048613          	mv	a2,s1
c0004158:	00090513          	mv	a0,s2
c000415c:	ea5ff0ef          	jal	ra,c0004000 <page_insert>
c0004160:	06051c63          	bnez	a0,c00041d8 <pgdir_alloc_page+0xc0>
c0004164:	00010797          	auipc	a5,0x10
c0004168:	3007a783          	lw	a5,768(a5) # c0014464 <swap_init_ok>
c000416c:	02079263          	bnez	a5,c0004190 <pgdir_alloc_page+0x78>
c0004170:	01c12083          	lw	ra,28(sp)
c0004174:	00040513          	mv	a0,s0
c0004178:	01412483          	lw	s1,20(sp)
c000417c:	01812403          	lw	s0,24(sp)
c0004180:	01012903          	lw	s2,16(sp)
c0004184:	00c12983          	lw	s3,12(sp)
c0004188:	02010113          	addi	sp,sp,32
c000418c:	00008067          	ret
c0004190:	00000693          	li	a3,0
c0004194:	00040613          	mv	a2,s0
c0004198:	00048593          	mv	a1,s1
c000419c:	00010517          	auipc	a0,0x10
c00041a0:	2ec52503          	lw	a0,748(a0) # c0014488 <check_mm_struct>
c00041a4:	8d1fe0ef          	jal	ra,c0002a74 <swap_map_swappable>
c00041a8:	00042703          	lw	a4,0(s0)
c00041ac:	00942e23          	sw	s1,28(s0)
c00041b0:	00100793          	li	a5,1
c00041b4:	faf70ee3          	beq	a4,a5,c0004170 <pgdir_alloc_page+0x58>
c00041b8:	00004697          	auipc	a3,0x4
c00041bc:	83868693          	addi	a3,a3,-1992 # c00079f0 <default_pmm_manager+0x68>
c00041c0:	00003617          	auipc	a2,0x3
c00041c4:	b0460613          	addi	a2,a2,-1276 # c0006cc4 <commands+0x720>
c00041c8:	19d00593          	li	a1,413
c00041cc:	00004517          	auipc	a0,0x4
c00041d0:	81450513          	addi	a0,a0,-2028 # c00079e0 <default_pmm_manager+0x58>
c00041d4:	878fc0ef          	jal	ra,c000024c <__panic>
c00041d8:	00040513          	mv	a0,s0
c00041dc:	00100593          	li	a1,1
c00041e0:	9c5ff0ef          	jal	ra,c0003ba4 <free_pages>
c00041e4:	00000413          	li	s0,0
c00041e8:	f89ff06f          	j	c0004170 <pgdir_alloc_page+0x58>

c00041ec <print_pgdir>:
c00041ec:	fa010113          	addi	sp,sp,-96
c00041f0:	00004517          	auipc	a0,0x4
c00041f4:	d4c50513          	addi	a0,a0,-692 # c0007f3c <default_pmm_manager+0x5b4>
c00041f8:	05212823          	sw	s2,80(sp)
c00041fc:	04112e23          	sw	ra,92(sp)
c0004200:	04812c23          	sw	s0,88(sp)
c0004204:	04912a23          	sw	s1,84(sp)
c0004208:	05312623          	sw	s3,76(sp)
c000420c:	05412423          	sw	s4,72(sp)
c0004210:	05512223          	sw	s5,68(sp)
c0004214:	05612023          	sw	s6,64(sp)
c0004218:	03712e23          	sw	s7,60(sp)
c000421c:	03812c23          	sw	s8,56(sp)
c0004220:	03912a23          	sw	s9,52(sp)
c0004224:	03a12823          	sw	s10,48(sp)
c0004228:	03b12623          	sw	s11,44(sp)
c000422c:	eadfb0ef          	jal	ra,c00000d8 <cprintf>
c0004230:	00000593          	li	a1,0
c0004234:	00012a23          	sw	zero,20(sp)
c0004238:	02d00913          	li	s2,45
c000423c:	01410713          	addi	a4,sp,20
c0004240:	01010693          	addi	a3,sp,16
c0004244:	fafec637          	lui	a2,0xfafec
c0004248:	40000513          	li	a0,1024
c000424c:	fd8ff0ef          	jal	ra,c0003a24 <get_pgtable_items.isra.4.part.5>
c0004250:	00050413          	mv	s0,a0
c0004254:	08050263          	beqz	a0,c00042d8 <print_pgdir+0xec>
c0004258:	01412583          	lw	a1,20(sp)
c000425c:	01012783          	lw	a5,16(sp)
c0004260:	01047513          	andi	a0,s0,16
c0004264:	01659693          	slli	a3,a1,0x16
c0004268:	40f585b3          	sub	a1,a1,a5
c000426c:	01679613          	slli	a2,a5,0x16
c0004270:	01659713          	slli	a4,a1,0x16
c0004274:	00090313          	mv	t1,s2
c0004278:	00050463          	beqz	a0,c0004280 <print_pgdir+0x94>
c000427c:	07500313          	li	t1,117
c0004280:	00010b17          	auipc	s6,0x10
c0004284:	1f0b0b13          	addi	s6,s6,496 # c0014470 <str.1583>
c0004288:	07200793          	li	a5,114
c000428c:	006b0023          	sb	t1,0(s6)
c0004290:	00fb00a3          	sb	a5,1(s6)
c0004294:	00447793          	andi	a5,s0,4
c0004298:	00090313          	mv	t1,s2
c000429c:	00078463          	beqz	a5,c00042a4 <print_pgdir+0xb8>
c00042a0:	07700313          	li	t1,119
c00042a4:	00010797          	auipc	a5,0x10
c00042a8:	1cc78793          	addi	a5,a5,460 # c0014470 <str.1583>
c00042ac:	00004517          	auipc	a0,0x4
c00042b0:	cc450513          	addi	a0,a0,-828 # c0007f70 <default_pmm_manager+0x5e8>
c00042b4:	006b0123          	sb	t1,2(s6)
c00042b8:	000b01a3          	sb	zero,3(s6)
c00042bc:	e1dfb0ef          	jal	ra,c00000d8 <cprintf>
c00042c0:	00f47413          	andi	s0,s0,15
c00042c4:	00100793          	li	a5,1
c00042c8:	04f40c63          	beq	s0,a5,c0004320 <print_pgdir+0x134>
c00042cc:	01412583          	lw	a1,20(sp)
c00042d0:	3ff00793          	li	a5,1023
c00042d4:	f6b7f4e3          	bleu	a1,a5,c000423c <print_pgdir+0x50>
c00042d8:	00004517          	auipc	a0,0x4
c00042dc:	cdc50513          	addi	a0,a0,-804 # c0007fb4 <default_pmm_manager+0x62c>
c00042e0:	df9fb0ef          	jal	ra,c00000d8 <cprintf>
c00042e4:	05c12083          	lw	ra,92(sp)
c00042e8:	05812403          	lw	s0,88(sp)
c00042ec:	05412483          	lw	s1,84(sp)
c00042f0:	05012903          	lw	s2,80(sp)
c00042f4:	04c12983          	lw	s3,76(sp)
c00042f8:	04812a03          	lw	s4,72(sp)
c00042fc:	04412a83          	lw	s5,68(sp)
c0004300:	04012b03          	lw	s6,64(sp)
c0004304:	03c12b83          	lw	s7,60(sp)
c0004308:	03812c03          	lw	s8,56(sp)
c000430c:	03412c83          	lw	s9,52(sp)
c0004310:	03012d03          	lw	s10,48(sp)
c0004314:	02c12d83          	lw	s11,44(sp)
c0004318:	06010113          	addi	sp,sp,96
c000431c:	00008067          	ret
c0004320:	01012783          	lw	a5,16(sp)
c0004324:	00000413          	li	s0,0
c0004328:	00a79c93          	slli	s9,a5,0xa
c000432c:	00c79313          	slli	t1,a5,0xc
c0004330:	00279d93          	slli	s11,a5,0x2
c0004334:	00f12623          	sw	a5,12(sp)
c0004338:	fafec7b7          	lui	a5,0xfafec
c000433c:	01912e23          	sw	s9,28(sp)
c0004340:	40600ab3          	neg	s5,t1
c0004344:	400c8c93          	addi	s9,s9,1024
c0004348:	00fd8db3          	add	s11,s11,a5
c000434c:	0140006f          	j	c0004360 <print_pgdir+0x174>
c0004350:	fffff7b7          	lui	a5,0xfffff
c0004354:	00fa8ab3          	add	s5,s5,a5
c0004358:	400c8c93          	addi	s9,s9,1024
c000435c:	004d8d93          	addi	s11,s11,4
c0004360:	01412583          	lw	a1,20(sp)
c0004364:	00c12783          	lw	a5,12(sp)
c0004368:	10b7fa63          	bleu	a1,a5,c000447c <print_pgdir+0x290>
c000436c:	00178793          	addi	a5,a5,1 # fffff001 <sbi_remote_fence_i+0xfffff711>
c0004370:	00f12623          	sw	a5,12(sp)
c0004374:	000da783          	lw	a5,0(s11)
c0004378:	fffff4b7          	lui	s1,0xfffff
c000437c:	00010717          	auipc	a4,0x10
c0004380:	0f072703          	lw	a4,240(a4) # c001446c <npage>
c0004384:	00279793          	slli	a5,a5,0x2
c0004388:	0097f7b3          	and	a5,a5,s1
c000438c:	00c7d693          	srli	a3,a5,0xc
c0004390:	01c12583          	lw	a1,28(sp)
c0004394:	07700a13          	li	s4,119
c0004398:	00010997          	auipc	s3,0x10
c000439c:	0d898993          	addi	s3,s3,216 # c0014470 <str.1583>
c00043a0:	0ae6fc63          	bleu	a4,a3,c0004458 <print_pgdir+0x26c>
c00043a4:	fb95f6e3          	bleu	s9,a1,c0004350 <print_pgdir+0x164>
c00043a8:	00010697          	auipc	a3,0x10
c00043ac:	1986a683          	lw	a3,408(a3) # c0014540 <va_pa_offset>
c00043b0:	00d787b3          	add	a5,a5,a3
c00043b4:	01c10713          	addi	a4,sp,28
c00043b8:	01810693          	addi	a3,sp,24
c00043bc:	01578633          	add	a2,a5,s5
c00043c0:	000c8513          	mv	a0,s9
c00043c4:	e60ff0ef          	jal	ra,c0003a24 <get_pgtable_items.isra.4.part.5>
c00043c8:	00050d13          	mv	s10,a0
c00043cc:	f80502e3          	beqz	a0,c0004350 <print_pgdir+0x164>
c00043d0:	0aa40263          	beq	s0,a0,c0004474 <print_pgdir+0x288>
c00043d4:	04040c63          	beqz	s0,c000442c <print_pgdir+0x240>
c00043d8:	417c05b3          	sub	a1,s8,s7
c00043dc:	01047793          	andi	a5,s0,16
c00043e0:	00cb9613          	slli	a2,s7,0xc
c00043e4:	00cc1693          	slli	a3,s8,0xc
c00043e8:	00c59713          	slli	a4,a1,0xc
c00043ec:	00090513          	mv	a0,s2
c00043f0:	00078463          	beqz	a5,c00043f8 <print_pgdir+0x20c>
c00043f4:	07500513          	li	a0,117
c00043f8:	07200793          	li	a5,114
c00043fc:	00ab0023          	sb	a0,0(s6)
c0004400:	00fb00a3          	sb	a5,1(s6)
c0004404:	00447413          	andi	s0,s0,4
c0004408:	000a0e13          	mv	t3,s4
c000440c:	00041463          	bnez	s0,c0004414 <print_pgdir+0x228>
c0004410:	00090e13          	mv	t3,s2
c0004414:	00098793          	mv	a5,s3
c0004418:	00004517          	auipc	a0,0x4
c000441c:	b7850513          	addi	a0,a0,-1160 # c0007f90 <default_pmm_manager+0x608>
c0004420:	01cb0123          	sb	t3,2(s6)
c0004424:	000b01a3          	sb	zero,3(s6)
c0004428:	cb1fb0ef          	jal	ra,c00000d8 <cprintf>
c000442c:	01812b83          	lw	s7,24(sp)
c0004430:	01c12c03          	lw	s8,28(sp)
c0004434:	000da783          	lw	a5,0(s11)
c0004438:	00010717          	auipc	a4,0x10
c000443c:	03472703          	lw	a4,52(a4) # c001446c <npage>
c0004440:	000c0593          	mv	a1,s8
c0004444:	00279793          	slli	a5,a5,0x2
c0004448:	0097f7b3          	and	a5,a5,s1
c000444c:	00c7d693          	srli	a3,a5,0xc
c0004450:	000d0413          	mv	s0,s10
c0004454:	f4e6e8e3          	bltu	a3,a4,c00043a4 <print_pgdir+0x1b8>
c0004458:	00078693          	mv	a3,a5
c000445c:	00003617          	auipc	a2,0x3
c0004460:	dcc60613          	addi	a2,a2,-564 # c0007228 <commands+0xc84>
c0004464:	24500593          	li	a1,581
c0004468:	00003517          	auipc	a0,0x3
c000446c:	57850513          	addi	a0,a0,1400 # c00079e0 <default_pmm_manager+0x58>
c0004470:	dddfb0ef          	jal	ra,c000024c <__panic>
c0004474:	01c12c03          	lw	s8,28(sp)
c0004478:	fbdff06f          	j	c0004434 <print_pgdir+0x248>
c000447c:	e4040ae3          	beqz	s0,c00042d0 <print_pgdir+0xe4>
c0004480:	417c05b3          	sub	a1,s8,s7
c0004484:	01047793          	andi	a5,s0,16
c0004488:	00cb9613          	slli	a2,s7,0xc
c000448c:	00cc1693          	slli	a3,s8,0xc
c0004490:	00c59713          	slli	a4,a1,0xc
c0004494:	00090513          	mv	a0,s2
c0004498:	00078463          	beqz	a5,c00044a0 <print_pgdir+0x2b4>
c000449c:	07500513          	li	a0,117
c00044a0:	07200793          	li	a5,114
c00044a4:	00ab0023          	sb	a0,0(s6)
c00044a8:	00fb00a3          	sb	a5,1(s6)
c00044ac:	00447413          	andi	s0,s0,4
c00044b0:	00090313          	mv	t1,s2
c00044b4:	00040463          	beqz	s0,c00044bc <print_pgdir+0x2d0>
c00044b8:	07700313          	li	t1,119
c00044bc:	00010797          	auipc	a5,0x10
c00044c0:	fb478793          	addi	a5,a5,-76 # c0014470 <str.1583>
c00044c4:	00004517          	auipc	a0,0x4
c00044c8:	acc50513          	addi	a0,a0,-1332 # c0007f90 <default_pmm_manager+0x608>
c00044cc:	006b0123          	sb	t1,2(s6)
c00044d0:	000b01a3          	sb	zero,3(s6)
c00044d4:	c05fb0ef          	jal	ra,c00000d8 <cprintf>
c00044d8:	df5ff06f          	j	c00042cc <print_pgdir+0xe0>

c00044dc <pmm_init>:
c00044dc:	fe010113          	addi	sp,sp,-32
c00044e0:	00003597          	auipc	a1,0x3
c00044e4:	4a85a583          	lw	a1,1192(a1) # c0007988 <default_pmm_manager>
c00044e8:	00003797          	auipc	a5,0x3
c00044ec:	4a078793          	addi	a5,a5,1184 # c0007988 <default_pmm_manager>
c00044f0:	00003517          	auipc	a0,0x3
c00044f4:	51450513          	addi	a0,a0,1300 # c0007a04 <default_pmm_manager+0x7c>
c00044f8:	00112e23          	sw	ra,28(sp)
c00044fc:	00812c23          	sw	s0,24(sp)
c0004500:	00912a23          	sw	s1,20(sp)
c0004504:	01212823          	sw	s2,16(sp)
c0004508:	00010297          	auipc	t0,0x10
c000450c:	02f2aa23          	sw	a5,52(t0) # c001453c <pmm_manager>
c0004510:	bc9fb0ef          	jal	ra,c00000d8 <cprintf>
c0004514:	00010797          	auipc	a5,0x10
c0004518:	0287a783          	lw	a5,40(a5) # c001453c <pmm_manager>
c000451c:	0047a783          	lw	a5,4(a5)
c0004520:	000780e7          	jalr	a5
c0004524:	3fffb317          	auipc	t1,0x3fffb
c0004528:	2dc300e7          	jalr	732(t1) # fffff800 <sbi_hart_id>
c000452c:	00410593          	addi	a1,sp,4
c0004530:	3fffb317          	auipc	t1,0x3fffb
c0004534:	2f0300e7          	jalr	752(t1) # fffff820 <sbi_query_memory>
c0004538:	32051ce3          	bnez	a0,c0005070 <pmm_init+0xb94>
c000453c:	00412483          	lw	s1,4(sp)
c0004540:	00812903          	lw	s2,8(sp)
c0004544:	c00007b7          	lui	a5,0xc0000
c0004548:	409787b3          	sub	a5,a5,s1
c000454c:	00003517          	auipc	a0,0x3
c0004550:	4fc50513          	addi	a0,a0,1276 # c0007a48 <default_pmm_manager+0xc0>
c0004554:	00010297          	auipc	t0,0x10
c0004558:	fef2a623          	sw	a5,-20(t0) # c0014540 <va_pa_offset>
c000455c:	01248433          	add	s0,s1,s2
c0004560:	b79fb0ef          	jal	ra,c00000d8 <cprintf>
c0004564:	00048613          	mv	a2,s1
c0004568:	fff40693          	addi	a3,s0,-1
c000456c:	00090593          	mv	a1,s2
c0004570:	00003517          	auipc	a0,0x3
c0004574:	4f050513          	addi	a0,a0,1264 # c0007a60 <default_pmm_manager+0xd8>
c0004578:	b61fb0ef          	jal	ra,c00000d8 <cprintf>
c000457c:	f80007b7          	lui	a5,0xf8000
c0004580:	00040613          	mv	a2,s0
c0004584:	0087f463          	bleu	s0,a5,c000458c <pmm_init+0xb0>
c0004588:	00078613          	mv	a2,a5
c000458c:	00c65613          	srli	a2,a2,0xc
c0004590:	00010297          	auipc	t0,0x10
c0004594:	ecc2ae23          	sw	a2,-292(t0) # c001446c <npage>
c0004598:	180027f3          	csrr	a5,sptbr
c000459c:	00100737          	lui	a4,0x100
c00045a0:	fff70713          	addi	a4,a4,-1 # fffff <BASE_ADDRESS-0xbff00001>
c00045a4:	00e7f733          	and	a4,a5,a4
c00045a8:	00c79793          	slli	a5,a5,0xc
c00045ac:	3ec77ae3          	bleu	a2,a4,c00051a0 <pmm_init+0xcc4>
c00045b0:	00010317          	auipc	t1,0x10
c00045b4:	f9032303          	lw	t1,-112(t1) # c0014540 <va_pa_offset>
c00045b8:	00002737          	lui	a4,0x2
c00045bc:	006787b3          	add	a5,a5,t1
c00045c0:	00e787b3          	add	a5,a5,a4
c00045c4:	00001737          	lui	a4,0x1
c00045c8:	fff70713          	addi	a4,a4,-1 # fff <BASE_ADDRESS-0xbffff001>
c00045cc:	00e787b3          	add	a5,a5,a4
c00045d0:	fffff737          	lui	a4,0xfffff
c00045d4:	00e7f7b3          	and	a5,a5,a4
c00045d8:	00010297          	auipc	t0,0x10
c00045dc:	f6f2a823          	sw	a5,-144(t0) # c0014548 <pages>
c00045e0:	000805b7          	lui	a1,0x80
c00045e4:	68b60463          	beq	a2,a1,c0004c6c <pmm_init+0x790>
c00045e8:	00010817          	auipc	a6,0x10
c00045ec:	e8482803          	lw	a6,-380(a6) # c001446c <npage>
c00045f0:	00000713          	li	a4,0
c00045f4:	00078513          	mv	a0,a5
c00045f8:	00100893          	li	a7,1
c00045fc:	40b805b3          	sub	a1,a6,a1
c0004600:	0080006f          	j	c0004608 <pmm_init+0x12c>
c0004604:	00050793          	mv	a5,a0
c0004608:	00571693          	slli	a3,a4,0x5
c000460c:	00d787b3          	add	a5,a5,a3
c0004610:	00478793          	addi	a5,a5,4 # f8000004 <sbi_remote_fence_i+0xf8000714>
c0004614:	4117a02f          	amoor.w	zero,a7,(a5)
c0004618:	00170713          	addi	a4,a4,1 # fffff001 <sbi_remote_fence_i+0xfffff711>
c000461c:	00080613          	mv	a2,a6
c0004620:	feb762e3          	bltu	a4,a1,c0004604 <pmm_init+0x128>
c0004624:	07f806b7          	lui	a3,0x7f80
c0004628:	00d606b3          	add	a3,a2,a3
c000462c:	00569693          	slli	a3,a3,0x5
c0004630:	00d506b3          	add	a3,a0,a3
c0004634:	c00007b7          	lui	a5,0xc0000
c0004638:	3af6e2e3          	bltu	a3,a5,c00051dc <pmm_init+0xd00>
c000463c:	fffff737          	lui	a4,0xfffff
c0004640:	406686b3          	sub	a3,a3,t1
c0004644:	00e47433          	and	s0,s0,a4
c0004648:	0486f263          	bleu	s0,a3,c000468c <pmm_init+0x1b0>
c000464c:	000017b7          	lui	a5,0x1
c0004650:	fff78793          	addi	a5,a5,-1 # fff <BASE_ADDRESS-0xbffff001>
c0004654:	00f686b3          	add	a3,a3,a5
c0004658:	00c6d793          	srli	a5,a3,0xc
c000465c:	10c7f2e3          	bleu	a2,a5,c0004f60 <pmm_init+0xa84>
c0004660:	00e6f6b3          	and	a3,a3,a4
c0004664:	fff80737          	lui	a4,0xfff80
c0004668:	00e787b3          	add	a5,a5,a4
c000466c:	00010717          	auipc	a4,0x10
c0004670:	ed072703          	lw	a4,-304(a4) # c001453c <pmm_manager>
c0004674:	00872703          	lw	a4,8(a4)
c0004678:	40d406b3          	sub	a3,s0,a3
c000467c:	00579793          	slli	a5,a5,0x5
c0004680:	00c6d593          	srli	a1,a3,0xc
c0004684:	00f50533          	add	a0,a0,a5
c0004688:	000700e7          	jalr	a4
c000468c:	00010797          	auipc	a5,0x10
c0004690:	eb07a783          	lw	a5,-336(a5) # c001453c <pmm_manager>
c0004694:	0187a783          	lw	a5,24(a5)
c0004698:	000780e7          	jalr	a5
c000469c:	00003517          	auipc	a0,0x3
c00046a0:	3ec50513          	addi	a0,a0,1004 # c0007a88 <default_pmm_manager+0x100>
c00046a4:	a35fb0ef          	jal	ra,c00000d8 <cprintf>
c00046a8:	00100513          	li	a0,1
c00046ac:	c44ff0ef          	jal	ra,c0003af0 <alloc_pages>
c00046b0:	08050ce3          	beqz	a0,c0004f48 <pmm_init+0xa6c>
c00046b4:	00010797          	auipc	a5,0x10
c00046b8:	e947a783          	lw	a5,-364(a5) # c0014548 <pages>
c00046bc:	40f507b3          	sub	a5,a0,a5
c00046c0:	00080737          	lui	a4,0x80
c00046c4:	4057d793          	srai	a5,a5,0x5
c00046c8:	00e787b3          	add	a5,a5,a4
c00046cc:	00100737          	lui	a4,0x100
c00046d0:	fff70713          	addi	a4,a4,-1 # fffff <BASE_ADDRESS-0xbff00001>
c00046d4:	00e7f733          	and	a4,a5,a4
c00046d8:	00010697          	auipc	a3,0x10
c00046dc:	d946a683          	lw	a3,-620(a3) # c001446c <npage>
c00046e0:	00c79793          	slli	a5,a5,0xc
c00046e4:	7cd77463          	bleu	a3,a4,c0004eac <pmm_init+0x9d0>
c00046e8:	00010717          	auipc	a4,0x10
c00046ec:	e5872703          	lw	a4,-424(a4) # c0014540 <va_pa_offset>
c00046f0:	00e787b3          	add	a5,a5,a4
c00046f4:	00078513          	mv	a0,a5
c00046f8:	00001637          	lui	a2,0x1
c00046fc:	00000593          	li	a1,0
c0004700:	00010297          	auipc	t0,0x10
c0004704:	d6f2a423          	sw	a5,-664(t0) # c0014468 <boot_pgdir>
c0004708:	728010ef          	jal	ra,c0005e30 <memset>
c000470c:	00010517          	auipc	a0,0x10
c0004710:	d5c52503          	lw	a0,-676(a0) # c0014468 <boot_pgdir>
c0004714:	c00007b7          	lui	a5,0xc0000
c0004718:	76f56c63          	bltu	a0,a5,c0004e90 <pmm_init+0x9b4>
c000471c:	00010797          	auipc	a5,0x10
c0004720:	e247a783          	lw	a5,-476(a5) # c0014540 <va_pa_offset>
c0004724:	40f507b3          	sub	a5,a0,a5
c0004728:	00010297          	auipc	t0,0x10
c000472c:	e0f2ae23          	sw	a5,-484(t0) # c0014544 <boot_cr3>
c0004730:	00010717          	auipc	a4,0x10
c0004734:	d3c72703          	lw	a4,-708(a4) # c001446c <npage>
c0004738:	000f87b7          	lui	a5,0xf8
c000473c:	7ee7e663          	bltu	a5,a4,c0004f28 <pmm_init+0xa4c>
c0004740:	7c050463          	beqz	a0,c0004f08 <pmm_init+0xa2c>
c0004744:	01451793          	slli	a5,a0,0x14
c0004748:	7c079063          	bnez	a5,c0004f08 <pmm_init+0xa2c>
c000474c:	00000613          	li	a2,0
c0004750:	00000593          	li	a1,0
c0004754:	f7cff0ef          	jal	ra,c0003ed0 <get_page>
c0004758:	78051863          	bnez	a0,c0004ee8 <pmm_init+0xa0c>
c000475c:	00100513          	li	a0,1
c0004760:	b90ff0ef          	jal	ra,c0003af0 <alloc_pages>
c0004764:	00050493          	mv	s1,a0
c0004768:	00050593          	mv	a1,a0
c000476c:	00000693          	li	a3,0
c0004770:	00000613          	li	a2,0
c0004774:	00010517          	auipc	a0,0x10
c0004778:	cf452503          	lw	a0,-780(a0) # c0014468 <boot_pgdir>
c000477c:	885ff0ef          	jal	ra,c0004000 <page_insert>
c0004780:	74051463          	bnez	a0,c0004ec8 <pmm_init+0x9ec>
c0004784:	00000613          	li	a2,0
c0004788:	00000593          	li	a1,0
c000478c:	00010517          	auipc	a0,0x10
c0004790:	cdc52503          	lw	a0,-804(a0) # c0014468 <boot_pgdir>
c0004794:	cccff0ef          	jal	ra,c0003c60 <get_pte>
c0004798:	04050ee3          	beqz	a0,c0004ff4 <pmm_init+0xb18>
c000479c:	00052783          	lw	a5,0(a0)
c00047a0:	0017f713          	andi	a4,a5,1
c00047a4:	02070ce3          	beqz	a4,c0004fdc <pmm_init+0xb00>
c00047a8:	00279793          	slli	a5,a5,0x2
c00047ac:	00c7d793          	srli	a5,a5,0xc
c00047b0:	00010617          	auipc	a2,0x10
c00047b4:	cbc62603          	lw	a2,-836(a2) # c001446c <npage>
c00047b8:	7ac7f463          	bleu	a2,a5,c0004f60 <pmm_init+0xa84>
c00047bc:	fff80737          	lui	a4,0xfff80
c00047c0:	00e787b3          	add	a5,a5,a4
c00047c4:	00579793          	slli	a5,a5,0x5
c00047c8:	00010717          	auipc	a4,0x10
c00047cc:	d8072703          	lw	a4,-640(a4) # c0014548 <pages>
c00047d0:	00f707b3          	add	a5,a4,a5
c00047d4:	7ef49463          	bne	s1,a5,c0004fbc <pmm_init+0xae0>
c00047d8:	0004a903          	lw	s2,0(s1) # fffff000 <sbi_remote_fence_i+0xfffff710>
c00047dc:	00100793          	li	a5,1
c00047e0:	7af91e63          	bne	s2,a5,c0004f9c <pmm_init+0xac0>
c00047e4:	00010517          	auipc	a0,0x10
c00047e8:	c8452503          	lw	a0,-892(a0) # c0014468 <boot_pgdir>
c00047ec:	00052683          	lw	a3,0(a0)
c00047f0:	fffff7b7          	lui	a5,0xfffff
c00047f4:	00269693          	slli	a3,a3,0x2
c00047f8:	00f6f6b3          	and	a3,a3,a5
c00047fc:	00c6d793          	srli	a5,a3,0xc
c0004800:	78c7f263          	bleu	a2,a5,c0004f84 <pmm_init+0xaa8>
c0004804:	00010417          	auipc	s0,0x10
c0004808:	d3c42403          	lw	s0,-708(s0) # c0014540 <va_pa_offset>
c000480c:	008686b3          	add	a3,a3,s0
c0004810:	00000613          	li	a2,0
c0004814:	000015b7          	lui	a1,0x1
c0004818:	00468413          	addi	s0,a3,4
c000481c:	c44ff0ef          	jal	ra,c0003c60 <get_pte>
c0004820:	74a41263          	bne	s0,a0,c0004f64 <pmm_init+0xa88>
c0004824:	00090513          	mv	a0,s2
c0004828:	ac8ff0ef          	jal	ra,c0003af0 <alloc_pages>
c000482c:	00050413          	mv	s0,a0
c0004830:	00050593          	mv	a1,a0
c0004834:	01400693          	li	a3,20
c0004838:	00001637          	lui	a2,0x1
c000483c:	00010517          	auipc	a0,0x10
c0004840:	c2c52503          	lw	a0,-980(a0) # c0014468 <boot_pgdir>
c0004844:	fbcff0ef          	jal	ra,c0004000 <page_insert>
c0004848:	7e051663          	bnez	a0,c0005034 <pmm_init+0xb58>
c000484c:	00000613          	li	a2,0
c0004850:	000015b7          	lui	a1,0x1
c0004854:	00010517          	auipc	a0,0x10
c0004858:	c1452503          	lw	a0,-1004(a0) # c0014468 <boot_pgdir>
c000485c:	c04ff0ef          	jal	ra,c0003c60 <get_pte>
c0004860:	7a050a63          	beqz	a0,c0005014 <pmm_init+0xb38>
c0004864:	00052783          	lw	a5,0(a0)
c0004868:	0107f713          	andi	a4,a5,16
c000486c:	5c070263          	beqz	a4,c0004e30 <pmm_init+0x954>
c0004870:	0047f793          	andi	a5,a5,4
c0004874:	58078e63          	beqz	a5,c0004e10 <pmm_init+0x934>
c0004878:	00010517          	auipc	a0,0x10
c000487c:	bf052503          	lw	a0,-1040(a0) # c0014468 <boot_pgdir>
c0004880:	00052783          	lw	a5,0(a0)
c0004884:	0107f793          	andi	a5,a5,16
c0004888:	56078463          	beqz	a5,c0004df0 <pmm_init+0x914>
c000488c:	00042903          	lw	s2,0(s0)
c0004890:	00100793          	li	a5,1
c0004894:	52f91e63          	bne	s2,a5,c0004dd0 <pmm_init+0x8f4>
c0004898:	00000693          	li	a3,0
c000489c:	00001637          	lui	a2,0x1
c00048a0:	00048593          	mv	a1,s1
c00048a4:	f5cff0ef          	jal	ra,c0004000 <page_insert>
c00048a8:	50051463          	bnez	a0,c0004db0 <pmm_init+0x8d4>
c00048ac:	0004a703          	lw	a4,0(s1)
c00048b0:	00200793          	li	a5,2
c00048b4:	4cf71e63          	bne	a4,a5,c0004d90 <pmm_init+0x8b4>
c00048b8:	00042783          	lw	a5,0(s0)
c00048bc:	4a079a63          	bnez	a5,c0004d70 <pmm_init+0x894>
c00048c0:	00000613          	li	a2,0
c00048c4:	000015b7          	lui	a1,0x1
c00048c8:	00010517          	auipc	a0,0x10
c00048cc:	ba052503          	lw	a0,-1120(a0) # c0014468 <boot_pgdir>
c00048d0:	b90ff0ef          	jal	ra,c0003c60 <get_pte>
c00048d4:	46050e63          	beqz	a0,c0004d50 <pmm_init+0x874>
c00048d8:	00052703          	lw	a4,0(a0)
c00048dc:	00177793          	andi	a5,a4,1
c00048e0:	6e078e63          	beqz	a5,c0004fdc <pmm_init+0xb00>
c00048e4:	00271793          	slli	a5,a4,0x2
c00048e8:	00c7d793          	srli	a5,a5,0xc
c00048ec:	00010697          	auipc	a3,0x10
c00048f0:	b806a683          	lw	a3,-1152(a3) # c001446c <npage>
c00048f4:	66d7f663          	bleu	a3,a5,c0004f60 <pmm_init+0xa84>
c00048f8:	fff806b7          	lui	a3,0xfff80
c00048fc:	00d787b3          	add	a5,a5,a3
c0004900:	00579793          	slli	a5,a5,0x5
c0004904:	00010697          	auipc	a3,0x10
c0004908:	c446a683          	lw	a3,-956(a3) # c0014548 <pages>
c000490c:	00f687b3          	add	a5,a3,a5
c0004910:	42f49063          	bne	s1,a5,c0004d30 <pmm_init+0x854>
c0004914:	01077713          	andi	a4,a4,16
c0004918:	3e071c63          	bnez	a4,c0004d10 <pmm_init+0x834>
c000491c:	00000593          	li	a1,0
c0004920:	00010517          	auipc	a0,0x10
c0004924:	b4852503          	lw	a0,-1208(a0) # c0014468 <boot_pgdir>
c0004928:	e2cff0ef          	jal	ra,c0003f54 <page_remove>
c000492c:	0004a783          	lw	a5,0(s1)
c0004930:	3d279063          	bne	a5,s2,c0004cf0 <pmm_init+0x814>
c0004934:	00042783          	lw	a5,0(s0)
c0004938:	38079c63          	bnez	a5,c0004cd0 <pmm_init+0x7f4>
c000493c:	000015b7          	lui	a1,0x1
c0004940:	00010517          	auipc	a0,0x10
c0004944:	b2852503          	lw	a0,-1240(a0) # c0014468 <boot_pgdir>
c0004948:	e0cff0ef          	jal	ra,c0003f54 <page_remove>
c000494c:	0004a783          	lw	a5,0(s1)
c0004950:	52079063          	bnez	a5,c0004e70 <pmm_init+0x994>
c0004954:	00042783          	lw	a5,0(s0)
c0004958:	4e079c63          	bnez	a5,c0004e50 <pmm_init+0x974>
c000495c:	00010797          	auipc	a5,0x10
c0004960:	b0c7a783          	lw	a5,-1268(a5) # c0014468 <boot_pgdir>
c0004964:	0007a783          	lw	a5,0(a5)
c0004968:	00010717          	auipc	a4,0x10
c000496c:	b0472703          	lw	a4,-1276(a4) # c001446c <npage>
c0004970:	00279793          	slli	a5,a5,0x2
c0004974:	00c7d793          	srli	a5,a5,0xc
c0004978:	5ee7f463          	bleu	a4,a5,c0004f60 <pmm_init+0xa84>
c000497c:	fff80737          	lui	a4,0xfff80
c0004980:	00e787b3          	add	a5,a5,a4
c0004984:	00579793          	slli	a5,a5,0x5
c0004988:	00010517          	auipc	a0,0x10
c000498c:	bc052503          	lw	a0,-1088(a0) # c0014548 <pages>
c0004990:	00f50533          	add	a0,a0,a5
c0004994:	00052583          	lw	a1,0(a0)
c0004998:	00100793          	li	a5,1
c000499c:	78f59263          	bne	a1,a5,c0005120 <pmm_init+0xc44>
c00049a0:	a04ff0ef          	jal	ra,c0003ba4 <free_pages>
c00049a4:	00010797          	auipc	a5,0x10
c00049a8:	ac47a783          	lw	a5,-1340(a5) # c0014468 <boot_pgdir>
c00049ac:	0007a023          	sw	zero,0(a5)
c00049b0:	00003517          	auipc	a0,0x3
c00049b4:	39c50513          	addi	a0,a0,924 # c0007d4c <default_pmm_manager+0x3c4>
c00049b8:	f20fb0ef          	jal	ra,c00000d8 <cprintf>
c00049bc:	00010797          	auipc	a5,0x10
c00049c0:	b887a783          	lw	a5,-1144(a5) # c0014544 <boot_cr3>
c00049c4:	00c7d793          	srli	a5,a5,0xc
c00049c8:	00010517          	auipc	a0,0x10
c00049cc:	aa052503          	lw	a0,-1376(a0) # c0014468 <boot_pgdir>
c00049d0:	00a79793          	slli	a5,a5,0xa
c00049d4:	00001437          	lui	s0,0x1
c00049d8:	00850733          	add	a4,a0,s0
c00049dc:	0017e693          	ori	a3,a5,1
c00049e0:	c00005b7          	lui	a1,0xc0000
c00049e4:	0077e793          	ori	a5,a5,7
c00049e8:	fad72623          	sw	a3,-84(a4) # fff7ffac <sbi_remote_fence_i+0xfff806bc>
c00049ec:	00010697          	auipc	a3,0x10
c00049f0:	b546a683          	lw	a3,-1196(a3) # c0014540 <va_pa_offset>
c00049f4:	faf72823          	sw	a5,-80(a4)
c00049f8:	40d586b3          	sub	a3,a1,a3
c00049fc:	00f00713          	li	a4,15
c0004a00:	38000637          	lui	a2,0x38000
c0004a04:	bc0ff0ef          	jal	ra,c0003dc4 <boot_map_segment>
c0004a08:	180027f3          	csrr	a5,sptbr
c0004a0c:	00100737          	lui	a4,0x100
c0004a10:	fff70713          	addi	a4,a4,-1 # fffff <BASE_ADDRESS-0xbff00001>
c0004a14:	00e7f733          	and	a4,a5,a4
c0004a18:	00010697          	auipc	a3,0x10
c0004a1c:	a546a683          	lw	a3,-1452(a3) # c001446c <npage>
c0004a20:	00c79793          	slli	a5,a5,0xc
c0004a24:	62d77863          	bleu	a3,a4,c0005054 <pmm_init+0xb78>
c0004a28:	00010517          	auipc	a0,0x10
c0004a2c:	b1852503          	lw	a0,-1256(a0) # c0014540 <va_pa_offset>
c0004a30:	00a78533          	add	a0,a5,a0
c0004a34:	00000613          	li	a2,0
c0004a38:	fff00593          	li	a1,-1
c0004a3c:	a24ff0ef          	jal	ra,c0003c60 <get_pte>
c0004a40:	00052683          	lw	a3,0(a0)
c0004a44:	fffff4b7          	lui	s1,0xfffff
c0004a48:	00b00713          	li	a4,11
c0004a4c:	00269693          	slli	a3,a3,0x2
c0004a50:	0096f6b3          	and	a3,a3,s1
c0004a54:	00040613          	mv	a2,s0
c0004a58:	00048593          	mv	a1,s1
c0004a5c:	00010517          	auipc	a0,0x10
c0004a60:	a0c52503          	lw	a0,-1524(a0) # c0014468 <boot_pgdir>
c0004a64:	b60ff0ef          	jal	ra,c0003dc4 <boot_map_segment>
c0004a68:	00010797          	auipc	a5,0x10
c0004a6c:	adc7a783          	lw	a5,-1316(a5) # c0014544 <boot_cr3>
c0004a70:	00c7d793          	srli	a5,a5,0xc
c0004a74:	18079073          	csrw	sptbr,a5
c0004a78:	00010797          	auipc	a5,0x10
c0004a7c:	9f47a783          	lw	a5,-1548(a5) # c001446c <npage>
c0004a80:	000c0437          	lui	s0,0xc0
c0004a84:	00010517          	auipc	a0,0x10
c0004a88:	9e452503          	lw	a0,-1564(a0) # c0014468 <boot_pgdir>
c0004a8c:	00f46c63          	bltu	s0,a5,c0004aa4 <pmm_init+0x5c8>
c0004a90:	04c0006f          	j	c0004adc <pmm_init+0x600>
c0004a94:	00c45793          	srli	a5,s0,0xc
c0004a98:	00010517          	auipc	a0,0x10
c0004a9c:	9d052503          	lw	a0,-1584(a0) # c0014468 <boot_pgdir>
c0004aa0:	1ee7fa63          	bleu	a4,a5,c0004c94 <pmm_init+0x7b8>
c0004aa4:	00010597          	auipc	a1,0x10
c0004aa8:	a9c5a583          	lw	a1,-1380(a1) # c0014540 <va_pa_offset>
c0004aac:	00000613          	li	a2,0
c0004ab0:	00b405b3          	add	a1,s0,a1
c0004ab4:	9acff0ef          	jal	ra,c0003c60 <get_pte>
c0004ab8:	1a050e63          	beqz	a0,c0004c74 <pmm_init+0x798>
c0004abc:	00052783          	lw	a5,0(a0)
c0004ac0:	00279793          	slli	a5,a5,0x2
c0004ac4:	0097f7b3          	and	a5,a5,s1
c0004ac8:	1e879463          	bne	a5,s0,c0004cb0 <pmm_init+0x7d4>
c0004acc:	00140413          	addi	s0,s0,1 # c0001 <BASE_ADDRESS-0xbff3ffff>
c0004ad0:	00010717          	auipc	a4,0x10
c0004ad4:	99c72703          	lw	a4,-1636(a4) # c001446c <npage>
c0004ad8:	fae46ee3          	bltu	s0,a4,c0004a94 <pmm_init+0x5b8>
c0004adc:	00010697          	auipc	a3,0x10
c0004ae0:	98c6a683          	lw	a3,-1652(a3) # c0014468 <boot_pgdir>
c0004ae4:	000014b7          	lui	s1,0x1
c0004ae8:	009687b3          	add	a5,a3,s1
c0004aec:	fac7a783          	lw	a5,-84(a5)
c0004af0:	fffff637          	lui	a2,0xfffff
c0004af4:	c0000737          	lui	a4,0xc0000
c0004af8:	00279793          	slli	a5,a5,0x2
c0004afc:	00c7f7b3          	and	a5,a5,a2
c0004b00:	60e6e463          	bltu	a3,a4,c0005108 <pmm_init+0xc2c>
c0004b04:	00010717          	auipc	a4,0x10
c0004b08:	a3c72703          	lw	a4,-1476(a4) # c0014540 <va_pa_offset>
c0004b0c:	40e68733          	sub	a4,a3,a4
c0004b10:	5ce79c63          	bne	a5,a4,c00050e8 <pmm_init+0xc0c>
c0004b14:	0006a783          	lw	a5,0(a3)
c0004b18:	5a079863          	bnez	a5,c00050c8 <pmm_init+0xbec>
c0004b1c:	00100513          	li	a0,1
c0004b20:	fd1fe0ef          	jal	ra,c0003af0 <alloc_pages>
c0004b24:	00050413          	mv	s0,a0
c0004b28:	00050593          	mv	a1,a0
c0004b2c:	00600693          	li	a3,6
c0004b30:	10000613          	li	a2,256
c0004b34:	00010517          	auipc	a0,0x10
c0004b38:	93452503          	lw	a0,-1740(a0) # c0014468 <boot_pgdir>
c0004b3c:	cc4ff0ef          	jal	ra,c0004000 <page_insert>
c0004b40:	56051463          	bnez	a0,c00050a8 <pmm_init+0xbcc>
c0004b44:	00042703          	lw	a4,0(s0)
c0004b48:	00100793          	li	a5,1
c0004b4c:	62f71a63          	bne	a4,a5,c0005180 <pmm_init+0xca4>
c0004b50:	00600693          	li	a3,6
c0004b54:	10048613          	addi	a2,s1,256 # 1100 <BASE_ADDRESS-0xbfffef00>
c0004b58:	00040593          	mv	a1,s0
c0004b5c:	00010517          	auipc	a0,0x10
c0004b60:	90c52503          	lw	a0,-1780(a0) # c0014468 <boot_pgdir>
c0004b64:	c9cff0ef          	jal	ra,c0004000 <page_insert>
c0004b68:	5e051c63          	bnez	a0,c0005160 <pmm_init+0xc84>
c0004b6c:	00042703          	lw	a4,0(s0)
c0004b70:	00200793          	li	a5,2
c0004b74:	5cf71663          	bne	a4,a5,c0005140 <pmm_init+0xc64>
c0004b78:	00003597          	auipc	a1,0x3
c0004b7c:	33058593          	addi	a1,a1,816 # c0007ea8 <default_pmm_manager+0x520>
c0004b80:	10000513          	li	a0,256
c0004b84:	230010ef          	jal	ra,c0005db4 <strcpy>
c0004b88:	10048593          	addi	a1,s1,256
c0004b8c:	10000513          	li	a0,256
c0004b90:	240010ef          	jal	ra,c0005dd0 <strcmp>
c0004b94:	62051463          	bnez	a0,c00051bc <pmm_init+0xce0>
c0004b98:	00010797          	auipc	a5,0x10
c0004b9c:	9b07a783          	lw	a5,-1616(a5) # c0014548 <pages>
c0004ba0:	40f407b3          	sub	a5,s0,a5
c0004ba4:	00080737          	lui	a4,0x80
c0004ba8:	4057d793          	srai	a5,a5,0x5
c0004bac:	00e787b3          	add	a5,a5,a4
c0004bb0:	00100737          	lui	a4,0x100
c0004bb4:	fff70713          	addi	a4,a4,-1 # fffff <BASE_ADDRESS-0xbff00001>
c0004bb8:	00e7f733          	and	a4,a5,a4
c0004bbc:	00010697          	auipc	a3,0x10
c0004bc0:	8b06a683          	lw	a3,-1872(a3) # c001446c <npage>
c0004bc4:	00c79793          	slli	a5,a5,0xc
c0004bc8:	2ed77263          	bleu	a3,a4,c0004eac <pmm_init+0x9d0>
c0004bcc:	00010717          	auipc	a4,0x10
c0004bd0:	97472703          	lw	a4,-1676(a4) # c0014540 <va_pa_offset>
c0004bd4:	00f707b3          	add	a5,a4,a5
c0004bd8:	10078023          	sb	zero,256(a5)
c0004bdc:	10000513          	li	a0,256
c0004be0:	168010ef          	jal	ra,c0005d48 <strlen>
c0004be4:	4a051263          	bnez	a0,c0005088 <pmm_init+0xbac>
c0004be8:	00100593          	li	a1,1
c0004bec:	00040513          	mv	a0,s0
c0004bf0:	fb5fe0ef          	jal	ra,c0003ba4 <free_pages>
c0004bf4:	00010797          	auipc	a5,0x10
c0004bf8:	8747a783          	lw	a5,-1932(a5) # c0014468 <boot_pgdir>
c0004bfc:	0007a783          	lw	a5,0(a5)
c0004c00:	00010717          	auipc	a4,0x10
c0004c04:	86c72703          	lw	a4,-1940(a4) # c001446c <npage>
c0004c08:	00279793          	slli	a5,a5,0x2
c0004c0c:	00c7d793          	srli	a5,a5,0xc
c0004c10:	34e7f863          	bleu	a4,a5,c0004f60 <pmm_init+0xa84>
c0004c14:	fff80737          	lui	a4,0xfff80
c0004c18:	00e787b3          	add	a5,a5,a4
c0004c1c:	00579793          	slli	a5,a5,0x5
c0004c20:	00010517          	auipc	a0,0x10
c0004c24:	92852503          	lw	a0,-1752(a0) # c0014548 <pages>
c0004c28:	00100593          	li	a1,1
c0004c2c:	00f50533          	add	a0,a0,a5
c0004c30:	f75fe0ef          	jal	ra,c0003ba4 <free_pages>
c0004c34:	00010797          	auipc	a5,0x10
c0004c38:	8347a783          	lw	a5,-1996(a5) # c0014468 <boot_pgdir>
c0004c3c:	0007a023          	sw	zero,0(a5)
c0004c40:	00003517          	auipc	a0,0x3
c0004c44:	2dc50513          	addi	a0,a0,732 # c0007f1c <default_pmm_manager+0x594>
c0004c48:	c90fb0ef          	jal	ra,c00000d8 <cprintf>
c0004c4c:	da0ff0ef          	jal	ra,c00041ec <print_pgdir>
c0004c50:	ba4fd0ef          	jal	ra,c0001ff4 <kmalloc_init>
c0004c54:	01c12083          	lw	ra,28(sp)
c0004c58:	01812403          	lw	s0,24(sp)
c0004c5c:	01412483          	lw	s1,20(sp)
c0004c60:	01012903          	lw	s2,16(sp)
c0004c64:	02010113          	addi	sp,sp,32
c0004c68:	00008067          	ret
c0004c6c:	00078513          	mv	a0,a5
c0004c70:	9b5ff06f          	j	c0004624 <pmm_init+0x148>
c0004c74:	00003697          	auipc	a3,0x3
c0004c78:	0f468693          	addi	a3,a3,244 # c0007d68 <default_pmm_manager+0x3e0>
c0004c7c:	00002617          	auipc	a2,0x2
c0004c80:	04860613          	addi	a2,a2,72 # c0006cc4 <commands+0x720>
c0004c84:	1e400593          	li	a1,484
c0004c88:	00003517          	auipc	a0,0x3
c0004c8c:	d5850513          	addi	a0,a0,-680 # c00079e0 <default_pmm_manager+0x58>
c0004c90:	dbcfb0ef          	jal	ra,c000024c <__panic>
c0004c94:	00040693          	mv	a3,s0
c0004c98:	00002617          	auipc	a2,0x2
c0004c9c:	59060613          	addi	a2,a2,1424 # c0007228 <commands+0xc84>
c0004ca0:	1e400593          	li	a1,484
c0004ca4:	00003517          	auipc	a0,0x3
c0004ca8:	d3c50513          	addi	a0,a0,-708 # c00079e0 <default_pmm_manager+0x58>
c0004cac:	da0fb0ef          	jal	ra,c000024c <__panic>
c0004cb0:	00003697          	auipc	a3,0x3
c0004cb4:	0f868693          	addi	a3,a3,248 # c0007da8 <default_pmm_manager+0x420>
c0004cb8:	00002617          	auipc	a2,0x2
c0004cbc:	00c60613          	addi	a2,a2,12 # c0006cc4 <commands+0x720>
c0004cc0:	1e500593          	li	a1,485
c0004cc4:	00003517          	auipc	a0,0x3
c0004cc8:	d1c50513          	addi	a0,a0,-740 # c00079e0 <default_pmm_manager+0x58>
c0004ccc:	d80fb0ef          	jal	ra,c000024c <__panic>
c0004cd0:	00003697          	auipc	a3,0x3
c0004cd4:	01468693          	addi	a3,a3,20 # c0007ce4 <default_pmm_manager+0x35c>
c0004cd8:	00002617          	auipc	a2,0x2
c0004cdc:	fec60613          	addi	a2,a2,-20 # c0006cc4 <commands+0x720>
c0004ce0:	1d200593          	li	a1,466
c0004ce4:	00003517          	auipc	a0,0x3
c0004ce8:	cfc50513          	addi	a0,a0,-772 # c00079e0 <default_pmm_manager+0x58>
c0004cec:	d60fb0ef          	jal	ra,c000024c <__panic>
c0004cf0:	00003697          	auipc	a3,0x3
c0004cf4:	ec468693          	addi	a3,a3,-316 # c0007bb4 <default_pmm_manager+0x22c>
c0004cf8:	00002617          	auipc	a2,0x2
c0004cfc:	fcc60613          	addi	a2,a2,-52 # c0006cc4 <commands+0x720>
c0004d00:	1d100593          	li	a1,465
c0004d04:	00003517          	auipc	a0,0x3
c0004d08:	cdc50513          	addi	a0,a0,-804 # c00079e0 <default_pmm_manager+0x58>
c0004d0c:	d40fb0ef          	jal	ra,c000024c <__panic>
c0004d10:	00003697          	auipc	a3,0x3
c0004d14:	fe868693          	addi	a3,a3,-24 # c0007cf8 <default_pmm_manager+0x370>
c0004d18:	00002617          	auipc	a2,0x2
c0004d1c:	fac60613          	addi	a2,a2,-84 # c0006cc4 <commands+0x720>
c0004d20:	1ce00593          	li	a1,462
c0004d24:	00003517          	auipc	a0,0x3
c0004d28:	cbc50513          	addi	a0,a0,-836 # c00079e0 <default_pmm_manager+0x58>
c0004d2c:	d20fb0ef          	jal	ra,c000024c <__panic>
c0004d30:	00003697          	auipc	a3,0x3
c0004d34:	e6c68693          	addi	a3,a3,-404 # c0007b9c <default_pmm_manager+0x214>
c0004d38:	00002617          	auipc	a2,0x2
c0004d3c:	f8c60613          	addi	a2,a2,-116 # c0006cc4 <commands+0x720>
c0004d40:	1cd00593          	li	a1,461
c0004d44:	00003517          	auipc	a0,0x3
c0004d48:	c9c50513          	addi	a0,a0,-868 # c00079e0 <default_pmm_manager+0x58>
c0004d4c:	d00fb0ef          	jal	ra,c000024c <__panic>
c0004d50:	00003697          	auipc	a3,0x3
c0004d54:	ed868693          	addi	a3,a3,-296 # c0007c28 <default_pmm_manager+0x2a0>
c0004d58:	00002617          	auipc	a2,0x2
c0004d5c:	f6c60613          	addi	a2,a2,-148 # c0006cc4 <commands+0x720>
c0004d60:	1cc00593          	li	a1,460
c0004d64:	00003517          	auipc	a0,0x3
c0004d68:	c7c50513          	addi	a0,a0,-900 # c00079e0 <default_pmm_manager+0x58>
c0004d6c:	ce0fb0ef          	jal	ra,c000024c <__panic>
c0004d70:	00003697          	auipc	a3,0x3
c0004d74:	f7468693          	addi	a3,a3,-140 # c0007ce4 <default_pmm_manager+0x35c>
c0004d78:	00002617          	auipc	a2,0x2
c0004d7c:	f4c60613          	addi	a2,a2,-180 # c0006cc4 <commands+0x720>
c0004d80:	1cb00593          	li	a1,459
c0004d84:	00003517          	auipc	a0,0x3
c0004d88:	c5c50513          	addi	a0,a0,-932 # c00079e0 <default_pmm_manager+0x58>
c0004d8c:	cc0fb0ef          	jal	ra,c000024c <__panic>
c0004d90:	00003697          	auipc	a3,0x3
c0004d94:	f4068693          	addi	a3,a3,-192 # c0007cd0 <default_pmm_manager+0x348>
c0004d98:	00002617          	auipc	a2,0x2
c0004d9c:	f2c60613          	addi	a2,a2,-212 # c0006cc4 <commands+0x720>
c0004da0:	1ca00593          	li	a1,458
c0004da4:	00003517          	auipc	a0,0x3
c0004da8:	c3c50513          	addi	a0,a0,-964 # c00079e0 <default_pmm_manager+0x58>
c0004dac:	ca0fb0ef          	jal	ra,c000024c <__panic>
c0004db0:	00003697          	auipc	a3,0x3
c0004db4:	ef468693          	addi	a3,a3,-268 # c0007ca4 <default_pmm_manager+0x31c>
c0004db8:	00002617          	auipc	a2,0x2
c0004dbc:	f0c60613          	addi	a2,a2,-244 # c0006cc4 <commands+0x720>
c0004dc0:	1c900593          	li	a1,457
c0004dc4:	00003517          	auipc	a0,0x3
c0004dc8:	c1c50513          	addi	a0,a0,-996 # c00079e0 <default_pmm_manager+0x58>
c0004dcc:	c80fb0ef          	jal	ra,c000024c <__panic>
c0004dd0:	00003697          	auipc	a3,0x3
c0004dd4:	ec068693          	addi	a3,a3,-320 # c0007c90 <default_pmm_manager+0x308>
c0004dd8:	00002617          	auipc	a2,0x2
c0004ddc:	eec60613          	addi	a2,a2,-276 # c0006cc4 <commands+0x720>
c0004de0:	1c700593          	li	a1,455
c0004de4:	00003517          	auipc	a0,0x3
c0004de8:	bfc50513          	addi	a0,a0,-1028 # c00079e0 <default_pmm_manager+0x58>
c0004dec:	c60fb0ef          	jal	ra,c000024c <__panic>
c0004df0:	00003697          	auipc	a3,0x3
c0004df4:	e8868693          	addi	a3,a3,-376 # c0007c78 <default_pmm_manager+0x2f0>
c0004df8:	00002617          	auipc	a2,0x2
c0004dfc:	ecc60613          	addi	a2,a2,-308 # c0006cc4 <commands+0x720>
c0004e00:	1c600593          	li	a1,454
c0004e04:	00003517          	auipc	a0,0x3
c0004e08:	bdc50513          	addi	a0,a0,-1060 # c00079e0 <default_pmm_manager+0x58>
c0004e0c:	c40fb0ef          	jal	ra,c000024c <__panic>
c0004e10:	00003697          	auipc	a3,0x3
c0004e14:	e5868693          	addi	a3,a3,-424 # c0007c68 <default_pmm_manager+0x2e0>
c0004e18:	00002617          	auipc	a2,0x2
c0004e1c:	eac60613          	addi	a2,a2,-340 # c0006cc4 <commands+0x720>
c0004e20:	1c500593          	li	a1,453
c0004e24:	00003517          	auipc	a0,0x3
c0004e28:	bbc50513          	addi	a0,a0,-1092 # c00079e0 <default_pmm_manager+0x58>
c0004e2c:	c20fb0ef          	jal	ra,c000024c <__panic>
c0004e30:	00003697          	auipc	a3,0x3
c0004e34:	e2868693          	addi	a3,a3,-472 # c0007c58 <default_pmm_manager+0x2d0>
c0004e38:	00002617          	auipc	a2,0x2
c0004e3c:	e8c60613          	addi	a2,a2,-372 # c0006cc4 <commands+0x720>
c0004e40:	1c400593          	li	a1,452
c0004e44:	00003517          	auipc	a0,0x3
c0004e48:	b9c50513          	addi	a0,a0,-1124 # c00079e0 <default_pmm_manager+0x58>
c0004e4c:	c00fb0ef          	jal	ra,c000024c <__panic>
c0004e50:	00003697          	auipc	a3,0x3
c0004e54:	e9468693          	addi	a3,a3,-364 # c0007ce4 <default_pmm_manager+0x35c>
c0004e58:	00002617          	auipc	a2,0x2
c0004e5c:	e6c60613          	addi	a2,a2,-404 # c0006cc4 <commands+0x720>
c0004e60:	1d600593          	li	a1,470
c0004e64:	00003517          	auipc	a0,0x3
c0004e68:	b7c50513          	addi	a0,a0,-1156 # c00079e0 <default_pmm_manager+0x58>
c0004e6c:	be0fb0ef          	jal	ra,c000024c <__panic>
c0004e70:	00003697          	auipc	a3,0x3
c0004e74:	ea068693          	addi	a3,a3,-352 # c0007d10 <default_pmm_manager+0x388>
c0004e78:	00002617          	auipc	a2,0x2
c0004e7c:	e4c60613          	addi	a2,a2,-436 # c0006cc4 <commands+0x720>
c0004e80:	1d500593          	li	a1,469
c0004e84:	00003517          	auipc	a0,0x3
c0004e88:	b5c50513          	addi	a0,a0,-1188 # c00079e0 <default_pmm_manager+0x58>
c0004e8c:	bc0fb0ef          	jal	ra,c000024c <__panic>
c0004e90:	00050693          	mv	a3,a0
c0004e94:	00002617          	auipc	a2,0x2
c0004e98:	3b860613          	addi	a2,a2,952 # c000724c <commands+0xca8>
c0004e9c:	0d600593          	li	a1,214
c0004ea0:	00003517          	auipc	a0,0x3
c0004ea4:	b4050513          	addi	a0,a0,-1216 # c00079e0 <default_pmm_manager+0x58>
c0004ea8:	ba4fb0ef          	jal	ra,c000024c <__panic>
c0004eac:	00078693          	mv	a3,a5
c0004eb0:	00002617          	auipc	a2,0x2
c0004eb4:	37860613          	addi	a2,a2,888 # c0007228 <commands+0xc84>
c0004eb8:	06900593          	li	a1,105
c0004ebc:	00002517          	auipc	a0,0x2
c0004ec0:	12450513          	addi	a0,a0,292 # c0006fe0 <commands+0xa3c>
c0004ec4:	b88fb0ef          	jal	ra,c000024c <__panic>
c0004ec8:	00003697          	auipc	a3,0x3
c0004ecc:	c7868693          	addi	a3,a3,-904 # c0007b40 <default_pmm_manager+0x1b8>
c0004ed0:	00002617          	auipc	a2,0x2
c0004ed4:	df460613          	addi	a2,a2,-524 # c0006cc4 <commands+0x720>
c0004ed8:	1b700593          	li	a1,439
c0004edc:	00003517          	auipc	a0,0x3
c0004ee0:	b0450513          	addi	a0,a0,-1276 # c00079e0 <default_pmm_manager+0x58>
c0004ee4:	b68fb0ef          	jal	ra,c000024c <__panic>
c0004ee8:	00003697          	auipc	a3,0x3
c0004eec:	c3068693          	addi	a3,a3,-976 # c0007b18 <default_pmm_manager+0x190>
c0004ef0:	00002617          	auipc	a2,0x2
c0004ef4:	dd460613          	addi	a2,a2,-556 # c0006cc4 <commands+0x720>
c0004ef8:	1b300593          	li	a1,435
c0004efc:	00003517          	auipc	a0,0x3
c0004f00:	ae450513          	addi	a0,a0,-1308 # c00079e0 <default_pmm_manager+0x58>
c0004f04:	b48fb0ef          	jal	ra,c000024c <__panic>
c0004f08:	00003697          	auipc	a3,0x3
c0004f0c:	bd868693          	addi	a3,a3,-1064 # c0007ae0 <default_pmm_manager+0x158>
c0004f10:	00002617          	auipc	a2,0x2
c0004f14:	db460613          	addi	a2,a2,-588 # c0006cc4 <commands+0x720>
c0004f18:	1b200593          	li	a1,434
c0004f1c:	00003517          	auipc	a0,0x3
c0004f20:	ac450513          	addi	a0,a0,-1340 # c00079e0 <default_pmm_manager+0x58>
c0004f24:	b28fb0ef          	jal	ra,c000024c <__panic>
c0004f28:	00003697          	auipc	a3,0x3
c0004f2c:	b9c68693          	addi	a3,a3,-1124 # c0007ac4 <default_pmm_manager+0x13c>
c0004f30:	00002617          	auipc	a2,0x2
c0004f34:	d9460613          	addi	a2,a2,-620 # c0006cc4 <commands+0x720>
c0004f38:	1b100593          	li	a1,433
c0004f3c:	00003517          	auipc	a0,0x3
c0004f40:	aa450513          	addi	a0,a0,-1372 # c00079e0 <default_pmm_manager+0x58>
c0004f44:	b08fb0ef          	jal	ra,c000024c <__panic>
c0004f48:	00003617          	auipc	a2,0x3
c0004f4c:	b6060613          	addi	a2,a2,-1184 # c0007aa8 <default_pmm_manager+0x120>
c0004f50:	0b800593          	li	a1,184
c0004f54:	00003517          	auipc	a0,0x3
c0004f58:	a8c50513          	addi	a0,a0,-1396 # c00079e0 <default_pmm_manager+0x58>
c0004f5c:	af0fb0ef          	jal	ra,c000024c <__panic>
c0004f60:	b71fe0ef          	jal	ra,c0003ad0 <pa2page.part.6>
c0004f64:	00003697          	auipc	a3,0x3
c0004f68:	c6468693          	addi	a3,a3,-924 # c0007bc8 <default_pmm_manager+0x240>
c0004f6c:	00002617          	auipc	a2,0x2
c0004f70:	d5860613          	addi	a2,a2,-680 # c0006cc4 <commands+0x720>
c0004f74:	1bf00593          	li	a1,447
c0004f78:	00003517          	auipc	a0,0x3
c0004f7c:	a6850513          	addi	a0,a0,-1432 # c00079e0 <default_pmm_manager+0x58>
c0004f80:	accfb0ef          	jal	ra,c000024c <__panic>
c0004f84:	00002617          	auipc	a2,0x2
c0004f88:	2a460613          	addi	a2,a2,676 # c0007228 <commands+0xc84>
c0004f8c:	1be00593          	li	a1,446
c0004f90:	00003517          	auipc	a0,0x3
c0004f94:	a5050513          	addi	a0,a0,-1456 # c00079e0 <default_pmm_manager+0x58>
c0004f98:	ab4fb0ef          	jal	ra,c000024c <__panic>
c0004f9c:	00003697          	auipc	a3,0x3
c0004fa0:	c1868693          	addi	a3,a3,-1000 # c0007bb4 <default_pmm_manager+0x22c>
c0004fa4:	00002617          	auipc	a2,0x2
c0004fa8:	d2060613          	addi	a2,a2,-736 # c0006cc4 <commands+0x720>
c0004fac:	1bc00593          	li	a1,444
c0004fb0:	00003517          	auipc	a0,0x3
c0004fb4:	a3050513          	addi	a0,a0,-1488 # c00079e0 <default_pmm_manager+0x58>
c0004fb8:	a94fb0ef          	jal	ra,c000024c <__panic>
c0004fbc:	00003697          	auipc	a3,0x3
c0004fc0:	be068693          	addi	a3,a3,-1056 # c0007b9c <default_pmm_manager+0x214>
c0004fc4:	00002617          	auipc	a2,0x2
c0004fc8:	d0060613          	addi	a2,a2,-768 # c0006cc4 <commands+0x720>
c0004fcc:	1bb00593          	li	a1,443
c0004fd0:	00003517          	auipc	a0,0x3
c0004fd4:	a1050513          	addi	a0,a0,-1520 # c00079e0 <default_pmm_manager+0x58>
c0004fd8:	a74fb0ef          	jal	ra,c000024c <__panic>
c0004fdc:	00002617          	auipc	a2,0x2
c0004fe0:	53460613          	addi	a2,a2,1332 # c0007510 <commands+0xf6c>
c0004fe4:	07400593          	li	a1,116
c0004fe8:	00002517          	auipc	a0,0x2
c0004fec:	ff850513          	addi	a0,a0,-8 # c0006fe0 <commands+0xa3c>
c0004ff0:	a5cfb0ef          	jal	ra,c000024c <__panic>
c0004ff4:	00003697          	auipc	a3,0x3
c0004ff8:	b7868693          	addi	a3,a3,-1160 # c0007b6c <default_pmm_manager+0x1e4>
c0004ffc:	00002617          	auipc	a2,0x2
c0005000:	cc860613          	addi	a2,a2,-824 # c0006cc4 <commands+0x720>
c0005004:	1ba00593          	li	a1,442
c0005008:	00003517          	auipc	a0,0x3
c000500c:	9d850513          	addi	a0,a0,-1576 # c00079e0 <default_pmm_manager+0x58>
c0005010:	a3cfb0ef          	jal	ra,c000024c <__panic>
c0005014:	00003697          	auipc	a3,0x3
c0005018:	c1468693          	addi	a3,a3,-1004 # c0007c28 <default_pmm_manager+0x2a0>
c000501c:	00002617          	auipc	a2,0x2
c0005020:	ca860613          	addi	a2,a2,-856 # c0006cc4 <commands+0x720>
c0005024:	1c300593          	li	a1,451
c0005028:	00003517          	auipc	a0,0x3
c000502c:	9b850513          	addi	a0,a0,-1608 # c00079e0 <default_pmm_manager+0x58>
c0005030:	a1cfb0ef          	jal	ra,c000024c <__panic>
c0005034:	00003697          	auipc	a3,0x3
c0005038:	bbc68693          	addi	a3,a3,-1092 # c0007bf0 <default_pmm_manager+0x268>
c000503c:	00002617          	auipc	a2,0x2
c0005040:	c8860613          	addi	a2,a2,-888 # c0006cc4 <commands+0x720>
c0005044:	1c200593          	li	a1,450
c0005048:	00003517          	auipc	a0,0x3
c000504c:	99850513          	addi	a0,a0,-1640 # c00079e0 <default_pmm_manager+0x58>
c0005050:	9fcfb0ef          	jal	ra,c000024c <__panic>
c0005054:	00078693          	mv	a3,a5
c0005058:	00002617          	auipc	a2,0x2
c000505c:	1d060613          	addi	a2,a2,464 # c0007228 <commands+0xc84>
c0005060:	0f000593          	li	a1,240
c0005064:	00003517          	auipc	a0,0x3
c0005068:	97c50513          	addi	a0,a0,-1668 # c00079e0 <default_pmm_manager+0x58>
c000506c:	9e0fb0ef          	jal	ra,c000024c <__panic>
c0005070:	00003617          	auipc	a2,0x3
c0005074:	9ac60613          	addi	a2,a2,-1620 # c0007a1c <default_pmm_manager+0x94>
c0005078:	07300593          	li	a1,115
c000507c:	00003517          	auipc	a0,0x3
c0005080:	96450513          	addi	a0,a0,-1692 # c00079e0 <default_pmm_manager+0x58>
c0005084:	9c8fb0ef          	jal	ra,c000024c <__panic>
c0005088:	00003697          	auipc	a3,0x3
c000508c:	e7068693          	addi	a3,a3,-400 # c0007ef8 <default_pmm_manager+0x570>
c0005090:	00002617          	auipc	a2,0x2
c0005094:	c3460613          	addi	a2,a2,-972 # c0006cc4 <commands+0x720>
c0005098:	1f800593          	li	a1,504
c000509c:	00003517          	auipc	a0,0x3
c00050a0:	94450513          	addi	a0,a0,-1724 # c00079e0 <default_pmm_manager+0x58>
c00050a4:	9a8fb0ef          	jal	ra,c000024c <__panic>
c00050a8:	00003697          	auipc	a3,0x3
c00050ac:	d6068693          	addi	a3,a3,-672 # c0007e08 <default_pmm_manager+0x480>
c00050b0:	00002617          	auipc	a2,0x2
c00050b4:	c1460613          	addi	a2,a2,-1004 # c0006cc4 <commands+0x720>
c00050b8:	1ee00593          	li	a1,494
c00050bc:	00003517          	auipc	a0,0x3
c00050c0:	92450513          	addi	a0,a0,-1756 # c00079e0 <default_pmm_manager+0x58>
c00050c4:	988fb0ef          	jal	ra,c000024c <__panic>
c00050c8:	00003697          	auipc	a3,0x3
c00050cc:	d2c68693          	addi	a3,a3,-724 # c0007df4 <default_pmm_manager+0x46c>
c00050d0:	00002617          	auipc	a2,0x2
c00050d4:	bf460613          	addi	a2,a2,-1036 # c0006cc4 <commands+0x720>
c00050d8:	1ea00593          	li	a1,490
c00050dc:	00003517          	auipc	a0,0x3
c00050e0:	90450513          	addi	a0,a0,-1788 # c00079e0 <default_pmm_manager+0x58>
c00050e4:	968fb0ef          	jal	ra,c000024c <__panic>
c00050e8:	00003697          	auipc	a3,0x3
c00050ec:	cd868693          	addi	a3,a3,-808 # c0007dc0 <default_pmm_manager+0x438>
c00050f0:	00002617          	auipc	a2,0x2
c00050f4:	bd460613          	addi	a2,a2,-1068 # c0006cc4 <commands+0x720>
c00050f8:	1e800593          	li	a1,488
c00050fc:	00003517          	auipc	a0,0x3
c0005100:	8e450513          	addi	a0,a0,-1820 # c00079e0 <default_pmm_manager+0x58>
c0005104:	948fb0ef          	jal	ra,c000024c <__panic>
c0005108:	00002617          	auipc	a2,0x2
c000510c:	14460613          	addi	a2,a2,324 # c000724c <commands+0xca8>
c0005110:	1e800593          	li	a1,488
c0005114:	00003517          	auipc	a0,0x3
c0005118:	8cc50513          	addi	a0,a0,-1844 # c00079e0 <default_pmm_manager+0x58>
c000511c:	930fb0ef          	jal	ra,c000024c <__panic>
c0005120:	00003697          	auipc	a3,0x3
c0005124:	c0468693          	addi	a3,a3,-1020 # c0007d24 <default_pmm_manager+0x39c>
c0005128:	00002617          	auipc	a2,0x2
c000512c:	b9c60613          	addi	a2,a2,-1124 # c0006cc4 <commands+0x720>
c0005130:	1d800593          	li	a1,472
c0005134:	00003517          	auipc	a0,0x3
c0005138:	8ac50513          	addi	a0,a0,-1876 # c00079e0 <default_pmm_manager+0x58>
c000513c:	910fb0ef          	jal	ra,c000024c <__panic>
c0005140:	00003697          	auipc	a3,0x3
c0005144:	d5468693          	addi	a3,a3,-684 # c0007e94 <default_pmm_manager+0x50c>
c0005148:	00002617          	auipc	a2,0x2
c000514c:	b7c60613          	addi	a2,a2,-1156 # c0006cc4 <commands+0x720>
c0005150:	1f100593          	li	a1,497
c0005154:	00003517          	auipc	a0,0x3
c0005158:	88c50513          	addi	a0,a0,-1908 # c00079e0 <default_pmm_manager+0x58>
c000515c:	8f0fb0ef          	jal	ra,c000024c <__panic>
c0005160:	00003697          	auipc	a3,0x3
c0005164:	cf468693          	addi	a3,a3,-780 # c0007e54 <default_pmm_manager+0x4cc>
c0005168:	00002617          	auipc	a2,0x2
c000516c:	b5c60613          	addi	a2,a2,-1188 # c0006cc4 <commands+0x720>
c0005170:	1f000593          	li	a1,496
c0005174:	00003517          	auipc	a0,0x3
c0005178:	86c50513          	addi	a0,a0,-1940 # c00079e0 <default_pmm_manager+0x58>
c000517c:	8d0fb0ef          	jal	ra,c000024c <__panic>
c0005180:	00003697          	auipc	a3,0x3
c0005184:	cc068693          	addi	a3,a3,-832 # c0007e40 <default_pmm_manager+0x4b8>
c0005188:	00002617          	auipc	a2,0x2
c000518c:	b3c60613          	addi	a2,a2,-1220 # c0006cc4 <commands+0x720>
c0005190:	1ef00593          	li	a1,495
c0005194:	00003517          	auipc	a0,0x3
c0005198:	84c50513          	addi	a0,a0,-1972 # c00079e0 <default_pmm_manager+0x58>
c000519c:	8b0fb0ef          	jal	ra,c000024c <__panic>
c00051a0:	00078693          	mv	a3,a5
c00051a4:	00002617          	auipc	a2,0x2
c00051a8:	08460613          	addi	a2,a2,132 # c0007228 <commands+0xc84>
c00051ac:	08b00593          	li	a1,139
c00051b0:	00003517          	auipc	a0,0x3
c00051b4:	83050513          	addi	a0,a0,-2000 # c00079e0 <default_pmm_manager+0x58>
c00051b8:	894fb0ef          	jal	ra,c000024c <__panic>
c00051bc:	00003697          	auipc	a3,0x3
c00051c0:	d0468693          	addi	a3,a3,-764 # c0007ec0 <default_pmm_manager+0x538>
c00051c4:	00002617          	auipc	a2,0x2
c00051c8:	b0060613          	addi	a2,a2,-1280 # c0006cc4 <commands+0x720>
c00051cc:	1f500593          	li	a1,501
c00051d0:	00003517          	auipc	a0,0x3
c00051d4:	81050513          	addi	a0,a0,-2032 # c00079e0 <default_pmm_manager+0x58>
c00051d8:	874fb0ef          	jal	ra,c000024c <__panic>
c00051dc:	00002617          	auipc	a2,0x2
c00051e0:	07060613          	addi	a2,a2,112 # c000724c <commands+0xca8>
c00051e4:	09100593          	li	a1,145
c00051e8:	00002517          	auipc	a0,0x2
c00051ec:	7f850513          	addi	a0,a0,2040 # c00079e0 <default_pmm_manager+0x58>
c00051f0:	85cfb0ef          	jal	ra,c000024c <__panic>

c00051f4 <swapfs_init>:
c00051f4:	ff010113          	addi	sp,sp,-16
c00051f8:	00100513          	li	a0,1
c00051fc:	00112623          	sw	ra,12(sp)
c0005200:	c1cfb0ef          	jal	ra,c000061c <ide_device_valid>
c0005204:	02050263          	beqz	a0,c0005228 <swapfs_init+0x34>
c0005208:	00100513          	li	a0,1
c000520c:	c18fb0ef          	jal	ra,c0000624 <ide_device_size>
c0005210:	00c12083          	lw	ra,12(sp)
c0005214:	00355513          	srli	a0,a0,0x3
c0005218:	0000f297          	auipc	t0,0xf
c000521c:	2ea2a823          	sw	a0,752(t0) # c0014508 <max_swap_offset>
c0005220:	01010113          	addi	sp,sp,16
c0005224:	00008067          	ret
c0005228:	00003617          	auipc	a2,0x3
c000522c:	dc060613          	addi	a2,a2,-576 # c0007fe8 <default_pmm_manager+0x660>
c0005230:	00d00593          	li	a1,13
c0005234:	00003517          	auipc	a0,0x3
c0005238:	dd050513          	addi	a0,a0,-560 # c0008004 <default_pmm_manager+0x67c>
c000523c:	810fb0ef          	jal	ra,c000024c <__panic>

c0005240 <swapfs_read>:
c0005240:	ff010113          	addi	sp,sp,-16
c0005244:	00112623          	sw	ra,12(sp)
c0005248:	00855793          	srli	a5,a0,0x8
c000524c:	06078663          	beqz	a5,c00052b8 <swapfs_read+0x78>
c0005250:	0000f717          	auipc	a4,0xf
c0005254:	2b872703          	lw	a4,696(a4) # c0014508 <max_swap_offset>
c0005258:	06e7f063          	bleu	a4,a5,c00052b8 <swapfs_read+0x78>
c000525c:	0000f617          	auipc	a2,0xf
c0005260:	2ec62603          	lw	a2,748(a2) # c0014548 <pages>
c0005264:	40c58633          	sub	a2,a1,a2
c0005268:	40565613          	srai	a2,a2,0x5
c000526c:	00006597          	auipc	a1,0x6
c0005270:	dc05a583          	lw	a1,-576(a1) # c000b02c <nbase>
c0005274:	00100737          	lui	a4,0x100
c0005278:	00b60633          	add	a2,a2,a1
c000527c:	fff70713          	addi	a4,a4,-1 # fffff <BASE_ADDRESS-0xbff00001>
c0005280:	00e67733          	and	a4,a2,a4
c0005284:	0000f697          	auipc	a3,0xf
c0005288:	1e86a683          	lw	a3,488(a3) # c001446c <npage>
c000528c:	00379593          	slli	a1,a5,0x3
c0005290:	00c61613          	slli	a2,a2,0xc
c0005294:	04d77063          	bleu	a3,a4,c00052d4 <swapfs_read+0x94>
c0005298:	00c12083          	lw	ra,12(sp)
c000529c:	0000f797          	auipc	a5,0xf
c00052a0:	2a47a783          	lw	a5,676(a5) # c0014540 <va_pa_offset>
c00052a4:	00800693          	li	a3,8
c00052a8:	00f60633          	add	a2,a2,a5
c00052ac:	00100513          	li	a0,1
c00052b0:	01010113          	addi	sp,sp,16
c00052b4:	b78fb06f          	j	c000062c <ide_read_secs>
c00052b8:	00050693          	mv	a3,a0
c00052bc:	00003617          	auipc	a2,0x3
c00052c0:	d5c60613          	addi	a2,a2,-676 # c0008018 <default_pmm_manager+0x690>
c00052c4:	01400593          	li	a1,20
c00052c8:	00003517          	auipc	a0,0x3
c00052cc:	d3c50513          	addi	a0,a0,-708 # c0008004 <default_pmm_manager+0x67c>
c00052d0:	f7dfa0ef          	jal	ra,c000024c <__panic>
c00052d4:	00060693          	mv	a3,a2
c00052d8:	06900593          	li	a1,105
c00052dc:	00002617          	auipc	a2,0x2
c00052e0:	f4c60613          	addi	a2,a2,-180 # c0007228 <commands+0xc84>
c00052e4:	00002517          	auipc	a0,0x2
c00052e8:	cfc50513          	addi	a0,a0,-772 # c0006fe0 <commands+0xa3c>
c00052ec:	f61fa0ef          	jal	ra,c000024c <__panic>

c00052f0 <swapfs_write>:
c00052f0:	ff010113          	addi	sp,sp,-16
c00052f4:	00112623          	sw	ra,12(sp)
c00052f8:	00855793          	srli	a5,a0,0x8
c00052fc:	06078663          	beqz	a5,c0005368 <swapfs_write+0x78>
c0005300:	0000f717          	auipc	a4,0xf
c0005304:	20872703          	lw	a4,520(a4) # c0014508 <max_swap_offset>
c0005308:	06e7f063          	bleu	a4,a5,c0005368 <swapfs_write+0x78>
c000530c:	0000f617          	auipc	a2,0xf
c0005310:	23c62603          	lw	a2,572(a2) # c0014548 <pages>
c0005314:	40c58633          	sub	a2,a1,a2
c0005318:	40565613          	srai	a2,a2,0x5
c000531c:	00006597          	auipc	a1,0x6
c0005320:	d105a583          	lw	a1,-752(a1) # c000b02c <nbase>
c0005324:	00100737          	lui	a4,0x100
c0005328:	00b60633          	add	a2,a2,a1
c000532c:	fff70713          	addi	a4,a4,-1 # fffff <BASE_ADDRESS-0xbff00001>
c0005330:	00e67733          	and	a4,a2,a4
c0005334:	0000f697          	auipc	a3,0xf
c0005338:	1386a683          	lw	a3,312(a3) # c001446c <npage>
c000533c:	00379593          	slli	a1,a5,0x3
c0005340:	00c61613          	slli	a2,a2,0xc
c0005344:	04d77063          	bleu	a3,a4,c0005384 <swapfs_write+0x94>
c0005348:	00c12083          	lw	ra,12(sp)
c000534c:	0000f797          	auipc	a5,0xf
c0005350:	1f47a783          	lw	a5,500(a5) # c0014540 <va_pa_offset>
c0005354:	00800693          	li	a3,8
c0005358:	00f60633          	add	a2,a2,a5
c000535c:	00100513          	li	a0,1
c0005360:	01010113          	addi	sp,sp,16
c0005364:	afcfb06f          	j	c0000660 <ide_write_secs>
c0005368:	00050693          	mv	a3,a0
c000536c:	00003617          	auipc	a2,0x3
c0005370:	cac60613          	addi	a2,a2,-852 # c0008018 <default_pmm_manager+0x690>
c0005374:	01900593          	li	a1,25
c0005378:	00003517          	auipc	a0,0x3
c000537c:	c8c50513          	addi	a0,a0,-884 # c0008004 <default_pmm_manager+0x67c>
c0005380:	ecdfa0ef          	jal	ra,c000024c <__panic>
c0005384:	00060693          	mv	a3,a2
c0005388:	06900593          	li	a1,105
c000538c:	00002617          	auipc	a2,0x2
c0005390:	e9c60613          	addi	a2,a2,-356 # c0007228 <commands+0xc84>
c0005394:	00002517          	auipc	a0,0x2
c0005398:	c4c50513          	addi	a0,a0,-948 # c0006fe0 <commands+0xa3c>
c000539c:	eb1fa0ef          	jal	ra,c000024c <__panic>

c00053a0 <switch_to>:
c00053a0:	00152023          	sw	ra,0(a0)
c00053a4:	00252223          	sw	sp,4(a0)
c00053a8:	00852423          	sw	s0,8(a0)
c00053ac:	00952623          	sw	s1,12(a0)
c00053b0:	01252823          	sw	s2,16(a0)
c00053b4:	01352a23          	sw	s3,20(a0)
c00053b8:	01452c23          	sw	s4,24(a0)
c00053bc:	01552e23          	sw	s5,28(a0)
c00053c0:	03652023          	sw	s6,32(a0)
c00053c4:	03752223          	sw	s7,36(a0)
c00053c8:	03852423          	sw	s8,40(a0)
c00053cc:	03952623          	sw	s9,44(a0)
c00053d0:	03a52823          	sw	s10,48(a0)
c00053d4:	03b52a23          	sw	s11,52(a0)
c00053d8:	0005a083          	lw	ra,0(a1)
c00053dc:	0045a103          	lw	sp,4(a1)
c00053e0:	0085a403          	lw	s0,8(a1)
c00053e4:	00c5a483          	lw	s1,12(a1)
c00053e8:	0105a903          	lw	s2,16(a1)
c00053ec:	0145a983          	lw	s3,20(a1)
c00053f0:	0185aa03          	lw	s4,24(a1)
c00053f4:	01c5aa83          	lw	s5,28(a1)
c00053f8:	0205ab03          	lw	s6,32(a1)
c00053fc:	0245ab83          	lw	s7,36(a1)
c0005400:	0285ac03          	lw	s8,40(a1)
c0005404:	02c5ac83          	lw	s9,44(a1)
c0005408:	0305ad03          	lw	s10,48(a1)
c000540c:	0345ad83          	lw	s11,52(a1)
c0005410:	00008067          	ret

c0005414 <kernel_thread_entry>:
c0005414:	00048513          	mv	a0,s1
c0005418:	000400e7          	jalr	s0
c000541c:	64c000ef          	jal	ra,c0005a68 <do_exit>

c0005420 <alloc_proc>:
c0005420:	ff010113          	addi	sp,sp,-16
c0005424:	08000513          	li	a0,128
c0005428:	00812423          	sw	s0,8(sp)
c000542c:	00112623          	sw	ra,12(sp)
c0005430:	bedfc0ef          	jal	ra,c000201c <kmalloc>
c0005434:	00050413          	mv	s0,a0
c0005438:	04050c63          	beqz	a0,c0005490 <alloc_proc+0x70>
c000543c:	fff00793          	li	a5,-1
c0005440:	00f52223          	sw	a5,4(a0)
c0005444:	03800613          	li	a2,56
c0005448:	00000593          	li	a1,0
c000544c:	00052023          	sw	zero,0(a0)
c0005450:	00052423          	sw	zero,8(a0)
c0005454:	00052623          	sw	zero,12(a0)
c0005458:	00052823          	sw	zero,16(a0)
c000545c:	00052a23          	sw	zero,20(a0)
c0005460:	00052c23          	sw	zero,24(a0)
c0005464:	01c50513          	addi	a0,a0,28
c0005468:	1c9000ef          	jal	ra,c0005e30 <memset>
c000546c:	0000f797          	auipc	a5,0xf
c0005470:	0d87a783          	lw	a5,216(a5) # c0014544 <boot_cr3>
c0005474:	04042a23          	sw	zero,84(s0)
c0005478:	04f42c23          	sw	a5,88(s0)
c000547c:	04042e23          	sw	zero,92(s0)
c0005480:	00f00613          	li	a2,15
c0005484:	00000593          	li	a1,0
c0005488:	06040513          	addi	a0,s0,96
c000548c:	1a5000ef          	jal	ra,c0005e30 <memset>
c0005490:	00c12083          	lw	ra,12(sp)
c0005494:	00040513          	mv	a0,s0
c0005498:	00812403          	lw	s0,8(sp)
c000549c:	01010113          	addi	sp,sp,16
c00054a0:	00008067          	ret

c00054a4 <forkret>:
c00054a4:	0000f797          	auipc	a5,0xf
c00054a8:	fd07a783          	lw	a5,-48(a5) # c0014474 <current>
c00054ac:	0547a503          	lw	a0,84(a5)
c00054b0:	9c9fb06f          	j	c0000e78 <forkrets>

c00054b4 <set_proc_name>:
c00054b4:	ff010113          	addi	sp,sp,-16
c00054b8:	00812423          	sw	s0,8(sp)
c00054bc:	06050413          	addi	s0,a0,96
c00054c0:	00912223          	sw	s1,4(sp)
c00054c4:	01000613          	li	a2,16
c00054c8:	00058493          	mv	s1,a1
c00054cc:	00040513          	mv	a0,s0
c00054d0:	00000593          	li	a1,0
c00054d4:	00112623          	sw	ra,12(sp)
c00054d8:	159000ef          	jal	ra,c0005e30 <memset>
c00054dc:	00048593          	mv	a1,s1
c00054e0:	00040513          	mv	a0,s0
c00054e4:	00c12083          	lw	ra,12(sp)
c00054e8:	00812403          	lw	s0,8(sp)
c00054ec:	00412483          	lw	s1,4(sp)
c00054f0:	00f00613          	li	a2,15
c00054f4:	01010113          	addi	sp,sp,16
c00054f8:	1550006f          	j	c0005e4c <memcpy>

c00054fc <get_proc_name>:
c00054fc:	ff010113          	addi	sp,sp,-16
c0005500:	00812423          	sw	s0,8(sp)
c0005504:	0000f417          	auipc	s0,0xf
c0005508:	f3440413          	addi	s0,s0,-204 # c0014438 <name.1463>
c000550c:	00912223          	sw	s1,4(sp)
c0005510:	01000613          	li	a2,16
c0005514:	00050493          	mv	s1,a0
c0005518:	00000593          	li	a1,0
c000551c:	00040513          	mv	a0,s0
c0005520:	00112623          	sw	ra,12(sp)
c0005524:	10d000ef          	jal	ra,c0005e30 <memset>
c0005528:	06048593          	addi	a1,s1,96
c000552c:	00040513          	mv	a0,s0
c0005530:	00c12083          	lw	ra,12(sp)
c0005534:	00812403          	lw	s0,8(sp)
c0005538:	00412483          	lw	s1,4(sp)
c000553c:	00f00613          	li	a2,15
c0005540:	01010113          	addi	sp,sp,16
c0005544:	1090006f          	j	c0005e4c <memcpy>

c0005548 <init_main>:
c0005548:	ff010113          	addi	sp,sp,-16
c000554c:	0000f797          	auipc	a5,0xf
c0005550:	f287a783          	lw	a5,-216(a5) # c0014474 <current>
c0005554:	00912223          	sw	s1,4(sp)
c0005558:	0047a483          	lw	s1,4(a5)
c000555c:	00812423          	sw	s0,8(sp)
c0005560:	00050413          	mv	s0,a0
c0005564:	00078513          	mv	a0,a5
c0005568:	00112623          	sw	ra,12(sp)
c000556c:	f91ff0ef          	jal	ra,c00054fc <get_proc_name>
c0005570:	00050613          	mv	a2,a0
c0005574:	00048593          	mv	a1,s1
c0005578:	00003517          	auipc	a0,0x3
c000557c:	afc50513          	addi	a0,a0,-1284 # c0008074 <default_pmm_manager+0x6ec>
c0005580:	b59fa0ef          	jal	ra,c00000d8 <cprintf>
c0005584:	00040593          	mv	a1,s0
c0005588:	00003517          	auipc	a0,0x3
c000558c:	b1450513          	addi	a0,a0,-1260 # c000809c <default_pmm_manager+0x714>
c0005590:	b49fa0ef          	jal	ra,c00000d8 <cprintf>
c0005594:	00003517          	auipc	a0,0x3
c0005598:	b1850513          	addi	a0,a0,-1256 # c00080ac <default_pmm_manager+0x724>
c000559c:	b3dfa0ef          	jal	ra,c00000d8 <cprintf>
c00055a0:	00c12083          	lw	ra,12(sp)
c00055a4:	00000513          	li	a0,0
c00055a8:	00812403          	lw	s0,8(sp)
c00055ac:	00412483          	lw	s1,4(sp)
c00055b0:	01010113          	addi	sp,sp,16
c00055b4:	00008067          	ret

c00055b8 <proc_run>:
c00055b8:	ff010113          	addi	sp,sp,-16
c00055bc:	00912223          	sw	s1,4(sp)
c00055c0:	00112623          	sw	ra,12(sp)
c00055c4:	00812423          	sw	s0,8(sp)
c00055c8:	01212023          	sw	s2,0(sp)
c00055cc:	0000f497          	auipc	s1,0xf
c00055d0:	ea84a483          	lw	s1,-344(s1) # c0014474 <current>
c00055d4:	02a48e63          	beq	s1,a0,c0005610 <proc_run+0x58>
c00055d8:	00050413          	mv	s0,a0
c00055dc:	100027f3          	csrr	a5,sstatus
c00055e0:	0027f793          	andi	a5,a5,2
c00055e4:	00000913          	li	s2,0
c00055e8:	04079c63          	bnez	a5,c0005640 <proc_run+0x88>
c00055ec:	05842783          	lw	a5,88(s0)
c00055f0:	0000f297          	auipc	t0,0xf
c00055f4:	e882a223          	sw	s0,-380(t0) # c0014474 <current>
c00055f8:	00c7d793          	srli	a5,a5,0xc
c00055fc:	18079073          	csrw	sptbr,a5
c0005600:	01c40593          	addi	a1,s0,28
c0005604:	01c48513          	addi	a0,s1,28
c0005608:	d99ff0ef          	jal	ra,c00053a0 <switch_to>
c000560c:	00091e63          	bnez	s2,c0005628 <proc_run+0x70>
c0005610:	00c12083          	lw	ra,12(sp)
c0005614:	00812403          	lw	s0,8(sp)
c0005618:	00412483          	lw	s1,4(sp)
c000561c:	00012903          	lw	s2,0(sp)
c0005620:	01010113          	addi	sp,sp,16
c0005624:	00008067          	ret
c0005628:	00c12083          	lw	ra,12(sp)
c000562c:	00812403          	lw	s0,8(sp)
c0005630:	00412483          	lw	s1,4(sp)
c0005634:	00012903          	lw	s2,0(sp)
c0005638:	01010113          	addi	sp,sp,16
c000563c:	974fb06f          	j	c00007b0 <intr_enable>
c0005640:	978fb0ef          	jal	ra,c00007b8 <intr_disable>
c0005644:	00100913          	li	s2,1
c0005648:	fa5ff06f          	j	c00055ec <proc_run+0x34>

c000564c <find_proc>:
c000564c:	000027b7          	lui	a5,0x2
c0005650:	fff50713          	addi	a4,a0,-1
c0005654:	ffe78793          	addi	a5,a5,-2 # 1ffe <BASE_ADDRESS-0xbfffe002>
c0005658:	06e7e663          	bltu	a5,a4,c00056c4 <find_proc+0x78>
c000565c:	ff010113          	addi	sp,sp,-16
c0005660:	00a00593          	li	a1,10
c0005664:	00812423          	sw	s0,8(sp)
c0005668:	00112623          	sw	ra,12(sp)
c000566c:	00050413          	mv	s0,a0
c0005670:	5f5000ef          	jal	ra,c0006464 <hash32>
c0005674:	0000d797          	auipc	a5,0xd
c0005678:	dc478793          	addi	a5,a5,-572 # c0012438 <hash_list>
c000567c:	00351513          	slli	a0,a0,0x3
c0005680:	00a78533          	add	a0,a5,a0
c0005684:	00050793          	mv	a5,a0
c0005688:	00c0006f          	j	c0005694 <find_proc+0x48>
c000568c:	f8c7a703          	lw	a4,-116(a5)
c0005690:	02e40063          	beq	s0,a4,c00056b0 <find_proc+0x64>
c0005694:	0047a783          	lw	a5,4(a5)
c0005698:	fef51ae3          	bne	a0,a5,c000568c <find_proc+0x40>
c000569c:	00c12083          	lw	ra,12(sp)
c00056a0:	00000513          	li	a0,0
c00056a4:	00812403          	lw	s0,8(sp)
c00056a8:	01010113          	addi	sp,sp,16
c00056ac:	00008067          	ret
c00056b0:	00c12083          	lw	ra,12(sp)
c00056b4:	f8878513          	addi	a0,a5,-120
c00056b8:	00812403          	lw	s0,8(sp)
c00056bc:	01010113          	addi	sp,sp,16
c00056c0:	00008067          	ret
c00056c4:	00000513          	li	a0,0
c00056c8:	00008067          	ret

c00056cc <do_fork>:
c00056cc:	ff010113          	addi	sp,sp,-16
c00056d0:	00112623          	sw	ra,12(sp)
c00056d4:	00812423          	sw	s0,8(sp)
c00056d8:	00912223          	sw	s1,4(sp)
c00056dc:	01212023          	sw	s2,0(sp)
c00056e0:	0000f717          	auipc	a4,0xf
c00056e4:	da072703          	lw	a4,-608(a4) # c0014480 <nr_process>
c00056e8:	000017b7          	lui	a5,0x1
c00056ec:	2af75863          	ble	a5,a4,c000599c <do_fork+0x2d0>
c00056f0:	00058493          	mv	s1,a1
c00056f4:	00060413          	mv	s0,a2
c00056f8:	d29ff0ef          	jal	ra,c0005420 <alloc_proc>
c00056fc:	00050913          	mv	s2,a0
c0005700:	26050463          	beqz	a0,c0005968 <do_fork+0x29c>
c0005704:	00200513          	li	a0,2
c0005708:	be8fe0ef          	jal	ra,c0003af0 <alloc_pages>
c000570c:	24050a63          	beqz	a0,c0005960 <do_fork+0x294>
c0005710:	0000f697          	auipc	a3,0xf
c0005714:	e386a683          	lw	a3,-456(a3) # c0014548 <pages>
c0005718:	40d506b3          	sub	a3,a0,a3
c000571c:	00006797          	auipc	a5,0x6
c0005720:	9107a783          	lw	a5,-1776(a5) # c000b02c <nbase>
c0005724:	4056d693          	srai	a3,a3,0x5
c0005728:	00f686b3          	add	a3,a3,a5
c000572c:	001007b7          	lui	a5,0x100
c0005730:	fff78793          	addi	a5,a5,-1 # fffff <BASE_ADDRESS-0xbff00001>
c0005734:	00f6f7b3          	and	a5,a3,a5
c0005738:	0000f717          	auipc	a4,0xf
c000573c:	d3472703          	lw	a4,-716(a4) # c001446c <npage>
c0005740:	00c69693          	slli	a3,a3,0xc
c0005744:	26e7f463          	bleu	a4,a5,c00059ac <do_fork+0x2e0>
c0005748:	0000f797          	auipc	a5,0xf
c000574c:	d2c7a783          	lw	a5,-724(a5) # c0014474 <current>
c0005750:	0187a703          	lw	a4,24(a5)
c0005754:	0000f797          	auipc	a5,0xf
c0005758:	dec7a783          	lw	a5,-532(a5) # c0014540 <va_pa_offset>
c000575c:	00f687b3          	add	a5,a3,a5
c0005760:	00f92623          	sw	a5,12(s2) # fffff00c <sbi_remote_fence_i+0xfffff71c>
c0005764:	26071063          	bnez	a4,c00059c4 <do_fork+0x2f8>
c0005768:	00002737          	lui	a4,0x2
c000576c:	f7070713          	addi	a4,a4,-144 # 1f70 <BASE_ADDRESS-0xbfffe090>
c0005770:	00e787b3          	add	a5,a5,a4
c0005774:	00040613          	mv	a2,s0
c0005778:	04f92a23          	sw	a5,84(s2)
c000577c:	00078713          	mv	a4,a5
c0005780:	08040693          	addi	a3,s0,128
c0005784:	00062f03          	lw	t5,0(a2)
c0005788:	00462e83          	lw	t4,4(a2)
c000578c:	00862e03          	lw	t3,8(a2)
c0005790:	00c62303          	lw	t1,12(a2)
c0005794:	01062883          	lw	a7,16(a2)
c0005798:	01462803          	lw	a6,20(a2)
c000579c:	01862503          	lw	a0,24(a2)
c00057a0:	01c62583          	lw	a1,28(a2)
c00057a4:	01e72023          	sw	t5,0(a4)
c00057a8:	01d72223          	sw	t4,4(a4)
c00057ac:	01c72423          	sw	t3,8(a4)
c00057b0:	00672623          	sw	t1,12(a4)
c00057b4:	01172823          	sw	a7,16(a4)
c00057b8:	01072a23          	sw	a6,20(a4)
c00057bc:	00a72c23          	sw	a0,24(a4)
c00057c0:	00b72e23          	sw	a1,28(a4)
c00057c4:	02060613          	addi	a2,a2,32
c00057c8:	02070713          	addi	a4,a4,32
c00057cc:	fad61ce3          	bne	a2,a3,c0005784 <do_fork+0xb8>
c00057d0:	00062803          	lw	a6,0(a2)
c00057d4:	00462503          	lw	a0,4(a2)
c00057d8:	00862583          	lw	a1,8(a2)
c00057dc:	00c62683          	lw	a3,12(a2)
c00057e0:	01072023          	sw	a6,0(a4)
c00057e4:	00a72223          	sw	a0,4(a4)
c00057e8:	00b72423          	sw	a1,8(a4)
c00057ec:	00d72623          	sw	a3,12(a4)
c00057f0:	0207a423          	sw	zero,40(a5)
c00057f4:	12048c63          	beqz	s1,c000592c <do_fork+0x260>
c00057f8:	00006417          	auipc	s0,0x6
c00057fc:	83842403          	lw	s0,-1992(s0) # c000b030 <last_pid.1473>
c0005800:	0097a423          	sw	s1,8(a5)
c0005804:	00006317          	auipc	t1,0x6
c0005808:	82c30313          	addi	t1,t1,-2004 # c000b030 <last_pid.1473>
c000580c:	00140413          	addi	s0,s0,1
c0005810:	00000717          	auipc	a4,0x0
c0005814:	c9470713          	addi	a4,a4,-876 # c00054a4 <forkret>
c0005818:	02f92023          	sw	a5,32(s2)
c000581c:	00e92e23          	sw	a4,28(s2)
c0005820:	00832023          	sw	s0,0(t1)
c0005824:	000027b7          	lui	a5,0x2
c0005828:	12f44063          	blt	s0,a5,c0005948 <do_fork+0x27c>
c000582c:	00100413          	li	s0,1
c0005830:	00832023          	sw	s0,0(t1)
c0005834:	000027b7          	lui	a5,0x2
c0005838:	00005e17          	auipc	t3,0x5
c000583c:	7fce0e13          	addi	t3,t3,2044 # c000b034 <next_safe.1472>
c0005840:	00fe2023          	sw	a5,0(t3)
c0005844:	00005517          	auipc	a0,0x5
c0005848:	7ec52503          	lw	a0,2028(a0) # c000b030 <last_pid.1473>
c000584c:	00000593          	li	a1,0
c0005850:	0000f497          	auipc	s1,0xf
c0005854:	cfc48493          	addi	s1,s1,-772 # c001454c <proc_list>
c0005858:	00078813          	mv	a6,a5
c000585c:	00100613          	li	a2,1
c0005860:	00058893          	mv	a7,a1
c0005864:	00080693          	mv	a3,a6
c0005868:	0000f797          	auipc	a5,0xf
c000586c:	ce478793          	addi	a5,a5,-796 # c001454c <proc_list>
c0005870:	0047a783          	lw	a5,4(a5)
c0005874:	02978263          	beq	a5,s1,c0005898 <do_fork+0x1cc>
c0005878:	f947a703          	lw	a4,-108(a5)
c000587c:	0a870c63          	beq	a4,s0,c0005934 <do_fork+0x268>
c0005880:	fee458e3          	ble	a4,s0,c0005870 <do_fork+0x1a4>
c0005884:	fed756e3          	ble	a3,a4,c0005870 <do_fork+0x1a4>
c0005888:	0047a783          	lw	a5,4(a5)
c000588c:	00070693          	mv	a3,a4
c0005890:	00060893          	mv	a7,a2
c0005894:	fe9792e3          	bne	a5,s1,c0005878 <do_fork+0x1ac>
c0005898:	14059663          	bnez	a1,c00059e4 <do_fork+0x318>
c000589c:	10089463          	bnez	a7,c00059a4 <do_fork+0x2d8>
c00058a0:	00892223          	sw	s0,4(s2)
c00058a4:	00a00593          	li	a1,10
c00058a8:	00040513          	mv	a0,s0
c00058ac:	3b9000ef          	jal	ra,c0006464 <hash32>
c00058b0:	0000d797          	auipc	a5,0xd
c00058b4:	b8878793          	addi	a5,a5,-1144 # c0012438 <hash_list>
c00058b8:	00351513          	slli	a0,a0,0x3
c00058bc:	00a78533          	add	a0,a5,a0
c00058c0:	00452783          	lw	a5,4(a0)
c00058c4:	07890713          	addi	a4,s2,120
c00058c8:	0000f697          	auipc	a3,0xf
c00058cc:	c886a683          	lw	a3,-888(a3) # c0014550 <proc_list+0x4>
c00058d0:	00e7a023          	sw	a4,0(a5)
c00058d4:	00e52223          	sw	a4,4(a0)
c00058d8:	06f92e23          	sw	a5,124(s2)
c00058dc:	07090713          	addi	a4,s2,112
c00058e0:	06a92c23          	sw	a0,120(s2)
c00058e4:	00e6a023          	sw	a4,0(a3)
c00058e8:	0000f797          	auipc	a5,0xf
c00058ec:	b987a783          	lw	a5,-1128(a5) # c0014480 <nr_process>
c00058f0:	00178793          	addi	a5,a5,1
c00058f4:	06d92a23          	sw	a3,116(s2)
c00058f8:	06992823          	sw	s1,112(s2)
c00058fc:	00090513          	mv	a0,s2
c0005900:	00e4a223          	sw	a4,4(s1)
c0005904:	0000f297          	auipc	t0,0xf
c0005908:	b6f2ae23          	sw	a5,-1156(t0) # c0014480 <nr_process>
c000590c:	314000ef          	jal	ra,c0005c20 <wakeup_proc>
c0005910:	00c12083          	lw	ra,12(sp)
c0005914:	00040513          	mv	a0,s0
c0005918:	00412483          	lw	s1,4(sp)
c000591c:	00812403          	lw	s0,8(sp)
c0005920:	00012903          	lw	s2,0(sp)
c0005924:	01010113          	addi	sp,sp,16
c0005928:	00008067          	ret
c000592c:	00078493          	mv	s1,a5
c0005930:	ec9ff06f          	j	c00057f8 <do_fork+0x12c>
c0005934:	00140413          	addi	s0,s0,1
c0005938:	04d45863          	ble	a3,s0,c0005988 <do_fork+0x2bc>
c000593c:	00040513          	mv	a0,s0
c0005940:	00060593          	mv	a1,a2
c0005944:	f2dff06f          	j	c0005870 <do_fork+0x1a4>
c0005948:	00005797          	auipc	a5,0x5
c000594c:	6ec7a783          	lw	a5,1772(a5) # c000b034 <next_safe.1472>
c0005950:	0000f497          	auipc	s1,0xf
c0005954:	bfc48493          	addi	s1,s1,-1028 # c001454c <proc_list>
c0005958:	ecf45ee3          	ble	a5,s0,c0005834 <do_fork+0x168>
c000595c:	f45ff06f          	j	c00058a0 <do_fork+0x1d4>
c0005960:	00090513          	mv	a0,s2
c0005964:	fd8fc0ef          	jal	ra,c000213c <kfree>
c0005968:	00c12083          	lw	ra,12(sp)
c000596c:	ffc00413          	li	s0,-4
c0005970:	00040513          	mv	a0,s0
c0005974:	00412483          	lw	s1,4(sp)
c0005978:	00812403          	lw	s0,8(sp)
c000597c:	00012903          	lw	s2,0(sp)
c0005980:	01010113          	addi	sp,sp,16
c0005984:	00008067          	ret
c0005988:	01044463          	blt	s0,a6,c0005990 <do_fork+0x2c4>
c000598c:	00100413          	li	s0,1
c0005990:	00060593          	mv	a1,a2
c0005994:	00040513          	mv	a0,s0
c0005998:	ec9ff06f          	j	c0005860 <do_fork+0x194>
c000599c:	ffb00413          	li	s0,-5
c00059a0:	f71ff06f          	j	c0005910 <do_fork+0x244>
c00059a4:	00de2023          	sw	a3,0(t3)
c00059a8:	ef9ff06f          	j	c00058a0 <do_fork+0x1d4>
c00059ac:	00002617          	auipc	a2,0x2
c00059b0:	87c60613          	addi	a2,a2,-1924 # c0007228 <commands+0xc84>
c00059b4:	06900593          	li	a1,105
c00059b8:	00001517          	auipc	a0,0x1
c00059bc:	62850513          	addi	a0,a0,1576 # c0006fe0 <commands+0xa3c>
c00059c0:	88dfa0ef          	jal	ra,c000024c <__panic>
c00059c4:	00002697          	auipc	a3,0x2
c00059c8:	68868693          	addi	a3,a3,1672 # c000804c <default_pmm_manager+0x6c4>
c00059cc:	00001617          	auipc	a2,0x1
c00059d0:	2f860613          	addi	a2,a2,760 # c0006cc4 <commands+0x720>
c00059d4:	0fd00593          	li	a1,253
c00059d8:	00002517          	auipc	a0,0x2
c00059dc:	68850513          	addi	a0,a0,1672 # c0008060 <default_pmm_manager+0x6d8>
c00059e0:	86dfa0ef          	jal	ra,c000024c <__panic>
c00059e4:	00a32023          	sw	a0,0(t1)
c00059e8:	eb5ff06f          	j	c000589c <do_fork+0x1d0>

c00059ec <kernel_thread>:
c00059ec:	f6010113          	addi	sp,sp,-160
c00059f0:	08812c23          	sw	s0,152(sp)
c00059f4:	08912a23          	sw	s1,148(sp)
c00059f8:	09212823          	sw	s2,144(sp)
c00059fc:	00058493          	mv	s1,a1
c0005a00:	00050913          	mv	s2,a0
c0005a04:	00060413          	mv	s0,a2
c0005a08:	00000593          	li	a1,0
c0005a0c:	09000613          	li	a2,144
c0005a10:	00010513          	mv	a0,sp
c0005a14:	08112e23          	sw	ra,156(sp)
c0005a18:	418000ef          	jal	ra,c0005e30 <memset>
c0005a1c:	03212023          	sw	s2,32(sp)
c0005a20:	02912223          	sw	s1,36(sp)
c0005a24:	100027f3          	csrr	a5,sstatus
c0005a28:	edd7f793          	andi	a5,a5,-291
c0005a2c:	1207e793          	ori	a5,a5,288
c0005a30:	08f12023          	sw	a5,128(sp)
c0005a34:	00010613          	mv	a2,sp
c0005a38:	10046513          	ori	a0,s0,256
c0005a3c:	00000797          	auipc	a5,0x0
c0005a40:	9d878793          	addi	a5,a5,-1576 # c0005414 <kernel_thread_entry>
c0005a44:	00000593          	li	a1,0
c0005a48:	08f12223          	sw	a5,132(sp)
c0005a4c:	c81ff0ef          	jal	ra,c00056cc <do_fork>
c0005a50:	09c12083          	lw	ra,156(sp)
c0005a54:	09812403          	lw	s0,152(sp)
c0005a58:	09412483          	lw	s1,148(sp)
c0005a5c:	09012903          	lw	s2,144(sp)
c0005a60:	0a010113          	addi	sp,sp,160
c0005a64:	00008067          	ret

c0005a68 <do_exit>:
c0005a68:	ff010113          	addi	sp,sp,-16
c0005a6c:	00002617          	auipc	a2,0x2
c0005a70:	5cc60613          	addi	a2,a2,1484 # c0008038 <default_pmm_manager+0x6b0>
c0005a74:	15900593          	li	a1,345
c0005a78:	00002517          	auipc	a0,0x2
c0005a7c:	5e850513          	addi	a0,a0,1512 # c0008060 <default_pmm_manager+0x6d8>
c0005a80:	00112623          	sw	ra,12(sp)
c0005a84:	fc8fa0ef          	jal	ra,c000024c <__panic>

c0005a88 <proc_init>:
c0005a88:	ff010113          	addi	sp,sp,-16
c0005a8c:	0000f797          	auipc	a5,0xf
c0005a90:	ac078793          	addi	a5,a5,-1344 # c001454c <proc_list>
c0005a94:	00112623          	sw	ra,12(sp)
c0005a98:	00812423          	sw	s0,8(sp)
c0005a9c:	00f7a223          	sw	a5,4(a5)
c0005aa0:	00f7a023          	sw	a5,0(a5)
c0005aa4:	0000f717          	auipc	a4,0xf
c0005aa8:	99470713          	addi	a4,a4,-1644 # c0014438 <name.1463>
c0005aac:	0000d797          	auipc	a5,0xd
c0005ab0:	98c78793          	addi	a5,a5,-1652 # c0012438 <hash_list>
c0005ab4:	00f7a223          	sw	a5,4(a5)
c0005ab8:	00f7a023          	sw	a5,0(a5)
c0005abc:	00878793          	addi	a5,a5,8
c0005ac0:	fef71ae3          	bne	a4,a5,c0005ab4 <proc_init+0x2c>
c0005ac4:	95dff0ef          	jal	ra,c0005420 <alloc_proc>
c0005ac8:	0000f297          	auipc	t0,0xf
c0005acc:	9aa2a823          	sw	a0,-1616(t0) # c0014478 <idleproc>
c0005ad0:	0c050063          	beqz	a0,c0005b90 <proc_init+0x108>
c0005ad4:	00200713          	li	a4,2
c0005ad8:	00100413          	li	s0,1
c0005adc:	00e52023          	sw	a4,0(a0)
c0005ae0:	00003717          	auipc	a4,0x3
c0005ae4:	52070713          	addi	a4,a4,1312 # c0009000 <bootstack>
c0005ae8:	00002597          	auipc	a1,0x2
c0005aec:	5f858593          	addi	a1,a1,1528 # c00080e0 <default_pmm_manager+0x758>
c0005af0:	00052223          	sw	zero,4(a0)
c0005af4:	00e52623          	sw	a4,12(a0)
c0005af8:	00852823          	sw	s0,16(a0)
c0005afc:	9b9ff0ef          	jal	ra,c00054b4 <set_proc_name>
c0005b00:	0000f797          	auipc	a5,0xf
c0005b04:	9807a783          	lw	a5,-1664(a5) # c0014480 <nr_process>
c0005b08:	008787b3          	add	a5,a5,s0
c0005b0c:	0000f297          	auipc	t0,0xf
c0005b10:	96f2aa23          	sw	a5,-1676(t0) # c0014480 <nr_process>
c0005b14:	00000613          	li	a2,0
c0005b18:	0000f797          	auipc	a5,0xf
c0005b1c:	9607a783          	lw	a5,-1696(a5) # c0014478 <idleproc>
c0005b20:	00002597          	auipc	a1,0x2
c0005b24:	5c858593          	addi	a1,a1,1480 # c00080e8 <default_pmm_manager+0x760>
c0005b28:	00000517          	auipc	a0,0x0
c0005b2c:	a2050513          	addi	a0,a0,-1504 # c0005548 <init_main>
c0005b30:	0000f297          	auipc	t0,0xf
c0005b34:	94f2a223          	sw	a5,-1724(t0) # c0014474 <current>
c0005b38:	eb5ff0ef          	jal	ra,c00059ec <kernel_thread>
c0005b3c:	0aa05663          	blez	a0,c0005be8 <proc_init+0x160>
c0005b40:	b0dff0ef          	jal	ra,c000564c <find_proc>
c0005b44:	00002597          	auipc	a1,0x2
c0005b48:	5d058593          	addi	a1,a1,1488 # c0008114 <default_pmm_manager+0x78c>
c0005b4c:	0000f297          	auipc	t0,0xf
c0005b50:	92a2a823          	sw	a0,-1744(t0) # c001447c <initproc>
c0005b54:	961ff0ef          	jal	ra,c00054b4 <set_proc_name>
c0005b58:	0000f797          	auipc	a5,0xf
c0005b5c:	9207a783          	lw	a5,-1760(a5) # c0014478 <idleproc>
c0005b60:	06078463          	beqz	a5,c0005bc8 <proc_init+0x140>
c0005b64:	0047a783          	lw	a5,4(a5)
c0005b68:	06079063          	bnez	a5,c0005bc8 <proc_init+0x140>
c0005b6c:	0000f797          	auipc	a5,0xf
c0005b70:	9107a783          	lw	a5,-1776(a5) # c001447c <initproc>
c0005b74:	02078a63          	beqz	a5,c0005ba8 <proc_init+0x120>
c0005b78:	0047a783          	lw	a5,4(a5)
c0005b7c:	02879663          	bne	a5,s0,c0005ba8 <proc_init+0x120>
c0005b80:	00c12083          	lw	ra,12(sp)
c0005b84:	00812403          	lw	s0,8(sp)
c0005b88:	01010113          	addi	sp,sp,16
c0005b8c:	00008067          	ret
c0005b90:	00002617          	auipc	a2,0x2
c0005b94:	53860613          	addi	a2,a2,1336 # c00080c8 <default_pmm_manager+0x740>
c0005b98:	17100593          	li	a1,369
c0005b9c:	00002517          	auipc	a0,0x2
c0005ba0:	4c450513          	addi	a0,a0,1220 # c0008060 <default_pmm_manager+0x6d8>
c0005ba4:	ea8fa0ef          	jal	ra,c000024c <__panic>
c0005ba8:	00002697          	auipc	a3,0x2
c0005bac:	59c68693          	addi	a3,a3,1436 # c0008144 <default_pmm_manager+0x7bc>
c0005bb0:	00001617          	auipc	a2,0x1
c0005bb4:	11460613          	addi	a2,a2,276 # c0006cc4 <commands+0x720>
c0005bb8:	18600593          	li	a1,390
c0005bbc:	00002517          	auipc	a0,0x2
c0005bc0:	4a450513          	addi	a0,a0,1188 # c0008060 <default_pmm_manager+0x6d8>
c0005bc4:	e88fa0ef          	jal	ra,c000024c <__panic>
c0005bc8:	00002697          	auipc	a3,0x2
c0005bcc:	55468693          	addi	a3,a3,1364 # c000811c <default_pmm_manager+0x794>
c0005bd0:	00001617          	auipc	a2,0x1
c0005bd4:	0f460613          	addi	a2,a2,244 # c0006cc4 <commands+0x720>
c0005bd8:	18500593          	li	a1,389
c0005bdc:	00002517          	auipc	a0,0x2
c0005be0:	48450513          	addi	a0,a0,1156 # c0008060 <default_pmm_manager+0x6d8>
c0005be4:	e68fa0ef          	jal	ra,c000024c <__panic>
c0005be8:	00002617          	auipc	a2,0x2
c0005bec:	51060613          	addi	a2,a2,1296 # c00080f8 <default_pmm_manager+0x770>
c0005bf0:	17f00593          	li	a1,383
c0005bf4:	00002517          	auipc	a0,0x2
c0005bf8:	46c50513          	addi	a0,a0,1132 # c0008060 <default_pmm_manager+0x6d8>
c0005bfc:	e50fa0ef          	jal	ra,c000024c <__panic>

c0005c00 <cpu_idle>:
c0005c00:	ff010113          	addi	sp,sp,-16
c0005c04:	00112623          	sw	ra,12(sp)
c0005c08:	0000f717          	auipc	a4,0xf
c0005c0c:	86c72703          	lw	a4,-1940(a4) # c0014474 <current>
c0005c10:	01072783          	lw	a5,16(a4)
c0005c14:	fe078ee3          	beqz	a5,c0005c10 <cpu_idle+0x10>
c0005c18:	04c000ef          	jal	ra,c0005c64 <schedule>
c0005c1c:	fedff06f          	j	c0005c08 <cpu_idle+0x8>

c0005c20 <wakeup_proc>:
c0005c20:	00052783          	lw	a5,0(a0)
c0005c24:	00100713          	li	a4,1
c0005c28:	ffe78793          	addi	a5,a5,-2
c0005c2c:	00f77863          	bleu	a5,a4,c0005c3c <wakeup_proc+0x1c>
c0005c30:	00200793          	li	a5,2
c0005c34:	00f52023          	sw	a5,0(a0)
c0005c38:	00008067          	ret
c0005c3c:	ff010113          	addi	sp,sp,-16
c0005c40:	00002697          	auipc	a3,0x2
c0005c44:	52c68693          	addi	a3,a3,1324 # c000816c <default_pmm_manager+0x7e4>
c0005c48:	00001617          	auipc	a2,0x1
c0005c4c:	07c60613          	addi	a2,a2,124 # c0006cc4 <commands+0x720>
c0005c50:	00900593          	li	a1,9
c0005c54:	00002517          	auipc	a0,0x2
c0005c58:	55450513          	addi	a0,a0,1364 # c00081a8 <default_pmm_manager+0x820>
c0005c5c:	00112623          	sw	ra,12(sp)
c0005c60:	decfa0ef          	jal	ra,c000024c <__panic>

c0005c64 <schedule>:
c0005c64:	ff010113          	addi	sp,sp,-16
c0005c68:	00112623          	sw	ra,12(sp)
c0005c6c:	00812423          	sw	s0,8(sp)
c0005c70:	100027f3          	csrr	a5,sstatus
c0005c74:	0027f793          	andi	a5,a5,2
c0005c78:	00000413          	li	s0,0
c0005c7c:	08079a63          	bnez	a5,c0005d10 <schedule+0xac>
c0005c80:	0000e897          	auipc	a7,0xe
c0005c84:	7f48a883          	lw	a7,2036(a7) # c0014474 <current>
c0005c88:	0008a823          	sw	zero,16(a7)
c0005c8c:	0000e517          	auipc	a0,0xe
c0005c90:	7ec52503          	lw	a0,2028(a0) # c0014478 <idleproc>
c0005c94:	08a88e63          	beq	a7,a0,c0005d30 <schedule+0xcc>
c0005c98:	07088693          	addi	a3,a7,112
c0005c9c:	0000f597          	auipc	a1,0xf
c0005ca0:	8b058593          	addi	a1,a1,-1872 # c001454c <proc_list>
c0005ca4:	00068793          	mv	a5,a3
c0005ca8:	00000613          	li	a2,0
c0005cac:	00200813          	li	a6,2
c0005cb0:	0047a783          	lw	a5,4(a5)
c0005cb4:	00b78863          	beq	a5,a1,c0005cc4 <schedule+0x60>
c0005cb8:	f907a703          	lw	a4,-112(a5)
c0005cbc:	f9078613          	addi	a2,a5,-112
c0005cc0:	01070463          	beq	a4,a6,c0005cc8 <schedule+0x64>
c0005cc4:	fef696e3          	bne	a3,a5,c0005cb0 <schedule+0x4c>
c0005cc8:	00060863          	beqz	a2,c0005cd8 <schedule+0x74>
c0005ccc:	00062703          	lw	a4,0(a2)
c0005cd0:	00200793          	li	a5,2
c0005cd4:	06f70663          	beq	a4,a5,c0005d40 <schedule+0xdc>
c0005cd8:	00852783          	lw	a5,8(a0)
c0005cdc:	00178793          	addi	a5,a5,1
c0005ce0:	00f52423          	sw	a5,8(a0)
c0005ce4:	01150463          	beq	a0,a7,c0005cec <schedule+0x88>
c0005ce8:	8d1ff0ef          	jal	ra,c00055b8 <proc_run>
c0005cec:	00041a63          	bnez	s0,c0005d00 <schedule+0x9c>
c0005cf0:	00c12083          	lw	ra,12(sp)
c0005cf4:	00812403          	lw	s0,8(sp)
c0005cf8:	01010113          	addi	sp,sp,16
c0005cfc:	00008067          	ret
c0005d00:	00c12083          	lw	ra,12(sp)
c0005d04:	00812403          	lw	s0,8(sp)
c0005d08:	01010113          	addi	sp,sp,16
c0005d0c:	aa5fa06f          	j	c00007b0 <intr_enable>
c0005d10:	aa9fa0ef          	jal	ra,c00007b8 <intr_disable>
c0005d14:	0000e897          	auipc	a7,0xe
c0005d18:	7608a883          	lw	a7,1888(a7) # c0014474 <current>
c0005d1c:	0008a823          	sw	zero,16(a7)
c0005d20:	0000e517          	auipc	a0,0xe
c0005d24:	75852503          	lw	a0,1880(a0) # c0014478 <idleproc>
c0005d28:	00100413          	li	s0,1
c0005d2c:	f6a896e3          	bne	a7,a0,c0005c98 <schedule+0x34>
c0005d30:	0000f597          	auipc	a1,0xf
c0005d34:	81c58593          	addi	a1,a1,-2020 # c001454c <proc_list>
c0005d38:	00058693          	mv	a3,a1
c0005d3c:	f69ff06f          	j	c0005ca4 <schedule+0x40>
c0005d40:	00060513          	mv	a0,a2
c0005d44:	f95ff06f          	j	c0005cd8 <schedule+0x74>

c0005d48 <strlen>:
c0005d48:	00054703          	lbu	a4,0(a0)
c0005d4c:	00050693          	mv	a3,a0
c0005d50:	00150793          	addi	a5,a0,1
c0005d54:	00070c63          	beqz	a4,c0005d6c <strlen+0x24>
c0005d58:	40d78533          	sub	a0,a5,a3
c0005d5c:	00178793          	addi	a5,a5,1
c0005d60:	fff7c703          	lbu	a4,-1(a5)
c0005d64:	fe071ae3          	bnez	a4,c0005d58 <strlen+0x10>
c0005d68:	00008067          	ret
c0005d6c:	00000513          	li	a0,0
c0005d70:	00008067          	ret

c0005d74 <strnlen>:
c0005d74:	00050693          	mv	a3,a0
c0005d78:	02058a63          	beqz	a1,c0005dac <strnlen+0x38>
c0005d7c:	00054703          	lbu	a4,0(a0)
c0005d80:	00150793          	addi	a5,a0,1
c0005d84:	02070463          	beqz	a4,c0005dac <strnlen+0x38>
c0005d88:	00b505b3          	add	a1,a0,a1
c0005d8c:	0100006f          	j	c0005d9c <strnlen+0x28>
c0005d90:	00178793          	addi	a5,a5,1
c0005d94:	fff7c703          	lbu	a4,-1(a5)
c0005d98:	00070863          	beqz	a4,c0005da8 <strnlen+0x34>
c0005d9c:	40d78533          	sub	a0,a5,a3
c0005da0:	feb798e3          	bne	a5,a1,c0005d90 <strnlen+0x1c>
c0005da4:	00008067          	ret
c0005da8:	00008067          	ret
c0005dac:	00000513          	li	a0,0
c0005db0:	00008067          	ret

c0005db4 <strcpy>:
c0005db4:	00050793          	mv	a5,a0
c0005db8:	00158593          	addi	a1,a1,1
c0005dbc:	fff5c703          	lbu	a4,-1(a1)
c0005dc0:	00178793          	addi	a5,a5,1
c0005dc4:	fee78fa3          	sb	a4,-1(a5)
c0005dc8:	fe0718e3          	bnez	a4,c0005db8 <strcpy+0x4>
c0005dcc:	00008067          	ret

c0005dd0 <strcmp>:
c0005dd0:	00054783          	lbu	a5,0(a0)
c0005dd4:	0005c703          	lbu	a4,0(a1)
c0005dd8:	02078263          	beqz	a5,c0005dfc <strcmp+0x2c>
c0005ddc:	02e79063          	bne	a5,a4,c0005dfc <strcmp+0x2c>
c0005de0:	00150513          	addi	a0,a0,1
c0005de4:	00054783          	lbu	a5,0(a0)
c0005de8:	00158693          	addi	a3,a1,1
c0005dec:	0015c703          	lbu	a4,1(a1)
c0005df0:	00078663          	beqz	a5,c0005dfc <strcmp+0x2c>
c0005df4:	00068593          	mv	a1,a3
c0005df8:	fee784e3          	beq	a5,a4,c0005de0 <strcmp+0x10>
c0005dfc:	40e78533          	sub	a0,a5,a4
c0005e00:	00008067          	ret

c0005e04 <strchr>:
c0005e04:	00054783          	lbu	a5,0(a0)
c0005e08:	00078e63          	beqz	a5,c0005e24 <strchr+0x20>
c0005e0c:	00f59663          	bne	a1,a5,c0005e18 <strchr+0x14>
c0005e10:	01c0006f          	j	c0005e2c <strchr+0x28>
c0005e14:	00b78a63          	beq	a5,a1,c0005e28 <strchr+0x24>
c0005e18:	00150513          	addi	a0,a0,1
c0005e1c:	00054783          	lbu	a5,0(a0)
c0005e20:	fe079ae3          	bnez	a5,c0005e14 <strchr+0x10>
c0005e24:	00000513          	li	a0,0
c0005e28:	00008067          	ret
c0005e2c:	00008067          	ret

c0005e30 <memset>:
c0005e30:	00c50733          	add	a4,a0,a2
c0005e34:	00050793          	mv	a5,a0
c0005e38:	00060863          	beqz	a2,c0005e48 <memset+0x18>
c0005e3c:	00178793          	addi	a5,a5,1
c0005e40:	feb78fa3          	sb	a1,-1(a5)
c0005e44:	fef71ce3          	bne	a4,a5,c0005e3c <memset+0xc>
c0005e48:	00008067          	ret

c0005e4c <memcpy>:
c0005e4c:	00c586b3          	add	a3,a1,a2
c0005e50:	00050793          	mv	a5,a0
c0005e54:	00060c63          	beqz	a2,c0005e6c <memcpy+0x20>
c0005e58:	00158593          	addi	a1,a1,1
c0005e5c:	fff5c703          	lbu	a4,-1(a1)
c0005e60:	00178793          	addi	a5,a5,1
c0005e64:	fee78fa3          	sb	a4,-1(a5)
c0005e68:	feb698e3          	bne	a3,a1,c0005e58 <memcpy+0xc>
c0005e6c:	00008067          	ret

c0005e70 <printnum>:
c0005e70:	fe010113          	addi	sp,sp,-32
c0005e74:	00912a23          	sw	s1,20(sp)
c0005e78:	01212823          	sw	s2,16(sp)
c0005e7c:	01312623          	sw	s3,12(sp)
c0005e80:	01412423          	sw	s4,8(sp)
c0005e84:	00112e23          	sw	ra,28(sp)
c0005e88:	00812c23          	sw	s0,24(sp)
c0005e8c:	00050493          	mv	s1,a0
c0005e90:	00058913          	mv	s2,a1
c0005e94:	00080993          	mv	s3,a6
c0005e98:	02e67a33          	remu	s4,a2,a4
c0005e9c:	04069e63          	bnez	a3,c0005ef8 <printnum+0x88>
c0005ea0:	04e67c63          	bleu	a4,a2,c0005ef8 <printnum+0x88>
c0005ea4:	fff78413          	addi	s0,a5,-1
c0005ea8:	00805c63          	blez	s0,c0005ec0 <printnum+0x50>
c0005eac:	fff40413          	addi	s0,s0,-1
c0005eb0:	00090593          	mv	a1,s2
c0005eb4:	00098513          	mv	a0,s3
c0005eb8:	000480e7          	jalr	s1
c0005ebc:	fe0418e3          	bnez	s0,c0005eac <printnum+0x3c>
c0005ec0:	00002797          	auipc	a5,0x2
c0005ec4:	47478793          	addi	a5,a5,1140 # c0008334 <error_string+0x1c>
c0005ec8:	014787b3          	add	a5,a5,s4
c0005ecc:	00090593          	mv	a1,s2
c0005ed0:	00048313          	mv	t1,s1
c0005ed4:	01c12083          	lw	ra,28(sp)
c0005ed8:	01812403          	lw	s0,24(sp)
c0005edc:	01412483          	lw	s1,20(sp)
c0005ee0:	01012903          	lw	s2,16(sp)
c0005ee4:	00c12983          	lw	s3,12(sp)
c0005ee8:	00812a03          	lw	s4,8(sp)
c0005eec:	0007c503          	lbu	a0,0(a5)
c0005ef0:	02010113          	addi	sp,sp,32
c0005ef4:	00030067          	jr	t1
c0005ef8:	02e65633          	divu	a2,a2,a4
c0005efc:	00098813          	mv	a6,s3
c0005f00:	fff78793          	addi	a5,a5,-1
c0005f04:	00000693          	li	a3,0
c0005f08:	00090593          	mv	a1,s2
c0005f0c:	00048513          	mv	a0,s1
c0005f10:	f61ff0ef          	jal	ra,c0005e70 <printnum>
c0005f14:	fadff06f          	j	c0005ec0 <printnum+0x50>

c0005f18 <vprintfmt>:
c0005f18:	fb010113          	addi	sp,sp,-80
c0005f1c:	05212023          	sw	s2,64(sp)
c0005f20:	03312e23          	sw	s3,60(sp)
c0005f24:	03412c23          	sw	s4,56(sp)
c0005f28:	03512a23          	sw	s5,52(sp)
c0005f2c:	03612823          	sw	s6,48(sp)
c0005f30:	03712623          	sw	s7,44(sp)
c0005f34:	03812423          	sw	s8,40(sp)
c0005f38:	03912223          	sw	s9,36(sp)
c0005f3c:	04112623          	sw	ra,76(sp)
c0005f40:	04812423          	sw	s0,72(sp)
c0005f44:	04912223          	sw	s1,68(sp)
c0005f48:	03a12023          	sw	s10,32(sp)
c0005f4c:	01b12e23          	sw	s11,28(sp)
c0005f50:	00050993          	mv	s3,a0
c0005f54:	00058913          	mv	s2,a1
c0005f58:	00060c93          	mv	s9,a2
c0005f5c:	00068a93          	mv	s5,a3
c0005f60:	00002a17          	auipc	s4,0x2
c0005f64:	260a0a13          	addi	s4,s4,608 # c00081c0 <default_pmm_manager+0x838>
c0005f68:	02800c13          	li	s8,40
c0005f6c:	fff00b13          	li	s6,-1
c0005f70:	05e00b93          	li	s7,94
c0005f74:	000cc503          	lbu	a0,0(s9)
c0005f78:	02500493          	li	s1,37
c0005f7c:	001c8413          	addi	s0,s9,1
c0005f80:	00950e63          	beq	a0,s1,c0005f9c <vprintfmt+0x84>
c0005f84:	06050463          	beqz	a0,c0005fec <vprintfmt+0xd4>
c0005f88:	00090593          	mv	a1,s2
c0005f8c:	00140413          	addi	s0,s0,1
c0005f90:	000980e7          	jalr	s3
c0005f94:	fff44503          	lbu	a0,-1(s0)
c0005f98:	fe9516e3          	bne	a0,s1,c0005f84 <vprintfmt+0x6c>
c0005f9c:	00044e03          	lbu	t3,0(s0)
c0005fa0:	fff00d13          	li	s10,-1
c0005fa4:	02000813          	li	a6,32
c0005fa8:	00000493          	li	s1,0
c0005fac:	00000593          	li	a1,0
c0005fb0:	000d0d93          	mv	s11,s10
c0005fb4:	05500693          	li	a3,85
c0005fb8:	00100313          	li	t1,1
c0005fbc:	03000893          	li	a7,48
c0005fc0:	00900613          	li	a2,9
c0005fc4:	02d00513          	li	a0,45
c0005fc8:	fdde0713          	addi	a4,t3,-35
c0005fcc:	0ff77713          	andi	a4,a4,255
c0005fd0:	00140c93          	addi	s9,s0,1
c0005fd4:	32e6e463          	bltu	a3,a4,c00062fc <vprintfmt+0x3e4>
c0005fd8:	00271713          	slli	a4,a4,0x2
c0005fdc:	01470733          	add	a4,a4,s4
c0005fe0:	00072783          	lw	a5,0(a4)
c0005fe4:	014787b3          	add	a5,a5,s4
c0005fe8:	00078067          	jr	a5
c0005fec:	04c12083          	lw	ra,76(sp)
c0005ff0:	04812403          	lw	s0,72(sp)
c0005ff4:	04412483          	lw	s1,68(sp)
c0005ff8:	04012903          	lw	s2,64(sp)
c0005ffc:	03c12983          	lw	s3,60(sp)
c0006000:	03812a03          	lw	s4,56(sp)
c0006004:	03412a83          	lw	s5,52(sp)
c0006008:	03012b03          	lw	s6,48(sp)
c000600c:	02c12b83          	lw	s7,44(sp)
c0006010:	02812c03          	lw	s8,40(sp)
c0006014:	02412c83          	lw	s9,36(sp)
c0006018:	02012d03          	lw	s10,32(sp)
c000601c:	01c12d83          	lw	s11,28(sp)
c0006020:	05010113          	addi	sp,sp,80
c0006024:	00008067          	ret
c0006028:	00100793          	li	a5,1
c000602c:	34b7c063          	blt	a5,a1,c000636c <vprintfmt+0x454>
c0006030:	000aa603          	lw	a2,0(s5)
c0006034:	00000693          	li	a3,0
c0006038:	004a8a93          	addi	s5,s5,4
c000603c:	01000713          	li	a4,16
c0006040:	000d8793          	mv	a5,s11
c0006044:	00090593          	mv	a1,s2
c0006048:	00098513          	mv	a0,s3
c000604c:	e25ff0ef          	jal	ra,c0005e70 <printnum>
c0006050:	f25ff06f          	j	c0005f74 <vprintfmt+0x5c>
c0006054:	00144e03          	lbu	t3,1(s0)
c0006058:	00030493          	mv	s1,t1
c000605c:	000c8413          	mv	s0,s9
c0006060:	f69ff06f          	j	c0005fc8 <vprintfmt+0xb0>
c0006064:	000aa503          	lw	a0,0(s5)
c0006068:	00090593          	mv	a1,s2
c000606c:	004a8a93          	addi	s5,s5,4
c0006070:	000980e7          	jalr	s3
c0006074:	f01ff06f          	j	c0005f74 <vprintfmt+0x5c>
c0006078:	00100793          	li	a5,1
c000607c:	30b7c663          	blt	a5,a1,c0006388 <vprintfmt+0x470>
c0006080:	000aa603          	lw	a2,0(s5)
c0006084:	004a8a93          	addi	s5,s5,4
c0006088:	41f65693          	srai	a3,a2,0x1f
c000608c:	00a00713          	li	a4,10
c0006090:	fa06d8e3          	bgez	a3,c0006040 <vprintfmt+0x128>
c0006094:	00090593          	mv	a1,s2
c0006098:	02d00513          	li	a0,45
c000609c:	00d12623          	sw	a3,12(sp)
c00060a0:	00c12423          	sw	a2,8(sp)
c00060a4:	00e12223          	sw	a4,4(sp)
c00060a8:	01012023          	sw	a6,0(sp)
c00060ac:	000980e7          	jalr	s3
c00060b0:	00812603          	lw	a2,8(sp)
c00060b4:	00c12683          	lw	a3,12(sp)
c00060b8:	00012803          	lw	a6,0(sp)
c00060bc:	40c00633          	neg	a2,a2
c00060c0:	00c037b3          	snez	a5,a2
c00060c4:	40d006b3          	neg	a3,a3
c00060c8:	40f686b3          	sub	a3,a3,a5
c00060cc:	00412703          	lw	a4,4(sp)
c00060d0:	f71ff06f          	j	c0006040 <vprintfmt+0x128>
c00060d4:	000aa783          	lw	a5,0(s5)
c00060d8:	00600693          	li	a3,6
c00060dc:	004a8a93          	addi	s5,s5,4
c00060e0:	41f7d713          	srai	a4,a5,0x1f
c00060e4:	00f747b3          	xor	a5,a4,a5
c00060e8:	40e787b3          	sub	a5,a5,a4
c00060ec:	2af6ca63          	blt	a3,a5,c00063a0 <vprintfmt+0x488>
c00060f0:	00279693          	slli	a3,a5,0x2
c00060f4:	00002717          	auipc	a4,0x2
c00060f8:	22470713          	addi	a4,a4,548 # c0008318 <error_string>
c00060fc:	00d70733          	add	a4,a4,a3
c0006100:	00072683          	lw	a3,0(a4)
c0006104:	28068e63          	beqz	a3,c00063a0 <vprintfmt+0x488>
c0006108:	00000617          	auipc	a2,0x0
c000610c:	39c60613          	addi	a2,a2,924 # c00064a4 <etext+0x24>
c0006110:	00090593          	mv	a1,s2
c0006114:	00098513          	mv	a0,s3
c0006118:	314000ef          	jal	ra,c000642c <printfmt>
c000611c:	e59ff06f          	j	c0005f74 <vprintfmt+0x5c>
c0006120:	00144e03          	lbu	t3,1(s0)
c0006124:	00158593          	addi	a1,a1,1
c0006128:	000c8413          	mv	s0,s9
c000612c:	e9dff06f          	j	c0005fc8 <vprintfmt+0xb0>
c0006130:	00100793          	li	a5,1
c0006134:	20b7c063          	blt	a5,a1,c0006334 <vprintfmt+0x41c>
c0006138:	000aa603          	lw	a2,0(s5)
c000613c:	00000693          	li	a3,0
c0006140:	004a8a93          	addi	s5,s5,4
c0006144:	00800713          	li	a4,8
c0006148:	ef9ff06f          	j	c0006040 <vprintfmt+0x128>
c000614c:	03000513          	li	a0,48
c0006150:	00090593          	mv	a1,s2
c0006154:	01012023          	sw	a6,0(sp)
c0006158:	000980e7          	jalr	s3
c000615c:	00090593          	mv	a1,s2
c0006160:	07800513          	li	a0,120
c0006164:	000980e7          	jalr	s3
c0006168:	000aa603          	lw	a2,0(s5)
c000616c:	00000693          	li	a3,0
c0006170:	01000713          	li	a4,16
c0006174:	004a8a93          	addi	s5,s5,4
c0006178:	00012803          	lw	a6,0(sp)
c000617c:	ec5ff06f          	j	c0006040 <vprintfmt+0x128>
c0006180:	000aa403          	lw	s0,0(s5)
c0006184:	004a8793          	addi	a5,s5,4
c0006188:	00f12223          	sw	a5,4(sp)
c000618c:	24040863          	beqz	s0,c00063dc <vprintfmt+0x4c4>
c0006190:	05b05263          	blez	s11,c00061d4 <vprintfmt+0x2bc>
c0006194:	02d00793          	li	a5,45
c0006198:	22f80263          	beq	a6,a5,c00063bc <vprintfmt+0x4a4>
c000619c:	000d0593          	mv	a1,s10
c00061a0:	00040513          	mv	a0,s0
c00061a4:	01012023          	sw	a6,0(sp)
c00061a8:	bcdff0ef          	jal	ra,c0005d74 <strnlen>
c00061ac:	40ad8db3          	sub	s11,s11,a0
c00061b0:	03b05263          	blez	s11,c00061d4 <vprintfmt+0x2bc>
c00061b4:	00012803          	lw	a6,0(sp)
c00061b8:	00080513          	mv	a0,a6
c00061bc:	00090593          	mv	a1,s2
c00061c0:	01012023          	sw	a6,0(sp)
c00061c4:	fffd8d93          	addi	s11,s11,-1
c00061c8:	000980e7          	jalr	s3
c00061cc:	00012803          	lw	a6,0(sp)
c00061d0:	fe0d94e3          	bnez	s11,c00061b8 <vprintfmt+0x2a0>
c00061d4:	00044783          	lbu	a5,0(s0)
c00061d8:	00140a93          	addi	s5,s0,1
c00061dc:	00078513          	mv	a0,a5
c00061e0:	04078c63          	beqz	a5,c0006238 <vprintfmt+0x320>
c00061e4:	03f00413          	li	s0,63
c00061e8:	000d4663          	bltz	s10,c00061f4 <vprintfmt+0x2dc>
c00061ec:	fffd0d13          	addi	s10,s10,-1
c00061f0:	036d0663          	beq	s10,s6,c000621c <vprintfmt+0x304>
c00061f4:	00090593          	mv	a1,s2
c00061f8:	00048663          	beqz	s1,c0006204 <vprintfmt+0x2ec>
c00061fc:	fe078793          	addi	a5,a5,-32
c0006200:	12fbe463          	bltu	s7,a5,c0006328 <vprintfmt+0x410>
c0006204:	000980e7          	jalr	s3
c0006208:	001a8a93          	addi	s5,s5,1
c000620c:	fffac783          	lbu	a5,-1(s5)
c0006210:	fffd8d93          	addi	s11,s11,-1
c0006214:	00078513          	mv	a0,a5
c0006218:	fc0798e3          	bnez	a5,c00061e8 <vprintfmt+0x2d0>
c000621c:	01b05e63          	blez	s11,c0006238 <vprintfmt+0x320>
c0006220:	02000413          	li	s0,32
c0006224:	fffd8d93          	addi	s11,s11,-1
c0006228:	00090593          	mv	a1,s2
c000622c:	00040513          	mv	a0,s0
c0006230:	000980e7          	jalr	s3
c0006234:	fe0d98e3          	bnez	s11,c0006224 <vprintfmt+0x30c>
c0006238:	00412a83          	lw	s5,4(sp)
c000623c:	d39ff06f          	j	c0005f74 <vprintfmt+0x5c>
c0006240:	00100793          	li	a5,1
c0006244:	10b7c663          	blt	a5,a1,c0006350 <vprintfmt+0x438>
c0006248:	000aa603          	lw	a2,0(s5)
c000624c:	00000693          	li	a3,0
c0006250:	004a8a93          	addi	s5,s5,4
c0006254:	00a00713          	li	a4,10
c0006258:	de9ff06f          	j	c0006040 <vprintfmt+0x128>
c000625c:	00144e03          	lbu	t3,1(s0)
c0006260:	00050813          	mv	a6,a0
c0006264:	000c8413          	mv	s0,s9
c0006268:	d61ff06f          	j	c0005fc8 <vprintfmt+0xb0>
c000626c:	00090593          	mv	a1,s2
c0006270:	02500513          	li	a0,37
c0006274:	000980e7          	jalr	s3
c0006278:	cfdff06f          	j	c0005f74 <vprintfmt+0x5c>
c000627c:	000aad03          	lw	s10,0(s5)
c0006280:	00144e03          	lbu	t3,1(s0)
c0006284:	004a8a93          	addi	s5,s5,4
c0006288:	000c8413          	mv	s0,s9
c000628c:	d20ddee3          	bgez	s11,c0005fc8 <vprintfmt+0xb0>
c0006290:	000d0d93          	mv	s11,s10
c0006294:	fff00d13          	li	s10,-1
c0006298:	d31ff06f          	j	c0005fc8 <vprintfmt+0xb0>
c000629c:	00144e03          	lbu	t3,1(s0)
c00062a0:	00088813          	mv	a6,a7
c00062a4:	000c8413          	mv	s0,s9
c00062a8:	d21ff06f          	j	c0005fc8 <vprintfmt+0xb0>
c00062ac:	00144703          	lbu	a4,1(s0)
c00062b0:	fd0e0d13          	addi	s10,t3,-48
c00062b4:	fd070793          	addi	a5,a4,-48
c00062b8:	14f66863          	bltu	a2,a5,c0006408 <vprintfmt+0x4f0>
c00062bc:	000c8413          	mv	s0,s9
c00062c0:	002d1793          	slli	a5,s10,0x2
c00062c4:	01a78d33          	add	s10,a5,s10
c00062c8:	00140413          	addi	s0,s0,1
c00062cc:	001d1d13          	slli	s10,s10,0x1
c00062d0:	00ed0d33          	add	s10,s10,a4
c00062d4:	00044703          	lbu	a4,0(s0)
c00062d8:	fd0d0d13          	addi	s10,s10,-48
c00062dc:	fd070793          	addi	a5,a4,-48
c00062e0:	fef670e3          	bleu	a5,a2,c00062c0 <vprintfmt+0x3a8>
c00062e4:	00070e13          	mv	t3,a4
c00062e8:	fa5ff06f          	j	c000628c <vprintfmt+0x374>
c00062ec:	0e0dc463          	bltz	s11,c00063d4 <vprintfmt+0x4bc>
c00062f0:	00144e03          	lbu	t3,1(s0)
c00062f4:	000c8413          	mv	s0,s9
c00062f8:	cd1ff06f          	j	c0005fc8 <vprintfmt+0xb0>
c00062fc:	00090593          	mv	a1,s2
c0006300:	02500513          	li	a0,37
c0006304:	000980e7          	jalr	s3
c0006308:	fff44783          	lbu	a5,-1(s0)
c000630c:	02500713          	li	a4,37
c0006310:	00040c93          	mv	s9,s0
c0006314:	c6e780e3          	beq	a5,a4,c0005f74 <vprintfmt+0x5c>
c0006318:	fffc8c93          	addi	s9,s9,-1
c000631c:	fffcc783          	lbu	a5,-1(s9)
c0006320:	fee79ce3          	bne	a5,a4,c0006318 <vprintfmt+0x400>
c0006324:	c51ff06f          	j	c0005f74 <vprintfmt+0x5c>
c0006328:	00040513          	mv	a0,s0
c000632c:	000980e7          	jalr	s3
c0006330:	ed9ff06f          	j	c0006208 <vprintfmt+0x2f0>
c0006334:	007a8793          	addi	a5,s5,7
c0006338:	ff87f793          	andi	a5,a5,-8
c000633c:	00878a93          	addi	s5,a5,8
c0006340:	0007a603          	lw	a2,0(a5)
c0006344:	0047a683          	lw	a3,4(a5)
c0006348:	00800713          	li	a4,8
c000634c:	cf5ff06f          	j	c0006040 <vprintfmt+0x128>
c0006350:	007a8793          	addi	a5,s5,7
c0006354:	ff87f793          	andi	a5,a5,-8
c0006358:	00878a93          	addi	s5,a5,8
c000635c:	0007a603          	lw	a2,0(a5)
c0006360:	0047a683          	lw	a3,4(a5)
c0006364:	00a00713          	li	a4,10
c0006368:	cd9ff06f          	j	c0006040 <vprintfmt+0x128>
c000636c:	007a8793          	addi	a5,s5,7
c0006370:	ff87f793          	andi	a5,a5,-8
c0006374:	00878a93          	addi	s5,a5,8
c0006378:	0007a603          	lw	a2,0(a5)
c000637c:	0047a683          	lw	a3,4(a5)
c0006380:	01000713          	li	a4,16
c0006384:	cbdff06f          	j	c0006040 <vprintfmt+0x128>
c0006388:	007a8793          	addi	a5,s5,7
c000638c:	ff87f793          	andi	a5,a5,-8
c0006390:	00878a93          	addi	s5,a5,8
c0006394:	0007a603          	lw	a2,0(a5)
c0006398:	0047a683          	lw	a3,4(a5)
c000639c:	cf1ff06f          	j	c000608c <vprintfmt+0x174>
c00063a0:	00078693          	mv	a3,a5
c00063a4:	00002617          	auipc	a2,0x2
c00063a8:	01860613          	addi	a2,a2,24 # c00083bc <error_string+0xa4>
c00063ac:	00090593          	mv	a1,s2
c00063b0:	00098513          	mv	a0,s3
c00063b4:	078000ef          	jal	ra,c000642c <printfmt>
c00063b8:	bbdff06f          	j	c0005f74 <vprintfmt+0x5c>
c00063bc:	00044783          	lbu	a5,0(s0)
c00063c0:	00140a93          	addi	s5,s0,1
c00063c4:	00078513          	mv	a0,a5
c00063c8:	e4078ce3          	beqz	a5,c0006220 <vprintfmt+0x308>
c00063cc:	03f00413          	li	s0,63
c00063d0:	e19ff06f          	j	c00061e8 <vprintfmt+0x2d0>
c00063d4:	00000d93          	li	s11,0
c00063d8:	f19ff06f          	j	c00062f0 <vprintfmt+0x3d8>
c00063dc:	03b05c63          	blez	s11,c0006414 <vprintfmt+0x4fc>
c00063e0:	02d00793          	li	a5,45
c00063e4:	00002417          	auipc	s0,0x2
c00063e8:	fd040413          	addi	s0,s0,-48 # c00083b4 <error_string+0x9c>
c00063ec:	daf818e3          	bne	a6,a5,c000619c <vprintfmt+0x284>
c00063f0:	00002a97          	auipc	s5,0x2
c00063f4:	fc5a8a93          	addi	s5,s5,-59 # c00083b5 <error_string+0x9d>
c00063f8:	000c0513          	mv	a0,s8
c00063fc:	000c0793          	mv	a5,s8
c0006400:	03f00413          	li	s0,63
c0006404:	de5ff06f          	j	c00061e8 <vprintfmt+0x2d0>
c0006408:	00070e13          	mv	t3,a4
c000640c:	000c8413          	mv	s0,s9
c0006410:	e7dff06f          	j	c000628c <vprintfmt+0x374>
c0006414:	000c0793          	mv	a5,s8
c0006418:	000c0513          	mv	a0,s8
c000641c:	00002a97          	auipc	s5,0x2
c0006420:	f99a8a93          	addi	s5,s5,-103 # c00083b5 <error_string+0x9d>
c0006424:	03f00413          	li	s0,63
c0006428:	dc1ff06f          	j	c00061e8 <vprintfmt+0x2d0>

c000642c <printfmt>:
c000642c:	fc010113          	addi	sp,sp,-64
c0006430:	02c10313          	addi	t1,sp,44
c0006434:	02d12623          	sw	a3,44(sp)
c0006438:	00030693          	mv	a3,t1
c000643c:	00112e23          	sw	ra,28(sp)
c0006440:	02e12823          	sw	a4,48(sp)
c0006444:	02f12a23          	sw	a5,52(sp)
c0006448:	03012c23          	sw	a6,56(sp)
c000644c:	03112e23          	sw	a7,60(sp)
c0006450:	00612623          	sw	t1,12(sp)
c0006454:	ac5ff0ef          	jal	ra,c0005f18 <vprintfmt>
c0006458:	01c12083          	lw	ra,28(sp)
c000645c:	04010113          	addi	sp,sp,64
c0006460:	00008067          	ret

c0006464 <hash32>:
c0006464:	9e3707b7          	lui	a5,0x9e370
c0006468:	00178793          	addi	a5,a5,1 # 9e370001 <sbi_remote_fence_i+0x9e370711>
c000646c:	02f50533          	mul	a0,a0,a5
c0006470:	02000793          	li	a5,32
c0006474:	40b785b3          	sub	a1,a5,a1
c0006478:	00b55533          	srl	a0,a0,a1
c000647c:	00008067          	ret
