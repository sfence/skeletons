Minetest mod: skeletons
=======================
Mod which add skeletons of different animals to game.

Source code:
-----------------------
Copyright (c) 2021 SFENCE
MIT - check LICENSE file

License of media (textures, sounds and models):
-----------------------------------------------
CC BY-SA 4.0 - check LICENSE file

Copyright (c) 2021 SFENCE (CC BY-SA 4.0):
All textures not mentioned below.

Adding new skeletons:
-----------------------
Python script scripts/generate_node_box.py which can be used to convert schematic saved via worldedit mod to node box which can be used in node registration.
Every 16x16x16 nodes is converted into one nodebox. Air nodes is ignored. If saved schematic contains bigger area then 16x16x16, more nodeboxes will be generated. So, you will have to assemble full skeleton from skeletons parts nodes.



