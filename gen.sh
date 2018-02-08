#!/bin/bash

cd antlr
#\rm *.pyc
\rm -rf __pycache__
\rm *.py
#\rm *.java
#\rm *.class
java -jar antlr-4.7.1-complete.jar -Dlanguage=Python3 cool.g4
#java -jar antlr-4.7.1-complete.jar cool.g4
#javac -cp antlr-4.7.1-complete.jar *.java
