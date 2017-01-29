// Interface for observable classes
public interface ISubject {
  // Suggested implementation
  // private ObserverNode [] observers = new ObserverNode[15];
  // private int _NumObservers;
  
  public abstract void add( ObserverNode observer );
  public abstract void remove( ObserverNode observer );
  
  public abstract void sendNotify();
}