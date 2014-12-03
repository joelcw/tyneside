corpus_encoding: UTF-8
define: CRC.def

node: IP-MAT
copy_corpus: t

query: (IP-MAT idoms {1}NP)
AND (NP idoms PRO$)
AND (D idoms *en|*nn|*rn)
AND (NP idoms NS|NPRS)

append_label{1}: -DAT
