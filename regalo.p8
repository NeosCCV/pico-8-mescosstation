pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
--
poke(0x5f00+92,255)
--
---------------------------------------------------------------------------------
function _init()
	ismescocute=1
	introdone=0
	startgame=0
	map(0, 0, 0, 0, 32, 32)

	--
	planet1frame={16,17,18,19,20,21,22,23}
	planet1={}
	planet1.step=0
	planet1frametrg=1
	planet2frame={24,25,26,27,28,29,30,31}
	planet2={}
	planet2.step=0
	planet2frametrg=1
	planet3frame={32,33,34,35,36,37,38,39}
	planet3={}
	planet3.step=0	
	planet3frametrg=1
	planet4frame={40,41,42,43,44,45,46,47}
	planet4={}
	planet4.step=0	
	planet4frametrg=1
	planet5frame={48,49,50,51,52,53,54,55}
	planet5={}
	planet5.step=0
	planet5frametrg=1
	platformframe={1,2,3,4}
	platform={}
	platform.step=0
	platformframetrg=1
	--
	arrowlframe={56,57}
	arrowl={}
	arrowl.step=0
	arrowlframetrg=1
	arrowrframe={58,59}
	arrowr={}
	arrowr.step=0
	arrowrframetrg=1
	arrowuframe={60,61}
	arrowu={}
	arrowu.step=0
	arrowuframetrg=1
	arrowdframe={62,63}
	arrowd={}
	arrowd.step=0
	arrowdframetrg=1
	letterzframe={12,13}
	letterz={}
	letterz.step=0
	letterzframetrg=1
	letterxframe={14,15}
	letterx={}
	letterx.step=0
	letterxframetrg=1
	--
	bhframe={116,117,118,119,118,117}
	bh={}
	bh.step=0
	bhframetrg=1
	--
	upgrades11frame={64,76}
	upgrades11={}
	upgrades11.step=0
	upgrades11frametrg=1
	upgrades12frame={65,77}
	upgrades12={}
	upgrades12.step=0
	upgrades12frametrg=1
	upgrades13frame={66,78}
	upgrades13={}
	upgrades13.step=0
	upgrades13frametrg=1
	upgrades14frame={67,79}
	upgrades14={}
	upgrades14.step=0
	upgrades14frametrg=1
	--
	upgrades21frame={80,92}
	upgrades21={}
	upgrades21.step=0
	upgrades21frametrg=1
	upgrades22frame={81,93}
	upgrades22={}
	upgrades22.step=0
	upgrades22frametrg=1
	upgrades23frame={82,94}
	upgrades23={}
	upgrades23.step=0
	upgrades23frametrg=1
	upgrades24frame={83,95}
	upgrades24={}
	upgrades24.step=0
	upgrades24frametrg=1
	--
	upgrades31frame={96,108}
	upgrades31={}
	upgrades31.step=0
	upgrades31frametrg=1
	upgrades32frame={97,109}
	upgrades32={}
	upgrades32.step=0
	upgrades32frametrg=1
	upgrades33frame={98,110}
	upgrades33={}
	upgrades33.step=0
	upgrades33frametrg=1
	upgrades34frame={99,111}
	upgrades34={}
	upgrades34.step=0
	upgrades34frametrg=1
	--
	upgrades41frame={112,124}
	upgrades41={}
	upgrades41.step=0
	upgrades41frametrg=1
	upgrades42frame={113,125}
	upgrades42={}
	upgrades42.step=0
	upgrades42frametrg=1
	upgrades43frame={114,126}
	upgrades43={}
	upgrades43.step=0
	upgrades43frametrg=1
	upgrades44frame={115,127}
	upgrades44={}
	upgrades44.step=0
	upgrades44frametrg=1
	--
	upgradesironframe={73,89}
	upgradesiron={}
	upgradesiron.step=0
	upgradesironframetrg=1
	upgradesgoldframe={72,88}
	upgradesgold={}
	upgradesgold.step=0
	upgradesgoldframetrg=1
	--
	star1frame={128,129}
	star1={}
	star1.step=0
	star1frametrg=1
	star2frame={144,145}
	star2={}
	star2.step=0
	star2frametrg=1


	--
	mappos={25,33,59,33,93,33,25,67,59,67,93,67,25,101,59,101,93,101}
	randompostrigger=0
	--
	playerpos=0
	playerx=0
	playery=0
	onplanet=0
	--
	planettext={"GAS GIANT","WATERY PLANET","EARTH-LIKE PLANET BUT UGLY","THE MOON?","MESCO'S STATION","LAVA PLANET (HOT)","BROKEN PLANET","GOLD ASTEROID","IRON ASTEROID"}
	planetmoreinfo={"KINDA BIG","IUGH WET","LETS MEDITATE ABOUT OUR CHOICES","LMAO THIS AIN'T THE MOON","HOME SWEET HOME","AS HOT AS U","AS BROKEN AS ME","WANNA MAKE SOME APPLES?","COOL IRON"}
	--
	activeturn=1
	maxabletomove=1
	abletomove=maxabletomove
	moves=0
	firsttime=1
	zstuff=0
	coolasstimer=0
	--
	o2=6
	maxo2=6
	gold=0
	maxgold=5
	iron=0
	maxiron=5
	---------------------------------------------------------------
	money=10000
	allmymoneycounter=money
	---------------------------------------------------------------
	--
	turnstaken=0
	--
	onupgradescreen=0
	introtriggerupgrade=0
	--
	deadof=0
	--
	upgradespace=0
	upgradeo2=0
	upgrademove=0	
	pricemult=1		--the 6th upgrade
	--
	goldprice=2
	ironprice=1
	--
	o2animgettrigger=0
	o2animlosetrigger=0
	irongettrigger=0
	goldgettrigger=0
	--
	upgradepos=1
	upgradeposy=20
	--
	loseanimtimer=0
	winanimtimer=0
	--
	timerstarmaprnd1=0
	timerstarmaprnd2=0
	--
	firstdeathframe=1
	--
	wintimeruwu=0
	--
	antizbugtimer=0
end
---------------------------------------------------------------------------------
function animations()
	planet1.step+=1
 	if(planet1.step%45==0) planet1frametrg+=1
 	if(planet1frametrg>8) planet1frametrg=1
	planet2.step+=1
 	if(planet2.step%25==0) planet2frametrg+=1
 	if(planet2frametrg>8) planet2frametrg=1
	planet3.step+=1
 	if(planet3.step%10==0) planet3frametrg+=1
 	if(planet3frametrg>8) planet3frametrg=1
	planet4.step+=1
 	if(planet4.step%2==0) planet4frametrg+=1
 	if(planet4frametrg>8) planet4frametrg=1
	planet5.step+=1 --------------------------------------PLANET5 ES AHORA PLANET6 MACHO SOY SUBNORMAL :))))))
 	if(planet5.step%32==0) planet5frametrg+=1
 	if(planet5frametrg>8) planet5frametrg=1
	--
	platform.step+=1
 	if(platform.step%3==0) platformframetrg+=1
 	if(platformframetrg>4) platformframetrg=1
	--
	arrowl.step+=1
 	if(arrowl.step%8==0) arrowlframetrg+=1
 	if(arrowlframetrg>2) arrowlframetrg=1
	arrowr.step+=1
 	if(arrowr.step%8==0) arrowrframetrg+=1
 	if(arrowrframetrg>2) arrowrframetrg=1
	arrowu.step+=1
 	if(arrowu.step%8==0) arrowuframetrg+=1
 	if(arrowuframetrg>2) arrowuframetrg=1
	arrowd.step+=1
 	if(arrowd.step%8==0) arrowdframetrg+=1
 	if(arrowdframetrg>2) arrowdframetrg=1
	--
	letterz.step+=1
 	if(letterz.step%8==0) letterzframetrg+=1
 	if(letterzframetrg>2) letterzframetrg=1
	letterx.step+=1
 	if(letterx.step%8==0) letterxframetrg+=1
 	if(letterxframetrg>2) letterxframetrg=1
	--
	bh.step+=1
	if(bh.step%4==0) bhframetrg+=1
 	if(bhframetrg>6) bhframetrg=1
	--
	upgrades11.step+=1
	if(upgrades11.step%8==0) upgrades11frametrg+=1
 	if(upgrades11frametrg>2) upgrades11frametrg=1
	upgrades12.step+=1
	if(upgrades12.step%8==0) upgrades12frametrg+=1
 	if(upgrades12frametrg>2) upgrades12frametrg=1
	upgrades13.step+=1
	if(upgrades13.step%8==0) upgrades13frametrg+=1
 	if(upgrades13frametrg>2) upgrades13frametrg=1
	upgrades14.step+=1
	if(upgrades14.step%8==0) upgrades14frametrg+=1
 	if(upgrades14frametrg>2) upgrades14frametrg=1
	--
	upgrades21.step+=1
	if(upgrades21.step%8==0) upgrades21frametrg+=1
 	if(upgrades21frametrg>2) upgrades21frametrg=1
	upgrades22.step+=1
	if(upgrades22.step%8==0) upgrades22frametrg+=1
 	if(upgrades22frametrg>2) upgrades22frametrg=1
	upgrades23.step+=1
	if(upgrades23.step%8==0) upgrades23frametrg+=1
 	if(upgrades23frametrg>2) upgrades23frametrg=1
	upgrades24.step+=1
	if(upgrades24.step%8==0) upgrades24frametrg+=1
 	if(upgrades24frametrg>2) upgrades24frametrg=1
	--
	upgrades31.step+=1
	if(upgrades31.step%8==0) upgrades31frametrg+=1
 	if(upgrades31frametrg>2) upgrades31frametrg=1
	upgrades32.step+=1
	if(upgrades32.step%8==0) upgrades32frametrg+=1
 	if(upgrades32frametrg>2) upgrades32frametrg=1
	upgrades33.step+=1
	if(upgrades33.step%8==0) upgrades33frametrg+=1
 	if(upgrades33frametrg>2) upgrades33frametrg=1
	upgrades34.step+=1
	if(upgrades34.step%8==0) upgrades34frametrg+=1
 	if(upgrades34frametrg>2) upgrades34frametrg=1
	--
	upgrades41.step+=1
	if(upgrades41.step%8==0) upgrades41frametrg+=1
 	if(upgrades41frametrg>2) upgrades41frametrg=1
	upgrades42.step+=1
	if(upgrades42.step%8==0) upgrades42frametrg+=1
 	if(upgrades42frametrg>2) upgrades42frametrg=1
	upgrades43.step+=1
	if(upgrades43.step%8==0) upgrades43frametrg+=1
 	if(upgrades43frametrg>2) upgrades43frametrg=1
	upgrades44.step+=1
	if(upgrades44.step%8==0) upgrades44frametrg+=1
 	if(upgrades44frametrg>2) upgrades44frametrg=1
	--
	upgradesiron.step+=1
	if(upgradesiron.step%8==0) upgradesironframetrg+=1
 	if(upgradesironframetrg>2) upgradesironframetrg=1
	upgradesgold.step+=1
	if(upgradesgold.step%8==0) upgradesgoldframetrg+=1
 	if(upgradesgoldframetrg>2) upgradesgoldframetrg=1
	--
	star1.step+=1
	if(star1.step%5==0) star1frametrg+=1
 	if(star1frametrg>2) star1frametrg=1
	star2.step+=1
	if(star2.step%9==0) star2frametrg+=1
 	if(star2frametrg>2) star2frametrg=1
	--
end
--

--

function planetstuff()
	spr((planet1frame[planet1frametrg]),mappos[(planet1val*2)-1],mappos[(planet1val*2)])	--GAS PLANET
	spr((planet2frame[planet2frametrg]),mappos[(planet2val*2)-1],mappos[(planet2val*2)])	--WATERY ONE
	spr((planet3frame[planet3frametrg]),mappos[(planet3val*2)-1],mappos[(planet3val*2)])	--EARTH LIKE ONE
	spr((planet4frame[planet4frametrg]),mappos[(planet4val*2)-1],mappos[(planet4val*2)])	--MOON LIKE ONE
	spr((platformframe[platformframetrg]),mappos[(planet5val*2)-1],mappos[(planet5val*2)])	--STATION
	spr((planet5frame[planet5frametrg]),mappos[(planet6val*2)-1],mappos[(planet6val*2)])	--LAVA PLANET
	spr((5),mappos[(planet7val*2)-1],mappos[(planet7val*2)])								--BROKEN PLANET
	spr((6),mappos[(planet8val*2)-1],mappos[(planet8val*2)])								--GOLDEN ASTEROID
	spr((7),mappos[(planet9val*2)-1],mappos[(planet9val*2)])								--IRON ASTEROID
end
--
--
function randompos()
	repeat
	planet1val=(flr(rnd(9)))+1
	until not (planet1val==5)
	repeat
		planet2val=(flr(rnd(9)))+1
	until not (planet1val==planet2val or planet2val==5)
	repeat
		planet3val=(flr(rnd(9)))+1
	until not (planet1val==planet3val or planet2val==planet3val or planet3val==5)
	repeat
		planet4val=(flr(rnd(9)))+1
	until not (planet1val==planet4val or planet2val==planet4val or planet3val==planet4val or planet4val==5)
	planet5val=5
	repeat
		planet6val=(flr(rnd(9)))+1
	until not (planet1val==planet6val or planet2val==planet6val or planet3val==planet6val or planet4val==planet6val or planet6val==5)
	repeat
		planet7val=(flr(rnd(9)))+1
	until not (planet1val==planet7val or planet2val==planet7val or planet3val==planet7val or planet4val==planet7val or planet6val==planet7val or planet7val==5)
	repeat
		planet8val=(flr(rnd(9)))+1
	until not (planet1val==planet8val or planet2val==planet8val or planet3val==planet8val or planet4val==planet8val or planet6val==planet8val or planet7val==planet8val or planet8val==5)
	repeat
		planet9val=(flr(rnd(9)))+1
	until not (planet1val==planet9val or planet2val==planet9val or planet3val==planet9val or planet4val==planet9val or planet6val==planet9val or planet7val==planet9val or planet8val==planet9val or planet9val==5)
	--

end
--
function playerpositions()
	--1
	if playerpos==1 then
		spr(0,25,25)
		playerx=25
		playery=25
	end
	--2
	if playerpos==2 then
		spr(0,59,25)
		playerx=59
		playery=25
	end
	--3
	if playerpos==3 then
		spr(0,93,25)
		playerx=93
		playery=25
	end
	--4
	if playerpos==4 then
		spr(0,25,59)
		playerx=25
		playery=59
	end
	--5
	if playerpos==5 then
		spr(0,59,59)
		playerx=59
		playery=59
	end
	--6
	if playerpos==6 then
		spr(0,93,59)
		playerx=93
		playery=59
	end
	--7
	if playerpos==7 then
		spr(0,25,93)
		playerx=25
		playery=93
	end
	--8
	if playerpos==8 then
		spr(0,59,93)
		playerx=59
		playery=93
	end
	--9
	if playerpos==9 then
		spr(0,93,93)
		playerx=93
		playery=93
	end
end
--
function tooltip()
	--tooltip text bout where u at (also allows the use of zstuffs)
	if playerpos==planet1val then
		print (planettext[1],0,0,7)
		print (planetmoreinfo[1],0,6,7)
		onplanet=1
	end
	if playerpos==planet2val then
		print (planettext[2],0,0,7)
		print (planetmoreinfo[2],0,6,7)
		onplanet=2
	end
	if playerpos==planet3val then
		print (planettext[3],0,0,7)
		print (planetmoreinfo[3],0,6,7)
		onplanet=3
	end
	if playerpos==planet4val then
		print (planettext[4],0,0,7)
		print (planetmoreinfo[4],0,6,7)
		onplanet=4
	end
	if playerpos==planet5val then
		print (planettext[5],0,0,7)
		print (planetmoreinfo[5],0,6,7)
		onplanet=5
	end
	if playerpos==planet6val then
		print (planettext[6],0,0,7)
		print (planetmoreinfo[6],0,6,7)
		onplanet=6
	end
	if playerpos==planet7val then
		print (planettext[7],0,0,7)
		print (planetmoreinfo[7],0,6,7)
		onplanet=7
	end
	if playerpos==planet8val then
		print (planettext[8],0,0,7)
		print (planetmoreinfo[8],0,6,7)
		onplanet=8
		ablezstuff=1
	end
	if playerpos==planet9val then
		print (planettext[9],0,0,7)
		print (planetmoreinfo[9],0,6,7)
		onplanet=9
		ablezstuff=1
	end
end
--
function playermovement()
	if not (btnp(4) and playerpos==5) then
		if abletomove>0 then
			if (btn(0)) and not ((btn(1)) or (btn(2)) or (btn(3)) or onupgradescreen==1 or (btnp(4))) then
				if not (playerpos==1 or playerpos==4 or playerpos==7) then
					spr((arrowlframe[arrowlframetrg]),playerx-8,playery)
					spr((letterxframe[letterxframetrg]),playerx-8,playery-8)
					if btnp(5) then
						playerpos-=1
						abletomove-=1
						firsttime=0
						turnstaken+=1
						sfx(0)
					end
				end
			end
			if (btn(1)) and not ((btn(0)) or (btn(2)) or (btn(3)) or onupgradescreen==1 or (btnp(4))) then
				if not (playerpos==3 or playerpos==6 or playerpos==9) then
					spr((arrowrframe[arrowrframetrg]),playerx+8,playery)
					spr((letterxframe[letterxframetrg]),playerx+8,playery-8)
					if btnp(5) then
						playerpos+=1
						abletomove-=1
						firsttime=0
						turnstaken+=1
						sfx(0)
					end
				end
			end
			if (btn(2)) and not ((btn(0)) or (btn(1)) or (btn(3)) or onupgradescreen==1 or (btnp(4))) then
				if not (playerpos==1 or playerpos==2 or playerpos==3) then
					spr((arrowuframe[arrowuframetrg]),playerx,playery-8)
					spr((letterxframe[letterxframetrg]),playerx-8,playery-8)
					if btnp(5) then
						playerpos-=3
						abletomove-=1
						firsttime=0
						turnstaken+=1
						sfx(0)
					end
				end
			end
			if (btn(3)) and not ((btn(0)) or (btn(1)) or (btn(2)) or onupgradescreen==1 or (btnp(4))) then
				if not (playerpos==7 or playerpos==8 or playerpos==9) then
					spr((arrowdframe[arrowdframetrg]),playerx,playery+18)
					spr((letterxframe[letterxframetrg]),playerx-8,playery+18)
					if btnp(5) then
						playerpos+=3
						abletomove-=1
						firsttime=0
						turnstaken+=1
						sfx(0)
					end
				end
			end
		end
	end
end
--


function turnpass()
	if not (((btn(0)) or (btn(1)) or (btn(2)) or (btn(3))) and abletomove>0) then
		if firsttime==0 and not (abletomove==maxabletomove) then
			spr((letterxframe[letterzframetrg]),playerx+8,playery+8)
		end
		if ablezstuff==1 then
			if (onplanet==5 or onplanet==8 or onplanet==9) and abletomove>0 then
				spr((letterzframe[letterzframetrg]),playerx-8,playery+8)
			end
		end
	end

	if (btnp(5)) and not ((btn(0)) or (btn(1)) or (btn(2)) or (btn(3)) or (btn(4))) and (not (abletomove==maxabletomove)) or (onplanet==5 and o2<maxo2) then
		if onplanet==5 then
			if firsttime==0 then
				abletomove=maxabletomove
				if o2<maxo2 then
					o2animgettrigger=1
					o2=maxo2
					turnstaken+=1
					sfx(2)
				end
			end
		end
		if onplanet==7 then
			--
			if abletomove<maxabletomove then
				abletomove+=1
			end
			o2-=2
			turnstaken+=1
			o2animlosetrigger=1
			sfx(5)
			--
		end
		if onplanet==3 then
			if abletomove<maxabletomove then
				abletomove+=1
			end
			if o2<maxo2 then
				o2animgettrigger=1
				o2+=1
				turnstaken+=1
				sfx(2)
			end

		end
		if onplanet==1 or onplanet==2 or onplanet==4 or onplanet==6 or onplanet==8 or onplanet==9 then
			--
			if abletomove<maxabletomove then
				abletomove+=1
			end
			o2-=1
			turnstaken+=1
			o2animlosetrigger=1
			sfx(4)
			--
		end
	end
	if btnp(4) and not ((btn(0)) or (btn(1)) or (btn(2)) or (btn(3)) or (btnp(5))) then
		if onplanet==8 then
			if gold<maxgold then
				if (abletomove>0) then
					gold+=1
					goldgettrigger=1
					--
					abletomove-=1
					o2-=1
					turnstaken+=1
					sfx(1)
				end
				--
			else
			end
		end
		if onplanet==9 then
			if iron<maxiron then
				if (abletomove>0) then
					iron+=1
					irongettrigger=1
					--
					abletomove-=1
					o2-=1
					turnstaken+=1
					sfx(3)
				end
				--
			else
			end
		end
		
	end
end
--
function hud()
	--o2
	spr(8,1,119)
	print (o2,11,120,12)
	print ("/",19,120,12)
	print (maxo2,23,120,12)
	--gold
	spr(9,31,119)
	print (gold,39,120,10)
	print ("/",47,120,10)
	print (maxgold,51,120,10)
	--iron
	spr(10,67,119)
	print (iron,75,120,6)
	print ("/",83,120,6)
	print (maxiron,87,120,6)
	--money
	spr(11,99,119)
	print (money,107,120,11)
	--abletomove
	if (abletomove==0) then
		spr(84,1,105)
	else
		if (maxabletomove==1) then
			spr(85,1,105)
		elseif (maxabletomove==2) then
			if (abletomove==2) then
				spr(85,1,105)
			else
				spr(100,1,105)
			end
		elseif (maxabletomove==3) then
			if (abletomove==3) then
				spr(85,1,105)
			elseif (abletomove==2) then
				spr(102,1,105)
			else
				spr(101,1,105)
			end
		elseif (maxabletomove==4) then
			if (abletomove==4) then
				spr(85,1,105)
			elseif (abletomove==3) then
				spr(105,1,105)
			elseif (abletomove==2) then
				spr(104,1,105)
			else
				spr(103,1,105)
			end
		end
	end
	--turns
	print(turnstaken,105,1,7)



	--tooltip help
	--z special actions
	--x move & slep

	if o2animgettrigger!=0 then
		o2animgettimer=o2animgettimer+1
		spr(68,playerx-8,playery-2-o2animgetydisp)
		if o2animgettimer>=5 and o2animgettimer<10 then
		o2animgetydisp=1
		elseif o2animgettimer>=10 and o2animgettimer<17 then
		o2animgetydisp=2
		elseif o2animgettimer>=17 and o2animgettimer<26 then
		o2animgetydisp=3
		elseif o2animgettimer>=26 and o2animgettimer<35 then
		o2animgetydisp=4
		elseif o2animgettimer>=35 and o2animgettimer<45 then
		o2animgetydisp=5
		end
		if o2animgettimer>=45 then
		o2animgettrigger=0
		end
	else
	o2animgettimer=0
	o2animgetydisp=0
	end

	if o2animlosetrigger!=0 then
		o2animlosetimer=o2animlosetimer+1
		spr(69,playerx-8,playery-7+o2animloseydisp)
		if o2animlosetimer>=5 and o2animlosetimer<10 then
		o2animloseydisp=1
		elseif o2animlosetimer>=10 and o2animlosetimer<17 then
		o2animloseydisp=2
		elseif o2animlosetimer>=17 and o2animlosetimer<26 then
		o2animloseydisp=3
		elseif o2animlosetimer>=26 and o2animlosetimer<35 then
		o2animloseydisp=4
		elseif o2animlosetimer>=35 and o2animlosetimer<45 then
		o2animloseydisp=5
		end
		if o2animlosetimer>=45 then
		o2animlosetrigger=0
		end
	else
	o2animlosetimer=0
	o2animloseydisp=0
	end

	if irongettrigger!=0 then
		irongettimer=irongettimer+1
		spr(71,playerx+8,playery-2-irongetydisp)
		if irongettimer>=5 and irongettimer<10 then
		irongetydisp=1
		elseif irongettimer>=10 and irongettimer<17 then
		irongetydisp=2
		elseif irongettimer>=17 and irongettimer<26 then
		irongetydisp=3
		elseif irongettimer>=26 and irongettimer<35 then
		irongetydisp=4
		elseif irongettimer>=35 and irongettimer<45 then
		irongetydisp=5
		end
		if irongettimer>=45 then
		irongettrigger=0
		end
	else
	irongettimer=0
	irongetydisp=0
	end

	if goldgettrigger!=0 then
		goldgettimer=goldgettimer+1
		spr(70,playerx+8,playery-2-goldgetydisp)
		if goldgettimer>=5 and goldgettimer<10 then
		goldgetydisp=1
		elseif goldgettimer>=10 and goldgettimer<17 then
		goldgetydisp=2
		elseif goldgettimer>=17 and goldgettimer<26 then
		goldgetydisp=3
		elseif goldgettimer>=26 and goldgettimer<35 then
		goldgetydisp=4
		elseif goldgettimer>=35 and goldgettimer<45 then
		goldgetydisp=5
		end
		if goldgettimer>=45 then
		goldgettrigger=0
		end
	else
	goldgettimer=0
	goldgetydisp=0
	end



end
--

function starmap()
	--print(timerstarmaprnd1,0,20,7)
	if timerstarmaprnd1>=60 then
		timerstarmaprnd1=0	
	else
		timerstarmaprnd1+=1
	end

	if timerstarmaprnd1==1 then
		starval01x=flr(rnd(128)) + 1 
		starval01y=flr(rnd(128)) + 1 
		starval02x=flr(rnd(128)) + 1 
		starval02y=flr(rnd(128)) + 1 
		starval03x=flr(rnd(128)) + 1 
		starval03y=flr(rnd(128)) + 1 
		starval04x=flr(rnd(128)) + 1 
		starval04y=flr(rnd(128)) + 1 
		starval05x=flr(rnd(128)) + 1 
		starval05y=flr(rnd(128)) + 1 
		starval06x=flr(rnd(128)) + 1 
		starval06y=flr(rnd(128)) + 1 
		starval07x=flr(rnd(128)) + 1 
		starval07y=flr(rnd(128)) + 1 
		starval08x=flr(rnd(128)) + 1 
		starval08y=flr(rnd(128)) + 1 
		starval09x=flr(rnd(128)) + 1 
		starval09y=flr(rnd(128)) + 1 
	end
	
	if timerstarmaprnd1>1 and timerstarmaprnd1<18 then
		spr(star1frame[star1frametrg],starval01x,starval01y)	
	end
	if timerstarmaprnd1>6 and timerstarmaprnd1<24 then
		spr(star1frame[star1frametrg],starval02x,starval02y)	
	end
	if timerstarmaprnd1>12 and timerstarmaprnd1<30 then
		spr(star1frame[star1frametrg],starval03x,starval03y)	
	end
	if timerstarmaprnd1>18 and timerstarmaprnd1<36 then
		spr(star1frame[star1frametrg],starval04x,starval04y)	
	end
	if timerstarmaprnd1>26 and timerstarmaprnd1<42 then
		spr(star1frame[star1frametrg],starval05x,starval05y)	
	end
	if timerstarmaprnd1>36 and timerstarmaprnd1<60 then
		spr(star1frame[star1frametrg],starval06x,starval06y)	
	end
	if timerstarmaprnd1>1 and timerstarmaprnd1<15 then
		spr(star2frame[star2frametrg],starval07x,starval07y)	
	end
	if timerstarmaprnd1>16 and timerstarmaprnd1<30 then
		spr(star2frame[star2frametrg],starval08x,starval08y)	
	end
	if timerstarmaprnd1>31 and timerstarmaprnd1<45 then
		spr(star2frame[star2frametrg],starval09x,starval09y)	
	end
	if timerstarmaprnd1>46 and timerstarmaprnd1<60 then
		spr(star2frame[star2frametrg],starval10x,starval10y)	
	end



end

--
function intro()
	cls()
	spr(0,59,59)
	print ("mesco's station",33,70)
	print ("PRESS z TO BEGIN",32,82)
	if (btnp(4)) then 
		introdone=1 
		startgame=1
		playerpos=5
	end
end
--
--
function upgradestation()
	if playerpos==5 and not (btnp(5) or btn(0) or btn(1) or btn(2) or btn(3)) and not (deadof!=0) then
		spr((letterzframe[letterzframetrg]),playerx-8,playery+8)

		if introtriggerupgrade==1 then
			if (btnp(4) and onupgradescreen==0) then
				coolasstimer=0
				onupgradescreen=1
				sfx(11)
				music(-1,300)
				music(2)
			end
		end
	end
end


function upgradescreenmovement()
	if btnp(2) then
		if upgradepos!=1 then
			upgradepos-=1
		end
	end
	if btnp(3) then
		if upgradepos!=7 then
			upgradepos+=1
		end
	end

	if upgradepos==1 then
		upgradeposy=15
	elseif upgradepos==2 then
		upgradeposy=30
	elseif upgradepos==3 then
		upgradeposy=45
	elseif upgradepos==4 then
		upgradeposy=60
	elseif upgradepos==5 then
		upgradeposy=75
	elseif upgradepos==6 then
		upgradeposy=90 	
	elseif upgradepos==7 then
		upgradeposy=105		--have to change these
	end
end

function upgradescreen()
	if onupgradescreen==1 then
	cls()
	hud()
	print("~~mesco's station~~",23,2,7)
	upgradescreenmovement()
	spr((letterzframe[letterzframetrg]),0,0)
	spr((arrowlframe[arrowlframetrg]),8,0)
	--print (coolasstimer)
		--create upgradepos
		--1 max o2
		--2 max items
		--3 max movement
		--4 sell iron
		--5 sell gold
		--6 improve ratio
		--7 buy warp and wixn
	spr(86,20,upgradeposy)
		--max o2
			if maxo2==6 then
				spr((upgrades12frame[upgrades12frametrg]),25,14)
				print ("PONGAMOS OTRA BOMBONA",35,12,7)
				print ("5$",35,18,11)
				if money>=5 then
					spr((letterxframe[letterzframetrg]),12,14)
				end
			end
			if maxo2==12 then
				spr((upgrades22frame[upgrades12frametrg]),25,14)
				print ("OTRA MAS VA >:3",35,12,7)
				print ("50$",35,18,11)
				if money>=50 then
					spr((letterxframe[letterzframetrg]),12,14)
				end
			end
			if maxo2==18 then
				spr((upgrades32frame[upgrades32frametrg]),25,14)
				print ("LA ULTIMA YA EH",35,12,7)
				print ("100$",35,18,11)
				if money>=100 then
					spr((letterxframe[letterzframetrg]),12,14)
				end
			end
			if maxo2==25 then
				spr((upgrades42frame[upgrades42frametrg]),25,14)
			end
		--max items
			if maxiron==5 then
				spr((upgrades11frame[upgrades11frametrg]),26,29)
				print ("OSTRAS, UNOS BOLSILLOS",35,27,7)
				print ("5$",35,33,11)
				if money>=5 then
					spr((letterxframe[letterzframetrg]),12,29)
				end
			end
			if maxiron==10 then
				spr((upgrades21frame[upgrades11frametrg]),26,29)
				print ("BOLSILLOS GIGANTES :O",35,27,7)
				print ("50$",35,33,11)
				if money>=50 then
					spr((letterxframe[letterzframetrg]),12,29)
				end
			end
			if maxiron==15 then
				spr((upgrades31frame[upgrades11frametrg]),26,29)
				print ("POCKETS AS DEEP AS u",35,27,7)
				print ("100$",35,33,11)
				if money>=100 then
					spr((letterxframe[letterzframetrg]),12,29)
				end
			end
			if maxiron==20 then
				spr((upgrades41frame[upgrades11frametrg]),26,29)
			end
		--max movement
			if maxabletomove==1 then
				spr((upgrades13frame[upgrades13frametrg]),26,45)
				print ("UN MONSTER O QUE >:o",35,43,7)
				print ("5$",35,49,11)
				if money>=5 then
					spr((letterxframe[letterzframetrg]),12,44)
				end
			end
			if maxabletomove==2 then
				spr((upgrades23frame[upgrades23frametrg]),26,45)
				print ("LETS GO POCOYO",35,43,7)
				print ("50$",35,49,11)
				if money>=50 then
					spr((letterxframe[letterzframetrg]),12,44)
				end
			end
			if maxabletomove==3 then
				spr((upgrades33frame[upgrades33frametrg]),26,45)
				print ("GOTTA GO FASTO",35,43,7)
				print ("100$",35,49,11)
				if money>=100 then
					spr((letterxframe[letterzframetrg]),12,44)
				end
			end
			if maxabletomove==4 then
				spr((upgrades43frame[upgrades43frametrg]),26,45)
			end
		--sell iron
			spr((upgradesironframe[upgradesironframetrg]),26,58)
			print ("VENDER IRON",35,57,7)
			if iron>0 then
				spr((letterxframe[letterzframetrg]),12,59)
				ironvalueinmoneys=iron*1*pricemult
				print("+"..ironvalueinmoneys.."$",35,63,11)
			end
		--sell gold
			spr((upgradesgoldframe[upgradesgoldframetrg]),26,73)
			print ("VENDER GOLD",35,72,7)
			if gold>0 then
				spr((letterxframe[letterzframetrg]),12,74)
				goldvalueinmoneys=gold*2*pricemult
				print("+"..goldvalueinmoneys.."$",35,78,11)
			end
		--improve ratio
			if pricemult==1 then
				spr((upgrades14frame[upgrades14frametrg]),26,89)
				print ("IMPROVE RATES",35,87,7)
				print ("50$",35,93,11)
				if money>=50 then
					spr((letterxframe[letterzframetrg]),12,89)
				end
			end
			if pricemult==2 then
				spr((upgrades24frame[upgrades24frametrg]),26,89)
				print ("USE BILL GATE'S CHIP",35,87,7)
				print ("100$",35,93,11)
				if money>=100 then
					spr((letterxframe[letterzframetrg]),12,89)
				end
			end
			if pricemult==3 then
				spr((upgrades34frame[upgrades34frametrg]),26,89)
				print ("ERIC TRUMP IS MY FRIEND",35,87,7)
				print ("500$",35,93,11)
				if money>=500 then
					spr((letterxframe[letterzframetrg]),12,89)
				end
			end
			if pricemult==4 then
				spr((upgrades44frame[upgrades44frametrg]),26,89)
			end
		--exit game
			spr((bhframe[bhframetrg]),26,104)
			print ("WARP TO camit",35,102,7)
			print ("1000$",35,108,11)
			if money>=1000 then
					spr((letterxframe[letterzframetrg]),12,104)
			end



		--triggers
		if btnp(5) then
			if upgradepos==1 then
				if maxo2==6 and money>=5 then
					maxo2=12
					money-=5
					o2=maxo2
					sfx(6)
				elseif maxo2==12 and money>=50 then
					maxo2=18
					money-=50
					o2=maxo2
					sfx(7)
				elseif maxo2==18 and money>=100 then
					maxo2=25
					money-=100
					o2=maxo2
					sfx(8)
				end
			end
			if upgradepos==2 then
				if maxiron==5 and money>=5 then
					maxiron=10
					maxgold=10
					money-=5
					sfx(6)
				elseif maxiron==10 and money>=50 then
					maxiron=15
					maxgold=15
					money-=50
					sfx(7)
				elseif maxiron==15 and money>=100 then
					maxiron=20
					maxgold=20
					money-=100
					sfx(8)
				end
			end
			if upgradepos==3 then
				if maxabletomove==1 and money>=5 then
					maxabletomove=2
					money-=5
					abletomove=maxabletomove
					sfx(6)
				elseif maxabletomove==2 and money>=50 then
					maxabletomove=3
					money-=50
					abletomove=maxabletomove
					sfx(7)
				elseif maxabletomove==3 and money>=100 then
					maxabletomove=4
					money-=100
					abletomove=maxabletomove
					sfx(8)
				end
			end
			if upgradepos==4 then
				money+=iron*pricemult
				allmymoneycounter+=iron*pricemult
				iron=0
				sfx(9)
			end
			if upgradepos==5 then
				money+=gold*pricemult*2
				allmymoneycounter+=gold*pricemult*2
				gold=0
				sfx(10)
			end
			if upgradepos==6 then
				if pricemult==1 and money>=50 then
					pricemult=2
					money-=50
					sfx(6)
				elseif pricemult==2 and money>=100 then
					pricemult=3
					money-=100
					sfx(7)
				elseif pricemult==3 and money>=500 then
					pricemult=4
					money-=500
					sfx(8)
				end
			end
			if upgradepos==7 then
				if money>=1000 then
					deadof=2
					--game_end()
					money-=1000
					music(-1)
				end
			end



		end
	end
	if coolasstimer!=0 then
		if btnp(4) then
		onupgradescreen=0
		upgradepos=1
		if onplanet==5 and deadof==0 then
		sfx(11)
		music(-1,300)
		music(0)
		end
		end
	end
end

function deathcauses()
	if o2<=0 then
		deadof=1
		startgame=0
	end

end

function loseanim()
	if firstdeathframe==1 then
		music(-1)
		firstdeathframe=0
		music(4)
	end
	spr(87,62,40)
	loseanimtimer+=1
	--print(loseanimtimer,0,0,7)
	if loseanimtimer%6==0 then
		ghostmesco=120
	else
		ghostmesco=121
	end
	if loseanimtimer<=20 then
		spr(ghostmesco,62,34)
	elseif loseanimtimer<=21 then
		spr(ghostmesco,62,33)
	elseif loseanimtimer<=22 then
		spr(ghostmesco,62,32)
	elseif loseanimtimer<=23 then
		spr(ghostmesco,62,30)
	elseif loseanimtimer<=25 then
		spr(ghostmesco,62,28)
	elseif loseanimtimer<=27 then
		spr(ghostmesco,62,26)
	elseif loseanimtimer<=30 then
		spr(ghostmesco,62,23)
	elseif loseanimtimer<=33 then
		spr(ghostmesco,62,17)
	elseif loseanimtimer<=36 then
		spr(ghostmesco,62,12)
	elseif loseanimtimer<=39 then
		spr(ghostmesco,62,8)
	elseif loseanimtimer<=42 then
		spr(ghostmesco,62,4)
	elseif loseanimtimer<=45 then
		spr(ghostmesco,62,0)
	end

	if loseanimtimer>=500 then
		loseanimtimer=100
	end
end

function winanim()
	if firstdeathframe==1 then
			music(-1)
			firstdeathframe=0
			music(5)
	end
		spr(130,62,45)
		spr(87,62,44)
	--	print(wintimeruwu,0,0,7)
	if wintimeruwu>60 then
		wintimeruwu=0
	else
		wintimeruwu+=1
	end

	if wintimeruwu<10 or (wintimeruwu>20 and wintimeruwu<=30) or (wintimeruwu>40 and wintimeruwu<=50) then
		spr(131,58,40)
	else
		spr(132,56,38)
	end

	if wintimeruwu==2 or wintimeruwu==24 then		--1
		spr(74,28,100)
	elseif wintimeruwu==3 or wintimeruwu==25 then
		spr(74,28,97)
	elseif wintimeruwu==4 or wintimeruwu==26 then
		spr(74,28,96)
	elseif wintimeruwu==5  or wintimeruwu==6 or wintimeruwu==27 or wintimeruwu==28 then
		spr(74,28,95)
	elseif wintimeruwu==7 or wintimeruwu==29 then
		spr(74,28,96)
	elseif wintimeruwu==8 or wintimeruwu==30 then
		spr(74,28,97)
	else
		spr(74,28,100)
	end

	if wintimeruwu==5 or wintimeruwu==39 then		--2
		spr(75,38,100)
	elseif wintimeruwu==6 or wintimeruwu==40 then
		spr(75,38,98)
	elseif wintimeruwu==7 or wintimeruwu==41 then
		spr(75,38,97)
	elseif wintimeruwu==8 or wintimeruwu==9  or wintimeruwu==42  or wintimeruwu==43 then
		spr(75,38,96)
	elseif wintimeruwu==10 or wintimeruwu==44 then
		spr(75,38,97)
	elseif wintimeruwu==11 or wintimeruwu==45 then
		spr(75,38,98)
	else
		spr(75,38,100)
	end

	if wintimeruwu==35 or wintimeruwu==43 then		--3
		spr(90,48,100)
	elseif wintimeruwu==36 or wintimeruwu==44 then
		spr(90,48,98)
	elseif wintimeruwu==37 or wintimeruwu==45 then
		spr(90,48,97)
	elseif wintimeruwu==38 or wintimeruwu==39  or wintimeruwu==46  or wintimeruwu==47 then
		spr(90,48,96)
	elseif wintimeruwu==40 or wintimeruwu==48 then
		spr(90,48,97)
	elseif wintimeruwu==41 or wintimeruwu==49 then
		spr(90,48,98)
	else
		spr(90,48,100)
	end

	if wintimeruwu==54 then							--4
		spr(91,58,100)
	elseif wintimeruwu==55 then
		spr(91,58,97)
	elseif wintimeruwu==56 then
		spr(91,58,95)
	elseif wintimeruwu==57 or wintimeruwu==58 then
		spr(91,58,94)
	elseif wintimeruwu==59 then
		spr(91,58,95)
	elseif wintimeruwu==60 then
		spr(91,58,97)
	else
		spr(91,58,100)
	end

	if wintimeruwu==45 then							--5
		spr(106,68,100)
	elseif wintimeruwu==46 then
		spr(106,68,98)
	elseif wintimeruwu==47 then
		spr(106,68,97)
	elseif wintimeruwu==48  or wintimeruwu==49 then
		spr(106,68,96)
	elseif wintimeruwu==50 then
		spr(106,68,97)
	elseif wintimeruwu==51 then
		spr(106,68,98)
	else
		spr(106,68,100)
	end

	if wintimeruwu==13 or wintimeruwu==38 then		--6
		spr(107,78,100)
	elseif wintimeruwu==14 or wintimeruwu==39 then
		spr(107,78,98)
	elseif wintimeruwu==15 or wintimeruwu==40 then
		spr(107,78,97)
	elseif wintimeruwu==16 or wintimeruwu==17  or wintimeruwu==41  or wintimeruwu==42 then
		spr(107,78,96)
	elseif wintimeruwu==18 or wintimeruwu==43 then
		spr(107,78,97)
	elseif wintimeruwu==19 or wintimeruwu==44 then
		spr(107,78,98)
	else
		spr(107,78,100)
	end

	if wintimeruwu==49 or wintimeruwu==4 or wintimeruwu==22 then							--7
		spr(122,88,100)
	elseif wintimeruwu==50 or wintimeruwu==5 or wintimeruwu==23 then
		spr(122,88,96)
	elseif wintimeruwu==51 or wintimeruwu==6 or wintimeruwu==24 then
		spr(122,88,94)
	elseif wintimeruwu==52 or wintimeruwu==53 or wintimeruwu==7 or wintimeruwu==8 or wintimeruwu==25 or wintimeruwu==26 then
		spr(122,88,93)
	elseif wintimeruwu==54 or wintimeruwu==9 or wintimeruwu==27 then
		spr(122,88,94)
	elseif wintimeruwu==55 or wintimeruwu==10 or wintimeruwu==28 then
		spr(122,88,96)
	else
		spr(122,88,100)
	end

	if wintimeruwu==28 or wintimeruwu==45 then		--8
		spr(123,98,100)
	elseif wintimeruwu==29 or wintimeruwu==46 then
		spr(123,98,98)
	elseif wintimeruwu==30 or wintimeruwu==47 then
		spr(123,98,97)
	elseif wintimeruwu==31 or wintimeruwu==32  or wintimeruwu==48  or wintimeruwu==49 then
		spr(123,98,96)
	elseif wintimeruwu==33 or wintimeruwu==50 then
		spr(123,98,97)
	elseif wintimeruwu==34 or wintimeruwu==51 then
		spr(123,98,98)
	else
		spr(123,98,100)
	end
end


-----------------------------------------------
function game()
	if antizbugtimer>180 then
		antizbugtimer=6
	end
	if antizbugtimer<5 then
		onupgradescreen=0
		music(0)
	end
	antizbugtimer+=1
	--print (antizbugtimer,20,0,7)
	cls()
	starmap()
	hud()
	if randompostrigger==0 then
		randompos()
		randompostrigger=1
	end
	if planet4frametrg==8 then
		introtriggerupgrade=1
	end
	planetstuff()
	playermovement()
	playerpositions()
	tooltip()
	turnpass()
	upgradestation()
	upgradescreen()
	deathcauses()

end

function gameend()
	cls()
	abletomove=0

	if deadof==1 then --o2 depletion
		print("You LOST!",50,10,7)
		loseanim()
	end
	if deadof==2 then --win
		print("You WON!",50,10,7)
		winanim()
	end

	print ("conseguiste un total de",20,60,7)
	print (allmymoneycounter.."$",55,70,11)
	print("en un total de "..turnstaken.." turnos",20,80,7)


end

function _update()
	animations()
	if coolasstimer<9999 then
		coolasstimer+=1
	else
		coolasstimer=1
	end
end

function _draw()
	if introdone==0 then intro() end
	if startgame==1 then game() end
	if deadof!=0 then gameend() end
end
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
__gfx__
00555500111111111111111111111111111111110000001000011110001100000cc0000000000000000000000000000000000000000000000000000000000000
0055550001cbae1001ecba1001aecb1001baec10001101810001551101551100c00c0000000aa00000066600000bbb0000000000009888000000000000989800
00555500011111100111111001111110011111100189101001115551015dd510c00c000000a000000000600000b0b00000988800000098000098980000989800
00555500001aa100001aa100001aa100001aa1001881100001a55551015dd510c00c0cc000a0aa0000006000000bb00000009800000980000098980000098000
00ffff00000a990000aaa000000a9000000aa0001411010001555aa115dd5510c00cc00c00a00a0000006000000b0b0000098000009800000009800000989800
00ffff0000099000000a990000999000090a9000010014100015aa101dd551000cc000c0000aa0000006660000bbb00000980000009888000098980000989800
00ffff000a090000000990000009909000099090000148810155a1001d55100000000c0000000000000000000000000000988800000000000098980000000000
00ffff00000000000009000000090000000900000000111001111000011100000000cccc00000000000000000000000000000000000000000000000000000000
00111100001111000011110000111100001111000011110000111100001111000011110000111100001111000011110000111100001111000011110000111100
012222100122221001222210012222100122221001222210012222100122221001dddd1001dddd1001dddd1001dddd1001d6dd1001dddd1001dddd1001dddd10
1eeeee2112eeeee1122eeee11222eee11e222ee11ee222e11eee22211eeee2211d666cc11dd6dcc11ddddcc11ddddcc11d6666c11ddd66c11ddd6cc11d66dcc1
12222221122222211222222112222221122222211222222112222221122222211dd666c11dd66cc11ddcccc11ddc6cc11ddc66c11ddc66c11ddcccc11dd66cc1
122222211222222112222221122222211222222112222221122222211222222116dc6cc11ddcccc11ddcccc11ddcccc11ddcccc11ddcccc11ddcccc11ddcccc1
12eeeee11eeeee211eeee2211eee22211ee222e11e222ee11222eee1122eeee11666ccc11d66ccc11ddcccc11ddcccc11d66ccc11d666cc11d6cccc1166cccc1
01222210012222100122221001222210012222100122221001222210012222100166cc1001ddcc1001ddcc1001d6cc1001d6cc100166cc10016dcc10016dcc10
00111100001111000011110000111100001111000011110000111100001111000011110000111100001111000011110000111100001111000011110000111100
0011110000111100001111000011110000111100001111000011110000111100c000000000000000000000000000000000000000000000000000000000000000
0133cc100133cc100133cc100133cc100133cc100133cc100133cc100133cc10000110000001100000011000000110000001100000011000000110000c011000
1b33ccc11b33ccc11b33ccc11b33ccc11b33ccc11b33ccc11b33ccc11b33ccc1001dd1000c1dd100001dd100001dd100001dd100001dd100001dd100001dd100
1777c3311b7773311bb777311bbb77711bbbc7711bbbc37117bbc331177bc33101dd6d1001dd6d1001dd6d1001dd6d1001dd6d1001dd6d1001dd6d1001dd6d10
1bbcb3311bbcb3311bbcb3311bbcb3311bbcb3311bbcb3311bbcb3311bbcb331016ddd10016ddd10016cdd10016ddd10016ddd10016ddd10016ddd10016ddd10
1bcbb3311bcbb3311bcbb3311bcbb3311bcbb3311bcbb3311bcbb3311bcbb331001d6100001d6100001d6100001d6100001d6100001d61c0001d6100001d6100
01cb771001c77b100177bb10017bbb1001cbbb1001cbbb1001cbbb1001cbb710000110000001100000011000000110c000011000000110000001100000011000
0011110000111100001111000011110000111100001111000011110000111100000000000000000000000000000000000000000c000000000000000000000000
00111100001111000011110000111100001111000011110000111100001111000000000000000000000000000000000000000000000980000000000000000000
01994810019948100199481001994810019948100199481001994810019948100009000000900000000090000000090000098000009888000009800000000000
14555591155558911555889115998891149988911499889114995551149555910098000009800000000089000000089000988800098888800009800000098000
14455591145559911555899115598991154989911449899114498551144555910988999098899900099988900099988909888880000980000009800000098000
14488941144889411448894114488941144889411448894114488941144889410888888088888800088888800088888800098000000980000988888000098000
15558551155855411545584114558841155488411448884114485551145555510088000008800000000088000000088000098000000980000098880009888880
01558810015588100154881001448810014488100144881001445510014555100008000000800000000080000000080000098000000000000009800000988800
00111100001111000011110000111100001111000011110000111100001111000000000000000000000000000000000000000000000000000000000000098000
0000008000000080bb000080111111810cc000b00cc00888000000b0000000b000000bbb00000bbb00969900005555000000000000000000bb00000011111111
0000080800606808bbbb080801cba818c00c0bbbc00c008000000bbb00000bbb0000b0b00000b0b000969900005555000000008000606080bbbb008001cbae80
4444440006c6c60000bbbb0001111110c00c0000c00c0000000aa0000066600000000bb000000bb000999900005555004444480806c6c80800bbb80801111818
45aa540006c6c6000000bbbb00bbb000c00c0cc0c00c0cc000a00000000600000aa00b0b66600b0b009999000055550045aa540006c6c6000000bbbb00bbb000
4444440006c6c6000000bbbb0b0b0000c00cc00cc00cc00c00a0aa0000060000a000bbb00600bbb000aaaa00008888004444440006c6c6000000bbbb0b0b0000
4555540006c6c60000bbbb0000bb00000cc000c00cc000c000a00a0000060000a0aa00000600000000aaaa00008888004555540006c6c60000bbbb0000bb0000
4555540006c6c600bbbb000000b0b00000000c0000000c00000aa00000666000a00a00000600000000aaaa00008888004555540006c6c600bbbb000000b0b000
4444440006666600bb0000000bbb00000000cccc0000cccc00000000000000000aa000006660000000aaaa00008888004444440006666600bb0000000bbb0000
0000008000000080bb0000801111118155000000bb0000000000000000000000000000000000000000cccc0000eeee000000000000000000bb00000011111111
0000080800606808bbbb080801cba81855550000bbbb0000007000000000000000000bbb00000bbb00cccc0000eeee000000008000606080bbbb008001cbae80
4444448006c6c68000bbbb80011111800055550000bbbb0000770000000000000000b0b00000b0b000cccc0000eeee004444480806c6c80800bbb80801111818
45aa580806c6c8080000b8b800bbb808000055550000bbbb007770000555fff00aa00bbb66600bbb00cccc0000eeee0045aa548006c6c6800000bb8b00bbb080
4444440006c6c6000000bbbb0b0b0000000055550000bbbb007700000555fff0a0000b0b06000b0b0077770000bbbb004444480806c6c8080000b8b80b0b0808
4555540006c6c60000bbbb0000bb00000055550000bbbb00007000000555fff0a0aabbb00600bbb00077770000bbbb004555540006c6c60000bbbb0000bb0000
4555540006c6c600bbbb000000b0b00055550000bbbb00000000000000000000a00a0000060000000077770000bbbb004555540006c6c600bbbb000000b0b000
4444440006666600bb0000000bbb000055000000bb00000000000000000000000aa00000666000000077770000bbbb004444440006666600bb0000000bbb0000
0000008000000080bb00008011111181bb000000bb000000bb000000bb000000bb000000bb00000000cccc00002222000000000000000000bb00000011111111
0000080800606808bbbb080801cba818bbbb0000bbbb0000bbbb0000bb550000bbbb0000bbbb000000cccc00002222000000008000606080bbbb008001cbae80
4444448006c6c68000bbbb800111118000bb550000b5550000bbbb000055550000bb550000bbbb0000cccc00002222004444480806c6c80800bbb80801111818
45aa580806c6c8080000b8b800bbb80800005555000055550000b55500005555000055550000bb5500cccc000022220045aa548006c6c6800000bb8b00bbb080
4444448006c6c6800000bb8b0b0b008000005555000055550000b55500005555000055550000bb550011110000cccc004444480806c6c8080000b8b80b0b0808
4555580806c6c80800bbb80800bb080800bb550000b5550000bbbb000055550000bb550000bbbb000011110000cccc004555548006c6c68000bbbb8000bb0080
4555540006c6c600bbbb000000b0b000bbbb0000bbbb0000bbbb0000bb550000bbbb0000bbbb00000011110000cccc004555580806c6c808bbbb080800b0b808
4444440006666600bb0000000bbb0000bb000000bb000000bb000000bb000000bb000000bb0000000011110000cccc004444440006666600bb0000000bbb0000
80000008800000088b00000881111118000dd0000000ddd000000dd00d0000000000550000005500001551000075570088000088880000888800008888111188
0800008008606080b8bb008008cbae8000dd0000d00ddd00d0000d000d0000dd000055000000550000111100007557008880088888806888888b0888888ba888
448448000686c800008bb80001811810000110d0dd011000dd00d00000d00d000000ff000000ff00005775000056550048888880088888800888888008888880
45a8840006c8860000088bbb00b88000d01111dddd1111d000d11000000110000006ff600006ff6600577500005d65004588880006888800008888bb00888800
4448840006c8860000088bbb0b088000dd11110d0d1111dd00011d0000011000000666600000666000577500005775004488880006888800008888bb0b888800
458558000686c800008bb800008b08000d011000000110dd000d00dd00d00d000060666000660606005775000057750048888880088888800888888008888880
4855548008c6c680b8bb008008b0b0800000dd0000ddd00d00d0000ddd0000d000006606000606600077770000575500888558888886c888888b08888880b888
84444408866666088b0000088bbb0008000dd0000ddd00000dd00000000000d00006060606060600007777000055550088444488886666888800008888bb0088
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00707000070007000000000000000000ccccc0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000700000000000000000000cccc0000000c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000700007788888800c0000000c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000777888880c0000000c0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000004000040cccc0000ccccc0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000007070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07000700700000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000007070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000009699000000000000000055550000000000000000cccc0000000000000000eeee00000000000000000000000000000000
000000000000000000000000000000009699000000000000000055550000000000000000cccc0000000000000000eeee00000000000000000000000000000000
000000000000000000000000000000009999000000000000000055550000000000000000cccc0000000000000000eeee00000000000000000000000000000000
000000000000000000000000000000009999000000000000000055550000000000000000cccc0000000000000000eeee00000000000000000000000000000000
00000000000000000000000000000000aaaa00000000000000008888000000000000000077770000000000000000bbbb00000000000000000000000000000000
00000000000000000000000000000000aaaa00000000000000008888000000000000000077770000000000000000bbbb00000000000000000000000000000000
00000000000000000000000000000000aaaa00000000000000008888000000000000000077770000000000000000bbbb00000000000000000000000000000000
00000000000000000000000000000000aaaa00000000000000008888000000000000000077770000000000000000bbbb00000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000777700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000007777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000077777777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000005555000000000000000022220000000000000000cccc0000000000000000555500000000000000000000000000000000
000000000000000000000000000000005555000000000000000022220000000000000000cccc0000000000000000555500000000000000000000000000000000
000000000000000000000000000000005555000000000000000022220000000000000000cccc0000000000000000555500000000000000000000000000000000
000000000000000000000000000000005555000000000000000022220000000000000000cccc0000000000000000555500000000000000000000000000000000
00000000000000000000000000000000ffff0000000000000000cccc000000000000000011110000000000000000555500000000000000000000000000000000
00000000000000000000000000000000ffff0000000000000000cccc000000000000000011110000000000000000555500000000000000000000000000000000
00000000000000000000000000000000ffff0000000000000000cccc000000000000000011110000000000000000555500000000000000000000000000000000
00000000000000000000000000000000ffff0000000000000000cccc000000000000000011110000000000000000555500000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000cc0ccc0c000ccc00cc0ccc00000c0c0ccc0ccc0c0c00000ccc0000000000000000000000000000000000000
0000000000000000000000000000000000000000c000c000c000c000c0000c000000c0c00c000c00c0c0000000c0000000000000000000000000000000000000
0000000000000000000000000000000000000000ccc0cc00c000cc00c0000c000000c0c00c000c00ccc000000c00000000000000000000000000000000000000
000000000000000000000000000000000000000000c0c000c000c000c0000c000000ccc00c000c00c0c00000c000000000000000000000000000000000000000
0000000000000000000000000000000000000000cc00ccc0ccc0ccc00cc00c000000ccc0ccc00c00c0c00000ccc0000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

__sfx__
00010000040500405004050050500605007050080400b0300e030120101a010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00010000021500115004130071300a1100a11009130041300412005140051300212004110051000f550085600d550215401d5302052023540285402f5502f5503354033530335203553038520345100450000500
0001000002750067500b750117500a7500d7500f750107500f75009750027500000000000000000175005750087500a750087500d7501175018750187500f7500875005750047500375004750000000000000000
00010000021500115004130071300a1100a11009130041300412005140051300212004110051000f550115601255012540115301252012540135401455015550175401953019520125300b520125100450000500
00010000127000e7100b7100871006720057200472003730027500175001750017500075000750007500000000000000000000000000000000000000000000000000022000000000000000000000000000000000
00010000127601875014750127400f7400c7400a74008730077500575004750037500175000750007500000000000000000000000000000000000000000000000000022000000000000000000000000000000000
000c00001055024530165502e53000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000c00001055024530165502e5301d550325500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000c00001055024530165502e5301d5503255026550395502f5503d5503f5503d5503d55000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000c000014520165201b520195201a520205201f0002600029000265001b50019500195001c500235001d500225002a5000000000000000000000000000000000000000000000000000000000000000000000000
000c000014530165301b530195301a530225301f0002600029000265001b50019500195001c500235001d500225002a5000000000000000000000000000000000000000000000000000000000000000000000000
0006000005050080500d000130001c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0110000010410000000d4100d4131041000000104100000000000000000c4100c4121041000000104101041510410000000d4100d4131041000000104100000000000000000c4100c41210410000001041010415
011000001c4100000019410194131c410000001c41000000000000000018410184121c410000001c4101c4151c4100000019410194131c410000001c41000000000000000018410184121c410000001c4101c415
011000000e7100f715000001c7141c7101c71500000000000e7100f715000001c7141c7101c71500000000000e7100f715000001c7141c7101c71500000000000e7100f715000001c7141c7101c7150000000000
011000001b71028715287151c7141c7101c71500000000001b71028715287151c7141c7101c71500000000001b71028715287151c7141c7101c71500000000001b71028715287151c7141c7101c7150000000000
012000002155021550215502155529555265552655026550265502655026550265552555025550255550000000000000000000000000000000000000000000000000000000000000000000000000000000000000
012000001c1551c1551c1501c1551c1001c1001c1551c1551c1501c1551c1001c1001c1551f15524150241552315023155000002115521150211551f1501f15500000000001a1551c1551d1501d1550000000000
0120000000000000001f1501f15500000000001f1001f1001f1501f155000000000000000000001c1501c1551c1501c155000001d1551d1501d1551d1501d1550000000000000000000000000000000000000000
012000001a1551c1551d1501d15500000000001a1551d1551d1501d1501d155000002315500000241502415024155000000000000000000000000000000000000000000000000000000000000000000000000000
01200000000000000000000000000000000000000000000023155211551f155000001d155000001c1501c1501c155000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
01 0c4f4344
02 0d4f4344
01 0e424344
02 0f424344
03 10514344
01 11124344
02 13144344

