package it.ht.rcs.console.network.rest
{
  
  
  import it.ht.rcs.console.DB;
  import it.ht.rcs.console.network.model.Proxy;
  import it.ht.rcs.console.network.model.ProxyRule;
  
  import mx.rpc.CallResponder;

  public class DBProxy extends _Super_DBProxy implements IDBProxy
  {
    
    public function DBProxy(host:String)
    {
      super();
      _serviceControl.baseURL = host;
    }
    
    public function all(onResult:Function=null, onFault:Function=null):void
    {
      var resp:CallResponder = DB.getCallResponder(onResult, onFault);
      resp.token = all_();
    }
    
    public function show(id:String, onResult:Function=null, onFault:Function=null):void
    {
      var resp:CallResponder = DB.getCallResponder(onResult, onFault);
      resp.token = show_(id);
    }
    
    public function create(params:Object, onResult:Function=null, onFault:Function=null):void
    {
      var resp:CallResponder = DB.getCallResponder(onResult, onFault);
      resp.token = create_(JSON.stringify(params));
    }
    
    public function update(proxy:Proxy, property:Object, onResult:Function=null, onFault:Function=null):void
    {
      var resp:CallResponder = DB.getCallResponder(onResult, onFault);
      property['_id'] = proxy._id;
      resp.token = update_(JSON.stringify(property));
    }
    
    public function destroy(id:String, onResult:Function=null, onFault:Function=null):void
    {
      var resp:CallResponder = DB.getCallResponder(onResult, onFault);
      resp.token = destroy_(JSON.stringify( { _id: id } ));
    }
    
    public function add_rule(proxy_id:String, params:Object, onResult:Function=null, onFault:Function=null):void
    {
      var resp:CallResponder = DB.getCallResponder(onResult, onFault);
      resp.token = add_rule_(JSON.stringify( { _id: proxy_id, rule: params } ));
    }
    
    public function del_rule(proxy_id:String, rule_id:String, onResult:Function=null, onFault:Function=null):void
    {
      var resp:CallResponder = DB.getCallResponder(onResult, onFault);
      resp.token = del_rule_(JSON.stringify( { _id: proxy_id, rule: { _id: rule_id } } ));
    }
    
    public function update_rule(proxy_id:String, params:Object, onResult:Function=null, onFault:Function=null):void
    {
      var resp:CallResponder = DB.getCallResponder(onResult, onFault);
      resp.token = update_rule_(JSON.stringify( { _id: proxy_id, rule: params } ));
    }
    
    public function apply_rules(proxy_id:String, onResult:Function = null, onFault:Function = null):void
    {
      var resp:CallResponder = DB.getCallResponder(onResult, onFault);
      resp.token = apply_rules_(JSON.stringify( { _id: proxy_id} ));
    }
    
    public function logs(id:String, onResult:Function=null, onFault:Function=null):void
    {
      var resp:CallResponder = DB.getCallResponder(onResult, onFault);
      resp.token = logs_(id);
    }
    
    public function del_logs(id:String, onResult:Function=null, onFault:Function=null):void
    {
      var resp:CallResponder = DB.getCallResponder(onResult, onFault);
      resp.token = del_logs_(JSON.stringify( { _id: id} ));
    }
    
    /**
     * Override super.init() to provide any initialization customization if needed.
     */
    protected override function preInitializeService():void
    {
        super.preInitializeService();
        // Initialization customization goes here
    }
      
  }

}