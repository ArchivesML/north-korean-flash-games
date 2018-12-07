onClipEvent(load){
   function do_test_against_segments()
   {
      var _loc1_ = _root;
      var _loc3_ = _parent;
      j = 1;
      while(j < _loc1_.number_segments + 1)
      {
         segment_ID = "segment_" + j;
         if(_loc1_.track_segments_MC[segment_ID].hitTest(my_x,my_y,true))
         {
            if(current_segment_name == _loc1_.track_segments_MC[segment_ID]._name)
            {
               return undefined;
            }
            var _loc2_ = _loc1_.active_segments_array.length;
            a = 0;
            while(a < _loc2_)
            {
               if(_loc1_.active_segments_array[a] == current_segment_name)
               {
                  _loc1_.active_segments_array.splice(a,1);
                  a = _loc2_;
               }
               a++;
            }
            current_segment_name = _loc1_.track_segments_MC[segment_ID]._name;
            _loc1_.active_segments_array.push(current_segment_name);
            _loc1_.track_segments_MC[segment_ID].segment_used = true;
            do_find_train_relative_to_segment(segment_ID);
            do_bounce_train_to_corrected_position();
            do_grab_segment_info();
            if(_loc3_.my_position_in_train == 1 && _loc1_.train_crash_timer_running != true)
            {
               if(_loc1_.track_segments_MC[segment_ID].give_bonus == true && _loc1_.track_segments_MC[segment_ID].bonus_used != true)
               {
                  score_inc = _loc1_.track_segments_MC[segment_ID].bonus_amount;
                  pass_bonus = true;
                  bonus_spawn_x = _loc1_.track_segments_MC[segment_ID]._x;
                  bonus_spawn_y = _loc1_.track_segments_MC[segment_ID]._y;
                  _loc1_.do_trigger_bonus(score_inc,bonus_spawn_x,bonus_spawn_y);
                  _loc1_.track_segments_MC[segment_ID].bonus_used = true;
                  _loc1_.track_segments_MC[segment_ID].bonus_item_MC._visible = false;
               }
               else
               {
                  score_inc = _loc1_.score_increment_amount;
                  pass_bonus = false;
               }
               _loc1_.do_increase_score(score_inc,pass_bonus);
            }
         }
         j++;
      }
   }
   function do_find_train_relative_to_segment(segment_ID)
   {
      var _loc3_ = _root;
      var _loc1_ = _loc3_.track_segments_MC[segment_ID]._x;
      var _loc2_ = _loc3_.track_segments_MC[segment_ID]._y;
      delta_x = _loc1_ - (my_x - Add_x);
      delta_y = _loc2_ - (my_y - Add_y);
      if(delta_x < -5)
      {
         corrected_x = _loc1_ + _loc3_.grid_size / 2;
         new_rotation = 180;
         my_quarter = "right";
         vert_flag = false;
      }
      else if(delta_x > 5)
      {
         corrected_x = _loc1_ - _loc3_.grid_size / 2;
         my_quarter = "left";
         new_rotation = 0;
         vert_flag = false;
      }
      else
      {
         corrected_x = _loc1_;
      }
      if(delta_y < -5)
      {
         corrected_y = _loc2_ + _loc3_.grid_size / 2;
         my_quarter = "bottom";
         new_rotation = -90;
         vert_flag = true;
      }
      else if(delta_y > 5)
      {
         corrected_y = _loc2_ - _loc3_.grid_size / 2;
         my_quarter = "top";
         new_rotation = 90;
         vert_flag = true;
      }
      else
      {
         corrected_y = _loc2_;
      }
   }
   function do_bounce_train_to_corrected_position()
   {
      var _loc1_ = _parent;
      _loc1_._x = corrected_x;
      _loc1_._y = corrected_y;
      _loc1_._rotation = new_rotation;
   }
   function do_grab_segment_info()
   {
      var _loc1_ = _root;
      quarter_ID = "enter_" + my_quarter;
      segment_data = null;
      var _loc2_ = _loc1_.track_segments_MC[segment_ID][quarter_ID].length;
      segment_data = _loc1_.track_segments_MC[segment_ID][quarter_ID].slice(0,_loc2_);
      if(segment_data[0] == "curve")
      {
         start_x = corrected_x + segment_data[1];
         start_y = corrected_y + segment_data[2];
         x_factor = segment_data[3];
         y_factor = segment_data[4];
         train_mod_angle = segment_data[5];
         clockwise = segment_data[6];
         theta_total = 0;
         theta_delta_total = 0;
         distance_travelled = 0;
         distance_for_90_deg = 3.141593 * _loc1_.grid_size / 4;
         do_calculate_angular_stuff(90,distance_for_90_deg);
      }
      else if(segment_data[0] == "straight" || segment_data[0] == "crossing")
      {
         x_factor = segment_data[1];
         y_factor = segment_data[2];
      }
      else if(segment_data[0] == "station")
      {
         x_factor = segment_data[1];
         y_factor = segment_data[2];
         station_stop_point = _parent._x + _loc1_.grid_size / 2;
      }
      else if(segment_data[0] == "crash")
      {
         DestroyTrain();
      }
   }
   function do_calculate_angular_stuff(passed_angle, passed_distance)
   {
      start_speed = _root.train_speed;
      var _loc1_ = passed_distance / start_speed;
      my_theta_delta = passed_angle / _loc1_;
   }
   function DestroyTrain()
   {
      var _loc1_ = _root;
      if(_loc1_.train_crash_timer_running == false)
      {
         _loc1_.crash_sound.start();
         _loc1_.train_crash_timer_running = true;
         _loc1_.DisplayTrainDestroyed();
      }
   }
   _visible = false;
   train_start_angle = 0;
   train_mod_angle = 0;
   x_factor = 1;
   segment_data = new Array("straight");
   crash_rotation_amount = 0;
   Add_x = _root.Grid_MC._x;
   Add_y = _root.Grid_MC._y;
}
