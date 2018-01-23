-- Basic Options and setup
class = "warrior" -- Change between "warlock", "sp", "frost", "fire"
positionX = 0 -- Change X position of window
positionY = -200 -- Change Y position of window

function checkDebuffs()
  -- Reset debuffs
  ArmorDebuffTool.ff:SetTextColor(1, 0, 0, 1)
  ArmorDebuffTool.ann:SetTextColor(1, 0, 0, 1)
  ArmorDebuffTool.sa:SetTextColor(1, 0, 0, 1)
  ArmorDebuffTool.cor:SetTextColor(1, 0, 0, 1)
  ArmorDebuffTool.baseText:SetText(base .. MinusArmor)
  ArmorDebuffTool:SetBackdropColor(0, 0, 0, 0.5)
  SunderStacks = 0
  ShatterStacks = 0
  --multiplier = 1
  MinusArmor = 1
  --MinusArmor = MinusArmor - 1

  for i=1,16 do local name, stack = UnitDebuff("target", i)
    if name == "Interface\\Icons\\Spell_Nature_FaerieFire" then -- Check for faeriefire
      ArmorDebuffTool.ff:SetTextColor(0, 1, 0, 1)
      --multiplier = multiplier * 1.2
	  MinusArmor = MinusArmor + 505
	  MinusArmor = MinusArmor - 1
    end
    if name == "Interface\\Icons\\inv_axe_12" then -- Check Annajalaijtor stacks
		ShatterStacks = SAstack
		MinusArmor = MinusArmor * (1+200*ShatterStacks)
		MinusArmor = MinusArmor - 1
		if ShatterStacks < 3 then
			ArmorDebuffTool.ann:SetTextColor(1, 1, 0, 1)
		else
			ArmorDebuffTool.ann:SetTextColor(0, 1, 0, 1)
      --ArmorDebuffTool.nf:SetTextColor(0, 1, 0, 1)
      --multiplier = multiplier * 1.15
	  
	  end
    end
    if name == "Interface\\Icons\\Ability_Warrior_Sunder" then -- Check sunders
      SunderStacks = stack
	  MinusArmor = MinusArmor * (1+450*SunderStacks)
	  MinusArmor = MinusArmor - 1
      if SunderStacks < 5 then
        ArmorDebuffTool.sa:SetTextColor(1, 1, 0, 1)
      else
        ArmorDebuffTool.sa:SetTextColor(0, 1, 0, 1)
      
      --multiplier = multiplier * (1+0.03*SunderStacks)
	  
	  end
    end
	if name == "Interface\\Icons\\Spell_Shadow_UnholyStrength" then -- Check curse of reck
      ArmorDebuffTool.cor:SetTextColor(0, 1, 0, 1)
      --multiplier = multiplier * 1.1
	  MinusArmor = MinusArmor + 640
	  MinusArmor = MinusArmor - 1
	end
--MinusArmor = MinusArmor - 1
  --multiplier = (multiplier * 100) - 100
  --multiplier = math.floor(multiplier + 0.5)
  ArmorDebuffTool.baseText:SetText(base .. MinusArmor .."")
  --if multiplier > 100 then
    --ArmorDebuffTool.SetBackdropColor(0, 1, 0, 1)
  --end
  end
  --MinusArmor = MinusArmor - 1
end

local backdrop = {
  bgFile = "Interface\\Icons\\Ability_Warrior_Sunder",
}

base = "Armor reduced:    "
SunderStackstacks = 0
ShatterStacks = 0
MinusArmor = 0
--multiplier = 0

-- Sets up basic frame stuff
ArmorDebuffTool = CreateFrame('Frame')
ArmorDebuffTool:SetFrameStrata("BACKGROUND")
ArmorDebuffTool:SetPoint("CENTER", positionX, positionY)
ArmorDebuffTool:SetWidth(110)
ArmorDebuffTool:SetHeight(50)
ArmorDebuffTool:SetBackdrop(backdrop)
ArmorDebuffTool:SetBackdropColor(0, 0, 0, 0.5)

-- Makes frame draggable


-- "Damage Multiplier"
ArmorDebuffTool.baseText = ArmorDebuffTool:CreateFontString("basetext")
ArmorDebuffTool.baseText:SetPoint("CENTER", ArmorDebuffTool, 0, 10)
ArmorDebuffTool.baseText:SetWidth(ArmorDebuffTool:GetRight() - ArmorDebuffTool:GetLeft() - 10)
ArmorDebuffTool.baseText:SetFont("Interface\\Addons\\ArmorDebuffTool\\Fonts\\arial.TTF", 11)
ArmorDebuffTool.baseText:SetText(base ..  MinusArmor .. "")

-- CoS
ArmorDebuffTool.cor = ArmorDebuffTool:CreateFontString("cor")
ArmorDebuffTool.cor:SetPoint("CENTER", ArmorDebuffTool, "CENTER", -30, -10)
ArmorDebuffTool.cor:SetWidth(ArmorDebuffTool:GetRight() - ArmorDebuffTool:GetLeft() - 10)
ArmorDebuffTool.cor:SetFont("Interface\\Addons\\ArmorDebuffTool\\Fonts\\arial.TTF", 9)
ArmorDebuffTool.cor:SetText("CoR")
ArmorDebuffTool.cor:SetTextColor(1, 0, 0, 1)

-- Shadow Vuln. "SB"
ArmorDebuffTool.ff = ArmorDebuffTool:CreateFontString("ff")
ArmorDebuffTool.ff:SetPoint("CENTER", ArmorDebuffTool, "CENTER", -10, -10)
ArmorDebuffTool.ff:SetWidth(ArmorDebuffTool:GetRight() - ArmorDebuffTool:GetLeft() - 10)
ArmorDebuffTool.ff:SetFont("Interface\\Addons\\ArmorDebuffTool\\Fonts\\arial.TTF", 9)
ArmorDebuffTool.ff:SetText("FF")
ArmorDebuffTool.ff:SetTextColor(1, 0, 0, 1)

-- NightFall
ArmorDebuffTool.ann = ArmorDebuffTool:CreateFontString("ann")
ArmorDebuffTool.ann:SetPoint("CENTER", ArmorDebuffTool, "CENTER", 10, -10)
ArmorDebuffTool.ann:SetWidth(ArmorDebuffTool:GetRight() - ArmorDebuffTool:GetLeft() - 10)
ArmorDebuffTool.ann:SetFont("Interface\\Addons\\ArmorDebuffTool\\Fonts\\arial.TTF", 9)
ArmorDebuffTool.ann:SetText("ANN")
ArmorDebuffTool.ann:SetTextColor(1, 0, 0, 1)

-- Shadow Weaving "SW (X)"
ArmorDebuffTool.sa = ArmorDebuffTool:CreateFontString("sa")
ArmorDebuffTool.sa:SetPoint("CENTER", ArmorDebuffTool, "CENTER", 30, -10)
ArmorDebuffTool.sa:SetWidth(ArmorDebuffTool:GetRight() - ArmorDebuffTool:GetLeft() - 10)
ArmorDebuffTool.sa:SetFont("Interface\\Addons\\ArmorDebuffTool\\Fonts\\arial.TTF", 9)
ArmorDebuffTool.sa:SetText("SA")
ArmorDebuffTool.sa:SetTextColor(1, 0, 0, 1)


ArmorDebuffTool:SetScript('OnEvent', checkDebuffs)
ArmorDebuffTool:RegisterEvent('UNIT_AURA')
ArmorDebuffTool:RegisterEvent('PLAYER_TARGET_CHANGED')

--  TODO
-- Clean up and fix everything
-- Add flashing Icons?

-- List of Things to check for

-- Warlocks: 1*1.2*1.1*1.15*1.15
-- Shadow Vuln: Spell_Shadow_ShadowBolt
-- CoS: Spell_Shadow_CurseOfAchimonde
-- Nightfall: Spell_Holy_ElunesGrace
-- Shadow Weaving (5 stacks):
--

-- Mages:
-- CoE:
-- Nightfall:
-- Winter's Chill (Frost) (5 stacks):
-- Improved Scorch (Fire) (5 stacks):
-- Ignite:
