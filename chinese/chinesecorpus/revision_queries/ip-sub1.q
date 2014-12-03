corpus_encoding: UTF-8
define: CRC.def

node: IP*
copy_corpus: t

query: (IP* idoms {1}P)
AND (P idoms CP_prepositions)

add_internal_node{1, 1}: IP-SUB

