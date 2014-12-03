corpus_encoding: UTF-8

define: CRC.def

node: IP-MAT
copy_corpus: t
query: (IP-MAT idoms {1}WADV)
AND (IP-MAT idoms {2}ADJ)
AND (WADV iprecedes ADJ)

add_internal_node{1,2}: WADJP
