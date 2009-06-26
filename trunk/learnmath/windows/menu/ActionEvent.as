package learnmath.windows.menu{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import flash.events.*;
import flash.display.*;

public class ActionEvent extends Event {

	public var value:String;
	public static const INSERT:String = "insert";
	
	public function ActionEvent( _value:String) {
		super( INSERT);
		this.value = _value;
	}
	
}
}