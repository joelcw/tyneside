CS="java -classpath /Users/yoelw/CurrentLx/OldNorse/CS_2.003.03.jar csearch/CorpusSearch"

pceec="/Users/yoelw/CurrentLx/OldNorse/hnps/pceec/psd/*.psd"

rm cprelExtraposSimplified.pceec.cod
$CS cprelExtraposSimplified.pceec.c $pceec

rm relevant.out
$CS relevant.q cprelExtraposSimplified.pceec.cod

rm cprelExtrapos.pceec.cod
$CS cprelExtrapos.pceec.c relevant.out

rm cprelExtrapos.pceec.cod.ooo
$CS codes.q cprelExtrapos.pceec.cod