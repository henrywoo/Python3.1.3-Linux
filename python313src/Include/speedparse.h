#include "grammar.h"

unsigned short type2label[82+256] = {
7,21,154,155,2,105,106,13,15,149,150,25,30,36,138,139,31,141,129,133,120,121,29,76,142,0,151,153,122,126,124,123,144,131,135,136,32,47,48,49,50,51,52,53,54,55,56,57,143,58,11,23,77,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,5,8,10,16,17,19,22,27,28,33,34,6,3,35,37,45,38,39,40,62,63,64,66,65,41,72,73,79,81,78,75,12,42,43,44,4,85,86,87,88,89,90,102,99,26,24,109,108,110,107,112,114,117,119,118,103,128,130,132,134,137,140,145,146,148,147,160,161,162,60,9,152,18,14,164,165,159,166,167,168,46,};

#define labelindex2string label
labelindex2string type2label2[34] = { 
{20, "def"},
{59, "del"},
{61, "pass"},
{67, "break"},
{68, "continue"},
{69, "return"},
{70, "raise"},
{71, "from"},
{74, "import"},
{80, "as"},
{82, "global"},
{83, "nonlocal"},
{84, "assert"},
{91, "if"},
{92, "elif"},
{93, "else"},
{94, "while"},
{95, "until"},
{96, "for"},
{97, "in"},
{98, "try"},
{100, "finally"},
{101, "with"},
{104, "except"},
{111, "lambda"},
{113, "or"},
{115, "and"},
{116, "not"},
{127, "is"},
{156, "None"},
{157, "True"},
{158, "False"},
{163, "class"},
{169, "yield"},
};


    /*#define ENDMARKER	0
    #define NAME		1
    #define NUMBER		2
    #define STRING		3
    #define NEWLINE		4
    #define INDENT		5
    #define DEDENT		6
    #define LPAR		7
    #define RPAR		8
    #define LSQB		9
    #define RSQB		10
    #define COLON		11
    #define COMMA		12
    #define SEMI		13
    #define PLUS		14
    #define MINUS		15
    #define STAR		16
    #define SLASH		17
    #define VBAR		18
    #define AMPER		19
    #define LESS		20
    #define GREATER		21
    #define EQUAL		22
    #define DOT		23
    #define PERCENT		24
    //#define BACKQUOTE	25
    #define LBRACE		26
    #define RBRACE		27
    #define EQEQUAL		28
    #define NOTEQUAL	29
    #define LESSEQUAL	30
    #define GREATEREQUAL	31
    #define TILDE		32
    #define CIRCUMFLEX	33
    #define LEFTSHIFT	34
    #define RIGHTSHIFT	35
    #define DOUBLESTAR	36
    #define PLUSEQUAL	37
    #define MINEQUAL	38
    #define STAREQUAL	39
    #define SLASHEQUAL	40
    #define PERCENTEQUAL	41
    #define AMPEREQUAL	42
    #define VBAREQUAL	43
    #define CIRCUMFLEXEQUAL	44
    #define LEFTSHIFTEQUAL	45
    #define RIGHTSHIFTEQUAL	46
    #define DOUBLESTAREQUAL	47
    #define DOUBLESLASH	48
    #define DOUBLESLASHEQUAL 49
    #define AT              50	
    #define RARROW          51
    #define ELLIPSIS        52
    #define OP		53
    #define ERRORTOKEN	54
    #define N_TOKENS	55
    #define NT_OFFSET		256
    #define ISTERMINAL(x)		((x) < NT_OFFSET)
    #define ISNONTERMINAL(x)	((x) >= NT_OFFSET)
    #define ISEOF(x)		((x) == ENDMARKER)*/
