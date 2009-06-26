package learnmath.mathml.edit{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import flash.geom.*;
import flash.display.*;

public class DrawRectangle{
	
	
	public static function drawOver(graph:MovieClip, bounds:Rectangle):void{
		graph.graphics.lineStyle(0, 0xff8888, 100);
		draw2(graph, bounds.x, bounds.y, bounds.x + bounds.width-1, bounds.y + bounds.height);
	}

	public static function draw(graph:MovieClip, bounds:Rectangle):void{
		graph.graphics.lineStyle(1, 0xcccccc, 10);
		draw2(graph, bounds.x, bounds.y, bounds.x + bounds.width-1, bounds.y + bounds.height);
	}
	
	public static function drawF(graph:MovieClip, x1:Number, y1:Number, x2:Number, y2:Number):void{
		graph.graphics.lineStyle(1, 0x000000, 100);
		draw2(graph, x1, y1, x2, y2);
	}

	public static function draw2(graph:MovieClip, x1:Number, y1:Number, x2:Number, y2:Number):void{
		graph.graphics.moveTo(x1, y1);
		graph.graphics.lineTo(x2, y1);
		graph.graphics.lineTo(x2, y2);
		graph.graphics.lineTo(x1, y2);
		graph.graphics.lineTo(x1, y1);

	}

}
}