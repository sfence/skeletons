
local S = minetest.get_translator("skeletons");
  
-- node box {x=0, y=0, z=0}
local node_box_front = {
    type = "fixed",
    fixed = {
      {-0.0625,0.375,-0.5,0.0625,0.5,-0.4375},
      {-0.125,0.4375,-0.5,-0.0625,0.5,-0.25},
      {0.0625,0.4375,-0.5,0.125,0.5,-0.25},
      {-0.0625,0.375,-0.4375,0.0625,0.4375,0.0625},
      {-0.125,0.375,-0.25,-0.0625,0.4375,0.0625},
      {0.0625,0.375,-0.25,0.125,0.4375,0.0625},
      {-0.1875,0.4375,-0.25,-0.125,0.5,0.0625},
      {0.125,0.4375,-0.25,0.1875,0.5,0.0625},
      {-0.0625,0.375,0.125,0.0625,0.4375,0.1875},
      {-0.125,0.4375,0.125,-0.0625,0.5,0.1875},
      {0.0625,0.4375,0.125,0.125,0.5,0.1875},
      {-0.4375,-0.5,0.25,-0.375,-0.4375,0.4375},
      {-0.3125,-0.5,0.25,-0.25,-0.4375,0.4375},
      {0.25,-0.5,0.25,0.3125,-0.4375,0.4375},
      {0.375,-0.5,0.25,0.4375,-0.4375,0.4375},
      {-0.375,-0.0625,0.25,-0.3125,0.125,0.3125},
      {0.3125,-0.0625,0.25,0.375,0.125,0.3125},
      {-0.0625,0.25,0.25,0.0625,0.3125,0.3125},
      {-0.1875,0.3125,0.25,-0.0625,0.375,0.3125},
      {0.0625,0.3125,0.25,0.1875,0.375,0.3125},
      {-0.25,0.375,0.25,-0.1875,0.5,0.3125},
      {0.1875,0.375,0.25,0.25,0.5,0.3125},
      {-0.0625,0.4375,0.25,0.0625,0.5,0.3125},
      {-0.375,-0.5,0.3125,-0.3125,-0.4375,0.4375},
      {0.3125,-0.5,0.3125,0.375,-0.4375,0.4375},
      {-0.375,-0.1875,0.3125,-0.3125,0.0,0.375},
      {0.3125,-0.1875,0.3125,0.375,0.0,0.375},
      {-0.375,0.0625,0.3125,-0.3125,0.1875,0.375},
      {0.3125,0.0625,0.3125,0.375,0.1875,0.375},
      {-0.375,-0.4375,0.375,-0.3125,-0.375,0.5},
      {0.3125,-0.4375,0.375,0.375,-0.375,0.5},
      {-0.375,-0.3125,0.375,-0.3125,-0.125,0.4375},
      {0.3125,-0.3125,0.375,0.375,-0.125,0.4375},
      {-0.375,0.125,0.375,-0.3125,0.25,0.4375},
      {0.3125,0.125,0.375,0.375,0.25,0.4375},
      {-0.125,0.1875,0.375,0.125,0.25,0.4375},
      {-0.25,0.25,0.375,-0.125,0.3125,0.4375},
      {0.125,0.25,0.375,0.25,0.3125,0.4375},
      {-0.3125,0.3125,0.375,-0.25,0.5,0.4375},
      {0.25,0.3125,0.375,0.3125,0.5,0.4375},
      {-0.375,0.4375,0.375,-0.3125,0.5,0.5},
      {0.3125,0.4375,0.375,0.375,0.5,0.5},
      {-0.375,-0.375,0.4375,-0.3125,-0.25,0.5},
      {0.3125,-0.375,0.4375,0.375,-0.25,0.5},
      {-0.375,0.1875,0.4375,-0.3125,0.3125,0.5},
      {0.3125,0.1875,0.4375,0.375,0.3125,0.5},
      {-0.375,0.375,0.4375,-0.3125,0.4375,0.5},
      {0.3125,0.375,0.4375,0.375,0.4375,0.5},
    },
  }
-- node box {x=0, y=0, z=1}
local node_box_back = {
    type = "fixed",
    fixed = {
      {-0.125,0.1875,-0.5,0.125,0.25,-0.4375},
      {-0.375,0.25,-0.5,-0.3125,0.4375,-0.4375},
      {-0.25,0.25,-0.5,-0.125,0.3125,-0.4375},
      {0.125,0.25,-0.5,0.25,0.3125,-0.4375},
      {0.3125,0.25,-0.5,0.375,0.4375,-0.4375},
      {-0.3125,0.3125,-0.5,-0.25,0.5,-0.4375},
      {0.25,0.3125,-0.5,0.3125,0.5,-0.4375},
      {-0.375,0.4375,-0.4375,-0.3125,0.5,-0.375},
      {0.3125,0.4375,-0.4375,0.375,0.5,-0.375},
      {-0.125,0.1875,-0.375,0.125,0.25,-0.3125},
      {-0.25,0.25,-0.375,-0.125,0.3125,-0.3125},
      {0.125,0.25,-0.375,0.25,0.3125,-0.3125},
      {-0.3125,0.3125,-0.375,-0.25,0.5,-0.3125},
      {0.25,0.3125,-0.375,0.3125,0.5,-0.3125},
      {-0.125,0.1875,-0.25,-0.0625,0.25,-0.1875},
      {0.0625,0.1875,-0.25,0.125,0.25,-0.1875},
      {-0.25,0.25,-0.25,-0.125,0.3125,-0.1875},
      {0.125,0.25,-0.25,0.25,0.3125,-0.1875},
      {-0.3125,0.3125,-0.25,-0.25,0.5,-0.1875},
      {0.25,0.3125,-0.25,0.3125,0.5,-0.1875},
      {-0.375,-0.5,-0.125,-0.3125,-0.4375,0.0625},
      {-0.25,-0.5,-0.125,-0.1875,-0.4375,0.0625},
      {0.1875,-0.5,-0.125,0.25,-0.4375,0.0625},
      {0.3125,-0.5,-0.125,0.375,-0.4375,0.0625},
      {-0.3125,-0.5,-0.0625,-0.25,-0.4375,0.0625},
      {0.25,-0.5,-0.0625,0.3125,-0.4375,0.0625},
      {-0.3125,0.3125,-0.0625,-0.25,0.375,0.0625},
      {0.25,0.3125,-0.0625,0.3125,0.375,0.0625},
      {-0.3125,-0.4375,0.0,-0.25,-0.3125,0.0625},
      {0.25,-0.4375,0.0,0.3125,-0.3125,0.0625},
      {-0.3125,0.25,0.0,-0.25,0.3125,0.125},
      {0.25,0.25,0.0,0.3125,0.3125,0.125},
      {-0.3125,0.375,0.0,-0.25,0.4375,0.125},
      {0.25,0.375,0.0,0.3125,0.4375,0.125},
      {-0.3125,-0.375,0.0625,-0.25,-0.1875,0.125},
      {0.25,-0.375,0.0625,0.3125,-0.1875,0.125},
      {-0.3125,0.125,0.0625,-0.25,0.25,0.125},
      {0.25,0.125,0.0625,0.3125,0.25,0.125},
      {-0.3125,0.4375,0.0625,-0.25,0.5,0.1875},
      {0.25,0.4375,0.0625,0.3125,0.5,0.1875},
      {-0.3125,-0.4375,0.125,-0.25,-0.375,0.1875},
      {0.25,-0.4375,0.125,0.3125,-0.375,0.1875},
      {-0.3125,-0.25,0.125,-0.25,-0.0625,0.1875},
      {0.25,-0.25,0.125,0.3125,-0.0625,0.1875},
      {-0.3125,0.0,0.125,-0.25,0.1875,0.1875},
      {0.25,0.0,0.125,0.3125,0.1875,0.1875},
      {-0.1875,0.4375,0.125,-0.125,0.5,0.375},
      {0.125,0.4375,0.125,0.1875,0.5,0.375},
      {-0.3125,-0.125,0.1875,-0.25,0.0625,0.25},
      {0.25,-0.125,0.1875,0.3125,0.0625,0.25},
      {-0.3125,0.0625,0.25,-0.25,0.125,0.3125},
      {0.25,0.0625,0.25,0.3125,0.125,0.3125},
      {-0.0625,0.375,0.4375,0.0625,0.4375,0.5},
    },
  }

skeletons.register_skeleton("reindeer_skeleton_front", S("part of reindeer skeleton"), node_box_front)
skeletons.register_skeleton("reindeer_skeleton_back", S("part of reindeer skeleton"), node_box_back)

-- add bone drop
if skeletons.have_animalia then
  local entity = minetest.registered_entities["animalia:reindeer"]
  if (not entity) then
    entity = minetest.registered_entities["hades_animalia:reindeer"]
  end

  if entity then
    table.insert(entity.drops, {name = "skeletons:fresh_reindeer_skeleton_front", chance = 1, min = 1, max = 1})
    table.insert(entity.drops, {name = "skeletons:fresh_reindeer_skeleton_back", chance = 1, min = 1, max = 1})
  end
end

