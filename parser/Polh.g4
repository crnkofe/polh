grammar Polh;

/**
 * Lexer
 */


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
 

WHITESPACE          : (' ') ;
IDENTIFIER          : (LOWERCASE | UPPERCASE)+ ;

NUMBER         : DIGIT+ ([.,] DIGIT+)? ;
NEWLINE        : ('\r'? '\n' | '\r')+ ;

/**
 * Parser
 */

program             : line+ EOF;
line                : expression NEWLINE;

expression          : LPARENTHESE expression RPARENTHESE        #parenthesisExp
                    | expression (ASTERISK|SLASH|MODULO) expression    #mulDivExp
                    | expression (PLUS|MINUS) expression        #addSubExp
                    | NUMBER                                    #numericAtomExp
                    | IDENTIFIER                                #idAtomExp
                    ;

