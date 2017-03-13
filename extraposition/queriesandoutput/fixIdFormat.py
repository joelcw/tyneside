#26Feb2016
#Script takes the output of CS extracting codes with printing token ids, and converts the id into a coding column for text; so it changes @ to : and removes token number

import sys,string,re

#Note that the second group below is made non-greedy because of some YCOE ids that have another comma in them later on...but check this behaviour 

idregex = re.compile("(@)(.*?)(,.*)$")

#function returning id in the right format 

def textid(matchobj):
    return (":%s" % matchobj.group(2))

lines = sys.stdin.readlines()

for line in lines:
    new = idregex.sub(textid,line)
    sys.stdout.write(new)
