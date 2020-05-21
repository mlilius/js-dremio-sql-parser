# js-dremio-sql-parser

> parse / stringify sql (select grammar) in js.

[![Build Status][travis-image]][travis-url]
[![NPM Version][npm-image]][npm-url]
[![NPM Downloads][downloads-image]][downloads-url]

sql grammar follows https://docs.dremio.com/sql-reference/

## news

- Forked from [js-dremio-sql-parser](https://github.com/JavaScriptor/js-sql-parser/) v1.3.0

for more changes see [CHANGELOG](./CHANGELOG)

## commonjs usage

`npm install --save js-dremio-sql-parser`

```js
const parser = require('js-dremio-sql-parser');
const ast = parser.parse('SELECT * FROM Samples."samples.dremio.com"."zips.json"');

console.log(JSON.stringify(ast, null, 2));

ast.value.selectItems.value[0].value = 'foo';
ast.value.from.value[0].value.value.value = 'bar';

console.log(parser.stringify(ast));
// TODO
// SELECT foo FROM bar
```

## script tag

```js
<script src="./dist/parser/sqlParser.js"><script/>

var sqlParser = window.sqlParser;
var ast = sqlParser.parse('SELECT * FROM Samples."samples.dremio.com"."zips.json"');
var sql = sqlParser.stringify(ast);
```

## AMD supported

...

## unsupported grammar currently

- Hexadecimal Literals as x'01af' X'01af', but 0x01af is supported.
- keyword COLLATE.
- parammarker: keyword PREPARE / EXECUTE / DEALLOCATE
- variable: keyword SET / CREATE PROCEDURE / CREATE FUNCTION
- identifier expr: ODBC escape syntax
- matchexpr: Full-Text Search Functions. // to support
- intervalexpr: Date INTERVAL keyword.   // to support
- into outfile: INTO OUTFILE keyword.    // to support

## TODO

- ${value} like value place holder support.

## Build

- Run `npm run build` to build the distributable.

## LICENSE

MIT

[travis-image]: https://api.travis-ci.org/mlilius/js-dremio-sql-parser.svg
[travis-url]: https://travis-ci.org/mlilius/js-dremio-sql-parser
[npm-image]: https://img.shields.io/npm/v/js-dremio-sql-parser.svg
[npm-url]: https://npmjs.org/package/js-dremio-sql-parser
[downloads-image]: https://img.shields.io/npm/dm/js-dremio-sql-parser.svg
[downloads-url]: https://npmjs.org/package/js-dremio-sql-parser
