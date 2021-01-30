

skeletons = {};

local modname = minetest.get_current_modname();
local modpath = minetest.get_modpath(modname);

skeletons.have_animal = minetest.get_modpath("mobs_animal");
if (not skeletons.have_animal) then
  skeletons.have_animal = minetest.get_modpath("hades_animals");
end

dofile(modpath.."/functions.lua")

dofile(modpath.."/player_skeleton.lua")
dofile(modpath.."/villager_skeleton.lua")
dofile(modpath.."/bunny_skeleton.lua")
dofile(modpath.."/chicken_skeleton.lua")
dofile(modpath.."/cow_skeleton.lua")
dofile(modpath.."/kitten_skeleton.lua")
dofile(modpath.."/panda_skeleton.lua")
dofile(modpath.."/penguin_skeleton.lua")
dofile(modpath.."/warthog_skeleton.lua")
dofile(modpath.."/rat_skeleton.lua")
dofile(modpath.."/sheep_skeleton.lua")

dofile(modpath.."/bones.lua")
