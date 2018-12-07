onClipEvent(load){
   function Attach_Body_ToTrain(set_car_type)
   {
      var _loc1_ = _root;
      train_car_counter++;
      train_car_ID = "train_car_" + train_car_counter;
      _loc1_.train_holder_MC.attachMovie("Train_Cars_Comp_MC",train_car_ID,100 - train_car_counter);
      _loc1_.train_holder_MC[train_car_ID]._x = train_start_x;
      _loc1_.train_holder_MC[train_car_ID]._y = _loc1_.track_segments_MC.segment_1._y;
      _loc1_.train_holder_MC[train_car_ID].my_car_type = set_car_type;
      _loc1_.train_holder_MC[train_car_ID].my_position_in_train = train_car_counter;
   }
   function Reset_Train()
   {
      var _loc1_ = _root;
      _loc1_.active_segments_array = new Array();
      _loc1_.train_speed = _loc1_.normal_speed;
      _loc1_.SpeedMC.gotoAndStop(1);
      _loc1_.train_speed = _loc1_.normal_speed;
      c = 1;
      while(c < _loc1_.num_cars_this_level + 1)
      {
         train_car_ID = "train_car_" + c;
         _loc1_.train_holder_MC[train_car_ID].removeMovieClip();
         c++;
      }
      delay_start_timer = 0;
      train_car_counter = 0;
   }
   delay_start_timer = 0;
   train_car_counter = 0;
   train_start_x = _root.track_segments_MC.segment_1._x - (_root.Grid_Size / 2 - 1);
}
