import unittest
from lexerClient import scan
import os

inPath = 'resources/scanner/input/'
outPath = 'resources/scanner/output/'
refPath = 'resources/scanner/reference/'

# Read cases file, if you want to avoid some input, delete the line there
cases = []
with open('resources/scanner/cases') as f:
    l = f.readline()
    while l:
        l = l.split(';')
        l[1:2] = ''
        cases.append(l)
        l = f.readline()

class TestLines(unittest.TestCase):
    # Create output dir and delete everything there
    @classmethod
    def setUpClass(cls):
        os.makedirs(outPath, exist_ok=True)
        for root, dirs, files in os.walk(outPath, topdown=False):
            for name in files:
                os.remove(os.path.join(root, name))

    # Compare line by line
    def fileCompare(self, fn1, fn2):
        #import pdb;pdb.set_trace()
        with open(fn1) as f1, open(fn2) as f2:
            l1 = f1.readline()
            l2 = f2.readline()
            if f1 == '' or f2 == '': return False

            l = 1;

            while True:
                if l1 == '' and l2 == '':
                    return True
                if not l1 == l2:
                    return False
                l = l + 1
                l1 = f1.readline()
                l2 = f2.readline()

    def test_files(self):
        for case in cases:
            with self.subTest(msg=case[1], fileName=case[0]):
                file = case[0]
                scan(inPath+file, outPath+file+'.out')
                self.assertTrue(self.fileCompare(outPath+file+'.out', refPath+file+'.out'))

if __name__ == '__main__':
    unittest.main()
