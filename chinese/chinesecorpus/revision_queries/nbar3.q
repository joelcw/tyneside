corpus_encoding: UTF-8
define: CRC.def

node: IP-MAT
copy_corpus: t

query: (IP-MAT idoms {1}ADJ*|Q*|D)
AND (IP-MAT idoms {2}NBAR)
AND (NBAR idoms !PRO)
AND (ADJ*|Q*|D iprecedes NBAR)

add_internal_node{1, 2}: NBAR
delete_node{2}: 
