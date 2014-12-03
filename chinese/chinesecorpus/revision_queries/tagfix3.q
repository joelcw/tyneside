corpus_encoding: UTF-8
define: CRC.def

node: IP-MAT
copy_corpus: t

query: (IP-MAT idoms {1}C)
AND (C idoms als|Als|wie|Wie|so|So|ﬂo|ehe|Ehe|wen*|Wen*|bis|Bis|biﬂ|Biﬂ|ob|Ob)

replace_label{1}: P