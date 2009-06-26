package learnmath.windows.menu{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import flash.events.*;

public class MenuCustomEvent extends Event {

	public var menuId:String;
	public static const EXECUTE:String = "execute";
	
	public function MenuCustomEvent( _menuId:String ) {
		super( EXECUTE);
		this.menuId = _menuId;
	}
	

	
}
}