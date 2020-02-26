corpus_encoding: UTF-8
define: CRC.def

node: IP*
copy_corpus: t

query: (IP* idoms {1}CP-REL)
AND (CP-REL idoms WPP)
AND (WPP doms auf*)
AND (WPP idoms WNP)
AND (WNP doms das*)

replace_label{1}: CP-CAR