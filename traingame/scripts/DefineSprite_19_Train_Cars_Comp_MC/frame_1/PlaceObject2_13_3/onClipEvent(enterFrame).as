onClipEvent(enterFrame){
   if(_root.Paused == true)
   {
      return undefined;
   }
   my_x = _parent._x + Add_x;
   my_y = _parent._y + Add_y;
   if(_root.track_segments_MC.hitTest(my_x,my_y,true) == false)
   {
      DestroyTrain();
   }
   else
   {
      do_test_against_segments();
   }
   if(crash_timer < 5 * _parent.my_position_in_train && _root.you_win == false)
   {
      if(_root.train_crash_timer_running == true)
      {
         crash_timer++;
         _parent.train_car._rotation = _parent.train_car._rotation + 5;
      }
      if(segment_data[0] == "curve")
      {
         theta_delta_total = theta_delta_total + my_theta_delta;
         if(vert_flag == false)
         {
            theta_total = 90 - theta_delta_total;
         }
         else
         {
            theta_total = theta_delta_total;
         }
         theta_rad = theta_total * 0.017453;
         var new_speed_x = Math.round(25 * Math.cos(theta_rad));
         var new_speed_y = Math.round(25 * Math.sin(theta_rad));
         _parent._x = start_x + x_factor * new_speed_x;
         _parent._y = start_y + y_factor * new_speed_y;
         _parent._rotation = train_mod_angle + clockwise * theta_delta_total;
         distance_travelled = distance_travelled + parseInt(start_speed);
         if(start_speed != _root.train_speed)
         {
            distance_remaining = distance_for_90_deg - distance_travelled;
            do_calculate_angular_stuff(90 - theta_delta_total,distance_remaining);
         }
      }
      if(segment_data[0] == "straight" || segment_data[0] == "crossing")
      {
         _parent._x = _parent._x + _root.train_speed * x_factor;
         _parent._y = _parent._y + _root.train_speed * y_factor;
         _parent._rotation = _parent._rotation + crash_rotation_amount;
         if(segment_data[0] == "crossing")
         {
         }
      }
      if(segment_data[0] == "station")
      {
         if(_parent._x >= station_stop_point)
         {
            _root.do_you_win();
            return undefined;
         }
         _parent._x = _parent._x + _root.train_speed * x_factor;
         _parent._y = _parent._y + _root.train_speed * y_factor;
      }
   }
}
