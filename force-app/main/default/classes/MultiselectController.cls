//--------------------------
// Controller
public class MultiselectController {

    

    public List<SelectOption> options { get; set; }
    public String[] value { get; set; }
    public string s{get;set;}
    public MultiselectController(){Temp();}
    public void Temp() {
        value = new String[] { '1', '2' };
        options  = new List<SelectOption> {
            new SelectOption('1', 'One'),
            new SelectOption('2', 'Two'),
            new SelectOption('3', 'Three'),
            new SelectOption('4', 'Four')
        };
    }
    
     public void expand() {
     
        options.add(new SelectOption('5','nine'));
        
    }
}