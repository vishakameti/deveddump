global class accountservice {
    
    webservice static string createcustomer(string name,string phone,string city){
        
        account objA = new Account();
        objA.name = name;
        objA.Phone = phone;
        objA.BillingCity = City;
        
        insert objA;
        
        if(objA.Id !=null){
            return 'success';
        }else{
            return 'failure';
        }
        }
}