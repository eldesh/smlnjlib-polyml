# SMLNJ-LIB for Poly/ML

This is the SML/NJ Library ported to Poly/ML.
It is free software distributed under the SML/NJ system's license (see the LICENSE file for details).

The library is organized as a collection of CM libraries. Here is a roadmap of the library structure:

  | Poly/ML<br/>support | Directory | Sources File     | Description
  | ------------------- | --------- | ---------------- | -----------------
  | ✔️                   | Util      | smlnj-lib.cm     | This is the general utility library.
  |                     | Controls  | controls-lib.cm  | This is a library of support code<br/>for managing application controls.
  | ✔️                   | HashCons  | hash-cons-lib.cm | This is a library supporting hash-consing<br/>of data structures and efficient sets and<br/>maps using hash-consed keys.
  | ✔️                   | HTML      | html-lib.cm      | This library provides parsing and pretty<br/>printing of HTML (Version 3.2).
  |                     | HTML4     | html4-lib.cm     | This library provides parsing and pretty<br/>printing of HTML (Version 4.01).
  |                     | INet      | inet-lib.cm      | Networking utilities (for both Unix and Windows).
  |                     | JSON      | json-lib.cm      | This library supports the reading and writing of structured data using JSON.
  | ✔️                   | PP        | pp-lib.cm        | Pretty-printing library.
  |                     | Reactive  | reactive-lib.cm  | A low-level reactive scripting library.
  | ✔️                   | RegExp    | regexp-lib.cm    | Regular-expression library.
  |                     | SExp      | sexp-lib.cm      | This library supports the reading and writing of structured data using the S-expressions.
  |                     | Unix      | unix-lib.cm      | Unix specific utilities.
  |                     | XML       | xml-lib.cm       | a small library for parsing XML files.

The first column is the source directory, the second gives the library sources file alias (to be used in your application's sources.cm file), and the third column gives a brief description.
Look at the Doc dicrectory and at the README files in the individual subdirectories for more documentation.

