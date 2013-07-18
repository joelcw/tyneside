remove_nodes:t
nodes_only:t
add_to_ignore: \**
node: IP*
define: /Users/yoelw/CurrentLx/OldNorse/verbtopic.def
query: (IP* idoms PP*)
    AND (PP* idoms NP) AND (NP idoms CP-REL*)