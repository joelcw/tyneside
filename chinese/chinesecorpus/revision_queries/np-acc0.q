corpus_encoding: UTF-8
define: CRC.def

node: IP-MAT
copy_corpus: t

query: (IP-MAT idoms {1}NP)
AND (NP idoms D)
AND (D idoms den)
AND (NP idoms N|NPR)

append_label{1}: -ACC
