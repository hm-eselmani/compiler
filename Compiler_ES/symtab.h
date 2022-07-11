#ifndef SYMTAB_H
#define SYMTAB_H 

typedef struct node {
  /* required */
  struct node *next;
  char *name;
  int level;
  /* may be other stuff */
  int defined;

}  node;

/* The following functions use *n as a key 
   they return a node pointer p with p->name equal to n if such a node exists
   or NULL otherwise.
*/
extern node *insert(char *n);  /* create a new node and return its address */
extern node *lookup(char *n);  /* search for a node */
extern node *delete(char *n);  /* delete the (most recently added) node and return its address */

extern int level;              /* the current nesting level */
extern void scope_open(void);  /* increment the current nesting level */
extern void scope_close(void); /* decrement the current nesting level 
                                  and delete all nodes with a higher level */

#endif
