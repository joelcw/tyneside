remove_nodes:t
nodes_only:t
add_to_ignore: \**
node: IP*
define: /Users/yoelw/CurrentLx/OldNorse/verbtopic.def
query: IP* idoms finite_aux
AND
IP* idoms nonfin_verb
AND
IP* idoms NP-SBJ*
AND
IP* idoms *P*
AND
*P* iprecedes finite_aux
AND
finite_aux precedes NP-SBJ*
AND
NP-SBJ* precedes nonfin_verb