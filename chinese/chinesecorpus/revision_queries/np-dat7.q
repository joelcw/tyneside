corpus_encoding: UTF-8
define: CRC.def

node: IP*
copy_corpus: t

query: (IP* idoms {1}NP)
AND (IP* idoms VBP*|VBD|VBI)
AND (VBP*|VBD|VBI idoms sag*)
AND (VBP*|VBD|VBI iprecedes NP)

append_label{1}: -DAT
