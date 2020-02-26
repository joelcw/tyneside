corpus_encoding: UTF-8
define: CRC.def

node: $METAROOT
copy_corpus: t

query: ({1}IP-MAT-SPE idoms VBI|BEI|HVI|RDI|MDI)

replace_label{1}: IP-IMP-SPE