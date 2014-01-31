import sys,string

outfile = open("allLangsEx.cod.ooo","w")

infile = open("../queriesandoutput/cprelExtrapos.ymeb.cod.ooo","r")

lines = infile.readlines()

for line in lines:
    line = line.replace("\n","")
    outfile.write("%s:English\n" % line)

infile = open("../queriesandoutput/cprelExtrapos.ice.cod.ooo","r")

lines = infile.readlines()

for line in lines:
    line = line.replace("\n","")
    fields = line.split(":")
    if len(fields) >= 6:
        outfile.write("%s:%s:%s:%s:%s:%s:Icelandic\n" % (fields[0],fields[1],fields[2],fields[3],fields[4],fields[5]))

infile = open("../queriesandoutput/cprelExtrapos.fre.cod.ooo","r")

lines = infile.readlines()

for line in lines:
    line = line.replace("\n","")
    fields = line.split(":")
    if len(fields) >=6:
        outfile.write("%s:%s:%s:%s:%s:%s:French\n" % (fields[0],fields[1],fields[2],fields[3],fields[4],fields[5]))

infile = open("../queriesandoutput/cprelExtrapos.port.cod.ooo","r")

lines = infile.readlines()

for line in lines:
    line = line.replace("\n","")
    outfile.write("%s:Portuguese\n" % line)

outfile.close()
infile.close()
