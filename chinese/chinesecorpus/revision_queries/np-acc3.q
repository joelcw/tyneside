corpus_encoding: UTF-8
define: CRC.def

node: IP*
copy_corpus: t

query: (IP* idoms {1}NP)
AND NOT (IP* idoms NP-ACC)

append_label{1}: -ACC
