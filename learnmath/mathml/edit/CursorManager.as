package learnmath.mathml.edit{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import flash.display.*;
import flash.geom.*;

import learnmath.mathml.formula.*;

/*
*	Keep information about how to move the cursor for a box;
*/

public class CursorManager{
	
	private var displayedCursor:Boolean = false;
	private var displayedBox:Boolean = false;
	private var backGround:Number = 0xD2D5DC;
	
	public var textNode:XML;
	public var leftString:String;
	
	
	public function CursorManager(_textNode:XML){
		textNode = _textNode;
		leftString = "";
	}
	
	public function getIndex():int{
		return leftString.length;
	}
	
	public function drawCursor(graph:MovieClip):void{
		var box:Box = Maps.getBox(textNode);

		if(box==null) return;
		var leftWidth:Number = FontConstant.getWidth(box.style, leftString);

		var x:Number = box.finalBounds.x + leftWidth;
		var y:Number = box.finalBounds.y;
		var h:Number = box.finalBounds.height;

		var mc:MovieClip = graph.cursorMc;
		if(!displayedCursor){
			if(mc==null){
				mc = new MovieClip();
				graph.addChild(mc);
				graph.cursorMc = mc;
			}
			mc.graphics.lineStyle(2, 0x000000, 100);
			mc.graphics.moveTo(x-1, y+3);
			mc.graphics.lineTo(x-1 , y + h-3);
			displayedCursor = true;
		}else{
			if(mc!=null){
				mc.graphics.clear();
			}
			displayedCursor = false;
		}
	}

	public function drawBoxCursor(graph:MovieClip):void{
		var box:Box = Maps.getBox(textNode);
		if(box==null) return;
		if(!displayedBox){
			graph.graphics.lineStyle(2, 0x000000, 100);
			DrawRectangle.draw2(graph, box.finalBounds.x, box.finalBounds.y, box.finalBounds.x+ box.finalBounds.width, box.finalBounds.y+box.finalBounds.height);
			displayedBox = true;
		}else{
			graph.graphics.lineStyle(2, backGround, 100);
			DrawRectangle.draw2(graph, box.finalBounds.x, box.finalBounds.y, box.finalBounds.x+ box.finalBounds.width, box.finalBounds.y+box.finalBounds.height);
			displayedBox = false;
		}

	}

	public function drawEndBoxCursor(graph:MovieClip):void{
		var box:Box = Maps.getBox(textNode);
		if(box==null) return;
		if(!displayedBox){
			graph.graphics.lineStyle(2, 0x000000, 100);
			graph.graphics.moveTo(box.finalBounds.x+ box.finalBounds.width, box.finalBounds.y);
			graph.graphics.lineTo(box.finalBounds.x+ box.finalBounds.width, box.finalBounds.y+box.finalBounds.height);
			displayedBox = true;
		}else{
			graph.graphics.lineStyle(2, backGround, 100);
			graph.graphics.moveTo(box.finalBounds.x+ box.finalBounds.width, box.finalBounds.y);
			graph.graphics.lineTo(box.finalBounds.x+ box.finalBounds.width, box.finalBounds.y+box.finalBounds.height);
			displayedBox = false;
		}

	}

	public function clearCursor(graph:MovieClip):void{
		var mc:MovieClip = graph.cursorMc;
		if(displayedCursor){
			if(mc!=null){
				mc.graphics.clear();
			}
			displayedCursor = false;
		}
		if(displayedBox){
			//var box:Box = Maps.getBox(textNode);
			//graph.graphics.lineStyle(2, backGround, 100);
			//DrawRectangle.draw2(graph, box.finalBounds.x, box.finalBounds.y, box.finalBounds.x+ box.finalBounds.width, box.finalBounds.y+box.finalBounds.height);
			displayedBox = false;
		}

	}

}
}