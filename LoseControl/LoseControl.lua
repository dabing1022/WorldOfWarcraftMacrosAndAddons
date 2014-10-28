--[[ Code Credits - to the people whose code I borrowed and learned from:
Wowwiki
Kollektiv
Tuller
ckknight
The authors of Nao!!
And of course, Blizzard

Thanks! :)
]]

local addonName, L = ...
local UIParent = UIParent -- it's faster to keep local references to frequently used global vars
local UnitAura = UnitAura
local GetTime = GetTime
local SetPortraitToTexture = SetPortraitToTexture
local print = print
local debug = false -- type "/lc debug on" if you want to see UnitAura info logged to the console

-------------------------------------------------------------------------------
-- Thanks to all the people on the Curse.com and WoWInterface forums who help keep this list up to date :)
local spellIds = {
	-- Death Knight
	[108194] = "CC",		-- Asphyxiate
	[115001] = "CC",		-- Remorseless Winter
	[47476]  = "Silence",		-- Strangulate
	[96294]  = "Root",		-- Chains of Ice (Chilblains)
	[45524]  = "Snare",		-- Chains of Ice
	[50435]  = "Snare",		-- Chilblains
	--[43265]  = "Snare",		-- Death and Decay (Glyph of Death and Decay) - no way to distinguish between glyphed spell and normal. :(
	[115000] = "Snare",		-- Remorseless Winter
	[115018] = "Immune",		-- Desecrated Ground
	[48707]  = "ImmuneSpell",	-- Anti-Magic Shell
	[48792]  = "Other",		-- Icebound Fortitude
	[49039]  = "Other",		-- Lichborne
	--[51271] = "Other",		-- Pillar of Frost
	-- Death Knight Ghoul
	[91800]  = "CC",		-- Gnaw
	[91797]  = "CC",		-- Monstrous Blow (Dark Transformation)
	[91807]  = "Root",		-- Shambling Rush (Dark Transformation)
	-- Druid
	[113801] = "CC",		-- Bash (Force of Nature - Feral Treants)
	[102795] = "CC",		-- Bear Hug
	[33786]  = "CC",		-- Cyclone
	[99]     = "CC",		-- Disorienting Roar
	[2637]   = "CC",		-- Hibernate
	[22570]  = "CC",		-- Maim
	[5211]   = "CC",		-- Mighty Bash
	[9005]   = "CC",		-- Pounce
	[102546] = "CC",		-- Pounce (Incarnation)
	[114238] = "Silence",		-- Fae Silence (Glyph of Fae Silence)
	[81261]  = "Silence",		-- Solar Beam
	[339]    = "Root",		-- Entangling Roots
	[113770] = "Root",		-- Entangling Roots (Force of Nature - Balance Treants)
	[19975]  = "Root",		-- Entangling Roots (Nature's Grasp)
	[45334]  = "Root",		-- Immobilized (Wild Charge - Bear)
	[102359] = "Root",		-- Mass Entanglement
	[50259]  = "Snare",		-- Dazed (Wild Charge - Cat)
	[58180]  = "Snare",		-- Infected Wounds
	[61391]  = "Snare",		-- Typhoon
	[127797] = "Snare",		-- Ursol's Vortex
	--[???] = "Snare",		-- Wild Mushroom: Detonate
	-- Druid Symbiosis
	[110698] = "CC",		-- Hammer of Justice (Paladin)
	[113004] = "CC",		-- Intimidating Roar [Fleeing in fear] (Warrior)
	[113056] = "CC",		-- Intimidating Roar [Cowering in fear] (Warrior)
	[126458] = "Disarm",		-- Grapple Weapon (Monk)
	[110693] = "Root",		-- Frost Nova (Mage)
	--[110610] = "Snare",		-- Ice Trap (Hunter)
	[110617] = "Immune",		-- Deterrence (Hunter)
	[110715] = "Immune",		-- Dispersion (Priest)
	[110700] = "Immune",		-- Divine Shield (Paladin)
	[110696] = "Immune",		-- Ice Block (Mage)
	[110570] = "ImmuneSpell",	-- Anti-Magic Shell (Death Knight)
	[110788] = "ImmuneSpell",	-- Cloak of Shadows (Rogue)
	[113002] = "ImmuneSpell",	-- Spell Reflection (Warrior)
	[110791] = "Other",		-- Evasion (Rogue)
	[110575] = "Other",		-- Icebound Fortitude (Death Knight)
	[122291] = "Other",		-- Unending Resolve (Warlock)
	-- Hunter
	[117526] = "CC",		-- Binding Shot
	[3355]   = "CC",		-- Freezing Trap
	[1513]   = "CC",		-- Scare Beast
	[19503]  = "CC",		-- Scatter Shot
	[19386]  = "CC",		-- Wyvern Sting
	[34490]  = "Silence",		-- Silencing Shot
	[19185]  = "Root",		-- Entrapment
	[64803]  = "Root",		-- Entrapment
	[128405] = "Root",		-- Narrow Escape
	[35101]  = "Snare",		-- Concussive Barrage
	[5116]   = "Snare",		-- Concussive Shot
	[61394]  = "Snare",		-- Frozen Wake (Glyph of Freezing Trap)
	[13810]  = "Snare",		-- Ice Trap
	[19263]  = "Immune",		-- Deterrence
	-- Hunter Pets
	[90337]  = "CC",		-- Bad Manner (Monkey)
	[24394]  = "CC",		-- Intimidation
	[126246] = "CC",		-- Lullaby (Crane)
	[126355] = "CC",		-- Paralyzing Quill (Porcupine)
	[126423] = "CC",		-- Petrifying Gaze (Basilisk)
	[50519]  = "CC",		-- Sonic Blast (Bat)
	[56626]  = "CC",		-- Sting (Wasp)
	[96201]  = "CC",		-- Web Wrap (Shale Spider)
	[50541]  = "Disarm",		-- Clench (Scorpid)
	[91644]  = "Disarm",		-- Snatch (Bird of Prey)
	[90327]  = "Root",		-- Lock Jaw (Dog)
	[50245]  = "Root",		-- Pin (Crab)
	[54706]  = "Root",		-- Venom Web Spray (Silithid)
	[4167]   = "Root",		-- Web (Spider)
	[50433]  = "Snare",		-- Ankle Crack (Crocolisk)
	[54644]  = "Snare",		-- Frost Breath (Chimaera)
	[54216]  = "Other",		-- Master's Call (root and snare immune only)
	-- Mage
	[118271] = "CC",		-- Combustion Impact
	[44572]  = "CC",		-- Deep Freeze
	[31661]  = "CC",		-- Dragon's Breath
	[118]    = "CC",		-- Polymorph
	[61305]  = "CC",		-- Polymorph: Black Cat
	[28272]  = "CC",		-- Polymorph: Pig
	[61721]  = "CC",		-- Polymorph: Rabbit
	[61780]  = "CC",		-- Polymorph: Turkey
	[28271]  = "CC",		-- Polymorph: Turtle
	[82691]  = "CC",		-- Ring of Frost
	[102051] = "Silence",		-- Frostjaw (also a root)
	[55021]  = "Silence",		-- Silenced - Improved Counterspell
	[122]    = "Root",		-- Frost Nova
	[111340] = "Root",		-- Ice Ward
	[121288] = "Snare",		-- Chilled (Frost Armor)
	[120]    = "Snare",		-- Cone of Cold
	[116]    = "Snare",		-- Frostbolt
	[44614]  = "Snare",		-- Frostfire Bolt
	[113092] = "Snare",		-- Frost Bomb
	[31589]  = "Snare",		-- Slow
	[45438]  = "Immune",		-- Ice Block
	[115760] = "ImmuneSpell",	-- Glyph of Ice Block
	-- Mage Water Elemental
	[33395]  = "Root",		-- Freeze
	-- Monk
	[123393] = "CC",		-- Breath of Fire (Glyph of Breath of Fire)
	[126451] = "CC",		-- Clash
	[122242] = "CC",		-- Clash (not sure which one is right)
	[119392] = "CC",		-- Charging Ox Wave
	[120086] = "CC",		-- Fists of Fury
	[119381] = "CC",		-- Leg Sweep
	[115078] = "CC",		-- Paralysis
	[117368] = "Disarm",		-- Grapple Weapon
	[140023] = "Disarm",		-- Ring of Peace
	[137461] = "Disarm",		-- Disarmed (Ring of Peace)
	[137460] = "Silence",		-- Silenced (Ring of Peace)
	[116709] = "Silence",		-- Spear Hand Strike
	[116706] = "Root",		-- Disable
	[113275] = "Root",		-- Entangling Roots (Symbiosis)
	[123407] = "Root",		-- Spinning Fire Blossom
	[116095] = "Snare",		-- Disable
	[118585] = "Snare",		-- Leer of the Ox
	[123727] = "Snare",		-- Dizzying Haze
	[123586] = "Snare",		-- Flying Serpent Kick
	[131523] = "ImmuneSpell",	-- Zen Meditation
	-- Paladin
	[105421] = "CC",		-- Blinding Light
	[115752] = "CC",		-- Blinding Light (Glyph of Blinding Light)
	[105593] = "CC",		-- Fist of Justice
	[853]    = "CC",		-- Hammer of Justice
	[119072] = "CC",		-- Holy Wrath
	[20066]  = "CC",		-- Repentance
	[10326]  = "CC",		-- Turn Evil
	[31935]  = "Silence",		-- Avenger's Shield
	[110300] = "Snare",		-- Burden of Guilt
	[63529]  = "Snare",		-- Dazed - Avenger's Shield
	[20170]  = "Snare",		-- Seal of Justice
	[642]    = "Immune",		-- Divine Shield
	[31821]  = "Other",		-- Aura Mastery
	[1022]   = "Other",		-- Hand of Protection
	-- Priest
	[113506] = "CC",		-- Cyclone (Symbiosis)
	[605]    = "CC",		-- Dominate Mind
	[88625]  = "CC",		-- Holy Word: Chastise
	[64044]  = "CC",		-- Psychic Horror
	[8122]   = "CC",		-- Psychic Scream
	[113792] = "CC",		-- Psychic Terror (Psyfiend)
	[9484]   = "CC",		-- Shackle Undead
	[87204]  = "CC",		-- Sin and Punishment
	[15487]  = "Silence",		-- Silence
	[64058]  = "Disarm",		-- Psychic Horror
	[113275] = "Root",		-- Entangling Roots (Symbiosis)
	[87194]  = "Root",		-- Glyph of Mind Blast
	[114404] = "Root",		-- Void Tendril's Grasp
	[15407]  = "Snare",		-- Mind Flay
	[47585]  = "Immune",		-- Dispersion
	[114239] = "ImmuneSpell",	-- Phantasm
	-- Rogue
	[2094]   = "CC",		-- Blind
	[1833]   = "CC",		-- Cheap Shot
	[1776]   = "CC",		-- Gouge
	[408]    = "CC",		-- Kidney Shot
	[113953] = "CC",		-- Paralysis (Paralytic Poison)
	[6770]   = "CC",		-- Sap
	[1330]   = "Silence",		-- Garrote - Silence
	[51722]  = "Disarm",		-- Dismantle
	[115197] = "Root",		-- Partial Paralysis
	[3409]   = "Snare",		-- Crippling Poison
	[26679]  = "Snare",		-- Deadly Throw
	[119696] = "Snare",		-- Debilitation
	[31224]  = "ImmuneSpell",	-- Cloak of Shadows
	[45182]  = "Other",		-- Cheating Death
	[5277]   = "Other",		-- Evasion
	--[76577]  = "Other",		-- Smoke Bomb
	[88611]  = "Other",		-- Smoke Bomb
	-- Shaman
	[76780]  = "CC",		-- Bind Elemental
	[77505]  = "CC",		-- Earthquake
	[51514]  = "CC",		-- Hex
	[118905] = "CC",		-- Static Charge (Capacitor Totem)
	[113287] = "Silence",		-- Solar Beam (Symbiosis)
	[64695]  = "Root",		-- Earthgrab (Earthgrab Totem)
	[63685]  = "Root",		-- Freeze (Frozen Power)
	[3600]   = "Snare",		-- Earthbind (Earthbind Totem)
	[116947] = "Snare",		-- Earthbind (Earthgrab Totem)
	[77478]  = "Snare",		-- Earthquake (Glyph of Unstable Earth)
	[8034]   = "Snare",		-- Frostbrand Attack
	[8056]   = "Snare",		-- Frost Shock
	[51490]  = "Snare",		-- Thunderstorm
	[8178]   = "ImmuneSpell",	-- Grounding Totem Effect (Grounding Totem)
	-- Shaman Primal Earth Elemental
	[118345] = "CC",		-- Pulverize
	-- Warlock
	[710]    = "CC",		-- Banish
	[137143] = "CC",		-- Blood Horror
	[54786]  = "CC",		-- Demonic Leap (Metamorphosis)
	[5782]   = "CC",		-- Fear
	[118699] = "CC",		-- Fear
	[130616] = "CC",		-- Fear (Glyph of Fear)
	[5484]   = "CC",		-- Howl of Terror
	[22703]  = "CC",		-- Infernal Awakening
	[6789]   = "CC",		-- Mortal Coil
	[132412] = "CC",		-- Seduction (Grimoire of Sacrifice)
	[30283]  = "CC",		-- Shadowfury
	[104045] = "CC",		-- Sleep (Metamorphosis)
	[132409] = "Silence",		-- Spell Lock (Grimoire of Sacrifice)
	[31117]  = "Silence",		-- Unstable Affliction
	[18223]  = "Snare",		-- Curse of Exhaustion
	[47960]  = "Snare",		-- Shadowflame
	[110913] = "Other",		-- Dark Bargain
	[104773] = "Other",		-- Unending Resolve
	-- Warlock Pets
	[89766]  = "CC",		-- Axe Toss (Felguard/Wrathguard)
	[115268] = "CC",		-- Mesmerize (Shivarra)
	[6358]   = "CC",		-- Seduction (Succubus)
	[115782] = "Silence",		-- Optical Blast (Observer)
	[24259]  = "Silence",		-- Spell Lock (Felhunter)
	[118093] = "Disarm",		-- Disarm (Voidwalker/Voidlord)
	-- Warrior
	[7922]   = "CC",		-- Charge Stun
	[118895] = "CC",		-- Dragon Roar
	[5246]   = "CC",		-- Intimidating Shout (aoe)
	[20511]  = "CC",		-- Intimidating Shout (targeted)
	[132168] = "CC",		-- Shockwave
	[107570] = "CC",		-- Storm Bolt
	[132169] = "CC",		-- Storm Bolt
	[18498]  = "Silence",		-- Silenced - Gag Order (PvE only)
	[676]    = "Disarm",		-- Disarm
	[107566] = "Root",		-- Staggering Shout
	[105771] = "Root",		-- Warbringer
	[147531] = "Snare",		-- Bloodbath
	[1715]   = "Snare",		-- Hamstring
	[12323]  = "Snare",		-- Piercing Howl
	[129923] = "Snare",		-- Sluggish (Glyph of Hindering Strikes)
	[137637] = "Snare",		-- Warbringer
	[46924]  = "Immune",		-- Bladestorm
	[23920]  = "ImmuneSpell",	-- Spell Reflection
	[114028] = "ImmuneSpell",	-- Mass Spell Reflection
	[18499]  = "Other",		-- Berserker Rage
	-- Other
	[30217]  = "CC",		-- Adamantite Grenade
	[67769]  = "CC",		-- Cobalt Frag Bomb
	[30216]  = "CC",		-- Fel Iron Bomb
	[107079] = "CC",		-- Quaking Palm
	[13327]  = "CC",		-- Reckless Charge
	[20549]  = "CC",		-- War Stomp
	[25046]  = "Silence",		-- Arcane Torrent (Energy)
	[28730]  = "Silence",		-- Arcane Torrent (Mana)
	[50613]  = "Silence",		-- Arcane Torrent (Runic Power)
	[69179]  = "Silence",		-- Arcane Torrent (Rage)
	[80483]  = "Silence",		-- Arcane Torrent (Focus)
	[129597] = "Silence",		-- Arcane Torrent (Chi)
	[39965]  = "Root",		-- Frost Grenade
	[55536]  = "Root",		-- Frostweave Net
	[13099]  = "Root",		-- Net-o-Matic
	[1604]   = "Snare",		-- Dazed
	-- PvE
	--[123456] = "PvE",		-- This is just an example, not a real spell
}

if debug then
	for k in pairs(spellIds) do
		local name, _, icon = GetSpellInfo(k)
		if not name then print(addonName, ": No spell name", k) end
		if not icon then print(addonName, ": No spell icon", k) end
	end
end

-------------------------------------------------------------------------------
-- Global references for attaching icons to various unit frames
local anchors = {
	None = {}, -- empty but necessary
	Blizzard = {
		player = "PlayerPortrait",
		pet    = "PetPortrait",
		target = "TargetFramePortrait",
		focus  = "FocusFramePortrait",
		party1 = "PartyMemberFrame1Portrait",
		party2 = "PartyMemberFrame2Portrait",
		party3 = "PartyMemberFrame3Portrait",
		party4 = "PartyMemberFrame4Portrait",
		--party1pet = "PartyMemberFrame1PetFramePortrait",
		--party2pet = "PartyMemberFrame2PetFramePortrait",
		--party3pet = "PartyMemberFrame3PetFramePortrait",
		--party4pet = "PartyMemberFrame4PetFramePortrait",
		arena1 = "ArenaEnemyFrame1ClassPortrait",
		arena2 = "ArenaEnemyFrame2ClassPortrait",
		arena3 = "ArenaEnemyFrame3ClassPortrait",
		arena4 = "ArenaEnemyFrame4ClassPortrait",
		arena5 = "ArenaEnemyFrame5ClassPortrait",
	},
	Perl = {
		player = "Perl_Player_Portrait",
		pet    = "Perl_Player_Pet_Portrait",
		target = "Perl_Target_Portrait",
		focus  = "Perl_Focus_Portrait",
		party1 = "Perl_Party_MemberFrame1_Portrait",
		party2 = "Perl_Party_MemberFrame2_Portrait",
		party3 = "Perl_Party_MemberFrame3_Portrait",
		party4 = "Perl_Party_MemberFrame4_Portrait",
	},
	XPerl = {
		player = "XPerl_PlayerportraitFrameportrait",
		pet    = "XPerl_Player_PetportraitFrameportrait",
		target = "XPerl_TargetportraitFrameportrait",
		focus  = "XPerl_FocusportraitFrameportrait",
		party1 = "XPerl_party1portraitFrameportrait",
		party2 = "XPerl_party2portraitFrameportrait",
		party3 = "XPerl_party3portraitFrameportrait",
		party4 = "XPerl_party4portraitFrameportrait",
	},
	LUI = {
		player = "oUF_LUI_player",
		pet    = "oUF_LUI_pet",
		target = "oUF_LUI_target",
		focus  = "oUF_LUI_focus",
		party1 = "oUF_LUI_partyUnitButton1",
		party2 = "oUF_LUI_partyUnitButton2",
		party3 = "oUF_LUI_partyUnitButton3",
		party4 = "oUF_LUI_partyUnitButton4",
	},
	SyncFrames = {
		arena1 = "SyncFrame1Class",
		arena2 = "SyncFrame2Class",
		arena3 = "SyncFrame3Class",
		arena4 = "SyncFrame4Class",
		arena5 = "SyncFrame5Class",
	},
	--SUF = {
	--	player = SUFUnitplayer.portraitModel.portrait,
	--	pet    = SUFUnitpet.portraitModel.portrait,
	--	target = SUFUnittarget.portraitModel.portrait,
	--	focus  = SUFUnitfocus.portraitModel.portrait,
	--	party1 = SUFUnitparty1.portraitModel.portrait, -- SUFHeaderpartyUnitButton1 ?
	--	party2 = SUFUnitparty2.portraitModel.portrait,
	--	party3 = SUFUnitparty3.portraitModel.portrait,
	--	party4 = SUFUnitparty4.portraitModel.portrait,
	--},
	-- more to come here?
}

-------------------------------------------------------------------------------
-- Default settings
local DBdefaults = {
	version = 5.2, -- This is the settings version, not necessarily the same as the LoseControl version
	noCooldownCount = false,
	disablePartyInBG = false,
	disableArenaInBG = true,
	priority = {		-- higher numbers have more priority; 0 = disabled
		PvE		= 90,
		Immune		= 80,
		ImmuneSpell	= 70,
		CC		= 60,
		Silence		= 50,
		Disarm		= 40,
		Other		= 0,
		Root		= 0,
		Snare		= 0,
	},
	frames = {
		player = {
			enabled = true,
			size = 36,
			alpha = 1,
			anchor = "None",
		},
		pet = {
			enabled = true,
			size = 36,
			alpha = 1,
			anchor = "Blizzard",
		},
		target = {
			enabled = true,
			size = 56,
			alpha = 1,
			anchor = "Blizzard",
		},
		focus = {
			enabled = true,
			size = 56,
			alpha = 1,
			anchor = "Blizzard",
		},
		party1 = {
			enabled = true,
			size = 36,
			alpha = 1,
			anchor = "Blizzard",
		},
		party2 = {
			enabled = true,
			size = 36,
			alpha = 1,
			anchor = "Blizzard",
		},
		party3 = {
			enabled = true,
			size = 36,
			alpha = 1,
			anchor = "Blizzard",
		},
		party4 = {
			enabled = true,
			size = 36,
			alpha = 1,
			anchor = "Blizzard",
		},
		arena1 = {
			enabled = true,
			size = 28,
			alpha = 1,
			anchor = "Blizzard",
		},
		arena2 = {
			enabled = true,
			size = 28,
			alpha = 1,
			anchor = "Blizzard",
		},
		arena3 = {
			enabled = true,
			size = 28,
			alpha = 1,
			anchor = "Blizzard",
		},
		arena4 = {
			enabled = true,
			size = 28,
			alpha = 1,
			anchor = "Blizzard",
		},
		arena5 = {
			enabled = true,
			size = 28,
			alpha = 1,
			anchor = "Blizzard",
		},
	},
}
local LoseControlDB -- local reference to the addon settings. this gets initialized when the ADDON_LOADED event fires

-------------------------------------------------------------------------------
-- Create the main class
local LoseControl = CreateFrame("Cooldown", nil, UIParent) -- Exposes the SetCooldown method

function LoseControl:OnEvent(event, ...) -- functions created in "object:method"-style have an implicit first parameter of "self", which points to object
	self[event](self, ...) -- route event parameters to LoseControl:event methods
end
LoseControl:SetScript("OnEvent", LoseControl.OnEvent)

-- Utility function to handle registering for unit events
function LoseControl:RegisterUnitEvents(enabled)
	local unitId = self.unitId
	if debug then print("RegisterUnitEvents", unitId, enabled) end
	if enabled then
		self:RegisterUnitEvent("UNIT_AURA", unitId)
		if unitId == "target" then
			self:RegisterEvent("PLAYER_TARGET_CHANGED")
		elseif unitId == "focus" then
			self:RegisterEvent("PLAYER_FOCUS_CHANGED")
		elseif unitId == "pet" then
			self:RegisterUnitEvent("UNIT_PET", "player")
		end
	else
		self:UnregisterEvent("UNIT_AURA")
		if unitId == "target" then
			self:UnregisterEvent("PLAYER_TARGET_CHANGED")
		elseif unitId == "focus" then
			self:UnregisterEvent("PLAYER_FOCUS_CHANGED")
		elseif unitId == "pet" then
			self:UnregisterEvent("UNIT_PET")
		end
	end
end

-- Handle default settings
function LoseControl:ADDON_LOADED(arg1)
	if arg1 == addonName then
		if _G.LoseControlDB and _G.LoseControlDB.version then
			if _G.LoseControlDB.version < DBdefaults.version then
				if _G.LoseControlDB.version == 5.1 then -- upgrade gracefully
					_G.LoseControlDB.disableArenaInBG = DBdefaults.disableArenaInBG
				else
					_G.LoseControlDB = CopyTable(DBdefaults)
					print(L["LoseControl reset."])
				end
			end
		else -- never installed before
			_G.LoseControlDB = CopyTable(DBdefaults)
			print(L["LoseControl reset."])
		end
		LoseControlDB = _G.LoseControlDB
		self.noCooldownCount = LoseControlDB.noCooldownCount
	end
end
LoseControl:RegisterEvent("ADDON_LOADED")

-- Initialize a frame's position and register for events
function LoseControl:PLAYER_ENTERING_WORLD() -- this correctly anchors enemy arena frames that aren't created until you zone into an arena
	local unitId = self.unitId
	self.frame = LoseControlDB.frames[unitId] -- store a local reference to the frame's settings
	local frame = self.frame
	local inInstance, instanceType = IsInInstance()
	self:RegisterUnitEvents(
		frame.enabled and not (
			inInstance and instanceType == "pvp" and (
				( LoseControlDB.disablePartyInBG and string.find(unitId, "party") ) or
				( LoseControlDB.disableArenaInBG and string.find(unitId, "arena") )
			)
		)
	)
	self.anchor = _G[anchors[frame.anchor][unitId]] or UIParent
	self:SetParent(self.anchor:GetParent()) -- or LoseControl) -- If Hide() is called on the parent frame, its children are hidden too. This also sets the frame strata to be the same as the parent's.
	--self:SetFrameStrata(frame.strata or "LOW")
	self:ClearAllPoints() -- if we don't do this then the frame won't always move
	self:SetWidth(frame.size)
	self:SetHeight(frame.size)
	self:SetPoint(
		frame.point or "CENTER",
		self.anchor,
		frame.relativePoint or "CENTER",
		frame.x or 0,
		frame.y or 0
	)
	--self:SetAlpha(frame.alpha) -- doesn't seem to work; must manually set alpha after the cooldown is displayed, otherwise it doesn't apply.
	self:Hide()
end

-- This is the main event. Check for (de)buffs and update the frame icon and cooldown.
function LoseControl:UNIT_AURA(unitId) -- fired when a (de)buff is gained/lost
	if not self.anchor:IsVisible() then return end

	local priority = LoseControlDB.priority
	local maxPriority = 1
	local maxExpirationTime = 0
	local Icon, Duration

	-- Check debuffs
	for i = 1, 40 do
		local name, _, icon, _, _, duration, expirationTime, _, _, _, spellId = UnitAura(unitId, i, "HARMFUL")
		if not spellId then break end -- no more debuffs, terminate the loop
		if debug then print(unitId, "debuff", i, ")", name, "|", duration, "|", expirationTime, "|", spellId) end

		-- exceptions
		if spellId == 88611 and unitId ~= "player" then -- Smoke Bomb
			expirationTime = GetTime() + 1 -- normal expirationTime = 0
		elseif spellId == 81261  -- Solar Beam
		    or spellId == 127797 -- Ursol's Vortex
		then
			expirationTime = GetTime() + 1 -- normal expirationTime = 0
		end

		local Priority = priority[spellIds[spellId]]
		if Priority then
			if Priority == maxPriority and expirationTime > maxExpirationTime then
				maxExpirationTime = expirationTime
				Duration = duration
				Icon = icon
			elseif Priority > maxPriority then
				maxPriority = Priority
				maxExpirationTime = expirationTime
				Duration = duration
				Icon = icon
			end
		end
	end

	-- Check buffs
	if unitId ~= "player" and (priority.Immune > 0 or priority.ImmuneSpell > 0 or priority.Other > 0) then
		for i = 1, 40 do
			local name, _, icon, _, _, duration, expirationTime, _, _, _, spellId = UnitAura(unitId, i) -- defaults to "HELPFUL" filter
			if not spellId then break end
			if debug then print(unitId, "buff", i, ")", name, "|", duration, "|", expirationTime, "|", spellId) end

			-- exceptions
			if spellId == 8178 then -- Grounding Totem Effect
				expirationTime = GetTime() + 15 -- hack, normal expirationTime = 0
			end

			local Priority = priority[spellIds[spellId]]
			if Priority then
				if Priority == maxPriority and expirationTime > maxExpirationTime then
					maxExpirationTime = expirationTime
					Duration = duration
					Icon = icon
				elseif Priority > maxPriority then
					maxPriority = Priority
					maxExpirationTime = expirationTime
					Duration = duration
					Icon = icon
				end
			end
		end
	end

	if maxExpirationTime == 0 then -- no (de)buffs found
		self.maxExpirationTime = 0
		if self.anchor ~= UIParent and self.drawlayer then
			self.anchor:SetDrawLayer(self.drawlayer) -- restore the original draw layer
		end
		self:Hide()
	elseif maxExpirationTime ~= self.maxExpirationTime then -- this is a different (de)buff, so initialize the cooldown
		self.maxExpirationTime = maxExpirationTime
		if self.anchor ~= UIParent then
			self:SetFrameLevel(self.anchor:GetParent():GetFrameLevel()) -- must be dynamic, frame level changes all the time
			if not self.drawlayer and self.anchor.GetDrawLayer then
				self.drawlayer = self.anchor:GetDrawLayer() -- back up the current draw layer
			end
			if self.drawlayer and self.anchor.SetDrawLayer then
				self.anchor:SetDrawLayer("BACKGROUND") -- Temporarily put the portrait texture below the debuff texture. This is the only reliable method I've found for keeping the debuff texture visible with the cooldown spiral on top of it.
			end
		end
		if self.frame.anchor == "Blizzard" then
			SetPortraitToTexture(self.texture, Icon) -- Sets the texture to be displayed from a file applying a circular opacity mask making it look round like portraits. TO DO: mask the cooldown frame somehow so the corners don't stick out of the portrait frame. Maybe apply a circular alpha mask in the OVERLAY draw layer.
		else
			self.texture:SetTexture(Icon)
		end
		self:Show()
		if Duration > 0 then
			self:SetCooldown( maxExpirationTime - Duration, Duration )
		end
		--UIFrameFadeOut(self, Duration, self.frame.alpha, 0)
		self:SetAlpha(self.frame.alpha) -- hack to apply transparency to the cooldown timer
	end
end

function LoseControl:PLAYER_FOCUS_CHANGED()
	--if (debug) then print("PLAYER_FOCUS_CHANGED") end
	self:UNIT_AURA("focus")
end

function LoseControl:PLAYER_TARGET_CHANGED()
	--if (debug) then print("PLAYER_TARGET_CHANGED") end
	self:UNIT_AURA("target")
end

function LoseControl:UNIT_PET(unitId)
	--if (debug) then print("UNIT_PET", unitId) end
	self:UNIT_AURA("pet")
end

-- Handle mouse dragging
function LoseControl:StopMoving()
	local frame = LoseControlDB.frames[self.unitId]
	frame.point, frame.anchor, frame.relativePoint, frame.x, frame.y = self:GetPoint()
	if not frame.anchor then
		frame.anchor = "None"
	end
	self.anchor = _G[anchors[frame.anchor][self.unitId]] or UIParent
	self:StopMovingOrSizing()
end

-- Constructor method
function LoseControl:new(unitId)
	local o = CreateFrame("Cooldown", addonName .. unitId) --, UIParent)
	setmetatable(o, self)
	self.__index = self

	-- Init class members
	o.unitId = unitId -- ties the object to a unit
	o.texture = o:CreateTexture(nil, "BORDER") -- displays the debuff; draw layer should equal "BORDER" because cooldown spirals are drawn in the "ARTWORK" layer.
	o.texture:SetAllPoints(o) -- anchor the texture to the frame
	o:SetReverse(true) -- makes the cooldown shade from light to dark instead of dark to light

	o.text = o:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
	o.text:SetText(L[unitId])
	o.text:SetPoint("BOTTOM", o, "BOTTOM")
	o.text:Hide()

	-- Rufio's code to make the frame border pretty. Maybe use this somehow to mask cooldown corners in Blizzard frames.
	--o.overlay = o:CreateTexture(nil, "OVERLAY") -- displays the alpha mask for making rounded corners
	--o.overlay:SetTexture("\\MINIMAP\UI-Minimap-Background")
	--o.overlay:SetTexture("Interface\\AddOns\\LoseControl\\gloss")
	--SetPortraitToTexture(o.overlay, "Textures\\MinimapMask")
	--o.overlay:SetBlendMode("BLEND") -- maybe ALPHAKEY or ADD?
	--o.overlay:SetAllPoints(o) -- anchor the texture to the frame
	--o.overlay:SetPoint("TOPLEFT", -1, 1)
	--o.overlay:SetPoint("BOTTOMRIGHT", 1, -1)
	--o.overlay:SetVertexColor(0.25, 0.25, 0.25)
	o:Hide()

	-- Handle events
	o:SetScript("OnEvent", self.OnEvent)
	o:SetScript("OnDragStart", self.StartMoving) -- this function is already built into the Frame class
	o:SetScript("OnDragStop", self.StopMoving) -- this is a custom function

	o:RegisterEvent("PLAYER_ENTERING_WORLD")

	return o
end

-- Create new object instance for each frame
local LCframes = {}
for k in pairs(DBdefaults.frames) do
	LCframes[k] = LoseControl:new(k)
end

-------------------------------------------------------------------------------
-- Add main Interface Option Panel
local O = addonName .. "OptionsPanel"

local OptionsPanel = CreateFrame("Frame", O)
OptionsPanel.name = addonName

local title = OptionsPanel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
title:SetText(addonName)

local subText = OptionsPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
local notes = GetAddOnMetadata(addonName, "Notes-" .. GetLocale())
if not notes then
	notes = GetAddOnMetadata(addonName, "Notes")
end
subText:SetText(notes)

-- "Unlock" checkbox - allow the frames to be moved
local Unlock = CreateFrame("CheckButton", O.."Unlock", OptionsPanel, "OptionsCheckButtonTemplate")
_G[O.."UnlockText"]:SetText(L["Unlock"])
function Unlock:OnClick()
	if self:GetChecked() then
		_G[O.."UnlockText"]:SetText(L["Unlock"] .. L[" (drag an icon to move)"])
		local keys = {} -- for random icon sillyness
		for k in pairs(spellIds) do
			tinsert(keys, k)
		end
		for k, v in pairs(LCframes) do
			local frame = LoseControlDB.frames[k]
			if frame.enabled and (_G[anchors[frame.anchor][k]] or frame.anchor == "None") then -- only unlock frames whose anchor exists
				v:RegisterUnitEvents(false)
				v.texture:SetTexture(select(3, GetSpellInfo(keys[random(#keys)])))
				v:SetParent(nil) -- detach the frame from its parent or else it won't show if the parent is hidden
				--v:SetFrameStrata(frame.strata or "MEDIUM")
				if v.anchor:GetParent() then
					v:SetFrameLevel(v.anchor:GetParent():GetFrameLevel())
				end
				v.text:Show()
				v:Show()
				v:SetCooldown( GetTime(), 30 )
				v:SetAlpha(frame.alpha) -- hack to apply the alpha to the cooldown timer
				v:SetMovable(true)
				v:RegisterForDrag("LeftButton")
				v:EnableMouse(true)
			end
		end
	else
		_G[O.."UnlockText"]:SetText(L["Unlock"])
		for _, v in pairs(LCframes) do
			v:EnableMouse(false)
			v:RegisterForDrag()
			v:SetMovable(false)
			v.text:Hide()
			v:PLAYER_ENTERING_WORLD()
		end
	end
end
Unlock:SetScript("OnClick", Unlock.OnClick)

local DisableCooldownCount = CreateFrame("CheckButton", O.."DisableCooldownCount", OptionsPanel, "OptionsCheckButtonTemplate")
_G[O.."DisableCooldownCountText"]:SetText(L["Disable OmniCC Support"])
DisableCooldownCount:SetScript("OnClick", function(self)
	LoseControlDB.noCooldownCount = self:GetChecked()
	LoseControl.noCooldownCount = LoseControlDB.noCooldownCount
end)

local Priority = OptionsPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
Priority:SetText(L["Priority"])

local PriorityDescription = OptionsPanel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
PriorityDescription:SetText(L["PriorityDescription"])

-------------------------------------------------------------------------------
-- Slider helper function, thanks to Kollektiv
local function CreateSlider(text, parent, low, high, step)
	local name = parent:GetName() .. text
	local slider = CreateFrame("Slider", name, parent, "OptionsSliderTemplate")
	slider:SetWidth(160)
	slider:SetMinMaxValues(low, high)
	slider:SetValueStep(step)
	--_G[name .. "Text"]:SetText(text)
	_G[name .. "Low"]:SetText(low)
	_G[name .. "High"]:SetText(high)
	return slider
end

local PrioritySlider = {}
for k in pairs(DBdefaults.priority) do
	PrioritySlider[k] = CreateSlider(L[k], OptionsPanel, 0, 100, 10)
	PrioritySlider[k]:SetScript("OnValueChanged", function(self, value)
		_G[self:GetName() .. "Text"]:SetText(L[k] .. " (" .. value .. ")")
		LoseControlDB.priority[k] = value
	end)
end

-------------------------------------------------------------------------------
-- Arrange all the options neatly
title:SetPoint("TOPLEFT", 16, -16)
subText:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -8)

Unlock:SetPoint("TOPLEFT", subText, "BOTTOMLEFT", 0, -16)
DisableCooldownCount:SetPoint("TOPLEFT", Unlock, "BOTTOMLEFT", 0, -2)

Priority:SetPoint("TOPLEFT", DisableCooldownCount, "BOTTOMLEFT", 0, -12)
PriorityDescription:SetPoint("TOPLEFT", Priority, "BOTTOMLEFT", 0, -8)
PrioritySlider.PvE:SetPoint("TOPLEFT", PriorityDescription, "BOTTOMLEFT", 0, -24)
PrioritySlider.Immune:SetPoint("TOPLEFT", PrioritySlider.PvE, "BOTTOMLEFT", 0, -24)
PrioritySlider.ImmuneSpell:SetPoint("TOPLEFT", PrioritySlider.Immune, "BOTTOMLEFT", 0, -24)
PrioritySlider.CC:SetPoint("TOPLEFT", PrioritySlider.ImmuneSpell, "BOTTOMLEFT", 0, -24)
PrioritySlider.Silence:SetPoint("TOPLEFT", PrioritySlider.CC, "BOTTOMLEFT", 0, -24)
PrioritySlider.Disarm:SetPoint("TOPLEFT", PrioritySlider.Silence, "BOTTOMLEFT", 0, -24)
PrioritySlider.Root:SetPoint("TOPLEFT", PrioritySlider.Disarm, "BOTTOMLEFT", 0, -24)
PrioritySlider.Snare:SetPoint("TOPLEFT", PrioritySlider.Root, "BOTTOMLEFT", 0, -24)
PrioritySlider.Other:SetPoint("TOPLEFT", PrioritySlider.Snare, "BOTTOMLEFT", 0, -24)

-------------------------------------------------------------------------------
OptionsPanel.default = function() -- This method will run when the player clicks "defaults".
	_G.LoseControlDB = nil
	LoseControl:ADDON_LOADED(addonName)
	for _, v in pairs(LCframes) do
		v:PLAYER_ENTERING_WORLD()
	end
end

OptionsPanel.refresh = function() -- This method will run when the Interface Options frame calls its OnShow function and after defaults have been applied via the panel.default method described above.
	DisableCooldownCount:SetChecked(LoseControlDB.noCooldownCount)
	local priority = LoseControlDB.priority
	for k in pairs(priority) do
		PrioritySlider[k]:SetValue(priority[k])
	end
end

InterfaceOptions_AddCategory(OptionsPanel)

-------------------------------------------------------------------------------
-- DropDownMenu helper function
local function AddItem(owner, text, value)
	local info = UIDropDownMenu_CreateInfo()
	info.owner = owner
	info.func = owner.OnClick
	info.text = text
	info.value = value
	info.checked = nil -- initially set the menu item to being unchecked
	UIDropDownMenu_AddButton(info)
end

-------------------------------------------------------------------------------
-- Create sub-option frames
for _, v in ipairs({ "player", "pet", "target", "focus", "party", "arena" }) do
	local OptionsPanelFrame = CreateFrame("Frame", O..v)
	OptionsPanelFrame.parent = addonName
	OptionsPanelFrame.name = L[v]

	local AnchorDropDownLabel = OptionsPanelFrame:CreateFontString(O..v.."AnchorDropDownLabel", "ARTWORK", "GameFontNormal")
	AnchorDropDownLabel:SetText(L["Anchor"])
	local AnchorDropDown = CreateFrame("Frame", O..v.."AnchorDropDown", OptionsPanelFrame, "UIDropDownMenuTemplate")
	function AnchorDropDown:OnClick()
		UIDropDownMenu_SetSelectedValue(AnchorDropDown, self.value)
		local frames = { v }
		if v == "party" then
			frames = { "party1", "party2", "party3", "party4" }
		elseif v == "arena" then
			frames = { "arena1", "arena2", "arena3", "arena4", "arena5" }
		end
		for _, unitId in ipairs(frames) do
			local frame = LoseControlDB.frames[unitId]
			local icon = LCframes[unitId]

			frame.anchor = self.value
			if AnchorDropDown.value ~= "None" then -- reset the frame position so it centers on the anchor frame
				frame.point = nil
				frame.relativePoint = nil
				frame.x = nil
				frame.y = nil
			end

			icon.anchor = _G[anchors[frame.anchor][unitId]] or UIParent

			if not Unlock:GetChecked() then -- prevents the icon from disappearing if the frame is currently hidden
				icon:SetParent(icon.anchor:GetParent())
			end

			icon:ClearAllPoints() -- if we don't do this then the frame won't always move
			icon:SetPoint(
				frame.point or "CENTER",
				icon.anchor,
				frame.relativePoint or "CENTER",
				frame.x or 0,
				frame.y or 0
			)
		end
	end

	local SizeSlider = CreateSlider(L["Icon Size"], OptionsPanelFrame, 16, 512, 4)
	SizeSlider:SetScript("OnValueChanged", function(self, value)
		_G[self:GetName() .. "Text"]:SetText(L["Icon Size"] .. " (" .. value .. "px)")
		local frames = { v }
		if v == "party" then
			frames = { "party1", "party2", "party3", "party4" }
		elseif v == "arena" then
			frames = { "arena1", "arena2", "arena3", "arena4", "arena5" }
		end
		for _, frame in ipairs(frames) do
			LoseControlDB.frames[frame].size = value
			LCframes[frame]:SetWidth(value)
			LCframes[frame]:SetHeight(value)
		end
	end)

	local AlphaSlider = CreateSlider(L["Opacity"], OptionsPanelFrame, 0, 100, 5) -- I was going to use a range of 0 to 1 but Blizzard's slider chokes on decimal values
	AlphaSlider:SetScript("OnValueChanged", function(self, value)
		_G[self:GetName() .. "Text"]:SetText(L["Opacity"] .. " (" .. value .. "%)")
		local frames = { v }
		if v == "party" then
			frames = { "party1", "party2", "party3", "party4" }
		elseif v == "arena" then
			frames = { "arena1", "arena2", "arena3", "arena4", "arena5" }
		end
		for _, frame in ipairs(frames) do
			LoseControlDB.frames[frame].alpha = value / 100 -- the real alpha value
			LCframes[frame]:SetAlpha(value / 100)
		end
	end)

	local DisableInBG
	if v == "party" then
		DisableInBG = CreateFrame("CheckButton", O..v.."DisableInBG", OptionsPanelFrame, "OptionsCheckButtonTemplate")
		_G[O..v.."DisableInBGText"]:SetText(L["DisableInBG"])
		DisableInBG:SetScript("OnClick", function(self)
			LoseControlDB.disablePartyInBG = self:GetChecked()
			if not Unlock:GetChecked() then -- prevents the icon from disappearing if the frame is currently hidden
				for i = 1, 4 do
					LCframes[v .. i]:PLAYER_ENTERING_WORLD()
				end
			end
		end)
	elseif v == "arena" then
		DisableInBG = CreateFrame("CheckButton", O..v.."DisableInBG", OptionsPanelFrame, "OptionsCheckButtonTemplate")
		_G[O..v.."DisableInBGText"]:SetText(L["DisableInBG"])
		DisableInBG:SetScript("OnClick", function(self)
			LoseControlDB.disableArenaInBG = self:GetChecked()
			if not Unlock:GetChecked() then -- prevents the icon from disappearing if the frame is currently hidden
				for i = 1, 5 do
					LCframes[v .. i]:PLAYER_ENTERING_WORLD()
				end
			end
		end)
	end

	local Enabled = CreateFrame("CheckButton", O..v.."Enabled", OptionsPanelFrame, "OptionsCheckButtonTemplate")
	_G[O..v.."EnabledText"]:SetText(L["Enabled"])
	Enabled:SetScript("OnClick", function(self)
		local enabled = self:GetChecked()
		if enabled then
			if DisableInBG then BlizzardOptionsPanel_CheckButton_Enable(DisableInBG) end
			BlizzardOptionsPanel_Slider_Enable(SizeSlider)
			BlizzardOptionsPanel_Slider_Enable(AlphaSlider)
		else
			if DisableInBG then BlizzardOptionsPanel_CheckButton_Disable(DisableInBG) end
			BlizzardOptionsPanel_Slider_Disable(SizeSlider)
			BlizzardOptionsPanel_Slider_Disable(AlphaSlider)
		end
		local frames = { v }
		if v == "party" then
			frames = { "party1", "party2", "party3", "party4" }
		elseif v == "arena" then
			frames = { "arena1", "arena2", "arena3", "arena4", "arena5" }
		end
		for _, frame in ipairs(frames) do
			LoseControlDB.frames[frame].enabled = enabled
			LCframes[frame]:RegisterUnitEvents(enabled)
		end
	end)

	Enabled:SetPoint("TOPLEFT", 16, -32)
	if DisableInBG then DisableInBG:SetPoint("TOPLEFT", Enabled, 200, 0) end
	SizeSlider:SetPoint("TOPLEFT", Enabled, "BOTTOMLEFT", 0, -32)
	AlphaSlider:SetPoint("TOPLEFT", SizeSlider, "BOTTOMLEFT", 0, -32)
	AnchorDropDownLabel:SetPoint("TOPLEFT", AlphaSlider, "BOTTOMLEFT", 0, -12)
	AnchorDropDown:SetPoint("TOPLEFT", AnchorDropDownLabel, "BOTTOMLEFT", 0, -8)

	OptionsPanelFrame.default = OptionsPanel.default
	OptionsPanelFrame.refresh = function()
		local unitId = v
		if unitId == "party" then
			DisableInBG:SetChecked(LoseControlDB.disablePartyInBG)
			unitId = "party1"
		elseif unitId == "arena" then
			DisableInBG:SetChecked(LoseControlDB.disableArenaInBG)
			unitId = "arena1"
		end
		local frame = LoseControlDB.frames[unitId]
		Enabled:SetChecked(frame.enabled)
		if frame.enabled then
			if DisableInBG then BlizzardOptionsPanel_CheckButton_Enable(DisableInBG) end
			BlizzardOptionsPanel_Slider_Enable(SizeSlider)
			BlizzardOptionsPanel_Slider_Enable(AlphaSlider)
		else
			if DisableInBG then BlizzardOptionsPanel_CheckButton_Disable(DisableInBG) end
			BlizzardOptionsPanel_Slider_Disable(SizeSlider)
			BlizzardOptionsPanel_Slider_Disable(AlphaSlider)
		end
		SizeSlider:SetValue(frame.size)
		AlphaSlider:SetValue(frame.alpha * 100)
		UIDropDownMenu_Initialize(AnchorDropDown, function() -- called on refresh and also every time the drop down menu is opened
			AddItem(AnchorDropDown, L["None"], "None")
			AddItem(AnchorDropDown, "Blizzard", "Blizzard")
			if _G[anchors["Perl"][unitId]] then AddItem(AnchorDropDown, "Perl", "Perl") end
			if _G[anchors["XPerl"][unitId]] then AddItem(AnchorDropDown, "XPerl", "XPerl") end
			if _G[anchors["LUI"][unitId]] then AddItem(AnchorDropDown, "LUI", "LUI") end
			if _G[anchors["SyncFrames"][unitId]] then AddItem(AnchorDropDown, "SyncFrames", "SyncFrames") end
		end)
		UIDropDownMenu_SetSelectedValue(AnchorDropDown, frame.anchor)
	end

	InterfaceOptions_AddCategory(OptionsPanelFrame)
end

-------------------------------------------------------------------------------
SLASH_LoseControl1 = "/lc"
SLASH_LoseControl2 = "/losecontrol"

local SlashCmd = {}
function SlashCmd:help()
	print(addonName, "slash commands:")
	print("    reset [<unit>]")
	print("    lock")
	print("    unlock")
	print("    enable <unit>")
	print("    disable <unit>")
	print("<unit> can be: player, pet, target, focus, party1 ... party4, arena1 ... arena5")
end
function SlashCmd:debug(value)
	if value == "on" then
		debug = true
		print(addonName, "debugging enabled.")
	elseif value == "off" then
		debug = false
		print(addonName, "debugging disabled.")
	end
end
function SlashCmd:reset(unitId)
	if LoseControlDB.frames[unitId] then
		LoseControlDB.frames[unitId] = CopyTable(DBdefaults.frames[unitId])
		LCframes[unitId]:PLAYER_ENTERING_WORLD()
	else
		OptionsPanel.default()
	end
	Unlock:OnClick()
	OptionsPanel.refresh()
end
function SlashCmd:lock()
	Unlock:SetChecked(false)
	Unlock:OnClick()
	print(addonName, "locked.")
end
function SlashCmd:unlock()
	Unlock:SetChecked(true)
	Unlock:OnClick()
	print(addonName, "unlocked.")
end
function SlashCmd:enable(unitId)
	if LCframes[unitId] then
		LoseControlDB.frames[unitId].enabled = true
		LCframes[unitId]:RegisterUnitEvents(true)
		print(addonName, unitId, "frame enabled.")
	end
end
function SlashCmd:disable(unitId)
	if LCframes[unitId] then
		LoseControlDB.frames[unitId].enabled = false
		LCframes[unitId]:RegisterUnitEvents(false)
		print(addonName, unitId, "frame disabled.")
	end
end

SlashCmdList[addonName] = function(cmd)
	local args = {}
	for word in cmd:lower():gmatch("%S+") do
		tinsert(args, word)
	end
	if SlashCmd[args[1]] then
		SlashCmd[args[1]](unpack(args))
	else
		print(addonName, ": Type \"/lc help\" for more options.")
		InterfaceOptionsFrame_OpenToCategory(OptionsPanel)
	end
end
