
kernel.bin:     file format elf32-i386


Disassembly of section .text:

00030400 <_start>:
   30400:	bc 01 20 03 00       	mov    $0x32001,%esp
   30405:	0f 01 05 d2 2e 03 00 	sgdtl  0x32ed2
   3040c:	e8 4f 00 00 00       	call   30460 <__init__>
   30411:	fb                   	sti    
   30412:	8b 25 c8 2e 03 00    	mov    0x32ec8,%esp
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
   3047e:	c7 04 24 80 14 03 00 	movl   $0x31480,(%esp)
   30485:	e8 d2 00 00 00       	call   3055c <printk>
   3048a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   3048e:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
   30495:	7e e7                	jle    3047e <__init__+0x1e>
   30497:	c7 05 04 20 03 00 00 	movl   $0x0,0x32004
   3049e:	00 00 00 
   304a1:	c7 04 24 82 14 03 00 	movl   $0x31482,(%esp)
   304a8:	e8 af 00 00 00       	call   3055c <printk>
   304ad:	e8 ce 02 00 00       	call   30780 <init_8259A>
   304b2:	c7 04 24 9c 14 03 00 	movl   $0x3149c,(%esp)
   304b9:	e8 9e 00 00 00       	call   3055c <printk>
   304be:	e8 35 05 00 00       	call   309f8 <init_idt>
   304c3:	c7 04 24 b5 14 03 00 	movl   $0x314b5,(%esp)
   304ca:	e8 8d 00 00 00       	call   3055c <printk>
   304cf:	c7 04 24 cc 14 03 00 	movl   $0x314cc,(%esp)
   304d6:	e8 81 00 00 00       	call   3055c <printk>
   304db:	e8 62 0d 00 00       	call   31242 <init_first_thread>
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
   30542:	c7 04 24 73 15 03 00 	movl   $0x31573,(%esp)
   30549:	e8 0e 00 00 00       	call   3055c <printk>
   3054e:	c7 04 24 91 15 03 00 	movl   $0x31591,(%esp)
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
   309d1:	c7 45 f4 d2 2e 03 00 	movl   $0x32ed2,-0xc(%ebp)
   309d8:	c7 45 f0 d4 2e 03 00 	movl   $0x32ed4,-0x10(%ebp)
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
   309fe:	b8 0b 14 03 00       	mov    $0x3140b,%eax
   30a03:	66 a3 40 26 03 00    	mov    %ax,0x32640
   30a09:	66 c7 05 42 26 03 00 	movw   $0x60,0x32642
   30a10:	60 00 
   30a12:	c6 05 44 26 03 00 00 	movb   $0x0,0x32644
   30a19:	c6 05 45 26 03 00 8e 	movb   $0x8e,0x32645
   30a20:	b8 0b 14 03 00       	mov    $0x3140b,%eax
   30a25:	c1 e8 10             	shr    $0x10,%eax
   30a28:	66 a3 46 26 03 00    	mov    %ax,0x32646
   30a2e:	b8 11 14 03 00       	mov    $0x31411,%eax
   30a33:	66 a3 48 26 03 00    	mov    %ax,0x32648
   30a39:	66 c7 05 4a 26 03 00 	movw   $0x60,0x3264a
   30a40:	60 00 
   30a42:	c6 05 4c 26 03 00 00 	movb   $0x0,0x3264c
   30a49:	c6 05 4d 26 03 00 8e 	movb   $0x8e,0x3264d
   30a50:	b8 11 14 03 00       	mov    $0x31411,%eax
   30a55:	c1 e8 10             	shr    $0x10,%eax
   30a58:	66 a3 4e 26 03 00    	mov    %ax,0x3264e
   30a5e:	b8 17 14 03 00       	mov    $0x31417,%eax
   30a63:	66 a3 50 26 03 00    	mov    %ax,0x32650
   30a69:	66 c7 05 52 26 03 00 	movw   $0x60,0x32652
   30a70:	60 00 
   30a72:	c6 05 54 26 03 00 00 	movb   $0x0,0x32654
   30a79:	c6 05 55 26 03 00 8e 	movb   $0x8e,0x32655
   30a80:	b8 17 14 03 00       	mov    $0x31417,%eax
   30a85:	c1 e8 10             	shr    $0x10,%eax
   30a88:	66 a3 56 26 03 00    	mov    %ax,0x32656
   30a8e:	b8 1d 14 03 00       	mov    $0x3141d,%eax
   30a93:	66 a3 58 26 03 00    	mov    %ax,0x32658
   30a99:	66 c7 05 5a 26 03 00 	movw   $0x60,0x3265a
   30aa0:	60 00 
   30aa2:	c6 05 5c 26 03 00 00 	movb   $0x0,0x3265c
   30aa9:	c6 05 5d 26 03 00 8e 	movb   $0x8e,0x3265d
   30ab0:	b8 1d 14 03 00       	mov    $0x3141d,%eax
   30ab5:	c1 e8 10             	shr    $0x10,%eax
   30ab8:	66 a3 5e 26 03 00    	mov    %ax,0x3265e
   30abe:	b8 23 14 03 00       	mov    $0x31423,%eax
   30ac3:	66 a3 60 26 03 00    	mov    %ax,0x32660
   30ac9:	66 c7 05 62 26 03 00 	movw   $0x60,0x32662
   30ad0:	60 00 
   30ad2:	c6 05 64 26 03 00 00 	movb   $0x0,0x32664
   30ad9:	c6 05 65 26 03 00 8e 	movb   $0x8e,0x32665
   30ae0:	b8 23 14 03 00       	mov    $0x31423,%eax
   30ae5:	c1 e8 10             	shr    $0x10,%eax
   30ae8:	66 a3 66 26 03 00    	mov    %ax,0x32666
   30aee:	b8 29 14 03 00       	mov    $0x31429,%eax
   30af3:	66 a3 68 26 03 00    	mov    %ax,0x32668
   30af9:	66 c7 05 6a 26 03 00 	movw   $0x60,0x3266a
   30b00:	60 00 
   30b02:	c6 05 6c 26 03 00 00 	movb   $0x0,0x3266c
   30b09:	c6 05 6d 26 03 00 8e 	movb   $0x8e,0x3266d
   30b10:	b8 29 14 03 00       	mov    $0x31429,%eax
   30b15:	c1 e8 10             	shr    $0x10,%eax
   30b18:	66 a3 6e 26 03 00    	mov    %ax,0x3266e
   30b1e:	b8 2f 14 03 00       	mov    $0x3142f,%eax
   30b23:	66 a3 70 26 03 00    	mov    %ax,0x32670
   30b29:	66 c7 05 72 26 03 00 	movw   $0x60,0x32672
   30b30:	60 00 
   30b32:	c6 05 74 26 03 00 00 	movb   $0x0,0x32674
   30b39:	c6 05 75 26 03 00 8e 	movb   $0x8e,0x32675
   30b40:	b8 2f 14 03 00       	mov    $0x3142f,%eax
   30b45:	c1 e8 10             	shr    $0x10,%eax
   30b48:	66 a3 76 26 03 00    	mov    %ax,0x32676
   30b4e:	b8 35 14 03 00       	mov    $0x31435,%eax
   30b53:	66 a3 78 26 03 00    	mov    %ax,0x32678
   30b59:	66 c7 05 7a 26 03 00 	movw   $0x60,0x3267a
   30b60:	60 00 
   30b62:	c6 05 7c 26 03 00 00 	movb   $0x0,0x3267c
   30b69:	c6 05 7d 26 03 00 8e 	movb   $0x8e,0x3267d
   30b70:	b8 35 14 03 00       	mov    $0x31435,%eax
   30b75:	c1 e8 10             	shr    $0x10,%eax
   30b78:	66 a3 7e 26 03 00    	mov    %ax,0x3267e
   30b7e:	b8 3b 14 03 00       	mov    $0x3143b,%eax
   30b83:	66 a3 80 26 03 00    	mov    %ax,0x32680
   30b89:	66 c7 05 82 26 03 00 	movw   $0x60,0x32682
   30b90:	60 00 
   30b92:	c6 05 84 26 03 00 00 	movb   $0x0,0x32684
   30b99:	c6 05 85 26 03 00 8e 	movb   $0x8e,0x32685
   30ba0:	b8 3b 14 03 00       	mov    $0x3143b,%eax
   30ba5:	c1 e8 10             	shr    $0x10,%eax
   30ba8:	66 a3 86 26 03 00    	mov    %ax,0x32686
   30bae:	b8 3f 14 03 00       	mov    $0x3143f,%eax
   30bb3:	66 a3 88 26 03 00    	mov    %ax,0x32688
   30bb9:	66 c7 05 8a 26 03 00 	movw   $0x60,0x3268a
   30bc0:	60 00 
   30bc2:	c6 05 8c 26 03 00 00 	movb   $0x0,0x3268c
   30bc9:	c6 05 8d 26 03 00 8e 	movb   $0x8e,0x3268d
   30bd0:	b8 3f 14 03 00       	mov    $0x3143f,%eax
   30bd5:	c1 e8 10             	shr    $0x10,%eax
   30bd8:	66 a3 8e 26 03 00    	mov    %ax,0x3268e
   30bde:	b8 45 14 03 00       	mov    $0x31445,%eax
   30be3:	66 a3 90 26 03 00    	mov    %ax,0x32690
   30be9:	66 c7 05 92 26 03 00 	movw   $0x60,0x32692
   30bf0:	60 00 
   30bf2:	c6 05 94 26 03 00 00 	movb   $0x0,0x32694
   30bf9:	c6 05 95 26 03 00 8e 	movb   $0x8e,0x32695
   30c00:	b8 45 14 03 00       	mov    $0x31445,%eax
   30c05:	c1 e8 10             	shr    $0x10,%eax
   30c08:	66 a3 96 26 03 00    	mov    %ax,0x32696
   30c0e:	b8 49 14 03 00       	mov    $0x31449,%eax
   30c13:	66 a3 98 26 03 00    	mov    %ax,0x32698
   30c19:	66 c7 05 9a 26 03 00 	movw   $0x60,0x3269a
   30c20:	60 00 
   30c22:	c6 05 9c 26 03 00 00 	movb   $0x0,0x3269c
   30c29:	c6 05 9d 26 03 00 8e 	movb   $0x8e,0x3269d
   30c30:	b8 49 14 03 00       	mov    $0x31449,%eax
   30c35:	c1 e8 10             	shr    $0x10,%eax
   30c38:	66 a3 9e 26 03 00    	mov    %ax,0x3269e
   30c3e:	b8 4d 14 03 00       	mov    $0x3144d,%eax
   30c43:	66 a3 a0 26 03 00    	mov    %ax,0x326a0
   30c49:	66 c7 05 a2 26 03 00 	movw   $0x60,0x326a2
   30c50:	60 00 
   30c52:	c6 05 a4 26 03 00 00 	movb   $0x0,0x326a4
   30c59:	c6 05 a5 26 03 00 8e 	movb   $0x8e,0x326a5
   30c60:	b8 4d 14 03 00       	mov    $0x3144d,%eax
   30c65:	c1 e8 10             	shr    $0x10,%eax
   30c68:	66 a3 a6 26 03 00    	mov    %ax,0x326a6
   30c6e:	b8 51 14 03 00       	mov    $0x31451,%eax
   30c73:	66 a3 a8 26 03 00    	mov    %ax,0x326a8
   30c79:	66 c7 05 aa 26 03 00 	movw   $0x60,0x326aa
   30c80:	60 00 
   30c82:	c6 05 ac 26 03 00 00 	movb   $0x0,0x326ac
   30c89:	c6 05 ad 26 03 00 8e 	movb   $0x8e,0x326ad
   30c90:	b8 51 14 03 00       	mov    $0x31451,%eax
   30c95:	c1 e8 10             	shr    $0x10,%eax
   30c98:	66 a3 ae 26 03 00    	mov    %ax,0x326ae
   30c9e:	b8 55 14 03 00       	mov    $0x31455,%eax
   30ca3:	66 a3 b0 26 03 00    	mov    %ax,0x326b0
   30ca9:	66 c7 05 b2 26 03 00 	movw   $0x60,0x326b2
   30cb0:	60 00 
   30cb2:	c6 05 b4 26 03 00 00 	movb   $0x0,0x326b4
   30cb9:	c6 05 b5 26 03 00 8e 	movb   $0x8e,0x326b5
   30cc0:	b8 55 14 03 00       	mov    $0x31455,%eax
   30cc5:	c1 e8 10             	shr    $0x10,%eax
   30cc8:	66 a3 b6 26 03 00    	mov    %ax,0x326b6
   30cce:	b8 59 14 03 00       	mov    $0x31459,%eax
   30cd3:	66 a3 c0 26 03 00    	mov    %ax,0x326c0
   30cd9:	66 c7 05 c2 26 03 00 	movw   $0x60,0x326c2
   30ce0:	60 00 
   30ce2:	c6 05 c4 26 03 00 00 	movb   $0x0,0x326c4
   30ce9:	c6 05 c5 26 03 00 8e 	movb   $0x8e,0x326c5
   30cf0:	b8 59 14 03 00       	mov    $0x31459,%eax
   30cf5:	c1 e8 10             	shr    $0x10,%eax
   30cf8:	66 a3 c6 26 03 00    	mov    %ax,0x326c6
   30cfe:	b8 d0 12 03 00       	mov    $0x312d0,%eax
   30d03:	66 a3 40 27 03 00    	mov    %ax,0x32740
   30d09:	66 c7 05 42 27 03 00 	movw   $0x60,0x32742
   30d10:	60 00 
   30d12:	c6 05 44 27 03 00 00 	movb   $0x0,0x32744
   30d19:	c6 05 45 27 03 00 8e 	movb   $0x8e,0x32745
   30d20:	b8 d0 12 03 00       	mov    $0x312d0,%eax
   30d25:	c1 e8 10             	shr    $0x10,%eax
   30d28:	66 a3 46 27 03 00    	mov    %ax,0x32746
   30d2e:	b8 20 13 03 00       	mov    $0x31320,%eax
   30d33:	66 a3 48 27 03 00    	mov    %ax,0x32748
   30d39:	66 c7 05 4a 27 03 00 	movw   $0x60,0x3274a
   30d40:	60 00 
   30d42:	c6 05 4c 27 03 00 00 	movb   $0x0,0x3274c
   30d49:	c6 05 4d 27 03 00 8e 	movb   $0x8e,0x3274d
   30d50:	b8 20 13 03 00       	mov    $0x31320,%eax
   30d55:	c1 e8 10             	shr    $0x10,%eax
   30d58:	66 a3 4e 27 03 00    	mov    %ax,0x3274e
   30d5e:	b8 30 13 03 00       	mov    $0x31330,%eax
   30d63:	66 a3 50 27 03 00    	mov    %ax,0x32750
   30d69:	66 c7 05 52 27 03 00 	movw   $0x60,0x32752
   30d70:	60 00 
   30d72:	c6 05 54 27 03 00 00 	movb   $0x0,0x32754
   30d79:	c6 05 55 27 03 00 8e 	movb   $0x8e,0x32755
   30d80:	b8 30 13 03 00       	mov    $0x31330,%eax
   30d85:	c1 e8 10             	shr    $0x10,%eax
   30d88:	66 a3 56 27 03 00    	mov    %ax,0x32756
   30d8e:	b8 40 13 03 00       	mov    $0x31340,%eax
   30d93:	66 a3 58 27 03 00    	mov    %ax,0x32758
   30d99:	66 c7 05 5a 27 03 00 	movw   $0x60,0x3275a
   30da0:	60 00 
   30da2:	c6 05 5c 27 03 00 00 	movb   $0x0,0x3275c
   30da9:	c6 05 5d 27 03 00 8e 	movb   $0x8e,0x3275d
   30db0:	b8 40 13 03 00       	mov    $0x31340,%eax
   30db5:	c1 e8 10             	shr    $0x10,%eax
   30db8:	66 a3 5e 27 03 00    	mov    %ax,0x3275e
   30dbe:	b8 50 13 03 00       	mov    $0x31350,%eax
   30dc3:	66 a3 60 27 03 00    	mov    %ax,0x32760
   30dc9:	66 c7 05 62 27 03 00 	movw   $0x60,0x32762
   30dd0:	60 00 
   30dd2:	c6 05 64 27 03 00 00 	movb   $0x0,0x32764
   30dd9:	c6 05 65 27 03 00 8e 	movb   $0x8e,0x32765
   30de0:	b8 50 13 03 00       	mov    $0x31350,%eax
   30de5:	c1 e8 10             	shr    $0x10,%eax
   30de8:	66 a3 66 27 03 00    	mov    %ax,0x32766
   30dee:	b8 60 13 03 00       	mov    $0x31360,%eax
   30df3:	66 a3 68 27 03 00    	mov    %ax,0x32768
   30df9:	66 c7 05 6a 27 03 00 	movw   $0x60,0x3276a
   30e00:	60 00 
   30e02:	c6 05 6c 27 03 00 00 	movb   $0x0,0x3276c
   30e09:	c6 05 6d 27 03 00 8e 	movb   $0x8e,0x3276d
   30e10:	b8 60 13 03 00       	mov    $0x31360,%eax
   30e15:	c1 e8 10             	shr    $0x10,%eax
   30e18:	66 a3 6e 27 03 00    	mov    %ax,0x3276e
   30e1e:	b8 70 13 03 00       	mov    $0x31370,%eax
   30e23:	66 a3 70 27 03 00    	mov    %ax,0x32770
   30e29:	66 c7 05 72 27 03 00 	movw   $0x60,0x32772
   30e30:	60 00 
   30e32:	c6 05 74 27 03 00 00 	movb   $0x0,0x32774
   30e39:	c6 05 75 27 03 00 8e 	movb   $0x8e,0x32775
   30e40:	b8 70 13 03 00       	mov    $0x31370,%eax
   30e45:	c1 e8 10             	shr    $0x10,%eax
   30e48:	66 a3 76 27 03 00    	mov    %ax,0x32776
   30e4e:	b8 80 13 03 00       	mov    $0x31380,%eax
   30e53:	66 a3 78 27 03 00    	mov    %ax,0x32778
   30e59:	66 c7 05 7a 27 03 00 	movw   $0x60,0x3277a
   30e60:	60 00 
   30e62:	c6 05 7c 27 03 00 00 	movb   $0x0,0x3277c
   30e69:	c6 05 7d 27 03 00 8e 	movb   $0x8e,0x3277d
   30e70:	b8 80 13 03 00       	mov    $0x31380,%eax
   30e75:	c1 e8 10             	shr    $0x10,%eax
   30e78:	66 a3 7e 27 03 00    	mov    %ax,0x3277e
   30e7e:	b8 90 13 03 00       	mov    $0x31390,%eax
   30e83:	66 a3 80 27 03 00    	mov    %ax,0x32780
   30e89:	66 c7 05 82 27 03 00 	movw   $0x60,0x32782
   30e90:	60 00 
   30e92:	c6 05 84 27 03 00 00 	movb   $0x0,0x32784
   30e99:	c6 05 85 27 03 00 8e 	movb   $0x8e,0x32785
   30ea0:	b8 90 13 03 00       	mov    $0x31390,%eax
   30ea5:	c1 e8 10             	shr    $0x10,%eax
   30ea8:	66 a3 86 27 03 00    	mov    %ax,0x32786
   30eae:	b8 a0 13 03 00       	mov    $0x313a0,%eax
   30eb3:	66 a3 88 27 03 00    	mov    %ax,0x32788
   30eb9:	66 c7 05 8a 27 03 00 	movw   $0x60,0x3278a
   30ec0:	60 00 
   30ec2:	c6 05 8c 27 03 00 00 	movb   $0x0,0x3278c
   30ec9:	c6 05 8d 27 03 00 8e 	movb   $0x8e,0x3278d
   30ed0:	b8 a0 13 03 00       	mov    $0x313a0,%eax
   30ed5:	c1 e8 10             	shr    $0x10,%eax
   30ed8:	66 a3 8e 27 03 00    	mov    %ax,0x3278e
   30ede:	b8 b0 13 03 00       	mov    $0x313b0,%eax
   30ee3:	66 a3 90 27 03 00    	mov    %ax,0x32790
   30ee9:	66 c7 05 92 27 03 00 	movw   $0x60,0x32792
   30ef0:	60 00 
   30ef2:	c6 05 94 27 03 00 00 	movb   $0x0,0x32794
   30ef9:	c6 05 95 27 03 00 8e 	movb   $0x8e,0x32795
   30f00:	b8 b0 13 03 00       	mov    $0x313b0,%eax
   30f05:	c1 e8 10             	shr    $0x10,%eax
   30f08:	66 a3 96 27 03 00    	mov    %ax,0x32796
   30f0e:	b8 c0 13 03 00       	mov    $0x313c0,%eax
   30f13:	66 a3 98 27 03 00    	mov    %ax,0x32798
   30f19:	66 c7 05 9a 27 03 00 	movw   $0x60,0x3279a
   30f20:	60 00 
   30f22:	c6 05 9c 27 03 00 00 	movb   $0x0,0x3279c
   30f29:	c6 05 9d 27 03 00 8e 	movb   $0x8e,0x3279d
   30f30:	b8 c0 13 03 00       	mov    $0x313c0,%eax
   30f35:	c1 e8 10             	shr    $0x10,%eax
   30f38:	66 a3 9e 27 03 00    	mov    %ax,0x3279e
   30f3e:	b8 d0 13 03 00       	mov    $0x313d0,%eax
   30f43:	66 a3 a0 27 03 00    	mov    %ax,0x327a0
   30f49:	66 c7 05 a2 27 03 00 	movw   $0x60,0x327a2
   30f50:	60 00 
   30f52:	c6 05 a4 27 03 00 00 	movb   $0x0,0x327a4
   30f59:	c6 05 a5 27 03 00 8e 	movb   $0x8e,0x327a5
   30f60:	b8 d0 13 03 00       	mov    $0x313d0,%eax
   30f65:	c1 e8 10             	shr    $0x10,%eax
   30f68:	66 a3 a6 27 03 00    	mov    %ax,0x327a6
   30f6e:	b8 e0 13 03 00       	mov    $0x313e0,%eax
   30f73:	66 a3 a8 27 03 00    	mov    %ax,0x327a8
   30f79:	66 c7 05 aa 27 03 00 	movw   $0x60,0x327aa
   30f80:	60 00 
   30f82:	c6 05 ac 27 03 00 00 	movb   $0x0,0x327ac
   30f89:	c6 05 ad 27 03 00 8e 	movb   $0x8e,0x327ad
   30f90:	b8 e0 13 03 00       	mov    $0x313e0,%eax
   30f95:	c1 e8 10             	shr    $0x10,%eax
   30f98:	66 a3 ae 27 03 00    	mov    %ax,0x327ae
   30f9e:	b8 f0 13 03 00       	mov    $0x313f0,%eax
   30fa3:	66 a3 b0 27 03 00    	mov    %ax,0x327b0
   30fa9:	66 c7 05 b2 27 03 00 	movw   $0x60,0x327b2
   30fb0:	60 00 
   30fb2:	c6 05 b4 27 03 00 00 	movb   $0x0,0x327b4
   30fb9:	c6 05 b5 27 03 00 8e 	movb   $0x8e,0x327b5
   30fc0:	b8 f0 13 03 00       	mov    $0x313f0,%eax
   30fc5:	c1 e8 10             	shr    $0x10,%eax
   30fc8:	66 a3 b6 27 03 00    	mov    %ax,0x327b6
   30fce:	b8 00 14 03 00       	mov    $0x31400,%eax
   30fd3:	66 a3 b8 27 03 00    	mov    %ax,0x327b8
   30fd9:	66 c7 05 ba 27 03 00 	movw   $0x60,0x327ba
   30fe0:	60 00 
   30fe2:	c6 05 bc 27 03 00 00 	movb   $0x0,0x327bc
   30fe9:	c6 05 bd 27 03 00 8e 	movb   $0x8e,0x327bd
   30ff0:	b8 00 14 03 00       	mov    $0x31400,%eax
   30ff5:	c1 e8 10             	shr    $0x10,%eax
   30ff8:	66 a3 be 27 03 00    	mov    %ax,0x327be
   30ffe:	c7 45 f4 cc 2e 03 00 	movl   $0x32ecc,-0xc(%ebp)
   31005:	c7 45 f0 ce 2e 03 00 	movl   $0x32ece,-0x10(%ebp)
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
   31032:	c7 04 24 c0 15 03 00 	movl   $0x315c0,(%esp)
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
   3104c:	bb 80 16 03 00       	mov    $0x31680,%ebx
   31051:	b8 14 00 00 00       	mov    $0x14,%eax
   31056:	89 d7                	mov    %edx,%edi
   31058:	89 de                	mov    %ebx,%esi
   3105a:	89 c1                	mov    %eax,%ecx
   3105c:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
   3105e:	c7 05 04 20 03 00 00 	movl   $0x0,0x32004
   31065:	00 00 00 
   31068:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
   3106f:	eb 10                	jmp    31081 <exception_handler+0x41>
   31071:	c7 04 24 d6 15 03 00 	movl   $0x315d6,(%esp)
   31078:	e8 df f4 ff ff       	call   3055c <printk>
   3107d:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
   31081:	81 7d e4 8f 01 00 00 	cmpl   $0x18f,-0x1c(%ebp)
   31088:	7e e7                	jle    31071 <exception_handler+0x31>
   3108a:	c7 05 04 20 03 00 00 	movl   $0x0,0x32004
   31091:	00 00 00 
   31094:	8b 45 08             	mov    0x8(%ebp),%eax
   31097:	8b 44 85 94          	mov    -0x6c(%ebp,%eax,4),%eax
   3109b:	89 44 24 04          	mov    %eax,0x4(%esp)
   3109f:	c7 04 24 d8 15 03 00 	movl   $0x315d8,(%esp)
   310a6:	e8 b1 f4 ff ff       	call   3055c <printk>
   310ab:	8b 45 18             	mov    0x18(%ebp),%eax
   310ae:	89 44 24 0c          	mov    %eax,0xc(%esp)
   310b2:	8b 45 14             	mov    0x14(%ebp),%eax
   310b5:	89 44 24 08          	mov    %eax,0x8(%esp)
   310b9:	8b 45 10             	mov    0x10(%ebp),%eax
   310bc:	89 44 24 04          	mov    %eax,0x4(%esp)
   310c0:	c7 04 24 e7 15 03 00 	movl   $0x315e7,(%esp)
   310c7:	e8 90 f4 ff ff       	call   3055c <printk>
   310cc:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
   310d0:	74 13                	je     310e5 <exception_handler+0xa5>
   310d2:	8b 45 0c             	mov    0xc(%ebp),%eax
   310d5:	89 44 24 04          	mov    %eax,0x4(%esp)
   310d9:	c7 04 24 03 16 03 00 	movl   $0x31603,(%esp)
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
   310f0:	0f 01 15 d2 2e 03 00 	lgdtl  0x32ed2
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
   31117:	0f 01 1d cc 2e 03 00 	lidtl  0x32ecc
   3111e:	c3                   	ret    
   3111f:	90                   	nop

00031120 <testA>:
   31120:	55                   	push   %ebp
   31121:	89 e5                	mov    %esp,%ebp
   31123:	83 ec 28             	sub    $0x28,%esp
   31126:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   3112d:	eb 1e                	jmp    3114d <testA+0x2d>
   3112f:	c7 04 24 d0 16 03 00 	movl   $0x316d0,(%esp)
   31136:	e8 21 f4 ff ff       	call   3055c <printk>
   3113b:	b8 55 11 03 00       	mov    $0x31155,%eax
   31140:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
   31147:	ff d0                	call   *%eax
   31149:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   3114d:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
   31151:	7e dc                	jle    3112f <testA+0xf>
   31153:	eb fe                	jmp    31153 <testA+0x33>

00031155 <wait>:
   31155:	55                   	push   %ebp
   31156:	89 e5                	mov    %esp,%ebp
   31158:	83 ec 10             	sub    $0x10,%esp
   3115b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
   31162:	eb 30                	jmp    31194 <wait+0x3f>
   31164:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
   3116b:	eb 1a                	jmp    31187 <wait+0x32>
   3116d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   31174:	eb 04                	jmp    3117a <wait+0x25>
   31176:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   3117a:	81 7d f4 f3 01 00 00 	cmpl   $0x1f3,-0xc(%ebp)
   31181:	7e f3                	jle    31176 <wait+0x21>
   31183:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
   31187:	81 7d f8 87 13 00 00 	cmpl   $0x1387,-0x8(%ebp)
   3118e:	7e dd                	jle    3116d <wait+0x18>
   31190:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   31194:	8b 55 08             	mov    0x8(%ebp),%edx
   31197:	89 d0                	mov    %edx,%eax
   31199:	01 c0                	add    %eax,%eax
   3119b:	01 d0                	add    %edx,%eax
   3119d:	3b 45 fc             	cmp    -0x4(%ebp),%eax
   311a0:	7f c2                	jg     31164 <wait+0xf>
   311a2:	c9                   	leave  
   311a3:	c3                   	ret    

000311a4 <list_init>:
   311a4:	55                   	push   %ebp
   311a5:	89 e5                	mov    %esp,%ebp
   311a7:	8b 45 08             	mov    0x8(%ebp),%eax
   311aa:	8d 50 08             	lea    0x8(%eax),%edx
   311ad:	8b 45 08             	mov    0x8(%ebp),%eax
   311b0:	89 50 04             	mov    %edx,0x4(%eax)
   311b3:	8b 45 08             	mov    0x8(%ebp),%eax
   311b6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
   311bc:	8b 55 08             	mov    0x8(%ebp),%edx
   311bf:	8b 45 08             	mov    0x8(%ebp),%eax
   311c2:	89 50 08             	mov    %edx,0x8(%eax)
   311c5:	8b 45 08             	mov    0x8(%ebp),%eax
   311c8:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
   311cf:	b8 01 00 00 00       	mov    $0x1,%eax
   311d4:	5d                   	pop    %ebp
   311d5:	c3                   	ret    

000311d6 <list_empty>:
   311d6:	55                   	push   %ebp
   311d7:	89 e5                	mov    %esp,%ebp
   311d9:	b8 00 00 00 00       	mov    $0x0,%eax
   311de:	5d                   	pop    %ebp
   311df:	c3                   	ret    

000311e0 <list_insert_next>:
   311e0:	55                   	push   %ebp
   311e1:	89 e5                	mov    %esp,%ebp
   311e3:	8b 45 08             	mov    0x8(%ebp),%eax
   311e6:	8b 50 04             	mov    0x4(%eax),%edx
   311e9:	8b 45 0c             	mov    0xc(%ebp),%eax
   311ec:	89 50 04             	mov    %edx,0x4(%eax)
   311ef:	8b 45 0c             	mov    0xc(%ebp),%eax
   311f2:	8b 55 08             	mov    0x8(%ebp),%edx
   311f5:	89 10                	mov    %edx,(%eax)
   311f7:	8b 45 08             	mov    0x8(%ebp),%eax
   311fa:	8b 40 04             	mov    0x4(%eax),%eax
   311fd:	8b 55 0c             	mov    0xc(%ebp),%edx
   31200:	89 10                	mov    %edx,(%eax)
   31202:	8b 45 08             	mov    0x8(%ebp),%eax
   31205:	8b 55 0c             	mov    0xc(%ebp),%edx
   31208:	89 50 04             	mov    %edx,0x4(%eax)
   3120b:	b8 01 00 00 00       	mov    $0x1,%eax
   31210:	5d                   	pop    %ebp
   31211:	c3                   	ret    

00031212 <list_insert_prev>:
   31212:	55                   	push   %ebp
   31213:	89 e5                	mov    %esp,%ebp
   31215:	8b 45 08             	mov    0x8(%ebp),%eax
   31218:	8b 55 0c             	mov    0xc(%ebp),%edx
   3121b:	89 50 04             	mov    %edx,0x4(%eax)
   3121e:	8b 45 0c             	mov    0xc(%ebp),%eax
   31221:	8b 10                	mov    (%eax),%edx
   31223:	8b 45 08             	mov    0x8(%ebp),%eax
   31226:	89 10                	mov    %edx,(%eax)
   31228:	8b 45 0c             	mov    0xc(%ebp),%eax
   3122b:	8b 00                	mov    (%eax),%eax
   3122d:	8b 55 08             	mov    0x8(%ebp),%edx
   31230:	89 50 04             	mov    %edx,0x4(%eax)
   31233:	8b 45 0c             	mov    0xc(%ebp),%eax
   31236:	8b 55 08             	mov    0x8(%ebp),%edx
   31239:	89 10                	mov    %edx,(%eax)
   3123b:	b8 01 00 00 00       	mov    $0x1,%eax
   31240:	5d                   	pop    %ebp
   31241:	c3                   	ret    

00031242 <init_first_thread>:
   31242:	55                   	push   %ebp
   31243:	89 e5                	mov    %esp,%ebp
   31245:	81 ec 70 80 00 00    	sub    $0x8070,%esp
   3124b:	a1 24 22 03 00       	mov    0x32224,%eax
   31250:	89 85 d4 7f ff ff    	mov    %eax,-0x802c(%ebp)
   31256:	a1 28 22 03 00       	mov    0x32228,%eax
   3125b:	89 85 9c 7f ff ff    	mov    %eax,-0x8064(%ebp)
   31261:	a1 28 22 03 00       	mov    0x32228,%eax
   31266:	89 85 a0 7f ff ff    	mov    %eax,-0x8060(%ebp)
   3126c:	a1 28 22 03 00       	mov    0x32228,%eax
   31271:	89 85 a4 7f ff ff    	mov    %eax,-0x805c(%ebp)
   31277:	a1 28 22 03 00       	mov    0x32228,%eax
   3127c:	89 85 a8 7f ff ff    	mov    %eax,-0x8058(%ebp)
   31282:	a1 28 22 03 00       	mov    0x32228,%eax
   31287:	89 85 e0 7f ff ff    	mov    %eax,-0x8020(%ebp)
   3128d:	b8 20 11 03 00       	mov    $0x31120,%eax
   31292:	89 85 d0 7f ff ff    	mov    %eax,-0x8030(%ebp)
   31298:	8d 85 9c 7f ff ff    	lea    -0x8064(%ebp),%eax
   3129e:	83 c0 64             	add    $0x64,%eax
   312a1:	05 00 80 00 00       	add    $0x8000,%eax
   312a6:	89 85 dc 7f ff ff    	mov    %eax,-0x8024(%ebp)
   312ac:	c7 85 d8 7f ff ff 02 	movl   $0x1202,-0x8028(%ebp)
   312b3:	12 00 00 
   312b6:	8d 85 9c 7f ff ff    	lea    -0x8064(%ebp),%eax
   312bc:	a3 c8 2e 03 00       	mov    %eax,0x32ec8
   312c1:	c9                   	leave  
   312c2:	c3                   	ret    
   312c3:	90                   	nop
   312c4:	90                   	nop
   312c5:	90                   	nop
   312c6:	90                   	nop
   312c7:	90                   	nop
   312c8:	90                   	nop
   312c9:	90                   	nop
   312ca:	90                   	nop
   312cb:	90                   	nop
   312cc:	90                   	nop
   312cd:	90                   	nop
   312ce:	90                   	nop
   312cf:	90                   	nop

000312d0 <hwint00>:
   312d0:	83 ec 04             	sub    $0x4,%esp
   312d3:	60                   	pusha  
   312d4:	1e                   	push   %ds
   312d5:	06                   	push   %es
   312d6:	0f a0                	push   %fs
   312d8:	0f a8                	push   %gs
   312da:	65 fe 05 00 80 0b 00 	incb   %gs:0xb8000
   312e1:	b0 20                	mov    $0x20,%al
   312e3:	e6 20                	out    %al,$0x20
   312e5:	ff 05 20 22 03 00    	incl   0x32220
   312eb:	83 3d 20 22 03 00 00 	cmpl   $0x0,0x32220
   312f2:	75 1e                	jne    31312 <hwint00.re_entry>
   312f4:	bc 01 20 03 00       	mov    $0x32001,%esp
   312f9:	fb                   	sti    
   312fa:	e8 69 01 00 00       	call   31468 <timer_interrupt>
   312ff:	fa                   	cli    
   31300:	8b 25 c8 2e 03 00    	mov    0x32ec8,%esp
   31306:	8d 84 24 48 00 00 00 	lea    0x48(%esp),%eax
   3130d:	a3 44 2e 03 00       	mov    %eax,0x32e44

00031312 <hwint00.re_entry>:
   31312:	0f a9                	pop    %gs
   31314:	0f a1                	pop    %fs
   31316:	07                   	pop    %es
   31317:	1f                   	pop    %ds
   31318:	61                   	popa   
   31319:	83 c4 04             	add    $0x4,%esp
   3131c:	cf                   	iret   
   3131d:	90                   	nop
   3131e:	90                   	nop
   3131f:	90                   	nop

00031320 <hwint01>:
   31320:	6a 01                	push   $0x1
   31322:	e8 fe fc ff ff       	call   31025 <int_handler>
   31327:	83 c4 04             	add    $0x4,%esp
   3132a:	f4                   	hlt    
   3132b:	90                   	nop
   3132c:	90                   	nop
   3132d:	90                   	nop
   3132e:	90                   	nop
   3132f:	90                   	nop

00031330 <hwint02>:
   31330:	6a 02                	push   $0x2
   31332:	e8 ee fc ff ff       	call   31025 <int_handler>
   31337:	83 c4 04             	add    $0x4,%esp
   3133a:	f4                   	hlt    
   3133b:	90                   	nop
   3133c:	90                   	nop
   3133d:	90                   	nop
   3133e:	90                   	nop
   3133f:	90                   	nop

00031340 <hwint03>:
   31340:	6a 03                	push   $0x3
   31342:	e8 de fc ff ff       	call   31025 <int_handler>
   31347:	83 c4 04             	add    $0x4,%esp
   3134a:	f4                   	hlt    
   3134b:	90                   	nop
   3134c:	90                   	nop
   3134d:	90                   	nop
   3134e:	90                   	nop
   3134f:	90                   	nop

00031350 <hwint04>:
   31350:	6a 04                	push   $0x4
   31352:	e8 ce fc ff ff       	call   31025 <int_handler>
   31357:	83 c4 04             	add    $0x4,%esp
   3135a:	f4                   	hlt    
   3135b:	90                   	nop
   3135c:	90                   	nop
   3135d:	90                   	nop
   3135e:	90                   	nop
   3135f:	90                   	nop

00031360 <hwint05>:
   31360:	6a 05                	push   $0x5
   31362:	e8 be fc ff ff       	call   31025 <int_handler>
   31367:	83 c4 04             	add    $0x4,%esp
   3136a:	f4                   	hlt    
   3136b:	90                   	nop
   3136c:	90                   	nop
   3136d:	90                   	nop
   3136e:	90                   	nop
   3136f:	90                   	nop

00031370 <hwint06>:
   31370:	6a 06                	push   $0x6
   31372:	e8 ae fc ff ff       	call   31025 <int_handler>
   31377:	83 c4 04             	add    $0x4,%esp
   3137a:	f4                   	hlt    
   3137b:	90                   	nop
   3137c:	90                   	nop
   3137d:	90                   	nop
   3137e:	90                   	nop
   3137f:	90                   	nop

00031380 <hwint07>:
   31380:	6a 07                	push   $0x7
   31382:	e8 9e fc ff ff       	call   31025 <int_handler>
   31387:	83 c4 04             	add    $0x4,%esp
   3138a:	f4                   	hlt    
   3138b:	90                   	nop
   3138c:	90                   	nop
   3138d:	90                   	nop
   3138e:	90                   	nop
   3138f:	90                   	nop

00031390 <hwint08>:
   31390:	6a 08                	push   $0x8
   31392:	e8 8e fc ff ff       	call   31025 <int_handler>
   31397:	83 c4 04             	add    $0x4,%esp
   3139a:	f4                   	hlt    
   3139b:	90                   	nop
   3139c:	90                   	nop
   3139d:	90                   	nop
   3139e:	90                   	nop
   3139f:	90                   	nop

000313a0 <hwint09>:
   313a0:	6a 09                	push   $0x9
   313a2:	e8 7e fc ff ff       	call   31025 <int_handler>
   313a7:	83 c4 04             	add    $0x4,%esp
   313aa:	f4                   	hlt    
   313ab:	90                   	nop
   313ac:	90                   	nop
   313ad:	90                   	nop
   313ae:	90                   	nop
   313af:	90                   	nop

000313b0 <hwint10>:
   313b0:	6a 0a                	push   $0xa
   313b2:	e8 6e fc ff ff       	call   31025 <int_handler>
   313b7:	83 c4 04             	add    $0x4,%esp
   313ba:	f4                   	hlt    
   313bb:	90                   	nop
   313bc:	90                   	nop
   313bd:	90                   	nop
   313be:	90                   	nop
   313bf:	90                   	nop

000313c0 <hwint11>:
   313c0:	6a 0b                	push   $0xb
   313c2:	e8 5e fc ff ff       	call   31025 <int_handler>
   313c7:	83 c4 04             	add    $0x4,%esp
   313ca:	f4                   	hlt    
   313cb:	90                   	nop
   313cc:	90                   	nop
   313cd:	90                   	nop
   313ce:	90                   	nop
   313cf:	90                   	nop

000313d0 <hwint12>:
   313d0:	6a 0c                	push   $0xc
   313d2:	e8 4e fc ff ff       	call   31025 <int_handler>
   313d7:	83 c4 04             	add    $0x4,%esp
   313da:	f4                   	hlt    
   313db:	90                   	nop
   313dc:	90                   	nop
   313dd:	90                   	nop
   313de:	90                   	nop
   313df:	90                   	nop

000313e0 <hwint13>:
   313e0:	6a 0d                	push   $0xd
   313e2:	e8 3e fc ff ff       	call   31025 <int_handler>
   313e7:	83 c4 04             	add    $0x4,%esp
   313ea:	f4                   	hlt    
   313eb:	90                   	nop
   313ec:	90                   	nop
   313ed:	90                   	nop
   313ee:	90                   	nop
   313ef:	90                   	nop

000313f0 <hwint14>:
   313f0:	6a 0e                	push   $0xe
   313f2:	e8 2e fc ff ff       	call   31025 <int_handler>
   313f7:	83 c4 04             	add    $0x4,%esp
   313fa:	f4                   	hlt    
   313fb:	90                   	nop
   313fc:	90                   	nop
   313fd:	90                   	nop
   313fe:	90                   	nop
   313ff:	90                   	nop

00031400 <hwint15>:
   31400:	6a 0f                	push   $0xf
   31402:	e8 1e fc ff ff       	call   31025 <int_handler>
   31407:	83 c4 04             	add    $0x4,%esp
   3140a:	f4                   	hlt    

0003140b <divide_error>:
   3140b:	6a ff                	push   $0xffffffff
   3140d:	6a 00                	push   $0x0
   3140f:	eb 4e                	jmp    3145f <exception>

00031411 <debug>:
   31411:	6a ff                	push   $0xffffffff
   31413:	6a 01                	push   $0x1
   31415:	eb 48                	jmp    3145f <exception>

00031417 <nmi>:
   31417:	6a ff                	push   $0xffffffff
   31419:	6a 02                	push   $0x2
   3141b:	eb 42                	jmp    3145f <exception>

0003141d <int3>:
   3141d:	6a ff                	push   $0xffffffff
   3141f:	6a 03                	push   $0x3
   31421:	eb 3c                	jmp    3145f <exception>

00031423 <overflow>:
   31423:	6a ff                	push   $0xffffffff
   31425:	6a 04                	push   $0x4
   31427:	eb 36                	jmp    3145f <exception>

00031429 <bounds>:
   31429:	6a ff                	push   $0xffffffff
   3142b:	6a 05                	push   $0x5
   3142d:	eb 30                	jmp    3145f <exception>

0003142f <invalid_op>:
   3142f:	6a ff                	push   $0xffffffff
   31431:	6a 06                	push   $0x6
   31433:	eb 2a                	jmp    3145f <exception>

00031435 <device_not_available>:
   31435:	6a ff                	push   $0xffffffff
   31437:	6a 07                	push   $0x7
   31439:	eb 24                	jmp    3145f <exception>

0003143b <doublefault_fn>:
   3143b:	6a 08                	push   $0x8
   3143d:	eb 20                	jmp    3145f <exception>

0003143f <coprocessor_segment_overrun>:
   3143f:	6a ff                	push   $0xffffffff
   31441:	6a 09                	push   $0x9
   31443:	eb 1a                	jmp    3145f <exception>

00031445 <invalid_tss>:
   31445:	6a 0a                	push   $0xa
   31447:	eb 16                	jmp    3145f <exception>

00031449 <segment_not_present>:
   31449:	6a 0b                	push   $0xb
   3144b:	eb 12                	jmp    3145f <exception>

0003144d <stack_segment>:
   3144d:	6a 0c                	push   $0xc
   3144f:	eb 0e                	jmp    3145f <exception>

00031451 <general_protection>:
   31451:	6a 0d                	push   $0xd
   31453:	eb 0a                	jmp    3145f <exception>

00031455 <page_fault>:
   31455:	6a 0e                	push   $0xe
   31457:	eb 06                	jmp    3145f <exception>

00031459 <coprocessor_error>:
   31459:	6a ff                	push   $0xffffffff
   3145b:	6a 10                	push   $0x10
   3145d:	eb 00                	jmp    3145f <exception>

0003145f <exception>:
   3145f:	e8 dc fb ff ff       	call   31040 <exception_handler>
   31464:	83 c4 08             	add    $0x8,%esp
   31467:	f4                   	hlt    

00031468 <timer_interrupt>:
   31468:	55                   	push   %ebp
   31469:	89 e5                	mov    %esp,%ebp
   3146b:	83 ec 18             	sub    $0x18,%esp
   3146e:	c7 04 24 d4 16 03 00 	movl   $0x316d4,(%esp)
   31475:	e8 e2 f0 ff ff       	call   3055c <printk>
   3147a:	c9                   	leave  
   3147b:	c3                   	ret    
