
local S = minetest.get_translator("skeletons");
  
-- node box {x=0, y=0, z=0}
local node_box = {
    type = "fixed",
    fixed = {
      {-0.0625,-0.125,-0.5,0.0,-0.0625,-0.4375},
      {-0.0625,-0.1875,-0.4375,0.0,-0.125,-0.375},
      {-0.0625,-0.0625,-0.4375,0.0,0.0,-0.125},
      {-0.0625,-0.25,-0.375,0.0,-0.1875,-0.1875},
      {-0.125,-0.125,-0.375,-0.0625,0.0,-0.3125},
      {0.0,-0.125,-0.375,0.0625,0.0,-0.3125},
      {-0.125,-0.5,-0.3125,-0.0625,-0.4375,-0.1875},
      {0.0,-0.5,-0.3125,0.0625,-0.4375,-0.1875},
      {-0.125,-0.1875,-0.3125,-0.0625,-0.125,-0.25},
      {0.0,-0.1875,-0.3125,0.0625,-0.125,-0.25},
      {-0.125,-0.4375,-0.25,-0.0625,-0.375,-0.1875},
      {0.0,-0.4375,-0.25,0.0625,-0.375,-0.1875},
      {-0.0625,-0.1875,-0.25,0.0,-0.125,-0.125},
      {-0.125,-0.125,-0.25,-0.0625,0.0,-0.125},
      {0.0,-0.125,-0.25,0.0625,0.0,-0.125},
      {-0.125,-0.375,-0.1875,-0.0625,-0.25,-0.125},
      {0.0,-0.375,-0.1875,0.0625,-0.25,-0.125},
      {-0.0625,-0.125,-0.1875,0.0,-0.0625,-0.0625},
      {-0.125,-0.25,-0.125,-0.0625,-0.125,-0.0625},
      {0.0,-0.25,-0.125,0.0625,-0.125,-0.0625},
      {-0.125,-0.3125,-0.0625,0.0625,-0.25,0.0},
      {-0.1875,-0.25,-0.0625,-0.125,-0.0625,0.0},
      {0.0625,-0.25,-0.0625,0.125,-0.0625,0.0},
      {-0.125,-0.125,-0.0625,-0.0625,-0.0625,0.0},
      {0.0,-0.125,-0.0625,0.0625,-0.0625,0.0},
      {-0.1875,-0.5,0.0,-0.125,-0.4375,0.1875},
      {0.0625,-0.5,0.0,0.125,-0.4375,0.1875},
      {-0.0625,-0.1875,0.0,0.0,-0.125,0.0625},
      {-0.125,-0.3125,0.0625,0.0625,-0.25,0.125},
      {-0.1875,-0.25,0.0625,-0.125,-0.125,0.125},
      {0.0625,-0.25,0.0625,0.125,-0.125,0.125},
      {-0.125,-0.1875,0.0625,-0.0625,-0.125,0.125},
      {0.0,-0.1875,0.0625,0.0625,-0.125,0.125},
      {0.3125,-0.5,0.125,0.375,-0.4375,0.3125},
      {-0.1875,-0.4375,0.125,-0.125,-0.375,0.1875},
      {0.0625,-0.4375,0.125,0.125,-0.375,0.1875},
      {-0.0625,-0.1875,0.125,0.0,-0.125,0.1875},
      {-0.1875,-0.375,0.1875,-0.125,-0.3125,0.25},
      {0.0625,-0.375,0.1875,0.125,-0.3125,0.25},
      {-0.0625,-0.4375,0.25,0.0,-0.375,0.3125},
      {-0.125,-0.375,0.25,-0.0625,-0.25,0.3125},
      {0.0,-0.375,0.25,0.0625,-0.25,0.3125},
      {-0.0625,-0.25,0.25,0.0,-0.1875,0.3125},
      {0.25,-0.5,0.3125,0.3125,-0.4375,0.375},
      {-0.0625,-0.3125,0.3125,0.0,-0.25,0.375},
      {0.125,-0.5,0.375,0.25,-0.4375,0.4375},
      {0.0625,-0.4375,0.375,0.125,-0.375,0.4375},
      {0.0,-0.375,0.375,0.0625,-0.3125,0.4375},
    },
  }

skeletons.register_skeleton("rat_skeleton", S("rat skeleton"), node_box)

-- add bone drop
if skeletons.have_animal then
  local entity = minetest.registered_entities["mobs_animal:rat"]
  if (not entity) then
    entity = minetest.registered_entities["hades_animals:rat"]
  end

  if entity then
    entity.drops = {
      {name = "skeletons:fresh_rat_skeleton", chance = 1, min = 1, max = 1}
    }
  end
end

