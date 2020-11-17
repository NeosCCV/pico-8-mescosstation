pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
--
--
---------------------------------------------------------------------------------
function _init()
	ismescocute=1
	introdone=0
	startgame=0
	gameend=0
	--

	planet1frame={16,17,18,19,20,21,22,23}
	planet1={}
	planet1.step=0
	planet1frametrg=0
	planet2frame={24,25,26,27,28,29,30,31}
	planet2={}
	planet2.step=0
	planet2frametrg=0
	planet3frame={32,33,34,35,36,37,38,39}
	planet3={}
	planet3.step=0	planet3frametrg=0
	planet4frame={40,41,42,43,44,45,46,47}
	planet4={}
	planet4.step=0	
	planet4frametrg=0
	planet5frame={48,49,50,51,52,53,54,55}
	planet5={}
	planet5.step=0
	planet5frametrg=0
	platformframe={1,2,3,4}
	platform={}
	platform.step=0
	platformframetrg=0
	--
	mappos={25,33,59,33,93,33,25,67,59,67,93,67,25,101,59,101,93,101}
	randompostrigger=0
	--
	playerpos=5
	--
	planettext={"GAS","WATER","EARTH","MOON","STATION","LAVA","BROKEN","GOLDEN","IRON"}

end
---------------------------------------------------------------------------------
function animations()
	planet1.step+=1
 	if(planet1.step%10==0) planet1frametrg+=1
 	if(planet1frametrg>8) planet1frametrg=1
	planet2.step+=1
 	if(planet2.step%10==0) planet2frametrg+=1
 	if(planet2frametrg>8) planet2frametrg=1
	planet3.step+=1
 	if(planet3.step%10==0) planet3frametrg+=1
 	if(planet3frametrg>8) planet3frametrg=1
	planet4.step+=1
 	if(planet4.step%10==0) planet4frametrg+=1
 	if(planet4frametrg>8) planet4frametrg=1
	planet5.step+=1 --------------------------------------PLANET5 ES AHORA PLANET6 MACHO SOY SUBNORMAL :))))))
 	if(planet5.step%10==0) planet5frametrg+=1
 	if(planet5frametrg>8) planet5frametrg=1
	platform.step+=1
 	if(platform.step%3==0) platformframetrg+=1
 	if(platformframetrg>4) platformframetrg=1
end
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
	end
	--2
	if playerpos==2 then
		spr(0,59,25)
	end
	--3
	if playerpos==3 then
		spr(0,93,25)
	end
	--4
	if playerpos==4 then
		spr(0,25,59)
	end
	--5
	if playerpos==5 then
		spr(0,59,59)
	end
	--6
	if playerpos==6 then
		spr(0,93,59)
	end
	--7
	if playerpos==7 then
		spr(0,25,93)
	end
	--8
	if playerpos==8 then
		spr(0,59,93)
	end
	--9
	if playerpos==9 then
		spr(0,93,93)
	end
end
function tooltip()
	--tooltip text bout where u at
	if playerpos==planet1val then
		print (planettext[1])
	end
	if playerpos==planet2val then
		print (planettext[2])
	end
	if playerpos==planet3val then
		print (planettext[3])
	end
	if playerpos==planet4val then
		print (planettext[4])
	end
	if playerpos==planet5val then
		print (planettext[5])
	end
	if playerpos==planet6val then
		print (planettext[6])
	end
	if playerpos==planet7val then
		print (planettext[7])
	end
	if playerpos==planet8val then
		print (planettext[8])
	end
	if playerpos==planet9val then
		print (planettext[9])
	end
end
--
function playermovement()
	if btnp(0) then playerpos-=1 end
	if btnp(1) then playerpos+=1 end
	if btnp(2) then playerpos-=3 end
	if btnp(3) then playerpos+=3 end
end
--
--
function intro()
	cls()
	spr(0,59,59)
	print ("mesco's station",33,70)
	print ("PRESS z TO BEGIN",32,82)
	if (btn(4)) then 
	introdone=1 
	startgame=1
	end
end

--
function game()
	cls()
	if randompostrigger==0 then
		randompos()
		randompostrigger=1
	end
	planetstuff()
	playermovement()
	playerpositions()
	tooltip()


end

function gameend()
	cls()
	print ("game_end")


end

function _update()
	animations()
end

function _draw()
	if introdone==0 then intro() end
	if startgame==1 then game() end
	if gameend==1 then gameend() end
end
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
__gfx__
00555500111111111111111111111111111111110000001000011110001100000000000000000000000000000000000000000000000000000000000000000000
0055550001cba810018cba1001a8cb1001ba8c100011018100015511015511000000000000000000000000000000000000000000000000000000000000000000
00555500011111100111111001111110011111100189101001115551015dd5100000000000000000000000000000000000000000000000000000000000000000
00555500001aa100001aa100001aa100001aa1001881100001a55551015dd5100000000000000000000000000000000000000000000000000000000000000000
00ffff00000a990000aaa000000a9000000aa0001411010001555aa115dd55100000000000000000000000000000000000000000000000000000000000000000
00ffff0000099000000a990000999000090a9000010014100015aa101dd551000000000000000000000000000000000000000000000000000000000000000000
00ffff000a090000000990000009909000099090000148810155a1001d5510000000000000000000000000000000000000000000000000000000000000000000
00ffff00000000000009000000090000000900000000111001111000011100000000000000000000000000000000000000000000000000000000000000000000
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
00111100001111000011110000111100001111000011110000111100001111000000000000000000000000000000000000000000000000000000000000000000
01994810019948100199481001994810019948100199481001994810019948100000000000000000000000000000000000000000000000000000000000000000
14555591155558911555889115998891149988911499889114995551149555910000000000000000000000000000000000000000000000000000000000000000
14455591145559911555899115598991154989911449899114498551144555910000000000000000000000000000000000000000000000000000000000000000
14488941144889411448894114488941144889411448894114488941144889410000000000000000000000000000000000000000000000000000000000000000
15558551155855411545584114558841155488411448884114485551145555510000000000000000000000000000000000000000000000000000000000000000
01558810015588100154881001448810014488100144881001445510014555100000000000000000000000000000000000000000000000000000000000000000
00111100001111000011110000111100001111000011110000111100001111000000000000000000000000000000000000000000000000000000000000000000
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

__map__
0000000000000000000000000600060000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
