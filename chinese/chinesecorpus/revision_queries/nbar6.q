corpus_encoding: UTF-8
define: CRC.def
node: IP-MAT
copy_corpus: t

query: ((IP-MAT idoms {1}D|Q*)
AND (IP-MAT idoms {2}ADJ*)
AND (ADJ* iprecedes !NBAR)
AND (D|Q* iprecedes ADJ*))

add_internal_node{1, 2}: NBAR
