#include "../include/global.h"
#include "../include/type.h"

#define offsetof(TYPE, MEMBER) ((u8) &((TYPE *) 0)->MEMBER)
#define list_entry(LIST_ELEM, STRUCT, MEMBER)           \
        ((STRUCT *) ((u8 *) &(LIST_ELEM)->next		\
			- offsetof (STRUCT, MEMBER.next))) 


struct list_head;

struct list_head
{
	struct list_head *prev;
	struct list_head *next;
};

struct list
{
	struct list_head head;
	struct list_head tail;
};


/*链表初始化*/
int list_init (struct list *list)
{
	list->head.next = &list->tail;
	list->head.prev = NULL;
	list->tail.prev = &list->head;
	list->tail.next = NULL;
	return 1;
}

/*判断链表是否为空*/
int list_empty (struct list *list)
{
	if (&list->head == &list->tail && &list->tail == &list->head)
		return 1;
	else
		return 0;
}

/*给链表中当前节点之后添加一个节点*/
int list_insert_next (struct list_head *prev, struct list_head *next)
{
	next->next = prev->next;
	next->prev = prev;
	prev->next->prev = next;
	prev->next = next;
	return 1;
}

/*给链表中当前节点之前添加一个节点*/
int list_insert_prev (struct list_head *prev, struct list_head *next)
{
	prev->next = next;
	prev->prev = next->prev;
	next->prev->next = prev;
	next->prev = prev;
	return 1;
}


