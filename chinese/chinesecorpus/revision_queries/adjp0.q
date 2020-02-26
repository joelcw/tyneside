corpus_encoding: UTF-8

define: CRC.def

node: IP-MAT
copy_corpus: t
query: (IP-MAT idoms {1}Q*|ADV*|ALSO) 
AND (Q*|ADV*|ALSO idoms qualifier) 
AND (IP-MAT idoms {2}ADJ*)
AND (Q*|ADV*|ALSO iprecedes ADJ*)

add_internal_node{1,2}: ADJP
