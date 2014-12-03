corpus_encoding: UTF-8
define: CRC.def

node: IP-MAT
copy_corpus: t

query: (IP-MAT idoms {1}[1]NUM*) 
AND (IP-MAT idoms {2}[2]NUM)
AND ([1]NUM iprecedes [2]NUM)

add_internal_node{1, 2}: NBAR
