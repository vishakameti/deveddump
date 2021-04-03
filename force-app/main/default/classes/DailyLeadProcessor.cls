public class DailyLeadProcessor implements schedulable {
  
    public void execute(SchedulableContext sc ){
        list<lead> lc = [select id,name,leadsource from lead where leadsource =null];
        
        for(lead l1: lc ){
            l1.leadsource = 'Dreamforce';
        }
        update lc;
    }
}