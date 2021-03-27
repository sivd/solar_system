class Lock
{
  boolean locked = false;
  
  void lock()
  {
    if(!locked) locked = true; 
    else 
    {
      delay(100);
      lock();
    }
  }
  
  void unlock()
  {
    locked = false;
  }
}
