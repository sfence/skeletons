
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
    minetest.register_node("skeletons:fresh_"..name, table.copy(node_def))
    node_def.description = S("Fossil").." "..desc;
    node_def.tiles = {"skeletons_fossil_bone.png"};
    minetest.register_node("skeletons:fossil_"..name, table.copy(node_def))
    node_def.description = S("Model of").." "..desc;
    node_def.tiles = {"skeletons_model.png"}
    minetest.register_node("skeletons:model_"..name, table.copy(node_def))
    node_def.description = S("Colored model of").." "..desc;
    node_def.tiles = {"skeletons_model_colored.png"}
    minetest.register_node("skeletons:colored_mode_"..name, table.copy(node_def))
end
