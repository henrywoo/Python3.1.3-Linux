#include <Python.h>
#include <pyarena.h>
#include <Python-ast.h>


void t(){
  //node* cstnode=PyNode_New();
}

void t2(){
  _stmt s;

  stmt_ty p;
  p = (stmt_ty)PyArena_Malloc(arena, sizeof(*p));
  if (!p)
    return NULL;
  p->kind = While_kind;
  p->v.While.test = test;
  p->v.While.body = body;
  p->v.While.orelse = orelse;
  p->lineno = lineno;
  p->col_offset = col_offset;
  printf("%d\n",sizeof(s));
}

int main(){
  t2();
  //asdl_seq_new()
  printf("%d\n",sizeof(asdl_seq));

  int size = 2;
  PyArena *arena = PyArena_New();
  asdl_seq as;

  asdl_seq *seq = &as;
  size_t n = sizeof(asdl_seq)+ (size ? (sizeof(void *)* (size - 1)) : 0);

  seq = (asdl_seq *)PyArena_Malloc(arena, n);
  if (!seq) {
    PyErr_NoMemory();
    return NULL;
  }
  memset(seq, 0, n);
  seq->size = size;

  asdl_seq *p = (asdl_seq *)seq->elements[2];

  PyArena_Free(arena);

  return 0;
}
