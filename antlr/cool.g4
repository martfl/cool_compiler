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


Else: E L S E;
BoolConst: TRUE | FALSE;

Dot: '.';
Minus: '-';
IntConst: [0-9]+;
TypeId: [A-Z][_a-zA-Z0-9]* ;
ObjectId: [a-z][_a-zA-Z0-9]* ;


WS : [ \n\u000D] -> skip ;
