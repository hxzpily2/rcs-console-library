package it.ht.rcs.console.system.rest
{
  public interface IDBSystem
  {
    function all(onResult:Function = null, onFault:Function = null):void;
    function show(id:String, onResult:Function = null, onFault:Function = null):void;
    
  }
}