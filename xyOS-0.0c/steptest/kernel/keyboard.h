#define NR_SCAN_CODES 0x80
#define MAP_COLS 3

#define KB_IN_BYTES	32


typedef struct{
	char *p_head;
	char * p_tail;
	int count;
	char buf[KB_IN_BYTES];
}KB_INPUT;
