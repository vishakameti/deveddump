public class cAccheirarchy 
{
    public Account acc{get;set;}
    //------------------gap of 1px above the Account (Grand Hotel)-------
    public List<String> tdgap1{get;set;}
    public List<Account> chldacclst{get;set;}
    public List<String> tdborder{get;set;}
    public List<String> trnumber{get;set;}
    public Integer y{get;set;}
    
    public String td_top_border{get;set;}
    public String td_right_border{get;set;}
    public Integer chldacclstsize{get;set;}
    
    public cAccheirarchy ()
    {
        String CustomerAccountID=ApexPages.currentPage().getParameters().get('CustomerAccountID');
        td_top_border='td_top_border';
        td_right_border='td_right_border';
        acc=new Account();
        acc=[SELECT ID,Name FROM Account limit 1];
        
        //------------------gap of 1px above the Account (Grand Hotel)-------
        //----Deviding the section by 50 for the arrangement in grid---------
        tdgap1=new List<String>();
        for(Integer i=0;i<50;i++)
        {
            tdgap1.add(String.valueOf(i)); 
        }
        
        chldacclst=new List<Account>([SELECT ID,Name from Account limit 10 ]);
        
        //------------------ based on the child account numbers --------
        //----td right border and top border-------------
        tdborder=new List<String>();
        //------this variable holds size of the child accounts-----------
        chldacclstsize=chldacclst.size();
        
        //---------variations based on different situations------
        //-----this create number tree branch maxx as 5 based on child account number
        if(chldacclst.size()>=5)
        {
        //------------------maxx tree branch is 5----------
            for(integer j=0;j<4;j++)
            {
                tdborder.add(String.ValueOf(j));
            }
        } 
        //--------------if number of child is less than 5 then tree will be generated dynamically based on the bellow variations----
        else if(chldacclst.size()<5)
        {
            //-----if number of child is more than 4 or 3 then branch will be created as per repeat which does not required to remove any top border 
            if(chldacclst.size()>=3)
            {
                //----------if child account size is 4 then 3 more td border is needed---
                //---if number of child account is 3 then two more td border is needed -----
                //-------because 1 already added at the begining--------
                for(integer j=0;j<chldacclst.size()-1;j++)
                {
                    tdborder.add(String.ValueOf(j));
                }
            }
            
            //----------------if number of child is less than 3 then 
            //-----td top border will be generated but top border will not generated for one td-----
            if(chldacclst.size()==2)
            {
                for(integer j=0;j<chldacclst.size();j++)
                {
                    tdborder.add(String.ValueOf(j));
                }
            }
            //-----td top border will be generated but top border will not generated for two td-----
            if(chldacclst.size()==1)
            {
                for(integer j=0;j<chldacclst.size()+1;j++)
                {
                    tdborder.add(String.ValueOf(j));
                }
            }
        }
        
        //------------if number of child is more than 5 than child will be shown in two rows----------
        //-------trnumber variable indicates number of rows needed to be generated--------------------
        trnumber=new List<String>();
        if((chldacclst.size()/5)>0)
        {
            for(integer k=0;k<=chldacclst.size()/5;k++)
            {
                trnumber.add(String.ValueOf(k));
            }
        }
        //---------------------------if number of child is less than or equal to 5 then still one row needed to be generated--------
        if((chldacclst.size()/5)==0)
        {
            trnumber.add('0');
        }
        y=0;
        //-------------y will help to decide first row if child is more than 5 or less than 5
        if(trnumber.size()>1)
        {
            y=5;
        }
        else if(trnumber.size()<=1)
        {
            y=chldacclst.size();
        }
        
    }
}