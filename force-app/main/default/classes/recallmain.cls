public class recallmain {

    public String contentFile { get; set; }
    public string nameFile{get;set;}
    String[] filelines = new String[]{};

    Public String Vinlist{get;set;}
    
    public list<string> filevin{get;set;}
    public recallmain() {
    
    

    
    }


    






   
public pageReference GoToPage2(){
    nameFile =  contentFile;
    

  try {
    filevin = new list<string>();
    
    filevin = nameFile.split('\n');
    }
    
      catch(Exception e){
              ApexPages.Message errormsg = new ApexPages.Message(ApexPages.severity.ERROR,'An error has occured reading the txt file'+e.getMessage());
            ApexPages.addMessage(errormsg);
  }     
        PageReference pf = new PageReference('/apex/Recall_view?att='+Vinlist + '&filevins=' + filevin );
      return pf;   
  }
   }