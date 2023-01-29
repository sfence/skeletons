
skeletons = {};

local modname = minetest.get_current_modname();
local modpath = minetest.get_modpath(modname);

skeletons.have_bones = minetest.get_modpath("bones") or minetest.get_modpath("hades_bones");
skeletons.have_animal = minetest.get_modpath("mobs_animal");
if (not skeletons.have_animal) then
  skeletons.have_animal = minetest.get_modpath("hades_animals");
end
skeletons.have_horse = minetest.get_modpath("mob_horse");
if (not skeletons.have_horse) then
  skeletons.have_horse = minetest.get_modpath("hades_horse");
end
skeletons.have_animalia = minetest.get_modpath("animalia");
if (not skeletons.have_animalia) then
  skeletons.have_animalia = minetest.get_modpath("hades_animalia");
end

dofile(modpath.."/functions.lua")

dofile(modpath.."/player/player_skeleton.lua")
if skeletons.have_bones then
  dofile(modpath.."/player/bones.lua")
end
dofile(modpath.."/player/skulls.lua")

dofile(modpath.."/villager/villager_skeleton.lua")

dofile(modpath.."/animals/bat_skeleton.lua")
dofile(modpath.."/animals/bird_skeleton.lua")
dofile(modpath.."/animals/bunny_skeleton.lua")
--dofile(modpath.."/animals/cat_skeleton.lua") -- included in kitten
dofile(modpath.."/animals/chicken_skeleton.lua")
dofile(modpath.."/animals/cow_skeleton.lua")
dofile(modpath.."/animals/frog_skeleton.lua")
dofile(modpath.."/animals/horse_skeleton.lua")
dofile(modpath.."/animals/kitten_skeleton.lua")
dofile(modpath.."/animals/panda_skeleton.lua")
dofile(modpath.."/animals/penguin_skeleton.lua")
dofile(modpath.."/animals/pig_skeleton.lua")
dofile(modpath.."/animals/rat_skeleton.lua")
dofile(modpath.."/animals/reindeer_skeleton.lua")
dofile(modpath.."/animals/sheep_skeleton.lua")
dofile(modpath.."/animals/tropical_fish_skeleton.lua")
dofile(modpath.."/animals/turkey_skeleton.lua")
dofile(modpath.."/animals/warthog_skeleton.lua")
dofile(modpath.."/animals/wolf_skeleton.lua")

