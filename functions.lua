
local S = minetest.get_translator("skeletons");

local register_fossilized_skeleton = minetest.settings:get_bool("skeletons_register_fossilized_skeleton", true)
local register_model_skeleton = minetest.settings:get_bool("skeletons_register_model_skeleton", true)

local precise_selection_boxes = minetest.settings:get_bool("skeletons_precise_selection_boxes", true)

local function choose_selection_box(box)
  if precise_selection_boxes then
    return box
  else
    local new_box = {
      type = "fixed",
      fixed = {
        {0.5,0.5,0.5,-0.5,-0.5,-0.5}
      }
    }
    for i = 1,3 do
      for _,fixed in pairs(box.fixed) do
        if fixed[i] < new_box.fixed[1][i] then
          new_box.fixed[1][i] = fixed[i]
        end
      end
    end
    for i = 4,6 do
      for _,fixed in pairs(box.fixed) do
        if fixed[i] > new_box.fixed[1][i] then
          new_box.fixed[1][i] = fixed[i]
        end
      end
    end
    return new_box
  end
end

function skeletons.register_skeleton(name, desc, box, obj_file, tiles)
  local node_def = {
      drawtype = "nodebox",
      paramtype  = "light",
      paramtype2 = "facedir",
      groups = {cracky=1},
      -- the nodebox model comes from realtest
      node_box = box,
      selection_box = choose_selection_box(box),
      is_ground_content = false,
    }
    if obj_file then
      node_def.drawtype = "mesh";
      node_def.node_box = nil;
      node_def.mesh = obj_file;
    end
    node_def.description = S("Fresh").." "..desc;
    node_def.tiles = {"skeletons_fresh_bone.png"};
    if tiles then
      node_def.tiles = tiles[1];
    end
    local fresh_node_def = table.copy(node_def);
    fresh_node_def.groups.bone = 1; -- support for bonemeal
    minetest.register_node("skeletons:fresh_"..name, fresh_node_def)
    node_def.description = S("Fossil").." "..desc;
    node_def.tiles = {"skeletons_fossil_bone.png"};
    if tiles then
      node_def.tiles = tiles[2];
    end
    if register_fossilized_skeleton then
      minetest.register_node("skeletons:fossil_"..name, table.copy(node_def))
      node_def.description = S("Model of").." "..desc;
      node_def.tiles = {"skeletons_model.png"}
      if tiles then
        node_def.tiles = tiles[3];
      end
    end
    if register_model_skeleton then
      minetest.register_node("skeletons:model_"..name, table.copy(node_def))
      node_def.description = S("Colored model of").." "..desc;
      node_def.tiles = {"skeletons_model_colored.png"}
      if tiles then
        node_def.tiles = tiles[4];
      end
      minetest.register_node("skeletons:colored_model_"..name, table.copy(node_def))
    end
end

function skeletons.register_skeleton_transform(origin, transformed, restorable)
  local prefixes = {"fresh_"};
  if register_fossilized_skeleton then
    table.insert(prefixes, "fossil_")
  end
  if register_model_skeleton then
    table.insert(prefixes, "model_")
    table.insert(prefixes, "colored_model_")
  end
  
  for _, value in pairs(prefixes) do
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
