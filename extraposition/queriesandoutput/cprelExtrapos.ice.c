//Modified query for cprel extraposition in the PCEEC corpus, based on original query by AKIngason

//CAVEAT: this query is long enough that it will take over a day to run. A better way is to first extract a list of tokens relevant to the variation by leaving out the last few parts of the query (which is the query cprelExtraposSimplified.pceec.c), and then use relevant.q, and then run this whole query on the output and recode it that way. See runstudyPCEEC.sh

node: IP*
define: /Users/yoelw/CurrentLx/OldNorse/verbtopic.def
coding_query:

/*

// 1: extraposed
// 0: in situ
1: {
	\1: (IP* idoms NP-SBJ*|NP-OB*)
           AND (NP-SBJ*|NP-OB* idoms CP-REL*)
 	   AND (CP-REL* iDomsViaTrace \*ICH* IP-SUB*) 
	\0: (IP* idoms NP-SBJ*|NP-OB*)
           AND (NP-SBJ*|NP-OB* idoms CP-REL*)
 	   AND (CP-REL* idoms IP-SUB*) 
	z: ELSE
}

// SBJ vs OBJ
2: {	
	sbj: (IP* idoms NP-SBJ*)
           AND (NP-SBJ* idoms CP-REL*)
	obj: (IP* idoms NP-OB*)
       	   AND (NP-OB* idoms CP-REL*)
        pp: (IP* idoms PP*)
    AND (PP* idoms NP) AND (NP idoms CP-REL*)
        z: ELSE
}

// MAT vs SUB
3: {
	mat: (IP-MAT* idoms NP-SBJ*|NP-OB*)
           AND (NP-SBJ*|NP-OB* idoms CP-REL*)	
	sub: (IP-SUB* idoms NP-SBJ*|NP-OB*)
           AND (NP-SBJ*|NP-OB* idoms CP-REL*)	
	z: ELSE
}

Originally intended for definiteness. I'm leaving it out because it's complicated and I'm not sure it works.
// n: noun NP
// r: proper name
// d: determiner
// p: pronoun
// q: quantifier

4: {	i: ( (IP-MAT*|IP-SUB* idoms NP-SBJ*|NP-OB*)
  	   AND (NP-SBJ*|NP-OB* idoms CP-REL*)
	   AND (NP-SBJ*|NP-OB* idoms N-*|NS-*|ADJ-*|ADJR-*|ADJS-*|SUCH-*|ADV*) 
           AND (NP-SBJ*|NP-OB* idoms !D-*)  
           AND (NP-SBJ*|NP-OB* idomsmod NP-POS* !D-*|PRO-*|NPR-*|NPRS-*) ) 
	d: ( (IP-MAT*|IP-SUB* idoms NP-SBJ*|NP-OB*)
  	   AND (NP-SBJ*|NP-OB* idoms CP-REL*)
           AND (NP-SBJ*|NP-OB* idoms Q-*|QR-*|QS-*|NUM-*|ONE-*|OTHER*-*) 
    	   AND (Q-*|QR-*|QS-*|NUM-*|ONE-*|OTHER*-* idoms *-allur|*-hver|*-flest*)
           AND (NP-SBJ*|NP-OB* idomsmod NP-POS* !D-*|PRO-*|NPR-*|NPRS-*) )
	d: ( (IP-MAT*|IP-SUB* idoms NP-SBJ*|NP-OB*)
  	   AND (NP-SBJ*|NP-OB* idoms CP-REL*)          
	   AND (NP-SBJ*|NP-OB* idoms NP)
           AND (NP idoms Q-*|QR-*|QS-*|NUM-*|ONE-*|OTHER*-*)
    	   AND (Q-*|QR-*|QS-*|NUM-*|ONE-*|OTHER*-* idoms *-allur|*-hver|*-flest*) 
  	   AND (NP idoms NP-POS*)
           AND (NP-POS* idoms !D-*|PRO-*|NPR-*|NPRS-*) )  
	i: ( (IP-MAT*|IP-SUB* idoms NP-SBJ*|NP-OB*)
  	   AND (NP-SBJ*|NP-OB* idoms CP-REL*)
           AND (NP-SBJ*|NP-OB* idoms Q-*|QR-*|QS-*|NUM-*|ONE-*|OTHER*-*) 
           AND (NP-SBJ*|NP-OB* idomsmod NP-POS* !D-*|PRO-*|NPR-*|NPRS-*) )
	i: ( (IP-MAT*|IP-SUB* idoms NP-SBJ*|NP-OB*)
  	   AND (NP-SBJ*|NP-OB* idoms CP-REL*)          
	   AND (NP-SBJ*|NP-OB* idoms NP)
           AND (NP idoms Q-*|QR-*|QS-*|NUM-*|ONE-*|OTHER*-*) 
  	   AND (NP idoms NP-POS*)
           AND (NP-POS* idoms !D-*|PRO-*|NPR-*|NPRS-*) )  
	d: ( (IP-MAT*|IP-SUB* idoms NP-SBJ*|NP-OB*)
  	   AND (NP-SBJ*|NP-OB* idoms CP-REL*)
           AND (NP-SBJ*|NP-OB* idoms D-*|PRO-*|NPR-*|NPRS-*) ) 
	d: ( (IP-MAT*|IP-SUB* idoms NP-SBJ*|NP-OB*)
  	   AND (NP-SBJ*|NP-OB* idoms CP-REL*)
           AND (NP-SBJ*|NP-OB* idomsmod NP-POS* D-*|PRO-*|NPR-*|NPRS-*) ) 
	d: ( (IP-MAT*|IP-SUB* idoms NP-SBJ*|NP-OB*)
  	   AND (NP-SBJ*|NP-OB* idoms CP-REL*)
	   AND (NP-SBJ*|NP-OB* idomsmod NP N-*|NS-*|ADJ-*|ADJR-*|ADJS-*|SUCH-*|ADV*) 
           AND (NP-SBJ*|NP-OB* idomsmod NP D-*)  ) 
	i: ( (IP-MAT*|IP-SUB* idoms NP-SBJ*|NP-OB*)
  	   AND (NP-SBJ*|NP-OB* idoms CP-REL*)
           AND (NP-SBJ*|NP-OB* idoms !D-*)  
           AND (NP-SBJ*|NP-OB* idomsmod NP-POS* !D-*|PRO-*|NPR-*|NPRS-*) 
           AND (NP-SBJ*|NP-OB* idomsmod NP-POS* N-*|NS-*|ADJ-*|ADJR-*|ADJS-*|SUCH-*|ADV*) )

	z: ELSE
}



//	  (NP-OB1 (NP (Q-A margt-margur)
//		      (NP-POS (NS-G smáskipa-smáskip)))



4: {
	spch: (IP-*-SPE*|IP-*-SPE* idoms NP-SBJ*|NP-OB*)
	    AND (NP-SBJ*|NP-OB* idoms CP-REL*)	
	txt: ELSE
}



// numwords
5: {
	\1: (CP-REL* domswords 1)
	\2: (CP-REL* domswords 2)
	\3: (CP-REL* domswords 3)
	\4: (CP-REL* domswords 4)
	\5: (CP-REL* domswords 5)
	\6: (CP-REL* domswords 6)
	\7: (CP-REL* domswords 7)
	\8: (CP-REL* domswords 8)
	\9: (CP-REL* domswords 9)
	\10: (CP-REL* domswords 10)
	\11: (CP-REL* domswords 11)
	\12: (CP-REL* domswords 12)
	\13: (CP-REL* domswords 13)
	\14: (CP-REL* domswords 14)
	\15: (CP-REL* domswords 15)
	\16: (CP-REL* domswords 16)
	\17: (CP-REL* domswords 17)
	\18: (CP-REL* domswords 18)
	\19: (CP-REL* domswords 19)
	\20: (CP-REL* domswords 20)
	\21: (CP-REL* domswords 21)
	\22: (CP-REL* domswords 22)
	\23: (CP-REL* domswords 23)
	\24: (CP-REL* domswords 24)
	\25: (CP-REL* domswords 25)
	\26: (CP-REL* domswords 26)
	\27: (CP-REL* domswords 27)
	\28: (CP-REL* domswords 28)
	\29: (CP-REL* domswords 29)
	\30: (CP-REL* domswords 30)
	\31: (CP-REL* domswords 31)
	\32: (CP-REL* domswords 32)
	\33: (CP-REL* domswords 33)
	\34: (CP-REL* domswords 34)
	\35: (CP-REL* domswords 35)
	\36: (CP-REL* domswords 36)
	\37: (CP-REL* domswords 37)
	\38: (CP-REL* domswords 38)
	\39: (CP-REL* domswords 39)
	\40: (CP-REL* domswords 40)
	\41: (CP-REL* domswords 41)
	\42: (CP-REL* domswords 42)
	\43: (CP-REL* domswords 43)
	\44: (CP-REL* domswords 44)
	\45: (CP-REL* domswords 45)
	\46: (CP-REL* domswords 46)
	\47: (CP-REL* domswords 47)
	\48: (CP-REL* domswords 48)
	\49: (CP-REL* domswords 49)
	\50: (CP-REL* domswords> 49)
	\51: (CP-REL* domswords 51)
	\52: (CP-REL* domswords 52)
	\53: (CP-REL* domswords 53)
	\54: (CP-REL* domswords 54)
	\55: (CP-REL* domswords 55)
	\56: (CP-REL* domswords 56)
	\57: (CP-REL* domswords 57)
	\58: (CP-REL* domswords 58)
	\59: (CP-REL* domswords 59)
	\60: (CP-REL* domswords 60)
	\61: (CP-REL* domswords 61)
	\62: (CP-REL* domswords 62)
	\63: (CP-REL* domswords 63)
	\64: (CP-REL* domswords 64)
	\65: (CP-REL* domswords 65)
	\66: (CP-REL* domswords 66)
	\67: (CP-REL* domswords 67)
	\68: (CP-REL* domswords 68)
	\69: (CP-REL* domswords 69)
	\70: (CP-REL* domswords 70)
	\71: (CP-REL* domswords 71)
	\72: (CP-REL* domswords 72)
	\73: (CP-REL* domswords 73)
	\74: (CP-REL* domswords 74)
	\75: (CP-REL* domswords 75)
	\76: (CP-REL* domswords 76)
	\77: (CP-REL* domswords 77)
	\78: (CP-REL* domswords 78)
	\79: (CP-REL* domswords 79)
	\80: (CP-REL* domswords 80)
	\81: (CP-REL* domswords 81)
	\82: (CP-REL* domswords 82)
	\83: (CP-REL* domswords 83)
	\84: (CP-REL* domswords 84)
	\85: (CP-REL* domswords 85)
	\86: (CP-REL* domswords 86)
	\87: (CP-REL* domswords 87)
	\88: (CP-REL* domswords 88)
	\89: (CP-REL* domswords 89)
	\90: (CP-REL* domswords 90)
	\91: (CP-REL* domswords 91)
	\92: (CP-REL* domswords 92)
	\93: (CP-REL* domswords 93)
	\94: (CP-REL* domswords 94)
	\95: (CP-REL* domswords 95)
	\96: (CP-REL* domswords 96)
	\97: (CP-REL* domswords 97)
	\98: (CP-REL* domswords 98)
	\99: (CP-REL* domswords 99)
	\100: (CP-REL* domswords> 99)
	z: ELSE
}
*/

// time period
6: {
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
