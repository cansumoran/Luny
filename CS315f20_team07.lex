%{
extern int linecount;
%}
digit [0-9]
sign [+-]
alphabetic [A-Za-z]
alphanumeric ({alphabetic}|{digit})
GETINCLINE getIncline
GETTEMPERATURE getTemperature
GETACCELERATION getAcceleration
GETALTITUDE getAltitude
SETCAMERA setCamera
TAKEPICTURES takePictures
GETTIMESTAMP getTimestamp
CONNECT connect
TURNCW turnCW
TURNCCW turnCCW
ASCEND ascend
DESCEND descend
TAKEOFF takeOff
LAND land
GOTO goTo
FUNCTION function
IF if
ELSE else
WHILE while
START start
END end
FROM from
TO to
CONST const
ENDPROGRAM endprogram
IDENTIFIER {alphabetic}{alphanumeric}*
GREATER_THAN \>
LESS_THAN \<
GREATER_EQUAL \>\=
LESS_EQUAL \<\=
ENTER enter
DISPLAY display
AND \&
OR \|
MINUS \-
PLUS \+
DIVIDE \/
MULTIPLY \*
IF_EQUAL \=\=
COMMA \,
NOT \!
%%
\(  return ( LP) ;
\) return (RP) ;
\= return (ASSIGNMENT_OP);
\: return (COLON);
\/  return (DIVIDE);
\+ return (PLUS);
\-  return (MINUS);
\* return (MULTIPLY);
\n {linecount++; return (NEWLINE);}
{sign}?{digit}+ return(INTEGER);
[\"].*[\"] return(STRING) ;
{GETINCLINE} return (GETINCLINE) ;
{GETALTITUDE}  return (GETALTITUDE) ;
{GETTEMPERATURE} return(GETTEMPERATURE);
{GETACCELERATION} return(GETACCELERATION);
{SETCAMERA} return(SETCAMERA);
{TAKEPICTURES} return(TAKEPICTURES);
{GETTIMESTAMP} return(GETTIMESTAMP);
{CONNECT} return(CONNECT);
{TURNCCW} return(TURNCCW);
{TURNCW} return(TURNCW);
{ASCEND} return(ASCEND);
{DESCEND} return(DESCEND);
{TAKEOFF} return(TAKEOFF);
{LAND} return(LAND);
{GOTO} return(GOTO);
{FUNCTION} return(FUNCTION);
{IF} return(IF) ;
{ELSE} return(ELSE);
{WHILE} return(WHILE);
{START} return(START);
{END} return(END) ;
[\@].* return(COMMENT);
{ENTER} return(ENTER);
{FROM} return(FROM);
{TO} return(TO);
{CONST} return(CONST);
{ENDPROGRAM} return(ENDPROGRAM);
{DISPLAY} return(DISPLAY);
{IDENTIFIER} return(IDENTIFIER);
{GREATER_THAN} return(GREATER_THAN);
{LESS_THAN} return(LESS_THAN);
{GREATER_EQUAL} return(GREATER_EQUAL);
{LESS_EQUAL} return(LESS_EQUAL);
{AND}           return(AND);
{OR}             return(OR);
{IF_EQUAL} return(IF_EQUAL);
{COMMA}    return(COMMA);
{NOT}          return(NOT);
[\t]+;
%%
int yywrap() {return 1;}
