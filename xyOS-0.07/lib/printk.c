#include<stdio.h>
#include<stdarg.h>
#include"printk.h"

char *ASCLL_TAB[128] = {"","","","","","","","","","",
						"","","","","","","","","","",
						"","","","","","","","","","",
						"","","","","","","","","","",
						"","","","","","","","","0","1",
						"2","3","4","5","6","7","8","9",":",";",
						"<","=",">",":","@","A","B","C","D","E",
						"F","G","H","I","J","K","L","M","N","O",
						"P","Q","R","S","T","U","V","W","X","Y",
						"Z","","","","","","","a","b","c",
						"d","e","f","g","h","i","j","k","l","m",
						"n","o","p","q","r","s","t","u","v","w",
						"x","y","z","","","","","",};


int printk (const char *fmt, ...);
int __vprintf__ (char *buf, const char *fmt, va_list args);

int print (void)
{
	printk ("111111111111111111111111111i\n");
	printk ("22222222222222222222222\n");
}

int printk (const char *fmt, ...)
{
	char print_buf[1024];
	va_list args;
	int r;

	va_start (args, fmt);
	r = __vprintf__ (print_buf, fmt, args);
	va_end (args);
	disp_str (print_buf);
	return r;
}

int __vprintf__ (char *buf, const char *fmt, va_list args)
{
	char *p = fmt;
	int count = 0;
	char *tmp = NULL;
	int tmpnum = 0;
	char *tmpch = 0;
	int tmpcount = 0;
	char tmparr[10] = {0};
	while (*p != '\0')
	{
		if (*p == '%')
			switch (*(p + 1))
			{
				case 'c': tmpnum = va_arg (args, int);
						  buf[count] = *ASCLL_TAB[tmpnum];
						  p ++;
						  break;
				case 'd': tmpnum = va_arg (args, int);
						  tmpcount = 0;
						  do{
							  tmparr[tmpcount] = *ASCLL_TAB[tmpnum % 10 + 48];
							  tmpcount ++;
							  tmpnum /= 10;
						  }while (tmpnum % 10 != 0);
						  tmpcount --;
						  while (tmpcount >= 0)
						  {
						  	buf[count] = tmparr[tmpcount];
							count ++;
							tmpcount --;
						  }
						  count --;
						  p ++;
						  break;
				case 's': tmp = va_arg (args, char *);
						  while (*tmp != 0)
						  {
							  buf[count] = *tmp;
							  count ++;
							  tmp ++;
						  }
						  count --;
						  p ++;
						  break;
			}
		else
			buf[count] = *p;
		count ++;
		p ++;
	}
	buf[count] = '\0';

	return 1;
}
