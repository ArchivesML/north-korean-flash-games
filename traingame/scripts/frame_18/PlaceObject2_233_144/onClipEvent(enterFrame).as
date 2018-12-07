onClipEvent(enterFrame){
   if(_root.Paused == false)
   {
      delay_start_timer++;
      _root.train_start_countdown_frames = _root.start_train_delay - delay_start_timer;
      if(Math.round(_root.train_start_countdown_frames / 20) < 0)
      {
         _root.train_start_countdown = 0;
         _root.CounterMC._visible = false;
      }
      else
      {
         _root.train_start_countdown = Math.round(_root.train_start_countdown_frames / 20);
      }
      if(delay_start_timer == _root.start_train_delay)
      {
         Attach_Body_ToTrain(1);
         _root.steam_sound.start();
      }
      if(train_car_counter < _root.num_cars_this_level)
      {
         if(_root.train_holder_MC[train_car_ID]._x - train_start_x > _root.train_car_length)
         {
            Attach_Body_ToTrain(2);
         }
      }
   }
}
