
local S = minetest.get_translator("skeletons")

local skulls_get_method = minetest.settings:get("skeletons_skulls_get_method") or "none"

if skulls_get_method=="none" then
  -- drops from bones:bones
  minetest.override_item("bones:bones", {
      drop = {
        max_items = 2,
        items = {
          {items = {"skeletons:fresh_player_skeleton_bottom", "skeletons:fresh_player_skeleton_top"}},
        },
      }, 
    });
end

-- update bones callbacks for better fix 
local bones_def = minetest.registered_nodes["bones:bones"];
local old_on_metadata_inventory_take = bones_def.on_metadata_inventory_take;
local old_on_punch = bones_def.on_punch;

local function get_bones(pos, player)
  local new_node = minetest.get_node(pos);
  if (new_node.name~="bones:bones") then
    local inv = player:get_inventory();
    local bones_item = ItemStack("bones:bones");
    if inv:contains_item("main", bones_item) then
      inv:remove_item("main", bones_item);
      
      local drops = minetest.get_node_drops("bones:bones", nil);
      if drops then
        for key, value in pairs(drops) do
          local item_stack = ItemStack(value);
          if inv:room_for_item("main", item_stack) then
            inv:add_item("main", item_stack)
          else
            minetest.add_item(pos, item_stack);
          end
        end
      end
    end
  end
end

minetest.override_item("bones:bones", {
  on_metadata_inventory_take = function(pos, listname, index, stack, player)
      old_on_metadata_inventory_take(pos, listname, index, stack, player);
      get_bones(pos, player);
    end,
  on_punch = function(pos, node, player)
      old_on_punch(pos, node, player);
      get_bones(pos, player);
    end,
});

