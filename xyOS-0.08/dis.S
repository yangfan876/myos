
kernel.bin:     file format elf32-i386


Disassembly of section .text:

00030400 <_start>:
   30400:	bc 01 20 03 00       	mov    $0x32001,%esp
   30405:	0f 01 05 ce 2e 03 00 	sgdtl  0x32ece
   3040c:	e8 03 00 00 00       	call   30414 <__init__>
   30411:	fb                   	sti    
   30412:	eb fe                	jmp    30412 <_start+0x12>

00030414 <__init__>:
   30414:	55                   	push   %ebp
   30415:	89 e5                	mov    %esp,%ebp
   30417:	83 ec 28             	sub    $0x28,%esp
   3041a:	e8 59 04 00 00       	call   30878 <change_gdt>
   3041f:	c7 05 04 20 03 00 00 	movl   $0x0,0x32004
   30426:	00 00 00 
   30429:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   30430:	eb 10                	jmp    30442 <__init__+0x2e>
   30432:	c7 04 24 80 17 03 00 	movl   $0x31780,(%esp)
   30439:	e8 fe 00 00 00       	call   3053c <printk>
   3043e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   30442:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
   30449:	7e e7                	jle    30432 <__init__+0x1e>
   3044b:	c7 05 04 20 03 00 00 	movl   $0x0,0x32004
   30452:	00 00 00 
   30455:	c7 04 24 82 17 03 00 	movl   $0x31782,(%esp)
   3045c:	e8 db 00 00 00       	call   3053c <printk>
   30461:	e8 fa 02 00 00       	call   30760 <init_8259A>
   30466:	c7 04 24 9c 17 03 00 	movl   $0x3179c,(%esp)
   3046d:	e8 ca 00 00 00       	call   3053c <printk>
   30472:	e8 91 05 00 00       	call   30a08 <init_idt>
   30477:	c7 04 24 b5 17 03 00 	movl   $0x317b5,(%esp)
   3047e:	e8 b9 00 00 00       	call   3053c <printk>
   30483:	e8 bb 0e 00 00       	call   31343 <init_first_thread>
   30488:	c7 04 24 cc 17 03 00 	movl   $0x317cc,(%esp)
   3048f:	e8 a8 00 00 00       	call   3053c <printk>
   30494:	e8 1c 0f 00 00       	call   313b5 <init_second_thread>
   30499:	c7 04 24 ec 17 03 00 	movl   $0x317ec,(%esp)
   304a0:	e8 97 00 00 00       	call   3053c <printk>
   304a5:	c7 04 24 0c 18 03 00 	movl   $0x3180c,(%esp)
   304ac:	e8 8b 00 00 00       	call   3053c <printk>
   304b1:	c7 44 24 04 ff 00 00 	movl   $0xff,0x4(%esp)
   304b8:	00 
   304b9:	c7 04 24 fe 00 00 00 	movl   $0xfe,(%esp)
   304c0:	e8 6b 03 00 00       	call   30830 <op_8259A>
   304c5:	c9                   	leave  
   304c6:	c3                   	ret    
   304c7:	90                   	nop
   304c8:	90                   	nop
   304c9:	90                   	nop
   304ca:	90                   	nop
   304cb:	90                   	nop
   304cc:	90                   	nop
   304cd:	90                   	nop
   304ce:	90                   	nop
   304cf:	90                   	nop

000304d0 <disp_str>:
   304d0:	55                   	push   %ebp
   304d1:	89 e5                	mov    %esp,%ebp
   304d3:	8b 75 08             	mov    0x8(%ebp),%esi
   304d6:	8b 3d 04 20 03 00    	mov    0x32004,%edi
   304dc:	b4 0f                	mov    $0xf,%ah

000304de <disp_str.1>:
   304de:	ac                   	lods   %ds:(%esi),%al
   304df:	84 c0                	test   %al,%al
   304e1:	74 2f                	je     30512 <disp_str.2>
   304e3:	3c 0a                	cmp    $0xa,%al
   304e5:	75 16                	jne    304fd <disp_str.3>
   304e7:	50                   	push   %eax
   304e8:	89 f8                	mov    %edi,%eax
   304ea:	b3 a0                	mov    $0xa0,%bl
   304ec:	f6 f3                	div    %bl
   304ee:	25 ff 00 00 00       	and    $0xff,%eax
   304f3:	40                   	inc    %eax
   304f4:	b3 a0                	mov    $0xa0,%bl
   304f6:	f6 e3                	mul    %bl
   304f8:	89 c7                	mov    %eax,%edi
   304fa:	58                   	pop    %eax
   304fb:	eb e1                	jmp    304de <disp_str.1>

000304fd <disp_str.3>:
   304fd:	81 c7 00 80 0b 00    	add    $0xb8000,%edi
   30503:	65 66 89 07          	mov    %ax,%gs:(%edi)
   30507:	81 ef 00 80 0b 00    	sub    $0xb8000,%edi
   3050d:	83 c7 02             	add    $0x2,%edi
   30510:	eb cc                	jmp    304de <disp_str.1>

00030512 <disp_str.2>:
   30512:	89 3d 04 20 03 00    	mov    %edi,0x32004
   30518:	5d                   	pop    %ebp
   30519:	c3                   	ret    
   3051a:	90                   	nop
   3051b:	90                   	nop

0003051c <print>:
   3051c:	55                   	push   %ebp
   3051d:	89 e5                	mov    %esp,%ebp
   3051f:	83 ec 18             	sub    $0x18,%esp
   30522:	c7 04 24 b3 18 03 00 	movl   $0x318b3,(%esp)
   30529:	e8 0e 00 00 00       	call   3053c <printk>
   3052e:	c7 04 24 d1 18 03 00 	movl   $0x318d1,(%esp)
   30535:	e8 02 00 00 00       	call   3053c <printk>
   3053a:	c9                   	leave  
   3053b:	c3                   	ret    

0003053c <printk>:
   3053c:	55                   	push   %ebp
   3053d:	89 e5                	mov    %esp,%ebp
   3053f:	81 ec 28 04 00 00    	sub    $0x428,%esp
   30545:	8d 55 0c             	lea    0xc(%ebp),%edx
   30548:	8d 85 f0 fb ff ff    	lea    -0x410(%ebp),%eax
   3054e:	89 10                	mov    %edx,(%eax)
   30550:	8b 85 f0 fb ff ff    	mov    -0x410(%ebp),%eax
   30556:	89 44 24 08          	mov    %eax,0x8(%esp)
   3055a:	8b 45 08             	mov    0x8(%ebp),%eax
   3055d:	89 44 24 04          	mov    %eax,0x4(%esp)
   30561:	8d 85 f4 fb ff ff    	lea    -0x40c(%ebp),%eax
   30567:	89 04 24             	mov    %eax,(%esp)
   3056a:	e8 16 00 00 00       	call   30585 <__vprintf__>
   3056f:	89 45 f4             	mov    %eax,-0xc(%ebp)
   30572:	8d 85 f4 fb ff ff    	lea    -0x40c(%ebp),%eax
   30578:	89 04 24             	mov    %eax,(%esp)
   3057b:	e8 50 ff ff ff       	call   304d0 <disp_str>
   30580:	8b 45 f4             	mov    -0xc(%ebp),%eax
   30583:	c9                   	leave  
   30584:	c3                   	ret    

00030585 <__vprintf__>:
   30585:	55                   	push   %ebp
   30586:	89 e5                	mov    %esp,%ebp
   30588:	83 ec 30             	sub    $0x30,%esp
   3058b:	8b 45 0c             	mov    0xc(%ebp),%eax
   3058e:	89 45 fc             	mov    %eax,-0x4(%ebp)
   30591:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
   30598:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   3059f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
   305a6:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
   305ad:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
   305b4:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
   305bb:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
   305c2:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
   305c8:	e9 72 01 00 00       	jmp    3073f <__vprintf__+0x1ba>
   305cd:	8b 45 fc             	mov    -0x4(%ebp),%eax
   305d0:	0f b6 00             	movzbl (%eax),%eax
   305d3:	3c 25                	cmp    $0x25,%al
   305d5:	0f 85 4e 01 00 00    	jne    30729 <__vprintf__+0x1a4>
   305db:	8b 45 fc             	mov    -0x4(%ebp),%eax
   305de:	83 c0 01             	add    $0x1,%eax
   305e1:	0f b6 00             	movzbl (%eax),%eax
   305e4:	0f be c0             	movsbl %al,%eax
   305e7:	83 f8 64             	cmp    $0x64,%eax
   305ea:	74 3e                	je     3062a <__vprintf__+0xa5>
   305ec:	83 f8 73             	cmp    $0x73,%eax
   305ef:	0f 84 fa 00 00 00    	je     306ef <__vprintf__+0x16a>
   305f5:	83 f8 63             	cmp    $0x63,%eax
   305f8:	0f 85 39 01 00 00    	jne    30737 <__vprintf__+0x1b2>
   305fe:	8b 45 10             	mov    0x10(%ebp),%eax
   30601:	8d 50 04             	lea    0x4(%eax),%edx
   30604:	89 55 10             	mov    %edx,0x10(%ebp)
   30607:	8b 00                	mov    (%eax),%eax
   30609:	89 45 f0             	mov    %eax,-0x10(%ebp)
   3060c:	8b 45 f8             	mov    -0x8(%ebp),%eax
   3060f:	03 45 08             	add    0x8(%ebp),%eax
   30612:	8b 55 f0             	mov    -0x10(%ebp),%edx
   30615:	8b 14 95 20 20 03 00 	mov    0x32020(,%edx,4),%edx
   3061c:	0f b6 12             	movzbl (%edx),%edx
   3061f:	88 10                	mov    %dl,(%eax)
   30621:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   30625:	e9 0d 01 00 00       	jmp    30737 <__vprintf__+0x1b2>
   3062a:	8b 45 10             	mov    0x10(%ebp),%eax
   3062d:	8d 50 04             	lea    0x4(%eax),%edx
   30630:	89 55 10             	mov    %edx,0x10(%ebp)
   30633:	8b 00                	mov    (%eax),%eax
   30635:	89 45 f0             	mov    %eax,-0x10(%ebp)
   30638:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
   3063f:	8b 4d f0             	mov    -0x10(%ebp),%ecx
   30642:	ba 67 66 66 66       	mov    $0x66666667,%edx
   30647:	89 c8                	mov    %ecx,%eax
   30649:	f7 ea                	imul   %edx
   3064b:	c1 fa 02             	sar    $0x2,%edx
   3064e:	89 c8                	mov    %ecx,%eax
   30650:	c1 f8 1f             	sar    $0x1f,%eax
   30653:	29 c2                	sub    %eax,%edx
   30655:	89 d0                	mov    %edx,%eax
   30657:	c1 e0 02             	shl    $0x2,%eax
   3065a:	01 d0                	add    %edx,%eax
   3065c:	01 c0                	add    %eax,%eax
   3065e:	89 ca                	mov    %ecx,%edx
   30660:	29 c2                	sub    %eax,%edx
   30662:	8d 42 30             	lea    0x30(%edx),%eax
   30665:	8b 04 85 20 20 03 00 	mov    0x32020(,%eax,4),%eax
   3066c:	0f b6 10             	movzbl (%eax),%edx
   3066f:	8d 45 de             	lea    -0x22(%ebp),%eax
   30672:	03 45 ec             	add    -0x14(%ebp),%eax
   30675:	88 10                	mov    %dl,(%eax)
   30677:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
   3067b:	8b 4d f0             	mov    -0x10(%ebp),%ecx
   3067e:	ba 67 66 66 66       	mov    $0x66666667,%edx
   30683:	89 c8                	mov    %ecx,%eax
   30685:	f7 ea                	imul   %edx
   30687:	c1 fa 02             	sar    $0x2,%edx
   3068a:	89 c8                	mov    %ecx,%eax
   3068c:	c1 f8 1f             	sar    $0x1f,%eax
   3068f:	89 d1                	mov    %edx,%ecx
   30691:	29 c1                	sub    %eax,%ecx
   30693:	89 c8                	mov    %ecx,%eax
   30695:	89 45 f0             	mov    %eax,-0x10(%ebp)
   30698:	8b 4d f0             	mov    -0x10(%ebp),%ecx
   3069b:	ba 67 66 66 66       	mov    $0x66666667,%edx
   306a0:	89 c8                	mov    %ecx,%eax
   306a2:	f7 ea                	imul   %edx
   306a4:	c1 fa 02             	sar    $0x2,%edx
   306a7:	89 c8                	mov    %ecx,%eax
   306a9:	c1 f8 1f             	sar    $0x1f,%eax
   306ac:	29 c2                	sub    %eax,%edx
   306ae:	89 d0                	mov    %edx,%eax
   306b0:	c1 e0 02             	shl    $0x2,%eax
   306b3:	01 d0                	add    %edx,%eax
   306b5:	01 c0                	add    %eax,%eax
   306b7:	89 ca                	mov    %ecx,%edx
   306b9:	29 c2                	sub    %eax,%edx
   306bb:	85 d2                	test   %edx,%edx
   306bd:	75 80                	jne    3063f <__vprintf__+0xba>
   306bf:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
   306c3:	eb 19                	jmp    306de <__vprintf__+0x159>
   306c5:	8b 45 f8             	mov    -0x8(%ebp),%eax
   306c8:	03 45 08             	add    0x8(%ebp),%eax
   306cb:	8d 55 de             	lea    -0x22(%ebp),%edx
   306ce:	03 55 ec             	add    -0x14(%ebp),%edx
   306d1:	0f b6 12             	movzbl (%edx),%edx
   306d4:	88 10                	mov    %dl,(%eax)
   306d6:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
   306da:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
   306de:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
   306e2:	79 e1                	jns    306c5 <__vprintf__+0x140>
   306e4:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
   306e8:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   306ec:	90                   	nop
   306ed:	eb 48                	jmp    30737 <__vprintf__+0x1b2>
   306ef:	8b 45 10             	mov    0x10(%ebp),%eax
   306f2:	8d 50 04             	lea    0x4(%eax),%edx
   306f5:	89 55 10             	mov    %edx,0x10(%ebp)
   306f8:	8b 00                	mov    (%eax),%eax
   306fa:	89 45 f4             	mov    %eax,-0xc(%ebp)
   306fd:	eb 16                	jmp    30715 <__vprintf__+0x190>
   306ff:	8b 45 f8             	mov    -0x8(%ebp),%eax
   30702:	03 45 08             	add    0x8(%ebp),%eax
   30705:	8b 55 f4             	mov    -0xc(%ebp),%edx
   30708:	0f b6 12             	movzbl (%edx),%edx
   3070b:	88 10                	mov    %dl,(%eax)
   3070d:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
   30711:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   30715:	8b 45 f4             	mov    -0xc(%ebp),%eax
   30718:	0f b6 00             	movzbl (%eax),%eax
   3071b:	84 c0                	test   %al,%al
   3071d:	75 e0                	jne    306ff <__vprintf__+0x17a>
   3071f:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
   30723:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   30727:	eb 0e                	jmp    30737 <__vprintf__+0x1b2>
   30729:	8b 45 f8             	mov    -0x8(%ebp),%eax
   3072c:	03 45 08             	add    0x8(%ebp),%eax
   3072f:	8b 55 fc             	mov    -0x4(%ebp),%edx
   30732:	0f b6 12             	movzbl (%edx),%edx
   30735:	88 10                	mov    %dl,(%eax)
   30737:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
   3073b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   3073f:	8b 45 fc             	mov    -0x4(%ebp),%eax
   30742:	0f b6 00             	movzbl (%eax),%eax
   30745:	84 c0                	test   %al,%al
   30747:	0f 85 80 fe ff ff    	jne    305cd <__vprintf__+0x48>
   3074d:	8b 45 f8             	mov    -0x8(%ebp),%eax
   30750:	03 45 08             	add    0x8(%ebp),%eax
   30753:	c6 00 00             	movb   $0x0,(%eax)
   30756:	b8 01 00 00 00       	mov    $0x1,%eax
   3075b:	c9                   	leave  
   3075c:	c3                   	ret    
   3075d:	90                   	nop
   3075e:	90                   	nop
   3075f:	90                   	nop

00030760 <init_8259A>:
   30760:	55                   	push   %ebp
   30761:	89 e5                	mov    %esp,%ebp
   30763:	83 ec 18             	sub    $0x18,%esp
   30766:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
   3076d:	00 
   3076e:	c7 04 24 ff 00 00 00 	movl   $0xff,(%esp)
   30775:	e8 e6 00 00 00       	call   30860 <outb>
   3077a:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
   30781:	00 
   30782:	c7 04 24 ff 00 00 00 	movl   $0xff,(%esp)
   30789:	e8 d2 00 00 00       	call   30860 <outb>
   3078e:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
   30795:	00 
   30796:	c7 04 24 11 00 00 00 	movl   $0x11,(%esp)
   3079d:	e8 c8 00 00 00       	call   3086a <outb_pic>
   307a2:	c7 44 24 04 a0 00 00 	movl   $0xa0,0x4(%esp)
   307a9:	00 
   307aa:	c7 04 24 11 00 00 00 	movl   $0x11,(%esp)
   307b1:	e8 b4 00 00 00       	call   3086a <outb_pic>
   307b6:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
   307bd:	00 
   307be:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
   307c5:	e8 a0 00 00 00       	call   3086a <outb_pic>
   307ca:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
   307d1:	00 
   307d2:	c7 04 24 28 00 00 00 	movl   $0x28,(%esp)
   307d9:	e8 8c 00 00 00       	call   3086a <outb_pic>
   307de:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
   307e5:	00 
   307e6:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
   307ed:	e8 78 00 00 00       	call   3086a <outb_pic>
   307f2:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
   307f9:	00 
   307fa:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
   30801:	e8 64 00 00 00       	call   3086a <outb_pic>
   30806:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
   3080d:	00 
   3080e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
   30815:	e8 50 00 00 00       	call   3086a <outb_pic>
   3081a:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
   30821:	00 
   30822:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
   30829:	e8 3c 00 00 00       	call   3086a <outb_pic>
   3082e:	c9                   	leave  
   3082f:	c3                   	ret    

00030830 <op_8259A>:
   30830:	55                   	push   %ebp
   30831:	89 e5                	mov    %esp,%ebp
   30833:	83 ec 18             	sub    $0x18,%esp
   30836:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
   3083d:	00 
   3083e:	8b 45 08             	mov    0x8(%ebp),%eax
   30841:	89 04 24             	mov    %eax,(%esp)
   30844:	e8 21 00 00 00       	call   3086a <outb_pic>
   30849:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
   30850:	00 
   30851:	8b 45 0c             	mov    0xc(%ebp),%eax
   30854:	89 04 24             	mov    %eax,(%esp)
   30857:	e8 0e 00 00 00       	call   3086a <outb_pic>
   3085c:	c9                   	leave  
   3085d:	c3                   	ret    
   3085e:	90                   	nop
   3085f:	90                   	nop

00030860 <outb>:
   30860:	8b 44 24 04          	mov    0x4(%esp),%eax
   30864:	8b 54 24 08          	mov    0x8(%esp),%edx
   30868:	ee                   	out    %al,(%dx)
   30869:	c3                   	ret    

0003086a <outb_pic>:
   3086a:	8b 44 24 04          	mov    0x4(%esp),%eax
   3086e:	8b 54 24 08          	mov    0x8(%esp),%edx
   30872:	ee                   	out    %al,(%dx)
   30873:	90                   	nop
   30874:	90                   	nop
   30875:	c3                   	ret    
   30876:	90                   	nop
   30877:	90                   	nop

00030878 <change_gdt>:
   30878:	55                   	push   %ebp
   30879:	89 e5                	mov    %esp,%ebp
   3087b:	83 ec 18             	sub    $0x18,%esp
   3087e:	66 c7 05 40 22 03 00 	movw   $0x0,0x32240
   30885:	00 00 
   30887:	66 c7 05 42 22 03 00 	movw   $0x0,0x32242
   3088e:	00 00 
   30890:	c6 05 44 22 03 00 00 	movb   $0x0,0x32244
   30897:	c6 05 45 22 03 00 00 	movb   $0x0,0x32245
   3089e:	c6 05 46 22 03 00 00 	movb   $0x0,0x32246
   308a5:	c6 05 47 22 03 00 00 	movb   $0x0,0x32247
   308ac:	66 c7 05 a0 22 03 00 	movw   $0xffff,0x322a0
   308b3:	ff ff 
   308b5:	66 c7 05 a2 22 03 00 	movw   $0x0,0x322a2
   308bc:	00 00 
   308be:	c6 05 a4 22 03 00 00 	movb   $0x0,0x322a4
   308c5:	c6 05 a5 22 03 00 9a 	movb   $0x9a,0x322a5
   308cc:	c6 05 a6 22 03 00 cf 	movb   $0xcf,0x322a6
   308d3:	c6 05 a7 22 03 00 00 	movb   $0x0,0x322a7
   308da:	66 c7 05 a8 22 03 00 	movw   $0xffff,0x322a8
   308e1:	ff ff 
   308e3:	66 c7 05 aa 22 03 00 	movw   $0x0,0x322aa
   308ea:	00 00 
   308ec:	c6 05 ac 22 03 00 00 	movb   $0x0,0x322ac
   308f3:	c6 05 ad 22 03 00 93 	movb   $0x93,0x322ad
   308fa:	c6 05 ae 22 03 00 cf 	movb   $0xcf,0x322ae
   30901:	c6 05 af 22 03 00 00 	movb   $0x0,0x322af
   30908:	66 c7 05 b0 22 03 00 	movw   $0xffff,0x322b0
   3090f:	ff ff 
   30911:	66 c7 05 b2 22 03 00 	movw   $0x0,0x322b2
   30918:	00 00 
   3091a:	c6 05 b4 22 03 00 00 	movb   $0x0,0x322b4
   30921:	c6 05 b5 22 03 00 fa 	movb   $0xfa,0x322b5
   30928:	c6 05 b6 22 03 00 cf 	movb   $0xcf,0x322b6
   3092f:	c6 05 b7 22 03 00 00 	movb   $0x0,0x322b7
   30936:	66 c7 05 b8 22 03 00 	movw   $0xffff,0x322b8
   3093d:	ff ff 
   3093f:	66 c7 05 ba 22 03 00 	movw   $0x0,0x322ba
   30946:	00 00 
   30948:	c6 05 bc 22 03 00 00 	movb   $0x0,0x322bc
   3094f:	c6 05 bd 22 03 00 f3 	movb   $0xf3,0x322bd
   30956:	c6 05 be 22 03 00 cf 	movb   $0xcf,0x322be
   3095d:	c6 05 bf 22 03 00 00 	movb   $0x0,0x322bf
   30964:	66 c7 05 b8 22 03 00 	movw   $0xffff,0x322b8
   3096b:	ff ff 
   3096d:	66 c7 05 ba 22 03 00 	movw   $0x0,0x322ba
   30974:	00 00 
   30976:	c6 05 bc 22 03 00 00 	movb   $0x0,0x322bc
   3097d:	c6 05 bd 22 03 00 f3 	movb   $0xf3,0x322bd
   30984:	c6 05 be 22 03 00 cf 	movb   $0xcf,0x322be
   3098b:	c6 05 bf 22 03 00 00 	movb   $0x0,0x322bf
   30992:	c7 05 48 2e 03 00 68 	movl   $0x68,0x32e48
   30999:	00 00 00 
   3099c:	66 c7 05 a6 2e 03 00 	movw   $0x68,0x32ea6
   309a3:	68 00 
   309a5:	66 c7 05 c0 22 03 00 	movw   $0x67,0x322c0
   309ac:	67 00 
   309ae:	b8 40 2e 03 00       	mov    $0x32e40,%eax
   309b3:	66 a3 c2 22 03 00    	mov    %ax,0x322c2
   309b9:	b8 40 2e 03 00       	mov    $0x32e40,%eax
   309be:	c1 e8 10             	shr    $0x10,%eax
   309c1:	a2 c4 22 03 00       	mov    %al,0x322c4
   309c6:	c6 05 c5 22 03 00 89 	movb   $0x89,0x322c5
   309cd:	c6 05 c6 22 03 00 00 	movb   $0x0,0x322c6
   309d4:	b8 40 2e 03 00       	mov    $0x32e40,%eax
   309d9:	c1 e8 18             	shr    $0x18,%eax
   309dc:	a2 c7 22 03 00       	mov    %al,0x322c7
   309e1:	c7 45 f4 ce 2e 03 00 	movl   $0x32ece,-0xc(%ebp)
   309e8:	c7 45 f0 d0 2e 03 00 	movl   $0x32ed0,-0x10(%ebp)
   309ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
   309f2:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
   309f7:	ba 40 22 03 00       	mov    $0x32240,%edx
   309fc:	8b 45 f0             	mov    -0x10(%ebp),%eax
   309ff:	89 10                	mov    %edx,(%eax)
   30a01:	e8 fa 06 00 00       	call   31100 <jump_new_gdt>
   30a06:	c9                   	leave  
   30a07:	c3                   	ret    

00030a08 <init_idt>:
   30a08:	55                   	push   %ebp
   30a09:	89 e5                	mov    %esp,%ebp
   30a0b:	83 ec 18             	sub    $0x18,%esp
   30a0e:	b8 eb 16 03 00       	mov    $0x316eb,%eax
   30a13:	66 a3 40 26 03 00    	mov    %ax,0x32640
   30a19:	66 c7 05 42 26 03 00 	movw   $0x60,0x32642
   30a20:	60 00 
   30a22:	c6 05 44 26 03 00 00 	movb   $0x0,0x32644
   30a29:	c6 05 45 26 03 00 8e 	movb   $0x8e,0x32645
   30a30:	b8 eb 16 03 00       	mov    $0x316eb,%eax
   30a35:	c1 e8 10             	shr    $0x10,%eax
   30a38:	66 a3 46 26 03 00    	mov    %ax,0x32646
   30a3e:	b8 f1 16 03 00       	mov    $0x316f1,%eax
   30a43:	66 a3 48 26 03 00    	mov    %ax,0x32648
   30a49:	66 c7 05 4a 26 03 00 	movw   $0x60,0x3264a
   30a50:	60 00 
   30a52:	c6 05 4c 26 03 00 00 	movb   $0x0,0x3264c
   30a59:	c6 05 4d 26 03 00 8e 	movb   $0x8e,0x3264d
   30a60:	b8 f1 16 03 00       	mov    $0x316f1,%eax
   30a65:	c1 e8 10             	shr    $0x10,%eax
   30a68:	66 a3 4e 26 03 00    	mov    %ax,0x3264e
   30a6e:	b8 f7 16 03 00       	mov    $0x316f7,%eax
   30a73:	66 a3 50 26 03 00    	mov    %ax,0x32650
   30a79:	66 c7 05 52 26 03 00 	movw   $0x60,0x32652
   30a80:	60 00 
   30a82:	c6 05 54 26 03 00 00 	movb   $0x0,0x32654
   30a89:	c6 05 55 26 03 00 8e 	movb   $0x8e,0x32655
   30a90:	b8 f7 16 03 00       	mov    $0x316f7,%eax
   30a95:	c1 e8 10             	shr    $0x10,%eax
   30a98:	66 a3 56 26 03 00    	mov    %ax,0x32656
   30a9e:	b8 fd 16 03 00       	mov    $0x316fd,%eax
   30aa3:	66 a3 58 26 03 00    	mov    %ax,0x32658
   30aa9:	66 c7 05 5a 26 03 00 	movw   $0x60,0x3265a
   30ab0:	60 00 
   30ab2:	c6 05 5c 26 03 00 00 	movb   $0x0,0x3265c
   30ab9:	c6 05 5d 26 03 00 8e 	movb   $0x8e,0x3265d
   30ac0:	b8 fd 16 03 00       	mov    $0x316fd,%eax
   30ac5:	c1 e8 10             	shr    $0x10,%eax
   30ac8:	66 a3 5e 26 03 00    	mov    %ax,0x3265e
   30ace:	b8 03 17 03 00       	mov    $0x31703,%eax
   30ad3:	66 a3 60 26 03 00    	mov    %ax,0x32660
   30ad9:	66 c7 05 62 26 03 00 	movw   $0x60,0x32662
   30ae0:	60 00 
   30ae2:	c6 05 64 26 03 00 00 	movb   $0x0,0x32664
   30ae9:	c6 05 65 26 03 00 8e 	movb   $0x8e,0x32665
   30af0:	b8 03 17 03 00       	mov    $0x31703,%eax
   30af5:	c1 e8 10             	shr    $0x10,%eax
   30af8:	66 a3 66 26 03 00    	mov    %ax,0x32666
   30afe:	b8 09 17 03 00       	mov    $0x31709,%eax
   30b03:	66 a3 68 26 03 00    	mov    %ax,0x32668
   30b09:	66 c7 05 6a 26 03 00 	movw   $0x60,0x3266a
   30b10:	60 00 
   30b12:	c6 05 6c 26 03 00 00 	movb   $0x0,0x3266c
   30b19:	c6 05 6d 26 03 00 8e 	movb   $0x8e,0x3266d
   30b20:	b8 09 17 03 00       	mov    $0x31709,%eax
   30b25:	c1 e8 10             	shr    $0x10,%eax
   30b28:	66 a3 6e 26 03 00    	mov    %ax,0x3266e
   30b2e:	b8 0f 17 03 00       	mov    $0x3170f,%eax
   30b33:	66 a3 70 26 03 00    	mov    %ax,0x32670
   30b39:	66 c7 05 72 26 03 00 	movw   $0x60,0x32672
   30b40:	60 00 
   30b42:	c6 05 74 26 03 00 00 	movb   $0x0,0x32674
   30b49:	c6 05 75 26 03 00 8e 	movb   $0x8e,0x32675
   30b50:	b8 0f 17 03 00       	mov    $0x3170f,%eax
   30b55:	c1 e8 10             	shr    $0x10,%eax
   30b58:	66 a3 76 26 03 00    	mov    %ax,0x32676
   30b5e:	b8 15 17 03 00       	mov    $0x31715,%eax
   30b63:	66 a3 78 26 03 00    	mov    %ax,0x32678
   30b69:	66 c7 05 7a 26 03 00 	movw   $0x60,0x3267a
   30b70:	60 00 
   30b72:	c6 05 7c 26 03 00 00 	movb   $0x0,0x3267c
   30b79:	c6 05 7d 26 03 00 8e 	movb   $0x8e,0x3267d
   30b80:	b8 15 17 03 00       	mov    $0x31715,%eax
   30b85:	c1 e8 10             	shr    $0x10,%eax
   30b88:	66 a3 7e 26 03 00    	mov    %ax,0x3267e
   30b8e:	b8 1b 17 03 00       	mov    $0x3171b,%eax
   30b93:	66 a3 80 26 03 00    	mov    %ax,0x32680
   30b99:	66 c7 05 82 26 03 00 	movw   $0x60,0x32682
   30ba0:	60 00 
   30ba2:	c6 05 84 26 03 00 00 	movb   $0x0,0x32684
   30ba9:	c6 05 85 26 03 00 8e 	movb   $0x8e,0x32685
   30bb0:	b8 1b 17 03 00       	mov    $0x3171b,%eax
   30bb5:	c1 e8 10             	shr    $0x10,%eax
   30bb8:	66 a3 86 26 03 00    	mov    %ax,0x32686
   30bbe:	b8 1f 17 03 00       	mov    $0x3171f,%eax
   30bc3:	66 a3 88 26 03 00    	mov    %ax,0x32688
   30bc9:	66 c7 05 8a 26 03 00 	movw   $0x60,0x3268a
   30bd0:	60 00 
   30bd2:	c6 05 8c 26 03 00 00 	movb   $0x0,0x3268c
   30bd9:	c6 05 8d 26 03 00 8e 	movb   $0x8e,0x3268d
   30be0:	b8 1f 17 03 00       	mov    $0x3171f,%eax
   30be5:	c1 e8 10             	shr    $0x10,%eax
   30be8:	66 a3 8e 26 03 00    	mov    %ax,0x3268e
   30bee:	b8 25 17 03 00       	mov    $0x31725,%eax
   30bf3:	66 a3 90 26 03 00    	mov    %ax,0x32690
   30bf9:	66 c7 05 92 26 03 00 	movw   $0x60,0x32692
   30c00:	60 00 
   30c02:	c6 05 94 26 03 00 00 	movb   $0x0,0x32694
   30c09:	c6 05 95 26 03 00 8e 	movb   $0x8e,0x32695
   30c10:	b8 25 17 03 00       	mov    $0x31725,%eax
   30c15:	c1 e8 10             	shr    $0x10,%eax
   30c18:	66 a3 96 26 03 00    	mov    %ax,0x32696
   30c1e:	b8 29 17 03 00       	mov    $0x31729,%eax
   30c23:	66 a3 98 26 03 00    	mov    %ax,0x32698
   30c29:	66 c7 05 9a 26 03 00 	movw   $0x60,0x3269a
   30c30:	60 00 
   30c32:	c6 05 9c 26 03 00 00 	movb   $0x0,0x3269c
   30c39:	c6 05 9d 26 03 00 8e 	movb   $0x8e,0x3269d
   30c40:	b8 29 17 03 00       	mov    $0x31729,%eax
   30c45:	c1 e8 10             	shr    $0x10,%eax
   30c48:	66 a3 9e 26 03 00    	mov    %ax,0x3269e
   30c4e:	b8 2d 17 03 00       	mov    $0x3172d,%eax
   30c53:	66 a3 a0 26 03 00    	mov    %ax,0x326a0
   30c59:	66 c7 05 a2 26 03 00 	movw   $0x60,0x326a2
   30c60:	60 00 
   30c62:	c6 05 a4 26 03 00 00 	movb   $0x0,0x326a4
   30c69:	c6 05 a5 26 03 00 8e 	movb   $0x8e,0x326a5
   30c70:	b8 2d 17 03 00       	mov    $0x3172d,%eax
   30c75:	c1 e8 10             	shr    $0x10,%eax
   30c78:	66 a3 a6 26 03 00    	mov    %ax,0x326a6
   30c7e:	b8 31 17 03 00       	mov    $0x31731,%eax
   30c83:	66 a3 a8 26 03 00    	mov    %ax,0x326a8
   30c89:	66 c7 05 aa 26 03 00 	movw   $0x60,0x326aa
   30c90:	60 00 
   30c92:	c6 05 ac 26 03 00 00 	movb   $0x0,0x326ac
   30c99:	c6 05 ad 26 03 00 8e 	movb   $0x8e,0x326ad
   30ca0:	b8 31 17 03 00       	mov    $0x31731,%eax
   30ca5:	c1 e8 10             	shr    $0x10,%eax
   30ca8:	66 a3 ae 26 03 00    	mov    %ax,0x326ae
   30cae:	b8 35 17 03 00       	mov    $0x31735,%eax
   30cb3:	66 a3 b0 26 03 00    	mov    %ax,0x326b0
   30cb9:	66 c7 05 b2 26 03 00 	movw   $0x60,0x326b2
   30cc0:	60 00 
   30cc2:	c6 05 b4 26 03 00 00 	movb   $0x0,0x326b4
   30cc9:	c6 05 b5 26 03 00 8e 	movb   $0x8e,0x326b5
   30cd0:	b8 35 17 03 00       	mov    $0x31735,%eax
   30cd5:	c1 e8 10             	shr    $0x10,%eax
   30cd8:	66 a3 b6 26 03 00    	mov    %ax,0x326b6
   30cde:	b8 39 17 03 00       	mov    $0x31739,%eax
   30ce3:	66 a3 c0 26 03 00    	mov    %ax,0x326c0
   30ce9:	66 c7 05 c2 26 03 00 	movw   $0x60,0x326c2
   30cf0:	60 00 
   30cf2:	c6 05 c4 26 03 00 00 	movb   $0x0,0x326c4
   30cf9:	c6 05 c5 26 03 00 8e 	movb   $0x8e,0x326c5
   30d00:	b8 39 17 03 00       	mov    $0x31739,%eax
   30d05:	c1 e8 10             	shr    $0x10,%eax
   30d08:	66 a3 c6 26 03 00    	mov    %ax,0x326c6
   30d0e:	b8 a0 15 03 00       	mov    $0x315a0,%eax
   30d13:	66 a3 40 27 03 00    	mov    %ax,0x32740
   30d19:	66 c7 05 42 27 03 00 	movw   $0x60,0x32742
   30d20:	60 00 
   30d22:	c6 05 44 27 03 00 00 	movb   $0x0,0x32744
   30d29:	c6 05 45 27 03 00 8e 	movb   $0x8e,0x32745
   30d30:	b8 a0 15 03 00       	mov    $0x315a0,%eax
   30d35:	c1 e8 10             	shr    $0x10,%eax
   30d38:	66 a3 46 27 03 00    	mov    %ax,0x32746
   30d3e:	b8 00 16 03 00       	mov    $0x31600,%eax
   30d43:	66 a3 48 27 03 00    	mov    %ax,0x32748
   30d49:	66 c7 05 4a 27 03 00 	movw   $0x60,0x3274a
   30d50:	60 00 
   30d52:	c6 05 4c 27 03 00 00 	movb   $0x0,0x3274c
   30d59:	c6 05 4d 27 03 00 8e 	movb   $0x8e,0x3274d
   30d60:	b8 00 16 03 00       	mov    $0x31600,%eax
   30d65:	c1 e8 10             	shr    $0x10,%eax
   30d68:	66 a3 4e 27 03 00    	mov    %ax,0x3274e
   30d6e:	b8 10 16 03 00       	mov    $0x31610,%eax
   30d73:	66 a3 50 27 03 00    	mov    %ax,0x32750
   30d79:	66 c7 05 52 27 03 00 	movw   $0x60,0x32752
   30d80:	60 00 
   30d82:	c6 05 54 27 03 00 00 	movb   $0x0,0x32754
   30d89:	c6 05 55 27 03 00 8e 	movb   $0x8e,0x32755
   30d90:	b8 10 16 03 00       	mov    $0x31610,%eax
   30d95:	c1 e8 10             	shr    $0x10,%eax
   30d98:	66 a3 56 27 03 00    	mov    %ax,0x32756
   30d9e:	b8 20 16 03 00       	mov    $0x31620,%eax
   30da3:	66 a3 58 27 03 00    	mov    %ax,0x32758
   30da9:	66 c7 05 5a 27 03 00 	movw   $0x60,0x3275a
   30db0:	60 00 
   30db2:	c6 05 5c 27 03 00 00 	movb   $0x0,0x3275c
   30db9:	c6 05 5d 27 03 00 8e 	movb   $0x8e,0x3275d
   30dc0:	b8 20 16 03 00       	mov    $0x31620,%eax
   30dc5:	c1 e8 10             	shr    $0x10,%eax
   30dc8:	66 a3 5e 27 03 00    	mov    %ax,0x3275e
   30dce:	b8 30 16 03 00       	mov    $0x31630,%eax
   30dd3:	66 a3 60 27 03 00    	mov    %ax,0x32760
   30dd9:	66 c7 05 62 27 03 00 	movw   $0x60,0x32762
   30de0:	60 00 
   30de2:	c6 05 64 27 03 00 00 	movb   $0x0,0x32764
   30de9:	c6 05 65 27 03 00 8e 	movb   $0x8e,0x32765
   30df0:	b8 30 16 03 00       	mov    $0x31630,%eax
   30df5:	c1 e8 10             	shr    $0x10,%eax
   30df8:	66 a3 66 27 03 00    	mov    %ax,0x32766
   30dfe:	b8 40 16 03 00       	mov    $0x31640,%eax
   30e03:	66 a3 68 27 03 00    	mov    %ax,0x32768
   30e09:	66 c7 05 6a 27 03 00 	movw   $0x60,0x3276a
   30e10:	60 00 
   30e12:	c6 05 6c 27 03 00 00 	movb   $0x0,0x3276c
   30e19:	c6 05 6d 27 03 00 8e 	movb   $0x8e,0x3276d
   30e20:	b8 40 16 03 00       	mov    $0x31640,%eax
   30e25:	c1 e8 10             	shr    $0x10,%eax
   30e28:	66 a3 6e 27 03 00    	mov    %ax,0x3276e
   30e2e:	b8 50 16 03 00       	mov    $0x31650,%eax
   30e33:	66 a3 70 27 03 00    	mov    %ax,0x32770
   30e39:	66 c7 05 72 27 03 00 	movw   $0x60,0x32772
   30e40:	60 00 
   30e42:	c6 05 74 27 03 00 00 	movb   $0x0,0x32774
   30e49:	c6 05 75 27 03 00 8e 	movb   $0x8e,0x32775
   30e50:	b8 50 16 03 00       	mov    $0x31650,%eax
   30e55:	c1 e8 10             	shr    $0x10,%eax
   30e58:	66 a3 76 27 03 00    	mov    %ax,0x32776
   30e5e:	b8 60 16 03 00       	mov    $0x31660,%eax
   30e63:	66 a3 78 27 03 00    	mov    %ax,0x32778
   30e69:	66 c7 05 7a 27 03 00 	movw   $0x60,0x3277a
   30e70:	60 00 
   30e72:	c6 05 7c 27 03 00 00 	movb   $0x0,0x3277c
   30e79:	c6 05 7d 27 03 00 8e 	movb   $0x8e,0x3277d
   30e80:	b8 60 16 03 00       	mov    $0x31660,%eax
   30e85:	c1 e8 10             	shr    $0x10,%eax
   30e88:	66 a3 7e 27 03 00    	mov    %ax,0x3277e
   30e8e:	b8 70 16 03 00       	mov    $0x31670,%eax
   30e93:	66 a3 80 27 03 00    	mov    %ax,0x32780
   30e99:	66 c7 05 82 27 03 00 	movw   $0x60,0x32782
   30ea0:	60 00 
   30ea2:	c6 05 84 27 03 00 00 	movb   $0x0,0x32784
   30ea9:	c6 05 85 27 03 00 8e 	movb   $0x8e,0x32785
   30eb0:	b8 70 16 03 00       	mov    $0x31670,%eax
   30eb5:	c1 e8 10             	shr    $0x10,%eax
   30eb8:	66 a3 86 27 03 00    	mov    %ax,0x32786
   30ebe:	b8 80 16 03 00       	mov    $0x31680,%eax
   30ec3:	66 a3 88 27 03 00    	mov    %ax,0x32788
   30ec9:	66 c7 05 8a 27 03 00 	movw   $0x60,0x3278a
   30ed0:	60 00 
   30ed2:	c6 05 8c 27 03 00 00 	movb   $0x0,0x3278c
   30ed9:	c6 05 8d 27 03 00 8e 	movb   $0x8e,0x3278d
   30ee0:	b8 80 16 03 00       	mov    $0x31680,%eax
   30ee5:	c1 e8 10             	shr    $0x10,%eax
   30ee8:	66 a3 8e 27 03 00    	mov    %ax,0x3278e
   30eee:	b8 90 16 03 00       	mov    $0x31690,%eax
   30ef3:	66 a3 90 27 03 00    	mov    %ax,0x32790
   30ef9:	66 c7 05 92 27 03 00 	movw   $0x60,0x32792
   30f00:	60 00 
   30f02:	c6 05 94 27 03 00 00 	movb   $0x0,0x32794
   30f09:	c6 05 95 27 03 00 8e 	movb   $0x8e,0x32795
   30f10:	b8 90 16 03 00       	mov    $0x31690,%eax
   30f15:	c1 e8 10             	shr    $0x10,%eax
   30f18:	66 a3 96 27 03 00    	mov    %ax,0x32796
   30f1e:	b8 a0 16 03 00       	mov    $0x316a0,%eax
   30f23:	66 a3 98 27 03 00    	mov    %ax,0x32798
   30f29:	66 c7 05 9a 27 03 00 	movw   $0x60,0x3279a
   30f30:	60 00 
   30f32:	c6 05 9c 27 03 00 00 	movb   $0x0,0x3279c
   30f39:	c6 05 9d 27 03 00 8e 	movb   $0x8e,0x3279d
   30f40:	b8 a0 16 03 00       	mov    $0x316a0,%eax
   30f45:	c1 e8 10             	shr    $0x10,%eax
   30f48:	66 a3 9e 27 03 00    	mov    %ax,0x3279e
   30f4e:	b8 b0 16 03 00       	mov    $0x316b0,%eax
   30f53:	66 a3 a0 27 03 00    	mov    %ax,0x327a0
   30f59:	66 c7 05 a2 27 03 00 	movw   $0x60,0x327a2
   30f60:	60 00 
   30f62:	c6 05 a4 27 03 00 00 	movb   $0x0,0x327a4
   30f69:	c6 05 a5 27 03 00 8e 	movb   $0x8e,0x327a5
   30f70:	b8 b0 16 03 00       	mov    $0x316b0,%eax
   30f75:	c1 e8 10             	shr    $0x10,%eax
   30f78:	66 a3 a6 27 03 00    	mov    %ax,0x327a6
   30f7e:	b8 c0 16 03 00       	mov    $0x316c0,%eax
   30f83:	66 a3 a8 27 03 00    	mov    %ax,0x327a8
   30f89:	66 c7 05 aa 27 03 00 	movw   $0x60,0x327aa
   30f90:	60 00 
   30f92:	c6 05 ac 27 03 00 00 	movb   $0x0,0x327ac
   30f99:	c6 05 ad 27 03 00 8e 	movb   $0x8e,0x327ad
   30fa0:	b8 c0 16 03 00       	mov    $0x316c0,%eax
   30fa5:	c1 e8 10             	shr    $0x10,%eax
   30fa8:	66 a3 ae 27 03 00    	mov    %ax,0x327ae
   30fae:	b8 d0 16 03 00       	mov    $0x316d0,%eax
   30fb3:	66 a3 b0 27 03 00    	mov    %ax,0x327b0
   30fb9:	66 c7 05 b2 27 03 00 	movw   $0x60,0x327b2
   30fc0:	60 00 
   30fc2:	c6 05 b4 27 03 00 00 	movb   $0x0,0x327b4
   30fc9:	c6 05 b5 27 03 00 8e 	movb   $0x8e,0x327b5
   30fd0:	b8 d0 16 03 00       	mov    $0x316d0,%eax
   30fd5:	c1 e8 10             	shr    $0x10,%eax
   30fd8:	66 a3 b6 27 03 00    	mov    %ax,0x327b6
   30fde:	b8 e0 16 03 00       	mov    $0x316e0,%eax
   30fe3:	66 a3 b8 27 03 00    	mov    %ax,0x327b8
   30fe9:	66 c7 05 ba 27 03 00 	movw   $0x60,0x327ba
   30ff0:	60 00 
   30ff2:	c6 05 bc 27 03 00 00 	movb   $0x0,0x327bc
   30ff9:	c6 05 bd 27 03 00 8e 	movb   $0x8e,0x327bd
   31000:	b8 e0 16 03 00       	mov    $0x316e0,%eax
   31005:	c1 e8 10             	shr    $0x10,%eax
   31008:	66 a3 be 27 03 00    	mov    %ax,0x327be
   3100e:	c7 45 f4 c8 2e 03 00 	movl   $0x32ec8,-0xc(%ebp)
   31015:	c7 45 f0 ca 2e 03 00 	movl   $0x32eca,-0x10(%ebp)
   3101c:	8b 45 f4             	mov    -0xc(%ebp),%eax
   3101f:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
   31024:	ba 40 26 03 00       	mov    $0x32640,%edx
   31029:	8b 45 f0             	mov    -0x10(%ebp),%eax
   3102c:	89 10                	mov    %edx,(%eax)
   3102e:	e8 f4 00 00 00       	call   31127 <load_idt>
   31033:	c9                   	leave  
   31034:	c3                   	ret    

00031035 <int_handler>:
   31035:	55                   	push   %ebp
   31036:	89 e5                	mov    %esp,%ebp
   31038:	83 ec 18             	sub    $0x18,%esp
   3103b:	8b 45 08             	mov    0x8(%ebp),%eax
   3103e:	89 44 24 04          	mov    %eax,0x4(%esp)
   31042:	c7 04 24 00 19 03 00 	movl   $0x31900,(%esp)
   31049:	e8 ee f4 ff ff       	call   3053c <printk>
   3104e:	c9                   	leave  
   3104f:	c3                   	ret    

00031050 <exception_handler>:
   31050:	55                   	push   %ebp
   31051:	89 e5                	mov    %esp,%ebp
   31053:	57                   	push   %edi
   31054:	56                   	push   %esi
   31055:	53                   	push   %ebx
   31056:	83 ec 7c             	sub    $0x7c,%esp
   31059:	8d 55 94             	lea    -0x6c(%ebp),%edx
   3105c:	bb c0 19 03 00       	mov    $0x319c0,%ebx
   31061:	b8 14 00 00 00       	mov    $0x14,%eax
   31066:	89 d7                	mov    %edx,%edi
   31068:	89 de                	mov    %ebx,%esi
   3106a:	89 c1                	mov    %eax,%ecx
   3106c:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
   3106e:	c7 05 04 20 03 00 00 	movl   $0x0,0x32004
   31075:	00 00 00 
   31078:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
   3107f:	eb 10                	jmp    31091 <exception_handler+0x41>
   31081:	c7 04 24 16 19 03 00 	movl   $0x31916,(%esp)
   31088:	e8 af f4 ff ff       	call   3053c <printk>
   3108d:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
   31091:	81 7d e4 8f 01 00 00 	cmpl   $0x18f,-0x1c(%ebp)
   31098:	7e e7                	jle    31081 <exception_handler+0x31>
   3109a:	c7 05 04 20 03 00 00 	movl   $0x0,0x32004
   310a1:	00 00 00 
   310a4:	8b 45 08             	mov    0x8(%ebp),%eax
   310a7:	8b 44 85 94          	mov    -0x6c(%ebp,%eax,4),%eax
   310ab:	89 44 24 04          	mov    %eax,0x4(%esp)
   310af:	c7 04 24 18 19 03 00 	movl   $0x31918,(%esp)
   310b6:	e8 81 f4 ff ff       	call   3053c <printk>
   310bb:	8b 45 18             	mov    0x18(%ebp),%eax
   310be:	89 44 24 0c          	mov    %eax,0xc(%esp)
   310c2:	8b 45 14             	mov    0x14(%ebp),%eax
   310c5:	89 44 24 08          	mov    %eax,0x8(%esp)
   310c9:	8b 45 10             	mov    0x10(%ebp),%eax
   310cc:	89 44 24 04          	mov    %eax,0x4(%esp)
   310d0:	c7 04 24 27 19 03 00 	movl   $0x31927,(%esp)
   310d7:	e8 60 f4 ff ff       	call   3053c <printk>
   310dc:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
   310e0:	74 13                	je     310f5 <exception_handler+0xa5>
   310e2:	8b 45 0c             	mov    0xc(%ebp),%eax
   310e5:	89 44 24 04          	mov    %eax,0x4(%esp)
   310e9:	c7 04 24 43 19 03 00 	movl   $0x31943,(%esp)
   310f0:	e8 47 f4 ff ff       	call   3053c <printk>
   310f5:	83 c4 7c             	add    $0x7c,%esp
   310f8:	5b                   	pop    %ebx
   310f9:	5e                   	pop    %esi
   310fa:	5f                   	pop    %edi
   310fb:	5d                   	pop    %ebp
   310fc:	c3                   	ret    
   310fd:	90                   	nop
   310fe:	90                   	nop
   310ff:	90                   	nop

00031100 <jump_new_gdt>:
   31100:	0f 01 15 ce 2e 03 00 	lgdtl  0x32ece
   31107:	66 b8 68 00          	mov    $0x68,%ax
   3110b:	8e d8                	mov    %eax,%ds
   3110d:	8e c0                	mov    %eax,%es
   3110f:	8e d0                	mov    %eax,%ss
   31111:	8e e0                	mov    %eax,%fs
   31113:	8e e8                	mov    %eax,%gs
   31115:	31 c0                	xor    %eax,%eax
   31117:	66 b8 80 00          	mov    $0x80,%ax
   3111b:	0f 00 d8             	ltr    %ax
   3111e:	ea 26 11 03 00 60 00 	ljmp   $0x60,$0x31126
   31125:	c3                   	ret    

00031126 <use_new_gdt>:
   31126:	c3                   	ret    

00031127 <load_idt>:
   31127:	0f 01 1d c8 2e 03 00 	lidtl  0x32ec8
   3112e:	c3                   	ret    
   3112f:	90                   	nop

00031130 <strncpy>:
   31130:	55                   	push   %ebp
   31131:	89 e5                	mov    %esp,%ebp
   31133:	83 ec 10             	sub    $0x10,%esp
   31136:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
   3113d:	eb 19                	jmp    31158 <strncpy+0x28>
   3113f:	8b 45 fc             	mov    -0x4(%ebp),%eax
   31142:	8b 55 08             	mov    0x8(%ebp),%edx
   31145:	01 c2                	add    %eax,%edx
   31147:	8b 45 fc             	mov    -0x4(%ebp),%eax
   3114a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
   3114d:	01 c8                	add    %ecx,%eax
   3114f:	0f b6 00             	movzbl (%eax),%eax
   31152:	88 02                	mov    %al,(%edx)
   31154:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   31158:	8b 45 fc             	mov    -0x4(%ebp),%eax
   3115b:	3b 45 10             	cmp    0x10(%ebp),%eax
   3115e:	73 20                	jae    31180 <strncpy+0x50>
   31160:	8b 45 fc             	mov    -0x4(%ebp),%eax
   31163:	8b 55 0c             	mov    0xc(%ebp),%edx
   31166:	01 d0                	add    %edx,%eax
   31168:	0f b6 00             	movzbl (%eax),%eax
   3116b:	84 c0                	test   %al,%al
   3116d:	75 d0                	jne    3113f <strncpy+0xf>
   3116f:	eb 0f                	jmp    31180 <strncpy+0x50>
   31171:	8b 45 fc             	mov    -0x4(%ebp),%eax
   31174:	8b 55 08             	mov    0x8(%ebp),%edx
   31177:	01 d0                	add    %edx,%eax
   31179:	c6 00 00             	movb   $0x0,(%eax)
   3117c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   31180:	8b 45 fc             	mov    -0x4(%ebp),%eax
   31183:	3b 45 10             	cmp    0x10(%ebp),%eax
   31186:	72 e9                	jb     31171 <strncpy+0x41>
   31188:	b8 01 00 00 00       	mov    $0x1,%eax
   3118d:	c9                   	leave  
   3118e:	c3                   	ret    

0003118f <testA>:
   3118f:	55                   	push   %ebp
   31190:	89 e5                	mov    %esp,%ebp
   31192:	83 ec 28             	sub    $0x28,%esp
   31195:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   3119c:	eb 10                	jmp    311ae <testA+0x1f>
   3119e:	c7 04 24 10 1a 03 00 	movl   $0x31a10,(%esp)
   311a5:	e8 92 f3 ff ff       	call   3053c <printk>
   311aa:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   311ae:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
   311b2:	7e ea                	jle    3119e <testA+0xf>
   311b4:	eb fe                	jmp    311b4 <testA+0x25>

000311b6 <testB>:
   311b6:	55                   	push   %ebp
   311b7:	89 e5                	mov    %esp,%ebp
   311b9:	83 ec 28             	sub    $0x28,%esp
   311bc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   311c3:	eb 10                	jmp    311d5 <testB+0x1f>
   311c5:	c7 04 24 12 1a 03 00 	movl   $0x31a12,(%esp)
   311cc:	e8 6b f3 ff ff       	call   3053c <printk>
   311d1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   311d5:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
   311d9:	7e ea                	jle    311c5 <testB+0xf>
   311db:	eb fe                	jmp    311db <testB+0x25>

000311dd <wait>:
   311dd:	55                   	push   %ebp
   311de:	89 e5                	mov    %esp,%ebp
   311e0:	83 ec 10             	sub    $0x10,%esp
   311e3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
   311ea:	eb 30                	jmp    3121c <wait+0x3f>
   311ec:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
   311f3:	eb 1a                	jmp    3120f <wait+0x32>
   311f5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   311fc:	eb 04                	jmp    31202 <wait+0x25>
   311fe:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   31202:	81 7d f4 f3 01 00 00 	cmpl   $0x1f3,-0xc(%ebp)
   31209:	7e f3                	jle    311fe <wait+0x21>
   3120b:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
   3120f:	81 7d f8 87 13 00 00 	cmpl   $0x1387,-0x8(%ebp)
   31216:	7e dd                	jle    311f5 <wait+0x18>
   31218:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   3121c:	8b 55 08             	mov    0x8(%ebp),%edx
   3121f:	89 d0                	mov    %edx,%eax
   31221:	01 c0                	add    %eax,%eax
   31223:	01 d0                	add    %edx,%eax
   31225:	3b 45 fc             	cmp    -0x4(%ebp),%eax
   31228:	7f c2                	jg     311ec <wait+0xf>
   3122a:	c9                   	leave  
   3122b:	c3                   	ret    

0003122c <list_init>:
   3122c:	55                   	push   %ebp
   3122d:	89 e5                	mov    %esp,%ebp
   3122f:	8b 45 08             	mov    0x8(%ebp),%eax
   31232:	8d 50 08             	lea    0x8(%eax),%edx
   31235:	8b 45 08             	mov    0x8(%ebp),%eax
   31238:	89 50 04             	mov    %edx,0x4(%eax)
   3123b:	8b 45 08             	mov    0x8(%ebp),%eax
   3123e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
   31244:	8b 55 08             	mov    0x8(%ebp),%edx
   31247:	8b 45 08             	mov    0x8(%ebp),%eax
   3124a:	89 50 08             	mov    %edx,0x8(%eax)
   3124d:	8b 45 08             	mov    0x8(%ebp),%eax
   31250:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
   31257:	b8 01 00 00 00       	mov    $0x1,%eax
   3125c:	5d                   	pop    %ebp
   3125d:	c3                   	ret    

0003125e <list_empty>:
   3125e:	55                   	push   %ebp
   3125f:	89 e5                	mov    %esp,%ebp
   31261:	8b 45 08             	mov    0x8(%ebp),%eax
   31264:	8b 40 04             	mov    0x4(%eax),%eax
   31267:	8b 55 08             	mov    0x8(%ebp),%edx
   3126a:	83 c2 08             	add    $0x8,%edx
   3126d:	39 d0                	cmp    %edx,%eax
   3126f:	75 14                	jne    31285 <list_empty+0x27>
   31271:	8b 45 08             	mov    0x8(%ebp),%eax
   31274:	8b 50 08             	mov    0x8(%eax),%edx
   31277:	8b 45 08             	mov    0x8(%ebp),%eax
   3127a:	39 c2                	cmp    %eax,%edx
   3127c:	75 07                	jne    31285 <list_empty+0x27>
   3127e:	b8 01 00 00 00       	mov    $0x1,%eax
   31283:	eb 05                	jmp    3128a <list_empty+0x2c>
   31285:	b8 00 00 00 00       	mov    $0x0,%eax
   3128a:	5d                   	pop    %ebp
   3128b:	c3                   	ret    

0003128c <list_insert_next>:
   3128c:	55                   	push   %ebp
   3128d:	89 e5                	mov    %esp,%ebp
   3128f:	8b 45 08             	mov    0x8(%ebp),%eax
   31292:	8b 50 04             	mov    0x4(%eax),%edx
   31295:	8b 45 0c             	mov    0xc(%ebp),%eax
   31298:	89 50 04             	mov    %edx,0x4(%eax)
   3129b:	8b 45 0c             	mov    0xc(%ebp),%eax
   3129e:	8b 55 08             	mov    0x8(%ebp),%edx
   312a1:	89 10                	mov    %edx,(%eax)
   312a3:	8b 45 08             	mov    0x8(%ebp),%eax
   312a6:	8b 40 04             	mov    0x4(%eax),%eax
   312a9:	8b 55 0c             	mov    0xc(%ebp),%edx
   312ac:	89 10                	mov    %edx,(%eax)
   312ae:	8b 45 08             	mov    0x8(%ebp),%eax
   312b1:	8b 55 0c             	mov    0xc(%ebp),%edx
   312b4:	89 50 04             	mov    %edx,0x4(%eax)
   312b7:	b8 01 00 00 00       	mov    $0x1,%eax
   312bc:	5d                   	pop    %ebp
   312bd:	c3                   	ret    

000312be <list_insert_prev>:
   312be:	55                   	push   %ebp
   312bf:	89 e5                	mov    %esp,%ebp
   312c1:	8b 45 08             	mov    0x8(%ebp),%eax
   312c4:	8b 55 0c             	mov    0xc(%ebp),%edx
   312c7:	89 50 04             	mov    %edx,0x4(%eax)
   312ca:	8b 45 0c             	mov    0xc(%ebp),%eax
   312cd:	8b 10                	mov    (%eax),%edx
   312cf:	8b 45 08             	mov    0x8(%ebp),%eax
   312d2:	89 10                	mov    %edx,(%eax)
   312d4:	8b 45 0c             	mov    0xc(%ebp),%eax
   312d7:	8b 00                	mov    (%eax),%eax
   312d9:	8b 55 08             	mov    0x8(%ebp),%edx
   312dc:	89 50 04             	mov    %edx,0x4(%eax)
   312df:	8b 45 0c             	mov    0xc(%ebp),%eax
   312e2:	8b 55 08             	mov    0x8(%ebp),%edx
   312e5:	89 10                	mov    %edx,(%eax)
   312e7:	b8 01 00 00 00       	mov    $0x1,%eax
   312ec:	5d                   	pop    %ebp
   312ed:	c3                   	ret    

000312ee <list_insert_back>:
   312ee:	55                   	push   %ebp
   312ef:	89 e5                	mov    %esp,%ebp
   312f1:	83 ec 08             	sub    $0x8,%esp
   312f4:	8b 45 0c             	mov    0xc(%ebp),%eax
   312f7:	83 c0 08             	add    $0x8,%eax
   312fa:	89 44 24 04          	mov    %eax,0x4(%esp)
   312fe:	8b 45 08             	mov    0x8(%ebp),%eax
   31301:	89 04 24             	mov    %eax,(%esp)
   31304:	e8 b5 ff ff ff       	call   312be <list_insert_prev>
   31309:	c9                   	leave  
   3130a:	c3                   	ret    

0003130b <list_remove>:
   3130b:	55                   	push   %ebp
   3130c:	89 e5                	mov    %esp,%ebp
   3130e:	8b 45 08             	mov    0x8(%ebp),%eax
   31311:	8b 00                	mov    (%eax),%eax
   31313:	8b 55 08             	mov    0x8(%ebp),%edx
   31316:	8b 52 04             	mov    0x4(%edx),%edx
   31319:	89 50 04             	mov    %edx,0x4(%eax)
   3131c:	8b 45 08             	mov    0x8(%ebp),%eax
   3131f:	8b 40 04             	mov    0x4(%eax),%eax
   31322:	8b 55 08             	mov    0x8(%ebp),%edx
   31325:	8b 12                	mov    (%edx),%edx
   31327:	89 10                	mov    %edx,(%eax)
   31329:	8b 45 08             	mov    0x8(%ebp),%eax
   3132c:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
   31333:	8b 45 08             	mov    0x8(%ebp),%eax
   31336:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
   3133c:	b8 01 00 00 00       	mov    $0x1,%eax
   31341:	5d                   	pop    %ebp
   31342:	c3                   	ret    

00031343 <init_first_thread>:
   31343:	55                   	push   %ebp
   31344:	89 e5                	mov    %esp,%ebp
   31346:	83 ec 28             	sub    $0x28,%esp
   31349:	c7 04 24 a8 2e 03 00 	movl   $0x32ea8,(%esp)
   31350:	e8 d7 fe ff ff       	call   3122c <list_init>
   31355:	c7 04 24 b8 2e 03 00 	movl   $0x32eb8,(%esp)
   3135c:	e8 cb fe ff ff       	call   3122c <list_init>
   31361:	c7 44 24 0c 8f 11 03 	movl   $0x3118f,0xc(%esp)
   31368:	00 
   31369:	c7 44 24 08 14 1a 03 	movl   $0x31a14,0x8(%esp)
   31370:	00 
   31371:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
   31378:	00 
   31379:	c7 04 24 60 af 03 00 	movl   $0x3af60,(%esp)
   31380:	e8 8a 00 00 00       	call   3140f <init_thread>
   31385:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31388:	c7 44 24 04 b8 2e 03 	movl   $0x32eb8,0x4(%esp)
   3138f:	00 
   31390:	c7 04 24 c8 af 03 00 	movl   $0x3afc8,(%esp)
   31397:	e8 63 01 00 00       	call   314ff <list_insert_by_pri>
   3139c:	c7 44 24 04 a8 2e 03 	movl   $0x32ea8,0x4(%esp)
   313a3:	00 
   313a4:	c7 04 24 d0 af 03 00 	movl   $0x3afd0,(%esp)
   313ab:	e8 3e ff ff ff       	call   312ee <list_insert_back>
   313b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
   313b3:	c9                   	leave  
   313b4:	c3                   	ret    

000313b5 <init_second_thread>:
   313b5:	55                   	push   %ebp
   313b6:	89 e5                	mov    %esp,%ebp
   313b8:	83 ec 28             	sub    $0x28,%esp
   313bb:	c7 44 24 0c b6 11 03 	movl   $0x311b6,0xc(%esp)
   313c2:	00 
   313c3:	c7 44 24 08 1a 1a 03 	movl   $0x31a1a,0x8(%esp)
   313ca:	00 
   313cb:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
   313d2:	00 
   313d3:	c7 04 24 e0 2e 03 00 	movl   $0x32ee0,(%esp)
   313da:	e8 30 00 00 00       	call   3140f <init_thread>
   313df:	89 45 f4             	mov    %eax,-0xc(%ebp)
   313e2:	c7 44 24 04 b8 2e 03 	movl   $0x32eb8,0x4(%esp)
   313e9:	00 
   313ea:	c7 04 24 48 2f 03 00 	movl   $0x32f48,(%esp)
   313f1:	e8 09 01 00 00       	call   314ff <list_insert_by_pri>
   313f6:	c7 44 24 04 a8 2e 03 	movl   $0x32ea8,0x4(%esp)
   313fd:	00 
   313fe:	c7 04 24 50 2f 03 00 	movl   $0x32f50,(%esp)
   31405:	e8 e4 fe ff ff       	call   312ee <list_insert_back>
   3140a:	8b 45 f4             	mov    -0xc(%ebp),%eax
   3140d:	c9                   	leave  
   3140e:	c3                   	ret    

0003140f <init_thread>:
   3140f:	55                   	push   %ebp
   31410:	89 e5                	mov    %esp,%ebp
   31412:	83 ec 0c             	sub    $0xc,%esp
   31415:	a1 24 22 03 00       	mov    0x32224,%eax
   3141a:	89 c2                	mov    %eax,%edx
   3141c:	8b 45 08             	mov    0x8(%ebp),%eax
   3141f:	89 50 38             	mov    %edx,0x38(%eax)
   31422:	a1 28 22 03 00       	mov    0x32228,%eax
   31427:	89 c2                	mov    %eax,%edx
   31429:	8b 45 08             	mov    0x8(%ebp),%eax
   3142c:	89 10                	mov    %edx,(%eax)
   3142e:	a1 28 22 03 00       	mov    0x32228,%eax
   31433:	89 c2                	mov    %eax,%edx
   31435:	8b 45 08             	mov    0x8(%ebp),%eax
   31438:	89 50 04             	mov    %edx,0x4(%eax)
   3143b:	a1 28 22 03 00       	mov    0x32228,%eax
   31440:	89 c2                	mov    %eax,%edx
   31442:	8b 45 08             	mov    0x8(%ebp),%eax
   31445:	89 50 08             	mov    %edx,0x8(%eax)
   31448:	a1 28 22 03 00       	mov    0x32228,%eax
   3144d:	89 c2                	mov    %eax,%edx
   3144f:	8b 45 08             	mov    0x8(%ebp),%eax
   31452:	89 50 0c             	mov    %edx,0xc(%eax)
   31455:	a1 28 22 03 00       	mov    0x32228,%eax
   3145a:	89 c2                	mov    %eax,%edx
   3145c:	8b 45 08             	mov    0x8(%ebp),%eax
   3145f:	89 50 44             	mov    %edx,0x44(%eax)
   31462:	8b 55 14             	mov    0x14(%ebp),%edx
   31465:	8b 45 08             	mov    0x8(%ebp),%eax
   31468:	89 50 34             	mov    %edx,0x34(%eax)
   3146b:	8b 45 08             	mov    0x8(%ebp),%eax
   3146e:	05 78 80 00 00       	add    $0x8078,%eax
   31473:	89 c2                	mov    %eax,%edx
   31475:	8b 45 08             	mov    0x8(%ebp),%eax
   31478:	89 50 40             	mov    %edx,0x40(%eax)
   3147b:	8b 45 08             	mov    0x8(%ebp),%eax
   3147e:	c7 40 3c 02 12 00 00 	movl   $0x1202,0x3c(%eax)
   31485:	8b 45 08             	mov    0x8(%ebp),%eax
   31488:	8d 50 4c             	lea    0x4c(%eax),%edx
   3148b:	c7 44 24 08 14 00 00 	movl   $0x14,0x8(%esp)
   31492:	00 
   31493:	8b 45 10             	mov    0x10(%ebp),%eax
   31496:	89 44 24 04          	mov    %eax,0x4(%esp)
   3149a:	89 14 24             	mov    %edx,(%esp)
   3149d:	e8 8e fc ff ff       	call   31130 <strncpy>
   314a2:	8b 45 08             	mov    0x8(%ebp),%eax
   314a5:	c7 40 64 04 00 00 00 	movl   $0x4,0x64(%eax)
   314ac:	b8 01 00 00 00       	mov    $0x1,%eax
   314b1:	c9                   	leave  
   314b2:	c3                   	ret    

000314b3 <next_thread_to_run>:
   314b3:	55                   	push   %ebp
   314b4:	89 e5                	mov    %esp,%ebp
   314b6:	83 ec 18             	sub    $0x18,%esp
   314b9:	c7 04 24 b8 2e 03 00 	movl   $0x32eb8,(%esp)
   314c0:	e8 99 fd ff ff       	call   3125e <list_empty>
   314c5:	85 c0                	test   %eax,%eax
   314c7:	75 34                	jne    314fd <next_thread_to_run+0x4a>
   314c9:	a1 bc 2e 03 00       	mov    0x32ebc,%eax
   314ce:	83 e8 68             	sub    $0x68,%eax
   314d1:	89 45 fc             	mov    %eax,-0x4(%ebp)
   314d4:	8b 45 fc             	mov    -0x4(%ebp),%eax
   314d7:	83 c0 68             	add    $0x68,%eax
   314da:	89 04 24             	mov    %eax,(%esp)
   314dd:	e8 29 fe ff ff       	call   3130b <list_remove>
   314e2:	8b 45 fc             	mov    -0x4(%ebp),%eax
   314e5:	83 c0 68             	add    $0x68,%eax
   314e8:	c7 44 24 04 b8 2e 03 	movl   $0x32eb8,0x4(%esp)
   314ef:	00 
   314f0:	89 04 24             	mov    %eax,(%esp)
   314f3:	e8 f6 fd ff ff       	call   312ee <list_insert_back>
   314f8:	8b 45 fc             	mov    -0x4(%ebp),%eax
   314fb:	eb 00                	jmp    314fd <next_thread_to_run+0x4a>
   314fd:	c9                   	leave  
   314fe:	c3                   	ret    

000314ff <list_insert_by_pri>:
   314ff:	55                   	push   %ebp
   31500:	89 e5                	mov    %esp,%ebp
   31502:	83 ec 18             	sub    $0x18,%esp
   31505:	8b 45 0c             	mov    0xc(%ebp),%eax
   31508:	89 04 24             	mov    %eax,(%esp)
   3150b:	e8 4e fd ff ff       	call   3125e <list_empty>
   31510:	85 c0                	test   %eax,%eax
   31512:	74 19                	je     3152d <list_insert_by_pri+0x2e>
   31514:	8b 45 0c             	mov    0xc(%ebp),%eax
   31517:	8b 55 08             	mov    0x8(%ebp),%edx
   3151a:	89 54 24 04          	mov    %edx,0x4(%esp)
   3151e:	89 04 24             	mov    %eax,(%esp)
   31521:	e8 66 fd ff ff       	call   3128c <list_insert_next>
   31526:	b8 01 00 00 00       	mov    $0x1,%eax
   3152b:	eb 63                	jmp    31590 <list_insert_by_pri+0x91>
   3152d:	8b 45 0c             	mov    0xc(%ebp),%eax
   31530:	8b 40 04             	mov    0x4(%eax),%eax
   31533:	89 45 fc             	mov    %eax,-0x4(%ebp)
   31536:	8b 45 08             	mov    0x8(%ebp),%eax
   31539:	83 e8 68             	sub    $0x68,%eax
   3153c:	8b 50 60             	mov    0x60(%eax),%edx
   3153f:	8b 45 fc             	mov    -0x4(%ebp),%eax
   31542:	83 e8 68             	sub    $0x68,%eax
   31545:	8b 40 60             	mov    0x60(%eax),%eax
   31548:	39 c2                	cmp    %eax,%edx
   3154a:	7d 19                	jge    31565 <list_insert_by_pri+0x66>
   3154c:	8b 45 fc             	mov    -0x4(%ebp),%eax
   3154f:	89 44 24 04          	mov    %eax,0x4(%esp)
   31553:	8b 45 08             	mov    0x8(%ebp),%eax
   31556:	89 04 24             	mov    %eax,(%esp)
   31559:	e8 60 fd ff ff       	call   312be <list_insert_prev>
   3155e:	b8 01 00 00 00       	mov    $0x1,%eax
   31563:	eb 2b                	jmp    31590 <list_insert_by_pri+0x91>
   31565:	8b 45 fc             	mov    -0x4(%ebp),%eax
   31568:	8b 40 04             	mov    0x4(%eax),%eax
   3156b:	89 45 fc             	mov    %eax,-0x4(%ebp)
   3156e:	8b 45 0c             	mov    0xc(%ebp),%eax
   31571:	83 c0 08             	add    $0x8,%eax
   31574:	3b 45 fc             	cmp    -0x4(%ebp),%eax
   31577:	75 bd                	jne    31536 <list_insert_by_pri+0x37>
   31579:	8b 45 0c             	mov    0xc(%ebp),%eax
   3157c:	89 44 24 04          	mov    %eax,0x4(%esp)
   31580:	8b 45 08             	mov    0x8(%ebp),%eax
   31583:	89 04 24             	mov    %eax,(%esp)
   31586:	e8 63 fd ff ff       	call   312ee <list_insert_back>
   3158b:	b8 01 00 00 00       	mov    $0x1,%eax
   31590:	c9                   	leave  
   31591:	c3                   	ret    
   31592:	90                   	nop
   31593:	90                   	nop
   31594:	90                   	nop
   31595:	90                   	nop
   31596:	90                   	nop
   31597:	90                   	nop
   31598:	90                   	nop
   31599:	90                   	nop
   3159a:	90                   	nop
   3159b:	90                   	nop
   3159c:	90                   	nop
   3159d:	90                   	nop
   3159e:	90                   	nop
   3159f:	90                   	nop

000315a0 <hwint00>:
   315a0:	83 ec 04             	sub    $0x4,%esp
   315a3:	60                   	pusha  
   315a4:	1e                   	push   %ds
   315a5:	06                   	push   %es
   315a6:	0f a0                	push   %fs
   315a8:	0f a8                	push   %gs
   315aa:	65 fe 05 00 80 0b 00 	incb   %gs:0xb8000
   315b1:	b0 20                	mov    $0x20,%al
   315b3:	e6 20                	out    %al,$0x20
   315b5:	ff 05 20 22 03 00    	incl   0x32220
   315bb:	83 3d 20 22 03 00 00 	cmpl   $0x0,0x32220
   315c2:	75 1e                	jne    315e2 <hwint00.re_entry>
   315c4:	bc 01 20 03 00       	mov    $0x32001,%esp
   315c9:	fb                   	sti    
   315ca:	e8 79 01 00 00       	call   31748 <timer_interrupt>
   315cf:	fa                   	cli    
   315d0:	8b 25 d8 2f 04 00    	mov    0x42fd8,%esp
   315d6:	8d 84 24 48 00 00 00 	lea    0x48(%esp),%eax
   315dd:	a3 44 2e 03 00       	mov    %eax,0x32e44

000315e2 <hwint00.re_entry>:
   315e2:	ff 0d 20 22 03 00    	decl   0x32220
   315e8:	0f a9                	pop    %gs
   315ea:	0f a1                	pop    %fs
   315ec:	07                   	pop    %es
   315ed:	1f                   	pop    %ds
   315ee:	61                   	popa   
   315ef:	83 c4 04             	add    $0x4,%esp
   315f2:	cf                   	iret   
   315f3:	90                   	nop
   315f4:	90                   	nop
   315f5:	90                   	nop
   315f6:	90                   	nop
   315f7:	90                   	nop
   315f8:	90                   	nop
   315f9:	90                   	nop
   315fa:	90                   	nop
   315fb:	90                   	nop
   315fc:	90                   	nop
   315fd:	90                   	nop
   315fe:	90                   	nop
   315ff:	90                   	nop

00031600 <hwint01>:
   31600:	6a 01                	push   $0x1
   31602:	e8 2e fa ff ff       	call   31035 <int_handler>
   31607:	83 c4 04             	add    $0x4,%esp
   3160a:	f4                   	hlt    
   3160b:	90                   	nop
   3160c:	90                   	nop
   3160d:	90                   	nop
   3160e:	90                   	nop
   3160f:	90                   	nop

00031610 <hwint02>:
   31610:	6a 02                	push   $0x2
   31612:	e8 1e fa ff ff       	call   31035 <int_handler>
   31617:	83 c4 04             	add    $0x4,%esp
   3161a:	f4                   	hlt    
   3161b:	90                   	nop
   3161c:	90                   	nop
   3161d:	90                   	nop
   3161e:	90                   	nop
   3161f:	90                   	nop

00031620 <hwint03>:
   31620:	6a 03                	push   $0x3
   31622:	e8 0e fa ff ff       	call   31035 <int_handler>
   31627:	83 c4 04             	add    $0x4,%esp
   3162a:	f4                   	hlt    
   3162b:	90                   	nop
   3162c:	90                   	nop
   3162d:	90                   	nop
   3162e:	90                   	nop
   3162f:	90                   	nop

00031630 <hwint04>:
   31630:	6a 04                	push   $0x4
   31632:	e8 fe f9 ff ff       	call   31035 <int_handler>
   31637:	83 c4 04             	add    $0x4,%esp
   3163a:	f4                   	hlt    
   3163b:	90                   	nop
   3163c:	90                   	nop
   3163d:	90                   	nop
   3163e:	90                   	nop
   3163f:	90                   	nop

00031640 <hwint05>:
   31640:	6a 05                	push   $0x5
   31642:	e8 ee f9 ff ff       	call   31035 <int_handler>
   31647:	83 c4 04             	add    $0x4,%esp
   3164a:	f4                   	hlt    
   3164b:	90                   	nop
   3164c:	90                   	nop
   3164d:	90                   	nop
   3164e:	90                   	nop
   3164f:	90                   	nop

00031650 <hwint06>:
   31650:	6a 06                	push   $0x6
   31652:	e8 de f9 ff ff       	call   31035 <int_handler>
   31657:	83 c4 04             	add    $0x4,%esp
   3165a:	f4                   	hlt    
   3165b:	90                   	nop
   3165c:	90                   	nop
   3165d:	90                   	nop
   3165e:	90                   	nop
   3165f:	90                   	nop

00031660 <hwint07>:
   31660:	6a 07                	push   $0x7
   31662:	e8 ce f9 ff ff       	call   31035 <int_handler>
   31667:	83 c4 04             	add    $0x4,%esp
   3166a:	f4                   	hlt    
   3166b:	90                   	nop
   3166c:	90                   	nop
   3166d:	90                   	nop
   3166e:	90                   	nop
   3166f:	90                   	nop

00031670 <hwint08>:
   31670:	6a 08                	push   $0x8
   31672:	e8 be f9 ff ff       	call   31035 <int_handler>
   31677:	83 c4 04             	add    $0x4,%esp
   3167a:	f4                   	hlt    
   3167b:	90                   	nop
   3167c:	90                   	nop
   3167d:	90                   	nop
   3167e:	90                   	nop
   3167f:	90                   	nop

00031680 <hwint09>:
   31680:	6a 09                	push   $0x9
   31682:	e8 ae f9 ff ff       	call   31035 <int_handler>
   31687:	83 c4 04             	add    $0x4,%esp
   3168a:	f4                   	hlt    
   3168b:	90                   	nop
   3168c:	90                   	nop
   3168d:	90                   	nop
   3168e:	90                   	nop
   3168f:	90                   	nop

00031690 <hwint10>:
   31690:	6a 0a                	push   $0xa
   31692:	e8 9e f9 ff ff       	call   31035 <int_handler>
   31697:	83 c4 04             	add    $0x4,%esp
   3169a:	f4                   	hlt    
   3169b:	90                   	nop
   3169c:	90                   	nop
   3169d:	90                   	nop
   3169e:	90                   	nop
   3169f:	90                   	nop

000316a0 <hwint11>:
   316a0:	6a 0b                	push   $0xb
   316a2:	e8 8e f9 ff ff       	call   31035 <int_handler>
   316a7:	83 c4 04             	add    $0x4,%esp
   316aa:	f4                   	hlt    
   316ab:	90                   	nop
   316ac:	90                   	nop
   316ad:	90                   	nop
   316ae:	90                   	nop
   316af:	90                   	nop

000316b0 <hwint12>:
   316b0:	6a 0c                	push   $0xc
   316b2:	e8 7e f9 ff ff       	call   31035 <int_handler>
   316b7:	83 c4 04             	add    $0x4,%esp
   316ba:	f4                   	hlt    
   316bb:	90                   	nop
   316bc:	90                   	nop
   316bd:	90                   	nop
   316be:	90                   	nop
   316bf:	90                   	nop

000316c0 <hwint13>:
   316c0:	6a 0d                	push   $0xd
   316c2:	e8 6e f9 ff ff       	call   31035 <int_handler>
   316c7:	83 c4 04             	add    $0x4,%esp
   316ca:	f4                   	hlt    
   316cb:	90                   	nop
   316cc:	90                   	nop
   316cd:	90                   	nop
   316ce:	90                   	nop
   316cf:	90                   	nop

000316d0 <hwint14>:
   316d0:	6a 0e                	push   $0xe
   316d2:	e8 5e f9 ff ff       	call   31035 <int_handler>
   316d7:	83 c4 04             	add    $0x4,%esp
   316da:	f4                   	hlt    
   316db:	90                   	nop
   316dc:	90                   	nop
   316dd:	90                   	nop
   316de:	90                   	nop
   316df:	90                   	nop

000316e0 <hwint15>:
   316e0:	6a 0f                	push   $0xf
   316e2:	e8 4e f9 ff ff       	call   31035 <int_handler>
   316e7:	83 c4 04             	add    $0x4,%esp
   316ea:	f4                   	hlt    

000316eb <divide_error>:
   316eb:	6a ff                	push   $0xffffffff
   316ed:	6a 00                	push   $0x0
   316ef:	eb 4e                	jmp    3173f <exception>

000316f1 <debug>:
   316f1:	6a ff                	push   $0xffffffff
   316f3:	6a 01                	push   $0x1
   316f5:	eb 48                	jmp    3173f <exception>

000316f7 <nmi>:
   316f7:	6a ff                	push   $0xffffffff
   316f9:	6a 02                	push   $0x2
   316fb:	eb 42                	jmp    3173f <exception>

000316fd <int3>:
   316fd:	6a ff                	push   $0xffffffff
   316ff:	6a 03                	push   $0x3
   31701:	eb 3c                	jmp    3173f <exception>

00031703 <overflow>:
   31703:	6a ff                	push   $0xffffffff
   31705:	6a 04                	push   $0x4
   31707:	eb 36                	jmp    3173f <exception>

00031709 <bounds>:
   31709:	6a ff                	push   $0xffffffff
   3170b:	6a 05                	push   $0x5
   3170d:	eb 30                	jmp    3173f <exception>

0003170f <invalid_op>:
   3170f:	6a ff                	push   $0xffffffff
   31711:	6a 06                	push   $0x6
   31713:	eb 2a                	jmp    3173f <exception>

00031715 <device_not_available>:
   31715:	6a ff                	push   $0xffffffff
   31717:	6a 07                	push   $0x7
   31719:	eb 24                	jmp    3173f <exception>

0003171b <doublefault_fn>:
   3171b:	6a 08                	push   $0x8
   3171d:	eb 20                	jmp    3173f <exception>

0003171f <coprocessor_segment_overrun>:
   3171f:	6a ff                	push   $0xffffffff
   31721:	6a 09                	push   $0x9
   31723:	eb 1a                	jmp    3173f <exception>

00031725 <invalid_tss>:
   31725:	6a 0a                	push   $0xa
   31727:	eb 16                	jmp    3173f <exception>

00031729 <segment_not_present>:
   31729:	6a 0b                	push   $0xb
   3172b:	eb 12                	jmp    3173f <exception>

0003172d <stack_segment>:
   3172d:	6a 0c                	push   $0xc
   3172f:	eb 0e                	jmp    3173f <exception>

00031731 <general_protection>:
   31731:	6a 0d                	push   $0xd
   31733:	eb 0a                	jmp    3173f <exception>

00031735 <page_fault>:
   31735:	6a 0e                	push   $0xe
   31737:	eb 06                	jmp    3173f <exception>

00031739 <coprocessor_error>:
   31739:	6a ff                	push   $0xffffffff
   3173b:	6a 10                	push   $0x10
   3173d:	eb 00                	jmp    3173f <exception>

0003173f <exception>:
   3173f:	e8 0c f9 ff ff       	call   31050 <exception_handler>
   31744:	83 c4 08             	add    $0x8,%esp
   31747:	f4                   	hlt    

00031748 <timer_interrupt>:
   31748:	55                   	push   %ebp
   31749:	89 e5                	mov    %esp,%ebp
   3174b:	83 ec 18             	sub    $0x18,%esp
   3174e:	c7 04 24 20 1a 03 00 	movl   $0x31a20,(%esp)
   31755:	e8 e2 ed ff ff       	call   3053c <printk>
   3175a:	e8 54 fd ff ff       	call   314b3 <next_thread_to_run>
   3175f:	a3 d8 2f 04 00       	mov    %eax,0x42fd8
   31764:	c9                   	leave  
   31765:	c3                   	ret    
