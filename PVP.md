## 利用游戏内置秒表自动监视反制类法术监视

```js
/run AID={};for i=1,5 do AID["arena"..i]=1;AID["arenapet"..i]=1 end;GSI=GetSpellInfo;INTIDS={[GSI(2139)]=24,[GSI(19647)]=24,[GSI(691)]=1};StopwatchFrame:Show() 
/run local f=CreateFrame("Frame");f:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED");f:SetScript("OnEvent",function(f,e,u,s,_)if((AID[u]) and INTIDS[s])then Stopwatch_StartCountdown(0,0,INTIDS[s]);Stopwatch_Play();end end)
```

## 职业头像

```js
/run UFP = "UnitFramePortrait_Update"; UICC = "Interface\\TargetingFrame\\UI-Classes-Circles"; CIT = CLASS_ICON_TCOORDS;SP,CA="SetPoint","ClearAllPoints";NO=function() end 
/run hooksecurefunc(UFP,function(s) if s.portrait then if UnitIsPlayer(s.unit) then local t=CIT[select(2,UnitClass(s.unit))] if t then s.portrait:SetTexture(UICC) s.portrait:SetTexCoord(unpack(t)) end else s.portrait:SetTexCoord(0,1,0,1) end end end)
```

## 敌对打断监视interruptabr

```js
/run li={2139,19647,57994,48707,8143,8122,6552,1766,96231,47528,80965,44572}cd={24,24,5,45,60,27,10,10,10,10,10,45} 

/run fl=0;ic=40;xp=-500;yp=320;n=6;sfc=CooldownFrame_SetTimer;crf=CreateFrame;ce=math.ceil;ih=IsInInstance;gsi=GetSpellInfo;up=UIParent pe="PLAYER_ENTERING_WORLD"cdf="Cooldown" 

/run function cf(i,s,x,y)local _,_,t=gsi(s)local f=crf("Frame",nil,up)f:SetPoint("CENTER",x,y)f:SetSize(ic,ic)f.t = f:CreateTexture(nil,"BORDER")f.t:SetAllPoints(true)f.t:SetTexture(t)f.c=CreateFrame(cdf,nil,f)f.c:SetAllPoints(f)return f;end 

/run function ud(f,ls,lc)f:SetScript("OnEvent",function(_,_,_,e,_,_,_,b,_,_,_,_,_,s)if((bit.band(b,0x40) == 0x40)and e=="SPELL_CAST_SUCCESS"and s==ls)then sfc(f.c,GetTime(),lc,1)end end)f:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")end 

/run for i,s in ipairs(li)do _G["ib"..i] = cf(i,s,xp+(ic+5)*ce((i-1)%n),yp-(ic+5)*ce(i/n))ud(_G["ib"..i],s,cd[i])end 

/run ik=crf("Frame")ik:SetScript("OnEvent",function()local _,t=ih()for i,s in ipairs(li)do local f=_G["ib"..i]if(t=="arena"or fl==0)then f:Show()f.c:Show()else f:Hide()f.c:Hide()end end end)ik:RegisterEvent(pe)
```

## 快捷键隐藏

```js
/run local r={"MultiBarBottomLeft", "MultiBarBottomRight", "Action", "MultiBarLeft", "MultiBarRight"} for b=1,#r do for i=1,12 do _G[r[b].."Button"..i.."HotKey"]:SetAlpha(0) end end
```

## 宏名称隐藏

```js
/run local r={"MultiBarBottomLeft", "MultiBarBottomRight", "Action", "MultiBarLeft", "MultiBarRight"} for b=1,#r do for i=1,12 do _G[r[b].."Button"..i.."Name"]:SetAlpha(0) end end
```