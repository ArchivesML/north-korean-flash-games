spawn_piece_counter = 0;
slider_x = m1._x;
y_stop_1 = 149;
y_stop_2 = 201;
y_stop_3 = 253;
function Create_NewTrackPiece(passed_y)
{
   var _loc1_ = this;
   spawn_piece_counter++;
   new_ID = "spawn_piece_" + spawn_piece_counter;
   _loc1_.attachMovie("drag_track_MC",new_ID,spawn_piece_counter);
   _loc1_[new_ID]._x = slider_x;
   _loc1_[new_ID]._y = passed_y;
}
function Drop_TrackPiece(passed_name, passed_type, passed_y)
{
   var _loc1_ = _root;
   var _loc2_ = passed_name;
   var _loc3_ = passed_y;
   var drop_flag = true;
   drop_flag = Check_Mouse_Is_InGrid();
   if(drop_flag == true)
   {
      drop_flag = Check_Track_Existing_InMousePos();
   }
   if(drop_flag == false)
   {
      do_return_piece_to_start(_loc2_,_loc3_);
   }
   else
   {
      r = 1;
      while(r <= 8)
      {
         c = 1;
         while(c <= 8)
         {
            if(_loc1_.grid_MC["Grid" + r + c].hitTest(_loc1_._xmouse,_loc1_._ymouse,0))
            {
               seg_x = _loc1_.grid_MC["Grid" + r + c]._x;
               seg_y = _loc1_.grid_MC["Grid" + r + c]._y;
               _loc1_.do_attach_track_segment(passed_type,seg_x,seg_y);
               _loc1_.lay_track_sound.start();
               removeMovieClip(this[_loc2_]);
               Create_NewTrackPiece(_loc3_);
               return undefined;
            }
            c++;
         }
         r++;
      }
   }
}
function Check_Mouse_Is_InGrid()
{
   var _loc1_ = _root;
   if(!_loc1_.grid_MC.hitTest(_loc1_._xmouse,_loc1_._ymouse,true))
   {
      return false;
   }
   return true;
}
function Check_Track_Existing_InMousePos()
{
   var _loc1_ = _root;
   if(_loc1_.track_segments_MC.hitTest(_loc1_._xmouse,_loc1_._ymouse,true))
   {
      return false;
   }
}
function do_return_piece_to_start(passed_name, passed_y)
{
   stopDrag();
   _root.no_drop_sound.start();
   this[passed_name]._x = slider_x;
   this[passed_name]._y = passed_y;
}
if(Active == true)
{
   Create_NewTrackPiece(m1._y);
   Create_NewTrackPiece(m2._y);
   Create_NewTrackPiece(m3._y);
}
