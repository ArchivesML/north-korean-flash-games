stop();
_root.tunnel_counter = _root.tunnel_counter + 1;
tunnel_ID = "tunnel_top_" + _root.tunnel_counter;
_root.tunnels_overlay_MC.attachMovie("tunnel_top_right_MC",tunnel_ID,_root.tunnel_counter);
_root.tunnels_overlay_MC[tunnel_ID]._x = _X;
_root.tunnels_overlay_MC[tunnel_ID]._y = _Y;
no_bomb = true;
enter_left = new Array("straight",1,0);
enter_right = new Array("straight",-1,0);
enter_top = new Array("crash");
enter_bottom = new Array("crash");
