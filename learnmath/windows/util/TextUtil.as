package learnmath.windows.util{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import flash.text.*;

public class TextUtil{


	public static function getWidth(text:String, tf:TextFormat):Number{
		var tfield:TextField = new TextField();
		tfield.defaultTextFormat = tf;
		tfield.text = text;
		return tfield.getLineMetrics(0).width + 4;
	}	

}
}