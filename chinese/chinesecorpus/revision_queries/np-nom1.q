corpus_encoding: UTF-8
define: CRC.def

node: IP-MAT
copy_corpus: t

query: (IP-MAT idoms {1}NP)
AND (NP idoms PRO)
AND (PRO idoms ich|ych|du|wir|wyr|er|yhr|ihr|$ich|$ych|$du|$wir|$wyr|$er|$yhr|$ihr|Ich|Du|Wir|Ych|Wyr|Er|Yhr|Ihr|$Ich|$Ych|$Du|$Wir|$Wyr|$Er|$Yhr|$Ihr)

append_label{1}: -NOM
