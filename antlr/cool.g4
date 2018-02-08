grammar cool;           
prog: ;

fragment A : [aA] ;
fragment B : [bB] ;
fragment C : [cC] ;
fragment D : [dD] ;
fragment E : [eE] ;
fragment F : [fF] ;
fragment G : [gG] ;
fragment H : [hH] ;
fragment I : [iI] ;
fragment J : [jJ] ;
fragment K : [kK] ;
fragment L : [lL] ;
fragment M : [mM] ;
fragment N : [nN] ;
fragment O : [oO] ;
fragment P : [pP] ;
fragment Q : [qQ] ;
fragment R : [rR] ;
fragment S : [sS] ;
fragment T : [tT] ;
fragment U : [uU] ;
fragment V : [vV] ;
fragment W : [wW] ;
fragment X : [xX] ;
fragment Y : [yY] ;
fragment Z : [zZ] ;

fragment TRUE : 't' R U E;
fragment FALSE : 'f' A L S E;


/*
Token names:
Keywords:
Class Fi If In Inherits Isvoid Let Loop Pool Then Else 
While Case Esac New Of Not 

Symbols:
Lbrace Tbrace Lparen Rparen Semi Colon Mult Div Plus Minus 
Neg Lt Le Eq At Assign Darrow Comma Dot 

Literals:
IntConst BoolConst TypeId ObjectId StrConst

*/


Klass: C L A S S;
New: N E W;
If: I F;
Fi: F I;
Case: C A S E;
Esac: E S A C;
Of: O F;
Else: E L S E;
Let: L E T;
Inherits: I N H E R I T S;
In: I N;
While: W H I L E;
Loop: L O O P;
Pool: P O O L;
Then: T H E N;
BoolConst: TRUE | FALSE;

fragment STR_TEXT: ( ~["\r\n\\] | ESC_SEQ )+ ;
fragment ESC_SEQ : '\\' ( [btf"\\] | EOF );
fragment EOL     : '\r'? '\n' ;

StrConst: '"' ( STR_TEXT | EOL )* '"' {self.text = self.text[1:len(self.text)-1]};
IntConst: [0-9]+;
TypeId: [A-Z][_a-zA-Z0-9]* ;
ObjectId: [a-z][_a-zA-Z0-9]* ;
Semi: ';';
Colon: ':';
Dot: '.';
Comma: ',';
Plus: '+';
Minus: '-';
Mult: '*';
Div: '/';
Neg: '~';
Assign: '<-';
Darrow: '=>';
Eq: '=';
Le: '<=';
Lt: '<';
At: '@';
Lbrace: '{';
Rbrace: '}';
Lparen: '(';
Rparen: ')';

OPEN_COMMENT: '(*';
CLOSE_COMMENT: '*)';
COMMENT: OPEN_COMMENT (COMMENT|.)*? CLOSE_COMMENT -> skip;
ONE_LINE_COMMENT: '--' .*? '\n' -> skip;
WHITESPACE: [ \t\r\n\f]+ -> skip; 