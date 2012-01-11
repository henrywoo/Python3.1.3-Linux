
/* Grammar interface */

#ifndef Py_GRAMMAR_H
#define Py_GRAMMAR_H
#ifdef __cplusplus
extern "C" {
#endif

#include "bitset.h" /* Sigh... */

/* A label of an arc */
/*Label定义了从状态转移到另外一个状态所经过的边所对应的符号，可以是
非终结符(Non-Terminal)，也可以是终结符(Terminal)。Label一定依附于一条
或者多条边。Lb_type代表符号的类型，如终结符NAME，代表一个标示符，或
者非终结符stmt，代表一个语句，等等。Lb_str代表具体符号的内容。比如，
label (NAME, “if”)表示当parser处于某个状态，如果遇到了’if’这个标示符，
则移动另外一个状态。如果label是一个非终结符的话，情况则要复杂一些，
需要跳转到该非终结符对应的另外一个DFA，请参看编译器相关书籍*/
typedef struct {
    int		 lb_type;
    char	*lb_str;
} label;

#define EMPTY 0		/* Label number 0 is by definition the empty label */

/* A list of labels */

typedef struct {
    int		 ll_nlabels;
    label	*ll_label;
} labellist;

/* An arc from one state to another */
/*arc代表DFA中一个状态到另一个状态的弧/边。A_lbl代表arc所对应的Label，
而a_arrow记录了arc的目标状态。因为arc是属于某个状态的，
因此不用记录arc的起始状态*/
typedef struct {
    short	a_lbl;		/* Label of this arc */
    short	a_arrow;	/* State where this arc goes to */
} arc;

/* A state in a DFA */
/*State代表着DFA中的状态节点。每个state记录了从该state出发的边的集合，
存放在s_arc中。其他的一些成员s_lower, s_upper, s_accel, s_accept记录了
state所对应的Accelerator，其作用会在后面讲述。注意Accelerator信息并没
有定义在graminit.c中，而是在运行时计算出来的*/
typedef struct {
    int		 s_narcs;
    arc		*s_arc;		/* Array of arcs */
	
    /* Optional accelerators */
    int		 s_lower;	/* Lowest label index */
    int		 s_upper;	/* Highest label index */
    int		*s_accel;	/* Accelerator */
    int		 s_accept;	/* Nonzero for accepting state */
} state;

/* A DFA */
/*DFA结构中记录了起始状态d_initial和所有状态的集合d_state。d_first记录
了该DFA所对应的非终结符的firstset，也就是说，当遇到firstset中的终结符
的时候，便需要跳转到此DFA中。d_first在后面计算Accelerators的时候会被
用到*/
typedef struct {
    int		 d_type;	/* Non-terminal this represents */
    char	*d_name;	/* For printing */
    int		 d_initial;	/* Initial state */
    int		 d_nstates;
    state	*d_state;	/* Array of states */
    bitset	 d_first;
} dfa;

/* A grammar */
/*Grammar代表了Python的整个语法，记录了所有的DFA和所有的label。G_start
则是Python语法的起始symbol，一般是single_input。不过实际的起始symbol可
以在创建Parser的时候指定，可以是single_input, file_input, eval_input中
的一个*/
typedef struct {
    int		 g_ndfas;
    dfa		*g_dfa;		/* Array of DFAs */
    labellist	 g_ll;
    int		 g_start;	/* Start symbol of the grammar */
    int		 g_accel;	/* Set if accelerators present */
} grammar;

/* FUNCTIONS */

grammar *newgrammar(int start);
dfa *adddfa(grammar *g, int type, char *name);
int addstate(dfa *d);
void addarc(dfa *d, int from, int to, int lbl);
dfa *PyGrammar_FindDFA(grammar *g, int type);

int addlabel(labellist *ll, int type, char *str);
int findlabel(labellist *ll, int type, char *str);
char *PyGrammar_LabelRepr(label *lb);
void translatelabels(grammar *g);

void addfirstsets(grammar *g);

void PyGrammar_AddAccelerators(grammar *g);
void PyGrammar_RemoveAccelerators(grammar *);

void printgrammar(grammar *g, FILE *fp);
void printnonterminals(grammar *g, FILE *fp);

#ifdef __cplusplus
}
#endif
#endif /* !Py_GRAMMAR_H */
