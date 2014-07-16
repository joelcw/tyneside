#This script uses the following encoding: utf-8

import sys,string,re

#all = open("test.psd","r").read()
#utfile = open("twocolumns2.txt","w")
all = sys.stdin.read()
words = re.findall("\([A-Z-\.\,]+? [^\(\*]+?[\)-]",all)

for l in words:
    l = l.replace(" -)"," <dash/>)")
    l = l.replace("(","")
    l = l.replace(")","")
#    sys.stderr.write("%s\n" % l)
    columns = l.split()
    if columns[0] == ".":
        sys.stdout.write("%s EOS\n" % (columns[1].replace("-","")))
    elif columns[0] == ",":
        sys.stdout.write("%s PUNCT\n" % (columns[1].replace("-","")))
    elif columns[0] == "\"":
        sys.stdout.write("%s QUOT\n" % (columns[1].replace("-","")))
    elif columns[1] == "0":
        continue
    elif re.search("ID ",l) == None:
        sys.stdout.write("%s %s\n" % (columns[1].replace("-",""),columns[0]))
    elif re.search("ID ",l) != None:
        sys.stdout.write("<utt>\n")
    else:
        sys.stdout.write("YOUMISSEDSOMETHING\n")

#utfile.close()
