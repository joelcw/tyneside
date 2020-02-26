corpus_encoding: UTF-8
define: CRC.def

node: IP*
copy_corpus: t

query: (IP* idomsfirst CONJ)
AND (IP* idoms {1}NP)
AND (CONJ iprecedes NP)

append_label{1}: -NOM
