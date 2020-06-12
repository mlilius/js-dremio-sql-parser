/* description: Parses Dremio SQL */
/* :tabSize=4:indentSize=4:noTabs=true: */
/* Based on https://github.com/christyharagan/dremio-node-api */
/* Based on https://github.com/JavaScriptor/js-sql-parser */
/* Original License: ISC, albin zeng, 9 Feb 2018 */
%lex

%options case-insensitive

%%

[/][*](.|\n)*?[*][/]                                              /* skip comments */
[-][-].*\n?                                                       /* skip sql comments */
[#]\s.*\n                                                         /* skip sql comments */
\s+                                                               /* skip whitespace */

[`][a-zA-Z_\u4e00-\u9fa5][a-zA-Z0-9_\u4e00-\u9fa5]*[`]            return 'IDENTIFIER'
[\w]+[\u4e00-\u9fa5]+[0-9a-zA-Z_\u4e00-\u9fa5]*                   return 'IDENTIFIER'
\.\*                                                              return 'IDENTIFIER'
["](?:[^"\\]|\\.)*["](?:\[\d+\])?                                 return 'IDENTIFIER'
[`](?:[^`\\]|\\.)*[`](?:\[\d+\])?                                 return 'IDENTIFIER'
[\u4e00-\u9fa5][0-9a-zA-Z_\u4e00-\u9fa5]*                         return 'IDENTIFIER'
SELECT                                                            return 'SELECT'
ALL                                                               return 'ALL'
ANY                                                               return 'ANY'
DISTINCT                                                          return 'DISTINCT'
DISTINCTROW                                                       return 'DISTINCTROW'
HIGH_PRIORITY                                                     return 'HIGH_PRIORITY'
MAX_STATEMENT_TIME                                                return 'MAX_STATEMENT_TIME'
STRAIGHT_JOIN                                                     return 'STRAIGHT_JOIN'
SQL_SMALL_RESULT                                                  return 'SQL_SMALL_RESULT'
SQL_BIG_RESULT                                                    return 'SQL_BIG_RESULT'
SQL_BUFFER_RESULT                                                 return 'SQL_BUFFER_RESULT'
SQL_CACHE                                                         return 'SQL_CACHE'
SQL_NO_CACHE                                                      return 'SQL_NO_CACHE'
SQL_CALC_FOUND_ROWS                                               return 'SQL_CALC_FOUND_ROWS'
([a-zA-Z_\u4e00-\u9fa5][a-zA-Z0-9_\u4e00-\u9fa5]*\.){1,2}\*       return 'SELECT_EXPR_STAR'
AS                                                                return 'AS'
TRUE                                                              return 'TRUE'
FALSE                                                             return 'FALSE'
NULL                                                              return 'NULL'
COLLATE                                                           return 'COLLATE'
BINARY                                                            return 'BINARY'
ROW                                                               return 'ROW'
EXISTS                                                            return 'EXISTS'
CASE                                                              return 'CASE'
WHEN                                                              return 'WHEN'
THEN                                                              return 'THEN'
ELSE                                                              return 'ELSE'
END                                                               return 'END'
DIV                                                               return 'DIV'
MOD                                                               return 'MOD'
NOT                                                               return 'NOT'
BETWEEN                                                           return 'BETWEEN'
IN                                                                return 'IN'
SOUNDS                                                            return 'SOUNDS'
LIKE                                                              return 'LIKE'
ESCAPE                                                            return 'ESCAPE'
CAST                                                              return 'CAST'
OVER                                                              return 'OVER'
REGEXP                                                            return 'REGEXP'
IS                                                                return 'IS'
UNKNOWN                                                           return 'UNKNOWN'
AND                                                               return 'AND'
OR                                                                return 'OR'
INTERVAL                                                          return 'INTERVAL'
XOR                                                               return 'XOR'
FROM                                                              return 'FROM'
PARTITION\s(?!BY)                                                 return 'PARTITION'
USE                                                               return 'USE'
INDEX                                                             return 'INDEX'
FOR                                                               return 'FOR'
JOIN                                                              return 'JOIN'
PARTITION\s+BY                                                    return 'PARTITION_BY'
ORDER\s+BY                                                        return 'ORDER_BY'
GROUP\s+BY                                                        return 'GROUP_BY'
IGNORE                                                            return 'IGNORE'
FORCE                                                             return 'FORCE'
INNER                                                             return 'INNER'
CROSS                                                             return 'CROSS'
FULL                                                              return 'FULL'
ON                                                                return 'ON'
USING                                                             return 'USING'
LEFT                                                              return 'LEFT'
RIGHT                                                             return 'RIGHT'
OUTER                                                             return 'OUTER'
NATURAL                                                           return 'NATURAL'
WHERE                                                             return 'WHERE'
ASC                                                               return 'ASC'
DESC                                                              return 'DESC'
WITH                                                              return 'WITH'
ROLLUP                                                            return 'ROLLUP'
HAVING                                                            return 'HAVING'
OFFSET                                                            return 'OFFSET'
PROCEDURE                                                         return 'PROCEDURE'
UPDATE                                                            return 'UPDATE'
LOCK                                                              return 'LOCK'
SHARE                                                             return 'SHARE'
MODE                                                              return 'MODE'
OJ                                                                return 'OJ'
LIMIT                                                             return 'LIMIT'
UNION                                                             return 'UNION'

MICROSECOND                                                       return 'MICROSECOND'
SECOND                                                            return 'SECOND'
MINUTE                                                            return 'MINUTE'
HOUR                                                              return 'HOUR'
DAY                                                               return 'DAY'
WEEK                                                              return 'WEEK'
MONTH                                                             return 'MONTH'
/* TODO: we need to make this handle field names of quarter
QUARTER                                                           return 'QUARTER'*/
YEAR                                                              return 'YEAR'
SECOND_MICROSECOND                                                return 'SECOND_MICROSECOND'
MINUTE_MICROSECOND                                                return 'MINUTE_MICROSECOND'
MINUTE_SECOND                                                     return 'MINUTE_SECOND'
HOUR_MICROSECOND                                                  return 'HOUR_MICROSECOND'
HOUR_SECOND                                                       return 'HOUR_SECOND'
HOUR_MINUTE                                                       return 'HOUR_MINUTE'
DAY_MICROSECOND                                                   return 'DAY_MICROSECOND'
DAY_SECOND                                                        return 'DAY_SECOND'
DAY_MINUTE                                                        return 'DAY_MINUTE'
DAY_HOUR                                                          return 'DAY_HOUR'
YEAR_MONTH                                                        return 'YEAR_MONTH'

/* "'"                                                            return 'SINGLE_QUOTE' */
","                                                               return ','
"="                                                               return '='
"("                                                               return '('
")"                                                               return ')'
"~"                                                               return '~'
"!="                                                              return '!='
"!"                                                               return '!'
"|"                                                               return '|'
"&"                                                               return '&'
"+"                                                               return '+'
"-"                                                               return '-'
"*"                                                               return '*'
"/"                                                               return '/'
"%"                                                               return '%'
"^"                                                               return '^'
">>"                                                              return '>>'
">="                                                              return '>='
">"                                                               return '>'
"<<"                                                              return '<<'
"<=>"                                                             return '<=>'
"<="                                                              return '<='
"<>"                                                              return '<>'
"<"                                                               return '<'
"{"                                                               return '{'
"}"                                                               return '}'
";"                                                               return ';'

['](\\.|[^'])*[']                                                 return 'STRING'
["](\\.|[^"])*["]                                                 return 'STRING'
[0][x][0-9a-fA-F]+                                                return 'HEX_NUMERIC'
[-]?[0-9]+(\.[0-9]+)?                                             return 'NUMERIC'
[-]?[0-9]+(\.[0-9]+)?[eE][-][0-9]+(\.[0-9]+)?                     return 'EXPONENT_NUMERIC'

[\$a-zA-Z_\u4e00-\u9fa5][a-zA-Z0-9_\u4e00-\u9fa5:]*(?:\[\d+\])?   return 'IDENTIFIER'
\.                                                                return 'DOT'
['"][@a-zA-Z_\u4e00-\u9fa5][a-zA-Z0-9_\u4e00-\u9fa5]*["']         return 'QUOTED_IDENTIFIER'
                                                                 
<<EOF>>                                                           return 'EOF'
.                                                                 return 'INVALID'

/lex

%left ',' TABLE_REF_COMMA
%nonassoc NO_PARTITION
%nonassoc PARTITION
%left INDEX_HINT_LIST
%left INDEX_HINT_COMMA
%left INNER_CROSS_JOIN_NULL_FULL LEFT_RIGHT_JOIN
%left INNER_CROSS_JOIN_FULL
%right USING
%right ON
%left OR XOR '||'
%left '&&' AND
%left '|'
%left '^'
%left '&'
%left '=' '!='        /* = in sql equels == */
%left '>' '>=' '<' '<='
%left '<<' '>>'
%left '+' '-'
%left DIV MOD '/' '%' '*'
%right UPLUS UMINUS UNOT '~' NOT
%left DOT

%start main

%% /* language grammar */

main
  : selectClause semicolonOpt EOF { return {nodeType: 'Main', value: $1, hasSemicolon: $2}; }
  | unionClause semicolonOpt EOF { return {nodeType: 'Main', value: $1, hasSemicolon: $2}; }
  ;

selectUnionClause
  : selectClause { $$ = {type: 'SelectUnion', value: $1}; }
  | unionClause { $$ = {type: 'SelectUnion', value: $1}; }
  ;

semicolonOpt
  : ';' { $$ = true }
  | { $$ = false }
  ;

unionClause
  : unionClauseNotParenthesized { $$ = $1 }
  | unionClauseParenthesized order_by_opt limit_opt { $$ = $1, $$.orderBy = $2, $$.limit = $3; }
  ;

unionClauseParenthesized
  : selectClauseParenthesized UNION distinctOpt selectClauseParenthesized { $$ = { type: 'Union', left: $1, distinctOpt: $3, right: $4 }; }
  | selectClauseParenthesized UNION distinctOpt unionClauseParenthesized { $$ = { type: 'Union', left: $1, distinctOpt: $3, right: $4 }; }
  ;

selectClauseParenthesized
  : '(' selectClause ')' { $$ = { type: 'SelectParenthesized', value: $2 }; }
  ;

unionClauseNotParenthesized
  : selectClause UNION distinctOpt selectClause { $$ = { type: 'Union', left: $1, distinctOpt: $3, right: $4 } }
  | selectClause UNION distinctOpt unionClauseNotParenthesized { $$ = { type: 'Union', left: $1, distinctOpt: $3, right: $4 } }
  ;

selectClause
  : SELECT
      distinctOpt
      highPriorityOpt
      maxStateMentTimeOpt
      straightJoinOpt
      sqlSmallResultOpt
      sqlBigResultOpt
      sqlBufferResultOpt
      sqlCacheOpt
      sqlCalcFoundRowsOpt
      selectExprList
      selectDataSetOpt
      {
        $$ = {
          type: 'Select',
          distinctOpt: $2,
          highPriorityOpt: $3,
          maxStateMentTimeOpt: $4,
          straightJoinOpt: $5,
          sqlSmallResultOpt: $6,
          sqlBigResultOpt: $7,
          sqlBufferResultOpt: $8,
          sqlCacheOpt: $9,
          sqlCalcFoundRowsOpt: $10,
          selectItems: $11,
          from: $12.from,
          partition: $12.partition,
          where: $12.where,
          groupBy: $12.groupBy,
          having: $12.having,
          orderBy: $12.orderBy,
          limit: $12.limit,
          procedure: $12.procedure,
          updateLockMode: $12.updateLockMode
        }
      }
  ;

intervalExpr
  : INTERVAL intervalNumeric timePeriod { $$ = { type: 'Interval', duration: $2, period: $3 } }
  ;

intervalNumeric
  : NUMERIC { $$ = $1 }
  | EXPONENT_NUMERIC { $$ = $1 }
  | HEX_NUMERIC { $$ = $1 }
  | STRING { $$ = $1 }
  ;

timePeriod
  : MICROSECOND { $$ = $1 }
  | SECOND { $$ = $1 }
  | MINUTE { $$ = $1 }
  | HOUR { $$ = $1 }
  | DAY { $$ = $1 }
  | WEEK { $$ = $1 }
  | MONTH { $$ = $1 }
  | QUARTER { $$ = $1 }
  | YEAR { $$ = $1 }
  | SECOND_MICROSECOND { $$ = $1 }
  | MINUTE_MICROSECOND { $$ = $1 }
  | MINUTE_SECOND { $$ = $1 }
  | HOUR_MICROSECOND { $$ = $1 }
  | HOUR_SECOND { $$ = $1 }
  | HOUR_MINUTE { $$ = $1 }
  | DAY_MICROSECOND { $$ = $1 }
  | DAY_SECOND { $$ = $1 }
  | DAY_MINUTE { $$ = $1 }
  | DAY_HOUR { $$ = $1 }
  | YEAR_MONTH { $$ = $1 }
  ;

distinctOpt
  : ALL { $$ = $1 }
  | DISTINCT { $$ = $1 }
  | DISTINCTROW { $$ = $1 }
  | { $$ = null }
  ;
highPriorityOpt
  : HIGH_PRIORITY { $$ = $1 }
  | { $$ = null }
  ;
maxStateMentTimeOpt
  : MAX_STATEMENT_TIME '=' NUMERIC { $$ = $3 }
  | { $$ = null }
  ;
straightJoinOpt
  : STRAIGHT_JOIN { $$ = $1 }
  | { $$ = null }
  ;
sqlSmallResultOpt
  : SQL_SMALL_RESULT { $$ = $1 }
  | { $$ = null }
  ;
sqlBigResultOpt
  : SQL_BIG_RESULT { $$ = $1 }
  | { $$ = null }
  ;
sqlBufferResultOpt
  : SQL_BUFFER_RESULT { $$ = $1 }
  | { $$ = null }
  ;
sqlCacheOpt
  : { $$ = null }
  | SQL_CACHE { $$ = $1 }
  | SQL_NO_CACHE { $$ = $1 }
  ;
sqlCalcFoundRowsOpt
  : SQL_CALC_FOUND_ROWS { $$ = $1 }
  | { $$ = null }
  ;
selectExprList
  : selectExprList ',' selectExpr { $1.value.push($3); }
  | selectExpr { $$ = { type: 'SelectExpr', value: [ $1 ] } }
  ;
selectExpr
  : '*' { $$ = { type: 'Identifier', value: $1 } }
  | SELECT_EXPR_STAR { $$ = { type: 'Identifier', value: $1 } }
  | expr selectExprAliasOpt { $$ = $1; $$.alias = $2.alias; $$.hasAs = $2.hasAs; }
  ;
selectExprAliasOpt
  : { $$ = {alias: null, hasAs: null} }
  | AS IDENTIFIER { $$ = {alias: $2, hasAs: true} }
  | IDENTIFIER { $$ = {alias: $1, hasAs: false} }
  ;

string
  : QUOTED_IDENTIFIER { $$ = { type: 'String', value: $1 } }
  | STRING { $$ = { type: 'String', value: $1 } }
  ;
number
  : NUMERIC { $$ = { type: 'Number', value: $1 } }
  | EXPONENT_NUMERIC = { $$ = { type: 'Number', value: $1 } }
  | HEX_NUMERIC = { $$ = { type: 'Number', value: $1 } }
  ;
boolean
  : TRUE { $$ = { type: 'Boolean', value: 'TRUE' } }
  | FALSE { $$ = { type: 'Boolean', value: 'FALSE' } }
  ;
null
  : NULL { $$ = { type: 'Null', value: 'null' } }
  ;
literal
  : string { $$ = $1 }
  | number { $$ = $1 }
  | boolean { $$ = $1 }
  | null { $$ = $1 }
  ;
function_call
  : IDENTIFIER '(' function_call_param_list ')' over_opt { $$ = {type: 'FunctionCall', name: $1, params: $3, overOpt: $5} }
  ;
function_call_param_list
  : function_call_param_list ',' function_call_param { $1.push($3); $$ = $1; }
  | function_call_param { $$ = [$1]; }
  ;
function_call_param
  : { $$ = null }
  | '*' { $$ = $1 }
  | SELECT_EXPR_STAR { $$ = $1 }
  | DISTINCT expr { $$ = { type: 'FunctionCallParam', distinctOpt: $1, value: $2 } }
  | expr FROM expr { $$ = { type: 'FromCallParam', left: $1, right: $3 } }
  | timePeriod FROM expr { $$ = { type: 'TimePeriodFromCallParam', left: $1, right: $3 } }
  | expr { $$ = $1 }
  | expr AS expr { $$ = { type: 'ASExpression', left: $1, right: $3 } }
  | timePeriod
  ;
identifier
  : IDENTIFIER { $$ = { type: 'Identifier', value: $1 } }
  | identifier DOT IDENTIFIER { $$ = $1; $1.value += '.' + $3 }
  ;
identifier_list
  : identifier { $$ = { type: 'IdentifierList', value: [ $1 ] } }
  | identifier_list ',' identifier { $$ = $1; $1.value.push($3); }
  ;
case_expr_opt
  : { $$ = null }
  | expr { $$ = $1 }
  ;
when_then_list
  : WHEN expr THEN expr { $$ = { type: 'WhenThenList', value: [ { when: $2, then: $4 } ] }; }
  | when_then_list WHEN expr THEN expr { $$ = $1; $$.value.push({ when: $3, then: $5 }); }
  ;
case_when_else
  : { $$ = null }
  | ELSE expr { $$ = $2 }
  ;
case_when
  : CASE case_expr_opt when_then_list case_when_else END { $$ = { type: 'CaseWhen', caseExprOpt: $2, whenThenList: $3, else: $4 } }
  ;
cast
  : CAST '(' expr AS IDENTIFIER ')' { $$ = { type: 'Cast', expr: $3, castTo: $5 } }
  | CAST '(' expr AS INTERVAL timePeriod ')' { $$ = { type: 'CastInterval', expr: $3, castTo: $6 } }
  | CAST '(' expr AS function_call ')' { $$ = { type: 'CastFunction', expr: $3, castTo: $5 } }
  ;
over_opt
  : { $$ = null }
  | OVER '(' partition_by_opt order_by_opt ')' { $$ = { type: 'Over', partitionBy: $3, orderBy: $4 } }
  ;
simple_expr_prefix
  : '+' simple_expr %prec UPLUS { $$ = { type: 'Prefix', prefix: $1, value: $2 } }
  | '-' simple_expr %prec UMINUS { $$ = { type: 'Prefix', prefix: $1, value: $2 } }
  | '~' simple_expr { $$ = { type: 'Prefix', prefix: $1, value: $2 } }
  | '!' simple_expr %prec UNOT { $$ = { type: 'Prefix', prefix: $1, value: $2 } }
  |  BINARY simple_expr { $$ = { type: 'Prefix', prefix: $1, value: $2 } }
  ;
simple_expr
  : literal { $$ = $1 }
  | intervalExpr { $$ = $1 }
  | identifier { $$ = $1 }
  | function_call { $$ = $1 }
  | simple_expr_prefix { $$ = $1 }
  | '(' expr_list ')' { $$ = { type: 'SimpleExprParentheses', value: $2 } }
  | ROW '(' expr_list ')' { $$ = { type: 'SimpleExprParentheses', value: $2, hasRow: true } }
  | '(' selectClause ')' { $$ = { type: 'SubQuery', value: $2 } }
  | EXISTS '(' selectClause ')' { $$ = { type: 'SubQuery', value: $3, hasExists: true } }
  | '{' identifier expr '}' { $$ = { type: 'IdentifierExpr', identifier: $2, value: $3 } }
  | case_when { $$ = $1 }
  | cast { $$ = $1 }
  ;
bit_expr
  : simple_expr { $$ = $1 }
  | bit_expr '|' bit_expr { $$ = { type: 'BitExpression', operator: '|', left: $1, right: $3 } }
  | bit_expr '&' bit_expr { $$ = { type: 'BitExpression', operator: '&', left: $1, right: $3 } }
  | bit_expr '<<' bit_expr { $$ = { type: 'BitExpression', operator: '<<', left: $1, right: $3 } }
  | bit_expr '>>' bit_expr { $$ = { type: 'BitExpression', operator: '>>', left: $1, right: $3 } }
  | bit_expr '+' bit_expr { $$ = { type: 'BitExpression', operator: '+', left: $1, right: $3 } }
  | bit_expr '-' bit_expr { $$ = { type: 'BitExpression', operator: '-', left: $1, right: $3 } }
  | bit_expr '*' bit_expr %prec MULTI { $$ = { type: 'BitExpression', operator: '*', left: $1, right: $3 } }
  | bit_expr '/' bit_expr { $$ = { type: 'BitExpression', operator: '/', left: $1, right: $3 } }
  | bit_expr DIV bit_expr { $$ = { type: 'BitExpression', operator: 'DIV', left: $1, right: $3 } }
  | bit_expr MOD bit_expr { $$ = { type: 'BitExpression', operator: 'MOD', left: $1, right: $3 } }
  | bit_expr '%' bit_expr { $$ = { type: 'BitExpression', operator: '%', left: $1, right: $3 } }
  | bit_expr '^' bit_expr { $$ = { type: 'BitExpression', operator: '^', left: $1, right: $3 } }
  ;
not_opt
  : { $$ = null }
  | NOT { $$ = $1 }
  ;
escape_opt
  : { $$ = null }
  | ESCAPE simple_expr { $$ = $2 }
  ;
predicate
  : bit_expr { $$ = $1 }
  | bit_expr not_opt IN '(' selectClause ')' { $$ = { type: 'InSubQueryPredicate', hasNot: $2, left: $1 ,right: $5 } }
  | bit_expr not_opt IN '(' expr_list ')' { $$ = { type: 'InExpressionListPredicate', hasNot: $2, left: $1, right: $5 } }
  | bit_expr not_opt BETWEEN bit_expr AND predicate { $$ = { type: 'BetweenPredicate', hasNot: $2, left: $1, right: { left: $4, right: $6 } } }
  | bit_expr SOUNDS LIKE bit_expr { $$ = { type: 'SoundsLikePredicate', hasNot: false, left: $1, right: $4 } }
  | bit_expr not_opt LIKE simple_expr escape_opt { $$ = { type: 'LikePredicate', hasNot: $2, left: $1, right: $4, escape: $5 } }
  | bit_expr not_opt REGEXP bit_expr { $$ = { type: 'RegexpPredicate', hasNot: $2, left: $1, right: $4 } }
  ;
comparison_operator
  : '=' { $$ = $1 }
  | '>=' { $$ = $1 }
  | '>' { $$ = $1 }
  | '<=' { $$ = $1 }
  | '<' { $$ = $1 }
  | '<>' { $$ = $1 }
  | '!=' { $$ = $1 }
  ;
sub_query_data_set_opt
 : ALL { $$ = $1 }
 | ANY { $$ = $1 }
 ;
boolean_primary
  : predicate { $$ = $1 }
  | boolean_primary IS not_opt NULL { $$ = { type: 'IsNullBooleanPrimary', hasNot: $3 , value: $1 } }
  | boolean_primary comparison_operator predicate { $$ = { type: 'ComparisonBooleanPrimary', left: $1, operator: $2, right: $3 } }
  | boolean_primary comparison_operator sub_query_data_set_opt '(' selectClause ')' { $$ = { type: 'ComparisonSubQueryBooleanPrimary', operator: $2, subQueryOpt: $3, left: $1, right: $5 } }
  ;
boolean_extra
  : boolean { $$ = $1 }
  | UNKNOWN { $$ = { type: 'BooleanExtra', value: $1 } }
  ;
expr
  : boolean_primary { $$ = $1 }
  | boolean_primary IS not_opt boolean_extra { $$ = { type: 'IsExpression', hasNot: $3, left: $1, right: $4 } }
  | NOT expr { $$ = { type: 'NotExpression', value: $2 } }
  | expr '&&' expr { $$ = { type: 'AndExpression', operator: $2, left: $1, right: $3 } }
  | expr '||' expr { $$ = { type: 'OrExpression', operator: $2, left: $1, right: $3 } }
  | expr OR expr { $$ = { type: 'OrExpression', operator: $2, left: $1, right: $3 } }
  | expr AND expr { $$ = { type: 'AndExpression', operator: $2, left: $1, right: $3 } }
  | expr XOR expr { $$ = { type: 'XORExpression', left: $1, right: $3 } }
  ;
expr_list
  : expr { $$ = { type: 'ExpressionList', value: [ $1 ] } }
  | expr_list ',' expr { $$ = $1; $$.value.push($3); }
  ;

where_opt
  : { $$ = null }
  | WHERE expr { $$ = $2 }
  ;
group_by_opt
  : { $$ = null }
  | group_by { $$ = $1 }
  ;
roll_up_opt
  : { $$ = null }
  | WITH ROLLUP { $$ = true }
  ;
group_by
  : GROUP_BY group_by_order_by_item_list roll_up_opt { $$ = { type: 'GroupBy', value: $2, rollUp: $3 } }
  ;
partition_by_opt
  : { $$ = null }
  | partition_by { $$ = $1 }
  ;
partition_by
  : PARTITION_BY group_by_order_by_item_list { $$ = { type: 'PartitionBy', value: $2 } }
  ;
order_by_opt
  : { $$ = null }
  | order_by { $$ = $1 }
  ;
order_by
  : ORDER_BY group_by_order_by_item_list roll_up_opt { $$ = { type: 'OrderBy', value: $2, rollUp: $3 } }
  ;
group_by_order_by_item_list
  : group_by_order_by_item { $$ = [ $1 ] }
  | group_by_order_by_item_list ',' group_by_order_by_item { $$ = $1; $1.push($3); }
  ;
group_by_order_by_item
  : expr sort_opt { $$ = { type: 'GroupByOrderByItem', value: $1, sortOpt: $2 } }
  ;
sort_opt
  : { $$ = null }
  | ASC { $$ = $1 }
  | DESC { $$ = $1 }
  ;
having_opt
  : { $$ = null }
  | HAVING expr { $$ = $2 }
  ;
limit
  : LIMIT NUMERIC { $$ = { type: 'Limit', value: [ $2 ] } }
  | LIMIT NUMERIC ',' NUMERIC { $$ = { type: 'Limit', value: [ $2, $4 ] } }
  | LIMIT NUMERIC OFFSET NUMERIC { $$ = { type: 'Limit', value: [ $4, $2 ], offsetMode: true } }
  ;
limit_opt
  : { $$ = null }
  | limit { $$ = $1 }
  ;
procedure_opt
  : { $$ = null }
  | procedure { $$ = $1 }
  ;
procedure
  : PROCEDURE function_call { $$ = $2 }
  ;
for_update_lock_in_share_mode_opt
  : { $$ = null }
  | FOR UPDATE { $$ = $1 + ' ' + $2 }
  | LOCK IN SHARE MODE { $$ = $1 + ' ' + $2 + ' ' + $3 + ' ' + $4 }
  ;
selectDataSetOpt
  : { $$ = {} }
  | FROM table_references partitionOpt where_opt group_by_opt having_opt order_by_opt limit_opt procedure_opt for_update_lock_in_share_mode_opt
    { $$ = { from: $2, partition: $3, where: $4, groupBy: $5, having: $6, orderBy: $7, limit: $8, procedure: $9, updateLockMode: $10 } }
  ;
table_references
  : escaped_table_reference { $$ = { type: 'TableReferences', value: [ $1 ] } }
  | table_references ',' escaped_table_reference %prec TABLE_REF_COMMA { $$ = $1; $1.value.push($3); }
  ;
escaped_table_reference
  : table_reference { $$ = { type: 'TableReference', value: $1 } }
  | '{' OJ table_reference '}' { $$ = { type: 'TableReference', hasOj: true, value: $3 } }
  | STRING { $$ = { type: 'TableReference', value: $1 } }
  ;
join_inner_cross
  : { $$ = null }
  | INNER { $$ = $1 }
  | CROSS { $$ = $1 }
  | FULL { $$ = $1 }
  ;
left_right
  : LEFT { $$ = $1 }
  | RIGHT { $$ = $1 }
  ;
out_opt
  : { $$ = null }
  | OUTER { $$ = $1 }
  ;
left_right_out_opt
  : { $$ = { leftRight: null, outOpt: null } }
  | left_right out_opt { $$ = { leftRight: $1, outOpt: $2 } }
  ;
join_table
  : table_reference join_inner_cross JOIN table_factor %prec INNER_CROSS_JOIN_NULL_FULL { $$ = { type: 'InnerCrossJoinTable', innerCrossOpt: $2, left: $1, right: $4, condition: null } }
  | table_reference join_inner_cross JOIN table_factor join_condition  %prec INNER_CROSS_JOIN_FULL { $$ = { type: 'InnerCrossJoinTable', innerCrossOpt: $2, left: $1, right: $4, condition: $5 } }
  | table_reference STRAIGHT_JOIN table_factor on_join_condition { $$ = { type: 'StraightJoinTable', left: $1, right: $3, condition: $4 } }
  | table_reference left_right out_opt JOIN table_reference join_condition %prec LEFT_RIGHT_JOIN { $$ = { type: 'LeftRightJoinTable', leftRight: $2, outOpt: $3, left: $1, right: $5, condition: $6 } }
  | table_reference NATURAL left_right_out_opt JOIN table_factor { $$ = { type: 'NaturalJoinTable', leftRight: $3.leftRight, outOpt: $3.outOpt, left: $1, right: $5 } }
  ;
join_condition_opt
  : { $$ = null }
  | join_condition { $$ = $1 }
  ;
on_join_condition
  : ON expr { $$ = { type: 'OnJoinCondition', value: $2 } }
  ;
join_condition
  : on_join_condition { $$ = $1 }
  | USING '(' identifier_list ')' { $$ = { type: 'UsingJoinCondition', value: $3 } }
  ;
table_reference
  : table_factor { $$ = $1 }
  | join_table { $$ = $1 }
  ;
partition_names
  : identifier { $$ = [ $1 ] }
  | partition_names ',' identifier { $$ = $1; $1.push($3) }
  ;
partitionOpt
  : %prec NO_PARTITION { $$ = null }
  | PARTITION '(' partition_names ')' { $$ = { type: 'Partitions', value: $3 } }
  ;
aliasOpt
  : { $$ = {alias: null, hasAs: null} }
  | AS identifier { $$ = { hasAs: true, alias: $2 } }
  | identifier { $$ = { hasAs: false, alias: $1 } }
  ;
index_or_key
  : INDEX { $$ = $1 }
  | KEY { $$ = $1 }
  ;
for_opt
  : { $$ = null }
  | FOR JOIN { $$ = { type: 'ForOptIndexHint', value: $2 } }
  | FOR ORDER_BY { $$ = { type: 'ForOptIndexHint', value: $2 } }
  | FOR GROUP_BY { $$ = { type: 'ForOptIndexHint', value: $2 } }
  ;
identifier_list_opt
  : { $$ = null }
  | identifier_list { $$ = $1 }
  ;
index_hint_list_opt
  : { $$ = null }
  | index_hint_list %prec INDEX_HINT_LIST { $$ = $1 }
  ;
index_hint_list
  : index_hint { $$ = { type: 'IndexHintList', value: [ $1 ] } }
  | index_hint_list ',' index_hint %prec INDEX_HINT_COMMA { $$ = $1; $$.value.push($3); }
  ;
index_hint
  : USE index_or_key for_opt '(' identifier_list_opt ')' { $$ = { type: 'UseIndexHint', value: $5, forOpt: $3, indexOrKey: $2 } }
  | IGNORE index_or_key for_opt '(' identifier_list ')' { $$ = { type: 'IgnoreIndexHint', value: $5, forOpt: $3, indexOrKey: $2 } }
  | FORCE index_or_key for_opt '(' identifier_list ')' { $$ = { type: 'ForceIndexHint', value: $5, forOpt: $3, indexOrKey: $2 } }
  ;
table_factor
  : identifier partitionOpt aliasOpt index_hint_list_opt { $$ = { type: 'TableFactor', value: $1, partition: $2, alias: $3.alias, hasAs: $3.hasAs, indexHintOpt: $4 } }
  | '(' selectUnionClause ')' aliasOpt { $$ = { type: 'TableFactor', value: { type: 'SubQuery', value: $2 }, alias: $4.alias, hasAs: $4.hasAs} }
  | '(' table_references ')' { $$ = $2; $$.hasParentheses = true }
  ;
