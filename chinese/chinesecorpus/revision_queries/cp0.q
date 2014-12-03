corpus_encoding: UTF-8
define: CRC.def

node: IP*
copy_corpus: t

query: (IP* idoms {1}IP-SUB)
AND (IP-SUB idomsfirst {2}C)
AND (C idoms das|dass|daﬂ)

add_internal_node{1,1}: CP-THT
move_up_node{2}: