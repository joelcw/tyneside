corpus_encoding: UTF-8

define: CRC.def

node: IP-MAT
copy_corpus: t
query: (IP-MAT idoms {1}Q*|[1]ADVR) 
AND (IP-MAT idoms {2}[2]ADV*|ALSO)
AND (Q*|[1]ADVR iprecedes [2]ADV*|ALSO)

add_internal_node{1,2}: ADVP
