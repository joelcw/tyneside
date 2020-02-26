//Modified query for cprel extraposition in the PCEEC corpus, based on original query by AKIngason

//CAVEAT: Simplified query, to create output for cprelExtrapos.pceec.c and relevant.q. See runstudyPCEEC.sh

node: IP*
define: /Users/yoelw/CurrentLx/OldNorse/verbtopic.def
coding_query:


// 1: extraposed
// 0: in situ
// there is an additional condition to exclude copular clauses because of the diffiuclty of identifying subjects
1: {
	\1: (IP* idoms NP-SBJ*|NP-NOM*|object)
    AND (IP* idoms V*|D*)
           AND (NP-SBJ*|NP-NOM*|object idoms CP-REL*)
 	   AND (CP-REL* iDomsViaTrace \*ICH* IP-SUB*) 
	\0: (IP* idoms NP-SBJ*|NP-NOM*|object)
           AND (NP-SBJ*|NP-NOM*|object idoms CP-REL*)
 	   AND (CP-REL* idoms IP-SUB*)
    AND (IP* idoms V*|D*)
	z: ELSE
}

// SBJ vs OBJ; Note that PP should be included ideally, both here and in the 0 1 coding above, but I have commented it out below to simplify the pilot study.
2: {	
	sbj: (IP* idoms NP-SBJ*|NP-NOM*)
           AND (NP-SBJ*|NP-NOM* idoms CP-REL*)
	obj: (IP* idoms object)
       	   AND (object idoms CP-REL*)
    //        pp: (IP* idoms PP*)
    //    AND (PP* idoms NP) AND (NP idoms CP-REL*)
        z: ELSE
}

// MAT vs SUB
3: {
	mat: (IP-MAT* idoms NP-SBJ*|NP-NOM*|object)
           AND (NP-SBJ*|NP-NOM*|object idoms CP-REL*)	
	sub: (IP-SUB* idoms NP-SBJ*|NP-NOM*|object)
           AND (NP-SBJ*|NP-NOM*|object idoms CP-REL*)	
	z: ELSE
}

4: {
	spch: (IP-*-SPE* idoms NP-SBJ*|NP-NOM*|object)
	    AND (NP-SBJ*|NP-NOM*|object idoms CP-REL*)	
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
