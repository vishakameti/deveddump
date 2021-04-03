@RestResource(urlMapping='/vishak/*')
global with sharing class CaseManager {

    @HttpPost
    global static ID createCase(String subject, String status,
        String origin, String priority) {

         RestRequest req=RestContext.request;
      RestResponse res=RestContext.response;
            
        Case thisCase = new Case(
            Subject=subject,
            Status=status,
            Origin=origin,
            Priority=priority);
        insert thisCase;
        return thisCase.Id;
    }   
        
}