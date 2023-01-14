ignore = {
  -- only spaces on lines
  "611",
  -- two long line
  "631",
  -- ignore unused self argument
  "212/self",
  -- ignore arguments with _ prefix
  "21/_.*",
}

read_globals = {
  -- minetest
  "AreaStore",
  "dump",
  "minetest",
  "vector",
  "VoxelManip",
  "VoxelArea",
  "ItemStack",
  -- special minetest functions
  "table.copy",
  "math.round",
  -- mods
  "default",
  "hades_sounds",
  "sounds",
}

globals = {
  "skeletons",
}

exclude_files = {
  "data/",
}
