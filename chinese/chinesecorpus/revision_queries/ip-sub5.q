corpus_encoding: UTF-8
define: CRC.def

node: IP*
copy_corpus: t

query: ([1]IP* idoms {1}[2]IP-SUB)
AND ([1]IP* idoms *P*)
AND ([1]IP* idoms {2}non_finite_verb)
AND ([2]IP-SUB iprecedes *P*)
AND (*P* iprecedes non_finite_verb)

add_internal_node{1, 2}: IP-SUB
delete_node{1}:

