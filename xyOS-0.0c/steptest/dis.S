
kernel.bin:     file format elf32-i386


Disassembly of section .text:

00030400 <_start>:
   30400:	bc 01 30 03 00       	mov    $0x33001,%esp
   30405:	0f 01 05 06 b0 03 00 	sgdtl  0x3b006
   3040c:	e8 0b 00 00 00       	call   3041c <__init__>
   30411:	fb                   	sti    
   30412:	e8 32 14 00 00       	call   31849 <restart_thread>
   30417:	eb fe                	jmp    30417 <_start+0x17>
   30419:	90                   	nop
   3041a:	90                   	nop
   3041b:	90                   	nop

0003041c <__init__>:
   3041c:	55                   	push   %ebp
   3041d:	89 e5                	mov    %esp,%ebp
   3041f:	83 ec 28             	sub    $0x28,%esp
   30422:	e8 95 08 00 00       	call   30cbc <change_gdt>
   30427:	c7 05 14 30 03 00 00 	movl   $0x0,0x33014
   3042e:	00 00 00 
   30431:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   30438:	eb 10                	jmp    3044a <__init__+0x2e>
   3043a:	c7 04 24 c0 1e 03 00 	movl   $0x31ec0,(%esp)
   30441:	e8 d6 16 00 00       	call   31b1c <printk>
   30446:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   3044a:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
   30451:	7e e7                	jle    3043a <__init__+0x1e>
   30453:	c7 05 14 30 03 00 00 	movl   $0x0,0x33014
   3045a:	00 00 00 
   3045d:	c7 04 24 c2 1e 03 00 	movl   $0x31ec2,(%esp)
   30464:	e8 b3 16 00 00       	call   31b1c <printk>
   30469:	e8 fe 06 00 00       	call   30b6c <init_8259A>
   3046e:	c7 44 24 04 ff 00 00 	movl   $0xff,0x4(%esp)
   30475:	00 
   30476:	c7 04 24 ff 00 00 00 	movl   $0xff,(%esp)
   3047d:	e8 db 07 00 00       	call   30c5d <op_8259A>
   30482:	c7 04 24 dc 1e 03 00 	movl   $0x31edc,(%esp)
   30489:	e8 8e 16 00 00       	call   31b1c <printk>
   3048e:	e8 b9 09 00 00       	call   30e4c <init_idt>
   30493:	c7 04 24 f5 1e 03 00 	movl   $0x31ef5,(%esp)
   3049a:	e8 7d 16 00 00       	call   31b1c <printk>
   3049f:	c7 04 24 0c 1f 03 00 	movl   $0x31f0c,(%esp)
   304a6:	e8 71 16 00 00       	call   31b1c <printk>
   304ab:	e8 28 19 00 00       	call   31dd8 <init_keybord>
   304b0:	e8 d3 18 00 00       	call   31d88 <init_timer>
   304b5:	e8 54 02 00 00       	call   3070e <init_task_tty>
   304ba:	c7 44 24 04 ff 00 00 	movl   $0xff,0x4(%esp)
   304c1:	00 
   304c2:	c7 04 24 fc 00 00 00 	movl   $0xfc,(%esp)
   304c9:	e8 8f 07 00 00       	call   30c5d <op_8259A>
   304ce:	c7 04 24 24 1f 03 00 	movl   $0x31f24,(%esp)
   304d5:	e8 42 16 00 00       	call   31b1c <printk>
   304da:	e8 a1 02 00 00       	call   30780 <init_first_thread>
   304df:	c7 04 24 40 1f 03 00 	movl   $0x31f40,(%esp)
   304e6:	e8 31 16 00 00       	call   31b1c <printk>
   304eb:	e8 ea 02 00 00       	call   307da <init_second_thread>
   304f0:	c7 04 24 60 1f 03 00 	movl   $0x31f60,(%esp)
   304f7:	e8 20 16 00 00       	call   31b1c <printk>
   304fc:	e8 33 03 00 00       	call   30834 <init_third_thread>
   30501:	c7 04 24 80 1f 03 00 	movl   $0x31f80,(%esp)
   30508:	e8 0f 16 00 00       	call   31b1c <printk>
   3050d:	e8 e9 05 00 00       	call   30afb <run_first_thread>
   30512:	c9                   	leave  
   30513:	c3                   	ret    

00030514 <strncpy>:
   30514:	55                   	push   %ebp
   30515:	89 e5                	mov    %esp,%ebp
   30517:	83 ec 10             	sub    $0x10,%esp
   3051a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
   30521:	eb 19                	jmp    3053c <strncpy+0x28>
   30523:	8b 45 fc             	mov    -0x4(%ebp),%eax
   30526:	8b 55 08             	mov    0x8(%ebp),%edx
   30529:	01 c2                	add    %eax,%edx
   3052b:	8b 45 fc             	mov    -0x4(%ebp),%eax
   3052e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
   30531:	01 c8                	add    %ecx,%eax
   30533:	0f b6 00             	movzbl (%eax),%eax
   30536:	88 02                	mov    %al,(%edx)
   30538:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   3053c:	8b 45 fc             	mov    -0x4(%ebp),%eax
   3053f:	3b 45 10             	cmp    0x10(%ebp),%eax
   30542:	73 20                	jae    30564 <strncpy+0x50>
   30544:	8b 45 fc             	mov    -0x4(%ebp),%eax
   30547:	8b 55 0c             	mov    0xc(%ebp),%edx
   3054a:	01 d0                	add    %edx,%eax
   3054c:	0f b6 00             	movzbl (%eax),%eax
   3054f:	84 c0                	test   %al,%al
   30551:	75 d0                	jne    30523 <strncpy+0xf>
   30553:	eb 0f                	jmp    30564 <strncpy+0x50>
   30555:	8b 45 fc             	mov    -0x4(%ebp),%eax
   30558:	8b 55 08             	mov    0x8(%ebp),%edx
   3055b:	01 d0                	add    %edx,%eax
   3055d:	c6 00 00             	movb   $0x0,(%eax)
   30560:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   30564:	8b 45 fc             	mov    -0x4(%ebp),%eax
   30567:	3b 45 10             	cmp    0x10(%ebp),%eax
   3056a:	72 e9                	jb     30555 <strncpy+0x41>
   3056c:	b8 01 00 00 00       	mov    $0x1,%eax
   30571:	c9                   	leave  
   30572:	c3                   	ret    

00030573 <wait>:
   30573:	55                   	push   %ebp
   30574:	89 e5                	mov    %esp,%ebp
   30576:	83 ec 10             	sub    $0x10,%esp
   30579:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
   30580:	eb 04                	jmp    30586 <wait+0x13>
   30582:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   30586:	8b 45 08             	mov    0x8(%ebp),%eax
   30589:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
   3058f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
   30592:	7f ee                	jg     30582 <wait+0xf>
   30594:	c9                   	leave  
   30595:	c3                   	ret    

00030596 <testA>:
   30596:	55                   	push   %ebp
   30597:	89 e5                	mov    %esp,%ebp
   30599:	83 ec 04             	sub    $0x4,%esp
   3059c:	c7 04 24 e8 03 00 00 	movl   $0x3e8,(%esp)
   305a3:	e8 cb ff ff ff       	call   30573 <wait>
   305a8:	eb f2                	jmp    3059c <testA+0x6>

000305aa <testB>:
   305aa:	55                   	push   %ebp
   305ab:	89 e5                	mov    %esp,%ebp
   305ad:	83 ec 18             	sub    $0x18,%esp
   305b0:	c7 04 24 9f 1f 03 00 	movl   $0x31f9f,(%esp)
   305b7:	e8 60 15 00 00       	call   31b1c <printk>
   305bc:	c7 04 24 e8 03 00 00 	movl   $0x3e8,(%esp)
   305c3:	e8 ab ff ff ff       	call   30573 <wait>
   305c8:	eb e6                	jmp    305b0 <testB+0x6>

000305ca <testC>:
   305ca:	55                   	push   %ebp
   305cb:	89 e5                	mov    %esp,%ebp
   305cd:	83 ec 18             	sub    $0x18,%esp
   305d0:	c7 04 24 a1 1f 03 00 	movl   $0x31fa1,(%esp)
   305d7:	e8 40 15 00 00       	call   31b1c <printk>
   305dc:	c7 04 24 e8 03 00 00 	movl   $0x3e8,(%esp)
   305e3:	e8 8b ff ff ff       	call   30573 <wait>
   305e8:	eb e6                	jmp    305d0 <testC+0x6>

000305ea <task_tty>:
   305ea:	55                   	push   %ebp
   305eb:	89 e5                	mov    %esp,%ebp
   305ed:	83 ec 08             	sub    $0x8,%esp
   305f0:	e8 1d 18 00 00       	call   31e12 <keyboard_read>
   305f5:	eb f9                	jmp    305f0 <task_tty+0x6>

000305f7 <list_init>:
   305f7:	55                   	push   %ebp
   305f8:	89 e5                	mov    %esp,%ebp
   305fa:	8b 45 08             	mov    0x8(%ebp),%eax
   305fd:	8d 50 08             	lea    0x8(%eax),%edx
   30600:	8b 45 08             	mov    0x8(%ebp),%eax
   30603:	89 50 04             	mov    %edx,0x4(%eax)
   30606:	8b 45 08             	mov    0x8(%ebp),%eax
   30609:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
   3060f:	8b 55 08             	mov    0x8(%ebp),%edx
   30612:	8b 45 08             	mov    0x8(%ebp),%eax
   30615:	89 50 08             	mov    %edx,0x8(%eax)
   30618:	8b 45 08             	mov    0x8(%ebp),%eax
   3061b:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
   30622:	b8 01 00 00 00       	mov    $0x1,%eax
   30627:	5d                   	pop    %ebp
   30628:	c3                   	ret    

00030629 <list_empty>:
   30629:	55                   	push   %ebp
   3062a:	89 e5                	mov    %esp,%ebp
   3062c:	8b 45 08             	mov    0x8(%ebp),%eax
   3062f:	8b 40 04             	mov    0x4(%eax),%eax
   30632:	8b 55 08             	mov    0x8(%ebp),%edx
   30635:	83 c2 08             	add    $0x8,%edx
   30638:	39 d0                	cmp    %edx,%eax
   3063a:	75 14                	jne    30650 <list_empty+0x27>
   3063c:	8b 45 08             	mov    0x8(%ebp),%eax
   3063f:	8b 50 08             	mov    0x8(%eax),%edx
   30642:	8b 45 08             	mov    0x8(%ebp),%eax
   30645:	39 c2                	cmp    %eax,%edx
   30647:	75 07                	jne    30650 <list_empty+0x27>
   30649:	b8 01 00 00 00       	mov    $0x1,%eax
   3064e:	eb 05                	jmp    30655 <list_empty+0x2c>
   30650:	b8 00 00 00 00       	mov    $0x0,%eax
   30655:	5d                   	pop    %ebp
   30656:	c3                   	ret    

00030657 <list_insert_next>:
   30657:	55                   	push   %ebp
   30658:	89 e5                	mov    %esp,%ebp
   3065a:	8b 45 08             	mov    0x8(%ebp),%eax
   3065d:	8b 50 04             	mov    0x4(%eax),%edx
   30660:	8b 45 0c             	mov    0xc(%ebp),%eax
   30663:	89 50 04             	mov    %edx,0x4(%eax)
   30666:	8b 45 0c             	mov    0xc(%ebp),%eax
   30669:	8b 55 08             	mov    0x8(%ebp),%edx
   3066c:	89 10                	mov    %edx,(%eax)
   3066e:	8b 45 08             	mov    0x8(%ebp),%eax
   30671:	8b 40 04             	mov    0x4(%eax),%eax
   30674:	8b 55 0c             	mov    0xc(%ebp),%edx
   30677:	89 10                	mov    %edx,(%eax)
   30679:	8b 45 08             	mov    0x8(%ebp),%eax
   3067c:	8b 55 0c             	mov    0xc(%ebp),%edx
   3067f:	89 50 04             	mov    %edx,0x4(%eax)
   30682:	b8 01 00 00 00       	mov    $0x1,%eax
   30687:	5d                   	pop    %ebp
   30688:	c3                   	ret    

00030689 <list_insert_prev>:
   30689:	55                   	push   %ebp
   3068a:	89 e5                	mov    %esp,%ebp
   3068c:	8b 45 08             	mov    0x8(%ebp),%eax
   3068f:	8b 55 0c             	mov    0xc(%ebp),%edx
   30692:	89 50 04             	mov    %edx,0x4(%eax)
   30695:	8b 45 0c             	mov    0xc(%ebp),%eax
   30698:	8b 10                	mov    (%eax),%edx
   3069a:	8b 45 08             	mov    0x8(%ebp),%eax
   3069d:	89 10                	mov    %edx,(%eax)
   3069f:	8b 45 0c             	mov    0xc(%ebp),%eax
   306a2:	8b 00                	mov    (%eax),%eax
   306a4:	8b 55 08             	mov    0x8(%ebp),%edx
   306a7:	89 50 04             	mov    %edx,0x4(%eax)
   306aa:	8b 45 0c             	mov    0xc(%ebp),%eax
   306ad:	8b 55 08             	mov    0x8(%ebp),%edx
   306b0:	89 10                	mov    %edx,(%eax)
   306b2:	b8 01 00 00 00       	mov    $0x1,%eax
   306b7:	5d                   	pop    %ebp
   306b8:	c3                   	ret    

000306b9 <list_insert_back>:
   306b9:	55                   	push   %ebp
   306ba:	89 e5                	mov    %esp,%ebp
   306bc:	83 ec 08             	sub    $0x8,%esp
   306bf:	8b 45 0c             	mov    0xc(%ebp),%eax
   306c2:	83 c0 08             	add    $0x8,%eax
   306c5:	89 44 24 04          	mov    %eax,0x4(%esp)
   306c9:	8b 45 08             	mov    0x8(%ebp),%eax
   306cc:	89 04 24             	mov    %eax,(%esp)
   306cf:	e8 b5 ff ff ff       	call   30689 <list_insert_prev>
   306d4:	c9                   	leave  
   306d5:	c3                   	ret    

000306d6 <list_remove>:
   306d6:	55                   	push   %ebp
   306d7:	89 e5                	mov    %esp,%ebp
   306d9:	8b 45 08             	mov    0x8(%ebp),%eax
   306dc:	8b 00                	mov    (%eax),%eax
   306de:	8b 55 08             	mov    0x8(%ebp),%edx
   306e1:	8b 52 04             	mov    0x4(%edx),%edx
   306e4:	89 50 04             	mov    %edx,0x4(%eax)
   306e7:	8b 45 08             	mov    0x8(%ebp),%eax
   306ea:	8b 40 04             	mov    0x4(%eax),%eax
   306ed:	8b 55 08             	mov    0x8(%ebp),%edx
   306f0:	8b 12                	mov    (%edx),%edx
   306f2:	89 10                	mov    %edx,(%eax)
   306f4:	8b 45 08             	mov    0x8(%ebp),%eax
   306f7:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
   306fe:	8b 45 08             	mov    0x8(%ebp),%eax
   30701:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
   30707:	b8 01 00 00 00       	mov    $0x1,%eax
   3070c:	5d                   	pop    %ebp
   3070d:	c3                   	ret    

0003070e <init_task_tty>:
   3070e:	55                   	push   %ebp
   3070f:	89 e5                	mov    %esp,%ebp
   30711:	83 ec 28             	sub    $0x28,%esp
   30714:	c7 04 24 04 40 03 00 	movl   $0x34004,(%esp)
   3071b:	e8 d7 fe ff ff       	call   305f7 <list_init>
   30720:	c7 04 24 14 40 03 00 	movl   $0x34014,(%esp)
   30727:	e8 cb fe ff ff       	call   305f7 <list_init>
   3072c:	c7 44 24 0c ea 05 03 	movl   $0x305ea,0xc(%esp)
   30733:	00 
   30734:	c7 44 24 08 a3 1f 03 	movl   $0x31fa3,0x8(%esp)
   3073b:	00 
   3073c:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
   30743:	00 
   30744:	c7 04 24 00 a0 03 00 	movl   $0x3a000,(%esp)
   3074b:	e8 eb 01 00 00       	call   3093b <init_thread>
   30750:	89 45 f4             	mov    %eax,-0xc(%ebp)
   30753:	c7 44 24 04 14 40 03 	movl   $0x34014,0x4(%esp)
   3075a:	00 
   3075b:	c7 04 24 6c a0 03 00 	movl   $0x3a06c,(%esp)
   30762:	e8 01 03 00 00       	call   30a68 <list_insert_by_pri>
   30767:	c7 44 24 04 04 40 03 	movl   $0x34004,0x4(%esp)
   3076e:	00 
   3076f:	c7 04 24 74 a0 03 00 	movl   $0x3a074,(%esp)
   30776:	e8 3e ff ff ff       	call   306b9 <list_insert_back>
   3077b:	8b 45 f4             	mov    -0xc(%ebp),%eax
   3077e:	c9                   	leave  
   3077f:	c3                   	ret    

00030780 <init_first_thread>:
   30780:	55                   	push   %ebp
   30781:	89 e5                	mov    %esp,%ebp
   30783:	83 ec 28             	sub    $0x28,%esp
   30786:	c7 44 24 0c 96 05 03 	movl   $0x30596,0xc(%esp)
   3078d:	00 
   3078e:	c7 44 24 08 ac 1f 03 	movl   $0x31fac,0x8(%esp)
   30795:	00 
   30796:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
   3079d:	00 
   3079e:	c7 04 24 00 70 03 00 	movl   $0x37000,(%esp)
   307a5:	e8 91 01 00 00       	call   3093b <init_thread>
   307aa:	89 45 f4             	mov    %eax,-0xc(%ebp)
   307ad:	c7 44 24 04 14 40 03 	movl   $0x34014,0x4(%esp)
   307b4:	00 
   307b5:	c7 04 24 6c 70 03 00 	movl   $0x3706c,(%esp)
   307bc:	e8 a7 02 00 00       	call   30a68 <list_insert_by_pri>
   307c1:	c7 44 24 04 04 40 03 	movl   $0x34004,0x4(%esp)
   307c8:	00 
   307c9:	c7 04 24 74 70 03 00 	movl   $0x37074,(%esp)
   307d0:	e8 e4 fe ff ff       	call   306b9 <list_insert_back>
   307d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
   307d8:	c9                   	leave  
   307d9:	c3                   	ret    

000307da <init_second_thread>:
   307da:	55                   	push   %ebp
   307db:	89 e5                	mov    %esp,%ebp
   307dd:	83 ec 28             	sub    $0x28,%esp
   307e0:	c7 44 24 0c aa 05 03 	movl   $0x305aa,0xc(%esp)
   307e7:	00 
   307e8:	c7 44 24 08 b2 1f 03 	movl   $0x31fb2,0x8(%esp)
   307ef:	00 
   307f0:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
   307f7:	00 
   307f8:	c7 04 24 00 50 03 00 	movl   $0x35000,(%esp)
   307ff:	e8 37 01 00 00       	call   3093b <init_thread>
   30804:	89 45 f4             	mov    %eax,-0xc(%ebp)
   30807:	c7 44 24 04 14 40 03 	movl   $0x34014,0x4(%esp)
   3080e:	00 
   3080f:	c7 04 24 6c 50 03 00 	movl   $0x3506c,(%esp)
   30816:	e8 4d 02 00 00       	call   30a68 <list_insert_by_pri>
   3081b:	c7 44 24 04 04 40 03 	movl   $0x34004,0x4(%esp)
   30822:	00 
   30823:	c7 04 24 74 50 03 00 	movl   $0x35074,(%esp)
   3082a:	e8 8a fe ff ff       	call   306b9 <list_insert_back>
   3082f:	8b 45 f4             	mov    -0xc(%ebp),%eax
   30832:	c9                   	leave  
   30833:	c3                   	ret    

00030834 <init_third_thread>:
   30834:	55                   	push   %ebp
   30835:	89 e5                	mov    %esp,%ebp
   30837:	83 ec 28             	sub    $0x28,%esp
   3083a:	c7 44 24 0c ca 05 03 	movl   $0x305ca,0xc(%esp)
   30841:	00 
   30842:	c7 44 24 08 b8 1f 03 	movl   $0x31fb8,0x8(%esp)
   30849:	00 
   3084a:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
   30851:	00 
   30852:	c7 04 24 00 80 03 00 	movl   $0x38000,(%esp)
   30859:	e8 dd 00 00 00       	call   3093b <init_thread>
   3085e:	89 45 f4             	mov    %eax,-0xc(%ebp)
   30861:	c7 44 24 04 14 40 03 	movl   $0x34014,0x4(%esp)
   30868:	00 
   30869:	c7 04 24 6c 80 03 00 	movl   $0x3806c,(%esp)
   30870:	e8 f3 01 00 00       	call   30a68 <list_insert_by_pri>
   30875:	c7 44 24 04 04 40 03 	movl   $0x34004,0x4(%esp)
   3087c:	00 
   3087d:	c7 04 24 74 80 03 00 	movl   $0x38074,(%esp)
   30884:	e8 30 fe ff ff       	call   306b9 <list_insert_back>
   30889:	8b 45 f4             	mov    -0xc(%ebp),%eax
   3088c:	c9                   	leave  
   3088d:	c3                   	ret    

0003088e <init_K_thread>:
   3088e:	55                   	push   %ebp
   3088f:	89 e5                	mov    %esp,%ebp
   30891:	83 ec 0c             	sub    $0xc,%esp
   30894:	a1 0c 30 03 00       	mov    0x3300c,%eax
   30899:	89 c2                	mov    %eax,%edx
   3089b:	8b 45 08             	mov    0x8(%ebp),%eax
   3089e:	89 50 38             	mov    %edx,0x38(%eax)
   308a1:	a1 10 30 03 00       	mov    0x33010,%eax
   308a6:	89 c2                	mov    %eax,%edx
   308a8:	8b 45 08             	mov    0x8(%ebp),%eax
   308ab:	89 10                	mov    %edx,(%eax)
   308ad:	a1 10 30 03 00       	mov    0x33010,%eax
   308b2:	89 c2                	mov    %eax,%edx
   308b4:	8b 45 08             	mov    0x8(%ebp),%eax
   308b7:	89 50 04             	mov    %edx,0x4(%eax)
   308ba:	a1 10 30 03 00       	mov    0x33010,%eax
   308bf:	89 c2                	mov    %eax,%edx
   308c1:	8b 45 08             	mov    0x8(%ebp),%eax
   308c4:	89 50 08             	mov    %edx,0x8(%eax)
   308c7:	a1 10 30 03 00       	mov    0x33010,%eax
   308cc:	89 c2                	mov    %eax,%edx
   308ce:	8b 45 08             	mov    0x8(%ebp),%eax
   308d1:	89 50 0c             	mov    %edx,0xc(%eax)
   308d4:	a1 10 30 03 00       	mov    0x33010,%eax
   308d9:	89 c2                	mov    %eax,%edx
   308db:	8b 45 08             	mov    0x8(%ebp),%eax
   308de:	89 50 44             	mov    %edx,0x44(%eax)
   308e1:	8b 55 14             	mov    0x14(%ebp),%edx
   308e4:	8b 45 08             	mov    0x8(%ebp),%eax
   308e7:	89 50 34             	mov    %edx,0x34(%eax)
   308ea:	8b 45 08             	mov    0x8(%ebp),%eax
   308ed:	05 00 10 00 00       	add    $0x1000,%eax
   308f2:	89 c2                	mov    %eax,%edx
   308f4:	8b 45 08             	mov    0x8(%ebp),%eax
   308f7:	89 50 40             	mov    %edx,0x40(%eax)
   308fa:	8b 45 08             	mov    0x8(%ebp),%eax
   308fd:	c7 40 3c 02 12 00 00 	movl   $0x1202,0x3c(%eax)
   30904:	8b 45 08             	mov    0x8(%ebp),%eax
   30907:	8d 50 4c             	lea    0x4c(%eax),%edx
   3090a:	c7 44 24 08 14 00 00 	movl   $0x14,0x8(%esp)
   30911:	00 
   30912:	8b 45 10             	mov    0x10(%ebp),%eax
   30915:	89 44 24 04          	mov    %eax,0x4(%esp)
   30919:	89 14 24             	mov    %edx,(%esp)
   3091c:	e8 f3 fb ff ff       	call   30514 <strncpy>
   30921:	8b 45 08             	mov    0x8(%ebp),%eax
   30924:	c7 40 64 00 00 00 00 	movl   $0x0,0x64(%eax)
   3092b:	8b 45 08             	mov    0x8(%ebp),%eax
   3092e:	8b 55 0c             	mov    0xc(%ebp),%edx
   30931:	89 50 60             	mov    %edx,0x60(%eax)
   30934:	b8 01 00 00 00       	mov    $0x1,%eax
   30939:	c9                   	leave  
   3093a:	c3                   	ret    

0003093b <init_thread>:
   3093b:	55                   	push   %ebp
   3093c:	89 e5                	mov    %esp,%ebp
   3093e:	83 ec 0c             	sub    $0xc,%esp
   30941:	a1 04 30 03 00       	mov    0x33004,%eax
   30946:	89 c2                	mov    %eax,%edx
   30948:	8b 45 08             	mov    0x8(%ebp),%eax
   3094b:	89 50 38             	mov    %edx,0x38(%eax)
   3094e:	a1 08 30 03 00       	mov    0x33008,%eax
   30953:	89 c2                	mov    %eax,%edx
   30955:	8b 45 08             	mov    0x8(%ebp),%eax
   30958:	89 10                	mov    %edx,(%eax)
   3095a:	a1 08 30 03 00       	mov    0x33008,%eax
   3095f:	89 c2                	mov    %eax,%edx
   30961:	8b 45 08             	mov    0x8(%ebp),%eax
   30964:	89 50 04             	mov    %edx,0x4(%eax)
   30967:	a1 08 30 03 00       	mov    0x33008,%eax
   3096c:	89 c2                	mov    %eax,%edx
   3096e:	8b 45 08             	mov    0x8(%ebp),%eax
   30971:	89 50 08             	mov    %edx,0x8(%eax)
   30974:	a1 08 30 03 00       	mov    0x33008,%eax
   30979:	89 c2                	mov    %eax,%edx
   3097b:	8b 45 08             	mov    0x8(%ebp),%eax
   3097e:	89 50 0c             	mov    %edx,0xc(%eax)
   30981:	a1 08 30 03 00       	mov    0x33008,%eax
   30986:	89 c2                	mov    %eax,%edx
   30988:	8b 45 08             	mov    0x8(%ebp),%eax
   3098b:	89 50 44             	mov    %edx,0x44(%eax)
   3098e:	8b 55 14             	mov    0x14(%ebp),%edx
   30991:	8b 45 08             	mov    0x8(%ebp),%eax
   30994:	89 50 34             	mov    %edx,0x34(%eax)
   30997:	8b 45 08             	mov    0x8(%ebp),%eax
   3099a:	05 00 10 00 00       	add    $0x1000,%eax
   3099f:	89 c2                	mov    %eax,%edx
   309a1:	8b 45 08             	mov    0x8(%ebp),%eax
   309a4:	89 50 40             	mov    %edx,0x40(%eax)
   309a7:	8b 45 08             	mov    0x8(%ebp),%eax
   309aa:	c7 40 3c 02 12 00 00 	movl   $0x1202,0x3c(%eax)
   309b1:	8b 45 08             	mov    0x8(%ebp),%eax
   309b4:	8d 50 4c             	lea    0x4c(%eax),%edx
   309b7:	c7 44 24 08 14 00 00 	movl   $0x14,0x8(%esp)
   309be:	00 
   309bf:	8b 45 10             	mov    0x10(%ebp),%eax
   309c2:	89 44 24 04          	mov    %eax,0x4(%esp)
   309c6:	89 14 24             	mov    %edx,(%esp)
   309c9:	e8 46 fb ff ff       	call   30514 <strncpy>
   309ce:	8b 45 08             	mov    0x8(%ebp),%eax
   309d1:	c7 40 64 00 00 00 00 	movl   $0x0,0x64(%eax)
   309d8:	8b 45 08             	mov    0x8(%ebp),%eax
   309db:	8b 55 0c             	mov    0xc(%ebp),%edx
   309de:	89 50 60             	mov    %edx,0x60(%eax)
   309e1:	b8 01 00 00 00       	mov    $0x1,%eax
   309e6:	c9                   	leave  
   309e7:	c3                   	ret    

000309e8 <running_thread>:
   309e8:	55                   	push   %ebp
   309e9:	89 e5                	mov    %esp,%ebp
   309eb:	a1 00 40 03 00       	mov    0x34000,%eax
   309f0:	25 00 f0 ff ff       	and    $0xfffff000,%eax
   309f5:	5d                   	pop    %ebp
   309f6:	c3                   	ret    

000309f7 <current_thread_ticks>:
   309f7:	55                   	push   %ebp
   309f8:	89 e5                	mov    %esp,%ebp
   309fa:	e8 e9 ff ff ff       	call   309e8 <running_thread>
   309ff:	8b 40 64             	mov    0x64(%eax),%eax
   30a02:	5d                   	pop    %ebp
   30a03:	c3                   	ret    

00030a04 <current_thread_ticks_inc>:
   30a04:	55                   	push   %ebp
   30a05:	89 e5                	mov    %esp,%ebp
   30a07:	e8 dc ff ff ff       	call   309e8 <running_thread>
   30a0c:	8b 50 64             	mov    0x64(%eax),%edx
   30a0f:	83 c2 01             	add    $0x1,%edx
   30a12:	89 50 64             	mov    %edx,0x64(%eax)
   30a15:	5d                   	pop    %ebp
   30a16:	c3                   	ret    

00030a17 <next_thread_to_run>:
   30a17:	55                   	push   %ebp
   30a18:	89 e5                	mov    %esp,%ebp
   30a1a:	83 ec 18             	sub    $0x18,%esp
   30a1d:	c7 04 24 14 40 03 00 	movl   $0x34014,(%esp)
   30a24:	e8 00 fc ff ff       	call   30629 <list_empty>
   30a29:	85 c0                	test   %eax,%eax
   30a2b:	74 07                	je     30a34 <next_thread_to_run+0x1d>
   30a2d:	b8 00 a0 03 00       	mov    $0x3a000,%eax
   30a32:	eb 32                	jmp    30a66 <next_thread_to_run+0x4f>
   30a34:	a1 18 40 03 00       	mov    0x34018,%eax
   30a39:	83 e8 6c             	sub    $0x6c,%eax
   30a3c:	89 45 fc             	mov    %eax,-0x4(%ebp)
   30a3f:	8b 45 fc             	mov    -0x4(%ebp),%eax
   30a42:	83 c0 6c             	add    $0x6c,%eax
   30a45:	89 04 24             	mov    %eax,(%esp)
   30a48:	e8 89 fc ff ff       	call   306d6 <list_remove>
   30a4d:	8b 45 fc             	mov    -0x4(%ebp),%eax
   30a50:	83 c0 6c             	add    $0x6c,%eax
   30a53:	c7 44 24 04 14 40 03 	movl   $0x34014,0x4(%esp)
   30a5a:	00 
   30a5b:	89 04 24             	mov    %eax,(%esp)
   30a5e:	e8 56 fc ff ff       	call   306b9 <list_insert_back>
   30a63:	8b 45 fc             	mov    -0x4(%ebp),%eax
   30a66:	c9                   	leave  
   30a67:	c3                   	ret    

00030a68 <list_insert_by_pri>:
   30a68:	55                   	push   %ebp
   30a69:	89 e5                	mov    %esp,%ebp
   30a6b:	83 ec 18             	sub    $0x18,%esp
   30a6e:	8b 45 0c             	mov    0xc(%ebp),%eax
   30a71:	89 04 24             	mov    %eax,(%esp)
   30a74:	e8 b0 fb ff ff       	call   30629 <list_empty>
   30a79:	85 c0                	test   %eax,%eax
   30a7b:	74 19                	je     30a96 <list_insert_by_pri+0x2e>
   30a7d:	8b 45 0c             	mov    0xc(%ebp),%eax
   30a80:	8b 55 08             	mov    0x8(%ebp),%edx
   30a83:	89 54 24 04          	mov    %edx,0x4(%esp)
   30a87:	89 04 24             	mov    %eax,(%esp)
   30a8a:	e8 c8 fb ff ff       	call   30657 <list_insert_next>
   30a8f:	b8 01 00 00 00       	mov    $0x1,%eax
   30a94:	eb 63                	jmp    30af9 <list_insert_by_pri+0x91>
   30a96:	8b 45 0c             	mov    0xc(%ebp),%eax
   30a99:	8b 40 04             	mov    0x4(%eax),%eax
   30a9c:	89 45 fc             	mov    %eax,-0x4(%ebp)
   30a9f:	8b 45 08             	mov    0x8(%ebp),%eax
   30aa2:	83 e8 6c             	sub    $0x6c,%eax
   30aa5:	8b 50 60             	mov    0x60(%eax),%edx
   30aa8:	8b 45 fc             	mov    -0x4(%ebp),%eax
   30aab:	83 e8 6c             	sub    $0x6c,%eax
   30aae:	8b 40 60             	mov    0x60(%eax),%eax
   30ab1:	39 c2                	cmp    %eax,%edx
   30ab3:	7d 19                	jge    30ace <list_insert_by_pri+0x66>
   30ab5:	8b 45 fc             	mov    -0x4(%ebp),%eax
   30ab8:	89 44 24 04          	mov    %eax,0x4(%esp)
   30abc:	8b 45 08             	mov    0x8(%ebp),%eax
   30abf:	89 04 24             	mov    %eax,(%esp)
   30ac2:	e8 c2 fb ff ff       	call   30689 <list_insert_prev>
   30ac7:	b8 01 00 00 00       	mov    $0x1,%eax
   30acc:	eb 2b                	jmp    30af9 <list_insert_by_pri+0x91>
   30ace:	8b 45 fc             	mov    -0x4(%ebp),%eax
   30ad1:	8b 40 04             	mov    0x4(%eax),%eax
   30ad4:	89 45 fc             	mov    %eax,-0x4(%ebp)
   30ad7:	8b 45 0c             	mov    0xc(%ebp),%eax
   30ada:	83 c0 08             	add    $0x8,%eax
   30add:	3b 45 fc             	cmp    -0x4(%ebp),%eax
   30ae0:	75 bd                	jne    30a9f <list_insert_by_pri+0x37>
   30ae2:	8b 45 0c             	mov    0xc(%ebp),%eax
   30ae5:	89 44 24 04          	mov    %eax,0x4(%esp)
   30ae9:	8b 45 08             	mov    0x8(%ebp),%eax
   30aec:	89 04 24             	mov    %eax,(%esp)
   30aef:	e8 c5 fb ff ff       	call   306b9 <list_insert_back>
   30af4:	b8 01 00 00 00       	mov    $0x1,%eax
   30af9:	c9                   	leave  
   30afa:	c3                   	ret    

00030afb <run_first_thread>:
   30afb:	55                   	push   %ebp
   30afc:	89 e5                	mov    %esp,%ebp
   30afe:	83 ec 08             	sub    $0x8,%esp
   30b01:	e8 11 ff ff ff       	call   30a17 <next_thread_to_run>
   30b06:	a3 00 90 03 00       	mov    %eax,0x39000
   30b0b:	e8 39 0d 00 00       	call   31849 <restart_thread>
   30b10:	c9                   	leave  
   30b11:	c3                   	ret    
   30b12:	90                   	nop
   30b13:	90                   	nop
   30b14:	90                   	nop
   30b15:	90                   	nop
   30b16:	90                   	nop
   30b17:	90                   	nop
   30b18:	90                   	nop
   30b19:	90                   	nop
   30b1a:	90                   	nop
   30b1b:	90                   	nop
   30b1c:	90                   	nop
   30b1d:	90                   	nop
   30b1e:	90                   	nop
   30b1f:	90                   	nop

00030b20 <disp_str>:
   30b20:	55                   	push   %ebp
   30b21:	89 e5                	mov    %esp,%ebp
   30b23:	8b 75 08             	mov    0x8(%ebp),%esi
   30b26:	8b 3d 14 30 03 00    	mov    0x33014,%edi
   30b2c:	b4 0f                	mov    $0xf,%ah

00030b2e <disp_str.1>:
   30b2e:	ac                   	lods   %ds:(%esi),%al
   30b2f:	84 c0                	test   %al,%al
   30b31:	74 2f                	je     30b62 <disp_str.2>
   30b33:	3c 0a                	cmp    $0xa,%al
   30b35:	75 16                	jne    30b4d <disp_str.3>
   30b37:	50                   	push   %eax
   30b38:	89 f8                	mov    %edi,%eax
   30b3a:	b3 a0                	mov    $0xa0,%bl
   30b3c:	f6 f3                	div    %bl
   30b3e:	25 ff 00 00 00       	and    $0xff,%eax
   30b43:	40                   	inc    %eax
   30b44:	b3 a0                	mov    $0xa0,%bl
   30b46:	f6 e3                	mul    %bl
   30b48:	89 c7                	mov    %eax,%edi
   30b4a:	58                   	pop    %eax
   30b4b:	eb e1                	jmp    30b2e <disp_str.1>

00030b4d <disp_str.3>:
   30b4d:	81 c7 00 80 0b 00    	add    $0xb8000,%edi
   30b53:	65 66 89 07          	mov    %ax,%gs:(%edi)
   30b57:	81 ef 00 80 0b 00    	sub    $0xb8000,%edi
   30b5d:	83 c7 02             	add    $0x2,%edi
   30b60:	eb cc                	jmp    30b2e <disp_str.1>

00030b62 <disp_str.2>:
   30b62:	89 3d 14 30 03 00    	mov    %edi,0x33014
   30b68:	5d                   	pop    %ebp
   30b69:	c3                   	ret    
   30b6a:	90                   	nop
   30b6b:	90                   	nop

00030b6c <init_8259A>:
   30b6c:	55                   	push   %ebp
   30b6d:	89 e5                	mov    %esp,%ebp
   30b6f:	83 ec 28             	sub    $0x28,%esp
   30b72:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   30b79:	eb 12                	jmp    30b8d <init_8259A+0x21>
   30b7b:	8b 45 f4             	mov    -0xc(%ebp),%eax
   30b7e:	c7 04 85 e0 4c 03 00 	movl   $0x31967,0x34ce0(,%eax,4)
   30b85:	67 19 03 00 
   30b89:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   30b8d:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
   30b91:	7e e8                	jle    30b7b <init_8259A+0xf>
   30b93:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
   30b9a:	00 
   30b9b:	c7 04 24 ff 00 00 00 	movl   $0xff,(%esp)
   30ba2:	e8 e9 00 00 00       	call   30c90 <outb>
   30ba7:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
   30bae:	00 
   30baf:	c7 04 24 ff 00 00 00 	movl   $0xff,(%esp)
   30bb6:	e8 d5 00 00 00       	call   30c90 <outb>
   30bbb:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
   30bc2:	00 
   30bc3:	c7 04 24 11 00 00 00 	movl   $0x11,(%esp)
   30bca:	e8 cb 00 00 00       	call   30c9a <outb_pic>
   30bcf:	c7 44 24 04 a0 00 00 	movl   $0xa0,0x4(%esp)
   30bd6:	00 
   30bd7:	c7 04 24 11 00 00 00 	movl   $0x11,(%esp)
   30bde:	e8 b7 00 00 00       	call   30c9a <outb_pic>
   30be3:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
   30bea:	00 
   30beb:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
   30bf2:	e8 a3 00 00 00       	call   30c9a <outb_pic>
   30bf7:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
   30bfe:	00 
   30bff:	c7 04 24 28 00 00 00 	movl   $0x28,(%esp)
   30c06:	e8 8f 00 00 00       	call   30c9a <outb_pic>
   30c0b:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
   30c12:	00 
   30c13:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
   30c1a:	e8 7b 00 00 00       	call   30c9a <outb_pic>
   30c1f:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
   30c26:	00 
   30c27:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
   30c2e:	e8 67 00 00 00       	call   30c9a <outb_pic>
   30c33:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
   30c3a:	00 
   30c3b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
   30c42:	e8 53 00 00 00       	call   30c9a <outb_pic>
   30c47:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
   30c4e:	00 
   30c4f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
   30c56:	e8 3f 00 00 00       	call   30c9a <outb_pic>
   30c5b:	c9                   	leave  
   30c5c:	c3                   	ret    

00030c5d <op_8259A>:
   30c5d:	55                   	push   %ebp
   30c5e:	89 e5                	mov    %esp,%ebp
   30c60:	83 ec 18             	sub    $0x18,%esp
   30c63:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
   30c6a:	00 
   30c6b:	8b 45 08             	mov    0x8(%ebp),%eax
   30c6e:	89 04 24             	mov    %eax,(%esp)
   30c71:	e8 24 00 00 00       	call   30c9a <outb_pic>
   30c76:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
   30c7d:	00 
   30c7e:	8b 45 0c             	mov    0xc(%ebp),%eax
   30c81:	89 04 24             	mov    %eax,(%esp)
   30c84:	e8 11 00 00 00       	call   30c9a <outb_pic>
   30c89:	c9                   	leave  
   30c8a:	c3                   	ret    
   30c8b:	90                   	nop
   30c8c:	90                   	nop
   30c8d:	90                   	nop
   30c8e:	90                   	nop
   30c8f:	90                   	nop

00030c90 <outb>:
   30c90:	8b 44 24 04          	mov    0x4(%esp),%eax
   30c94:	8b 54 24 08          	mov    0x8(%esp),%edx
   30c98:	ee                   	out    %al,(%dx)
   30c99:	c3                   	ret    

00030c9a <outb_pic>:
   30c9a:	8b 44 24 04          	mov    0x4(%esp),%eax
   30c9e:	8b 54 24 08          	mov    0x8(%esp),%edx
   30ca2:	ee                   	out    %al,(%dx)
   30ca3:	90                   	nop
   30ca4:	90                   	nop
   30ca5:	c3                   	ret    

00030ca6 <inb>:
   30ca6:	8b 54 24 04          	mov    0x4(%esp),%edx
   30caa:	31 c0                	xor    %eax,%eax
   30cac:	ec                   	in     (%dx),%al
   30cad:	c3                   	ret    

00030cae <inb_pic>:
   30cae:	8b 54 24 04          	mov    0x4(%esp),%edx
   30cb2:	31 c0                	xor    %eax,%eax
   30cb4:	ec                   	in     (%dx),%al
   30cb5:	90                   	nop
   30cb6:	90                   	nop
   30cb7:	c3                   	ret    

00030cb8 <disable_intr>:
   30cb8:	fa                   	cli    
   30cb9:	c3                   	ret    

00030cba <enable_intr>:
   30cba:	fb                   	sti    
   30cbb:	c3                   	ret    

00030cbc <change_gdt>:
   30cbc:	55                   	push   %ebp
   30cbd:	89 e5                	mov    %esp,%ebp
   30cbf:	83 ec 18             	sub    $0x18,%esp
   30cc2:	66 c7 05 40 40 03 00 	movw   $0x0,0x34040
   30cc9:	00 00 
   30ccb:	66 c7 05 42 40 03 00 	movw   $0x0,0x34042
   30cd2:	00 00 
   30cd4:	c6 05 44 40 03 00 00 	movb   $0x0,0x34044
   30cdb:	c6 05 45 40 03 00 00 	movb   $0x0,0x34045
   30ce2:	c6 05 46 40 03 00 00 	movb   $0x0,0x34046
   30ce9:	c6 05 47 40 03 00 00 	movb   $0x0,0x34047
   30cf0:	66 c7 05 a0 40 03 00 	movw   $0xffff,0x340a0
   30cf7:	ff ff 
   30cf9:	66 c7 05 a2 40 03 00 	movw   $0x0,0x340a2
   30d00:	00 00 
   30d02:	c6 05 a4 40 03 00 00 	movb   $0x0,0x340a4
   30d09:	c6 05 a5 40 03 00 9a 	movb   $0x9a,0x340a5
   30d10:	c6 05 a6 40 03 00 cf 	movb   $0xcf,0x340a6
   30d17:	c6 05 a7 40 03 00 00 	movb   $0x0,0x340a7
   30d1e:	66 c7 05 a8 40 03 00 	movw   $0xffff,0x340a8
   30d25:	ff ff 
   30d27:	66 c7 05 aa 40 03 00 	movw   $0x0,0x340aa
   30d2e:	00 00 
   30d30:	c6 05 ac 40 03 00 00 	movb   $0x0,0x340ac
   30d37:	c6 05 ad 40 03 00 93 	movb   $0x93,0x340ad
   30d3e:	c6 05 ae 40 03 00 cf 	movb   $0xcf,0x340ae
   30d45:	c6 05 af 40 03 00 00 	movb   $0x0,0x340af
   30d4c:	66 c7 05 b0 40 03 00 	movw   $0xffff,0x340b0
   30d53:	ff ff 
   30d55:	66 c7 05 b2 40 03 00 	movw   $0x0,0x340b2
   30d5c:	00 00 
   30d5e:	c6 05 b4 40 03 00 00 	movb   $0x0,0x340b4
   30d65:	c6 05 b5 40 03 00 fa 	movb   $0xfa,0x340b5
   30d6c:	c6 05 b6 40 03 00 cf 	movb   $0xcf,0x340b6
   30d73:	c6 05 b7 40 03 00 00 	movb   $0x0,0x340b7
   30d7a:	66 c7 05 b8 40 03 00 	movw   $0xffff,0x340b8
   30d81:	ff ff 
   30d83:	66 c7 05 ba 40 03 00 	movw   $0x0,0x340ba
   30d8a:	00 00 
   30d8c:	c6 05 bc 40 03 00 00 	movb   $0x0,0x340bc
   30d93:	c6 05 bd 40 03 00 f3 	movb   $0xf3,0x340bd
   30d9a:	c6 05 be 40 03 00 cf 	movb   $0xcf,0x340be
   30da1:	c6 05 bf 40 03 00 00 	movb   $0x0,0x340bf
   30da8:	66 c7 05 b8 40 03 00 	movw   $0xffff,0x340b8
   30daf:	ff ff 
   30db1:	66 c7 05 ba 40 03 00 	movw   $0x0,0x340ba
   30db8:	00 00 
   30dba:	c6 05 bc 40 03 00 00 	movb   $0x0,0x340bc
   30dc1:	c6 05 bd 40 03 00 f3 	movb   $0xf3,0x340bd
   30dc8:	c6 05 be 40 03 00 cf 	movb   $0xcf,0x340be
   30dcf:	c6 05 bf 40 03 00 00 	movb   $0x0,0x340bf
   30dd6:	c7 05 68 4c 03 00 68 	movl   $0x68,0x34c68
   30ddd:	00 00 00 
   30de0:	66 c7 05 c6 4c 03 00 	movw   $0x68,0x34cc6
   30de7:	68 00 
   30de9:	66 c7 05 c0 40 03 00 	movw   $0x67,0x340c0
   30df0:	67 00 
   30df2:	b8 60 4c 03 00       	mov    $0x34c60,%eax
   30df7:	66 a3 c2 40 03 00    	mov    %ax,0x340c2
   30dfd:	b8 60 4c 03 00       	mov    $0x34c60,%eax
   30e02:	c1 e8 10             	shr    $0x10,%eax
   30e05:	a2 c4 40 03 00       	mov    %al,0x340c4
   30e0a:	c6 05 c5 40 03 00 89 	movb   $0x89,0x340c5
   30e11:	c6 05 c6 40 03 00 00 	movb   $0x0,0x340c6
   30e18:	b8 60 4c 03 00       	mov    $0x34c60,%eax
   30e1d:	c1 e8 18             	shr    $0x18,%eax
   30e20:	a2 c7 40 03 00       	mov    %al,0x340c7
   30e25:	c7 45 f4 06 b0 03 00 	movl   $0x3b006,-0xc(%ebp)
   30e2c:	c7 45 f0 08 b0 03 00 	movl   $0x3b008,-0x10(%ebp)
   30e33:	8b 45 f4             	mov    -0xc(%ebp),%eax
   30e36:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
   30e3b:	ba 40 40 03 00       	mov    $0x34040,%edx
   30e40:	8b 45 f0             	mov    -0x10(%ebp),%eax
   30e43:	89 10                	mov    %edx,(%eax)
   30e45:	e8 66 06 00 00       	call   314b0 <jump_new_gdt>
   30e4a:	c9                   	leave  
   30e4b:	c3                   	ret    

00030e4c <init_idt>:
   30e4c:	55                   	push   %ebp
   30e4d:	89 e5                	mov    %esp,%ebp
   30e4f:	83 ec 18             	sub    $0x18,%esp
   30e52:	b8 d8 17 03 00       	mov    $0x317d8,%eax
   30e57:	66 a3 40 44 03 00    	mov    %ax,0x34440
   30e5d:	66 c7 05 42 44 03 00 	movw   $0x60,0x34442
   30e64:	60 00 
   30e66:	c6 05 44 44 03 00 00 	movb   $0x0,0x34444
   30e6d:	c6 05 45 44 03 00 8e 	movb   $0x8e,0x34445
   30e74:	b8 d8 17 03 00       	mov    $0x317d8,%eax
   30e79:	c1 e8 10             	shr    $0x10,%eax
   30e7c:	66 a3 46 44 03 00    	mov    %ax,0x34446
   30e82:	b8 de 17 03 00       	mov    $0x317de,%eax
   30e87:	66 a3 48 44 03 00    	mov    %ax,0x34448
   30e8d:	66 c7 05 4a 44 03 00 	movw   $0x60,0x3444a
   30e94:	60 00 
   30e96:	c6 05 4c 44 03 00 00 	movb   $0x0,0x3444c
   30e9d:	c6 05 4d 44 03 00 8e 	movb   $0x8e,0x3444d
   30ea4:	b8 de 17 03 00       	mov    $0x317de,%eax
   30ea9:	c1 e8 10             	shr    $0x10,%eax
   30eac:	66 a3 4e 44 03 00    	mov    %ax,0x3444e
   30eb2:	b8 e4 17 03 00       	mov    $0x317e4,%eax
   30eb7:	66 a3 50 44 03 00    	mov    %ax,0x34450
   30ebd:	66 c7 05 52 44 03 00 	movw   $0x60,0x34452
   30ec4:	60 00 
   30ec6:	c6 05 54 44 03 00 00 	movb   $0x0,0x34454
   30ecd:	c6 05 55 44 03 00 8e 	movb   $0x8e,0x34455
   30ed4:	b8 e4 17 03 00       	mov    $0x317e4,%eax
   30ed9:	c1 e8 10             	shr    $0x10,%eax
   30edc:	66 a3 56 44 03 00    	mov    %ax,0x34456
   30ee2:	b8 ea 17 03 00       	mov    $0x317ea,%eax
   30ee7:	66 a3 58 44 03 00    	mov    %ax,0x34458
   30eed:	66 c7 05 5a 44 03 00 	movw   $0x60,0x3445a
   30ef4:	60 00 
   30ef6:	c6 05 5c 44 03 00 00 	movb   $0x0,0x3445c
   30efd:	c6 05 5d 44 03 00 8e 	movb   $0x8e,0x3445d
   30f04:	b8 ea 17 03 00       	mov    $0x317ea,%eax
   30f09:	c1 e8 10             	shr    $0x10,%eax
   30f0c:	66 a3 5e 44 03 00    	mov    %ax,0x3445e
   30f12:	b8 f0 17 03 00       	mov    $0x317f0,%eax
   30f17:	66 a3 60 44 03 00    	mov    %ax,0x34460
   30f1d:	66 c7 05 62 44 03 00 	movw   $0x60,0x34462
   30f24:	60 00 
   30f26:	c6 05 64 44 03 00 00 	movb   $0x0,0x34464
   30f2d:	c6 05 65 44 03 00 8e 	movb   $0x8e,0x34465
   30f34:	b8 f0 17 03 00       	mov    $0x317f0,%eax
   30f39:	c1 e8 10             	shr    $0x10,%eax
   30f3c:	66 a3 66 44 03 00    	mov    %ax,0x34466
   30f42:	b8 f6 17 03 00       	mov    $0x317f6,%eax
   30f47:	66 a3 68 44 03 00    	mov    %ax,0x34468
   30f4d:	66 c7 05 6a 44 03 00 	movw   $0x60,0x3446a
   30f54:	60 00 
   30f56:	c6 05 6c 44 03 00 00 	movb   $0x0,0x3446c
   30f5d:	c6 05 6d 44 03 00 8e 	movb   $0x8e,0x3446d
   30f64:	b8 f6 17 03 00       	mov    $0x317f6,%eax
   30f69:	c1 e8 10             	shr    $0x10,%eax
   30f6c:	66 a3 6e 44 03 00    	mov    %ax,0x3446e
   30f72:	b8 fc 17 03 00       	mov    $0x317fc,%eax
   30f77:	66 a3 70 44 03 00    	mov    %ax,0x34470
   30f7d:	66 c7 05 72 44 03 00 	movw   $0x60,0x34472
   30f84:	60 00 
   30f86:	c6 05 74 44 03 00 00 	movb   $0x0,0x34474
   30f8d:	c6 05 75 44 03 00 8e 	movb   $0x8e,0x34475
   30f94:	b8 fc 17 03 00       	mov    $0x317fc,%eax
   30f99:	c1 e8 10             	shr    $0x10,%eax
   30f9c:	66 a3 76 44 03 00    	mov    %ax,0x34476
   30fa2:	b8 02 18 03 00       	mov    $0x31802,%eax
   30fa7:	66 a3 78 44 03 00    	mov    %ax,0x34478
   30fad:	66 c7 05 7a 44 03 00 	movw   $0x60,0x3447a
   30fb4:	60 00 
   30fb6:	c6 05 7c 44 03 00 00 	movb   $0x0,0x3447c
   30fbd:	c6 05 7d 44 03 00 8e 	movb   $0x8e,0x3447d
   30fc4:	b8 02 18 03 00       	mov    $0x31802,%eax
   30fc9:	c1 e8 10             	shr    $0x10,%eax
   30fcc:	66 a3 7e 44 03 00    	mov    %ax,0x3447e
   30fd2:	b8 08 18 03 00       	mov    $0x31808,%eax
   30fd7:	66 a3 80 44 03 00    	mov    %ax,0x34480
   30fdd:	66 c7 05 82 44 03 00 	movw   $0x60,0x34482
   30fe4:	60 00 
   30fe6:	c6 05 84 44 03 00 00 	movb   $0x0,0x34484
   30fed:	c6 05 85 44 03 00 8e 	movb   $0x8e,0x34485
   30ff4:	b8 08 18 03 00       	mov    $0x31808,%eax
   30ff9:	c1 e8 10             	shr    $0x10,%eax
   30ffc:	66 a3 86 44 03 00    	mov    %ax,0x34486
   31002:	b8 0c 18 03 00       	mov    $0x3180c,%eax
   31007:	66 a3 88 44 03 00    	mov    %ax,0x34488
   3100d:	66 c7 05 8a 44 03 00 	movw   $0x60,0x3448a
   31014:	60 00 
   31016:	c6 05 8c 44 03 00 00 	movb   $0x0,0x3448c
   3101d:	c6 05 8d 44 03 00 8e 	movb   $0x8e,0x3448d
   31024:	b8 0c 18 03 00       	mov    $0x3180c,%eax
   31029:	c1 e8 10             	shr    $0x10,%eax
   3102c:	66 a3 8e 44 03 00    	mov    %ax,0x3448e
   31032:	b8 12 18 03 00       	mov    $0x31812,%eax
   31037:	66 a3 90 44 03 00    	mov    %ax,0x34490
   3103d:	66 c7 05 92 44 03 00 	movw   $0x60,0x34492
   31044:	60 00 
   31046:	c6 05 94 44 03 00 00 	movb   $0x0,0x34494
   3104d:	c6 05 95 44 03 00 8e 	movb   $0x8e,0x34495
   31054:	b8 12 18 03 00       	mov    $0x31812,%eax
   31059:	c1 e8 10             	shr    $0x10,%eax
   3105c:	66 a3 96 44 03 00    	mov    %ax,0x34496
   31062:	b8 16 18 03 00       	mov    $0x31816,%eax
   31067:	66 a3 98 44 03 00    	mov    %ax,0x34498
   3106d:	66 c7 05 9a 44 03 00 	movw   $0x60,0x3449a
   31074:	60 00 
   31076:	c6 05 9c 44 03 00 00 	movb   $0x0,0x3449c
   3107d:	c6 05 9d 44 03 00 8e 	movb   $0x8e,0x3449d
   31084:	b8 16 18 03 00       	mov    $0x31816,%eax
   31089:	c1 e8 10             	shr    $0x10,%eax
   3108c:	66 a3 9e 44 03 00    	mov    %ax,0x3449e
   31092:	b8 1a 18 03 00       	mov    $0x3181a,%eax
   31097:	66 a3 a0 44 03 00    	mov    %ax,0x344a0
   3109d:	66 c7 05 a2 44 03 00 	movw   $0x60,0x344a2
   310a4:	60 00 
   310a6:	c6 05 a4 44 03 00 00 	movb   $0x0,0x344a4
   310ad:	c6 05 a5 44 03 00 8e 	movb   $0x8e,0x344a5
   310b4:	b8 1a 18 03 00       	mov    $0x3181a,%eax
   310b9:	c1 e8 10             	shr    $0x10,%eax
   310bc:	66 a3 a6 44 03 00    	mov    %ax,0x344a6
   310c2:	b8 1e 18 03 00       	mov    $0x3181e,%eax
   310c7:	66 a3 a8 44 03 00    	mov    %ax,0x344a8
   310cd:	66 c7 05 aa 44 03 00 	movw   $0x60,0x344aa
   310d4:	60 00 
   310d6:	c6 05 ac 44 03 00 00 	movb   $0x0,0x344ac
   310dd:	c6 05 ad 44 03 00 8e 	movb   $0x8e,0x344ad
   310e4:	b8 1e 18 03 00       	mov    $0x3181e,%eax
   310e9:	c1 e8 10             	shr    $0x10,%eax
   310ec:	66 a3 ae 44 03 00    	mov    %ax,0x344ae
   310f2:	b8 22 18 03 00       	mov    $0x31822,%eax
   310f7:	66 a3 b0 44 03 00    	mov    %ax,0x344b0
   310fd:	66 c7 05 b2 44 03 00 	movw   $0x60,0x344b2
   31104:	60 00 
   31106:	c6 05 b4 44 03 00 00 	movb   $0x0,0x344b4
   3110d:	c6 05 b5 44 03 00 8e 	movb   $0x8e,0x344b5
   31114:	b8 22 18 03 00       	mov    $0x31822,%eax
   31119:	c1 e8 10             	shr    $0x10,%eax
   3111c:	66 a3 b6 44 03 00    	mov    %ax,0x344b6
   31122:	b8 26 18 03 00       	mov    $0x31826,%eax
   31127:	66 a3 c0 44 03 00    	mov    %ax,0x344c0
   3112d:	66 c7 05 c2 44 03 00 	movw   $0x60,0x344c2
   31134:	60 00 
   31136:	c6 05 c4 44 03 00 00 	movb   $0x0,0x344c4
   3113d:	c6 05 c5 44 03 00 8e 	movb   $0x8e,0x344c5
   31144:	b8 26 18 03 00       	mov    $0x31826,%eax
   31149:	c1 e8 10             	shr    $0x10,%eax
   3114c:	66 a3 c6 44 03 00    	mov    %ax,0x344c6
   31152:	b8 e0 14 03 00       	mov    $0x314e0,%eax
   31157:	66 a3 40 45 03 00    	mov    %ax,0x34540
   3115d:	66 c7 05 42 45 03 00 	movw   $0x60,0x34542
   31164:	60 00 
   31166:	c6 05 44 45 03 00 00 	movb   $0x0,0x34544
   3116d:	c6 05 45 45 03 00 8e 	movb   $0x8e,0x34545
   31174:	b8 e0 14 03 00       	mov    $0x314e0,%eax
   31179:	c1 e8 10             	shr    $0x10,%eax
   3117c:	66 a3 46 45 03 00    	mov    %ax,0x34546
   31182:	b8 10 15 03 00       	mov    $0x31510,%eax
   31187:	66 a3 48 45 03 00    	mov    %ax,0x34548
   3118d:	66 c7 05 4a 45 03 00 	movw   $0x60,0x3454a
   31194:	60 00 
   31196:	c6 05 4c 45 03 00 00 	movb   $0x0,0x3454c
   3119d:	c6 05 4d 45 03 00 8e 	movb   $0x8e,0x3454d
   311a4:	b8 10 15 03 00       	mov    $0x31510,%eax
   311a9:	c1 e8 10             	shr    $0x10,%eax
   311ac:	66 a3 4e 45 03 00    	mov    %ax,0x3454e
   311b2:	b8 40 15 03 00       	mov    $0x31540,%eax
   311b7:	66 a3 50 45 03 00    	mov    %ax,0x34550
   311bd:	66 c7 05 52 45 03 00 	movw   $0x60,0x34552
   311c4:	60 00 
   311c6:	c6 05 54 45 03 00 00 	movb   $0x0,0x34554
   311cd:	c6 05 55 45 03 00 8e 	movb   $0x8e,0x34555
   311d4:	b8 40 15 03 00       	mov    $0x31540,%eax
   311d9:	c1 e8 10             	shr    $0x10,%eax
   311dc:	66 a3 56 45 03 00    	mov    %ax,0x34556
   311e2:	b8 70 15 03 00       	mov    $0x31570,%eax
   311e7:	66 a3 58 45 03 00    	mov    %ax,0x34558
   311ed:	66 c7 05 5a 45 03 00 	movw   $0x60,0x3455a
   311f4:	60 00 
   311f6:	c6 05 5c 45 03 00 00 	movb   $0x0,0x3455c
   311fd:	c6 05 5d 45 03 00 8e 	movb   $0x8e,0x3455d
   31204:	b8 70 15 03 00       	mov    $0x31570,%eax
   31209:	c1 e8 10             	shr    $0x10,%eax
   3120c:	66 a3 5e 45 03 00    	mov    %ax,0x3455e
   31212:	b8 a0 15 03 00       	mov    $0x315a0,%eax
   31217:	66 a3 60 45 03 00    	mov    %ax,0x34560
   3121d:	66 c7 05 62 45 03 00 	movw   $0x60,0x34562
   31224:	60 00 
   31226:	c6 05 64 45 03 00 00 	movb   $0x0,0x34564
   3122d:	c6 05 65 45 03 00 8e 	movb   $0x8e,0x34565
   31234:	b8 a0 15 03 00       	mov    $0x315a0,%eax
   31239:	c1 e8 10             	shr    $0x10,%eax
   3123c:	66 a3 66 45 03 00    	mov    %ax,0x34566
   31242:	b8 d0 15 03 00       	mov    $0x315d0,%eax
   31247:	66 a3 68 45 03 00    	mov    %ax,0x34568
   3124d:	66 c7 05 6a 45 03 00 	movw   $0x60,0x3456a
   31254:	60 00 
   31256:	c6 05 6c 45 03 00 00 	movb   $0x0,0x3456c
   3125d:	c6 05 6d 45 03 00 8e 	movb   $0x8e,0x3456d
   31264:	b8 d0 15 03 00       	mov    $0x315d0,%eax
   31269:	c1 e8 10             	shr    $0x10,%eax
   3126c:	66 a3 6e 45 03 00    	mov    %ax,0x3456e
   31272:	b8 00 16 03 00       	mov    $0x31600,%eax
   31277:	66 a3 70 45 03 00    	mov    %ax,0x34570
   3127d:	66 c7 05 72 45 03 00 	movw   $0x60,0x34572
   31284:	60 00 
   31286:	c6 05 74 45 03 00 00 	movb   $0x0,0x34574
   3128d:	c6 05 75 45 03 00 8e 	movb   $0x8e,0x34575
   31294:	b8 00 16 03 00       	mov    $0x31600,%eax
   31299:	c1 e8 10             	shr    $0x10,%eax
   3129c:	66 a3 76 45 03 00    	mov    %ax,0x34576
   312a2:	b8 30 16 03 00       	mov    $0x31630,%eax
   312a7:	66 a3 78 45 03 00    	mov    %ax,0x34578
   312ad:	66 c7 05 7a 45 03 00 	movw   $0x60,0x3457a
   312b4:	60 00 
   312b6:	c6 05 7c 45 03 00 00 	movb   $0x0,0x3457c
   312bd:	c6 05 7d 45 03 00 8e 	movb   $0x8e,0x3457d
   312c4:	b8 30 16 03 00       	mov    $0x31630,%eax
   312c9:	c1 e8 10             	shr    $0x10,%eax
   312cc:	66 a3 7e 45 03 00    	mov    %ax,0x3457e
   312d2:	b8 60 16 03 00       	mov    $0x31660,%eax
   312d7:	66 a3 80 45 03 00    	mov    %ax,0x34580
   312dd:	66 c7 05 82 45 03 00 	movw   $0x60,0x34582
   312e4:	60 00 
   312e6:	c6 05 84 45 03 00 00 	movb   $0x0,0x34584
   312ed:	c6 05 85 45 03 00 8e 	movb   $0x8e,0x34585
   312f4:	b8 60 16 03 00       	mov    $0x31660,%eax
   312f9:	c1 e8 10             	shr    $0x10,%eax
   312fc:	66 a3 86 45 03 00    	mov    %ax,0x34586
   31302:	b8 90 16 03 00       	mov    $0x31690,%eax
   31307:	66 a3 88 45 03 00    	mov    %ax,0x34588
   3130d:	66 c7 05 8a 45 03 00 	movw   $0x60,0x3458a
   31314:	60 00 
   31316:	c6 05 8c 45 03 00 00 	movb   $0x0,0x3458c
   3131d:	c6 05 8d 45 03 00 8e 	movb   $0x8e,0x3458d
   31324:	b8 90 16 03 00       	mov    $0x31690,%eax
   31329:	c1 e8 10             	shr    $0x10,%eax
   3132c:	66 a3 8e 45 03 00    	mov    %ax,0x3458e
   31332:	b8 c0 16 03 00       	mov    $0x316c0,%eax
   31337:	66 a3 90 45 03 00    	mov    %ax,0x34590
   3133d:	66 c7 05 92 45 03 00 	movw   $0x60,0x34592
   31344:	60 00 
   31346:	c6 05 94 45 03 00 00 	movb   $0x0,0x34594
   3134d:	c6 05 95 45 03 00 8e 	movb   $0x8e,0x34595
   31354:	b8 c0 16 03 00       	mov    $0x316c0,%eax
   31359:	c1 e8 10             	shr    $0x10,%eax
   3135c:	66 a3 96 45 03 00    	mov    %ax,0x34596
   31362:	b8 f0 16 03 00       	mov    $0x316f0,%eax
   31367:	66 a3 98 45 03 00    	mov    %ax,0x34598
   3136d:	66 c7 05 9a 45 03 00 	movw   $0x60,0x3459a
   31374:	60 00 
   31376:	c6 05 9c 45 03 00 00 	movb   $0x0,0x3459c
   3137d:	c6 05 9d 45 03 00 8e 	movb   $0x8e,0x3459d
   31384:	b8 f0 16 03 00       	mov    $0x316f0,%eax
   31389:	c1 e8 10             	shr    $0x10,%eax
   3138c:	66 a3 9e 45 03 00    	mov    %ax,0x3459e
   31392:	b8 20 17 03 00       	mov    $0x31720,%eax
   31397:	66 a3 a0 45 03 00    	mov    %ax,0x345a0
   3139d:	66 c7 05 a2 45 03 00 	movw   $0x60,0x345a2
   313a4:	60 00 
   313a6:	c6 05 a4 45 03 00 00 	movb   $0x0,0x345a4
   313ad:	c6 05 a5 45 03 00 8e 	movb   $0x8e,0x345a5
   313b4:	b8 20 17 03 00       	mov    $0x31720,%eax
   313b9:	c1 e8 10             	shr    $0x10,%eax
   313bc:	66 a3 a6 45 03 00    	mov    %ax,0x345a6
   313c2:	b8 50 17 03 00       	mov    $0x31750,%eax
   313c7:	66 a3 a8 45 03 00    	mov    %ax,0x345a8
   313cd:	66 c7 05 aa 45 03 00 	movw   $0x60,0x345aa
   313d4:	60 00 
   313d6:	c6 05 ac 45 03 00 00 	movb   $0x0,0x345ac
   313dd:	c6 05 ad 45 03 00 8e 	movb   $0x8e,0x345ad
   313e4:	b8 50 17 03 00       	mov    $0x31750,%eax
   313e9:	c1 e8 10             	shr    $0x10,%eax
   313ec:	66 a3 ae 45 03 00    	mov    %ax,0x345ae
   313f2:	b8 80 17 03 00       	mov    $0x31780,%eax
   313f7:	66 a3 b0 45 03 00    	mov    %ax,0x345b0
   313fd:	66 c7 05 b2 45 03 00 	movw   $0x60,0x345b2
   31404:	60 00 
   31406:	c6 05 b4 45 03 00 00 	movb   $0x0,0x345b4
   3140d:	c6 05 b5 45 03 00 8e 	movb   $0x8e,0x345b5
   31414:	b8 80 17 03 00       	mov    $0x31780,%eax
   31419:	c1 e8 10             	shr    $0x10,%eax
   3141c:	66 a3 b6 45 03 00    	mov    %ax,0x345b6
   31422:	b8 b0 17 03 00       	mov    $0x317b0,%eax
   31427:	66 a3 b8 45 03 00    	mov    %ax,0x345b8
   3142d:	66 c7 05 ba 45 03 00 	movw   $0x60,0x345ba
   31434:	60 00 
   31436:	c6 05 bc 45 03 00 00 	movb   $0x0,0x345bc
   3143d:	c6 05 bd 45 03 00 8e 	movb   $0x8e,0x345bd
   31444:	b8 b0 17 03 00       	mov    $0x317b0,%eax
   31449:	c1 e8 10             	shr    $0x10,%eax
   3144c:	66 a3 be 45 03 00    	mov    %ax,0x345be
   31452:	b8 35 18 03 00       	mov    $0x31835,%eax
   31457:	66 a3 40 48 03 00    	mov    %ax,0x34840
   3145d:	66 c7 05 42 48 03 00 	movw   $0x60,0x34842
   31464:	60 00 
   31466:	c6 05 44 48 03 00 00 	movb   $0x0,0x34844
   3146d:	c6 05 45 48 03 00 ee 	movb   $0xee,0x34845
   31474:	b8 35 18 03 00       	mov    $0x31835,%eax
   31479:	c1 e8 10             	shr    $0x10,%eax
   3147c:	66 a3 46 48 03 00    	mov    %ax,0x34846
   31482:	c7 45 f4 00 b0 03 00 	movl   $0x3b000,-0xc(%ebp)
   31489:	c7 45 f0 02 b0 03 00 	movl   $0x3b002,-0x10(%ebp)
   31490:	8b 45 f4             	mov    -0xc(%ebp),%eax
   31493:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
   31498:	ba 40 44 03 00       	mov    $0x34440,%edx
   3149d:	8b 45 f0             	mov    -0x10(%ebp),%eax
   314a0:	89 10                	mov    %edx,(%eax)
   314a2:	e8 30 00 00 00       	call   314d7 <load_idt>
   314a7:	c9                   	leave  
   314a8:	c3                   	ret    
   314a9:	90                   	nop
   314aa:	90                   	nop
   314ab:	90                   	nop
   314ac:	90                   	nop
   314ad:	90                   	nop
   314ae:	90                   	nop
   314af:	90                   	nop

000314b0 <jump_new_gdt>:
   314b0:	0f 01 15 06 b0 03 00 	lgdtl  0x3b006
   314b7:	66 b8 68 00          	mov    $0x68,%ax
   314bb:	8e d8                	mov    %eax,%ds
   314bd:	8e c0                	mov    %eax,%es
   314bf:	8e d0                	mov    %eax,%ss
   314c1:	8e e0                	mov    %eax,%fs
   314c3:	8e e8                	mov    %eax,%gs
   314c5:	31 c0                	xor    %eax,%eax
   314c7:	66 b8 80 00          	mov    $0x80,%ax
   314cb:	0f 00 d8             	ltr    %ax
   314ce:	ea d6 14 03 00 60 00 	ljmp   $0x60,$0x314d6
   314d5:	c3                   	ret    

000314d6 <use_new_gdt>:
   314d6:	c3                   	ret    

000314d7 <load_idt>:
   314d7:	0f 01 1d 00 b0 03 00 	lidtl  0x3b000
   314de:	c3                   	ret    
   314df:	90                   	nop

000314e0 <hwint00>:
   314e0:	8b 54 24 0c          	mov    0xc(%esp),%edx
   314e4:	89 15 00 40 03 00    	mov    %edx,0x34000
   314ea:	e8 7a 03 00 00       	call   31869 <save>
   314ef:	e4 21                	in     $0x21,%al
   314f1:	0c 01                	or     $0x1,%al
   314f3:	e6 21                	out    %al,$0x21
   314f5:	b0 20                	mov    $0x20,%al
   314f7:	e6 20                	out    %al,$0x20
   314f9:	fb                   	sti    
   314fa:	ff 15 e0 4c 03 00    	call   *0x34ce0
   31500:	fa                   	cli    
   31501:	e4 21                	in     $0x21,%al
   31503:	24 fe                	and    $0xfe,%al
   31505:	e6 21                	out    %al,$0x21
   31507:	c3                   	ret    
   31508:	90                   	nop
   31509:	90                   	nop
   3150a:	90                   	nop
   3150b:	90                   	nop
   3150c:	90                   	nop
   3150d:	90                   	nop
   3150e:	90                   	nop
   3150f:	90                   	nop

00031510 <hwint01>:
   31510:	8b 54 24 0c          	mov    0xc(%esp),%edx
   31514:	89 15 00 40 03 00    	mov    %edx,0x34000
   3151a:	e8 4a 03 00 00       	call   31869 <save>
   3151f:	e4 21                	in     $0x21,%al
   31521:	0c 01                	or     $0x1,%al
   31523:	e6 21                	out    %al,$0x21
   31525:	b0 20                	mov    $0x20,%al
   31527:	e6 20                	out    %al,$0x20
   31529:	fb                   	sti    
   3152a:	ff 15 e4 4c 03 00    	call   *0x34ce4
   31530:	fa                   	cli    
   31531:	e4 21                	in     $0x21,%al
   31533:	24 fe                	and    $0xfe,%al
   31535:	e6 21                	out    %al,$0x21
   31537:	c3                   	ret    
   31538:	90                   	nop
   31539:	90                   	nop
   3153a:	90                   	nop
   3153b:	90                   	nop
   3153c:	90                   	nop
   3153d:	90                   	nop
   3153e:	90                   	nop
   3153f:	90                   	nop

00031540 <hwint02>:
   31540:	8b 54 24 0c          	mov    0xc(%esp),%edx
   31544:	89 15 00 40 03 00    	mov    %edx,0x34000
   3154a:	e8 1a 03 00 00       	call   31869 <save>
   3154f:	e4 21                	in     $0x21,%al
   31551:	0c 01                	or     $0x1,%al
   31553:	e6 21                	out    %al,$0x21
   31555:	b0 20                	mov    $0x20,%al
   31557:	e6 20                	out    %al,$0x20
   31559:	fb                   	sti    
   3155a:	ff 15 e8 4c 03 00    	call   *0x34ce8
   31560:	fa                   	cli    
   31561:	e4 21                	in     $0x21,%al
   31563:	24 fe                	and    $0xfe,%al
   31565:	e6 21                	out    %al,$0x21
   31567:	c3                   	ret    
   31568:	90                   	nop
   31569:	90                   	nop
   3156a:	90                   	nop
   3156b:	90                   	nop
   3156c:	90                   	nop
   3156d:	90                   	nop
   3156e:	90                   	nop
   3156f:	90                   	nop

00031570 <hwint03>:
   31570:	8b 54 24 0c          	mov    0xc(%esp),%edx
   31574:	89 15 00 40 03 00    	mov    %edx,0x34000
   3157a:	e8 ea 02 00 00       	call   31869 <save>
   3157f:	e4 21                	in     $0x21,%al
   31581:	0c 01                	or     $0x1,%al
   31583:	e6 21                	out    %al,$0x21
   31585:	b0 20                	mov    $0x20,%al
   31587:	e6 20                	out    %al,$0x20
   31589:	fb                   	sti    
   3158a:	ff 15 ec 4c 03 00    	call   *0x34cec
   31590:	fa                   	cli    
   31591:	e4 21                	in     $0x21,%al
   31593:	24 fe                	and    $0xfe,%al
   31595:	e6 21                	out    %al,$0x21
   31597:	c3                   	ret    
   31598:	90                   	nop
   31599:	90                   	nop
   3159a:	90                   	nop
   3159b:	90                   	nop
   3159c:	90                   	nop
   3159d:	90                   	nop
   3159e:	90                   	nop
   3159f:	90                   	nop

000315a0 <hwint04>:
   315a0:	8b 54 24 0c          	mov    0xc(%esp),%edx
   315a4:	89 15 00 40 03 00    	mov    %edx,0x34000
   315aa:	e8 ba 02 00 00       	call   31869 <save>
   315af:	e4 21                	in     $0x21,%al
   315b1:	0c 01                	or     $0x1,%al
   315b3:	e6 21                	out    %al,$0x21
   315b5:	b0 20                	mov    $0x20,%al
   315b7:	e6 20                	out    %al,$0x20
   315b9:	fb                   	sti    
   315ba:	ff 15 f0 4c 03 00    	call   *0x34cf0
   315c0:	fa                   	cli    
   315c1:	e4 21                	in     $0x21,%al
   315c3:	24 fe                	and    $0xfe,%al
   315c5:	e6 21                	out    %al,$0x21
   315c7:	c3                   	ret    
   315c8:	90                   	nop
   315c9:	90                   	nop
   315ca:	90                   	nop
   315cb:	90                   	nop
   315cc:	90                   	nop
   315cd:	90                   	nop
   315ce:	90                   	nop
   315cf:	90                   	nop

000315d0 <hwint05>:
   315d0:	8b 54 24 0c          	mov    0xc(%esp),%edx
   315d4:	89 15 00 40 03 00    	mov    %edx,0x34000
   315da:	e8 8a 02 00 00       	call   31869 <save>
   315df:	e4 21                	in     $0x21,%al
   315e1:	0c 01                	or     $0x1,%al
   315e3:	e6 21                	out    %al,$0x21
   315e5:	b0 20                	mov    $0x20,%al
   315e7:	e6 20                	out    %al,$0x20
   315e9:	fb                   	sti    
   315ea:	ff 15 f4 4c 03 00    	call   *0x34cf4
   315f0:	fa                   	cli    
   315f1:	e4 21                	in     $0x21,%al
   315f3:	24 fe                	and    $0xfe,%al
   315f5:	e6 21                	out    %al,$0x21
   315f7:	c3                   	ret    
   315f8:	90                   	nop
   315f9:	90                   	nop
   315fa:	90                   	nop
   315fb:	90                   	nop
   315fc:	90                   	nop
   315fd:	90                   	nop
   315fe:	90                   	nop
   315ff:	90                   	nop

00031600 <hwint06>:
   31600:	8b 54 24 0c          	mov    0xc(%esp),%edx
   31604:	89 15 00 40 03 00    	mov    %edx,0x34000
   3160a:	e8 5a 02 00 00       	call   31869 <save>
   3160f:	e4 21                	in     $0x21,%al
   31611:	0c 01                	or     $0x1,%al
   31613:	e6 21                	out    %al,$0x21
   31615:	b0 20                	mov    $0x20,%al
   31617:	e6 20                	out    %al,$0x20
   31619:	fb                   	sti    
   3161a:	ff 15 f8 4c 03 00    	call   *0x34cf8
   31620:	fa                   	cli    
   31621:	e4 21                	in     $0x21,%al
   31623:	24 fe                	and    $0xfe,%al
   31625:	e6 21                	out    %al,$0x21
   31627:	c3                   	ret    
   31628:	90                   	nop
   31629:	90                   	nop
   3162a:	90                   	nop
   3162b:	90                   	nop
   3162c:	90                   	nop
   3162d:	90                   	nop
   3162e:	90                   	nop
   3162f:	90                   	nop

00031630 <hwint07>:
   31630:	8b 54 24 0c          	mov    0xc(%esp),%edx
   31634:	89 15 00 40 03 00    	mov    %edx,0x34000
   3163a:	e8 2a 02 00 00       	call   31869 <save>
   3163f:	e4 21                	in     $0x21,%al
   31641:	0c 01                	or     $0x1,%al
   31643:	e6 21                	out    %al,$0x21
   31645:	b0 20                	mov    $0x20,%al
   31647:	e6 20                	out    %al,$0x20
   31649:	fb                   	sti    
   3164a:	ff 15 fc 4c 03 00    	call   *0x34cfc
   31650:	fa                   	cli    
   31651:	e4 21                	in     $0x21,%al
   31653:	24 fe                	and    $0xfe,%al
   31655:	e6 21                	out    %al,$0x21
   31657:	c3                   	ret    
   31658:	90                   	nop
   31659:	90                   	nop
   3165a:	90                   	nop
   3165b:	90                   	nop
   3165c:	90                   	nop
   3165d:	90                   	nop
   3165e:	90                   	nop
   3165f:	90                   	nop

00031660 <hwint08>:
   31660:	8b 54 24 0c          	mov    0xc(%esp),%edx
   31664:	89 15 00 40 03 00    	mov    %edx,0x34000
   3166a:	e8 fa 01 00 00       	call   31869 <save>
   3166f:	e4 21                	in     $0x21,%al
   31671:	0c 01                	or     $0x1,%al
   31673:	e6 21                	out    %al,$0x21
   31675:	b0 20                	mov    $0x20,%al
   31677:	e6 20                	out    %al,$0x20
   31679:	fb                   	sti    
   3167a:	ff 15 00 4d 03 00    	call   *0x34d00
   31680:	fa                   	cli    
   31681:	e4 21                	in     $0x21,%al
   31683:	24 fe                	and    $0xfe,%al
   31685:	e6 21                	out    %al,$0x21
   31687:	c3                   	ret    
   31688:	90                   	nop
   31689:	90                   	nop
   3168a:	90                   	nop
   3168b:	90                   	nop
   3168c:	90                   	nop
   3168d:	90                   	nop
   3168e:	90                   	nop
   3168f:	90                   	nop

00031690 <hwint09>:
   31690:	8b 54 24 0c          	mov    0xc(%esp),%edx
   31694:	89 15 00 40 03 00    	mov    %edx,0x34000
   3169a:	e8 ca 01 00 00       	call   31869 <save>
   3169f:	e4 21                	in     $0x21,%al
   316a1:	0c 01                	or     $0x1,%al
   316a3:	e6 21                	out    %al,$0x21
   316a5:	b0 20                	mov    $0x20,%al
   316a7:	e6 20                	out    %al,$0x20
   316a9:	fb                   	sti    
   316aa:	ff 15 04 4d 03 00    	call   *0x34d04
   316b0:	fa                   	cli    
   316b1:	e4 21                	in     $0x21,%al
   316b3:	24 fe                	and    $0xfe,%al
   316b5:	e6 21                	out    %al,$0x21
   316b7:	c3                   	ret    
   316b8:	90                   	nop
   316b9:	90                   	nop
   316ba:	90                   	nop
   316bb:	90                   	nop
   316bc:	90                   	nop
   316bd:	90                   	nop
   316be:	90                   	nop
   316bf:	90                   	nop

000316c0 <hwint10>:
   316c0:	8b 54 24 0c          	mov    0xc(%esp),%edx
   316c4:	89 15 00 40 03 00    	mov    %edx,0x34000
   316ca:	e8 9a 01 00 00       	call   31869 <save>
   316cf:	e4 21                	in     $0x21,%al
   316d1:	0c 01                	or     $0x1,%al
   316d3:	e6 21                	out    %al,$0x21
   316d5:	b0 20                	mov    $0x20,%al
   316d7:	e6 20                	out    %al,$0x20
   316d9:	fb                   	sti    
   316da:	ff 15 08 4d 03 00    	call   *0x34d08
   316e0:	fa                   	cli    
   316e1:	e4 21                	in     $0x21,%al
   316e3:	24 fe                	and    $0xfe,%al
   316e5:	e6 21                	out    %al,$0x21
   316e7:	c3                   	ret    
   316e8:	90                   	nop
   316e9:	90                   	nop
   316ea:	90                   	nop
   316eb:	90                   	nop
   316ec:	90                   	nop
   316ed:	90                   	nop
   316ee:	90                   	nop
   316ef:	90                   	nop

000316f0 <hwint11>:
   316f0:	8b 54 24 0c          	mov    0xc(%esp),%edx
   316f4:	89 15 00 40 03 00    	mov    %edx,0x34000
   316fa:	e8 6a 01 00 00       	call   31869 <save>
   316ff:	e4 21                	in     $0x21,%al
   31701:	0c 01                	or     $0x1,%al
   31703:	e6 21                	out    %al,$0x21
   31705:	b0 20                	mov    $0x20,%al
   31707:	e6 20                	out    %al,$0x20
   31709:	fb                   	sti    
   3170a:	ff 15 0c 4d 03 00    	call   *0x34d0c
   31710:	fa                   	cli    
   31711:	e4 21                	in     $0x21,%al
   31713:	24 fe                	and    $0xfe,%al
   31715:	e6 21                	out    %al,$0x21
   31717:	c3                   	ret    
   31718:	90                   	nop
   31719:	90                   	nop
   3171a:	90                   	nop
   3171b:	90                   	nop
   3171c:	90                   	nop
   3171d:	90                   	nop
   3171e:	90                   	nop
   3171f:	90                   	nop

00031720 <hwint12>:
   31720:	8b 54 24 0c          	mov    0xc(%esp),%edx
   31724:	89 15 00 40 03 00    	mov    %edx,0x34000
   3172a:	e8 3a 01 00 00       	call   31869 <save>
   3172f:	e4 21                	in     $0x21,%al
   31731:	0c 01                	or     $0x1,%al
   31733:	e6 21                	out    %al,$0x21
   31735:	b0 20                	mov    $0x20,%al
   31737:	e6 20                	out    %al,$0x20
   31739:	fb                   	sti    
   3173a:	ff 15 10 4d 03 00    	call   *0x34d10
   31740:	fa                   	cli    
   31741:	e4 21                	in     $0x21,%al
   31743:	24 fe                	and    $0xfe,%al
   31745:	e6 21                	out    %al,$0x21
   31747:	c3                   	ret    
   31748:	90                   	nop
   31749:	90                   	nop
   3174a:	90                   	nop
   3174b:	90                   	nop
   3174c:	90                   	nop
   3174d:	90                   	nop
   3174e:	90                   	nop
   3174f:	90                   	nop

00031750 <hwint13>:
   31750:	8b 54 24 0c          	mov    0xc(%esp),%edx
   31754:	89 15 00 40 03 00    	mov    %edx,0x34000
   3175a:	e8 0a 01 00 00       	call   31869 <save>
   3175f:	e4 21                	in     $0x21,%al
   31761:	0c 01                	or     $0x1,%al
   31763:	e6 21                	out    %al,$0x21
   31765:	b0 20                	mov    $0x20,%al
   31767:	e6 20                	out    %al,$0x20
   31769:	fb                   	sti    
   3176a:	ff 15 14 4d 03 00    	call   *0x34d14
   31770:	fa                   	cli    
   31771:	e4 21                	in     $0x21,%al
   31773:	24 fe                	and    $0xfe,%al
   31775:	e6 21                	out    %al,$0x21
   31777:	c3                   	ret    
   31778:	90                   	nop
   31779:	90                   	nop
   3177a:	90                   	nop
   3177b:	90                   	nop
   3177c:	90                   	nop
   3177d:	90                   	nop
   3177e:	90                   	nop
   3177f:	90                   	nop

00031780 <hwint14>:
   31780:	8b 54 24 0c          	mov    0xc(%esp),%edx
   31784:	89 15 00 40 03 00    	mov    %edx,0x34000
   3178a:	e8 da 00 00 00       	call   31869 <save>
   3178f:	e4 21                	in     $0x21,%al
   31791:	0c 01                	or     $0x1,%al
   31793:	e6 21                	out    %al,$0x21
   31795:	b0 20                	mov    $0x20,%al
   31797:	e6 20                	out    %al,$0x20
   31799:	fb                   	sti    
   3179a:	ff 15 18 4d 03 00    	call   *0x34d18
   317a0:	fa                   	cli    
   317a1:	e4 21                	in     $0x21,%al
   317a3:	24 fe                	and    $0xfe,%al
   317a5:	e6 21                	out    %al,$0x21
   317a7:	c3                   	ret    
   317a8:	90                   	nop
   317a9:	90                   	nop
   317aa:	90                   	nop
   317ab:	90                   	nop
   317ac:	90                   	nop
   317ad:	90                   	nop
   317ae:	90                   	nop
   317af:	90                   	nop

000317b0 <hwint15>:
   317b0:	8b 54 24 0c          	mov    0xc(%esp),%edx
   317b4:	89 15 00 40 03 00    	mov    %edx,0x34000
   317ba:	e8 aa 00 00 00       	call   31869 <save>
   317bf:	e4 21                	in     $0x21,%al
   317c1:	0c 01                	or     $0x1,%al
   317c3:	e6 21                	out    %al,$0x21
   317c5:	b0 20                	mov    $0x20,%al
   317c7:	e6 20                	out    %al,$0x20
   317c9:	fb                   	sti    
   317ca:	ff 15 1c 4d 03 00    	call   *0x34d1c
   317d0:	fa                   	cli    
   317d1:	e4 21                	in     $0x21,%al
   317d3:	24 fe                	and    $0xfe,%al
   317d5:	e6 21                	out    %al,$0x21
   317d7:	c3                   	ret    

000317d8 <divide_error>:
   317d8:	6a ff                	push   $0xffffffff
   317da:	6a 00                	push   $0x0
   317dc:	eb 4e                	jmp    3182c <exception>

000317de <debug>:
   317de:	6a ff                	push   $0xffffffff
   317e0:	6a 01                	push   $0x1
   317e2:	eb 48                	jmp    3182c <exception>

000317e4 <nmi>:
   317e4:	6a ff                	push   $0xffffffff
   317e6:	6a 02                	push   $0x2
   317e8:	eb 42                	jmp    3182c <exception>

000317ea <int3>:
   317ea:	6a ff                	push   $0xffffffff
   317ec:	6a 03                	push   $0x3
   317ee:	eb 3c                	jmp    3182c <exception>

000317f0 <overflow>:
   317f0:	6a ff                	push   $0xffffffff
   317f2:	6a 04                	push   $0x4
   317f4:	eb 36                	jmp    3182c <exception>

000317f6 <bounds>:
   317f6:	6a ff                	push   $0xffffffff
   317f8:	6a 05                	push   $0x5
   317fa:	eb 30                	jmp    3182c <exception>

000317fc <invalid_op>:
   317fc:	6a ff                	push   $0xffffffff
   317fe:	6a 06                	push   $0x6
   31800:	eb 2a                	jmp    3182c <exception>

00031802 <device_not_available>:
   31802:	6a ff                	push   $0xffffffff
   31804:	6a 07                	push   $0x7
   31806:	eb 24                	jmp    3182c <exception>

00031808 <doublefault_fn>:
   31808:	6a 08                	push   $0x8
   3180a:	eb 20                	jmp    3182c <exception>

0003180c <coprocessor_segment_overrun>:
   3180c:	6a ff                	push   $0xffffffff
   3180e:	6a 09                	push   $0x9
   31810:	eb 1a                	jmp    3182c <exception>

00031812 <invalid_tss>:
   31812:	6a 0a                	push   $0xa
   31814:	eb 16                	jmp    3182c <exception>

00031816 <segment_not_present>:
   31816:	6a 0b                	push   $0xb
   31818:	eb 12                	jmp    3182c <exception>

0003181a <stack_segment>:
   3181a:	6a 0c                	push   $0xc
   3181c:	eb 0e                	jmp    3182c <exception>

0003181e <general_protection>:
   3181e:	6a 0d                	push   $0xd
   31820:	eb 0a                	jmp    3182c <exception>

00031822 <page_fault>:
   31822:	6a 0e                	push   $0xe
   31824:	eb 06                	jmp    3182c <exception>

00031826 <coprocessor_error>:
   31826:	6a ff                	push   $0xffffffff
   31828:	6a 10                	push   $0x10
   3182a:	eb 00                	jmp    3182c <exception>

0003182c <exception>:
   3182c:	e8 51 01 00 00       	call   31982 <exception_handler>
   31831:	83 c4 08             	add    $0x8,%esp
   31834:	f4                   	hlt    

00031835 <sys_entry>:
   31835:	e8 2f 00 00 00       	call   31869 <save>
   3183a:	fb                   	sti    
   3183b:	50                   	push   %eax
   3183c:	e8 1d 05 00 00       	call   31d5e <syscall_handler>
   31841:	83 c4 04             	add    $0x4,%esp
   31844:	89 46 2c             	mov    %eax,0x2c(%esi)
   31847:	fa                   	cli    
   31848:	c3                   	ret    

00031849 <restart_thread>:
   31849:	8b 25 00 90 03 00    	mov    0x39000,%esp
   3184f:	8d 44 24 48          	lea    0x48(%esp),%eax
   31853:	a3 64 4c 03 00       	mov    %eax,0x34c64

00031858 <re_entry>:
   31858:	ff 0d 40 4c 03 00    	decl   0x34c40
   3185e:	0f a9                	pop    %gs
   31860:	0f a1                	pop    %fs
   31862:	07                   	pop    %es
   31863:	1f                   	pop    %ds
   31864:	61                   	popa   
   31865:	83 c4 04             	add    $0x4,%esp
   31868:	cf                   	iret   

00031869 <save>:
   31869:	60                   	pusha  
   3186a:	1e                   	push   %ds
   3186b:	06                   	push   %es
   3186c:	0f a0                	push   %fs
   3186e:	0f a8                	push   %gs
   31870:	66 8c d2             	mov    %ss,%dx
   31873:	8e da                	mov    %edx,%ds
   31875:	8e c2                	mov    %edx,%es
   31877:	8e ea                	mov    %edx,%gs
   31879:	89 e6                	mov    %esp,%esi
   3187b:	ff 05 40 4c 03 00    	incl   0x34c40
   31881:	83 3d 40 4c 03 00 00 	cmpl   $0x0,0x34c40
   31888:	75 0d                	jne    31897 <save.1>
   3188a:	bc 01 30 03 00       	mov    $0x33001,%esp
   3188f:	68 49 18 03 00       	push   $0x31849
   31894:	ff 66 30             	jmp    *0x30(%esi)

00031897 <save.1>:
   31897:	68 58 18 03 00       	push   $0x31858
   3189c:	ff 66 30             	jmp    *0x30(%esi)
   3189f:	90                   	nop

000318a0 <timer_interrupt>:
   318a0:	55                   	push   %ebp
   318a1:	89 e5                	mov    %esp,%ebp
   318a3:	83 ec 18             	sub    $0x18,%esp
   318a6:	e8 03 05 00 00       	call   31dae <ticks_inc>
   318ab:	a1 40 4c 03 00       	mov    0x34c40,%eax
   318b0:	85 c0                	test   %eax,%eax
   318b2:	74 0c                	je     318c0 <timer_interrupt+0x20>
   318b4:	c7 04 24 c0 1f 03 00 	movl   $0x31fc0,(%esp)
   318bb:	e8 5c 02 00 00       	call   31b1c <printk>
   318c0:	e8 32 f1 ff ff       	call   309f7 <current_thread_ticks>
   318c5:	89 c1                	mov    %eax,%ecx
   318c7:	ba 67 66 66 66       	mov    $0x66666667,%edx
   318cc:	89 c8                	mov    %ecx,%eax
   318ce:	f7 ea                	imul   %edx
   318d0:	d1 fa                	sar    %edx
   318d2:	89 c8                	mov    %ecx,%eax
   318d4:	c1 f8 1f             	sar    $0x1f,%eax
   318d7:	29 c2                	sub    %eax,%edx
   318d9:	89 d0                	mov    %edx,%eax
   318db:	c1 e0 02             	shl    $0x2,%eax
   318de:	01 d0                	add    %edx,%eax
   318e0:	89 ca                	mov    %ecx,%edx
   318e2:	29 c2                	sub    %eax,%edx
   318e4:	83 fa 03             	cmp    $0x3,%edx
   318e7:	7f 0c                	jg     318f5 <timer_interrupt+0x55>
   318e9:	e8 16 f1 ff ff       	call   30a04 <current_thread_ticks_inc>
   318ee:	b8 01 00 00 00       	mov    $0x1,%eax
   318f3:	eb 14                	jmp    31909 <timer_interrupt+0x69>
   318f5:	e8 0a f1 ff ff       	call   30a04 <current_thread_ticks_inc>
   318fa:	e8 18 f1 ff ff       	call   30a17 <next_thread_to_run>
   318ff:	a3 00 90 03 00       	mov    %eax,0x39000
   31904:	b8 01 00 00 00       	mov    $0x1,%eax
   31909:	c9                   	leave  
   3190a:	c3                   	ret    

0003190b <keyboard_interrupt>:
   3190b:	55                   	push   %ebp
   3190c:	89 e5                	mov    %esp,%ebp
   3190e:	83 ec 28             	sub    $0x28,%esp
   31911:	c7 04 24 60 00 00 00 	movl   $0x60,(%esp)
   31918:	e8 91 f3 ff ff       	call   30cae <inb_pic>
   3191d:	88 45 f7             	mov    %al,-0x9(%ebp)
   31920:	a1 28 b0 03 00       	mov    0x3b028,%eax
   31925:	83 f8 1f             	cmp    $0x1f,%eax
   31928:	7f 3b                	jg     31965 <keyboard_interrupt+0x5a>
   3192a:	a1 20 b0 03 00       	mov    0x3b020,%eax
   3192f:	0f b6 55 f7          	movzbl -0x9(%ebp),%edx
   31933:	88 10                	mov    %dl,(%eax)
   31935:	a1 20 b0 03 00       	mov    0x3b020,%eax
   3193a:	83 c0 01             	add    $0x1,%eax
   3193d:	a3 20 b0 03 00       	mov    %eax,0x3b020
   31942:	a1 20 b0 03 00       	mov    0x3b020,%eax
   31947:	3d 4c b0 03 00       	cmp    $0x3b04c,%eax
   3194c:	75 0a                	jne    31958 <keyboard_interrupt+0x4d>
   3194e:	c7 05 20 b0 03 00 2c 	movl   $0x3b02c,0x3b020
   31955:	b0 03 00 
   31958:	a1 28 b0 03 00       	mov    0x3b028,%eax
   3195d:	83 c0 01             	add    $0x1,%eax
   31960:	a3 28 b0 03 00       	mov    %eax,0x3b028
   31965:	c9                   	leave  
   31966:	c3                   	ret    

00031967 <intr_handler>:
   31967:	55                   	push   %ebp
   31968:	89 e5                	mov    %esp,%ebp
   3196a:	83 ec 18             	sub    $0x18,%esp
   3196d:	8b 45 08             	mov    0x8(%ebp),%eax
   31970:	89 44 24 04          	mov    %eax,0x4(%esp)
   31974:	c7 04 24 c2 1f 03 00 	movl   $0x31fc2,(%esp)
   3197b:	e8 9c 01 00 00       	call   31b1c <printk>
   31980:	c9                   	leave  
   31981:	c3                   	ret    

00031982 <exception_handler>:
   31982:	55                   	push   %ebp
   31983:	89 e5                	mov    %esp,%ebp
   31985:	57                   	push   %edi
   31986:	56                   	push   %esi
   31987:	53                   	push   %ebx
   31988:	83 ec 7c             	sub    $0x7c,%esp
   3198b:	8d 55 94             	lea    -0x6c(%ebp),%edx
   3198e:	bb 80 20 03 00       	mov    $0x32080,%ebx
   31993:	b8 14 00 00 00       	mov    $0x14,%eax
   31998:	89 d7                	mov    %edx,%edi
   3199a:	89 de                	mov    %ebx,%esi
   3199c:	89 c1                	mov    %eax,%ecx
   3199e:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
   319a0:	c7 05 14 30 03 00 00 	movl   $0x0,0x33014
   319a7:	00 00 00 
   319aa:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
   319b1:	eb 10                	jmp    319c3 <exception_handler+0x41>
   319b3:	c7 04 24 d8 1f 03 00 	movl   $0x31fd8,(%esp)
   319ba:	e8 5d 01 00 00       	call   31b1c <printk>
   319bf:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
   319c3:	81 7d e4 8f 01 00 00 	cmpl   $0x18f,-0x1c(%ebp)
   319ca:	7e e7                	jle    319b3 <exception_handler+0x31>
   319cc:	c7 05 14 30 03 00 00 	movl   $0x0,0x33014
   319d3:	00 00 00 
   319d6:	8b 45 08             	mov    0x8(%ebp),%eax
   319d9:	8b 44 85 94          	mov    -0x6c(%ebp,%eax,4),%eax
   319dd:	89 44 24 04          	mov    %eax,0x4(%esp)
   319e1:	c7 04 24 da 1f 03 00 	movl   $0x31fda,(%esp)
   319e8:	e8 2f 01 00 00       	call   31b1c <printk>
   319ed:	8b 45 18             	mov    0x18(%ebp),%eax
   319f0:	89 44 24 0c          	mov    %eax,0xc(%esp)
   319f4:	8b 45 14             	mov    0x14(%ebp),%eax
   319f7:	89 44 24 08          	mov    %eax,0x8(%esp)
   319fb:	8b 45 10             	mov    0x10(%ebp),%eax
   319fe:	89 44 24 04          	mov    %eax,0x4(%esp)
   31a02:	c7 04 24 e9 1f 03 00 	movl   $0x31fe9,(%esp)
   31a09:	e8 0e 01 00 00       	call   31b1c <printk>
   31a0e:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
   31a12:	74 13                	je     31a27 <exception_handler+0xa5>
   31a14:	8b 45 0c             	mov    0xc(%ebp),%eax
   31a17:	89 44 24 04          	mov    %eax,0x4(%esp)
   31a1b:	c7 04 24 05 20 03 00 	movl   $0x32005,(%esp)
   31a22:	e8 f5 00 00 00       	call   31b1c <printk>
   31a27:	83 c4 7c             	add    $0x7c,%esp
   31a2a:	5b                   	pop    %ebx
   31a2b:	5e                   	pop    %esi
   31a2c:	5f                   	pop    %edi
   31a2d:	5d                   	pop    %ebp
   31a2e:	c3                   	ret    

00031a2f <set_irq_handler>:
   31a2f:	55                   	push   %ebp
   31a30:	89 e5                	mov    %esp,%ebp
   31a32:	83 ec 18             	sub    $0x18,%esp
   31a35:	8b 45 08             	mov    0x8(%ebp),%eax
   31a38:	8b 55 0c             	mov    0xc(%ebp),%edx
   31a3b:	89 14 85 e0 4c 03 00 	mov    %edx,0x34ce0(,%eax,4)
   31a42:	8b 45 08             	mov    0x8(%ebp),%eax
   31a45:	89 04 24             	mov    %eax,(%esp)
   31a48:	e8 48 00 00 00       	call   31a95 <enable_irq>
   31a4d:	b8 01 00 00 00       	mov    $0x1,%eax
   31a52:	c9                   	leave  
   31a53:	c3                   	ret    

00031a54 <disable_irq>:
   31a54:	55                   	push   %ebp
   31a55:	89 e5                	mov    %esp,%ebp
   31a57:	83 ec 28             	sub    $0x28,%esp
   31a5a:	c6 45 f7 ff          	movb   $0xff,-0x9(%ebp)
   31a5e:	83 7d 08 07          	cmpl   $0x7,0x8(%ebp)
   31a62:	7f 16                	jg     31a7a <disable_irq+0x26>
   31a64:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
   31a68:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
   31a6f:	00 
   31a70:	89 04 24             	mov    %eax,(%esp)
   31a73:	e8 22 f2 ff ff       	call   30c9a <outb_pic>
   31a78:	eb 14                	jmp    31a8e <disable_irq+0x3a>
   31a7a:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
   31a7e:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
   31a85:	00 
   31a86:	89 04 24             	mov    %eax,(%esp)
   31a89:	e8 0c f2 ff ff       	call   30c9a <outb_pic>
   31a8e:	b8 01 00 00 00       	mov    $0x1,%eax
   31a93:	c9                   	leave  
   31a94:	c3                   	ret    

00031a95 <enable_irq>:
   31a95:	55                   	push   %ebp
   31a96:	89 e5                	mov    %esp,%ebp
   31a98:	53                   	push   %ebx
   31a99:	83 ec 24             	sub    $0x24,%esp
   31a9c:	8b 45 08             	mov    0x8(%ebp),%eax
   31a9f:	89 c2                	mov    %eax,%edx
   31aa1:	c1 fa 1f             	sar    $0x1f,%edx
   31aa4:	c1 ea 1d             	shr    $0x1d,%edx
   31aa7:	01 d0                	add    %edx,%eax
   31aa9:	83 e0 07             	and    $0x7,%eax
   31aac:	29 d0                	sub    %edx,%eax
   31aae:	ba 01 00 00 00       	mov    $0x1,%edx
   31ab3:	89 d3                	mov    %edx,%ebx
   31ab5:	89 c1                	mov    %eax,%ecx
   31ab7:	d3 e3                	shl    %cl,%ebx
   31ab9:	89 d8                	mov    %ebx,%eax
   31abb:	f7 d0                	not    %eax
   31abd:	88 45 f7             	mov    %al,-0x9(%ebp)
   31ac0:	83 7d 08 07          	cmpl   $0x7,0x8(%ebp)
   31ac4:	7f 16                	jg     31adc <enable_irq+0x47>
   31ac6:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
   31aca:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
   31ad1:	00 
   31ad2:	89 04 24             	mov    %eax,(%esp)
   31ad5:	e8 c0 f1 ff ff       	call   30c9a <outb_pic>
   31ada:	eb 14                	jmp    31af0 <enable_irq+0x5b>
   31adc:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
   31ae0:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
   31ae7:	00 
   31ae8:	89 04 24             	mov    %eax,(%esp)
   31aeb:	e8 aa f1 ff ff       	call   30c9a <outb_pic>
   31af0:	b8 01 00 00 00       	mov    $0x1,%eax
   31af5:	83 c4 24             	add    $0x24,%esp
   31af8:	5b                   	pop    %ebx
   31af9:	5d                   	pop    %ebp
   31afa:	c3                   	ret    
   31afb:	90                   	nop

00031afc <print>:
   31afc:	55                   	push   %ebp
   31afd:	89 e5                	mov    %esp,%ebp
   31aff:	83 ec 18             	sub    $0x18,%esp
   31b02:	c7 04 24 59 21 03 00 	movl   $0x32159,(%esp)
   31b09:	e8 0e 00 00 00       	call   31b1c <printk>
   31b0e:	c7 04 24 77 21 03 00 	movl   $0x32177,(%esp)
   31b15:	e8 02 00 00 00       	call   31b1c <printk>
   31b1a:	c9                   	leave  
   31b1b:	c3                   	ret    

00031b1c <printk>:
   31b1c:	55                   	push   %ebp
   31b1d:	89 e5                	mov    %esp,%ebp
   31b1f:	81 ec 28 04 00 00    	sub    $0x428,%esp
   31b25:	8d 55 0c             	lea    0xc(%ebp),%edx
   31b28:	8d 85 f0 fb ff ff    	lea    -0x410(%ebp),%eax
   31b2e:	89 10                	mov    %edx,(%eax)
   31b30:	8b 85 f0 fb ff ff    	mov    -0x410(%ebp),%eax
   31b36:	89 44 24 08          	mov    %eax,0x8(%esp)
   31b3a:	8b 45 08             	mov    0x8(%ebp),%eax
   31b3d:	89 44 24 04          	mov    %eax,0x4(%esp)
   31b41:	8d 85 f4 fb ff ff    	lea    -0x40c(%ebp),%eax
   31b47:	89 04 24             	mov    %eax,(%esp)
   31b4a:	e8 2c 00 00 00       	call   31b7b <__vprintf__>
   31b4f:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31b52:	a1 14 30 03 00       	mov    0x33014,%eax
   31b57:	3d 9e 0f 00 00       	cmp    $0xf9e,%eax
   31b5c:	7e 0a                	jle    31b68 <printk+0x4c>
   31b5e:	c7 05 14 30 03 00 00 	movl   $0x0,0x33014
   31b65:	00 00 00 
   31b68:	8d 85 f4 fb ff ff    	lea    -0x40c(%ebp),%eax
   31b6e:	89 04 24             	mov    %eax,(%esp)
   31b71:	e8 aa ef ff ff       	call   30b20 <disp_str>
   31b76:	8b 45 f4             	mov    -0xc(%ebp),%eax
   31b79:	c9                   	leave  
   31b7a:	c3                   	ret    

00031b7b <__vprintf__>:
   31b7b:	55                   	push   %ebp
   31b7c:	89 e5                	mov    %esp,%ebp
   31b7e:	83 ec 30             	sub    $0x30,%esp
   31b81:	8b 45 0c             	mov    0xc(%ebp),%eax
   31b84:	89 45 fc             	mov    %eax,-0x4(%ebp)
   31b87:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
   31b8e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   31b95:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
   31b9c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
   31ba3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
   31baa:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
   31bb1:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
   31bb8:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
   31bbe:	e9 72 01 00 00       	jmp    31d35 <__vprintf__+0x1ba>
   31bc3:	8b 45 fc             	mov    -0x4(%ebp),%eax
   31bc6:	0f b6 00             	movzbl (%eax),%eax
   31bc9:	3c 25                	cmp    $0x25,%al
   31bcb:	0f 85 4e 01 00 00    	jne    31d1f <__vprintf__+0x1a4>
   31bd1:	8b 45 fc             	mov    -0x4(%ebp),%eax
   31bd4:	83 c0 01             	add    $0x1,%eax
   31bd7:	0f b6 00             	movzbl (%eax),%eax
   31bda:	0f be c0             	movsbl %al,%eax
   31bdd:	83 f8 64             	cmp    $0x64,%eax
   31be0:	74 3e                	je     31c20 <__vprintf__+0xa5>
   31be2:	83 f8 73             	cmp    $0x73,%eax
   31be5:	0f 84 fa 00 00 00    	je     31ce5 <__vprintf__+0x16a>
   31beb:	83 f8 63             	cmp    $0x63,%eax
   31bee:	0f 85 39 01 00 00    	jne    31d2d <__vprintf__+0x1b2>
   31bf4:	8b 45 10             	mov    0x10(%ebp),%eax
   31bf7:	8d 50 04             	lea    0x4(%eax),%edx
   31bfa:	89 55 10             	mov    %edx,0x10(%ebp)
   31bfd:	8b 00                	mov    (%eax),%eax
   31bff:	89 45 f0             	mov    %eax,-0x10(%ebp)
   31c02:	8b 45 f8             	mov    -0x8(%ebp),%eax
   31c05:	03 45 08             	add    0x8(%ebp),%eax
   31c08:	8b 55 f0             	mov    -0x10(%ebp),%edx
   31c0b:	8b 14 95 20 30 03 00 	mov    0x33020(,%edx,4),%edx
   31c12:	0f b6 12             	movzbl (%edx),%edx
   31c15:	88 10                	mov    %dl,(%eax)
   31c17:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   31c1b:	e9 0d 01 00 00       	jmp    31d2d <__vprintf__+0x1b2>
   31c20:	8b 45 10             	mov    0x10(%ebp),%eax
   31c23:	8d 50 04             	lea    0x4(%eax),%edx
   31c26:	89 55 10             	mov    %edx,0x10(%ebp)
   31c29:	8b 00                	mov    (%eax),%eax
   31c2b:	89 45 f0             	mov    %eax,-0x10(%ebp)
   31c2e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
   31c35:	8b 4d f0             	mov    -0x10(%ebp),%ecx
   31c38:	ba 67 66 66 66       	mov    $0x66666667,%edx
   31c3d:	89 c8                	mov    %ecx,%eax
   31c3f:	f7 ea                	imul   %edx
   31c41:	c1 fa 02             	sar    $0x2,%edx
   31c44:	89 c8                	mov    %ecx,%eax
   31c46:	c1 f8 1f             	sar    $0x1f,%eax
   31c49:	29 c2                	sub    %eax,%edx
   31c4b:	89 d0                	mov    %edx,%eax
   31c4d:	c1 e0 02             	shl    $0x2,%eax
   31c50:	01 d0                	add    %edx,%eax
   31c52:	01 c0                	add    %eax,%eax
   31c54:	89 ca                	mov    %ecx,%edx
   31c56:	29 c2                	sub    %eax,%edx
   31c58:	8d 42 30             	lea    0x30(%edx),%eax
   31c5b:	8b 04 85 20 30 03 00 	mov    0x33020(,%eax,4),%eax
   31c62:	0f b6 10             	movzbl (%eax),%edx
   31c65:	8d 45 de             	lea    -0x22(%ebp),%eax
   31c68:	03 45 ec             	add    -0x14(%ebp),%eax
   31c6b:	88 10                	mov    %dl,(%eax)
   31c6d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
   31c71:	8b 4d f0             	mov    -0x10(%ebp),%ecx
   31c74:	ba 67 66 66 66       	mov    $0x66666667,%edx
   31c79:	89 c8                	mov    %ecx,%eax
   31c7b:	f7 ea                	imul   %edx
   31c7d:	c1 fa 02             	sar    $0x2,%edx
   31c80:	89 c8                	mov    %ecx,%eax
   31c82:	c1 f8 1f             	sar    $0x1f,%eax
   31c85:	89 d1                	mov    %edx,%ecx
   31c87:	29 c1                	sub    %eax,%ecx
   31c89:	89 c8                	mov    %ecx,%eax
   31c8b:	89 45 f0             	mov    %eax,-0x10(%ebp)
   31c8e:	8b 4d f0             	mov    -0x10(%ebp),%ecx
   31c91:	ba 67 66 66 66       	mov    $0x66666667,%edx
   31c96:	89 c8                	mov    %ecx,%eax
   31c98:	f7 ea                	imul   %edx
   31c9a:	c1 fa 02             	sar    $0x2,%edx
   31c9d:	89 c8                	mov    %ecx,%eax
   31c9f:	c1 f8 1f             	sar    $0x1f,%eax
   31ca2:	29 c2                	sub    %eax,%edx
   31ca4:	89 d0                	mov    %edx,%eax
   31ca6:	c1 e0 02             	shl    $0x2,%eax
   31ca9:	01 d0                	add    %edx,%eax
   31cab:	01 c0                	add    %eax,%eax
   31cad:	89 ca                	mov    %ecx,%edx
   31caf:	29 c2                	sub    %eax,%edx
   31cb1:	85 d2                	test   %edx,%edx
   31cb3:	75 80                	jne    31c35 <__vprintf__+0xba>
   31cb5:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
   31cb9:	eb 19                	jmp    31cd4 <__vprintf__+0x159>
   31cbb:	8b 45 f8             	mov    -0x8(%ebp),%eax
   31cbe:	03 45 08             	add    0x8(%ebp),%eax
   31cc1:	8d 55 de             	lea    -0x22(%ebp),%edx
   31cc4:	03 55 ec             	add    -0x14(%ebp),%edx
   31cc7:	0f b6 12             	movzbl (%edx),%edx
   31cca:	88 10                	mov    %dl,(%eax)
   31ccc:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
   31cd0:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
   31cd4:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
   31cd8:	79 e1                	jns    31cbb <__vprintf__+0x140>
   31cda:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
   31cde:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   31ce2:	90                   	nop
   31ce3:	eb 48                	jmp    31d2d <__vprintf__+0x1b2>
   31ce5:	8b 45 10             	mov    0x10(%ebp),%eax
   31ce8:	8d 50 04             	lea    0x4(%eax),%edx
   31ceb:	89 55 10             	mov    %edx,0x10(%ebp)
   31cee:	8b 00                	mov    (%eax),%eax
   31cf0:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31cf3:	eb 16                	jmp    31d0b <__vprintf__+0x190>
   31cf5:	8b 45 f8             	mov    -0x8(%ebp),%eax
   31cf8:	03 45 08             	add    0x8(%ebp),%eax
   31cfb:	8b 55 f4             	mov    -0xc(%ebp),%edx
   31cfe:	0f b6 12             	movzbl (%edx),%edx
   31d01:	88 10                	mov    %dl,(%eax)
   31d03:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
   31d07:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   31d0b:	8b 45 f4             	mov    -0xc(%ebp),%eax
   31d0e:	0f b6 00             	movzbl (%eax),%eax
   31d11:	84 c0                	test   %al,%al
   31d13:	75 e0                	jne    31cf5 <__vprintf__+0x17a>
   31d15:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
   31d19:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   31d1d:	eb 0e                	jmp    31d2d <__vprintf__+0x1b2>
   31d1f:	8b 45 f8             	mov    -0x8(%ebp),%eax
   31d22:	03 45 08             	add    0x8(%ebp),%eax
   31d25:	8b 55 fc             	mov    -0x4(%ebp),%edx
   31d28:	0f b6 12             	movzbl (%edx),%edx
   31d2b:	88 10                	mov    %dl,(%eax)
   31d2d:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
   31d31:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   31d35:	8b 45 fc             	mov    -0x4(%ebp),%eax
   31d38:	0f b6 00             	movzbl (%eax),%eax
   31d3b:	84 c0                	test   %al,%al
   31d3d:	0f 85 80 fe ff ff    	jne    31bc3 <__vprintf__+0x48>
   31d43:	8b 45 f8             	mov    -0x8(%ebp),%eax
   31d46:	03 45 08             	add    0x8(%ebp),%eax
   31d49:	c6 00 00             	movb   $0x0,(%eax)
   31d4c:	b8 01 00 00 00       	mov    $0x1,%eax
   31d51:	c9                   	leave  
   31d52:	c3                   	ret    
   31d53:	90                   	nop

00031d54 <sys_get_ticks>:
   31d54:	55                   	push   %ebp
   31d55:	89 e5                	mov    %esp,%ebp
   31d57:	a1 14 b0 03 00       	mov    0x3b014,%eax
   31d5c:	5d                   	pop    %ebp
   31d5d:	c3                   	ret    

00031d5e <syscall_handler>:
   31d5e:	55                   	push   %ebp
   31d5f:	89 e5                	mov    %esp,%ebp
   31d61:	8b 45 08             	mov    0x8(%ebp),%eax
   31d64:	85 c0                	test   %eax,%eax
   31d66:	75 07                	jne    31d6f <syscall_handler+0x11>
   31d68:	e8 e7 ff ff ff       	call   31d54 <sys_get_ticks>
   31d6d:	eb 01                	jmp    31d70 <syscall_handler+0x12>
   31d6f:	90                   	nop
   31d70:	5d                   	pop    %ebp
   31d71:	c3                   	ret    
   31d72:	90                   	nop
   31d73:	90                   	nop
   31d74:	90                   	nop
   31d75:	90                   	nop
   31d76:	90                   	nop
   31d77:	90                   	nop
   31d78:	90                   	nop
   31d79:	90                   	nop
   31d7a:	90                   	nop
   31d7b:	90                   	nop
   31d7c:	90                   	nop
   31d7d:	90                   	nop
   31d7e:	90                   	nop
   31d7f:	90                   	nop

00031d80 <system_call>:
   31d80:	8b 44 24 04          	mov    0x4(%esp),%eax
   31d84:	cd 80                	int    $0x80
   31d86:	c3                   	ret    
   31d87:	90                   	nop

00031d88 <init_timer>:
   31d88:	55                   	push   %ebp
   31d89:	89 e5                	mov    %esp,%ebp
   31d8b:	83 ec 18             	sub    $0x18,%esp
   31d8e:	c7 05 14 b0 03 00 00 	movl   $0x0,0x3b014
   31d95:	00 00 00 
   31d98:	c7 44 24 04 a0 18 03 	movl   $0x318a0,0x4(%esp)
   31d9f:	00 
   31da0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
   31da7:	e8 83 fc ff ff       	call   31a2f <set_irq_handler>
   31dac:	c9                   	leave  
   31dad:	c3                   	ret    

00031dae <ticks_inc>:
   31dae:	55                   	push   %ebp
   31daf:	89 e5                	mov    %esp,%ebp
   31db1:	a1 14 b0 03 00       	mov    0x3b014,%eax
   31db6:	3d fa ff 00 00       	cmp    $0xfffa,%eax
   31dbb:	76 0c                	jbe    31dc9 <ticks_inc+0x1b>
   31dbd:	c7 05 14 b0 03 00 00 	movl   $0x0,0x3b014
   31dc4:	00 00 00 
   31dc7:	eb 0d                	jmp    31dd6 <ticks_inc+0x28>
   31dc9:	a1 14 b0 03 00       	mov    0x3b014,%eax
   31dce:	83 c0 01             	add    $0x1,%eax
   31dd1:	a3 14 b0 03 00       	mov    %eax,0x3b014
   31dd6:	5d                   	pop    %ebp
   31dd7:	c3                   	ret    

00031dd8 <init_keybord>:
   31dd8:	55                   	push   %ebp
   31dd9:	89 e5                	mov    %esp,%ebp
   31ddb:	83 ec 18             	sub    $0x18,%esp
   31dde:	c7 05 28 b0 03 00 00 	movl   $0x0,0x3b028
   31de5:	00 00 00 
   31de8:	c7 05 24 b0 03 00 2c 	movl   $0x3b02c,0x3b024
   31def:	b0 03 00 
   31df2:	a1 24 b0 03 00       	mov    0x3b024,%eax
   31df7:	a3 20 b0 03 00       	mov    %eax,0x3b020
   31dfc:	c7 44 24 04 0b 19 03 	movl   $0x3190b,0x4(%esp)
   31e03:	00 
   31e04:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
   31e0b:	e8 1f fc ff ff       	call   31a2f <set_irq_handler>
   31e10:	c9                   	leave  
   31e11:	c3                   	ret    

00031e12 <keyboard_read>:
   31e12:	55                   	push   %ebp
   31e13:	89 e5                	mov    %esp,%ebp
   31e15:	83 ec 28             	sub    $0x28,%esp
   31e18:	c6 45 ee 00          	movb   $0x0,-0x12(%ebp)
   31e1c:	c6 45 ef 00          	movb   $0x0,-0x11(%ebp)
   31e20:	a1 28 b0 03 00       	mov    0x3b028,%eax
   31e25:	85 c0                	test   %eax,%eax
   31e27:	0f 8e 80 00 00 00    	jle    31ead <keyboard_read+0x9b>
   31e2d:	a1 24 b0 03 00       	mov    0x3b024,%eax
   31e32:	0f b6 00             	movzbl (%eax),%eax
   31e35:	88 45 f7             	mov    %al,-0x9(%ebp)
   31e38:	a1 24 b0 03 00       	mov    0x3b024,%eax
   31e3d:	83 c0 01             	add    $0x1,%eax
   31e40:	a3 24 b0 03 00       	mov    %eax,0x3b024
   31e45:	a1 24 b0 03 00       	mov    0x3b024,%eax
   31e4a:	3d 4c b0 03 00       	cmp    $0x3b04c,%eax
   31e4f:	75 0a                	jne    31e5b <keyboard_read+0x49>
   31e51:	c7 05 24 b0 03 00 2c 	movl   $0x3b02c,0x3b024
   31e58:	b0 03 00 
   31e5b:	a1 28 b0 03 00       	mov    0x3b028,%eax
   31e60:	83 e8 01             	sub    $0x1,%eax
   31e63:	a3 28 b0 03 00       	mov    %eax,0x3b028
   31e68:	80 7d f7 e1          	cmpb   $0xe1,-0x9(%ebp)
   31e6c:	74 3f                	je     31ead <keyboard_read+0x9b>
   31e6e:	80 7d f7 e0          	cmpb   $0xe0,-0x9(%ebp)
   31e72:	74 39                	je     31ead <keyboard_read+0x9b>
   31e74:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
   31e78:	0f be c0             	movsbl %al,%eax
   31e7b:	f7 d0                	not    %eax
   31e7d:	c1 e8 1f             	shr    $0x1f,%eax
   31e80:	89 45 f0             	mov    %eax,-0x10(%ebp)
   31e83:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
   31e87:	74 24                	je     31ead <keyboard_read+0x9b>
   31e89:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
   31e8d:	89 c2                	mov    %eax,%edx
   31e8f:	83 e2 7f             	and    $0x7f,%edx
   31e92:	89 d0                	mov    %edx,%eax
   31e94:	01 c0                	add    %eax,%eax
   31e96:	01 d0                	add    %edx,%eax
   31e98:	8b 04 85 20 32 03 00 	mov    0x33220(,%eax,4),%eax
   31e9f:	88 45 ee             	mov    %al,-0x12(%ebp)
   31ea2:	8d 45 ee             	lea    -0x12(%ebp),%eax
   31ea5:	89 04 24             	mov    %eax,(%esp)
   31ea8:	e8 73 ec ff ff       	call   30b20 <disp_str>
   31ead:	c9                   	leave  
   31eae:	c3                   	ret    
