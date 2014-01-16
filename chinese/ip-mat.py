import sys,string

inputfile = open('mengzi1.1-1.5.txt', 'r')
#.decode('utf-8')
lines = inputfile.readlines()


outputfile = open("testmengzi.txt","w")
#.encode('utf-8')


prefix = '( (IP-MAT '
suffix = '))'

for line in lines:
	x = line.split('\n')
	outputfile.write('%s%s%s\n\n' % (prefix,line.rstrip('\n'),suffix))
	


outputfile.close()
inputfile.close()
