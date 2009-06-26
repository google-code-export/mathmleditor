package learnmath.windows.elements{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import flash.display.*;
import learnmath.windows.elements.*;


public class BorderPannel extends Pannel{


	public function BorderPannel(_parent:MovieClip, _x:int, _y:int, _width:int, _height:int){
		super(_parent, _x, _y, _width, _height);
		
		pannel.graphics.lineStyle(1,0xd4cfc9);
		pannel.graphics.beginFill(0xd4cfc9);   
		pannel.graphics.drawRect(0, 0, width-1, height-1);   
		pannel.graphics.endFill();
		
		
		pannel.graphics.lineStyle(1,0xffffff);
		pannel.graphics.moveTo(1,0);
		pannel.graphics.lineTo(width, 0);
		pannel.graphics.moveTo(1,0);
		pannel.graphics.lineTo(1, height);
		
		pannel.graphics.lineStyle(1,0x433e3a);
		pannel.graphics.moveTo(width-1, height);
		pannel.graphics.lineTo(width-1, 0);
		pannel.graphics.moveTo(width, height-1);
		pannel.graphics.lineTo(0, height-1);
		
		pannel.graphics.lineStyle(1,0x847f7b);
		pannel.graphics.moveTo(width-2, height-1);
		pannel.graphics.lineTo(width-2, 1);
		pannel.graphics.moveTo(width-1, height-2);
		pannel.graphics.lineTo(1, height-2);
	}
	

}

}