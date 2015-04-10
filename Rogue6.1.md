### 闷棍宏

1.

```js
/stopattack
/targetenemy
/focus [@mouseover]
/focus target
/script SetCVar("targetNearestDistance", 41)
/cast [nostealth,nocombat]!潜行;[@mouseover,nohelp,exists][]闷棍
```

### 潜伏帷幕(按之下马，潜行，潜伏帷幕，连续按不会破潜)

```js
#showtooltip 潜伏帷幕
/dismount [mounted] 
/cast !潜行
/cast 潜伏帷幕
```

```js
#showtooltip 暗遁
/cast !潜行
/cast 暗遁
```
你也可以把/cancelaura [stance:3,stealth] 诡诈 这个语句添加到这个宏里

### 致盲宏

1.下宏用于JJC环境，直接盲框体。

```js
#showtooltip 致盲
/cast [target=arena1] 致盲
#showtooltip 致盲
/cast [target=arena2] 致盲
#showtooltip 致盲
/cast [target=arena3] 致盲
```

2.下宏按alt+此键则盲焦点，否则盲鼠标指向目标，再否则盲当前目标；同时上标记，下面宏里的6是蓝色方块

```js
#showtooltip 致盲
/cast [target=focus,harm,exists,modifier:alt]致盲;
/cast [target=mouseover, harm, exists]致盲;
/cast 致盲
/script SetRaidTarget("target",6)
```

主要是让你的队友醒目的知道你盲了，并且盲了哪个。这个宏可能有个缺点，就是标记的可能是当前目标，而你盲的可能不是，经测试不能给敌对玩家上标记，貌似只能用于PVE环境，如挑战模式。

> 0 = 取消图标 
> 1 = 黄色四角星 
> 2 = 桔黄色圆 
> 3 = 紫色钻石 
> 4 = 绿色三角形 
> 5 = 白色月亮 
> 6 = 蓝色方块 
> 7 = 红色X 
> 8 = 骷髅

### 凿击宏

不在战斗就潜行，在战斗就凿击。

```js
#showtooltips 
/cast [nocombat] 潜行;凿击
```

ShortCutKey:Q Alt+Q
```js 
#showtooltips 
/cast [nocombat] 潜行;
/cast [target=focus,harm,exists,modifier:alt][combat] 凿击;
/cast [target=mouseover, harm, exists][combat] 凿击; 凿击
```

### 焦点宏

下为焦点目标和当前目标对调宏

```js
/target [@focus] 
/targetlasttarget
/focus
/targetlasttarget
```


### 伺机待发宏

```js
#showtooltip 伺机待发 
/cast [nostealth] 闪避 
/stopcasting 
/cast 疾跑 
/stopcasting 
/cast 伺机待发
```

技能不浪费宏，施放伺机待发前把能用的基本用掉。潜行状态不施放闪避，防止破潜。另外消失没绑，可自行绑到消失宏里。

### 佯攻

```js
#showtooltip 佯攻
/castsequence reset=3 佯攻,x
```

此宏的意思是，如果你3秒钟不按此宏，则3秒后重置此宏；如果你一直连按，则不重置；适用于经常连打两个佯攻的误操作玩家。

### 打断宏

```js
#脚踢宏#
/cast [target=focus,harm,exists,modifier:alt]脚踢;
/cast [target=mouseover, harm, exists]脚踢; 脚踢
/cast 致命投掷(天赋)
```

### 速度爆发

```js
#showtooltip 速度爆发
/cast 速度爆发
/cast 侦测
```