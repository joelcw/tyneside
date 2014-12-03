corpus_encoding: UTF-8
define: CRC.def

node: IP*
copy_corpus: t

query: (IP* idoms [1]finite_verb)
AND ([1]finite_verb idoms sag*|sprich*|sprech*|sprach*)
AND ([1]finite_verb precedes !*-SPE)
AND ([1]finite_verb iprecedes NP-DAT|PP)
AND ([1]NP-DAT|PP iprecedes {1}[2]finite_verb|IP-IMP*|NP*|ADVP*)
AND (IP* idomslast {2}[3]finite_verb|*P*|non_finite_verb)

add_internal_node{1,2}: IP-MAT-SPE