this.onEnterFrame = function()
{
   var _loc1_ = _root.getBytesLoaded() / _root.getBytesTotal();
   if(_loc1_ == 1)
   {
      delete this.onEnterFrame;
   }
};
