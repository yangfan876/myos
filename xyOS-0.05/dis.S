
kernel.bin:     file format elf32-i386


Disassembly of section .text:

00030400 <_start>:
   30400:	bc 01 20 03 00       	mov    $0x32001,%esp
   30405:	0f 01 05 66 2e 03 00 	sgdtl  0x32e66
   3040c:	e8 33 00 00 00       	call   30444 <__init__>
   30411:	fb                   	sti    
   30412:	eb fe                	jmp    30412 <_start+0x12>

00030414 <test_idt>:
   30414:	55                   	push   %ebp
   30415:	89 e5                	mov    %esp,%ebp
   30417:	83 ec 18             	sub    $0x18,%esp
   3041a:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
   30421:	00 
   30422:	c7 04 24 fe 00 00 00 	movl   $0xfe,(%esp)
   30429:	e8 0c 04 00 00       	call   3083a <outb_pic>
   3042e:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
   30435:	00 
   30436:	c7 04 24 ff 00 00 00 	movl   $0xff,(%esp)
   3043d:	e8 f8 03 00 00       	call   3083a <outb_pic>
   30442:	c9                   	leave  
   30443:	c3                   	ret    

00030444 <__init__>:
   30444:	55                   	push   %ebp
   30445:	89 e5                	mov    %esp,%ebp
   30447:	83 ec 28             	sub    $0x28,%esp
   3044a:	e8 f9 03 00 00       	call   30848 <change_gdt>
   3044f:	c7 05 04 20 03 00 00 	movl   $0x0,0x32004
   30456:	00 00 00 
   30459:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   30460:	eb 10                	jmp    30472 <__init__+0x2e>
   30462:	c7 04 24 60 13 03 00 	movl   $0x31360,(%esp)
   30469:	e8 ce 00 00 00       	call   3053c <printk>
   3046e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   30472:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
   30479:	7e e7                	jle    30462 <__init__+0x1e>
   3047b:	c7 05 04 20 03 00 00 	movl   $0x0,0x32004
   30482:	00 00 00 
   30485:	c7 04 24 62 13 03 00 	movl   $0x31362,(%esp)
   3048c:	e8 ab 00 00 00       	call   3053c <printk>
   30491:	e8 ca 02 00 00       	call   30760 <init_8259A>
   30496:	c7 04 24 7c 13 03 00 	movl   $0x3137c,(%esp)
   3049d:	e8 9a 00 00 00       	call   3053c <printk>
   304a2:	e8 58 04 00 00       	call   308ff <init_idt>
   304a7:	c7 04 24 95 13 03 00 	movl   $0x31395,(%esp)
   304ae:	e8 89 00 00 00       	call   3053c <printk>
   304b3:	c7 04 24 ac 13 03 00 	movl   $0x313ac,(%esp)
   304ba:	e8 7d 00 00 00       	call   3053c <printk>
   304bf:	e8 99 0d 00 00       	call   3125d <init_first_thread>
   304c4:	e8 4b ff ff ff       	call   30414 <test_idt>
   304c9:	c9                   	leave  
   304ca:	c3                   	ret    
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
   30522:	c7 04 24 53 14 03 00 	movl   $0x31453,(%esp)
   30529:	e8 0e 00 00 00       	call   3053c <printk>
   3052e:	c7 04 24 71 14 03 00 	movl   $0x31471,(%esp)
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
   30775:	e8 b6 00 00 00       	call   30830 <outb>
   3077a:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
   30781:	00 
   30782:	c7 04 24 ff 00 00 00 	movl   $0xff,(%esp)
   30789:	e8 a2 00 00 00       	call   30830 <outb>
   3078e:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
   30795:	00 
   30796:	c7 04 24 11 00 00 00 	movl   $0x11,(%esp)
   3079d:	e8 98 00 00 00       	call   3083a <outb_pic>
   307a2:	c7 44 24 04 a0 00 00 	movl   $0xa0,0x4(%esp)
   307a9:	00 
   307aa:	c7 04 24 11 00 00 00 	movl   $0x11,(%esp)
   307b1:	e8 84 00 00 00       	call   3083a <outb_pic>
   307b6:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
   307bd:	00 
   307be:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
   307c5:	e8 70 00 00 00       	call   3083a <outb_pic>
   307ca:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
   307d1:	00 
   307d2:	c7 04 24 28 00 00 00 	movl   $0x28,(%esp)
   307d9:	e8 5c 00 00 00       	call   3083a <outb_pic>
   307de:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
   307e5:	00 
   307e6:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
   307ed:	e8 48 00 00 00       	call   3083a <outb_pic>
   307f2:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
   307f9:	00 
   307fa:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
   30801:	e8 34 00 00 00       	call   3083a <outb_pic>
   30806:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
   3080d:	00 
   3080e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
   30815:	e8 20 00 00 00       	call   3083a <outb_pic>
   3081a:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
   30821:	00 
   30822:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
   30829:	e8 0c 00 00 00       	call   3083a <outb_pic>
   3082e:	c9                   	leave  
   3082f:	c3                   	ret    

00030830 <outb>:
   30830:	8b 44 24 04          	mov    0x4(%esp),%eax
   30834:	8b 54 24 08          	mov    0x8(%esp),%edx
   30838:	ee                   	out    %al,(%dx)
   30839:	c3                   	ret    

0003083a <outb_pic>:
   3083a:	8b 44 24 04          	mov    0x4(%esp),%eax
   3083e:	8b 54 24 08          	mov    0x8(%esp),%edx
   30842:	ee                   	out    %al,(%dx)
   30843:	90                   	nop
   30844:	90                   	nop
   30845:	c3                   	ret    
   30846:	90                   	nop
   30847:	90                   	nop

00030848 <change_gdt>:
   30848:	55                   	push   %ebp
   30849:	89 e5                	mov    %esp,%ebp
   3084b:	83 ec 18             	sub    $0x18,%esp
   3084e:	66 c7 05 40 22 03 00 	movw   $0x0,0x32240
   30855:	00 00 
   30857:	66 c7 05 42 22 03 00 	movw   $0x0,0x32242
   3085e:	00 00 
   30860:	c6 05 44 22 03 00 00 	movb   $0x0,0x32244
   30867:	c6 05 45 22 03 00 00 	movb   $0x0,0x32245
   3086e:	c6 05 46 22 03 00 00 	movb   $0x0,0x32246
   30875:	c6 05 47 22 03 00 00 	movb   $0x0,0x32247
   3087c:	66 c7 05 a0 22 03 00 	movw   $0xffff,0x322a0
   30883:	ff ff 
   30885:	66 c7 05 a2 22 03 00 	movw   $0x0,0x322a2
   3088c:	00 00 
   3088e:	c6 05 a4 22 03 00 00 	movb   $0x0,0x322a4
   30895:	c6 05 a5 22 03 00 9a 	movb   $0x9a,0x322a5
   3089c:	c6 05 a6 22 03 00 cf 	movb   $0xcf,0x322a6
   308a3:	c6 05 a7 22 03 00 00 	movb   $0x0,0x322a7
   308aa:	66 c7 05 a8 22 03 00 	movw   $0xffff,0x322a8
   308b1:	ff ff 
   308b3:	66 c7 05 aa 22 03 00 	movw   $0x0,0x322aa
   308ba:	00 00 
   308bc:	c6 05 ac 22 03 00 00 	movb   $0x0,0x322ac
   308c3:	c6 05 ad 22 03 00 93 	movb   $0x93,0x322ad
   308ca:	c6 05 ae 22 03 00 cf 	movb   $0xcf,0x322ae
   308d1:	c6 05 af 22 03 00 00 	movb   $0x0,0x322af
   308d8:	c7 45 f4 66 2e 03 00 	movl   $0x32e66,-0xc(%ebp)
   308df:	c7 45 f0 68 2e 03 00 	movl   $0x32e68,-0x10(%ebp)
   308e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
   308e9:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
   308ee:	ba 40 22 03 00       	mov    $0x32240,%edx
   308f3:	8b 45 f0             	mov    -0x10(%ebp),%eax
   308f6:	89 10                	mov    %edx,(%eax)
   308f8:	e8 03 07 00 00       	call   31000 <jump_new_gdt>
   308fd:	c9                   	leave  
   308fe:	c3                   	ret    

000308ff <init_idt>:
   308ff:	55                   	push   %ebp
   30900:	89 e5                	mov    %esp,%ebp
   30902:	83 ec 18             	sub    $0x18,%esp
   30905:	b8 3b 11 03 00       	mov    $0x3113b,%eax
   3090a:	66 a3 40 26 03 00    	mov    %ax,0x32640
   30910:	66 c7 05 42 26 03 00 	movw   $0x60,0x32642
   30917:	60 00 
   30919:	c6 05 44 26 03 00 00 	movb   $0x0,0x32644
   30920:	c6 05 45 26 03 00 8e 	movb   $0x8e,0x32645
   30927:	b8 3b 11 03 00       	mov    $0x3113b,%eax
   3092c:	c1 e8 10             	shr    $0x10,%eax
   3092f:	66 a3 46 26 03 00    	mov    %ax,0x32646
   30935:	b8 41 11 03 00       	mov    $0x31141,%eax
   3093a:	66 a3 48 26 03 00    	mov    %ax,0x32648
   30940:	66 c7 05 4a 26 03 00 	movw   $0x60,0x3264a
   30947:	60 00 
   30949:	c6 05 4c 26 03 00 00 	movb   $0x0,0x3264c
   30950:	c6 05 4d 26 03 00 8e 	movb   $0x8e,0x3264d
   30957:	b8 41 11 03 00       	mov    $0x31141,%eax
   3095c:	c1 e8 10             	shr    $0x10,%eax
   3095f:	66 a3 4e 26 03 00    	mov    %ax,0x3264e
   30965:	b8 47 11 03 00       	mov    $0x31147,%eax
   3096a:	66 a3 50 26 03 00    	mov    %ax,0x32650
   30970:	66 c7 05 52 26 03 00 	movw   $0x60,0x32652
   30977:	60 00 
   30979:	c6 05 54 26 03 00 00 	movb   $0x0,0x32654
   30980:	c6 05 55 26 03 00 8e 	movb   $0x8e,0x32655
   30987:	b8 47 11 03 00       	mov    $0x31147,%eax
   3098c:	c1 e8 10             	shr    $0x10,%eax
   3098f:	66 a3 56 26 03 00    	mov    %ax,0x32656
   30995:	b8 4d 11 03 00       	mov    $0x3114d,%eax
   3099a:	66 a3 58 26 03 00    	mov    %ax,0x32658
   309a0:	66 c7 05 5a 26 03 00 	movw   $0x60,0x3265a
   309a7:	60 00 
   309a9:	c6 05 5c 26 03 00 00 	movb   $0x0,0x3265c
   309b0:	c6 05 5d 26 03 00 8e 	movb   $0x8e,0x3265d
   309b7:	b8 4d 11 03 00       	mov    $0x3114d,%eax
   309bc:	c1 e8 10             	shr    $0x10,%eax
   309bf:	66 a3 5e 26 03 00    	mov    %ax,0x3265e
   309c5:	b8 53 11 03 00       	mov    $0x31153,%eax
   309ca:	66 a3 60 26 03 00    	mov    %ax,0x32660
   309d0:	66 c7 05 62 26 03 00 	movw   $0x60,0x32662
   309d7:	60 00 
   309d9:	c6 05 64 26 03 00 00 	movb   $0x0,0x32664
   309e0:	c6 05 65 26 03 00 8e 	movb   $0x8e,0x32665
   309e7:	b8 53 11 03 00       	mov    $0x31153,%eax
   309ec:	c1 e8 10             	shr    $0x10,%eax
   309ef:	66 a3 66 26 03 00    	mov    %ax,0x32666
   309f5:	b8 59 11 03 00       	mov    $0x31159,%eax
   309fa:	66 a3 68 26 03 00    	mov    %ax,0x32668
   30a00:	66 c7 05 6a 26 03 00 	movw   $0x60,0x3266a
   30a07:	60 00 
   30a09:	c6 05 6c 26 03 00 00 	movb   $0x0,0x3266c
   30a10:	c6 05 6d 26 03 00 8e 	movb   $0x8e,0x3266d
   30a17:	b8 59 11 03 00       	mov    $0x31159,%eax
   30a1c:	c1 e8 10             	shr    $0x10,%eax
   30a1f:	66 a3 6e 26 03 00    	mov    %ax,0x3266e
   30a25:	b8 5f 11 03 00       	mov    $0x3115f,%eax
   30a2a:	66 a3 70 26 03 00    	mov    %ax,0x32670
   30a30:	66 c7 05 72 26 03 00 	movw   $0x60,0x32672
   30a37:	60 00 
   30a39:	c6 05 74 26 03 00 00 	movb   $0x0,0x32674
   30a40:	c6 05 75 26 03 00 8e 	movb   $0x8e,0x32675
   30a47:	b8 5f 11 03 00       	mov    $0x3115f,%eax
   30a4c:	c1 e8 10             	shr    $0x10,%eax
   30a4f:	66 a3 76 26 03 00    	mov    %ax,0x32676
   30a55:	b8 65 11 03 00       	mov    $0x31165,%eax
   30a5a:	66 a3 78 26 03 00    	mov    %ax,0x32678
   30a60:	66 c7 05 7a 26 03 00 	movw   $0x60,0x3267a
   30a67:	60 00 
   30a69:	c6 05 7c 26 03 00 00 	movb   $0x0,0x3267c
   30a70:	c6 05 7d 26 03 00 8e 	movb   $0x8e,0x3267d
   30a77:	b8 65 11 03 00       	mov    $0x31165,%eax
   30a7c:	c1 e8 10             	shr    $0x10,%eax
   30a7f:	66 a3 7e 26 03 00    	mov    %ax,0x3267e
   30a85:	b8 6b 11 03 00       	mov    $0x3116b,%eax
   30a8a:	66 a3 80 26 03 00    	mov    %ax,0x32680
   30a90:	66 c7 05 82 26 03 00 	movw   $0x60,0x32682
   30a97:	60 00 
   30a99:	c6 05 84 26 03 00 00 	movb   $0x0,0x32684
   30aa0:	c6 05 85 26 03 00 8e 	movb   $0x8e,0x32685
   30aa7:	b8 6b 11 03 00       	mov    $0x3116b,%eax
   30aac:	c1 e8 10             	shr    $0x10,%eax
   30aaf:	66 a3 86 26 03 00    	mov    %ax,0x32686
   30ab5:	b8 6f 11 03 00       	mov    $0x3116f,%eax
   30aba:	66 a3 88 26 03 00    	mov    %ax,0x32688
   30ac0:	66 c7 05 8a 26 03 00 	movw   $0x60,0x3268a
   30ac7:	60 00 
   30ac9:	c6 05 8c 26 03 00 00 	movb   $0x0,0x3268c
   30ad0:	c6 05 8d 26 03 00 8e 	movb   $0x8e,0x3268d
   30ad7:	b8 6f 11 03 00       	mov    $0x3116f,%eax
   30adc:	c1 e8 10             	shr    $0x10,%eax
   30adf:	66 a3 8e 26 03 00    	mov    %ax,0x3268e
   30ae5:	b8 75 11 03 00       	mov    $0x31175,%eax
   30aea:	66 a3 90 26 03 00    	mov    %ax,0x32690
   30af0:	66 c7 05 92 26 03 00 	movw   $0x60,0x32692
   30af7:	60 00 
   30af9:	c6 05 94 26 03 00 00 	movb   $0x0,0x32694
   30b00:	c6 05 95 26 03 00 8e 	movb   $0x8e,0x32695
   30b07:	b8 75 11 03 00       	mov    $0x31175,%eax
   30b0c:	c1 e8 10             	shr    $0x10,%eax
   30b0f:	66 a3 96 26 03 00    	mov    %ax,0x32696
   30b15:	b8 79 11 03 00       	mov    $0x31179,%eax
   30b1a:	66 a3 98 26 03 00    	mov    %ax,0x32698
   30b20:	66 c7 05 9a 26 03 00 	movw   $0x60,0x3269a
   30b27:	60 00 
   30b29:	c6 05 9c 26 03 00 00 	movb   $0x0,0x3269c
   30b30:	c6 05 9d 26 03 00 8e 	movb   $0x8e,0x3269d
   30b37:	b8 79 11 03 00       	mov    $0x31179,%eax
   30b3c:	c1 e8 10             	shr    $0x10,%eax
   30b3f:	66 a3 9e 26 03 00    	mov    %ax,0x3269e
   30b45:	b8 7d 11 03 00       	mov    $0x3117d,%eax
   30b4a:	66 a3 a0 26 03 00    	mov    %ax,0x326a0
   30b50:	66 c7 05 a2 26 03 00 	movw   $0x60,0x326a2
   30b57:	60 00 
   30b59:	c6 05 a4 26 03 00 00 	movb   $0x0,0x326a4
   30b60:	c6 05 a5 26 03 00 8e 	movb   $0x8e,0x326a5
   30b67:	b8 7d 11 03 00       	mov    $0x3117d,%eax
   30b6c:	c1 e8 10             	shr    $0x10,%eax
   30b6f:	66 a3 a6 26 03 00    	mov    %ax,0x326a6
   30b75:	b8 81 11 03 00       	mov    $0x31181,%eax
   30b7a:	66 a3 a8 26 03 00    	mov    %ax,0x326a8
   30b80:	66 c7 05 aa 26 03 00 	movw   $0x60,0x326aa
   30b87:	60 00 
   30b89:	c6 05 ac 26 03 00 00 	movb   $0x0,0x326ac
   30b90:	c6 05 ad 26 03 00 8e 	movb   $0x8e,0x326ad
   30b97:	b8 81 11 03 00       	mov    $0x31181,%eax
   30b9c:	c1 e8 10             	shr    $0x10,%eax
   30b9f:	66 a3 ae 26 03 00    	mov    %ax,0x326ae
   30ba5:	b8 85 11 03 00       	mov    $0x31185,%eax
   30baa:	66 a3 b0 26 03 00    	mov    %ax,0x326b0
   30bb0:	66 c7 05 b2 26 03 00 	movw   $0x60,0x326b2
   30bb7:	60 00 
   30bb9:	c6 05 b4 26 03 00 00 	movb   $0x0,0x326b4
   30bc0:	c6 05 b5 26 03 00 8e 	movb   $0x8e,0x326b5
   30bc7:	b8 85 11 03 00       	mov    $0x31185,%eax
   30bcc:	c1 e8 10             	shr    $0x10,%eax
   30bcf:	66 a3 b6 26 03 00    	mov    %ax,0x326b6
   30bd5:	b8 89 11 03 00       	mov    $0x31189,%eax
   30bda:	66 a3 c0 26 03 00    	mov    %ax,0x326c0
   30be0:	66 c7 05 c2 26 03 00 	movw   $0x60,0x326c2
   30be7:	60 00 
   30be9:	c6 05 c4 26 03 00 00 	movb   $0x0,0x326c4
   30bf0:	c6 05 c5 26 03 00 8e 	movb   $0x8e,0x326c5
   30bf7:	b8 89 11 03 00       	mov    $0x31189,%eax
   30bfc:	c1 e8 10             	shr    $0x10,%eax
   30bff:	66 a3 c6 26 03 00    	mov    %ax,0x326c6
   30c05:	b8 30 10 03 00       	mov    $0x31030,%eax
   30c0a:	66 a3 40 27 03 00    	mov    %ax,0x32740
   30c10:	66 c7 05 42 27 03 00 	movw   $0x60,0x32742
   30c17:	60 00 
   30c19:	c6 05 44 27 03 00 00 	movb   $0x0,0x32744
   30c20:	c6 05 45 27 03 00 8e 	movb   $0x8e,0x32745
   30c27:	b8 30 10 03 00       	mov    $0x31030,%eax
   30c2c:	c1 e8 10             	shr    $0x10,%eax
   30c2f:	66 a3 46 27 03 00    	mov    %ax,0x32746
   30c35:	b8 50 10 03 00       	mov    $0x31050,%eax
   30c3a:	66 a3 48 27 03 00    	mov    %ax,0x32748
   30c40:	66 c7 05 4a 27 03 00 	movw   $0x60,0x3274a
   30c47:	60 00 
   30c49:	c6 05 4c 27 03 00 00 	movb   $0x0,0x3274c
   30c50:	c6 05 4d 27 03 00 8e 	movb   $0x8e,0x3274d
   30c57:	b8 50 10 03 00       	mov    $0x31050,%eax
   30c5c:	c1 e8 10             	shr    $0x10,%eax
   30c5f:	66 a3 4e 27 03 00    	mov    %ax,0x3274e
   30c65:	b8 60 10 03 00       	mov    $0x31060,%eax
   30c6a:	66 a3 50 27 03 00    	mov    %ax,0x32750
   30c70:	66 c7 05 52 27 03 00 	movw   $0x60,0x32752
   30c77:	60 00 
   30c79:	c6 05 54 27 03 00 00 	movb   $0x0,0x32754
   30c80:	c6 05 55 27 03 00 8e 	movb   $0x8e,0x32755
   30c87:	b8 60 10 03 00       	mov    $0x31060,%eax
   30c8c:	c1 e8 10             	shr    $0x10,%eax
   30c8f:	66 a3 56 27 03 00    	mov    %ax,0x32756
   30c95:	b8 70 10 03 00       	mov    $0x31070,%eax
   30c9a:	66 a3 58 27 03 00    	mov    %ax,0x32758
   30ca0:	66 c7 05 5a 27 03 00 	movw   $0x60,0x3275a
   30ca7:	60 00 
   30ca9:	c6 05 5c 27 03 00 00 	movb   $0x0,0x3275c
   30cb0:	c6 05 5d 27 03 00 8e 	movb   $0x8e,0x3275d
   30cb7:	b8 70 10 03 00       	mov    $0x31070,%eax
   30cbc:	c1 e8 10             	shr    $0x10,%eax
   30cbf:	66 a3 5e 27 03 00    	mov    %ax,0x3275e
   30cc5:	b8 80 10 03 00       	mov    $0x31080,%eax
   30cca:	66 a3 60 27 03 00    	mov    %ax,0x32760
   30cd0:	66 c7 05 62 27 03 00 	movw   $0x60,0x32762
   30cd7:	60 00 
   30cd9:	c6 05 64 27 03 00 00 	movb   $0x0,0x32764
   30ce0:	c6 05 65 27 03 00 8e 	movb   $0x8e,0x32765
   30ce7:	b8 80 10 03 00       	mov    $0x31080,%eax
   30cec:	c1 e8 10             	shr    $0x10,%eax
   30cef:	66 a3 66 27 03 00    	mov    %ax,0x32766
   30cf5:	b8 90 10 03 00       	mov    $0x31090,%eax
   30cfa:	66 a3 68 27 03 00    	mov    %ax,0x32768
   30d00:	66 c7 05 6a 27 03 00 	movw   $0x60,0x3276a
   30d07:	60 00 
   30d09:	c6 05 6c 27 03 00 00 	movb   $0x0,0x3276c
   30d10:	c6 05 6d 27 03 00 8e 	movb   $0x8e,0x3276d
   30d17:	b8 90 10 03 00       	mov    $0x31090,%eax
   30d1c:	c1 e8 10             	shr    $0x10,%eax
   30d1f:	66 a3 6e 27 03 00    	mov    %ax,0x3276e
   30d25:	b8 a0 10 03 00       	mov    $0x310a0,%eax
   30d2a:	66 a3 70 27 03 00    	mov    %ax,0x32770
   30d30:	66 c7 05 72 27 03 00 	movw   $0x60,0x32772
   30d37:	60 00 
   30d39:	c6 05 74 27 03 00 00 	movb   $0x0,0x32774
   30d40:	c6 05 75 27 03 00 8e 	movb   $0x8e,0x32775
   30d47:	b8 a0 10 03 00       	mov    $0x310a0,%eax
   30d4c:	c1 e8 10             	shr    $0x10,%eax
   30d4f:	66 a3 76 27 03 00    	mov    %ax,0x32776
   30d55:	b8 b0 10 03 00       	mov    $0x310b0,%eax
   30d5a:	66 a3 78 27 03 00    	mov    %ax,0x32778
   30d60:	66 c7 05 7a 27 03 00 	movw   $0x60,0x3277a
   30d67:	60 00 
   30d69:	c6 05 7c 27 03 00 00 	movb   $0x0,0x3277c
   30d70:	c6 05 7d 27 03 00 8e 	movb   $0x8e,0x3277d
   30d77:	b8 b0 10 03 00       	mov    $0x310b0,%eax
   30d7c:	c1 e8 10             	shr    $0x10,%eax
   30d7f:	66 a3 7e 27 03 00    	mov    %ax,0x3277e
   30d85:	b8 c0 10 03 00       	mov    $0x310c0,%eax
   30d8a:	66 a3 80 27 03 00    	mov    %ax,0x32780
   30d90:	66 c7 05 82 27 03 00 	movw   $0x60,0x32782
   30d97:	60 00 
   30d99:	c6 05 84 27 03 00 00 	movb   $0x0,0x32784
   30da0:	c6 05 85 27 03 00 8e 	movb   $0x8e,0x32785
   30da7:	b8 c0 10 03 00       	mov    $0x310c0,%eax
   30dac:	c1 e8 10             	shr    $0x10,%eax
   30daf:	66 a3 86 27 03 00    	mov    %ax,0x32786
   30db5:	b8 d0 10 03 00       	mov    $0x310d0,%eax
   30dba:	66 a3 88 27 03 00    	mov    %ax,0x32788
   30dc0:	66 c7 05 8a 27 03 00 	movw   $0x60,0x3278a
   30dc7:	60 00 
   30dc9:	c6 05 8c 27 03 00 00 	movb   $0x0,0x3278c
   30dd0:	c6 05 8d 27 03 00 8e 	movb   $0x8e,0x3278d
   30dd7:	b8 d0 10 03 00       	mov    $0x310d0,%eax
   30ddc:	c1 e8 10             	shr    $0x10,%eax
   30ddf:	66 a3 8e 27 03 00    	mov    %ax,0x3278e
   30de5:	b8 e0 10 03 00       	mov    $0x310e0,%eax
   30dea:	66 a3 90 27 03 00    	mov    %ax,0x32790
   30df0:	66 c7 05 92 27 03 00 	movw   $0x60,0x32792
   30df7:	60 00 
   30df9:	c6 05 94 27 03 00 00 	movb   $0x0,0x32794
   30e00:	c6 05 95 27 03 00 8e 	movb   $0x8e,0x32795
   30e07:	b8 e0 10 03 00       	mov    $0x310e0,%eax
   30e0c:	c1 e8 10             	shr    $0x10,%eax
   30e0f:	66 a3 96 27 03 00    	mov    %ax,0x32796
   30e15:	b8 f0 10 03 00       	mov    $0x310f0,%eax
   30e1a:	66 a3 98 27 03 00    	mov    %ax,0x32798
   30e20:	66 c7 05 9a 27 03 00 	movw   $0x60,0x3279a
   30e27:	60 00 
   30e29:	c6 05 9c 27 03 00 00 	movb   $0x0,0x3279c
   30e30:	c6 05 9d 27 03 00 8e 	movb   $0x8e,0x3279d
   30e37:	b8 f0 10 03 00       	mov    $0x310f0,%eax
   30e3c:	c1 e8 10             	shr    $0x10,%eax
   30e3f:	66 a3 9e 27 03 00    	mov    %ax,0x3279e
   30e45:	b8 00 11 03 00       	mov    $0x31100,%eax
   30e4a:	66 a3 a0 27 03 00    	mov    %ax,0x327a0
   30e50:	66 c7 05 a2 27 03 00 	movw   $0x60,0x327a2
   30e57:	60 00 
   30e59:	c6 05 a4 27 03 00 00 	movb   $0x0,0x327a4
   30e60:	c6 05 a5 27 03 00 8e 	movb   $0x8e,0x327a5
   30e67:	b8 00 11 03 00       	mov    $0x31100,%eax
   30e6c:	c1 e8 10             	shr    $0x10,%eax
   30e6f:	66 a3 a6 27 03 00    	mov    %ax,0x327a6
   30e75:	b8 10 11 03 00       	mov    $0x31110,%eax
   30e7a:	66 a3 a8 27 03 00    	mov    %ax,0x327a8
   30e80:	66 c7 05 aa 27 03 00 	movw   $0x60,0x327aa
   30e87:	60 00 
   30e89:	c6 05 ac 27 03 00 00 	movb   $0x0,0x327ac
   30e90:	c6 05 ad 27 03 00 8e 	movb   $0x8e,0x327ad
   30e97:	b8 10 11 03 00       	mov    $0x31110,%eax
   30e9c:	c1 e8 10             	shr    $0x10,%eax
   30e9f:	66 a3 ae 27 03 00    	mov    %ax,0x327ae
   30ea5:	b8 20 11 03 00       	mov    $0x31120,%eax
   30eaa:	66 a3 b0 27 03 00    	mov    %ax,0x327b0
   30eb0:	66 c7 05 b2 27 03 00 	movw   $0x60,0x327b2
   30eb7:	60 00 
   30eb9:	c6 05 b4 27 03 00 00 	movb   $0x0,0x327b4
   30ec0:	c6 05 b5 27 03 00 8e 	movb   $0x8e,0x327b5
   30ec7:	b8 20 11 03 00       	mov    $0x31120,%eax
   30ecc:	c1 e8 10             	shr    $0x10,%eax
   30ecf:	66 a3 b6 27 03 00    	mov    %ax,0x327b6
   30ed5:	b8 30 11 03 00       	mov    $0x31130,%eax
   30eda:	66 a3 b8 27 03 00    	mov    %ax,0x327b8
   30ee0:	66 c7 05 ba 27 03 00 	movw   $0x60,0x327ba
   30ee7:	60 00 
   30ee9:	c6 05 bc 27 03 00 00 	movb   $0x0,0x327bc
   30ef0:	c6 05 bd 27 03 00 8e 	movb   $0x8e,0x327bd
   30ef7:	b8 30 11 03 00       	mov    $0x31130,%eax
   30efc:	c1 e8 10             	shr    $0x10,%eax
   30eff:	66 a3 be 27 03 00    	mov    %ax,0x327be
   30f05:	c7 45 f4 60 2e 03 00 	movl   $0x32e60,-0xc(%ebp)
   30f0c:	c7 45 f0 62 2e 03 00 	movl   $0x32e62,-0x10(%ebp)
   30f13:	8b 45 f4             	mov    -0xc(%ebp),%eax
   30f16:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
   30f1b:	ba 40 26 03 00       	mov    $0x32640,%edx
   30f20:	8b 45 f0             	mov    -0x10(%ebp),%eax
   30f23:	89 10                	mov    %edx,(%eax)
   30f25:	e8 f4 00 00 00       	call   3101e <load_idt>
   30f2a:	c9                   	leave  
   30f2b:	c3                   	ret    

00030f2c <int_handler>:
   30f2c:	55                   	push   %ebp
   30f2d:	89 e5                	mov    %esp,%ebp
   30f2f:	83 ec 18             	sub    $0x18,%esp
   30f32:	8b 45 08             	mov    0x8(%ebp),%eax
   30f35:	89 44 24 04          	mov    %eax,0x4(%esp)
   30f39:	c7 04 24 a0 14 03 00 	movl   $0x314a0,(%esp)
   30f40:	e8 f7 f5 ff ff       	call   3053c <printk>
   30f45:	c9                   	leave  
   30f46:	c3                   	ret    

00030f47 <exception_handler>:
   30f47:	55                   	push   %ebp
   30f48:	89 e5                	mov    %esp,%ebp
   30f4a:	57                   	push   %edi
   30f4b:	56                   	push   %esi
   30f4c:	53                   	push   %ebx
   30f4d:	83 ec 7c             	sub    $0x7c,%esp
   30f50:	8d 55 94             	lea    -0x6c(%ebp),%edx
   30f53:	bb 60 15 03 00       	mov    $0x31560,%ebx
   30f58:	b8 14 00 00 00       	mov    $0x14,%eax
   30f5d:	89 d7                	mov    %edx,%edi
   30f5f:	89 de                	mov    %ebx,%esi
   30f61:	89 c1                	mov    %eax,%ecx
   30f63:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
   30f65:	c7 05 04 20 03 00 00 	movl   $0x0,0x32004
   30f6c:	00 00 00 
   30f6f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
   30f76:	eb 10                	jmp    30f88 <exception_handler+0x41>
   30f78:	c7 04 24 b6 14 03 00 	movl   $0x314b6,(%esp)
   30f7f:	e8 b8 f5 ff ff       	call   3053c <printk>
   30f84:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
   30f88:	81 7d e4 8f 01 00 00 	cmpl   $0x18f,-0x1c(%ebp)
   30f8f:	7e e7                	jle    30f78 <exception_handler+0x31>
   30f91:	c7 05 04 20 03 00 00 	movl   $0x0,0x32004
   30f98:	00 00 00 
   30f9b:	8b 45 08             	mov    0x8(%ebp),%eax
   30f9e:	8b 44 85 94          	mov    -0x6c(%ebp,%eax,4),%eax
   30fa2:	89 44 24 04          	mov    %eax,0x4(%esp)
   30fa6:	c7 04 24 b8 14 03 00 	movl   $0x314b8,(%esp)
   30fad:	e8 8a f5 ff ff       	call   3053c <printk>
   30fb2:	8b 45 18             	mov    0x18(%ebp),%eax
   30fb5:	89 44 24 0c          	mov    %eax,0xc(%esp)
   30fb9:	8b 45 14             	mov    0x14(%ebp),%eax
   30fbc:	89 44 24 08          	mov    %eax,0x8(%esp)
   30fc0:	8b 45 10             	mov    0x10(%ebp),%eax
   30fc3:	89 44 24 04          	mov    %eax,0x4(%esp)
   30fc7:	c7 04 24 c7 14 03 00 	movl   $0x314c7,(%esp)
   30fce:	e8 69 f5 ff ff       	call   3053c <printk>
   30fd3:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
   30fd7:	74 13                	je     30fec <exception_handler+0xa5>
   30fd9:	8b 45 0c             	mov    0xc(%ebp),%eax
   30fdc:	89 44 24 04          	mov    %eax,0x4(%esp)
   30fe0:	c7 04 24 e3 14 03 00 	movl   $0x314e3,(%esp)
   30fe7:	e8 50 f5 ff ff       	call   3053c <printk>
   30fec:	83 c4 7c             	add    $0x7c,%esp
   30fef:	5b                   	pop    %ebx
   30ff0:	5e                   	pop    %esi
   30ff1:	5f                   	pop    %edi
   30ff2:	5d                   	pop    %ebp
   30ff3:	c3                   	ret    
   30ff4:	90                   	nop
   30ff5:	90                   	nop
   30ff6:	90                   	nop
   30ff7:	90                   	nop
   30ff8:	90                   	nop
   30ff9:	90                   	nop
   30ffa:	90                   	nop
   30ffb:	90                   	nop
   30ffc:	90                   	nop
   30ffd:	90                   	nop
   30ffe:	90                   	nop
   30fff:	90                   	nop

00031000 <jump_new_gdt>:
   31000:	0f 01 15 66 2e 03 00 	lgdtl  0x32e66
   31007:	66 b8 68 00          	mov    $0x68,%ax
   3100b:	8e d8                	mov    %eax,%ds
   3100d:	8e c0                	mov    %eax,%es
   3100f:	8e d0                	mov    %eax,%ss
   31011:	8e e0                	mov    %eax,%fs
   31013:	8e e8                	mov    %eax,%gs
   31015:	ea 1d 10 03 00 60 00 	ljmp   $0x60,$0x3101d
   3101c:	c3                   	ret    

0003101d <use_new_gdt>:
   3101d:	c3                   	ret    

0003101e <load_idt>:
   3101e:	0f 01 1d 60 2e 03 00 	lidtl  0x32e60
   31025:	c3                   	ret    
   31026:	90                   	nop
   31027:	90                   	nop
   31028:	90                   	nop
   31029:	90                   	nop
   3102a:	90                   	nop
   3102b:	90                   	nop
   3102c:	90                   	nop
   3102d:	90                   	nop
   3102e:	90                   	nop
   3102f:	90                   	nop

00031030 <hwint00>:
   31030:	8b 25 70 2e 03 00    	mov    0x32e70,%esp
   31036:	0f a9                	pop    %gs
   31038:	0f a1                	pop    %fs
   3103a:	07                   	pop    %es
   3103b:	1f                   	pop    %ds
   3103c:	61                   	popa   
   3103d:	83 c4 04             	add    $0x4,%esp
   31040:	cf                   	iret   
   31041:	90                   	nop
   31042:	90                   	nop
   31043:	90                   	nop
   31044:	90                   	nop
   31045:	90                   	nop
   31046:	90                   	nop
   31047:	90                   	nop
   31048:	90                   	nop
   31049:	90                   	nop
   3104a:	90                   	nop
   3104b:	90                   	nop
   3104c:	90                   	nop
   3104d:	90                   	nop
   3104e:	90                   	nop
   3104f:	90                   	nop

00031050 <hwint01>:
   31050:	6a 01                	push   $0x1
   31052:	e8 d5 fe ff ff       	call   30f2c <int_handler>
   31057:	83 c4 04             	add    $0x4,%esp
   3105a:	f4                   	hlt    
   3105b:	90                   	nop
   3105c:	90                   	nop
   3105d:	90                   	nop
   3105e:	90                   	nop
   3105f:	90                   	nop

00031060 <hwint02>:
   31060:	6a 02                	push   $0x2
   31062:	e8 c5 fe ff ff       	call   30f2c <int_handler>
   31067:	83 c4 04             	add    $0x4,%esp
   3106a:	f4                   	hlt    
   3106b:	90                   	nop
   3106c:	90                   	nop
   3106d:	90                   	nop
   3106e:	90                   	nop
   3106f:	90                   	nop

00031070 <hwint03>:
   31070:	6a 03                	push   $0x3
   31072:	e8 b5 fe ff ff       	call   30f2c <int_handler>
   31077:	83 c4 04             	add    $0x4,%esp
   3107a:	f4                   	hlt    
   3107b:	90                   	nop
   3107c:	90                   	nop
   3107d:	90                   	nop
   3107e:	90                   	nop
   3107f:	90                   	nop

00031080 <hwint04>:
   31080:	6a 04                	push   $0x4
   31082:	e8 a5 fe ff ff       	call   30f2c <int_handler>
   31087:	83 c4 04             	add    $0x4,%esp
   3108a:	f4                   	hlt    
   3108b:	90                   	nop
   3108c:	90                   	nop
   3108d:	90                   	nop
   3108e:	90                   	nop
   3108f:	90                   	nop

00031090 <hwint05>:
   31090:	6a 05                	push   $0x5
   31092:	e8 95 fe ff ff       	call   30f2c <int_handler>
   31097:	83 c4 04             	add    $0x4,%esp
   3109a:	f4                   	hlt    
   3109b:	90                   	nop
   3109c:	90                   	nop
   3109d:	90                   	nop
   3109e:	90                   	nop
   3109f:	90                   	nop

000310a0 <hwint06>:
   310a0:	6a 06                	push   $0x6
   310a2:	e8 85 fe ff ff       	call   30f2c <int_handler>
   310a7:	83 c4 04             	add    $0x4,%esp
   310aa:	f4                   	hlt    
   310ab:	90                   	nop
   310ac:	90                   	nop
   310ad:	90                   	nop
   310ae:	90                   	nop
   310af:	90                   	nop

000310b0 <hwint07>:
   310b0:	6a 07                	push   $0x7
   310b2:	e8 75 fe ff ff       	call   30f2c <int_handler>
   310b7:	83 c4 04             	add    $0x4,%esp
   310ba:	f4                   	hlt    
   310bb:	90                   	nop
   310bc:	90                   	nop
   310bd:	90                   	nop
   310be:	90                   	nop
   310bf:	90                   	nop

000310c0 <hwint08>:
   310c0:	6a 08                	push   $0x8
   310c2:	e8 65 fe ff ff       	call   30f2c <int_handler>
   310c7:	83 c4 04             	add    $0x4,%esp
   310ca:	f4                   	hlt    
   310cb:	90                   	nop
   310cc:	90                   	nop
   310cd:	90                   	nop
   310ce:	90                   	nop
   310cf:	90                   	nop

000310d0 <hwint09>:
   310d0:	6a 09                	push   $0x9
   310d2:	e8 55 fe ff ff       	call   30f2c <int_handler>
   310d7:	83 c4 04             	add    $0x4,%esp
   310da:	f4                   	hlt    
   310db:	90                   	nop
   310dc:	90                   	nop
   310dd:	90                   	nop
   310de:	90                   	nop
   310df:	90                   	nop

000310e0 <hwint10>:
   310e0:	6a 0a                	push   $0xa
   310e2:	e8 45 fe ff ff       	call   30f2c <int_handler>
   310e7:	83 c4 04             	add    $0x4,%esp
   310ea:	f4                   	hlt    
   310eb:	90                   	nop
   310ec:	90                   	nop
   310ed:	90                   	nop
   310ee:	90                   	nop
   310ef:	90                   	nop

000310f0 <hwint11>:
   310f0:	6a 0b                	push   $0xb
   310f2:	e8 35 fe ff ff       	call   30f2c <int_handler>
   310f7:	83 c4 04             	add    $0x4,%esp
   310fa:	f4                   	hlt    
   310fb:	90                   	nop
   310fc:	90                   	nop
   310fd:	90                   	nop
   310fe:	90                   	nop
   310ff:	90                   	nop

00031100 <hwint12>:
   31100:	6a 0c                	push   $0xc
   31102:	e8 25 fe ff ff       	call   30f2c <int_handler>
   31107:	83 c4 04             	add    $0x4,%esp
   3110a:	f4                   	hlt    
   3110b:	90                   	nop
   3110c:	90                   	nop
   3110d:	90                   	nop
   3110e:	90                   	nop
   3110f:	90                   	nop

00031110 <hwint13>:
   31110:	6a 0d                	push   $0xd
   31112:	e8 15 fe ff ff       	call   30f2c <int_handler>
   31117:	83 c4 04             	add    $0x4,%esp
   3111a:	f4                   	hlt    
   3111b:	90                   	nop
   3111c:	90                   	nop
   3111d:	90                   	nop
   3111e:	90                   	nop
   3111f:	90                   	nop

00031120 <hwint14>:
   31120:	6a 0e                	push   $0xe
   31122:	e8 05 fe ff ff       	call   30f2c <int_handler>
   31127:	83 c4 04             	add    $0x4,%esp
   3112a:	f4                   	hlt    
   3112b:	90                   	nop
   3112c:	90                   	nop
   3112d:	90                   	nop
   3112e:	90                   	nop
   3112f:	90                   	nop

00031130 <hwint15>:
   31130:	6a 0f                	push   $0xf
   31132:	e8 f5 fd ff ff       	call   30f2c <int_handler>
   31137:	83 c4 04             	add    $0x4,%esp
   3113a:	f4                   	hlt    

0003113b <divide_error>:
   3113b:	6a ff                	push   $0xffffffff
   3113d:	6a 00                	push   $0x0
   3113f:	eb 4e                	jmp    3118f <exception>

00031141 <debug>:
   31141:	6a ff                	push   $0xffffffff
   31143:	6a 01                	push   $0x1
   31145:	eb 48                	jmp    3118f <exception>

00031147 <nmi>:
   31147:	6a ff                	push   $0xffffffff
   31149:	6a 02                	push   $0x2
   3114b:	eb 42                	jmp    3118f <exception>

0003114d <int3>:
   3114d:	6a ff                	push   $0xffffffff
   3114f:	6a 03                	push   $0x3
   31151:	eb 3c                	jmp    3118f <exception>

00031153 <overflow>:
   31153:	6a ff                	push   $0xffffffff
   31155:	6a 04                	push   $0x4
   31157:	eb 36                	jmp    3118f <exception>

00031159 <bounds>:
   31159:	6a ff                	push   $0xffffffff
   3115b:	6a 05                	push   $0x5
   3115d:	eb 30                	jmp    3118f <exception>

0003115f <invalid_op>:
   3115f:	6a ff                	push   $0xffffffff
   31161:	6a 06                	push   $0x6
   31163:	eb 2a                	jmp    3118f <exception>

00031165 <device_not_available>:
   31165:	6a ff                	push   $0xffffffff
   31167:	6a 07                	push   $0x7
   31169:	eb 24                	jmp    3118f <exception>

0003116b <doublefault_fn>:
   3116b:	6a 08                	push   $0x8
   3116d:	eb 20                	jmp    3118f <exception>

0003116f <coprocessor_segment_overrun>:
   3116f:	6a ff                	push   $0xffffffff
   31171:	6a 09                	push   $0x9
   31173:	eb 1a                	jmp    3118f <exception>

00031175 <invalid_tss>:
   31175:	6a 0a                	push   $0xa
   31177:	eb 16                	jmp    3118f <exception>

00031179 <segment_not_present>:
   31179:	6a 0b                	push   $0xb
   3117b:	eb 12                	jmp    3118f <exception>

0003117d <stack_segment>:
   3117d:	6a 0c                	push   $0xc
   3117f:	eb 0e                	jmp    3118f <exception>

00031181 <general_protection>:
   31181:	6a 0d                	push   $0xd
   31183:	eb 0a                	jmp    3118f <exception>

00031185 <page_fault>:
   31185:	6a 0e                	push   $0xe
   31187:	eb 06                	jmp    3118f <exception>

00031189 <coprocessor_error>:
   31189:	6a ff                	push   $0xffffffff
   3118b:	6a 10                	push   $0x10
   3118d:	eb 00                	jmp    3118f <exception>

0003118f <exception>:
   3118f:	e8 b3 fd ff ff       	call   30f47 <exception_handler>
   31194:	83 c4 08             	add    $0x8,%esp
   31197:	f4                   	hlt    

00031198 <testA>:
   31198:	55                   	push   %ebp
   31199:	89 e5                	mov    %esp,%ebp
   3119b:	83 ec 28             	sub    $0x28,%esp
   3119e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   311a5:	eb 10                	jmp    311b7 <testA+0x1f>
   311a7:	c7 04 24 b0 15 03 00 	movl   $0x315b0,(%esp)
   311ae:	e8 89 f3 ff ff       	call   3053c <printk>
   311b3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   311b7:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
   311bb:	7e ea                	jle    311a7 <testA+0xf>
   311bd:	eb fe                	jmp    311bd <testA+0x25>

000311bf <list_init>:
   311bf:	55                   	push   %ebp
   311c0:	89 e5                	mov    %esp,%ebp
   311c2:	8b 45 08             	mov    0x8(%ebp),%eax
   311c5:	8d 50 08             	lea    0x8(%eax),%edx
   311c8:	8b 45 08             	mov    0x8(%ebp),%eax
   311cb:	89 50 04             	mov    %edx,0x4(%eax)
   311ce:	8b 45 08             	mov    0x8(%ebp),%eax
   311d1:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
   311d7:	8b 55 08             	mov    0x8(%ebp),%edx
   311da:	8b 45 08             	mov    0x8(%ebp),%eax
   311dd:	89 50 08             	mov    %edx,0x8(%eax)
   311e0:	8b 45 08             	mov    0x8(%ebp),%eax
   311e3:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
   311ea:	b8 01 00 00 00       	mov    $0x1,%eax
   311ef:	5d                   	pop    %ebp
   311f0:	c3                   	ret    

000311f1 <list_empty>:
   311f1:	55                   	push   %ebp
   311f2:	89 e5                	mov    %esp,%ebp
   311f4:	b8 00 00 00 00       	mov    $0x0,%eax
   311f9:	5d                   	pop    %ebp
   311fa:	c3                   	ret    

000311fb <list_insert_next>:
   311fb:	55                   	push   %ebp
   311fc:	89 e5                	mov    %esp,%ebp
   311fe:	8b 45 08             	mov    0x8(%ebp),%eax
   31201:	8b 50 04             	mov    0x4(%eax),%edx
   31204:	8b 45 0c             	mov    0xc(%ebp),%eax
   31207:	89 50 04             	mov    %edx,0x4(%eax)
   3120a:	8b 45 0c             	mov    0xc(%ebp),%eax
   3120d:	8b 55 08             	mov    0x8(%ebp),%edx
   31210:	89 10                	mov    %edx,(%eax)
   31212:	8b 45 08             	mov    0x8(%ebp),%eax
   31215:	8b 40 04             	mov    0x4(%eax),%eax
   31218:	8b 55 0c             	mov    0xc(%ebp),%edx
   3121b:	89 10                	mov    %edx,(%eax)
   3121d:	8b 45 08             	mov    0x8(%ebp),%eax
   31220:	8b 55 0c             	mov    0xc(%ebp),%edx
   31223:	89 50 04             	mov    %edx,0x4(%eax)
   31226:	b8 01 00 00 00       	mov    $0x1,%eax
   3122b:	5d                   	pop    %ebp
   3122c:	c3                   	ret    

0003122d <list_insert_prev>:
   3122d:	55                   	push   %ebp
   3122e:	89 e5                	mov    %esp,%ebp
   31230:	8b 45 08             	mov    0x8(%ebp),%eax
   31233:	8b 55 0c             	mov    0xc(%ebp),%edx
   31236:	89 50 04             	mov    %edx,0x4(%eax)
   31239:	8b 45 0c             	mov    0xc(%ebp),%eax
   3123c:	8b 10                	mov    (%eax),%edx
   3123e:	8b 45 08             	mov    0x8(%ebp),%eax
   31241:	89 10                	mov    %edx,(%eax)
   31243:	8b 45 0c             	mov    0xc(%ebp),%eax
   31246:	8b 00                	mov    (%eax),%eax
   31248:	8b 55 08             	mov    0x8(%ebp),%edx
   3124b:	89 50 04             	mov    %edx,0x4(%eax)
   3124e:	8b 45 0c             	mov    0xc(%ebp),%eax
   31251:	8b 55 08             	mov    0x8(%ebp),%edx
   31254:	89 10                	mov    %edx,(%eax)
   31256:	b8 01 00 00 00       	mov    $0x1,%eax
   3125b:	5d                   	pop    %ebp
   3125c:	c3                   	ret    

0003125d <init_first_thread>:
   3125d:	55                   	push   %ebp
   3125e:	89 e5                	mov    %esp,%ebp
   31260:	81 ec 80 80 00 00    	sub    $0x8080,%esp
   31266:	a1 20 22 03 00       	mov    0x32220,%eax
   3126b:	89 85 c4 7f ff ff    	mov    %eax,-0x803c(%ebp)
   31271:	a1 24 22 03 00       	mov    0x32224,%eax
   31276:	89 85 8c 7f ff ff    	mov    %eax,-0x8074(%ebp)
   3127c:	a1 24 22 03 00       	mov    0x32224,%eax
   31281:	89 85 90 7f ff ff    	mov    %eax,-0x8070(%ebp)
   31287:	a1 24 22 03 00       	mov    0x32224,%eax
   3128c:	89 85 94 7f ff ff    	mov    %eax,-0x806c(%ebp)
   31292:	a1 24 22 03 00       	mov    0x32224,%eax
   31297:	89 85 98 7f ff ff    	mov    %eax,-0x8068(%ebp)
   3129d:	b8 98 11 03 00       	mov    $0x31198,%eax
   312a2:	89 85 c0 7f ff ff    	mov    %eax,-0x8040(%ebp)
   312a8:	8d 85 8c 7f ff ff    	lea    -0x8074(%ebp),%eax
   312ae:	83 c0 74             	add    $0x74,%eax
   312b1:	05 00 80 00 00       	add    $0x8000,%eax
   312b6:	89 85 cc 7f ff ff    	mov    %eax,-0x8034(%ebp)
   312bc:	c7 85 c8 7f ff ff 02 	movl   $0x1202,-0x8038(%ebp)
   312c3:	12 00 00 
   312c6:	8d 85 8c 7f ff ff    	lea    -0x8074(%ebp),%eax
   312cc:	a3 70 2e 03 00       	mov    %eax,0x32e70
   312d1:	c9                   	leave  
   312d2:	c3                   	ret    

000312d3 <insert_list_by_pri>:
   312d3:	55                   	push   %ebp
   312d4:	89 e5                	mov    %esp,%ebp
   312d6:	83 ec 18             	sub    $0x18,%esp
   312d9:	8b 45 0c             	mov    0xc(%ebp),%eax
   312dc:	89 04 24             	mov    %eax,(%esp)
   312df:	e8 0d ff ff ff       	call   311f1 <list_empty>
   312e4:	85 c0                	test   %eax,%eax
   312e6:	74 12                	je     312fa <insert_list_by_pri+0x27>
   312e8:	8b 45 0c             	mov    0xc(%ebp),%eax
   312eb:	8b 55 08             	mov    0x8(%ebp),%edx
   312ee:	89 54 24 04          	mov    %edx,0x4(%esp)
   312f2:	89 04 24             	mov    %eax,(%esp)
   312f5:	e8 01 ff ff ff       	call   311fb <list_insert_next>
   312fa:	8b 45 0c             	mov    0xc(%ebp),%eax
   312fd:	8b 40 04             	mov    0x4(%eax),%eax
   31300:	89 45 fc             	mov    %eax,-0x4(%ebp)
   31303:	8b 45 08             	mov    0x8(%ebp),%eax
   31306:	83 c0 04             	add    $0x4,%eax
   31309:	83 e8 70             	sub    $0x70,%eax
   3130c:	8b 50 60             	mov    0x60(%eax),%edx
   3130f:	8b 45 fc             	mov    -0x4(%ebp),%eax
   31312:	83 c0 04             	add    $0x4,%eax
   31315:	83 e8 70             	sub    $0x70,%eax
   31318:	8b 40 60             	mov    0x60(%eax),%eax
   3131b:	39 c2                	cmp    %eax,%edx
   3131d:	7f 12                	jg     31331 <insert_list_by_pri+0x5e>
   3131f:	8b 45 fc             	mov    -0x4(%ebp),%eax
   31322:	89 44 24 04          	mov    %eax,0x4(%esp)
   31326:	8b 45 08             	mov    0x8(%ebp),%eax
   31329:	89 04 24             	mov    %eax,(%esp)
   3132c:	e8 fc fe ff ff       	call   3122d <list_insert_prev>
   31331:	8b 45 fc             	mov    -0x4(%ebp),%eax
   31334:	8b 40 04             	mov    0x4(%eax),%eax
   31337:	89 45 fc             	mov    %eax,-0x4(%ebp)
   3133a:	8b 45 0c             	mov    0xc(%ebp),%eax
   3133d:	83 c0 08             	add    $0x8,%eax
   31340:	3b 45 fc             	cmp    -0x4(%ebp),%eax
   31343:	75 be                	jne    31303 <insert_list_by_pri+0x30>
   31345:	b8 01 00 00 00       	mov    $0x1,%eax
   3134a:	c9                   	leave  
   3134b:	c3                   	ret    
