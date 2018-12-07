_visible = false;
if(my_type == "Random")
{
   my_limit = _root.segment_names_array.length;
   access_ID = Math.floor(Math.random() * my_limit);
   my_type = _root.segment_names_array[access_ID];
}
_root.do_attach_track_segment(my_type,_X,_Y);
