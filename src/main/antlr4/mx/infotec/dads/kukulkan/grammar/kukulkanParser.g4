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
 *  GrammarParser used in the kukulkan-core generator
 *
 */
parser grammar kukulkanParser;

options {
	tokenVocab = kukulkanLexer;
}

/**
 * Domain Model Rule
 */
domainModel
:
	entities += entity+
;

/** 
 * Entity Rule
 *  
 */
entity
:
	ENTITY name = ID
	(
		LPAREN tableName = ID RPAREN
	)?
	(
		LBRACE
		(
			fields += entityField
			(
				COMMA? fields += entityField
			)*
		)? RBRACE
	)?
;

/** 
 * Entity Field Rule
 *  
 */
entityField
:
	primitiveField
	| associationField
;

primitiveField
:
	id = ID SEMICOLON type = fieldType
;
/** 
 * Field Type Rule
 *  
 */
fieldType
:
	stringFieldType
	| numericFieldType
	| booleanFieldType
	| dateFieldType
	| blobFieldType
;

/** 
 * Entity Type Rule
 *  
 */
associationField
:
	type = cardinality id = ID SEMICOLON targetEntity = ID
;

/** 
 * String Field Type Rule
 *  
 */
stringFieldType
:
	name = stringType constraints += stringValidators*
;

/** 
 * String Type Rule
 *  
 */
stringType
:
	STRING
;

/** 
 * Numeric Field Type Rule
 *  
 */
numericFieldType
:
	name = numericTypes constraints += numericValidators*
;

/** 
 * Numeric Types Rule
 *  
 */
numericTypes
:
	INTEGER
	| LONG
	| BIG_DECIMAL
	| FLOAT
	| DOUBLE
;

/** 
 * Boolean Field Type Token
 *  
 */
booleanFieldType
:
	name = BOOLEAN_TYPE required = requiredValidator*
;

/** 
 * Date Field Type Rule
 *  
 */
dateFieldType
:
	type = dateTypes required = requiredValidator?
;

/** 
 * Date Types Rule
 *  
 */
dateTypes
:
	DATE
	| LOCAL_DATE
	| ZONED_DATETIME
	| INSTANT
;

/** 
 * Blob Field Type Rule
 *  
 */
blobFieldType
:
	name = blobTypes constraints += blobValidators*
;

/** 
 * Blob Types Rule
 *  
 */
blobTypes
:
	BLOB
	| ANY_BLOB
	| IMAGE_BLOB
	| TEXT_BLOB
;

/* =========================================================================
 * VALIDATOR
 * ========================================================================= */
stringValidators
:
	required = requiredValidator
	| minLenght = minValidator
	| maxLenght = maxValidator
	| pattern = patternValidator
;

numericValidators
:
	required = requiredValidator
	| minValue = minValidator
	| maxValue = maxValidator
;

blobValidators
:
	required = requiredValidator
	| minBytesValue = minValidator
	| maxBytesValue = maxValidator
;

requiredValidator
:
	REQUIRED
;

patternValidator
:
	PATTERN LPAREN PATTERN_VALUE RPAREN
;

minValidator
:
	MIN LPAREN NUMERIC_VALUE RPAREN
;

maxValidator
:
	MAX LPAREN NUMERIC_VALUE RPAREN
;

cardinality
:
	ONE_TO_MANY
	| MANY_TO_ONE
	| ONE_TO_ONE
	| MANY_TO_MANY
;
