
bin/kernel:     file format elf32-littleriscv


Disassembly of section .text:

c0000000 <kern_entry>:
c0000000:	0001a117          	auipc	sp,0x1a
c0000004:	00010113          	mv	sp,sp
c0000008:	0040006f          	j	c000000c <kern_init>

c000000c <kern_init>:
c000000c:	00097517          	auipc	a0,0x97
c0000010:	04450513          	addi	a0,a0,68 # c0097050 <edata>
c0000014:	0009b617          	auipc	a2,0x9b
c0000018:	8a860613          	addi	a2,a2,-1880 # c009a8bc <end>
c000001c:	ff010113          	addi	sp,sp,-16 # c0019ff0 <bootstack+0x1ff0>
c0000020:	40a60633          	sub	a2,a2,a0
c0000024:	00000593          	li	a1,0
c0000028:	00112623          	sw	ra,12(sp)
c000002c:	38c130ef          	jal	ra,c00133b8 <memset>
c0000030:	429000ef          	jal	ra,c0000c58 <cons_init>
c0000034:	00014597          	auipc	a1,0x14
c0000038:	b4058593          	addi	a1,a1,-1216 # c0013b74 <etext>
c000003c:	00014517          	auipc	a0,0x14
c0000040:	b5450513          	addi	a0,a0,-1196 # c0013b90 <etext+0x1c>
c0000044:	104000ef          	jal	ra,c0000148 <cprintf>
c0000048:	36c000ef          	jal	ra,c00003b4 <print_kerninfo>
c000004c:	01d050ef          	jal	ra,c0005868 <pmm_init>
c0000050:	565000ef          	jal	ra,c0000db4 <pic_init>
c0000054:	575000ef          	jal	ra,c0000dc8 <idt_init>
c0000058:	411010ef          	jal	ra,c0001c68 <vmm_init>
c000005c:	3080a0ef          	jal	ra,c000a364 <sched_init>
c0000060:	0340a0ef          	jal	ra,c000a094 <proc_init>
c0000064:	694000ef          	jal	ra,c00006f8 <ide_init>
c0000068:	02c030ef          	jal	ra,c0003094 <swap_init>
c000006c:	1c8080ef          	jal	ra,c0008234 <fs_init>
c0000070:	2c9000ef          	jal	ra,c0000b38 <clock_init>
c0000074:	545000ef          	jal	ra,c0000db8 <intr_enable>
c0000078:	1d80a0ef          	jal	ra,c000a250 <cpu_idle>

c000007c <strdup>:
c000007c:	ff010113          	addi	sp,sp,-16
c0000080:	00112623          	sw	ra,12(sp)
c0000084:	00812423          	sw	s0,8(sp)
c0000088:	00912223          	sw	s1,4(sp)
c000008c:	01212023          	sw	s2,0(sp)
c0000090:	00050913          	mv	s2,a0
c0000094:	23c130ef          	jal	ra,c00132d0 <strlen>
c0000098:	00050413          	mv	s0,a0
c000009c:	00150513          	addi	a0,a0,1
c00000a0:	54d020ef          	jal	ra,c0002dec <kmalloc>
c00000a4:	00050493          	mv	s1,a0
c00000a8:	00050c63          	beqz	a0,c00000c0 <strdup+0x44>
c00000ac:	00040613          	mv	a2,s0
c00000b0:	00090593          	mv	a1,s2
c00000b4:	00848433          	add	s0,s1,s0
c00000b8:	370130ef          	jal	ra,c0013428 <memcpy>
c00000bc:	00040023          	sb	zero,0(s0)
c00000c0:	00c12083          	lw	ra,12(sp)
c00000c4:	00048513          	mv	a0,s1
c00000c8:	00812403          	lw	s0,8(sp)
c00000cc:	00412483          	lw	s1,4(sp)
c00000d0:	00012903          	lw	s2,0(sp)
c00000d4:	01010113          	addi	sp,sp,16
c00000d8:	00008067          	ret

c00000dc <cputch>:
c00000dc:	ff010113          	addi	sp,sp,-16
c00000e0:	00112623          	sw	ra,12(sp)
c00000e4:	00812423          	sw	s0,8(sp)
c00000e8:	00058413          	mv	s0,a1
c00000ec:	375000ef          	jal	ra,c0000c60 <cons_putc>
c00000f0:	00042783          	lw	a5,0(s0)
c00000f4:	00c12083          	lw	ra,12(sp)
c00000f8:	00178793          	addi	a5,a5,1
c00000fc:	00f42023          	sw	a5,0(s0)
c0000100:	00812403          	lw	s0,8(sp)
c0000104:	01010113          	addi	sp,sp,16
c0000108:	00008067          	ret

c000010c <vcprintf>:
c000010c:	fe010113          	addi	sp,sp,-32
c0000110:	00058713          	mv	a4,a1
c0000114:	ffff75b7          	lui	a1,0xffff7
c0000118:	00050693          	mv	a3,a0
c000011c:	00c10613          	addi	a2,sp,12
c0000120:	00000517          	auipc	a0,0x0
c0000124:	fbc50513          	addi	a0,a0,-68 # c00000dc <cputch>
c0000128:	ad958593          	addi	a1,a1,-1319 # ffff6ad9 <sbi_remote_fence_i+0xffff71e9>
c000012c:	00112e23          	sw	ra,28(sp)
c0000130:	00012623          	sw	zero,12(sp)
c0000134:	400130ef          	jal	ra,c0013534 <vprintfmt>
c0000138:	01c12083          	lw	ra,28(sp)
c000013c:	00c12503          	lw	a0,12(sp)
c0000140:	02010113          	addi	sp,sp,32
c0000144:	00008067          	ret

c0000148 <cprintf>:
c0000148:	fc010113          	addi	sp,sp,-64
c000014c:	02410313          	addi	t1,sp,36
c0000150:	02b12223          	sw	a1,36(sp)
c0000154:	ffff75b7          	lui	a1,0xffff7
c0000158:	02c12423          	sw	a2,40(sp)
c000015c:	02d12623          	sw	a3,44(sp)
c0000160:	02e12823          	sw	a4,48(sp)
c0000164:	00050693          	mv	a3,a0
c0000168:	00c10613          	addi	a2,sp,12
c000016c:	00000517          	auipc	a0,0x0
c0000170:	f7050513          	addi	a0,a0,-144 # c00000dc <cputch>
c0000174:	00030713          	mv	a4,t1
c0000178:	ad958593          	addi	a1,a1,-1319 # ffff6ad9 <sbi_remote_fence_i+0xffff71e9>
c000017c:	00112e23          	sw	ra,28(sp)
c0000180:	02f12a23          	sw	a5,52(sp)
c0000184:	03012c23          	sw	a6,56(sp)
c0000188:	03112e23          	sw	a7,60(sp)
c000018c:	00612423          	sw	t1,8(sp)
c0000190:	00012623          	sw	zero,12(sp)
c0000194:	3a0130ef          	jal	ra,c0013534 <vprintfmt>
c0000198:	01c12083          	lw	ra,28(sp)
c000019c:	00c12503          	lw	a0,12(sp)
c00001a0:	04010113          	addi	sp,sp,64
c00001a4:	00008067          	ret

c00001a8 <cputchar>:
c00001a8:	2b90006f          	j	c0000c60 <cons_putc>

c00001ac <getchar>:
c00001ac:	ff010113          	addi	sp,sp,-16
c00001b0:	00112623          	sw	ra,12(sp)
c00001b4:	329000ef          	jal	ra,c0000cdc <cons_getc>
c00001b8:	fe050ee3          	beqz	a0,c00001b4 <getchar+0x8>
c00001bc:	00c12083          	lw	ra,12(sp)
c00001c0:	01010113          	addi	sp,sp,16
c00001c4:	00008067          	ret

c00001c8 <readline>:
c00001c8:	fd010113          	addi	sp,sp,-48
c00001cc:	02112623          	sw	ra,44(sp)
c00001d0:	02812423          	sw	s0,40(sp)
c00001d4:	02912223          	sw	s1,36(sp)
c00001d8:	03212023          	sw	s2,32(sp)
c00001dc:	01312e23          	sw	s3,28(sp)
c00001e0:	01412c23          	sw	s4,24(sp)
c00001e4:	01512a23          	sw	s5,20(sp)
c00001e8:	01612823          	sw	s6,16(sp)
c00001ec:	01712623          	sw	s7,12(sp)
c00001f0:	00050a63          	beqz	a0,c0000204 <readline+0x3c>
c00001f4:	00050593          	mv	a1,a0
c00001f8:	00014517          	auipc	a0,0x14
c00001fc:	9a050513          	addi	a0,a0,-1632 # c0013b98 <etext+0x24>
c0000200:	f49ff0ef          	jal	ra,c0000148 <cprintf>
c0000204:	00000493          	li	s1,0
c0000208:	01f00913          	li	s2,31
c000020c:	00d00993          	li	s3,13
c0000210:	00800a93          	li	s5,8
c0000214:	00a00b13          	li	s6,10
c0000218:	3fe00a13          	li	s4,1022
c000021c:	00097b97          	auipc	s7,0x97
c0000220:	e34b8b93          	addi	s7,s7,-460 # c0097050 <edata>
c0000224:	f89ff0ef          	jal	ra,c00001ac <getchar>
c0000228:	00050413          	mv	s0,a0
c000022c:	06054863          	bltz	a0,c000029c <readline+0xd4>
c0000230:	06a95a63          	ble	a0,s2,c00002a4 <readline+0xdc>
c0000234:	049a5663          	ble	s1,s4,c0000280 <readline+0xb8>
c0000238:	ff3416e3          	bne	s0,s3,c0000224 <readline+0x5c>
c000023c:	00040513          	mv	a0,s0
c0000240:	f69ff0ef          	jal	ra,c00001a8 <cputchar>
c0000244:	00097517          	auipc	a0,0x97
c0000248:	e0c50513          	addi	a0,a0,-500 # c0097050 <edata>
c000024c:	009504b3          	add	s1,a0,s1
c0000250:	00048023          	sb	zero,0(s1)
c0000254:	02c12083          	lw	ra,44(sp)
c0000258:	02812403          	lw	s0,40(sp)
c000025c:	02412483          	lw	s1,36(sp)
c0000260:	02012903          	lw	s2,32(sp)
c0000264:	01c12983          	lw	s3,28(sp)
c0000268:	01812a03          	lw	s4,24(sp)
c000026c:	01412a83          	lw	s5,20(sp)
c0000270:	01012b03          	lw	s6,16(sp)
c0000274:	00c12b83          	lw	s7,12(sp)
c0000278:	03010113          	addi	sp,sp,48
c000027c:	00008067          	ret
c0000280:	f29ff0ef          	jal	ra,c00001a8 <cputchar>
c0000284:	009b87b3          	add	a5,s7,s1
c0000288:	00878023          	sb	s0,0(a5)
c000028c:	f21ff0ef          	jal	ra,c00001ac <getchar>
c0000290:	00148493          	addi	s1,s1,1
c0000294:	00050413          	mv	s0,a0
c0000298:	f8055ce3          	bgez	a0,c0000230 <readline+0x68>
c000029c:	00000513          	li	a0,0
c00002a0:	fb5ff06f          	j	c0000254 <readline+0x8c>
c00002a4:	01551a63          	bne	a0,s5,c00002b8 <readline+0xf0>
c00002a8:	f6048ee3          	beqz	s1,c0000224 <readline+0x5c>
c00002ac:	efdff0ef          	jal	ra,c00001a8 <cputchar>
c00002b0:	fff48493          	addi	s1,s1,-1
c00002b4:	f71ff06f          	j	c0000224 <readline+0x5c>
c00002b8:	f96502e3          	beq	a0,s6,c000023c <readline+0x74>
c00002bc:	f73414e3          	bne	s0,s3,c0000224 <readline+0x5c>
c00002c0:	f7dff06f          	j	c000023c <readline+0x74>

c00002c4 <__panic>:
c00002c4:	fc010113          	addi	sp,sp,-64
c00002c8:	02f12a23          	sw	a5,52(sp)
c00002cc:	00112e23          	sw	ra,28(sp)
c00002d0:	00812c23          	sw	s0,24(sp)
c00002d4:	02d12623          	sw	a3,44(sp)
c00002d8:	02e12823          	sw	a4,48(sp)
c00002dc:	03012c23          	sw	a6,56(sp)
c00002e0:	03112e23          	sw	a7,60(sp)
c00002e4:	0009a797          	auipc	a5,0x9a
c00002e8:	49c7a783          	lw	a5,1180(a5) # c009a780 <is_panic>
c00002ec:	00078a63          	beqz	a5,c0000300 <__panic+0x3c>
c00002f0:	2d1000ef          	jal	ra,c0000dc0 <intr_disable>
c00002f4:	00000513          	li	a0,0
c00002f8:	21c000ef          	jal	ra,c0000514 <kmonitor>
c00002fc:	ff9ff06f          	j	c00002f4 <__panic+0x30>
c0000300:	00100713          	li	a4,1
c0000304:	0009a797          	auipc	a5,0x9a
c0000308:	47c78793          	addi	a5,a5,1148 # c009a780 <is_panic>
c000030c:	00e7a023          	sw	a4,0(a5)
c0000310:	00060413          	mv	s0,a2
c0000314:	02c10793          	addi	a5,sp,44
c0000318:	00058613          	mv	a2,a1
c000031c:	00050593          	mv	a1,a0
c0000320:	00014517          	auipc	a0,0x14
c0000324:	87c50513          	addi	a0,a0,-1924 # c0013b9c <etext+0x28>
c0000328:	00f12623          	sw	a5,12(sp)
c000032c:	e1dff0ef          	jal	ra,c0000148 <cprintf>
c0000330:	00c12583          	lw	a1,12(sp)
c0000334:	00040513          	mv	a0,s0
c0000338:	dd5ff0ef          	jal	ra,c000010c <vcprintf>
c000033c:	00015517          	auipc	a0,0x15
c0000340:	3d450513          	addi	a0,a0,980 # c0015710 <default_pmm_manager+0x420>
c0000344:	e05ff0ef          	jal	ra,c0000148 <cprintf>
c0000348:	fa9ff06f          	j	c00002f0 <__panic+0x2c>

c000034c <__warn>:
c000034c:	fc010113          	addi	sp,sp,-64
c0000350:	00812c23          	sw	s0,24(sp)
c0000354:	02f12a23          	sw	a5,52(sp)
c0000358:	00060413          	mv	s0,a2
c000035c:	02c10793          	addi	a5,sp,44
c0000360:	00058613          	mv	a2,a1
c0000364:	00050593          	mv	a1,a0
c0000368:	00014517          	auipc	a0,0x14
c000036c:	85050513          	addi	a0,a0,-1968 # c0013bb8 <etext+0x44>
c0000370:	00112e23          	sw	ra,28(sp)
c0000374:	02d12623          	sw	a3,44(sp)
c0000378:	02e12823          	sw	a4,48(sp)
c000037c:	03012c23          	sw	a6,56(sp)
c0000380:	03112e23          	sw	a7,60(sp)
c0000384:	00f12623          	sw	a5,12(sp)
c0000388:	dc1ff0ef          	jal	ra,c0000148 <cprintf>
c000038c:	00c12583          	lw	a1,12(sp)
c0000390:	00040513          	mv	a0,s0
c0000394:	d79ff0ef          	jal	ra,c000010c <vcprintf>
c0000398:	00015517          	auipc	a0,0x15
c000039c:	37850513          	addi	a0,a0,888 # c0015710 <default_pmm_manager+0x420>
c00003a0:	da9ff0ef          	jal	ra,c0000148 <cprintf>
c00003a4:	01c12083          	lw	ra,28(sp)
c00003a8:	01812403          	lw	s0,24(sp)
c00003ac:	04010113          	addi	sp,sp,64
c00003b0:	00008067          	ret

c00003b4 <print_kerninfo>:
c00003b4:	ff010113          	addi	sp,sp,-16
c00003b8:	00014517          	auipc	a0,0x14
c00003bc:	84850513          	addi	a0,a0,-1976 # c0013c00 <etext+0x8c>
c00003c0:	00112623          	sw	ra,12(sp)
c00003c4:	d85ff0ef          	jal	ra,c0000148 <cprintf>
c00003c8:	00000597          	auipc	a1,0x0
c00003cc:	c4458593          	addi	a1,a1,-956 # c000000c <kern_init>
c00003d0:	00014517          	auipc	a0,0x14
c00003d4:	84c50513          	addi	a0,a0,-1972 # c0013c1c <etext+0xa8>
c00003d8:	d71ff0ef          	jal	ra,c0000148 <cprintf>
c00003dc:	00013597          	auipc	a1,0x13
c00003e0:	79858593          	addi	a1,a1,1944 # c0013b74 <etext>
c00003e4:	00014517          	auipc	a0,0x14
c00003e8:	85450513          	addi	a0,a0,-1964 # c0013c38 <etext+0xc4>
c00003ec:	d5dff0ef          	jal	ra,c0000148 <cprintf>
c00003f0:	00097597          	auipc	a1,0x97
c00003f4:	c6058593          	addi	a1,a1,-928 # c0097050 <edata>
c00003f8:	00014517          	auipc	a0,0x14
c00003fc:	85c50513          	addi	a0,a0,-1956 # c0013c54 <etext+0xe0>
c0000400:	d49ff0ef          	jal	ra,c0000148 <cprintf>
c0000404:	0009a597          	auipc	a1,0x9a
c0000408:	4b858593          	addi	a1,a1,1208 # c009a8bc <end>
c000040c:	00014517          	auipc	a0,0x14
c0000410:	86450513          	addi	a0,a0,-1948 # c0013c70 <etext+0xfc>
c0000414:	d35ff0ef          	jal	ra,c0000148 <cprintf>
c0000418:	0009b597          	auipc	a1,0x9b
c000041c:	8a358593          	addi	a1,a1,-1885 # c009acbb <end+0x3ff>
c0000420:	00000797          	auipc	a5,0x0
c0000424:	bec78793          	addi	a5,a5,-1044 # c000000c <kern_init>
c0000428:	40f587b3          	sub	a5,a1,a5
c000042c:	41f7d593          	srai	a1,a5,0x1f
c0000430:	3ff5f593          	andi	a1,a1,1023
c0000434:	00c12083          	lw	ra,12(sp)
c0000438:	00f585b3          	add	a1,a1,a5
c000043c:	40a5d593          	srai	a1,a1,0xa
c0000440:	00014517          	auipc	a0,0x14
c0000444:	84c50513          	addi	a0,a0,-1972 # c0013c8c <etext+0x118>
c0000448:	01010113          	addi	sp,sp,16
c000044c:	cfdff06f          	j	c0000148 <cprintf>

c0000450 <print_stackframe>:
c0000450:	ff010113          	addi	sp,sp,-16
c0000454:	00013617          	auipc	a2,0x13
c0000458:	78460613          	addi	a2,a2,1924 # c0013bd8 <etext+0x64>
c000045c:	05b00593          	li	a1,91
c0000460:	00013517          	auipc	a0,0x13
c0000464:	78c50513          	addi	a0,a0,1932 # c0013bec <etext+0x78>
c0000468:	00112623          	sw	ra,12(sp)
c000046c:	e59ff0ef          	jal	ra,c00002c4 <__panic>

c0000470 <mon_help>:
c0000470:	ff010113          	addi	sp,sp,-16
c0000474:	00014617          	auipc	a2,0x14
c0000478:	8fc60613          	addi	a2,a2,-1796 # c0013d70 <commands+0xb8>
c000047c:	00014597          	auipc	a1,0x14
c0000480:	91458593          	addi	a1,a1,-1772 # c0013d90 <commands+0xd8>
c0000484:	00014517          	auipc	a0,0x14
c0000488:	91450513          	addi	a0,a0,-1772 # c0013d98 <commands+0xe0>
c000048c:	00112623          	sw	ra,12(sp)
c0000490:	cb9ff0ef          	jal	ra,c0000148 <cprintf>
c0000494:	00014617          	auipc	a2,0x14
c0000498:	91060613          	addi	a2,a2,-1776 # c0013da4 <commands+0xec>
c000049c:	00014597          	auipc	a1,0x14
c00004a0:	93058593          	addi	a1,a1,-1744 # c0013dcc <commands+0x114>
c00004a4:	00014517          	auipc	a0,0x14
c00004a8:	8f450513          	addi	a0,a0,-1804 # c0013d98 <commands+0xe0>
c00004ac:	c9dff0ef          	jal	ra,c0000148 <cprintf>
c00004b0:	00014617          	auipc	a2,0x14
c00004b4:	92860613          	addi	a2,a2,-1752 # c0013dd8 <commands+0x120>
c00004b8:	00014597          	auipc	a1,0x14
c00004bc:	94058593          	addi	a1,a1,-1728 # c0013df8 <commands+0x140>
c00004c0:	00014517          	auipc	a0,0x14
c00004c4:	8d850513          	addi	a0,a0,-1832 # c0013d98 <commands+0xe0>
c00004c8:	c81ff0ef          	jal	ra,c0000148 <cprintf>
c00004cc:	00c12083          	lw	ra,12(sp)
c00004d0:	00000513          	li	a0,0
c00004d4:	01010113          	addi	sp,sp,16
c00004d8:	00008067          	ret

c00004dc <mon_kerninfo>:
c00004dc:	ff010113          	addi	sp,sp,-16
c00004e0:	00112623          	sw	ra,12(sp)
c00004e4:	ed1ff0ef          	jal	ra,c00003b4 <print_kerninfo>
c00004e8:	00c12083          	lw	ra,12(sp)
c00004ec:	00000513          	li	a0,0
c00004f0:	01010113          	addi	sp,sp,16
c00004f4:	00008067          	ret

c00004f8 <mon_backtrace>:
c00004f8:	ff010113          	addi	sp,sp,-16
c00004fc:	00112623          	sw	ra,12(sp)
c0000500:	f51ff0ef          	jal	ra,c0000450 <print_stackframe>
c0000504:	00c12083          	lw	ra,12(sp)
c0000508:	00000513          	li	a0,0
c000050c:	01010113          	addi	sp,sp,16
c0000510:	00008067          	ret

c0000514 <kmonitor>:
c0000514:	f9010113          	addi	sp,sp,-112
c0000518:	05812423          	sw	s8,72(sp)
c000051c:	00050c13          	mv	s8,a0
c0000520:	00013517          	auipc	a0,0x13
c0000524:	7bc50513          	addi	a0,a0,1980 # c0013cdc <commands+0x24>
c0000528:	06112623          	sw	ra,108(sp)
c000052c:	06812423          	sw	s0,104(sp)
c0000530:	06912223          	sw	s1,100(sp)
c0000534:	07212023          	sw	s2,96(sp)
c0000538:	05312e23          	sw	s3,92(sp)
c000053c:	05412c23          	sw	s4,88(sp)
c0000540:	05512a23          	sw	s5,84(sp)
c0000544:	05612823          	sw	s6,80(sp)
c0000548:	05712623          	sw	s7,76(sp)
c000054c:	05912223          	sw	s9,68(sp)
c0000550:	05a12023          	sw	s10,64(sp)
c0000554:	bf5ff0ef          	jal	ra,c0000148 <cprintf>
c0000558:	00013517          	auipc	a0,0x13
c000055c:	7ac50513          	addi	a0,a0,1964 # c0013d04 <commands+0x4c>
c0000560:	be9ff0ef          	jal	ra,c0000148 <cprintf>
c0000564:	000c0663          	beqz	s8,c0000570 <kmonitor+0x5c>
c0000568:	000c0513          	mv	a0,s8
c000056c:	28d000ef          	jal	ra,c0000ff8 <print_trapframe>
c0000570:	3ffff317          	auipc	t1,0x3ffff
c0000574:	320300e7          	jalr	800(t1) # fffff890 <sbi_shutdown>
c0000578:	00013c97          	auipc	s9,0x13
c000057c:	740c8c93          	addi	s9,s9,1856 # c0013cb8 <commands>
c0000580:	00013997          	auipc	s3,0x13
c0000584:	7ac98993          	addi	s3,s3,1964 # c0013d2c <commands+0x74>
c0000588:	00013497          	auipc	s1,0x13
c000058c:	7a848493          	addi	s1,s1,1960 # c0013d30 <commands+0x78>
c0000590:	00f00a13          	li	s4,15
c0000594:	01000b93          	li	s7,16
c0000598:	00013b17          	auipc	s6,0x13
c000059c:	7a0b0b13          	addi	s6,s6,1952 # c0013d38 <commands+0x80>
c00005a0:	00300a93          	li	s5,3
c00005a4:	00098513          	mv	a0,s3
c00005a8:	c21ff0ef          	jal	ra,c00001c8 <readline>
c00005ac:	00050413          	mv	s0,a0
c00005b0:	fe050ae3          	beqz	a0,c00005a4 <kmonitor+0x90>
c00005b4:	00054583          	lbu	a1,0(a0)
c00005b8:	00000913          	li	s2,0
c00005bc:	0a059463          	bnez	a1,c0000664 <kmonitor+0x150>
c00005c0:	fe0902e3          	beqz	s2,c00005a4 <kmonitor+0x90>
c00005c4:	00012583          	lw	a1,0(sp)
c00005c8:	00013d17          	auipc	s10,0x13
c00005cc:	6f0d0d13          	addi	s10,s10,1776 # c0013cb8 <commands>
c00005d0:	00013517          	auipc	a0,0x13
c00005d4:	7c050513          	addi	a0,a0,1984 # c0013d90 <commands+0xd8>
c00005d8:	00000413          	li	s0,0
c00005dc:	00cd0d13          	addi	s10,s10,12
c00005e0:	579120ef          	jal	ra,c0013358 <strcmp>
c00005e4:	02050063          	beqz	a0,c0000604 <kmonitor+0xf0>
c00005e8:	00140413          	addi	s0,s0,1
c00005ec:	0f540c63          	beq	s0,s5,c00006e4 <kmonitor+0x1d0>
c00005f0:	000d2503          	lw	a0,0(s10)
c00005f4:	00012583          	lw	a1,0(sp)
c00005f8:	00cd0d13          	addi	s10,s10,12
c00005fc:	55d120ef          	jal	ra,c0013358 <strcmp>
c0000600:	fe0514e3          	bnez	a0,c00005e8 <kmonitor+0xd4>
c0000604:	00141793          	slli	a5,s0,0x1
c0000608:	008787b3          	add	a5,a5,s0
c000060c:	00279793          	slli	a5,a5,0x2
c0000610:	00fc87b3          	add	a5,s9,a5
c0000614:	0087a783          	lw	a5,8(a5)
c0000618:	000c0613          	mv	a2,s8
c000061c:	00410593          	addi	a1,sp,4
c0000620:	fff90513          	addi	a0,s2,-1
c0000624:	000780e7          	jalr	a5
c0000628:	f6055ee3          	bgez	a0,c00005a4 <kmonitor+0x90>
c000062c:	06c12083          	lw	ra,108(sp)
c0000630:	06812403          	lw	s0,104(sp)
c0000634:	06412483          	lw	s1,100(sp)
c0000638:	06012903          	lw	s2,96(sp)
c000063c:	05c12983          	lw	s3,92(sp)
c0000640:	05812a03          	lw	s4,88(sp)
c0000644:	05412a83          	lw	s5,84(sp)
c0000648:	05012b03          	lw	s6,80(sp)
c000064c:	04c12b83          	lw	s7,76(sp)
c0000650:	04812c03          	lw	s8,72(sp)
c0000654:	04412c83          	lw	s9,68(sp)
c0000658:	04012d03          	lw	s10,64(sp)
c000065c:	07010113          	addi	sp,sp,112
c0000660:	00008067          	ret
c0000664:	00048513          	mv	a0,s1
c0000668:	525120ef          	jal	ra,c001338c <strchr>
c000066c:	00050c63          	beqz	a0,c0000684 <kmonitor+0x170>
c0000670:	00144583          	lbu	a1,1(s0)
c0000674:	00040023          	sb	zero,0(s0)
c0000678:	00140413          	addi	s0,s0,1
c000067c:	f40582e3          	beqz	a1,c00005c0 <kmonitor+0xac>
c0000680:	fe5ff06f          	j	c0000664 <kmonitor+0x150>
c0000684:	00044783          	lbu	a5,0(s0)
c0000688:	f2078ce3          	beqz	a5,c00005c0 <kmonitor+0xac>
c000068c:	05490463          	beq	s2,s4,c00006d4 <kmonitor+0x1c0>
c0000690:	00291793          	slli	a5,s2,0x2
c0000694:	04010713          	addi	a4,sp,64
c0000698:	00f707b3          	add	a5,a4,a5
c000069c:	fc87a023          	sw	s0,-64(a5)
c00006a0:	00044583          	lbu	a1,0(s0)
c00006a4:	00190913          	addi	s2,s2,1
c00006a8:	00059a63          	bnez	a1,c00006bc <kmonitor+0x1a8>
c00006ac:	f19ff06f          	j	c00005c4 <kmonitor+0xb0>
c00006b0:	00140413          	addi	s0,s0,1
c00006b4:	00044583          	lbu	a1,0(s0)
c00006b8:	f00586e3          	beqz	a1,c00005c4 <kmonitor+0xb0>
c00006bc:	00048513          	mv	a0,s1
c00006c0:	4cd120ef          	jal	ra,c001338c <strchr>
c00006c4:	fe0506e3          	beqz	a0,c00006b0 <kmonitor+0x19c>
c00006c8:	00044583          	lbu	a1,0(s0)
c00006cc:	ee058ae3          	beqz	a1,c00005c0 <kmonitor+0xac>
c00006d0:	f95ff06f          	j	c0000664 <kmonitor+0x150>
c00006d4:	000b8593          	mv	a1,s7
c00006d8:	000b0513          	mv	a0,s6
c00006dc:	a6dff0ef          	jal	ra,c0000148 <cprintf>
c00006e0:	fb1ff06f          	j	c0000690 <kmonitor+0x17c>
c00006e4:	00012583          	lw	a1,0(sp)
c00006e8:	00013517          	auipc	a0,0x13
c00006ec:	67050513          	addi	a0,a0,1648 # c0013d58 <commands+0xa0>
c00006f0:	a59ff0ef          	jal	ra,c0000148 <cprintf>
c00006f4:	eb1ff06f          	j	c00005a4 <kmonitor+0x90>

c00006f8 <ide_init>:
c00006f8:	ff010113          	addi	sp,sp,-16
c00006fc:	00097797          	auipc	a5,0x97
c0000700:	d5478793          	addi	a5,a5,-684 # c0097450 <ide_devices>
c0000704:	00112623          	sw	ra,12(sp)
c0000708:	0007a023          	sw	zero,0(a5)
c000070c:	0207ae23          	sw	zero,60(a5)
c0000710:	0607ac23          	sw	zero,120(a5)
c0000714:	0a07aa23          	sw	zero,180(a5)
c0000718:	00097597          	auipc	a1,0x97
c000071c:	d7458593          	addi	a1,a1,-652 # c009748c <ide_devices+0x3c>
c0000720:	00100513          	li	a0,1
c0000724:	2ec000ef          	jal	ra,c0000a10 <ramdisk_init>
c0000728:	00097797          	auipc	a5,0x97
c000072c:	d647a783          	lw	a5,-668(a5) # c009748c <ide_devices+0x3c>
c0000730:	02078663          	beqz	a5,c000075c <ide_init+0x64>
c0000734:	00097597          	auipc	a1,0x97
c0000738:	d9458593          	addi	a1,a1,-620 # c00974c8 <ide_devices+0x78>
c000073c:	00200513          	li	a0,2
c0000740:	2d0000ef          	jal	ra,c0000a10 <ramdisk_init>
c0000744:	00097797          	auipc	a5,0x97
c0000748:	d847a783          	lw	a5,-636(a5) # c00974c8 <ide_devices+0x78>
c000074c:	02078863          	beqz	a5,c000077c <ide_init+0x84>
c0000750:	00c12083          	lw	ra,12(sp)
c0000754:	01010113          	addi	sp,sp,16
c0000758:	00008067          	ret
c000075c:	00013697          	auipc	a3,0x13
c0000760:	6a868693          	addi	a3,a3,1704 # c0013e04 <commands+0x14c>
c0000764:	00013617          	auipc	a2,0x13
c0000768:	6b860613          	addi	a2,a2,1720 # c0013e1c <commands+0x164>
c000076c:	01100593          	li	a1,17
c0000770:	00013517          	auipc	a0,0x13
c0000774:	6c450513          	addi	a0,a0,1732 # c0013e34 <commands+0x17c>
c0000778:	b4dff0ef          	jal	ra,c00002c4 <__panic>
c000077c:	00013697          	auipc	a3,0x13
c0000780:	6cc68693          	addi	a3,a3,1740 # c0013e48 <commands+0x190>
c0000784:	00013617          	auipc	a2,0x13
c0000788:	69860613          	addi	a2,a2,1688 # c0013e1c <commands+0x164>
c000078c:	01400593          	li	a1,20
c0000790:	00013517          	auipc	a0,0x13
c0000794:	6a450513          	addi	a0,a0,1700 # c0013e34 <commands+0x17c>
c0000798:	b2dff0ef          	jal	ra,c00002c4 <__panic>

c000079c <ide_device_valid>:
c000079c:	00300793          	li	a5,3
c00007a0:	02a7e463          	bltu	a5,a0,c00007c8 <ide_device_valid+0x2c>
c00007a4:	00451793          	slli	a5,a0,0x4
c00007a8:	40a78533          	sub	a0,a5,a0
c00007ac:	00251513          	slli	a0,a0,0x2
c00007b0:	00097797          	auipc	a5,0x97
c00007b4:	ca078793          	addi	a5,a5,-864 # c0097450 <ide_devices>
c00007b8:	00a78533          	add	a0,a5,a0
c00007bc:	00052503          	lw	a0,0(a0)
c00007c0:	00a03533          	snez	a0,a0
c00007c4:	00008067          	ret
c00007c8:	00000513          	li	a0,0
c00007cc:	00008067          	ret

c00007d0 <ide_device_size>:
c00007d0:	00300793          	li	a5,3
c00007d4:	02a7e663          	bltu	a5,a0,c0000800 <ide_device_size+0x30>
c00007d8:	00451793          	slli	a5,a0,0x4
c00007dc:	40a78533          	sub	a0,a5,a0
c00007e0:	00251513          	slli	a0,a0,0x2
c00007e4:	00097797          	auipc	a5,0x97
c00007e8:	c6c78793          	addi	a5,a5,-916 # c0097450 <ide_devices>
c00007ec:	00a78533          	add	a0,a5,a0
c00007f0:	00052783          	lw	a5,0(a0)
c00007f4:	00078663          	beqz	a5,c0000800 <ide_device_size+0x30>
c00007f8:	00852503          	lw	a0,8(a0)
c00007fc:	00008067          	ret
c0000800:	00000513          	li	a0,0
c0000804:	00008067          	ret

c0000808 <ide_read_secs>:
c0000808:	ff010113          	addi	sp,sp,-16
c000080c:	00112623          	sw	ra,12(sp)
c0000810:	08000793          	li	a5,128
c0000814:	04d7e663          	bltu	a5,a3,c0000860 <ide_read_secs+0x58>
c0000818:	00300793          	li	a5,3
c000081c:	04a7e263          	bltu	a5,a0,c0000860 <ide_read_secs+0x58>
c0000820:	00451793          	slli	a5,a0,0x4
c0000824:	40a78533          	sub	a0,a5,a0
c0000828:	00251513          	slli	a0,a0,0x2
c000082c:	00097797          	auipc	a5,0x97
c0000830:	c2478793          	addi	a5,a5,-988 # c0097450 <ide_devices>
c0000834:	00a78533          	add	a0,a5,a0
c0000838:	00052783          	lw	a5,0(a0)
c000083c:	02078263          	beqz	a5,c0000860 <ide_read_secs+0x58>
c0000840:	100007b7          	lui	a5,0x10000
c0000844:	02f5fe63          	bleu	a5,a1,c0000880 <ide_read_secs+0x78>
c0000848:	00b68733          	add	a4,a3,a1
c000084c:	02e7ea63          	bltu	a5,a4,c0000880 <ide_read_secs+0x78>
c0000850:	00c12083          	lw	ra,12(sp)
c0000854:	03452303          	lw	t1,52(a0)
c0000858:	01010113          	addi	sp,sp,16
c000085c:	00030067          	jr	t1
c0000860:	00013697          	auipc	a3,0x13
c0000864:	60068693          	addi	a3,a3,1536 # c0013e60 <commands+0x1a8>
c0000868:	00013617          	auipc	a2,0x13
c000086c:	5b460613          	addi	a2,a2,1460 # c0013e1c <commands+0x164>
c0000870:	02200593          	li	a1,34
c0000874:	00013517          	auipc	a0,0x13
c0000878:	5c050513          	addi	a0,a0,1472 # c0013e34 <commands+0x17c>
c000087c:	a49ff0ef          	jal	ra,c00002c4 <__panic>
c0000880:	00013697          	auipc	a3,0x13
c0000884:	60868693          	addi	a3,a3,1544 # c0013e88 <commands+0x1d0>
c0000888:	00013617          	auipc	a2,0x13
c000088c:	59460613          	addi	a2,a2,1428 # c0013e1c <commands+0x164>
c0000890:	02300593          	li	a1,35
c0000894:	00013517          	auipc	a0,0x13
c0000898:	5a050513          	addi	a0,a0,1440 # c0013e34 <commands+0x17c>
c000089c:	a29ff0ef          	jal	ra,c00002c4 <__panic>

c00008a0 <ide_write_secs>:
c00008a0:	ff010113          	addi	sp,sp,-16
c00008a4:	00112623          	sw	ra,12(sp)
c00008a8:	08000793          	li	a5,128
c00008ac:	04d7e663          	bltu	a5,a3,c00008f8 <ide_write_secs+0x58>
c00008b0:	00300793          	li	a5,3
c00008b4:	04a7e263          	bltu	a5,a0,c00008f8 <ide_write_secs+0x58>
c00008b8:	00451793          	slli	a5,a0,0x4
c00008bc:	40a78533          	sub	a0,a5,a0
c00008c0:	00251513          	slli	a0,a0,0x2
c00008c4:	00097797          	auipc	a5,0x97
c00008c8:	b8c78793          	addi	a5,a5,-1140 # c0097450 <ide_devices>
c00008cc:	00a78533          	add	a0,a5,a0
c00008d0:	00052783          	lw	a5,0(a0)
c00008d4:	02078263          	beqz	a5,c00008f8 <ide_write_secs+0x58>
c00008d8:	100007b7          	lui	a5,0x10000
c00008dc:	02f5fe63          	bleu	a5,a1,c0000918 <ide_write_secs+0x78>
c00008e0:	00b68733          	add	a4,a3,a1
c00008e4:	02e7ea63          	bltu	a5,a4,c0000918 <ide_write_secs+0x78>
c00008e8:	00c12083          	lw	ra,12(sp)
c00008ec:	03852303          	lw	t1,56(a0)
c00008f0:	01010113          	addi	sp,sp,16
c00008f4:	00030067          	jr	t1
c00008f8:	00013697          	auipc	a3,0x13
c00008fc:	56868693          	addi	a3,a3,1384 # c0013e60 <commands+0x1a8>
c0000900:	00013617          	auipc	a2,0x13
c0000904:	51c60613          	addi	a2,a2,1308 # c0013e1c <commands+0x164>
c0000908:	02900593          	li	a1,41
c000090c:	00013517          	auipc	a0,0x13
c0000910:	52850513          	addi	a0,a0,1320 # c0013e34 <commands+0x17c>
c0000914:	9b1ff0ef          	jal	ra,c00002c4 <__panic>
c0000918:	00013697          	auipc	a3,0x13
c000091c:	57068693          	addi	a3,a3,1392 # c0013e88 <commands+0x1d0>
c0000920:	00013617          	auipc	a2,0x13
c0000924:	4fc60613          	addi	a2,a2,1276 # c0013e1c <commands+0x164>
c0000928:	02a00593          	li	a1,42
c000092c:	00013517          	auipc	a0,0x13
c0000930:	50850513          	addi	a0,a0,1288 # c0013e34 <commands+0x17c>
c0000934:	991ff0ef          	jal	ra,c00002c4 <__panic>

c0000938 <ramdisk_write>:
c0000938:	00852783          	lw	a5,8(a0)
c000093c:	ff010113          	addi	sp,sp,-16
c0000940:	00112623          	sw	ra,12(sp)
c0000944:	40b787b3          	sub	a5,a5,a1
c0000948:	00058713          	mv	a4,a1
c000094c:	00060593          	mv	a1,a2
c0000950:	00f6f463          	bleu	a5,a3,c0000958 <ramdisk_write+0x20>
c0000954:	00068793          	mv	a5,a3
c0000958:	00c52503          	lw	a0,12(a0)
c000095c:	00971713          	slli	a4,a4,0x9
c0000960:	00979613          	slli	a2,a5,0x9
c0000964:	00a70533          	add	a0,a4,a0
c0000968:	2c1120ef          	jal	ra,c0013428 <memcpy>
c000096c:	00c12083          	lw	ra,12(sp)
c0000970:	00000513          	li	a0,0
c0000974:	01010113          	addi	sp,sp,16
c0000978:	00008067          	ret

c000097c <ramdisk_read>:
c000097c:	00852783          	lw	a5,8(a0)
c0000980:	ff010113          	addi	sp,sp,-16
c0000984:	00112623          	sw	ra,12(sp)
c0000988:	40b787b3          	sub	a5,a5,a1
c000098c:	00050713          	mv	a4,a0
c0000990:	00060513          	mv	a0,a2
c0000994:	00f6f463          	bleu	a5,a3,c000099c <ramdisk_read+0x20>
c0000998:	00068793          	mv	a5,a3
c000099c:	00c72703          	lw	a4,12(a4)
c00009a0:	00959593          	slli	a1,a1,0x9
c00009a4:	00979613          	slli	a2,a5,0x9
c00009a8:	00e585b3          	add	a1,a1,a4
c00009ac:	27d120ef          	jal	ra,c0013428 <memcpy>
c00009b0:	00c12083          	lw	ra,12(sp)
c00009b4:	00000513          	li	a0,0
c00009b8:	01010113          	addi	sp,sp,16
c00009bc:	00008067          	ret

c00009c0 <check_initrd>:
c00009c0:	ff010113          	addi	sp,sp,-16
c00009c4:	00112623          	sw	ra,12(sp)
c00009c8:	02b50663          	beq	a0,a1,c00009f4 <check_initrd+0x34>
c00009cc:	40a586b3          	sub	a3,a1,a0
c00009d0:	fff58613          	addi	a2,a1,-1
c00009d4:	00050593          	mv	a1,a0
c00009d8:	00013517          	auipc	a0,0x13
c00009dc:	50450513          	addi	a0,a0,1284 # c0013edc <commands+0x224>
c00009e0:	f68ff0ef          	jal	ra,c0000148 <cprintf>
c00009e4:	00c12083          	lw	ra,12(sp)
c00009e8:	00100513          	li	a0,1
c00009ec:	01010113          	addi	sp,sp,16
c00009f0:	00008067          	ret
c00009f4:	00013517          	auipc	a0,0x13
c00009f8:	4d050513          	addi	a0,a0,1232 # c0013ec4 <commands+0x20c>
c00009fc:	f4cff0ef          	jal	ra,c0000148 <cprintf>
c0000a00:	00c12083          	lw	ra,12(sp)
c0000a04:	00000513          	li	a0,0
c0000a08:	01010113          	addi	sp,sp,16
c0000a0c:	00008067          	ret

c0000a10 <ramdisk_init>:
c0000a10:	fe010113          	addi	sp,sp,-32
c0000a14:	00812c23          	sw	s0,24(sp)
c0000a18:	00058413          	mv	s0,a1
c0000a1c:	01212823          	sw	s2,16(sp)
c0000a20:	03c00613          	li	a2,60
c0000a24:	00050913          	mv	s2,a0
c0000a28:	00000593          	li	a1,0
c0000a2c:	00040513          	mv	a0,s0
c0000a30:	00112e23          	sw	ra,28(sp)
c0000a34:	00912a23          	sw	s1,20(sp)
c0000a38:	01312623          	sw	s3,12(sp)
c0000a3c:	17d120ef          	jal	ra,c00133b8 <memset>
c0000a40:	00100793          	li	a5,1
c0000a44:	08f90863          	beq	s2,a5,c0000ad4 <ramdisk_init+0xc4>
c0000a48:	00200793          	li	a5,2
c0000a4c:	00096497          	auipc	s1,0x96
c0000a50:	5b448493          	addi	s1,s1,1460 # c0097000 <swap_manager_fifo>
c0000a54:	00021997          	auipc	s3,0x21
c0000a58:	2ac98993          	addi	s3,s3,684 # c0021d00 <_binary_bin_sfs_img_start>
c0000a5c:	08f91663          	bne	s2,a5,c0000ae8 <ramdisk_init+0xd8>
c0000a60:	00048593          	mv	a1,s1
c0000a64:	00098513          	mv	a0,s3
c0000a68:	f59ff0ef          	jal	ra,c00009c0 <check_initrd>
c0000a6c:	04050663          	beqz	a0,c0000ab8 <ramdisk_init+0xa8>
c0000a70:	00100793          	li	a5,1
c0000a74:	413484b3          	sub	s1,s1,s3
c0000a78:	00f42023          	sw	a5,0(s0)
c0000a7c:	0094d493          	srli	s1,s1,0x9
c0000a80:	fff00793          	li	a5,-1
c0000a84:	00f42223          	sw	a5,4(s0)
c0000a88:	00942423          	sw	s1,8(s0)
c0000a8c:	01342623          	sw	s3,12(s0)
c0000a90:	00013597          	auipc	a1,0x13
c0000a94:	4a058593          	addi	a1,a1,1184 # c0013f30 <commands+0x278>
c0000a98:	01440513          	addi	a0,s0,20
c0000a9c:	0a1120ef          	jal	ra,c001333c <strcpy>
c0000aa0:	00000797          	auipc	a5,0x0
c0000aa4:	edc78793          	addi	a5,a5,-292 # c000097c <ramdisk_read>
c0000aa8:	02f42a23          	sw	a5,52(s0)
c0000aac:	00000797          	auipc	a5,0x0
c0000ab0:	e8c78793          	addi	a5,a5,-372 # c0000938 <ramdisk_write>
c0000ab4:	02f42c23          	sw	a5,56(s0)
c0000ab8:	01c12083          	lw	ra,28(sp)
c0000abc:	01812403          	lw	s0,24(sp)
c0000ac0:	01412483          	lw	s1,20(sp)
c0000ac4:	01012903          	lw	s2,16(sp)
c0000ac8:	00c12983          	lw	s3,12(sp)
c0000acc:	02010113          	addi	sp,sp,32
c0000ad0:	00008067          	ret
c0000ad4:	00021497          	auipc	s1,0x21
c0000ad8:	22c48493          	addi	s1,s1,556 # c0021d00 <_binary_bin_sfs_img_start>
c0000adc:	00019997          	auipc	s3,0x19
c0000ae0:	52498993          	addi	s3,s3,1316 # c001a000 <_binary_bin_swap_img_start>
c0000ae4:	f7dff06f          	j	c0000a60 <ramdisk_init+0x50>
c0000ae8:	00013617          	auipc	a2,0x13
c0000aec:	41c60613          	addi	a2,a2,1052 # c0013f04 <commands+0x24c>
c0000af0:	03200593          	li	a1,50
c0000af4:	00013517          	auipc	a0,0x13
c0000af8:	42450513          	addi	a0,a0,1060 # c0013f18 <commands+0x260>
c0000afc:	fc8ff0ef          	jal	ra,c00002c4 <__panic>

c0000b00 <clock_set_next_event>:
c0000b00:	c81027f3          	rdtimeh	a5
c0000b04:	c01025f3          	rdtime	a1
c0000b08:	c8102773          	rdtimeh	a4
c0000b0c:	fee79ae3          	bne	a5,a4,c0000b00 <clock_set_next_event>
c0000b10:	0009a717          	auipc	a4,0x9a
c0000b14:	c7870713          	addi	a4,a4,-904 # c009a788 <timebase>
c0000b18:	00072503          	lw	a0,0(a4)
c0000b1c:	00472703          	lw	a4,4(a4)
c0000b20:	00a58533          	add	a0,a1,a0
c0000b24:	00b535b3          	sltu	a1,a0,a1
c0000b28:	00e787b3          	add	a5,a5,a4
c0000b2c:	00f585b3          	add	a1,a1,a5
c0000b30:	3ffff317          	auipc	t1,0x3ffff
c0000b34:	d7030067          	jr	-656(t1) # fffff8a0 <sbi_set_timer>

c0000b38 <clock_init>:
c0000b38:	ff010113          	addi	sp,sp,-16
c0000b3c:	00112623          	sw	ra,12(sp)
c0000b40:	3ffff317          	auipc	t1,0x3ffff
c0000b44:	d40300e7          	jalr	-704(t1) # fffff880 <sbi_timebase>
c0000b48:	1f400793          	li	a5,500
c0000b4c:	02f55533          	divu	a0,a0,a5
c0000b50:	0009a797          	auipc	a5,0x9a
c0000b54:	c3878793          	addi	a5,a5,-968 # c009a788 <timebase>
c0000b58:	0007a223          	sw	zero,4(a5)
c0000b5c:	00a7a023          	sw	a0,0(a5)
c0000b60:	fa1ff0ef          	jal	ra,c0000b00 <clock_set_next_event>
c0000b64:	00c12083          	lw	ra,12(sp)
c0000b68:	00013517          	auipc	a0,0x13
c0000b6c:	3d450513          	addi	a0,a0,980 # c0013f3c <commands+0x284>
c0000b70:	0009a297          	auipc	t0,0x9a
c0000b74:	c602ae23          	sw	zero,-900(t0) # c009a7ec <ticks>
c0000b78:	01010113          	addi	sp,sp,16
c0000b7c:	dccff06f          	j	c0000148 <cprintf>

c0000b80 <serial_putc.part.0>:
c0000b80:	ff010113          	addi	sp,sp,-16
c0000b84:	00800513          	li	a0,8
c0000b88:	00112623          	sw	ra,12(sp)
c0000b8c:	3ffff317          	auipc	t1,0x3ffff
c0000b90:	ca4300e7          	jalr	-860(t1) # fffff830 <sbi_console_putchar>
c0000b94:	02000513          	li	a0,32
c0000b98:	3ffff317          	auipc	t1,0x3ffff
c0000b9c:	c98300e7          	jalr	-872(t1) # fffff830 <sbi_console_putchar>
c0000ba0:	00c12083          	lw	ra,12(sp)
c0000ba4:	00800513          	li	a0,8
c0000ba8:	01010113          	addi	sp,sp,16
c0000bac:	3ffff317          	auipc	t1,0x3ffff
c0000bb0:	c8430067          	jr	-892(t1) # fffff830 <sbi_console_putchar>

c0000bb4 <serial_proc_data>:
c0000bb4:	ff010113          	addi	sp,sp,-16
c0000bb8:	00112623          	sw	ra,12(sp)
c0000bbc:	3ffff317          	auipc	t1,0x3ffff
c0000bc0:	c84300e7          	jalr	-892(t1) # fffff840 <sbi_console_getchar>
c0000bc4:	00054e63          	bltz	a0,c0000be0 <serial_proc_data+0x2c>
c0000bc8:	07f00793          	li	a5,127
c0000bcc:	00f51463          	bne	a0,a5,c0000bd4 <serial_proc_data+0x20>
c0000bd0:	00800513          	li	a0,8
c0000bd4:	00c12083          	lw	ra,12(sp)
c0000bd8:	01010113          	addi	sp,sp,16
c0000bdc:	00008067          	ret
c0000be0:	fff00513          	li	a0,-1
c0000be4:	ff1ff06f          	j	c0000bd4 <serial_proc_data+0x20>

c0000be8 <serial_intr>:
c0000be8:	ff010113          	addi	sp,sp,-16
c0000bec:	00812423          	sw	s0,8(sp)
c0000bf0:	00912223          	sw	s1,4(sp)
c0000bf4:	01212023          	sw	s2,0(sp)
c0000bf8:	00112623          	sw	ra,12(sp)
c0000bfc:	fff00413          	li	s0,-1
c0000c00:	00097497          	auipc	s1,0x97
c0000c04:	94048493          	addi	s1,s1,-1728 # c0097540 <cons>
c0000c08:	20000913          	li	s2,512
c0000c0c:	0080006f          	j	c0000c14 <serial_intr+0x2c>
c0000c10:	02051263          	bnez	a0,c0000c34 <serial_intr+0x4c>
c0000c14:	fa1ff0ef          	jal	ra,c0000bb4 <serial_proc_data>
c0000c18:	fe851ce3          	bne	a0,s0,c0000c10 <serial_intr+0x28>
c0000c1c:	00c12083          	lw	ra,12(sp)
c0000c20:	00812403          	lw	s0,8(sp)
c0000c24:	00412483          	lw	s1,4(sp)
c0000c28:	00012903          	lw	s2,0(sp)
c0000c2c:	01010113          	addi	sp,sp,16
c0000c30:	00008067          	ret
c0000c34:	00097797          	auipc	a5,0x97
c0000c38:	b107a783          	lw	a5,-1264(a5) # c0097744 <cons+0x204>
c0000c3c:	00178713          	addi	a4,a5,1
c0000c40:	00f487b3          	add	a5,s1,a5
c0000c44:	20e4a223          	sw	a4,516(s1)
c0000c48:	00a78023          	sb	a0,0(a5)
c0000c4c:	fd2714e3          	bne	a4,s2,c0000c14 <serial_intr+0x2c>
c0000c50:	2004a223          	sw	zero,516(s1)
c0000c54:	fc1ff06f          	j	c0000c14 <serial_intr+0x2c>

c0000c58 <cons_init>:
c0000c58:	3ffff317          	auipc	t1,0x3ffff
c0000c5c:	be830067          	jr	-1048(t1) # fffff840 <sbi_console_getchar>

c0000c60 <cons_putc>:
c0000c60:	ff010113          	addi	sp,sp,-16
c0000c64:	00812423          	sw	s0,8(sp)
c0000c68:	00112623          	sw	ra,12(sp)
c0000c6c:	00912223          	sw	s1,4(sp)
c0000c70:	00050413          	mv	s0,a0
c0000c74:	100027f3          	csrr	a5,sstatus
c0000c78:	0027f793          	andi	a5,a5,2
c0000c7c:	00000493          	li	s1,0
c0000c80:	04079263          	bnez	a5,c0000cc4 <cons_putc+0x64>
c0000c84:	00800793          	li	a5,8
c0000c88:	04f40663          	beq	s0,a5,c0000cd4 <cons_putc+0x74>
c0000c8c:	0ff47513          	andi	a0,s0,255
c0000c90:	3ffff317          	auipc	t1,0x3ffff
c0000c94:	ba0300e7          	jalr	-1120(t1) # fffff830 <sbi_console_putchar>
c0000c98:	00049c63          	bnez	s1,c0000cb0 <cons_putc+0x50>
c0000c9c:	00c12083          	lw	ra,12(sp)
c0000ca0:	00812403          	lw	s0,8(sp)
c0000ca4:	00412483          	lw	s1,4(sp)
c0000ca8:	01010113          	addi	sp,sp,16
c0000cac:	00008067          	ret
c0000cb0:	00c12083          	lw	ra,12(sp)
c0000cb4:	00812403          	lw	s0,8(sp)
c0000cb8:	00412483          	lw	s1,4(sp)
c0000cbc:	01010113          	addi	sp,sp,16
c0000cc0:	0f80006f          	j	c0000db8 <intr_enable>
c0000cc4:	0fc000ef          	jal	ra,c0000dc0 <intr_disable>
c0000cc8:	00800793          	li	a5,8
c0000ccc:	00100493          	li	s1,1
c0000cd0:	faf41ee3          	bne	s0,a5,c0000c8c <cons_putc+0x2c>
c0000cd4:	eadff0ef          	jal	ra,c0000b80 <serial_putc.part.0>
c0000cd8:	fc1ff06f          	j	c0000c98 <cons_putc+0x38>

c0000cdc <cons_getc>:
c0000cdc:	ff010113          	addi	sp,sp,-16
c0000ce0:	00112623          	sw	ra,12(sp)
c0000ce4:	00812423          	sw	s0,8(sp)
c0000ce8:	100027f3          	csrr	a5,sstatus
c0000cec:	0027f793          	andi	a5,a5,2
c0000cf0:	04079a63          	bnez	a5,c0000d44 <cons_getc+0x68>
c0000cf4:	ef5ff0ef          	jal	ra,c0000be8 <serial_intr>
c0000cf8:	00097797          	auipc	a5,0x97
c0000cfc:	a487a783          	lw	a5,-1464(a5) # c0097740 <cons+0x200>
c0000d00:	00097697          	auipc	a3,0x97
c0000d04:	a446a683          	lw	a3,-1468(a3) # c0097744 <cons+0x204>
c0000d08:	00097717          	auipc	a4,0x97
c0000d0c:	83870713          	addi	a4,a4,-1992 # c0097540 <cons>
c0000d10:	00000413          	li	s0,0
c0000d14:	00d78e63          	beq	a5,a3,c0000d30 <cons_getc+0x54>
c0000d18:	00178693          	addi	a3,a5,1
c0000d1c:	20d72023          	sw	a3,512(a4)
c0000d20:	00f707b3          	add	a5,a4,a5
c0000d24:	20000613          	li	a2,512
c0000d28:	0007c403          	lbu	s0,0(a5)
c0000d2c:	06c68c63          	beq	a3,a2,c0000da4 <cons_getc+0xc8>
c0000d30:	00c12083          	lw	ra,12(sp)
c0000d34:	00040513          	mv	a0,s0
c0000d38:	00812403          	lw	s0,8(sp)
c0000d3c:	01010113          	addi	sp,sp,16
c0000d40:	00008067          	ret
c0000d44:	07c000ef          	jal	ra,c0000dc0 <intr_disable>
c0000d48:	ea1ff0ef          	jal	ra,c0000be8 <serial_intr>
c0000d4c:	00097797          	auipc	a5,0x97
c0000d50:	9f47a783          	lw	a5,-1548(a5) # c0097740 <cons+0x200>
c0000d54:	00097697          	auipc	a3,0x97
c0000d58:	9f06a683          	lw	a3,-1552(a3) # c0097744 <cons+0x204>
c0000d5c:	00096717          	auipc	a4,0x96
c0000d60:	7e470713          	addi	a4,a4,2020 # c0097540 <cons>
c0000d64:	04d78463          	beq	a5,a3,c0000dac <cons_getc+0xd0>
c0000d68:	00178693          	addi	a3,a5,1
c0000d6c:	20d72023          	sw	a3,512(a4)
c0000d70:	00f707b3          	add	a5,a4,a5
c0000d74:	20000613          	li	a2,512
c0000d78:	0007c403          	lbu	s0,0(a5)
c0000d7c:	00c68e63          	beq	a3,a2,c0000d98 <cons_getc+0xbc>
c0000d80:	038000ef          	jal	ra,c0000db8 <intr_enable>
c0000d84:	00c12083          	lw	ra,12(sp)
c0000d88:	00040513          	mv	a0,s0
c0000d8c:	00812403          	lw	s0,8(sp)
c0000d90:	01010113          	addi	sp,sp,16
c0000d94:	00008067          	ret
c0000d98:	20072023          	sw	zero,512(a4)
c0000d9c:	01c000ef          	jal	ra,c0000db8 <intr_enable>
c0000da0:	fe5ff06f          	j	c0000d84 <cons_getc+0xa8>
c0000da4:	20072023          	sw	zero,512(a4)
c0000da8:	f89ff06f          	j	c0000d30 <cons_getc+0x54>
c0000dac:	00000413          	li	s0,0
c0000db0:	fd1ff06f          	j	c0000d80 <cons_getc+0xa4>

c0000db4 <pic_init>:
c0000db4:	00008067          	ret

c0000db8 <intr_enable>:
c0000db8:	100167f3          	csrrsi	a5,sstatus,2
c0000dbc:	00008067          	ret

c0000dc0 <intr_disable>:
c0000dc0:	100177f3          	csrrci	a5,sstatus,2
c0000dc4:	00008067          	ret

c0000dc8 <idt_init>:
c0000dc8:	14005073          	csrwi	sscratch,0
c0000dcc:	00000797          	auipc	a5,0x0
c0000dd0:	7f478793          	addi	a5,a5,2036 # c00015c0 <__alltraps>
c0000dd4:	10579073          	csrw	stvec,a5
c0000dd8:	00008067          	ret

c0000ddc <print_regs>:
c0000ddc:	00052583          	lw	a1,0(a0)
c0000de0:	ff010113          	addi	sp,sp,-16
c0000de4:	00812423          	sw	s0,8(sp)
c0000de8:	00050413          	mv	s0,a0
c0000dec:	00013517          	auipc	a0,0x13
c0000df0:	4d050513          	addi	a0,a0,1232 # c00142bc <commands+0x604>
c0000df4:	00112623          	sw	ra,12(sp)
c0000df8:	b50ff0ef          	jal	ra,c0000148 <cprintf>
c0000dfc:	00442583          	lw	a1,4(s0)
c0000e00:	00013517          	auipc	a0,0x13
c0000e04:	4d050513          	addi	a0,a0,1232 # c00142d0 <commands+0x618>
c0000e08:	b40ff0ef          	jal	ra,c0000148 <cprintf>
c0000e0c:	00842583          	lw	a1,8(s0)
c0000e10:	00013517          	auipc	a0,0x13
c0000e14:	4d450513          	addi	a0,a0,1236 # c00142e4 <commands+0x62c>
c0000e18:	b30ff0ef          	jal	ra,c0000148 <cprintf>
c0000e1c:	00c42583          	lw	a1,12(s0)
c0000e20:	00013517          	auipc	a0,0x13
c0000e24:	4d850513          	addi	a0,a0,1240 # c00142f8 <commands+0x640>
c0000e28:	b20ff0ef          	jal	ra,c0000148 <cprintf>
c0000e2c:	01042583          	lw	a1,16(s0)
c0000e30:	00013517          	auipc	a0,0x13
c0000e34:	4dc50513          	addi	a0,a0,1244 # c001430c <commands+0x654>
c0000e38:	b10ff0ef          	jal	ra,c0000148 <cprintf>
c0000e3c:	01442583          	lw	a1,20(s0)
c0000e40:	00013517          	auipc	a0,0x13
c0000e44:	4e050513          	addi	a0,a0,1248 # c0014320 <commands+0x668>
c0000e48:	b00ff0ef          	jal	ra,c0000148 <cprintf>
c0000e4c:	01842583          	lw	a1,24(s0)
c0000e50:	00013517          	auipc	a0,0x13
c0000e54:	4e450513          	addi	a0,a0,1252 # c0014334 <commands+0x67c>
c0000e58:	af0ff0ef          	jal	ra,c0000148 <cprintf>
c0000e5c:	01c42583          	lw	a1,28(s0)
c0000e60:	00013517          	auipc	a0,0x13
c0000e64:	4e850513          	addi	a0,a0,1256 # c0014348 <commands+0x690>
c0000e68:	ae0ff0ef          	jal	ra,c0000148 <cprintf>
c0000e6c:	02042583          	lw	a1,32(s0)
c0000e70:	00013517          	auipc	a0,0x13
c0000e74:	4ec50513          	addi	a0,a0,1260 # c001435c <commands+0x6a4>
c0000e78:	ad0ff0ef          	jal	ra,c0000148 <cprintf>
c0000e7c:	02442583          	lw	a1,36(s0)
c0000e80:	00013517          	auipc	a0,0x13
c0000e84:	4f050513          	addi	a0,a0,1264 # c0014370 <commands+0x6b8>
c0000e88:	ac0ff0ef          	jal	ra,c0000148 <cprintf>
c0000e8c:	02842583          	lw	a1,40(s0)
c0000e90:	00013517          	auipc	a0,0x13
c0000e94:	4f450513          	addi	a0,a0,1268 # c0014384 <commands+0x6cc>
c0000e98:	ab0ff0ef          	jal	ra,c0000148 <cprintf>
c0000e9c:	02c42583          	lw	a1,44(s0)
c0000ea0:	00013517          	auipc	a0,0x13
c0000ea4:	4f850513          	addi	a0,a0,1272 # c0014398 <commands+0x6e0>
c0000ea8:	aa0ff0ef          	jal	ra,c0000148 <cprintf>
c0000eac:	03042583          	lw	a1,48(s0)
c0000eb0:	00013517          	auipc	a0,0x13
c0000eb4:	4fc50513          	addi	a0,a0,1276 # c00143ac <commands+0x6f4>
c0000eb8:	a90ff0ef          	jal	ra,c0000148 <cprintf>
c0000ebc:	03442583          	lw	a1,52(s0)
c0000ec0:	00013517          	auipc	a0,0x13
c0000ec4:	50050513          	addi	a0,a0,1280 # c00143c0 <commands+0x708>
c0000ec8:	a80ff0ef          	jal	ra,c0000148 <cprintf>
c0000ecc:	03842583          	lw	a1,56(s0)
c0000ed0:	00013517          	auipc	a0,0x13
c0000ed4:	50450513          	addi	a0,a0,1284 # c00143d4 <commands+0x71c>
c0000ed8:	a70ff0ef          	jal	ra,c0000148 <cprintf>
c0000edc:	03c42583          	lw	a1,60(s0)
c0000ee0:	00013517          	auipc	a0,0x13
c0000ee4:	50850513          	addi	a0,a0,1288 # c00143e8 <commands+0x730>
c0000ee8:	a60ff0ef          	jal	ra,c0000148 <cprintf>
c0000eec:	04042583          	lw	a1,64(s0)
c0000ef0:	00013517          	auipc	a0,0x13
c0000ef4:	50c50513          	addi	a0,a0,1292 # c00143fc <commands+0x744>
c0000ef8:	a50ff0ef          	jal	ra,c0000148 <cprintf>
c0000efc:	04442583          	lw	a1,68(s0)
c0000f00:	00013517          	auipc	a0,0x13
c0000f04:	51050513          	addi	a0,a0,1296 # c0014410 <commands+0x758>
c0000f08:	a40ff0ef          	jal	ra,c0000148 <cprintf>
c0000f0c:	04842583          	lw	a1,72(s0)
c0000f10:	00013517          	auipc	a0,0x13
c0000f14:	51450513          	addi	a0,a0,1300 # c0014424 <commands+0x76c>
c0000f18:	a30ff0ef          	jal	ra,c0000148 <cprintf>
c0000f1c:	04c42583          	lw	a1,76(s0)
c0000f20:	00013517          	auipc	a0,0x13
c0000f24:	51850513          	addi	a0,a0,1304 # c0014438 <commands+0x780>
c0000f28:	a20ff0ef          	jal	ra,c0000148 <cprintf>
c0000f2c:	05042583          	lw	a1,80(s0)
c0000f30:	00013517          	auipc	a0,0x13
c0000f34:	51c50513          	addi	a0,a0,1308 # c001444c <commands+0x794>
c0000f38:	a10ff0ef          	jal	ra,c0000148 <cprintf>
c0000f3c:	05442583          	lw	a1,84(s0)
c0000f40:	00013517          	auipc	a0,0x13
c0000f44:	52050513          	addi	a0,a0,1312 # c0014460 <commands+0x7a8>
c0000f48:	a00ff0ef          	jal	ra,c0000148 <cprintf>
c0000f4c:	05842583          	lw	a1,88(s0)
c0000f50:	00013517          	auipc	a0,0x13
c0000f54:	52450513          	addi	a0,a0,1316 # c0014474 <commands+0x7bc>
c0000f58:	9f0ff0ef          	jal	ra,c0000148 <cprintf>
c0000f5c:	05c42583          	lw	a1,92(s0)
c0000f60:	00013517          	auipc	a0,0x13
c0000f64:	52850513          	addi	a0,a0,1320 # c0014488 <commands+0x7d0>
c0000f68:	9e0ff0ef          	jal	ra,c0000148 <cprintf>
c0000f6c:	06042583          	lw	a1,96(s0)
c0000f70:	00013517          	auipc	a0,0x13
c0000f74:	52c50513          	addi	a0,a0,1324 # c001449c <commands+0x7e4>
c0000f78:	9d0ff0ef          	jal	ra,c0000148 <cprintf>
c0000f7c:	06442583          	lw	a1,100(s0)
c0000f80:	00013517          	auipc	a0,0x13
c0000f84:	53050513          	addi	a0,a0,1328 # c00144b0 <commands+0x7f8>
c0000f88:	9c0ff0ef          	jal	ra,c0000148 <cprintf>
c0000f8c:	06842583          	lw	a1,104(s0)
c0000f90:	00013517          	auipc	a0,0x13
c0000f94:	53450513          	addi	a0,a0,1332 # c00144c4 <commands+0x80c>
c0000f98:	9b0ff0ef          	jal	ra,c0000148 <cprintf>
c0000f9c:	06c42583          	lw	a1,108(s0)
c0000fa0:	00013517          	auipc	a0,0x13
c0000fa4:	53850513          	addi	a0,a0,1336 # c00144d8 <commands+0x820>
c0000fa8:	9a0ff0ef          	jal	ra,c0000148 <cprintf>
c0000fac:	07042583          	lw	a1,112(s0)
c0000fb0:	00013517          	auipc	a0,0x13
c0000fb4:	53c50513          	addi	a0,a0,1340 # c00144ec <commands+0x834>
c0000fb8:	990ff0ef          	jal	ra,c0000148 <cprintf>
c0000fbc:	07442583          	lw	a1,116(s0)
c0000fc0:	00013517          	auipc	a0,0x13
c0000fc4:	54050513          	addi	a0,a0,1344 # c0014500 <commands+0x848>
c0000fc8:	980ff0ef          	jal	ra,c0000148 <cprintf>
c0000fcc:	07842583          	lw	a1,120(s0)
c0000fd0:	00013517          	auipc	a0,0x13
c0000fd4:	54450513          	addi	a0,a0,1348 # c0014514 <commands+0x85c>
c0000fd8:	970ff0ef          	jal	ra,c0000148 <cprintf>
c0000fdc:	07c42583          	lw	a1,124(s0)
c0000fe0:	00c12083          	lw	ra,12(sp)
c0000fe4:	00812403          	lw	s0,8(sp)
c0000fe8:	00013517          	auipc	a0,0x13
c0000fec:	54050513          	addi	a0,a0,1344 # c0014528 <commands+0x870>
c0000ff0:	01010113          	addi	sp,sp,16
c0000ff4:	954ff06f          	j	c0000148 <cprintf>

c0000ff8 <print_trapframe>:
c0000ff8:	ff010113          	addi	sp,sp,-16
c0000ffc:	00050593          	mv	a1,a0
c0001000:	00812423          	sw	s0,8(sp)
c0001004:	00050413          	mv	s0,a0
c0001008:	00013517          	auipc	a0,0x13
c000100c:	53450513          	addi	a0,a0,1332 # c001453c <commands+0x884>
c0001010:	00112623          	sw	ra,12(sp)
c0001014:	934ff0ef          	jal	ra,c0000148 <cprintf>
c0001018:	00040513          	mv	a0,s0
c000101c:	dc1ff0ef          	jal	ra,c0000ddc <print_regs>
c0001020:	08042583          	lw	a1,128(s0)
c0001024:	00013517          	auipc	a0,0x13
c0001028:	52c50513          	addi	a0,a0,1324 # c0014550 <commands+0x898>
c000102c:	91cff0ef          	jal	ra,c0000148 <cprintf>
c0001030:	08442583          	lw	a1,132(s0)
c0001034:	00013517          	auipc	a0,0x13
c0001038:	53050513          	addi	a0,a0,1328 # c0014564 <commands+0x8ac>
c000103c:	90cff0ef          	jal	ra,c0000148 <cprintf>
c0001040:	08842583          	lw	a1,136(s0)
c0001044:	00013517          	auipc	a0,0x13
c0001048:	53450513          	addi	a0,a0,1332 # c0014578 <commands+0x8c0>
c000104c:	8fcff0ef          	jal	ra,c0000148 <cprintf>
c0001050:	08c42583          	lw	a1,140(s0)
c0001054:	00c12083          	lw	ra,12(sp)
c0001058:	00812403          	lw	s0,8(sp)
c000105c:	00013517          	auipc	a0,0x13
c0001060:	53050513          	addi	a0,a0,1328 # c001458c <commands+0x8d4>
c0001064:	01010113          	addi	sp,sp,16
c0001068:	8e0ff06f          	j	c0000148 <cprintf>

c000106c <pgfault_handler>:
c000106c:	ff010113          	addi	sp,sp,-16
c0001070:	00812423          	sw	s0,8(sp)
c0001074:	00112623          	sw	ra,12(sp)
c0001078:	00099797          	auipc	a5,0x99
c000107c:	7787a783          	lw	a5,1912(a5) # c009a7f0 <check_mm_struct>
c0001080:	00050413          	mv	s0,a0
c0001084:	06078663          	beqz	a5,c00010f0 <pgfault_handler+0x84>
c0001088:	08852583          	lw	a1,136(a0)
c000108c:	00013517          	auipc	a0,0x13
c0001090:	1cc50513          	addi	a0,a0,460 # c0014258 <commands+0x5a0>
c0001094:	8b4ff0ef          	jal	ra,c0000148 <cprintf>
c0001098:	08c42583          	lw	a1,140(s0)
c000109c:	00500793          	li	a5,5
c00010a0:	08f58463          	beq	a1,a5,c0001128 <pgfault_handler+0xbc>
c00010a4:	00700793          	li	a5,7
c00010a8:	06f58863          	beq	a1,a5,c0001118 <pgfault_handler+0xac>
c00010ac:	00014517          	auipc	a0,0x14
c00010b0:	38050513          	addi	a0,a0,896 # c001542c <default_pmm_manager+0x13c>
c00010b4:	894ff0ef          	jal	ra,c0000148 <cprintf>
c00010b8:	00099517          	auipc	a0,0x99
c00010bc:	73852503          	lw	a0,1848(a0) # c009a7f0 <check_mm_struct>
c00010c0:	02050863          	beqz	a0,c00010f0 <pgfault_handler+0x84>
c00010c4:	00099717          	auipc	a4,0x99
c00010c8:	6e872703          	lw	a4,1768(a4) # c009a7ac <current>
c00010cc:	00099797          	auipc	a5,0x99
c00010d0:	6e47a783          	lw	a5,1764(a5) # c009a7b0 <idleproc>
c00010d4:	06f71263          	bne	a4,a5,c0001138 <pgfault_handler+0xcc>
c00010d8:	08842603          	lw	a2,136(s0)
c00010dc:	08c42583          	lw	a1,140(s0)
c00010e0:	00c12083          	lw	ra,12(sp)
c00010e4:	00812403          	lw	s0,8(sp)
c00010e8:	01010113          	addi	sp,sp,16
c00010ec:	0f40106f          	j	c00021e0 <do_pgfault>
c00010f0:	00099797          	auipc	a5,0x99
c00010f4:	6bc7a783          	lw	a5,1724(a5) # c009a7ac <current>
c00010f8:	06078063          	beqz	a5,c0001158 <pgfault_handler+0xec>
c00010fc:	08842603          	lw	a2,136(s0)
c0001100:	08c42583          	lw	a1,140(s0)
c0001104:	00c12083          	lw	ra,12(sp)
c0001108:	00812403          	lw	s0,8(sp)
c000110c:	0187a503          	lw	a0,24(a5)
c0001110:	01010113          	addi	sp,sp,16
c0001114:	0cc0106f          	j	c00021e0 <do_pgfault>
c0001118:	00013517          	auipc	a0,0x13
c000111c:	16050513          	addi	a0,a0,352 # c0014278 <commands+0x5c0>
c0001120:	828ff0ef          	jal	ra,c0000148 <cprintf>
c0001124:	f95ff06f          	j	c00010b8 <pgfault_handler+0x4c>
c0001128:	00013517          	auipc	a0,0x13
c000112c:	14c50513          	addi	a0,a0,332 # c0014274 <commands+0x5bc>
c0001130:	818ff0ef          	jal	ra,c0000148 <cprintf>
c0001134:	f85ff06f          	j	c00010b8 <pgfault_handler+0x4c>
c0001138:	00013697          	auipc	a3,0x13
c000113c:	14468693          	addi	a3,a3,324 # c001427c <commands+0x5c4>
c0001140:	00013617          	auipc	a2,0x13
c0001144:	cdc60613          	addi	a2,a2,-804 # c0013e1c <commands+0x164>
c0001148:	08300593          	li	a1,131
c000114c:	00013517          	auipc	a0,0x13
c0001150:	14450513          	addi	a0,a0,324 # c0014290 <commands+0x5d8>
c0001154:	970ff0ef          	jal	ra,c00002c4 <__panic>
c0001158:	00040513          	mv	a0,s0
c000115c:	e9dff0ef          	jal	ra,c0000ff8 <print_trapframe>
c0001160:	08842583          	lw	a1,136(s0)
c0001164:	00013517          	auipc	a0,0x13
c0001168:	0f450513          	addi	a0,a0,244 # c0014258 <commands+0x5a0>
c000116c:	fddfe0ef          	jal	ra,c0000148 <cprintf>
c0001170:	08c42583          	lw	a1,140(s0)
c0001174:	00500793          	li	a5,5
c0001178:	02f58863          	beq	a1,a5,c00011a8 <pgfault_handler+0x13c>
c000117c:	00700793          	li	a5,7
c0001180:	02f58c63          	beq	a1,a5,c00011b8 <pgfault_handler+0x14c>
c0001184:	00014517          	auipc	a0,0x14
c0001188:	2a850513          	addi	a0,a0,680 # c001542c <default_pmm_manager+0x13c>
c000118c:	fbdfe0ef          	jal	ra,c0000148 <cprintf>
c0001190:	00013617          	auipc	a2,0x13
c0001194:	11460613          	addi	a2,a2,276 # c00142a4 <commands+0x5ec>
c0001198:	08a00593          	li	a1,138
c000119c:	00013517          	auipc	a0,0x13
c00011a0:	0f450513          	addi	a0,a0,244 # c0014290 <commands+0x5d8>
c00011a4:	920ff0ef          	jal	ra,c00002c4 <__panic>
c00011a8:	00013517          	auipc	a0,0x13
c00011ac:	0cc50513          	addi	a0,a0,204 # c0014274 <commands+0x5bc>
c00011b0:	f99fe0ef          	jal	ra,c0000148 <cprintf>
c00011b4:	fddff06f          	j	c0001190 <pgfault_handler+0x124>
c00011b8:	00013517          	auipc	a0,0x13
c00011bc:	0c050513          	addi	a0,a0,192 # c0014278 <commands+0x5c0>
c00011c0:	f89fe0ef          	jal	ra,c0000148 <cprintf>
c00011c4:	fcdff06f          	j	c0001190 <pgfault_handler+0x124>

c00011c8 <interrupt_handler>:
c00011c8:	08c52783          	lw	a5,140(a0)
c00011cc:	80000737          	lui	a4,0x80000
c00011d0:	fff74713          	not	a4,a4
c00011d4:	00e7f7b3          	and	a5,a5,a4
c00011d8:	00b00713          	li	a4,11
c00011dc:	10f76063          	bltu	a4,a5,c00012dc <interrupt_handler+0x114>
c00011e0:	00013717          	auipc	a4,0x13
c00011e4:	d7870713          	addi	a4,a4,-648 # c0013f58 <commands+0x2a0>
c00011e8:	00279793          	slli	a5,a5,0x2
c00011ec:	00e787b3          	add	a5,a5,a4
c00011f0:	0007a783          	lw	a5,0(a5)
c00011f4:	ff010113          	addi	sp,sp,-16
c00011f8:	00112623          	sw	ra,12(sp)
c00011fc:	00e787b3          	add	a5,a5,a4
c0001200:	00078067          	jr	a5
c0001204:	00c12083          	lw	ra,12(sp)
c0001208:	00013517          	auipc	a0,0x13
c000120c:	fa450513          	addi	a0,a0,-92 # c00141ac <commands+0x4f4>
c0001210:	01010113          	addi	sp,sp,16
c0001214:	f35fe06f          	j	c0000148 <cprintf>
c0001218:	00c12083          	lw	ra,12(sp)
c000121c:	00013517          	auipc	a0,0x13
c0001220:	f7050513          	addi	a0,a0,-144 # c001418c <commands+0x4d4>
c0001224:	01010113          	addi	sp,sp,16
c0001228:	f21fe06f          	j	c0000148 <cprintf>
c000122c:	8d5ff0ef          	jal	ra,c0000b00 <clock_set_next_event>
c0001230:	00099797          	auipc	a5,0x99
c0001234:	5bc7a783          	lw	a5,1468(a5) # c009a7ec <ticks>
c0001238:	00c12083          	lw	ra,12(sp)
c000123c:	00178793          	addi	a5,a5,1
c0001240:	00099297          	auipc	t0,0x99
c0001244:	5af2a623          	sw	a5,1452(t0) # c009a7ec <ticks>
c0001248:	01010113          	addi	sp,sp,16
c000124c:	5840906f          	j	c000a7d0 <run_timer_list>
c0001250:	00c12083          	lw	ra,12(sp)
c0001254:	00013517          	auipc	a0,0x13
c0001258:	f8c50513          	addi	a0,a0,-116 # c00141e0 <commands+0x528>
c000125c:	01010113          	addi	sp,sp,16
c0001260:	ee9fe06f          	j	c0000148 <cprintf>
c0001264:	00c12083          	lw	ra,12(sp)
c0001268:	00013517          	auipc	a0,0x13
c000126c:	f9450513          	addi	a0,a0,-108 # c00141fc <commands+0x544>
c0001270:	01010113          	addi	sp,sp,16
c0001274:	ed5fe06f          	j	c0000148 <cprintf>
c0001278:	00c12083          	lw	ra,12(sp)
c000127c:	00013517          	auipc	a0,0x13
c0001280:	f4c50513          	addi	a0,a0,-180 # c00141c8 <commands+0x510>
c0001284:	01010113          	addi	sp,sp,16
c0001288:	ec1fe06f          	j	c0000148 <cprintf>
c000128c:	00c12083          	lw	ra,12(sp)
c0001290:	00013517          	auipc	a0,0x13
c0001294:	fac50513          	addi	a0,a0,-84 # c001423c <commands+0x584>
c0001298:	01010113          	addi	sp,sp,16
c000129c:	eadfe06f          	j	c0000148 <cprintf>
c00012a0:	00c12083          	lw	ra,12(sp)
c00012a4:	00013517          	auipc	a0,0x13
c00012a8:	ecc50513          	addi	a0,a0,-308 # c0014170 <commands+0x4b8>
c00012ac:	01010113          	addi	sp,sp,16
c00012b0:	e99fe06f          	j	c0000148 <cprintf>
c00012b4:	935ff0ef          	jal	ra,c0000be8 <serial_intr>
c00012b8:	a25ff0ef          	jal	ra,c0000cdc <cons_getc>
c00012bc:	00c12083          	lw	ra,12(sp)
c00012c0:	01010113          	addi	sp,sp,16
c00012c4:	0b90e06f          	j	c000fb7c <dev_stdin_write>
c00012c8:	00c12083          	lw	ra,12(sp)
c00012cc:	00013517          	auipc	a0,0x13
c00012d0:	f5050513          	addi	a0,a0,-176 # c001421c <commands+0x564>
c00012d4:	01010113          	addi	sp,sp,16
c00012d8:	e71fe06f          	j	c0000148 <cprintf>
c00012dc:	d1dff06f          	j	c0000ff8 <print_trapframe>

c00012e0 <exception_handler>:
c00012e0:	08c52783          	lw	a5,140(a0)
c00012e4:	00b00693          	li	a3,11
c00012e8:	14f6ec63          	bltu	a3,a5,c0001440 <exception_handler+0x160>
c00012ec:	00013717          	auipc	a4,0x13
c00012f0:	c9c70713          	addi	a4,a4,-868 # c0013f88 <commands+0x2d0>
c00012f4:	00279793          	slli	a5,a5,0x2
c00012f8:	00e787b3          	add	a5,a5,a4
c00012fc:	0007a783          	lw	a5,0(a5)
c0001300:	ff010113          	addi	sp,sp,-16
c0001304:	00812423          	sw	s0,8(sp)
c0001308:	00112623          	sw	ra,12(sp)
c000130c:	00912223          	sw	s1,4(sp)
c0001310:	00e787b3          	add	a5,a5,a4
c0001314:	00050413          	mv	s0,a0
c0001318:	00078067          	jr	a5
c000131c:	00013517          	auipc	a0,0x13
c0001320:	df450513          	addi	a0,a0,-524 # c0014110 <commands+0x458>
c0001324:	e25fe0ef          	jal	ra,c0000148 <cprintf>
c0001328:	08442783          	lw	a5,132(s0)
c000132c:	00c12083          	lw	ra,12(sp)
c0001330:	00412483          	lw	s1,4(sp)
c0001334:	00478793          	addi	a5,a5,4
c0001338:	08f42223          	sw	a5,132(s0)
c000133c:	00812403          	lw	s0,8(sp)
c0001340:	01010113          	addi	sp,sp,16
c0001344:	1800d06f          	j	c000e4c4 <syscall>
c0001348:	00013517          	auipc	a0,0x13
c000134c:	de850513          	addi	a0,a0,-536 # c0014130 <commands+0x478>
c0001350:	00c12083          	lw	ra,12(sp)
c0001354:	00812403          	lw	s0,8(sp)
c0001358:	00412483          	lw	s1,4(sp)
c000135c:	01010113          	addi	sp,sp,16
c0001360:	de9fe06f          	j	c0000148 <cprintf>
c0001364:	00013517          	auipc	a0,0x13
c0001368:	dec50513          	addi	a0,a0,-532 # c0014150 <commands+0x498>
c000136c:	fe5ff06f          	j	c0001350 <exception_handler+0x70>
c0001370:	00013517          	auipc	a0,0x13
c0001374:	c4850513          	addi	a0,a0,-952 # c0013fb8 <commands+0x300>
c0001378:	fd9ff06f          	j	c0001350 <exception_handler+0x70>
c000137c:	00013517          	auipc	a0,0x13
c0001380:	c5c50513          	addi	a0,a0,-932 # c0013fd8 <commands+0x320>
c0001384:	fcdff06f          	j	c0001350 <exception_handler+0x70>
c0001388:	00013517          	auipc	a0,0x13
c000138c:	c6c50513          	addi	a0,a0,-916 # c0013ff4 <commands+0x33c>
c0001390:	fc1ff06f          	j	c0001350 <exception_handler+0x70>
c0001394:	00013517          	auipc	a0,0x13
c0001398:	c7850513          	addi	a0,a0,-904 # c001400c <commands+0x354>
c000139c:	fb5ff06f          	j	c0001350 <exception_handler+0x70>
c00013a0:	00013517          	auipc	a0,0x13
c00013a4:	c7850513          	addi	a0,a0,-904 # c0014018 <commands+0x360>
c00013a8:	fa9ff06f          	j	c0001350 <exception_handler+0x70>
c00013ac:	00013517          	auipc	a0,0x13
c00013b0:	c8850513          	addi	a0,a0,-888 # c0014034 <commands+0x37c>
c00013b4:	d95fe0ef          	jal	ra,c0000148 <cprintf>
c00013b8:	00040513          	mv	a0,s0
c00013bc:	cb1ff0ef          	jal	ra,c000106c <pgfault_handler>
c00013c0:	00050493          	mv	s1,a0
c00013c4:	08051063          	bnez	a0,c0001444 <exception_handler+0x164>
c00013c8:	00c12083          	lw	ra,12(sp)
c00013cc:	00812403          	lw	s0,8(sp)
c00013d0:	00412483          	lw	s1,4(sp)
c00013d4:	01010113          	addi	sp,sp,16
c00013d8:	00008067          	ret
c00013dc:	00013517          	auipc	a0,0x13
c00013e0:	cfc50513          	addi	a0,a0,-772 # c00140d8 <commands+0x420>
c00013e4:	f6dff06f          	j	c0001350 <exception_handler+0x70>
c00013e8:	00013517          	auipc	a0,0x13
c00013ec:	d1050513          	addi	a0,a0,-752 # c00140f8 <commands+0x440>
c00013f0:	d59fe0ef          	jal	ra,c0000148 <cprintf>
c00013f4:	00040513          	mv	a0,s0
c00013f8:	c75ff0ef          	jal	ra,c000106c <pgfault_handler>
c00013fc:	00050493          	mv	s1,a0
c0001400:	fc0504e3          	beqz	a0,c00013c8 <exception_handler+0xe8>
c0001404:	00040513          	mv	a0,s0
c0001408:	bf1ff0ef          	jal	ra,c0000ff8 <print_trapframe>
c000140c:	00099797          	auipc	a5,0x99
c0001410:	3a07a783          	lw	a5,928(a5) # c009a7ac <current>
c0001414:	0a078e63          	beqz	a5,c00014d0 <exception_handler+0x1f0>
c0001418:	08042783          	lw	a5,128(s0)
c000141c:	1007f793          	andi	a5,a5,256
c0001420:	06078063          	beqz	a5,c0001480 <exception_handler+0x1a0>
c0001424:	00048693          	mv	a3,s1
c0001428:	00013617          	auipc	a2,0x13
c000142c:	c4060613          	addi	a2,a2,-960 # c0014068 <commands+0x3b0>
c0001430:	0f900593          	li	a1,249
c0001434:	00013517          	auipc	a0,0x13
c0001438:	e5c50513          	addi	a0,a0,-420 # c0014290 <commands+0x5d8>
c000143c:	e89fe0ef          	jal	ra,c00002c4 <__panic>
c0001440:	bb9ff06f          	j	c0000ff8 <print_trapframe>
c0001444:	00040513          	mv	a0,s0
c0001448:	bb1ff0ef          	jal	ra,c0000ff8 <print_trapframe>
c000144c:	00099797          	auipc	a5,0x99
c0001450:	3607a783          	lw	a5,864(a5) # c009a7ac <current>
c0001454:	08078c63          	beqz	a5,c00014ec <exception_handler+0x20c>
c0001458:	08042783          	lw	a5,128(s0)
c000145c:	1007f793          	andi	a5,a5,256
c0001460:	04078463          	beqz	a5,c00014a8 <exception_handler+0x1c8>
c0001464:	00048693          	mv	a3,s1
c0001468:	00013617          	auipc	a2,0x13
c000146c:	c0060613          	addi	a2,a2,-1024 # c0014068 <commands+0x3b0>
c0001470:	0e500593          	li	a1,229
c0001474:	00013517          	auipc	a0,0x13
c0001478:	e1c50513          	addi	a0,a0,-484 # c0014290 <commands+0x5d8>
c000147c:	e49fe0ef          	jal	ra,c00002c4 <__panic>
c0001480:	00013517          	auipc	a0,0x13
c0001484:	c1850513          	addi	a0,a0,-1000 # c0014098 <commands+0x3e0>
c0001488:	cc1fe0ef          	jal	ra,c0000148 <cprintf>
c000148c:	00048693          	mv	a3,s1
c0001490:	00013617          	auipc	a2,0x13
c0001494:	c1c60613          	addi	a2,a2,-996 # c00140ac <commands+0x3f4>
c0001498:	0fc00593          	li	a1,252
c000149c:	00013517          	auipc	a0,0x13
c00014a0:	df450513          	addi	a0,a0,-524 # c0014290 <commands+0x5d8>
c00014a4:	e21fe0ef          	jal	ra,c00002c4 <__panic>
c00014a8:	00013517          	auipc	a0,0x13
c00014ac:	bf050513          	addi	a0,a0,-1040 # c0014098 <commands+0x3e0>
c00014b0:	c99fe0ef          	jal	ra,c0000148 <cprintf>
c00014b4:	00048693          	mv	a3,s1
c00014b8:	00013617          	auipc	a2,0x13
c00014bc:	bf460613          	addi	a2,a2,-1036 # c00140ac <commands+0x3f4>
c00014c0:	0e800593          	li	a1,232
c00014c4:	00013517          	auipc	a0,0x13
c00014c8:	dcc50513          	addi	a0,a0,-564 # c0014290 <commands+0x5d8>
c00014cc:	df9fe0ef          	jal	ra,c00002c4 <__panic>
c00014d0:	00048693          	mv	a3,s1
c00014d4:	00013617          	auipc	a2,0x13
c00014d8:	b7460613          	addi	a2,a2,-1164 # c0014048 <commands+0x390>
c00014dc:	0f500593          	li	a1,245
c00014e0:	00013517          	auipc	a0,0x13
c00014e4:	db050513          	addi	a0,a0,-592 # c0014290 <commands+0x5d8>
c00014e8:	dddfe0ef          	jal	ra,c00002c4 <__panic>
c00014ec:	00048693          	mv	a3,s1
c00014f0:	00013617          	auipc	a2,0x13
c00014f4:	b5860613          	addi	a2,a2,-1192 # c0014048 <commands+0x390>
c00014f8:	0e100593          	li	a1,225
c00014fc:	00013517          	auipc	a0,0x13
c0001500:	d9450513          	addi	a0,a0,-620 # c0014290 <commands+0x5d8>
c0001504:	dc1fe0ef          	jal	ra,c00002c4 <__panic>

c0001508 <trap>:
c0001508:	00099717          	auipc	a4,0x99
c000150c:	2a472703          	lw	a4,676(a4) # c009a7ac <current>
c0001510:	0a070063          	beqz	a4,c00015b0 <trap+0xa8>
c0001514:	ff010113          	addi	sp,sp,-16
c0001518:	00812423          	sw	s0,8(sp)
c000151c:	08c52683          	lw	a3,140(a0)
c0001520:	08052403          	lw	s0,128(a0)
c0001524:	00912223          	sw	s1,4(sp)
c0001528:	00112623          	sw	ra,12(sp)
c000152c:	05472483          	lw	s1,84(a4)
c0001530:	04a72a23          	sw	a0,84(a4)
c0001534:	10047413          	andi	s0,s0,256
c0001538:	0606c863          	bltz	a3,c00015a8 <trap+0xa0>
c000153c:	da5ff0ef          	jal	ra,c00012e0 <exception_handler>
c0001540:	00099797          	auipc	a5,0x99
c0001544:	26c7a783          	lw	a5,620(a5) # c009a7ac <current>
c0001548:	0497aa23          	sw	s1,84(a5)
c000154c:	00041c63          	bnez	s0,c0001564 <trap+0x5c>
c0001550:	05c7a703          	lw	a4,92(a5)
c0001554:	00177713          	andi	a4,a4,1
c0001558:	02071a63          	bnez	a4,c000158c <trap+0x84>
c000155c:	0107a783          	lw	a5,16(a5)
c0001560:	00079c63          	bnez	a5,c0001578 <trap+0x70>
c0001564:	00c12083          	lw	ra,12(sp)
c0001568:	00812403          	lw	s0,8(sp)
c000156c:	00412483          	lw	s1,4(sp)
c0001570:	01010113          	addi	sp,sp,16
c0001574:	00008067          	ret
c0001578:	00c12083          	lw	ra,12(sp)
c000157c:	00812403          	lw	s0,8(sp)
c0001580:	00412483          	lw	s1,4(sp)
c0001584:	01010113          	addi	sp,sp,16
c0001588:	7410806f          	j	c000a4c8 <schedule>
c000158c:	ff700513          	li	a0,-9
c0001590:	2bd070ef          	jal	ra,c000904c <do_exit>
c0001594:	00099797          	auipc	a5,0x99
c0001598:	2187a783          	lw	a5,536(a5) # c009a7ac <current>
c000159c:	0107a783          	lw	a5,16(a5)
c00015a0:	fc0782e3          	beqz	a5,c0001564 <trap+0x5c>
c00015a4:	fd5ff06f          	j	c0001578 <trap+0x70>
c00015a8:	c21ff0ef          	jal	ra,c00011c8 <interrupt_handler>
c00015ac:	f95ff06f          	j	c0001540 <trap+0x38>
c00015b0:	08c52783          	lw	a5,140(a0)
c00015b4:	0007c463          	bltz	a5,c00015bc <trap+0xb4>
c00015b8:	d29ff06f          	j	c00012e0 <exception_handler>
c00015bc:	c0dff06f          	j	c00011c8 <interrupt_handler>

c00015c0 <__alltraps>:
c00015c0:	14011173          	csrrw	sp,sscratch,sp
c00015c4:	00011463          	bnez	sp,c00015cc <__alltraps+0xc>
c00015c8:	14002173          	csrr	sp,sscratch
c00015cc:	f7010113          	addi	sp,sp,-144
c00015d0:	00012023          	sw	zero,0(sp)
c00015d4:	00112223          	sw	ra,4(sp)
c00015d8:	00312623          	sw	gp,12(sp)
c00015dc:	00412823          	sw	tp,16(sp)
c00015e0:	00512a23          	sw	t0,20(sp)
c00015e4:	00612c23          	sw	t1,24(sp)
c00015e8:	00712e23          	sw	t2,28(sp)
c00015ec:	02812023          	sw	s0,32(sp)
c00015f0:	02912223          	sw	s1,36(sp)
c00015f4:	02a12423          	sw	a0,40(sp)
c00015f8:	02b12623          	sw	a1,44(sp)
c00015fc:	02c12823          	sw	a2,48(sp)
c0001600:	02d12a23          	sw	a3,52(sp)
c0001604:	02e12c23          	sw	a4,56(sp)
c0001608:	02f12e23          	sw	a5,60(sp)
c000160c:	05012023          	sw	a6,64(sp)
c0001610:	05112223          	sw	a7,68(sp)
c0001614:	05212423          	sw	s2,72(sp)
c0001618:	05312623          	sw	s3,76(sp)
c000161c:	05412823          	sw	s4,80(sp)
c0001620:	05512a23          	sw	s5,84(sp)
c0001624:	05612c23          	sw	s6,88(sp)
c0001628:	05712e23          	sw	s7,92(sp)
c000162c:	07812023          	sw	s8,96(sp)
c0001630:	07912223          	sw	s9,100(sp)
c0001634:	07a12423          	sw	s10,104(sp)
c0001638:	07b12623          	sw	s11,108(sp)
c000163c:	07c12823          	sw	t3,112(sp)
c0001640:	07d12a23          	sw	t4,116(sp)
c0001644:	07e12c23          	sw	t5,120(sp)
c0001648:	07f12e23          	sw	t6,124(sp)
c000164c:	14001473          	csrrw	s0,sscratch,zero
c0001650:	100024f3          	csrr	s1,sstatus
c0001654:	14102973          	csrr	s2,sepc
c0001658:	143029f3          	csrr	s3,sbadaddr
c000165c:	14202a73          	csrr	s4,scause
c0001660:	00812423          	sw	s0,8(sp)
c0001664:	08912023          	sw	s1,128(sp)
c0001668:	09212223          	sw	s2,132(sp)
c000166c:	09312423          	sw	s3,136(sp)
c0001670:	09412623          	sw	s4,140(sp)
c0001674:	00010513          	mv	a0,sp
c0001678:	e91ff0ef          	jal	ra,c0001508 <trap>

c000167c <__trapret>:
c000167c:	08012483          	lw	s1,128(sp)
c0001680:	08412903          	lw	s2,132(sp)
c0001684:	1004f413          	andi	s0,s1,256
c0001688:	00041663          	bnez	s0,c0001694 <__trapret+0x18>
c000168c:	09010413          	addi	s0,sp,144
c0001690:	14041073          	csrw	sscratch,s0
c0001694:	10049073          	csrw	sstatus,s1
c0001698:	14191073          	csrw	sepc,s2
c000169c:	00412083          	lw	ra,4(sp)
c00016a0:	00c12183          	lw	gp,12(sp)
c00016a4:	01012203          	lw	tp,16(sp)
c00016a8:	01412283          	lw	t0,20(sp)
c00016ac:	01812303          	lw	t1,24(sp)
c00016b0:	01c12383          	lw	t2,28(sp)
c00016b4:	02012403          	lw	s0,32(sp)
c00016b8:	02412483          	lw	s1,36(sp)
c00016bc:	02812503          	lw	a0,40(sp)
c00016c0:	02c12583          	lw	a1,44(sp)
c00016c4:	03012603          	lw	a2,48(sp)
c00016c8:	03412683          	lw	a3,52(sp)
c00016cc:	03812703          	lw	a4,56(sp)
c00016d0:	03c12783          	lw	a5,60(sp)
c00016d4:	04012803          	lw	a6,64(sp)
c00016d8:	04412883          	lw	a7,68(sp)
c00016dc:	04812903          	lw	s2,72(sp)
c00016e0:	04c12983          	lw	s3,76(sp)
c00016e4:	05012a03          	lw	s4,80(sp)
c00016e8:	05412a83          	lw	s5,84(sp)
c00016ec:	05812b03          	lw	s6,88(sp)
c00016f0:	05c12b83          	lw	s7,92(sp)
c00016f4:	06012c03          	lw	s8,96(sp)
c00016f8:	06412c83          	lw	s9,100(sp)
c00016fc:	06812d03          	lw	s10,104(sp)
c0001700:	06c12d83          	lw	s11,108(sp)
c0001704:	07012e03          	lw	t3,112(sp)
c0001708:	07412e83          	lw	t4,116(sp)
c000170c:	07812f03          	lw	t5,120(sp)
c0001710:	07c12f83          	lw	t6,124(sp)
c0001714:	00812103          	lw	sp,8(sp)
c0001718:	10200073          	sret

c000171c <forkrets>:
c000171c:	00050113          	mv	sp,a0
c0001720:	f5dff06f          	j	c000167c <__trapret>

c0001724 <check_vma_overlap.isra.2.part.3>:
c0001724:	ff010113          	addi	sp,sp,-16
c0001728:	00013697          	auipc	a3,0x13
c000172c:	e7868693          	addi	a3,a3,-392 # c00145a0 <commands+0x8e8>
c0001730:	00012617          	auipc	a2,0x12
c0001734:	6ec60613          	addi	a2,a2,1772 # c0013e1c <commands+0x164>
c0001738:	06b00593          	li	a1,107
c000173c:	00013517          	auipc	a0,0x13
c0001740:	e8450513          	addi	a0,a0,-380 # c00145c0 <commands+0x908>
c0001744:	00112623          	sw	ra,12(sp)
c0001748:	b7dfe0ef          	jal	ra,c00002c4 <__panic>

c000174c <mm_create>:
c000174c:	ff010113          	addi	sp,sp,-16
c0001750:	02c00513          	li	a0,44
c0001754:	00812423          	sw	s0,8(sp)
c0001758:	00112623          	sw	ra,12(sp)
c000175c:	690010ef          	jal	ra,c0002dec <kmalloc>
c0001760:	00050413          	mv	s0,a0
c0001764:	02050c63          	beqz	a0,c000179c <mm_create+0x50>
c0001768:	00a42223          	sw	a0,4(s0)
c000176c:	00a42023          	sw	a0,0(s0)
c0001770:	00052423          	sw	zero,8(a0)
c0001774:	00052623          	sw	zero,12(a0)
c0001778:	00052823          	sw	zero,16(a0)
c000177c:	00099797          	auipc	a5,0x99
c0001780:	0207a783          	lw	a5,32(a5) # c009a79c <swap_init_ok>
c0001784:	02079663          	bnez	a5,c00017b0 <mm_create+0x64>
c0001788:	00052a23          	sw	zero,20(a0)
c000178c:	00042c23          	sw	zero,24(s0)
c0001790:	00100593          	li	a1,1
c0001794:	01c40513          	addi	a0,s0,28
c0001798:	258050ef          	jal	ra,c00069f0 <sem_init>
c000179c:	00c12083          	lw	ra,12(sp)
c00017a0:	00040513          	mv	a0,s0
c00017a4:	00812403          	lw	s0,8(sp)
c00017a8:	01010113          	addi	sp,sp,16
c00017ac:	00008067          	ret
c00017b0:	0d0020ef          	jal	ra,c0003880 <swap_init_mm>
c00017b4:	fd9ff06f          	j	c000178c <mm_create+0x40>

c00017b8 <vma_create>:
c00017b8:	ff010113          	addi	sp,sp,-16
c00017bc:	01212023          	sw	s2,0(sp)
c00017c0:	00050913          	mv	s2,a0
c00017c4:	01800513          	li	a0,24
c00017c8:	00812423          	sw	s0,8(sp)
c00017cc:	00912223          	sw	s1,4(sp)
c00017d0:	00112623          	sw	ra,12(sp)
c00017d4:	00058493          	mv	s1,a1
c00017d8:	00060413          	mv	s0,a2
c00017dc:	610010ef          	jal	ra,c0002dec <kmalloc>
c00017e0:	00050863          	beqz	a0,c00017f0 <vma_create+0x38>
c00017e4:	01252223          	sw	s2,4(a0)
c00017e8:	00952423          	sw	s1,8(a0)
c00017ec:	00852623          	sw	s0,12(a0)
c00017f0:	00c12083          	lw	ra,12(sp)
c00017f4:	00812403          	lw	s0,8(sp)
c00017f8:	00412483          	lw	s1,4(sp)
c00017fc:	00012903          	lw	s2,0(sp)
c0001800:	01010113          	addi	sp,sp,16
c0001804:	00008067          	ret

c0001808 <find_vma>:
c0001808:	04050263          	beqz	a0,c000184c <find_vma+0x44>
c000180c:	00852783          	lw	a5,8(a0)
c0001810:	00078663          	beqz	a5,c000181c <find_vma+0x14>
c0001814:	0047a703          	lw	a4,4(a5)
c0001818:	04e5f063          	bleu	a4,a1,c0001858 <find_vma+0x50>
c000181c:	00050793          	mv	a5,a0
c0001820:	0047a783          	lw	a5,4(a5)
c0001824:	02f50463          	beq	a0,a5,c000184c <find_vma+0x44>
c0001828:	ff47a703          	lw	a4,-12(a5)
c000182c:	fee5eae3          	bltu	a1,a4,c0001820 <find_vma+0x18>
c0001830:	ff87a703          	lw	a4,-8(a5)
c0001834:	fee5f6e3          	bleu	a4,a1,c0001820 <find_vma+0x18>
c0001838:	ff078793          	addi	a5,a5,-16
c000183c:	00078863          	beqz	a5,c000184c <find_vma+0x44>
c0001840:	00f52423          	sw	a5,8(a0)
c0001844:	00078513          	mv	a0,a5
c0001848:	00008067          	ret
c000184c:	00000793          	li	a5,0
c0001850:	00078513          	mv	a0,a5
c0001854:	00008067          	ret
c0001858:	0087a703          	lw	a4,8(a5)
c000185c:	fce5f0e3          	bleu	a4,a1,c000181c <find_vma+0x14>
c0001860:	00f52423          	sw	a5,8(a0)
c0001864:	fe1ff06f          	j	c0001844 <find_vma+0x3c>

c0001868 <insert_vma_struct>:
c0001868:	0045a603          	lw	a2,4(a1)
c000186c:	0085a803          	lw	a6,8(a1)
c0001870:	ff010113          	addi	sp,sp,-16
c0001874:	00112623          	sw	ra,12(sp)
c0001878:	00050713          	mv	a4,a0
c000187c:	01066a63          	bltu	a2,a6,c0001890 <insert_vma_struct+0x28>
c0001880:	0bc0006f          	j	c000193c <insert_vma_struct+0xd4>
c0001884:	ff47a683          	lw	a3,-12(a5)
c0001888:	06d66663          	bltu	a2,a3,c00018f4 <insert_vma_struct+0x8c>
c000188c:	00078713          	mv	a4,a5
c0001890:	00472783          	lw	a5,4(a4)
c0001894:	fef518e3          	bne	a0,a5,c0001884 <insert_vma_struct+0x1c>
c0001898:	00050793          	mv	a5,a0
c000189c:	0ca70263          	beq	a4,a0,c0001960 <insert_vma_struct+0xf8>
c00018a0:	ff872683          	lw	a3,-8(a4)
c00018a4:	ff472883          	lw	a7,-12(a4)
c00018a8:	0ad8fa63          	bleu	a3,a7,c000195c <insert_vma_struct+0xf4>
c00018ac:	06d66863          	bltu	a2,a3,c000191c <insert_vma_struct+0xb4>
c00018b0:	00f50a63          	beq	a0,a5,c00018c4 <insert_vma_struct+0x5c>
c00018b4:	ff47a683          	lw	a3,-12(a5)
c00018b8:	0706e263          	bltu	a3,a6,c000191c <insert_vma_struct+0xb4>
c00018bc:	ff87a603          	lw	a2,-8(a5)
c00018c0:	02c6fe63          	bleu	a2,a3,c00018fc <insert_vma_struct+0x94>
c00018c4:	01052683          	lw	a3,16(a0)
c00018c8:	00a5a023          	sw	a0,0(a1)
c00018cc:	01058613          	addi	a2,a1,16
c00018d0:	00c7a023          	sw	a2,0(a5)
c00018d4:	00c12083          	lw	ra,12(sp)
c00018d8:	00c72223          	sw	a2,4(a4)
c00018dc:	00f5aa23          	sw	a5,20(a1)
c00018e0:	00e5a823          	sw	a4,16(a1)
c00018e4:	00168793          	addi	a5,a3,1
c00018e8:	00f52823          	sw	a5,16(a0)
c00018ec:	01010113          	addi	sp,sp,16
c00018f0:	00008067          	ret
c00018f4:	fca702e3          	beq	a4,a0,c00018b8 <insert_vma_struct+0x50>
c00018f8:	fa9ff06f          	j	c00018a0 <insert_vma_struct+0x38>
c00018fc:	00013697          	auipc	a3,0x13
c0001900:	e0c68693          	addi	a3,a3,-500 # c0014708 <commands+0xa50>
c0001904:	00012617          	auipc	a2,0x12
c0001908:	51860613          	addi	a2,a2,1304 # c0013e1c <commands+0x164>
c000190c:	06d00593          	li	a1,109
c0001910:	00013517          	auipc	a0,0x13
c0001914:	cb050513          	addi	a0,a0,-848 # c00145c0 <commands+0x908>
c0001918:	9adfe0ef          	jal	ra,c00002c4 <__panic>
c000191c:	00013697          	auipc	a3,0x13
c0001920:	dcc68693          	addi	a3,a3,-564 # c00146e8 <commands+0xa30>
c0001924:	00012617          	auipc	a2,0x12
c0001928:	4f860613          	addi	a2,a2,1272 # c0013e1c <commands+0x164>
c000192c:	06c00593          	li	a1,108
c0001930:	00013517          	auipc	a0,0x13
c0001934:	c9050513          	addi	a0,a0,-880 # c00145c0 <commands+0x908>
c0001938:	98dfe0ef          	jal	ra,c00002c4 <__panic>
c000193c:	00013697          	auipc	a3,0x13
c0001940:	d9068693          	addi	a3,a3,-624 # c00146cc <commands+0xa14>
c0001944:	00012617          	auipc	a2,0x12
c0001948:	4d860613          	addi	a2,a2,1240 # c0013e1c <commands+0x164>
c000194c:	07200593          	li	a1,114
c0001950:	00013517          	auipc	a0,0x13
c0001954:	c7050513          	addi	a0,a0,-912 # c00145c0 <commands+0x908>
c0001958:	96dfe0ef          	jal	ra,c00002c4 <__panic>
c000195c:	dc9ff0ef          	jal	ra,c0001724 <check_vma_overlap.isra.2.part.3>
c0001960:	00070793          	mv	a5,a4
c0001964:	f61ff06f          	j	c00018c4 <insert_vma_struct+0x5c>

c0001968 <mm_destroy>:
c0001968:	01852783          	lw	a5,24(a0)
c000196c:	ff010113          	addi	sp,sp,-16
c0001970:	00112623          	sw	ra,12(sp)
c0001974:	00812423          	sw	s0,8(sp)
c0001978:	04079263          	bnez	a5,c00019bc <mm_destroy+0x54>
c000197c:	00050413          	mv	s0,a0
c0001980:	00452503          	lw	a0,4(a0)
c0001984:	02a40263          	beq	s0,a0,c00019a8 <mm_destroy+0x40>
c0001988:	00052703          	lw	a4,0(a0)
c000198c:	00452783          	lw	a5,4(a0)
c0001990:	ff050513          	addi	a0,a0,-16
c0001994:	00f72223          	sw	a5,4(a4)
c0001998:	00e7a023          	sw	a4,0(a5)
c000199c:	570010ef          	jal	ra,c0002f0c <kfree>
c00019a0:	00442503          	lw	a0,4(s0)
c00019a4:	fea412e3          	bne	s0,a0,c0001988 <mm_destroy+0x20>
c00019a8:	00040513          	mv	a0,s0
c00019ac:	00c12083          	lw	ra,12(sp)
c00019b0:	00812403          	lw	s0,8(sp)
c00019b4:	01010113          	addi	sp,sp,16
c00019b8:	5540106f          	j	c0002f0c <kfree>
c00019bc:	00013697          	auipc	a3,0x13
c00019c0:	d6c68693          	addi	a3,a3,-660 # c0014728 <commands+0xa70>
c00019c4:	00012617          	auipc	a2,0x12
c00019c8:	45860613          	addi	a2,a2,1112 # c0013e1c <commands+0x164>
c00019cc:	09100593          	li	a1,145
c00019d0:	00013517          	auipc	a0,0x13
c00019d4:	bf050513          	addi	a0,a0,-1040 # c00145c0 <commands+0x908>
c00019d8:	8edfe0ef          	jal	ra,c00002c4 <__panic>

c00019dc <mm_map>:
c00019dc:	000017b7          	lui	a5,0x1
c00019e0:	fe010113          	addi	sp,sp,-32
c00019e4:	fff78793          	addi	a5,a5,-1 # fff <_binary_bin_swap_img_size-0x6d01>
c00019e8:	fffff837          	lui	a6,0xfffff
c00019ec:	00812c23          	sw	s0,24(sp)
c00019f0:	00f60433          	add	s0,a2,a5
c00019f4:	00912a23          	sw	s1,20(sp)
c00019f8:	00b40433          	add	s0,s0,a1
c00019fc:	00112e23          	sw	ra,28(sp)
c0001a00:	01212823          	sw	s2,16(sp)
c0001a04:	01312623          	sw	s3,12(sp)
c0001a08:	01412423          	sw	s4,8(sp)
c0001a0c:	01512223          	sw	s5,4(sp)
c0001a10:	0105f4b3          	and	s1,a1,a6
c0001a14:	002007b7          	lui	a5,0x200
c0001a18:	01047433          	and	s0,s0,a6
c0001a1c:	08f4e863          	bltu	s1,a5,c0001aac <mm_map+0xd0>
c0001a20:	0884f663          	bleu	s0,s1,c0001aac <mm_map+0xd0>
c0001a24:	b00007b7          	lui	a5,0xb0000
c0001a28:	0887e263          	bltu	a5,s0,c0001aac <mm_map+0xd0>
c0001a2c:	00050993          	mv	s3,a0
c0001a30:	00070a13          	mv	s4,a4
c0001a34:	00068a93          	mv	s5,a3
c0001a38:	08050263          	beqz	a0,c0001abc <mm_map+0xe0>
c0001a3c:	00048593          	mv	a1,s1
c0001a40:	dc9ff0ef          	jal	ra,c0001808 <find_vma>
c0001a44:	00050663          	beqz	a0,c0001a50 <mm_map+0x74>
c0001a48:	00452783          	lw	a5,4(a0)
c0001a4c:	0687e063          	bltu	a5,s0,c0001aac <mm_map+0xd0>
c0001a50:	01800513          	li	a0,24
c0001a54:	398010ef          	jal	ra,c0002dec <kmalloc>
c0001a58:	00050913          	mv	s2,a0
c0001a5c:	ffc00513          	li	a0,-4
c0001a60:	02090463          	beqz	s2,c0001a88 <mm_map+0xac>
c0001a64:	00992223          	sw	s1,4(s2)
c0001a68:	00892423          	sw	s0,8(s2)
c0001a6c:	01592623          	sw	s5,12(s2)
c0001a70:	00090593          	mv	a1,s2
c0001a74:	00098513          	mv	a0,s3
c0001a78:	df1ff0ef          	jal	ra,c0001868 <insert_vma_struct>
c0001a7c:	020a0c63          	beqz	s4,c0001ab4 <mm_map+0xd8>
c0001a80:	012a2023          	sw	s2,0(s4)
c0001a84:	00000513          	li	a0,0
c0001a88:	01c12083          	lw	ra,28(sp)
c0001a8c:	01812403          	lw	s0,24(sp)
c0001a90:	01412483          	lw	s1,20(sp)
c0001a94:	01012903          	lw	s2,16(sp)
c0001a98:	00c12983          	lw	s3,12(sp)
c0001a9c:	00812a03          	lw	s4,8(sp)
c0001aa0:	00412a83          	lw	s5,4(sp)
c0001aa4:	02010113          	addi	sp,sp,32
c0001aa8:	00008067          	ret
c0001aac:	ffd00513          	li	a0,-3
c0001ab0:	fd9ff06f          	j	c0001a88 <mm_map+0xac>
c0001ab4:	00000513          	li	a0,0
c0001ab8:	fd1ff06f          	j	c0001a88 <mm_map+0xac>
c0001abc:	00013697          	auipc	a3,0x13
c0001ac0:	c8068693          	addi	a3,a3,-896 # c001473c <commands+0xa84>
c0001ac4:	00012617          	auipc	a2,0x12
c0001ac8:	35860613          	addi	a2,a2,856 # c0013e1c <commands+0x164>
c0001acc:	0a400593          	li	a1,164
c0001ad0:	00013517          	auipc	a0,0x13
c0001ad4:	af050513          	addi	a0,a0,-1296 # c00145c0 <commands+0x908>
c0001ad8:	fecfe0ef          	jal	ra,c00002c4 <__panic>

c0001adc <dup_mmap>:
c0001adc:	fe010113          	addi	sp,sp,-32
c0001ae0:	00112e23          	sw	ra,28(sp)
c0001ae4:	00812c23          	sw	s0,24(sp)
c0001ae8:	00912a23          	sw	s1,20(sp)
c0001aec:	01212823          	sw	s2,16(sp)
c0001af0:	01312623          	sw	s3,12(sp)
c0001af4:	01412423          	sw	s4,8(sp)
c0001af8:	01512223          	sw	s5,4(sp)
c0001afc:	01612023          	sw	s6,0(sp)
c0001b00:	0a050463          	beqz	a0,c0001ba8 <dup_mmap+0xcc>
c0001b04:	00050913          	mv	s2,a0
c0001b08:	00058493          	mv	s1,a1
c0001b0c:	00058413          	mv	s0,a1
c0001b10:	01800b13          	li	s6,24
c0001b14:	02059e63          	bnez	a1,c0001b50 <dup_mmap+0x74>
c0001b18:	0900006f          	j	c0001ba8 <dup_mmap+0xcc>
c0001b1c:	00050593          	mv	a1,a0
c0001b20:	0157a223          	sw	s5,4(a5) # b0000004 <sbi_remote_fence_i+0xb0000714>
c0001b24:	00090513          	mv	a0,s2
c0001b28:	0147a423          	sw	s4,8(a5)
c0001b2c:	0137a623          	sw	s3,12(a5)
c0001b30:	d39ff0ef          	jal	ra,c0001868 <insert_vma_struct>
c0001b34:	ff842683          	lw	a3,-8(s0)
c0001b38:	ff442603          	lw	a2,-12(s0)
c0001b3c:	00c4a583          	lw	a1,12(s1)
c0001b40:	00c92503          	lw	a0,12(s2)
c0001b44:	00000713          	li	a4,0
c0001b48:	698030ef          	jal	ra,c00051e0 <copy_range>
c0001b4c:	02051463          	bnez	a0,c0001b74 <dup_mmap+0x98>
c0001b50:	00042403          	lw	s0,0(s0)
c0001b54:	04848663          	beq	s1,s0,c0001ba0 <dup_mmap+0xc4>
c0001b58:	000b0513          	mv	a0,s6
c0001b5c:	ff442a83          	lw	s5,-12(s0)
c0001b60:	ff842a03          	lw	s4,-8(s0)
c0001b64:	ffc42983          	lw	s3,-4(s0)
c0001b68:	284010ef          	jal	ra,c0002dec <kmalloc>
c0001b6c:	00050793          	mv	a5,a0
c0001b70:	fa0516e3          	bnez	a0,c0001b1c <dup_mmap+0x40>
c0001b74:	ffc00513          	li	a0,-4
c0001b78:	01c12083          	lw	ra,28(sp)
c0001b7c:	01812403          	lw	s0,24(sp)
c0001b80:	01412483          	lw	s1,20(sp)
c0001b84:	01012903          	lw	s2,16(sp)
c0001b88:	00c12983          	lw	s3,12(sp)
c0001b8c:	00812a03          	lw	s4,8(sp)
c0001b90:	00412a83          	lw	s5,4(sp)
c0001b94:	00012b03          	lw	s6,0(sp)
c0001b98:	02010113          	addi	sp,sp,32
c0001b9c:	00008067          	ret
c0001ba0:	00000513          	li	a0,0
c0001ba4:	fd5ff06f          	j	c0001b78 <dup_mmap+0x9c>
c0001ba8:	00013697          	auipc	a3,0x13
c0001bac:	ae868693          	addi	a3,a3,-1304 # c0014690 <commands+0x9d8>
c0001bb0:	00012617          	auipc	a2,0x12
c0001bb4:	26c60613          	addi	a2,a2,620 # c0013e1c <commands+0x164>
c0001bb8:	0bc00593          	li	a1,188
c0001bbc:	00013517          	auipc	a0,0x13
c0001bc0:	a0450513          	addi	a0,a0,-1532 # c00145c0 <commands+0x908>
c0001bc4:	f00fe0ef          	jal	ra,c00002c4 <__panic>

c0001bc8 <exit_mmap>:
c0001bc8:	ff010113          	addi	sp,sp,-16
c0001bcc:	00112623          	sw	ra,12(sp)
c0001bd0:	00812423          	sw	s0,8(sp)
c0001bd4:	00912223          	sw	s1,4(sp)
c0001bd8:	01212023          	sw	s2,0(sp)
c0001bdc:	06050663          	beqz	a0,c0001c48 <exit_mmap+0x80>
c0001be0:	01852783          	lw	a5,24(a0)
c0001be4:	00050493          	mv	s1,a0
c0001be8:	06079063          	bnez	a5,c0001c48 <exit_mmap+0x80>
c0001bec:	00452403          	lw	s0,4(a0)
c0001bf0:	00c52903          	lw	s2,12(a0)
c0001bf4:	02850e63          	beq	a0,s0,c0001c30 <exit_mmap+0x68>
c0001bf8:	ff842603          	lw	a2,-8(s0)
c0001bfc:	ff442583          	lw	a1,-12(s0)
c0001c00:	00090513          	mv	a0,s2
c0001c04:	16c030ef          	jal	ra,c0004d70 <unmap_range>
c0001c08:	00442403          	lw	s0,4(s0)
c0001c0c:	fe8496e3          	bne	s1,s0,c0001bf8 <exit_mmap+0x30>
c0001c10:	00442483          	lw	s1,4(s0)
c0001c14:	00940e63          	beq	s0,s1,c0001c30 <exit_mmap+0x68>
c0001c18:	ff84a603          	lw	a2,-8(s1)
c0001c1c:	ff44a583          	lw	a1,-12(s1)
c0001c20:	00090513          	mv	a0,s2
c0001c24:	2c4030ef          	jal	ra,c0004ee8 <exit_range>
c0001c28:	0044a483          	lw	s1,4(s1)
c0001c2c:	fe8496e3          	bne	s1,s0,c0001c18 <exit_mmap+0x50>
c0001c30:	00c12083          	lw	ra,12(sp)
c0001c34:	00812403          	lw	s0,8(sp)
c0001c38:	00412483          	lw	s1,4(sp)
c0001c3c:	00012903          	lw	s2,0(sp)
c0001c40:	01010113          	addi	sp,sp,16
c0001c44:	00008067          	ret
c0001c48:	00013697          	auipc	a3,0x13
c0001c4c:	a6468693          	addi	a3,a3,-1436 # c00146ac <commands+0x9f4>
c0001c50:	00012617          	auipc	a2,0x12
c0001c54:	1cc60613          	addi	a2,a2,460 # c0013e1c <commands+0x164>
c0001c58:	0d200593          	li	a1,210
c0001c5c:	00013517          	auipc	a0,0x13
c0001c60:	96450513          	addi	a0,a0,-1692 # c00145c0 <commands+0x908>
c0001c64:	e60fe0ef          	jal	ra,c00002c4 <__panic>

c0001c68 <vmm_init>:
c0001c68:	fe010113          	addi	sp,sp,-32
c0001c6c:	00112e23          	sw	ra,28(sp)
c0001c70:	00812c23          	sw	s0,24(sp)
c0001c74:	00912a23          	sw	s1,20(sp)
c0001c78:	01212823          	sw	s2,16(sp)
c0001c7c:	01312623          	sw	s3,12(sp)
c0001c80:	01412423          	sw	s4,8(sp)
c0001c84:	01512223          	sw	s5,4(sp)
c0001c88:	59d020ef          	jal	ra,c0004a24 <nr_free_pages>
c0001c8c:	599020ef          	jal	ra,c0004a24 <nr_free_pages>
c0001c90:	abdff0ef          	jal	ra,c000174c <mm_create>
c0001c94:	00050493          	mv	s1,a0
c0001c98:	03200413          	li	s0,50
c0001c9c:	01800913          	li	s2,24
c0001ca0:	02051263          	bnez	a0,c0001cc4 <vmm_init+0x5c>
c0001ca4:	4640006f          	j	c0002108 <vmm_init+0x4a0>
c0001ca8:	00852223          	sw	s0,4(a0)
c0001cac:	00f52423          	sw	a5,8(a0)
c0001cb0:	00052623          	sw	zero,12(a0)
c0001cb4:	ffb40413          	addi	s0,s0,-5
c0001cb8:	00048513          	mv	a0,s1
c0001cbc:	badff0ef          	jal	ra,c0001868 <insert_vma_struct>
c0001cc0:	02040c63          	beqz	s0,c0001cf8 <vmm_init+0x90>
c0001cc4:	00090513          	mv	a0,s2
c0001cc8:	124010ef          	jal	ra,c0002dec <kmalloc>
c0001ccc:	00050593          	mv	a1,a0
c0001cd0:	00240793          	addi	a5,s0,2
c0001cd4:	fc051ae3          	bnez	a0,c0001ca8 <vmm_init+0x40>
c0001cd8:	00013697          	auipc	a3,0x13
c0001cdc:	ca868693          	addi	a3,a3,-856 # c0014980 <commands+0xcc8>
c0001ce0:	00012617          	auipc	a2,0x12
c0001ce4:	13c60613          	addi	a2,a2,316 # c0013e1c <commands+0x164>
c0001ce8:	10a00593          	li	a1,266
c0001cec:	00013517          	auipc	a0,0x13
c0001cf0:	8d450513          	addi	a0,a0,-1836 # c00145c0 <commands+0x908>
c0001cf4:	dd0fe0ef          	jal	ra,c00002c4 <__panic>
c0001cf8:	03700413          	li	s0,55
c0001cfc:	01800913          	li	s2,24
c0001d00:	1f900993          	li	s3,505
c0001d04:	0240006f          	j	c0001d28 <vmm_init+0xc0>
c0001d08:	00852223          	sw	s0,4(a0)
c0001d0c:	00f52423          	sw	a5,8(a0)
c0001d10:	00052623          	sw	zero,12(a0)
c0001d14:	00050593          	mv	a1,a0
c0001d18:	00540413          	addi	s0,s0,5
c0001d1c:	00048513          	mv	a0,s1
c0001d20:	b49ff0ef          	jal	ra,c0001868 <insert_vma_struct>
c0001d24:	03340a63          	beq	s0,s3,c0001d58 <vmm_init+0xf0>
c0001d28:	00090513          	mv	a0,s2
c0001d2c:	0c0010ef          	jal	ra,c0002dec <kmalloc>
c0001d30:	00240793          	addi	a5,s0,2
c0001d34:	fc051ae3          	bnez	a0,c0001d08 <vmm_init+0xa0>
c0001d38:	00013697          	auipc	a3,0x13
c0001d3c:	c4868693          	addi	a3,a3,-952 # c0014980 <commands+0xcc8>
c0001d40:	00012617          	auipc	a2,0x12
c0001d44:	0dc60613          	addi	a2,a2,220 # c0013e1c <commands+0x164>
c0001d48:	11000593          	li	a1,272
c0001d4c:	00013517          	auipc	a0,0x13
c0001d50:	87450513          	addi	a0,a0,-1932 # c00145c0 <commands+0x908>
c0001d54:	d70fe0ef          	jal	ra,c00002c4 <__panic>
c0001d58:	0044a783          	lw	a5,4(s1)
c0001d5c:	00700713          	li	a4,7
c0001d60:	1fb00593          	li	a1,507
c0001d64:	2ef48263          	beq	s1,a5,c0002048 <vmm_init+0x3e0>
c0001d68:	ff47a603          	lw	a2,-12(a5)
c0001d6c:	ffe70693          	addi	a3,a4,-2
c0001d70:	26d61c63          	bne	a2,a3,c0001fe8 <vmm_init+0x380>
c0001d74:	ff87a683          	lw	a3,-8(a5)
c0001d78:	26e69863          	bne	a3,a4,c0001fe8 <vmm_init+0x380>
c0001d7c:	00570713          	addi	a4,a4,5
c0001d80:	0047a783          	lw	a5,4(a5)
c0001d84:	feb710e3          	bne	a4,a1,c0001d64 <vmm_init+0xfc>
c0001d88:	00500413          	li	s0,5
c0001d8c:	1f900a93          	li	s5,505
c0001d90:	00040593          	mv	a1,s0
c0001d94:	00048513          	mv	a0,s1
c0001d98:	a71ff0ef          	jal	ra,c0001808 <find_vma>
c0001d9c:	00050913          	mv	s2,a0
c0001da0:	2e050463          	beqz	a0,c0002088 <vmm_init+0x420>
c0001da4:	00140593          	addi	a1,s0,1
c0001da8:	00048513          	mv	a0,s1
c0001dac:	a5dff0ef          	jal	ra,c0001808 <find_vma>
c0001db0:	00050993          	mv	s3,a0
c0001db4:	2a050a63          	beqz	a0,c0002068 <vmm_init+0x400>
c0001db8:	00240a13          	addi	s4,s0,2
c0001dbc:	000a0593          	mv	a1,s4
c0001dc0:	00048513          	mv	a0,s1
c0001dc4:	a45ff0ef          	jal	ra,c0001808 <find_vma>
c0001dc8:	32051063          	bnez	a0,c00020e8 <vmm_init+0x480>
c0001dcc:	00340593          	addi	a1,s0,3
c0001dd0:	00048513          	mv	a0,s1
c0001dd4:	a35ff0ef          	jal	ra,c0001808 <find_vma>
c0001dd8:	2e051863          	bnez	a0,c00020c8 <vmm_init+0x460>
c0001ddc:	00440593          	addi	a1,s0,4
c0001de0:	00048513          	mv	a0,s1
c0001de4:	a25ff0ef          	jal	ra,c0001808 <find_vma>
c0001de8:	2c051063          	bnez	a0,c00020a8 <vmm_init+0x440>
c0001dec:	00492783          	lw	a5,4(s2)
c0001df0:	22f41c63          	bne	s0,a5,c0002028 <vmm_init+0x3c0>
c0001df4:	00892783          	lw	a5,8(s2)
c0001df8:	23479863          	bne	a5,s4,c0002028 <vmm_init+0x3c0>
c0001dfc:	0049a703          	lw	a4,4(s3)
c0001e00:	20e41463          	bne	s0,a4,c0002008 <vmm_init+0x3a0>
c0001e04:	0089a703          	lw	a4,8(s3)
c0001e08:	20f71063          	bne	a4,a5,c0002008 <vmm_init+0x3a0>
c0001e0c:	00540413          	addi	s0,s0,5
c0001e10:	f95410e3          	bne	s0,s5,c0001d90 <vmm_init+0x128>
c0001e14:	00400413          	li	s0,4
c0001e18:	fff00913          	li	s2,-1
c0001e1c:	00040593          	mv	a1,s0
c0001e20:	00048513          	mv	a0,s1
c0001e24:	9e5ff0ef          	jal	ra,c0001808 <find_vma>
c0001e28:	02050e63          	beqz	a0,c0001e64 <vmm_init+0x1fc>
c0001e2c:	00852683          	lw	a3,8(a0)
c0001e30:	00452603          	lw	a2,4(a0)
c0001e34:	00040593          	mv	a1,s0
c0001e38:	00013517          	auipc	a0,0x13
c0001e3c:	a1050513          	addi	a0,a0,-1520 # c0014848 <commands+0xb90>
c0001e40:	b08fe0ef          	jal	ra,c0000148 <cprintf>
c0001e44:	00013697          	auipc	a3,0x13
c0001e48:	a2c68693          	addi	a3,a3,-1492 # c0014870 <commands+0xbb8>
c0001e4c:	00012617          	auipc	a2,0x12
c0001e50:	fd060613          	addi	a2,a2,-48 # c0013e1c <commands+0x164>
c0001e54:	13300593          	li	a1,307
c0001e58:	00012517          	auipc	a0,0x12
c0001e5c:	76850513          	addi	a0,a0,1896 # c00145c0 <commands+0x908>
c0001e60:	c64fe0ef          	jal	ra,c00002c4 <__panic>
c0001e64:	fff40413          	addi	s0,s0,-1
c0001e68:	fb241ae3          	bne	s0,s2,c0001e1c <vmm_init+0x1b4>
c0001e6c:	00048513          	mv	a0,s1
c0001e70:	af9ff0ef          	jal	ra,c0001968 <mm_destroy>
c0001e74:	00013517          	auipc	a0,0x13
c0001e78:	a1050513          	addi	a0,a0,-1520 # c0014884 <commands+0xbcc>
c0001e7c:	accfe0ef          	jal	ra,c0000148 <cprintf>
c0001e80:	3a5020ef          	jal	ra,c0004a24 <nr_free_pages>
c0001e84:	00050993          	mv	s3,a0
c0001e88:	00099917          	auipc	s2,0x99
c0001e8c:	96890913          	addi	s2,s2,-1688 # c009a7f0 <check_mm_struct>
c0001e90:	8bdff0ef          	jal	ra,c000174c <mm_create>
c0001e94:	00a92023          	sw	a0,0(s2)
c0001e98:	00050413          	mv	s0,a0
c0001e9c:	2a050663          	beqz	a0,c0002148 <vmm_init+0x4e0>
c0001ea0:	00099497          	auipc	s1,0x99
c0001ea4:	9004a483          	lw	s1,-1792(s1) # c009a7a0 <boot_pgdir>
c0001ea8:	0004a783          	lw	a5,0(s1)
c0001eac:	00952623          	sw	s1,12(a0)
c0001eb0:	26079c63          	bnez	a5,c0002128 <vmm_init+0x4c0>
c0001eb4:	01800513          	li	a0,24
c0001eb8:	735000ef          	jal	ra,c0002dec <kmalloc>
c0001ebc:	00050a13          	mv	s4,a0
c0001ec0:	10050463          	beqz	a0,c0001fc8 <vmm_init+0x360>
c0001ec4:	004007b7          	lui	a5,0x400
c0001ec8:	00fa2423          	sw	a5,8(s4)
c0001ecc:	00200793          	li	a5,2
c0001ed0:	00050593          	mv	a1,a0
c0001ed4:	00fa2623          	sw	a5,12(s4)
c0001ed8:	00040513          	mv	a0,s0
c0001edc:	000a2223          	sw	zero,4(s4)
c0001ee0:	989ff0ef          	jal	ra,c0001868 <insert_vma_struct>
c0001ee4:	10000593          	li	a1,256
c0001ee8:	00040513          	mv	a0,s0
c0001eec:	91dff0ef          	jal	ra,c0001808 <find_vma>
c0001ef0:	00000793          	li	a5,0
c0001ef4:	06400713          	li	a4,100
c0001ef8:	2caa1463          	bne	s4,a0,c00021c0 <vmm_init+0x558>
c0001efc:	10f78023          	sb	a5,256(a5) # 400100 <_binary_bin_sfs_img_size+0x38ae00>
c0001f00:	00178793          	addi	a5,a5,1
c0001f04:	fee79ce3          	bne	a5,a4,c0001efc <vmm_init+0x294>
c0001f08:	00001737          	lui	a4,0x1
c0001f0c:	35670713          	addi	a4,a4,854 # 1356 <_binary_bin_swap_img_size-0x69aa>
c0001f10:	00000793          	li	a5,0
c0001f14:	06400613          	li	a2,100
c0001f18:	1007c683          	lbu	a3,256(a5)
c0001f1c:	00178793          	addi	a5,a5,1
c0001f20:	40d70733          	sub	a4,a4,a3
c0001f24:	fec79ae3          	bne	a5,a2,c0001f18 <vmm_init+0x2b0>
c0001f28:	26071c63          	bnez	a4,c00021a0 <vmm_init+0x538>
c0001f2c:	00000593          	li	a1,0
c0001f30:	00048513          	mv	a0,s1
c0001f34:	0f0030ef          	jal	ra,c0005024 <page_remove>
c0001f38:	0004a783          	lw	a5,0(s1)
c0001f3c:	00099717          	auipc	a4,0x99
c0001f40:	86872703          	lw	a4,-1944(a4) # c009a7a4 <npage>
c0001f44:	00279793          	slli	a5,a5,0x2
c0001f48:	00c7d793          	srli	a5,a5,0xc
c0001f4c:	22e7fe63          	bleu	a4,a5,c0002188 <vmm_init+0x520>
c0001f50:	00095717          	auipc	a4,0x95
c0001f54:	0f472703          	lw	a4,244(a4) # c0097044 <nbase>
c0001f58:	40e787b3          	sub	a5,a5,a4
c0001f5c:	00579793          	slli	a5,a5,0x5
c0001f60:	00099517          	auipc	a0,0x99
c0001f64:	95052503          	lw	a0,-1712(a0) # c009a8b0 <pages>
c0001f68:	00f50533          	add	a0,a0,a5
c0001f6c:	00100593          	li	a1,1
c0001f70:	251020ef          	jal	ra,c00049c0 <free_pages>
c0001f74:	0004a023          	sw	zero,0(s1)
c0001f78:	00042623          	sw	zero,12(s0)
c0001f7c:	00040513          	mv	a0,s0
c0001f80:	9e9ff0ef          	jal	ra,c0001968 <mm_destroy>
c0001f84:	00092023          	sw	zero,0(s2)
c0001f88:	29d020ef          	jal	ra,c0004a24 <nr_free_pages>
c0001f8c:	1ca99e63          	bne	s3,a0,c0002168 <vmm_init+0x500>
c0001f90:	00013517          	auipc	a0,0x13
c0001f94:	9bc50513          	addi	a0,a0,-1604 # c001494c <commands+0xc94>
c0001f98:	9b0fe0ef          	jal	ra,c0000148 <cprintf>
c0001f9c:	01c12083          	lw	ra,28(sp)
c0001fa0:	01812403          	lw	s0,24(sp)
c0001fa4:	01412483          	lw	s1,20(sp)
c0001fa8:	01012903          	lw	s2,16(sp)
c0001fac:	00c12983          	lw	s3,12(sp)
c0001fb0:	00812a03          	lw	s4,8(sp)
c0001fb4:	00412a83          	lw	s5,4(sp)
c0001fb8:	00013517          	auipc	a0,0x13
c0001fbc:	9b050513          	addi	a0,a0,-1616 # c0014968 <commands+0xcb0>
c0001fc0:	02010113          	addi	sp,sp,32
c0001fc4:	984fe06f          	j	c0000148 <cprintf>
c0001fc8:	00013697          	auipc	a3,0x13
c0001fcc:	9b868693          	addi	a3,a3,-1608 # c0014980 <commands+0xcc8>
c0001fd0:	00012617          	auipc	a2,0x12
c0001fd4:	e4c60613          	addi	a2,a2,-436 # c0013e1c <commands+0x164>
c0001fd8:	14900593          	li	a1,329
c0001fdc:	00012517          	auipc	a0,0x12
c0001fe0:	5e450513          	addi	a0,a0,1508 # c00145c0 <commands+0x908>
c0001fe4:	ae0fe0ef          	jal	ra,c00002c4 <__panic>
c0001fe8:	00012697          	auipc	a3,0x12
c0001fec:	77868693          	addi	a3,a3,1912 # c0014760 <commands+0xaa8>
c0001ff0:	00012617          	auipc	a2,0x12
c0001ff4:	e2c60613          	addi	a2,a2,-468 # c0013e1c <commands+0x164>
c0001ff8:	11900593          	li	a1,281
c0001ffc:	00012517          	auipc	a0,0x12
c0002000:	5c450513          	addi	a0,a0,1476 # c00145c0 <commands+0x908>
c0002004:	ac0fe0ef          	jal	ra,c00002c4 <__panic>
c0002008:	00013697          	auipc	a3,0x13
c000200c:	81068693          	addi	a3,a3,-2032 # c0014818 <commands+0xb60>
c0002010:	00012617          	auipc	a2,0x12
c0002014:	e0c60613          	addi	a2,a2,-500 # c0013e1c <commands+0x164>
c0002018:	12a00593          	li	a1,298
c000201c:	00012517          	auipc	a0,0x12
c0002020:	5a450513          	addi	a0,a0,1444 # c00145c0 <commands+0x908>
c0002024:	aa0fe0ef          	jal	ra,c00002c4 <__panic>
c0002028:	00012697          	auipc	a3,0x12
c000202c:	7c068693          	addi	a3,a3,1984 # c00147e8 <commands+0xb30>
c0002030:	00012617          	auipc	a2,0x12
c0002034:	dec60613          	addi	a2,a2,-532 # c0013e1c <commands+0x164>
c0002038:	12900593          	li	a1,297
c000203c:	00012517          	auipc	a0,0x12
c0002040:	58450513          	addi	a0,a0,1412 # c00145c0 <commands+0x908>
c0002044:	a80fe0ef          	jal	ra,c00002c4 <__panic>
c0002048:	00012697          	auipc	a3,0x12
c000204c:	70068693          	addi	a3,a3,1792 # c0014748 <commands+0xa90>
c0002050:	00012617          	auipc	a2,0x12
c0002054:	dcc60613          	addi	a2,a2,-564 # c0013e1c <commands+0x164>
c0002058:	11700593          	li	a1,279
c000205c:	00012517          	auipc	a0,0x12
c0002060:	56450513          	addi	a0,a0,1380 # c00145c0 <commands+0x908>
c0002064:	a60fe0ef          	jal	ra,c00002c4 <__panic>
c0002068:	00012697          	auipc	a3,0x12
c000206c:	74068693          	addi	a3,a3,1856 # c00147a8 <commands+0xaf0>
c0002070:	00012617          	auipc	a2,0x12
c0002074:	dac60613          	addi	a2,a2,-596 # c0013e1c <commands+0x164>
c0002078:	12100593          	li	a1,289
c000207c:	00012517          	auipc	a0,0x12
c0002080:	54450513          	addi	a0,a0,1348 # c00145c0 <commands+0x908>
c0002084:	a40fe0ef          	jal	ra,c00002c4 <__panic>
c0002088:	00012697          	auipc	a3,0x12
c000208c:	71068693          	addi	a3,a3,1808 # c0014798 <commands+0xae0>
c0002090:	00012617          	auipc	a2,0x12
c0002094:	d8c60613          	addi	a2,a2,-628 # c0013e1c <commands+0x164>
c0002098:	11f00593          	li	a1,287
c000209c:	00012517          	auipc	a0,0x12
c00020a0:	52450513          	addi	a0,a0,1316 # c00145c0 <commands+0x908>
c00020a4:	a20fe0ef          	jal	ra,c00002c4 <__panic>
c00020a8:	00012697          	auipc	a3,0x12
c00020ac:	73068693          	addi	a3,a3,1840 # c00147d8 <commands+0xb20>
c00020b0:	00012617          	auipc	a2,0x12
c00020b4:	d6c60613          	addi	a2,a2,-660 # c0013e1c <commands+0x164>
c00020b8:	12700593          	li	a1,295
c00020bc:	00012517          	auipc	a0,0x12
c00020c0:	50450513          	addi	a0,a0,1284 # c00145c0 <commands+0x908>
c00020c4:	a00fe0ef          	jal	ra,c00002c4 <__panic>
c00020c8:	00012697          	auipc	a3,0x12
c00020cc:	70068693          	addi	a3,a3,1792 # c00147c8 <commands+0xb10>
c00020d0:	00012617          	auipc	a2,0x12
c00020d4:	d4c60613          	addi	a2,a2,-692 # c0013e1c <commands+0x164>
c00020d8:	12500593          	li	a1,293
c00020dc:	00012517          	auipc	a0,0x12
c00020e0:	4e450513          	addi	a0,a0,1252 # c00145c0 <commands+0x908>
c00020e4:	9e0fe0ef          	jal	ra,c00002c4 <__panic>
c00020e8:	00012697          	auipc	a3,0x12
c00020ec:	6d068693          	addi	a3,a3,1744 # c00147b8 <commands+0xb00>
c00020f0:	00012617          	auipc	a2,0x12
c00020f4:	d2c60613          	addi	a2,a2,-724 # c0013e1c <commands+0x164>
c00020f8:	12300593          	li	a1,291
c00020fc:	00012517          	auipc	a0,0x12
c0002100:	4c450513          	addi	a0,a0,1220 # c00145c0 <commands+0x908>
c0002104:	9c0fe0ef          	jal	ra,c00002c4 <__panic>
c0002108:	00012697          	auipc	a3,0x12
c000210c:	63468693          	addi	a3,a3,1588 # c001473c <commands+0xa84>
c0002110:	00012617          	auipc	a2,0x12
c0002114:	d0c60613          	addi	a2,a2,-756 # c0013e1c <commands+0x164>
c0002118:	10300593          	li	a1,259
c000211c:	00012517          	auipc	a0,0x12
c0002120:	4a450513          	addi	a0,a0,1188 # c00145c0 <commands+0x908>
c0002124:	9a0fe0ef          	jal	ra,c00002c4 <__panic>
c0002128:	00012697          	auipc	a3,0x12
c000212c:	79468693          	addi	a3,a3,1940 # c00148bc <commands+0xc04>
c0002130:	00012617          	auipc	a2,0x12
c0002134:	cec60613          	addi	a2,a2,-788 # c0013e1c <commands+0x164>
c0002138:	14600593          	li	a1,326
c000213c:	00012517          	auipc	a0,0x12
c0002140:	48450513          	addi	a0,a0,1156 # c00145c0 <commands+0x908>
c0002144:	980fe0ef          	jal	ra,c00002c4 <__panic>
c0002148:	00012697          	auipc	a3,0x12
c000214c:	75c68693          	addi	a3,a3,1884 # c00148a4 <commands+0xbec>
c0002150:	00012617          	auipc	a2,0x12
c0002154:	ccc60613          	addi	a2,a2,-820 # c0013e1c <commands+0x164>
c0002158:	14200593          	li	a1,322
c000215c:	00012517          	auipc	a0,0x12
c0002160:	46450513          	addi	a0,a0,1124 # c00145c0 <commands+0x908>
c0002164:	960fe0ef          	jal	ra,c00002c4 <__panic>
c0002168:	00012697          	auipc	a3,0x12
c000216c:	7bc68693          	addi	a3,a3,1980 # c0014924 <commands+0xc6c>
c0002170:	00012617          	auipc	a2,0x12
c0002174:	cac60613          	addi	a2,a2,-852 # c0013e1c <commands+0x164>
c0002178:	16200593          	li	a1,354
c000217c:	00012517          	auipc	a0,0x12
c0002180:	44450513          	addi	a0,a0,1092 # c00145c0 <commands+0x908>
c0002184:	940fe0ef          	jal	ra,c00002c4 <__panic>
c0002188:	00012617          	auipc	a2,0x12
c000218c:	76c60613          	addi	a2,a2,1900 # c00148f4 <commands+0xc3c>
c0002190:	06900593          	li	a1,105
c0002194:	00012517          	auipc	a0,0x12
c0002198:	78050513          	addi	a0,a0,1920 # c0014914 <commands+0xc5c>
c000219c:	928fe0ef          	jal	ra,c00002c4 <__panic>
c00021a0:	00012697          	auipc	a3,0x12
c00021a4:	74868693          	addi	a3,a3,1864 # c00148e8 <commands+0xc30>
c00021a8:	00012617          	auipc	a2,0x12
c00021ac:	c7460613          	addi	a2,a2,-908 # c0013e1c <commands+0x164>
c00021b0:	15800593          	li	a1,344
c00021b4:	00012517          	auipc	a0,0x12
c00021b8:	40c50513          	addi	a0,a0,1036 # c00145c0 <commands+0x908>
c00021bc:	908fe0ef          	jal	ra,c00002c4 <__panic>
c00021c0:	00012697          	auipc	a3,0x12
c00021c4:	70c68693          	addi	a3,a3,1804 # c00148cc <commands+0xc14>
c00021c8:	00012617          	auipc	a2,0x12
c00021cc:	c5460613          	addi	a2,a2,-940 # c0013e1c <commands+0x164>
c00021d0:	14e00593          	li	a1,334
c00021d4:	00012517          	auipc	a0,0x12
c00021d8:	3ec50513          	addi	a0,a0,1004 # c00145c0 <commands+0x908>
c00021dc:	8e8fe0ef          	jal	ra,c00002c4 <__panic>

c00021e0 <do_pgfault>:
c00021e0:	fd010113          	addi	sp,sp,-48
c00021e4:	00060593          	mv	a1,a2
c00021e8:	02812423          	sw	s0,40(sp)
c00021ec:	02912223          	sw	s1,36(sp)
c00021f0:	02112623          	sw	ra,44(sp)
c00021f4:	03212023          	sw	s2,32(sp)
c00021f8:	01312e23          	sw	s3,28(sp)
c00021fc:	00060413          	mv	s0,a2
c0002200:	00050493          	mv	s1,a0
c0002204:	e04ff0ef          	jal	ra,c0001808 <find_vma>
c0002208:	00098797          	auipc	a5,0x98
c000220c:	5887a783          	lw	a5,1416(a5) # c009a790 <pgfault_num>
c0002210:	00178793          	addi	a5,a5,1
c0002214:	00098297          	auipc	t0,0x98
c0002218:	56f2ae23          	sw	a5,1404(t0) # c009a790 <pgfault_num>
c000221c:	10050c63          	beqz	a0,c0002334 <do_pgfault+0x154>
c0002220:	00452783          	lw	a5,4(a0)
c0002224:	10f46863          	bltu	s0,a5,c0002334 <do_pgfault+0x154>
c0002228:	00c52783          	lw	a5,12(a0)
c000222c:	01000993          	li	s3,16
c0002230:	0027f793          	andi	a5,a5,2
c0002234:	0a079063          	bnez	a5,c00022d4 <do_pgfault+0xf4>
c0002238:	fffff637          	lui	a2,0xfffff
c000223c:	00c4a503          	lw	a0,12(s1)
c0002240:	00c47433          	and	s0,s0,a2
c0002244:	00040593          	mv	a1,s0
c0002248:	00100613          	li	a2,1
c000224c:	031020ef          	jal	ra,c0004a7c <get_pte>
c0002250:	10050863          	beqz	a0,c0002360 <do_pgfault+0x180>
c0002254:	00052583          	lw	a1,0(a0)
c0002258:	0a058863          	beqz	a1,c0002308 <do_pgfault+0x128>
c000225c:	00098797          	auipc	a5,0x98
c0002260:	5407a783          	lw	a5,1344(a5) # c009a79c <swap_init_ok>
c0002264:	0e078463          	beqz	a5,c000234c <do_pgfault+0x16c>
c0002268:	00c10613          	addi	a2,sp,12
c000226c:	00040593          	mv	a1,s0
c0002270:	00048513          	mv	a0,s1
c0002274:	00012623          	sw	zero,12(sp)
c0002278:	7d4010ef          	jal	ra,c0003a4c <swap_in>
c000227c:	00050913          	mv	s2,a0
c0002280:	04051e63          	bnez	a0,c00022dc <do_pgfault+0xfc>
c0002284:	00c12583          	lw	a1,12(sp)
c0002288:	00c4a503          	lw	a0,12(s1)
c000228c:	00098693          	mv	a3,s3
c0002290:	00040613          	mv	a2,s0
c0002294:	63d020ef          	jal	ra,c00050d0 <page_insert>
c0002298:	00c12603          	lw	a2,12(sp)
c000229c:	00100693          	li	a3,1
c00022a0:	00040593          	mv	a1,s0
c00022a4:	00048513          	mv	a0,s1
c00022a8:	5e8010ef          	jal	ra,c0003890 <swap_map_swappable>
c00022ac:	00c12783          	lw	a5,12(sp)
c00022b0:	0087ae23          	sw	s0,28(a5)
c00022b4:	02c12083          	lw	ra,44(sp)
c00022b8:	00090513          	mv	a0,s2
c00022bc:	02812403          	lw	s0,40(sp)
c00022c0:	02412483          	lw	s1,36(sp)
c00022c4:	02012903          	lw	s2,32(sp)
c00022c8:	01c12983          	lw	s3,28(sp)
c00022cc:	03010113          	addi	sp,sp,48
c00022d0:	00008067          	ret
c00022d4:	01700993          	li	s3,23
c00022d8:	f61ff06f          	j	c0002238 <do_pgfault+0x58>
c00022dc:	00012517          	auipc	a0,0x12
c00022e0:	36c50513          	addi	a0,a0,876 # c0014648 <commands+0x990>
c00022e4:	e65fd0ef          	jal	ra,c0000148 <cprintf>
c00022e8:	02c12083          	lw	ra,44(sp)
c00022ec:	00090513          	mv	a0,s2
c00022f0:	02812403          	lw	s0,40(sp)
c00022f4:	02412483          	lw	s1,36(sp)
c00022f8:	02012903          	lw	s2,32(sp)
c00022fc:	01c12983          	lw	s3,28(sp)
c0002300:	03010113          	addi	sp,sp,48
c0002304:	00008067          	ret
c0002308:	00c4a503          	lw	a0,12(s1)
c000230c:	00098613          	mv	a2,s3
c0002310:	00040593          	mv	a1,s0
c0002314:	18c030ef          	jal	ra,c00054a0 <pgdir_alloc_page>
c0002318:	00000913          	li	s2,0
c000231c:	f8051ce3          	bnez	a0,c00022b4 <do_pgfault+0xd4>
c0002320:	00012517          	auipc	a0,0x12
c0002324:	30050513          	addi	a0,a0,768 # c0014620 <commands+0x968>
c0002328:	e21fd0ef          	jal	ra,c0000148 <cprintf>
c000232c:	ffc00913          	li	s2,-4
c0002330:	f85ff06f          	j	c00022b4 <do_pgfault+0xd4>
c0002334:	00040593          	mv	a1,s0
c0002338:	00012517          	auipc	a0,0x12
c000233c:	29850513          	addi	a0,a0,664 # c00145d0 <commands+0x918>
c0002340:	e09fd0ef          	jal	ra,c0000148 <cprintf>
c0002344:	ffd00913          	li	s2,-3
c0002348:	f6dff06f          	j	c00022b4 <do_pgfault+0xd4>
c000234c:	00012517          	auipc	a0,0x12
c0002350:	31c50513          	addi	a0,a0,796 # c0014668 <commands+0x9b0>
c0002354:	df5fd0ef          	jal	ra,c0000148 <cprintf>
c0002358:	ffc00913          	li	s2,-4
c000235c:	f59ff06f          	j	c00022b4 <do_pgfault+0xd4>
c0002360:	00012517          	auipc	a0,0x12
c0002364:	2a050513          	addi	a0,a0,672 # c0014600 <commands+0x948>
c0002368:	de1fd0ef          	jal	ra,c0000148 <cprintf>
c000236c:	ffc00913          	li	s2,-4
c0002370:	f45ff06f          	j	c00022b4 <do_pgfault+0xd4>

c0002374 <user_mem_check>:
c0002374:	fe010113          	addi	sp,sp,-32
c0002378:	00812c23          	sw	s0,24(sp)
c000237c:	00112e23          	sw	ra,28(sp)
c0002380:	00912a23          	sw	s1,20(sp)
c0002384:	01212823          	sw	s2,16(sp)
c0002388:	01312623          	sw	s3,12(sp)
c000238c:	01412423          	sw	s4,8(sp)
c0002390:	00058413          	mv	s0,a1
c0002394:	08050c63          	beqz	a0,c000242c <user_mem_check+0xb8>
c0002398:	002007b7          	lui	a5,0x200
c000239c:	06f5e663          	bltu	a1,a5,c0002408 <user_mem_check+0x94>
c00023a0:	00c584b3          	add	s1,a1,a2
c00023a4:	0695f263          	bleu	s1,a1,c0002408 <user_mem_check+0x94>
c00023a8:	b00007b7          	lui	a5,0xb0000
c00023ac:	0497ee63          	bltu	a5,s1,c0002408 <user_mem_check+0x94>
c00023b0:	00050913          	mv	s2,a0
c00023b4:	00068993          	mv	s3,a3
c00023b8:	00001a37          	lui	s4,0x1
c00023bc:	0240006f          	j	c00023e0 <user_mem_check+0x6c>
c00023c0:	0027f693          	andi	a3,a5,2
c00023c4:	01470733          	add	a4,a4,s4
c00023c8:	0087f793          	andi	a5,a5,8
c00023cc:	02068e63          	beqz	a3,c0002408 <user_mem_check+0x94>
c00023d0:	00078463          	beqz	a5,c00023d8 <user_mem_check+0x64>
c00023d4:	02e46a63          	bltu	s0,a4,c0002408 <user_mem_check+0x94>
c00023d8:	00852403          	lw	s0,8(a0)
c00023dc:	06947463          	bleu	s1,s0,c0002444 <user_mem_check+0xd0>
c00023e0:	00040593          	mv	a1,s0
c00023e4:	00090513          	mv	a0,s2
c00023e8:	c20ff0ef          	jal	ra,c0001808 <find_vma>
c00023ec:	00050e63          	beqz	a0,c0002408 <user_mem_check+0x94>
c00023f0:	00452703          	lw	a4,4(a0)
c00023f4:	00e46a63          	bltu	s0,a4,c0002408 <user_mem_check+0x94>
c00023f8:	00c52783          	lw	a5,12(a0)
c00023fc:	fc0992e3          	bnez	s3,c00023c0 <user_mem_check+0x4c>
c0002400:	0017f793          	andi	a5,a5,1
c0002404:	fc079ae3          	bnez	a5,c00023d8 <user_mem_check+0x64>
c0002408:	00000513          	li	a0,0
c000240c:	01c12083          	lw	ra,28(sp)
c0002410:	01812403          	lw	s0,24(sp)
c0002414:	01412483          	lw	s1,20(sp)
c0002418:	01012903          	lw	s2,16(sp)
c000241c:	00c12983          	lw	s3,12(sp)
c0002420:	00812a03          	lw	s4,8(sp)
c0002424:	02010113          	addi	sp,sp,32
c0002428:	00008067          	ret
c000242c:	c00007b7          	lui	a5,0xc0000
c0002430:	fcf5ece3          	bltu	a1,a5,c0002408 <user_mem_check+0x94>
c0002434:	00c58633          	add	a2,a1,a2
c0002438:	fcc5f8e3          	bleu	a2,a1,c0002408 <user_mem_check+0x94>
c000243c:	f80007b7          	lui	a5,0xf8000
c0002440:	fcc7e4e3          	bltu	a5,a2,c0002408 <user_mem_check+0x94>
c0002444:	00100513          	li	a0,1
c0002448:	fc5ff06f          	j	c000240c <user_mem_check+0x98>

c000244c <copy_from_user>:
c000244c:	ff010113          	addi	sp,sp,-16
c0002450:	00812423          	sw	s0,8(sp)
c0002454:	00912223          	sw	s1,4(sp)
c0002458:	00060413          	mv	s0,a2
c000245c:	00068493          	mv	s1,a3
c0002460:	01212023          	sw	s2,0(sp)
c0002464:	00070693          	mv	a3,a4
c0002468:	00058913          	mv	s2,a1
c000246c:	00048613          	mv	a2,s1
c0002470:	00040593          	mv	a1,s0
c0002474:	00112623          	sw	ra,12(sp)
c0002478:	efdff0ef          	jal	ra,c0002374 <user_mem_check>
c000247c:	00050c63          	beqz	a0,c0002494 <copy_from_user+0x48>
c0002480:	00048613          	mv	a2,s1
c0002484:	00040593          	mv	a1,s0
c0002488:	00090513          	mv	a0,s2
c000248c:	79d100ef          	jal	ra,c0013428 <memcpy>
c0002490:	00100513          	li	a0,1
c0002494:	00c12083          	lw	ra,12(sp)
c0002498:	00812403          	lw	s0,8(sp)
c000249c:	00412483          	lw	s1,4(sp)
c00024a0:	00012903          	lw	s2,0(sp)
c00024a4:	01010113          	addi	sp,sp,16
c00024a8:	00008067          	ret

c00024ac <copy_to_user>:
c00024ac:	ff010113          	addi	sp,sp,-16
c00024b0:	00812423          	sw	s0,8(sp)
c00024b4:	00068413          	mv	s0,a3
c00024b8:	01212023          	sw	s2,0(sp)
c00024bc:	00100693          	li	a3,1
c00024c0:	00060913          	mv	s2,a2
c00024c4:	00040613          	mv	a2,s0
c00024c8:	00912223          	sw	s1,4(sp)
c00024cc:	00112623          	sw	ra,12(sp)
c00024d0:	00058493          	mv	s1,a1
c00024d4:	ea1ff0ef          	jal	ra,c0002374 <user_mem_check>
c00024d8:	00050c63          	beqz	a0,c00024f0 <copy_to_user+0x44>
c00024dc:	00040613          	mv	a2,s0
c00024e0:	00090593          	mv	a1,s2
c00024e4:	00048513          	mv	a0,s1
c00024e8:	741100ef          	jal	ra,c0013428 <memcpy>
c00024ec:	00100513          	li	a0,1
c00024f0:	00c12083          	lw	ra,12(sp)
c00024f4:	00812403          	lw	s0,8(sp)
c00024f8:	00412483          	lw	s1,4(sp)
c00024fc:	00012903          	lw	s2,0(sp)
c0002500:	01010113          	addi	sp,sp,16
c0002504:	00008067          	ret

c0002508 <copy_string>:
c0002508:	fe010113          	addi	sp,sp,-32
c000250c:	01412423          	sw	s4,8(sp)
c0002510:	00001a37          	lui	s4,0x1
c0002514:	014607b3          	add	a5,a2,s4
c0002518:	fffff737          	lui	a4,0xfffff
c000251c:	00e7f7b3          	and	a5,a5,a4
c0002520:	00912a23          	sw	s1,20(sp)
c0002524:	01212823          	sw	s2,16(sp)
c0002528:	01312623          	sw	s3,12(sp)
c000252c:	01512223          	sw	s5,4(sp)
c0002530:	00112e23          	sw	ra,28(sp)
c0002534:	00812c23          	sw	s0,24(sp)
c0002538:	00060493          	mv	s1,a2
c000253c:	00050a93          	mv	s5,a0
c0002540:	00058993          	mv	s3,a1
c0002544:	00068913          	mv	s2,a3
c0002548:	40c787b3          	sub	a5,a5,a2
c000254c:	0380006f          	j	c0002584 <copy_string+0x7c>
c0002550:	00048513          	mv	a0,s1
c0002554:	5a9100ef          	jal	ra,c00132fc <strnlen>
c0002558:	00050793          	mv	a5,a0
c000255c:	00048593          	mv	a1,s1
c0002560:	00098513          	mv	a0,s3
c0002564:	00040613          	mv	a2,s0
c0002568:	0687e663          	bltu	a5,s0,c00025d4 <copy_string+0xcc>
c000256c:	04890063          	beq	s2,s0,c00025ac <copy_string+0xa4>
c0002570:	6b9100ef          	jal	ra,c0013428 <memcpy>
c0002574:	008989b3          	add	s3,s3,s0
c0002578:	008484b3          	add	s1,s1,s0
c000257c:	40890933          	sub	s2,s2,s0
c0002580:	000a0793          	mv	a5,s4
c0002584:	00000693          	li	a3,0
c0002588:	00048593          	mv	a1,s1
c000258c:	000a8513          	mv	a0,s5
c0002590:	00090413          	mv	s0,s2
c0002594:	0127f463          	bleu	s2,a5,c000259c <copy_string+0x94>
c0002598:	00078413          	mv	s0,a5
c000259c:	00040613          	mv	a2,s0
c00025a0:	dd5ff0ef          	jal	ra,c0002374 <user_mem_check>
c00025a4:	00040593          	mv	a1,s0
c00025a8:	fa0514e3          	bnez	a0,c0002550 <copy_string+0x48>
c00025ac:	00000513          	li	a0,0
c00025b0:	01c12083          	lw	ra,28(sp)
c00025b4:	01812403          	lw	s0,24(sp)
c00025b8:	01412483          	lw	s1,20(sp)
c00025bc:	01012903          	lw	s2,16(sp)
c00025c0:	00c12983          	lw	s3,12(sp)
c00025c4:	00812a03          	lw	s4,8(sp)
c00025c8:	00412a83          	lw	s5,4(sp)
c00025cc:	02010113          	addi	sp,sp,32
c00025d0:	00008067          	ret
c00025d4:	00178613          	addi	a2,a5,1 # f8000001 <sbi_remote_fence_i+0xf8000711>
c00025d8:	651100ef          	jal	ra,c0013428 <memcpy>
c00025dc:	00100513          	li	a0,1
c00025e0:	fd1ff06f          	j	c00025b0 <copy_string+0xa8>

c00025e4 <_fifo_init_mm>:
c00025e4:	00098797          	auipc	a5,0x98
c00025e8:	21078793          	addi	a5,a5,528 # c009a7f4 <pra_list_head>
c00025ec:	00f52a23          	sw	a5,20(a0)
c00025f0:	00f7a223          	sw	a5,4(a5)
c00025f4:	00f7a023          	sw	a5,0(a5)
c00025f8:	00000513          	li	a0,0
c00025fc:	00008067          	ret

c0002600 <_fifo_init>:
c0002600:	00000513          	li	a0,0
c0002604:	00008067          	ret

c0002608 <_fifo_set_unswappable>:
c0002608:	00000513          	li	a0,0
c000260c:	00008067          	ret

c0002610 <_fifo_tick_event>:
c0002610:	00000513          	li	a0,0
c0002614:	00008067          	ret

c0002618 <_fifo_check_swap>:
c0002618:	fd010113          	addi	sp,sp,-48
c000261c:	03212023          	sw	s2,32(sp)
c0002620:	01312e23          	sw	s3,28(sp)
c0002624:	00012517          	auipc	a0,0x12
c0002628:	36850513          	addi	a0,a0,872 # c001498c <commands+0xcd4>
c000262c:	00003937          	lui	s2,0x3
c0002630:	00c00993          	li	s3,12
c0002634:	02812423          	sw	s0,40(sp)
c0002638:	02112623          	sw	ra,44(sp)
c000263c:	02912223          	sw	s1,36(sp)
c0002640:	01412c23          	sw	s4,24(sp)
c0002644:	01512a23          	sw	s5,20(sp)
c0002648:	01612823          	sw	s6,16(sp)
c000264c:	01712623          	sw	s7,12(sp)
c0002650:	01812423          	sw	s8,8(sp)
c0002654:	af5fd0ef          	jal	ra,c0000148 <cprintf>
c0002658:	01390023          	sb	s3,0(s2) # 3000 <_binary_bin_swap_img_size-0x4d00>
c000265c:	00098417          	auipc	s0,0x98
c0002660:	13442403          	lw	s0,308(s0) # c009a790 <pgfault_num>
c0002664:	00400793          	li	a5,4
c0002668:	1af41c63          	bne	s0,a5,c0002820 <_fifo_check_swap+0x208>
c000266c:	00012517          	auipc	a0,0x12
c0002670:	37050513          	addi	a0,a0,880 # c00149dc <commands+0xd24>
c0002674:	00001ab7          	lui	s5,0x1
c0002678:	00a00b13          	li	s6,10
c000267c:	acdfd0ef          	jal	ra,c0000148 <cprintf>
c0002680:	016a8023          	sb	s6,0(s5) # 1000 <_binary_bin_swap_img_size-0x6d00>
c0002684:	00098497          	auipc	s1,0x98
c0002688:	10c4a483          	lw	s1,268(s1) # c009a790 <pgfault_num>
c000268c:	30849a63          	bne	s1,s0,c00029a0 <_fifo_check_swap+0x388>
c0002690:	00012517          	auipc	a0,0x12
c0002694:	37450513          	addi	a0,a0,884 # c0014a04 <commands+0xd4c>
c0002698:	00004bb7          	lui	s7,0x4
c000269c:	00d00c13          	li	s8,13
c00026a0:	aa9fd0ef          	jal	ra,c0000148 <cprintf>
c00026a4:	018b8023          	sb	s8,0(s7) # 4000 <_binary_bin_swap_img_size-0x3d00>
c00026a8:	00098a17          	auipc	s4,0x98
c00026ac:	0e8a2a03          	lw	s4,232(s4) # c009a790 <pgfault_num>
c00026b0:	2c9a1863          	bne	s4,s1,c0002980 <_fifo_check_swap+0x368>
c00026b4:	00012517          	auipc	a0,0x12
c00026b8:	37850513          	addi	a0,a0,888 # c0014a2c <commands+0xd74>
c00026bc:	00002437          	lui	s0,0x2
c00026c0:	00b00493          	li	s1,11
c00026c4:	a85fd0ef          	jal	ra,c0000148 <cprintf>
c00026c8:	00940023          	sb	s1,0(s0) # 2000 <_binary_bin_swap_img_size-0x5d00>
c00026cc:	00098797          	auipc	a5,0x98
c00026d0:	0c47a783          	lw	a5,196(a5) # c009a790 <pgfault_num>
c00026d4:	29479663          	bne	a5,s4,c0002960 <_fifo_check_swap+0x348>
c00026d8:	00012517          	auipc	a0,0x12
c00026dc:	37c50513          	addi	a0,a0,892 # c0014a54 <commands+0xd9c>
c00026e0:	a69fd0ef          	jal	ra,c0000148 <cprintf>
c00026e4:	000057b7          	lui	a5,0x5
c00026e8:	00e00713          	li	a4,14
c00026ec:	00e78023          	sb	a4,0(a5) # 5000 <_binary_bin_swap_img_size-0x2d00>
c00026f0:	00098a17          	auipc	s4,0x98
c00026f4:	0a0a2a03          	lw	s4,160(s4) # c009a790 <pgfault_num>
c00026f8:	00500793          	li	a5,5
c00026fc:	24fa1263          	bne	s4,a5,c0002940 <_fifo_check_swap+0x328>
c0002700:	00012517          	auipc	a0,0x12
c0002704:	32c50513          	addi	a0,a0,812 # c0014a2c <commands+0xd74>
c0002708:	a41fd0ef          	jal	ra,c0000148 <cprintf>
c000270c:	00940023          	sb	s1,0(s0)
c0002710:	00098797          	auipc	a5,0x98
c0002714:	0807a783          	lw	a5,128(a5) # c009a790 <pgfault_num>
c0002718:	21479463          	bne	a5,s4,c0002920 <_fifo_check_swap+0x308>
c000271c:	00012517          	auipc	a0,0x12
c0002720:	2c050513          	addi	a0,a0,704 # c00149dc <commands+0xd24>
c0002724:	a25fd0ef          	jal	ra,c0000148 <cprintf>
c0002728:	016a8023          	sb	s6,0(s5)
c000272c:	00098717          	auipc	a4,0x98
c0002730:	06472703          	lw	a4,100(a4) # c009a790 <pgfault_num>
c0002734:	00600793          	li	a5,6
c0002738:	1cf71463          	bne	a4,a5,c0002900 <_fifo_check_swap+0x2e8>
c000273c:	00012517          	auipc	a0,0x12
c0002740:	2f050513          	addi	a0,a0,752 # c0014a2c <commands+0xd74>
c0002744:	a05fd0ef          	jal	ra,c0000148 <cprintf>
c0002748:	00940023          	sb	s1,0(s0)
c000274c:	00098717          	auipc	a4,0x98
c0002750:	04472703          	lw	a4,68(a4) # c009a790 <pgfault_num>
c0002754:	00700793          	li	a5,7
c0002758:	18f71463          	bne	a4,a5,c00028e0 <_fifo_check_swap+0x2c8>
c000275c:	00012517          	auipc	a0,0x12
c0002760:	23050513          	addi	a0,a0,560 # c001498c <commands+0xcd4>
c0002764:	9e5fd0ef          	jal	ra,c0000148 <cprintf>
c0002768:	01390023          	sb	s3,0(s2)
c000276c:	00098717          	auipc	a4,0x98
c0002770:	02472703          	lw	a4,36(a4) # c009a790 <pgfault_num>
c0002774:	00800793          	li	a5,8
c0002778:	14f71463          	bne	a4,a5,c00028c0 <_fifo_check_swap+0x2a8>
c000277c:	00012517          	auipc	a0,0x12
c0002780:	28850513          	addi	a0,a0,648 # c0014a04 <commands+0xd4c>
c0002784:	9c5fd0ef          	jal	ra,c0000148 <cprintf>
c0002788:	018b8023          	sb	s8,0(s7)
c000278c:	00098717          	auipc	a4,0x98
c0002790:	00472703          	lw	a4,4(a4) # c009a790 <pgfault_num>
c0002794:	00900793          	li	a5,9
c0002798:	10f71463          	bne	a4,a5,c00028a0 <_fifo_check_swap+0x288>
c000279c:	00012517          	auipc	a0,0x12
c00027a0:	2b850513          	addi	a0,a0,696 # c0014a54 <commands+0xd9c>
c00027a4:	9a5fd0ef          	jal	ra,c0000148 <cprintf>
c00027a8:	000057b7          	lui	a5,0x5
c00027ac:	00e00713          	li	a4,14
c00027b0:	00e78023          	sb	a4,0(a5) # 5000 <_binary_bin_swap_img_size-0x2d00>
c00027b4:	00098417          	auipc	s0,0x98
c00027b8:	fdc42403          	lw	s0,-36(s0) # c009a790 <pgfault_num>
c00027bc:	00a00793          	li	a5,10
c00027c0:	0cf41063          	bne	s0,a5,c0002880 <_fifo_check_swap+0x268>
c00027c4:	00012517          	auipc	a0,0x12
c00027c8:	21850513          	addi	a0,a0,536 # c00149dc <commands+0xd24>
c00027cc:	97dfd0ef          	jal	ra,c0000148 <cprintf>
c00027d0:	000017b7          	lui	a5,0x1
c00027d4:	0007c783          	lbu	a5,0(a5) # 1000 <_binary_bin_swap_img_size-0x6d00>
c00027d8:	08879463          	bne	a5,s0,c0002860 <_fifo_check_swap+0x248>
c00027dc:	00098717          	auipc	a4,0x98
c00027e0:	fb472703          	lw	a4,-76(a4) # c009a790 <pgfault_num>
c00027e4:	00b00793          	li	a5,11
c00027e8:	04f71c63          	bne	a4,a5,c0002840 <_fifo_check_swap+0x228>
c00027ec:	02c12083          	lw	ra,44(sp)
c00027f0:	00000513          	li	a0,0
c00027f4:	02812403          	lw	s0,40(sp)
c00027f8:	02412483          	lw	s1,36(sp)
c00027fc:	02012903          	lw	s2,32(sp)
c0002800:	01c12983          	lw	s3,28(sp)
c0002804:	01812a03          	lw	s4,24(sp)
c0002808:	01412a83          	lw	s5,20(sp)
c000280c:	01012b03          	lw	s6,16(sp)
c0002810:	00c12b83          	lw	s7,12(sp)
c0002814:	00812c03          	lw	s8,8(sp)
c0002818:	03010113          	addi	sp,sp,48
c000281c:	00008067          	ret
c0002820:	00012697          	auipc	a3,0x12
c0002824:	19468693          	addi	a3,a3,404 # c00149b4 <commands+0xcfc>
c0002828:	00011617          	auipc	a2,0x11
c000282c:	5f460613          	addi	a2,a2,1524 # c0013e1c <commands+0x164>
c0002830:	05f00593          	li	a1,95
c0002834:	00012517          	auipc	a0,0x12
c0002838:	19450513          	addi	a0,a0,404 # c00149c8 <commands+0xd10>
c000283c:	a89fd0ef          	jal	ra,c00002c4 <__panic>
c0002840:	00012697          	auipc	a3,0x12
c0002844:	2d868693          	addi	a3,a3,728 # c0014b18 <commands+0xe60>
c0002848:	00011617          	auipc	a2,0x11
c000284c:	5d460613          	addi	a2,a2,1492 # c0013e1c <commands+0x164>
c0002850:	08100593          	li	a1,129
c0002854:	00012517          	auipc	a0,0x12
c0002858:	17450513          	addi	a0,a0,372 # c00149c8 <commands+0xd10>
c000285c:	a69fd0ef          	jal	ra,c00002c4 <__panic>
c0002860:	00012697          	auipc	a3,0x12
c0002864:	29468693          	addi	a3,a3,660 # c0014af4 <commands+0xe3c>
c0002868:	00011617          	auipc	a2,0x11
c000286c:	5b460613          	addi	a2,a2,1460 # c0013e1c <commands+0x164>
c0002870:	07f00593          	li	a1,127
c0002874:	00012517          	auipc	a0,0x12
c0002878:	15450513          	addi	a0,a0,340 # c00149c8 <commands+0xd10>
c000287c:	a49fd0ef          	jal	ra,c00002c4 <__panic>
c0002880:	00012697          	auipc	a3,0x12
c0002884:	26068693          	addi	a3,a3,608 # c0014ae0 <commands+0xe28>
c0002888:	00011617          	auipc	a2,0x11
c000288c:	59460613          	addi	a2,a2,1428 # c0013e1c <commands+0x164>
c0002890:	07d00593          	li	a1,125
c0002894:	00012517          	auipc	a0,0x12
c0002898:	13450513          	addi	a0,a0,308 # c00149c8 <commands+0xd10>
c000289c:	a29fd0ef          	jal	ra,c00002c4 <__panic>
c00028a0:	00012697          	auipc	a3,0x12
c00028a4:	22c68693          	addi	a3,a3,556 # c0014acc <commands+0xe14>
c00028a8:	00011617          	auipc	a2,0x11
c00028ac:	57460613          	addi	a2,a2,1396 # c0013e1c <commands+0x164>
c00028b0:	07a00593          	li	a1,122
c00028b4:	00012517          	auipc	a0,0x12
c00028b8:	11450513          	addi	a0,a0,276 # c00149c8 <commands+0xd10>
c00028bc:	a09fd0ef          	jal	ra,c00002c4 <__panic>
c00028c0:	00012697          	auipc	a3,0x12
c00028c4:	1f868693          	addi	a3,a3,504 # c0014ab8 <commands+0xe00>
c00028c8:	00011617          	auipc	a2,0x11
c00028cc:	55460613          	addi	a2,a2,1364 # c0013e1c <commands+0x164>
c00028d0:	07700593          	li	a1,119
c00028d4:	00012517          	auipc	a0,0x12
c00028d8:	0f450513          	addi	a0,a0,244 # c00149c8 <commands+0xd10>
c00028dc:	9e9fd0ef          	jal	ra,c00002c4 <__panic>
c00028e0:	00012697          	auipc	a3,0x12
c00028e4:	1c468693          	addi	a3,a3,452 # c0014aa4 <commands+0xdec>
c00028e8:	00011617          	auipc	a2,0x11
c00028ec:	53460613          	addi	a2,a2,1332 # c0013e1c <commands+0x164>
c00028f0:	07400593          	li	a1,116
c00028f4:	00012517          	auipc	a0,0x12
c00028f8:	0d450513          	addi	a0,a0,212 # c00149c8 <commands+0xd10>
c00028fc:	9c9fd0ef          	jal	ra,c00002c4 <__panic>
c0002900:	00012697          	auipc	a3,0x12
c0002904:	19068693          	addi	a3,a3,400 # c0014a90 <commands+0xdd8>
c0002908:	00011617          	auipc	a2,0x11
c000290c:	51460613          	addi	a2,a2,1300 # c0013e1c <commands+0x164>
c0002910:	07100593          	li	a1,113
c0002914:	00012517          	auipc	a0,0x12
c0002918:	0b450513          	addi	a0,a0,180 # c00149c8 <commands+0xd10>
c000291c:	9a9fd0ef          	jal	ra,c00002c4 <__panic>
c0002920:	00012697          	auipc	a3,0x12
c0002924:	15c68693          	addi	a3,a3,348 # c0014a7c <commands+0xdc4>
c0002928:	00011617          	auipc	a2,0x11
c000292c:	4f460613          	addi	a2,a2,1268 # c0013e1c <commands+0x164>
c0002930:	06e00593          	li	a1,110
c0002934:	00012517          	auipc	a0,0x12
c0002938:	09450513          	addi	a0,a0,148 # c00149c8 <commands+0xd10>
c000293c:	989fd0ef          	jal	ra,c00002c4 <__panic>
c0002940:	00012697          	auipc	a3,0x12
c0002944:	13c68693          	addi	a3,a3,316 # c0014a7c <commands+0xdc4>
c0002948:	00011617          	auipc	a2,0x11
c000294c:	4d460613          	addi	a2,a2,1236 # c0013e1c <commands+0x164>
c0002950:	06b00593          	li	a1,107
c0002954:	00012517          	auipc	a0,0x12
c0002958:	07450513          	addi	a0,a0,116 # c00149c8 <commands+0xd10>
c000295c:	969fd0ef          	jal	ra,c00002c4 <__panic>
c0002960:	00012697          	auipc	a3,0x12
c0002964:	05468693          	addi	a3,a3,84 # c00149b4 <commands+0xcfc>
c0002968:	00011617          	auipc	a2,0x11
c000296c:	4b460613          	addi	a2,a2,1204 # c0013e1c <commands+0x164>
c0002970:	06800593          	li	a1,104
c0002974:	00012517          	auipc	a0,0x12
c0002978:	05450513          	addi	a0,a0,84 # c00149c8 <commands+0xd10>
c000297c:	949fd0ef          	jal	ra,c00002c4 <__panic>
c0002980:	00012697          	auipc	a3,0x12
c0002984:	03468693          	addi	a3,a3,52 # c00149b4 <commands+0xcfc>
c0002988:	00011617          	auipc	a2,0x11
c000298c:	49460613          	addi	a2,a2,1172 # c0013e1c <commands+0x164>
c0002990:	06500593          	li	a1,101
c0002994:	00012517          	auipc	a0,0x12
c0002998:	03450513          	addi	a0,a0,52 # c00149c8 <commands+0xd10>
c000299c:	929fd0ef          	jal	ra,c00002c4 <__panic>
c00029a0:	00012697          	auipc	a3,0x12
c00029a4:	01468693          	addi	a3,a3,20 # c00149b4 <commands+0xcfc>
c00029a8:	00011617          	auipc	a2,0x11
c00029ac:	47460613          	addi	a2,a2,1140 # c0013e1c <commands+0x164>
c00029b0:	06200593          	li	a1,98
c00029b4:	00012517          	auipc	a0,0x12
c00029b8:	01450513          	addi	a0,a0,20 # c00149c8 <commands+0xd10>
c00029bc:	909fd0ef          	jal	ra,c00002c4 <__panic>

c00029c0 <_fifo_swap_out_victim>:
c00029c0:	01452783          	lw	a5,20(a0)
c00029c4:	ff010113          	addi	sp,sp,-16
c00029c8:	00112623          	sw	ra,12(sp)
c00029cc:	02078a63          	beqz	a5,c0002a00 <_fifo_swap_out_victim+0x40>
c00029d0:	04061863          	bnez	a2,c0002a20 <_fifo_swap_out_victim+0x60>
c00029d4:	0047a783          	lw	a5,4(a5)
c00029d8:	00c12083          	lw	ra,12(sp)
c00029dc:	00000513          	li	a0,0
c00029e0:	0007a683          	lw	a3,0(a5)
c00029e4:	0047a703          	lw	a4,4(a5)
c00029e8:	fec78793          	addi	a5,a5,-20
c00029ec:	01010113          	addi	sp,sp,16
c00029f0:	00e6a223          	sw	a4,4(a3)
c00029f4:	00d72023          	sw	a3,0(a4)
c00029f8:	00f5a023          	sw	a5,0(a1)
c00029fc:	00008067          	ret
c0002a00:	00012697          	auipc	a3,0x12
c0002a04:	14c68693          	addi	a3,a3,332 # c0014b4c <commands+0xe94>
c0002a08:	00011617          	auipc	a2,0x11
c0002a0c:	41460613          	addi	a2,a2,1044 # c0013e1c <commands+0x164>
c0002a10:	05000593          	li	a1,80
c0002a14:	00012517          	auipc	a0,0x12
c0002a18:	fb450513          	addi	a0,a0,-76 # c00149c8 <commands+0xd10>
c0002a1c:	8a9fd0ef          	jal	ra,c00002c4 <__panic>
c0002a20:	00012697          	auipc	a3,0x12
c0002a24:	13c68693          	addi	a3,a3,316 # c0014b5c <commands+0xea4>
c0002a28:	00011617          	auipc	a2,0x11
c0002a2c:	3f460613          	addi	a2,a2,1012 # c0013e1c <commands+0x164>
c0002a30:	05100593          	li	a1,81
c0002a34:	00012517          	auipc	a0,0x12
c0002a38:	f9450513          	addi	a0,a0,-108 # c00149c8 <commands+0xd10>
c0002a3c:	889fd0ef          	jal	ra,c00002c4 <__panic>

c0002a40 <_fifo_map_swappable>:
c0002a40:	01460713          	addi	a4,a2,20
c0002a44:	01452783          	lw	a5,20(a0)
c0002a48:	02070263          	beqz	a4,c0002a6c <_fifo_map_swappable+0x2c>
c0002a4c:	02078063          	beqz	a5,c0002a6c <_fifo_map_swappable+0x2c>
c0002a50:	0007a683          	lw	a3,0(a5)
c0002a54:	00e7a023          	sw	a4,0(a5)
c0002a58:	00000513          	li	a0,0
c0002a5c:	00e6a223          	sw	a4,4(a3)
c0002a60:	00f62c23          	sw	a5,24(a2)
c0002a64:	00d62a23          	sw	a3,20(a2)
c0002a68:	00008067          	ret
c0002a6c:	ff010113          	addi	sp,sp,-16
c0002a70:	00012697          	auipc	a3,0x12
c0002a74:	0bc68693          	addi	a3,a3,188 # c0014b2c <commands+0xe74>
c0002a78:	00011617          	auipc	a2,0x11
c0002a7c:	3a460613          	addi	a2,a2,932 # c0013e1c <commands+0x164>
c0002a80:	03f00593          	li	a1,63
c0002a84:	00012517          	auipc	a0,0x12
c0002a88:	f4450513          	addi	a0,a0,-188 # c00149c8 <commands+0xd10>
c0002a8c:	00112623          	sw	ra,12(sp)
c0002a90:	835fd0ef          	jal	ra,c00002c4 <__panic>

c0002a94 <slob_free>:
c0002a94:	08050a63          	beqz	a0,c0002b28 <slob_free+0x94>
c0002a98:	ff010113          	addi	sp,sp,-16
c0002a9c:	00112623          	sw	ra,12(sp)
c0002aa0:	00812423          	sw	s0,8(sp)
c0002aa4:	08059463          	bnez	a1,c0002b2c <slob_free+0x98>
c0002aa8:	00050413          	mv	s0,a0
c0002aac:	100027f3          	csrr	a5,sstatus
c0002ab0:	0027f793          	andi	a5,a5,2
c0002ab4:	00000613          	li	a2,0
c0002ab8:	08079a63          	bnez	a5,c0002b4c <slob_free+0xb8>
c0002abc:	00094797          	auipc	a5,0x94
c0002ac0:	5847a783          	lw	a5,1412(a5) # c0097040 <slobfree>
c0002ac4:	0047a703          	lw	a4,4(a5)
c0002ac8:	0087fc63          	bleu	s0,a5,c0002ae0 <slob_free+0x4c>
c0002acc:	00e46e63          	bltu	s0,a4,c0002ae8 <slob_free+0x54>
c0002ad0:	00e7fc63          	bleu	a4,a5,c0002ae8 <slob_free+0x54>
c0002ad4:	00070793          	mv	a5,a4
c0002ad8:	0047a703          	lw	a4,4(a5)
c0002adc:	fe87e8e3          	bltu	a5,s0,c0002acc <slob_free+0x38>
c0002ae0:	fee7eae3          	bltu	a5,a4,c0002ad4 <slob_free+0x40>
c0002ae4:	fee478e3          	bleu	a4,s0,c0002ad4 <slob_free+0x40>
c0002ae8:	00042583          	lw	a1,0(s0)
c0002aec:	00359693          	slli	a3,a1,0x3
c0002af0:	00d406b3          	add	a3,s0,a3
c0002af4:	08d70663          	beq	a4,a3,c0002b80 <slob_free+0xec>
c0002af8:	00e42223          	sw	a4,4(s0)
c0002afc:	0007a683          	lw	a3,0(a5)
c0002b00:	00369713          	slli	a4,a3,0x3
c0002b04:	00e78733          	add	a4,a5,a4
c0002b08:	06e40063          	beq	s0,a4,c0002b68 <slob_free+0xd4>
c0002b0c:	0087a223          	sw	s0,4(a5)
c0002b10:	00094297          	auipc	t0,0x94
c0002b14:	52f2a823          	sw	a5,1328(t0) # c0097040 <slobfree>
c0002b18:	04061063          	bnez	a2,c0002b58 <slob_free+0xc4>
c0002b1c:	00c12083          	lw	ra,12(sp)
c0002b20:	00812403          	lw	s0,8(sp)
c0002b24:	01010113          	addi	sp,sp,16
c0002b28:	00008067          	ret
c0002b2c:	00758793          	addi	a5,a1,7
c0002b30:	0037d793          	srli	a5,a5,0x3
c0002b34:	00f52023          	sw	a5,0(a0)
c0002b38:	00050413          	mv	s0,a0
c0002b3c:	100027f3          	csrr	a5,sstatus
c0002b40:	0027f793          	andi	a5,a5,2
c0002b44:	00000613          	li	a2,0
c0002b48:	f6078ae3          	beqz	a5,c0002abc <slob_free+0x28>
c0002b4c:	a74fe0ef          	jal	ra,c0000dc0 <intr_disable>
c0002b50:	00100613          	li	a2,1
c0002b54:	f69ff06f          	j	c0002abc <slob_free+0x28>
c0002b58:	00c12083          	lw	ra,12(sp)
c0002b5c:	00812403          	lw	s0,8(sp)
c0002b60:	01010113          	addi	sp,sp,16
c0002b64:	a54fe06f          	j	c0000db8 <intr_enable>
c0002b68:	00042703          	lw	a4,0(s0)
c0002b6c:	00442583          	lw	a1,4(s0)
c0002b70:	00d706b3          	add	a3,a4,a3
c0002b74:	00d7a023          	sw	a3,0(a5)
c0002b78:	00b7a223          	sw	a1,4(a5)
c0002b7c:	f95ff06f          	j	c0002b10 <slob_free+0x7c>
c0002b80:	00072683          	lw	a3,0(a4)
c0002b84:	00472703          	lw	a4,4(a4)
c0002b88:	00b685b3          	add	a1,a3,a1
c0002b8c:	00b42023          	sw	a1,0(s0)
c0002b90:	00e42223          	sw	a4,4(s0)
c0002b94:	f69ff06f          	j	c0002afc <slob_free+0x68>

c0002b98 <__slob_get_free_pages.isra.0>:
c0002b98:	00100793          	li	a5,1
c0002b9c:	ff010113          	addi	sp,sp,-16
c0002ba0:	00a79533          	sll	a0,a5,a0
c0002ba4:	00112623          	sw	ra,12(sp)
c0002ba8:	565010ef          	jal	ra,c000490c <alloc_pages>
c0002bac:	04050a63          	beqz	a0,c0002c00 <__slob_get_free_pages.isra.0+0x68>
c0002bb0:	00098697          	auipc	a3,0x98
c0002bb4:	d006a683          	lw	a3,-768(a3) # c009a8b0 <pages>
c0002bb8:	40d506b3          	sub	a3,a0,a3
c0002bbc:	4056d693          	srai	a3,a3,0x5
c0002bc0:	00094517          	auipc	a0,0x94
c0002bc4:	48452503          	lw	a0,1156(a0) # c0097044 <nbase>
c0002bc8:	001007b7          	lui	a5,0x100
c0002bcc:	00a686b3          	add	a3,a3,a0
c0002bd0:	fff78793          	addi	a5,a5,-1 # fffff <_binary_bin_sfs_img_size+0x8acff>
c0002bd4:	00f6f7b3          	and	a5,a3,a5
c0002bd8:	00098717          	auipc	a4,0x98
c0002bdc:	bcc72703          	lw	a4,-1076(a4) # c009a7a4 <npage>
c0002be0:	00c69693          	slli	a3,a3,0xc
c0002be4:	02e7f263          	bleu	a4,a5,c0002c08 <__slob_get_free_pages.isra.0+0x70>
c0002be8:	00098517          	auipc	a0,0x98
c0002bec:	cc052503          	lw	a0,-832(a0) # c009a8a8 <va_pa_offset>
c0002bf0:	00a68533          	add	a0,a3,a0
c0002bf4:	00c12083          	lw	ra,12(sp)
c0002bf8:	01010113          	addi	sp,sp,16
c0002bfc:	00008067          	ret
c0002c00:	00000513          	li	a0,0
c0002c04:	ff1ff06f          	j	c0002bf4 <__slob_get_free_pages.isra.0+0x5c>
c0002c08:	00012617          	auipc	a2,0x12
c0002c0c:	f7860613          	addi	a2,a2,-136 # c0014b80 <commands+0xec8>
c0002c10:	06e00593          	li	a1,110
c0002c14:	00012517          	auipc	a0,0x12
c0002c18:	d0050513          	addi	a0,a0,-768 # c0014914 <commands+0xc5c>
c0002c1c:	ea8fd0ef          	jal	ra,c00002c4 <__panic>

c0002c20 <slob_alloc.isra.1.constprop.3>:
c0002c20:	fd010113          	addi	sp,sp,-48
c0002c24:	02112623          	sw	ra,44(sp)
c0002c28:	02812423          	sw	s0,40(sp)
c0002c2c:	02912223          	sw	s1,36(sp)
c0002c30:	03212023          	sw	s2,32(sp)
c0002c34:	01312e23          	sw	s3,28(sp)
c0002c38:	00850713          	addi	a4,a0,8
c0002c3c:	000017b7          	lui	a5,0x1
c0002c40:	14f77e63          	bleu	a5,a4,c0002d9c <slob_alloc.isra.1.constprop.3+0x17c>
c0002c44:	00750493          	addi	s1,a0,7
c0002c48:	0034d413          	srli	s0,s1,0x3
c0002c4c:	10002673          	csrr	a2,sstatus
c0002c50:	00267613          	andi	a2,a2,2
c0002c54:	0e061e63          	bnez	a2,c0002d50 <slob_alloc.isra.1.constprop.3+0x130>
c0002c58:	00094697          	auipc	a3,0x94
c0002c5c:	3e86a683          	lw	a3,1000(a3) # c0097040 <slobfree>
c0002c60:	0046a783          	lw	a5,4(a3)
c0002c64:	0007a703          	lw	a4,0(a5) # 1000 <_binary_bin_swap_img_size-0x6d00>
c0002c68:	12875463          	ble	s0,a4,c0002d90 <slob_alloc.isra.1.constprop.3+0x170>
c0002c6c:	00001937          	lui	s2,0x1
c0002c70:	00100993          	li	s3,1
c0002c74:	00f68c63          	beq	a3,a5,c0002c8c <slob_alloc.isra.1.constprop.3+0x6c>
c0002c78:	0047a503          	lw	a0,4(a5)
c0002c7c:	00052703          	lw	a4,0(a0)
c0002c80:	04875463          	ble	s0,a4,c0002cc8 <slob_alloc.isra.1.constprop.3+0xa8>
c0002c84:	00050793          	mv	a5,a0
c0002c88:	fef698e3          	bne	a3,a5,c0002c78 <slob_alloc.isra.1.constprop.3+0x58>
c0002c8c:	08061463          	bnez	a2,c0002d14 <slob_alloc.isra.1.constprop.3+0xf4>
c0002c90:	00000513          	li	a0,0
c0002c94:	f05ff0ef          	jal	ra,c0002b98 <__slob_get_free_pages.isra.0>
c0002c98:	08050663          	beqz	a0,c0002d24 <slob_alloc.isra.1.constprop.3+0x104>
c0002c9c:	00090593          	mv	a1,s2
c0002ca0:	df5ff0ef          	jal	ra,c0002a94 <slob_free>
c0002ca4:	10002673          	csrr	a2,sstatus
c0002ca8:	00267613          	andi	a2,a2,2
c0002cac:	08061c63          	bnez	a2,c0002d44 <slob_alloc.isra.1.constprop.3+0x124>
c0002cb0:	00094697          	auipc	a3,0x94
c0002cb4:	3906a683          	lw	a3,912(a3) # c0097040 <slobfree>
c0002cb8:	00068793          	mv	a5,a3
c0002cbc:	0047a503          	lw	a0,4(a5)
c0002cc0:	00052703          	lw	a4,0(a0)
c0002cc4:	fc8740e3          	blt	a4,s0,c0002c84 <slob_alloc.isra.1.constprop.3+0x64>
c0002cc8:	0ae40e63          	beq	s0,a4,c0002d84 <slob_alloc.isra.1.constprop.3+0x164>
c0002ccc:	ff84f693          	andi	a3,s1,-8
c0002cd0:	00d506b3          	add	a3,a0,a3
c0002cd4:	00d7a223          	sw	a3,4(a5)
c0002cd8:	00452583          	lw	a1,4(a0)
c0002cdc:	40870733          	sub	a4,a4,s0
c0002ce0:	00e6a023          	sw	a4,0(a3)
c0002ce4:	00b6a223          	sw	a1,4(a3)
c0002ce8:	00852023          	sw	s0,0(a0)
c0002cec:	00094297          	auipc	t0,0x94
c0002cf0:	34f2aa23          	sw	a5,852(t0) # c0097040 <slobfree>
c0002cf4:	06061463          	bnez	a2,c0002d5c <slob_alloc.isra.1.constprop.3+0x13c>
c0002cf8:	02c12083          	lw	ra,44(sp)
c0002cfc:	02812403          	lw	s0,40(sp)
c0002d00:	02412483          	lw	s1,36(sp)
c0002d04:	02012903          	lw	s2,32(sp)
c0002d08:	01c12983          	lw	s3,28(sp)
c0002d0c:	03010113          	addi	sp,sp,48
c0002d10:	00008067          	ret
c0002d14:	8a4fe0ef          	jal	ra,c0000db8 <intr_enable>
c0002d18:	00000513          	li	a0,0
c0002d1c:	e7dff0ef          	jal	ra,c0002b98 <__slob_get_free_pages.isra.0>
c0002d20:	f6051ee3          	bnez	a0,c0002c9c <slob_alloc.isra.1.constprop.3+0x7c>
c0002d24:	02c12083          	lw	ra,44(sp)
c0002d28:	00000513          	li	a0,0
c0002d2c:	02812403          	lw	s0,40(sp)
c0002d30:	02412483          	lw	s1,36(sp)
c0002d34:	02012903          	lw	s2,32(sp)
c0002d38:	01c12983          	lw	s3,28(sp)
c0002d3c:	03010113          	addi	sp,sp,48
c0002d40:	00008067          	ret
c0002d44:	87cfe0ef          	jal	ra,c0000dc0 <intr_disable>
c0002d48:	00098613          	mv	a2,s3
c0002d4c:	f65ff06f          	j	c0002cb0 <slob_alloc.isra.1.constprop.3+0x90>
c0002d50:	870fe0ef          	jal	ra,c0000dc0 <intr_disable>
c0002d54:	00100613          	li	a2,1
c0002d58:	f01ff06f          	j	c0002c58 <slob_alloc.isra.1.constprop.3+0x38>
c0002d5c:	00a12623          	sw	a0,12(sp)
c0002d60:	858fe0ef          	jal	ra,c0000db8 <intr_enable>
c0002d64:	02c12083          	lw	ra,44(sp)
c0002d68:	00c12503          	lw	a0,12(sp)
c0002d6c:	02812403          	lw	s0,40(sp)
c0002d70:	02412483          	lw	s1,36(sp)
c0002d74:	02012903          	lw	s2,32(sp)
c0002d78:	01c12983          	lw	s3,28(sp)
c0002d7c:	03010113          	addi	sp,sp,48
c0002d80:	00008067          	ret
c0002d84:	00452703          	lw	a4,4(a0)
c0002d88:	00e7a223          	sw	a4,4(a5)
c0002d8c:	f61ff06f          	j	c0002cec <slob_alloc.isra.1.constprop.3+0xcc>
c0002d90:	00078513          	mv	a0,a5
c0002d94:	00068793          	mv	a5,a3
c0002d98:	f31ff06f          	j	c0002cc8 <slob_alloc.isra.1.constprop.3+0xa8>
c0002d9c:	00012697          	auipc	a3,0x12
c0002da0:	e4868693          	addi	a3,a3,-440 # c0014be4 <commands+0xf2c>
c0002da4:	00011617          	auipc	a2,0x11
c0002da8:	07860613          	addi	a2,a2,120 # c0013e1c <commands+0x164>
c0002dac:	06400593          	li	a1,100
c0002db0:	00012517          	auipc	a0,0x12
c0002db4:	e5450513          	addi	a0,a0,-428 # c0014c04 <commands+0xf4c>
c0002db8:	d0cfd0ef          	jal	ra,c00002c4 <__panic>

c0002dbc <kmalloc_init>:
c0002dbc:	ff010113          	addi	sp,sp,-16
c0002dc0:	00012517          	auipc	a0,0x12
c0002dc4:	e5850513          	addi	a0,a0,-424 # c0014c18 <commands+0xf60>
c0002dc8:	00112623          	sw	ra,12(sp)
c0002dcc:	b7cfd0ef          	jal	ra,c0000148 <cprintf>
c0002dd0:	00c12083          	lw	ra,12(sp)
c0002dd4:	00012517          	auipc	a0,0x12
c0002dd8:	df450513          	addi	a0,a0,-524 # c0014bc8 <commands+0xf10>
c0002ddc:	01010113          	addi	sp,sp,16
c0002de0:	b68fd06f          	j	c0000148 <cprintf>

c0002de4 <kallocated>:
c0002de4:	00000513          	li	a0,0
c0002de8:	00008067          	ret

c0002dec <kmalloc>:
c0002dec:	ff010113          	addi	sp,sp,-16
c0002df0:	00912223          	sw	s1,4(sp)
c0002df4:	000014b7          	lui	s1,0x1
c0002df8:	00812423          	sw	s0,8(sp)
c0002dfc:	00112623          	sw	ra,12(sp)
c0002e00:	01212023          	sw	s2,0(sp)
c0002e04:	ff748793          	addi	a5,s1,-9 # ff7 <_binary_bin_swap_img_size-0x6d09>
c0002e08:	00050413          	mv	s0,a0
c0002e0c:	02a7e863          	bltu	a5,a0,c0002e3c <kmalloc+0x50>
c0002e10:	00850513          	addi	a0,a0,8
c0002e14:	e0dff0ef          	jal	ra,c0002c20 <slob_alloc.isra.1.constprop.3>
c0002e18:	00850413          	addi	s0,a0,8
c0002e1c:	0c050c63          	beqz	a0,c0002ef4 <kmalloc+0x108>
c0002e20:	00c12083          	lw	ra,12(sp)
c0002e24:	00040513          	mv	a0,s0
c0002e28:	00412483          	lw	s1,4(sp)
c0002e2c:	00812403          	lw	s0,8(sp)
c0002e30:	00012903          	lw	s2,0(sp)
c0002e34:	01010113          	addi	sp,sp,16
c0002e38:	00008067          	ret
c0002e3c:	00c00513          	li	a0,12
c0002e40:	de1ff0ef          	jal	ra,c0002c20 <slob_alloc.isra.1.constprop.3>
c0002e44:	00050913          	mv	s2,a0
c0002e48:	0a050663          	beqz	a0,c0002ef4 <kmalloc+0x108>
c0002e4c:	00040793          	mv	a5,s0
c0002e50:	00000513          	li	a0,0
c0002e54:	0084da63          	ble	s0,s1,c0002e68 <kmalloc+0x7c>
c0002e58:	00048713          	mv	a4,s1
c0002e5c:	4017d793          	srai	a5,a5,0x1
c0002e60:	00150513          	addi	a0,a0,1
c0002e64:	fef74ce3          	blt	a4,a5,c0002e5c <kmalloc+0x70>
c0002e68:	00a92023          	sw	a0,0(s2) # 1000 <_binary_bin_swap_img_size-0x6d00>
c0002e6c:	d2dff0ef          	jal	ra,c0002b98 <__slob_get_free_pages.isra.0>
c0002e70:	00a92223          	sw	a0,4(s2)
c0002e74:	00050413          	mv	s0,a0
c0002e78:	08050263          	beqz	a0,c0002efc <kmalloc+0x110>
c0002e7c:	100027f3          	csrr	a5,sstatus
c0002e80:	0027f793          	andi	a5,a5,2
c0002e84:	02079a63          	bnez	a5,c0002eb8 <kmalloc+0xcc>
c0002e88:	00c12083          	lw	ra,12(sp)
c0002e8c:	00098797          	auipc	a5,0x98
c0002e90:	9087a783          	lw	a5,-1784(a5) # c009a794 <bigblocks>
c0002e94:	00040513          	mv	a0,s0
c0002e98:	00f92423          	sw	a5,8(s2)
c0002e9c:	00098297          	auipc	t0,0x98
c0002ea0:	8f22ac23          	sw	s2,-1800(t0) # c009a794 <bigblocks>
c0002ea4:	00812403          	lw	s0,8(sp)
c0002ea8:	00412483          	lw	s1,4(sp)
c0002eac:	00012903          	lw	s2,0(sp)
c0002eb0:	01010113          	addi	sp,sp,16
c0002eb4:	00008067          	ret
c0002eb8:	f09fd0ef          	jal	ra,c0000dc0 <intr_disable>
c0002ebc:	00098797          	auipc	a5,0x98
c0002ec0:	8d87a783          	lw	a5,-1832(a5) # c009a794 <bigblocks>
c0002ec4:	00f92423          	sw	a5,8(s2)
c0002ec8:	00098297          	auipc	t0,0x98
c0002ecc:	8d22a623          	sw	s2,-1844(t0) # c009a794 <bigblocks>
c0002ed0:	ee9fd0ef          	jal	ra,c0000db8 <intr_enable>
c0002ed4:	00c12083          	lw	ra,12(sp)
c0002ed8:	00492403          	lw	s0,4(s2)
c0002edc:	00412483          	lw	s1,4(sp)
c0002ee0:	00012903          	lw	s2,0(sp)
c0002ee4:	00040513          	mv	a0,s0
c0002ee8:	00812403          	lw	s0,8(sp)
c0002eec:	01010113          	addi	sp,sp,16
c0002ef0:	00008067          	ret
c0002ef4:	00000413          	li	s0,0
c0002ef8:	f29ff06f          	j	c0002e20 <kmalloc+0x34>
c0002efc:	00c00593          	li	a1,12
c0002f00:	00090513          	mv	a0,s2
c0002f04:	b91ff0ef          	jal	ra,c0002a94 <slob_free>
c0002f08:	f19ff06f          	j	c0002e20 <kmalloc+0x34>

c0002f0c <kfree>:
c0002f0c:	12050c63          	beqz	a0,c0003044 <kfree+0x138>
c0002f10:	ff010113          	addi	sp,sp,-16
c0002f14:	00912223          	sw	s1,4(sp)
c0002f18:	00112623          	sw	ra,12(sp)
c0002f1c:	00812423          	sw	s0,8(sp)
c0002f20:	01451793          	slli	a5,a0,0x14
c0002f24:	00050493          	mv	s1,a0
c0002f28:	04079263          	bnez	a5,c0002f6c <kfree+0x60>
c0002f2c:	100027f3          	csrr	a5,sstatus
c0002f30:	0027f793          	andi	a5,a5,2
c0002f34:	0c079663          	bnez	a5,c0003000 <kfree+0xf4>
c0002f38:	00098797          	auipc	a5,0x98
c0002f3c:	85c7a783          	lw	a5,-1956(a5) # c009a794 <bigblocks>
c0002f40:	02078663          	beqz	a5,c0002f6c <kfree+0x60>
c0002f44:	0047a703          	lw	a4,4(a5)
c0002f48:	10e50063          	beq	a0,a4,c0003048 <kfree+0x13c>
c0002f4c:	00000693          	li	a3,0
c0002f50:	0100006f          	j	c0002f60 <kfree+0x54>
c0002f54:	00442703          	lw	a4,4(s0)
c0002f58:	02e48863          	beq	s1,a4,c0002f88 <kfree+0x7c>
c0002f5c:	00040793          	mv	a5,s0
c0002f60:	0087a403          	lw	s0,8(a5)
c0002f64:	fe0418e3          	bnez	s0,c0002f54 <kfree+0x48>
c0002f68:	0c069a63          	bnez	a3,c000303c <kfree+0x130>
c0002f6c:	ff848513          	addi	a0,s1,-8
c0002f70:	00c12083          	lw	ra,12(sp)
c0002f74:	00812403          	lw	s0,8(sp)
c0002f78:	00412483          	lw	s1,4(sp)
c0002f7c:	00000593          	li	a1,0
c0002f80:	01010113          	addi	sp,sp,16
c0002f84:	b11ff06f          	j	c0002a94 <slob_free>
c0002f88:	00842703          	lw	a4,8(s0)
c0002f8c:	00e7a423          	sw	a4,8(a5)
c0002f90:	0a069263          	bnez	a3,c0003034 <kfree+0x128>
c0002f94:	c00007b7          	lui	a5,0xc0000
c0002f98:	00042703          	lw	a4,0(s0)
c0002f9c:	0cf4e263          	bltu	s1,a5,c0003060 <kfree+0x154>
c0002fa0:	00098697          	auipc	a3,0x98
c0002fa4:	9086a683          	lw	a3,-1784(a3) # c009a8a8 <va_pa_offset>
c0002fa8:	40d484b3          	sub	s1,s1,a3
c0002fac:	00c4d493          	srli	s1,s1,0xc
c0002fb0:	00097797          	auipc	a5,0x97
c0002fb4:	7f47a783          	lw	a5,2036(a5) # c009a7a4 <npage>
c0002fb8:	0cf4f263          	bleu	a5,s1,c000307c <kfree+0x170>
c0002fbc:	00094517          	auipc	a0,0x94
c0002fc0:	08852503          	lw	a0,136(a0) # c0097044 <nbase>
c0002fc4:	40a484b3          	sub	s1,s1,a0
c0002fc8:	00549493          	slli	s1,s1,0x5
c0002fcc:	00098517          	auipc	a0,0x98
c0002fd0:	8e452503          	lw	a0,-1820(a0) # c009a8b0 <pages>
c0002fd4:	00100593          	li	a1,1
c0002fd8:	00950533          	add	a0,a0,s1
c0002fdc:	00e595b3          	sll	a1,a1,a4
c0002fe0:	1e1010ef          	jal	ra,c00049c0 <free_pages>
c0002fe4:	00040513          	mv	a0,s0
c0002fe8:	00c12083          	lw	ra,12(sp)
c0002fec:	00812403          	lw	s0,8(sp)
c0002ff0:	00412483          	lw	s1,4(sp)
c0002ff4:	00c00593          	li	a1,12
c0002ff8:	01010113          	addi	sp,sp,16
c0002ffc:	a99ff06f          	j	c0002a94 <slob_free>
c0003000:	dc1fd0ef          	jal	ra,c0000dc0 <intr_disable>
c0003004:	00097797          	auipc	a5,0x97
c0003008:	7907a783          	lw	a5,1936(a5) # c009a794 <bigblocks>
c000300c:	02078863          	beqz	a5,c000303c <kfree+0x130>
c0003010:	0047a703          	lw	a4,4(a5)
c0003014:	00e48663          	beq	s1,a4,c0003020 <kfree+0x114>
c0003018:	00100693          	li	a3,1
c000301c:	f45ff06f          	j	c0002f60 <kfree+0x54>
c0003020:	0087a703          	lw	a4,8(a5)
c0003024:	00078413          	mv	s0,a5
c0003028:	00097797          	auipc	a5,0x97
c000302c:	76c78793          	addi	a5,a5,1900 # c009a794 <bigblocks>
c0003030:	00e7a023          	sw	a4,0(a5)
c0003034:	d85fd0ef          	jal	ra,c0000db8 <intr_enable>
c0003038:	f5dff06f          	j	c0002f94 <kfree+0x88>
c000303c:	d7dfd0ef          	jal	ra,c0000db8 <intr_enable>
c0003040:	f2dff06f          	j	c0002f6c <kfree+0x60>
c0003044:	00008067          	ret
c0003048:	0087a703          	lw	a4,8(a5)
c000304c:	00078413          	mv	s0,a5
c0003050:	00097797          	auipc	a5,0x97
c0003054:	74478793          	addi	a5,a5,1860 # c009a794 <bigblocks>
c0003058:	00e7a023          	sw	a4,0(a5)
c000305c:	f39ff06f          	j	c0002f94 <kfree+0x88>
c0003060:	00048693          	mv	a3,s1
c0003064:	00012617          	auipc	a2,0x12
c0003068:	b4060613          	addi	a2,a2,-1216 # c0014ba4 <commands+0xeec>
c000306c:	07000593          	li	a1,112
c0003070:	00012517          	auipc	a0,0x12
c0003074:	8a450513          	addi	a0,a0,-1884 # c0014914 <commands+0xc5c>
c0003078:	a4cfd0ef          	jal	ra,c00002c4 <__panic>
c000307c:	00012617          	auipc	a2,0x12
c0003080:	87860613          	addi	a2,a2,-1928 # c00148f4 <commands+0xc3c>
c0003084:	06900593          	li	a1,105
c0003088:	00012517          	auipc	a0,0x12
c000308c:	88c50513          	addi	a0,a0,-1908 # c0014914 <commands+0xc5c>
c0003090:	a34fd0ef          	jal	ra,c00002c4 <__panic>

c0003094 <swap_init>:
c0003094:	fb010113          	addi	sp,sp,-80
c0003098:	04112623          	sw	ra,76(sp)
c000309c:	04812423          	sw	s0,72(sp)
c00030a0:	04912223          	sw	s1,68(sp)
c00030a4:	05212023          	sw	s2,64(sp)
c00030a8:	03312e23          	sw	s3,60(sp)
c00030ac:	03412c23          	sw	s4,56(sp)
c00030b0:	03512a23          	sw	s5,52(sp)
c00030b4:	03612823          	sw	s6,48(sp)
c00030b8:	03712623          	sw	s7,44(sp)
c00030bc:	03812423          	sw	s8,40(sp)
c00030c0:	03912223          	sw	s9,36(sp)
c00030c4:	03a12023          	sw	s10,32(sp)
c00030c8:	01b12e23          	sw	s11,28(sp)
c00030cc:	4b40b0ef          	jal	ra,c000e580 <swapfs_init>
c00030d0:	00097697          	auipc	a3,0x97
c00030d4:	7a06a683          	lw	a3,1952(a3) # c009a870 <max_swap_offset>
c00030d8:	010007b7          	lui	a5,0x1000
c00030dc:	ff968713          	addi	a4,a3,-7
c00030e0:	ff878793          	addi	a5,a5,-8 # fffff8 <_binary_bin_sfs_img_size+0xf8acf8>
c00030e4:	5ee7e263          	bltu	a5,a4,c00036c8 <swap_init+0x634>
c00030e8:	00094797          	auipc	a5,0x94
c00030ec:	f1878793          	addi	a5,a5,-232 # c0097000 <swap_manager_fifo>
c00030f0:	00097297          	auipc	t0,0x97
c00030f4:	6af2a423          	sw	a5,1704(t0) # c009a798 <sm>
c00030f8:	00094797          	auipc	a5,0x94
c00030fc:	f0c7a783          	lw	a5,-244(a5) # c0097004 <swap_manager_fifo+0x4>
c0003100:	000780e7          	jalr	a5
c0003104:	00050a93          	mv	s5,a0
c0003108:	04050263          	beqz	a0,c000314c <swap_init+0xb8>
c000310c:	04c12083          	lw	ra,76(sp)
c0003110:	000a8513          	mv	a0,s5
c0003114:	04812403          	lw	s0,72(sp)
c0003118:	04412483          	lw	s1,68(sp)
c000311c:	04012903          	lw	s2,64(sp)
c0003120:	03c12983          	lw	s3,60(sp)
c0003124:	03812a03          	lw	s4,56(sp)
c0003128:	03412a83          	lw	s5,52(sp)
c000312c:	03012b03          	lw	s6,48(sp)
c0003130:	02c12b83          	lw	s7,44(sp)
c0003134:	02812c03          	lw	s8,40(sp)
c0003138:	02412c83          	lw	s9,36(sp)
c000313c:	02012d03          	lw	s10,32(sp)
c0003140:	01c12d83          	lw	s11,28(sp)
c0003144:	05010113          	addi	sp,sp,80
c0003148:	00008067          	ret
c000314c:	00097797          	auipc	a5,0x97
c0003150:	64c7a783          	lw	a5,1612(a5) # c009a798 <sm>
c0003154:	0007a583          	lw	a1,0(a5)
c0003158:	00012517          	auipc	a0,0x12
c000315c:	b5050513          	addi	a0,a0,-1200 # c0014ca8 <commands+0xff0>
c0003160:	00100793          	li	a5,1
c0003164:	00097297          	auipc	t0,0x97
c0003168:	62f2ac23          	sw	a5,1592(t0) # c009a79c <swap_init_ok>
c000316c:	fddfc0ef          	jal	ra,c0000148 <cprintf>
c0003170:	00097417          	auipc	s0,0x97
c0003174:	72840413          	addi	s0,s0,1832 # c009a898 <free_area>
c0003178:	00097797          	auipc	a5,0x97
c000317c:	7247a783          	lw	a5,1828(a5) # c009a89c <free_area+0x4>
c0003180:	3e878463          	beq	a5,s0,c0003568 <swap_init+0x4d4>
c0003184:	ff87a703          	lw	a4,-8(a5)
c0003188:	00175713          	srli	a4,a4,0x1
c000318c:	00177713          	andi	a4,a4,1
c0003190:	3e070463          	beqz	a4,c0003578 <swap_init+0x4e4>
c0003194:	00000d93          	li	s11,0
c0003198:	00000d13          	li	s10,0
c000319c:	0100006f          	j	c00031ac <swap_init+0x118>
c00031a0:	ff87a683          	lw	a3,-8(a5)
c00031a4:	0026f693          	andi	a3,a3,2
c00031a8:	3c068863          	beqz	a3,c0003578 <swap_init+0x4e4>
c00031ac:	ffc7a683          	lw	a3,-4(a5)
c00031b0:	0047a783          	lw	a5,4(a5)
c00031b4:	001d0d13          	addi	s10,s10,1
c00031b8:	00dd8db3          	add	s11,s11,a3
c00031bc:	000d8493          	mv	s1,s11
c00031c0:	fe8790e3          	bne	a5,s0,c00031a0 <swap_init+0x10c>
c00031c4:	061010ef          	jal	ra,c0004a24 <nr_free_pages>
c00031c8:	4ea49063          	bne	s1,a0,c00036a8 <swap_init+0x614>
c00031cc:	000d8613          	mv	a2,s11
c00031d0:	000d0593          	mv	a1,s10
c00031d4:	00012517          	auipc	a0,0x12
c00031d8:	b1450513          	addi	a0,a0,-1260 # c0014ce8 <commands+0x1030>
c00031dc:	f6dfc0ef          	jal	ra,c0000148 <cprintf>
c00031e0:	d6cfe0ef          	jal	ra,c000174c <mm_create>
c00031e4:	00050a13          	mv	s4,a0
c00031e8:	46050063          	beqz	a0,c0003648 <swap_init+0x5b4>
c00031ec:	00097797          	auipc	a5,0x97
c00031f0:	6047a783          	lw	a5,1540(a5) # c009a7f0 <check_mm_struct>
c00031f4:	48079a63          	bnez	a5,c0003688 <swap_init+0x5f4>
c00031f8:	00097997          	auipc	s3,0x97
c00031fc:	5a89a983          	lw	s3,1448(s3) # c009a7a0 <boot_pgdir>
c0003200:	0009a783          	lw	a5,0(s3)
c0003204:	00097717          	auipc	a4,0x97
c0003208:	5ec70713          	addi	a4,a4,1516 # c009a7f0 <check_mm_struct>
c000320c:	00a72023          	sw	a0,0(a4)
c0003210:	01352623          	sw	s3,12(a0)
c0003214:	64079663          	bnez	a5,c0003860 <swap_init+0x7cc>
c0003218:	000065b7          	lui	a1,0x6
c000321c:	00300613          	li	a2,3
c0003220:	00001537          	lui	a0,0x1
c0003224:	d94fe0ef          	jal	ra,c00017b8 <vma_create>
c0003228:	00050593          	mv	a1,a0
c000322c:	42050e63          	beqz	a0,c0003668 <swap_init+0x5d4>
c0003230:	000a0513          	mv	a0,s4
c0003234:	e34fe0ef          	jal	ra,c0001868 <insert_vma_struct>
c0003238:	00012517          	auipc	a0,0x12
c000323c:	af050513          	addi	a0,a0,-1296 # c0014d28 <commands+0x1070>
c0003240:	f09fc0ef          	jal	ra,c0000148 <cprintf>
c0003244:	00ca2503          	lw	a0,12(s4)
c0003248:	00100613          	li	a2,1
c000324c:	000015b7          	lui	a1,0x1
c0003250:	02d010ef          	jal	ra,c0004a7c <get_pte>
c0003254:	5e050663          	beqz	a0,c0003840 <swap_init+0x7ac>
c0003258:	00012517          	auipc	a0,0x12
c000325c:	b1850513          	addi	a0,a0,-1256 # c0014d70 <commands+0x10b8>
c0003260:	00097917          	auipc	s2,0x97
c0003264:	59c90913          	addi	s2,s2,1436 # c009a7fc <check_rp>
c0003268:	ee1fc0ef          	jal	ra,c0000148 <cprintf>
c000326c:	00097b17          	auipc	s6,0x97
c0003270:	5a0b0b13          	addi	s6,s6,1440 # c009a80c <swap_in_seq_no>
c0003274:	00090b93          	mv	s7,s2
c0003278:	00100493          	li	s1,1
c000327c:	00048513          	mv	a0,s1
c0003280:	68c010ef          	jal	ra,c000490c <alloc_pages>
c0003284:	00aba023          	sw	a0,0(s7)
c0003288:	38050063          	beqz	a0,c0003608 <swap_init+0x574>
c000328c:	00452783          	lw	a5,4(a0)
c0003290:	0027f793          	andi	a5,a5,2
c0003294:	34079a63          	bnez	a5,c00035e8 <swap_init+0x554>
c0003298:	004b8b93          	addi	s7,s7,4
c000329c:	ff6b90e3          	bne	s7,s6,c000327c <swap_init+0x1e8>
c00032a0:	00097797          	auipc	a5,0x97
c00032a4:	5f87a783          	lw	a5,1528(a5) # c009a898 <free_area>
c00032a8:	00f12423          	sw	a5,8(sp)
c00032ac:	00097797          	auipc	a5,0x97
c00032b0:	5f47a783          	lw	a5,1524(a5) # c009a8a0 <free_area+0x8>
c00032b4:	00097c97          	auipc	s9,0x97
c00032b8:	5e8cac83          	lw	s9,1512(s9) # c009a89c <free_area+0x4>
c00032bc:	00f12623          	sw	a5,12(sp)
c00032c0:	00842223          	sw	s0,4(s0)
c00032c4:	00842023          	sw	s0,0(s0)
c00032c8:	00042423          	sw	zero,8(s0)
c00032cc:	00097497          	auipc	s1,0x97
c00032d0:	53048493          	addi	s1,s1,1328 # c009a7fc <check_rp>
c00032d4:	00100b13          	li	s6,1
c00032d8:	0004a503          	lw	a0,0(s1)
c00032dc:	000b0593          	mv	a1,s6
c00032e0:	00448493          	addi	s1,s1,4
c00032e4:	6dc010ef          	jal	ra,c00049c0 <free_pages>
c00032e8:	ff7498e3          	bne	s1,s7,c00032d8 <swap_init+0x244>
c00032ec:	00097b17          	auipc	s6,0x97
c00032f0:	5b4b2b03          	lw	s6,1460(s6) # c009a8a0 <free_area+0x8>
c00032f4:	00400793          	li	a5,4
c00032f8:	52fb1463          	bne	s6,a5,c0003820 <swap_init+0x78c>
c00032fc:	00012517          	auipc	a0,0x12
c0003300:	aec50513          	addi	a0,a0,-1300 # c0014de8 <commands+0x1130>
c0003304:	e45fc0ef          	jal	ra,c0000148 <cprintf>
c0003308:	00001637          	lui	a2,0x1
c000330c:	00097297          	auipc	t0,0x97
c0003310:	4802a223          	sw	zero,1156(t0) # c009a790 <pgfault_num>
c0003314:	00a00593          	li	a1,10
c0003318:	00b60023          	sb	a1,0(a2) # 1000 <_binary_bin_swap_img_size-0x6d00>
c000331c:	00097797          	auipc	a5,0x97
c0003320:	4747a783          	lw	a5,1140(a5) # c009a790 <pgfault_num>
c0003324:	00100513          	li	a0,1
c0003328:	4aa79c63          	bne	a5,a0,c00037e0 <swap_init+0x74c>
c000332c:	00b60823          	sb	a1,16(a2)
c0003330:	00097617          	auipc	a2,0x97
c0003334:	46062603          	lw	a2,1120(a2) # c009a790 <pgfault_num>
c0003338:	4cf61463          	bne	a2,a5,c0003800 <swap_init+0x76c>
c000333c:	00002637          	lui	a2,0x2
c0003340:	00b00593          	li	a1,11
c0003344:	00b60023          	sb	a1,0(a2) # 2000 <_binary_bin_swap_img_size-0x5d00>
c0003348:	00097797          	auipc	a5,0x97
c000334c:	4487a783          	lw	a5,1096(a5) # c009a790 <pgfault_num>
c0003350:	00200513          	li	a0,2
c0003354:	40a79663          	bne	a5,a0,c0003760 <swap_init+0x6cc>
c0003358:	00b60823          	sb	a1,16(a2)
c000335c:	00097617          	auipc	a2,0x97
c0003360:	43462603          	lw	a2,1076(a2) # c009a790 <pgfault_num>
c0003364:	40f61e63          	bne	a2,a5,c0003780 <swap_init+0x6ec>
c0003368:	00003637          	lui	a2,0x3
c000336c:	00c00593          	li	a1,12
c0003370:	00b60023          	sb	a1,0(a2) # 3000 <_binary_bin_swap_img_size-0x4d00>
c0003374:	00097797          	auipc	a5,0x97
c0003378:	41c7a783          	lw	a5,1052(a5) # c009a790 <pgfault_num>
c000337c:	00300513          	li	a0,3
c0003380:	42a79063          	bne	a5,a0,c00037a0 <swap_init+0x70c>
c0003384:	00b60823          	sb	a1,16(a2)
c0003388:	00097617          	auipc	a2,0x97
c000338c:	40862603          	lw	a2,1032(a2) # c009a790 <pgfault_num>
c0003390:	42f61863          	bne	a2,a5,c00037c0 <swap_init+0x72c>
c0003394:	00004637          	lui	a2,0x4
c0003398:	00d00593          	li	a1,13
c000339c:	00b60023          	sb	a1,0(a2) # 4000 <_binary_bin_swap_img_size-0x3d00>
c00033a0:	00097797          	auipc	a5,0x97
c00033a4:	3f07a783          	lw	a5,1008(a5) # c009a790 <pgfault_num>
c00033a8:	33679c63          	bne	a5,s6,c00036e0 <swap_init+0x64c>
c00033ac:	00b60823          	sb	a1,16(a2)
c00033b0:	00097617          	auipc	a2,0x97
c00033b4:	3e062603          	lw	a2,992(a2) # c009a790 <pgfault_num>
c00033b8:	34f61463          	bne	a2,a5,c0003700 <swap_init+0x66c>
c00033bc:	00097897          	auipc	a7,0x97
c00033c0:	4e48a883          	lw	a7,1252(a7) # c009a8a0 <free_area+0x8>
c00033c4:	00097797          	auipc	a5,0x97
c00033c8:	44878793          	addi	a5,a5,1096 # c009a80c <swap_in_seq_no>
c00033cc:	00097617          	auipc	a2,0x97
c00033d0:	46860613          	addi	a2,a2,1128 # c009a834 <swap_out_seq_no>
c00033d4:	00097517          	auipc	a0,0x97
c00033d8:	46050513          	addi	a0,a0,1120 # c009a834 <swap_out_seq_no>
c00033dc:	fff00593          	li	a1,-1
c00033e0:	34089063          	bnez	a7,c0003720 <swap_init+0x68c>
c00033e4:	00b7a023          	sw	a1,0(a5)
c00033e8:	00b62023          	sw	a1,0(a2)
c00033ec:	00478793          	addi	a5,a5,4
c00033f0:	00460613          	addi	a2,a2,4
c00033f4:	fef518e3          	bne	a0,a5,c00033e4 <swap_init+0x350>
c00033f8:	00094797          	auipc	a5,0x94
c00033fc:	c4c7a783          	lw	a5,-948(a5) # c0097044 <nbase>
c0003400:	00001bb7          	lui	s7,0x1
c0003404:	00097b17          	auipc	s6,0x97
c0003408:	484b0b13          	addi	s6,s6,1156 # c009a888 <check_ptep>
c000340c:	00097c17          	auipc	s8,0x97
c0003410:	3f0c0c13          	addi	s8,s8,1008 # c009a7fc <check_rp>
c0003414:	00f12223          	sw	a5,4(sp)
c0003418:	00000613          	li	a2,0
c000341c:	000b8593          	mv	a1,s7
c0003420:	00098513          	mv	a0,s3
c0003424:	000b2023          	sw	zero,0(s6)
c0003428:	654010ef          	jal	ra,c0004a7c <get_pte>
c000342c:	00ab2023          	sw	a0,0(s6)
c0003430:	1e050c63          	beqz	a0,c0003628 <swap_init+0x594>
c0003434:	00052783          	lw	a5,0(a0)
c0003438:	0017f613          	andi	a2,a5,1
c000343c:	16060e63          	beqz	a2,c00035b8 <swap_init+0x524>
c0003440:	00279793          	slli	a5,a5,0x2
c0003444:	00c7d793          	srli	a5,a5,0xc
c0003448:	00097617          	auipc	a2,0x97
c000344c:	35c62603          	lw	a2,860(a2) # c009a7a4 <npage>
c0003450:	18c7f063          	bleu	a2,a5,c00035d0 <swap_init+0x53c>
c0003454:	00412703          	lw	a4,4(sp)
c0003458:	000c2583          	lw	a1,0(s8)
c000345c:	00097617          	auipc	a2,0x97
c0003460:	45462603          	lw	a2,1108(a2) # c009a8b0 <pages>
c0003464:	40e787b3          	sub	a5,a5,a4
c0003468:	00579793          	slli	a5,a5,0x5
c000346c:	00f607b3          	add	a5,a2,a5
c0003470:	12f59463          	bne	a1,a5,c0003598 <swap_init+0x504>
c0003474:	000017b7          	lui	a5,0x1
c0003478:	00fb8bb3          	add	s7,s7,a5
c000347c:	000057b7          	lui	a5,0x5
c0003480:	004b0b13          	addi	s6,s6,4
c0003484:	004c0c13          	addi	s8,s8,4
c0003488:	f8fb98e3          	bne	s7,a5,c0003418 <swap_init+0x384>
c000348c:	00012517          	auipc	a0,0x12
c0003490:	a3450513          	addi	a0,a0,-1484 # c0014ec0 <commands+0x1208>
c0003494:	cb5fc0ef          	jal	ra,c0000148 <cprintf>
c0003498:	00097797          	auipc	a5,0x97
c000349c:	3007a783          	lw	a5,768(a5) # c009a798 <sm>
c00034a0:	01c7a783          	lw	a5,28(a5)
c00034a4:	00100b93          	li	s7,1
c00034a8:	000780e7          	jalr	a5
c00034ac:	28051a63          	bnez	a0,c0003740 <swap_init+0x6ac>
c00034b0:	00092503          	lw	a0,0(s2)
c00034b4:	000b8593          	mv	a1,s7
c00034b8:	00490913          	addi	s2,s2,4
c00034bc:	504010ef          	jal	ra,c00049c0 <free_pages>
c00034c0:	fe9918e3          	bne	s2,s1,c00034b0 <swap_init+0x41c>
c00034c4:	0009a783          	lw	a5,0(s3)
c00034c8:	00097617          	auipc	a2,0x97
c00034cc:	2dc62603          	lw	a2,732(a2) # c009a7a4 <npage>
c00034d0:	00279793          	slli	a5,a5,0x2
c00034d4:	00c7d793          	srli	a5,a5,0xc
c00034d8:	0ec7fc63          	bleu	a2,a5,c00035d0 <swap_init+0x53c>
c00034dc:	00412703          	lw	a4,4(sp)
c00034e0:	00097517          	auipc	a0,0x97
c00034e4:	3d052503          	lw	a0,976(a0) # c009a8b0 <pages>
c00034e8:	00100593          	li	a1,1
c00034ec:	40e787b3          	sub	a5,a5,a4
c00034f0:	00579793          	slli	a5,a5,0x5
c00034f4:	00f50533          	add	a0,a0,a5
c00034f8:	4c8010ef          	jal	ra,c00049c0 <free_pages>
c00034fc:	0009a023          	sw	zero,0(s3)
c0003500:	000a2623          	sw	zero,12(s4)
c0003504:	000a0513          	mv	a0,s4
c0003508:	c60fe0ef          	jal	ra,c0001968 <mm_destroy>
c000350c:	00097797          	auipc	a5,0x97
c0003510:	2e478793          	addi	a5,a5,740 # c009a7f0 <check_mm_struct>
c0003514:	0007a023          	sw	zero,0(a5)
c0003518:	00c12783          	lw	a5,12(sp)
c000351c:	01942223          	sw	s9,4(s0)
c0003520:	00f42423          	sw	a5,8(s0)
c0003524:	00812783          	lw	a5,8(sp)
c0003528:	00f42023          	sw	a5,0(s0)
c000352c:	008c8c63          	beq	s9,s0,c0003544 <swap_init+0x4b0>
c0003530:	ffcca783          	lw	a5,-4(s9)
c0003534:	004cac83          	lw	s9,4(s9)
c0003538:	fffd0d13          	addi	s10,s10,-1
c000353c:	40fd8db3          	sub	s11,s11,a5
c0003540:	fe8c98e3          	bne	s9,s0,c0003530 <swap_init+0x49c>
c0003544:	000d8613          	mv	a2,s11
c0003548:	000d0593          	mv	a1,s10
c000354c:	00012517          	auipc	a0,0x12
c0003550:	9a850513          	addi	a0,a0,-1624 # c0014ef4 <commands+0x123c>
c0003554:	bf5fc0ef          	jal	ra,c0000148 <cprintf>
c0003558:	00012517          	auipc	a0,0x12
c000355c:	9b850513          	addi	a0,a0,-1608 # c0014f10 <commands+0x1258>
c0003560:	be9fc0ef          	jal	ra,c0000148 <cprintf>
c0003564:	ba9ff06f          	j	c000310c <swap_init+0x78>
c0003568:	00000d93          	li	s11,0
c000356c:	00000d13          	li	s10,0
c0003570:	00000493          	li	s1,0
c0003574:	c51ff06f          	j	c00031c4 <swap_init+0x130>
c0003578:	00011697          	auipc	a3,0x11
c000357c:	74468693          	addi	a3,a3,1860 # c0014cbc <commands+0x1004>
c0003580:	00011617          	auipc	a2,0x11
c0003584:	89c60613          	addi	a2,a2,-1892 # c0013e1c <commands+0x164>
c0003588:	0a200593          	li	a1,162
c000358c:	00011517          	auipc	a0,0x11
c0003590:	70c50513          	addi	a0,a0,1804 # c0014c98 <commands+0xfe0>
c0003594:	d31fc0ef          	jal	ra,c00002c4 <__panic>
c0003598:	00012697          	auipc	a3,0x12
c000359c:	90068693          	addi	a3,a3,-1792 # c0014e98 <commands+0x11e0>
c00035a0:	00011617          	auipc	a2,0x11
c00035a4:	87c60613          	addi	a2,a2,-1924 # c0013e1c <commands+0x164>
c00035a8:	0e400593          	li	a1,228
c00035ac:	00011517          	auipc	a0,0x11
c00035b0:	6ec50513          	addi	a0,a0,1772 # c0014c98 <commands+0xfe0>
c00035b4:	d11fc0ef          	jal	ra,c00002c4 <__panic>
c00035b8:	00012617          	auipc	a2,0x12
c00035bc:	8bc60613          	addi	a2,a2,-1860 # c0014e74 <commands+0x11bc>
c00035c0:	07400593          	li	a1,116
c00035c4:	00011517          	auipc	a0,0x11
c00035c8:	35050513          	addi	a0,a0,848 # c0014914 <commands+0xc5c>
c00035cc:	cf9fc0ef          	jal	ra,c00002c4 <__panic>
c00035d0:	00011617          	auipc	a2,0x11
c00035d4:	32460613          	addi	a2,a2,804 # c00148f4 <commands+0xc3c>
c00035d8:	06900593          	li	a1,105
c00035dc:	00011517          	auipc	a0,0x11
c00035e0:	33850513          	addi	a0,a0,824 # c0014914 <commands+0xc5c>
c00035e4:	ce1fc0ef          	jal	ra,c00002c4 <__panic>
c00035e8:	00011697          	auipc	a3,0x11
c00035ec:	7c068693          	addi	a3,a3,1984 # c0014da8 <commands+0x10f0>
c00035f0:	00011617          	auipc	a2,0x11
c00035f4:	82c60613          	addi	a2,a2,-2004 # c0013e1c <commands+0x164>
c00035f8:	0c400593          	li	a1,196
c00035fc:	00011517          	auipc	a0,0x11
c0003600:	69c50513          	addi	a0,a0,1692 # c0014c98 <commands+0xfe0>
c0003604:	cc1fc0ef          	jal	ra,c00002c4 <__panic>
c0003608:	00011697          	auipc	a3,0x11
c000360c:	78c68693          	addi	a3,a3,1932 # c0014d94 <commands+0x10dc>
c0003610:	00011617          	auipc	a2,0x11
c0003614:	80c60613          	addi	a2,a2,-2036 # c0013e1c <commands+0x164>
c0003618:	0c300593          	li	a1,195
c000361c:	00011517          	auipc	a0,0x11
c0003620:	67c50513          	addi	a0,a0,1660 # c0014c98 <commands+0xfe0>
c0003624:	ca1fc0ef          	jal	ra,c00002c4 <__panic>
c0003628:	00012697          	auipc	a3,0x12
c000362c:	83468693          	addi	a3,a3,-1996 # c0014e5c <commands+0x11a4>
c0003630:	00010617          	auipc	a2,0x10
c0003634:	7ec60613          	addi	a2,a2,2028 # c0013e1c <commands+0x164>
c0003638:	0e300593          	li	a1,227
c000363c:	00011517          	auipc	a0,0x11
c0003640:	65c50513          	addi	a0,a0,1628 # c0014c98 <commands+0xfe0>
c0003644:	c81fc0ef          	jal	ra,c00002c4 <__panic>
c0003648:	00011697          	auipc	a3,0x11
c000364c:	0f468693          	addi	a3,a3,244 # c001473c <commands+0xa84>
c0003650:	00010617          	auipc	a2,0x10
c0003654:	7cc60613          	addi	a2,a2,1996 # c0013e1c <commands+0x164>
c0003658:	0aa00593          	li	a1,170
c000365c:	00011517          	auipc	a0,0x11
c0003660:	63c50513          	addi	a0,a0,1596 # c0014c98 <commands+0xfe0>
c0003664:	c61fc0ef          	jal	ra,c00002c4 <__panic>
c0003668:	00011697          	auipc	a3,0x11
c000366c:	31868693          	addi	a3,a3,792 # c0014980 <commands+0xcc8>
c0003670:	00010617          	auipc	a2,0x10
c0003674:	7ac60613          	addi	a2,a2,1964 # c0013e1c <commands+0x164>
c0003678:	0b600593          	li	a1,182
c000367c:	00011517          	auipc	a0,0x11
c0003680:	61c50513          	addi	a0,a0,1564 # c0014c98 <commands+0xfe0>
c0003684:	c41fc0ef          	jal	ra,c00002c4 <__panic>
c0003688:	00011697          	auipc	a3,0x11
c000368c:	68868693          	addi	a3,a3,1672 # c0014d10 <commands+0x1058>
c0003690:	00010617          	auipc	a2,0x10
c0003694:	78c60613          	addi	a2,a2,1932 # c0013e1c <commands+0x164>
c0003698:	0ad00593          	li	a1,173
c000369c:	00011517          	auipc	a0,0x11
c00036a0:	5fc50513          	addi	a0,a0,1532 # c0014c98 <commands+0xfe0>
c00036a4:	c21fc0ef          	jal	ra,c00002c4 <__panic>
c00036a8:	00011697          	auipc	a3,0x11
c00036ac:	62468693          	addi	a3,a3,1572 # c0014ccc <commands+0x1014>
c00036b0:	00010617          	auipc	a2,0x10
c00036b4:	76c60613          	addi	a2,a2,1900 # c0013e1c <commands+0x164>
c00036b8:	0a500593          	li	a1,165
c00036bc:	00011517          	auipc	a0,0x11
c00036c0:	5dc50513          	addi	a0,a0,1500 # c0014c98 <commands+0xfe0>
c00036c4:	c01fc0ef          	jal	ra,c00002c4 <__panic>
c00036c8:	00011617          	auipc	a2,0x11
c00036cc:	5b460613          	addi	a2,a2,1460 # c0014c7c <commands+0xfc4>
c00036d0:	02500593          	li	a1,37
c00036d4:	00011517          	auipc	a0,0x11
c00036d8:	5c450513          	addi	a0,a0,1476 # c0014c98 <commands+0xfe0>
c00036dc:	be9fc0ef          	jal	ra,c00002c4 <__panic>
c00036e0:	00011697          	auipc	a3,0x11
c00036e4:	2d468693          	addi	a3,a3,724 # c00149b4 <commands+0xcfc>
c00036e8:	00010617          	auipc	a2,0x10
c00036ec:	73460613          	addi	a2,a2,1844 # c0013e1c <commands+0x164>
c00036f0:	08900593          	li	a1,137
c00036f4:	00011517          	auipc	a0,0x11
c00036f8:	5a450513          	addi	a0,a0,1444 # c0014c98 <commands+0xfe0>
c00036fc:	bc9fc0ef          	jal	ra,c00002c4 <__panic>
c0003700:	00011697          	auipc	a3,0x11
c0003704:	2b468693          	addi	a3,a3,692 # c00149b4 <commands+0xcfc>
c0003708:	00010617          	auipc	a2,0x10
c000370c:	71460613          	addi	a2,a2,1812 # c0013e1c <commands+0x164>
c0003710:	08b00593          	li	a1,139
c0003714:	00011517          	auipc	a0,0x11
c0003718:	58450513          	addi	a0,a0,1412 # c0014c98 <commands+0xfe0>
c000371c:	ba9fc0ef          	jal	ra,c00002c4 <__panic>
c0003720:	00011697          	auipc	a3,0x11
c0003724:	72c68693          	addi	a3,a3,1836 # c0014e4c <commands+0x1194>
c0003728:	00010617          	auipc	a2,0x10
c000372c:	6f460613          	addi	a2,a2,1780 # c0013e1c <commands+0x164>
c0003730:	0da00593          	li	a1,218
c0003734:	00011517          	auipc	a0,0x11
c0003738:	56450513          	addi	a0,a0,1380 # c0014c98 <commands+0xfe0>
c000373c:	b89fc0ef          	jal	ra,c00002c4 <__panic>
c0003740:	00011697          	auipc	a3,0x11
c0003744:	7a868693          	addi	a3,a3,1960 # c0014ee8 <commands+0x1230>
c0003748:	00010617          	auipc	a2,0x10
c000374c:	6d460613          	addi	a2,a2,1748 # c0013e1c <commands+0x164>
c0003750:	0ea00593          	li	a1,234
c0003754:	00011517          	auipc	a0,0x11
c0003758:	54450513          	addi	a0,a0,1348 # c0014c98 <commands+0xfe0>
c000375c:	b69fc0ef          	jal	ra,c00002c4 <__panic>
c0003760:	00011697          	auipc	a3,0x11
c0003764:	6c468693          	addi	a3,a3,1732 # c0014e24 <commands+0x116c>
c0003768:	00010617          	auipc	a2,0x10
c000376c:	6b460613          	addi	a2,a2,1716 # c0013e1c <commands+0x164>
c0003770:	08100593          	li	a1,129
c0003774:	00011517          	auipc	a0,0x11
c0003778:	52450513          	addi	a0,a0,1316 # c0014c98 <commands+0xfe0>
c000377c:	b49fc0ef          	jal	ra,c00002c4 <__panic>
c0003780:	00011697          	auipc	a3,0x11
c0003784:	6a468693          	addi	a3,a3,1700 # c0014e24 <commands+0x116c>
c0003788:	00010617          	auipc	a2,0x10
c000378c:	69460613          	addi	a2,a2,1684 # c0013e1c <commands+0x164>
c0003790:	08300593          	li	a1,131
c0003794:	00011517          	auipc	a0,0x11
c0003798:	50450513          	addi	a0,a0,1284 # c0014c98 <commands+0xfe0>
c000379c:	b29fc0ef          	jal	ra,c00002c4 <__panic>
c00037a0:	00011697          	auipc	a3,0x11
c00037a4:	69868693          	addi	a3,a3,1688 # c0014e38 <commands+0x1180>
c00037a8:	00010617          	auipc	a2,0x10
c00037ac:	67460613          	addi	a2,a2,1652 # c0013e1c <commands+0x164>
c00037b0:	08500593          	li	a1,133
c00037b4:	00011517          	auipc	a0,0x11
c00037b8:	4e450513          	addi	a0,a0,1252 # c0014c98 <commands+0xfe0>
c00037bc:	b09fc0ef          	jal	ra,c00002c4 <__panic>
c00037c0:	00011697          	auipc	a3,0x11
c00037c4:	67868693          	addi	a3,a3,1656 # c0014e38 <commands+0x1180>
c00037c8:	00010617          	auipc	a2,0x10
c00037cc:	65460613          	addi	a2,a2,1620 # c0013e1c <commands+0x164>
c00037d0:	08700593          	li	a1,135
c00037d4:	00011517          	auipc	a0,0x11
c00037d8:	4c450513          	addi	a0,a0,1220 # c0014c98 <commands+0xfe0>
c00037dc:	ae9fc0ef          	jal	ra,c00002c4 <__panic>
c00037e0:	00011697          	auipc	a3,0x11
c00037e4:	63068693          	addi	a3,a3,1584 # c0014e10 <commands+0x1158>
c00037e8:	00010617          	auipc	a2,0x10
c00037ec:	63460613          	addi	a2,a2,1588 # c0013e1c <commands+0x164>
c00037f0:	07d00593          	li	a1,125
c00037f4:	00011517          	auipc	a0,0x11
c00037f8:	4a450513          	addi	a0,a0,1188 # c0014c98 <commands+0xfe0>
c00037fc:	ac9fc0ef          	jal	ra,c00002c4 <__panic>
c0003800:	00011697          	auipc	a3,0x11
c0003804:	61068693          	addi	a3,a3,1552 # c0014e10 <commands+0x1158>
c0003808:	00010617          	auipc	a2,0x10
c000380c:	61460613          	addi	a2,a2,1556 # c0013e1c <commands+0x164>
c0003810:	07f00593          	li	a1,127
c0003814:	00011517          	auipc	a0,0x11
c0003818:	48450513          	addi	a0,a0,1156 # c0014c98 <commands+0xfe0>
c000381c:	aa9fc0ef          	jal	ra,c00002c4 <__panic>
c0003820:	00011697          	auipc	a3,0x11
c0003824:	5a468693          	addi	a3,a3,1444 # c0014dc4 <commands+0x110c>
c0003828:	00010617          	auipc	a2,0x10
c000382c:	5f460613          	addi	a2,a2,1524 # c0013e1c <commands+0x164>
c0003830:	0d100593          	li	a1,209
c0003834:	00011517          	auipc	a0,0x11
c0003838:	46450513          	addi	a0,a0,1124 # c0014c98 <commands+0xfe0>
c000383c:	a89fc0ef          	jal	ra,c00002c4 <__panic>
c0003840:	00011697          	auipc	a3,0x11
c0003844:	51c68693          	addi	a3,a3,1308 # c0014d5c <commands+0x10a4>
c0003848:	00010617          	auipc	a2,0x10
c000384c:	5d460613          	addi	a2,a2,1492 # c0013e1c <commands+0x164>
c0003850:	0be00593          	li	a1,190
c0003854:	00011517          	auipc	a0,0x11
c0003858:	44450513          	addi	a0,a0,1092 # c0014c98 <commands+0xfe0>
c000385c:	a69fc0ef          	jal	ra,c00002c4 <__panic>
c0003860:	00011697          	auipc	a3,0x11
c0003864:	05c68693          	addi	a3,a3,92 # c00148bc <commands+0xc04>
c0003868:	00010617          	auipc	a2,0x10
c000386c:	5b460613          	addi	a2,a2,1460 # c0013e1c <commands+0x164>
c0003870:	0b200593          	li	a1,178
c0003874:	00011517          	auipc	a0,0x11
c0003878:	42450513          	addi	a0,a0,1060 # c0014c98 <commands+0xfe0>
c000387c:	a49fc0ef          	jal	ra,c00002c4 <__panic>

c0003880 <swap_init_mm>:
c0003880:	00097797          	auipc	a5,0x97
c0003884:	f187a783          	lw	a5,-232(a5) # c009a798 <sm>
c0003888:	0087a303          	lw	t1,8(a5)
c000388c:	00030067          	jr	t1

c0003890 <swap_map_swappable>:
c0003890:	00097797          	auipc	a5,0x97
c0003894:	f087a783          	lw	a5,-248(a5) # c009a798 <sm>
c0003898:	0107a303          	lw	t1,16(a5)
c000389c:	00030067          	jr	t1

c00038a0 <swap_out>:
c00038a0:	fc010113          	addi	sp,sp,-64
c00038a4:	03312623          	sw	s3,44(sp)
c00038a8:	02112e23          	sw	ra,60(sp)
c00038ac:	02812c23          	sw	s0,56(sp)
c00038b0:	02912a23          	sw	s1,52(sp)
c00038b4:	03212823          	sw	s2,48(sp)
c00038b8:	03412423          	sw	s4,40(sp)
c00038bc:	03512223          	sw	s5,36(sp)
c00038c0:	03612023          	sw	s6,32(sp)
c00038c4:	01712e23          	sw	s7,28(sp)
c00038c8:	01812c23          	sw	s8,24(sp)
c00038cc:	00058993          	mv	s3,a1
c00038d0:	10058863          	beqz	a1,c00039e0 <swap_out+0x140>
c00038d4:	00050913          	mv	s2,a0
c00038d8:	00060a13          	mv	s4,a2
c00038dc:	00000413          	li	s0,0
c00038e0:	00011b97          	auipc	s7,0x11
c00038e4:	6acb8b93          	addi	s7,s7,1708 # c0014f8c <commands+0x12d4>
c00038e8:	00100b13          	li	s6,1
c00038ec:	00011a97          	auipc	s5,0x11
c00038f0:	688a8a93          	addi	s5,s5,1672 # c0014f74 <commands+0x12bc>
c00038f4:	0340006f          	j	c0003928 <swap_out+0x88>
c00038f8:	000a8513          	mv	a0,s5
c00038fc:	84dfc0ef          	jal	ra,c0000148 <cprintf>
c0003900:	00097797          	auipc	a5,0x97
c0003904:	e987a783          	lw	a5,-360(a5) # c009a798 <sm>
c0003908:	0107a783          	lw	a5,16(a5)
c000390c:	00c12603          	lw	a2,12(sp)
c0003910:	00000693          	li	a3,0
c0003914:	00048593          	mv	a1,s1
c0003918:	00090513          	mv	a0,s2
c000391c:	00140413          	addi	s0,s0,1
c0003920:	000780e7          	jalr	a5
c0003924:	0a898e63          	beq	s3,s0,c00039e0 <swap_out+0x140>
c0003928:	00097797          	auipc	a5,0x97
c000392c:	e707a783          	lw	a5,-400(a5) # c009a798 <sm>
c0003930:	0187a783          	lw	a5,24(a5)
c0003934:	000a0613          	mv	a2,s4
c0003938:	00c10593          	addi	a1,sp,12
c000393c:	00090513          	mv	a0,s2
c0003940:	000780e7          	jalr	a5
c0003944:	0c051863          	bnez	a0,c0003a14 <swap_out+0x174>
c0003948:	00c12783          	lw	a5,12(sp)
c000394c:	00c92503          	lw	a0,12(s2)
c0003950:	00000613          	li	a2,0
c0003954:	01c7a483          	lw	s1,28(a5)
c0003958:	00048593          	mv	a1,s1
c000395c:	120010ef          	jal	ra,c0004a7c <get_pte>
c0003960:	00052783          	lw	a5,0(a0)
c0003964:	00050c13          	mv	s8,a0
c0003968:	0017f793          	andi	a5,a5,1
c000396c:	0c078063          	beqz	a5,c0003a2c <swap_out+0x18c>
c0003970:	00c12583          	lw	a1,12(sp)
c0003974:	01c5a503          	lw	a0,28(a1) # 101c <_binary_bin_swap_img_size-0x6ce4>
c0003978:	00c55513          	srli	a0,a0,0xc
c000397c:	00150513          	addi	a0,a0,1
c0003980:	00851513          	slli	a0,a0,0x8
c0003984:	4f90a0ef          	jal	ra,c000e67c <swapfs_write>
c0003988:	f60518e3          	bnez	a0,c00038f8 <swap_out+0x58>
c000398c:	00c12783          	lw	a5,12(sp)
c0003990:	00048613          	mv	a2,s1
c0003994:	00040593          	mv	a1,s0
c0003998:	01c7a683          	lw	a3,28(a5)
c000399c:	000b8513          	mv	a0,s7
c00039a0:	00140413          	addi	s0,s0,1
c00039a4:	00c6d693          	srli	a3,a3,0xc
c00039a8:	00168693          	addi	a3,a3,1
c00039ac:	f9cfc0ef          	jal	ra,c0000148 <cprintf>
c00039b0:	00c12503          	lw	a0,12(sp)
c00039b4:	000b0593          	mv	a1,s6
c00039b8:	01c52783          	lw	a5,28(a0)
c00039bc:	00c7d793          	srli	a5,a5,0xc
c00039c0:	00178793          	addi	a5,a5,1
c00039c4:	00879793          	slli	a5,a5,0x8
c00039c8:	00fc2023          	sw	a5,0(s8)
c00039cc:	7f5000ef          	jal	ra,c00049c0 <free_pages>
c00039d0:	00c92503          	lw	a0,12(s2)
c00039d4:	00048593          	mv	a1,s1
c00039d8:	2c1010ef          	jal	ra,c0005498 <tlb_invalidate>
c00039dc:	f48996e3          	bne	s3,s0,c0003928 <swap_out+0x88>
c00039e0:	03c12083          	lw	ra,60(sp)
c00039e4:	00098513          	mv	a0,s3
c00039e8:	03812403          	lw	s0,56(sp)
c00039ec:	03412483          	lw	s1,52(sp)
c00039f0:	03012903          	lw	s2,48(sp)
c00039f4:	02c12983          	lw	s3,44(sp)
c00039f8:	02812a03          	lw	s4,40(sp)
c00039fc:	02412a83          	lw	s5,36(sp)
c0003a00:	02012b03          	lw	s6,32(sp)
c0003a04:	01c12b83          	lw	s7,28(sp)
c0003a08:	01812c03          	lw	s8,24(sp)
c0003a0c:	04010113          	addi	sp,sp,64
c0003a10:	00008067          	ret
c0003a14:	00040593          	mv	a1,s0
c0003a18:	00011517          	auipc	a0,0x11
c0003a1c:	51450513          	addi	a0,a0,1300 # c0014f2c <commands+0x1274>
c0003a20:	f28fc0ef          	jal	ra,c0000148 <cprintf>
c0003a24:	00040993          	mv	s3,s0
c0003a28:	fb9ff06f          	j	c00039e0 <swap_out+0x140>
c0003a2c:	00011697          	auipc	a3,0x11
c0003a30:	53068693          	addi	a3,a3,1328 # c0014f5c <commands+0x12a4>
c0003a34:	00010617          	auipc	a2,0x10
c0003a38:	3e860613          	addi	a2,a2,1000 # c0013e1c <commands+0x164>
c0003a3c:	05500593          	li	a1,85
c0003a40:	00011517          	auipc	a0,0x11
c0003a44:	25850513          	addi	a0,a0,600 # c0014c98 <commands+0xfe0>
c0003a48:	87dfc0ef          	jal	ra,c00002c4 <__panic>

c0003a4c <swap_in>:
c0003a4c:	fe010113          	addi	sp,sp,-32
c0003a50:	01212823          	sw	s2,16(sp)
c0003a54:	00050913          	mv	s2,a0
c0003a58:	00100513          	li	a0,1
c0003a5c:	00912a23          	sw	s1,20(sp)
c0003a60:	01312623          	sw	s3,12(sp)
c0003a64:	00112e23          	sw	ra,28(sp)
c0003a68:	00812c23          	sw	s0,24(sp)
c0003a6c:	00058493          	mv	s1,a1
c0003a70:	00060993          	mv	s3,a2
c0003a74:	699000ef          	jal	ra,c000490c <alloc_pages>
c0003a78:	06050263          	beqz	a0,c0003adc <swap_in+0x90>
c0003a7c:	00050413          	mv	s0,a0
c0003a80:	00c92503          	lw	a0,12(s2)
c0003a84:	00000613          	li	a2,0
c0003a88:	00048593          	mv	a1,s1
c0003a8c:	7f1000ef          	jal	ra,c0004a7c <get_pte>
c0003a90:	00050913          	mv	s2,a0
c0003a94:	00052503          	lw	a0,0(a0)
c0003a98:	00040593          	mv	a1,s0
c0003a9c:	3310a0ef          	jal	ra,c000e5cc <swapfs_read>
c0003aa0:	00092583          	lw	a1,0(s2)
c0003aa4:	00048613          	mv	a2,s1
c0003aa8:	00011517          	auipc	a0,0x11
c0003aac:	19450513          	addi	a0,a0,404 # c0014c3c <commands+0xf84>
c0003ab0:	0085d593          	srli	a1,a1,0x8
c0003ab4:	e94fc0ef          	jal	ra,c0000148 <cprintf>
c0003ab8:	01c12083          	lw	ra,28(sp)
c0003abc:	0089a023          	sw	s0,0(s3)
c0003ac0:	00000513          	li	a0,0
c0003ac4:	01812403          	lw	s0,24(sp)
c0003ac8:	01412483          	lw	s1,20(sp)
c0003acc:	01012903          	lw	s2,16(sp)
c0003ad0:	00c12983          	lw	s3,12(sp)
c0003ad4:	02010113          	addi	sp,sp,32
c0003ad8:	00008067          	ret
c0003adc:	00011697          	auipc	a3,0x11
c0003ae0:	15068693          	addi	a3,a3,336 # c0014c2c <commands+0xf74>
c0003ae4:	00010617          	auipc	a2,0x10
c0003ae8:	33860613          	addi	a2,a2,824 # c0013e1c <commands+0x164>
c0003aec:	06b00593          	li	a1,107
c0003af0:	00011517          	auipc	a0,0x11
c0003af4:	1a850513          	addi	a0,a0,424 # c0014c98 <commands+0xfe0>
c0003af8:	fccfc0ef          	jal	ra,c00002c4 <__panic>

c0003afc <default_init>:
c0003afc:	00097797          	auipc	a5,0x97
c0003b00:	d9c78793          	addi	a5,a5,-612 # c009a898 <free_area>
c0003b04:	00f7a223          	sw	a5,4(a5)
c0003b08:	00f7a023          	sw	a5,0(a5)
c0003b0c:	0007a423          	sw	zero,8(a5)
c0003b10:	00008067          	ret

c0003b14 <default_nr_free_pages>:
c0003b14:	00097517          	auipc	a0,0x97
c0003b18:	d8c52503          	lw	a0,-628(a0) # c009a8a0 <free_area+0x8>
c0003b1c:	00008067          	ret

c0003b20 <default_free_pages>:
c0003b20:	ff010113          	addi	sp,sp,-16
c0003b24:	00112623          	sw	ra,12(sp)
c0003b28:	1e058e63          	beqz	a1,c0003d24 <default_free_pages+0x204>
c0003b2c:	00559693          	slli	a3,a1,0x5
c0003b30:	00d506b3          	add	a3,a0,a3
c0003b34:	04d50863          	beq	a0,a3,c0003b84 <default_free_pages+0x64>
c0003b38:	00452783          	lw	a5,4(a0)
c0003b3c:	0017f793          	andi	a5,a5,1
c0003b40:	1c079263          	bnez	a5,c0003d04 <default_free_pages+0x1e4>
c0003b44:	00452783          	lw	a5,4(a0)
c0003b48:	0017d793          	srli	a5,a5,0x1
c0003b4c:	0017f793          	andi	a5,a5,1
c0003b50:	1a079a63          	bnez	a5,c0003d04 <default_free_pages+0x1e4>
c0003b54:	00050793          	mv	a5,a0
c0003b58:	01c0006f          	j	c0003b74 <default_free_pages+0x54>
c0003b5c:	0047a703          	lw	a4,4(a5)
c0003b60:	00177713          	andi	a4,a4,1
c0003b64:	1a071063          	bnez	a4,c0003d04 <default_free_pages+0x1e4>
c0003b68:	0047a703          	lw	a4,4(a5)
c0003b6c:	00277713          	andi	a4,a4,2
c0003b70:	18071a63          	bnez	a4,c0003d04 <default_free_pages+0x1e4>
c0003b74:	0007a223          	sw	zero,4(a5)
c0003b78:	0007a023          	sw	zero,0(a5)
c0003b7c:	02078793          	addi	a5,a5,32
c0003b80:	fcd79ee3          	bne	a5,a3,c0003b5c <default_free_pages+0x3c>
c0003b84:	00b52423          	sw	a1,8(a0)
c0003b88:	00450313          	addi	t1,a0,4
c0003b8c:	00200793          	li	a5,2
c0003b90:	40f3202f          	amoor.w	zero,a5,(t1)
c0003b94:	00097797          	auipc	a5,0x97
c0003b98:	d0c7a783          	lw	a5,-756(a5) # c009a8a0 <free_area+0x8>
c0003b9c:	00b785b3          	add	a1,a5,a1
c0003ba0:	00097697          	auipc	a3,0x97
c0003ba4:	cf868693          	addi	a3,a3,-776 # c009a898 <free_area>
c0003ba8:	00b6a423          	sw	a1,8(a3)
c0003bac:	00097797          	auipc	a5,0x97
c0003bb0:	cf07a783          	lw	a5,-784(a5) # c009a89c <free_area+0x4>
c0003bb4:	12d78863          	beq	a5,a3,c0003ce4 <default_free_pages+0x1c4>
c0003bb8:	00097597          	auipc	a1,0x97
c0003bbc:	ce05a583          	lw	a1,-800(a1) # c009a898 <free_area>
c0003bc0:	00000813          	li	a6,0
c0003bc4:	00c50613          	addi	a2,a0,12
c0003bc8:	00100893          	li	a7,1
c0003bcc:	0080006f          	j	c0003bd4 <default_free_pages+0xb4>
c0003bd0:	00070793          	mv	a5,a4
c0003bd4:	ff478713          	addi	a4,a5,-12
c0003bd8:	02e56863          	bltu	a0,a4,c0003c08 <default_free_pages+0xe8>
c0003bdc:	0047a703          	lw	a4,4(a5)
c0003be0:	fed718e3          	bne	a4,a3,c0003bd0 <default_free_pages+0xb0>
c0003be4:	00c7a223          	sw	a2,4(a5)
c0003be8:	00d52823          	sw	a3,16(a0)
c0003bec:	00f52623          	sw	a5,12(a0)
c0003bf0:	0047a783          	lw	a5,4(a5)
c0003bf4:	00060593          	mv	a1,a2
c0003bf8:	06d78863          	beq	a5,a3,c0003c68 <default_free_pages+0x148>
c0003bfc:	ff478713          	addi	a4,a5,-12
c0003c00:	00088813          	mv	a6,a7
c0003c04:	fce57ce3          	bleu	a4,a0,c0003bdc <default_free_pages+0xbc>
c0003c08:	12081e63          	bnez	a6,c0003d44 <default_free_pages+0x224>
c0003c0c:	0007a583          	lw	a1,0(a5)
c0003c10:	00c7a023          	sw	a2,0(a5)
c0003c14:	00c5a223          	sw	a2,4(a1)
c0003c18:	00f52823          	sw	a5,16(a0)
c0003c1c:	00b52623          	sw	a1,12(a0)
c0003c20:	06d58a63          	beq	a1,a3,c0003c94 <default_free_pages+0x174>
c0003c24:	ffc5a603          	lw	a2,-4(a1)
c0003c28:	ff458713          	addi	a4,a1,-12
c0003c2c:	00561793          	slli	a5,a2,0x5
c0003c30:	00f707b3          	add	a5,a4,a5
c0003c34:	04f51a63          	bne	a0,a5,c0003c88 <default_free_pages+0x168>
c0003c38:	00852783          	lw	a5,8(a0)
c0003c3c:	00c78633          	add	a2,a5,a2
c0003c40:	fec5ae23          	sw	a2,-4(a1)
c0003c44:	ffd00793          	li	a5,-3
c0003c48:	60f3202f          	amoand.w	zero,a5,(t1)
c0003c4c:	00c52803          	lw	a6,12(a0)
c0003c50:	01052603          	lw	a2,16(a0)
c0003c54:	00070513          	mv	a0,a4
c0003c58:	00c82223          	sw	a2,4(a6) # fffff004 <sbi_remote_fence_i+0xfffff714>
c0003c5c:	0045a783          	lw	a5,4(a1)
c0003c60:	01062023          	sw	a6,0(a2)
c0003c64:	0280006f          	j	c0003c8c <default_free_pages+0x16c>
c0003c68:	00c52583          	lw	a1,12(a0)
c0003c6c:	00c7a023          	sw	a2,0(a5)
c0003c70:	00f58e63          	beq	a1,a5,c0003c8c <default_free_pages+0x16c>
c0003c74:	ffc5a603          	lw	a2,-4(a1)
c0003c78:	ff458713          	addi	a4,a1,-12
c0003c7c:	00561793          	slli	a5,a2,0x5
c0003c80:	00f707b3          	add	a5,a4,a5
c0003c84:	faf50ae3          	beq	a0,a5,c0003c38 <default_free_pages+0x118>
c0003c88:	01052783          	lw	a5,16(a0)
c0003c8c:	ff478713          	addi	a4,a5,-12
c0003c90:	00d78a63          	beq	a5,a3,c0003ca4 <default_free_pages+0x184>
c0003c94:	00852603          	lw	a2,8(a0)
c0003c98:	00561693          	slli	a3,a2,0x5
c0003c9c:	00d506b3          	add	a3,a0,a3
c0003ca0:	00d70863          	beq	a4,a3,c0003cb0 <default_free_pages+0x190>
c0003ca4:	00c12083          	lw	ra,12(sp)
c0003ca8:	01010113          	addi	sp,sp,16
c0003cac:	00008067          	ret
c0003cb0:	ffc7a703          	lw	a4,-4(a5)
c0003cb4:	ff878693          	addi	a3,a5,-8
c0003cb8:	00c70633          	add	a2,a4,a2
c0003cbc:	00c52423          	sw	a2,8(a0)
c0003cc0:	ffd00713          	li	a4,-3
c0003cc4:	60e6a02f          	amoand.w	zero,a4,(a3)
c0003cc8:	0007a703          	lw	a4,0(a5)
c0003ccc:	0047a783          	lw	a5,4(a5)
c0003cd0:	00c12083          	lw	ra,12(sp)
c0003cd4:	01010113          	addi	sp,sp,16
c0003cd8:	00f72223          	sw	a5,4(a4)
c0003cdc:	00e7a023          	sw	a4,0(a5)
c0003ce0:	00008067          	ret
c0003ce4:	00c12083          	lw	ra,12(sp)
c0003ce8:	00c50713          	addi	a4,a0,12
c0003cec:	00e7a023          	sw	a4,0(a5)
c0003cf0:	00e7a223          	sw	a4,4(a5)
c0003cf4:	00f52823          	sw	a5,16(a0)
c0003cf8:	00f52623          	sw	a5,12(a0)
c0003cfc:	01010113          	addi	sp,sp,16
c0003d00:	00008067          	ret
c0003d04:	00011697          	auipc	a3,0x11
c0003d08:	59468693          	addi	a3,a3,1428 # c0015298 <commands+0x15e0>
c0003d0c:	00010617          	auipc	a2,0x10
c0003d10:	11060613          	addi	a2,a2,272 # c0013e1c <commands+0x164>
c0003d14:	08300593          	li	a1,131
c0003d18:	00011517          	auipc	a0,0x11
c0003d1c:	5a850513          	addi	a0,a0,1448 # c00152c0 <commands+0x1608>
c0003d20:	da4fc0ef          	jal	ra,c00002c4 <__panic>
c0003d24:	00011697          	auipc	a3,0x11
c0003d28:	5b468693          	addi	a3,a3,1460 # c00152d8 <commands+0x1620>
c0003d2c:	00010617          	auipc	a2,0x10
c0003d30:	0f060613          	addi	a2,a2,240 # c0013e1c <commands+0x164>
c0003d34:	08000593          	li	a1,128
c0003d38:	00011517          	auipc	a0,0x11
c0003d3c:	58850513          	addi	a0,a0,1416 # c00152c0 <commands+0x1608>
c0003d40:	d84fc0ef          	jal	ra,c00002c4 <__panic>
c0003d44:	00b6a023          	sw	a1,0(a3)
c0003d48:	ec5ff06f          	j	c0003c0c <default_free_pages+0xec>

c0003d4c <default_init_memmap>:
c0003d4c:	ff010113          	addi	sp,sp,-16
c0003d50:	00112623          	sw	ra,12(sp)
c0003d54:	12058e63          	beqz	a1,c0003e90 <default_init_memmap+0x144>
c0003d58:	00559693          	slli	a3,a1,0x5
c0003d5c:	00d506b3          	add	a3,a0,a3
c0003d60:	02d50c63          	beq	a0,a3,c0003d98 <default_init_memmap+0x4c>
c0003d64:	00452703          	lw	a4,4(a0)
c0003d68:	00050793          	mv	a5,a0
c0003d6c:	00177713          	andi	a4,a4,1
c0003d70:	00071a63          	bnez	a4,c0003d84 <default_init_memmap+0x38>
c0003d74:	0fc0006f          	j	c0003e70 <default_init_memmap+0x124>
c0003d78:	0047a703          	lw	a4,4(a5)
c0003d7c:	00177713          	andi	a4,a4,1
c0003d80:	0e070863          	beqz	a4,c0003e70 <default_init_memmap+0x124>
c0003d84:	0007a423          	sw	zero,8(a5)
c0003d88:	0007a223          	sw	zero,4(a5)
c0003d8c:	0007a023          	sw	zero,0(a5)
c0003d90:	02078793          	addi	a5,a5,32
c0003d94:	fed792e3          	bne	a5,a3,c0003d78 <default_init_memmap+0x2c>
c0003d98:	00b52423          	sw	a1,8(a0)
c0003d9c:	00200793          	li	a5,2
c0003da0:	00450713          	addi	a4,a0,4
c0003da4:	40f7202f          	amoor.w	zero,a5,(a4)
c0003da8:	00097797          	auipc	a5,0x97
c0003dac:	af87a783          	lw	a5,-1288(a5) # c009a8a0 <free_area+0x8>
c0003db0:	00b785b3          	add	a1,a5,a1
c0003db4:	00097697          	auipc	a3,0x97
c0003db8:	ae468693          	addi	a3,a3,-1308 # c009a898 <free_area>
c0003dbc:	00b6a423          	sw	a1,8(a3)
c0003dc0:	00097797          	auipc	a5,0x97
c0003dc4:	adc7a783          	lw	a5,-1316(a5) # c009a89c <free_area+0x4>
c0003dc8:	08d78463          	beq	a5,a3,c0003e50 <default_init_memmap+0x104>
c0003dcc:	00097597          	auipc	a1,0x97
c0003dd0:	acc5a583          	lw	a1,-1332(a1) # c009a898 <free_area>
c0003dd4:	00000813          	li	a6,0
c0003dd8:	00c50613          	addi	a2,a0,12
c0003ddc:	00100893          	li	a7,1
c0003de0:	0080006f          	j	c0003de8 <default_init_memmap+0x9c>
c0003de4:	00070793          	mv	a5,a4
c0003de8:	ff478713          	addi	a4,a5,-12
c0003dec:	02e56863          	bltu	a0,a4,c0003e1c <default_init_memmap+0xd0>
c0003df0:	0047a703          	lw	a4,4(a5)
c0003df4:	fed718e3          	bne	a4,a3,c0003de4 <default_init_memmap+0x98>
c0003df8:	00c7a223          	sw	a2,4(a5)
c0003dfc:	00d52823          	sw	a3,16(a0)
c0003e00:	00f52623          	sw	a5,12(a0)
c0003e04:	0047a783          	lw	a5,4(a5)
c0003e08:	00060593          	mv	a1,a2
c0003e0c:	02d78a63          	beq	a5,a3,c0003e40 <default_init_memmap+0xf4>
c0003e10:	ff478713          	addi	a4,a5,-12
c0003e14:	00088813          	mv	a6,a7
c0003e18:	fce57ce3          	bleu	a4,a0,c0003df0 <default_init_memmap+0xa4>
c0003e1c:	08081a63          	bnez	a6,c0003eb0 <default_init_memmap+0x164>
c0003e20:	0007a703          	lw	a4,0(a5)
c0003e24:	00c12083          	lw	ra,12(sp)
c0003e28:	00c7a023          	sw	a2,0(a5)
c0003e2c:	00c72223          	sw	a2,4(a4)
c0003e30:	00f52823          	sw	a5,16(a0)
c0003e34:	00e52623          	sw	a4,12(a0)
c0003e38:	01010113          	addi	sp,sp,16
c0003e3c:	00008067          	ret
c0003e40:	00c12083          	lw	ra,12(sp)
c0003e44:	00c7a023          	sw	a2,0(a5)
c0003e48:	01010113          	addi	sp,sp,16
c0003e4c:	00008067          	ret
c0003e50:	00c12083          	lw	ra,12(sp)
c0003e54:	00c50713          	addi	a4,a0,12
c0003e58:	00e7a023          	sw	a4,0(a5)
c0003e5c:	00e7a223          	sw	a4,4(a5)
c0003e60:	00f52823          	sw	a5,16(a0)
c0003e64:	00f52623          	sw	a5,12(a0)
c0003e68:	01010113          	addi	sp,sp,16
c0003e6c:	00008067          	ret
c0003e70:	00011697          	auipc	a3,0x11
c0003e74:	47068693          	addi	a3,a3,1136 # c00152e0 <commands+0x1628>
c0003e78:	00010617          	auipc	a2,0x10
c0003e7c:	fa460613          	addi	a2,a2,-92 # c0013e1c <commands+0x164>
c0003e80:	04900593          	li	a1,73
c0003e84:	00011517          	auipc	a0,0x11
c0003e88:	43c50513          	addi	a0,a0,1084 # c00152c0 <commands+0x1608>
c0003e8c:	c38fc0ef          	jal	ra,c00002c4 <__panic>
c0003e90:	00011697          	auipc	a3,0x11
c0003e94:	44868693          	addi	a3,a3,1096 # c00152d8 <commands+0x1620>
c0003e98:	00010617          	auipc	a2,0x10
c0003e9c:	f8460613          	addi	a2,a2,-124 # c0013e1c <commands+0x164>
c0003ea0:	04600593          	li	a1,70
c0003ea4:	00011517          	auipc	a0,0x11
c0003ea8:	41c50513          	addi	a0,a0,1052 # c00152c0 <commands+0x1608>
c0003eac:	c18fc0ef          	jal	ra,c00002c4 <__panic>
c0003eb0:	00b6a023          	sw	a1,0(a3)
c0003eb4:	f6dff06f          	j	c0003e20 <default_init_memmap+0xd4>

c0003eb8 <default_check>:
c0003eb8:	fd010113          	addi	sp,sp,-48
c0003ebc:	03212023          	sw	s2,32(sp)
c0003ec0:	02112623          	sw	ra,44(sp)
c0003ec4:	02812423          	sw	s0,40(sp)
c0003ec8:	02912223          	sw	s1,36(sp)
c0003ecc:	01312e23          	sw	s3,28(sp)
c0003ed0:	01412c23          	sw	s4,24(sp)
c0003ed4:	01512a23          	sw	s5,20(sp)
c0003ed8:	01612823          	sw	s6,16(sp)
c0003edc:	01712623          	sw	s7,12(sp)
c0003ee0:	01812423          	sw	s8,8(sp)
c0003ee4:	01912223          	sw	s9,4(sp)
c0003ee8:	00097917          	auipc	s2,0x97
c0003eec:	9b090913          	addi	s2,s2,-1616 # c009a898 <free_area>
c0003ef0:	00097797          	auipc	a5,0x97
c0003ef4:	9ac7a783          	lw	a5,-1620(a5) # c009a89c <free_area+0x4>
c0003ef8:	3d278663          	beq	a5,s2,c00042c4 <default_check+0x40c>
c0003efc:	ff87a703          	lw	a4,-8(a5)
c0003f00:	00175713          	srli	a4,a4,0x1
c0003f04:	00177713          	andi	a4,a4,1
c0003f08:	3c070663          	beqz	a4,c00042d4 <default_check+0x41c>
c0003f0c:	00000413          	li	s0,0
c0003f10:	00000493          	li	s1,0
c0003f14:	0100006f          	j	c0003f24 <default_check+0x6c>
c0003f18:	ff87a703          	lw	a4,-8(a5)
c0003f1c:	00277713          	andi	a4,a4,2
c0003f20:	3a070a63          	beqz	a4,c00042d4 <default_check+0x41c>
c0003f24:	ffc7a703          	lw	a4,-4(a5)
c0003f28:	0047a783          	lw	a5,4(a5)
c0003f2c:	00148493          	addi	s1,s1,1
c0003f30:	00e40433          	add	s0,s0,a4
c0003f34:	00040993          	mv	s3,s0
c0003f38:	ff2790e3          	bne	a5,s2,c0003f18 <default_check+0x60>
c0003f3c:	2e9000ef          	jal	ra,c0004a24 <nr_free_pages>
c0003f40:	7ca99a63          	bne	s3,a0,c0004714 <default_check+0x85c>
c0003f44:	00100513          	li	a0,1
c0003f48:	1c5000ef          	jal	ra,c000490c <alloc_pages>
c0003f4c:	00050a13          	mv	s4,a0
c0003f50:	000502e3          	beqz	a0,c0004754 <default_check+0x89c>
c0003f54:	00100513          	li	a0,1
c0003f58:	1b5000ef          	jal	ra,c000490c <alloc_pages>
c0003f5c:	00050993          	mv	s3,a0
c0003f60:	7c050a63          	beqz	a0,c0004734 <default_check+0x87c>
c0003f64:	00100513          	li	a0,1
c0003f68:	1a5000ef          	jal	ra,c000490c <alloc_pages>
c0003f6c:	00050a93          	mv	s5,a0
c0003f70:	56050263          	beqz	a0,c00044d4 <default_check+0x61c>
c0003f74:	3b3a0063          	beq	s4,s3,c0004314 <default_check+0x45c>
c0003f78:	38aa0e63          	beq	s4,a0,c0004314 <default_check+0x45c>
c0003f7c:	38a98c63          	beq	s3,a0,c0004314 <default_check+0x45c>
c0003f80:	000a2783          	lw	a5,0(s4)
c0003f84:	36079863          	bnez	a5,c00042f4 <default_check+0x43c>
c0003f88:	0009a783          	lw	a5,0(s3)
c0003f8c:	36079463          	bnez	a5,c00042f4 <default_check+0x43c>
c0003f90:	00052783          	lw	a5,0(a0)
c0003f94:	36079063          	bnez	a5,c00042f4 <default_check+0x43c>
c0003f98:	00097797          	auipc	a5,0x97
c0003f9c:	9187a783          	lw	a5,-1768(a5) # c009a8b0 <pages>
c0003fa0:	40fa0733          	sub	a4,s4,a5
c0003fa4:	00093617          	auipc	a2,0x93
c0003fa8:	0a062603          	lw	a2,160(a2) # c0097044 <nbase>
c0003fac:	40575713          	srai	a4,a4,0x5
c0003fb0:	00c70733          	add	a4,a4,a2
c0003fb4:	00096697          	auipc	a3,0x96
c0003fb8:	7f06a683          	lw	a3,2032(a3) # c009a7a4 <npage>
c0003fbc:	00c69693          	slli	a3,a3,0xc
c0003fc0:	00c71713          	slli	a4,a4,0xc
c0003fc4:	48d77863          	bleu	a3,a4,c0004454 <default_check+0x59c>
c0003fc8:	40f98733          	sub	a4,s3,a5
c0003fcc:	40575713          	srai	a4,a4,0x5
c0003fd0:	00c70733          	add	a4,a4,a2
c0003fd4:	00c71713          	slli	a4,a4,0xc
c0003fd8:	3ed77e63          	bleu	a3,a4,c00043d4 <default_check+0x51c>
c0003fdc:	40f507b3          	sub	a5,a0,a5
c0003fe0:	4057d793          	srai	a5,a5,0x5
c0003fe4:	00c787b3          	add	a5,a5,a2
c0003fe8:	00c79793          	slli	a5,a5,0xc
c0003fec:	3cd7f463          	bleu	a3,a5,c00043b4 <default_check+0x4fc>
c0003ff0:	00100513          	li	a0,1
c0003ff4:	00097c17          	auipc	s8,0x97
c0003ff8:	8a4c2c03          	lw	s8,-1884(s8) # c009a898 <free_area>
c0003ffc:	00097b97          	auipc	s7,0x97
c0004000:	8a0bab83          	lw	s7,-1888(s7) # c009a89c <free_area+0x4>
c0004004:	00097b17          	auipc	s6,0x97
c0004008:	89cb2b03          	lw	s6,-1892(s6) # c009a8a0 <free_area+0x8>
c000400c:	01292223          	sw	s2,4(s2)
c0004010:	01292023          	sw	s2,0(s2)
c0004014:	00092423          	sw	zero,8(s2)
c0004018:	0f5000ef          	jal	ra,c000490c <alloc_pages>
c000401c:	36051c63          	bnez	a0,c0004394 <default_check+0x4dc>
c0004020:	00100593          	li	a1,1
c0004024:	000a0513          	mv	a0,s4
c0004028:	199000ef          	jal	ra,c00049c0 <free_pages>
c000402c:	00100593          	li	a1,1
c0004030:	00098513          	mv	a0,s3
c0004034:	18d000ef          	jal	ra,c00049c0 <free_pages>
c0004038:	00100593          	li	a1,1
c000403c:	000a8513          	mv	a0,s5
c0004040:	181000ef          	jal	ra,c00049c0 <free_pages>
c0004044:	00097717          	auipc	a4,0x97
c0004048:	85c72703          	lw	a4,-1956(a4) # c009a8a0 <free_area+0x8>
c000404c:	00300793          	li	a5,3
c0004050:	32f71263          	bne	a4,a5,c0004374 <default_check+0x4bc>
c0004054:	00100513          	li	a0,1
c0004058:	0b5000ef          	jal	ra,c000490c <alloc_pages>
c000405c:	00050993          	mv	s3,a0
c0004060:	2c050a63          	beqz	a0,c0004334 <default_check+0x47c>
c0004064:	00100513          	li	a0,1
c0004068:	0a5000ef          	jal	ra,c000490c <alloc_pages>
c000406c:	00050a93          	mv	s5,a0
c0004070:	44050263          	beqz	a0,c00044b4 <default_check+0x5fc>
c0004074:	00100513          	li	a0,1
c0004078:	095000ef          	jal	ra,c000490c <alloc_pages>
c000407c:	00050a13          	mv	s4,a0
c0004080:	40050a63          	beqz	a0,c0004494 <default_check+0x5dc>
c0004084:	00100513          	li	a0,1
c0004088:	085000ef          	jal	ra,c000490c <alloc_pages>
c000408c:	3e051463          	bnez	a0,c0004474 <default_check+0x5bc>
c0004090:	00100593          	li	a1,1
c0004094:	00098513          	mv	a0,s3
c0004098:	129000ef          	jal	ra,c00049c0 <free_pages>
c000409c:	00097797          	auipc	a5,0x97
c00040a0:	8007a783          	lw	a5,-2048(a5) # c009a89c <free_area+0x4>
c00040a4:	2b278863          	beq	a5,s2,c0004354 <default_check+0x49c>
c00040a8:	00100513          	li	a0,1
c00040ac:	061000ef          	jal	ra,c000490c <alloc_pages>
c00040b0:	38a99263          	bne	s3,a0,c0004434 <default_check+0x57c>
c00040b4:	00100513          	li	a0,1
c00040b8:	055000ef          	jal	ra,c000490c <alloc_pages>
c00040bc:	34051c63          	bnez	a0,c0004414 <default_check+0x55c>
c00040c0:	00096797          	auipc	a5,0x96
c00040c4:	7e07a783          	lw	a5,2016(a5) # c009a8a0 <free_area+0x8>
c00040c8:	32079663          	bnez	a5,c00043f4 <default_check+0x53c>
c00040cc:	00098513          	mv	a0,s3
c00040d0:	00100593          	li	a1,1
c00040d4:	01892023          	sw	s8,0(s2)
c00040d8:	01792223          	sw	s7,4(s2)
c00040dc:	01692423          	sw	s6,8(s2)
c00040e0:	0e1000ef          	jal	ra,c00049c0 <free_pages>
c00040e4:	00100593          	li	a1,1
c00040e8:	000a8513          	mv	a0,s5
c00040ec:	0d5000ef          	jal	ra,c00049c0 <free_pages>
c00040f0:	00100593          	li	a1,1
c00040f4:	000a0513          	mv	a0,s4
c00040f8:	0c9000ef          	jal	ra,c00049c0 <free_pages>
c00040fc:	00500513          	li	a0,5
c0004100:	00d000ef          	jal	ra,c000490c <alloc_pages>
c0004104:	00050993          	mv	s3,a0
c0004108:	44050663          	beqz	a0,c0004554 <default_check+0x69c>
c000410c:	00452783          	lw	a5,4(a0)
c0004110:	0017d793          	srli	a5,a5,0x1
c0004114:	0017f793          	andi	a5,a5,1
c0004118:	58079e63          	bnez	a5,c00046b4 <default_check+0x7fc>
c000411c:	00100513          	li	a0,1
c0004120:	00096b97          	auipc	s7,0x96
c0004124:	778bab83          	lw	s7,1912(s7) # c009a898 <free_area>
c0004128:	00096b17          	auipc	s6,0x96
c000412c:	774b2b03          	lw	s6,1908(s6) # c009a89c <free_area+0x4>
c0004130:	01292023          	sw	s2,0(s2)
c0004134:	01292223          	sw	s2,4(s2)
c0004138:	7d4000ef          	jal	ra,c000490c <alloc_pages>
c000413c:	54051c63          	bnez	a0,c0004694 <default_check+0x7dc>
c0004140:	04098a93          	addi	s5,s3,64
c0004144:	000a8513          	mv	a0,s5
c0004148:	00300593          	li	a1,3
c000414c:	00096c17          	auipc	s8,0x96
c0004150:	754c2c03          	lw	s8,1876(s8) # c009a8a0 <free_area+0x8>
c0004154:	00092423          	sw	zero,8(s2)
c0004158:	069000ef          	jal	ra,c00049c0 <free_pages>
c000415c:	00400513          	li	a0,4
c0004160:	7ac000ef          	jal	ra,c000490c <alloc_pages>
c0004164:	50051863          	bnez	a0,c0004674 <default_check+0x7bc>
c0004168:	0449a783          	lw	a5,68(s3)
c000416c:	0017d793          	srli	a5,a5,0x1
c0004170:	0017f793          	andi	a5,a5,1
c0004174:	4e078063          	beqz	a5,c0004654 <default_check+0x79c>
c0004178:	0489a503          	lw	a0,72(s3)
c000417c:	00300793          	li	a5,3
c0004180:	4cf51a63          	bne	a0,a5,c0004654 <default_check+0x79c>
c0004184:	788000ef          	jal	ra,c000490c <alloc_pages>
c0004188:	00050a13          	mv	s4,a0
c000418c:	4a050463          	beqz	a0,c0004634 <default_check+0x77c>
c0004190:	00100513          	li	a0,1
c0004194:	778000ef          	jal	ra,c000490c <alloc_pages>
c0004198:	46051e63          	bnez	a0,c0004614 <default_check+0x75c>
c000419c:	454a9c63          	bne	s5,s4,c00045f4 <default_check+0x73c>
c00041a0:	00100593          	li	a1,1
c00041a4:	00098513          	mv	a0,s3
c00041a8:	019000ef          	jal	ra,c00049c0 <free_pages>
c00041ac:	00300593          	li	a1,3
c00041b0:	000a8513          	mv	a0,s5
c00041b4:	00d000ef          	jal	ra,c00049c0 <free_pages>
c00041b8:	0049a783          	lw	a5,4(s3)
c00041bc:	02098c93          	addi	s9,s3,32
c00041c0:	0017d793          	srli	a5,a5,0x1
c00041c4:	0017f793          	andi	a5,a5,1
c00041c8:	40078663          	beqz	a5,c00045d4 <default_check+0x71c>
c00041cc:	0089aa03          	lw	s4,8(s3)
c00041d0:	00100793          	li	a5,1
c00041d4:	40fa1063          	bne	s4,a5,c00045d4 <default_check+0x71c>
c00041d8:	0449a783          	lw	a5,68(s3)
c00041dc:	0017d793          	srli	a5,a5,0x1
c00041e0:	0017f793          	andi	a5,a5,1
c00041e4:	3c078863          	beqz	a5,c00045b4 <default_check+0x6fc>
c00041e8:	0489a703          	lw	a4,72(s3)
c00041ec:	00300793          	li	a5,3
c00041f0:	3cf71263          	bne	a4,a5,c00045b4 <default_check+0x6fc>
c00041f4:	000a0513          	mv	a0,s4
c00041f8:	714000ef          	jal	ra,c000490c <alloc_pages>
c00041fc:	38a99c63          	bne	s3,a0,c0004594 <default_check+0x6dc>
c0004200:	000a0593          	mv	a1,s4
c0004204:	7bc000ef          	jal	ra,c00049c0 <free_pages>
c0004208:	00200513          	li	a0,2
c000420c:	700000ef          	jal	ra,c000490c <alloc_pages>
c0004210:	36aa9263          	bne	s5,a0,c0004574 <default_check+0x6bc>
c0004214:	00200593          	li	a1,2
c0004218:	7a8000ef          	jal	ra,c00049c0 <free_pages>
c000421c:	000a0593          	mv	a1,s4
c0004220:	000c8513          	mv	a0,s9
c0004224:	79c000ef          	jal	ra,c00049c0 <free_pages>
c0004228:	00500513          	li	a0,5
c000422c:	6e0000ef          	jal	ra,c000490c <alloc_pages>
c0004230:	00050993          	mv	s3,a0
c0004234:	4a050063          	beqz	a0,c00046d4 <default_check+0x81c>
c0004238:	000a0513          	mv	a0,s4
c000423c:	6d0000ef          	jal	ra,c000490c <alloc_pages>
c0004240:	2e051a63          	bnez	a0,c0004534 <default_check+0x67c>
c0004244:	00096797          	auipc	a5,0x96
c0004248:	65c7a783          	lw	a5,1628(a5) # c009a8a0 <free_area+0x8>
c000424c:	2c079463          	bnez	a5,c0004514 <default_check+0x65c>
c0004250:	00500593          	li	a1,5
c0004254:	00098513          	mv	a0,s3
c0004258:	01892423          	sw	s8,8(s2)
c000425c:	01792023          	sw	s7,0(s2)
c0004260:	01692223          	sw	s6,4(s2)
c0004264:	75c000ef          	jal	ra,c00049c0 <free_pages>
c0004268:	00096797          	auipc	a5,0x96
c000426c:	6347a783          	lw	a5,1588(a5) # c009a89c <free_area+0x4>
c0004270:	01278c63          	beq	a5,s2,c0004288 <default_check+0x3d0>
c0004274:	ffc7a703          	lw	a4,-4(a5)
c0004278:	0047a783          	lw	a5,4(a5)
c000427c:	fff48493          	addi	s1,s1,-1
c0004280:	40e40433          	sub	s0,s0,a4
c0004284:	ff2798e3          	bne	a5,s2,c0004274 <default_check+0x3bc>
c0004288:	26049663          	bnez	s1,c00044f4 <default_check+0x63c>
c000428c:	46041463          	bnez	s0,c00046f4 <default_check+0x83c>
c0004290:	02c12083          	lw	ra,44(sp)
c0004294:	02812403          	lw	s0,40(sp)
c0004298:	02412483          	lw	s1,36(sp)
c000429c:	02012903          	lw	s2,32(sp)
c00042a0:	01c12983          	lw	s3,28(sp)
c00042a4:	01812a03          	lw	s4,24(sp)
c00042a8:	01412a83          	lw	s5,20(sp)
c00042ac:	01012b03          	lw	s6,16(sp)
c00042b0:	00c12b83          	lw	s7,12(sp)
c00042b4:	00812c03          	lw	s8,8(sp)
c00042b8:	00412c83          	lw	s9,4(sp)
c00042bc:	03010113          	addi	sp,sp,48
c00042c0:	00008067          	ret
c00042c4:	00000993          	li	s3,0
c00042c8:	00000413          	li	s0,0
c00042cc:	00000493          	li	s1,0
c00042d0:	c6dff06f          	j	c0003f3c <default_check+0x84>
c00042d4:	00011697          	auipc	a3,0x11
c00042d8:	9e868693          	addi	a3,a3,-1560 # c0014cbc <commands+0x1004>
c00042dc:	00010617          	auipc	a2,0x10
c00042e0:	b4060613          	addi	a2,a2,-1216 # c0013e1c <commands+0x164>
c00042e4:	0f000593          	li	a1,240
c00042e8:	00011517          	auipc	a0,0x11
c00042ec:	fd850513          	addi	a0,a0,-40 # c00152c0 <commands+0x1608>
c00042f0:	fd5fb0ef          	jal	ra,c00002c4 <__panic>
c00042f4:	00011697          	auipc	a3,0x11
c00042f8:	d5068693          	addi	a3,a3,-688 # c0015044 <commands+0x138c>
c00042fc:	00010617          	auipc	a2,0x10
c0004300:	b2060613          	addi	a2,a2,-1248 # c0013e1c <commands+0x164>
c0004304:	0be00593          	li	a1,190
c0004308:	00011517          	auipc	a0,0x11
c000430c:	fb850513          	addi	a0,a0,-72 # c00152c0 <commands+0x1608>
c0004310:	fb5fb0ef          	jal	ra,c00002c4 <__panic>
c0004314:	00011697          	auipc	a3,0x11
c0004318:	d0c68693          	addi	a3,a3,-756 # c0015020 <commands+0x1368>
c000431c:	00010617          	auipc	a2,0x10
c0004320:	b0060613          	addi	a2,a2,-1280 # c0013e1c <commands+0x164>
c0004324:	0bd00593          	li	a1,189
c0004328:	00011517          	auipc	a0,0x11
c000432c:	f9850513          	addi	a0,a0,-104 # c00152c0 <commands+0x1608>
c0004330:	f95fb0ef          	jal	ra,c00002c4 <__panic>
c0004334:	00011697          	auipc	a3,0x11
c0004338:	c9868693          	addi	a3,a3,-872 # c0014fcc <commands+0x1314>
c000433c:	00010617          	auipc	a2,0x10
c0004340:	ae060613          	addi	a2,a2,-1312 # c0013e1c <commands+0x164>
c0004344:	0d200593          	li	a1,210
c0004348:	00011517          	auipc	a0,0x11
c000434c:	f7850513          	addi	a0,a0,-136 # c00152c0 <commands+0x1608>
c0004350:	f75fb0ef          	jal	ra,c00002c4 <__panic>
c0004354:	00011697          	auipc	a3,0x11
c0004358:	db468693          	addi	a3,a3,-588 # c0015108 <commands+0x1450>
c000435c:	00010617          	auipc	a2,0x10
c0004360:	ac060613          	addi	a2,a2,-1344 # c0013e1c <commands+0x164>
c0004364:	0d900593          	li	a1,217
c0004368:	00011517          	auipc	a0,0x11
c000436c:	f5850513          	addi	a0,a0,-168 # c00152c0 <commands+0x1608>
c0004370:	f55fb0ef          	jal	ra,c00002c4 <__panic>
c0004374:	00011697          	auipc	a3,0x11
c0004378:	d8468693          	addi	a3,a3,-636 # c00150f8 <commands+0x1440>
c000437c:	00010617          	auipc	a2,0x10
c0004380:	aa060613          	addi	a2,a2,-1376 # c0013e1c <commands+0x164>
c0004384:	0d000593          	li	a1,208
c0004388:	00011517          	auipc	a0,0x11
c000438c:	f3850513          	addi	a0,a0,-200 # c00152c0 <commands+0x1608>
c0004390:	f35fb0ef          	jal	ra,c00002c4 <__panic>
c0004394:	00011697          	auipc	a3,0x11
c0004398:	d4c68693          	addi	a3,a3,-692 # c00150e0 <commands+0x1428>
c000439c:	00010617          	auipc	a2,0x10
c00043a0:	a8060613          	addi	a2,a2,-1408 # c0013e1c <commands+0x164>
c00043a4:	0cb00593          	li	a1,203
c00043a8:	00011517          	auipc	a0,0x11
c00043ac:	f1850513          	addi	a0,a0,-232 # c00152c0 <commands+0x1608>
c00043b0:	f15fb0ef          	jal	ra,c00002c4 <__panic>
c00043b4:	00011697          	auipc	a3,0x11
c00043b8:	d0c68693          	addi	a3,a3,-756 # c00150c0 <commands+0x1408>
c00043bc:	00010617          	auipc	a2,0x10
c00043c0:	a6060613          	addi	a2,a2,-1440 # c0013e1c <commands+0x164>
c00043c4:	0c200593          	li	a1,194
c00043c8:	00011517          	auipc	a0,0x11
c00043cc:	ef850513          	addi	a0,a0,-264 # c00152c0 <commands+0x1608>
c00043d0:	ef5fb0ef          	jal	ra,c00002c4 <__panic>
c00043d4:	00011697          	auipc	a3,0x11
c00043d8:	ccc68693          	addi	a3,a3,-820 # c00150a0 <commands+0x13e8>
c00043dc:	00010617          	auipc	a2,0x10
c00043e0:	a4060613          	addi	a2,a2,-1472 # c0013e1c <commands+0x164>
c00043e4:	0c100593          	li	a1,193
c00043e8:	00011517          	auipc	a0,0x11
c00043ec:	ed850513          	addi	a0,a0,-296 # c00152c0 <commands+0x1608>
c00043f0:	ed5fb0ef          	jal	ra,c00002c4 <__panic>
c00043f4:	00011697          	auipc	a3,0x11
c00043f8:	a5868693          	addi	a3,a3,-1448 # c0014e4c <commands+0x1194>
c00043fc:	00010617          	auipc	a2,0x10
c0004400:	a2060613          	addi	a2,a2,-1504 # c0013e1c <commands+0x164>
c0004404:	0df00593          	li	a1,223
c0004408:	00011517          	auipc	a0,0x11
c000440c:	eb850513          	addi	a0,a0,-328 # c00152c0 <commands+0x1608>
c0004410:	eb5fb0ef          	jal	ra,c00002c4 <__panic>
c0004414:	00011697          	auipc	a3,0x11
c0004418:	ccc68693          	addi	a3,a3,-820 # c00150e0 <commands+0x1428>
c000441c:	00010617          	auipc	a2,0x10
c0004420:	a0060613          	addi	a2,a2,-1536 # c0013e1c <commands+0x164>
c0004424:	0dd00593          	li	a1,221
c0004428:	00011517          	auipc	a0,0x11
c000442c:	e9850513          	addi	a0,a0,-360 # c00152c0 <commands+0x1608>
c0004430:	e95fb0ef          	jal	ra,c00002c4 <__panic>
c0004434:	00011697          	auipc	a3,0x11
c0004438:	cec68693          	addi	a3,a3,-788 # c0015120 <commands+0x1468>
c000443c:	00010617          	auipc	a2,0x10
c0004440:	9e060613          	addi	a2,a2,-1568 # c0013e1c <commands+0x164>
c0004444:	0dc00593          	li	a1,220
c0004448:	00011517          	auipc	a0,0x11
c000444c:	e7850513          	addi	a0,a0,-392 # c00152c0 <commands+0x1608>
c0004450:	e75fb0ef          	jal	ra,c00002c4 <__panic>
c0004454:	00011697          	auipc	a3,0x11
c0004458:	c2c68693          	addi	a3,a3,-980 # c0015080 <commands+0x13c8>
c000445c:	00010617          	auipc	a2,0x10
c0004460:	9c060613          	addi	a2,a2,-1600 # c0013e1c <commands+0x164>
c0004464:	0c000593          	li	a1,192
c0004468:	00011517          	auipc	a0,0x11
c000446c:	e5850513          	addi	a0,a0,-424 # c00152c0 <commands+0x1608>
c0004470:	e55fb0ef          	jal	ra,c00002c4 <__panic>
c0004474:	00011697          	auipc	a3,0x11
c0004478:	c6c68693          	addi	a3,a3,-916 # c00150e0 <commands+0x1428>
c000447c:	00010617          	auipc	a2,0x10
c0004480:	9a060613          	addi	a2,a2,-1632 # c0013e1c <commands+0x164>
c0004484:	0d600593          	li	a1,214
c0004488:	00011517          	auipc	a0,0x11
c000448c:	e3850513          	addi	a0,a0,-456 # c00152c0 <commands+0x1608>
c0004490:	e35fb0ef          	jal	ra,c00002c4 <__panic>
c0004494:	00011697          	auipc	a3,0x11
c0004498:	b7068693          	addi	a3,a3,-1168 # c0015004 <commands+0x134c>
c000449c:	00010617          	auipc	a2,0x10
c00044a0:	98060613          	addi	a2,a2,-1664 # c0013e1c <commands+0x164>
c00044a4:	0d400593          	li	a1,212
c00044a8:	00011517          	auipc	a0,0x11
c00044ac:	e1850513          	addi	a0,a0,-488 # c00152c0 <commands+0x1608>
c00044b0:	e15fb0ef          	jal	ra,c00002c4 <__panic>
c00044b4:	00011697          	auipc	a3,0x11
c00044b8:	b3468693          	addi	a3,a3,-1228 # c0014fe8 <commands+0x1330>
c00044bc:	00010617          	auipc	a2,0x10
c00044c0:	96060613          	addi	a2,a2,-1696 # c0013e1c <commands+0x164>
c00044c4:	0d300593          	li	a1,211
c00044c8:	00011517          	auipc	a0,0x11
c00044cc:	df850513          	addi	a0,a0,-520 # c00152c0 <commands+0x1608>
c00044d0:	df5fb0ef          	jal	ra,c00002c4 <__panic>
c00044d4:	00011697          	auipc	a3,0x11
c00044d8:	b3068693          	addi	a3,a3,-1232 # c0015004 <commands+0x134c>
c00044dc:	00010617          	auipc	a2,0x10
c00044e0:	94060613          	addi	a2,a2,-1728 # c0013e1c <commands+0x164>
c00044e4:	0bb00593          	li	a1,187
c00044e8:	00011517          	auipc	a0,0x11
c00044ec:	dd850513          	addi	a0,a0,-552 # c00152c0 <commands+0x1608>
c00044f0:	dd5fb0ef          	jal	ra,c00002c4 <__panic>
c00044f4:	00011697          	auipc	a3,0x11
c00044f8:	d8c68693          	addi	a3,a3,-628 # c0015280 <commands+0x15c8>
c00044fc:	00010617          	auipc	a2,0x10
c0004500:	92060613          	addi	a2,a2,-1760 # c0013e1c <commands+0x164>
c0004504:	12500593          	li	a1,293
c0004508:	00011517          	auipc	a0,0x11
c000450c:	db850513          	addi	a0,a0,-584 # c00152c0 <commands+0x1608>
c0004510:	db5fb0ef          	jal	ra,c00002c4 <__panic>
c0004514:	00011697          	auipc	a3,0x11
c0004518:	93868693          	addi	a3,a3,-1736 # c0014e4c <commands+0x1194>
c000451c:	00010617          	auipc	a2,0x10
c0004520:	90060613          	addi	a2,a2,-1792 # c0013e1c <commands+0x164>
c0004524:	11a00593          	li	a1,282
c0004528:	00011517          	auipc	a0,0x11
c000452c:	d9850513          	addi	a0,a0,-616 # c00152c0 <commands+0x1608>
c0004530:	d95fb0ef          	jal	ra,c00002c4 <__panic>
c0004534:	00011697          	auipc	a3,0x11
c0004538:	bac68693          	addi	a3,a3,-1108 # c00150e0 <commands+0x1428>
c000453c:	00010617          	auipc	a2,0x10
c0004540:	8e060613          	addi	a2,a2,-1824 # c0013e1c <commands+0x164>
c0004544:	11800593          	li	a1,280
c0004548:	00011517          	auipc	a0,0x11
c000454c:	d7850513          	addi	a0,a0,-648 # c00152c0 <commands+0x1608>
c0004550:	d75fb0ef          	jal	ra,c00002c4 <__panic>
c0004554:	00011697          	auipc	a3,0x11
c0004558:	be868693          	addi	a3,a3,-1048 # c001513c <commands+0x1484>
c000455c:	00010617          	auipc	a2,0x10
c0004560:	8c060613          	addi	a2,a2,-1856 # c0013e1c <commands+0x164>
c0004564:	0f800593          	li	a1,248
c0004568:	00011517          	auipc	a0,0x11
c000456c:	d5850513          	addi	a0,a0,-680 # c00152c0 <commands+0x1608>
c0004570:	d55fb0ef          	jal	ra,c00002c4 <__panic>
c0004574:	00011697          	auipc	a3,0x11
c0004578:	ccc68693          	addi	a3,a3,-820 # c0015240 <commands+0x1588>
c000457c:	00010617          	auipc	a2,0x10
c0004580:	8a060613          	addi	a2,a2,-1888 # c0013e1c <commands+0x164>
c0004584:	11200593          	li	a1,274
c0004588:	00011517          	auipc	a0,0x11
c000458c:	d3850513          	addi	a0,a0,-712 # c00152c0 <commands+0x1608>
c0004590:	d35fb0ef          	jal	ra,c00002c4 <__panic>
c0004594:	00011697          	auipc	a3,0x11
c0004598:	c8c68693          	addi	a3,a3,-884 # c0015220 <commands+0x1568>
c000459c:	00010617          	auipc	a2,0x10
c00045a0:	88060613          	addi	a2,a2,-1920 # c0013e1c <commands+0x164>
c00045a4:	11000593          	li	a1,272
c00045a8:	00011517          	auipc	a0,0x11
c00045ac:	d1850513          	addi	a0,a0,-744 # c00152c0 <commands+0x1608>
c00045b0:	d15fb0ef          	jal	ra,c00002c4 <__panic>
c00045b4:	00011697          	auipc	a3,0x11
c00045b8:	c4468693          	addi	a3,a3,-956 # c00151f8 <commands+0x1540>
c00045bc:	00010617          	auipc	a2,0x10
c00045c0:	86060613          	addi	a2,a2,-1952 # c0013e1c <commands+0x164>
c00045c4:	10e00593          	li	a1,270
c00045c8:	00011517          	auipc	a0,0x11
c00045cc:	cf850513          	addi	a0,a0,-776 # c00152c0 <commands+0x1608>
c00045d0:	cf5fb0ef          	jal	ra,c00002c4 <__panic>
c00045d4:	00011697          	auipc	a3,0x11
c00045d8:	bfc68693          	addi	a3,a3,-1028 # c00151d0 <commands+0x1518>
c00045dc:	00010617          	auipc	a2,0x10
c00045e0:	84060613          	addi	a2,a2,-1984 # c0013e1c <commands+0x164>
c00045e4:	10d00593          	li	a1,269
c00045e8:	00011517          	auipc	a0,0x11
c00045ec:	cd850513          	addi	a0,a0,-808 # c00152c0 <commands+0x1608>
c00045f0:	cd5fb0ef          	jal	ra,c00002c4 <__panic>
c00045f4:	00011697          	auipc	a3,0x11
c00045f8:	bcc68693          	addi	a3,a3,-1076 # c00151c0 <commands+0x1508>
c00045fc:	00010617          	auipc	a2,0x10
c0004600:	82060613          	addi	a2,a2,-2016 # c0013e1c <commands+0x164>
c0004604:	10800593          	li	a1,264
c0004608:	00011517          	auipc	a0,0x11
c000460c:	cb850513          	addi	a0,a0,-840 # c00152c0 <commands+0x1608>
c0004610:	cb5fb0ef          	jal	ra,c00002c4 <__panic>
c0004614:	00011697          	auipc	a3,0x11
c0004618:	acc68693          	addi	a3,a3,-1332 # c00150e0 <commands+0x1428>
c000461c:	00010617          	auipc	a2,0x10
c0004620:	80060613          	addi	a2,a2,-2048 # c0013e1c <commands+0x164>
c0004624:	10700593          	li	a1,263
c0004628:	00011517          	auipc	a0,0x11
c000462c:	c9850513          	addi	a0,a0,-872 # c00152c0 <commands+0x1608>
c0004630:	c95fb0ef          	jal	ra,c00002c4 <__panic>
c0004634:	00011697          	auipc	a3,0x11
c0004638:	b6c68693          	addi	a3,a3,-1172 # c00151a0 <commands+0x14e8>
c000463c:	0000f617          	auipc	a2,0xf
c0004640:	7e060613          	addi	a2,a2,2016 # c0013e1c <commands+0x164>
c0004644:	10600593          	li	a1,262
c0004648:	00011517          	auipc	a0,0x11
c000464c:	c7850513          	addi	a0,a0,-904 # c00152c0 <commands+0x1608>
c0004650:	c75fb0ef          	jal	ra,c00002c4 <__panic>
c0004654:	00011697          	auipc	a3,0x11
c0004658:	b2068693          	addi	a3,a3,-1248 # c0015174 <commands+0x14bc>
c000465c:	0000f617          	auipc	a2,0xf
c0004660:	7c060613          	addi	a2,a2,1984 # c0013e1c <commands+0x164>
c0004664:	10500593          	li	a1,261
c0004668:	00011517          	auipc	a0,0x11
c000466c:	c5850513          	addi	a0,a0,-936 # c00152c0 <commands+0x1608>
c0004670:	c55fb0ef          	jal	ra,c00002c4 <__panic>
c0004674:	00011697          	auipc	a3,0x11
c0004678:	ae868693          	addi	a3,a3,-1304 # c001515c <commands+0x14a4>
c000467c:	0000f617          	auipc	a2,0xf
c0004680:	7a060613          	addi	a2,a2,1952 # c0013e1c <commands+0x164>
c0004684:	10400593          	li	a1,260
c0004688:	00011517          	auipc	a0,0x11
c000468c:	c3850513          	addi	a0,a0,-968 # c00152c0 <commands+0x1608>
c0004690:	c35fb0ef          	jal	ra,c00002c4 <__panic>
c0004694:	00011697          	auipc	a3,0x11
c0004698:	a4c68693          	addi	a3,a3,-1460 # c00150e0 <commands+0x1428>
c000469c:	0000f617          	auipc	a2,0xf
c00046a0:	78060613          	addi	a2,a2,1920 # c0013e1c <commands+0x164>
c00046a4:	0fe00593          	li	a1,254
c00046a8:	00011517          	auipc	a0,0x11
c00046ac:	c1850513          	addi	a0,a0,-1000 # c00152c0 <commands+0x1608>
c00046b0:	c15fb0ef          	jal	ra,c00002c4 <__panic>
c00046b4:	00011697          	auipc	a3,0x11
c00046b8:	a9468693          	addi	a3,a3,-1388 # c0015148 <commands+0x1490>
c00046bc:	0000f617          	auipc	a2,0xf
c00046c0:	76060613          	addi	a2,a2,1888 # c0013e1c <commands+0x164>
c00046c4:	0f900593          	li	a1,249
c00046c8:	00011517          	auipc	a0,0x11
c00046cc:	bf850513          	addi	a0,a0,-1032 # c00152c0 <commands+0x1608>
c00046d0:	bf5fb0ef          	jal	ra,c00002c4 <__panic>
c00046d4:	00011697          	auipc	a3,0x11
c00046d8:	b8c68693          	addi	a3,a3,-1140 # c0015260 <commands+0x15a8>
c00046dc:	0000f617          	auipc	a2,0xf
c00046e0:	74060613          	addi	a2,a2,1856 # c0013e1c <commands+0x164>
c00046e4:	11700593          	li	a1,279
c00046e8:	00011517          	auipc	a0,0x11
c00046ec:	bd850513          	addi	a0,a0,-1064 # c00152c0 <commands+0x1608>
c00046f0:	bd5fb0ef          	jal	ra,c00002c4 <__panic>
c00046f4:	00011697          	auipc	a3,0x11
c00046f8:	b9868693          	addi	a3,a3,-1128 # c001528c <commands+0x15d4>
c00046fc:	0000f617          	auipc	a2,0xf
c0004700:	72060613          	addi	a2,a2,1824 # c0013e1c <commands+0x164>
c0004704:	12600593          	li	a1,294
c0004708:	00011517          	auipc	a0,0x11
c000470c:	bb850513          	addi	a0,a0,-1096 # c00152c0 <commands+0x1608>
c0004710:	bb5fb0ef          	jal	ra,c00002c4 <__panic>
c0004714:	00010697          	auipc	a3,0x10
c0004718:	5b868693          	addi	a3,a3,1464 # c0014ccc <commands+0x1014>
c000471c:	0000f617          	auipc	a2,0xf
c0004720:	70060613          	addi	a2,a2,1792 # c0013e1c <commands+0x164>
c0004724:	0f300593          	li	a1,243
c0004728:	00011517          	auipc	a0,0x11
c000472c:	b9850513          	addi	a0,a0,-1128 # c00152c0 <commands+0x1608>
c0004730:	b95fb0ef          	jal	ra,c00002c4 <__panic>
c0004734:	00011697          	auipc	a3,0x11
c0004738:	8b468693          	addi	a3,a3,-1868 # c0014fe8 <commands+0x1330>
c000473c:	0000f617          	auipc	a2,0xf
c0004740:	6e060613          	addi	a2,a2,1760 # c0013e1c <commands+0x164>
c0004744:	0ba00593          	li	a1,186
c0004748:	00011517          	auipc	a0,0x11
c000474c:	b7850513          	addi	a0,a0,-1160 # c00152c0 <commands+0x1608>
c0004750:	b75fb0ef          	jal	ra,c00002c4 <__panic>
c0004754:	00011697          	auipc	a3,0x11
c0004758:	87868693          	addi	a3,a3,-1928 # c0014fcc <commands+0x1314>
c000475c:	0000f617          	auipc	a2,0xf
c0004760:	6c060613          	addi	a2,a2,1728 # c0013e1c <commands+0x164>
c0004764:	0b900593          	li	a1,185
c0004768:	00011517          	auipc	a0,0x11
c000476c:	b5850513          	addi	a0,a0,-1192 # c00152c0 <commands+0x1608>
c0004770:	b55fb0ef          	jal	ra,c00002c4 <__panic>

c0004774 <default_alloc_pages>:
c0004774:	0a050263          	beqz	a0,c0004818 <default_alloc_pages+0xa4>
c0004778:	00096597          	auipc	a1,0x96
c000477c:	1285a583          	lw	a1,296(a1) # c009a8a0 <free_area+0x8>
c0004780:	00050693          	mv	a3,a0
c0004784:	00096617          	auipc	a2,0x96
c0004788:	11460613          	addi	a2,a2,276 # c009a898 <free_area>
c000478c:	00a5ee63          	bltu	a1,a0,c00047a8 <default_alloc_pages+0x34>
c0004790:	00060793          	mv	a5,a2
c0004794:	00c0006f          	j	c00047a0 <default_alloc_pages+0x2c>
c0004798:	ffc7a703          	lw	a4,-4(a5)
c000479c:	00d77a63          	bleu	a3,a4,c00047b0 <default_alloc_pages+0x3c>
c00047a0:	0047a783          	lw	a5,4(a5)
c00047a4:	fec79ae3          	bne	a5,a2,c0004798 <default_alloc_pages+0x24>
c00047a8:	00000513          	li	a0,0
c00047ac:	00008067          	ret
c00047b0:	ff478513          	addi	a0,a5,-12
c00047b4:	fe050ce3          	beqz	a0,c00047ac <default_alloc_pages+0x38>
c00047b8:	0007a803          	lw	a6,0(a5)
c00047bc:	0047a883          	lw	a7,4(a5)
c00047c0:	01182223          	sw	a7,4(a6)
c00047c4:	0108a023          	sw	a6,0(a7)
c00047c8:	02e6fc63          	bleu	a4,a3,c0004800 <default_alloc_pages+0x8c>
c00047cc:	00569893          	slli	a7,a3,0x5
c00047d0:	011508b3          	add	a7,a0,a7
c00047d4:	40d70733          	sub	a4,a4,a3
c00047d8:	00e8a423          	sw	a4,8(a7)
c00047dc:	00488313          	addi	t1,a7,4
c00047e0:	00200713          	li	a4,2
c00047e4:	40e3202f          	amoor.w	zero,a4,(t1)
c00047e8:	00482703          	lw	a4,4(a6)
c00047ec:	00c88313          	addi	t1,a7,12
c00047f0:	00672023          	sw	t1,0(a4)
c00047f4:	00682223          	sw	t1,4(a6)
c00047f8:	00e8a823          	sw	a4,16(a7)
c00047fc:	0108a623          	sw	a6,12(a7)
c0004800:	40d586b3          	sub	a3,a1,a3
c0004804:	00d62423          	sw	a3,8(a2)
c0004808:	ffd00713          	li	a4,-3
c000480c:	ff878793          	addi	a5,a5,-8
c0004810:	60e7a02f          	amoand.w	zero,a4,(a5)
c0004814:	00008067          	ret
c0004818:	ff010113          	addi	sp,sp,-16
c000481c:	00011697          	auipc	a3,0x11
c0004820:	abc68693          	addi	a3,a3,-1348 # c00152d8 <commands+0x1620>
c0004824:	0000f617          	auipc	a2,0xf
c0004828:	5f860613          	addi	a2,a2,1528 # c0013e1c <commands+0x164>
c000482c:	06200593          	li	a1,98
c0004830:	00011517          	auipc	a0,0x11
c0004834:	a9050513          	addi	a0,a0,-1392 # c00152c0 <commands+0x1608>
c0004838:	00112623          	sw	ra,12(sp)
c000483c:	a89fb0ef          	jal	ra,c00002c4 <__panic>

c0004840 <get_pgtable_items.isra.4.part.5>:
c0004840:	00050313          	mv	t1,a0
c0004844:	04a5f063          	bleu	a0,a1,c0004884 <get_pgtable_items.isra.4.part.5+0x44>
c0004848:	00259813          	slli	a6,a1,0x2
c000484c:	010608b3          	add	a7,a2,a6
c0004850:	0008a783          	lw	a5,0(a7)
c0004854:	0017f793          	andi	a5,a5,1
c0004858:	02079a63          	bnez	a5,c000488c <get_pgtable_items.isra.4.part.5+0x4c>
c000485c:	00480813          	addi	a6,a6,4
c0004860:	01060833          	add	a6,a2,a6
c0004864:	0140006f          	j	c0004878 <get_pgtable_items.isra.4.part.5+0x38>
c0004868:	00082783          	lw	a5,0(a6)
c000486c:	00480813          	addi	a6,a6,4
c0004870:	0017f793          	andi	a5,a5,1
c0004874:	00079c63          	bnez	a5,c000488c <get_pgtable_items.isra.4.part.5+0x4c>
c0004878:	00158593          	addi	a1,a1,1
c000487c:	00080893          	mv	a7,a6
c0004880:	fe6594e3          	bne	a1,t1,c0004868 <get_pgtable_items.isra.4.part.5+0x28>
c0004884:	00000513          	li	a0,0
c0004888:	00008067          	ret
c000488c:	00068463          	beqz	a3,c0004894 <get_pgtable_items.isra.4.part.5+0x54>
c0004890:	00b6a023          	sw	a1,0(a3)
c0004894:	0008a503          	lw	a0,0(a7)
c0004898:	00158593          	addi	a1,a1,1
c000489c:	01f57513          	andi	a0,a0,31
c00048a0:	0265fe63          	bleu	t1,a1,c00048dc <get_pgtable_items.isra.4.part.5+0x9c>
c00048a4:	00259793          	slli	a5,a1,0x2
c00048a8:	00f606b3          	add	a3,a2,a5
c00048ac:	0006a683          	lw	a3,0(a3)
c00048b0:	01f6f693          	andi	a3,a3,31
c00048b4:	02a69463          	bne	a3,a0,c00048dc <get_pgtable_items.isra.4.part.5+0x9c>
c00048b8:	ffc78793          	addi	a5,a5,-4
c00048bc:	00f60633          	add	a2,a2,a5
c00048c0:	0140006f          	j	c00048d4 <get_pgtable_items.isra.4.part.5+0x94>
c00048c4:	00862783          	lw	a5,8(a2)
c00048c8:	00460613          	addi	a2,a2,4
c00048cc:	01f7f793          	andi	a5,a5,31
c00048d0:	00d79663          	bne	a5,a3,c00048dc <get_pgtable_items.isra.4.part.5+0x9c>
c00048d4:	00158593          	addi	a1,a1,1
c00048d8:	fe65e6e3          	bltu	a1,t1,c00048c4 <get_pgtable_items.isra.4.part.5+0x84>
c00048dc:	00070663          	beqz	a4,c00048e8 <get_pgtable_items.isra.4.part.5+0xa8>
c00048e0:	00b72023          	sw	a1,0(a4)
c00048e4:	00008067          	ret
c00048e8:	00008067          	ret

c00048ec <pa2page.part.6>:
c00048ec:	ff010113          	addi	sp,sp,-16
c00048f0:	00010617          	auipc	a2,0x10
c00048f4:	00460613          	addi	a2,a2,4 # c00148f4 <commands+0xc3c>
c00048f8:	06900593          	li	a1,105
c00048fc:	00010517          	auipc	a0,0x10
c0004900:	01850513          	addi	a0,a0,24 # c0014914 <commands+0xc5c>
c0004904:	00112623          	sw	ra,12(sp)
c0004908:	9bdfb0ef          	jal	ra,c00002c4 <__panic>

c000490c <alloc_pages>:
c000490c:	ff010113          	addi	sp,sp,-16
c0004910:	00812423          	sw	s0,8(sp)
c0004914:	01212023          	sw	s2,0(sp)
c0004918:	00112623          	sw	ra,12(sp)
c000491c:	00912223          	sw	s1,4(sp)
c0004920:	00050413          	mv	s0,a0
c0004924:	00100913          	li	s2,1
c0004928:	0400006f          	j	c0004968 <alloc_pages+0x5c>
c000492c:	00096797          	auipc	a5,0x96
c0004930:	f787a783          	lw	a5,-136(a5) # c009a8a4 <pmm_manager>
c0004934:	00c7a783          	lw	a5,12(a5)
c0004938:	000780e7          	jalr	a5
c000493c:	00050493          	mv	s1,a0
c0004940:	00000613          	li	a2,0
c0004944:	00040593          	mv	a1,s0
c0004948:	04049e63          	bnez	s1,c00049a4 <alloc_pages+0x98>
c000494c:	04896c63          	bltu	s2,s0,c00049a4 <alloc_pages+0x98>
c0004950:	00096797          	auipc	a5,0x96
c0004954:	e4c7a783          	lw	a5,-436(a5) # c009a79c <swap_init_ok>
c0004958:	04078663          	beqz	a5,c00049a4 <alloc_pages+0x98>
c000495c:	00096517          	auipc	a0,0x96
c0004960:	e9452503          	lw	a0,-364(a0) # c009a7f0 <check_mm_struct>
c0004964:	f3dfe0ef          	jal	ra,c00038a0 <swap_out>
c0004968:	100027f3          	csrr	a5,sstatus
c000496c:	0027f793          	andi	a5,a5,2
c0004970:	00040513          	mv	a0,s0
c0004974:	fa078ce3          	beqz	a5,c000492c <alloc_pages+0x20>
c0004978:	c48fc0ef          	jal	ra,c0000dc0 <intr_disable>
c000497c:	00096797          	auipc	a5,0x96
c0004980:	f287a783          	lw	a5,-216(a5) # c009a8a4 <pmm_manager>
c0004984:	00c7a783          	lw	a5,12(a5)
c0004988:	00040513          	mv	a0,s0
c000498c:	000780e7          	jalr	a5
c0004990:	00050493          	mv	s1,a0
c0004994:	c24fc0ef          	jal	ra,c0000db8 <intr_enable>
c0004998:	00000613          	li	a2,0
c000499c:	00040593          	mv	a1,s0
c00049a0:	fa0486e3          	beqz	s1,c000494c <alloc_pages+0x40>
c00049a4:	00c12083          	lw	ra,12(sp)
c00049a8:	00048513          	mv	a0,s1
c00049ac:	00812403          	lw	s0,8(sp)
c00049b0:	00412483          	lw	s1,4(sp)
c00049b4:	00012903          	lw	s2,0(sp)
c00049b8:	01010113          	addi	sp,sp,16
c00049bc:	00008067          	ret

c00049c0 <free_pages>:
c00049c0:	100027f3          	csrr	a5,sstatus
c00049c4:	0027f793          	andi	a5,a5,2
c00049c8:	00079a63          	bnez	a5,c00049dc <free_pages+0x1c>
c00049cc:	00096797          	auipc	a5,0x96
c00049d0:	ed87a783          	lw	a5,-296(a5) # c009a8a4 <pmm_manager>
c00049d4:	0107a303          	lw	t1,16(a5)
c00049d8:	00030067          	jr	t1
c00049dc:	ff010113          	addi	sp,sp,-16
c00049e0:	00112623          	sw	ra,12(sp)
c00049e4:	00812423          	sw	s0,8(sp)
c00049e8:	00912223          	sw	s1,4(sp)
c00049ec:	00050413          	mv	s0,a0
c00049f0:	00058493          	mv	s1,a1
c00049f4:	bccfc0ef          	jal	ra,c0000dc0 <intr_disable>
c00049f8:	00096797          	auipc	a5,0x96
c00049fc:	eac7a783          	lw	a5,-340(a5) # c009a8a4 <pmm_manager>
c0004a00:	0107a783          	lw	a5,16(a5)
c0004a04:	00048593          	mv	a1,s1
c0004a08:	00040513          	mv	a0,s0
c0004a0c:	000780e7          	jalr	a5
c0004a10:	00c12083          	lw	ra,12(sp)
c0004a14:	00812403          	lw	s0,8(sp)
c0004a18:	00412483          	lw	s1,4(sp)
c0004a1c:	01010113          	addi	sp,sp,16
c0004a20:	b98fc06f          	j	c0000db8 <intr_enable>

c0004a24 <nr_free_pages>:
c0004a24:	100027f3          	csrr	a5,sstatus
c0004a28:	0027f793          	andi	a5,a5,2
c0004a2c:	00079a63          	bnez	a5,c0004a40 <nr_free_pages+0x1c>
c0004a30:	00096797          	auipc	a5,0x96
c0004a34:	e747a783          	lw	a5,-396(a5) # c009a8a4 <pmm_manager>
c0004a38:	0147a303          	lw	t1,20(a5)
c0004a3c:	00030067          	jr	t1
c0004a40:	ff010113          	addi	sp,sp,-16
c0004a44:	00112623          	sw	ra,12(sp)
c0004a48:	00812423          	sw	s0,8(sp)
c0004a4c:	b74fc0ef          	jal	ra,c0000dc0 <intr_disable>
c0004a50:	00096797          	auipc	a5,0x96
c0004a54:	e547a783          	lw	a5,-428(a5) # c009a8a4 <pmm_manager>
c0004a58:	0147a783          	lw	a5,20(a5)
c0004a5c:	000780e7          	jalr	a5
c0004a60:	00050413          	mv	s0,a0
c0004a64:	b54fc0ef          	jal	ra,c0000db8 <intr_enable>
c0004a68:	00c12083          	lw	ra,12(sp)
c0004a6c:	00040513          	mv	a0,s0
c0004a70:	00812403          	lw	s0,8(sp)
c0004a74:	01010113          	addi	sp,sp,16
c0004a78:	00008067          	ret

c0004a7c <get_pte>:
c0004a7c:	fe010113          	addi	sp,sp,-32
c0004a80:	01212823          	sw	s2,16(sp)
c0004a84:	0165d913          	srli	s2,a1,0x16
c0004a88:	00291913          	slli	s2,s2,0x2
c0004a8c:	01250933          	add	s2,a0,s2
c0004a90:	00092683          	lw	a3,0(s2)
c0004a94:	00912a23          	sw	s1,20(sp)
c0004a98:	00112e23          	sw	ra,28(sp)
c0004a9c:	00812c23          	sw	s0,24(sp)
c0004aa0:	01312623          	sw	s3,12(sp)
c0004aa4:	0016f793          	andi	a5,a3,1
c0004aa8:	00058493          	mv	s1,a1
c0004aac:	08079663          	bnez	a5,c0004b38 <get_pte+0xbc>
c0004ab0:	0c060e63          	beqz	a2,c0004b8c <get_pte+0x110>
c0004ab4:	00100513          	li	a0,1
c0004ab8:	e55ff0ef          	jal	ra,c000490c <alloc_pages>
c0004abc:	00050413          	mv	s0,a0
c0004ac0:	0c050663          	beqz	a0,c0004b8c <get_pte+0x110>
c0004ac4:	00096517          	auipc	a0,0x96
c0004ac8:	dec52503          	lw	a0,-532(a0) # c009a8b0 <pages>
c0004acc:	00100793          	li	a5,1
c0004ad0:	40a40533          	sub	a0,s0,a0
c0004ad4:	00f42023          	sw	a5,0(s0)
c0004ad8:	40555513          	srai	a0,a0,0x5
c0004adc:	000809b7          	lui	s3,0x80
c0004ae0:	001007b7          	lui	a5,0x100
c0004ae4:	01350533          	add	a0,a0,s3
c0004ae8:	fff78793          	addi	a5,a5,-1 # fffff <_binary_bin_sfs_img_size+0x8acff>
c0004aec:	00f577b3          	and	a5,a0,a5
c0004af0:	00096717          	auipc	a4,0x96
c0004af4:	cb472703          	lw	a4,-844(a4) # c009a7a4 <npage>
c0004af8:	00c51513          	slli	a0,a0,0xc
c0004afc:	0ce7f463          	bleu	a4,a5,c0004bc4 <get_pte+0x148>
c0004b00:	00096797          	auipc	a5,0x96
c0004b04:	da87a783          	lw	a5,-600(a5) # c009a8a8 <va_pa_offset>
c0004b08:	00001637          	lui	a2,0x1
c0004b0c:	00000593          	li	a1,0
c0004b10:	00f50533          	add	a0,a0,a5
c0004b14:	0a50e0ef          	jal	ra,c00133b8 <memset>
c0004b18:	00096697          	auipc	a3,0x96
c0004b1c:	d986a683          	lw	a3,-616(a3) # c009a8b0 <pages>
c0004b20:	40d406b3          	sub	a3,s0,a3
c0004b24:	4056d693          	srai	a3,a3,0x5
c0004b28:	013686b3          	add	a3,a3,s3
c0004b2c:	00a69693          	slli	a3,a3,0xa
c0004b30:	0116e693          	ori	a3,a3,17
c0004b34:	00d92023          	sw	a3,0(s2)
c0004b38:	00269693          	slli	a3,a3,0x2
c0004b3c:	fffff537          	lui	a0,0xfffff
c0004b40:	00a6f6b3          	and	a3,a3,a0
c0004b44:	00c6d713          	srli	a4,a3,0xc
c0004b48:	00096797          	auipc	a5,0x96
c0004b4c:	c5c7a783          	lw	a5,-932(a5) # c009a7a4 <npage>
c0004b50:	04f77e63          	bleu	a5,a4,c0004bac <get_pte+0x130>
c0004b54:	00c4d513          	srli	a0,s1,0xc
c0004b58:	01c12083          	lw	ra,28(sp)
c0004b5c:	3ff57513          	andi	a0,a0,1023
c0004b60:	00096797          	auipc	a5,0x96
c0004b64:	d487a783          	lw	a5,-696(a5) # c009a8a8 <va_pa_offset>
c0004b68:	00f686b3          	add	a3,a3,a5
c0004b6c:	00251513          	slli	a0,a0,0x2
c0004b70:	00a68533          	add	a0,a3,a0
c0004b74:	01812403          	lw	s0,24(sp)
c0004b78:	01412483          	lw	s1,20(sp)
c0004b7c:	01012903          	lw	s2,16(sp)
c0004b80:	00c12983          	lw	s3,12(sp)
c0004b84:	02010113          	addi	sp,sp,32
c0004b88:	00008067          	ret
c0004b8c:	01c12083          	lw	ra,28(sp)
c0004b90:	00000513          	li	a0,0
c0004b94:	01812403          	lw	s0,24(sp)
c0004b98:	01412483          	lw	s1,20(sp)
c0004b9c:	01012903          	lw	s2,16(sp)
c0004ba0:	00c12983          	lw	s3,12(sp)
c0004ba4:	02010113          	addi	sp,sp,32
c0004ba8:	00008067          	ret
c0004bac:	00010617          	auipc	a2,0x10
c0004bb0:	fd460613          	addi	a2,a2,-44 # c0014b80 <commands+0xec8>
c0004bb4:	12f00593          	li	a1,303
c0004bb8:	00010517          	auipc	a0,0x10
c0004bbc:	7b050513          	addi	a0,a0,1968 # c0015368 <default_pmm_manager+0x78>
c0004bc0:	f04fb0ef          	jal	ra,c00002c4 <__panic>
c0004bc4:	00050693          	mv	a3,a0
c0004bc8:	00010617          	auipc	a2,0x10
c0004bcc:	fb860613          	addi	a2,a2,-72 # c0014b80 <commands+0xec8>
c0004bd0:	12c00593          	li	a1,300
c0004bd4:	00010517          	auipc	a0,0x10
c0004bd8:	79450513          	addi	a0,a0,1940 # c0015368 <default_pmm_manager+0x78>
c0004bdc:	ee8fb0ef          	jal	ra,c00002c4 <__panic>

c0004be0 <boot_map_segment>:
c0004be0:	fe010113          	addi	sp,sp,-32
c0004be4:	01312623          	sw	s3,12(sp)
c0004be8:	000019b7          	lui	s3,0x1
c0004bec:	00d5c7b3          	xor	a5,a1,a3
c0004bf0:	fff98813          	addi	a6,s3,-1 # fff <_binary_bin_swap_img_size-0x6d01>
c0004bf4:	00112e23          	sw	ra,28(sp)
c0004bf8:	00812c23          	sw	s0,24(sp)
c0004bfc:	00912a23          	sw	s1,20(sp)
c0004c00:	01212823          	sw	s2,16(sp)
c0004c04:	01412423          	sw	s4,8(sp)
c0004c08:	01512223          	sw	s5,4(sp)
c0004c0c:	01612023          	sw	s6,0(sp)
c0004c10:	0107f7b3          	and	a5,a5,a6
c0004c14:	0a079c63          	bnez	a5,c0004ccc <boot_map_segment+0xec>
c0004c18:	010607b3          	add	a5,a2,a6
c0004c1c:	0105f833          	and	a6,a1,a6
c0004c20:	010787b3          	add	a5,a5,a6
c0004c24:	fffff937          	lui	s2,0xfffff
c0004c28:	00c7d793          	srli	a5,a5,0xc
c0004c2c:	0125f5b3          	and	a1,a1,s2
c0004c30:	0126f6b3          	and	a3,a3,s2
c0004c34:	04078863          	beqz	a5,c0004c84 <boot_map_segment+0xa4>
c0004c38:	00c79793          	slli	a5,a5,0xc
c0004c3c:	00100b13          	li	s6,1
c0004c40:	00050a93          	mv	s5,a0
c0004c44:	00058413          	mv	s0,a1
c0004c48:	00b784b3          	add	s1,a5,a1
c0004c4c:	40b68933          	sub	s2,a3,a1
c0004c50:	01676a33          	or	s4,a4,s6
c0004c54:	000b0613          	mv	a2,s6
c0004c58:	00040593          	mv	a1,s0
c0004c5c:	000a8513          	mv	a0,s5
c0004c60:	e1dff0ef          	jal	ra,c0004a7c <get_pte>
c0004c64:	008907b3          	add	a5,s2,s0
c0004c68:	04050263          	beqz	a0,c0004cac <boot_map_segment+0xcc>
c0004c6c:	00c7d793          	srli	a5,a5,0xc
c0004c70:	00a79793          	slli	a5,a5,0xa
c0004c74:	0147e7b3          	or	a5,a5,s4
c0004c78:	00f52023          	sw	a5,0(a0)
c0004c7c:	01340433          	add	s0,s0,s3
c0004c80:	fc849ae3          	bne	s1,s0,c0004c54 <boot_map_segment+0x74>
c0004c84:	01c12083          	lw	ra,28(sp)
c0004c88:	01812403          	lw	s0,24(sp)
c0004c8c:	01412483          	lw	s1,20(sp)
c0004c90:	01012903          	lw	s2,16(sp)
c0004c94:	00c12983          	lw	s3,12(sp)
c0004c98:	00812a03          	lw	s4,8(sp)
c0004c9c:	00412a83          	lw	s5,4(sp)
c0004ca0:	00012b03          	lw	s6,0(sp)
c0004ca4:	02010113          	addi	sp,sp,32
c0004ca8:	00008067          	ret
c0004cac:	00010697          	auipc	a3,0x10
c0004cb0:	68c68693          	addi	a3,a3,1676 # c0015338 <default_pmm_manager+0x48>
c0004cb4:	0000f617          	auipc	a2,0xf
c0004cb8:	16860613          	addi	a2,a2,360 # c0013e1c <commands+0x164>
c0004cbc:	0ae00593          	li	a1,174
c0004cc0:	00010517          	auipc	a0,0x10
c0004cc4:	6a850513          	addi	a0,a0,1704 # c0015368 <default_pmm_manager+0x78>
c0004cc8:	dfcfb0ef          	jal	ra,c00002c4 <__panic>
c0004ccc:	00010697          	auipc	a3,0x10
c0004cd0:	65468693          	addi	a3,a3,1620 # c0015320 <default_pmm_manager+0x30>
c0004cd4:	0000f617          	auipc	a2,0xf
c0004cd8:	14860613          	addi	a2,a2,328 # c0013e1c <commands+0x164>
c0004cdc:	0a800593          	li	a1,168
c0004ce0:	00010517          	auipc	a0,0x10
c0004ce4:	68850513          	addi	a0,a0,1672 # c0015368 <default_pmm_manager+0x78>
c0004ce8:	ddcfb0ef          	jal	ra,c00002c4 <__panic>

c0004cec <get_page>:
c0004cec:	ff010113          	addi	sp,sp,-16
c0004cf0:	00812423          	sw	s0,8(sp)
c0004cf4:	00060413          	mv	s0,a2
c0004cf8:	00000613          	li	a2,0
c0004cfc:	00112623          	sw	ra,12(sp)
c0004d00:	d7dff0ef          	jal	ra,c0004a7c <get_pte>
c0004d04:	00040463          	beqz	s0,c0004d0c <get_page+0x20>
c0004d08:	00a42023          	sw	a0,0(s0)
c0004d0c:	04050663          	beqz	a0,c0004d58 <get_page+0x6c>
c0004d10:	00052783          	lw	a5,0(a0)
c0004d14:	0017f713          	andi	a4,a5,1
c0004d18:	04070063          	beqz	a4,c0004d58 <get_page+0x6c>
c0004d1c:	00279793          	slli	a5,a5,0x2
c0004d20:	00c7d793          	srli	a5,a5,0xc
c0004d24:	00096717          	auipc	a4,0x96
c0004d28:	a8072703          	lw	a4,-1408(a4) # c009a7a4 <npage>
c0004d2c:	04e7f063          	bleu	a4,a5,c0004d6c <get_page+0x80>
c0004d30:	fff80537          	lui	a0,0xfff80
c0004d34:	00c12083          	lw	ra,12(sp)
c0004d38:	00a787b3          	add	a5,a5,a0
c0004d3c:	00579793          	slli	a5,a5,0x5
c0004d40:	00096517          	auipc	a0,0x96
c0004d44:	b7052503          	lw	a0,-1168(a0) # c009a8b0 <pages>
c0004d48:	00f50533          	add	a0,a0,a5
c0004d4c:	00812403          	lw	s0,8(sp)
c0004d50:	01010113          	addi	sp,sp,16
c0004d54:	00008067          	ret
c0004d58:	00c12083          	lw	ra,12(sp)
c0004d5c:	00000513          	li	a0,0
c0004d60:	00812403          	lw	s0,8(sp)
c0004d64:	01010113          	addi	sp,sp,16
c0004d68:	00008067          	ret
c0004d6c:	b81ff0ef          	jal	ra,c00048ec <pa2page.part.6>

c0004d70 <unmap_range>:
c0004d70:	fd010113          	addi	sp,sp,-48
c0004d74:	00c5e7b3          	or	a5,a1,a2
c0004d78:	02112623          	sw	ra,44(sp)
c0004d7c:	02812423          	sw	s0,40(sp)
c0004d80:	02912223          	sw	s1,36(sp)
c0004d84:	03212023          	sw	s2,32(sp)
c0004d88:	01312e23          	sw	s3,28(sp)
c0004d8c:	01412c23          	sw	s4,24(sp)
c0004d90:	01512a23          	sw	s5,20(sp)
c0004d94:	01612823          	sw	s6,16(sp)
c0004d98:	01712623          	sw	s7,12(sp)
c0004d9c:	01812423          	sw	s8,8(sp)
c0004da0:	01479713          	slli	a4,a5,0x14
c0004da4:	12071063          	bnez	a4,c0004ec4 <unmap_range+0x154>
c0004da8:	002007b7          	lui	a5,0x200
c0004dac:	00058413          	mv	s0,a1
c0004db0:	0ef5ea63          	bltu	a1,a5,c0004ea4 <unmap_range+0x134>
c0004db4:	00060913          	mv	s2,a2
c0004db8:	0ec5f663          	bleu	a2,a1,c0004ea4 <unmap_range+0x134>
c0004dbc:	b00007b7          	lui	a5,0xb0000
c0004dc0:	00050993          	mv	s3,a0
c0004dc4:	00400b37          	lui	s6,0x400
c0004dc8:	ffc00ab7          	lui	s5,0xffc00
c0004dcc:	00001a37          	lui	s4,0x1
c0004dd0:	fff80bb7          	lui	s7,0xfff80
c0004dd4:	00100c13          	li	s8,1
c0004dd8:	0cc7e663          	bltu	a5,a2,c0004ea4 <unmap_range+0x134>
c0004ddc:	00000613          	li	a2,0
c0004de0:	00040593          	mv	a1,s0
c0004de4:	00098513          	mv	a0,s3
c0004de8:	c95ff0ef          	jal	ra,c0004a7c <get_pte>
c0004dec:	00050493          	mv	s1,a0
c0004df0:	08050a63          	beqz	a0,c0004e84 <unmap_range+0x114>
c0004df4:	00052783          	lw	a5,0(a0)
c0004df8:	02079e63          	bnez	a5,c0004e34 <unmap_range+0xc4>
c0004dfc:	01440433          	add	s0,s0,s4
c0004e00:	fd246ee3          	bltu	s0,s2,c0004ddc <unmap_range+0x6c>
c0004e04:	02c12083          	lw	ra,44(sp)
c0004e08:	02812403          	lw	s0,40(sp)
c0004e0c:	02412483          	lw	s1,36(sp)
c0004e10:	02012903          	lw	s2,32(sp)
c0004e14:	01c12983          	lw	s3,28(sp)
c0004e18:	01812a03          	lw	s4,24(sp)
c0004e1c:	01412a83          	lw	s5,20(sp)
c0004e20:	01012b03          	lw	s6,16(sp)
c0004e24:	00c12b83          	lw	s7,12(sp)
c0004e28:	00812c03          	lw	s8,8(sp)
c0004e2c:	03010113          	addi	sp,sp,48
c0004e30:	00008067          	ret
c0004e34:	0017f713          	andi	a4,a5,1
c0004e38:	fc0702e3          	beqz	a4,c0004dfc <unmap_range+0x8c>
c0004e3c:	00279793          	slli	a5,a5,0x2
c0004e40:	00c7d793          	srli	a5,a5,0xc
c0004e44:	00096717          	auipc	a4,0x96
c0004e48:	96072703          	lw	a4,-1696(a4) # c009a7a4 <npage>
c0004e4c:	08e7fc63          	bleu	a4,a5,c0004ee4 <unmap_range+0x174>
c0004e50:	017787b3          	add	a5,a5,s7
c0004e54:	00579793          	slli	a5,a5,0x5
c0004e58:	00096517          	auipc	a0,0x96
c0004e5c:	a5852503          	lw	a0,-1448(a0) # c009a8b0 <pages>
c0004e60:	00f50533          	add	a0,a0,a5
c0004e64:	00052783          	lw	a5,0(a0)
c0004e68:	fff78793          	addi	a5,a5,-1 # afffffff <sbi_remote_fence_i+0xb000070f>
c0004e6c:	00f52023          	sw	a5,0(a0)
c0004e70:	02078463          	beqz	a5,c0004e98 <unmap_range+0x128>
c0004e74:	0004a023          	sw	zero,0(s1)
c0004e78:	10440073          	sfence.vm	s0
c0004e7c:	01440433          	add	s0,s0,s4
c0004e80:	f81ff06f          	j	c0004e00 <unmap_range+0x90>
c0004e84:	01640433          	add	s0,s0,s6
c0004e88:	01547433          	and	s0,s0,s5
c0004e8c:	f6040ce3          	beqz	s0,c0004e04 <unmap_range+0x94>
c0004e90:	f52466e3          	bltu	s0,s2,c0004ddc <unmap_range+0x6c>
c0004e94:	f71ff06f          	j	c0004e04 <unmap_range+0x94>
c0004e98:	000c0593          	mv	a1,s8
c0004e9c:	b25ff0ef          	jal	ra,c00049c0 <free_pages>
c0004ea0:	fd5ff06f          	j	c0004e74 <unmap_range+0x104>
c0004ea4:	00011697          	auipc	a3,0x11
c0004ea8:	b1c68693          	addi	a3,a3,-1252 # c00159c0 <default_pmm_manager+0x6d0>
c0004eac:	0000f617          	auipc	a2,0xf
c0004eb0:	f7060613          	addi	a2,a2,-144 # c0013e1c <commands+0x164>
c0004eb4:	16700593          	li	a1,359
c0004eb8:	00010517          	auipc	a0,0x10
c0004ebc:	4b050513          	addi	a0,a0,1200 # c0015368 <default_pmm_manager+0x78>
c0004ec0:	c04fb0ef          	jal	ra,c00002c4 <__panic>
c0004ec4:	00011697          	auipc	a3,0x11
c0004ec8:	ad068693          	addi	a3,a3,-1328 # c0015994 <default_pmm_manager+0x6a4>
c0004ecc:	0000f617          	auipc	a2,0xf
c0004ed0:	f5060613          	addi	a2,a2,-176 # c0013e1c <commands+0x164>
c0004ed4:	16600593          	li	a1,358
c0004ed8:	00010517          	auipc	a0,0x10
c0004edc:	49050513          	addi	a0,a0,1168 # c0015368 <default_pmm_manager+0x78>
c0004ee0:	be4fb0ef          	jal	ra,c00002c4 <__panic>
c0004ee4:	a09ff0ef          	jal	ra,c00048ec <pa2page.part.6>

c0004ee8 <exit_range>:
c0004ee8:	fe010113          	addi	sp,sp,-32
c0004eec:	00c5e7b3          	or	a5,a1,a2
c0004ef0:	00112e23          	sw	ra,28(sp)
c0004ef4:	00812c23          	sw	s0,24(sp)
c0004ef8:	00912a23          	sw	s1,20(sp)
c0004efc:	01212823          	sw	s2,16(sp)
c0004f00:	01312623          	sw	s3,12(sp)
c0004f04:	01412423          	sw	s4,8(sp)
c0004f08:	01512223          	sw	s5,4(sp)
c0004f0c:	01612023          	sw	s6,0(sp)
c0004f10:	01479713          	slli	a4,a5,0x14
c0004f14:	0e071863          	bnez	a4,c0005004 <exit_range+0x11c>
c0004f18:	002007b7          	lui	a5,0x200
c0004f1c:	0cf5e463          	bltu	a1,a5,c0004fe4 <exit_range+0xfc>
c0004f20:	00060a13          	mv	s4,a2
c0004f24:	0cc5f063          	bleu	a2,a1,c0004fe4 <exit_range+0xfc>
c0004f28:	ffc004b7          	lui	s1,0xffc00
c0004f2c:	b00007b7          	lui	a5,0xb0000
c0004f30:	00050a93          	mv	s5,a0
c0004f34:	0095f4b3          	and	s1,a1,s1
c0004f38:	fff809b7          	lui	s3,0xfff80
c0004f3c:	00100913          	li	s2,1
c0004f40:	00400b37          	lui	s6,0x400
c0004f44:	00c7f663          	bleu	a2,a5,c0004f50 <exit_range+0x68>
c0004f48:	09c0006f          	j	c0004fe4 <exit_range+0xfc>
c0004f4c:	0544fc63          	bleu	s4,s1,c0004fa4 <exit_range+0xbc>
c0004f50:	0164d413          	srli	s0,s1,0x16
c0004f54:	00241413          	slli	s0,s0,0x2
c0004f58:	008a8433          	add	s0,s5,s0
c0004f5c:	00042783          	lw	a5,0(s0)
c0004f60:	0017f713          	andi	a4,a5,1
c0004f64:	02070c63          	beqz	a4,c0004f9c <exit_range+0xb4>
c0004f68:	00279793          	slli	a5,a5,0x2
c0004f6c:	00c7d793          	srli	a5,a5,0xc
c0004f70:	00096717          	auipc	a4,0x96
c0004f74:	83472703          	lw	a4,-1996(a4) # c009a7a4 <npage>
c0004f78:	04e7fa63          	bleu	a4,a5,c0004fcc <exit_range+0xe4>
c0004f7c:	013787b3          	add	a5,a5,s3
c0004f80:	00579793          	slli	a5,a5,0x5
c0004f84:	00096517          	auipc	a0,0x96
c0004f88:	92c52503          	lw	a0,-1748(a0) # c009a8b0 <pages>
c0004f8c:	00090593          	mv	a1,s2
c0004f90:	00f50533          	add	a0,a0,a5
c0004f94:	a2dff0ef          	jal	ra,c00049c0 <free_pages>
c0004f98:	00042023          	sw	zero,0(s0)
c0004f9c:	016484b3          	add	s1,s1,s6
c0004fa0:	fa0496e3          	bnez	s1,c0004f4c <exit_range+0x64>
c0004fa4:	01c12083          	lw	ra,28(sp)
c0004fa8:	01812403          	lw	s0,24(sp)
c0004fac:	01412483          	lw	s1,20(sp)
c0004fb0:	01012903          	lw	s2,16(sp)
c0004fb4:	00c12983          	lw	s3,12(sp)
c0004fb8:	00812a03          	lw	s4,8(sp)
c0004fbc:	00412a83          	lw	s5,4(sp)
c0004fc0:	00012b03          	lw	s6,0(sp)
c0004fc4:	02010113          	addi	sp,sp,32
c0004fc8:	00008067          	ret
c0004fcc:	00010617          	auipc	a2,0x10
c0004fd0:	92860613          	addi	a2,a2,-1752 # c00148f4 <commands+0xc3c>
c0004fd4:	06900593          	li	a1,105
c0004fd8:	00010517          	auipc	a0,0x10
c0004fdc:	93c50513          	addi	a0,a0,-1732 # c0014914 <commands+0xc5c>
c0004fe0:	ae4fb0ef          	jal	ra,c00002c4 <__panic>
c0004fe4:	00011697          	auipc	a3,0x11
c0004fe8:	9dc68693          	addi	a3,a3,-1572 # c00159c0 <default_pmm_manager+0x6d0>
c0004fec:	0000f617          	auipc	a2,0xf
c0004ff0:	e3060613          	addi	a2,a2,-464 # c0013e1c <commands+0x164>
c0004ff4:	17800593          	li	a1,376
c0004ff8:	00010517          	auipc	a0,0x10
c0004ffc:	37050513          	addi	a0,a0,880 # c0015368 <default_pmm_manager+0x78>
c0005000:	ac4fb0ef          	jal	ra,c00002c4 <__panic>
c0005004:	00011697          	auipc	a3,0x11
c0005008:	99068693          	addi	a3,a3,-1648 # c0015994 <default_pmm_manager+0x6a4>
c000500c:	0000f617          	auipc	a2,0xf
c0005010:	e1060613          	addi	a2,a2,-496 # c0013e1c <commands+0x164>
c0005014:	17700593          	li	a1,375
c0005018:	00010517          	auipc	a0,0x10
c000501c:	35050513          	addi	a0,a0,848 # c0015368 <default_pmm_manager+0x78>
c0005020:	aa4fb0ef          	jal	ra,c00002c4 <__panic>

c0005024 <page_remove>:
c0005024:	ff010113          	addi	sp,sp,-16
c0005028:	00000613          	li	a2,0
c000502c:	00912223          	sw	s1,4(sp)
c0005030:	00112623          	sw	ra,12(sp)
c0005034:	00812423          	sw	s0,8(sp)
c0005038:	00058493          	mv	s1,a1
c000503c:	a41ff0ef          	jal	ra,c0004a7c <get_pte>
c0005040:	00050a63          	beqz	a0,c0005054 <page_remove+0x30>
c0005044:	00052783          	lw	a5,0(a0)
c0005048:	00050413          	mv	s0,a0
c000504c:	0017f713          	andi	a4,a5,1
c0005050:	00071c63          	bnez	a4,c0005068 <page_remove+0x44>
c0005054:	00c12083          	lw	ra,12(sp)
c0005058:	00812403          	lw	s0,8(sp)
c000505c:	00412483          	lw	s1,4(sp)
c0005060:	01010113          	addi	sp,sp,16
c0005064:	00008067          	ret
c0005068:	00279793          	slli	a5,a5,0x2
c000506c:	00c7d793          	srli	a5,a5,0xc
c0005070:	00095717          	auipc	a4,0x95
c0005074:	73472703          	lw	a4,1844(a4) # c009a7a4 <npage>
c0005078:	04e7fa63          	bleu	a4,a5,c00050cc <page_remove+0xa8>
c000507c:	fff80537          	lui	a0,0xfff80
c0005080:	00a787b3          	add	a5,a5,a0
c0005084:	00579793          	slli	a5,a5,0x5
c0005088:	00096517          	auipc	a0,0x96
c000508c:	82852503          	lw	a0,-2008(a0) # c009a8b0 <pages>
c0005090:	00f50533          	add	a0,a0,a5
c0005094:	00052783          	lw	a5,0(a0)
c0005098:	fff78793          	addi	a5,a5,-1 # afffffff <sbi_remote_fence_i+0xb000070f>
c000509c:	00f52023          	sw	a5,0(a0)
c00050a0:	02078063          	beqz	a5,c00050c0 <page_remove+0x9c>
c00050a4:	00042023          	sw	zero,0(s0)
c00050a8:	10448073          	sfence.vm	s1
c00050ac:	00c12083          	lw	ra,12(sp)
c00050b0:	00812403          	lw	s0,8(sp)
c00050b4:	00412483          	lw	s1,4(sp)
c00050b8:	01010113          	addi	sp,sp,16
c00050bc:	00008067          	ret
c00050c0:	00100593          	li	a1,1
c00050c4:	8fdff0ef          	jal	ra,c00049c0 <free_pages>
c00050c8:	fddff06f          	j	c00050a4 <page_remove+0x80>
c00050cc:	821ff0ef          	jal	ra,c00048ec <pa2page.part.6>

c00050d0 <page_insert>:
c00050d0:	fe010113          	addi	sp,sp,-32
c00050d4:	01312623          	sw	s3,12(sp)
c00050d8:	00060993          	mv	s3,a2
c00050dc:	00812c23          	sw	s0,24(sp)
c00050e0:	00100613          	li	a2,1
c00050e4:	00058413          	mv	s0,a1
c00050e8:	00098593          	mv	a1,s3
c00050ec:	01212823          	sw	s2,16(sp)
c00050f0:	00112e23          	sw	ra,28(sp)
c00050f4:	00912a23          	sw	s1,20(sp)
c00050f8:	00068913          	mv	s2,a3
c00050fc:	981ff0ef          	jal	ra,c0004a7c <get_pte>
c0005100:	0c050a63          	beqz	a0,c00051d4 <page_insert+0x104>
c0005104:	00042703          	lw	a4,0(s0)
c0005108:	00050493          	mv	s1,a0
c000510c:	00170793          	addi	a5,a4,1
c0005110:	00f42023          	sw	a5,0(s0)
c0005114:	00052783          	lw	a5,0(a0)
c0005118:	0017f693          	andi	a3,a5,1
c000511c:	04069863          	bnez	a3,c000516c <page_insert+0x9c>
c0005120:	00095697          	auipc	a3,0x95
c0005124:	7906a683          	lw	a3,1936(a3) # c009a8b0 <pages>
c0005128:	40d40433          	sub	s0,s0,a3
c000512c:	40545413          	srai	s0,s0,0x5
c0005130:	000806b7          	lui	a3,0x80
c0005134:	00d40433          	add	s0,s0,a3
c0005138:	00a41413          	slli	s0,s0,0xa
c000513c:	00196693          	ori	a3,s2,1
c0005140:	00d466b3          	or	a3,s0,a3
c0005144:	00d4a023          	sw	a3,0(s1) # ffc00000 <sbi_remote_fence_i+0xffc00710>
c0005148:	10498073          	sfence.vm	s3
c000514c:	00000513          	li	a0,0
c0005150:	01c12083          	lw	ra,28(sp)
c0005154:	01812403          	lw	s0,24(sp)
c0005158:	01412483          	lw	s1,20(sp)
c000515c:	01012903          	lw	s2,16(sp)
c0005160:	00c12983          	lw	s3,12(sp)
c0005164:	02010113          	addi	sp,sp,32
c0005168:	00008067          	ret
c000516c:	00279793          	slli	a5,a5,0x2
c0005170:	00c7d793          	srli	a5,a5,0xc
c0005174:	00095697          	auipc	a3,0x95
c0005178:	6306a683          	lw	a3,1584(a3) # c009a7a4 <npage>
c000517c:	06d7f063          	bleu	a3,a5,c00051dc <page_insert+0x10c>
c0005180:	fff80537          	lui	a0,0xfff80
c0005184:	00a78533          	add	a0,a5,a0
c0005188:	00095697          	auipc	a3,0x95
c000518c:	7286a683          	lw	a3,1832(a3) # c009a8b0 <pages>
c0005190:	00551513          	slli	a0,a0,0x5
c0005194:	00a68533          	add	a0,a3,a0
c0005198:	00a40e63          	beq	s0,a0,c00051b4 <page_insert+0xe4>
c000519c:	00052783          	lw	a5,0(a0) # fff80000 <sbi_remote_fence_i+0xfff80710>
c00051a0:	fff78793          	addi	a5,a5,-1
c00051a4:	00f52023          	sw	a5,0(a0)
c00051a8:	00078a63          	beqz	a5,c00051bc <page_insert+0xec>
c00051ac:	10498073          	sfence.vm	s3
c00051b0:	f79ff06f          	j	c0005128 <page_insert+0x58>
c00051b4:	00e42023          	sw	a4,0(s0)
c00051b8:	f71ff06f          	j	c0005128 <page_insert+0x58>
c00051bc:	00100593          	li	a1,1
c00051c0:	801ff0ef          	jal	ra,c00049c0 <free_pages>
c00051c4:	00095697          	auipc	a3,0x95
c00051c8:	6ec6a683          	lw	a3,1772(a3) # c009a8b0 <pages>
c00051cc:	10498073          	sfence.vm	s3
c00051d0:	f59ff06f          	j	c0005128 <page_insert+0x58>
c00051d4:	ffc00513          	li	a0,-4
c00051d8:	f79ff06f          	j	c0005150 <page_insert+0x80>
c00051dc:	f10ff0ef          	jal	ra,c00048ec <pa2page.part.6>

c00051e0 <copy_range>:
c00051e0:	fc010113          	addi	sp,sp,-64
c00051e4:	00d667b3          	or	a5,a2,a3
c00051e8:	02112e23          	sw	ra,60(sp)
c00051ec:	02812c23          	sw	s0,56(sp)
c00051f0:	02912a23          	sw	s1,52(sp)
c00051f4:	03212823          	sw	s2,48(sp)
c00051f8:	03312623          	sw	s3,44(sp)
c00051fc:	03412423          	sw	s4,40(sp)
c0005200:	03512223          	sw	s5,36(sp)
c0005204:	03612023          	sw	s6,32(sp)
c0005208:	01712e23          	sw	s7,28(sp)
c000520c:	01812c23          	sw	s8,24(sp)
c0005210:	01912a23          	sw	s9,20(sp)
c0005214:	01a12823          	sw	s10,16(sp)
c0005218:	01b12623          	sw	s11,12(sp)
c000521c:	01479713          	slli	a4,a5,0x14
c0005220:	24071c63          	bnez	a4,c0005478 <copy_range+0x298>
c0005224:	002007b7          	lui	a5,0x200
c0005228:	00060413          	mv	s0,a2
c000522c:	1ef66863          	bltu	a2,a5,c000541c <copy_range+0x23c>
c0005230:	00068493          	mv	s1,a3
c0005234:	1ed67463          	bleu	a3,a2,c000541c <copy_range+0x23c>
c0005238:	b00007b7          	lui	a5,0xb0000
c000523c:	1ed7e063          	bltu	a5,a3,c000541c <copy_range+0x23c>
c0005240:	00100a37          	lui	s4,0x100
c0005244:	00050b13          	mv	s6,a0
c0005248:	00058993          	mv	s3,a1
c000524c:	00001937          	lui	s2,0x1
c0005250:	00100a93          	li	s5,1
c0005254:	fff80cb7          	lui	s9,0xfff80
c0005258:	00080bb7          	lui	s7,0x80
c000525c:	fffa0a13          	addi	s4,s4,-1 # fffff <_binary_bin_sfs_img_size+0x8acff>
c0005260:	00000613          	li	a2,0
c0005264:	00040593          	mv	a1,s0
c0005268:	00098513          	mv	a0,s3
c000526c:	811ff0ef          	jal	ra,c0004a7c <get_pte>
c0005270:	00050c13          	mv	s8,a0
c0005274:	14050463          	beqz	a0,c00053bc <copy_range+0x1dc>
c0005278:	00052783          	lw	a5,0(a0)
c000527c:	0017f793          	andi	a5,a5,1
c0005280:	04079663          	bnez	a5,c00052cc <copy_range+0xec>
c0005284:	01240433          	add	s0,s0,s2
c0005288:	fc946ce3          	bltu	s0,s1,c0005260 <copy_range+0x80>
c000528c:	00000513          	li	a0,0
c0005290:	03c12083          	lw	ra,60(sp)
c0005294:	03812403          	lw	s0,56(sp)
c0005298:	03412483          	lw	s1,52(sp)
c000529c:	03012903          	lw	s2,48(sp)
c00052a0:	02c12983          	lw	s3,44(sp)
c00052a4:	02812a03          	lw	s4,40(sp)
c00052a8:	02412a83          	lw	s5,36(sp)
c00052ac:	02012b03          	lw	s6,32(sp)
c00052b0:	01c12b83          	lw	s7,28(sp)
c00052b4:	01812c03          	lw	s8,24(sp)
c00052b8:	01412c83          	lw	s9,20(sp)
c00052bc:	01012d03          	lw	s10,16(sp)
c00052c0:	00c12d83          	lw	s11,12(sp)
c00052c4:	04010113          	addi	sp,sp,64
c00052c8:	00008067          	ret
c00052cc:	000a8613          	mv	a2,s5
c00052d0:	00040593          	mv	a1,s0
c00052d4:	000b0513          	mv	a0,s6
c00052d8:	fa4ff0ef          	jal	ra,c0004a7c <get_pte>
c00052dc:	0e050e63          	beqz	a0,c00053d8 <copy_range+0x1f8>
c00052e0:	000c2783          	lw	a5,0(s8)
c00052e4:	0017f713          	andi	a4,a5,1
c00052e8:	01f7fc13          	andi	s8,a5,31
c00052ec:	16070a63          	beqz	a4,c0005460 <copy_range+0x280>
c00052f0:	00279793          	slli	a5,a5,0x2
c00052f4:	00c7d793          	srli	a5,a5,0xc
c00052f8:	00095717          	auipc	a4,0x95
c00052fc:	4ac72703          	lw	a4,1196(a4) # c009a7a4 <npage>
c0005300:	14e7fe63          	bleu	a4,a5,c000545c <copy_range+0x27c>
c0005304:	019787b3          	add	a5,a5,s9
c0005308:	00579713          	slli	a4,a5,0x5
c000530c:	000a8513          	mv	a0,s5
c0005310:	00095797          	auipc	a5,0x95
c0005314:	5a07a783          	lw	a5,1440(a5) # c009a8b0 <pages>
c0005318:	00e78db3          	add	s11,a5,a4
c000531c:	df0ff0ef          	jal	ra,c000490c <alloc_pages>
c0005320:	00050d13          	mv	s10,a0
c0005324:	0c0d8c63          	beqz	s11,c00053fc <copy_range+0x21c>
c0005328:	10050a63          	beqz	a0,c000543c <copy_range+0x25c>
c000532c:	00095717          	auipc	a4,0x95
c0005330:	58472703          	lw	a4,1412(a4) # c009a8b0 <pages>
c0005334:	40ed86b3          	sub	a3,s11,a4
c0005338:	4056d693          	srai	a3,a3,0x5
c000533c:	017686b3          	add	a3,a3,s7
c0005340:	0146f7b3          	and	a5,a3,s4
c0005344:	00095617          	auipc	a2,0x95
c0005348:	46062603          	lw	a2,1120(a2) # c009a7a4 <npage>
c000534c:	00c69693          	slli	a3,a3,0xc
c0005350:	08c7fa63          	bleu	a2,a5,c00053e4 <copy_range+0x204>
c0005354:	40e507b3          	sub	a5,a0,a4
c0005358:	4057d793          	srai	a5,a5,0x5
c000535c:	017787b3          	add	a5,a5,s7
c0005360:	00095517          	auipc	a0,0x95
c0005364:	54852503          	lw	a0,1352(a0) # c009a8a8 <va_pa_offset>
c0005368:	0147f733          	and	a4,a5,s4
c000536c:	00a685b3          	add	a1,a3,a0
c0005370:	00c79793          	slli	a5,a5,0xc
c0005374:	06c77663          	bleu	a2,a4,c00053e0 <copy_range+0x200>
c0005378:	00090613          	mv	a2,s2
c000537c:	00a78533          	add	a0,a5,a0
c0005380:	0a80e0ef          	jal	ra,c0013428 <memcpy>
c0005384:	000c0693          	mv	a3,s8
c0005388:	00040613          	mv	a2,s0
c000538c:	000d0593          	mv	a1,s10
c0005390:	000b0513          	mv	a0,s6
c0005394:	d3dff0ef          	jal	ra,c00050d0 <page_insert>
c0005398:	ee0506e3          	beqz	a0,c0005284 <copy_range+0xa4>
c000539c:	00010697          	auipc	a3,0x10
c00053a0:	b4c68693          	addi	a3,a3,-1204 # c0014ee8 <commands+0x1230>
c00053a4:	0000f617          	auipc	a2,0xf
c00053a8:	a7860613          	addi	a2,a2,-1416 # c0013e1c <commands+0x164>
c00053ac:	1bf00593          	li	a1,447
c00053b0:	00010517          	auipc	a0,0x10
c00053b4:	fb850513          	addi	a0,a0,-72 # c0015368 <default_pmm_manager+0x78>
c00053b8:	f0dfa0ef          	jal	ra,c00002c4 <__panic>
c00053bc:	004007b7          	lui	a5,0x400
c00053c0:	00f40433          	add	s0,s0,a5
c00053c4:	ffc007b7          	lui	a5,0xffc00
c00053c8:	00f47433          	and	s0,s0,a5
c00053cc:	ec0400e3          	beqz	s0,c000528c <copy_range+0xac>
c00053d0:	e89468e3          	bltu	s0,s1,c0005260 <copy_range+0x80>
c00053d4:	eb9ff06f          	j	c000528c <copy_range+0xac>
c00053d8:	ffc00513          	li	a0,-4
c00053dc:	eb5ff06f          	j	c0005290 <copy_range+0xb0>
c00053e0:	00078693          	mv	a3,a5
c00053e4:	0000f617          	auipc	a2,0xf
c00053e8:	79c60613          	addi	a2,a2,1948 # c0014b80 <commands+0xec8>
c00053ec:	06e00593          	li	a1,110
c00053f0:	0000f517          	auipc	a0,0xf
c00053f4:	52450513          	addi	a0,a0,1316 # c0014914 <commands+0xc5c>
c00053f8:	ecdfa0ef          	jal	ra,c00002c4 <__panic>
c00053fc:	00010697          	auipc	a3,0x10
c0005400:	f4c68693          	addi	a3,a3,-180 # c0015348 <default_pmm_manager+0x58>
c0005404:	0000f617          	auipc	a2,0xf
c0005408:	a1860613          	addi	a2,a2,-1512 # c0013e1c <commands+0x164>
c000540c:	1a400593          	li	a1,420
c0005410:	00010517          	auipc	a0,0x10
c0005414:	f5850513          	addi	a0,a0,-168 # c0015368 <default_pmm_manager+0x78>
c0005418:	eadfa0ef          	jal	ra,c00002c4 <__panic>
c000541c:	00010697          	auipc	a3,0x10
c0005420:	5a468693          	addi	a3,a3,1444 # c00159c0 <default_pmm_manager+0x6d0>
c0005424:	0000f617          	auipc	a2,0xf
c0005428:	9f860613          	addi	a2,a2,-1544 # c0013e1c <commands+0x164>
c000542c:	19000593          	li	a1,400
c0005430:	00010517          	auipc	a0,0x10
c0005434:	f3850513          	addi	a0,a0,-200 # c0015368 <default_pmm_manager+0x78>
c0005438:	e8dfa0ef          	jal	ra,c00002c4 <__panic>
c000543c:	00010697          	auipc	a3,0x10
c0005440:	f1c68693          	addi	a3,a3,-228 # c0015358 <default_pmm_manager+0x68>
c0005444:	0000f617          	auipc	a2,0xf
c0005448:	9d860613          	addi	a2,a2,-1576 # c0013e1c <commands+0x164>
c000544c:	1a500593          	li	a1,421
c0005450:	00010517          	auipc	a0,0x10
c0005454:	f1850513          	addi	a0,a0,-232 # c0015368 <default_pmm_manager+0x78>
c0005458:	e6dfa0ef          	jal	ra,c00002c4 <__panic>
c000545c:	c90ff0ef          	jal	ra,c00048ec <pa2page.part.6>
c0005460:	00010617          	auipc	a2,0x10
c0005464:	a1460613          	addi	a2,a2,-1516 # c0014e74 <commands+0x11bc>
c0005468:	07400593          	li	a1,116
c000546c:	0000f517          	auipc	a0,0xf
c0005470:	4a850513          	addi	a0,a0,1192 # c0014914 <commands+0xc5c>
c0005474:	e51fa0ef          	jal	ra,c00002c4 <__panic>
c0005478:	00010697          	auipc	a3,0x10
c000547c:	51c68693          	addi	a3,a3,1308 # c0015994 <default_pmm_manager+0x6a4>
c0005480:	0000f617          	auipc	a2,0xf
c0005484:	99c60613          	addi	a2,a2,-1636 # c0013e1c <commands+0x164>
c0005488:	18f00593          	li	a1,399
c000548c:	00010517          	auipc	a0,0x10
c0005490:	edc50513          	addi	a0,a0,-292 # c0015368 <default_pmm_manager+0x78>
c0005494:	e31fa0ef          	jal	ra,c00002c4 <__panic>

c0005498 <tlb_invalidate>:
c0005498:	10458073          	sfence.vm	a1
c000549c:	00008067          	ret

c00054a0 <pgdir_alloc_page>:
c00054a0:	fe010113          	addi	sp,sp,-32
c00054a4:	01212823          	sw	s2,16(sp)
c00054a8:	00050913          	mv	s2,a0
c00054ac:	00100513          	li	a0,1
c00054b0:	00812c23          	sw	s0,24(sp)
c00054b4:	00912a23          	sw	s1,20(sp)
c00054b8:	01312623          	sw	s3,12(sp)
c00054bc:	00112e23          	sw	ra,28(sp)
c00054c0:	00058493          	mv	s1,a1
c00054c4:	00060993          	mv	s3,a2
c00054c8:	c44ff0ef          	jal	ra,c000490c <alloc_pages>
c00054cc:	00050413          	mv	s0,a0
c00054d0:	04050a63          	beqz	a0,c0005524 <pgdir_alloc_page+0x84>
c00054d4:	00050593          	mv	a1,a0
c00054d8:	00098693          	mv	a3,s3
c00054dc:	00048613          	mv	a2,s1
c00054e0:	00090513          	mv	a0,s2
c00054e4:	bedff0ef          	jal	ra,c00050d0 <page_insert>
c00054e8:	06051e63          	bnez	a0,c0005564 <pgdir_alloc_page+0xc4>
c00054ec:	00095797          	auipc	a5,0x95
c00054f0:	2b07a783          	lw	a5,688(a5) # c009a79c <swap_init_ok>
c00054f4:	02078863          	beqz	a5,c0005524 <pgdir_alloc_page+0x84>
c00054f8:	00095517          	auipc	a0,0x95
c00054fc:	2f852503          	lw	a0,760(a0) # c009a7f0 <check_mm_struct>
c0005500:	02050263          	beqz	a0,c0005524 <pgdir_alloc_page+0x84>
c0005504:	00000693          	li	a3,0
c0005508:	00040613          	mv	a2,s0
c000550c:	00048593          	mv	a1,s1
c0005510:	b80fe0ef          	jal	ra,c0003890 <swap_map_swappable>
c0005514:	00042703          	lw	a4,0(s0)
c0005518:	00942e23          	sw	s1,28(s0)
c000551c:	00100793          	li	a5,1
c0005520:	02f71263          	bne	a4,a5,c0005544 <pgdir_alloc_page+0xa4>
c0005524:	01c12083          	lw	ra,28(sp)
c0005528:	00040513          	mv	a0,s0
c000552c:	01412483          	lw	s1,20(sp)
c0005530:	01812403          	lw	s0,24(sp)
c0005534:	01012903          	lw	s2,16(sp)
c0005538:	00c12983          	lw	s3,12(sp)
c000553c:	02010113          	addi	sp,sp,32
c0005540:	00008067          	ret
c0005544:	00010697          	auipc	a3,0x10
c0005548:	e3468693          	addi	a3,a3,-460 # c0015378 <default_pmm_manager+0x88>
c000554c:	0000f617          	auipc	a2,0xf
c0005550:	8d060613          	addi	a2,a2,-1840 # c0013e1c <commands+0x164>
c0005554:	1fe00593          	li	a1,510
c0005558:	00010517          	auipc	a0,0x10
c000555c:	e1050513          	addi	a0,a0,-496 # c0015368 <default_pmm_manager+0x78>
c0005560:	d65fa0ef          	jal	ra,c00002c4 <__panic>
c0005564:	00040513          	mv	a0,s0
c0005568:	00100593          	li	a1,1
c000556c:	c54ff0ef          	jal	ra,c00049c0 <free_pages>
c0005570:	00000413          	li	s0,0
c0005574:	fb1ff06f          	j	c0005524 <pgdir_alloc_page+0x84>

c0005578 <print_pgdir>:
c0005578:	fa010113          	addi	sp,sp,-96
c000557c:	00010517          	auipc	a0,0x10
c0005580:	36c50513          	addi	a0,a0,876 # c00158e8 <default_pmm_manager+0x5f8>
c0005584:	05212823          	sw	s2,80(sp)
c0005588:	04112e23          	sw	ra,92(sp)
c000558c:	04812c23          	sw	s0,88(sp)
c0005590:	04912a23          	sw	s1,84(sp)
c0005594:	05312623          	sw	s3,76(sp)
c0005598:	05412423          	sw	s4,72(sp)
c000559c:	05512223          	sw	s5,68(sp)
c00055a0:	05612023          	sw	s6,64(sp)
c00055a4:	03712e23          	sw	s7,60(sp)
c00055a8:	03812c23          	sw	s8,56(sp)
c00055ac:	03912a23          	sw	s9,52(sp)
c00055b0:	03a12823          	sw	s10,48(sp)
c00055b4:	03b12623          	sw	s11,44(sp)
c00055b8:	b91fa0ef          	jal	ra,c0000148 <cprintf>
c00055bc:	00000593          	li	a1,0
c00055c0:	00012a23          	sw	zero,20(sp)
c00055c4:	02d00913          	li	s2,45
c00055c8:	01410713          	addi	a4,sp,20
c00055cc:	01010693          	addi	a3,sp,16
c00055d0:	fafec637          	lui	a2,0xfafec
c00055d4:	40000513          	li	a0,1024
c00055d8:	a68ff0ef          	jal	ra,c0004840 <get_pgtable_items.isra.4.part.5>
c00055dc:	00050413          	mv	s0,a0
c00055e0:	08050263          	beqz	a0,c0005664 <print_pgdir+0xec>
c00055e4:	01412583          	lw	a1,20(sp)
c00055e8:	01012783          	lw	a5,16(sp)
c00055ec:	01047513          	andi	a0,s0,16
c00055f0:	01659693          	slli	a3,a1,0x16
c00055f4:	40f585b3          	sub	a1,a1,a5
c00055f8:	01679613          	slli	a2,a5,0x16
c00055fc:	01659713          	slli	a4,a1,0x16
c0005600:	00090313          	mv	t1,s2
c0005604:	00050463          	beqz	a0,c000560c <print_pgdir+0x94>
c0005608:	07500313          	li	t1,117
c000560c:	00095b17          	auipc	s6,0x95
c0005610:	19cb0b13          	addi	s6,s6,412 # c009a7a8 <str.1969>
c0005614:	07200793          	li	a5,114
c0005618:	006b0023          	sb	t1,0(s6)
c000561c:	00fb00a3          	sb	a5,1(s6)
c0005620:	00447793          	andi	a5,s0,4
c0005624:	00090313          	mv	t1,s2
c0005628:	00078463          	beqz	a5,c0005630 <print_pgdir+0xb8>
c000562c:	07700313          	li	t1,119
c0005630:	00095797          	auipc	a5,0x95
c0005634:	17878793          	addi	a5,a5,376 # c009a7a8 <str.1969>
c0005638:	00010517          	auipc	a0,0x10
c000563c:	2e450513          	addi	a0,a0,740 # c001591c <default_pmm_manager+0x62c>
c0005640:	006b0123          	sb	t1,2(s6)
c0005644:	000b01a3          	sb	zero,3(s6)
c0005648:	b01fa0ef          	jal	ra,c0000148 <cprintf>
c000564c:	00f47413          	andi	s0,s0,15
c0005650:	00100793          	li	a5,1
c0005654:	04f40c63          	beq	s0,a5,c00056ac <print_pgdir+0x134>
c0005658:	01412583          	lw	a1,20(sp)
c000565c:	3ff00793          	li	a5,1023
c0005660:	f6b7f4e3          	bleu	a1,a5,c00055c8 <print_pgdir+0x50>
c0005664:	00010517          	auipc	a0,0x10
c0005668:	2fc50513          	addi	a0,a0,764 # c0015960 <default_pmm_manager+0x670>
c000566c:	addfa0ef          	jal	ra,c0000148 <cprintf>
c0005670:	05c12083          	lw	ra,92(sp)
c0005674:	05812403          	lw	s0,88(sp)
c0005678:	05412483          	lw	s1,84(sp)
c000567c:	05012903          	lw	s2,80(sp)
c0005680:	04c12983          	lw	s3,76(sp)
c0005684:	04812a03          	lw	s4,72(sp)
c0005688:	04412a83          	lw	s5,68(sp)
c000568c:	04012b03          	lw	s6,64(sp)
c0005690:	03c12b83          	lw	s7,60(sp)
c0005694:	03812c03          	lw	s8,56(sp)
c0005698:	03412c83          	lw	s9,52(sp)
c000569c:	03012d03          	lw	s10,48(sp)
c00056a0:	02c12d83          	lw	s11,44(sp)
c00056a4:	06010113          	addi	sp,sp,96
c00056a8:	00008067          	ret
c00056ac:	01012783          	lw	a5,16(sp)
c00056b0:	00000413          	li	s0,0
c00056b4:	00a79c93          	slli	s9,a5,0xa
c00056b8:	00c79313          	slli	t1,a5,0xc
c00056bc:	00279d93          	slli	s11,a5,0x2
c00056c0:	00f12623          	sw	a5,12(sp)
c00056c4:	fafec7b7          	lui	a5,0xfafec
c00056c8:	01912e23          	sw	s9,28(sp)
c00056cc:	40600ab3          	neg	s5,t1
c00056d0:	400c8c93          	addi	s9,s9,1024 # fff80400 <sbi_remote_fence_i+0xfff80b10>
c00056d4:	00fd8db3          	add	s11,s11,a5
c00056d8:	0140006f          	j	c00056ec <print_pgdir+0x174>
c00056dc:	fffff7b7          	lui	a5,0xfffff
c00056e0:	00fa8ab3          	add	s5,s5,a5
c00056e4:	400c8c93          	addi	s9,s9,1024
c00056e8:	004d8d93          	addi	s11,s11,4
c00056ec:	01412583          	lw	a1,20(sp)
c00056f0:	00c12783          	lw	a5,12(sp)
c00056f4:	10b7fa63          	bleu	a1,a5,c0005808 <print_pgdir+0x290>
c00056f8:	00178793          	addi	a5,a5,1 # fffff001 <sbi_remote_fence_i+0xfffff711>
c00056fc:	00f12623          	sw	a5,12(sp)
c0005700:	000da783          	lw	a5,0(s11)
c0005704:	fffff4b7          	lui	s1,0xfffff
c0005708:	00095717          	auipc	a4,0x95
c000570c:	09c72703          	lw	a4,156(a4) # c009a7a4 <npage>
c0005710:	00279793          	slli	a5,a5,0x2
c0005714:	0097f7b3          	and	a5,a5,s1
c0005718:	00c7d693          	srli	a3,a5,0xc
c000571c:	01c12583          	lw	a1,28(sp)
c0005720:	07700a13          	li	s4,119
c0005724:	00095997          	auipc	s3,0x95
c0005728:	08498993          	addi	s3,s3,132 # c009a7a8 <str.1969>
c000572c:	0ae6fc63          	bleu	a4,a3,c00057e4 <print_pgdir+0x26c>
c0005730:	fb95f6e3          	bleu	s9,a1,c00056dc <print_pgdir+0x164>
c0005734:	00095697          	auipc	a3,0x95
c0005738:	1746a683          	lw	a3,372(a3) # c009a8a8 <va_pa_offset>
c000573c:	00d787b3          	add	a5,a5,a3
c0005740:	01c10713          	addi	a4,sp,28
c0005744:	01810693          	addi	a3,sp,24
c0005748:	01578633          	add	a2,a5,s5
c000574c:	000c8513          	mv	a0,s9
c0005750:	8f0ff0ef          	jal	ra,c0004840 <get_pgtable_items.isra.4.part.5>
c0005754:	00050d13          	mv	s10,a0
c0005758:	f80502e3          	beqz	a0,c00056dc <print_pgdir+0x164>
c000575c:	0aa40263          	beq	s0,a0,c0005800 <print_pgdir+0x288>
c0005760:	04040c63          	beqz	s0,c00057b8 <print_pgdir+0x240>
c0005764:	417c05b3          	sub	a1,s8,s7
c0005768:	01047793          	andi	a5,s0,16
c000576c:	00cb9613          	slli	a2,s7,0xc
c0005770:	00cc1693          	slli	a3,s8,0xc
c0005774:	00c59713          	slli	a4,a1,0xc
c0005778:	00090513          	mv	a0,s2
c000577c:	00078463          	beqz	a5,c0005784 <print_pgdir+0x20c>
c0005780:	07500513          	li	a0,117
c0005784:	07200793          	li	a5,114
c0005788:	00ab0023          	sb	a0,0(s6)
c000578c:	00fb00a3          	sb	a5,1(s6)
c0005790:	00447413          	andi	s0,s0,4
c0005794:	000a0e13          	mv	t3,s4
c0005798:	00041463          	bnez	s0,c00057a0 <print_pgdir+0x228>
c000579c:	00090e13          	mv	t3,s2
c00057a0:	00098793          	mv	a5,s3
c00057a4:	00010517          	auipc	a0,0x10
c00057a8:	19850513          	addi	a0,a0,408 # c001593c <default_pmm_manager+0x64c>
c00057ac:	01cb0123          	sb	t3,2(s6)
c00057b0:	000b01a3          	sb	zero,3(s6)
c00057b4:	995fa0ef          	jal	ra,c0000148 <cprintf>
c00057b8:	01812b83          	lw	s7,24(sp)
c00057bc:	01c12c03          	lw	s8,28(sp)
c00057c0:	000da783          	lw	a5,0(s11)
c00057c4:	00095717          	auipc	a4,0x95
c00057c8:	fe072703          	lw	a4,-32(a4) # c009a7a4 <npage>
c00057cc:	000c0593          	mv	a1,s8
c00057d0:	00279793          	slli	a5,a5,0x2
c00057d4:	0097f7b3          	and	a5,a5,s1
c00057d8:	00c7d693          	srli	a3,a5,0xc
c00057dc:	000d0413          	mv	s0,s10
c00057e0:	f4e6e8e3          	bltu	a3,a4,c0005730 <print_pgdir+0x1b8>
c00057e4:	00078693          	mv	a3,a5
c00057e8:	0000f617          	auipc	a2,0xf
c00057ec:	39860613          	addi	a2,a2,920 # c0014b80 <commands+0xec8>
c00057f0:	2ad00593          	li	a1,685
c00057f4:	00010517          	auipc	a0,0x10
c00057f8:	b7450513          	addi	a0,a0,-1164 # c0015368 <default_pmm_manager+0x78>
c00057fc:	ac9fa0ef          	jal	ra,c00002c4 <__panic>
c0005800:	01c12c03          	lw	s8,28(sp)
c0005804:	fbdff06f          	j	c00057c0 <print_pgdir+0x248>
c0005808:	e4040ae3          	beqz	s0,c000565c <print_pgdir+0xe4>
c000580c:	417c05b3          	sub	a1,s8,s7
c0005810:	01047793          	andi	a5,s0,16
c0005814:	00cb9613          	slli	a2,s7,0xc
c0005818:	00cc1693          	slli	a3,s8,0xc
c000581c:	00c59713          	slli	a4,a1,0xc
c0005820:	00090513          	mv	a0,s2
c0005824:	00078463          	beqz	a5,c000582c <print_pgdir+0x2b4>
c0005828:	07500513          	li	a0,117
c000582c:	07200793          	li	a5,114
c0005830:	00ab0023          	sb	a0,0(s6)
c0005834:	00fb00a3          	sb	a5,1(s6)
c0005838:	00447413          	andi	s0,s0,4
c000583c:	00090313          	mv	t1,s2
c0005840:	00040463          	beqz	s0,c0005848 <print_pgdir+0x2d0>
c0005844:	07700313          	li	t1,119
c0005848:	00095797          	auipc	a5,0x95
c000584c:	f6078793          	addi	a5,a5,-160 # c009a7a8 <str.1969>
c0005850:	00010517          	auipc	a0,0x10
c0005854:	0ec50513          	addi	a0,a0,236 # c001593c <default_pmm_manager+0x64c>
c0005858:	006b0123          	sb	t1,2(s6)
c000585c:	000b01a3          	sb	zero,3(s6)
c0005860:	8e9fa0ef          	jal	ra,c0000148 <cprintf>
c0005864:	df5ff06f          	j	c0005658 <print_pgdir+0xe0>

c0005868 <pmm_init>:
c0005868:	fd010113          	addi	sp,sp,-48
c000586c:	00010597          	auipc	a1,0x10
c0005870:	a845a583          	lw	a1,-1404(a1) # c00152f0 <default_pmm_manager>
c0005874:	00010797          	auipc	a5,0x10
c0005878:	a7c78793          	addi	a5,a5,-1412 # c00152f0 <default_pmm_manager>
c000587c:	00010517          	auipc	a0,0x10
c0005880:	b1050513          	addi	a0,a0,-1264 # c001538c <default_pmm_manager+0x9c>
c0005884:	02112623          	sw	ra,44(sp)
c0005888:	02812423          	sw	s0,40(sp)
c000588c:	02912223          	sw	s1,36(sp)
c0005890:	03212023          	sw	s2,32(sp)
c0005894:	01312e23          	sw	s3,28(sp)
c0005898:	00095297          	auipc	t0,0x95
c000589c:	00f2a623          	sw	a5,12(t0) # c009a8a4 <pmm_manager>
c00058a0:	8a9fa0ef          	jal	ra,c0000148 <cprintf>
c00058a4:	00095797          	auipc	a5,0x95
c00058a8:	0007a783          	lw	a5,0(a5) # c009a8a4 <pmm_manager>
c00058ac:	0047a783          	lw	a5,4(a5)
c00058b0:	000780e7          	jalr	a5
c00058b4:	3fffa317          	auipc	t1,0x3fffa
c00058b8:	f4c300e7          	jalr	-180(t1) # fffff800 <sbi_hart_id>
c00058bc:	00410593          	addi	a1,sp,4
c00058c0:	3fffa317          	auipc	t1,0x3fffa
c00058c4:	f60300e7          	jalr	-160(t1) # fffff820 <sbi_query_memory>
c00058c8:	360510e3          	bnez	a0,c0006428 <pmm_init+0xbc0>
c00058cc:	00412403          	lw	s0,4(sp)
c00058d0:	00812903          	lw	s2,8(sp)
c00058d4:	c00007b7          	lui	a5,0xc0000
c00058d8:	408787b3          	sub	a5,a5,s0
c00058dc:	00010517          	auipc	a0,0x10
c00058e0:	af450513          	addi	a0,a0,-1292 # c00153d0 <default_pmm_manager+0xe0>
c00058e4:	00095297          	auipc	t0,0x95
c00058e8:	fcf2a223          	sw	a5,-60(t0) # c009a8a8 <va_pa_offset>
c00058ec:	012404b3          	add	s1,s0,s2
c00058f0:	859fa0ef          	jal	ra,c0000148 <cprintf>
c00058f4:	fff48693          	addi	a3,s1,-1 # ffffefff <sbi_remote_fence_i+0xfffff70f>
c00058f8:	00040613          	mv	a2,s0
c00058fc:	00090593          	mv	a1,s2
c0005900:	00010517          	auipc	a0,0x10
c0005904:	ae850513          	addi	a0,a0,-1304 # c00153e8 <default_pmm_manager+0xf8>
c0005908:	841fa0ef          	jal	ra,c0000148 <cprintf>
c000590c:	f80007b7          	lui	a5,0xf8000
c0005910:	00048693          	mv	a3,s1
c0005914:	0097f463          	bleu	s1,a5,c000591c <pmm_init+0xb4>
c0005918:	00078693          	mv	a3,a5
c000591c:	00c6d693          	srli	a3,a3,0xc
c0005920:	00095297          	auipc	t0,0x95
c0005924:	e8d2a223          	sw	a3,-380(t0) # c009a7a4 <npage>
c0005928:	180027f3          	csrr	a5,sptbr
c000592c:	00100737          	lui	a4,0x100
c0005930:	fff70713          	addi	a4,a4,-1 # fffff <_binary_bin_sfs_img_size+0x8acff>
c0005934:	00e7f733          	and	a4,a5,a4
c0005938:	00c79793          	slli	a5,a5,0xc
c000593c:	40d77ee3          	bleu	a3,a4,c0006558 <pmm_init+0xcf0>
c0005940:	00095417          	auipc	s0,0x95
c0005944:	f6842403          	lw	s0,-152(s0) # c009a8a8 <va_pa_offset>
c0005948:	00002737          	lui	a4,0x2
c000594c:	008787b3          	add	a5,a5,s0
c0005950:	00e787b3          	add	a5,a5,a4
c0005954:	00001737          	lui	a4,0x1
c0005958:	fff70713          	addi	a4,a4,-1 # fff <_binary_bin_swap_img_size-0x6d01>
c000595c:	00e787b3          	add	a5,a5,a4
c0005960:	fffff737          	lui	a4,0xfffff
c0005964:	00e7f7b3          	and	a5,a5,a4
c0005968:	00095297          	auipc	t0,0x95
c000596c:	f4f2a423          	sw	a5,-184(t0) # c009a8b0 <pages>
c0005970:	000805b7          	lui	a1,0x80
c0005974:	6ab68863          	beq	a3,a1,c0006024 <pmm_init+0x7bc>
c0005978:	00095517          	auipc	a0,0x95
c000597c:	e2c52503          	lw	a0,-468(a0) # c009a7a4 <npage>
c0005980:	00000713          	li	a4,0
c0005984:	00078613          	mv	a2,a5
c0005988:	00100813          	li	a6,1
c000598c:	40b505b3          	sub	a1,a0,a1
c0005990:	0080006f          	j	c0005998 <pmm_init+0x130>
c0005994:	00060793          	mv	a5,a2
c0005998:	00571693          	slli	a3,a4,0x5
c000599c:	00d787b3          	add	a5,a5,a3
c00059a0:	00478793          	addi	a5,a5,4 # f8000004 <sbi_remote_fence_i+0xf8000714>
c00059a4:	4107a02f          	amoor.w	zero,a6,(a5)
c00059a8:	00170713          	addi	a4,a4,1 # fffff001 <sbi_remote_fence_i+0xfffff711>
c00059ac:	00050693          	mv	a3,a0
c00059b0:	feb762e3          	bltu	a4,a1,c0005994 <pmm_init+0x12c>
c00059b4:	07f807b7          	lui	a5,0x7f80
c00059b8:	00f687b3          	add	a5,a3,a5
c00059bc:	00579793          	slli	a5,a5,0x5
c00059c0:	00f607b3          	add	a5,a2,a5
c00059c4:	c0000737          	lui	a4,0xc0000
c00059c8:	3ce7e6e3          	bltu	a5,a4,c0006594 <pmm_init+0xd2c>
c00059cc:	00001937          	lui	s2,0x1
c00059d0:	40878433          	sub	s0,a5,s0
c00059d4:	fff90913          	addi	s2,s2,-1 # fff <_binary_bin_swap_img_size-0x6d01>
c00059d8:	fffff7b7          	lui	a5,0xfffff
c00059dc:	01240933          	add	s2,s0,s2
c00059e0:	00f4f4b3          	and	s1,s1,a5
c00059e4:	00f979b3          	and	s3,s2,a5
c00059e8:	00048613          	mv	a2,s1
c00059ec:	00098593          	mv	a1,s3
c00059f0:	00010517          	auipc	a0,0x10
c00059f4:	a2050513          	addi	a0,a0,-1504 # c0015410 <default_pmm_manager+0x120>
c00059f8:	f50fa0ef          	jal	ra,c0000148 <cprintf>
c00059fc:	04947263          	bleu	s1,s0,c0005a40 <pmm_init+0x1d8>
c0005a00:	00c95913          	srli	s2,s2,0xc
c0005a04:	00095797          	auipc	a5,0x95
c0005a08:	da07a783          	lw	a5,-608(a5) # c009a7a4 <npage>
c0005a0c:	10f976e3          	bleu	a5,s2,c0006318 <pmm_init+0xab0>
c0005a10:	fff807b7          	lui	a5,0xfff80
c0005a14:	00f90933          	add	s2,s2,a5
c0005a18:	00095797          	auipc	a5,0x95
c0005a1c:	e8c7a783          	lw	a5,-372(a5) # c009a8a4 <pmm_manager>
c0005a20:	0087a703          	lw	a4,8(a5)
c0005a24:	413484b3          	sub	s1,s1,s3
c0005a28:	00591913          	slli	s2,s2,0x5
c0005a2c:	00095517          	auipc	a0,0x95
c0005a30:	e8452503          	lw	a0,-380(a0) # c009a8b0 <pages>
c0005a34:	00c4d593          	srli	a1,s1,0xc
c0005a38:	01250533          	add	a0,a0,s2
c0005a3c:	000700e7          	jalr	a4
c0005a40:	00095797          	auipc	a5,0x95
c0005a44:	e647a783          	lw	a5,-412(a5) # c009a8a4 <pmm_manager>
c0005a48:	0187a783          	lw	a5,24(a5)
c0005a4c:	000780e7          	jalr	a5
c0005a50:	00010517          	auipc	a0,0x10
c0005a54:	9e450513          	addi	a0,a0,-1564 # c0015434 <default_pmm_manager+0x144>
c0005a58:	ef0fa0ef          	jal	ra,c0000148 <cprintf>
c0005a5c:	00100513          	li	a0,1
c0005a60:	eadfe0ef          	jal	ra,c000490c <alloc_pages>
c0005a64:	08050ee3          	beqz	a0,c0006300 <pmm_init+0xa98>
c0005a68:	00095797          	auipc	a5,0x95
c0005a6c:	e487a783          	lw	a5,-440(a5) # c009a8b0 <pages>
c0005a70:	40f507b3          	sub	a5,a0,a5
c0005a74:	00080737          	lui	a4,0x80
c0005a78:	4057d793          	srai	a5,a5,0x5
c0005a7c:	00e787b3          	add	a5,a5,a4
c0005a80:	00100737          	lui	a4,0x100
c0005a84:	fff70713          	addi	a4,a4,-1 # fffff <_binary_bin_sfs_img_size+0x8acff>
c0005a88:	00e7f733          	and	a4,a5,a4
c0005a8c:	00095697          	auipc	a3,0x95
c0005a90:	d186a683          	lw	a3,-744(a3) # c009a7a4 <npage>
c0005a94:	00c79793          	slli	a5,a5,0xc
c0005a98:	7cd77663          	bleu	a3,a4,c0006264 <pmm_init+0x9fc>
c0005a9c:	00095717          	auipc	a4,0x95
c0005aa0:	e0c72703          	lw	a4,-500(a4) # c009a8a8 <va_pa_offset>
c0005aa4:	00e787b3          	add	a5,a5,a4
c0005aa8:	00078513          	mv	a0,a5
c0005aac:	00001637          	lui	a2,0x1
c0005ab0:	00000593          	li	a1,0
c0005ab4:	00095297          	auipc	t0,0x95
c0005ab8:	cef2a623          	sw	a5,-788(t0) # c009a7a0 <boot_pgdir>
c0005abc:	0fd0d0ef          	jal	ra,c00133b8 <memset>
c0005ac0:	00095517          	auipc	a0,0x95
c0005ac4:	ce052503          	lw	a0,-800(a0) # c009a7a0 <boot_pgdir>
c0005ac8:	c00007b7          	lui	a5,0xc0000
c0005acc:	76f56e63          	bltu	a0,a5,c0006248 <pmm_init+0x9e0>
c0005ad0:	00095797          	auipc	a5,0x95
c0005ad4:	dd87a783          	lw	a5,-552(a5) # c009a8a8 <va_pa_offset>
c0005ad8:	40f507b3          	sub	a5,a0,a5
c0005adc:	00095297          	auipc	t0,0x95
c0005ae0:	dcf2a823          	sw	a5,-560(t0) # c009a8ac <boot_cr3>
c0005ae4:	00095717          	auipc	a4,0x95
c0005ae8:	cc072703          	lw	a4,-832(a4) # c009a7a4 <npage>
c0005aec:	000f87b7          	lui	a5,0xf8
c0005af0:	7ee7e863          	bltu	a5,a4,c00062e0 <pmm_init+0xa78>
c0005af4:	7c050663          	beqz	a0,c00062c0 <pmm_init+0xa58>
c0005af8:	01451793          	slli	a5,a0,0x14
c0005afc:	7c079263          	bnez	a5,c00062c0 <pmm_init+0xa58>
c0005b00:	00000613          	li	a2,0
c0005b04:	00000593          	li	a1,0
c0005b08:	9e4ff0ef          	jal	ra,c0004cec <get_page>
c0005b0c:	78051a63          	bnez	a0,c00062a0 <pmm_init+0xa38>
c0005b10:	00100513          	li	a0,1
c0005b14:	df9fe0ef          	jal	ra,c000490c <alloc_pages>
c0005b18:	00050493          	mv	s1,a0
c0005b1c:	00050593          	mv	a1,a0
c0005b20:	00000693          	li	a3,0
c0005b24:	00000613          	li	a2,0
c0005b28:	00095517          	auipc	a0,0x95
c0005b2c:	c7852503          	lw	a0,-904(a0) # c009a7a0 <boot_pgdir>
c0005b30:	da0ff0ef          	jal	ra,c00050d0 <page_insert>
c0005b34:	74051663          	bnez	a0,c0006280 <pmm_init+0xa18>
c0005b38:	00000613          	li	a2,0
c0005b3c:	00000593          	li	a1,0
c0005b40:	00095517          	auipc	a0,0x95
c0005b44:	c6052503          	lw	a0,-928(a0) # c009a7a0 <boot_pgdir>
c0005b48:	f35fe0ef          	jal	ra,c0004a7c <get_pte>
c0005b4c:	060500e3          	beqz	a0,c00063ac <pmm_init+0xb44>
c0005b50:	00052783          	lw	a5,0(a0)
c0005b54:	0017f713          	andi	a4,a5,1
c0005b58:	02070ee3          	beqz	a4,c0006394 <pmm_init+0xb2c>
c0005b5c:	00279793          	slli	a5,a5,0x2
c0005b60:	00c7d793          	srli	a5,a5,0xc
c0005b64:	00095617          	auipc	a2,0x95
c0005b68:	c4062603          	lw	a2,-960(a2) # c009a7a4 <npage>
c0005b6c:	7ac7f663          	bleu	a2,a5,c0006318 <pmm_init+0xab0>
c0005b70:	fff80737          	lui	a4,0xfff80
c0005b74:	00e787b3          	add	a5,a5,a4
c0005b78:	00579793          	slli	a5,a5,0x5
c0005b7c:	00095717          	auipc	a4,0x95
c0005b80:	d3472703          	lw	a4,-716(a4) # c009a8b0 <pages>
c0005b84:	00f707b3          	add	a5,a4,a5
c0005b88:	7ef49663          	bne	s1,a5,c0006374 <pmm_init+0xb0c>
c0005b8c:	0004a903          	lw	s2,0(s1)
c0005b90:	00100793          	li	a5,1
c0005b94:	7cf91063          	bne	s2,a5,c0006354 <pmm_init+0xaec>
c0005b98:	00095517          	auipc	a0,0x95
c0005b9c:	c0852503          	lw	a0,-1016(a0) # c009a7a0 <boot_pgdir>
c0005ba0:	00052683          	lw	a3,0(a0)
c0005ba4:	fffff7b7          	lui	a5,0xfffff
c0005ba8:	00269693          	slli	a3,a3,0x2
c0005bac:	00f6f6b3          	and	a3,a3,a5
c0005bb0:	00c6d793          	srli	a5,a3,0xc
c0005bb4:	78c7f463          	bleu	a2,a5,c000633c <pmm_init+0xad4>
c0005bb8:	00095417          	auipc	s0,0x95
c0005bbc:	cf042403          	lw	s0,-784(s0) # c009a8a8 <va_pa_offset>
c0005bc0:	008686b3          	add	a3,a3,s0
c0005bc4:	00000613          	li	a2,0
c0005bc8:	000015b7          	lui	a1,0x1
c0005bcc:	00468413          	addi	s0,a3,4
c0005bd0:	eadfe0ef          	jal	ra,c0004a7c <get_pte>
c0005bd4:	74a41463          	bne	s0,a0,c000631c <pmm_init+0xab4>
c0005bd8:	00090513          	mv	a0,s2
c0005bdc:	d31fe0ef          	jal	ra,c000490c <alloc_pages>
c0005be0:	00050413          	mv	s0,a0
c0005be4:	00050593          	mv	a1,a0
c0005be8:	01400693          	li	a3,20
c0005bec:	00001637          	lui	a2,0x1
c0005bf0:	00095517          	auipc	a0,0x95
c0005bf4:	bb052503          	lw	a0,-1104(a0) # c009a7a0 <boot_pgdir>
c0005bf8:	cd8ff0ef          	jal	ra,c00050d0 <page_insert>
c0005bfc:	7e051863          	bnez	a0,c00063ec <pmm_init+0xb84>
c0005c00:	00000613          	li	a2,0
c0005c04:	000015b7          	lui	a1,0x1
c0005c08:	00095517          	auipc	a0,0x95
c0005c0c:	b9852503          	lw	a0,-1128(a0) # c009a7a0 <boot_pgdir>
c0005c10:	e6dfe0ef          	jal	ra,c0004a7c <get_pte>
c0005c14:	7a050c63          	beqz	a0,c00063cc <pmm_init+0xb64>
c0005c18:	00052783          	lw	a5,0(a0)
c0005c1c:	0107f713          	andi	a4,a5,16
c0005c20:	5c070463          	beqz	a4,c00061e8 <pmm_init+0x980>
c0005c24:	0047f793          	andi	a5,a5,4
c0005c28:	5a078063          	beqz	a5,c00061c8 <pmm_init+0x960>
c0005c2c:	00095517          	auipc	a0,0x95
c0005c30:	b7452503          	lw	a0,-1164(a0) # c009a7a0 <boot_pgdir>
c0005c34:	00052783          	lw	a5,0(a0)
c0005c38:	0107f793          	andi	a5,a5,16
c0005c3c:	56078663          	beqz	a5,c00061a8 <pmm_init+0x940>
c0005c40:	00042903          	lw	s2,0(s0)
c0005c44:	00100793          	li	a5,1
c0005c48:	54f91063          	bne	s2,a5,c0006188 <pmm_init+0x920>
c0005c4c:	00000693          	li	a3,0
c0005c50:	00001637          	lui	a2,0x1
c0005c54:	00048593          	mv	a1,s1
c0005c58:	c78ff0ef          	jal	ra,c00050d0 <page_insert>
c0005c5c:	50051663          	bnez	a0,c0006168 <pmm_init+0x900>
c0005c60:	0004a703          	lw	a4,0(s1)
c0005c64:	00200793          	li	a5,2
c0005c68:	4ef71063          	bne	a4,a5,c0006148 <pmm_init+0x8e0>
c0005c6c:	00042783          	lw	a5,0(s0)
c0005c70:	4a079c63          	bnez	a5,c0006128 <pmm_init+0x8c0>
c0005c74:	00000613          	li	a2,0
c0005c78:	000015b7          	lui	a1,0x1
c0005c7c:	00095517          	auipc	a0,0x95
c0005c80:	b2452503          	lw	a0,-1244(a0) # c009a7a0 <boot_pgdir>
c0005c84:	df9fe0ef          	jal	ra,c0004a7c <get_pte>
c0005c88:	48050063          	beqz	a0,c0006108 <pmm_init+0x8a0>
c0005c8c:	00052703          	lw	a4,0(a0)
c0005c90:	00177793          	andi	a5,a4,1
c0005c94:	70078063          	beqz	a5,c0006394 <pmm_init+0xb2c>
c0005c98:	00271793          	slli	a5,a4,0x2
c0005c9c:	00c7d793          	srli	a5,a5,0xc
c0005ca0:	00095697          	auipc	a3,0x95
c0005ca4:	b046a683          	lw	a3,-1276(a3) # c009a7a4 <npage>
c0005ca8:	66d7f863          	bleu	a3,a5,c0006318 <pmm_init+0xab0>
c0005cac:	fff806b7          	lui	a3,0xfff80
c0005cb0:	00d787b3          	add	a5,a5,a3
c0005cb4:	00579793          	slli	a5,a5,0x5
c0005cb8:	00095697          	auipc	a3,0x95
c0005cbc:	bf86a683          	lw	a3,-1032(a3) # c009a8b0 <pages>
c0005cc0:	00f687b3          	add	a5,a3,a5
c0005cc4:	42f49263          	bne	s1,a5,c00060e8 <pmm_init+0x880>
c0005cc8:	01077713          	andi	a4,a4,16
c0005ccc:	3e071e63          	bnez	a4,c00060c8 <pmm_init+0x860>
c0005cd0:	00000593          	li	a1,0
c0005cd4:	00095517          	auipc	a0,0x95
c0005cd8:	acc52503          	lw	a0,-1332(a0) # c009a7a0 <boot_pgdir>
c0005cdc:	b48ff0ef          	jal	ra,c0005024 <page_remove>
c0005ce0:	0004a783          	lw	a5,0(s1)
c0005ce4:	3d279263          	bne	a5,s2,c00060a8 <pmm_init+0x840>
c0005ce8:	00042783          	lw	a5,0(s0)
c0005cec:	38079e63          	bnez	a5,c0006088 <pmm_init+0x820>
c0005cf0:	000015b7          	lui	a1,0x1
c0005cf4:	00095517          	auipc	a0,0x95
c0005cf8:	aac52503          	lw	a0,-1364(a0) # c009a7a0 <boot_pgdir>
c0005cfc:	b28ff0ef          	jal	ra,c0005024 <page_remove>
c0005d00:	0004a783          	lw	a5,0(s1)
c0005d04:	52079263          	bnez	a5,c0006228 <pmm_init+0x9c0>
c0005d08:	00042783          	lw	a5,0(s0)
c0005d0c:	4e079e63          	bnez	a5,c0006208 <pmm_init+0x9a0>
c0005d10:	00095797          	auipc	a5,0x95
c0005d14:	a907a783          	lw	a5,-1392(a5) # c009a7a0 <boot_pgdir>
c0005d18:	0007a783          	lw	a5,0(a5)
c0005d1c:	00095717          	auipc	a4,0x95
c0005d20:	a8872703          	lw	a4,-1400(a4) # c009a7a4 <npage>
c0005d24:	00279793          	slli	a5,a5,0x2
c0005d28:	00c7d793          	srli	a5,a5,0xc
c0005d2c:	5ee7f663          	bleu	a4,a5,c0006318 <pmm_init+0xab0>
c0005d30:	fff80737          	lui	a4,0xfff80
c0005d34:	00e787b3          	add	a5,a5,a4
c0005d38:	00579793          	slli	a5,a5,0x5
c0005d3c:	00095517          	auipc	a0,0x95
c0005d40:	b7452503          	lw	a0,-1164(a0) # c009a8b0 <pages>
c0005d44:	00f50533          	add	a0,a0,a5
c0005d48:	00052583          	lw	a1,0(a0)
c0005d4c:	00100793          	li	a5,1
c0005d50:	78f59463          	bne	a1,a5,c00064d8 <pmm_init+0xc70>
c0005d54:	c6dfe0ef          	jal	ra,c00049c0 <free_pages>
c0005d58:	00095797          	auipc	a5,0x95
c0005d5c:	a487a783          	lw	a5,-1464(a5) # c009a7a0 <boot_pgdir>
c0005d60:	0007a023          	sw	zero,0(a5)
c0005d64:	00010517          	auipc	a0,0x10
c0005d68:	99450513          	addi	a0,a0,-1644 # c00156f8 <default_pmm_manager+0x408>
c0005d6c:	bdcfa0ef          	jal	ra,c0000148 <cprintf>
c0005d70:	00095797          	auipc	a5,0x95
c0005d74:	b3c7a783          	lw	a5,-1220(a5) # c009a8ac <boot_cr3>
c0005d78:	00c7d793          	srli	a5,a5,0xc
c0005d7c:	00095517          	auipc	a0,0x95
c0005d80:	a2452503          	lw	a0,-1500(a0) # c009a7a0 <boot_pgdir>
c0005d84:	00a79793          	slli	a5,a5,0xa
c0005d88:	00001437          	lui	s0,0x1
c0005d8c:	00850733          	add	a4,a0,s0
c0005d90:	0017e693          	ori	a3,a5,1
c0005d94:	c00005b7          	lui	a1,0xc0000
c0005d98:	0077e793          	ori	a5,a5,7
c0005d9c:	fad72623          	sw	a3,-84(a4) # fff7ffac <sbi_remote_fence_i+0xfff806bc>
c0005da0:	00095697          	auipc	a3,0x95
c0005da4:	b086a683          	lw	a3,-1272(a3) # c009a8a8 <va_pa_offset>
c0005da8:	faf72823          	sw	a5,-80(a4)
c0005dac:	40d586b3          	sub	a3,a1,a3
c0005db0:	00f00713          	li	a4,15
c0005db4:	38000637          	lui	a2,0x38000
c0005db8:	e29fe0ef          	jal	ra,c0004be0 <boot_map_segment>
c0005dbc:	180027f3          	csrr	a5,sptbr
c0005dc0:	00100737          	lui	a4,0x100
c0005dc4:	fff70713          	addi	a4,a4,-1 # fffff <_binary_bin_sfs_img_size+0x8acff>
c0005dc8:	00e7f733          	and	a4,a5,a4
c0005dcc:	00095697          	auipc	a3,0x95
c0005dd0:	9d86a683          	lw	a3,-1576(a3) # c009a7a4 <npage>
c0005dd4:	00c79793          	slli	a5,a5,0xc
c0005dd8:	62d77a63          	bleu	a3,a4,c000640c <pmm_init+0xba4>
c0005ddc:	00095517          	auipc	a0,0x95
c0005de0:	acc52503          	lw	a0,-1332(a0) # c009a8a8 <va_pa_offset>
c0005de4:	00a78533          	add	a0,a5,a0
c0005de8:	00000613          	li	a2,0
c0005dec:	fff00593          	li	a1,-1
c0005df0:	c8dfe0ef          	jal	ra,c0004a7c <get_pte>
c0005df4:	00052683          	lw	a3,0(a0)
c0005df8:	fffff4b7          	lui	s1,0xfffff
c0005dfc:	00b00713          	li	a4,11
c0005e00:	00269693          	slli	a3,a3,0x2
c0005e04:	0096f6b3          	and	a3,a3,s1
c0005e08:	00040613          	mv	a2,s0
c0005e0c:	00048593          	mv	a1,s1
c0005e10:	00095517          	auipc	a0,0x95
c0005e14:	99052503          	lw	a0,-1648(a0) # c009a7a0 <boot_pgdir>
c0005e18:	dc9fe0ef          	jal	ra,c0004be0 <boot_map_segment>
c0005e1c:	00095797          	auipc	a5,0x95
c0005e20:	a907a783          	lw	a5,-1392(a5) # c009a8ac <boot_cr3>
c0005e24:	00c7d793          	srli	a5,a5,0xc
c0005e28:	18079073          	csrw	sptbr,a5
c0005e2c:	00095797          	auipc	a5,0x95
c0005e30:	9787a783          	lw	a5,-1672(a5) # c009a7a4 <npage>
c0005e34:	000c0437          	lui	s0,0xc0
c0005e38:	00095517          	auipc	a0,0x95
c0005e3c:	96852503          	lw	a0,-1688(a0) # c009a7a0 <boot_pgdir>
c0005e40:	00f46c63          	bltu	s0,a5,c0005e58 <pmm_init+0x5f0>
c0005e44:	04c0006f          	j	c0005e90 <pmm_init+0x628>
c0005e48:	00c45793          	srli	a5,s0,0xc
c0005e4c:	00095517          	auipc	a0,0x95
c0005e50:	95452503          	lw	a0,-1708(a0) # c009a7a0 <boot_pgdir>
c0005e54:	1ee7fc63          	bleu	a4,a5,c000604c <pmm_init+0x7e4>
c0005e58:	00095597          	auipc	a1,0x95
c0005e5c:	a505a583          	lw	a1,-1456(a1) # c009a8a8 <va_pa_offset>
c0005e60:	00000613          	li	a2,0
c0005e64:	00b405b3          	add	a1,s0,a1
c0005e68:	c15fe0ef          	jal	ra,c0004a7c <get_pte>
c0005e6c:	1c050063          	beqz	a0,c000602c <pmm_init+0x7c4>
c0005e70:	00052783          	lw	a5,0(a0)
c0005e74:	00279793          	slli	a5,a5,0x2
c0005e78:	0097f7b3          	and	a5,a5,s1
c0005e7c:	1e879663          	bne	a5,s0,c0006068 <pmm_init+0x800>
c0005e80:	00140413          	addi	s0,s0,1 # c0001 <_binary_bin_sfs_img_size+0x4ad01>
c0005e84:	00095717          	auipc	a4,0x95
c0005e88:	92072703          	lw	a4,-1760(a4) # c009a7a4 <npage>
c0005e8c:	fae46ee3          	bltu	s0,a4,c0005e48 <pmm_init+0x5e0>
c0005e90:	00095697          	auipc	a3,0x95
c0005e94:	9106a683          	lw	a3,-1776(a3) # c009a7a0 <boot_pgdir>
c0005e98:	000014b7          	lui	s1,0x1
c0005e9c:	009687b3          	add	a5,a3,s1
c0005ea0:	fac7a783          	lw	a5,-84(a5)
c0005ea4:	fffff637          	lui	a2,0xfffff
c0005ea8:	c0000737          	lui	a4,0xc0000
c0005eac:	00279793          	slli	a5,a5,0x2
c0005eb0:	00c7f7b3          	and	a5,a5,a2
c0005eb4:	60e6e663          	bltu	a3,a4,c00064c0 <pmm_init+0xc58>
c0005eb8:	00095717          	auipc	a4,0x95
c0005ebc:	9f072703          	lw	a4,-1552(a4) # c009a8a8 <va_pa_offset>
c0005ec0:	40e68733          	sub	a4,a3,a4
c0005ec4:	5ce79e63          	bne	a5,a4,c00064a0 <pmm_init+0xc38>
c0005ec8:	0006a783          	lw	a5,0(a3)
c0005ecc:	5a079a63          	bnez	a5,c0006480 <pmm_init+0xc18>
c0005ed0:	00100513          	li	a0,1
c0005ed4:	a39fe0ef          	jal	ra,c000490c <alloc_pages>
c0005ed8:	00050413          	mv	s0,a0
c0005edc:	00050593          	mv	a1,a0
c0005ee0:	00600693          	li	a3,6
c0005ee4:	10000613          	li	a2,256
c0005ee8:	00095517          	auipc	a0,0x95
c0005eec:	8b852503          	lw	a0,-1864(a0) # c009a7a0 <boot_pgdir>
c0005ef0:	9e0ff0ef          	jal	ra,c00050d0 <page_insert>
c0005ef4:	56051663          	bnez	a0,c0006460 <pmm_init+0xbf8>
c0005ef8:	00042703          	lw	a4,0(s0)
c0005efc:	00100793          	li	a5,1
c0005f00:	62f71c63          	bne	a4,a5,c0006538 <pmm_init+0xcd0>
c0005f04:	00600693          	li	a3,6
c0005f08:	10048613          	addi	a2,s1,256 # 1100 <_binary_bin_swap_img_size-0x6c00>
c0005f0c:	00040593          	mv	a1,s0
c0005f10:	00095517          	auipc	a0,0x95
c0005f14:	89052503          	lw	a0,-1904(a0) # c009a7a0 <boot_pgdir>
c0005f18:	9b8ff0ef          	jal	ra,c00050d0 <page_insert>
c0005f1c:	5e051e63          	bnez	a0,c0006518 <pmm_init+0xcb0>
c0005f20:	00042703          	lw	a4,0(s0)
c0005f24:	00200793          	li	a5,2
c0005f28:	5cf71863          	bne	a4,a5,c00064f8 <pmm_init+0xc90>
c0005f2c:	00010597          	auipc	a1,0x10
c0005f30:	92858593          	addi	a1,a1,-1752 # c0015854 <default_pmm_manager+0x564>
c0005f34:	10000513          	li	a0,256
c0005f38:	4040d0ef          	jal	ra,c001333c <strcpy>
c0005f3c:	10048593          	addi	a1,s1,256
c0005f40:	10000513          	li	a0,256
c0005f44:	4140d0ef          	jal	ra,c0013358 <strcmp>
c0005f48:	62051663          	bnez	a0,c0006574 <pmm_init+0xd0c>
c0005f4c:	00095797          	auipc	a5,0x95
c0005f50:	9647a783          	lw	a5,-1692(a5) # c009a8b0 <pages>
c0005f54:	40f407b3          	sub	a5,s0,a5
c0005f58:	00080737          	lui	a4,0x80
c0005f5c:	4057d793          	srai	a5,a5,0x5
c0005f60:	00e787b3          	add	a5,a5,a4
c0005f64:	00100737          	lui	a4,0x100
c0005f68:	fff70713          	addi	a4,a4,-1 # fffff <_binary_bin_sfs_img_size+0x8acff>
c0005f6c:	00e7f733          	and	a4,a5,a4
c0005f70:	00095697          	auipc	a3,0x95
c0005f74:	8346a683          	lw	a3,-1996(a3) # c009a7a4 <npage>
c0005f78:	00c79793          	slli	a5,a5,0xc
c0005f7c:	2ed77463          	bleu	a3,a4,c0006264 <pmm_init+0x9fc>
c0005f80:	00095717          	auipc	a4,0x95
c0005f84:	92872703          	lw	a4,-1752(a4) # c009a8a8 <va_pa_offset>
c0005f88:	00f707b3          	add	a5,a4,a5
c0005f8c:	10078023          	sb	zero,256(a5)
c0005f90:	10000513          	li	a0,256
c0005f94:	33c0d0ef          	jal	ra,c00132d0 <strlen>
c0005f98:	4a051463          	bnez	a0,c0006440 <pmm_init+0xbd8>
c0005f9c:	00100593          	li	a1,1
c0005fa0:	00040513          	mv	a0,s0
c0005fa4:	a1dfe0ef          	jal	ra,c00049c0 <free_pages>
c0005fa8:	00094797          	auipc	a5,0x94
c0005fac:	7f87a783          	lw	a5,2040(a5) # c009a7a0 <boot_pgdir>
c0005fb0:	0007a783          	lw	a5,0(a5)
c0005fb4:	00094717          	auipc	a4,0x94
c0005fb8:	7f072703          	lw	a4,2032(a4) # c009a7a4 <npage>
c0005fbc:	00279793          	slli	a5,a5,0x2
c0005fc0:	00c7d793          	srli	a5,a5,0xc
c0005fc4:	34e7fa63          	bleu	a4,a5,c0006318 <pmm_init+0xab0>
c0005fc8:	fff80737          	lui	a4,0xfff80
c0005fcc:	00e787b3          	add	a5,a5,a4
c0005fd0:	00579793          	slli	a5,a5,0x5
c0005fd4:	00095517          	auipc	a0,0x95
c0005fd8:	8dc52503          	lw	a0,-1828(a0) # c009a8b0 <pages>
c0005fdc:	00100593          	li	a1,1
c0005fe0:	00f50533          	add	a0,a0,a5
c0005fe4:	9ddfe0ef          	jal	ra,c00049c0 <free_pages>
c0005fe8:	00094797          	auipc	a5,0x94
c0005fec:	7b87a783          	lw	a5,1976(a5) # c009a7a0 <boot_pgdir>
c0005ff0:	0007a023          	sw	zero,0(a5)
c0005ff4:	00010517          	auipc	a0,0x10
c0005ff8:	8d450513          	addi	a0,a0,-1836 # c00158c8 <default_pmm_manager+0x5d8>
c0005ffc:	94cfa0ef          	jal	ra,c0000148 <cprintf>
c0006000:	d78ff0ef          	jal	ra,c0005578 <print_pgdir>
c0006004:	db9fc0ef          	jal	ra,c0002dbc <kmalloc_init>
c0006008:	02c12083          	lw	ra,44(sp)
c000600c:	02812403          	lw	s0,40(sp)
c0006010:	02412483          	lw	s1,36(sp)
c0006014:	02012903          	lw	s2,32(sp)
c0006018:	01c12983          	lw	s3,28(sp)
c000601c:	03010113          	addi	sp,sp,48
c0006020:	00008067          	ret
c0006024:	00078613          	mv	a2,a5
c0006028:	98dff06f          	j	c00059b4 <pmm_init+0x14c>
c000602c:	0000f697          	auipc	a3,0xf
c0006030:	6e868693          	addi	a3,a3,1768 # c0015714 <default_pmm_manager+0x424>
c0006034:	0000e617          	auipc	a2,0xe
c0006038:	de860613          	addi	a2,a2,-536 # c0013e1c <commands+0x164>
c000603c:	24c00593          	li	a1,588
c0006040:	0000f517          	auipc	a0,0xf
c0006044:	32850513          	addi	a0,a0,808 # c0015368 <default_pmm_manager+0x78>
c0006048:	a7cfa0ef          	jal	ra,c00002c4 <__panic>
c000604c:	00040693          	mv	a3,s0
c0006050:	0000f617          	auipc	a2,0xf
c0006054:	b3060613          	addi	a2,a2,-1232 # c0014b80 <commands+0xec8>
c0006058:	24c00593          	li	a1,588
c000605c:	0000f517          	auipc	a0,0xf
c0006060:	30c50513          	addi	a0,a0,780 # c0015368 <default_pmm_manager+0x78>
c0006064:	a60fa0ef          	jal	ra,c00002c4 <__panic>
c0006068:	0000f697          	auipc	a3,0xf
c000606c:	6ec68693          	addi	a3,a3,1772 # c0015754 <default_pmm_manager+0x464>
c0006070:	0000e617          	auipc	a2,0xe
c0006074:	dac60613          	addi	a2,a2,-596 # c0013e1c <commands+0x164>
c0006078:	24d00593          	li	a1,589
c000607c:	0000f517          	auipc	a0,0xf
c0006080:	2ec50513          	addi	a0,a0,748 # c0015368 <default_pmm_manager+0x78>
c0006084:	a40fa0ef          	jal	ra,c00002c4 <__panic>
c0006088:	0000f697          	auipc	a3,0xf
c000608c:	60868693          	addi	a3,a3,1544 # c0015690 <default_pmm_manager+0x3a0>
c0006090:	0000e617          	auipc	a2,0xe
c0006094:	d8c60613          	addi	a2,a2,-628 # c0013e1c <commands+0x164>
c0006098:	23a00593          	li	a1,570
c000609c:	0000f517          	auipc	a0,0xf
c00060a0:	2cc50513          	addi	a0,a0,716 # c0015368 <default_pmm_manager+0x78>
c00060a4:	a20fa0ef          	jal	ra,c00002c4 <__panic>
c00060a8:	0000f697          	auipc	a3,0xf
c00060ac:	4b868693          	addi	a3,a3,1208 # c0015560 <default_pmm_manager+0x270>
c00060b0:	0000e617          	auipc	a2,0xe
c00060b4:	d6c60613          	addi	a2,a2,-660 # c0013e1c <commands+0x164>
c00060b8:	23900593          	li	a1,569
c00060bc:	0000f517          	auipc	a0,0xf
c00060c0:	2ac50513          	addi	a0,a0,684 # c0015368 <default_pmm_manager+0x78>
c00060c4:	a00fa0ef          	jal	ra,c00002c4 <__panic>
c00060c8:	0000f697          	auipc	a3,0xf
c00060cc:	5dc68693          	addi	a3,a3,1500 # c00156a4 <default_pmm_manager+0x3b4>
c00060d0:	0000e617          	auipc	a2,0xe
c00060d4:	d4c60613          	addi	a2,a2,-692 # c0013e1c <commands+0x164>
c00060d8:	23600593          	li	a1,566
c00060dc:	0000f517          	auipc	a0,0xf
c00060e0:	28c50513          	addi	a0,a0,652 # c0015368 <default_pmm_manager+0x78>
c00060e4:	9e0fa0ef          	jal	ra,c00002c4 <__panic>
c00060e8:	0000f697          	auipc	a3,0xf
c00060ec:	46068693          	addi	a3,a3,1120 # c0015548 <default_pmm_manager+0x258>
c00060f0:	0000e617          	auipc	a2,0xe
c00060f4:	d2c60613          	addi	a2,a2,-724 # c0013e1c <commands+0x164>
c00060f8:	23500593          	li	a1,565
c00060fc:	0000f517          	auipc	a0,0xf
c0006100:	26c50513          	addi	a0,a0,620 # c0015368 <default_pmm_manager+0x78>
c0006104:	9c0fa0ef          	jal	ra,c00002c4 <__panic>
c0006108:	0000f697          	auipc	a3,0xf
c000610c:	4cc68693          	addi	a3,a3,1228 # c00155d4 <default_pmm_manager+0x2e4>
c0006110:	0000e617          	auipc	a2,0xe
c0006114:	d0c60613          	addi	a2,a2,-756 # c0013e1c <commands+0x164>
c0006118:	23400593          	li	a1,564
c000611c:	0000f517          	auipc	a0,0xf
c0006120:	24c50513          	addi	a0,a0,588 # c0015368 <default_pmm_manager+0x78>
c0006124:	9a0fa0ef          	jal	ra,c00002c4 <__panic>
c0006128:	0000f697          	auipc	a3,0xf
c000612c:	56868693          	addi	a3,a3,1384 # c0015690 <default_pmm_manager+0x3a0>
c0006130:	0000e617          	auipc	a2,0xe
c0006134:	cec60613          	addi	a2,a2,-788 # c0013e1c <commands+0x164>
c0006138:	23300593          	li	a1,563
c000613c:	0000f517          	auipc	a0,0xf
c0006140:	22c50513          	addi	a0,a0,556 # c0015368 <default_pmm_manager+0x78>
c0006144:	980fa0ef          	jal	ra,c00002c4 <__panic>
c0006148:	0000f697          	auipc	a3,0xf
c000614c:	53468693          	addi	a3,a3,1332 # c001567c <default_pmm_manager+0x38c>
c0006150:	0000e617          	auipc	a2,0xe
c0006154:	ccc60613          	addi	a2,a2,-820 # c0013e1c <commands+0x164>
c0006158:	23200593          	li	a1,562
c000615c:	0000f517          	auipc	a0,0xf
c0006160:	20c50513          	addi	a0,a0,524 # c0015368 <default_pmm_manager+0x78>
c0006164:	960fa0ef          	jal	ra,c00002c4 <__panic>
c0006168:	0000f697          	auipc	a3,0xf
c000616c:	4e868693          	addi	a3,a3,1256 # c0015650 <default_pmm_manager+0x360>
c0006170:	0000e617          	auipc	a2,0xe
c0006174:	cac60613          	addi	a2,a2,-852 # c0013e1c <commands+0x164>
c0006178:	23100593          	li	a1,561
c000617c:	0000f517          	auipc	a0,0xf
c0006180:	1ec50513          	addi	a0,a0,492 # c0015368 <default_pmm_manager+0x78>
c0006184:	940fa0ef          	jal	ra,c00002c4 <__panic>
c0006188:	0000f697          	auipc	a3,0xf
c000618c:	4b468693          	addi	a3,a3,1204 # c001563c <default_pmm_manager+0x34c>
c0006190:	0000e617          	auipc	a2,0xe
c0006194:	c8c60613          	addi	a2,a2,-884 # c0013e1c <commands+0x164>
c0006198:	22f00593          	li	a1,559
c000619c:	0000f517          	auipc	a0,0xf
c00061a0:	1cc50513          	addi	a0,a0,460 # c0015368 <default_pmm_manager+0x78>
c00061a4:	920fa0ef          	jal	ra,c00002c4 <__panic>
c00061a8:	0000f697          	auipc	a3,0xf
c00061ac:	47c68693          	addi	a3,a3,1148 # c0015624 <default_pmm_manager+0x334>
c00061b0:	0000e617          	auipc	a2,0xe
c00061b4:	c6c60613          	addi	a2,a2,-916 # c0013e1c <commands+0x164>
c00061b8:	22e00593          	li	a1,558
c00061bc:	0000f517          	auipc	a0,0xf
c00061c0:	1ac50513          	addi	a0,a0,428 # c0015368 <default_pmm_manager+0x78>
c00061c4:	900fa0ef          	jal	ra,c00002c4 <__panic>
c00061c8:	0000f697          	auipc	a3,0xf
c00061cc:	44c68693          	addi	a3,a3,1100 # c0015614 <default_pmm_manager+0x324>
c00061d0:	0000e617          	auipc	a2,0xe
c00061d4:	c4c60613          	addi	a2,a2,-948 # c0013e1c <commands+0x164>
c00061d8:	22d00593          	li	a1,557
c00061dc:	0000f517          	auipc	a0,0xf
c00061e0:	18c50513          	addi	a0,a0,396 # c0015368 <default_pmm_manager+0x78>
c00061e4:	8e0fa0ef          	jal	ra,c00002c4 <__panic>
c00061e8:	0000f697          	auipc	a3,0xf
c00061ec:	41c68693          	addi	a3,a3,1052 # c0015604 <default_pmm_manager+0x314>
c00061f0:	0000e617          	auipc	a2,0xe
c00061f4:	c2c60613          	addi	a2,a2,-980 # c0013e1c <commands+0x164>
c00061f8:	22c00593          	li	a1,556
c00061fc:	0000f517          	auipc	a0,0xf
c0006200:	16c50513          	addi	a0,a0,364 # c0015368 <default_pmm_manager+0x78>
c0006204:	8c0fa0ef          	jal	ra,c00002c4 <__panic>
c0006208:	0000f697          	auipc	a3,0xf
c000620c:	48868693          	addi	a3,a3,1160 # c0015690 <default_pmm_manager+0x3a0>
c0006210:	0000e617          	auipc	a2,0xe
c0006214:	c0c60613          	addi	a2,a2,-1012 # c0013e1c <commands+0x164>
c0006218:	23e00593          	li	a1,574
c000621c:	0000f517          	auipc	a0,0xf
c0006220:	14c50513          	addi	a0,a0,332 # c0015368 <default_pmm_manager+0x78>
c0006224:	8a0fa0ef          	jal	ra,c00002c4 <__panic>
c0006228:	0000f697          	auipc	a3,0xf
c000622c:	49468693          	addi	a3,a3,1172 # c00156bc <default_pmm_manager+0x3cc>
c0006230:	0000e617          	auipc	a2,0xe
c0006234:	bec60613          	addi	a2,a2,-1044 # c0013e1c <commands+0x164>
c0006238:	23d00593          	li	a1,573
c000623c:	0000f517          	auipc	a0,0xf
c0006240:	12c50513          	addi	a0,a0,300 # c0015368 <default_pmm_manager+0x78>
c0006244:	880fa0ef          	jal	ra,c00002c4 <__panic>
c0006248:	00050693          	mv	a3,a0
c000624c:	0000f617          	auipc	a2,0xf
c0006250:	95860613          	addi	a2,a2,-1704 # c0014ba4 <commands+0xeec>
c0006254:	0d800593          	li	a1,216
c0006258:	0000f517          	auipc	a0,0xf
c000625c:	11050513          	addi	a0,a0,272 # c0015368 <default_pmm_manager+0x78>
c0006260:	864fa0ef          	jal	ra,c00002c4 <__panic>
c0006264:	00078693          	mv	a3,a5
c0006268:	0000f617          	auipc	a2,0xf
c000626c:	91860613          	addi	a2,a2,-1768 # c0014b80 <commands+0xec8>
c0006270:	06e00593          	li	a1,110
c0006274:	0000e517          	auipc	a0,0xe
c0006278:	6a050513          	addi	a0,a0,1696 # c0014914 <commands+0xc5c>
c000627c:	848fa0ef          	jal	ra,c00002c4 <__panic>
c0006280:	0000f697          	auipc	a3,0xf
c0006284:	26c68693          	addi	a3,a3,620 # c00154ec <default_pmm_manager+0x1fc>
c0006288:	0000e617          	auipc	a2,0xe
c000628c:	b9460613          	addi	a2,a2,-1132 # c0013e1c <commands+0x164>
c0006290:	21f00593          	li	a1,543
c0006294:	0000f517          	auipc	a0,0xf
c0006298:	0d450513          	addi	a0,a0,212 # c0015368 <default_pmm_manager+0x78>
c000629c:	828fa0ef          	jal	ra,c00002c4 <__panic>
c00062a0:	0000f697          	auipc	a3,0xf
c00062a4:	22468693          	addi	a3,a3,548 # c00154c4 <default_pmm_manager+0x1d4>
c00062a8:	0000e617          	auipc	a2,0xe
c00062ac:	b7460613          	addi	a2,a2,-1164 # c0013e1c <commands+0x164>
c00062b0:	21b00593          	li	a1,539
c00062b4:	0000f517          	auipc	a0,0xf
c00062b8:	0b450513          	addi	a0,a0,180 # c0015368 <default_pmm_manager+0x78>
c00062bc:	808fa0ef          	jal	ra,c00002c4 <__panic>
c00062c0:	0000f697          	auipc	a3,0xf
c00062c4:	1cc68693          	addi	a3,a3,460 # c001548c <default_pmm_manager+0x19c>
c00062c8:	0000e617          	auipc	a2,0xe
c00062cc:	b5460613          	addi	a2,a2,-1196 # c0013e1c <commands+0x164>
c00062d0:	21a00593          	li	a1,538
c00062d4:	0000f517          	auipc	a0,0xf
c00062d8:	09450513          	addi	a0,a0,148 # c0015368 <default_pmm_manager+0x78>
c00062dc:	fe9f90ef          	jal	ra,c00002c4 <__panic>
c00062e0:	0000f697          	auipc	a3,0xf
c00062e4:	19068693          	addi	a3,a3,400 # c0015470 <default_pmm_manager+0x180>
c00062e8:	0000e617          	auipc	a2,0xe
c00062ec:	b3460613          	addi	a2,a2,-1228 # c0013e1c <commands+0x164>
c00062f0:	21900593          	li	a1,537
c00062f4:	0000f517          	auipc	a0,0xf
c00062f8:	07450513          	addi	a0,a0,116 # c0015368 <default_pmm_manager+0x78>
c00062fc:	fc9f90ef          	jal	ra,c00002c4 <__panic>
c0006300:	0000f617          	auipc	a2,0xf
c0006304:	15460613          	addi	a2,a2,340 # c0015454 <default_pmm_manager+0x164>
c0006308:	0ba00593          	li	a1,186
c000630c:	0000f517          	auipc	a0,0xf
c0006310:	05c50513          	addi	a0,a0,92 # c0015368 <default_pmm_manager+0x78>
c0006314:	fb1f90ef          	jal	ra,c00002c4 <__panic>
c0006318:	dd4fe0ef          	jal	ra,c00048ec <pa2page.part.6>
c000631c:	0000f697          	auipc	a3,0xf
c0006320:	25868693          	addi	a3,a3,600 # c0015574 <default_pmm_manager+0x284>
c0006324:	0000e617          	auipc	a2,0xe
c0006328:	af860613          	addi	a2,a2,-1288 # c0013e1c <commands+0x164>
c000632c:	22700593          	li	a1,551
c0006330:	0000f517          	auipc	a0,0xf
c0006334:	03850513          	addi	a0,a0,56 # c0015368 <default_pmm_manager+0x78>
c0006338:	f8df90ef          	jal	ra,c00002c4 <__panic>
c000633c:	0000f617          	auipc	a2,0xf
c0006340:	84460613          	addi	a2,a2,-1980 # c0014b80 <commands+0xec8>
c0006344:	22600593          	li	a1,550
c0006348:	0000f517          	auipc	a0,0xf
c000634c:	02050513          	addi	a0,a0,32 # c0015368 <default_pmm_manager+0x78>
c0006350:	f75f90ef          	jal	ra,c00002c4 <__panic>
c0006354:	0000f697          	auipc	a3,0xf
c0006358:	20c68693          	addi	a3,a3,524 # c0015560 <default_pmm_manager+0x270>
c000635c:	0000e617          	auipc	a2,0xe
c0006360:	ac060613          	addi	a2,a2,-1344 # c0013e1c <commands+0x164>
c0006364:	22400593          	li	a1,548
c0006368:	0000f517          	auipc	a0,0xf
c000636c:	00050513          	mv	a0,a0
c0006370:	f55f90ef          	jal	ra,c00002c4 <__panic>
c0006374:	0000f697          	auipc	a3,0xf
c0006378:	1d468693          	addi	a3,a3,468 # c0015548 <default_pmm_manager+0x258>
c000637c:	0000e617          	auipc	a2,0xe
c0006380:	aa060613          	addi	a2,a2,-1376 # c0013e1c <commands+0x164>
c0006384:	22300593          	li	a1,547
c0006388:	0000f517          	auipc	a0,0xf
c000638c:	fe050513          	addi	a0,a0,-32 # c0015368 <default_pmm_manager+0x78>
c0006390:	f35f90ef          	jal	ra,c00002c4 <__panic>
c0006394:	0000f617          	auipc	a2,0xf
c0006398:	ae060613          	addi	a2,a2,-1312 # c0014e74 <commands+0x11bc>
c000639c:	07400593          	li	a1,116
c00063a0:	0000e517          	auipc	a0,0xe
c00063a4:	57450513          	addi	a0,a0,1396 # c0014914 <commands+0xc5c>
c00063a8:	f1df90ef          	jal	ra,c00002c4 <__panic>
c00063ac:	0000f697          	auipc	a3,0xf
c00063b0:	16c68693          	addi	a3,a3,364 # c0015518 <default_pmm_manager+0x228>
c00063b4:	0000e617          	auipc	a2,0xe
c00063b8:	a6860613          	addi	a2,a2,-1432 # c0013e1c <commands+0x164>
c00063bc:	22200593          	li	a1,546
c00063c0:	0000f517          	auipc	a0,0xf
c00063c4:	fa850513          	addi	a0,a0,-88 # c0015368 <default_pmm_manager+0x78>
c00063c8:	efdf90ef          	jal	ra,c00002c4 <__panic>
c00063cc:	0000f697          	auipc	a3,0xf
c00063d0:	20868693          	addi	a3,a3,520 # c00155d4 <default_pmm_manager+0x2e4>
c00063d4:	0000e617          	auipc	a2,0xe
c00063d8:	a4860613          	addi	a2,a2,-1464 # c0013e1c <commands+0x164>
c00063dc:	22b00593          	li	a1,555
c00063e0:	0000f517          	auipc	a0,0xf
c00063e4:	f8850513          	addi	a0,a0,-120 # c0015368 <default_pmm_manager+0x78>
c00063e8:	eddf90ef          	jal	ra,c00002c4 <__panic>
c00063ec:	0000f697          	auipc	a3,0xf
c00063f0:	1b068693          	addi	a3,a3,432 # c001559c <default_pmm_manager+0x2ac>
c00063f4:	0000e617          	auipc	a2,0xe
c00063f8:	a2860613          	addi	a2,a2,-1496 # c0013e1c <commands+0x164>
c00063fc:	22a00593          	li	a1,554
c0006400:	0000f517          	auipc	a0,0xf
c0006404:	f6850513          	addi	a0,a0,-152 # c0015368 <default_pmm_manager+0x78>
c0006408:	ebdf90ef          	jal	ra,c00002c4 <__panic>
c000640c:	00078693          	mv	a3,a5
c0006410:	0000e617          	auipc	a2,0xe
c0006414:	77060613          	addi	a2,a2,1904 # c0014b80 <commands+0xec8>
c0006418:	0f100593          	li	a1,241
c000641c:	0000f517          	auipc	a0,0xf
c0006420:	f4c50513          	addi	a0,a0,-180 # c0015368 <default_pmm_manager+0x78>
c0006424:	ea1f90ef          	jal	ra,c00002c4 <__panic>
c0006428:	0000f617          	auipc	a2,0xf
c000642c:	f7c60613          	addi	a2,a2,-132 # c00153a4 <default_pmm_manager+0xb4>
c0006430:	07300593          	li	a1,115
c0006434:	0000f517          	auipc	a0,0xf
c0006438:	f3450513          	addi	a0,a0,-204 # c0015368 <default_pmm_manager+0x78>
c000643c:	e89f90ef          	jal	ra,c00002c4 <__panic>
c0006440:	0000f697          	auipc	a3,0xf
c0006444:	46468693          	addi	a3,a3,1124 # c00158a4 <default_pmm_manager+0x5b4>
c0006448:	0000e617          	auipc	a2,0xe
c000644c:	9d460613          	addi	a2,a2,-1580 # c0013e1c <commands+0x164>
c0006450:	26000593          	li	a1,608
c0006454:	0000f517          	auipc	a0,0xf
c0006458:	f1450513          	addi	a0,a0,-236 # c0015368 <default_pmm_manager+0x78>
c000645c:	e69f90ef          	jal	ra,c00002c4 <__panic>
c0006460:	0000f697          	auipc	a3,0xf
c0006464:	35468693          	addi	a3,a3,852 # c00157b4 <default_pmm_manager+0x4c4>
c0006468:	0000e617          	auipc	a2,0xe
c000646c:	9b460613          	addi	a2,a2,-1612 # c0013e1c <commands+0x164>
c0006470:	25600593          	li	a1,598
c0006474:	0000f517          	auipc	a0,0xf
c0006478:	ef450513          	addi	a0,a0,-268 # c0015368 <default_pmm_manager+0x78>
c000647c:	e49f90ef          	jal	ra,c00002c4 <__panic>
c0006480:	0000f697          	auipc	a3,0xf
c0006484:	32068693          	addi	a3,a3,800 # c00157a0 <default_pmm_manager+0x4b0>
c0006488:	0000e617          	auipc	a2,0xe
c000648c:	99460613          	addi	a2,a2,-1644 # c0013e1c <commands+0x164>
c0006490:	25200593          	li	a1,594
c0006494:	0000f517          	auipc	a0,0xf
c0006498:	ed450513          	addi	a0,a0,-300 # c0015368 <default_pmm_manager+0x78>
c000649c:	e29f90ef          	jal	ra,c00002c4 <__panic>
c00064a0:	0000f697          	auipc	a3,0xf
c00064a4:	2cc68693          	addi	a3,a3,716 # c001576c <default_pmm_manager+0x47c>
c00064a8:	0000e617          	auipc	a2,0xe
c00064ac:	97460613          	addi	a2,a2,-1676 # c0013e1c <commands+0x164>
c00064b0:	25000593          	li	a1,592
c00064b4:	0000f517          	auipc	a0,0xf
c00064b8:	eb450513          	addi	a0,a0,-332 # c0015368 <default_pmm_manager+0x78>
c00064bc:	e09f90ef          	jal	ra,c00002c4 <__panic>
c00064c0:	0000e617          	auipc	a2,0xe
c00064c4:	6e460613          	addi	a2,a2,1764 # c0014ba4 <commands+0xeec>
c00064c8:	25000593          	li	a1,592
c00064cc:	0000f517          	auipc	a0,0xf
c00064d0:	e9c50513          	addi	a0,a0,-356 # c0015368 <default_pmm_manager+0x78>
c00064d4:	df1f90ef          	jal	ra,c00002c4 <__panic>
c00064d8:	0000f697          	auipc	a3,0xf
c00064dc:	1f868693          	addi	a3,a3,504 # c00156d0 <default_pmm_manager+0x3e0>
c00064e0:	0000e617          	auipc	a2,0xe
c00064e4:	93c60613          	addi	a2,a2,-1732 # c0013e1c <commands+0x164>
c00064e8:	24000593          	li	a1,576
c00064ec:	0000f517          	auipc	a0,0xf
c00064f0:	e7c50513          	addi	a0,a0,-388 # c0015368 <default_pmm_manager+0x78>
c00064f4:	dd1f90ef          	jal	ra,c00002c4 <__panic>
c00064f8:	0000f697          	auipc	a3,0xf
c00064fc:	34868693          	addi	a3,a3,840 # c0015840 <default_pmm_manager+0x550>
c0006500:	0000e617          	auipc	a2,0xe
c0006504:	91c60613          	addi	a2,a2,-1764 # c0013e1c <commands+0x164>
c0006508:	25900593          	li	a1,601
c000650c:	0000f517          	auipc	a0,0xf
c0006510:	e5c50513          	addi	a0,a0,-420 # c0015368 <default_pmm_manager+0x78>
c0006514:	db1f90ef          	jal	ra,c00002c4 <__panic>
c0006518:	0000f697          	auipc	a3,0xf
c000651c:	2e868693          	addi	a3,a3,744 # c0015800 <default_pmm_manager+0x510>
c0006520:	0000e617          	auipc	a2,0xe
c0006524:	8fc60613          	addi	a2,a2,-1796 # c0013e1c <commands+0x164>
c0006528:	25800593          	li	a1,600
c000652c:	0000f517          	auipc	a0,0xf
c0006530:	e3c50513          	addi	a0,a0,-452 # c0015368 <default_pmm_manager+0x78>
c0006534:	d91f90ef          	jal	ra,c00002c4 <__panic>
c0006538:	0000f697          	auipc	a3,0xf
c000653c:	2b468693          	addi	a3,a3,692 # c00157ec <default_pmm_manager+0x4fc>
c0006540:	0000e617          	auipc	a2,0xe
c0006544:	8dc60613          	addi	a2,a2,-1828 # c0013e1c <commands+0x164>
c0006548:	25700593          	li	a1,599
c000654c:	0000f517          	auipc	a0,0xf
c0006550:	e1c50513          	addi	a0,a0,-484 # c0015368 <default_pmm_manager+0x78>
c0006554:	d71f90ef          	jal	ra,c00002c4 <__panic>
c0006558:	00078693          	mv	a3,a5
c000655c:	0000e617          	auipc	a2,0xe
c0006560:	62460613          	addi	a2,a2,1572 # c0014b80 <commands+0xec8>
c0006564:	08b00593          	li	a1,139
c0006568:	0000f517          	auipc	a0,0xf
c000656c:	e0050513          	addi	a0,a0,-512 # c0015368 <default_pmm_manager+0x78>
c0006570:	d55f90ef          	jal	ra,c00002c4 <__panic>
c0006574:	0000f697          	auipc	a3,0xf
c0006578:	2f868693          	addi	a3,a3,760 # c001586c <default_pmm_manager+0x57c>
c000657c:	0000e617          	auipc	a2,0xe
c0006580:	8a060613          	addi	a2,a2,-1888 # c0013e1c <commands+0x164>
c0006584:	25d00593          	li	a1,605
c0006588:	0000f517          	auipc	a0,0xf
c000658c:	de050513          	addi	a0,a0,-544 # c0015368 <default_pmm_manager+0x78>
c0006590:	d35f90ef          	jal	ra,c00002c4 <__panic>
c0006594:	00078693          	mv	a3,a5
c0006598:	0000e617          	auipc	a2,0xe
c000659c:	60c60613          	addi	a2,a2,1548 # c0014ba4 <commands+0xeec>
c00065a0:	09100593          	li	a1,145
c00065a4:	0000f517          	auipc	a0,0xf
c00065a8:	dc450513          	addi	a0,a0,-572 # c0015368 <default_pmm_manager+0x78>
c00065ac:	d19f90ef          	jal	ra,c00002c4 <__panic>

c00065b0 <wait_queue_del.part.1>:
c00065b0:	ff010113          	addi	sp,sp,-16
c00065b4:	0000f697          	auipc	a3,0xf
c00065b8:	43468693          	addi	a3,a3,1076 # c00159e8 <default_pmm_manager+0x6f8>
c00065bc:	0000e617          	auipc	a2,0xe
c00065c0:	86060613          	addi	a2,a2,-1952 # c0013e1c <commands+0x164>
c00065c4:	01e00593          	li	a1,30
c00065c8:	0000f517          	auipc	a0,0xf
c00065cc:	46050513          	addi	a0,a0,1120 # c0015a28 <default_pmm_manager+0x738>
c00065d0:	00112623          	sw	ra,12(sp)
c00065d4:	cf1f90ef          	jal	ra,c00002c4 <__panic>

c00065d8 <wait_queue_next.part.2>:
c00065d8:	ff010113          	addi	sp,sp,-16
c00065dc:	0000f697          	auipc	a3,0xf
c00065e0:	40c68693          	addi	a3,a3,1036 # c00159e8 <default_pmm_manager+0x6f8>
c00065e4:	0000e617          	auipc	a2,0xe
c00065e8:	83860613          	addi	a2,a2,-1992 # c0013e1c <commands+0x164>
c00065ec:	02400593          	li	a1,36
c00065f0:	0000f517          	auipc	a0,0xf
c00065f4:	43850513          	addi	a0,a0,1080 # c0015a28 <default_pmm_manager+0x738>
c00065f8:	00112623          	sw	ra,12(sp)
c00065fc:	cc9f90ef          	jal	ra,c00002c4 <__panic>

c0006600 <wait_queue_init>:
c0006600:	00a52223          	sw	a0,4(a0)
c0006604:	00a52023          	sw	a0,0(a0)
c0006608:	00008067          	ret

c000660c <wait_queue_del>:
c000660c:	0105a703          	lw	a4,16(a1)
c0006610:	00c58793          	addi	a5,a1,12
c0006614:	02e78263          	beq	a5,a4,c0006638 <wait_queue_del+0x2c>
c0006618:	0085a683          	lw	a3,8(a1)
c000661c:	00a69e63          	bne	a3,a0,c0006638 <wait_queue_del+0x2c>
c0006620:	00c5a683          	lw	a3,12(a1)
c0006624:	00e6a223          	sw	a4,4(a3)
c0006628:	00d72023          	sw	a3,0(a4) # fff80000 <sbi_remote_fence_i+0xfff80710>
c000662c:	00f5a823          	sw	a5,16(a1)
c0006630:	00f5a623          	sw	a5,12(a1)
c0006634:	00008067          	ret
c0006638:	ff010113          	addi	sp,sp,-16
c000663c:	00112623          	sw	ra,12(sp)
c0006640:	f71ff0ef          	jal	ra,c00065b0 <wait_queue_del.part.1>

c0006644 <wait_queue_first>:
c0006644:	00452783          	lw	a5,4(a0)
c0006648:	00a78663          	beq	a5,a0,c0006654 <wait_queue_first+0x10>
c000664c:	ff478513          	addi	a0,a5,-12
c0006650:	00008067          	ret
c0006654:	00000513          	li	a0,0
c0006658:	00008067          	ret

c000665c <wait_queue_empty>:
c000665c:	00452783          	lw	a5,4(a0)
c0006660:	40a78533          	sub	a0,a5,a0
c0006664:	00153513          	seqz	a0,a0
c0006668:	00008067          	ret

c000666c <wait_in_queue>:
c000666c:	01052783          	lw	a5,16(a0)
c0006670:	00c50513          	addi	a0,a0,12
c0006674:	40a78533          	sub	a0,a5,a0
c0006678:	00a03533          	snez	a0,a0
c000667c:	00008067          	ret

c0006680 <wakeup_wait>:
c0006680:	02068663          	beqz	a3,c00066ac <wakeup_wait+0x2c>
c0006684:	0105a703          	lw	a4,16(a1)
c0006688:	00c58793          	addi	a5,a1,12
c000668c:	02e78663          	beq	a5,a4,c00066b8 <wakeup_wait+0x38>
c0006690:	0085a683          	lw	a3,8(a1)
c0006694:	02d51263          	bne	a0,a3,c00066b8 <wakeup_wait+0x38>
c0006698:	00c5a683          	lw	a3,12(a1)
c000669c:	00e6a223          	sw	a4,4(a3)
c00066a0:	00d72023          	sw	a3,0(a4)
c00066a4:	00f5a823          	sw	a5,16(a1)
c00066a8:	00f5a623          	sw	a5,12(a1)
c00066ac:	0005a503          	lw	a0,0(a1)
c00066b0:	00c5a223          	sw	a2,4(a1)
c00066b4:	5250306f          	j	c000a3d8 <wakeup_proc>
c00066b8:	ff010113          	addi	sp,sp,-16
c00066bc:	00112623          	sw	ra,12(sp)
c00066c0:	ef1ff0ef          	jal	ra,c00065b0 <wait_queue_del.part.1>

c00066c4 <wakeup_queue>:
c00066c4:	fe010113          	addi	sp,sp,-32
c00066c8:	00812c23          	sw	s0,24(sp)
c00066cc:	00452403          	lw	s0,4(a0)
c00066d0:	00112e23          	sw	ra,28(sp)
c00066d4:	00912a23          	sw	s1,20(sp)
c00066d8:	01212823          	sw	s2,16(sp)
c00066dc:	01312623          	sw	s3,12(sp)
c00066e0:	04850263          	beq	a0,s0,c0006724 <wakeup_queue+0x60>
c00066e4:	ff440413          	addi	s0,s0,-12
c00066e8:	02040e63          	beqz	s0,c0006724 <wakeup_queue+0x60>
c00066ec:	00058913          	mv	s2,a1
c00066f0:	00050493          	mv	s1,a0
c00066f4:	04060a63          	beqz	a2,c0006748 <wakeup_queue+0x84>
c00066f8:	00100993          	li	s3,1
c00066fc:	00c0006f          	j	c0006708 <wakeup_queue+0x44>
c0006700:	ff440413          	addi	s0,s0,-12
c0006704:	02040063          	beqz	s0,c0006724 <wakeup_queue+0x60>
c0006708:	00040593          	mv	a1,s0
c000670c:	00098693          	mv	a3,s3
c0006710:	00090613          	mv	a2,s2
c0006714:	00048513          	mv	a0,s1
c0006718:	f69ff0ef          	jal	ra,c0006680 <wakeup_wait>
c000671c:	0044a403          	lw	s0,4(s1)
c0006720:	fe8490e3          	bne	s1,s0,c0006700 <wakeup_queue+0x3c>
c0006724:	01c12083          	lw	ra,28(sp)
c0006728:	01812403          	lw	s0,24(sp)
c000672c:	01412483          	lw	s1,20(sp)
c0006730:	01012903          	lw	s2,16(sp)
c0006734:	00c12983          	lw	s3,12(sp)
c0006738:	02010113          	addi	sp,sp,32
c000673c:	00008067          	ret
c0006740:	ff478413          	addi	s0,a5,-12
c0006744:	fe0400e3          	beqz	s0,c0006724 <wakeup_queue+0x60>
c0006748:	00042503          	lw	a0,0(s0)
c000674c:	01242223          	sw	s2,4(s0)
c0006750:	489030ef          	jal	ra,c000a3d8 <wakeup_proc>
c0006754:	01042783          	lw	a5,16(s0)
c0006758:	00c40713          	addi	a4,s0,12
c000675c:	02e78663          	beq	a5,a4,c0006788 <wakeup_queue+0xc4>
c0006760:	00842703          	lw	a4,8(s0)
c0006764:	02e49263          	bne	s1,a4,c0006788 <wakeup_queue+0xc4>
c0006768:	fcf49ce3          	bne	s1,a5,c0006740 <wakeup_queue+0x7c>
c000676c:	01c12083          	lw	ra,28(sp)
c0006770:	01812403          	lw	s0,24(sp)
c0006774:	01412483          	lw	s1,20(sp)
c0006778:	01012903          	lw	s2,16(sp)
c000677c:	00c12983          	lw	s3,12(sp)
c0006780:	02010113          	addi	sp,sp,32
c0006784:	00008067          	ret
c0006788:	e51ff0ef          	jal	ra,c00065d8 <wait_queue_next.part.2>

c000678c <wait_current_set>:
c000678c:	00094797          	auipc	a5,0x94
c0006790:	0207a783          	lw	a5,32(a5) # c009a7ac <current>
c0006794:	04078063          	beqz	a5,c00067d4 <wait_current_set+0x48>
c0006798:	00c58713          	addi	a4,a1,12
c000679c:	800006b7          	lui	a3,0x80000
c00067a0:	00e5a623          	sw	a4,12(a1)
c00067a4:	00f5a023          	sw	a5,0(a1)
c00067a8:	00d5a223          	sw	a3,4(a1)
c00067ac:	00100693          	li	a3,1
c00067b0:	00d7a023          	sw	a3,0(a5)
c00067b4:	0ac7a423          	sw	a2,168(a5)
c00067b8:	00052783          	lw	a5,0(a0)
c00067bc:	00a5a423          	sw	a0,8(a1)
c00067c0:	00e52023          	sw	a4,0(a0)
c00067c4:	00e7a223          	sw	a4,4(a5)
c00067c8:	00a5a823          	sw	a0,16(a1)
c00067cc:	00f5a623          	sw	a5,12(a1)
c00067d0:	00008067          	ret
c00067d4:	ff010113          	addi	sp,sp,-16
c00067d8:	0000f697          	auipc	a3,0xf
c00067dc:	20068693          	addi	a3,a3,512 # c00159d8 <default_pmm_manager+0x6e8>
c00067e0:	0000d617          	auipc	a2,0xd
c00067e4:	63c60613          	addi	a2,a2,1596 # c0013e1c <commands+0x164>
c00067e8:	07600593          	li	a1,118
c00067ec:	0000f517          	auipc	a0,0xf
c00067f0:	23c50513          	addi	a0,a0,572 # c0015a28 <default_pmm_manager+0x738>
c00067f4:	00112623          	sw	ra,12(sp)
c00067f8:	acdf90ef          	jal	ra,c00002c4 <__panic>

c00067fc <__down.constprop.0>:
c00067fc:	fd010113          	addi	sp,sp,-48
c0006800:	02812423          	sw	s0,40(sp)
c0006804:	02112623          	sw	ra,44(sp)
c0006808:	02912223          	sw	s1,36(sp)
c000680c:	00050413          	mv	s0,a0
c0006810:	100027f3          	csrr	a5,sstatus
c0006814:	0027f793          	andi	a5,a5,2
c0006818:	02079663          	bnez	a5,c0006844 <__down.constprop.0+0x48>
c000681c:	00052783          	lw	a5,0(a0)
c0006820:	04f05a63          	blez	a5,c0006874 <__down.constprop.0+0x78>
c0006824:	fff78793          	addi	a5,a5,-1
c0006828:	00f42023          	sw	a5,0(s0)
c000682c:	02c12083          	lw	ra,44(sp)
c0006830:	00000513          	li	a0,0
c0006834:	02812403          	lw	s0,40(sp)
c0006838:	02412483          	lw	s1,36(sp)
c000683c:	03010113          	addi	sp,sp,48
c0006840:	00008067          	ret
c0006844:	d7cfa0ef          	jal	ra,c0000dc0 <intr_disable>
c0006848:	00042783          	lw	a5,0(s0)
c000684c:	0af05063          	blez	a5,c00068ec <__down.constprop.0+0xf0>
c0006850:	fff78793          	addi	a5,a5,-1
c0006854:	00f42023          	sw	a5,0(s0)
c0006858:	d60fa0ef          	jal	ra,c0000db8 <intr_enable>
c000685c:	02c12083          	lw	ra,44(sp)
c0006860:	00000513          	li	a0,0
c0006864:	02812403          	lw	s0,40(sp)
c0006868:	02412483          	lw	s1,36(sp)
c000686c:	03010113          	addi	sp,sp,48
c0006870:	00008067          	ret
c0006874:	00450413          	addi	s0,a0,4
c0006878:	00c10493          	addi	s1,sp,12
c000687c:	10000613          	li	a2,256
c0006880:	00048593          	mv	a1,s1
c0006884:	00040513          	mv	a0,s0
c0006888:	f05ff0ef          	jal	ra,c000678c <wait_current_set>
c000688c:	43d030ef          	jal	ra,c000a4c8 <schedule>
c0006890:	100027f3          	csrr	a5,sstatus
c0006894:	0027f793          	andi	a5,a5,2
c0006898:	02079863          	bnez	a5,c00068c8 <__down.constprop.0+0xcc>
c000689c:	00048513          	mv	a0,s1
c00068a0:	dcdff0ef          	jal	ra,c000666c <wait_in_queue>
c00068a4:	06051463          	bnez	a0,c000690c <__down.constprop.0+0x110>
c00068a8:	01012503          	lw	a0,16(sp)
c00068ac:	10000793          	li	a5,256
c00068b0:	f6f50ee3          	beq	a0,a5,c000682c <__down.constprop.0+0x30>
c00068b4:	02c12083          	lw	ra,44(sp)
c00068b8:	02812403          	lw	s0,40(sp)
c00068bc:	02412483          	lw	s1,36(sp)
c00068c0:	03010113          	addi	sp,sp,48
c00068c4:	00008067          	ret
c00068c8:	cf8fa0ef          	jal	ra,c0000dc0 <intr_disable>
c00068cc:	00048513          	mv	a0,s1
c00068d0:	d9dff0ef          	jal	ra,c000666c <wait_in_queue>
c00068d4:	00050863          	beqz	a0,c00068e4 <__down.constprop.0+0xe8>
c00068d8:	00048593          	mv	a1,s1
c00068dc:	00040513          	mv	a0,s0
c00068e0:	d2dff0ef          	jal	ra,c000660c <wait_queue_del>
c00068e4:	cd4fa0ef          	jal	ra,c0000db8 <intr_enable>
c00068e8:	fc1ff06f          	j	c00068a8 <__down.constprop.0+0xac>
c00068ec:	00440413          	addi	s0,s0,4
c00068f0:	00c10493          	addi	s1,sp,12
c00068f4:	10000613          	li	a2,256
c00068f8:	00048593          	mv	a1,s1
c00068fc:	00040513          	mv	a0,s0
c0006900:	e8dff0ef          	jal	ra,c000678c <wait_current_set>
c0006904:	cb4fa0ef          	jal	ra,c0000db8 <intr_enable>
c0006908:	f85ff06f          	j	c000688c <__down.constprop.0+0x90>
c000690c:	00048593          	mv	a1,s1
c0006910:	00040513          	mv	a0,s0
c0006914:	cf9ff0ef          	jal	ra,c000660c <wait_queue_del>
c0006918:	f91ff06f          	j	c00068a8 <__down.constprop.0+0xac>

c000691c <__up.constprop.1>:
c000691c:	ff010113          	addi	sp,sp,-16
c0006920:	00912223          	sw	s1,4(sp)
c0006924:	00112623          	sw	ra,12(sp)
c0006928:	00812423          	sw	s0,8(sp)
c000692c:	01212023          	sw	s2,0(sp)
c0006930:	00050493          	mv	s1,a0
c0006934:	100027f3          	csrr	a5,sstatus
c0006938:	0027f793          	andi	a5,a5,2
c000693c:	00000913          	li	s2,0
c0006940:	06079463          	bnez	a5,c00069a8 <__up.constprop.1+0x8c>
c0006944:	00448413          	addi	s0,s1,4
c0006948:	00040513          	mv	a0,s0
c000694c:	cf9ff0ef          	jal	ra,c0006644 <wait_queue_first>
c0006950:	06050863          	beqz	a0,c00069c0 <__up.constprop.1+0xa4>
c0006954:	00052703          	lw	a4,0(a0)
c0006958:	10000793          	li	a5,256
c000695c:	0a872603          	lw	a2,168(a4)
c0006960:	06f61863          	bne	a2,a5,c00069d0 <__up.constprop.1+0xb4>
c0006964:	00050593          	mv	a1,a0
c0006968:	00100693          	li	a3,1
c000696c:	00040513          	mv	a0,s0
c0006970:	d11ff0ef          	jal	ra,c0006680 <wakeup_wait>
c0006974:	00091e63          	bnez	s2,c0006990 <__up.constprop.1+0x74>
c0006978:	00c12083          	lw	ra,12(sp)
c000697c:	00812403          	lw	s0,8(sp)
c0006980:	00412483          	lw	s1,4(sp)
c0006984:	00012903          	lw	s2,0(sp)
c0006988:	01010113          	addi	sp,sp,16
c000698c:	00008067          	ret
c0006990:	00c12083          	lw	ra,12(sp)
c0006994:	00812403          	lw	s0,8(sp)
c0006998:	00412483          	lw	s1,4(sp)
c000699c:	00012903          	lw	s2,0(sp)
c00069a0:	01010113          	addi	sp,sp,16
c00069a4:	c14fa06f          	j	c0000db8 <intr_enable>
c00069a8:	c18fa0ef          	jal	ra,c0000dc0 <intr_disable>
c00069ac:	00448413          	addi	s0,s1,4
c00069b0:	00040513          	mv	a0,s0
c00069b4:	00100913          	li	s2,1
c00069b8:	c8dff0ef          	jal	ra,c0006644 <wait_queue_first>
c00069bc:	f8051ce3          	bnez	a0,c0006954 <__up.constprop.1+0x38>
c00069c0:	0004a783          	lw	a5,0(s1)
c00069c4:	00178793          	addi	a5,a5,1
c00069c8:	00f4a023          	sw	a5,0(s1)
c00069cc:	fa9ff06f          	j	c0006974 <__up.constprop.1+0x58>
c00069d0:	0000f697          	auipc	a3,0xf
c00069d4:	06c68693          	addi	a3,a3,108 # c0015a3c <default_pmm_manager+0x74c>
c00069d8:	0000d617          	auipc	a2,0xd
c00069dc:	44460613          	addi	a2,a2,1092 # c0013e1c <commands+0x164>
c00069e0:	01a00593          	li	a1,26
c00069e4:	0000f517          	auipc	a0,0xf
c00069e8:	08050513          	addi	a0,a0,128 # c0015a64 <default_pmm_manager+0x774>
c00069ec:	8d9f90ef          	jal	ra,c00002c4 <__panic>

c00069f0 <sem_init>:
c00069f0:	00b52023          	sw	a1,0(a0)
c00069f4:	00450513          	addi	a0,a0,4
c00069f8:	c09ff06f          	j	c0006600 <wait_queue_init>

c00069fc <up>:
c00069fc:	f21ff06f          	j	c000691c <__up.constprop.1>

c0006a00 <down>:
c0006a00:	ff010113          	addi	sp,sp,-16
c0006a04:	00112623          	sw	ra,12(sp)
c0006a08:	df5ff0ef          	jal	ra,c00067fc <__down.constprop.0>
c0006a0c:	00051863          	bnez	a0,c0006a1c <down+0x1c>
c0006a10:	00c12083          	lw	ra,12(sp)
c0006a14:	01010113          	addi	sp,sp,16
c0006a18:	00008067          	ret
c0006a1c:	0000f697          	auipc	a3,0xf
c0006a20:	05868693          	addi	a3,a3,88 # c0015a74 <default_pmm_manager+0x784>
c0006a24:	0000d617          	auipc	a2,0xd
c0006a28:	3f860613          	addi	a2,a2,1016 # c0013e1c <commands+0x164>
c0006a2c:	04100593          	li	a1,65
c0006a30:	0000f517          	auipc	a0,0xf
c0006a34:	03450513          	addi	a0,a0,52 # c0015a64 <default_pmm_manager+0x774>
c0006a38:	88df90ef          	jal	ra,c00002c4 <__panic>

c0006a3c <copy_path>:
c0006a3c:	fe010113          	addi	sp,sp,-32
c0006a40:	01412423          	sw	s4,8(sp)
c0006a44:	00094797          	auipc	a5,0x94
c0006a48:	d687a783          	lw	a5,-664(a5) # c009a7ac <current>
c0006a4c:	00050a13          	mv	s4,a0
c0006a50:	00001537          	lui	a0,0x1
c0006a54:	00812c23          	sw	s0,24(sp)
c0006a58:	01312623          	sw	s3,12(sp)
c0006a5c:	00112e23          	sw	ra,28(sp)
c0006a60:	00912a23          	sw	s1,20(sp)
c0006a64:	01212823          	sw	s2,16(sp)
c0006a68:	00058993          	mv	s3,a1
c0006a6c:	0187a403          	lw	s0,24(a5)
c0006a70:	b7cfc0ef          	jal	ra,c0002dec <kmalloc>
c0006a74:	0a050863          	beqz	a0,c0006b24 <copy_path+0xe8>
c0006a78:	00050493          	mv	s1,a0
c0006a7c:	06040863          	beqz	s0,c0006aec <copy_path+0xb0>
c0006a80:	01c40913          	addi	s2,s0,28
c0006a84:	00090513          	mv	a0,s2
c0006a88:	f79ff0ef          	jal	ra,c0006a00 <down>
c0006a8c:	00094797          	auipc	a5,0x94
c0006a90:	d207a783          	lw	a5,-736(a5) # c009a7ac <current>
c0006a94:	00078663          	beqz	a5,c0006aa0 <copy_path+0x64>
c0006a98:	0047a783          	lw	a5,4(a5)
c0006a9c:	02f42423          	sw	a5,40(s0)
c0006aa0:	000016b7          	lui	a3,0x1
c0006aa4:	00098613          	mv	a2,s3
c0006aa8:	00048593          	mv	a1,s1
c0006aac:	00040513          	mv	a0,s0
c0006ab0:	a59fb0ef          	jal	ra,c0002508 <copy_string>
c0006ab4:	06050063          	beqz	a0,c0006b14 <copy_path+0xd8>
c0006ab8:	00090513          	mv	a0,s2
c0006abc:	f41ff0ef          	jal	ra,c00069fc <up>
c0006ac0:	02042423          	sw	zero,40(s0)
c0006ac4:	009a2023          	sw	s1,0(s4)
c0006ac8:	00000513          	li	a0,0
c0006acc:	01c12083          	lw	ra,28(sp)
c0006ad0:	01812403          	lw	s0,24(sp)
c0006ad4:	01412483          	lw	s1,20(sp)
c0006ad8:	01012903          	lw	s2,16(sp)
c0006adc:	00c12983          	lw	s3,12(sp)
c0006ae0:	00812a03          	lw	s4,8(sp)
c0006ae4:	02010113          	addi	sp,sp,32
c0006ae8:	00008067          	ret
c0006aec:	00050593          	mv	a1,a0
c0006af0:	000016b7          	lui	a3,0x1
c0006af4:	00098613          	mv	a2,s3
c0006af8:	00000513          	li	a0,0
c0006afc:	a0dfb0ef          	jal	ra,c0002508 <copy_string>
c0006b00:	fc0512e3          	bnez	a0,c0006ac4 <copy_path+0x88>
c0006b04:	00048513          	mv	a0,s1
c0006b08:	c04fc0ef          	jal	ra,c0002f0c <kfree>
c0006b0c:	ffd00513          	li	a0,-3
c0006b10:	fbdff06f          	j	c0006acc <copy_path+0x90>
c0006b14:	00090513          	mv	a0,s2
c0006b18:	ee5ff0ef          	jal	ra,c00069fc <up>
c0006b1c:	02042423          	sw	zero,40(s0)
c0006b20:	fe5ff06f          	j	c0006b04 <copy_path+0xc8>
c0006b24:	ffc00513          	li	a0,-4
c0006b28:	fa5ff06f          	j	c0006acc <copy_path+0x90>

c0006b2c <sysfile_open>:
c0006b2c:	fe010113          	addi	sp,sp,-32
c0006b30:	00912a23          	sw	s1,20(sp)
c0006b34:	00058493          	mv	s1,a1
c0006b38:	00050593          	mv	a1,a0
c0006b3c:	00c10513          	addi	a0,sp,12
c0006b40:	00812c23          	sw	s0,24(sp)
c0006b44:	00112e23          	sw	ra,28(sp)
c0006b48:	ef5ff0ef          	jal	ra,c0006a3c <copy_path>
c0006b4c:	00050413          	mv	s0,a0
c0006b50:	00051e63          	bnez	a0,c0006b6c <sysfile_open+0x40>
c0006b54:	00c12503          	lw	a0,12(sp)
c0006b58:	00048593          	mv	a1,s1
c0006b5c:	341000ef          	jal	ra,c000769c <file_open>
c0006b60:	00050413          	mv	s0,a0
c0006b64:	00c12503          	lw	a0,12(sp)
c0006b68:	ba4fc0ef          	jal	ra,c0002f0c <kfree>
c0006b6c:	01c12083          	lw	ra,28(sp)
c0006b70:	00040513          	mv	a0,s0
c0006b74:	01412483          	lw	s1,20(sp)
c0006b78:	01812403          	lw	s0,24(sp)
c0006b7c:	02010113          	addi	sp,sp,32
c0006b80:	00008067          	ret

c0006b84 <sysfile_close>:
c0006b84:	4a10006f          	j	c0007824 <file_close>

c0006b88 <sysfile_read>:
c0006b88:	fc010113          	addi	sp,sp,-64
c0006b8c:	03212823          	sw	s2,48(sp)
c0006b90:	02112e23          	sw	ra,60(sp)
c0006b94:	02812c23          	sw	s0,56(sp)
c0006b98:	02912a23          	sw	s1,52(sp)
c0006b9c:	03312623          	sw	s3,44(sp)
c0006ba0:	03412423          	sw	s4,40(sp)
c0006ba4:	03512223          	sw	s5,36(sp)
c0006ba8:	03612023          	sw	s6,32(sp)
c0006bac:	01712e23          	sw	s7,28(sp)
c0006bb0:	01812c23          	sw	s8,24(sp)
c0006bb4:	00000913          	li	s2,0
c0006bb8:	02061c63          	bnez	a2,c0006bf0 <sysfile_read+0x68>
c0006bbc:	03c12083          	lw	ra,60(sp)
c0006bc0:	00090513          	mv	a0,s2
c0006bc4:	03812403          	lw	s0,56(sp)
c0006bc8:	03412483          	lw	s1,52(sp)
c0006bcc:	03012903          	lw	s2,48(sp)
c0006bd0:	02c12983          	lw	s3,44(sp)
c0006bd4:	02812a03          	lw	s4,40(sp)
c0006bd8:	02412a83          	lw	s5,36(sp)
c0006bdc:	02012b03          	lw	s6,32(sp)
c0006be0:	01c12b83          	lw	s7,28(sp)
c0006be4:	01812c03          	lw	s8,24(sp)
c0006be8:	04010113          	addi	sp,sp,64
c0006bec:	00008067          	ret
c0006bf0:	00060413          	mv	s0,a2
c0006bf4:	00058b13          	mv	s6,a1
c0006bf8:	00094797          	auipc	a5,0x94
c0006bfc:	bb47a783          	lw	a5,-1100(a5) # c009a7ac <current>
c0006c00:	00000613          	li	a2,0
c0006c04:	00100593          	li	a1,1
c0006c08:	00050a93          	mv	s5,a0
c0006c0c:	0187a483          	lw	s1,24(a5)
c0006c10:	20d000ef          	jal	ra,c000761c <file_testfd>
c0006c14:	10050663          	beqz	a0,c0006d20 <sysfile_read+0x198>
c0006c18:	00001537          	lui	a0,0x1
c0006c1c:	9d0fc0ef          	jal	ra,c0002dec <kmalloc>
c0006c20:	00050a13          	mv	s4,a0
c0006c24:	10050263          	beqz	a0,c0006d28 <sysfile_read+0x1a0>
c0006c28:	00000b93          	li	s7,0
c0006c2c:	000019b7          	lui	s3,0x1
c0006c30:	01c48c13          	addi	s8,s1,28
c0006c34:	0b346463          	bltu	s0,s3,c0006cdc <sysfile_read+0x154>
c0006c38:	01312623          	sw	s3,12(sp)
c0006c3c:	00098613          	mv	a2,s3
c0006c40:	00c10693          	addi	a3,sp,12
c0006c44:	000a0593          	mv	a1,s4
c0006c48:	000a8513          	mv	a0,s5
c0006c4c:	455000ef          	jal	ra,c00078a0 <file_read>
c0006c50:	00c12683          	lw	a3,12(sp)
c0006c54:	00050913          	mv	s2,a0
c0006c58:	06068c63          	beqz	a3,c0006cd0 <sysfile_read+0x148>
c0006c5c:	02048263          	beqz	s1,c0006c80 <sysfile_read+0xf8>
c0006c60:	000c0513          	mv	a0,s8
c0006c64:	d9dff0ef          	jal	ra,c0006a00 <down>
c0006c68:	00094797          	auipc	a5,0x94
c0006c6c:	b447a783          	lw	a5,-1212(a5) # c009a7ac <current>
c0006c70:	0a078463          	beqz	a5,c0006d18 <sysfile_read+0x190>
c0006c74:	0047a783          	lw	a5,4(a5)
c0006c78:	00c12683          	lw	a3,12(sp)
c0006c7c:	02f4a423          	sw	a5,40(s1)
c0006c80:	000a0613          	mv	a2,s4
c0006c84:	000b0593          	mv	a1,s6
c0006c88:	00048513          	mv	a0,s1
c0006c8c:	821fb0ef          	jal	ra,c00024ac <copy_to_user>
c0006c90:	04050c63          	beqz	a0,c0006ce8 <sysfile_read+0x160>
c0006c94:	00c12783          	lw	a5,12(sp)
c0006c98:	08f46c63          	bltu	s0,a5,c0006d30 <sysfile_read+0x1a8>
c0006c9c:	00fb0b33          	add	s6,s6,a5
c0006ca0:	40f40433          	sub	s0,s0,a5
c0006ca4:	00fb8bb3          	add	s7,s7,a5
c0006ca8:	06049063          	bnez	s1,c0006d08 <sysfile_read+0x180>
c0006cac:	00091863          	bnez	s2,c0006cbc <sysfile_read+0x134>
c0006cb0:	00c12783          	lw	a5,12(sp)
c0006cb4:	02078063          	beqz	a5,c0006cd4 <sysfile_read+0x14c>
c0006cb8:	f6041ee3          	bnez	s0,c0006c34 <sysfile_read+0xac>
c0006cbc:	000a0513          	mv	a0,s4
c0006cc0:	a4cfc0ef          	jal	ra,c0002f0c <kfree>
c0006cc4:	ee0b8ce3          	beqz	s7,c0006bbc <sysfile_read+0x34>
c0006cc8:	000b8913          	mv	s2,s7
c0006ccc:	ef1ff06f          	j	c0006bbc <sysfile_read+0x34>
c0006cd0:	fe0516e3          	bnez	a0,c0006cbc <sysfile_read+0x134>
c0006cd4:	00000913          	li	s2,0
c0006cd8:	fe5ff06f          	j	c0006cbc <sysfile_read+0x134>
c0006cdc:	00812623          	sw	s0,12(sp)
c0006ce0:	00040613          	mv	a2,s0
c0006ce4:	f5dff06f          	j	c0006c40 <sysfile_read+0xb8>
c0006ce8:	00091e63          	bnez	s2,c0006d04 <sysfile_read+0x17c>
c0006cec:	ffd00913          	li	s2,-3
c0006cf0:	fc0486e3          	beqz	s1,c0006cbc <sysfile_read+0x134>
c0006cf4:	01c48513          	addi	a0,s1,28
c0006cf8:	d05ff0ef          	jal	ra,c00069fc <up>
c0006cfc:	0204a423          	sw	zero,40(s1)
c0006d00:	fbdff06f          	j	c0006cbc <sysfile_read+0x134>
c0006d04:	fa048ce3          	beqz	s1,c0006cbc <sysfile_read+0x134>
c0006d08:	000c0513          	mv	a0,s8
c0006d0c:	cf1ff0ef          	jal	ra,c00069fc <up>
c0006d10:	0204a423          	sw	zero,40(s1)
c0006d14:	f99ff06f          	j	c0006cac <sysfile_read+0x124>
c0006d18:	00c12683          	lw	a3,12(sp)
c0006d1c:	f65ff06f          	j	c0006c80 <sysfile_read+0xf8>
c0006d20:	ffd00913          	li	s2,-3
c0006d24:	e99ff06f          	j	c0006bbc <sysfile_read+0x34>
c0006d28:	ffc00913          	li	s2,-4
c0006d2c:	e91ff06f          	j	c0006bbc <sysfile_read+0x34>
c0006d30:	0000f697          	auipc	a3,0xf
c0006d34:	d5068693          	addi	a3,a3,-688 # c0015a80 <default_pmm_manager+0x790>
c0006d38:	0000d617          	auipc	a2,0xd
c0006d3c:	0e460613          	addi	a2,a2,228 # c0013e1c <commands+0x164>
c0006d40:	05500593          	li	a1,85
c0006d44:	0000f517          	auipc	a0,0xf
c0006d48:	d4850513          	addi	a0,a0,-696 # c0015a8c <default_pmm_manager+0x79c>
c0006d4c:	d78f90ef          	jal	ra,c00002c4 <__panic>

c0006d50 <sysfile_write>:
c0006d50:	fc010113          	addi	sp,sp,-64
c0006d54:	03612023          	sw	s6,32(sp)
c0006d58:	02112e23          	sw	ra,60(sp)
c0006d5c:	02812c23          	sw	s0,56(sp)
c0006d60:	02912a23          	sw	s1,52(sp)
c0006d64:	03212823          	sw	s2,48(sp)
c0006d68:	03312623          	sw	s3,44(sp)
c0006d6c:	03412423          	sw	s4,40(sp)
c0006d70:	03512223          	sw	s5,36(sp)
c0006d74:	01712e23          	sw	s7,28(sp)
c0006d78:	01812c23          	sw	s8,24(sp)
c0006d7c:	00000b13          	li	s6,0
c0006d80:	02061c63          	bnez	a2,c0006db8 <sysfile_write+0x68>
c0006d84:	03c12083          	lw	ra,60(sp)
c0006d88:	000b0513          	mv	a0,s6
c0006d8c:	03812403          	lw	s0,56(sp)
c0006d90:	03412483          	lw	s1,52(sp)
c0006d94:	03012903          	lw	s2,48(sp)
c0006d98:	02c12983          	lw	s3,44(sp)
c0006d9c:	02812a03          	lw	s4,40(sp)
c0006da0:	02412a83          	lw	s5,36(sp)
c0006da4:	02012b03          	lw	s6,32(sp)
c0006da8:	01c12b83          	lw	s7,28(sp)
c0006dac:	01812c03          	lw	s8,24(sp)
c0006db0:	04010113          	addi	sp,sp,64
c0006db4:	00008067          	ret
c0006db8:	00060413          	mv	s0,a2
c0006dbc:	00058a13          	mv	s4,a1
c0006dc0:	00094797          	auipc	a5,0x94
c0006dc4:	9ec7a783          	lw	a5,-1556(a5) # c009a7ac <current>
c0006dc8:	00100613          	li	a2,1
c0006dcc:	00000593          	li	a1,0
c0006dd0:	00050b93          	mv	s7,a0
c0006dd4:	0187a483          	lw	s1,24(a5)
c0006dd8:	045000ef          	jal	ra,c000761c <file_testfd>
c0006ddc:	10050063          	beqz	a0,c0006edc <sysfile_write+0x18c>
c0006de0:	00001537          	lui	a0,0x1
c0006de4:	808fc0ef          	jal	ra,c0002dec <kmalloc>
c0006de8:	00050993          	mv	s3,a0
c0006dec:	0e050c63          	beqz	a0,c0006ee4 <sysfile_write+0x194>
c0006df0:	00000c13          	li	s8,0
c0006df4:	00001937          	lui	s2,0x1
c0006df8:	01c48a93          	addi	s5,s1,28
c0006dfc:	09246263          	bltu	s0,s2,c0006e80 <sysfile_write+0x130>
c0006e00:	01212623          	sw	s2,12(sp)
c0006e04:	08048263          	beqz	s1,c0006e88 <sysfile_write+0x138>
c0006e08:	000a8513          	mv	a0,s5
c0006e0c:	bf5ff0ef          	jal	ra,c0006a00 <down>
c0006e10:	00094797          	auipc	a5,0x94
c0006e14:	99c7a783          	lw	a5,-1636(a5) # c009a7ac <current>
c0006e18:	00078663          	beqz	a5,c0006e24 <sysfile_write+0xd4>
c0006e1c:	0047a783          	lw	a5,4(a5)
c0006e20:	02f4a423          	sw	a5,40(s1)
c0006e24:	00c12683          	lw	a3,12(sp)
c0006e28:	00000713          	li	a4,0
c0006e2c:	000a0613          	mv	a2,s4
c0006e30:	00098593          	mv	a1,s3
c0006e34:	00048513          	mv	a0,s1
c0006e38:	e14fb0ef          	jal	ra,c000244c <copy_from_user>
c0006e3c:	06050863          	beqz	a0,c0006eac <sysfile_write+0x15c>
c0006e40:	000a8513          	mv	a0,s5
c0006e44:	bb9ff0ef          	jal	ra,c00069fc <up>
c0006e48:	0204a423          	sw	zero,40(s1)
c0006e4c:	00c12603          	lw	a2,12(sp)
c0006e50:	00c10693          	addi	a3,sp,12
c0006e54:	00098593          	mv	a1,s3
c0006e58:	000b8513          	mv	a0,s7
c0006e5c:	395000ef          	jal	ra,c00079f0 <file_write>
c0006e60:	00c12783          	lw	a5,12(sp)
c0006e64:	00050b13          	mv	s6,a0
c0006e68:	04079c63          	bnez	a5,c0006ec0 <sysfile_write+0x170>
c0006e6c:	00098513          	mv	a0,s3
c0006e70:	89cfc0ef          	jal	ra,c0002f0c <kfree>
c0006e74:	f00c08e3          	beqz	s8,c0006d84 <sysfile_write+0x34>
c0006e78:	000c0b13          	mv	s6,s8
c0006e7c:	f09ff06f          	j	c0006d84 <sysfile_write+0x34>
c0006e80:	00812623          	sw	s0,12(sp)
c0006e84:	f80492e3          	bnez	s1,c0006e08 <sysfile_write+0xb8>
c0006e88:	00c12683          	lw	a3,12(sp)
c0006e8c:	00000713          	li	a4,0
c0006e90:	000a0613          	mv	a2,s4
c0006e94:	00098593          	mv	a1,s3
c0006e98:	00000513          	li	a0,0
c0006e9c:	db0fb0ef          	jal	ra,c000244c <copy_from_user>
c0006ea0:	fa0516e3          	bnez	a0,c0006e4c <sysfile_write+0xfc>
c0006ea4:	ffd00b13          	li	s6,-3
c0006ea8:	fc5ff06f          	j	c0006e6c <sysfile_write+0x11c>
c0006eac:	000a8513          	mv	a0,s5
c0006eb0:	b4dff0ef          	jal	ra,c00069fc <up>
c0006eb4:	ffd00b13          	li	s6,-3
c0006eb8:	0204a423          	sw	zero,40(s1)
c0006ebc:	fb1ff06f          	j	c0006e6c <sysfile_write+0x11c>
c0006ec0:	02f46663          	bltu	s0,a5,c0006eec <sysfile_write+0x19c>
c0006ec4:	00fa0a33          	add	s4,s4,a5
c0006ec8:	40f40433          	sub	s0,s0,a5
c0006ecc:	00fc0c33          	add	s8,s8,a5
c0006ed0:	f8051ee3          	bnez	a0,c0006e6c <sysfile_write+0x11c>
c0006ed4:	f20414e3          	bnez	s0,c0006dfc <sysfile_write+0xac>
c0006ed8:	f95ff06f          	j	c0006e6c <sysfile_write+0x11c>
c0006edc:	ffd00b13          	li	s6,-3
c0006ee0:	ea5ff06f          	j	c0006d84 <sysfile_write+0x34>
c0006ee4:	ffc00b13          	li	s6,-4
c0006ee8:	e9dff06f          	j	c0006d84 <sysfile_write+0x34>
c0006eec:	0000f697          	auipc	a3,0xf
c0006ef0:	b9468693          	addi	a3,a3,-1132 # c0015a80 <default_pmm_manager+0x790>
c0006ef4:	0000d617          	auipc	a2,0xd
c0006ef8:	f2860613          	addi	a2,a2,-216 # c0013e1c <commands+0x164>
c0006efc:	08a00593          	li	a1,138
c0006f00:	0000f517          	auipc	a0,0xf
c0006f04:	b8c50513          	addi	a0,a0,-1140 # c0015a8c <default_pmm_manager+0x79c>
c0006f08:	bbcf90ef          	jal	ra,c00002c4 <__panic>

c0006f0c <sysfile_seek>:
c0006f0c:	4350006f          	j	c0007b40 <file_seek>

c0006f10 <sysfile_fstat>:
c0006f10:	fd010113          	addi	sp,sp,-48
c0006f14:	03212023          	sw	s2,32(sp)
c0006f18:	00094797          	auipc	a5,0x94
c0006f1c:	8947a783          	lw	a5,-1900(a5) # c009a7ac <current>
c0006f20:	00058913          	mv	s2,a1
c0006f24:	00010593          	mv	a1,sp
c0006f28:	02812423          	sw	s0,40(sp)
c0006f2c:	02912223          	sw	s1,36(sp)
c0006f30:	02112623          	sw	ra,44(sp)
c0006f34:	01312e23          	sw	s3,28(sp)
c0006f38:	0187a483          	lw	s1,24(a5)
c0006f3c:	5b1000ef          	jal	ra,c0007cec <file_fstat>
c0006f40:	00050413          	mv	s0,a0
c0006f44:	04051863          	bnez	a0,c0006f94 <sysfile_fstat+0x84>
c0006f48:	06048663          	beqz	s1,c0006fb4 <sysfile_fstat+0xa4>
c0006f4c:	01c48993          	addi	s3,s1,28
c0006f50:	00098513          	mv	a0,s3
c0006f54:	aadff0ef          	jal	ra,c0006a00 <down>
c0006f58:	00094797          	auipc	a5,0x94
c0006f5c:	8547a783          	lw	a5,-1964(a5) # c009a7ac <current>
c0006f60:	00078663          	beqz	a5,c0006f6c <sysfile_fstat+0x5c>
c0006f64:	0047a783          	lw	a5,4(a5)
c0006f68:	02f4a423          	sw	a5,40(s1)
c0006f6c:	01000693          	li	a3,16
c0006f70:	00010613          	mv	a2,sp
c0006f74:	00090593          	mv	a1,s2
c0006f78:	00048513          	mv	a0,s1
c0006f7c:	d30fb0ef          	jal	ra,c00024ac <copy_to_user>
c0006f80:	00051463          	bnez	a0,c0006f88 <sysfile_fstat+0x78>
c0006f84:	ffd00413          	li	s0,-3
c0006f88:	00098513          	mv	a0,s3
c0006f8c:	a71ff0ef          	jal	ra,c00069fc <up>
c0006f90:	0204a423          	sw	zero,40(s1)
c0006f94:	02c12083          	lw	ra,44(sp)
c0006f98:	00040513          	mv	a0,s0
c0006f9c:	02412483          	lw	s1,36(sp)
c0006fa0:	02812403          	lw	s0,40(sp)
c0006fa4:	02012903          	lw	s2,32(sp)
c0006fa8:	01c12983          	lw	s3,28(sp)
c0006fac:	03010113          	addi	sp,sp,48
c0006fb0:	00008067          	ret
c0006fb4:	01000693          	li	a3,16
c0006fb8:	00010613          	mv	a2,sp
c0006fbc:	00090593          	mv	a1,s2
c0006fc0:	cecfb0ef          	jal	ra,c00024ac <copy_to_user>
c0006fc4:	fc0518e3          	bnez	a0,c0006f94 <sysfile_fstat+0x84>
c0006fc8:	ffd00413          	li	s0,-3
c0006fcc:	fc9ff06f          	j	c0006f94 <sysfile_fstat+0x84>

c0006fd0 <sysfile_fsync>:
c0006fd0:	6310006f          	j	c0007e00 <file_fsync>

c0006fd4 <sysfile_getcwd>:
c0006fd4:	fd010113          	addi	sp,sp,-48
c0006fd8:	02912223          	sw	s1,36(sp)
c0006fdc:	00093797          	auipc	a5,0x93
c0006fe0:	7d07a783          	lw	a5,2000(a5) # c009a7ac <current>
c0006fe4:	02112623          	sw	ra,44(sp)
c0006fe8:	02812423          	sw	s0,40(sp)
c0006fec:	03212023          	sw	s2,32(sp)
c0006ff0:	01312e23          	sw	s3,28(sp)
c0006ff4:	0187a483          	lw	s1,24(a5)
c0006ff8:	0a058863          	beqz	a1,c00070a8 <sysfile_getcwd+0xd4>
c0006ffc:	00050913          	mv	s2,a0
c0007000:	00058413          	mv	s0,a1
c0007004:	08048663          	beqz	s1,c0007090 <sysfile_getcwd+0xbc>
c0007008:	01c48993          	addi	s3,s1,28
c000700c:	00098513          	mv	a0,s3
c0007010:	9f1ff0ef          	jal	ra,c0006a00 <down>
c0007014:	00093797          	auipc	a5,0x93
c0007018:	7987a783          	lw	a5,1944(a5) # c009a7ac <current>
c000701c:	00078663          	beqz	a5,c0007028 <sysfile_getcwd+0x54>
c0007020:	0047a783          	lw	a5,4(a5)
c0007024:	02f4a423          	sw	a5,40(s1)
c0007028:	00100693          	li	a3,1
c000702c:	00040613          	mv	a2,s0
c0007030:	00090593          	mv	a1,s2
c0007034:	00048513          	mv	a0,s1
c0007038:	b3cfb0ef          	jal	ra,c0002374 <user_mem_check>
c000703c:	02051a63          	bnez	a0,c0007070 <sysfile_getcwd+0x9c>
c0007040:	ffd00413          	li	s0,-3
c0007044:	00098513          	mv	a0,s3
c0007048:	9b5ff0ef          	jal	ra,c00069fc <up>
c000704c:	0204a423          	sw	zero,40(s1)
c0007050:	02c12083          	lw	ra,44(sp)
c0007054:	00040513          	mv	a0,s0
c0007058:	02412483          	lw	s1,36(sp)
c000705c:	02812403          	lw	s0,40(sp)
c0007060:	02012903          	lw	s2,32(sp)
c0007064:	01c12983          	lw	s3,28(sp)
c0007068:	03010113          	addi	sp,sp,48
c000706c:	00008067          	ret
c0007070:	00040613          	mv	a2,s0
c0007074:	00000693          	li	a3,0
c0007078:	00090593          	mv	a1,s2
c000707c:	00010513          	mv	a0,sp
c0007080:	0b0010ef          	jal	ra,c0008130 <iobuf_init>
c0007084:	5c1070ef          	jal	ra,c000ee44 <vfs_getcwd>
c0007088:	00050413          	mv	s0,a0
c000708c:	fb9ff06f          	j	c0007044 <sysfile_getcwd+0x70>
c0007090:	00058613          	mv	a2,a1
c0007094:	00100693          	li	a3,1
c0007098:	00050593          	mv	a1,a0
c000709c:	00000513          	li	a0,0
c00070a0:	ad4fb0ef          	jal	ra,c0002374 <user_mem_check>
c00070a4:	02051463          	bnez	a0,c00070cc <sysfile_getcwd+0xf8>
c00070a8:	02c12083          	lw	ra,44(sp)
c00070ac:	ffd00413          	li	s0,-3
c00070b0:	00040513          	mv	a0,s0
c00070b4:	02412483          	lw	s1,36(sp)
c00070b8:	02812403          	lw	s0,40(sp)
c00070bc:	02012903          	lw	s2,32(sp)
c00070c0:	01c12983          	lw	s3,28(sp)
c00070c4:	03010113          	addi	sp,sp,48
c00070c8:	00008067          	ret
c00070cc:	00040613          	mv	a2,s0
c00070d0:	00000693          	li	a3,0
c00070d4:	00090593          	mv	a1,s2
c00070d8:	00010513          	mv	a0,sp
c00070dc:	054010ef          	jal	ra,c0008130 <iobuf_init>
c00070e0:	565070ef          	jal	ra,c000ee44 <vfs_getcwd>
c00070e4:	00050413          	mv	s0,a0
c00070e8:	f69ff06f          	j	c0007050 <sysfile_getcwd+0x7c>

c00070ec <sysfile_getdirentry>:
c00070ec:	fe010113          	addi	sp,sp,-32
c00070f0:	01212823          	sw	s2,16(sp)
c00070f4:	00093797          	auipc	a5,0x93
c00070f8:	6b87a783          	lw	a5,1720(a5) # c009a7ac <current>
c00070fc:	00050913          	mv	s2,a0
c0007100:	10400513          	li	a0,260
c0007104:	00812c23          	sw	s0,24(sp)
c0007108:	01312623          	sw	s3,12(sp)
c000710c:	00112e23          	sw	ra,28(sp)
c0007110:	00912a23          	sw	s1,20(sp)
c0007114:	01412423          	sw	s4,8(sp)
c0007118:	00058993          	mv	s3,a1
c000711c:	0187a403          	lw	s0,24(a5)
c0007120:	ccdfb0ef          	jal	ra,c0002dec <kmalloc>
c0007124:	0e050e63          	beqz	a0,c0007220 <sysfile_getdirentry+0x134>
c0007128:	00050493          	mv	s1,a0
c000712c:	02040063          	beqz	s0,c000714c <sysfile_getdirentry+0x60>
c0007130:	01c40513          	addi	a0,s0,28
c0007134:	8cdff0ef          	jal	ra,c0006a00 <down>
c0007138:	00093797          	auipc	a5,0x93
c000713c:	6747a783          	lw	a5,1652(a5) # c009a7ac <current>
c0007140:	00078663          	beqz	a5,c000714c <sysfile_getdirentry+0x60>
c0007144:	0047a783          	lw	a5,4(a5)
c0007148:	02f42423          	sw	a5,40(s0)
c000714c:	00100713          	li	a4,1
c0007150:	00400693          	li	a3,4
c0007154:	00098613          	mv	a2,s3
c0007158:	00048593          	mv	a1,s1
c000715c:	00040513          	mv	a0,s0
c0007160:	aecfb0ef          	jal	ra,c000244c <copy_from_user>
c0007164:	06050a63          	beqz	a0,c00071d8 <sysfile_getdirentry+0xec>
c0007168:	0c040063          	beqz	s0,c0007228 <sysfile_getdirentry+0x13c>
c000716c:	01c40a13          	addi	s4,s0,28
c0007170:	000a0513          	mv	a0,s4
c0007174:	889ff0ef          	jal	ra,c00069fc <up>
c0007178:	00090513          	mv	a0,s2
c000717c:	00048593          	mv	a1,s1
c0007180:	02042423          	sw	zero,40(s0)
c0007184:	57d000ef          	jal	ra,c0007f00 <file_getdirentry>
c0007188:	00050913          	mv	s2,a0
c000718c:	04051a63          	bnez	a0,c00071e0 <sysfile_getdirentry+0xf4>
c0007190:	000a0513          	mv	a0,s4
c0007194:	86dff0ef          	jal	ra,c0006a00 <down>
c0007198:	00093797          	auipc	a5,0x93
c000719c:	6147a783          	lw	a5,1556(a5) # c009a7ac <current>
c00071a0:	00078663          	beqz	a5,c00071ac <sysfile_getdirentry+0xc0>
c00071a4:	0047a783          	lw	a5,4(a5)
c00071a8:	02f42423          	sw	a5,40(s0)
c00071ac:	10400693          	li	a3,260
c00071b0:	00048613          	mv	a2,s1
c00071b4:	00098593          	mv	a1,s3
c00071b8:	00040513          	mv	a0,s0
c00071bc:	af0fb0ef          	jal	ra,c00024ac <copy_to_user>
c00071c0:	00051463          	bnez	a0,c00071c8 <sysfile_getdirentry+0xdc>
c00071c4:	ffd00913          	li	s2,-3
c00071c8:	000a0513          	mv	a0,s4
c00071cc:	831ff0ef          	jal	ra,c00069fc <up>
c00071d0:	02042423          	sw	zero,40(s0)
c00071d4:	00c0006f          	j	c00071e0 <sysfile_getdirentry+0xf4>
c00071d8:	02041a63          	bnez	s0,c000720c <sysfile_getdirentry+0x120>
c00071dc:	ffd00913          	li	s2,-3
c00071e0:	00048513          	mv	a0,s1
c00071e4:	d29fb0ef          	jal	ra,c0002f0c <kfree>
c00071e8:	01c12083          	lw	ra,28(sp)
c00071ec:	00090513          	mv	a0,s2
c00071f0:	01812403          	lw	s0,24(sp)
c00071f4:	01412483          	lw	s1,20(sp)
c00071f8:	01012903          	lw	s2,16(sp)
c00071fc:	00c12983          	lw	s3,12(sp)
c0007200:	00812a03          	lw	s4,8(sp)
c0007204:	02010113          	addi	sp,sp,32
c0007208:	00008067          	ret
c000720c:	01c40513          	addi	a0,s0,28
c0007210:	fecff0ef          	jal	ra,c00069fc <up>
c0007214:	ffd00913          	li	s2,-3
c0007218:	02042423          	sw	zero,40(s0)
c000721c:	fc5ff06f          	j	c00071e0 <sysfile_getdirentry+0xf4>
c0007220:	ffc00913          	li	s2,-4
c0007224:	fc5ff06f          	j	c00071e8 <sysfile_getdirentry+0xfc>
c0007228:	00090513          	mv	a0,s2
c000722c:	00048593          	mv	a1,s1
c0007230:	4d1000ef          	jal	ra,c0007f00 <file_getdirentry>
c0007234:	00050913          	mv	s2,a0
c0007238:	fa0514e3          	bnez	a0,c00071e0 <sysfile_getdirentry+0xf4>
c000723c:	10400693          	li	a3,260
c0007240:	00048613          	mv	a2,s1
c0007244:	00098593          	mv	a1,s3
c0007248:	a64fb0ef          	jal	ra,c00024ac <copy_to_user>
c000724c:	f8051ae3          	bnez	a0,c00071e0 <sysfile_getdirentry+0xf4>
c0007250:	f8dff06f          	j	c00071dc <sysfile_getdirentry+0xf0>

c0007254 <sysfile_dup>:
c0007254:	6050006f          	j	c0008058 <file_dup>

c0007258 <get_fd_array.part.4>:
c0007258:	ff010113          	addi	sp,sp,-16
c000725c:	0000f697          	auipc	a3,0xf
c0007260:	b7c68693          	addi	a3,a3,-1156 # c0015dd8 <default_pmm_manager+0xae8>
c0007264:	0000d617          	auipc	a2,0xd
c0007268:	bb860613          	addi	a2,a2,-1096 # c0013e1c <commands+0x164>
c000726c:	01400593          	li	a1,20
c0007270:	0000f517          	auipc	a0,0xf
c0007274:	b9450513          	addi	a0,a0,-1132 # c0015e04 <default_pmm_manager+0xb14>
c0007278:	00112623          	sw	ra,12(sp)
c000727c:	848f90ef          	jal	ra,c00002c4 <__panic>

c0007280 <fd_array_alloc>:
c0007280:	00093797          	auipc	a5,0x93
c0007284:	52c7a783          	lw	a5,1324(a5) # c009a7ac <current>
c0007288:	0dc7a783          	lw	a5,220(a5)
c000728c:	ff010113          	addi	sp,sp,-16
c0007290:	00112623          	sw	ra,12(sp)
c0007294:	0a078463          	beqz	a5,c000733c <fd_array_alloc+0xbc>
c0007298:	0087a703          	lw	a4,8(a5)
c000729c:	0ae05063          	blez	a4,c000733c <fd_array_alloc+0xbc>
c00072a0:	ffff7737          	lui	a4,0xffff7
c00072a4:	ad970713          	addi	a4,a4,-1319 # ffff6ad9 <sbi_remote_fence_i+0xffff71e9>
c00072a8:	0047a683          	lw	a3,4(a5)
c00072ac:	04e50463          	beq	a0,a4,c00072f4 <fd_array_alloc+0x74>
c00072b0:	09000793          	li	a5,144
c00072b4:	06a7e863          	bltu	a5,a0,c0007324 <fd_array_alloc+0xa4>
c00072b8:	00351793          	slli	a5,a0,0x3
c00072bc:	40a787b3          	sub	a5,a5,a0
c00072c0:	00279793          	slli	a5,a5,0x2
c00072c4:	00f687b3          	add	a5,a3,a5
c00072c8:	0007a703          	lw	a4,0(a5)
c00072cc:	06071063          	bnez	a4,c000732c <fd_array_alloc+0xac>
c00072d0:	0187a503          	lw	a0,24(a5)
c00072d4:	06051663          	bnez	a0,c0007340 <fd_array_alloc+0xc0>
c00072d8:	00100713          	li	a4,1
c00072dc:	00e7a023          	sw	a4,0(a5)
c00072e0:	0007aa23          	sw	zero,20(a5)
c00072e4:	00f5a023          	sw	a5,0(a1)
c00072e8:	00c12083          	lw	ra,12(sp)
c00072ec:	01010113          	addi	sp,sp,16
c00072f0:	00008067          	ret
c00072f4:	0006a783          	lw	a5,0(a3)
c00072f8:	02078e63          	beqz	a5,c0007334 <fd_array_alloc+0xb4>
c00072fc:	00001737          	lui	a4,0x1
c0007300:	fdc70713          	addi	a4,a4,-36 # fdc <_binary_bin_swap_img_size-0x6d24>
c0007304:	01c68793          	addi	a5,a3,28
c0007308:	00e686b3          	add	a3,a3,a4
c000730c:	0007a703          	lw	a4,0(a5)
c0007310:	fc0700e3          	beqz	a4,c00072d0 <fd_array_alloc+0x50>
c0007314:	01c78793          	addi	a5,a5,28
c0007318:	fed79ae3          	bne	a5,a3,c000730c <fd_array_alloc+0x8c>
c000731c:	fea00513          	li	a0,-22
c0007320:	fc9ff06f          	j	c00072e8 <fd_array_alloc+0x68>
c0007324:	ffd00513          	li	a0,-3
c0007328:	fc1ff06f          	j	c00072e8 <fd_array_alloc+0x68>
c000732c:	ff100513          	li	a0,-15
c0007330:	fb9ff06f          	j	c00072e8 <fd_array_alloc+0x68>
c0007334:	00068793          	mv	a5,a3
c0007338:	f99ff06f          	j	c00072d0 <fd_array_alloc+0x50>
c000733c:	f1dff0ef          	jal	ra,c0007258 <get_fd_array.part.4>
c0007340:	0000e697          	auipc	a3,0xe
c0007344:	77c68693          	addi	a3,a3,1916 # c0015abc <default_pmm_manager+0x7cc>
c0007348:	0000d617          	auipc	a2,0xd
c000734c:	ad460613          	addi	a2,a2,-1324 # c0013e1c <commands+0x164>
c0007350:	03b00593          	li	a1,59
c0007354:	0000f517          	auipc	a0,0xf
c0007358:	ab050513          	addi	a0,a0,-1360 # c0015e04 <default_pmm_manager+0xb14>
c000735c:	f69f80ef          	jal	ra,c00002c4 <__panic>

c0007360 <fd_array_free>:
c0007360:	00052783          	lw	a5,0(a0)
c0007364:	ff010113          	addi	sp,sp,-16
c0007368:	00812423          	sw	s0,8(sp)
c000736c:	00112623          	sw	ra,12(sp)
c0007370:	00100713          	li	a4,1
c0007374:	00050413          	mv	s0,a0
c0007378:	02e78a63          	beq	a5,a4,c00073ac <fd_array_free+0x4c>
c000737c:	00300713          	li	a4,3
c0007380:	06e79263          	bne	a5,a4,c00073e4 <fd_array_free+0x84>
c0007384:	01852783          	lw	a5,24(a0)
c0007388:	04078063          	beqz	a5,c00073c8 <fd_array_free+0x68>
c000738c:	0000e697          	auipc	a3,0xe
c0007390:	73068693          	addi	a3,a3,1840 # c0015abc <default_pmm_manager+0x7cc>
c0007394:	0000d617          	auipc	a2,0xd
c0007398:	a8860613          	addi	a2,a2,-1400 # c0013e1c <commands+0x164>
c000739c:	04500593          	li	a1,69
c00073a0:	0000f517          	auipc	a0,0xf
c00073a4:	a6450513          	addi	a0,a0,-1436 # c0015e04 <default_pmm_manager+0xb14>
c00073a8:	f1df80ef          	jal	ra,c00002c4 <__panic>
c00073ac:	01852783          	lw	a5,24(a0)
c00073b0:	fc079ee3          	bnez	a5,c000738c <fd_array_free+0x2c>
c00073b4:	00c12083          	lw	ra,12(sp)
c00073b8:	00042023          	sw	zero,0(s0)
c00073bc:	00812403          	lw	s0,8(sp)
c00073c0:	01010113          	addi	sp,sp,16
c00073c4:	00008067          	ret
c00073c8:	01442503          	lw	a0,20(s0)
c00073cc:	3c8080ef          	jal	ra,c000f794 <vfs_close>
c00073d0:	00c12083          	lw	ra,12(sp)
c00073d4:	00042023          	sw	zero,0(s0)
c00073d8:	00812403          	lw	s0,8(sp)
c00073dc:	01010113          	addi	sp,sp,16
c00073e0:	00008067          	ret
c00073e4:	0000e697          	auipc	a3,0xe
c00073e8:	72468693          	addi	a3,a3,1828 # c0015b08 <default_pmm_manager+0x818>
c00073ec:	0000d617          	auipc	a2,0xd
c00073f0:	a3060613          	addi	a2,a2,-1488 # c0013e1c <commands+0x164>
c00073f4:	04400593          	li	a1,68
c00073f8:	0000f517          	auipc	a0,0xf
c00073fc:	a0c50513          	addi	a0,a0,-1524 # c0015e04 <default_pmm_manager+0xb14>
c0007400:	ec5f80ef          	jal	ra,c00002c4 <__panic>

c0007404 <fd_array_release>:
c0007404:	00052783          	lw	a5,0(a0)
c0007408:	ff010113          	addi	sp,sp,-16
c000740c:	00112623          	sw	ra,12(sp)
c0007410:	00100693          	li	a3,1
c0007414:	ffe78793          	addi	a5,a5,-2
c0007418:	04f6e863          	bltu	a3,a5,c0007468 <fd_array_release+0x64>
c000741c:	01852783          	lw	a5,24(a0)
c0007420:	02f05463          	blez	a5,c0007448 <fd_array_release+0x44>
c0007424:	fff78793          	addi	a5,a5,-1
c0007428:	00f52c23          	sw	a5,24(a0)
c000742c:	00078863          	beqz	a5,c000743c <fd_array_release+0x38>
c0007430:	00c12083          	lw	ra,12(sp)
c0007434:	01010113          	addi	sp,sp,16
c0007438:	00008067          	ret
c000743c:	00c12083          	lw	ra,12(sp)
c0007440:	01010113          	addi	sp,sp,16
c0007444:	f1dff06f          	j	c0007360 <fd_array_free>
c0007448:	0000e697          	auipc	a3,0xe
c000744c:	76068693          	addi	a3,a3,1888 # c0015ba8 <default_pmm_manager+0x8b8>
c0007450:	0000d617          	auipc	a2,0xd
c0007454:	9cc60613          	addi	a2,a2,-1588 # c0013e1c <commands+0x164>
c0007458:	05600593          	li	a1,86
c000745c:	0000f517          	auipc	a0,0xf
c0007460:	9a850513          	addi	a0,a0,-1624 # c0015e04 <default_pmm_manager+0xb14>
c0007464:	e61f80ef          	jal	ra,c00002c4 <__panic>
c0007468:	0000e697          	auipc	a3,0xe
c000746c:	70868693          	addi	a3,a3,1800 # c0015b70 <default_pmm_manager+0x880>
c0007470:	0000d617          	auipc	a2,0xd
c0007474:	9ac60613          	addi	a2,a2,-1620 # c0013e1c <commands+0x164>
c0007478:	05500593          	li	a1,85
c000747c:	0000f517          	auipc	a0,0xf
c0007480:	98850513          	addi	a0,a0,-1656 # c0015e04 <default_pmm_manager+0xb14>
c0007484:	e41f80ef          	jal	ra,c00002c4 <__panic>

c0007488 <fd_array_open.part.9>:
c0007488:	ff010113          	addi	sp,sp,-16
c000748c:	0000e697          	auipc	a3,0xe
c0007490:	6b468693          	addi	a3,a3,1716 # c0015b40 <default_pmm_manager+0x850>
c0007494:	0000d617          	auipc	a2,0xd
c0007498:	98860613          	addi	a2,a2,-1656 # c0013e1c <commands+0x164>
c000749c:	05f00593          	li	a1,95
c00074a0:	0000f517          	auipc	a0,0xf
c00074a4:	96450513          	addi	a0,a0,-1692 # c0015e04 <default_pmm_manager+0xb14>
c00074a8:	00112623          	sw	ra,12(sp)
c00074ac:	e19f80ef          	jal	ra,c00002c4 <__panic>

c00074b0 <fd_array_init>:
c00074b0:	00000793          	li	a5,0
c00074b4:	09100713          	li	a4,145
c00074b8:	00f52623          	sw	a5,12(a0)
c00074bc:	00052c23          	sw	zero,24(a0)
c00074c0:	00052023          	sw	zero,0(a0)
c00074c4:	00178793          	addi	a5,a5,1
c00074c8:	01c50513          	addi	a0,a0,28
c00074cc:	fee796e3          	bne	a5,a4,c00074b8 <fd_array_init+0x8>
c00074d0:	00008067          	ret

c00074d4 <fd_array_close>:
c00074d4:	00052683          	lw	a3,0(a0)
c00074d8:	ff010113          	addi	sp,sp,-16
c00074dc:	00112623          	sw	ra,12(sp)
c00074e0:	00200793          	li	a5,2
c00074e4:	04f69c63          	bne	a3,a5,c000753c <fd_array_close+0x68>
c00074e8:	01852783          	lw	a5,24(a0)
c00074ec:	02f05863          	blez	a5,c000751c <fd_array_close+0x48>
c00074f0:	fff78793          	addi	a5,a5,-1
c00074f4:	00300693          	li	a3,3
c00074f8:	00d52023          	sw	a3,0(a0)
c00074fc:	00f52c23          	sw	a5,24(a0)
c0007500:	00078863          	beqz	a5,c0007510 <fd_array_close+0x3c>
c0007504:	00c12083          	lw	ra,12(sp)
c0007508:	01010113          	addi	sp,sp,16
c000750c:	00008067          	ret
c0007510:	00c12083          	lw	ra,12(sp)
c0007514:	01010113          	addi	sp,sp,16
c0007518:	e49ff06f          	j	c0007360 <fd_array_free>
c000751c:	0000e697          	auipc	a3,0xe
c0007520:	68c68693          	addi	a3,a3,1676 # c0015ba8 <default_pmm_manager+0x8b8>
c0007524:	0000d617          	auipc	a2,0xd
c0007528:	8f860613          	addi	a2,a2,-1800 # c0013e1c <commands+0x164>
c000752c:	06800593          	li	a1,104
c0007530:	0000f517          	auipc	a0,0xf
c0007534:	8d450513          	addi	a0,a0,-1836 # c0015e04 <default_pmm_manager+0xb14>
c0007538:	d8df80ef          	jal	ra,c00002c4 <__panic>
c000753c:	0000e697          	auipc	a3,0xe
c0007540:	56468693          	addi	a3,a3,1380 # c0015aa0 <default_pmm_manager+0x7b0>
c0007544:	0000d617          	auipc	a2,0xd
c0007548:	8d860613          	addi	a2,a2,-1832 # c0013e1c <commands+0x164>
c000754c:	06700593          	li	a1,103
c0007550:	0000f517          	auipc	a0,0xf
c0007554:	8b450513          	addi	a0,a0,-1868 # c0015e04 <default_pmm_manager+0xb14>
c0007558:	d6df80ef          	jal	ra,c00002c4 <__panic>

c000755c <fd_array_dup>:
c000755c:	fe010113          	addi	sp,sp,-32
c0007560:	01212823          	sw	s2,16(sp)
c0007564:	00052903          	lw	s2,0(a0)
c0007568:	00112e23          	sw	ra,28(sp)
c000756c:	00812c23          	sw	s0,24(sp)
c0007570:	00912a23          	sw	s1,20(sp)
c0007574:	01312623          	sw	s3,12(sp)
c0007578:	00100793          	li	a5,1
c000757c:	06f91e63          	bne	s2,a5,c00075f8 <fd_array_dup+0x9c>
c0007580:	0005a983          	lw	s3,0(a1)
c0007584:	00200793          	li	a5,2
c0007588:	06f99863          	bne	s3,a5,c00075f8 <fd_array_dup+0x9c>
c000758c:	0145a483          	lw	s1,20(a1)
c0007590:	0085a783          	lw	a5,8(a1)
c0007594:	0105a683          	lw	a3,16(a1)
c0007598:	0045a703          	lw	a4,4(a1)
c000759c:	00050413          	mv	s0,a0
c00075a0:	00f52423          	sw	a5,8(a0)
c00075a4:	00d52823          	sw	a3,16(a0)
c00075a8:	00e52223          	sw	a4,4(a0)
c00075ac:	00048513          	mv	a0,s1
c00075b0:	501070ef          	jal	ra,c000f2b0 <inode_ref_inc>
c00075b4:	00048513          	mv	a0,s1
c00075b8:	50d070ef          	jal	ra,c000f2c4 <inode_open_inc>
c00075bc:	00042783          	lw	a5,0(s0)
c00075c0:	00942a23          	sw	s1,20(s0)
c00075c4:	05279a63          	bne	a5,s2,c0007618 <fd_array_dup+0xbc>
c00075c8:	04048863          	beqz	s1,c0007618 <fd_array_dup+0xbc>
c00075cc:	01842783          	lw	a5,24(s0)
c00075d0:	01c12083          	lw	ra,28(sp)
c00075d4:	01342023          	sw	s3,0(s0)
c00075d8:	00178793          	addi	a5,a5,1
c00075dc:	00f42c23          	sw	a5,24(s0)
c00075e0:	01412483          	lw	s1,20(sp)
c00075e4:	01812403          	lw	s0,24(sp)
c00075e8:	01012903          	lw	s2,16(sp)
c00075ec:	00c12983          	lw	s3,12(sp)
c00075f0:	02010113          	addi	sp,sp,32
c00075f4:	00008067          	ret
c00075f8:	0000e697          	auipc	a3,0xe
c00075fc:	4dc68693          	addi	a3,a3,1244 # c0015ad4 <default_pmm_manager+0x7e4>
c0007600:	0000d617          	auipc	a2,0xd
c0007604:	81c60613          	addi	a2,a2,-2020 # c0013e1c <commands+0x164>
c0007608:	07300593          	li	a1,115
c000760c:	0000e517          	auipc	a0,0xe
c0007610:	7f850513          	addi	a0,a0,2040 # c0015e04 <default_pmm_manager+0xb14>
c0007614:	cb1f80ef          	jal	ra,c00002c4 <__panic>
c0007618:	e71ff0ef          	jal	ra,c0007488 <fd_array_open.part.9>

c000761c <file_testfd>:
c000761c:	09000793          	li	a5,144
c0007620:	06a7e463          	bltu	a5,a0,c0007688 <file_testfd+0x6c>
c0007624:	00093797          	auipc	a5,0x93
c0007628:	1887a783          	lw	a5,392(a5) # c009a7ac <current>
c000762c:	0dc7a703          	lw	a4,220(a5)
c0007630:	06070063          	beqz	a4,c0007690 <file_testfd+0x74>
c0007634:	00872783          	lw	a5,8(a4)
c0007638:	04f05c63          	blez	a5,c0007690 <file_testfd+0x74>
c000763c:	00472703          	lw	a4,4(a4)
c0007640:	00351793          	slli	a5,a0,0x3
c0007644:	40a787b3          	sub	a5,a5,a0
c0007648:	00279793          	slli	a5,a5,0x2
c000764c:	00f707b3          	add	a5,a4,a5
c0007650:	0007a683          	lw	a3,0(a5)
c0007654:	00200713          	li	a4,2
c0007658:	02e69863          	bne	a3,a4,c0007688 <file_testfd+0x6c>
c000765c:	00c7a703          	lw	a4,12(a5)
c0007660:	02e51463          	bne	a0,a4,c0007688 <file_testfd+0x6c>
c0007664:	00059c63          	bnez	a1,c000767c <file_testfd+0x60>
c0007668:	00100513          	li	a0,1
c000766c:	00060663          	beqz	a2,c0007678 <file_testfd+0x5c>
c0007670:	0087a503          	lw	a0,8(a5)
c0007674:	00a03533          	snez	a0,a0
c0007678:	00008067          	ret
c000767c:	0047a503          	lw	a0,4(a5)
c0007680:	fe0514e3          	bnez	a0,c0007668 <file_testfd+0x4c>
c0007684:	00008067          	ret
c0007688:	00000513          	li	a0,0
c000768c:	00008067          	ret
c0007690:	ff010113          	addi	sp,sp,-16
c0007694:	00112623          	sw	ra,12(sp)
c0007698:	bc1ff0ef          	jal	ra,c0007258 <get_fd_array.part.4>

c000769c <file_open>:
c000769c:	fc010113          	addi	sp,sp,-64
c00076a0:	02112e23          	sw	ra,60(sp)
c00076a4:	02812c23          	sw	s0,56(sp)
c00076a8:	02912a23          	sw	s1,52(sp)
c00076ac:	03212823          	sw	s2,48(sp)
c00076b0:	03312623          	sw	s3,44(sp)
c00076b4:	03412423          	sw	s4,40(sp)
c00076b8:	0035f793          	andi	a5,a1,3
c00076bc:	00100713          	li	a4,1
c00076c0:	12e78063          	beq	a5,a4,c00077e0 <file_open+0x144>
c00076c4:	10078863          	beqz	a5,c00077d4 <file_open+0x138>
c00076c8:	00200693          	li	a3,2
c00076cc:	0ed79063          	bne	a5,a3,c00077ac <file_open+0x110>
c00076d0:	00070913          	mv	s2,a4
c00076d4:	00070a13          	mv	s4,a4
c00076d8:	00050993          	mv	s3,a0
c00076dc:	ffff7537          	lui	a0,0xffff7
c00076e0:	00058413          	mv	s0,a1
c00076e4:	ad950513          	addi	a0,a0,-1319 # ffff6ad9 <sbi_remote_fence_i+0xffff71e9>
c00076e8:	00810593          	addi	a1,sp,8
c00076ec:	b95ff0ef          	jal	ra,c0007280 <fd_array_alloc>
c00076f0:	00050493          	mv	s1,a0
c00076f4:	0a051e63          	bnez	a0,c00077b0 <file_open+0x114>
c00076f8:	00c10613          	addi	a2,sp,12
c00076fc:	00040593          	mv	a1,s0
c0007700:	00098513          	mv	a0,s3
c0007704:	645070ef          	jal	ra,c000f548 <vfs_open>
c0007708:	00050493          	mv	s1,a0
c000770c:	0e051463          	bnez	a0,c00077f4 <file_open+0x158>
c0007710:	00812783          	lw	a5,8(sp)
c0007714:	02047593          	andi	a1,s0,32
c0007718:	0007a823          	sw	zero,16(a5)
c000771c:	04058a63          	beqz	a1,c0007770 <file_open+0xd4>
c0007720:	00c12403          	lw	s0,12(sp)
c0007724:	0e040063          	beqz	s0,c0007804 <file_open+0x168>
c0007728:	03c42783          	lw	a5,60(s0)
c000772c:	0c078c63          	beqz	a5,c0007804 <file_open+0x168>
c0007730:	0147a783          	lw	a5,20(a5)
c0007734:	0c078863          	beqz	a5,c0007804 <file_open+0x168>
c0007738:	0000e597          	auipc	a1,0xe
c000773c:	59058593          	addi	a1,a1,1424 # c0015cc8 <default_pmm_manager+0x9d8>
c0007740:	00040513          	mv	a0,s0
c0007744:	395070ef          	jal	ra,c000f2d8 <inode_check>
c0007748:	03c42783          	lw	a5,60(s0)
c000774c:	00c12503          	lw	a0,12(sp)
c0007750:	01010593          	addi	a1,sp,16
c0007754:	0147a783          	lw	a5,20(a5)
c0007758:	000780e7          	jalr	a5
c000775c:	00050493          	mv	s1,a0
c0007760:	08051663          	bnez	a0,c00077ec <file_open+0x150>
c0007764:	00812783          	lw	a5,8(sp)
c0007768:	01c12703          	lw	a4,28(sp)
c000776c:	00e7a823          	sw	a4,16(a5)
c0007770:	00c12703          	lw	a4,12(sp)
c0007774:	0007a603          	lw	a2,0(a5)
c0007778:	0147a223          	sw	s4,4(a5)
c000777c:	00e7aa23          	sw	a4,20(a5)
c0007780:	0127a423          	sw	s2,8(a5)
c0007784:	00100693          	li	a3,1
c0007788:	06d61c63          	bne	a2,a3,c0007800 <file_open+0x164>
c000778c:	06070a63          	beqz	a4,c0007800 <file_open+0x164>
c0007790:	0187a703          	lw	a4,24(a5)
c0007794:	00200693          	li	a3,2
c0007798:	00d7a023          	sw	a3,0(a5)
c000779c:	00170713          	addi	a4,a4,1
c00077a0:	00e7ac23          	sw	a4,24(a5)
c00077a4:	00c7a483          	lw	s1,12(a5)
c00077a8:	0080006f          	j	c00077b0 <file_open+0x114>
c00077ac:	ffd00493          	li	s1,-3
c00077b0:	03c12083          	lw	ra,60(sp)
c00077b4:	00048513          	mv	a0,s1
c00077b8:	03812403          	lw	s0,56(sp)
c00077bc:	03412483          	lw	s1,52(sp)
c00077c0:	03012903          	lw	s2,48(sp)
c00077c4:	02c12983          	lw	s3,44(sp)
c00077c8:	02812a03          	lw	s4,40(sp)
c00077cc:	04010113          	addi	sp,sp,64
c00077d0:	00008067          	ret
c00077d4:	00000913          	li	s2,0
c00077d8:	00070a13          	mv	s4,a4
c00077dc:	efdff06f          	j	c00076d8 <file_open+0x3c>
c00077e0:	00078913          	mv	s2,a5
c00077e4:	00000a13          	li	s4,0
c00077e8:	ef1ff06f          	j	c00076d8 <file_open+0x3c>
c00077ec:	00c12503          	lw	a0,12(sp)
c00077f0:	7a5070ef          	jal	ra,c000f794 <vfs_close>
c00077f4:	00812503          	lw	a0,8(sp)
c00077f8:	b69ff0ef          	jal	ra,c0007360 <fd_array_free>
c00077fc:	fb5ff06f          	j	c00077b0 <file_open+0x114>
c0007800:	c89ff0ef          	jal	ra,c0007488 <fd_array_open.part.9>
c0007804:	0000e697          	auipc	a3,0xe
c0007808:	47468693          	addi	a3,a3,1140 # c0015c78 <default_pmm_manager+0x988>
c000780c:	0000c617          	auipc	a2,0xc
c0007810:	61060613          	addi	a2,a2,1552 # c0013e1c <commands+0x164>
c0007814:	0b800593          	li	a1,184
c0007818:	0000e517          	auipc	a0,0xe
c000781c:	5ec50513          	addi	a0,a0,1516 # c0015e04 <default_pmm_manager+0xb14>
c0007820:	aa5f80ef          	jal	ra,c00002c4 <__panic>

c0007824 <file_close>:
c0007824:	09000793          	li	a5,144
c0007828:	06a7e663          	bltu	a5,a0,c0007894 <file_close+0x70>
c000782c:	00093797          	auipc	a5,0x93
c0007830:	f807a783          	lw	a5,-128(a5) # c009a7ac <current>
c0007834:	0dc7a683          	lw	a3,220(a5)
c0007838:	ff010113          	addi	sp,sp,-16
c000783c:	00112623          	sw	ra,12(sp)
c0007840:	00050713          	mv	a4,a0
c0007844:	04068c63          	beqz	a3,c000789c <file_close+0x78>
c0007848:	0086a783          	lw	a5,8(a3)
c000784c:	04f05863          	blez	a5,c000789c <file_close+0x78>
c0007850:	00351793          	slli	a5,a0,0x3
c0007854:	0046a503          	lw	a0,4(a3)
c0007858:	40e787b3          	sub	a5,a5,a4
c000785c:	00279793          	slli	a5,a5,0x2
c0007860:	00f507b3          	add	a5,a0,a5
c0007864:	0007a603          	lw	a2,0(a5)
c0007868:	00200693          	li	a3,2
c000786c:	ffd00513          	li	a0,-3
c0007870:	00d61c63          	bne	a2,a3,c0007888 <file_close+0x64>
c0007874:	00c7a683          	lw	a3,12(a5)
c0007878:	00d71863          	bne	a4,a3,c0007888 <file_close+0x64>
c000787c:	00078513          	mv	a0,a5
c0007880:	c55ff0ef          	jal	ra,c00074d4 <fd_array_close>
c0007884:	00000513          	li	a0,0
c0007888:	00c12083          	lw	ra,12(sp)
c000788c:	01010113          	addi	sp,sp,16
c0007890:	00008067          	ret
c0007894:	ffd00513          	li	a0,-3
c0007898:	00008067          	ret
c000789c:	9bdff0ef          	jal	ra,c0007258 <get_fd_array.part.4>

c00078a0 <file_read>:
c00078a0:	fd010113          	addi	sp,sp,-48
c00078a4:	02112623          	sw	ra,44(sp)
c00078a8:	02812423          	sw	s0,40(sp)
c00078ac:	02912223          	sw	s1,36(sp)
c00078b0:	03212023          	sw	s2,32(sp)
c00078b4:	01312e23          	sw	s3,28(sp)
c00078b8:	01412c23          	sw	s4,24(sp)
c00078bc:	0006a023          	sw	zero,0(a3)
c00078c0:	09000793          	li	a5,144
c00078c4:	0ea7e863          	bltu	a5,a0,c00079b4 <file_read+0x114>
c00078c8:	00093797          	auipc	a5,0x93
c00078cc:	ee47a783          	lw	a5,-284(a5) # c009a7ac <current>
c00078d0:	0dc7a703          	lw	a4,220(a5)
c00078d4:	00068493          	mv	s1,a3
c00078d8:	0e070a63          	beqz	a4,c00079cc <file_read+0x12c>
c00078dc:	00872783          	lw	a5,8(a4)
c00078e0:	0ef05663          	blez	a5,c00079cc <file_read+0x12c>
c00078e4:	00351793          	slli	a5,a0,0x3
c00078e8:	00472403          	lw	s0,4(a4)
c00078ec:	40a787b3          	sub	a5,a5,a0
c00078f0:	00279793          	slli	a5,a5,0x2
c00078f4:	00f40433          	add	s0,s0,a5
c00078f8:	00042983          	lw	s3,0(s0)
c00078fc:	00200793          	li	a5,2
c0007900:	0af99a63          	bne	s3,a5,c00079b4 <file_read+0x114>
c0007904:	00c42783          	lw	a5,12(s0)
c0007908:	0af51663          	bne	a0,a5,c00079b4 <file_read+0x114>
c000790c:	00442783          	lw	a5,4(s0)
c0007910:	0a078263          	beqz	a5,c00079b4 <file_read+0x114>
c0007914:	01842783          	lw	a5,24(s0)
c0007918:	01042683          	lw	a3,16(s0)
c000791c:	00010513          	mv	a0,sp
c0007920:	00178793          	addi	a5,a5,1
c0007924:	00f42c23          	sw	a5,24(s0)
c0007928:	009000ef          	jal	ra,c0008130 <iobuf_init>
c000792c:	01442903          	lw	s2,20(s0)
c0007930:	00050a13          	mv	s4,a0
c0007934:	08090e63          	beqz	s2,c00079d0 <file_read+0x130>
c0007938:	03c92783          	lw	a5,60(s2) # 103c <_binary_bin_swap_img_size-0x6cc4>
c000793c:	08078a63          	beqz	a5,c00079d0 <file_read+0x130>
c0007940:	00c7a783          	lw	a5,12(a5)
c0007944:	08078663          	beqz	a5,c00079d0 <file_read+0x130>
c0007948:	00090513          	mv	a0,s2
c000794c:	0000e597          	auipc	a1,0xe
c0007950:	3d458593          	addi	a1,a1,980 # c0015d20 <default_pmm_manager+0xa30>
c0007954:	185070ef          	jal	ra,c000f2d8 <inode_check>
c0007958:	03c92783          	lw	a5,60(s2)
c000795c:	01442503          	lw	a0,20(s0)
c0007960:	000a0593          	mv	a1,s4
c0007964:	00c7a783          	lw	a5,12(a5)
c0007968:	000780e7          	jalr	a5
c000796c:	008a2783          	lw	a5,8(s4)
c0007970:	00ca2683          	lw	a3,12(s4)
c0007974:	00042703          	lw	a4,0(s0)
c0007978:	00050913          	mv	s2,a0
c000797c:	40d787b3          	sub	a5,a5,a3
c0007980:	03370e63          	beq	a4,s3,c00079bc <file_read+0x11c>
c0007984:	00f4a023          	sw	a5,0(s1)
c0007988:	00040513          	mv	a0,s0
c000798c:	a79ff0ef          	jal	ra,c0007404 <fd_array_release>
c0007990:	02c12083          	lw	ra,44(sp)
c0007994:	00090513          	mv	a0,s2
c0007998:	02812403          	lw	s0,40(sp)
c000799c:	02412483          	lw	s1,36(sp)
c00079a0:	02012903          	lw	s2,32(sp)
c00079a4:	01c12983          	lw	s3,28(sp)
c00079a8:	01812a03          	lw	s4,24(sp)
c00079ac:	03010113          	addi	sp,sp,48
c00079b0:	00008067          	ret
c00079b4:	ffd00913          	li	s2,-3
c00079b8:	fd9ff06f          	j	c0007990 <file_read+0xf0>
c00079bc:	01042703          	lw	a4,16(s0)
c00079c0:	00f70733          	add	a4,a4,a5
c00079c4:	00e42823          	sw	a4,16(s0)
c00079c8:	fbdff06f          	j	c0007984 <file_read+0xe4>
c00079cc:	88dff0ef          	jal	ra,c0007258 <get_fd_array.part.4>
c00079d0:	0000e697          	auipc	a3,0xe
c00079d4:	30068693          	addi	a3,a3,768 # c0015cd0 <default_pmm_manager+0x9e0>
c00079d8:	0000c617          	auipc	a2,0xc
c00079dc:	44460613          	addi	a2,a2,1092 # c0013e1c <commands+0x164>
c00079e0:	0e200593          	li	a1,226
c00079e4:	0000e517          	auipc	a0,0xe
c00079e8:	42050513          	addi	a0,a0,1056 # c0015e04 <default_pmm_manager+0xb14>
c00079ec:	8d9f80ef          	jal	ra,c00002c4 <__panic>

c00079f0 <file_write>:
c00079f0:	fd010113          	addi	sp,sp,-48
c00079f4:	02112623          	sw	ra,44(sp)
c00079f8:	02812423          	sw	s0,40(sp)
c00079fc:	02912223          	sw	s1,36(sp)
c0007a00:	03212023          	sw	s2,32(sp)
c0007a04:	01312e23          	sw	s3,28(sp)
c0007a08:	01412c23          	sw	s4,24(sp)
c0007a0c:	0006a023          	sw	zero,0(a3)
c0007a10:	09000793          	li	a5,144
c0007a14:	0ea7e863          	bltu	a5,a0,c0007b04 <file_write+0x114>
c0007a18:	00093797          	auipc	a5,0x93
c0007a1c:	d947a783          	lw	a5,-620(a5) # c009a7ac <current>
c0007a20:	0dc7a703          	lw	a4,220(a5)
c0007a24:	00068493          	mv	s1,a3
c0007a28:	0e070a63          	beqz	a4,c0007b1c <file_write+0x12c>
c0007a2c:	00872783          	lw	a5,8(a4)
c0007a30:	0ef05663          	blez	a5,c0007b1c <file_write+0x12c>
c0007a34:	00351793          	slli	a5,a0,0x3
c0007a38:	00472403          	lw	s0,4(a4)
c0007a3c:	40a787b3          	sub	a5,a5,a0
c0007a40:	00279793          	slli	a5,a5,0x2
c0007a44:	00f40433          	add	s0,s0,a5
c0007a48:	00042983          	lw	s3,0(s0)
c0007a4c:	00200793          	li	a5,2
c0007a50:	0af99a63          	bne	s3,a5,c0007b04 <file_write+0x114>
c0007a54:	00c42783          	lw	a5,12(s0)
c0007a58:	0af51663          	bne	a0,a5,c0007b04 <file_write+0x114>
c0007a5c:	00842783          	lw	a5,8(s0)
c0007a60:	0a078263          	beqz	a5,c0007b04 <file_write+0x114>
c0007a64:	01842783          	lw	a5,24(s0)
c0007a68:	01042683          	lw	a3,16(s0)
c0007a6c:	00010513          	mv	a0,sp
c0007a70:	00178793          	addi	a5,a5,1
c0007a74:	00f42c23          	sw	a5,24(s0)
c0007a78:	6b8000ef          	jal	ra,c0008130 <iobuf_init>
c0007a7c:	01442903          	lw	s2,20(s0)
c0007a80:	00050a13          	mv	s4,a0
c0007a84:	08090e63          	beqz	s2,c0007b20 <file_write+0x130>
c0007a88:	03c92783          	lw	a5,60(s2)
c0007a8c:	08078a63          	beqz	a5,c0007b20 <file_write+0x130>
c0007a90:	0107a783          	lw	a5,16(a5)
c0007a94:	08078663          	beqz	a5,c0007b20 <file_write+0x130>
c0007a98:	00090513          	mv	a0,s2
c0007a9c:	0000e597          	auipc	a1,0xe
c0007aa0:	33458593          	addi	a1,a1,820 # c0015dd0 <default_pmm_manager+0xae0>
c0007aa4:	035070ef          	jal	ra,c000f2d8 <inode_check>
c0007aa8:	03c92783          	lw	a5,60(s2)
c0007aac:	01442503          	lw	a0,20(s0)
c0007ab0:	000a0593          	mv	a1,s4
c0007ab4:	0107a783          	lw	a5,16(a5)
c0007ab8:	000780e7          	jalr	a5
c0007abc:	008a2783          	lw	a5,8(s4)
c0007ac0:	00ca2683          	lw	a3,12(s4)
c0007ac4:	00042703          	lw	a4,0(s0)
c0007ac8:	00050913          	mv	s2,a0
c0007acc:	40d787b3          	sub	a5,a5,a3
c0007ad0:	03370e63          	beq	a4,s3,c0007b0c <file_write+0x11c>
c0007ad4:	00f4a023          	sw	a5,0(s1)
c0007ad8:	00040513          	mv	a0,s0
c0007adc:	929ff0ef          	jal	ra,c0007404 <fd_array_release>
c0007ae0:	02c12083          	lw	ra,44(sp)
c0007ae4:	00090513          	mv	a0,s2
c0007ae8:	02812403          	lw	s0,40(sp)
c0007aec:	02412483          	lw	s1,36(sp)
c0007af0:	02012903          	lw	s2,32(sp)
c0007af4:	01c12983          	lw	s3,28(sp)
c0007af8:	01812a03          	lw	s4,24(sp)
c0007afc:	03010113          	addi	sp,sp,48
c0007b00:	00008067          	ret
c0007b04:	ffd00913          	li	s2,-3
c0007b08:	fd9ff06f          	j	c0007ae0 <file_write+0xf0>
c0007b0c:	01042703          	lw	a4,16(s0)
c0007b10:	00f70733          	add	a4,a4,a5
c0007b14:	00e42823          	sw	a4,16(s0)
c0007b18:	fbdff06f          	j	c0007ad4 <file_write+0xe4>
c0007b1c:	f3cff0ef          	jal	ra,c0007258 <get_fd_array.part.4>
c0007b20:	0000e697          	auipc	a3,0xe
c0007b24:	26068693          	addi	a3,a3,608 # c0015d80 <default_pmm_manager+0xa90>
c0007b28:	0000c617          	auipc	a2,0xc
c0007b2c:	2f460613          	addi	a2,a2,756 # c0013e1c <commands+0x164>
c0007b30:	0fc00593          	li	a1,252
c0007b34:	0000e517          	auipc	a0,0xe
c0007b38:	2d050513          	addi	a0,a0,720 # c0015e04 <default_pmm_manager+0xb14>
c0007b3c:	f88f80ef          	jal	ra,c00002c4 <__panic>

c0007b40 <file_seek>:
c0007b40:	fe010113          	addi	sp,sp,-32
c0007b44:	00112e23          	sw	ra,28(sp)
c0007b48:	00812c23          	sw	s0,24(sp)
c0007b4c:	00912a23          	sw	s1,20(sp)
c0007b50:	01212823          	sw	s2,16(sp)
c0007b54:	09000793          	li	a5,144
c0007b58:	12a7e263          	bltu	a5,a0,c0007c7c <file_seek+0x13c>
c0007b5c:	00093797          	auipc	a5,0x93
c0007b60:	c507a783          	lw	a5,-944(a5) # c009a7ac <current>
c0007b64:	0dc7a703          	lw	a4,220(a5)
c0007b68:	14070063          	beqz	a4,c0007ca8 <file_seek+0x168>
c0007b6c:	00872783          	lw	a5,8(a4)
c0007b70:	12f05c63          	blez	a5,c0007ca8 <file_seek+0x168>
c0007b74:	00472403          	lw	s0,4(a4)
c0007b78:	00351793          	slli	a5,a0,0x3
c0007b7c:	40a787b3          	sub	a5,a5,a0
c0007b80:	00279793          	slli	a5,a5,0x2
c0007b84:	00f40433          	add	s0,s0,a5
c0007b88:	00042703          	lw	a4,0(s0)
c0007b8c:	00200793          	li	a5,2
c0007b90:	0ef71663          	bne	a4,a5,c0007c7c <file_seek+0x13c>
c0007b94:	00c42783          	lw	a5,12(s0)
c0007b98:	0ef51263          	bne	a0,a5,c0007c7c <file_seek+0x13c>
c0007b9c:	01842783          	lw	a5,24(s0)
c0007ba0:	00100693          	li	a3,1
c0007ba4:	00058913          	mv	s2,a1
c0007ba8:	00d787b3          	add	a5,a5,a3
c0007bac:	00f42c23          	sw	a5,24(s0)
c0007bb0:	0ed60663          	beq	a2,a3,c0007c9c <file_seek+0x15c>
c0007bb4:	02e60863          	beq	a2,a4,c0007be4 <file_seek+0xa4>
c0007bb8:	ffd00493          	li	s1,-3
c0007bbc:	06060a63          	beqz	a2,c0007c30 <file_seek+0xf0>
c0007bc0:	00040513          	mv	a0,s0
c0007bc4:	841ff0ef          	jal	ra,c0007404 <fd_array_release>
c0007bc8:	01c12083          	lw	ra,28(sp)
c0007bcc:	00048513          	mv	a0,s1
c0007bd0:	01812403          	lw	s0,24(sp)
c0007bd4:	01412483          	lw	s1,20(sp)
c0007bd8:	01012903          	lw	s2,16(sp)
c0007bdc:	02010113          	addi	sp,sp,32
c0007be0:	00008067          	ret
c0007be4:	01442483          	lw	s1,20(s0)
c0007be8:	0e048263          	beqz	s1,c0007ccc <file_seek+0x18c>
c0007bec:	03c4a783          	lw	a5,60(s1)
c0007bf0:	0c078e63          	beqz	a5,c0007ccc <file_seek+0x18c>
c0007bf4:	0147a783          	lw	a5,20(a5)
c0007bf8:	0c078a63          	beqz	a5,c0007ccc <file_seek+0x18c>
c0007bfc:	00048513          	mv	a0,s1
c0007c00:	0000e597          	auipc	a1,0xe
c0007c04:	0c858593          	addi	a1,a1,200 # c0015cc8 <default_pmm_manager+0x9d8>
c0007c08:	6d0070ef          	jal	ra,c000f2d8 <inode_check>
c0007c0c:	03c4a783          	lw	a5,60(s1)
c0007c10:	01442503          	lw	a0,20(s0)
c0007c14:	00010593          	mv	a1,sp
c0007c18:	0147a783          	lw	a5,20(a5)
c0007c1c:	000780e7          	jalr	a5
c0007c20:	00050493          	mv	s1,a0
c0007c24:	f8051ee3          	bnez	a0,c0007bc0 <file_seek+0x80>
c0007c28:	00c12783          	lw	a5,12(sp)
c0007c2c:	00f90933          	add	s2,s2,a5
c0007c30:	01442483          	lw	s1,20(s0)
c0007c34:	06048c63          	beqz	s1,c0007cac <file_seek+0x16c>
c0007c38:	03c4a783          	lw	a5,60(s1)
c0007c3c:	06078863          	beqz	a5,c0007cac <file_seek+0x16c>
c0007c40:	02c7a783          	lw	a5,44(a5)
c0007c44:	06078463          	beqz	a5,c0007cac <file_seek+0x16c>
c0007c48:	00048513          	mv	a0,s1
c0007c4c:	0000e597          	auipc	a1,0xe
c0007c50:	12c58593          	addi	a1,a1,300 # c0015d78 <default_pmm_manager+0xa88>
c0007c54:	684070ef          	jal	ra,c000f2d8 <inode_check>
c0007c58:	03c4a783          	lw	a5,60(s1)
c0007c5c:	01442503          	lw	a0,20(s0)
c0007c60:	00090593          	mv	a1,s2
c0007c64:	02c7a783          	lw	a5,44(a5)
c0007c68:	000780e7          	jalr	a5
c0007c6c:	00050493          	mv	s1,a0
c0007c70:	f40518e3          	bnez	a0,c0007bc0 <file_seek+0x80>
c0007c74:	01242823          	sw	s2,16(s0)
c0007c78:	f49ff06f          	j	c0007bc0 <file_seek+0x80>
c0007c7c:	01c12083          	lw	ra,28(sp)
c0007c80:	ffd00493          	li	s1,-3
c0007c84:	00048513          	mv	a0,s1
c0007c88:	01812403          	lw	s0,24(sp)
c0007c8c:	01412483          	lw	s1,20(sp)
c0007c90:	01012903          	lw	s2,16(sp)
c0007c94:	02010113          	addi	sp,sp,32
c0007c98:	00008067          	ret
c0007c9c:	01042783          	lw	a5,16(s0)
c0007ca0:	00f90933          	add	s2,s2,a5
c0007ca4:	f8dff06f          	j	c0007c30 <file_seek+0xf0>
c0007ca8:	db0ff0ef          	jal	ra,c0007258 <get_fd_array.part.4>
c0007cac:	0000e697          	auipc	a3,0xe
c0007cb0:	07c68693          	addi	a3,a3,124 # c0015d28 <default_pmm_manager+0xa38>
c0007cb4:	0000c617          	auipc	a2,0xc
c0007cb8:	16860613          	addi	a2,a2,360 # c0013e1c <commands+0x164>
c0007cbc:	11e00593          	li	a1,286
c0007cc0:	0000e517          	auipc	a0,0xe
c0007cc4:	14450513          	addi	a0,a0,324 # c0015e04 <default_pmm_manager+0xb14>
c0007cc8:	dfcf80ef          	jal	ra,c00002c4 <__panic>
c0007ccc:	0000e697          	auipc	a3,0xe
c0007cd0:	fac68693          	addi	a3,a3,-84 # c0015c78 <default_pmm_manager+0x988>
c0007cd4:	0000c617          	auipc	a2,0xc
c0007cd8:	14860613          	addi	a2,a2,328 # c0013e1c <commands+0x164>
c0007cdc:	11600593          	li	a1,278
c0007ce0:	0000e517          	auipc	a0,0xe
c0007ce4:	12450513          	addi	a0,a0,292 # c0015e04 <default_pmm_manager+0xb14>
c0007ce8:	ddcf80ef          	jal	ra,c00002c4 <__panic>

c0007cec <file_fstat>:
c0007cec:	ff010113          	addi	sp,sp,-16
c0007cf0:	00112623          	sw	ra,12(sp)
c0007cf4:	00812423          	sw	s0,8(sp)
c0007cf8:	00912223          	sw	s1,4(sp)
c0007cfc:	01212023          	sw	s2,0(sp)
c0007d00:	09000793          	li	a5,144
c0007d04:	0aa7ec63          	bltu	a5,a0,c0007dbc <file_fstat+0xd0>
c0007d08:	00093797          	auipc	a5,0x93
c0007d0c:	aa47a783          	lw	a5,-1372(a5) # c009a7ac <current>
c0007d10:	0dc7a703          	lw	a4,220(a5)
c0007d14:	00058493          	mv	s1,a1
c0007d18:	0c070263          	beqz	a4,c0007ddc <file_fstat+0xf0>
c0007d1c:	00872783          	lw	a5,8(a4)
c0007d20:	0af05e63          	blez	a5,c0007ddc <file_fstat+0xf0>
c0007d24:	00472403          	lw	s0,4(a4)
c0007d28:	00351793          	slli	a5,a0,0x3
c0007d2c:	40a787b3          	sub	a5,a5,a0
c0007d30:	00279793          	slli	a5,a5,0x2
c0007d34:	00f40433          	add	s0,s0,a5
c0007d38:	00042703          	lw	a4,0(s0)
c0007d3c:	00200793          	li	a5,2
c0007d40:	06f71e63          	bne	a4,a5,c0007dbc <file_fstat+0xd0>
c0007d44:	00c42783          	lw	a5,12(s0)
c0007d48:	06f51a63          	bne	a0,a5,c0007dbc <file_fstat+0xd0>
c0007d4c:	01842783          	lw	a5,24(s0)
c0007d50:	01442903          	lw	s2,20(s0)
c0007d54:	00178793          	addi	a5,a5,1
c0007d58:	00f42c23          	sw	a5,24(s0)
c0007d5c:	08090263          	beqz	s2,c0007de0 <file_fstat+0xf4>
c0007d60:	03c92783          	lw	a5,60(s2)
c0007d64:	06078e63          	beqz	a5,c0007de0 <file_fstat+0xf4>
c0007d68:	0147a783          	lw	a5,20(a5)
c0007d6c:	06078a63          	beqz	a5,c0007de0 <file_fstat+0xf4>
c0007d70:	00090513          	mv	a0,s2
c0007d74:	0000e597          	auipc	a1,0xe
c0007d78:	f5458593          	addi	a1,a1,-172 # c0015cc8 <default_pmm_manager+0x9d8>
c0007d7c:	55c070ef          	jal	ra,c000f2d8 <inode_check>
c0007d80:	03c92783          	lw	a5,60(s2)
c0007d84:	01442503          	lw	a0,20(s0)
c0007d88:	00048593          	mv	a1,s1
c0007d8c:	0147a783          	lw	a5,20(a5)
c0007d90:	000780e7          	jalr	a5
c0007d94:	00050493          	mv	s1,a0
c0007d98:	00040513          	mv	a0,s0
c0007d9c:	e68ff0ef          	jal	ra,c0007404 <fd_array_release>
c0007da0:	00c12083          	lw	ra,12(sp)
c0007da4:	00048513          	mv	a0,s1
c0007da8:	00812403          	lw	s0,8(sp)
c0007dac:	00412483          	lw	s1,4(sp)
c0007db0:	00012903          	lw	s2,0(sp)
c0007db4:	01010113          	addi	sp,sp,16
c0007db8:	00008067          	ret
c0007dbc:	00c12083          	lw	ra,12(sp)
c0007dc0:	ffd00493          	li	s1,-3
c0007dc4:	00048513          	mv	a0,s1
c0007dc8:	00812403          	lw	s0,8(sp)
c0007dcc:	00412483          	lw	s1,4(sp)
c0007dd0:	00012903          	lw	s2,0(sp)
c0007dd4:	01010113          	addi	sp,sp,16
c0007dd8:	00008067          	ret
c0007ddc:	c7cff0ef          	jal	ra,c0007258 <get_fd_array.part.4>
c0007de0:	0000e697          	auipc	a3,0xe
c0007de4:	e9868693          	addi	a3,a3,-360 # c0015c78 <default_pmm_manager+0x988>
c0007de8:	0000c617          	auipc	a2,0xc
c0007dec:	03460613          	addi	a2,a2,52 # c0013e1c <commands+0x164>
c0007df0:	13000593          	li	a1,304
c0007df4:	0000e517          	auipc	a0,0xe
c0007df8:	01050513          	addi	a0,a0,16 # c0015e04 <default_pmm_manager+0xb14>
c0007dfc:	cc8f80ef          	jal	ra,c00002c4 <__panic>

c0007e00 <file_fsync>:
c0007e00:	ff010113          	addi	sp,sp,-16
c0007e04:	00112623          	sw	ra,12(sp)
c0007e08:	00812423          	sw	s0,8(sp)
c0007e0c:	00912223          	sw	s1,4(sp)
c0007e10:	09000793          	li	a5,144
c0007e14:	0aa7e663          	bltu	a5,a0,c0007ec0 <file_fsync+0xc0>
c0007e18:	00093797          	auipc	a5,0x93
c0007e1c:	9947a783          	lw	a5,-1644(a5) # c009a7ac <current>
c0007e20:	0dc7a703          	lw	a4,220(a5)
c0007e24:	0a070c63          	beqz	a4,c0007edc <file_fsync+0xdc>
c0007e28:	00872783          	lw	a5,8(a4)
c0007e2c:	0af05863          	blez	a5,c0007edc <file_fsync+0xdc>
c0007e30:	00472403          	lw	s0,4(a4)
c0007e34:	00351793          	slli	a5,a0,0x3
c0007e38:	40a787b3          	sub	a5,a5,a0
c0007e3c:	00279793          	slli	a5,a5,0x2
c0007e40:	00f40433          	add	s0,s0,a5
c0007e44:	00042703          	lw	a4,0(s0)
c0007e48:	00200793          	li	a5,2
c0007e4c:	06f71a63          	bne	a4,a5,c0007ec0 <file_fsync+0xc0>
c0007e50:	00c42783          	lw	a5,12(s0)
c0007e54:	06f51663          	bne	a0,a5,c0007ec0 <file_fsync+0xc0>
c0007e58:	01842783          	lw	a5,24(s0)
c0007e5c:	01442483          	lw	s1,20(s0)
c0007e60:	00178793          	addi	a5,a5,1
c0007e64:	00f42c23          	sw	a5,24(s0)
c0007e68:	06048c63          	beqz	s1,c0007ee0 <file_fsync+0xe0>
c0007e6c:	03c4a783          	lw	a5,60(s1)
c0007e70:	06078863          	beqz	a5,c0007ee0 <file_fsync+0xe0>
c0007e74:	0187a783          	lw	a5,24(a5)
c0007e78:	06078463          	beqz	a5,c0007ee0 <file_fsync+0xe0>
c0007e7c:	0000e597          	auipc	a1,0xe
c0007e80:	d9458593          	addi	a1,a1,-620 # c0015c10 <default_pmm_manager+0x920>
c0007e84:	00048513          	mv	a0,s1
c0007e88:	450070ef          	jal	ra,c000f2d8 <inode_check>
c0007e8c:	03c4a783          	lw	a5,60(s1)
c0007e90:	01442503          	lw	a0,20(s0)
c0007e94:	0187a783          	lw	a5,24(a5)
c0007e98:	000780e7          	jalr	a5
c0007e9c:	00050493          	mv	s1,a0
c0007ea0:	00040513          	mv	a0,s0
c0007ea4:	d60ff0ef          	jal	ra,c0007404 <fd_array_release>
c0007ea8:	00c12083          	lw	ra,12(sp)
c0007eac:	00048513          	mv	a0,s1
c0007eb0:	00812403          	lw	s0,8(sp)
c0007eb4:	00412483          	lw	s1,4(sp)
c0007eb8:	01010113          	addi	sp,sp,16
c0007ebc:	00008067          	ret
c0007ec0:	00c12083          	lw	ra,12(sp)
c0007ec4:	ffd00493          	li	s1,-3
c0007ec8:	00048513          	mv	a0,s1
c0007ecc:	00812403          	lw	s0,8(sp)
c0007ed0:	00412483          	lw	s1,4(sp)
c0007ed4:	01010113          	addi	sp,sp,16
c0007ed8:	00008067          	ret
c0007edc:	b7cff0ef          	jal	ra,c0007258 <get_fd_array.part.4>
c0007ee0:	0000e697          	auipc	a3,0xe
c0007ee4:	ce068693          	addi	a3,a3,-800 # c0015bc0 <default_pmm_manager+0x8d0>
c0007ee8:	0000c617          	auipc	a2,0xc
c0007eec:	f3460613          	addi	a2,a2,-204 # c0013e1c <commands+0x164>
c0007ef0:	13e00593          	li	a1,318
c0007ef4:	0000e517          	auipc	a0,0xe
c0007ef8:	f1050513          	addi	a0,a0,-240 # c0015e04 <default_pmm_manager+0xb14>
c0007efc:	bc8f80ef          	jal	ra,c00002c4 <__panic>

c0007f00 <file_getdirentry>:
c0007f00:	fd010113          	addi	sp,sp,-48
c0007f04:	02112623          	sw	ra,44(sp)
c0007f08:	02812423          	sw	s0,40(sp)
c0007f0c:	02912223          	sw	s1,36(sp)
c0007f10:	03212023          	sw	s2,32(sp)
c0007f14:	01312e23          	sw	s3,28(sp)
c0007f18:	09000793          	li	a5,144
c0007f1c:	0ea7ea63          	bltu	a5,a0,c0008010 <file_getdirentry+0x110>
c0007f20:	00093797          	auipc	a5,0x93
c0007f24:	88c7a783          	lw	a5,-1908(a5) # c009a7ac <current>
c0007f28:	0dc7a703          	lw	a4,220(a5)
c0007f2c:	00058493          	mv	s1,a1
c0007f30:	10070263          	beqz	a4,c0008034 <file_getdirentry+0x134>
c0007f34:	00872783          	lw	a5,8(a4)
c0007f38:	0ef05e63          	blez	a5,c0008034 <file_getdirentry+0x134>
c0007f3c:	00472403          	lw	s0,4(a4)
c0007f40:	00351793          	slli	a5,a0,0x3
c0007f44:	40a787b3          	sub	a5,a5,a0
c0007f48:	00279793          	slli	a5,a5,0x2
c0007f4c:	00f40433          	add	s0,s0,a5
c0007f50:	00042703          	lw	a4,0(s0)
c0007f54:	00200793          	li	a5,2
c0007f58:	0af71c63          	bne	a4,a5,c0008010 <file_getdirentry+0x110>
c0007f5c:	00c42783          	lw	a5,12(s0)
c0007f60:	0af51863          	bne	a0,a5,c0008010 <file_getdirentry+0x110>
c0007f64:	01842783          	lw	a5,24(s0)
c0007f68:	10000613          	li	a2,256
c0007f6c:	00458593          	addi	a1,a1,4
c0007f70:	00178793          	addi	a5,a5,1
c0007f74:	00f42c23          	sw	a5,24(s0)
c0007f78:	0004a683          	lw	a3,0(s1)
c0007f7c:	00010513          	mv	a0,sp
c0007f80:	1b0000ef          	jal	ra,c0008130 <iobuf_init>
c0007f84:	01442903          	lw	s2,20(s0)
c0007f88:	00050993          	mv	s3,a0
c0007f8c:	0a090663          	beqz	s2,c0008038 <file_getdirentry+0x138>
c0007f90:	03c92783          	lw	a5,60(s2)
c0007f94:	0a078263          	beqz	a5,c0008038 <file_getdirentry+0x138>
c0007f98:	0207a783          	lw	a5,32(a5)
c0007f9c:	08078e63          	beqz	a5,c0008038 <file_getdirentry+0x138>
c0007fa0:	00090513          	mv	a0,s2
c0007fa4:	0000e597          	auipc	a1,0xe
c0007fa8:	cc858593          	addi	a1,a1,-824 # c0015c6c <default_pmm_manager+0x97c>
c0007fac:	32c070ef          	jal	ra,c000f2d8 <inode_check>
c0007fb0:	03c92783          	lw	a5,60(s2)
c0007fb4:	01442503          	lw	a0,20(s0)
c0007fb8:	00098593          	mv	a1,s3
c0007fbc:	0207a783          	lw	a5,32(a5)
c0007fc0:	000780e7          	jalr	a5
c0007fc4:	00050913          	mv	s2,a0
c0007fc8:	02050663          	beqz	a0,c0007ff4 <file_getdirentry+0xf4>
c0007fcc:	00040513          	mv	a0,s0
c0007fd0:	c34ff0ef          	jal	ra,c0007404 <fd_array_release>
c0007fd4:	02c12083          	lw	ra,44(sp)
c0007fd8:	00090513          	mv	a0,s2
c0007fdc:	02812403          	lw	s0,40(sp)
c0007fe0:	02412483          	lw	s1,36(sp)
c0007fe4:	02012903          	lw	s2,32(sp)
c0007fe8:	01c12983          	lw	s3,28(sp)
c0007fec:	03010113          	addi	sp,sp,48
c0007ff0:	00008067          	ret
c0007ff4:	0004a783          	lw	a5,0(s1)
c0007ff8:	0089a683          	lw	a3,8(s3) # 1008 <_binary_bin_swap_img_size-0x6cf8>
c0007ffc:	00c9a703          	lw	a4,12(s3)
c0008000:	00d787b3          	add	a5,a5,a3
c0008004:	40e787b3          	sub	a5,a5,a4
c0008008:	00f4a023          	sw	a5,0(s1)
c000800c:	fc1ff06f          	j	c0007fcc <file_getdirentry+0xcc>
c0008010:	02c12083          	lw	ra,44(sp)
c0008014:	ffd00913          	li	s2,-3
c0008018:	00090513          	mv	a0,s2
c000801c:	02812403          	lw	s0,40(sp)
c0008020:	02412483          	lw	s1,36(sp)
c0008024:	02012903          	lw	s2,32(sp)
c0008028:	01c12983          	lw	s3,28(sp)
c000802c:	03010113          	addi	sp,sp,48
c0008030:	00008067          	ret
c0008034:	a24ff0ef          	jal	ra,c0007258 <get_fd_array.part.4>
c0008038:	0000e697          	auipc	a3,0xe
c000803c:	be068693          	addi	a3,a3,-1056 # c0015c18 <default_pmm_manager+0x928>
c0008040:	0000c617          	auipc	a2,0xc
c0008044:	ddc60613          	addi	a2,a2,-548 # c0013e1c <commands+0x164>
c0008048:	14e00593          	li	a1,334
c000804c:	0000e517          	auipc	a0,0xe
c0008050:	db850513          	addi	a0,a0,-584 # c0015e04 <default_pmm_manager+0xb14>
c0008054:	a70f80ef          	jal	ra,c00002c4 <__panic>

c0008058 <file_dup>:
c0008058:	09000793          	li	a5,144
c000805c:	0aa7e063          	bltu	a5,a0,c00080fc <file_dup+0xa4>
c0008060:	00092797          	auipc	a5,0x92
c0008064:	74c7a783          	lw	a5,1868(a5) # c009a7ac <current>
c0008068:	0dc7a683          	lw	a3,220(a5)
c000806c:	fe010113          	addi	sp,sp,-32
c0008070:	00112e23          	sw	ra,28(sp)
c0008074:	00812c23          	sw	s0,24(sp)
c0008078:	00058613          	mv	a2,a1
c000807c:	00050713          	mv	a4,a0
c0008080:	08068263          	beqz	a3,c0008104 <file_dup+0xac>
c0008084:	0086a783          	lw	a5,8(a3)
c0008088:	06f05e63          	blez	a5,c0008104 <file_dup+0xac>
c000808c:	00351793          	slli	a5,a0,0x3
c0008090:	0046a403          	lw	s0,4(a3)
c0008094:	40a787b3          	sub	a5,a5,a0
c0008098:	00279793          	slli	a5,a5,0x2
c000809c:	00f40433          	add	s0,s0,a5
c00080a0:	00042683          	lw	a3,0(s0)
c00080a4:	00200793          	li	a5,2
c00080a8:	ffd00513          	li	a0,-3
c00080ac:	00f69e63          	bne	a3,a5,c00080c8 <file_dup+0x70>
c00080b0:	00c42783          	lw	a5,12(s0)
c00080b4:	00f71a63          	bne	a4,a5,c00080c8 <file_dup+0x70>
c00080b8:	00c10593          	addi	a1,sp,12
c00080bc:	00060513          	mv	a0,a2
c00080c0:	9c0ff0ef          	jal	ra,c0007280 <fd_array_alloc>
c00080c4:	00050a63          	beqz	a0,c00080d8 <file_dup+0x80>
c00080c8:	01c12083          	lw	ra,28(sp)
c00080cc:	01812403          	lw	s0,24(sp)
c00080d0:	02010113          	addi	sp,sp,32
c00080d4:	00008067          	ret
c00080d8:	00c12503          	lw	a0,12(sp)
c00080dc:	00040593          	mv	a1,s0
c00080e0:	c7cff0ef          	jal	ra,c000755c <fd_array_dup>
c00080e4:	00c12783          	lw	a5,12(sp)
c00080e8:	01c12083          	lw	ra,28(sp)
c00080ec:	01812403          	lw	s0,24(sp)
c00080f0:	00c7a503          	lw	a0,12(a5)
c00080f4:	02010113          	addi	sp,sp,32
c00080f8:	00008067          	ret
c00080fc:	ffd00513          	li	a0,-3
c0008100:	00008067          	ret
c0008104:	954ff0ef          	jal	ra,c0007258 <get_fd_array.part.4>

c0008108 <iobuf_skip.part.0>:
c0008108:	ff010113          	addi	sp,sp,-16
c000810c:	0000e697          	auipc	a3,0xe
c0008110:	d0868693          	addi	a3,a3,-760 # c0015e14 <default_pmm_manager+0xb24>
c0008114:	0000c617          	auipc	a2,0xc
c0008118:	d0860613          	addi	a2,a2,-760 # c0013e1c <commands+0x164>
c000811c:	04a00593          	li	a1,74
c0008120:	0000e517          	auipc	a0,0xe
c0008124:	d0850513          	addi	a0,a0,-760 # c0015e28 <default_pmm_manager+0xb38>
c0008128:	00112623          	sw	ra,12(sp)
c000812c:	998f80ef          	jal	ra,c00002c4 <__panic>

c0008130 <iobuf_init>:
c0008130:	00b52023          	sw	a1,0(a0)
c0008134:	00d52223          	sw	a3,4(a0)
c0008138:	00c52623          	sw	a2,12(a0)
c000813c:	00c52423          	sw	a2,8(a0)
c0008140:	00008067          	ret

c0008144 <iobuf_move>:
c0008144:	fe010113          	addi	sp,sp,-32
c0008148:	00812c23          	sw	s0,24(sp)
c000814c:	00c52403          	lw	s0,12(a0)
c0008150:	00912a23          	sw	s1,20(sp)
c0008154:	01212823          	sw	s2,16(sp)
c0008158:	01312623          	sw	s3,12(sp)
c000815c:	00112e23          	sw	ra,28(sp)
c0008160:	00050493          	mv	s1,a0
c0008164:	00060913          	mv	s2,a2
c0008168:	00058513          	mv	a0,a1
c000816c:	00070993          	mv	s3,a4
c0008170:	00867463          	bleu	s0,a2,c0008178 <iobuf_move+0x34>
c0008174:	00060413          	mv	s0,a2
c0008178:	04040663          	beqz	s0,c00081c4 <iobuf_move+0x80>
c000817c:	0004a583          	lw	a1,0(s1)
c0008180:	00068863          	beqz	a3,c0008190 <iobuf_move+0x4c>
c0008184:	00058793          	mv	a5,a1
c0008188:	00050593          	mv	a1,a0
c000818c:	00078513          	mv	a0,a5
c0008190:	00040613          	mv	a2,s0
c0008194:	2400b0ef          	jal	ra,c00133d4 <memmove>
c0008198:	00c4a783          	lw	a5,12(s1)
c000819c:	0487ea63          	bltu	a5,s0,c00081f0 <iobuf_move+0xac>
c00081a0:	0004a683          	lw	a3,0(s1)
c00081a4:	0044a703          	lw	a4,4(s1)
c00081a8:	408787b3          	sub	a5,a5,s0
c00081ac:	008686b3          	add	a3,a3,s0
c00081b0:	00870733          	add	a4,a4,s0
c00081b4:	00d4a023          	sw	a3,0(s1)
c00081b8:	00e4a223          	sw	a4,4(s1)
c00081bc:	00f4a623          	sw	a5,12(s1)
c00081c0:	40890933          	sub	s2,s2,s0
c00081c4:	00098463          	beqz	s3,c00081cc <iobuf_move+0x88>
c00081c8:	0089a023          	sw	s0,0(s3)
c00081cc:	00000513          	li	a0,0
c00081d0:	02091263          	bnez	s2,c00081f4 <iobuf_move+0xb0>
c00081d4:	01c12083          	lw	ra,28(sp)
c00081d8:	01812403          	lw	s0,24(sp)
c00081dc:	01412483          	lw	s1,20(sp)
c00081e0:	01012903          	lw	s2,16(sp)
c00081e4:	00c12983          	lw	s3,12(sp)
c00081e8:	02010113          	addi	sp,sp,32
c00081ec:	00008067          	ret
c00081f0:	f19ff0ef          	jal	ra,c0008108 <iobuf_skip.part.0>
c00081f4:	ffc00513          	li	a0,-4
c00081f8:	fddff06f          	j	c00081d4 <iobuf_move+0x90>

c00081fc <iobuf_skip>:
c00081fc:	00c52783          	lw	a5,12(a0)
c0008200:	02b7e463          	bltu	a5,a1,c0008228 <iobuf_skip+0x2c>
c0008204:	00052683          	lw	a3,0(a0)
c0008208:	00452703          	lw	a4,4(a0)
c000820c:	40b787b3          	sub	a5,a5,a1
c0008210:	00b686b3          	add	a3,a3,a1
c0008214:	00b705b3          	add	a1,a4,a1
c0008218:	00d52023          	sw	a3,0(a0)
c000821c:	00b52223          	sw	a1,4(a0)
c0008220:	00f52623          	sw	a5,12(a0)
c0008224:	00008067          	ret
c0008228:	ff010113          	addi	sp,sp,-16
c000822c:	00112623          	sw	ra,12(sp)
c0008230:	ed9ff0ef          	jal	ra,c0008108 <iobuf_skip.part.0>

c0008234 <fs_init>:
c0008234:	ff010113          	addi	sp,sp,-16
c0008238:	00112623          	sw	ra,12(sp)
c000823c:	5b8070ef          	jal	ra,c000f7f4 <vfs_init>
c0008240:	3a0080ef          	jal	ra,c00105e0 <dev_init>
c0008244:	00c12083          	lw	ra,12(sp)
c0008248:	01010113          	addi	sp,sp,16
c000824c:	3f40806f          	j	c0010640 <sfs_init>

c0008250 <fs_cleanup>:
c0008250:	7340606f          	j	c000e984 <vfs_cleanup>

c0008254 <lock_files>:
c0008254:	00c50513          	addi	a0,a0,12
c0008258:	fa8fe06f          	j	c0006a00 <down>

c000825c <unlock_files>:
c000825c:	00c50513          	addi	a0,a0,12
c0008260:	f9cfe06f          	j	c00069fc <up>

c0008264 <files_create>:
c0008264:	ff010113          	addi	sp,sp,-16
c0008268:	00001537          	lui	a0,0x1
c000826c:	00812423          	sw	s0,8(sp)
c0008270:	00112623          	sw	ra,12(sp)
c0008274:	b79fa0ef          	jal	ra,c0002dec <kmalloc>
c0008278:	00050413          	mv	s0,a0
c000827c:	02050463          	beqz	a0,c00082a4 <files_create+0x40>
c0008280:	01850793          	addi	a5,a0,24 # 1018 <_binary_bin_swap_img_size-0x6ce8>
c0008284:	00042023          	sw	zero,0(s0)
c0008288:	00c50513          	addi	a0,a0,12
c000828c:	00f42223          	sw	a5,4(s0)
c0008290:	00042423          	sw	zero,8(s0)
c0008294:	00100593          	li	a1,1
c0008298:	f58fe0ef          	jal	ra,c00069f0 <sem_init>
c000829c:	00442503          	lw	a0,4(s0)
c00082a0:	a10ff0ef          	jal	ra,c00074b0 <fd_array_init>
c00082a4:	00c12083          	lw	ra,12(sp)
c00082a8:	00040513          	mv	a0,s0
c00082ac:	00812403          	lw	s0,8(sp)
c00082b0:	01010113          	addi	sp,sp,16
c00082b4:	00008067          	ret

c00082b8 <files_destroy>:
c00082b8:	fe010113          	addi	sp,sp,-32
c00082bc:	00112e23          	sw	ra,28(sp)
c00082c0:	00812c23          	sw	s0,24(sp)
c00082c4:	00912a23          	sw	s1,20(sp)
c00082c8:	01212823          	sw	s2,16(sp)
c00082cc:	01312623          	sw	s3,12(sp)
c00082d0:	08050a63          	beqz	a0,c0008364 <files_destroy+0xac>
c00082d4:	00852783          	lw	a5,8(a0)
c00082d8:	00050993          	mv	s3,a0
c00082dc:	08079463          	bnez	a5,c0008364 <files_destroy+0xac>
c00082e0:	00052503          	lw	a0,0(a0)
c00082e4:	00050463          	beqz	a0,c00082ec <files_destroy+0x34>
c00082e8:	0bc070ef          	jal	ra,c000f3a4 <inode_ref_dec>
c00082ec:	0049a403          	lw	s0,4(s3)
c00082f0:	000014b7          	lui	s1,0x1
c00082f4:	fdc48493          	addi	s1,s1,-36 # fdc <_binary_bin_swap_img_size-0x6d24>
c00082f8:	009404b3          	add	s1,s0,s1
c00082fc:	00200913          	li	s2,2
c0008300:	00042783          	lw	a5,0(s0)
c0008304:	03278863          	beq	a5,s2,c0008334 <files_destroy+0x7c>
c0008308:	02079e63          	bnez	a5,c0008344 <files_destroy+0x8c>
c000830c:	01c40413          	addi	s0,s0,28
c0008310:	fe9418e3          	bne	s0,s1,c0008300 <files_destroy+0x48>
c0008314:	00098513          	mv	a0,s3
c0008318:	01c12083          	lw	ra,28(sp)
c000831c:	01812403          	lw	s0,24(sp)
c0008320:	01412483          	lw	s1,20(sp)
c0008324:	01012903          	lw	s2,16(sp)
c0008328:	00c12983          	lw	s3,12(sp)
c000832c:	02010113          	addi	sp,sp,32
c0008330:	bddfa06f          	j	c0002f0c <kfree>
c0008334:	00040513          	mv	a0,s0
c0008338:	99cff0ef          	jal	ra,c00074d4 <fd_array_close>
c000833c:	00042783          	lw	a5,0(s0)
c0008340:	fc9ff06f          	j	c0008308 <files_destroy+0x50>
c0008344:	0000e697          	auipc	a3,0xe
c0008348:	b6068693          	addi	a3,a3,-1184 # c0015ea4 <default_pmm_manager+0xbb4>
c000834c:	0000c617          	auipc	a2,0xc
c0008350:	ad060613          	addi	a2,a2,-1328 # c0013e1c <commands+0x164>
c0008354:	03d00593          	li	a1,61
c0008358:	0000e517          	auipc	a0,0xe
c000835c:	b3c50513          	addi	a0,a0,-1220 # c0015e94 <default_pmm_manager+0xba4>
c0008360:	f65f70ef          	jal	ra,c00002c4 <__panic>
c0008364:	0000e697          	auipc	a3,0xe
c0008368:	b0468693          	addi	a3,a3,-1276 # c0015e68 <default_pmm_manager+0xb78>
c000836c:	0000c617          	auipc	a2,0xc
c0008370:	ab060613          	addi	a2,a2,-1360 # c0013e1c <commands+0x164>
c0008374:	03300593          	li	a1,51
c0008378:	0000e517          	auipc	a0,0xe
c000837c:	b1c50513          	addi	a0,a0,-1252 # c0015e94 <default_pmm_manager+0xba4>
c0008380:	f45f70ef          	jal	ra,c00002c4 <__panic>

c0008384 <files_closeall>:
c0008384:	ff010113          	addi	sp,sp,-16
c0008388:	00112623          	sw	ra,12(sp)
c000838c:	00812423          	sw	s0,8(sp)
c0008390:	00912223          	sw	s1,4(sp)
c0008394:	01212023          	sw	s2,0(sp)
c0008398:	06050063          	beqz	a0,c00083f8 <files_closeall+0x74>
c000839c:	00852783          	lw	a5,8(a0)
c00083a0:	04f05c63          	blez	a5,c00083f8 <files_closeall+0x74>
c00083a4:	00452483          	lw	s1,4(a0)
c00083a8:	000017b7          	lui	a5,0x1
c00083ac:	fdc78793          	addi	a5,a5,-36 # fdc <_binary_bin_swap_img_size-0x6d24>
c00083b0:	03848413          	addi	s0,s1,56
c00083b4:	00200913          	li	s2,2
c00083b8:	00f484b3          	add	s1,s1,a5
c00083bc:	00c0006f          	j	c00083c8 <files_closeall+0x44>
c00083c0:	01c40413          	addi	s0,s0,28
c00083c4:	00940e63          	beq	s0,s1,c00083e0 <files_closeall+0x5c>
c00083c8:	00042783          	lw	a5,0(s0)
c00083cc:	ff279ae3          	bne	a5,s2,c00083c0 <files_closeall+0x3c>
c00083d0:	00040513          	mv	a0,s0
c00083d4:	01c40413          	addi	s0,s0,28
c00083d8:	8fcff0ef          	jal	ra,c00074d4 <fd_array_close>
c00083dc:	fe9416e3          	bne	s0,s1,c00083c8 <files_closeall+0x44>
c00083e0:	00c12083          	lw	ra,12(sp)
c00083e4:	00812403          	lw	s0,8(sp)
c00083e8:	00412483          	lw	s1,4(sp)
c00083ec:	00012903          	lw	s2,0(sp)
c00083f0:	01010113          	addi	sp,sp,16
c00083f4:	00008067          	ret
c00083f8:	0000e697          	auipc	a3,0xe
c00083fc:	9e068693          	addi	a3,a3,-1568 # c0015dd8 <default_pmm_manager+0xae8>
c0008400:	0000c617          	auipc	a2,0xc
c0008404:	a1c60613          	addi	a2,a2,-1508 # c0013e1c <commands+0x164>
c0008408:	04500593          	li	a1,69
c000840c:	0000e517          	auipc	a0,0xe
c0008410:	a8850513          	addi	a0,a0,-1400 # c0015e94 <default_pmm_manager+0xba4>
c0008414:	eb1f70ef          	jal	ra,c00002c4 <__panic>

c0008418 <dup_files>:
c0008418:	fe010113          	addi	sp,sp,-32
c000841c:	00112e23          	sw	ra,28(sp)
c0008420:	00812c23          	sw	s0,24(sp)
c0008424:	00912a23          	sw	s1,20(sp)
c0008428:	01212823          	sw	s2,16(sp)
c000842c:	01312623          	sw	s3,12(sp)
c0008430:	01412423          	sw	s4,8(sp)
c0008434:	0a050263          	beqz	a0,c00084d8 <dup_files+0xc0>
c0008438:	00058413          	mv	s0,a1
c000843c:	08058e63          	beqz	a1,c00084d8 <dup_files+0xc0>
c0008440:	00852783          	lw	a5,8(a0)
c0008444:	00050493          	mv	s1,a0
c0008448:	0a079863          	bnez	a5,c00084f8 <dup_files+0xe0>
c000844c:	0085a783          	lw	a5,8(a1)
c0008450:	0af05463          	blez	a5,c00084f8 <dup_files+0xe0>
c0008454:	0005a503          	lw	a0,0(a1)
c0008458:	00a4a023          	sw	a0,0(s1)
c000845c:	00050463          	beqz	a0,c0008464 <dup_files+0x4c>
c0008460:	651060ef          	jal	ra,c000f2b0 <inode_ref_inc>
c0008464:	00442403          	lw	s0,4(s0)
c0008468:	00001937          	lui	s2,0x1
c000846c:	fdc90913          	addi	s2,s2,-36 # fdc <_binary_bin_swap_img_size-0x6d24>
c0008470:	0044a483          	lw	s1,4(s1)
c0008474:	01240933          	add	s2,s0,s2
c0008478:	00200993          	li	s3,2
c000847c:	00100a13          	li	s4,1
c0008480:	0100006f          	j	c0008490 <dup_files+0x78>
c0008484:	01c40413          	addi	s0,s0,28
c0008488:	01c48493          	addi	s1,s1,28
c000848c:	03240463          	beq	s0,s2,c00084b4 <dup_files+0x9c>
c0008490:	00042783          	lw	a5,0(s0)
c0008494:	ff3798e3          	bne	a5,s3,c0008484 <dup_files+0x6c>
c0008498:	0144a023          	sw	s4,0(s1)
c000849c:	00040593          	mv	a1,s0
c00084a0:	00048513          	mv	a0,s1
c00084a4:	01c40413          	addi	s0,s0,28
c00084a8:	8b4ff0ef          	jal	ra,c000755c <fd_array_dup>
c00084ac:	01c48493          	addi	s1,s1,28
c00084b0:	ff2410e3          	bne	s0,s2,c0008490 <dup_files+0x78>
c00084b4:	01c12083          	lw	ra,28(sp)
c00084b8:	00000513          	li	a0,0
c00084bc:	01812403          	lw	s0,24(sp)
c00084c0:	01412483          	lw	s1,20(sp)
c00084c4:	01012903          	lw	s2,16(sp)
c00084c8:	00c12983          	lw	s3,12(sp)
c00084cc:	00812a03          	lw	s4,8(sp)
c00084d0:	02010113          	addi	sp,sp,32
c00084d4:	00008067          	ret
c00084d8:	0000c697          	auipc	a3,0xc
c00084dc:	1b868693          	addi	a3,a3,440 # c0014690 <commands+0x9d8>
c00084e0:	0000c617          	auipc	a2,0xc
c00084e4:	93c60613          	addi	a2,a2,-1732 # c0013e1c <commands+0x164>
c00084e8:	05300593          	li	a1,83
c00084ec:	0000e517          	auipc	a0,0xe
c00084f0:	9a850513          	addi	a0,a0,-1624 # c0015e94 <default_pmm_manager+0xba4>
c00084f4:	dd1f70ef          	jal	ra,c00002c4 <__panic>
c00084f8:	0000e697          	auipc	a3,0xe
c00084fc:	94068693          	addi	a3,a3,-1728 # c0015e38 <default_pmm_manager+0xb48>
c0008500:	0000c617          	auipc	a2,0xc
c0008504:	91c60613          	addi	a2,a2,-1764 # c0013e1c <commands+0x164>
c0008508:	05400593          	li	a1,84
c000850c:	0000e517          	auipc	a0,0xe
c0008510:	98850513          	addi	a0,a0,-1656 # c0015e94 <default_pmm_manager+0xba4>
c0008514:	db1f70ef          	jal	ra,c00002c4 <__panic>

c0008518 <switch_to>:
c0008518:	00152023          	sw	ra,0(a0)
c000851c:	00252223          	sw	sp,4(a0)
c0008520:	00852423          	sw	s0,8(a0)
c0008524:	00952623          	sw	s1,12(a0)
c0008528:	01252823          	sw	s2,16(a0)
c000852c:	01352a23          	sw	s3,20(a0)
c0008530:	01452c23          	sw	s4,24(a0)
c0008534:	01552e23          	sw	s5,28(a0)
c0008538:	03652023          	sw	s6,32(a0)
c000853c:	03752223          	sw	s7,36(a0)
c0008540:	03852423          	sw	s8,40(a0)
c0008544:	03952623          	sw	s9,44(a0)
c0008548:	03a52823          	sw	s10,48(a0)
c000854c:	03b52a23          	sw	s11,52(a0)
c0008550:	0005a083          	lw	ra,0(a1)
c0008554:	0045a103          	lw	sp,4(a1)
c0008558:	0085a403          	lw	s0,8(a1)
c000855c:	00c5a483          	lw	s1,12(a1)
c0008560:	0105a903          	lw	s2,16(a1)
c0008564:	0145a983          	lw	s3,20(a1)
c0008568:	0185aa03          	lw	s4,24(a1)
c000856c:	01c5aa83          	lw	s5,28(a1)
c0008570:	0205ab03          	lw	s6,32(a1)
c0008574:	0245ab83          	lw	s7,36(a1)
c0008578:	0285ac03          	lw	s8,40(a1)
c000857c:	02c5ac83          	lw	s9,44(a1)
c0008580:	0305ad03          	lw	s10,48(a1)
c0008584:	0345ad83          	lw	s11,52(a1)
c0008588:	00008067          	ret

c000858c <kernel_thread_entry>:
c000858c:	00048513          	mv	a0,s1
c0008590:	000400e7          	jalr	s0
c0008594:	2b9000ef          	jal	ra,c000904c <do_exit>

c0008598 <alloc_proc>:
c0008598:	ff010113          	addi	sp,sp,-16
c000859c:	0e000513          	li	a0,224
c00085a0:	00812423          	sw	s0,8(sp)
c00085a4:	00112623          	sw	ra,12(sp)
c00085a8:	845fa0ef          	jal	ra,c0002dec <kmalloc>
c00085ac:	00050413          	mv	s0,a0
c00085b0:	08050a63          	beqz	a0,c0008644 <alloc_proc+0xac>
c00085b4:	fff00793          	li	a5,-1
c00085b8:	00f52223          	sw	a5,4(a0)
c00085bc:	03800613          	li	a2,56
c00085c0:	00000593          	li	a1,0
c00085c4:	00052023          	sw	zero,0(a0)
c00085c8:	00052423          	sw	zero,8(a0)
c00085cc:	00052623          	sw	zero,12(a0)
c00085d0:	00052823          	sw	zero,16(a0)
c00085d4:	00052a23          	sw	zero,20(a0)
c00085d8:	00052c23          	sw	zero,24(a0)
c00085dc:	01c50513          	addi	a0,a0,28
c00085e0:	5d90a0ef          	jal	ra,c00133b8 <memset>
c00085e4:	00092797          	auipc	a5,0x92
c00085e8:	2c87a783          	lw	a5,712(a5) # c009a8ac <boot_cr3>
c00085ec:	04f42c23          	sw	a5,88(s0)
c00085f0:	04042a23          	sw	zero,84(s0)
c00085f4:	04042e23          	sw	zero,92(s0)
c00085f8:	03200613          	li	a2,50
c00085fc:	00000593          	li	a1,0
c0008600:	06040513          	addi	a0,s0,96
c0008604:	5b50a0ef          	jal	ra,c00133b8 <memset>
c0008608:	0bc40793          	addi	a5,s0,188
c000860c:	0a042423          	sw	zero,168(s0)
c0008610:	0a042823          	sw	zero,176(s0)
c0008614:	0a042a23          	sw	zero,180(s0)
c0008618:	0a042623          	sw	zero,172(s0)
c000861c:	0a042c23          	sw	zero,184(s0)
c0008620:	0cf42023          	sw	a5,192(s0)
c0008624:	0af42e23          	sw	a5,188(s0)
c0008628:	0c042223          	sw	zero,196(s0)
c000862c:	0c042423          	sw	zero,200(s0)
c0008630:	0c042823          	sw	zero,208(s0)
c0008634:	0c042623          	sw	zero,204(s0)
c0008638:	0c042a23          	sw	zero,212(s0)
c000863c:	0c042c23          	sw	zero,216(s0)
c0008640:	0c042e23          	sw	zero,220(s0)
c0008644:	00c12083          	lw	ra,12(sp)
c0008648:	00040513          	mv	a0,s0
c000864c:	00812403          	lw	s0,8(sp)
c0008650:	01010113          	addi	sp,sp,16
c0008654:	00008067          	ret

c0008658 <put_files>:
c0008658:	0dc52503          	lw	a0,220(a0)
c000865c:	00050a63          	beqz	a0,c0008670 <put_files+0x18>
c0008660:	00852783          	lw	a5,8(a0)
c0008664:	fff78793          	addi	a5,a5,-1
c0008668:	00f52423          	sw	a5,8(a0)
c000866c:	00078463          	beqz	a5,c0008674 <put_files+0x1c>
c0008670:	00008067          	ret
c0008674:	c45ff06f          	j	c00082b8 <files_destroy>

c0008678 <forkret>:
c0008678:	00092797          	auipc	a5,0x92
c000867c:	1347a783          	lw	a5,308(a5) # c009a7ac <current>
c0008680:	0547a503          	lw	a0,84(a5)
c0008684:	898f906f          	j	c000171c <forkrets>

c0008688 <user_main>:
c0008688:	00092797          	auipc	a5,0x92
c000868c:	1247a783          	lw	a5,292(a5) # c009a7ac <current>
c0008690:	fd010113          	addi	sp,sp,-48
c0008694:	0047a583          	lw	a1,4(a5)
c0008698:	02812423          	sw	s0,40(sp)
c000869c:	0000e417          	auipc	s0,0xe
c00086a0:	c2040413          	addi	s0,s0,-992 # c00162bc <default_pmm_manager+0xfcc>
c00086a4:	00040613          	mv	a2,s0
c00086a8:	0000e517          	auipc	a0,0xe
c00086ac:	c1850513          	addi	a0,a0,-1000 # c00162c0 <default_pmm_manager+0xfd0>
c00086b0:	02112623          	sw	ra,44(sp)
c00086b4:	00812c23          	sw	s0,24(sp)
c00086b8:	00012e23          	sw	zero,28(sp)
c00086bc:	a8df70ef          	jal	ra,c0000148 <cprintf>
c00086c0:	01812683          	lw	a3,24(sp)
c00086c4:	01810793          	addi	a5,sp,24
c00086c8:	00812423          	sw	s0,8(sp)
c00086cc:	00f12623          	sw	a5,12(sp)
c00086d0:	00012823          	sw	zero,16(sp)
c00086d4:	00100713          	li	a4,1
c00086d8:	00068e63          	beqz	a3,c00086f4 <user_main+0x6c>
c00086dc:	0047a683          	lw	a3,4(a5)
c00086e0:	00070613          	mv	a2,a4
c00086e4:	00478793          	addi	a5,a5,4
c00086e8:	00170713          	addi	a4,a4,1
c00086ec:	fe0698e3          	bnez	a3,c00086dc <user_main+0x54>
c00086f0:	00c12823          	sw	a2,16(sp)
c00086f4:	00400513          	li	a0,4
c00086f8:	00812583          	lw	a1,8(sp)
c00086fc:	01012603          	lw	a2,16(sp)
c0008700:	00c12683          	lw	a3,12(sp)
c0008704:	00a00893          	li	a7,10
c0008708:	00000073          	ecall
c000870c:	00a12a23          	sw	a0,20(sp)
c0008710:	0000e617          	auipc	a2,0xe
c0008714:	bd860613          	addi	a2,a2,-1064 # c00162e8 <default_pmm_manager+0xff8>
c0008718:	3f900593          	li	a1,1017
c000871c:	0000e517          	auipc	a0,0xe
c0008720:	be850513          	addi	a0,a0,-1048 # c0016304 <default_pmm_manager+0x1014>
c0008724:	ba1f70ef          	jal	ra,c00002c4 <__panic>

c0008728 <load_icode_read>:
c0008728:	fe010113          	addi	sp,sp,-32
c000872c:	00912a23          	sw	s1,20(sp)
c0008730:	01312623          	sw	s3,12(sp)
c0008734:	00060493          	mv	s1,a2
c0008738:	00058993          	mv	s3,a1
c000873c:	00000613          	li	a2,0
c0008740:	00068593          	mv	a1,a3
c0008744:	00812c23          	sw	s0,24(sp)
c0008748:	01212823          	sw	s2,16(sp)
c000874c:	00112e23          	sw	ra,28(sp)
c0008750:	00050913          	mv	s2,a0
c0008754:	fb8fe0ef          	jal	ra,c0006f0c <sysfile_seek>
c0008758:	00050413          	mv	s0,a0
c000875c:	02050263          	beqz	a0,c0008780 <load_icode_read+0x58>
c0008760:	01c12083          	lw	ra,28(sp)
c0008764:	00040513          	mv	a0,s0
c0008768:	01412483          	lw	s1,20(sp)
c000876c:	01812403          	lw	s0,24(sp)
c0008770:	01012903          	lw	s2,16(sp)
c0008774:	00c12983          	lw	s3,12(sp)
c0008778:	02010113          	addi	sp,sp,32
c000877c:	00008067          	ret
c0008780:	00048613          	mv	a2,s1
c0008784:	00098593          	mv	a1,s3
c0008788:	00090513          	mv	a0,s2
c000878c:	bfcfe0ef          	jal	ra,c0006b88 <sysfile_read>
c0008790:	fca488e3          	beq	s1,a0,c0008760 <load_icode_read+0x38>
c0008794:	00050413          	mv	s0,a0
c0008798:	fc0544e3          	bltz	a0,c0008760 <load_icode_read+0x38>
c000879c:	01c12083          	lw	ra,28(sp)
c00087a0:	fff00413          	li	s0,-1
c00087a4:	00040513          	mv	a0,s0
c00087a8:	01412483          	lw	s1,20(sp)
c00087ac:	01812403          	lw	s0,24(sp)
c00087b0:	01012903          	lw	s2,16(sp)
c00087b4:	00c12983          	lw	s3,12(sp)
c00087b8:	02010113          	addi	sp,sp,32
c00087bc:	00008067          	ret

c00087c0 <setup_pgdir.isra.4>:
c00087c0:	fe010113          	addi	sp,sp,-32
c00087c4:	01212823          	sw	s2,16(sp)
c00087c8:	00050913          	mv	s2,a0
c00087cc:	00100513          	li	a0,1
c00087d0:	00112e23          	sw	ra,28(sp)
c00087d4:	00812c23          	sw	s0,24(sp)
c00087d8:	00912a23          	sw	s1,20(sp)
c00087dc:	01312623          	sw	s3,12(sp)
c00087e0:	92cfc0ef          	jal	ra,c000490c <alloc_pages>
c00087e4:	0a050a63          	beqz	a0,c0008898 <setup_pgdir.isra.4+0xd8>
c00087e8:	00092697          	auipc	a3,0x92
c00087ec:	0c86a683          	lw	a3,200(a3) # c009a8b0 <pages>
c00087f0:	40d506b3          	sub	a3,a0,a3
c00087f4:	0008f997          	auipc	s3,0x8f
c00087f8:	8509a983          	lw	s3,-1968(s3) # c0097044 <nbase>
c00087fc:	4056d693          	srai	a3,a3,0x5
c0008800:	001007b7          	lui	a5,0x100
c0008804:	013686b3          	add	a3,a3,s3
c0008808:	fff78793          	addi	a5,a5,-1 # fffff <_binary_bin_sfs_img_size+0x8acff>
c000880c:	00f6f7b3          	and	a5,a3,a5
c0008810:	00092717          	auipc	a4,0x92
c0008814:	f9472703          	lw	a4,-108(a4) # c009a7a4 <npage>
c0008818:	00050413          	mv	s0,a0
c000881c:	00c69693          	slli	a3,a3,0xc
c0008820:	08e7f063          	bleu	a4,a5,c00088a0 <setup_pgdir.isra.4+0xe0>
c0008824:	00092497          	auipc	s1,0x92
c0008828:	0844a483          	lw	s1,132(s1) # c009a8a8 <va_pa_offset>
c000882c:	009684b3          	add	s1,a3,s1
c0008830:	00001637          	lui	a2,0x1
c0008834:	00092597          	auipc	a1,0x92
c0008838:	f6c5a583          	lw	a1,-148(a1) # c009a7a0 <boot_pgdir>
c000883c:	00048513          	mv	a0,s1
c0008840:	3e90a0ef          	jal	ra,c0013428 <memcpy>
c0008844:	00092797          	auipc	a5,0x92
c0008848:	06c7a783          	lw	a5,108(a5) # c009a8b0 <pages>
c000884c:	40f40433          	sub	s0,s0,a5
c0008850:	40545413          	srai	s0,s0,0x5
c0008854:	01340433          	add	s0,s0,s3
c0008858:	00a41413          	slli	s0,s0,0xa
c000885c:	000017b7          	lui	a5,0x1
c0008860:	00f487b3          	add	a5,s1,a5
c0008864:	00146713          	ori	a4,s0,1
c0008868:	00746413          	ori	s0,s0,7
c000886c:	fae7a623          	sw	a4,-84(a5) # fac <_binary_bin_swap_img_size-0x6d54>
c0008870:	fa87a823          	sw	s0,-80(a5)
c0008874:	00992023          	sw	s1,0(s2)
c0008878:	00000513          	li	a0,0
c000887c:	01c12083          	lw	ra,28(sp)
c0008880:	01812403          	lw	s0,24(sp)
c0008884:	01412483          	lw	s1,20(sp)
c0008888:	01012903          	lw	s2,16(sp)
c000888c:	00c12983          	lw	s3,12(sp)
c0008890:	02010113          	addi	sp,sp,32
c0008894:	00008067          	ret
c0008898:	ffc00513          	li	a0,-4
c000889c:	fe1ff06f          	j	c000887c <setup_pgdir.isra.4+0xbc>
c00088a0:	0000c617          	auipc	a2,0xc
c00088a4:	2e060613          	addi	a2,a2,736 # c0014b80 <commands+0xec8>
c00088a8:	06e00593          	li	a1,110
c00088ac:	0000c517          	auipc	a0,0xc
c00088b0:	06850513          	addi	a0,a0,104 # c0014914 <commands+0xc5c>
c00088b4:	a11f70ef          	jal	ra,c00002c4 <__panic>

c00088b8 <set_proc_name>:
c00088b8:	ff010113          	addi	sp,sp,-16
c00088bc:	00812423          	sw	s0,8(sp)
c00088c0:	06050413          	addi	s0,a0,96
c00088c4:	00912223          	sw	s1,4(sp)
c00088c8:	03300613          	li	a2,51
c00088cc:	00058493          	mv	s1,a1
c00088d0:	00040513          	mv	a0,s0
c00088d4:	00000593          	li	a1,0
c00088d8:	00112623          	sw	ra,12(sp)
c00088dc:	2dd0a0ef          	jal	ra,c00133b8 <memset>
c00088e0:	00048593          	mv	a1,s1
c00088e4:	00040513          	mv	a0,s0
c00088e8:	00c12083          	lw	ra,12(sp)
c00088ec:	00812403          	lw	s0,8(sp)
c00088f0:	00412483          	lw	s1,4(sp)
c00088f4:	03200613          	li	a2,50
c00088f8:	01010113          	addi	sp,sp,16
c00088fc:	32d0a06f          	j	c0013428 <memcpy>

c0008900 <proc_run>:
c0008900:	ff010113          	addi	sp,sp,-16
c0008904:	00912223          	sw	s1,4(sp)
c0008908:	00112623          	sw	ra,12(sp)
c000890c:	00812423          	sw	s0,8(sp)
c0008910:	01212023          	sw	s2,0(sp)
c0008914:	00092497          	auipc	s1,0x92
c0008918:	e984a483          	lw	s1,-360(s1) # c009a7ac <current>
c000891c:	02a48e63          	beq	s1,a0,c0008958 <proc_run+0x58>
c0008920:	00050413          	mv	s0,a0
c0008924:	100027f3          	csrr	a5,sstatus
c0008928:	0027f793          	andi	a5,a5,2
c000892c:	00000913          	li	s2,0
c0008930:	04079c63          	bnez	a5,c0008988 <proc_run+0x88>
c0008934:	05842783          	lw	a5,88(s0)
c0008938:	00092297          	auipc	t0,0x92
c000893c:	e682aa23          	sw	s0,-396(t0) # c009a7ac <current>
c0008940:	00c7d793          	srli	a5,a5,0xc
c0008944:	18079073          	csrw	sptbr,a5
c0008948:	01c40593          	addi	a1,s0,28
c000894c:	01c48513          	addi	a0,s1,28
c0008950:	bc9ff0ef          	jal	ra,c0008518 <switch_to>
c0008954:	00091e63          	bnez	s2,c0008970 <proc_run+0x70>
c0008958:	00c12083          	lw	ra,12(sp)
c000895c:	00812403          	lw	s0,8(sp)
c0008960:	00412483          	lw	s1,4(sp)
c0008964:	00012903          	lw	s2,0(sp)
c0008968:	01010113          	addi	sp,sp,16
c000896c:	00008067          	ret
c0008970:	00c12083          	lw	ra,12(sp)
c0008974:	00812403          	lw	s0,8(sp)
c0008978:	00412483          	lw	s1,4(sp)
c000897c:	00012903          	lw	s2,0(sp)
c0008980:	01010113          	addi	sp,sp,16
c0008984:	c34f806f          	j	c0000db8 <intr_enable>
c0008988:	c38f80ef          	jal	ra,c0000dc0 <intr_disable>
c000898c:	00100913          	li	s2,1
c0008990:	fa5ff06f          	j	c0008934 <proc_run+0x34>

c0008994 <find_proc>:
c0008994:	000027b7          	lui	a5,0x2
c0008998:	fff50713          	addi	a4,a0,-1
c000899c:	ffe78793          	addi	a5,a5,-2 # 1ffe <_binary_bin_swap_img_size-0x5d02>
c00089a0:	06e7e663          	bltu	a5,a4,c0008a0c <find_proc+0x78>
c00089a4:	ff010113          	addi	sp,sp,-16
c00089a8:	00a00593          	li	a1,10
c00089ac:	00812423          	sw	s0,8(sp)
c00089b0:	00112623          	sw	ra,12(sp)
c00089b4:	00050413          	mv	s0,a0
c00089b8:	1a00b0ef          	jal	ra,c0013b58 <hash32>
c00089bc:	0008f797          	auipc	a5,0x8f
c00089c0:	d8c78793          	addi	a5,a5,-628 # c0097748 <hash_list>
c00089c4:	00351513          	slli	a0,a0,0x3
c00089c8:	00a78533          	add	a0,a5,a0
c00089cc:	00050793          	mv	a5,a0
c00089d0:	00c0006f          	j	c00089dc <find_proc+0x48>
c00089d4:	f687a703          	lw	a4,-152(a5)
c00089d8:	02e40063          	beq	s0,a4,c00089f8 <find_proc+0x64>
c00089dc:	0047a783          	lw	a5,4(a5)
c00089e0:	fef51ae3          	bne	a0,a5,c00089d4 <find_proc+0x40>
c00089e4:	00c12083          	lw	ra,12(sp)
c00089e8:	00000513          	li	a0,0
c00089ec:	00812403          	lw	s0,8(sp)
c00089f0:	01010113          	addi	sp,sp,16
c00089f4:	00008067          	ret
c00089f8:	00c12083          	lw	ra,12(sp)
c00089fc:	f6478513          	addi	a0,a5,-156
c0008a00:	00812403          	lw	s0,8(sp)
c0008a04:	01010113          	addi	sp,sp,16
c0008a08:	00008067          	ret
c0008a0c:	00000513          	li	a0,0
c0008a10:	00008067          	ret

c0008a14 <do_fork>:
c0008a14:	fd010113          	addi	sp,sp,-48
c0008a18:	03212023          	sw	s2,32(sp)
c0008a1c:	02112623          	sw	ra,44(sp)
c0008a20:	02812423          	sw	s0,40(sp)
c0008a24:	02912223          	sw	s1,36(sp)
c0008a28:	01312e23          	sw	s3,28(sp)
c0008a2c:	01412c23          	sw	s4,24(sp)
c0008a30:	01512a23          	sw	s5,20(sp)
c0008a34:	01612823          	sw	s6,16(sp)
c0008a38:	01712623          	sw	s7,12(sp)
c0008a3c:	00092797          	auipc	a5,0x92
c0008a40:	d7c7a783          	lw	a5,-644(a5) # c009a7b8 <nr_process>
c0008a44:	00001937          	lui	s2,0x1
c0008a48:	4d27d863          	ble	s2,a5,c0008f18 <do_fork+0x504>
c0008a4c:	00050a13          	mv	s4,a0
c0008a50:	00058993          	mv	s3,a1
c0008a54:	00060493          	mv	s1,a2
c0008a58:	b41ff0ef          	jal	ra,c0008598 <alloc_proc>
c0008a5c:	00050413          	mv	s0,a0
c0008a60:	48050863          	beqz	a0,c0008ef0 <do_fork+0x4dc>
c0008a64:	00092797          	auipc	a5,0x92
c0008a68:	d487a783          	lw	a5,-696(a5) # c009a7ac <current>
c0008a6c:	0a87a703          	lw	a4,168(a5)
c0008a70:	00f52a23          	sw	a5,20(a0)
c0008a74:	4c071e63          	bnez	a4,c0008f50 <do_fork+0x53c>
c0008a78:	00200513          	li	a0,2
c0008a7c:	e91fb0ef          	jal	ra,c000490c <alloc_pages>
c0008a80:	46050463          	beqz	a0,c0008ee8 <do_fork+0x4d4>
c0008a84:	00092697          	auipc	a3,0x92
c0008a88:	e2c6a683          	lw	a3,-468(a3) # c009a8b0 <pages>
c0008a8c:	40d506b3          	sub	a3,a0,a3
c0008a90:	0008ea97          	auipc	s5,0x8e
c0008a94:	5b4aaa83          	lw	s5,1460(s5) # c0097044 <nbase>
c0008a98:	4056d693          	srai	a3,a3,0x5
c0008a9c:	001007b7          	lui	a5,0x100
c0008aa0:	015686b3          	add	a3,a3,s5
c0008aa4:	fff78793          	addi	a5,a5,-1 # fffff <_binary_bin_sfs_img_size+0x8acff>
c0008aa8:	00f6f7b3          	and	a5,a3,a5
c0008aac:	00092717          	auipc	a4,0x92
c0008ab0:	cf872703          	lw	a4,-776(a4) # c009a7a4 <npage>
c0008ab4:	00c69693          	slli	a3,a3,0xc
c0008ab8:	4ce7fc63          	bleu	a4,a5,c0008f90 <do_fork+0x57c>
c0008abc:	00092717          	auipc	a4,0x92
c0008ac0:	cf072703          	lw	a4,-784(a4) # c009a7ac <current>
c0008ac4:	0dc72b03          	lw	s6,220(a4)
c0008ac8:	00092797          	auipc	a5,0x92
c0008acc:	de07a783          	lw	a5,-544(a5) # c009a8a8 <va_pa_offset>
c0008ad0:	00d786b3          	add	a3,a5,a3
c0008ad4:	00d42623          	sw	a3,12(s0)
c0008ad8:	480b0c63          	beqz	s6,c0008f70 <do_fork+0x55c>
c0008adc:	80090913          	addi	s2,s2,-2048 # 800 <_binary_bin_swap_img_size-0x7500>
c0008ae0:	012a7933          	and	s2,s4,s2
c0008ae4:	2c090a63          	beqz	s2,c0008db8 <do_fork+0x3a4>
c0008ae8:	008b2783          	lw	a5,8(s6)
c0008aec:	01872903          	lw	s2,24(a4)
c0008af0:	00178793          	addi	a5,a5,1
c0008af4:	00fb2423          	sw	a5,8(s6)
c0008af8:	0d642e23          	sw	s6,220(s0)
c0008afc:	02090c63          	beqz	s2,c0008b34 <do_fork+0x120>
c0008b00:	100a7a13          	andi	s4,s4,256
c0008b04:	2e0a0263          	beqz	s4,c0008de8 <do_fork+0x3d4>
c0008b08:	01892783          	lw	a5,24(s2)
c0008b0c:	00c92683          	lw	a3,12(s2)
c0008b10:	c0000737          	lui	a4,0xc0000
c0008b14:	00178793          	addi	a5,a5,1
c0008b18:	00f92c23          	sw	a5,24(s2)
c0008b1c:	01242c23          	sw	s2,24(s0)
c0008b20:	40e6ec63          	bltu	a3,a4,c0008f38 <do_fork+0x524>
c0008b24:	00092797          	auipc	a5,0x92
c0008b28:	d847a783          	lw	a5,-636(a5) # c009a8a8 <va_pa_offset>
c0008b2c:	40f686b3          	sub	a3,a3,a5
c0008b30:	04d42c23          	sw	a3,88(s0)
c0008b34:	00c42703          	lw	a4,12(s0)
c0008b38:	000027b7          	lui	a5,0x2
c0008b3c:	f7078793          	addi	a5,a5,-144 # 1f70 <_binary_bin_swap_img_size-0x5d90>
c0008b40:	00f70733          	add	a4,a4,a5
c0008b44:	00048613          	mv	a2,s1
c0008b48:	04e42a23          	sw	a4,84(s0)
c0008b4c:	00070793          	mv	a5,a4
c0008b50:	08048693          	addi	a3,s1,128
c0008b54:	00062f03          	lw	t5,0(a2)
c0008b58:	00462e83          	lw	t4,4(a2)
c0008b5c:	00862e03          	lw	t3,8(a2)
c0008b60:	00c62303          	lw	t1,12(a2)
c0008b64:	01062883          	lw	a7,16(a2)
c0008b68:	01462803          	lw	a6,20(a2)
c0008b6c:	01862503          	lw	a0,24(a2)
c0008b70:	01c62583          	lw	a1,28(a2)
c0008b74:	01e7a023          	sw	t5,0(a5)
c0008b78:	01d7a223          	sw	t4,4(a5)
c0008b7c:	01c7a423          	sw	t3,8(a5)
c0008b80:	0067a623          	sw	t1,12(a5)
c0008b84:	0117a823          	sw	a7,16(a5)
c0008b88:	0107aa23          	sw	a6,20(a5)
c0008b8c:	00a7ac23          	sw	a0,24(a5)
c0008b90:	00b7ae23          	sw	a1,28(a5)
c0008b94:	02060613          	addi	a2,a2,32
c0008b98:	02078793          	addi	a5,a5,32
c0008b9c:	fad61ce3          	bne	a2,a3,c0008b54 <do_fork+0x140>
c0008ba0:	00062803          	lw	a6,0(a2)
c0008ba4:	00462503          	lw	a0,4(a2)
c0008ba8:	00862583          	lw	a1,8(a2)
c0008bac:	00c62683          	lw	a3,12(a2)
c0008bb0:	0107a023          	sw	a6,0(a5)
c0008bb4:	00a7a223          	sw	a0,4(a5)
c0008bb8:	00b7a423          	sw	a1,8(a5)
c0008bbc:	00d7a623          	sw	a3,12(a5)
c0008bc0:	02072423          	sw	zero,40(a4) # c0000028 <sbi_remote_fence_i+0xc0000738>
c0008bc4:	16098c63          	beqz	s3,c0008d3c <do_fork+0x328>
c0008bc8:	01372423          	sw	s3,8(a4)
c0008bcc:	00000797          	auipc	a5,0x0
c0008bd0:	aac78793          	addi	a5,a5,-1364 # c0008678 <forkret>
c0008bd4:	00f42e23          	sw	a5,28(s0)
c0008bd8:	02e42023          	sw	a4,32(s0)
c0008bdc:	100027f3          	csrr	a5,sstatus
c0008be0:	0027f793          	andi	a5,a5,2
c0008be4:	00000913          	li	s2,0
c0008be8:	16079e63          	bnez	a5,c0008d64 <do_fork+0x350>
c0008bec:	0008e517          	auipc	a0,0x8e
c0008bf0:	45c52503          	lw	a0,1116(a0) # c0097048 <last_pid.1997>
c0008bf4:	0008ee17          	auipc	t3,0x8e
c0008bf8:	454e0e13          	addi	t3,t3,1108 # c0097048 <last_pid.1997>
c0008bfc:	00150513          	addi	a0,a0,1
c0008c00:	00ae2023          	sw	a0,0(t3)
c0008c04:	000027b7          	lui	a5,0x2
c0008c08:	18f54263          	blt	a0,a5,c0008d8c <do_fork+0x378>
c0008c0c:	00100513          	li	a0,1
c0008c10:	00ae2023          	sw	a0,0(t3)
c0008c14:	000027b7          	lui	a5,0x2
c0008c18:	0008ee97          	auipc	t4,0x8e
c0008c1c:	434e8e93          	addi	t4,t4,1076 # c009704c <next_safe.1996>
c0008c20:	00fea023          	sw	a5,0(t4)
c0008c24:	0008e817          	auipc	a6,0x8e
c0008c28:	42482803          	lw	a6,1060(a6) # c0097048 <last_pid.1997>
c0008c2c:	00000593          	li	a1,0
c0008c30:	00092497          	auipc	s1,0x92
c0008c34:	c8448493          	addi	s1,s1,-892 # c009a8b4 <proc_list>
c0008c38:	00078893          	mv	a7,a5
c0008c3c:	00100613          	li	a2,1
c0008c40:	00058313          	mv	t1,a1
c0008c44:	00088693          	mv	a3,a7
c0008c48:	00092797          	auipc	a5,0x92
c0008c4c:	c6c78793          	addi	a5,a5,-916 # c009a8b4 <proc_list>
c0008c50:	0047a783          	lw	a5,4(a5)
c0008c54:	02978263          	beq	a5,s1,c0008c78 <do_fork+0x264>
c0008c58:	f707a703          	lw	a4,-144(a5)
c0008c5c:	14e50463          	beq	a0,a4,c0008da4 <do_fork+0x390>
c0008c60:	fee558e3          	ble	a4,a0,c0008c50 <do_fork+0x23c>
c0008c64:	fed756e3          	ble	a3,a4,c0008c50 <do_fork+0x23c>
c0008c68:	0047a783          	lw	a5,4(a5)
c0008c6c:	00070693          	mv	a3,a4
c0008c70:	00060313          	mv	t1,a2
c0008c74:	fe9792e3          	bne	a5,s1,c0008c58 <do_fork+0x244>
c0008c78:	32059863          	bnez	a1,c0008fa8 <do_fork+0x594>
c0008c7c:	32031a63          	bnez	t1,c0008fb0 <do_fork+0x59c>
c0008c80:	00a00593          	li	a1,10
c0008c84:	00a42223          	sw	a0,4(s0)
c0008c88:	6d10a0ef          	jal	ra,c0013b58 <hash32>
c0008c8c:	0008f797          	auipc	a5,0x8f
c0008c90:	abc78793          	addi	a5,a5,-1348 # c0097748 <hash_list>
c0008c94:	00351513          	slli	a0,a0,0x3
c0008c98:	00a78533          	add	a0,a5,a0
c0008c9c:	00452583          	lw	a1,4(a0)
c0008ca0:	01442683          	lw	a3,20(s0)
c0008ca4:	09c40793          	addi	a5,s0,156
c0008ca8:	00f5a023          	sw	a5,0(a1)
c0008cac:	00f52223          	sw	a5,4(a0)
c0008cb0:	0ac6a703          	lw	a4,172(a3)
c0008cb4:	00092617          	auipc	a2,0x92
c0008cb8:	c0462603          	lw	a2,-1020(a2) # c009a8b8 <proc_list+0x4>
c0008cbc:	09440793          	addi	a5,s0,148
c0008cc0:	0ab42023          	sw	a1,160(s0)
c0008cc4:	08a42e23          	sw	a0,156(s0)
c0008cc8:	00f62023          	sw	a5,0(a2)
c0008ccc:	00f4a223          	sw	a5,4(s1)
c0008cd0:	08c42c23          	sw	a2,152(s0)
c0008cd4:	08942a23          	sw	s1,148(s0)
c0008cd8:	0a042823          	sw	zero,176(s0)
c0008cdc:	0ae42a23          	sw	a4,180(s0)
c0008ce0:	00070463          	beqz	a4,c0008ce8 <do_fork+0x2d4>
c0008ce4:	0a872823          	sw	s0,176(a4)
c0008ce8:	00092797          	auipc	a5,0x92
c0008cec:	ad07a783          	lw	a5,-1328(a5) # c009a7b8 <nr_process>
c0008cf0:	00178793          	addi	a5,a5,1
c0008cf4:	0a86a623          	sw	s0,172(a3)
c0008cf8:	00092297          	auipc	t0,0x92
c0008cfc:	acf2a023          	sw	a5,-1344(t0) # c009a7b8 <nr_process>
c0008d00:	0e091063          	bnez	s2,c0008de0 <do_fork+0x3cc>
c0008d04:	00040513          	mv	a0,s0
c0008d08:	6d0010ef          	jal	ra,c000a3d8 <wakeup_proc>
c0008d0c:	00442503          	lw	a0,4(s0)
c0008d10:	02c12083          	lw	ra,44(sp)
c0008d14:	02812403          	lw	s0,40(sp)
c0008d18:	02412483          	lw	s1,36(sp)
c0008d1c:	02012903          	lw	s2,32(sp)
c0008d20:	01c12983          	lw	s3,28(sp)
c0008d24:	01812a03          	lw	s4,24(sp)
c0008d28:	01412a83          	lw	s5,20(sp)
c0008d2c:	01012b03          	lw	s6,16(sp)
c0008d30:	00c12b83          	lw	s7,12(sp)
c0008d34:	03010113          	addi	sp,sp,48
c0008d38:	00008067          	ret
c0008d3c:	00070993          	mv	s3,a4
c0008d40:	01372423          	sw	s3,8(a4)
c0008d44:	00000797          	auipc	a5,0x0
c0008d48:	93478793          	addi	a5,a5,-1740 # c0008678 <forkret>
c0008d4c:	00f42e23          	sw	a5,28(s0)
c0008d50:	02e42023          	sw	a4,32(s0)
c0008d54:	100027f3          	csrr	a5,sstatus
c0008d58:	0027f793          	andi	a5,a5,2
c0008d5c:	00000913          	li	s2,0
c0008d60:	e80786e3          	beqz	a5,c0008bec <do_fork+0x1d8>
c0008d64:	85cf80ef          	jal	ra,c0000dc0 <intr_disable>
c0008d68:	0008e517          	auipc	a0,0x8e
c0008d6c:	2e052503          	lw	a0,736(a0) # c0097048 <last_pid.1997>
c0008d70:	0008ee17          	auipc	t3,0x8e
c0008d74:	2d8e0e13          	addi	t3,t3,728 # c0097048 <last_pid.1997>
c0008d78:	00150513          	addi	a0,a0,1
c0008d7c:	00ae2023          	sw	a0,0(t3)
c0008d80:	000027b7          	lui	a5,0x2
c0008d84:	00100913          	li	s2,1
c0008d88:	e8f552e3          	ble	a5,a0,c0008c0c <do_fork+0x1f8>
c0008d8c:	0008e797          	auipc	a5,0x8e
c0008d90:	2c07a783          	lw	a5,704(a5) # c009704c <next_safe.1996>
c0008d94:	00092497          	auipc	s1,0x92
c0008d98:	b2048493          	addi	s1,s1,-1248 # c009a8b4 <proc_list>
c0008d9c:	e6f55ce3          	ble	a5,a0,c0008c14 <do_fork+0x200>
c0008da0:	ee1ff06f          	j	c0008c80 <do_fork+0x26c>
c0008da4:	00150513          	addi	a0,a0,1
c0008da8:	14d55863          	ble	a3,a0,c0008ef8 <do_fork+0x4e4>
c0008dac:	00050813          	mv	a6,a0
c0008db0:	00060593          	mv	a1,a2
c0008db4:	e9dff06f          	j	c0008c50 <do_fork+0x23c>
c0008db8:	cacff0ef          	jal	ra,c0008264 <files_create>
c0008dbc:	00050913          	mv	s2,a0
c0008dc0:	0e050263          	beqz	a0,c0008ea4 <do_fork+0x490>
c0008dc4:	000b0593          	mv	a1,s6
c0008dc8:	e50ff0ef          	jal	ra,c0008418 <dup_files>
c0008dcc:	14051063          	bnez	a0,c0008f0c <do_fork+0x4f8>
c0008dd0:	00092717          	auipc	a4,0x92
c0008dd4:	9dc72703          	lw	a4,-1572(a4) # c009a7ac <current>
c0008dd8:	00090b13          	mv	s6,s2
c0008ddc:	d0dff06f          	j	c0008ae8 <do_fork+0xd4>
c0008de0:	fd9f70ef          	jal	ra,c0000db8 <intr_enable>
c0008de4:	f21ff06f          	j	c0008d04 <do_fork+0x2f0>
c0008de8:	965f80ef          	jal	ra,c000174c <mm_create>
c0008dec:	00050a13          	mv	s4,a0
c0008df0:	0a050663          	beqz	a0,c0008e9c <do_fork+0x488>
c0008df4:	00c50513          	addi	a0,a0,12
c0008df8:	9c9ff0ef          	jal	ra,c00087c0 <setup_pgdir.isra.4>
c0008dfc:	08051c63          	bnez	a0,c0008e94 <do_fork+0x480>
c0008e00:	01c90b13          	addi	s6,s2,28
c0008e04:	000b0513          	mv	a0,s6
c0008e08:	bf9fd0ef          	jal	ra,c0006a00 <down>
c0008e0c:	00092797          	auipc	a5,0x92
c0008e10:	9a07a783          	lw	a5,-1632(a5) # c009a7ac <current>
c0008e14:	00078663          	beqz	a5,c0008e20 <do_fork+0x40c>
c0008e18:	0047a783          	lw	a5,4(a5)
c0008e1c:	02f92423          	sw	a5,40(s2)
c0008e20:	00090593          	mv	a1,s2
c0008e24:	000a0513          	mv	a0,s4
c0008e28:	cb5f80ef          	jal	ra,c0001adc <dup_mmap>
c0008e2c:	00050b93          	mv	s7,a0
c0008e30:	000b0513          	mv	a0,s6
c0008e34:	bc9fd0ef          	jal	ra,c00069fc <up>
c0008e38:	02092423          	sw	zero,40(s2)
c0008e3c:	000b9663          	bnez	s7,c0008e48 <do_fork+0x434>
c0008e40:	000a0913          	mv	s2,s4
c0008e44:	cc5ff06f          	j	c0008b08 <do_fork+0xf4>
c0008e48:	000a0513          	mv	a0,s4
c0008e4c:	d7df80ef          	jal	ra,c0001bc8 <exit_mmap>
c0008e50:	00ca2683          	lw	a3,12(s4)
c0008e54:	c00007b7          	lui	a5,0xc0000
c0008e58:	0cf6e463          	bltu	a3,a5,c0008f20 <do_fork+0x50c>
c0008e5c:	00092797          	auipc	a5,0x92
c0008e60:	a4c7a783          	lw	a5,-1460(a5) # c009a8a8 <va_pa_offset>
c0008e64:	40f687b3          	sub	a5,a3,a5
c0008e68:	00c7d793          	srli	a5,a5,0xc
c0008e6c:	00092717          	auipc	a4,0x92
c0008e70:	93872703          	lw	a4,-1736(a4) # c009a7a4 <npage>
c0008e74:	14e7f263          	bleu	a4,a5,c0008fb8 <do_fork+0x5a4>
c0008e78:	415787b3          	sub	a5,a5,s5
c0008e7c:	00579793          	slli	a5,a5,0x5
c0008e80:	00092517          	auipc	a0,0x92
c0008e84:	a3052503          	lw	a0,-1488(a0) # c009a8b0 <pages>
c0008e88:	00100593          	li	a1,1
c0008e8c:	00f50533          	add	a0,a0,a5
c0008e90:	b31fb0ef          	jal	ra,c00049c0 <free_pages>
c0008e94:	000a0513          	mv	a0,s4
c0008e98:	ad1f80ef          	jal	ra,c0001968 <mm_destroy>
c0008e9c:	00040513          	mv	a0,s0
c0008ea0:	fb8ff0ef          	jal	ra,c0008658 <put_files>
c0008ea4:	00c42683          	lw	a3,12(s0)
c0008ea8:	c00007b7          	lui	a5,0xc0000
c0008eac:	06f6ea63          	bltu	a3,a5,c0008f20 <do_fork+0x50c>
c0008eb0:	00092797          	auipc	a5,0x92
c0008eb4:	9f87a783          	lw	a5,-1544(a5) # c009a8a8 <va_pa_offset>
c0008eb8:	40f687b3          	sub	a5,a3,a5
c0008ebc:	00c7d793          	srli	a5,a5,0xc
c0008ec0:	00092717          	auipc	a4,0x92
c0008ec4:	8e472703          	lw	a4,-1820(a4) # c009a7a4 <npage>
c0008ec8:	0ee7f863          	bleu	a4,a5,c0008fb8 <do_fork+0x5a4>
c0008ecc:	415787b3          	sub	a5,a5,s5
c0008ed0:	00579793          	slli	a5,a5,0x5
c0008ed4:	00092517          	auipc	a0,0x92
c0008ed8:	9dc52503          	lw	a0,-1572(a0) # c009a8b0 <pages>
c0008edc:	00200593          	li	a1,2
c0008ee0:	00f50533          	add	a0,a0,a5
c0008ee4:	addfb0ef          	jal	ra,c00049c0 <free_pages>
c0008ee8:	00040513          	mv	a0,s0
c0008eec:	820fa0ef          	jal	ra,c0002f0c <kfree>
c0008ef0:	ffc00513          	li	a0,-4
c0008ef4:	e1dff06f          	j	c0008d10 <do_fork+0x2fc>
c0008ef8:	01154463          	blt	a0,a7,c0008f00 <do_fork+0x4ec>
c0008efc:	00100513          	li	a0,1
c0008f00:	00060593          	mv	a1,a2
c0008f04:	00050813          	mv	a6,a0
c0008f08:	d39ff06f          	j	c0008c40 <do_fork+0x22c>
c0008f0c:	00090513          	mv	a0,s2
c0008f10:	ba8ff0ef          	jal	ra,c00082b8 <files_destroy>
c0008f14:	f91ff06f          	j	c0008ea4 <do_fork+0x490>
c0008f18:	ffb00513          	li	a0,-5
c0008f1c:	df5ff06f          	j	c0008d10 <do_fork+0x2fc>
c0008f20:	0000c617          	auipc	a2,0xc
c0008f24:	c8460613          	addi	a2,a2,-892 # c0014ba4 <commands+0xeec>
c0008f28:	07000593          	li	a1,112
c0008f2c:	0000c517          	auipc	a0,0xc
c0008f30:	9e850513          	addi	a0,a0,-1560 # c0014914 <commands+0xc5c>
c0008f34:	b90f70ef          	jal	ra,c00002c4 <__panic>
c0008f38:	0000c617          	auipc	a2,0xc
c0008f3c:	c6c60613          	addi	a2,a2,-916 # c0014ba4 <commands+0xeec>
c0008f40:	17100593          	li	a1,369
c0008f44:	0000d517          	auipc	a0,0xd
c0008f48:	3c050513          	addi	a0,a0,960 # c0016304 <default_pmm_manager+0x1014>
c0008f4c:	b78f70ef          	jal	ra,c00002c4 <__panic>
c0008f50:	0000d697          	auipc	a3,0xd
c0008f54:	12c68693          	addi	a3,a3,300 # c001607c <default_pmm_manager+0xd8c>
c0008f58:	0000b617          	auipc	a2,0xb
c0008f5c:	ec460613          	addi	a2,a2,-316 # c0013e1c <commands+0x164>
c0008f60:	1ea00593          	li	a1,490
c0008f64:	0000d517          	auipc	a0,0xd
c0008f68:	3a050513          	addi	a0,a0,928 # c0016304 <default_pmm_manager+0x1014>
c0008f6c:	b58f70ef          	jal	ra,c00002c4 <__panic>
c0008f70:	0000d697          	auipc	a3,0xd
c0008f74:	12868693          	addi	a3,a3,296 # c0016098 <default_pmm_manager+0xda8>
c0008f78:	0000b617          	auipc	a2,0xb
c0008f7c:	ea460613          	addi	a2,a2,-348 # c0013e1c <commands+0x164>
c0008f80:	19000593          	li	a1,400
c0008f84:	0000d517          	auipc	a0,0xd
c0008f88:	38050513          	addi	a0,a0,896 # c0016304 <default_pmm_manager+0x1014>
c0008f8c:	b38f70ef          	jal	ra,c00002c4 <__panic>
c0008f90:	0000c617          	auipc	a2,0xc
c0008f94:	bf060613          	addi	a2,a2,-1040 # c0014b80 <commands+0xec8>
c0008f98:	06e00593          	li	a1,110
c0008f9c:	0000c517          	auipc	a0,0xc
c0008fa0:	97850513          	addi	a0,a0,-1672 # c0014914 <commands+0xc5c>
c0008fa4:	b20f70ef          	jal	ra,c00002c4 <__panic>
c0008fa8:	010e2023          	sw	a6,0(t3)
c0008fac:	cd1ff06f          	j	c0008c7c <do_fork+0x268>
c0008fb0:	00dea023          	sw	a3,0(t4)
c0008fb4:	ccdff06f          	j	c0008c80 <do_fork+0x26c>
c0008fb8:	0000c617          	auipc	a2,0xc
c0008fbc:	93c60613          	addi	a2,a2,-1732 # c00148f4 <commands+0xc3c>
c0008fc0:	06900593          	li	a1,105
c0008fc4:	0000c517          	auipc	a0,0xc
c0008fc8:	95050513          	addi	a0,a0,-1712 # c0014914 <commands+0xc5c>
c0008fcc:	af8f70ef          	jal	ra,c00002c4 <__panic>

c0008fd0 <kernel_thread>:
c0008fd0:	f6010113          	addi	sp,sp,-160
c0008fd4:	08812c23          	sw	s0,152(sp)
c0008fd8:	08912a23          	sw	s1,148(sp)
c0008fdc:	09212823          	sw	s2,144(sp)
c0008fe0:	00058493          	mv	s1,a1
c0008fe4:	00050913          	mv	s2,a0
c0008fe8:	00060413          	mv	s0,a2
c0008fec:	00000593          	li	a1,0
c0008ff0:	09000613          	li	a2,144
c0008ff4:	00010513          	mv	a0,sp
c0008ff8:	08112e23          	sw	ra,156(sp)
c0008ffc:	3bc0a0ef          	jal	ra,c00133b8 <memset>
c0009000:	03212023          	sw	s2,32(sp)
c0009004:	02912223          	sw	s1,36(sp)
c0009008:	100027f3          	csrr	a5,sstatus
c000900c:	edd7f793          	andi	a5,a5,-291
c0009010:	1207e793          	ori	a5,a5,288
c0009014:	08f12023          	sw	a5,128(sp)
c0009018:	00010613          	mv	a2,sp
c000901c:	10046513          	ori	a0,s0,256
c0009020:	fffff797          	auipc	a5,0xfffff
c0009024:	56c78793          	addi	a5,a5,1388 # c000858c <kernel_thread_entry>
c0009028:	00000593          	li	a1,0
c000902c:	08f12223          	sw	a5,132(sp)
c0009030:	9e5ff0ef          	jal	ra,c0008a14 <do_fork>
c0009034:	09c12083          	lw	ra,156(sp)
c0009038:	09812403          	lw	s0,152(sp)
c000903c:	09412483          	lw	s1,148(sp)
c0009040:	09012903          	lw	s2,144(sp)
c0009044:	0a010113          	addi	sp,sp,160
c0009048:	00008067          	ret

c000904c <do_exit>:
c000904c:	ff010113          	addi	sp,sp,-16
c0009050:	00112623          	sw	ra,12(sp)
c0009054:	00812423          	sw	s0,8(sp)
c0009058:	00912223          	sw	s1,4(sp)
c000905c:	01212023          	sw	s2,0(sp)
c0009060:	00091697          	auipc	a3,0x91
c0009064:	74c6a683          	lw	a3,1868(a3) # c009a7ac <current>
c0009068:	00091797          	auipc	a5,0x91
c000906c:	7487a783          	lw	a5,1864(a5) # c009a7b0 <idleproc>
c0009070:	1af68263          	beq	a3,a5,c0009214 <do_exit+0x1c8>
c0009074:	00091797          	auipc	a5,0x91
c0009078:	7407a783          	lw	a5,1856(a5) # c009a7b4 <initproc>
c000907c:	1af68863          	beq	a3,a5,c000922c <do_exit+0x1e0>
c0009080:	0186a403          	lw	s0,24(a3)
c0009084:	00050493          	mv	s1,a0
c0009088:	02040463          	beqz	s0,c00090b0 <do_exit+0x64>
c000908c:	00092797          	auipc	a5,0x92
c0009090:	8207a783          	lw	a5,-2016(a5) # c009a8ac <boot_cr3>
c0009094:	00c7d793          	srli	a5,a5,0xc
c0009098:	18079073          	csrw	sptbr,a5
c000909c:	01842783          	lw	a5,24(s0)
c00090a0:	fff78793          	addi	a5,a5,-1
c00090a4:	00f42c23          	sw	a5,24(s0)
c00090a8:	0c078a63          	beqz	a5,c000917c <do_exit+0x130>
c00090ac:	0006ac23          	sw	zero,24(a3)
c00090b0:	00068513          	mv	a0,a3
c00090b4:	da4ff0ef          	jal	ra,c0008658 <put_files>
c00090b8:	00091697          	auipc	a3,0x91
c00090bc:	6f46a683          	lw	a3,1780(a3) # c009a7ac <current>
c00090c0:	00300793          	li	a5,3
c00090c4:	00f6a023          	sw	a5,0(a3)
c00090c8:	0a96a223          	sw	s1,164(a3)
c00090cc:	100027f3          	csrr	a5,sstatus
c00090d0:	0027f793          	andi	a5,a5,2
c00090d4:	00000913          	li	s2,0
c00090d8:	10079863          	bnez	a5,c00091e8 <do_exit+0x19c>
c00090dc:	0146a503          	lw	a0,20(a3)
c00090e0:	800007b7          	lui	a5,0x80000
c00090e4:	00178793          	addi	a5,a5,1 # 80000001 <sbi_remote_fence_i+0x80000711>
c00090e8:	0a852703          	lw	a4,168(a0)
c00090ec:	10f70c63          	beq	a4,a5,c0009204 <do_exit+0x1b8>
c00090f0:	800004b7          	lui	s1,0x80000
c00090f4:	00300413          	li	s0,3
c00090f8:	00148493          	addi	s1,s1,1 # 80000001 <sbi_remote_fence_i+0x80000711>
c00090fc:	0ac6a783          	lw	a5,172(a3)
c0009100:	04078863          	beqz	a5,c0009150 <do_exit+0x104>
c0009104:	0b47a703          	lw	a4,180(a5)
c0009108:	00091517          	auipc	a0,0x91
c000910c:	6ac52503          	lw	a0,1708(a0) # c009a7b4 <initproc>
c0009110:	0ae6a623          	sw	a4,172(a3)
c0009114:	0ac52703          	lw	a4,172(a0)
c0009118:	0a07a823          	sw	zero,176(a5)
c000911c:	0ae7aa23          	sw	a4,180(a5)
c0009120:	00070463          	beqz	a4,c0009128 <do_exit+0xdc>
c0009124:	0af72823          	sw	a5,176(a4)
c0009128:	0007a703          	lw	a4,0(a5)
c000912c:	00a7aa23          	sw	a0,20(a5)
c0009130:	0af52623          	sw	a5,172(a0)
c0009134:	fc8714e3          	bne	a4,s0,c00090fc <do_exit+0xb0>
c0009138:	0a852783          	lw	a5,168(a0)
c000913c:	fc9790e3          	bne	a5,s1,c00090fc <do_exit+0xb0>
c0009140:	298010ef          	jal	ra,c000a3d8 <wakeup_proc>
c0009144:	00091697          	auipc	a3,0x91
c0009148:	6686a683          	lw	a3,1640(a3) # c009a7ac <current>
c000914c:	fb1ff06f          	j	c00090fc <do_exit+0xb0>
c0009150:	0a091663          	bnez	s2,c00091fc <do_exit+0x1b0>
c0009154:	374010ef          	jal	ra,c000a4c8 <schedule>
c0009158:	00091797          	auipc	a5,0x91
c000915c:	6547a783          	lw	a5,1620(a5) # c009a7ac <current>
c0009160:	0047a683          	lw	a3,4(a5)
c0009164:	0000d617          	auipc	a2,0xd
c0009168:	ef860613          	addi	a2,a2,-264 # c001605c <default_pmm_manager+0xd6c>
c000916c:	24600593          	li	a1,582
c0009170:	0000d517          	auipc	a0,0xd
c0009174:	19450513          	addi	a0,a0,404 # c0016304 <default_pmm_manager+0x1014>
c0009178:	94cf70ef          	jal	ra,c00002c4 <__panic>
c000917c:	00040513          	mv	a0,s0
c0009180:	a49f80ef          	jal	ra,c0001bc8 <exit_mmap>
c0009184:	00c42683          	lw	a3,12(s0)
c0009188:	c00007b7          	lui	a5,0xc0000
c000918c:	fff78793          	addi	a5,a5,-1 # bfffffff <sbi_remote_fence_i+0xc000070f>
c0009190:	0cd7f663          	bleu	a3,a5,c000925c <do_exit+0x210>
c0009194:	00091797          	auipc	a5,0x91
c0009198:	7147a783          	lw	a5,1812(a5) # c009a8a8 <va_pa_offset>
c000919c:	40f687b3          	sub	a5,a3,a5
c00091a0:	00c7d793          	srli	a5,a5,0xc
c00091a4:	00091717          	auipc	a4,0x91
c00091a8:	60072703          	lw	a4,1536(a4) # c009a7a4 <npage>
c00091ac:	08e7fc63          	bleu	a4,a5,c0009244 <do_exit+0x1f8>
c00091b0:	0008e717          	auipc	a4,0x8e
c00091b4:	e9472703          	lw	a4,-364(a4) # c0097044 <nbase>
c00091b8:	40e787b3          	sub	a5,a5,a4
c00091bc:	00579793          	slli	a5,a5,0x5
c00091c0:	00091517          	auipc	a0,0x91
c00091c4:	6f052503          	lw	a0,1776(a0) # c009a8b0 <pages>
c00091c8:	00f50533          	add	a0,a0,a5
c00091cc:	00100593          	li	a1,1
c00091d0:	ff0fb0ef          	jal	ra,c00049c0 <free_pages>
c00091d4:	00040513          	mv	a0,s0
c00091d8:	f90f80ef          	jal	ra,c0001968 <mm_destroy>
c00091dc:	00091697          	auipc	a3,0x91
c00091e0:	5d06a683          	lw	a3,1488(a3) # c009a7ac <current>
c00091e4:	ec9ff06f          	j	c00090ac <do_exit+0x60>
c00091e8:	bd9f70ef          	jal	ra,c0000dc0 <intr_disable>
c00091ec:	00100913          	li	s2,1
c00091f0:	00091697          	auipc	a3,0x91
c00091f4:	5bc6a683          	lw	a3,1468(a3) # c009a7ac <current>
c00091f8:	ee5ff06f          	j	c00090dc <do_exit+0x90>
c00091fc:	bbdf70ef          	jal	ra,c0000db8 <intr_enable>
c0009200:	f55ff06f          	j	c0009154 <do_exit+0x108>
c0009204:	1d4010ef          	jal	ra,c000a3d8 <wakeup_proc>
c0009208:	00091697          	auipc	a3,0x91
c000920c:	5a46a683          	lw	a3,1444(a3) # c009a7ac <current>
c0009210:	ee1ff06f          	j	c00090f0 <do_exit+0xa4>
c0009214:	0000d617          	auipc	a2,0xd
c0009218:	e2860613          	addi	a2,a2,-472 # c001603c <default_pmm_manager+0xd4c>
c000921c:	21600593          	li	a1,534
c0009220:	0000d517          	auipc	a0,0xd
c0009224:	0e450513          	addi	a0,a0,228 # c0016304 <default_pmm_manager+0x1014>
c0009228:	89cf70ef          	jal	ra,c00002c4 <__panic>
c000922c:	0000d617          	auipc	a2,0xd
c0009230:	e2060613          	addi	a2,a2,-480 # c001604c <default_pmm_manager+0xd5c>
c0009234:	21900593          	li	a1,537
c0009238:	0000d517          	auipc	a0,0xd
c000923c:	0cc50513          	addi	a0,a0,204 # c0016304 <default_pmm_manager+0x1014>
c0009240:	884f70ef          	jal	ra,c00002c4 <__panic>
c0009244:	0000b617          	auipc	a2,0xb
c0009248:	6b060613          	addi	a2,a2,1712 # c00148f4 <commands+0xc3c>
c000924c:	06900593          	li	a1,105
c0009250:	0000b517          	auipc	a0,0xb
c0009254:	6c450513          	addi	a0,a0,1732 # c0014914 <commands+0xc5c>
c0009258:	86cf70ef          	jal	ra,c00002c4 <__panic>
c000925c:	0000c617          	auipc	a2,0xc
c0009260:	94860613          	addi	a2,a2,-1720 # c0014ba4 <commands+0xeec>
c0009264:	07000593          	li	a1,112
c0009268:	0000b517          	auipc	a0,0xb
c000926c:	6ac50513          	addi	a0,a0,1708 # c0014914 <commands+0xc5c>
c0009270:	854f70ef          	jal	ra,c00002c4 <__panic>

c0009274 <do_wait.part.7>:
c0009274:	fe010113          	addi	sp,sp,-32
c0009278:	01212823          	sw	s2,16(sp)
c000927c:	01512223          	sw	s5,4(sp)
c0009280:	80000937          	lui	s2,0x80000
c0009284:	00100a93          	li	s5,1
c0009288:	00912a23          	sw	s1,20(sp)
c000928c:	01312623          	sw	s3,12(sp)
c0009290:	01412423          	sw	s4,8(sp)
c0009294:	00112e23          	sw	ra,28(sp)
c0009298:	00812c23          	sw	s0,24(sp)
c000929c:	00050993          	mv	s3,a0
c00092a0:	00058a13          	mv	s4,a1
c00092a4:	00300493          	li	s1,3
c00092a8:	01590933          	add	s2,s2,s5
c00092ac:	12099663          	bnez	s3,c00093d8 <do_wait.part.7+0x164>
c00092b0:	00091717          	auipc	a4,0x91
c00092b4:	4fc72703          	lw	a4,1276(a4) # c009a7ac <current>
c00092b8:	0ac72403          	lw	s0,172(a4)
c00092bc:	00041863          	bnez	s0,c00092cc <do_wait.part.7+0x58>
c00092c0:	17c0006f          	j	c000943c <do_wait.part.7+0x1c8>
c00092c4:	0b442403          	lw	s0,180(s0)
c00092c8:	12040c63          	beqz	s0,c0009400 <do_wait.part.7+0x18c>
c00092cc:	00042783          	lw	a5,0(s0)
c00092d0:	fe979ae3          	bne	a5,s1,c00092c4 <do_wait.part.7+0x50>
c00092d4:	00091797          	auipc	a5,0x91
c00092d8:	4dc7a783          	lw	a5,1244(a5) # c009a7b0 <idleproc>
c00092dc:	18878663          	beq	a5,s0,c0009468 <do_wait.part.7+0x1f4>
c00092e0:	00091797          	auipc	a5,0x91
c00092e4:	4d47a783          	lw	a5,1236(a5) # c009a7b4 <initproc>
c00092e8:	18f40063          	beq	s0,a5,c0009468 <do_wait.part.7+0x1f4>
c00092ec:	000a0663          	beqz	s4,c00092f8 <do_wait.part.7+0x84>
c00092f0:	0a442783          	lw	a5,164(s0)
c00092f4:	00fa2023          	sw	a5,0(s4)
c00092f8:	100027f3          	csrr	a5,sstatus
c00092fc:	0027f793          	andi	a5,a5,2
c0009300:	00000613          	li	a2,0
c0009304:	12079263          	bnez	a5,c0009428 <do_wait.part.7+0x1b4>
c0009308:	09c42683          	lw	a3,156(s0)
c000930c:	0a042703          	lw	a4,160(s0)
c0009310:	0b442783          	lw	a5,180(s0)
c0009314:	00e6a223          	sw	a4,4(a3)
c0009318:	00d72023          	sw	a3,0(a4)
c000931c:	09442683          	lw	a3,148(s0)
c0009320:	09842703          	lw	a4,152(s0)
c0009324:	00e6a223          	sw	a4,4(a3)
c0009328:	00d72023          	sw	a3,0(a4)
c000932c:	00078663          	beqz	a5,c0009338 <do_wait.part.7+0xc4>
c0009330:	0b042703          	lw	a4,176(s0)
c0009334:	0ae7a823          	sw	a4,176(a5)
c0009338:	0b042703          	lw	a4,176(s0)
c000933c:	10070463          	beqz	a4,c0009444 <do_wait.part.7+0x1d0>
c0009340:	0af72a23          	sw	a5,180(a4)
c0009344:	00091797          	auipc	a5,0x91
c0009348:	4747a783          	lw	a5,1140(a5) # c009a7b8 <nr_process>
c000934c:	fff78793          	addi	a5,a5,-1
c0009350:	00091297          	auipc	t0,0x91
c0009354:	46f2a423          	sw	a5,1128(t0) # c009a7b8 <nr_process>
c0009358:	0c061e63          	bnez	a2,c0009434 <do_wait.part.7+0x1c0>
c000935c:	00c42683          	lw	a3,12(s0)
c0009360:	c00007b7          	lui	a5,0xc0000
c0009364:	0ef6e663          	bltu	a3,a5,c0009450 <do_wait.part.7+0x1dc>
c0009368:	00091797          	auipc	a5,0x91
c000936c:	5407a783          	lw	a5,1344(a5) # c009a8a8 <va_pa_offset>
c0009370:	40f686b3          	sub	a3,a3,a5
c0009374:	00c6d693          	srli	a3,a3,0xc
c0009378:	00091797          	auipc	a5,0x91
c000937c:	42c7a783          	lw	a5,1068(a5) # c009a7a4 <npage>
c0009380:	10f6f063          	bleu	a5,a3,c0009480 <do_wait.part.7+0x20c>
c0009384:	0008e517          	auipc	a0,0x8e
c0009388:	cc052503          	lw	a0,-832(a0) # c0097044 <nbase>
c000938c:	40a686b3          	sub	a3,a3,a0
c0009390:	00569693          	slli	a3,a3,0x5
c0009394:	00091517          	auipc	a0,0x91
c0009398:	51c52503          	lw	a0,1308(a0) # c009a8b0 <pages>
c000939c:	00d50533          	add	a0,a0,a3
c00093a0:	00200593          	li	a1,2
c00093a4:	e1cfb0ef          	jal	ra,c00049c0 <free_pages>
c00093a8:	00040513          	mv	a0,s0
c00093ac:	b61f90ef          	jal	ra,c0002f0c <kfree>
c00093b0:	00000513          	li	a0,0
c00093b4:	01c12083          	lw	ra,28(sp)
c00093b8:	01812403          	lw	s0,24(sp)
c00093bc:	01412483          	lw	s1,20(sp)
c00093c0:	01012903          	lw	s2,16(sp)
c00093c4:	00c12983          	lw	s3,12(sp)
c00093c8:	00812a03          	lw	s4,8(sp)
c00093cc:	00412a83          	lw	s5,4(sp)
c00093d0:	02010113          	addi	sp,sp,32
c00093d4:	00008067          	ret
c00093d8:	00098513          	mv	a0,s3
c00093dc:	db8ff0ef          	jal	ra,c0008994 <find_proc>
c00093e0:	00050413          	mv	s0,a0
c00093e4:	04050c63          	beqz	a0,c000943c <do_wait.part.7+0x1c8>
c00093e8:	01452703          	lw	a4,20(a0)
c00093ec:	00091797          	auipc	a5,0x91
c00093f0:	3c07a783          	lw	a5,960(a5) # c009a7ac <current>
c00093f4:	04f71463          	bne	a4,a5,c000943c <do_wait.part.7+0x1c8>
c00093f8:	00052783          	lw	a5,0(a0)
c00093fc:	ec978ce3          	beq	a5,s1,c00092d4 <do_wait.part.7+0x60>
c0009400:	01572023          	sw	s5,0(a4)
c0009404:	0b272423          	sw	s2,168(a4)
c0009408:	0c0010ef          	jal	ra,c000a4c8 <schedule>
c000940c:	00091797          	auipc	a5,0x91
c0009410:	3a07a783          	lw	a5,928(a5) # c009a7ac <current>
c0009414:	05c7a783          	lw	a5,92(a5)
c0009418:	0017f793          	andi	a5,a5,1
c000941c:	e80788e3          	beqz	a5,c00092ac <do_wait.part.7+0x38>
c0009420:	ff700513          	li	a0,-9
c0009424:	c29ff0ef          	jal	ra,c000904c <do_exit>
c0009428:	999f70ef          	jal	ra,c0000dc0 <intr_disable>
c000942c:	00100613          	li	a2,1
c0009430:	ed9ff06f          	j	c0009308 <do_wait.part.7+0x94>
c0009434:	985f70ef          	jal	ra,c0000db8 <intr_enable>
c0009438:	f25ff06f          	j	c000935c <do_wait.part.7+0xe8>
c000943c:	ffe00513          	li	a0,-2
c0009440:	f75ff06f          	j	c00093b4 <do_wait.part.7+0x140>
c0009444:	01442703          	lw	a4,20(s0)
c0009448:	0af72623          	sw	a5,172(a4)
c000944c:	ef9ff06f          	j	c0009344 <do_wait.part.7+0xd0>
c0009450:	0000b617          	auipc	a2,0xb
c0009454:	75460613          	addi	a2,a2,1876 # c0014ba4 <commands+0xeec>
c0009458:	07000593          	li	a1,112
c000945c:	0000b517          	auipc	a0,0xb
c0009460:	4b850513          	addi	a0,a0,1208 # c0014914 <commands+0xc5c>
c0009464:	e61f60ef          	jal	ra,c00002c4 <__panic>
c0009468:	0000d617          	auipc	a2,0xd
c000946c:	c4460613          	addi	a2,a2,-956 # c00160ac <default_pmm_manager+0xdbc>
c0009470:	3a800593          	li	a1,936
c0009474:	0000d517          	auipc	a0,0xd
c0009478:	e9050513          	addi	a0,a0,-368 # c0016304 <default_pmm_manager+0x1014>
c000947c:	e49f60ef          	jal	ra,c00002c4 <__panic>
c0009480:	0000b617          	auipc	a2,0xb
c0009484:	47460613          	addi	a2,a2,1140 # c00148f4 <commands+0xc3c>
c0009488:	06900593          	li	a1,105
c000948c:	0000b517          	auipc	a0,0xb
c0009490:	48850513          	addi	a0,a0,1160 # c0014914 <commands+0xc5c>
c0009494:	e31f60ef          	jal	ra,c00002c4 <__panic>

c0009498 <init_main>:
c0009498:	ff010113          	addi	sp,sp,-16
c000949c:	0000d517          	auipc	a0,0xd
c00094a0:	c2c50513          	addi	a0,a0,-980 # c00160c8 <default_pmm_manager+0xdd8>
c00094a4:	00112623          	sw	ra,12(sp)
c00094a8:	370060ef          	jal	ra,c000f818 <vfs_set_bootfs>
c00094ac:	0e051663          	bnez	a0,c0009598 <init_main+0x100>
c00094b0:	d74fb0ef          	jal	ra,c0004a24 <nr_free_pages>
c00094b4:	931f90ef          	jal	ra,c0002de4 <kallocated>
c00094b8:	00000613          	li	a2,0
c00094bc:	00000593          	li	a1,0
c00094c0:	fffff517          	auipc	a0,0xfffff
c00094c4:	1c850513          	addi	a0,a0,456 # c0008688 <user_main>
c00094c8:	b09ff0ef          	jal	ra,c0008fd0 <kernel_thread>
c00094cc:	00a04663          	bgtz	a0,c00094d8 <init_main+0x40>
c00094d0:	0b00006f          	j	c0009580 <init_main+0xe8>
c00094d4:	7f5000ef          	jal	ra,c000a4c8 <schedule>
c00094d8:	00000593          	li	a1,0
c00094dc:	00000513          	li	a0,0
c00094e0:	d95ff0ef          	jal	ra,c0009274 <do_wait.part.7>
c00094e4:	fe0508e3          	beqz	a0,c00094d4 <init_main+0x3c>
c00094e8:	d69fe0ef          	jal	ra,c0008250 <fs_cleanup>
c00094ec:	0000d517          	auipc	a0,0xd
c00094f0:	c0050513          	addi	a0,a0,-1024 # c00160ec <default_pmm_manager+0xdfc>
c00094f4:	c55f60ef          	jal	ra,c0000148 <cprintf>
c00094f8:	00091797          	auipc	a5,0x91
c00094fc:	2bc7a783          	lw	a5,700(a5) # c009a7b4 <initproc>
c0009500:	0ac7a703          	lw	a4,172(a5)
c0009504:	04071e63          	bnez	a4,c0009560 <init_main+0xc8>
c0009508:	0b07a703          	lw	a4,176(a5)
c000950c:	04071a63          	bnez	a4,c0009560 <init_main+0xc8>
c0009510:	0b47a703          	lw	a4,180(a5)
c0009514:	04071663          	bnez	a4,c0009560 <init_main+0xc8>
c0009518:	00091697          	auipc	a3,0x91
c000951c:	2a06a683          	lw	a3,672(a3) # c009a7b8 <nr_process>
c0009520:	00200713          	li	a4,2
c0009524:	0ce69863          	bne	a3,a4,c00095f4 <init_main+0x15c>
c0009528:	00091717          	auipc	a4,0x91
c000952c:	39072703          	lw	a4,912(a4) # c009a8b8 <proc_list+0x4>
c0009530:	09478793          	addi	a5,a5,148
c0009534:	0af71063          	bne	a4,a5,c00095d4 <init_main+0x13c>
c0009538:	00091797          	auipc	a5,0x91
c000953c:	37c7a783          	lw	a5,892(a5) # c009a8b4 <proc_list>
c0009540:	06f71a63          	bne	a4,a5,c00095b4 <init_main+0x11c>
c0009544:	0000d517          	auipc	a0,0xd
c0009548:	c8850513          	addi	a0,a0,-888 # c00161cc <default_pmm_manager+0xedc>
c000954c:	bfdf60ef          	jal	ra,c0000148 <cprintf>
c0009550:	00c12083          	lw	ra,12(sp)
c0009554:	00000513          	li	a0,0
c0009558:	01010113          	addi	sp,sp,16
c000955c:	00008067          	ret
c0009560:	0000d697          	auipc	a3,0xd
c0009564:	bb068693          	addi	a3,a3,-1104 # c0016110 <default_pmm_manager+0xe20>
c0009568:	0000b617          	auipc	a2,0xb
c000956c:	8b460613          	addi	a2,a2,-1868 # c0013e1c <commands+0x164>
c0009570:	41500593          	li	a1,1045
c0009574:	0000d517          	auipc	a0,0xd
c0009578:	d9050513          	addi	a0,a0,-624 # c0016304 <default_pmm_manager+0x1014>
c000957c:	d49f60ef          	jal	ra,c00002c4 <__panic>
c0009580:	0000d617          	auipc	a2,0xd
c0009584:	c6860613          	addi	a2,a2,-920 # c00161e8 <default_pmm_manager+0xef8>
c0009588:	40900593          	li	a1,1033
c000958c:	0000d517          	auipc	a0,0xd
c0009590:	d7850513          	addi	a0,a0,-648 # c0016304 <default_pmm_manager+0x1014>
c0009594:	d31f60ef          	jal	ra,c00002c4 <__panic>
c0009598:	00050693          	mv	a3,a0
c000959c:	0000d617          	auipc	a2,0xd
c00095a0:	b3460613          	addi	a2,a2,-1228 # c00160d0 <default_pmm_manager+0xde0>
c00095a4:	40100593          	li	a1,1025
c00095a8:	0000d517          	auipc	a0,0xd
c00095ac:	d5c50513          	addi	a0,a0,-676 # c0016304 <default_pmm_manager+0x1014>
c00095b0:	d15f60ef          	jal	ra,c00002c4 <__panic>
c00095b4:	0000d697          	auipc	a3,0xd
c00095b8:	be868693          	addi	a3,a3,-1048 # c001619c <default_pmm_manager+0xeac>
c00095bc:	0000b617          	auipc	a2,0xb
c00095c0:	86060613          	addi	a2,a2,-1952 # c0013e1c <commands+0x164>
c00095c4:	41800593          	li	a1,1048
c00095c8:	0000d517          	auipc	a0,0xd
c00095cc:	d3c50513          	addi	a0,a0,-708 # c0016304 <default_pmm_manager+0x1014>
c00095d0:	cf5f60ef          	jal	ra,c00002c4 <__panic>
c00095d4:	0000d697          	auipc	a3,0xd
c00095d8:	b9868693          	addi	a3,a3,-1128 # c001616c <default_pmm_manager+0xe7c>
c00095dc:	0000b617          	auipc	a2,0xb
c00095e0:	84060613          	addi	a2,a2,-1984 # c0013e1c <commands+0x164>
c00095e4:	41700593          	li	a1,1047
c00095e8:	0000d517          	auipc	a0,0xd
c00095ec:	d1c50513          	addi	a0,a0,-740 # c0016304 <default_pmm_manager+0x1014>
c00095f0:	cd5f60ef          	jal	ra,c00002c4 <__panic>
c00095f4:	0000d697          	auipc	a3,0xd
c00095f8:	b6868693          	addi	a3,a3,-1176 # c001615c <default_pmm_manager+0xe6c>
c00095fc:	0000b617          	auipc	a2,0xb
c0009600:	82060613          	addi	a2,a2,-2016 # c0013e1c <commands+0x164>
c0009604:	41600593          	li	a1,1046
c0009608:	0000d517          	auipc	a0,0xd
c000960c:	cfc50513          	addi	a0,a0,-772 # c0016304 <default_pmm_manager+0x1014>
c0009610:	cb5f60ef          	jal	ra,c00002c4 <__panic>

c0009614 <do_execve>:
c0009614:	e9010113          	addi	sp,sp,-368
c0009618:	15812423          	sw	s8,328(sp)
c000961c:	00091697          	auipc	a3,0x91
c0009620:	1906a683          	lw	a3,400(a3) # c009a7ac <current>
c0009624:	16112623          	sw	ra,364(sp)
c0009628:	16812423          	sw	s0,360(sp)
c000962c:	16912223          	sw	s1,356(sp)
c0009630:	17212023          	sw	s2,352(sp)
c0009634:	15312e23          	sw	s3,348(sp)
c0009638:	15412c23          	sw	s4,344(sp)
c000963c:	15512a23          	sw	s5,340(sp)
c0009640:	15612823          	sw	s6,336(sp)
c0009644:	15712623          	sw	s7,332(sp)
c0009648:	15912223          	sw	s9,324(sp)
c000964c:	15a12023          	sw	s10,320(sp)
c0009650:	13b12e23          	sw	s11,316(sp)
c0009654:	fff58713          	addi	a4,a1,-1
c0009658:	01f00793          	li	a5,31
c000965c:	0186ac03          	lw	s8,24(a3)
c0009660:	24e7e263          	bltu	a5,a4,c00098a4 <do_execve+0x290>
c0009664:	00060d93          	mv	s11,a2
c0009668:	00050413          	mv	s0,a0
c000966c:	00058913          	mv	s2,a1
c0009670:	03300613          	li	a2,51
c0009674:	00000593          	li	a1,0
c0009678:	04810513          	addi	a0,sp,72
c000967c:	53d090ef          	jal	ra,c00133b8 <memset>
c0009680:	020c0063          	beqz	s8,c00096a0 <do_execve+0x8c>
c0009684:	01cc0513          	addi	a0,s8,28
c0009688:	b78fd0ef          	jal	ra,c0006a00 <down>
c000968c:	00091797          	auipc	a5,0x91
c0009690:	1207a783          	lw	a5,288(a5) # c009a7ac <current>
c0009694:	00078663          	beqz	a5,c00096a0 <do_execve+0x8c>
c0009698:	0047a783          	lw	a5,4(a5)
c000969c:	02fc2423          	sw	a5,40(s8)
c00096a0:	2a040063          	beqz	s0,c0009940 <do_execve+0x32c>
c00096a4:	03300693          	li	a3,51
c00096a8:	00040613          	mv	a2,s0
c00096ac:	04810593          	addi	a1,sp,72
c00096b0:	000c0513          	mv	a0,s8
c00096b4:	e55f80ef          	jal	ra,c0002508 <copy_string>
c00096b8:	18050c63          	beqz	a0,c0009850 <do_execve+0x23c>
c00096bc:	00291493          	slli	s1,s2,0x2
c00096c0:	00000693          	li	a3,0
c00096c4:	00048613          	mv	a2,s1
c00096c8:	000d8593          	mv	a1,s11
c00096cc:	000c0513          	mv	a0,s8
c00096d0:	ca5f80ef          	jal	ra,c0002374 <user_mem_check>
c00096d4:	4e050863          	beqz	a0,c0009bc4 <do_execve+0x5b0>
c00096d8:	0b010993          	addi	s3,sp,176
c00096dc:	01312423          	sw	s3,8(sp)
c00096e0:	000d8b13          	mv	s6,s11
c00096e4:	00098b93          	mv	s7,s3
c00096e8:	00000413          	li	s0,0
c00096ec:	00001cb7          	lui	s9,0x1
c00096f0:	000c8513          	mv	a0,s9
c00096f4:	ef8f90ef          	jal	ra,c0002dec <kmalloc>
c00096f8:	00050a13          	mv	s4,a0
c00096fc:	20050063          	beqz	a0,c00098fc <do_execve+0x2e8>
c0009700:	000b2603          	lw	a2,0(s6)
c0009704:	00050593          	mv	a1,a0
c0009708:	000c8693          	mv	a3,s9
c000970c:	000c0513          	mv	a0,s8
c0009710:	df9f80ef          	jal	ra,c0002508 <copy_string>
c0009714:	20050e63          	beqz	a0,c0009930 <do_execve+0x31c>
c0009718:	014ba023          	sw	s4,0(s7) # 80000 <_binary_bin_sfs_img_size+0xad00>
c000971c:	00140413          	addi	s0,s0,1
c0009720:	004b8b93          	addi	s7,s7,4
c0009724:	004b0b13          	addi	s6,s6,4
c0009728:	fc8914e3          	bne	s2,s0,c00096f0 <do_execve+0xdc>
c000972c:	000daa03          	lw	s4,0(s11)
c0009730:	160c0e63          	beqz	s8,c00098ac <do_execve+0x298>
c0009734:	01cc0513          	addi	a0,s8,28
c0009738:	ac4fd0ef          	jal	ra,c00069fc <up>
c000973c:	00091797          	auipc	a5,0x91
c0009740:	0707a783          	lw	a5,112(a5) # c009a7ac <current>
c0009744:	0dc7a503          	lw	a0,220(a5)
c0009748:	020c2423          	sw	zero,40(s8)
c000974c:	c39fe0ef          	jal	ra,c0008384 <files_closeall>
c0009750:	00000593          	li	a1,0
c0009754:	000a0513          	mv	a0,s4
c0009758:	bd4fd0ef          	jal	ra,c0006b2c <sysfile_open>
c000975c:	00050b13          	mv	s6,a0
c0009760:	040540e3          	bltz	a0,c0009fa0 <do_execve+0x98c>
c0009764:	00091797          	auipc	a5,0x91
c0009768:	1487a783          	lw	a5,328(a5) # c009a8ac <boot_cr3>
c000976c:	00c7d793          	srli	a5,a5,0xc
c0009770:	18079073          	csrw	sptbr,a5
c0009774:	018c2783          	lw	a5,24(s8)
c0009778:	fff78793          	addi	a5,a5,-1
c000977c:	00fc2c23          	sw	a5,24(s8)
c0009780:	1e078663          	beqz	a5,c000996c <do_execve+0x358>
c0009784:	00091797          	auipc	a5,0x91
c0009788:	0287a783          	lw	a5,40(a5) # c009a7ac <current>
c000978c:	0007ac23          	sw	zero,24(a5)
c0009790:	fbdf70ef          	jal	ra,c000174c <mm_create>
c0009794:	00050a13          	mv	s4,a0
c0009798:	56050a63          	beqz	a0,c0009d0c <do_execve+0x6f8>
c000979c:	00c50513          	addi	a0,a0,12
c00097a0:	820ff0ef          	jal	ra,c00087c0 <setup_pgdir.isra.4>
c00097a4:	1c051063          	bnez	a0,c0009964 <do_execve+0x350>
c00097a8:	00000693          	li	a3,0
c00097ac:	03400613          	li	a2,52
c00097b0:	07c10593          	addi	a1,sp,124
c00097b4:	000b0513          	mv	a0,s6
c00097b8:	f71fe0ef          	jal	ra,c0008728 <load_icode_read>
c00097bc:	00050d13          	mv	s10,a0
c00097c0:	00051c63          	bnez	a0,c00097d8 <do_execve+0x1c4>
c00097c4:	07c12703          	lw	a4,124(sp)
c00097c8:	464c47b7          	lui	a5,0x464c4
c00097cc:	57f78793          	addi	a5,a5,1407 # 464c457f <_binary_bin_sfs_img_size+0x4644f27f>
c00097d0:	ff800d13          	li	s10,-8
c00097d4:	1ef70c63          	beq	a4,a5,c00099cc <do_execve+0x3b8>
c00097d8:	00ca2683          	lw	a3,12(s4)
c00097dc:	c00007b7          	lui	a5,0xc0000
c00097e0:	78f6e663          	bltu	a3,a5,c0009f6c <do_execve+0x958>
c00097e4:	00091797          	auipc	a5,0x91
c00097e8:	0c47a783          	lw	a5,196(a5) # c009a8a8 <va_pa_offset>
c00097ec:	40f687b3          	sub	a5,a3,a5
c00097f0:	00c7d793          	srli	a5,a5,0xc
c00097f4:	00091717          	auipc	a4,0x91
c00097f8:	fb072703          	lw	a4,-80(a4) # c009a7a4 <npage>
c00097fc:	74e7fc63          	bleu	a4,a5,c0009f54 <do_execve+0x940>
c0009800:	0008e717          	auipc	a4,0x8e
c0009804:	84472703          	lw	a4,-1980(a4) # c0097044 <nbase>
c0009808:	40e787b3          	sub	a5,a5,a4
c000980c:	00579793          	slli	a5,a5,0x5
c0009810:	00091517          	auipc	a0,0x91
c0009814:	0a052503          	lw	a0,160(a0) # c009a8b0 <pages>
c0009818:	00100593          	li	a1,1
c000981c:	00f50533          	add	a0,a0,a5
c0009820:	9a0fb0ef          	jal	ra,c00049c0 <free_pages>
c0009824:	000a0513          	mv	a0,s4
c0009828:	940f80ef          	jal	ra,c0001968 <mm_destroy>
c000982c:	ffc48493          	addi	s1,s1,-4
c0009830:	009989b3          	add	s3,s3,s1
c0009834:	0009a503          	lw	a0,0(s3)
c0009838:	fff40413          	addi	s0,s0,-1
c000983c:	ffc98993          	addi	s3,s3,-4
c0009840:	eccf90ef          	jal	ra,c0002f0c <kfree>
c0009844:	fe0418e3          	bnez	s0,c0009834 <do_execve+0x220>
c0009848:	000d0513          	mv	a0,s10
c000984c:	801ff0ef          	jal	ra,c000904c <do_exit>
c0009850:	040c0a63          	beqz	s8,c00098a4 <do_execve+0x290>
c0009854:	01cc0513          	addi	a0,s8,28
c0009858:	9a4fd0ef          	jal	ra,c00069fc <up>
c000985c:	ffd00493          	li	s1,-3
c0009860:	020c2423          	sw	zero,40(s8)
c0009864:	16c12083          	lw	ra,364(sp)
c0009868:	00048513          	mv	a0,s1
c000986c:	16812403          	lw	s0,360(sp)
c0009870:	16412483          	lw	s1,356(sp)
c0009874:	16012903          	lw	s2,352(sp)
c0009878:	15c12983          	lw	s3,348(sp)
c000987c:	15812a03          	lw	s4,344(sp)
c0009880:	15412a83          	lw	s5,340(sp)
c0009884:	15012b03          	lw	s6,336(sp)
c0009888:	14c12b83          	lw	s7,332(sp)
c000988c:	14812c03          	lw	s8,328(sp)
c0009890:	14412c83          	lw	s9,324(sp)
c0009894:	14012d03          	lw	s10,320(sp)
c0009898:	13c12d83          	lw	s11,316(sp)
c000989c:	17010113          	addi	sp,sp,368
c00098a0:	00008067          	ret
c00098a4:	ffd00493          	li	s1,-3
c00098a8:	fbdff06f          	j	c0009864 <do_execve+0x250>
c00098ac:	00091797          	auipc	a5,0x91
c00098b0:	f007a783          	lw	a5,-256(a5) # c009a7ac <current>
c00098b4:	0dc7a503          	lw	a0,220(a5)
c00098b8:	acdfe0ef          	jal	ra,c0008384 <files_closeall>
c00098bc:	00000593          	li	a1,0
c00098c0:	000a0513          	mv	a0,s4
c00098c4:	a68fd0ef          	jal	ra,c0006b2c <sysfile_open>
c00098c8:	00050d13          	mv	s10,a0
c00098cc:	f60540e3          	bltz	a0,c000982c <do_execve+0x218>
c00098d0:	00091797          	auipc	a5,0x91
c00098d4:	edc7a783          	lw	a5,-292(a5) # c009a7ac <current>
c00098d8:	0187a783          	lw	a5,24(a5)
c00098dc:	000d0b13          	mv	s6,s10
c00098e0:	ea0788e3          	beqz	a5,c0009790 <do_execve+0x17c>
c00098e4:	0000c617          	auipc	a2,0xc
c00098e8:	5e460613          	addi	a2,a2,1508 # c0015ec8 <default_pmm_manager+0xbd8>
c00098ec:	27400593          	li	a1,628
c00098f0:	0000d517          	auipc	a0,0xd
c00098f4:	a1450513          	addi	a0,a0,-1516 # c0016304 <default_pmm_manager+0x1014>
c00098f8:	9cdf60ef          	jal	ra,c00002c4 <__panic>
c00098fc:	ffc00493          	li	s1,-4
c0009900:	00040e63          	beqz	s0,c000991c <do_execve+0x308>
c0009904:	00241413          	slli	s0,s0,0x2
c0009908:	00898433          	add	s0,s3,s0
c000990c:	ffc42503          	lw	a0,-4(s0)
c0009910:	ffc40413          	addi	s0,s0,-4
c0009914:	df8f90ef          	jal	ra,c0002f0c <kfree>
c0009918:	fe899ae3          	bne	s3,s0,c000990c <do_execve+0x2f8>
c000991c:	f40c04e3          	beqz	s8,c0009864 <do_execve+0x250>
c0009920:	01cc0513          	addi	a0,s8,28
c0009924:	8d8fd0ef          	jal	ra,c00069fc <up>
c0009928:	020c2423          	sw	zero,40(s8)
c000992c:	f39ff06f          	j	c0009864 <do_execve+0x250>
c0009930:	000a0513          	mv	a0,s4
c0009934:	dd8f90ef          	jal	ra,c0002f0c <kfree>
c0009938:	ffd00493          	li	s1,-3
c000993c:	fc5ff06f          	j	c0009900 <do_execve+0x2ec>
c0009940:	00091797          	auipc	a5,0x91
c0009944:	e6c7a783          	lw	a5,-404(a5) # c009a7ac <current>
c0009948:	0047a683          	lw	a3,4(a5)
c000994c:	0000c617          	auipc	a2,0xc
c0009950:	57060613          	addi	a2,a2,1392 # c0015ebc <default_pmm_manager+0xbcc>
c0009954:	03300593          	li	a1,51
c0009958:	04810513          	addi	a0,sp,72
c000995c:	1c40a0ef          	jal	ra,c0013b20 <snprintf>
c0009960:	d5dff06f          	j	c00096bc <do_execve+0xa8>
c0009964:	ffc00d13          	li	s10,-4
c0009968:	ebdff06f          	j	c0009824 <do_execve+0x210>
c000996c:	000c0513          	mv	a0,s8
c0009970:	a58f80ef          	jal	ra,c0001bc8 <exit_mmap>
c0009974:	00cc2683          	lw	a3,12(s8)
c0009978:	c00007b7          	lui	a5,0xc0000
c000997c:	5ef6e863          	bltu	a3,a5,c0009f6c <do_execve+0x958>
c0009980:	00091797          	auipc	a5,0x91
c0009984:	f287a783          	lw	a5,-216(a5) # c009a8a8 <va_pa_offset>
c0009988:	40f687b3          	sub	a5,a3,a5
c000998c:	00c7d793          	srli	a5,a5,0xc
c0009990:	00091717          	auipc	a4,0x91
c0009994:	e1472703          	lw	a4,-492(a4) # c009a7a4 <npage>
c0009998:	5ae7fe63          	bleu	a4,a5,c0009f54 <do_execve+0x940>
c000999c:	0008d717          	auipc	a4,0x8d
c00099a0:	6a872703          	lw	a4,1704(a4) # c0097044 <nbase>
c00099a4:	40e787b3          	sub	a5,a5,a4
c00099a8:	00579793          	slli	a5,a5,0x5
c00099ac:	00091517          	auipc	a0,0x91
c00099b0:	f0452503          	lw	a0,-252(a0) # c009a8b0 <pages>
c00099b4:	00f50533          	add	a0,a0,a5
c00099b8:	00100593          	li	a1,1
c00099bc:	804fb0ef          	jal	ra,c00049c0 <free_pages>
c00099c0:	000c0513          	mv	a0,s8
c00099c4:	fa5f70ef          	jal	ra,c0001968 <mm_destroy>
c00099c8:	dbdff06f          	j	c0009784 <do_execve+0x170>
c00099cc:	0a815783          	lhu	a5,168(sp)
c00099d0:	00012a23          	sw	zero,20(sp)
c00099d4:	06078863          	beqz	a5,c0009a44 <do_execve+0x430>
c00099d8:	0008d797          	auipc	a5,0x8d
c00099dc:	66c7a783          	lw	a5,1644(a5) # c0097044 <nbase>
c00099e0:	00078713          	mv	a4,a5
c00099e4:	00f12c23          	sw	a5,24(sp)
c00099e8:	001007b7          	lui	a5,0x100
c00099ec:	fff78793          	addi	a5,a5,-1 # fffff <_binary_bin_sfs_img_size+0x8acff>
c00099f0:	00f12623          	sw	a5,12(sp)
c00099f4:	00e12e23          	sw	a4,28(sp)
c00099f8:	00e12823          	sw	a4,16(sp)
c00099fc:	01412783          	lw	a5,20(sp)
c0009a00:	09812683          	lw	a3,152(sp)
c0009a04:	02000613          	li	a2,32
c0009a08:	00579793          	slli	a5,a5,0x5
c0009a0c:	00d786b3          	add	a3,a5,a3
c0009a10:	02810593          	addi	a1,sp,40
c0009a14:	000b0513          	mv	a0,s6
c0009a18:	d11fe0ef          	jal	ra,c0008728 <load_icode_read>
c0009a1c:	00050d13          	mv	s10,a0
c0009a20:	04051663          	bnez	a0,c0009a6c <do_execve+0x458>
c0009a24:	02812703          	lw	a4,40(sp)
c0009a28:	00100793          	li	a5,1
c0009a2c:	04f70663          	beq	a4,a5,c0009a78 <do_execve+0x464>
c0009a30:	01412703          	lw	a4,20(sp)
c0009a34:	0a815783          	lhu	a5,168(sp)
c0009a38:	00170713          	addi	a4,a4,1
c0009a3c:	00e12a23          	sw	a4,20(sp)
c0009a40:	faf76ee3          	bltu	a4,a5,c00099fc <do_execve+0x3e8>
c0009a44:	000b0513          	mv	a0,s6
c0009a48:	93cfd0ef          	jal	ra,c0006b84 <sysfile_close>
c0009a4c:	00000713          	li	a4,0
c0009a50:	00b00693          	li	a3,11
c0009a54:	00100637          	lui	a2,0x100
c0009a58:	aff005b7          	lui	a1,0xaff00
c0009a5c:	000a0513          	mv	a0,s4
c0009a60:	f7df70ef          	jal	ra,c00019dc <mm_map>
c0009a64:	00050d13          	mv	s10,a0
c0009a68:	2c050263          	beqz	a0,c0009d2c <do_execve+0x718>
c0009a6c:	000a0513          	mv	a0,s4
c0009a70:	958f80ef          	jal	ra,c0001bc8 <exit_mmap>
c0009a74:	d65ff06f          	j	c00097d8 <do_execve+0x1c4>
c0009a78:	03c12603          	lw	a2,60(sp)
c0009a7c:	03812783          	lw	a5,56(sp)
c0009a80:	2af66263          	bltu	a2,a5,c0009d24 <do_execve+0x710>
c0009a84:	04012783          	lw	a5,64(sp)
c0009a88:	0017f693          	andi	a3,a5,1
c0009a8c:	0027f713          	andi	a4,a5,2
c0009a90:	00269693          	slli	a3,a3,0x2
c0009a94:	00070463          	beqz	a4,c0009a9c <do_execve+0x488>
c0009a98:	0026e693          	ori	a3,a3,2
c0009a9c:	0047f793          	andi	a5,a5,4
c0009aa0:	00078463          	beqz	a5,c0009aa8 <do_execve+0x494>
c0009aa4:	0016e693          	ori	a3,a3,1
c0009aa8:	01300713          	li	a4,19
c0009aac:	0016f793          	andi	a5,a3,1
c0009ab0:	00e12223          	sw	a4,4(sp)
c0009ab4:	00079663          	bnez	a5,c0009ac0 <do_execve+0x4ac>
c0009ab8:	01100793          	li	a5,17
c0009abc:	00f12223          	sw	a5,4(sp)
c0009ac0:	0026f793          	andi	a5,a3,2
c0009ac4:	00078663          	beqz	a5,c0009ad0 <do_execve+0x4bc>
c0009ac8:	01700793          	li	a5,23
c0009acc:	00f12223          	sw	a5,4(sp)
c0009ad0:	0046f793          	andi	a5,a3,4
c0009ad4:	00078863          	beqz	a5,c0009ae4 <do_execve+0x4d0>
c0009ad8:	00412783          	lw	a5,4(sp)
c0009adc:	0087e793          	ori	a5,a5,8
c0009ae0:	00f12223          	sw	a5,4(sp)
c0009ae4:	03012583          	lw	a1,48(sp)
c0009ae8:	00000713          	li	a4,0
c0009aec:	000a0513          	mv	a0,s4
c0009af0:	eedf70ef          	jal	ra,c00019dc <mm_map>
c0009af4:	00050d13          	mv	s10,a0
c0009af8:	f6051ae3          	bnez	a0,c0009a6c <do_execve+0x458>
c0009afc:	03012d83          	lw	s11,48(sp)
c0009b00:	03812c03          	lw	s8,56(sp)
c0009b04:	fffff7b7          	lui	a5,0xfffff
c0009b08:	02c12b83          	lw	s7,44(sp)
c0009b0c:	018d8c33          	add	s8,s11,s8
c0009b10:	00fdfcb3          	and	s9,s11,a5
c0009b14:	098de863          	bltu	s11,s8,c0009ba4 <do_execve+0x590>
c0009b18:	2040006f          	j	c0009d1c <do_execve+0x708>
c0009b1c:	000017b7          	lui	a5,0x1
c0009b20:	419d8533          	sub	a0,s11,s9
c0009b24:	00fc8cb3          	add	s9,s9,a5
c0009b28:	40a78733          	sub	a4,a5,a0
c0009b2c:	019c7663          	bleu	s9,s8,c0009b38 <do_execve+0x524>
c0009b30:	41970733          	sub	a4,a4,s9
c0009b34:	00ec0733          	add	a4,s8,a4
c0009b38:	01012783          	lw	a5,16(sp)
c0009b3c:	00091697          	auipc	a3,0x91
c0009b40:	d746a683          	lw	a3,-652(a3) # c009a8b0 <pages>
c0009b44:	40da86b3          	sub	a3,s5,a3
c0009b48:	4056d693          	srai	a3,a3,0x5
c0009b4c:	00f686b3          	add	a3,a3,a5
c0009b50:	00c12783          	lw	a5,12(sp)
c0009b54:	00091617          	auipc	a2,0x91
c0009b58:	c5062603          	lw	a2,-944(a2) # c009a7a4 <npage>
c0009b5c:	00f6f5b3          	and	a1,a3,a5
c0009b60:	00c69693          	slli	a3,a3,0xc
c0009b64:	42c5f263          	bleu	a2,a1,c0009f88 <do_execve+0x974>
c0009b68:	00091597          	auipc	a1,0x91
c0009b6c:	d405a583          	lw	a1,-704(a1) # c009a8a8 <va_pa_offset>
c0009b70:	00b685b3          	add	a1,a3,a1
c0009b74:	00a585b3          	add	a1,a1,a0
c0009b78:	000b8693          	mv	a3,s7
c0009b7c:	00070613          	mv	a2,a4
c0009b80:	000b0513          	mv	a0,s6
c0009b84:	00e12023          	sw	a4,0(sp)
c0009b88:	ba1fe0ef          	jal	ra,c0008728 <load_icode_read>
c0009b8c:	00050d13          	mv	s10,a0
c0009b90:	ec051ee3          	bnez	a0,c0009a6c <do_execve+0x458>
c0009b94:	00012703          	lw	a4,0(sp)
c0009b98:	00ed8db3          	add	s11,s11,a4
c0009b9c:	00eb8bb3          	add	s7,s7,a4
c0009ba0:	038df663          	bleu	s8,s11,c0009bcc <do_execve+0x5b8>
c0009ba4:	00ca2503          	lw	a0,12(s4)
c0009ba8:	00412603          	lw	a2,4(sp)
c0009bac:	000c8593          	mv	a1,s9
c0009bb0:	8f1fb0ef          	jal	ra,c00054a0 <pgdir_alloc_page>
c0009bb4:	00050a93          	mv	s5,a0
c0009bb8:	f60512e3          	bnez	a0,c0009b1c <do_execve+0x508>
c0009bbc:	ffc00d13          	li	s10,-4
c0009bc0:	eadff06f          	j	c0009a6c <do_execve+0x458>
c0009bc4:	ffd00493          	li	s1,-3
c0009bc8:	d55ff06f          	j	c000991c <do_execve+0x308>
c0009bcc:	03012b83          	lw	s7,48(sp)
c0009bd0:	03c12703          	lw	a4,60(sp)
c0009bd4:	00eb8bb3          	add	s7,s7,a4
c0009bd8:	0b9df063          	bleu	s9,s11,c0009c78 <do_execve+0x664>
c0009bdc:	e5bb8ae3          	beq	s7,s11,c0009a30 <do_execve+0x41c>
c0009be0:	419d8c33          	sub	s8,s11,s9
c0009be4:	00001537          	lui	a0,0x1
c0009be8:	00ac0533          	add	a0,s8,a0
c0009bec:	139bf463          	bleu	s9,s7,c0009d14 <do_execve+0x700>
c0009bf0:	419b8733          	sub	a4,s7,s9
c0009bf4:	41870c33          	sub	s8,a4,s8
c0009bf8:	01c12783          	lw	a5,28(sp)
c0009bfc:	00091697          	auipc	a3,0x91
c0009c00:	cb46a683          	lw	a3,-844(a3) # c009a8b0 <pages>
c0009c04:	40da86b3          	sub	a3,s5,a3
c0009c08:	4056d693          	srai	a3,a3,0x5
c0009c0c:	00f686b3          	add	a3,a3,a5
c0009c10:	00c12783          	lw	a5,12(sp)
c0009c14:	00091717          	auipc	a4,0x91
c0009c18:	b9072703          	lw	a4,-1136(a4) # c009a7a4 <npage>
c0009c1c:	00f6f633          	and	a2,a3,a5
c0009c20:	00c69693          	slli	a3,a3,0xc
c0009c24:	36e67263          	bleu	a4,a2,c0009f88 <do_execve+0x974>
c0009c28:	00091717          	auipc	a4,0x91
c0009c2c:	c8072703          	lw	a4,-896(a4) # c009a8a8 <va_pa_offset>
c0009c30:	00e686b3          	add	a3,a3,a4
c0009c34:	000c0613          	mv	a2,s8
c0009c38:	00000593          	li	a1,0
c0009c3c:	00a68533          	add	a0,a3,a0
c0009c40:	778090ef          	jal	ra,c00133b8 <memset>
c0009c44:	01bc0833          	add	a6,s8,s11
c0009c48:	039bf463          	bleu	s9,s7,c0009c70 <do_execve+0x65c>
c0009c4c:	df0b82e3          	beq	s7,a6,c0009a30 <do_execve+0x41c>
c0009c50:	0000c697          	auipc	a3,0xc
c0009c54:	2a068693          	addi	a3,a3,672 # c0015ef0 <default_pmm_manager+0xc00>
c0009c58:	0000a617          	auipc	a2,0xa
c0009c5c:	1c460613          	addi	a2,a2,452 # c0013e1c <commands+0x164>
c0009c60:	2cb00593          	li	a1,715
c0009c64:	0000c517          	auipc	a0,0xc
c0009c68:	6a050513          	addi	a0,a0,1696 # c0016304 <default_pmm_manager+0x1014>
c0009c6c:	e58f60ef          	jal	ra,c00002c4 <__panic>
c0009c70:	ff9810e3          	bne	a6,s9,c0009c50 <do_execve+0x63c>
c0009c74:	000c8d93          	mv	s11,s9
c0009c78:	00001c37          	lui	s8,0x1
c0009c7c:	077de863          	bltu	s11,s7,c0009cec <do_execve+0x6d8>
c0009c80:	db1ff06f          	j	c0009a30 <do_execve+0x41c>
c0009c84:	419d8533          	sub	a0,s11,s9
c0009c88:	018c8cb3          	add	s9,s9,s8
c0009c8c:	40ac0633          	sub	a2,s8,a0
c0009c90:	019bf663          	bleu	s9,s7,c0009c9c <do_execve+0x688>
c0009c94:	41960633          	sub	a2,a2,s9
c0009c98:	01760633          	add	a2,a2,s7
c0009c9c:	01812783          	lw	a5,24(sp)
c0009ca0:	00091717          	auipc	a4,0x91
c0009ca4:	c1072703          	lw	a4,-1008(a4) # c009a8b0 <pages>
c0009ca8:	40ea8733          	sub	a4,s5,a4
c0009cac:	40575713          	srai	a4,a4,0x5
c0009cb0:	00f70733          	add	a4,a4,a5
c0009cb4:	00c12783          	lw	a5,12(sp)
c0009cb8:	00091697          	auipc	a3,0x91
c0009cbc:	aec6a683          	lw	a3,-1300(a3) # c009a7a4 <npage>
c0009cc0:	00f775b3          	and	a1,a4,a5
c0009cc4:	00c71713          	slli	a4,a4,0xc
c0009cc8:	2ad5fe63          	bleu	a3,a1,c0009f84 <do_execve+0x970>
c0009ccc:	00091697          	auipc	a3,0x91
c0009cd0:	bdc6a683          	lw	a3,-1060(a3) # c009a8a8 <va_pa_offset>
c0009cd4:	00d70733          	add	a4,a4,a3
c0009cd8:	00cd8db3          	add	s11,s11,a2
c0009cdc:	00000593          	li	a1,0
c0009ce0:	00a70533          	add	a0,a4,a0
c0009ce4:	6d4090ef          	jal	ra,c00133b8 <memset>
c0009ce8:	d57df4e3          	bleu	s7,s11,c0009a30 <do_execve+0x41c>
c0009cec:	00ca2503          	lw	a0,12(s4)
c0009cf0:	00412603          	lw	a2,4(sp)
c0009cf4:	000c8593          	mv	a1,s9
c0009cf8:	fa8fb0ef          	jal	ra,c00054a0 <pgdir_alloc_page>
c0009cfc:	00050a93          	mv	s5,a0
c0009d00:	f80512e3          	bnez	a0,c0009c84 <do_execve+0x670>
c0009d04:	ffc00d13          	li	s10,-4
c0009d08:	d65ff06f          	j	c0009a6c <do_execve+0x458>
c0009d0c:	ffc00d13          	li	s10,-4
c0009d10:	b1dff06f          	j	c000982c <do_execve+0x218>
c0009d14:	41800c33          	neg	s8,s8
c0009d18:	ee1ff06f          	j	c0009bf8 <do_execve+0x5e4>
c0009d1c:	000d8b93          	mv	s7,s11
c0009d20:	eb1ff06f          	j	c0009bd0 <do_execve+0x5bc>
c0009d24:	ff800d13          	li	s10,-8
c0009d28:	d45ff06f          	j	c0009a6c <do_execve+0x458>
c0009d2c:	00ca2503          	lw	a0,12(s4)
c0009d30:	01f00613          	li	a2,31
c0009d34:	affff5b7          	lui	a1,0xaffff
c0009d38:	f68fb0ef          	jal	ra,c00054a0 <pgdir_alloc_page>
c0009d3c:	1e050c63          	beqz	a0,c0009f34 <do_execve+0x920>
c0009d40:	00ca2503          	lw	a0,12(s4)
c0009d44:	01f00613          	li	a2,31
c0009d48:	afffe5b7          	lui	a1,0xafffe
c0009d4c:	f54fb0ef          	jal	ra,c00054a0 <pgdir_alloc_page>
c0009d50:	1c050263          	beqz	a0,c0009f14 <do_execve+0x900>
c0009d54:	00ca2503          	lw	a0,12(s4)
c0009d58:	01f00613          	li	a2,31
c0009d5c:	afffd5b7          	lui	a1,0xafffd
c0009d60:	f40fb0ef          	jal	ra,c00054a0 <pgdir_alloc_page>
c0009d64:	18050863          	beqz	a0,c0009ef4 <do_execve+0x8e0>
c0009d68:	00ca2503          	lw	a0,12(s4)
c0009d6c:	01f00613          	li	a2,31
c0009d70:	afffc5b7          	lui	a1,0xafffc
c0009d74:	f2cfb0ef          	jal	ra,c00054a0 <pgdir_alloc_page>
c0009d78:	14050e63          	beqz	a0,c0009ed4 <do_execve+0x8c0>
c0009d7c:	018a2783          	lw	a5,24(s4)
c0009d80:	00ca2683          	lw	a3,12(s4)
c0009d84:	00091717          	auipc	a4,0x91
c0009d88:	a2872703          	lw	a4,-1496(a4) # c009a7ac <current>
c0009d8c:	00178793          	addi	a5,a5,1 # 1001 <_binary_bin_swap_img_size-0x6cff>
c0009d90:	00fa2c23          	sw	a5,24(s4)
c0009d94:	01472c23          	sw	s4,24(a4)
c0009d98:	c00007b7          	lui	a5,0xc0000
c0009d9c:	12f6e063          	bltu	a3,a5,c0009ebc <do_execve+0x8a8>
c0009da0:	00091797          	auipc	a5,0x91
c0009da4:	b087a783          	lw	a5,-1272(a5) # c009a8a8 <va_pa_offset>
c0009da8:	40f686b3          	sub	a3,a3,a5
c0009dac:	04d72c23          	sw	a3,88(a4)
c0009db0:	00c6d693          	srli	a3,a3,0xc
c0009db4:	18069073          	csrw	sptbr,a3
c0009db8:	00000a13          	li	s4,0
c0009dbc:	00098b13          	mv	s6,s3
c0009dc0:	00000a93          	li	s5,0
c0009dc4:	00001bb7          	lui	s7,0x1
c0009dc8:	000b2503          	lw	a0,0(s6)
c0009dcc:	000b8593          	mv	a1,s7
c0009dd0:	001a8a93          	addi	s5,s5,1
c0009dd4:	528090ef          	jal	ra,c00132fc <strnlen>
c0009dd8:	00150513          	addi	a0,a0,1
c0009ddc:	00aa0a33          	add	s4,s4,a0
c0009de0:	004b0b13          	addi	s6,s6,4
c0009de4:	ff2ae2e3          	bltu	s5,s2,c0009dc8 <do_execve+0x7b4>
c0009de8:	fffa4a93          	not	s5,s4
c0009dec:	ffcafa93          	andi	s5,s5,-4
c0009df0:	b00007b7          	lui	a5,0xb0000
c0009df4:	00fa8ab3          	add	s5,s5,a5
c0009df8:	409a8a33          	sub	s4,s5,s1
c0009dfc:	000a0c13          	mv	s8,s4
c0009e00:	00000b13          	li	s6,0
c0009e04:	00000b93          	li	s7,0
c0009e08:	00001cb7          	lui	s9,0x1
c0009e0c:	00812d03          	lw	s10,8(sp)
c0009e10:	016a8533          	add	a0,s5,s6
c0009e14:	001b8b93          	addi	s7,s7,1 # 1001 <_binary_bin_swap_img_size-0x6cff>
c0009e18:	000d2d83          	lw	s11,0(s10)
c0009e1c:	004c0c13          	addi	s8,s8,4 # 1004 <_binary_bin_swap_img_size-0x6cfc>
c0009e20:	000d8593          	mv	a1,s11
c0009e24:	518090ef          	jal	ra,c001333c <strcpy>
c0009e28:	feac2e23          	sw	a0,-4(s8)
c0009e2c:	000c8593          	mv	a1,s9
c0009e30:	000d8513          	mv	a0,s11
c0009e34:	4c8090ef          	jal	ra,c00132fc <strnlen>
c0009e38:	004d0793          	addi	a5,s10,4
c0009e3c:	01650b33          	add	s6,a0,s6
c0009e40:	00f12423          	sw	a5,8(sp)
c0009e44:	001b0b13          	addi	s6,s6,1
c0009e48:	fd2be2e3          	bltu	s7,s2,c0009e0c <do_execve+0x7f8>
c0009e4c:	00091797          	auipc	a5,0x91
c0009e50:	9607a783          	lw	a5,-1696(a5) # c009a7ac <current>
c0009e54:	0547a903          	lw	s2,84(a5)
c0009e58:	09000613          	li	a2,144
c0009e5c:	fe8a2e23          	sw	s0,-4(s4)
c0009e60:	00000593          	li	a1,0
c0009e64:	00090513          	mv	a0,s2
c0009e68:	08092a83          	lw	s5,128(s2) # 80000080 <sbi_remote_fence_i+0x80000790>
c0009e6c:	54c090ef          	jal	ra,c00133b8 <memset>
c0009e70:	09412783          	lw	a5,148(sp)
c0009e74:	ffca0a13          	addi	s4,s4,-4
c0009e78:	edfafa93          	andi	s5,s5,-289
c0009e7c:	ffc48493          	addi	s1,s1,-4
c0009e80:	01492423          	sw	s4,8(s2)
c0009e84:	08f92223          	sw	a5,132(s2)
c0009e88:	09592023          	sw	s5,128(s2)
c0009e8c:	009989b3          	add	s3,s3,s1
c0009e90:	0009a503          	lw	a0,0(s3)
c0009e94:	fff40413          	addi	s0,s0,-1
c0009e98:	ffc98993          	addi	s3,s3,-4
c0009e9c:	870f90ef          	jal	ra,c0002f0c <kfree>
c0009ea0:	fe0418e3          	bnez	s0,c0009e90 <do_execve+0x87c>
c0009ea4:	04810593          	addi	a1,sp,72
c0009ea8:	00091517          	auipc	a0,0x91
c0009eac:	90452503          	lw	a0,-1788(a0) # c009a7ac <current>
c0009eb0:	a09fe0ef          	jal	ra,c00088b8 <set_proc_name>
c0009eb4:	00000493          	li	s1,0
c0009eb8:	9adff06f          	j	c0009864 <do_execve+0x250>
c0009ebc:	0000b617          	auipc	a2,0xb
c0009ec0:	ce860613          	addi	a2,a2,-792 # c0014ba4 <commands+0xeec>
c0009ec4:	2e700593          	li	a1,743
c0009ec8:	0000c517          	auipc	a0,0xc
c0009ecc:	43c50513          	addi	a0,a0,1084 # c0016304 <default_pmm_manager+0x1014>
c0009ed0:	bf4f60ef          	jal	ra,c00002c4 <__panic>
c0009ed4:	0000c697          	auipc	a3,0xc
c0009ed8:	12468693          	addi	a3,a3,292 # c0015ff8 <default_pmm_manager+0xd08>
c0009edc:	0000a617          	auipc	a2,0xa
c0009ee0:	f4060613          	addi	a2,a2,-192 # c0013e1c <commands+0x164>
c0009ee4:	2e300593          	li	a1,739
c0009ee8:	0000c517          	auipc	a0,0xc
c0009eec:	41c50513          	addi	a0,a0,1052 # c0016304 <default_pmm_manager+0x1014>
c0009ef0:	bd4f60ef          	jal	ra,c00002c4 <__panic>
c0009ef4:	0000c697          	auipc	a3,0xc
c0009ef8:	0c068693          	addi	a3,a3,192 # c0015fb4 <default_pmm_manager+0xcc4>
c0009efc:	0000a617          	auipc	a2,0xa
c0009f00:	f2060613          	addi	a2,a2,-224 # c0013e1c <commands+0x164>
c0009f04:	2e200593          	li	a1,738
c0009f08:	0000c517          	auipc	a0,0xc
c0009f0c:	3fc50513          	addi	a0,a0,1020 # c0016304 <default_pmm_manager+0x1014>
c0009f10:	bb4f60ef          	jal	ra,c00002c4 <__panic>
c0009f14:	0000c697          	auipc	a3,0xc
c0009f18:	05c68693          	addi	a3,a3,92 # c0015f70 <default_pmm_manager+0xc80>
c0009f1c:	0000a617          	auipc	a2,0xa
c0009f20:	f0060613          	addi	a2,a2,-256 # c0013e1c <commands+0x164>
c0009f24:	2e100593          	li	a1,737
c0009f28:	0000c517          	auipc	a0,0xc
c0009f2c:	3dc50513          	addi	a0,a0,988 # c0016304 <default_pmm_manager+0x1014>
c0009f30:	b94f60ef          	jal	ra,c00002c4 <__panic>
c0009f34:	0000c697          	auipc	a3,0xc
c0009f38:	ff868693          	addi	a3,a3,-8 # c0015f2c <default_pmm_manager+0xc3c>
c0009f3c:	0000a617          	auipc	a2,0xa
c0009f40:	ee060613          	addi	a2,a2,-288 # c0013e1c <commands+0x164>
c0009f44:	2e000593          	li	a1,736
c0009f48:	0000c517          	auipc	a0,0xc
c0009f4c:	3bc50513          	addi	a0,a0,956 # c0016304 <default_pmm_manager+0x1014>
c0009f50:	b74f60ef          	jal	ra,c00002c4 <__panic>
c0009f54:	0000b617          	auipc	a2,0xb
c0009f58:	9a060613          	addi	a2,a2,-1632 # c00148f4 <commands+0xc3c>
c0009f5c:	06900593          	li	a1,105
c0009f60:	0000b517          	auipc	a0,0xb
c0009f64:	9b450513          	addi	a0,a0,-1612 # c0014914 <commands+0xc5c>
c0009f68:	b5cf60ef          	jal	ra,c00002c4 <__panic>
c0009f6c:	0000b617          	auipc	a2,0xb
c0009f70:	c3860613          	addi	a2,a2,-968 # c0014ba4 <commands+0xeec>
c0009f74:	07000593          	li	a1,112
c0009f78:	0000b517          	auipc	a0,0xb
c0009f7c:	99c50513          	addi	a0,a0,-1636 # c0014914 <commands+0xc5c>
c0009f80:	b44f60ef          	jal	ra,c00002c4 <__panic>
c0009f84:	00070693          	mv	a3,a4
c0009f88:	0000b617          	auipc	a2,0xb
c0009f8c:	bf860613          	addi	a2,a2,-1032 # c0014b80 <commands+0xec8>
c0009f90:	06e00593          	li	a1,110
c0009f94:	0000b517          	auipc	a0,0xb
c0009f98:	98050513          	addi	a0,a0,-1664 # c0014914 <commands+0xc5c>
c0009f9c:	b28f60ef          	jal	ra,c00002c4 <__panic>
c0009fa0:	00050d13          	mv	s10,a0
c0009fa4:	889ff06f          	j	c000982c <do_execve+0x218>

c0009fa8 <do_yield>:
c0009fa8:	00100713          	li	a4,1
c0009fac:	00091797          	auipc	a5,0x91
c0009fb0:	8007a783          	lw	a5,-2048(a5) # c009a7ac <current>
c0009fb4:	00e7a823          	sw	a4,16(a5)
c0009fb8:	00000513          	li	a0,0
c0009fbc:	00008067          	ret

c0009fc0 <do_wait>:
c0009fc0:	ff010113          	addi	sp,sp,-16
c0009fc4:	00812423          	sw	s0,8(sp)
c0009fc8:	00912223          	sw	s1,4(sp)
c0009fcc:	00112623          	sw	ra,12(sp)
c0009fd0:	00058413          	mv	s0,a1
c0009fd4:	00050493          	mv	s1,a0
c0009fd8:	02058063          	beqz	a1,c0009ff8 <do_wait+0x38>
c0009fdc:	00090797          	auipc	a5,0x90
c0009fe0:	7d07a783          	lw	a5,2000(a5) # c009a7ac <current>
c0009fe4:	0187a503          	lw	a0,24(a5)
c0009fe8:	00100693          	li	a3,1
c0009fec:	00400613          	li	a2,4
c0009ff0:	b84f80ef          	jal	ra,c0002374 <user_mem_check>
c0009ff4:	02050063          	beqz	a0,c000a014 <do_wait+0x54>
c0009ff8:	00040593          	mv	a1,s0
c0009ffc:	00048513          	mv	a0,s1
c000a000:	00c12083          	lw	ra,12(sp)
c000a004:	00812403          	lw	s0,8(sp)
c000a008:	00412483          	lw	s1,4(sp)
c000a00c:	01010113          	addi	sp,sp,16
c000a010:	a64ff06f          	j	c0009274 <do_wait.part.7>
c000a014:	00c12083          	lw	ra,12(sp)
c000a018:	ffd00513          	li	a0,-3
c000a01c:	00812403          	lw	s0,8(sp)
c000a020:	00412483          	lw	s1,4(sp)
c000a024:	01010113          	addi	sp,sp,16
c000a028:	00008067          	ret

c000a02c <do_kill>:
c000a02c:	ff010113          	addi	sp,sp,-16
c000a030:	00812423          	sw	s0,8(sp)
c000a034:	00112623          	sw	ra,12(sp)
c000a038:	95dfe0ef          	jal	ra,c0008994 <find_proc>
c000a03c:	ffd00413          	li	s0,-3
c000a040:	02050463          	beqz	a0,c000a068 <do_kill+0x3c>
c000a044:	05c52703          	lw	a4,92(a0)
c000a048:	ff700413          	li	s0,-9
c000a04c:	00177693          	andi	a3,a4,1
c000a050:	00069c63          	bnez	a3,c000a068 <do_kill+0x3c>
c000a054:	0a852683          	lw	a3,168(a0)
c000a058:	00176713          	ori	a4,a4,1
c000a05c:	04e52e23          	sw	a4,92(a0)
c000a060:	00000413          	li	s0,0
c000a064:	0006cc63          	bltz	a3,c000a07c <do_kill+0x50>
c000a068:	00c12083          	lw	ra,12(sp)
c000a06c:	00040513          	mv	a0,s0
c000a070:	00812403          	lw	s0,8(sp)
c000a074:	01010113          	addi	sp,sp,16
c000a078:	00008067          	ret
c000a07c:	35c000ef          	jal	ra,c000a3d8 <wakeup_proc>
c000a080:	00c12083          	lw	ra,12(sp)
c000a084:	00040513          	mv	a0,s0
c000a088:	00812403          	lw	s0,8(sp)
c000a08c:	01010113          	addi	sp,sp,16
c000a090:	00008067          	ret

c000a094 <proc_init>:
c000a094:	ff010113          	addi	sp,sp,-16
c000a098:	00091797          	auipc	a5,0x91
c000a09c:	81c78793          	addi	a5,a5,-2020 # c009a8b4 <proc_list>
c000a0a0:	00112623          	sw	ra,12(sp)
c000a0a4:	00812423          	sw	s0,8(sp)
c000a0a8:	00912223          	sw	s1,4(sp)
c000a0ac:	00f7a223          	sw	a5,4(a5)
c000a0b0:	00f7a023          	sw	a5,0(a5)
c000a0b4:	0008f717          	auipc	a4,0x8f
c000a0b8:	69470713          	addi	a4,a4,1684 # c0099748 <__rq>
c000a0bc:	0008d797          	auipc	a5,0x8d
c000a0c0:	68c78793          	addi	a5,a5,1676 # c0097748 <hash_list>
c000a0c4:	00f7a223          	sw	a5,4(a5)
c000a0c8:	00f7a023          	sw	a5,0(a5)
c000a0cc:	00878793          	addi	a5,a5,8
c000a0d0:	fef71ae3          	bne	a4,a5,c000a0c4 <proc_init+0x30>
c000a0d4:	cc4fe0ef          	jal	ra,c0008598 <alloc_proc>
c000a0d8:	00090297          	auipc	t0,0x90
c000a0dc:	6ca2ac23          	sw	a0,1752(t0) # c009a7b0 <idleproc>
c000a0e0:	00050413          	mv	s0,a0
c000a0e4:	0e050263          	beqz	a0,c000a1c8 <proc_init+0x134>
c000a0e8:	00200793          	li	a5,2
c000a0ec:	00f52023          	sw	a5,0(a0)
c000a0f0:	00100493          	li	s1,1
c000a0f4:	0000e797          	auipc	a5,0xe
c000a0f8:	f0c78793          	addi	a5,a5,-244 # c0018000 <bootstack>
c000a0fc:	00052223          	sw	zero,4(a0)
c000a100:	00f52623          	sw	a5,12(a0)
c000a104:	00952823          	sw	s1,16(a0)
c000a108:	95cfe0ef          	jal	ra,c0008264 <files_create>
c000a10c:	0ca42e23          	sw	a0,220(s0)
c000a110:	12050463          	beqz	a0,c000a238 <proc_init+0x1a4>
c000a114:	00090517          	auipc	a0,0x90
c000a118:	69c52503          	lw	a0,1692(a0) # c009a7b0 <idleproc>
c000a11c:	0dc52703          	lw	a4,220(a0)
c000a120:	0000c597          	auipc	a1,0xc
c000a124:	12058593          	addi	a1,a1,288 # c0016240 <default_pmm_manager+0xf50>
c000a128:	00872783          	lw	a5,8(a4)
c000a12c:	00178793          	addi	a5,a5,1
c000a130:	00f72423          	sw	a5,8(a4)
c000a134:	f84fe0ef          	jal	ra,c00088b8 <set_proc_name>
c000a138:	00090797          	auipc	a5,0x90
c000a13c:	6807a783          	lw	a5,1664(a5) # c009a7b8 <nr_process>
c000a140:	00178793          	addi	a5,a5,1
c000a144:	00090297          	auipc	t0,0x90
c000a148:	66f2aa23          	sw	a5,1652(t0) # c009a7b8 <nr_process>
c000a14c:	00000613          	li	a2,0
c000a150:	00090797          	auipc	a5,0x90
c000a154:	6607a783          	lw	a5,1632(a5) # c009a7b0 <idleproc>
c000a158:	00000593          	li	a1,0
c000a15c:	fffff517          	auipc	a0,0xfffff
c000a160:	33c50513          	addi	a0,a0,828 # c0009498 <init_main>
c000a164:	00090297          	auipc	t0,0x90
c000a168:	64f2a423          	sw	a5,1608(t0) # c009a7ac <current>
c000a16c:	e65fe0ef          	jal	ra,c0008fd0 <kernel_thread>
c000a170:	0aa05863          	blez	a0,c000a220 <proc_init+0x18c>
c000a174:	821fe0ef          	jal	ra,c0008994 <find_proc>
c000a178:	0000c597          	auipc	a1,0xc
c000a17c:	0ec58593          	addi	a1,a1,236 # c0016264 <default_pmm_manager+0xf74>
c000a180:	00090297          	auipc	t0,0x90
c000a184:	62a2aa23          	sw	a0,1588(t0) # c009a7b4 <initproc>
c000a188:	f30fe0ef          	jal	ra,c00088b8 <set_proc_name>
c000a18c:	00090797          	auipc	a5,0x90
c000a190:	6247a783          	lw	a5,1572(a5) # c009a7b0 <idleproc>
c000a194:	06078663          	beqz	a5,c000a200 <proc_init+0x16c>
c000a198:	0047a783          	lw	a5,4(a5)
c000a19c:	06079263          	bnez	a5,c000a200 <proc_init+0x16c>
c000a1a0:	00090797          	auipc	a5,0x90
c000a1a4:	6147a783          	lw	a5,1556(a5) # c009a7b4 <initproc>
c000a1a8:	02078c63          	beqz	a5,c000a1e0 <proc_init+0x14c>
c000a1ac:	0047a783          	lw	a5,4(a5)
c000a1b0:	02979863          	bne	a5,s1,c000a1e0 <proc_init+0x14c>
c000a1b4:	00c12083          	lw	ra,12(sp)
c000a1b8:	00812403          	lw	s0,8(sp)
c000a1bc:	00412483          	lw	s1,4(sp)
c000a1c0:	01010113          	addi	sp,sp,16
c000a1c4:	00008067          	ret
c000a1c8:	0000c617          	auipc	a2,0xc
c000a1cc:	03c60613          	addi	a2,a2,60 # c0016204 <default_pmm_manager+0xf14>
c000a1d0:	42a00593          	li	a1,1066
c000a1d4:	0000c517          	auipc	a0,0xc
c000a1d8:	13050513          	addi	a0,a0,304 # c0016304 <default_pmm_manager+0x1014>
c000a1dc:	8e8f60ef          	jal	ra,c00002c4 <__panic>
c000a1e0:	0000c697          	auipc	a3,0xc
c000a1e4:	0b468693          	addi	a3,a3,180 # c0016294 <default_pmm_manager+0xfa4>
c000a1e8:	0000a617          	auipc	a2,0xa
c000a1ec:	c3460613          	addi	a2,a2,-972 # c0013e1c <commands+0x164>
c000a1f0:	44500593          	li	a1,1093
c000a1f4:	0000c517          	auipc	a0,0xc
c000a1f8:	11050513          	addi	a0,a0,272 # c0016304 <default_pmm_manager+0x1014>
c000a1fc:	8c8f60ef          	jal	ra,c00002c4 <__panic>
c000a200:	0000c697          	auipc	a3,0xc
c000a204:	06c68693          	addi	a3,a3,108 # c001626c <default_pmm_manager+0xf7c>
c000a208:	0000a617          	auipc	a2,0xa
c000a20c:	c1460613          	addi	a2,a2,-1004 # c0013e1c <commands+0x164>
c000a210:	44400593          	li	a1,1092
c000a214:	0000c517          	auipc	a0,0xc
c000a218:	0f050513          	addi	a0,a0,240 # c0016304 <default_pmm_manager+0x1014>
c000a21c:	8a8f60ef          	jal	ra,c00002c4 <__panic>
c000a220:	0000c617          	auipc	a2,0xc
c000a224:	02860613          	addi	a2,a2,40 # c0016248 <default_pmm_manager+0xf58>
c000a228:	43e00593          	li	a1,1086
c000a22c:	0000c517          	auipc	a0,0xc
c000a230:	0d850513          	addi	a0,a0,216 # c0016304 <default_pmm_manager+0x1014>
c000a234:	890f60ef          	jal	ra,c00002c4 <__panic>
c000a238:	0000c617          	auipc	a2,0xc
c000a23c:	fe460613          	addi	a2,a2,-28 # c001621c <default_pmm_manager+0xf2c>
c000a240:	43300593          	li	a1,1075
c000a244:	0000c517          	auipc	a0,0xc
c000a248:	0c050513          	addi	a0,a0,192 # c0016304 <default_pmm_manager+0x1014>
c000a24c:	878f60ef          	jal	ra,c00002c4 <__panic>

c000a250 <cpu_idle>:
c000a250:	ff010113          	addi	sp,sp,-16
c000a254:	00112623          	sw	ra,12(sp)
c000a258:	00090717          	auipc	a4,0x90
c000a25c:	55472703          	lw	a4,1364(a4) # c009a7ac <current>
c000a260:	01072783          	lw	a5,16(a4)
c000a264:	fe078ee3          	beqz	a5,c000a260 <cpu_idle+0x10>
c000a268:	260000ef          	jal	ra,c000a4c8 <schedule>
c000a26c:	fedff06f          	j	c000a258 <cpu_idle+0x8>

c000a270 <lab6_set_priority>:
c000a270:	00050a63          	beqz	a0,c000a284 <lab6_set_priority+0x14>
c000a274:	00090797          	auipc	a5,0x90
c000a278:	5387a783          	lw	a5,1336(a5) # c009a7ac <current>
c000a27c:	0ca7ac23          	sw	a0,216(a5)
c000a280:	00008067          	ret
c000a284:	00100713          	li	a4,1
c000a288:	00090797          	auipc	a5,0x90
c000a28c:	5247a783          	lw	a5,1316(a5) # c009a7ac <current>
c000a290:	0ce7ac23          	sw	a4,216(a5)
c000a294:	00008067          	ret

c000a298 <do_sleep>:
c000a298:	06050e63          	beqz	a0,c000a314 <do_sleep+0x7c>
c000a29c:	fe010113          	addi	sp,sp,-32
c000a2a0:	00812c23          	sw	s0,24(sp)
c000a2a4:	00112e23          	sw	ra,28(sp)
c000a2a8:	00050413          	mv	s0,a0
c000a2ac:	100027f3          	csrr	a5,sstatus
c000a2b0:	0027f793          	andi	a5,a5,2
c000a2b4:	06079463          	bnez	a5,c000a31c <do_sleep+0x84>
c000a2b8:	00090797          	auipc	a5,0x90
c000a2bc:	4f47a783          	lw	a5,1268(a5) # c009a7ac <current>
c000a2c0:	00810713          	addi	a4,sp,8
c000a2c4:	00a12023          	sw	a0,0(sp)
c000a2c8:	00e12623          	sw	a4,12(sp)
c000a2cc:	00e12423          	sw	a4,8(sp)
c000a2d0:	00f12223          	sw	a5,4(sp)
c000a2d4:	00100713          	li	a4,1
c000a2d8:	00e7a023          	sw	a4,0(a5)
c000a2dc:	80000737          	lui	a4,0x80000
c000a2e0:	00270713          	addi	a4,a4,2 # 80000002 <sbi_remote_fence_i+0x80000712>
c000a2e4:	0ae7a423          	sw	a4,168(a5)
c000a2e8:	00010513          	mv	a0,sp
c000a2ec:	00010413          	mv	s0,sp
c000a2f0:	2ec000ef          	jal	ra,c000a5dc <add_timer>
c000a2f4:	1d4000ef          	jal	ra,c000a4c8 <schedule>
c000a2f8:	00040513          	mv	a0,s0
c000a2fc:	3f8000ef          	jal	ra,c000a6f4 <del_timer>
c000a300:	01c12083          	lw	ra,28(sp)
c000a304:	00000513          	li	a0,0
c000a308:	01812403          	lw	s0,24(sp)
c000a30c:	02010113          	addi	sp,sp,32
c000a310:	00008067          	ret
c000a314:	00000513          	li	a0,0
c000a318:	00008067          	ret
c000a31c:	aa5f60ef          	jal	ra,c0000dc0 <intr_disable>
c000a320:	00090797          	auipc	a5,0x90
c000a324:	48c7a783          	lw	a5,1164(a5) # c009a7ac <current>
c000a328:	00810713          	addi	a4,sp,8
c000a32c:	00812023          	sw	s0,0(sp)
c000a330:	00f12223          	sw	a5,4(sp)
c000a334:	00e12623          	sw	a4,12(sp)
c000a338:	00e12423          	sw	a4,8(sp)
c000a33c:	00100713          	li	a4,1
c000a340:	00e7a023          	sw	a4,0(a5)
c000a344:	80000737          	lui	a4,0x80000
c000a348:	00270713          	addi	a4,a4,2 # 80000002 <sbi_remote_fence_i+0x80000712>
c000a34c:	00010513          	mv	a0,sp
c000a350:	0ae7a423          	sw	a4,168(a5)
c000a354:	00010413          	mv	s0,sp
c000a358:	284000ef          	jal	ra,c000a5dc <add_timer>
c000a35c:	a5df60ef          	jal	ra,c0000db8 <intr_enable>
c000a360:	f95ff06f          	j	c000a2f4 <do_sleep+0x5c>

c000a364 <sched_init>:
c000a364:	ff010113          	addi	sp,sp,-16
c000a368:	0008d697          	auipc	a3,0x8d
c000a36c:	cb868693          	addi	a3,a3,-840 # c0097020 <default_sched_class>
c000a370:	00112623          	sw	ra,12(sp)
c000a374:	00812423          	sw	s0,8(sp)
c000a378:	00090797          	auipc	a5,0x90
c000a37c:	44c78793          	addi	a5,a5,1100 # c009a7c4 <timer_list>
c000a380:	0046a603          	lw	a2,4(a3)
c000a384:	0008f717          	auipc	a4,0x8f
c000a388:	3c470713          	addi	a4,a4,964 # c0099748 <__rq>
c000a38c:	00f7a223          	sw	a5,4(a5)
c000a390:	00f7a023          	sw	a5,0(a5)
c000a394:	00500793          	li	a5,5
c000a398:	00090417          	auipc	s0,0x90
c000a39c:	42840413          	addi	s0,s0,1064 # c009a7c0 <sched_class>
c000a3a0:	00070513          	mv	a0,a4
c000a3a4:	00f72623          	sw	a5,12(a4)
c000a3a8:	00d42023          	sw	a3,0(s0)
c000a3ac:	00090297          	auipc	t0,0x90
c000a3b0:	40e2a823          	sw	a4,1040(t0) # c009a7bc <rq>
c000a3b4:	000600e7          	jalr	a2
c000a3b8:	00042783          	lw	a5,0(s0)
c000a3bc:	00c12083          	lw	ra,12(sp)
c000a3c0:	00812403          	lw	s0,8(sp)
c000a3c4:	0007a583          	lw	a1,0(a5)
c000a3c8:	0000c517          	auipc	a0,0xc
c000a3cc:	ff850513          	addi	a0,a0,-8 # c00163c0 <default_pmm_manager+0x10d0>
c000a3d0:	01010113          	addi	sp,sp,16
c000a3d4:	d75f506f          	j	c0000148 <cprintf>

c000a3d8 <wakeup_proc>:
c000a3d8:	00052703          	lw	a4,0(a0)
c000a3dc:	ff010113          	addi	sp,sp,-16
c000a3e0:	00112623          	sw	ra,12(sp)
c000a3e4:	00812423          	sw	s0,8(sp)
c000a3e8:	00912223          	sw	s1,4(sp)
c000a3ec:	00300793          	li	a5,3
c000a3f0:	0af70c63          	beq	a4,a5,c000a4a8 <wakeup_proc+0xd0>
c000a3f4:	00050413          	mv	s0,a0
c000a3f8:	100027f3          	csrr	a5,sstatus
c000a3fc:	0027f793          	andi	a5,a5,2
c000a400:	00000493          	li	s1,0
c000a404:	06079a63          	bnez	a5,c000a478 <wakeup_proc+0xa0>
c000a408:	00200793          	li	a5,2
c000a40c:	08f70063          	beq	a4,a5,c000a48c <wakeup_proc+0xb4>
c000a410:	00f42023          	sw	a5,0(s0)
c000a414:	0a042423          	sw	zero,168(s0)
c000a418:	00090797          	auipc	a5,0x90
c000a41c:	3947a783          	lw	a5,916(a5) # c009a7ac <current>
c000a420:	02f40663          	beq	s0,a5,c000a44c <wakeup_proc+0x74>
c000a424:	00090797          	auipc	a5,0x90
c000a428:	38c7a783          	lw	a5,908(a5) # c009a7b0 <idleproc>
c000a42c:	02f40063          	beq	s0,a5,c000a44c <wakeup_proc+0x74>
c000a430:	00090797          	auipc	a5,0x90
c000a434:	3907a783          	lw	a5,912(a5) # c009a7c0 <sched_class>
c000a438:	0087a783          	lw	a5,8(a5)
c000a43c:	00040593          	mv	a1,s0
c000a440:	00090517          	auipc	a0,0x90
c000a444:	37c52503          	lw	a0,892(a0) # c009a7bc <rq>
c000a448:	000780e7          	jalr	a5
c000a44c:	00049c63          	bnez	s1,c000a464 <wakeup_proc+0x8c>
c000a450:	00c12083          	lw	ra,12(sp)
c000a454:	00812403          	lw	s0,8(sp)
c000a458:	00412483          	lw	s1,4(sp)
c000a45c:	01010113          	addi	sp,sp,16
c000a460:	00008067          	ret
c000a464:	00c12083          	lw	ra,12(sp)
c000a468:	00812403          	lw	s0,8(sp)
c000a46c:	00412483          	lw	s1,4(sp)
c000a470:	01010113          	addi	sp,sp,16
c000a474:	945f606f          	j	c0000db8 <intr_enable>
c000a478:	949f60ef          	jal	ra,c0000dc0 <intr_disable>
c000a47c:	00042703          	lw	a4,0(s0)
c000a480:	00200793          	li	a5,2
c000a484:	00100493          	li	s1,1
c000a488:	f8f714e3          	bne	a4,a5,c000a410 <wakeup_proc+0x38>
c000a48c:	0000c617          	auipc	a2,0xc
c000a490:	f7c60613          	addi	a2,a2,-132 # c0016408 <default_pmm_manager+0x1118>
c000a494:	04800593          	li	a1,72
c000a498:	0000c517          	auipc	a0,0xc
c000a49c:	f5850513          	addi	a0,a0,-168 # c00163f0 <default_pmm_manager+0x1100>
c000a4a0:	eadf50ef          	jal	ra,c000034c <__warn>
c000a4a4:	fa9ff06f          	j	c000a44c <wakeup_proc+0x74>
c000a4a8:	0000c697          	auipc	a3,0xc
c000a4ac:	f2c68693          	addi	a3,a3,-212 # c00163d4 <default_pmm_manager+0x10e4>
c000a4b0:	0000a617          	auipc	a2,0xa
c000a4b4:	96c60613          	addi	a2,a2,-1684 # c0013e1c <commands+0x164>
c000a4b8:	03c00593          	li	a1,60
c000a4bc:	0000c517          	auipc	a0,0xc
c000a4c0:	f3450513          	addi	a0,a0,-204 # c00163f0 <default_pmm_manager+0x1100>
c000a4c4:	e01f50ef          	jal	ra,c00002c4 <__panic>

c000a4c8 <schedule>:
c000a4c8:	ff010113          	addi	sp,sp,-16
c000a4cc:	00112623          	sw	ra,12(sp)
c000a4d0:	00812423          	sw	s0,8(sp)
c000a4d4:	00912223          	sw	s1,4(sp)
c000a4d8:	100027f3          	csrr	a5,sstatus
c000a4dc:	0027f793          	andi	a5,a5,2
c000a4e0:	00000493          	li	s1,0
c000a4e4:	0a079863          	bnez	a5,c000a594 <schedule+0xcc>
c000a4e8:	00090597          	auipc	a1,0x90
c000a4ec:	2c45a583          	lw	a1,708(a1) # c009a7ac <current>
c000a4f0:	0005a703          	lw	a4,0(a1)
c000a4f4:	0005a823          	sw	zero,16(a1)
c000a4f8:	00200793          	li	a5,2
c000a4fc:	0af70c63          	beq	a4,a5,c000a5b4 <schedule+0xec>
c000a500:	00090797          	auipc	a5,0x90
c000a504:	2c07a783          	lw	a5,704(a5) # c009a7c0 <sched_class>
c000a508:	0107a783          	lw	a5,16(a5)
c000a50c:	00090517          	auipc	a0,0x90
c000a510:	2b052503          	lw	a0,688(a0) # c009a7bc <rq>
c000a514:	000780e7          	jalr	a5
c000a518:	00050413          	mv	s0,a0
c000a51c:	06050663          	beqz	a0,c000a588 <schedule+0xc0>
c000a520:	00090797          	auipc	a5,0x90
c000a524:	2a07a783          	lw	a5,672(a5) # c009a7c0 <sched_class>
c000a528:	00c7a783          	lw	a5,12(a5)
c000a52c:	00050593          	mv	a1,a0
c000a530:	00090517          	auipc	a0,0x90
c000a534:	28c52503          	lw	a0,652(a0) # c009a7bc <rq>
c000a538:	000780e7          	jalr	a5
c000a53c:	00842783          	lw	a5,8(s0)
c000a540:	00090717          	auipc	a4,0x90
c000a544:	26c72703          	lw	a4,620(a4) # c009a7ac <current>
c000a548:	00178793          	addi	a5,a5,1
c000a54c:	00f42423          	sw	a5,8(s0)
c000a550:	00e40663          	beq	s0,a4,c000a55c <schedule+0x94>
c000a554:	00040513          	mv	a0,s0
c000a558:	ba8fe0ef          	jal	ra,c0008900 <proc_run>
c000a55c:	00049c63          	bnez	s1,c000a574 <schedule+0xac>
c000a560:	00c12083          	lw	ra,12(sp)
c000a564:	00812403          	lw	s0,8(sp)
c000a568:	00412483          	lw	s1,4(sp)
c000a56c:	01010113          	addi	sp,sp,16
c000a570:	00008067          	ret
c000a574:	00c12083          	lw	ra,12(sp)
c000a578:	00812403          	lw	s0,8(sp)
c000a57c:	00412483          	lw	s1,4(sp)
c000a580:	01010113          	addi	sp,sp,16
c000a584:	835f606f          	j	c0000db8 <intr_enable>
c000a588:	00090417          	auipc	s0,0x90
c000a58c:	22842403          	lw	s0,552(s0) # c009a7b0 <idleproc>
c000a590:	fadff06f          	j	c000a53c <schedule+0x74>
c000a594:	82df60ef          	jal	ra,c0000dc0 <intr_disable>
c000a598:	00090597          	auipc	a1,0x90
c000a59c:	2145a583          	lw	a1,532(a1) # c009a7ac <current>
c000a5a0:	0005a703          	lw	a4,0(a1)
c000a5a4:	0005a823          	sw	zero,16(a1)
c000a5a8:	00200793          	li	a5,2
c000a5ac:	00100493          	li	s1,1
c000a5b0:	f4f718e3          	bne	a4,a5,c000a500 <schedule+0x38>
c000a5b4:	00090797          	auipc	a5,0x90
c000a5b8:	1fc7a783          	lw	a5,508(a5) # c009a7b0 <idleproc>
c000a5bc:	f4f582e3          	beq	a1,a5,c000a500 <schedule+0x38>
c000a5c0:	00090797          	auipc	a5,0x90
c000a5c4:	2007a783          	lw	a5,512(a5) # c009a7c0 <sched_class>
c000a5c8:	0087a783          	lw	a5,8(a5)
c000a5cc:	00090517          	auipc	a0,0x90
c000a5d0:	1f052503          	lw	a0,496(a0) # c009a7bc <rq>
c000a5d4:	000780e7          	jalr	a5
c000a5d8:	f29ff06f          	j	c000a500 <schedule+0x38>

c000a5dc <add_timer>:
c000a5dc:	ff010113          	addi	sp,sp,-16
c000a5e0:	00812423          	sw	s0,8(sp)
c000a5e4:	00112623          	sw	ra,12(sp)
c000a5e8:	00050413          	mv	s0,a0
c000a5ec:	100027f3          	csrr	a5,sstatus
c000a5f0:	0027f793          	andi	a5,a5,2
c000a5f4:	00000513          	li	a0,0
c000a5f8:	0a079863          	bnez	a5,c000a6a8 <add_timer+0xcc>
c000a5fc:	00042703          	lw	a4,0(s0)
c000a600:	0a070a63          	beqz	a4,c000a6b4 <add_timer+0xd8>
c000a604:	00442783          	lw	a5,4(s0)
c000a608:	0a078663          	beqz	a5,c000a6b4 <add_timer+0xd8>
c000a60c:	00c42783          	lw	a5,12(s0)
c000a610:	00840593          	addi	a1,s0,8
c000a614:	0cf59063          	bne	a1,a5,c000a6d4 <add_timer+0xf8>
c000a618:	00090617          	auipc	a2,0x90
c000a61c:	1ac60613          	addi	a2,a2,428 # c009a7c4 <timer_list>
c000a620:	00090797          	auipc	a5,0x90
c000a624:	1a87a783          	lw	a5,424(a5) # c009a7c8 <timer_list+0x4>
c000a628:	00c79c63          	bne	a5,a2,c000a640 <add_timer+0x64>
c000a62c:	04c0006f          	j	c000a678 <add_timer+0x9c>
c000a630:	0047a783          	lw	a5,4(a5)
c000a634:	40d70733          	sub	a4,a4,a3
c000a638:	00e42023          	sw	a4,0(s0)
c000a63c:	02c78e63          	beq	a5,a2,c000a678 <add_timer+0x9c>
c000a640:	ff87a683          	lw	a3,-8(a5)
c000a644:	fed776e3          	bleu	a3,a4,c000a630 <add_timer+0x54>
c000a648:	40e68733          	sub	a4,a3,a4
c000a64c:	fee7ac23          	sw	a4,-8(a5)
c000a650:	0007a703          	lw	a4,0(a5)
c000a654:	00b7a023          	sw	a1,0(a5)
c000a658:	00b72223          	sw	a1,4(a4)
c000a65c:	00f42623          	sw	a5,12(s0)
c000a660:	00e42423          	sw	a4,8(s0)
c000a664:	02050a63          	beqz	a0,c000a698 <add_timer+0xbc>
c000a668:	00c12083          	lw	ra,12(sp)
c000a66c:	00812403          	lw	s0,8(sp)
c000a670:	01010113          	addi	sp,sp,16
c000a674:	f44f606f          	j	c0000db8 <intr_enable>
c000a678:	00090797          	auipc	a5,0x90
c000a67c:	14c78793          	addi	a5,a5,332 # c009a7c4 <timer_list>
c000a680:	0007a703          	lw	a4,0(a5)
c000a684:	00b7a023          	sw	a1,0(a5)
c000a688:	00b72223          	sw	a1,4(a4)
c000a68c:	00f42623          	sw	a5,12(s0)
c000a690:	00e42423          	sw	a4,8(s0)
c000a694:	fc051ae3          	bnez	a0,c000a668 <add_timer+0x8c>
c000a698:	00c12083          	lw	ra,12(sp)
c000a69c:	00812403          	lw	s0,8(sp)
c000a6a0:	01010113          	addi	sp,sp,16
c000a6a4:	00008067          	ret
c000a6a8:	f18f60ef          	jal	ra,c0000dc0 <intr_disable>
c000a6ac:	00100513          	li	a0,1
c000a6b0:	f4dff06f          	j	c000a5fc <add_timer+0x20>
c000a6b4:	0000c697          	auipc	a3,0xc
c000a6b8:	c6468693          	addi	a3,a3,-924 # c0016318 <default_pmm_manager+0x1028>
c000a6bc:	00009617          	auipc	a2,0x9
c000a6c0:	76060613          	addi	a2,a2,1888 # c0013e1c <commands+0x164>
c000a6c4:	06b00593          	li	a1,107
c000a6c8:	0000c517          	auipc	a0,0xc
c000a6cc:	d2850513          	addi	a0,a0,-728 # c00163f0 <default_pmm_manager+0x1100>
c000a6d0:	bf5f50ef          	jal	ra,c00002c4 <__panic>
c000a6d4:	0000c697          	auipc	a3,0xc
c000a6d8:	c7068693          	addi	a3,a3,-912 # c0016344 <default_pmm_manager+0x1054>
c000a6dc:	00009617          	auipc	a2,0x9
c000a6e0:	74060613          	addi	a2,a2,1856 # c0013e1c <commands+0x164>
c000a6e4:	06c00593          	li	a1,108
c000a6e8:	0000c517          	auipc	a0,0xc
c000a6ec:	d0850513          	addi	a0,a0,-760 # c00163f0 <default_pmm_manager+0x1100>
c000a6f0:	bd5f50ef          	jal	ra,c00002c4 <__panic>

c000a6f4 <del_timer>:
c000a6f4:	ff010113          	addi	sp,sp,-16
c000a6f8:	00812423          	sw	s0,8(sp)
c000a6fc:	00112623          	sw	ra,12(sp)
c000a700:	00050413          	mv	s0,a0
c000a704:	100027f3          	csrr	a5,sstatus
c000a708:	0027f793          	andi	a5,a5,2
c000a70c:	02079e63          	bnez	a5,c000a748 <del_timer+0x54>
c000a710:	00c52783          	lw	a5,12(a0)
c000a714:	00850713          	addi	a4,a0,8
c000a718:	02f70063          	beq	a4,a5,c000a738 <del_timer+0x44>
c000a71c:	00052683          	lw	a3,0(a0)
c000a720:	08069263          	bnez	a3,c000a7a4 <del_timer+0xb0>
c000a724:	00842683          	lw	a3,8(s0)
c000a728:	00f6a223          	sw	a5,4(a3)
c000a72c:	00d7a023          	sw	a3,0(a5)
c000a730:	00e42623          	sw	a4,12(s0)
c000a734:	00e42423          	sw	a4,8(s0)
c000a738:	00c12083          	lw	ra,12(sp)
c000a73c:	00812403          	lw	s0,8(sp)
c000a740:	01010113          	addi	sp,sp,16
c000a744:	00008067          	ret
c000a748:	e78f60ef          	jal	ra,c0000dc0 <intr_disable>
c000a74c:	00c42783          	lw	a5,12(s0)
c000a750:	00840713          	addi	a4,s0,8
c000a754:	04f70063          	beq	a4,a5,c000a794 <del_timer+0xa0>
c000a758:	00042683          	lw	a3,0(s0)
c000a75c:	04068e63          	beqz	a3,c000a7b8 <del_timer+0xc4>
c000a760:	00090617          	auipc	a2,0x90
c000a764:	06460613          	addi	a2,a2,100 # c009a7c4 <timer_list>
c000a768:	00100513          	li	a0,1
c000a76c:	04c78663          	beq	a5,a2,c000a7b8 <del_timer+0xc4>
c000a770:	ff87a603          	lw	a2,-8(a5)
c000a774:	00842583          	lw	a1,8(s0)
c000a778:	00d606b3          	add	a3,a2,a3
c000a77c:	fed7ac23          	sw	a3,-8(a5)
c000a780:	00f5a223          	sw	a5,4(a1)
c000a784:	00b7a023          	sw	a1,0(a5)
c000a788:	00e42623          	sw	a4,12(s0)
c000a78c:	00e42423          	sw	a4,8(s0)
c000a790:	fa0504e3          	beqz	a0,c000a738 <del_timer+0x44>
c000a794:	00c12083          	lw	ra,12(sp)
c000a798:	00812403          	lw	s0,8(sp)
c000a79c:	01010113          	addi	sp,sp,16
c000a7a0:	e18f606f          	j	c0000db8 <intr_enable>
c000a7a4:	00090617          	auipc	a2,0x90
c000a7a8:	02060613          	addi	a2,a2,32 # c009a7c4 <timer_list>
c000a7ac:	00000513          	li	a0,0
c000a7b0:	fcc790e3          	bne	a5,a2,c000a770 <del_timer+0x7c>
c000a7b4:	f71ff06f          	j	c000a724 <del_timer+0x30>
c000a7b8:	00842683          	lw	a3,8(s0)
c000a7bc:	00f6a223          	sw	a5,4(a3)
c000a7c0:	00d7a023          	sw	a3,0(a5)
c000a7c4:	00e42623          	sw	a4,12(s0)
c000a7c8:	00e42423          	sw	a4,8(s0)
c000a7cc:	fc9ff06f          	j	c000a794 <del_timer+0xa0>

c000a7d0 <run_timer_list>:
c000a7d0:	fd010113          	addi	sp,sp,-48
c000a7d4:	02112623          	sw	ra,44(sp)
c000a7d8:	02812423          	sw	s0,40(sp)
c000a7dc:	02912223          	sw	s1,36(sp)
c000a7e0:	03212023          	sw	s2,32(sp)
c000a7e4:	01312e23          	sw	s3,28(sp)
c000a7e8:	01412c23          	sw	s4,24(sp)
c000a7ec:	01512a23          	sw	s5,20(sp)
c000a7f0:	01612823          	sw	s6,16(sp)
c000a7f4:	01712623          	sw	s7,12(sp)
c000a7f8:	100027f3          	csrr	a5,sstatus
c000a7fc:	0027f793          	andi	a5,a5,2
c000a800:	00000b93          	li	s7,0
c000a804:	12079c63          	bnez	a5,c000a93c <run_timer_list+0x16c>
c000a808:	00090997          	auipc	s3,0x90
c000a80c:	fbc98993          	addi	s3,s3,-68 # c009a7c4 <timer_list>
c000a810:	00090417          	auipc	s0,0x90
c000a814:	fb842403          	lw	s0,-72(s0) # c009a7c8 <timer_list+0x4>
c000a818:	09340863          	beq	s0,s3,c000a8a8 <run_timer_list+0xd8>
c000a81c:	ff842783          	lw	a5,-8(s0)
c000a820:	ff840913          	addi	s2,s0,-8
c000a824:	14078263          	beqz	a5,c000a968 <run_timer_list+0x198>
c000a828:	fff78793          	addi	a5,a5,-1
c000a82c:	fef42c23          	sw	a5,-8(s0)
c000a830:	06079c63          	bnez	a5,c000a8a8 <run_timer_list+0xd8>
c000a834:	0000cb17          	auipc	s6,0xc
c000a838:	b6cb0b13          	addi	s6,s6,-1172 # c00163a0 <default_pmm_manager+0x10b0>
c000a83c:	0a200a93          	li	s5,162
c000a840:	0000ca17          	auipc	s4,0xc
c000a844:	bb0a0a13          	addi	s4,s4,-1104 # c00163f0 <default_pmm_manager+0x1100>
c000a848:	0280006f          	j	c000a870 <run_timer_list+0xa0>
c000a84c:	0e07de63          	bgez	a5,c000a948 <run_timer_list+0x178>
c000a850:	00048513          	mv	a0,s1
c000a854:	b85ff0ef          	jal	ra,c000a3d8 <wakeup_proc>
c000a858:	00090513          	mv	a0,s2
c000a85c:	e99ff0ef          	jal	ra,c000a6f4 <del_timer>
c000a860:	05340463          	beq	s0,s3,c000a8a8 <run_timer_list+0xd8>
c000a864:	ff842783          	lw	a5,-8(s0)
c000a868:	ff840913          	addi	s2,s0,-8
c000a86c:	02079e63          	bnez	a5,c000a8a8 <run_timer_list+0xd8>
c000a870:	00492483          	lw	s1,4(s2)
c000a874:	00442403          	lw	s0,4(s0)
c000a878:	0a84a783          	lw	a5,168(s1)
c000a87c:	fc0798e3          	bnez	a5,c000a84c <run_timer_list+0x7c>
c000a880:	0044a683          	lw	a3,4(s1)
c000a884:	000b0613          	mv	a2,s6
c000a888:	000a8593          	mv	a1,s5
c000a88c:	000a0513          	mv	a0,s4
c000a890:	abdf50ef          	jal	ra,c000034c <__warn>
c000a894:	00048513          	mv	a0,s1
c000a898:	b41ff0ef          	jal	ra,c000a3d8 <wakeup_proc>
c000a89c:	00090513          	mv	a0,s2
c000a8a0:	e55ff0ef          	jal	ra,c000a6f4 <del_timer>
c000a8a4:	fd3410e3          	bne	s0,s3,c000a864 <run_timer_list+0x94>
c000a8a8:	00090597          	auipc	a1,0x90
c000a8ac:	f045a583          	lw	a1,-252(a1) # c009a7ac <current>
c000a8b0:	00090797          	auipc	a5,0x90
c000a8b4:	f007a783          	lw	a5,-256(a5) # c009a7b0 <idleproc>
c000a8b8:	06f58c63          	beq	a1,a5,c000a930 <run_timer_list+0x160>
c000a8bc:	00090797          	auipc	a5,0x90
c000a8c0:	f047a783          	lw	a5,-252(a5) # c009a7c0 <sched_class>
c000a8c4:	0147a783          	lw	a5,20(a5)
c000a8c8:	00090517          	auipc	a0,0x90
c000a8cc:	ef452503          	lw	a0,-268(a0) # c009a7bc <rq>
c000a8d0:	000780e7          	jalr	a5
c000a8d4:	020b9863          	bnez	s7,c000a904 <run_timer_list+0x134>
c000a8d8:	02c12083          	lw	ra,44(sp)
c000a8dc:	02812403          	lw	s0,40(sp)
c000a8e0:	02412483          	lw	s1,36(sp)
c000a8e4:	02012903          	lw	s2,32(sp)
c000a8e8:	01c12983          	lw	s3,28(sp)
c000a8ec:	01812a03          	lw	s4,24(sp)
c000a8f0:	01412a83          	lw	s5,20(sp)
c000a8f4:	01012b03          	lw	s6,16(sp)
c000a8f8:	00c12b83          	lw	s7,12(sp)
c000a8fc:	03010113          	addi	sp,sp,48
c000a900:	00008067          	ret
c000a904:	02c12083          	lw	ra,44(sp)
c000a908:	02812403          	lw	s0,40(sp)
c000a90c:	02412483          	lw	s1,36(sp)
c000a910:	02012903          	lw	s2,32(sp)
c000a914:	01c12983          	lw	s3,28(sp)
c000a918:	01812a03          	lw	s4,24(sp)
c000a91c:	01412a83          	lw	s5,20(sp)
c000a920:	01012b03          	lw	s6,16(sp)
c000a924:	00c12b83          	lw	s7,12(sp)
c000a928:	03010113          	addi	sp,sp,48
c000a92c:	c8cf606f          	j	c0000db8 <intr_enable>
c000a930:	00100793          	li	a5,1
c000a934:	00f5a823          	sw	a5,16(a1)
c000a938:	f9dff06f          	j	c000a8d4 <run_timer_list+0x104>
c000a93c:	c84f60ef          	jal	ra,c0000dc0 <intr_disable>
c000a940:	00100b93          	li	s7,1
c000a944:	ec5ff06f          	j	c000a808 <run_timer_list+0x38>
c000a948:	0000c697          	auipc	a3,0xc
c000a94c:	a3468693          	addi	a3,a3,-1484 # c001637c <default_pmm_manager+0x108c>
c000a950:	00009617          	auipc	a2,0x9
c000a954:	4cc60613          	addi	a2,a2,1228 # c0013e1c <commands+0x164>
c000a958:	09f00593          	li	a1,159
c000a95c:	0000c517          	auipc	a0,0xc
c000a960:	a9450513          	addi	a0,a0,-1388 # c00163f0 <default_pmm_manager+0x1100>
c000a964:	961f50ef          	jal	ra,c00002c4 <__panic>
c000a968:	0000c697          	auipc	a3,0xc
c000a96c:	a0068693          	addi	a3,a3,-1536 # c0016368 <default_pmm_manager+0x1078>
c000a970:	00009617          	auipc	a2,0x9
c000a974:	4ac60613          	addi	a2,a2,1196 # c0013e1c <commands+0x164>
c000a978:	09900593          	li	a1,153
c000a97c:	0000c517          	auipc	a0,0xc
c000a980:	a7450513          	addi	a0,a0,-1420 # c00163f0 <default_pmm_manager+0x1100>
c000a984:	941f50ef          	jal	ra,c00002c4 <__panic>

c000a988 <proc_stride_comp_f>:
c000a988:	00c52503          	lw	a0,12(a0)
c000a98c:	00c5a783          	lw	a5,12(a1)
c000a990:	40f50533          	sub	a0,a0,a5
c000a994:	00a05663          	blez	a0,c000a9a0 <proc_stride_comp_f+0x18>
c000a998:	00100513          	li	a0,1
c000a99c:	00008067          	ret
c000a9a0:	00a03533          	snez	a0,a0
c000a9a4:	40a00533          	neg	a0,a0
c000a9a8:	00008067          	ret

c000a9ac <stride_init>:
c000a9ac:	00a52223          	sw	a0,4(a0)
c000a9b0:	00a52023          	sw	a0,0(a0)
c000a9b4:	00052823          	sw	zero,16(a0)
c000a9b8:	00052423          	sw	zero,8(a0)
c000a9bc:	00008067          	ret

c000a9c0 <stride_pick_next>:
c000a9c0:	01052783          	lw	a5,16(a0)
c000a9c4:	02078463          	beqz	a5,c000a9ec <stride_pick_next+0x2c>
c000a9c8:	0107a683          	lw	a3,16(a5)
c000a9cc:	f3878513          	addi	a0,a5,-200
c000a9d0:	00c7a603          	lw	a2,12(a5)
c000a9d4:	40000737          	lui	a4,0x40000
c000a9d8:	00068463          	beqz	a3,c000a9e0 <stride_pick_next+0x20>
c000a9dc:	02d75733          	divu	a4,a4,a3
c000a9e0:	00c70733          	add	a4,a4,a2
c000a9e4:	00e7a623          	sw	a4,12(a5)
c000a9e8:	00008067          	ret
c000a9ec:	00000513          	li	a0,0
c000a9f0:	00008067          	ret

c000a9f4 <stride_proc_tick>:
c000a9f4:	0c45a783          	lw	a5,196(a1)
c000a9f8:	00f05663          	blez	a5,c000aa04 <stride_proc_tick+0x10>
c000a9fc:	fff78793          	addi	a5,a5,-1
c000aa00:	0cf5a223          	sw	a5,196(a1)
c000aa04:	00079663          	bnez	a5,c000aa10 <stride_proc_tick+0x1c>
c000aa08:	00100793          	li	a5,1
c000aa0c:	00f5a823          	sw	a5,16(a1)
c000aa10:	00008067          	ret

c000aa14 <skew_heap_merge.constprop.3>:
c000aa14:	fd010113          	addi	sp,sp,-48
c000aa18:	02812423          	sw	s0,40(sp)
c000aa1c:	02112623          	sw	ra,44(sp)
c000aa20:	02912223          	sw	s1,36(sp)
c000aa24:	03212023          	sw	s2,32(sp)
c000aa28:	01312e23          	sw	s3,28(sp)
c000aa2c:	01412c23          	sw	s4,24(sp)
c000aa30:	01512a23          	sw	s5,20(sp)
c000aa34:	01612823          	sw	s6,16(sp)
c000aa38:	01712623          	sw	s7,12(sp)
c000aa3c:	01812423          	sw	s8,8(sp)
c000aa40:	00058413          	mv	s0,a1
c000aa44:	1a050063          	beqz	a0,c000abe4 <skew_heap_merge.constprop.3+0x1d0>
c000aa48:	00050493          	mv	s1,a0
c000aa4c:	00050793          	mv	a5,a0
c000aa50:	0a058863          	beqz	a1,c000ab00 <skew_heap_merge.constprop.3+0xec>
c000aa54:	f35ff0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000aa58:	fff00993          	li	s3,-1
c000aa5c:	00050913          	mv	s2,a0
c000aa60:	13350a63          	beq	a0,s3,c000ab94 <skew_heap_merge.constprop.3+0x180>
c000aa64:	00842903          	lw	s2,8(s0)
c000aa68:	00442a83          	lw	s5,4(s0)
c000aa6c:	0e090463          	beqz	s2,c000ab54 <skew_heap_merge.constprop.3+0x140>
c000aa70:	00090593          	mv	a1,s2
c000aa74:	00048513          	mv	a0,s1
c000aa78:	f11ff0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000aa7c:	0b350c63          	beq	a0,s3,c000ab34 <skew_heap_merge.constprop.3+0x120>
c000aa80:	00892a03          	lw	s4,8(s2)
c000aa84:	00492b83          	lw	s7,4(s2)
c000aa88:	100a0263          	beqz	s4,c000ab8c <skew_heap_merge.constprop.3+0x178>
c000aa8c:	000a0593          	mv	a1,s4
c000aa90:	00048513          	mv	a0,s1
c000aa94:	ef5ff0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000aa98:	0d350a63          	beq	a0,s3,c000ab6c <skew_heap_merge.constprop.3+0x158>
c000aa9c:	008a2b03          	lw	s6,8(s4)
c000aaa0:	004a2c03          	lw	s8,4(s4)
c000aaa4:	160b0463          	beqz	s6,c000ac0c <skew_heap_merge.constprop.3+0x1f8>
c000aaa8:	000b0593          	mv	a1,s6
c000aaac:	00048513          	mv	a0,s1
c000aab0:	ed9ff0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000aab4:	13350c63          	beq	a0,s3,c000abec <skew_heap_merge.constprop.3+0x1d8>
c000aab8:	008b2583          	lw	a1,8(s6)
c000aabc:	004b2983          	lw	s3,4(s6)
c000aac0:	00048513          	mv	a0,s1
c000aac4:	f51ff0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000aac8:	00ab2223          	sw	a0,4(s6)
c000aacc:	013b2423          	sw	s3,8(s6)
c000aad0:	00050463          	beqz	a0,c000aad8 <skew_heap_merge.constprop.3+0xc4>
c000aad4:	01652023          	sw	s6,0(a0)
c000aad8:	016a2223          	sw	s6,4(s4)
c000aadc:	018a2423          	sw	s8,8(s4)
c000aae0:	014b2023          	sw	s4,0(s6)
c000aae4:	01492223          	sw	s4,4(s2)
c000aae8:	01792423          	sw	s7,8(s2)
c000aaec:	012a2023          	sw	s2,0(s4)
c000aaf0:	01242223          	sw	s2,4(s0)
c000aaf4:	01542423          	sw	s5,8(s0)
c000aaf8:	00892023          	sw	s0,0(s2)
c000aafc:	00040793          	mv	a5,s0
c000ab00:	02c12083          	lw	ra,44(sp)
c000ab04:	00078513          	mv	a0,a5
c000ab08:	02812403          	lw	s0,40(sp)
c000ab0c:	02412483          	lw	s1,36(sp)
c000ab10:	02012903          	lw	s2,32(sp)
c000ab14:	01c12983          	lw	s3,28(sp)
c000ab18:	01812a03          	lw	s4,24(sp)
c000ab1c:	01412a83          	lw	s5,20(sp)
c000ab20:	01012b03          	lw	s6,16(sp)
c000ab24:	00c12b83          	lw	s7,12(sp)
c000ab28:	00812c03          	lw	s8,8(sp)
c000ab2c:	03010113          	addi	sp,sp,48
c000ab30:	00008067          	ret
c000ab34:	0084a503          	lw	a0,8(s1)
c000ab38:	0044a983          	lw	s3,4(s1)
c000ab3c:	00090593          	mv	a1,s2
c000ab40:	ed5ff0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000ab44:	00a4a223          	sw	a0,4(s1)
c000ab48:	0134a423          	sw	s3,8(s1)
c000ab4c:	00050463          	beqz	a0,c000ab54 <skew_heap_merge.constprop.3+0x140>
c000ab50:	00952023          	sw	s1,0(a0)
c000ab54:	00048913          	mv	s2,s1
c000ab58:	01242223          	sw	s2,4(s0)
c000ab5c:	01542423          	sw	s5,8(s0)
c000ab60:	00892023          	sw	s0,0(s2)
c000ab64:	00040793          	mv	a5,s0
c000ab68:	f99ff06f          	j	c000ab00 <skew_heap_merge.constprop.3+0xec>
c000ab6c:	0084a503          	lw	a0,8(s1)
c000ab70:	0044a983          	lw	s3,4(s1)
c000ab74:	000a0593          	mv	a1,s4
c000ab78:	e9dff0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000ab7c:	00a4a223          	sw	a0,4(s1)
c000ab80:	0134a423          	sw	s3,8(s1)
c000ab84:	00050463          	beqz	a0,c000ab8c <skew_heap_merge.constprop.3+0x178>
c000ab88:	00952023          	sw	s1,0(a0)
c000ab8c:	00048a13          	mv	s4,s1
c000ab90:	f55ff06f          	j	c000aae4 <skew_heap_merge.constprop.3+0xd0>
c000ab94:	0084a983          	lw	s3,8(s1)
c000ab98:	0044aa03          	lw	s4,4(s1)
c000ab9c:	02098a63          	beqz	s3,c000abd0 <skew_heap_merge.constprop.3+0x1bc>
c000aba0:	00040593          	mv	a1,s0
c000aba4:	00098513          	mv	a0,s3
c000aba8:	de1ff0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000abac:	07250463          	beq	a0,s2,c000ac14 <skew_heap_merge.constprop.3+0x200>
c000abb0:	00842583          	lw	a1,8(s0)
c000abb4:	00442903          	lw	s2,4(s0)
c000abb8:	00098513          	mv	a0,s3
c000abbc:	e59ff0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000abc0:	00a42223          	sw	a0,4(s0)
c000abc4:	01242423          	sw	s2,8(s0)
c000abc8:	00050463          	beqz	a0,c000abd0 <skew_heap_merge.constprop.3+0x1bc>
c000abcc:	00852023          	sw	s0,0(a0)
c000abd0:	0084a223          	sw	s0,4(s1)
c000abd4:	0144a423          	sw	s4,8(s1)
c000abd8:	00942023          	sw	s1,0(s0)
c000abdc:	00048793          	mv	a5,s1
c000abe0:	f21ff06f          	j	c000ab00 <skew_heap_merge.constprop.3+0xec>
c000abe4:	00058793          	mv	a5,a1
c000abe8:	f19ff06f          	j	c000ab00 <skew_heap_merge.constprop.3+0xec>
c000abec:	0084a503          	lw	a0,8(s1)
c000abf0:	0044a983          	lw	s3,4(s1)
c000abf4:	000b0593          	mv	a1,s6
c000abf8:	e1dff0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000abfc:	00a4a223          	sw	a0,4(s1)
c000ac00:	0134a423          	sw	s3,8(s1)
c000ac04:	00050463          	beqz	a0,c000ac0c <skew_heap_merge.constprop.3+0x1f8>
c000ac08:	00952023          	sw	s1,0(a0)
c000ac0c:	00048b13          	mv	s6,s1
c000ac10:	ec9ff06f          	j	c000aad8 <skew_heap_merge.constprop.3+0xc4>
c000ac14:	0089a503          	lw	a0,8(s3)
c000ac18:	0049a903          	lw	s2,4(s3)
c000ac1c:	00040593          	mv	a1,s0
c000ac20:	df5ff0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000ac24:	00a9a223          	sw	a0,4(s3)
c000ac28:	0129a423          	sw	s2,8(s3)
c000ac2c:	00050863          	beqz	a0,c000ac3c <skew_heap_merge.constprop.3+0x228>
c000ac30:	01352023          	sw	s3,0(a0)
c000ac34:	00098413          	mv	s0,s3
c000ac38:	f99ff06f          	j	c000abd0 <skew_heap_merge.constprop.3+0x1bc>
c000ac3c:	00098413          	mv	s0,s3
c000ac40:	f91ff06f          	j	c000abd0 <skew_heap_merge.constprop.3+0x1bc>

c000ac44 <stride_enqueue>:
c000ac44:	fb010113          	addi	sp,sp,-80
c000ac48:	03312e23          	sw	s3,60(sp)
c000ac4c:	01052983          	lw	s3,16(a0)
c000ac50:	04812423          	sw	s0,72(sp)
c000ac54:	04912223          	sw	s1,68(sp)
c000ac58:	05212023          	sw	s2,64(sp)
c000ac5c:	04112623          	sw	ra,76(sp)
c000ac60:	03412c23          	sw	s4,56(sp)
c000ac64:	03512a23          	sw	s5,52(sp)
c000ac68:	03612823          	sw	s6,48(sp)
c000ac6c:	03712623          	sw	s7,44(sp)
c000ac70:	03812423          	sw	s8,40(sp)
c000ac74:	03912223          	sw	s9,36(sp)
c000ac78:	03a12023          	sw	s10,32(sp)
c000ac7c:	01b12e23          	sw	s11,28(sp)
c000ac80:	0c05a423          	sw	zero,200(a1)
c000ac84:	0c05a823          	sw	zero,208(a1)
c000ac88:	0c05a623          	sw	zero,204(a1)
c000ac8c:	00050493          	mv	s1,a0
c000ac90:	00058413          	mv	s0,a1
c000ac94:	0c858913          	addi	s2,a1,200
c000ac98:	02098463          	beqz	s3,c000acc0 <stride_enqueue+0x7c>
c000ac9c:	0c090263          	beqz	s2,c000ad60 <stride_enqueue+0x11c>
c000aca0:	00090593          	mv	a1,s2
c000aca4:	00098513          	mv	a0,s3
c000aca8:	ce1ff0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000acac:	fff00793          	li	a5,-1
c000acb0:	00050a13          	mv	s4,a0
c000acb4:	06f50863          	beq	a0,a5,c000ad24 <stride_enqueue+0xe0>
c000acb8:	0d342623          	sw	s3,204(s0)
c000acbc:	0129a023          	sw	s2,0(s3)
c000acc0:	0c442783          	lw	a5,196(s0)
c000acc4:	0124a823          	sw	s2,16(s1)
c000acc8:	00c4a703          	lw	a4,12(s1)
c000accc:	00078463          	beqz	a5,c000acd4 <stride_enqueue+0x90>
c000acd0:	00f75463          	ble	a5,a4,c000acd8 <stride_enqueue+0x94>
c000acd4:	0ce42223          	sw	a4,196(s0)
c000acd8:	0084a783          	lw	a5,8(s1)
c000acdc:	04c12083          	lw	ra,76(sp)
c000ace0:	0a942c23          	sw	s1,184(s0)
c000ace4:	00178793          	addi	a5,a5,1
c000ace8:	00f4a423          	sw	a5,8(s1)
c000acec:	04812403          	lw	s0,72(sp)
c000acf0:	04412483          	lw	s1,68(sp)
c000acf4:	04012903          	lw	s2,64(sp)
c000acf8:	03c12983          	lw	s3,60(sp)
c000acfc:	03812a03          	lw	s4,56(sp)
c000ad00:	03412a83          	lw	s5,52(sp)
c000ad04:	03012b03          	lw	s6,48(sp)
c000ad08:	02c12b83          	lw	s7,44(sp)
c000ad0c:	02812c03          	lw	s8,40(sp)
c000ad10:	02412c83          	lw	s9,36(sp)
c000ad14:	02012d03          	lw	s10,32(sp)
c000ad18:	01c12d83          	lw	s11,28(sp)
c000ad1c:	05010113          	addi	sp,sp,80
c000ad20:	00008067          	ret
c000ad24:	0089aa83          	lw	s5,8(s3)
c000ad28:	0049ab03          	lw	s6,4(s3)
c000ad2c:	020a8063          	beqz	s5,c000ad4c <stride_enqueue+0x108>
c000ad30:	00090593          	mv	a1,s2
c000ad34:	000a8513          	mv	a0,s5
c000ad38:	c51ff0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000ad3c:	00050b93          	mv	s7,a0
c000ad40:	03450463          	beq	a0,s4,c000ad68 <stride_enqueue+0x124>
c000ad44:	0d542623          	sw	s5,204(s0)
c000ad48:	012aa023          	sw	s2,0(s5)
c000ad4c:	0129a223          	sw	s2,4(s3)
c000ad50:	0169a423          	sw	s6,8(s3)
c000ad54:	01392023          	sw	s3,0(s2)
c000ad58:	00098913          	mv	s2,s3
c000ad5c:	f65ff06f          	j	c000acc0 <stride_enqueue+0x7c>
c000ad60:	00098913          	mv	s2,s3
c000ad64:	f5dff06f          	j	c000acc0 <stride_enqueue+0x7c>
c000ad68:	008aaa03          	lw	s4,8(s5)
c000ad6c:	004aac03          	lw	s8,4(s5)
c000ad70:	020a0063          	beqz	s4,c000ad90 <stride_enqueue+0x14c>
c000ad74:	00090593          	mv	a1,s2
c000ad78:	000a0513          	mv	a0,s4
c000ad7c:	c0dff0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000ad80:	00050c93          	mv	s9,a0
c000ad84:	03750063          	beq	a0,s7,c000ada4 <stride_enqueue+0x160>
c000ad88:	0d442623          	sw	s4,204(s0)
c000ad8c:	012a2023          	sw	s2,0(s4)
c000ad90:	012aa223          	sw	s2,4(s5)
c000ad94:	018aa423          	sw	s8,8(s5)
c000ad98:	01592023          	sw	s5,0(s2)
c000ad9c:	000a8913          	mv	s2,s5
c000ada0:	fadff06f          	j	c000ad4c <stride_enqueue+0x108>
c000ada4:	008a2b83          	lw	s7,8(s4)
c000ada8:	004a2d03          	lw	s10,4(s4)
c000adac:	000b8e63          	beqz	s7,c000adc8 <stride_enqueue+0x184>
c000adb0:	00090593          	mv	a1,s2
c000adb4:	000b8513          	mv	a0,s7
c000adb8:	bd1ff0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000adbc:	03950063          	beq	a0,s9,c000addc <stride_enqueue+0x198>
c000adc0:	0d742623          	sw	s7,204(s0)
c000adc4:	012ba023          	sw	s2,0(s7)
c000adc8:	012a2223          	sw	s2,4(s4)
c000adcc:	01aa2423          	sw	s10,8(s4)
c000add0:	01492023          	sw	s4,0(s2)
c000add4:	000a0913          	mv	s2,s4
c000add8:	fb9ff06f          	j	c000ad90 <stride_enqueue+0x14c>
c000addc:	008bac83          	lw	s9,8(s7)
c000ade0:	004bad83          	lw	s11,4(s7)
c000ade4:	020c8a63          	beqz	s9,c000ae18 <stride_enqueue+0x1d4>
c000ade8:	00090593          	mv	a1,s2
c000adec:	000c8513          	mv	a0,s9
c000adf0:	b99ff0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000adf4:	fff00793          	li	a5,-1
c000adf8:	02f50a63          	beq	a0,a5,c000ae2c <stride_enqueue+0x1e8>
c000adfc:	00000593          	li	a1,0
c000ae00:	000c8513          	mv	a0,s9
c000ae04:	c11ff0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000ae08:	0ca42623          	sw	a0,204(s0)
c000ae0c:	0c042823          	sw	zero,208(s0)
c000ae10:	00050463          	beqz	a0,c000ae18 <stride_enqueue+0x1d4>
c000ae14:	01252023          	sw	s2,0(a0)
c000ae18:	012ba223          	sw	s2,4(s7)
c000ae1c:	01bba423          	sw	s11,8(s7)
c000ae20:	01792023          	sw	s7,0(s2)
c000ae24:	000b8913          	mv	s2,s7
c000ae28:	fa1ff06f          	j	c000adc8 <stride_enqueue+0x184>
c000ae2c:	004ca783          	lw	a5,4(s9) # 1004 <_binary_bin_swap_img_size-0x6cfc>
c000ae30:	008ca503          	lw	a0,8(s9)
c000ae34:	00090593          	mv	a1,s2
c000ae38:	00f12623          	sw	a5,12(sp)
c000ae3c:	bd9ff0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000ae40:	00c12783          	lw	a5,12(sp)
c000ae44:	00aca223          	sw	a0,4(s9)
c000ae48:	00fca423          	sw	a5,8(s9)
c000ae4c:	00050863          	beqz	a0,c000ae5c <stride_enqueue+0x218>
c000ae50:	01952023          	sw	s9,0(a0)
c000ae54:	000c8913          	mv	s2,s9
c000ae58:	fc1ff06f          	j	c000ae18 <stride_enqueue+0x1d4>
c000ae5c:	000c8913          	mv	s2,s9
c000ae60:	fb9ff06f          	j	c000ae18 <stride_enqueue+0x1d4>

c000ae64 <stride_dequeue>:
c000ae64:	f8010113          	addi	sp,sp,-128
c000ae68:	05712e23          	sw	s7,92(sp)
c000ae6c:	0b85ab83          	lw	s7,184(a1)
c000ae70:	06112e23          	sw	ra,124(sp)
c000ae74:	06812c23          	sw	s0,120(sp)
c000ae78:	06912a23          	sw	s1,116(sp)
c000ae7c:	07212823          	sw	s2,112(sp)
c000ae80:	07312623          	sw	s3,108(sp)
c000ae84:	07412423          	sw	s4,104(sp)
c000ae88:	07512223          	sw	s5,100(sp)
c000ae8c:	07612023          	sw	s6,96(sp)
c000ae90:	05812c23          	sw	s8,88(sp)
c000ae94:	05912a23          	sw	s9,84(sp)
c000ae98:	05a12823          	sw	s10,80(sp)
c000ae9c:	05b12623          	sw	s11,76(sp)
c000aea0:	00ab8463          	beq	s7,a0,c000aea8 <stride_dequeue+0x44>
c000aea4:	7f40206f          	j	c000d698 <stride_dequeue+0x2834>
c000aea8:	008ba403          	lw	s0,8(s7)
c000aeac:	00040c13          	mv	s8,s0
c000aeb0:	00041463          	bnez	s0,c000aeb8 <stride_dequeue+0x54>
c000aeb4:	7e40206f          	j	c000d698 <stride_dequeue+0x2834>
c000aeb8:	0cc5ac83          	lw	s9,204(a1)
c000aebc:	010ba483          	lw	s1,16(s7)
c000aec0:	0c858913          	addi	s2,a1,200
c000aec4:	0c85aa03          	lw	s4,200(a1)
c000aec8:	0d05a983          	lw	s3,208(a1)
c000aecc:	6a0c8a63          	beqz	s9,c000b580 <stride_dequeue+0x71c>
c000aed0:	26098a63          	beqz	s3,c000b144 <stride_dequeue+0x2e0>
c000aed4:	00098593          	mv	a1,s3
c000aed8:	000c8513          	mv	a0,s9
c000aedc:	aadff0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000aee0:	fff00a93          	li	s5,-1
c000aee4:	00050b13          	mv	s6,a0
c000aee8:	47550063          	beq	a0,s5,c000b348 <stride_dequeue+0x4e4>
c000aeec:	0049a783          	lw	a5,4(s3)
c000aef0:	0089ad03          	lw	s10,8(s3)
c000aef4:	00f12423          	sw	a5,8(sp)
c000aef8:	220d0c63          	beqz	s10,c000b130 <stride_dequeue+0x2cc>
c000aefc:	000d0593          	mv	a1,s10
c000af00:	000c8513          	mv	a0,s9
c000af04:	a85ff0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000af08:	00050b13          	mv	s6,a0
c000af0c:	69550263          	beq	a0,s5,c000b590 <stride_dequeue+0x72c>
c000af10:	004d2783          	lw	a5,4(s10)
c000af14:	008d2b03          	lw	s6,8(s10)
c000af18:	00f12623          	sw	a5,12(sp)
c000af1c:	200b0063          	beqz	s6,c000b11c <stride_dequeue+0x2b8>
c000af20:	000b0593          	mv	a1,s6
c000af24:	000c8513          	mv	a0,s9
c000af28:	a61ff0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000af2c:	27550a63          	beq	a0,s5,c000b1a0 <stride_dequeue+0x33c>
c000af30:	004b2783          	lw	a5,4(s6)
c000af34:	008b2a83          	lw	s5,8(s6)
c000af38:	00f12823          	sw	a5,16(sp)
c000af3c:	1c0a8663          	beqz	s5,c000b108 <stride_dequeue+0x2a4>
c000af40:	000a8593          	mv	a1,s5
c000af44:	000c8513          	mv	a0,s9
c000af48:	a41ff0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000af4c:	fff00793          	li	a5,-1
c000af50:	00050d93          	mv	s11,a0
c000af54:	32f50ae3          	beq	a0,a5,c000ba88 <stride_dequeue+0xc24>
c000af58:	00f12c23          	sw	a5,24(sp)
c000af5c:	004aa783          	lw	a5,4(s5)
c000af60:	008aad83          	lw	s11,8(s5)
c000af64:	00f12a23          	sw	a5,20(sp)
c000af68:	180d8663          	beqz	s11,c000b0f4 <stride_dequeue+0x290>
c000af6c:	000d8593          	mv	a1,s11
c000af70:	000c8513          	mv	a0,s9
c000af74:	a15ff0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000af78:	01812783          	lw	a5,24(sp)
c000af7c:	00f500e3          	beq	a0,a5,c000b77c <stride_dequeue+0x918>
c000af80:	00f12e23          	sw	a5,28(sp)
c000af84:	004da783          	lw	a5,4(s11)
c000af88:	008dae03          	lw	t3,8(s11)
c000af8c:	00f12c23          	sw	a5,24(sp)
c000af90:	140e0863          	beqz	t3,c000b0e0 <stride_dequeue+0x27c>
c000af94:	000e0593          	mv	a1,t3
c000af98:	000c8513          	mv	a0,s9
c000af9c:	03c12023          	sw	t3,32(sp)
c000afa0:	9e9ff0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000afa4:	01c12783          	lw	a5,28(sp)
c000afa8:	02012e03          	lw	t3,32(sp)
c000afac:	00f51463          	bne	a0,a5,c000afb4 <stride_dequeue+0x150>
c000afb0:	4780106f          	j	c000c428 <stride_dequeue+0x15c4>
c000afb4:	02f12023          	sw	a5,32(sp)
c000afb8:	004e2783          	lw	a5,4(t3)
c000afbc:	008e2403          	lw	s0,8(t3)
c000afc0:	00f12e23          	sw	a5,28(sp)
c000afc4:	10040463          	beqz	s0,c000b0cc <stride_dequeue+0x268>
c000afc8:	00040593          	mv	a1,s0
c000afcc:	000c8513          	mv	a0,s9
c000afd0:	03c12223          	sw	t3,36(sp)
c000afd4:	9b5ff0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000afd8:	02012783          	lw	a5,32(sp)
c000afdc:	02412e03          	lw	t3,36(sp)
c000afe0:	00f51463          	bne	a0,a5,c000afe8 <stride_dequeue+0x184>
c000afe4:	3ad0106f          	j	c000cb90 <stride_dequeue+0x1d2c>
c000afe8:	02f12223          	sw	a5,36(sp)
c000afec:	00442783          	lw	a5,4(s0)
c000aff0:	00842f03          	lw	t5,8(s0)
c000aff4:	02f12023          	sw	a5,32(sp)
c000aff8:	0c0f0063          	beqz	t5,c000b0b8 <stride_dequeue+0x254>
c000affc:	000f0593          	mv	a1,t5
c000b000:	000c8513          	mv	a0,s9
c000b004:	03c12623          	sw	t3,44(sp)
c000b008:	03e12423          	sw	t5,40(sp)
c000b00c:	97dff0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000b010:	02412783          	lw	a5,36(sp)
c000b014:	02812f03          	lw	t5,40(sp)
c000b018:	02c12e03          	lw	t3,44(sp)
c000b01c:	00f51463          	bne	a0,a5,c000b024 <stride_dequeue+0x1c0>
c000b020:	16c0206f          	j	c000d18c <stride_dequeue+0x2328>
c000b024:	004f2783          	lw	a5,4(t5)
c000b028:	008f2f83          	lw	t6,8(t5)
c000b02c:	02f12223          	sw	a5,36(sp)
c000b030:	060f8a63          	beqz	t6,c000b0a4 <stride_dequeue+0x240>
c000b034:	000f8593          	mv	a1,t6
c000b038:	000c8513          	mv	a0,s9
c000b03c:	03e12823          	sw	t5,48(sp)
c000b040:	03c12623          	sw	t3,44(sp)
c000b044:	03f12423          	sw	t6,40(sp)
c000b048:	941ff0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000b04c:	fff00593          	li	a1,-1
c000b050:	02812f83          	lw	t6,40(sp)
c000b054:	02c12e03          	lw	t3,44(sp)
c000b058:	03012f03          	lw	t5,48(sp)
c000b05c:	00b51463          	bne	a0,a1,c000b064 <stride_dequeue+0x200>
c000b060:	5080206f          	j	c000d568 <stride_dequeue+0x2704>
c000b064:	008fa583          	lw	a1,8(t6)
c000b068:	000c8513          	mv	a0,s9
c000b06c:	004fac03          	lw	s8,4(t6)
c000b070:	03e12823          	sw	t5,48(sp)
c000b074:	03c12623          	sw	t3,44(sp)
c000b078:	03f12423          	sw	t6,40(sp)
c000b07c:	999ff0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000b080:	02812f83          	lw	t6,40(sp)
c000b084:	02c12e03          	lw	t3,44(sp)
c000b088:	03012f03          	lw	t5,48(sp)
c000b08c:	018fa423          	sw	s8,8(t6)
c000b090:	00afa223          	sw	a0,4(t6)
c000b094:	008bac03          	lw	s8,8(s7)
c000b098:	00050463          	beqz	a0,c000b0a0 <stride_dequeue+0x23c>
c000b09c:	01f52023          	sw	t6,0(a0)
c000b0a0:	000f8c93          	mv	s9,t6
c000b0a4:	02412783          	lw	a5,36(sp)
c000b0a8:	019f2223          	sw	s9,4(t5)
c000b0ac:	00ff2423          	sw	a5,8(t5)
c000b0b0:	01eca023          	sw	t5,0(s9)
c000b0b4:	000f0c93          	mv	s9,t5
c000b0b8:	02012783          	lw	a5,32(sp)
c000b0bc:	01942223          	sw	s9,4(s0)
c000b0c0:	00f42423          	sw	a5,8(s0)
c000b0c4:	008ca023          	sw	s0,0(s9)
c000b0c8:	00040c93          	mv	s9,s0
c000b0cc:	01c12783          	lw	a5,28(sp)
c000b0d0:	019e2223          	sw	s9,4(t3)
c000b0d4:	00fe2423          	sw	a5,8(t3)
c000b0d8:	01cca023          	sw	t3,0(s9)
c000b0dc:	000e0c93          	mv	s9,t3
c000b0e0:	01812783          	lw	a5,24(sp)
c000b0e4:	019da223          	sw	s9,4(s11)
c000b0e8:	00fda423          	sw	a5,8(s11)
c000b0ec:	01bca023          	sw	s11,0(s9)
c000b0f0:	000d8c93          	mv	s9,s11
c000b0f4:	01412783          	lw	a5,20(sp)
c000b0f8:	019aa223          	sw	s9,4(s5)
c000b0fc:	00faa423          	sw	a5,8(s5)
c000b100:	015ca023          	sw	s5,0(s9)
c000b104:	000a8c93          	mv	s9,s5
c000b108:	01012783          	lw	a5,16(sp)
c000b10c:	019b2223          	sw	s9,4(s6)
c000b110:	00fb2423          	sw	a5,8(s6)
c000b114:	016ca023          	sw	s6,0(s9)
c000b118:	000b0c93          	mv	s9,s6
c000b11c:	00c12783          	lw	a5,12(sp)
c000b120:	019d2223          	sw	s9,4(s10)
c000b124:	00fd2423          	sw	a5,8(s10)
c000b128:	01aca023          	sw	s10,0(s9)
c000b12c:	000d0c93          	mv	s9,s10
c000b130:	00812783          	lw	a5,8(sp)
c000b134:	0199a223          	sw	s9,4(s3)
c000b138:	00f9a423          	sw	a5,8(s3)
c000b13c:	013ca023          	sw	s3,0(s9)
c000b140:	00098c93          	mv	s9,s3
c000b144:	014ca023          	sw	s4,0(s9)
c000b148:	420a0863          	beqz	s4,c000b578 <stride_dequeue+0x714>
c000b14c:	004a2703          	lw	a4,4(s4)
c000b150:	62e90263          	beq	s2,a4,c000b774 <stride_dequeue+0x910>
c000b154:	019a2423          	sw	s9,8(s4)
c000b158:	07c12083          	lw	ra,124(sp)
c000b15c:	fffc0c13          	addi	s8,s8,-1
c000b160:	009ba823          	sw	s1,16(s7)
c000b164:	018ba423          	sw	s8,8(s7)
c000b168:	07812403          	lw	s0,120(sp)
c000b16c:	07412483          	lw	s1,116(sp)
c000b170:	07012903          	lw	s2,112(sp)
c000b174:	06c12983          	lw	s3,108(sp)
c000b178:	06812a03          	lw	s4,104(sp)
c000b17c:	06412a83          	lw	s5,100(sp)
c000b180:	06012b03          	lw	s6,96(sp)
c000b184:	05c12b83          	lw	s7,92(sp)
c000b188:	05812c03          	lw	s8,88(sp)
c000b18c:	05412c83          	lw	s9,84(sp)
c000b190:	05012d03          	lw	s10,80(sp)
c000b194:	04c12d83          	lw	s11,76(sp)
c000b198:	08010113          	addi	sp,sp,128
c000b19c:	00008067          	ret
c000b1a0:	004ca783          	lw	a5,4(s9)
c000b1a4:	008caa83          	lw	s5,8(s9)
c000b1a8:	00f12823          	sw	a5,16(sp)
c000b1ac:	180a8463          	beqz	s5,c000b334 <stride_dequeue+0x4d0>
c000b1b0:	000b0593          	mv	a1,s6
c000b1b4:	000a8513          	mv	a0,s5
c000b1b8:	fd0ff0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000b1bc:	fff00713          	li	a4,-1
c000b1c0:	00050d93          	mv	s11,a0
c000b1c4:	00e51463          	bne	a0,a4,c000b1cc <stride_dequeue+0x368>
c000b1c8:	7b90006f          	j	c000c180 <stride_dequeue+0x131c>
c000b1cc:	004b2783          	lw	a5,4(s6)
c000b1d0:	008b2d83          	lw	s11,8(s6)
c000b1d4:	00e12c23          	sw	a4,24(sp)
c000b1d8:	00f12a23          	sw	a5,20(sp)
c000b1dc:	140d8463          	beqz	s11,c000b324 <stride_dequeue+0x4c0>
c000b1e0:	000d8593          	mv	a1,s11
c000b1e4:	000a8513          	mv	a0,s5
c000b1e8:	fa0ff0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000b1ec:	01812703          	lw	a4,24(sp)
c000b1f0:	00e51463          	bne	a0,a4,c000b1f8 <stride_dequeue+0x394>
c000b1f4:	2a80106f          	j	c000c49c <stride_dequeue+0x1638>
c000b1f8:	004da783          	lw	a5,4(s11)
c000b1fc:	008dae83          	lw	t4,8(s11)
c000b200:	00e12e23          	sw	a4,28(sp)
c000b204:	00f12c23          	sw	a5,24(sp)
c000b208:	100e8463          	beqz	t4,c000b310 <stride_dequeue+0x4ac>
c000b20c:	000e8593          	mv	a1,t4
c000b210:	000a8513          	mv	a0,s5
c000b214:	03d12023          	sw	t4,32(sp)
c000b218:	f70ff0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000b21c:	01c12703          	lw	a4,28(sp)
c000b220:	02012e83          	lw	t4,32(sp)
c000b224:	00e51463          	bne	a0,a4,c000b22c <stride_dequeue+0x3c8>
c000b228:	3b50106f          	j	c000cddc <stride_dequeue+0x1f78>
c000b22c:	02e12023          	sw	a4,32(sp)
c000b230:	004ea703          	lw	a4,4(t4)
c000b234:	008ea783          	lw	a5,8(t4)
c000b238:	00e12e23          	sw	a4,28(sp)
c000b23c:	0c078063          	beqz	a5,c000b2fc <stride_dequeue+0x498>
c000b240:	00078593          	mv	a1,a5
c000b244:	000a8513          	mv	a0,s5
c000b248:	03d12423          	sw	t4,40(sp)
c000b24c:	02f12223          	sw	a5,36(sp)
c000b250:	f38ff0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000b254:	02012703          	lw	a4,32(sp)
c000b258:	02412783          	lw	a5,36(sp)
c000b25c:	02812e83          	lw	t4,40(sp)
c000b260:	00e51463          	bne	a0,a4,c000b268 <stride_dequeue+0x404>
c000b264:	0840206f          	j	c000d2e8 <stride_dequeue+0x2484>
c000b268:	0087af03          	lw	t5,8(a5)
c000b26c:	02e12023          	sw	a4,32(sp)
c000b270:	0047ac03          	lw	s8,4(a5)
c000b274:	000f1463          	bnez	t5,c000b27c <stride_dequeue+0x418>
c000b278:	3380206f          	j	c000d5b0 <stride_dequeue+0x274c>
c000b27c:	000f0593          	mv	a1,t5
c000b280:	000a8513          	mv	a0,s5
c000b284:	02f12623          	sw	a5,44(sp)
c000b288:	03d12423          	sw	t4,40(sp)
c000b28c:	03e12223          	sw	t5,36(sp)
c000b290:	ef8ff0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000b294:	02012703          	lw	a4,32(sp)
c000b298:	02412f03          	lw	t5,36(sp)
c000b29c:	02812e83          	lw	t4,40(sp)
c000b2a0:	02c12783          	lw	a5,44(sp)
c000b2a4:	00e51463          	bne	a0,a4,c000b2ac <stride_dequeue+0x448>
c000b2a8:	54c0206f          	j	c000d7f4 <stride_dequeue+0x2990>
c000b2ac:	008f2583          	lw	a1,8(t5)
c000b2b0:	000a8513          	mv	a0,s5
c000b2b4:	004f2403          	lw	s0,4(t5)
c000b2b8:	02f12423          	sw	a5,40(sp)
c000b2bc:	03d12223          	sw	t4,36(sp)
c000b2c0:	03e12023          	sw	t5,32(sp)
c000b2c4:	f50ff0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000b2c8:	02012f03          	lw	t5,32(sp)
c000b2cc:	02412e83          	lw	t4,36(sp)
c000b2d0:	02812783          	lw	a5,40(sp)
c000b2d4:	00af2223          	sw	a0,4(t5)
c000b2d8:	008f2423          	sw	s0,8(t5)
c000b2dc:	00050463          	beqz	a0,c000b2e4 <stride_dequeue+0x480>
c000b2e0:	01e52023          	sw	t5,0(a0)
c000b2e4:	008ba403          	lw	s0,8(s7)
c000b2e8:	0187a423          	sw	s8,8(a5)
c000b2ec:	01e7a223          	sw	t5,4(a5)
c000b2f0:	00ff2023          	sw	a5,0(t5)
c000b2f4:	00040c13          	mv	s8,s0
c000b2f8:	00078a93          	mv	s5,a5
c000b2fc:	01c12783          	lw	a5,28(sp)
c000b300:	015ea223          	sw	s5,4(t4)
c000b304:	00fea423          	sw	a5,8(t4)
c000b308:	01daa023          	sw	t4,0(s5)
c000b30c:	000e8a93          	mv	s5,t4
c000b310:	01812783          	lw	a5,24(sp)
c000b314:	015da223          	sw	s5,4(s11)
c000b318:	00fda423          	sw	a5,8(s11)
c000b31c:	01baa023          	sw	s11,0(s5)
c000b320:	000d8a93          	mv	s5,s11
c000b324:	01412783          	lw	a5,20(sp)
c000b328:	015b2223          	sw	s5,4(s6)
c000b32c:	00fb2423          	sw	a5,8(s6)
c000b330:	016aa023          	sw	s6,0(s5)
c000b334:	01012783          	lw	a5,16(sp)
c000b338:	016ca223          	sw	s6,4(s9)
c000b33c:	00fca423          	sw	a5,8(s9)
c000b340:	019b2023          	sw	s9,0(s6)
c000b344:	dd9ff06f          	j	c000b11c <stride_dequeue+0x2b8>
c000b348:	004ca783          	lw	a5,4(s9)
c000b34c:	008cad03          	lw	s10,8(s9)
c000b350:	00f12423          	sw	a5,8(sp)
c000b354:	200d0663          	beqz	s10,c000b560 <stride_dequeue+0x6fc>
c000b358:	00098593          	mv	a1,s3
c000b35c:	000d0513          	mv	a0,s10
c000b360:	e28ff0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000b364:	00050a93          	mv	s5,a0
c000b368:	59650663          	beq	a0,s6,c000b8f4 <stride_dequeue+0xa90>
c000b36c:	0089ad83          	lw	s11,8(s3)
c000b370:	0049aa83          	lw	s5,4(s3)
c000b374:	1e0d8063          	beqz	s11,c000b554 <stride_dequeue+0x6f0>
c000b378:	000d8593          	mv	a1,s11
c000b37c:	000d0513          	mv	a0,s10
c000b380:	e08ff0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000b384:	076504e3          	beq	a0,s6,c000bbec <stride_dequeue+0xd88>
c000b388:	004da783          	lw	a5,4(s11)
c000b38c:	008dab03          	lw	s6,8(s11)
c000b390:	00f12623          	sw	a5,12(sp)
c000b394:	1a0b0663          	beqz	s6,c000b540 <stride_dequeue+0x6dc>
c000b398:	000b0593          	mv	a1,s6
c000b39c:	000d0513          	mv	a0,s10
c000b3a0:	de8ff0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000b3a4:	fff00313          	li	t1,-1
c000b3a8:	306500e3          	beq	a0,t1,c000bea8 <stride_dequeue+0x1044>
c000b3ac:	004b2783          	lw	a5,4(s6)
c000b3b0:	008b2883          	lw	a7,8(s6)
c000b3b4:	00612a23          	sw	t1,20(sp)
c000b3b8:	00f12823          	sw	a5,16(sp)
c000b3bc:	16088863          	beqz	a7,c000b52c <stride_dequeue+0x6c8>
c000b3c0:	00088593          	mv	a1,a7
c000b3c4:	000d0513          	mv	a0,s10
c000b3c8:	01112c23          	sw	a7,24(sp)
c000b3cc:	dbcff0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000b3d0:	01412303          	lw	t1,20(sp)
c000b3d4:	01812883          	lw	a7,24(sp)
c000b3d8:	00651463          	bne	a0,t1,c000b3e0 <stride_dequeue+0x57c>
c000b3dc:	4400106f          	j	c000c81c <stride_dequeue+0x19b8>
c000b3e0:	0048a783          	lw	a5,4(a7)
c000b3e4:	0088ae03          	lw	t3,8(a7)
c000b3e8:	00612c23          	sw	t1,24(sp)
c000b3ec:	00f12a23          	sw	a5,20(sp)
c000b3f0:	120e0463          	beqz	t3,c000b518 <stride_dequeue+0x6b4>
c000b3f4:	000e0593          	mv	a1,t3
c000b3f8:	000d0513          	mv	a0,s10
c000b3fc:	03112023          	sw	a7,32(sp)
c000b400:	01c12e23          	sw	t3,28(sp)
c000b404:	d84ff0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000b408:	01812303          	lw	t1,24(sp)
c000b40c:	01c12e03          	lw	t3,28(sp)
c000b410:	02012883          	lw	a7,32(sp)
c000b414:	00651463          	bne	a0,t1,c000b41c <stride_dequeue+0x5b8>
c000b418:	3750106f          	j	c000cf8c <stride_dequeue+0x2128>
c000b41c:	004e2783          	lw	a5,4(t3)
c000b420:	008e2e83          	lw	t4,8(t3)
c000b424:	00612e23          	sw	t1,28(sp)
c000b428:	00f12c23          	sw	a5,24(sp)
c000b42c:	0c0e8c63          	beqz	t4,c000b504 <stride_dequeue+0x6a0>
c000b430:	000e8593          	mv	a1,t4
c000b434:	000d0513          	mv	a0,s10
c000b438:	03c12423          	sw	t3,40(sp)
c000b43c:	03112223          	sw	a7,36(sp)
c000b440:	03d12023          	sw	t4,32(sp)
c000b444:	d44ff0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000b448:	01c12303          	lw	t1,28(sp)
c000b44c:	02012e83          	lw	t4,32(sp)
c000b450:	02412883          	lw	a7,36(sp)
c000b454:	02812e03          	lw	t3,40(sp)
c000b458:	00651463          	bne	a0,t1,c000b460 <stride_dequeue+0x5fc>
c000b45c:	6bd0106f          	j	c000d318 <stride_dequeue+0x24b4>
c000b460:	008eaf03          	lw	t5,8(t4)
c000b464:	00612e23          	sw	t1,28(sp)
c000b468:	004eac03          	lw	s8,4(t4)
c000b46c:	000f1463          	bnez	t5,c000b474 <stride_dequeue+0x610>
c000b470:	14c0206f          	j	c000d5bc <stride_dequeue+0x2758>
c000b474:	000f0593          	mv	a1,t5
c000b478:	000d0513          	mv	a0,s10
c000b47c:	03d12623          	sw	t4,44(sp)
c000b480:	03c12423          	sw	t3,40(sp)
c000b484:	03112223          	sw	a7,36(sp)
c000b488:	03e12023          	sw	t5,32(sp)
c000b48c:	cfcff0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000b490:	01c12303          	lw	t1,28(sp)
c000b494:	02012f03          	lw	t5,32(sp)
c000b498:	02412883          	lw	a7,36(sp)
c000b49c:	02812e03          	lw	t3,40(sp)
c000b4a0:	02c12e83          	lw	t4,44(sp)
c000b4a4:	00651463          	bne	a0,t1,c000b4ac <stride_dequeue+0x648>
c000b4a8:	2a80206f          	j	c000d750 <stride_dequeue+0x28ec>
c000b4ac:	008f2583          	lw	a1,8(t5)
c000b4b0:	000d0513          	mv	a0,s10
c000b4b4:	004f2403          	lw	s0,4(t5)
c000b4b8:	03d12423          	sw	t4,40(sp)
c000b4bc:	03c12223          	sw	t3,36(sp)
c000b4c0:	03112023          	sw	a7,32(sp)
c000b4c4:	01e12e23          	sw	t5,28(sp)
c000b4c8:	d4cff0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000b4cc:	01c12f03          	lw	t5,28(sp)
c000b4d0:	02012883          	lw	a7,32(sp)
c000b4d4:	02412e03          	lw	t3,36(sp)
c000b4d8:	00af2223          	sw	a0,4(t5)
c000b4dc:	008f2423          	sw	s0,8(t5)
c000b4e0:	02812e83          	lw	t4,40(sp)
c000b4e4:	00050463          	beqz	a0,c000b4ec <stride_dequeue+0x688>
c000b4e8:	01e52023          	sw	t5,0(a0)
c000b4ec:	008ba403          	lw	s0,8(s7)
c000b4f0:	018ea423          	sw	s8,8(t4)
c000b4f4:	01eea223          	sw	t5,4(t4)
c000b4f8:	01df2023          	sw	t4,0(t5)
c000b4fc:	00040c13          	mv	s8,s0
c000b500:	000e8d13          	mv	s10,t4
c000b504:	01812783          	lw	a5,24(sp)
c000b508:	01ae2223          	sw	s10,4(t3)
c000b50c:	00fe2423          	sw	a5,8(t3)
c000b510:	01cd2023          	sw	t3,0(s10)
c000b514:	000e0d13          	mv	s10,t3
c000b518:	01412783          	lw	a5,20(sp)
c000b51c:	01a8a223          	sw	s10,4(a7)
c000b520:	00f8a423          	sw	a5,8(a7)
c000b524:	011d2023          	sw	a7,0(s10)
c000b528:	00088d13          	mv	s10,a7
c000b52c:	01012783          	lw	a5,16(sp)
c000b530:	01ab2223          	sw	s10,4(s6)
c000b534:	00fb2423          	sw	a5,8(s6)
c000b538:	016d2023          	sw	s6,0(s10)
c000b53c:	000b0d13          	mv	s10,s6
c000b540:	00c12783          	lw	a5,12(sp)
c000b544:	01ada223          	sw	s10,4(s11)
c000b548:	00fda423          	sw	a5,8(s11)
c000b54c:	01bd2023          	sw	s11,0(s10)
c000b550:	000d8d13          	mv	s10,s11
c000b554:	01a9a223          	sw	s10,4(s3)
c000b558:	0159a423          	sw	s5,8(s3)
c000b55c:	013d2023          	sw	s3,0(s10)
c000b560:	00812783          	lw	a5,8(sp)
c000b564:	013ca223          	sw	s3,4(s9)
c000b568:	00fca423          	sw	a5,8(s9)
c000b56c:	0199a023          	sw	s9,0(s3)
c000b570:	014ca023          	sw	s4,0(s9)
c000b574:	bd5ff06f          	j	c000b148 <stride_dequeue+0x2e4>
c000b578:	000c8493          	mv	s1,s9
c000b57c:	bddff06f          	j	c000b158 <stride_dequeue+0x2f4>
c000b580:	bc0984e3          	beqz	s3,c000b148 <stride_dequeue+0x2e4>
c000b584:	00098c93          	mv	s9,s3
c000b588:	014ca023          	sw	s4,0(s9)
c000b58c:	bbdff06f          	j	c000b148 <stride_dequeue+0x2e4>
c000b590:	004ca783          	lw	a5,4(s9)
c000b594:	008caa83          	lw	s5,8(s9)
c000b598:	00f12623          	sw	a5,12(sp)
c000b59c:	1c0a8263          	beqz	s5,c000b760 <stride_dequeue+0x8fc>
c000b5a0:	000d0593          	mv	a1,s10
c000b5a4:	000a8513          	mv	a0,s5
c000b5a8:	be0ff0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000b5ac:	7b650063          	beq	a0,s6,c000bd4c <stride_dequeue+0xee8>
c000b5b0:	004d2783          	lw	a5,4(s10)
c000b5b4:	008d2b03          	lw	s6,8(s10)
c000b5b8:	00f12823          	sw	a5,16(sp)
c000b5bc:	180b0a63          	beqz	s6,c000b750 <stride_dequeue+0x8ec>
c000b5c0:	000b0593          	mv	a1,s6
c000b5c4:	000a8513          	mv	a0,s5
c000b5c8:	bc0ff0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000b5cc:	fff00793          	li	a5,-1
c000b5d0:	00050d93          	mv	s11,a0
c000b5d4:	24f508e3          	beq	a0,a5,c000c024 <stride_dequeue+0x11c0>
c000b5d8:	00f12c23          	sw	a5,24(sp)
c000b5dc:	004b2783          	lw	a5,4(s6)
c000b5e0:	008b2e03          	lw	t3,8(s6)
c000b5e4:	00f12a23          	sw	a5,20(sp)
c000b5e8:	140e0a63          	beqz	t3,c000b73c <stride_dequeue+0x8d8>
c000b5ec:	000e0593          	mv	a1,t3
c000b5f0:	000a8513          	mv	a0,s5
c000b5f4:	01c12e23          	sw	t3,28(sp)
c000b5f8:	b90ff0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000b5fc:	01812783          	lw	a5,24(sp)
c000b600:	00050d93          	mv	s11,a0
c000b604:	01c12e03          	lw	t3,28(sp)
c000b608:	00f51463          	bne	a0,a5,c000b610 <stride_dequeue+0x7ac>
c000b60c:	0540106f          	j	c000c660 <stride_dequeue+0x17fc>
c000b610:	00f12e23          	sw	a5,28(sp)
c000b614:	004e2783          	lw	a5,4(t3)
c000b618:	008e2d83          	lw	s11,8(t3)
c000b61c:	00f12c23          	sw	a5,24(sp)
c000b620:	100d8463          	beqz	s11,c000b728 <stride_dequeue+0x8c4>
c000b624:	000d8593          	mv	a1,s11
c000b628:	000a8513          	mv	a0,s5
c000b62c:	03c12023          	sw	t3,32(sp)
c000b630:	b58ff0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000b634:	01c12783          	lw	a5,28(sp)
c000b638:	02012e03          	lw	t3,32(sp)
c000b63c:	00f51463          	bne	a0,a5,c000b644 <stride_dequeue+0x7e0>
c000b640:	11d0106f          	j	c000cf5c <stride_dequeue+0x20f8>
c000b644:	02f12023          	sw	a5,32(sp)
c000b648:	004da783          	lw	a5,4(s11)
c000b64c:	008dae83          	lw	t4,8(s11)
c000b650:	00f12e23          	sw	a5,28(sp)
c000b654:	0c0e8063          	beqz	t4,c000b714 <stride_dequeue+0x8b0>
c000b658:	000e8593          	mv	a1,t4
c000b65c:	000a8513          	mv	a0,s5
c000b660:	03c12423          	sw	t3,40(sp)
c000b664:	03d12223          	sw	t4,36(sp)
c000b668:	b20ff0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000b66c:	02012783          	lw	a5,32(sp)
c000b670:	02412e83          	lw	t4,36(sp)
c000b674:	02812e03          	lw	t3,40(sp)
c000b678:	00f51463          	bne	a0,a5,c000b680 <stride_dequeue+0x81c>
c000b67c:	43d0106f          	j	c000d2b8 <stride_dequeue+0x2454>
c000b680:	008eaf03          	lw	t5,8(t4)
c000b684:	02f12023          	sw	a5,32(sp)
c000b688:	004eac03          	lw	s8,4(t4)
c000b68c:	000f1463          	bnez	t5,c000b694 <stride_dequeue+0x830>
c000b690:	77d0106f          	j	c000d60c <stride_dequeue+0x27a8>
c000b694:	000f0593          	mv	a1,t5
c000b698:	000a8513          	mv	a0,s5
c000b69c:	03d12623          	sw	t4,44(sp)
c000b6a0:	03c12423          	sw	t3,40(sp)
c000b6a4:	03e12223          	sw	t5,36(sp)
c000b6a8:	ae0ff0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000b6ac:	02012783          	lw	a5,32(sp)
c000b6b0:	02412f03          	lw	t5,36(sp)
c000b6b4:	02812e03          	lw	t3,40(sp)
c000b6b8:	02c12e83          	lw	t4,44(sp)
c000b6bc:	00f51463          	bne	a0,a5,c000b6c4 <stride_dequeue+0x860>
c000b6c0:	01c0206f          	j	c000d6dc <stride_dequeue+0x2878>
c000b6c4:	008f2583          	lw	a1,8(t5)
c000b6c8:	000a8513          	mv	a0,s5
c000b6cc:	004f2403          	lw	s0,4(t5)
c000b6d0:	03d12423          	sw	t4,40(sp)
c000b6d4:	03c12223          	sw	t3,36(sp)
c000b6d8:	03e12023          	sw	t5,32(sp)
c000b6dc:	b38ff0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000b6e0:	02012f03          	lw	t5,32(sp)
c000b6e4:	02412e03          	lw	t3,36(sp)
c000b6e8:	02812e83          	lw	t4,40(sp)
c000b6ec:	00af2223          	sw	a0,4(t5)
c000b6f0:	008f2423          	sw	s0,8(t5)
c000b6f4:	00050463          	beqz	a0,c000b6fc <stride_dequeue+0x898>
c000b6f8:	01e52023          	sw	t5,0(a0)
c000b6fc:	008ba403          	lw	s0,8(s7)
c000b700:	018ea423          	sw	s8,8(t4)
c000b704:	01eea223          	sw	t5,4(t4)
c000b708:	01df2023          	sw	t4,0(t5)
c000b70c:	00040c13          	mv	s8,s0
c000b710:	000e8a93          	mv	s5,t4
c000b714:	01c12783          	lw	a5,28(sp)
c000b718:	015da223          	sw	s5,4(s11)
c000b71c:	00fda423          	sw	a5,8(s11)
c000b720:	01baa023          	sw	s11,0(s5)
c000b724:	000d8a93          	mv	s5,s11
c000b728:	01812783          	lw	a5,24(sp)
c000b72c:	015e2223          	sw	s5,4(t3)
c000b730:	00fe2423          	sw	a5,8(t3)
c000b734:	01caa023          	sw	t3,0(s5)
c000b738:	000e0a93          	mv	s5,t3
c000b73c:	01412783          	lw	a5,20(sp)
c000b740:	015b2223          	sw	s5,4(s6)
c000b744:	00fb2423          	sw	a5,8(s6)
c000b748:	016aa023          	sw	s6,0(s5)
c000b74c:	000b0a93          	mv	s5,s6
c000b750:	01012783          	lw	a5,16(sp)
c000b754:	015d2223          	sw	s5,4(s10)
c000b758:	00fd2423          	sw	a5,8(s10)
c000b75c:	01aaa023          	sw	s10,0(s5)
c000b760:	00c12783          	lw	a5,12(sp)
c000b764:	01aca223          	sw	s10,4(s9)
c000b768:	00fca423          	sw	a5,8(s9)
c000b76c:	019d2023          	sw	s9,0(s10)
c000b770:	9c1ff06f          	j	c000b130 <stride_dequeue+0x2cc>
c000b774:	019a2223          	sw	s9,4(s4)
c000b778:	9e1ff06f          	j	c000b158 <stride_dequeue+0x2f4>
c000b77c:	004ca783          	lw	a5,4(s9)
c000b780:	008cae83          	lw	t4,8(s9)
c000b784:	00a12e23          	sw	a0,28(sp)
c000b788:	00f12c23          	sw	a5,24(sp)
c000b78c:	140e8a63          	beqz	t4,c000b8e0 <stride_dequeue+0xa7c>
c000b790:	000e8513          	mv	a0,t4
c000b794:	000d8593          	mv	a1,s11
c000b798:	03d12023          	sw	t4,32(sp)
c000b79c:	9ecff0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000b7a0:	01c12e03          	lw	t3,28(sp)
c000b7a4:	02012e83          	lw	t4,32(sp)
c000b7a8:	01c51463          	bne	a0,t3,c000b7b0 <stride_dequeue+0x94c>
c000b7ac:	4140106f          	j	c000cbc0 <stride_dequeue+0x1d5c>
c000b7b0:	004da783          	lw	a5,4(s11)
c000b7b4:	008daf03          	lw	t5,8(s11)
c000b7b8:	03c12023          	sw	t3,32(sp)
c000b7bc:	00f12e23          	sw	a5,28(sp)
c000b7c0:	100f0863          	beqz	t5,c000b8d0 <stride_dequeue+0xa6c>
c000b7c4:	000f0593          	mv	a1,t5
c000b7c8:	000e8513          	mv	a0,t4
c000b7cc:	03e12423          	sw	t5,40(sp)
c000b7d0:	03d12223          	sw	t4,36(sp)
c000b7d4:	9b4ff0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000b7d8:	02012e03          	lw	t3,32(sp)
c000b7dc:	02412e83          	lw	t4,36(sp)
c000b7e0:	02812f03          	lw	t5,40(sp)
c000b7e4:	01c51463          	bne	a0,t3,c000b7ec <stride_dequeue+0x988>
c000b7e8:	26d0106f          	j	c000d254 <stride_dequeue+0x23f0>
c000b7ec:	004f2783          	lw	a5,4(t5)
c000b7f0:	008f2c03          	lw	s8,8(t5)
c000b7f4:	03c12223          	sw	t3,36(sp)
c000b7f8:	02f12023          	sw	a5,32(sp)
c000b7fc:	000c1463          	bnez	s8,c000b804 <stride_dequeue+0x9a0>
c000b800:	5f50106f          	j	c000d5f4 <stride_dequeue+0x2790>
c000b804:	000e8513          	mv	a0,t4
c000b808:	000c0593          	mv	a1,s8
c000b80c:	03e12623          	sw	t5,44(sp)
c000b810:	03d12423          	sw	t4,40(sp)
c000b814:	974ff0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000b818:	02412e03          	lw	t3,36(sp)
c000b81c:	02812e83          	lw	t4,40(sp)
c000b820:	02c12f03          	lw	t5,44(sp)
c000b824:	01c51463          	bne	a0,t3,c000b82c <stride_dequeue+0x9c8>
c000b828:	7910106f          	j	c000d7b8 <stride_dequeue+0x2954>
c000b82c:	004c2783          	lw	a5,4(s8)
c000b830:	008c2e03          	lw	t3,8(s8)
c000b834:	02f12223          	sw	a5,36(sp)
c000b838:	060e0863          	beqz	t3,c000b8a8 <stride_dequeue+0xa44>
c000b83c:	000e0593          	mv	a1,t3
c000b840:	000e8513          	mv	a0,t4
c000b844:	03e12823          	sw	t5,48(sp)
c000b848:	03c12623          	sw	t3,44(sp)
c000b84c:	03d12423          	sw	t4,40(sp)
c000b850:	938ff0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000b854:	03012f03          	lw	t5,48(sp)
c000b858:	02c12e03          	lw	t3,44(sp)
c000b85c:	fff00593          	li	a1,-1
c000b860:	03e12623          	sw	t5,44(sp)
c000b864:	02812e83          	lw	t4,40(sp)
c000b868:	00b51463          	bne	a0,a1,c000b870 <stride_dequeue+0xa0c>
c000b86c:	50c0206f          	j	c000dd78 <stride_dequeue+0x2f14>
c000b870:	008e2583          	lw	a1,8(t3)
c000b874:	000e8513          	mv	a0,t4
c000b878:	004e2403          	lw	s0,4(t3)
c000b87c:	03c12423          	sw	t3,40(sp)
c000b880:	994ff0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000b884:	02812e03          	lw	t3,40(sp)
c000b888:	02c12f03          	lw	t5,44(sp)
c000b88c:	00ae2223          	sw	a0,4(t3)
c000b890:	008e2423          	sw	s0,8(t3)
c000b894:	00051463          	bnez	a0,c000b89c <stride_dequeue+0xa38>
c000b898:	0b90206f          	j	c000e150 <stride_dequeue+0x32ec>
c000b89c:	008ba403          	lw	s0,8(s7)
c000b8a0:	01c52023          	sw	t3,0(a0)
c000b8a4:	000e0e93          	mv	t4,t3
c000b8a8:	02412783          	lw	a5,36(sp)
c000b8ac:	01dc2223          	sw	t4,4(s8)
c000b8b0:	00fc2423          	sw	a5,8(s8)
c000b8b4:	018ea023          	sw	s8,0(t4)
c000b8b8:	02012783          	lw	a5,32(sp)
c000b8bc:	018f2223          	sw	s8,4(t5)
c000b8c0:	000f0e93          	mv	t4,t5
c000b8c4:	00ff2423          	sw	a5,8(t5)
c000b8c8:	01ec2023          	sw	t5,0(s8)
c000b8cc:	00040c13          	mv	s8,s0
c000b8d0:	01c12783          	lw	a5,28(sp)
c000b8d4:	01dda223          	sw	t4,4(s11)
c000b8d8:	00fda423          	sw	a5,8(s11)
c000b8dc:	01bea023          	sw	s11,0(t4)
c000b8e0:	01812783          	lw	a5,24(sp)
c000b8e4:	01bca223          	sw	s11,4(s9)
c000b8e8:	00fca423          	sw	a5,8(s9)
c000b8ec:	019da023          	sw	s9,0(s11)
c000b8f0:	805ff06f          	j	c000b0f4 <stride_dequeue+0x290>
c000b8f4:	004d2783          	lw	a5,4(s10)
c000b8f8:	008d2b03          	lw	s6,8(s10)
c000b8fc:	00f12623          	sw	a5,12(sp)
c000b900:	160b0863          	beqz	s6,c000ba70 <stride_dequeue+0xc0c>
c000b904:	00098593          	mv	a1,s3
c000b908:	000b0513          	mv	a0,s6
c000b90c:	87cff0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000b910:	1d5506e3          	beq	a0,s5,c000c2dc <stride_dequeue+0x1478>
c000b914:	0089ad83          	lw	s11,8(s3)
c000b918:	0049aa83          	lw	s5,4(s3)
c000b91c:	140d8463          	beqz	s11,c000ba64 <stride_dequeue+0xc00>
c000b920:	000d8593          	mv	a1,s11
c000b924:	000b0513          	mv	a0,s6
c000b928:	860ff0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000b92c:	fff00313          	li	t1,-1
c000b930:	00651463          	bne	a0,t1,c000b938 <stride_dequeue+0xad4>
c000b934:	1f80106f          	j	c000cb2c <stride_dequeue+0x1cc8>
c000b938:	004da783          	lw	a5,4(s11)
c000b93c:	008da803          	lw	a6,8(s11)
c000b940:	00612a23          	sw	t1,20(sp)
c000b944:	00f12823          	sw	a5,16(sp)
c000b948:	10080463          	beqz	a6,c000ba50 <stride_dequeue+0xbec>
c000b94c:	00080593          	mv	a1,a6
c000b950:	000b0513          	mv	a0,s6
c000b954:	01012c23          	sw	a6,24(sp)
c000b958:	830ff0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000b95c:	01412303          	lw	t1,20(sp)
c000b960:	01812803          	lw	a6,24(sp)
c000b964:	00651463          	bne	a0,t1,c000b96c <stride_dequeue+0xb08>
c000b968:	6540106f          	j	c000cfbc <stride_dequeue+0x2158>
c000b96c:	00482783          	lw	a5,4(a6)
c000b970:	00882883          	lw	a7,8(a6)
c000b974:	00612c23          	sw	t1,24(sp)
c000b978:	00f12a23          	sw	a5,20(sp)
c000b97c:	00089463          	bnez	a7,c000b984 <stride_dequeue+0xb20>
c000b980:	1d10106f          	j	c000d350 <stride_dequeue+0x24ec>
c000b984:	00088593          	mv	a1,a7
c000b988:	000b0513          	mv	a0,s6
c000b98c:	03012023          	sw	a6,32(sp)
c000b990:	01112e23          	sw	a7,28(sp)
c000b994:	ff5fe0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000b998:	01812303          	lw	t1,24(sp)
c000b99c:	01c12883          	lw	a7,28(sp)
c000b9a0:	02012803          	lw	a6,32(sp)
c000b9a4:	00651463          	bne	a0,t1,c000b9ac <stride_dequeue+0xb48>
c000b9a8:	20d0106f          	j	c000d3b4 <stride_dequeue+0x2550>
c000b9ac:	0088ae03          	lw	t3,8(a7)
c000b9b0:	00612c23          	sw	t1,24(sp)
c000b9b4:	0048ac03          	lw	s8,4(a7)
c000b9b8:	000e1463          	bnez	t3,c000b9c0 <stride_dequeue+0xb5c>
c000b9bc:	50d0106f          	j	c000d6c8 <stride_dequeue+0x2864>
c000b9c0:	000e0593          	mv	a1,t3
c000b9c4:	000b0513          	mv	a0,s6
c000b9c8:	03112223          	sw	a7,36(sp)
c000b9cc:	03012023          	sw	a6,32(sp)
c000b9d0:	01c12e23          	sw	t3,28(sp)
c000b9d4:	fb5fe0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000b9d8:	01812303          	lw	t1,24(sp)
c000b9dc:	01c12e03          	lw	t3,28(sp)
c000b9e0:	02012803          	lw	a6,32(sp)
c000b9e4:	02412883          	lw	a7,36(sp)
c000b9e8:	00651463          	bne	a0,t1,c000b9f0 <stride_dequeue+0xb8c>
c000b9ec:	6d90106f          	j	c000d8c4 <stride_dequeue+0x2a60>
c000b9f0:	008e2583          	lw	a1,8(t3)
c000b9f4:	000b0513          	mv	a0,s6
c000b9f8:	004e2403          	lw	s0,4(t3)
c000b9fc:	03112023          	sw	a7,32(sp)
c000ba00:	01012e23          	sw	a6,28(sp)
c000ba04:	01c12c23          	sw	t3,24(sp)
c000ba08:	80cff0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000ba0c:	01812e03          	lw	t3,24(sp)
c000ba10:	01c12803          	lw	a6,28(sp)
c000ba14:	02012883          	lw	a7,32(sp)
c000ba18:	00ae2223          	sw	a0,4(t3)
c000ba1c:	008e2423          	sw	s0,8(t3)
c000ba20:	00050463          	beqz	a0,c000ba28 <stride_dequeue+0xbc4>
c000ba24:	01c52023          	sw	t3,0(a0)
c000ba28:	008ba403          	lw	s0,8(s7)
c000ba2c:	0188a423          	sw	s8,8(a7)
c000ba30:	01c8a223          	sw	t3,4(a7)
c000ba34:	011e2023          	sw	a7,0(t3)
c000ba38:	00040c13          	mv	s8,s0
c000ba3c:	01412783          	lw	a5,20(sp)
c000ba40:	01182223          	sw	a7,4(a6)
c000ba44:	00080b13          	mv	s6,a6
c000ba48:	00f82423          	sw	a5,8(a6)
c000ba4c:	0108a023          	sw	a6,0(a7)
c000ba50:	01012783          	lw	a5,16(sp)
c000ba54:	016da223          	sw	s6,4(s11)
c000ba58:	00fda423          	sw	a5,8(s11)
c000ba5c:	01bb2023          	sw	s11,0(s6)
c000ba60:	000d8b13          	mv	s6,s11
c000ba64:	0169a223          	sw	s6,4(s3)
c000ba68:	0159a423          	sw	s5,8(s3)
c000ba6c:	013b2023          	sw	s3,0(s6)
c000ba70:	00c12783          	lw	a5,12(sp)
c000ba74:	013d2223          	sw	s3,4(s10)
c000ba78:	00fd2423          	sw	a5,8(s10)
c000ba7c:	01a9a023          	sw	s10,0(s3)
c000ba80:	000d0993          	mv	s3,s10
c000ba84:	addff06f          	j	c000b560 <stride_dequeue+0x6fc>
c000ba88:	004ca783          	lw	a5,4(s9)
c000ba8c:	008cae03          	lw	t3,8(s9)
c000ba90:	00f12a23          	sw	a5,20(sp)
c000ba94:	140e0263          	beqz	t3,c000bbd8 <stride_dequeue+0xd74>
c000ba98:	000e0513          	mv	a0,t3
c000ba9c:	000a8593          	mv	a1,s5
c000baa0:	01c12c23          	sw	t3,24(sp)
c000baa4:	ee5fe0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000baa8:	01812e03          	lw	t3,24(sp)
c000baac:	5fb502e3          	beq	a0,s11,c000c890 <stride_dequeue+0x1a2c>
c000bab0:	004aa783          	lw	a5,4(s5)
c000bab4:	008aae83          	lw	t4,8(s5)
c000bab8:	00f12c23          	sw	a5,24(sp)
c000babc:	100e8663          	beqz	t4,c000bbc8 <stride_dequeue+0xd64>
c000bac0:	000e8593          	mv	a1,t4
c000bac4:	000e0513          	mv	a0,t3
c000bac8:	03d12023          	sw	t4,32(sp)
c000bacc:	01c12e23          	sw	t3,28(sp)
c000bad0:	eb9fe0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000bad4:	01c12e03          	lw	t3,28(sp)
c000bad8:	02012e83          	lw	t4,32(sp)
c000badc:	01b51463          	bne	a0,s11,c000bae4 <stride_dequeue+0xc80>
c000bae0:	15c0106f          	j	c000cc3c <stride_dequeue+0x1dd8>
c000bae4:	004ea703          	lw	a4,4(t4)
c000bae8:	008ea783          	lw	a5,8(t4)
c000baec:	00e12e23          	sw	a4,28(sp)
c000baf0:	0c078263          	beqz	a5,c000bbb4 <stride_dequeue+0xd50>
c000baf4:	00078593          	mv	a1,a5
c000baf8:	000e0513          	mv	a0,t3
c000bafc:	03d12423          	sw	t4,40(sp)
c000bb00:	02f12223          	sw	a5,36(sp)
c000bb04:	03c12023          	sw	t3,32(sp)
c000bb08:	e81fe0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000bb0c:	02012e03          	lw	t3,32(sp)
c000bb10:	02412783          	lw	a5,36(sp)
c000bb14:	02812e83          	lw	t4,40(sp)
c000bb18:	01b51463          	bne	a0,s11,c000bb20 <stride_dequeue+0xcbc>
c000bb1c:	7680106f          	j	c000d284 <stride_dequeue+0x2420>
c000bb20:	0087af03          	lw	t5,8(a5)
c000bb24:	0047ac03          	lw	s8,4(a5)
c000bb28:	000f1463          	bnez	t5,c000bb30 <stride_dequeue+0xccc>
c000bb2c:	2d50106f          	j	c000d600 <stride_dequeue+0x279c>
c000bb30:	000f0593          	mv	a1,t5
c000bb34:	000e0513          	mv	a0,t3
c000bb38:	02f12623          	sw	a5,44(sp)
c000bb3c:	03d12423          	sw	t4,40(sp)
c000bb40:	03e12223          	sw	t5,36(sp)
c000bb44:	03c12023          	sw	t3,32(sp)
c000bb48:	e41fe0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000bb4c:	02812e83          	lw	t4,40(sp)
c000bb50:	02c12783          	lw	a5,44(sp)
c000bb54:	02412f03          	lw	t5,36(sp)
c000bb58:	03d12223          	sw	t4,36(sp)
c000bb5c:	02f12423          	sw	a5,40(sp)
c000bb60:	02012e03          	lw	t3,32(sp)
c000bb64:	01b51463          	bne	a0,s11,c000bb6c <stride_dequeue+0xd08>
c000bb68:	3b10106f          	j	c000d718 <stride_dequeue+0x28b4>
c000bb6c:	008f2583          	lw	a1,8(t5)
c000bb70:	000e0513          	mv	a0,t3
c000bb74:	004f2403          	lw	s0,4(t5)
c000bb78:	03e12023          	sw	t5,32(sp)
c000bb7c:	e99fe0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000bb80:	02012f03          	lw	t5,32(sp)
c000bb84:	02412e83          	lw	t4,36(sp)
c000bb88:	02812783          	lw	a5,40(sp)
c000bb8c:	00af2223          	sw	a0,4(t5)
c000bb90:	008f2423          	sw	s0,8(t5)
c000bb94:	00050463          	beqz	a0,c000bb9c <stride_dequeue+0xd38>
c000bb98:	01e52023          	sw	t5,0(a0)
c000bb9c:	008ba403          	lw	s0,8(s7)
c000bba0:	0187a423          	sw	s8,8(a5)
c000bba4:	01e7a223          	sw	t5,4(a5)
c000bba8:	00ff2023          	sw	a5,0(t5)
c000bbac:	00040c13          	mv	s8,s0
c000bbb0:	00078e13          	mv	t3,a5
c000bbb4:	01c12783          	lw	a5,28(sp)
c000bbb8:	01cea223          	sw	t3,4(t4)
c000bbbc:	00fea423          	sw	a5,8(t4)
c000bbc0:	01de2023          	sw	t4,0(t3)
c000bbc4:	000e8e13          	mv	t3,t4
c000bbc8:	01812783          	lw	a5,24(sp)
c000bbcc:	01caa223          	sw	t3,4(s5)
c000bbd0:	00faa423          	sw	a5,8(s5)
c000bbd4:	015e2023          	sw	s5,0(t3)
c000bbd8:	01412783          	lw	a5,20(sp)
c000bbdc:	015ca223          	sw	s5,4(s9)
c000bbe0:	00fca423          	sw	a5,8(s9)
c000bbe4:	019aa023          	sw	s9,0(s5)
c000bbe8:	d20ff06f          	j	c000b108 <stride_dequeue+0x2a4>
c000bbec:	004d2783          	lw	a5,4(s10)
c000bbf0:	008d2b03          	lw	s6,8(s10)
c000bbf4:	00f12623          	sw	a5,12(sp)
c000bbf8:	140b0063          	beqz	s6,c000bd38 <stride_dequeue+0xed4>
c000bbfc:	000d8593          	mv	a1,s11
c000bc00:	000b0513          	mv	a0,s6
c000bc04:	d85fe0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000bc08:	fff00313          	li	t1,-1
c000bc0c:	6a650ce3          	beq	a0,t1,c000cac4 <stride_dequeue+0x1c60>
c000bc10:	004da783          	lw	a5,4(s11)
c000bc14:	008da803          	lw	a6,8(s11)
c000bc18:	00612a23          	sw	t1,20(sp)
c000bc1c:	00f12823          	sw	a5,16(sp)
c000bc20:	10080463          	beqz	a6,c000bd28 <stride_dequeue+0xec4>
c000bc24:	00080593          	mv	a1,a6
c000bc28:	000b0513          	mv	a0,s6
c000bc2c:	01012c23          	sw	a6,24(sp)
c000bc30:	d59fe0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000bc34:	01412303          	lw	t1,20(sp)
c000bc38:	01812803          	lw	a6,24(sp)
c000bc3c:	00651463          	bne	a0,t1,c000bc44 <stride_dequeue+0xde0>
c000bc40:	4840106f          	j	c000d0c4 <stride_dequeue+0x2260>
c000bc44:	00482783          	lw	a5,4(a6)
c000bc48:	00882883          	lw	a7,8(a6)
c000bc4c:	00612c23          	sw	t1,24(sp)
c000bc50:	00f12a23          	sw	a5,20(sp)
c000bc54:	00089463          	bnez	a7,c000bc5c <stride_dequeue+0xdf8>
c000bc58:	7100106f          	j	c000d368 <stride_dequeue+0x2504>
c000bc5c:	00088593          	mv	a1,a7
c000bc60:	000b0513          	mv	a0,s6
c000bc64:	03012023          	sw	a6,32(sp)
c000bc68:	01112e23          	sw	a7,28(sp)
c000bc6c:	d1dfe0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000bc70:	01812303          	lw	t1,24(sp)
c000bc74:	01c12883          	lw	a7,28(sp)
c000bc78:	02012803          	lw	a6,32(sp)
c000bc7c:	00651463          	bne	a0,t1,c000bc84 <stride_dequeue+0xe20>
c000bc80:	7000106f          	j	c000d380 <stride_dequeue+0x251c>
c000bc84:	0088ae03          	lw	t3,8(a7)
c000bc88:	00612c23          	sw	t1,24(sp)
c000bc8c:	0048ac03          	lw	s8,4(a7)
c000bc90:	000e1463          	bnez	t3,c000bc98 <stride_dequeue+0xe34>
c000bc94:	2290106f          	j	c000d6bc <stride_dequeue+0x2858>
c000bc98:	000e0593          	mv	a1,t3
c000bc9c:	000b0513          	mv	a0,s6
c000bca0:	03112223          	sw	a7,36(sp)
c000bca4:	03012023          	sw	a6,32(sp)
c000bca8:	01c12e23          	sw	t3,28(sp)
c000bcac:	cddfe0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000bcb0:	01812303          	lw	t1,24(sp)
c000bcb4:	01c12e03          	lw	t3,28(sp)
c000bcb8:	02012803          	lw	a6,32(sp)
c000bcbc:	02412883          	lw	a7,36(sp)
c000bcc0:	00651463          	bne	a0,t1,c000bcc8 <stride_dequeue+0xe64>
c000bcc4:	5f50106f          	j	c000dab8 <stride_dequeue+0x2c54>
c000bcc8:	008e2583          	lw	a1,8(t3)
c000bccc:	000b0513          	mv	a0,s6
c000bcd0:	004e2403          	lw	s0,4(t3)
c000bcd4:	03112023          	sw	a7,32(sp)
c000bcd8:	01012e23          	sw	a6,28(sp)
c000bcdc:	01c12c23          	sw	t3,24(sp)
c000bce0:	d35fe0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000bce4:	01812e03          	lw	t3,24(sp)
c000bce8:	01c12803          	lw	a6,28(sp)
c000bcec:	02012883          	lw	a7,32(sp)
c000bcf0:	00ae2223          	sw	a0,4(t3)
c000bcf4:	008e2423          	sw	s0,8(t3)
c000bcf8:	00050463          	beqz	a0,c000bd00 <stride_dequeue+0xe9c>
c000bcfc:	01c52023          	sw	t3,0(a0)
c000bd00:	008ba403          	lw	s0,8(s7)
c000bd04:	0188a423          	sw	s8,8(a7)
c000bd08:	01c8a223          	sw	t3,4(a7)
c000bd0c:	011e2023          	sw	a7,0(t3)
c000bd10:	00040c13          	mv	s8,s0
c000bd14:	01412783          	lw	a5,20(sp)
c000bd18:	01182223          	sw	a7,4(a6)
c000bd1c:	00080b13          	mv	s6,a6
c000bd20:	00f82423          	sw	a5,8(a6)
c000bd24:	0108a023          	sw	a6,0(a7)
c000bd28:	01012783          	lw	a5,16(sp)
c000bd2c:	016da223          	sw	s6,4(s11)
c000bd30:	00fda423          	sw	a5,8(s11)
c000bd34:	01bb2023          	sw	s11,0(s6)
c000bd38:	00c12783          	lw	a5,12(sp)
c000bd3c:	01bd2223          	sw	s11,4(s10)
c000bd40:	00fd2423          	sw	a5,8(s10)
c000bd44:	01ada023          	sw	s10,0(s11)
c000bd48:	80dff06f          	j	c000b554 <stride_dequeue+0x6f0>
c000bd4c:	008aad83          	lw	s11,8(s5)
c000bd50:	004aab03          	lw	s6,4(s5)
c000bd54:	140d8063          	beqz	s11,c000be94 <stride_dequeue+0x1030>
c000bd58:	000d0593          	mv	a1,s10
c000bd5c:	000d8513          	mv	a0,s11
c000bd60:	c29fe0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000bd64:	fff00313          	li	t1,-1
c000bd68:	4e650ae3          	beq	a0,t1,c000ca5c <stride_dequeue+0x1bf8>
c000bd6c:	004d2703          	lw	a4,4(s10)
c000bd70:	008d2783          	lw	a5,8(s10)
c000bd74:	00612a23          	sw	t1,20(sp)
c000bd78:	00e12823          	sw	a4,16(sp)
c000bd7c:	10078463          	beqz	a5,c000be84 <stride_dequeue+0x1020>
c000bd80:	00078593          	mv	a1,a5
c000bd84:	000d8513          	mv	a0,s11
c000bd88:	00f12c23          	sw	a5,24(sp)
c000bd8c:	bfdfe0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000bd90:	01412303          	lw	t1,20(sp)
c000bd94:	01812783          	lw	a5,24(sp)
c000bd98:	00651463          	bne	a0,t1,c000bda0 <stride_dequeue+0xf3c>
c000bd9c:	3500106f          	j	c000d0ec <stride_dequeue+0x2288>
c000bda0:	0047a683          	lw	a3,4(a5)
c000bda4:	0087a703          	lw	a4,8(a5)
c000bda8:	00612c23          	sw	t1,24(sp)
c000bdac:	00d12a23          	sw	a3,20(sp)
c000bdb0:	00071463          	bnez	a4,c000bdb8 <stride_dequeue+0xf54>
c000bdb4:	5c40106f          	j	c000d378 <stride_dequeue+0x2514>
c000bdb8:	00070593          	mv	a1,a4
c000bdbc:	000d8513          	mv	a0,s11
c000bdc0:	02f12023          	sw	a5,32(sp)
c000bdc4:	00e12e23          	sw	a4,28(sp)
c000bdc8:	bc1fe0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000bdcc:	01812303          	lw	t1,24(sp)
c000bdd0:	01c12703          	lw	a4,28(sp)
c000bdd4:	02012783          	lw	a5,32(sp)
c000bdd8:	00651463          	bne	a0,t1,c000bde0 <stride_dequeue+0xf7c>
c000bddc:	60c0106f          	j	c000d3e8 <stride_dequeue+0x2584>
c000bde0:	00872e03          	lw	t3,8(a4) # 40000008 <_binary_bin_sfs_img_size+0x3ff8ad08>
c000bde4:	00612c23          	sw	t1,24(sp)
c000bde8:	00472c03          	lw	s8,4(a4)
c000bdec:	000e1463          	bnez	t3,c000bdf4 <stride_dequeue+0xf90>
c000bdf0:	1c10106f          	j	c000d7b0 <stride_dequeue+0x294c>
c000bdf4:	000e0593          	mv	a1,t3
c000bdf8:	000d8513          	mv	a0,s11
c000bdfc:	02e12223          	sw	a4,36(sp)
c000be00:	02f12023          	sw	a5,32(sp)
c000be04:	01c12e23          	sw	t3,28(sp)
c000be08:	b81fe0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000be0c:	01812303          	lw	t1,24(sp)
c000be10:	01c12e03          	lw	t3,28(sp)
c000be14:	02012783          	lw	a5,32(sp)
c000be18:	02412703          	lw	a4,36(sp)
c000be1c:	00651463          	bne	a0,t1,c000be24 <stride_dequeue+0xfc0>
c000be20:	2e10106f          	j	c000d900 <stride_dequeue+0x2a9c>
c000be24:	008e2583          	lw	a1,8(t3)
c000be28:	000d8513          	mv	a0,s11
c000be2c:	004e2403          	lw	s0,4(t3)
c000be30:	02e12023          	sw	a4,32(sp)
c000be34:	00f12e23          	sw	a5,28(sp)
c000be38:	01c12c23          	sw	t3,24(sp)
c000be3c:	bd9fe0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000be40:	01812e03          	lw	t3,24(sp)
c000be44:	01c12783          	lw	a5,28(sp)
c000be48:	02012703          	lw	a4,32(sp)
c000be4c:	00ae2223          	sw	a0,4(t3)
c000be50:	008e2423          	sw	s0,8(t3)
c000be54:	00050463          	beqz	a0,c000be5c <stride_dequeue+0xff8>
c000be58:	01c52023          	sw	t3,0(a0)
c000be5c:	008ba403          	lw	s0,8(s7)
c000be60:	01872423          	sw	s8,8(a4)
c000be64:	01c72223          	sw	t3,4(a4)
c000be68:	00ee2023          	sw	a4,0(t3)
c000be6c:	00040c13          	mv	s8,s0
c000be70:	01412683          	lw	a3,20(sp)
c000be74:	00e7a223          	sw	a4,4(a5)
c000be78:	00078d93          	mv	s11,a5
c000be7c:	00d7a423          	sw	a3,8(a5)
c000be80:	00f72023          	sw	a5,0(a4)
c000be84:	01012783          	lw	a5,16(sp)
c000be88:	01bd2223          	sw	s11,4(s10)
c000be8c:	00fd2423          	sw	a5,8(s10)
c000be90:	01ada023          	sw	s10,0(s11)
c000be94:	01aaa223          	sw	s10,4(s5)
c000be98:	016aa423          	sw	s6,8(s5)
c000be9c:	015d2023          	sw	s5,0(s10)
c000bea0:	000a8d13          	mv	s10,s5
c000bea4:	8bdff06f          	j	c000b760 <stride_dequeue+0x8fc>
c000bea8:	004d2783          	lw	a5,4(s10)
c000beac:	008d2303          	lw	t1,8(s10)
c000beb0:	00a12a23          	sw	a0,20(sp)
c000beb4:	00f12823          	sw	a5,16(sp)
c000beb8:	14030c63          	beqz	t1,c000c010 <stride_dequeue+0x11ac>
c000bebc:	00030513          	mv	a0,t1
c000bec0:	000b0593          	mv	a1,s6
c000bec4:	00612c23          	sw	t1,24(sp)
c000bec8:	ac1fe0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000becc:	01412883          	lw	a7,20(sp)
c000bed0:	01812303          	lw	t1,24(sp)
c000bed4:	01151463          	bne	a0,a7,c000bedc <stride_dequeue+0x1078>
c000bed8:	23c0106f          	j	c000d114 <stride_dequeue+0x22b0>
c000bedc:	004b2783          	lw	a5,4(s6)
c000bee0:	008b2e03          	lw	t3,8(s6)
c000bee4:	01112c23          	sw	a7,24(sp)
c000bee8:	00f12a23          	sw	a5,20(sp)
c000beec:	000e1463          	bnez	t3,c000bef4 <stride_dequeue+0x1090>
c000bef0:	4680106f          	j	c000d358 <stride_dequeue+0x24f4>
c000bef4:	000e0593          	mv	a1,t3
c000bef8:	00030513          	mv	a0,t1
c000befc:	03c12023          	sw	t3,32(sp)
c000bf00:	00612e23          	sw	t1,28(sp)
c000bf04:	a85fe0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000bf08:	01812883          	lw	a7,24(sp)
c000bf0c:	01c12303          	lw	t1,28(sp)
c000bf10:	02012e03          	lw	t3,32(sp)
c000bf14:	01151463          	bne	a0,a7,c000bf1c <stride_dequeue+0x10b8>
c000bf18:	61c0106f          	j	c000d534 <stride_dequeue+0x26d0>
c000bf1c:	004e2783          	lw	a5,4(t3)
c000bf20:	008e2c03          	lw	s8,8(t3)
c000bf24:	01112e23          	sw	a7,28(sp)
c000bf28:	00f12c23          	sw	a5,24(sp)
c000bf2c:	000c1463          	bnez	s8,c000bf34 <stride_dequeue+0x10d0>
c000bf30:	0690106f          	j	c000d798 <stride_dequeue+0x2934>
c000bf34:	00030513          	mv	a0,t1
c000bf38:	000c0593          	mv	a1,s8
c000bf3c:	03c12223          	sw	t3,36(sp)
c000bf40:	02612023          	sw	t1,32(sp)
c000bf44:	a45fe0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000bf48:	01c12883          	lw	a7,28(sp)
c000bf4c:	02012303          	lw	t1,32(sp)
c000bf50:	02412e03          	lw	t3,36(sp)
c000bf54:	01151463          	bne	a0,a7,c000bf5c <stride_dequeue+0x10f8>
c000bf58:	3250106f          	j	c000da7c <stride_dequeue+0x2c18>
c000bf5c:	004c2783          	lw	a5,4(s8)
c000bf60:	008c2f03          	lw	t5,8(s8)
c000bf64:	03112623          	sw	a7,44(sp)
c000bf68:	00f12e23          	sw	a5,28(sp)
c000bf6c:	060f0863          	beqz	t5,c000bfdc <stride_dequeue+0x1178>
c000bf70:	000f0593          	mv	a1,t5
c000bf74:	00030513          	mv	a0,t1
c000bf78:	03c12423          	sw	t3,40(sp)
c000bf7c:	03e12223          	sw	t5,36(sp)
c000bf80:	02612023          	sw	t1,32(sp)
c000bf84:	a05fe0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000bf88:	02812e03          	lw	t3,40(sp)
c000bf8c:	02c12883          	lw	a7,44(sp)
c000bf90:	02412f03          	lw	t5,36(sp)
c000bf94:	03c12223          	sw	t3,36(sp)
c000bf98:	02012303          	lw	t1,32(sp)
c000bf9c:	01151463          	bne	a0,a7,c000bfa4 <stride_dequeue+0x1140>
c000bfa0:	5a90106f          	j	c000dd48 <stride_dequeue+0x2ee4>
c000bfa4:	008f2583          	lw	a1,8(t5)
c000bfa8:	00030513          	mv	a0,t1
c000bfac:	004f2403          	lw	s0,4(t5)
c000bfb0:	03e12023          	sw	t5,32(sp)
c000bfb4:	a61fe0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000bfb8:	02012f03          	lw	t5,32(sp)
c000bfbc:	02412e03          	lw	t3,36(sp)
c000bfc0:	00af2223          	sw	a0,4(t5)
c000bfc4:	008f2423          	sw	s0,8(t5)
c000bfc8:	00051463          	bnez	a0,c000bfd0 <stride_dequeue+0x116c>
c000bfcc:	2400206f          	j	c000e20c <stride_dequeue+0x33a8>
c000bfd0:	008ba403          	lw	s0,8(s7)
c000bfd4:	01e52023          	sw	t5,0(a0)
c000bfd8:	000f0313          	mv	t1,t5
c000bfdc:	01c12783          	lw	a5,28(sp)
c000bfe0:	006c2223          	sw	t1,4(s8)
c000bfe4:	00fc2423          	sw	a5,8(s8)
c000bfe8:	01832023          	sw	s8,0(t1)
c000bfec:	01812783          	lw	a5,24(sp)
c000bff0:	018e2223          	sw	s8,4(t3)
c000bff4:	00fe2423          	sw	a5,8(t3)
c000bff8:	01cc2023          	sw	t3,0(s8)
c000bffc:	00040c13          	mv	s8,s0
c000c000:	01412783          	lw	a5,20(sp)
c000c004:	01cb2223          	sw	t3,4(s6)
c000c008:	00fb2423          	sw	a5,8(s6)
c000c00c:	016e2023          	sw	s6,0(t3)
c000c010:	01012783          	lw	a5,16(sp)
c000c014:	016d2223          	sw	s6,4(s10)
c000c018:	00fd2423          	sw	a5,8(s10)
c000c01c:	01ab2023          	sw	s10,0(s6)
c000c020:	d20ff06f          	j	c000b540 <stride_dequeue+0x6dc>
c000c024:	004aa703          	lw	a4,4(s5)
c000c028:	008aa783          	lw	a5,8(s5)
c000c02c:	00e12a23          	sw	a4,20(sp)
c000c030:	12078e63          	beqz	a5,c000c16c <stride_dequeue+0x1308>
c000c034:	00078513          	mv	a0,a5
c000c038:	000b0593          	mv	a1,s6
c000c03c:	00f12c23          	sw	a5,24(sp)
c000c040:	949fe0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000c044:	01812783          	lw	a5,24(sp)
c000c048:	01b51463          	bne	a0,s11,c000c050 <stride_dequeue+0x11ec>
c000c04c:	0080106f          	j	c000d054 <stride_dequeue+0x21f0>
c000c050:	004b2703          	lw	a4,4(s6)
c000c054:	008b2e03          	lw	t3,8(s6)
c000c058:	00e12c23          	sw	a4,24(sp)
c000c05c:	000e1463          	bnez	t3,c000c064 <stride_dequeue+0x1200>
c000c060:	3100106f          	j	c000d370 <stride_dequeue+0x250c>
c000c064:	000e0593          	mv	a1,t3
c000c068:	00078513          	mv	a0,a5
c000c06c:	03c12023          	sw	t3,32(sp)
c000c070:	00f12e23          	sw	a5,28(sp)
c000c074:	915fe0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000c078:	01c12783          	lw	a5,28(sp)
c000c07c:	02012e03          	lw	t3,32(sp)
c000c080:	01b51463          	bne	a0,s11,c000c088 <stride_dequeue+0x1224>
c000c084:	3c40106f          	j	c000d448 <stride_dequeue+0x25e4>
c000c088:	004e2703          	lw	a4,4(t3)
c000c08c:	008e2c03          	lw	s8,8(t3)
c000c090:	00e12e23          	sw	a4,28(sp)
c000c094:	000c1463          	bnez	s8,c000c09c <stride_dequeue+0x1238>
c000c098:	63c0106f          	j	c000d6d4 <stride_dequeue+0x2870>
c000c09c:	00078513          	mv	a0,a5
c000c0a0:	000c0593          	mv	a1,s8
c000c0a4:	03c12223          	sw	t3,36(sp)
c000c0a8:	02f12023          	sw	a5,32(sp)
c000c0ac:	8ddfe0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000c0b0:	02012783          	lw	a5,32(sp)
c000c0b4:	02412e03          	lw	t3,36(sp)
c000c0b8:	01b51463          	bne	a0,s11,c000c0c0 <stride_dequeue+0x125c>
c000c0bc:	1050106f          	j	c000d9c0 <stride_dequeue+0x2b5c>
c000c0c0:	004c2703          	lw	a4,4(s8)
c000c0c4:	008c2f03          	lw	t5,8(s8)
c000c0c8:	02e12023          	sw	a4,32(sp)
c000c0cc:	060f0663          	beqz	t5,c000c138 <stride_dequeue+0x12d4>
c000c0d0:	000f0593          	mv	a1,t5
c000c0d4:	00078513          	mv	a0,a5
c000c0d8:	03c12623          	sw	t3,44(sp)
c000c0dc:	03e12423          	sw	t5,40(sp)
c000c0e0:	02f12223          	sw	a5,36(sp)
c000c0e4:	8a5fe0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000c0e8:	02c12e03          	lw	t3,44(sp)
c000c0ec:	02812f03          	lw	t5,40(sp)
c000c0f0:	02412783          	lw	a5,36(sp)
c000c0f4:	03c12423          	sw	t3,40(sp)
c000c0f8:	01b51463          	bne	a0,s11,c000c100 <stride_dequeue+0x129c>
c000c0fc:	5390106f          	j	c000de34 <stride_dequeue+0x2fd0>
c000c100:	008f2583          	lw	a1,8(t5)
c000c104:	00078513          	mv	a0,a5
c000c108:	004f2403          	lw	s0,4(t5)
c000c10c:	03e12223          	sw	t5,36(sp)
c000c110:	905fe0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000c114:	02412f03          	lw	t5,36(sp)
c000c118:	02812e03          	lw	t3,40(sp)
c000c11c:	00af2223          	sw	a0,4(t5)
c000c120:	008f2423          	sw	s0,8(t5)
c000c124:	00051463          	bnez	a0,c000c12c <stride_dequeue+0x12c8>
c000c128:	7690106f          	j	c000e090 <stride_dequeue+0x322c>
c000c12c:	008ba403          	lw	s0,8(s7)
c000c130:	01e52023          	sw	t5,0(a0)
c000c134:	000f0793          	mv	a5,t5
c000c138:	02012703          	lw	a4,32(sp)
c000c13c:	00fc2223          	sw	a5,4(s8)
c000c140:	00ec2423          	sw	a4,8(s8)
c000c144:	0187a023          	sw	s8,0(a5)
c000c148:	01c12783          	lw	a5,28(sp)
c000c14c:	018e2223          	sw	s8,4(t3)
c000c150:	00fe2423          	sw	a5,8(t3)
c000c154:	01cc2023          	sw	t3,0(s8)
c000c158:	00040c13          	mv	s8,s0
c000c15c:	01812783          	lw	a5,24(sp)
c000c160:	01cb2223          	sw	t3,4(s6)
c000c164:	00fb2423          	sw	a5,8(s6)
c000c168:	016e2023          	sw	s6,0(t3)
c000c16c:	01412783          	lw	a5,20(sp)
c000c170:	016aa223          	sw	s6,4(s5)
c000c174:	00faa423          	sw	a5,8(s5)
c000c178:	015b2023          	sw	s5,0(s6)
c000c17c:	dd4ff06f          	j	c000b750 <stride_dequeue+0x8ec>
c000c180:	004aa703          	lw	a4,4(s5)
c000c184:	008aa783          	lw	a5,8(s5)
c000c188:	00e12a23          	sw	a4,20(sp)
c000c18c:	12078c63          	beqz	a5,c000c2c4 <stride_dequeue+0x1460>
c000c190:	00078513          	mv	a0,a5
c000c194:	000b0593          	mv	a1,s6
c000c198:	00f12c23          	sw	a5,24(sp)
c000c19c:	fecfe0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000c1a0:	01812783          	lw	a5,24(sp)
c000c1a4:	65b500e3          	beq	a0,s11,c000cfe4 <stride_dequeue+0x2180>
c000c1a8:	004b2703          	lw	a4,4(s6)
c000c1ac:	008b2e03          	lw	t3,8(s6)
c000c1b0:	00e12c23          	sw	a4,24(sp)
c000c1b4:	000e1463          	bnez	t3,c000c1bc <stride_dequeue+0x1358>
c000c1b8:	1a80106f          	j	c000d360 <stride_dequeue+0x24fc>
c000c1bc:	000e0593          	mv	a1,t3
c000c1c0:	00078513          	mv	a0,a5
c000c1c4:	03c12023          	sw	t3,32(sp)
c000c1c8:	00f12e23          	sw	a5,28(sp)
c000c1cc:	fbcfe0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000c1d0:	01c12783          	lw	a5,28(sp)
c000c1d4:	02012e03          	lw	t3,32(sp)
c000c1d8:	01b51463          	bne	a0,s11,c000c1e0 <stride_dequeue+0x137c>
c000c1dc:	29c0106f          	j	c000d478 <stride_dequeue+0x2614>
c000c1e0:	004e2703          	lw	a4,4(t3)
c000c1e4:	008e2c03          	lw	s8,8(t3)
c000c1e8:	00e12e23          	sw	a4,28(sp)
c000c1ec:	000c1463          	bnez	s8,c000c1f4 <stride_dequeue+0x1390>
c000c1f0:	5b40106f          	j	c000d7a4 <stride_dequeue+0x2940>
c000c1f4:	00078513          	mv	a0,a5
c000c1f8:	000c0593          	mv	a1,s8
c000c1fc:	03c12223          	sw	t3,36(sp)
c000c200:	02f12023          	sw	a5,32(sp)
c000c204:	f84fe0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000c208:	02012783          	lw	a5,32(sp)
c000c20c:	02412e03          	lw	t3,36(sp)
c000c210:	01b51463          	bne	a0,s11,c000c218 <stride_dequeue+0x13b4>
c000c214:	0e10106f          	j	c000daf4 <stride_dequeue+0x2c90>
c000c218:	004c2703          	lw	a4,4(s8)
c000c21c:	008c2f03          	lw	t5,8(s8)
c000c220:	02e12023          	sw	a4,32(sp)
c000c224:	060f0663          	beqz	t5,c000c290 <stride_dequeue+0x142c>
c000c228:	000f0593          	mv	a1,t5
c000c22c:	00078513          	mv	a0,a5
c000c230:	03c12623          	sw	t3,44(sp)
c000c234:	03e12423          	sw	t5,40(sp)
c000c238:	02f12223          	sw	a5,36(sp)
c000c23c:	f4cfe0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000c240:	02c12e03          	lw	t3,44(sp)
c000c244:	02812f03          	lw	t5,40(sp)
c000c248:	02412783          	lw	a5,36(sp)
c000c24c:	03c12423          	sw	t3,40(sp)
c000c250:	01b51463          	bne	a0,s11,c000c258 <stride_dequeue+0x13f4>
c000c254:	3850106f          	j	c000ddd8 <stride_dequeue+0x2f74>
c000c258:	008f2583          	lw	a1,8(t5)
c000c25c:	00078513          	mv	a0,a5
c000c260:	004f2403          	lw	s0,4(t5)
c000c264:	03e12223          	sw	t5,36(sp)
c000c268:	facfe0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000c26c:	02412f03          	lw	t5,36(sp)
c000c270:	02812e03          	lw	t3,40(sp)
c000c274:	00af2223          	sw	a0,4(t5)
c000c278:	008f2423          	sw	s0,8(t5)
c000c27c:	00051463          	bnez	a0,c000c284 <stride_dequeue+0x1420>
c000c280:	5610106f          	j	c000dfe0 <stride_dequeue+0x317c>
c000c284:	008ba403          	lw	s0,8(s7)
c000c288:	01e52023          	sw	t5,0(a0)
c000c28c:	000f0793          	mv	a5,t5
c000c290:	02012703          	lw	a4,32(sp)
c000c294:	00fc2223          	sw	a5,4(s8)
c000c298:	00ec2423          	sw	a4,8(s8)
c000c29c:	0187a023          	sw	s8,0(a5)
c000c2a0:	01c12783          	lw	a5,28(sp)
c000c2a4:	018e2223          	sw	s8,4(t3)
c000c2a8:	00fe2423          	sw	a5,8(t3)
c000c2ac:	01cc2023          	sw	t3,0(s8)
c000c2b0:	00040c13          	mv	s8,s0
c000c2b4:	01812783          	lw	a5,24(sp)
c000c2b8:	01cb2223          	sw	t3,4(s6)
c000c2bc:	00fb2423          	sw	a5,8(s6)
c000c2c0:	016e2023          	sw	s6,0(t3)
c000c2c4:	01412783          	lw	a5,20(sp)
c000c2c8:	016aa223          	sw	s6,4(s5)
c000c2cc:	00faa423          	sw	a5,8(s5)
c000c2d0:	015b2023          	sw	s5,0(s6)
c000c2d4:	000a8b13          	mv	s6,s5
c000c2d8:	85cff06f          	j	c000b334 <stride_dequeue+0x4d0>
c000c2dc:	008b2d83          	lw	s11,8(s6)
c000c2e0:	004b2a83          	lw	s5,4(s6)
c000c2e4:	120d8663          	beqz	s11,c000c410 <stride_dequeue+0x15ac>
c000c2e8:	00098593          	mv	a1,s3
c000c2ec:	000d8513          	mv	a0,s11
c000c2f0:	e98fe0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000c2f4:	fff00313          	li	t1,-1
c000c2f8:	00050c13          	mv	s8,a0
c000c2fc:	6c6500e3          	beq	a0,t1,c000d1bc <stride_dequeue+0x2358>
c000c300:	0049a783          	lw	a5,4(s3)
c000c304:	0089ac03          	lw	s8,8(s3)
c000c308:	00612a23          	sw	t1,20(sp)
c000c30c:	00f12823          	sw	a5,16(sp)
c000c310:	000c1463          	bnez	s8,c000c318 <stride_dequeue+0x14b4>
c000c314:	2900106f          	j	c000d5a4 <stride_dequeue+0x2740>
c000c318:	000c0593          	mv	a1,s8
c000c31c:	000d8513          	mv	a0,s11
c000c320:	e68fe0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000c324:	01412303          	lw	t1,20(sp)
c000c328:	00651463          	bne	a0,t1,c000c330 <stride_dequeue+0x14cc>
c000c32c:	2980106f          	j	c000d5c4 <stride_dequeue+0x2760>
c000c330:	004c2783          	lw	a5,4(s8)
c000c334:	008c2883          	lw	a7,8(s8)
c000c338:	00612c23          	sw	t1,24(sp)
c000c33c:	00f12a23          	sw	a5,20(sp)
c000c340:	00089463          	bnez	a7,c000c348 <stride_dequeue+0x14e4>
c000c344:	7300106f          	j	c000da74 <stride_dequeue+0x2c10>
c000c348:	00088593          	mv	a1,a7
c000c34c:	000d8513          	mv	a0,s11
c000c350:	01112e23          	sw	a7,28(sp)
c000c354:	e34fe0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000c358:	01812303          	lw	t1,24(sp)
c000c35c:	01c12883          	lw	a7,28(sp)
c000c360:	00651463          	bne	a0,t1,c000c368 <stride_dequeue+0x1504>
c000c364:	1890106f          	j	c000dcec <stride_dequeue+0x2e88>
c000c368:	0048a783          	lw	a5,4(a7)
c000c36c:	0088ae03          	lw	t3,8(a7)
c000c370:	02612223          	sw	t1,36(sp)
c000c374:	00f12c23          	sw	a5,24(sp)
c000c378:	060e0463          	beqz	t3,c000c3e0 <stride_dequeue+0x157c>
c000c37c:	000e0593          	mv	a1,t3
c000c380:	000d8513          	mv	a0,s11
c000c384:	03112023          	sw	a7,32(sp)
c000c388:	01c12e23          	sw	t3,28(sp)
c000c38c:	dfcfe0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000c390:	02412303          	lw	t1,36(sp)
c000c394:	01c12e03          	lw	t3,28(sp)
c000c398:	02012883          	lw	a7,32(sp)
c000c39c:	00651463          	bne	a0,t1,c000c3a4 <stride_dequeue+0x1540>
c000c3a0:	3710106f          	j	c000df10 <stride_dequeue+0x30ac>
c000c3a4:	008e2583          	lw	a1,8(t3)
c000c3a8:	000d8513          	mv	a0,s11
c000c3ac:	004e2403          	lw	s0,4(t3)
c000c3b0:	03112023          	sw	a7,32(sp)
c000c3b4:	01c12e23          	sw	t3,28(sp)
c000c3b8:	e5cfe0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000c3bc:	01c12e03          	lw	t3,28(sp)
c000c3c0:	02012883          	lw	a7,32(sp)
c000c3c4:	00ae2223          	sw	a0,4(t3)
c000c3c8:	008e2423          	sw	s0,8(t3)
c000c3cc:	00051463          	bnez	a0,c000c3d4 <stride_dequeue+0x1570>
c000c3d0:	3c50106f          	j	c000df94 <stride_dequeue+0x3130>
c000c3d4:	008ba403          	lw	s0,8(s7)
c000c3d8:	01c52023          	sw	t3,0(a0)
c000c3dc:	000e0d93          	mv	s11,t3
c000c3e0:	01812783          	lw	a5,24(sp)
c000c3e4:	01b8a223          	sw	s11,4(a7)
c000c3e8:	00f8a423          	sw	a5,8(a7)
c000c3ec:	011da023          	sw	a7,0(s11)
c000c3f0:	01412783          	lw	a5,20(sp)
c000c3f4:	011c2223          	sw	a7,4(s8)
c000c3f8:	00fc2423          	sw	a5,8(s8)
c000c3fc:	0188a023          	sw	s8,0(a7)
c000c400:	01012783          	lw	a5,16(sp)
c000c404:	0189a223          	sw	s8,4(s3)
c000c408:	00f9a423          	sw	a5,8(s3)
c000c40c:	013c2023          	sw	s3,0(s8)
c000c410:	013b2223          	sw	s3,4(s6)
c000c414:	015b2423          	sw	s5,8(s6)
c000c418:	0169a023          	sw	s6,0(s3)
c000c41c:	00040c13          	mv	s8,s0
c000c420:	000b0993          	mv	s3,s6
c000c424:	e4cff06f          	j	c000ba70 <stride_dequeue+0xc0c>
c000c428:	008ca783          	lw	a5,8(s9)
c000c42c:	00a12e23          	sw	a0,28(sp)
c000c430:	004cac03          	lw	s8,4(s9)
c000c434:	04078a63          	beqz	a5,c000c488 <stride_dequeue+0x1624>
c000c438:	000e0593          	mv	a1,t3
c000c43c:	00078513          	mv	a0,a5
c000c440:	03c12223          	sw	t3,36(sp)
c000c444:	02f12023          	sw	a5,32(sp)
c000c448:	d40fe0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000c44c:	01c12703          	lw	a4,28(sp)
c000c450:	02012783          	lw	a5,32(sp)
c000c454:	02412e03          	lw	t3,36(sp)
c000c458:	5ce504e3          	beq	a0,a4,c000d220 <stride_dequeue+0x23bc>
c000c45c:	008e2583          	lw	a1,8(t3)
c000c460:	00078513          	mv	a0,a5
c000c464:	004e2403          	lw	s0,4(t3)
c000c468:	01c12e23          	sw	t3,28(sp)
c000c46c:	da8fe0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000c470:	01c12e03          	lw	t3,28(sp)
c000c474:	00ae2223          	sw	a0,4(t3)
c000c478:	008e2423          	sw	s0,8(t3)
c000c47c:	00050463          	beqz	a0,c000c484 <stride_dequeue+0x1620>
c000c480:	01c52023          	sw	t3,0(a0)
c000c484:	008ba403          	lw	s0,8(s7)
c000c488:	018ca423          	sw	s8,8(s9)
c000c48c:	01cca223          	sw	t3,4(s9)
c000c490:	019e2023          	sw	s9,0(t3)
c000c494:	00040c13          	mv	s8,s0
c000c498:	c49fe06f          	j	c000b0e0 <stride_dequeue+0x27c>
c000c49c:	004aa783          	lw	a5,4(s5)
c000c4a0:	008aac03          	lw	s8,8(s5)
c000c4a4:	00a12e23          	sw	a0,28(sp)
c000c4a8:	00f12c23          	sw	a5,24(sp)
c000c4ac:	180c0e63          	beqz	s8,c000c648 <stride_dequeue+0x17e4>
c000c4b0:	000d8593          	mv	a1,s11
c000c4b4:	000c0513          	mv	a0,s8
c000c4b8:	cd0fe0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000c4bc:	01c12783          	lw	a5,28(sp)
c000c4c0:	00f51463          	bne	a0,a5,c000c4c8 <stride_dequeue+0x1664>
c000c4c4:	7590006f          	j	c000d41c <stride_dequeue+0x25b8>
c000c4c8:	02f12023          	sw	a5,32(sp)
c000c4cc:	004da783          	lw	a5,4(s11)
c000c4d0:	008daf03          	lw	t5,8(s11)
c000c4d4:	00f12e23          	sw	a5,28(sp)
c000c4d8:	000f1463          	bnez	t5,c000c4e0 <stride_dequeue+0x167c>
c000c4dc:	35c0106f          	j	c000d838 <stride_dequeue+0x29d4>
c000c4e0:	000f0593          	mv	a1,t5
c000c4e4:	000c0513          	mv	a0,s8
c000c4e8:	03e12223          	sw	t5,36(sp)
c000c4ec:	c9cfe0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000c4f0:	02012783          	lw	a5,32(sp)
c000c4f4:	02412f03          	lw	t5,36(sp)
c000c4f8:	00f51463          	bne	a0,a5,c000c500 <stride_dequeue+0x169c>
c000c4fc:	4f80106f          	j	c000d9f4 <stride_dequeue+0x2b90>
c000c500:	02f12623          	sw	a5,44(sp)
c000c504:	004f2703          	lw	a4,4(t5)
c000c508:	008f2783          	lw	a5,8(t5)
c000c50c:	02e12223          	sw	a4,36(sp)
c000c510:	02f12023          	sw	a5,32(sp)
c000c514:	10078a63          	beqz	a5,c000c628 <stride_dequeue+0x17c4>
c000c518:	00078593          	mv	a1,a5
c000c51c:	000c0513          	mv	a0,s8
c000c520:	03e12423          	sw	t5,40(sp)
c000c524:	c64fe0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000c528:	02c12783          	lw	a5,44(sp)
c000c52c:	02812f03          	lw	t5,40(sp)
c000c530:	00f51463          	bne	a0,a5,c000c538 <stride_dequeue+0x16d4>
c000c534:	1310106f          	j	c000de64 <stride_dequeue+0x3000>
c000c538:	02012783          	lw	a5,32(sp)
c000c53c:	0087a283          	lw	t0,8(a5)
c000c540:	0047a783          	lw	a5,4(a5)
c000c544:	02f12423          	sw	a5,40(sp)
c000c548:	0c028463          	beqz	t0,c000c610 <stride_dequeue+0x17ac>
c000c54c:	00028593          	mv	a1,t0
c000c550:	000c0513          	mv	a0,s8
c000c554:	03e12823          	sw	t5,48(sp)
c000c558:	02512623          	sw	t0,44(sp)
c000c55c:	c2cfe0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000c560:	fff00393          	li	t2,-1
c000c564:	02c12283          	lw	t0,44(sp)
c000c568:	03012f03          	lw	t5,48(sp)
c000c56c:	00751463          	bne	a0,t2,c000c574 <stride_dequeue+0x1710>
c000c570:	32d0106f          	j	c000e09c <stride_dequeue+0x3238>
c000c574:	0042a783          	lw	a5,4(t0)
c000c578:	0082af83          	lw	t6,8(t0)
c000c57c:	02712e23          	sw	t2,60(sp)
c000c580:	02f12623          	sw	a5,44(sp)
c000c584:	060f8c63          	beqz	t6,c000c5fc <stride_dequeue+0x1798>
c000c588:	000f8593          	mv	a1,t6
c000c58c:	000c0513          	mv	a0,s8
c000c590:	02512c23          	sw	t0,56(sp)
c000c594:	03e12a23          	sw	t5,52(sp)
c000c598:	03f12823          	sw	t6,48(sp)
c000c59c:	becfe0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000c5a0:	03c12383          	lw	t2,60(sp)
c000c5a4:	03012f83          	lw	t6,48(sp)
c000c5a8:	03412f03          	lw	t5,52(sp)
c000c5ac:	03812283          	lw	t0,56(sp)
c000c5b0:	00751463          	bne	a0,t2,c000c5b8 <stride_dequeue+0x1754>
c000c5b4:	4d50106f          	j	c000e288 <stride_dequeue+0x3424>
c000c5b8:	008fa583          	lw	a1,8(t6)
c000c5bc:	000c0513          	mv	a0,s8
c000c5c0:	004fa403          	lw	s0,4(t6)
c000c5c4:	02512c23          	sw	t0,56(sp)
c000c5c8:	03e12a23          	sw	t5,52(sp)
c000c5cc:	03f12823          	sw	t6,48(sp)
c000c5d0:	c44fe0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000c5d4:	03012f83          	lw	t6,48(sp)
c000c5d8:	03412f03          	lw	t5,52(sp)
c000c5dc:	03812283          	lw	t0,56(sp)
c000c5e0:	00afa223          	sw	a0,4(t6)
c000c5e4:	008fa423          	sw	s0,8(t6)
c000c5e8:	00051463          	bnez	a0,c000c5f0 <stride_dequeue+0x178c>
c000c5ec:	5290106f          	j	c000e314 <stride_dequeue+0x34b0>
c000c5f0:	008ba403          	lw	s0,8(s7)
c000c5f4:	01f52023          	sw	t6,0(a0)
c000c5f8:	000f8c13          	mv	s8,t6
c000c5fc:	02c12783          	lw	a5,44(sp)
c000c600:	0182a223          	sw	s8,4(t0)
c000c604:	00f2a423          	sw	a5,8(t0)
c000c608:	005c2023          	sw	t0,0(s8)
c000c60c:	00028c13          	mv	s8,t0
c000c610:	02012783          	lw	a5,32(sp)
c000c614:	02812703          	lw	a4,40(sp)
c000c618:	0187a223          	sw	s8,4(a5)
c000c61c:	00e7a423          	sw	a4,8(a5)
c000c620:	00fc2023          	sw	a5,0(s8)
c000c624:	00078c13          	mv	s8,a5
c000c628:	02412783          	lw	a5,36(sp)
c000c62c:	018f2223          	sw	s8,4(t5)
c000c630:	00ff2423          	sw	a5,8(t5)
c000c634:	01ec2023          	sw	t5,0(s8)
c000c638:	01c12783          	lw	a5,28(sp)
c000c63c:	01eda223          	sw	t5,4(s11)
c000c640:	00fda423          	sw	a5,8(s11)
c000c644:	01bf2023          	sw	s11,0(t5)
c000c648:	01812783          	lw	a5,24(sp)
c000c64c:	01baa223          	sw	s11,4(s5)
c000c650:	00040c13          	mv	s8,s0
c000c654:	00faa423          	sw	a5,8(s5)
c000c658:	015da023          	sw	s5,0(s11)
c000c65c:	cc9fe06f          	j	c000b324 <stride_dequeue+0x4c0>
c000c660:	004aa783          	lw	a5,4(s5)
c000c664:	008aac03          	lw	s8,8(s5)
c000c668:	00f12c23          	sw	a5,24(sp)
c000c66c:	180c0c63          	beqz	s8,c000c804 <stride_dequeue+0x19a0>
c000c670:	000e0593          	mv	a1,t3
c000c674:	000c0513          	mv	a0,s8
c000c678:	b10fe0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000c67c:	01c12e03          	lw	t3,28(sp)
c000c680:	63b504e3          	beq	a0,s11,c000d4a8 <stride_dequeue+0x2644>
c000c684:	004e2783          	lw	a5,4(t3)
c000c688:	008e2f03          	lw	t5,8(t3)
c000c68c:	00f12e23          	sw	a5,28(sp)
c000c690:	000f1463          	bnez	t5,c000c698 <stride_dequeue+0x1834>
c000c694:	19c0106f          	j	c000d830 <stride_dequeue+0x29cc>
c000c698:	000f0593          	mv	a1,t5
c000c69c:	000c0513          	mv	a0,s8
c000c6a0:	03c12223          	sw	t3,36(sp)
c000c6a4:	03e12023          	sw	t5,32(sp)
c000c6a8:	ae0fe0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000c6ac:	02012f03          	lw	t5,32(sp)
c000c6b0:	02412e03          	lw	t3,36(sp)
c000c6b4:	01b51463          	bne	a0,s11,c000c6bc <stride_dequeue+0x1858>
c000c6b8:	2840106f          	j	c000d93c <stride_dequeue+0x2ad8>
c000c6bc:	008f2783          	lw	a5,8(t5)
c000c6c0:	004f2703          	lw	a4,4(t5)
c000c6c4:	02f12023          	sw	a5,32(sp)
c000c6c8:	02e12223          	sw	a4,36(sp)
c000c6cc:	10078c63          	beqz	a5,c000c7e4 <stride_dequeue+0x1980>
c000c6d0:	00078593          	mv	a1,a5
c000c6d4:	000c0513          	mv	a0,s8
c000c6d8:	03e12623          	sw	t5,44(sp)
c000c6dc:	03c12423          	sw	t3,40(sp)
c000c6e0:	aa8fe0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000c6e4:	02812e03          	lw	t3,40(sp)
c000c6e8:	02c12f03          	lw	t5,44(sp)
c000c6ec:	01b51463          	bne	a0,s11,c000c6f4 <stride_dequeue+0x1890>
c000c6f0:	6280106f          	j	c000dd18 <stride_dequeue+0x2eb4>
c000c6f4:	02012783          	lw	a5,32(sp)
c000c6f8:	0087ad83          	lw	s11,8(a5)
c000c6fc:	0047a783          	lw	a5,4(a5)
c000c700:	02f12423          	sw	a5,40(sp)
c000c704:	0c0d8463          	beqz	s11,c000c7cc <stride_dequeue+0x1968>
c000c708:	000d8593          	mv	a1,s11
c000c70c:	000c0513          	mv	a0,s8
c000c710:	03e12823          	sw	t5,48(sp)
c000c714:	03c12623          	sw	t3,44(sp)
c000c718:	a70fe0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000c71c:	fff00393          	li	t2,-1
c000c720:	02c12e03          	lw	t3,44(sp)
c000c724:	03012f03          	lw	t5,48(sp)
c000c728:	00751463          	bne	a0,t2,c000c730 <stride_dequeue+0x18cc>
c000c72c:	2ed0106f          	j	c000e218 <stride_dequeue+0x33b4>
c000c730:	004da783          	lw	a5,4(s11)
c000c734:	008daf83          	lw	t6,8(s11)
c000c738:	02712e23          	sw	t2,60(sp)
c000c73c:	02f12623          	sw	a5,44(sp)
c000c740:	060f8c63          	beqz	t6,c000c7b8 <stride_dequeue+0x1954>
c000c744:	000f8593          	mv	a1,t6
c000c748:	000c0513          	mv	a0,s8
c000c74c:	03e12c23          	sw	t5,56(sp)
c000c750:	03c12a23          	sw	t3,52(sp)
c000c754:	03f12823          	sw	t6,48(sp)
c000c758:	a30fe0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000c75c:	03c12383          	lw	t2,60(sp)
c000c760:	03012f83          	lw	t6,48(sp)
c000c764:	03412e03          	lw	t3,52(sp)
c000c768:	03812f03          	lw	t5,56(sp)
c000c76c:	00751463          	bne	a0,t2,c000c774 <stride_dequeue+0x1910>
c000c770:	0e90106f          	j	c000e058 <stride_dequeue+0x31f4>
c000c774:	008fa583          	lw	a1,8(t6)
c000c778:	000c0513          	mv	a0,s8
c000c77c:	004fa403          	lw	s0,4(t6)
c000c780:	03e12c23          	sw	t5,56(sp)
c000c784:	03c12a23          	sw	t3,52(sp)
c000c788:	03f12823          	sw	t6,48(sp)
c000c78c:	a88fe0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000c790:	03012f83          	lw	t6,48(sp)
c000c794:	03412e03          	lw	t3,52(sp)
c000c798:	03812f03          	lw	t5,56(sp)
c000c79c:	00afa223          	sw	a0,4(t6)
c000c7a0:	008fa423          	sw	s0,8(t6)
c000c7a4:	00051463          	bnez	a0,c000c7ac <stride_dequeue+0x1948>
c000c7a8:	3cd0106f          	j	c000e374 <stride_dequeue+0x3510>
c000c7ac:	008ba403          	lw	s0,8(s7)
c000c7b0:	01f52023          	sw	t6,0(a0)
c000c7b4:	000f8c13          	mv	s8,t6
c000c7b8:	02c12783          	lw	a5,44(sp)
c000c7bc:	018da223          	sw	s8,4(s11)
c000c7c0:	00fda423          	sw	a5,8(s11)
c000c7c4:	01bc2023          	sw	s11,0(s8)
c000c7c8:	000d8c13          	mv	s8,s11
c000c7cc:	02012783          	lw	a5,32(sp)
c000c7d0:	02812703          	lw	a4,40(sp)
c000c7d4:	0187a223          	sw	s8,4(a5)
c000c7d8:	00e7a423          	sw	a4,8(a5)
c000c7dc:	00fc2023          	sw	a5,0(s8)
c000c7e0:	00078c13          	mv	s8,a5
c000c7e4:	02412783          	lw	a5,36(sp)
c000c7e8:	018f2223          	sw	s8,4(t5)
c000c7ec:	00ff2423          	sw	a5,8(t5)
c000c7f0:	01ec2023          	sw	t5,0(s8)
c000c7f4:	01c12783          	lw	a5,28(sp)
c000c7f8:	01ee2223          	sw	t5,4(t3)
c000c7fc:	00fe2423          	sw	a5,8(t3)
c000c800:	01cf2023          	sw	t3,0(t5)
c000c804:	01812783          	lw	a5,24(sp)
c000c808:	01caa223          	sw	t3,4(s5)
c000c80c:	00040c13          	mv	s8,s0
c000c810:	00faa423          	sw	a5,8(s5)
c000c814:	015e2023          	sw	s5,0(t3)
c000c818:	f25fe06f          	j	c000b73c <stride_dequeue+0x8d8>
c000c81c:	004d2783          	lw	a5,4(s10)
c000c820:	008d2c03          	lw	s8,8(s10)
c000c824:	00a12c23          	sw	a0,24(sp)
c000c828:	00f12a23          	sw	a5,20(sp)
c000c82c:	040c0663          	beqz	s8,c000c878 <stride_dequeue+0x1a14>
c000c830:	00088593          	mv	a1,a7
c000c834:	000c0513          	mv	a0,s8
c000c838:	01112e23          	sw	a7,28(sp)
c000c83c:	94cfe0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000c840:	01812783          	lw	a5,24(sp)
c000c844:	01c12883          	lw	a7,28(sp)
c000c848:	4cf500e3          	beq	a0,a5,c000d508 <stride_dequeue+0x26a4>
c000c84c:	0088a583          	lw	a1,8(a7)
c000c850:	000c0513          	mv	a0,s8
c000c854:	0048a403          	lw	s0,4(a7)
c000c858:	01112c23          	sw	a7,24(sp)
c000c85c:	9b8fe0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000c860:	01812883          	lw	a7,24(sp)
c000c864:	00a8a223          	sw	a0,4(a7)
c000c868:	0088a423          	sw	s0,8(a7)
c000c86c:	00050463          	beqz	a0,c000c874 <stride_dequeue+0x1a10>
c000c870:	01152023          	sw	a7,0(a0)
c000c874:	008ba403          	lw	s0,8(s7)
c000c878:	01412783          	lw	a5,20(sp)
c000c87c:	011d2223          	sw	a7,4(s10)
c000c880:	00040c13          	mv	s8,s0
c000c884:	00fd2423          	sw	a5,8(s10)
c000c888:	01a8a023          	sw	s10,0(a7)
c000c88c:	ca1fe06f          	j	c000b52c <stride_dequeue+0x6c8>
c000c890:	004e2783          	lw	a5,4(t3)
c000c894:	008e2d83          	lw	s11,8(t3)
c000c898:	00a12e23          	sw	a0,28(sp)
c000c89c:	00f12c23          	sw	a5,24(sp)
c000c8a0:	1a0d8063          	beqz	s11,c000ca40 <stride_dequeue+0x1bdc>
c000c8a4:	000a8593          	mv	a1,s5
c000c8a8:	000d8513          	mv	a0,s11
c000c8ac:	03c12023          	sw	t3,32(sp)
c000c8b0:	8d8fe0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000c8b4:	01c12783          	lw	a5,28(sp)
c000c8b8:	02012e03          	lw	t3,32(sp)
c000c8bc:	40f50ce3          	beq	a0,a5,c000d4d4 <stride_dequeue+0x2670>
c000c8c0:	02f12023          	sw	a5,32(sp)
c000c8c4:	004aa783          	lw	a5,4(s5)
c000c8c8:	008aac03          	lw	s8,8(s5)
c000c8cc:	00f12e23          	sw	a5,28(sp)
c000c8d0:	000c1463          	bnez	s8,c000c8d8 <stride_dequeue+0x1a74>
c000c8d4:	76d0006f          	j	c000d840 <stride_dequeue+0x29dc>
c000c8d8:	000c0593          	mv	a1,s8
c000c8dc:	000d8513          	mv	a0,s11
c000c8e0:	03c12223          	sw	t3,36(sp)
c000c8e4:	8a4fe0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000c8e8:	02012783          	lw	a5,32(sp)
c000c8ec:	02412e03          	lw	t3,36(sp)
c000c8f0:	00f51463          	bne	a0,a5,c000c8f8 <stride_dequeue+0x1a94>
c000c8f4:	7550006f          	j	c000d848 <stride_dequeue+0x29e4>
c000c8f8:	02f12623          	sw	a5,44(sp)
c000c8fc:	004c2703          	lw	a4,4(s8)
c000c900:	008c2783          	lw	a5,8(s8)
c000c904:	02e12223          	sw	a4,36(sp)
c000c908:	02f12023          	sw	a5,32(sp)
c000c90c:	10078a63          	beqz	a5,c000ca20 <stride_dequeue+0x1bbc>
c000c910:	00078593          	mv	a1,a5
c000c914:	000d8513          	mv	a0,s11
c000c918:	03c12423          	sw	t3,40(sp)
c000c91c:	86cfe0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000c920:	02c12783          	lw	a5,44(sp)
c000c924:	02812e03          	lw	t3,40(sp)
c000c928:	00f51463          	bne	a0,a5,c000c930 <stride_dequeue+0x1acc>
c000c92c:	4dc0106f          	j	c000de08 <stride_dequeue+0x2fa4>
c000c930:	02012783          	lw	a5,32(sp)
c000c934:	0087a283          	lw	t0,8(a5)
c000c938:	0047a783          	lw	a5,4(a5)
c000c93c:	02f12423          	sw	a5,40(sp)
c000c940:	0c028463          	beqz	t0,c000ca08 <stride_dequeue+0x1ba4>
c000c944:	00028593          	mv	a1,t0
c000c948:	000d8513          	mv	a0,s11
c000c94c:	03c12823          	sw	t3,48(sp)
c000c950:	02512623          	sw	t0,44(sp)
c000c954:	834fe0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000c958:	fff00393          	li	t2,-1
c000c95c:	02c12283          	lw	t0,44(sp)
c000c960:	03012e03          	lw	t3,48(sp)
c000c964:	00751463          	bne	a0,t2,c000c96c <stride_dequeue+0x1b08>
c000c968:	6840106f          	j	c000dfec <stride_dequeue+0x3188>
c000c96c:	0042a783          	lw	a5,4(t0)
c000c970:	0082af83          	lw	t6,8(t0)
c000c974:	02712e23          	sw	t2,60(sp)
c000c978:	02f12623          	sw	a5,44(sp)
c000c97c:	060f8c63          	beqz	t6,c000c9f4 <stride_dequeue+0x1b90>
c000c980:	000f8593          	mv	a1,t6
c000c984:	000d8513          	mv	a0,s11
c000c988:	02512c23          	sw	t0,56(sp)
c000c98c:	03c12a23          	sw	t3,52(sp)
c000c990:	03f12823          	sw	t6,48(sp)
c000c994:	ff5fd0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000c998:	03c12383          	lw	t2,60(sp)
c000c99c:	03012f83          	lw	t6,48(sp)
c000c9a0:	03412e03          	lw	t3,52(sp)
c000c9a4:	03812283          	lw	t0,56(sp)
c000c9a8:	00751463          	bne	a0,t2,c000c9b0 <stride_dequeue+0x1b4c>
c000c9ac:	7380106f          	j	c000e0e4 <stride_dequeue+0x3280>
c000c9b0:	008fa583          	lw	a1,8(t6)
c000c9b4:	000d8513          	mv	a0,s11
c000c9b8:	004fa403          	lw	s0,4(t6)
c000c9bc:	02512c23          	sw	t0,56(sp)
c000c9c0:	03c12a23          	sw	t3,52(sp)
c000c9c4:	03f12823          	sw	t6,48(sp)
c000c9c8:	84cfe0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000c9cc:	03012f83          	lw	t6,48(sp)
c000c9d0:	03412e03          	lw	t3,52(sp)
c000c9d4:	03812283          	lw	t0,56(sp)
c000c9d8:	00afa223          	sw	a0,4(t6)
c000c9dc:	008fa423          	sw	s0,8(t6)
c000c9e0:	00051463          	bnez	a0,c000c9e8 <stride_dequeue+0x1b84>
c000c9e4:	1550106f          	j	c000e338 <stride_dequeue+0x34d4>
c000c9e8:	008ba403          	lw	s0,8(s7)
c000c9ec:	01f52023          	sw	t6,0(a0)
c000c9f0:	000f8d93          	mv	s11,t6
c000c9f4:	02c12783          	lw	a5,44(sp)
c000c9f8:	01b2a223          	sw	s11,4(t0)
c000c9fc:	00f2a423          	sw	a5,8(t0)
c000ca00:	005da023          	sw	t0,0(s11)
c000ca04:	00028d93          	mv	s11,t0
c000ca08:	02012783          	lw	a5,32(sp)
c000ca0c:	02812703          	lw	a4,40(sp)
c000ca10:	01b7a223          	sw	s11,4(a5)
c000ca14:	00e7a423          	sw	a4,8(a5)
c000ca18:	00fda023          	sw	a5,0(s11)
c000ca1c:	00078d93          	mv	s11,a5
c000ca20:	02412783          	lw	a5,36(sp)
c000ca24:	01bc2223          	sw	s11,4(s8)
c000ca28:	00fc2423          	sw	a5,8(s8)
c000ca2c:	018da023          	sw	s8,0(s11)
c000ca30:	01c12783          	lw	a5,28(sp)
c000ca34:	018aa223          	sw	s8,4(s5)
c000ca38:	00faa423          	sw	a5,8(s5)
c000ca3c:	015c2023          	sw	s5,0(s8)
c000ca40:	01812783          	lw	a5,24(sp)
c000ca44:	015e2223          	sw	s5,4(t3)
c000ca48:	00040c13          	mv	s8,s0
c000ca4c:	00fe2423          	sw	a5,8(t3)
c000ca50:	01caa023          	sw	t3,0(s5)
c000ca54:	000e0a93          	mv	s5,t3
c000ca58:	980ff06f          	j	c000bbd8 <stride_dequeue+0xd74>
c000ca5c:	004da783          	lw	a5,4(s11)
c000ca60:	008dac03          	lw	s8,8(s11)
c000ca64:	00a12a23          	sw	a0,20(sp)
c000ca68:	00f12823          	sw	a5,16(sp)
c000ca6c:	020c0e63          	beqz	s8,c000caa8 <stride_dequeue+0x1c44>
c000ca70:	000d0593          	mv	a1,s10
c000ca74:	000c0513          	mv	a0,s8
c000ca78:	f11fd0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000ca7c:	01412783          	lw	a5,20(sp)
c000ca80:	38f50ae3          	beq	a0,a5,c000d614 <stride_dequeue+0x27b0>
c000ca84:	008d2583          	lw	a1,8(s10)
c000ca88:	004d2403          	lw	s0,4(s10)
c000ca8c:	000c0513          	mv	a0,s8
c000ca90:	f85fd0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000ca94:	00ad2223          	sw	a0,4(s10)
c000ca98:	008d2423          	sw	s0,8(s10)
c000ca9c:	00050463          	beqz	a0,c000caa4 <stride_dequeue+0x1c40>
c000caa0:	01a52023          	sw	s10,0(a0)
c000caa4:	008ba403          	lw	s0,8(s7)
c000caa8:	01012783          	lw	a5,16(sp)
c000caac:	01ada223          	sw	s10,4(s11)
c000cab0:	00040c13          	mv	s8,s0
c000cab4:	00fda423          	sw	a5,8(s11)
c000cab8:	01bd2023          	sw	s11,0(s10)
c000cabc:	000d8d13          	mv	s10,s11
c000cac0:	bd4ff06f          	j	c000be94 <stride_dequeue+0x1030>
c000cac4:	004b2783          	lw	a5,4(s6)
c000cac8:	008b2c03          	lw	s8,8(s6)
c000cacc:	00a12a23          	sw	a0,20(sp)
c000cad0:	00f12823          	sw	a5,16(sp)
c000cad4:	020c0e63          	beqz	s8,c000cb10 <stride_dequeue+0x1cac>
c000cad8:	000d8593          	mv	a1,s11
c000cadc:	000c0513          	mv	a0,s8
c000cae0:	ea9fd0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000cae4:	01412783          	lw	a5,20(sp)
c000cae8:	34f50ce3          	beq	a0,a5,c000d640 <stride_dequeue+0x27dc>
c000caec:	008da583          	lw	a1,8(s11)
c000caf0:	004da403          	lw	s0,4(s11)
c000caf4:	000c0513          	mv	a0,s8
c000caf8:	f1dfd0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000cafc:	00ada223          	sw	a0,4(s11)
c000cb00:	008da423          	sw	s0,8(s11)
c000cb04:	00050463          	beqz	a0,c000cb0c <stride_dequeue+0x1ca8>
c000cb08:	01b52023          	sw	s11,0(a0)
c000cb0c:	008ba403          	lw	s0,8(s7)
c000cb10:	01012783          	lw	a5,16(sp)
c000cb14:	01bb2223          	sw	s11,4(s6)
c000cb18:	00040c13          	mv	s8,s0
c000cb1c:	00fb2423          	sw	a5,8(s6)
c000cb20:	016da023          	sw	s6,0(s11)
c000cb24:	000b0d93          	mv	s11,s6
c000cb28:	a10ff06f          	j	c000bd38 <stride_dequeue+0xed4>
c000cb2c:	004b2783          	lw	a5,4(s6)
c000cb30:	008b2c03          	lw	s8,8(s6)
c000cb34:	00a12a23          	sw	a0,20(sp)
c000cb38:	00f12823          	sw	a5,16(sp)
c000cb3c:	020c0e63          	beqz	s8,c000cb78 <stride_dequeue+0x1d14>
c000cb40:	000d8593          	mv	a1,s11
c000cb44:	000c0513          	mv	a0,s8
c000cb48:	e41fd0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000cb4c:	01412783          	lw	a5,20(sp)
c000cb50:	30f50ee3          	beq	a0,a5,c000d66c <stride_dequeue+0x2808>
c000cb54:	008da583          	lw	a1,8(s11)
c000cb58:	004da403          	lw	s0,4(s11)
c000cb5c:	000c0513          	mv	a0,s8
c000cb60:	eb5fd0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000cb64:	00ada223          	sw	a0,4(s11)
c000cb68:	008da423          	sw	s0,8(s11)
c000cb6c:	00050463          	beqz	a0,c000cb74 <stride_dequeue+0x1d10>
c000cb70:	01b52023          	sw	s11,0(a0)
c000cb74:	008ba403          	lw	s0,8(s7)
c000cb78:	01012783          	lw	a5,16(sp)
c000cb7c:	01bb2223          	sw	s11,4(s6)
c000cb80:	00040c13          	mv	s8,s0
c000cb84:	00fb2423          	sw	a5,8(s6)
c000cb88:	016da023          	sw	s6,0(s11)
c000cb8c:	ed9fe06f          	j	c000ba64 <stride_dequeue+0xc00>
c000cb90:	008ca503          	lw	a0,8(s9)
c000cb94:	004cac03          	lw	s8,4(s9)
c000cb98:	00040593          	mv	a1,s0
c000cb9c:	03c12023          	sw	t3,32(sp)
c000cba0:	e75fd0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000cba4:	00aca223          	sw	a0,4(s9)
c000cba8:	018ca423          	sw	s8,8(s9)
c000cbac:	02012e03          	lw	t3,32(sp)
c000cbb0:	00050463          	beqz	a0,c000cbb8 <stride_dequeue+0x1d54>
c000cbb4:	01952023          	sw	s9,0(a0)
c000cbb8:	008bac03          	lw	s8,8(s7)
c000cbbc:	d10fe06f          	j	c000b0cc <stride_dequeue+0x268>
c000cbc0:	008ea783          	lw	a5,8(t4)
c000cbc4:	00a12e23          	sw	a0,28(sp)
c000cbc8:	004eac03          	lw	s8,4(t4)
c000cbcc:	04078c63          	beqz	a5,c000cc24 <stride_dequeue+0x1dc0>
c000cbd0:	00078513          	mv	a0,a5
c000cbd4:	000d8593          	mv	a1,s11
c000cbd8:	03d12223          	sw	t4,36(sp)
c000cbdc:	02f12023          	sw	a5,32(sp)
c000cbe0:	da9fd0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000cbe4:	01c12703          	lw	a4,28(sp)
c000cbe8:	02012783          	lw	a5,32(sp)
c000cbec:	02412e83          	lw	t4,36(sp)
c000cbf0:	00e51463          	bne	a0,a4,c000cbf8 <stride_dequeue+0x1d94>
c000cbf4:	7b10006f          	j	c000dba4 <stride_dequeue+0x2d40>
c000cbf8:	008da583          	lw	a1,8(s11)
c000cbfc:	004da403          	lw	s0,4(s11)
c000cc00:	00078513          	mv	a0,a5
c000cc04:	01d12e23          	sw	t4,28(sp)
c000cc08:	e0dfd0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000cc0c:	00ada223          	sw	a0,4(s11)
c000cc10:	008da423          	sw	s0,8(s11)
c000cc14:	01c12e83          	lw	t4,28(sp)
c000cc18:	00050463          	beqz	a0,c000cc20 <stride_dequeue+0x1dbc>
c000cc1c:	01b52023          	sw	s11,0(a0)
c000cc20:	008ba403          	lw	s0,8(s7)
c000cc24:	01bea223          	sw	s11,4(t4)
c000cc28:	018ea423          	sw	s8,8(t4)
c000cc2c:	01dda023          	sw	t4,0(s11)
c000cc30:	00040c13          	mv	s8,s0
c000cc34:	000e8d93          	mv	s11,t4
c000cc38:	ca9fe06f          	j	c000b8e0 <stride_dequeue+0xa7c>
c000cc3c:	004e2783          	lw	a5,4(t3)
c000cc40:	008e2d83          	lw	s11,8(t3)
c000cc44:	02a12023          	sw	a0,32(sp)
c000cc48:	00f12e23          	sw	a5,28(sp)
c000cc4c:	160d8c63          	beqz	s11,c000cdc4 <stride_dequeue+0x1f60>
c000cc50:	000e8593          	mv	a1,t4
c000cc54:	000d8513          	mv	a0,s11
c000cc58:	03c12423          	sw	t3,40(sp)
c000cc5c:	03d12223          	sw	t4,36(sp)
c000cc60:	d29fd0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000cc64:	02012783          	lw	a5,32(sp)
c000cc68:	02412e83          	lw	t4,36(sp)
c000cc6c:	02812e03          	lw	t3,40(sp)
c000cc70:	00f51463          	bne	a0,a5,c000cc78 <stride_dequeue+0x1e14>
c000cc74:	76d0006f          	j	c000dbe0 <stride_dequeue+0x2d7c>
c000cc78:	02f12623          	sw	a5,44(sp)
c000cc7c:	004ea783          	lw	a5,4(t4)
c000cc80:	008eac03          	lw	s8,8(t4)
c000cc84:	02f12023          	sw	a5,32(sp)
c000cc88:	120c0663          	beqz	s8,c000cdb4 <stride_dequeue+0x1f50>
c000cc8c:	000c0593          	mv	a1,s8
c000cc90:	000d8513          	mv	a0,s11
c000cc94:	03d12423          	sw	t4,40(sp)
c000cc98:	03c12223          	sw	t3,36(sp)
c000cc9c:	cedfd0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000cca0:	02c12783          	lw	a5,44(sp)
c000cca4:	02412e03          	lw	t3,36(sp)
c000cca8:	02812e83          	lw	t4,40(sp)
c000ccac:	00f51463          	bne	a0,a5,c000ccb4 <stride_dequeue+0x1e50>
c000ccb0:	0f80106f          	j	c000dda8 <stride_dequeue+0x2f44>
c000ccb4:	004c2783          	lw	a5,4(s8)
c000ccb8:	008c2283          	lw	t0,8(s8)
c000ccbc:	02f12223          	sw	a5,36(sp)
c000ccc0:	0e028063          	beqz	t0,c000cda0 <stride_dequeue+0x1f3c>
c000ccc4:	00028593          	mv	a1,t0
c000ccc8:	000d8513          	mv	a0,s11
c000cccc:	03d12823          	sw	t4,48(sp)
c000ccd0:	03c12623          	sw	t3,44(sp)
c000ccd4:	02512423          	sw	t0,40(sp)
c000ccd8:	cb1fd0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000ccdc:	fff00393          	li	t2,-1
c000cce0:	02812283          	lw	t0,40(sp)
c000cce4:	02c12e03          	lw	t3,44(sp)
c000cce8:	03012e83          	lw	t4,48(sp)
c000ccec:	00751463          	bne	a0,t2,c000ccf4 <stride_dequeue+0x1e90>
c000ccf0:	46c0106f          	j	c000e15c <stride_dequeue+0x32f8>
c000ccf4:	0042a783          	lw	a5,4(t0)
c000ccf8:	0082af83          	lw	t6,8(t0)
c000ccfc:	02712e23          	sw	t2,60(sp)
c000cd00:	02f12423          	sw	a5,40(sp)
c000cd04:	080f8463          	beqz	t6,c000cd8c <stride_dequeue+0x1f28>
c000cd08:	000f8593          	mv	a1,t6
c000cd0c:	000d8513          	mv	a0,s11
c000cd10:	02512c23          	sw	t0,56(sp)
c000cd14:	03d12a23          	sw	t4,52(sp)
c000cd18:	03c12823          	sw	t3,48(sp)
c000cd1c:	03f12623          	sw	t6,44(sp)
c000cd20:	c69fd0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000cd24:	03c12383          	lw	t2,60(sp)
c000cd28:	02c12f83          	lw	t6,44(sp)
c000cd2c:	03012e03          	lw	t3,48(sp)
c000cd30:	03412e83          	lw	t4,52(sp)
c000cd34:	03812283          	lw	t0,56(sp)
c000cd38:	00751463          	bne	a0,t2,c000cd40 <stride_dequeue+0x1edc>
c000cd3c:	4900106f          	j	c000e1cc <stride_dequeue+0x3368>
c000cd40:	008fa583          	lw	a1,8(t6)
c000cd44:	000d8513          	mv	a0,s11
c000cd48:	004fa403          	lw	s0,4(t6)
c000cd4c:	02512c23          	sw	t0,56(sp)
c000cd50:	03d12a23          	sw	t4,52(sp)
c000cd54:	03c12823          	sw	t3,48(sp)
c000cd58:	03f12623          	sw	t6,44(sp)
c000cd5c:	cb9fd0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000cd60:	02c12f83          	lw	t6,44(sp)
c000cd64:	03012e03          	lw	t3,48(sp)
c000cd68:	03412e83          	lw	t4,52(sp)
c000cd6c:	00afa223          	sw	a0,4(t6)
c000cd70:	008fa423          	sw	s0,8(t6)
c000cd74:	03812283          	lw	t0,56(sp)
c000cd78:	00051463          	bnez	a0,c000cd80 <stride_dequeue+0x1f1c>
c000cd7c:	5b00106f          	j	c000e32c <stride_dequeue+0x34c8>
c000cd80:	008ba403          	lw	s0,8(s7)
c000cd84:	01f52023          	sw	t6,0(a0)
c000cd88:	000f8d93          	mv	s11,t6
c000cd8c:	02812783          	lw	a5,40(sp)
c000cd90:	01b2a223          	sw	s11,4(t0)
c000cd94:	00f2a423          	sw	a5,8(t0)
c000cd98:	005da023          	sw	t0,0(s11)
c000cd9c:	00028d93          	mv	s11,t0
c000cda0:	02412783          	lw	a5,36(sp)
c000cda4:	01bc2223          	sw	s11,4(s8)
c000cda8:	00fc2423          	sw	a5,8(s8)
c000cdac:	018da023          	sw	s8,0(s11)
c000cdb0:	000c0d93          	mv	s11,s8
c000cdb4:	02012783          	lw	a5,32(sp)
c000cdb8:	01bea223          	sw	s11,4(t4)
c000cdbc:	00fea423          	sw	a5,8(t4)
c000cdc0:	01dda023          	sw	t4,0(s11)
c000cdc4:	01c12783          	lw	a5,28(sp)
c000cdc8:	01de2223          	sw	t4,4(t3)
c000cdcc:	00040c13          	mv	s8,s0
c000cdd0:	00fe2423          	sw	a5,8(t3)
c000cdd4:	01cea023          	sw	t3,0(t4)
c000cdd8:	df1fe06f          	j	c000bbc8 <stride_dequeue+0xd64>
c000cddc:	004aa783          	lw	a5,4(s5)
c000cde0:	008aac03          	lw	s8,8(s5)
c000cde4:	02a12023          	sw	a0,32(sp)
c000cde8:	00f12e23          	sw	a5,28(sp)
c000cdec:	140c0c63          	beqz	s8,c000cf44 <stride_dequeue+0x20e0>
c000cdf0:	000e8593          	mv	a1,t4
c000cdf4:	000c0513          	mv	a0,s8
c000cdf8:	03d12223          	sw	t4,36(sp)
c000cdfc:	b8dfd0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000ce00:	02012783          	lw	a5,32(sp)
c000ce04:	02412e83          	lw	t4,36(sp)
c000ce08:	52f500e3          	beq	a0,a5,c000db28 <stride_dequeue+0x2cc4>
c000ce0c:	02f12623          	sw	a5,44(sp)
c000ce10:	004ea703          	lw	a4,4(t4)
c000ce14:	008ea783          	lw	a5,8(t4)
c000ce18:	02e12223          	sw	a4,36(sp)
c000ce1c:	02f12023          	sw	a5,32(sp)
c000ce20:	10078a63          	beqz	a5,c000cf34 <stride_dequeue+0x20d0>
c000ce24:	00078593          	mv	a1,a5
c000ce28:	000c0513          	mv	a0,s8
c000ce2c:	03d12423          	sw	t4,40(sp)
c000ce30:	b59fd0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000ce34:	02c12783          	lw	a5,44(sp)
c000ce38:	02812e83          	lw	t4,40(sp)
c000ce3c:	00f51463          	bne	a0,a5,c000ce44 <stride_dequeue+0x1fe0>
c000ce40:	0800106f          	j	c000dec0 <stride_dequeue+0x305c>
c000ce44:	02012783          	lw	a5,32(sp)
c000ce48:	0087a283          	lw	t0,8(a5)
c000ce4c:	0047a783          	lw	a5,4(a5)
c000ce50:	02f12423          	sw	a5,40(sp)
c000ce54:	0c028463          	beqz	t0,c000cf1c <stride_dequeue+0x20b8>
c000ce58:	00028593          	mv	a1,t0
c000ce5c:	000c0513          	mv	a0,s8
c000ce60:	03d12823          	sw	t4,48(sp)
c000ce64:	02512623          	sw	t0,44(sp)
c000ce68:	b21fd0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000ce6c:	fff00393          	li	t2,-1
c000ce70:	02c12283          	lw	t0,44(sp)
c000ce74:	03012e83          	lw	t4,48(sp)
c000ce78:	00751463          	bne	a0,t2,c000ce80 <stride_dequeue+0x201c>
c000ce7c:	4500106f          	j	c000e2cc <stride_dequeue+0x3468>
c000ce80:	0042a783          	lw	a5,4(t0)
c000ce84:	0082af83          	lw	t6,8(t0)
c000ce88:	02712e23          	sw	t2,60(sp)
c000ce8c:	02f12623          	sw	a5,44(sp)
c000ce90:	060f8c63          	beqz	t6,c000cf08 <stride_dequeue+0x20a4>
c000ce94:	000f8593          	mv	a1,t6
c000ce98:	000c0513          	mv	a0,s8
c000ce9c:	02512c23          	sw	t0,56(sp)
c000cea0:	03d12a23          	sw	t4,52(sp)
c000cea4:	03f12823          	sw	t6,48(sp)
c000cea8:	ae1fd0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000ceac:	03c12383          	lw	t2,60(sp)
c000ceb0:	03012f83          	lw	t6,48(sp)
c000ceb4:	03412e83          	lw	t4,52(sp)
c000ceb8:	03812283          	lw	t0,56(sp)
c000cebc:	00751463          	bne	a0,t2,c000cec4 <stride_dequeue+0x2060>
c000cec0:	2d40106f          	j	c000e194 <stride_dequeue+0x3330>
c000cec4:	008fa583          	lw	a1,8(t6)
c000cec8:	000c0513          	mv	a0,s8
c000cecc:	004fa403          	lw	s0,4(t6)
c000ced0:	02512c23          	sw	t0,56(sp)
c000ced4:	03d12a23          	sw	t4,52(sp)
c000ced8:	03f12823          	sw	t6,48(sp)
c000cedc:	b39fd0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000cee0:	03012f83          	lw	t6,48(sp)
c000cee4:	03412e83          	lw	t4,52(sp)
c000cee8:	03812283          	lw	t0,56(sp)
c000ceec:	00afa223          	sw	a0,4(t6)
c000cef0:	008fa423          	sw	s0,8(t6)
c000cef4:	00051463          	bnez	a0,c000cefc <stride_dequeue+0x2098>
c000cef8:	4280106f          	j	c000e320 <stride_dequeue+0x34bc>
c000cefc:	008ba403          	lw	s0,8(s7)
c000cf00:	01f52023          	sw	t6,0(a0)
c000cf04:	000f8c13          	mv	s8,t6
c000cf08:	02c12783          	lw	a5,44(sp)
c000cf0c:	0182a223          	sw	s8,4(t0)
c000cf10:	00f2a423          	sw	a5,8(t0)
c000cf14:	005c2023          	sw	t0,0(s8)
c000cf18:	00028c13          	mv	s8,t0
c000cf1c:	02012783          	lw	a5,32(sp)
c000cf20:	02812703          	lw	a4,40(sp)
c000cf24:	0187a223          	sw	s8,4(a5)
c000cf28:	00e7a423          	sw	a4,8(a5)
c000cf2c:	00fc2023          	sw	a5,0(s8)
c000cf30:	00078c13          	mv	s8,a5
c000cf34:	02412783          	lw	a5,36(sp)
c000cf38:	018ea223          	sw	s8,4(t4)
c000cf3c:	00fea423          	sw	a5,8(t4)
c000cf40:	01dc2023          	sw	t4,0(s8)
c000cf44:	01c12783          	lw	a5,28(sp)
c000cf48:	01daa223          	sw	t4,4(s5)
c000cf4c:	00040c13          	mv	s8,s0
c000cf50:	00faa423          	sw	a5,8(s5)
c000cf54:	015ea023          	sw	s5,0(t4)
c000cf58:	bb8fe06f          	j	c000b310 <stride_dequeue+0x4ac>
c000cf5c:	008aa503          	lw	a0,8(s5)
c000cf60:	004aa403          	lw	s0,4(s5)
c000cf64:	000d8593          	mv	a1,s11
c000cf68:	01c12e23          	sw	t3,28(sp)
c000cf6c:	aa9fd0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000cf70:	00aaa223          	sw	a0,4(s5)
c000cf74:	008aa423          	sw	s0,8(s5)
c000cf78:	01c12e03          	lw	t3,28(sp)
c000cf7c:	00050463          	beqz	a0,c000cf84 <stride_dequeue+0x2120>
c000cf80:	01552023          	sw	s5,0(a0)
c000cf84:	008bac03          	lw	s8,8(s7)
c000cf88:	fa0fe06f          	j	c000b728 <stride_dequeue+0x8c4>
c000cf8c:	008d2503          	lw	a0,8(s10)
c000cf90:	004d2403          	lw	s0,4(s10)
c000cf94:	000e0593          	mv	a1,t3
c000cf98:	01112c23          	sw	a7,24(sp)
c000cf9c:	a79fd0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000cfa0:	00ad2223          	sw	a0,4(s10)
c000cfa4:	008d2423          	sw	s0,8(s10)
c000cfa8:	01812883          	lw	a7,24(sp)
c000cfac:	00050463          	beqz	a0,c000cfb4 <stride_dequeue+0x2150>
c000cfb0:	01a52023          	sw	s10,0(a0)
c000cfb4:	008bac03          	lw	s8,8(s7)
c000cfb8:	d60fe06f          	j	c000b518 <stride_dequeue+0x6b4>
c000cfbc:	008b2503          	lw	a0,8(s6)
c000cfc0:	004b2403          	lw	s0,4(s6)
c000cfc4:	00080593          	mv	a1,a6
c000cfc8:	a4dfd0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000cfcc:	00ab2223          	sw	a0,4(s6)
c000cfd0:	008b2423          	sw	s0,8(s6)
c000cfd4:	00050463          	beqz	a0,c000cfdc <stride_dequeue+0x2178>
c000cfd8:	01652023          	sw	s6,0(a0)
c000cfdc:	008bac03          	lw	s8,8(s7)
c000cfe0:	a71fe06f          	j	c000ba50 <stride_dequeue+0xbec>
c000cfe4:	0087ac03          	lw	s8,8(a5)
c000cfe8:	00a12c23          	sw	a0,24(sp)
c000cfec:	0047ad83          	lw	s11,4(a5)
c000cff0:	040c0663          	beqz	s8,c000d03c <stride_dequeue+0x21d8>
c000cff4:	000b0593          	mv	a1,s6
c000cff8:	000c0513          	mv	a0,s8
c000cffc:	00f12e23          	sw	a5,28(sp)
c000d000:	989fd0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000d004:	01c12783          	lw	a5,28(sp)
c000d008:	01812703          	lw	a4,24(sp)
c000d00c:	00f12c23          	sw	a5,24(sp)
c000d010:	4ae506e3          	beq	a0,a4,c000dcbc <stride_dequeue+0x2e58>
c000d014:	008b2583          	lw	a1,8(s6)
c000d018:	004b2403          	lw	s0,4(s6)
c000d01c:	000c0513          	mv	a0,s8
c000d020:	9f5fd0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000d024:	00ab2223          	sw	a0,4(s6)
c000d028:	008b2423          	sw	s0,8(s6)
c000d02c:	01812783          	lw	a5,24(sp)
c000d030:	00050463          	beqz	a0,c000d038 <stride_dequeue+0x21d4>
c000d034:	01652023          	sw	s6,0(a0)
c000d038:	008ba403          	lw	s0,8(s7)
c000d03c:	0167a223          	sw	s6,4(a5)
c000d040:	01b7a423          	sw	s11,8(a5)
c000d044:	00fb2023          	sw	a5,0(s6)
c000d048:	00040c13          	mv	s8,s0
c000d04c:	00078b13          	mv	s6,a5
c000d050:	a74ff06f          	j	c000c2c4 <stride_dequeue+0x1460>
c000d054:	0087ac03          	lw	s8,8(a5)
c000d058:	00a12c23          	sw	a0,24(sp)
c000d05c:	0047ad83          	lw	s11,4(a5)
c000d060:	040c0663          	beqz	s8,c000d0ac <stride_dequeue+0x2248>
c000d064:	000b0593          	mv	a1,s6
c000d068:	000c0513          	mv	a0,s8
c000d06c:	00f12e23          	sw	a5,28(sp)
c000d070:	919fd0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000d074:	01c12783          	lw	a5,28(sp)
c000d078:	01812703          	lw	a4,24(sp)
c000d07c:	00f12c23          	sw	a5,24(sp)
c000d080:	40e506e3          	beq	a0,a4,c000dc8c <stride_dequeue+0x2e28>
c000d084:	008b2583          	lw	a1,8(s6)
c000d088:	004b2403          	lw	s0,4(s6)
c000d08c:	000c0513          	mv	a0,s8
c000d090:	985fd0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000d094:	00ab2223          	sw	a0,4(s6)
c000d098:	008b2423          	sw	s0,8(s6)
c000d09c:	01812783          	lw	a5,24(sp)
c000d0a0:	00050463          	beqz	a0,c000d0a8 <stride_dequeue+0x2244>
c000d0a4:	01652023          	sw	s6,0(a0)
c000d0a8:	008ba403          	lw	s0,8(s7)
c000d0ac:	0167a223          	sw	s6,4(a5)
c000d0b0:	01b7a423          	sw	s11,8(a5)
c000d0b4:	00fb2023          	sw	a5,0(s6)
c000d0b8:	00040c13          	mv	s8,s0
c000d0bc:	00078b13          	mv	s6,a5
c000d0c0:	8acff06f          	j	c000c16c <stride_dequeue+0x1308>
c000d0c4:	008b2503          	lw	a0,8(s6)
c000d0c8:	004b2403          	lw	s0,4(s6)
c000d0cc:	00080593          	mv	a1,a6
c000d0d0:	945fd0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000d0d4:	00ab2223          	sw	a0,4(s6)
c000d0d8:	008b2423          	sw	s0,8(s6)
c000d0dc:	00050463          	beqz	a0,c000d0e4 <stride_dequeue+0x2280>
c000d0e0:	01652023          	sw	s6,0(a0)
c000d0e4:	008bac03          	lw	s8,8(s7)
c000d0e8:	c41fe06f          	j	c000bd28 <stride_dequeue+0xec4>
c000d0ec:	008da503          	lw	a0,8(s11)
c000d0f0:	004da403          	lw	s0,4(s11)
c000d0f4:	00078593          	mv	a1,a5
c000d0f8:	91dfd0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000d0fc:	00ada223          	sw	a0,4(s11)
c000d100:	008da423          	sw	s0,8(s11)
c000d104:	00050463          	beqz	a0,c000d10c <stride_dequeue+0x22a8>
c000d108:	01b52023          	sw	s11,0(a0)
c000d10c:	008bac03          	lw	s8,8(s7)
c000d110:	d75fe06f          	j	c000be84 <stride_dequeue+0x1020>
c000d114:	00432783          	lw	a5,4(t1)
c000d118:	00832c03          	lw	s8,8(t1)
c000d11c:	00a12c23          	sw	a0,24(sp)
c000d120:	00f12a23          	sw	a5,20(sp)
c000d124:	040c0663          	beqz	s8,c000d170 <stride_dequeue+0x230c>
c000d128:	000b0593          	mv	a1,s6
c000d12c:	000c0513          	mv	a0,s8
c000d130:	00612e23          	sw	t1,28(sp)
c000d134:	855fd0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000d138:	01c12303          	lw	t1,28(sp)
c000d13c:	01812783          	lw	a5,24(sp)
c000d140:	00612c23          	sw	t1,24(sp)
c000d144:	30f50ce3          	beq	a0,a5,c000dc5c <stride_dequeue+0x2df8>
c000d148:	008b2583          	lw	a1,8(s6)
c000d14c:	004b2403          	lw	s0,4(s6)
c000d150:	000c0513          	mv	a0,s8
c000d154:	8c1fd0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000d158:	00ab2223          	sw	a0,4(s6)
c000d15c:	008b2423          	sw	s0,8(s6)
c000d160:	01812303          	lw	t1,24(sp)
c000d164:	00050463          	beqz	a0,c000d16c <stride_dequeue+0x2308>
c000d168:	01652023          	sw	s6,0(a0)
c000d16c:	008ba403          	lw	s0,8(s7)
c000d170:	01412783          	lw	a5,20(sp)
c000d174:	01632223          	sw	s6,4(t1)
c000d178:	00040c13          	mv	s8,s0
c000d17c:	00f32423          	sw	a5,8(t1)
c000d180:	006b2023          	sw	t1,0(s6)
c000d184:	00030b13          	mv	s6,t1
c000d188:	e89fe06f          	j	c000c010 <stride_dequeue+0x11ac>
c000d18c:	008ca503          	lw	a0,8(s9)
c000d190:	004cac03          	lw	s8,4(s9)
c000d194:	000f0593          	mv	a1,t5
c000d198:	03c12223          	sw	t3,36(sp)
c000d19c:	879fd0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000d1a0:	00aca223          	sw	a0,4(s9)
c000d1a4:	018ca423          	sw	s8,8(s9)
c000d1a8:	02412e03          	lw	t3,36(sp)
c000d1ac:	00050463          	beqz	a0,c000d1b4 <stride_dequeue+0x2350>
c000d1b0:	01952023          	sw	s9,0(a0)
c000d1b4:	008bac03          	lw	s8,8(s7)
c000d1b8:	f01fd06f          	j	c000b0b8 <stride_dequeue+0x254>
c000d1bc:	004da703          	lw	a4,4(s11)
c000d1c0:	008da783          	lw	a5,8(s11)
c000d1c4:	00e12823          	sw	a4,16(sp)
c000d1c8:	04078063          	beqz	a5,c000d208 <stride_dequeue+0x23a4>
c000d1cc:	00078513          	mv	a0,a5
c000d1d0:	00098593          	mv	a1,s3
c000d1d4:	00f12a23          	sw	a5,20(sp)
c000d1d8:	fb0fd0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000d1dc:	01412783          	lw	a5,20(sp)
c000d1e0:	4b8508e3          	beq	a0,s8,c000de90 <stride_dequeue+0x302c>
c000d1e4:	0089a583          	lw	a1,8(s3)
c000d1e8:	0049a403          	lw	s0,4(s3)
c000d1ec:	00078513          	mv	a0,a5
c000d1f0:	825fd0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000d1f4:	00a9a223          	sw	a0,4(s3)
c000d1f8:	0089a423          	sw	s0,8(s3)
c000d1fc:	00050463          	beqz	a0,c000d204 <stride_dequeue+0x23a0>
c000d200:	01352023          	sw	s3,0(a0)
c000d204:	008ba403          	lw	s0,8(s7)
c000d208:	01012783          	lw	a5,16(sp)
c000d20c:	013da223          	sw	s3,4(s11)
c000d210:	00fda423          	sw	a5,8(s11)
c000d214:	01b9a023          	sw	s11,0(s3)
c000d218:	000d8993          	mv	s3,s11
c000d21c:	9f4ff06f          	j	c000c410 <stride_dequeue+0x15ac>
c000d220:	0087a503          	lw	a0,8(a5)
c000d224:	000e0593          	mv	a1,t3
c000d228:	0047a403          	lw	s0,4(a5)
c000d22c:	00f12e23          	sw	a5,28(sp)
c000d230:	fe4fd0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000d234:	01c12783          	lw	a5,28(sp)
c000d238:	00a7a223          	sw	a0,4(a5)
c000d23c:	0087a423          	sw	s0,8(a5)
c000d240:	4a050ce3          	beqz	a0,c000def8 <stride_dequeue+0x3094>
c000d244:	00f52023          	sw	a5,0(a0)
c000d248:	00078e13          	mv	t3,a5
c000d24c:	008ba403          	lw	s0,8(s7)
c000d250:	a38ff06f          	j	c000c488 <stride_dequeue+0x1624>
c000d254:	008ea503          	lw	a0,8(t4)
c000d258:	000f0593          	mv	a1,t5
c000d25c:	004ea403          	lw	s0,4(t4)
c000d260:	03d12023          	sw	t4,32(sp)
c000d264:	fb0fd0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000d268:	02012e83          	lw	t4,32(sp)
c000d26c:	00aea223          	sw	a0,4(t4)
c000d270:	008ea423          	sw	s0,8(t4)
c000d274:	00050463          	beqz	a0,c000d27c <stride_dequeue+0x2418>
c000d278:	01d52023          	sw	t4,0(a0)
c000d27c:	008bac03          	lw	s8,8(s7)
c000d280:	e50fe06f          	j	c000b8d0 <stride_dequeue+0xa6c>
c000d284:	008e2503          	lw	a0,8(t3)
c000d288:	00078593          	mv	a1,a5
c000d28c:	004e2403          	lw	s0,4(t3)
c000d290:	03d12223          	sw	t4,36(sp)
c000d294:	f80fd0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000d298:	02012e03          	lw	t3,32(sp)
c000d29c:	02412e83          	lw	t4,36(sp)
c000d2a0:	00ae2223          	sw	a0,4(t3)
c000d2a4:	008e2423          	sw	s0,8(t3)
c000d2a8:	00050463          	beqz	a0,c000d2b0 <stride_dequeue+0x244c>
c000d2ac:	01c52023          	sw	t3,0(a0)
c000d2b0:	008bac03          	lw	s8,8(s7)
c000d2b4:	901fe06f          	j	c000bbb4 <stride_dequeue+0xd50>
c000d2b8:	008aa503          	lw	a0,8(s5)
c000d2bc:	004aa403          	lw	s0,4(s5)
c000d2c0:	000e8593          	mv	a1,t4
c000d2c4:	03c12023          	sw	t3,32(sp)
c000d2c8:	f4cfd0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000d2cc:	00aaa223          	sw	a0,4(s5)
c000d2d0:	008aa423          	sw	s0,8(s5)
c000d2d4:	02012e03          	lw	t3,32(sp)
c000d2d8:	00050463          	beqz	a0,c000d2e0 <stride_dequeue+0x247c>
c000d2dc:	01552023          	sw	s5,0(a0)
c000d2e0:	008bac03          	lw	s8,8(s7)
c000d2e4:	c30fe06f          	j	c000b714 <stride_dequeue+0x8b0>
c000d2e8:	008aa503          	lw	a0,8(s5)
c000d2ec:	004aa403          	lw	s0,4(s5)
c000d2f0:	00078593          	mv	a1,a5
c000d2f4:	03d12023          	sw	t4,32(sp)
c000d2f8:	f1cfd0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000d2fc:	00aaa223          	sw	a0,4(s5)
c000d300:	008aa423          	sw	s0,8(s5)
c000d304:	02012e83          	lw	t4,32(sp)
c000d308:	00050463          	beqz	a0,c000d310 <stride_dequeue+0x24ac>
c000d30c:	01552023          	sw	s5,0(a0)
c000d310:	008bac03          	lw	s8,8(s7)
c000d314:	fe9fd06f          	j	c000b2fc <stride_dequeue+0x498>
c000d318:	008d2503          	lw	a0,8(s10)
c000d31c:	004d2403          	lw	s0,4(s10)
c000d320:	000e8593          	mv	a1,t4
c000d324:	03c12023          	sw	t3,32(sp)
c000d328:	01112e23          	sw	a7,28(sp)
c000d32c:	ee8fd0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000d330:	00ad2223          	sw	a0,4(s10)
c000d334:	008d2423          	sw	s0,8(s10)
c000d338:	01c12883          	lw	a7,28(sp)
c000d33c:	02012e03          	lw	t3,32(sp)
c000d340:	00050463          	beqz	a0,c000d348 <stride_dequeue+0x24e4>
c000d344:	01a52023          	sw	s10,0(a0)
c000d348:	008bac03          	lw	s8,8(s7)
c000d34c:	9b8fe06f          	j	c000b504 <stride_dequeue+0x6a0>
c000d350:	000b0893          	mv	a7,s6
c000d354:	ee8fe06f          	j	c000ba3c <stride_dequeue+0xbd8>
c000d358:	00030e13          	mv	t3,t1
c000d35c:	ca5fe06f          	j	c000c000 <stride_dequeue+0x119c>
c000d360:	00078e13          	mv	t3,a5
c000d364:	f51fe06f          	j	c000c2b4 <stride_dequeue+0x1450>
c000d368:	000b0893          	mv	a7,s6
c000d36c:	9a9fe06f          	j	c000bd14 <stride_dequeue+0xeb0>
c000d370:	00078e13          	mv	t3,a5
c000d374:	de9fe06f          	j	c000c15c <stride_dequeue+0x12f8>
c000d378:	000d8713          	mv	a4,s11
c000d37c:	af5fe06f          	j	c000be70 <stride_dequeue+0x100c>
c000d380:	008b2503          	lw	a0,8(s6)
c000d384:	004b2403          	lw	s0,4(s6)
c000d388:	00088593          	mv	a1,a7
c000d38c:	01012c23          	sw	a6,24(sp)
c000d390:	e84fd0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000d394:	00ab2223          	sw	a0,4(s6)
c000d398:	008b2423          	sw	s0,8(s6)
c000d39c:	01812803          	lw	a6,24(sp)
c000d3a0:	00050463          	beqz	a0,c000d3a8 <stride_dequeue+0x2544>
c000d3a4:	01652023          	sw	s6,0(a0)
c000d3a8:	008bac03          	lw	s8,8(s7)
c000d3ac:	000b0893          	mv	a7,s6
c000d3b0:	965fe06f          	j	c000bd14 <stride_dequeue+0xeb0>
c000d3b4:	008b2503          	lw	a0,8(s6)
c000d3b8:	004b2403          	lw	s0,4(s6)
c000d3bc:	00088593          	mv	a1,a7
c000d3c0:	01012c23          	sw	a6,24(sp)
c000d3c4:	e50fd0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000d3c8:	00ab2223          	sw	a0,4(s6)
c000d3cc:	008b2423          	sw	s0,8(s6)
c000d3d0:	01812803          	lw	a6,24(sp)
c000d3d4:	00050463          	beqz	a0,c000d3dc <stride_dequeue+0x2578>
c000d3d8:	01652023          	sw	s6,0(a0)
c000d3dc:	008bac03          	lw	s8,8(s7)
c000d3e0:	000b0893          	mv	a7,s6
c000d3e4:	e58fe06f          	j	c000ba3c <stride_dequeue+0xbd8>
c000d3e8:	008da503          	lw	a0,8(s11)
c000d3ec:	004da403          	lw	s0,4(s11)
c000d3f0:	00070593          	mv	a1,a4
c000d3f4:	00f12c23          	sw	a5,24(sp)
c000d3f8:	e1cfd0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000d3fc:	00ada223          	sw	a0,4(s11)
c000d400:	008da423          	sw	s0,8(s11)
c000d404:	01812783          	lw	a5,24(sp)
c000d408:	00050463          	beqz	a0,c000d410 <stride_dequeue+0x25ac>
c000d40c:	01b52023          	sw	s11,0(a0)
c000d410:	008bac03          	lw	s8,8(s7)
c000d414:	000d8713          	mv	a4,s11
c000d418:	a59fe06f          	j	c000be70 <stride_dequeue+0x100c>
c000d41c:	008c2503          	lw	a0,8(s8)
c000d420:	004c2403          	lw	s0,4(s8)
c000d424:	000d8593          	mv	a1,s11
c000d428:	decfd0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000d42c:	00ac2223          	sw	a0,4(s8)
c000d430:	008c2423          	sw	s0,8(s8)
c000d434:	300506e3          	beqz	a0,c000df40 <stride_dequeue+0x30dc>
c000d438:	01852023          	sw	s8,0(a0)
c000d43c:	000c0d93          	mv	s11,s8
c000d440:	008ba403          	lw	s0,8(s7)
c000d444:	a04ff06f          	j	c000c648 <stride_dequeue+0x17e4>
c000d448:	0087a503          	lw	a0,8(a5)
c000d44c:	000e0593          	mv	a1,t3
c000d450:	0047a403          	lw	s0,4(a5)
c000d454:	dc0fd0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000d458:	01c12783          	lw	a5,28(sp)
c000d45c:	00a7a223          	sw	a0,4(a5)
c000d460:	0087a423          	sw	s0,8(a5)
c000d464:	00050463          	beqz	a0,c000d46c <stride_dequeue+0x2608>
c000d468:	00f52023          	sw	a5,0(a0)
c000d46c:	008bac03          	lw	s8,8(s7)
c000d470:	00078e13          	mv	t3,a5
c000d474:	ce9fe06f          	j	c000c15c <stride_dequeue+0x12f8>
c000d478:	0087a503          	lw	a0,8(a5)
c000d47c:	000e0593          	mv	a1,t3
c000d480:	0047a403          	lw	s0,4(a5)
c000d484:	d90fd0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000d488:	01c12783          	lw	a5,28(sp)
c000d48c:	00a7a223          	sw	a0,4(a5)
c000d490:	0087a423          	sw	s0,8(a5)
c000d494:	00050463          	beqz	a0,c000d49c <stride_dequeue+0x2638>
c000d498:	00f52023          	sw	a5,0(a0)
c000d49c:	008bac03          	lw	s8,8(s7)
c000d4a0:	00078e13          	mv	t3,a5
c000d4a4:	e11fe06f          	j	c000c2b4 <stride_dequeue+0x1450>
c000d4a8:	008c2503          	lw	a0,8(s8)
c000d4ac:	004c2403          	lw	s0,4(s8)
c000d4b0:	000e0593          	mv	a1,t3
c000d4b4:	d60fd0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000d4b8:	00ac2223          	sw	a0,4(s8)
c000d4bc:	008c2423          	sw	s0,8(s8)
c000d4c0:	220506e3          	beqz	a0,c000deec <stride_dequeue+0x3088>
c000d4c4:	01852023          	sw	s8,0(a0)
c000d4c8:	000c0e13          	mv	t3,s8
c000d4cc:	008ba403          	lw	s0,8(s7)
c000d4d0:	b34ff06f          	j	c000c804 <stride_dequeue+0x19a0>
c000d4d4:	008da503          	lw	a0,8(s11)
c000d4d8:	004da403          	lw	s0,4(s11)
c000d4dc:	000a8593          	mv	a1,s5
c000d4e0:	01c12e23          	sw	t3,28(sp)
c000d4e4:	d30fd0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000d4e8:	00ada223          	sw	a0,4(s11)
c000d4ec:	008da423          	sw	s0,8(s11)
c000d4f0:	01c12e03          	lw	t3,28(sp)
c000d4f4:	24050ce3          	beqz	a0,c000df4c <stride_dequeue+0x30e8>
c000d4f8:	01b52023          	sw	s11,0(a0)
c000d4fc:	000d8a93          	mv	s5,s11
c000d500:	008ba403          	lw	s0,8(s7)
c000d504:	d3cff06f          	j	c000ca40 <stride_dequeue+0x1bdc>
c000d508:	008c2503          	lw	a0,8(s8)
c000d50c:	004c2403          	lw	s0,4(s8)
c000d510:	00088593          	mv	a1,a7
c000d514:	d00fd0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000d518:	00ac2223          	sw	a0,4(s8)
c000d51c:	008c2423          	sw	s0,8(s8)
c000d520:	1e0502e3          	beqz	a0,c000df04 <stride_dequeue+0x30a0>
c000d524:	01852023          	sw	s8,0(a0)
c000d528:	000c0893          	mv	a7,s8
c000d52c:	008ba403          	lw	s0,8(s7)
c000d530:	b48ff06f          	j	c000c878 <stride_dequeue+0x1a14>
c000d534:	00832503          	lw	a0,8(t1)
c000d538:	000e0593          	mv	a1,t3
c000d53c:	00432403          	lw	s0,4(t1)
c000d540:	00612c23          	sw	t1,24(sp)
c000d544:	cd0fd0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000d548:	01812303          	lw	t1,24(sp)
c000d54c:	00a32223          	sw	a0,4(t1)
c000d550:	00832423          	sw	s0,8(t1)
c000d554:	00050463          	beqz	a0,c000d55c <stride_dequeue+0x26f8>
c000d558:	00652023          	sw	t1,0(a0)
c000d55c:	008bac03          	lw	s8,8(s7)
c000d560:	00030e13          	mv	t3,t1
c000d564:	a9dfe06f          	j	c000c000 <stride_dequeue+0x119c>
c000d568:	008ca503          	lw	a0,8(s9)
c000d56c:	004cac03          	lw	s8,4(s9)
c000d570:	000f8593          	mv	a1,t6
c000d574:	03e12623          	sw	t5,44(sp)
c000d578:	03c12423          	sw	t3,40(sp)
c000d57c:	c98fd0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000d580:	00aca223          	sw	a0,4(s9)
c000d584:	018ca423          	sw	s8,8(s9)
c000d588:	02812e03          	lw	t3,40(sp)
c000d58c:	02c12f03          	lw	t5,44(sp)
c000d590:	00050463          	beqz	a0,c000d598 <stride_dequeue+0x2734>
c000d594:	01952023          	sw	s9,0(a0)
c000d598:	008bac03          	lw	s8,8(s7)
c000d59c:	b09fd06f          	j	c000b0a4 <stride_dequeue+0x240>
c000d5a0:	008ba403          	lw	s0,8(s7)
c000d5a4:	000d8c13          	mv	s8,s11
c000d5a8:	e59fe06f          	j	c000c400 <stride_dequeue+0x159c>
c000d5ac:	008ba403          	lw	s0,8(s7)
c000d5b0:	000a8f13          	mv	t5,s5
c000d5b4:	d35fd06f          	j	c000b2e8 <stride_dequeue+0x484>
c000d5b8:	008ba403          	lw	s0,8(s7)
c000d5bc:	000d0f13          	mv	t5,s10
c000d5c0:	f31fd06f          	j	c000b4f0 <stride_dequeue+0x68c>
c000d5c4:	008da503          	lw	a0,8(s11)
c000d5c8:	004da403          	lw	s0,4(s11)
c000d5cc:	000c0593          	mv	a1,s8
c000d5d0:	c44fd0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000d5d4:	00ada223          	sw	a0,4(s11)
c000d5d8:	008da423          	sw	s0,8(s11)
c000d5dc:	fc0502e3          	beqz	a0,c000d5a0 <stride_dequeue+0x273c>
c000d5e0:	01b52023          	sw	s11,0(a0)
c000d5e4:	000d8c13          	mv	s8,s11
c000d5e8:	008ba403          	lw	s0,8(s7)
c000d5ec:	e15fe06f          	j	c000c400 <stride_dequeue+0x159c>
c000d5f0:	008ba403          	lw	s0,8(s7)
c000d5f4:	000e8c13          	mv	s8,t4
c000d5f8:	ac0fe06f          	j	c000b8b8 <stride_dequeue+0xa54>
c000d5fc:	008ba403          	lw	s0,8(s7)
c000d600:	000e0f13          	mv	t5,t3
c000d604:	d9cfe06f          	j	c000bba0 <stride_dequeue+0xd3c>
c000d608:	008ba403          	lw	s0,8(s7)
c000d60c:	000a8f13          	mv	t5,s5
c000d610:	8f0fe06f          	j	c000b700 <stride_dequeue+0x89c>
c000d614:	008c2503          	lw	a0,8(s8)
c000d618:	004c2403          	lw	s0,4(s8)
c000d61c:	000d0593          	mv	a1,s10
c000d620:	bf4fd0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000d624:	00ac2223          	sw	a0,4(s8)
c000d628:	008c2423          	sw	s0,8(s8)
c000d62c:	1a0504e3          	beqz	a0,c000dfd4 <stride_dequeue+0x3170>
c000d630:	01852023          	sw	s8,0(a0)
c000d634:	000c0d13          	mv	s10,s8
c000d638:	008ba403          	lw	s0,8(s7)
c000d63c:	c6cff06f          	j	c000caa8 <stride_dequeue+0x1c44>
c000d640:	008c2503          	lw	a0,8(s8)
c000d644:	004c2403          	lw	s0,4(s8)
c000d648:	000d8593          	mv	a1,s11
c000d64c:	bc8fd0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000d650:	00ac2223          	sw	a0,4(s8)
c000d654:	008c2423          	sw	s0,8(s8)
c000d658:	420502e3          	beqz	a0,c000e27c <stride_dequeue+0x3418>
c000d65c:	01852023          	sw	s8,0(a0)
c000d660:	000c0d93          	mv	s11,s8
c000d664:	008ba403          	lw	s0,8(s7)
c000d668:	ca8ff06f          	j	c000cb10 <stride_dequeue+0x1cac>
c000d66c:	008c2503          	lw	a0,8(s8)
c000d670:	004c2403          	lw	s0,4(s8)
c000d674:	000d8593          	mv	a1,s11
c000d678:	b9cfd0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000d67c:	00ac2223          	sw	a0,4(s8)
c000d680:	008c2423          	sw	s0,8(s8)
c000d684:	24050ae3          	beqz	a0,c000e0d8 <stride_dequeue+0x3274>
c000d688:	01852023          	sw	s8,0(a0)
c000d68c:	000c0d93          	mv	s11,s8
c000d690:	008ba403          	lw	s0,8(s7)
c000d694:	ce4ff06f          	j	c000cb78 <stride_dequeue+0x1d14>
c000d698:	00009697          	auipc	a3,0x9
c000d69c:	da068693          	addi	a3,a3,-608 # c0016438 <default_pmm_manager+0x1148>
c000d6a0:	00006617          	auipc	a2,0x6
c000d6a4:	77c60613          	addi	a2,a2,1916 # c0013e1c <commands+0x164>
c000d6a8:	06300593          	li	a1,99
c000d6ac:	00009517          	auipc	a0,0x9
c000d6b0:	db050513          	addi	a0,a0,-592 # c001645c <default_pmm_manager+0x116c>
c000d6b4:	c11f20ef          	jal	ra,c00002c4 <__panic>
c000d6b8:	008ba403          	lw	s0,8(s7)
c000d6bc:	000b0e13          	mv	t3,s6
c000d6c0:	e44fe06f          	j	c000bd04 <stride_dequeue+0xea0>
c000d6c4:	008ba403          	lw	s0,8(s7)
c000d6c8:	000b0e13          	mv	t3,s6
c000d6cc:	b60fe06f          	j	c000ba2c <stride_dequeue+0xbc8>
c000d6d0:	008ba403          	lw	s0,8(s7)
c000d6d4:	00078c13          	mv	s8,a5
c000d6d8:	a71fe06f          	j	c000c148 <stride_dequeue+0x12e4>
c000d6dc:	008aa503          	lw	a0,8(s5)
c000d6e0:	004aa403          	lw	s0,4(s5)
c000d6e4:	000f0593          	mv	a1,t5
c000d6e8:	03d12223          	sw	t4,36(sp)
c000d6ec:	03c12023          	sw	t3,32(sp)
c000d6f0:	b24fd0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000d6f4:	00aaa223          	sw	a0,4(s5)
c000d6f8:	008aa423          	sw	s0,8(s5)
c000d6fc:	02012e03          	lw	t3,32(sp)
c000d700:	02412e83          	lw	t4,36(sp)
c000d704:	f00502e3          	beqz	a0,c000d608 <stride_dequeue+0x27a4>
c000d708:	01552023          	sw	s5,0(a0)
c000d70c:	000a8f13          	mv	t5,s5
c000d710:	008ba403          	lw	s0,8(s7)
c000d714:	fedfd06f          	j	c000b700 <stride_dequeue+0x89c>
c000d718:	008e2503          	lw	a0,8(t3)
c000d71c:	000f0593          	mv	a1,t5
c000d720:	004e2403          	lw	s0,4(t3)
c000d724:	af0fd0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000d728:	02012e03          	lw	t3,32(sp)
c000d72c:	02412e83          	lw	t4,36(sp)
c000d730:	02812783          	lw	a5,40(sp)
c000d734:	00ae2223          	sw	a0,4(t3)
c000d738:	008e2423          	sw	s0,8(t3)
c000d73c:	ec0500e3          	beqz	a0,c000d5fc <stride_dequeue+0x2798>
c000d740:	01c52023          	sw	t3,0(a0)
c000d744:	000e0f13          	mv	t5,t3
c000d748:	008ba403          	lw	s0,8(s7)
c000d74c:	c54fe06f          	j	c000bba0 <stride_dequeue+0xd3c>
c000d750:	008d2503          	lw	a0,8(s10)
c000d754:	004d2403          	lw	s0,4(s10)
c000d758:	000f0593          	mv	a1,t5
c000d75c:	03d12223          	sw	t4,36(sp)
c000d760:	03c12023          	sw	t3,32(sp)
c000d764:	01112e23          	sw	a7,28(sp)
c000d768:	aacfd0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000d76c:	00ad2223          	sw	a0,4(s10)
c000d770:	008d2423          	sw	s0,8(s10)
c000d774:	01c12883          	lw	a7,28(sp)
c000d778:	02012e03          	lw	t3,32(sp)
c000d77c:	02412e83          	lw	t4,36(sp)
c000d780:	e2050ce3          	beqz	a0,c000d5b8 <stride_dequeue+0x2754>
c000d784:	01a52023          	sw	s10,0(a0)
c000d788:	000d0f13          	mv	t5,s10
c000d78c:	008ba403          	lw	s0,8(s7)
c000d790:	d61fd06f          	j	c000b4f0 <stride_dequeue+0x68c>
c000d794:	008ba403          	lw	s0,8(s7)
c000d798:	00030c13          	mv	s8,t1
c000d79c:	851fe06f          	j	c000bfec <stride_dequeue+0x1188>
c000d7a0:	008ba403          	lw	s0,8(s7)
c000d7a4:	00078c13          	mv	s8,a5
c000d7a8:	af9fe06f          	j	c000c2a0 <stride_dequeue+0x143c>
c000d7ac:	008ba403          	lw	s0,8(s7)
c000d7b0:	000d8e13          	mv	t3,s11
c000d7b4:	eacfe06f          	j	c000be60 <stride_dequeue+0xffc>
c000d7b8:	008ea503          	lw	a0,8(t4)
c000d7bc:	000c0593          	mv	a1,s8
c000d7c0:	004ea403          	lw	s0,4(t4)
c000d7c4:	03e12423          	sw	t5,40(sp)
c000d7c8:	03d12223          	sw	t4,36(sp)
c000d7cc:	a48fd0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000d7d0:	02412e83          	lw	t4,36(sp)
c000d7d4:	02812f03          	lw	t5,40(sp)
c000d7d8:	00aea223          	sw	a0,4(t4)
c000d7dc:	008ea423          	sw	s0,8(t4)
c000d7e0:	e00508e3          	beqz	a0,c000d5f0 <stride_dequeue+0x278c>
c000d7e4:	01d52023          	sw	t4,0(a0)
c000d7e8:	000e8c13          	mv	s8,t4
c000d7ec:	008ba403          	lw	s0,8(s7)
c000d7f0:	8c8fe06f          	j	c000b8b8 <stride_dequeue+0xa54>
c000d7f4:	008aa503          	lw	a0,8(s5)
c000d7f8:	004aa403          	lw	s0,4(s5)
c000d7fc:	000f0593          	mv	a1,t5
c000d800:	02f12223          	sw	a5,36(sp)
c000d804:	03d12023          	sw	t4,32(sp)
c000d808:	a0cfd0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000d80c:	00aaa223          	sw	a0,4(s5)
c000d810:	008aa423          	sw	s0,8(s5)
c000d814:	02012e83          	lw	t4,32(sp)
c000d818:	02412783          	lw	a5,36(sp)
c000d81c:	d80508e3          	beqz	a0,c000d5ac <stride_dequeue+0x2748>
c000d820:	01552023          	sw	s5,0(a0)
c000d824:	000a8f13          	mv	t5,s5
c000d828:	008ba403          	lw	s0,8(s7)
c000d82c:	abdfd06f          	j	c000b2e8 <stride_dequeue+0x484>
c000d830:	000c0f13          	mv	t5,s8
c000d834:	fc1fe06f          	j	c000c7f4 <stride_dequeue+0x1990>
c000d838:	000c0f13          	mv	t5,s8
c000d83c:	dfdfe06f          	j	c000c638 <stride_dequeue+0x17d4>
c000d840:	000d8c13          	mv	s8,s11
c000d844:	9ecff06f          	j	c000ca30 <stride_dequeue+0x1bcc>
c000d848:	004da703          	lw	a4,4(s11)
c000d84c:	008da783          	lw	a5,8(s11)
c000d850:	02a12623          	sw	a0,44(sp)
c000d854:	02e12023          	sw	a4,32(sp)
c000d858:	04078a63          	beqz	a5,c000d8ac <stride_dequeue+0x2a48>
c000d85c:	00078513          	mv	a0,a5
c000d860:	000c0593          	mv	a1,s8
c000d864:	03c12423          	sw	t3,40(sp)
c000d868:	02f12223          	sw	a5,36(sp)
c000d86c:	91cfd0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000d870:	02c12703          	lw	a4,44(sp)
c000d874:	02412783          	lw	a5,36(sp)
c000d878:	02812e03          	lw	t3,40(sp)
c000d87c:	1ce506e3          	beq	a0,a4,c000e248 <stride_dequeue+0x33e4>
c000d880:	008c2583          	lw	a1,8(s8)
c000d884:	004c2403          	lw	s0,4(s8)
c000d888:	00078513          	mv	a0,a5
c000d88c:	03c12223          	sw	t3,36(sp)
c000d890:	984fd0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000d894:	00ac2223          	sw	a0,4(s8)
c000d898:	008c2423          	sw	s0,8(s8)
c000d89c:	02412e03          	lw	t3,36(sp)
c000d8a0:	00050463          	beqz	a0,c000d8a8 <stride_dequeue+0x2a44>
c000d8a4:	01852023          	sw	s8,0(a0)
c000d8a8:	008ba403          	lw	s0,8(s7)
c000d8ac:	02012783          	lw	a5,32(sp)
c000d8b0:	018da223          	sw	s8,4(s11)
c000d8b4:	00fda423          	sw	a5,8(s11)
c000d8b8:	01bc2023          	sw	s11,0(s8)
c000d8bc:	000d8c13          	mv	s8,s11
c000d8c0:	970ff06f          	j	c000ca30 <stride_dequeue+0x1bcc>
c000d8c4:	008b2503          	lw	a0,8(s6)
c000d8c8:	004b2403          	lw	s0,4(s6)
c000d8cc:	000e0593          	mv	a1,t3
c000d8d0:	01112e23          	sw	a7,28(sp)
c000d8d4:	01012c23          	sw	a6,24(sp)
c000d8d8:	93cfd0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000d8dc:	00ab2223          	sw	a0,4(s6)
c000d8e0:	008b2423          	sw	s0,8(s6)
c000d8e4:	01812803          	lw	a6,24(sp)
c000d8e8:	01c12883          	lw	a7,28(sp)
c000d8ec:	dc050ce3          	beqz	a0,c000d6c4 <stride_dequeue+0x2860>
c000d8f0:	01652023          	sw	s6,0(a0)
c000d8f4:	000b0e13          	mv	t3,s6
c000d8f8:	008ba403          	lw	s0,8(s7)
c000d8fc:	930fe06f          	j	c000ba2c <stride_dequeue+0xbc8>
c000d900:	008da503          	lw	a0,8(s11)
c000d904:	004da403          	lw	s0,4(s11)
c000d908:	000e0593          	mv	a1,t3
c000d90c:	00e12e23          	sw	a4,28(sp)
c000d910:	00f12c23          	sw	a5,24(sp)
c000d914:	900fd0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000d918:	00ada223          	sw	a0,4(s11)
c000d91c:	008da423          	sw	s0,8(s11)
c000d920:	01812783          	lw	a5,24(sp)
c000d924:	01c12703          	lw	a4,28(sp)
c000d928:	e80502e3          	beqz	a0,c000d7ac <stride_dequeue+0x2948>
c000d92c:	01b52023          	sw	s11,0(a0)
c000d930:	000d8e13          	mv	t3,s11
c000d934:	008ba403          	lw	s0,8(s7)
c000d938:	d28fe06f          	j	c000be60 <stride_dequeue+0xffc>
c000d93c:	004c2783          	lw	a5,4(s8)
c000d940:	008c2d83          	lw	s11,8(s8)
c000d944:	02a12623          	sw	a0,44(sp)
c000d948:	02f12023          	sw	a5,32(sp)
c000d94c:	040d8e63          	beqz	s11,c000d9a8 <stride_dequeue+0x2b44>
c000d950:	000f0593          	mv	a1,t5
c000d954:	000d8513          	mv	a0,s11
c000d958:	03c12423          	sw	t3,40(sp)
c000d95c:	03e12223          	sw	t5,36(sp)
c000d960:	828fd0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000d964:	02c12f83          	lw	t6,44(sp)
c000d968:	02412f03          	lw	t5,36(sp)
c000d96c:	02812e03          	lw	t3,40(sp)
c000d970:	63f50863          	beq	a0,t6,c000dfa0 <stride_dequeue+0x313c>
c000d974:	008f2583          	lw	a1,8(t5)
c000d978:	000d8513          	mv	a0,s11
c000d97c:	004f2403          	lw	s0,4(t5)
c000d980:	03c12423          	sw	t3,40(sp)
c000d984:	03e12223          	sw	t5,36(sp)
c000d988:	88cfd0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000d98c:	02412f03          	lw	t5,36(sp)
c000d990:	02812e03          	lw	t3,40(sp)
c000d994:	00af2223          	sw	a0,4(t5)
c000d998:	008f2423          	sw	s0,8(t5)
c000d99c:	00050463          	beqz	a0,c000d9a4 <stride_dequeue+0x2b40>
c000d9a0:	01e52023          	sw	t5,0(a0)
c000d9a4:	008ba403          	lw	s0,8(s7)
c000d9a8:	02012783          	lw	a5,32(sp)
c000d9ac:	01ec2223          	sw	t5,4(s8)
c000d9b0:	00fc2423          	sw	a5,8(s8)
c000d9b4:	018f2023          	sw	s8,0(t5)
c000d9b8:	000c0f13          	mv	t5,s8
c000d9bc:	e39fe06f          	j	c000c7f4 <stride_dequeue+0x1990>
c000d9c0:	0087a503          	lw	a0,8(a5)
c000d9c4:	000c0593          	mv	a1,s8
c000d9c8:	0047a403          	lw	s0,4(a5)
c000d9cc:	848fd0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000d9d0:	02012783          	lw	a5,32(sp)
c000d9d4:	02412e03          	lw	t3,36(sp)
c000d9d8:	00a7a223          	sw	a0,4(a5)
c000d9dc:	0087a423          	sw	s0,8(a5)
c000d9e0:	ce0508e3          	beqz	a0,c000d6d0 <stride_dequeue+0x286c>
c000d9e4:	00f52023          	sw	a5,0(a0)
c000d9e8:	00078c13          	mv	s8,a5
c000d9ec:	008ba403          	lw	s0,8(s7)
c000d9f0:	f58fe06f          	j	c000c148 <stride_dequeue+0x12e4>
c000d9f4:	004c2703          	lw	a4,4(s8)
c000d9f8:	008c2783          	lw	a5,8(s8)
c000d9fc:	02a12623          	sw	a0,44(sp)
c000da00:	02e12023          	sw	a4,32(sp)
c000da04:	04078a63          	beqz	a5,c000da58 <stride_dequeue+0x2bf4>
c000da08:	000f0593          	mv	a1,t5
c000da0c:	00078513          	mv	a0,a5
c000da10:	03e12423          	sw	t5,40(sp)
c000da14:	02f12223          	sw	a5,36(sp)
c000da18:	f71fc0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000da1c:	02c12f83          	lw	t6,44(sp)
c000da20:	02412783          	lw	a5,36(sp)
c000da24:	02812f03          	lw	t5,40(sp)
c000da28:	5ff50a63          	beq	a0,t6,c000e01c <stride_dequeue+0x31b8>
c000da2c:	008f2583          	lw	a1,8(t5)
c000da30:	00078513          	mv	a0,a5
c000da34:	004f2403          	lw	s0,4(t5)
c000da38:	03e12223          	sw	t5,36(sp)
c000da3c:	fd9fc0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000da40:	02412f03          	lw	t5,36(sp)
c000da44:	00af2223          	sw	a0,4(t5)
c000da48:	008f2423          	sw	s0,8(t5)
c000da4c:	00050463          	beqz	a0,c000da54 <stride_dequeue+0x2bf0>
c000da50:	01e52023          	sw	t5,0(a0)
c000da54:	008ba403          	lw	s0,8(s7)
c000da58:	02012783          	lw	a5,32(sp)
c000da5c:	01ec2223          	sw	t5,4(s8)
c000da60:	00fc2423          	sw	a5,8(s8)
c000da64:	018f2023          	sw	s8,0(t5)
c000da68:	000c0f13          	mv	t5,s8
c000da6c:	bcdfe06f          	j	c000c638 <stride_dequeue+0x17d4>
c000da70:	008ba403          	lw	s0,8(s7)
c000da74:	000d8893          	mv	a7,s11
c000da78:	979fe06f          	j	c000c3f0 <stride_dequeue+0x158c>
c000da7c:	00832503          	lw	a0,8(t1)
c000da80:	000c0593          	mv	a1,s8
c000da84:	00432403          	lw	s0,4(t1)
c000da88:	03c12023          	sw	t3,32(sp)
c000da8c:	00612e23          	sw	t1,28(sp)
c000da90:	f85fc0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000da94:	01c12303          	lw	t1,28(sp)
c000da98:	02012e03          	lw	t3,32(sp)
c000da9c:	00a32223          	sw	a0,4(t1)
c000daa0:	00832423          	sw	s0,8(t1)
c000daa4:	ce0508e3          	beqz	a0,c000d794 <stride_dequeue+0x2930>
c000daa8:	00652023          	sw	t1,0(a0)
c000daac:	00030c13          	mv	s8,t1
c000dab0:	008ba403          	lw	s0,8(s7)
c000dab4:	d38fe06f          	j	c000bfec <stride_dequeue+0x1188>
c000dab8:	008b2503          	lw	a0,8(s6)
c000dabc:	004b2403          	lw	s0,4(s6)
c000dac0:	000e0593          	mv	a1,t3
c000dac4:	01112e23          	sw	a7,28(sp)
c000dac8:	01012c23          	sw	a6,24(sp)
c000dacc:	f49fc0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000dad0:	00ab2223          	sw	a0,4(s6)
c000dad4:	008b2423          	sw	s0,8(s6)
c000dad8:	01812803          	lw	a6,24(sp)
c000dadc:	01c12883          	lw	a7,28(sp)
c000dae0:	bc050ce3          	beqz	a0,c000d6b8 <stride_dequeue+0x2854>
c000dae4:	01652023          	sw	s6,0(a0)
c000dae8:	000b0e13          	mv	t3,s6
c000daec:	008ba403          	lw	s0,8(s7)
c000daf0:	a14fe06f          	j	c000bd04 <stride_dequeue+0xea0>
c000daf4:	0087a503          	lw	a0,8(a5)
c000daf8:	000c0593          	mv	a1,s8
c000dafc:	0047a403          	lw	s0,4(a5)
c000db00:	f15fc0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000db04:	02012783          	lw	a5,32(sp)
c000db08:	02412e03          	lw	t3,36(sp)
c000db0c:	00a7a223          	sw	a0,4(a5)
c000db10:	0087a423          	sw	s0,8(a5)
c000db14:	c80506e3          	beqz	a0,c000d7a0 <stride_dequeue+0x293c>
c000db18:	00f52023          	sw	a5,0(a0)
c000db1c:	00078c13          	mv	s8,a5
c000db20:	008ba403          	lw	s0,8(s7)
c000db24:	f7cfe06f          	j	c000c2a0 <stride_dequeue+0x143c>
c000db28:	004c2703          	lw	a4,4(s8)
c000db2c:	008c2783          	lw	a5,8(s8)
c000db30:	02a12623          	sw	a0,44(sp)
c000db34:	02e12023          	sw	a4,32(sp)
c000db38:	04078a63          	beqz	a5,c000db8c <stride_dequeue+0x2d28>
c000db3c:	000e8593          	mv	a1,t4
c000db40:	00078513          	mv	a0,a5
c000db44:	03d12423          	sw	t4,40(sp)
c000db48:	02f12223          	sw	a5,36(sp)
c000db4c:	e3dfc0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000db50:	02c12f83          	lw	t6,44(sp)
c000db54:	02412783          	lw	a5,36(sp)
c000db58:	02812e83          	lw	t4,40(sp)
c000db5c:	3ff50e63          	beq	a0,t6,c000df58 <stride_dequeue+0x30f4>
c000db60:	008ea583          	lw	a1,8(t4)
c000db64:	00078513          	mv	a0,a5
c000db68:	004ea403          	lw	s0,4(t4)
c000db6c:	03d12223          	sw	t4,36(sp)
c000db70:	ea5fc0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000db74:	02412e83          	lw	t4,36(sp)
c000db78:	00aea223          	sw	a0,4(t4)
c000db7c:	008ea423          	sw	s0,8(t4)
c000db80:	00050463          	beqz	a0,c000db88 <stride_dequeue+0x2d24>
c000db84:	01d52023          	sw	t4,0(a0)
c000db88:	008ba403          	lw	s0,8(s7)
c000db8c:	02012783          	lw	a5,32(sp)
c000db90:	01dc2223          	sw	t4,4(s8)
c000db94:	00fc2423          	sw	a5,8(s8)
c000db98:	018ea023          	sw	s8,0(t4)
c000db9c:	000c0e93          	mv	t4,s8
c000dba0:	ba4ff06f          	j	c000cf44 <stride_dequeue+0x20e0>
c000dba4:	0087a503          	lw	a0,8(a5)
c000dba8:	000d8593          	mv	a1,s11
c000dbac:	0047a403          	lw	s0,4(a5)
c000dbb0:	03d12023          	sw	t4,32(sp)
c000dbb4:	00f12e23          	sw	a5,28(sp)
c000dbb8:	e5dfc0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000dbbc:	01c12783          	lw	a5,28(sp)
c000dbc0:	02012e83          	lw	t4,32(sp)
c000dbc4:	00a7a223          	sw	a0,4(a5)
c000dbc8:	0087a423          	sw	s0,8(a5)
c000dbcc:	3a050e63          	beqz	a0,c000df88 <stride_dequeue+0x3124>
c000dbd0:	00f52023          	sw	a5,0(a0)
c000dbd4:	00078d93          	mv	s11,a5
c000dbd8:	008ba403          	lw	s0,8(s7)
c000dbdc:	848ff06f          	j	c000cc24 <stride_dequeue+0x1dc0>
c000dbe0:	004da783          	lw	a5,4(s11)
c000dbe4:	008dac03          	lw	s8,8(s11)
c000dbe8:	02a12623          	sw	a0,44(sp)
c000dbec:	02f12023          	sw	a5,32(sp)
c000dbf0:	040c0a63          	beqz	s8,c000dc44 <stride_dequeue+0x2de0>
c000dbf4:	000e8593          	mv	a1,t4
c000dbf8:	000c0513          	mv	a0,s8
c000dbfc:	d8dfc0ef          	jal	ra,c000a988 <proc_stride_comp_f>
c000dc00:	02c12703          	lw	a4,44(sp)
c000dc04:	02412e83          	lw	t4,36(sp)
c000dc08:	02812e03          	lw	t3,40(sp)
c000dc0c:	50e50863          	beq	a0,a4,c000e11c <stride_dequeue+0x32b8>
c000dc10:	008ea583          	lw	a1,8(t4)
c000dc14:	000c0513          	mv	a0,s8
c000dc18:	004ea403          	lw	s0,4(t4)
c000dc1c:	03c12423          	sw	t3,40(sp)
c000dc20:	03d12223          	sw	t4,36(sp)
c000dc24:	df1fc0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000dc28:	02412e83          	lw	t4,36(sp)
c000dc2c:	02812e03          	lw	t3,40(sp)
c000dc30:	00aea223          	sw	a0,4(t4)
c000dc34:	008ea423          	sw	s0,8(t4)
c000dc38:	00050463          	beqz	a0,c000dc40 <stride_dequeue+0x2ddc>
c000dc3c:	01d52023          	sw	t4,0(a0)
c000dc40:	008ba403          	lw	s0,8(s7)
c000dc44:	02012783          	lw	a5,32(sp)
c000dc48:	01dda223          	sw	t4,4(s11)
c000dc4c:	00fda423          	sw	a5,8(s11)
c000dc50:	01bea023          	sw	s11,0(t4)
c000dc54:	000d8e93          	mv	t4,s11
c000dc58:	96cff06f          	j	c000cdc4 <stride_dequeue+0x1f60>
c000dc5c:	008c2503          	lw	a0,8(s8)
c000dc60:	004c2403          	lw	s0,4(s8)
c000dc64:	000b0593          	mv	a1,s6
c000dc68:	dadfc0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000dc6c:	00ac2223          	sw	a0,4(s8)
c000dc70:	008c2423          	sw	s0,8(s8)
c000dc74:	01812303          	lw	t1,24(sp)
c000dc78:	44050a63          	beqz	a0,c000e0cc <stride_dequeue+0x3268>
c000dc7c:	01852023          	sw	s8,0(a0)
c000dc80:	000c0b13          	mv	s6,s8
c000dc84:	008ba403          	lw	s0,8(s7)
c000dc88:	ce8ff06f          	j	c000d170 <stride_dequeue+0x230c>
c000dc8c:	008c2503          	lw	a0,8(s8)
c000dc90:	004c2403          	lw	s0,4(s8)
c000dc94:	000b0593          	mv	a1,s6
c000dc98:	d7dfc0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000dc9c:	00ac2223          	sw	a0,4(s8)
c000dca0:	008c2423          	sw	s0,8(s8)
c000dca4:	01812783          	lw	a5,24(sp)
c000dca8:	3a050263          	beqz	a0,c000e04c <stride_dequeue+0x31e8>
c000dcac:	01852023          	sw	s8,0(a0)
c000dcb0:	000c0b13          	mv	s6,s8
c000dcb4:	008ba403          	lw	s0,8(s7)
c000dcb8:	bf4ff06f          	j	c000d0ac <stride_dequeue+0x2248>
c000dcbc:	008c2503          	lw	a0,8(s8)
c000dcc0:	004c2403          	lw	s0,4(s8)
c000dcc4:	000b0593          	mv	a1,s6
c000dcc8:	d4dfc0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000dccc:	00ac2223          	sw	a0,4(s8)
c000dcd0:	008c2423          	sw	s0,8(s8)
c000dcd4:	01812783          	lw	a5,24(sp)
c000dcd8:	5e050463          	beqz	a0,c000e2c0 <stride_dequeue+0x345c>
c000dcdc:	01852023          	sw	s8,0(a0)
c000dce0:	000c0b13          	mv	s6,s8
c000dce4:	008ba403          	lw	s0,8(s7)
c000dce8:	b54ff06f          	j	c000d03c <stride_dequeue+0x21d8>
c000dcec:	008da503          	lw	a0,8(s11)
c000dcf0:	004da403          	lw	s0,4(s11)
c000dcf4:	00088593          	mv	a1,a7
c000dcf8:	d1dfc0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000dcfc:	00ada223          	sw	a0,4(s11)
c000dd00:	008da423          	sw	s0,8(s11)
c000dd04:	d60506e3          	beqz	a0,c000da70 <stride_dequeue+0x2c0c>
c000dd08:	01b52023          	sw	s11,0(a0)
c000dd0c:	000d8893          	mv	a7,s11
c000dd10:	008ba403          	lw	s0,8(s7)
c000dd14:	edcfe06f          	j	c000c3f0 <stride_dequeue+0x158c>
c000dd18:	008c2503          	lw	a0,8(s8)
c000dd1c:	02012583          	lw	a1,32(sp)
c000dd20:	004c2403          	lw	s0,4(s8)
c000dd24:	cf1fc0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000dd28:	00ac2223          	sw	a0,4(s8)
c000dd2c:	008c2423          	sw	s0,8(s8)
c000dd30:	02812e03          	lw	t3,40(sp)
c000dd34:	02c12f03          	lw	t5,44(sp)
c000dd38:	00050463          	beqz	a0,c000dd40 <stride_dequeue+0x2edc>
c000dd3c:	01852023          	sw	s8,0(a0)
c000dd40:	008ba403          	lw	s0,8(s7)
c000dd44:	aa1fe06f          	j	c000c7e4 <stride_dequeue+0x1980>
c000dd48:	00832503          	lw	a0,8(t1)
c000dd4c:	000f0593          	mv	a1,t5
c000dd50:	00432403          	lw	s0,4(t1)
c000dd54:	cc1fc0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000dd58:	02012303          	lw	t1,32(sp)
c000dd5c:	02412e03          	lw	t3,36(sp)
c000dd60:	00a32223          	sw	a0,4(t1)
c000dd64:	00832423          	sw	s0,8(t1)
c000dd68:	00050463          	beqz	a0,c000dd70 <stride_dequeue+0x2f0c>
c000dd6c:	00652023          	sw	t1,0(a0)
c000dd70:	008ba403          	lw	s0,8(s7)
c000dd74:	a68fe06f          	j	c000bfdc <stride_dequeue+0x1178>
c000dd78:	008ea503          	lw	a0,8(t4)
c000dd7c:	000e0593          	mv	a1,t3
c000dd80:	004ea403          	lw	s0,4(t4)
c000dd84:	c91fc0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000dd88:	02812e83          	lw	t4,40(sp)
c000dd8c:	02c12f03          	lw	t5,44(sp)
c000dd90:	00aea223          	sw	a0,4(t4)
c000dd94:	008ea423          	sw	s0,8(t4)
c000dd98:	00050463          	beqz	a0,c000dda0 <stride_dequeue+0x2f3c>
c000dd9c:	01d52023          	sw	t4,0(a0)
c000dda0:	008ba403          	lw	s0,8(s7)
c000dda4:	b05fd06f          	j	c000b8a8 <stride_dequeue+0xa44>
c000dda8:	008da503          	lw	a0,8(s11)
c000ddac:	004da403          	lw	s0,4(s11)
c000ddb0:	000c0593          	mv	a1,s8
c000ddb4:	c61fc0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000ddb8:	00ada223          	sw	a0,4(s11)
c000ddbc:	008da423          	sw	s0,8(s11)
c000ddc0:	02412e03          	lw	t3,36(sp)
c000ddc4:	02812e83          	lw	t4,40(sp)
c000ddc8:	00050463          	beqz	a0,c000ddd0 <stride_dequeue+0x2f6c>
c000ddcc:	01b52023          	sw	s11,0(a0)
c000ddd0:	008ba403          	lw	s0,8(s7)
c000ddd4:	fe1fe06f          	j	c000cdb4 <stride_dequeue+0x1f50>
c000ddd8:	0087a503          	lw	a0,8(a5)
c000dddc:	000f0593          	mv	a1,t5
c000dde0:	0047a403          	lw	s0,4(a5)
c000dde4:	c31fc0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000dde8:	02412783          	lw	a5,36(sp)
c000ddec:	02812e03          	lw	t3,40(sp)
c000ddf0:	00a7a223          	sw	a0,4(a5)
c000ddf4:	0087a423          	sw	s0,8(a5)
c000ddf8:	00050463          	beqz	a0,c000de00 <stride_dequeue+0x2f9c>
c000ddfc:	00f52023          	sw	a5,0(a0)
c000de00:	008ba403          	lw	s0,8(s7)
c000de04:	c8cfe06f          	j	c000c290 <stride_dequeue+0x142c>
c000de08:	008da503          	lw	a0,8(s11)
c000de0c:	02012583          	lw	a1,32(sp)
c000de10:	004da403          	lw	s0,4(s11)
c000de14:	c01fc0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000de18:	00ada223          	sw	a0,4(s11)
c000de1c:	008da423          	sw	s0,8(s11)
c000de20:	02812e03          	lw	t3,40(sp)
c000de24:	00050463          	beqz	a0,c000de2c <stride_dequeue+0x2fc8>
c000de28:	01b52023          	sw	s11,0(a0)
c000de2c:	008ba403          	lw	s0,8(s7)
c000de30:	bf1fe06f          	j	c000ca20 <stride_dequeue+0x1bbc>
c000de34:	0087a503          	lw	a0,8(a5)
c000de38:	000f0593          	mv	a1,t5
c000de3c:	0047a403          	lw	s0,4(a5)
c000de40:	bd5fc0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000de44:	02412783          	lw	a5,36(sp)
c000de48:	02812e03          	lw	t3,40(sp)
c000de4c:	00a7a223          	sw	a0,4(a5)
c000de50:	0087a423          	sw	s0,8(a5)
c000de54:	00050463          	beqz	a0,c000de5c <stride_dequeue+0x2ff8>
c000de58:	00f52023          	sw	a5,0(a0)
c000de5c:	008ba403          	lw	s0,8(s7)
c000de60:	ad8fe06f          	j	c000c138 <stride_dequeue+0x12d4>
c000de64:	008c2503          	lw	a0,8(s8)
c000de68:	02012583          	lw	a1,32(sp)
c000de6c:	004c2403          	lw	s0,4(s8)
c000de70:	ba5fc0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000de74:	00ac2223          	sw	a0,4(s8)
c000de78:	008c2423          	sw	s0,8(s8)
c000de7c:	02812f03          	lw	t5,40(sp)
c000de80:	00050463          	beqz	a0,c000de88 <stride_dequeue+0x3024>
c000de84:	01852023          	sw	s8,0(a0)
c000de88:	008ba403          	lw	s0,8(s7)
c000de8c:	f9cfe06f          	j	c000c628 <stride_dequeue+0x17c4>
c000de90:	0087a503          	lw	a0,8(a5)
c000de94:	00098593          	mv	a1,s3
c000de98:	0047a403          	lw	s0,4(a5)
c000de9c:	b79fc0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000dea0:	01412783          	lw	a5,20(sp)
c000dea4:	00a7a223          	sw	a0,4(a5)
c000dea8:	0087a423          	sw	s0,8(a5)
c000deac:	44050863          	beqz	a0,c000e2fc <stride_dequeue+0x3498>
c000deb0:	00f52023          	sw	a5,0(a0)
c000deb4:	00078993          	mv	s3,a5
c000deb8:	008ba403          	lw	s0,8(s7)
c000debc:	b4cff06f          	j	c000d208 <stride_dequeue+0x23a4>
c000dec0:	008c2503          	lw	a0,8(s8)
c000dec4:	02012583          	lw	a1,32(sp)
c000dec8:	004c2403          	lw	s0,4(s8)
c000decc:	b49fc0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000ded0:	00ac2223          	sw	a0,4(s8)
c000ded4:	008c2423          	sw	s0,8(s8)
c000ded8:	02812e83          	lw	t4,40(sp)
c000dedc:	00050463          	beqz	a0,c000dee4 <stride_dequeue+0x3080>
c000dee0:	01852023          	sw	s8,0(a0)
c000dee4:	008ba403          	lw	s0,8(s7)
c000dee8:	84cff06f          	j	c000cf34 <stride_dequeue+0x20d0>
c000deec:	008ba403          	lw	s0,8(s7)
c000def0:	000c0e13          	mv	t3,s8
c000def4:	911fe06f          	j	c000c804 <stride_dequeue+0x19a0>
c000def8:	008ba403          	lw	s0,8(s7)
c000defc:	00078e13          	mv	t3,a5
c000df00:	d88fe06f          	j	c000c488 <stride_dequeue+0x1624>
c000df04:	008ba403          	lw	s0,8(s7)
c000df08:	000c0893          	mv	a7,s8
c000df0c:	96dfe06f          	j	c000c878 <stride_dequeue+0x1a14>
c000df10:	008da503          	lw	a0,8(s11)
c000df14:	004da403          	lw	s0,4(s11)
c000df18:	000e0593          	mv	a1,t3
c000df1c:	01112e23          	sw	a7,28(sp)
c000df20:	af5fc0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000df24:	00ada223          	sw	a0,4(s11)
c000df28:	008da423          	sw	s0,8(s11)
c000df2c:	01c12883          	lw	a7,28(sp)
c000df30:	00050463          	beqz	a0,c000df38 <stride_dequeue+0x30d4>
c000df34:	01b52023          	sw	s11,0(a0)
c000df38:	008ba403          	lw	s0,8(s7)
c000df3c:	ca4fe06f          	j	c000c3e0 <stride_dequeue+0x157c>
c000df40:	008ba403          	lw	s0,8(s7)
c000df44:	000c0d93          	mv	s11,s8
c000df48:	f00fe06f          	j	c000c648 <stride_dequeue+0x17e4>
c000df4c:	008ba403          	lw	s0,8(s7)
c000df50:	000d8a93          	mv	s5,s11
c000df54:	aedfe06f          	j	c000ca40 <stride_dequeue+0x1bdc>
c000df58:	0087a503          	lw	a0,8(a5)
c000df5c:	000e8593          	mv	a1,t4
c000df60:	0047a403          	lw	s0,4(a5)
c000df64:	ab1fc0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000df68:	02412783          	lw	a5,36(sp)
c000df6c:	00a7a223          	sw	a0,4(a5)
c000df70:	0087a423          	sw	s0,8(a5)
c000df74:	3c050e63          	beqz	a0,c000e350 <stride_dequeue+0x34ec>
c000df78:	00f52023          	sw	a5,0(a0)
c000df7c:	00078e93          	mv	t4,a5
c000df80:	008ba403          	lw	s0,8(s7)
c000df84:	c09ff06f          	j	c000db8c <stride_dequeue+0x2d28>
c000df88:	008ba403          	lw	s0,8(s7)
c000df8c:	00078d93          	mv	s11,a5
c000df90:	c95fe06f          	j	c000cc24 <stride_dequeue+0x1dc0>
c000df94:	008ba403          	lw	s0,8(s7)
c000df98:	000e0d93          	mv	s11,t3
c000df9c:	c44fe06f          	j	c000c3e0 <stride_dequeue+0x157c>
c000dfa0:	008da503          	lw	a0,8(s11)
c000dfa4:	004da403          	lw	s0,4(s11)
c000dfa8:	000f0593          	mv	a1,t5
c000dfac:	03c12223          	sw	t3,36(sp)
c000dfb0:	a65fc0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000dfb4:	00ada223          	sw	a0,4(s11)
c000dfb8:	008da423          	sw	s0,8(s11)
c000dfbc:	02412e03          	lw	t3,36(sp)
c000dfc0:	38050e63          	beqz	a0,c000e35c <stride_dequeue+0x34f8>
c000dfc4:	01b52023          	sw	s11,0(a0)
c000dfc8:	000d8f13          	mv	t5,s11
c000dfcc:	008ba403          	lw	s0,8(s7)
c000dfd0:	9d9ff06f          	j	c000d9a8 <stride_dequeue+0x2b44>
c000dfd4:	008ba403          	lw	s0,8(s7)
c000dfd8:	000c0d13          	mv	s10,s8
c000dfdc:	acdfe06f          	j	c000caa8 <stride_dequeue+0x1c44>
c000dfe0:	008ba403          	lw	s0,8(s7)
c000dfe4:	000f0793          	mv	a5,t5
c000dfe8:	aa8fe06f          	j	c000c290 <stride_dequeue+0x142c>
c000dfec:	008da503          	lw	a0,8(s11)
c000dff0:	004da403          	lw	s0,4(s11)
c000dff4:	00028593          	mv	a1,t0
c000dff8:	03c12623          	sw	t3,44(sp)
c000dffc:	a19fc0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000e000:	00ada223          	sw	a0,4(s11)
c000e004:	008da423          	sw	s0,8(s11)
c000e008:	02c12e03          	lw	t3,44(sp)
c000e00c:	00050463          	beqz	a0,c000e014 <stride_dequeue+0x31b0>
c000e010:	01b52023          	sw	s11,0(a0)
c000e014:	008ba403          	lw	s0,8(s7)
c000e018:	9f1fe06f          	j	c000ca08 <stride_dequeue+0x1ba4>
c000e01c:	0087a503          	lw	a0,8(a5)
c000e020:	000f0593          	mv	a1,t5
c000e024:	0047a403          	lw	s0,4(a5)
c000e028:	9edfc0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000e02c:	02412783          	lw	a5,36(sp)
c000e030:	00a7a223          	sw	a0,4(a5)
c000e034:	0087a423          	sw	s0,8(a5)
c000e038:	32050863          	beqz	a0,c000e368 <stride_dequeue+0x3504>
c000e03c:	00f52023          	sw	a5,0(a0)
c000e040:	00078f13          	mv	t5,a5
c000e044:	008ba403          	lw	s0,8(s7)
c000e048:	a11ff06f          	j	c000da58 <stride_dequeue+0x2bf4>
c000e04c:	008ba403          	lw	s0,8(s7)
c000e050:	000c0b13          	mv	s6,s8
c000e054:	858ff06f          	j	c000d0ac <stride_dequeue+0x2248>
c000e058:	008c2503          	lw	a0,8(s8)
c000e05c:	004c2403          	lw	s0,4(s8)
c000e060:	000f8593          	mv	a1,t6
c000e064:	03e12a23          	sw	t5,52(sp)
c000e068:	03c12823          	sw	t3,48(sp)
c000e06c:	9a9fc0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000e070:	00ac2223          	sw	a0,4(s8)
c000e074:	008c2423          	sw	s0,8(s8)
c000e078:	03012e03          	lw	t3,48(sp)
c000e07c:	03412f03          	lw	t5,52(sp)
c000e080:	00050463          	beqz	a0,c000e088 <stride_dequeue+0x3224>
c000e084:	01852023          	sw	s8,0(a0)
c000e088:	008ba403          	lw	s0,8(s7)
c000e08c:	f2cfe06f          	j	c000c7b8 <stride_dequeue+0x1954>
c000e090:	008ba403          	lw	s0,8(s7)
c000e094:	000f0793          	mv	a5,t5
c000e098:	8a0fe06f          	j	c000c138 <stride_dequeue+0x12d4>
c000e09c:	008c2503          	lw	a0,8(s8)
c000e0a0:	004c2403          	lw	s0,4(s8)
c000e0a4:	00028593          	mv	a1,t0
c000e0a8:	03e12623          	sw	t5,44(sp)
c000e0ac:	969fc0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000e0b0:	00ac2223          	sw	a0,4(s8)
c000e0b4:	008c2423          	sw	s0,8(s8)
c000e0b8:	02c12f03          	lw	t5,44(sp)
c000e0bc:	00050463          	beqz	a0,c000e0c4 <stride_dequeue+0x3260>
c000e0c0:	01852023          	sw	s8,0(a0)
c000e0c4:	008ba403          	lw	s0,8(s7)
c000e0c8:	d48fe06f          	j	c000c610 <stride_dequeue+0x17ac>
c000e0cc:	008ba403          	lw	s0,8(s7)
c000e0d0:	000c0b13          	mv	s6,s8
c000e0d4:	89cff06f          	j	c000d170 <stride_dequeue+0x230c>
c000e0d8:	008ba403          	lw	s0,8(s7)
c000e0dc:	000c0d93          	mv	s11,s8
c000e0e0:	a99fe06f          	j	c000cb78 <stride_dequeue+0x1d14>
c000e0e4:	008da503          	lw	a0,8(s11)
c000e0e8:	004da403          	lw	s0,4(s11)
c000e0ec:	000f8593          	mv	a1,t6
c000e0f0:	02512a23          	sw	t0,52(sp)
c000e0f4:	03c12823          	sw	t3,48(sp)
c000e0f8:	91dfc0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000e0fc:	00ada223          	sw	a0,4(s11)
c000e100:	008da423          	sw	s0,8(s11)
c000e104:	03012e03          	lw	t3,48(sp)
c000e108:	03412283          	lw	t0,52(sp)
c000e10c:	00050463          	beqz	a0,c000e114 <stride_dequeue+0x32b0>
c000e110:	01b52023          	sw	s11,0(a0)
c000e114:	008ba403          	lw	s0,8(s7)
c000e118:	8ddfe06f          	j	c000c9f4 <stride_dequeue+0x1b90>
c000e11c:	008c2503          	lw	a0,8(s8)
c000e120:	004c2403          	lw	s0,4(s8)
c000e124:	000e8593          	mv	a1,t4
c000e128:	03c12223          	sw	t3,36(sp)
c000e12c:	8e9fc0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000e130:	00ac2223          	sw	a0,4(s8)
c000e134:	008c2423          	sw	s0,8(s8)
c000e138:	02412e03          	lw	t3,36(sp)
c000e13c:	20050463          	beqz	a0,c000e344 <stride_dequeue+0x34e0>
c000e140:	01852023          	sw	s8,0(a0)
c000e144:	000c0e93          	mv	t4,s8
c000e148:	008ba403          	lw	s0,8(s7)
c000e14c:	af9ff06f          	j	c000dc44 <stride_dequeue+0x2de0>
c000e150:	008ba403          	lw	s0,8(s7)
c000e154:	000e0e93          	mv	t4,t3
c000e158:	f50fd06f          	j	c000b8a8 <stride_dequeue+0xa44>
c000e15c:	008da503          	lw	a0,8(s11)
c000e160:	004da403          	lw	s0,4(s11)
c000e164:	00028593          	mv	a1,t0
c000e168:	03d12623          	sw	t4,44(sp)
c000e16c:	03c12423          	sw	t3,40(sp)
c000e170:	8a5fc0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000e174:	00ada223          	sw	a0,4(s11)
c000e178:	008da423          	sw	s0,8(s11)
c000e17c:	02812e03          	lw	t3,40(sp)
c000e180:	02c12e83          	lw	t4,44(sp)
c000e184:	00050463          	beqz	a0,c000e18c <stride_dequeue+0x3328>
c000e188:	01b52023          	sw	s11,0(a0)
c000e18c:	008ba403          	lw	s0,8(s7)
c000e190:	c11fe06f          	j	c000cda0 <stride_dequeue+0x1f3c>
c000e194:	008c2503          	lw	a0,8(s8)
c000e198:	004c2403          	lw	s0,4(s8)
c000e19c:	000f8593          	mv	a1,t6
c000e1a0:	02512a23          	sw	t0,52(sp)
c000e1a4:	03d12823          	sw	t4,48(sp)
c000e1a8:	86dfc0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000e1ac:	00ac2223          	sw	a0,4(s8)
c000e1b0:	008c2423          	sw	s0,8(s8)
c000e1b4:	03012e83          	lw	t4,48(sp)
c000e1b8:	03412283          	lw	t0,52(sp)
c000e1bc:	00050463          	beqz	a0,c000e1c4 <stride_dequeue+0x3360>
c000e1c0:	01852023          	sw	s8,0(a0)
c000e1c4:	008ba403          	lw	s0,8(s7)
c000e1c8:	d41fe06f          	j	c000cf08 <stride_dequeue+0x20a4>
c000e1cc:	008da503          	lw	a0,8(s11)
c000e1d0:	004da403          	lw	s0,4(s11)
c000e1d4:	000f8593          	mv	a1,t6
c000e1d8:	02512a23          	sw	t0,52(sp)
c000e1dc:	03d12823          	sw	t4,48(sp)
c000e1e0:	03c12623          	sw	t3,44(sp)
c000e1e4:	831fc0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000e1e8:	00ada223          	sw	a0,4(s11)
c000e1ec:	008da423          	sw	s0,8(s11)
c000e1f0:	02c12e03          	lw	t3,44(sp)
c000e1f4:	03012e83          	lw	t4,48(sp)
c000e1f8:	03412283          	lw	t0,52(sp)
c000e1fc:	00050463          	beqz	a0,c000e204 <stride_dequeue+0x33a0>
c000e200:	01b52023          	sw	s11,0(a0)
c000e204:	008ba403          	lw	s0,8(s7)
c000e208:	b85fe06f          	j	c000cd8c <stride_dequeue+0x1f28>
c000e20c:	008ba403          	lw	s0,8(s7)
c000e210:	000f0313          	mv	t1,t5
c000e214:	dc9fd06f          	j	c000bfdc <stride_dequeue+0x1178>
c000e218:	008c2503          	lw	a0,8(s8)
c000e21c:	004c2403          	lw	s0,4(s8)
c000e220:	000d8593          	mv	a1,s11
c000e224:	ff0fc0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000e228:	00ac2223          	sw	a0,4(s8)
c000e22c:	008c2423          	sw	s0,8(s8)
c000e230:	02c12e03          	lw	t3,44(sp)
c000e234:	03012f03          	lw	t5,48(sp)
c000e238:	00050463          	beqz	a0,c000e240 <stride_dequeue+0x33dc>
c000e23c:	01852023          	sw	s8,0(a0)
c000e240:	008ba403          	lw	s0,8(s7)
c000e244:	d88fe06f          	j	c000c7cc <stride_dequeue+0x1968>
c000e248:	0087a503          	lw	a0,8(a5)
c000e24c:	000c0593          	mv	a1,s8
c000e250:	0047a403          	lw	s0,4(a5)
c000e254:	fc0fc0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000e258:	02412783          	lw	a5,36(sp)
c000e25c:	02812e03          	lw	t3,40(sp)
c000e260:	00a7a223          	sw	a0,4(a5)
c000e264:	0087a423          	sw	s0,8(a5)
c000e268:	0a050063          	beqz	a0,c000e308 <stride_dequeue+0x34a4>
c000e26c:	00f52023          	sw	a5,0(a0)
c000e270:	00078c13          	mv	s8,a5
c000e274:	008ba403          	lw	s0,8(s7)
c000e278:	e34ff06f          	j	c000d8ac <stride_dequeue+0x2a48>
c000e27c:	008ba403          	lw	s0,8(s7)
c000e280:	000c0d93          	mv	s11,s8
c000e284:	88dfe06f          	j	c000cb10 <stride_dequeue+0x1cac>
c000e288:	008c2503          	lw	a0,8(s8)
c000e28c:	004c2403          	lw	s0,4(s8)
c000e290:	000f8593          	mv	a1,t6
c000e294:	02512a23          	sw	t0,52(sp)
c000e298:	03e12823          	sw	t5,48(sp)
c000e29c:	f78fc0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000e2a0:	00ac2223          	sw	a0,4(s8)
c000e2a4:	008c2423          	sw	s0,8(s8)
c000e2a8:	03012f03          	lw	t5,48(sp)
c000e2ac:	03412283          	lw	t0,52(sp)
c000e2b0:	00050463          	beqz	a0,c000e2b8 <stride_dequeue+0x3454>
c000e2b4:	01852023          	sw	s8,0(a0)
c000e2b8:	008ba403          	lw	s0,8(s7)
c000e2bc:	b40fe06f          	j	c000c5fc <stride_dequeue+0x1798>
c000e2c0:	008ba403          	lw	s0,8(s7)
c000e2c4:	000c0b13          	mv	s6,s8
c000e2c8:	d75fe06f          	j	c000d03c <stride_dequeue+0x21d8>
c000e2cc:	008c2503          	lw	a0,8(s8)
c000e2d0:	004c2403          	lw	s0,4(s8)
c000e2d4:	00028593          	mv	a1,t0
c000e2d8:	03d12623          	sw	t4,44(sp)
c000e2dc:	f38fc0ef          	jal	ra,c000aa14 <skew_heap_merge.constprop.3>
c000e2e0:	00ac2223          	sw	a0,4(s8)
c000e2e4:	008c2423          	sw	s0,8(s8)
c000e2e8:	02c12e83          	lw	t4,44(sp)
c000e2ec:	00050463          	beqz	a0,c000e2f4 <stride_dequeue+0x3490>
c000e2f0:	01852023          	sw	s8,0(a0)
c000e2f4:	008ba403          	lw	s0,8(s7)
c000e2f8:	c25fe06f          	j	c000cf1c <stride_dequeue+0x20b8>
c000e2fc:	008ba403          	lw	s0,8(s7)
c000e300:	00078993          	mv	s3,a5
c000e304:	f05fe06f          	j	c000d208 <stride_dequeue+0x23a4>
c000e308:	008ba403          	lw	s0,8(s7)
c000e30c:	00078c13          	mv	s8,a5
c000e310:	d9cff06f          	j	c000d8ac <stride_dequeue+0x2a48>
c000e314:	008ba403          	lw	s0,8(s7)
c000e318:	000f8c13          	mv	s8,t6
c000e31c:	ae0fe06f          	j	c000c5fc <stride_dequeue+0x1798>
c000e320:	008ba403          	lw	s0,8(s7)
c000e324:	000f8c13          	mv	s8,t6
c000e328:	be1fe06f          	j	c000cf08 <stride_dequeue+0x20a4>
c000e32c:	008ba403          	lw	s0,8(s7)
c000e330:	000f8d93          	mv	s11,t6
c000e334:	a59fe06f          	j	c000cd8c <stride_dequeue+0x1f28>
c000e338:	008ba403          	lw	s0,8(s7)
c000e33c:	000f8d93          	mv	s11,t6
c000e340:	eb4fe06f          	j	c000c9f4 <stride_dequeue+0x1b90>
c000e344:	008ba403          	lw	s0,8(s7)
c000e348:	000c0e93          	mv	t4,s8
c000e34c:	8f9ff06f          	j	c000dc44 <stride_dequeue+0x2de0>
c000e350:	008ba403          	lw	s0,8(s7)
c000e354:	00078e93          	mv	t4,a5
c000e358:	835ff06f          	j	c000db8c <stride_dequeue+0x2d28>
c000e35c:	008ba403          	lw	s0,8(s7)
c000e360:	000d8f13          	mv	t5,s11
c000e364:	e44ff06f          	j	c000d9a8 <stride_dequeue+0x2b44>
c000e368:	008ba403          	lw	s0,8(s7)
c000e36c:	00078f13          	mv	t5,a5
c000e370:	ee8ff06f          	j	c000da58 <stride_dequeue+0x2bf4>
c000e374:	008ba403          	lw	s0,8(s7)
c000e378:	000f8c13          	mv	s8,t6
c000e37c:	c3cfe06f          	j	c000c7b8 <stride_dequeue+0x1954>

c000e380 <sys_getpid>:
c000e380:	0008c797          	auipc	a5,0x8c
c000e384:	42c7a783          	lw	a5,1068(a5) # c009a7ac <current>
c000e388:	0047a503          	lw	a0,4(a5)
c000e38c:	00008067          	ret

c000e390 <sys_gettime>:
c000e390:	0008c517          	auipc	a0,0x8c
c000e394:	45c52503          	lw	a0,1116(a0) # c009a7ec <ticks>
c000e398:	00008067          	ret

c000e39c <sys_lab6_set_priority>:
c000e39c:	00052503          	lw	a0,0(a0)
c000e3a0:	ff010113          	addi	sp,sp,-16
c000e3a4:	00112623          	sw	ra,12(sp)
c000e3a8:	ec9fb0ef          	jal	ra,c000a270 <lab6_set_priority>
c000e3ac:	00c12083          	lw	ra,12(sp)
c000e3b0:	00000513          	li	a0,0
c000e3b4:	01010113          	addi	sp,sp,16
c000e3b8:	00008067          	ret

c000e3bc <sys_dup>:
c000e3bc:	00452583          	lw	a1,4(a0)
c000e3c0:	00052503          	lw	a0,0(a0)
c000e3c4:	e91f806f          	j	c0007254 <sysfile_dup>

c000e3c8 <sys_getdirentry>:
c000e3c8:	00452583          	lw	a1,4(a0)
c000e3cc:	00052503          	lw	a0,0(a0)
c000e3d0:	d1df806f          	j	c00070ec <sysfile_getdirentry>

c000e3d4 <sys_getcwd>:
c000e3d4:	00452583          	lw	a1,4(a0)
c000e3d8:	00052503          	lw	a0,0(a0)
c000e3dc:	bf9f806f          	j	c0006fd4 <sysfile_getcwd>

c000e3e0 <sys_fsync>:
c000e3e0:	00052503          	lw	a0,0(a0)
c000e3e4:	bedf806f          	j	c0006fd0 <sysfile_fsync>

c000e3e8 <sys_fstat>:
c000e3e8:	00452583          	lw	a1,4(a0)
c000e3ec:	00052503          	lw	a0,0(a0)
c000e3f0:	b21f806f          	j	c0006f10 <sysfile_fstat>

c000e3f4 <sys_seek>:
c000e3f4:	00852603          	lw	a2,8(a0)
c000e3f8:	00452583          	lw	a1,4(a0)
c000e3fc:	00052503          	lw	a0,0(a0)
c000e400:	b0df806f          	j	c0006f0c <sysfile_seek>

c000e404 <sys_write>:
c000e404:	00852603          	lw	a2,8(a0)
c000e408:	00452583          	lw	a1,4(a0)
c000e40c:	00052503          	lw	a0,0(a0)
c000e410:	941f806f          	j	c0006d50 <sysfile_write>

c000e414 <sys_read>:
c000e414:	00852603          	lw	a2,8(a0)
c000e418:	00452583          	lw	a1,4(a0)
c000e41c:	00052503          	lw	a0,0(a0)
c000e420:	f68f806f          	j	c0006b88 <sysfile_read>

c000e424 <sys_close>:
c000e424:	00052503          	lw	a0,0(a0)
c000e428:	f5cf806f          	j	c0006b84 <sysfile_close>

c000e42c <sys_open>:
c000e42c:	00452583          	lw	a1,4(a0)
c000e430:	00052503          	lw	a0,0(a0)
c000e434:	ef8f806f          	j	c0006b2c <sysfile_open>

c000e438 <sys_pgdir>:
c000e438:	ff010113          	addi	sp,sp,-16
c000e43c:	00112623          	sw	ra,12(sp)
c000e440:	938f70ef          	jal	ra,c0005578 <print_pgdir>
c000e444:	00c12083          	lw	ra,12(sp)
c000e448:	00000513          	li	a0,0
c000e44c:	01010113          	addi	sp,sp,16
c000e450:	00008067          	ret

c000e454 <sys_putc>:
c000e454:	00052503          	lw	a0,0(a0)
c000e458:	ff010113          	addi	sp,sp,-16
c000e45c:	00112623          	sw	ra,12(sp)
c000e460:	d49f10ef          	jal	ra,c00001a8 <cputchar>
c000e464:	00c12083          	lw	ra,12(sp)
c000e468:	00000513          	li	a0,0
c000e46c:	01010113          	addi	sp,sp,16
c000e470:	00008067          	ret

c000e474 <sys_kill>:
c000e474:	00052503          	lw	a0,0(a0)
c000e478:	bb5fb06f          	j	c000a02c <do_kill>

c000e47c <sys_sleep>:
c000e47c:	00052503          	lw	a0,0(a0)
c000e480:	e19fb06f          	j	c000a298 <do_sleep>

c000e484 <sys_yield>:
c000e484:	b25fb06f          	j	c0009fa8 <do_yield>

c000e488 <sys_exec>:
c000e488:	00852603          	lw	a2,8(a0)
c000e48c:	00452583          	lw	a1,4(a0)
c000e490:	00052503          	lw	a0,0(a0)
c000e494:	980fb06f          	j	c0009614 <do_execve>

c000e498 <sys_wait>:
c000e498:	00452583          	lw	a1,4(a0)
c000e49c:	00052503          	lw	a0,0(a0)
c000e4a0:	b21fb06f          	j	c0009fc0 <do_wait>

c000e4a4 <sys_fork>:
c000e4a4:	0008c797          	auipc	a5,0x8c
c000e4a8:	3087a783          	lw	a5,776(a5) # c009a7ac <current>
c000e4ac:	0547a603          	lw	a2,84(a5)
c000e4b0:	00000513          	li	a0,0
c000e4b4:	00862583          	lw	a1,8(a2)
c000e4b8:	d5cfa06f          	j	c0008a14 <do_fork>

c000e4bc <sys_exit>:
c000e4bc:	00052503          	lw	a0,0(a0)
c000e4c0:	b8dfa06f          	j	c000904c <do_exit>

c000e4c4 <syscall>:
c000e4c4:	fd010113          	addi	sp,sp,-48
c000e4c8:	0008c797          	auipc	a5,0x8c
c000e4cc:	2e47a783          	lw	a5,740(a5) # c009a7ac <current>
c000e4d0:	02812423          	sw	s0,40(sp)
c000e4d4:	0547a403          	lw	s0,84(a5)
c000e4d8:	02912223          	sw	s1,36(sp)
c000e4dc:	02112623          	sw	ra,44(sp)
c000e4e0:	02842483          	lw	s1,40(s0)
c000e4e4:	0ff00793          	li	a5,255
c000e4e8:	0697e263          	bltu	a5,s1,c000e54c <syscall+0x88>
c000e4ec:	00249713          	slli	a4,s1,0x2
c000e4f0:	00008797          	auipc	a5,0x8
c000e4f4:	fd878793          	addi	a5,a5,-40 # c00164c8 <syscalls>
c000e4f8:	00e787b3          	add	a5,a5,a4
c000e4fc:	0007a783          	lw	a5,0(a5)
c000e500:	04078663          	beqz	a5,c000e54c <syscall+0x88>
c000e504:	02c42503          	lw	a0,44(s0)
c000e508:	03042583          	lw	a1,48(s0)
c000e50c:	03442603          	lw	a2,52(s0)
c000e510:	03842683          	lw	a3,56(s0)
c000e514:	03c42703          	lw	a4,60(s0)
c000e518:	00a12623          	sw	a0,12(sp)
c000e51c:	00b12823          	sw	a1,16(sp)
c000e520:	00c12a23          	sw	a2,20(sp)
c000e524:	00d12c23          	sw	a3,24(sp)
c000e528:	00e12e23          	sw	a4,28(sp)
c000e52c:	00c10513          	addi	a0,sp,12
c000e530:	000780e7          	jalr	a5
c000e534:	02c12083          	lw	ra,44(sp)
c000e538:	02a42423          	sw	a0,40(s0)
c000e53c:	02412483          	lw	s1,36(sp)
c000e540:	02812403          	lw	s0,40(sp)
c000e544:	03010113          	addi	sp,sp,48
c000e548:	00008067          	ret
c000e54c:	00040513          	mv	a0,s0
c000e550:	aa9f20ef          	jal	ra,c0000ff8 <print_trapframe>
c000e554:	0008c797          	auipc	a5,0x8c
c000e558:	2587a783          	lw	a5,600(a5) # c009a7ac <current>
c000e55c:	0047a703          	lw	a4,4(a5)
c000e560:	00048693          	mv	a3,s1
c000e564:	06078793          	addi	a5,a5,96
c000e568:	00008617          	auipc	a2,0x8
c000e56c:	f1c60613          	addi	a2,a2,-228 # c0016484 <default_pmm_manager+0x1194>
c000e570:	0cd00593          	li	a1,205
c000e574:	00008517          	auipc	a0,0x8
c000e578:	f3c50513          	addi	a0,a0,-196 # c00164b0 <default_pmm_manager+0x11c0>
c000e57c:	d49f10ef          	jal	ra,c00002c4 <__panic>

c000e580 <swapfs_init>:
c000e580:	ff010113          	addi	sp,sp,-16
c000e584:	00100513          	li	a0,1
c000e588:	00112623          	sw	ra,12(sp)
c000e58c:	a10f20ef          	jal	ra,c000079c <ide_device_valid>
c000e590:	02050263          	beqz	a0,c000e5b4 <swapfs_init+0x34>
c000e594:	00100513          	li	a0,1
c000e598:	a38f20ef          	jal	ra,c00007d0 <ide_device_size>
c000e59c:	00c12083          	lw	ra,12(sp)
c000e5a0:	00355513          	srli	a0,a0,0x3
c000e5a4:	0008c297          	auipc	t0,0x8c
c000e5a8:	2ca2a623          	sw	a0,716(t0) # c009a870 <max_swap_offset>
c000e5ac:	01010113          	addi	sp,sp,16
c000e5b0:	00008067          	ret
c000e5b4:	00008617          	auipc	a2,0x8
c000e5b8:	31460613          	addi	a2,a2,788 # c00168c8 <syscalls+0x400>
c000e5bc:	00d00593          	li	a1,13
c000e5c0:	00008517          	auipc	a0,0x8
c000e5c4:	32450513          	addi	a0,a0,804 # c00168e4 <syscalls+0x41c>
c000e5c8:	cfdf10ef          	jal	ra,c00002c4 <__panic>

c000e5cc <swapfs_read>:
c000e5cc:	ff010113          	addi	sp,sp,-16
c000e5d0:	00112623          	sw	ra,12(sp)
c000e5d4:	00855793          	srli	a5,a0,0x8
c000e5d8:	06078663          	beqz	a5,c000e644 <swapfs_read+0x78>
c000e5dc:	0008c717          	auipc	a4,0x8c
c000e5e0:	29472703          	lw	a4,660(a4) # c009a870 <max_swap_offset>
c000e5e4:	06e7f063          	bleu	a4,a5,c000e644 <swapfs_read+0x78>
c000e5e8:	0008c617          	auipc	a2,0x8c
c000e5ec:	2c862603          	lw	a2,712(a2) # c009a8b0 <pages>
c000e5f0:	40c58633          	sub	a2,a1,a2
c000e5f4:	40565613          	srai	a2,a2,0x5
c000e5f8:	00089597          	auipc	a1,0x89
c000e5fc:	a4c5a583          	lw	a1,-1460(a1) # c0097044 <nbase>
c000e600:	00100737          	lui	a4,0x100
c000e604:	00b60633          	add	a2,a2,a1
c000e608:	fff70713          	addi	a4,a4,-1 # fffff <_binary_bin_sfs_img_size+0x8acff>
c000e60c:	00e67733          	and	a4,a2,a4
c000e610:	0008c697          	auipc	a3,0x8c
c000e614:	1946a683          	lw	a3,404(a3) # c009a7a4 <npage>
c000e618:	00379593          	slli	a1,a5,0x3
c000e61c:	00c61613          	slli	a2,a2,0xc
c000e620:	04d77063          	bleu	a3,a4,c000e660 <swapfs_read+0x94>
c000e624:	00c12083          	lw	ra,12(sp)
c000e628:	0008c797          	auipc	a5,0x8c
c000e62c:	2807a783          	lw	a5,640(a5) # c009a8a8 <va_pa_offset>
c000e630:	00800693          	li	a3,8
c000e634:	00f60633          	add	a2,a2,a5
c000e638:	00100513          	li	a0,1
c000e63c:	01010113          	addi	sp,sp,16
c000e640:	9c8f206f          	j	c0000808 <ide_read_secs>
c000e644:	00050693          	mv	a3,a0
c000e648:	00008617          	auipc	a2,0x8
c000e64c:	2b460613          	addi	a2,a2,692 # c00168fc <syscalls+0x434>
c000e650:	01400593          	li	a1,20
c000e654:	00008517          	auipc	a0,0x8
c000e658:	29050513          	addi	a0,a0,656 # c00168e4 <syscalls+0x41c>
c000e65c:	c69f10ef          	jal	ra,c00002c4 <__panic>
c000e660:	00060693          	mv	a3,a2
c000e664:	06e00593          	li	a1,110
c000e668:	00006617          	auipc	a2,0x6
c000e66c:	51860613          	addi	a2,a2,1304 # c0014b80 <commands+0xec8>
c000e670:	00006517          	auipc	a0,0x6
c000e674:	2a450513          	addi	a0,a0,676 # c0014914 <commands+0xc5c>
c000e678:	c4df10ef          	jal	ra,c00002c4 <__panic>

c000e67c <swapfs_write>:
c000e67c:	ff010113          	addi	sp,sp,-16
c000e680:	00112623          	sw	ra,12(sp)
c000e684:	00855793          	srli	a5,a0,0x8
c000e688:	06078663          	beqz	a5,c000e6f4 <swapfs_write+0x78>
c000e68c:	0008c717          	auipc	a4,0x8c
c000e690:	1e472703          	lw	a4,484(a4) # c009a870 <max_swap_offset>
c000e694:	06e7f063          	bleu	a4,a5,c000e6f4 <swapfs_write+0x78>
c000e698:	0008c617          	auipc	a2,0x8c
c000e69c:	21862603          	lw	a2,536(a2) # c009a8b0 <pages>
c000e6a0:	40c58633          	sub	a2,a1,a2
c000e6a4:	40565613          	srai	a2,a2,0x5
c000e6a8:	00089597          	auipc	a1,0x89
c000e6ac:	99c5a583          	lw	a1,-1636(a1) # c0097044 <nbase>
c000e6b0:	00100737          	lui	a4,0x100
c000e6b4:	00b60633          	add	a2,a2,a1
c000e6b8:	fff70713          	addi	a4,a4,-1 # fffff <_binary_bin_sfs_img_size+0x8acff>
c000e6bc:	00e67733          	and	a4,a2,a4
c000e6c0:	0008c697          	auipc	a3,0x8c
c000e6c4:	0e46a683          	lw	a3,228(a3) # c009a7a4 <npage>
c000e6c8:	00379593          	slli	a1,a5,0x3
c000e6cc:	00c61613          	slli	a2,a2,0xc
c000e6d0:	04d77063          	bleu	a3,a4,c000e710 <swapfs_write+0x94>
c000e6d4:	00c12083          	lw	ra,12(sp)
c000e6d8:	0008c797          	auipc	a5,0x8c
c000e6dc:	1d07a783          	lw	a5,464(a5) # c009a8a8 <va_pa_offset>
c000e6e0:	00800693          	li	a3,8
c000e6e4:	00f60633          	add	a2,a2,a5
c000e6e8:	00100513          	li	a0,1
c000e6ec:	01010113          	addi	sp,sp,16
c000e6f0:	9b0f206f          	j	c00008a0 <ide_write_secs>
c000e6f4:	00050693          	mv	a3,a0
c000e6f8:	00008617          	auipc	a2,0x8
c000e6fc:	20460613          	addi	a2,a2,516 # c00168fc <syscalls+0x434>
c000e700:	01900593          	li	a1,25
c000e704:	00008517          	auipc	a0,0x8
c000e708:	1e050513          	addi	a0,a0,480 # c00168e4 <syscalls+0x41c>
c000e70c:	bb9f10ef          	jal	ra,c00002c4 <__panic>
c000e710:	00060693          	mv	a3,a2
c000e714:	06e00593          	li	a1,110
c000e718:	00006617          	auipc	a2,0x6
c000e71c:	46860613          	addi	a2,a2,1128 # c0014b80 <commands+0xec8>
c000e720:	00006517          	auipc	a0,0x6
c000e724:	1f450513          	addi	a0,a0,500 # c0014914 <commands+0xc5c>
c000e728:	b9df10ef          	jal	ra,c00002c4 <__panic>

c000e72c <vfs_do_add>:
c000e72c:	fe010113          	addi	sp,sp,-32
c000e730:	00112e23          	sw	ra,28(sp)
c000e734:	00812c23          	sw	s0,24(sp)
c000e738:	00912a23          	sw	s1,20(sp)
c000e73c:	01212823          	sw	s2,16(sp)
c000e740:	01312623          	sw	s3,12(sp)
c000e744:	01412423          	sw	s4,8(sp)
c000e748:	01512223          	sw	s5,4(sp)
c000e74c:	01612023          	sw	s6,0(sp)
c000e750:	14050063          	beqz	a0,c000e890 <vfs_do_add+0x164>
c000e754:	00050413          	mv	s0,a0
c000e758:	00058a13          	mv	s4,a1
c000e75c:	00060b13          	mv	s6,a2
c000e760:	00068a93          	mv	s5,a3
c000e764:	10058463          	beqz	a1,c000e86c <vfs_do_add+0x140>
c000e768:	02c5a703          	lw	a4,44(a1)
c000e76c:	000017b7          	lui	a5,0x1
c000e770:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
c000e774:	0ef71e63          	bne	a4,a5,c000e870 <vfs_do_add+0x144>
c000e778:	00040513          	mv	a0,s0
c000e77c:	355040ef          	jal	ra,c00132d0 <strlen>
c000e780:	01f00793          	li	a5,31
c000e784:	ff400913          	li	s2,-12
c000e788:	08a7ea63          	bltu	a5,a0,c000e81c <vfs_do_add+0xf0>
c000e78c:	00040513          	mv	a0,s0
c000e790:	8edf10ef          	jal	ra,c000007c <strdup>
c000e794:	00050493          	mv	s1,a0
c000e798:	ffc00913          	li	s2,-4
c000e79c:	08050063          	beqz	a0,c000e81c <vfs_do_add+0xf0>
c000e7a0:	01800513          	li	a0,24
c000e7a4:	e48f40ef          	jal	ra,c0002dec <kmalloc>
c000e7a8:	00050993          	mv	s3,a0
c000e7ac:	0a050a63          	beqz	a0,c000e860 <vfs_do_add+0x134>
c000e7b0:	0008b517          	auipc	a0,0x8b
c000e7b4:	fac50513          	addi	a0,a0,-84 # c009975c <vdev_list_sem>
c000e7b8:	0008c917          	auipc	s2,0x8c
c000e7bc:	01490913          	addi	s2,s2,20 # c009a7cc <vdev_list>
c000e7c0:	a40f80ef          	jal	ra,c0006a00 <down>
c000e7c4:	00090413          	mv	s0,s2
c000e7c8:	0140006f          	j	c000e7dc <vfs_do_add+0xb0>
c000e7cc:	ff042503          	lw	a0,-16(s0)
c000e7d0:	00048593          	mv	a1,s1
c000e7d4:	385040ef          	jal	ra,c0013358 <strcmp>
c000e7d8:	06050863          	beqz	a0,c000e848 <vfs_do_add+0x11c>
c000e7dc:	00442403          	lw	s0,4(s0)
c000e7e0:	ff2416e3          	bne	s0,s2,c000e7cc <vfs_do_add+0xa0>
c000e7e4:	00442703          	lw	a4,4(s0)
c000e7e8:	01098793          	addi	a5,s3,16
c000e7ec:	0099a023          	sw	s1,0(s3)
c000e7f0:	0149a223          	sw	s4,4(s3)
c000e7f4:	0159a623          	sw	s5,12(s3)
c000e7f8:	0169a423          	sw	s6,8(s3)
c000e7fc:	00f72023          	sw	a5,0(a4)
c000e800:	00e9aa23          	sw	a4,20(s3)
c000e804:	0089a823          	sw	s0,16(s3)
c000e808:	0008b517          	auipc	a0,0x8b
c000e80c:	f5450513          	addi	a0,a0,-172 # c009975c <vdev_list_sem>
c000e810:	00f42223          	sw	a5,4(s0)
c000e814:	00000913          	li	s2,0
c000e818:	9e4f80ef          	jal	ra,c00069fc <up>
c000e81c:	01c12083          	lw	ra,28(sp)
c000e820:	00090513          	mv	a0,s2
c000e824:	01812403          	lw	s0,24(sp)
c000e828:	01412483          	lw	s1,20(sp)
c000e82c:	01012903          	lw	s2,16(sp)
c000e830:	00c12983          	lw	s3,12(sp)
c000e834:	00812a03          	lw	s4,8(sp)
c000e838:	00412a83          	lw	s5,4(sp)
c000e83c:	00012b03          	lw	s6,0(sp)
c000e840:	02010113          	addi	sp,sp,32
c000e844:	00008067          	ret
c000e848:	0008b517          	auipc	a0,0x8b
c000e84c:	f1450513          	addi	a0,a0,-236 # c009975c <vdev_list_sem>
c000e850:	9acf80ef          	jal	ra,c00069fc <up>
c000e854:	00098513          	mv	a0,s3
c000e858:	eb4f40ef          	jal	ra,c0002f0c <kfree>
c000e85c:	fe900913          	li	s2,-23
c000e860:	00048513          	mv	a0,s1
c000e864:	ea8f40ef          	jal	ra,c0002f0c <kfree>
c000e868:	fb5ff06f          	j	c000e81c <vfs_do_add+0xf0>
c000e86c:	f00686e3          	beqz	a3,c000e778 <vfs_do_add+0x4c>
c000e870:	00008697          	auipc	a3,0x8
c000e874:	0d468693          	addi	a3,a3,212 # c0016944 <syscalls+0x47c>
c000e878:	00005617          	auipc	a2,0x5
c000e87c:	5a460613          	addi	a2,a2,1444 # c0013e1c <commands+0x164>
c000e880:	08f00593          	li	a1,143
c000e884:	00008517          	auipc	a0,0x8
c000e888:	0a850513          	addi	a0,a0,168 # c001692c <syscalls+0x464>
c000e88c:	a39f10ef          	jal	ra,c00002c4 <__panic>
c000e890:	00008697          	auipc	a3,0x8
c000e894:	08c68693          	addi	a3,a3,140 # c001691c <syscalls+0x454>
c000e898:	00005617          	auipc	a2,0x5
c000e89c:	58460613          	addi	a2,a2,1412 # c0013e1c <commands+0x164>
c000e8a0:	08e00593          	li	a1,142
c000e8a4:	00008517          	auipc	a0,0x8
c000e8a8:	08850513          	addi	a0,a0,136 # c001692c <syscalls+0x464>
c000e8ac:	a19f10ef          	jal	ra,c00002c4 <__panic>

c000e8b0 <find_mount>:
c000e8b0:	fe010113          	addi	sp,sp,-32
c000e8b4:	00112e23          	sw	ra,28(sp)
c000e8b8:	00812c23          	sw	s0,24(sp)
c000e8bc:	00912a23          	sw	s1,20(sp)
c000e8c0:	01212823          	sw	s2,16(sp)
c000e8c4:	01312623          	sw	s3,12(sp)
c000e8c8:	06050e63          	beqz	a0,c000e944 <find_mount+0x94>
c000e8cc:	0008c497          	auipc	s1,0x8c
c000e8d0:	f0048493          	addi	s1,s1,-256 # c009a7cc <vdev_list>
c000e8d4:	00050913          	mv	s2,a0
c000e8d8:	00058993          	mv	s3,a1
c000e8dc:	00048413          	mv	s0,s1
c000e8e0:	00442403          	lw	s0,4(s0)
c000e8e4:	04940063          	beq	s0,s1,c000e924 <find_mount+0x74>
c000e8e8:	ffc42783          	lw	a5,-4(s0)
c000e8ec:	fe078ae3          	beqz	a5,c000e8e0 <find_mount+0x30>
c000e8f0:	ff042503          	lw	a0,-16(s0)
c000e8f4:	00090593          	mv	a1,s2
c000e8f8:	261040ef          	jal	ra,c0013358 <strcmp>
c000e8fc:	fe0512e3          	bnez	a0,c000e8e0 <find_mount+0x30>
c000e900:	01c12083          	lw	ra,28(sp)
c000e904:	ff040413          	addi	s0,s0,-16
c000e908:	0089a023          	sw	s0,0(s3)
c000e90c:	01412483          	lw	s1,20(sp)
c000e910:	01812403          	lw	s0,24(sp)
c000e914:	01012903          	lw	s2,16(sp)
c000e918:	00c12983          	lw	s3,12(sp)
c000e91c:	02010113          	addi	sp,sp,32
c000e920:	00008067          	ret
c000e924:	01c12083          	lw	ra,28(sp)
c000e928:	ff300513          	li	a0,-13
c000e92c:	01812403          	lw	s0,24(sp)
c000e930:	01412483          	lw	s1,20(sp)
c000e934:	01012903          	lw	s2,16(sp)
c000e938:	00c12983          	lw	s3,12(sp)
c000e93c:	02010113          	addi	sp,sp,32
c000e940:	00008067          	ret
c000e944:	00008697          	auipc	a3,0x8
c000e948:	fd868693          	addi	a3,a3,-40 # c001691c <syscalls+0x454>
c000e94c:	00005617          	auipc	a2,0x5
c000e950:	4d060613          	addi	a2,a2,1232 # c0013e1c <commands+0x164>
c000e954:	0cd00593          	li	a1,205
c000e958:	00008517          	auipc	a0,0x8
c000e95c:	fd450513          	addi	a0,a0,-44 # c001692c <syscalls+0x464>
c000e960:	965f10ef          	jal	ra,c00002c4 <__panic>

c000e964 <vfs_devlist_init>:
c000e964:	0008c797          	auipc	a5,0x8c
c000e968:	e6878793          	addi	a5,a5,-408 # c009a7cc <vdev_list>
c000e96c:	00100593          	li	a1,1
c000e970:	0008b517          	auipc	a0,0x8b
c000e974:	dec50513          	addi	a0,a0,-532 # c009975c <vdev_list_sem>
c000e978:	00f7a223          	sw	a5,4(a5)
c000e97c:	00f7a023          	sw	a5,0(a5)
c000e980:	870f806f          	j	c00069f0 <sem_init>

c000e984 <vfs_cleanup>:
c000e984:	ff010113          	addi	sp,sp,-16
c000e988:	00912223          	sw	s1,4(sp)
c000e98c:	00112623          	sw	ra,12(sp)
c000e990:	00812423          	sw	s0,8(sp)
c000e994:	0008c497          	auipc	s1,0x8c
c000e998:	e3848493          	addi	s1,s1,-456 # c009a7cc <vdev_list>
c000e99c:	0008c797          	auipc	a5,0x8c
c000e9a0:	e347a783          	lw	a5,-460(a5) # c009a7d0 <vdev_list+0x4>
c000e9a4:	04978a63          	beq	a5,s1,c000e9f8 <vfs_cleanup+0x74>
c000e9a8:	0008b517          	auipc	a0,0x8b
c000e9ac:	db450513          	addi	a0,a0,-588 # c009975c <vdev_list_sem>
c000e9b0:	850f80ef          	jal	ra,c0006a00 <down>
c000e9b4:	00048413          	mv	s0,s1
c000e9b8:	00442403          	lw	s0,4(s0)
c000e9bc:	02940063          	beq	s0,s1,c000e9dc <vfs_cleanup+0x58>
c000e9c0:	ff842783          	lw	a5,-8(s0)
c000e9c4:	00078513          	mv	a0,a5
c000e9c8:	fe0788e3          	beqz	a5,c000e9b8 <vfs_cleanup+0x34>
c000e9cc:	07c7a783          	lw	a5,124(a5)
c000e9d0:	000780e7          	jalr	a5
c000e9d4:	00442403          	lw	s0,4(s0)
c000e9d8:	fe9414e3          	bne	s0,s1,c000e9c0 <vfs_cleanup+0x3c>
c000e9dc:	00c12083          	lw	ra,12(sp)
c000e9e0:	00812403          	lw	s0,8(sp)
c000e9e4:	00412483          	lw	s1,4(sp)
c000e9e8:	0008b517          	auipc	a0,0x8b
c000e9ec:	d7450513          	addi	a0,a0,-652 # c009975c <vdev_list_sem>
c000e9f0:	01010113          	addi	sp,sp,16
c000e9f4:	808f806f          	j	c00069fc <up>
c000e9f8:	00c12083          	lw	ra,12(sp)
c000e9fc:	00812403          	lw	s0,8(sp)
c000ea00:	00412483          	lw	s1,4(sp)
c000ea04:	01010113          	addi	sp,sp,16
c000ea08:	00008067          	ret

c000ea0c <vfs_get_root>:
c000ea0c:	fe010113          	addi	sp,sp,-32
c000ea10:	00112e23          	sw	ra,28(sp)
c000ea14:	00812c23          	sw	s0,24(sp)
c000ea18:	00912a23          	sw	s1,20(sp)
c000ea1c:	01212823          	sw	s2,16(sp)
c000ea20:	01312623          	sw	s3,12(sp)
c000ea24:	01412423          	sw	s4,8(sp)
c000ea28:	0c050263          	beqz	a0,c000eaec <vfs_get_root+0xe0>
c000ea2c:	0008c917          	auipc	s2,0x8c
c000ea30:	da090913          	addi	s2,s2,-608 # c009a7cc <vdev_list>
c000ea34:	0008c797          	auipc	a5,0x8c
c000ea38:	d9c7a783          	lw	a5,-612(a5) # c009a7d0 <vdev_list+0x4>
c000ea3c:	ff300493          	li	s1,-13
c000ea40:	05278663          	beq	a5,s2,c000ea8c <vfs_get_root+0x80>
c000ea44:	00050993          	mv	s3,a0
c000ea48:	0008b517          	auipc	a0,0x8b
c000ea4c:	d1450513          	addi	a0,a0,-748 # c009975c <vdev_list_sem>
c000ea50:	00058a13          	mv	s4,a1
c000ea54:	00090413          	mv	s0,s2
c000ea58:	fa9f70ef          	jal	ra,c0006a00 <down>
c000ea5c:	0180006f          	j	c000ea74 <vfs_get_root+0x68>
c000ea60:	ff042583          	lw	a1,-16(s0)
c000ea64:	00098513          	mv	a0,s3
c000ea68:	0f1040ef          	jal	ra,c0013358 <strcmp>
c000ea6c:	00050493          	mv	s1,a0
c000ea70:	04050063          	beqz	a0,c000eab0 <vfs_get_root+0xa4>
c000ea74:	00442403          	lw	s0,4(s0)
c000ea78:	ff2414e3          	bne	s0,s2,c000ea60 <vfs_get_root+0x54>
c000ea7c:	ff300493          	li	s1,-13
c000ea80:	0008b517          	auipc	a0,0x8b
c000ea84:	cdc50513          	addi	a0,a0,-804 # c009975c <vdev_list_sem>
c000ea88:	f75f70ef          	jal	ra,c00069fc <up>
c000ea8c:	01c12083          	lw	ra,28(sp)
c000ea90:	00048513          	mv	a0,s1
c000ea94:	01812403          	lw	s0,24(sp)
c000ea98:	01412483          	lw	s1,20(sp)
c000ea9c:	01012903          	lw	s2,16(sp)
c000eaa0:	00c12983          	lw	s3,12(sp)
c000eaa4:	00812a03          	lw	s4,8(sp)
c000eaa8:	02010113          	addi	sp,sp,32
c000eaac:	00008067          	ret
c000eab0:	ff842503          	lw	a0,-8(s0)
c000eab4:	00050c63          	beqz	a0,c000eacc <vfs_get_root+0xc0>
c000eab8:	07452783          	lw	a5,116(a0)
c000eabc:	000780e7          	jalr	a5
c000eac0:	00050a63          	beqz	a0,c000ead4 <vfs_get_root+0xc8>
c000eac4:	00aa2023          	sw	a0,0(s4)
c000eac8:	fb9ff06f          	j	c000ea80 <vfs_get_root+0x74>
c000eacc:	ffc42783          	lw	a5,-4(s0)
c000ead0:	00078663          	beqz	a5,c000eadc <vfs_get_root+0xd0>
c000ead4:	ff200493          	li	s1,-14
c000ead8:	fa9ff06f          	j	c000ea80 <vfs_get_root+0x74>
c000eadc:	ff442503          	lw	a0,-12(s0)
c000eae0:	7d0000ef          	jal	ra,c000f2b0 <inode_ref_inc>
c000eae4:	ff442503          	lw	a0,-12(s0)
c000eae8:	fd9ff06f          	j	c000eac0 <vfs_get_root+0xb4>
c000eaec:	00008697          	auipc	a3,0x8
c000eaf0:	e3068693          	addi	a3,a3,-464 # c001691c <syscalls+0x454>
c000eaf4:	00005617          	auipc	a2,0x5
c000eaf8:	32860613          	addi	a2,a2,808 # c0013e1c <commands+0x164>
c000eafc:	04500593          	li	a1,69
c000eb00:	00008517          	auipc	a0,0x8
c000eb04:	e2c50513          	addi	a0,a0,-468 # c001692c <syscalls+0x464>
c000eb08:	fbcf10ef          	jal	ra,c00002c4 <__panic>

c000eb0c <vfs_get_devname>:
c000eb0c:	0008c697          	auipc	a3,0x8c
c000eb10:	cc068693          	addi	a3,a3,-832 # c009a7cc <vdev_list>
c000eb14:	00068793          	mv	a5,a3
c000eb18:	00051863          	bnez	a0,c000eb28 <vfs_get_devname+0x1c>
c000eb1c:	0240006f          	j	c000eb40 <vfs_get_devname+0x34>
c000eb20:	ff87a703          	lw	a4,-8(a5)
c000eb24:	00e50a63          	beq	a0,a4,c000eb38 <vfs_get_devname+0x2c>
c000eb28:	0047a783          	lw	a5,4(a5)
c000eb2c:	fed79ae3          	bne	a5,a3,c000eb20 <vfs_get_devname+0x14>
c000eb30:	00000513          	li	a0,0
c000eb34:	00008067          	ret
c000eb38:	ff07a503          	lw	a0,-16(a5)
c000eb3c:	00008067          	ret
c000eb40:	ff010113          	addi	sp,sp,-16
c000eb44:	00008697          	auipc	a3,0x8
c000eb48:	e5c68693          	addi	a3,a3,-420 # c00169a0 <syscalls+0x4d8>
c000eb4c:	00005617          	auipc	a2,0x5
c000eb50:	2d060613          	addi	a2,a2,720 # c0013e1c <commands+0x164>
c000eb54:	06a00593          	li	a1,106
c000eb58:	00008517          	auipc	a0,0x8
c000eb5c:	dd450513          	addi	a0,a0,-556 # c001692c <syscalls+0x464>
c000eb60:	00112623          	sw	ra,12(sp)
c000eb64:	f60f10ef          	jal	ra,c00002c4 <__panic>

c000eb68 <vfs_add_dev>:
c000eb68:	00060693          	mv	a3,a2
c000eb6c:	00000613          	li	a2,0
c000eb70:	bbdff06f          	j	c000e72c <vfs_do_add>

c000eb74 <vfs_mount>:
c000eb74:	fe010113          	addi	sp,sp,-32
c000eb78:	00812c23          	sw	s0,24(sp)
c000eb7c:	00050413          	mv	s0,a0
c000eb80:	0008b517          	auipc	a0,0x8b
c000eb84:	bdc50513          	addi	a0,a0,-1060 # c009975c <vdev_list_sem>
c000eb88:	00112e23          	sw	ra,28(sp)
c000eb8c:	00912a23          	sw	s1,20(sp)
c000eb90:	00058493          	mv	s1,a1
c000eb94:	e6df70ef          	jal	ra,c0006a00 <down>
c000eb98:	00040513          	mv	a0,s0
c000eb9c:	00c10593          	addi	a1,sp,12
c000eba0:	d11ff0ef          	jal	ra,c000e8b0 <find_mount>
c000eba4:	00050413          	mv	s0,a0
c000eba8:	06051263          	bnez	a0,c000ec0c <vfs_mount+0x98>
c000ebac:	00c12583          	lw	a1,12(sp)
c000ebb0:	0085a783          	lw	a5,8(a1)
c000ebb4:	06079e63          	bnez	a5,c000ec30 <vfs_mount+0xbc>
c000ebb8:	0005a783          	lw	a5,0(a1)
c000ebbc:	06078e63          	beqz	a5,c000ec38 <vfs_mount+0xc4>
c000ebc0:	00c5a783          	lw	a5,12(a1)
c000ebc4:	06078a63          	beqz	a5,c000ec38 <vfs_mount+0xc4>
c000ebc8:	0045a503          	lw	a0,4(a1)
c000ebcc:	08050663          	beqz	a0,c000ec58 <vfs_mount+0xe4>
c000ebd0:	02c52703          	lw	a4,44(a0)
c000ebd4:	000017b7          	lui	a5,0x1
c000ebd8:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
c000ebdc:	06f71e63          	bne	a4,a5,c000ec58 <vfs_mount+0xe4>
c000ebe0:	00858593          	addi	a1,a1,8
c000ebe4:	000480e7          	jalr	s1
c000ebe8:	00050413          	mv	s0,a0
c000ebec:	02051063          	bnez	a0,c000ec0c <vfs_mount+0x98>
c000ebf0:	00c12783          	lw	a5,12(sp)
c000ebf4:	0087a703          	lw	a4,8(a5)
c000ebf8:	08070063          	beqz	a4,c000ec78 <vfs_mount+0x104>
c000ebfc:	0007a583          	lw	a1,0(a5)
c000ec00:	00008517          	auipc	a0,0x8
c000ec04:	e2050513          	addi	a0,a0,-480 # c0016a20 <syscalls+0x558>
c000ec08:	d40f10ef          	jal	ra,c0000148 <cprintf>
c000ec0c:	0008b517          	auipc	a0,0x8b
c000ec10:	b5050513          	addi	a0,a0,-1200 # c009975c <vdev_list_sem>
c000ec14:	de9f70ef          	jal	ra,c00069fc <up>
c000ec18:	01c12083          	lw	ra,28(sp)
c000ec1c:	00040513          	mv	a0,s0
c000ec20:	01412483          	lw	s1,20(sp)
c000ec24:	01812403          	lw	s0,24(sp)
c000ec28:	02010113          	addi	sp,sp,32
c000ec2c:	00008067          	ret
c000ec30:	ff100413          	li	s0,-15
c000ec34:	fd9ff06f          	j	c000ec0c <vfs_mount+0x98>
c000ec38:	00008697          	auipc	a3,0x8
c000ec3c:	d7468693          	addi	a3,a3,-652 # c00169ac <syscalls+0x4e4>
c000ec40:	00005617          	auipc	a2,0x5
c000ec44:	1dc60613          	addi	a2,a2,476 # c0013e1c <commands+0x164>
c000ec48:	0eb00593          	li	a1,235
c000ec4c:	00008517          	auipc	a0,0x8
c000ec50:	ce050513          	addi	a0,a0,-800 # c001692c <syscalls+0x464>
c000ec54:	e70f10ef          	jal	ra,c00002c4 <__panic>
c000ec58:	00008697          	auipc	a3,0x8
c000ec5c:	d8068693          	addi	a3,a3,-640 # c00169d8 <syscalls+0x510>
c000ec60:	00005617          	auipc	a2,0x5
c000ec64:	1bc60613          	addi	a2,a2,444 # c0013e1c <commands+0x164>
c000ec68:	0ed00593          	li	a1,237
c000ec6c:	00008517          	auipc	a0,0x8
c000ec70:	cc050513          	addi	a0,a0,-832 # c001692c <syscalls+0x464>
c000ec74:	e50f10ef          	jal	ra,c00002c4 <__panic>
c000ec78:	00008697          	auipc	a3,0x8
c000ec7c:	d9468693          	addi	a3,a3,-620 # c0016a0c <syscalls+0x544>
c000ec80:	00005617          	auipc	a2,0x5
c000ec84:	19c60613          	addi	a2,a2,412 # c0013e1c <commands+0x164>
c000ec88:	0ef00593          	li	a1,239
c000ec8c:	00008517          	auipc	a0,0x8
c000ec90:	ca050513          	addi	a0,a0,-864 # c001692c <syscalls+0x464>
c000ec94:	e30f10ef          	jal	ra,c00002c4 <__panic>

c000ec98 <vfs_get_curdir>:
c000ec98:	0008c797          	auipc	a5,0x8c
c000ec9c:	b147a783          	lw	a5,-1260(a5) # c009a7ac <current>
c000eca0:	0dc7a783          	lw	a5,220(a5)
c000eca4:	ff010113          	addi	sp,sp,-16
c000eca8:	00812423          	sw	s0,8(sp)
c000ecac:	0007a403          	lw	s0,0(a5)
c000ecb0:	00112623          	sw	ra,12(sp)
c000ecb4:	00912223          	sw	s1,4(sp)
c000ecb8:	02040663          	beqz	s0,c000ece4 <vfs_get_curdir+0x4c>
c000ecbc:	00050493          	mv	s1,a0
c000ecc0:	00040513          	mv	a0,s0
c000ecc4:	5ec000ef          	jal	ra,c000f2b0 <inode_ref_inc>
c000ecc8:	00000513          	li	a0,0
c000eccc:	0084a023          	sw	s0,0(s1)
c000ecd0:	00c12083          	lw	ra,12(sp)
c000ecd4:	00812403          	lw	s0,8(sp)
c000ecd8:	00412483          	lw	s1,4(sp)
c000ecdc:	01010113          	addi	sp,sp,16
c000ece0:	00008067          	ret
c000ece4:	ff000513          	li	a0,-16
c000ece8:	fe9ff06f          	j	c000ecd0 <vfs_get_curdir+0x38>

c000ecec <vfs_set_curdir>:
c000ecec:	fe010113          	addi	sp,sp,-32
c000ecf0:	0008c797          	auipc	a5,0x8c
c000ecf4:	abc7a783          	lw	a5,-1348(a5) # c009a7ac <current>
c000ecf8:	00812c23          	sw	s0,24(sp)
c000ecfc:	00050413          	mv	s0,a0
c000ed00:	0dc7a503          	lw	a0,220(a5)
c000ed04:	01212823          	sw	s2,16(sp)
c000ed08:	00112e23          	sw	ra,28(sp)
c000ed0c:	00912a23          	sw	s1,20(sp)
c000ed10:	d44f90ef          	jal	ra,c0008254 <lock_files>
c000ed14:	0008c797          	auipc	a5,0x8c
c000ed18:	a987a783          	lw	a5,-1384(a5) # c009a7ac <current>
c000ed1c:	0dc7a503          	lw	a0,220(a5)
c000ed20:	00052903          	lw	s2,0(a0)
c000ed24:	0b240a63          	beq	s0,s2,c000edd8 <vfs_set_curdir+0xec>
c000ed28:	08040c63          	beqz	s0,c000edc0 <vfs_set_curdir+0xd4>
c000ed2c:	03c42783          	lw	a5,60(s0)
c000ed30:	0a078863          	beqz	a5,c000ede0 <vfs_set_curdir+0xf4>
c000ed34:	0287a783          	lw	a5,40(a5)
c000ed38:	0a078463          	beqz	a5,c000ede0 <vfs_set_curdir+0xf4>
c000ed3c:	00008597          	auipc	a1,0x8
c000ed40:	dd058593          	addi	a1,a1,-560 # c0016b0c <syscalls+0x644>
c000ed44:	00040513          	mv	a0,s0
c000ed48:	590000ef          	jal	ra,c000f2d8 <inode_check>
c000ed4c:	03c42783          	lw	a5,60(s0)
c000ed50:	00c10593          	addi	a1,sp,12
c000ed54:	00040513          	mv	a0,s0
c000ed58:	0287a783          	lw	a5,40(a5)
c000ed5c:	000780e7          	jalr	a5
c000ed60:	00050493          	mv	s1,a0
c000ed64:	00051e63          	bnez	a0,c000ed80 <vfs_set_curdir+0x94>
c000ed68:	00c12783          	lw	a5,12(sp)
c000ed6c:	000076b7          	lui	a3,0x7
c000ed70:	00002737          	lui	a4,0x2
c000ed74:	00d7f7b3          	and	a5,a5,a3
c000ed78:	fee00493          	li	s1,-18
c000ed7c:	02e78863          	beq	a5,a4,c000edac <vfs_set_curdir+0xc0>
c000ed80:	0008c797          	auipc	a5,0x8c
c000ed84:	a2c7a783          	lw	a5,-1492(a5) # c009a7ac <current>
c000ed88:	0dc7a503          	lw	a0,220(a5)
c000ed8c:	cd0f90ef          	jal	ra,c000825c <unlock_files>
c000ed90:	01c12083          	lw	ra,28(sp)
c000ed94:	00048513          	mv	a0,s1
c000ed98:	01812403          	lw	s0,24(sp)
c000ed9c:	01412483          	lw	s1,20(sp)
c000eda0:	01012903          	lw	s2,16(sp)
c000eda4:	02010113          	addi	sp,sp,32
c000eda8:	00008067          	ret
c000edac:	00040513          	mv	a0,s0
c000edb0:	500000ef          	jal	ra,c000f2b0 <inode_ref_inc>
c000edb4:	0008c797          	auipc	a5,0x8c
c000edb8:	9f87a783          	lw	a5,-1544(a5) # c009a7ac <current>
c000edbc:	0dc7a503          	lw	a0,220(a5)
c000edc0:	00852023          	sw	s0,0(a0)
c000edc4:	00000493          	li	s1,0
c000edc8:	fc0902e3          	beqz	s2,c000ed8c <vfs_set_curdir+0xa0>
c000edcc:	00090513          	mv	a0,s2
c000edd0:	5d4000ef          	jal	ra,c000f3a4 <inode_ref_dec>
c000edd4:	fadff06f          	j	c000ed80 <vfs_set_curdir+0x94>
c000edd8:	00000493          	li	s1,0
c000eddc:	fb1ff06f          	j	c000ed8c <vfs_set_curdir+0xa0>
c000ede0:	00008697          	auipc	a3,0x8
c000ede4:	cc468693          	addi	a3,a3,-828 # c0016aa4 <syscalls+0x5dc>
c000ede8:	00005617          	auipc	a2,0x5
c000edec:	03460613          	addi	a2,a2,52 # c0013e1c <commands+0x164>
c000edf0:	04300593          	li	a1,67
c000edf4:	00008517          	auipc	a0,0x8
c000edf8:	d0050513          	addi	a0,a0,-768 # c0016af4 <syscalls+0x62c>
c000edfc:	cc8f10ef          	jal	ra,c00002c4 <__panic>

c000ee00 <vfs_chdir>:
c000ee00:	fe010113          	addi	sp,sp,-32
c000ee04:	00c10593          	addi	a1,sp,12
c000ee08:	00812c23          	sw	s0,24(sp)
c000ee0c:	00112e23          	sw	ra,28(sp)
c000ee10:	2c8000ef          	jal	ra,c000f0d8 <vfs_lookup>
c000ee14:	00050413          	mv	s0,a0
c000ee18:	00051c63          	bnez	a0,c000ee30 <vfs_chdir+0x30>
c000ee1c:	00c12503          	lw	a0,12(sp)
c000ee20:	ecdff0ef          	jal	ra,c000ecec <vfs_set_curdir>
c000ee24:	00050413          	mv	s0,a0
c000ee28:	00c12503          	lw	a0,12(sp)
c000ee2c:	578000ef          	jal	ra,c000f3a4 <inode_ref_dec>
c000ee30:	01c12083          	lw	ra,28(sp)
c000ee34:	00040513          	mv	a0,s0
c000ee38:	01812403          	lw	s0,24(sp)
c000ee3c:	02010113          	addi	sp,sp,32
c000ee40:	00008067          	ret

c000ee44 <vfs_getcwd>:
c000ee44:	0008c797          	auipc	a5,0x8c
c000ee48:	9687a783          	lw	a5,-1688(a5) # c009a7ac <current>
c000ee4c:	0dc7a783          	lw	a5,220(a5)
c000ee50:	fe010113          	addi	sp,sp,-32
c000ee54:	00812c23          	sw	s0,24(sp)
c000ee58:	0007a403          	lw	s0,0(a5)
c000ee5c:	00112e23          	sw	ra,28(sp)
c000ee60:	00912a23          	sw	s1,20(sp)
c000ee64:	01212823          	sw	s2,16(sp)
c000ee68:	0c040663          	beqz	s0,c000ef34 <vfs_getcwd+0xf0>
c000ee6c:	00050493          	mv	s1,a0
c000ee70:	00040513          	mv	a0,s0
c000ee74:	43c000ef          	jal	ra,c000f2b0 <inode_ref_inc>
c000ee78:	03842503          	lw	a0,56(s0)
c000ee7c:	0e050c63          	beqz	a0,c000ef74 <vfs_getcwd+0x130>
c000ee80:	c8dff0ef          	jal	ra,c000eb0c <vfs_get_devname>
c000ee84:	00050913          	mv	s2,a0
c000ee88:	448040ef          	jal	ra,c00132d0 <strlen>
c000ee8c:	00050613          	mv	a2,a0
c000ee90:	00090593          	mv	a1,s2
c000ee94:	00000713          	li	a4,0
c000ee98:	00100693          	li	a3,1
c000ee9c:	00048513          	mv	a0,s1
c000eea0:	aa4f90ef          	jal	ra,c0008144 <iobuf_move>
c000eea4:	00050913          	mv	s2,a0
c000eea8:	02050463          	beqz	a0,c000eed0 <vfs_getcwd+0x8c>
c000eeac:	00040513          	mv	a0,s0
c000eeb0:	4f4000ef          	jal	ra,c000f3a4 <inode_ref_dec>
c000eeb4:	01c12083          	lw	ra,28(sp)
c000eeb8:	00090513          	mv	a0,s2
c000eebc:	01812403          	lw	s0,24(sp)
c000eec0:	01412483          	lw	s1,20(sp)
c000eec4:	01012903          	lw	s2,16(sp)
c000eec8:	02010113          	addi	sp,sp,32
c000eecc:	00008067          	ret
c000eed0:	00100693          	li	a3,1
c000eed4:	03a00793          	li	a5,58
c000eed8:	00000713          	li	a4,0
c000eedc:	00068613          	mv	a2,a3
c000eee0:	00f10593          	addi	a1,sp,15
c000eee4:	00048513          	mv	a0,s1
c000eee8:	00f107a3          	sb	a5,15(sp)
c000eeec:	a58f90ef          	jal	ra,c0008144 <iobuf_move>
c000eef0:	00050913          	mv	s2,a0
c000eef4:	fa051ce3          	bnez	a0,c000eeac <vfs_getcwd+0x68>
c000eef8:	03c42783          	lw	a5,60(s0)
c000eefc:	04078c63          	beqz	a5,c000ef54 <vfs_getcwd+0x110>
c000ef00:	01c7a783          	lw	a5,28(a5)
c000ef04:	04078863          	beqz	a5,c000ef54 <vfs_getcwd+0x110>
c000ef08:	00008597          	auipc	a1,0x8
c000ef0c:	b9058593          	addi	a1,a1,-1136 # c0016a98 <syscalls+0x5d0>
c000ef10:	00040513          	mv	a0,s0
c000ef14:	3c4000ef          	jal	ra,c000f2d8 <inode_check>
c000ef18:	03c42783          	lw	a5,60(s0)
c000ef1c:	00048593          	mv	a1,s1
c000ef20:	00040513          	mv	a0,s0
c000ef24:	01c7a783          	lw	a5,28(a5)
c000ef28:	000780e7          	jalr	a5
c000ef2c:	00050913          	mv	s2,a0
c000ef30:	f7dff06f          	j	c000eeac <vfs_getcwd+0x68>
c000ef34:	01c12083          	lw	ra,28(sp)
c000ef38:	ff000913          	li	s2,-16
c000ef3c:	00090513          	mv	a0,s2
c000ef40:	01812403          	lw	s0,24(sp)
c000ef44:	01412483          	lw	s1,20(sp)
c000ef48:	01012903          	lw	s2,16(sp)
c000ef4c:	02010113          	addi	sp,sp,32
c000ef50:	00008067          	ret
c000ef54:	00008697          	auipc	a3,0x8
c000ef58:	af068693          	addi	a3,a3,-1296 # c0016a44 <syscalls+0x57c>
c000ef5c:	00005617          	auipc	a2,0x5
c000ef60:	ec060613          	addi	a2,a2,-320 # c0013e1c <commands+0x164>
c000ef64:	07800593          	li	a1,120
c000ef68:	00008517          	auipc	a0,0x8
c000ef6c:	b8c50513          	addi	a0,a0,-1140 # c0016af4 <syscalls+0x62c>
c000ef70:	b54f10ef          	jal	ra,c00002c4 <__panic>
c000ef74:	00008697          	auipc	a3,0x8
c000ef78:	abc68693          	addi	a3,a3,-1348 # c0016a30 <syscalls+0x568>
c000ef7c:	00005617          	auipc	a2,0x5
c000ef80:	ea060613          	addi	a2,a2,-352 # c0013e1c <commands+0x164>
c000ef84:	06e00593          	li	a1,110
c000ef88:	00008517          	auipc	a0,0x8
c000ef8c:	b6c50513          	addi	a0,a0,-1172 # c0016af4 <syscalls+0x62c>
c000ef90:	b34f10ef          	jal	ra,c00002c4 <__panic>

c000ef94 <get_device>:
c000ef94:	fe010113          	addi	sp,sp,-32
c000ef98:	00812c23          	sw	s0,24(sp)
c000ef9c:	00912a23          	sw	s1,20(sp)
c000efa0:	01212823          	sw	s2,16(sp)
c000efa4:	00112e23          	sw	ra,28(sp)
c000efa8:	00054783          	lbu	a5,0(a0)
c000efac:	00050413          	mv	s0,a0
c000efb0:	00058913          	mv	s2,a1
c000efb4:	00060493          	mv	s1,a2
c000efb8:	02078e63          	beqz	a5,c000eff4 <get_device+0x60>
c000efbc:	03a00813          	li	a6,58
c000efc0:	09078663          	beq	a5,a6,c000f04c <get_device+0xb8>
c000efc4:	02f00893          	li	a7,47
c000efc8:	0f178063          	beq	a5,a7,c000f0a8 <get_device+0x114>
c000efcc:	00150693          	addi	a3,a0,1
c000efd0:	00000793          	li	a5,0
c000efd4:	0140006f          	j	c000efe8 <get_device+0x54>
c000efd8:	03070663          	beq	a4,a6,c000f004 <get_device+0x70>
c000efdc:	00168693          	addi	a3,a3,1
c000efe0:	00050793          	mv	a5,a0
c000efe4:	01170863          	beq	a4,a7,c000eff4 <get_device+0x60>
c000efe8:	0006c703          	lbu	a4,0(a3)
c000efec:	00178513          	addi	a0,a5,1
c000eff0:	fe0714e3          	bnez	a4,c000efd8 <get_device+0x44>
c000eff4:	00892023          	sw	s0,0(s2)
c000eff8:	00048513          	mv	a0,s1
c000effc:	c9dff0ef          	jal	ra,c000ec98 <vfs_get_curdir>
c000f000:	0340006f          	j	c000f034 <get_device+0xa0>
c000f004:	00278793          	addi	a5,a5,2
c000f008:	00068023          	sb	zero,0(a3)
c000f00c:	00f407b3          	add	a5,s0,a5
c000f010:	02f00693          	li	a3,47
c000f014:	00078513          	mv	a0,a5
c000f018:	00178793          	addi	a5,a5,1
c000f01c:	fff7c703          	lbu	a4,-1(a5)
c000f020:	fed70ae3          	beq	a4,a3,c000f014 <get_device+0x80>
c000f024:	00a92023          	sw	a0,0(s2)
c000f028:	00048593          	mv	a1,s1
c000f02c:	00040513          	mv	a0,s0
c000f030:	9ddff0ef          	jal	ra,c000ea0c <vfs_get_root>
c000f034:	01c12083          	lw	ra,28(sp)
c000f038:	01812403          	lw	s0,24(sp)
c000f03c:	01412483          	lw	s1,20(sp)
c000f040:	01012903          	lw	s2,16(sp)
c000f044:	02010113          	addi	sp,sp,32
c000f048:	00008067          	ret
c000f04c:	00c10513          	addi	a0,sp,12
c000f050:	c49ff0ef          	jal	ra,c000ec98 <vfs_get_curdir>
c000f054:	fe0510e3          	bnez	a0,c000f034 <get_device+0xa0>
c000f058:	00c12783          	lw	a5,12(sp)
c000f05c:	0387a503          	lw	a0,56(a5)
c000f060:	04050c63          	beqz	a0,c000f0b8 <get_device+0x124>
c000f064:	07452783          	lw	a5,116(a0)
c000f068:	000780e7          	jalr	a5
c000f06c:	00a4a023          	sw	a0,0(s1)
c000f070:	00c12503          	lw	a0,12(sp)
c000f074:	330000ef          	jal	ra,c000f3a4 <inode_ref_dec>
c000f078:	02f00713          	li	a4,47
c000f07c:	00140413          	addi	s0,s0,1
c000f080:	00044783          	lbu	a5,0(s0)
c000f084:	fee78ce3          	beq	a5,a4,c000f07c <get_device+0xe8>
c000f088:	01c12083          	lw	ra,28(sp)
c000f08c:	00892023          	sw	s0,0(s2)
c000f090:	00000513          	li	a0,0
c000f094:	01812403          	lw	s0,24(sp)
c000f098:	01412483          	lw	s1,20(sp)
c000f09c:	01012903          	lw	s2,16(sp)
c000f0a0:	02010113          	addi	sp,sp,32
c000f0a4:	00008067          	ret
c000f0a8:	00060513          	mv	a0,a2
c000f0ac:	041000ef          	jal	ra,c000f8ec <vfs_get_bootfs>
c000f0b0:	fc0504e3          	beqz	a0,c000f078 <get_device+0xe4>
c000f0b4:	f81ff06f          	j	c000f034 <get_device+0xa0>
c000f0b8:	00008697          	auipc	a3,0x8
c000f0bc:	97868693          	addi	a3,a3,-1672 # c0016a30 <syscalls+0x568>
c000f0c0:	00005617          	auipc	a2,0x5
c000f0c4:	d5c60613          	addi	a2,a2,-676 # c0013e1c <commands+0x164>
c000f0c8:	03900593          	li	a1,57
c000f0cc:	00008517          	auipc	a0,0x8
c000f0d0:	a4850513          	addi	a0,a0,-1464 # c0016b14 <syscalls+0x64c>
c000f0d4:	9f0f10ef          	jal	ra,c00002c4 <__panic>

c000f0d8 <vfs_lookup>:
c000f0d8:	fd010113          	addi	sp,sp,-48
c000f0dc:	02912223          	sw	s1,36(sp)
c000f0e0:	01c10613          	addi	a2,sp,28
c000f0e4:	00058493          	mv	s1,a1
c000f0e8:	00c10593          	addi	a1,sp,12
c000f0ec:	02812423          	sw	s0,40(sp)
c000f0f0:	02112623          	sw	ra,44(sp)
c000f0f4:	00a12623          	sw	a0,12(sp)
c000f0f8:	e9dff0ef          	jal	ra,c000ef94 <get_device>
c000f0fc:	00050413          	mv	s0,a0
c000f100:	04051e63          	bnez	a0,c000f15c <vfs_lookup+0x84>
c000f104:	00c12783          	lw	a5,12(sp)
c000f108:	0007c783          	lbu	a5,0(a5)
c000f10c:	06078463          	beqz	a5,c000f174 <vfs_lookup+0x9c>
c000f110:	01c12403          	lw	s0,28(sp)
c000f114:	08040063          	beqz	s0,c000f194 <vfs_lookup+0xbc>
c000f118:	03c42783          	lw	a5,60(s0)
c000f11c:	06078c63          	beqz	a5,c000f194 <vfs_lookup+0xbc>
c000f120:	0387a783          	lw	a5,56(a5)
c000f124:	06078863          	beqz	a5,c000f194 <vfs_lookup+0xbc>
c000f128:	00040513          	mv	a0,s0
c000f12c:	00008597          	auipc	a1,0x8
c000f130:	a5058593          	addi	a1,a1,-1456 # c0016b7c <syscalls+0x6b4>
c000f134:	1a4000ef          	jal	ra,c000f2d8 <inode_check>
c000f138:	03c42783          	lw	a5,60(s0)
c000f13c:	00c12583          	lw	a1,12(sp)
c000f140:	01c12503          	lw	a0,28(sp)
c000f144:	0387a783          	lw	a5,56(a5)
c000f148:	00048613          	mv	a2,s1
c000f14c:	000780e7          	jalr	a5
c000f150:	00050413          	mv	s0,a0
c000f154:	01c12503          	lw	a0,28(sp)
c000f158:	24c000ef          	jal	ra,c000f3a4 <inode_ref_dec>
c000f15c:	02c12083          	lw	ra,44(sp)
c000f160:	00040513          	mv	a0,s0
c000f164:	02412483          	lw	s1,36(sp)
c000f168:	02812403          	lw	s0,40(sp)
c000f16c:	03010113          	addi	sp,sp,48
c000f170:	00008067          	ret
c000f174:	01c12783          	lw	a5,28(sp)
c000f178:	02c12083          	lw	ra,44(sp)
c000f17c:	00040513          	mv	a0,s0
c000f180:	00f4a023          	sw	a5,0(s1)
c000f184:	02812403          	lw	s0,40(sp)
c000f188:	02412483          	lw	s1,36(sp)
c000f18c:	03010113          	addi	sp,sp,48
c000f190:	00008067          	ret
c000f194:	00008697          	auipc	a3,0x8
c000f198:	99868693          	addi	a3,a3,-1640 # c0016b2c <syscalls+0x664>
c000f19c:	00005617          	auipc	a2,0x5
c000f1a0:	c8060613          	addi	a2,a2,-896 # c0013e1c <commands+0x164>
c000f1a4:	04f00593          	li	a1,79
c000f1a8:	00008517          	auipc	a0,0x8
c000f1ac:	96c50513          	addi	a0,a0,-1684 # c0016b14 <syscalls+0x64c>
c000f1b0:	914f10ef          	jal	ra,c00002c4 <__panic>

c000f1b4 <vfs_lookup_parent>:
c000f1b4:	fd010113          	addi	sp,sp,-48
c000f1b8:	02812423          	sw	s0,40(sp)
c000f1bc:	02912223          	sw	s1,36(sp)
c000f1c0:	00058413          	mv	s0,a1
c000f1c4:	00060493          	mv	s1,a2
c000f1c8:	00c10593          	addi	a1,sp,12
c000f1cc:	01c10613          	addi	a2,sp,28
c000f1d0:	02112623          	sw	ra,44(sp)
c000f1d4:	00a12623          	sw	a0,12(sp)
c000f1d8:	dbdff0ef          	jal	ra,c000ef94 <get_device>
c000f1dc:	00051a63          	bnez	a0,c000f1f0 <vfs_lookup_parent+0x3c>
c000f1e0:	00c12783          	lw	a5,12(sp)
c000f1e4:	00f4a023          	sw	a5,0(s1)
c000f1e8:	01c12783          	lw	a5,28(sp)
c000f1ec:	00f42023          	sw	a5,0(s0)
c000f1f0:	02c12083          	lw	ra,44(sp)
c000f1f4:	02812403          	lw	s0,40(sp)
c000f1f8:	02412483          	lw	s1,36(sp)
c000f1fc:	03010113          	addi	sp,sp,48
c000f200:	00008067          	ret

c000f204 <__alloc_inode>:
c000f204:	ff010113          	addi	sp,sp,-16
c000f208:	00812423          	sw	s0,8(sp)
c000f20c:	00050413          	mv	s0,a0
c000f210:	04000513          	li	a0,64
c000f214:	00112623          	sw	ra,12(sp)
c000f218:	bd5f30ef          	jal	ra,c0002dec <kmalloc>
c000f21c:	00050463          	beqz	a0,c000f224 <__alloc_inode+0x20>
c000f220:	02852623          	sw	s0,44(a0)
c000f224:	00c12083          	lw	ra,12(sp)
c000f228:	00812403          	lw	s0,8(sp)
c000f22c:	01010113          	addi	sp,sp,16
c000f230:	00008067          	ret

c000f234 <inode_init>:
c000f234:	00100793          	li	a5,1
c000f238:	02052a23          	sw	zero,52(a0)
c000f23c:	02b52e23          	sw	a1,60(a0)
c000f240:	02c52c23          	sw	a2,56(a0)
c000f244:	02f52823          	sw	a5,48(a0)
c000f248:	00008067          	ret

c000f24c <inode_kill>:
c000f24c:	03052703          	lw	a4,48(a0)
c000f250:	ff010113          	addi	sp,sp,-16
c000f254:	00112623          	sw	ra,12(sp)
c000f258:	00071c63          	bnez	a4,c000f270 <inode_kill+0x24>
c000f25c:	03452783          	lw	a5,52(a0)
c000f260:	02079863          	bnez	a5,c000f290 <inode_kill+0x44>
c000f264:	00c12083          	lw	ra,12(sp)
c000f268:	01010113          	addi	sp,sp,16
c000f26c:	ca1f306f          	j	c0002f0c <kfree>
c000f270:	00008697          	auipc	a3,0x8
c000f274:	9cc68693          	addi	a3,a3,-1588 # c0016c3c <syscalls+0x774>
c000f278:	00005617          	auipc	a2,0x5
c000f27c:	ba460613          	addi	a2,a2,-1116 # c0013e1c <commands+0x164>
c000f280:	02900593          	li	a1,41
c000f284:	00008517          	auipc	a0,0x8
c000f288:	9d450513          	addi	a0,a0,-1580 # c0016c58 <syscalls+0x790>
c000f28c:	838f10ef          	jal	ra,c00002c4 <__panic>
c000f290:	00008697          	auipc	a3,0x8
c000f294:	9dc68693          	addi	a3,a3,-1572 # c0016c6c <syscalls+0x7a4>
c000f298:	00005617          	auipc	a2,0x5
c000f29c:	b8460613          	addi	a2,a2,-1148 # c0013e1c <commands+0x164>
c000f2a0:	02a00593          	li	a1,42
c000f2a4:	00008517          	auipc	a0,0x8
c000f2a8:	9b450513          	addi	a0,a0,-1612 # c0016c58 <syscalls+0x790>
c000f2ac:	818f10ef          	jal	ra,c00002c4 <__panic>

c000f2b0 <inode_ref_inc>:
c000f2b0:	03052783          	lw	a5,48(a0)
c000f2b4:	00178793          	addi	a5,a5,1
c000f2b8:	02f52823          	sw	a5,48(a0)
c000f2bc:	00078513          	mv	a0,a5
c000f2c0:	00008067          	ret

c000f2c4 <inode_open_inc>:
c000f2c4:	03452783          	lw	a5,52(a0)
c000f2c8:	00178793          	addi	a5,a5,1
c000f2cc:	02f52a23          	sw	a5,52(a0)
c000f2d0:	00078513          	mv	a0,a5
c000f2d4:	00008067          	ret

c000f2d8 <inode_check>:
c000f2d8:	ff010113          	addi	sp,sp,-16
c000f2dc:	00112623          	sw	ra,12(sp)
c000f2e0:	04050263          	beqz	a0,c000f324 <inode_check+0x4c>
c000f2e4:	03c52783          	lw	a5,60(a0)
c000f2e8:	02078e63          	beqz	a5,c000f324 <inode_check+0x4c>
c000f2ec:	0007a703          	lw	a4,0(a5)
c000f2f0:	8c4ba7b7          	lui	a5,0x8c4ba
c000f2f4:	47678793          	addi	a5,a5,1142 # 8c4ba476 <sbi_remote_fence_i+0x8c4bab86>
c000f2f8:	08f71663          	bne	a4,a5,c000f384 <inode_check+0xac>
c000f2fc:	03052703          	lw	a4,48(a0)
c000f300:	03452783          	lw	a5,52(a0)
c000f304:	06f74063          	blt	a4,a5,c000f364 <inode_check+0x8c>
c000f308:	0407ce63          	bltz	a5,c000f364 <inode_check+0x8c>
c000f30c:	000106b7          	lui	a3,0x10
c000f310:	02d75a63          	ble	a3,a4,c000f344 <inode_check+0x6c>
c000f314:	02d7d863          	ble	a3,a5,c000f344 <inode_check+0x6c>
c000f318:	00c12083          	lw	ra,12(sp)
c000f31c:	01010113          	addi	sp,sp,16
c000f320:	00008067          	ret
c000f324:	00008697          	auipc	a3,0x8
c000f328:	86068693          	addi	a3,a3,-1952 # c0016b84 <syscalls+0x6bc>
c000f32c:	00005617          	auipc	a2,0x5
c000f330:	af060613          	addi	a2,a2,-1296 # c0013e1c <commands+0x164>
c000f334:	06e00593          	li	a1,110
c000f338:	00008517          	auipc	a0,0x8
c000f33c:	92050513          	addi	a0,a0,-1760 # c0016c58 <syscalls+0x790>
c000f340:	f85f00ef          	jal	ra,c00002c4 <__panic>
c000f344:	00008697          	auipc	a3,0x8
c000f348:	8bc68693          	addi	a3,a3,-1860 # c0016c00 <syscalls+0x738>
c000f34c:	00005617          	auipc	a2,0x5
c000f350:	ad060613          	addi	a2,a2,-1328 # c0013e1c <commands+0x164>
c000f354:	07200593          	li	a1,114
c000f358:	00008517          	auipc	a0,0x8
c000f35c:	90050513          	addi	a0,a0,-1792 # c0016c58 <syscalls+0x790>
c000f360:	f65f00ef          	jal	ra,c00002c4 <__panic>
c000f364:	00008697          	auipc	a3,0x8
c000f368:	87068693          	addi	a3,a3,-1936 # c0016bd4 <syscalls+0x70c>
c000f36c:	00005617          	auipc	a2,0x5
c000f370:	ab060613          	addi	a2,a2,-1360 # c0013e1c <commands+0x164>
c000f374:	07100593          	li	a1,113
c000f378:	00008517          	auipc	a0,0x8
c000f37c:	8e050513          	addi	a0,a0,-1824 # c0016c58 <syscalls+0x790>
c000f380:	f45f00ef          	jal	ra,c00002c4 <__panic>
c000f384:	00008697          	auipc	a3,0x8
c000f388:	82868693          	addi	a3,a3,-2008 # c0016bac <syscalls+0x6e4>
c000f38c:	00005617          	auipc	a2,0x5
c000f390:	a9060613          	addi	a2,a2,-1392 # c0013e1c <commands+0x164>
c000f394:	06f00593          	li	a1,111
c000f398:	00008517          	auipc	a0,0x8
c000f39c:	8c050513          	addi	a0,a0,-1856 # c0016c58 <syscalls+0x790>
c000f3a0:	f25f00ef          	jal	ra,c00002c4 <__panic>

c000f3a4 <inode_ref_dec>:
c000f3a4:	ff010113          	addi	sp,sp,-16
c000f3a8:	00812423          	sw	s0,8(sp)
c000f3ac:	03052403          	lw	s0,48(a0)
c000f3b0:	00112623          	sw	ra,12(sp)
c000f3b4:	00912223          	sw	s1,4(sp)
c000f3b8:	01212023          	sw	s2,0(sp)
c000f3bc:	08805863          	blez	s0,c000f44c <inode_ref_dec+0xa8>
c000f3c0:	fff40413          	addi	s0,s0,-1
c000f3c4:	02852823          	sw	s0,48(a0)
c000f3c8:	00050493          	mv	s1,a0
c000f3cc:	04041263          	bnez	s0,c000f410 <inode_ref_dec+0x6c>
c000f3d0:	03c52783          	lw	a5,60(a0)
c000f3d4:	04078c63          	beqz	a5,c000f42c <inode_ref_dec+0x88>
c000f3d8:	0247a903          	lw	s2,36(a5)
c000f3dc:	04090863          	beqz	s2,c000f42c <inode_ref_dec+0x88>
c000f3e0:	00008597          	auipc	a1,0x8
c000f3e4:	9a858593          	addi	a1,a1,-1624 # c0016d88 <syscalls+0x8c0>
c000f3e8:	ef1ff0ef          	jal	ra,c000f2d8 <inode_check>
c000f3ec:	00048513          	mv	a0,s1
c000f3f0:	000900e7          	jalr	s2
c000f3f4:	00050e63          	beqz	a0,c000f410 <inode_ref_dec+0x6c>
c000f3f8:	ff100793          	li	a5,-15
c000f3fc:	00f50a63          	beq	a0,a5,c000f410 <inode_ref_dec+0x6c>
c000f400:	00050593          	mv	a1,a0
c000f404:	00008517          	auipc	a0,0x8
c000f408:	98c50513          	addi	a0,a0,-1652 # c0016d90 <syscalls+0x8c8>
c000f40c:	d3df00ef          	jal	ra,c0000148 <cprintf>
c000f410:	00c12083          	lw	ra,12(sp)
c000f414:	00040513          	mv	a0,s0
c000f418:	00412483          	lw	s1,4(sp)
c000f41c:	00812403          	lw	s0,8(sp)
c000f420:	00012903          	lw	s2,0(sp)
c000f424:	01010113          	addi	sp,sp,16
c000f428:	00008067          	ret
c000f42c:	00008697          	auipc	a3,0x8
c000f430:	90c68693          	addi	a3,a3,-1780 # c0016d38 <syscalls+0x870>
c000f434:	00005617          	auipc	a2,0x5
c000f438:	9e860613          	addi	a2,a2,-1560 # c0013e1c <commands+0x164>
c000f43c:	04400593          	li	a1,68
c000f440:	00008517          	auipc	a0,0x8
c000f444:	81850513          	addi	a0,a0,-2024 # c0016c58 <syscalls+0x790>
c000f448:	e7df00ef          	jal	ra,c00002c4 <__panic>
c000f44c:	00008697          	auipc	a3,0x8
c000f450:	8d068693          	addi	a3,a3,-1840 # c0016d1c <syscalls+0x854>
c000f454:	00005617          	auipc	a2,0x5
c000f458:	9c860613          	addi	a2,a2,-1592 # c0013e1c <commands+0x164>
c000f45c:	03f00593          	li	a1,63
c000f460:	00007517          	auipc	a0,0x7
c000f464:	7f850513          	addi	a0,a0,2040 # c0016c58 <syscalls+0x790>
c000f468:	e5df00ef          	jal	ra,c00002c4 <__panic>

c000f46c <inode_open_dec>:
c000f46c:	ff010113          	addi	sp,sp,-16
c000f470:	00812423          	sw	s0,8(sp)
c000f474:	03452403          	lw	s0,52(a0)
c000f478:	00112623          	sw	ra,12(sp)
c000f47c:	00912223          	sw	s1,4(sp)
c000f480:	01212023          	sw	s2,0(sp)
c000f484:	0a805263          	blez	s0,c000f528 <inode_open_dec+0xbc>
c000f488:	fff40413          	addi	s0,s0,-1
c000f48c:	02852a23          	sw	s0,52(a0)
c000f490:	00050493          	mv	s1,a0
c000f494:	02041663          	bnez	s0,c000f4c0 <inode_open_dec+0x54>
c000f498:	03c52783          	lw	a5,60(a0)
c000f49c:	06078663          	beqz	a5,c000f508 <inode_open_dec+0x9c>
c000f4a0:	0087a903          	lw	s2,8(a5)
c000f4a4:	06090263          	beqz	s2,c000f508 <inode_open_dec+0x9c>
c000f4a8:	00008597          	auipc	a1,0x8
c000f4ac:	84c58593          	addi	a1,a1,-1972 # c0016cf4 <syscalls+0x82c>
c000f4b0:	e29ff0ef          	jal	ra,c000f2d8 <inode_check>
c000f4b4:	00048513          	mv	a0,s1
c000f4b8:	000900e7          	jalr	s2
c000f4bc:	02051063          	bnez	a0,c000f4dc <inode_open_dec+0x70>
c000f4c0:	00c12083          	lw	ra,12(sp)
c000f4c4:	00040513          	mv	a0,s0
c000f4c8:	00412483          	lw	s1,4(sp)
c000f4cc:	00812403          	lw	s0,8(sp)
c000f4d0:	00012903          	lw	s2,0(sp)
c000f4d4:	01010113          	addi	sp,sp,16
c000f4d8:	00008067          	ret
c000f4dc:	00050593          	mv	a1,a0
c000f4e0:	00008517          	auipc	a0,0x8
c000f4e4:	81c50513          	addi	a0,a0,-2020 # c0016cfc <syscalls+0x834>
c000f4e8:	c61f00ef          	jal	ra,c0000148 <cprintf>
c000f4ec:	00c12083          	lw	ra,12(sp)
c000f4f0:	00040513          	mv	a0,s0
c000f4f4:	00412483          	lw	s1,4(sp)
c000f4f8:	00812403          	lw	s0,8(sp)
c000f4fc:	00012903          	lw	s2,0(sp)
c000f500:	01010113          	addi	sp,sp,16
c000f504:	00008067          	ret
c000f508:	00007697          	auipc	a3,0x7
c000f50c:	79c68693          	addi	a3,a3,1948 # c0016ca4 <syscalls+0x7dc>
c000f510:	00005617          	auipc	a2,0x5
c000f514:	90c60613          	addi	a2,a2,-1780 # c0013e1c <commands+0x164>
c000f518:	06100593          	li	a1,97
c000f51c:	00007517          	auipc	a0,0x7
c000f520:	73c50513          	addi	a0,a0,1852 # c0016c58 <syscalls+0x790>
c000f524:	da1f00ef          	jal	ra,c00002c4 <__panic>
c000f528:	00007697          	auipc	a3,0x7
c000f52c:	76068693          	addi	a3,a3,1888 # c0016c88 <syscalls+0x7c0>
c000f530:	00005617          	auipc	a2,0x5
c000f534:	8ec60613          	addi	a2,a2,-1812 # c0013e1c <commands+0x164>
c000f538:	05c00593          	li	a1,92
c000f53c:	00007517          	auipc	a0,0x7
c000f540:	71c50513          	addi	a0,a0,1820 # c0016c58 <syscalls+0x790>
c000f544:	d81f00ef          	jal	ra,c00002c4 <__panic>

c000f548 <vfs_open>:
c000f548:	fd010113          	addi	sp,sp,-48
c000f54c:	02112623          	sw	ra,44(sp)
c000f550:	02812423          	sw	s0,40(sp)
c000f554:	02912223          	sw	s1,36(sp)
c000f558:	03212023          	sw	s2,32(sp)
c000f55c:	01312e23          	sw	s3,28(sp)
c000f560:	01412c23          	sw	s4,24(sp)
c000f564:	01512a23          	sw	s5,20(sp)
c000f568:	0035f793          	andi	a5,a1,3
c000f56c:	0c078e63          	beqz	a5,c000f648 <vfs_open+0x100>
c000f570:	00200713          	li	a4,2
c000f574:	0cf76e63          	bltu	a4,a5,c000f650 <vfs_open+0x108>
c000f578:	0105fa13          	andi	s4,a1,16
c000f57c:	00058413          	mv	s0,a1
c000f580:	00410593          	addi	a1,sp,4
c000f584:	00060993          	mv	s3,a2
c000f588:	00050913          	mv	s2,a0
c000f58c:	b4dff0ef          	jal	ra,c000f0d8 <vfs_lookup>
c000f590:	00050493          	mv	s1,a0
c000f594:	00447a93          	andi	s5,s0,4
c000f598:	0e051263          	bnez	a0,c000f67c <vfs_open+0x134>
c000f59c:	00c47793          	andi	a5,s0,12
c000f5a0:	00c00713          	li	a4,12
c000f5a4:	16e78463          	beq	a5,a4,c000f70c <vfs_open+0x1c4>
c000f5a8:	00412483          	lw	s1,4(sp)
c000f5ac:	1a048463          	beqz	s1,c000f754 <vfs_open+0x20c>
c000f5b0:	03c4a783          	lw	a5,60(s1)
c000f5b4:	16078063          	beqz	a5,c000f714 <vfs_open+0x1cc>
c000f5b8:	0047a783          	lw	a5,4(a5)
c000f5bc:	14078c63          	beqz	a5,c000f714 <vfs_open+0x1cc>
c000f5c0:	00048513          	mv	a0,s1
c000f5c4:	00008597          	auipc	a1,0x8
c000f5c8:	8bc58593          	addi	a1,a1,-1860 # c0016e80 <syscalls+0x9b8>
c000f5cc:	d0dff0ef          	jal	ra,c000f2d8 <inode_check>
c000f5d0:	03c4a783          	lw	a5,60(s1)
c000f5d4:	00412503          	lw	a0,4(sp)
c000f5d8:	00040593          	mv	a1,s0
c000f5dc:	0047a783          	lw	a5,4(a5)
c000f5e0:	000780e7          	jalr	a5
c000f5e4:	00050493          	mv	s1,a0
c000f5e8:	00412503          	lw	a0,4(sp)
c000f5ec:	10049c63          	bnez	s1,c000f704 <vfs_open+0x1bc>
c000f5f0:	cd5ff0ef          	jal	ra,c000f2c4 <inode_open_inc>
c000f5f4:	0e0a0c63          	beqz	s4,c000f6ec <vfs_open+0x1a4>
c000f5f8:	00412403          	lw	s0,4(sp)
c000f5fc:	12040c63          	beqz	s0,c000f734 <vfs_open+0x1ec>
c000f600:	03c42783          	lw	a5,60(s0)
c000f604:	12078863          	beqz	a5,c000f734 <vfs_open+0x1ec>
c000f608:	0307a783          	lw	a5,48(a5)
c000f60c:	12078463          	beqz	a5,c000f734 <vfs_open+0x1ec>
c000f610:	00008597          	auipc	a1,0x8
c000f614:	8cc58593          	addi	a1,a1,-1844 # c0016edc <syscalls+0xa14>
c000f618:	00040513          	mv	a0,s0
c000f61c:	cbdff0ef          	jal	ra,c000f2d8 <inode_check>
c000f620:	03c42783          	lw	a5,60(s0)
c000f624:	00412503          	lw	a0,4(sp)
c000f628:	00000593          	li	a1,0
c000f62c:	0307a783          	lw	a5,48(a5)
c000f630:	000780e7          	jalr	a5
c000f634:	00050793          	mv	a5,a0
c000f638:	0a051e63          	bnez	a0,c000f6f4 <vfs_open+0x1ac>
c000f63c:	00412783          	lw	a5,4(sp)
c000f640:	00f9a023          	sw	a5,0(s3)
c000f644:	0100006f          	j	c000f654 <vfs_open+0x10c>
c000f648:	0105fa13          	andi	s4,a1,16
c000f64c:	f20a08e3          	beqz	s4,c000f57c <vfs_open+0x34>
c000f650:	ffd00493          	li	s1,-3
c000f654:	02c12083          	lw	ra,44(sp)
c000f658:	00048513          	mv	a0,s1
c000f65c:	02812403          	lw	s0,40(sp)
c000f660:	02412483          	lw	s1,36(sp)
c000f664:	02012903          	lw	s2,32(sp)
c000f668:	01c12983          	lw	s3,28(sp)
c000f66c:	01812a03          	lw	s4,24(sp)
c000f670:	01412a83          	lw	s5,20(sp)
c000f674:	03010113          	addi	sp,sp,48
c000f678:	00008067          	ret
c000f67c:	ff000793          	li	a5,-16
c000f680:	fcf51ae3          	bne	a0,a5,c000f654 <vfs_open+0x10c>
c000f684:	fc0a88e3          	beqz	s5,c000f654 <vfs_open+0x10c>
c000f688:	00810613          	addi	a2,sp,8
c000f68c:	00c10593          	addi	a1,sp,12
c000f690:	00090513          	mv	a0,s2
c000f694:	b21ff0ef          	jal	ra,c000f1b4 <vfs_lookup_parent>
c000f698:	00050493          	mv	s1,a0
c000f69c:	fa051ce3          	bnez	a0,c000f654 <vfs_open+0x10c>
c000f6a0:	00c12483          	lw	s1,12(sp)
c000f6a4:	0c048863          	beqz	s1,c000f774 <vfs_open+0x22c>
c000f6a8:	03c4a783          	lw	a5,60(s1)
c000f6ac:	0c078463          	beqz	a5,c000f774 <vfs_open+0x22c>
c000f6b0:	0347a783          	lw	a5,52(a5)
c000f6b4:	0c078063          	beqz	a5,c000f774 <vfs_open+0x22c>
c000f6b8:	00048513          	mv	a0,s1
c000f6bc:	00007597          	auipc	a1,0x7
c000f6c0:	75c58593          	addi	a1,a1,1884 # c0016e18 <syscalls+0x950>
c000f6c4:	c15ff0ef          	jal	ra,c000f2d8 <inode_check>
c000f6c8:	03c4a783          	lw	a5,60(s1)
c000f6cc:	00812583          	lw	a1,8(sp)
c000f6d0:	00c12503          	lw	a0,12(sp)
c000f6d4:	0347a783          	lw	a5,52(a5)
c000f6d8:	00345613          	srli	a2,s0,0x3
c000f6dc:	00410693          	addi	a3,sp,4
c000f6e0:	00167613          	andi	a2,a2,1
c000f6e4:	000780e7          	jalr	a5
c000f6e8:	ec1ff06f          	j	c000f5a8 <vfs_open+0x60>
c000f6ec:	f40a88e3          	beqz	s5,c000f63c <vfs_open+0xf4>
c000f6f0:	f09ff06f          	j	c000f5f8 <vfs_open+0xb0>
c000f6f4:	00412503          	lw	a0,4(sp)
c000f6f8:	00078493          	mv	s1,a5
c000f6fc:	d71ff0ef          	jal	ra,c000f46c <inode_open_dec>
c000f700:	00412503          	lw	a0,4(sp)
c000f704:	ca1ff0ef          	jal	ra,c000f3a4 <inode_ref_dec>
c000f708:	f4dff06f          	j	c000f654 <vfs_open+0x10c>
c000f70c:	fe900493          	li	s1,-23
c000f710:	f45ff06f          	j	c000f654 <vfs_open+0x10c>
c000f714:	00007697          	auipc	a3,0x7
c000f718:	71c68693          	addi	a3,a3,1820 # c0016e30 <syscalls+0x968>
c000f71c:	00004617          	auipc	a2,0x4
c000f720:	70060613          	addi	a2,a2,1792 # c0013e1c <commands+0x164>
c000f724:	03300593          	li	a1,51
c000f728:	00007517          	auipc	a0,0x7
c000f72c:	6d850513          	addi	a0,a0,1752 # c0016e00 <syscalls+0x938>
c000f730:	b95f00ef          	jal	ra,c00002c4 <__panic>
c000f734:	00007697          	auipc	a3,0x7
c000f738:	75468693          	addi	a3,a3,1876 # c0016e88 <syscalls+0x9c0>
c000f73c:	00004617          	auipc	a2,0x4
c000f740:	6e060613          	addi	a2,a2,1760 # c0013e1c <commands+0x164>
c000f744:	03a00593          	li	a1,58
c000f748:	00007517          	auipc	a0,0x7
c000f74c:	6b850513          	addi	a0,a0,1720 # c0016e00 <syscalls+0x938>
c000f750:	b75f00ef          	jal	ra,c00002c4 <__panic>
c000f754:	00007697          	auipc	a3,0x7
c000f758:	6cc68693          	addi	a3,a3,1740 # c0016e20 <syscalls+0x958>
c000f75c:	00004617          	auipc	a2,0x4
c000f760:	6c060613          	addi	a2,a2,1728 # c0013e1c <commands+0x164>
c000f764:	03100593          	li	a1,49
c000f768:	00007517          	auipc	a0,0x7
c000f76c:	69850513          	addi	a0,a0,1688 # c0016e00 <syscalls+0x938>
c000f770:	b55f00ef          	jal	ra,c00002c4 <__panic>
c000f774:	00007697          	auipc	a3,0x7
c000f778:	63c68693          	addi	a3,a3,1596 # c0016db0 <syscalls+0x8e8>
c000f77c:	00004617          	auipc	a2,0x4
c000f780:	6a060613          	addi	a2,a2,1696 # c0013e1c <commands+0x164>
c000f784:	02c00593          	li	a1,44
c000f788:	00007517          	auipc	a0,0x7
c000f78c:	67850513          	addi	a0,a0,1656 # c0016e00 <syscalls+0x938>
c000f790:	b35f00ef          	jal	ra,c00002c4 <__panic>

c000f794 <vfs_close>:
c000f794:	ff010113          	addi	sp,sp,-16
c000f798:	00112623          	sw	ra,12(sp)
c000f79c:	00812423          	sw	s0,8(sp)
c000f7a0:	00050413          	mv	s0,a0
c000f7a4:	cc9ff0ef          	jal	ra,c000f46c <inode_open_dec>
c000f7a8:	00040513          	mv	a0,s0
c000f7ac:	bf9ff0ef          	jal	ra,c000f3a4 <inode_ref_dec>
c000f7b0:	00c12083          	lw	ra,12(sp)
c000f7b4:	00000513          	li	a0,0
c000f7b8:	00812403          	lw	s0,8(sp)
c000f7bc:	01010113          	addi	sp,sp,16
c000f7c0:	00008067          	ret

c000f7c4 <__alloc_fs>:
c000f7c4:	ff010113          	addi	sp,sp,-16
c000f7c8:	00812423          	sw	s0,8(sp)
c000f7cc:	00050413          	mv	s0,a0
c000f7d0:	08000513          	li	a0,128
c000f7d4:	00112623          	sw	ra,12(sp)
c000f7d8:	e14f30ef          	jal	ra,c0002dec <kmalloc>
c000f7dc:	00050463          	beqz	a0,c000f7e4 <__alloc_fs+0x20>
c000f7e0:	06852623          	sw	s0,108(a0)
c000f7e4:	00c12083          	lw	ra,12(sp)
c000f7e8:	00812403          	lw	s0,8(sp)
c000f7ec:	01010113          	addi	sp,sp,16
c000f7f0:	00008067          	ret

c000f7f4 <vfs_init>:
c000f7f4:	ff010113          	addi	sp,sp,-16
c000f7f8:	00100593          	li	a1,1
c000f7fc:	0008a517          	auipc	a0,0x8a
c000f800:	f6c50513          	addi	a0,a0,-148 # c0099768 <bootfs_sem>
c000f804:	00112623          	sw	ra,12(sp)
c000f808:	9e8f70ef          	jal	ra,c00069f0 <sem_init>
c000f80c:	00c12083          	lw	ra,12(sp)
c000f810:	01010113          	addi	sp,sp,16
c000f814:	950ff06f          	j	c000e964 <vfs_devlist_init>

c000f818 <vfs_set_bootfs>:
c000f818:	fe010113          	addi	sp,sp,-32
c000f81c:	00112e23          	sw	ra,28(sp)
c000f820:	00812c23          	sw	s0,24(sp)
c000f824:	00912a23          	sw	s1,20(sp)
c000f828:	01212823          	sw	s2,16(sp)
c000f82c:	00012623          	sw	zero,12(sp)
c000f830:	0a050a63          	beqz	a0,c000f8e4 <vfs_set_bootfs+0xcc>
c000f834:	03a00593          	li	a1,58
c000f838:	00050493          	mv	s1,a0
c000f83c:	351030ef          	jal	ra,c001338c <strchr>
c000f840:	ffd00413          	li	s0,-3
c000f844:	00050e63          	beqz	a0,c000f860 <vfs_set_bootfs+0x48>
c000f848:	00154783          	lbu	a5,1(a0)
c000f84c:	00079a63          	bnez	a5,c000f860 <vfs_set_bootfs+0x48>
c000f850:	00048513          	mv	a0,s1
c000f854:	dacff0ef          	jal	ra,c000ee00 <vfs_chdir>
c000f858:	00050413          	mv	s0,a0
c000f85c:	02050063          	beqz	a0,c000f87c <vfs_set_bootfs+0x64>
c000f860:	01c12083          	lw	ra,28(sp)
c000f864:	00040513          	mv	a0,s0
c000f868:	01412483          	lw	s1,20(sp)
c000f86c:	01812403          	lw	s0,24(sp)
c000f870:	01012903          	lw	s2,16(sp)
c000f874:	02010113          	addi	sp,sp,32
c000f878:	00008067          	ret
c000f87c:	00c10513          	addi	a0,sp,12
c000f880:	c18ff0ef          	jal	ra,c000ec98 <vfs_get_curdir>
c000f884:	00050413          	mv	s0,a0
c000f888:	fc051ce3          	bnez	a0,c000f860 <vfs_set_bootfs+0x48>
c000f88c:	00c12903          	lw	s2,12(sp)
c000f890:	0008a517          	auipc	a0,0x8a
c000f894:	ed850513          	addi	a0,a0,-296 # c0099768 <bootfs_sem>
c000f898:	968f70ef          	jal	ra,c0006a00 <down>
c000f89c:	0008a517          	auipc	a0,0x8a
c000f8a0:	ecc50513          	addi	a0,a0,-308 # c0099768 <bootfs_sem>
c000f8a4:	0008b497          	auipc	s1,0x8b
c000f8a8:	f304a483          	lw	s1,-208(s1) # c009a7d4 <bootfs_node>
c000f8ac:	00000413          	li	s0,0
c000f8b0:	0008b297          	auipc	t0,0x8b
c000f8b4:	f322a223          	sw	s2,-220(t0) # c009a7d4 <bootfs_node>
c000f8b8:	944f70ef          	jal	ra,c00069fc <up>
c000f8bc:	fa0482e3          	beqz	s1,c000f860 <vfs_set_bootfs+0x48>
c000f8c0:	00048513          	mv	a0,s1
c000f8c4:	ae1ff0ef          	jal	ra,c000f3a4 <inode_ref_dec>
c000f8c8:	01c12083          	lw	ra,28(sp)
c000f8cc:	00040513          	mv	a0,s0
c000f8d0:	01412483          	lw	s1,20(sp)
c000f8d4:	01812403          	lw	s0,24(sp)
c000f8d8:	01012903          	lw	s2,16(sp)
c000f8dc:	02010113          	addi	sp,sp,32
c000f8e0:	00008067          	ret
c000f8e4:	00000913          	li	s2,0
c000f8e8:	fa9ff06f          	j	c000f890 <vfs_set_bootfs+0x78>

c000f8ec <vfs_get_bootfs>:
c000f8ec:	0008b797          	auipc	a5,0x8b
c000f8f0:	ee87a783          	lw	a5,-280(a5) # c009a7d4 <bootfs_node>
c000f8f4:	08078263          	beqz	a5,c000f978 <vfs_get_bootfs+0x8c>
c000f8f8:	ff010113          	addi	sp,sp,-16
c000f8fc:	00812423          	sw	s0,8(sp)
c000f900:	00050413          	mv	s0,a0
c000f904:	0008a517          	auipc	a0,0x8a
c000f908:	e6450513          	addi	a0,a0,-412 # c0099768 <bootfs_sem>
c000f90c:	00912223          	sw	s1,4(sp)
c000f910:	00112623          	sw	ra,12(sp)
c000f914:	8ecf70ef          	jal	ra,c0006a00 <down>
c000f918:	0008b497          	auipc	s1,0x8b
c000f91c:	ebc4a483          	lw	s1,-324(s1) # c009a7d4 <bootfs_node>
c000f920:	02048a63          	beqz	s1,c000f954 <vfs_get_bootfs+0x68>
c000f924:	00048513          	mv	a0,s1
c000f928:	989ff0ef          	jal	ra,c000f2b0 <inode_ref_inc>
c000f92c:	0008a517          	auipc	a0,0x8a
c000f930:	e3c50513          	addi	a0,a0,-452 # c0099768 <bootfs_sem>
c000f934:	8c8f70ef          	jal	ra,c00069fc <up>
c000f938:	00c12083          	lw	ra,12(sp)
c000f93c:	00942023          	sw	s1,0(s0)
c000f940:	00000513          	li	a0,0
c000f944:	00812403          	lw	s0,8(sp)
c000f948:	00412483          	lw	s1,4(sp)
c000f94c:	01010113          	addi	sp,sp,16
c000f950:	00008067          	ret
c000f954:	0008a517          	auipc	a0,0x8a
c000f958:	e1450513          	addi	a0,a0,-492 # c0099768 <bootfs_sem>
c000f95c:	8a0f70ef          	jal	ra,c00069fc <up>
c000f960:	00c12083          	lw	ra,12(sp)
c000f964:	ff000513          	li	a0,-16
c000f968:	00812403          	lw	s0,8(sp)
c000f96c:	00412483          	lw	s1,4(sp)
c000f970:	01010113          	addi	sp,sp,16
c000f974:	00008067          	ret
c000f978:	ff000513          	li	a0,-16
c000f97c:	00008067          	ret

c000f980 <stdin_open>:
c000f980:	ffd00513          	li	a0,-3
c000f984:	00059463          	bnez	a1,c000f98c <stdin_open+0xc>
c000f988:	00000513          	li	a0,0
c000f98c:	00008067          	ret

c000f990 <stdin_close>:
c000f990:	00000513          	li	a0,0
c000f994:	00008067          	ret

c000f998 <stdin_ioctl>:
c000f998:	ffd00513          	li	a0,-3
c000f99c:	00008067          	ret

c000f9a0 <stdin_io>:
c000f9a0:	fb010113          	addi	sp,sp,-80
c000f9a4:	03312e23          	sw	s3,60(sp)
c000f9a8:	04112623          	sw	ra,76(sp)
c000f9ac:	04812423          	sw	s0,72(sp)
c000f9b0:	04912223          	sw	s1,68(sp)
c000f9b4:	05212023          	sw	s2,64(sp)
c000f9b8:	03412c23          	sw	s4,56(sp)
c000f9bc:	03512a23          	sw	s5,52(sp)
c000f9c0:	03612823          	sw	s6,48(sp)
c000f9c4:	03712623          	sw	s7,44(sp)
c000f9c8:	03812423          	sw	s8,40(sp)
c000f9cc:	03912223          	sw	s9,36(sp)
c000f9d0:	ffd00993          	li	s3,-3
c000f9d4:	10061663          	bnez	a2,c000fae0 <stdin_io+0x140>
c000f9d8:	00058a93          	mv	s5,a1
c000f9dc:	0005ab83          	lw	s7,0(a1)
c000f9e0:	00c5ab03          	lw	s6,12(a1)
c000f9e4:	100027f3          	csrr	a5,sstatus
c000f9e8:	0027f793          	andi	a5,a5,2
c000f9ec:	16079e63          	bnez	a5,c000fb68 <stdin_io+0x1c8>
c000f9f0:	00000413          	li	s0,0
c000f9f4:	00000993          	li	s3,0
c000f9f8:	0e0b0463          	beqz	s6,c000fae0 <stdin_io+0x140>
c000f9fc:	800004b7          	lui	s1,0x80000
c000fa00:	00001c37          	lui	s8,0x1
c000fa04:	0008b797          	auipc	a5,0x8b
c000fa08:	ddc7a783          	lw	a5,-548(a5) # c009a7e0 <p_rpos>
c000fa0c:	000b0c93          	mv	s9,s6
c000fa10:	00000993          	li	s3,0
c000fa14:	0008b717          	auipc	a4,0x8b
c000fa18:	dd072703          	lw	a4,-560(a4) # c009a7e4 <p_wpos>
c000fa1c:	00448493          	addi	s1,s1,4 # 80000004 <sbi_remote_fence_i+0x80000714>
c000fa20:	0008b917          	auipc	s2,0x8b
c000fa24:	db890913          	addi	s2,s2,-584 # c009a7d8 <__wait_queue>
c000fa28:	00100a13          	li	s4,1
c000fa2c:	fffc0c13          	addi	s8,s8,-1 # fff <_binary_bin_swap_img_size-0x6d01>
c000fa30:	00098b13          	mv	s6,s3
c000fa34:	04e7d263          	ble	a4,a5,c000fa78 <stdin_io+0xd8>
c000fa38:	0e00006f          	j	c000fb18 <stdin_io+0x178>
c000fa3c:	a8dfa0ef          	jal	ra,c000a4c8 <schedule>
c000fa40:	100027f3          	csrr	a5,sstatus
c000fa44:	0027f793          	andi	a5,a5,2
c000fa48:	00000413          	li	s0,0
c000fa4c:	04079c63          	bnez	a5,c000faa4 <stdin_io+0x104>
c000fa50:	00c10513          	addi	a0,sp,12
c000fa54:	c19f60ef          	jal	ra,c000666c <wait_in_queue>
c000fa58:	06051063          	bnez	a0,c000fab8 <stdin_io+0x118>
c000fa5c:	01012783          	lw	a5,16(sp)
c000fa60:	06979663          	bne	a5,s1,c000facc <stdin_io+0x12c>
c000fa64:	0008b797          	auipc	a5,0x8b
c000fa68:	d7c7a783          	lw	a5,-644(a5) # c009a7e0 <p_rpos>
c000fa6c:	0008b717          	auipc	a4,0x8b
c000fa70:	d7872703          	lw	a4,-648(a4) # c009a7e4 <p_wpos>
c000fa74:	0ae7c263          	blt	a5,a4,c000fb18 <stdin_io+0x178>
c000fa78:	00048613          	mv	a2,s1
c000fa7c:	00c10593          	addi	a1,sp,12
c000fa80:	00090513          	mv	a0,s2
c000fa84:	d09f60ef          	jal	ra,c000678c <wait_current_set>
c000fa88:	fa040ae3          	beqz	s0,c000fa3c <stdin_io+0x9c>
c000fa8c:	b2cf10ef          	jal	ra,c0000db8 <intr_enable>
c000fa90:	a39fa0ef          	jal	ra,c000a4c8 <schedule>
c000fa94:	100027f3          	csrr	a5,sstatus
c000fa98:	0027f793          	andi	a5,a5,2
c000fa9c:	00000413          	li	s0,0
c000faa0:	fa0788e3          	beqz	a5,c000fa50 <stdin_io+0xb0>
c000faa4:	b1cf10ef          	jal	ra,c0000dc0 <intr_disable>
c000faa8:	00c10513          	addi	a0,sp,12
c000faac:	000a0413          	mv	s0,s4
c000fab0:	bbdf60ef          	jal	ra,c000666c <wait_in_queue>
c000fab4:	fa0504e3          	beqz	a0,c000fa5c <stdin_io+0xbc>
c000fab8:	00c10593          	addi	a1,sp,12
c000fabc:	00090513          	mv	a0,s2
c000fac0:	b4df60ef          	jal	ra,c000660c <wait_queue_del>
c000fac4:	01012783          	lw	a5,16(sp)
c000fac8:	f8978ee3          	beq	a5,s1,c000fa64 <stdin_io+0xc4>
c000facc:	08041a63          	bnez	s0,c000fb60 <stdin_io+0x1c0>
c000fad0:	00098863          	beqz	s3,c000fae0 <stdin_io+0x140>
c000fad4:	00caa783          	lw	a5,12(s5)
c000fad8:	41678b33          	sub	s6,a5,s6
c000fadc:	016aa623          	sw	s6,12(s5)
c000fae0:	04c12083          	lw	ra,76(sp)
c000fae4:	00098513          	mv	a0,s3
c000fae8:	04812403          	lw	s0,72(sp)
c000faec:	04412483          	lw	s1,68(sp)
c000faf0:	04012903          	lw	s2,64(sp)
c000faf4:	03c12983          	lw	s3,60(sp)
c000faf8:	03812a03          	lw	s4,56(sp)
c000fafc:	03412a83          	lw	s5,52(sp)
c000fb00:	03012b03          	lw	s6,48(sp)
c000fb04:	02c12b83          	lw	s7,44(sp)
c000fb08:	02812c03          	lw	s8,40(sp)
c000fb0c:	02412c83          	lw	s9,36(sp)
c000fb10:	05010113          	addi	sp,sp,80
c000fb14:	00008067          	ret
c000fb18:	41f7d693          	srai	a3,a5,0x1f
c000fb1c:	0146d613          	srli	a2,a3,0x14
c000fb20:	00c786b3          	add	a3,a5,a2
c000fb24:	0186f6b3          	and	a3,a3,s8
c000fb28:	40c686b3          	sub	a3,a3,a2
c000fb2c:	0008a617          	auipc	a2,0x8a
c000fb30:	c4860613          	addi	a2,a2,-952 # c0099774 <stdin_buffer>
c000fb34:	00d606b3          	add	a3,a2,a3
c000fb38:	0006c683          	lbu	a3,0(a3)
c000fb3c:	001b8b93          	addi	s7,s7,1
c000fb40:	00178793          	addi	a5,a5,1
c000fb44:	00198993          	addi	s3,s3,1
c000fb48:	fedb8fa3          	sb	a3,-1(s7)
c000fb4c:	0008b297          	auipc	t0,0x8b
c000fb50:	c8f2aa23          	sw	a5,-876(t0) # c009a7e0 <p_rpos>
c000fb54:	00098b13          	mv	s6,s3
c000fb58:	ed999ce3          	bne	s3,s9,c000fa30 <stdin_io+0x90>
c000fb5c:	f6040ce3          	beqz	s0,c000fad4 <stdin_io+0x134>
c000fb60:	a58f10ef          	jal	ra,c0000db8 <intr_enable>
c000fb64:	f6dff06f          	j	c000fad0 <stdin_io+0x130>
c000fb68:	a58f10ef          	jal	ra,c0000dc0 <intr_disable>
c000fb6c:	00100413          	li	s0,1
c000fb70:	00000993          	li	s3,0
c000fb74:	e80b14e3          	bnez	s6,c000f9fc <stdin_io+0x5c>
c000fb78:	fe9ff06f          	j	c000fb60 <stdin_io+0x1c0>

c000fb7c <dev_stdin_write>:
c000fb7c:	0a050063          	beqz	a0,c000fc1c <dev_stdin_write+0xa0>
c000fb80:	ff010113          	addi	sp,sp,-16
c000fb84:	00812423          	sw	s0,8(sp)
c000fb88:	00112623          	sw	ra,12(sp)
c000fb8c:	00912223          	sw	s1,4(sp)
c000fb90:	00050413          	mv	s0,a0
c000fb94:	100027f3          	csrr	a5,sstatus
c000fb98:	0027f793          	andi	a5,a5,2
c000fb9c:	00000493          	li	s1,0
c000fba0:	08079a63          	bnez	a5,c000fc34 <dev_stdin_write+0xb8>
c000fba4:	0008b717          	auipc	a4,0x8b
c000fba8:	c4072703          	lw	a4,-960(a4) # c009a7e4 <p_wpos>
c000fbac:	41f75793          	srai	a5,a4,0x1f
c000fbb0:	0147d693          	srli	a3,a5,0x14
c000fbb4:	00001637          	lui	a2,0x1
c000fbb8:	00d707b3          	add	a5,a4,a3
c000fbbc:	fff60593          	addi	a1,a2,-1 # fff <_binary_bin_swap_img_size-0x6d01>
c000fbc0:	00b7f7b3          	and	a5,a5,a1
c000fbc4:	40d787b3          	sub	a5,a5,a3
c000fbc8:	0008a697          	auipc	a3,0x8a
c000fbcc:	bac68693          	addi	a3,a3,-1108 # c0099774 <stdin_buffer>
c000fbd0:	00f687b3          	add	a5,a3,a5
c000fbd4:	00878023          	sb	s0,0(a5)
c000fbd8:	0008b797          	auipc	a5,0x8b
c000fbdc:	c087a783          	lw	a5,-1016(a5) # c009a7e0 <p_rpos>
c000fbe0:	40f707b3          	sub	a5,a4,a5
c000fbe4:	00c7da63          	ble	a2,a5,c000fbf8 <dev_stdin_write+0x7c>
c000fbe8:	00170713          	addi	a4,a4,1
c000fbec:	0008b797          	auipc	a5,0x8b
c000fbf0:	bf878793          	addi	a5,a5,-1032 # c009a7e4 <p_wpos>
c000fbf4:	00e7a023          	sw	a4,0(a5)
c000fbf8:	0008b517          	auipc	a0,0x8b
c000fbfc:	be050513          	addi	a0,a0,-1056 # c009a7d8 <__wait_queue>
c000fc00:	a5df60ef          	jal	ra,c000665c <wait_queue_empty>
c000fc04:	02050e63          	beqz	a0,c000fc40 <dev_stdin_write+0xc4>
c000fc08:	00049c63          	bnez	s1,c000fc20 <dev_stdin_write+0xa4>
c000fc0c:	00c12083          	lw	ra,12(sp)
c000fc10:	00812403          	lw	s0,8(sp)
c000fc14:	00412483          	lw	s1,4(sp)
c000fc18:	01010113          	addi	sp,sp,16
c000fc1c:	00008067          	ret
c000fc20:	00c12083          	lw	ra,12(sp)
c000fc24:	00812403          	lw	s0,8(sp)
c000fc28:	00412483          	lw	s1,4(sp)
c000fc2c:	01010113          	addi	sp,sp,16
c000fc30:	988f106f          	j	c0000db8 <intr_enable>
c000fc34:	98cf10ef          	jal	ra,c0000dc0 <intr_disable>
c000fc38:	00100493          	li	s1,1
c000fc3c:	f69ff06f          	j	c000fba4 <dev_stdin_write+0x28>
c000fc40:	800005b7          	lui	a1,0x80000
c000fc44:	00100613          	li	a2,1
c000fc48:	00458593          	addi	a1,a1,4 # 80000004 <sbi_remote_fence_i+0x80000714>
c000fc4c:	0008b517          	auipc	a0,0x8b
c000fc50:	b8c50513          	addi	a0,a0,-1140 # c009a7d8 <__wait_queue>
c000fc54:	a71f60ef          	jal	ra,c00066c4 <wakeup_queue>
c000fc58:	fa048ae3          	beqz	s1,c000fc0c <dev_stdin_write+0x90>
c000fc5c:	fc5ff06f          	j	c000fc20 <dev_stdin_write+0xa4>

c000fc60 <dev_init_stdin>:
c000fc60:	ff010113          	addi	sp,sp,-16
c000fc64:	00112623          	sw	ra,12(sp)
c000fc68:	00812423          	sw	s0,8(sp)
c000fc6c:	191000ef          	jal	ra,c00105fc <dev_create_inode>
c000fc70:	08050c63          	beqz	a0,c000fd08 <dev_init_stdin+0xa8>
c000fc74:	02c52703          	lw	a4,44(a0)
c000fc78:	000017b7          	lui	a5,0x1
c000fc7c:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
c000fc80:	00050413          	mv	s0,a0
c000fc84:	0af71c63          	bne	a4,a5,c000fd3c <dev_init_stdin+0xdc>
c000fc88:	00100793          	li	a5,1
c000fc8c:	00f42223          	sw	a5,4(s0)
c000fc90:	00000797          	auipc	a5,0x0
c000fc94:	cf078793          	addi	a5,a5,-784 # c000f980 <stdin_open>
c000fc98:	00f42423          	sw	a5,8(s0)
c000fc9c:	00000797          	auipc	a5,0x0
c000fca0:	cf478793          	addi	a5,a5,-780 # c000f990 <stdin_close>
c000fca4:	00f42623          	sw	a5,12(s0)
c000fca8:	00000797          	auipc	a5,0x0
c000fcac:	cf878793          	addi	a5,a5,-776 # c000f9a0 <stdin_io>
c000fcb0:	00f42823          	sw	a5,16(s0)
c000fcb4:	00000797          	auipc	a5,0x0
c000fcb8:	ce478793          	addi	a5,a5,-796 # c000f998 <stdin_ioctl>
c000fcbc:	0008b517          	auipc	a0,0x8b
c000fcc0:	b1c50513          	addi	a0,a0,-1252 # c009a7d8 <__wait_queue>
c000fcc4:	00042023          	sw	zero,0(s0)
c000fcc8:	00f42a23          	sw	a5,20(s0)
c000fccc:	0008b297          	auipc	t0,0x8b
c000fcd0:	b002ac23          	sw	zero,-1256(t0) # c009a7e4 <p_wpos>
c000fcd4:	0008b297          	auipc	t0,0x8b
c000fcd8:	b002a623          	sw	zero,-1268(t0) # c009a7e0 <p_rpos>
c000fcdc:	925f60ef          	jal	ra,c0006600 <wait_queue_init>
c000fce0:	00000613          	li	a2,0
c000fce4:	00040593          	mv	a1,s0
c000fce8:	00007517          	auipc	a0,0x7
c000fcec:	23850513          	addi	a0,a0,568 # c0016f20 <syscalls+0xa58>
c000fcf0:	e79fe0ef          	jal	ra,c000eb68 <vfs_add_dev>
c000fcf4:	02051663          	bnez	a0,c000fd20 <dev_init_stdin+0xc0>
c000fcf8:	00c12083          	lw	ra,12(sp)
c000fcfc:	00812403          	lw	s0,8(sp)
c000fd00:	01010113          	addi	sp,sp,16
c000fd04:	00008067          	ret
c000fd08:	00007617          	auipc	a2,0x7
c000fd0c:	1e060613          	addi	a2,a2,480 # c0016ee8 <syscalls+0xa20>
c000fd10:	07500593          	li	a1,117
c000fd14:	00007517          	auipc	a0,0x7
c000fd18:	1f050513          	addi	a0,a0,496 # c0016f04 <syscalls+0xa3c>
c000fd1c:	da8f00ef          	jal	ra,c00002c4 <__panic>
c000fd20:	00050693          	mv	a3,a0
c000fd24:	00007617          	auipc	a2,0x7
c000fd28:	20460613          	addi	a2,a2,516 # c0016f28 <syscalls+0xa60>
c000fd2c:	07b00593          	li	a1,123
c000fd30:	00007517          	auipc	a0,0x7
c000fd34:	1d450513          	addi	a0,a0,468 # c0016f04 <syscalls+0xa3c>
c000fd38:	d8cf00ef          	jal	ra,c00002c4 <__panic>
c000fd3c:	00007697          	auipc	a3,0x7
c000fd40:	c9c68693          	addi	a3,a3,-868 # c00169d8 <syscalls+0x510>
c000fd44:	00004617          	auipc	a2,0x4
c000fd48:	0d860613          	addi	a2,a2,216 # c0013e1c <commands+0x164>
c000fd4c:	07700593          	li	a1,119
c000fd50:	00007517          	auipc	a0,0x7
c000fd54:	1b450513          	addi	a0,a0,436 # c0016f04 <syscalls+0xa3c>
c000fd58:	d6cf00ef          	jal	ra,c00002c4 <__panic>

c000fd5c <disk0_open>:
c000fd5c:	00000513          	li	a0,0
c000fd60:	00008067          	ret

c000fd64 <disk0_close>:
c000fd64:	00000513          	li	a0,0
c000fd68:	00008067          	ret

c000fd6c <disk0_ioctl>:
c000fd6c:	fec00513          	li	a0,-20
c000fd70:	00008067          	ret

c000fd74 <disk0_io>:
c000fd74:	0045a783          	lw	a5,4(a1)
c000fd78:	fb010113          	addi	sp,sp,-80
c000fd7c:	03512a23          	sw	s5,52(sp)
c000fd80:	00001ab7          	lui	s5,0x1
c000fd84:	fffa8a93          	addi	s5,s5,-1 # fff <_binary_bin_swap_img_size-0x6d01>
c000fd88:	03312e23          	sw	s3,60(sp)
c000fd8c:	41f7d993          	srai	s3,a5,0x1f
c000fd90:	0159f9b3          	and	s3,s3,s5
c000fd94:	04812423          	sw	s0,72(sp)
c000fd98:	00f989b3          	add	s3,s3,a5
c000fd9c:	04112623          	sw	ra,76(sp)
c000fda0:	04912223          	sw	s1,68(sp)
c000fda4:	05212023          	sw	s2,64(sp)
c000fda8:	03412c23          	sw	s4,56(sp)
c000fdac:	03612823          	sw	s6,48(sp)
c000fdb0:	03712623          	sw	s7,44(sp)
c000fdb4:	03812423          	sw	s8,40(sp)
c000fdb8:	03912223          	sw	s9,36(sp)
c000fdbc:	03a12023          	sw	s10,32(sp)
c000fdc0:	01b12e23          	sw	s11,28(sp)
c000fdc4:	0157f7b3          	and	a5,a5,s5
c000fdc8:	00c5a403          	lw	s0,12(a1)
c000fdcc:	16079863          	bnez	a5,c000ff3c <disk0_io+0x1c8>
c000fdd0:	015477b3          	and	a5,s0,s5
c000fdd4:	16079463          	bnez	a5,c000ff3c <disk0_io+0x1c8>
c000fdd8:	00052783          	lw	a5,0(a0)
c000fddc:	40c9d993          	srai	s3,s3,0xc
c000fde0:	00c45713          	srli	a4,s0,0xc
c000fde4:	00e986b3          	add	a3,s3,a4
c000fde8:	14d7ea63          	bltu	a5,a3,c000ff3c <disk0_io+0x1c8>
c000fdec:	00000513          	li	a0,0
c000fdf0:	04071063          	bnez	a4,c000fe30 <disk0_io+0xbc>
c000fdf4:	04c12083          	lw	ra,76(sp)
c000fdf8:	04812403          	lw	s0,72(sp)
c000fdfc:	04412483          	lw	s1,68(sp)
c000fe00:	04012903          	lw	s2,64(sp)
c000fe04:	03c12983          	lw	s3,60(sp)
c000fe08:	03812a03          	lw	s4,56(sp)
c000fe0c:	03412a83          	lw	s5,52(sp)
c000fe10:	03012b03          	lw	s6,48(sp)
c000fe14:	02c12b83          	lw	s7,44(sp)
c000fe18:	02812c03          	lw	s8,40(sp)
c000fe1c:	02412c83          	lw	s9,36(sp)
c000fe20:	02012d03          	lw	s10,32(sp)
c000fe24:	01c12d83          	lw	s11,28(sp)
c000fe28:	05010113          	addi	sp,sp,80
c000fe2c:	00008067          	ret
c000fe30:	0008b517          	auipc	a0,0x8b
c000fe34:	94450513          	addi	a0,a0,-1724 # c009a774 <disk0_sem>
c000fe38:	00060b93          	mv	s7,a2
c000fe3c:	00058b13          	mv	s6,a1
c000fe40:	00004a37          	lui	s4,0x4
c000fe44:	bbdf60ef          	jal	ra,c0006a00 <down>
c000fe48:	02000d93          	li	s11,32
c000fe4c:	00200c13          	li	s8,2
c000fe50:	080b9663          	bnez	s7,c000fedc <disk0_io+0x168>
c000fe54:	000d8d13          	mv	s10,s11
c000fe58:	00400913          	li	s2,4
c000fe5c:	000a0493          	mv	s1,s4
c000fe60:	01447863          	bleu	s4,s0,c000fe70 <disk0_io+0xfc>
c000fe64:	00c45913          	srli	s2,s0,0xc
c000fe68:	00391d13          	slli	s10,s2,0x3
c000fe6c:	00040493          	mv	s1,s0
c000fe70:	00399c93          	slli	s9,s3,0x3
c000fe74:	000d0693          	mv	a3,s10
c000fe78:	0008b617          	auipc	a2,0x8b
c000fe7c:	97062603          	lw	a2,-1680(a2) # c009a7e8 <disk0_buffer>
c000fe80:	000c8593          	mv	a1,s9
c000fe84:	000c0513          	mv	a0,s8
c000fe88:	981f00ef          	jal	ra,c0000808 <ide_read_secs>
c000fe8c:	0e051c63          	bnez	a0,c000ff84 <disk0_io+0x210>
c000fe90:	00c10713          	addi	a4,sp,12
c000fe94:	00100693          	li	a3,1
c000fe98:	00048613          	mv	a2,s1
c000fe9c:	0008b597          	auipc	a1,0x8b
c000fea0:	94c5a583          	lw	a1,-1716(a1) # c009a7e8 <disk0_buffer>
c000fea4:	000b0513          	mv	a0,s6
c000fea8:	a9cf80ef          	jal	ra,c0008144 <iobuf_move>
c000feac:	00c12783          	lw	a5,12(sp)
c000feb0:	08f49a63          	bne	s1,a5,c000ff44 <disk0_io+0x1d0>
c000feb4:	0154f7b3          	and	a5,s1,s5
c000feb8:	08079663          	bnez	a5,c000ff44 <disk0_io+0x1d0>
c000febc:	40940433          	sub	s0,s0,s1
c000fec0:	012989b3          	add	s3,s3,s2
c000fec4:	f80416e3          	bnez	s0,c000fe50 <disk0_io+0xdc>
c000fec8:	0008b517          	auipc	a0,0x8b
c000fecc:	8ac50513          	addi	a0,a0,-1876 # c009a774 <disk0_sem>
c000fed0:	b2df60ef          	jal	ra,c00069fc <up>
c000fed4:	00000513          	li	a0,0
c000fed8:	f1dff06f          	j	c000fdf4 <disk0_io+0x80>
c000fedc:	00c10713          	addi	a4,sp,12
c000fee0:	00000693          	li	a3,0
c000fee4:	000a0613          	mv	a2,s4
c000fee8:	0008b597          	auipc	a1,0x8b
c000feec:	9005a583          	lw	a1,-1792(a1) # c009a7e8 <disk0_buffer>
c000fef0:	000b0513          	mv	a0,s6
c000fef4:	a50f80ef          	jal	ra,c0008144 <iobuf_move>
c000fef8:	00c12903          	lw	s2,12(sp)
c000fefc:	06090463          	beqz	s2,c000ff64 <disk0_io+0x1f0>
c000ff00:	07246263          	bltu	s0,s2,c000ff64 <disk0_io+0x1f0>
c000ff04:	015977b3          	and	a5,s2,s5
c000ff08:	04079e63          	bnez	a5,c000ff64 <disk0_io+0x1f0>
c000ff0c:	00c95913          	srli	s2,s2,0xc
c000ff10:	00399493          	slli	s1,s3,0x3
c000ff14:	00391c93          	slli	s9,s2,0x3
c000ff18:	000c8693          	mv	a3,s9
c000ff1c:	0008b617          	auipc	a2,0x8b
c000ff20:	8cc62603          	lw	a2,-1844(a2) # c009a7e8 <disk0_buffer>
c000ff24:	00048593          	mv	a1,s1
c000ff28:	000c0513          	mv	a0,s8
c000ff2c:	975f00ef          	jal	ra,c00008a0 <ide_write_secs>
c000ff30:	08051063          	bnez	a0,c000ffb0 <disk0_io+0x23c>
c000ff34:	00c12483          	lw	s1,12(sp)
c000ff38:	f85ff06f          	j	c000febc <disk0_io+0x148>
c000ff3c:	ffd00513          	li	a0,-3
c000ff40:	eb5ff06f          	j	c000fdf4 <disk0_io+0x80>
c000ff44:	00007697          	auipc	a3,0x7
c000ff48:	16c68693          	addi	a3,a3,364 # c00170b0 <syscalls+0xbe8>
c000ff4c:	00004617          	auipc	a2,0x4
c000ff50:	ed060613          	addi	a2,a2,-304 # c0013e1c <commands+0x164>
c000ff54:	06200593          	li	a1,98
c000ff58:	00007517          	auipc	a0,0x7
c000ff5c:	0a850513          	addi	a0,a0,168 # c0017000 <syscalls+0xb38>
c000ff60:	b64f00ef          	jal	ra,c00002c4 <__panic>
c000ff64:	00007697          	auipc	a3,0x7
c000ff68:	05c68693          	addi	a3,a3,92 # c0016fc0 <syscalls+0xaf8>
c000ff6c:	00004617          	auipc	a2,0x4
c000ff70:	eb060613          	addi	a2,a2,-336 # c0013e1c <commands+0x164>
c000ff74:	05700593          	li	a1,87
c000ff78:	00007517          	auipc	a0,0x7
c000ff7c:	08850513          	addi	a0,a0,136 # c0017000 <syscalls+0xb38>
c000ff80:	b44f00ef          	jal	ra,c00002c4 <__panic>
c000ff84:	00050893          	mv	a7,a0
c000ff88:	000d0813          	mv	a6,s10
c000ff8c:	00090793          	mv	a5,s2
c000ff90:	000c8713          	mv	a4,s9
c000ff94:	00098693          	mv	a3,s3
c000ff98:	00007617          	auipc	a2,0x7
c000ff9c:	0d060613          	addi	a2,a2,208 # c0017068 <syscalls+0xba0>
c000ffa0:	02e00593          	li	a1,46
c000ffa4:	00007517          	auipc	a0,0x7
c000ffa8:	05c50513          	addi	a0,a0,92 # c0017000 <syscalls+0xb38>
c000ffac:	b18f00ef          	jal	ra,c00002c4 <__panic>
c000ffb0:	00050893          	mv	a7,a0
c000ffb4:	000c8813          	mv	a6,s9
c000ffb8:	00090793          	mv	a5,s2
c000ffbc:	00048713          	mv	a4,s1
c000ffc0:	00098693          	mv	a3,s3
c000ffc4:	00007617          	auipc	a2,0x7
c000ffc8:	05860613          	addi	a2,a2,88 # c001701c <syscalls+0xb54>
c000ffcc:	03800593          	li	a1,56
c000ffd0:	00007517          	auipc	a0,0x7
c000ffd4:	03050513          	addi	a0,a0,48 # c0017000 <syscalls+0xb38>
c000ffd8:	aecf00ef          	jal	ra,c00002c4 <__panic>

c000ffdc <dev_init_disk0>:
c000ffdc:	ff010113          	addi	sp,sp,-16
c000ffe0:	00112623          	sw	ra,12(sp)
c000ffe4:	00812423          	sw	s0,8(sp)
c000ffe8:	00912223          	sw	s1,4(sp)
c000ffec:	610000ef          	jal	ra,c00105fc <dev_create_inode>
c000fff0:	0a050c63          	beqz	a0,c00100a8 <dev_init_disk0+0xcc>
c000fff4:	02c52703          	lw	a4,44(a0)
c000fff8:	000014b7          	lui	s1,0x1
c000fffc:	23448793          	addi	a5,s1,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
c0010000:	00050413          	mv	s0,a0
c0010004:	10f71463          	bne	a4,a5,c001010c <dev_init_disk0+0x130>
c0010008:	00200513          	li	a0,2
c001000c:	f90f00ef          	jal	ra,c000079c <ide_device_valid>
c0010010:	0e050263          	beqz	a0,c00100f4 <dev_init_disk0+0x118>
c0010014:	00200513          	li	a0,2
c0010018:	fb8f00ef          	jal	ra,c00007d0 <ide_device_size>
c001001c:	00355793          	srli	a5,a0,0x3
c0010020:	00f42023          	sw	a5,0(s0)
c0010024:	00000797          	auipc	a5,0x0
c0010028:	d3878793          	addi	a5,a5,-712 # c000fd5c <disk0_open>
c001002c:	00f42423          	sw	a5,8(s0)
c0010030:	00000797          	auipc	a5,0x0
c0010034:	d3478793          	addi	a5,a5,-716 # c000fd64 <disk0_close>
c0010038:	00f42623          	sw	a5,12(s0)
c001003c:	00000797          	auipc	a5,0x0
c0010040:	d3878793          	addi	a5,a5,-712 # c000fd74 <disk0_io>
c0010044:	00f42823          	sw	a5,16(s0)
c0010048:	00000797          	auipc	a5,0x0
c001004c:	d2478793          	addi	a5,a5,-732 # c000fd6c <disk0_ioctl>
c0010050:	00100593          	li	a1,1
c0010054:	0008a517          	auipc	a0,0x8a
c0010058:	72050513          	addi	a0,a0,1824 # c009a774 <disk0_sem>
c001005c:	00f42a23          	sw	a5,20(s0)
c0010060:	00942223          	sw	s1,4(s0)
c0010064:	98df60ef          	jal	ra,c00069f0 <sem_init>
c0010068:	00004537          	lui	a0,0x4
c001006c:	d81f20ef          	jal	ra,c0002dec <kmalloc>
c0010070:	0008a297          	auipc	t0,0x8a
c0010074:	76a2ac23          	sw	a0,1912(t0) # c009a7e8 <disk0_buffer>
c0010078:	06050263          	beqz	a0,c00100dc <dev_init_disk0+0x100>
c001007c:	00100613          	li	a2,1
c0010080:	00040593          	mv	a1,s0
c0010084:	00007517          	auipc	a0,0x7
c0010088:	f1850513          	addi	a0,a0,-232 # c0016f9c <syscalls+0xad4>
c001008c:	addfe0ef          	jal	ra,c000eb68 <vfs_add_dev>
c0010090:	02051863          	bnez	a0,c00100c0 <dev_init_disk0+0xe4>
c0010094:	00c12083          	lw	ra,12(sp)
c0010098:	00812403          	lw	s0,8(sp)
c001009c:	00412483          	lw	s1,4(sp)
c00100a0:	01010113          	addi	sp,sp,16
c00100a4:	00008067          	ret
c00100a8:	00007617          	auipc	a2,0x7
c00100ac:	e9c60613          	addi	a2,a2,-356 # c0016f44 <syscalls+0xa7c>
c00100b0:	08700593          	li	a1,135
c00100b4:	00007517          	auipc	a0,0x7
c00100b8:	f4c50513          	addi	a0,a0,-180 # c0017000 <syscalls+0xb38>
c00100bc:	a08f00ef          	jal	ra,c00002c4 <__panic>
c00100c0:	00050693          	mv	a3,a0
c00100c4:	00007617          	auipc	a2,0x7
c00100c8:	ee060613          	addi	a2,a2,-288 # c0016fa4 <syscalls+0xadc>
c00100cc:	08d00593          	li	a1,141
c00100d0:	00007517          	auipc	a0,0x7
c00100d4:	f3050513          	addi	a0,a0,-208 # c0017000 <syscalls+0xb38>
c00100d8:	9ecf00ef          	jal	ra,c00002c4 <__panic>
c00100dc:	00007617          	auipc	a2,0x7
c00100e0:	ea460613          	addi	a2,a2,-348 # c0016f80 <syscalls+0xab8>
c00100e4:	07f00593          	li	a1,127
c00100e8:	00007517          	auipc	a0,0x7
c00100ec:	f1850513          	addi	a0,a0,-232 # c0017000 <syscalls+0xb38>
c00100f0:	9d4f00ef          	jal	ra,c00002c4 <__panic>
c00100f4:	00007617          	auipc	a2,0x7
c00100f8:	e6c60613          	addi	a2,a2,-404 # c0016f60 <syscalls+0xa98>
c00100fc:	07300593          	li	a1,115
c0010100:	00007517          	auipc	a0,0x7
c0010104:	f0050513          	addi	a0,a0,-256 # c0017000 <syscalls+0xb38>
c0010108:	9bcf00ef          	jal	ra,c00002c4 <__panic>
c001010c:	00007697          	auipc	a3,0x7
c0010110:	8cc68693          	addi	a3,a3,-1844 # c00169d8 <syscalls+0x510>
c0010114:	00004617          	auipc	a2,0x4
c0010118:	d0860613          	addi	a2,a2,-760 # c0013e1c <commands+0x164>
c001011c:	08900593          	li	a1,137
c0010120:	00007517          	auipc	a0,0x7
c0010124:	ee050513          	addi	a0,a0,-288 # c0017000 <syscalls+0xb38>
c0010128:	99cf00ef          	jal	ra,c00002c4 <__panic>

c001012c <stdout_open>:
c001012c:	00100793          	li	a5,1
c0010130:	ffd00513          	li	a0,-3
c0010134:	00f59463          	bne	a1,a5,c001013c <stdout_open+0x10>
c0010138:	00000513          	li	a0,0
c001013c:	00008067          	ret

c0010140 <stdout_close>:
c0010140:	00000513          	li	a0,0
c0010144:	00008067          	ret

c0010148 <stdout_ioctl>:
c0010148:	ffd00513          	li	a0,-3
c001014c:	00008067          	ret

c0010150 <stdout_io>:
c0010150:	04060c63          	beqz	a2,c00101a8 <stdout_io+0x58>
c0010154:	00c5a783          	lw	a5,12(a1)
c0010158:	ff010113          	addi	sp,sp,-16
c001015c:	00812423          	sw	s0,8(sp)
c0010160:	00912223          	sw	s1,4(sp)
c0010164:	00112623          	sw	ra,12(sp)
c0010168:	00058493          	mv	s1,a1
c001016c:	0005a403          	lw	s0,0(a1)
c0010170:	02078063          	beqz	a5,c0010190 <stdout_io+0x40>
c0010174:	00140413          	addi	s0,s0,1
c0010178:	fff44503          	lbu	a0,-1(s0)
c001017c:	82cf00ef          	jal	ra,c00001a8 <cputchar>
c0010180:	00c4a783          	lw	a5,12(s1)
c0010184:	fff78793          	addi	a5,a5,-1
c0010188:	00f4a623          	sw	a5,12(s1)
c001018c:	fe0794e3          	bnez	a5,c0010174 <stdout_io+0x24>
c0010190:	00c12083          	lw	ra,12(sp)
c0010194:	00000513          	li	a0,0
c0010198:	00812403          	lw	s0,8(sp)
c001019c:	00412483          	lw	s1,4(sp)
c00101a0:	01010113          	addi	sp,sp,16
c00101a4:	00008067          	ret
c00101a8:	ffd00513          	li	a0,-3
c00101ac:	00008067          	ret

c00101b0 <dev_init_stdout>:
c00101b0:	ff010113          	addi	sp,sp,-16
c00101b4:	00112623          	sw	ra,12(sp)
c00101b8:	444000ef          	jal	ra,c00105fc <dev_create_inode>
c00101bc:	06050a63          	beqz	a0,c0010230 <dev_init_stdout+0x80>
c00101c0:	02c52703          	lw	a4,44(a0)
c00101c4:	000017b7          	lui	a5,0x1
c00101c8:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
c00101cc:	08f71c63          	bne	a4,a5,c0010264 <dev_init_stdout+0xb4>
c00101d0:	00100793          	li	a5,1
c00101d4:	00f52223          	sw	a5,4(a0)
c00101d8:	00000797          	auipc	a5,0x0
c00101dc:	f5478793          	addi	a5,a5,-172 # c001012c <stdout_open>
c00101e0:	00f52423          	sw	a5,8(a0)
c00101e4:	00000797          	auipc	a5,0x0
c00101e8:	f5c78793          	addi	a5,a5,-164 # c0010140 <stdout_close>
c00101ec:	00f52623          	sw	a5,12(a0)
c00101f0:	00000797          	auipc	a5,0x0
c00101f4:	f6078793          	addi	a5,a5,-160 # c0010150 <stdout_io>
c00101f8:	00f52823          	sw	a5,16(a0)
c00101fc:	00000797          	auipc	a5,0x0
c0010200:	f4c78793          	addi	a5,a5,-180 # c0010148 <stdout_ioctl>
c0010204:	00052023          	sw	zero,0(a0)
c0010208:	00f52a23          	sw	a5,20(a0)
c001020c:	00050593          	mv	a1,a0
c0010210:	00000613          	li	a2,0
c0010214:	00007517          	auipc	a0,0x7
c0010218:	f0450513          	addi	a0,a0,-252 # c0017118 <syscalls+0xc50>
c001021c:	94dfe0ef          	jal	ra,c000eb68 <vfs_add_dev>
c0010220:	02051463          	bnez	a0,c0010248 <dev_init_stdout+0x98>
c0010224:	00c12083          	lw	ra,12(sp)
c0010228:	01010113          	addi	sp,sp,16
c001022c:	00008067          	ret
c0010230:	00007617          	auipc	a2,0x7
c0010234:	eb060613          	addi	a2,a2,-336 # c00170e0 <syscalls+0xc18>
c0010238:	03700593          	li	a1,55
c001023c:	00007517          	auipc	a0,0x7
c0010240:	ec050513          	addi	a0,a0,-320 # c00170fc <syscalls+0xc34>
c0010244:	880f00ef          	jal	ra,c00002c4 <__panic>
c0010248:	00050693          	mv	a3,a0
c001024c:	00007617          	auipc	a2,0x7
c0010250:	ed460613          	addi	a2,a2,-300 # c0017120 <syscalls+0xc58>
c0010254:	03d00593          	li	a1,61
c0010258:	00007517          	auipc	a0,0x7
c001025c:	ea450513          	addi	a0,a0,-348 # c00170fc <syscalls+0xc34>
c0010260:	864f00ef          	jal	ra,c00002c4 <__panic>
c0010264:	00006697          	auipc	a3,0x6
c0010268:	77468693          	addi	a3,a3,1908 # c00169d8 <syscalls+0x510>
c001026c:	00004617          	auipc	a2,0x4
c0010270:	bb060613          	addi	a2,a2,-1104 # c0013e1c <commands+0x164>
c0010274:	03900593          	li	a1,57
c0010278:	00007517          	auipc	a0,0x7
c001027c:	e8450513          	addi	a0,a0,-380 # c00170fc <syscalls+0xc34>
c0010280:	844f00ef          	jal	ra,c00002c4 <__panic>

c0010284 <dev_lookup>:
c0010284:	0005c703          	lbu	a4,0(a1)
c0010288:	02071e63          	bnez	a4,c00102c4 <dev_lookup+0x40>
c001028c:	ff010113          	addi	sp,sp,-16
c0010290:	00112623          	sw	ra,12(sp)
c0010294:	00812423          	sw	s0,8(sp)
c0010298:	00912223          	sw	s1,4(sp)
c001029c:	00060413          	mv	s0,a2
c00102a0:	00050493          	mv	s1,a0
c00102a4:	80cff0ef          	jal	ra,c000f2b0 <inode_ref_inc>
c00102a8:	00c12083          	lw	ra,12(sp)
c00102ac:	00942023          	sw	s1,0(s0)
c00102b0:	00000513          	li	a0,0
c00102b4:	00812403          	lw	s0,8(sp)
c00102b8:	00412483          	lw	s1,4(sp)
c00102bc:	01010113          	addi	sp,sp,16
c00102c0:	00008067          	ret
c00102c4:	ff000513          	li	a0,-16
c00102c8:	00008067          	ret

c00102cc <dev_ioctl>:
c00102cc:	00050e63          	beqz	a0,c00102e8 <dev_ioctl+0x1c>
c00102d0:	02c52683          	lw	a3,44(a0)
c00102d4:	00001737          	lui	a4,0x1
c00102d8:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
c00102dc:	00e69663          	bne	a3,a4,c00102e8 <dev_ioctl+0x1c>
c00102e0:	01452303          	lw	t1,20(a0)
c00102e4:	00030067          	jr	t1
c00102e8:	ff010113          	addi	sp,sp,-16
c00102ec:	00006697          	auipc	a3,0x6
c00102f0:	6ec68693          	addi	a3,a3,1772 # c00169d8 <syscalls+0x510>
c00102f4:	00004617          	auipc	a2,0x4
c00102f8:	b2860613          	addi	a2,a2,-1240 # c0013e1c <commands+0x164>
c00102fc:	03500593          	li	a1,53
c0010300:	00007517          	auipc	a0,0x7
c0010304:	e3c50513          	addi	a0,a0,-452 # c001713c <syscalls+0xc74>
c0010308:	00112623          	sw	ra,12(sp)
c001030c:	fb9ef0ef          	jal	ra,c00002c4 <__panic>

c0010310 <dev_tryseek>:
c0010310:	04050263          	beqz	a0,c0010354 <dev_tryseek+0x44>
c0010314:	02c52683          	lw	a3,44(a0)
c0010318:	00001737          	lui	a4,0x1
c001031c:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
c0010320:	00050793          	mv	a5,a0
c0010324:	02e69863          	bne	a3,a4,c0010354 <dev_tryseek+0x44>
c0010328:	00052703          	lw	a4,0(a0)
c001032c:	ffd00513          	li	a0,-3
c0010330:	02070063          	beqz	a4,c0010350 <dev_tryseek+0x40>
c0010334:	0047a783          	lw	a5,4(a5)
c0010338:	02f5f6b3          	remu	a3,a1,a5
c001033c:	00069a63          	bnez	a3,c0010350 <dev_tryseek+0x40>
c0010340:	0005c863          	bltz	a1,c0010350 <dev_tryseek+0x40>
c0010344:	02f70733          	mul	a4,a4,a5
c0010348:	00e5f463          	bleu	a4,a1,c0010350 <dev_tryseek+0x40>
c001034c:	00000513          	li	a0,0
c0010350:	00008067          	ret
c0010354:	ff010113          	addi	sp,sp,-16
c0010358:	00006697          	auipc	a3,0x6
c001035c:	68068693          	addi	a3,a3,1664 # c00169d8 <syscalls+0x510>
c0010360:	00004617          	auipc	a2,0x4
c0010364:	abc60613          	addi	a2,a2,-1348 # c0013e1c <commands+0x164>
c0010368:	05f00593          	li	a1,95
c001036c:	00007517          	auipc	a0,0x7
c0010370:	dd050513          	addi	a0,a0,-560 # c001713c <syscalls+0xc74>
c0010374:	00112623          	sw	ra,12(sp)
c0010378:	f4def0ef          	jal	ra,c00002c4 <__panic>

c001037c <dev_gettype>:
c001037c:	02050863          	beqz	a0,c00103ac <dev_gettype+0x30>
c0010380:	02c52703          	lw	a4,44(a0)
c0010384:	000017b7          	lui	a5,0x1
c0010388:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
c001038c:	02f71063          	bne	a4,a5,c00103ac <dev_gettype+0x30>
c0010390:	00052703          	lw	a4,0(a0)
c0010394:	000057b7          	lui	a5,0x5
c0010398:	00071463          	bnez	a4,c00103a0 <dev_gettype+0x24>
c001039c:	000047b7          	lui	a5,0x4
c00103a0:	00f5a023          	sw	a5,0(a1)
c00103a4:	00000513          	li	a0,0
c00103a8:	00008067          	ret
c00103ac:	ff010113          	addi	sp,sp,-16
c00103b0:	00006697          	auipc	a3,0x6
c00103b4:	62868693          	addi	a3,a3,1576 # c00169d8 <syscalls+0x510>
c00103b8:	00004617          	auipc	a2,0x4
c00103bc:	a6460613          	addi	a2,a2,-1436 # c0013e1c <commands+0x164>
c00103c0:	05300593          	li	a1,83
c00103c4:	00007517          	auipc	a0,0x7
c00103c8:	d7850513          	addi	a0,a0,-648 # c001713c <syscalls+0xc74>
c00103cc:	00112623          	sw	ra,12(sp)
c00103d0:	ef5ef0ef          	jal	ra,c00002c4 <__panic>

c00103d4 <dev_write>:
c00103d4:	02050063          	beqz	a0,c00103f4 <dev_write+0x20>
c00103d8:	02c52683          	lw	a3,44(a0)
c00103dc:	00001737          	lui	a4,0x1
c00103e0:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
c00103e4:	00e69863          	bne	a3,a4,c00103f4 <dev_write+0x20>
c00103e8:	01052303          	lw	t1,16(a0)
c00103ec:	00100613          	li	a2,1
c00103f0:	00030067          	jr	t1
c00103f4:	ff010113          	addi	sp,sp,-16
c00103f8:	00006697          	auipc	a3,0x6
c00103fc:	5e068693          	addi	a3,a3,1504 # c00169d8 <syscalls+0x510>
c0010400:	00004617          	auipc	a2,0x4
c0010404:	a1c60613          	addi	a2,a2,-1508 # c0013e1c <commands+0x164>
c0010408:	02c00593          	li	a1,44
c001040c:	00007517          	auipc	a0,0x7
c0010410:	d3050513          	addi	a0,a0,-720 # c001713c <syscalls+0xc74>
c0010414:	00112623          	sw	ra,12(sp)
c0010418:	eadef0ef          	jal	ra,c00002c4 <__panic>

c001041c <dev_read>:
c001041c:	02050063          	beqz	a0,c001043c <dev_read+0x20>
c0010420:	02c52683          	lw	a3,44(a0)
c0010424:	00001737          	lui	a4,0x1
c0010428:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
c001042c:	00e69863          	bne	a3,a4,c001043c <dev_read+0x20>
c0010430:	01052303          	lw	t1,16(a0)
c0010434:	00000613          	li	a2,0
c0010438:	00030067          	jr	t1
c001043c:	ff010113          	addi	sp,sp,-16
c0010440:	00006697          	auipc	a3,0x6
c0010444:	59868693          	addi	a3,a3,1432 # c00169d8 <syscalls+0x510>
c0010448:	00004617          	auipc	a2,0x4
c001044c:	9d460613          	addi	a2,a2,-1580 # c0013e1c <commands+0x164>
c0010450:	02300593          	li	a1,35
c0010454:	00007517          	auipc	a0,0x7
c0010458:	ce850513          	addi	a0,a0,-792 # c001713c <syscalls+0xc74>
c001045c:	00112623          	sw	ra,12(sp)
c0010460:	e65ef0ef          	jal	ra,c00002c4 <__panic>

c0010464 <dev_close>:
c0010464:	00050e63          	beqz	a0,c0010480 <dev_close+0x1c>
c0010468:	02c52683          	lw	a3,44(a0)
c001046c:	00001737          	lui	a4,0x1
c0010470:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
c0010474:	00e69663          	bne	a3,a4,c0010480 <dev_close+0x1c>
c0010478:	00c52303          	lw	t1,12(a0)
c001047c:	00030067          	jr	t1
c0010480:	ff010113          	addi	sp,sp,-16
c0010484:	00006697          	auipc	a3,0x6
c0010488:	55468693          	addi	a3,a3,1364 # c00169d8 <syscalls+0x510>
c001048c:	00004617          	auipc	a2,0x4
c0010490:	99060613          	addi	a2,a2,-1648 # c0013e1c <commands+0x164>
c0010494:	01a00593          	li	a1,26
c0010498:	00007517          	auipc	a0,0x7
c001049c:	ca450513          	addi	a0,a0,-860 # c001713c <syscalls+0xc74>
c00104a0:	00112623          	sw	ra,12(sp)
c00104a4:	e21ef0ef          	jal	ra,c00002c4 <__panic>

c00104a8 <dev_open>:
c00104a8:	03c5f713          	andi	a4,a1,60
c00104ac:	02071063          	bnez	a4,c00104cc <dev_open+0x24>
c00104b0:	02050263          	beqz	a0,c00104d4 <dev_open+0x2c>
c00104b4:	02c52683          	lw	a3,44(a0)
c00104b8:	00001737          	lui	a4,0x1
c00104bc:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
c00104c0:	00e69a63          	bne	a3,a4,c00104d4 <dev_open+0x2c>
c00104c4:	00852303          	lw	t1,8(a0)
c00104c8:	00030067          	jr	t1
c00104cc:	ffd00513          	li	a0,-3
c00104d0:	00008067          	ret
c00104d4:	ff010113          	addi	sp,sp,-16
c00104d8:	00006697          	auipc	a3,0x6
c00104dc:	50068693          	addi	a3,a3,1280 # c00169d8 <syscalls+0x510>
c00104e0:	00004617          	auipc	a2,0x4
c00104e4:	93c60613          	addi	a2,a2,-1732 # c0013e1c <commands+0x164>
c00104e8:	01100593          	li	a1,17
c00104ec:	00007517          	auipc	a0,0x7
c00104f0:	c5050513          	addi	a0,a0,-944 # c001713c <syscalls+0xc74>
c00104f4:	00112623          	sw	ra,12(sp)
c00104f8:	dcdef0ef          	jal	ra,c00002c4 <__panic>

c00104fc <dev_fstat>:
c00104fc:	ff010113          	addi	sp,sp,-16
c0010500:	00912223          	sw	s1,4(sp)
c0010504:	00058493          	mv	s1,a1
c0010508:	00812423          	sw	s0,8(sp)
c001050c:	01000613          	li	a2,16
c0010510:	00050413          	mv	s0,a0
c0010514:	00000593          	li	a1,0
c0010518:	00048513          	mv	a0,s1
c001051c:	00112623          	sw	ra,12(sp)
c0010520:	699020ef          	jal	ra,c00133b8 <memset>
c0010524:	06040e63          	beqz	s0,c00105a0 <dev_fstat+0xa4>
c0010528:	03c42783          	lw	a5,60(s0)
c001052c:	06078a63          	beqz	a5,c00105a0 <dev_fstat+0xa4>
c0010530:	0287a783          	lw	a5,40(a5) # 4028 <_binary_bin_swap_img_size-0x3cd8>
c0010534:	06078663          	beqz	a5,c00105a0 <dev_fstat+0xa4>
c0010538:	00006597          	auipc	a1,0x6
c001053c:	5d458593          	addi	a1,a1,1492 # c0016b0c <syscalls+0x644>
c0010540:	00040513          	mv	a0,s0
c0010544:	d95fe0ef          	jal	ra,c000f2d8 <inode_check>
c0010548:	03c42783          	lw	a5,60(s0)
c001054c:	00048593          	mv	a1,s1
c0010550:	00040513          	mv	a0,s0
c0010554:	0287a783          	lw	a5,40(a5)
c0010558:	000780e7          	jalr	a5
c001055c:	02051863          	bnez	a0,c001058c <dev_fstat+0x90>
c0010560:	02c42703          	lw	a4,44(s0)
c0010564:	000017b7          	lui	a5,0x1
c0010568:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
c001056c:	04f71a63          	bne	a4,a5,c00105c0 <dev_fstat+0xc4>
c0010570:	00042703          	lw	a4,0(s0)
c0010574:	00442783          	lw	a5,4(s0)
c0010578:	00100693          	li	a3,1
c001057c:	00d4a223          	sw	a3,4(s1)
c0010580:	02e787b3          	mul	a5,a5,a4
c0010584:	00e4a423          	sw	a4,8(s1)
c0010588:	00f4a623          	sw	a5,12(s1)
c001058c:	00c12083          	lw	ra,12(sp)
c0010590:	00812403          	lw	s0,8(sp)
c0010594:	00412483          	lw	s1,4(sp)
c0010598:	01010113          	addi	sp,sp,16
c001059c:	00008067          	ret
c00105a0:	00006697          	auipc	a3,0x6
c00105a4:	50468693          	addi	a3,a3,1284 # c0016aa4 <syscalls+0x5dc>
c00105a8:	00004617          	auipc	a2,0x4
c00105ac:	87460613          	addi	a2,a2,-1932 # c0013e1c <commands+0x164>
c00105b0:	04200593          	li	a1,66
c00105b4:	00007517          	auipc	a0,0x7
c00105b8:	b8850513          	addi	a0,a0,-1144 # c001713c <syscalls+0xc74>
c00105bc:	d09ef0ef          	jal	ra,c00002c4 <__panic>
c00105c0:	00006697          	auipc	a3,0x6
c00105c4:	41868693          	addi	a3,a3,1048 # c00169d8 <syscalls+0x510>
c00105c8:	00004617          	auipc	a2,0x4
c00105cc:	85460613          	addi	a2,a2,-1964 # c0013e1c <commands+0x164>
c00105d0:	04500593          	li	a1,69
c00105d4:	00007517          	auipc	a0,0x7
c00105d8:	b6850513          	addi	a0,a0,-1176 # c001713c <syscalls+0xc74>
c00105dc:	ce9ef0ef          	jal	ra,c00002c4 <__panic>

c00105e0 <dev_init>:
c00105e0:	ff010113          	addi	sp,sp,-16
c00105e4:	00112623          	sw	ra,12(sp)
c00105e8:	e78ff0ef          	jal	ra,c000fc60 <dev_init_stdin>
c00105ec:	bc5ff0ef          	jal	ra,c00101b0 <dev_init_stdout>
c00105f0:	00c12083          	lw	ra,12(sp)
c00105f4:	01010113          	addi	sp,sp,16
c00105f8:	9e5ff06f          	j	c000ffdc <dev_init_disk0>

c00105fc <dev_create_inode>:
c00105fc:	00001537          	lui	a0,0x1
c0010600:	ff010113          	addi	sp,sp,-16
c0010604:	23450513          	addi	a0,a0,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
c0010608:	00812423          	sw	s0,8(sp)
c001060c:	00112623          	sw	ra,12(sp)
c0010610:	bf5fe0ef          	jal	ra,c000f204 <__alloc_inode>
c0010614:	00050413          	mv	s0,a0
c0010618:	00050a63          	beqz	a0,c001062c <dev_create_inode+0x30>
c001061c:	00000613          	li	a2,0
c0010620:	00007597          	auipc	a1,0x7
c0010624:	b3058593          	addi	a1,a1,-1232 # c0017150 <dev_node_ops>
c0010628:	c0dfe0ef          	jal	ra,c000f234 <inode_init>
c001062c:	00c12083          	lw	ra,12(sp)
c0010630:	00040513          	mv	a0,s0
c0010634:	00812403          	lw	s0,8(sp)
c0010638:	01010113          	addi	sp,sp,16
c001063c:	00008067          	ret

c0010640 <sfs_init>:
c0010640:	ff010113          	addi	sp,sp,-16
c0010644:	00007517          	auipc	a0,0x7
c0010648:	95850513          	addi	a0,a0,-1704 # c0016f9c <syscalls+0xad4>
c001064c:	00112623          	sw	ra,12(sp)
c0010650:	46d000ef          	jal	ra,c00112bc <sfs_mount>
c0010654:	00051863          	bnez	a0,c0010664 <sfs_init+0x24>
c0010658:	00c12083          	lw	ra,12(sp)
c001065c:	01010113          	addi	sp,sp,16
c0010660:	00008067          	ret
c0010664:	00050693          	mv	a3,a0
c0010668:	00007617          	auipc	a2,0x7
c001066c:	b2860613          	addi	a2,a2,-1240 # c0017190 <dev_node_ops+0x40>
c0010670:	01000593          	li	a1,16
c0010674:	00007517          	auipc	a0,0x7
c0010678:	b3c50513          	addi	a0,a0,-1220 # c00171b0 <dev_node_ops+0x60>
c001067c:	c49ef0ef          	jal	ra,c00002c4 <__panic>

c0010680 <sfs_rwblock_nolock.isra.0>:
c0010680:	fe010113          	addi	sp,sp,-32
c0010684:	00812c23          	sw	s0,24(sp)
c0010688:	00912a23          	sw	s1,20(sp)
c001068c:	00112e23          	sw	ra,28(sp)
c0010690:	00058493          	mv	s1,a1
c0010694:	00070413          	mv	s0,a4
c0010698:	00060593          	mv	a1,a2
c001069c:	00069463          	bnez	a3,c00106a4 <sfs_rwblock_nolock.isra.0+0x24>
c00106a0:	04079463          	bnez	a5,c00106e8 <sfs_rwblock_nolock.isra.0+0x68>
c00106a4:	00052783          	lw	a5,0(a0)
c00106a8:	04f6f063          	bleu	a5,a3,c00106e8 <sfs_rwblock_nolock.isra.0+0x68>
c00106ac:	00001637          	lui	a2,0x1
c00106b0:	00c69693          	slli	a3,a3,0xc
c00106b4:	00010513          	mv	a0,sp
c00106b8:	a79f70ef          	jal	ra,c0008130 <iobuf_init>
c00106bc:	0004a783          	lw	a5,0(s1)
c00106c0:	00050593          	mv	a1,a0
c00106c4:	00040613          	mv	a2,s0
c00106c8:	0107a703          	lw	a4,16(a5)
c00106cc:	00078513          	mv	a0,a5
c00106d0:	000700e7          	jalr	a4
c00106d4:	01c12083          	lw	ra,28(sp)
c00106d8:	01812403          	lw	s0,24(sp)
c00106dc:	01412483          	lw	s1,20(sp)
c00106e0:	02010113          	addi	sp,sp,32
c00106e4:	00008067          	ret
c00106e8:	00007697          	auipc	a3,0x7
c00106ec:	b2068693          	addi	a3,a3,-1248 # c0017208 <dev_node_ops+0xb8>
c00106f0:	00003617          	auipc	a2,0x3
c00106f4:	72c60613          	addi	a2,a2,1836 # c0013e1c <commands+0x164>
c00106f8:	01500593          	li	a1,21
c00106fc:	00007517          	auipc	a0,0x7
c0010700:	b4050513          	addi	a0,a0,-1216 # c001723c <dev_node_ops+0xec>
c0010704:	bc1ef0ef          	jal	ra,c00002c4 <__panic>

c0010708 <sfs_rwblock>:
c0010708:	fd010113          	addi	sp,sp,-48
c001070c:	02812423          	sw	s0,40(sp)
c0010710:	03212023          	sw	s2,32(sp)
c0010714:	01912223          	sw	s9,4(sp)
c0010718:	00060413          	mv	s0,a2
c001071c:	00050c93          	mv	s9,a0
c0010720:	00068913          	mv	s2,a3
c0010724:	02912223          	sw	s1,36(sp)
c0010728:	01312e23          	sw	s3,28(sp)
c001072c:	01412c23          	sw	s4,24(sp)
c0010730:	01512a23          	sw	s5,20(sp)
c0010734:	01612823          	sw	s6,16(sp)
c0010738:	01712623          	sw	s7,12(sp)
c001073c:	01812423          	sw	s8,8(sp)
c0010740:	02112623          	sw	ra,44(sp)
c0010744:	00058493          	mv	s1,a1
c0010748:	00070b13          	mv	s6,a4
c001074c:	00450a93          	addi	s5,a0,4
c0010750:	01240c33          	add	s8,s0,s2
c0010754:	410000ef          	jal	ra,c0010b64 <lock_sfs_io>
c0010758:	02cc8a13          	addi	s4,s9,44
c001075c:	00100993          	li	s3,1
c0010760:	00001bb7          	lui	s7,0x1
c0010764:	00091863          	bnez	s2,c0010774 <sfs_rwblock+0x6c>
c0010768:	0740006f          	j	c00107dc <sfs_rwblock+0xd4>
c001076c:	017484b3          	add	s1,s1,s7
c0010770:	068c0663          	beq	s8,s0,c00107dc <sfs_rwblock+0xd4>
c0010774:	00040693          	mv	a3,s0
c0010778:	00048613          	mv	a2,s1
c001077c:	00098793          	mv	a5,s3
c0010780:	000b0713          	mv	a4,s6
c0010784:	000a0593          	mv	a1,s4
c0010788:	000a8513          	mv	a0,s5
c001078c:	ef5ff0ef          	jal	ra,c0010680 <sfs_rwblock_nolock.isra.0>
c0010790:	00050913          	mv	s2,a0
c0010794:	00140413          	addi	s0,s0,1
c0010798:	fc050ae3          	beqz	a0,c001076c <sfs_rwblock+0x64>
c001079c:	000c8513          	mv	a0,s9
c00107a0:	3d4000ef          	jal	ra,c0010b74 <unlock_sfs_io>
c00107a4:	02c12083          	lw	ra,44(sp)
c00107a8:	00090513          	mv	a0,s2
c00107ac:	02812403          	lw	s0,40(sp)
c00107b0:	02412483          	lw	s1,36(sp)
c00107b4:	02012903          	lw	s2,32(sp)
c00107b8:	01c12983          	lw	s3,28(sp)
c00107bc:	01812a03          	lw	s4,24(sp)
c00107c0:	01412a83          	lw	s5,20(sp)
c00107c4:	01012b03          	lw	s6,16(sp)
c00107c8:	00c12b83          	lw	s7,12(sp)
c00107cc:	00812c03          	lw	s8,8(sp)
c00107d0:	00412c83          	lw	s9,4(sp)
c00107d4:	03010113          	addi	sp,sp,48
c00107d8:	00008067          	ret
c00107dc:	00000913          	li	s2,0
c00107e0:	fbdff06f          	j	c001079c <sfs_rwblock+0x94>

c00107e4 <sfs_rblock>:
c00107e4:	00000713          	li	a4,0
c00107e8:	f21ff06f          	j	c0010708 <sfs_rwblock>

c00107ec <sfs_wblock>:
c00107ec:	00100713          	li	a4,1
c00107f0:	f19ff06f          	j	c0010708 <sfs_rwblock>

c00107f4 <sfs_rbuf>:
c00107f4:	fe010113          	addi	sp,sp,-32
c00107f8:	00112e23          	sw	ra,28(sp)
c00107fc:	00812c23          	sw	s0,24(sp)
c0010800:	00912a23          	sw	s1,20(sp)
c0010804:	01212823          	sw	s2,16(sp)
c0010808:	01312623          	sw	s3,12(sp)
c001080c:	01412423          	sw	s4,8(sp)
c0010810:	000017b7          	lui	a5,0x1
c0010814:	08f77463          	bleu	a5,a4,c001089c <sfs_rbuf+0xa8>
c0010818:	00070493          	mv	s1,a4
c001081c:	00c70733          	add	a4,a4,a2
c0010820:	00060993          	mv	s3,a2
c0010824:	06e7ec63          	bltu	a5,a4,c001089c <sfs_rbuf+0xa8>
c0010828:	00050413          	mv	s0,a0
c001082c:	00068913          	mv	s2,a3
c0010830:	00058a13          	mv	s4,a1
c0010834:	330000ef          	jal	ra,c0010b64 <lock_sfs_io>
c0010838:	03842603          	lw	a2,56(s0)
c001083c:	00090693          	mv	a3,s2
c0010840:	00100793          	li	a5,1
c0010844:	00000713          	li	a4,0
c0010848:	02c40593          	addi	a1,s0,44
c001084c:	00440513          	addi	a0,s0,4
c0010850:	e31ff0ef          	jal	ra,c0010680 <sfs_rwblock_nolock.isra.0>
c0010854:	00050913          	mv	s2,a0
c0010858:	00051c63          	bnez	a0,c0010870 <sfs_rbuf+0x7c>
c001085c:	03842583          	lw	a1,56(s0)
c0010860:	00098613          	mv	a2,s3
c0010864:	000a0513          	mv	a0,s4
c0010868:	009585b3          	add	a1,a1,s1
c001086c:	3bd020ef          	jal	ra,c0013428 <memcpy>
c0010870:	00040513          	mv	a0,s0
c0010874:	300000ef          	jal	ra,c0010b74 <unlock_sfs_io>
c0010878:	01c12083          	lw	ra,28(sp)
c001087c:	00090513          	mv	a0,s2
c0010880:	01812403          	lw	s0,24(sp)
c0010884:	01412483          	lw	s1,20(sp)
c0010888:	01012903          	lw	s2,16(sp)
c001088c:	00c12983          	lw	s3,12(sp)
c0010890:	00812a03          	lw	s4,8(sp)
c0010894:	02010113          	addi	sp,sp,32
c0010898:	00008067          	ret
c001089c:	00007697          	auipc	a3,0x7
c00108a0:	92868693          	addi	a3,a3,-1752 # c00171c4 <dev_node_ops+0x74>
c00108a4:	00003617          	auipc	a2,0x3
c00108a8:	57860613          	addi	a2,a2,1400 # c0013e1c <commands+0x164>
c00108ac:	05500593          	li	a1,85
c00108b0:	00007517          	auipc	a0,0x7
c00108b4:	98c50513          	addi	a0,a0,-1652 # c001723c <dev_node_ops+0xec>
c00108b8:	a0def0ef          	jal	ra,c00002c4 <__panic>

c00108bc <sfs_wbuf>:
c00108bc:	fd010113          	addi	sp,sp,-48
c00108c0:	02112623          	sw	ra,44(sp)
c00108c4:	02812423          	sw	s0,40(sp)
c00108c8:	02912223          	sw	s1,36(sp)
c00108cc:	03212023          	sw	s2,32(sp)
c00108d0:	01312e23          	sw	s3,28(sp)
c00108d4:	01412c23          	sw	s4,24(sp)
c00108d8:	01512a23          	sw	s5,20(sp)
c00108dc:	01612823          	sw	s6,16(sp)
c00108e0:	01712623          	sw	s7,12(sp)
c00108e4:	000017b7          	lui	a5,0x1
c00108e8:	0af77e63          	bleu	a5,a4,c00109a4 <sfs_wbuf+0xe8>
c00108ec:	00070493          	mv	s1,a4
c00108f0:	00c70733          	add	a4,a4,a2
c00108f4:	00060a13          	mv	s4,a2
c00108f8:	0ae7e663          	bltu	a5,a4,c00109a4 <sfs_wbuf+0xe8>
c00108fc:	00050413          	mv	s0,a0
c0010900:	00058b93          	mv	s7,a1
c0010904:	00068993          	mv	s3,a3
c0010908:	25c000ef          	jal	ra,c0010b64 <lock_sfs_io>
c001090c:	03842603          	lw	a2,56(s0)
c0010910:	00440a93          	addi	s5,s0,4
c0010914:	02c40b13          	addi	s6,s0,44
c0010918:	00100793          	li	a5,1
c001091c:	00000713          	li	a4,0
c0010920:	00098693          	mv	a3,s3
c0010924:	000b0593          	mv	a1,s6
c0010928:	000a8513          	mv	a0,s5
c001092c:	d55ff0ef          	jal	ra,c0010680 <sfs_rwblock_nolock.isra.0>
c0010930:	00050913          	mv	s2,a0
c0010934:	02051c63          	bnez	a0,c001096c <sfs_wbuf+0xb0>
c0010938:	03842503          	lw	a0,56(s0)
c001093c:	000a0613          	mv	a2,s4
c0010940:	000b8593          	mv	a1,s7
c0010944:	00950533          	add	a0,a0,s1
c0010948:	2e1020ef          	jal	ra,c0013428 <memcpy>
c001094c:	03842603          	lw	a2,56(s0)
c0010950:	00100793          	li	a5,1
c0010954:	00078713          	mv	a4,a5
c0010958:	00098693          	mv	a3,s3
c001095c:	000b0593          	mv	a1,s6
c0010960:	000a8513          	mv	a0,s5
c0010964:	d1dff0ef          	jal	ra,c0010680 <sfs_rwblock_nolock.isra.0>
c0010968:	00050913          	mv	s2,a0
c001096c:	00040513          	mv	a0,s0
c0010970:	204000ef          	jal	ra,c0010b74 <unlock_sfs_io>
c0010974:	02c12083          	lw	ra,44(sp)
c0010978:	00090513          	mv	a0,s2
c001097c:	02812403          	lw	s0,40(sp)
c0010980:	02412483          	lw	s1,36(sp)
c0010984:	02012903          	lw	s2,32(sp)
c0010988:	01c12983          	lw	s3,28(sp)
c001098c:	01812a03          	lw	s4,24(sp)
c0010990:	01412a83          	lw	s5,20(sp)
c0010994:	01012b03          	lw	s6,16(sp)
c0010998:	00c12b83          	lw	s7,12(sp)
c001099c:	03010113          	addi	sp,sp,48
c00109a0:	00008067          	ret
c00109a4:	00007697          	auipc	a3,0x7
c00109a8:	82068693          	addi	a3,a3,-2016 # c00171c4 <dev_node_ops+0x74>
c00109ac:	00003617          	auipc	a2,0x3
c00109b0:	47060613          	addi	a2,a2,1136 # c0013e1c <commands+0x164>
c00109b4:	06b00593          	li	a1,107
c00109b8:	00007517          	auipc	a0,0x7
c00109bc:	88450513          	addi	a0,a0,-1916 # c001723c <dev_node_ops+0xec>
c00109c0:	905ef0ef          	jal	ra,c00002c4 <__panic>

c00109c4 <sfs_sync_super>:
c00109c4:	ff010113          	addi	sp,sp,-16
c00109c8:	00112623          	sw	ra,12(sp)
c00109cc:	00812423          	sw	s0,8(sp)
c00109d0:	00912223          	sw	s1,4(sp)
c00109d4:	00050413          	mv	s0,a0
c00109d8:	18c000ef          	jal	ra,c0010b64 <lock_sfs_io>
c00109dc:	03842503          	lw	a0,56(s0)
c00109e0:	00001637          	lui	a2,0x1
c00109e4:	00000593          	li	a1,0
c00109e8:	1d1020ef          	jal	ra,c00133b8 <memset>
c00109ec:	03842503          	lw	a0,56(s0)
c00109f0:	00040593          	mv	a1,s0
c00109f4:	02c00613          	li	a2,44
c00109f8:	231020ef          	jal	ra,c0013428 <memcpy>
c00109fc:	03842603          	lw	a2,56(s0)
c0010a00:	02c40593          	addi	a1,s0,44
c0010a04:	00000793          	li	a5,0
c0010a08:	00100713          	li	a4,1
c0010a0c:	00000693          	li	a3,0
c0010a10:	00440513          	addi	a0,s0,4
c0010a14:	c6dff0ef          	jal	ra,c0010680 <sfs_rwblock_nolock.isra.0>
c0010a18:	00050493          	mv	s1,a0
c0010a1c:	00040513          	mv	a0,s0
c0010a20:	154000ef          	jal	ra,c0010b74 <unlock_sfs_io>
c0010a24:	00c12083          	lw	ra,12(sp)
c0010a28:	00048513          	mv	a0,s1
c0010a2c:	00812403          	lw	s0,8(sp)
c0010a30:	00412483          	lw	s1,4(sp)
c0010a34:	01010113          	addi	sp,sp,16
c0010a38:	00008067          	ret

c0010a3c <sfs_sync_freemap>:
c0010a3c:	ff010113          	addi	sp,sp,-16
c0010a40:	00812423          	sw	s0,8(sp)
c0010a44:	00452403          	lw	s0,4(a0)
c0010a48:	00912223          	sw	s1,4(sp)
c0010a4c:	000086b7          	lui	a3,0x8
c0010a50:	00050493          	mv	s1,a0
c0010a54:	03052503          	lw	a0,48(a0)
c0010a58:	fff68693          	addi	a3,a3,-1 # 7fff <_binary_bin_swap_img_size+0x2ff>
c0010a5c:	00d40433          	add	s0,s0,a3
c0010a60:	00000593          	li	a1,0
c0010a64:	00112623          	sw	ra,12(sp)
c0010a68:	00f45413          	srli	s0,s0,0xf
c0010a6c:	04d020ef          	jal	ra,c00132b8 <bitmap_getdata>
c0010a70:	00050593          	mv	a1,a0
c0010a74:	00040693          	mv	a3,s0
c0010a78:	00048513          	mv	a0,s1
c0010a7c:	00c12083          	lw	ra,12(sp)
c0010a80:	00812403          	lw	s0,8(sp)
c0010a84:	00412483          	lw	s1,4(sp)
c0010a88:	00100713          	li	a4,1
c0010a8c:	00200613          	li	a2,2
c0010a90:	01010113          	addi	sp,sp,16
c0010a94:	c75ff06f          	j	c0010708 <sfs_rwblock>

c0010a98 <sfs_clear_block>:
c0010a98:	fe010113          	addi	sp,sp,-32
c0010a9c:	00112e23          	sw	ra,28(sp)
c0010aa0:	00812c23          	sw	s0,24(sp)
c0010aa4:	00912a23          	sw	s1,20(sp)
c0010aa8:	00058413          	mv	s0,a1
c0010aac:	00060493          	mv	s1,a2
c0010ab0:	01212823          	sw	s2,16(sp)
c0010ab4:	01312623          	sw	s3,12(sp)
c0010ab8:	00050913          	mv	s2,a0
c0010abc:	01412423          	sw	s4,8(sp)
c0010ac0:	01512223          	sw	s5,4(sp)
c0010ac4:	01612023          	sw	s6,0(sp)
c0010ac8:	09c000ef          	jal	ra,c0010b64 <lock_sfs_io>
c0010acc:	03892503          	lw	a0,56(s2)
c0010ad0:	00001637          	lui	a2,0x1
c0010ad4:	00000593          	li	a1,0
c0010ad8:	0e1020ef          	jal	ra,c00133b8 <memset>
c0010adc:	00940b33          	add	s6,s0,s1
c0010ae0:	00490a93          	addi	s5,s2,4
c0010ae4:	02c90a13          	addi	s4,s2,44
c0010ae8:	00100993          	li	s3,1
c0010aec:	00049663          	bnez	s1,c0010af8 <sfs_clear_block+0x60>
c0010af0:	0640006f          	j	c0010b54 <sfs_clear_block+0xbc>
c0010af4:	07640063          	beq	s0,s6,c0010b54 <sfs_clear_block+0xbc>
c0010af8:	03892603          	lw	a2,56(s2)
c0010afc:	00040693          	mv	a3,s0
c0010b00:	00098793          	mv	a5,s3
c0010b04:	00100713          	li	a4,1
c0010b08:	000a0593          	mv	a1,s4
c0010b0c:	000a8513          	mv	a0,s5
c0010b10:	b71ff0ef          	jal	ra,c0010680 <sfs_rwblock_nolock.isra.0>
c0010b14:	00050493          	mv	s1,a0
c0010b18:	00140413          	addi	s0,s0,1
c0010b1c:	fc050ce3          	beqz	a0,c0010af4 <sfs_clear_block+0x5c>
c0010b20:	00090513          	mv	a0,s2
c0010b24:	050000ef          	jal	ra,c0010b74 <unlock_sfs_io>
c0010b28:	01c12083          	lw	ra,28(sp)
c0010b2c:	00048513          	mv	a0,s1
c0010b30:	01812403          	lw	s0,24(sp)
c0010b34:	01412483          	lw	s1,20(sp)
c0010b38:	01012903          	lw	s2,16(sp)
c0010b3c:	00c12983          	lw	s3,12(sp)
c0010b40:	00812a03          	lw	s4,8(sp)
c0010b44:	00412a83          	lw	s5,4(sp)
c0010b48:	00012b03          	lw	s6,0(sp)
c0010b4c:	02010113          	addi	sp,sp,32
c0010b50:	00008067          	ret
c0010b54:	00000493          	li	s1,0
c0010b58:	fc9ff06f          	j	c0010b20 <sfs_clear_block+0x88>

c0010b5c <lock_sfs_fs>:
c0010b5c:	03c50513          	addi	a0,a0,60
c0010b60:	ea1f506f          	j	c0006a00 <down>

c0010b64 <lock_sfs_io>:
c0010b64:	04850513          	addi	a0,a0,72
c0010b68:	e99f506f          	j	c0006a00 <down>

c0010b6c <unlock_sfs_fs>:
c0010b6c:	03c50513          	addi	a0,a0,60
c0010b70:	e8df506f          	j	c00069fc <up>

c0010b74 <unlock_sfs_io>:
c0010b74:	04850513          	addi	a0,a0,72
c0010b78:	e85f506f          	j	c00069fc <up>

c0010b7c <sfs_sync>:
c0010b7c:	fe010113          	addi	sp,sp,-32
c0010b80:	00112e23          	sw	ra,28(sp)
c0010b84:	00812c23          	sw	s0,24(sp)
c0010b88:	00912a23          	sw	s1,20(sp)
c0010b8c:	01212823          	sw	s2,16(sp)
c0010b90:	01312623          	sw	s3,12(sp)
c0010b94:	01412423          	sw	s4,8(sp)
c0010b98:	10050e63          	beqz	a0,c0010cb4 <sfs_sync+0x138>
c0010b9c:	06c52783          	lw	a5,108(a0)
c0010ba0:	00050a13          	mv	s4,a0
c0010ba4:	10079863          	bnez	a5,c0010cb4 <sfs_sync+0x138>
c0010ba8:	fb5ff0ef          	jal	ra,c0010b5c <lock_sfs_fs>
c0010bac:	064a2403          	lw	s0,100(s4) # 4064 <_binary_bin_swap_img_size-0x3c9c>
c0010bb0:	060a0913          	addi	s2,s4,96
c0010bb4:	06890263          	beq	s2,s0,c0010c18 <sfs_sync+0x9c>
c0010bb8:	fe440493          	addi	s1,s0,-28
c0010bbc:	0c048c63          	beqz	s1,c0010c94 <sfs_sync+0x118>
c0010bc0:	02042783          	lw	a5,32(s0)
c0010bc4:	0c078863          	beqz	a5,c0010c94 <sfs_sync+0x118>
c0010bc8:	0187a783          	lw	a5,24(a5) # 1018 <_binary_bin_swap_img_size-0x6ce8>
c0010bcc:	00005997          	auipc	s3,0x5
c0010bd0:	04498993          	addi	s3,s3,68 # c0015c10 <default_pmm_manager+0x920>
c0010bd4:	02079063          	bnez	a5,c0010bf4 <sfs_sync+0x78>
c0010bd8:	0bc0006f          	j	c0010c94 <sfs_sync+0x118>
c0010bdc:	fe440493          	addi	s1,s0,-28
c0010be0:	0a048a63          	beqz	s1,c0010c94 <sfs_sync+0x118>
c0010be4:	02042783          	lw	a5,32(s0)
c0010be8:	0a078663          	beqz	a5,c0010c94 <sfs_sync+0x118>
c0010bec:	0187a783          	lw	a5,24(a5)
c0010bf0:	0a078263          	beqz	a5,c0010c94 <sfs_sync+0x118>
c0010bf4:	00098593          	mv	a1,s3
c0010bf8:	00048513          	mv	a0,s1
c0010bfc:	edcfe0ef          	jal	ra,c000f2d8 <inode_check>
c0010c00:	02042783          	lw	a5,32(s0)
c0010c04:	00048513          	mv	a0,s1
c0010c08:	0187a783          	lw	a5,24(a5)
c0010c0c:	000780e7          	jalr	a5
c0010c10:	00442403          	lw	s0,4(s0)
c0010c14:	fc8914e3          	bne	s2,s0,c0010bdc <sfs_sync+0x60>
c0010c18:	000a0513          	mv	a0,s4
c0010c1c:	f51ff0ef          	jal	ra,c0010b6c <unlock_sfs_fs>
c0010c20:	034a2783          	lw	a5,52(s4)
c0010c24:	00000513          	li	a0,0
c0010c28:	02079263          	bnez	a5,c0010c4c <sfs_sync+0xd0>
c0010c2c:	01c12083          	lw	ra,28(sp)
c0010c30:	01812403          	lw	s0,24(sp)
c0010c34:	01412483          	lw	s1,20(sp)
c0010c38:	01012903          	lw	s2,16(sp)
c0010c3c:	00c12983          	lw	s3,12(sp)
c0010c40:	00812a03          	lw	s4,8(sp)
c0010c44:	02010113          	addi	sp,sp,32
c0010c48:	00008067          	ret
c0010c4c:	020a2a23          	sw	zero,52(s4)
c0010c50:	000a0513          	mv	a0,s4
c0010c54:	d71ff0ef          	jal	ra,c00109c4 <sfs_sync_super>
c0010c58:	02050663          	beqz	a0,c0010c84 <sfs_sync+0x108>
c0010c5c:	01c12083          	lw	ra,28(sp)
c0010c60:	00100793          	li	a5,1
c0010c64:	02fa2a23          	sw	a5,52(s4)
c0010c68:	01812403          	lw	s0,24(sp)
c0010c6c:	01412483          	lw	s1,20(sp)
c0010c70:	01012903          	lw	s2,16(sp)
c0010c74:	00c12983          	lw	s3,12(sp)
c0010c78:	00812a03          	lw	s4,8(sp)
c0010c7c:	02010113          	addi	sp,sp,32
c0010c80:	00008067          	ret
c0010c84:	000a0513          	mv	a0,s4
c0010c88:	db5ff0ef          	jal	ra,c0010a3c <sfs_sync_freemap>
c0010c8c:	fc0518e3          	bnez	a0,c0010c5c <sfs_sync+0xe0>
c0010c90:	f9dff06f          	j	c0010c2c <sfs_sync+0xb0>
c0010c94:	00005697          	auipc	a3,0x5
c0010c98:	f2c68693          	addi	a3,a3,-212 # c0015bc0 <default_pmm_manager+0x8d0>
c0010c9c:	00003617          	auipc	a2,0x3
c0010ca0:	18060613          	addi	a2,a2,384 # c0013e1c <commands+0x164>
c0010ca4:	01b00593          	li	a1,27
c0010ca8:	00006517          	auipc	a0,0x6
c0010cac:	71050513          	addi	a0,a0,1808 # c00173b8 <dev_node_ops+0x268>
c0010cb0:	e14ef0ef          	jal	ra,c00002c4 <__panic>
c0010cb4:	00006697          	auipc	a3,0x6
c0010cb8:	6d868693          	addi	a3,a3,1752 # c001738c <dev_node_ops+0x23c>
c0010cbc:	00003617          	auipc	a2,0x3
c0010cc0:	16060613          	addi	a2,a2,352 # c0013e1c <commands+0x164>
c0010cc4:	01500593          	li	a1,21
c0010cc8:	00006517          	auipc	a0,0x6
c0010ccc:	6f050513          	addi	a0,a0,1776 # c00173b8 <dev_node_ops+0x268>
c0010cd0:	df4ef0ef          	jal	ra,c00002c4 <__panic>

c0010cd4 <sfs_init_read>:
c0010cd4:	fe010113          	addi	sp,sp,-32
c0010cd8:	00060793          	mv	a5,a2
c0010cdc:	00812c23          	sw	s0,24(sp)
c0010ce0:	00c59693          	slli	a3,a1,0xc
c0010ce4:	00050413          	mv	s0,a0
c0010ce8:	00078593          	mv	a1,a5
c0010cec:	00001637          	lui	a2,0x1
c0010cf0:	00010513          	mv	a0,sp
c0010cf4:	00112e23          	sw	ra,28(sp)
c0010cf8:	c38f70ef          	jal	ra,c0008130 <iobuf_init>
c0010cfc:	01042783          	lw	a5,16(s0)
c0010d00:	00050593          	mv	a1,a0
c0010d04:	00000613          	li	a2,0
c0010d08:	00040513          	mv	a0,s0
c0010d0c:	000780e7          	jalr	a5
c0010d10:	01c12083          	lw	ra,28(sp)
c0010d14:	01812403          	lw	s0,24(sp)
c0010d18:	02010113          	addi	sp,sp,32
c0010d1c:	00008067          	ret

c0010d20 <sfs_unmount>:
c0010d20:	ff010113          	addi	sp,sp,-16
c0010d24:	00112623          	sw	ra,12(sp)
c0010d28:	00812423          	sw	s0,8(sp)
c0010d2c:	06050663          	beqz	a0,c0010d98 <sfs_unmount+0x78>
c0010d30:	06c52783          	lw	a5,108(a0)
c0010d34:	00050413          	mv	s0,a0
c0010d38:	06079063          	bnez	a5,c0010d98 <sfs_unmount+0x78>
c0010d3c:	06452703          	lw	a4,100(a0)
c0010d40:	06050793          	addi	a5,a0,96
c0010d44:	04f71063          	bne	a4,a5,c0010d84 <sfs_unmount+0x64>
c0010d48:	03452783          	lw	a5,52(a0)
c0010d4c:	06079663          	bnez	a5,c0010db8 <sfs_unmount+0x98>
c0010d50:	03052503          	lw	a0,48(a0)
c0010d54:	538020ef          	jal	ra,c001328c <bitmap_destroy>
c0010d58:	03842503          	lw	a0,56(s0)
c0010d5c:	9b0f20ef          	jal	ra,c0002f0c <kfree>
c0010d60:	06842503          	lw	a0,104(s0)
c0010d64:	9a8f20ef          	jal	ra,c0002f0c <kfree>
c0010d68:	00040513          	mv	a0,s0
c0010d6c:	9a0f20ef          	jal	ra,c0002f0c <kfree>
c0010d70:	00c12083          	lw	ra,12(sp)
c0010d74:	00000513          	li	a0,0
c0010d78:	00812403          	lw	s0,8(sp)
c0010d7c:	01010113          	addi	sp,sp,16
c0010d80:	00008067          	ret
c0010d84:	00c12083          	lw	ra,12(sp)
c0010d88:	ff100513          	li	a0,-15
c0010d8c:	00812403          	lw	s0,8(sp)
c0010d90:	01010113          	addi	sp,sp,16
c0010d94:	00008067          	ret
c0010d98:	00006697          	auipc	a3,0x6
c0010d9c:	5f468693          	addi	a3,a3,1524 # c001738c <dev_node_ops+0x23c>
c0010da0:	00003617          	auipc	a2,0x3
c0010da4:	07c60613          	addi	a2,a2,124 # c0013e1c <commands+0x164>
c0010da8:	04100593          	li	a1,65
c0010dac:	00006517          	auipc	a0,0x6
c0010db0:	60c50513          	addi	a0,a0,1548 # c00173b8 <dev_node_ops+0x268>
c0010db4:	d10ef0ef          	jal	ra,c00002c4 <__panic>
c0010db8:	00006697          	auipc	a3,0x6
c0010dbc:	61868693          	addi	a3,a3,1560 # c00173d0 <dev_node_ops+0x280>
c0010dc0:	00003617          	auipc	a2,0x3
c0010dc4:	05c60613          	addi	a2,a2,92 # c0013e1c <commands+0x164>
c0010dc8:	04500593          	li	a1,69
c0010dcc:	00006517          	auipc	a0,0x6
c0010dd0:	5ec50513          	addi	a0,a0,1516 # c00173b8 <dev_node_ops+0x268>
c0010dd4:	cf0ef0ef          	jal	ra,c00002c4 <__panic>

c0010dd8 <sfs_cleanup>:
c0010dd8:	ff010113          	addi	sp,sp,-16
c0010ddc:	00112623          	sw	ra,12(sp)
c0010de0:	00812423          	sw	s0,8(sp)
c0010de4:	00912223          	sw	s1,4(sp)
c0010de8:	01212023          	sw	s2,0(sp)
c0010dec:	08050e63          	beqz	a0,c0010e88 <sfs_cleanup+0xb0>
c0010df0:	06c52783          	lw	a5,108(a0)
c0010df4:	00050493          	mv	s1,a0
c0010df8:	08079863          	bnez	a5,c0010e88 <sfs_cleanup+0xb0>
c0010dfc:	00452703          	lw	a4,4(a0)
c0010e00:	00852683          	lw	a3,8(a0)
c0010e04:	00c50913          	addi	s2,a0,12
c0010e08:	00090593          	mv	a1,s2
c0010e0c:	40d70633          	sub	a2,a4,a3
c0010e10:	00006517          	auipc	a0,0x6
c0010e14:	44450513          	addi	a0,a0,1092 # c0017254 <dev_node_ops+0x104>
c0010e18:	b30ef0ef          	jal	ra,c0000148 <cprintf>
c0010e1c:	02000413          	li	s0,32
c0010e20:	00c0006f          	j	c0010e2c <sfs_cleanup+0x54>
c0010e24:	fff40413          	addi	s0,s0,-1
c0010e28:	02040663          	beqz	s0,c0010e54 <sfs_cleanup+0x7c>
c0010e2c:	0704a783          	lw	a5,112(s1)
c0010e30:	00048513          	mv	a0,s1
c0010e34:	000780e7          	jalr	a5
c0010e38:	fe0516e3          	bnez	a0,c0010e24 <sfs_cleanup+0x4c>
c0010e3c:	00c12083          	lw	ra,12(sp)
c0010e40:	00812403          	lw	s0,8(sp)
c0010e44:	00412483          	lw	s1,4(sp)
c0010e48:	00012903          	lw	s2,0(sp)
c0010e4c:	01010113          	addi	sp,sp,16
c0010e50:	00008067          	ret
c0010e54:	00090693          	mv	a3,s2
c0010e58:	00c12083          	lw	ra,12(sp)
c0010e5c:	00812403          	lw	s0,8(sp)
c0010e60:	00412483          	lw	s1,4(sp)
c0010e64:	00012903          	lw	s2,0(sp)
c0010e68:	00050713          	mv	a4,a0
c0010e6c:	00006617          	auipc	a2,0x6
c0010e70:	40860613          	addi	a2,a2,1032 # c0017274 <dev_node_ops+0x124>
c0010e74:	05f00593          	li	a1,95
c0010e78:	00006517          	auipc	a0,0x6
c0010e7c:	54050513          	addi	a0,a0,1344 # c00173b8 <dev_node_ops+0x268>
c0010e80:	01010113          	addi	sp,sp,16
c0010e84:	cc8ef06f          	j	c000034c <__warn>
c0010e88:	00006697          	auipc	a3,0x6
c0010e8c:	50468693          	addi	a3,a3,1284 # c001738c <dev_node_ops+0x23c>
c0010e90:	00003617          	auipc	a2,0x3
c0010e94:	f8c60613          	addi	a2,a2,-116 # c0013e1c <commands+0x164>
c0010e98:	05400593          	li	a1,84
c0010e9c:	00006517          	auipc	a0,0x6
c0010ea0:	51c50513          	addi	a0,a0,1308 # c00173b8 <dev_node_ops+0x268>
c0010ea4:	c20ef0ef          	jal	ra,c00002c4 <__panic>

c0010ea8 <sfs_get_root>:
c0010ea8:	fe010113          	addi	sp,sp,-32
c0010eac:	00112e23          	sw	ra,28(sp)
c0010eb0:	02050663          	beqz	a0,c0010edc <sfs_get_root+0x34>
c0010eb4:	06c52783          	lw	a5,108(a0)
c0010eb8:	02079263          	bnez	a5,c0010edc <sfs_get_root+0x34>
c0010ebc:	00100613          	li	a2,1
c0010ec0:	00c10593          	addi	a1,sp,12
c0010ec4:	0b1010ef          	jal	ra,c0012774 <sfs_load_inode>
c0010ec8:	02051a63          	bnez	a0,c0010efc <sfs_get_root+0x54>
c0010ecc:	01c12083          	lw	ra,28(sp)
c0010ed0:	00c12503          	lw	a0,12(sp)
c0010ed4:	02010113          	addi	sp,sp,32
c0010ed8:	00008067          	ret
c0010edc:	00006697          	auipc	a3,0x6
c0010ee0:	4b068693          	addi	a3,a3,1200 # c001738c <dev_node_ops+0x23c>
c0010ee4:	00003617          	auipc	a2,0x3
c0010ee8:	f3860613          	addi	a2,a2,-200 # c0013e1c <commands+0x164>
c0010eec:	03600593          	li	a1,54
c0010ef0:	00006517          	auipc	a0,0x6
c0010ef4:	4c850513          	addi	a0,a0,1224 # c00173b8 <dev_node_ops+0x268>
c0010ef8:	bccef0ef          	jal	ra,c00002c4 <__panic>
c0010efc:	00050693          	mv	a3,a0
c0010f00:	00006617          	auipc	a2,0x6
c0010f04:	47060613          	addi	a2,a2,1136 # c0017370 <dev_node_ops+0x220>
c0010f08:	03700593          	li	a1,55
c0010f0c:	00006517          	auipc	a0,0x6
c0010f10:	4ac50513          	addi	a0,a0,1196 # c00173b8 <dev_node_ops+0x268>
c0010f14:	bb0ef0ef          	jal	ra,c00002c4 <__panic>

c0010f18 <sfs_do_mount>:
c0010f18:	fa010113          	addi	sp,sp,-96
c0010f1c:	05212823          	sw	s2,80(sp)
c0010f20:	00452903          	lw	s2,4(a0)
c0010f24:	04112e23          	sw	ra,92(sp)
c0010f28:	04812c23          	sw	s0,88(sp)
c0010f2c:	04912a23          	sw	s1,84(sp)
c0010f30:	05312623          	sw	s3,76(sp)
c0010f34:	05412423          	sw	s4,72(sp)
c0010f38:	05512223          	sw	s5,68(sp)
c0010f3c:	05612023          	sw	s6,64(sp)
c0010f40:	03712e23          	sw	s7,60(sp)
c0010f44:	03812c23          	sw	s8,56(sp)
c0010f48:	03912a23          	sw	s9,52(sp)
c0010f4c:	03a12823          	sw	s10,48(sp)
c0010f50:	03b12623          	sw	s11,44(sp)
c0010f54:	000017b7          	lui	a5,0x1
c0010f58:	20f91463          	bne	s2,a5,c0011160 <sfs_do_mount+0x248>
c0010f5c:	00050493          	mv	s1,a0
c0010f60:	00000513          	li	a0,0
c0010f64:	00058a93          	mv	s5,a1
c0010f68:	85dfe0ef          	jal	ra,c000f7c4 <__alloc_fs>
c0010f6c:	00050413          	mv	s0,a0
c0010f70:	2e050263          	beqz	a0,c0011254 <sfs_do_mount+0x33c>
c0010f74:	06c52783          	lw	a5,108(a0)
c0010f78:	30079263          	bnez	a5,c001127c <sfs_do_mount+0x364>
c0010f7c:	02952623          	sw	s1,44(a0)
c0010f80:	00090513          	mv	a0,s2
c0010f84:	e69f10ef          	jal	ra,c0002dec <kmalloc>
c0010f88:	02a42c23          	sw	a0,56(s0)
c0010f8c:	00050913          	mv	s2,a0
c0010f90:	1e050863          	beqz	a0,c0011180 <sfs_do_mount+0x268>
c0010f94:	00050613          	mv	a2,a0
c0010f98:	00000593          	li	a1,0
c0010f9c:	00048513          	mv	a0,s1
c0010fa0:	d35ff0ef          	jal	ra,c0010cd4 <sfs_init_read>
c0010fa4:	00050a13          	mv	s4,a0
c0010fa8:	02051263          	bnez	a0,c0010fcc <sfs_do_mount+0xb4>
c0010fac:	00092583          	lw	a1,0(s2)
c0010fb0:	2f8dc637          	lui	a2,0x2f8dc
c0010fb4:	e2a60613          	addi	a2,a2,-470 # 2f8dbe2a <_binary_bin_sfs_img_size+0x2f866b2a>
c0010fb8:	06c58263          	beq	a1,a2,c001101c <sfs_do_mount+0x104>
c0010fbc:	00006517          	auipc	a0,0x6
c0010fc0:	2d450513          	addi	a0,a0,724 # c0017290 <dev_node_ops+0x140>
c0010fc4:	984ef0ef          	jal	ra,c0000148 <cprintf>
c0010fc8:	ffd00a13          	li	s4,-3
c0010fcc:	00090513          	mv	a0,s2
c0010fd0:	f3df10ef          	jal	ra,c0002f0c <kfree>
c0010fd4:	00040513          	mv	a0,s0
c0010fd8:	f35f10ef          	jal	ra,c0002f0c <kfree>
c0010fdc:	05c12083          	lw	ra,92(sp)
c0010fe0:	000a0513          	mv	a0,s4
c0010fe4:	05812403          	lw	s0,88(sp)
c0010fe8:	05412483          	lw	s1,84(sp)
c0010fec:	05012903          	lw	s2,80(sp)
c0010ff0:	04c12983          	lw	s3,76(sp)
c0010ff4:	04812a03          	lw	s4,72(sp)
c0010ff8:	04412a83          	lw	s5,68(sp)
c0010ffc:	04012b03          	lw	s6,64(sp)
c0011000:	03c12b83          	lw	s7,60(sp)
c0011004:	03812c03          	lw	s8,56(sp)
c0011008:	03412c83          	lw	s9,52(sp)
c001100c:	03012d03          	lw	s10,48(sp)
c0011010:	02c12d83          	lw	s11,44(sp)
c0011014:	06010113          	addi	sp,sp,96
c0011018:	00008067          	ret
c001101c:	00492783          	lw	a5,4(s2)
c0011020:	0004a603          	lw	a2,0(s1)
c0011024:	14f66263          	bltu	a2,a5,c0011168 <sfs_do_mount+0x250>
c0011028:	020905a3          	sb	zero,43(s2)
c001102c:	00b42023          	sw	a1,0(s0)
c0011030:	00492783          	lw	a5,4(s2)
c0011034:	00002537          	lui	a0,0x2
c0011038:	00f42223          	sw	a5,4(s0)
c001103c:	00892783          	lw	a5,8(s2)
c0011040:	00f42423          	sw	a5,8(s0)
c0011044:	00c92783          	lw	a5,12(s2)
c0011048:	00f42623          	sw	a5,12(s0)
c001104c:	01092783          	lw	a5,16(s2)
c0011050:	00f42823          	sw	a5,16(s0)
c0011054:	01492783          	lw	a5,20(s2)
c0011058:	00f42a23          	sw	a5,20(s0)
c001105c:	01892783          	lw	a5,24(s2)
c0011060:	00f42c23          	sw	a5,24(s0)
c0011064:	01c92783          	lw	a5,28(s2)
c0011068:	00f42e23          	sw	a5,28(s0)
c001106c:	02092783          	lw	a5,32(s2)
c0011070:	02f42023          	sw	a5,32(s0)
c0011074:	02492783          	lw	a5,36(s2)
c0011078:	02f42223          	sw	a5,36(s0)
c001107c:	02892783          	lw	a5,40(s2)
c0011080:	02f42423          	sw	a5,40(s0)
c0011084:	d69f10ef          	jal	ra,c0002dec <kmalloc>
c0011088:	06a42423          	sw	a0,104(s0)
c001108c:	00050b13          	mv	s6,a0
c0011090:	1a050a63          	beqz	a0,c0011244 <sfs_do_mount+0x32c>
c0011094:	00002737          	lui	a4,0x2
c0011098:	00050793          	mv	a5,a0
c001109c:	00e50733          	add	a4,a0,a4
c00110a0:	00f7a223          	sw	a5,4(a5) # 1004 <_binary_bin_swap_img_size-0x6cfc>
c00110a4:	00f7a023          	sw	a5,0(a5)
c00110a8:	00878793          	addi	a5,a5,8
c00110ac:	fef71ae3          	bne	a4,a5,c00110a0 <sfs_do_mount+0x188>
c00110b0:	00492c03          	lw	s8,4(s2)
c00110b4:	000089b7          	lui	s3,0x8
c00110b8:	fff98993          	addi	s3,s3,-1 # 7fff <_binary_bin_swap_img_size+0x2ff>
c00110bc:	ffff87b7          	lui	a5,0xffff8
c00110c0:	013c0c33          	add	s8,s8,s3
c00110c4:	00fc7c33          	and	s8,s8,a5
c00110c8:	000c0513          	mv	a0,s8
c00110cc:	721010ef          	jal	ra,c0012fec <bitmap_create>
c00110d0:	02a42823          	sw	a0,48(s0)
c00110d4:	00050c93          	mv	s9,a0
c00110d8:	16050a63          	beqz	a0,c001124c <sfs_do_mount+0x334>
c00110dc:	00492783          	lw	a5,4(s2)
c00110e0:	01c10593          	addi	a1,sp,28
c00110e4:	013789b3          	add	s3,a5,s3
c00110e8:	1d0020ef          	jal	ra,c00132b8 <bitmap_getdata>
c00110ec:	00f9d993          	srli	s3,s3,0xf
c00110f0:	00050b93          	mv	s7,a0
c00110f4:	1a050463          	beqz	a0,c001129c <sfs_do_mount+0x384>
c00110f8:	01c12783          	lw	a5,28(sp)
c00110fc:	00c99713          	slli	a4,s3,0xc
c0011100:	18f71e63          	bne	a4,a5,c001129c <sfs_do_mount+0x384>
c0011104:	00200d13          	li	s10,2
c0011108:	00001db7          	lui	s11,0x1
c001110c:	00099c63          	bnez	s3,c0011124 <sfs_do_mount+0x20c>
c0011110:	0780006f          	j	c0011188 <sfs_do_mount+0x270>
c0011114:	fff98993          	addi	s3,s3,-1
c0011118:	001d0d13          	addi	s10,s10,1
c001111c:	01bb8bb3          	add	s7,s7,s11
c0011120:	06098463          	beqz	s3,c0011188 <sfs_do_mount+0x270>
c0011124:	000b8613          	mv	a2,s7
c0011128:	000d0593          	mv	a1,s10
c001112c:	00048513          	mv	a0,s1
c0011130:	ba5ff0ef          	jal	ra,c0010cd4 <sfs_init_read>
c0011134:	fe0500e3          	beqz	a0,c0011114 <sfs_do_mount+0x1fc>
c0011138:	00a12623          	sw	a0,12(sp)
c001113c:	000c8513          	mv	a0,s9
c0011140:	14c020ef          	jal	ra,c001328c <bitmap_destroy>
c0011144:	00c12783          	lw	a5,12(sp)
c0011148:	000b0513          	mv	a0,s6
c001114c:	00f12623          	sw	a5,12(sp)
c0011150:	dbdf10ef          	jal	ra,c0002f0c <kfree>
c0011154:	00c12783          	lw	a5,12(sp)
c0011158:	00078a13          	mv	s4,a5
c001115c:	e71ff06f          	j	c0010fcc <sfs_do_mount+0xb4>
c0011160:	ff200a13          	li	s4,-14
c0011164:	e79ff06f          	j	c0010fdc <sfs_do_mount+0xc4>
c0011168:	00078593          	mv	a1,a5
c001116c:	00006517          	auipc	a0,0x6
c0011170:	15c50513          	addi	a0,a0,348 # c00172c8 <dev_node_ops+0x178>
c0011174:	fd5ee0ef          	jal	ra,c0000148 <cprintf>
c0011178:	ffd00a13          	li	s4,-3
c001117c:	e51ff06f          	j	c0010fcc <sfs_do_mount+0xb4>
c0011180:	ffc00a13          	li	s4,-4
c0011184:	e51ff06f          	j	c0010fd4 <sfs_do_mount+0xbc>
c0011188:	00442983          	lw	s3,4(s0)
c001118c:	00000913          	li	s2,0
c0011190:	00000493          	li	s1,0
c0011194:	020c0063          	beqz	s8,c00111b4 <sfs_do_mount+0x29c>
c0011198:	00048593          	mv	a1,s1
c001119c:	000c8513          	mv	a0,s9
c00111a0:	048020ef          	jal	ra,c00131e8 <bitmap_test>
c00111a4:	00a03533          	snez	a0,a0
c00111a8:	00148493          	addi	s1,s1,1
c00111ac:	00a90933          	add	s2,s2,a0
c00111b0:	fe9c14e3          	bne	s8,s1,c0011198 <sfs_do_mount+0x280>
c00111b4:	00842783          	lw	a5,8(s0)
c00111b8:	0b279263          	bne	a5,s2,c001125c <sfs_do_mount+0x344>
c00111bc:	00100593          	li	a1,1
c00111c0:	03c40513          	addi	a0,s0,60
c00111c4:	02042a23          	sw	zero,52(s0)
c00111c8:	829f50ef          	jal	ra,c00069f0 <sem_init>
c00111cc:	00100593          	li	a1,1
c00111d0:	04840513          	addi	a0,s0,72
c00111d4:	81df50ef          	jal	ra,c00069f0 <sem_init>
c00111d8:	00100593          	li	a1,1
c00111dc:	05440513          	addi	a0,s0,84
c00111e0:	811f50ef          	jal	ra,c00069f0 <sem_init>
c00111e4:	06040793          	addi	a5,s0,96
c00111e8:	06f42223          	sw	a5,100(s0)
c00111ec:	06f42023          	sw	a5,96(s0)
c00111f0:	00098713          	mv	a4,s3
c00111f4:	00090693          	mv	a3,s2
c00111f8:	41298633          	sub	a2,s3,s2
c00111fc:	00c40593          	addi	a1,s0,12
c0011200:	00006517          	auipc	a0,0x6
c0011204:	15050513          	addi	a0,a0,336 # c0017350 <dev_node_ops+0x200>
c0011208:	f41ee0ef          	jal	ra,c0000148 <cprintf>
c001120c:	00000797          	auipc	a5,0x0
c0011210:	97078793          	addi	a5,a5,-1680 # c0010b7c <sfs_sync>
c0011214:	06f42823          	sw	a5,112(s0)
c0011218:	00000797          	auipc	a5,0x0
c001121c:	c9078793          	addi	a5,a5,-880 # c0010ea8 <sfs_get_root>
c0011220:	06f42a23          	sw	a5,116(s0)
c0011224:	00000797          	auipc	a5,0x0
c0011228:	afc78793          	addi	a5,a5,-1284 # c0010d20 <sfs_unmount>
c001122c:	06f42c23          	sw	a5,120(s0)
c0011230:	00000797          	auipc	a5,0x0
c0011234:	ba878793          	addi	a5,a5,-1112 # c0010dd8 <sfs_cleanup>
c0011238:	06f42e23          	sw	a5,124(s0)
c001123c:	008aa023          	sw	s0,0(s5)
c0011240:	d9dff06f          	j	c0010fdc <sfs_do_mount+0xc4>
c0011244:	ffc00a13          	li	s4,-4
c0011248:	d85ff06f          	j	c0010fcc <sfs_do_mount+0xb4>
c001124c:	ffc00793          	li	a5,-4
c0011250:	ef9ff06f          	j	c0011148 <sfs_do_mount+0x230>
c0011254:	ffc00a13          	li	s4,-4
c0011258:	d85ff06f          	j	c0010fdc <sfs_do_mount+0xc4>
c001125c:	00006697          	auipc	a3,0x6
c0011260:	0c868693          	addi	a3,a3,200 # c0017324 <dev_node_ops+0x1d4>
c0011264:	00003617          	auipc	a2,0x3
c0011268:	bb860613          	addi	a2,a2,-1096 # c0013e1c <commands+0x164>
c001126c:	0e000593          	li	a1,224
c0011270:	00006517          	auipc	a0,0x6
c0011274:	14850513          	addi	a0,a0,328 # c00173b8 <dev_node_ops+0x268>
c0011278:	84cef0ef          	jal	ra,c00002c4 <__panic>
c001127c:	00006697          	auipc	a3,0x6
c0011280:	11068693          	addi	a3,a3,272 # c001738c <dev_node_ops+0x23c>
c0011284:	00003617          	auipc	a2,0x3
c0011288:	b9860613          	addi	a2,a2,-1128 # c0013e1c <commands+0x164>
c001128c:	0a300593          	li	a1,163
c0011290:	00006517          	auipc	a0,0x6
c0011294:	12850513          	addi	a0,a0,296 # c00173b8 <dev_node_ops+0x268>
c0011298:	82cef0ef          	jal	ra,c00002c4 <__panic>
c001129c:	00006697          	auipc	a3,0x6
c00112a0:	05c68693          	addi	a3,a3,92 # c00172f8 <dev_node_ops+0x1a8>
c00112a4:	00003617          	auipc	a2,0x3
c00112a8:	b7860613          	addi	a2,a2,-1160 # c0013e1c <commands+0x164>
c00112ac:	08300593          	li	a1,131
c00112b0:	00006517          	auipc	a0,0x6
c00112b4:	10850513          	addi	a0,a0,264 # c00173b8 <dev_node_ops+0x268>
c00112b8:	80cef0ef          	jal	ra,c00002c4 <__panic>

c00112bc <sfs_mount>:
c00112bc:	00000597          	auipc	a1,0x0
c00112c0:	c5c58593          	addi	a1,a1,-932 # c0010f18 <sfs_do_mount>
c00112c4:	8b1fd06f          	j	c000eb74 <vfs_mount>

c00112c8 <sfs_opendir>:
c00112c8:	0035f793          	andi	a5,a1,3
c00112cc:	00079c63          	bnez	a5,c00112e4 <sfs_opendir+0x1c>
c00112d0:	0205f593          	andi	a1,a1,32
c00112d4:	fef00513          	li	a0,-17
c00112d8:	00059863          	bnez	a1,c00112e8 <sfs_opendir+0x20>
c00112dc:	00000513          	li	a0,0
c00112e0:	00008067          	ret
c00112e4:	fef00513          	li	a0,-17
c00112e8:	00008067          	ret

c00112ec <sfs_openfile>:
c00112ec:	00000513          	li	a0,0
c00112f0:	00008067          	ret

c00112f4 <sfs_fsync>:
c00112f4:	fe010113          	addi	sp,sp,-32
c00112f8:	00912a23          	sw	s1,20(sp)
c00112fc:	03852483          	lw	s1,56(a0)
c0011300:	00112e23          	sw	ra,28(sp)
c0011304:	00812c23          	sw	s0,24(sp)
c0011308:	01212823          	sw	s2,16(sp)
c001130c:	01312623          	sw	s3,12(sp)
c0011310:	0a048c63          	beqz	s1,c00113c8 <sfs_fsync+0xd4>
c0011314:	06c4a783          	lw	a5,108(s1)
c0011318:	0a079863          	bnez	a5,c00113c8 <sfs_fsync+0xd4>
c001131c:	02c52703          	lw	a4,44(a0)
c0011320:	000017b7          	lui	a5,0x1
c0011324:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
c0011328:	00050413          	mv	s0,a0
c001132c:	0af71e63          	bne	a4,a5,c00113e8 <sfs_fsync+0xf4>
c0011330:	00852783          	lw	a5,8(a0)
c0011334:	00000913          	li	s2,0
c0011338:	02079263          	bnez	a5,c001135c <sfs_fsync+0x68>
c001133c:	01c12083          	lw	ra,28(sp)
c0011340:	00090513          	mv	a0,s2
c0011344:	01812403          	lw	s0,24(sp)
c0011348:	01412483          	lw	s1,20(sp)
c001134c:	01012903          	lw	s2,16(sp)
c0011350:	00c12983          	lw	s3,12(sp)
c0011354:	02010113          	addi	sp,sp,32
c0011358:	00008067          	ret
c001135c:	01050993          	addi	s3,a0,16
c0011360:	00098513          	mv	a0,s3
c0011364:	e9cf50ef          	jal	ra,c0006a00 <down>
c0011368:	00842783          	lw	a5,8(s0)
c001136c:	02079663          	bnez	a5,c0011398 <sfs_fsync+0xa4>
c0011370:	00098513          	mv	a0,s3
c0011374:	e88f50ef          	jal	ra,c00069fc <up>
c0011378:	01c12083          	lw	ra,28(sp)
c001137c:	00090513          	mv	a0,s2
c0011380:	01812403          	lw	s0,24(sp)
c0011384:	01412483          	lw	s1,20(sp)
c0011388:	01012903          	lw	s2,16(sp)
c001138c:	00c12983          	lw	s3,12(sp)
c0011390:	02010113          	addi	sp,sp,32
c0011394:	00008067          	ret
c0011398:	00442683          	lw	a3,4(s0)
c001139c:	00042583          	lw	a1,0(s0)
c00113a0:	00042423          	sw	zero,8(s0)
c00113a4:	00000713          	li	a4,0
c00113a8:	04000613          	li	a2,64
c00113ac:	00048513          	mv	a0,s1
c00113b0:	d0cff0ef          	jal	ra,c00108bc <sfs_wbuf>
c00113b4:	00050913          	mv	s2,a0
c00113b8:	fa050ce3          	beqz	a0,c0011370 <sfs_fsync+0x7c>
c00113bc:	00100793          	li	a5,1
c00113c0:	00f42423          	sw	a5,8(s0)
c00113c4:	fadff06f          	j	c0011370 <sfs_fsync+0x7c>
c00113c8:	00006697          	auipc	a3,0x6
c00113cc:	fc468693          	addi	a3,a3,-60 # c001738c <dev_node_ops+0x23c>
c00113d0:	00003617          	auipc	a2,0x3
c00113d4:	a4c60613          	addi	a2,a2,-1460 # c0013e1c <commands+0x164>
c00113d8:	2c700593          	li	a1,711
c00113dc:	00006517          	auipc	a0,0x6
c00113e0:	14c50513          	addi	a0,a0,332 # c0017528 <dev_node_ops+0x3d8>
c00113e4:	ee1ee0ef          	jal	ra,c00002c4 <__panic>
c00113e8:	00006697          	auipc	a3,0x6
c00113ec:	15868693          	addi	a3,a3,344 # c0017540 <dev_node_ops+0x3f0>
c00113f0:	00003617          	auipc	a2,0x3
c00113f4:	a2c60613          	addi	a2,a2,-1492 # c0013e1c <commands+0x164>
c00113f8:	2c800593          	li	a1,712
c00113fc:	00006517          	auipc	a0,0x6
c0011400:	12c50513          	addi	a0,a0,300 # c0017528 <dev_node_ops+0x3d8>
c0011404:	ec1ee0ef          	jal	ra,c00002c4 <__panic>

c0011408 <sfs_gettype>:
c0011408:	ff010113          	addi	sp,sp,-16
c001140c:	00112623          	sw	ra,12(sp)
c0011410:	06050e63          	beqz	a0,c001148c <sfs_gettype+0x84>
c0011414:	02c52683          	lw	a3,44(a0)
c0011418:	000017b7          	lui	a5,0x1
c001141c:	23578713          	addi	a4,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
c0011420:	06e69663          	bne	a3,a4,c001148c <sfs_gettype+0x84>
c0011424:	00052683          	lw	a3,0(a0)
c0011428:	00200713          	li	a4,2
c001142c:	0046d683          	lhu	a3,4(a3)
c0011430:	04e68263          	beq	a3,a4,c0011474 <sfs_gettype+0x6c>
c0011434:	00300713          	li	a4,3
c0011438:	02e68263          	beq	a3,a4,c001145c <sfs_gettype+0x54>
c001143c:	00100713          	li	a4,1
c0011440:	02e68063          	beq	a3,a4,c0011460 <sfs_gettype+0x58>
c0011444:	00006617          	auipc	a2,0x6
c0011448:	13460613          	addi	a2,a2,308 # c0017578 <dev_node_ops+0x428>
c001144c:	38f00593          	li	a1,911
c0011450:	00006517          	auipc	a0,0x6
c0011454:	0d850513          	addi	a0,a0,216 # c0017528 <dev_node_ops+0x3d8>
c0011458:	e6dee0ef          	jal	ra,c00002c4 <__panic>
c001145c:	000037b7          	lui	a5,0x3
c0011460:	00c12083          	lw	ra,12(sp)
c0011464:	00000513          	li	a0,0
c0011468:	00f5a023          	sw	a5,0(a1)
c001146c:	01010113          	addi	sp,sp,16
c0011470:	00008067          	ret
c0011474:	00c12083          	lw	ra,12(sp)
c0011478:	000027b7          	lui	a5,0x2
c001147c:	00000513          	li	a0,0
c0011480:	00f5a023          	sw	a5,0(a1)
c0011484:	01010113          	addi	sp,sp,16
c0011488:	00008067          	ret
c001148c:	00006697          	auipc	a3,0x6
c0011490:	0b468693          	addi	a3,a3,180 # c0017540 <dev_node_ops+0x3f0>
c0011494:	00003617          	auipc	a2,0x3
c0011498:	98860613          	addi	a2,a2,-1656 # c0013e1c <commands+0x164>
c001149c:	38300593          	li	a1,899
c00114a0:	00006517          	auipc	a0,0x6
c00114a4:	08850513          	addi	a0,a0,136 # c0017528 <dev_node_ops+0x3d8>
c00114a8:	e1dee0ef          	jal	ra,c00002c4 <__panic>

c00114ac <sfs_block_inuse.isra.3>:
c00114ac:	ff010113          	addi	sp,sp,-16
c00114b0:	00112623          	sw	ra,12(sp)
c00114b4:	02060263          	beqz	a2,c00114d8 <sfs_block_inuse.isra.3+0x2c>
c00114b8:	02a67063          	bleu	a0,a2,c00114d8 <sfs_block_inuse.isra.3+0x2c>
c00114bc:	0005a503          	lw	a0,0(a1)
c00114c0:	00060593          	mv	a1,a2
c00114c4:	525010ef          	jal	ra,c00131e8 <bitmap_test>
c00114c8:	00c12083          	lw	ra,12(sp)
c00114cc:	00153513          	seqz	a0,a0
c00114d0:	01010113          	addi	sp,sp,16
c00114d4:	00008067          	ret
c00114d8:	00060713          	mv	a4,a2
c00114dc:	00050693          	mv	a3,a0
c00114e0:	00006617          	auipc	a2,0x6
c00114e4:	f4860613          	addi	a2,a2,-184 # c0017428 <dev_node_ops+0x2d8>
c00114e8:	05300593          	li	a1,83
c00114ec:	00006517          	auipc	a0,0x6
c00114f0:	03c50513          	addi	a0,a0,60 # c0017528 <dev_node_ops+0x3d8>
c00114f4:	dd1ee0ef          	jal	ra,c00002c4 <__panic>

c00114f8 <sfs_block_alloc>:
c00114f8:	ff010113          	addi	sp,sp,-16
c00114fc:	00812423          	sw	s0,8(sp)
c0011500:	00050413          	mv	s0,a0
c0011504:	03052503          	lw	a0,48(a0)
c0011508:	00912223          	sw	s1,4(sp)
c001150c:	00112623          	sw	ra,12(sp)
c0011510:	01212023          	sw	s2,0(sp)
c0011514:	00058493          	mv	s1,a1
c0011518:	425010ef          	jal	ra,c001313c <bitmap_alloc>
c001151c:	04051a63          	bnez	a0,c0011570 <sfs_block_alloc+0x78>
c0011520:	00842783          	lw	a5,8(s0)
c0011524:	08078263          	beqz	a5,c00115a8 <sfs_block_alloc+0xb0>
c0011528:	fff78793          	addi	a5,a5,-1 # 1fff <_binary_bin_swap_img_size-0x5d01>
c001152c:	00100913          	li	s2,1
c0011530:	00f42423          	sw	a5,8(s0)
c0011534:	03242a23          	sw	s2,52(s0)
c0011538:	0004a603          	lw	a2,0(s1)
c001153c:	00442503          	lw	a0,4(s0)
c0011540:	03040593          	addi	a1,s0,48
c0011544:	f69ff0ef          	jal	ra,c00114ac <sfs_block_inuse.isra.3>
c0011548:	04050063          	beqz	a0,c0011588 <sfs_block_alloc+0x90>
c001154c:	0004a583          	lw	a1,0(s1)
c0011550:	00090613          	mv	a2,s2
c0011554:	00040513          	mv	a0,s0
c0011558:	00c12083          	lw	ra,12(sp)
c001155c:	00812403          	lw	s0,8(sp)
c0011560:	00412483          	lw	s1,4(sp)
c0011564:	00012903          	lw	s2,0(sp)
c0011568:	01010113          	addi	sp,sp,16
c001156c:	d2cff06f          	j	c0010a98 <sfs_clear_block>
c0011570:	00c12083          	lw	ra,12(sp)
c0011574:	00812403          	lw	s0,8(sp)
c0011578:	00412483          	lw	s1,4(sp)
c001157c:	00012903          	lw	s2,0(sp)
c0011580:	01010113          	addi	sp,sp,16
c0011584:	00008067          	ret
c0011588:	00006697          	auipc	a3,0x6
c001158c:	e7c68693          	addi	a3,a3,-388 # c0017404 <dev_node_ops+0x2b4>
c0011590:	00003617          	auipc	a2,0x3
c0011594:	88c60613          	addi	a2,a2,-1908 # c0013e1c <commands+0x164>
c0011598:	06100593          	li	a1,97
c001159c:	00006517          	auipc	a0,0x6
c00115a0:	f8c50513          	addi	a0,a0,-116 # c0017528 <dev_node_ops+0x3d8>
c00115a4:	d21ee0ef          	jal	ra,c00002c4 <__panic>
c00115a8:	00006697          	auipc	a3,0x6
c00115ac:	e3c68693          	addi	a3,a3,-452 # c00173e4 <dev_node_ops+0x294>
c00115b0:	00003617          	auipc	a2,0x3
c00115b4:	86c60613          	addi	a2,a2,-1940 # c0013e1c <commands+0x164>
c00115b8:	05f00593          	li	a1,95
c00115bc:	00006517          	auipc	a0,0x6
c00115c0:	f6c50513          	addi	a0,a0,-148 # c0017528 <dev_node_ops+0x3d8>
c00115c4:	d01ee0ef          	jal	ra,c00002c4 <__panic>

c00115c8 <sfs_block_free>:
c00115c8:	ff010113          	addi	sp,sp,-16
c00115cc:	00812423          	sw	s0,8(sp)
c00115d0:	00050413          	mv	s0,a0
c00115d4:	00452503          	lw	a0,4(a0)
c00115d8:	00912223          	sw	s1,4(sp)
c00115dc:	00058613          	mv	a2,a1
c00115e0:	00058493          	mv	s1,a1
c00115e4:	03040593          	addi	a1,s0,48
c00115e8:	00112623          	sw	ra,12(sp)
c00115ec:	ec1ff0ef          	jal	ra,c00114ac <sfs_block_inuse.isra.3>
c00115f0:	02050c63          	beqz	a0,c0011628 <sfs_block_free+0x60>
c00115f4:	03042503          	lw	a0,48(s0)
c00115f8:	00048593          	mv	a1,s1
c00115fc:	425010ef          	jal	ra,c0013220 <bitmap_free>
c0011600:	00842783          	lw	a5,8(s0)
c0011604:	00c12083          	lw	ra,12(sp)
c0011608:	00100713          	li	a4,1
c001160c:	00e787b3          	add	a5,a5,a4
c0011610:	02e42a23          	sw	a4,52(s0)
c0011614:	00f42423          	sw	a5,8(s0)
c0011618:	00412483          	lw	s1,4(sp)
c001161c:	00812403          	lw	s0,8(sp)
c0011620:	01010113          	addi	sp,sp,16
c0011624:	00008067          	ret
c0011628:	00006697          	auipc	a3,0x6
c001162c:	e9868693          	addi	a3,a3,-360 # c00174c0 <dev_node_ops+0x370>
c0011630:	00002617          	auipc	a2,0x2
c0011634:	7ec60613          	addi	a2,a2,2028 # c0013e1c <commands+0x164>
c0011638:	06a00593          	li	a1,106
c001163c:	00006517          	auipc	a0,0x6
c0011640:	eec50513          	addi	a0,a0,-276 # c0017528 <dev_node_ops+0x3d8>
c0011644:	c81ee0ef          	jal	ra,c00002c4 <__panic>

c0011648 <sfs_reclaim>:
c0011648:	ff010113          	addi	sp,sp,-16
c001164c:	00912223          	sw	s1,4(sp)
c0011650:	03852483          	lw	s1,56(a0)
c0011654:	00112623          	sw	ra,12(sp)
c0011658:	00812423          	sw	s0,8(sp)
c001165c:	01212023          	sw	s2,0(sp)
c0011660:	16048e63          	beqz	s1,c00117dc <sfs_reclaim+0x194>
c0011664:	06c4a783          	lw	a5,108(s1)
c0011668:	16079a63          	bnez	a5,c00117dc <sfs_reclaim+0x194>
c001166c:	02c52703          	lw	a4,44(a0)
c0011670:	000017b7          	lui	a5,0x1
c0011674:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
c0011678:	00050413          	mv	s0,a0
c001167c:	18f71063          	bne	a4,a5,c00117fc <sfs_reclaim+0x1b4>
c0011680:	00048513          	mv	a0,s1
c0011684:	cd8ff0ef          	jal	ra,c0010b5c <lock_sfs_fs>
c0011688:	00c42783          	lw	a5,12(s0)
c001168c:	18f05863          	blez	a5,c001181c <sfs_reclaim+0x1d4>
c0011690:	fff78793          	addi	a5,a5,-1
c0011694:	00f42623          	sw	a5,12(s0)
c0011698:	00079663          	bnez	a5,c00116a4 <sfs_reclaim+0x5c>
c001169c:	03042783          	lw	a5,48(s0)
c00116a0:	02078663          	beqz	a5,c00116cc <sfs_reclaim+0x84>
c00116a4:	ff100913          	li	s2,-15
c00116a8:	00048513          	mv	a0,s1
c00116ac:	cc0ff0ef          	jal	ra,c0010b6c <unlock_sfs_fs>
c00116b0:	00c12083          	lw	ra,12(sp)
c00116b4:	00090513          	mv	a0,s2
c00116b8:	00812403          	lw	s0,8(sp)
c00116bc:	00412483          	lw	s1,4(sp)
c00116c0:	00012903          	lw	s2,0(sp)
c00116c4:	01010113          	addi	sp,sp,16
c00116c8:	00008067          	ret
c00116cc:	00042783          	lw	a5,0(s0)
c00116d0:	0067d783          	lhu	a5,6(a5)
c00116d4:	04079063          	bnez	a5,c0011714 <sfs_reclaim+0xcc>
c00116d8:	03c42783          	lw	a5,60(s0)
c00116dc:	18078063          	beqz	a5,c001185c <sfs_reclaim+0x214>
c00116e0:	0307a783          	lw	a5,48(a5)
c00116e4:	16078c63          	beqz	a5,c001185c <sfs_reclaim+0x214>
c00116e8:	00005597          	auipc	a1,0x5
c00116ec:	7f458593          	addi	a1,a1,2036 # c0016edc <syscalls+0xa14>
c00116f0:	00040513          	mv	a0,s0
c00116f4:	be5fd0ef          	jal	ra,c000f2d8 <inode_check>
c00116f8:	03c42783          	lw	a5,60(s0)
c00116fc:	00000593          	li	a1,0
c0011700:	00040513          	mv	a0,s0
c0011704:	0307a783          	lw	a5,48(a5)
c0011708:	000780e7          	jalr	a5
c001170c:	00050913          	mv	s2,a0
c0011710:	f8051ce3          	bnez	a0,c00116a8 <sfs_reclaim+0x60>
c0011714:	00842783          	lw	a5,8(s0)
c0011718:	02078e63          	beqz	a5,c0011754 <sfs_reclaim+0x10c>
c001171c:	03c42783          	lw	a5,60(s0)
c0011720:	10078e63          	beqz	a5,c001183c <sfs_reclaim+0x1f4>
c0011724:	0187a783          	lw	a5,24(a5)
c0011728:	10078a63          	beqz	a5,c001183c <sfs_reclaim+0x1f4>
c001172c:	00004597          	auipc	a1,0x4
c0011730:	4e458593          	addi	a1,a1,1252 # c0015c10 <default_pmm_manager+0x920>
c0011734:	00040513          	mv	a0,s0
c0011738:	ba1fd0ef          	jal	ra,c000f2d8 <inode_check>
c001173c:	03c42783          	lw	a5,60(s0)
c0011740:	00040513          	mv	a0,s0
c0011744:	0187a783          	lw	a5,24(a5)
c0011748:	000780e7          	jalr	a5
c001174c:	00050913          	mv	s2,a0
c0011750:	f4051ce3          	bnez	a0,c00116a8 <sfs_reclaim+0x60>
c0011754:	01c42703          	lw	a4,28(s0)
c0011758:	02042783          	lw	a5,32(s0)
c001175c:	00048513          	mv	a0,s1
c0011760:	00f72223          	sw	a5,4(a4) # 2004 <_binary_bin_swap_img_size-0x5cfc>
c0011764:	00e7a023          	sw	a4,0(a5)
c0011768:	02442703          	lw	a4,36(s0)
c001176c:	02842783          	lw	a5,40(s0)
c0011770:	00f72223          	sw	a5,4(a4)
c0011774:	00e7a023          	sw	a4,0(a5)
c0011778:	bf4ff0ef          	jal	ra,c0010b6c <unlock_sfs_fs>
c001177c:	00042503          	lw	a0,0(s0)
c0011780:	00655783          	lhu	a5,6(a0)
c0011784:	02078863          	beqz	a5,c00117b4 <sfs_reclaim+0x16c>
c0011788:	f84f10ef          	jal	ra,c0002f0c <kfree>
c001178c:	00040513          	mv	a0,s0
c0011790:	abdfd0ef          	jal	ra,c000f24c <inode_kill>
c0011794:	00c12083          	lw	ra,12(sp)
c0011798:	00000913          	li	s2,0
c001179c:	00090513          	mv	a0,s2
c00117a0:	00812403          	lw	s0,8(sp)
c00117a4:	00412483          	lw	s1,4(sp)
c00117a8:	00012903          	lw	s2,0(sp)
c00117ac:	01010113          	addi	sp,sp,16
c00117b0:	00008067          	ret
c00117b4:	00442583          	lw	a1,4(s0)
c00117b8:	00048513          	mv	a0,s1
c00117bc:	e0dff0ef          	jal	ra,c00115c8 <sfs_block_free>
c00117c0:	00042503          	lw	a0,0(s0)
c00117c4:	03c52583          	lw	a1,60(a0)
c00117c8:	fc0580e3          	beqz	a1,c0011788 <sfs_reclaim+0x140>
c00117cc:	00048513          	mv	a0,s1
c00117d0:	df9ff0ef          	jal	ra,c00115c8 <sfs_block_free>
c00117d4:	00042503          	lw	a0,0(s0)
c00117d8:	fb1ff06f          	j	c0011788 <sfs_reclaim+0x140>
c00117dc:	00006697          	auipc	a3,0x6
c00117e0:	bb068693          	addi	a3,a3,-1104 # c001738c <dev_node_ops+0x23c>
c00117e4:	00002617          	auipc	a2,0x2
c00117e8:	63860613          	addi	a2,a2,1592 # c0013e1c <commands+0x164>
c00117ec:	35800593          	li	a1,856
c00117f0:	00006517          	auipc	a0,0x6
c00117f4:	d3850513          	addi	a0,a0,-712 # c0017528 <dev_node_ops+0x3d8>
c00117f8:	acdee0ef          	jal	ra,c00002c4 <__panic>
c00117fc:	00006697          	auipc	a3,0x6
c0011800:	d4468693          	addi	a3,a3,-700 # c0017540 <dev_node_ops+0x3f0>
c0011804:	00002617          	auipc	a2,0x2
c0011808:	61860613          	addi	a2,a2,1560 # c0013e1c <commands+0x164>
c001180c:	35900593          	li	a1,857
c0011810:	00006517          	auipc	a0,0x6
c0011814:	d1850513          	addi	a0,a0,-744 # c0017528 <dev_node_ops+0x3d8>
c0011818:	aadee0ef          	jal	ra,c00002c4 <__panic>
c001181c:	00006697          	auipc	a3,0x6
c0011820:	ea068693          	addi	a3,a3,-352 # c00176bc <sfs_node_fileops+0x40>
c0011824:	00002617          	auipc	a2,0x2
c0011828:	5f860613          	addi	a2,a2,1528 # c0013e1c <commands+0x164>
c001182c:	35e00593          	li	a1,862
c0011830:	00006517          	auipc	a0,0x6
c0011834:	cf850513          	addi	a0,a0,-776 # c0017528 <dev_node_ops+0x3d8>
c0011838:	a8dee0ef          	jal	ra,c00002c4 <__panic>
c001183c:	00004697          	auipc	a3,0x4
c0011840:	38468693          	addi	a3,a3,900 # c0015bc0 <default_pmm_manager+0x8d0>
c0011844:	00002617          	auipc	a2,0x2
c0011848:	5d860613          	addi	a2,a2,1496 # c0013e1c <commands+0x164>
c001184c:	36800593          	li	a1,872
c0011850:	00006517          	auipc	a0,0x6
c0011854:	cd850513          	addi	a0,a0,-808 # c0017528 <dev_node_ops+0x3d8>
c0011858:	a6dee0ef          	jal	ra,c00002c4 <__panic>
c001185c:	00005697          	auipc	a3,0x5
c0011860:	62c68693          	addi	a3,a3,1580 # c0016e88 <syscalls+0x9c0>
c0011864:	00002617          	auipc	a2,0x2
c0011868:	5b860613          	addi	a2,a2,1464 # c0013e1c <commands+0x164>
c001186c:	36300593          	li	a1,867
c0011870:	00006517          	auipc	a0,0x6
c0011874:	cb850513          	addi	a0,a0,-840 # c0017528 <dev_node_ops+0x3d8>
c0011878:	a4dee0ef          	jal	ra,c00002c4 <__panic>

c001187c <sfs_bmap_load_nolock>:
c001187c:	fc010113          	addi	sp,sp,-64
c0011880:	03212823          	sw	s2,48(sp)
c0011884:	0005a903          	lw	s2,0(a1)
c0011888:	03412423          	sw	s4,40(sp)
c001188c:	02112e23          	sw	ra,60(sp)
c0011890:	00892a03          	lw	s4,8(s2)
c0011894:	02812c23          	sw	s0,56(sp)
c0011898:	02912a23          	sw	s1,52(sp)
c001189c:	03312623          	sw	s3,44(sp)
c00118a0:	03512223          	sw	s5,36(sp)
c00118a4:	03612023          	sw	s6,32(sp)
c00118a8:	01712e23          	sw	s7,28(sp)
c00118ac:	01812c23          	sw	s8,24(sp)
c00118b0:	01912a23          	sw	s9,20(sp)
c00118b4:	22ca6a63          	bltu	s4,a2,c0011ae8 <sfs_bmap_load_nolock+0x26c>
c00118b8:	00b00793          	li	a5,11
c00118bc:	00058a93          	mv	s5,a1
c00118c0:	00060413          	mv	s0,a2
c00118c4:	00050993          	mv	s3,a0
c00118c8:	00068b93          	mv	s7,a3
c00118cc:	08c7fc63          	bleu	a2,a5,c0011964 <sfs_bmap_load_nolock+0xe8>
c00118d0:	ff460713          	addi	a4,a2,-12
c00118d4:	3ff00793          	li	a5,1023
c00118d8:	22e7e863          	bltu	a5,a4,c0011b08 <sfs_bmap_load_nolock+0x28c>
c00118dc:	03c92c03          	lw	s8,60(s2)
c00118e0:	00012623          	sw	zero,12(sp)
c00118e4:	00271b13          	slli	s6,a4,0x2
c00118e8:	01812423          	sw	s8,8(sp)
c00118ec:	140c1a63          	bnez	s8,c0011a40 <sfs_bmap_load_nolock+0x1c4>
c00118f0:	18ca0863          	beq	s4,a2,c0011a80 <sfs_bmap_load_nolock+0x204>
c00118f4:	03098a93          	addi	s5,s3,48
c00118f8:	00000493          	li	s1,0
c00118fc:	0049a503          	lw	a0,4(s3)
c0011900:	00048613          	mv	a2,s1
c0011904:	000a8593          	mv	a1,s5
c0011908:	ba5ff0ef          	jal	ra,c00114ac <sfs_block_inuse.isra.3>
c001190c:	08050263          	beqz	a0,c0011990 <sfs_bmap_load_nolock+0x114>
c0011910:	008a1863          	bne	s4,s0,c0011920 <sfs_bmap_load_nolock+0xa4>
c0011914:	00892783          	lw	a5,8(s2)
c0011918:	00178793          	addi	a5,a5,1
c001191c:	00f92423          	sw	a5,8(s2)
c0011920:	1a0b8863          	beqz	s7,c0011ad0 <sfs_bmap_load_nolock+0x254>
c0011924:	009ba023          	sw	s1,0(s7) # 1000 <_binary_bin_swap_img_size-0x6d00>
c0011928:	00000493          	li	s1,0
c001192c:	03c12083          	lw	ra,60(sp)
c0011930:	00048513          	mv	a0,s1
c0011934:	03812403          	lw	s0,56(sp)
c0011938:	03412483          	lw	s1,52(sp)
c001193c:	03012903          	lw	s2,48(sp)
c0011940:	02c12983          	lw	s3,44(sp)
c0011944:	02812a03          	lw	s4,40(sp)
c0011948:	02412a83          	lw	s5,36(sp)
c001194c:	02012b03          	lw	s6,32(sp)
c0011950:	01c12b83          	lw	s7,28(sp)
c0011954:	01812c03          	lw	s8,24(sp)
c0011958:	01412c83          	lw	s9,20(sp)
c001195c:	04010113          	addi	sp,sp,64
c0011960:	00008067          	ret
c0011964:	00261b13          	slli	s6,a2,0x2
c0011968:	01690b33          	add	s6,s2,s6
c001196c:	00cb2483          	lw	s1,12(s6)
c0011970:	00912223          	sw	s1,4(sp)
c0011974:	08049263          	bnez	s1,c00119f8 <sfs_bmap_load_nolock+0x17c>
c0011978:	0aca0063          	beq	s4,a2,c0011a18 <sfs_bmap_load_nolock+0x19c>
c001197c:	00452503          	lw	a0,4(a0)
c0011980:	00000613          	li	a2,0
c0011984:	03098593          	addi	a1,s3,48
c0011988:	b25ff0ef          	jal	ra,c00114ac <sfs_block_inuse.isra.3>
c001198c:	f8051ae3          	bnez	a0,c0011920 <sfs_bmap_load_nolock+0xa4>
c0011990:	00006697          	auipc	a3,0x6
c0011994:	b3068693          	addi	a3,a3,-1232 # c00174c0 <dev_node_ops+0x370>
c0011998:	00002617          	auipc	a2,0x2
c001199c:	48460613          	addi	a2,a2,1156 # c0013e1c <commands+0x164>
c00119a0:	16b00593          	li	a1,363
c00119a4:	00006517          	auipc	a0,0x6
c00119a8:	b8450513          	addi	a0,a0,-1148 # c0017528 <dev_node_ops+0x3d8>
c00119ac:	919ee0ef          	jal	ra,c00002c4 <__panic>
c00119b0:	00812683          	lw	a3,8(sp)
c00119b4:	000b0713          	mv	a4,s6
c00119b8:	00400613          	li	a2,4
c00119bc:	000c8593          	mv	a1,s9
c00119c0:	00098513          	mv	a0,s3
c00119c4:	ef9fe0ef          	jal	ra,c00108bc <sfs_wbuf>
c00119c8:	00050493          	mv	s1,a0
c00119cc:	10051663          	bnez	a0,c0011ad8 <sfs_bmap_load_nolock+0x25c>
c00119d0:	00c12483          	lw	s1,12(sp)
c00119d4:	03c92703          	lw	a4,60(s2)
c00119d8:	00812783          	lw	a5,8(sp)
c00119dc:	00912223          	sw	s1,4(sp)
c00119e0:	00f70a63          	beq	a4,a5,c00119f4 <sfs_bmap_load_nolock+0x178>
c00119e4:	12071e63          	bnez	a4,c0011b20 <sfs_bmap_load_nolock+0x2a4>
c00119e8:	02f92e23          	sw	a5,60(s2)
c00119ec:	00100793          	li	a5,1
c00119f0:	00faa423          	sw	a5,8(s5)
c00119f4:	f00480e3          	beqz	s1,c00118f4 <sfs_bmap_load_nolock+0x78>
c00119f8:	0049a503          	lw	a0,4(s3)
c00119fc:	03098a93          	addi	s5,s3,48
c0011a00:	00048613          	mv	a2,s1
c0011a04:	000a8593          	mv	a1,s5
c0011a08:	aa5ff0ef          	jal	ra,c00114ac <sfs_block_inuse.isra.3>
c0011a0c:	12050a63          	beqz	a0,c0011b40 <sfs_bmap_load_nolock+0x2c4>
c0011a10:	00412483          	lw	s1,4(sp)
c0011a14:	ee9ff06f          	j	c00118fc <sfs_bmap_load_nolock+0x80>
c0011a18:	00410593          	addi	a1,sp,4
c0011a1c:	addff0ef          	jal	ra,c00114f8 <sfs_block_alloc>
c0011a20:	00050493          	mv	s1,a0
c0011a24:	f00514e3          	bnez	a0,c001192c <sfs_bmap_load_nolock+0xb0>
c0011a28:	00412483          	lw	s1,4(sp)
c0011a2c:	00100793          	li	a5,1
c0011a30:	009b2623          	sw	s1,12(s6)
c0011a34:	00faa423          	sw	a5,8(s5)
c0011a38:	ea048ee3          	beqz	s1,c00118f4 <sfs_bmap_load_nolock+0x78>
c0011a3c:	fbdff06f          	j	c00119f8 <sfs_bmap_load_nolock+0x17c>
c0011a40:	00c10c93          	addi	s9,sp,12
c0011a44:	000b0713          	mv	a4,s6
c0011a48:	000c0693          	mv	a3,s8
c0011a4c:	00400613          	li	a2,4
c0011a50:	000c8593          	mv	a1,s9
c0011a54:	da1fe0ef          	jal	ra,c00107f4 <sfs_rbuf>
c0011a58:	00050493          	mv	s1,a0
c0011a5c:	ec0518e3          	bnez	a0,c001192c <sfs_bmap_load_nolock+0xb0>
c0011a60:	00c12483          	lw	s1,12(sp)
c0011a64:	04049c63          	bnez	s1,c0011abc <sfs_bmap_load_nolock+0x240>
c0011a68:	028a0663          	beq	s4,s0,c0011a94 <sfs_bmap_load_nolock+0x218>
c0011a6c:	03c92703          	lw	a4,60(s2)
c0011a70:	00812783          	lw	a5,8(sp)
c0011a74:	00012223          	sw	zero,4(sp)
c0011a78:	f6f716e3          	bne	a4,a5,c00119e4 <sfs_bmap_load_nolock+0x168>
c0011a7c:	e79ff06f          	j	c00118f4 <sfs_bmap_load_nolock+0x78>
c0011a80:	00810593          	addi	a1,sp,8
c0011a84:	a75ff0ef          	jal	ra,c00114f8 <sfs_block_alloc>
c0011a88:	00050493          	mv	s1,a0
c0011a8c:	00c10c93          	addi	s9,sp,12
c0011a90:	e8051ee3          	bnez	a0,c001192c <sfs_bmap_load_nolock+0xb0>
c0011a94:	000c8593          	mv	a1,s9
c0011a98:	00098513          	mv	a0,s3
c0011a9c:	a5dff0ef          	jal	ra,c00114f8 <sfs_block_alloc>
c0011aa0:	00050493          	mv	s1,a0
c0011aa4:	f00506e3          	beqz	a0,c00119b0 <sfs_bmap_load_nolock+0x134>
c0011aa8:	00812583          	lw	a1,8(sp)
c0011aac:	e8bc00e3          	beq	s8,a1,c001192c <sfs_bmap_load_nolock+0xb0>
c0011ab0:	00098513          	mv	a0,s3
c0011ab4:	b15ff0ef          	jal	ra,c00115c8 <sfs_block_free>
c0011ab8:	e75ff06f          	j	c001192c <sfs_bmap_load_nolock+0xb0>
c0011abc:	03c92703          	lw	a4,60(s2)
c0011ac0:	00812783          	lw	a5,8(sp)
c0011ac4:	00912223          	sw	s1,4(sp)
c0011ac8:	f0f71ee3          	bne	a4,a5,c00119e4 <sfs_bmap_load_nolock+0x168>
c0011acc:	f2dff06f          	j	c00119f8 <sfs_bmap_load_nolock+0x17c>
c0011ad0:	00000493          	li	s1,0
c0011ad4:	e59ff06f          	j	c001192c <sfs_bmap_load_nolock+0xb0>
c0011ad8:	00c12583          	lw	a1,12(sp)
c0011adc:	00098513          	mv	a0,s3
c0011ae0:	ae9ff0ef          	jal	ra,c00115c8 <sfs_block_free>
c0011ae4:	fc5ff06f          	j	c0011aa8 <sfs_bmap_load_nolock+0x22c>
c0011ae8:	00006697          	auipc	a3,0x6
c0011aec:	97468693          	addi	a3,a3,-1676 # c001745c <dev_node_ops+0x30c>
c0011af0:	00002617          	auipc	a2,0x2
c0011af4:	32c60613          	addi	a2,a2,812 # c0013e1c <commands+0x164>
c0011af8:	16400593          	li	a1,356
c0011afc:	00006517          	auipc	a0,0x6
c0011b00:	a2c50513          	addi	a0,a0,-1492 # c0017528 <dev_node_ops+0x3d8>
c0011b04:	fc0ee0ef          	jal	ra,c00002c4 <__panic>
c0011b08:	00006617          	auipc	a2,0x6
c0011b0c:	98060613          	addi	a2,a2,-1664 # c0017488 <dev_node_ops+0x338>
c0011b10:	11e00593          	li	a1,286
c0011b14:	00006517          	auipc	a0,0x6
c0011b18:	a1450513          	addi	a0,a0,-1516 # c0017528 <dev_node_ops+0x3d8>
c0011b1c:	fa8ee0ef          	jal	ra,c00002c4 <__panic>
c0011b20:	00006697          	auipc	a3,0x6
c0011b24:	95468693          	addi	a3,a3,-1708 # c0017474 <dev_node_ops+0x324>
c0011b28:	00002617          	auipc	a2,0x2
c0011b2c:	2f460613          	addi	a2,a2,756 # c0013e1c <commands+0x164>
c0011b30:	11800593          	li	a1,280
c0011b34:	00006517          	auipc	a0,0x6
c0011b38:	9f450513          	addi	a0,a0,-1548 # c0017528 <dev_node_ops+0x3d8>
c0011b3c:	f88ee0ef          	jal	ra,c00002c4 <__panic>
c0011b40:	00006697          	auipc	a3,0x6
c0011b44:	97468693          	addi	a3,a3,-1676 # c00174b4 <dev_node_ops+0x364>
c0011b48:	00002617          	auipc	a2,0x2
c0011b4c:	2d460613          	addi	a2,a2,724 # c0013e1c <commands+0x164>
c0011b50:	12100593          	li	a1,289
c0011b54:	00006517          	auipc	a0,0x6
c0011b58:	9d450513          	addi	a0,a0,-1580 # c0017528 <dev_node_ops+0x3d8>
c0011b5c:	f68ee0ef          	jal	ra,c00002c4 <__panic>

c0011b60 <sfs_io_nolock>:
c0011b60:	fa010113          	addi	sp,sp,-96
c0011b64:	03712e23          	sw	s7,60(sp)
c0011b68:	00058b93          	mv	s7,a1
c0011b6c:	0005a583          	lw	a1,0(a1)
c0011b70:	03812c23          	sw	s8,56(sp)
c0011b74:	00050c13          	mv	s8,a0
c0011b78:	0045d503          	lhu	a0,4(a1)
c0011b7c:	04112e23          	sw	ra,92(sp)
c0011b80:	04812c23          	sw	s0,88(sp)
c0011b84:	04912a23          	sw	s1,84(sp)
c0011b88:	05212823          	sw	s2,80(sp)
c0011b8c:	05312623          	sw	s3,76(sp)
c0011b90:	05412423          	sw	s4,72(sp)
c0011b94:	05512223          	sw	s5,68(sp)
c0011b98:	05612023          	sw	s6,64(sp)
c0011b9c:	03912a23          	sw	s9,52(sp)
c0011ba0:	03a12823          	sw	s10,48(sp)
c0011ba4:	03b12623          	sw	s11,44(sp)
c0011ba8:	00200813          	li	a6,2
c0011bac:	23050263          	beq	a0,a6,c0011dd0 <sfs_io_nolock+0x270>
c0011bb0:	00072403          	lw	s0,0(a4)
c0011bb4:	00070b13          	mv	s6,a4
c0011bb8:	000b2023          	sw	zero,0(s6)
c0011bbc:	08000737          	lui	a4,0x8000
c0011bc0:	00068493          	mv	s1,a3
c0011bc4:	00868433          	add	s0,a3,s0
c0011bc8:	ffd00513          	li	a0,-3
c0011bcc:	0ae6fc63          	bleu	a4,a3,c0011c84 <sfs_io_nolock+0x124>
c0011bd0:	0ad44a63          	blt	s0,a3,c0011c84 <sfs_io_nolock+0x124>
c0011bd4:	1a868663          	beq	a3,s0,c0011d80 <sfs_io_nolock+0x220>
c0011bd8:	00060c93          	mv	s9,a2
c0011bdc:	00877463          	bleu	s0,a4,c0011be4 <sfs_io_nolock+0x84>
c0011be0:	00070413          	mv	s0,a4
c0011be4:	0c078e63          	beqz	a5,c0011cc0 <sfs_io_nolock+0x160>
c0011be8:	fffff797          	auipc	a5,0xfffff
c0011bec:	c0478793          	addi	a5,a5,-1020 # c00107ec <sfs_wblock>
c0011bf0:	00f12623          	sw	a5,12(sp)
c0011bf4:	fffffa17          	auipc	s4,0xfffff
c0011bf8:	cc8a0a13          	addi	s4,s4,-824 # c00108bc <sfs_wbuf>
c0011bfc:	41f4d793          	srai	a5,s1,0x1f
c0011c00:	00001637          	lui	a2,0x1
c0011c04:	fff60713          	addi	a4,a2,-1 # fff <_binary_bin_swap_img_size-0x6d01>
c0011c08:	0147d693          	srli	a3,a5,0x14
c0011c0c:	41f45a93          	srai	s5,s0,0x1f
c0011c10:	00e7f933          	and	s2,a5,a4
c0011c14:	00eaf9b3          	and	s3,s5,a4
c0011c18:	00d48db3          	add	s11,s1,a3
c0011c1c:	00990933          	add	s2,s2,s1
c0011c20:	008989b3          	add	s3,s3,s0
c0011c24:	00edfdb3          	and	s11,s11,a4
c0011c28:	40c95913          	srai	s2,s2,0xc
c0011c2c:	40c9d993          	srai	s3,s3,0xc
c0011c30:	40dd8db3          	sub	s11,s11,a3
c0011c34:	412989b3          	sub	s3,s3,s2
c0011c38:	0a0d8a63          	beqz	s11,c0011cec <sfs_io_nolock+0x18c>
c0011c3c:	40940d33          	sub	s10,s0,s1
c0011c40:	00098463          	beqz	s3,c0011c48 <sfs_io_nolock+0xe8>
c0011c44:	41b60d33          	sub	s10,a2,s11
c0011c48:	01c10693          	addi	a3,sp,28
c0011c4c:	00090613          	mv	a2,s2
c0011c50:	000b8593          	mv	a1,s7
c0011c54:	000c0513          	mv	a0,s8
c0011c58:	c25ff0ef          	jal	ra,c001187c <sfs_bmap_load_nolock>
c0011c5c:	0e050a63          	beqz	a0,c0011d50 <sfs_io_nolock+0x1f0>
c0011c60:	00000d13          	li	s10,0
c0011c64:	000ba783          	lw	a5,0(s7)
c0011c68:	01ab2023          	sw	s10,0(s6)
c0011c6c:	009d04b3          	add	s1,s10,s1
c0011c70:	0007a703          	lw	a4,0(a5)
c0011c74:	00977863          	bleu	s1,a4,c0011c84 <sfs_io_nolock+0x124>
c0011c78:	0097a023          	sw	s1,0(a5)
c0011c7c:	00100793          	li	a5,1
c0011c80:	00fba423          	sw	a5,8(s7)
c0011c84:	05c12083          	lw	ra,92(sp)
c0011c88:	05812403          	lw	s0,88(sp)
c0011c8c:	05412483          	lw	s1,84(sp)
c0011c90:	05012903          	lw	s2,80(sp)
c0011c94:	04c12983          	lw	s3,76(sp)
c0011c98:	04812a03          	lw	s4,72(sp)
c0011c9c:	04412a83          	lw	s5,68(sp)
c0011ca0:	04012b03          	lw	s6,64(sp)
c0011ca4:	03c12b83          	lw	s7,60(sp)
c0011ca8:	03812c03          	lw	s8,56(sp)
c0011cac:	03412c83          	lw	s9,52(sp)
c0011cb0:	03012d03          	lw	s10,48(sp)
c0011cb4:	02c12d83          	lw	s11,44(sp)
c0011cb8:	06010113          	addi	sp,sp,96
c0011cbc:	00008067          	ret
c0011cc0:	0005a783          	lw	a5,0(a1)
c0011cc4:	00000513          	li	a0,0
c0011cc8:	faf4fee3          	bleu	a5,s1,c0011c84 <sfs_io_nolock+0x124>
c0011ccc:	fffff717          	auipc	a4,0xfffff
c0011cd0:	b1870713          	addi	a4,a4,-1256 # c00107e4 <sfs_rblock>
c0011cd4:	00e12623          	sw	a4,12(sp)
c0011cd8:	fffffa17          	auipc	s4,0xfffff
c0011cdc:	b1ca0a13          	addi	s4,s4,-1252 # c00107f4 <sfs_rbuf>
c0011ce0:	f087fee3          	bleu	s0,a5,c0011bfc <sfs_io_nolock+0x9c>
c0011ce4:	00078413          	mv	s0,a5
c0011ce8:	f15ff06f          	j	c0011bfc <sfs_io_nolock+0x9c>
c0011cec:	00000d13          	li	s10,0
c0011cf0:	08099c63          	bnez	s3,c0011d88 <sfs_io_nolock+0x228>
c0011cf4:	014ad813          	srli	a6,s5,0x14
c0011cf8:	000017b7          	lui	a5,0x1
c0011cfc:	01040433          	add	s0,s0,a6
c0011d00:	fff78793          	addi	a5,a5,-1 # fff <_binary_bin_swap_img_size-0x6d01>
c0011d04:	00f47433          	and	s0,s0,a5
c0011d08:	41040433          	sub	s0,s0,a6
c0011d0c:	00000513          	li	a0,0
c0011d10:	f4040ae3          	beqz	s0,c0011c64 <sfs_io_nolock+0x104>
c0011d14:	01c10693          	addi	a3,sp,28
c0011d18:	00090613          	mv	a2,s2
c0011d1c:	000b8593          	mv	a1,s7
c0011d20:	000c0513          	mv	a0,s8
c0011d24:	b59ff0ef          	jal	ra,c001187c <sfs_bmap_load_nolock>
c0011d28:	f2051ee3          	bnez	a0,c0011c64 <sfs_io_nolock+0x104>
c0011d2c:	01c12683          	lw	a3,28(sp)
c0011d30:	00000713          	li	a4,0
c0011d34:	00040613          	mv	a2,s0
c0011d38:	000c8593          	mv	a1,s9
c0011d3c:	000c0513          	mv	a0,s8
c0011d40:	000a00e7          	jalr	s4
c0011d44:	f20510e3          	bnez	a0,c0011c64 <sfs_io_nolock+0x104>
c0011d48:	008d0d33          	add	s10,s10,s0
c0011d4c:	f19ff06f          	j	c0011c64 <sfs_io_nolock+0x104>
c0011d50:	01c12683          	lw	a3,28(sp)
c0011d54:	000d8713          	mv	a4,s11
c0011d58:	000d0613          	mv	a2,s10
c0011d5c:	000c8593          	mv	a1,s9
c0011d60:	000c0513          	mv	a0,s8
c0011d64:	000a00e7          	jalr	s4
c0011d68:	ee051ce3          	bnez	a0,c0011c60 <sfs_io_nolock+0x100>
c0011d6c:	ee098ce3          	beqz	s3,c0011c64 <sfs_io_nolock+0x104>
c0011d70:	01ac8cb3          	add	s9,s9,s10
c0011d74:	00190913          	addi	s2,s2,1
c0011d78:	fff98993          	addi	s3,s3,-1
c0011d7c:	f75ff06f          	j	c0011cf0 <sfs_io_nolock+0x190>
c0011d80:	00000513          	li	a0,0
c0011d84:	f01ff06f          	j	c0011c84 <sfs_io_nolock+0x124>
c0011d88:	01c10693          	addi	a3,sp,28
c0011d8c:	00090613          	mv	a2,s2
c0011d90:	000b8593          	mv	a1,s7
c0011d94:	000c0513          	mv	a0,s8
c0011d98:	ae5ff0ef          	jal	ra,c001187c <sfs_bmap_load_nolock>
c0011d9c:	ec0514e3          	bnez	a0,c0011c64 <sfs_io_nolock+0x104>
c0011da0:	01c12603          	lw	a2,28(sp)
c0011da4:	00c12783          	lw	a5,12(sp)
c0011da8:	00098693          	mv	a3,s3
c0011dac:	000c8593          	mv	a1,s9
c0011db0:	000c0513          	mv	a0,s8
c0011db4:	000780e7          	jalr	a5
c0011db8:	ea0516e3          	bnez	a0,c0011c64 <sfs_io_nolock+0x104>
c0011dbc:	00c99793          	slli	a5,s3,0xc
c0011dc0:	00fd0d33          	add	s10,s10,a5
c0011dc4:	00fc8cb3          	add	s9,s9,a5
c0011dc8:	01390933          	add	s2,s2,s3
c0011dcc:	f29ff06f          	j	c0011cf4 <sfs_io_nolock+0x194>
c0011dd0:	00005697          	auipc	a3,0x5
c0011dd4:	7c068693          	addi	a3,a3,1984 # c0017590 <dev_node_ops+0x440>
c0011dd8:	00002617          	auipc	a2,0x2
c0011ddc:	04460613          	addi	a2,a2,68 # c0013e1c <commands+0x164>
c0011de0:	22b00593          	li	a1,555
c0011de4:	00005517          	auipc	a0,0x5
c0011de8:	74450513          	addi	a0,a0,1860 # c0017528 <dev_node_ops+0x3d8>
c0011dec:	cd8ee0ef          	jal	ra,c00002c4 <__panic>

c0011df0 <sfs_dirent_read_nolock>:
c0011df0:	0005a783          	lw	a5,0(a1)
c0011df4:	fe010113          	addi	sp,sp,-32
c0011df8:	00112e23          	sw	ra,28(sp)
c0011dfc:	0047d883          	lhu	a7,4(a5)
c0011e00:	00812c23          	sw	s0,24(sp)
c0011e04:	00912a23          	sw	s1,20(sp)
c0011e08:	00200813          	li	a6,2
c0011e0c:	09089063          	bne	a7,a6,c0011e8c <sfs_dirent_read_nolock+0x9c>
c0011e10:	06064e63          	bltz	a2,c0011e8c <sfs_dirent_read_nolock+0x9c>
c0011e14:	0087a783          	lw	a5,8(a5)
c0011e18:	06f67a63          	bleu	a5,a2,c0011e8c <sfs_dirent_read_nolock+0x9c>
c0011e1c:	00068493          	mv	s1,a3
c0011e20:	00c10693          	addi	a3,sp,12
c0011e24:	00050413          	mv	s0,a0
c0011e28:	a55ff0ef          	jal	ra,c001187c <sfs_bmap_load_nolock>
c0011e2c:	00050c63          	beqz	a0,c0011e44 <sfs_dirent_read_nolock+0x54>
c0011e30:	01c12083          	lw	ra,28(sp)
c0011e34:	01812403          	lw	s0,24(sp)
c0011e38:	01412483          	lw	s1,20(sp)
c0011e3c:	02010113          	addi	sp,sp,32
c0011e40:	00008067          	ret
c0011e44:	00c12603          	lw	a2,12(sp)
c0011e48:	00442503          	lw	a0,4(s0)
c0011e4c:	03040593          	addi	a1,s0,48
c0011e50:	e5cff0ef          	jal	ra,c00114ac <sfs_block_inuse.isra.3>
c0011e54:	04050c63          	beqz	a0,c0011eac <sfs_dirent_read_nolock+0xbc>
c0011e58:	00c12683          	lw	a3,12(sp)
c0011e5c:	00000713          	li	a4,0
c0011e60:	10400613          	li	a2,260
c0011e64:	00048593          	mv	a1,s1
c0011e68:	00040513          	mv	a0,s0
c0011e6c:	989fe0ef          	jal	ra,c00107f4 <sfs_rbuf>
c0011e70:	fc0510e3          	bnez	a0,c0011e30 <sfs_dirent_read_nolock+0x40>
c0011e74:	100481a3          	sb	zero,259(s1)
c0011e78:	01c12083          	lw	ra,28(sp)
c0011e7c:	01812403          	lw	s0,24(sp)
c0011e80:	01412483          	lw	s1,20(sp)
c0011e84:	02010113          	addi	sp,sp,32
c0011e88:	00008067          	ret
c0011e8c:	00005697          	auipc	a3,0x5
c0011e90:	65068693          	addi	a3,a3,1616 # c00174dc <dev_node_ops+0x38c>
c0011e94:	00002617          	auipc	a2,0x2
c0011e98:	f8860613          	addi	a2,a2,-120 # c0013e1c <commands+0x164>
c0011e9c:	18e00593          	li	a1,398
c0011ea0:	00005517          	auipc	a0,0x5
c0011ea4:	68850513          	addi	a0,a0,1672 # c0017528 <dev_node_ops+0x3d8>
c0011ea8:	c1cee0ef          	jal	ra,c00002c4 <__panic>
c0011eac:	00005697          	auipc	a3,0x5
c0011eb0:	61468693          	addi	a3,a3,1556 # c00174c0 <dev_node_ops+0x370>
c0011eb4:	00002617          	auipc	a2,0x2
c0011eb8:	f6860613          	addi	a2,a2,-152 # c0013e1c <commands+0x164>
c0011ebc:	19500593          	li	a1,405
c0011ec0:	00005517          	auipc	a0,0x5
c0011ec4:	66850513          	addi	a0,a0,1640 # c0017528 <dev_node_ops+0x3d8>
c0011ec8:	bfcee0ef          	jal	ra,c00002c4 <__panic>

c0011ecc <sfs_getdirentry>:
c0011ecc:	fd010113          	addi	sp,sp,-48
c0011ed0:	01512a23          	sw	s5,20(sp)
c0011ed4:	00050a93          	mv	s5,a0
c0011ed8:	10400513          	li	a0,260
c0011edc:	01712623          	sw	s7,12(sp)
c0011ee0:	02112623          	sw	ra,44(sp)
c0011ee4:	02812423          	sw	s0,40(sp)
c0011ee8:	02912223          	sw	s1,36(sp)
c0011eec:	03212023          	sw	s2,32(sp)
c0011ef0:	01312e23          	sw	s3,28(sp)
c0011ef4:	01412c23          	sw	s4,24(sp)
c0011ef8:	01612823          	sw	s6,16(sp)
c0011efc:	01812423          	sw	s8,8(sp)
c0011f00:	00058b93          	mv	s7,a1
c0011f04:	ee9f00ef          	jal	ra,c0002dec <kmalloc>
c0011f08:	12050663          	beqz	a0,c0012034 <sfs_getdirentry+0x168>
c0011f0c:	038aab03          	lw	s6,56(s5)
c0011f10:	140b0663          	beqz	s6,c001205c <sfs_getdirentry+0x190>
c0011f14:	06cb2783          	lw	a5,108(s6)
c0011f18:	14079263          	bnez	a5,c001205c <sfs_getdirentry+0x190>
c0011f1c:	02caa703          	lw	a4,44(s5)
c0011f20:	000017b7          	lui	a5,0x1
c0011f24:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
c0011f28:	10f71a63          	bne	a4,a5,c001203c <sfs_getdirentry+0x170>
c0011f2c:	004ba983          	lw	s3,4(s7)
c0011f30:	00050493          	mv	s1,a0
c0011f34:	0e09c263          	bltz	s3,c0012018 <sfs_getdirentry+0x14c>
c0011f38:	0ff9f793          	andi	a5,s3,255
c0011f3c:	0c079e63          	bnez	a5,c0012018 <sfs_getdirentry+0x14c>
c0011f40:	000aa783          	lw	a5,0(s5)
c0011f44:	0089d993          	srli	s3,s3,0x8
c0011f48:	0087a783          	lw	a5,8(a5)
c0011f4c:	0d37ee63          	bltu	a5,s3,c0012028 <sfs_getdirentry+0x15c>
c0011f50:	010a8c13          	addi	s8,s5,16
c0011f54:	000c0513          	mv	a0,s8
c0011f58:	aa9f40ef          	jal	ra,c0006a00 <down>
c0011f5c:	000aa783          	lw	a5,0(s5)
c0011f60:	0087aa03          	lw	s4,8(a5)
c0011f64:	0b405663          	blez	s4,c0012010 <sfs_getdirentry+0x144>
c0011f68:	00000413          	li	s0,0
c0011f6c:	01c0006f          	j	c0011f88 <sfs_getdirentry+0xbc>
c0011f70:	0004a783          	lw	a5,0(s1)
c0011f74:	00078663          	beqz	a5,c0011f80 <sfs_getdirentry+0xb4>
c0011f78:	06098863          	beqz	s3,c0011fe8 <sfs_getdirentry+0x11c>
c0011f7c:	fff98993          	addi	s3,s3,-1
c0011f80:	00140413          	addi	s0,s0,1
c0011f84:	088a0663          	beq	s4,s0,c0012010 <sfs_getdirentry+0x144>
c0011f88:	00048693          	mv	a3,s1
c0011f8c:	00040613          	mv	a2,s0
c0011f90:	000a8593          	mv	a1,s5
c0011f94:	000b0513          	mv	a0,s6
c0011f98:	e59ff0ef          	jal	ra,c0011df0 <sfs_dirent_read_nolock>
c0011f9c:	00050913          	mv	s2,a0
c0011fa0:	fc0508e3          	beqz	a0,c0011f70 <sfs_getdirentry+0xa4>
c0011fa4:	000c0513          	mv	a0,s8
c0011fa8:	a55f40ef          	jal	ra,c00069fc <up>
c0011fac:	00048513          	mv	a0,s1
c0011fb0:	f5df00ef          	jal	ra,c0002f0c <kfree>
c0011fb4:	02c12083          	lw	ra,44(sp)
c0011fb8:	00090513          	mv	a0,s2
c0011fbc:	02812403          	lw	s0,40(sp)
c0011fc0:	02412483          	lw	s1,36(sp)
c0011fc4:	02012903          	lw	s2,32(sp)
c0011fc8:	01c12983          	lw	s3,28(sp)
c0011fcc:	01812a03          	lw	s4,24(sp)
c0011fd0:	01412a83          	lw	s5,20(sp)
c0011fd4:	01012b03          	lw	s6,16(sp)
c0011fd8:	00c12b83          	lw	s7,12(sp)
c0011fdc:	00812c03          	lw	s8,8(sp)
c0011fe0:	03010113          	addi	sp,sp,48
c0011fe4:	00008067          	ret
c0011fe8:	000c0513          	mv	a0,s8
c0011fec:	a11f40ef          	jal	ra,c00069fc <up>
c0011ff0:	00000713          	li	a4,0
c0011ff4:	00100693          	li	a3,1
c0011ff8:	10000613          	li	a2,256
c0011ffc:	00448593          	addi	a1,s1,4
c0012000:	000b8513          	mv	a0,s7
c0012004:	940f60ef          	jal	ra,c0008144 <iobuf_move>
c0012008:	00050913          	mv	s2,a0
c001200c:	fa1ff06f          	j	c0011fac <sfs_getdirentry+0xe0>
c0012010:	ff000913          	li	s2,-16
c0012014:	f91ff06f          	j	c0011fa4 <sfs_getdirentry+0xd8>
c0012018:	00048513          	mv	a0,s1
c001201c:	ef1f00ef          	jal	ra,c0002f0c <kfree>
c0012020:	ffd00913          	li	s2,-3
c0012024:	f91ff06f          	j	c0011fb4 <sfs_getdirentry+0xe8>
c0012028:	ee5f00ef          	jal	ra,c0002f0c <kfree>
c001202c:	ff000913          	li	s2,-16
c0012030:	f85ff06f          	j	c0011fb4 <sfs_getdirentry+0xe8>
c0012034:	ffc00913          	li	s2,-4
c0012038:	f7dff06f          	j	c0011fb4 <sfs_getdirentry+0xe8>
c001203c:	00005697          	auipc	a3,0x5
c0012040:	50468693          	addi	a3,a3,1284 # c0017540 <dev_node_ops+0x3f0>
c0012044:	00002617          	auipc	a2,0x2
c0012048:	dd860613          	addi	a2,a2,-552 # c0013e1c <commands+0x164>
c001204c:	33b00593          	li	a1,827
c0012050:	00005517          	auipc	a0,0x5
c0012054:	4d850513          	addi	a0,a0,1240 # c0017528 <dev_node_ops+0x3d8>
c0012058:	a6cee0ef          	jal	ra,c00002c4 <__panic>
c001205c:	00005697          	auipc	a3,0x5
c0012060:	33068693          	addi	a3,a3,816 # c001738c <dev_node_ops+0x23c>
c0012064:	00002617          	auipc	a2,0x2
c0012068:	db860613          	addi	a2,a2,-584 # c0013e1c <commands+0x164>
c001206c:	33a00593          	li	a1,826
c0012070:	00005517          	auipc	a0,0x5
c0012074:	4b850513          	addi	a0,a0,1208 # c0017528 <dev_node_ops+0x3d8>
c0012078:	a4cee0ef          	jal	ra,c00002c4 <__panic>

c001207c <sfs_truncfile>:
c001207c:	fa010113          	addi	sp,sp,-96
c0012080:	04112e23          	sw	ra,92(sp)
c0012084:	04812c23          	sw	s0,88(sp)
c0012088:	04912a23          	sw	s1,84(sp)
c001208c:	05212823          	sw	s2,80(sp)
c0012090:	05312623          	sw	s3,76(sp)
c0012094:	05412423          	sw	s4,72(sp)
c0012098:	05512223          	sw	s5,68(sp)
c001209c:	05612023          	sw	s6,64(sp)
c00120a0:	03712e23          	sw	s7,60(sp)
c00120a4:	03812c23          	sw	s8,56(sp)
c00120a8:	03912a23          	sw	s9,52(sp)
c00120ac:	03a12823          	sw	s10,48(sp)
c00120b0:	03b12623          	sw	s11,44(sp)
c00120b4:	080007b7          	lui	a5,0x8000
c00120b8:	1eb7ee63          	bltu	a5,a1,c00122b4 <sfs_truncfile+0x238>
c00120bc:	03852a03          	lw	s4,56(a0)
c00120c0:	00050913          	mv	s2,a0
c00120c4:	00058a93          	mv	s5,a1
c00120c8:	1e0a0a63          	beqz	s4,c00122bc <sfs_truncfile+0x240>
c00120cc:	06ca2783          	lw	a5,108(s4)
c00120d0:	1e079663          	bnez	a5,c00122bc <sfs_truncfile+0x240>
c00120d4:	02c52703          	lw	a4,44(a0)
c00120d8:	000014b7          	lui	s1,0x1
c00120dc:	23548793          	addi	a5,s1,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
c00120e0:	1ef71e63          	bne	a4,a5,c00122dc <sfs_truncfile+0x260>
c00120e4:	00052b03          	lw	s6,0(a0)
c00120e8:	fff48493          	addi	s1,s1,-1
c00120ec:	009584b3          	add	s1,a1,s1
c00120f0:	000b2783          	lw	a5,0(s6)
c00120f4:	00c4d493          	srli	s1,s1,0xc
c00120f8:	12f58c63          	beq	a1,a5,c0012230 <sfs_truncfile+0x1b4>
c00120fc:	01050b93          	addi	s7,a0,16
c0012100:	000b8513          	mv	a0,s7
c0012104:	8fdf40ef          	jal	ra,c0006a00 <down>
c0012108:	008b2403          	lw	s0,8(s6)
c001210c:	10946263          	bltu	s0,s1,c0012210 <sfs_truncfile+0x194>
c0012110:	1684f863          	bleu	s0,s1,c0012280 <sfs_truncfile+0x204>
c0012114:	00092c03          	lw	s8,0(s2)
c0012118:	008c2783          	lw	a5,8(s8)
c001211c:	1e078063          	beqz	a5,c00122fc <sfs_truncfile+0x280>
c0012120:	030a0713          	addi	a4,s4,48
c0012124:	00b00c93          	li	s9,11
c0012128:	00100d13          	li	s10,1
c001212c:	00e12623          	sw	a4,12(sp)
c0012130:	0380006f          	j	c0012168 <sfs_truncfile+0xec>
c0012134:	00279793          	slli	a5,a5,0x2
c0012138:	00fc09b3          	add	s3,s8,a5
c001213c:	0089a583          	lw	a1,8(s3)
c0012140:	16059063          	bnez	a1,c00122a0 <sfs_truncfile+0x224>
c0012144:	008c2783          	lw	a5,8(s8)
c0012148:	fff40413          	addi	s0,s0,-1
c001214c:	fff78793          	addi	a5,a5,-1 # 7ffffff <_binary_bin_sfs_img_size+0x7f8acff>
c0012150:	00fc2423          	sw	a5,8(s8)
c0012154:	01a92423          	sw	s10,8(s2)
c0012158:	12848263          	beq	s1,s0,c001227c <sfs_truncfile+0x200>
c001215c:	00092c03          	lw	s8,0(s2)
c0012160:	008c2783          	lw	a5,8(s8)
c0012164:	18078c63          	beqz	a5,c00122fc <sfs_truncfile+0x280>
c0012168:	fff78713          	addi	a4,a5,-1
c001216c:	fcecf4e3          	bleu	a4,s9,c0012134 <sfs_truncfile+0xb8>
c0012170:	ff378993          	addi	s3,a5,-13
c0012174:	3ff00793          	li	a5,1023
c0012178:	fd37e6e3          	bltu	a5,s3,c0012144 <sfs_truncfile+0xc8>
c001217c:	03cc2783          	lw	a5,60(s8)
c0012180:	fc0782e3          	beqz	a5,c0012144 <sfs_truncfile+0xc8>
c0012184:	004a2503          	lw	a0,4(s4)
c0012188:	00c12583          	lw	a1,12(sp)
c001218c:	00078613          	mv	a2,a5
c0012190:	00f12423          	sw	a5,8(sp)
c0012194:	b18ff0ef          	jal	ra,c00114ac <sfs_block_inuse.isra.3>
c0012198:	00812783          	lw	a5,8(sp)
c001219c:	1c050063          	beqz	a0,c001235c <sfs_truncfile+0x2e0>
c00121a0:	00299993          	slli	s3,s3,0x2
c00121a4:	00098713          	mv	a4,s3
c00121a8:	00078693          	mv	a3,a5
c00121ac:	00400613          	li	a2,4
c00121b0:	01810593          	addi	a1,sp,24
c00121b4:	000a0513          	mv	a0,s4
c00121b8:	00f12423          	sw	a5,8(sp)
c00121bc:	00012e23          	sw	zero,28(sp)
c00121c0:	e34fe0ef          	jal	ra,c00107f4 <sfs_rbuf>
c00121c4:	00050d93          	mv	s11,a0
c00121c8:	0c051663          	bnez	a0,c0012294 <sfs_truncfile+0x218>
c00121cc:	01812703          	lw	a4,24(sp)
c00121d0:	00812783          	lw	a5,8(sp)
c00121d4:	f60708e3          	beqz	a4,c0012144 <sfs_truncfile+0xc8>
c00121d8:	00098713          	mv	a4,s3
c00121dc:	00078693          	mv	a3,a5
c00121e0:	00400613          	li	a2,4
c00121e4:	01c10593          	addi	a1,sp,28
c00121e8:	000a0513          	mv	a0,s4
c00121ec:	ed0fe0ef          	jal	ra,c00108bc <sfs_wbuf>
c00121f0:	00050d93          	mv	s11,a0
c00121f4:	0a051063          	bnez	a0,c0012294 <sfs_truncfile+0x218>
c00121f8:	01812583          	lw	a1,24(sp)
c00121fc:	000a0513          	mv	a0,s4
c0012200:	bc8ff0ef          	jal	ra,c00115c8 <sfs_block_free>
c0012204:	f41ff06f          	j	c0012144 <sfs_truncfile+0xc8>
c0012208:	00140413          	addi	s0,s0,1
c001220c:	06848863          	beq	s1,s0,c001227c <sfs_truncfile+0x200>
c0012210:	00000693          	li	a3,0
c0012214:	00040613          	mv	a2,s0
c0012218:	00090593          	mv	a1,s2
c001221c:	000a0513          	mv	a0,s4
c0012220:	e5cff0ef          	jal	ra,c001187c <sfs_bmap_load_nolock>
c0012224:	00050d93          	mv	s11,a0
c0012228:	fe0500e3          	beqz	a0,c0012208 <sfs_truncfile+0x18c>
c001222c:	0680006f          	j	c0012294 <sfs_truncfile+0x218>
c0012230:	008b2783          	lw	a5,8(s6)
c0012234:	00000d93          	li	s11,0
c0012238:	0ef49263          	bne	s1,a5,c001231c <sfs_truncfile+0x2a0>
c001223c:	05c12083          	lw	ra,92(sp)
c0012240:	000d8513          	mv	a0,s11
c0012244:	05812403          	lw	s0,88(sp)
c0012248:	05412483          	lw	s1,84(sp)
c001224c:	05012903          	lw	s2,80(sp)
c0012250:	04c12983          	lw	s3,76(sp)
c0012254:	04812a03          	lw	s4,72(sp)
c0012258:	04412a83          	lw	s5,68(sp)
c001225c:	04012b03          	lw	s6,64(sp)
c0012260:	03c12b83          	lw	s7,60(sp)
c0012264:	03812c03          	lw	s8,56(sp)
c0012268:	03412c83          	lw	s9,52(sp)
c001226c:	03012d03          	lw	s10,48(sp)
c0012270:	02c12d83          	lw	s11,44(sp)
c0012274:	06010113          	addi	sp,sp,96
c0012278:	00008067          	ret
c001227c:	008b2403          	lw	s0,8(s6)
c0012280:	0a849e63          	bne	s1,s0,c001233c <sfs_truncfile+0x2c0>
c0012284:	015b2023          	sw	s5,0(s6)
c0012288:	00100793          	li	a5,1
c001228c:	00f92423          	sw	a5,8(s2)
c0012290:	00000d93          	li	s11,0
c0012294:	000b8513          	mv	a0,s7
c0012298:	f64f40ef          	jal	ra,c00069fc <up>
c001229c:	fa1ff06f          	j	c001223c <sfs_truncfile+0x1c0>
c00122a0:	000a0513          	mv	a0,s4
c00122a4:	b24ff0ef          	jal	ra,c00115c8 <sfs_block_free>
c00122a8:	0009a423          	sw	zero,8(s3)
c00122ac:	01a92423          	sw	s10,8(s2)
c00122b0:	e95ff06f          	j	c0012144 <sfs_truncfile+0xc8>
c00122b4:	ffd00d93          	li	s11,-3
c00122b8:	f85ff06f          	j	c001223c <sfs_truncfile+0x1c0>
c00122bc:	00005697          	auipc	a3,0x5
c00122c0:	0d068693          	addi	a3,a3,208 # c001738c <dev_node_ops+0x23c>
c00122c4:	00002617          	auipc	a2,0x2
c00122c8:	b5860613          	addi	a2,a2,-1192 # c0013e1c <commands+0x164>
c00122cc:	3a900593          	li	a1,937
c00122d0:	00005517          	auipc	a0,0x5
c00122d4:	25850513          	addi	a0,a0,600 # c0017528 <dev_node_ops+0x3d8>
c00122d8:	feded0ef          	jal	ra,c00002c4 <__panic>
c00122dc:	00005697          	auipc	a3,0x5
c00122e0:	26468693          	addi	a3,a3,612 # c0017540 <dev_node_ops+0x3f0>
c00122e4:	00002617          	auipc	a2,0x2
c00122e8:	b3860613          	addi	a2,a2,-1224 # c0013e1c <commands+0x164>
c00122ec:	3aa00593          	li	a1,938
c00122f0:	00005517          	auipc	a0,0x5
c00122f4:	23850513          	addi	a0,a0,568 # c0017528 <dev_node_ops+0x3d8>
c00122f8:	fcded0ef          	jal	ra,c00002c4 <__panic>
c00122fc:	00005697          	auipc	a3,0x5
c0012300:	3f068693          	addi	a3,a3,1008 # c00176ec <sfs_node_fileops+0x70>
c0012304:	00002617          	auipc	a2,0x2
c0012308:	b1860613          	addi	a2,a2,-1256 # c0013e1c <commands+0x164>
c001230c:	17b00593          	li	a1,379
c0012310:	00005517          	auipc	a0,0x5
c0012314:	21850513          	addi	a0,a0,536 # c0017528 <dev_node_ops+0x3d8>
c0012318:	faded0ef          	jal	ra,c00002c4 <__panic>
c001231c:	00005697          	auipc	a3,0x5
c0012320:	3b868693          	addi	a3,a3,952 # c00176d4 <sfs_node_fileops+0x58>
c0012324:	00002617          	auipc	a2,0x2
c0012328:	af860613          	addi	a2,a2,-1288 # c0013e1c <commands+0x164>
c001232c:	3b100593          	li	a1,945
c0012330:	00005517          	auipc	a0,0x5
c0012334:	1f850513          	addi	a0,a0,504 # c0017528 <dev_node_ops+0x3d8>
c0012338:	f8ded0ef          	jal	ra,c00002c4 <__panic>
c001233c:	00005697          	auipc	a3,0x5
c0012340:	3f868693          	addi	a3,a3,1016 # c0017734 <sfs_node_fileops+0xb8>
c0012344:	00002617          	auipc	a2,0x2
c0012348:	ad860613          	addi	a2,a2,-1320 # c0013e1c <commands+0x164>
c001234c:	3ca00593          	li	a1,970
c0012350:	00005517          	auipc	a0,0x5
c0012354:	1d850513          	addi	a0,a0,472 # c0017528 <dev_node_ops+0x3d8>
c0012358:	f6ded0ef          	jal	ra,c00002c4 <__panic>
c001235c:	00005697          	auipc	a3,0x5
c0012360:	3a468693          	addi	a3,a3,932 # c0017700 <sfs_node_fileops+0x84>
c0012364:	00002617          	auipc	a2,0x2
c0012368:	ab860613          	addi	a2,a2,-1352 # c0013e1c <commands+0x164>
c001236c:	12b00593          	li	a1,299
c0012370:	00005517          	auipc	a0,0x5
c0012374:	1b850513          	addi	a0,a0,440 # c0017528 <dev_node_ops+0x3d8>
c0012378:	f4ded0ef          	jal	ra,c00002c4 <__panic>

c001237c <sfs_tryseek>:
c001237c:	080007b7          	lui	a5,0x8000
c0012380:	08f5fa63          	bleu	a5,a1,c0012414 <sfs_tryseek+0x98>
c0012384:	ff010113          	addi	sp,sp,-16
c0012388:	00812423          	sw	s0,8(sp)
c001238c:	00912223          	sw	s1,4(sp)
c0012390:	00112623          	sw	ra,12(sp)
c0012394:	00050413          	mv	s0,a0
c0012398:	00058493          	mv	s1,a1
c001239c:	08050063          	beqz	a0,c001241c <sfs_tryseek+0xa0>
c00123a0:	02c52703          	lw	a4,44(a0)
c00123a4:	000017b7          	lui	a5,0x1
c00123a8:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
c00123ac:	06f71863          	bne	a4,a5,c001241c <sfs_tryseek+0xa0>
c00123b0:	00052783          	lw	a5,0(a0)
c00123b4:	0007a783          	lw	a5,0(a5)
c00123b8:	04b7f263          	bleu	a1,a5,c00123fc <sfs_tryseek+0x80>
c00123bc:	03c52783          	lw	a5,60(a0)
c00123c0:	06078e63          	beqz	a5,c001243c <sfs_tryseek+0xc0>
c00123c4:	0307a783          	lw	a5,48(a5)
c00123c8:	06078a63          	beqz	a5,c001243c <sfs_tryseek+0xc0>
c00123cc:	00005597          	auipc	a1,0x5
c00123d0:	b1058593          	addi	a1,a1,-1264 # c0016edc <syscalls+0xa14>
c00123d4:	f05fc0ef          	jal	ra,c000f2d8 <inode_check>
c00123d8:	03c42783          	lw	a5,60(s0)
c00123dc:	00048593          	mv	a1,s1
c00123e0:	00040513          	mv	a0,s0
c00123e4:	00c12083          	lw	ra,12(sp)
c00123e8:	00812403          	lw	s0,8(sp)
c00123ec:	00412483          	lw	s1,4(sp)
c00123f0:	0307a303          	lw	t1,48(a5)
c00123f4:	01010113          	addi	sp,sp,16
c00123f8:	00030067          	jr	t1
c00123fc:	00c12083          	lw	ra,12(sp)
c0012400:	00000513          	li	a0,0
c0012404:	00812403          	lw	s0,8(sp)
c0012408:	00412483          	lw	s1,4(sp)
c001240c:	01010113          	addi	sp,sp,16
c0012410:	00008067          	ret
c0012414:	ffd00513          	li	a0,-3
c0012418:	00008067          	ret
c001241c:	00005697          	auipc	a3,0x5
c0012420:	12468693          	addi	a3,a3,292 # c0017540 <dev_node_ops+0x3f0>
c0012424:	00002617          	auipc	a2,0x2
c0012428:	9f860613          	addi	a2,a2,-1544 # c0013e1c <commands+0x164>
c001242c:	39a00593          	li	a1,922
c0012430:	00005517          	auipc	a0,0x5
c0012434:	0f850513          	addi	a0,a0,248 # c0017528 <dev_node_ops+0x3d8>
c0012438:	e8ded0ef          	jal	ra,c00002c4 <__panic>
c001243c:	00005697          	auipc	a3,0x5
c0012440:	a4c68693          	addi	a3,a3,-1460 # c0016e88 <syscalls+0x9c0>
c0012444:	00002617          	auipc	a2,0x2
c0012448:	9d860613          	addi	a2,a2,-1576 # c0013e1c <commands+0x164>
c001244c:	39c00593          	li	a1,924
c0012450:	00005517          	auipc	a0,0x5
c0012454:	0d850513          	addi	a0,a0,216 # c0017528 <dev_node_ops+0x3d8>
c0012458:	e6ded0ef          	jal	ra,c00002c4 <__panic>

c001245c <sfs_close>:
c001245c:	ff010113          	addi	sp,sp,-16
c0012460:	00112623          	sw	ra,12(sp)
c0012464:	00812423          	sw	s0,8(sp)
c0012468:	04050063          	beqz	a0,c00124a8 <sfs_close+0x4c>
c001246c:	03c52783          	lw	a5,60(a0)
c0012470:	00050413          	mv	s0,a0
c0012474:	02078a63          	beqz	a5,c00124a8 <sfs_close+0x4c>
c0012478:	0187a783          	lw	a5,24(a5)
c001247c:	02078663          	beqz	a5,c00124a8 <sfs_close+0x4c>
c0012480:	00003597          	auipc	a1,0x3
c0012484:	79058593          	addi	a1,a1,1936 # c0015c10 <default_pmm_manager+0x920>
c0012488:	e51fc0ef          	jal	ra,c000f2d8 <inode_check>
c001248c:	03c42783          	lw	a5,60(s0)
c0012490:	00040513          	mv	a0,s0
c0012494:	00c12083          	lw	ra,12(sp)
c0012498:	00812403          	lw	s0,8(sp)
c001249c:	0187a303          	lw	t1,24(a5)
c00124a0:	01010113          	addi	sp,sp,16
c00124a4:	00030067          	jr	t1
c00124a8:	00003697          	auipc	a3,0x3
c00124ac:	71868693          	addi	a3,a3,1816 # c0015bc0 <default_pmm_manager+0x8d0>
c00124b0:	00002617          	auipc	a2,0x2
c00124b4:	96c60613          	addi	a2,a2,-1684 # c0013e1c <commands+0x164>
c00124b8:	21c00593          	li	a1,540
c00124bc:	00005517          	auipc	a0,0x5
c00124c0:	06c50513          	addi	a0,a0,108 # c0017528 <dev_node_ops+0x3d8>
c00124c4:	e01ed0ef          	jal	ra,c00002c4 <__panic>

c00124c8 <sfs_fstat>:
c00124c8:	ff010113          	addi	sp,sp,-16
c00124cc:	00912223          	sw	s1,4(sp)
c00124d0:	00058493          	mv	s1,a1
c00124d4:	00812423          	sw	s0,8(sp)
c00124d8:	01000613          	li	a2,16
c00124dc:	00050413          	mv	s0,a0
c00124e0:	00000593          	li	a1,0
c00124e4:	00048513          	mv	a0,s1
c00124e8:	00112623          	sw	ra,12(sp)
c00124ec:	6cd000ef          	jal	ra,c00133b8 <memset>
c00124f0:	06040e63          	beqz	s0,c001256c <sfs_fstat+0xa4>
c00124f4:	03c42783          	lw	a5,60(s0)
c00124f8:	06078a63          	beqz	a5,c001256c <sfs_fstat+0xa4>
c00124fc:	0287a783          	lw	a5,40(a5)
c0012500:	06078663          	beqz	a5,c001256c <sfs_fstat+0xa4>
c0012504:	00004597          	auipc	a1,0x4
c0012508:	60858593          	addi	a1,a1,1544 # c0016b0c <syscalls+0x644>
c001250c:	00040513          	mv	a0,s0
c0012510:	dc9fc0ef          	jal	ra,c000f2d8 <inode_check>
c0012514:	03c42783          	lw	a5,60(s0)
c0012518:	00048593          	mv	a1,s1
c001251c:	00040513          	mv	a0,s0
c0012520:	0287a783          	lw	a5,40(a5)
c0012524:	000780e7          	jalr	a5
c0012528:	02051863          	bnez	a0,c0012558 <sfs_fstat+0x90>
c001252c:	02c42703          	lw	a4,44(s0)
c0012530:	000017b7          	lui	a5,0x1
c0012534:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
c0012538:	04f71a63          	bne	a4,a5,c001258c <sfs_fstat+0xc4>
c001253c:	00042783          	lw	a5,0(s0)
c0012540:	0067d683          	lhu	a3,6(a5)
c0012544:	0087a703          	lw	a4,8(a5)
c0012548:	0007a783          	lw	a5,0(a5)
c001254c:	00d4a223          	sw	a3,4(s1)
c0012550:	00e4a423          	sw	a4,8(s1)
c0012554:	00f4a623          	sw	a5,12(s1)
c0012558:	00c12083          	lw	ra,12(sp)
c001255c:	00812403          	lw	s0,8(sp)
c0012560:	00412483          	lw	s1,4(sp)
c0012564:	01010113          	addi	sp,sp,16
c0012568:	00008067          	ret
c001256c:	00004697          	auipc	a3,0x4
c0012570:	53868693          	addi	a3,a3,1336 # c0016aa4 <syscalls+0x5dc>
c0012574:	00002617          	auipc	a2,0x2
c0012578:	8a860613          	addi	a2,a2,-1880 # c0013e1c <commands+0x164>
c001257c:	2b800593          	li	a1,696
c0012580:	00005517          	auipc	a0,0x5
c0012584:	fa850513          	addi	a0,a0,-88 # c0017528 <dev_node_ops+0x3d8>
c0012588:	d3ded0ef          	jal	ra,c00002c4 <__panic>
c001258c:	00005697          	auipc	a3,0x5
c0012590:	fb468693          	addi	a3,a3,-76 # c0017540 <dev_node_ops+0x3f0>
c0012594:	00002617          	auipc	a2,0x2
c0012598:	88860613          	addi	a2,a2,-1912 # c0013e1c <commands+0x164>
c001259c:	2bb00593          	li	a1,699
c00125a0:	00005517          	auipc	a0,0x5
c00125a4:	f8850513          	addi	a0,a0,-120 # c0017528 <dev_node_ops+0x3d8>
c00125a8:	d1ded0ef          	jal	ra,c00002c4 <__panic>

c00125ac <sfs_io.part.12>:
c00125ac:	ff010113          	addi	sp,sp,-16
c00125b0:	00005697          	auipc	a3,0x5
c00125b4:	ddc68693          	addi	a3,a3,-548 # c001738c <dev_node_ops+0x23c>
c00125b8:	00002617          	auipc	a2,0x2
c00125bc:	86460613          	addi	a2,a2,-1948 # c0013e1c <commands+0x164>
c00125c0:	29600593          	li	a1,662
c00125c4:	00005517          	auipc	a0,0x5
c00125c8:	f6450513          	addi	a0,a0,-156 # c0017528 <dev_node_ops+0x3d8>
c00125cc:	00112623          	sw	ra,12(sp)
c00125d0:	cf5ed0ef          	jal	ra,c00002c4 <__panic>

c00125d4 <sfs_read>:
c00125d4:	fd010113          	addi	sp,sp,-48
c00125d8:	03212023          	sw	s2,32(sp)
c00125dc:	03852903          	lw	s2,56(a0)
c00125e0:	02112623          	sw	ra,44(sp)
c00125e4:	02812423          	sw	s0,40(sp)
c00125e8:	02912223          	sw	s1,36(sp)
c00125ec:	01312e23          	sw	s3,28(sp)
c00125f0:	0a090863          	beqz	s2,c00126a0 <sfs_read+0xcc>
c00125f4:	06c92783          	lw	a5,108(s2)
c00125f8:	0a079463          	bnez	a5,c00126a0 <sfs_read+0xcc>
c00125fc:	02c52703          	lw	a4,44(a0)
c0012600:	000017b7          	lui	a5,0x1
c0012604:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
c0012608:	00050413          	mv	s0,a0
c001260c:	06f71a63          	bne	a4,a5,c0012680 <sfs_read+0xac>
c0012610:	01050993          	addi	s3,a0,16
c0012614:	00098513          	mv	a0,s3
c0012618:	00058493          	mv	s1,a1
c001261c:	be4f40ef          	jal	ra,c0006a00 <down>
c0012620:	00c4a803          	lw	a6,12(s1)
c0012624:	0044a683          	lw	a3,4(s1)
c0012628:	0004a603          	lw	a2,0(s1)
c001262c:	00040593          	mv	a1,s0
c0012630:	00000793          	li	a5,0
c0012634:	00c10713          	addi	a4,sp,12
c0012638:	00090513          	mv	a0,s2
c001263c:	01012623          	sw	a6,12(sp)
c0012640:	d20ff0ef          	jal	ra,c0011b60 <sfs_io_nolock>
c0012644:	00c12583          	lw	a1,12(sp)
c0012648:	00050413          	mv	s0,a0
c001264c:	00058663          	beqz	a1,c0012658 <sfs_read+0x84>
c0012650:	00048513          	mv	a0,s1
c0012654:	ba9f50ef          	jal	ra,c00081fc <iobuf_skip>
c0012658:	00098513          	mv	a0,s3
c001265c:	ba0f40ef          	jal	ra,c00069fc <up>
c0012660:	02c12083          	lw	ra,44(sp)
c0012664:	00040513          	mv	a0,s0
c0012668:	02412483          	lw	s1,36(sp)
c001266c:	02812403          	lw	s0,40(sp)
c0012670:	02012903          	lw	s2,32(sp)
c0012674:	01c12983          	lw	s3,28(sp)
c0012678:	03010113          	addi	sp,sp,48
c001267c:	00008067          	ret
c0012680:	00005697          	auipc	a3,0x5
c0012684:	ec068693          	addi	a3,a3,-320 # c0017540 <dev_node_ops+0x3f0>
c0012688:	00001617          	auipc	a2,0x1
c001268c:	79460613          	addi	a2,a2,1940 # c0013e1c <commands+0x164>
c0012690:	29700593          	li	a1,663
c0012694:	00005517          	auipc	a0,0x5
c0012698:	e9450513          	addi	a0,a0,-364 # c0017528 <dev_node_ops+0x3d8>
c001269c:	c29ed0ef          	jal	ra,c00002c4 <__panic>
c00126a0:	f0dff0ef          	jal	ra,c00125ac <sfs_io.part.12>

c00126a4 <sfs_write>:
c00126a4:	fd010113          	addi	sp,sp,-48
c00126a8:	03212023          	sw	s2,32(sp)
c00126ac:	03852903          	lw	s2,56(a0)
c00126b0:	02112623          	sw	ra,44(sp)
c00126b4:	02812423          	sw	s0,40(sp)
c00126b8:	02912223          	sw	s1,36(sp)
c00126bc:	01312e23          	sw	s3,28(sp)
c00126c0:	0a090863          	beqz	s2,c0012770 <sfs_write+0xcc>
c00126c4:	06c92783          	lw	a5,108(s2)
c00126c8:	0a079463          	bnez	a5,c0012770 <sfs_write+0xcc>
c00126cc:	02c52703          	lw	a4,44(a0)
c00126d0:	000017b7          	lui	a5,0x1
c00126d4:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
c00126d8:	00050413          	mv	s0,a0
c00126dc:	06f71a63          	bne	a4,a5,c0012750 <sfs_write+0xac>
c00126e0:	01050993          	addi	s3,a0,16
c00126e4:	00098513          	mv	a0,s3
c00126e8:	00058493          	mv	s1,a1
c00126ec:	b14f40ef          	jal	ra,c0006a00 <down>
c00126f0:	00c4a803          	lw	a6,12(s1)
c00126f4:	0044a683          	lw	a3,4(s1)
c00126f8:	0004a603          	lw	a2,0(s1)
c00126fc:	00040593          	mv	a1,s0
c0012700:	00100793          	li	a5,1
c0012704:	00c10713          	addi	a4,sp,12
c0012708:	00090513          	mv	a0,s2
c001270c:	01012623          	sw	a6,12(sp)
c0012710:	c50ff0ef          	jal	ra,c0011b60 <sfs_io_nolock>
c0012714:	00c12583          	lw	a1,12(sp)
c0012718:	00050413          	mv	s0,a0
c001271c:	00058663          	beqz	a1,c0012728 <sfs_write+0x84>
c0012720:	00048513          	mv	a0,s1
c0012724:	ad9f50ef          	jal	ra,c00081fc <iobuf_skip>
c0012728:	00098513          	mv	a0,s3
c001272c:	ad0f40ef          	jal	ra,c00069fc <up>
c0012730:	02c12083          	lw	ra,44(sp)
c0012734:	00040513          	mv	a0,s0
c0012738:	02412483          	lw	s1,36(sp)
c001273c:	02812403          	lw	s0,40(sp)
c0012740:	02012903          	lw	s2,32(sp)
c0012744:	01c12983          	lw	s3,28(sp)
c0012748:	03010113          	addi	sp,sp,48
c001274c:	00008067          	ret
c0012750:	00005697          	auipc	a3,0x5
c0012754:	df068693          	addi	a3,a3,-528 # c0017540 <dev_node_ops+0x3f0>
c0012758:	00001617          	auipc	a2,0x1
c001275c:	6c460613          	addi	a2,a2,1732 # c0013e1c <commands+0x164>
c0012760:	29700593          	li	a1,663
c0012764:	00005517          	auipc	a0,0x5
c0012768:	dc450513          	addi	a0,a0,-572 # c0017528 <dev_node_ops+0x3d8>
c001276c:	b59ed0ef          	jal	ra,c00002c4 <__panic>
c0012770:	e3dff0ef          	jal	ra,c00125ac <sfs_io.part.12>

c0012774 <sfs_load_inode>:
c0012774:	fe010113          	addi	sp,sp,-32
c0012778:	00112e23          	sw	ra,28(sp)
c001277c:	00812c23          	sw	s0,24(sp)
c0012780:	00912a23          	sw	s1,20(sp)
c0012784:	01412423          	sw	s4,8(sp)
c0012788:	00060493          	mv	s1,a2
c001278c:	00050a13          	mv	s4,a0
c0012790:	01512223          	sw	s5,4(sp)
c0012794:	01212823          	sw	s2,16(sp)
c0012798:	00058a93          	mv	s5,a1
c001279c:	01312623          	sw	s3,12(sp)
c00127a0:	bbcfe0ef          	jal	ra,c0010b5c <lock_sfs_fs>
c00127a4:	00a00593          	li	a1,10
c00127a8:	068a2403          	lw	s0,104(s4)
c00127ac:	00048513          	mv	a0,s1
c00127b0:	3a8010ef          	jal	ra,c0013b58 <hash32>
c00127b4:	00351513          	slli	a0,a0,0x3
c00127b8:	00a40533          	add	a0,s0,a0
c00127bc:	00050413          	mv	s0,a0
c00127c0:	00c0006f          	j	c00127cc <sfs_load_inode+0x58>
c00127c4:	fe042783          	lw	a5,-32(s0)
c00127c8:	10f48c63          	beq	s1,a5,c00128e0 <sfs_load_inode+0x16c>
c00127cc:	00442403          	lw	s0,4(s0)
c00127d0:	fe851ae3          	bne	a0,s0,c00127c4 <sfs_load_inode+0x50>
c00127d4:	04000513          	li	a0,64
c00127d8:	e14f00ef          	jal	ra,c0002dec <kmalloc>
c00127dc:	00050993          	mv	s3,a0
c00127e0:	14050a63          	beqz	a0,c0012934 <sfs_load_inode+0x1c0>
c00127e4:	004a2503          	lw	a0,4(s4)
c00127e8:	00048613          	mv	a2,s1
c00127ec:	030a0593          	addi	a1,s4,48
c00127f0:	cbdfe0ef          	jal	ra,c00114ac <sfs_block_inuse.isra.3>
c00127f4:	1a050a63          	beqz	a0,c00129a8 <sfs_load_inode+0x234>
c00127f8:	00000713          	li	a4,0
c00127fc:	00048693          	mv	a3,s1
c0012800:	04000613          	li	a2,64
c0012804:	00098593          	mv	a1,s3
c0012808:	000a0513          	mv	a0,s4
c001280c:	fe9fd0ef          	jal	ra,c00107f4 <sfs_rbuf>
c0012810:	00050913          	mv	s2,a0
c0012814:	14051263          	bnez	a0,c0012958 <sfs_load_inode+0x1e4>
c0012818:	0069d783          	lhu	a5,6(s3)
c001281c:	16078663          	beqz	a5,c0012988 <sfs_load_inode+0x214>
c0012820:	00001537          	lui	a0,0x1
c0012824:	23550513          	addi	a0,a0,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
c0012828:	9ddfc0ef          	jal	ra,c000f204 <__alloc_inode>
c001282c:	00050413          	mv	s0,a0
c0012830:	12050263          	beqz	a0,c0012954 <sfs_load_inode+0x1e0>
c0012834:	0049d683          	lhu	a3,4(s3)
c0012838:	00100793          	li	a5,1
c001283c:	14f68063          	beq	a3,a5,c001297c <sfs_load_inode+0x208>
c0012840:	00200793          	li	a5,2
c0012844:	12f69063          	bne	a3,a5,c0012964 <sfs_load_inode+0x1f0>
c0012848:	00005597          	auipc	a1,0x5
c001284c:	df458593          	addi	a1,a1,-524 # c001763c <sfs_node_dirops>
c0012850:	000a0613          	mv	a2,s4
c0012854:	00040513          	mv	a0,s0
c0012858:	9ddfc0ef          	jal	ra,c000f234 <inode_init>
c001285c:	02c42903          	lw	s2,44(s0)
c0012860:	000017b7          	lui	a5,0x1
c0012864:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
c0012868:	18f91063          	bne	s2,a5,c00129e8 <sfs_load_inode+0x274>
c001286c:	00100593          	li	a1,1
c0012870:	01342023          	sw	s3,0(s0)
c0012874:	00942223          	sw	s1,4(s0)
c0012878:	00042423          	sw	zero,8(s0)
c001287c:	00b42623          	sw	a1,12(s0)
c0012880:	01040513          	addi	a0,s0,16
c0012884:	96cf40ef          	jal	ra,c00069f0 <sem_init>
c0012888:	02c42783          	lw	a5,44(s0)
c001288c:	13279e63          	bne	a5,s2,c00129c8 <sfs_load_inode+0x254>
c0012890:	064a2683          	lw	a3,100(s4)
c0012894:	01c40793          	addi	a5,s0,28
c0012898:	060a0713          	addi	a4,s4,96
c001289c:	00f6a023          	sw	a5,0(a3)
c00128a0:	06fa2223          	sw	a5,100(s4)
c00128a4:	00442503          	lw	a0,4(s0)
c00128a8:	02d42023          	sw	a3,32(s0)
c00128ac:	00e42e23          	sw	a4,28(s0)
c00128b0:	068a2483          	lw	s1,104(s4)
c00128b4:	00a00593          	li	a1,10
c00128b8:	2a0010ef          	jal	ra,c0013b58 <hash32>
c00128bc:	00351793          	slli	a5,a0,0x3
c00128c0:	00f487b3          	add	a5,s1,a5
c00128c4:	0047a703          	lw	a4,4(a5)
c00128c8:	02440693          	addi	a3,s0,36
c00128cc:	00d72023          	sw	a3,0(a4)
c00128d0:	00d7a223          	sw	a3,4(a5)
c00128d4:	02e42423          	sw	a4,40(s0)
c00128d8:	02f42223          	sw	a5,36(s0)
c00128dc:	0200006f          	j	c00128fc <sfs_load_inode+0x188>
c00128e0:	fdc40913          	addi	s2,s0,-36
c00128e4:	00090513          	mv	a0,s2
c00128e8:	9c9fc0ef          	jal	ra,c000f2b0 <inode_ref_inc>
c00128ec:	00100793          	li	a5,1
c00128f0:	04f50a63          	beq	a0,a5,c0012944 <sfs_load_inode+0x1d0>
c00128f4:	00090413          	mv	s0,s2
c00128f8:	ec090ee3          	beqz	s2,c00127d4 <sfs_load_inode+0x60>
c00128fc:	000a0513          	mv	a0,s4
c0012900:	a6cfe0ef          	jal	ra,c0010b6c <unlock_sfs_fs>
c0012904:	00000913          	li	s2,0
c0012908:	008aa023          	sw	s0,0(s5)
c001290c:	01c12083          	lw	ra,28(sp)
c0012910:	00090513          	mv	a0,s2
c0012914:	01812403          	lw	s0,24(sp)
c0012918:	01412483          	lw	s1,20(sp)
c001291c:	01012903          	lw	s2,16(sp)
c0012920:	00c12983          	lw	s3,12(sp)
c0012924:	00812a03          	lw	s4,8(sp)
c0012928:	00412a83          	lw	s5,4(sp)
c001292c:	02010113          	addi	sp,sp,32
c0012930:	00008067          	ret
c0012934:	ffc00913          	li	s2,-4
c0012938:	000a0513          	mv	a0,s4
c001293c:	a30fe0ef          	jal	ra,c0010b6c <unlock_sfs_fs>
c0012940:	fcdff06f          	j	c001290c <sfs_load_inode+0x198>
c0012944:	fe842783          	lw	a5,-24(s0)
c0012948:	00178793          	addi	a5,a5,1
c001294c:	fef42423          	sw	a5,-24(s0)
c0012950:	fa5ff06f          	j	c00128f4 <sfs_load_inode+0x180>
c0012954:	ffc00913          	li	s2,-4
c0012958:	00098513          	mv	a0,s3
c001295c:	db0f00ef          	jal	ra,c0002f0c <kfree>
c0012960:	fd9ff06f          	j	c0012938 <sfs_load_inode+0x1c4>
c0012964:	00005617          	auipc	a2,0x5
c0012968:	c1460613          	addi	a2,a2,-1004 # c0017578 <dev_node_ops+0x428>
c001296c:	02e00593          	li	a1,46
c0012970:	00005517          	auipc	a0,0x5
c0012974:	bb850513          	addi	a0,a0,-1096 # c0017528 <dev_node_ops+0x3d8>
c0012978:	94ded0ef          	jal	ra,c00002c4 <__panic>
c001297c:	00005597          	auipc	a1,0x5
c0012980:	d0058593          	addi	a1,a1,-768 # c001767c <sfs_node_fileops>
c0012984:	ecdff06f          	j	c0012850 <sfs_load_inode+0xdc>
c0012988:	00005697          	auipc	a3,0x5
c001298c:	c2468693          	addi	a3,a3,-988 # c00175ac <dev_node_ops+0x45c>
c0012990:	00001617          	auipc	a2,0x1
c0012994:	48c60613          	addi	a2,a2,1164 # c0013e1c <commands+0x164>
c0012998:	0ad00593          	li	a1,173
c001299c:	00005517          	auipc	a0,0x5
c00129a0:	b8c50513          	addi	a0,a0,-1140 # c0017528 <dev_node_ops+0x3d8>
c00129a4:	921ed0ef          	jal	ra,c00002c4 <__panic>
c00129a8:	00005697          	auipc	a3,0x5
c00129ac:	b1868693          	addi	a3,a3,-1256 # c00174c0 <dev_node_ops+0x370>
c00129b0:	00001617          	auipc	a2,0x1
c00129b4:	46c60613          	addi	a2,a2,1132 # c0013e1c <commands+0x164>
c00129b8:	0a800593          	li	a1,168
c00129bc:	00005517          	auipc	a0,0x5
c00129c0:	b6c50513          	addi	a0,a0,-1172 # c0017528 <dev_node_ops+0x3d8>
c00129c4:	901ed0ef          	jal	ra,c00002c4 <__panic>
c00129c8:	00005697          	auipc	a3,0x5
c00129cc:	b7868693          	addi	a3,a3,-1160 # c0017540 <dev_node_ops+0x3f0>
c00129d0:	00001617          	auipc	a2,0x1
c00129d4:	44c60613          	addi	a2,a2,1100 # c0013e1c <commands+0x164>
c00129d8:	0b100593          	li	a1,177
c00129dc:	00005517          	auipc	a0,0x5
c00129e0:	b4c50513          	addi	a0,a0,-1204 # c0017528 <dev_node_ops+0x3d8>
c00129e4:	8e1ed0ef          	jal	ra,c00002c4 <__panic>
c00129e8:	00005697          	auipc	a3,0x5
c00129ec:	b5868693          	addi	a3,a3,-1192 # c0017540 <dev_node_ops+0x3f0>
c00129f0:	00001617          	auipc	a2,0x1
c00129f4:	42c60613          	addi	a2,a2,1068 # c0013e1c <commands+0x164>
c00129f8:	07700593          	li	a1,119
c00129fc:	00005517          	auipc	a0,0x5
c0012a00:	b2c50513          	addi	a0,a0,-1236 # c0017528 <dev_node_ops+0x3d8>
c0012a04:	8c1ed0ef          	jal	ra,c00002c4 <__panic>

c0012a08 <sfs_lookup_once.constprop.13>:
c0012a08:	fd010113          	addi	sp,sp,-48
c0012a0c:	01812423          	sw	s8,8(sp)
c0012a10:	01058c13          	addi	s8,a1,16
c0012a14:	01512a23          	sw	s5,20(sp)
c0012a18:	00050a93          	mv	s5,a0
c0012a1c:	000c0513          	mv	a0,s8
c0012a20:	02112623          	sw	ra,44(sp)
c0012a24:	01312e23          	sw	s3,28(sp)
c0012a28:	01612823          	sw	s6,16(sp)
c0012a2c:	01912223          	sw	s9,4(sp)
c0012a30:	00060b13          	mv	s6,a2
c0012a34:	00058993          	mv	s3,a1
c0012a38:	00068c93          	mv	s9,a3
c0012a3c:	02812423          	sw	s0,40(sp)
c0012a40:	02912223          	sw	s1,36(sp)
c0012a44:	03212023          	sw	s2,32(sp)
c0012a48:	01412c23          	sw	s4,24(sp)
c0012a4c:	01712623          	sw	s7,12(sp)
c0012a50:	fb1f30ef          	jal	ra,c0006a00 <down>
c0012a54:	000b0513          	mv	a0,s6
c0012a58:	079000ef          	jal	ra,c00132d0 <strlen>
c0012a5c:	0ff00793          	li	a5,255
c0012a60:	10a7ec63          	bltu	a5,a0,c0012b78 <sfs_lookup_once.constprop.13+0x170>
c0012a64:	10400513          	li	a0,260
c0012a68:	b84f00ef          	jal	ra,c0002dec <kmalloc>
c0012a6c:	00050493          	mv	s1,a0
c0012a70:	0e050c63          	beqz	a0,c0012b68 <sfs_lookup_once.constprop.13+0x160>
c0012a74:	0009a783          	lw	a5,0(s3)
c0012a78:	0087aa03          	lw	s4,8(a5)
c0012a7c:	0b405063          	blez	s4,c0012b1c <sfs_lookup_once.constprop.13+0x114>
c0012a80:	00000413          	li	s0,0
c0012a84:	00450b93          	addi	s7,a0,4
c0012a88:	00c0006f          	j	c0012a94 <sfs_lookup_once.constprop.13+0x8c>
c0012a8c:	00140413          	addi	s0,s0,1
c0012a90:	088a0663          	beq	s4,s0,c0012b1c <sfs_lookup_once.constprop.13+0x114>
c0012a94:	00048693          	mv	a3,s1
c0012a98:	00040613          	mv	a2,s0
c0012a9c:	00098593          	mv	a1,s3
c0012aa0:	000a8513          	mv	a0,s5
c0012aa4:	b4cff0ef          	jal	ra,c0011df0 <sfs_dirent_read_nolock>
c0012aa8:	00050913          	mv	s2,a0
c0012aac:	06051a63          	bnez	a0,c0012b20 <sfs_lookup_once.constprop.13+0x118>
c0012ab0:	0004a783          	lw	a5,0(s1)
c0012ab4:	fc078ce3          	beqz	a5,c0012a8c <sfs_lookup_once.constprop.13+0x84>
c0012ab8:	000b8593          	mv	a1,s7
c0012abc:	000b0513          	mv	a0,s6
c0012ac0:	099000ef          	jal	ra,c0013358 <strcmp>
c0012ac4:	fc0514e3          	bnez	a0,c0012a8c <sfs_lookup_once.constprop.13+0x84>
c0012ac8:	00048513          	mv	a0,s1
c0012acc:	0004a403          	lw	s0,0(s1)
c0012ad0:	c3cf00ef          	jal	ra,c0002f0c <kfree>
c0012ad4:	000c0513          	mv	a0,s8
c0012ad8:	f25f30ef          	jal	ra,c00069fc <up>
c0012adc:	00040613          	mv	a2,s0
c0012ae0:	000c8593          	mv	a1,s9
c0012ae4:	000a8513          	mv	a0,s5
c0012ae8:	02c12083          	lw	ra,44(sp)
c0012aec:	02812403          	lw	s0,40(sp)
c0012af0:	02412483          	lw	s1,36(sp)
c0012af4:	02012903          	lw	s2,32(sp)
c0012af8:	01c12983          	lw	s3,28(sp)
c0012afc:	01812a03          	lw	s4,24(sp)
c0012b00:	01412a83          	lw	s5,20(sp)
c0012b04:	01012b03          	lw	s6,16(sp)
c0012b08:	00c12b83          	lw	s7,12(sp)
c0012b0c:	00812c03          	lw	s8,8(sp)
c0012b10:	00412c83          	lw	s9,4(sp)
c0012b14:	03010113          	addi	sp,sp,48
c0012b18:	c5dff06f          	j	c0012774 <sfs_load_inode>
c0012b1c:	ff000913          	li	s2,-16
c0012b20:	00048513          	mv	a0,s1
c0012b24:	be8f00ef          	jal	ra,c0002f0c <kfree>
c0012b28:	000c0513          	mv	a0,s8
c0012b2c:	ed1f30ef          	jal	ra,c00069fc <up>
c0012b30:	02c12083          	lw	ra,44(sp)
c0012b34:	00090513          	mv	a0,s2
c0012b38:	02812403          	lw	s0,40(sp)
c0012b3c:	02412483          	lw	s1,36(sp)
c0012b40:	02012903          	lw	s2,32(sp)
c0012b44:	01c12983          	lw	s3,28(sp)
c0012b48:	01812a03          	lw	s4,24(sp)
c0012b4c:	01412a83          	lw	s5,20(sp)
c0012b50:	01012b03          	lw	s6,16(sp)
c0012b54:	00c12b83          	lw	s7,12(sp)
c0012b58:	00812c03          	lw	s8,8(sp)
c0012b5c:	00412c83          	lw	s9,4(sp)
c0012b60:	03010113          	addi	sp,sp,48
c0012b64:	00008067          	ret
c0012b68:	000c0513          	mv	a0,s8
c0012b6c:	e91f30ef          	jal	ra,c00069fc <up>
c0012b70:	ffc00913          	li	s2,-4
c0012b74:	fbdff06f          	j	c0012b30 <sfs_lookup_once.constprop.13+0x128>
c0012b78:	00005697          	auipc	a3,0x5
c0012b7c:	a6868693          	addi	a3,a3,-1432 # c00175e0 <dev_node_ops+0x490>
c0012b80:	00001617          	auipc	a2,0x1
c0012b84:	29c60613          	addi	a2,a2,668 # c0013e1c <commands+0x164>
c0012b88:	1ba00593          	li	a1,442
c0012b8c:	00005517          	auipc	a0,0x5
c0012b90:	99c50513          	addi	a0,a0,-1636 # c0017528 <dev_node_ops+0x3d8>
c0012b94:	f30ed0ef          	jal	ra,c00002c4 <__panic>

c0012b98 <sfs_namefile>:
c0012b98:	00c5a783          	lw	a5,12(a1)
c0012b9c:	fa010113          	addi	sp,sp,-96
c0012ba0:	04912a23          	sw	s1,84(sp)
c0012ba4:	04112e23          	sw	ra,92(sp)
c0012ba8:	04812c23          	sw	s0,88(sp)
c0012bac:	05212823          	sw	s2,80(sp)
c0012bb0:	05312623          	sw	s3,76(sp)
c0012bb4:	05412423          	sw	s4,72(sp)
c0012bb8:	05512223          	sw	s5,68(sp)
c0012bbc:	05612023          	sw	s6,64(sp)
c0012bc0:	03712e23          	sw	s7,60(sp)
c0012bc4:	03812c23          	sw	s8,56(sp)
c0012bc8:	03912a23          	sw	s9,52(sp)
c0012bcc:	03a12823          	sw	s10,48(sp)
c0012bd0:	03b12623          	sw	s11,44(sp)
c0012bd4:	00b12623          	sw	a1,12(sp)
c0012bd8:	00200493          	li	s1,2
c0012bdc:	22f4fe63          	bleu	a5,s1,c0012e18 <sfs_namefile+0x280>
c0012be0:	00050993          	mv	s3,a0
c0012be4:	10400513          	li	a0,260
c0012be8:	a04f00ef          	jal	ra,c0002dec <kmalloc>
c0012bec:	00050413          	mv	s0,a0
c0012bf0:	22050463          	beqz	a0,c0012e18 <sfs_namefile+0x280>
c0012bf4:	0389aa03          	lw	s4,56(s3)
c0012bf8:	260a0463          	beqz	s4,c0012e60 <sfs_namefile+0x2c8>
c0012bfc:	06ca2783          	lw	a5,108(s4)
c0012c00:	26079063          	bnez	a5,c0012e60 <sfs_namefile+0x2c8>
c0012c04:	02c9ad03          	lw	s10,44(s3)
c0012c08:	000017b7          	lui	a5,0x1
c0012c0c:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
c0012c10:	26fd1863          	bne	s10,a5,c0012e80 <sfs_namefile+0x2e8>
c0012c14:	00c12703          	lw	a4,12(sp)
c0012c18:	00098513          	mv	a0,s3
c0012c1c:	00098a93          	mv	s5,s3
c0012c20:	00c72783          	lw	a5,12(a4)
c0012c24:	00072b83          	lw	s7,0(a4)
c0012c28:	00440c93          	addi	s9,s0,4
c0012c2c:	ffe78c13          	addi	s8,a5,-2
c0012c30:	00fb8bb3          	add	s7,s7,a5
c0012c34:	e7cfc0ef          	jal	ra,c000f2b0 <inode_ref_inc>
c0012c38:	01c10693          	addi	a3,sp,28
c0012c3c:	00005617          	auipc	a2,0x5
c0012c40:	9c860613          	addi	a2,a2,-1592 # c0017604 <dev_node_ops+0x4b4>
c0012c44:	000a8593          	mv	a1,s5
c0012c48:	000a0513          	mv	a0,s4
c0012c4c:	01a12223          	sw	s10,4(sp)
c0012c50:	00912423          	sw	s1,8(sp)
c0012c54:	db5ff0ef          	jal	ra,c0012a08 <sfs_lookup_once.constprop.13>
c0012c58:	00050d93          	mv	s11,a0
c0012c5c:	14051463          	bnez	a0,c0012da4 <sfs_namefile+0x20c>
c0012c60:	00098513          	mv	a0,s3
c0012c64:	004aa903          	lw	s2,4(s5)
c0012c68:	f3cfc0ef          	jal	ra,c000f3a4 <inode_ref_dec>
c0012c6c:	01c12483          	lw	s1,28(sp)
c0012c70:	14998463          	beq	s3,s1,c0012db8 <sfs_namefile+0x220>
c0012c74:	1a048663          	beqz	s1,c0012e20 <sfs_namefile+0x288>
c0012c78:	02c4a703          	lw	a4,44(s1)
c0012c7c:	00412783          	lw	a5,4(sp)
c0012c80:	1af71063          	bne	a4,a5,c0012e20 <sfs_namefile+0x288>
c0012c84:	0044a703          	lw	a4,4(s1)
c0012c88:	00048a93          	mv	s5,s1
c0012c8c:	1ae90a63          	beq	s2,a4,c0012e40 <sfs_namefile+0x2a8>
c0012c90:	0004a703          	lw	a4,0(s1)
c0012c94:	00812783          	lw	a5,8(sp)
c0012c98:	00475703          	lhu	a4,4(a4)
c0012c9c:	1af71263          	bne	a4,a5,c0012e40 <sfs_namefile+0x2a8>
c0012ca0:	01048b13          	addi	s6,s1,16
c0012ca4:	000b0513          	mv	a0,s6
c0012ca8:	d59f30ef          	jal	ra,c0006a00 <down>
c0012cac:	0004a703          	lw	a4,0(s1)
c0012cb0:	00872983          	lw	s3,8(a4)
c0012cb4:	01304c63          	bgtz	s3,c0012ccc <sfs_namefile+0x134>
c0012cb8:	0f80006f          	j	c0012db0 <sfs_namefile+0x218>
c0012cbc:	00042703          	lw	a4,0(s0)
c0012cc0:	08e90063          	beq	s2,a4,c0012d40 <sfs_namefile+0x1a8>
c0012cc4:	001d8d93          	addi	s11,s11,1 # 1001 <_binary_bin_swap_img_size-0x6cff>
c0012cc8:	0fb98463          	beq	s3,s11,c0012db0 <sfs_namefile+0x218>
c0012ccc:	00040693          	mv	a3,s0
c0012cd0:	000d8613          	mv	a2,s11
c0012cd4:	00048593          	mv	a1,s1
c0012cd8:	000a0513          	mv	a0,s4
c0012cdc:	914ff0ef          	jal	ra,c0011df0 <sfs_dirent_read_nolock>
c0012ce0:	00050d13          	mv	s10,a0
c0012ce4:	fc050ce3          	beqz	a0,c0012cbc <sfs_namefile+0x124>
c0012ce8:	000b0513          	mv	a0,s6
c0012cec:	d11f30ef          	jal	ra,c00069fc <up>
c0012cf0:	00048513          	mv	a0,s1
c0012cf4:	eb0fc0ef          	jal	ra,c000f3a4 <inode_ref_dec>
c0012cf8:	00040513          	mv	a0,s0
c0012cfc:	a10f00ef          	jal	ra,c0002f0c <kfree>
c0012d00:	05c12083          	lw	ra,92(sp)
c0012d04:	000d0513          	mv	a0,s10
c0012d08:	05812403          	lw	s0,88(sp)
c0012d0c:	05412483          	lw	s1,84(sp)
c0012d10:	05012903          	lw	s2,80(sp)
c0012d14:	04c12983          	lw	s3,76(sp)
c0012d18:	04812a03          	lw	s4,72(sp)
c0012d1c:	04412a83          	lw	s5,68(sp)
c0012d20:	04012b03          	lw	s6,64(sp)
c0012d24:	03c12b83          	lw	s7,60(sp)
c0012d28:	03812c03          	lw	s8,56(sp)
c0012d2c:	03412c83          	lw	s9,52(sp)
c0012d30:	03012d03          	lw	s10,48(sp)
c0012d34:	02c12d83          	lw	s11,44(sp)
c0012d38:	06010113          	addi	sp,sp,96
c0012d3c:	00008067          	ret
c0012d40:	000b0513          	mv	a0,s6
c0012d44:	cb9f30ef          	jal	ra,c00069fc <up>
c0012d48:	000c8513          	mv	a0,s9
c0012d4c:	584000ef          	jal	ra,c00132d0 <strlen>
c0012d50:	00150793          	addi	a5,a0,1
c0012d54:	0afc6e63          	bltu	s8,a5,c0012e10 <sfs_namefile+0x278>
c0012d58:	fff54913          	not	s2,a0
c0012d5c:	012b8933          	add	s2,s7,s2
c0012d60:	00050613          	mv	a2,a0
c0012d64:	000c8593          	mv	a1,s9
c0012d68:	00090513          	mv	a0,s2
c0012d6c:	40fc0c33          	sub	s8,s8,a5
c0012d70:	6b8000ef          	jal	ra,c0013428 <memcpy>
c0012d74:	02f00793          	li	a5,47
c0012d78:	fefb8fa3          	sb	a5,-1(s7)
c0012d7c:	01c10693          	addi	a3,sp,28
c0012d80:	00005617          	auipc	a2,0x5
c0012d84:	88460613          	addi	a2,a2,-1916 # c0017604 <dev_node_ops+0x4b4>
c0012d88:	000a8593          	mv	a1,s5
c0012d8c:	000a0513          	mv	a0,s4
c0012d90:	c79ff0ef          	jal	ra,c0012a08 <sfs_lookup_once.constprop.13>
c0012d94:	00048993          	mv	s3,s1
c0012d98:	00090b93          	mv	s7,s2
c0012d9c:	00050d93          	mv	s11,a0
c0012da0:	ec0500e3          	beqz	a0,c0012c60 <sfs_namefile+0xc8>
c0012da4:	00050d13          	mv	s10,a0
c0012da8:	00098493          	mv	s1,s3
c0012dac:	f45ff06f          	j	c0012cf0 <sfs_namefile+0x158>
c0012db0:	ff000d13          	li	s10,-16
c0012db4:	f35ff06f          	j	c0012ce8 <sfs_namefile+0x150>
c0012db8:	00098513          	mv	a0,s3
c0012dbc:	de8fc0ef          	jal	ra,c000f3a4 <inode_ref_dec>
c0012dc0:	00c12483          	lw	s1,12(sp)
c0012dc4:	000b8593          	mv	a1,s7
c0012dc8:	00000d13          	li	s10,0
c0012dcc:	00c4a783          	lw	a5,12(s1)
c0012dd0:	0004a503          	lw	a0,0(s1)
c0012dd4:	ffe78793          	addi	a5,a5,-2
c0012dd8:	41878c33          	sub	s8,a5,s8
c0012ddc:	000c0613          	mv	a2,s8
c0012de0:	00150513          	addi	a0,a0,1
c0012de4:	5f0000ef          	jal	ra,c00133d4 <memmove>
c0012de8:	02f00793          	li	a5,47
c0012dec:	fef50fa3          	sb	a5,-1(a0)
c0012df0:	01850533          	add	a0,a0,s8
c0012df4:	000c0593          	mv	a1,s8
c0012df8:	00050023          	sb	zero,0(a0)
c0012dfc:	00048513          	mv	a0,s1
c0012e00:	bfcf50ef          	jal	ra,c00081fc <iobuf_skip>
c0012e04:	00040513          	mv	a0,s0
c0012e08:	904f00ef          	jal	ra,c0002f0c <kfree>
c0012e0c:	ef5ff06f          	j	c0012d00 <sfs_namefile+0x168>
c0012e10:	ffc00d13          	li	s10,-4
c0012e14:	eddff06f          	j	c0012cf0 <sfs_namefile+0x158>
c0012e18:	ffc00d13          	li	s10,-4
c0012e1c:	ee5ff06f          	j	c0012d00 <sfs_namefile+0x168>
c0012e20:	00004697          	auipc	a3,0x4
c0012e24:	72068693          	addi	a3,a3,1824 # c0017540 <dev_node_ops+0x3f0>
c0012e28:	00001617          	auipc	a2,0x1
c0012e2c:	ff460613          	addi	a2,a2,-12 # c0013e1c <commands+0x164>
c0012e30:	2f800593          	li	a1,760
c0012e34:	00004517          	auipc	a0,0x4
c0012e38:	6f450513          	addi	a0,a0,1780 # c0017528 <dev_node_ops+0x3d8>
c0012e3c:	c88ed0ef          	jal	ra,c00002c4 <__panic>
c0012e40:	00004697          	auipc	a3,0x4
c0012e44:	7c868693          	addi	a3,a3,1992 # c0017608 <dev_node_ops+0x4b8>
c0012e48:	00001617          	auipc	a2,0x1
c0012e4c:	fd460613          	addi	a2,a2,-44 # c0013e1c <commands+0x164>
c0012e50:	2f900593          	li	a1,761
c0012e54:	00004517          	auipc	a0,0x4
c0012e58:	6d450513          	addi	a0,a0,1748 # c0017528 <dev_node_ops+0x3d8>
c0012e5c:	c68ed0ef          	jal	ra,c00002c4 <__panic>
c0012e60:	00004697          	auipc	a3,0x4
c0012e64:	52c68693          	addi	a3,a3,1324 # c001738c <dev_node_ops+0x23c>
c0012e68:	00001617          	auipc	a2,0x1
c0012e6c:	fb460613          	addi	a2,a2,-76 # c0013e1c <commands+0x164>
c0012e70:	2e400593          	li	a1,740
c0012e74:	00004517          	auipc	a0,0x4
c0012e78:	6b450513          	addi	a0,a0,1716 # c0017528 <dev_node_ops+0x3d8>
c0012e7c:	c48ed0ef          	jal	ra,c00002c4 <__panic>
c0012e80:	00004697          	auipc	a3,0x4
c0012e84:	6c068693          	addi	a3,a3,1728 # c0017540 <dev_node_ops+0x3f0>
c0012e88:	00001617          	auipc	a2,0x1
c0012e8c:	f9460613          	addi	a2,a2,-108 # c0013e1c <commands+0x164>
c0012e90:	2e500593          	li	a1,741
c0012e94:	00004517          	auipc	a0,0x4
c0012e98:	69450513          	addi	a0,a0,1684 # c0017528 <dev_node_ops+0x3d8>
c0012e9c:	c28ed0ef          	jal	ra,c00002c4 <__panic>

c0012ea0 <sfs_lookup>:
c0012ea0:	fd010113          	addi	sp,sp,-48
c0012ea4:	02912223          	sw	s1,36(sp)
c0012ea8:	03852483          	lw	s1,56(a0)
c0012eac:	02112623          	sw	ra,44(sp)
c0012eb0:	02812423          	sw	s0,40(sp)
c0012eb4:	03212023          	sw	s2,32(sp)
c0012eb8:	01312e23          	sw	s3,28(sp)
c0012ebc:	0a048463          	beqz	s1,c0012f64 <sfs_lookup+0xc4>
c0012ec0:	06c4a783          	lw	a5,108(s1)
c0012ec4:	0a079063          	bnez	a5,c0012f64 <sfs_lookup+0xc4>
c0012ec8:	0005c783          	lbu	a5,0(a1)
c0012ecc:	00058913          	mv	s2,a1
c0012ed0:	0c078a63          	beqz	a5,c0012fa4 <sfs_lookup+0x104>
c0012ed4:	02f00713          	li	a4,47
c0012ed8:	0ce78663          	beq	a5,a4,c0012fa4 <sfs_lookup+0x104>
c0012edc:	00050413          	mv	s0,a0
c0012ee0:	00060993          	mv	s3,a2
c0012ee4:	bccfc0ef          	jal	ra,c000f2b0 <inode_ref_inc>
c0012ee8:	02c42703          	lw	a4,44(s0)
c0012eec:	000017b7          	lui	a5,0x1
c0012ef0:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
c0012ef4:	08f71863          	bne	a4,a5,c0012f84 <sfs_lookup+0xe4>
c0012ef8:	00042703          	lw	a4,0(s0)
c0012efc:	00200793          	li	a5,2
c0012f00:	00475703          	lhu	a4,4(a4)
c0012f04:	04f71863          	bne	a4,a5,c0012f54 <sfs_lookup+0xb4>
c0012f08:	00048513          	mv	a0,s1
c0012f0c:	00c10693          	addi	a3,sp,12
c0012f10:	00090613          	mv	a2,s2
c0012f14:	00040593          	mv	a1,s0
c0012f18:	af1ff0ef          	jal	ra,c0012a08 <sfs_lookup_once.constprop.13>
c0012f1c:	00050493          	mv	s1,a0
c0012f20:	00040513          	mv	a0,s0
c0012f24:	c80fc0ef          	jal	ra,c000f3a4 <inode_ref_dec>
c0012f28:	00049663          	bnez	s1,c0012f34 <sfs_lookup+0x94>
c0012f2c:	00c12783          	lw	a5,12(sp)
c0012f30:	00f9a023          	sw	a5,0(s3)
c0012f34:	02c12083          	lw	ra,44(sp)
c0012f38:	00048513          	mv	a0,s1
c0012f3c:	02812403          	lw	s0,40(sp)
c0012f40:	02412483          	lw	s1,36(sp)
c0012f44:	02012903          	lw	s2,32(sp)
c0012f48:	01c12983          	lw	s3,28(sp)
c0012f4c:	03010113          	addi	sp,sp,48
c0012f50:	00008067          	ret
c0012f54:	00040513          	mv	a0,s0
c0012f58:	c4cfc0ef          	jal	ra,c000f3a4 <inode_ref_dec>
c0012f5c:	fee00493          	li	s1,-18
c0012f60:	fd5ff06f          	j	c0012f34 <sfs_lookup+0x94>
c0012f64:	00004697          	auipc	a3,0x4
c0012f68:	42868693          	addi	a3,a3,1064 # c001738c <dev_node_ops+0x23c>
c0012f6c:	00001617          	auipc	a2,0x1
c0012f70:	eb060613          	addi	a2,a2,-336 # c0013e1c <commands+0x164>
c0012f74:	3da00593          	li	a1,986
c0012f78:	00004517          	auipc	a0,0x4
c0012f7c:	5b050513          	addi	a0,a0,1456 # c0017528 <dev_node_ops+0x3d8>
c0012f80:	b44ed0ef          	jal	ra,c00002c4 <__panic>
c0012f84:	00004697          	auipc	a3,0x4
c0012f88:	5bc68693          	addi	a3,a3,1468 # c0017540 <dev_node_ops+0x3f0>
c0012f8c:	00001617          	auipc	a2,0x1
c0012f90:	e9060613          	addi	a2,a2,-368 # c0013e1c <commands+0x164>
c0012f94:	3dd00593          	li	a1,989
c0012f98:	00004517          	auipc	a0,0x4
c0012f9c:	59050513          	addi	a0,a0,1424 # c0017528 <dev_node_ops+0x3d8>
c0012fa0:	b24ed0ef          	jal	ra,c00002c4 <__panic>
c0012fa4:	00004697          	auipc	a3,0x4
c0012fa8:	61c68693          	addi	a3,a3,1564 # c00175c0 <dev_node_ops+0x470>
c0012fac:	00001617          	auipc	a2,0x1
c0012fb0:	e7060613          	addi	a2,a2,-400 # c0013e1c <commands+0x164>
c0012fb4:	3db00593          	li	a1,987
c0012fb8:	00004517          	auipc	a0,0x4
c0012fbc:	57050513          	addi	a0,a0,1392 # c0017528 <dev_node_ops+0x3d8>
c0012fc0:	b04ed0ef          	jal	ra,c00002c4 <__panic>

c0012fc4 <bitmap_translate.isra.0.part.1>:
c0012fc4:	ff010113          	addi	sp,sp,-16
c0012fc8:	00004697          	auipc	a3,0x4
c0012fcc:	7fc68693          	addi	a3,a3,2044 # c00177c4 <sfs_node_fileops+0x148>
c0012fd0:	00001617          	auipc	a2,0x1
c0012fd4:	e4c60613          	addi	a2,a2,-436 # c0013e1c <commands+0x164>
c0012fd8:	04c00593          	li	a1,76
c0012fdc:	00005517          	auipc	a0,0x5
c0012fe0:	80050513          	addi	a0,a0,-2048 # c00177dc <sfs_node_fileops+0x160>
c0012fe4:	00112623          	sw	ra,12(sp)
c0012fe8:	adced0ef          	jal	ra,c00002c4 <__panic>

c0012fec <bitmap_create>:
c0012fec:	fe010113          	addi	sp,sp,-32
c0012ff0:	00112e23          	sw	ra,28(sp)
c0012ff4:	00812c23          	sw	s0,24(sp)
c0012ff8:	00912a23          	sw	s1,20(sp)
c0012ffc:	01212823          	sw	s2,16(sp)
c0013000:	01312623          	sw	s3,12(sp)
c0013004:	01412423          	sw	s4,8(sp)
c0013008:	0c050a63          	beqz	a0,c00130dc <bitmap_create+0xf0>
c001300c:	02050793          	addi	a5,a0,32
c0013010:	00050413          	mv	s0,a0
c0013014:	0cf57463          	bleu	a5,a0,c00130dc <bitmap_create+0xf0>
c0013018:	00c00513          	li	a0,12
c001301c:	dd1ef0ef          	jal	ra,c0002dec <kmalloc>
c0013020:	00050493          	mv	s1,a0
c0013024:	08050263          	beqz	a0,c00130a8 <bitmap_create+0xbc>
c0013028:	01f40a13          	addi	s4,s0,31
c001302c:	005a5913          	srli	s2,s4,0x5
c0013030:	00291993          	slli	s3,s2,0x2
c0013034:	00098513          	mv	a0,s3
c0013038:	db5ef0ef          	jal	ra,c0002dec <kmalloc>
c001303c:	08050863          	beqz	a0,c00130cc <bitmap_create+0xe0>
c0013040:	0084a023          	sw	s0,0(s1)
c0013044:	0124a223          	sw	s2,4(s1)
c0013048:	00098613          	mv	a2,s3
c001304c:	0ff00593          	li	a1,255
c0013050:	368000ef          	jal	ra,c00133b8 <memset>
c0013054:	00a4a423          	sw	a0,8(s1)
c0013058:	fe0a7a13          	andi	s4,s4,-32
c001305c:	05440663          	beq	s0,s4,c00130a8 <bitmap_create+0xbc>
c0013060:	fff90913          	addi	s2,s2,-1
c0013064:	00591793          	slli	a5,s2,0x5
c0013068:	00545713          	srli	a4,s0,0x5
c001306c:	40f407b3          	sub	a5,s0,a5
c0013070:	0ae91663          	bne	s2,a4,c001311c <bitmap_create+0x130>
c0013074:	fff78713          	addi	a4,a5,-1
c0013078:	01e00693          	li	a3,30
c001307c:	08e6e063          	bltu	a3,a4,c00130fc <bitmap_create+0x110>
c0013080:	ffc98993          	addi	s3,s3,-4
c0013084:	013509b3          	add	s3,a0,s3
c0013088:	0009a703          	lw	a4,0(s3)
c001308c:	00100593          	li	a1,1
c0013090:	02000613          	li	a2,32
c0013094:	00f596b3          	sll	a3,a1,a5
c0013098:	00178793          	addi	a5,a5,1
c001309c:	00d74733          	xor	a4,a4,a3
c00130a0:	fec79ae3          	bne	a5,a2,c0013094 <bitmap_create+0xa8>
c00130a4:	00e9a023          	sw	a4,0(s3)
c00130a8:	01c12083          	lw	ra,28(sp)
c00130ac:	00048513          	mv	a0,s1
c00130b0:	01812403          	lw	s0,24(sp)
c00130b4:	01412483          	lw	s1,20(sp)
c00130b8:	01012903          	lw	s2,16(sp)
c00130bc:	00c12983          	lw	s3,12(sp)
c00130c0:	00812a03          	lw	s4,8(sp)
c00130c4:	02010113          	addi	sp,sp,32
c00130c8:	00008067          	ret
c00130cc:	00048513          	mv	a0,s1
c00130d0:	e3def0ef          	jal	ra,c0002f0c <kfree>
c00130d4:	00000493          	li	s1,0
c00130d8:	fd1ff06f          	j	c00130a8 <bitmap_create+0xbc>
c00130dc:	00004697          	auipc	a3,0x4
c00130e0:	67068693          	addi	a3,a3,1648 # c001774c <sfs_node_fileops+0xd0>
c00130e4:	00001617          	auipc	a2,0x1
c00130e8:	d3860613          	addi	a2,a2,-712 # c0013e1c <commands+0x164>
c00130ec:	01500593          	li	a1,21
c00130f0:	00004517          	auipc	a0,0x4
c00130f4:	6ec50513          	addi	a0,a0,1772 # c00177dc <sfs_node_fileops+0x160>
c00130f8:	9cced0ef          	jal	ra,c00002c4 <__panic>
c00130fc:	00004697          	auipc	a3,0x4
c0013100:	69068693          	addi	a3,a3,1680 # c001778c <sfs_node_fileops+0x110>
c0013104:	00001617          	auipc	a2,0x1
c0013108:	d1860613          	addi	a2,a2,-744 # c0013e1c <commands+0x164>
c001310c:	02b00593          	li	a1,43
c0013110:	00004517          	auipc	a0,0x4
c0013114:	6cc50513          	addi	a0,a0,1740 # c00177dc <sfs_node_fileops+0x160>
c0013118:	9aced0ef          	jal	ra,c00002c4 <__panic>
c001311c:	00004697          	auipc	a3,0x4
c0013120:	65868693          	addi	a3,a3,1624 # c0017774 <sfs_node_fileops+0xf8>
c0013124:	00001617          	auipc	a2,0x1
c0013128:	cf860613          	addi	a2,a2,-776 # c0013e1c <commands+0x164>
c001312c:	02a00593          	li	a1,42
c0013130:	00004517          	auipc	a0,0x4
c0013134:	6ac50513          	addi	a0,a0,1708 # c00177dc <sfs_node_fileops+0x160>
c0013138:	98ced0ef          	jal	ra,c00002c4 <__panic>

c001313c <bitmap_alloc>:
c001313c:	00452603          	lw	a2,4(a0)
c0013140:	00852503          	lw	a0,8(a0)
c0013144:	02060663          	beqz	a2,c0013170 <bitmap_alloc+0x34>
c0013148:	00052703          	lw	a4,0(a0)
c001314c:	00450793          	addi	a5,a0,4
c0013150:	00070c63          	beqz	a4,c0013168 <bitmap_alloc+0x2c>
c0013154:	0240006f          	j	c0013178 <bitmap_alloc+0x3c>
c0013158:	00078513          	mv	a0,a5
c001315c:	00478793          	addi	a5,a5,4
c0013160:	ffc7a683          	lw	a3,-4(a5)
c0013164:	00069e63          	bnez	a3,c0013180 <bitmap_alloc+0x44>
c0013168:	00170713          	addi	a4,a4,1
c001316c:	fee616e3          	bne	a2,a4,c0013158 <bitmap_alloc+0x1c>
c0013170:	ffc00513          	li	a0,-4
c0013174:	00008067          	ret
c0013178:	00070693          	mv	a3,a4
c001317c:	00000713          	li	a4,0
c0013180:	00000613          	li	a2,0
c0013184:	00100893          	li	a7,1
c0013188:	02000313          	li	t1,32
c001318c:	00c0006f          	j	c0013198 <bitmap_alloc+0x5c>
c0013190:	00160613          	addi	a2,a2,1
c0013194:	02660663          	beq	a2,t1,c00131c0 <bitmap_alloc+0x84>
c0013198:	00c897b3          	sll	a5,a7,a2
c001319c:	00d7f833          	and	a6,a5,a3
c00131a0:	fe0808e3          	beqz	a6,c0013190 <bitmap_alloc+0x54>
c00131a4:	00d7c6b3          	xor	a3,a5,a3
c00131a8:	00571793          	slli	a5,a4,0x5
c00131ac:	00d52023          	sw	a3,0(a0)
c00131b0:	00c787b3          	add	a5,a5,a2
c00131b4:	00f5a023          	sw	a5,0(a1)
c00131b8:	00000513          	li	a0,0
c00131bc:	00008067          	ret
c00131c0:	ff010113          	addi	sp,sp,-16
c00131c4:	00002697          	auipc	a3,0x2
c00131c8:	50868693          	addi	a3,a3,1288 # c00156cc <default_pmm_manager+0x3dc>
c00131cc:	00001617          	auipc	a2,0x1
c00131d0:	c5060613          	addi	a2,a2,-944 # c0013e1c <commands+0x164>
c00131d4:	04300593          	li	a1,67
c00131d8:	00004517          	auipc	a0,0x4
c00131dc:	60450513          	addi	a0,a0,1540 # c00177dc <sfs_node_fileops+0x160>
c00131e0:	00112623          	sw	ra,12(sp)
c00131e4:	8e0ed0ef          	jal	ra,c00002c4 <__panic>

c00131e8 <bitmap_test>:
c00131e8:	00052783          	lw	a5,0(a0)
c00131ec:	02f5f463          	bleu	a5,a1,c0013214 <bitmap_test+0x2c>
c00131f0:	00852783          	lw	a5,8(a0)
c00131f4:	0055d713          	srli	a4,a1,0x5
c00131f8:	00271713          	slli	a4,a4,0x2
c00131fc:	00e787b3          	add	a5,a5,a4
c0013200:	0007a503          	lw	a0,0(a5)
c0013204:	00100793          	li	a5,1
c0013208:	00b795b3          	sll	a1,a5,a1
c001320c:	00a5f533          	and	a0,a1,a0
c0013210:	00008067          	ret
c0013214:	ff010113          	addi	sp,sp,-16
c0013218:	00112623          	sw	ra,12(sp)
c001321c:	da9ff0ef          	jal	ra,c0012fc4 <bitmap_translate.isra.0.part.1>

c0013220 <bitmap_free>:
c0013220:	00052783          	lw	a5,0(a0)
c0013224:	ff010113          	addi	sp,sp,-16
c0013228:	00112623          	sw	ra,12(sp)
c001322c:	02f5fe63          	bleu	a5,a1,c0013268 <bitmap_free+0x48>
c0013230:	00852783          	lw	a5,8(a0)
c0013234:	0055d713          	srli	a4,a1,0x5
c0013238:	00271713          	slli	a4,a4,0x2
c001323c:	00e787b3          	add	a5,a5,a4
c0013240:	0007a703          	lw	a4,0(a5)
c0013244:	00100693          	li	a3,1
c0013248:	00b695b3          	sll	a1,a3,a1
c001324c:	00b776b3          	and	a3,a4,a1
c0013250:	00069e63          	bnez	a3,c001326c <bitmap_free+0x4c>
c0013254:	00c12083          	lw	ra,12(sp)
c0013258:	00b76733          	or	a4,a4,a1
c001325c:	00e7a023          	sw	a4,0(a5)
c0013260:	01010113          	addi	sp,sp,16
c0013264:	00008067          	ret
c0013268:	d5dff0ef          	jal	ra,c0012fc4 <bitmap_translate.isra.0.part.1>
c001326c:	00004697          	auipc	a3,0x4
c0013270:	54868693          	addi	a3,a3,1352 # c00177b4 <sfs_node_fileops+0x138>
c0013274:	00001617          	auipc	a2,0x1
c0013278:	ba860613          	addi	a2,a2,-1112 # c0013e1c <commands+0x164>
c001327c:	05f00593          	li	a1,95
c0013280:	00004517          	auipc	a0,0x4
c0013284:	55c50513          	addi	a0,a0,1372 # c00177dc <sfs_node_fileops+0x160>
c0013288:	83ced0ef          	jal	ra,c00002c4 <__panic>

c001328c <bitmap_destroy>:
c001328c:	ff010113          	addi	sp,sp,-16
c0013290:	00812423          	sw	s0,8(sp)
c0013294:	00050413          	mv	s0,a0
c0013298:	00852503          	lw	a0,8(a0)
c001329c:	00112623          	sw	ra,12(sp)
c00132a0:	c6def0ef          	jal	ra,c0002f0c <kfree>
c00132a4:	00040513          	mv	a0,s0
c00132a8:	00c12083          	lw	ra,12(sp)
c00132ac:	00812403          	lw	s0,8(sp)
c00132b0:	01010113          	addi	sp,sp,16
c00132b4:	c59ef06f          	j	c0002f0c <kfree>

c00132b8 <bitmap_getdata>:
c00132b8:	00058863          	beqz	a1,c00132c8 <bitmap_getdata+0x10>
c00132bc:	00452783          	lw	a5,4(a0)
c00132c0:	00279793          	slli	a5,a5,0x2
c00132c4:	00f5a023          	sw	a5,0(a1)
c00132c8:	00852503          	lw	a0,8(a0)
c00132cc:	00008067          	ret

c00132d0 <strlen>:
c00132d0:	00054703          	lbu	a4,0(a0)
c00132d4:	00050693          	mv	a3,a0
c00132d8:	00150793          	addi	a5,a0,1
c00132dc:	00070c63          	beqz	a4,c00132f4 <strlen+0x24>
c00132e0:	40d78533          	sub	a0,a5,a3
c00132e4:	00178793          	addi	a5,a5,1
c00132e8:	fff7c703          	lbu	a4,-1(a5)
c00132ec:	fe071ae3          	bnez	a4,c00132e0 <strlen+0x10>
c00132f0:	00008067          	ret
c00132f4:	00000513          	li	a0,0
c00132f8:	00008067          	ret

c00132fc <strnlen>:
c00132fc:	00050693          	mv	a3,a0
c0013300:	02058a63          	beqz	a1,c0013334 <strnlen+0x38>
c0013304:	00054703          	lbu	a4,0(a0)
c0013308:	00150793          	addi	a5,a0,1
c001330c:	02070463          	beqz	a4,c0013334 <strnlen+0x38>
c0013310:	00b505b3          	add	a1,a0,a1
c0013314:	0100006f          	j	c0013324 <strnlen+0x28>
c0013318:	00178793          	addi	a5,a5,1
c001331c:	fff7c703          	lbu	a4,-1(a5)
c0013320:	00070863          	beqz	a4,c0013330 <strnlen+0x34>
c0013324:	40d78533          	sub	a0,a5,a3
c0013328:	feb798e3          	bne	a5,a1,c0013318 <strnlen+0x1c>
c001332c:	00008067          	ret
c0013330:	00008067          	ret
c0013334:	00000513          	li	a0,0
c0013338:	00008067          	ret

c001333c <strcpy>:
c001333c:	00050793          	mv	a5,a0
c0013340:	00158593          	addi	a1,a1,1
c0013344:	fff5c703          	lbu	a4,-1(a1)
c0013348:	00178793          	addi	a5,a5,1
c001334c:	fee78fa3          	sb	a4,-1(a5)
c0013350:	fe0718e3          	bnez	a4,c0013340 <strcpy+0x4>
c0013354:	00008067          	ret

c0013358 <strcmp>:
c0013358:	00054783          	lbu	a5,0(a0)
c001335c:	0005c703          	lbu	a4,0(a1)
c0013360:	02078263          	beqz	a5,c0013384 <strcmp+0x2c>
c0013364:	02e79063          	bne	a5,a4,c0013384 <strcmp+0x2c>
c0013368:	00150513          	addi	a0,a0,1
c001336c:	00054783          	lbu	a5,0(a0)
c0013370:	00158693          	addi	a3,a1,1
c0013374:	0015c703          	lbu	a4,1(a1)
c0013378:	00078663          	beqz	a5,c0013384 <strcmp+0x2c>
c001337c:	00068593          	mv	a1,a3
c0013380:	fee784e3          	beq	a5,a4,c0013368 <strcmp+0x10>
c0013384:	40e78533          	sub	a0,a5,a4
c0013388:	00008067          	ret

c001338c <strchr>:
c001338c:	00054783          	lbu	a5,0(a0)
c0013390:	00078e63          	beqz	a5,c00133ac <strchr+0x20>
c0013394:	00f59663          	bne	a1,a5,c00133a0 <strchr+0x14>
c0013398:	01c0006f          	j	c00133b4 <strchr+0x28>
c001339c:	00b78a63          	beq	a5,a1,c00133b0 <strchr+0x24>
c00133a0:	00150513          	addi	a0,a0,1
c00133a4:	00054783          	lbu	a5,0(a0)
c00133a8:	fe079ae3          	bnez	a5,c001339c <strchr+0x10>
c00133ac:	00000513          	li	a0,0
c00133b0:	00008067          	ret
c00133b4:	00008067          	ret

c00133b8 <memset>:
c00133b8:	00c50733          	add	a4,a0,a2
c00133bc:	00050793          	mv	a5,a0
c00133c0:	00060863          	beqz	a2,c00133d0 <memset+0x18>
c00133c4:	00178793          	addi	a5,a5,1
c00133c8:	feb78fa3          	sb	a1,-1(a5)
c00133cc:	fef71ce3          	bne	a4,a5,c00133c4 <memset+0xc>
c00133d0:	00008067          	ret

c00133d4 <memmove>:
c00133d4:	02a5f663          	bleu	a0,a1,c0013400 <memmove+0x2c>
c00133d8:	00c587b3          	add	a5,a1,a2
c00133dc:	02f57263          	bleu	a5,a0,c0013400 <memmove+0x2c>
c00133e0:	00c50733          	add	a4,a0,a2
c00133e4:	02060e63          	beqz	a2,c0013420 <memmove+0x4c>
c00133e8:	fff78793          	addi	a5,a5,-1
c00133ec:	0007c683          	lbu	a3,0(a5)
c00133f0:	fff70713          	addi	a4,a4,-1
c00133f4:	00d70023          	sb	a3,0(a4)
c00133f8:	fef598e3          	bne	a1,a5,c00133e8 <memmove+0x14>
c00133fc:	00008067          	ret
c0013400:	00c586b3          	add	a3,a1,a2
c0013404:	00050793          	mv	a5,a0
c0013408:	00060e63          	beqz	a2,c0013424 <memmove+0x50>
c001340c:	00158593          	addi	a1,a1,1
c0013410:	fff5c703          	lbu	a4,-1(a1)
c0013414:	00178793          	addi	a5,a5,1
c0013418:	fee78fa3          	sb	a4,-1(a5)
c001341c:	feb698e3          	bne	a3,a1,c001340c <memmove+0x38>
c0013420:	00008067          	ret
c0013424:	00008067          	ret

c0013428 <memcpy>:
c0013428:	00c586b3          	add	a3,a1,a2
c001342c:	00050793          	mv	a5,a0
c0013430:	00060c63          	beqz	a2,c0013448 <memcpy+0x20>
c0013434:	00158593          	addi	a1,a1,1
c0013438:	fff5c703          	lbu	a4,-1(a1)
c001343c:	00178793          	addi	a5,a5,1
c0013440:	fee78fa3          	sb	a4,-1(a5)
c0013444:	feb698e3          	bne	a3,a1,c0013434 <memcpy+0xc>
c0013448:	00008067          	ret

c001344c <printnum>:
c001344c:	fd010113          	addi	sp,sp,-48
c0013450:	02912223          	sw	s1,36(sp)
c0013454:	03212023          	sw	s2,32(sp)
c0013458:	01312e23          	sw	s3,28(sp)
c001345c:	01412c23          	sw	s4,24(sp)
c0013460:	01512a23          	sw	s5,20(sp)
c0013464:	02112623          	sw	ra,44(sp)
c0013468:	02812423          	sw	s0,40(sp)
c001346c:	00050493          	mv	s1,a0
c0013470:	00058993          	mv	s3,a1
c0013474:	00060913          	mv	s2,a2
c0013478:	03012a03          	lw	s4,48(sp)
c001347c:	03077ab3          	remu	s5,a4,a6
c0013480:	06079463          	bnez	a5,c00134e8 <printnum+0x9c>
c0013484:	07077263          	bleu	a6,a4,c00134e8 <printnum+0x9c>
c0013488:	fff88413          	addi	s0,a7,-1
c001348c:	00805e63          	blez	s0,c00134a8 <printnum+0x5c>
c0013490:	fff40413          	addi	s0,s0,-1
c0013494:	00098613          	mv	a2,s3
c0013498:	00090593          	mv	a1,s2
c001349c:	000a0513          	mv	a0,s4
c00134a0:	000480e7          	jalr	s1
c00134a4:	fe0416e3          	bnez	s0,c0013490 <printnum+0x44>
c00134a8:	00004797          	auipc	a5,0x4
c00134ac:	50878793          	addi	a5,a5,1288 # c00179b0 <error_string+0x64>
c00134b0:	015787b3          	add	a5,a5,s5
c00134b4:	00098613          	mv	a2,s3
c00134b8:	00090593          	mv	a1,s2
c00134bc:	00048313          	mv	t1,s1
c00134c0:	02c12083          	lw	ra,44(sp)
c00134c4:	02812403          	lw	s0,40(sp)
c00134c8:	02412483          	lw	s1,36(sp)
c00134cc:	02012903          	lw	s2,32(sp)
c00134d0:	01c12983          	lw	s3,28(sp)
c00134d4:	01812a03          	lw	s4,24(sp)
c00134d8:	01412a83          	lw	s5,20(sp)
c00134dc:	0007c503          	lbu	a0,0(a5)
c00134e0:	03010113          	addi	sp,sp,48
c00134e4:	00030067          	jr	t1
c00134e8:	03075733          	divu	a4,a4,a6
c00134ec:	01412023          	sw	s4,0(sp)
c00134f0:	fff88893          	addi	a7,a7,-1
c00134f4:	00000793          	li	a5,0
c00134f8:	00090613          	mv	a2,s2
c00134fc:	00098593          	mv	a1,s3
c0013500:	00048513          	mv	a0,s1
c0013504:	f49ff0ef          	jal	ra,c001344c <printnum>
c0013508:	fa1ff06f          	j	c00134a8 <printnum+0x5c>

c001350c <sprintputch>:
c001350c:	0085a783          	lw	a5,8(a1)
c0013510:	0005a703          	lw	a4,0(a1)
c0013514:	0045a683          	lw	a3,4(a1)
c0013518:	00178793          	addi	a5,a5,1
c001351c:	00f5a423          	sw	a5,8(a1)
c0013520:	00d77863          	bleu	a3,a4,c0013530 <sprintputch+0x24>
c0013524:	00170793          	addi	a5,a4,1
c0013528:	00f5a023          	sw	a5,0(a1)
c001352c:	00a70023          	sb	a0,0(a4)
c0013530:	00008067          	ret

c0013534 <vprintfmt>:
c0013534:	fa010113          	addi	sp,sp,-96
c0013538:	05212823          	sw	s2,80(sp)
c001353c:	05312623          	sw	s3,76(sp)
c0013540:	05412423          	sw	s4,72(sp)
c0013544:	05512223          	sw	s5,68(sp)
c0013548:	05612023          	sw	s6,64(sp)
c001354c:	03712e23          	sw	s7,60(sp)
c0013550:	03812c23          	sw	s8,56(sp)
c0013554:	03a12823          	sw	s10,48(sp)
c0013558:	04112e23          	sw	ra,92(sp)
c001355c:	04812c23          	sw	s0,88(sp)
c0013560:	04912a23          	sw	s1,84(sp)
c0013564:	03912a23          	sw	s9,52(sp)
c0013568:	03b12623          	sw	s11,44(sp)
c001356c:	00050a13          	mv	s4,a0
c0013570:	00058993          	mv	s3,a1
c0013574:	00060913          	mv	s2,a2
c0013578:	00068d13          	mv	s10,a3
c001357c:	00070b13          	mv	s6,a4
c0013580:	00004a97          	auipc	s5,0x4
c0013584:	274a8a93          	addi	s5,s5,628 # c00177f4 <sfs_node_fileops+0x178>
c0013588:	fff00b93          	li	s7,-1
c001358c:	05e00c13          	li	s8,94
c0013590:	000d4503          	lbu	a0,0(s10)
c0013594:	02500493          	li	s1,37
c0013598:	001d0413          	addi	s0,s10,1
c001359c:	02950063          	beq	a0,s1,c00135bc <vprintfmt+0x88>
c00135a0:	06050663          	beqz	a0,c001360c <vprintfmt+0xd8>
c00135a4:	00098613          	mv	a2,s3
c00135a8:	00090593          	mv	a1,s2
c00135ac:	00140413          	addi	s0,s0,1
c00135b0:	000a00e7          	jalr	s4
c00135b4:	fff44503          	lbu	a0,-1(s0)
c00135b8:	fe9514e3          	bne	a0,s1,c00135a0 <vprintfmt+0x6c>
c00135bc:	00044e03          	lbu	t3,0(s0)
c00135c0:	fff00d93          	li	s11,-1
c00135c4:	02000693          	li	a3,32
c00135c8:	00000493          	li	s1,0
c00135cc:	00000593          	li	a1,0
c00135d0:	000d8c93          	mv	s9,s11
c00135d4:	05500713          	li	a4,85
c00135d8:	00100313          	li	t1,1
c00135dc:	03000813          	li	a6,48
c00135e0:	00900613          	li	a2,9
c00135e4:	02d00513          	li	a0,45
c00135e8:	fdde0793          	addi	a5,t3,-35
c00135ec:	0ff7f793          	andi	a5,a5,255
c00135f0:	00140d13          	addi	s10,s0,1
c00135f4:	34f76a63          	bltu	a4,a5,c0013948 <vprintfmt+0x414>
c00135f8:	00279793          	slli	a5,a5,0x2
c00135fc:	015787b3          	add	a5,a5,s5
c0013600:	0007a783          	lw	a5,0(a5)
c0013604:	015787b3          	add	a5,a5,s5
c0013608:	00078067          	jr	a5
c001360c:	05c12083          	lw	ra,92(sp)
c0013610:	05812403          	lw	s0,88(sp)
c0013614:	05412483          	lw	s1,84(sp)
c0013618:	05012903          	lw	s2,80(sp)
c001361c:	04c12983          	lw	s3,76(sp)
c0013620:	04812a03          	lw	s4,72(sp)
c0013624:	04412a83          	lw	s5,68(sp)
c0013628:	04012b03          	lw	s6,64(sp)
c001362c:	03c12b83          	lw	s7,60(sp)
c0013630:	03812c03          	lw	s8,56(sp)
c0013634:	03412c83          	lw	s9,52(sp)
c0013638:	03012d03          	lw	s10,48(sp)
c001363c:	02c12d83          	lw	s11,44(sp)
c0013640:	06010113          	addi	sp,sp,96
c0013644:	00008067          	ret
c0013648:	00100793          	li	a5,1
c001364c:	36b7c863          	blt	a5,a1,c00139bc <vprintfmt+0x488>
c0013650:	000b2703          	lw	a4,0(s6)
c0013654:	00000793          	li	a5,0
c0013658:	004b0b13          	addi	s6,s6,4
c001365c:	01000813          	li	a6,16
c0013660:	00d12023          	sw	a3,0(sp)
c0013664:	000c8893          	mv	a7,s9
c0013668:	00090613          	mv	a2,s2
c001366c:	00098593          	mv	a1,s3
c0013670:	000a0513          	mv	a0,s4
c0013674:	dd9ff0ef          	jal	ra,c001344c <printnum>
c0013678:	f19ff06f          	j	c0013590 <vprintfmt+0x5c>
c001367c:	00144e03          	lbu	t3,1(s0)
c0013680:	00030493          	mv	s1,t1
c0013684:	000d0413          	mv	s0,s10
c0013688:	f61ff06f          	j	c00135e8 <vprintfmt+0xb4>
c001368c:	000b2503          	lw	a0,0(s6)
c0013690:	00098613          	mv	a2,s3
c0013694:	00090593          	mv	a1,s2
c0013698:	004b0b13          	addi	s6,s6,4
c001369c:	000a00e7          	jalr	s4
c00136a0:	ef1ff06f          	j	c0013590 <vprintfmt+0x5c>
c00136a4:	00100793          	li	a5,1
c00136a8:	32b7c863          	blt	a5,a1,c00139d8 <vprintfmt+0x4a4>
c00136ac:	000b2703          	lw	a4,0(s6)
c00136b0:	004b0b13          	addi	s6,s6,4
c00136b4:	41f75793          	srai	a5,a4,0x1f
c00136b8:	00a00813          	li	a6,10
c00136bc:	fa07d2e3          	bgez	a5,c0013660 <vprintfmt+0x12c>
c00136c0:	00098613          	mv	a2,s3
c00136c4:	00090593          	mv	a1,s2
c00136c8:	02d00513          	li	a0,45
c00136cc:	00f12e23          	sw	a5,28(sp)
c00136d0:	00e12c23          	sw	a4,24(sp)
c00136d4:	01012a23          	sw	a6,20(sp)
c00136d8:	00d12823          	sw	a3,16(sp)
c00136dc:	000a00e7          	jalr	s4
c00136e0:	01812703          	lw	a4,24(sp)
c00136e4:	01c12783          	lw	a5,28(sp)
c00136e8:	01012683          	lw	a3,16(sp)
c00136ec:	40e00733          	neg	a4,a4
c00136f0:	00e03633          	snez	a2,a4
c00136f4:	40f007b3          	neg	a5,a5
c00136f8:	40c787b3          	sub	a5,a5,a2
c00136fc:	01412803          	lw	a6,20(sp)
c0013700:	f61ff06f          	j	c0013660 <vprintfmt+0x12c>
c0013704:	000b2783          	lw	a5,0(s6)
c0013708:	01800693          	li	a3,24
c001370c:	004b0b13          	addi	s6,s6,4
c0013710:	41f7d713          	srai	a4,a5,0x1f
c0013714:	00f747b3          	xor	a5,a4,a5
c0013718:	40e787b3          	sub	a5,a5,a4
c001371c:	2cf6ca63          	blt	a3,a5,c00139f0 <vprintfmt+0x4bc>
c0013720:	00279693          	slli	a3,a5,0x2
c0013724:	00004717          	auipc	a4,0x4
c0013728:	22870713          	addi	a4,a4,552 # c001794c <error_string>
c001372c:	00d70733          	add	a4,a4,a3
c0013730:	00072703          	lw	a4,0(a4)
c0013734:	2a070e63          	beqz	a4,c00139f0 <vprintfmt+0x4bc>
c0013738:	00000697          	auipc	a3,0x0
c001373c:	46068693          	addi	a3,a3,1120 # c0013b98 <etext+0x24>
c0013740:	00090613          	mv	a2,s2
c0013744:	00098593          	mv	a1,s3
c0013748:	000a0513          	mv	a0,s4
c001374c:	334000ef          	jal	ra,c0013a80 <printfmt>
c0013750:	e41ff06f          	j	c0013590 <vprintfmt+0x5c>
c0013754:	00144e03          	lbu	t3,1(s0)
c0013758:	00158593          	addi	a1,a1,1
c001375c:	000d0413          	mv	s0,s10
c0013760:	e89ff06f          	j	c00135e8 <vprintfmt+0xb4>
c0013764:	00100793          	li	a5,1
c0013768:	20b7ce63          	blt	a5,a1,c0013984 <vprintfmt+0x450>
c001376c:	000b2703          	lw	a4,0(s6)
c0013770:	00000793          	li	a5,0
c0013774:	004b0b13          	addi	s6,s6,4
c0013778:	00800813          	li	a6,8
c001377c:	ee5ff06f          	j	c0013660 <vprintfmt+0x12c>
c0013780:	03000513          	li	a0,48
c0013784:	00098613          	mv	a2,s3
c0013788:	00090593          	mv	a1,s2
c001378c:	00d12823          	sw	a3,16(sp)
c0013790:	000a00e7          	jalr	s4
c0013794:	00098613          	mv	a2,s3
c0013798:	00090593          	mv	a1,s2
c001379c:	07800513          	li	a0,120
c00137a0:	000a00e7          	jalr	s4
c00137a4:	000b2703          	lw	a4,0(s6)
c00137a8:	00000793          	li	a5,0
c00137ac:	01000813          	li	a6,16
c00137b0:	004b0b13          	addi	s6,s6,4
c00137b4:	01012683          	lw	a3,16(sp)
c00137b8:	ea9ff06f          	j	c0013660 <vprintfmt+0x12c>
c00137bc:	000b2403          	lw	s0,0(s6)
c00137c0:	004b0793          	addi	a5,s6,4
c00137c4:	00f12a23          	sw	a5,20(sp)
c00137c8:	26040463          	beqz	s0,c0013a30 <vprintfmt+0x4fc>
c00137cc:	05905463          	blez	s9,c0013814 <vprintfmt+0x2e0>
c00137d0:	02d00793          	li	a5,45
c00137d4:	22f68e63          	beq	a3,a5,c0013a10 <vprintfmt+0x4dc>
c00137d8:	000d8593          	mv	a1,s11
c00137dc:	00040513          	mv	a0,s0
c00137e0:	00d12823          	sw	a3,16(sp)
c00137e4:	b19ff0ef          	jal	ra,c00132fc <strnlen>
c00137e8:	40ac8cb3          	sub	s9,s9,a0
c00137ec:	03905463          	blez	s9,c0013814 <vprintfmt+0x2e0>
c00137f0:	01012683          	lw	a3,16(sp)
c00137f4:	00068513          	mv	a0,a3
c00137f8:	00098613          	mv	a2,s3
c00137fc:	00090593          	mv	a1,s2
c0013800:	00d12823          	sw	a3,16(sp)
c0013804:	fffc8c93          	addi	s9,s9,-1
c0013808:	000a00e7          	jalr	s4
c001380c:	01012683          	lw	a3,16(sp)
c0013810:	fe0c92e3          	bnez	s9,c00137f4 <vprintfmt+0x2c0>
c0013814:	00044783          	lbu	a5,0(s0)
c0013818:	00140b13          	addi	s6,s0,1
c001381c:	00078513          	mv	a0,a5
c0013820:	06078063          	beqz	a5,c0013880 <vprintfmt+0x34c>
c0013824:	03f00413          	li	s0,63
c0013828:	000dc663          	bltz	s11,c0013834 <vprintfmt+0x300>
c001382c:	fffd8d93          	addi	s11,s11,-1
c0013830:	037d8863          	beq	s11,s7,c0013860 <vprintfmt+0x32c>
c0013834:	00098613          	mv	a2,s3
c0013838:	00090593          	mv	a1,s2
c001383c:	00048663          	beqz	s1,c0013848 <vprintfmt+0x314>
c0013840:	fe078793          	addi	a5,a5,-32
c0013844:	12fc6a63          	bltu	s8,a5,c0013978 <vprintfmt+0x444>
c0013848:	000a00e7          	jalr	s4
c001384c:	001b0b13          	addi	s6,s6,1
c0013850:	fffb4783          	lbu	a5,-1(s6)
c0013854:	fffc8c93          	addi	s9,s9,-1
c0013858:	00078513          	mv	a0,a5
c001385c:	fc0796e3          	bnez	a5,c0013828 <vprintfmt+0x2f4>
c0013860:	03905063          	blez	s9,c0013880 <vprintfmt+0x34c>
c0013864:	02000413          	li	s0,32
c0013868:	fffc8c93          	addi	s9,s9,-1
c001386c:	00098613          	mv	a2,s3
c0013870:	00090593          	mv	a1,s2
c0013874:	00040513          	mv	a0,s0
c0013878:	000a00e7          	jalr	s4
c001387c:	fe0c96e3          	bnez	s9,c0013868 <vprintfmt+0x334>
c0013880:	01412b03          	lw	s6,20(sp)
c0013884:	d0dff06f          	j	c0013590 <vprintfmt+0x5c>
c0013888:	00100793          	li	a5,1
c001388c:	10b7ca63          	blt	a5,a1,c00139a0 <vprintfmt+0x46c>
c0013890:	000b2703          	lw	a4,0(s6)
c0013894:	00000793          	li	a5,0
c0013898:	004b0b13          	addi	s6,s6,4
c001389c:	00a00813          	li	a6,10
c00138a0:	dc1ff06f          	j	c0013660 <vprintfmt+0x12c>
c00138a4:	00144e03          	lbu	t3,1(s0)
c00138a8:	00050693          	mv	a3,a0
c00138ac:	000d0413          	mv	s0,s10
c00138b0:	d39ff06f          	j	c00135e8 <vprintfmt+0xb4>
c00138b4:	00098613          	mv	a2,s3
c00138b8:	00090593          	mv	a1,s2
c00138bc:	02500513          	li	a0,37
c00138c0:	000a00e7          	jalr	s4
c00138c4:	ccdff06f          	j	c0013590 <vprintfmt+0x5c>
c00138c8:	000b2d83          	lw	s11,0(s6)
c00138cc:	00144e03          	lbu	t3,1(s0)
c00138d0:	004b0b13          	addi	s6,s6,4
c00138d4:	000d0413          	mv	s0,s10
c00138d8:	d00cd8e3          	bgez	s9,c00135e8 <vprintfmt+0xb4>
c00138dc:	000d8c93          	mv	s9,s11
c00138e0:	fff00d93          	li	s11,-1
c00138e4:	d05ff06f          	j	c00135e8 <vprintfmt+0xb4>
c00138e8:	00144e03          	lbu	t3,1(s0)
c00138ec:	00080693          	mv	a3,a6
c00138f0:	000d0413          	mv	s0,s10
c00138f4:	cf5ff06f          	j	c00135e8 <vprintfmt+0xb4>
c00138f8:	00144e83          	lbu	t4,1(s0)
c00138fc:	fd0e0d93          	addi	s11,t3,-48
c0013900:	fd0e8793          	addi	a5,t4,-48
c0013904:	14f66c63          	bltu	a2,a5,c0013a5c <vprintfmt+0x528>
c0013908:	000d0413          	mv	s0,s10
c001390c:	002d9793          	slli	a5,s11,0x2
c0013910:	01b78db3          	add	s11,a5,s11
c0013914:	00140413          	addi	s0,s0,1
c0013918:	001d9d93          	slli	s11,s11,0x1
c001391c:	01dd8db3          	add	s11,s11,t4
c0013920:	00044e83          	lbu	t4,0(s0)
c0013924:	fd0d8d93          	addi	s11,s11,-48
c0013928:	fd0e8793          	addi	a5,t4,-48
c001392c:	fef670e3          	bleu	a5,a2,c001390c <vprintfmt+0x3d8>
c0013930:	000e8e13          	mv	t3,t4
c0013934:	fa5ff06f          	j	c00138d8 <vprintfmt+0x3a4>
c0013938:	0e0cc863          	bltz	s9,c0013a28 <vprintfmt+0x4f4>
c001393c:	00144e03          	lbu	t3,1(s0)
c0013940:	000d0413          	mv	s0,s10
c0013944:	ca5ff06f          	j	c00135e8 <vprintfmt+0xb4>
c0013948:	00098613          	mv	a2,s3
c001394c:	00090593          	mv	a1,s2
c0013950:	02500513          	li	a0,37
c0013954:	000a00e7          	jalr	s4
c0013958:	fff44783          	lbu	a5,-1(s0)
c001395c:	02500713          	li	a4,37
c0013960:	00040d13          	mv	s10,s0
c0013964:	c2e786e3          	beq	a5,a4,c0013590 <vprintfmt+0x5c>
c0013968:	fffd0d13          	addi	s10,s10,-1
c001396c:	fffd4783          	lbu	a5,-1(s10)
c0013970:	fee79ce3          	bne	a5,a4,c0013968 <vprintfmt+0x434>
c0013974:	c1dff06f          	j	c0013590 <vprintfmt+0x5c>
c0013978:	00040513          	mv	a0,s0
c001397c:	000a00e7          	jalr	s4
c0013980:	ecdff06f          	j	c001384c <vprintfmt+0x318>
c0013984:	007b0793          	addi	a5,s6,7
c0013988:	ff87f793          	andi	a5,a5,-8
c001398c:	00878b13          	addi	s6,a5,8
c0013990:	0007a703          	lw	a4,0(a5)
c0013994:	00800813          	li	a6,8
c0013998:	0047a783          	lw	a5,4(a5)
c001399c:	cc5ff06f          	j	c0013660 <vprintfmt+0x12c>
c00139a0:	007b0793          	addi	a5,s6,7
c00139a4:	ff87f793          	andi	a5,a5,-8
c00139a8:	00878b13          	addi	s6,a5,8
c00139ac:	0007a703          	lw	a4,0(a5)
c00139b0:	00a00813          	li	a6,10
c00139b4:	0047a783          	lw	a5,4(a5)
c00139b8:	ca9ff06f          	j	c0013660 <vprintfmt+0x12c>
c00139bc:	007b0793          	addi	a5,s6,7
c00139c0:	ff87f793          	andi	a5,a5,-8
c00139c4:	00878b13          	addi	s6,a5,8
c00139c8:	0007a703          	lw	a4,0(a5)
c00139cc:	01000813          	li	a6,16
c00139d0:	0047a783          	lw	a5,4(a5)
c00139d4:	c8dff06f          	j	c0013660 <vprintfmt+0x12c>
c00139d8:	007b0793          	addi	a5,s6,7
c00139dc:	ff87f793          	andi	a5,a5,-8
c00139e0:	00878b13          	addi	s6,a5,8
c00139e4:	0007a703          	lw	a4,0(a5)
c00139e8:	0047a783          	lw	a5,4(a5)
c00139ec:	ccdff06f          	j	c00136b8 <vprintfmt+0x184>
c00139f0:	00078713          	mv	a4,a5
c00139f4:	00004697          	auipc	a3,0x4
c00139f8:	18468693          	addi	a3,a3,388 # c0017b78 <error_string+0x22c>
c00139fc:	00090613          	mv	a2,s2
c0013a00:	00098593          	mv	a1,s3
c0013a04:	000a0513          	mv	a0,s4
c0013a08:	078000ef          	jal	ra,c0013a80 <printfmt>
c0013a0c:	b85ff06f          	j	c0013590 <vprintfmt+0x5c>
c0013a10:	00044783          	lbu	a5,0(s0)
c0013a14:	00140b13          	addi	s6,s0,1
c0013a18:	00078513          	mv	a0,a5
c0013a1c:	e40784e3          	beqz	a5,c0013864 <vprintfmt+0x330>
c0013a20:	03f00413          	li	s0,63
c0013a24:	e05ff06f          	j	c0013828 <vprintfmt+0x2f4>
c0013a28:	00000c93          	li	s9,0
c0013a2c:	f11ff06f          	j	c001393c <vprintfmt+0x408>
c0013a30:	03905c63          	blez	s9,c0013a68 <vprintfmt+0x534>
c0013a34:	02d00793          	li	a5,45
c0013a38:	00004417          	auipc	s0,0x4
c0013a3c:	13840413          	addi	s0,s0,312 # c0017b70 <error_string+0x224>
c0013a40:	d8f69ce3          	bne	a3,a5,c00137d8 <vprintfmt+0x2a4>
c0013a44:	02800513          	li	a0,40
c0013a48:	00004b17          	auipc	s6,0x4
c0013a4c:	129b0b13          	addi	s6,s6,297 # c0017b71 <error_string+0x225>
c0013a50:	00050793          	mv	a5,a0
c0013a54:	03f00413          	li	s0,63
c0013a58:	dd1ff06f          	j	c0013828 <vprintfmt+0x2f4>
c0013a5c:	000e8e13          	mv	t3,t4
c0013a60:	000d0413          	mv	s0,s10
c0013a64:	e75ff06f          	j	c00138d8 <vprintfmt+0x3a4>
c0013a68:	02800793          	li	a5,40
c0013a6c:	00078513          	mv	a0,a5
c0013a70:	00004b17          	auipc	s6,0x4
c0013a74:	101b0b13          	addi	s6,s6,257 # c0017b71 <error_string+0x225>
c0013a78:	03f00413          	li	s0,63
c0013a7c:	dadff06f          	j	c0013828 <vprintfmt+0x2f4>

c0013a80 <printfmt>:
c0013a80:	fd010113          	addi	sp,sp,-48
c0013a84:	02010313          	addi	t1,sp,32
c0013a88:	02e12023          	sw	a4,32(sp)
c0013a8c:	00030713          	mv	a4,t1
c0013a90:	00112e23          	sw	ra,28(sp)
c0013a94:	02f12223          	sw	a5,36(sp)
c0013a98:	03012423          	sw	a6,40(sp)
c0013a9c:	03112623          	sw	a7,44(sp)
c0013aa0:	00612623          	sw	t1,12(sp)
c0013aa4:	a91ff0ef          	jal	ra,c0013534 <vprintfmt>
c0013aa8:	01c12083          	lw	ra,28(sp)
c0013aac:	03010113          	addi	sp,sp,48
c0013ab0:	00008067          	ret

c0013ab4 <vsnprintf>:
c0013ab4:	fff58593          	addi	a1,a1,-1
c0013ab8:	fe010113          	addi	sp,sp,-32
c0013abc:	00b505b3          	add	a1,a0,a1
c0013ac0:	00112e23          	sw	ra,28(sp)
c0013ac4:	00a12223          	sw	a0,4(sp)
c0013ac8:	00b12423          	sw	a1,8(sp)
c0013acc:	00012623          	sw	zero,12(sp)
c0013ad0:	04050463          	beqz	a0,c0013b18 <vsnprintf+0x64>
c0013ad4:	00050793          	mv	a5,a0
c0013ad8:	ffd00513          	li	a0,-3
c0013adc:	02f5e863          	bltu	a1,a5,c0013b0c <vsnprintf+0x58>
c0013ae0:	ffff75b7          	lui	a1,0xffff7
c0013ae4:	00068713          	mv	a4,a3
c0013ae8:	00000517          	auipc	a0,0x0
c0013aec:	a2450513          	addi	a0,a0,-1500 # c001350c <sprintputch>
c0013af0:	00060693          	mv	a3,a2
c0013af4:	ad958593          	addi	a1,a1,-1319 # ffff6ad9 <sbi_remote_fence_i+0xffff71e9>
c0013af8:	00410613          	addi	a2,sp,4
c0013afc:	a39ff0ef          	jal	ra,c0013534 <vprintfmt>
c0013b00:	00412783          	lw	a5,4(sp)
c0013b04:	00078023          	sb	zero,0(a5)
c0013b08:	00c12503          	lw	a0,12(sp)
c0013b0c:	01c12083          	lw	ra,28(sp)
c0013b10:	02010113          	addi	sp,sp,32
c0013b14:	00008067          	ret
c0013b18:	ffd00513          	li	a0,-3
c0013b1c:	ff1ff06f          	j	c0013b0c <vsnprintf+0x58>

c0013b20 <snprintf>:
c0013b20:	fc010113          	addi	sp,sp,-64
c0013b24:	02c10313          	addi	t1,sp,44
c0013b28:	02d12623          	sw	a3,44(sp)
c0013b2c:	00030693          	mv	a3,t1
c0013b30:	00112e23          	sw	ra,28(sp)
c0013b34:	02e12823          	sw	a4,48(sp)
c0013b38:	02f12a23          	sw	a5,52(sp)
c0013b3c:	03012c23          	sw	a6,56(sp)
c0013b40:	03112e23          	sw	a7,60(sp)
c0013b44:	00612623          	sw	t1,12(sp)
c0013b48:	f6dff0ef          	jal	ra,c0013ab4 <vsnprintf>
c0013b4c:	01c12083          	lw	ra,28(sp)
c0013b50:	04010113          	addi	sp,sp,64
c0013b54:	00008067          	ret

c0013b58 <hash32>:
c0013b58:	9e3707b7          	lui	a5,0x9e370
c0013b5c:	00178793          	addi	a5,a5,1 # 9e370001 <sbi_remote_fence_i+0x9e370711>
c0013b60:	02f50533          	mul	a0,a0,a5
c0013b64:	02000793          	li	a5,32
c0013b68:	40b785b3          	sub	a1,a5,a1
c0013b6c:	00b55533          	srl	a0,a0,a1
c0013b70:	00008067          	ret
