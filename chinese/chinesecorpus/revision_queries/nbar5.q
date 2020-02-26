corpus_encoding: UTF-8
define: CRC.def
node: IP-MAT
copy_corpus: t

query: (IP-MAT idoms {1}[1]NBAR)
AND (IP-MAT idoms {2}[2]NBAR)
AND ([1]NBAR idoms ADJ*|NUM*|Q*)
AND ([1]NBAR iprecedes [2]NBAR)

add_internal_node{1, 2}: NBAR
delete_node{1}:
delete_node{2}:
