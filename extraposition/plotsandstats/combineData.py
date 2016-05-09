#this takes the extracted code CS output files and combines them, adding a label per language. This version is for the "fixed" versions, which have text ids added, for mixed effects modelling.

import sys,string

outfile = open("allLangsEx.cod.ooo","w")

infile = open("../queriesandoutput/cprelExtrapos.ymeb.cod.fixed.ooo","r")

lines = infile.readlines()

for line in lines:
    line = line.replace("\n","")
    outfile.write("%s:English\n" % line)

infile = open("../queriesandoutput/cprelExtrapos.ice.cod.fixed.ooo","r")

lines = infile.readlines()

for line in lines:
    line = line.replace("\n","")
    fields = line.split(":")
    if len(fields) >= 7:
        outfile.write("%s:%s:%s:%s:%s:%s:%s:Icelandic\n" % (fields[0],fields[1],fields[2],fields[3],fields[4],fields[5],fields[6]))
#debug
#    else:
 #       sys.stdout.write(line)

infile = open("../queriesandoutput/cprelExtrapos.fre.cod.fixed.ooo","r")

lines = infile.readlines()

for line in lines:
    line = line.replace("\n","")
    fields = line.split(":")
    if len(fields) >=7:
        outfile.write("%s:%s:%s:%s:%s:%s:%s:French\n" % (fields[0],fields[1],fields[2],fields[3],fields[4],fields[5],fields[6]))

infile = open("../queriesandoutput/cprelExtrapos.port.cod.fixed.ooo","r")

lines = infile.readlines()

for line in lines:
    line = line.replace("\n","")
    outfile.write("%s:Portuguese\n" % line)

outfile.close()
infile.close()
