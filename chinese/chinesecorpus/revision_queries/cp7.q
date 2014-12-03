corpus_encoding: UTF-8
define: CRC.def

node: IP*
copy_corpus: t

query: (IP* idoms {1}NP-ACC)
AND (IP* idoms {2}CP-REL)
AND (NP-ACC iprecedes CP-REL)

add_internal_node{1,2}: NP-ACC
delete_node{1}: