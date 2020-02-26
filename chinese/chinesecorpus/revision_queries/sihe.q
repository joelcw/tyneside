corpus_encoding: UTF-8
define: CRC.def

node: IP*
copy_corpus: t

query: (IP* idoms {1}VBI)
AND (VBI idoms Sih*|sih*)

add_internal_node{1,1}: IP-IMP-PRN