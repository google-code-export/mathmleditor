package learnmath.windows.menu{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import flash.events.*;

public class RedrawToolbarsEvent extends Event {

	public static const REDRAW:String = "redraw";
	
	public function RedrawToolbarsEvent( ) {
		super( REDRAW);
	}
	

	
}
}