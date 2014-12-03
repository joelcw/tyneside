corpus_encoding: UTF-8
define: CRC.def

node: IP-MAT
copy_corpus: t

query: (IP-MAT idoms {1}N)
AND (N idoms erden)
AND (!D iprecedes N)

replace_label{1}: NPR