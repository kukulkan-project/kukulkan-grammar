/*
 [The "BSD licence"]
 Copyright (c) 2017 Daniel Cortes Pichardo
 All rights reserved.
 
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions
 are met:
 1. Redistributions of source code must retain the above copyright
    notice, this list of conditions and the following disclaimer.
 2. Redistributions in binary form must reproduce the above copyright
    notice, this list of conditions and the following disclaimer in the
    documentation and/or other materials provided with the distribution.
 3. The name of the author may not be used to endorse or promote products
    derived from this software without specific prior written permission.
 
 THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
 IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
 INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

/** A kukulkan grammar 1.0 for ANTLR v4.
 *  
 *  @autor: Daniel Cortes Pichardo 
 *
 *  GrammarLexer used in the kukulkan-core generator
 *
 */
lexer grammar kukulkanLexer;

ENTITY
:
	'entity'
;

STRING
:
	'String'
;

/** 
 * INTEGER Token
 *  
 */
INTEGER
:
	'Integer'
;

/** 
 * LONG Token
 *  
 */
LONG
:
	'Long'
;

/** 
 * BIG_DECIMAL Token
 *  
 */
BIG_DECIMAL
:
	'BigDecimal'
;

/** 
 * FLOAT Token
 *  
 */
FLOAT
:
	'Float'
;

/** 
 * DOUBLE Token
 *  
 */
DOUBLE
:
	'Double'
;

/** 
 * BOOLEAN_TYPE Token
 *  
 */
BOOLEAN_TYPE
:
	'Boolean'
;

/** 
 * DATE Token
 *  
 */
DATE
:
	'Date'
;

/** 
 * LOCAL_DATE Token
 *  
 */
LOCAL_DATE
:
	'LocalDate'
;

/** 
 * ZONED_DATETIME Token
 *  
 */
ZONED_DATETIME
:
	'ZonedDateTime'
;

/** 
 * INSTANT Token
 *  
 */
INSTANT
:
	'Instant'
;

/** 
 * BLOB Token
 *  
 */
BLOB
:
	'Blob'
;

/** 
 * ANY_BLOB Token
 *  
 */
ANY_BLOB
:
	'AnyBlob'
;

/** 
 * IMAGE_BLOB Token
 *  
 */
IMAGE_BLOB
:
	'ImageBlob'
;

/** 
 * TEXT_BLOB Token
 *  
 */
TEXT_BLOB
:
	'TextBlob'
;

ONE_TO_MANY
:
	'OneToMany'
;

MANY_TO_ONE
:
	'ManyToOne'
;

ONE_TO_ONE
:
	'OneToOne'
;

MANY_TO_MANY
:
	'ManyToMany'
;

NUMERIC_VALUE
:
	[0-9]+
;

PATTERN_VALUE
:
	'"' .*? '"'
;

MIN
:
	'min'
;

MAX
:
	'max'
;

// §3.10.7 The Null Literal

NullLiteral
:
	'null'
;

// §3.11 Separators

LPAREN
:
	'('
;

RPAREN
:
	')'
;

LBRACE
:
	'{'
;

RBRACE
:
	'}'
;

LBRACK
:
	'['
;

RBRACK
:
	']'
;

SEMI
:
	';'
;

COMMA
:
	','
;

DOT
:
	'.'
;

ELLIPSIS
:
	'...'
;

AT
:
	'@'
;

COLONCOLON
:
	'::'
;

SEMICOLON
:
	':'
;

REQUIRED
:
	'required'
;

PATTERN
:
	'pattern'
;

ID
:
	[a-zA-Z$_]+
;

WS
:
	[ \t\r\n\u000C]+ -> skip
;

COMMENT
:
	'/*' .*? '*/' -> channel ( HIDDEN )
;

LINE_COMMENT
:
	'//' ~[\r\n]* -> channel ( HIDDEN )
;

fragment
JavaLetterOrDigit
:
	[a-zA-Z0-9$_] // these are the "java letters or digits" below 0x7F

	| // covers all characters above 0x7F which are not a surrogate
	~[\u0000-\u007F\uD800-\uDBFF]
	| // covers UTF-16 surrogate pairs encodings for U+10000 to U+10FFFF
	[\uD800-\uDBFF] [\uDC00-\uDFFF]
;
