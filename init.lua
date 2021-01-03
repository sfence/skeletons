

skeletons = {};

local modname = minetest.get_current_modname();
local modpath = minetest.get_modpath(modname);

dofile(modpath.."/functions.lua")

dofile(modpath.."/player_skeleton.lua")
dofile(modpath.."/villager_skeleton.lua")
dofile(modpath.."/bunny_skeleton.lua")
dofile(modpath.."/chicken_skeleton.lua")

dofile(modpath.."/bones.lua")
