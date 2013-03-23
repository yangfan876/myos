
kernel.bin:     file format elf32-i386


Disassembly of section .text:

00030400 <_start>:
   30400:	bc 01 20 03 00       	mov    $0x32001,%esp
   30405:	0f 01 05 ce 2e 03 00 	sgdtl  0x32ece
   3040c:	e8 4f 00 00 00       	call   30460 <__init__>
   30411:	fb                   	sti    
   30412:	8b 25 d8 2e 03 00    	mov    0x32ed8,%esp
   30418:	8d 44 24 48          	lea    0x48(%esp),%eax
   3041c:	a3 44 2e 03 00       	mov    %eax,0x32e44
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

00030430 <test_idt>:
   30430:	55                   	push   %ebp
   30431:	89 e5                	mov    %esp,%ebp
   30433:	83 ec 18             	sub    $0x18,%esp
   30436:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
   3043d:	00 
   3043e:	c7 04 24 fe 00 00 00 	movl   $0xfe,(%esp)
   30445:	e8 10 04 00 00       	call   3085a <outb_pic>
   3044a:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
   30451:	00 
   30452:	c7 04 24 ff 00 00 00 	movl   $0xff,(%esp)
   30459:	e8 fc 03 00 00       	call   3085a <outb_pic>
   3045e:	c9                   	leave  
   3045f:	c3                   	ret    

00030460 <__init__>:
   30460:	55                   	push   %ebp
   30461:	89 e5                	mov    %esp,%ebp
   30463:	83 ec 28             	sub    $0x28,%esp
   30466:	e8 fd 03 00 00       	call   30868 <change_gdt>
   3046b:	c7 05 04 20 03 00 00 	movl   $0x0,0x32004
   30472:	00 00 00 
   30475:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   3047c:	eb 10                	jmp    3048e <__init__+0x2e>
   3047e:	c7 04 24 a0 14 03 00 	movl   $0x314a0,(%esp)
   30485:	e8 d2 00 00 00       	call   3055c <printk>
   3048a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   3048e:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
   30495:	7e e7                	jle    3047e <__init__+0x1e>
   30497:	c7 05 04 20 03 00 00 	movl   $0x0,0x32004
   3049e:	00 00 00 
   304a1:	c7 04 24 a2 14 03 00 	movl   $0x314a2,(%esp)
   304a8:	e8 af 00 00 00       	call   3055c <printk>
   304ad:	e8 ce 02 00 00       	call   30780 <init_8259A>
   304b2:	c7 04 24 bc 14 03 00 	movl   $0x314bc,(%esp)
   304b9:	e8 9e 00 00 00       	call   3055c <printk>
   304be:	e8 35 05 00 00       	call   309f8 <init_idt>
   304c3:	c7 04 24 d5 14 03 00 	movl   $0x314d5,(%esp)
   304ca:	e8 8d 00 00 00       	call   3055c <printk>
   304cf:	c7 04 24 ec 14 03 00 	movl   $0x314ec,(%esp)
   304d6:	e8 81 00 00 00       	call   3055c <printk>
   304db:	e8 ba 0e 00 00       	call   3139a <init_first_thread>
   304e0:	e8 4b ff ff ff       	call   30430 <test_idt>
   304e5:	c9                   	leave  
   304e6:	c3                   	ret    
   304e7:	90                   	nop
   304e8:	90                   	nop
   304e9:	90                   	nop
   304ea:	90                   	nop
   304eb:	90                   	nop
   304ec:	90                   	nop
   304ed:	90                   	nop
   304ee:	90                   	nop
   304ef:	90                   	nop

000304f0 <disp_str>:
   304f0:	55                   	push   %ebp
   304f1:	89 e5                	mov    %esp,%ebp
   304f3:	8b 75 08             	mov    0x8(%ebp),%esi
   304f6:	8b 3d 04 20 03 00    	mov    0x32004,%edi
   304fc:	b4 0f                	mov    $0xf,%ah

000304fe <disp_str.1>:
   304fe:	ac                   	lods   %ds:(%esi),%al
   304ff:	84 c0                	test   %al,%al
   30501:	74 2f                	je     30532 <disp_str.2>
   30503:	3c 0a                	cmp    $0xa,%al
   30505:	75 16                	jne    3051d <disp_str.3>
   30507:	50                   	push   %eax
   30508:	89 f8                	mov    %edi,%eax
   3050a:	b3 a0                	mov    $0xa0,%bl
   3050c:	f6 f3                	div    %bl
   3050e:	25 ff 00 00 00       	and    $0xff,%eax
   30513:	40                   	inc    %eax
   30514:	b3 a0                	mov    $0xa0,%bl
   30516:	f6 e3                	mul    %bl
   30518:	89 c7                	mov    %eax,%edi
   3051a:	58                   	pop    %eax
   3051b:	eb e1                	jmp    304fe <disp_str.1>

0003051d <disp_str.3>:
   3051d:	81 c7 00 80 0b 00    	add    $0xb8000,%edi
   30523:	65 66 89 07          	mov    %ax,%gs:(%edi)
   30527:	81 ef 00 80 0b 00    	sub    $0xb8000,%edi
   3052d:	83 c7 02             	add    $0x2,%edi
   30530:	eb cc                	jmp    304fe <disp_str.1>

00030532 <disp_str.2>:
   30532:	89 3d 04 20 03 00    	mov    %edi,0x32004
   30538:	5d                   	pop    %ebp
   30539:	c3                   	ret    
   3053a:	90                   	nop
   3053b:	90                   	nop

0003053c <print>:
   3053c:	55                   	push   %ebp
   3053d:	89 e5                	mov    %esp,%ebp
   3053f:	83 ec 18             	sub    $0x18,%esp
   30542:	c7 04 24 93 15 03 00 	movl   $0x31593,(%esp)
   30549:	e8 0e 00 00 00       	call   3055c <printk>
   3054e:	c7 04 24 b1 15 03 00 	movl   $0x315b1,(%esp)
   30555:	e8 02 00 00 00       	call   3055c <printk>
   3055a:	c9                   	leave  
   3055b:	c3                   	ret    

0003055c <printk>:
   3055c:	55                   	push   %ebp
   3055d:	89 e5                	mov    %esp,%ebp
   3055f:	81 ec 28 04 00 00    	sub    $0x428,%esp
   30565:	8d 55 0c             	lea    0xc(%ebp),%edx
   30568:	8d 85 f0 fb ff ff    	lea    -0x410(%ebp),%eax
   3056e:	89 10                	mov    %edx,(%eax)
   30570:	8b 85 f0 fb ff ff    	mov    -0x410(%ebp),%eax
   30576:	89 44 24 08          	mov    %eax,0x8(%esp)
   3057a:	8b 45 08             	mov    0x8(%ebp),%eax
   3057d:	89 44 24 04          	mov    %eax,0x4(%esp)
   30581:	8d 85 f4 fb ff ff    	lea    -0x40c(%ebp),%eax
   30587:	89 04 24             	mov    %eax,(%esp)
   3058a:	e8 16 00 00 00       	call   305a5 <__vprintf__>
   3058f:	89 45 f4             	mov    %eax,-0xc(%ebp)
   30592:	8d 85 f4 fb ff ff    	lea    -0x40c(%ebp),%eax
   30598:	89 04 24             	mov    %eax,(%esp)
   3059b:	e8 50 ff ff ff       	call   304f0 <disp_str>
   305a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
   305a3:	c9                   	leave  
   305a4:	c3                   	ret    

000305a5 <__vprintf__>:
   305a5:	55                   	push   %ebp
   305a6:	89 e5                	mov    %esp,%ebp
   305a8:	83 ec 30             	sub    $0x30,%esp
   305ab:	8b 45 0c             	mov    0xc(%ebp),%eax
   305ae:	89 45 fc             	mov    %eax,-0x4(%ebp)
   305b1:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
   305b8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   305bf:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
   305c6:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
   305cd:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
   305d4:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
   305db:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
   305e2:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
   305e8:	e9 72 01 00 00       	jmp    3075f <__vprintf__+0x1ba>
   305ed:	8b 45 fc             	mov    -0x4(%ebp),%eax
   305f0:	0f b6 00             	movzbl (%eax),%eax
   305f3:	3c 25                	cmp    $0x25,%al
   305f5:	0f 85 4e 01 00 00    	jne    30749 <__vprintf__+0x1a4>
   305fb:	8b 45 fc             	mov    -0x4(%ebp),%eax
   305fe:	83 c0 01             	add    $0x1,%eax
   30601:	0f b6 00             	movzbl (%eax),%eax
   30604:	0f be c0             	movsbl %al,%eax
   30607:	83 f8 64             	cmp    $0x64,%eax
   3060a:	74 3e                	je     3064a <__vprintf__+0xa5>
   3060c:	83 f8 73             	cmp    $0x73,%eax
   3060f:	0f 84 fa 00 00 00    	je     3070f <__vprintf__+0x16a>
   30615:	83 f8 63             	cmp    $0x63,%eax
   30618:	0f 85 39 01 00 00    	jne    30757 <__vprintf__+0x1b2>
   3061e:	8b 45 10             	mov    0x10(%ebp),%eax
   30621:	8d 50 04             	lea    0x4(%eax),%edx
   30624:	89 55 10             	mov    %edx,0x10(%ebp)
   30627:	8b 00                	mov    (%eax),%eax
   30629:	89 45 f0             	mov    %eax,-0x10(%ebp)
   3062c:	8b 45 f8             	mov    -0x8(%ebp),%eax
   3062f:	03 45 08             	add    0x8(%ebp),%eax
   30632:	8b 55 f0             	mov    -0x10(%ebp),%edx
   30635:	8b 14 95 20 20 03 00 	mov    0x32020(,%edx,4),%edx
   3063c:	0f b6 12             	movzbl (%edx),%edx
   3063f:	88 10                	mov    %dl,(%eax)
   30641:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   30645:	e9 0d 01 00 00       	jmp    30757 <__vprintf__+0x1b2>
   3064a:	8b 45 10             	mov    0x10(%ebp),%eax
   3064d:	8d 50 04             	lea    0x4(%eax),%edx
   30650:	89 55 10             	mov    %edx,0x10(%ebp)
   30653:	8b 00                	mov    (%eax),%eax
   30655:	89 45 f0             	mov    %eax,-0x10(%ebp)
   30658:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
   3065f:	8b 4d f0             	mov    -0x10(%ebp),%ecx
   30662:	ba 67 66 66 66       	mov    $0x66666667,%edx
   30667:	89 c8                	mov    %ecx,%eax
   30669:	f7 ea                	imul   %edx
   3066b:	c1 fa 02             	sar    $0x2,%edx
   3066e:	89 c8                	mov    %ecx,%eax
   30670:	c1 f8 1f             	sar    $0x1f,%eax
   30673:	29 c2                	sub    %eax,%edx
   30675:	89 d0                	mov    %edx,%eax
   30677:	c1 e0 02             	shl    $0x2,%eax
   3067a:	01 d0                	add    %edx,%eax
   3067c:	01 c0                	add    %eax,%eax
   3067e:	89 ca                	mov    %ecx,%edx
   30680:	29 c2                	sub    %eax,%edx
   30682:	8d 42 30             	lea    0x30(%edx),%eax
   30685:	8b 04 85 20 20 03 00 	mov    0x32020(,%eax,4),%eax
   3068c:	0f b6 10             	movzbl (%eax),%edx
   3068f:	8d 45 de             	lea    -0x22(%ebp),%eax
   30692:	03 45 ec             	add    -0x14(%ebp),%eax
   30695:	88 10                	mov    %dl,(%eax)
   30697:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
   3069b:	8b 4d f0             	mov    -0x10(%ebp),%ecx
   3069e:	ba 67 66 66 66       	mov    $0x66666667,%edx
   306a3:	89 c8                	mov    %ecx,%eax
   306a5:	f7 ea                	imul   %edx
   306a7:	c1 fa 02             	sar    $0x2,%edx
   306aa:	89 c8                	mov    %ecx,%eax
   306ac:	c1 f8 1f             	sar    $0x1f,%eax
   306af:	89 d1                	mov    %edx,%ecx
   306b1:	29 c1                	sub    %eax,%ecx
   306b3:	89 c8                	mov    %ecx,%eax
   306b5:	89 45 f0             	mov    %eax,-0x10(%ebp)
   306b8:	8b 4d f0             	mov    -0x10(%ebp),%ecx
   306bb:	ba 67 66 66 66       	mov    $0x66666667,%edx
   306c0:	89 c8                	mov    %ecx,%eax
   306c2:	f7 ea                	imul   %edx
   306c4:	c1 fa 02             	sar    $0x2,%edx
   306c7:	89 c8                	mov    %ecx,%eax
   306c9:	c1 f8 1f             	sar    $0x1f,%eax
   306cc:	29 c2                	sub    %eax,%edx
   306ce:	89 d0                	mov    %edx,%eax
   306d0:	c1 e0 02             	shl    $0x2,%eax
   306d3:	01 d0                	add    %edx,%eax
   306d5:	01 c0                	add    %eax,%eax
   306d7:	89 ca                	mov    %ecx,%edx
   306d9:	29 c2                	sub    %eax,%edx
   306db:	85 d2                	test   %edx,%edx
   306dd:	75 80                	jne    3065f <__vprintf__+0xba>
   306df:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
   306e3:	eb 19                	jmp    306fe <__vprintf__+0x159>
   306e5:	8b 45 f8             	mov    -0x8(%ebp),%eax
   306e8:	03 45 08             	add    0x8(%ebp),%eax
   306eb:	8d 55 de             	lea    -0x22(%ebp),%edx
   306ee:	03 55 ec             	add    -0x14(%ebp),%edx
   306f1:	0f b6 12             	movzbl (%edx),%edx
   306f4:	88 10                	mov    %dl,(%eax)
   306f6:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
   306fa:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
   306fe:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
   30702:	79 e1                	jns    306e5 <__vprintf__+0x140>
   30704:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
   30708:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   3070c:	90                   	nop
   3070d:	eb 48                	jmp    30757 <__vprintf__+0x1b2>
   3070f:	8b 45 10             	mov    0x10(%ebp),%eax
   30712:	8d 50 04             	lea    0x4(%eax),%edx
   30715:	89 55 10             	mov    %edx,0x10(%ebp)
   30718:	8b 00                	mov    (%eax),%eax
   3071a:	89 45 f4             	mov    %eax,-0xc(%ebp)
   3071d:	eb 16                	jmp    30735 <__vprintf__+0x190>
   3071f:	8b 45 f8             	mov    -0x8(%ebp),%eax
   30722:	03 45 08             	add    0x8(%ebp),%eax
   30725:	8b 55 f4             	mov    -0xc(%ebp),%edx
   30728:	0f b6 12             	movzbl (%edx),%edx
   3072b:	88 10                	mov    %dl,(%eax)
   3072d:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
   30731:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   30735:	8b 45 f4             	mov    -0xc(%ebp),%eax
   30738:	0f b6 00             	movzbl (%eax),%eax
   3073b:	84 c0                	test   %al,%al
   3073d:	75 e0                	jne    3071f <__vprintf__+0x17a>
   3073f:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
   30743:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   30747:	eb 0e                	jmp    30757 <__vprintf__+0x1b2>
   30749:	8b 45 f8             	mov    -0x8(%ebp),%eax
   3074c:	03 45 08             	add    0x8(%ebp),%eax
   3074f:	8b 55 fc             	mov    -0x4(%ebp),%edx
   30752:	0f b6 12             	movzbl (%edx),%edx
   30755:	88 10                	mov    %dl,(%eax)
   30757:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
   3075b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   3075f:	8b 45 fc             	mov    -0x4(%ebp),%eax
   30762:	0f b6 00             	movzbl (%eax),%eax
   30765:	84 c0                	test   %al,%al
   30767:	0f 85 80 fe ff ff    	jne    305ed <__vprintf__+0x48>
   3076d:	8b 45 f8             	mov    -0x8(%ebp),%eax
   30770:	03 45 08             	add    0x8(%ebp),%eax
   30773:	c6 00 00             	movb   $0x0,(%eax)
   30776:	b8 01 00 00 00       	mov    $0x1,%eax
   3077b:	c9                   	leave  
   3077c:	c3                   	ret    
   3077d:	90                   	nop
   3077e:	90                   	nop
   3077f:	90                   	nop

00030780 <init_8259A>:
   30780:	55                   	push   %ebp
   30781:	89 e5                	mov    %esp,%ebp
   30783:	83 ec 18             	sub    $0x18,%esp
   30786:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
   3078d:	00 
   3078e:	c7 04 24 ff 00 00 00 	movl   $0xff,(%esp)
   30795:	e8 b6 00 00 00       	call   30850 <outb>
   3079a:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
   307a1:	00 
   307a2:	c7 04 24 ff 00 00 00 	movl   $0xff,(%esp)
   307a9:	e8 a2 00 00 00       	call   30850 <outb>
   307ae:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
   307b5:	00 
   307b6:	c7 04 24 11 00 00 00 	movl   $0x11,(%esp)
   307bd:	e8 98 00 00 00       	call   3085a <outb_pic>
   307c2:	c7 44 24 04 a0 00 00 	movl   $0xa0,0x4(%esp)
   307c9:	00 
   307ca:	c7 04 24 11 00 00 00 	movl   $0x11,(%esp)
   307d1:	e8 84 00 00 00       	call   3085a <outb_pic>
   307d6:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
   307dd:	00 
   307de:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
   307e5:	e8 70 00 00 00       	call   3085a <outb_pic>
   307ea:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
   307f1:	00 
   307f2:	c7 04 24 28 00 00 00 	movl   $0x28,(%esp)
   307f9:	e8 5c 00 00 00       	call   3085a <outb_pic>
   307fe:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
   30805:	00 
   30806:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
   3080d:	e8 48 00 00 00       	call   3085a <outb_pic>
   30812:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
   30819:	00 
   3081a:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
   30821:	e8 34 00 00 00       	call   3085a <outb_pic>
   30826:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
   3082d:	00 
   3082e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
   30835:	e8 20 00 00 00       	call   3085a <outb_pic>
   3083a:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
   30841:	00 
   30842:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
   30849:	e8 0c 00 00 00       	call   3085a <outb_pic>
   3084e:	c9                   	leave  
   3084f:	c3                   	ret    

00030850 <outb>:
   30850:	8b 44 24 04          	mov    0x4(%esp),%eax
   30854:	8b 54 24 08          	mov    0x8(%esp),%edx
   30858:	ee                   	out    %al,(%dx)
   30859:	c3                   	ret    

0003085a <outb_pic>:
   3085a:	8b 44 24 04          	mov    0x4(%esp),%eax
   3085e:	8b 54 24 08          	mov    0x8(%esp),%edx
   30862:	ee                   	out    %al,(%dx)
   30863:	90                   	nop
   30864:	90                   	nop
   30865:	c3                   	ret    
   30866:	90                   	nop
   30867:	90                   	nop

00030868 <change_gdt>:
   30868:	55                   	push   %ebp
   30869:	89 e5                	mov    %esp,%ebp
   3086b:	83 ec 18             	sub    $0x18,%esp
   3086e:	66 c7 05 40 22 03 00 	movw   $0x0,0x32240
   30875:	00 00 
   30877:	66 c7 05 42 22 03 00 	movw   $0x0,0x32242
   3087e:	00 00 
   30880:	c6 05 44 22 03 00 00 	movb   $0x0,0x32244
   30887:	c6 05 45 22 03 00 00 	movb   $0x0,0x32245
   3088e:	c6 05 46 22 03 00 00 	movb   $0x0,0x32246
   30895:	c6 05 47 22 03 00 00 	movb   $0x0,0x32247
   3089c:	66 c7 05 a0 22 03 00 	movw   $0xffff,0x322a0
   308a3:	ff ff 
   308a5:	66 c7 05 a2 22 03 00 	movw   $0x0,0x322a2
   308ac:	00 00 
   308ae:	c6 05 a4 22 03 00 00 	movb   $0x0,0x322a4
   308b5:	c6 05 a5 22 03 00 9a 	movb   $0x9a,0x322a5
   308bc:	c6 05 a6 22 03 00 cf 	movb   $0xcf,0x322a6
   308c3:	c6 05 a7 22 03 00 00 	movb   $0x0,0x322a7
   308ca:	66 c7 05 a8 22 03 00 	movw   $0xffff,0x322a8
   308d1:	ff ff 
   308d3:	66 c7 05 aa 22 03 00 	movw   $0x0,0x322aa
   308da:	00 00 
   308dc:	c6 05 ac 22 03 00 00 	movb   $0x0,0x322ac
   308e3:	c6 05 ad 22 03 00 93 	movb   $0x93,0x322ad
   308ea:	c6 05 ae 22 03 00 cf 	movb   $0xcf,0x322ae
   308f1:	c6 05 af 22 03 00 00 	movb   $0x0,0x322af
   308f8:	66 c7 05 b0 22 03 00 	movw   $0xffff,0x322b0
   308ff:	ff ff 
   30901:	66 c7 05 b2 22 03 00 	movw   $0x0,0x322b2
   30908:	00 00 
   3090a:	c6 05 b4 22 03 00 00 	movb   $0x0,0x322b4
   30911:	c6 05 b5 22 03 00 fa 	movb   $0xfa,0x322b5
   30918:	c6 05 b6 22 03 00 cf 	movb   $0xcf,0x322b6
   3091f:	c6 05 b7 22 03 00 00 	movb   $0x0,0x322b7
   30926:	66 c7 05 b8 22 03 00 	movw   $0xffff,0x322b8
   3092d:	ff ff 
   3092f:	66 c7 05 ba 22 03 00 	movw   $0x0,0x322ba
   30936:	00 00 
   30938:	c6 05 bc 22 03 00 00 	movb   $0x0,0x322bc
   3093f:	c6 05 bd 22 03 00 f3 	movb   $0xf3,0x322bd
   30946:	c6 05 be 22 03 00 cf 	movb   $0xcf,0x322be
   3094d:	c6 05 bf 22 03 00 00 	movb   $0x0,0x322bf
   30954:	66 c7 05 b8 22 03 00 	movw   $0xffff,0x322b8
   3095b:	ff ff 
   3095d:	66 c7 05 ba 22 03 00 	movw   $0x0,0x322ba
   30964:	00 00 
   30966:	c6 05 bc 22 03 00 00 	movb   $0x0,0x322bc
   3096d:	c6 05 bd 22 03 00 f3 	movb   $0xf3,0x322bd
   30974:	c6 05 be 22 03 00 cf 	movb   $0xcf,0x322be
   3097b:	c6 05 bf 22 03 00 00 	movb   $0x0,0x322bf
   30982:	c7 05 48 2e 03 00 68 	movl   $0x68,0x32e48
   30989:	00 00 00 
   3098c:	66 c7 05 a6 2e 03 00 	movw   $0x68,0x32ea6
   30993:	68 00 
   30995:	66 c7 05 c0 22 03 00 	movw   $0x67,0x322c0
   3099c:	67 00 
   3099e:	b8 40 2e 03 00       	mov    $0x32e40,%eax
   309a3:	66 a3 c2 22 03 00    	mov    %ax,0x322c2
   309a9:	b8 40 2e 03 00       	mov    $0x32e40,%eax
   309ae:	c1 e8 10             	shr    $0x10,%eax
   309b1:	a2 c4 22 03 00       	mov    %al,0x322c4
   309b6:	c6 05 c5 22 03 00 89 	movb   $0x89,0x322c5
   309bd:	c6 05 c6 22 03 00 00 	movb   $0x0,0x322c6
   309c4:	b8 40 2e 03 00       	mov    $0x32e40,%eax
   309c9:	c1 e8 18             	shr    $0x18,%eax
   309cc:	a2 c7 22 03 00       	mov    %al,0x322c7
   309d1:	c7 45 f4 ce 2e 03 00 	movl   $0x32ece,-0xc(%ebp)
   309d8:	c7 45 f0 d0 2e 03 00 	movl   $0x32ed0,-0x10(%ebp)
   309df:	8b 45 f4             	mov    -0xc(%ebp),%eax
   309e2:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
   309e7:	ba 40 22 03 00       	mov    $0x32240,%edx
   309ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
   309ef:	89 10                	mov    %edx,(%eax)
   309f1:	e8 fa 06 00 00       	call   310f0 <jump_new_gdt>
   309f6:	c9                   	leave  
   309f7:	c3                   	ret    

000309f8 <init_idt>:
   309f8:	55                   	push   %ebp
   309f9:	89 e5                	mov    %esp,%ebp
   309fb:	83 ec 18             	sub    $0x18,%esp
   309fe:	b8 1b 12 03 00       	mov    $0x3121b,%eax
   30a03:	66 a3 40 26 03 00    	mov    %ax,0x32640
   30a09:	66 c7 05 42 26 03 00 	movw   $0x60,0x32642
   30a10:	60 00 
   30a12:	c6 05 44 26 03 00 00 	movb   $0x0,0x32644
   30a19:	c6 05 45 26 03 00 8e 	movb   $0x8e,0x32645
   30a20:	b8 1b 12 03 00       	mov    $0x3121b,%eax
   30a25:	c1 e8 10             	shr    $0x10,%eax
   30a28:	66 a3 46 26 03 00    	mov    %ax,0x32646
   30a2e:	b8 21 12 03 00       	mov    $0x31221,%eax
   30a33:	66 a3 48 26 03 00    	mov    %ax,0x32648
   30a39:	66 c7 05 4a 26 03 00 	movw   $0x60,0x3264a
   30a40:	60 00 
   30a42:	c6 05 4c 26 03 00 00 	movb   $0x0,0x3264c
   30a49:	c6 05 4d 26 03 00 8e 	movb   $0x8e,0x3264d
   30a50:	b8 21 12 03 00       	mov    $0x31221,%eax
   30a55:	c1 e8 10             	shr    $0x10,%eax
   30a58:	66 a3 4e 26 03 00    	mov    %ax,0x3264e
   30a5e:	b8 27 12 03 00       	mov    $0x31227,%eax
   30a63:	66 a3 50 26 03 00    	mov    %ax,0x32650
   30a69:	66 c7 05 52 26 03 00 	movw   $0x60,0x32652
   30a70:	60 00 
   30a72:	c6 05 54 26 03 00 00 	movb   $0x0,0x32654
   30a79:	c6 05 55 26 03 00 8e 	movb   $0x8e,0x32655
   30a80:	b8 27 12 03 00       	mov    $0x31227,%eax
   30a85:	c1 e8 10             	shr    $0x10,%eax
   30a88:	66 a3 56 26 03 00    	mov    %ax,0x32656
   30a8e:	b8 2d 12 03 00       	mov    $0x3122d,%eax
   30a93:	66 a3 58 26 03 00    	mov    %ax,0x32658
   30a99:	66 c7 05 5a 26 03 00 	movw   $0x60,0x3265a
   30aa0:	60 00 
   30aa2:	c6 05 5c 26 03 00 00 	movb   $0x0,0x3265c
   30aa9:	c6 05 5d 26 03 00 8e 	movb   $0x8e,0x3265d
   30ab0:	b8 2d 12 03 00       	mov    $0x3122d,%eax
   30ab5:	c1 e8 10             	shr    $0x10,%eax
   30ab8:	66 a3 5e 26 03 00    	mov    %ax,0x3265e
   30abe:	b8 33 12 03 00       	mov    $0x31233,%eax
   30ac3:	66 a3 60 26 03 00    	mov    %ax,0x32660
   30ac9:	66 c7 05 62 26 03 00 	movw   $0x60,0x32662
   30ad0:	60 00 
   30ad2:	c6 05 64 26 03 00 00 	movb   $0x0,0x32664
   30ad9:	c6 05 65 26 03 00 8e 	movb   $0x8e,0x32665
   30ae0:	b8 33 12 03 00       	mov    $0x31233,%eax
   30ae5:	c1 e8 10             	shr    $0x10,%eax
   30ae8:	66 a3 66 26 03 00    	mov    %ax,0x32666
   30aee:	b8 39 12 03 00       	mov    $0x31239,%eax
   30af3:	66 a3 68 26 03 00    	mov    %ax,0x32668
   30af9:	66 c7 05 6a 26 03 00 	movw   $0x60,0x3266a
   30b00:	60 00 
   30b02:	c6 05 6c 26 03 00 00 	movb   $0x0,0x3266c
   30b09:	c6 05 6d 26 03 00 8e 	movb   $0x8e,0x3266d
   30b10:	b8 39 12 03 00       	mov    $0x31239,%eax
   30b15:	c1 e8 10             	shr    $0x10,%eax
   30b18:	66 a3 6e 26 03 00    	mov    %ax,0x3266e
   30b1e:	b8 3f 12 03 00       	mov    $0x3123f,%eax
   30b23:	66 a3 70 26 03 00    	mov    %ax,0x32670
   30b29:	66 c7 05 72 26 03 00 	movw   $0x60,0x32672
   30b30:	60 00 
   30b32:	c6 05 74 26 03 00 00 	movb   $0x0,0x32674
   30b39:	c6 05 75 26 03 00 8e 	movb   $0x8e,0x32675
   30b40:	b8 3f 12 03 00       	mov    $0x3123f,%eax
   30b45:	c1 e8 10             	shr    $0x10,%eax
   30b48:	66 a3 76 26 03 00    	mov    %ax,0x32676
   30b4e:	b8 45 12 03 00       	mov    $0x31245,%eax
   30b53:	66 a3 78 26 03 00    	mov    %ax,0x32678
   30b59:	66 c7 05 7a 26 03 00 	movw   $0x60,0x3267a
   30b60:	60 00 
   30b62:	c6 05 7c 26 03 00 00 	movb   $0x0,0x3267c
   30b69:	c6 05 7d 26 03 00 8e 	movb   $0x8e,0x3267d
   30b70:	b8 45 12 03 00       	mov    $0x31245,%eax
   30b75:	c1 e8 10             	shr    $0x10,%eax
   30b78:	66 a3 7e 26 03 00    	mov    %ax,0x3267e
   30b7e:	b8 4b 12 03 00       	mov    $0x3124b,%eax
   30b83:	66 a3 80 26 03 00    	mov    %ax,0x32680
   30b89:	66 c7 05 82 26 03 00 	movw   $0x60,0x32682
   30b90:	60 00 
   30b92:	c6 05 84 26 03 00 00 	movb   $0x0,0x32684
   30b99:	c6 05 85 26 03 00 8e 	movb   $0x8e,0x32685
   30ba0:	b8 4b 12 03 00       	mov    $0x3124b,%eax
   30ba5:	c1 e8 10             	shr    $0x10,%eax
   30ba8:	66 a3 86 26 03 00    	mov    %ax,0x32686
   30bae:	b8 4f 12 03 00       	mov    $0x3124f,%eax
   30bb3:	66 a3 88 26 03 00    	mov    %ax,0x32688
   30bb9:	66 c7 05 8a 26 03 00 	movw   $0x60,0x3268a
   30bc0:	60 00 
   30bc2:	c6 05 8c 26 03 00 00 	movb   $0x0,0x3268c
   30bc9:	c6 05 8d 26 03 00 8e 	movb   $0x8e,0x3268d
   30bd0:	b8 4f 12 03 00       	mov    $0x3124f,%eax
   30bd5:	c1 e8 10             	shr    $0x10,%eax
   30bd8:	66 a3 8e 26 03 00    	mov    %ax,0x3268e
   30bde:	b8 55 12 03 00       	mov    $0x31255,%eax
   30be3:	66 a3 90 26 03 00    	mov    %ax,0x32690
   30be9:	66 c7 05 92 26 03 00 	movw   $0x60,0x32692
   30bf0:	60 00 
   30bf2:	c6 05 94 26 03 00 00 	movb   $0x0,0x32694
   30bf9:	c6 05 95 26 03 00 8e 	movb   $0x8e,0x32695
   30c00:	b8 55 12 03 00       	mov    $0x31255,%eax
   30c05:	c1 e8 10             	shr    $0x10,%eax
   30c08:	66 a3 96 26 03 00    	mov    %ax,0x32696
   30c0e:	b8 59 12 03 00       	mov    $0x31259,%eax
   30c13:	66 a3 98 26 03 00    	mov    %ax,0x32698
   30c19:	66 c7 05 9a 26 03 00 	movw   $0x60,0x3269a
   30c20:	60 00 
   30c22:	c6 05 9c 26 03 00 00 	movb   $0x0,0x3269c
   30c29:	c6 05 9d 26 03 00 8e 	movb   $0x8e,0x3269d
   30c30:	b8 59 12 03 00       	mov    $0x31259,%eax
   30c35:	c1 e8 10             	shr    $0x10,%eax
   30c38:	66 a3 9e 26 03 00    	mov    %ax,0x3269e
   30c3e:	b8 5d 12 03 00       	mov    $0x3125d,%eax
   30c43:	66 a3 a0 26 03 00    	mov    %ax,0x326a0
   30c49:	66 c7 05 a2 26 03 00 	movw   $0x60,0x326a2
   30c50:	60 00 
   30c52:	c6 05 a4 26 03 00 00 	movb   $0x0,0x326a4
   30c59:	c6 05 a5 26 03 00 8e 	movb   $0x8e,0x326a5
   30c60:	b8 5d 12 03 00       	mov    $0x3125d,%eax
   30c65:	c1 e8 10             	shr    $0x10,%eax
   30c68:	66 a3 a6 26 03 00    	mov    %ax,0x326a6
   30c6e:	b8 61 12 03 00       	mov    $0x31261,%eax
   30c73:	66 a3 a8 26 03 00    	mov    %ax,0x326a8
   30c79:	66 c7 05 aa 26 03 00 	movw   $0x60,0x326aa
   30c80:	60 00 
   30c82:	c6 05 ac 26 03 00 00 	movb   $0x0,0x326ac
   30c89:	c6 05 ad 26 03 00 8e 	movb   $0x8e,0x326ad
   30c90:	b8 61 12 03 00       	mov    $0x31261,%eax
   30c95:	c1 e8 10             	shr    $0x10,%eax
   30c98:	66 a3 ae 26 03 00    	mov    %ax,0x326ae
   30c9e:	b8 65 12 03 00       	mov    $0x31265,%eax
   30ca3:	66 a3 b0 26 03 00    	mov    %ax,0x326b0
   30ca9:	66 c7 05 b2 26 03 00 	movw   $0x60,0x326b2
   30cb0:	60 00 
   30cb2:	c6 05 b4 26 03 00 00 	movb   $0x0,0x326b4
   30cb9:	c6 05 b5 26 03 00 8e 	movb   $0x8e,0x326b5
   30cc0:	b8 65 12 03 00       	mov    $0x31265,%eax
   30cc5:	c1 e8 10             	shr    $0x10,%eax
   30cc8:	66 a3 b6 26 03 00    	mov    %ax,0x326b6
   30cce:	b8 69 12 03 00       	mov    $0x31269,%eax
   30cd3:	66 a3 c0 26 03 00    	mov    %ax,0x326c0
   30cd9:	66 c7 05 c2 26 03 00 	movw   $0x60,0x326c2
   30ce0:	60 00 
   30ce2:	c6 05 c4 26 03 00 00 	movb   $0x0,0x326c4
   30ce9:	c6 05 c5 26 03 00 8e 	movb   $0x8e,0x326c5
   30cf0:	b8 69 12 03 00       	mov    $0x31269,%eax
   30cf5:	c1 e8 10             	shr    $0x10,%eax
   30cf8:	66 a3 c6 26 03 00    	mov    %ax,0x326c6
   30cfe:	b8 20 11 03 00       	mov    $0x31120,%eax
   30d03:	66 a3 40 27 03 00    	mov    %ax,0x32740
   30d09:	66 c7 05 42 27 03 00 	movw   $0x60,0x32742
   30d10:	60 00 
   30d12:	c6 05 44 27 03 00 00 	movb   $0x0,0x32744
   30d19:	c6 05 45 27 03 00 8e 	movb   $0x8e,0x32745
   30d20:	b8 20 11 03 00       	mov    $0x31120,%eax
   30d25:	c1 e8 10             	shr    $0x10,%eax
   30d28:	66 a3 46 27 03 00    	mov    %ax,0x32746
   30d2e:	b8 30 11 03 00       	mov    $0x31130,%eax
   30d33:	66 a3 48 27 03 00    	mov    %ax,0x32748
   30d39:	66 c7 05 4a 27 03 00 	movw   $0x60,0x3274a
   30d40:	60 00 
   30d42:	c6 05 4c 27 03 00 00 	movb   $0x0,0x3274c
   30d49:	c6 05 4d 27 03 00 8e 	movb   $0x8e,0x3274d
   30d50:	b8 30 11 03 00       	mov    $0x31130,%eax
   30d55:	c1 e8 10             	shr    $0x10,%eax
   30d58:	66 a3 4e 27 03 00    	mov    %ax,0x3274e
   30d5e:	b8 40 11 03 00       	mov    $0x31140,%eax
   30d63:	66 a3 50 27 03 00    	mov    %ax,0x32750
   30d69:	66 c7 05 52 27 03 00 	movw   $0x60,0x32752
   30d70:	60 00 
   30d72:	c6 05 54 27 03 00 00 	movb   $0x0,0x32754
   30d79:	c6 05 55 27 03 00 8e 	movb   $0x8e,0x32755
   30d80:	b8 40 11 03 00       	mov    $0x31140,%eax
   30d85:	c1 e8 10             	shr    $0x10,%eax
   30d88:	66 a3 56 27 03 00    	mov    %ax,0x32756
   30d8e:	b8 50 11 03 00       	mov    $0x31150,%eax
   30d93:	66 a3 58 27 03 00    	mov    %ax,0x32758
   30d99:	66 c7 05 5a 27 03 00 	movw   $0x60,0x3275a
   30da0:	60 00 
   30da2:	c6 05 5c 27 03 00 00 	movb   $0x0,0x3275c
   30da9:	c6 05 5d 27 03 00 8e 	movb   $0x8e,0x3275d
   30db0:	b8 50 11 03 00       	mov    $0x31150,%eax
   30db5:	c1 e8 10             	shr    $0x10,%eax
   30db8:	66 a3 5e 27 03 00    	mov    %ax,0x3275e
   30dbe:	b8 60 11 03 00       	mov    $0x31160,%eax
   30dc3:	66 a3 60 27 03 00    	mov    %ax,0x32760
   30dc9:	66 c7 05 62 27 03 00 	movw   $0x60,0x32762
   30dd0:	60 00 
   30dd2:	c6 05 64 27 03 00 00 	movb   $0x0,0x32764
   30dd9:	c6 05 65 27 03 00 8e 	movb   $0x8e,0x32765
   30de0:	b8 60 11 03 00       	mov    $0x31160,%eax
   30de5:	c1 e8 10             	shr    $0x10,%eax
   30de8:	66 a3 66 27 03 00    	mov    %ax,0x32766
   30dee:	b8 70 11 03 00       	mov    $0x31170,%eax
   30df3:	66 a3 68 27 03 00    	mov    %ax,0x32768
   30df9:	66 c7 05 6a 27 03 00 	movw   $0x60,0x3276a
   30e00:	60 00 
   30e02:	c6 05 6c 27 03 00 00 	movb   $0x0,0x3276c
   30e09:	c6 05 6d 27 03 00 8e 	movb   $0x8e,0x3276d
   30e10:	b8 70 11 03 00       	mov    $0x31170,%eax
   30e15:	c1 e8 10             	shr    $0x10,%eax
   30e18:	66 a3 6e 27 03 00    	mov    %ax,0x3276e
   30e1e:	b8 80 11 03 00       	mov    $0x31180,%eax
   30e23:	66 a3 70 27 03 00    	mov    %ax,0x32770
   30e29:	66 c7 05 72 27 03 00 	movw   $0x60,0x32772
   30e30:	60 00 
   30e32:	c6 05 74 27 03 00 00 	movb   $0x0,0x32774
   30e39:	c6 05 75 27 03 00 8e 	movb   $0x8e,0x32775
   30e40:	b8 80 11 03 00       	mov    $0x31180,%eax
   30e45:	c1 e8 10             	shr    $0x10,%eax
   30e48:	66 a3 76 27 03 00    	mov    %ax,0x32776
   30e4e:	b8 90 11 03 00       	mov    $0x31190,%eax
   30e53:	66 a3 78 27 03 00    	mov    %ax,0x32778
   30e59:	66 c7 05 7a 27 03 00 	movw   $0x60,0x3277a
   30e60:	60 00 
   30e62:	c6 05 7c 27 03 00 00 	movb   $0x0,0x3277c
   30e69:	c6 05 7d 27 03 00 8e 	movb   $0x8e,0x3277d
   30e70:	b8 90 11 03 00       	mov    $0x31190,%eax
   30e75:	c1 e8 10             	shr    $0x10,%eax
   30e78:	66 a3 7e 27 03 00    	mov    %ax,0x3277e
   30e7e:	b8 a0 11 03 00       	mov    $0x311a0,%eax
   30e83:	66 a3 80 27 03 00    	mov    %ax,0x32780
   30e89:	66 c7 05 82 27 03 00 	movw   $0x60,0x32782
   30e90:	60 00 
   30e92:	c6 05 84 27 03 00 00 	movb   $0x0,0x32784
   30e99:	c6 05 85 27 03 00 8e 	movb   $0x8e,0x32785
   30ea0:	b8 a0 11 03 00       	mov    $0x311a0,%eax
   30ea5:	c1 e8 10             	shr    $0x10,%eax
   30ea8:	66 a3 86 27 03 00    	mov    %ax,0x32786
   30eae:	b8 b0 11 03 00       	mov    $0x311b0,%eax
   30eb3:	66 a3 88 27 03 00    	mov    %ax,0x32788
   30eb9:	66 c7 05 8a 27 03 00 	movw   $0x60,0x3278a
   30ec0:	60 00 
   30ec2:	c6 05 8c 27 03 00 00 	movb   $0x0,0x3278c
   30ec9:	c6 05 8d 27 03 00 8e 	movb   $0x8e,0x3278d
   30ed0:	b8 b0 11 03 00       	mov    $0x311b0,%eax
   30ed5:	c1 e8 10             	shr    $0x10,%eax
   30ed8:	66 a3 8e 27 03 00    	mov    %ax,0x3278e
   30ede:	b8 c0 11 03 00       	mov    $0x311c0,%eax
   30ee3:	66 a3 90 27 03 00    	mov    %ax,0x32790
   30ee9:	66 c7 05 92 27 03 00 	movw   $0x60,0x32792
   30ef0:	60 00 
   30ef2:	c6 05 94 27 03 00 00 	movb   $0x0,0x32794
   30ef9:	c6 05 95 27 03 00 8e 	movb   $0x8e,0x32795
   30f00:	b8 c0 11 03 00       	mov    $0x311c0,%eax
   30f05:	c1 e8 10             	shr    $0x10,%eax
   30f08:	66 a3 96 27 03 00    	mov    %ax,0x32796
   30f0e:	b8 d0 11 03 00       	mov    $0x311d0,%eax
   30f13:	66 a3 98 27 03 00    	mov    %ax,0x32798
   30f19:	66 c7 05 9a 27 03 00 	movw   $0x60,0x3279a
   30f20:	60 00 
   30f22:	c6 05 9c 27 03 00 00 	movb   $0x0,0x3279c
   30f29:	c6 05 9d 27 03 00 8e 	movb   $0x8e,0x3279d
   30f30:	b8 d0 11 03 00       	mov    $0x311d0,%eax
   30f35:	c1 e8 10             	shr    $0x10,%eax
   30f38:	66 a3 9e 27 03 00    	mov    %ax,0x3279e
   30f3e:	b8 e0 11 03 00       	mov    $0x311e0,%eax
   30f43:	66 a3 a0 27 03 00    	mov    %ax,0x327a0
   30f49:	66 c7 05 a2 27 03 00 	movw   $0x60,0x327a2
   30f50:	60 00 
   30f52:	c6 05 a4 27 03 00 00 	movb   $0x0,0x327a4
   30f59:	c6 05 a5 27 03 00 8e 	movb   $0x8e,0x327a5
   30f60:	b8 e0 11 03 00       	mov    $0x311e0,%eax
   30f65:	c1 e8 10             	shr    $0x10,%eax
   30f68:	66 a3 a6 27 03 00    	mov    %ax,0x327a6
   30f6e:	b8 f0 11 03 00       	mov    $0x311f0,%eax
   30f73:	66 a3 a8 27 03 00    	mov    %ax,0x327a8
   30f79:	66 c7 05 aa 27 03 00 	movw   $0x60,0x327aa
   30f80:	60 00 
   30f82:	c6 05 ac 27 03 00 00 	movb   $0x0,0x327ac
   30f89:	c6 05 ad 27 03 00 8e 	movb   $0x8e,0x327ad
   30f90:	b8 f0 11 03 00       	mov    $0x311f0,%eax
   30f95:	c1 e8 10             	shr    $0x10,%eax
   30f98:	66 a3 ae 27 03 00    	mov    %ax,0x327ae
   30f9e:	b8 00 12 03 00       	mov    $0x31200,%eax
   30fa3:	66 a3 b0 27 03 00    	mov    %ax,0x327b0
   30fa9:	66 c7 05 b2 27 03 00 	movw   $0x60,0x327b2
   30fb0:	60 00 
   30fb2:	c6 05 b4 27 03 00 00 	movb   $0x0,0x327b4
   30fb9:	c6 05 b5 27 03 00 8e 	movb   $0x8e,0x327b5
   30fc0:	b8 00 12 03 00       	mov    $0x31200,%eax
   30fc5:	c1 e8 10             	shr    $0x10,%eax
   30fc8:	66 a3 b6 27 03 00    	mov    %ax,0x327b6
   30fce:	b8 10 12 03 00       	mov    $0x31210,%eax
   30fd3:	66 a3 b8 27 03 00    	mov    %ax,0x327b8
   30fd9:	66 c7 05 ba 27 03 00 	movw   $0x60,0x327ba
   30fe0:	60 00 
   30fe2:	c6 05 bc 27 03 00 00 	movb   $0x0,0x327bc
   30fe9:	c6 05 bd 27 03 00 8e 	movb   $0x8e,0x327bd
   30ff0:	b8 10 12 03 00       	mov    $0x31210,%eax
   30ff5:	c1 e8 10             	shr    $0x10,%eax
   30ff8:	66 a3 be 27 03 00    	mov    %ax,0x327be
   30ffe:	c7 45 f4 c8 2e 03 00 	movl   $0x32ec8,-0xc(%ebp)
   31005:	c7 45 f0 ca 2e 03 00 	movl   $0x32eca,-0x10(%ebp)
   3100c:	8b 45 f4             	mov    -0xc(%ebp),%eax
   3100f:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
   31014:	ba 40 26 03 00       	mov    $0x32640,%edx
   31019:	8b 45 f0             	mov    -0x10(%ebp),%eax
   3101c:	89 10                	mov    %edx,(%eax)
   3101e:	e8 f4 00 00 00       	call   31117 <load_idt>
   31023:	c9                   	leave  
   31024:	c3                   	ret    

00031025 <int_handler>:
   31025:	55                   	push   %ebp
   31026:	89 e5                	mov    %esp,%ebp
   31028:	83 ec 18             	sub    $0x18,%esp
   3102b:	8b 45 08             	mov    0x8(%ebp),%eax
   3102e:	89 44 24 04          	mov    %eax,0x4(%esp)
   31032:	c7 04 24 e0 15 03 00 	movl   $0x315e0,(%esp)
   31039:	e8 1e f5 ff ff       	call   3055c <printk>
   3103e:	c9                   	leave  
   3103f:	c3                   	ret    

00031040 <exception_handler>:
   31040:	55                   	push   %ebp
   31041:	89 e5                	mov    %esp,%ebp
   31043:	57                   	push   %edi
   31044:	56                   	push   %esi
   31045:	53                   	push   %ebx
   31046:	83 ec 7c             	sub    $0x7c,%esp
   31049:	8d 55 94             	lea    -0x6c(%ebp),%edx
   3104c:	bb a0 16 03 00       	mov    $0x316a0,%ebx
   31051:	b8 14 00 00 00       	mov    $0x14,%eax
   31056:	89 d7                	mov    %edx,%edi
   31058:	89 de                	mov    %ebx,%esi
   3105a:	89 c1                	mov    %eax,%ecx
   3105c:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
   3105e:	c7 05 04 20 03 00 00 	movl   $0x0,0x32004
   31065:	00 00 00 
   31068:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
   3106f:	eb 10                	jmp    31081 <exception_handler+0x41>
   31071:	c7 04 24 f6 15 03 00 	movl   $0x315f6,(%esp)
   31078:	e8 df f4 ff ff       	call   3055c <printk>
   3107d:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
   31081:	81 7d e4 8f 01 00 00 	cmpl   $0x18f,-0x1c(%ebp)
   31088:	7e e7                	jle    31071 <exception_handler+0x31>
   3108a:	c7 05 04 20 03 00 00 	movl   $0x0,0x32004
   31091:	00 00 00 
   31094:	8b 45 08             	mov    0x8(%ebp),%eax
   31097:	8b 44 85 94          	mov    -0x6c(%ebp,%eax,4),%eax
   3109b:	89 44 24 04          	mov    %eax,0x4(%esp)
   3109f:	c7 04 24 f8 15 03 00 	movl   $0x315f8,(%esp)
   310a6:	e8 b1 f4 ff ff       	call   3055c <printk>
   310ab:	8b 45 18             	mov    0x18(%ebp),%eax
   310ae:	89 44 24 0c          	mov    %eax,0xc(%esp)
   310b2:	8b 45 14             	mov    0x14(%ebp),%eax
   310b5:	89 44 24 08          	mov    %eax,0x8(%esp)
   310b9:	8b 45 10             	mov    0x10(%ebp),%eax
   310bc:	89 44 24 04          	mov    %eax,0x4(%esp)
   310c0:	c7 04 24 07 16 03 00 	movl   $0x31607,(%esp)
   310c7:	e8 90 f4 ff ff       	call   3055c <printk>
   310cc:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
   310d0:	74 13                	je     310e5 <exception_handler+0xa5>
   310d2:	8b 45 0c             	mov    0xc(%ebp),%eax
   310d5:	89 44 24 04          	mov    %eax,0x4(%esp)
   310d9:	c7 04 24 23 16 03 00 	movl   $0x31623,(%esp)
   310e0:	e8 77 f4 ff ff       	call   3055c <printk>
   310e5:	83 c4 7c             	add    $0x7c,%esp
   310e8:	5b                   	pop    %ebx
   310e9:	5e                   	pop    %esi
   310ea:	5f                   	pop    %edi
   310eb:	5d                   	pop    %ebp
   310ec:	c3                   	ret    
   310ed:	90                   	nop
   310ee:	90                   	nop
   310ef:	90                   	nop

000310f0 <jump_new_gdt>:
   310f0:	0f 01 15 ce 2e 03 00 	lgdtl  0x32ece
   310f7:	66 b8 68 00          	mov    $0x68,%ax
   310fb:	8e d8                	mov    %eax,%ds
   310fd:	8e c0                	mov    %eax,%es
   310ff:	8e d0                	mov    %eax,%ss
   31101:	8e e0                	mov    %eax,%fs
   31103:	8e e8                	mov    %eax,%gs
   31105:	31 c0                	xor    %eax,%eax
   31107:	66 b8 80 00          	mov    $0x80,%ax
   3110b:	0f 00 d8             	ltr    %ax
   3110e:	ea 16 11 03 00 60 00 	ljmp   $0x60,$0x31116
   31115:	c3                   	ret    

00031116 <use_new_gdt>:
   31116:	c3                   	ret    

00031117 <load_idt>:
   31117:	0f 01 1d c8 2e 03 00 	lidtl  0x32ec8
   3111e:	c3                   	ret    
   3111f:	90                   	nop

00031120 <hwint00>:
   31120:	65 fe 05 00 80 0b 00 	incb   %gs:0xb8000
   31127:	b0 20                	mov    $0x20,%al
   31129:	cf                   	iret   
   3112a:	90                   	nop
   3112b:	90                   	nop
   3112c:	90                   	nop
   3112d:	90                   	nop
   3112e:	90                   	nop
   3112f:	90                   	nop

00031130 <hwint01>:
   31130:	6a 01                	push   $0x1
   31132:	e8 ee fe ff ff       	call   31025 <int_handler>
   31137:	83 c4 04             	add    $0x4,%esp
   3113a:	f4                   	hlt    
   3113b:	90                   	nop
   3113c:	90                   	nop
   3113d:	90                   	nop
   3113e:	90                   	nop
   3113f:	90                   	nop

00031140 <hwint02>:
   31140:	6a 02                	push   $0x2
   31142:	e8 de fe ff ff       	call   31025 <int_handler>
   31147:	83 c4 04             	add    $0x4,%esp
   3114a:	f4                   	hlt    
   3114b:	90                   	nop
   3114c:	90                   	nop
   3114d:	90                   	nop
   3114e:	90                   	nop
   3114f:	90                   	nop

00031150 <hwint03>:
   31150:	6a 03                	push   $0x3
   31152:	e8 ce fe ff ff       	call   31025 <int_handler>
   31157:	83 c4 04             	add    $0x4,%esp
   3115a:	f4                   	hlt    
   3115b:	90                   	nop
   3115c:	90                   	nop
   3115d:	90                   	nop
   3115e:	90                   	nop
   3115f:	90                   	nop

00031160 <hwint04>:
   31160:	6a 04                	push   $0x4
   31162:	e8 be fe ff ff       	call   31025 <int_handler>
   31167:	83 c4 04             	add    $0x4,%esp
   3116a:	f4                   	hlt    
   3116b:	90                   	nop
   3116c:	90                   	nop
   3116d:	90                   	nop
   3116e:	90                   	nop
   3116f:	90                   	nop

00031170 <hwint05>:
   31170:	6a 05                	push   $0x5
   31172:	e8 ae fe ff ff       	call   31025 <int_handler>
   31177:	83 c4 04             	add    $0x4,%esp
   3117a:	f4                   	hlt    
   3117b:	90                   	nop
   3117c:	90                   	nop
   3117d:	90                   	nop
   3117e:	90                   	nop
   3117f:	90                   	nop

00031180 <hwint06>:
   31180:	6a 06                	push   $0x6
   31182:	e8 9e fe ff ff       	call   31025 <int_handler>
   31187:	83 c4 04             	add    $0x4,%esp
   3118a:	f4                   	hlt    
   3118b:	90                   	nop
   3118c:	90                   	nop
   3118d:	90                   	nop
   3118e:	90                   	nop
   3118f:	90                   	nop

00031190 <hwint07>:
   31190:	6a 07                	push   $0x7
   31192:	e8 8e fe ff ff       	call   31025 <int_handler>
   31197:	83 c4 04             	add    $0x4,%esp
   3119a:	f4                   	hlt    
   3119b:	90                   	nop
   3119c:	90                   	nop
   3119d:	90                   	nop
   3119e:	90                   	nop
   3119f:	90                   	nop

000311a0 <hwint08>:
   311a0:	6a 08                	push   $0x8
   311a2:	e8 7e fe ff ff       	call   31025 <int_handler>
   311a7:	83 c4 04             	add    $0x4,%esp
   311aa:	f4                   	hlt    
   311ab:	90                   	nop
   311ac:	90                   	nop
   311ad:	90                   	nop
   311ae:	90                   	nop
   311af:	90                   	nop

000311b0 <hwint09>:
   311b0:	6a 09                	push   $0x9
   311b2:	e8 6e fe ff ff       	call   31025 <int_handler>
   311b7:	83 c4 04             	add    $0x4,%esp
   311ba:	f4                   	hlt    
   311bb:	90                   	nop
   311bc:	90                   	nop
   311bd:	90                   	nop
   311be:	90                   	nop
   311bf:	90                   	nop

000311c0 <hwint10>:
   311c0:	6a 0a                	push   $0xa
   311c2:	e8 5e fe ff ff       	call   31025 <int_handler>
   311c7:	83 c4 04             	add    $0x4,%esp
   311ca:	f4                   	hlt    
   311cb:	90                   	nop
   311cc:	90                   	nop
   311cd:	90                   	nop
   311ce:	90                   	nop
   311cf:	90                   	nop

000311d0 <hwint11>:
   311d0:	6a 0b                	push   $0xb
   311d2:	e8 4e fe ff ff       	call   31025 <int_handler>
   311d7:	83 c4 04             	add    $0x4,%esp
   311da:	f4                   	hlt    
   311db:	90                   	nop
   311dc:	90                   	nop
   311dd:	90                   	nop
   311de:	90                   	nop
   311df:	90                   	nop

000311e0 <hwint12>:
   311e0:	6a 0c                	push   $0xc
   311e2:	e8 3e fe ff ff       	call   31025 <int_handler>
   311e7:	83 c4 04             	add    $0x4,%esp
   311ea:	f4                   	hlt    
   311eb:	90                   	nop
   311ec:	90                   	nop
   311ed:	90                   	nop
   311ee:	90                   	nop
   311ef:	90                   	nop

000311f0 <hwint13>:
   311f0:	6a 0d                	push   $0xd
   311f2:	e8 2e fe ff ff       	call   31025 <int_handler>
   311f7:	83 c4 04             	add    $0x4,%esp
   311fa:	f4                   	hlt    
   311fb:	90                   	nop
   311fc:	90                   	nop
   311fd:	90                   	nop
   311fe:	90                   	nop
   311ff:	90                   	nop

00031200 <hwint14>:
   31200:	6a 0e                	push   $0xe
   31202:	e8 1e fe ff ff       	call   31025 <int_handler>
   31207:	83 c4 04             	add    $0x4,%esp
   3120a:	f4                   	hlt    
   3120b:	90                   	nop
   3120c:	90                   	nop
   3120d:	90                   	nop
   3120e:	90                   	nop
   3120f:	90                   	nop

00031210 <hwint15>:
   31210:	6a 0f                	push   $0xf
   31212:	e8 0e fe ff ff       	call   31025 <int_handler>
   31217:	83 c4 04             	add    $0x4,%esp
   3121a:	f4                   	hlt    

0003121b <divide_error>:
   3121b:	6a ff                	push   $0xffffffff
   3121d:	6a 00                	push   $0x0
   3121f:	eb 4e                	jmp    3126f <exception>

00031221 <debug>:
   31221:	6a ff                	push   $0xffffffff
   31223:	6a 01                	push   $0x1
   31225:	eb 48                	jmp    3126f <exception>

00031227 <nmi>:
   31227:	6a ff                	push   $0xffffffff
   31229:	6a 02                	push   $0x2
   3122b:	eb 42                	jmp    3126f <exception>

0003122d <int3>:
   3122d:	6a ff                	push   $0xffffffff
   3122f:	6a 03                	push   $0x3
   31231:	eb 3c                	jmp    3126f <exception>

00031233 <overflow>:
   31233:	6a ff                	push   $0xffffffff
   31235:	6a 04                	push   $0x4
   31237:	eb 36                	jmp    3126f <exception>

00031239 <bounds>:
   31239:	6a ff                	push   $0xffffffff
   3123b:	6a 05                	push   $0x5
   3123d:	eb 30                	jmp    3126f <exception>

0003123f <invalid_op>:
   3123f:	6a ff                	push   $0xffffffff
   31241:	6a 06                	push   $0x6
   31243:	eb 2a                	jmp    3126f <exception>

00031245 <device_not_available>:
   31245:	6a ff                	push   $0xffffffff
   31247:	6a 07                	push   $0x7
   31249:	eb 24                	jmp    3126f <exception>

0003124b <doublefault_fn>:
   3124b:	6a 08                	push   $0x8
   3124d:	eb 20                	jmp    3126f <exception>

0003124f <coprocessor_segment_overrun>:
   3124f:	6a ff                	push   $0xffffffff
   31251:	6a 09                	push   $0x9
   31253:	eb 1a                	jmp    3126f <exception>

00031255 <invalid_tss>:
   31255:	6a 0a                	push   $0xa
   31257:	eb 16                	jmp    3126f <exception>

00031259 <segment_not_present>:
   31259:	6a 0b                	push   $0xb
   3125b:	eb 12                	jmp    3126f <exception>

0003125d <stack_segment>:
   3125d:	6a 0c                	push   $0xc
   3125f:	eb 0e                	jmp    3126f <exception>

00031261 <general_protection>:
   31261:	6a 0d                	push   $0xd
   31263:	eb 0a                	jmp    3126f <exception>

00031265 <page_fault>:
   31265:	6a 0e                	push   $0xe
   31267:	eb 06                	jmp    3126f <exception>

00031269 <coprocessor_error>:
   31269:	6a ff                	push   $0xffffffff
   3126b:	6a 10                	push   $0x10
   3126d:	eb 00                	jmp    3126f <exception>

0003126f <exception>:
   3126f:	e8 cc fd ff ff       	call   31040 <exception_handler>
   31274:	83 c4 08             	add    $0x8,%esp
   31277:	f4                   	hlt    

00031278 <testA>:
   31278:	55                   	push   %ebp
   31279:	89 e5                	mov    %esp,%ebp
   3127b:	83 ec 28             	sub    $0x28,%esp
   3127e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   31285:	eb 1e                	jmp    312a5 <testA+0x2d>
   31287:	c7 04 24 f0 16 03 00 	movl   $0x316f0,(%esp)
   3128e:	e8 c9 f2 ff ff       	call   3055c <printk>
   31293:	b8 ad 12 03 00       	mov    $0x312ad,%eax
   31298:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
   3129f:	ff d0                	call   *%eax
   312a1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   312a5:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
   312a9:	7e dc                	jle    31287 <testA+0xf>
   312ab:	eb fe                	jmp    312ab <testA+0x33>

000312ad <wait>:
   312ad:	55                   	push   %ebp
   312ae:	89 e5                	mov    %esp,%ebp
   312b0:	83 ec 10             	sub    $0x10,%esp
   312b3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
   312ba:	eb 30                	jmp    312ec <wait+0x3f>
   312bc:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
   312c3:	eb 1a                	jmp    312df <wait+0x32>
   312c5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   312cc:	eb 04                	jmp    312d2 <wait+0x25>
   312ce:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   312d2:	81 7d f4 f3 01 00 00 	cmpl   $0x1f3,-0xc(%ebp)
   312d9:	7e f3                	jle    312ce <wait+0x21>
   312db:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
   312df:	81 7d f8 87 13 00 00 	cmpl   $0x1387,-0x8(%ebp)
   312e6:	7e dd                	jle    312c5 <wait+0x18>
   312e8:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   312ec:	8b 55 08             	mov    0x8(%ebp),%edx
   312ef:	89 d0                	mov    %edx,%eax
   312f1:	01 c0                	add    %eax,%eax
   312f3:	01 d0                	add    %edx,%eax
   312f5:	3b 45 fc             	cmp    -0x4(%ebp),%eax
   312f8:	7f c2                	jg     312bc <wait+0xf>
   312fa:	c9                   	leave  
   312fb:	c3                   	ret    

000312fc <list_init>:
   312fc:	55                   	push   %ebp
   312fd:	89 e5                	mov    %esp,%ebp
   312ff:	8b 45 08             	mov    0x8(%ebp),%eax
   31302:	8d 50 08             	lea    0x8(%eax),%edx
   31305:	8b 45 08             	mov    0x8(%ebp),%eax
   31308:	89 50 04             	mov    %edx,0x4(%eax)
   3130b:	8b 45 08             	mov    0x8(%ebp),%eax
   3130e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
   31314:	8b 55 08             	mov    0x8(%ebp),%edx
   31317:	8b 45 08             	mov    0x8(%ebp),%eax
   3131a:	89 50 08             	mov    %edx,0x8(%eax)
   3131d:	8b 45 08             	mov    0x8(%ebp),%eax
   31320:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
   31327:	b8 01 00 00 00       	mov    $0x1,%eax
   3132c:	5d                   	pop    %ebp
   3132d:	c3                   	ret    

0003132e <list_empty>:
   3132e:	55                   	push   %ebp
   3132f:	89 e5                	mov    %esp,%ebp
   31331:	b8 00 00 00 00       	mov    $0x0,%eax
   31336:	5d                   	pop    %ebp
   31337:	c3                   	ret    

00031338 <list_insert_next>:
   31338:	55                   	push   %ebp
   31339:	89 e5                	mov    %esp,%ebp
   3133b:	8b 45 08             	mov    0x8(%ebp),%eax
   3133e:	8b 50 04             	mov    0x4(%eax),%edx
   31341:	8b 45 0c             	mov    0xc(%ebp),%eax
   31344:	89 50 04             	mov    %edx,0x4(%eax)
   31347:	8b 45 0c             	mov    0xc(%ebp),%eax
   3134a:	8b 55 08             	mov    0x8(%ebp),%edx
   3134d:	89 10                	mov    %edx,(%eax)
   3134f:	8b 45 08             	mov    0x8(%ebp),%eax
   31352:	8b 40 04             	mov    0x4(%eax),%eax
   31355:	8b 55 0c             	mov    0xc(%ebp),%edx
   31358:	89 10                	mov    %edx,(%eax)
   3135a:	8b 45 08             	mov    0x8(%ebp),%eax
   3135d:	8b 55 0c             	mov    0xc(%ebp),%edx
   31360:	89 50 04             	mov    %edx,0x4(%eax)
   31363:	b8 01 00 00 00       	mov    $0x1,%eax
   31368:	5d                   	pop    %ebp
   31369:	c3                   	ret    

0003136a <list_insert_prev>:
   3136a:	55                   	push   %ebp
   3136b:	89 e5                	mov    %esp,%ebp
   3136d:	8b 45 08             	mov    0x8(%ebp),%eax
   31370:	8b 55 0c             	mov    0xc(%ebp),%edx
   31373:	89 50 04             	mov    %edx,0x4(%eax)
   31376:	8b 45 0c             	mov    0xc(%ebp),%eax
   31379:	8b 10                	mov    (%eax),%edx
   3137b:	8b 45 08             	mov    0x8(%ebp),%eax
   3137e:	89 10                	mov    %edx,(%eax)
   31380:	8b 45 0c             	mov    0xc(%ebp),%eax
   31383:	8b 00                	mov    (%eax),%eax
   31385:	8b 55 08             	mov    0x8(%ebp),%edx
   31388:	89 50 04             	mov    %edx,0x4(%eax)
   3138b:	8b 45 0c             	mov    0xc(%ebp),%eax
   3138e:	8b 55 08             	mov    0x8(%ebp),%edx
   31391:	89 10                	mov    %edx,(%eax)
   31393:	b8 01 00 00 00       	mov    $0x1,%eax
   31398:	5d                   	pop    %ebp
   31399:	c3                   	ret    

0003139a <init_first_thread>:
   3139a:	55                   	push   %ebp
   3139b:	89 e5                	mov    %esp,%ebp
   3139d:	81 ec 80 80 00 00    	sub    $0x8080,%esp
   313a3:	a1 20 22 03 00       	mov    0x32220,%eax
   313a8:	89 85 c4 7f ff ff    	mov    %eax,-0x803c(%ebp)
   313ae:	a1 24 22 03 00       	mov    0x32224,%eax
   313b3:	89 85 8c 7f ff ff    	mov    %eax,-0x8074(%ebp)
   313b9:	a1 24 22 03 00       	mov    0x32224,%eax
   313be:	89 85 90 7f ff ff    	mov    %eax,-0x8070(%ebp)
   313c4:	a1 24 22 03 00       	mov    0x32224,%eax
   313c9:	89 85 94 7f ff ff    	mov    %eax,-0x806c(%ebp)
   313cf:	a1 24 22 03 00       	mov    0x32224,%eax
   313d4:	89 85 98 7f ff ff    	mov    %eax,-0x8068(%ebp)
   313da:	a1 24 22 03 00       	mov    0x32224,%eax
   313df:	89 85 d0 7f ff ff    	mov    %eax,-0x8030(%ebp)
   313e5:	b8 78 12 03 00       	mov    $0x31278,%eax
   313ea:	89 85 c0 7f ff ff    	mov    %eax,-0x8040(%ebp)
   313f0:	8d 85 8c 7f ff ff    	lea    -0x8074(%ebp),%eax
   313f6:	83 c0 74             	add    $0x74,%eax
   313f9:	05 00 80 00 00       	add    $0x8000,%eax
   313fe:	89 85 cc 7f ff ff    	mov    %eax,-0x8034(%ebp)
   31404:	c7 85 c8 7f ff ff 02 	movl   $0x1202,-0x8038(%ebp)
   3140b:	12 00 00 
   3140e:	8d 85 8c 7f ff ff    	lea    -0x8074(%ebp),%eax
   31414:	a3 d8 2e 03 00       	mov    %eax,0x32ed8
   31419:	c9                   	leave  
   3141a:	c3                   	ret    

0003141b <insert_list_by_pri>:
   3141b:	55                   	push   %ebp
   3141c:	89 e5                	mov    %esp,%ebp
   3141e:	83 ec 18             	sub    $0x18,%esp
   31421:	8b 45 0c             	mov    0xc(%ebp),%eax
   31424:	89 04 24             	mov    %eax,(%esp)
   31427:	e8 02 ff ff ff       	call   3132e <list_empty>
   3142c:	85 c0                	test   %eax,%eax
   3142e:	74 12                	je     31442 <insert_list_by_pri+0x27>
   31430:	8b 45 0c             	mov    0xc(%ebp),%eax
   31433:	8b 55 08             	mov    0x8(%ebp),%edx
   31436:	89 54 24 04          	mov    %edx,0x4(%esp)
   3143a:	89 04 24             	mov    %eax,(%esp)
   3143d:	e8 f6 fe ff ff       	call   31338 <list_insert_next>
   31442:	8b 45 0c             	mov    0xc(%ebp),%eax
   31445:	8b 40 04             	mov    0x4(%eax),%eax
   31448:	89 45 fc             	mov    %eax,-0x4(%ebp)
   3144b:	8b 45 08             	mov    0x8(%ebp),%eax
   3144e:	83 c0 04             	add    $0x4,%eax
   31451:	83 e8 70             	sub    $0x70,%eax
   31454:	8b 50 60             	mov    0x60(%eax),%edx
   31457:	8b 45 fc             	mov    -0x4(%ebp),%eax
   3145a:	83 c0 04             	add    $0x4,%eax
   3145d:	83 e8 70             	sub    $0x70,%eax
   31460:	8b 40 60             	mov    0x60(%eax),%eax
   31463:	39 c2                	cmp    %eax,%edx
   31465:	7f 12                	jg     31479 <insert_list_by_pri+0x5e>
   31467:	8b 45 fc             	mov    -0x4(%ebp),%eax
   3146a:	89 44 24 04          	mov    %eax,0x4(%esp)
   3146e:	8b 45 08             	mov    0x8(%ebp),%eax
   31471:	89 04 24             	mov    %eax,(%esp)
   31474:	e8 f1 fe ff ff       	call   3136a <list_insert_prev>
   31479:	8b 45 fc             	mov    -0x4(%ebp),%eax
   3147c:	8b 40 04             	mov    0x4(%eax),%eax
   3147f:	89 45 fc             	mov    %eax,-0x4(%ebp)
   31482:	8b 45 0c             	mov    0xc(%ebp),%eax
   31485:	83 c0 08             	add    $0x8,%eax
   31488:	3b 45 fc             	cmp    -0x4(%ebp),%eax
   3148b:	75 be                	jne    3144b <insert_list_by_pri+0x30>
   3148d:	b8 01 00 00 00       	mov    $0x1,%eax
   31492:	c9                   	leave  
   31493:	c3                   	ret    
