USD="UNIT_SPELLCAST_SUCCEEDED";OT="OnEvent";FR="Frame";RF=CreateFrame;RD="Border";UE=UnitName
CS=RF(FR) CS.c=RF("Cooldown","CST",CS.t) CS:RegisterEvent(USD)
CS.c:SetAllPoints(CS) CS:SetPoint("CENTER",UIParent,"CENTER",-320,345)CS:SetSize(30,30)CS.t=CS:CreateTexture(nil,RD)CS.t:SetAllPoints()CS.t:SetTexture("Interface\\Icons\\ability_cheapshot")
CS:SetScript(OT,function(self,event,...) if UE(select(1,...))==UE("player") and select(5,...)==1833 then CST:SetCooldown(GetTime(), 23)end if UE(select(1,...))==UE("player") and select(5,...)==408 then CST:SetCooldown(GetTime(), 25) end end)
SP=RF(FR) SP.c=RF("Cooldown","SAP",SP.t) SP:RegisterEvent(USD)
SP.c:SetAllPoints(SP) SP:SetPoint("CENTER",UIParent,"CENTER",-290,345)SP:SetSize(30,30)SP.t=SP:CreateTexture(nil,RD)SP.t:SetAllPoints()SP.t:SetTexture("Interface\\Icons\\ability_sap")
SP:SetScript(OT,function(self,event,...) if UE(select(1,...))==UE("player") and select(5,...)==6770 then SAP:SetCooldown(GetTime(), 27)end if UE(select(1,...))==UE("player") and select(5,...)==1776 then SAP:SetCooldown(GetTime(), 23) end end)
GR=RF(FR) GR.c=RF("Cooldown","GARROTE",GR.t) GR:RegisterEvent(USD)
GR.c:SetAllPoints(GR) GR:SetPoint("CENTER",UIParent,"CENTER",-260,345)GR:SetSize(30,30)GR.t=GR:CreateTexture(nil,RD)GR.t:SetAllPoints()GR.t:SetTexture("Interface\\Icons\\ability_Rogue_Garrote")
GR:SetScript(OT,function(self,event,...) if UE(select(1,...))==UE("player") and select(5,...)==703 then GARROTE:SetCooldown(GetTime(), 23)end if UE(select(1,...))==UE("player") and select(5,...)==102926 then GARROTE:SetCooldown(GetTime(), 20) end end)

UFP = "UnitFramePortrait_Update"; UICC = "Interface\\TargetingFrame\\UI-Classes-Circles"; CIT = CLASS_ICON_TCOORDS;SP,CA="SetPoint","ClearAllPoints";NO=function() end
hooksecurefunc(UFP,function(s) if s.portrait then if UnitIsPlayer(s.unit) then local t=CIT[select(2,UnitClass(s.unit))] if t then s.portrait:SetTexture(UICC) s.portrait:SetTexCoord(unpack(t)) end else s.portrait:SetTexCoord(0,1,0,1) end end end)
