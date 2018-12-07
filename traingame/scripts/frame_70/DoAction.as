_root.CounterMC._visible = true;
_root.train_crash_timer_running = false;
if(_root.bombs.bombs_remaining_count == 0)
{
   _root.bombs.bombs_remaining_count = 3;
   _root.bombs_remaining_text = "x" + _root.bombs.bombs_remaining_count;
   _root.bombs.CreateNewBomb();
}
_root.gotoAndPlay("StartGame");
