CS="java -classpath /Users/yoelw/CurrentLx/OldNorse/CS_2.003.03.jar csearch/CorpusSearch"

pceec="/Users/yoelw/CurrentLx/OldNorse/hnps/pceec/psd/*.psd"

midfre="/Users/yoelw/CurrentLx/OldNorse/MiddleFrench/*.psd"

icepahc="/Users/yoelw/icecorpus/finished/*.psd"

ycoe="/Users/yoelw/CurrentLx/OldNorse/historicalsyntaxcourse/YCOE/*.psd"

ppcme2="/Users/yoelw/CurrentLx/OldNorse/ppcmeWork/*.ref"

ppceme="/Users/yoelw/CurrentLx/OldNorse/historicalsyntaxcourse/PENN-CORPORA/PPCEME-RELEASE-1/corpus/psd/*/*.psd"

ppcmbe="/Users/yoelw/CurrentLx/OldNorse/historicalsyntaxcourse/PENN-CORPORA/PPCMBE/*.ref"

tychobrahe="/Users/yoelw/CurrentLx/OldNorse/tychobrahe/*psd.txt"

#Run Study on PPCHE


rm cprelExtraposSimplified.ymeb.cod
$CS cprelExtraposSimplified.diach.c $ycoe $ppcme2 $ppceme $ppcmbe -out cprelExtraposSimplified.ymeb.cod

rm relevant.ymeb.out
$CS relevant.q cprelExtraposSimplified.ymeb.cod -out relevant.ymeb.out

rm cprelExtrapos.ymeb.cod
$CS cprelExtrapos.ymeb.c relevant.ymeb.out

rm cprelExtrapos.ymeb.cod.ooo
$CS codes.q cprelExtrapos.ymeb.cod


#Run Study on IcePaHC

rm cprelExtraposSimplified.ice.cod
$CS cprelExtraposSimplified.diach.c $icepahc -out cprelExtraposSimplified.ice.cod

rm relevant.ice.out
$CS relevant.q cprelExtraposSimplified.ice.cod -out relevant.ice.out


rm cprelExtrapos.ice.cod
$CS cprelExtrapos.ice.c relevant.ice.out

rm cprelExtrapos.ice.cod.ooo
$CS codes.q cprelExtrapos.ice.cod


#Run Study on Middle French Corpus

rm cprelExtraposSimplified.fre.cod
$CS cprelExtraposSimplified.diach.c $midfre -out cprelExtraposSimplified.fre.cod

rm relevant.fre.out
$CS relevant.q cprelExtraposSimplified.fre.cod -out relevant.fre.out


rm cprelExtrapos.fre.cod
$CS cprelExtrapos.fre.c relevant.fre.out

rm cprelExtrapos.fre.cod.ooo
$CS codes.q cprelExtrapos.fre.cod


#Run Study on Tycho Brahe Portuguese Corpus

rm cprelExtraposSimplified.port.cod
$CS cprelExtraposSimplified.diach.c $tychobrahe -out cprelExtraposSimplified.port.cod

rm relevant.port.out
$CS relevant.q cprelExtraposSimplified.port.cod -out relevant.port.out


rm cprelExtrapos.port.cod
$CS cprelExtrapos.port.c relevant.port.out

rm cprelExtrapos.port.cod.ooo
$CS codes.q cprelExtrapos.port.cod

#To do a mixed effects model you'll have to change the text ids with fixIdFormat.py as the last step. Currently the files with fixed ids added are named *.cod.fixed.ooo