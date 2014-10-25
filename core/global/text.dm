
//**************************************************************
// Text Processing
//**************************************************************

// Output //////////////////////////////////////////////////////

/proc/list2bullets(list/L,bullet="*")
	for(var/entry in L)
		. += "\t[bullet] [L[entry] ? ": L[entry]" :]\n"
	return copytext(.,1,length(.))

/proc/date2text(day,month,year,format="en")
	switch(format)
		if("en")	. = "[months[month]] [day], [year]"
		if("eu")	. = "[day] [months[month]], [year]"
		if("enNum")	. = "[day].[month].[year]"
		if("euNum") . = "[month]/[day]/[year]"
	return

// Searching ///////////////////////////////////////////////////

/proc/findTextPos(strToSearch,strToFind)
	var/strToSearchLen = length(strToSearch)
	var/strToFindLen = length(strToFind)
	for(.=1,.<=strToSearchLen,.++)
		if(copytext(strToSearch,.,.+strToFindLen) == strToFind)
			return
	return FALSE

// Sanitization ////////////////////////////////////////////////

/proc/sanitize(strIn)
	. = stripAsciiExtended(strIn)
	. = stripAsciiControl(.)
	return 
	
// Stripping ///////////////////////////////////////////////////
// o yeah bb

/proc/stripBadChar(strIn,badChar)
	var/strLen = length(strIn)
	var/strOut = ""
	for(var/i=1,i<=strLen,i++)
		. = copytext(strIn,i,i+1)
		if(. != badChar) strOut += .
	return strOut

/proc/stripBadChars(strIn) //variable args
	var/strLen = length(strIn)
	var/strOut = ""
	var/list/badChars = args - strIn
	for(var/i=1,i<=strLen,i++)
		. = copytext(strIn,i,i+1)
		if(!(. in badChars)) strOut += .
	return strOut

/proc/stripBadString(strIn,strBad,loose)
	var/strInLen = length(strIn)
	var/strBadLen = length(strBad)
	var/strOut = ""
	for(var/pos=1,pos<=strInLen,pos++)
		. = copytext(strIn,pos,pos+strBadLen)
		if((. == strBad) || (loose && cmptext(.,strBad)))
			pos += (strBadLen - 1)
		else strOut += copytext(strIn,pos,pos+1)
	return strOut
	
/proc/stripBadStrings(str,loose) //variable args
	var/strLen = length(str)
	var/strOut = ""
	var/badLen
	var/badLenNum
	var/list/badString
	var/list/badStrings = list()
	var/list/badStringsFound = list()
	for(. in (args-str-loose))
		badLen = "[length(.)]"
		if(!badLen in badStrings)
			badStrings += badLen
			badStrings[badLen] = list()
		badStrings[badLen] += .
	for(var/pos=1,pos<=strLen,pos++)
		for(badLen in badStrings)
			badLenNum = text2num(badLen)
			. = copytext(str,pos,pos+badLenNum)
			if(. in badStrings[badLen]) badStringsFound += .
			else if(loose)
				for(badString in badStrings[badLen])
					if(cmptext(.,badString))
						badStringsFound += .
						break
		if(badStringsFound.len)
			pos += (length(max(arglist(badStringsFound))) - 1)
		else strOut += copytext(str,pos,pos+1)
		badStringsFound.len = 0
	return strOut

/proc/stripWhitespace(strIn)
	return stripBadChars(strIn," ","\t","\n")

/proc/stripNewlines(strIn)
	return stripBadChar(strIn,"\n")
	
/proc/stripTabs(strIn)
	return stripBadChar(strIn,"\t")

/proc/stripAsciiControl(strIn)
	. = ""
	var/strInLen = length(strIn)
	for(var/i=1,i<=strInLen,i++)
		switch(text2ascii(strIn,i))
			if(0 to 8)		continue
			if(11 to 31)	continue
			if(127)			continue
			else			. += copytext(strIn,i,i+1)
	return

/proc/stripAsciiExtended(strIn)
	. = ""
	var/strInLen = length(strIn)
	for(var/i=1,i<=strInLen,i++)
		if(text2ascii(strIn,i) <= 127)
			. += copytext(strIn,i,i+1)
	return

// Splitting ///////////////////////////////////////////////////

/proc/splitString(strIn,strSplit)
	. = findTextPos(strIn,strSplit)
	if(.)	return list(copytext(strIn,1,.),copytext(strIn,.+length(strSplit)))
	else	return FALSE
