-- support for more skulls in normal game

local storage = minetest.get_mod_storage();

local skulls_get_method = minetest.settings:get("skeletons_skulls_get_method") or "none"
 
local skull_reset_on_die = minetest.settings:get_bool("skeletons_skull_reset_on_die", true)
local skulls_enable_log = minetest.settings:get_bool("skeletons_skulls_enable_log", false)

local log = function (text)
end
if (skulls_enable_log) then
  log = function (text)
    minetest.log("action", "[Mod] Skeletons: "..text);
  end
end

function skeletons.get_meat_eat(stack, hp_change)
  local item_name = stack:get_name();
  local item_def = stack:get_definition();
  if item_def then
    -- if this definition is in node, use it
    if item_def._meat_eat then
      return item_def._meat_eat;
    end
    -- mobs animal
    local food_meat = minetest.get_item_group(item_name, "food_meat");
    if (food_meat>0) then
      return hp_change;
    end
    local food_meat_raw = minetest.get_item_group(item_name, "food_meat_raw");
    if (food_meat_raw>0) then
      return hp_change;
    end
    -- paleotest
    local meat = minetest.get_item_group(item_name, "meat");
    if (meat>0) then
      return hp_change;
    end
  end
  return 0;
end

if (skulls_get_method=="eat") then
  -- get skulls be eat
  local skull_modern_eat = tonumber(minetest.settings:get("skeletons_skull_modern_eat")) or 100
  local skull_gatherer_eat = tonumber(minetest.settings:get("skeletons_skull_gatherer_eat")) or 1000
  local skull_gatherer_no_vegetarian = minetest.settings:get_bool("skeletons_skull_gatherer_no_vegetarian", true)
  local counters = {
      eat = 0,
      meat_eat = 0,
    };
  
  minetest.register_on_item_eat(function(hp_change, replace_with_item, itemstack, user, pointed_thing)
      local player_name = user:get_player_name();
      if (player_name~="") then
        local player_counters = storage:get_string(player_name);
        if (player_counters~="") then
          player_counters = minetest.deserialize(player_counters);
        else
          player_counters = table.copy(counters);
        end
        -- prevent error when configuratio mode is changed
        if (not player_counters.eat) then
          player_counters.eat = 0;
        end
        if (not player_counters.meat_eat) then
          player_counters.meat_eat = 0;
        end
        player_counters.eat = player_counters.eat + hp_change;
        local meat_eat = skeletons.get_meat_eat(itemstack, hp_change)
        if (meat_eat>0) then
          player_counters.meat_eat = player_counters.meat_eat + hp_change;
        else
          if skull_gatherer_no_vegetarian then
            player_counters.meat_eat = player_counters.meat_eat - hp_change;
            if (player_counters.meat_eat<-skull_gatherer_eat) then
              player_counters.meat_eat = -skull_gatherer_eat;
            end
          end
        end
        log(player_name.." counters updated (eat="..tostring(player_counters.eat)..",meat_eat="..tostring(player_counters.meat_eat)..").");
        storage:set_string(player_name, minetest.serialize(player_counters))
      end
    end)
  minetest.register_on_dieplayer(function(object, reason) 
      local player_name = object:get_player_name();
      if (player_name~="") then
        -- get coutners
        local player_counters = storage:get_string(player_name);
        if (player_counters~="") then
          player_counters = minetest.deserialize(player_counters);
        else
          player_counters = table.copy(counters);
        end
        -- drop skeleton
        minetest.item_drop(ItemStack("skeletons:fresh_player_skeleton_bottom"), object, object:get_pos())
        local skeleton_top = "skeletons:fresh_player_skeleton_top";
        if (player_counters.eat>=skull_modern_eat) then
          skeleton_top = "skeletons:fresh_player_skeleton_top_modern"
        end
        if (player_counters.meat_eat>=skull_gatherer_eat) then
          skeleton_top = "skeletons:fresh_player_skeleton_top_gatherer"
        end
        minetest.item_drop(ItemStack(skeleton_top), object, object:get_pos())
        -- reset counters
        if skull_reset_on_die then
          log(player_name.." counters reseted.");
          storage:set_string(player_name, minetest.serialize(counters))
        end 
      end
    end)
  
  -- skeleton have been droped, so disable getting it by digging
  if skeletons.have_bones then
    minetest.override_item("bones:bones", {
        drop = {
          items = {
            { items = {""}},
          }
        }
      })
  end
elseif (skulls_get_method=="kills") then
  -- get skulls by player kills
  local skull_modern_kills = tonumber(minetest.settings:get("skeletons_skull_modern_kills")) or 10
  local skull_gatherer_kills = tonumber(minetest.settings:get("skeletons_skull_gatherer_kills")) or 100 
  local counters = {
      kills = 0,
    };
  
  minetest.register_on_dieplayer(function(object, reason) 
      local player_name = object:get_player_name();
      if (player_name~="") then
        -- get coutners
        local player_counters = storage:get_string(player_name);
        if (player_counters~="") then
          player_counters = minetest.deserialize(player_counters);
        else
          player_counters = table.copy(counters);
        end
        -- prevent error when configuratio mode is changed
        if (not player_counters.kills) then
          player_counters.kills = 0;
        end
        -- drop skeleton
        minetest.item_drop(ItemStack("skeletons:fresh_player_skeleton_bottom"), object, object:get_pos())
        local skeleton_top = "skeletons:fresh_player_skeleton_top";
        if (player_counters.kills>=skull_modern_kills) then
          skeleton_top = "skeletons:fresh_player_skeleton_top_modern"
        end
        if (player_counters.kills>=skull_gatherer_kills) then
          skeleton_top = "skeletons:fresh_player_skeleton_top_gatherer"
        end
        minetest.item_drop(ItemStack(skeleton_top), object, object:get_pos())
        -- reset counters
        if skull_reset_on_die then
          log(player_name.." counters reseted.");
          storage:set_string(player_name, minetest.serialize(counters))
        end 
        
        -- killer
        if (reason.type == "punch") then
          if reason.object then
            local killer_name = reason.object:get_player_name();
            if (killer_name~="") then
              -- get coutners
              local killer_counters = storage:get_string(killer_name);
              if (killer_counters~="") then
                killer_counters = minetest.deserialize(killer_counters);
              else
                killer_counters = table.copy(counters);
              end
              if killer_counters.kills then
                killer_counters.kills = 0;
              end
              -- update coutners
              killer_counters.kills = killer_counters.kills + 1;
              log(killer_name.." counters updated (kills="..tostring(killer_counters.kills)..").");
              storage:set_string(killer_name, minetest.serialize(killer_counters))
            end
          end
        end
      end
    end)
  
  -- skeleton have been droped, so disable getting it by digging
  if skeletons.have_bones then
    minetest.override_item("bones:bones", {
        drop = {
          items = {
            { items = {""}},
          }
        }
      })
  end
elseif (skulls_get_method=="chance") then
  -- get skulls by chance
  local skull_modern_chance = tonumber(minetest.settings:get("skeletons_skull_modern_chance")) or 10
  local skull_gatherer_chance = tonumber(minetest.settings:get("skeletons_skull_gatherer_chance")) or 100 
  
  if skeletons.have_bones then
    minetest.override_item("bones:bones", {
        drop = {
          max_items = 2,
          items = {
            { items = {"skeletons:fresh_player_skeleton_bottom"}},
            { items = {"skeletons:fresh_player_skeleton_top_gatherer"},
              rarity = skull_gatherer_chance},
            { items = {"skeletons:fresh_player_skeleton_top_modern"},
              rarity = skull_modern_chance},
            { items = {"skeletons:fresh_player_skeleton_top"},
              rarity = 1},
          },
        }, 
      });
  else
    minetest("warning", "[Mod] Skeletons: Dropping skulls by chance have no effect because bones mod has not been found.")
  end
end


