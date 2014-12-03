corpus_encoding: UTF-8
define: CRC.def

node: IP*
copy_corpus: t

query: (IP* idoms {1}CP-REL)
AND (!NP*|PP iprecedes CP-REL)

add_internal_node{1,1}: NP
replace_label{1}: CP-FRL