corpus_encoding: UTF-8
define: CRC.def

node: IP-MAT
copy_corpus: t

query: (IP-MAT idoms {1}P)
AND (P idoms !CP_prepositions)
AND (IP-MAT idoms {2}*NP*)
AND (P iprecedes *NP*)

add_internal_node{1, 2}: PP
