node: CP-QUE*
add_to_ignore: \**
coding_query:

// Codes 1 for hvort ("whether") and 0 for ef ("if") introducing an embedded question.

//Note that spelling variation, if there is any, does not need to be dealt with in IcePaHC because the corpus is lemmatized (in the form: word-lemma).

1: {
  
    \0: ((CP-QUE* idoms C) AND (C idoms *-ef) AND (CP-QUE* idoms !WQ))
OR 
((CP-QUE* idoms C) AND (CP-QUE* idoms WQ) AND (WQ idoms *-ef))
    
    \1: (CP-QUE* idoms C) AND (CP-QUE* idoms WQ) AND (WQ idoms *-hvor*)
    z: ELSE
   }




// whether or not there is a disjunction anywhere in the clause

2: {
    disj: ((CP-QUE* idoms IP-SUB*) AND (CP-QUE* idoms C) AND (IP-SUB* idoms CONJP*) AND (CONJP* idoms CONJ) AND (CONJ idoms *-eða))
OR
    ((CP-QUE* idoms IP-SUB*) AND (CP-QUE* idoms C) AND (IP-SUB* idomsmod CP-THT*|IP* .*) AND (.* idomsmod CONJP*|NP*|PP* CONJ) AND (CONJ idoms *-eða))

    simple: (CP-QUE* idoms IP-SUB*) AND (CP-QUE* idoms C)

    z: ELSE
}




// time periods. Most of the dates for these texts are fairly reliable, though the earliest dates are manuscript dates, sometimes estimated.

3: {
	\1150: (*1150* inID)
	\1210: (*1210* inID)
	\1250: (*1250* inID)
	\1260: (*1260* inID)
	\1270: (*1270* inID)
	\1275: (*1275* inID)
	\1300: (*1300* inID)
	\1310: (*1310* inID)
	\1325: (*1325* inID)
	\1350: (*1350* inID)
	\1400: (*1400* inID)
	\1450: (*1450* inID)
	\1475: (*1475* inID)
	\1480: (*1480* inID)
	\1525: (*1525* inID)
	\1540: (*1540* inID)
	\1593: (*1593* inID)
	\1611: (*1611* inID)
	\1628: (*1628* inID)
	\1630: (*1630* inID)
	\1650: (*1650* inID)
	\1659: (*1659* inID)
	\1661: (*1661* inID)
	\1675: (*1675* inID)
	\1680: (*1680* inID)
	\1720: (*1720* inID)
	\1750: (*1750* inID)
	\1725: (*1725* inID)
	\1745: (*1745* inID)
	\1790: (*1790* inID)
	\1791: (*1791* inID)
	\1830: (*1830* inID)
	\1835: (*1835* inID)
	\1850: (*1850* inID)
	\1859: (*1859* inID)
	\1861: (*1861* inID)
	\1882: (*1882* inID)
	\1883: (*1883* inID)
	\1888: (*1888* inID)
	\1902: (*1902* inID)
	\1907: (*1907* inID)
	\1908: (*1908* inID)
	\1920: (*1920* inID)
	\1985: (*1985* inID)
	\2008: (*2008* inID)
      z:  ELSE
   }
