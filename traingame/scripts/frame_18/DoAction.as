_root.Paused = false;
_root.number_segments = 0;
_root.num_cars_this_level = num_cars_array[current_map_num - 1];
_root.start_train_delay = start_delays_array[current_map_num - 1];
_root.train_car_length = 34;
_root.train_speed = _root.normal_speed;
_root.SpeedMC.gotoAndStop(1);
_root.you_win = false;
_root.train_crash_timer_running = false;
active_segments_array = new Array();
_root.steam_sound.stop();
_root.game_loop.start(0,999);
