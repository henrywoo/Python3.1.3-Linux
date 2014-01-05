
/* Parser accelerator module */

/* The parser as originally conceived had disappointing performance.
   This module does some precomputation that speeds up the selection
   of a DFA based upon a token, turning a search through an array
   into a simple indexing operation.  The parser now cannot work
   without the accelerators installed.  Note that the accelerators
   are installed dynamically when the parser is initialized, they
   are not part of the static data structure written on graminit.[ch]
   by the parser generator. */

#include "pgenheaders.h"
#include "grammar.h"
#include "node.h"
#include "token.h"
#include "parser.h"

/* Forward references */
static void fixdfa(grammar *, dfa *);
static void fixstate(grammar *, state *);

void
PyGrammar_AddAccelerators(grammar *g)
{
    dfa *d;
    int i;
    d = g->g_dfa;
    for (i = g->g_ndfas; --i >= 0; d++)
        fixdfa(g, d);
    g->g_accel = 1;
}

void
PyGrammar_RemoveAccelerators(grammar *g)
{
    dfa *d;
    int i;
    g->g_accel = 0;
    d = g->g_dfa;
    for (i = g->g_ndfas; --i >= 0; d++) {
        state *s;
        int j;
        s = d->d_state;
        for (j = 0; j < d->d_nstates; j++, s++) {
            if (s->s_accel)
                PyObject_FREE(s->s_accel);
            s->s_accel = NULL;
        }
    }
}

static void
fixdfa(grammar *g, dfa *d)
{
    state *s;
    int j;
    s = d->d_state;
    printf("dfa name:%s\n",d->d_name);
    for (j = 0; j < d->d_nstates; j++, s++)
        fixstate(g, s);
}

//extern label labels[168];//fuheng
//extern label labels[170];

static void fixstate(grammar *_grammar, state *_state)
{
    arc *tmp_arc;
    int k;
    int *accel;
    int nl = _grammar->g_ll.ll_nlabels;
    _state->s_accept = 0;
    accel = (int *) PyObject_MALLOC(nl * sizeof(int));
    if (accel == NULL) {
        fprintf(stderr, "no mem to build parser accelerators\n");
        exit(1);
    }
    memset(accel,-1,nl*sizeof(*accel));
    //for (k = 0; k < nl; k++)
    //    accel[k] = -1;
    tmp_arc = _state->s_arc;
    for (k = _state->s_narcs; --k >= 0; tmp_arc++) {
        int lbl = tmp_arc->a_lbl;
        label *tmp_label = &_grammar->g_ll.ll_label[lbl];
        int type = tmp_label->lb_type;//注意type是label本身的类型！
        if (tmp_arc->a_arrow >= (1 << 7)) {
            printf("XXX too many states!\n");
            continue;
        }
        if (ISNONTERMINAL(type)) {//1. label is nonterminal, then need go to another DFA
            //dfa *d1 = PyGrammar_FindDFA(_grammar, type);
            int dfa_id_ = type - NT_OFFSET;
            dfa *tmp_dfa = & _grammar->g_dfa[dfa_id_];
            int ibit;
            if (dfa_id_ >= (1 << 7)) {
                printf("XXX too high nonterminal number!\n");
                continue;
            }
            for (ibit = 0; ibit < _grammar->g_ll.ll_nlabels; ibit++) {
                if (testbit(tmp_dfa->d_first, ibit)) {
                    if (accel[ibit] != -1)
                        printf("XXX ambiguity!\n");
                    accel[ibit] = tmp_arc->a_arrow | (1 << 7) | ((dfa_id_) << 8);// 13 21
                    printf("lb_type=%d, lb_id=%d, to_state=%d, dfa_id=%d\n", 
                        _grammar->g_ll.ll_label[ibit].lb_type, ibit, tmp_arc->a_arrow, dfa_id_+NT_OFFSET);
                }
            }
        }
        else if (lbl == EMPTY)// 2.if label is empty, then enter ACCEPT state
            _state->s_accept = 1;
        else if (lbl >= 0 && lbl < nl){//3. label is a terminal
            accel[lbl] = tmp_arc->a_arrow;
            printf("lb_type=%d, lb_id=%d, to_state=%d\n", _grammar->g_ll.ll_label[lbl].lb_type, lbl, tmp_arc->a_arrow);
        }
    }
    while (nl > 0 && accel[nl-1] == -1)
        nl--;
    for (k = 0; k < nl && accel[k] == -1;)
        k++;
    if (k < nl) {
        int i;
        _state->s_accel = (int *) PyObject_MALLOC((nl-k) * sizeof(int));
        if (_state->s_accel == NULL) {
            fprintf(stderr, "no mem to add parser accelerators\n");
            exit(1);
        }
        _state->s_lower = k;
        _state->s_upper = nl;
        for (i = 0; k < nl; i++, k++)
            _state->s_accel[i] = accel[k];
    }
    PyObject_FREE(accel);
}
