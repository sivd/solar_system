class Lock
{
  boolean locked = false;
  
  void lock()
  {
    if(!locked) locked = true; 
    else lock();
  }
  
  void unlock()
  {
    locked = false;
  }
}
