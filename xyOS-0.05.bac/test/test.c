/*这个测试是为了检验我们的idt是否加载成功，通过打开时钟中断，并且其处理函数为print函数进行检验，你也可以自己打开喜欢的中断，如键盘中断，但是要初始化对应的中断描述符表中的表项。你懂得.....^_^......*/

void test_idt (void)
{
	outb_pic (0, 0x21);	/*这个是打开时钟中断*/
	outb_pic (0xff, 0xa1);	/*而关闭其它的中断。*/
}
