grammar Polh;

/**
 * Lexer
 */

fragment LOWERCASE  : [a-z] ;
fragment UPPERCASE  : [A-Z] ;

WORD                : (LOWERCASE | UPPERCASE)+ ;
WHITESPACE          : (' ') ;

fragment DIGIT : [0-9] ;
NUMBER         : DIGIT+ ([.,] DIGIT+)? ;
NEWLINE        : ('\r'? '\n' | '\r')+ ;


/**
 * Parser
 */

program             : line+ EOF ;
line                :  NEWLINE;
