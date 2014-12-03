corpus_encoding: UTF-8
define: CRC.def

node: IP-MAT
copy_corpus: t

query: (IP-MAT idoms {1}NP-GEN)
AND (IP-MAT idoms {2}NP)
AND (NP iprecedes NP-GEN)

add_internal_node{1, 2}: NP
delete_node{2}:
