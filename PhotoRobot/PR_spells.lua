local addonName, addon = ...

addon.spellDB = {
   
	-- Higher up = higher display prio
	
	-- immunitys
	"45438",	-- Ice Block  寒冰屏障
	"33786", 	-- Cyclone 旋风
	"642", 		-- Divine Shield 圣盾术
	"1022",		-- Hand of Protection 保护之手
	"19263", 	-- Deterrence 威慑
	"46924",	-- Bladestorm 剑刃风暴


	-- stuns
	"118905",	-- 静电充能
	"77505",	-- 地震术
	"107570",	-- Storm Bolt 风暴之锤
	"105421",	-- 盲目之光
	"115752",	-- 盲目之光	
	"119072",	-- 神圣愤怒
	"31935",	-- 复仇者之盾
	"119381",	-- Leg Sweep 扫堂腿
	"119392",	-- Charging Ox Wave 蛮牛冲
	"122242",	-- Clash (1st debuff on wowhead) 对冲
	"126451",	-- Clash (2nd debuff on wowhead) 对冲2
	"128844",   -- 对冲
	"128845",   -- 对冲
	"128846",   -- 对冲
	"108194",	-- Asphyxiate 窒息
	"102795",	-- Bear Hug 熊抱
	"24394",	-- Intimidation 胁迫
	"117526",	-- Binding Shot 束缚射击
	"408", 		-- Kidney Shot 肾击
	"1833",		-- Cheap Shot 偷袭
	"12809", 	-- Concussion Blow
	"46968", 	-- Shockwave 震荡波
	"853", 		-- Hammer of Justice 制裁之锤
	"105593",	-- Fist of Justice 制裁之拳
	"53570", 	-- Hungering Cold 饥饿之寒
	"61058", 	-- Hungering Cold 饥饿之寒
	"79092", 	-- Hungering Cold 饥饿之寒	
	"85388", 	-- Throwdown
	"44572", 	-- Deep Freeze 深度冻结
	"5211",	 	-- Mighty Bash 蛮力猛击
	"19503", 	-- Scatter Shot 驱散射击
	"30283", 	-- Shadowfury 暗影之怒
	"89605", 	-- Aura of Foreboding
	"89766", 	-- Axe Toss 巨斧投掷
	"22570", 	-- Maim 割碎
	"9005", 	-- Pounce 突袭
	"102546",	-- Pounce (non-stealth) 突袭
	"47481",	-- Gnaw 撕扯
	"1776", 	-- Gouge 凿击
	"6770",		-- Sap 闷棍
	"87195",	-- Paralysis 心灵震爆雕文
	"88625",	-- Holy Word: Chastise  圣言术：罚 
	"90337",	-- Bad Manner (monkey stun) 粗鲁投掷
	"65929",	-- Charge Stun 冲锋昏迷
	"7922", 	-- 战神	
	"105771", 	-- 冲锋	
	"20253", 	-- Intercept 
	"91797", 	-- Monstrous Blow (Gnaw with DT) 蛮兽打击
	"115001", 	-- 冷酷严冬	
	   
	--cc
	"115268",	-- 迷惑
	"107566",	-- Staggering Shout 错愕怒吼
	"114404",	-- Void Tendrils 虚空触须之握
	"113792",	-- Psychic Terror 心灵恐惧
	"105421",	-- Blinding Light 盲目之光
	"115752",	-- 盲目之光	
	"115078",	-- Paralysis 分筋错骨
	"116706",	-- Disable (2x) 金刚震
	"91807", 	-- Shambling Rush (Leap with DT) 蹒跚冲锋
	"87100",	-- Sin and Punishment 罪与罚
	"1513", 	-- Scare Beast 恐吓野兽
	"2637",		-- Hibernate 休眠
	"605", 		-- Mind Control 统御意志
	"64044",	-- Psychic Horror 心灵惊骇
	"2094", 	-- Blind 致盲
	"118", 		-- Polymorph 变形术
	"51514", 	-- Hex 妖术
	"61305", 	-- 变形术: 黑猫
	"28272", 	-- 变形术: 猪
	"61721", 	-- 变形术: 兔子
	"61780", 	-- 变形术: 火鸡
	"28271", 	-- 变形术: 乌龟	
	"6789", 	-- Death Coil 死亡缠绕
	"5246", 	-- Intimidating Shout 破胆怒吼
	"8122",		-- Psychic Scream 心灵尖啸
	"5484", 	-- Howl of Terror 恐惧嚎叫
	"5782",		-- Fear 恐惧
	"6358",		-- Seduction 诱惑
	"1499",		-- Freezing Trap 冰冻陷阱
	"19386",	-- Wyvern Sting 翼龙钉刺
	"20066",	-- Repentance 忏悔
	"339", 		-- Entangling Roots 纠缠根须
	"64803",	-- Entrapment 诱捕
	"122",		-- 冰霜新星	
	"33395",	-- 冰冻术	
	"111340",	-- 寒冰结界	
	"63685",	-- 冰霜之力
	"118345",	-- 粉碎
	"104045",	-- 催眠术	
	"102359",	-- Mass Entanglement 群体缠绕
	"45334",	-- Wild Charge 无法移动
	"128405",	-- Narrow Escape 险境求生
	"99",		-- Disorienting Roar 惊魂咆哮
	"8377", 	-- Earthgrab 陷地
	"31661",	-- Dragon's Breath 龙息术
	"102051",	-- Frostjaw 冰霜之颌
	"16689", 	-- Nature's Grasp 自然之握
	"82691", 	-- Ring of Frost 冰霜之环
	"23694", 	-- Improved Hamstring
	"76780", 	-- Bind Elemental 束缚元素
	"19387", 	-- Entrapment 诱捕
	"9484", 	-- 束缚亡灵
	"30217", 	-- 精金手雷
	"67769", 	-- 钴质破片炸弹
	"30216", 	-- 魔铁炸弹
	"39965", 	-- 冰霜手雷
	"55536", 	-- 霜纹投网
	"13099", 	-- 撒网器
	"107079", 	-- 震山掌	
	
	-- cc immune
	"49039",	-- Lichborne 巫妖之躯
	"53271",	-- Master's Call 主人的召唤
	"115018",	-- Desecrated Ground 邪恶之地
	"1044", 	-- Hand of Freedom 自由之手
	"31224",	-- Cloak of Shadows 暗影斗篷
	"51271",	-- Pillar of Frost 冰霜之柱
	"96267",	-- Glyph of Inner Focus 心灵专注
	"31821", 	-- Aura Mastery 虔诚光环
	"104773", 	-- 不灭决心	
	
	-- dmg reductions 伤害减免
	"110913",	-- Dark Bagrain 黑暗交易
	"122278",	-- Dampen Harm 躯不坏
	"122783",	-- Diffuse Magic 散魔功
	"115308",	-- Elusive Brew 飘渺酒
	"115176",	-- Zen Meditation 禅悟冥想
	"115203",	-- Fortifying Brew 壮胆酒
	"115610",	-- Temporal Shield 时光护盾
	"116888",	-- Shroud of Purgatory 炼狱蔽体
	"106922",	-- Might of Ursoc 乌索克之力
	"48707", 	-- Anti-Magic Shell 反魔法护罩
	"30823", 	-- Shamanistic Rage 萨满之怒
	"33206", 	-- Pain Suppression 痛苦压制
	"47585", 	-- Dispersion 消散
	"871", 		-- Shield Wall 盾墙
	"48792",	-- Icebound Fortitude 冰封之韧
	"498", 		-- Divine Protection 圣佑术
	"22812", 	-- Barkskin 树皮术
	"61336",	-- Survival Instincts 生存本能	
	"5277", 	-- Evasion 闪避
	"74001",	-- Combat Readiness 备战就绪
	"47788",	-- Guardian Spirit 守护之魂
   
	-- silences
	"116705",	-- Spear Hand Strike 切喉手
	"173320",	-- Spear Hand Strike 切喉手	
	"78675",	-- Solar Beam 日光术
	"58357",	-- Glyph of Gag Order 禁令雕文
	"47476", 	-- Strangulate 绞袭
	"1330", 	-- Garrote - Silence 锁喉 - 沉默
	"55021", 	-- Silenced - Improved Counterspell
	"15487", 	-- Silence (priest) 牧师：沉默
	"19647", 	-- Spell Lock 法术封锁
	"34490", 	-- Silencing Shot 沉默射击
	"28730", 	-- Arcane Torrent 奥术洪流
	"31117", 	-- 痛苦无常	
	
	-- disarms
	"64058",	-- Psychic Horror (disarm part) 心灵惊骇
	"117368",	-- Grapple Weapon 探云鞭
	"77606",	-- Dark Simulacrum - "Magic Disarm" ;-) 黑暗模拟
	"676", 		-- Disarm 缴械
	"51722", 	-- Dismantle 拆卸
	
	--dmg buffs  
	"1719",		-- Recklessness 鲁莽
	"12472",	-- Icy Veins 冰冷血脉
	"34692", 	-- The Beast Within 野兽之心
	"31884", 	-- Avenging Wrath 复仇之怒
	"51713", 	-- Shadow Dance 暗影之舞
	
	--helpful buffs 增益BUFFS
	"108212",	-- Burst of Speed 速度爆发
	"112833",	-- Spectral Guise 幽灵伪装
	"116841",	-- Tiger's Lust 迅如猛虎
	"96268",	-- Death's Advance 死亡脚步
	"740",		-- Tranquility 宁静
	"102342",	-- Ironbark 铁木树皮
	"66",		-- Invisibility 隐形术
	"85499",	-- Speed of Light 圣光之速
	"6940", 	-- Hand of Sacrifice 牺牲之手
	"89488", 	-- Strength of Soul 灵魂之力
	"23920", 	-- Spell Reflection (warrior) 法术反射
	"114028", 	-- 群体反射	
	"68992", 	-- Darkflight (Worgen racial) 疾步夜行
	"31642", 	-- Blazing Speed
	"54428", 	-- Divine Plea 神圣恳求
	"2983", 	-- Sprint 疾跑
	"1850", 	-- Dash 急奔
	"29166", 	-- Innervate 激活
	"114239", 	-- 幻隐	
	"77761",	-- Stampeding Roar (bear) 狂奔怒吼
	"77764",	-- Stampeding Roar (cat) 狂奔怒吼
	"106898",	-- Glyph of Stampeding Roar 狂奔怒吼
	"118922",	-- Posthaste 猎人：迅疾如风
	"104773", 	-- 不灭决心	
	"113860", 	-- 黑暗灵魂：哀难
	"113858", 	-- 黑暗灵魂：易爆
	"113861", 	-- 黑暗灵魂：学识	
	"108416", 	-- 牺牲契约	
	"90361", 	-- 灵魂治愈	
	"12043", 	-- 气定神闲	
	"115760", 	-- 寒冰屏障雕文	
	"19574", 	-- 狂野怒火	
	"18499", 	-- 狂暴之怒	
	"69369", 	-- 掠食者的迅捷	
	"45182", 	-- 装死	
}
