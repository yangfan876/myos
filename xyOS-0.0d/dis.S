
kernel.bin:     file format elf32-i386


Disassembly of section .text:

00030400 <_start>:
   30400:	bc 01 30 03 00       	mov    $0x33001,%esp
   30405:	0f 01 05 06 b0 03 00 	sgdtl  0x3b006
   3040c:	e8 0b 00 00 00       	call   3041c <__init__>
   30411:	fb                   	sti    
   30412:	e8 22 14 00 00       	call   31839 <restart_thread>
   30417:	eb fe                	jmp    30417 <_start+0x17>
   30419:	90                   	nop
   3041a:	90                   	nop
   3041b:	90                   	nop

0003041c <__init__>:
   3041c:	55                   	push   %ebp
   3041d:	89 e5                	mov    %esp,%ebp
   3041f:	83 ec 28             	sub    $0x28,%esp
   30422:	e8 85 08 00 00       	call   30cac <change_gdt>
   30427:	c7 05 14 30 03 00 00 	movl   $0x0,0x33014
   3042e:	00 00 00 
   30431:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   30438:	eb 10                	jmp    3044a <__init__+0x2e>
   3043a:	c7 04 24 e0 1e 03 00 	movl   $0x31ee0,(%esp)
   30441:	e8 c6 16 00 00       	call   31b0c <printk>
   30446:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   3044a:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
   30451:	7e e7                	jle    3043a <__init__+0x1e>
   30453:	c7 05 14 30 03 00 00 	movl   $0x0,0x33014
   3045a:	00 00 00 
   3045d:	c7 04 24 e2 1e 03 00 	movl   $0x31ee2,(%esp)
   30464:	e8 a3 16 00 00       	call   31b0c <printk>
   30469:	e8 ee 06 00 00       	call   30b5c <init_8259A>
   3046e:	c7 44 24 04 ff 00 00 	movl   $0xff,0x4(%esp)
   30475:	00 
   30476:	c7 04 24 ff 00 00 00 	movl   $0xff,(%esp)
   3047d:	e8 cb 07 00 00       	call   30c4d <op_8259A>
   30482:	c7 04 24 fc 1e 03 00 	movl   $0x31efc,(%esp)
   30489:	e8 7e 16 00 00       	call   31b0c <printk>
   3048e:	e8 a9 09 00 00       	call   30e3c <init_idt>
   30493:	c7 04 24 15 1f 03 00 	movl   $0x31f15,(%esp)
   3049a:	e8 6d 16 00 00       	call   31b0c <printk>
   3049f:	c7 04 24 2c 1f 03 00 	movl   $0x31f2c,(%esp)
   304a6:	e8 61 16 00 00       	call   31b0c <printk>
   304ab:	e8 54 19 00 00       	call   31e04 <init_keybord>
   304b0:	e8 c3 18 00 00       	call   31d78 <init_timer>
   304b5:	e8 4c 02 00 00       	call   30706 <init_task_tty>
   304ba:	c7 44 24 04 ff 00 00 	movl   $0xff,0x4(%esp)
   304c1:	00 
   304c2:	c7 04 24 fc 00 00 00 	movl   $0xfc,(%esp)
   304c9:	e8 7f 07 00 00       	call   30c4d <op_8259A>
   304ce:	c7 04 24 44 1f 03 00 	movl   $0x31f44,(%esp)
   304d5:	e8 32 16 00 00       	call   31b0c <printk>
   304da:	e8 99 02 00 00       	call   30778 <init_first_thread>
   304df:	c7 04 24 60 1f 03 00 	movl   $0x31f60,(%esp)
   304e6:	e8 21 16 00 00       	call   31b0c <printk>
   304eb:	c7 04 24 80 1f 03 00 	movl   $0x31f80,(%esp)
   304f2:	e8 15 16 00 00       	call   31b0c <printk>
   304f7:	c7 04 24 a0 1f 03 00 	movl   $0x31fa0,(%esp)
   304fe:	e8 09 16 00 00       	call   31b0c <printk>
   30503:	e8 eb 05 00 00       	call   30af3 <run_first_thread>
   30508:	c9                   	leave  
   30509:	c3                   	ret    
   3050a:	90                   	nop
   3050b:	90                   	nop

0003050c <strncpy>:
   3050c:	55                   	push   %ebp
   3050d:	89 e5                	mov    %esp,%ebp
   3050f:	83 ec 10             	sub    $0x10,%esp
   30512:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
   30519:	eb 19                	jmp    30534 <strncpy+0x28>
   3051b:	8b 45 fc             	mov    -0x4(%ebp),%eax
   3051e:	8b 55 08             	mov    0x8(%ebp),%edx
   30521:	01 c2                	add    %eax,%edx
   30523:	8b 45 fc             	mov    -0x4(%ebp),%eax
   30526:	8b 4d 0c             	mov    0xc(%ebp),%ecx
   30529:	01 c8                	add    %ecx,%eax
   3052b:	0f b6 00             	movzbl (%eax),%eax
   3052e:	88 02                	mov    %al,(%edx)
   30530:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   30534:	8b 45 fc             	mov    -0x4(%ebp),%eax
   30537:	3b 45 10             	cmp    0x10(%ebp),%eax
   3053a:	73 20                	jae    3055c <strncpy+0x50>
   3053c:	8b 45 fc             	mov    -0x4(%ebp),%eax
   3053f:	8b 55 0c             	mov    0xc(%ebp),%edx
   30542:	01 d0                	add    %edx,%eax
   30544:	0f b6 00             	movzbl (%eax),%eax
   30547:	84 c0                	test   %al,%al
   30549:	75 d0                	jne    3051b <strncpy+0xf>
   3054b:	eb 0f                	jmp    3055c <strncpy+0x50>
   3054d:	8b 45 fc             	mov    -0x4(%ebp),%eax
   30550:	8b 55 08             	mov    0x8(%ebp),%edx
   30553:	01 d0                	add    %edx,%eax
   30555:	c6 00 00             	movb   $0x0,(%eax)
   30558:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   3055c:	8b 45 fc             	mov    -0x4(%ebp),%eax
   3055f:	3b 45 10             	cmp    0x10(%ebp),%eax
   30562:	72 e9                	jb     3054d <strncpy+0x41>
   30564:	b8 01 00 00 00       	mov    $0x1,%eax
   30569:	c9                   	leave  
   3056a:	c3                   	ret    

0003056b <wait>:
   3056b:	55                   	push   %ebp
   3056c:	89 e5                	mov    %esp,%ebp
   3056e:	83 ec 10             	sub    $0x10,%esp
   30571:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
   30578:	eb 04                	jmp    3057e <wait+0x13>
   3057a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   3057e:	8b 45 08             	mov    0x8(%ebp),%eax
   30581:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
   30587:	3b 45 fc             	cmp    -0x4(%ebp),%eax
   3058a:	7f ee                	jg     3057a <wait+0xf>
   3058c:	c9                   	leave  
   3058d:	c3                   	ret    

0003058e <testA>:
   3058e:	55                   	push   %ebp
   3058f:	89 e5                	mov    %esp,%ebp
   30591:	83 ec 04             	sub    $0x4,%esp
   30594:	c7 04 24 e8 03 00 00 	movl   $0x3e8,(%esp)
   3059b:	e8 cb ff ff ff       	call   3056b <wait>
   305a0:	eb f2                	jmp    30594 <testA+0x6>

000305a2 <testB>:
   305a2:	55                   	push   %ebp
   305a3:	89 e5                	mov    %esp,%ebp
   305a5:	83 ec 18             	sub    $0x18,%esp
   305a8:	c7 04 24 bf 1f 03 00 	movl   $0x31fbf,(%esp)
   305af:	e8 58 15 00 00       	call   31b0c <printk>
   305b4:	c7 04 24 e8 03 00 00 	movl   $0x3e8,(%esp)
   305bb:	e8 ab ff ff ff       	call   3056b <wait>
   305c0:	eb e6                	jmp    305a8 <testB+0x6>

000305c2 <testC>:
   305c2:	55                   	push   %ebp
   305c3:	89 e5                	mov    %esp,%ebp
   305c5:	83 ec 18             	sub    $0x18,%esp
   305c8:	c7 04 24 c1 1f 03 00 	movl   $0x31fc1,(%esp)
   305cf:	e8 38 15 00 00       	call   31b0c <printk>
   305d4:	c7 04 24 e8 03 00 00 	movl   $0x3e8,(%esp)
   305db:	e8 8b ff ff ff       	call   3056b <wait>
   305e0:	eb e6                	jmp    305c8 <testC+0x6>

000305e2 <task_tty>:
   305e2:	55                   	push   %ebp
   305e3:	89 e5                	mov    %esp,%ebp
   305e5:	83 ec 08             	sub    $0x8,%esp
   305e8:	e8 51 18 00 00       	call   31e3e <keyboard_read>
   305ed:	eb f9                	jmp    305e8 <task_tty+0x6>

000305ef <list_init>:
   305ef:	55                   	push   %ebp
   305f0:	89 e5                	mov    %esp,%ebp
   305f2:	8b 45 08             	mov    0x8(%ebp),%eax
   305f5:	8d 50 08             	lea    0x8(%eax),%edx
   305f8:	8b 45 08             	mov    0x8(%ebp),%eax
   305fb:	89 50 04             	mov    %edx,0x4(%eax)
   305fe:	8b 45 08             	mov    0x8(%ebp),%eax
   30601:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
   30607:	8b 55 08             	mov    0x8(%ebp),%edx
   3060a:	8b 45 08             	mov    0x8(%ebp),%eax
   3060d:	89 50 08             	mov    %edx,0x8(%eax)
   30610:	8b 45 08             	mov    0x8(%ebp),%eax
   30613:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
   3061a:	b8 01 00 00 00       	mov    $0x1,%eax
   3061f:	5d                   	pop    %ebp
   30620:	c3                   	ret    

00030621 <list_empty>:
   30621:	55                   	push   %ebp
   30622:	89 e5                	mov    %esp,%ebp
   30624:	8b 45 08             	mov    0x8(%ebp),%eax
   30627:	8b 40 04             	mov    0x4(%eax),%eax
   3062a:	8b 55 08             	mov    0x8(%ebp),%edx
   3062d:	83 c2 08             	add    $0x8,%edx
   30630:	39 d0                	cmp    %edx,%eax
   30632:	75 14                	jne    30648 <list_empty+0x27>
   30634:	8b 45 08             	mov    0x8(%ebp),%eax
   30637:	8b 50 08             	mov    0x8(%eax),%edx
   3063a:	8b 45 08             	mov    0x8(%ebp),%eax
   3063d:	39 c2                	cmp    %eax,%edx
   3063f:	75 07                	jne    30648 <list_empty+0x27>
   30641:	b8 01 00 00 00       	mov    $0x1,%eax
   30646:	eb 05                	jmp    3064d <list_empty+0x2c>
   30648:	b8 00 00 00 00       	mov    $0x0,%eax
   3064d:	5d                   	pop    %ebp
   3064e:	c3                   	ret    

0003064f <list_insert_next>:
   3064f:	55                   	push   %ebp
   30650:	89 e5                	mov    %esp,%ebp
   30652:	8b 45 08             	mov    0x8(%ebp),%eax
   30655:	8b 50 04             	mov    0x4(%eax),%edx
   30658:	8b 45 0c             	mov    0xc(%ebp),%eax
   3065b:	89 50 04             	mov    %edx,0x4(%eax)
   3065e:	8b 45 0c             	mov    0xc(%ebp),%eax
   30661:	8b 55 08             	mov    0x8(%ebp),%edx
   30664:	89 10                	mov    %edx,(%eax)
   30666:	8b 45 08             	mov    0x8(%ebp),%eax
   30669:	8b 40 04             	mov    0x4(%eax),%eax
   3066c:	8b 55 0c             	mov    0xc(%ebp),%edx
   3066f:	89 10                	mov    %edx,(%eax)
   30671:	8b 45 08             	mov    0x8(%ebp),%eax
   30674:	8b 55 0c             	mov    0xc(%ebp),%edx
   30677:	89 50 04             	mov    %edx,0x4(%eax)
   3067a:	b8 01 00 00 00       	mov    $0x1,%eax
   3067f:	5d                   	pop    %ebp
   30680:	c3                   	ret    

00030681 <list_insert_prev>:
   30681:	55                   	push   %ebp
   30682:	89 e5                	mov    %esp,%ebp
   30684:	8b 45 08             	mov    0x8(%ebp),%eax
   30687:	8b 55 0c             	mov    0xc(%ebp),%edx
   3068a:	89 50 04             	mov    %edx,0x4(%eax)
   3068d:	8b 45 0c             	mov    0xc(%ebp),%eax
   30690:	8b 10                	mov    (%eax),%edx
   30692:	8b 45 08             	mov    0x8(%ebp),%eax
   30695:	89 10                	mov    %edx,(%eax)
   30697:	8b 45 0c             	mov    0xc(%ebp),%eax
   3069a:	8b 00                	mov    (%eax),%eax
   3069c:	8b 55 08             	mov    0x8(%ebp),%edx
   3069f:	89 50 04             	mov    %edx,0x4(%eax)
   306a2:	8b 45 0c             	mov    0xc(%ebp),%eax
   306a5:	8b 55 08             	mov    0x8(%ebp),%edx
   306a8:	89 10                	mov    %edx,(%eax)
   306aa:	b8 01 00 00 00       	mov    $0x1,%eax
   306af:	5d                   	pop    %ebp
   306b0:	c3                   	ret    

000306b1 <list_insert_back>:
   306b1:	55                   	push   %ebp
   306b2:	89 e5                	mov    %esp,%ebp
   306b4:	83 ec 08             	sub    $0x8,%esp
   306b7:	8b 45 0c             	mov    0xc(%ebp),%eax
   306ba:	83 c0 08             	add    $0x8,%eax
   306bd:	89 44 24 04          	mov    %eax,0x4(%esp)
   306c1:	8b 45 08             	mov    0x8(%ebp),%eax
   306c4:	89 04 24             	mov    %eax,(%esp)
   306c7:	e8 b5 ff ff ff       	call   30681 <list_insert_prev>
   306cc:	c9                   	leave  
   306cd:	c3                   	ret    

000306ce <list_remove>:
   306ce:	55                   	push   %ebp
   306cf:	89 e5                	mov    %esp,%ebp
   306d1:	8b 45 08             	mov    0x8(%ebp),%eax
   306d4:	8b 00                	mov    (%eax),%eax
   306d6:	8b 55 08             	mov    0x8(%ebp),%edx
   306d9:	8b 52 04             	mov    0x4(%edx),%edx
   306dc:	89 50 04             	mov    %edx,0x4(%eax)
   306df:	8b 45 08             	mov    0x8(%ebp),%eax
   306e2:	8b 40 04             	mov    0x4(%eax),%eax
   306e5:	8b 55 08             	mov    0x8(%ebp),%edx
   306e8:	8b 12                	mov    (%edx),%edx
   306ea:	89 10                	mov    %edx,(%eax)
   306ec:	8b 45 08             	mov    0x8(%ebp),%eax
   306ef:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
   306f6:	8b 45 08             	mov    0x8(%ebp),%eax
   306f9:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
   306ff:	b8 01 00 00 00       	mov    $0x1,%eax
   30704:	5d                   	pop    %ebp
   30705:	c3                   	ret    

00030706 <init_task_tty>:
   30706:	55                   	push   %ebp
   30707:	89 e5                	mov    %esp,%ebp
   30709:	83 ec 28             	sub    $0x28,%esp
   3070c:	c7 04 24 04 40 03 00 	movl   $0x34004,(%esp)
   30713:	e8 d7 fe ff ff       	call   305ef <list_init>
   30718:	c7 04 24 14 40 03 00 	movl   $0x34014,(%esp)
   3071f:	e8 cb fe ff ff       	call   305ef <list_init>
   30724:	c7 44 24 0c e2 05 03 	movl   $0x305e2,0xc(%esp)
   3072b:	00 
   3072c:	c7 44 24 08 c3 1f 03 	movl   $0x31fc3,0x8(%esp)
   30733:	00 
   30734:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
   3073b:	00 
   3073c:	c7 04 24 00 a0 03 00 	movl   $0x3a000,(%esp)
   30743:	e8 eb 01 00 00       	call   30933 <init_thread>
   30748:	89 45 f4             	mov    %eax,-0xc(%ebp)
   3074b:	c7 44 24 04 14 40 03 	movl   $0x34014,0x4(%esp)
   30752:	00 
   30753:	c7 04 24 6c a0 03 00 	movl   $0x3a06c,(%esp)
   3075a:	e8 01 03 00 00       	call   30a60 <list_insert_by_pri>
   3075f:	c7 44 24 04 04 40 03 	movl   $0x34004,0x4(%esp)
   30766:	00 
   30767:	c7 04 24 74 a0 03 00 	movl   $0x3a074,(%esp)
   3076e:	e8 3e ff ff ff       	call   306b1 <list_insert_back>
   30773:	8b 45 f4             	mov    -0xc(%ebp),%eax
   30776:	c9                   	leave  
   30777:	c3                   	ret    

00030778 <init_first_thread>:
   30778:	55                   	push   %ebp
   30779:	89 e5                	mov    %esp,%ebp
   3077b:	83 ec 28             	sub    $0x28,%esp
   3077e:	c7 44 24 0c 8e 05 03 	movl   $0x3058e,0xc(%esp)
   30785:	00 
   30786:	c7 44 24 08 cc 1f 03 	movl   $0x31fcc,0x8(%esp)
   3078d:	00 
   3078e:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
   30795:	00 
   30796:	c7 04 24 00 70 03 00 	movl   $0x37000,(%esp)
   3079d:	e8 91 01 00 00       	call   30933 <init_thread>
   307a2:	89 45 f4             	mov    %eax,-0xc(%ebp)
   307a5:	c7 44 24 04 14 40 03 	movl   $0x34014,0x4(%esp)
   307ac:	00 
   307ad:	c7 04 24 6c 70 03 00 	movl   $0x3706c,(%esp)
   307b4:	e8 a7 02 00 00       	call   30a60 <list_insert_by_pri>
   307b9:	c7 44 24 04 04 40 03 	movl   $0x34004,0x4(%esp)
   307c0:	00 
   307c1:	c7 04 24 74 70 03 00 	movl   $0x37074,(%esp)
   307c8:	e8 e4 fe ff ff       	call   306b1 <list_insert_back>
   307cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
   307d0:	c9                   	leave  
   307d1:	c3                   	ret    

000307d2 <init_second_thread>:
   307d2:	55                   	push   %ebp
   307d3:	89 e5                	mov    %esp,%ebp
   307d5:	83 ec 28             	sub    $0x28,%esp
   307d8:	c7 44 24 0c a2 05 03 	movl   $0x305a2,0xc(%esp)
   307df:	00 
   307e0:	c7 44 24 08 d2 1f 03 	movl   $0x31fd2,0x8(%esp)
   307e7:	00 
   307e8:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
   307ef:	00 
   307f0:	c7 04 24 00 50 03 00 	movl   $0x35000,(%esp)
   307f7:	e8 37 01 00 00       	call   30933 <init_thread>
   307fc:	89 45 f4             	mov    %eax,-0xc(%ebp)
   307ff:	c7 44 24 04 14 40 03 	movl   $0x34014,0x4(%esp)
   30806:	00 
   30807:	c7 04 24 6c 50 03 00 	movl   $0x3506c,(%esp)
   3080e:	e8 4d 02 00 00       	call   30a60 <list_insert_by_pri>
   30813:	c7 44 24 04 04 40 03 	movl   $0x34004,0x4(%esp)
   3081a:	00 
   3081b:	c7 04 24 74 50 03 00 	movl   $0x35074,(%esp)
   30822:	e8 8a fe ff ff       	call   306b1 <list_insert_back>
   30827:	8b 45 f4             	mov    -0xc(%ebp),%eax
   3082a:	c9                   	leave  
   3082b:	c3                   	ret    

0003082c <init_third_thread>:
   3082c:	55                   	push   %ebp
   3082d:	89 e5                	mov    %esp,%ebp
   3082f:	83 ec 28             	sub    $0x28,%esp
   30832:	c7 44 24 0c c2 05 03 	movl   $0x305c2,0xc(%esp)
   30839:	00 
   3083a:	c7 44 24 08 d8 1f 03 	movl   $0x31fd8,0x8(%esp)
   30841:	00 
   30842:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
   30849:	00 
   3084a:	c7 04 24 00 80 03 00 	movl   $0x38000,(%esp)
   30851:	e8 dd 00 00 00       	call   30933 <init_thread>
   30856:	89 45 f4             	mov    %eax,-0xc(%ebp)
   30859:	c7 44 24 04 14 40 03 	movl   $0x34014,0x4(%esp)
   30860:	00 
   30861:	c7 04 24 6c 80 03 00 	movl   $0x3806c,(%esp)
   30868:	e8 f3 01 00 00       	call   30a60 <list_insert_by_pri>
   3086d:	c7 44 24 04 04 40 03 	movl   $0x34004,0x4(%esp)
   30874:	00 
   30875:	c7 04 24 74 80 03 00 	movl   $0x38074,(%esp)
   3087c:	e8 30 fe ff ff       	call   306b1 <list_insert_back>
   30881:	8b 45 f4             	mov    -0xc(%ebp),%eax
   30884:	c9                   	leave  
   30885:	c3                   	ret    

00030886 <init_K_thread>:
   30886:	55                   	push   %ebp
   30887:	89 e5                	mov    %esp,%ebp
   30889:	83 ec 0c             	sub    $0xc,%esp
   3088c:	a1 0c 30 03 00       	mov    0x3300c,%eax
   30891:	89 c2                	mov    %eax,%edx
   30893:	8b 45 08             	mov    0x8(%ebp),%eax
   30896:	89 50 38             	mov    %edx,0x38(%eax)
   30899:	a1 10 30 03 00       	mov    0x33010,%eax
   3089e:	89 c2                	mov    %eax,%edx
   308a0:	8b 45 08             	mov    0x8(%ebp),%eax
   308a3:	89 10                	mov    %edx,(%eax)
   308a5:	a1 10 30 03 00       	mov    0x33010,%eax
   308aa:	89 c2                	mov    %eax,%edx
   308ac:	8b 45 08             	mov    0x8(%ebp),%eax
   308af:	89 50 04             	mov    %edx,0x4(%eax)
   308b2:	a1 10 30 03 00       	mov    0x33010,%eax
   308b7:	89 c2                	mov    %eax,%edx
   308b9:	8b 45 08             	mov    0x8(%ebp),%eax
   308bc:	89 50 08             	mov    %edx,0x8(%eax)
   308bf:	a1 10 30 03 00       	mov    0x33010,%eax
   308c4:	89 c2                	mov    %eax,%edx
   308c6:	8b 45 08             	mov    0x8(%ebp),%eax
   308c9:	89 50 0c             	mov    %edx,0xc(%eax)
   308cc:	a1 10 30 03 00       	mov    0x33010,%eax
   308d1:	89 c2                	mov    %eax,%edx
   308d3:	8b 45 08             	mov    0x8(%ebp),%eax
   308d6:	89 50 44             	mov    %edx,0x44(%eax)
   308d9:	8b 55 14             	mov    0x14(%ebp),%edx
   308dc:	8b 45 08             	mov    0x8(%ebp),%eax
   308df:	89 50 34             	mov    %edx,0x34(%eax)
   308e2:	8b 45 08             	mov    0x8(%ebp),%eax
   308e5:	05 00 10 00 00       	add    $0x1000,%eax
   308ea:	89 c2                	mov    %eax,%edx
   308ec:	8b 45 08             	mov    0x8(%ebp),%eax
   308ef:	89 50 40             	mov    %edx,0x40(%eax)
   308f2:	8b 45 08             	mov    0x8(%ebp),%eax
   308f5:	c7 40 3c 02 12 00 00 	movl   $0x1202,0x3c(%eax)
   308fc:	8b 45 08             	mov    0x8(%ebp),%eax
   308ff:	8d 50 4c             	lea    0x4c(%eax),%edx
   30902:	c7 44 24 08 14 00 00 	movl   $0x14,0x8(%esp)
   30909:	00 
   3090a:	8b 45 10             	mov    0x10(%ebp),%eax
   3090d:	89 44 24 04          	mov    %eax,0x4(%esp)
   30911:	89 14 24             	mov    %edx,(%esp)
   30914:	e8 f3 fb ff ff       	call   3050c <strncpy>
   30919:	8b 45 08             	mov    0x8(%ebp),%eax
   3091c:	c7 40 64 00 00 00 00 	movl   $0x0,0x64(%eax)
   30923:	8b 45 08             	mov    0x8(%ebp),%eax
   30926:	8b 55 0c             	mov    0xc(%ebp),%edx
   30929:	89 50 60             	mov    %edx,0x60(%eax)
   3092c:	b8 01 00 00 00       	mov    $0x1,%eax
   30931:	c9                   	leave  
   30932:	c3                   	ret    

00030933 <init_thread>:
   30933:	55                   	push   %ebp
   30934:	89 e5                	mov    %esp,%ebp
   30936:	83 ec 0c             	sub    $0xc,%esp
   30939:	a1 04 30 03 00       	mov    0x33004,%eax
   3093e:	89 c2                	mov    %eax,%edx
   30940:	8b 45 08             	mov    0x8(%ebp),%eax
   30943:	89 50 38             	mov    %edx,0x38(%eax)
   30946:	a1 08 30 03 00       	mov    0x33008,%eax
   3094b:	89 c2                	mov    %eax,%edx
   3094d:	8b 45 08             	mov    0x8(%ebp),%eax
   30950:	89 10                	mov    %edx,(%eax)
   30952:	a1 08 30 03 00       	mov    0x33008,%eax
   30957:	89 c2                	mov    %eax,%edx
   30959:	8b 45 08             	mov    0x8(%ebp),%eax
   3095c:	89 50 04             	mov    %edx,0x4(%eax)
   3095f:	a1 08 30 03 00       	mov    0x33008,%eax
   30964:	89 c2                	mov    %eax,%edx
   30966:	8b 45 08             	mov    0x8(%ebp),%eax
   30969:	89 50 08             	mov    %edx,0x8(%eax)
   3096c:	a1 08 30 03 00       	mov    0x33008,%eax
   30971:	89 c2                	mov    %eax,%edx
   30973:	8b 45 08             	mov    0x8(%ebp),%eax
   30976:	89 50 0c             	mov    %edx,0xc(%eax)
   30979:	a1 08 30 03 00       	mov    0x33008,%eax
   3097e:	89 c2                	mov    %eax,%edx
   30980:	8b 45 08             	mov    0x8(%ebp),%eax
   30983:	89 50 44             	mov    %edx,0x44(%eax)
   30986:	8b 55 14             	mov    0x14(%ebp),%edx
   30989:	8b 45 08             	mov    0x8(%ebp),%eax
   3098c:	89 50 34             	mov    %edx,0x34(%eax)
   3098f:	8b 45 08             	mov    0x8(%ebp),%eax
   30992:	05 00 10 00 00       	add    $0x1000,%eax
   30997:	89 c2                	mov    %eax,%edx
   30999:	8b 45 08             	mov    0x8(%ebp),%eax
   3099c:	89 50 40             	mov    %edx,0x40(%eax)
   3099f:	8b 45 08             	mov    0x8(%ebp),%eax
   309a2:	c7 40 3c 02 12 00 00 	movl   $0x1202,0x3c(%eax)
   309a9:	8b 45 08             	mov    0x8(%ebp),%eax
   309ac:	8d 50 4c             	lea    0x4c(%eax),%edx
   309af:	c7 44 24 08 14 00 00 	movl   $0x14,0x8(%esp)
   309b6:	00 
   309b7:	8b 45 10             	mov    0x10(%ebp),%eax
   309ba:	89 44 24 04          	mov    %eax,0x4(%esp)
   309be:	89 14 24             	mov    %edx,(%esp)
   309c1:	e8 46 fb ff ff       	call   3050c <strncpy>
   309c6:	8b 45 08             	mov    0x8(%ebp),%eax
   309c9:	c7 40 64 00 00 00 00 	movl   $0x0,0x64(%eax)
   309d0:	8b 45 08             	mov    0x8(%ebp),%eax
   309d3:	8b 55 0c             	mov    0xc(%ebp),%edx
   309d6:	89 50 60             	mov    %edx,0x60(%eax)
   309d9:	b8 01 00 00 00       	mov    $0x1,%eax
   309de:	c9                   	leave  
   309df:	c3                   	ret    

000309e0 <running_thread>:
   309e0:	55                   	push   %ebp
   309e1:	89 e5                	mov    %esp,%ebp
   309e3:	a1 00 40 03 00       	mov    0x34000,%eax
   309e8:	25 00 f0 ff ff       	and    $0xfffff000,%eax
   309ed:	5d                   	pop    %ebp
   309ee:	c3                   	ret    

000309ef <current_thread_ticks>:
   309ef:	55                   	push   %ebp
   309f0:	89 e5                	mov    %esp,%ebp
   309f2:	e8 e9 ff ff ff       	call   309e0 <running_thread>
   309f7:	8b 40 64             	mov    0x64(%eax),%eax
   309fa:	5d                   	pop    %ebp
   309fb:	c3                   	ret    

000309fc <current_thread_ticks_inc>:
   309fc:	55                   	push   %ebp
   309fd:	89 e5                	mov    %esp,%ebp
   309ff:	e8 dc ff ff ff       	call   309e0 <running_thread>
   30a04:	8b 50 64             	mov    0x64(%eax),%edx
   30a07:	83 c2 01             	add    $0x1,%edx
   30a0a:	89 50 64             	mov    %edx,0x64(%eax)
   30a0d:	5d                   	pop    %ebp
   30a0e:	c3                   	ret    

00030a0f <next_thread_to_run>:
   30a0f:	55                   	push   %ebp
   30a10:	89 e5                	mov    %esp,%ebp
   30a12:	83 ec 18             	sub    $0x18,%esp
   30a15:	c7 04 24 14 40 03 00 	movl   $0x34014,(%esp)
   30a1c:	e8 00 fc ff ff       	call   30621 <list_empty>
   30a21:	85 c0                	test   %eax,%eax
   30a23:	74 07                	je     30a2c <next_thread_to_run+0x1d>
   30a25:	b8 00 a0 03 00       	mov    $0x3a000,%eax
   30a2a:	eb 32                	jmp    30a5e <next_thread_to_run+0x4f>
   30a2c:	a1 18 40 03 00       	mov    0x34018,%eax
   30a31:	83 e8 6c             	sub    $0x6c,%eax
   30a34:	89 45 fc             	mov    %eax,-0x4(%ebp)
   30a37:	8b 45 fc             	mov    -0x4(%ebp),%eax
   30a3a:	83 c0 6c             	add    $0x6c,%eax
   30a3d:	89 04 24             	mov    %eax,(%esp)
   30a40:	e8 89 fc ff ff       	call   306ce <list_remove>
   30a45:	8b 45 fc             	mov    -0x4(%ebp),%eax
   30a48:	83 c0 6c             	add    $0x6c,%eax
   30a4b:	c7 44 24 04 14 40 03 	movl   $0x34014,0x4(%esp)
   30a52:	00 
   30a53:	89 04 24             	mov    %eax,(%esp)
   30a56:	e8 56 fc ff ff       	call   306b1 <list_insert_back>
   30a5b:	8b 45 fc             	mov    -0x4(%ebp),%eax
   30a5e:	c9                   	leave  
   30a5f:	c3                   	ret    

00030a60 <list_insert_by_pri>:
   30a60:	55                   	push   %ebp
   30a61:	89 e5                	mov    %esp,%ebp
   30a63:	83 ec 18             	sub    $0x18,%esp
   30a66:	8b 45 0c             	mov    0xc(%ebp),%eax
   30a69:	89 04 24             	mov    %eax,(%esp)
   30a6c:	e8 b0 fb ff ff       	call   30621 <list_empty>
   30a71:	85 c0                	test   %eax,%eax
   30a73:	74 19                	je     30a8e <list_insert_by_pri+0x2e>
   30a75:	8b 45 0c             	mov    0xc(%ebp),%eax
   30a78:	8b 55 08             	mov    0x8(%ebp),%edx
   30a7b:	89 54 24 04          	mov    %edx,0x4(%esp)
   30a7f:	89 04 24             	mov    %eax,(%esp)
   30a82:	e8 c8 fb ff ff       	call   3064f <list_insert_next>
   30a87:	b8 01 00 00 00       	mov    $0x1,%eax
   30a8c:	eb 63                	jmp    30af1 <list_insert_by_pri+0x91>
   30a8e:	8b 45 0c             	mov    0xc(%ebp),%eax
   30a91:	8b 40 04             	mov    0x4(%eax),%eax
   30a94:	89 45 fc             	mov    %eax,-0x4(%ebp)
   30a97:	8b 45 08             	mov    0x8(%ebp),%eax
   30a9a:	83 e8 6c             	sub    $0x6c,%eax
   30a9d:	8b 50 60             	mov    0x60(%eax),%edx
   30aa0:	8b 45 fc             	mov    -0x4(%ebp),%eax
   30aa3:	83 e8 6c             	sub    $0x6c,%eax
   30aa6:	8b 40 60             	mov    0x60(%eax),%eax
   30aa9:	39 c2                	cmp    %eax,%edx
   30aab:	7d 19                	jge    30ac6 <list_insert_by_pri+0x66>
   30aad:	8b 45 fc             	mov    -0x4(%ebp),%eax
   30ab0:	89 44 24 04          	mov    %eax,0x4(%esp)
   30ab4:	8b 45 08             	mov    0x8(%ebp),%eax
   30ab7:	89 04 24             	mov    %eax,(%esp)
   30aba:	e8 c2 fb ff ff       	call   30681 <list_insert_prev>
   30abf:	b8 01 00 00 00       	mov    $0x1,%eax
   30ac4:	eb 2b                	jmp    30af1 <list_insert_by_pri+0x91>
   30ac6:	8b 45 fc             	mov    -0x4(%ebp),%eax
   30ac9:	8b 40 04             	mov    0x4(%eax),%eax
   30acc:	89 45 fc             	mov    %eax,-0x4(%ebp)
   30acf:	8b 45 0c             	mov    0xc(%ebp),%eax
   30ad2:	83 c0 08             	add    $0x8,%eax
   30ad5:	3b 45 fc             	cmp    -0x4(%ebp),%eax
   30ad8:	75 bd                	jne    30a97 <list_insert_by_pri+0x37>
   30ada:	8b 45 0c             	mov    0xc(%ebp),%eax
   30add:	89 44 24 04          	mov    %eax,0x4(%esp)
   30ae1:	8b 45 08             	mov    0x8(%ebp),%eax
   30ae4:	89 04 24             	mov    %eax,(%esp)
   30ae7:	e8 c5 fb ff ff       	call   306b1 <list_insert_back>
   30aec:	b8 01 00 00 00       	mov    $0x1,%eax
   30af1:	c9                   	leave  
   30af2:	c3                   	ret    

00030af3 <run_first_thread>:
   30af3:	55                   	push   %ebp
   30af4:	89 e5                	mov    %esp,%ebp
   30af6:	83 ec 08             	sub    $0x8,%esp
   30af9:	e8 11 ff ff ff       	call   30a0f <next_thread_to_run>
   30afe:	a3 00 90 03 00       	mov    %eax,0x39000
   30b03:	e8 31 0d 00 00       	call   31839 <restart_thread>
   30b08:	c9                   	leave  
   30b09:	c3                   	ret    
   30b0a:	90                   	nop
   30b0b:	90                   	nop
   30b0c:	90                   	nop
   30b0d:	90                   	nop
   30b0e:	90                   	nop
   30b0f:	90                   	nop

00030b10 <disp_str>:
   30b10:	55                   	push   %ebp
   30b11:	89 e5                	mov    %esp,%ebp
   30b13:	8b 75 08             	mov    0x8(%ebp),%esi
   30b16:	8b 3d 14 30 03 00    	mov    0x33014,%edi
   30b1c:	b4 0f                	mov    $0xf,%ah

00030b1e <disp_str.1>:
   30b1e:	ac                   	lods   %ds:(%esi),%al
   30b1f:	84 c0                	test   %al,%al
   30b21:	74 2f                	je     30b52 <disp_str.2>
   30b23:	3c 0a                	cmp    $0xa,%al
   30b25:	75 16                	jne    30b3d <disp_str.3>
   30b27:	50                   	push   %eax
   30b28:	89 f8                	mov    %edi,%eax
   30b2a:	b3 a0                	mov    $0xa0,%bl
   30b2c:	f6 f3                	div    %bl
   30b2e:	25 ff 00 00 00       	and    $0xff,%eax
   30b33:	40                   	inc    %eax
   30b34:	b3 a0                	mov    $0xa0,%bl
   30b36:	f6 e3                	mul    %bl
   30b38:	89 c7                	mov    %eax,%edi
   30b3a:	58                   	pop    %eax
   30b3b:	eb e1                	jmp    30b1e <disp_str.1>

00030b3d <disp_str.3>:
   30b3d:	81 c7 00 80 0b 00    	add    $0xb8000,%edi
   30b43:	65 66 89 07          	mov    %ax,%gs:(%edi)
   30b47:	81 ef 00 80 0b 00    	sub    $0xb8000,%edi
   30b4d:	83 c7 02             	add    $0x2,%edi
   30b50:	eb cc                	jmp    30b1e <disp_str.1>

00030b52 <disp_str.2>:
   30b52:	89 3d 14 30 03 00    	mov    %edi,0x33014
   30b58:	5d                   	pop    %ebp
   30b59:	c3                   	ret    
   30b5a:	90                   	nop
   30b5b:	90                   	nop

00030b5c <init_8259A>:
   30b5c:	55                   	push   %ebp
   30b5d:	89 e5                	mov    %esp,%ebp
   30b5f:	83 ec 28             	sub    $0x28,%esp
   30b62:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   30b69:	eb 12                	jmp    30b7d <init_8259A+0x21>
   30b6b:	8b 45 f4             	mov    -0xc(%ebp),%eax
   30b6e:	c7 04 85 e0 4c 03 00 	movl   $0x31957,0x34ce0(,%eax,4)
   30b75:	57 19 03 00 
   30b79:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   30b7d:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
   30b81:	7e e8                	jle    30b6b <init_8259A+0xf>
   30b83:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
   30b8a:	00 
   30b8b:	c7 04 24 ff 00 00 00 	movl   $0xff,(%esp)
   30b92:	e8 e9 00 00 00       	call   30c80 <outb>
   30b97:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
   30b9e:	00 
   30b9f:	c7 04 24 ff 00 00 00 	movl   $0xff,(%esp)
   30ba6:	e8 d5 00 00 00       	call   30c80 <outb>
   30bab:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
   30bb2:	00 
   30bb3:	c7 04 24 11 00 00 00 	movl   $0x11,(%esp)
   30bba:	e8 cb 00 00 00       	call   30c8a <outb_pic>
   30bbf:	c7 44 24 04 a0 00 00 	movl   $0xa0,0x4(%esp)
   30bc6:	00 
   30bc7:	c7 04 24 11 00 00 00 	movl   $0x11,(%esp)
   30bce:	e8 b7 00 00 00       	call   30c8a <outb_pic>
   30bd3:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
   30bda:	00 
   30bdb:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
   30be2:	e8 a3 00 00 00       	call   30c8a <outb_pic>
   30be7:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
   30bee:	00 
   30bef:	c7 04 24 28 00 00 00 	movl   $0x28,(%esp)
   30bf6:	e8 8f 00 00 00       	call   30c8a <outb_pic>
   30bfb:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
   30c02:	00 
   30c03:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
   30c0a:	e8 7b 00 00 00       	call   30c8a <outb_pic>
   30c0f:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
   30c16:	00 
   30c17:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
   30c1e:	e8 67 00 00 00       	call   30c8a <outb_pic>
   30c23:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
   30c2a:	00 
   30c2b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
   30c32:	e8 53 00 00 00       	call   30c8a <outb_pic>
   30c37:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
   30c3e:	00 
   30c3f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
   30c46:	e8 3f 00 00 00       	call   30c8a <outb_pic>
   30c4b:	c9                   	leave  
   30c4c:	c3                   	ret    

00030c4d <op_8259A>:
   30c4d:	55                   	push   %ebp
   30c4e:	89 e5                	mov    %esp,%ebp
   30c50:	83 ec 18             	sub    $0x18,%esp
   30c53:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
   30c5a:	00 
   30c5b:	8b 45 08             	mov    0x8(%ebp),%eax
   30c5e:	89 04 24             	mov    %eax,(%esp)
   30c61:	e8 24 00 00 00       	call   30c8a <outb_pic>
   30c66:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
   30c6d:	00 
   30c6e:	8b 45 0c             	mov    0xc(%ebp),%eax
   30c71:	89 04 24             	mov    %eax,(%esp)
   30c74:	e8 11 00 00 00       	call   30c8a <outb_pic>
   30c79:	c9                   	leave  
   30c7a:	c3                   	ret    
   30c7b:	90                   	nop
   30c7c:	90                   	nop
   30c7d:	90                   	nop
   30c7e:	90                   	nop
   30c7f:	90                   	nop

00030c80 <outb>:
   30c80:	8b 44 24 04          	mov    0x4(%esp),%eax
   30c84:	8b 54 24 08          	mov    0x8(%esp),%edx
   30c88:	ee                   	out    %al,(%dx)
   30c89:	c3                   	ret    

00030c8a <outb_pic>:
   30c8a:	8b 44 24 04          	mov    0x4(%esp),%eax
   30c8e:	8b 54 24 08          	mov    0x8(%esp),%edx
   30c92:	ee                   	out    %al,(%dx)
   30c93:	90                   	nop
   30c94:	90                   	nop
   30c95:	c3                   	ret    

00030c96 <inb>:
   30c96:	8b 54 24 04          	mov    0x4(%esp),%edx
   30c9a:	31 c0                	xor    %eax,%eax
   30c9c:	ec                   	in     (%dx),%al
   30c9d:	c3                   	ret    

00030c9e <inb_pic>:
   30c9e:	8b 54 24 04          	mov    0x4(%esp),%edx
   30ca2:	31 c0                	xor    %eax,%eax
   30ca4:	ec                   	in     (%dx),%al
   30ca5:	90                   	nop
   30ca6:	90                   	nop
   30ca7:	c3                   	ret    

00030ca8 <disable_intr>:
   30ca8:	fa                   	cli    
   30ca9:	c3                   	ret    

00030caa <enable_intr>:
   30caa:	fb                   	sti    
   30cab:	c3                   	ret    

00030cac <change_gdt>:
   30cac:	55                   	push   %ebp
   30cad:	89 e5                	mov    %esp,%ebp
   30caf:	83 ec 18             	sub    $0x18,%esp
   30cb2:	66 c7 05 40 40 03 00 	movw   $0x0,0x34040
   30cb9:	00 00 
   30cbb:	66 c7 05 42 40 03 00 	movw   $0x0,0x34042
   30cc2:	00 00 
   30cc4:	c6 05 44 40 03 00 00 	movb   $0x0,0x34044
   30ccb:	c6 05 45 40 03 00 00 	movb   $0x0,0x34045
   30cd2:	c6 05 46 40 03 00 00 	movb   $0x0,0x34046
   30cd9:	c6 05 47 40 03 00 00 	movb   $0x0,0x34047
   30ce0:	66 c7 05 a0 40 03 00 	movw   $0xffff,0x340a0
   30ce7:	ff ff 
   30ce9:	66 c7 05 a2 40 03 00 	movw   $0x0,0x340a2
   30cf0:	00 00 
   30cf2:	c6 05 a4 40 03 00 00 	movb   $0x0,0x340a4
   30cf9:	c6 05 a5 40 03 00 9a 	movb   $0x9a,0x340a5
   30d00:	c6 05 a6 40 03 00 cf 	movb   $0xcf,0x340a6
   30d07:	c6 05 a7 40 03 00 00 	movb   $0x0,0x340a7
   30d0e:	66 c7 05 a8 40 03 00 	movw   $0xffff,0x340a8
   30d15:	ff ff 
   30d17:	66 c7 05 aa 40 03 00 	movw   $0x0,0x340aa
   30d1e:	00 00 
   30d20:	c6 05 ac 40 03 00 00 	movb   $0x0,0x340ac
   30d27:	c6 05 ad 40 03 00 93 	movb   $0x93,0x340ad
   30d2e:	c6 05 ae 40 03 00 cf 	movb   $0xcf,0x340ae
   30d35:	c6 05 af 40 03 00 00 	movb   $0x0,0x340af
   30d3c:	66 c7 05 b0 40 03 00 	movw   $0xffff,0x340b0
   30d43:	ff ff 
   30d45:	66 c7 05 b2 40 03 00 	movw   $0x0,0x340b2
   30d4c:	00 00 
   30d4e:	c6 05 b4 40 03 00 00 	movb   $0x0,0x340b4
   30d55:	c6 05 b5 40 03 00 fa 	movb   $0xfa,0x340b5
   30d5c:	c6 05 b6 40 03 00 cf 	movb   $0xcf,0x340b6
   30d63:	c6 05 b7 40 03 00 00 	movb   $0x0,0x340b7
   30d6a:	66 c7 05 b8 40 03 00 	movw   $0xffff,0x340b8
   30d71:	ff ff 
   30d73:	66 c7 05 ba 40 03 00 	movw   $0x0,0x340ba
   30d7a:	00 00 
   30d7c:	c6 05 bc 40 03 00 00 	movb   $0x0,0x340bc
   30d83:	c6 05 bd 40 03 00 f3 	movb   $0xf3,0x340bd
   30d8a:	c6 05 be 40 03 00 cf 	movb   $0xcf,0x340be
   30d91:	c6 05 bf 40 03 00 00 	movb   $0x0,0x340bf
   30d98:	66 c7 05 b8 40 03 00 	movw   $0xffff,0x340b8
   30d9f:	ff ff 
   30da1:	66 c7 05 ba 40 03 00 	movw   $0x0,0x340ba
   30da8:	00 00 
   30daa:	c6 05 bc 40 03 00 00 	movb   $0x0,0x340bc
   30db1:	c6 05 bd 40 03 00 f3 	movb   $0xf3,0x340bd
   30db8:	c6 05 be 40 03 00 cf 	movb   $0xcf,0x340be
   30dbf:	c6 05 bf 40 03 00 00 	movb   $0x0,0x340bf
   30dc6:	c7 05 68 4c 03 00 68 	movl   $0x68,0x34c68
   30dcd:	00 00 00 
   30dd0:	66 c7 05 c6 4c 03 00 	movw   $0x68,0x34cc6
   30dd7:	68 00 
   30dd9:	66 c7 05 c0 40 03 00 	movw   $0x67,0x340c0
   30de0:	67 00 
   30de2:	b8 60 4c 03 00       	mov    $0x34c60,%eax
   30de7:	66 a3 c2 40 03 00    	mov    %ax,0x340c2
   30ded:	b8 60 4c 03 00       	mov    $0x34c60,%eax
   30df2:	c1 e8 10             	shr    $0x10,%eax
   30df5:	a2 c4 40 03 00       	mov    %al,0x340c4
   30dfa:	c6 05 c5 40 03 00 89 	movb   $0x89,0x340c5
   30e01:	c6 05 c6 40 03 00 00 	movb   $0x0,0x340c6
   30e08:	b8 60 4c 03 00       	mov    $0x34c60,%eax
   30e0d:	c1 e8 18             	shr    $0x18,%eax
   30e10:	a2 c7 40 03 00       	mov    %al,0x340c7
   30e15:	c7 45 f4 06 b0 03 00 	movl   $0x3b006,-0xc(%ebp)
   30e1c:	c7 45 f0 08 b0 03 00 	movl   $0x3b008,-0x10(%ebp)
   30e23:	8b 45 f4             	mov    -0xc(%ebp),%eax
   30e26:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
   30e2b:	ba 40 40 03 00       	mov    $0x34040,%edx
   30e30:	8b 45 f0             	mov    -0x10(%ebp),%eax
   30e33:	89 10                	mov    %edx,(%eax)
   30e35:	e8 66 06 00 00       	call   314a0 <jump_new_gdt>
   30e3a:	c9                   	leave  
   30e3b:	c3                   	ret    

00030e3c <init_idt>:
   30e3c:	55                   	push   %ebp
   30e3d:	89 e5                	mov    %esp,%ebp
   30e3f:	83 ec 18             	sub    $0x18,%esp
   30e42:	b8 c8 17 03 00       	mov    $0x317c8,%eax
   30e47:	66 a3 40 44 03 00    	mov    %ax,0x34440
   30e4d:	66 c7 05 42 44 03 00 	movw   $0x60,0x34442
   30e54:	60 00 
   30e56:	c6 05 44 44 03 00 00 	movb   $0x0,0x34444
   30e5d:	c6 05 45 44 03 00 8e 	movb   $0x8e,0x34445
   30e64:	b8 c8 17 03 00       	mov    $0x317c8,%eax
   30e69:	c1 e8 10             	shr    $0x10,%eax
   30e6c:	66 a3 46 44 03 00    	mov    %ax,0x34446
   30e72:	b8 ce 17 03 00       	mov    $0x317ce,%eax
   30e77:	66 a3 48 44 03 00    	mov    %ax,0x34448
   30e7d:	66 c7 05 4a 44 03 00 	movw   $0x60,0x3444a
   30e84:	60 00 
   30e86:	c6 05 4c 44 03 00 00 	movb   $0x0,0x3444c
   30e8d:	c6 05 4d 44 03 00 8e 	movb   $0x8e,0x3444d
   30e94:	b8 ce 17 03 00       	mov    $0x317ce,%eax
   30e99:	c1 e8 10             	shr    $0x10,%eax
   30e9c:	66 a3 4e 44 03 00    	mov    %ax,0x3444e
   30ea2:	b8 d4 17 03 00       	mov    $0x317d4,%eax
   30ea7:	66 a3 50 44 03 00    	mov    %ax,0x34450
   30ead:	66 c7 05 52 44 03 00 	movw   $0x60,0x34452
   30eb4:	60 00 
   30eb6:	c6 05 54 44 03 00 00 	movb   $0x0,0x34454
   30ebd:	c6 05 55 44 03 00 8e 	movb   $0x8e,0x34455
   30ec4:	b8 d4 17 03 00       	mov    $0x317d4,%eax
   30ec9:	c1 e8 10             	shr    $0x10,%eax
   30ecc:	66 a3 56 44 03 00    	mov    %ax,0x34456
   30ed2:	b8 da 17 03 00       	mov    $0x317da,%eax
   30ed7:	66 a3 58 44 03 00    	mov    %ax,0x34458
   30edd:	66 c7 05 5a 44 03 00 	movw   $0x60,0x3445a
   30ee4:	60 00 
   30ee6:	c6 05 5c 44 03 00 00 	movb   $0x0,0x3445c
   30eed:	c6 05 5d 44 03 00 8e 	movb   $0x8e,0x3445d
   30ef4:	b8 da 17 03 00       	mov    $0x317da,%eax
   30ef9:	c1 e8 10             	shr    $0x10,%eax
   30efc:	66 a3 5e 44 03 00    	mov    %ax,0x3445e
   30f02:	b8 e0 17 03 00       	mov    $0x317e0,%eax
   30f07:	66 a3 60 44 03 00    	mov    %ax,0x34460
   30f0d:	66 c7 05 62 44 03 00 	movw   $0x60,0x34462
   30f14:	60 00 
   30f16:	c6 05 64 44 03 00 00 	movb   $0x0,0x34464
   30f1d:	c6 05 65 44 03 00 8e 	movb   $0x8e,0x34465
   30f24:	b8 e0 17 03 00       	mov    $0x317e0,%eax
   30f29:	c1 e8 10             	shr    $0x10,%eax
   30f2c:	66 a3 66 44 03 00    	mov    %ax,0x34466
   30f32:	b8 e6 17 03 00       	mov    $0x317e6,%eax
   30f37:	66 a3 68 44 03 00    	mov    %ax,0x34468
   30f3d:	66 c7 05 6a 44 03 00 	movw   $0x60,0x3446a
   30f44:	60 00 
   30f46:	c6 05 6c 44 03 00 00 	movb   $0x0,0x3446c
   30f4d:	c6 05 6d 44 03 00 8e 	movb   $0x8e,0x3446d
   30f54:	b8 e6 17 03 00       	mov    $0x317e6,%eax
   30f59:	c1 e8 10             	shr    $0x10,%eax
   30f5c:	66 a3 6e 44 03 00    	mov    %ax,0x3446e
   30f62:	b8 ec 17 03 00       	mov    $0x317ec,%eax
   30f67:	66 a3 70 44 03 00    	mov    %ax,0x34470
   30f6d:	66 c7 05 72 44 03 00 	movw   $0x60,0x34472
   30f74:	60 00 
   30f76:	c6 05 74 44 03 00 00 	movb   $0x0,0x34474
   30f7d:	c6 05 75 44 03 00 8e 	movb   $0x8e,0x34475
   30f84:	b8 ec 17 03 00       	mov    $0x317ec,%eax
   30f89:	c1 e8 10             	shr    $0x10,%eax
   30f8c:	66 a3 76 44 03 00    	mov    %ax,0x34476
   30f92:	b8 f2 17 03 00       	mov    $0x317f2,%eax
   30f97:	66 a3 78 44 03 00    	mov    %ax,0x34478
   30f9d:	66 c7 05 7a 44 03 00 	movw   $0x60,0x3447a
   30fa4:	60 00 
   30fa6:	c6 05 7c 44 03 00 00 	movb   $0x0,0x3447c
   30fad:	c6 05 7d 44 03 00 8e 	movb   $0x8e,0x3447d
   30fb4:	b8 f2 17 03 00       	mov    $0x317f2,%eax
   30fb9:	c1 e8 10             	shr    $0x10,%eax
   30fbc:	66 a3 7e 44 03 00    	mov    %ax,0x3447e
   30fc2:	b8 f8 17 03 00       	mov    $0x317f8,%eax
   30fc7:	66 a3 80 44 03 00    	mov    %ax,0x34480
   30fcd:	66 c7 05 82 44 03 00 	movw   $0x60,0x34482
   30fd4:	60 00 
   30fd6:	c6 05 84 44 03 00 00 	movb   $0x0,0x34484
   30fdd:	c6 05 85 44 03 00 8e 	movb   $0x8e,0x34485
   30fe4:	b8 f8 17 03 00       	mov    $0x317f8,%eax
   30fe9:	c1 e8 10             	shr    $0x10,%eax
   30fec:	66 a3 86 44 03 00    	mov    %ax,0x34486
   30ff2:	b8 fc 17 03 00       	mov    $0x317fc,%eax
   30ff7:	66 a3 88 44 03 00    	mov    %ax,0x34488
   30ffd:	66 c7 05 8a 44 03 00 	movw   $0x60,0x3448a
   31004:	60 00 
   31006:	c6 05 8c 44 03 00 00 	movb   $0x0,0x3448c
   3100d:	c6 05 8d 44 03 00 8e 	movb   $0x8e,0x3448d
   31014:	b8 fc 17 03 00       	mov    $0x317fc,%eax
   31019:	c1 e8 10             	shr    $0x10,%eax
   3101c:	66 a3 8e 44 03 00    	mov    %ax,0x3448e
   31022:	b8 02 18 03 00       	mov    $0x31802,%eax
   31027:	66 a3 90 44 03 00    	mov    %ax,0x34490
   3102d:	66 c7 05 92 44 03 00 	movw   $0x60,0x34492
   31034:	60 00 
   31036:	c6 05 94 44 03 00 00 	movb   $0x0,0x34494
   3103d:	c6 05 95 44 03 00 8e 	movb   $0x8e,0x34495
   31044:	b8 02 18 03 00       	mov    $0x31802,%eax
   31049:	c1 e8 10             	shr    $0x10,%eax
   3104c:	66 a3 96 44 03 00    	mov    %ax,0x34496
   31052:	b8 06 18 03 00       	mov    $0x31806,%eax
   31057:	66 a3 98 44 03 00    	mov    %ax,0x34498
   3105d:	66 c7 05 9a 44 03 00 	movw   $0x60,0x3449a
   31064:	60 00 
   31066:	c6 05 9c 44 03 00 00 	movb   $0x0,0x3449c
   3106d:	c6 05 9d 44 03 00 8e 	movb   $0x8e,0x3449d
   31074:	b8 06 18 03 00       	mov    $0x31806,%eax
   31079:	c1 e8 10             	shr    $0x10,%eax
   3107c:	66 a3 9e 44 03 00    	mov    %ax,0x3449e
   31082:	b8 0a 18 03 00       	mov    $0x3180a,%eax
   31087:	66 a3 a0 44 03 00    	mov    %ax,0x344a0
   3108d:	66 c7 05 a2 44 03 00 	movw   $0x60,0x344a2
   31094:	60 00 
   31096:	c6 05 a4 44 03 00 00 	movb   $0x0,0x344a4
   3109d:	c6 05 a5 44 03 00 8e 	movb   $0x8e,0x344a5
   310a4:	b8 0a 18 03 00       	mov    $0x3180a,%eax
   310a9:	c1 e8 10             	shr    $0x10,%eax
   310ac:	66 a3 a6 44 03 00    	mov    %ax,0x344a6
   310b2:	b8 0e 18 03 00       	mov    $0x3180e,%eax
   310b7:	66 a3 a8 44 03 00    	mov    %ax,0x344a8
   310bd:	66 c7 05 aa 44 03 00 	movw   $0x60,0x344aa
   310c4:	60 00 
   310c6:	c6 05 ac 44 03 00 00 	movb   $0x0,0x344ac
   310cd:	c6 05 ad 44 03 00 8e 	movb   $0x8e,0x344ad
   310d4:	b8 0e 18 03 00       	mov    $0x3180e,%eax
   310d9:	c1 e8 10             	shr    $0x10,%eax
   310dc:	66 a3 ae 44 03 00    	mov    %ax,0x344ae
   310e2:	b8 12 18 03 00       	mov    $0x31812,%eax
   310e7:	66 a3 b0 44 03 00    	mov    %ax,0x344b0
   310ed:	66 c7 05 b2 44 03 00 	movw   $0x60,0x344b2
   310f4:	60 00 
   310f6:	c6 05 b4 44 03 00 00 	movb   $0x0,0x344b4
   310fd:	c6 05 b5 44 03 00 8e 	movb   $0x8e,0x344b5
   31104:	b8 12 18 03 00       	mov    $0x31812,%eax
   31109:	c1 e8 10             	shr    $0x10,%eax
   3110c:	66 a3 b6 44 03 00    	mov    %ax,0x344b6
   31112:	b8 16 18 03 00       	mov    $0x31816,%eax
   31117:	66 a3 c0 44 03 00    	mov    %ax,0x344c0
   3111d:	66 c7 05 c2 44 03 00 	movw   $0x60,0x344c2
   31124:	60 00 
   31126:	c6 05 c4 44 03 00 00 	movb   $0x0,0x344c4
   3112d:	c6 05 c5 44 03 00 8e 	movb   $0x8e,0x344c5
   31134:	b8 16 18 03 00       	mov    $0x31816,%eax
   31139:	c1 e8 10             	shr    $0x10,%eax
   3113c:	66 a3 c6 44 03 00    	mov    %ax,0x344c6
   31142:	b8 d0 14 03 00       	mov    $0x314d0,%eax
   31147:	66 a3 40 45 03 00    	mov    %ax,0x34540
   3114d:	66 c7 05 42 45 03 00 	movw   $0x60,0x34542
   31154:	60 00 
   31156:	c6 05 44 45 03 00 00 	movb   $0x0,0x34544
   3115d:	c6 05 45 45 03 00 8e 	movb   $0x8e,0x34545
   31164:	b8 d0 14 03 00       	mov    $0x314d0,%eax
   31169:	c1 e8 10             	shr    $0x10,%eax
   3116c:	66 a3 46 45 03 00    	mov    %ax,0x34546
   31172:	b8 00 15 03 00       	mov    $0x31500,%eax
   31177:	66 a3 48 45 03 00    	mov    %ax,0x34548
   3117d:	66 c7 05 4a 45 03 00 	movw   $0x60,0x3454a
   31184:	60 00 
   31186:	c6 05 4c 45 03 00 00 	movb   $0x0,0x3454c
   3118d:	c6 05 4d 45 03 00 8e 	movb   $0x8e,0x3454d
   31194:	b8 00 15 03 00       	mov    $0x31500,%eax
   31199:	c1 e8 10             	shr    $0x10,%eax
   3119c:	66 a3 4e 45 03 00    	mov    %ax,0x3454e
   311a2:	b8 30 15 03 00       	mov    $0x31530,%eax
   311a7:	66 a3 50 45 03 00    	mov    %ax,0x34550
   311ad:	66 c7 05 52 45 03 00 	movw   $0x60,0x34552
   311b4:	60 00 
   311b6:	c6 05 54 45 03 00 00 	movb   $0x0,0x34554
   311bd:	c6 05 55 45 03 00 8e 	movb   $0x8e,0x34555
   311c4:	b8 30 15 03 00       	mov    $0x31530,%eax
   311c9:	c1 e8 10             	shr    $0x10,%eax
   311cc:	66 a3 56 45 03 00    	mov    %ax,0x34556
   311d2:	b8 60 15 03 00       	mov    $0x31560,%eax
   311d7:	66 a3 58 45 03 00    	mov    %ax,0x34558
   311dd:	66 c7 05 5a 45 03 00 	movw   $0x60,0x3455a
   311e4:	60 00 
   311e6:	c6 05 5c 45 03 00 00 	movb   $0x0,0x3455c
   311ed:	c6 05 5d 45 03 00 8e 	movb   $0x8e,0x3455d
   311f4:	b8 60 15 03 00       	mov    $0x31560,%eax
   311f9:	c1 e8 10             	shr    $0x10,%eax
   311fc:	66 a3 5e 45 03 00    	mov    %ax,0x3455e
   31202:	b8 90 15 03 00       	mov    $0x31590,%eax
   31207:	66 a3 60 45 03 00    	mov    %ax,0x34560
   3120d:	66 c7 05 62 45 03 00 	movw   $0x60,0x34562
   31214:	60 00 
   31216:	c6 05 64 45 03 00 00 	movb   $0x0,0x34564
   3121d:	c6 05 65 45 03 00 8e 	movb   $0x8e,0x34565
   31224:	b8 90 15 03 00       	mov    $0x31590,%eax
   31229:	c1 e8 10             	shr    $0x10,%eax
   3122c:	66 a3 66 45 03 00    	mov    %ax,0x34566
   31232:	b8 c0 15 03 00       	mov    $0x315c0,%eax
   31237:	66 a3 68 45 03 00    	mov    %ax,0x34568
   3123d:	66 c7 05 6a 45 03 00 	movw   $0x60,0x3456a
   31244:	60 00 
   31246:	c6 05 6c 45 03 00 00 	movb   $0x0,0x3456c
   3124d:	c6 05 6d 45 03 00 8e 	movb   $0x8e,0x3456d
   31254:	b8 c0 15 03 00       	mov    $0x315c0,%eax
   31259:	c1 e8 10             	shr    $0x10,%eax
   3125c:	66 a3 6e 45 03 00    	mov    %ax,0x3456e
   31262:	b8 f0 15 03 00       	mov    $0x315f0,%eax
   31267:	66 a3 70 45 03 00    	mov    %ax,0x34570
   3126d:	66 c7 05 72 45 03 00 	movw   $0x60,0x34572
   31274:	60 00 
   31276:	c6 05 74 45 03 00 00 	movb   $0x0,0x34574
   3127d:	c6 05 75 45 03 00 8e 	movb   $0x8e,0x34575
   31284:	b8 f0 15 03 00       	mov    $0x315f0,%eax
   31289:	c1 e8 10             	shr    $0x10,%eax
   3128c:	66 a3 76 45 03 00    	mov    %ax,0x34576
   31292:	b8 20 16 03 00       	mov    $0x31620,%eax
   31297:	66 a3 78 45 03 00    	mov    %ax,0x34578
   3129d:	66 c7 05 7a 45 03 00 	movw   $0x60,0x3457a
   312a4:	60 00 
   312a6:	c6 05 7c 45 03 00 00 	movb   $0x0,0x3457c
   312ad:	c6 05 7d 45 03 00 8e 	movb   $0x8e,0x3457d
   312b4:	b8 20 16 03 00       	mov    $0x31620,%eax
   312b9:	c1 e8 10             	shr    $0x10,%eax
   312bc:	66 a3 7e 45 03 00    	mov    %ax,0x3457e
   312c2:	b8 50 16 03 00       	mov    $0x31650,%eax
   312c7:	66 a3 80 45 03 00    	mov    %ax,0x34580
   312cd:	66 c7 05 82 45 03 00 	movw   $0x60,0x34582
   312d4:	60 00 
   312d6:	c6 05 84 45 03 00 00 	movb   $0x0,0x34584
   312dd:	c6 05 85 45 03 00 8e 	movb   $0x8e,0x34585
   312e4:	b8 50 16 03 00       	mov    $0x31650,%eax
   312e9:	c1 e8 10             	shr    $0x10,%eax
   312ec:	66 a3 86 45 03 00    	mov    %ax,0x34586
   312f2:	b8 80 16 03 00       	mov    $0x31680,%eax
   312f7:	66 a3 88 45 03 00    	mov    %ax,0x34588
   312fd:	66 c7 05 8a 45 03 00 	movw   $0x60,0x3458a
   31304:	60 00 
   31306:	c6 05 8c 45 03 00 00 	movb   $0x0,0x3458c
   3130d:	c6 05 8d 45 03 00 8e 	movb   $0x8e,0x3458d
   31314:	b8 80 16 03 00       	mov    $0x31680,%eax
   31319:	c1 e8 10             	shr    $0x10,%eax
   3131c:	66 a3 8e 45 03 00    	mov    %ax,0x3458e
   31322:	b8 b0 16 03 00       	mov    $0x316b0,%eax
   31327:	66 a3 90 45 03 00    	mov    %ax,0x34590
   3132d:	66 c7 05 92 45 03 00 	movw   $0x60,0x34592
   31334:	60 00 
   31336:	c6 05 94 45 03 00 00 	movb   $0x0,0x34594
   3133d:	c6 05 95 45 03 00 8e 	movb   $0x8e,0x34595
   31344:	b8 b0 16 03 00       	mov    $0x316b0,%eax
   31349:	c1 e8 10             	shr    $0x10,%eax
   3134c:	66 a3 96 45 03 00    	mov    %ax,0x34596
   31352:	b8 e0 16 03 00       	mov    $0x316e0,%eax
   31357:	66 a3 98 45 03 00    	mov    %ax,0x34598
   3135d:	66 c7 05 9a 45 03 00 	movw   $0x60,0x3459a
   31364:	60 00 
   31366:	c6 05 9c 45 03 00 00 	movb   $0x0,0x3459c
   3136d:	c6 05 9d 45 03 00 8e 	movb   $0x8e,0x3459d
   31374:	b8 e0 16 03 00       	mov    $0x316e0,%eax
   31379:	c1 e8 10             	shr    $0x10,%eax
   3137c:	66 a3 9e 45 03 00    	mov    %ax,0x3459e
   31382:	b8 10 17 03 00       	mov    $0x31710,%eax
   31387:	66 a3 a0 45 03 00    	mov    %ax,0x345a0
   3138d:	66 c7 05 a2 45 03 00 	movw   $0x60,0x345a2
   31394:	60 00 
   31396:	c6 05 a4 45 03 00 00 	movb   $0x0,0x345a4
   3139d:	c6 05 a5 45 03 00 8e 	movb   $0x8e,0x345a5
   313a4:	b8 10 17 03 00       	mov    $0x31710,%eax
   313a9:	c1 e8 10             	shr    $0x10,%eax
   313ac:	66 a3 a6 45 03 00    	mov    %ax,0x345a6
   313b2:	b8 40 17 03 00       	mov    $0x31740,%eax
   313b7:	66 a3 a8 45 03 00    	mov    %ax,0x345a8
   313bd:	66 c7 05 aa 45 03 00 	movw   $0x60,0x345aa
   313c4:	60 00 
   313c6:	c6 05 ac 45 03 00 00 	movb   $0x0,0x345ac
   313cd:	c6 05 ad 45 03 00 8e 	movb   $0x8e,0x345ad
   313d4:	b8 40 17 03 00       	mov    $0x31740,%eax
   313d9:	c1 e8 10             	shr    $0x10,%eax
   313dc:	66 a3 ae 45 03 00    	mov    %ax,0x345ae
   313e2:	b8 70 17 03 00       	mov    $0x31770,%eax
   313e7:	66 a3 b0 45 03 00    	mov    %ax,0x345b0
   313ed:	66 c7 05 b2 45 03 00 	movw   $0x60,0x345b2
   313f4:	60 00 
   313f6:	c6 05 b4 45 03 00 00 	movb   $0x0,0x345b4
   313fd:	c6 05 b5 45 03 00 8e 	movb   $0x8e,0x345b5
   31404:	b8 70 17 03 00       	mov    $0x31770,%eax
   31409:	c1 e8 10             	shr    $0x10,%eax
   3140c:	66 a3 b6 45 03 00    	mov    %ax,0x345b6
   31412:	b8 a0 17 03 00       	mov    $0x317a0,%eax
   31417:	66 a3 b8 45 03 00    	mov    %ax,0x345b8
   3141d:	66 c7 05 ba 45 03 00 	movw   $0x60,0x345ba
   31424:	60 00 
   31426:	c6 05 bc 45 03 00 00 	movb   $0x0,0x345bc
   3142d:	c6 05 bd 45 03 00 8e 	movb   $0x8e,0x345bd
   31434:	b8 a0 17 03 00       	mov    $0x317a0,%eax
   31439:	c1 e8 10             	shr    $0x10,%eax
   3143c:	66 a3 be 45 03 00    	mov    %ax,0x345be
   31442:	b8 25 18 03 00       	mov    $0x31825,%eax
   31447:	66 a3 40 48 03 00    	mov    %ax,0x34840
   3144d:	66 c7 05 42 48 03 00 	movw   $0x60,0x34842
   31454:	60 00 
   31456:	c6 05 44 48 03 00 00 	movb   $0x0,0x34844
   3145d:	c6 05 45 48 03 00 ee 	movb   $0xee,0x34845
   31464:	b8 25 18 03 00       	mov    $0x31825,%eax
   31469:	c1 e8 10             	shr    $0x10,%eax
   3146c:	66 a3 46 48 03 00    	mov    %ax,0x34846
   31472:	c7 45 f4 00 b0 03 00 	movl   $0x3b000,-0xc(%ebp)
   31479:	c7 45 f0 02 b0 03 00 	movl   $0x3b002,-0x10(%ebp)
   31480:	8b 45 f4             	mov    -0xc(%ebp),%eax
   31483:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
   31488:	ba 40 44 03 00       	mov    $0x34440,%edx
   3148d:	8b 45 f0             	mov    -0x10(%ebp),%eax
   31490:	89 10                	mov    %edx,(%eax)
   31492:	e8 30 00 00 00       	call   314c7 <load_idt>
   31497:	c9                   	leave  
   31498:	c3                   	ret    
   31499:	90                   	nop
   3149a:	90                   	nop
   3149b:	90                   	nop
   3149c:	90                   	nop
   3149d:	90                   	nop
   3149e:	90                   	nop
   3149f:	90                   	nop

000314a0 <jump_new_gdt>:
   314a0:	0f 01 15 06 b0 03 00 	lgdtl  0x3b006
   314a7:	66 b8 68 00          	mov    $0x68,%ax
   314ab:	8e d8                	mov    %eax,%ds
   314ad:	8e c0                	mov    %eax,%es
   314af:	8e d0                	mov    %eax,%ss
   314b1:	8e e0                	mov    %eax,%fs
   314b3:	8e e8                	mov    %eax,%gs
   314b5:	31 c0                	xor    %eax,%eax
   314b7:	66 b8 80 00          	mov    $0x80,%ax
   314bb:	0f 00 d8             	ltr    %ax
   314be:	ea c6 14 03 00 60 00 	ljmp   $0x60,$0x314c6
   314c5:	c3                   	ret    

000314c6 <use_new_gdt>:
   314c6:	c3                   	ret    

000314c7 <load_idt>:
   314c7:	0f 01 1d 00 b0 03 00 	lidtl  0x3b000
   314ce:	c3                   	ret    
   314cf:	90                   	nop

000314d0 <hwint00>:
   314d0:	8b 54 24 0c          	mov    0xc(%esp),%edx
   314d4:	89 15 00 40 03 00    	mov    %edx,0x34000
   314da:	e8 7a 03 00 00       	call   31859 <save>
   314df:	e4 21                	in     $0x21,%al
   314e1:	0c 01                	or     $0x1,%al
   314e3:	e6 21                	out    %al,$0x21
   314e5:	b0 20                	mov    $0x20,%al
   314e7:	e6 20                	out    %al,$0x20
   314e9:	fb                   	sti    
   314ea:	ff 15 e0 4c 03 00    	call   *0x34ce0
   314f0:	fa                   	cli    
   314f1:	e4 21                	in     $0x21,%al
   314f3:	24 fe                	and    $0xfe,%al
   314f5:	e6 21                	out    %al,$0x21
   314f7:	c3                   	ret    
   314f8:	90                   	nop
   314f9:	90                   	nop
   314fa:	90                   	nop
   314fb:	90                   	nop
   314fc:	90                   	nop
   314fd:	90                   	nop
   314fe:	90                   	nop
   314ff:	90                   	nop

00031500 <hwint01>:
   31500:	8b 54 24 0c          	mov    0xc(%esp),%edx
   31504:	89 15 00 40 03 00    	mov    %edx,0x34000
   3150a:	e8 4a 03 00 00       	call   31859 <save>
   3150f:	e4 21                	in     $0x21,%al
   31511:	0c 01                	or     $0x1,%al
   31513:	e6 21                	out    %al,$0x21
   31515:	b0 20                	mov    $0x20,%al
   31517:	e6 20                	out    %al,$0x20
   31519:	fb                   	sti    
   3151a:	ff 15 e4 4c 03 00    	call   *0x34ce4
   31520:	fa                   	cli    
   31521:	e4 21                	in     $0x21,%al
   31523:	24 fe                	and    $0xfe,%al
   31525:	e6 21                	out    %al,$0x21
   31527:	c3                   	ret    
   31528:	90                   	nop
   31529:	90                   	nop
   3152a:	90                   	nop
   3152b:	90                   	nop
   3152c:	90                   	nop
   3152d:	90                   	nop
   3152e:	90                   	nop
   3152f:	90                   	nop

00031530 <hwint02>:
   31530:	8b 54 24 0c          	mov    0xc(%esp),%edx
   31534:	89 15 00 40 03 00    	mov    %edx,0x34000
   3153a:	e8 1a 03 00 00       	call   31859 <save>
   3153f:	e4 21                	in     $0x21,%al
   31541:	0c 01                	or     $0x1,%al
   31543:	e6 21                	out    %al,$0x21
   31545:	b0 20                	mov    $0x20,%al
   31547:	e6 20                	out    %al,$0x20
   31549:	fb                   	sti    
   3154a:	ff 15 e8 4c 03 00    	call   *0x34ce8
   31550:	fa                   	cli    
   31551:	e4 21                	in     $0x21,%al
   31553:	24 fe                	and    $0xfe,%al
   31555:	e6 21                	out    %al,$0x21
   31557:	c3                   	ret    
   31558:	90                   	nop
   31559:	90                   	nop
   3155a:	90                   	nop
   3155b:	90                   	nop
   3155c:	90                   	nop
   3155d:	90                   	nop
   3155e:	90                   	nop
   3155f:	90                   	nop

00031560 <hwint03>:
   31560:	8b 54 24 0c          	mov    0xc(%esp),%edx
   31564:	89 15 00 40 03 00    	mov    %edx,0x34000
   3156a:	e8 ea 02 00 00       	call   31859 <save>
   3156f:	e4 21                	in     $0x21,%al
   31571:	0c 01                	or     $0x1,%al
   31573:	e6 21                	out    %al,$0x21
   31575:	b0 20                	mov    $0x20,%al
   31577:	e6 20                	out    %al,$0x20
   31579:	fb                   	sti    
   3157a:	ff 15 ec 4c 03 00    	call   *0x34cec
   31580:	fa                   	cli    
   31581:	e4 21                	in     $0x21,%al
   31583:	24 fe                	and    $0xfe,%al
   31585:	e6 21                	out    %al,$0x21
   31587:	c3                   	ret    
   31588:	90                   	nop
   31589:	90                   	nop
   3158a:	90                   	nop
   3158b:	90                   	nop
   3158c:	90                   	nop
   3158d:	90                   	nop
   3158e:	90                   	nop
   3158f:	90                   	nop

00031590 <hwint04>:
   31590:	8b 54 24 0c          	mov    0xc(%esp),%edx
   31594:	89 15 00 40 03 00    	mov    %edx,0x34000
   3159a:	e8 ba 02 00 00       	call   31859 <save>
   3159f:	e4 21                	in     $0x21,%al
   315a1:	0c 01                	or     $0x1,%al
   315a3:	e6 21                	out    %al,$0x21
   315a5:	b0 20                	mov    $0x20,%al
   315a7:	e6 20                	out    %al,$0x20
   315a9:	fb                   	sti    
   315aa:	ff 15 f0 4c 03 00    	call   *0x34cf0
   315b0:	fa                   	cli    
   315b1:	e4 21                	in     $0x21,%al
   315b3:	24 fe                	and    $0xfe,%al
   315b5:	e6 21                	out    %al,$0x21
   315b7:	c3                   	ret    
   315b8:	90                   	nop
   315b9:	90                   	nop
   315ba:	90                   	nop
   315bb:	90                   	nop
   315bc:	90                   	nop
   315bd:	90                   	nop
   315be:	90                   	nop
   315bf:	90                   	nop

000315c0 <hwint05>:
   315c0:	8b 54 24 0c          	mov    0xc(%esp),%edx
   315c4:	89 15 00 40 03 00    	mov    %edx,0x34000
   315ca:	e8 8a 02 00 00       	call   31859 <save>
   315cf:	e4 21                	in     $0x21,%al
   315d1:	0c 01                	or     $0x1,%al
   315d3:	e6 21                	out    %al,$0x21
   315d5:	b0 20                	mov    $0x20,%al
   315d7:	e6 20                	out    %al,$0x20
   315d9:	fb                   	sti    
   315da:	ff 15 f4 4c 03 00    	call   *0x34cf4
   315e0:	fa                   	cli    
   315e1:	e4 21                	in     $0x21,%al
   315e3:	24 fe                	and    $0xfe,%al
   315e5:	e6 21                	out    %al,$0x21
   315e7:	c3                   	ret    
   315e8:	90                   	nop
   315e9:	90                   	nop
   315ea:	90                   	nop
   315eb:	90                   	nop
   315ec:	90                   	nop
   315ed:	90                   	nop
   315ee:	90                   	nop
   315ef:	90                   	nop

000315f0 <hwint06>:
   315f0:	8b 54 24 0c          	mov    0xc(%esp),%edx
   315f4:	89 15 00 40 03 00    	mov    %edx,0x34000
   315fa:	e8 5a 02 00 00       	call   31859 <save>
   315ff:	e4 21                	in     $0x21,%al
   31601:	0c 01                	or     $0x1,%al
   31603:	e6 21                	out    %al,$0x21
   31605:	b0 20                	mov    $0x20,%al
   31607:	e6 20                	out    %al,$0x20
   31609:	fb                   	sti    
   3160a:	ff 15 f8 4c 03 00    	call   *0x34cf8
   31610:	fa                   	cli    
   31611:	e4 21                	in     $0x21,%al
   31613:	24 fe                	and    $0xfe,%al
   31615:	e6 21                	out    %al,$0x21
   31617:	c3                   	ret    
   31618:	90                   	nop
   31619:	90                   	nop
   3161a:	90                   	nop
   3161b:	90                   	nop
   3161c:	90                   	nop
   3161d:	90                   	nop
   3161e:	90                   	nop
   3161f:	90                   	nop

00031620 <hwint07>:
   31620:	8b 54 24 0c          	mov    0xc(%esp),%edx
   31624:	89 15 00 40 03 00    	mov    %edx,0x34000
   3162a:	e8 2a 02 00 00       	call   31859 <save>
   3162f:	e4 21                	in     $0x21,%al
   31631:	0c 01                	or     $0x1,%al
   31633:	e6 21                	out    %al,$0x21
   31635:	b0 20                	mov    $0x20,%al
   31637:	e6 20                	out    %al,$0x20
   31639:	fb                   	sti    
   3163a:	ff 15 fc 4c 03 00    	call   *0x34cfc
   31640:	fa                   	cli    
   31641:	e4 21                	in     $0x21,%al
   31643:	24 fe                	and    $0xfe,%al
   31645:	e6 21                	out    %al,$0x21
   31647:	c3                   	ret    
   31648:	90                   	nop
   31649:	90                   	nop
   3164a:	90                   	nop
   3164b:	90                   	nop
   3164c:	90                   	nop
   3164d:	90                   	nop
   3164e:	90                   	nop
   3164f:	90                   	nop

00031650 <hwint08>:
   31650:	8b 54 24 0c          	mov    0xc(%esp),%edx
   31654:	89 15 00 40 03 00    	mov    %edx,0x34000
   3165a:	e8 fa 01 00 00       	call   31859 <save>
   3165f:	e4 21                	in     $0x21,%al
   31661:	0c 01                	or     $0x1,%al
   31663:	e6 21                	out    %al,$0x21
   31665:	b0 20                	mov    $0x20,%al
   31667:	e6 20                	out    %al,$0x20
   31669:	fb                   	sti    
   3166a:	ff 15 00 4d 03 00    	call   *0x34d00
   31670:	fa                   	cli    
   31671:	e4 21                	in     $0x21,%al
   31673:	24 fe                	and    $0xfe,%al
   31675:	e6 21                	out    %al,$0x21
   31677:	c3                   	ret    
   31678:	90                   	nop
   31679:	90                   	nop
   3167a:	90                   	nop
   3167b:	90                   	nop
   3167c:	90                   	nop
   3167d:	90                   	nop
   3167e:	90                   	nop
   3167f:	90                   	nop

00031680 <hwint09>:
   31680:	8b 54 24 0c          	mov    0xc(%esp),%edx
   31684:	89 15 00 40 03 00    	mov    %edx,0x34000
   3168a:	e8 ca 01 00 00       	call   31859 <save>
   3168f:	e4 21                	in     $0x21,%al
   31691:	0c 01                	or     $0x1,%al
   31693:	e6 21                	out    %al,$0x21
   31695:	b0 20                	mov    $0x20,%al
   31697:	e6 20                	out    %al,$0x20
   31699:	fb                   	sti    
   3169a:	ff 15 04 4d 03 00    	call   *0x34d04
   316a0:	fa                   	cli    
   316a1:	e4 21                	in     $0x21,%al
   316a3:	24 fe                	and    $0xfe,%al
   316a5:	e6 21                	out    %al,$0x21
   316a7:	c3                   	ret    
   316a8:	90                   	nop
   316a9:	90                   	nop
   316aa:	90                   	nop
   316ab:	90                   	nop
   316ac:	90                   	nop
   316ad:	90                   	nop
   316ae:	90                   	nop
   316af:	90                   	nop

000316b0 <hwint10>:
   316b0:	8b 54 24 0c          	mov    0xc(%esp),%edx
   316b4:	89 15 00 40 03 00    	mov    %edx,0x34000
   316ba:	e8 9a 01 00 00       	call   31859 <save>
   316bf:	e4 21                	in     $0x21,%al
   316c1:	0c 01                	or     $0x1,%al
   316c3:	e6 21                	out    %al,$0x21
   316c5:	b0 20                	mov    $0x20,%al
   316c7:	e6 20                	out    %al,$0x20
   316c9:	fb                   	sti    
   316ca:	ff 15 08 4d 03 00    	call   *0x34d08
   316d0:	fa                   	cli    
   316d1:	e4 21                	in     $0x21,%al
   316d3:	24 fe                	and    $0xfe,%al
   316d5:	e6 21                	out    %al,$0x21
   316d7:	c3                   	ret    
   316d8:	90                   	nop
   316d9:	90                   	nop
   316da:	90                   	nop
   316db:	90                   	nop
   316dc:	90                   	nop
   316dd:	90                   	nop
   316de:	90                   	nop
   316df:	90                   	nop

000316e0 <hwint11>:
   316e0:	8b 54 24 0c          	mov    0xc(%esp),%edx
   316e4:	89 15 00 40 03 00    	mov    %edx,0x34000
   316ea:	e8 6a 01 00 00       	call   31859 <save>
   316ef:	e4 21                	in     $0x21,%al
   316f1:	0c 01                	or     $0x1,%al
   316f3:	e6 21                	out    %al,$0x21
   316f5:	b0 20                	mov    $0x20,%al
   316f7:	e6 20                	out    %al,$0x20
   316f9:	fb                   	sti    
   316fa:	ff 15 0c 4d 03 00    	call   *0x34d0c
   31700:	fa                   	cli    
   31701:	e4 21                	in     $0x21,%al
   31703:	24 fe                	and    $0xfe,%al
   31705:	e6 21                	out    %al,$0x21
   31707:	c3                   	ret    
   31708:	90                   	nop
   31709:	90                   	nop
   3170a:	90                   	nop
   3170b:	90                   	nop
   3170c:	90                   	nop
   3170d:	90                   	nop
   3170e:	90                   	nop
   3170f:	90                   	nop

00031710 <hwint12>:
   31710:	8b 54 24 0c          	mov    0xc(%esp),%edx
   31714:	89 15 00 40 03 00    	mov    %edx,0x34000
   3171a:	e8 3a 01 00 00       	call   31859 <save>
   3171f:	e4 21                	in     $0x21,%al
   31721:	0c 01                	or     $0x1,%al
   31723:	e6 21                	out    %al,$0x21
   31725:	b0 20                	mov    $0x20,%al
   31727:	e6 20                	out    %al,$0x20
   31729:	fb                   	sti    
   3172a:	ff 15 10 4d 03 00    	call   *0x34d10
   31730:	fa                   	cli    
   31731:	e4 21                	in     $0x21,%al
   31733:	24 fe                	and    $0xfe,%al
   31735:	e6 21                	out    %al,$0x21
   31737:	c3                   	ret    
   31738:	90                   	nop
   31739:	90                   	nop
   3173a:	90                   	nop
   3173b:	90                   	nop
   3173c:	90                   	nop
   3173d:	90                   	nop
   3173e:	90                   	nop
   3173f:	90                   	nop

00031740 <hwint13>:
   31740:	8b 54 24 0c          	mov    0xc(%esp),%edx
   31744:	89 15 00 40 03 00    	mov    %edx,0x34000
   3174a:	e8 0a 01 00 00       	call   31859 <save>
   3174f:	e4 21                	in     $0x21,%al
   31751:	0c 01                	or     $0x1,%al
   31753:	e6 21                	out    %al,$0x21
   31755:	b0 20                	mov    $0x20,%al
   31757:	e6 20                	out    %al,$0x20
   31759:	fb                   	sti    
   3175a:	ff 15 14 4d 03 00    	call   *0x34d14
   31760:	fa                   	cli    
   31761:	e4 21                	in     $0x21,%al
   31763:	24 fe                	and    $0xfe,%al
   31765:	e6 21                	out    %al,$0x21
   31767:	c3                   	ret    
   31768:	90                   	nop
   31769:	90                   	nop
   3176a:	90                   	nop
   3176b:	90                   	nop
   3176c:	90                   	nop
   3176d:	90                   	nop
   3176e:	90                   	nop
   3176f:	90                   	nop

00031770 <hwint14>:
   31770:	8b 54 24 0c          	mov    0xc(%esp),%edx
   31774:	89 15 00 40 03 00    	mov    %edx,0x34000
   3177a:	e8 da 00 00 00       	call   31859 <save>
   3177f:	e4 21                	in     $0x21,%al
   31781:	0c 01                	or     $0x1,%al
   31783:	e6 21                	out    %al,$0x21
   31785:	b0 20                	mov    $0x20,%al
   31787:	e6 20                	out    %al,$0x20
   31789:	fb                   	sti    
   3178a:	ff 15 18 4d 03 00    	call   *0x34d18
   31790:	fa                   	cli    
   31791:	e4 21                	in     $0x21,%al
   31793:	24 fe                	and    $0xfe,%al
   31795:	e6 21                	out    %al,$0x21
   31797:	c3                   	ret    
   31798:	90                   	nop
   31799:	90                   	nop
   3179a:	90                   	nop
   3179b:	90                   	nop
   3179c:	90                   	nop
   3179d:	90                   	nop
   3179e:	90                   	nop
   3179f:	90                   	nop

000317a0 <hwint15>:
   317a0:	8b 54 24 0c          	mov    0xc(%esp),%edx
   317a4:	89 15 00 40 03 00    	mov    %edx,0x34000
   317aa:	e8 aa 00 00 00       	call   31859 <save>
   317af:	e4 21                	in     $0x21,%al
   317b1:	0c 01                	or     $0x1,%al
   317b3:	e6 21                	out    %al,$0x21
   317b5:	b0 20                	mov    $0x20,%al
   317b7:	e6 20                	out    %al,$0x20
   317b9:	fb                   	sti    
   317ba:	ff 15 1c 4d 03 00    	call   *0x34d1c
   317c0:	fa                   	cli    
   317c1:	e4 21                	in     $0x21,%al
   317c3:	24 fe                	and    $0xfe,%al
   317c5:	e6 21                	out    %al,$0x21
   317c7:	c3                   	ret    

000317c8 <divide_error>:
   317c8:	6a ff                	push   $0xffffffff
   317ca:	6a 00                	push   $0x0
   317cc:	eb 4e                	jmp    3181c <exception>

000317ce <debug>:
   317ce:	6a ff                	push   $0xffffffff
   317d0:	6a 01                	push   $0x1
   317d2:	eb 48                	jmp    3181c <exception>

000317d4 <nmi>:
   317d4:	6a ff                	push   $0xffffffff
   317d6:	6a 02                	push   $0x2
   317d8:	eb 42                	jmp    3181c <exception>

000317da <int3>:
   317da:	6a ff                	push   $0xffffffff
   317dc:	6a 03                	push   $0x3
   317de:	eb 3c                	jmp    3181c <exception>

000317e0 <overflow>:
   317e0:	6a ff                	push   $0xffffffff
   317e2:	6a 04                	push   $0x4
   317e4:	eb 36                	jmp    3181c <exception>

000317e6 <bounds>:
   317e6:	6a ff                	push   $0xffffffff
   317e8:	6a 05                	push   $0x5
   317ea:	eb 30                	jmp    3181c <exception>

000317ec <invalid_op>:
   317ec:	6a ff                	push   $0xffffffff
   317ee:	6a 06                	push   $0x6
   317f0:	eb 2a                	jmp    3181c <exception>

000317f2 <device_not_available>:
   317f2:	6a ff                	push   $0xffffffff
   317f4:	6a 07                	push   $0x7
   317f6:	eb 24                	jmp    3181c <exception>

000317f8 <doublefault_fn>:
   317f8:	6a 08                	push   $0x8
   317fa:	eb 20                	jmp    3181c <exception>

000317fc <coprocessor_segment_overrun>:
   317fc:	6a ff                	push   $0xffffffff
   317fe:	6a 09                	push   $0x9
   31800:	eb 1a                	jmp    3181c <exception>

00031802 <invalid_tss>:
   31802:	6a 0a                	push   $0xa
   31804:	eb 16                	jmp    3181c <exception>

00031806 <segment_not_present>:
   31806:	6a 0b                	push   $0xb
   31808:	eb 12                	jmp    3181c <exception>

0003180a <stack_segment>:
   3180a:	6a 0c                	push   $0xc
   3180c:	eb 0e                	jmp    3181c <exception>

0003180e <general_protection>:
   3180e:	6a 0d                	push   $0xd
   31810:	eb 0a                	jmp    3181c <exception>

00031812 <page_fault>:
   31812:	6a 0e                	push   $0xe
   31814:	eb 06                	jmp    3181c <exception>

00031816 <coprocessor_error>:
   31816:	6a ff                	push   $0xffffffff
   31818:	6a 10                	push   $0x10
   3181a:	eb 00                	jmp    3181c <exception>

0003181c <exception>:
   3181c:	e8 51 01 00 00       	call   31972 <exception_handler>
   31821:	83 c4 08             	add    $0x8,%esp
   31824:	f4                   	hlt    

00031825 <sys_entry>:
   31825:	e8 2f 00 00 00       	call   31859 <save>
   3182a:	fb                   	sti    
   3182b:	50                   	push   %eax
   3182c:	e8 1d 05 00 00       	call   31d4e <syscall_handler>
   31831:	83 c4 04             	add    $0x4,%esp
   31834:	89 46 2c             	mov    %eax,0x2c(%esi)
   31837:	fa                   	cli    
   31838:	c3                   	ret    

00031839 <restart_thread>:
   31839:	8b 25 00 90 03 00    	mov    0x39000,%esp
   3183f:	8d 44 24 48          	lea    0x48(%esp),%eax
   31843:	a3 64 4c 03 00       	mov    %eax,0x34c64

00031848 <re_entry>:
   31848:	ff 0d 40 4c 03 00    	decl   0x34c40
   3184e:	0f a9                	pop    %gs
   31850:	0f a1                	pop    %fs
   31852:	07                   	pop    %es
   31853:	1f                   	pop    %ds
   31854:	61                   	popa   
   31855:	83 c4 04             	add    $0x4,%esp
   31858:	cf                   	iret   

00031859 <save>:
   31859:	60                   	pusha  
   3185a:	1e                   	push   %ds
   3185b:	06                   	push   %es
   3185c:	0f a0                	push   %fs
   3185e:	0f a8                	push   %gs
   31860:	66 8c d2             	mov    %ss,%dx
   31863:	8e da                	mov    %edx,%ds
   31865:	8e c2                	mov    %edx,%es
   31867:	8e ea                	mov    %edx,%gs
   31869:	89 e6                	mov    %esp,%esi
   3186b:	ff 05 40 4c 03 00    	incl   0x34c40
   31871:	83 3d 40 4c 03 00 00 	cmpl   $0x0,0x34c40
   31878:	75 0d                	jne    31887 <save.1>
   3187a:	bc 01 30 03 00       	mov    $0x33001,%esp
   3187f:	68 39 18 03 00       	push   $0x31839
   31884:	ff 66 30             	jmp    *0x30(%esi)

00031887 <save.1>:
   31887:	68 48 18 03 00       	push   $0x31848
   3188c:	ff 66 30             	jmp    *0x30(%esi)
   3188f:	90                   	nop

00031890 <timer_interrupt>:
   31890:	55                   	push   %ebp
   31891:	89 e5                	mov    %esp,%ebp
   31893:	83 ec 18             	sub    $0x18,%esp
   31896:	e8 3f 05 00 00       	call   31dda <ticks_inc>
   3189b:	a1 40 4c 03 00       	mov    0x34c40,%eax
   318a0:	85 c0                	test   %eax,%eax
   318a2:	74 0c                	je     318b0 <timer_interrupt+0x20>
   318a4:	c7 04 24 e0 1f 03 00 	movl   $0x31fe0,(%esp)
   318ab:	e8 5c 02 00 00       	call   31b0c <printk>
   318b0:	e8 3a f1 ff ff       	call   309ef <current_thread_ticks>
   318b5:	89 c1                	mov    %eax,%ecx
   318b7:	ba 67 66 66 66       	mov    $0x66666667,%edx
   318bc:	89 c8                	mov    %ecx,%eax
   318be:	f7 ea                	imul   %edx
   318c0:	d1 fa                	sar    %edx
   318c2:	89 c8                	mov    %ecx,%eax
   318c4:	c1 f8 1f             	sar    $0x1f,%eax
   318c7:	29 c2                	sub    %eax,%edx
   318c9:	89 d0                	mov    %edx,%eax
   318cb:	c1 e0 02             	shl    $0x2,%eax
   318ce:	01 d0                	add    %edx,%eax
   318d0:	89 ca                	mov    %ecx,%edx
   318d2:	29 c2                	sub    %eax,%edx
   318d4:	83 fa 03             	cmp    $0x3,%edx
   318d7:	7f 0c                	jg     318e5 <timer_interrupt+0x55>
   318d9:	e8 1e f1 ff ff       	call   309fc <current_thread_ticks_inc>
   318de:	b8 01 00 00 00       	mov    $0x1,%eax
   318e3:	eb 14                	jmp    318f9 <timer_interrupt+0x69>
   318e5:	e8 12 f1 ff ff       	call   309fc <current_thread_ticks_inc>
   318ea:	e8 20 f1 ff ff       	call   30a0f <next_thread_to_run>
   318ef:	a3 00 90 03 00       	mov    %eax,0x39000
   318f4:	b8 01 00 00 00       	mov    $0x1,%eax
   318f9:	c9                   	leave  
   318fa:	c3                   	ret    

000318fb <keyboard_interrupt>:
   318fb:	55                   	push   %ebp
   318fc:	89 e5                	mov    %esp,%ebp
   318fe:	83 ec 28             	sub    $0x28,%esp
   31901:	c7 04 24 60 00 00 00 	movl   $0x60,(%esp)
   31908:	e8 91 f3 ff ff       	call   30c9e <inb_pic>
   3190d:	88 45 f7             	mov    %al,-0x9(%ebp)
   31910:	a1 28 b0 03 00       	mov    0x3b028,%eax
   31915:	83 f8 1f             	cmp    $0x1f,%eax
   31918:	7f 3b                	jg     31955 <keyboard_interrupt+0x5a>
   3191a:	a1 20 b0 03 00       	mov    0x3b020,%eax
   3191f:	0f b6 55 f7          	movzbl -0x9(%ebp),%edx
   31923:	88 10                	mov    %dl,(%eax)
   31925:	a1 20 b0 03 00       	mov    0x3b020,%eax
   3192a:	83 c0 01             	add    $0x1,%eax
   3192d:	a3 20 b0 03 00       	mov    %eax,0x3b020
   31932:	a1 20 b0 03 00       	mov    0x3b020,%eax
   31937:	3d 4c b0 03 00       	cmp    $0x3b04c,%eax
   3193c:	75 0a                	jne    31948 <keyboard_interrupt+0x4d>
   3193e:	c7 05 20 b0 03 00 2c 	movl   $0x3b02c,0x3b020
   31945:	b0 03 00 
   31948:	a1 28 b0 03 00       	mov    0x3b028,%eax
   3194d:	83 c0 01             	add    $0x1,%eax
   31950:	a3 28 b0 03 00       	mov    %eax,0x3b028
   31955:	c9                   	leave  
   31956:	c3                   	ret    

00031957 <intr_handler>:
   31957:	55                   	push   %ebp
   31958:	89 e5                	mov    %esp,%ebp
   3195a:	83 ec 18             	sub    $0x18,%esp
   3195d:	8b 45 08             	mov    0x8(%ebp),%eax
   31960:	89 44 24 04          	mov    %eax,0x4(%esp)
   31964:	c7 04 24 e2 1f 03 00 	movl   $0x31fe2,(%esp)
   3196b:	e8 9c 01 00 00       	call   31b0c <printk>
   31970:	c9                   	leave  
   31971:	c3                   	ret    

00031972 <exception_handler>:
   31972:	55                   	push   %ebp
   31973:	89 e5                	mov    %esp,%ebp
   31975:	57                   	push   %edi
   31976:	56                   	push   %esi
   31977:	53                   	push   %ebx
   31978:	83 ec 7c             	sub    $0x7c,%esp
   3197b:	8d 55 94             	lea    -0x6c(%ebp),%edx
   3197e:	bb a0 20 03 00       	mov    $0x320a0,%ebx
   31983:	b8 14 00 00 00       	mov    $0x14,%eax
   31988:	89 d7                	mov    %edx,%edi
   3198a:	89 de                	mov    %ebx,%esi
   3198c:	89 c1                	mov    %eax,%ecx
   3198e:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
   31990:	c7 05 14 30 03 00 00 	movl   $0x0,0x33014
   31997:	00 00 00 
   3199a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
   319a1:	eb 10                	jmp    319b3 <exception_handler+0x41>
   319a3:	c7 04 24 f8 1f 03 00 	movl   $0x31ff8,(%esp)
   319aa:	e8 5d 01 00 00       	call   31b0c <printk>
   319af:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
   319b3:	81 7d e4 8f 01 00 00 	cmpl   $0x18f,-0x1c(%ebp)
   319ba:	7e e7                	jle    319a3 <exception_handler+0x31>
   319bc:	c7 05 14 30 03 00 00 	movl   $0x0,0x33014
   319c3:	00 00 00 
   319c6:	8b 45 08             	mov    0x8(%ebp),%eax
   319c9:	8b 44 85 94          	mov    -0x6c(%ebp,%eax,4),%eax
   319cd:	89 44 24 04          	mov    %eax,0x4(%esp)
   319d1:	c7 04 24 fa 1f 03 00 	movl   $0x31ffa,(%esp)
   319d8:	e8 2f 01 00 00       	call   31b0c <printk>
   319dd:	8b 45 18             	mov    0x18(%ebp),%eax
   319e0:	89 44 24 0c          	mov    %eax,0xc(%esp)
   319e4:	8b 45 14             	mov    0x14(%ebp),%eax
   319e7:	89 44 24 08          	mov    %eax,0x8(%esp)
   319eb:	8b 45 10             	mov    0x10(%ebp),%eax
   319ee:	89 44 24 04          	mov    %eax,0x4(%esp)
   319f2:	c7 04 24 09 20 03 00 	movl   $0x32009,(%esp)
   319f9:	e8 0e 01 00 00       	call   31b0c <printk>
   319fe:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
   31a02:	74 13                	je     31a17 <exception_handler+0xa5>
   31a04:	8b 45 0c             	mov    0xc(%ebp),%eax
   31a07:	89 44 24 04          	mov    %eax,0x4(%esp)
   31a0b:	c7 04 24 25 20 03 00 	movl   $0x32025,(%esp)
   31a12:	e8 f5 00 00 00       	call   31b0c <printk>
   31a17:	83 c4 7c             	add    $0x7c,%esp
   31a1a:	5b                   	pop    %ebx
   31a1b:	5e                   	pop    %esi
   31a1c:	5f                   	pop    %edi
   31a1d:	5d                   	pop    %ebp
   31a1e:	c3                   	ret    

00031a1f <set_irq_handler>:
   31a1f:	55                   	push   %ebp
   31a20:	89 e5                	mov    %esp,%ebp
   31a22:	83 ec 18             	sub    $0x18,%esp
   31a25:	8b 45 08             	mov    0x8(%ebp),%eax
   31a28:	8b 55 0c             	mov    0xc(%ebp),%edx
   31a2b:	89 14 85 e0 4c 03 00 	mov    %edx,0x34ce0(,%eax,4)
   31a32:	8b 45 08             	mov    0x8(%ebp),%eax
   31a35:	89 04 24             	mov    %eax,(%esp)
   31a38:	e8 48 00 00 00       	call   31a85 <enable_irq>
   31a3d:	b8 01 00 00 00       	mov    $0x1,%eax
   31a42:	c9                   	leave  
   31a43:	c3                   	ret    

00031a44 <disable_irq>:
   31a44:	55                   	push   %ebp
   31a45:	89 e5                	mov    %esp,%ebp
   31a47:	83 ec 28             	sub    $0x28,%esp
   31a4a:	c6 45 f7 ff          	movb   $0xff,-0x9(%ebp)
   31a4e:	83 7d 08 07          	cmpl   $0x7,0x8(%ebp)
   31a52:	7f 16                	jg     31a6a <disable_irq+0x26>
   31a54:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
   31a58:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
   31a5f:	00 
   31a60:	89 04 24             	mov    %eax,(%esp)
   31a63:	e8 22 f2 ff ff       	call   30c8a <outb_pic>
   31a68:	eb 14                	jmp    31a7e <disable_irq+0x3a>
   31a6a:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
   31a6e:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
   31a75:	00 
   31a76:	89 04 24             	mov    %eax,(%esp)
   31a79:	e8 0c f2 ff ff       	call   30c8a <outb_pic>
   31a7e:	b8 01 00 00 00       	mov    $0x1,%eax
   31a83:	c9                   	leave  
   31a84:	c3                   	ret    

00031a85 <enable_irq>:
   31a85:	55                   	push   %ebp
   31a86:	89 e5                	mov    %esp,%ebp
   31a88:	53                   	push   %ebx
   31a89:	83 ec 24             	sub    $0x24,%esp
   31a8c:	8b 45 08             	mov    0x8(%ebp),%eax
   31a8f:	89 c2                	mov    %eax,%edx
   31a91:	c1 fa 1f             	sar    $0x1f,%edx
   31a94:	c1 ea 1d             	shr    $0x1d,%edx
   31a97:	01 d0                	add    %edx,%eax
   31a99:	83 e0 07             	and    $0x7,%eax
   31a9c:	29 d0                	sub    %edx,%eax
   31a9e:	ba 01 00 00 00       	mov    $0x1,%edx
   31aa3:	89 d3                	mov    %edx,%ebx
   31aa5:	89 c1                	mov    %eax,%ecx
   31aa7:	d3 e3                	shl    %cl,%ebx
   31aa9:	89 d8                	mov    %ebx,%eax
   31aab:	f7 d0                	not    %eax
   31aad:	88 45 f7             	mov    %al,-0x9(%ebp)
   31ab0:	83 7d 08 07          	cmpl   $0x7,0x8(%ebp)
   31ab4:	7f 16                	jg     31acc <enable_irq+0x47>
   31ab6:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
   31aba:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
   31ac1:	00 
   31ac2:	89 04 24             	mov    %eax,(%esp)
   31ac5:	e8 c0 f1 ff ff       	call   30c8a <outb_pic>
   31aca:	eb 14                	jmp    31ae0 <enable_irq+0x5b>
   31acc:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
   31ad0:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
   31ad7:	00 
   31ad8:	89 04 24             	mov    %eax,(%esp)
   31adb:	e8 aa f1 ff ff       	call   30c8a <outb_pic>
   31ae0:	b8 01 00 00 00       	mov    $0x1,%eax
   31ae5:	83 c4 24             	add    $0x24,%esp
   31ae8:	5b                   	pop    %ebx
   31ae9:	5d                   	pop    %ebp
   31aea:	c3                   	ret    
   31aeb:	90                   	nop

00031aec <print>:
   31aec:	55                   	push   %ebp
   31aed:	89 e5                	mov    %esp,%ebp
   31aef:	83 ec 18             	sub    $0x18,%esp
   31af2:	c7 04 24 79 21 03 00 	movl   $0x32179,(%esp)
   31af9:	e8 0e 00 00 00       	call   31b0c <printk>
   31afe:	c7 04 24 97 21 03 00 	movl   $0x32197,(%esp)
   31b05:	e8 02 00 00 00       	call   31b0c <printk>
   31b0a:	c9                   	leave  
   31b0b:	c3                   	ret    

00031b0c <printk>:
   31b0c:	55                   	push   %ebp
   31b0d:	89 e5                	mov    %esp,%ebp
   31b0f:	81 ec 28 04 00 00    	sub    $0x428,%esp
   31b15:	8d 55 0c             	lea    0xc(%ebp),%edx
   31b18:	8d 85 f0 fb ff ff    	lea    -0x410(%ebp),%eax
   31b1e:	89 10                	mov    %edx,(%eax)
   31b20:	8b 85 f0 fb ff ff    	mov    -0x410(%ebp),%eax
   31b26:	89 44 24 08          	mov    %eax,0x8(%esp)
   31b2a:	8b 45 08             	mov    0x8(%ebp),%eax
   31b2d:	89 44 24 04          	mov    %eax,0x4(%esp)
   31b31:	8d 85 f4 fb ff ff    	lea    -0x40c(%ebp),%eax
   31b37:	89 04 24             	mov    %eax,(%esp)
   31b3a:	e8 2c 00 00 00       	call   31b6b <__vprintf__>
   31b3f:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31b42:	a1 14 30 03 00       	mov    0x33014,%eax
   31b47:	3d 9e 0f 00 00       	cmp    $0xf9e,%eax
   31b4c:	7e 0a                	jle    31b58 <printk+0x4c>
   31b4e:	c7 05 14 30 03 00 00 	movl   $0x0,0x33014
   31b55:	00 00 00 
   31b58:	8d 85 f4 fb ff ff    	lea    -0x40c(%ebp),%eax
   31b5e:	89 04 24             	mov    %eax,(%esp)
   31b61:	e8 aa ef ff ff       	call   30b10 <disp_str>
   31b66:	8b 45 f4             	mov    -0xc(%ebp),%eax
   31b69:	c9                   	leave  
   31b6a:	c3                   	ret    

00031b6b <__vprintf__>:
   31b6b:	55                   	push   %ebp
   31b6c:	89 e5                	mov    %esp,%ebp
   31b6e:	83 ec 30             	sub    $0x30,%esp
   31b71:	8b 45 0c             	mov    0xc(%ebp),%eax
   31b74:	89 45 fc             	mov    %eax,-0x4(%ebp)
   31b77:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
   31b7e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   31b85:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
   31b8c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
   31b93:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
   31b9a:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
   31ba1:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
   31ba8:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
   31bae:	e9 72 01 00 00       	jmp    31d25 <__vprintf__+0x1ba>
   31bb3:	8b 45 fc             	mov    -0x4(%ebp),%eax
   31bb6:	0f b6 00             	movzbl (%eax),%eax
   31bb9:	3c 25                	cmp    $0x25,%al
   31bbb:	0f 85 4e 01 00 00    	jne    31d0f <__vprintf__+0x1a4>
   31bc1:	8b 45 fc             	mov    -0x4(%ebp),%eax
   31bc4:	83 c0 01             	add    $0x1,%eax
   31bc7:	0f b6 00             	movzbl (%eax),%eax
   31bca:	0f be c0             	movsbl %al,%eax
   31bcd:	83 f8 64             	cmp    $0x64,%eax
   31bd0:	74 3e                	je     31c10 <__vprintf__+0xa5>
   31bd2:	83 f8 73             	cmp    $0x73,%eax
   31bd5:	0f 84 fa 00 00 00    	je     31cd5 <__vprintf__+0x16a>
   31bdb:	83 f8 63             	cmp    $0x63,%eax
   31bde:	0f 85 39 01 00 00    	jne    31d1d <__vprintf__+0x1b2>
   31be4:	8b 45 10             	mov    0x10(%ebp),%eax
   31be7:	8d 50 04             	lea    0x4(%eax),%edx
   31bea:	89 55 10             	mov    %edx,0x10(%ebp)
   31bed:	8b 00                	mov    (%eax),%eax
   31bef:	89 45 f0             	mov    %eax,-0x10(%ebp)
   31bf2:	8b 45 f8             	mov    -0x8(%ebp),%eax
   31bf5:	03 45 08             	add    0x8(%ebp),%eax
   31bf8:	8b 55 f0             	mov    -0x10(%ebp),%edx
   31bfb:	8b 14 95 20 30 03 00 	mov    0x33020(,%edx,4),%edx
   31c02:	0f b6 12             	movzbl (%edx),%edx
   31c05:	88 10                	mov    %dl,(%eax)
   31c07:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   31c0b:	e9 0d 01 00 00       	jmp    31d1d <__vprintf__+0x1b2>
   31c10:	8b 45 10             	mov    0x10(%ebp),%eax
   31c13:	8d 50 04             	lea    0x4(%eax),%edx
   31c16:	89 55 10             	mov    %edx,0x10(%ebp)
   31c19:	8b 00                	mov    (%eax),%eax
   31c1b:	89 45 f0             	mov    %eax,-0x10(%ebp)
   31c1e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
   31c25:	8b 4d f0             	mov    -0x10(%ebp),%ecx
   31c28:	ba 67 66 66 66       	mov    $0x66666667,%edx
   31c2d:	89 c8                	mov    %ecx,%eax
   31c2f:	f7 ea                	imul   %edx
   31c31:	c1 fa 02             	sar    $0x2,%edx
   31c34:	89 c8                	mov    %ecx,%eax
   31c36:	c1 f8 1f             	sar    $0x1f,%eax
   31c39:	29 c2                	sub    %eax,%edx
   31c3b:	89 d0                	mov    %edx,%eax
   31c3d:	c1 e0 02             	shl    $0x2,%eax
   31c40:	01 d0                	add    %edx,%eax
   31c42:	01 c0                	add    %eax,%eax
   31c44:	89 ca                	mov    %ecx,%edx
   31c46:	29 c2                	sub    %eax,%edx
   31c48:	8d 42 30             	lea    0x30(%edx),%eax
   31c4b:	8b 04 85 20 30 03 00 	mov    0x33020(,%eax,4),%eax
   31c52:	0f b6 10             	movzbl (%eax),%edx
   31c55:	8d 45 de             	lea    -0x22(%ebp),%eax
   31c58:	03 45 ec             	add    -0x14(%ebp),%eax
   31c5b:	88 10                	mov    %dl,(%eax)
   31c5d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
   31c61:	8b 4d f0             	mov    -0x10(%ebp),%ecx
   31c64:	ba 67 66 66 66       	mov    $0x66666667,%edx
   31c69:	89 c8                	mov    %ecx,%eax
   31c6b:	f7 ea                	imul   %edx
   31c6d:	c1 fa 02             	sar    $0x2,%edx
   31c70:	89 c8                	mov    %ecx,%eax
   31c72:	c1 f8 1f             	sar    $0x1f,%eax
   31c75:	89 d1                	mov    %edx,%ecx
   31c77:	29 c1                	sub    %eax,%ecx
   31c79:	89 c8                	mov    %ecx,%eax
   31c7b:	89 45 f0             	mov    %eax,-0x10(%ebp)
   31c7e:	8b 4d f0             	mov    -0x10(%ebp),%ecx
   31c81:	ba 67 66 66 66       	mov    $0x66666667,%edx
   31c86:	89 c8                	mov    %ecx,%eax
   31c88:	f7 ea                	imul   %edx
   31c8a:	c1 fa 02             	sar    $0x2,%edx
   31c8d:	89 c8                	mov    %ecx,%eax
   31c8f:	c1 f8 1f             	sar    $0x1f,%eax
   31c92:	29 c2                	sub    %eax,%edx
   31c94:	89 d0                	mov    %edx,%eax
   31c96:	c1 e0 02             	shl    $0x2,%eax
   31c99:	01 d0                	add    %edx,%eax
   31c9b:	01 c0                	add    %eax,%eax
   31c9d:	89 ca                	mov    %ecx,%edx
   31c9f:	29 c2                	sub    %eax,%edx
   31ca1:	85 d2                	test   %edx,%edx
   31ca3:	75 80                	jne    31c25 <__vprintf__+0xba>
   31ca5:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
   31ca9:	eb 19                	jmp    31cc4 <__vprintf__+0x159>
   31cab:	8b 45 f8             	mov    -0x8(%ebp),%eax
   31cae:	03 45 08             	add    0x8(%ebp),%eax
   31cb1:	8d 55 de             	lea    -0x22(%ebp),%edx
   31cb4:	03 55 ec             	add    -0x14(%ebp),%edx
   31cb7:	0f b6 12             	movzbl (%edx),%edx
   31cba:	88 10                	mov    %dl,(%eax)
   31cbc:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
   31cc0:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
   31cc4:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
   31cc8:	79 e1                	jns    31cab <__vprintf__+0x140>
   31cca:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
   31cce:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   31cd2:	90                   	nop
   31cd3:	eb 48                	jmp    31d1d <__vprintf__+0x1b2>
   31cd5:	8b 45 10             	mov    0x10(%ebp),%eax
   31cd8:	8d 50 04             	lea    0x4(%eax),%edx
   31cdb:	89 55 10             	mov    %edx,0x10(%ebp)
   31cde:	8b 00                	mov    (%eax),%eax
   31ce0:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31ce3:	eb 16                	jmp    31cfb <__vprintf__+0x190>
   31ce5:	8b 45 f8             	mov    -0x8(%ebp),%eax
   31ce8:	03 45 08             	add    0x8(%ebp),%eax
   31ceb:	8b 55 f4             	mov    -0xc(%ebp),%edx
   31cee:	0f b6 12             	movzbl (%edx),%edx
   31cf1:	88 10                	mov    %dl,(%eax)
   31cf3:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
   31cf7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   31cfb:	8b 45 f4             	mov    -0xc(%ebp),%eax
   31cfe:	0f b6 00             	movzbl (%eax),%eax
   31d01:	84 c0                	test   %al,%al
   31d03:	75 e0                	jne    31ce5 <__vprintf__+0x17a>
   31d05:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
   31d09:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   31d0d:	eb 0e                	jmp    31d1d <__vprintf__+0x1b2>
   31d0f:	8b 45 f8             	mov    -0x8(%ebp),%eax
   31d12:	03 45 08             	add    0x8(%ebp),%eax
   31d15:	8b 55 fc             	mov    -0x4(%ebp),%edx
   31d18:	0f b6 12             	movzbl (%edx),%edx
   31d1b:	88 10                	mov    %dl,(%eax)
   31d1d:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
   31d21:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   31d25:	8b 45 fc             	mov    -0x4(%ebp),%eax
   31d28:	0f b6 00             	movzbl (%eax),%eax
   31d2b:	84 c0                	test   %al,%al
   31d2d:	0f 85 80 fe ff ff    	jne    31bb3 <__vprintf__+0x48>
   31d33:	8b 45 f8             	mov    -0x8(%ebp),%eax
   31d36:	03 45 08             	add    0x8(%ebp),%eax
   31d39:	c6 00 00             	movb   $0x0,(%eax)
   31d3c:	b8 01 00 00 00       	mov    $0x1,%eax
   31d41:	c9                   	leave  
   31d42:	c3                   	ret    
   31d43:	90                   	nop

00031d44 <sys_get_ticks>:
   31d44:	55                   	push   %ebp
   31d45:	89 e5                	mov    %esp,%ebp
   31d47:	a1 14 b0 03 00       	mov    0x3b014,%eax
   31d4c:	5d                   	pop    %ebp
   31d4d:	c3                   	ret    

00031d4e <syscall_handler>:
   31d4e:	55                   	push   %ebp
   31d4f:	89 e5                	mov    %esp,%ebp
   31d51:	8b 45 08             	mov    0x8(%ebp),%eax
   31d54:	85 c0                	test   %eax,%eax
   31d56:	75 07                	jne    31d5f <syscall_handler+0x11>
   31d58:	e8 e7 ff ff ff       	call   31d44 <sys_get_ticks>
   31d5d:	eb 01                	jmp    31d60 <syscall_handler+0x12>
   31d5f:	90                   	nop
   31d60:	5d                   	pop    %ebp
   31d61:	c3                   	ret    
   31d62:	90                   	nop
   31d63:	90                   	nop
   31d64:	90                   	nop
   31d65:	90                   	nop
   31d66:	90                   	nop
   31d67:	90                   	nop
   31d68:	90                   	nop
   31d69:	90                   	nop
   31d6a:	90                   	nop
   31d6b:	90                   	nop
   31d6c:	90                   	nop
   31d6d:	90                   	nop
   31d6e:	90                   	nop
   31d6f:	90                   	nop

00031d70 <system_call>:
   31d70:	8b 44 24 04          	mov    0x4(%esp),%eax
   31d74:	cd 80                	int    $0x80
   31d76:	c3                   	ret    
   31d77:	90                   	nop

00031d78 <init_timer>:
   31d78:	55                   	push   %ebp
   31d79:	89 e5                	mov    %esp,%ebp
   31d7b:	83 ec 18             	sub    $0x18,%esp
   31d7e:	c7 05 14 b0 03 00 00 	movl   $0x0,0x3b014
   31d85:	00 00 00 
   31d88:	c7 44 24 04 43 00 00 	movl   $0x43,0x4(%esp)
   31d8f:	00 
   31d90:	c7 04 24 34 00 00 00 	movl   $0x34,(%esp)
   31d97:	e8 ee ee ff ff       	call   30c8a <outb_pic>
   31d9c:	c7 44 24 04 40 00 00 	movl   $0x40,0x4(%esp)
   31da3:	00 
   31da4:	c7 04 24 9b 00 00 00 	movl   $0x9b,(%esp)
   31dab:	e8 da ee ff ff       	call   30c8a <outb_pic>
   31db0:	c7 44 24 04 40 00 00 	movl   $0x40,0x4(%esp)
   31db7:	00 
   31db8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
   31dbf:	e8 c6 ee ff ff       	call   30c8a <outb_pic>
   31dc4:	c7 44 24 04 90 18 03 	movl   $0x31890,0x4(%esp)
   31dcb:	00 
   31dcc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
   31dd3:	e8 47 fc ff ff       	call   31a1f <set_irq_handler>
   31dd8:	c9                   	leave  
   31dd9:	c3                   	ret    

00031dda <ticks_inc>:
   31dda:	55                   	push   %ebp
   31ddb:	89 e5                	mov    %esp,%ebp
   31ddd:	a1 14 b0 03 00       	mov    0x3b014,%eax
   31de2:	3d fa ff 00 00       	cmp    $0xfffa,%eax
   31de7:	76 0c                	jbe    31df5 <ticks_inc+0x1b>
   31de9:	c7 05 14 b0 03 00 00 	movl   $0x0,0x3b014
   31df0:	00 00 00 
   31df3:	eb 0d                	jmp    31e02 <ticks_inc+0x28>
   31df5:	a1 14 b0 03 00       	mov    0x3b014,%eax
   31dfa:	83 c0 01             	add    $0x1,%eax
   31dfd:	a3 14 b0 03 00       	mov    %eax,0x3b014
   31e02:	5d                   	pop    %ebp
   31e03:	c3                   	ret    

00031e04 <init_keybord>:
   31e04:	55                   	push   %ebp
   31e05:	89 e5                	mov    %esp,%ebp
   31e07:	83 ec 18             	sub    $0x18,%esp
   31e0a:	c7 05 28 b0 03 00 00 	movl   $0x0,0x3b028
   31e11:	00 00 00 
   31e14:	c7 05 24 b0 03 00 2c 	movl   $0x3b02c,0x3b024
   31e1b:	b0 03 00 
   31e1e:	a1 24 b0 03 00       	mov    0x3b024,%eax
   31e23:	a3 20 b0 03 00       	mov    %eax,0x3b020
   31e28:	c7 44 24 04 fb 18 03 	movl   $0x318fb,0x4(%esp)
   31e2f:	00 
   31e30:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
   31e37:	e8 e3 fb ff ff       	call   31a1f <set_irq_handler>
   31e3c:	c9                   	leave  
   31e3d:	c3                   	ret    

00031e3e <keyboard_read>:
   31e3e:	55                   	push   %ebp
   31e3f:	89 e5                	mov    %esp,%ebp
   31e41:	83 ec 28             	sub    $0x28,%esp
   31e44:	c6 45 ee 00          	movb   $0x0,-0x12(%ebp)
   31e48:	c6 45 ef 00          	movb   $0x0,-0x11(%ebp)
   31e4c:	a1 28 b0 03 00       	mov    0x3b028,%eax
   31e51:	85 c0                	test   %eax,%eax
   31e53:	0f 8e 80 00 00 00    	jle    31ed9 <keyboard_read+0x9b>
   31e59:	a1 24 b0 03 00       	mov    0x3b024,%eax
   31e5e:	0f b6 00             	movzbl (%eax),%eax
   31e61:	88 45 f7             	mov    %al,-0x9(%ebp)
   31e64:	a1 24 b0 03 00       	mov    0x3b024,%eax
   31e69:	83 c0 01             	add    $0x1,%eax
   31e6c:	a3 24 b0 03 00       	mov    %eax,0x3b024
   31e71:	a1 24 b0 03 00       	mov    0x3b024,%eax
   31e76:	3d 4c b0 03 00       	cmp    $0x3b04c,%eax
   31e7b:	75 0a                	jne    31e87 <keyboard_read+0x49>
   31e7d:	c7 05 24 b0 03 00 2c 	movl   $0x3b02c,0x3b024
   31e84:	b0 03 00 
   31e87:	a1 28 b0 03 00       	mov    0x3b028,%eax
   31e8c:	83 e8 01             	sub    $0x1,%eax
   31e8f:	a3 28 b0 03 00       	mov    %eax,0x3b028
   31e94:	80 7d f7 e1          	cmpb   $0xe1,-0x9(%ebp)
   31e98:	74 3f                	je     31ed9 <keyboard_read+0x9b>
   31e9a:	80 7d f7 e0          	cmpb   $0xe0,-0x9(%ebp)
   31e9e:	74 39                	je     31ed9 <keyboard_read+0x9b>
   31ea0:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
   31ea4:	0f be c0             	movsbl %al,%eax
   31ea7:	f7 d0                	not    %eax
   31ea9:	c1 e8 1f             	shr    $0x1f,%eax
   31eac:	89 45 f0             	mov    %eax,-0x10(%ebp)
   31eaf:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
   31eb3:	74 24                	je     31ed9 <keyboard_read+0x9b>
   31eb5:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
   31eb9:	89 c2                	mov    %eax,%edx
   31ebb:	83 e2 7f             	and    $0x7f,%edx
   31ebe:	89 d0                	mov    %edx,%eax
   31ec0:	01 c0                	add    %eax,%eax
   31ec2:	01 d0                	add    %edx,%eax
   31ec4:	8b 04 85 20 32 03 00 	mov    0x33220(,%eax,4),%eax
   31ecb:	88 45 ee             	mov    %al,-0x12(%ebp)
   31ece:	8d 45 ee             	lea    -0x12(%ebp),%eax
   31ed1:	89 04 24             	mov    %eax,(%esp)
   31ed4:	e8 37 ec ff ff       	call   30b10 <disp_str>
   31ed9:	c9                   	leave  
   31eda:	c3                   	ret    
