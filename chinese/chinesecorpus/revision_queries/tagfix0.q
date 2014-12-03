corpus_encoding: UTF-8
define: CRC.def

node: IP-MAT
copy_corpus: t

query: (IP-MAT idoms P)
AND (P idoms auf*)
AND (IP-MAT idoms {1}C)
AND (C idoms das*)
AND (P iprecedes C)

replace_label{1}: WPRO