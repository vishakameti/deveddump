public class child {

    public child(){
        
        parent p = new parent();
        p.a = 50;
        p.b = 35;

        system.debug('p.a is'+p.a);
        system.debug('p.b is'+p.b);
    }
    
}