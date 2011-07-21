package it.ht.rcs.console.operation.rest
{
  import it.ht.rcs.console.operation.model.Operation;
  
  import mx.collections.ArrayCollection;
  import mx.rpc.events.ResultEvent;
  
  public class DBOperationDemo implements IDBOperation
  {
    private var operations: ArrayCollection = new ArrayCollection([
      new Operation({_id: "4df7246d963d350964000001", name: "Swordfish", status: "open", desc: "Terrorist attack in Singapore", path: []}),
      new Operation({_id: "4e259fe5963d35425c000001", name: "BlackJack", status: "open", desc: "Mad bombers in Rome", path: []}),
      new Operation({_id: "4e25a173963d354260000003", name: "All In", status: "closed", desc: "Worldwide drug dealer network", path: []})
    ]);
    
    public function DBOperationDemo()
    {
    }
    
    public function all(onResult:Function=null, onFault:Function=null):void
    {     
      var event:ResultEvent = new ResultEvent('operation.all', false, true, operations);
      if (onResult != null)
        onResult(event);
    }
    
    public function show(id:String, onResult:Function=null, onFault:Function=null):void
    {
    }
    
    public function create(params:Object, onResult:Function=null, onFault:Function=null):void
    {
      params._id = new Date().getTime().toString();
      
      var operation:Operation = new Operation(params);
      operations.addItem(operation);
      
      var event:ResultEvent = new ResultEvent("operation.create", false, true, operation);
      onResult(event);
    }
    
    public function update(operation:Operation, property:Object, onResult:Function=null, onFault:Function=null):void
    {
    }
    
    public function destroy(id:String, onResult:Function=null, onFault:Function=null):void
    {
    }
  }
}