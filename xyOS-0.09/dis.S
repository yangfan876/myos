
kernel.bin:     file format elf32-i386


Disassembly of section .text:

00030400 <_start>:
   30400:	bc 01 20 03 00       	mov    $0x32001,%esp
   30405:	0f 01 05 ae 3c 03 00 	sgdtl  0x33cae
   3040c:	e8 1f 00 00 00       	call   30430 <__init__>
   30411:	fb                   	sti    
   30412:	8b 25 00 f0 04 00    	mov    0x4f000,%esp
   30418:	8d 44 24 48          	lea    0x48(%esp),%eax
   3041c:	a3 24 3c 03 00       	mov    %eax,0x33c24
   30421:	0f a9                	pop    %gs
   30423:	0f a1                	pop    %fs
   30425:	07                   	pop    %es
   30426:	1f                   	pop    %ds
   30427:	61                   	popa   
   30428:	83 c4 04             	add    $0x4,%esp
   3042b:	cf                   	iret   
   3042c:	eb fe                	jmp    3042c <_start+0x2c>
   3042e:	90                   	nop
   3042f:	90                   	nop

00030430 <__init__>:
   30430:	55                   	push   %ebp
   30431:	89 e5                	mov    %esp,%ebp
   30433:	83 ec 28             	sub    $0x28,%esp
   30436:	e8 2d 02 00 00       	call   30668 <change_gdt>
   3043b:	c7 05 04 20 03 00 00 	movl   $0x0,0x32004
   30442:	00 00 00 
   30445:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   3044c:	eb 10                	jmp    3045e <__init__+0x2e>
   3044e:	c7 04 24 a0 18 03 00 	movl   $0x318a0,(%esp)
   30455:	e8 0e 12 00 00       	call   31668 <printk>
   3045a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   3045e:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
   30465:	7e e7                	jle    3044e <__init__+0x1e>
   30467:	c7 05 04 20 03 00 00 	movl   $0x0,0x32004
   3046e:	00 00 00 
   30471:	c7 04 24 a2 18 03 00 	movl   $0x318a2,(%esp)
   30478:	e8 eb 11 00 00       	call   31668 <printk>
   3047d:	e8 ca 00 00 00       	call   3054c <init_8259A>
   30482:	c7 04 24 bc 18 03 00 	movl   $0x318bc,(%esp)
   30489:	e8 da 11 00 00       	call   31668 <printk>
   3048e:	e8 65 03 00 00       	call   307f8 <init_idt>
   30493:	c7 04 24 d5 18 03 00 	movl   $0x318d5,(%esp)
   3049a:	e8 c9 11 00 00       	call   31668 <printk>
   3049f:	e8 e0 0c 00 00       	call   31184 <init_first_thread>
   304a4:	c7 04 24 ec 18 03 00 	movl   $0x318ec,(%esp)
   304ab:	e8 b8 11 00 00       	call   31668 <printk>
   304b0:	e8 55 0d 00 00       	call   3120a <init_second_thread>
   304b5:	c7 04 24 0c 19 03 00 	movl   $0x3190c,(%esp)
   304bc:	e8 a7 11 00 00       	call   31668 <printk>
   304c1:	e8 9e 0d 00 00       	call   31264 <init_third_thread>
   304c6:	c7 04 24 2c 19 03 00 	movl   $0x3192c,(%esp)
   304cd:	e8 96 11 00 00       	call   31668 <printk>
   304d2:	c7 04 24 4b 19 03 00 	movl   $0x3194b,(%esp)
   304d9:	e8 8a 11 00 00       	call   31668 <printk>
   304de:	c7 44 24 04 ff 00 00 	movl   $0xff,0x4(%esp)
   304e5:	00 
   304e6:	c7 04 24 fe 00 00 00 	movl   $0xfe,(%esp)
   304ed:	e8 2a 01 00 00       	call   3061c <op_8259A>
   304f2:	e8 6d 0f 00 00       	call   31464 <run_first_thread>
   304f7:	c9                   	leave  
   304f8:	c3                   	ret    
   304f9:	90                   	nop
   304fa:	90                   	nop
   304fb:	90                   	nop
   304fc:	90                   	nop
   304fd:	90                   	nop
   304fe:	90                   	nop
   304ff:	90                   	nop

00030500 <disp_str>:
   30500:	55                   	push   %ebp
   30501:	89 e5                	mov    %esp,%ebp
   30503:	8b 75 08             	mov    0x8(%ebp),%esi
   30506:	8b 3d 04 20 03 00    	mov    0x32004,%edi
   3050c:	b4 0f                	mov    $0xf,%ah

0003050e <disp_str.1>:
   3050e:	ac                   	lods   %ds:(%esi),%al
   3050f:	84 c0                	test   %al,%al
   30511:	74 2f                	je     30542 <disp_str.2>
   30513:	3c 0a                	cmp    $0xa,%al
   30515:	75 16                	jne    3052d <disp_str.3>
   30517:	50                   	push   %eax
   30518:	89 f8                	mov    %edi,%eax
   3051a:	b3 a0                	mov    $0xa0,%bl
   3051c:	f6 f3                	div    %bl
   3051e:	25 ff 00 00 00       	and    $0xff,%eax
   30523:	40                   	inc    %eax
   30524:	b3 a0                	mov    $0xa0,%bl
   30526:	f6 e3                	mul    %bl
   30528:	89 c7                	mov    %eax,%edi
   3052a:	58                   	pop    %eax
   3052b:	eb e1                	jmp    3050e <disp_str.1>

0003052d <disp_str.3>:
   3052d:	81 c7 00 80 0b 00    	add    $0xb8000,%edi
   30533:	65 66 89 07          	mov    %ax,%gs:(%edi)
   30537:	81 ef 00 80 0b 00    	sub    $0xb8000,%edi
   3053d:	83 c7 02             	add    $0x2,%edi
   30540:	eb cc                	jmp    3050e <disp_str.1>

00030542 <disp_str.2>:
   30542:	89 3d 04 20 03 00    	mov    %edi,0x32004
   30548:	5d                   	pop    %ebp
   30549:	c3                   	ret    
   3054a:	90                   	nop
   3054b:	90                   	nop

0003054c <init_8259A>:
   3054c:	55                   	push   %ebp
   3054d:	89 e5                	mov    %esp,%ebp
   3054f:	83 ec 18             	sub    $0x18,%esp
   30552:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
   30559:	00 
   3055a:	c7 04 24 ff 00 00 00 	movl   $0xff,(%esp)
   30561:	e8 ea 00 00 00       	call   30650 <outb>
   30566:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
   3056d:	00 
   3056e:	c7 04 24 ff 00 00 00 	movl   $0xff,(%esp)
   30575:	e8 d6 00 00 00       	call   30650 <outb>
   3057a:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
   30581:	00 
   30582:	c7 04 24 11 00 00 00 	movl   $0x11,(%esp)
   30589:	e8 cc 00 00 00       	call   3065a <outb_pic>
   3058e:	c7 44 24 04 a0 00 00 	movl   $0xa0,0x4(%esp)
   30595:	00 
   30596:	c7 04 24 11 00 00 00 	movl   $0x11,(%esp)
   3059d:	e8 b8 00 00 00       	call   3065a <outb_pic>
   305a2:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
   305a9:	00 
   305aa:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
   305b1:	e8 a4 00 00 00       	call   3065a <outb_pic>
   305b6:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
   305bd:	00 
   305be:	c7 04 24 28 00 00 00 	movl   $0x28,(%esp)
   305c5:	e8 90 00 00 00       	call   3065a <outb_pic>
   305ca:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
   305d1:	00 
   305d2:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
   305d9:	e8 7c 00 00 00       	call   3065a <outb_pic>
   305de:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
   305e5:	00 
   305e6:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
   305ed:	e8 68 00 00 00       	call   3065a <outb_pic>
   305f2:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
   305f9:	00 
   305fa:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
   30601:	e8 54 00 00 00       	call   3065a <outb_pic>
   30606:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
   3060d:	00 
   3060e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
   30615:	e8 40 00 00 00       	call   3065a <outb_pic>
   3061a:	c9                   	leave  
   3061b:	c3                   	ret    

0003061c <op_8259A>:
   3061c:	55                   	push   %ebp
   3061d:	89 e5                	mov    %esp,%ebp
   3061f:	83 ec 18             	sub    $0x18,%esp
   30622:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
   30629:	00 
   3062a:	8b 45 08             	mov    0x8(%ebp),%eax
   3062d:	89 04 24             	mov    %eax,(%esp)
   30630:	e8 25 00 00 00       	call   3065a <outb_pic>
   30635:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
   3063c:	00 
   3063d:	8b 45 0c             	mov    0xc(%ebp),%eax
   30640:	89 04 24             	mov    %eax,(%esp)
   30643:	e8 12 00 00 00       	call   3065a <outb_pic>
   30648:	c9                   	leave  
   30649:	c3                   	ret    
   3064a:	90                   	nop
   3064b:	90                   	nop
   3064c:	90                   	nop
   3064d:	90                   	nop
   3064e:	90                   	nop
   3064f:	90                   	nop

00030650 <outb>:
   30650:	8b 44 24 04          	mov    0x4(%esp),%eax
   30654:	8b 54 24 08          	mov    0x8(%esp),%edx
   30658:	ee                   	out    %al,(%dx)
   30659:	c3                   	ret    

0003065a <outb_pic>:
   3065a:	8b 44 24 04          	mov    0x4(%esp),%eax
   3065e:	8b 54 24 08          	mov    0x8(%esp),%edx
   30662:	ee                   	out    %al,(%dx)
   30663:	90                   	nop
   30664:	90                   	nop
   30665:	c3                   	ret    
   30666:	90                   	nop
   30667:	90                   	nop

00030668 <change_gdt>:
   30668:	55                   	push   %ebp
   30669:	89 e5                	mov    %esp,%ebp
   3066b:	83 ec 18             	sub    $0x18,%esp
   3066e:	66 c7 05 00 30 03 00 	movw   $0x0,0x33000
   30675:	00 00 
   30677:	66 c7 05 02 30 03 00 	movw   $0x0,0x33002
   3067e:	00 00 
   30680:	c6 05 04 30 03 00 00 	movb   $0x0,0x33004
   30687:	c6 05 05 30 03 00 00 	movb   $0x0,0x33005
   3068e:	c6 05 06 30 03 00 00 	movb   $0x0,0x33006
   30695:	c6 05 07 30 03 00 00 	movb   $0x0,0x33007
   3069c:	66 c7 05 60 30 03 00 	movw   $0xffff,0x33060
   306a3:	ff ff 
   306a5:	66 c7 05 62 30 03 00 	movw   $0x0,0x33062
   306ac:	00 00 
   306ae:	c6 05 64 30 03 00 00 	movb   $0x0,0x33064
   306b5:	c6 05 65 30 03 00 9a 	movb   $0x9a,0x33065
   306bc:	c6 05 66 30 03 00 cf 	movb   $0xcf,0x33066
   306c3:	c6 05 67 30 03 00 00 	movb   $0x0,0x33067
   306ca:	66 c7 05 68 30 03 00 	movw   $0xffff,0x33068
   306d1:	ff ff 
   306d3:	66 c7 05 6a 30 03 00 	movw   $0x0,0x3306a
   306da:	00 00 
   306dc:	c6 05 6c 30 03 00 00 	movb   $0x0,0x3306c
   306e3:	c6 05 6d 30 03 00 93 	movb   $0x93,0x3306d
   306ea:	c6 05 6e 30 03 00 cf 	movb   $0xcf,0x3306e
   306f1:	c6 05 6f 30 03 00 00 	movb   $0x0,0x3306f
   306f8:	66 c7 05 70 30 03 00 	movw   $0xffff,0x33070
   306ff:	ff ff 
   30701:	66 c7 05 72 30 03 00 	movw   $0x0,0x33072
   30708:	00 00 
   3070a:	c6 05 74 30 03 00 00 	movb   $0x0,0x33074
   30711:	c6 05 75 30 03 00 fa 	movb   $0xfa,0x33075
   30718:	c6 05 76 30 03 00 cf 	movb   $0xcf,0x33076
   3071f:	c6 05 77 30 03 00 00 	movb   $0x0,0x33077
   30726:	66 c7 05 78 30 03 00 	movw   $0xffff,0x33078
   3072d:	ff ff 
   3072f:	66 c7 05 7a 30 03 00 	movw   $0x0,0x3307a
   30736:	00 00 
   30738:	c6 05 7c 30 03 00 00 	movb   $0x0,0x3307c
   3073f:	c6 05 7d 30 03 00 f3 	movb   $0xf3,0x3307d
   30746:	c6 05 7e 30 03 00 cf 	movb   $0xcf,0x3307e
   3074d:	c6 05 7f 30 03 00 00 	movb   $0x0,0x3307f
   30754:	66 c7 05 78 30 03 00 	movw   $0xffff,0x33078
   3075b:	ff ff 
   3075d:	66 c7 05 7a 30 03 00 	movw   $0x0,0x3307a
   30764:	00 00 
   30766:	c6 05 7c 30 03 00 00 	movb   $0x0,0x3307c
   3076d:	c6 05 7d 30 03 00 f3 	movb   $0xf3,0x3307d
   30774:	c6 05 7e 30 03 00 cf 	movb   $0xcf,0x3307e
   3077b:	c6 05 7f 30 03 00 00 	movb   $0x0,0x3307f
   30782:	c7 05 28 3c 03 00 68 	movl   $0x68,0x33c28
   30789:	00 00 00 
   3078c:	66 c7 05 86 3c 03 00 	movw   $0x68,0x33c86
   30793:	68 00 
   30795:	66 c7 05 80 30 03 00 	movw   $0x67,0x33080
   3079c:	67 00 
   3079e:	b8 20 3c 03 00       	mov    $0x33c20,%eax
   307a3:	66 a3 82 30 03 00    	mov    %ax,0x33082
   307a9:	b8 20 3c 03 00       	mov    $0x33c20,%eax
   307ae:	c1 e8 10             	shr    $0x10,%eax
   307b1:	a2 84 30 03 00       	mov    %al,0x33084
   307b6:	c6 05 85 30 03 00 89 	movb   $0x89,0x33085
   307bd:	c6 05 86 30 03 00 00 	movb   $0x0,0x33086
   307c4:	b8 20 3c 03 00       	mov    $0x33c20,%eax
   307c9:	c1 e8 18             	shr    $0x18,%eax
   307cc:	a2 87 30 03 00       	mov    %al,0x33087
   307d1:	c7 45 f4 ae 3c 03 00 	movl   $0x33cae,-0xc(%ebp)
   307d8:	c7 45 f0 b0 3c 03 00 	movl   $0x33cb0,-0x10(%ebp)
   307df:	8b 45 f4             	mov    -0xc(%ebp),%eax
   307e2:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
   307e7:	ba 00 30 03 00       	mov    $0x33000,%edx
   307ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
   307ef:	89 10                	mov    %edx,(%eax)
   307f1:	e8 fa 06 00 00       	call   30ef0 <jump_new_gdt>
   307f6:	c9                   	leave  
   307f7:	c3                   	ret    

000307f8 <init_idt>:
   307f8:	55                   	push   %ebp
   307f9:	89 e5                	mov    %esp,%ebp
   307fb:	83 ec 18             	sub    $0x18,%esp
   307fe:	b8 cb 15 03 00       	mov    $0x315cb,%eax
   30803:	66 a3 00 34 03 00    	mov    %ax,0x33400
   30809:	66 c7 05 02 34 03 00 	movw   $0x60,0x33402
   30810:	60 00 
   30812:	c6 05 04 34 03 00 00 	movb   $0x0,0x33404
   30819:	c6 05 05 34 03 00 8e 	movb   $0x8e,0x33405
   30820:	b8 cb 15 03 00       	mov    $0x315cb,%eax
   30825:	c1 e8 10             	shr    $0x10,%eax
   30828:	66 a3 06 34 03 00    	mov    %ax,0x33406
   3082e:	b8 d1 15 03 00       	mov    $0x315d1,%eax
   30833:	66 a3 08 34 03 00    	mov    %ax,0x33408
   30839:	66 c7 05 0a 34 03 00 	movw   $0x60,0x3340a
   30840:	60 00 
   30842:	c6 05 0c 34 03 00 00 	movb   $0x0,0x3340c
   30849:	c6 05 0d 34 03 00 8e 	movb   $0x8e,0x3340d
   30850:	b8 d1 15 03 00       	mov    $0x315d1,%eax
   30855:	c1 e8 10             	shr    $0x10,%eax
   30858:	66 a3 0e 34 03 00    	mov    %ax,0x3340e
   3085e:	b8 d7 15 03 00       	mov    $0x315d7,%eax
   30863:	66 a3 10 34 03 00    	mov    %ax,0x33410
   30869:	66 c7 05 12 34 03 00 	movw   $0x60,0x33412
   30870:	60 00 
   30872:	c6 05 14 34 03 00 00 	movb   $0x0,0x33414
   30879:	c6 05 15 34 03 00 8e 	movb   $0x8e,0x33415
   30880:	b8 d7 15 03 00       	mov    $0x315d7,%eax
   30885:	c1 e8 10             	shr    $0x10,%eax
   30888:	66 a3 16 34 03 00    	mov    %ax,0x33416
   3088e:	b8 dd 15 03 00       	mov    $0x315dd,%eax
   30893:	66 a3 18 34 03 00    	mov    %ax,0x33418
   30899:	66 c7 05 1a 34 03 00 	movw   $0x60,0x3341a
   308a0:	60 00 
   308a2:	c6 05 1c 34 03 00 00 	movb   $0x0,0x3341c
   308a9:	c6 05 1d 34 03 00 8e 	movb   $0x8e,0x3341d
   308b0:	b8 dd 15 03 00       	mov    $0x315dd,%eax
   308b5:	c1 e8 10             	shr    $0x10,%eax
   308b8:	66 a3 1e 34 03 00    	mov    %ax,0x3341e
   308be:	b8 e3 15 03 00       	mov    $0x315e3,%eax
   308c3:	66 a3 20 34 03 00    	mov    %ax,0x33420
   308c9:	66 c7 05 22 34 03 00 	movw   $0x60,0x33422
   308d0:	60 00 
   308d2:	c6 05 24 34 03 00 00 	movb   $0x0,0x33424
   308d9:	c6 05 25 34 03 00 8e 	movb   $0x8e,0x33425
   308e0:	b8 e3 15 03 00       	mov    $0x315e3,%eax
   308e5:	c1 e8 10             	shr    $0x10,%eax
   308e8:	66 a3 26 34 03 00    	mov    %ax,0x33426
   308ee:	b8 e9 15 03 00       	mov    $0x315e9,%eax
   308f3:	66 a3 28 34 03 00    	mov    %ax,0x33428
   308f9:	66 c7 05 2a 34 03 00 	movw   $0x60,0x3342a
   30900:	60 00 
   30902:	c6 05 2c 34 03 00 00 	movb   $0x0,0x3342c
   30909:	c6 05 2d 34 03 00 8e 	movb   $0x8e,0x3342d
   30910:	b8 e9 15 03 00       	mov    $0x315e9,%eax
   30915:	c1 e8 10             	shr    $0x10,%eax
   30918:	66 a3 2e 34 03 00    	mov    %ax,0x3342e
   3091e:	b8 ef 15 03 00       	mov    $0x315ef,%eax
   30923:	66 a3 30 34 03 00    	mov    %ax,0x33430
   30929:	66 c7 05 32 34 03 00 	movw   $0x60,0x33432
   30930:	60 00 
   30932:	c6 05 34 34 03 00 00 	movb   $0x0,0x33434
   30939:	c6 05 35 34 03 00 8e 	movb   $0x8e,0x33435
   30940:	b8 ef 15 03 00       	mov    $0x315ef,%eax
   30945:	c1 e8 10             	shr    $0x10,%eax
   30948:	66 a3 36 34 03 00    	mov    %ax,0x33436
   3094e:	b8 f5 15 03 00       	mov    $0x315f5,%eax
   30953:	66 a3 38 34 03 00    	mov    %ax,0x33438
   30959:	66 c7 05 3a 34 03 00 	movw   $0x60,0x3343a
   30960:	60 00 
   30962:	c6 05 3c 34 03 00 00 	movb   $0x0,0x3343c
   30969:	c6 05 3d 34 03 00 8e 	movb   $0x8e,0x3343d
   30970:	b8 f5 15 03 00       	mov    $0x315f5,%eax
   30975:	c1 e8 10             	shr    $0x10,%eax
   30978:	66 a3 3e 34 03 00    	mov    %ax,0x3343e
   3097e:	b8 fb 15 03 00       	mov    $0x315fb,%eax
   30983:	66 a3 40 34 03 00    	mov    %ax,0x33440
   30989:	66 c7 05 42 34 03 00 	movw   $0x60,0x33442
   30990:	60 00 
   30992:	c6 05 44 34 03 00 00 	movb   $0x0,0x33444
   30999:	c6 05 45 34 03 00 8e 	movb   $0x8e,0x33445
   309a0:	b8 fb 15 03 00       	mov    $0x315fb,%eax
   309a5:	c1 e8 10             	shr    $0x10,%eax
   309a8:	66 a3 46 34 03 00    	mov    %ax,0x33446
   309ae:	b8 ff 15 03 00       	mov    $0x315ff,%eax
   309b3:	66 a3 48 34 03 00    	mov    %ax,0x33448
   309b9:	66 c7 05 4a 34 03 00 	movw   $0x60,0x3344a
   309c0:	60 00 
   309c2:	c6 05 4c 34 03 00 00 	movb   $0x0,0x3344c
   309c9:	c6 05 4d 34 03 00 8e 	movb   $0x8e,0x3344d
   309d0:	b8 ff 15 03 00       	mov    $0x315ff,%eax
   309d5:	c1 e8 10             	shr    $0x10,%eax
   309d8:	66 a3 4e 34 03 00    	mov    %ax,0x3344e
   309de:	b8 05 16 03 00       	mov    $0x31605,%eax
   309e3:	66 a3 50 34 03 00    	mov    %ax,0x33450
   309e9:	66 c7 05 52 34 03 00 	movw   $0x60,0x33452
   309f0:	60 00 
   309f2:	c6 05 54 34 03 00 00 	movb   $0x0,0x33454
   309f9:	c6 05 55 34 03 00 8e 	movb   $0x8e,0x33455
   30a00:	b8 05 16 03 00       	mov    $0x31605,%eax
   30a05:	c1 e8 10             	shr    $0x10,%eax
   30a08:	66 a3 56 34 03 00    	mov    %ax,0x33456
   30a0e:	b8 09 16 03 00       	mov    $0x31609,%eax
   30a13:	66 a3 58 34 03 00    	mov    %ax,0x33458
   30a19:	66 c7 05 5a 34 03 00 	movw   $0x60,0x3345a
   30a20:	60 00 
   30a22:	c6 05 5c 34 03 00 00 	movb   $0x0,0x3345c
   30a29:	c6 05 5d 34 03 00 8e 	movb   $0x8e,0x3345d
   30a30:	b8 09 16 03 00       	mov    $0x31609,%eax
   30a35:	c1 e8 10             	shr    $0x10,%eax
   30a38:	66 a3 5e 34 03 00    	mov    %ax,0x3345e
   30a3e:	b8 0d 16 03 00       	mov    $0x3160d,%eax
   30a43:	66 a3 60 34 03 00    	mov    %ax,0x33460
   30a49:	66 c7 05 62 34 03 00 	movw   $0x60,0x33462
   30a50:	60 00 
   30a52:	c6 05 64 34 03 00 00 	movb   $0x0,0x33464
   30a59:	c6 05 65 34 03 00 8e 	movb   $0x8e,0x33465
   30a60:	b8 0d 16 03 00       	mov    $0x3160d,%eax
   30a65:	c1 e8 10             	shr    $0x10,%eax
   30a68:	66 a3 66 34 03 00    	mov    %ax,0x33466
   30a6e:	b8 11 16 03 00       	mov    $0x31611,%eax
   30a73:	66 a3 68 34 03 00    	mov    %ax,0x33468
   30a79:	66 c7 05 6a 34 03 00 	movw   $0x60,0x3346a
   30a80:	60 00 
   30a82:	c6 05 6c 34 03 00 00 	movb   $0x0,0x3346c
   30a89:	c6 05 6d 34 03 00 8e 	movb   $0x8e,0x3346d
   30a90:	b8 11 16 03 00       	mov    $0x31611,%eax
   30a95:	c1 e8 10             	shr    $0x10,%eax
   30a98:	66 a3 6e 34 03 00    	mov    %ax,0x3346e
   30a9e:	b8 15 16 03 00       	mov    $0x31615,%eax
   30aa3:	66 a3 70 34 03 00    	mov    %ax,0x33470
   30aa9:	66 c7 05 72 34 03 00 	movw   $0x60,0x33472
   30ab0:	60 00 
   30ab2:	c6 05 74 34 03 00 00 	movb   $0x0,0x33474
   30ab9:	c6 05 75 34 03 00 8e 	movb   $0x8e,0x33475
   30ac0:	b8 15 16 03 00       	mov    $0x31615,%eax
   30ac5:	c1 e8 10             	shr    $0x10,%eax
   30ac8:	66 a3 76 34 03 00    	mov    %ax,0x33476
   30ace:	b8 19 16 03 00       	mov    $0x31619,%eax
   30ad3:	66 a3 80 34 03 00    	mov    %ax,0x33480
   30ad9:	66 c7 05 82 34 03 00 	movw   $0x60,0x33482
   30ae0:	60 00 
   30ae2:	c6 05 84 34 03 00 00 	movb   $0x0,0x33484
   30ae9:	c6 05 85 34 03 00 8e 	movb   $0x8e,0x33485
   30af0:	b8 19 16 03 00       	mov    $0x31619,%eax
   30af5:	c1 e8 10             	shr    $0x10,%eax
   30af8:	66 a3 86 34 03 00    	mov    %ax,0x33486
   30afe:	b8 80 14 03 00       	mov    $0x31480,%eax
   30b03:	66 a3 00 35 03 00    	mov    %ax,0x33500
   30b09:	66 c7 05 02 35 03 00 	movw   $0x60,0x33502
   30b10:	60 00 
   30b12:	c6 05 04 35 03 00 00 	movb   $0x0,0x33504
   30b19:	c6 05 05 35 03 00 8e 	movb   $0x8e,0x33505
   30b20:	b8 80 14 03 00       	mov    $0x31480,%eax
   30b25:	c1 e8 10             	shr    $0x10,%eax
   30b28:	66 a3 06 35 03 00    	mov    %ax,0x33506
   30b2e:	b8 e0 14 03 00       	mov    $0x314e0,%eax
   30b33:	66 a3 08 35 03 00    	mov    %ax,0x33508
   30b39:	66 c7 05 0a 35 03 00 	movw   $0x60,0x3350a
   30b40:	60 00 
   30b42:	c6 05 0c 35 03 00 00 	movb   $0x0,0x3350c
   30b49:	c6 05 0d 35 03 00 8e 	movb   $0x8e,0x3350d
   30b50:	b8 e0 14 03 00       	mov    $0x314e0,%eax
   30b55:	c1 e8 10             	shr    $0x10,%eax
   30b58:	66 a3 0e 35 03 00    	mov    %ax,0x3350e
   30b5e:	b8 f0 14 03 00       	mov    $0x314f0,%eax
   30b63:	66 a3 10 35 03 00    	mov    %ax,0x33510
   30b69:	66 c7 05 12 35 03 00 	movw   $0x60,0x33512
   30b70:	60 00 
   30b72:	c6 05 14 35 03 00 00 	movb   $0x0,0x33514
   30b79:	c6 05 15 35 03 00 8e 	movb   $0x8e,0x33515
   30b80:	b8 f0 14 03 00       	mov    $0x314f0,%eax
   30b85:	c1 e8 10             	shr    $0x10,%eax
   30b88:	66 a3 16 35 03 00    	mov    %ax,0x33516
   30b8e:	b8 00 15 03 00       	mov    $0x31500,%eax
   30b93:	66 a3 18 35 03 00    	mov    %ax,0x33518
   30b99:	66 c7 05 1a 35 03 00 	movw   $0x60,0x3351a
   30ba0:	60 00 
   30ba2:	c6 05 1c 35 03 00 00 	movb   $0x0,0x3351c
   30ba9:	c6 05 1d 35 03 00 8e 	movb   $0x8e,0x3351d
   30bb0:	b8 00 15 03 00       	mov    $0x31500,%eax
   30bb5:	c1 e8 10             	shr    $0x10,%eax
   30bb8:	66 a3 1e 35 03 00    	mov    %ax,0x3351e
   30bbe:	b8 10 15 03 00       	mov    $0x31510,%eax
   30bc3:	66 a3 20 35 03 00    	mov    %ax,0x33520
   30bc9:	66 c7 05 22 35 03 00 	movw   $0x60,0x33522
   30bd0:	60 00 
   30bd2:	c6 05 24 35 03 00 00 	movb   $0x0,0x33524
   30bd9:	c6 05 25 35 03 00 8e 	movb   $0x8e,0x33525
   30be0:	b8 10 15 03 00       	mov    $0x31510,%eax
   30be5:	c1 e8 10             	shr    $0x10,%eax
   30be8:	66 a3 26 35 03 00    	mov    %ax,0x33526
   30bee:	b8 20 15 03 00       	mov    $0x31520,%eax
   30bf3:	66 a3 28 35 03 00    	mov    %ax,0x33528
   30bf9:	66 c7 05 2a 35 03 00 	movw   $0x60,0x3352a
   30c00:	60 00 
   30c02:	c6 05 2c 35 03 00 00 	movb   $0x0,0x3352c
   30c09:	c6 05 2d 35 03 00 8e 	movb   $0x8e,0x3352d
   30c10:	b8 20 15 03 00       	mov    $0x31520,%eax
   30c15:	c1 e8 10             	shr    $0x10,%eax
   30c18:	66 a3 2e 35 03 00    	mov    %ax,0x3352e
   30c1e:	b8 30 15 03 00       	mov    $0x31530,%eax
   30c23:	66 a3 30 35 03 00    	mov    %ax,0x33530
   30c29:	66 c7 05 32 35 03 00 	movw   $0x60,0x33532
   30c30:	60 00 
   30c32:	c6 05 34 35 03 00 00 	movb   $0x0,0x33534
   30c39:	c6 05 35 35 03 00 8e 	movb   $0x8e,0x33535
   30c40:	b8 30 15 03 00       	mov    $0x31530,%eax
   30c45:	c1 e8 10             	shr    $0x10,%eax
   30c48:	66 a3 36 35 03 00    	mov    %ax,0x33536
   30c4e:	b8 40 15 03 00       	mov    $0x31540,%eax
   30c53:	66 a3 38 35 03 00    	mov    %ax,0x33538
   30c59:	66 c7 05 3a 35 03 00 	movw   $0x60,0x3353a
   30c60:	60 00 
   30c62:	c6 05 3c 35 03 00 00 	movb   $0x0,0x3353c
   30c69:	c6 05 3d 35 03 00 8e 	movb   $0x8e,0x3353d
   30c70:	b8 40 15 03 00       	mov    $0x31540,%eax
   30c75:	c1 e8 10             	shr    $0x10,%eax
   30c78:	66 a3 3e 35 03 00    	mov    %ax,0x3353e
   30c7e:	b8 50 15 03 00       	mov    $0x31550,%eax
   30c83:	66 a3 40 35 03 00    	mov    %ax,0x33540
   30c89:	66 c7 05 42 35 03 00 	movw   $0x60,0x33542
   30c90:	60 00 
   30c92:	c6 05 44 35 03 00 00 	movb   $0x0,0x33544
   30c99:	c6 05 45 35 03 00 8e 	movb   $0x8e,0x33545
   30ca0:	b8 50 15 03 00       	mov    $0x31550,%eax
   30ca5:	c1 e8 10             	shr    $0x10,%eax
   30ca8:	66 a3 46 35 03 00    	mov    %ax,0x33546
   30cae:	b8 60 15 03 00       	mov    $0x31560,%eax
   30cb3:	66 a3 48 35 03 00    	mov    %ax,0x33548
   30cb9:	66 c7 05 4a 35 03 00 	movw   $0x60,0x3354a
   30cc0:	60 00 
   30cc2:	c6 05 4c 35 03 00 00 	movb   $0x0,0x3354c
   30cc9:	c6 05 4d 35 03 00 8e 	movb   $0x8e,0x3354d
   30cd0:	b8 60 15 03 00       	mov    $0x31560,%eax
   30cd5:	c1 e8 10             	shr    $0x10,%eax
   30cd8:	66 a3 4e 35 03 00    	mov    %ax,0x3354e
   30cde:	b8 70 15 03 00       	mov    $0x31570,%eax
   30ce3:	66 a3 50 35 03 00    	mov    %ax,0x33550
   30ce9:	66 c7 05 52 35 03 00 	movw   $0x60,0x33552
   30cf0:	60 00 
   30cf2:	c6 05 54 35 03 00 00 	movb   $0x0,0x33554
   30cf9:	c6 05 55 35 03 00 8e 	movb   $0x8e,0x33555
   30d00:	b8 70 15 03 00       	mov    $0x31570,%eax
   30d05:	c1 e8 10             	shr    $0x10,%eax
   30d08:	66 a3 56 35 03 00    	mov    %ax,0x33556
   30d0e:	b8 80 15 03 00       	mov    $0x31580,%eax
   30d13:	66 a3 58 35 03 00    	mov    %ax,0x33558
   30d19:	66 c7 05 5a 35 03 00 	movw   $0x60,0x3355a
   30d20:	60 00 
   30d22:	c6 05 5c 35 03 00 00 	movb   $0x0,0x3355c
   30d29:	c6 05 5d 35 03 00 8e 	movb   $0x8e,0x3355d
   30d30:	b8 80 15 03 00       	mov    $0x31580,%eax
   30d35:	c1 e8 10             	shr    $0x10,%eax
   30d38:	66 a3 5e 35 03 00    	mov    %ax,0x3355e
   30d3e:	b8 90 15 03 00       	mov    $0x31590,%eax
   30d43:	66 a3 60 35 03 00    	mov    %ax,0x33560
   30d49:	66 c7 05 62 35 03 00 	movw   $0x60,0x33562
   30d50:	60 00 
   30d52:	c6 05 64 35 03 00 00 	movb   $0x0,0x33564
   30d59:	c6 05 65 35 03 00 8e 	movb   $0x8e,0x33565
   30d60:	b8 90 15 03 00       	mov    $0x31590,%eax
   30d65:	c1 e8 10             	shr    $0x10,%eax
   30d68:	66 a3 66 35 03 00    	mov    %ax,0x33566
   30d6e:	b8 a0 15 03 00       	mov    $0x315a0,%eax
   30d73:	66 a3 68 35 03 00    	mov    %ax,0x33568
   30d79:	66 c7 05 6a 35 03 00 	movw   $0x60,0x3356a
   30d80:	60 00 
   30d82:	c6 05 6c 35 03 00 00 	movb   $0x0,0x3356c
   30d89:	c6 05 6d 35 03 00 8e 	movb   $0x8e,0x3356d
   30d90:	b8 a0 15 03 00       	mov    $0x315a0,%eax
   30d95:	c1 e8 10             	shr    $0x10,%eax
   30d98:	66 a3 6e 35 03 00    	mov    %ax,0x3356e
   30d9e:	b8 b0 15 03 00       	mov    $0x315b0,%eax
   30da3:	66 a3 70 35 03 00    	mov    %ax,0x33570
   30da9:	66 c7 05 72 35 03 00 	movw   $0x60,0x33572
   30db0:	60 00 
   30db2:	c6 05 74 35 03 00 00 	movb   $0x0,0x33574
   30db9:	c6 05 75 35 03 00 8e 	movb   $0x8e,0x33575
   30dc0:	b8 b0 15 03 00       	mov    $0x315b0,%eax
   30dc5:	c1 e8 10             	shr    $0x10,%eax
   30dc8:	66 a3 76 35 03 00    	mov    %ax,0x33576
   30dce:	b8 c0 15 03 00       	mov    $0x315c0,%eax
   30dd3:	66 a3 78 35 03 00    	mov    %ax,0x33578
   30dd9:	66 c7 05 7a 35 03 00 	movw   $0x60,0x3357a
   30de0:	60 00 
   30de2:	c6 05 7c 35 03 00 00 	movb   $0x0,0x3357c
   30de9:	c6 05 7d 35 03 00 8e 	movb   $0x8e,0x3357d
   30df0:	b8 c0 15 03 00       	mov    $0x315c0,%eax
   30df5:	c1 e8 10             	shr    $0x10,%eax
   30df8:	66 a3 7e 35 03 00    	mov    %ax,0x3357e
   30dfe:	c7 45 f4 a8 3c 03 00 	movl   $0x33ca8,-0xc(%ebp)
   30e05:	c7 45 f0 aa 3c 03 00 	movl   $0x33caa,-0x10(%ebp)
   30e0c:	8b 45 f4             	mov    -0xc(%ebp),%eax
   30e0f:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
   30e14:	ba 00 34 03 00       	mov    $0x33400,%edx
   30e19:	8b 45 f0             	mov    -0x10(%ebp),%eax
   30e1c:	89 10                	mov    %edx,(%eax)
   30e1e:	e8 f4 00 00 00       	call   30f17 <load_idt>
   30e23:	c9                   	leave  
   30e24:	c3                   	ret    

00030e25 <int_handler>:
   30e25:	55                   	push   %ebp
   30e26:	89 e5                	mov    %esp,%ebp
   30e28:	83 ec 18             	sub    $0x18,%esp
   30e2b:	8b 45 08             	mov    0x8(%ebp),%eax
   30e2e:	89 44 24 04          	mov    %eax,0x4(%esp)
   30e32:	c7 04 24 80 19 03 00 	movl   $0x31980,(%esp)
   30e39:	e8 2a 08 00 00       	call   31668 <printk>
   30e3e:	c9                   	leave  
   30e3f:	c3                   	ret    

00030e40 <exception_handler>:
   30e40:	55                   	push   %ebp
   30e41:	89 e5                	mov    %esp,%ebp
   30e43:	57                   	push   %edi
   30e44:	56                   	push   %esi
   30e45:	53                   	push   %ebx
   30e46:	83 ec 7c             	sub    $0x7c,%esp
   30e49:	8d 55 94             	lea    -0x6c(%ebp),%edx
   30e4c:	bb 40 1a 03 00       	mov    $0x31a40,%ebx
   30e51:	b8 14 00 00 00       	mov    $0x14,%eax
   30e56:	89 d7                	mov    %edx,%edi
   30e58:	89 de                	mov    %ebx,%esi
   30e5a:	89 c1                	mov    %eax,%ecx
   30e5c:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
   30e5e:	c7 05 04 20 03 00 00 	movl   $0x0,0x32004
   30e65:	00 00 00 
   30e68:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
   30e6f:	eb 10                	jmp    30e81 <exception_handler+0x41>
   30e71:	c7 04 24 96 19 03 00 	movl   $0x31996,(%esp)
   30e78:	e8 eb 07 00 00       	call   31668 <printk>
   30e7d:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
   30e81:	81 7d e4 8f 01 00 00 	cmpl   $0x18f,-0x1c(%ebp)
   30e88:	7e e7                	jle    30e71 <exception_handler+0x31>
   30e8a:	c7 05 04 20 03 00 00 	movl   $0x0,0x32004
   30e91:	00 00 00 
   30e94:	8b 45 08             	mov    0x8(%ebp),%eax
   30e97:	8b 44 85 94          	mov    -0x6c(%ebp,%eax,4),%eax
   30e9b:	89 44 24 04          	mov    %eax,0x4(%esp)
   30e9f:	c7 04 24 98 19 03 00 	movl   $0x31998,(%esp)
   30ea6:	e8 bd 07 00 00       	call   31668 <printk>
   30eab:	8b 45 18             	mov    0x18(%ebp),%eax
   30eae:	89 44 24 0c          	mov    %eax,0xc(%esp)
   30eb2:	8b 45 14             	mov    0x14(%ebp),%eax
   30eb5:	89 44 24 08          	mov    %eax,0x8(%esp)
   30eb9:	8b 45 10             	mov    0x10(%ebp),%eax
   30ebc:	89 44 24 04          	mov    %eax,0x4(%esp)
   30ec0:	c7 04 24 a7 19 03 00 	movl   $0x319a7,(%esp)
   30ec7:	e8 9c 07 00 00       	call   31668 <printk>
   30ecc:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
   30ed0:	74 13                	je     30ee5 <exception_handler+0xa5>
   30ed2:	8b 45 0c             	mov    0xc(%ebp),%eax
   30ed5:	89 44 24 04          	mov    %eax,0x4(%esp)
   30ed9:	c7 04 24 c3 19 03 00 	movl   $0x319c3,(%esp)
   30ee0:	e8 83 07 00 00       	call   31668 <printk>
   30ee5:	83 c4 7c             	add    $0x7c,%esp
   30ee8:	5b                   	pop    %ebx
   30ee9:	5e                   	pop    %esi
   30eea:	5f                   	pop    %edi
   30eeb:	5d                   	pop    %ebp
   30eec:	c3                   	ret    
   30eed:	90                   	nop
   30eee:	90                   	nop
   30eef:	90                   	nop

00030ef0 <jump_new_gdt>:
   30ef0:	0f 01 15 ae 3c 03 00 	lgdtl  0x33cae
   30ef7:	66 b8 68 00          	mov    $0x68,%ax
   30efb:	8e d8                	mov    %eax,%ds
   30efd:	8e c0                	mov    %eax,%es
   30eff:	8e d0                	mov    %eax,%ss
   30f01:	8e e0                	mov    %eax,%fs
   30f03:	8e e8                	mov    %eax,%gs
   30f05:	31 c0                	xor    %eax,%eax
   30f07:	66 b8 80 00          	mov    $0x80,%ax
   30f0b:	0f 00 d8             	ltr    %ax
   30f0e:	ea 16 0f 03 00 60 00 	ljmp   $0x60,$0x30f16
   30f15:	c3                   	ret    

00030f16 <use_new_gdt>:
   30f16:	c3                   	ret    

00030f17 <load_idt>:
   30f17:	0f 01 1d a8 3c 03 00 	lidtl  0x33ca8
   30f1e:	c3                   	ret    
   30f1f:	90                   	nop

00030f20 <strncpy>:
   30f20:	55                   	push   %ebp
   30f21:	89 e5                	mov    %esp,%ebp
   30f23:	83 ec 10             	sub    $0x10,%esp
   30f26:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
   30f2d:	eb 19                	jmp    30f48 <strncpy+0x28>
   30f2f:	8b 45 fc             	mov    -0x4(%ebp),%eax
   30f32:	8b 55 08             	mov    0x8(%ebp),%edx
   30f35:	01 c2                	add    %eax,%edx
   30f37:	8b 45 fc             	mov    -0x4(%ebp),%eax
   30f3a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
   30f3d:	01 c8                	add    %ecx,%eax
   30f3f:	0f b6 00             	movzbl (%eax),%eax
   30f42:	88 02                	mov    %al,(%edx)
   30f44:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   30f48:	8b 45 fc             	mov    -0x4(%ebp),%eax
   30f4b:	3b 45 10             	cmp    0x10(%ebp),%eax
   30f4e:	73 20                	jae    30f70 <strncpy+0x50>
   30f50:	8b 45 fc             	mov    -0x4(%ebp),%eax
   30f53:	8b 55 0c             	mov    0xc(%ebp),%edx
   30f56:	01 d0                	add    %edx,%eax
   30f58:	0f b6 00             	movzbl (%eax),%eax
   30f5b:	84 c0                	test   %al,%al
   30f5d:	75 d0                	jne    30f2f <strncpy+0xf>
   30f5f:	eb 0f                	jmp    30f70 <strncpy+0x50>
   30f61:	8b 45 fc             	mov    -0x4(%ebp),%eax
   30f64:	8b 55 08             	mov    0x8(%ebp),%edx
   30f67:	01 d0                	add    %edx,%eax
   30f69:	c6 00 00             	movb   $0x0,(%eax)
   30f6c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   30f70:	8b 45 fc             	mov    -0x4(%ebp),%eax
   30f73:	3b 45 10             	cmp    0x10(%ebp),%eax
   30f76:	72 e9                	jb     30f61 <strncpy+0x41>
   30f78:	b8 01 00 00 00       	mov    $0x1,%eax
   30f7d:	c9                   	leave  
   30f7e:	c3                   	ret    

00030f7f <testA>:
   30f7f:	55                   	push   %ebp
   30f80:	89 e5                	mov    %esp,%ebp
   30f82:	83 ec 28             	sub    $0x28,%esp
   30f85:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   30f8c:	eb 1e                	jmp    30fac <testA+0x2d>
   30f8e:	c7 04 24 90 1a 03 00 	movl   $0x31a90,(%esp)
   30f95:	e8 ce 06 00 00       	call   31668 <printk>
   30f9a:	b8 1e 10 03 00       	mov    $0x3101e,%eax
   30f9f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
   30fa6:	ff d0                	call   *%eax
   30fa8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   30fac:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
   30fb0:	7e dc                	jle    30f8e <testA+0xf>
   30fb2:	eb fe                	jmp    30fb2 <testA+0x33>

00030fb4 <testB>:
   30fb4:	55                   	push   %ebp
   30fb5:	89 e5                	mov    %esp,%ebp
   30fb7:	83 ec 28             	sub    $0x28,%esp
   30fba:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   30fc1:	eb 1e                	jmp    30fe1 <testB+0x2d>
   30fc3:	c7 04 24 92 1a 03 00 	movl   $0x31a92,(%esp)
   30fca:	e8 99 06 00 00       	call   31668 <printk>
   30fcf:	b8 1e 10 03 00       	mov    $0x3101e,%eax
   30fd4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
   30fdb:	ff d0                	call   *%eax
   30fdd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   30fe1:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
   30fe5:	7e dc                	jle    30fc3 <testB+0xf>
   30fe7:	eb fe                	jmp    30fe7 <testB+0x33>

00030fe9 <testC>:
   30fe9:	55                   	push   %ebp
   30fea:	89 e5                	mov    %esp,%ebp
   30fec:	83 ec 28             	sub    $0x28,%esp
   30fef:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   30ff6:	eb 1e                	jmp    31016 <testC+0x2d>
   30ff8:	c7 04 24 94 1a 03 00 	movl   $0x31a94,(%esp)
   30fff:	e8 64 06 00 00       	call   31668 <printk>
   31004:	b8 1e 10 03 00       	mov    $0x3101e,%eax
   31009:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
   31010:	ff d0                	call   *%eax
   31012:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   31016:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
   3101a:	7e dc                	jle    30ff8 <testC+0xf>
   3101c:	eb fe                	jmp    3101c <testC+0x33>

0003101e <wait>:
   3101e:	55                   	push   %ebp
   3101f:	89 e5                	mov    %esp,%ebp
   31021:	83 ec 10             	sub    $0x10,%esp
   31024:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
   3102b:	eb 30                	jmp    3105d <wait+0x3f>
   3102d:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
   31034:	eb 1a                	jmp    31050 <wait+0x32>
   31036:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   3103d:	eb 04                	jmp    31043 <wait+0x25>
   3103f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   31043:	81 7d f4 f3 01 00 00 	cmpl   $0x1f3,-0xc(%ebp)
   3104a:	7e f3                	jle    3103f <wait+0x21>
   3104c:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
   31050:	81 7d f8 87 13 00 00 	cmpl   $0x1387,-0x8(%ebp)
   31057:	7e dd                	jle    31036 <wait+0x18>
   31059:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   3105d:	8b 55 08             	mov    0x8(%ebp),%edx
   31060:	89 d0                	mov    %edx,%eax
   31062:	01 c0                	add    %eax,%eax
   31064:	01 d0                	add    %edx,%eax
   31066:	3b 45 fc             	cmp    -0x4(%ebp),%eax
   31069:	7f c2                	jg     3102d <wait+0xf>
   3106b:	c9                   	leave  
   3106c:	c3                   	ret    

0003106d <list_init>:
   3106d:	55                   	push   %ebp
   3106e:	89 e5                	mov    %esp,%ebp
   31070:	8b 45 08             	mov    0x8(%ebp),%eax
   31073:	8d 50 08             	lea    0x8(%eax),%edx
   31076:	8b 45 08             	mov    0x8(%ebp),%eax
   31079:	89 50 04             	mov    %edx,0x4(%eax)
   3107c:	8b 45 08             	mov    0x8(%ebp),%eax
   3107f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
   31085:	8b 55 08             	mov    0x8(%ebp),%edx
   31088:	8b 45 08             	mov    0x8(%ebp),%eax
   3108b:	89 50 08             	mov    %edx,0x8(%eax)
   3108e:	8b 45 08             	mov    0x8(%ebp),%eax
   31091:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
   31098:	b8 01 00 00 00       	mov    $0x1,%eax
   3109d:	5d                   	pop    %ebp
   3109e:	c3                   	ret    

0003109f <list_empty>:
   3109f:	55                   	push   %ebp
   310a0:	89 e5                	mov    %esp,%ebp
   310a2:	8b 45 08             	mov    0x8(%ebp),%eax
   310a5:	8b 40 04             	mov    0x4(%eax),%eax
   310a8:	8b 55 08             	mov    0x8(%ebp),%edx
   310ab:	83 c2 08             	add    $0x8,%edx
   310ae:	39 d0                	cmp    %edx,%eax
   310b0:	75 14                	jne    310c6 <list_empty+0x27>
   310b2:	8b 45 08             	mov    0x8(%ebp),%eax
   310b5:	8b 50 08             	mov    0x8(%eax),%edx
   310b8:	8b 45 08             	mov    0x8(%ebp),%eax
   310bb:	39 c2                	cmp    %eax,%edx
   310bd:	75 07                	jne    310c6 <list_empty+0x27>
   310bf:	b8 01 00 00 00       	mov    $0x1,%eax
   310c4:	eb 05                	jmp    310cb <list_empty+0x2c>
   310c6:	b8 00 00 00 00       	mov    $0x0,%eax
   310cb:	5d                   	pop    %ebp
   310cc:	c3                   	ret    

000310cd <list_insert_next>:
   310cd:	55                   	push   %ebp
   310ce:	89 e5                	mov    %esp,%ebp
   310d0:	8b 45 08             	mov    0x8(%ebp),%eax
   310d3:	8b 50 04             	mov    0x4(%eax),%edx
   310d6:	8b 45 0c             	mov    0xc(%ebp),%eax
   310d9:	89 50 04             	mov    %edx,0x4(%eax)
   310dc:	8b 45 0c             	mov    0xc(%ebp),%eax
   310df:	8b 55 08             	mov    0x8(%ebp),%edx
   310e2:	89 10                	mov    %edx,(%eax)
   310e4:	8b 45 08             	mov    0x8(%ebp),%eax
   310e7:	8b 40 04             	mov    0x4(%eax),%eax
   310ea:	8b 55 0c             	mov    0xc(%ebp),%edx
   310ed:	89 10                	mov    %edx,(%eax)
   310ef:	8b 45 08             	mov    0x8(%ebp),%eax
   310f2:	8b 55 0c             	mov    0xc(%ebp),%edx
   310f5:	89 50 04             	mov    %edx,0x4(%eax)
   310f8:	b8 01 00 00 00       	mov    $0x1,%eax
   310fd:	5d                   	pop    %ebp
   310fe:	c3                   	ret    

000310ff <list_insert_prev>:
   310ff:	55                   	push   %ebp
   31100:	89 e5                	mov    %esp,%ebp
   31102:	8b 45 08             	mov    0x8(%ebp),%eax
   31105:	8b 55 0c             	mov    0xc(%ebp),%edx
   31108:	89 50 04             	mov    %edx,0x4(%eax)
   3110b:	8b 45 0c             	mov    0xc(%ebp),%eax
   3110e:	8b 10                	mov    (%eax),%edx
   31110:	8b 45 08             	mov    0x8(%ebp),%eax
   31113:	89 10                	mov    %edx,(%eax)
   31115:	8b 45 0c             	mov    0xc(%ebp),%eax
   31118:	8b 00                	mov    (%eax),%eax
   3111a:	8b 55 08             	mov    0x8(%ebp),%edx
   3111d:	89 50 04             	mov    %edx,0x4(%eax)
   31120:	8b 45 0c             	mov    0xc(%ebp),%eax
   31123:	8b 55 08             	mov    0x8(%ebp),%edx
   31126:	89 10                	mov    %edx,(%eax)
   31128:	b8 01 00 00 00       	mov    $0x1,%eax
   3112d:	5d                   	pop    %ebp
   3112e:	c3                   	ret    

0003112f <list_insert_back>:
   3112f:	55                   	push   %ebp
   31130:	89 e5                	mov    %esp,%ebp
   31132:	83 ec 08             	sub    $0x8,%esp
   31135:	8b 45 0c             	mov    0xc(%ebp),%eax
   31138:	83 c0 08             	add    $0x8,%eax
   3113b:	89 44 24 04          	mov    %eax,0x4(%esp)
   3113f:	8b 45 08             	mov    0x8(%ebp),%eax
   31142:	89 04 24             	mov    %eax,(%esp)
   31145:	e8 b5 ff ff ff       	call   310ff <list_insert_prev>
   3114a:	c9                   	leave  
   3114b:	c3                   	ret    

0003114c <list_remove>:
   3114c:	55                   	push   %ebp
   3114d:	89 e5                	mov    %esp,%ebp
   3114f:	8b 45 08             	mov    0x8(%ebp),%eax
   31152:	8b 00                	mov    (%eax),%eax
   31154:	8b 55 08             	mov    0x8(%ebp),%edx
   31157:	8b 52 04             	mov    0x4(%edx),%edx
   3115a:	89 50 04             	mov    %edx,0x4(%eax)
   3115d:	8b 45 08             	mov    0x8(%ebp),%eax
   31160:	8b 40 04             	mov    0x4(%eax),%eax
   31163:	8b 55 08             	mov    0x8(%ebp),%edx
   31166:	8b 12                	mov    (%edx),%edx
   31168:	89 10                	mov    %edx,(%eax)
   3116a:	8b 45 08             	mov    0x8(%ebp),%eax
   3116d:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
   31174:	8b 45 08             	mov    0x8(%ebp),%eax
   31177:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
   3117d:	b8 01 00 00 00       	mov    $0x1,%eax
   31182:	5d                   	pop    %ebp
   31183:	c3                   	ret    

00031184 <init_first_thread>:
   31184:	55                   	push   %ebp
   31185:	89 e5                	mov    %esp,%ebp
   31187:	83 ec 28             	sub    $0x28,%esp
   3118a:	c7 04 24 88 3c 03 00 	movl   $0x33c88,(%esp)
   31191:	e8 d7 fe ff ff       	call   3106d <list_init>
   31196:	c7 04 24 98 3c 03 00 	movl   $0x33c98,(%esp)
   3119d:	e8 cb fe ff ff       	call   3106d <list_init>
   311a2:	c7 44 24 0c 7f 0f 03 	movl   $0x30f7f,0xc(%esp)
   311a9:	00 
   311aa:	c7 44 24 08 96 1a 03 	movl   $0x31a96,0x8(%esp)
   311b1:	00 
   311b2:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
   311b9:	00 
   311ba:	c7 04 24 00 d0 03 00 	movl   $0x3d000,(%esp)
   311c1:	e8 f8 00 00 00       	call   312be <init_thread>
   311c6:	89 45 f4             	mov    %eax,-0xc(%ebp)
   311c9:	c7 44 24 04 00 90 00 	movl   $0x9000,0x4(%esp)
   311d0:	00 
   311d1:	c7 04 24 9c 1a 03 00 	movl   $0x31a9c,(%esp)
   311d8:	e8 8b 04 00 00       	call   31668 <printk>
   311dd:	c7 44 24 04 98 3c 03 	movl   $0x33c98,0x4(%esp)
   311e4:	00 
   311e5:	c7 04 24 6c d0 03 00 	movl   $0x3d06c,(%esp)
   311ec:	e8 e0 01 00 00       	call   313d1 <list_insert_by_pri>
   311f1:	c7 44 24 04 88 3c 03 	movl   $0x33c88,0x4(%esp)
   311f8:	00 
   311f9:	c7 04 24 74 d0 03 00 	movl   $0x3d074,(%esp)
   31200:	e8 2a ff ff ff       	call   3112f <list_insert_back>
   31205:	8b 45 f4             	mov    -0xc(%ebp),%eax
   31208:	c9                   	leave  
   31209:	c3                   	ret    

0003120a <init_second_thread>:
   3120a:	55                   	push   %ebp
   3120b:	89 e5                	mov    %esp,%ebp
   3120d:	83 ec 28             	sub    $0x28,%esp
   31210:	c7 44 24 0c b4 0f 03 	movl   $0x30fb4,0xc(%esp)
   31217:	00 
   31218:	c7 44 24 08 a0 1a 03 	movl   $0x31aa0,0x8(%esp)
   3121f:	00 
   31220:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
   31227:	00 
   31228:	c7 04 24 00 40 03 00 	movl   $0x34000,(%esp)
   3122f:	e8 8a 00 00 00       	call   312be <init_thread>
   31234:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31237:	c7 44 24 04 98 3c 03 	movl   $0x33c98,0x4(%esp)
   3123e:	00 
   3123f:	c7 04 24 6c 40 03 00 	movl   $0x3406c,(%esp)
   31246:	e8 86 01 00 00       	call   313d1 <list_insert_by_pri>
   3124b:	c7 44 24 04 88 3c 03 	movl   $0x33c88,0x4(%esp)
   31252:	00 
   31253:	c7 04 24 74 40 03 00 	movl   $0x34074,(%esp)
   3125a:	e8 d0 fe ff ff       	call   3112f <list_insert_back>
   3125f:	8b 45 f4             	mov    -0xc(%ebp),%eax
   31262:	c9                   	leave  
   31263:	c3                   	ret    

00031264 <init_third_thread>:
   31264:	55                   	push   %ebp
   31265:	89 e5                	mov    %esp,%ebp
   31267:	83 ec 28             	sub    $0x28,%esp
   3126a:	c7 44 24 0c e9 0f 03 	movl   $0x30fe9,0xc(%esp)
   31271:	00 
   31272:	c7 44 24 08 a6 1a 03 	movl   $0x31aa6,0x8(%esp)
   31279:	00 
   3127a:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
   31281:	00 
   31282:	c7 04 24 00 60 04 00 	movl   $0x46000,(%esp)
   31289:	e8 30 00 00 00       	call   312be <init_thread>
   3128e:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31291:	c7 44 24 04 98 3c 03 	movl   $0x33c98,0x4(%esp)
   31298:	00 
   31299:	c7 04 24 6c 60 04 00 	movl   $0x4606c,(%esp)
   312a0:	e8 2c 01 00 00       	call   313d1 <list_insert_by_pri>
   312a5:	c7 44 24 04 88 3c 03 	movl   $0x33c88,0x4(%esp)
   312ac:	00 
   312ad:	c7 04 24 74 60 04 00 	movl   $0x46074,(%esp)
   312b4:	e8 76 fe ff ff       	call   3112f <list_insert_back>
   312b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
   312bc:	c9                   	leave  
   312bd:	c3                   	ret    

000312be <init_thread>:
   312be:	55                   	push   %ebp
   312bf:	89 e5                	mov    %esp,%ebp
   312c1:	83 ec 0c             	sub    $0xc,%esp
   312c4:	a1 08 20 03 00       	mov    0x32008,%eax
   312c9:	89 c2                	mov    %eax,%edx
   312cb:	8b 45 08             	mov    0x8(%ebp),%eax
   312ce:	89 50 38             	mov    %edx,0x38(%eax)
   312d1:	a1 0c 20 03 00       	mov    0x3200c,%eax
   312d6:	89 c2                	mov    %eax,%edx
   312d8:	8b 45 08             	mov    0x8(%ebp),%eax
   312db:	89 10                	mov    %edx,(%eax)
   312dd:	a1 0c 20 03 00       	mov    0x3200c,%eax
   312e2:	89 c2                	mov    %eax,%edx
   312e4:	8b 45 08             	mov    0x8(%ebp),%eax
   312e7:	89 50 04             	mov    %edx,0x4(%eax)
   312ea:	a1 0c 20 03 00       	mov    0x3200c,%eax
   312ef:	89 c2                	mov    %eax,%edx
   312f1:	8b 45 08             	mov    0x8(%ebp),%eax
   312f4:	89 50 08             	mov    %edx,0x8(%eax)
   312f7:	a1 0c 20 03 00       	mov    0x3200c,%eax
   312fc:	89 c2                	mov    %eax,%edx
   312fe:	8b 45 08             	mov    0x8(%ebp),%eax
   31301:	89 50 0c             	mov    %edx,0xc(%eax)
   31304:	a1 0c 20 03 00       	mov    0x3200c,%eax
   31309:	89 c2                	mov    %eax,%edx
   3130b:	8b 45 08             	mov    0x8(%ebp),%eax
   3130e:	89 50 44             	mov    %edx,0x44(%eax)
   31311:	8b 55 14             	mov    0x14(%ebp),%edx
   31314:	8b 45 08             	mov    0x8(%ebp),%eax
   31317:	89 50 34             	mov    %edx,0x34(%eax)
   3131a:	8b 45 08             	mov    0x8(%ebp),%eax
   3131d:	05 7c 80 00 00       	add    $0x807c,%eax
   31322:	89 c2                	mov    %eax,%edx
   31324:	8b 45 08             	mov    0x8(%ebp),%eax
   31327:	89 50 40             	mov    %edx,0x40(%eax)
   3132a:	8b 45 08             	mov    0x8(%ebp),%eax
   3132d:	c7 40 3c 02 12 00 00 	movl   $0x1202,0x3c(%eax)
   31334:	8b 45 08             	mov    0x8(%ebp),%eax
   31337:	8d 50 4c             	lea    0x4c(%eax),%edx
   3133a:	c7 44 24 08 14 00 00 	movl   $0x14,0x8(%esp)
   31341:	00 
   31342:	8b 45 10             	mov    0x10(%ebp),%eax
   31345:	89 44 24 04          	mov    %eax,0x4(%esp)
   31349:	89 14 24             	mov    %edx,(%esp)
   3134c:	e8 cf fb ff ff       	call   30f20 <strncpy>
   31351:	8b 45 08             	mov    0x8(%ebp),%eax
   31354:	c7 40 64 04 00 00 00 	movl   $0x4,0x64(%eax)
   3135b:	8b 45 08             	mov    0x8(%ebp),%eax
   3135e:	8b 55 0c             	mov    0xc(%ebp),%edx
   31361:	89 50 60             	mov    %edx,0x60(%eax)
   31364:	b8 01 00 00 00       	mov    $0x1,%eax
   31369:	c9                   	leave  
   3136a:	c3                   	ret    

0003136b <running_thread>:
   3136b:	55                   	push   %ebp
   3136c:	89 e5                	mov    %esp,%ebp
   3136e:	53                   	push   %ebx
   3136f:	83 ec 10             	sub    $0x10,%esp
   31372:	89 e3                	mov    %esp,%ebx
   31374:	89 5d f8             	mov    %ebx,-0x8(%ebp)
   31377:	8b 45 f8             	mov    -0x8(%ebp),%eax
   3137a:	25 00 f0 ff ff       	and    $0xfffff000,%eax
   3137f:	83 c4 10             	add    $0x10,%esp
   31382:	5b                   	pop    %ebx
   31383:	5d                   	pop    %ebp
   31384:	c3                   	ret    

00031385 <next_thread_to_run>:
   31385:	55                   	push   %ebp
   31386:	89 e5                	mov    %esp,%ebp
   31388:	83 ec 18             	sub    $0x18,%esp
   3138b:	c7 04 24 98 3c 03 00 	movl   $0x33c98,(%esp)
   31392:	e8 08 fd ff ff       	call   3109f <list_empty>
   31397:	85 c0                	test   %eax,%eax
   31399:	75 34                	jne    313cf <next_thread_to_run+0x4a>
   3139b:	a1 9c 3c 03 00       	mov    0x33c9c,%eax
   313a0:	83 e8 6c             	sub    $0x6c,%eax
   313a3:	89 45 fc             	mov    %eax,-0x4(%ebp)
   313a6:	8b 45 fc             	mov    -0x4(%ebp),%eax
   313a9:	83 c0 6c             	add    $0x6c,%eax
   313ac:	89 04 24             	mov    %eax,(%esp)
   313af:	e8 98 fd ff ff       	call   3114c <list_remove>
   313b4:	8b 45 fc             	mov    -0x4(%ebp),%eax
   313b7:	83 c0 6c             	add    $0x6c,%eax
   313ba:	c7 44 24 04 98 3c 03 	movl   $0x33c98,0x4(%esp)
   313c1:	00 
   313c2:	89 04 24             	mov    %eax,(%esp)
   313c5:	e8 65 fd ff ff       	call   3112f <list_insert_back>
   313ca:	8b 45 fc             	mov    -0x4(%ebp),%eax
   313cd:	eb 00                	jmp    313cf <next_thread_to_run+0x4a>
   313cf:	c9                   	leave  
   313d0:	c3                   	ret    

000313d1 <list_insert_by_pri>:
   313d1:	55                   	push   %ebp
   313d2:	89 e5                	mov    %esp,%ebp
   313d4:	83 ec 18             	sub    $0x18,%esp
   313d7:	8b 45 0c             	mov    0xc(%ebp),%eax
   313da:	89 04 24             	mov    %eax,(%esp)
   313dd:	e8 bd fc ff ff       	call   3109f <list_empty>
   313e2:	85 c0                	test   %eax,%eax
   313e4:	74 19                	je     313ff <list_insert_by_pri+0x2e>
   313e6:	8b 45 0c             	mov    0xc(%ebp),%eax
   313e9:	8b 55 08             	mov    0x8(%ebp),%edx
   313ec:	89 54 24 04          	mov    %edx,0x4(%esp)
   313f0:	89 04 24             	mov    %eax,(%esp)
   313f3:	e8 d5 fc ff ff       	call   310cd <list_insert_next>
   313f8:	b8 01 00 00 00       	mov    $0x1,%eax
   313fd:	eb 63                	jmp    31462 <list_insert_by_pri+0x91>
   313ff:	8b 45 0c             	mov    0xc(%ebp),%eax
   31402:	8b 40 04             	mov    0x4(%eax),%eax
   31405:	89 45 fc             	mov    %eax,-0x4(%ebp)
   31408:	8b 45 08             	mov    0x8(%ebp),%eax
   3140b:	83 e8 6c             	sub    $0x6c,%eax
   3140e:	8b 50 60             	mov    0x60(%eax),%edx
   31411:	8b 45 fc             	mov    -0x4(%ebp),%eax
   31414:	83 e8 6c             	sub    $0x6c,%eax
   31417:	8b 40 60             	mov    0x60(%eax),%eax
   3141a:	39 c2                	cmp    %eax,%edx
   3141c:	7d 19                	jge    31437 <list_insert_by_pri+0x66>
   3141e:	8b 45 fc             	mov    -0x4(%ebp),%eax
   31421:	89 44 24 04          	mov    %eax,0x4(%esp)
   31425:	8b 45 08             	mov    0x8(%ebp),%eax
   31428:	89 04 24             	mov    %eax,(%esp)
   3142b:	e8 cf fc ff ff       	call   310ff <list_insert_prev>
   31430:	b8 01 00 00 00       	mov    $0x1,%eax
   31435:	eb 2b                	jmp    31462 <list_insert_by_pri+0x91>
   31437:	8b 45 fc             	mov    -0x4(%ebp),%eax
   3143a:	8b 40 04             	mov    0x4(%eax),%eax
   3143d:	89 45 fc             	mov    %eax,-0x4(%ebp)
   31440:	8b 45 0c             	mov    0xc(%ebp),%eax
   31443:	83 c0 08             	add    $0x8,%eax
   31446:	3b 45 fc             	cmp    -0x4(%ebp),%eax
   31449:	75 bd                	jne    31408 <list_insert_by_pri+0x37>
   3144b:	8b 45 0c             	mov    0xc(%ebp),%eax
   3144e:	89 44 24 04          	mov    %eax,0x4(%esp)
   31452:	8b 45 08             	mov    0x8(%ebp),%eax
   31455:	89 04 24             	mov    %eax,(%esp)
   31458:	e8 d2 fc ff ff       	call   3112f <list_insert_back>
   3145d:	b8 01 00 00 00       	mov    $0x1,%eax
   31462:	c9                   	leave  
   31463:	c3                   	ret    

00031464 <run_first_thread>:
   31464:	55                   	push   %ebp
   31465:	89 e5                	mov    %esp,%ebp
   31467:	e8 19 ff ff ff       	call   31385 <next_thread_to_run>
   3146c:	a3 00 f0 04 00       	mov    %eax,0x4f000
   31471:	5d                   	pop    %ebp
   31472:	c3                   	ret    
   31473:	90                   	nop
   31474:	90                   	nop
   31475:	90                   	nop
   31476:	90                   	nop
   31477:	90                   	nop
   31478:	90                   	nop
   31479:	90                   	nop
   3147a:	90                   	nop
   3147b:	90                   	nop
   3147c:	90                   	nop
   3147d:	90                   	nop
   3147e:	90                   	nop
   3147f:	90                   	nop

00031480 <hwint00>:
   31480:	83 ec 04             	sub    $0x4,%esp
   31483:	60                   	pusha  
   31484:	1e                   	push   %ds
   31485:	06                   	push   %es
   31486:	0f a0                	push   %fs
   31488:	0f a8                	push   %gs
   3148a:	65 fe 05 00 80 0b 00 	incb   %gs:0xb8000
   31491:	ff 05 00 3c 03 00    	incl   0x33c00
   31497:	83 3d 00 3c 03 00 00 	cmpl   $0x0,0x33c00
   3149e:	75 22                	jne    314c2 <hwint00.re_entry>
   314a0:	bc 01 20 03 00       	mov    $0x32001,%esp
   314a5:	fb                   	sti    
   314a6:	e8 7d 01 00 00       	call   31628 <timer_interrupt>
   314ab:	fa                   	cli    
   314ac:	b0 20                	mov    $0x20,%al
   314ae:	e6 20                	out    %al,$0x20
   314b0:	8b 25 00 f0 04 00    	mov    0x4f000,%esp
   314b6:	8d 84 24 48 00 00 00 	lea    0x48(%esp),%eax
   314bd:	a3 24 3c 03 00       	mov    %eax,0x33c24

000314c2 <hwint00.re_entry>:
   314c2:	ff 0d 00 3c 03 00    	decl   0x33c00
   314c8:	0f a9                	pop    %gs
   314ca:	0f a1                	pop    %fs
   314cc:	07                   	pop    %es
   314cd:	1f                   	pop    %ds
   314ce:	61                   	popa   
   314cf:	83 c4 04             	add    $0x4,%esp
   314d2:	cf                   	iret   
   314d3:	90                   	nop
   314d4:	90                   	nop
   314d5:	90                   	nop
   314d6:	90                   	nop
   314d7:	90                   	nop
   314d8:	90                   	nop
   314d9:	90                   	nop
   314da:	90                   	nop
   314db:	90                   	nop
   314dc:	90                   	nop
   314dd:	90                   	nop
   314de:	90                   	nop
   314df:	90                   	nop

000314e0 <hwint01>:
   314e0:	6a 01                	push   $0x1
   314e2:	e8 3e f9 ff ff       	call   30e25 <int_handler>
   314e7:	83 c4 04             	add    $0x4,%esp
   314ea:	f4                   	hlt    
   314eb:	90                   	nop
   314ec:	90                   	nop
   314ed:	90                   	nop
   314ee:	90                   	nop
   314ef:	90                   	nop

000314f0 <hwint02>:
   314f0:	6a 02                	push   $0x2
   314f2:	e8 2e f9 ff ff       	call   30e25 <int_handler>
   314f7:	83 c4 04             	add    $0x4,%esp
   314fa:	f4                   	hlt    
   314fb:	90                   	nop
   314fc:	90                   	nop
   314fd:	90                   	nop
   314fe:	90                   	nop
   314ff:	90                   	nop

00031500 <hwint03>:
   31500:	6a 03                	push   $0x3
   31502:	e8 1e f9 ff ff       	call   30e25 <int_handler>
   31507:	83 c4 04             	add    $0x4,%esp
   3150a:	f4                   	hlt    
   3150b:	90                   	nop
   3150c:	90                   	nop
   3150d:	90                   	nop
   3150e:	90                   	nop
   3150f:	90                   	nop

00031510 <hwint04>:
   31510:	6a 04                	push   $0x4
   31512:	e8 0e f9 ff ff       	call   30e25 <int_handler>
   31517:	83 c4 04             	add    $0x4,%esp
   3151a:	f4                   	hlt    
   3151b:	90                   	nop
   3151c:	90                   	nop
   3151d:	90                   	nop
   3151e:	90                   	nop
   3151f:	90                   	nop

00031520 <hwint05>:
   31520:	6a 05                	push   $0x5
   31522:	e8 fe f8 ff ff       	call   30e25 <int_handler>
   31527:	83 c4 04             	add    $0x4,%esp
   3152a:	f4                   	hlt    
   3152b:	90                   	nop
   3152c:	90                   	nop
   3152d:	90                   	nop
   3152e:	90                   	nop
   3152f:	90                   	nop

00031530 <hwint06>:
   31530:	6a 06                	push   $0x6
   31532:	e8 ee f8 ff ff       	call   30e25 <int_handler>
   31537:	83 c4 04             	add    $0x4,%esp
   3153a:	f4                   	hlt    
   3153b:	90                   	nop
   3153c:	90                   	nop
   3153d:	90                   	nop
   3153e:	90                   	nop
   3153f:	90                   	nop

00031540 <hwint07>:
   31540:	6a 07                	push   $0x7
   31542:	e8 de f8 ff ff       	call   30e25 <int_handler>
   31547:	83 c4 04             	add    $0x4,%esp
   3154a:	f4                   	hlt    
   3154b:	90                   	nop
   3154c:	90                   	nop
   3154d:	90                   	nop
   3154e:	90                   	nop
   3154f:	90                   	nop

00031550 <hwint08>:
   31550:	6a 08                	push   $0x8
   31552:	e8 ce f8 ff ff       	call   30e25 <int_handler>
   31557:	83 c4 04             	add    $0x4,%esp
   3155a:	f4                   	hlt    
   3155b:	90                   	nop
   3155c:	90                   	nop
   3155d:	90                   	nop
   3155e:	90                   	nop
   3155f:	90                   	nop

00031560 <hwint09>:
   31560:	6a 09                	push   $0x9
   31562:	e8 be f8 ff ff       	call   30e25 <int_handler>
   31567:	83 c4 04             	add    $0x4,%esp
   3156a:	f4                   	hlt    
   3156b:	90                   	nop
   3156c:	90                   	nop
   3156d:	90                   	nop
   3156e:	90                   	nop
   3156f:	90                   	nop

00031570 <hwint10>:
   31570:	6a 0a                	push   $0xa
   31572:	e8 ae f8 ff ff       	call   30e25 <int_handler>
   31577:	83 c4 04             	add    $0x4,%esp
   3157a:	f4                   	hlt    
   3157b:	90                   	nop
   3157c:	90                   	nop
   3157d:	90                   	nop
   3157e:	90                   	nop
   3157f:	90                   	nop

00031580 <hwint11>:
   31580:	6a 0b                	push   $0xb
   31582:	e8 9e f8 ff ff       	call   30e25 <int_handler>
   31587:	83 c4 04             	add    $0x4,%esp
   3158a:	f4                   	hlt    
   3158b:	90                   	nop
   3158c:	90                   	nop
   3158d:	90                   	nop
   3158e:	90                   	nop
   3158f:	90                   	nop

00031590 <hwint12>:
   31590:	6a 0c                	push   $0xc
   31592:	e8 8e f8 ff ff       	call   30e25 <int_handler>
   31597:	83 c4 04             	add    $0x4,%esp
   3159a:	f4                   	hlt    
   3159b:	90                   	nop
   3159c:	90                   	nop
   3159d:	90                   	nop
   3159e:	90                   	nop
   3159f:	90                   	nop

000315a0 <hwint13>:
   315a0:	6a 0d                	push   $0xd
   315a2:	e8 7e f8 ff ff       	call   30e25 <int_handler>
   315a7:	83 c4 04             	add    $0x4,%esp
   315aa:	f4                   	hlt    
   315ab:	90                   	nop
   315ac:	90                   	nop
   315ad:	90                   	nop
   315ae:	90                   	nop
   315af:	90                   	nop

000315b0 <hwint14>:
   315b0:	6a 0e                	push   $0xe
   315b2:	e8 6e f8 ff ff       	call   30e25 <int_handler>
   315b7:	83 c4 04             	add    $0x4,%esp
   315ba:	f4                   	hlt    
   315bb:	90                   	nop
   315bc:	90                   	nop
   315bd:	90                   	nop
   315be:	90                   	nop
   315bf:	90                   	nop

000315c0 <hwint15>:
   315c0:	6a 0f                	push   $0xf
   315c2:	e8 5e f8 ff ff       	call   30e25 <int_handler>
   315c7:	83 c4 04             	add    $0x4,%esp
   315ca:	f4                   	hlt    

000315cb <divide_error>:
   315cb:	6a ff                	push   $0xffffffff
   315cd:	6a 00                	push   $0x0
   315cf:	eb 4e                	jmp    3161f <exception>

000315d1 <debug>:
   315d1:	6a ff                	push   $0xffffffff
   315d3:	6a 01                	push   $0x1
   315d5:	eb 48                	jmp    3161f <exception>

000315d7 <nmi>:
   315d7:	6a ff                	push   $0xffffffff
   315d9:	6a 02                	push   $0x2
   315db:	eb 42                	jmp    3161f <exception>

000315dd <int3>:
   315dd:	6a ff                	push   $0xffffffff
   315df:	6a 03                	push   $0x3
   315e1:	eb 3c                	jmp    3161f <exception>

000315e3 <overflow>:
   315e3:	6a ff                	push   $0xffffffff
   315e5:	6a 04                	push   $0x4
   315e7:	eb 36                	jmp    3161f <exception>

000315e9 <bounds>:
   315e9:	6a ff                	push   $0xffffffff
   315eb:	6a 05                	push   $0x5
   315ed:	eb 30                	jmp    3161f <exception>

000315ef <invalid_op>:
   315ef:	6a ff                	push   $0xffffffff
   315f1:	6a 06                	push   $0x6
   315f3:	eb 2a                	jmp    3161f <exception>

000315f5 <device_not_available>:
   315f5:	6a ff                	push   $0xffffffff
   315f7:	6a 07                	push   $0x7
   315f9:	eb 24                	jmp    3161f <exception>

000315fb <doublefault_fn>:
   315fb:	6a 08                	push   $0x8
   315fd:	eb 20                	jmp    3161f <exception>

000315ff <coprocessor_segment_overrun>:
   315ff:	6a ff                	push   $0xffffffff
   31601:	6a 09                	push   $0x9
   31603:	eb 1a                	jmp    3161f <exception>

00031605 <invalid_tss>:
   31605:	6a 0a                	push   $0xa
   31607:	eb 16                	jmp    3161f <exception>

00031609 <segment_not_present>:
   31609:	6a 0b                	push   $0xb
   3160b:	eb 12                	jmp    3161f <exception>

0003160d <stack_segment>:
   3160d:	6a 0c                	push   $0xc
   3160f:	eb 0e                	jmp    3161f <exception>

00031611 <general_protection>:
   31611:	6a 0d                	push   $0xd
   31613:	eb 0a                	jmp    3161f <exception>

00031615 <page_fault>:
   31615:	6a 0e                	push   $0xe
   31617:	eb 06                	jmp    3161f <exception>

00031619 <coprocessor_error>:
   31619:	6a ff                	push   $0xffffffff
   3161b:	6a 10                	push   $0x10
   3161d:	eb 00                	jmp    3161f <exception>

0003161f <exception>:
   3161f:	e8 1c f8 ff ff       	call   30e40 <exception_handler>
   31624:	83 c4 08             	add    $0x8,%esp
   31627:	f4                   	hlt    

00031628 <timer_interrupt>:
   31628:	55                   	push   %ebp
   31629:	89 e5                	mov    %esp,%ebp
   3162b:	83 ec 18             	sub    $0x18,%esp
   3162e:	c7 04 24 ac 1a 03 00 	movl   $0x31aac,(%esp)
   31635:	e8 2e 00 00 00       	call   31668 <printk>
   3163a:	e8 46 fd ff ff       	call   31385 <next_thread_to_run>
   3163f:	a3 00 f0 04 00       	mov    %eax,0x4f000
   31644:	c9                   	leave  
   31645:	c3                   	ret    
   31646:	90                   	nop
   31647:	90                   	nop

00031648 <print>:
   31648:	55                   	push   %ebp
   31649:	89 e5                	mov    %esp,%ebp
   3164b:	83 ec 18             	sub    $0x18,%esp
   3164e:	c7 04 24 37 1b 03 00 	movl   $0x31b37,(%esp)
   31655:	e8 0e 00 00 00       	call   31668 <printk>
   3165a:	c7 04 24 55 1b 03 00 	movl   $0x31b55,(%esp)
   31661:	e8 02 00 00 00       	call   31668 <printk>
   31666:	c9                   	leave  
   31667:	c3                   	ret    

00031668 <printk>:
   31668:	55                   	push   %ebp
   31669:	89 e5                	mov    %esp,%ebp
   3166b:	81 ec 28 04 00 00    	sub    $0x428,%esp
   31671:	8d 55 0c             	lea    0xc(%ebp),%edx
   31674:	8d 85 f0 fb ff ff    	lea    -0x410(%ebp),%eax
   3167a:	89 10                	mov    %edx,(%eax)
   3167c:	8b 85 f0 fb ff ff    	mov    -0x410(%ebp),%eax
   31682:	89 44 24 08          	mov    %eax,0x8(%esp)
   31686:	8b 45 08             	mov    0x8(%ebp),%eax
   31689:	89 44 24 04          	mov    %eax,0x4(%esp)
   3168d:	8d 85 f4 fb ff ff    	lea    -0x40c(%ebp),%eax
   31693:	89 04 24             	mov    %eax,(%esp)
   31696:	e8 16 00 00 00       	call   316b1 <__vprintf__>
   3169b:	89 45 f4             	mov    %eax,-0xc(%ebp)
   3169e:	8d 85 f4 fb ff ff    	lea    -0x40c(%ebp),%eax
   316a4:	89 04 24             	mov    %eax,(%esp)
   316a7:	e8 54 ee ff ff       	call   30500 <disp_str>
   316ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
   316af:	c9                   	leave  
   316b0:	c3                   	ret    

000316b1 <__vprintf__>:
   316b1:	55                   	push   %ebp
   316b2:	89 e5                	mov    %esp,%ebp
   316b4:	83 ec 30             	sub    $0x30,%esp
   316b7:	8b 45 0c             	mov    0xc(%ebp),%eax
   316ba:	89 45 fc             	mov    %eax,-0x4(%ebp)
   316bd:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
   316c4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   316cb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
   316d2:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
   316d9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
   316e0:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
   316e7:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
   316ee:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
   316f4:	e9 72 01 00 00       	jmp    3186b <__vprintf__+0x1ba>
   316f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
   316fc:	0f b6 00             	movzbl (%eax),%eax
   316ff:	3c 25                	cmp    $0x25,%al
   31701:	0f 85 4e 01 00 00    	jne    31855 <__vprintf__+0x1a4>
   31707:	8b 45 fc             	mov    -0x4(%ebp),%eax
   3170a:	83 c0 01             	add    $0x1,%eax
   3170d:	0f b6 00             	movzbl (%eax),%eax
   31710:	0f be c0             	movsbl %al,%eax
   31713:	83 f8 64             	cmp    $0x64,%eax
   31716:	74 3e                	je     31756 <__vprintf__+0xa5>
   31718:	83 f8 73             	cmp    $0x73,%eax
   3171b:	0f 84 fa 00 00 00    	je     3181b <__vprintf__+0x16a>
   31721:	83 f8 63             	cmp    $0x63,%eax
   31724:	0f 85 39 01 00 00    	jne    31863 <__vprintf__+0x1b2>
   3172a:	8b 45 10             	mov    0x10(%ebp),%eax
   3172d:	8d 50 04             	lea    0x4(%eax),%edx
   31730:	89 55 10             	mov    %edx,0x10(%ebp)
   31733:	8b 00                	mov    (%eax),%eax
   31735:	89 45 f0             	mov    %eax,-0x10(%ebp)
   31738:	8b 45 f8             	mov    -0x8(%ebp),%eax
   3173b:	03 45 08             	add    0x8(%ebp),%eax
   3173e:	8b 55 f0             	mov    -0x10(%ebp),%edx
   31741:	8b 14 95 20 20 03 00 	mov    0x32020(,%edx,4),%edx
   31748:	0f b6 12             	movzbl (%edx),%edx
   3174b:	88 10                	mov    %dl,(%eax)
   3174d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   31751:	e9 0d 01 00 00       	jmp    31863 <__vprintf__+0x1b2>
   31756:	8b 45 10             	mov    0x10(%ebp),%eax
   31759:	8d 50 04             	lea    0x4(%eax),%edx
   3175c:	89 55 10             	mov    %edx,0x10(%ebp)
   3175f:	8b 00                	mov    (%eax),%eax
   31761:	89 45 f0             	mov    %eax,-0x10(%ebp)
   31764:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
   3176b:	8b 4d f0             	mov    -0x10(%ebp),%ecx
   3176e:	ba 67 66 66 66       	mov    $0x66666667,%edx
   31773:	89 c8                	mov    %ecx,%eax
   31775:	f7 ea                	imul   %edx
   31777:	c1 fa 02             	sar    $0x2,%edx
   3177a:	89 c8                	mov    %ecx,%eax
   3177c:	c1 f8 1f             	sar    $0x1f,%eax
   3177f:	29 c2                	sub    %eax,%edx
   31781:	89 d0                	mov    %edx,%eax
   31783:	c1 e0 02             	shl    $0x2,%eax
   31786:	01 d0                	add    %edx,%eax
   31788:	01 c0                	add    %eax,%eax
   3178a:	89 ca                	mov    %ecx,%edx
   3178c:	29 c2                	sub    %eax,%edx
   3178e:	8d 42 30             	lea    0x30(%edx),%eax
   31791:	8b 04 85 20 20 03 00 	mov    0x32020(,%eax,4),%eax
   31798:	0f b6 10             	movzbl (%eax),%edx
   3179b:	8d 45 de             	lea    -0x22(%ebp),%eax
   3179e:	03 45 ec             	add    -0x14(%ebp),%eax
   317a1:	88 10                	mov    %dl,(%eax)
   317a3:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
   317a7:	8b 4d f0             	mov    -0x10(%ebp),%ecx
   317aa:	ba 67 66 66 66       	mov    $0x66666667,%edx
   317af:	89 c8                	mov    %ecx,%eax
   317b1:	f7 ea                	imul   %edx
   317b3:	c1 fa 02             	sar    $0x2,%edx
   317b6:	89 c8                	mov    %ecx,%eax
   317b8:	c1 f8 1f             	sar    $0x1f,%eax
   317bb:	89 d1                	mov    %edx,%ecx
   317bd:	29 c1                	sub    %eax,%ecx
   317bf:	89 c8                	mov    %ecx,%eax
   317c1:	89 45 f0             	mov    %eax,-0x10(%ebp)
   317c4:	8b 4d f0             	mov    -0x10(%ebp),%ecx
   317c7:	ba 67 66 66 66       	mov    $0x66666667,%edx
   317cc:	89 c8                	mov    %ecx,%eax
   317ce:	f7 ea                	imul   %edx
   317d0:	c1 fa 02             	sar    $0x2,%edx
   317d3:	89 c8                	mov    %ecx,%eax
   317d5:	c1 f8 1f             	sar    $0x1f,%eax
   317d8:	29 c2                	sub    %eax,%edx
   317da:	89 d0                	mov    %edx,%eax
   317dc:	c1 e0 02             	shl    $0x2,%eax
   317df:	01 d0                	add    %edx,%eax
   317e1:	01 c0                	add    %eax,%eax
   317e3:	89 ca                	mov    %ecx,%edx
   317e5:	29 c2                	sub    %eax,%edx
   317e7:	85 d2                	test   %edx,%edx
   317e9:	75 80                	jne    3176b <__vprintf__+0xba>
   317eb:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
   317ef:	eb 19                	jmp    3180a <__vprintf__+0x159>
   317f1:	8b 45 f8             	mov    -0x8(%ebp),%eax
   317f4:	03 45 08             	add    0x8(%ebp),%eax
   317f7:	8d 55 de             	lea    -0x22(%ebp),%edx
   317fa:	03 55 ec             	add    -0x14(%ebp),%edx
   317fd:	0f b6 12             	movzbl (%edx),%edx
   31800:	88 10                	mov    %dl,(%eax)
   31802:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
   31806:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
   3180a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
   3180e:	79 e1                	jns    317f1 <__vprintf__+0x140>
   31810:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
   31814:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   31818:	90                   	nop
   31819:	eb 48                	jmp    31863 <__vprintf__+0x1b2>
   3181b:	8b 45 10             	mov    0x10(%ebp),%eax
   3181e:	8d 50 04             	lea    0x4(%eax),%edx
   31821:	89 55 10             	mov    %edx,0x10(%ebp)
   31824:	8b 00                	mov    (%eax),%eax
   31826:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31829:	eb 16                	jmp    31841 <__vprintf__+0x190>
   3182b:	8b 45 f8             	mov    -0x8(%ebp),%eax
   3182e:	03 45 08             	add    0x8(%ebp),%eax
   31831:	8b 55 f4             	mov    -0xc(%ebp),%edx
   31834:	0f b6 12             	movzbl (%edx),%edx
   31837:	88 10                	mov    %dl,(%eax)
   31839:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
   3183d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   31841:	8b 45 f4             	mov    -0xc(%ebp),%eax
   31844:	0f b6 00             	movzbl (%eax),%eax
   31847:	84 c0                	test   %al,%al
   31849:	75 e0                	jne    3182b <__vprintf__+0x17a>
   3184b:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
   3184f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   31853:	eb 0e                	jmp    31863 <__vprintf__+0x1b2>
   31855:	8b 45 f8             	mov    -0x8(%ebp),%eax
   31858:	03 45 08             	add    0x8(%ebp),%eax
   3185b:	8b 55 fc             	mov    -0x4(%ebp),%edx
   3185e:	0f b6 12             	movzbl (%edx),%edx
   31861:	88 10                	mov    %dl,(%eax)
   31863:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
   31867:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   3186b:	8b 45 fc             	mov    -0x4(%ebp),%eax
   3186e:	0f b6 00             	movzbl (%eax),%eax
   31871:	84 c0                	test   %al,%al
   31873:	0f 85 80 fe ff ff    	jne    316f9 <__vprintf__+0x48>
   31879:	8b 45 f8             	mov    -0x8(%ebp),%eax
   3187c:	03 45 08             	add    0x8(%ebp),%eax
   3187f:	c6 00 00             	movb   $0x0,(%eax)
   31882:	b8 01 00 00 00       	mov    $0x1,%eax
   31887:	c9                   	leave  
   31888:	c3                   	ret    
