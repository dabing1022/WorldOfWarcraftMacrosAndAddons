# 目标
-  /focus <unit> - 将 focus 设为 unit
-  /targetlasttarget - 将目标设为上一个选取的目标
-  /cleartarget - 取消目前选取的目标
-  /clearfocus - 取消目前选取的 focus
-  /targetenemy - 依序选取最近的敌人为目标
-  /targetfriend - 依序选取最近的友善的人为目标
-  /targetparty - 依序选取最近的 party 队员为目标
-  /targetraid - 依序选取最近的 raid 队员为目标

> `/target`、`/focus` 与 `/startattack` 都可以接受`<unit>`或是`<name>`作为参数，如果没有参数，预设`unit`为`target`。


# 攻击
-  /startattack <unit> - 开啟自动攻击 unit
-  /stopattack - 停止自动攻击

# 动作条
-  /changeactionbar <num> - 切换到 Action Bar 第 num 页 (num=1-6)
-  /swapactionbar <num1> <num2> - 在 num1 页与 num2 页间切换

# 使用技能
-  /cast <spell> 施放技能
-  /stopcasting 取消目前正在施法中的技能
-  /castrandom <spell1>, <spell2>, <spell3>... 随机使用列表中的其中一个技能

# Buffs/Auras
-  /cancelaura <name> name 就是 buff 名称 
 
```js
/cancelaura 水之护盾
```

# 按钮动作:
-  /click <buttonname> <mousebutton> 可以模拟用滑鼠的指定按键使用按钮

```js
/click ActionButton1
```

```js
click ActionButton1 RightButton
```

```js
/click PetActionButton5
```

# Macro 控制
-  /stopmacro 停止执行Macro，通常配合条件是语法使用

```js
/cleartarget
/target 影舞剑馨
/stopmacro [notarget]
/cast 打断
```

# 物品与装备
-  /use <itemname> - 使用指定名称，例: `/use Major Healing Potion`
-  /use <inventoryslot> - 使用指定装备ID，例: `/use 13` 为使用第一个 Trinket
-  /use <bagid> <bagslot> - 使用指定包包的格子裡的物品
-  /equip <itemname> - 装备指定名称的物品
-  /equipslot <inventoryslot> <itemname> - 在指定位置装备指定名称的物品
-  /userandom <item1>, <item2>, <item3>... - 随机使用列表中的其中一个物品

# Inventory Slot 列表:
-  0 = ammo
-  1 = 头 head
-  2 = 项链 neck
-  3 = 肩膀 shoulder
-  4 = 衬衫 shirt
-  5 = 胸 chest
-  6 = 腰带 belt
-  7 = 腿 legs
-  8 = 鞋子 feet
-  9 = 手腕 wrist
-  10 = 手套 gloves
-  11 = 戒指 1 finger 1
-  12 = 戒指 2 finger 2 
-  13 = 饰品 1 (上) trinket 1
-  14 = 饰品 2 (下) trinket 2
-  15 = 披风 back
-  16 = 主手 main hand
-  17 = 副手 off hand
-  18 = 远程 ranged
-  19 = tabard
-  20 = 第1个背包(最右边)
-  21 = 第2个背包
-  22 = 第3个背包
-  23 = 第4个背包(最左边)
