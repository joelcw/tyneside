corpus_encoding: UTF-8
define: CRC.def

node: IP-MAT
copy_corpus: t

query: (IP-MAT idoms {1}NP)
AND (NP idoms PRO)
AND (PRO idoms ihn|yhn|yn|mich|sich|$sich|dich)

append_label{1}: -ACC
