corpus_encoding: UTF-8
define: CRC.def

node: IP-MAT
copy_corpus: t

query: (IP-MAT idoms {1}WD|WPRO$)
AND (IP-MAT idoms {2}N*)
AND (WD|WPRO$ iprecedes N*)

add_internal_node{1, 2}: WNP
