z=CreateFrame("Frame")z:SetParent(TargetFrame)z:SetPoint("Right",TargetFrame,0,10)z:SetSize(35,35)z.t=z:CreateTexture(nil,BORDER)z.t:SetAllPoints()z.t:SetTexture("Interface\\Icons\\ABILITY_DUALWIELD")z:Hide() 

local function FrameOnUpdate(self) if UnitAffectingCombat("target") then self:Show() else self:Hide() end end local g = CreateFrame("Frame") g:SetScript("OnUpdate", function(self) FrameOnUpdate(z) end) 

y=CreateFrame("Frame")y:SetParent(FocusFrame)y:SetPoint("Left",FocusFrame,-40,9)y:SetSize(35,35)y.t=y:CreateTexture(nil,BORDER)y.t:SetAllPoints()y.t:SetTexture("Interface\\Icons\\ABILITY_DUALWIELD")y:Hide() 

local function FrameOnUpdate(self) if UnitAffectingCombat("focus") then self:Show() else self:Hide() end end local h = CreateFrame("Frame") h:SetScript("OnUpdate", function(self) FrameOnUpdate(y) end) 
