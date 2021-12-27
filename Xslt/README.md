# XSLT port of the Parrot-Refactoring-Kata

This is a XSLT 1.0 port of the *Parrot-Refactoring-Kata*.

## Building and Running

* [Apache Ant's XSLT task](https://ant.apache.org/manual/Tasks/style.html) is used to run the transformations.
* `parrot.xsl` contains the Parrot logic.
* Run Ant in the current folder to transform all files.

## Unit Test

[xsltunit](http://xsltunit.org/) is a implementation of xUnit in XSLT.

* `tst_parrot.xsl`is the the test (stylesheet).
* Run Ant in the current folder to run the tests.
* `parrot.test_result.xml` contains the results and
  `parrot.test_result.html` is a readable report.
