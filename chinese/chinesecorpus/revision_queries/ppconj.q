corpus_encoding: UTF-8
define: CRC.def

node: IP-MAT
copy_corpus: t

query: (IP-MAT idoms {1}[1]PP)
AND (IP-MAT idoms {2}CONJ)
AND (IP-MAT idoms {3}[2]PP)
AND ([1]PP iprecedes CONJ)
AND (CONJ iprecedes [2]PP)

add_internal_node{1, 3}: PP
add_internal_node{2, 3}: CONJP
