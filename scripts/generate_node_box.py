#!/bin/python

import sys
import lupa

if len(sys.argv)!=3:
  print("Usage: generate_node_box.py schema_file output_file")
  exit();

schema_file = open(sys.argv[1], "r");
schema = schema_file.read();
schema_file.close();

if schema.startswith("5:return {"):
  schema = schema[9:];
else:
  print("schema_file format is not supported.")
  exit();
  
lua = lupa.LuaRuntime(unpack_returned_tuples=True)
schema = dict(lua.eval(schema))

min_x = None
max_x = None
min_y = None
max_y = None
min_z = None
max_z = None
  
for node in schema.values():
  x =  node["x"];
  if (not min_x) or (x<min_x):
    min_x = x;
  if (not max_x) or (x>max_x):
    max_x = x;
  y =  node["y"];
  if (not min_y) or (y<min_y):
    min_y = y;
  if (not max_y) or (y>max_y):
    max_y = y;
  z =  node["z"];
  if (not min_z) or (z<min_z):
    min_z = z;
  if (not max_z) or (z>max_z):
    max_z = z;

size_x = max_x - min_x + 1;
size_y = max_y - min_y + 1;
size_z = max_z - min_z + 1;
print("Schema size is: {}x{}x{}".format(size_x, size_y, size_z));

def fit_to_16_min(value):
  rem = value % 16;
  return value - rem;
def fit_to_16_max(value):
  rem = value % 16;
  if rem!=0:
    rem = 16 - rem;
  return value + rem;

min_x = fit_to_16_min(min_x);
max_x = fit_to_16_max(max_x)-1;
min_y = fit_to_16_min(min_y);
max_y = fit_to_16_max(max_y)-1;
min_z = fit_to_16_min(min_z);
max_z = fit_to_16_max(max_z)-1;
size_x = max_x - min_x + 1;
size_y = max_y - min_y + 1;
size_z = max_z - min_z + 1;
print("Schema size is: {}x{}x{}".format(size_x, size_y, size_z));

nodes_x = (size_x)//16;
nodes_y = (size_y)//16;
nodes_z = (size_z)//16;
print("Nodes size is: {}x{}x{}".format(nodes_x, nodes_y, nodes_z));

node_boxes = "";

def generate_node_box(x, y, z, schema): 
  node_box = "  -- node box {{x={}, y={}, z={}}}\n".format(x, y, z);
  node_box = node_box + "  node_box = {\n";
  node_box = node_box + "    type = \"fixed\",\n";
  node_box = node_box + "    fixed = {\n";
  
  for x in range(16):
    for y in range(16):
      for z in range(16):
        node = schema[z*256+y*16+x];
        if node:
          box_x = (x/16)-0.5;
          box_y = (y/16)-0.5;
          box_z = (z/16)-0.5;
          node_box = node_box + "      {{{},{},{},".format(box_x, box_y, box_z);
          box_x = box_x + 1/16;
          box_y = box_y + 1/16;
          box_z = box_z + 1/16;
          node_box = node_box + "{},{},{}}},\n".format(box_x, box_y, box_z);

  node_box = node_box + "    },\n";
  node_box = node_box + "  },\n";
  return node_box;

for box_x in range(nodes_x):
  min_x = box_x*16;
  for box_y in range(nodes_y):
    min_y = box_y*16;
    for box_z in range(nodes_z):
      min_z = box_z*16;
      
      box_schema = [None] * (16*16*16);
      for node in schema.values():
        x = node["x"] - min_x;
        y = node["y"] - min_y;
        z = node["z"] - min_z;
        if (x>=0) and (x<16) and (y>=0) and (y<16) and (z>=0) and (z<16):
          box_schema[z*256+y*16+x] = node["name"];
        
      node_boxes = node_boxes + generate_node_box(box_x, box_y, box_z, box_schema);


output_file = open(sys.argv[2], "w");
output_file.write(node_boxes);
output_file.close();

