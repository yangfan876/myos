
kernel.bin:     file format elf32-i386


Disassembly of section .text:

00030400 <_start>:
   30400:	bc 01 30 03 00       	mov    $0x33001,%esp
   30405:	0f 01 05 0a 90 03 00 	sgdtl  0x3900a
   3040c:	e8 0b 00 00 00       	call   3041c <__init__>
   30411:	fb                   	sti    
   30412:	e8 52 13 00 00       	call   31769 <restart_thread>
   30417:	eb fe                	jmp    30417 <_start+0x17>
   30419:	90                   	nop
   3041a:	90                   	nop
   3041b:	90                   	nop

0003041c <__init__>:
   3041c:	55                   	push   %ebp
   3041d:	89 e5                	mov    %esp,%ebp
   3041f:	83 ec 28             	sub    $0x28,%esp
   30422:	e8 b1 07 00 00       	call   30bd8 <change_gdt>
   30427:	c7 05 0c 30 03 00 00 	movl   $0x0,0x3300c
   3042e:	00 00 00 
   30431:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   30438:	eb 10                	jmp    3044a <__init__+0x2e>
   3043a:	c7 04 24 a0 1c 03 00 	movl   $0x31ca0,(%esp)
   30441:	e8 a6 15 00 00       	call   319ec <printk>
   30446:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   3044a:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
   30451:	7e e7                	jle    3043a <__init__+0x1e>
   30453:	c7 05 0c 30 03 00 00 	movl   $0x0,0x3300c
   3045a:	00 00 00 
   3045d:	e8 f6 17 00 00       	call   31c58 <init_timer>
   30462:	c7 04 24 a2 1c 03 00 	movl   $0x31ca2,(%esp)
   30469:	e8 7e 15 00 00       	call   319ec <printk>
   3046e:	e8 29 06 00 00       	call   30a9c <init_8259A>
   30473:	c7 44 24 04 ff 00 00 	movl   $0xff,0x4(%esp)
   3047a:	00 
   3047b:	c7 04 24 ff 00 00 00 	movl   $0xff,(%esp)
   30482:	e8 06 07 00 00       	call   30b8d <op_8259A>
   30487:	c7 04 24 bc 1c 03 00 	movl   $0x31cbc,(%esp)
   3048e:	e8 59 15 00 00       	call   319ec <printk>
   30493:	e8 d0 08 00 00       	call   30d68 <init_idt>
   30498:	c7 04 24 d5 1c 03 00 	movl   $0x31cd5,(%esp)
   3049f:	e8 48 15 00 00       	call   319ec <printk>
   304a4:	e8 a4 02 00 00       	call   3074d <init_first_thread>
   304a9:	c7 04 24 ec 1c 03 00 	movl   $0x31cec,(%esp)
   304b0:	e8 37 15 00 00       	call   319ec <printk>
   304b5:	e8 05 03 00 00       	call   307bf <init_second_thread>
   304ba:	c7 04 24 0c 1d 03 00 	movl   $0x31d0c,(%esp)
   304c1:	e8 26 15 00 00       	call   319ec <printk>
   304c6:	e8 4e 03 00 00       	call   30819 <init_third_thread>
   304cb:	c7 04 24 2c 1d 03 00 	movl   $0x31d2c,(%esp)
   304d2:	e8 15 15 00 00       	call   319ec <printk>
   304d7:	c7 04 24 4b 1d 03 00 	movl   $0x31d4b,(%esp)
   304de:	e8 09 15 00 00       	call   319ec <printk>
   304e3:	c7 44 24 04 c0 17 03 	movl   $0x317c0,0x4(%esp)
   304ea:	00 
   304eb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
   304f2:	e8 08 14 00 00       	call   318ff <set_irq_handler>
   304f7:	e8 32 05 00 00       	call   30a2e <run_first_thread>
   304fc:	c9                   	leave  
   304fd:	c3                   	ret    
   304fe:	90                   	nop
   304ff:	90                   	nop

00030500 <strncpy>:
   30500:	55                   	push   %ebp
   30501:	89 e5                	mov    %esp,%ebp
   30503:	83 ec 10             	sub    $0x10,%esp
   30506:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
   3050d:	eb 19                	jmp    30528 <strncpy+0x28>
   3050f:	8b 45 fc             	mov    -0x4(%ebp),%eax
   30512:	8b 55 08             	mov    0x8(%ebp),%edx
   30515:	01 c2                	add    %eax,%edx
   30517:	8b 45 fc             	mov    -0x4(%ebp),%eax
   3051a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
   3051d:	01 c8                	add    %ecx,%eax
   3051f:	0f b6 00             	movzbl (%eax),%eax
   30522:	88 02                	mov    %al,(%edx)
   30524:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   30528:	8b 45 fc             	mov    -0x4(%ebp),%eax
   3052b:	3b 45 10             	cmp    0x10(%ebp),%eax
   3052e:	73 20                	jae    30550 <strncpy+0x50>
   30530:	8b 45 fc             	mov    -0x4(%ebp),%eax
   30533:	8b 55 0c             	mov    0xc(%ebp),%edx
   30536:	01 d0                	add    %edx,%eax
   30538:	0f b6 00             	movzbl (%eax),%eax
   3053b:	84 c0                	test   %al,%al
   3053d:	75 d0                	jne    3050f <strncpy+0xf>
   3053f:	eb 0f                	jmp    30550 <strncpy+0x50>
   30541:	8b 45 fc             	mov    -0x4(%ebp),%eax
   30544:	8b 55 08             	mov    0x8(%ebp),%edx
   30547:	01 d0                	add    %edx,%eax
   30549:	c6 00 00             	movb   $0x0,(%eax)
   3054c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   30550:	8b 45 fc             	mov    -0x4(%ebp),%eax
   30553:	3b 45 10             	cmp    0x10(%ebp),%eax
   30556:	72 e9                	jb     30541 <strncpy+0x41>
   30558:	b8 01 00 00 00       	mov    $0x1,%eax
   3055d:	c9                   	leave  
   3055e:	c3                   	ret    

0003055f <testA>:
   3055f:	55                   	push   %ebp
   30560:	89 e5                	mov    %esp,%ebp
   30562:	83 ec 28             	sub    $0x28,%esp
   30565:	c7 04 24 69 1d 03 00 	movl   $0x31d69,(%esp)
   3056c:	e8 7b 14 00 00       	call   319ec <printk>
   30571:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
   30578:	e8 d3 16 00 00       	call   31c50 <system_call>
   3057d:	89 45 f4             	mov    %eax,-0xc(%ebp)
   30580:	8b 45 f4             	mov    -0xc(%ebp),%eax
   30583:	89 44 24 04          	mov    %eax,0x4(%esp)
   30587:	c7 04 24 6b 1d 03 00 	movl   $0x31d6b,(%esp)
   3058e:	e8 59 14 00 00       	call   319ec <printk>
   30593:	b8 e7 05 03 00       	mov    $0x305e7,%eax
   30598:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
   3059f:	ff d0                	call   *%eax
   305a1:	eb c2                	jmp    30565 <testA+0x6>

000305a3 <testB>:
   305a3:	55                   	push   %ebp
   305a4:	89 e5                	mov    %esp,%ebp
   305a6:	83 ec 18             	sub    $0x18,%esp
   305a9:	c7 04 24 6e 1d 03 00 	movl   $0x31d6e,(%esp)
   305b0:	e8 37 14 00 00       	call   319ec <printk>
   305b5:	b8 e7 05 03 00       	mov    $0x305e7,%eax
   305ba:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
   305c1:	ff d0                	call   *%eax
   305c3:	eb e4                	jmp    305a9 <testB+0x6>

000305c5 <testC>:
   305c5:	55                   	push   %ebp
   305c6:	89 e5                	mov    %esp,%ebp
   305c8:	83 ec 18             	sub    $0x18,%esp
   305cb:	c7 04 24 70 1d 03 00 	movl   $0x31d70,(%esp)
   305d2:	e8 15 14 00 00       	call   319ec <printk>
   305d7:	b8 e7 05 03 00       	mov    $0x305e7,%eax
   305dc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
   305e3:	ff d0                	call   *%eax
   305e5:	eb e4                	jmp    305cb <testC+0x6>

000305e7 <wait>:
   305e7:	55                   	push   %ebp
   305e8:	89 e5                	mov    %esp,%ebp
   305ea:	83 ec 10             	sub    $0x10,%esp
   305ed:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
   305f4:	eb 30                	jmp    30626 <wait+0x3f>
   305f6:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
   305fd:	eb 1a                	jmp    30619 <wait+0x32>
   305ff:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   30606:	eb 04                	jmp    3060c <wait+0x25>
   30608:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   3060c:	81 7d f4 f3 01 00 00 	cmpl   $0x1f3,-0xc(%ebp)
   30613:	7e f3                	jle    30608 <wait+0x21>
   30615:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
   30619:	81 7d f8 87 13 00 00 	cmpl   $0x1387,-0x8(%ebp)
   30620:	7e dd                	jle    305ff <wait+0x18>
   30622:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   30626:	8b 55 08             	mov    0x8(%ebp),%edx
   30629:	89 d0                	mov    %edx,%eax
   3062b:	01 c0                	add    %eax,%eax
   3062d:	01 d0                	add    %edx,%eax
   3062f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
   30632:	7f c2                	jg     305f6 <wait+0xf>
   30634:	c9                   	leave  
   30635:	c3                   	ret    

00030636 <list_init>:
   30636:	55                   	push   %ebp
   30637:	89 e5                	mov    %esp,%ebp
   30639:	8b 45 08             	mov    0x8(%ebp),%eax
   3063c:	8d 50 08             	lea    0x8(%eax),%edx
   3063f:	8b 45 08             	mov    0x8(%ebp),%eax
   30642:	89 50 04             	mov    %edx,0x4(%eax)
   30645:	8b 45 08             	mov    0x8(%ebp),%eax
   30648:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
   3064e:	8b 55 08             	mov    0x8(%ebp),%edx
   30651:	8b 45 08             	mov    0x8(%ebp),%eax
   30654:	89 50 08             	mov    %edx,0x8(%eax)
   30657:	8b 45 08             	mov    0x8(%ebp),%eax
   3065a:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
   30661:	b8 01 00 00 00       	mov    $0x1,%eax
   30666:	5d                   	pop    %ebp
   30667:	c3                   	ret    

00030668 <list_empty>:
   30668:	55                   	push   %ebp
   30669:	89 e5                	mov    %esp,%ebp
   3066b:	8b 45 08             	mov    0x8(%ebp),%eax
   3066e:	8b 40 04             	mov    0x4(%eax),%eax
   30671:	8b 55 08             	mov    0x8(%ebp),%edx
   30674:	83 c2 08             	add    $0x8,%edx
   30677:	39 d0                	cmp    %edx,%eax
   30679:	75 14                	jne    3068f <list_empty+0x27>
   3067b:	8b 45 08             	mov    0x8(%ebp),%eax
   3067e:	8b 50 08             	mov    0x8(%eax),%edx
   30681:	8b 45 08             	mov    0x8(%ebp),%eax
   30684:	39 c2                	cmp    %eax,%edx
   30686:	75 07                	jne    3068f <list_empty+0x27>
   30688:	b8 01 00 00 00       	mov    $0x1,%eax
   3068d:	eb 05                	jmp    30694 <list_empty+0x2c>
   3068f:	b8 00 00 00 00       	mov    $0x0,%eax
   30694:	5d                   	pop    %ebp
   30695:	c3                   	ret    

00030696 <list_insert_next>:
   30696:	55                   	push   %ebp
   30697:	89 e5                	mov    %esp,%ebp
   30699:	8b 45 08             	mov    0x8(%ebp),%eax
   3069c:	8b 50 04             	mov    0x4(%eax),%edx
   3069f:	8b 45 0c             	mov    0xc(%ebp),%eax
   306a2:	89 50 04             	mov    %edx,0x4(%eax)
   306a5:	8b 45 0c             	mov    0xc(%ebp),%eax
   306a8:	8b 55 08             	mov    0x8(%ebp),%edx
   306ab:	89 10                	mov    %edx,(%eax)
   306ad:	8b 45 08             	mov    0x8(%ebp),%eax
   306b0:	8b 40 04             	mov    0x4(%eax),%eax
   306b3:	8b 55 0c             	mov    0xc(%ebp),%edx
   306b6:	89 10                	mov    %edx,(%eax)
   306b8:	8b 45 08             	mov    0x8(%ebp),%eax
   306bb:	8b 55 0c             	mov    0xc(%ebp),%edx
   306be:	89 50 04             	mov    %edx,0x4(%eax)
   306c1:	b8 01 00 00 00       	mov    $0x1,%eax
   306c6:	5d                   	pop    %ebp
   306c7:	c3                   	ret    

000306c8 <list_insert_prev>:
   306c8:	55                   	push   %ebp
   306c9:	89 e5                	mov    %esp,%ebp
   306cb:	8b 45 08             	mov    0x8(%ebp),%eax
   306ce:	8b 55 0c             	mov    0xc(%ebp),%edx
   306d1:	89 50 04             	mov    %edx,0x4(%eax)
   306d4:	8b 45 0c             	mov    0xc(%ebp),%eax
   306d7:	8b 10                	mov    (%eax),%edx
   306d9:	8b 45 08             	mov    0x8(%ebp),%eax
   306dc:	89 10                	mov    %edx,(%eax)
   306de:	8b 45 0c             	mov    0xc(%ebp),%eax
   306e1:	8b 00                	mov    (%eax),%eax
   306e3:	8b 55 08             	mov    0x8(%ebp),%edx
   306e6:	89 50 04             	mov    %edx,0x4(%eax)
   306e9:	8b 45 0c             	mov    0xc(%ebp),%eax
   306ec:	8b 55 08             	mov    0x8(%ebp),%edx
   306ef:	89 10                	mov    %edx,(%eax)
   306f1:	b8 01 00 00 00       	mov    $0x1,%eax
   306f6:	5d                   	pop    %ebp
   306f7:	c3                   	ret    

000306f8 <list_insert_back>:
   306f8:	55                   	push   %ebp
   306f9:	89 e5                	mov    %esp,%ebp
   306fb:	83 ec 08             	sub    $0x8,%esp
   306fe:	8b 45 0c             	mov    0xc(%ebp),%eax
   30701:	83 c0 08             	add    $0x8,%eax
   30704:	89 44 24 04          	mov    %eax,0x4(%esp)
   30708:	8b 45 08             	mov    0x8(%ebp),%eax
   3070b:	89 04 24             	mov    %eax,(%esp)
   3070e:	e8 b5 ff ff ff       	call   306c8 <list_insert_prev>
   30713:	c9                   	leave  
   30714:	c3                   	ret    

00030715 <list_remove>:
   30715:	55                   	push   %ebp
   30716:	89 e5                	mov    %esp,%ebp
   30718:	8b 45 08             	mov    0x8(%ebp),%eax
   3071b:	8b 00                	mov    (%eax),%eax
   3071d:	8b 55 08             	mov    0x8(%ebp),%edx
   30720:	8b 52 04             	mov    0x4(%edx),%edx
   30723:	89 50 04             	mov    %edx,0x4(%eax)
   30726:	8b 45 08             	mov    0x8(%ebp),%eax
   30729:	8b 40 04             	mov    0x4(%eax),%eax
   3072c:	8b 55 08             	mov    0x8(%ebp),%edx
   3072f:	8b 12                	mov    (%edx),%edx
   30731:	89 10                	mov    %edx,(%eax)
   30733:	8b 45 08             	mov    0x8(%ebp),%eax
   30736:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
   3073d:	8b 45 08             	mov    0x8(%ebp),%eax
   30740:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
   30746:	b8 01 00 00 00       	mov    $0x1,%eax
   3074b:	5d                   	pop    %ebp
   3074c:	c3                   	ret    

0003074d <init_first_thread>:
   3074d:	55                   	push   %ebp
   3074e:	89 e5                	mov    %esp,%ebp
   30750:	83 ec 28             	sub    $0x28,%esp
   30753:	c7 04 24 04 40 03 00 	movl   $0x34004,(%esp)
   3075a:	e8 d7 fe ff ff       	call   30636 <list_init>
   3075f:	c7 04 24 14 40 03 00 	movl   $0x34014,(%esp)
   30766:	e8 cb fe ff ff       	call   30636 <list_init>
   3076b:	c7 44 24 0c 5f 05 03 	movl   $0x3055f,0xc(%esp)
   30772:	00 
   30773:	c7 44 24 08 72 1d 03 	movl   $0x31d72,0x8(%esp)
   3077a:	00 
   3077b:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
   30782:	00 
   30783:	c7 04 24 00 70 03 00 	movl   $0x37000,(%esp)
   3078a:	e8 e4 00 00 00       	call   30873 <init_thread>
   3078f:	89 45 f4             	mov    %eax,-0xc(%ebp)
   30792:	c7 44 24 04 14 40 03 	movl   $0x34014,0x4(%esp)
   30799:	00 
   3079a:	c7 04 24 6c 70 03 00 	movl   $0x3706c,(%esp)
   307a1:	e8 f5 01 00 00       	call   3099b <list_insert_by_pri>
   307a6:	c7 44 24 04 04 40 03 	movl   $0x34004,0x4(%esp)
   307ad:	00 
   307ae:	c7 04 24 74 70 03 00 	movl   $0x37074,(%esp)
   307b5:	e8 3e ff ff ff       	call   306f8 <list_insert_back>
   307ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
   307bd:	c9                   	leave  
   307be:	c3                   	ret    

000307bf <init_second_thread>:
   307bf:	55                   	push   %ebp
   307c0:	89 e5                	mov    %esp,%ebp
   307c2:	83 ec 28             	sub    $0x28,%esp
   307c5:	c7 44 24 0c a3 05 03 	movl   $0x305a3,0xc(%esp)
   307cc:	00 
   307cd:	c7 44 24 08 78 1d 03 	movl   $0x31d78,0x8(%esp)
   307d4:	00 
   307d5:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
   307dc:	00 
   307dd:	c7 04 24 00 50 03 00 	movl   $0x35000,(%esp)
   307e4:	e8 8a 00 00 00       	call   30873 <init_thread>
   307e9:	89 45 f4             	mov    %eax,-0xc(%ebp)
   307ec:	c7 44 24 04 14 40 03 	movl   $0x34014,0x4(%esp)
   307f3:	00 
   307f4:	c7 04 24 6c 50 03 00 	movl   $0x3506c,(%esp)
   307fb:	e8 9b 01 00 00       	call   3099b <list_insert_by_pri>
   30800:	c7 44 24 04 04 40 03 	movl   $0x34004,0x4(%esp)
   30807:	00 
   30808:	c7 04 24 74 50 03 00 	movl   $0x35074,(%esp)
   3080f:	e8 e4 fe ff ff       	call   306f8 <list_insert_back>
   30814:	8b 45 f4             	mov    -0xc(%ebp),%eax
   30817:	c9                   	leave  
   30818:	c3                   	ret    

00030819 <init_third_thread>:
   30819:	55                   	push   %ebp
   3081a:	89 e5                	mov    %esp,%ebp
   3081c:	83 ec 28             	sub    $0x28,%esp
   3081f:	c7 44 24 0c c5 05 03 	movl   $0x305c5,0xc(%esp)
   30826:	00 
   30827:	c7 44 24 08 7e 1d 03 	movl   $0x31d7e,0x8(%esp)
   3082e:	00 
   3082f:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
   30836:	00 
   30837:	c7 04 24 00 80 03 00 	movl   $0x38000,(%esp)
   3083e:	e8 30 00 00 00       	call   30873 <init_thread>
   30843:	89 45 f4             	mov    %eax,-0xc(%ebp)
   30846:	c7 44 24 04 14 40 03 	movl   $0x34014,0x4(%esp)
   3084d:	00 
   3084e:	c7 04 24 6c 80 03 00 	movl   $0x3806c,(%esp)
   30855:	e8 41 01 00 00       	call   3099b <list_insert_by_pri>
   3085a:	c7 44 24 04 04 40 03 	movl   $0x34004,0x4(%esp)
   30861:	00 
   30862:	c7 04 24 74 80 03 00 	movl   $0x38074,(%esp)
   30869:	e8 8a fe ff ff       	call   306f8 <list_insert_back>
   3086e:	8b 45 f4             	mov    -0xc(%ebp),%eax
   30871:	c9                   	leave  
   30872:	c3                   	ret    

00030873 <init_thread>:
   30873:	55                   	push   %ebp
   30874:	89 e5                	mov    %esp,%ebp
   30876:	83 ec 0c             	sub    $0xc,%esp
   30879:	a1 04 30 03 00       	mov    0x33004,%eax
   3087e:	89 c2                	mov    %eax,%edx
   30880:	8b 45 08             	mov    0x8(%ebp),%eax
   30883:	89 50 38             	mov    %edx,0x38(%eax)
   30886:	a1 08 30 03 00       	mov    0x33008,%eax
   3088b:	89 c2                	mov    %eax,%edx
   3088d:	8b 45 08             	mov    0x8(%ebp),%eax
   30890:	89 10                	mov    %edx,(%eax)
   30892:	a1 08 30 03 00       	mov    0x33008,%eax
   30897:	89 c2                	mov    %eax,%edx
   30899:	8b 45 08             	mov    0x8(%ebp),%eax
   3089c:	89 50 04             	mov    %edx,0x4(%eax)
   3089f:	a1 08 30 03 00       	mov    0x33008,%eax
   308a4:	89 c2                	mov    %eax,%edx
   308a6:	8b 45 08             	mov    0x8(%ebp),%eax
   308a9:	89 50 08             	mov    %edx,0x8(%eax)
   308ac:	a1 08 30 03 00       	mov    0x33008,%eax
   308b1:	89 c2                	mov    %eax,%edx
   308b3:	8b 45 08             	mov    0x8(%ebp),%eax
   308b6:	89 50 0c             	mov    %edx,0xc(%eax)
   308b9:	a1 08 30 03 00       	mov    0x33008,%eax
   308be:	89 c2                	mov    %eax,%edx
   308c0:	8b 45 08             	mov    0x8(%ebp),%eax
   308c3:	89 50 44             	mov    %edx,0x44(%eax)
   308c6:	8b 55 14             	mov    0x14(%ebp),%edx
   308c9:	8b 45 08             	mov    0x8(%ebp),%eax
   308cc:	89 50 34             	mov    %edx,0x34(%eax)
   308cf:	8b 45 08             	mov    0x8(%ebp),%eax
   308d2:	05 00 10 00 00       	add    $0x1000,%eax
   308d7:	89 c2                	mov    %eax,%edx
   308d9:	8b 45 08             	mov    0x8(%ebp),%eax
   308dc:	89 50 40             	mov    %edx,0x40(%eax)
   308df:	8b 45 08             	mov    0x8(%ebp),%eax
   308e2:	c7 40 3c 02 12 00 00 	movl   $0x1202,0x3c(%eax)
   308e9:	8b 45 08             	mov    0x8(%ebp),%eax
   308ec:	8d 50 4c             	lea    0x4c(%eax),%edx
   308ef:	c7 44 24 08 14 00 00 	movl   $0x14,0x8(%esp)
   308f6:	00 
   308f7:	8b 45 10             	mov    0x10(%ebp),%eax
   308fa:	89 44 24 04          	mov    %eax,0x4(%esp)
   308fe:	89 14 24             	mov    %edx,(%esp)
   30901:	e8 fa fb ff ff       	call   30500 <strncpy>
   30906:	8b 45 08             	mov    0x8(%ebp),%eax
   30909:	c7 40 64 00 00 00 00 	movl   $0x0,0x64(%eax)
   30910:	8b 45 08             	mov    0x8(%ebp),%eax
   30913:	8b 55 0c             	mov    0xc(%ebp),%edx
   30916:	89 50 60             	mov    %edx,0x60(%eax)
   30919:	b8 01 00 00 00       	mov    $0x1,%eax
   3091e:	c9                   	leave  
   3091f:	c3                   	ret    

00030920 <running_thread>:
   30920:	55                   	push   %ebp
   30921:	89 e5                	mov    %esp,%ebp
   30923:	a1 00 40 03 00       	mov    0x34000,%eax
   30928:	25 00 f0 ff ff       	and    $0xfffff000,%eax
   3092d:	5d                   	pop    %ebp
   3092e:	c3                   	ret    

0003092f <current_thread_ticks>:
   3092f:	55                   	push   %ebp
   30930:	89 e5                	mov    %esp,%ebp
   30932:	e8 e9 ff ff ff       	call   30920 <running_thread>
   30937:	8b 40 64             	mov    0x64(%eax),%eax
   3093a:	5d                   	pop    %ebp
   3093b:	c3                   	ret    

0003093c <current_thread_ticks_inc>:
   3093c:	55                   	push   %ebp
   3093d:	89 e5                	mov    %esp,%ebp
   3093f:	e8 dc ff ff ff       	call   30920 <running_thread>
   30944:	8b 50 64             	mov    0x64(%eax),%edx
   30947:	83 c2 01             	add    $0x1,%edx
   3094a:	89 50 64             	mov    %edx,0x64(%eax)
   3094d:	5d                   	pop    %ebp
   3094e:	c3                   	ret    

0003094f <next_thread_to_run>:
   3094f:	55                   	push   %ebp
   30950:	89 e5                	mov    %esp,%ebp
   30952:	83 ec 18             	sub    $0x18,%esp
   30955:	c7 04 24 14 40 03 00 	movl   $0x34014,(%esp)
   3095c:	e8 07 fd ff ff       	call   30668 <list_empty>
   30961:	85 c0                	test   %eax,%eax
   30963:	75 34                	jne    30999 <next_thread_to_run+0x4a>
   30965:	a1 18 40 03 00       	mov    0x34018,%eax
   3096a:	83 e8 6c             	sub    $0x6c,%eax
   3096d:	89 45 fc             	mov    %eax,-0x4(%ebp)
   30970:	8b 45 fc             	mov    -0x4(%ebp),%eax
   30973:	83 c0 6c             	add    $0x6c,%eax
   30976:	89 04 24             	mov    %eax,(%esp)
   30979:	e8 97 fd ff ff       	call   30715 <list_remove>
   3097e:	8b 45 fc             	mov    -0x4(%ebp),%eax
   30981:	83 c0 6c             	add    $0x6c,%eax
   30984:	c7 44 24 04 14 40 03 	movl   $0x34014,0x4(%esp)
   3098b:	00 
   3098c:	89 04 24             	mov    %eax,(%esp)
   3098f:	e8 64 fd ff ff       	call   306f8 <list_insert_back>
   30994:	8b 45 fc             	mov    -0x4(%ebp),%eax
   30997:	eb 00                	jmp    30999 <next_thread_to_run+0x4a>
   30999:	c9                   	leave  
   3099a:	c3                   	ret    

0003099b <list_insert_by_pri>:
   3099b:	55                   	push   %ebp
   3099c:	89 e5                	mov    %esp,%ebp
   3099e:	83 ec 18             	sub    $0x18,%esp
   309a1:	8b 45 0c             	mov    0xc(%ebp),%eax
   309a4:	89 04 24             	mov    %eax,(%esp)
   309a7:	e8 bc fc ff ff       	call   30668 <list_empty>
   309ac:	85 c0                	test   %eax,%eax
   309ae:	74 19                	je     309c9 <list_insert_by_pri+0x2e>
   309b0:	8b 45 0c             	mov    0xc(%ebp),%eax
   309b3:	8b 55 08             	mov    0x8(%ebp),%edx
   309b6:	89 54 24 04          	mov    %edx,0x4(%esp)
   309ba:	89 04 24             	mov    %eax,(%esp)
   309bd:	e8 d4 fc ff ff       	call   30696 <list_insert_next>
   309c2:	b8 01 00 00 00       	mov    $0x1,%eax
   309c7:	eb 63                	jmp    30a2c <list_insert_by_pri+0x91>
   309c9:	8b 45 0c             	mov    0xc(%ebp),%eax
   309cc:	8b 40 04             	mov    0x4(%eax),%eax
   309cf:	89 45 fc             	mov    %eax,-0x4(%ebp)
   309d2:	8b 45 08             	mov    0x8(%ebp),%eax
   309d5:	83 e8 6c             	sub    $0x6c,%eax
   309d8:	8b 50 60             	mov    0x60(%eax),%edx
   309db:	8b 45 fc             	mov    -0x4(%ebp),%eax
   309de:	83 e8 6c             	sub    $0x6c,%eax
   309e1:	8b 40 60             	mov    0x60(%eax),%eax
   309e4:	39 c2                	cmp    %eax,%edx
   309e6:	7d 19                	jge    30a01 <list_insert_by_pri+0x66>
   309e8:	8b 45 fc             	mov    -0x4(%ebp),%eax
   309eb:	89 44 24 04          	mov    %eax,0x4(%esp)
   309ef:	8b 45 08             	mov    0x8(%ebp),%eax
   309f2:	89 04 24             	mov    %eax,(%esp)
   309f5:	e8 ce fc ff ff       	call   306c8 <list_insert_prev>
   309fa:	b8 01 00 00 00       	mov    $0x1,%eax
   309ff:	eb 2b                	jmp    30a2c <list_insert_by_pri+0x91>
   30a01:	8b 45 fc             	mov    -0x4(%ebp),%eax
   30a04:	8b 40 04             	mov    0x4(%eax),%eax
   30a07:	89 45 fc             	mov    %eax,-0x4(%ebp)
   30a0a:	8b 45 0c             	mov    0xc(%ebp),%eax
   30a0d:	83 c0 08             	add    $0x8,%eax
   30a10:	3b 45 fc             	cmp    -0x4(%ebp),%eax
   30a13:	75 bd                	jne    309d2 <list_insert_by_pri+0x37>
   30a15:	8b 45 0c             	mov    0xc(%ebp),%eax
   30a18:	89 44 24 04          	mov    %eax,0x4(%esp)
   30a1c:	8b 45 08             	mov    0x8(%ebp),%eax
   30a1f:	89 04 24             	mov    %eax,(%esp)
   30a22:	e8 d1 fc ff ff       	call   306f8 <list_insert_back>
   30a27:	b8 01 00 00 00       	mov    $0x1,%eax
   30a2c:	c9                   	leave  
   30a2d:	c3                   	ret    

00030a2e <run_first_thread>:
   30a2e:	55                   	push   %ebp
   30a2f:	89 e5                	mov    %esp,%ebp
   30a31:	83 ec 08             	sub    $0x8,%esp
   30a34:	e8 16 ff ff ff       	call   3094f <next_thread_to_run>
   30a39:	a3 00 90 03 00       	mov    %eax,0x39000
   30a3e:	e8 26 0d 00 00       	call   31769 <restart_thread>
   30a43:	c9                   	leave  
   30a44:	c3                   	ret    
   30a45:	90                   	nop
   30a46:	90                   	nop
   30a47:	90                   	nop
   30a48:	90                   	nop
   30a49:	90                   	nop
   30a4a:	90                   	nop
   30a4b:	90                   	nop
   30a4c:	90                   	nop
   30a4d:	90                   	nop
   30a4e:	90                   	nop
   30a4f:	90                   	nop

00030a50 <disp_str>:
   30a50:	55                   	push   %ebp
   30a51:	89 e5                	mov    %esp,%ebp
   30a53:	8b 75 08             	mov    0x8(%ebp),%esi
   30a56:	8b 3d 0c 30 03 00    	mov    0x3300c,%edi
   30a5c:	b4 0f                	mov    $0xf,%ah

00030a5e <disp_str.1>:
   30a5e:	ac                   	lods   %ds:(%esi),%al
   30a5f:	84 c0                	test   %al,%al
   30a61:	74 2f                	je     30a92 <disp_str.2>
   30a63:	3c 0a                	cmp    $0xa,%al
   30a65:	75 16                	jne    30a7d <disp_str.3>
   30a67:	50                   	push   %eax
   30a68:	89 f8                	mov    %edi,%eax
   30a6a:	b3 a0                	mov    $0xa0,%bl
   30a6c:	f6 f3                	div    %bl
   30a6e:	25 ff 00 00 00       	and    $0xff,%eax
   30a73:	40                   	inc    %eax
   30a74:	b3 a0                	mov    $0xa0,%bl
   30a76:	f6 e3                	mul    %bl
   30a78:	89 c7                	mov    %eax,%edi
   30a7a:	58                   	pop    %eax
   30a7b:	eb e1                	jmp    30a5e <disp_str.1>

00030a7d <disp_str.3>:
   30a7d:	81 c7 00 80 0b 00    	add    $0xb8000,%edi
   30a83:	65 66 89 07          	mov    %ax,%gs:(%edi)
   30a87:	81 ef 00 80 0b 00    	sub    $0xb8000,%edi
   30a8d:	83 c7 02             	add    $0x2,%edi
   30a90:	eb cc                	jmp    30a5e <disp_str.1>

00030a92 <disp_str.2>:
   30a92:	89 3d 0c 30 03 00    	mov    %edi,0x3300c
   30a98:	5d                   	pop    %ebp
   30a99:	c3                   	ret    
   30a9a:	90                   	nop
   30a9b:	90                   	nop

00030a9c <init_8259A>:
   30a9c:	55                   	push   %ebp
   30a9d:	89 e5                	mov    %esp,%ebp
   30a9f:	83 ec 28             	sub    $0x28,%esp
   30aa2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   30aa9:	eb 12                	jmp    30abd <init_8259A+0x21>
   30aab:	8b 45 f4             	mov    -0xc(%ebp),%eax
   30aae:	c7 04 85 e0 4c 03 00 	movl   $0x31837,0x34ce0(,%eax,4)
   30ab5:	37 18 03 00 
   30ab9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   30abd:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
   30ac1:	7e e8                	jle    30aab <init_8259A+0xf>
   30ac3:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
   30aca:	00 
   30acb:	c7 04 24 ff 00 00 00 	movl   $0xff,(%esp)
   30ad2:	e8 e9 00 00 00       	call   30bc0 <outb>
   30ad7:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
   30ade:	00 
   30adf:	c7 04 24 ff 00 00 00 	movl   $0xff,(%esp)
   30ae6:	e8 d5 00 00 00       	call   30bc0 <outb>
   30aeb:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
   30af2:	00 
   30af3:	c7 04 24 11 00 00 00 	movl   $0x11,(%esp)
   30afa:	e8 cb 00 00 00       	call   30bca <outb_pic>
   30aff:	c7 44 24 04 a0 00 00 	movl   $0xa0,0x4(%esp)
   30b06:	00 
   30b07:	c7 04 24 11 00 00 00 	movl   $0x11,(%esp)
   30b0e:	e8 b7 00 00 00       	call   30bca <outb_pic>
   30b13:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
   30b1a:	00 
   30b1b:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
   30b22:	e8 a3 00 00 00       	call   30bca <outb_pic>
   30b27:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
   30b2e:	00 
   30b2f:	c7 04 24 28 00 00 00 	movl   $0x28,(%esp)
   30b36:	e8 8f 00 00 00       	call   30bca <outb_pic>
   30b3b:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
   30b42:	00 
   30b43:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
   30b4a:	e8 7b 00 00 00       	call   30bca <outb_pic>
   30b4f:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
   30b56:	00 
   30b57:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
   30b5e:	e8 67 00 00 00       	call   30bca <outb_pic>
   30b63:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
   30b6a:	00 
   30b6b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
   30b72:	e8 53 00 00 00       	call   30bca <outb_pic>
   30b77:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
   30b7e:	00 
   30b7f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
   30b86:	e8 3f 00 00 00       	call   30bca <outb_pic>
   30b8b:	c9                   	leave  
   30b8c:	c3                   	ret    

00030b8d <op_8259A>:
   30b8d:	55                   	push   %ebp
   30b8e:	89 e5                	mov    %esp,%ebp
   30b90:	83 ec 18             	sub    $0x18,%esp
   30b93:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
   30b9a:	00 
   30b9b:	8b 45 08             	mov    0x8(%ebp),%eax
   30b9e:	89 04 24             	mov    %eax,(%esp)
   30ba1:	e8 24 00 00 00       	call   30bca <outb_pic>
   30ba6:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
   30bad:	00 
   30bae:	8b 45 0c             	mov    0xc(%ebp),%eax
   30bb1:	89 04 24             	mov    %eax,(%esp)
   30bb4:	e8 11 00 00 00       	call   30bca <outb_pic>
   30bb9:	c9                   	leave  
   30bba:	c3                   	ret    
   30bbb:	90                   	nop
   30bbc:	90                   	nop
   30bbd:	90                   	nop
   30bbe:	90                   	nop
   30bbf:	90                   	nop

00030bc0 <outb>:
   30bc0:	8b 44 24 04          	mov    0x4(%esp),%eax
   30bc4:	8b 54 24 08          	mov    0x8(%esp),%edx
   30bc8:	ee                   	out    %al,(%dx)
   30bc9:	c3                   	ret    

00030bca <outb_pic>:
   30bca:	8b 44 24 04          	mov    0x4(%esp),%eax
   30bce:	8b 54 24 08          	mov    0x8(%esp),%edx
   30bd2:	ee                   	out    %al,(%dx)
   30bd3:	90                   	nop
   30bd4:	90                   	nop
   30bd5:	c3                   	ret    
   30bd6:	90                   	nop
   30bd7:	90                   	nop

00030bd8 <change_gdt>:
   30bd8:	55                   	push   %ebp
   30bd9:	89 e5                	mov    %esp,%ebp
   30bdb:	83 ec 18             	sub    $0x18,%esp
   30bde:	66 c7 05 40 40 03 00 	movw   $0x0,0x34040
   30be5:	00 00 
   30be7:	66 c7 05 42 40 03 00 	movw   $0x0,0x34042
   30bee:	00 00 
   30bf0:	c6 05 44 40 03 00 00 	movb   $0x0,0x34044
   30bf7:	c6 05 45 40 03 00 00 	movb   $0x0,0x34045
   30bfe:	c6 05 46 40 03 00 00 	movb   $0x0,0x34046
   30c05:	c6 05 47 40 03 00 00 	movb   $0x0,0x34047
   30c0c:	66 c7 05 a0 40 03 00 	movw   $0xffff,0x340a0
   30c13:	ff ff 
   30c15:	66 c7 05 a2 40 03 00 	movw   $0x0,0x340a2
   30c1c:	00 00 
   30c1e:	c6 05 a4 40 03 00 00 	movb   $0x0,0x340a4
   30c25:	c6 05 a5 40 03 00 9a 	movb   $0x9a,0x340a5
   30c2c:	c6 05 a6 40 03 00 cf 	movb   $0xcf,0x340a6
   30c33:	c6 05 a7 40 03 00 00 	movb   $0x0,0x340a7
   30c3a:	66 c7 05 a8 40 03 00 	movw   $0xffff,0x340a8
   30c41:	ff ff 
   30c43:	66 c7 05 aa 40 03 00 	movw   $0x0,0x340aa
   30c4a:	00 00 
   30c4c:	c6 05 ac 40 03 00 00 	movb   $0x0,0x340ac
   30c53:	c6 05 ad 40 03 00 93 	movb   $0x93,0x340ad
   30c5a:	c6 05 ae 40 03 00 cf 	movb   $0xcf,0x340ae
   30c61:	c6 05 af 40 03 00 00 	movb   $0x0,0x340af
   30c68:	66 c7 05 b0 40 03 00 	movw   $0xffff,0x340b0
   30c6f:	ff ff 
   30c71:	66 c7 05 b2 40 03 00 	movw   $0x0,0x340b2
   30c78:	00 00 
   30c7a:	c6 05 b4 40 03 00 00 	movb   $0x0,0x340b4
   30c81:	c6 05 b5 40 03 00 fa 	movb   $0xfa,0x340b5
   30c88:	c6 05 b6 40 03 00 cf 	movb   $0xcf,0x340b6
   30c8f:	c6 05 b7 40 03 00 00 	movb   $0x0,0x340b7
   30c96:	66 c7 05 b8 40 03 00 	movw   $0xffff,0x340b8
   30c9d:	ff ff 
   30c9f:	66 c7 05 ba 40 03 00 	movw   $0x0,0x340ba
   30ca6:	00 00 
   30ca8:	c6 05 bc 40 03 00 00 	movb   $0x0,0x340bc
   30caf:	c6 05 bd 40 03 00 f3 	movb   $0xf3,0x340bd
   30cb6:	c6 05 be 40 03 00 cf 	movb   $0xcf,0x340be
   30cbd:	c6 05 bf 40 03 00 00 	movb   $0x0,0x340bf
   30cc4:	66 c7 05 b8 40 03 00 	movw   $0xffff,0x340b8
   30ccb:	ff ff 
   30ccd:	66 c7 05 ba 40 03 00 	movw   $0x0,0x340ba
   30cd4:	00 00 
   30cd6:	c6 05 bc 40 03 00 00 	movb   $0x0,0x340bc
   30cdd:	c6 05 bd 40 03 00 f3 	movb   $0xf3,0x340bd
   30ce4:	c6 05 be 40 03 00 cf 	movb   $0xcf,0x340be
   30ceb:	c6 05 bf 40 03 00 00 	movb   $0x0,0x340bf
   30cf2:	c7 05 68 4c 03 00 68 	movl   $0x68,0x34c68
   30cf9:	00 00 00 
   30cfc:	66 c7 05 c6 4c 03 00 	movw   $0x68,0x34cc6
   30d03:	68 00 
   30d05:	66 c7 05 c0 40 03 00 	movw   $0x67,0x340c0
   30d0c:	67 00 
   30d0e:	b8 60 4c 03 00       	mov    $0x34c60,%eax
   30d13:	66 a3 c2 40 03 00    	mov    %ax,0x340c2
   30d19:	b8 60 4c 03 00       	mov    $0x34c60,%eax
   30d1e:	c1 e8 10             	shr    $0x10,%eax
   30d21:	a2 c4 40 03 00       	mov    %al,0x340c4
   30d26:	c6 05 c5 40 03 00 89 	movb   $0x89,0x340c5
   30d2d:	c6 05 c6 40 03 00 00 	movb   $0x0,0x340c6
   30d34:	b8 60 4c 03 00       	mov    $0x34c60,%eax
   30d39:	c1 e8 18             	shr    $0x18,%eax
   30d3c:	a2 c7 40 03 00       	mov    %al,0x340c7
   30d41:	c7 45 f4 0a 90 03 00 	movl   $0x3900a,-0xc(%ebp)
   30d48:	c7 45 f0 0c 90 03 00 	movl   $0x3900c,-0x10(%ebp)
   30d4f:	8b 45 f4             	mov    -0xc(%ebp),%eax
   30d52:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
   30d57:	ba 40 40 03 00       	mov    $0x34040,%edx
   30d5c:	8b 45 f0             	mov    -0x10(%ebp),%eax
   30d5f:	89 10                	mov    %edx,(%eax)
   30d61:	e8 6a 06 00 00       	call   313d0 <jump_new_gdt>
   30d66:	c9                   	leave  
   30d67:	c3                   	ret    

00030d68 <init_idt>:
   30d68:	55                   	push   %ebp
   30d69:	89 e5                	mov    %esp,%ebp
   30d6b:	83 ec 18             	sub    $0x18,%esp
   30d6e:	b8 f8 16 03 00       	mov    $0x316f8,%eax
   30d73:	66 a3 40 44 03 00    	mov    %ax,0x34440
   30d79:	66 c7 05 42 44 03 00 	movw   $0x60,0x34442
   30d80:	60 00 
   30d82:	c6 05 44 44 03 00 00 	movb   $0x0,0x34444
   30d89:	c6 05 45 44 03 00 8e 	movb   $0x8e,0x34445
   30d90:	b8 f8 16 03 00       	mov    $0x316f8,%eax
   30d95:	c1 e8 10             	shr    $0x10,%eax
   30d98:	66 a3 46 44 03 00    	mov    %ax,0x34446
   30d9e:	b8 fe 16 03 00       	mov    $0x316fe,%eax
   30da3:	66 a3 48 44 03 00    	mov    %ax,0x34448
   30da9:	66 c7 05 4a 44 03 00 	movw   $0x60,0x3444a
   30db0:	60 00 
   30db2:	c6 05 4c 44 03 00 00 	movb   $0x0,0x3444c
   30db9:	c6 05 4d 44 03 00 8e 	movb   $0x8e,0x3444d
   30dc0:	b8 fe 16 03 00       	mov    $0x316fe,%eax
   30dc5:	c1 e8 10             	shr    $0x10,%eax
   30dc8:	66 a3 4e 44 03 00    	mov    %ax,0x3444e
   30dce:	b8 04 17 03 00       	mov    $0x31704,%eax
   30dd3:	66 a3 50 44 03 00    	mov    %ax,0x34450
   30dd9:	66 c7 05 52 44 03 00 	movw   $0x60,0x34452
   30de0:	60 00 
   30de2:	c6 05 54 44 03 00 00 	movb   $0x0,0x34454
   30de9:	c6 05 55 44 03 00 8e 	movb   $0x8e,0x34455
   30df0:	b8 04 17 03 00       	mov    $0x31704,%eax
   30df5:	c1 e8 10             	shr    $0x10,%eax
   30df8:	66 a3 56 44 03 00    	mov    %ax,0x34456
   30dfe:	b8 0a 17 03 00       	mov    $0x3170a,%eax
   30e03:	66 a3 58 44 03 00    	mov    %ax,0x34458
   30e09:	66 c7 05 5a 44 03 00 	movw   $0x60,0x3445a
   30e10:	60 00 
   30e12:	c6 05 5c 44 03 00 00 	movb   $0x0,0x3445c
   30e19:	c6 05 5d 44 03 00 8e 	movb   $0x8e,0x3445d
   30e20:	b8 0a 17 03 00       	mov    $0x3170a,%eax
   30e25:	c1 e8 10             	shr    $0x10,%eax
   30e28:	66 a3 5e 44 03 00    	mov    %ax,0x3445e
   30e2e:	b8 10 17 03 00       	mov    $0x31710,%eax
   30e33:	66 a3 60 44 03 00    	mov    %ax,0x34460
   30e39:	66 c7 05 62 44 03 00 	movw   $0x60,0x34462
   30e40:	60 00 
   30e42:	c6 05 64 44 03 00 00 	movb   $0x0,0x34464
   30e49:	c6 05 65 44 03 00 8e 	movb   $0x8e,0x34465
   30e50:	b8 10 17 03 00       	mov    $0x31710,%eax
   30e55:	c1 e8 10             	shr    $0x10,%eax
   30e58:	66 a3 66 44 03 00    	mov    %ax,0x34466
   30e5e:	b8 16 17 03 00       	mov    $0x31716,%eax
   30e63:	66 a3 68 44 03 00    	mov    %ax,0x34468
   30e69:	66 c7 05 6a 44 03 00 	movw   $0x60,0x3446a
   30e70:	60 00 
   30e72:	c6 05 6c 44 03 00 00 	movb   $0x0,0x3446c
   30e79:	c6 05 6d 44 03 00 8e 	movb   $0x8e,0x3446d
   30e80:	b8 16 17 03 00       	mov    $0x31716,%eax
   30e85:	c1 e8 10             	shr    $0x10,%eax
   30e88:	66 a3 6e 44 03 00    	mov    %ax,0x3446e
   30e8e:	b8 1c 17 03 00       	mov    $0x3171c,%eax
   30e93:	66 a3 70 44 03 00    	mov    %ax,0x34470
   30e99:	66 c7 05 72 44 03 00 	movw   $0x60,0x34472
   30ea0:	60 00 
   30ea2:	c6 05 74 44 03 00 00 	movb   $0x0,0x34474
   30ea9:	c6 05 75 44 03 00 8e 	movb   $0x8e,0x34475
   30eb0:	b8 1c 17 03 00       	mov    $0x3171c,%eax
   30eb5:	c1 e8 10             	shr    $0x10,%eax
   30eb8:	66 a3 76 44 03 00    	mov    %ax,0x34476
   30ebe:	b8 22 17 03 00       	mov    $0x31722,%eax
   30ec3:	66 a3 78 44 03 00    	mov    %ax,0x34478
   30ec9:	66 c7 05 7a 44 03 00 	movw   $0x60,0x3447a
   30ed0:	60 00 
   30ed2:	c6 05 7c 44 03 00 00 	movb   $0x0,0x3447c
   30ed9:	c6 05 7d 44 03 00 8e 	movb   $0x8e,0x3447d
   30ee0:	b8 22 17 03 00       	mov    $0x31722,%eax
   30ee5:	c1 e8 10             	shr    $0x10,%eax
   30ee8:	66 a3 7e 44 03 00    	mov    %ax,0x3447e
   30eee:	b8 28 17 03 00       	mov    $0x31728,%eax
   30ef3:	66 a3 80 44 03 00    	mov    %ax,0x34480
   30ef9:	66 c7 05 82 44 03 00 	movw   $0x60,0x34482
   30f00:	60 00 
   30f02:	c6 05 84 44 03 00 00 	movb   $0x0,0x34484
   30f09:	c6 05 85 44 03 00 8e 	movb   $0x8e,0x34485
   30f10:	b8 28 17 03 00       	mov    $0x31728,%eax
   30f15:	c1 e8 10             	shr    $0x10,%eax
   30f18:	66 a3 86 44 03 00    	mov    %ax,0x34486
   30f1e:	b8 2c 17 03 00       	mov    $0x3172c,%eax
   30f23:	66 a3 88 44 03 00    	mov    %ax,0x34488
   30f29:	66 c7 05 8a 44 03 00 	movw   $0x60,0x3448a
   30f30:	60 00 
   30f32:	c6 05 8c 44 03 00 00 	movb   $0x0,0x3448c
   30f39:	c6 05 8d 44 03 00 8e 	movb   $0x8e,0x3448d
   30f40:	b8 2c 17 03 00       	mov    $0x3172c,%eax
   30f45:	c1 e8 10             	shr    $0x10,%eax
   30f48:	66 a3 8e 44 03 00    	mov    %ax,0x3448e
   30f4e:	b8 32 17 03 00       	mov    $0x31732,%eax
   30f53:	66 a3 90 44 03 00    	mov    %ax,0x34490
   30f59:	66 c7 05 92 44 03 00 	movw   $0x60,0x34492
   30f60:	60 00 
   30f62:	c6 05 94 44 03 00 00 	movb   $0x0,0x34494
   30f69:	c6 05 95 44 03 00 8e 	movb   $0x8e,0x34495
   30f70:	b8 32 17 03 00       	mov    $0x31732,%eax
   30f75:	c1 e8 10             	shr    $0x10,%eax
   30f78:	66 a3 96 44 03 00    	mov    %ax,0x34496
   30f7e:	b8 36 17 03 00       	mov    $0x31736,%eax
   30f83:	66 a3 98 44 03 00    	mov    %ax,0x34498
   30f89:	66 c7 05 9a 44 03 00 	movw   $0x60,0x3449a
   30f90:	60 00 
   30f92:	c6 05 9c 44 03 00 00 	movb   $0x0,0x3449c
   30f99:	c6 05 9d 44 03 00 8e 	movb   $0x8e,0x3449d
   30fa0:	b8 36 17 03 00       	mov    $0x31736,%eax
   30fa5:	c1 e8 10             	shr    $0x10,%eax
   30fa8:	66 a3 9e 44 03 00    	mov    %ax,0x3449e
   30fae:	b8 3a 17 03 00       	mov    $0x3173a,%eax
   30fb3:	66 a3 a0 44 03 00    	mov    %ax,0x344a0
   30fb9:	66 c7 05 a2 44 03 00 	movw   $0x60,0x344a2
   30fc0:	60 00 
   30fc2:	c6 05 a4 44 03 00 00 	movb   $0x0,0x344a4
   30fc9:	c6 05 a5 44 03 00 8e 	movb   $0x8e,0x344a5
   30fd0:	b8 3a 17 03 00       	mov    $0x3173a,%eax
   30fd5:	c1 e8 10             	shr    $0x10,%eax
   30fd8:	66 a3 a6 44 03 00    	mov    %ax,0x344a6
   30fde:	b8 3e 17 03 00       	mov    $0x3173e,%eax
   30fe3:	66 a3 a8 44 03 00    	mov    %ax,0x344a8
   30fe9:	66 c7 05 aa 44 03 00 	movw   $0x60,0x344aa
   30ff0:	60 00 
   30ff2:	c6 05 ac 44 03 00 00 	movb   $0x0,0x344ac
   30ff9:	c6 05 ad 44 03 00 8e 	movb   $0x8e,0x344ad
   31000:	b8 3e 17 03 00       	mov    $0x3173e,%eax
   31005:	c1 e8 10             	shr    $0x10,%eax
   31008:	66 a3 ae 44 03 00    	mov    %ax,0x344ae
   3100e:	b8 42 17 03 00       	mov    $0x31742,%eax
   31013:	66 a3 b0 44 03 00    	mov    %ax,0x344b0
   31019:	66 c7 05 b2 44 03 00 	movw   $0x60,0x344b2
   31020:	60 00 
   31022:	c6 05 b4 44 03 00 00 	movb   $0x0,0x344b4
   31029:	c6 05 b5 44 03 00 8e 	movb   $0x8e,0x344b5
   31030:	b8 42 17 03 00       	mov    $0x31742,%eax
   31035:	c1 e8 10             	shr    $0x10,%eax
   31038:	66 a3 b6 44 03 00    	mov    %ax,0x344b6
   3103e:	b8 46 17 03 00       	mov    $0x31746,%eax
   31043:	66 a3 c0 44 03 00    	mov    %ax,0x344c0
   31049:	66 c7 05 c2 44 03 00 	movw   $0x60,0x344c2
   31050:	60 00 
   31052:	c6 05 c4 44 03 00 00 	movb   $0x0,0x344c4
   31059:	c6 05 c5 44 03 00 8e 	movb   $0x8e,0x344c5
   31060:	b8 46 17 03 00       	mov    $0x31746,%eax
   31065:	c1 e8 10             	shr    $0x10,%eax
   31068:	66 a3 c6 44 03 00    	mov    %ax,0x344c6
   3106e:	b8 00 14 03 00       	mov    $0x31400,%eax
   31073:	66 a3 40 45 03 00    	mov    %ax,0x34540
   31079:	66 c7 05 42 45 03 00 	movw   $0x60,0x34542
   31080:	60 00 
   31082:	c6 05 44 45 03 00 00 	movb   $0x0,0x34544
   31089:	c6 05 45 45 03 00 8e 	movb   $0x8e,0x34545
   31090:	b8 00 14 03 00       	mov    $0x31400,%eax
   31095:	c1 e8 10             	shr    $0x10,%eax
   31098:	66 a3 46 45 03 00    	mov    %ax,0x34546
   3109e:	b8 30 14 03 00       	mov    $0x31430,%eax
   310a3:	66 a3 48 45 03 00    	mov    %ax,0x34548
   310a9:	66 c7 05 4a 45 03 00 	movw   $0x60,0x3454a
   310b0:	60 00 
   310b2:	c6 05 4c 45 03 00 00 	movb   $0x0,0x3454c
   310b9:	c6 05 4d 45 03 00 8e 	movb   $0x8e,0x3454d
   310c0:	b8 30 14 03 00       	mov    $0x31430,%eax
   310c5:	c1 e8 10             	shr    $0x10,%eax
   310c8:	66 a3 4e 45 03 00    	mov    %ax,0x3454e
   310ce:	b8 60 14 03 00       	mov    $0x31460,%eax
   310d3:	66 a3 50 45 03 00    	mov    %ax,0x34550
   310d9:	66 c7 05 52 45 03 00 	movw   $0x60,0x34552
   310e0:	60 00 
   310e2:	c6 05 54 45 03 00 00 	movb   $0x0,0x34554
   310e9:	c6 05 55 45 03 00 8e 	movb   $0x8e,0x34555
   310f0:	b8 60 14 03 00       	mov    $0x31460,%eax
   310f5:	c1 e8 10             	shr    $0x10,%eax
   310f8:	66 a3 56 45 03 00    	mov    %ax,0x34556
   310fe:	b8 90 14 03 00       	mov    $0x31490,%eax
   31103:	66 a3 58 45 03 00    	mov    %ax,0x34558
   31109:	66 c7 05 5a 45 03 00 	movw   $0x60,0x3455a
   31110:	60 00 
   31112:	c6 05 5c 45 03 00 00 	movb   $0x0,0x3455c
   31119:	c6 05 5d 45 03 00 8e 	movb   $0x8e,0x3455d
   31120:	b8 90 14 03 00       	mov    $0x31490,%eax
   31125:	c1 e8 10             	shr    $0x10,%eax
   31128:	66 a3 5e 45 03 00    	mov    %ax,0x3455e
   3112e:	b8 c0 14 03 00       	mov    $0x314c0,%eax
   31133:	66 a3 60 45 03 00    	mov    %ax,0x34560
   31139:	66 c7 05 62 45 03 00 	movw   $0x60,0x34562
   31140:	60 00 
   31142:	c6 05 64 45 03 00 00 	movb   $0x0,0x34564
   31149:	c6 05 65 45 03 00 8e 	movb   $0x8e,0x34565
   31150:	b8 c0 14 03 00       	mov    $0x314c0,%eax
   31155:	c1 e8 10             	shr    $0x10,%eax
   31158:	66 a3 66 45 03 00    	mov    %ax,0x34566
   3115e:	b8 f0 14 03 00       	mov    $0x314f0,%eax
   31163:	66 a3 68 45 03 00    	mov    %ax,0x34568
   31169:	66 c7 05 6a 45 03 00 	movw   $0x60,0x3456a
   31170:	60 00 
   31172:	c6 05 6c 45 03 00 00 	movb   $0x0,0x3456c
   31179:	c6 05 6d 45 03 00 8e 	movb   $0x8e,0x3456d
   31180:	b8 f0 14 03 00       	mov    $0x314f0,%eax
   31185:	c1 e8 10             	shr    $0x10,%eax
   31188:	66 a3 6e 45 03 00    	mov    %ax,0x3456e
   3118e:	b8 20 15 03 00       	mov    $0x31520,%eax
   31193:	66 a3 70 45 03 00    	mov    %ax,0x34570
   31199:	66 c7 05 72 45 03 00 	movw   $0x60,0x34572
   311a0:	60 00 
   311a2:	c6 05 74 45 03 00 00 	movb   $0x0,0x34574
   311a9:	c6 05 75 45 03 00 8e 	movb   $0x8e,0x34575
   311b0:	b8 20 15 03 00       	mov    $0x31520,%eax
   311b5:	c1 e8 10             	shr    $0x10,%eax
   311b8:	66 a3 76 45 03 00    	mov    %ax,0x34576
   311be:	b8 50 15 03 00       	mov    $0x31550,%eax
   311c3:	66 a3 78 45 03 00    	mov    %ax,0x34578
   311c9:	66 c7 05 7a 45 03 00 	movw   $0x60,0x3457a
   311d0:	60 00 
   311d2:	c6 05 7c 45 03 00 00 	movb   $0x0,0x3457c
   311d9:	c6 05 7d 45 03 00 8e 	movb   $0x8e,0x3457d
   311e0:	b8 50 15 03 00       	mov    $0x31550,%eax
   311e5:	c1 e8 10             	shr    $0x10,%eax
   311e8:	66 a3 7e 45 03 00    	mov    %ax,0x3457e
   311ee:	b8 80 15 03 00       	mov    $0x31580,%eax
   311f3:	66 a3 80 45 03 00    	mov    %ax,0x34580
   311f9:	66 c7 05 82 45 03 00 	movw   $0x60,0x34582
   31200:	60 00 
   31202:	c6 05 84 45 03 00 00 	movb   $0x0,0x34584
   31209:	c6 05 85 45 03 00 8e 	movb   $0x8e,0x34585
   31210:	b8 80 15 03 00       	mov    $0x31580,%eax
   31215:	c1 e8 10             	shr    $0x10,%eax
   31218:	66 a3 86 45 03 00    	mov    %ax,0x34586
   3121e:	b8 b0 15 03 00       	mov    $0x315b0,%eax
   31223:	66 a3 88 45 03 00    	mov    %ax,0x34588
   31229:	66 c7 05 8a 45 03 00 	movw   $0x60,0x3458a
   31230:	60 00 
   31232:	c6 05 8c 45 03 00 00 	movb   $0x0,0x3458c
   31239:	c6 05 8d 45 03 00 8e 	movb   $0x8e,0x3458d
   31240:	b8 b0 15 03 00       	mov    $0x315b0,%eax
   31245:	c1 e8 10             	shr    $0x10,%eax
   31248:	66 a3 8e 45 03 00    	mov    %ax,0x3458e
   3124e:	b8 e0 15 03 00       	mov    $0x315e0,%eax
   31253:	66 a3 90 45 03 00    	mov    %ax,0x34590
   31259:	66 c7 05 92 45 03 00 	movw   $0x60,0x34592
   31260:	60 00 
   31262:	c6 05 94 45 03 00 00 	movb   $0x0,0x34594
   31269:	c6 05 95 45 03 00 8e 	movb   $0x8e,0x34595
   31270:	b8 e0 15 03 00       	mov    $0x315e0,%eax
   31275:	c1 e8 10             	shr    $0x10,%eax
   31278:	66 a3 96 45 03 00    	mov    %ax,0x34596
   3127e:	b8 10 16 03 00       	mov    $0x31610,%eax
   31283:	66 a3 98 45 03 00    	mov    %ax,0x34598
   31289:	66 c7 05 9a 45 03 00 	movw   $0x60,0x3459a
   31290:	60 00 
   31292:	c6 05 9c 45 03 00 00 	movb   $0x0,0x3459c
   31299:	c6 05 9d 45 03 00 8e 	movb   $0x8e,0x3459d
   312a0:	b8 10 16 03 00       	mov    $0x31610,%eax
   312a5:	c1 e8 10             	shr    $0x10,%eax
   312a8:	66 a3 9e 45 03 00    	mov    %ax,0x3459e
   312ae:	b8 40 16 03 00       	mov    $0x31640,%eax
   312b3:	66 a3 a0 45 03 00    	mov    %ax,0x345a0
   312b9:	66 c7 05 a2 45 03 00 	movw   $0x60,0x345a2
   312c0:	60 00 
   312c2:	c6 05 a4 45 03 00 00 	movb   $0x0,0x345a4
   312c9:	c6 05 a5 45 03 00 8e 	movb   $0x8e,0x345a5
   312d0:	b8 40 16 03 00       	mov    $0x31640,%eax
   312d5:	c1 e8 10             	shr    $0x10,%eax
   312d8:	66 a3 a6 45 03 00    	mov    %ax,0x345a6
   312de:	b8 70 16 03 00       	mov    $0x31670,%eax
   312e3:	66 a3 a8 45 03 00    	mov    %ax,0x345a8
   312e9:	66 c7 05 aa 45 03 00 	movw   $0x60,0x345aa
   312f0:	60 00 
   312f2:	c6 05 ac 45 03 00 00 	movb   $0x0,0x345ac
   312f9:	c6 05 ad 45 03 00 8e 	movb   $0x8e,0x345ad
   31300:	b8 70 16 03 00       	mov    $0x31670,%eax
   31305:	c1 e8 10             	shr    $0x10,%eax
   31308:	66 a3 ae 45 03 00    	mov    %ax,0x345ae
   3130e:	b8 a0 16 03 00       	mov    $0x316a0,%eax
   31313:	66 a3 b0 45 03 00    	mov    %ax,0x345b0
   31319:	66 c7 05 b2 45 03 00 	movw   $0x60,0x345b2
   31320:	60 00 
   31322:	c6 05 b4 45 03 00 00 	movb   $0x0,0x345b4
   31329:	c6 05 b5 45 03 00 8e 	movb   $0x8e,0x345b5
   31330:	b8 a0 16 03 00       	mov    $0x316a0,%eax
   31335:	c1 e8 10             	shr    $0x10,%eax
   31338:	66 a3 b6 45 03 00    	mov    %ax,0x345b6
   3133e:	b8 d0 16 03 00       	mov    $0x316d0,%eax
   31343:	66 a3 b8 45 03 00    	mov    %ax,0x345b8
   31349:	66 c7 05 ba 45 03 00 	movw   $0x60,0x345ba
   31350:	60 00 
   31352:	c6 05 bc 45 03 00 00 	movb   $0x0,0x345bc
   31359:	c6 05 bd 45 03 00 8e 	movb   $0x8e,0x345bd
   31360:	b8 d0 16 03 00       	mov    $0x316d0,%eax
   31365:	c1 e8 10             	shr    $0x10,%eax
   31368:	66 a3 be 45 03 00    	mov    %ax,0x345be
   3136e:	b8 55 17 03 00       	mov    $0x31755,%eax
   31373:	66 a3 40 48 03 00    	mov    %ax,0x34840
   31379:	66 c7 05 42 48 03 00 	movw   $0x60,0x34842
   31380:	60 00 
   31382:	c6 05 44 48 03 00 00 	movb   $0x0,0x34844
   31389:	c6 05 45 48 03 00 ee 	movb   $0xee,0x34845
   31390:	b8 55 17 03 00       	mov    $0x31755,%eax
   31395:	c1 e8 10             	shr    $0x10,%eax
   31398:	66 a3 46 48 03 00    	mov    %ax,0x34846
   3139e:	c7 45 f4 04 90 03 00 	movl   $0x39004,-0xc(%ebp)
   313a5:	c7 45 f0 06 90 03 00 	movl   $0x39006,-0x10(%ebp)
   313ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
   313af:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
   313b4:	ba 40 44 03 00       	mov    $0x34440,%edx
   313b9:	8b 45 f0             	mov    -0x10(%ebp),%eax
   313bc:	89 10                	mov    %edx,(%eax)
   313be:	e8 34 00 00 00       	call   313f7 <load_idt>
   313c3:	c9                   	leave  
   313c4:	c3                   	ret    
   313c5:	90                   	nop
   313c6:	90                   	nop
   313c7:	90                   	nop
   313c8:	90                   	nop
   313c9:	90                   	nop
   313ca:	90                   	nop
   313cb:	90                   	nop
   313cc:	90                   	nop
   313cd:	90                   	nop
   313ce:	90                   	nop
   313cf:	90                   	nop

000313d0 <jump_new_gdt>:
   313d0:	0f 01 15 0a 90 03 00 	lgdtl  0x3900a
   313d7:	66 b8 68 00          	mov    $0x68,%ax
   313db:	8e d8                	mov    %eax,%ds
   313dd:	8e c0                	mov    %eax,%es
   313df:	8e d0                	mov    %eax,%ss
   313e1:	8e e0                	mov    %eax,%fs
   313e3:	8e e8                	mov    %eax,%gs
   313e5:	31 c0                	xor    %eax,%eax
   313e7:	66 b8 80 00          	mov    $0x80,%ax
   313eb:	0f 00 d8             	ltr    %ax
   313ee:	ea f6 13 03 00 60 00 	ljmp   $0x60,$0x313f6
   313f5:	c3                   	ret    

000313f6 <use_new_gdt>:
   313f6:	c3                   	ret    

000313f7 <load_idt>:
   313f7:	0f 01 1d 04 90 03 00 	lidtl  0x39004
   313fe:	c3                   	ret    
   313ff:	90                   	nop

00031400 <hwint00>:
   31400:	8b 54 24 0c          	mov    0xc(%esp),%edx
   31404:	89 15 00 40 03 00    	mov    %edx,0x34000
   3140a:	e8 7a 03 00 00       	call   31789 <save>
   3140f:	e4 21                	in     $0x21,%al
   31411:	0c 01                	or     $0x1,%al
   31413:	e6 21                	out    %al,$0x21
   31415:	b0 20                	mov    $0x20,%al
   31417:	e6 20                	out    %al,$0x20
   31419:	fb                   	sti    
   3141a:	ff 15 e0 4c 03 00    	call   *0x34ce0
   31420:	fa                   	cli    
   31421:	e4 21                	in     $0x21,%al
   31423:	24 fe                	and    $0xfe,%al
   31425:	e6 21                	out    %al,$0x21
   31427:	c3                   	ret    
   31428:	90                   	nop
   31429:	90                   	nop
   3142a:	90                   	nop
   3142b:	90                   	nop
   3142c:	90                   	nop
   3142d:	90                   	nop
   3142e:	90                   	nop
   3142f:	90                   	nop

00031430 <hwint01>:
   31430:	8b 54 24 0c          	mov    0xc(%esp),%edx
   31434:	89 15 00 40 03 00    	mov    %edx,0x34000
   3143a:	e8 4a 03 00 00       	call   31789 <save>
   3143f:	e4 21                	in     $0x21,%al
   31441:	0c 01                	or     $0x1,%al
   31443:	e6 21                	out    %al,$0x21
   31445:	b0 20                	mov    $0x20,%al
   31447:	e6 20                	out    %al,$0x20
   31449:	fb                   	sti    
   3144a:	ff 15 e4 4c 03 00    	call   *0x34ce4
   31450:	fa                   	cli    
   31451:	e4 21                	in     $0x21,%al
   31453:	24 fe                	and    $0xfe,%al
   31455:	e6 21                	out    %al,$0x21
   31457:	c3                   	ret    
   31458:	90                   	nop
   31459:	90                   	nop
   3145a:	90                   	nop
   3145b:	90                   	nop
   3145c:	90                   	nop
   3145d:	90                   	nop
   3145e:	90                   	nop
   3145f:	90                   	nop

00031460 <hwint02>:
   31460:	8b 54 24 0c          	mov    0xc(%esp),%edx
   31464:	89 15 00 40 03 00    	mov    %edx,0x34000
   3146a:	e8 1a 03 00 00       	call   31789 <save>
   3146f:	e4 21                	in     $0x21,%al
   31471:	0c 01                	or     $0x1,%al
   31473:	e6 21                	out    %al,$0x21
   31475:	b0 20                	mov    $0x20,%al
   31477:	e6 20                	out    %al,$0x20
   31479:	fb                   	sti    
   3147a:	ff 15 e8 4c 03 00    	call   *0x34ce8
   31480:	fa                   	cli    
   31481:	e4 21                	in     $0x21,%al
   31483:	24 fe                	and    $0xfe,%al
   31485:	e6 21                	out    %al,$0x21
   31487:	c3                   	ret    
   31488:	90                   	nop
   31489:	90                   	nop
   3148a:	90                   	nop
   3148b:	90                   	nop
   3148c:	90                   	nop
   3148d:	90                   	nop
   3148e:	90                   	nop
   3148f:	90                   	nop

00031490 <hwint03>:
   31490:	8b 54 24 0c          	mov    0xc(%esp),%edx
   31494:	89 15 00 40 03 00    	mov    %edx,0x34000
   3149a:	e8 ea 02 00 00       	call   31789 <save>
   3149f:	e4 21                	in     $0x21,%al
   314a1:	0c 01                	or     $0x1,%al
   314a3:	e6 21                	out    %al,$0x21
   314a5:	b0 20                	mov    $0x20,%al
   314a7:	e6 20                	out    %al,$0x20
   314a9:	fb                   	sti    
   314aa:	ff 15 ec 4c 03 00    	call   *0x34cec
   314b0:	fa                   	cli    
   314b1:	e4 21                	in     $0x21,%al
   314b3:	24 fe                	and    $0xfe,%al
   314b5:	e6 21                	out    %al,$0x21
   314b7:	c3                   	ret    
   314b8:	90                   	nop
   314b9:	90                   	nop
   314ba:	90                   	nop
   314bb:	90                   	nop
   314bc:	90                   	nop
   314bd:	90                   	nop
   314be:	90                   	nop
   314bf:	90                   	nop

000314c0 <hwint04>:
   314c0:	8b 54 24 0c          	mov    0xc(%esp),%edx
   314c4:	89 15 00 40 03 00    	mov    %edx,0x34000
   314ca:	e8 ba 02 00 00       	call   31789 <save>
   314cf:	e4 21                	in     $0x21,%al
   314d1:	0c 01                	or     $0x1,%al
   314d3:	e6 21                	out    %al,$0x21
   314d5:	b0 20                	mov    $0x20,%al
   314d7:	e6 20                	out    %al,$0x20
   314d9:	fb                   	sti    
   314da:	ff 15 f0 4c 03 00    	call   *0x34cf0
   314e0:	fa                   	cli    
   314e1:	e4 21                	in     $0x21,%al
   314e3:	24 fe                	and    $0xfe,%al
   314e5:	e6 21                	out    %al,$0x21
   314e7:	c3                   	ret    
   314e8:	90                   	nop
   314e9:	90                   	nop
   314ea:	90                   	nop
   314eb:	90                   	nop
   314ec:	90                   	nop
   314ed:	90                   	nop
   314ee:	90                   	nop
   314ef:	90                   	nop

000314f0 <hwint05>:
   314f0:	8b 54 24 0c          	mov    0xc(%esp),%edx
   314f4:	89 15 00 40 03 00    	mov    %edx,0x34000
   314fa:	e8 8a 02 00 00       	call   31789 <save>
   314ff:	e4 21                	in     $0x21,%al
   31501:	0c 01                	or     $0x1,%al
   31503:	e6 21                	out    %al,$0x21
   31505:	b0 20                	mov    $0x20,%al
   31507:	e6 20                	out    %al,$0x20
   31509:	fb                   	sti    
   3150a:	ff 15 f4 4c 03 00    	call   *0x34cf4
   31510:	fa                   	cli    
   31511:	e4 21                	in     $0x21,%al
   31513:	24 fe                	and    $0xfe,%al
   31515:	e6 21                	out    %al,$0x21
   31517:	c3                   	ret    
   31518:	90                   	nop
   31519:	90                   	nop
   3151a:	90                   	nop
   3151b:	90                   	nop
   3151c:	90                   	nop
   3151d:	90                   	nop
   3151e:	90                   	nop
   3151f:	90                   	nop

00031520 <hwint06>:
   31520:	8b 54 24 0c          	mov    0xc(%esp),%edx
   31524:	89 15 00 40 03 00    	mov    %edx,0x34000
   3152a:	e8 5a 02 00 00       	call   31789 <save>
   3152f:	e4 21                	in     $0x21,%al
   31531:	0c 01                	or     $0x1,%al
   31533:	e6 21                	out    %al,$0x21
   31535:	b0 20                	mov    $0x20,%al
   31537:	e6 20                	out    %al,$0x20
   31539:	fb                   	sti    
   3153a:	ff 15 f8 4c 03 00    	call   *0x34cf8
   31540:	fa                   	cli    
   31541:	e4 21                	in     $0x21,%al
   31543:	24 fe                	and    $0xfe,%al
   31545:	e6 21                	out    %al,$0x21
   31547:	c3                   	ret    
   31548:	90                   	nop
   31549:	90                   	nop
   3154a:	90                   	nop
   3154b:	90                   	nop
   3154c:	90                   	nop
   3154d:	90                   	nop
   3154e:	90                   	nop
   3154f:	90                   	nop

00031550 <hwint07>:
   31550:	8b 54 24 0c          	mov    0xc(%esp),%edx
   31554:	89 15 00 40 03 00    	mov    %edx,0x34000
   3155a:	e8 2a 02 00 00       	call   31789 <save>
   3155f:	e4 21                	in     $0x21,%al
   31561:	0c 01                	or     $0x1,%al
   31563:	e6 21                	out    %al,$0x21
   31565:	b0 20                	mov    $0x20,%al
   31567:	e6 20                	out    %al,$0x20
   31569:	fb                   	sti    
   3156a:	ff 15 fc 4c 03 00    	call   *0x34cfc
   31570:	fa                   	cli    
   31571:	e4 21                	in     $0x21,%al
   31573:	24 fe                	and    $0xfe,%al
   31575:	e6 21                	out    %al,$0x21
   31577:	c3                   	ret    
   31578:	90                   	nop
   31579:	90                   	nop
   3157a:	90                   	nop
   3157b:	90                   	nop
   3157c:	90                   	nop
   3157d:	90                   	nop
   3157e:	90                   	nop
   3157f:	90                   	nop

00031580 <hwint08>:
   31580:	8b 54 24 0c          	mov    0xc(%esp),%edx
   31584:	89 15 00 40 03 00    	mov    %edx,0x34000
   3158a:	e8 fa 01 00 00       	call   31789 <save>
   3158f:	e4 21                	in     $0x21,%al
   31591:	0c 01                	or     $0x1,%al
   31593:	e6 21                	out    %al,$0x21
   31595:	b0 20                	mov    $0x20,%al
   31597:	e6 20                	out    %al,$0x20
   31599:	fb                   	sti    
   3159a:	ff 15 00 4d 03 00    	call   *0x34d00
   315a0:	fa                   	cli    
   315a1:	e4 21                	in     $0x21,%al
   315a3:	24 fe                	and    $0xfe,%al
   315a5:	e6 21                	out    %al,$0x21
   315a7:	c3                   	ret    
   315a8:	90                   	nop
   315a9:	90                   	nop
   315aa:	90                   	nop
   315ab:	90                   	nop
   315ac:	90                   	nop
   315ad:	90                   	nop
   315ae:	90                   	nop
   315af:	90                   	nop

000315b0 <hwint09>:
   315b0:	8b 54 24 0c          	mov    0xc(%esp),%edx
   315b4:	89 15 00 40 03 00    	mov    %edx,0x34000
   315ba:	e8 ca 01 00 00       	call   31789 <save>
   315bf:	e4 21                	in     $0x21,%al
   315c1:	0c 01                	or     $0x1,%al
   315c3:	e6 21                	out    %al,$0x21
   315c5:	b0 20                	mov    $0x20,%al
   315c7:	e6 20                	out    %al,$0x20
   315c9:	fb                   	sti    
   315ca:	ff 15 04 4d 03 00    	call   *0x34d04
   315d0:	fa                   	cli    
   315d1:	e4 21                	in     $0x21,%al
   315d3:	24 fe                	and    $0xfe,%al
   315d5:	e6 21                	out    %al,$0x21
   315d7:	c3                   	ret    
   315d8:	90                   	nop
   315d9:	90                   	nop
   315da:	90                   	nop
   315db:	90                   	nop
   315dc:	90                   	nop
   315dd:	90                   	nop
   315de:	90                   	nop
   315df:	90                   	nop

000315e0 <hwint10>:
   315e0:	8b 54 24 0c          	mov    0xc(%esp),%edx
   315e4:	89 15 00 40 03 00    	mov    %edx,0x34000
   315ea:	e8 9a 01 00 00       	call   31789 <save>
   315ef:	e4 21                	in     $0x21,%al
   315f1:	0c 01                	or     $0x1,%al
   315f3:	e6 21                	out    %al,$0x21
   315f5:	b0 20                	mov    $0x20,%al
   315f7:	e6 20                	out    %al,$0x20
   315f9:	fb                   	sti    
   315fa:	ff 15 08 4d 03 00    	call   *0x34d08
   31600:	fa                   	cli    
   31601:	e4 21                	in     $0x21,%al
   31603:	24 fe                	and    $0xfe,%al
   31605:	e6 21                	out    %al,$0x21
   31607:	c3                   	ret    
   31608:	90                   	nop
   31609:	90                   	nop
   3160a:	90                   	nop
   3160b:	90                   	nop
   3160c:	90                   	nop
   3160d:	90                   	nop
   3160e:	90                   	nop
   3160f:	90                   	nop

00031610 <hwint11>:
   31610:	8b 54 24 0c          	mov    0xc(%esp),%edx
   31614:	89 15 00 40 03 00    	mov    %edx,0x34000
   3161a:	e8 6a 01 00 00       	call   31789 <save>
   3161f:	e4 21                	in     $0x21,%al
   31621:	0c 01                	or     $0x1,%al
   31623:	e6 21                	out    %al,$0x21
   31625:	b0 20                	mov    $0x20,%al
   31627:	e6 20                	out    %al,$0x20
   31629:	fb                   	sti    
   3162a:	ff 15 0c 4d 03 00    	call   *0x34d0c
   31630:	fa                   	cli    
   31631:	e4 21                	in     $0x21,%al
   31633:	24 fe                	and    $0xfe,%al
   31635:	e6 21                	out    %al,$0x21
   31637:	c3                   	ret    
   31638:	90                   	nop
   31639:	90                   	nop
   3163a:	90                   	nop
   3163b:	90                   	nop
   3163c:	90                   	nop
   3163d:	90                   	nop
   3163e:	90                   	nop
   3163f:	90                   	nop

00031640 <hwint12>:
   31640:	8b 54 24 0c          	mov    0xc(%esp),%edx
   31644:	89 15 00 40 03 00    	mov    %edx,0x34000
   3164a:	e8 3a 01 00 00       	call   31789 <save>
   3164f:	e4 21                	in     $0x21,%al
   31651:	0c 01                	or     $0x1,%al
   31653:	e6 21                	out    %al,$0x21
   31655:	b0 20                	mov    $0x20,%al
   31657:	e6 20                	out    %al,$0x20
   31659:	fb                   	sti    
   3165a:	ff 15 10 4d 03 00    	call   *0x34d10
   31660:	fa                   	cli    
   31661:	e4 21                	in     $0x21,%al
   31663:	24 fe                	and    $0xfe,%al
   31665:	e6 21                	out    %al,$0x21
   31667:	c3                   	ret    
   31668:	90                   	nop
   31669:	90                   	nop
   3166a:	90                   	nop
   3166b:	90                   	nop
   3166c:	90                   	nop
   3166d:	90                   	nop
   3166e:	90                   	nop
   3166f:	90                   	nop

00031670 <hwint13>:
   31670:	8b 54 24 0c          	mov    0xc(%esp),%edx
   31674:	89 15 00 40 03 00    	mov    %edx,0x34000
   3167a:	e8 0a 01 00 00       	call   31789 <save>
   3167f:	e4 21                	in     $0x21,%al
   31681:	0c 01                	or     $0x1,%al
   31683:	e6 21                	out    %al,$0x21
   31685:	b0 20                	mov    $0x20,%al
   31687:	e6 20                	out    %al,$0x20
   31689:	fb                   	sti    
   3168a:	ff 15 14 4d 03 00    	call   *0x34d14
   31690:	fa                   	cli    
   31691:	e4 21                	in     $0x21,%al
   31693:	24 fe                	and    $0xfe,%al
   31695:	e6 21                	out    %al,$0x21
   31697:	c3                   	ret    
   31698:	90                   	nop
   31699:	90                   	nop
   3169a:	90                   	nop
   3169b:	90                   	nop
   3169c:	90                   	nop
   3169d:	90                   	nop
   3169e:	90                   	nop
   3169f:	90                   	nop

000316a0 <hwint14>:
   316a0:	8b 54 24 0c          	mov    0xc(%esp),%edx
   316a4:	89 15 00 40 03 00    	mov    %edx,0x34000
   316aa:	e8 da 00 00 00       	call   31789 <save>
   316af:	e4 21                	in     $0x21,%al
   316b1:	0c 01                	or     $0x1,%al
   316b3:	e6 21                	out    %al,$0x21
   316b5:	b0 20                	mov    $0x20,%al
   316b7:	e6 20                	out    %al,$0x20
   316b9:	fb                   	sti    
   316ba:	ff 15 18 4d 03 00    	call   *0x34d18
   316c0:	fa                   	cli    
   316c1:	e4 21                	in     $0x21,%al
   316c3:	24 fe                	and    $0xfe,%al
   316c5:	e6 21                	out    %al,$0x21
   316c7:	c3                   	ret    
   316c8:	90                   	nop
   316c9:	90                   	nop
   316ca:	90                   	nop
   316cb:	90                   	nop
   316cc:	90                   	nop
   316cd:	90                   	nop
   316ce:	90                   	nop
   316cf:	90                   	nop

000316d0 <hwint15>:
   316d0:	8b 54 24 0c          	mov    0xc(%esp),%edx
   316d4:	89 15 00 40 03 00    	mov    %edx,0x34000
   316da:	e8 aa 00 00 00       	call   31789 <save>
   316df:	e4 21                	in     $0x21,%al
   316e1:	0c 01                	or     $0x1,%al
   316e3:	e6 21                	out    %al,$0x21
   316e5:	b0 20                	mov    $0x20,%al
   316e7:	e6 20                	out    %al,$0x20
   316e9:	fb                   	sti    
   316ea:	ff 15 1c 4d 03 00    	call   *0x34d1c
   316f0:	fa                   	cli    
   316f1:	e4 21                	in     $0x21,%al
   316f3:	24 fe                	and    $0xfe,%al
   316f5:	e6 21                	out    %al,$0x21
   316f7:	c3                   	ret    

000316f8 <divide_error>:
   316f8:	6a ff                	push   $0xffffffff
   316fa:	6a 00                	push   $0x0
   316fc:	eb 4e                	jmp    3174c <exception>

000316fe <debug>:
   316fe:	6a ff                	push   $0xffffffff
   31700:	6a 01                	push   $0x1
   31702:	eb 48                	jmp    3174c <exception>

00031704 <nmi>:
   31704:	6a ff                	push   $0xffffffff
   31706:	6a 02                	push   $0x2
   31708:	eb 42                	jmp    3174c <exception>

0003170a <int3>:
   3170a:	6a ff                	push   $0xffffffff
   3170c:	6a 03                	push   $0x3
   3170e:	eb 3c                	jmp    3174c <exception>

00031710 <overflow>:
   31710:	6a ff                	push   $0xffffffff
   31712:	6a 04                	push   $0x4
   31714:	eb 36                	jmp    3174c <exception>

00031716 <bounds>:
   31716:	6a ff                	push   $0xffffffff
   31718:	6a 05                	push   $0x5
   3171a:	eb 30                	jmp    3174c <exception>

0003171c <invalid_op>:
   3171c:	6a ff                	push   $0xffffffff
   3171e:	6a 06                	push   $0x6
   31720:	eb 2a                	jmp    3174c <exception>

00031722 <device_not_available>:
   31722:	6a ff                	push   $0xffffffff
   31724:	6a 07                	push   $0x7
   31726:	eb 24                	jmp    3174c <exception>

00031728 <doublefault_fn>:
   31728:	6a 08                	push   $0x8
   3172a:	eb 20                	jmp    3174c <exception>

0003172c <coprocessor_segment_overrun>:
   3172c:	6a ff                	push   $0xffffffff
   3172e:	6a 09                	push   $0x9
   31730:	eb 1a                	jmp    3174c <exception>

00031732 <invalid_tss>:
   31732:	6a 0a                	push   $0xa
   31734:	eb 16                	jmp    3174c <exception>

00031736 <segment_not_present>:
   31736:	6a 0b                	push   $0xb
   31738:	eb 12                	jmp    3174c <exception>

0003173a <stack_segment>:
   3173a:	6a 0c                	push   $0xc
   3173c:	eb 0e                	jmp    3174c <exception>

0003173e <general_protection>:
   3173e:	6a 0d                	push   $0xd
   31740:	eb 0a                	jmp    3174c <exception>

00031742 <page_fault>:
   31742:	6a 0e                	push   $0xe
   31744:	eb 06                	jmp    3174c <exception>

00031746 <coprocessor_error>:
   31746:	6a ff                	push   $0xffffffff
   31748:	6a 10                	push   $0x10
   3174a:	eb 00                	jmp    3174c <exception>

0003174c <exception>:
   3174c:	e8 01 01 00 00       	call   31852 <exception_handler>
   31751:	83 c4 08             	add    $0x8,%esp
   31754:	f4                   	hlt    

00031755 <sys_entry>:
   31755:	e8 2f 00 00 00       	call   31789 <save>
   3175a:	fb                   	sti    
   3175b:	50                   	push   %eax
   3175c:	e8 d0 04 00 00       	call   31c31 <syscall_handler>
   31761:	83 c4 04             	add    $0x4,%esp
   31764:	89 46 2c             	mov    %eax,0x2c(%esi)
   31767:	fa                   	cli    
   31768:	c3                   	ret    

00031769 <restart_thread>:
   31769:	8b 25 00 90 03 00    	mov    0x39000,%esp
   3176f:	8d 44 24 48          	lea    0x48(%esp),%eax
   31773:	a3 64 4c 03 00       	mov    %eax,0x34c64

00031778 <re_entry>:
   31778:	ff 0d 40 4c 03 00    	decl   0x34c40
   3177e:	0f a9                	pop    %gs
   31780:	0f a1                	pop    %fs
   31782:	07                   	pop    %es
   31783:	1f                   	pop    %ds
   31784:	61                   	popa   
   31785:	83 c4 04             	add    $0x4,%esp
   31788:	cf                   	iret   

00031789 <save>:
   31789:	60                   	pusha  
   3178a:	1e                   	push   %ds
   3178b:	06                   	push   %es
   3178c:	0f a0                	push   %fs
   3178e:	0f a8                	push   %gs
   31790:	66 8c d2             	mov    %ss,%dx
   31793:	8e da                	mov    %edx,%ds
   31795:	8e c2                	mov    %edx,%es
   31797:	8e ea                	mov    %edx,%gs
   31799:	89 e6                	mov    %esp,%esi
   3179b:	ff 05 40 4c 03 00    	incl   0x34c40
   317a1:	83 3d 40 4c 03 00 00 	cmpl   $0x0,0x34c40
   317a8:	75 0d                	jne    317b7 <save.1>
   317aa:	bc 01 30 03 00       	mov    $0x33001,%esp
   317af:	68 69 17 03 00       	push   $0x31769
   317b4:	ff 66 30             	jmp    *0x30(%esi)

000317b7 <save.1>:
   317b7:	68 78 17 03 00       	push   $0x31778
   317bc:	ff 66 30             	jmp    *0x30(%esi)
   317bf:	90                   	nop

000317c0 <timer_interrupt>:
   317c0:	55                   	push   %ebp
   317c1:	89 e5                	mov    %esp,%ebp
   317c3:	83 ec 18             	sub    $0x18,%esp
   317c6:	e8 9c 04 00 00       	call   31c67 <ticks_inc>
   317cb:	a1 40 4c 03 00       	mov    0x34c40,%eax
   317d0:	85 c0                	test   %eax,%eax
   317d2:	74 0c                	je     317e0 <timer_interrupt+0x20>
   317d4:	c7 04 24 a0 1d 03 00 	movl   $0x31da0,(%esp)
   317db:	e8 0c 02 00 00       	call   319ec <printk>
   317e0:	c7 04 24 a2 1d 03 00 	movl   $0x31da2,(%esp)
   317e7:	e8 00 02 00 00       	call   319ec <printk>
   317ec:	e8 3e f1 ff ff       	call   3092f <current_thread_ticks>
   317f1:	89 c1                	mov    %eax,%ecx
   317f3:	ba 67 66 66 66       	mov    $0x66666667,%edx
   317f8:	89 c8                	mov    %ecx,%eax
   317fa:	f7 ea                	imul   %edx
   317fc:	d1 fa                	sar    %edx
   317fe:	89 c8                	mov    %ecx,%eax
   31800:	c1 f8 1f             	sar    $0x1f,%eax
   31803:	29 c2                	sub    %eax,%edx
   31805:	89 d0                	mov    %edx,%eax
   31807:	c1 e0 02             	shl    $0x2,%eax
   3180a:	01 d0                	add    %edx,%eax
   3180c:	89 ca                	mov    %ecx,%edx
   3180e:	29 c2                	sub    %eax,%edx
   31810:	83 fa 03             	cmp    $0x3,%edx
   31813:	7f 0c                	jg     31821 <timer_interrupt+0x61>
   31815:	e8 22 f1 ff ff       	call   3093c <current_thread_ticks_inc>
   3181a:	b8 01 00 00 00       	mov    $0x1,%eax
   3181f:	eb 14                	jmp    31835 <timer_interrupt+0x75>
   31821:	e8 16 f1 ff ff       	call   3093c <current_thread_ticks_inc>
   31826:	e8 24 f1 ff ff       	call   3094f <next_thread_to_run>
   3182b:	a3 00 90 03 00       	mov    %eax,0x39000
   31830:	b8 01 00 00 00       	mov    $0x1,%eax
   31835:	c9                   	leave  
   31836:	c3                   	ret    

00031837 <intr_handler>:
   31837:	55                   	push   %ebp
   31838:	89 e5                	mov    %esp,%ebp
   3183a:	83 ec 18             	sub    $0x18,%esp
   3183d:	8b 45 08             	mov    0x8(%ebp),%eax
   31840:	89 44 24 04          	mov    %eax,0x4(%esp)
   31844:	c7 04 24 a4 1d 03 00 	movl   $0x31da4,(%esp)
   3184b:	e8 9c 01 00 00       	call   319ec <printk>
   31850:	c9                   	leave  
   31851:	c3                   	ret    

00031852 <exception_handler>:
   31852:	55                   	push   %ebp
   31853:	89 e5                	mov    %esp,%ebp
   31855:	57                   	push   %edi
   31856:	56                   	push   %esi
   31857:	53                   	push   %ebx
   31858:	83 ec 7c             	sub    $0x7c,%esp
   3185b:	8d 55 94             	lea    -0x6c(%ebp),%edx
   3185e:	bb 60 1e 03 00       	mov    $0x31e60,%ebx
   31863:	b8 14 00 00 00       	mov    $0x14,%eax
   31868:	89 d7                	mov    %edx,%edi
   3186a:	89 de                	mov    %ebx,%esi
   3186c:	89 c1                	mov    %eax,%ecx
   3186e:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
   31870:	c7 05 0c 30 03 00 00 	movl   $0x0,0x3300c
   31877:	00 00 00 
   3187a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
   31881:	eb 10                	jmp    31893 <exception_handler+0x41>
   31883:	c7 04 24 ba 1d 03 00 	movl   $0x31dba,(%esp)
   3188a:	e8 5d 01 00 00       	call   319ec <printk>
   3188f:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
   31893:	81 7d e4 8f 01 00 00 	cmpl   $0x18f,-0x1c(%ebp)
   3189a:	7e e7                	jle    31883 <exception_handler+0x31>
   3189c:	c7 05 0c 30 03 00 00 	movl   $0x0,0x3300c
   318a3:	00 00 00 
   318a6:	8b 45 08             	mov    0x8(%ebp),%eax
   318a9:	8b 44 85 94          	mov    -0x6c(%ebp,%eax,4),%eax
   318ad:	89 44 24 04          	mov    %eax,0x4(%esp)
   318b1:	c7 04 24 bc 1d 03 00 	movl   $0x31dbc,(%esp)
   318b8:	e8 2f 01 00 00       	call   319ec <printk>
   318bd:	8b 45 18             	mov    0x18(%ebp),%eax
   318c0:	89 44 24 0c          	mov    %eax,0xc(%esp)
   318c4:	8b 45 14             	mov    0x14(%ebp),%eax
   318c7:	89 44 24 08          	mov    %eax,0x8(%esp)
   318cb:	8b 45 10             	mov    0x10(%ebp),%eax
   318ce:	89 44 24 04          	mov    %eax,0x4(%esp)
   318d2:	c7 04 24 cb 1d 03 00 	movl   $0x31dcb,(%esp)
   318d9:	e8 0e 01 00 00       	call   319ec <printk>
   318de:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
   318e2:	74 13                	je     318f7 <exception_handler+0xa5>
   318e4:	8b 45 0c             	mov    0xc(%ebp),%eax
   318e7:	89 44 24 04          	mov    %eax,0x4(%esp)
   318eb:	c7 04 24 e7 1d 03 00 	movl   $0x31de7,(%esp)
   318f2:	e8 f5 00 00 00       	call   319ec <printk>
   318f7:	83 c4 7c             	add    $0x7c,%esp
   318fa:	5b                   	pop    %ebx
   318fb:	5e                   	pop    %esi
   318fc:	5f                   	pop    %edi
   318fd:	5d                   	pop    %ebp
   318fe:	c3                   	ret    

000318ff <set_irq_handler>:
   318ff:	55                   	push   %ebp
   31900:	89 e5                	mov    %esp,%ebp
   31902:	83 ec 18             	sub    $0x18,%esp
   31905:	8b 45 08             	mov    0x8(%ebp),%eax
   31908:	8b 55 0c             	mov    0xc(%ebp),%edx
   3190b:	89 14 85 e0 4c 03 00 	mov    %edx,0x34ce0(,%eax,4)
   31912:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
   31919:	e8 48 00 00 00       	call   31966 <enable_irq>
   3191e:	b8 01 00 00 00       	mov    $0x1,%eax
   31923:	c9                   	leave  
   31924:	c3                   	ret    

00031925 <disable_irq>:
   31925:	55                   	push   %ebp
   31926:	89 e5                	mov    %esp,%ebp
   31928:	83 ec 28             	sub    $0x28,%esp
   3192b:	c6 45 f7 ff          	movb   $0xff,-0x9(%ebp)
   3192f:	83 7d 08 07          	cmpl   $0x7,0x8(%ebp)
   31933:	7f 16                	jg     3194b <disable_irq+0x26>
   31935:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
   31939:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
   31940:	00 
   31941:	89 04 24             	mov    %eax,(%esp)
   31944:	e8 81 f2 ff ff       	call   30bca <outb_pic>
   31949:	eb 14                	jmp    3195f <disable_irq+0x3a>
   3194b:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
   3194f:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
   31956:	00 
   31957:	89 04 24             	mov    %eax,(%esp)
   3195a:	e8 6b f2 ff ff       	call   30bca <outb_pic>
   3195f:	b8 01 00 00 00       	mov    $0x1,%eax
   31964:	c9                   	leave  
   31965:	c3                   	ret    

00031966 <enable_irq>:
   31966:	55                   	push   %ebp
   31967:	89 e5                	mov    %esp,%ebp
   31969:	53                   	push   %ebx
   3196a:	83 ec 24             	sub    $0x24,%esp
   3196d:	8b 45 08             	mov    0x8(%ebp),%eax
   31970:	89 c2                	mov    %eax,%edx
   31972:	c1 fa 1f             	sar    $0x1f,%edx
   31975:	c1 ea 1d             	shr    $0x1d,%edx
   31978:	01 d0                	add    %edx,%eax
   3197a:	83 e0 07             	and    $0x7,%eax
   3197d:	29 d0                	sub    %edx,%eax
   3197f:	ba 01 00 00 00       	mov    $0x1,%edx
   31984:	89 d3                	mov    %edx,%ebx
   31986:	89 c1                	mov    %eax,%ecx
   31988:	d3 e3                	shl    %cl,%ebx
   3198a:	89 d8                	mov    %ebx,%eax
   3198c:	f7 d0                	not    %eax
   3198e:	88 45 f7             	mov    %al,-0x9(%ebp)
   31991:	83 7d 08 07          	cmpl   $0x7,0x8(%ebp)
   31995:	7f 16                	jg     319ad <enable_irq+0x47>
   31997:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
   3199b:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
   319a2:	00 
   319a3:	89 04 24             	mov    %eax,(%esp)
   319a6:	e8 1f f2 ff ff       	call   30bca <outb_pic>
   319ab:	eb 14                	jmp    319c1 <enable_irq+0x5b>
   319ad:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
   319b1:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
   319b8:	00 
   319b9:	89 04 24             	mov    %eax,(%esp)
   319bc:	e8 09 f2 ff ff       	call   30bca <outb_pic>
   319c1:	b8 01 00 00 00       	mov    $0x1,%eax
   319c6:	83 c4 24             	add    $0x24,%esp
   319c9:	5b                   	pop    %ebx
   319ca:	5d                   	pop    %ebp
   319cb:	c3                   	ret    

000319cc <print>:
   319cc:	55                   	push   %ebp
   319cd:	89 e5                	mov    %esp,%ebp
   319cf:	83 ec 18             	sub    $0x18,%esp
   319d2:	c7 04 24 39 1f 03 00 	movl   $0x31f39,(%esp)
   319d9:	e8 0e 00 00 00       	call   319ec <printk>
   319de:	c7 04 24 57 1f 03 00 	movl   $0x31f57,(%esp)
   319e5:	e8 02 00 00 00       	call   319ec <printk>
   319ea:	c9                   	leave  
   319eb:	c3                   	ret    

000319ec <printk>:
   319ec:	55                   	push   %ebp
   319ed:	89 e5                	mov    %esp,%ebp
   319ef:	81 ec 28 04 00 00    	sub    $0x428,%esp
   319f5:	8d 55 0c             	lea    0xc(%ebp),%edx
   319f8:	8d 85 f0 fb ff ff    	lea    -0x410(%ebp),%eax
   319fe:	89 10                	mov    %edx,(%eax)
   31a00:	8b 85 f0 fb ff ff    	mov    -0x410(%ebp),%eax
   31a06:	89 44 24 08          	mov    %eax,0x8(%esp)
   31a0a:	8b 45 08             	mov    0x8(%ebp),%eax
   31a0d:	89 44 24 04          	mov    %eax,0x4(%esp)
   31a11:	8d 85 f4 fb ff ff    	lea    -0x40c(%ebp),%eax
   31a17:	89 04 24             	mov    %eax,(%esp)
   31a1a:	e8 2c 00 00 00       	call   31a4b <__vprintf__>
   31a1f:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31a22:	a1 0c 30 03 00       	mov    0x3300c,%eax
   31a27:	3d 9f 0f 00 00       	cmp    $0xf9f,%eax
   31a2c:	7e 0a                	jle    31a38 <printk+0x4c>
   31a2e:	c7 05 0c 30 03 00 00 	movl   $0x0,0x3300c
   31a35:	00 00 00 
   31a38:	8d 85 f4 fb ff ff    	lea    -0x40c(%ebp),%eax
   31a3e:	89 04 24             	mov    %eax,(%esp)
   31a41:	e8 0a f0 ff ff       	call   30a50 <disp_str>
   31a46:	8b 45 f4             	mov    -0xc(%ebp),%eax
   31a49:	c9                   	leave  
   31a4a:	c3                   	ret    

00031a4b <__vprintf__>:
   31a4b:	55                   	push   %ebp
   31a4c:	89 e5                	mov    %esp,%ebp
   31a4e:	83 ec 30             	sub    $0x30,%esp
   31a51:	8b 45 0c             	mov    0xc(%ebp),%eax
   31a54:	89 45 fc             	mov    %eax,-0x4(%ebp)
   31a57:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
   31a5e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   31a65:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
   31a6c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
   31a73:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
   31a7a:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
   31a81:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
   31a88:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
   31a8e:	e9 72 01 00 00       	jmp    31c05 <__vprintf__+0x1ba>
   31a93:	8b 45 fc             	mov    -0x4(%ebp),%eax
   31a96:	0f b6 00             	movzbl (%eax),%eax
   31a99:	3c 25                	cmp    $0x25,%al
   31a9b:	0f 85 4e 01 00 00    	jne    31bef <__vprintf__+0x1a4>
   31aa1:	8b 45 fc             	mov    -0x4(%ebp),%eax
   31aa4:	83 c0 01             	add    $0x1,%eax
   31aa7:	0f b6 00             	movzbl (%eax),%eax
   31aaa:	0f be c0             	movsbl %al,%eax
   31aad:	83 f8 64             	cmp    $0x64,%eax
   31ab0:	74 3e                	je     31af0 <__vprintf__+0xa5>
   31ab2:	83 f8 73             	cmp    $0x73,%eax
   31ab5:	0f 84 fa 00 00 00    	je     31bb5 <__vprintf__+0x16a>
   31abb:	83 f8 63             	cmp    $0x63,%eax
   31abe:	0f 85 39 01 00 00    	jne    31bfd <__vprintf__+0x1b2>
   31ac4:	8b 45 10             	mov    0x10(%ebp),%eax
   31ac7:	8d 50 04             	lea    0x4(%eax),%edx
   31aca:	89 55 10             	mov    %edx,0x10(%ebp)
   31acd:	8b 00                	mov    (%eax),%eax
   31acf:	89 45 f0             	mov    %eax,-0x10(%ebp)
   31ad2:	8b 45 f8             	mov    -0x8(%ebp),%eax
   31ad5:	03 45 08             	add    0x8(%ebp),%eax
   31ad8:	8b 55 f0             	mov    -0x10(%ebp),%edx
   31adb:	8b 14 95 20 30 03 00 	mov    0x33020(,%edx,4),%edx
   31ae2:	0f b6 12             	movzbl (%edx),%edx
   31ae5:	88 10                	mov    %dl,(%eax)
   31ae7:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   31aeb:	e9 0d 01 00 00       	jmp    31bfd <__vprintf__+0x1b2>
   31af0:	8b 45 10             	mov    0x10(%ebp),%eax
   31af3:	8d 50 04             	lea    0x4(%eax),%edx
   31af6:	89 55 10             	mov    %edx,0x10(%ebp)
   31af9:	8b 00                	mov    (%eax),%eax
   31afb:	89 45 f0             	mov    %eax,-0x10(%ebp)
   31afe:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
   31b05:	8b 4d f0             	mov    -0x10(%ebp),%ecx
   31b08:	ba 67 66 66 66       	mov    $0x66666667,%edx
   31b0d:	89 c8                	mov    %ecx,%eax
   31b0f:	f7 ea                	imul   %edx
   31b11:	c1 fa 02             	sar    $0x2,%edx
   31b14:	89 c8                	mov    %ecx,%eax
   31b16:	c1 f8 1f             	sar    $0x1f,%eax
   31b19:	29 c2                	sub    %eax,%edx
   31b1b:	89 d0                	mov    %edx,%eax
   31b1d:	c1 e0 02             	shl    $0x2,%eax
   31b20:	01 d0                	add    %edx,%eax
   31b22:	01 c0                	add    %eax,%eax
   31b24:	89 ca                	mov    %ecx,%edx
   31b26:	29 c2                	sub    %eax,%edx
   31b28:	8d 42 30             	lea    0x30(%edx),%eax
   31b2b:	8b 04 85 20 30 03 00 	mov    0x33020(,%eax,4),%eax
   31b32:	0f b6 10             	movzbl (%eax),%edx
   31b35:	8d 45 de             	lea    -0x22(%ebp),%eax
   31b38:	03 45 ec             	add    -0x14(%ebp),%eax
   31b3b:	88 10                	mov    %dl,(%eax)
   31b3d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
   31b41:	8b 4d f0             	mov    -0x10(%ebp),%ecx
   31b44:	ba 67 66 66 66       	mov    $0x66666667,%edx
   31b49:	89 c8                	mov    %ecx,%eax
   31b4b:	f7 ea                	imul   %edx
   31b4d:	c1 fa 02             	sar    $0x2,%edx
   31b50:	89 c8                	mov    %ecx,%eax
   31b52:	c1 f8 1f             	sar    $0x1f,%eax
   31b55:	89 d1                	mov    %edx,%ecx
   31b57:	29 c1                	sub    %eax,%ecx
   31b59:	89 c8                	mov    %ecx,%eax
   31b5b:	89 45 f0             	mov    %eax,-0x10(%ebp)
   31b5e:	8b 4d f0             	mov    -0x10(%ebp),%ecx
   31b61:	ba 67 66 66 66       	mov    $0x66666667,%edx
   31b66:	89 c8                	mov    %ecx,%eax
   31b68:	f7 ea                	imul   %edx
   31b6a:	c1 fa 02             	sar    $0x2,%edx
   31b6d:	89 c8                	mov    %ecx,%eax
   31b6f:	c1 f8 1f             	sar    $0x1f,%eax
   31b72:	29 c2                	sub    %eax,%edx
   31b74:	89 d0                	mov    %edx,%eax
   31b76:	c1 e0 02             	shl    $0x2,%eax
   31b79:	01 d0                	add    %edx,%eax
   31b7b:	01 c0                	add    %eax,%eax
   31b7d:	89 ca                	mov    %ecx,%edx
   31b7f:	29 c2                	sub    %eax,%edx
   31b81:	85 d2                	test   %edx,%edx
   31b83:	75 80                	jne    31b05 <__vprintf__+0xba>
   31b85:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
   31b89:	eb 19                	jmp    31ba4 <__vprintf__+0x159>
   31b8b:	8b 45 f8             	mov    -0x8(%ebp),%eax
   31b8e:	03 45 08             	add    0x8(%ebp),%eax
   31b91:	8d 55 de             	lea    -0x22(%ebp),%edx
   31b94:	03 55 ec             	add    -0x14(%ebp),%edx
   31b97:	0f b6 12             	movzbl (%edx),%edx
   31b9a:	88 10                	mov    %dl,(%eax)
   31b9c:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
   31ba0:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
   31ba4:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
   31ba8:	79 e1                	jns    31b8b <__vprintf__+0x140>
   31baa:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
   31bae:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   31bb2:	90                   	nop
   31bb3:	eb 48                	jmp    31bfd <__vprintf__+0x1b2>
   31bb5:	8b 45 10             	mov    0x10(%ebp),%eax
   31bb8:	8d 50 04             	lea    0x4(%eax),%edx
   31bbb:	89 55 10             	mov    %edx,0x10(%ebp)
   31bbe:	8b 00                	mov    (%eax),%eax
   31bc0:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31bc3:	eb 16                	jmp    31bdb <__vprintf__+0x190>
   31bc5:	8b 45 f8             	mov    -0x8(%ebp),%eax
   31bc8:	03 45 08             	add    0x8(%ebp),%eax
   31bcb:	8b 55 f4             	mov    -0xc(%ebp),%edx
   31bce:	0f b6 12             	movzbl (%edx),%edx
   31bd1:	88 10                	mov    %dl,(%eax)
   31bd3:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
   31bd7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   31bdb:	8b 45 f4             	mov    -0xc(%ebp),%eax
   31bde:	0f b6 00             	movzbl (%eax),%eax
   31be1:	84 c0                	test   %al,%al
   31be3:	75 e0                	jne    31bc5 <__vprintf__+0x17a>
   31be5:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
   31be9:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   31bed:	eb 0e                	jmp    31bfd <__vprintf__+0x1b2>
   31bef:	8b 45 f8             	mov    -0x8(%ebp),%eax
   31bf2:	03 45 08             	add    0x8(%ebp),%eax
   31bf5:	8b 55 fc             	mov    -0x4(%ebp),%edx
   31bf8:	0f b6 12             	movzbl (%edx),%edx
   31bfb:	88 10                	mov    %dl,(%eax)
   31bfd:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
   31c01:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   31c05:	8b 45 fc             	mov    -0x4(%ebp),%eax
   31c08:	0f b6 00             	movzbl (%eax),%eax
   31c0b:	84 c0                	test   %al,%al
   31c0d:	0f 85 80 fe ff ff    	jne    31a93 <__vprintf__+0x48>
   31c13:	8b 45 f8             	mov    -0x8(%ebp),%eax
   31c16:	03 45 08             	add    0x8(%ebp),%eax
   31c19:	c6 00 00             	movb   $0x0,(%eax)
   31c1c:	b8 01 00 00 00       	mov    $0x1,%eax
   31c21:	c9                   	leave  
   31c22:	c3                   	ret    
   31c23:	90                   	nop

00031c24 <sys_get_ticks>:
   31c24:	55                   	push   %ebp
   31c25:	89 e5                	mov    %esp,%ebp
   31c27:	83 ec 08             	sub    $0x8,%esp
   31c2a:	e8 4a 00 00 00       	call   31c79 <get_ticks>
   31c2f:	c9                   	leave  
   31c30:	c3                   	ret    

00031c31 <syscall_handler>:
   31c31:	55                   	push   %ebp
   31c32:	89 e5                	mov    %esp,%ebp
   31c34:	83 ec 08             	sub    $0x8,%esp
   31c37:	8b 45 08             	mov    0x8(%ebp),%eax
   31c3a:	85 c0                	test   %eax,%eax
   31c3c:	75 07                	jne    31c45 <syscall_handler+0x14>
   31c3e:	e8 e1 ff ff ff       	call   31c24 <sys_get_ticks>
   31c43:	eb 01                	jmp    31c46 <syscall_handler+0x15>
   31c45:	90                   	nop
   31c46:	c9                   	leave  
   31c47:	c3                   	ret    
   31c48:	90                   	nop
   31c49:	90                   	nop
   31c4a:	90                   	nop
   31c4b:	90                   	nop
   31c4c:	90                   	nop
   31c4d:	90                   	nop
   31c4e:	90                   	nop
   31c4f:	90                   	nop

00031c50 <system_call>:
   31c50:	8b 44 24 04          	mov    0x4(%esp),%eax
   31c54:	cd 80                	int    $0x80
   31c56:	c3                   	ret    
   31c57:	90                   	nop

00031c58 <init_timer>:
   31c58:	55                   	push   %ebp
   31c59:	89 e5                	mov    %esp,%ebp
   31c5b:	c7 05 c8 4c 03 00 00 	movl   $0x0,0x34cc8
   31c62:	00 00 00 
   31c65:	5d                   	pop    %ebp
   31c66:	c3                   	ret    

00031c67 <ticks_inc>:
   31c67:	55                   	push   %ebp
   31c68:	89 e5                	mov    %esp,%ebp
   31c6a:	a1 c8 4c 03 00       	mov    0x34cc8,%eax
   31c6f:	83 c0 01             	add    $0x1,%eax
   31c72:	a3 c8 4c 03 00       	mov    %eax,0x34cc8
   31c77:	5d                   	pop    %ebp
   31c78:	c3                   	ret    

00031c79 <get_ticks>:
   31c79:	55                   	push   %ebp
   31c7a:	89 e5                	mov    %esp,%ebp
   31c7c:	a1 c8 4c 03 00       	mov    0x34cc8,%eax
   31c81:	5d                   	pop    %ebp
   31c82:	c3                   	ret    
