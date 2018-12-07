_visible = false;
stop();
var new_loc = _root.Correct_Pos_AccordingGrid(_parent._x,_root.Grid_Start_X,_parent._y,_root.Grid_Start_Y);
_parent._x = new_loc[0];
_parent._y = new_loc[1];
_root.number_segments = _root.number_segments + 1;
