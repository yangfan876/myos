
kernel.bin:     file format elf32-i386


Disassembly of section .text:

00030400 <_start>:
   30400:	bc 01 20 03 00       	mov    $0x32001,%esp
   30405:	0f 01 05 0a 00 05 00 	sgdtl  0x5000a
   3040c:	e8 0b 00 00 00       	call   3041c <__init__>
   30411:	fb                   	sti    
   30412:	e8 c1 11 00 00       	call   315d8 <restart_thread>
   30417:	eb fe                	jmp    30417 <_start+0x17>
   30419:	90                   	nop
   3041a:	90                   	nop
   3041b:	90                   	nop

0003041c <__init__>:
   3041c:	55                   	push   %ebp
   3041d:	89 e5                	mov    %esp,%ebp
   3041f:	83 ec 28             	sub    $0x28,%esp
   30422:	e8 71 07 00 00       	call   30b98 <change_gdt>
   30427:	c7 05 0c 20 03 00 00 	movl   $0x0,0x3200c
   3042e:	00 00 00 
   30431:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   30438:	eb 10                	jmp    3044a <__init__+0x2e>
   3043a:	c7 04 24 e0 18 03 00 	movl   $0x318e0,(%esp)
   30441:	e8 5a 12 00 00       	call   316a0 <printk>
   30446:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   3044a:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
   30451:	7e e7                	jle    3043a <__init__+0x1e>
   30453:	c7 05 0c 20 03 00 00 	movl   $0x0,0x3200c
   3045a:	00 00 00 
   3045d:	c7 04 24 e2 18 03 00 	movl   $0x318e2,(%esp)
   30464:	e8 37 12 00 00       	call   316a0 <printk>
   30469:	e8 0e 06 00 00       	call   30a7c <init_8259A>
   3046e:	c7 04 24 fc 18 03 00 	movl   $0x318fc,(%esp)
   30475:	e8 26 12 00 00       	call   316a0 <printk>
   3047a:	e8 a9 08 00 00       	call   30d28 <init_idt>
   3047f:	c7 04 24 15 19 03 00 	movl   $0x31915,(%esp)
   30486:	e8 15 12 00 00       	call   316a0 <printk>
   3048b:	e8 83 02 00 00       	call   30713 <init_first_thread>
   30490:	c7 04 24 2c 19 03 00 	movl   $0x3192c,(%esp)
   30497:	e8 04 12 00 00       	call   316a0 <printk>
   3049c:	e8 f8 02 00 00       	call   30799 <init_second_thread>
   304a1:	c7 04 24 4c 19 03 00 	movl   $0x3194c,(%esp)
   304a8:	e8 f3 11 00 00       	call   316a0 <printk>
   304ad:	e8 41 03 00 00       	call   307f3 <init_third_thread>
   304b2:	c7 04 24 6c 19 03 00 	movl   $0x3196c,(%esp)
   304b9:	e8 e2 11 00 00       	call   316a0 <printk>
   304be:	c7 04 24 8b 19 03 00 	movl   $0x3198b,(%esp)
   304c5:	e8 d6 11 00 00       	call   316a0 <printk>
   304ca:	c7 44 24 04 ff 00 00 	movl   $0xff,0x4(%esp)
   304d1:	00 
   304d2:	c7 04 24 fe 00 00 00 	movl   $0xfe,(%esp)
   304d9:	e8 6e 06 00 00       	call   30b4c <op_8259A>
   304de:	e8 30 05 00 00       	call   30a13 <run_first_thread>
   304e3:	c9                   	leave  
   304e4:	c3                   	ret    
   304e5:	90                   	nop
   304e6:	90                   	nop
   304e7:	90                   	nop

000304e8 <strncpy>:
   304e8:	55                   	push   %ebp
   304e9:	89 e5                	mov    %esp,%ebp
   304eb:	83 ec 10             	sub    $0x10,%esp
   304ee:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
   304f5:	eb 19                	jmp    30510 <strncpy+0x28>
   304f7:	8b 45 fc             	mov    -0x4(%ebp),%eax
   304fa:	8b 55 08             	mov    0x8(%ebp),%edx
   304fd:	01 c2                	add    %eax,%edx
   304ff:	8b 45 fc             	mov    -0x4(%ebp),%eax
   30502:	8b 4d 0c             	mov    0xc(%ebp),%ecx
   30505:	01 c8                	add    %ecx,%eax
   30507:	0f b6 00             	movzbl (%eax),%eax
   3050a:	88 02                	mov    %al,(%edx)
   3050c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   30510:	8b 45 fc             	mov    -0x4(%ebp),%eax
   30513:	3b 45 10             	cmp    0x10(%ebp),%eax
   30516:	73 20                	jae    30538 <strncpy+0x50>
   30518:	8b 45 fc             	mov    -0x4(%ebp),%eax
   3051b:	8b 55 0c             	mov    0xc(%ebp),%edx
   3051e:	01 d0                	add    %edx,%eax
   30520:	0f b6 00             	movzbl (%eax),%eax
   30523:	84 c0                	test   %al,%al
   30525:	75 d0                	jne    304f7 <strncpy+0xf>
   30527:	eb 0f                	jmp    30538 <strncpy+0x50>
   30529:	8b 45 fc             	mov    -0x4(%ebp),%eax
   3052c:	8b 55 08             	mov    0x8(%ebp),%edx
   3052f:	01 d0                	add    %edx,%eax
   30531:	c6 00 00             	movb   $0x0,(%eax)
   30534:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   30538:	8b 45 fc             	mov    -0x4(%ebp),%eax
   3053b:	3b 45 10             	cmp    0x10(%ebp),%eax
   3053e:	72 e9                	jb     30529 <strncpy+0x41>
   30540:	b8 01 00 00 00       	mov    $0x1,%eax
   30545:	c9                   	leave  
   30546:	c3                   	ret    

00030547 <testA>:
   30547:	55                   	push   %ebp
   30548:	89 e5                	mov    %esp,%ebp
   3054a:	83 ec 18             	sub    $0x18,%esp
   3054d:	c7 04 24 a9 19 03 00 	movl   $0x319a9,(%esp)
   30554:	e8 47 11 00 00       	call   316a0 <printk>
   30559:	b8 ad 05 03 00       	mov    $0x305ad,%eax
   3055e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
   30565:	ff d0                	call   *%eax
   30567:	eb e4                	jmp    3054d <testA+0x6>

00030569 <testB>:
   30569:	55                   	push   %ebp
   3056a:	89 e5                	mov    %esp,%ebp
   3056c:	83 ec 18             	sub    $0x18,%esp
   3056f:	c7 04 24 ab 19 03 00 	movl   $0x319ab,(%esp)
   30576:	e8 25 11 00 00       	call   316a0 <printk>
   3057b:	b8 ad 05 03 00       	mov    $0x305ad,%eax
   30580:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
   30587:	ff d0                	call   *%eax
   30589:	eb e4                	jmp    3056f <testB+0x6>

0003058b <testC>:
   3058b:	55                   	push   %ebp
   3058c:	89 e5                	mov    %esp,%ebp
   3058e:	83 ec 18             	sub    $0x18,%esp
   30591:	c7 04 24 ad 19 03 00 	movl   $0x319ad,(%esp)
   30598:	e8 03 11 00 00       	call   316a0 <printk>
   3059d:	b8 ad 05 03 00       	mov    $0x305ad,%eax
   305a2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
   305a9:	ff d0                	call   *%eax
   305ab:	eb e4                	jmp    30591 <testC+0x6>

000305ad <wait>:
   305ad:	55                   	push   %ebp
   305ae:	89 e5                	mov    %esp,%ebp
   305b0:	83 ec 10             	sub    $0x10,%esp
   305b3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
   305ba:	eb 30                	jmp    305ec <wait+0x3f>
   305bc:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
   305c3:	eb 1a                	jmp    305df <wait+0x32>
   305c5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   305cc:	eb 04                	jmp    305d2 <wait+0x25>
   305ce:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   305d2:	81 7d f4 f3 01 00 00 	cmpl   $0x1f3,-0xc(%ebp)
   305d9:	7e f3                	jle    305ce <wait+0x21>
   305db:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
   305df:	81 7d f8 87 13 00 00 	cmpl   $0x1387,-0x8(%ebp)
   305e6:	7e dd                	jle    305c5 <wait+0x18>
   305e8:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   305ec:	8b 55 08             	mov    0x8(%ebp),%edx
   305ef:	89 d0                	mov    %edx,%eax
   305f1:	01 c0                	add    %eax,%eax
   305f3:	01 d0                	add    %edx,%eax
   305f5:	3b 45 fc             	cmp    -0x4(%ebp),%eax
   305f8:	7f c2                	jg     305bc <wait+0xf>
   305fa:	c9                   	leave  
   305fb:	c3                   	ret    

000305fc <list_init>:
   305fc:	55                   	push   %ebp
   305fd:	89 e5                	mov    %esp,%ebp
   305ff:	8b 45 08             	mov    0x8(%ebp),%eax
   30602:	8d 50 08             	lea    0x8(%eax),%edx
   30605:	8b 45 08             	mov    0x8(%ebp),%eax
   30608:	89 50 04             	mov    %edx,0x4(%eax)
   3060b:	8b 45 08             	mov    0x8(%ebp),%eax
   3060e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
   30614:	8b 55 08             	mov    0x8(%ebp),%edx
   30617:	8b 45 08             	mov    0x8(%ebp),%eax
   3061a:	89 50 08             	mov    %edx,0x8(%eax)
   3061d:	8b 45 08             	mov    0x8(%ebp),%eax
   30620:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
   30627:	b8 01 00 00 00       	mov    $0x1,%eax
   3062c:	5d                   	pop    %ebp
   3062d:	c3                   	ret    

0003062e <list_empty>:
   3062e:	55                   	push   %ebp
   3062f:	89 e5                	mov    %esp,%ebp
   30631:	8b 45 08             	mov    0x8(%ebp),%eax
   30634:	8b 40 04             	mov    0x4(%eax),%eax
   30637:	8b 55 08             	mov    0x8(%ebp),%edx
   3063a:	83 c2 08             	add    $0x8,%edx
   3063d:	39 d0                	cmp    %edx,%eax
   3063f:	75 14                	jne    30655 <list_empty+0x27>
   30641:	8b 45 08             	mov    0x8(%ebp),%eax
   30644:	8b 50 08             	mov    0x8(%eax),%edx
   30647:	8b 45 08             	mov    0x8(%ebp),%eax
   3064a:	39 c2                	cmp    %eax,%edx
   3064c:	75 07                	jne    30655 <list_empty+0x27>
   3064e:	b8 01 00 00 00       	mov    $0x1,%eax
   30653:	eb 05                	jmp    3065a <list_empty+0x2c>
   30655:	b8 00 00 00 00       	mov    $0x0,%eax
   3065a:	5d                   	pop    %ebp
   3065b:	c3                   	ret    

0003065c <list_insert_next>:
   3065c:	55                   	push   %ebp
   3065d:	89 e5                	mov    %esp,%ebp
   3065f:	8b 45 08             	mov    0x8(%ebp),%eax
   30662:	8b 50 04             	mov    0x4(%eax),%edx
   30665:	8b 45 0c             	mov    0xc(%ebp),%eax
   30668:	89 50 04             	mov    %edx,0x4(%eax)
   3066b:	8b 45 0c             	mov    0xc(%ebp),%eax
   3066e:	8b 55 08             	mov    0x8(%ebp),%edx
   30671:	89 10                	mov    %edx,(%eax)
   30673:	8b 45 08             	mov    0x8(%ebp),%eax
   30676:	8b 40 04             	mov    0x4(%eax),%eax
   30679:	8b 55 0c             	mov    0xc(%ebp),%edx
   3067c:	89 10                	mov    %edx,(%eax)
   3067e:	8b 45 08             	mov    0x8(%ebp),%eax
   30681:	8b 55 0c             	mov    0xc(%ebp),%edx
   30684:	89 50 04             	mov    %edx,0x4(%eax)
   30687:	b8 01 00 00 00       	mov    $0x1,%eax
   3068c:	5d                   	pop    %ebp
   3068d:	c3                   	ret    

0003068e <list_insert_prev>:
   3068e:	55                   	push   %ebp
   3068f:	89 e5                	mov    %esp,%ebp
   30691:	8b 45 08             	mov    0x8(%ebp),%eax
   30694:	8b 55 0c             	mov    0xc(%ebp),%edx
   30697:	89 50 04             	mov    %edx,0x4(%eax)
   3069a:	8b 45 0c             	mov    0xc(%ebp),%eax
   3069d:	8b 10                	mov    (%eax),%edx
   3069f:	8b 45 08             	mov    0x8(%ebp),%eax
   306a2:	89 10                	mov    %edx,(%eax)
   306a4:	8b 45 0c             	mov    0xc(%ebp),%eax
   306a7:	8b 00                	mov    (%eax),%eax
   306a9:	8b 55 08             	mov    0x8(%ebp),%edx
   306ac:	89 50 04             	mov    %edx,0x4(%eax)
   306af:	8b 45 0c             	mov    0xc(%ebp),%eax
   306b2:	8b 55 08             	mov    0x8(%ebp),%edx
   306b5:	89 10                	mov    %edx,(%eax)
   306b7:	b8 01 00 00 00       	mov    $0x1,%eax
   306bc:	5d                   	pop    %ebp
   306bd:	c3                   	ret    

000306be <list_insert_back>:
   306be:	55                   	push   %ebp
   306bf:	89 e5                	mov    %esp,%ebp
   306c1:	83 ec 08             	sub    $0x8,%esp
   306c4:	8b 45 0c             	mov    0xc(%ebp),%eax
   306c7:	83 c0 08             	add    $0x8,%eax
   306ca:	89 44 24 04          	mov    %eax,0x4(%esp)
   306ce:	8b 45 08             	mov    0x8(%ebp),%eax
   306d1:	89 04 24             	mov    %eax,(%esp)
   306d4:	e8 b5 ff ff ff       	call   3068e <list_insert_prev>
   306d9:	c9                   	leave  
   306da:	c3                   	ret    

000306db <list_remove>:
   306db:	55                   	push   %ebp
   306dc:	89 e5                	mov    %esp,%ebp
   306de:	8b 45 08             	mov    0x8(%ebp),%eax
   306e1:	8b 00                	mov    (%eax),%eax
   306e3:	8b 55 08             	mov    0x8(%ebp),%edx
   306e6:	8b 52 04             	mov    0x4(%edx),%edx
   306e9:	89 50 04             	mov    %edx,0x4(%eax)
   306ec:	8b 45 08             	mov    0x8(%ebp),%eax
   306ef:	8b 40 04             	mov    0x4(%eax),%eax
   306f2:	8b 55 08             	mov    0x8(%ebp),%edx
   306f5:	8b 12                	mov    (%edx),%edx
   306f7:	89 10                	mov    %edx,(%eax)
   306f9:	8b 45 08             	mov    0x8(%ebp),%eax
   306fc:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
   30703:	8b 45 08             	mov    0x8(%ebp),%eax
   30706:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
   3070c:	b8 01 00 00 00       	mov    $0x1,%eax
   30711:	5d                   	pop    %ebp
   30712:	c3                   	ret    

00030713 <init_first_thread>:
   30713:	55                   	push   %ebp
   30714:	89 e5                	mov    %esp,%ebp
   30716:	83 ec 28             	sub    $0x28,%esp
   30719:	c7 04 24 00 30 03 00 	movl   $0x33000,(%esp)
   30720:	e8 d7 fe ff ff       	call   305fc <list_init>
   30725:	c7 04 24 10 30 03 00 	movl   $0x33010,(%esp)
   3072c:	e8 cb fe ff ff       	call   305fc <list_init>
   30731:	c7 44 24 0c 47 05 03 	movl   $0x30547,0xc(%esp)
   30738:	00 
   30739:	c7 44 24 08 af 19 03 	movl   $0x319af,0x8(%esp)
   30740:	00 
   30741:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
   30748:	00 
   30749:	c7 04 24 00 e0 03 00 	movl   $0x3e000,(%esp)
   30750:	e8 f8 00 00 00       	call   3084d <init_thread>
   30755:	89 45 f4             	mov    %eax,-0xc(%ebp)
   30758:	c7 44 24 04 00 90 00 	movl   $0x9000,0x4(%esp)
   3075f:	00 
   30760:	c7 04 24 b5 19 03 00 	movl   $0x319b5,(%esp)
   30767:	e8 34 0f 00 00       	call   316a0 <printk>
   3076c:	c7 44 24 04 10 30 03 	movl   $0x33010,0x4(%esp)
   30773:	00 
   30774:	c7 04 24 6c e0 03 00 	movl   $0x3e06c,(%esp)
   3077b:	e8 00 02 00 00       	call   30980 <list_insert_by_pri>
   30780:	c7 44 24 04 00 30 03 	movl   $0x33000,0x4(%esp)
   30787:	00 
   30788:	c7 04 24 74 e0 03 00 	movl   $0x3e074,(%esp)
   3078f:	e8 2a ff ff ff       	call   306be <list_insert_back>
   30794:	8b 45 f4             	mov    -0xc(%ebp),%eax
   30797:	c9                   	leave  
   30798:	c3                   	ret    

00030799 <init_second_thread>:
   30799:	55                   	push   %ebp
   3079a:	89 e5                	mov    %esp,%ebp
   3079c:	83 ec 28             	sub    $0x28,%esp
   3079f:	c7 44 24 0c 69 05 03 	movl   $0x30569,0xc(%esp)
   307a6:	00 
   307a7:	c7 44 24 08 b9 19 03 	movl   $0x319b9,0x8(%esp)
   307ae:	00 
   307af:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
   307b6:	00 
   307b7:	c7 04 24 00 40 03 00 	movl   $0x34000,(%esp)
   307be:	e8 8a 00 00 00       	call   3084d <init_thread>
   307c3:	89 45 f4             	mov    %eax,-0xc(%ebp)
   307c6:	c7 44 24 04 10 30 03 	movl   $0x33010,0x4(%esp)
   307cd:	00 
   307ce:	c7 04 24 6c 40 03 00 	movl   $0x3406c,(%esp)
   307d5:	e8 a6 01 00 00       	call   30980 <list_insert_by_pri>
   307da:	c7 44 24 04 00 30 03 	movl   $0x33000,0x4(%esp)
   307e1:	00 
   307e2:	c7 04 24 74 40 03 00 	movl   $0x34074,(%esp)
   307e9:	e8 d0 fe ff ff       	call   306be <list_insert_back>
   307ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
   307f1:	c9                   	leave  
   307f2:	c3                   	ret    

000307f3 <init_third_thread>:
   307f3:	55                   	push   %ebp
   307f4:	89 e5                	mov    %esp,%ebp
   307f6:	83 ec 28             	sub    $0x28,%esp
   307f9:	c7 44 24 0c 8b 05 03 	movl   $0x3058b,0xc(%esp)
   30800:	00 
   30801:	c7 44 24 08 bf 19 03 	movl   $0x319bf,0x8(%esp)
   30808:	00 
   30809:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
   30810:	00 
   30811:	c7 04 24 00 70 04 00 	movl   $0x47000,(%esp)
   30818:	e8 30 00 00 00       	call   3084d <init_thread>
   3081d:	89 45 f4             	mov    %eax,-0xc(%ebp)
   30820:	c7 44 24 04 10 30 03 	movl   $0x33010,0x4(%esp)
   30827:	00 
   30828:	c7 04 24 6c 70 04 00 	movl   $0x4706c,(%esp)
   3082f:	e8 4c 01 00 00       	call   30980 <list_insert_by_pri>
   30834:	c7 44 24 04 00 30 03 	movl   $0x33000,0x4(%esp)
   3083b:	00 
   3083c:	c7 04 24 74 70 04 00 	movl   $0x47074,(%esp)
   30843:	e8 76 fe ff ff       	call   306be <list_insert_back>
   30848:	8b 45 f4             	mov    -0xc(%ebp),%eax
   3084b:	c9                   	leave  
   3084c:	c3                   	ret    

0003084d <init_thread>:
   3084d:	55                   	push   %ebp
   3084e:	89 e5                	mov    %esp,%ebp
   30850:	83 ec 0c             	sub    $0xc,%esp
   30853:	a1 04 20 03 00       	mov    0x32004,%eax
   30858:	89 c2                	mov    %eax,%edx
   3085a:	8b 45 08             	mov    0x8(%ebp),%eax
   3085d:	89 50 38             	mov    %edx,0x38(%eax)
   30860:	a1 08 20 03 00       	mov    0x32008,%eax
   30865:	89 c2                	mov    %eax,%edx
   30867:	8b 45 08             	mov    0x8(%ebp),%eax
   3086a:	89 10                	mov    %edx,(%eax)
   3086c:	a1 08 20 03 00       	mov    0x32008,%eax
   30871:	89 c2                	mov    %eax,%edx
   30873:	8b 45 08             	mov    0x8(%ebp),%eax
   30876:	89 50 04             	mov    %edx,0x4(%eax)
   30879:	a1 08 20 03 00       	mov    0x32008,%eax
   3087e:	89 c2                	mov    %eax,%edx
   30880:	8b 45 08             	mov    0x8(%ebp),%eax
   30883:	89 50 08             	mov    %edx,0x8(%eax)
   30886:	a1 08 20 03 00       	mov    0x32008,%eax
   3088b:	89 c2                	mov    %eax,%edx
   3088d:	8b 45 08             	mov    0x8(%ebp),%eax
   30890:	89 50 0c             	mov    %edx,0xc(%eax)
   30893:	a1 08 20 03 00       	mov    0x32008,%eax
   30898:	89 c2                	mov    %eax,%edx
   3089a:	8b 45 08             	mov    0x8(%ebp),%eax
   3089d:	89 50 44             	mov    %edx,0x44(%eax)
   308a0:	8b 55 14             	mov    0x14(%ebp),%edx
   308a3:	8b 45 08             	mov    0x8(%ebp),%eax
   308a6:	89 50 34             	mov    %edx,0x34(%eax)
   308a9:	8b 45 08             	mov    0x8(%ebp),%eax
   308ac:	05 7c 80 00 00       	add    $0x807c,%eax
   308b1:	89 c2                	mov    %eax,%edx
   308b3:	8b 45 08             	mov    0x8(%ebp),%eax
   308b6:	89 50 40             	mov    %edx,0x40(%eax)
   308b9:	8b 45 08             	mov    0x8(%ebp),%eax
   308bc:	c7 40 3c 02 12 00 00 	movl   $0x1202,0x3c(%eax)
   308c3:	8b 45 08             	mov    0x8(%ebp),%eax
   308c6:	8d 50 4c             	lea    0x4c(%eax),%edx
   308c9:	c7 44 24 08 14 00 00 	movl   $0x14,0x8(%esp)
   308d0:	00 
   308d1:	8b 45 10             	mov    0x10(%ebp),%eax
   308d4:	89 44 24 04          	mov    %eax,0x4(%esp)
   308d8:	89 14 24             	mov    %edx,(%esp)
   308db:	e8 08 fc ff ff       	call   304e8 <strncpy>
   308e0:	8b 45 08             	mov    0x8(%ebp),%eax
   308e3:	c7 40 64 00 00 00 00 	movl   $0x0,0x64(%eax)
   308ea:	8b 45 08             	mov    0x8(%ebp),%eax
   308ed:	8b 55 0c             	mov    0xc(%ebp),%edx
   308f0:	89 50 60             	mov    %edx,0x60(%eax)
   308f3:	b8 01 00 00 00       	mov    $0x1,%eax
   308f8:	c9                   	leave  
   308f9:	c3                   	ret    

000308fa <running_thread>:
   308fa:	55                   	push   %ebp
   308fb:	89 e5                	mov    %esp,%ebp
   308fd:	53                   	push   %ebx
   308fe:	83 ec 10             	sub    $0x10,%esp
   30901:	89 e3                	mov    %esp,%ebx
   30903:	89 5d f8             	mov    %ebx,-0x8(%ebp)
   30906:	8b 45 f8             	mov    -0x8(%ebp),%eax
   30909:	25 00 f0 ff ff       	and    $0xfffff000,%eax
   3090e:	83 c4 10             	add    $0x10,%esp
   30911:	5b                   	pop    %ebx
   30912:	5d                   	pop    %ebp
   30913:	c3                   	ret    

00030914 <current_thread_ticks>:
   30914:	55                   	push   %ebp
   30915:	89 e5                	mov    %esp,%ebp
   30917:	e8 de ff ff ff       	call   308fa <running_thread>
   3091c:	8b 40 64             	mov    0x64(%eax),%eax
   3091f:	5d                   	pop    %ebp
   30920:	c3                   	ret    

00030921 <current_thread_ticks_inc>:
   30921:	55                   	push   %ebp
   30922:	89 e5                	mov    %esp,%ebp
   30924:	e8 d1 ff ff ff       	call   308fa <running_thread>
   30929:	8b 50 64             	mov    0x64(%eax),%edx
   3092c:	83 c2 01             	add    $0x1,%edx
   3092f:	89 50 64             	mov    %edx,0x64(%eax)
   30932:	5d                   	pop    %ebp
   30933:	c3                   	ret    

00030934 <next_thread_to_run>:
   30934:	55                   	push   %ebp
   30935:	89 e5                	mov    %esp,%ebp
   30937:	83 ec 18             	sub    $0x18,%esp
   3093a:	c7 04 24 10 30 03 00 	movl   $0x33010,(%esp)
   30941:	e8 e8 fc ff ff       	call   3062e <list_empty>
   30946:	85 c0                	test   %eax,%eax
   30948:	75 34                	jne    3097e <next_thread_to_run+0x4a>
   3094a:	a1 14 30 03 00       	mov    0x33014,%eax
   3094f:	83 e8 6c             	sub    $0x6c,%eax
   30952:	89 45 fc             	mov    %eax,-0x4(%ebp)
   30955:	8b 45 fc             	mov    -0x4(%ebp),%eax
   30958:	83 c0 6c             	add    $0x6c,%eax
   3095b:	89 04 24             	mov    %eax,(%esp)
   3095e:	e8 78 fd ff ff       	call   306db <list_remove>
   30963:	8b 45 fc             	mov    -0x4(%ebp),%eax
   30966:	83 c0 6c             	add    $0x6c,%eax
   30969:	c7 44 24 04 10 30 03 	movl   $0x33010,0x4(%esp)
   30970:	00 
   30971:	89 04 24             	mov    %eax,(%esp)
   30974:	e8 45 fd ff ff       	call   306be <list_insert_back>
   30979:	8b 45 fc             	mov    -0x4(%ebp),%eax
   3097c:	eb 00                	jmp    3097e <next_thread_to_run+0x4a>
   3097e:	c9                   	leave  
   3097f:	c3                   	ret    

00030980 <list_insert_by_pri>:
   30980:	55                   	push   %ebp
   30981:	89 e5                	mov    %esp,%ebp
   30983:	83 ec 18             	sub    $0x18,%esp
   30986:	8b 45 0c             	mov    0xc(%ebp),%eax
   30989:	89 04 24             	mov    %eax,(%esp)
   3098c:	e8 9d fc ff ff       	call   3062e <list_empty>
   30991:	85 c0                	test   %eax,%eax
   30993:	74 19                	je     309ae <list_insert_by_pri+0x2e>
   30995:	8b 45 0c             	mov    0xc(%ebp),%eax
   30998:	8b 55 08             	mov    0x8(%ebp),%edx
   3099b:	89 54 24 04          	mov    %edx,0x4(%esp)
   3099f:	89 04 24             	mov    %eax,(%esp)
   309a2:	e8 b5 fc ff ff       	call   3065c <list_insert_next>
   309a7:	b8 01 00 00 00       	mov    $0x1,%eax
   309ac:	eb 63                	jmp    30a11 <list_insert_by_pri+0x91>
   309ae:	8b 45 0c             	mov    0xc(%ebp),%eax
   309b1:	8b 40 04             	mov    0x4(%eax),%eax
   309b4:	89 45 fc             	mov    %eax,-0x4(%ebp)
   309b7:	8b 45 08             	mov    0x8(%ebp),%eax
   309ba:	83 e8 6c             	sub    $0x6c,%eax
   309bd:	8b 50 60             	mov    0x60(%eax),%edx
   309c0:	8b 45 fc             	mov    -0x4(%ebp),%eax
   309c3:	83 e8 6c             	sub    $0x6c,%eax
   309c6:	8b 40 60             	mov    0x60(%eax),%eax
   309c9:	39 c2                	cmp    %eax,%edx
   309cb:	7d 19                	jge    309e6 <list_insert_by_pri+0x66>
   309cd:	8b 45 fc             	mov    -0x4(%ebp),%eax
   309d0:	89 44 24 04          	mov    %eax,0x4(%esp)
   309d4:	8b 45 08             	mov    0x8(%ebp),%eax
   309d7:	89 04 24             	mov    %eax,(%esp)
   309da:	e8 af fc ff ff       	call   3068e <list_insert_prev>
   309df:	b8 01 00 00 00       	mov    $0x1,%eax
   309e4:	eb 2b                	jmp    30a11 <list_insert_by_pri+0x91>
   309e6:	8b 45 fc             	mov    -0x4(%ebp),%eax
   309e9:	8b 40 04             	mov    0x4(%eax),%eax
   309ec:	89 45 fc             	mov    %eax,-0x4(%ebp)
   309ef:	8b 45 0c             	mov    0xc(%ebp),%eax
   309f2:	83 c0 08             	add    $0x8,%eax
   309f5:	3b 45 fc             	cmp    -0x4(%ebp),%eax
   309f8:	75 bd                	jne    309b7 <list_insert_by_pri+0x37>
   309fa:	8b 45 0c             	mov    0xc(%ebp),%eax
   309fd:	89 44 24 04          	mov    %eax,0x4(%esp)
   30a01:	8b 45 08             	mov    0x8(%ebp),%eax
   30a04:	89 04 24             	mov    %eax,(%esp)
   30a07:	e8 b2 fc ff ff       	call   306be <list_insert_back>
   30a0c:	b8 01 00 00 00       	mov    $0x1,%eax
   30a11:	c9                   	leave  
   30a12:	c3                   	ret    

00030a13 <run_first_thread>:
   30a13:	55                   	push   %ebp
   30a14:	89 e5                	mov    %esp,%ebp
   30a16:	e8 19 ff ff ff       	call   30934 <next_thread_to_run>
   30a1b:	a3 00 00 05 00       	mov    %eax,0x50000
   30a20:	5d                   	pop    %ebp
   30a21:	c3                   	ret    
   30a22:	90                   	nop
   30a23:	90                   	nop
   30a24:	90                   	nop
   30a25:	90                   	nop
   30a26:	90                   	nop
   30a27:	90                   	nop
   30a28:	90                   	nop
   30a29:	90                   	nop
   30a2a:	90                   	nop
   30a2b:	90                   	nop
   30a2c:	90                   	nop
   30a2d:	90                   	nop
   30a2e:	90                   	nop
   30a2f:	90                   	nop

00030a30 <disp_str>:
   30a30:	55                   	push   %ebp
   30a31:	89 e5                	mov    %esp,%ebp
   30a33:	8b 75 08             	mov    0x8(%ebp),%esi
   30a36:	8b 3d 0c 20 03 00    	mov    0x3200c,%edi
   30a3c:	b4 0f                	mov    $0xf,%ah

00030a3e <disp_str.1>:
   30a3e:	ac                   	lods   %ds:(%esi),%al
   30a3f:	84 c0                	test   %al,%al
   30a41:	74 2f                	je     30a72 <disp_str.2>
   30a43:	3c 0a                	cmp    $0xa,%al
   30a45:	75 16                	jne    30a5d <disp_str.3>
   30a47:	50                   	push   %eax
   30a48:	89 f8                	mov    %edi,%eax
   30a4a:	b3 a0                	mov    $0xa0,%bl
   30a4c:	f6 f3                	div    %bl
   30a4e:	25 ff 00 00 00       	and    $0xff,%eax
   30a53:	40                   	inc    %eax
   30a54:	b3 a0                	mov    $0xa0,%bl
   30a56:	f6 e3                	mul    %bl
   30a58:	89 c7                	mov    %eax,%edi
   30a5a:	58                   	pop    %eax
   30a5b:	eb e1                	jmp    30a3e <disp_str.1>

00030a5d <disp_str.3>:
   30a5d:	81 c7 00 80 0b 00    	add    $0xb8000,%edi
   30a63:	65 66 89 07          	mov    %ax,%gs:(%edi)
   30a67:	81 ef 00 80 0b 00    	sub    $0xb8000,%edi
   30a6d:	83 c7 02             	add    $0x2,%edi
   30a70:	eb cc                	jmp    30a3e <disp_str.1>

00030a72 <disp_str.2>:
   30a72:	89 3d 0c 20 03 00    	mov    %edi,0x3200c
   30a78:	5d                   	pop    %ebp
   30a79:	c3                   	ret    
   30a7a:	90                   	nop
   30a7b:	90                   	nop

00030a7c <init_8259A>:
   30a7c:	55                   	push   %ebp
   30a7d:	89 e5                	mov    %esp,%ebp
   30a7f:	83 ec 18             	sub    $0x18,%esp
   30a82:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
   30a89:	00 
   30a8a:	c7 04 24 ff 00 00 00 	movl   $0xff,(%esp)
   30a91:	e8 ea 00 00 00       	call   30b80 <outb>
   30a96:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
   30a9d:	00 
   30a9e:	c7 04 24 ff 00 00 00 	movl   $0xff,(%esp)
   30aa5:	e8 d6 00 00 00       	call   30b80 <outb>
   30aaa:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
   30ab1:	00 
   30ab2:	c7 04 24 11 00 00 00 	movl   $0x11,(%esp)
   30ab9:	e8 cc 00 00 00       	call   30b8a <outb_pic>
   30abe:	c7 44 24 04 a0 00 00 	movl   $0xa0,0x4(%esp)
   30ac5:	00 
   30ac6:	c7 04 24 11 00 00 00 	movl   $0x11,(%esp)
   30acd:	e8 b8 00 00 00       	call   30b8a <outb_pic>
   30ad2:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
   30ad9:	00 
   30ada:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
   30ae1:	e8 a4 00 00 00       	call   30b8a <outb_pic>
   30ae6:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
   30aed:	00 
   30aee:	c7 04 24 28 00 00 00 	movl   $0x28,(%esp)
   30af5:	e8 90 00 00 00       	call   30b8a <outb_pic>
   30afa:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
   30b01:	00 
   30b02:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
   30b09:	e8 7c 00 00 00       	call   30b8a <outb_pic>
   30b0e:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
   30b15:	00 
   30b16:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
   30b1d:	e8 68 00 00 00       	call   30b8a <outb_pic>
   30b22:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
   30b29:	00 
   30b2a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
   30b31:	e8 54 00 00 00       	call   30b8a <outb_pic>
   30b36:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
   30b3d:	00 
   30b3e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
   30b45:	e8 40 00 00 00       	call   30b8a <outb_pic>
   30b4a:	c9                   	leave  
   30b4b:	c3                   	ret    

00030b4c <op_8259A>:
   30b4c:	55                   	push   %ebp
   30b4d:	89 e5                	mov    %esp,%ebp
   30b4f:	83 ec 18             	sub    $0x18,%esp
   30b52:	c7 44 24 04 21 00 00 	movl   $0x21,0x4(%esp)
   30b59:	00 
   30b5a:	8b 45 08             	mov    0x8(%ebp),%eax
   30b5d:	89 04 24             	mov    %eax,(%esp)
   30b60:	e8 25 00 00 00       	call   30b8a <outb_pic>
   30b65:	c7 44 24 04 a1 00 00 	movl   $0xa1,0x4(%esp)
   30b6c:	00 
   30b6d:	8b 45 0c             	mov    0xc(%ebp),%eax
   30b70:	89 04 24             	mov    %eax,(%esp)
   30b73:	e8 12 00 00 00       	call   30b8a <outb_pic>
   30b78:	c9                   	leave  
   30b79:	c3                   	ret    
   30b7a:	90                   	nop
   30b7b:	90                   	nop
   30b7c:	90                   	nop
   30b7d:	90                   	nop
   30b7e:	90                   	nop
   30b7f:	90                   	nop

00030b80 <outb>:
   30b80:	8b 44 24 04          	mov    0x4(%esp),%eax
   30b84:	8b 54 24 08          	mov    0x8(%esp),%edx
   30b88:	ee                   	out    %al,(%dx)
   30b89:	c3                   	ret    

00030b8a <outb_pic>:
   30b8a:	8b 44 24 04          	mov    0x4(%esp),%eax
   30b8e:	8b 54 24 08          	mov    0x8(%esp),%edx
   30b92:	ee                   	out    %al,(%dx)
   30b93:	90                   	nop
   30b94:	90                   	nop
   30b95:	c3                   	ret    
   30b96:	90                   	nop
   30b97:	90                   	nop

00030b98 <change_gdt>:
   30b98:	55                   	push   %ebp
   30b99:	89 e5                	mov    %esp,%ebp
   30b9b:	83 ec 18             	sub    $0x18,%esp
   30b9e:	66 c7 05 20 30 03 00 	movw   $0x0,0x33020
   30ba5:	00 00 
   30ba7:	66 c7 05 22 30 03 00 	movw   $0x0,0x33022
   30bae:	00 00 
   30bb0:	c6 05 24 30 03 00 00 	movb   $0x0,0x33024
   30bb7:	c6 05 25 30 03 00 00 	movb   $0x0,0x33025
   30bbe:	c6 05 26 30 03 00 00 	movb   $0x0,0x33026
   30bc5:	c6 05 27 30 03 00 00 	movb   $0x0,0x33027
   30bcc:	66 c7 05 80 30 03 00 	movw   $0xffff,0x33080
   30bd3:	ff ff 
   30bd5:	66 c7 05 82 30 03 00 	movw   $0x0,0x33082
   30bdc:	00 00 
   30bde:	c6 05 84 30 03 00 00 	movb   $0x0,0x33084
   30be5:	c6 05 85 30 03 00 9a 	movb   $0x9a,0x33085
   30bec:	c6 05 86 30 03 00 cf 	movb   $0xcf,0x33086
   30bf3:	c6 05 87 30 03 00 00 	movb   $0x0,0x33087
   30bfa:	66 c7 05 88 30 03 00 	movw   $0xffff,0x33088
   30c01:	ff ff 
   30c03:	66 c7 05 8a 30 03 00 	movw   $0x0,0x3308a
   30c0a:	00 00 
   30c0c:	c6 05 8c 30 03 00 00 	movb   $0x0,0x3308c
   30c13:	c6 05 8d 30 03 00 93 	movb   $0x93,0x3308d
   30c1a:	c6 05 8e 30 03 00 cf 	movb   $0xcf,0x3308e
   30c21:	c6 05 8f 30 03 00 00 	movb   $0x0,0x3308f
   30c28:	66 c7 05 90 30 03 00 	movw   $0xffff,0x33090
   30c2f:	ff ff 
   30c31:	66 c7 05 92 30 03 00 	movw   $0x0,0x33092
   30c38:	00 00 
   30c3a:	c6 05 94 30 03 00 00 	movb   $0x0,0x33094
   30c41:	c6 05 95 30 03 00 fa 	movb   $0xfa,0x33095
   30c48:	c6 05 96 30 03 00 cf 	movb   $0xcf,0x33096
   30c4f:	c6 05 97 30 03 00 00 	movb   $0x0,0x33097
   30c56:	66 c7 05 98 30 03 00 	movw   $0xffff,0x33098
   30c5d:	ff ff 
   30c5f:	66 c7 05 9a 30 03 00 	movw   $0x0,0x3309a
   30c66:	00 00 
   30c68:	c6 05 9c 30 03 00 00 	movb   $0x0,0x3309c
   30c6f:	c6 05 9d 30 03 00 f3 	movb   $0xf3,0x3309d
   30c76:	c6 05 9e 30 03 00 cf 	movb   $0xcf,0x3309e
   30c7d:	c6 05 9f 30 03 00 00 	movb   $0x0,0x3309f
   30c84:	66 c7 05 98 30 03 00 	movw   $0xffff,0x33098
   30c8b:	ff ff 
   30c8d:	66 c7 05 9a 30 03 00 	movw   $0x0,0x3309a
   30c94:	00 00 
   30c96:	c6 05 9c 30 03 00 00 	movb   $0x0,0x3309c
   30c9d:	c6 05 9d 30 03 00 f3 	movb   $0xf3,0x3309d
   30ca4:	c6 05 9e 30 03 00 cf 	movb   $0xcf,0x3309e
   30cab:	c6 05 9f 30 03 00 00 	movb   $0x0,0x3309f
   30cb2:	c7 05 48 3c 03 00 68 	movl   $0x68,0x33c48
   30cb9:	00 00 00 
   30cbc:	66 c7 05 a6 3c 03 00 	movw   $0x68,0x33ca6
   30cc3:	68 00 
   30cc5:	66 c7 05 a0 30 03 00 	movw   $0x67,0x330a0
   30ccc:	67 00 
   30cce:	b8 40 3c 03 00       	mov    $0x33c40,%eax
   30cd3:	66 a3 a2 30 03 00    	mov    %ax,0x330a2
   30cd9:	b8 40 3c 03 00       	mov    $0x33c40,%eax
   30cde:	c1 e8 10             	shr    $0x10,%eax
   30ce1:	a2 a4 30 03 00       	mov    %al,0x330a4
   30ce6:	c6 05 a5 30 03 00 89 	movb   $0x89,0x330a5
   30ced:	c6 05 a6 30 03 00 00 	movb   $0x0,0x330a6
   30cf4:	b8 40 3c 03 00       	mov    $0x33c40,%eax
   30cf9:	c1 e8 18             	shr    $0x18,%eax
   30cfc:	a2 a7 30 03 00       	mov    %al,0x330a7
   30d01:	c7 45 f4 0a 00 05 00 	movl   $0x5000a,-0xc(%ebp)
   30d08:	c7 45 f0 0c 00 05 00 	movl   $0x5000c,-0x10(%ebp)
   30d0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
   30d12:	66 c7 00 ff 03       	movw   $0x3ff,(%eax)
   30d17:	ba 20 30 03 00       	mov    $0x33020,%edx
   30d1c:	8b 45 f0             	mov    -0x10(%ebp),%eax
   30d1f:	89 10                	mov    %edx,(%eax)
   30d21:	e8 fa 06 00 00       	call   31420 <jump_new_gdt>
   30d26:	c9                   	leave  
   30d27:	c3                   	ret    

00030d28 <init_idt>:
   30d28:	55                   	push   %ebp
   30d29:	89 e5                	mov    %esp,%ebp
   30d2b:	83 ec 18             	sub    $0x18,%esp
   30d2e:	b8 7b 15 03 00       	mov    $0x3157b,%eax
   30d33:	66 a3 20 34 03 00    	mov    %ax,0x33420
   30d39:	66 c7 05 22 34 03 00 	movw   $0x60,0x33422
   30d40:	60 00 
   30d42:	c6 05 24 34 03 00 00 	movb   $0x0,0x33424
   30d49:	c6 05 25 34 03 00 8e 	movb   $0x8e,0x33425
   30d50:	b8 7b 15 03 00       	mov    $0x3157b,%eax
   30d55:	c1 e8 10             	shr    $0x10,%eax
   30d58:	66 a3 26 34 03 00    	mov    %ax,0x33426
   30d5e:	b8 81 15 03 00       	mov    $0x31581,%eax
   30d63:	66 a3 28 34 03 00    	mov    %ax,0x33428
   30d69:	66 c7 05 2a 34 03 00 	movw   $0x60,0x3342a
   30d70:	60 00 
   30d72:	c6 05 2c 34 03 00 00 	movb   $0x0,0x3342c
   30d79:	c6 05 2d 34 03 00 8e 	movb   $0x8e,0x3342d
   30d80:	b8 81 15 03 00       	mov    $0x31581,%eax
   30d85:	c1 e8 10             	shr    $0x10,%eax
   30d88:	66 a3 2e 34 03 00    	mov    %ax,0x3342e
   30d8e:	b8 87 15 03 00       	mov    $0x31587,%eax
   30d93:	66 a3 30 34 03 00    	mov    %ax,0x33430
   30d99:	66 c7 05 32 34 03 00 	movw   $0x60,0x33432
   30da0:	60 00 
   30da2:	c6 05 34 34 03 00 00 	movb   $0x0,0x33434
   30da9:	c6 05 35 34 03 00 8e 	movb   $0x8e,0x33435
   30db0:	b8 87 15 03 00       	mov    $0x31587,%eax
   30db5:	c1 e8 10             	shr    $0x10,%eax
   30db8:	66 a3 36 34 03 00    	mov    %ax,0x33436
   30dbe:	b8 8d 15 03 00       	mov    $0x3158d,%eax
   30dc3:	66 a3 38 34 03 00    	mov    %ax,0x33438
   30dc9:	66 c7 05 3a 34 03 00 	movw   $0x60,0x3343a
   30dd0:	60 00 
   30dd2:	c6 05 3c 34 03 00 00 	movb   $0x0,0x3343c
   30dd9:	c6 05 3d 34 03 00 8e 	movb   $0x8e,0x3343d
   30de0:	b8 8d 15 03 00       	mov    $0x3158d,%eax
   30de5:	c1 e8 10             	shr    $0x10,%eax
   30de8:	66 a3 3e 34 03 00    	mov    %ax,0x3343e
   30dee:	b8 93 15 03 00       	mov    $0x31593,%eax
   30df3:	66 a3 40 34 03 00    	mov    %ax,0x33440
   30df9:	66 c7 05 42 34 03 00 	movw   $0x60,0x33442
   30e00:	60 00 
   30e02:	c6 05 44 34 03 00 00 	movb   $0x0,0x33444
   30e09:	c6 05 45 34 03 00 8e 	movb   $0x8e,0x33445
   30e10:	b8 93 15 03 00       	mov    $0x31593,%eax
   30e15:	c1 e8 10             	shr    $0x10,%eax
   30e18:	66 a3 46 34 03 00    	mov    %ax,0x33446
   30e1e:	b8 99 15 03 00       	mov    $0x31599,%eax
   30e23:	66 a3 48 34 03 00    	mov    %ax,0x33448
   30e29:	66 c7 05 4a 34 03 00 	movw   $0x60,0x3344a
   30e30:	60 00 
   30e32:	c6 05 4c 34 03 00 00 	movb   $0x0,0x3344c
   30e39:	c6 05 4d 34 03 00 8e 	movb   $0x8e,0x3344d
   30e40:	b8 99 15 03 00       	mov    $0x31599,%eax
   30e45:	c1 e8 10             	shr    $0x10,%eax
   30e48:	66 a3 4e 34 03 00    	mov    %ax,0x3344e
   30e4e:	b8 9f 15 03 00       	mov    $0x3159f,%eax
   30e53:	66 a3 50 34 03 00    	mov    %ax,0x33450
   30e59:	66 c7 05 52 34 03 00 	movw   $0x60,0x33452
   30e60:	60 00 
   30e62:	c6 05 54 34 03 00 00 	movb   $0x0,0x33454
   30e69:	c6 05 55 34 03 00 8e 	movb   $0x8e,0x33455
   30e70:	b8 9f 15 03 00       	mov    $0x3159f,%eax
   30e75:	c1 e8 10             	shr    $0x10,%eax
   30e78:	66 a3 56 34 03 00    	mov    %ax,0x33456
   30e7e:	b8 a5 15 03 00       	mov    $0x315a5,%eax
   30e83:	66 a3 58 34 03 00    	mov    %ax,0x33458
   30e89:	66 c7 05 5a 34 03 00 	movw   $0x60,0x3345a
   30e90:	60 00 
   30e92:	c6 05 5c 34 03 00 00 	movb   $0x0,0x3345c
   30e99:	c6 05 5d 34 03 00 8e 	movb   $0x8e,0x3345d
   30ea0:	b8 a5 15 03 00       	mov    $0x315a5,%eax
   30ea5:	c1 e8 10             	shr    $0x10,%eax
   30ea8:	66 a3 5e 34 03 00    	mov    %ax,0x3345e
   30eae:	b8 ab 15 03 00       	mov    $0x315ab,%eax
   30eb3:	66 a3 60 34 03 00    	mov    %ax,0x33460
   30eb9:	66 c7 05 62 34 03 00 	movw   $0x60,0x33462
   30ec0:	60 00 
   30ec2:	c6 05 64 34 03 00 00 	movb   $0x0,0x33464
   30ec9:	c6 05 65 34 03 00 8e 	movb   $0x8e,0x33465
   30ed0:	b8 ab 15 03 00       	mov    $0x315ab,%eax
   30ed5:	c1 e8 10             	shr    $0x10,%eax
   30ed8:	66 a3 66 34 03 00    	mov    %ax,0x33466
   30ede:	b8 af 15 03 00       	mov    $0x315af,%eax
   30ee3:	66 a3 68 34 03 00    	mov    %ax,0x33468
   30ee9:	66 c7 05 6a 34 03 00 	movw   $0x60,0x3346a
   30ef0:	60 00 
   30ef2:	c6 05 6c 34 03 00 00 	movb   $0x0,0x3346c
   30ef9:	c6 05 6d 34 03 00 8e 	movb   $0x8e,0x3346d
   30f00:	b8 af 15 03 00       	mov    $0x315af,%eax
   30f05:	c1 e8 10             	shr    $0x10,%eax
   30f08:	66 a3 6e 34 03 00    	mov    %ax,0x3346e
   30f0e:	b8 b5 15 03 00       	mov    $0x315b5,%eax
   30f13:	66 a3 70 34 03 00    	mov    %ax,0x33470
   30f19:	66 c7 05 72 34 03 00 	movw   $0x60,0x33472
   30f20:	60 00 
   30f22:	c6 05 74 34 03 00 00 	movb   $0x0,0x33474
   30f29:	c6 05 75 34 03 00 8e 	movb   $0x8e,0x33475
   30f30:	b8 b5 15 03 00       	mov    $0x315b5,%eax
   30f35:	c1 e8 10             	shr    $0x10,%eax
   30f38:	66 a3 76 34 03 00    	mov    %ax,0x33476
   30f3e:	b8 b9 15 03 00       	mov    $0x315b9,%eax
   30f43:	66 a3 78 34 03 00    	mov    %ax,0x33478
   30f49:	66 c7 05 7a 34 03 00 	movw   $0x60,0x3347a
   30f50:	60 00 
   30f52:	c6 05 7c 34 03 00 00 	movb   $0x0,0x3347c
   30f59:	c6 05 7d 34 03 00 8e 	movb   $0x8e,0x3347d
   30f60:	b8 b9 15 03 00       	mov    $0x315b9,%eax
   30f65:	c1 e8 10             	shr    $0x10,%eax
   30f68:	66 a3 7e 34 03 00    	mov    %ax,0x3347e
   30f6e:	b8 bd 15 03 00       	mov    $0x315bd,%eax
   30f73:	66 a3 80 34 03 00    	mov    %ax,0x33480
   30f79:	66 c7 05 82 34 03 00 	movw   $0x60,0x33482
   30f80:	60 00 
   30f82:	c6 05 84 34 03 00 00 	movb   $0x0,0x33484
   30f89:	c6 05 85 34 03 00 8e 	movb   $0x8e,0x33485
   30f90:	b8 bd 15 03 00       	mov    $0x315bd,%eax
   30f95:	c1 e8 10             	shr    $0x10,%eax
   30f98:	66 a3 86 34 03 00    	mov    %ax,0x33486
   30f9e:	b8 c1 15 03 00       	mov    $0x315c1,%eax
   30fa3:	66 a3 88 34 03 00    	mov    %ax,0x33488
   30fa9:	66 c7 05 8a 34 03 00 	movw   $0x60,0x3348a
   30fb0:	60 00 
   30fb2:	c6 05 8c 34 03 00 00 	movb   $0x0,0x3348c
   30fb9:	c6 05 8d 34 03 00 8e 	movb   $0x8e,0x3348d
   30fc0:	b8 c1 15 03 00       	mov    $0x315c1,%eax
   30fc5:	c1 e8 10             	shr    $0x10,%eax
   30fc8:	66 a3 8e 34 03 00    	mov    %ax,0x3348e
   30fce:	b8 c5 15 03 00       	mov    $0x315c5,%eax
   30fd3:	66 a3 90 34 03 00    	mov    %ax,0x33490
   30fd9:	66 c7 05 92 34 03 00 	movw   $0x60,0x33492
   30fe0:	60 00 
   30fe2:	c6 05 94 34 03 00 00 	movb   $0x0,0x33494
   30fe9:	c6 05 95 34 03 00 8e 	movb   $0x8e,0x33495
   30ff0:	b8 c5 15 03 00       	mov    $0x315c5,%eax
   30ff5:	c1 e8 10             	shr    $0x10,%eax
   30ff8:	66 a3 96 34 03 00    	mov    %ax,0x33496
   30ffe:	b8 c9 15 03 00       	mov    $0x315c9,%eax
   31003:	66 a3 a0 34 03 00    	mov    %ax,0x334a0
   31009:	66 c7 05 a2 34 03 00 	movw   $0x60,0x334a2
   31010:	60 00 
   31012:	c6 05 a4 34 03 00 00 	movb   $0x0,0x334a4
   31019:	c6 05 a5 34 03 00 8e 	movb   $0x8e,0x334a5
   31020:	b8 c9 15 03 00       	mov    $0x315c9,%eax
   31025:	c1 e8 10             	shr    $0x10,%eax
   31028:	66 a3 a6 34 03 00    	mov    %ax,0x334a6
   3102e:	b8 50 14 03 00       	mov    $0x31450,%eax
   31033:	66 a3 20 35 03 00    	mov    %ax,0x33520
   31039:	66 c7 05 22 35 03 00 	movw   $0x60,0x33522
   31040:	60 00 
   31042:	c6 05 24 35 03 00 00 	movb   $0x0,0x33524
   31049:	c6 05 25 35 03 00 8e 	movb   $0x8e,0x33525
   31050:	b8 50 14 03 00       	mov    $0x31450,%eax
   31055:	c1 e8 10             	shr    $0x10,%eax
   31058:	66 a3 26 35 03 00    	mov    %ax,0x33526
   3105e:	b8 90 14 03 00       	mov    $0x31490,%eax
   31063:	66 a3 28 35 03 00    	mov    %ax,0x33528
   31069:	66 c7 05 2a 35 03 00 	movw   $0x60,0x3352a
   31070:	60 00 
   31072:	c6 05 2c 35 03 00 00 	movb   $0x0,0x3352c
   31079:	c6 05 2d 35 03 00 8e 	movb   $0x8e,0x3352d
   31080:	b8 90 14 03 00       	mov    $0x31490,%eax
   31085:	c1 e8 10             	shr    $0x10,%eax
   31088:	66 a3 2e 35 03 00    	mov    %ax,0x3352e
   3108e:	b8 a0 14 03 00       	mov    $0x314a0,%eax
   31093:	66 a3 30 35 03 00    	mov    %ax,0x33530
   31099:	66 c7 05 32 35 03 00 	movw   $0x60,0x33532
   310a0:	60 00 
   310a2:	c6 05 34 35 03 00 00 	movb   $0x0,0x33534
   310a9:	c6 05 35 35 03 00 8e 	movb   $0x8e,0x33535
   310b0:	b8 a0 14 03 00       	mov    $0x314a0,%eax
   310b5:	c1 e8 10             	shr    $0x10,%eax
   310b8:	66 a3 36 35 03 00    	mov    %ax,0x33536
   310be:	b8 b0 14 03 00       	mov    $0x314b0,%eax
   310c3:	66 a3 38 35 03 00    	mov    %ax,0x33538
   310c9:	66 c7 05 3a 35 03 00 	movw   $0x60,0x3353a
   310d0:	60 00 
   310d2:	c6 05 3c 35 03 00 00 	movb   $0x0,0x3353c
   310d9:	c6 05 3d 35 03 00 8e 	movb   $0x8e,0x3353d
   310e0:	b8 b0 14 03 00       	mov    $0x314b0,%eax
   310e5:	c1 e8 10             	shr    $0x10,%eax
   310e8:	66 a3 3e 35 03 00    	mov    %ax,0x3353e
   310ee:	b8 c0 14 03 00       	mov    $0x314c0,%eax
   310f3:	66 a3 40 35 03 00    	mov    %ax,0x33540
   310f9:	66 c7 05 42 35 03 00 	movw   $0x60,0x33542
   31100:	60 00 
   31102:	c6 05 44 35 03 00 00 	movb   $0x0,0x33544
   31109:	c6 05 45 35 03 00 8e 	movb   $0x8e,0x33545
   31110:	b8 c0 14 03 00       	mov    $0x314c0,%eax
   31115:	c1 e8 10             	shr    $0x10,%eax
   31118:	66 a3 46 35 03 00    	mov    %ax,0x33546
   3111e:	b8 d0 14 03 00       	mov    $0x314d0,%eax
   31123:	66 a3 48 35 03 00    	mov    %ax,0x33548
   31129:	66 c7 05 4a 35 03 00 	movw   $0x60,0x3354a
   31130:	60 00 
   31132:	c6 05 4c 35 03 00 00 	movb   $0x0,0x3354c
   31139:	c6 05 4d 35 03 00 8e 	movb   $0x8e,0x3354d
   31140:	b8 d0 14 03 00       	mov    $0x314d0,%eax
   31145:	c1 e8 10             	shr    $0x10,%eax
   31148:	66 a3 4e 35 03 00    	mov    %ax,0x3354e
   3114e:	b8 e0 14 03 00       	mov    $0x314e0,%eax
   31153:	66 a3 50 35 03 00    	mov    %ax,0x33550
   31159:	66 c7 05 52 35 03 00 	movw   $0x60,0x33552
   31160:	60 00 
   31162:	c6 05 54 35 03 00 00 	movb   $0x0,0x33554
   31169:	c6 05 55 35 03 00 8e 	movb   $0x8e,0x33555
   31170:	b8 e0 14 03 00       	mov    $0x314e0,%eax
   31175:	c1 e8 10             	shr    $0x10,%eax
   31178:	66 a3 56 35 03 00    	mov    %ax,0x33556
   3117e:	b8 f0 14 03 00       	mov    $0x314f0,%eax
   31183:	66 a3 58 35 03 00    	mov    %ax,0x33558
   31189:	66 c7 05 5a 35 03 00 	movw   $0x60,0x3355a
   31190:	60 00 
   31192:	c6 05 5c 35 03 00 00 	movb   $0x0,0x3355c
   31199:	c6 05 5d 35 03 00 8e 	movb   $0x8e,0x3355d
   311a0:	b8 f0 14 03 00       	mov    $0x314f0,%eax
   311a5:	c1 e8 10             	shr    $0x10,%eax
   311a8:	66 a3 5e 35 03 00    	mov    %ax,0x3355e
   311ae:	b8 00 15 03 00       	mov    $0x31500,%eax
   311b3:	66 a3 60 35 03 00    	mov    %ax,0x33560
   311b9:	66 c7 05 62 35 03 00 	movw   $0x60,0x33562
   311c0:	60 00 
   311c2:	c6 05 64 35 03 00 00 	movb   $0x0,0x33564
   311c9:	c6 05 65 35 03 00 8e 	movb   $0x8e,0x33565
   311d0:	b8 00 15 03 00       	mov    $0x31500,%eax
   311d5:	c1 e8 10             	shr    $0x10,%eax
   311d8:	66 a3 66 35 03 00    	mov    %ax,0x33566
   311de:	b8 10 15 03 00       	mov    $0x31510,%eax
   311e3:	66 a3 68 35 03 00    	mov    %ax,0x33568
   311e9:	66 c7 05 6a 35 03 00 	movw   $0x60,0x3356a
   311f0:	60 00 
   311f2:	c6 05 6c 35 03 00 00 	movb   $0x0,0x3356c
   311f9:	c6 05 6d 35 03 00 8e 	movb   $0x8e,0x3356d
   31200:	b8 10 15 03 00       	mov    $0x31510,%eax
   31205:	c1 e8 10             	shr    $0x10,%eax
   31208:	66 a3 6e 35 03 00    	mov    %ax,0x3356e
   3120e:	b8 20 15 03 00       	mov    $0x31520,%eax
   31213:	66 a3 70 35 03 00    	mov    %ax,0x33570
   31219:	66 c7 05 72 35 03 00 	movw   $0x60,0x33572
   31220:	60 00 
   31222:	c6 05 74 35 03 00 00 	movb   $0x0,0x33574
   31229:	c6 05 75 35 03 00 8e 	movb   $0x8e,0x33575
   31230:	b8 20 15 03 00       	mov    $0x31520,%eax
   31235:	c1 e8 10             	shr    $0x10,%eax
   31238:	66 a3 76 35 03 00    	mov    %ax,0x33576
   3123e:	b8 30 15 03 00       	mov    $0x31530,%eax
   31243:	66 a3 78 35 03 00    	mov    %ax,0x33578
   31249:	66 c7 05 7a 35 03 00 	movw   $0x60,0x3357a
   31250:	60 00 
   31252:	c6 05 7c 35 03 00 00 	movb   $0x0,0x3357c
   31259:	c6 05 7d 35 03 00 8e 	movb   $0x8e,0x3357d
   31260:	b8 30 15 03 00       	mov    $0x31530,%eax
   31265:	c1 e8 10             	shr    $0x10,%eax
   31268:	66 a3 7e 35 03 00    	mov    %ax,0x3357e
   3126e:	b8 40 15 03 00       	mov    $0x31540,%eax
   31273:	66 a3 80 35 03 00    	mov    %ax,0x33580
   31279:	66 c7 05 82 35 03 00 	movw   $0x60,0x33582
   31280:	60 00 
   31282:	c6 05 84 35 03 00 00 	movb   $0x0,0x33584
   31289:	c6 05 85 35 03 00 8e 	movb   $0x8e,0x33585
   31290:	b8 40 15 03 00       	mov    $0x31540,%eax
   31295:	c1 e8 10             	shr    $0x10,%eax
   31298:	66 a3 86 35 03 00    	mov    %ax,0x33586
   3129e:	b8 50 15 03 00       	mov    $0x31550,%eax
   312a3:	66 a3 88 35 03 00    	mov    %ax,0x33588
   312a9:	66 c7 05 8a 35 03 00 	movw   $0x60,0x3358a
   312b0:	60 00 
   312b2:	c6 05 8c 35 03 00 00 	movb   $0x0,0x3358c
   312b9:	c6 05 8d 35 03 00 8e 	movb   $0x8e,0x3358d
   312c0:	b8 50 15 03 00       	mov    $0x31550,%eax
   312c5:	c1 e8 10             	shr    $0x10,%eax
   312c8:	66 a3 8e 35 03 00    	mov    %ax,0x3358e
   312ce:	b8 60 15 03 00       	mov    $0x31560,%eax
   312d3:	66 a3 90 35 03 00    	mov    %ax,0x33590
   312d9:	66 c7 05 92 35 03 00 	movw   $0x60,0x33592
   312e0:	60 00 
   312e2:	c6 05 94 35 03 00 00 	movb   $0x0,0x33594
   312e9:	c6 05 95 35 03 00 8e 	movb   $0x8e,0x33595
   312f0:	b8 60 15 03 00       	mov    $0x31560,%eax
   312f5:	c1 e8 10             	shr    $0x10,%eax
   312f8:	66 a3 96 35 03 00    	mov    %ax,0x33596
   312fe:	b8 70 15 03 00       	mov    $0x31570,%eax
   31303:	66 a3 98 35 03 00    	mov    %ax,0x33598
   31309:	66 c7 05 9a 35 03 00 	movw   $0x60,0x3359a
   31310:	60 00 
   31312:	c6 05 9c 35 03 00 00 	movb   $0x0,0x3359c
   31319:	c6 05 9d 35 03 00 8e 	movb   $0x8e,0x3359d
   31320:	b8 70 15 03 00       	mov    $0x31570,%eax
   31325:	c1 e8 10             	shr    $0x10,%eax
   31328:	66 a3 9e 35 03 00    	mov    %ax,0x3359e
   3132e:	c7 45 f4 04 00 05 00 	movl   $0x50004,-0xc(%ebp)
   31335:	c7 45 f0 06 00 05 00 	movl   $0x50006,-0x10(%ebp)
   3133c:	8b 45 f4             	mov    -0xc(%ebp),%eax
   3133f:	66 c7 00 ff 07       	movw   $0x7ff,(%eax)
   31344:	ba 20 34 03 00       	mov    $0x33420,%edx
   31349:	8b 45 f0             	mov    -0x10(%ebp),%eax
   3134c:	89 10                	mov    %edx,(%eax)
   3134e:	e8 f4 00 00 00       	call   31447 <load_idt>
   31353:	c9                   	leave  
   31354:	c3                   	ret    

00031355 <int_handler>:
   31355:	55                   	push   %ebp
   31356:	89 e5                	mov    %esp,%ebp
   31358:	83 ec 18             	sub    $0x18,%esp
   3135b:	8b 45 08             	mov    0x8(%ebp),%eax
   3135e:	89 44 24 04          	mov    %eax,0x4(%esp)
   31362:	c7 04 24 e0 19 03 00 	movl   $0x319e0,(%esp)
   31369:	e8 32 03 00 00       	call   316a0 <printk>
   3136e:	c9                   	leave  
   3136f:	c3                   	ret    

00031370 <exception_handler>:
   31370:	55                   	push   %ebp
   31371:	89 e5                	mov    %esp,%ebp
   31373:	57                   	push   %edi
   31374:	56                   	push   %esi
   31375:	53                   	push   %ebx
   31376:	83 ec 7c             	sub    $0x7c,%esp
   31379:	8d 55 94             	lea    -0x6c(%ebp),%edx
   3137c:	bb a0 1a 03 00       	mov    $0x31aa0,%ebx
   31381:	b8 14 00 00 00       	mov    $0x14,%eax
   31386:	89 d7                	mov    %edx,%edi
   31388:	89 de                	mov    %ebx,%esi
   3138a:	89 c1                	mov    %eax,%ecx
   3138c:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
   3138e:	c7 05 0c 20 03 00 00 	movl   $0x0,0x3200c
   31395:	00 00 00 
   31398:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
   3139f:	eb 10                	jmp    313b1 <exception_handler+0x41>
   313a1:	c7 04 24 f6 19 03 00 	movl   $0x319f6,(%esp)
   313a8:	e8 f3 02 00 00       	call   316a0 <printk>
   313ad:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
   313b1:	81 7d e4 8f 01 00 00 	cmpl   $0x18f,-0x1c(%ebp)
   313b8:	7e e7                	jle    313a1 <exception_handler+0x31>
   313ba:	c7 05 0c 20 03 00 00 	movl   $0x0,0x3200c
   313c1:	00 00 00 
   313c4:	8b 45 08             	mov    0x8(%ebp),%eax
   313c7:	8b 44 85 94          	mov    -0x6c(%ebp,%eax,4),%eax
   313cb:	89 44 24 04          	mov    %eax,0x4(%esp)
   313cf:	c7 04 24 f8 19 03 00 	movl   $0x319f8,(%esp)
   313d6:	e8 c5 02 00 00       	call   316a0 <printk>
   313db:	8b 45 18             	mov    0x18(%ebp),%eax
   313de:	89 44 24 0c          	mov    %eax,0xc(%esp)
   313e2:	8b 45 14             	mov    0x14(%ebp),%eax
   313e5:	89 44 24 08          	mov    %eax,0x8(%esp)
   313e9:	8b 45 10             	mov    0x10(%ebp),%eax
   313ec:	89 44 24 04          	mov    %eax,0x4(%esp)
   313f0:	c7 04 24 07 1a 03 00 	movl   $0x31a07,(%esp)
   313f7:	e8 a4 02 00 00       	call   316a0 <printk>
   313fc:	83 7d 0c ff          	cmpl   $0xffffffff,0xc(%ebp)
   31400:	74 13                	je     31415 <exception_handler+0xa5>
   31402:	8b 45 0c             	mov    0xc(%ebp),%eax
   31405:	89 44 24 04          	mov    %eax,0x4(%esp)
   31409:	c7 04 24 23 1a 03 00 	movl   $0x31a23,(%esp)
   31410:	e8 8b 02 00 00       	call   316a0 <printk>
   31415:	83 c4 7c             	add    $0x7c,%esp
   31418:	5b                   	pop    %ebx
   31419:	5e                   	pop    %esi
   3141a:	5f                   	pop    %edi
   3141b:	5d                   	pop    %ebp
   3141c:	c3                   	ret    
   3141d:	90                   	nop
   3141e:	90                   	nop
   3141f:	90                   	nop

00031420 <jump_new_gdt>:
   31420:	0f 01 15 0a 00 05 00 	lgdtl  0x5000a
   31427:	66 b8 68 00          	mov    $0x68,%ax
   3142b:	8e d8                	mov    %eax,%ds
   3142d:	8e c0                	mov    %eax,%es
   3142f:	8e d0                	mov    %eax,%ss
   31431:	8e e0                	mov    %eax,%fs
   31433:	8e e8                	mov    %eax,%gs
   31435:	31 c0                	xor    %eax,%eax
   31437:	66 b8 80 00          	mov    $0x80,%ax
   3143b:	0f 00 d8             	ltr    %ax
   3143e:	ea 46 14 03 00 60 00 	ljmp   $0x60,$0x31446
   31445:	c3                   	ret    

00031446 <use_new_gdt>:
   31446:	c3                   	ret    

00031447 <load_idt>:
   31447:	0f 01 1d 04 00 05 00 	lidtl  0x50004
   3144e:	c3                   	ret    
   3144f:	90                   	nop

00031450 <hwint00>:
   31450:	90                   	nop
   31451:	e8 a5 01 00 00       	call   315fb <save>
   31456:	ff 05 20 3c 03 00    	incl   0x33c20
   3145c:	83 3d 20 3c 03 00 00 	cmpl   $0x0,0x33c20
   31463:	75 0c                	jne    31471 <hwint00.1>
   31465:	bc 01 20 03 00       	mov    $0x32001,%esp
   3146a:	68 d8 15 03 00       	push   $0x315d8
   3146f:	eb 05                	jmp    31476 <hwint00.2>

00031471 <hwint00.1>:
   31471:	68 ea 15 03 00       	push   $0x315ea

00031476 <hwint00.2>:
   31476:	fb                   	sti    
   31477:	e8 90 01 00 00       	call   3160c <timer_interrupt>
   3147c:	fa                   	cli    
   3147d:	b0 20                	mov    $0x20,%al
   3147f:	e6 20                	out    %al,$0x20
   31481:	c3                   	ret    
   31482:	90                   	nop
   31483:	90                   	nop
   31484:	90                   	nop
   31485:	90                   	nop
   31486:	90                   	nop
   31487:	90                   	nop
   31488:	90                   	nop
   31489:	90                   	nop
   3148a:	90                   	nop
   3148b:	90                   	nop
   3148c:	90                   	nop
   3148d:	90                   	nop
   3148e:	90                   	nop
   3148f:	90                   	nop

00031490 <hwint01>:
   31490:	6a 01                	push   $0x1
   31492:	e8 be fe ff ff       	call   31355 <int_handler>
   31497:	83 c4 04             	add    $0x4,%esp
   3149a:	f4                   	hlt    
   3149b:	90                   	nop
   3149c:	90                   	nop
   3149d:	90                   	nop
   3149e:	90                   	nop
   3149f:	90                   	nop

000314a0 <hwint02>:
   314a0:	6a 02                	push   $0x2
   314a2:	e8 ae fe ff ff       	call   31355 <int_handler>
   314a7:	83 c4 04             	add    $0x4,%esp
   314aa:	f4                   	hlt    
   314ab:	90                   	nop
   314ac:	90                   	nop
   314ad:	90                   	nop
   314ae:	90                   	nop
   314af:	90                   	nop

000314b0 <hwint03>:
   314b0:	6a 03                	push   $0x3
   314b2:	e8 9e fe ff ff       	call   31355 <int_handler>
   314b7:	83 c4 04             	add    $0x4,%esp
   314ba:	f4                   	hlt    
   314bb:	90                   	nop
   314bc:	90                   	nop
   314bd:	90                   	nop
   314be:	90                   	nop
   314bf:	90                   	nop

000314c0 <hwint04>:
   314c0:	6a 04                	push   $0x4
   314c2:	e8 8e fe ff ff       	call   31355 <int_handler>
   314c7:	83 c4 04             	add    $0x4,%esp
   314ca:	f4                   	hlt    
   314cb:	90                   	nop
   314cc:	90                   	nop
   314cd:	90                   	nop
   314ce:	90                   	nop
   314cf:	90                   	nop

000314d0 <hwint05>:
   314d0:	6a 05                	push   $0x5
   314d2:	e8 7e fe ff ff       	call   31355 <int_handler>
   314d7:	83 c4 04             	add    $0x4,%esp
   314da:	f4                   	hlt    
   314db:	90                   	nop
   314dc:	90                   	nop
   314dd:	90                   	nop
   314de:	90                   	nop
   314df:	90                   	nop

000314e0 <hwint06>:
   314e0:	6a 06                	push   $0x6
   314e2:	e8 6e fe ff ff       	call   31355 <int_handler>
   314e7:	83 c4 04             	add    $0x4,%esp
   314ea:	f4                   	hlt    
   314eb:	90                   	nop
   314ec:	90                   	nop
   314ed:	90                   	nop
   314ee:	90                   	nop
   314ef:	90                   	nop

000314f0 <hwint07>:
   314f0:	6a 07                	push   $0x7
   314f2:	e8 5e fe ff ff       	call   31355 <int_handler>
   314f7:	83 c4 04             	add    $0x4,%esp
   314fa:	f4                   	hlt    
   314fb:	90                   	nop
   314fc:	90                   	nop
   314fd:	90                   	nop
   314fe:	90                   	nop
   314ff:	90                   	nop

00031500 <hwint08>:
   31500:	6a 08                	push   $0x8
   31502:	e8 4e fe ff ff       	call   31355 <int_handler>
   31507:	83 c4 04             	add    $0x4,%esp
   3150a:	f4                   	hlt    
   3150b:	90                   	nop
   3150c:	90                   	nop
   3150d:	90                   	nop
   3150e:	90                   	nop
   3150f:	90                   	nop

00031510 <hwint09>:
   31510:	6a 09                	push   $0x9
   31512:	e8 3e fe ff ff       	call   31355 <int_handler>
   31517:	83 c4 04             	add    $0x4,%esp
   3151a:	f4                   	hlt    
   3151b:	90                   	nop
   3151c:	90                   	nop
   3151d:	90                   	nop
   3151e:	90                   	nop
   3151f:	90                   	nop

00031520 <hwint10>:
   31520:	6a 0a                	push   $0xa
   31522:	e8 2e fe ff ff       	call   31355 <int_handler>
   31527:	83 c4 04             	add    $0x4,%esp
   3152a:	f4                   	hlt    
   3152b:	90                   	nop
   3152c:	90                   	nop
   3152d:	90                   	nop
   3152e:	90                   	nop
   3152f:	90                   	nop

00031530 <hwint11>:
   31530:	6a 0b                	push   $0xb
   31532:	e8 1e fe ff ff       	call   31355 <int_handler>
   31537:	83 c4 04             	add    $0x4,%esp
   3153a:	f4                   	hlt    
   3153b:	90                   	nop
   3153c:	90                   	nop
   3153d:	90                   	nop
   3153e:	90                   	nop
   3153f:	90                   	nop

00031540 <hwint12>:
   31540:	6a 0c                	push   $0xc
   31542:	e8 0e fe ff ff       	call   31355 <int_handler>
   31547:	83 c4 04             	add    $0x4,%esp
   3154a:	f4                   	hlt    
   3154b:	90                   	nop
   3154c:	90                   	nop
   3154d:	90                   	nop
   3154e:	90                   	nop
   3154f:	90                   	nop

00031550 <hwint13>:
   31550:	6a 0d                	push   $0xd
   31552:	e8 fe fd ff ff       	call   31355 <int_handler>
   31557:	83 c4 04             	add    $0x4,%esp
   3155a:	f4                   	hlt    
   3155b:	90                   	nop
   3155c:	90                   	nop
   3155d:	90                   	nop
   3155e:	90                   	nop
   3155f:	90                   	nop

00031560 <hwint14>:
   31560:	6a 0e                	push   $0xe
   31562:	e8 ee fd ff ff       	call   31355 <int_handler>
   31567:	83 c4 04             	add    $0x4,%esp
   3156a:	f4                   	hlt    
   3156b:	90                   	nop
   3156c:	90                   	nop
   3156d:	90                   	nop
   3156e:	90                   	nop
   3156f:	90                   	nop

00031570 <hwint15>:
   31570:	6a 0f                	push   $0xf
   31572:	e8 de fd ff ff       	call   31355 <int_handler>
   31577:	83 c4 04             	add    $0x4,%esp
   3157a:	f4                   	hlt    

0003157b <divide_error>:
   3157b:	6a ff                	push   $0xffffffff
   3157d:	6a 00                	push   $0x0
   3157f:	eb 4e                	jmp    315cf <exception>

00031581 <debug>:
   31581:	6a ff                	push   $0xffffffff
   31583:	6a 01                	push   $0x1
   31585:	eb 48                	jmp    315cf <exception>

00031587 <nmi>:
   31587:	6a ff                	push   $0xffffffff
   31589:	6a 02                	push   $0x2
   3158b:	eb 42                	jmp    315cf <exception>

0003158d <int3>:
   3158d:	6a ff                	push   $0xffffffff
   3158f:	6a 03                	push   $0x3
   31591:	eb 3c                	jmp    315cf <exception>

00031593 <overflow>:
   31593:	6a ff                	push   $0xffffffff
   31595:	6a 04                	push   $0x4
   31597:	eb 36                	jmp    315cf <exception>

00031599 <bounds>:
   31599:	6a ff                	push   $0xffffffff
   3159b:	6a 05                	push   $0x5
   3159d:	eb 30                	jmp    315cf <exception>

0003159f <invalid_op>:
   3159f:	6a ff                	push   $0xffffffff
   315a1:	6a 06                	push   $0x6
   315a3:	eb 2a                	jmp    315cf <exception>

000315a5 <device_not_available>:
   315a5:	6a ff                	push   $0xffffffff
   315a7:	6a 07                	push   $0x7
   315a9:	eb 24                	jmp    315cf <exception>

000315ab <doublefault_fn>:
   315ab:	6a 08                	push   $0x8
   315ad:	eb 20                	jmp    315cf <exception>

000315af <coprocessor_segment_overrun>:
   315af:	6a ff                	push   $0xffffffff
   315b1:	6a 09                	push   $0x9
   315b3:	eb 1a                	jmp    315cf <exception>

000315b5 <invalid_tss>:
   315b5:	6a 0a                	push   $0xa
   315b7:	eb 16                	jmp    315cf <exception>

000315b9 <segment_not_present>:
   315b9:	6a 0b                	push   $0xb
   315bb:	eb 12                	jmp    315cf <exception>

000315bd <stack_segment>:
   315bd:	6a 0c                	push   $0xc
   315bf:	eb 0e                	jmp    315cf <exception>

000315c1 <general_protection>:
   315c1:	6a 0d                	push   $0xd
   315c3:	eb 0a                	jmp    315cf <exception>

000315c5 <page_fault>:
   315c5:	6a 0e                	push   $0xe
   315c7:	eb 06                	jmp    315cf <exception>

000315c9 <coprocessor_error>:
   315c9:	6a ff                	push   $0xffffffff
   315cb:	6a 10                	push   $0x10
   315cd:	eb 00                	jmp    315cf <exception>

000315cf <exception>:
   315cf:	e8 9c fd ff ff       	call   31370 <exception_handler>
   315d4:	83 c4 08             	add    $0x8,%esp
   315d7:	f4                   	hlt    

000315d8 <restart_thread>:
   315d8:	8b 25 00 00 05 00    	mov    0x50000,%esp
   315de:	8d 84 24 48 00 00 00 	lea    0x48(%esp),%eax
   315e5:	a3 44 3c 03 00       	mov    %eax,0x33c44

000315ea <re_entry>:
   315ea:	ff 0d 20 3c 03 00    	decl   0x33c20
   315f0:	0f a9                	pop    %gs
   315f2:	0f a1                	pop    %fs
   315f4:	07                   	pop    %es
   315f5:	1f                   	pop    %ds
   315f6:	61                   	popa   
   315f7:	83 c4 04             	add    $0x4,%esp
   315fa:	cf                   	iret   

000315fb <save>:
   315fb:	60                   	pusha  
   315fc:	1e                   	push   %ds
   315fd:	06                   	push   %es
   315fe:	0f a0                	push   %fs
   31600:	0f a8                	push   %gs
   31602:	66 8c d0             	mov    %ss,%ax
   31605:	8e d8                	mov    %eax,%ds
   31607:	8e c0                	mov    %eax,%es
   31609:	8e e8                	mov    %eax,%gs
   3160b:	c3                   	ret    

0003160c <timer_interrupt>:
   3160c:	55                   	push   %ebp
   3160d:	89 e5                	mov    %esp,%ebp
   3160f:	83 ec 18             	sub    $0x18,%esp
   31612:	a1 20 3c 03 00       	mov    0x33c20,%eax
   31617:	85 c0                	test   %eax,%eax
   31619:	74 0c                	je     31627 <timer_interrupt+0x1b>
   3161b:	c7 04 24 f0 1a 03 00 	movl   $0x31af0,(%esp)
   31622:	e8 79 00 00 00       	call   316a0 <printk>
   31627:	c7 04 24 f2 1a 03 00 	movl   $0x31af2,(%esp)
   3162e:	e8 6d 00 00 00       	call   316a0 <printk>
   31633:	e8 dc f2 ff ff       	call   30914 <current_thread_ticks>
   31638:	89 c1                	mov    %eax,%ecx
   3163a:	ba 67 66 66 66       	mov    $0x66666667,%edx
   3163f:	89 c8                	mov    %ecx,%eax
   31641:	f7 ea                	imul   %edx
   31643:	d1 fa                	sar    %edx
   31645:	89 c8                	mov    %ecx,%eax
   31647:	c1 f8 1f             	sar    $0x1f,%eax
   3164a:	29 c2                	sub    %eax,%edx
   3164c:	89 d0                	mov    %edx,%eax
   3164e:	c1 e0 02             	shl    $0x2,%eax
   31651:	01 d0                	add    %edx,%eax
   31653:	89 ca                	mov    %ecx,%edx
   31655:	29 c2                	sub    %eax,%edx
   31657:	83 fa 03             	cmp    $0x3,%edx
   3165a:	7f 0c                	jg     31668 <timer_interrupt+0x5c>
   3165c:	e8 c0 f2 ff ff       	call   30921 <current_thread_ticks_inc>
   31661:	b8 01 00 00 00       	mov    $0x1,%eax
   31666:	eb 14                	jmp    3167c <timer_interrupt+0x70>
   31668:	e8 b4 f2 ff ff       	call   30921 <current_thread_ticks_inc>
   3166d:	e8 c2 f2 ff ff       	call   30934 <next_thread_to_run>
   31672:	a3 00 00 05 00       	mov    %eax,0x50000
   31677:	b8 01 00 00 00       	mov    $0x1,%eax
   3167c:	c9                   	leave  
   3167d:	c3                   	ret    
   3167e:	90                   	nop
   3167f:	90                   	nop

00031680 <print>:
   31680:	55                   	push   %ebp
   31681:	89 e5                	mov    %esp,%ebp
   31683:	83 ec 18             	sub    $0x18,%esp
   31686:	c7 04 24 7d 1b 03 00 	movl   $0x31b7d,(%esp)
   3168d:	e8 0e 00 00 00       	call   316a0 <printk>
   31692:	c7 04 24 9b 1b 03 00 	movl   $0x31b9b,(%esp)
   31699:	e8 02 00 00 00       	call   316a0 <printk>
   3169e:	c9                   	leave  
   3169f:	c3                   	ret    

000316a0 <printk>:
   316a0:	55                   	push   %ebp
   316a1:	89 e5                	mov    %esp,%ebp
   316a3:	81 ec 28 04 00 00    	sub    $0x428,%esp
   316a9:	8d 55 0c             	lea    0xc(%ebp),%edx
   316ac:	8d 85 f0 fb ff ff    	lea    -0x410(%ebp),%eax
   316b2:	89 10                	mov    %edx,(%eax)
   316b4:	8b 85 f0 fb ff ff    	mov    -0x410(%ebp),%eax
   316ba:	89 44 24 08          	mov    %eax,0x8(%esp)
   316be:	8b 45 08             	mov    0x8(%ebp),%eax
   316c1:	89 44 24 04          	mov    %eax,0x4(%esp)
   316c5:	8d 85 f4 fb ff ff    	lea    -0x40c(%ebp),%eax
   316cb:	89 04 24             	mov    %eax,(%esp)
   316ce:	e8 2c 00 00 00       	call   316ff <__vprintf__>
   316d3:	89 45 f4             	mov    %eax,-0xc(%ebp)
   316d6:	a1 0c 20 03 00       	mov    0x3200c,%eax
   316db:	3d 9f 0f 00 00       	cmp    $0xf9f,%eax
   316e0:	7e 0a                	jle    316ec <printk+0x4c>
   316e2:	c7 05 0c 20 03 00 00 	movl   $0x0,0x3200c
   316e9:	00 00 00 
   316ec:	8d 85 f4 fb ff ff    	lea    -0x40c(%ebp),%eax
   316f2:	89 04 24             	mov    %eax,(%esp)
   316f5:	e8 36 f3 ff ff       	call   30a30 <disp_str>
   316fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
   316fd:	c9                   	leave  
   316fe:	c3                   	ret    

000316ff <__vprintf__>:
   316ff:	55                   	push   %ebp
   31700:	89 e5                	mov    %esp,%ebp
   31702:	83 ec 30             	sub    $0x30,%esp
   31705:	8b 45 0c             	mov    0xc(%ebp),%eax
   31708:	89 45 fc             	mov    %eax,-0x4(%ebp)
   3170b:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
   31712:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
   31719:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
   31720:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
   31727:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
   3172e:	c7 45 de 00 00 00 00 	movl   $0x0,-0x22(%ebp)
   31735:	c7 45 e2 00 00 00 00 	movl   $0x0,-0x1e(%ebp)
   3173c:	66 c7 45 e6 00 00    	movw   $0x0,-0x1a(%ebp)
   31742:	e9 72 01 00 00       	jmp    318b9 <__vprintf__+0x1ba>
   31747:	8b 45 fc             	mov    -0x4(%ebp),%eax
   3174a:	0f b6 00             	movzbl (%eax),%eax
   3174d:	3c 25                	cmp    $0x25,%al
   3174f:	0f 85 4e 01 00 00    	jne    318a3 <__vprintf__+0x1a4>
   31755:	8b 45 fc             	mov    -0x4(%ebp),%eax
   31758:	83 c0 01             	add    $0x1,%eax
   3175b:	0f b6 00             	movzbl (%eax),%eax
   3175e:	0f be c0             	movsbl %al,%eax
   31761:	83 f8 64             	cmp    $0x64,%eax
   31764:	74 3e                	je     317a4 <__vprintf__+0xa5>
   31766:	83 f8 73             	cmp    $0x73,%eax
   31769:	0f 84 fa 00 00 00    	je     31869 <__vprintf__+0x16a>
   3176f:	83 f8 63             	cmp    $0x63,%eax
   31772:	0f 85 39 01 00 00    	jne    318b1 <__vprintf__+0x1b2>
   31778:	8b 45 10             	mov    0x10(%ebp),%eax
   3177b:	8d 50 04             	lea    0x4(%eax),%edx
   3177e:	89 55 10             	mov    %edx,0x10(%ebp)
   31781:	8b 00                	mov    (%eax),%eax
   31783:	89 45 f0             	mov    %eax,-0x10(%ebp)
   31786:	8b 45 f8             	mov    -0x8(%ebp),%eax
   31789:	03 45 08             	add    0x8(%ebp),%eax
   3178c:	8b 55 f0             	mov    -0x10(%ebp),%edx
   3178f:	8b 14 95 20 20 03 00 	mov    0x32020(,%edx,4),%edx
   31796:	0f b6 12             	movzbl (%edx),%edx
   31799:	88 10                	mov    %dl,(%eax)
   3179b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   3179f:	e9 0d 01 00 00       	jmp    318b1 <__vprintf__+0x1b2>
   317a4:	8b 45 10             	mov    0x10(%ebp),%eax
   317a7:	8d 50 04             	lea    0x4(%eax),%edx
   317aa:	89 55 10             	mov    %edx,0x10(%ebp)
   317ad:	8b 00                	mov    (%eax),%eax
   317af:	89 45 f0             	mov    %eax,-0x10(%ebp)
   317b2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
   317b9:	8b 4d f0             	mov    -0x10(%ebp),%ecx
   317bc:	ba 67 66 66 66       	mov    $0x66666667,%edx
   317c1:	89 c8                	mov    %ecx,%eax
   317c3:	f7 ea                	imul   %edx
   317c5:	c1 fa 02             	sar    $0x2,%edx
   317c8:	89 c8                	mov    %ecx,%eax
   317ca:	c1 f8 1f             	sar    $0x1f,%eax
   317cd:	29 c2                	sub    %eax,%edx
   317cf:	89 d0                	mov    %edx,%eax
   317d1:	c1 e0 02             	shl    $0x2,%eax
   317d4:	01 d0                	add    %edx,%eax
   317d6:	01 c0                	add    %eax,%eax
   317d8:	89 ca                	mov    %ecx,%edx
   317da:	29 c2                	sub    %eax,%edx
   317dc:	8d 42 30             	lea    0x30(%edx),%eax
   317df:	8b 04 85 20 20 03 00 	mov    0x32020(,%eax,4),%eax
   317e6:	0f b6 10             	movzbl (%eax),%edx
   317e9:	8d 45 de             	lea    -0x22(%ebp),%eax
   317ec:	03 45 ec             	add    -0x14(%ebp),%eax
   317ef:	88 10                	mov    %dl,(%eax)
   317f1:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
   317f5:	8b 4d f0             	mov    -0x10(%ebp),%ecx
   317f8:	ba 67 66 66 66       	mov    $0x66666667,%edx
   317fd:	89 c8                	mov    %ecx,%eax
   317ff:	f7 ea                	imul   %edx
   31801:	c1 fa 02             	sar    $0x2,%edx
   31804:	89 c8                	mov    %ecx,%eax
   31806:	c1 f8 1f             	sar    $0x1f,%eax
   31809:	89 d1                	mov    %edx,%ecx
   3180b:	29 c1                	sub    %eax,%ecx
   3180d:	89 c8                	mov    %ecx,%eax
   3180f:	89 45 f0             	mov    %eax,-0x10(%ebp)
   31812:	8b 4d f0             	mov    -0x10(%ebp),%ecx
   31815:	ba 67 66 66 66       	mov    $0x66666667,%edx
   3181a:	89 c8                	mov    %ecx,%eax
   3181c:	f7 ea                	imul   %edx
   3181e:	c1 fa 02             	sar    $0x2,%edx
   31821:	89 c8                	mov    %ecx,%eax
   31823:	c1 f8 1f             	sar    $0x1f,%eax
   31826:	29 c2                	sub    %eax,%edx
   31828:	89 d0                	mov    %edx,%eax
   3182a:	c1 e0 02             	shl    $0x2,%eax
   3182d:	01 d0                	add    %edx,%eax
   3182f:	01 c0                	add    %eax,%eax
   31831:	89 ca                	mov    %ecx,%edx
   31833:	29 c2                	sub    %eax,%edx
   31835:	85 d2                	test   %edx,%edx
   31837:	75 80                	jne    317b9 <__vprintf__+0xba>
   31839:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
   3183d:	eb 19                	jmp    31858 <__vprintf__+0x159>
   3183f:	8b 45 f8             	mov    -0x8(%ebp),%eax
   31842:	03 45 08             	add    0x8(%ebp),%eax
   31845:	8d 55 de             	lea    -0x22(%ebp),%edx
   31848:	03 55 ec             	add    -0x14(%ebp),%edx
   3184b:	0f b6 12             	movzbl (%edx),%edx
   3184e:	88 10                	mov    %dl,(%eax)
   31850:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
   31854:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
   31858:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
   3185c:	79 e1                	jns    3183f <__vprintf__+0x140>
   3185e:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
   31862:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   31866:	90                   	nop
   31867:	eb 48                	jmp    318b1 <__vprintf__+0x1b2>
   31869:	8b 45 10             	mov    0x10(%ebp),%eax
   3186c:	8d 50 04             	lea    0x4(%eax),%edx
   3186f:	89 55 10             	mov    %edx,0x10(%ebp)
   31872:	8b 00                	mov    (%eax),%eax
   31874:	89 45 f4             	mov    %eax,-0xc(%ebp)
   31877:	eb 16                	jmp    3188f <__vprintf__+0x190>
   31879:	8b 45 f8             	mov    -0x8(%ebp),%eax
   3187c:	03 45 08             	add    0x8(%ebp),%eax
   3187f:	8b 55 f4             	mov    -0xc(%ebp),%edx
   31882:	0f b6 12             	movzbl (%edx),%edx
   31885:	88 10                	mov    %dl,(%eax)
   31887:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
   3188b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
   3188f:	8b 45 f4             	mov    -0xc(%ebp),%eax
   31892:	0f b6 00             	movzbl (%eax),%eax
   31895:	84 c0                	test   %al,%al
   31897:	75 e0                	jne    31879 <__vprintf__+0x17a>
   31899:	83 6d f8 01          	subl   $0x1,-0x8(%ebp)
   3189d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   318a1:	eb 0e                	jmp    318b1 <__vprintf__+0x1b2>
   318a3:	8b 45 f8             	mov    -0x8(%ebp),%eax
   318a6:	03 45 08             	add    0x8(%ebp),%eax
   318a9:	8b 55 fc             	mov    -0x4(%ebp),%edx
   318ac:	0f b6 12             	movzbl (%edx),%edx
   318af:	88 10                	mov    %dl,(%eax)
   318b1:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
   318b5:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
   318b9:	8b 45 fc             	mov    -0x4(%ebp),%eax
   318bc:	0f b6 00             	movzbl (%eax),%eax
   318bf:	84 c0                	test   %al,%al
   318c1:	0f 85 80 fe ff ff    	jne    31747 <__vprintf__+0x48>
   318c7:	8b 45 f8             	mov    -0x8(%ebp),%eax
   318ca:	03 45 08             	add    0x8(%ebp),%eax
   318cd:	c6 00 00             	movb   $0x0,(%eax)
   318d0:	b8 01 00 00 00       	mov    $0x1,%eax
   318d5:	c9                   	leave  
   318d6:	c3                   	ret    
