corpus_encoding: UTF-8
define: CRC.def

node: IP-MAT
copy_corpus: t

query: (IP-MAT idoms {1}[1]NP)
AND (IP-MAT idoms {2}CONJ)
AND (IP-MAT idoms {3}[2]NP)
AND ([1]NP iprecedes CONJ)
AND (CONJ iprecedes [2]NP)

add_internal_node{1, 3}: NP
add_internal_node{2, 3}: CONJP
