grammar Polh;

/**
 * Lexer
 */

/* skip whitespaces for the moment */

ASTERISK            : '*' ;
SLASH               : '/' ;
PLUS                : '+' ;
MINUS               : '-' ;
MODULO              : 'mod' ;
LPARENTHESE 		: '(' ;
RPARENTHESE 		: ')' ;

fragment LOWERCASE  : [a-z] ;
fragment UPPERCASE  : [A-Z] ;
fragment DIGIT      : [0-9] ;
 
IDENTIFIER          : (LOWERCASE | UPPERCASE)+ ;

NUMBER         : DIGIT+ ([.,] DIGIT+)? ;
NEWLINE        : ('\r\n'|'\n'|'\r') ;
WS             : ' ' ;

/**
 * Parser
 */

program             : line (NEWLINE line?)* EOF;
line 				: expression;

expression          : LPARENTHESE WS+ expression WS+ RPARENTHESE               #parenthesisExp
                    | expression WS+ (ASTERISK|SLASH|MODULO) WS+ expression    #mulDivExp
                    | expression WS+ (PLUS|MINUS) WS+ expression               #addSubExp
                    | NUMBER                                           #numericAtomExp
                    | IDENTIFIER                                       #idAtomExp
                    ;

