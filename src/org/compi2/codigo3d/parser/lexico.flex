package org.compi2.codigo3d.parser;

import java_cup.runtime.Symbol;

//Scanner para generar C3D
//HOJA DE TRABAJO 3 - CORTOCIRCUITO LISTO
//Nombre : María Fernanda Rodríguez Santos
//Carné: 201020946
%%
%{
    //Código de usuario
    

%}

%cup
%class scanner
%public
%line
%char
%column
%full

MAS		= "+"
MENOS		= "-"
MULT       	= "*"
DIV             = "/"
POT             = "^"
PAR_IZQ         = "("
PAR_DER         = ")"

IGUALIGUAL      ="=="
DIFERENTE       ="!="
MAYORQ          =">"
MENORQ          ="<"
MAYORIQ         =">="
MENORIQ         ="<="

AND             ="&&"
OR              ="||"
NOT             ="!"


ID              = [A-Za-z][_0-9A-Za-z]*
ENTERO          = [0-9]+
DECIMAL         = [0-9]+"."[0-9]+

SPACE   = [\ \r\t\f\t]
ENTER   = [\ \n]

%%

<YYINITIAL> {ID}            { return new Symbol(sym.ID, yyline, yycolumn, yytext()); }
<YYINITIAL> {ENTERO}        { return new Symbol(sym.ENTERO, yyline, yycolumn, yytext()); }
<YYINITIAL> {DECIMAL}       { return new Symbol(sym.DECIMAL, yyline, yycolumn, yytext()); }
<YYINITIAL> {MAS}           { return new Symbol(sym.MAS, yyline, yycolumn, null); }
<YYINITIAL> {MENOS}	    { return new Symbol(sym.MENOS, yyline, yycolumn, null); }
<YYINITIAL> {MULT}          { return new Symbol(sym.MULT, yyline, yycolumn, null); }
<YYINITIAL> {DIV}	    { return new Symbol(sym.DIV, yyline, yycolumn, null); }
<YYINITIAL> {POT}	    { return new Symbol(sym.POT, yyline, yycolumn, null); }
<YYINITIAL> {PAR_IZQ}	    { return new Symbol(sym.PAR_IZQ, yyline, yycolumn, null); }
<YYINITIAL> {PAR_DER}	    { return new Symbol(sym.PAR_DER, yyline, yycolumn, null); }

<YYINITIAL> {IGUALIGUAL}    { return new Symbol(sym.IGUALIGUAL, yyline, yycolumn, null); }
<YYINITIAL> {DIFERENTE}     { return new Symbol(sym.DIFERENTE, yyline, yycolumn, null); }
<YYINITIAL> {MAYORQ}	    { return new Symbol(sym.MAYORQ, yyline, yycolumn, null); }
<YYINITIAL> {MENORQ}	    { return new Symbol(sym.MENORQ, yyline, yycolumn, null); }
<YYINITIAL> {MAYORIQ}	    { return new Symbol(sym.MAYORIQ, yyline, yycolumn, null); }
<YYINITIAL> {MENORIQ}	    { return new Symbol(sym.MENORIQ, yyline, yycolumn, null); }

<YYINITIAL> {AND}	    { return new Symbol(sym.AND, yyline, yycolumn, null); }
<YYINITIAL> {OR}	    { return new Symbol(sym.OR, yyline, yycolumn, null); }
<YYINITIAL> {NOT}	    { return new Symbol(sym.NOT, yyline, yycolumn, null); }


<YYINITIAL> {SPACE}     { /*Espacios en blanco, ignorados*/ }
<YYINITIAL> {ENTER}     { /*Saltos de linea, ignorados*/}

<YYINITIAL>. {
        String errLex = "Error léxico, caracter irreconocible: '"+yytext()+"' en la línea: "+(yyline+1)+" y columna: "+yycolumn;
        System.err.println(errLex);
}