node: CP-QUE*
add_to_ignore: \**
coding_query:


// Codes 1 for "whether" and 0 for "if" introducing an embedded question

//Note that the different possible spelling forms for all periods of English need to be taken into account.

1: {
    \0: ((CP-QUE* idoms C) AND (C idoms *i*f*|*e*f*|*I*f*|*E*f*|*I*F*|*E*F*|*y*f*|*Y*f*|*Y*F*) AND (CP-QUE* idoms !WQ))
OR 
((CP-QUE* idoms C) AND (CP-QUE* idoms WQ) AND (WQ idoms *i*f*|*e*f*|*I*f*|*E*f*|*I*F*|*E*F*|*y*f*|*Y*f*|*Y*F*))

    \1: (CP-QUE* idoms C) AND (CP-QUE* idoms WQ) AND (WQ idoms *w*|*h*|*W*|*H*)

    z: ELSE
   }




// whether or not there is a disjunction anywhere in the clause

//Note that spelling variation for "or" in different periods of English needs to be taken into account.

2: {
    disj: ((CP-QUE* idoms IP-SUB*) AND (CP-QUE* idoms C) AND (IP-SUB* idoms CONJP*) AND (CONJP* idoms CONJ) AND (CONJ idoms *o*r*|*o*t*|*O*r*|*O*t*|*O*R*|*O*T*|*o*d*e|*O*d*e|*O*D*E|*a*r*|*a*t*r|*A*r*|*A*t*r|*a*d*r|*A*d*r|*A*D*R|*A*R*|*a*t*e|*A*t*e|+te|+de))
OR
    ((CP-QUE* idoms IP-SUB*) AND (CP-QUE* idoms C) AND (IP-SUB* idomsmod CP-THT*|IP* .*) AND (.* idomsmod CONJP*|NP*|PP* CONJ) AND (CONJ idoms *o*r*|*o*t*|*O*r*|*O*t*|*O*R*|*O*T*|*o*d*e|*O*d*e|*O*D*E|*a*r*|*a*t*r|*A*r*|*A*t*r|*a*d*r|*A*d*r|*A*D*R|*A*R*|*a*t*e|*A*t*e|+te|+de))

    simple: (CP-QUE* idoms IP-SUB*) AND (CP-QUE* idoms C)

    z: ELSE
}




// time period

3: {

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

// plain "*" after square brackets doesn't work as intended,
// so use the more explicit ".*"
    \1725:  (*-17[01234].* inID)
    \1775:  (*-17[56789].* inID)
    \1825:  (*-18[01234].* inID)
    \1875:  (*-18[56789].* inID)
    \1910:  (*-19[01].* inID)
      z:  ELSE
   }
