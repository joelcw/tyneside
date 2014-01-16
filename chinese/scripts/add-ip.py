import sys,string,re

thing = sys.stdin.read()

thing = thing.replace("\n\n","\n")

lines = thing.split("\n")

for line in lines:
    sys.stdout.write("( (IP-MAT %s))\n\n" % line)


#    regex = re.compile("(\([A-Z]+)([^ A-Z])")
#    regex.search(line)
