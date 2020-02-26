# -*- coding: utf-8 -*-
import xml.etree.ElementTree as ET
import sys, string, re, codecs
#from glob import glob
#filelist = glob('*.xml')

#or file in filelist:
file = '41.xml'
tree = ET.parse(file)
root = tree.getroot()
outname = file.replace("xml","txt")
outfile = codecs.open(outname, "w", encoding = 'utf-8')


outfile.write("( (IP-MAT (DOC INFO ")
for meta in root.findall('meta'):
	sub_corpus = meta.find('sub_corpus').text

	period = meta.find('period').text

	notes = meta.find('notes').text

	outfile.write('%s\n%s\n%s)\n' % (sub_corpus, period, notes))
	outfile.write(") )\n")

outfile.write('( (IP-MAT ')

for e in root.findall('.//s/*'):
	e_text = e.text
	if e.get('type') != None:
		e.set('type','%s%s ' % (e.tag, e.attrib['type']))
		if e.text == u"\u3002":
			outfile.write("(%s %s) )\n\n( (IP-MAT "%(e.attrib['type'], e_text))

		else:

			outfile.write('(%s %s) '%(e.attrib['type'], e_text))
	else:
		outfile.write('(%s %s) '%(e.tag, e_text))
outfile.write(") )\n\n")

outfile.close()