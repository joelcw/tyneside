corpus_encoding: UTF-8

define: CRC.def

node: IP-MAT
copy_corpus: t
query: (IP-MAT idoms {1}ADV|ADVR)

add_internal_node{1,1}: ADVP
