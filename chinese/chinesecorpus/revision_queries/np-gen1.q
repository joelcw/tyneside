corpus_encoding: UTF-8
define: CRC.def

node: IP-MAT
copy_corpus: t

query: (IP-MAT idoms {1}[1]NP)
AND ([1]NP idoms NPR*)
AND ([1]NP idoms !D)
AND (IP-MAT idoms {2}[2]NP)
AND ([2]NP iprecedes [1]NP)

append_label{1}: -GEN
add_internal_node{1, 2}: NP
delete_node{2}:
