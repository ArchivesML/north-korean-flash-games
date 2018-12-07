function SetUp_NextLevel()
{
   var _loc1_ = _root;
   _loc1_.num_cars_this_level = _loc1_.num_cars_this_level + 1;
   _loc1_.do_get_map_num();
   _loc1_.gotoAndPlay("StartGame");
}
function DeleteMemory()
{
   var _loc1_ = _root;
   c = 1;
   while(c < _loc1_.num_cars_this_level + 1)
   {
      train_car_ID = "train_car_" + c;
      _loc1_.train_holder_MC[train_car_ID].removeMovieClip();
      c++;
   }
   c = 3;
   while(c < _loc1_.number_segments + 1)
   {
      new_ID = "segment_" + c;
      _loc1_.track_segments_MC[new_ID].removeMovieClip();
      c++;
   }
}
function Correct_Pos_AccordingGrid(passed_x, start_x, passed_y, start_y)
{
   var _loc2_ = do_the_grid_snap(passed_x,start_x);
   var _loc1_ = do_the_grid_snap(passed_y,start_y);
   var _loc3_ = new Array(_loc2_,_loc1_);
   return _loc3_;
}
function do_the_grid_snap(passed_value, start_value)
{
   var _loc2_ = passed_value - start_value;
   var _loc1_ = Math.round(_loc2_ / _root.Grid_Size);
   var _loc3_ = start_value + _loc1_ * _root.Grid_Size;
   return _loc3_;
}
function Get_NewTrackNumber()
{
   var _loc2_ = _root;
   var _loc1_ = _loc2_.segment_temp_array.length;
   if(_loc1_ < 1)
   {
      _loc2_.segment_temp_array = new Array(0,1,2,3,4,5,6,7,8);
      _loc1_ = _loc2_.segment_temp_array.length;
   }
   var _loc3_ = Math.floor(Math.random() * _loc1_);
   var staseg = _loc2_.segment_temp_array[_loc3_];
   _loc2_.segment_temp_array.splice(_loc3_,1);
   return staseg;
}
function do_attach_track_segment(passed_type, passed_x, passed_y)
{
   var _loc1_ = _root;
   _loc1_.number_segments = _loc1_.number_segments + 1;
   var _loc2_ = "segment_" + _loc1_.number_segments;
   _loc1_.track_segments_MC.attachMovie(passed_type,_loc2_,_loc1_.number_segments);
   _loc1_.track_segments_MC[_loc2_]._x = passed_x;
   _loc1_.track_segments_MC[_loc2_]._y = passed_y;
}
function do_increase_score(passed_amount, passed_bonus_flag)
{
}
function LoadSound(passed_name)
{
   var _loc1_ = passed_name;
   _root[_loc1_] = new Sound();
   _root[_loc1_].attachSound(_loc1_);
}
function DisplayTrainDestroyed()
{
   var _loc1_ = _root;
   _loc1_.Pause = true;
   _loc1_.DeleteMemory();
   _loc1_.gotoAndPlay("Fail");
}
function do_you_win()
{
   var _loc1_ = _root;
   _loc1_.DeleteMemory();
   _loc1_.Paused = true;
   _loc1_.you_win = true;
   if(_loc1_.current_map_num == number_of_levels)
   {
      _loc1_.gotoAndPlay("GameEnd");
   }
   else
   {
      _loc1_.gotoAndPlay("Success");
   }
}
function do_get_map_num()
{
   _root.current_map_num = _root.current_map_num + 1;
}
function do_trigger_bonus(passed_score, bonus_spawn_x, bonus_spawn_y)
{
   var _loc1_ = _root;
   bonus_counter++;
   _loc1_.Score = _loc1_.Score + passed_score;
   bonus_ID = "bonus_" + bonus_counter;
   _loc1_.bonus_display_MC.attachMovie("bonus_MC",bonus_ID,bonus_counter);
   _loc1_.bonus_display_MC[bonus_ID].bonus_amount = passed_score;
   _loc1_.bonus_display_MC[bonus_ID]._x = bonus_spawn_x;
   _loc1_.bonus_display_MC[bonus_ID]._y = bonus_spawn_y;
}
