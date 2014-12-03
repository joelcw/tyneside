corpus_encoding: UTF-8
define: CRC.def

node: IP*
copy_corpus: t

query: (IP* idoms {1}NP-NOM)
AND (IP* idoms {2}CP-REL)
AND (NP-NOM iprecedes CP-REL)

add_internal_node{1,2}: NP-NOM
delete_node{1}: