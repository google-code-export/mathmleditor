package learnmath.windows.menu{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import flash.display.*;
import flash.text.*;
import flash.events.*;
import learnmath.windows.*;
import learnmath.windows.elements.*;
import learnmath.windows.util.*;


public class ToolbarContainer extends Pannel{

	var window:WindowXP;
	var toolbars:ToolbarsBean;
	
	var topPannel:ToolbarPannel;
	var bottomPannel:ToolbarPannel;
	var leftPannel:ToolbarPannel;
	var rightPannel:ToolbarPannel;
	var floatPannels:Array = new Array();
	var maxWidth:int;
	var maxHeight:int;

	public function ToolbarContainer(_window:WindowXP, _parent:MovieClip, _toolbars:ToolbarsBean, _x:int, _y:int, _w:int, _h:int){
		super(_parent, _x, _y, _w, _h);
		toolbars = _toolbars;
		window = _window;
		maxWidth = _w;
		maxHeight = _h;
		
		drawAllToolbars();
	}
	
	public function drawAllToolbars():void{
		topPannel = null;
		bottomPannel = null;
		leftPannel = null;
		rightPannel = null;
		floatPannels = new Array()
		
		for(var i=0; i<toolbars.toolbarList.length;i++){
			var t:ToolbarBean = toolbars.toolbarList[i];
			var toolP:ToolbarPannel;
			
			if(t.position=="TOP"){
				if(topPannel==null){ topPannel = new ToolbarPannel("TOP", window, pannel, maxWidth, maxHeight); }
				toolP = topPannel;
			}else if(t.position=="BOTTOM"){
				if(bottomPannel==null){ bottomPannel = new ToolbarPannel("BOTTOM", window, pannel, maxWidth, maxHeight); }
				toolP = bottomPannel;
			}else if(t.position=="LEFT"){
				if(leftPannel==null){ leftPannel = new ToolbarPannel("LEFT", window, pannel, maxWidth, maxHeight); }
				toolP = leftPannel;
			}else if(t.position=="RIGHT"){
				if(rightPannel==null){ rightPannel = new ToolbarPannel("RIGHT", window, pannel, maxWidth, maxHeight); }
				toolP = rightPannel;
			}else if(t.position=="FLOAT"){
				toolP = new ToolbarPannel("FLOAT", window, pannel, maxWidth, maxHeight)
				floatPannels[floatPannels.length] = toolP;
				toolP.x = t._x;
				toolP.y = t._y;
			}
			toolP.addToolbar(t);
		}
		
		if(topPannel!=null){ topPannel.draw(false, false)}
		if(bottomPannel!=null){ bottomPannel.draw(false, false)}
		if(leftPannel!=null){ leftPannel.draw(topPannel!=null, bottomPannel!=null)}
		if(rightPannel!=null){ rightPannel.draw(topPannel!=null, bottomPannel!=null)}
		for(var j:int=0; j<floatPannels.length; j++){
			floatPannels[j].draw(false, false);
		}
		
	}


	public function getHeightTop():int{
		if(topPannel!=null) return topPannel.pannel.height;
		return 0;
	}

	public function getHeightBottom():int{
		if(bottomPannel!=null) return bottomPannel.pannel.height;
		return 0;
	}

	public function getWidthLeft():int{
		if(leftPannel!=null) return leftPannel.pannel.width;
		return 0;
	}

	public function getWidthRight():int{
		if(rightPannel!=null) return rightPannel.pannel.width;
		return 0;
	}

}

}