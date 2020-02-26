corpus_encoding: UTF-8
define: CRC.def

node: IP*
copy_corpus: t

query: (IP* idoms {1}PP)
AND (PP iprecedes {2}CP-REL)
AND (PP idoms {3}NP)

add_internal_node{1,2}: PP
delete_node{1}:
add_internal_node{3,2}: NP
delete_node{3}: