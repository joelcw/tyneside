#Script takes the output of CS extracting codes with printing token ids, and converts the id into a coding column for text; so it changes @ to : and removes token number

import sys,string,re

idregex = re.compile("(@)(.*)(,.*)$")

#function returning id in the right format 

def textid(matchobj):
    return (":%s" % matchobj.group(2))

lines = sys.stdin.readlines()

for line in lines:
    new = idregex.sub(textid,line)
    sys.stdout.write(new)
