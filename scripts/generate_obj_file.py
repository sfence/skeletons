#!/bin/python

import sys
import lupa

if (len(sys.argv)<3):
  print("Usage: generate_node_box.py schema_file output_file [facemtl] [rawfaces]")
  exit();

schema_file = open(sys.argv[1], "r");
schema = schema_file.read();
schema_file.close();

if schema.startswith("5:"):
  schema = schema[2:];
else:
  print("schema_file format is not supported.")
  exit();

usemtl = False;
rawfaces = False;
for arg in range(3,len(sys.argv)):
  if (sys.argv[arg]=="facemtl"):
    usemtl = True;
    print("Use different materials for diferent faces.");
  elif sys.argv[arg]=="rawfaces":
    rawfaces = True;
    print("Use raw faces without merging.");
  
lua = lupa.LuaRuntime(unpack_returned_tuples=True)
lua.execute("function get_schema() {} end".format(schema))
schema = dict(lua.eval("get_schema()"))

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
  if value==0:
    value = 1;
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

node_objs = "";
  
s_i = 1;
v_i = 1;
vt_i = 1;
vn_i = 0;

def generate_obj(node_x, node_y, node_z, schema):  
  check_sides = [[0,1,0],[0,-1,0],[1,0,0],[-1,0,0],[0,0,-1],[0,0,1]];
  variants_all = [
      [[0, -1/32, -1/32],[0, -1/32, 1/32],[0, 1/32, 1/32],[0, 1/32, -1/32]],
      [[-1/32, 0, -1/32],[-1/32, 0, 1/32],[1/32, 0, 1/32],[1/32, 0, -1/32]],
      [[-1/32, -1/32, 0],[-1/32, 1/32, 0],[1/32, 1/32, 0],[1/32, -1/32, 0]]
    ]
  tvariants = [[-1/32, -1/32],[-1/32, 1/32],[1/32, 1/32],[1/32, -1/32]];
  
  v = "";
  vt = "";
  vn = "";
  f = "";
  
  global s_i;
  global v_i;
  global vt_i;
  global vn_i;
  
  v_d = {};
  
  for side in check_sides:
    variants = [];
    layer_axis = None
    if side[0]!=0:
      variants = variants_all[0];
      layer_axis = 0
    if side[1]!=0:
      variants = variants_all[1];
      layer_axis = 1
    if side[2]!=0:
      variants = variants_all[2];
      layer_axis = 2
    vn = vn + "vn {} {} {}\n".format(-side[0], side[1], side[2]);
    vn_i = vn_i + 1;
    
    usemtl_mat = "";
    if usemtl:
      usemtl_mat = "_x_{}_y_{}_z_{}".format(side[0], side[1], side[2]);
    
    if rawfaces:
      for z in range(16):
        for y in range(16):
          for x in range(16):
            node   = schema[z*256+y*16+x];
            side_x = x + side[0];
            side_y = y + side[1];
            side_z = z + side[2];
            node_side = None;
            if (side_x>=0) and (side_y>=0) and (side_z>=0) and (side_x<16) and (side_y<16) and (side_z<16) :
              node_side = schema[(z+side[2])*256+(y+side[1])*16+(x+side[0])]
            
            if (node!=None) and (node_side==None):
              face = {}
              
              vx = -15/32 + x/16 + side[0]/32;
              vy = -15/32 + y/16 + side[1]/32;
              vz = -15/32 + z/16 + side[2]/32;
              
              #if side[0]!=0:
              vtx = 1/32 + y/16;
              vty = 1/32 + z/16;
              if side[1]!=0:
                vtx = 1/32 + (15-x)/16;
                vty = 1/32 + z/16;
              if side[2]!=0:
                vtx = 1/32 + (15-x)/16;
                vty = 1/32 + y/16;
              
              v_n = [];
              for variant in variants:
                h_v = "v {} {} {}\n".format(-(vx-variant[0]), vy+variant[1], vz+variant[2]);
                if h_v not in v_d:
                  v = v + h_v;
                  v_d[h_v] = v_i;
                  v_i = v_i + 1;
                
                v_n.append(v_d[h_v]);
                
              for variant in tvariants:
                vt = vt + "vt {} {}\n".format(vtx+variant[0], vty+variant[1]);

              f = f + "usemtl {}{}\n".format(node, usemtl_mat);
              f = f + "s {}\n".format(s_i);
              if (vn_i%2)==1:
                f = f + "f {}/{}/{} {}/{}/{} {}/{}/{} {}/{}/{}\n".format(v_n[0], vt_i, vn_i, v_n[1], vt_i+1, vn_i, v_n[2], vt_i+2, vn_i, v_n[3], vt_i+3, vn_i);
              else:
                f = f + "f {}/{}/{} {}/{}/{} {}/{}/{} {}/{}/{}\n".format(v_n[3], vt_i+3, vn_i, v_n[2], vt_i+2, vn_i, v_n[1], vt_i+1, vn_i, v_n[0], vt_i+0, vn_i);
              
              s_i = s_i + 1;
              vt_i = vt_i + 4;
    else:
      faces = [None] * (16*16*16);
      for z in range(16):
        for y in range(16):
          for x in range(16):
            
            node   = schema[z*256+y*16+x];
            side_x = x + side[0];
            side_y = y + side[1];
            side_z = z + side[2];
            node_side = None;
            if (side_x>=0) and (side_y>=0) and (side_z>=0) and (side_x<16) and (side_y<16) and (side_z<16) :
              node_side = schema[(z+side[2])*256+(y+side[1])*16+(x+side[0])]
            
            if (node!=None) and (node_side==None):
              faces[z*256+y*16+x] = node
    
      for z in range(16):
        for y in range(16):
          for x in range(16):
            node = faces[z*256+y*16+x]
            if (node!=None):
              # find part
              pos_from = [x,y,z]
              pos_to = [x,y,z]
              first_axis = True
              for axis in range(0,3):
                if axis!=layer_axis:
                  for test in range(pos_from[axis],16):
                    pos_test = pos_to.copy()
                    pos_test[axis] = test
                    if first_axis:
                      if faces[pos_test[2]*256+pos_test[1]*16+pos_test[0]]==node:
                        pos_to[axis] = test
                      else:
                        first_axis = False
                        break
                    else:
                      valid = True
                      for tz in range(z,pos_test[2]+1):
                        for ty in range(y,pos_test[1]+1):
                          for tx in range(x,pos_test[0]+1):
                            if faces[tz*256+ty*16+tx]!=node:
                              valid = False
                              break
                      if valid:
                        pos_to[axis] = test
                      else:
                        first_axis = False
                        break
                  
                  first_axis = False
              
              v_n = [];
              for variant in variants:
                # from_pos part
                vx = -15/32 + x/16 + side[0]/32;
                vy = -15/32 + y/16 + side[1]/32;
                vz = -15/32 + z/16 + side[2]/32;
                if variant[0]<0:
                  vx = -15/32 + pos_to[0]/16 + side[0]/32;
                if variant[1]>0:
                  vy = -15/32 + pos_to[1]/16 + side[1]/32;
                if variant[2]>0:
                  vz = -15/32 + pos_to[2]/16 + side[2]/32;
              
                h_v = "v {} {} {}\n".format(-(vx-variant[0]), vy+variant[1], vz+variant[2]);
                if h_v not in v_d:
                  v = v + h_v;
                  v_d[h_v] = v_i;
                  v_i = v_i + 1;
                
                v_n.append(v_d[h_v]);
                
              for variant in tvariants:
                #if side[0]!=0:
                vtx = 1/32 + y/16;
                vty = 1/32 + z/16;
                if variant[0]>0:
                  vtx = 1/32 + pos_to[1]/16;
                if variant[1]>0:
                  vty = 1/32 + pos_to[2]/16;
                if side[1]!=0:
                  vtx = 1/32 + (15-x)/16;
                  vty = 1/32 + z/16;
                  if variant[0]<0:
                    vtx = 1/32 + (15-pos_to[0])/16;
                  if variant[1]>0:
                    vty = 1/32 + pos_to[2]/16;
                if side[2]!=0:
                  vtx = 1/32 + (15-x)/16;
                  vty = 1/32 + y/16;
                  if variant[0]<0:
                    vtx = 1/32 + (15-pos_to[0])/16;
                  if variant[1]>0:
                    vty = 1/32 + pos_to[1]/16;
                
                vt = vt + "vt {} {}\n".format(vtx+variant[0], vty+variant[1]);

              f = f + "usemtl {}{}\n".format(node, usemtl_mat);
              f = f + "s {}\n".format(s_i);
              if (vn_i%2)==1:
                f = f + "f {}/{}/{} {}/{}/{} {}/{}/{} {}/{}/{}\n".format(v_n[0], vt_i, vn_i, v_n[1], vt_i+1, vn_i, v_n[2], vt_i+2, vn_i, v_n[3], vt_i+3, vn_i);
              else:
                f = f + "f {}/{}/{} {}/{}/{} {}/{}/{} {}/{}/{}\n".format(v_n[3], vt_i+3, vn_i, v_n[2], vt_i+2, vn_i, v_n[1], vt_i+1, vn_i, v_n[0], vt_i+0, vn_i);
              
              s_i = s_i + 1;
              vt_i = vt_i + 4;
              
              # erase added faces
              for fz in range(z,pos_to[2]+1):
                for fy in range(y,pos_to[1]+1):
                  for fx in range(x,pos_to[0]+1):
                    faces[fz*256+fy*16+fx] = None
  
  
  node_obj = "# node obj {{x={}, y={}, z={}}}\n".format(node_x, node_y, node_z);
  node_obj = node_obj + "o node_{}_{}_{}\n\n".format(node_x, node_y, node_z);
  
  node_obj = node_obj + v;
  node_obj = node_obj + "\n";
  node_obj = node_obj + vt;
  node_obj = node_obj + "\n";
  node_obj = node_obj + vn;
  node_obj = node_obj + "\n";
  node_obj = node_obj + "g node_{}_{}_{}\n".format(node_x, node_y, node_z);
  node_obj = node_obj + f;
  node_obj = node_obj + "\n\n";
  return node_obj;

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
        
      node_objs = node_objs + generate_obj(box_x, box_y, box_z, box_schema);


output_file = open(sys.argv[2], "w");
output_file.write(node_objs);
output_file.close();

