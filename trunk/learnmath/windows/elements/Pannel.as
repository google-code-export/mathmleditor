package learnmath.windows.elements{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import flash.display.*;

public class Pannel{

	public var x:int = 0;
	public var y:int = 0;
	public var oldX:int = 0;
	public var oldY:int = 0;
	public var width:int = 400;
	public var height:int = 400;
	public var oldWidth:int = 400;
	public var oldHeight:int = 400;
	public var parent:MovieClip;
	public var pannel:MovieClip;

	public function Pannel(_parent:MovieClip, _x:int, _y:int, _width:int, _height:int){
		parent = _parent;
		
		x = _x;
		y = _y;
		width = _width;
		height = _height;

		pannel = new MovieClip();
		parent.addChild(pannel);
		pannel.x = x;
		pannel.y = y;
	}
	
	public function setX(newx:int){
		pannel.x = newx;
		x = newx;
	}

	public function setY(newy:int){
		pannel.y = newy;
		y = newy;
	}

	public function setWidth(newWidth:int){
		width = newWidth;
	}

	public function setHeight(newHeight:int){
		height = newHeight;
	}


}

}