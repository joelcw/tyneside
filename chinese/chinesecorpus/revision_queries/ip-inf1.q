corpus_encoding: UTF-8
define: CRC.def

node: IP*
copy_corpus: t

query: (IP* idoms finite_verb)
AND (IP* idoms {1}TO)
AND (IP* idoms {2}non_finite_verb)
AND (TO iprecedes non_finite_verb)

add_internal_node{1,2}: IP-INF