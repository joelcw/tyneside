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


// first line sets aside translations and archaic texts
      \0:  (AUTHNEW*|AUTHOLD*|BOETHEL*|ERV-*|NEWCOME-*|PURVER-*|TYNDNEW*|TYNDOLD*|CMAYEN*|CMBRUT3*|CMLAMB* inID)


//Rough time periods for YCOE texts (Old English)

    \800:  (codocu1* inID)
    \850: (codocu2*|cobede*|coboeth*|cocura*|colaece*|colawaf*|colawafint*|coorosiu*|coprefcura* inID)
      \950:  (coalex*|coblick*|cochad*|cochronA*|codocu3*|codocu4*|cogregdC*|cogregdH*|colacnu*|comart3*|comarvel*|coquadru* inID)
    \1000:  (coaelhom*|coaelive*|coapollo*|cobenrul*|cobyrhtf*|cocathom1*|cocathom2*|codocu3*|coepigen*|colaw1cn*|colaw2cn*|colaw5atr*|colaw6atr*|colawnorthu*|colsigef*|colwstan1*|colwstan2*|cootest*|coprefcath1*|coprefcath2*|coprefgen*|copreflives*|cotempo*|cowsgosp* inID)
    \1050:  (coadrian*|cochronE*|codicts*|coinspolD*|colawger*|colsigewZ*|colwsigeXa*|comargaC*|cowulf* inID) 
    \1100: (colawwllad*|coleofri*|cosolsat1* inID)


//Rough time periods for PPCME2 texts (Middle English)

    \1200:  (*-M*1,* inID)
    \1300:  (*-M2*,* inID)
    \1390:  (*-M3,* inID)
    \1450:  (*-M*4,* inID)

//More precise dates for PPCEME and PPCMBE texts (Early Modern and Modern British English up to 1910)

    \1500: (*1500* inID)
    \1510: (*1510* inID)
    \1520: (*1520* inID)
    \1530: (*1530* inID)
    \1540: (*1540* inID)
    \1550: (*1550* inID)
    \1560: (*1560* inID)
\1570: (*1570* inID)
\1580: (*1580* inID)
\1590: (*1590* inID)
\1600: (*1600* inID)
\1620: (*1620* inID)
\1630: (*1630* inID)
\1640: (*1640* inID)
\1650: (*1650* inID)
\1660: (*1660* inID)
\1670: (*1670* inID)
\1680: (*1680* inID)
\1690: (*1690* inID)
\1700: (*1700* inID)
\1707: (*1707* inID)
\1710: (*1710* inID)
\1711: (*1711* inID)
\1712: (*1712* inID)
\1716: (*1716* inID)
\1718: (*1718* inID)
\1719: (*1719* inID)
\1726: (*1726* inID)
\1736: (*1736* inID)
\1740: (*1740* inID)
\1742: (*1742* inID)
\1743: (*1743* inID)
\1744: (*1744* inID)
\1745: (*1745* inID)
\1746: (*1746* inID)
\1747: (*1747* inID)
\1749: (*1749* inID)
\1753: (*1753* inID)
\1762: (*1762* inID)
\1763: (*1763* inID)
\1764: (*1764* inID)
\1769: (*1769* inID)
\1773: (*1773* inID)
\1774: (*1774* inID)
\1775: (*1775* inID)
\1776: (*1776* inID)
\1777: (*1777* inID)
\1780: (*1780* inID)
\1785: (*1785* inID)
\1793: (*1793* inID)
\1796: (*1796* inID)
\1797: (*1797* inID)
\1799: (*1799* inID)
\1800: (*1800* inID)
\1805: (*1805* inID)
\1806: (*1806* inID)
\1807: (*1807* inID)
\1808: (*1808* inID)
\1813: (*1813* inID)
\1814: (*1814* inID)
\1815: (*1815* inID)
\1817: (*1817* inID)
\1826: (*1826* inID)
\1830: (*1830* inID)
\1835: (*1835* inID)
\1836: (*1836* inID)
\1837: (*1837* inID)
\1859: (*1859* inID)
\1861: (*1861* inID)
\1863: (*1863* inID)
\1865: (*1865* inID)
\1866: (*1866* inID)
\1873: (*1873* inID)
\1876: (*1876* inID)
\1878: (*1878* inID)
\1881: (*1881* inID)
\1882: (*1882* inID)
\1885: (*1885* inID)
\1886: (*1886* inID)
\1890: (*1890* inID)
\1895: (*1895* inID)
\1897: (*1897* inID)
\1900: (*1900* inID)
\1901: (*1901* inID)
\1905: (*1905* inID)
\1908: (*1908* inID)
\1913: (*1913* inID)


//The approximate years below are only there in case some texts are not caught by the above years, e.g. 174X.

      \1535:  (*-E1-* inID)
      \1605:  (*-E2-* inID)
      \1675:  (*-E3-* inID)

// plain "*" after square brackets doesn't work as intended,
// so use the more explicit ".*"
    \1725:  (*-17[01234].* inID)
    \1775:  (*-17[56789].* inID)
    \1825:  (*-18[01234].* inID)
    \1875:  (*-18[56789].* inID)
    \1910:  (*-19[01].* inID)
      z:  ELSE
}

