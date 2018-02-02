from antlr4 import *
from antlr4.error.ErrorListener import ErrorListener
from antlr.coolLexer import coolLexer
from antlr.coolParser  import coolParser 
from antlr.coolListener import coolListener
import sys

class MyListener(ErrorListener):
    def syntaxError(self, recognizer, offendingSymbol, line, column, msg, e):
        print(msg)
        print("Help me im lost!!!!")

def main(argv):
    print("#name %s" % (argv[1]))
    input = FileStream(argv[1])
    lexer = coolLexer(input)
#    lexer.removeErrorListeners()
#    lexer.addErrorListener(MyListener())
    try:
        l = lexer.getAllTokens()
#        import pdb; pdb.set_trace()
    except:
        print("Error")
        return
    for x in l:
        print('#%d %s "%s"' % (x.line, lexer.symbolicNames[x.type], x.text))

if __name__ == '__main__':
    main(sys.argv)
