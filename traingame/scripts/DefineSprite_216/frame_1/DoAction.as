stop();
var bombs_remaining_count = 20;
_root.bombs_remaining_text = "x" + bombs_remaining_count;
function Start_BombDragging(passed_x, passed_y, passed_name)
{
   this[passed_name].startDrag(true);
}
function Stop_BombDragging(passed_name)
{
   var _loc1_ = _root;
   var _loc2_ = passed_name;
   bomb_allowed = true;
   if(_loc1_.track_segments_MC.hitTest(_loc1_._xmouse,_loc1_._ymouse,true))
   {
      j = 1;
      while(j < _loc1_.number_segments + 1)
      {
         segment_ID = "segment_" + j;
         if(_loc1_.track_segments_MC[segment_ID].hitTest(_loc1_._xmouse,_loc1_._ymouse,true))
         {
            var _loc3_ = _loc1_.active_segments_array.length;
            a = 0;
            while(a < _loc3_)
            {
               if(_loc1_.active_segments_array[a] == segment_ID)
               {
                  Set_Bomb_To_InitialPos(_loc2_);
                  bomb_allowed = false;
               }
               a++;
            }
            if(_loc1_.track_segments_MC[segment_ID].no_bomb == true)
            {
               Set_Bomb_To_InitialPos(_loc2_);
               bomb_allowed = false;
            }
            if(bomb_allowed == true)
            {
               _loc1_.bomb_sound.start();
               duplicateMovieClip("Explosion","explode",116307);
               explode._x = this[_loc2_]._x;
               explode._y = this[_loc2_]._y;
               explode.gotoAndPlay("Go");
               this[_loc2_].removeMovieClip();
               _loc1_.track_segments_MC[segment_ID].removeMovieClip();
               bombs_remaining_count--;
               _loc1_.bombs_remaining_text = "x" + bombs_remaining_count;
               if(bombs_remaining_count > 0)
               {
                  CreateNewBomb();
               }
            }
         }
         j++;
      }
   }
   else
   {
      Set_Bomb_To_InitialPos(_loc2_);
   }
}
function CreateNewBomb()
{
   var _loc1_ = this;
   bomb_generation_count++;
   bomb_ID = "bomb_" + bomb_generation_count;
   _loc1_.attachMovie("bomb_button_MC",bomb_ID,bomb_generation_count);
   _loc1_[bomb_ID]._x = 0;
   _loc1_[bomb_ID]._y = 0;
}
function Set_Bomb_To_InitialPos(passed_name)
{
   _root.no_drop_sound.start();
   this[passed_name]._x = 0;
   this[passed_name]._y = 0;
   stopDrag();
}
if(Active == true)
{
   CreateNewBomb();
}
