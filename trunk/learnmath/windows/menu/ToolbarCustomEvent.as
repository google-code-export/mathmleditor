package learnmath.windows.menu{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import flash.events.*;
import flash.display.*;

public class ToolbarCustomEvent extends Event {

	public var menuId:String;
	public var tPosition:String;
	public var source:MovieClip;
	public static const EXECUTE:String = "execute";
	public var value:String;
	
	public function ToolbarCustomEvent( _menuId:String, _tPosition:String, _source:MovieClip, _value:String ) {
		super( EXECUTE);
		this.menuId = _menuId;
		this.tPosition = _tPosition;
		this.source = _source;
		this.value = _value;
	}
	

	
}
}