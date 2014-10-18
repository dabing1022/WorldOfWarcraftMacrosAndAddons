local addonName, addon = ...

addon.spellDB = {
   
	-- Higher up = higher display prio
	
	-- immunitys
	"45438",	-- Ice Block
	"33786", 	-- Cyclone
	"642", 		-- Divine Shield
	"1022",		-- Hand of Protection
	"19263", 	-- Deterrence
	"46924",	-- Bladestorm


	-- stuns
	"107570",	-- Storm Bolt
	"115752",	-- Glyph of Blinding Light
	"119381",	-- Leg Sweep
	"119392",	-- Charging Ox Wave
	"122242",	-- Clash (1st debuff on wowhead)
	"126451",	-- Clash (2nd debuff on wowhead)
	"108194",	-- Asphyxiate
	"102795",	-- Bear Hug
	"24394",	-- Intimidation
	"117526",	-- Binding Shot
	"408", 		-- Kidney Shot
	"1833",		-- Cheap Shot
	"12809", 	-- Concussion Blow
	"46968", 	-- Shockwave
	"853", 		-- Hammer of Justice
	"105593",	-- Fist of Justice
	"49203", 	-- Hungering Cold
	"85388", 	-- Throwdown
	"44572", 	-- Deep Freeze
	"5211",	 	-- Mighty Bash
	"19503", 	-- Scatter Shot
	"30283", 	-- Shadowfury
	"89605", 	-- Aura of Foreboding
	"89766", 	-- Axe Toss
	"22570", 	-- Maim
	"9005", 	-- Pounce
	"102546",	-- Pounce (non-stealth)
	"47481",	-- Gnaw
	"1776", 	-- Gouge
	"6770",		-- Sap
	"87195",	-- Paralysis
	"88625",	-- Holy Word: Chastise   
	"90337",	-- Bad Manner (monkey stun)
	"65929",	-- Charge Stun
	"20253", 	-- Intercept 
	"91797", 	-- Monstrous Blow (Gnaw with DT)
	   
	--cc
	"107566",	-- Staggering Shout
	"114404",	-- Void Tendrils
	"113792",	-- Psychic Terror
	"105421",	-- Blinding Light
	"115078",	-- Paralysis
	"116706",	-- Disable (2x)
	"91807", 	-- Shambling Rush (Leap with DT)
	"87100",	-- Sin and Punishment
	"1513", 	-- Scare Beast
	"2637",		-- Hibernate
	"605", 		-- Mind Control
	"64044",	-- Psychic Horror
	"2094", 	-- Blind
	"118", 		-- Polymorph
	"51514", 	-- Hex
	"6789", 	-- Death Coil
	"5246", 	-- Intimidating Shout 
	"8122",		-- Psychic Scream
	"5484", 	-- Howl of Terror
	"5782",		-- Fear
	"6358",		-- Seduction
	"1499",		-- Freezing Trap
	"19386",	-- Wyvern Sting
	"20066",	-- Repentance
	"339", 		-- Entangling Roots
	"64803",	-- Entrapment
	"102359",	-- Mass Entanglement
	"45334",	-- Wild Charge
	"128405",	-- Narrow Escape
	"99",		-- Disorienting Roar
	"8377", 	-- Earthgrab
	"31661",	-- Dragon's Breath
	"102051",	-- Frostjaw
	"16689", 	-- Nature's Grasp
	"82691", 	-- Ring of Frost
	"23694", 	-- Improved Hamstring
	"76780", 	-- Bind Elemental
	"19387", 	-- Entrapment
	
	-- cc immune
	"49039",	-- Lichborne
	"53271",	-- Master's Call
	"115018",	-- Desecrated Ground
	"1044", 	-- Hand of Freedom
	"31224",	-- Cloak of Shadows
	"51271",	-- Pillar of Frost
	"96267",	-- Glyph of Inner Focus
	"31821", 	-- Aura Mastery
	
	-- dmg reductions
	"110913",	-- Dark Bagrain
	"122278",	-- Dampen Harm
	"122783",	-- Diffuse Magic
	"115308",	-- Elusive Brew
	"115176",	-- Zen Meditation
	"115203",	-- Fortifying Brew
	"115610",	-- Temporal Shield
	"116888",	-- Shroud of Purgatory
	"106922",	-- Might of Ursoc
	"48707", 	-- Anti-Magic Shell
	"30823", 	-- Shamanistic Rage 
	"33206", 	-- Pain Suppression
	"47585", 	-- Dispersion
	"871", 		-- Shield Wall
	"48792",	-- Icebound Fortitude
	"498", 		-- Divine Protection
	"22812", 	-- Barkskin
	"61336",	-- Survival Instincts	
	"5277", 	-- Evasion
	"74001",	-- Combat Readiness
	"47788",	-- Guardian Spirit
   
	-- silences
	"116709",	-- Spear Hand Strike
	"78675",	-- Solar Beam
	"58357",	-- Glyph of Gag Order
	"47476", 	-- Strangulate
	"1330", 	-- Garrote - Silence
	"55021", 	-- Silenced - Improved Counterspell
	"15487", 	-- Silence (priest)
	"19647", 	-- Spell Lock
	"34490", 	-- Silencing Shot
	"28730", 	-- Arcane Torrent
	
	-- disarms
	"64058",	-- Psychic Horror (disarm part)
	"117368",	-- Grapple Weapon
	"77606",	-- Dark Simulacrum - "Magic Disarm" ;-)
	"676", 		-- Disarm
	"51722", 	-- Dismantle
	
	--dmg buffs  
	"1719",		-- Recklessness
	"12472",	-- Icy Veins
	"34692", 	-- The Beast Within
	"31884", 	-- Avenging Wrath
	"51713", 	-- Shadow Dance 
	
	--helpful buffs
	"108212",	-- Burst of Speed
	"112833",	-- Spectral Guise
	"116841",	-- Tiger's Lust
	"96268",	-- Death's Advance
	"740",		-- Tranquility
	"102342",	-- Ironbark
	"66",		-- Invisibility
	"85499",	-- Speed of Light
	"6940", 	-- Hand of Sacrifice
	"89488", 	-- Strength of Soul
	"23920", 	-- Spell Reflection (warrior)
	"68992", 	-- Darkflight (Worgen racial)
	"31642", 	-- Blazing Speed
	"54428", 	-- Divine Plea
	"2983", 	-- Sprint
	"1850", 	-- Dash
	"29166", 	-- Innervate
	"77761",	-- Stampeding Roar (bear)
	"77764",	-- Stampeding Roar (cat)
	"106898",	-- Glyph of Stampeding Roar
	"118922",	-- Posthaste
}