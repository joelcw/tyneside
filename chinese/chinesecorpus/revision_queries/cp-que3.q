corpus_encoding: UTF-8
define: CRC.def

node: $METAROOT
copy_corpus: t

query: ({1}IP-MAT-SPE idomsfirst {2}finite_verb) AND (IP-MAT-SPE idoms !imperative_verb)
AND (IP-MAT-SPE idomslast {3}*P*|finite_verb|non_finite_verb|RP)

replace_label{1}: CP-QUE-SPE
add_internal_node{2, 3}: IP-SUB