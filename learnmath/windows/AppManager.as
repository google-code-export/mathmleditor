package learnmath.windows{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.windows.apps.*;
import flash.display.*;
import flash.text.*;
import flash.events.*;


public class AppManager{

	public static var maxX:int = 1600;
	public static var maxY:int = 1600;
	public static var width:int = 0;
	public static var height:int = 0;

	public static var mainPannel:EditorApp;
	
	public static function init(parent:MovieClip, _width:int, _height:int):void{
		width = _width;
		height = _height;
		mainPannel = new EditorApp(parent, (maxX-_width)/2, (maxY-_height)/2, _width, _height);
		mainPannel.draw();
		
	}
	
	public static function drawOnFrame():void{
		if(mainPannel==null) return;
		mainPannel.drawOnFrame();
	}
	
	public static function processKey(e:KeyboardEvent) {
		if(mainPannel==null) return;
		mainPannel.processKey(e)
	}
	
}
}