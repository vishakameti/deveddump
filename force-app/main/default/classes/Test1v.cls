public class Test1v
{
public List<Integer> counterId{get;set;}
List<SelectOption> options{get;set;}
public Test1v(ApexPages.StandardController controller)
{}
public Test1v()
{
options = new List<SelectOption>();
options.add(new SelectOption('Audi','Audi'));
counterId = new List<Integer>();
counterId.add(1);
}
public PageReference addFilter()
{
counterId.add(1);
return null;
}
public List<SelectOption> getCars()
{

return options;
}
}