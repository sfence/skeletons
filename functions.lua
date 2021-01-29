
local S = minetest.get_translator("skeletons");

function skeletons.register_skeleton(name, desc, box)
  local node_def = {
      drawtype = "nodebox",
      paramtype  = "light",
      paramtype2 = "facedir",
      groups = {cracky=1},
      -- the nodebox model comes from realtest
      node_box = box,
      selection_box = box,
      is_ground_content = false,
    }
    node_def.description = S("Fresh").." "..desc;
    node_def.tiles = {"skeletons_fresh_bone.png"};
    local fresh_node_def = table.copy(node_def);
    fresh_node_def.groups.bone = 1; -- support for bonemeal
    minetest.register_node("skeletons:fresh_"..name, fresh_node_def)
    node_def.description = S("Fossil").." "..desc;
    node_def.tiles = {"skeletons_fossil_bone.png"};
    minetest.register_node("skeletons:fossil_"..name, table.copy(node_def))
    node_def.description = S("Model of").." "..desc;
    node_def.tiles = {"skeletons_model.png"}
    minetest.register_node("skeletons:model_"..name, table.copy(node_def))
    node_def.description = S("Colored model of").." "..desc;
    node_def.tiles = {"skeletons_model_colored.png"}
    minetest.register_node("skeletons:colored_model_"..name, table.copy(node_def))
end

function skeletons.register_skeleton_transform(origin, transformed, restorable)
  local prefixes = {"fresh_", "fossil_", "model_", "colored_model_"};
  
  for key, value in pairs(prefixes) do
    minetest.register_craft({
        type = "shapeless",
        output = "skeletons:"..value..transformed,
        recipe = {"skeletons:"..value..origin},
      });
    if restorable then
      minetest.register_craft({
          type = "shapeless",
          output = "skeletons:"..value..origin,
          recipe = {"skeletons:"..value..transformed},
        });
    end
  end
end
