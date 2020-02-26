corpus_encoding: UTF-8
define: CRC.def

node: IP*
copy_corpus: t

query: (IP* idoms {1}NP-ACC)
AND (IP* idoms VBP*|VBD|VBI)
AND (VBP*|VBD|VBI idoms sag*)
AND (VBP*|VBD|VBI iprecedes NP-ACC)

post_crop_label{1}: -
append_label{1}: -DAT
