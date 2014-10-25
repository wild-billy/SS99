
//**************************************************************
// Various Mob Transfers
//**************************************************************

/mob/proc/loadPlayer(ckeyNew)
	if(ckeyNew)
		if(src.ckey) src.ejectPlayer()
		src.ckey = ckeyNew
	else ckeyNew = src.ckey
	return

/mob/proc/ejectPlayer(mob/target)
	if(src.client)
		if(target)	src.client.mob = target
		else		.(new world.mob)
	return
