corpus_encoding: UTF-8
define: CRC.def

node: IP*
copy_corpus: t

query: (IP* idoms {1}W*P)

add_internal_node{1, 1}: IP-SUB

