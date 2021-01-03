
local S = minetest.get_translator("skeletons")

-- change drops of bones:bones

minetest.override_item("bones:bones", {
    drop = {
      max_items = 2,
      items = {
        {items = {"skeletons:fresh_player_skeleton_bottom", "skeletons:fresh_player_skeleton_top"}},
      },
    }, 
  });

