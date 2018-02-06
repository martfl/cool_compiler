from antlr4 import FileStream
from antlr4.error.ErrorListener import ErrorListener
from antlr.coolLexer import coolLexer
from antlr.coolParser  import coolParser 
from antlr.coolListener import coolListener
import sys

class MyListener(ErrorListener):
    def syntaxError(self, recognizer, offendingSymbol, line, column, msg, e):
        print(msg)
        print("Help me im lost!!!!")

def scan(fnamein, fnameout):
    with open(fnameout, 'w') as fout:
        print("#name %s" % fnamein, file=fout)
        lexer = coolLexer(FileStream(fnamein))
        try:
            l = lexer.getAllTokens()
        except:
            print("Error")
            return
        for x in l:
            print('#%d %s "%s"' % (x.line, lexer.symbolicNames[x.type], x.text), 
                file=fout)

def main(argv):
    print("#name %s" % (argv[1]))
    input = FileStream(argv[1])
    lexer = coolLexer(input)
#    lexer.removeErrorListeners()
#    lexer.addErrorListener(MyListener())
    try:
        l = lexer.getAllTokens()
    except:
        print("Error")
        return
    for x in l:
        print('#%d %s "%s"' % (x.line, lexer.symbolicNames[x.type], x.text))

if __name__ == '__main__':
    #main(sys.argv)
    scan('resources/scanner/input/all_else_true.cl.cool', 'resources/scanner/output/all_else_true.cl.cool')
