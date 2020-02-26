corpus_encoding: UTF-8
define: CRC.def

node: IP*
copy_corpus: t

query: (PP idoms CP-ADV) AND (CP-ADV idoms {1}P)

move_up_node{1}: