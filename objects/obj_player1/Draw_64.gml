/// @description Insert description here


var c = c_black;
_x1 = 6;
_y1 = 6;
_x2 = 400;
_y2 = 200;
_buff = 24;
draw_rectangle_colour(_x1,_y1,_x2,_y2,c,c,c,c,false);

draw_text(_x1,_y1+_buff,"Collection total = "+string(collection_details_array[collection_details_index-1][TOTAL_QTY]));
draw_text(_x1,_y1+_buff*2,"Horizontal total = "+string(collection_details_array[collection_details_index-1][HORZT_QTY]));
draw_text(_x1,_y1+_buff*3,"Vertical total = "+string(collection_details_array[collection_details_index-1][VERTT_QTY]));
draw_text(_x1,_y1+_buff*4,"FS Diagonal total = "+string(collection_details_array[collection_details_index-1][DFRST_QTY]));
draw_text(_x1,_y1+_buff*5,"BS Diagonal total = "+string(collection_details_array[collection_details_index-1][DBAST_QTY]));

