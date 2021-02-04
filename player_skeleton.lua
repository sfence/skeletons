
local S = minetest.get_translator("skeletons");
  
  -- node box {x=0, y=0, z=0}
local node_box_bottom = {
    type = "fixed",
    fixed = {
      {-0.1875,-0.5,-0.25,-0.125,-0.4375,0.0625},
      {0.125,-0.5,-0.25,0.1875,-0.4375,0.0625},
      {-0.25,-0.5,-0.1875,-0.1875,-0.4375,0.0625},
      {0.1875,-0.5,-0.1875,0.25,-0.4375,0.0625},
      {-0.4375,0.0625,-0.125,-0.375,0.25,0.125},
      {0.375,0.0625,-0.125,0.4375,0.25,0.125},
      {-0.25,-0.4375,-0.0625,-0.125,-0.0625,0.0625},
      {0.125,-0.4375,-0.0625,0.25,-0.0625,0.0625},
      {-0.3125,-0.0625,-0.0625,-0.25,0.0,0.0},
      {-0.125,-0.0625,-0.0625,-0.0625,0.0,0.0},
      {0.0625,-0.0625,-0.0625,0.125,0.0,0.0},
      {0.25,-0.0625,-0.0625,0.3125,0.0,0.0},
      {-0.4375,0.0,-0.0625,-0.375,0.0625,0.125},
      {-0.25,0.0,-0.0625,-0.125,0.1875,0.0625},
      {0.125,0.0,-0.0625,0.25,0.1875,0.0625},
      {0.375,0.0,-0.0625,0.4375,0.0625,0.125},
      {-0.25,0.1875,-0.0625,-0.1875,0.25,0.0625},
      {0.1875,0.1875,-0.0625,0.25,0.25,0.0625},
      {-0.4375,0.25,-0.0625,-0.375,0.5,0.0625},
      {-0.1875,0.25,-0.0625,-0.125,0.3125,0.0625},
      {0.125,0.25,-0.0625,0.1875,0.3125,0.0625},
      {0.375,0.25,-0.0625,0.4375,0.5,0.0625},
      {-0.4375,-0.0625,0.0,-0.375,0.0,0.0625},
      {-0.25,-0.0625,0.0,-0.125,0.0,0.0625},
      {0.125,-0.0625,0.0,0.25,0.0,0.0625},
      {0.375,-0.0625,0.0,0.4375,0.0,0.0625},
      {-0.0625,0.25,0.0,0.0625,0.3125,0.0625},
      {-0.1875,0.3125,0.0,-0.0625,0.4375,0.0625},
      {0.0625,0.3125,0.0,0.1875,0.4375,0.0625},
      {-0.25,0.375,0.0,-0.1875,0.5,0.0625},
      {0.1875,0.375,0.0,0.25,0.5,0.0625},
      {-0.3125,0.4375,0.0,-0.25,0.5,0.0625},
      {-0.1875,0.4375,0.0,-0.125,0.5,0.0625},
      {-0.0625,0.4375,0.0,0.0625,0.5,0.125},
      {0.125,0.4375,0.0,0.1875,0.5,0.0625},
      {0.25,0.4375,0.0,0.3125,0.5,0.0625},
    },
  }
-- node box {x=0, y=1, z=0}
local node_box_top = {
    type = "fixed",
    fixed = {
      {-0.0625,-0.4375,-0.1875,0.0625,-0.125,-0.125},
      {-0.125,-0.375,-0.1875,-0.0625,-0.25,-0.125},
      {0.0625,-0.375,-0.1875,0.1875,-0.25,-0.125},
      {-0.25,-0.3125,-0.1875,-0.125,-0.25,-0.125},
      {0.1875,-0.3125,-0.1875,0.25,-0.25,0.125},
      {-0.25,-0.1875,-0.1875,-0.0625,-0.125,-0.125},
      {0.0625,-0.1875,-0.1875,0.25,-0.125,-0.125},
      {-0.1875,-0.375,-0.125,-0.125,-0.3125,0.0},
      {0.125,-0.375,-0.125,0.1875,-0.3125,0.0},
      {-0.25,-0.3125,-0.125,-0.1875,-0.25,0.125},
      {-0.25,-0.1875,-0.125,-0.1875,-0.125,0.0},
      {0.1875,-0.1875,-0.125,0.25,-0.125,0.0},
      {-0.4375,-0.5,-0.0625,-0.375,-0.4375,0.0625},
      {0.375,-0.5,-0.0625,0.4375,-0.4375,0.0625},
      {-0.4375,-0.375,-0.0625,-0.375,-0.125,0.0625},
      {0.375,-0.375,-0.0625,0.4375,-0.125,0.0625},
      {-0.375,-0.125,-0.0625,-0.25,-0.0625,0.0625},
      {0.25,-0.125,-0.0625,0.375,-0.0625,0.0625},
      {-0.25,-0.5,0.0,-0.1875,-0.4375,0.0625},
      {0.1875,-0.5,0.0,0.25,-0.4375,0.0625},
      {-0.4375,-0.4375,0.0,-0.375,-0.375,0.125},
      {-0.1875,-0.4375,0.0,-0.125,-0.375,0.125},
      {-0.0625,-0.4375,0.0,0.0625,-0.375,0.125},
      {0.125,-0.4375,0.0,0.1875,-0.375,0.125},
      {0.375,-0.4375,0.0,0.4375,-0.375,0.125},
      {-0.0625,-0.3125,0.0,0.0625,-0.25,0.125},
      {-0.0625,-0.1875,0.0,0.0625,-0.125,0.125},
      {-0.25,-0.125,0.0,-0.0625,-0.0625,0.125},
      {0.0625,-0.125,0.0,0.25,-0.0625,0.125},
      {-0.125,-0.4375,0.0625,-0.0625,-0.375,0.125},
      {0.0625,-0.4375,0.0625,0.125,-0.375,0.125},
      {-0.1875,-0.3125,0.0625,-0.0625,-0.25,0.125},
      {0.0625,-0.3125,0.0625,0.1875,-0.25,0.125},
    },
  }
  
-- node box {x=0, y=0, z=0}
local node_box_front = {
    type = "fixed",
    fixed = {
      {-0.25,-0.5,-0.5,-0.125,-0.25,-0.4375},
      {0.125,-0.5,-0.5,0.25,-0.25,-0.4375},
      {-0.1875,-0.25,-0.5,-0.125,-0.1875,-0.4375},
      {0.125,-0.25,-0.5,0.1875,-0.1875,-0.4375},
      {-0.25,-0.5,-0.4375,-0.125,-0.375,-0.0625},
      {0.125,-0.5,-0.4375,0.25,-0.375,-0.0625},
      {-0.25,-0.5,-0.0625,-0.125,-0.4375,0.0},
      {0.125,-0.5,-0.0625,0.25,-0.4375,0.0},
      {-0.4375,-0.4375,-0.0625,-0.375,-0.375,0.5},
      {-0.3125,-0.4375,-0.0625,-0.25,-0.375,0.0},
      {-0.125,-0.4375,-0.0625,-0.0625,-0.375,0.0},
      {0.0625,-0.4375,-0.0625,0.125,-0.375,0.0},
      {0.25,-0.4375,-0.0625,0.3125,-0.375,0.0},
      {0.375,-0.4375,-0.0625,0.4375,-0.375,0.5},
      {-0.4375,-0.5,0.0,-0.375,-0.4375,0.25},
      {0.375,-0.5,0.0,0.4375,-0.4375,0.25},
      {-0.25,-0.4375,0.0,-0.125,-0.3125,0.1875},
      {0.125,-0.4375,0.0,0.25,-0.3125,0.1875},
      {-0.4375,-0.375,0.0,-0.375,-0.3125,0.5},
      {0.375,-0.375,0.0,0.4375,-0.3125,0.5},
      {-0.4375,-0.3125,0.0625,-0.375,-0.25,0.25},
      {0.375,-0.3125,0.0625,0.4375,-0.25,0.25},
      {-0.25,-0.4375,0.1875,-0.1875,-0.3125,0.25},
      {0.1875,-0.4375,0.1875,0.25,-0.3125,0.25},
      {-0.1875,-0.4375,0.25,-0.125,-0.3125,0.3125},
      {-0.0625,-0.4375,0.25,0.0625,-0.375,0.3125},
      {0.125,-0.4375,0.25,0.1875,-0.3125,0.3125},
      {-0.1875,-0.4375,0.3125,-0.0625,-0.375,0.4375},
      {0.0625,-0.4375,0.3125,0.1875,-0.375,0.4375},
      {-0.25,-0.4375,0.375,-0.1875,-0.375,0.5},
      {0.1875,-0.4375,0.375,0.25,-0.375,0.5},
      {-0.0625,-0.5,0.4375,0.0625,-0.375,0.5},
      {-0.3125,-0.4375,0.4375,-0.25,-0.375,0.5},
      {-0.1875,-0.4375,0.4375,-0.125,-0.375,0.5},
      {0.125,-0.4375,0.4375,0.1875,-0.375,0.5},
      {0.25,-0.4375,0.4375,0.3125,-0.375,0.5},
    },
  }
-- node box {x=0, y=0, z=1}
local node_box_back = {
    type = "fixed",
    fixed = {
      {-0.4375,-0.4375,-0.5,-0.375,-0.3125,-0.4375},
      {-0.25,-0.4375,-0.5,-0.1875,-0.375,-0.4375},
      {0.1875,-0.4375,-0.5,0.25,-0.375,-0.4375},
      {0.375,-0.4375,-0.5,0.4375,-0.3125,-0.4375},
      {-0.4375,-0.5,-0.4375,-0.375,-0.375,-0.375},
      {-0.1875,-0.5,-0.4375,0.1875,-0.4375,-0.375},
      {0.375,-0.5,-0.4375,0.4375,-0.375,-0.375},
      {-0.1875,-0.4375,-0.4375,-0.125,-0.375,-0.375},
      {-0.0625,-0.4375,-0.4375,0.0625,-0.375,-0.375},
      {0.125,-0.4375,-0.4375,0.1875,-0.375,-0.375},
      {-0.0625,-0.25,-0.4375,0.0625,-0.1875,-0.1875},
      {-0.4375,-0.4375,-0.375,-0.375,-0.3125,-0.25},
      {0.375,-0.4375,-0.375,0.4375,-0.3125,-0.25},
      {-0.1875,-0.375,-0.375,-0.125,-0.25,-0.3125},
      {0.125,-0.375,-0.375,0.1875,-0.25,-0.3125},
      {-0.125,-0.25,-0.375,-0.0625,-0.1875,-0.25},
      {0.0625,-0.25,-0.375,0.125,-0.1875,-0.25},
      {-0.25,-0.5,-0.3125,0.25,-0.4375,-0.25},
      {-0.25,-0.4375,-0.3125,-0.1875,-0.1875,-0.25},
      {-0.0625,-0.4375,-0.3125,0.0625,-0.375,-0.25},
      {0.1875,-0.4375,-0.3125,0.25,-0.1875,-0.25},
      {-0.1875,-0.25,-0.3125,-0.125,-0.1875,-0.25},
      {0.125,-0.25,-0.3125,0.1875,-0.1875,-0.25},
      {-0.4375,-0.375,-0.25,-0.375,-0.25,-0.125},
      {0.375,-0.375,-0.25,0.4375,-0.25,-0.125},
      {-0.0625,-0.4375,-0.1875,0.0625,-0.3125,-0.125},
      {-0.25,-0.3125,-0.1875,-0.1875,-0.125,-0.125},
      {0.1875,-0.3125,-0.1875,0.25,-0.125,-0.125},
      {-0.1875,-0.1875,-0.1875,0.1875,-0.125,-0.125},
      {-0.25,-0.4375,-0.125,-0.0625,-0.3125,-0.0625},
      {0.0625,-0.4375,-0.125,0.25,-0.3125,-0.0625},
      {-0.375,-0.375,-0.125,-0.25,-0.25,-0.0625},
      {0.25,-0.375,-0.125,0.375,-0.25,-0.0625},
    },
  }

local skulls = {
  [""] = {
    {
      {-0.25,0.0,-0.25,0.25,0.0625,0.0},
      {-0.25,0.0625,-0.25,-0.0625,0.25,-0.1875},
      {0.0625,0.0625,-0.25,0.25,0.25,-0.1875},
      {-0.0625,0.125,-0.25,0.0625,0.1875,-0.1875},
      {-0.25,0.25,-0.25,-0.1875,0.5,0.25},
      {-0.0625,0.25,-0.25,0.0625,0.5,-0.1875},
      {0.1875,0.25,-0.25,0.25,0.5,0.25},
      {-0.1875,0.3125,-0.25,-0.0625,0.5,-0.1875},
      {0.0625,0.3125,-0.25,0.1875,0.5,-0.1875},
      {-0.25,0.0625,-0.1875,-0.1875,0.25,0.0},
      {0.1875,0.0625,-0.1875,0.25,0.25,0.0},
      {-0.1875,0.4375,-0.1875,0.1875,0.5,0.25},
      {-0.0625,-0.0625,0.0,0.0625,0.0,0.125},
      {-0.125,0.0,0.0,-0.0625,0.0625,0.25},
      {0.0625,0.0,0.0,0.125,0.0625,0.25},
      {-0.0625,0.0625,0.0,0.0625,0.125,0.125},
      {-0.25,0.125,0.0,-0.1875,0.25,0.25},
      {0.1875,0.125,0.0,0.25,0.25,0.25},
      {-0.25,0.0,0.0625,-0.125,0.0625,0.25},
      {0.125,0.0,0.0625,0.25,0.0625,0.25},
      {-0.25,0.0625,0.0625,-0.1875,0.125,0.25},
      {0.1875,0.0625,0.0625,0.25,0.125,0.25},
      {-0.0625,0.0,0.125,0.0625,0.0625,0.25},
      {-0.1875,0.0625,0.1875,0.1875,0.4375,0.25},
    },
    -- lying
    {
      {-0.0625,-0.375,-0.0625,0.0625,-0.25,0.0},
      {-0.25,-0.5,0.0,0.25,-0.375,0.0625},
      {-0.25,-0.375,0.0,-0.0625,-0.3125,0.0625},
      {0.0625,-0.375,0.0,0.25,-0.3125,0.0625},
      {-0.125,-0.3125,0.0,-0.0625,0.0,0.0625},
      {0.0625,-0.3125,0.0,0.125,0.0,0.0625},
      {-0.25,-0.25,0.0,-0.125,0.0,0.0625},
      {-0.0625,-0.25,0.0,0.0625,0.0,0.0625},
      {0.125,-0.25,0.0,0.25,0.0,0.0625},
      {-0.25,-0.5,0.0625,0.25,-0.4375,0.5},
      {-0.25,-0.4375,0.0625,-0.1875,-0.3125,0.5},
      {0.1875,-0.4375,0.0625,0.25,-0.3125,0.5},
      {-0.0625,-0.375,0.0625,0.0625,-0.25,0.125},
      {-0.25,-0.25,0.0625,-0.1875,0.0,0.5},
      {0.1875,-0.25,0.0625,0.25,0.0,0.5},
      {-0.1875,-0.0625,0.0625,-0.0625,0.0,0.25},
      {0.0625,-0.0625,0.0625,0.1875,0.0,0.25},
      {-0.25,-0.3125,0.125,-0.1875,-0.25,0.5},
      {0.1875,-0.3125,0.125,0.25,-0.25,0.5},
      {-0.0625,-0.0625,0.125,0.0625,0.0,0.1875},
      {-0.0625,-0.0625,0.25,0.0625,0.0,0.5},
      {-0.1875,-0.0625,0.3125,-0.0625,0.0,0.5},
      {0.0625,-0.0625,0.3125,0.1875,0.0,0.5},
      {-0.1875,-0.4375,0.4375,0.1875,-0.0625,0.5},
    }
  },
  ["modern"] = {
    {
      {-0.125,0.0,-0.25,0.125,0.0625,-0.1875},
      {-0.25,0.125,-0.25,-0.1875,0.3125,-0.125},
      {-0.125,0.125,-0.25,0.125,0.1875,-0.0625},
      {0.1875,0.125,-0.25,0.25,0.3125,-0.125},
      {-0.1875,0.1875,-0.25,-0.0625,0.25,-0.125},
      {0.0625,0.1875,-0.25,0.1875,0.25,-0.125},
      {-0.0625,0.25,-0.25,0.0625,0.4375,-0.1875},
      {-0.1875,0.3125,-0.25,-0.0625,0.4375,-0.0625},
      {0.0625,0.3125,-0.25,0.1875,0.4375,-0.0625},
      {-0.1875,0.0,-0.1875,-0.0625,0.0625,-0.0625},
      {0.0625,0.0,-0.1875,0.1875,0.0625,-0.0625},
      {-0.1875,0.0625,-0.1875,-0.125,0.125,-0.0625},
      {0.125,0.0625,-0.1875,0.1875,0.125,-0.0625},
      {-0.3125,0.1875,-0.1875,-0.25,0.3125,-0.125},
      {0.25,0.1875,-0.1875,0.3125,0.3125,-0.125},
      {-0.125,0.4375,-0.1875,0.125,0.5,0.1875},
      {-0.125,0.0625,-0.125,-0.0625,0.125,-0.0625},
      {0.0625,0.0625,-0.125,0.125,0.125,-0.0625},
      {-0.3125,0.125,-0.125,-0.25,0.25,0.125},
      {0.25,0.125,-0.125,0.3125,0.25,0.125},
      {-0.125,0.1875,-0.125,-0.0625,0.3125,-0.0625},
      {0.0625,0.1875,-0.125,0.125,0.3125,-0.0625},
      {-0.1875,0.25,-0.125,-0.125,0.3125,0.0},
      {0.125,0.25,-0.125,0.1875,0.3125,0.0},
      {-0.1875,0.4375,-0.125,-0.125,0.5,0.1875},
      {0.125,0.4375,-0.125,0.1875,0.5,0.1875},
      {-0.25,0.125,-0.0625,-0.1875,0.4375,0.0},
      {-0.0625,0.125,-0.0625,0.0625,0.1875,0.1875},
      {0.1875,0.125,-0.0625,0.25,0.4375,0.0},
      {-0.1875,0.1875,-0.0625,-0.0625,0.25,0.0},
      {0.0625,0.1875,-0.0625,0.1875,0.25,0.0},
      {-0.3125,0.25,-0.0625,-0.25,0.375,0.1875},
      {0.25,0.25,-0.0625,0.3125,0.375,0.1875},
      {-0.1875,0.3125,-0.0625,-0.125,0.4375,0.0},
      {0.125,0.3125,-0.0625,0.1875,0.4375,0.0},
      {-0.0625,-0.0625,0.0,0.0625,0.0,0.125},
      {-0.0625,0.0625,0.0,0.0625,0.125,0.125},
      {-0.25,0.125,0.0,-0.1875,0.375,0.125},
      {0.1875,0.125,0.0,0.25,0.375,0.125},
      {-0.125,0.1875,0.0,-0.0625,0.25,0.25},
      {0.0625,0.1875,0.0,0.125,0.25,0.25},
      {-0.3125,0.375,0.0,-0.25,0.4375,0.125},
      {0.25,0.375,0.0,0.3125,0.4375,0.125},
      {-0.25,0.4375,0.0,-0.1875,0.5,0.125},
      {0.1875,0.4375,0.0,0.25,0.5,0.125},
      {-0.125,0.125,0.0625,-0.0625,0.1875,0.1875},
      {0.0625,0.125,0.0625,0.125,0.1875,0.1875},
      {-0.25,0.1875,0.125,-0.1875,0.4375,0.1875},
      {0.1875,0.1875,0.125,0.25,0.4375,0.1875},
      {-0.1875,0.1875,0.1875,-0.125,0.4375,0.25},
      {-0.0625,0.1875,0.1875,0.0625,0.4375,0.25},
      {0.125,0.1875,0.1875,0.1875,0.4375,0.25},
      {-0.25,0.25,0.1875,-0.1875,0.375,0.25},
      {-0.125,0.25,0.1875,-0.0625,0.4375,0.25},
      {0.0625,0.25,0.1875,0.125,0.4375,0.25},
      {0.1875,0.25,0.1875,0.25,0.375,0.25},
    },
    -- lying
    {
      {-0.0625,-0.375,-0.0625,0.0625,-0.25,0.0},
      {-0.1875,-0.1875,0.0,-0.0625,-0.0625,0.0625},
      {0.0625,-0.1875,0.0,0.1875,-0.0625,0.0625},
      {-0.125,-0.0625,0.0,0.125,0.0,0.0625},
      {-0.0625,-0.375,0.0625,0.0625,-0.25,0.1875},
      {-0.1875,-0.1875,0.0625,-0.0625,-0.125,0.125},
      {0.0625,-0.1875,0.0625,0.1875,-0.125,0.125},
      {-0.1875,-0.125,0.0625,-0.125,-0.0625,0.125},
      {0.125,-0.125,0.0625,0.1875,-0.0625,0.125},
      {-0.125,-0.4375,0.125,0.125,-0.375,0.1875},
      {-0.25,-0.375,0.125,-0.1875,-0.1875,0.375},
      {-0.125,-0.375,0.125,-0.0625,-0.3125,0.25},
      {0.0625,-0.375,0.125,0.125,-0.3125,0.25},
      {0.1875,-0.375,0.125,0.25,-0.1875,0.375},
      {-0.0625,-0.25,0.125,0.0625,0.0,0.1875},
      {-0.125,-0.1875,0.125,-0.0625,0.0,0.25},
      {0.0625,-0.1875,0.125,0.125,0.0,0.25},
      {-0.1875,-0.5,0.1875,0.1875,-0.4375,0.375},
      {-0.25,-0.4375,0.1875,-0.1875,-0.375,0.375},
      {-0.125,-0.4375,0.1875,-0.0625,-0.375,0.25},
      {0.0625,-0.4375,0.1875,0.125,-0.375,0.25},
      {0.1875,-0.4375,0.1875,0.25,-0.375,0.375},
      {-0.125,-0.3125,0.1875,-0.0625,-0.1875,0.25},
      {0.0625,-0.3125,0.1875,0.125,-0.1875,0.25},
      {-0.1875,-0.25,0.1875,-0.125,-0.1875,0.4375},
      {0.125,-0.25,0.1875,0.1875,-0.1875,0.4375},
      {-0.25,-0.1875,0.1875,-0.1875,-0.0625,0.25},
      {0.1875,-0.1875,0.1875,0.25,-0.0625,0.25},
      {-0.1875,-0.125,0.1875,-0.125,0.0,0.25},
      {0.125,-0.125,0.1875,0.1875,0.0,0.25},
      {-0.25,-0.5,0.25,-0.1875,-0.4375,0.3125},
      {0.1875,-0.5,0.25,0.25,-0.4375,0.3125},
      {-0.125,-0.1875,0.25,-0.0625,-0.125,0.4375},
      {0.0625,-0.1875,0.25,0.125,-0.125,0.4375},
      {-0.25,-0.125,0.25,-0.1875,0.0,0.3125},
      {0.1875,-0.125,0.25,0.25,0.0,0.3125},
      {-0.0625,-0.0625,0.25,0.0625,0.0,0.4375},
      {-0.1875,-0.125,0.3125,-0.0625,0.0,0.4375},
      {0.0625,-0.125,0.3125,0.1875,0.0,0.4375},
      {-0.125,-0.5,0.375,0.125,-0.4375,0.4375},
      {-0.1875,-0.4375,0.375,-0.125,-0.3125,0.4375},
      {0.125,-0.4375,0.375,0.1875,-0.375,0.4375},
      {-0.25,-0.375,0.375,-0.1875,-0.25,0.4375},
      {0.1875,-0.375,0.375,0.25,-0.25,0.4375},
      {-0.125,-0.4375,0.4375,0.125,-0.1875,0.5},
      {-0.1875,-0.375,0.4375,-0.125,-0.25,0.5},
      {0.125,-0.375,0.4375,0.1875,-0.25,0.5},
      {-0.0625,-0.1875,0.4375,0.0625,-0.0625,0.5},
    }
  },
  ["gatherer"] = {
    {
      {-0.125,0.0,-0.25,0.125,0.0625,-0.1875},
      {-0.125,0.125,-0.25,0.125,0.1875,-0.0625},
      {-0.1875,0.1875,-0.25,-0.0625,0.25,-0.125},
      {0.0625,0.1875,-0.25,0.1875,0.25,-0.125},
      {-0.25,0.25,-0.25,-0.1875,0.3125,-0.125},
      {-0.0625,0.25,-0.25,0.0625,0.4375,-0.1875},
      {0.1875,0.25,-0.25,0.25,0.3125,-0.125},
      {-0.1875,0.3125,-0.25,-0.0625,0.4375,-0.125},
      {0.0625,0.3125,-0.25,0.1875,0.4375,-0.125},
      {-0.1875,0.0,-0.1875,-0.0625,0.0625,-0.0625},
      {0.0625,0.0,-0.1875,0.1875,0.0625,-0.0625},
      {-0.1875,0.0625,-0.1875,-0.125,0.125,-0.0625},
      {0.125,0.0625,-0.1875,0.1875,0.125,-0.0625},
      {-0.25,0.1875,-0.1875,-0.1875,0.25,0.1875},
      {0.1875,0.1875,-0.1875,0.25,0.25,0.1875},
      {-0.0625,0.4375,-0.1875,0.0625,0.5,0.1875},
      {-0.125,0.0625,-0.125,-0.0625,0.125,-0.0625},
      {0.0625,0.0625,-0.125,0.125,0.125,-0.0625},
      {-0.125,0.1875,-0.125,-0.0625,0.4375,-0.0625},
      {0.0625,0.1875,-0.125,0.125,0.4375,-0.0625},
      {-0.25,0.125,-0.0625,-0.1875,0.1875,0.125},
      {-0.0625,0.125,-0.0625,0.0625,0.1875,0.1875},
      {0.1875,0.125,-0.0625,0.25,0.1875,0.125},
      {-0.1875,0.1875,-0.0625,-0.0625,0.25,0.0},
      {0.0625,0.1875,-0.0625,0.1875,0.25,0.0},
      {-0.25,0.25,-0.0625,-0.125,0.375,0.0},
      {0.125,0.25,-0.0625,0.25,0.375,0.0},
      {-0.1875,0.375,-0.0625,-0.125,0.4375,0.0},
      {0.125,0.375,-0.0625,0.1875,0.4375,0.0},
      {-0.125,0.4375,-0.0625,-0.0625,0.5,0.1875},
      {0.0625,0.4375,-0.0625,0.125,0.5,0.1875},
      {-0.0625,-0.0625,0.0,0.0625,0.0,0.125},
      {-0.0625,0.0625,0.0,0.0625,0.125,0.125},
      {-0.125,0.1875,0.0,-0.0625,0.25,0.25},
      {0.0625,0.1875,0.0,0.125,0.25,0.25},
      {-0.25,0.25,0.0,-0.1875,0.4375,0.125},
      {0.1875,0.25,0.0,0.25,0.4375,0.125},
      {-0.1875,0.4375,0.0,-0.125,0.5,0.125},
      {0.125,0.4375,0.0,0.1875,0.5,0.125},
      {-0.125,0.125,0.0625,-0.0625,0.1875,0.1875},
      {0.0625,0.125,0.0625,0.125,0.1875,0.1875},
      {-0.1875,0.375,0.0625,-0.125,0.4375,0.1875},
      {-0.25,0.25,0.125,-0.1875,0.375,0.1875},
      {0.1875,0.25,0.125,0.25,0.375,0.1875},
      {0.125,0.375,0.125,0.1875,0.4375,0.1875},
      {-0.1875,0.1875,0.1875,-0.125,0.375,0.25},
      {-0.0625,0.1875,0.1875,0.0625,0.4375,0.25},
      {0.125,0.1875,0.1875,0.1875,0.375,0.25},
      {-0.25,0.25,0.1875,-0.1875,0.3125,0.25},
      {-0.125,0.25,0.1875,-0.0625,0.4375,0.25},
      {0.0625,0.25,0.1875,0.125,0.4375,0.25},
      {0.1875,0.25,0.1875,0.25,0.3125,0.25},
    },
    -- lying
    {
      {-0.0625,-0.375,-0.0625,0.0625,-0.25,0.0},
      {-0.1875,-0.1875,0.0,-0.0625,-0.0625,0.0625},
      {0.0625,-0.1875,0.0,0.1875,-0.0625,0.0625},
      {-0.125,-0.0625,0.0,0.125,0.0,0.0625},
      {-0.0625,-0.375,0.0625,0.0625,-0.25,0.1875},
      {-0.1875,-0.1875,0.0625,-0.0625,-0.125,0.125},
      {0.0625,-0.1875,0.0625,0.1875,-0.125,0.125},
      {-0.1875,-0.125,0.0625,-0.125,-0.0625,0.125},
      {0.125,-0.125,0.0625,0.1875,-0.0625,0.125},
      {-0.125,-0.4375,0.125,0.125,-0.375,0.1875},
      {-0.3125,-0.375,0.125,-0.1875,-0.1875,0.375},
      {-0.125,-0.375,0.125,-0.0625,-0.3125,0.25},
      {0.0625,-0.375,0.125,0.125,-0.3125,0.25},
      {0.1875,-0.375,0.125,0.3125,-0.1875,0.375},
      {-0.0625,-0.25,0.125,0.0625,0.0,0.1875},
      {-0.3125,-0.1875,0.125,-0.25,-0.125,0.25},
      {-0.125,-0.1875,0.125,-0.0625,0.0,0.25},
      {0.0625,-0.1875,0.125,0.125,0.0,0.25},
      {0.25,-0.1875,0.125,0.3125,-0.125,0.25},
      {-0.25,-0.125,0.125,-0.1875,0.0,0.3125},
      {0.1875,-0.125,0.125,0.25,0.0,0.3125},
      {-0.1875,-0.5,0.1875,0.1875,-0.4375,0.4375},
      {-0.25,-0.4375,0.1875,-0.1875,-0.375,0.4375},
      {-0.125,-0.4375,0.1875,-0.0625,-0.375,0.25},
      {0.0625,-0.4375,0.1875,0.125,-0.375,0.25},
      {0.1875,-0.4375,0.1875,0.25,-0.375,0.4375},
      {-0.125,-0.3125,0.1875,-0.0625,-0.1875,0.25},
      {0.0625,-0.3125,0.1875,0.125,-0.1875,0.25},
      {-0.1875,-0.25,0.1875,-0.125,-0.1875,0.5},
      {0.125,-0.25,0.1875,0.1875,-0.1875,0.5},
      {-0.3125,-0.125,0.1875,-0.25,-0.0625,0.3125},
      {-0.1875,-0.125,0.1875,-0.125,0.0,0.25},
      {0.125,-0.125,0.1875,0.1875,0.0,0.25},
      {0.25,-0.125,0.1875,0.3125,-0.0625,0.3125},
      {-0.25,-0.5,0.25,-0.1875,-0.4375,0.375},
      {0.1875,-0.5,0.25,0.25,-0.4375,0.375},
      {-0.3125,-0.4375,0.25,-0.25,-0.375,0.375},
      {0.25,-0.4375,0.25,0.3125,-0.375,0.375},
      {-0.1875,-0.1875,0.25,-0.0625,-0.125,0.5},
      {0.0625,-0.1875,0.25,0.1875,-0.125,0.5},
      {-0.0625,-0.0625,0.25,0.0625,0.0,0.4375},
      {-0.1875,-0.125,0.3125,-0.0625,0.0,0.4375},
      {0.0625,-0.125,0.3125,0.1875,0.0,0.4375},
      {-0.3125,-0.375,0.375,-0.25,-0.25,0.4375},
      {0.25,-0.375,0.375,0.3125,-0.25,0.4375},
      {-0.25,-0.25,0.375,-0.1875,-0.1875,0.4375},
      {0.1875,-0.25,0.375,0.25,-0.1875,0.4375},
      {-0.1875,-0.4375,0.4375,0.1875,-0.25,0.5},
      {-0.25,-0.375,0.4375,-0.1875,-0.25,0.5},
      {0.1875,-0.375,0.4375,0.25,-0.25,0.5},
      {-0.125,-0.25,0.4375,0.125,-0.1875,0.5},
      {-0.0625,-0.1875,0.4375,0.0625,-0.0625,0.5},
      {-0.125,-0.125,0.4375,-0.0625,-0.0625,0.5},
      {0.0625,-0.125,0.4375,0.125,-0.0625,0.5},
    }
  },
}


for key, value in pairs(skulls) do
  local name = key;
  local desc = "";
  if (key~="") then
    name = "_"..name;
    desc = " ("..key..")";
  end
  
  local node_box_top_skull = table.copy(node_box_top);
  for index, box in pairs(value[1]) do
    table.insert(node_box_top_skull.fixed, box)
  end
  local node_box_back_skull = table.copy(node_box_back);
  for index, box in pairs(value[2]) do
    table.insert(node_box_back_skull.fixed, box)
  end
  
  skeletons.register_skeleton("player_skeleton_bottom"..name, S("part of player skeleton")..desc, node_box_bottom)
  skeletons.register_skeleton("player_skeleton_top"..name, S("part of player skeleton")..desc, node_box_top_skull)

  skeletons.register_skeleton("player_skeleton_front"..name, S("part of player lying skeleton")..desc, node_box_front)
  skeletons.register_skeleton("player_skeleton_back"..name, S("part of player lying skeleton")..desc, node_box_back_skull)

  skeletons.register_skeleton_transform("player_skeleton_bottom"..name, "player_skeleton_front"..name, true)
  skeletons.register_skeleton_transform("player_skeleton_top"..name, "player_skeleton_back"..name, true)
end
