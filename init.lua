

skeletons = {};

local modname = minetest.get_current_modname();
local modpath = minetest.get_modpath(modname);

skeletons.have_bones = minetest.get_modpath("bones");
skeletons.have_animal = minetest.get_modpath("mobs_animal");
if (not skeletons.have_animal) then
  skeletons.have_animal = minetest.get_modpath("hades_animals");
end

dofile(modpath.."/functions.lua")

dofile(modpath.."/player/player_skeleton.lua")
if skeletons.have_bones then
  dofile(modpath.."/player/bones.lua")
end
dofile(modpath.."/player/skulls.lua")

dofile(modpath.."/villager/villager_skeleton.lua")

dofile(modpath.."/mobs_animal/bunny_skeleton.lua")
dofile(modpath.."/mobs_animal/chicken_skeleton.lua")
dofile(modpath.."/mobs_animal/cow_skeleton.lua")
dofile(modpath.."/mobs_animal/kitten_skeleton.lua")
dofile(modpath.."/mobs_animal/panda_skeleton.lua")
dofile(modpath.."/mobs_animal/penguin_skeleton.lua")
dofile(modpath.."/mobs_animal/warthog_skeleton.lua")
dofile(modpath.."/mobs_animal/rat_skeleton.lua")
dofile(modpath.."/mobs_animal/sheep_skeleton.lua")

dofile(modpath.."/mob_horse/horse_skeleton.lua")

