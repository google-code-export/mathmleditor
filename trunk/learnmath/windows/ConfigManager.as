package learnmath.windows{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import flash.display.*;
import flash.text.*;


public class ConfigManager{


	public static function getTextFormatForButtons():TextFormat{
		var tf:TextFormat = new TextFormat();
		tf.font = "Tahoma";
		tf.bold = true;
		tf.size = 11;		
		return tf;
	}
	public static function getTextFormatForTitle():TextFormat{
		var tf:TextFormat = new TextFormat();
		tf.font = "Tahoma";
		tf.color = 0xffffff;
		tf.bold = true;
		tf.size = 11;		
		return tf;
	}
	public static function getTextFormatForStatus():TextFormat{
		var tf:TextFormat = new TextFormat();
		tf.font = "Tahoma";
		tf.color = 0x000000;
		tf.size = 10;		
		return tf;
	}
	public static function getTextFormatIcon():TextFormat{
		var tf:TextFormat = new TextFormat();
		tf.font = "Tahoma";
		tf.color = 0x000000;
		tf.align = "center";
		tf.size = 10;		
		return tf;
	}

	public static function getTextFormatForStatus2():TextFormat{
		var tf:TextFormat = new TextFormat();
		tf.font = "Tahoma";
		tf.color = 0x00009C;
		tf.bold = true;
		tf.size = 10;		
		return tf;
	}
	
	public static function getTextFormatForMenu():TextFormat{
		var tf:TextFormat = new TextFormat();
		tf.font = "Tahoma";
		tf.color = 0x000000;
		tf.size = 11;		
		return tf;
	}

	public static function getTextFormatForMenuOver():TextFormat{
		var tf:TextFormat = getTextFormatForMenu();
		tf.color = 0xffffff;
		return tf;
	}
}
}