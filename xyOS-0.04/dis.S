
kernel.bin:     file format elf32-i386


Disassembly of section .text:

00030400 <_start>:
   30400:	0f 01 05 e6 3a 03 00 	sgdtl  0x33ae6
   30407:	e8 34 00 00 00       	call   30440 <__init__>
   3040c:	fb                   	sti    
   3040d:	eb fe                	jmp    3040d <_start+0xd>
   3040f:	90                   	nop

00030410 <test_idt>:
   30410:	55                   	push   %ebp
   30411:	89 e5                	mov    %esp,%ebp
   30413:	83 ec 18             	sub    $0x18,%esp
   30416:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
   3041d:	00 
   3041e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
   30425:	e8 c0 03 00 00       	call   307ea <outb_pic>
   3042a:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
   30431:	00 
   30432:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
   30439:	e8 ac 03 00 00       	call   307ea <outb_pic>
   3043e:	c9                   	leave  
   3043f:	c3                   	ret    

00030440 <__init__>:
   30440:	55                   	push   %ebp
   30441:	89 e5                	mov    %esp,%ebp
   30443:	83 ec 18             	sub    $0x18,%esp
   30446:	e8 ad 03 00 00       	call   307f8 <change_gdt>
   3044b:	c7 04 24 20 11 03 00 	movl   $0x31120,(%esp)
   30452:	e8 95 00 00 00       	call   304ec <printk>
   30457:	e8 b4 02 00 00       	call   30710 <init_8259A>
   3045c:	c7 04 24 3a 11 03 00 	movl   $0x3113a,(%esp)
   30463:	e8 84 00 00 00       	call   304ec <printk>
   30468:	e8 42 04 00 00       	call   308af <init_idt>
   3046d:	c7 04 24 53 11 03 00 	movl   $0x31153,(%esp)
   30474:	e8 73 00 00 00       	call   304ec <printk>
   30479:	c9                   	leave  
   3047a:	c3                   	ret    
   3047b:	90                   	nop
   3047c:	90                   	nop
   3047d:	90                   	nop
   3047e:	90                   	nop
   3047f:	90                   	nop

00030480 <disp_str>:
   30480:	55                   	push   %ebp
   30481:	89 e5                	mov    %esp,%ebp
   30483:	8b 75 08             	mov    0x8(%ebp),%esi
   30486:	8b 3d c0 24 03 00    	mov    0x324c0,%edi
   3048c:	b4 0f                	mov    $0xf,%ah

0003048e <disp_str.1>:
   3048e:	ac                   	lods   %ds:(%esi),%al
   3048f:	84 c0                	test   %al,%al
   30491:	74 2f                	je     304c2 <disp_str.2>
   30493:	3c 0a                	cmp    $0xa,%al
   30495:	75 16                	jne    304ad <disp_str.3>
   30497:	50                   	push   %eax
   30498:	89 f8                	mov    %edi,%eax
   3049a:	b3 a0                	mov    $0xa0,%bl
   3049c:	f6 f3                	div    %bl
   3049e:	25 ff 00 00 00       	and    $0xff,%eax
   304a3:	40                   	inc    %eax
   304a4:	b3 a0                	mov    $0xa0,%bl
   304a6:	f6 e3                	mul    %bl
   304a8:	89 c7                	mov    %eax,%edi
   304aa:	58                   	pop    %eax
   304ab:	eb e1                	jmp    3048e <disp_str.1>

000304ad <disp_str.3>:
   304ad:	81 c7 00 80 0b 00    	add    $0xb8000,%edi
   304b3:	65 66 89 07          	mov    %ax,%gs:(%edi)
   304b7:	81 ef 00 80 0b 00    	sub    $0xb8000,%edi
   304bd:	83 c7 02             	add    $0x2,%edi
   304c0:	eb cc                	jmp    3048e <disp_str.1>

000304c2 <disp_str.2>:
   304c2:	89 3d c0 24 03 00    	mov    %edi,0x324c0
   304c8:	5d                   	pop    %ebp
   304c9:	c3                   	ret    
   304ca:	90                   	nop
   304cb:	90                   	nop

000304cc <print>:
   304cc:	55                   	push   %ebp
   304cd:	89 e5                	mov    %esp,%ebp
   304cf:	83 ec 18             	sub    $0x18,%esp
   304d2:	c7 04 24 f3 11 03 00 	movl   $0x311f3,(%esp)
   304d9:	e8 0e 00 00 00       	call   304ec <printk>
   304de:	c7 04 24 11 12 03 00 	movl   $0x31211,(%esp)
   304e5:	e8 02 00 00 00       	call   304ec <printk>
   304ea:	c9                   	leave  
   304eb:	c3                   	ret    

000304ec <printk>:
   304ec:	55                   	push   %ebp
   304ed:	89 e5                	mov    %esp,%ebp
   304ef:	81 ec 28 04 00 00    	sub    $0x428,%esp
   304f5:	8d 55 0c             	lea    0xc(%ebp),%edx
   304f8:	8d 85 f0 fb ff ff    	lea    -0x410(%ebp),%eax
   304fe:	89 10                	mov    %edx,(%eax)
   30500:	8b 85 f0 fb ff ff    	mov    -0x410(%ebp),%eax
   30506:	89 44 24 08          	mov    %eax,0x8(%esp)
   3050a:	8b 45 08             	mov    0x8(%ebp),%eax
   3050d:	89 44 24 04          	mov    %eax,0x4(%esp)
   30511:	8d 85 f4 fb ff ff    	lea    -0x40c(%ebp),%eax
   30517:	89 04 24             	mov    %eax,(%esp)
   3051a:	e8 16 00 00 00       	call   30535 <__vprintf__>
   3051f:	89 45 f4             	mov    %eax,-0xc(%ebp)
   30522:	8d 85 f4 fb ff ff    	lea    -0x40c(%ebp),%eax
   30528:	89 04 24             	mov    %eax,(%esp)
   3052b:	e8 50 ff ff ff       	call   30480 <disp_str>
   30530:	8b 45 f4             	mov    -0xc(%ebp),%eax
   30533:	c9                   	leave  
   30534:	c3                   	ret    

00030535 <__vprintf__>:
   30535:	55                   	push   %ebp
   30536:	89 e5                	mov    %esp,%ebp
   30538:	83 ec 30             	sub    $0x30,%esp
   3053b:	8b 45 0c             	mov    0xc(%ebp),%eax
   3053e:	89 45 fc             	mov    %eax,-0x4(%ebp)
   30541:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
   30548:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   3054f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
   30556:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
   3055d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
   30564:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
   3056b:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
   30572:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
   30578:	e9 72 01 00 00       	jmp    306ef <__vprintf__+0x1ba>
   3057d:	8b 45 fc             	mov    -0x4(%ebp),%eax
   30580:	0f b6 00             	movzbl (%eax),%eax
   30583:	3c 25                	cmp    $0x25,%al
   30585:	0f 85 4e 01 00 00    	jne    306d9 <__vprintf__+0x1a4>
   3058b:	8b 45 fc             	mov    -0x4(%ebp),%eax
   3058e:	83 c0 01             	add    $0x1,%eax
   30591:	0f b6 00             	movzbl (%eax),%eax
   30594:	0f be c0             	movsbl %al,%eax
   30597:	83 f8 64             	cmp    $0x64,%eax
   3059a:	74 3e                	je     305da <__vprintf__+0xa5>
   3059c:	83 f8 73             	cmp    $0x73,%eax
   3059f:	0f 84 fa 00 00 00    	je     3069f <__vprintf__+0x16a>
   305a5:	83 f8 63             	cmp    $0x63,%eax
   305a8:	0f 85 39 01 00 00    	jne    306e7 <__vprintf__+0x1b2>
   305ae:	8b 45 10             	mov    0x10(%ebp),%eax
   305b1:	8d 50 04             	lea    0x4(%eax),%edx
   305b4:	89 55 10             	mov    %edx,0x10(%ebp)
   305b7:	8b 00                	mov    (%eax),%eax
   305b9:	89 45 f0             	mov    %eax,-0x10(%ebp)
   305bc:	8b 45 f8             	mov    -0x8(%ebp),%eax
   305bf:	03 45 08             	add    0x8(%ebp),%eax
   305c2:	8b 55 f0             	mov    -0x10(%ebp),%edx
   305c5:	8b 14 95 e0 24 03 00 	mov    0x324e0(,%edx,4),%edx
   305cc:	0f b6 12             	movzbl (%edx),%edx
   305cf:	88 10                	mov    %dl,(%eax)
   305d1:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   305d5:	e9 0d 01 00 00       	jmp    306e7 <__vprintf__+0x1b2>
   305da:	8b 45 10             	mov    0x10(%ebp),%eax
   305dd:	8d 50 04             	lea    0x4(%eax),%edx
   305e0:	89 55 10             	mov    %edx,0x10(%ebp)
   305e3:	8b 00                	mov    (%eax),%eax
   305e5:	89 45 f0             	mov    %eax,-0x10(%ebp)
   305e8:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
   305ef:	8b 4d f0             	mov    -0x10(%ebp),%ecx
   305f2:	ba 67 66 66 66       	mov    $0x66666667,%edx
   305f7:	89 c8                	mov    %ecx,%eax
   305f9:	f7 ea                	imul   %edx
   305fb:	c1 fa 02             	sar    $0x2,%edx
   305fe:	89 c8                	mov    %ecx,%eax
   30600:	c1 f8 1f             	sar    $0x1f,%eax
   30603:	29 c2                	sub    %eax,%edx
   30605:	89 d0                	mov    %edx,%eax
   30607:	c1 e0 02             	shl    $0x2,%eax
   3060a:	01 d0                	add    %edx,%eax
   3060c:	01 c0                	add    %eax,%eax
   3060e:	89 ca                	mov    %ecx,%edx
   30610:	29 c2                	sub    %eax,%edx
   30612:	8d 42 30             	lea    0x30(%edx),%eax
   30615:	8b 04 85 e0 24 03 00 	mov    0x324e0(,%eax,4),%eax
   3061c:	0f b6 10             	movzbl (%eax),%edx
   3061f:	8d 45 de             	lea    -0x22(%ebp),%eax
   30622:	03 45 ec             	add    -0x14(%ebp),%eax
   30625:	88 10                	mov    %dl,(%eax)
   30627:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
   3062b:	8b 4d f0             	mov    -0x10(%ebp),%ecx
   3062e:	ba 67 66 66 66       	mov    $0x66666667,%edx
   30633:	89 c8                	mov    %ecx,%eax
   30635:	f7 ea                	imul   %edx
   30637:	c1 fa 02             	sar    $0x2,%edx
   3063a:	89 c8                	mov    %ecx,%eax
   3063c:	c1 f8 1f             	sar    $0x1f,%eax
   3063f:	89 d1                	mov    %edx,%ecx
   30641:	29 c1                	sub    %eax,%ecx
   30643:	89 c8                	mov    %ecx,%eax
   30645:	89 45 f0             	mov    %eax,-0x10(%ebp)
   30648:	8b 4d f0             	mov    -0x10(%ebp),%ecx
   3064b:	ba 67 66 66 66       	mov    $0x66666667,%edx
   30650:	89 c8                	mov    %ecx,%eax
   30652:	f7 ea                	imul   %edx
   30654:	c1 fa 02             	sar    $0x2,%edx
   30657:	89 c8                	mov    %ecx,%eax
   30659:	c1 f8 1f             	sar    $0x1f,%eax
   3065c:	29 c2                	sub    %eax,%edx
   3065e:	89 d0                	mov    %edx,%eax
   30660:	c1 e0 02             	shl    $0x2,%eax
   30663:	01 d0                	add    %edx,%eax
   30665:	01 c0                	add    %eax,%eax
   30667:	89 ca                	mov    %ecx,%edx
   30669:	29 c2                	sub    %eax,%edx
   3066b:	85 d2                	test   %edx,%edx
   3066d:	75 80                	jne    305ef <__vprintf__+0xba>
   3066f:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
   30673:	eb 19                	jmp    3068e <__vprintf__+0x159>
   30675:	8b 45 f8             	mov    -0x8(%ebp),%eax
   30678:	03 45 08             	add    0x8(%ebp),%eax
   3067b:	8d 55 de             	lea    -0x22(%ebp),%edx
   3067e:	03 55 ec             	add    -0x14(%ebp),%edx
   30681:	0f b6 12             	movzbl (%edx),%edx
   30684:	88 10                	mov    %dl,(%eax)
   30686:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
   3068a:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
   3068e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
   30692:	79 e1                	jns    30675 <__vprintf__+0x140>
   30694:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
   30698:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   3069c:	90                   	nop
   3069d:	eb 48                	jmp    306e7 <__vprintf__+0x1b2>
   3069f:	8b 45 10             	mov    0x10(%ebp),%eax
   306a2:	8d 50 04             	lea    0x4(%eax),%edx
   306a5:	89 55 10             	mov    %edx,0x10(%ebp)
   306a8:	8b 00                	mov    (%eax),%eax
   306aa:	89 45 f4             	mov    %eax,-0xc(%ebp)
   306ad:	eb 16                	jmp    306c5 <__vprintf__+0x190>
   306af:	8b 45 f8             	mov    -0x8(%ebp),%eax
   306b2:	03 45 08             	add    0x8(%ebp),%eax
   306b5:	8b 55 f4             	mov    -0xc(%ebp),%edx
   306b8:	0f b6 12             	movzbl (%edx),%edx
   306bb:	88 10                	mov    %dl,(%eax)
   306bd:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
   306c1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   306c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
   306c8:	0f b6 00             	movzbl (%eax),%eax
   306cb:	84 c0                	test   %al,%al
   306cd:	75 e0                	jne    306af <__vprintf__+0x17a>
   306cf:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
   306d3:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   306d7:	eb 0e                	jmp    306e7 <__vprintf__+0x1b2>
   306d9:	8b 45 f8             	mov    -0x8(%ebp),%eax
   306dc:	03 45 08             	add    0x8(%ebp),%eax
   306df:	8b 55 fc             	mov    -0x4(%ebp),%edx
   306e2:	0f b6 12             	movzbl (%edx),%edx
   306e5:	88 10                	mov    %dl,(%eax)
   306e7:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
   306eb:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   306ef:	8b 45 fc             	mov    -0x4(%ebp),%eax
   306f2:	0f b6 00             	movzbl (%eax),%eax
   306f5:	84 c0                	test   %al,%al
   306f7:	0f 85 80 fe ff ff    	jne    3057d <__vprintf__+0x48>
   306fd:	8b 45 f8             	mov    -0x8(%ebp),%eax
   30700:	03 45 08             	add    0x8(%ebp),%eax
   30703:	c6 00 00             	movb   $0x0,(%eax)
   30706:	b8 01 00 00 00       	mov    $0x1,%eax
   3070b:	c9                   	leave  
   3070c:	c3                   	ret    
   3070d:	90                   	nop
   3070e:	90                   	nop
   3070f:	90                   	nop

00030710 <init_8259A>:
   30710:	55                   	push   %ebp
   30711:	89 e5                	mov    %esp,%ebp
   30713:	83 ec 18             	sub    $0x18,%esp
   30716:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
   3071d:	00 
   3071e:	c7 04 24 ff 00 00 00 	movl   $0xff,(%esp)
   30725:	e8 b6 00 00 00       	call   307e0 <outb>
   3072a:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
   30731:	00 
   30732:	c7 04 24 ff 00 00 00 	movl   $0xff,(%esp)
   30739:	e8 a2 00 00 00       	call   307e0 <outb>
   3073e:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
   30745:	00 
   30746:	c7 04 24 11 00 00 00 	movl   $0x11,(%esp)
   3074d:	e8 98 00 00 00       	call   307ea <outb_pic>
   30752:	c7 44 24 04 a0 00 00 	movl   $0xa0,0x4(%esp)
   30759:	00 
   3075a:	c7 04 24 11 00 00 00 	movl   $0x11,(%esp)
   30761:	e8 84 00 00 00       	call   307ea <outb_pic>
   30766:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
   3076d:	00 
   3076e:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
   30775:	e8 70 00 00 00       	call   307ea <outb_pic>
   3077a:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
   30781:	00 
   30782:	c7 04 24 28 00 00 00 	movl   $0x28,(%esp)
   30789:	e8 5c 00 00 00       	call   307ea <outb_pic>
   3078e:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
   30795:	00 
   30796:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
   3079d:	e8 48 00 00 00       	call   307ea <outb_pic>
   307a2:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
   307a9:	00 
   307aa:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
   307b1:	e8 34 00 00 00       	call   307ea <outb_pic>
   307b6:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
   307bd:	00 
   307be:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
   307c5:	e8 20 00 00 00       	call   307ea <outb_pic>
   307ca:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
   307d1:	00 
   307d2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
   307d9:	e8 0c 00 00 00       	call   307ea <outb_pic>
   307de:	c9                   	leave  
   307df:	c3                   	ret    

000307e0 <outb>:
   307e0:	8b 44 24 04          	mov    0x4(%esp),%eax
   307e4:	8b 54 24 08          	mov    0x8(%esp),%edx
   307e8:	ee                   	out    %al,(%dx)
   307e9:	c3                   	ret    

000307ea <outb_pic>:
   307ea:	8b 44 24 04          	mov    0x4(%esp),%eax
   307ee:	8b 54 24 08          	mov    0x8(%esp),%edx
   307f2:	ee                   	out    %al,(%dx)
   307f3:	90                   	nop
   307f4:	90                   	nop
   307f5:	c3                   	ret    
   307f6:	90                   	nop
   307f7:	90                   	nop

000307f8 <change_gdt>:
   307f8:	55                   	push   %ebp
   307f9:	89 e5                	mov    %esp,%ebp
   307fb:	83 ec 18             	sub    $0x18,%esp
   307fe:	66 c7 05 e0 2e 03 00 	movw   $0x0,0x32ee0
   30805:	00 00 
   30807:	66 c7 05 e2 2e 03 00 	movw   $0x0,0x32ee2
   3080e:	00 00 
   30810:	c6 05 e4 2e 03 00 00 	movb   $0x0,0x32ee4
   30817:	c6 05 e5 2e 03 00 00 	movb   $0x0,0x32ee5
   3081e:	c6 05 e6 2e 03 00 00 	movb   $0x0,0x32ee6
   30825:	c6 05 e7 2e 03 00 00 	movb   $0x0,0x32ee7
   3082c:	66 c7 05 40 2f 03 00 	movw   $0xffff,0x32f40
   30833:	ff ff 
   30835:	66 c7 05 42 2f 03 00 	movw   $0x0,0x32f42
   3083c:	00 00 
   3083e:	c6 05 44 2f 03 00 00 	movb   $0x0,0x32f44
   30845:	c6 05 45 2f 03 00 9a 	movb   $0x9a,0x32f45
   3084c:	c6 05 46 2f 03 00 cf 	movb   $0xcf,0x32f46
   30853:	c6 05 47 2f 03 00 00 	movb   $0x0,0x32f47
   3085a:	66 c7 05 48 2f 03 00 	movw   $0xffff,0x32f48
   30861:	ff ff 
   30863:	66 c7 05 4a 2f 03 00 	movw   $0x0,0x32f4a
   3086a:	00 00 
   3086c:	c6 05 4c 2f 03 00 00 	movb   $0x0,0x32f4c
   30873:	c6 05 4d 2f 03 00 93 	movb   $0x93,0x32f4d
   3087a:	c6 05 4e 2f 03 00 cf 	movb   $0xcf,0x32f4e
   30881:	c6 05 4f 2f 03 00 00 	movb   $0x0,0x32f4f
   30888:	c7 45 f4 e6 3a 03 00 	movl   $0x33ae6,-0xc(%ebp)
   3088f:	c7 45 f0 e8 3a 03 00 	movl   $0x33ae8,-0x10(%ebp)
   30896:	8b 45 f4             	mov    -0xc(%ebp),%eax
   30899:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
   3089e:	ba e0 2e 03 00       	mov    $0x32ee0,%edx
   308a3:	8b 45 f0             	mov    -0x10(%ebp),%eax
   308a6:	89 10                	mov    %edx,(%eax)
   308a8:	e8 d3 06 00 00       	call   30f80 <jump_new_gdt>
   308ad:	c9                   	leave  
   308ae:	c3                   	ret    

000308af <init_idt>:
   308af:	55                   	push   %ebp
   308b0:	89 e5                	mov    %esp,%ebp
   308b2:	83 ec 18             	sub    $0x18,%esp
   308b5:	b8 ab 10 03 00       	mov    $0x310ab,%eax
   308ba:	66 a3 e0 32 03 00    	mov    %ax,0x332e0
   308c0:	66 c7 05 e2 32 03 00 	movw   $0x60,0x332e2
   308c7:	60 00 
   308c9:	c6 05 e4 32 03 00 00 	movb   $0x0,0x332e4
   308d0:	c6 05 e5 32 03 00 8e 	movb   $0x8e,0x332e5
   308d7:	b8 ab 10 03 00       	mov    $0x310ab,%eax
   308dc:	c1 e8 10             	shr    $0x10,%eax
   308df:	66 a3 e6 32 03 00    	mov    %ax,0x332e6
   308e5:	b8 b1 10 03 00       	mov    $0x310b1,%eax
   308ea:	66 a3 e8 32 03 00    	mov    %ax,0x332e8
   308f0:	66 c7 05 ea 32 03 00 	movw   $0x60,0x332ea
   308f7:	60 00 
   308f9:	c6 05 ec 32 03 00 00 	movb   $0x0,0x332ec
   30900:	c6 05 ed 32 03 00 8e 	movb   $0x8e,0x332ed
   30907:	b8 b1 10 03 00       	mov    $0x310b1,%eax
   3090c:	c1 e8 10             	shr    $0x10,%eax
   3090f:	66 a3 ee 32 03 00    	mov    %ax,0x332ee
   30915:	b8 b7 10 03 00       	mov    $0x310b7,%eax
   3091a:	66 a3 f0 32 03 00    	mov    %ax,0x332f0
   30920:	66 c7 05 f2 32 03 00 	movw   $0x60,0x332f2
   30927:	60 00 
   30929:	c6 05 f4 32 03 00 00 	movb   $0x0,0x332f4
   30930:	c6 05 f5 32 03 00 8e 	movb   $0x8e,0x332f5
   30937:	b8 b7 10 03 00       	mov    $0x310b7,%eax
   3093c:	c1 e8 10             	shr    $0x10,%eax
   3093f:	66 a3 f6 32 03 00    	mov    %ax,0x332f6
   30945:	b8 bd 10 03 00       	mov    $0x310bd,%eax
   3094a:	66 a3 f8 32 03 00    	mov    %ax,0x332f8
   30950:	66 c7 05 fa 32 03 00 	movw   $0x60,0x332fa
   30957:	60 00 
   30959:	c6 05 fc 32 03 00 00 	movb   $0x0,0x332fc
   30960:	c6 05 fd 32 03 00 8e 	movb   $0x8e,0x332fd
   30967:	b8 bd 10 03 00       	mov    $0x310bd,%eax
   3096c:	c1 e8 10             	shr    $0x10,%eax
   3096f:	66 a3 fe 32 03 00    	mov    %ax,0x332fe
   30975:	b8 c3 10 03 00       	mov    $0x310c3,%eax
   3097a:	66 a3 00 33 03 00    	mov    %ax,0x33300
   30980:	66 c7 05 02 33 03 00 	movw   $0x60,0x33302
   30987:	60 00 
   30989:	c6 05 04 33 03 00 00 	movb   $0x0,0x33304
   30990:	c6 05 05 33 03 00 8e 	movb   $0x8e,0x33305
   30997:	b8 c3 10 03 00       	mov    $0x310c3,%eax
   3099c:	c1 e8 10             	shr    $0x10,%eax
   3099f:	66 a3 06 33 03 00    	mov    %ax,0x33306
   309a5:	b8 c9 10 03 00       	mov    $0x310c9,%eax
   309aa:	66 a3 08 33 03 00    	mov    %ax,0x33308
   309b0:	66 c7 05 0a 33 03 00 	movw   $0x60,0x3330a
   309b7:	60 00 
   309b9:	c6 05 0c 33 03 00 00 	movb   $0x0,0x3330c
   309c0:	c6 05 0d 33 03 00 8e 	movb   $0x8e,0x3330d
   309c7:	b8 c9 10 03 00       	mov    $0x310c9,%eax
   309cc:	c1 e8 10             	shr    $0x10,%eax
   309cf:	66 a3 0e 33 03 00    	mov    %ax,0x3330e
   309d5:	b8 cf 10 03 00       	mov    $0x310cf,%eax
   309da:	66 a3 10 33 03 00    	mov    %ax,0x33310
   309e0:	66 c7 05 12 33 03 00 	movw   $0x60,0x33312
   309e7:	60 00 
   309e9:	c6 05 14 33 03 00 00 	movb   $0x0,0x33314
   309f0:	c6 05 15 33 03 00 8e 	movb   $0x8e,0x33315
   309f7:	b8 cf 10 03 00       	mov    $0x310cf,%eax
   309fc:	c1 e8 10             	shr    $0x10,%eax
   309ff:	66 a3 16 33 03 00    	mov    %ax,0x33316
   30a05:	b8 d5 10 03 00       	mov    $0x310d5,%eax
   30a0a:	66 a3 18 33 03 00    	mov    %ax,0x33318
   30a10:	66 c7 05 1a 33 03 00 	movw   $0x60,0x3331a
   30a17:	60 00 
   30a19:	c6 05 1c 33 03 00 00 	movb   $0x0,0x3331c
   30a20:	c6 05 1d 33 03 00 8e 	movb   $0x8e,0x3331d
   30a27:	b8 d5 10 03 00       	mov    $0x310d5,%eax
   30a2c:	c1 e8 10             	shr    $0x10,%eax
   30a2f:	66 a3 1e 33 03 00    	mov    %ax,0x3331e
   30a35:	b8 db 10 03 00       	mov    $0x310db,%eax
   30a3a:	66 a3 20 33 03 00    	mov    %ax,0x33320
   30a40:	66 c7 05 22 33 03 00 	movw   $0x60,0x33322
   30a47:	60 00 
   30a49:	c6 05 24 33 03 00 00 	movb   $0x0,0x33324
   30a50:	c6 05 25 33 03 00 8e 	movb   $0x8e,0x33325
   30a57:	b8 db 10 03 00       	mov    $0x310db,%eax
   30a5c:	c1 e8 10             	shr    $0x10,%eax
   30a5f:	66 a3 26 33 03 00    	mov    %ax,0x33326
   30a65:	b8 df 10 03 00       	mov    $0x310df,%eax
   30a6a:	66 a3 28 33 03 00    	mov    %ax,0x33328
   30a70:	66 c7 05 2a 33 03 00 	movw   $0x60,0x3332a
   30a77:	60 00 
   30a79:	c6 05 2c 33 03 00 00 	movb   $0x0,0x3332c
   30a80:	c6 05 2d 33 03 00 8e 	movb   $0x8e,0x3332d
   30a87:	b8 df 10 03 00       	mov    $0x310df,%eax
   30a8c:	c1 e8 10             	shr    $0x10,%eax
   30a8f:	66 a3 2e 33 03 00    	mov    %ax,0x3332e
   30a95:	b8 e5 10 03 00       	mov    $0x310e5,%eax
   30a9a:	66 a3 30 33 03 00    	mov    %ax,0x33330
   30aa0:	66 c7 05 32 33 03 00 	movw   $0x60,0x33332
   30aa7:	60 00 
   30aa9:	c6 05 34 33 03 00 00 	movb   $0x0,0x33334
   30ab0:	c6 05 35 33 03 00 8e 	movb   $0x8e,0x33335
   30ab7:	b8 e5 10 03 00       	mov    $0x310e5,%eax
   30abc:	c1 e8 10             	shr    $0x10,%eax
   30abf:	66 a3 36 33 03 00    	mov    %ax,0x33336
   30ac5:	b8 e9 10 03 00       	mov    $0x310e9,%eax
   30aca:	66 a3 38 33 03 00    	mov    %ax,0x33338
   30ad0:	66 c7 05 3a 33 03 00 	movw   $0x60,0x3333a
   30ad7:	60 00 
   30ad9:	c6 05 3c 33 03 00 00 	movb   $0x0,0x3333c
   30ae0:	c6 05 3d 33 03 00 8e 	movb   $0x8e,0x3333d
   30ae7:	b8 e9 10 03 00       	mov    $0x310e9,%eax
   30aec:	c1 e8 10             	shr    $0x10,%eax
   30aef:	66 a3 3e 33 03 00    	mov    %ax,0x3333e
   30af5:	b8 ed 10 03 00       	mov    $0x310ed,%eax
   30afa:	66 a3 40 33 03 00    	mov    %ax,0x33340
   30b00:	66 c7 05 42 33 03 00 	movw   $0x60,0x33342
   30b07:	60 00 
   30b09:	c6 05 44 33 03 00 00 	movb   $0x0,0x33344
   30b10:	c6 05 45 33 03 00 8e 	movb   $0x8e,0x33345
   30b17:	b8 ed 10 03 00       	mov    $0x310ed,%eax
   30b1c:	c1 e8 10             	shr    $0x10,%eax
   30b1f:	66 a3 46 33 03 00    	mov    %ax,0x33346
   30b25:	b8 f1 10 03 00       	mov    $0x310f1,%eax
   30b2a:	66 a3 48 33 03 00    	mov    %ax,0x33348
   30b30:	66 c7 05 4a 33 03 00 	movw   $0x60,0x3334a
   30b37:	60 00 
   30b39:	c6 05 4c 33 03 00 00 	movb   $0x0,0x3334c
   30b40:	c6 05 4d 33 03 00 8e 	movb   $0x8e,0x3334d
   30b47:	b8 f1 10 03 00       	mov    $0x310f1,%eax
   30b4c:	c1 e8 10             	shr    $0x10,%eax
   30b4f:	66 a3 4e 33 03 00    	mov    %ax,0x3334e
   30b55:	b8 f5 10 03 00       	mov    $0x310f5,%eax
   30b5a:	66 a3 50 33 03 00    	mov    %ax,0x33350
   30b60:	66 c7 05 52 33 03 00 	movw   $0x60,0x33352
   30b67:	60 00 
   30b69:	c6 05 54 33 03 00 00 	movb   $0x0,0x33354
   30b70:	c6 05 55 33 03 00 8e 	movb   $0x8e,0x33355
   30b77:	b8 f5 10 03 00       	mov    $0x310f5,%eax
   30b7c:	c1 e8 10             	shr    $0x10,%eax
   30b7f:	66 a3 56 33 03 00    	mov    %ax,0x33356
   30b85:	b8 f9 10 03 00       	mov    $0x310f9,%eax
   30b8a:	66 a3 60 33 03 00    	mov    %ax,0x33360
   30b90:	66 c7 05 62 33 03 00 	movw   $0x60,0x33362
   30b97:	60 00 
   30b99:	c6 05 64 33 03 00 00 	movb   $0x0,0x33364
   30ba0:	c6 05 65 33 03 00 8e 	movb   $0x8e,0x33365
   30ba7:	b8 f9 10 03 00       	mov    $0x310f9,%eax
   30bac:	c1 e8 10             	shr    $0x10,%eax
   30baf:	66 a3 66 33 03 00    	mov    %ax,0x33366
   30bb5:	b8 c0 0f 03 00       	mov    $0x30fc0,%eax
   30bba:	66 a3 e0 33 03 00    	mov    %ax,0x333e0
   30bc0:	66 c7 05 e2 33 03 00 	movw   $0x60,0x333e2
   30bc7:	60 00 
   30bc9:	c6 05 e4 33 03 00 00 	movb   $0x0,0x333e4
   30bd0:	c6 05 e5 33 03 00 8e 	movb   $0x8e,0x333e5
   30bd7:	b8 c0 0f 03 00       	mov    $0x30fc0,%eax
   30bdc:	c1 e8 10             	shr    $0x10,%eax
   30bdf:	66 a3 e6 33 03 00    	mov    %ax,0x333e6
   30be5:	b8 d0 0f 03 00       	mov    $0x30fd0,%eax
   30bea:	66 a3 e8 33 03 00    	mov    %ax,0x333e8
   30bf0:	66 c7 05 ea 33 03 00 	movw   $0x60,0x333ea
   30bf7:	60 00 
   30bf9:	c6 05 ec 33 03 00 00 	movb   $0x0,0x333ec
   30c00:	c6 05 ed 33 03 00 8e 	movb   $0x8e,0x333ed
   30c07:	b8 d0 0f 03 00       	mov    $0x30fd0,%eax
   30c0c:	c1 e8 10             	shr    $0x10,%eax
   30c0f:	66 a3 ee 33 03 00    	mov    %ax,0x333ee
   30c15:	b8 e0 0f 03 00       	mov    $0x30fe0,%eax
   30c1a:	66 a3 f0 33 03 00    	mov    %ax,0x333f0
   30c20:	66 c7 05 f2 33 03 00 	movw   $0x60,0x333f2
   30c27:	60 00 
   30c29:	c6 05 f4 33 03 00 00 	movb   $0x0,0x333f4
   30c30:	c6 05 f5 33 03 00 8e 	movb   $0x8e,0x333f5
   30c37:	b8 e0 0f 03 00       	mov    $0x30fe0,%eax
   30c3c:	c1 e8 10             	shr    $0x10,%eax
   30c3f:	66 a3 f6 33 03 00    	mov    %ax,0x333f6
   30c45:	b8 f0 0f 03 00       	mov    $0x30ff0,%eax
   30c4a:	66 a3 f8 33 03 00    	mov    %ax,0x333f8
   30c50:	66 c7 05 fa 33 03 00 	movw   $0x60,0x333fa
   30c57:	60 00 
   30c59:	c6 05 fc 33 03 00 00 	movb   $0x0,0x333fc
   30c60:	c6 05 fd 33 03 00 8e 	movb   $0x8e,0x333fd
   30c67:	b8 f0 0f 03 00       	mov    $0x30ff0,%eax
   30c6c:	c1 e8 10             	shr    $0x10,%eax
   30c6f:	66 a3 fe 33 03 00    	mov    %ax,0x333fe
   30c75:	b8 00 10 03 00       	mov    $0x31000,%eax
   30c7a:	66 a3 00 34 03 00    	mov    %ax,0x33400
   30c80:	66 c7 05 02 34 03 00 	movw   $0x60,0x33402
   30c87:	60 00 
   30c89:	c6 05 04 34 03 00 00 	movb   $0x0,0x33404
   30c90:	c6 05 05 34 03 00 8e 	movb   $0x8e,0x33405
   30c97:	b8 00 10 03 00       	mov    $0x31000,%eax
   30c9c:	c1 e8 10             	shr    $0x10,%eax
   30c9f:	66 a3 06 34 03 00    	mov    %ax,0x33406
   30ca5:	b8 10 10 03 00       	mov    $0x31010,%eax
   30caa:	66 a3 08 34 03 00    	mov    %ax,0x33408
   30cb0:	66 c7 05 0a 34 03 00 	movw   $0x60,0x3340a
   30cb7:	60 00 
   30cb9:	c6 05 0c 34 03 00 00 	movb   $0x0,0x3340c
   30cc0:	c6 05 0d 34 03 00 8e 	movb   $0x8e,0x3340d
   30cc7:	b8 10 10 03 00       	mov    $0x31010,%eax
   30ccc:	c1 e8 10             	shr    $0x10,%eax
   30ccf:	66 a3 0e 34 03 00    	mov    %ax,0x3340e
   30cd5:	b8 20 10 03 00       	mov    $0x31020,%eax
   30cda:	66 a3 10 34 03 00    	mov    %ax,0x33410
   30ce0:	66 c7 05 12 34 03 00 	movw   $0x60,0x33412
   30ce7:	60 00 
   30ce9:	c6 05 14 34 03 00 00 	movb   $0x0,0x33414
   30cf0:	c6 05 15 34 03 00 8e 	movb   $0x8e,0x33415
   30cf7:	b8 20 10 03 00       	mov    $0x31020,%eax
   30cfc:	c1 e8 10             	shr    $0x10,%eax
   30cff:	66 a3 16 34 03 00    	mov    %ax,0x33416
   30d05:	b8 30 10 03 00       	mov    $0x31030,%eax
   30d0a:	66 a3 18 34 03 00    	mov    %ax,0x33418
   30d10:	66 c7 05 1a 34 03 00 	movw   $0x60,0x3341a
   30d17:	60 00 
   30d19:	c6 05 1c 34 03 00 00 	movb   $0x0,0x3341c
   30d20:	c6 05 1d 34 03 00 8e 	movb   $0x8e,0x3341d
   30d27:	b8 30 10 03 00       	mov    $0x31030,%eax
   30d2c:	c1 e8 10             	shr    $0x10,%eax
   30d2f:	66 a3 1e 34 03 00    	mov    %ax,0x3341e
   30d35:	b8 40 10 03 00       	mov    $0x31040,%eax
   30d3a:	66 a3 20 34 03 00    	mov    %ax,0x33420
   30d40:	66 c7 05 22 34 03 00 	movw   $0x60,0x33422
   30d47:	60 00 
   30d49:	c6 05 24 34 03 00 00 	movb   $0x0,0x33424
   30d50:	c6 05 25 34 03 00 8e 	movb   $0x8e,0x33425
   30d57:	b8 40 10 03 00       	mov    $0x31040,%eax
   30d5c:	c1 e8 10             	shr    $0x10,%eax
   30d5f:	66 a3 26 34 03 00    	mov    %ax,0x33426
   30d65:	b8 50 10 03 00       	mov    $0x31050,%eax
   30d6a:	66 a3 28 34 03 00    	mov    %ax,0x33428
   30d70:	66 c7 05 2a 34 03 00 	movw   $0x60,0x3342a
   30d77:	60 00 
   30d79:	c6 05 2c 34 03 00 00 	movb   $0x0,0x3342c
   30d80:	c6 05 2d 34 03 00 8e 	movb   $0x8e,0x3342d
   30d87:	b8 50 10 03 00       	mov    $0x31050,%eax
   30d8c:	c1 e8 10             	shr    $0x10,%eax
   30d8f:	66 a3 2e 34 03 00    	mov    %ax,0x3342e
   30d95:	b8 60 10 03 00       	mov    $0x31060,%eax
   30d9a:	66 a3 30 34 03 00    	mov    %ax,0x33430
   30da0:	66 c7 05 32 34 03 00 	movw   $0x60,0x33432
   30da7:	60 00 
   30da9:	c6 05 34 34 03 00 00 	movb   $0x0,0x33434
   30db0:	c6 05 35 34 03 00 8e 	movb   $0x8e,0x33435
   30db7:	b8 60 10 03 00       	mov    $0x31060,%eax
   30dbc:	c1 e8 10             	shr    $0x10,%eax
   30dbf:	66 a3 36 34 03 00    	mov    %ax,0x33436
   30dc5:	b8 70 10 03 00       	mov    $0x31070,%eax
   30dca:	66 a3 38 34 03 00    	mov    %ax,0x33438
   30dd0:	66 c7 05 3a 34 03 00 	movw   $0x60,0x3343a
   30dd7:	60 00 
   30dd9:	c6 05 3c 34 03 00 00 	movb   $0x0,0x3343c
   30de0:	c6 05 3d 34 03 00 8e 	movb   $0x8e,0x3343d
   30de7:	b8 70 10 03 00       	mov    $0x31070,%eax
   30dec:	c1 e8 10             	shr    $0x10,%eax
   30def:	66 a3 3e 34 03 00    	mov    %ax,0x3343e
   30df5:	b8 80 10 03 00       	mov    $0x31080,%eax
   30dfa:	66 a3 40 34 03 00    	mov    %ax,0x33440
   30e00:	66 c7 05 42 34 03 00 	movw   $0x60,0x33442
   30e07:	60 00 
   30e09:	c6 05 44 34 03 00 00 	movb   $0x0,0x33444
   30e10:	c6 05 45 34 03 00 8e 	movb   $0x8e,0x33445
   30e17:	b8 80 10 03 00       	mov    $0x31080,%eax
   30e1c:	c1 e8 10             	shr    $0x10,%eax
   30e1f:	66 a3 46 34 03 00    	mov    %ax,0x33446
   30e25:	b8 90 10 03 00       	mov    $0x31090,%eax
   30e2a:	66 a3 48 34 03 00    	mov    %ax,0x33448
   30e30:	66 c7 05 4a 34 03 00 	movw   $0x60,0x3344a
   30e37:	60 00 
   30e39:	c6 05 4c 34 03 00 00 	movb   $0x0,0x3344c
   30e40:	c6 05 4d 34 03 00 8e 	movb   $0x8e,0x3344d
   30e47:	b8 90 10 03 00       	mov    $0x31090,%eax
   30e4c:	c1 e8 10             	shr    $0x10,%eax
   30e4f:	66 a3 4e 34 03 00    	mov    %ax,0x3344e
   30e55:	b8 a0 10 03 00       	mov    $0x310a0,%eax
   30e5a:	66 a3 50 34 03 00    	mov    %ax,0x33450
   30e60:	66 c7 05 52 34 03 00 	movw   $0x60,0x33452
   30e67:	60 00 
   30e69:	c6 05 54 34 03 00 00 	movb   $0x0,0x33454
   30e70:	c6 05 55 34 03 00 8e 	movb   $0x8e,0x33455
   30e77:	b8 a0 10 03 00       	mov    $0x310a0,%eax
   30e7c:	c1 e8 10             	shr    $0x10,%eax
   30e7f:	66 a3 56 34 03 00    	mov    %ax,0x33456
   30e85:	c7 45 f4 e0 3a 03 00 	movl   $0x33ae0,-0xc(%ebp)
   30e8c:	c7 45 f0 e2 3a 03 00 	movl   $0x33ae2,-0x10(%ebp)
   30e93:	8b 45 f4             	mov    -0xc(%ebp),%eax
   30e96:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
   30e9b:	ba e0 32 03 00       	mov    $0x332e0,%edx
   30ea0:	8b 45 f0             	mov    -0x10(%ebp),%eax
   30ea3:	89 10                	mov    %edx,(%eax)
   30ea5:	e8 f4 00 00 00       	call   30f9e <load_idt>
   30eaa:	c9                   	leave  
   30eab:	c3                   	ret    

00030eac <int_handler>:
   30eac:	55                   	push   %ebp
   30ead:	89 e5                	mov    %esp,%ebp
   30eaf:	83 ec 18             	sub    $0x18,%esp
   30eb2:	8b 45 08             	mov    0x8(%ebp),%eax
   30eb5:	89 44 24 04          	mov    %eax,0x4(%esp)
   30eb9:	c7 04 24 40 12 03 00 	movl   $0x31240,(%esp)
   30ec0:	e8 27 f6 ff ff       	call   304ec <printk>
   30ec5:	c9                   	leave  
   30ec6:	c3                   	ret    

00030ec7 <exception_handler>:
   30ec7:	55                   	push   %ebp
   30ec8:	89 e5                	mov    %esp,%ebp
   30eca:	57                   	push   %edi
   30ecb:	56                   	push   %esi
   30ecc:	53                   	push   %ebx
   30ecd:	83 ec 7c             	sub    $0x7c,%esp
   30ed0:	8d 55 94             	lea    -0x6c(%ebp),%edx
   30ed3:	bb 00 13 03 00       	mov    $0x31300,%ebx
   30ed8:	b8 14 00 00 00       	mov    $0x14,%eax
   30edd:	89 d7                	mov    %edx,%edi
   30edf:	89 de                	mov    %ebx,%esi
   30ee1:	89 c1                	mov    %eax,%ecx
   30ee3:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
   30ee5:	c7 05 c0 24 03 00 00 	movl   $0x0,0x324c0
   30eec:	00 00 00 
   30eef:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
   30ef6:	eb 10                	jmp    30f08 <exception_handler+0x41>
   30ef8:	c7 04 24 56 12 03 00 	movl   $0x31256,(%esp)
   30eff:	e8 e8 f5 ff ff       	call   304ec <printk>
   30f04:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
   30f08:	81 7d e4 8f 01 00 00 	cmpl   $0x18f,-0x1c(%ebp)
   30f0f:	7e e7                	jle    30ef8 <exception_handler+0x31>
   30f11:	c7 05 c0 24 03 00 00 	movl   $0x0,0x324c0
   30f18:	00 00 00 
   30f1b:	8b 45 08             	mov    0x8(%ebp),%eax
   30f1e:	8b 44 85 94          	mov    -0x6c(%ebp,%eax,4),%eax
   30f22:	89 44 24 04          	mov    %eax,0x4(%esp)
   30f26:	c7 04 24 58 12 03 00 	movl   $0x31258,(%esp)
   30f2d:	e8 ba f5 ff ff       	call   304ec <printk>
   30f32:	8b 45 18             	mov    0x18(%ebp),%eax
   30f35:	89 44 24 0c          	mov    %eax,0xc(%esp)
   30f39:	8b 45 14             	mov    0x14(%ebp),%eax
   30f3c:	89 44 24 08          	mov    %eax,0x8(%esp)
   30f40:	8b 45 10             	mov    0x10(%ebp),%eax
   30f43:	89 44 24 04          	mov    %eax,0x4(%esp)
   30f47:	c7 04 24 67 12 03 00 	movl   $0x31267,(%esp)
   30f4e:	e8 99 f5 ff ff       	call   304ec <printk>
   30f53:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
   30f57:	74 13                	je     30f6c <exception_handler+0xa5>
   30f59:	8b 45 0c             	mov    0xc(%ebp),%eax
   30f5c:	89 44 24 04          	mov    %eax,0x4(%esp)
   30f60:	c7 04 24 83 12 03 00 	movl   $0x31283,(%esp)
   30f67:	e8 80 f5 ff ff       	call   304ec <printk>
   30f6c:	83 c4 7c             	add    $0x7c,%esp
   30f6f:	5b                   	pop    %ebx
   30f70:	5e                   	pop    %esi
   30f71:	5f                   	pop    %edi
   30f72:	5d                   	pop    %ebp
   30f73:	c3                   	ret    
   30f74:	90                   	nop
   30f75:	90                   	nop
   30f76:	90                   	nop
   30f77:	90                   	nop
   30f78:	90                   	nop
   30f79:	90                   	nop
   30f7a:	90                   	nop
   30f7b:	90                   	nop
   30f7c:	90                   	nop
   30f7d:	90                   	nop
   30f7e:	90                   	nop
   30f7f:	90                   	nop

00030f80 <jump_new_gdt>:
   30f80:	0f 01 15 e6 3a 03 00 	lgdtl  0x33ae6
   30f87:	66 b8 68 00          	mov    $0x68,%ax
   30f8b:	8e d8                	mov    %eax,%ds
   30f8d:	8e c0                	mov    %eax,%es
   30f8f:	8e d0                	mov    %eax,%ss
   30f91:	8e e0                	mov    %eax,%fs
   30f93:	8e e8                	mov    %eax,%gs
   30f95:	ea 9d 0f 03 00 60 00 	ljmp   $0x60,$0x30f9d
   30f9c:	c3                   	ret    

00030f9d <use_new_gdt>:
   30f9d:	c3                   	ret    

00030f9e <load_idt>:
   30f9e:	0f 01 1d e0 3a 03 00 	lidtl  0x33ae0
   30fa5:	c3                   	ret    
   30fa6:	90                   	nop
   30fa7:	90                   	nop
   30fa8:	90                   	nop
   30fa9:	90                   	nop
   30faa:	90                   	nop
   30fab:	90                   	nop
   30fac:	90                   	nop
   30fad:	90                   	nop
   30fae:	90                   	nop
   30faf:	90                   	nop

00030fb0 <hwint00>:
   30fb0:	6a 00                	push   $0x0
   30fb2:	e8 f5 fe ff ff       	call   30eac <int_handler>
   30fb7:	83 c4 04             	add    $0x4,%esp
   30fba:	f4                   	hlt    
   30fbb:	90                   	nop
   30fbc:	90                   	nop
   30fbd:	90                   	nop
   30fbe:	90                   	nop
   30fbf:	90                   	nop

00030fc0 <hwint01>:
   30fc0:	6a 01                	push   $0x1
   30fc2:	e8 e5 fe ff ff       	call   30eac <int_handler>
   30fc7:	83 c4 04             	add    $0x4,%esp
   30fca:	f4                   	hlt    
   30fcb:	90                   	nop
   30fcc:	90                   	nop
   30fcd:	90                   	nop
   30fce:	90                   	nop
   30fcf:	90                   	nop

00030fd0 <hwint02>:
   30fd0:	6a 02                	push   $0x2
   30fd2:	e8 d5 fe ff ff       	call   30eac <int_handler>
   30fd7:	83 c4 04             	add    $0x4,%esp
   30fda:	f4                   	hlt    
   30fdb:	90                   	nop
   30fdc:	90                   	nop
   30fdd:	90                   	nop
   30fde:	90                   	nop
   30fdf:	90                   	nop

00030fe0 <hwint03>:
   30fe0:	6a 03                	push   $0x3
   30fe2:	e8 c5 fe ff ff       	call   30eac <int_handler>
   30fe7:	83 c4 04             	add    $0x4,%esp
   30fea:	f4                   	hlt    
   30feb:	90                   	nop
   30fec:	90                   	nop
   30fed:	90                   	nop
   30fee:	90                   	nop
   30fef:	90                   	nop

00030ff0 <hwint04>:
   30ff0:	6a 04                	push   $0x4
   30ff2:	e8 b5 fe ff ff       	call   30eac <int_handler>
   30ff7:	83 c4 04             	add    $0x4,%esp
   30ffa:	f4                   	hlt    
   30ffb:	90                   	nop
   30ffc:	90                   	nop
   30ffd:	90                   	nop
   30ffe:	90                   	nop
   30fff:	90                   	nop

00031000 <hwint05>:
   31000:	6a 05                	push   $0x5
   31002:	e8 a5 fe ff ff       	call   30eac <int_handler>
   31007:	83 c4 04             	add    $0x4,%esp
   3100a:	f4                   	hlt    
   3100b:	90                   	nop
   3100c:	90                   	nop
   3100d:	90                   	nop
   3100e:	90                   	nop
   3100f:	90                   	nop

00031010 <hwint06>:
   31010:	6a 06                	push   $0x6
   31012:	e8 95 fe ff ff       	call   30eac <int_handler>
   31017:	83 c4 04             	add    $0x4,%esp
   3101a:	f4                   	hlt    
   3101b:	90                   	nop
   3101c:	90                   	nop
   3101d:	90                   	nop
   3101e:	90                   	nop
   3101f:	90                   	nop

00031020 <hwint07>:
   31020:	6a 07                	push   $0x7
   31022:	e8 85 fe ff ff       	call   30eac <int_handler>
   31027:	83 c4 04             	add    $0x4,%esp
   3102a:	f4                   	hlt    
   3102b:	90                   	nop
   3102c:	90                   	nop
   3102d:	90                   	nop
   3102e:	90                   	nop
   3102f:	90                   	nop

00031030 <hwint08>:
   31030:	6a 08                	push   $0x8
   31032:	e8 75 fe ff ff       	call   30eac <int_handler>
   31037:	83 c4 04             	add    $0x4,%esp
   3103a:	f4                   	hlt    
   3103b:	90                   	nop
   3103c:	90                   	nop
   3103d:	90                   	nop
   3103e:	90                   	nop
   3103f:	90                   	nop

00031040 <hwint09>:
   31040:	6a 09                	push   $0x9
   31042:	e8 65 fe ff ff       	call   30eac <int_handler>
   31047:	83 c4 04             	add    $0x4,%esp
   3104a:	f4                   	hlt    
   3104b:	90                   	nop
   3104c:	90                   	nop
   3104d:	90                   	nop
   3104e:	90                   	nop
   3104f:	90                   	nop

00031050 <hwint10>:
   31050:	6a 0a                	push   $0xa
   31052:	e8 55 fe ff ff       	call   30eac <int_handler>
   31057:	83 c4 04             	add    $0x4,%esp
   3105a:	f4                   	hlt    
   3105b:	90                   	nop
   3105c:	90                   	nop
   3105d:	90                   	nop
   3105e:	90                   	nop
   3105f:	90                   	nop

00031060 <hwint11>:
   31060:	6a 0b                	push   $0xb
   31062:	e8 45 fe ff ff       	call   30eac <int_handler>
   31067:	83 c4 04             	add    $0x4,%esp
   3106a:	f4                   	hlt    
   3106b:	90                   	nop
   3106c:	90                   	nop
   3106d:	90                   	nop
   3106e:	90                   	nop
   3106f:	90                   	nop

00031070 <hwint12>:
   31070:	6a 0c                	push   $0xc
   31072:	e8 35 fe ff ff       	call   30eac <int_handler>
   31077:	83 c4 04             	add    $0x4,%esp
   3107a:	f4                   	hlt    
   3107b:	90                   	nop
   3107c:	90                   	nop
   3107d:	90                   	nop
   3107e:	90                   	nop
   3107f:	90                   	nop

00031080 <hwint13>:
   31080:	6a 0d                	push   $0xd
   31082:	e8 25 fe ff ff       	call   30eac <int_handler>
   31087:	83 c4 04             	add    $0x4,%esp
   3108a:	f4                   	hlt    
   3108b:	90                   	nop
   3108c:	90                   	nop
   3108d:	90                   	nop
   3108e:	90                   	nop
   3108f:	90                   	nop

00031090 <hwint14>:
   31090:	6a 0e                	push   $0xe
   31092:	e8 15 fe ff ff       	call   30eac <int_handler>
   31097:	83 c4 04             	add    $0x4,%esp
   3109a:	f4                   	hlt    
   3109b:	90                   	nop
   3109c:	90                   	nop
   3109d:	90                   	nop
   3109e:	90                   	nop
   3109f:	90                   	nop

000310a0 <hwint15>:
   310a0:	6a 0f                	push   $0xf
   310a2:	e8 05 fe ff ff       	call   30eac <int_handler>
   310a7:	83 c4 04             	add    $0x4,%esp
   310aa:	f4                   	hlt    

000310ab <divide_error>:
   310ab:	6a ff                	push   $0xffffffff
   310ad:	6a 00                	push   $0x0
   310af:	eb 4e                	jmp    310ff <exception>

000310b1 <debug>:
   310b1:	6a ff                	push   $0xffffffff
   310b3:	6a 01                	push   $0x1
   310b5:	eb 48                	jmp    310ff <exception>

000310b7 <nmi>:
   310b7:	6a ff                	push   $0xffffffff
   310b9:	6a 02                	push   $0x2
   310bb:	eb 42                	jmp    310ff <exception>

000310bd <int3>:
   310bd:	6a ff                	push   $0xffffffff
   310bf:	6a 03                	push   $0x3
   310c1:	eb 3c                	jmp    310ff <exception>

000310c3 <overflow>:
   310c3:	6a ff                	push   $0xffffffff
   310c5:	6a 04                	push   $0x4
   310c7:	eb 36                	jmp    310ff <exception>

000310c9 <bounds>:
   310c9:	6a ff                	push   $0xffffffff
   310cb:	6a 05                	push   $0x5
   310cd:	eb 30                	jmp    310ff <exception>

000310cf <invalid_op>:
   310cf:	6a ff                	push   $0xffffffff
   310d1:	6a 06                	push   $0x6
   310d3:	eb 2a                	jmp    310ff <exception>

000310d5 <device_not_available>:
   310d5:	6a ff                	push   $0xffffffff
   310d7:	6a 07                	push   $0x7
   310d9:	eb 24                	jmp    310ff <exception>

000310db <doublefault_fn>:
   310db:	6a 08                	push   $0x8
   310dd:	eb 20                	jmp    310ff <exception>

000310df <coprocessor_segment_overrun>:
   310df:	6a ff                	push   $0xffffffff
   310e1:	6a 09                	push   $0x9
   310e3:	eb 1a                	jmp    310ff <exception>

000310e5 <invalid_tss>:
   310e5:	6a 0a                	push   $0xa
   310e7:	eb 16                	jmp    310ff <exception>

000310e9 <segment_not_present>:
   310e9:	6a 0b                	push   $0xb
   310eb:	eb 12                	jmp    310ff <exception>

000310ed <stack_segment>:
   310ed:	6a 0c                	push   $0xc
   310ef:	eb 0e                	jmp    310ff <exception>

000310f1 <general_protection>:
   310f1:	6a 0d                	push   $0xd
   310f3:	eb 0a                	jmp    310ff <exception>

000310f5 <page_fault>:
   310f5:	6a 0e                	push   $0xe
   310f7:	eb 06                	jmp    310ff <exception>

000310f9 <coprocessor_error>:
   310f9:	6a ff                	push   $0xffffffff
   310fb:	6a 10                	push   $0x10
   310fd:	eb 00                	jmp    310ff <exception>

000310ff <exception>:
   310ff:	e8 c3 fd ff ff       	call   30ec7 <exception_handler>
   31104:	83 c4 08             	add    $0x8,%esp
   31107:	f4                   	hlt    
