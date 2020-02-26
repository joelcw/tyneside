corpus_encoding: UTF-8
define: CRC.def

node: IP*
copy_corpus: t

query: (IP* idomsfirst {1}NP)

append_label{1}: -NOM
