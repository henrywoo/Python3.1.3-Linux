
/* Grammar interface */

#ifndef Py_GRAMMAR_H
#define Py_GRAMMAR_H
#ifdef __cplusplus
extern "C" {
#endif

#include "bitset.h" /* Sigh... */

/* A label of an arc */
/*Label�����˴�״̬ת�Ƶ�����һ��״̬�������ı�����Ӧ�ķ��ţ�������
���ս��(Non-Terminal)��Ҳ�������ս��(Terminal)��Labelһ��������һ��
���߶����ߡ�Lb_type������ŵ����ͣ����ս��NAME������һ����ʾ������
�߷��ս��stmt������һ����䣬�ȵȡ�Lb_str���������ŵ����ݡ����磬
label (NAME, ��if��)��ʾ��parser����ĳ��״̬����������ˡ�if�������ʾ����
���ƶ�����һ��״̬�����label��һ�����ս���Ļ��������Ҫ����һЩ��
��Ҫ��ת���÷��ս����Ӧ������һ��DFA����ο�����������鼮*/
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
/*arc����DFA��һ��״̬����һ��״̬�Ļ�/�ߡ�A_lbl����arc����Ӧ��Label��
��a_arrow��¼��arc��Ŀ��״̬����Ϊarc������ĳ��״̬�ģ�
��˲��ü�¼arc����ʼ״̬*/
typedef struct {
    short	a_lbl;		/* Label of this arc */
    short	a_arrow;	/* State where this arc goes to */
} arc;

/* A state in a DFA */
/*State������DFA�е�״̬�ڵ㡣ÿ��state��¼�˴Ӹ�state�����ıߵļ��ϣ�
�����s_arc�С�������һЩ��Աs_lower, s_upper, s_accel, s_accept��¼��
state����Ӧ��Accelerator�������û��ں��潲����ע��Accelerator��Ϣ��û
�ж�����graminit.c�У�����������ʱ���������*/
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
/*DFA�ṹ�м�¼����ʼ״̬d_initial������״̬�ļ���d_state��d_first��¼
�˸�DFA����Ӧ�ķ��ս����firstset��Ҳ����˵��������firstset�е��ս��
��ʱ�򣬱���Ҫ��ת����DFA�С�d_first�ں������Accelerators��ʱ��ᱻ
�õ�*/
typedef struct {
    int		 d_type;	/* Non-terminal this represents */
    char	*d_name;	/* For printing */
    int		 d_initial;	/* Initial state */
    int		 d_nstates;
    state	*d_state;	/* Array of states */
    bitset	 d_first;
} dfa;

/* A grammar */
/*Grammar������Python�������﷨����¼�����е�DFA�����е�label��G_start
����Python�﷨����ʼsymbol��һ����single_input������ʵ�ʵ���ʼsymbol��
���ڴ���Parser��ʱ��ָ����������single_input, file_input, eval_input��
��һ��*/
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
