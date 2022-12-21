
local S = minetest.get_translator("skeletons")

local skulls_get_method = minetest.settings:get("skeletons_skulls_get_method") or "none"

local default_bones = minetest.get_modpath("bones")
local hades_bones = minetest.get_modpath("hades_bones")

local bones_node_name = "bones:bones"

if hades_bones then
  bones_node_name = "hades_bones:bones"
end

if skulls_get_method=="none" then
  -- drops from bones:bones
  minetest.override_item(bones_node_name, {
      drop = {
        max_items = 2,
        items = {
          {items = {"skeletons:fresh_player_skeleton_bottom", "skeletons:fresh_player_skeleton_top"}},
        },
      }, 
    });
end

if hades_bones then
  -- update bones callbacks for better fix 
  local bones_def = minetest.registered_nodes[bones_node_name];
  local old_on_metadata_inventory_take = bones_def.on_metadata_inventory_take;
  local old_on_punch = bones_def.on_punch;

  local function get_bones(pos, player)
    local new_node = minetest.get_node(pos);
    if (new_node.name~=bones_node_name) then
      local inv = player:get_inventory();
      local bones_item = ItemStack(bones_node_name);
      if inv:contains_item("main", bones_item) then
        inv:remove_item("main", bones_item);
        
        local drops = minetest.get_node_drops(bones_node_name, nil);
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

  minetest.override_item(bones_node_name, {
    on_metadata_inventory_take = function(pos, listname, index, stack, player)
        old_on_metadata_inventory_take(pos, listname, index, stack, player);
        get_bones(pos, player);
      end,
    on_punch = function(pos, node, player)
        old_on_punch(pos, node, player);
        get_bones(pos, player);
      end,
  });
else
  -- default bones
  
  local function bones_on_metadata_inventory_take (pos, listname, index, stack, player)
		local meta = minetest.get_meta(pos)
		if meta:get_inventory():is_empty("main") then
      local drops = minetest.get_node_drops(bones_node_name, nil)
      for _,drop_item in pairs(drops) do
        if player_inv:room_for_item("main", ItemStack(drop_item)) then
          player_inv:add_item("main", ItemStack(drop_item))
        else
          minetest.add_item(pos, ItemStack(drop_item))
        end
      end
      minetest.remove_node(pos)
		end
	end
  
  local function bones_on_punch(pos, node, player)
      local bones_owner = minetest.get_meta(pos):get_string("owner")
      if bones_owner and bones_owner ~= "" and bones_owner ~= player:get_player_name() then
        return
      end

      if minetest.get_meta(pos):get_string("infotext") == "" then
        return
      end

      local inv = minetest.get_meta(pos):get_inventory()
      local player_inv = player:get_inventory()
      local has_space = true

      for i = 1, inv:get_size("main") do
        local stk = inv:get_stack("main", i)
        if player_inv:room_for_item("main", stk) then
          inv:set_stack("main", i, nil)
          player_inv:add_item("main", stk)
        else
          has_space = false
          break
        end
      end

      -- remove bones if player emptied them
      if has_space then
        local drops = minetest.get_node_drops(node, nil)
        for _,drop_item in pairs(drops) do
          if player_inv:room_for_item("main", ItemStack(drop_item)) then
            player_inv:add_item("main", ItemStack(drop_item))
          else
            minetest.add_item(pos, ItemStack(drop_item))
          end
        end
        minetest.remove_node(pos)
      end
    end
  
  minetest.override_item(bones_node_name, {
    on_metadata_inventory_take = bones_on_metadata_inventory_take,
    on_punch = bones_on_punch,
  });
end

