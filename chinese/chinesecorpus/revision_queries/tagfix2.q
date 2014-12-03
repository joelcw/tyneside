corpus_encoding: UTF-8
define: CRC.def

node: IP-MAT
copy_corpus: t

query: (IP-MAT idoms {1}NPR)
AND (NPR idoms erden)
AND (IP-MAT idoms D)
AND (D iprecedes NPR)

replace_label{1}: N