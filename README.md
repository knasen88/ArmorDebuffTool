## ArmorDebuffTool
Credit to kevmodrome aka Myakaa, I basically took his addon and with his blessing edited it to support armor debuffs. 
https://github.com/kevmodrome/SpellPowerMulti

Easily get an overview of current -armor debuffs on the target as well as a counter for the amount of armor reduced

The current version checks the following debuffs on target:
* Curse of Recklessness (CoR)
* Faeire Fire (FF)
* Annihilator weapon proc (armor shatter)
* Sunder armor 

The text will turn green when a debuff is active on the target. In the case of Sunder and armor shatter the text will be yellow if there are 1-4 or 1-2 stacks and green when there are 5 or 3 stacks.

## Screenshot

![Image showing the addon in action](https://i.imgur.com/X8oyrF3.png)

## Installation

Clone the repository and extract to Addons folder. Remove "-master" from folder name.

To change settings edit the ArmorDebuffTool.lua file.

If you want to add or remove stuff it's fairly intuitive to do it on your own with the current code.

## Bugs and other stuff

probably plenty

shows 1 armor reduced by default, currently unable to set zero from the start because the addon just breaks then(??)

Might be a few armor wrong, but I should have fixed it now, it will now only be one armor too much if there is no sunder on the target.

try to implement draggable frame somewhere along the path.
Dragging now works, can't save position yet.

As of now simply either drag the addon or edit the position X and Y -- commented away from the beginning of the .lua


