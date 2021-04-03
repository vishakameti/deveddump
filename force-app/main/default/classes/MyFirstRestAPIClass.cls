@RestResource(urlMapping='/api/Account/*')
global with sharing class MyFirstRestAPIClass
{
    @HttpGet
    global static Account  doGet() 
    {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String AccNumber = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Account result = [SELECT Name FROM Account WHERE AccountNumber = '12345' limit 1];
        return result;
    }

    @HttpDelete
    global static void doDelete() 
    {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String AccNumber = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        List<Account> result = [SELECT Id, Name, Phone, Website FROM Account WHERE AccountNumber = '12345' ];
        delete result;
    }

    @HttpPost
    global static String doPost(String base64) 
    {
        
        string s1=base64;
        Blob b1= EncodingUtil.base64Decode(s1);
//String s2= b1.tostring();

Attachment attachmentPDF = new Attachment();
attachmentPdf.parentId = '0017F00000tMpq9';
attachmentPdf.name = 'vishakapi'+ '.pdf';
attachmentPdf.body = b1;
insert attachmentPDF;
        Return 'done';
    }

}