package learnmath.windows.menu{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import flash.display.*;
import flash.text.*;
import flash.events.*;
import flash.geom.*;
import learnmath.windows.*;
import learnmath.windows.elements.*;
import learnmath.windows.util.*;
import myLib.colors.colorSpaces.*;


public class ToolbarPannel extends Pannel{

	public var position:String = "TOP";	//TOP, BOTTOM, LEFT, DOWN
	public var toolbars:Array = new Array();
	
	var window:WindowXP;
	var p:MovieClip;
	var maxWidth:int;
	var maxHeight:int;
	

	public function ToolbarPannel(_position:String, _window:WindowXP, _parent:MovieClip, _maxWidth:int, _maxHeight:int){
		super(_parent, 0, 0, 1, 1);
		position = _position;
		window = _window;
		p = _parent;
		maxWidth = _maxWidth;
		maxHeight = _maxHeight;
	}

	public function addToolbar(toolbar:ToolbarBean):void{
		toolbars[toolbars.length] = toolbar;
	}

	
	public function draw(hasTop:Boolean, hasBottom:Boolean):void{
		if(toolbars.length==0) return;
		var _h = maxHeight;

		pannel.graphics.lineStyle();
		pannel.graphics.beginFill(0xd4cfc9);   
		if(position=="TOP"){
			pannel.graphics.drawRect(0, 0, maxWidth-1, 20);   
		}else if(position=="BOTTOM"){
			pannel.graphics.drawRect(0, 0, maxWidth-1, 20);
			pannel.y = maxHeight - 20;
		}else if(position=="LEFT"){
			var _y = 0;
			if(hasTop){
				_y = 21;
				_h = _h - 20;
			}
			if(hasBottom){
				_h = _h - 20;
			}
			_h = _h -1;
			pannel.graphics.drawRect(0, 0, 20, _h);
			pannel.y = _y
		}else if(position=="RIGHT"){
			_y = 0;
			if(hasTop){
				_y = 21;
				_h = _h - 20 ;
			}
			if(hasBottom){
				_h = _h - 20;
			}
			_h = _h -1;
			pannel.graphics.drawRect(0, 0, 20, _h);
			pannel.x = maxWidth - 20;
			pannel.y = _y
		}
		pannel.graphics.endFill();
		
		// X for all toolbars on a branch
		var totalX:int = 0;
		var totalY:int = 0;
		if(position=="TOP"){
			pannel.graphics.lineStyle(1,0x847f7b);
			pannel.graphics.moveTo(0, 19);
			pannel.graphics.lineTo(pannel.width, 19);
			pannel.graphics.lineStyle(1,0xffffff);
			pannel.graphics.moveTo(0, 20);
			pannel.graphics.lineTo(pannel.width, 20);
			totalY = 20;
		}else if(position=="BOTTOM"){
			pannel.graphics.lineStyle(1,0x847f7b);
			pannel.graphics.moveTo(0, 1);
			pannel.graphics.lineTo(pannel.width, 1);
			pannel.graphics.lineStyle(1,0xffffff);
			pannel.graphics.moveTo(0, 0);
			pannel.graphics.lineTo(pannel.width, 0);
			totalY = 20;
		}else if(position=="LEFT"){
			pannel.graphics.lineStyle(1,0x847f7b);
			pannel.graphics.moveTo(19, 0);
			pannel.graphics.lineTo(19, pannel.height);
			pannel.graphics.lineStyle(1,0xffffff);
			pannel.graphics.moveTo(20, 0);
			pannel.graphics.lineTo(20, pannel.height);
			totalX = 20;
		}else if(position=="RIGHT"){
			pannel.graphics.lineStyle(1,0x847f7b);
			pannel.graphics.moveTo(1, 0);
			pannel.graphics.lineTo(1, pannel.height);
			pannel.graphics.lineStyle(1,0xffffff);
			pannel.graphics.moveTo(0, 0);
			pannel.graphics.lineTo(0, pannel.height);
			totalX = 20;
		}

		// draw toolbars;
		for(var i:int=0; i<toolbars.length; i++){
			var toolbar:ToolbarBean = toolbars[i];
			
			var handle:MovieClip; 
			// x inside a toolbar
			var nextX:int = 0;
			var nextY:int = 0;

			if(position=="TOP"){
				handle = drawVBar(totalX, toolbar);
				handle.x = totalX;
				handle.y = 0;
				pannel.addChild(handle);
				nextX = 10;
			}else if(position=="BOTTOM"){
				handle = drawVBar(totalX, toolbar);
				handle.x = totalX;
				handle.y=2;
				pannel.addChild(handle);
				nextX = 10;
			}else if(position=="LEFT"){
				handle = drawHBar(totalY, toolbar, _h);
				handle.x = 0;
				handle.y = totalY;
				pannel.addChild(handle);
				nextY = 10;
			}else if(position=="RIGHT"){
				handle = drawHBar(totalY, toolbar, _h);
				handle.x=2;
				handle.y = totalY;
				pannel.addChild(handle);
				nextY = 10;
			}
			
			for(var j:int=0; j<toolbar.iconList.length; j++){
				var iconMc:MovieClip = toolbar.iconList[j];
				var contIcon:MovieClip = new MovieClip();
				contIcon.addChild(iconMc);

				if(iconMc.isIcon){
					contIcon.removeEventListener(MouseEvent.MOUSE_DOWN, clickedIcon);
					contIcon.addEventListener(MouseEvent.MOUSE_DOWN, clickedIcon);
				}
				if(iconMc.combo!=null){
					iconMc.combo.removeEventListener("change", changeComboBox);
					iconMc.combo.addEventListener("change", changeComboBox);
				}
				if(iconMc.colorComp!=null){
					iconMc.colorComp.removeEventListener("change", changeColor);
					iconMc.colorComp.addEventListener("change", changeColor);
				}

				var w = iconMc.customWidth;
				var h = iconMc.customHeight;
				
				if(iconMc.combo!=null){
					if(position=="BOTTOM"){
						iconMc.combo.openDirection = "up";
					}else{
						iconMc.combo.openDirection = "down";
					}
				}
				if(iconMc.colorComp!=null){
					if(position=="BOTTOM"){
						iconMc.colorComp.openDirection = "up";
					}else{
						iconMc.colorComp.openDirection = "bottom";
					}
				}				
				
				if(position=="TOP" || position=="BOTTOM"){
					contIcon.x = nextX;
					contIcon.y = 0;
					handle.addChild(contIcon);
					nextX = nextX + w + 2;
					if( (totalX + nextX + 22)>maxWidth ) return;
				}else if(position=="LEFT" || position=="RIGHT"){
					contIcon.x = 0;
					contIcon.y = nextY;
					handle.addChild(contIcon);
					nextY = nextY + h + 2;
					if( (totalY + nextY + 22)>_h ) return;
				}
			}

			if(position=="TOP" || position=="BOTTOM"){
				handle.graphics.lineStyle(1,0xffffff);
				handle.graphics.moveTo(nextX + 1, 1);
				handle.graphics.lineTo(nextX + 1, totalY -1);
			}else if(position=="LEFT" || position=="RIGHT"){
				handle.graphics.lineStyle(1,0xffffff);
				handle.graphics.moveTo(1, nextY + 1);
				handle.graphics.lineTo(totalX-1, nextY + 1);
			}

			if(position=="TOP"){
				totalX = handle.x + nextX + 2;
			}else if(position=="BOTTOM"){
				totalX = handle.x + nextX + 2;
			}else if(position=="LEFT"){
				totalY = handle.y + nextY + 2;
			}else if(position=="RIGHT"){
				totalY = handle.y + nextY + 2;
			}
		}
	}
	
	private function drawHBar(totalY:int, toolbar:ToolbarBean, maxH:int):MovieClip{
		var maxY = 10;
		for(var j:int=0; j<toolbar.iconList.length; j++){
			var iconMc = toolbar.iconList[j];
			if((totalY + maxY + iconMc.height + 22)>maxH) break;
			maxY = maxY + iconMc.height + 2;
		}
		var back:MovieClip = new MovieClip();
		back.graphics.lineStyle();
		back.graphics.beginFill(0xd4cfc9); 
		back.graphics.drawRect(0, 0, 19, maxY);   
		back.graphics.endFill(); 

		var handle:MovieClip = new MovieClip();
		handle.graphics.lineStyle();
		handle.graphics.beginFill(0xffffff, 0.01); 
		handle.graphics.drawRect(0, 0, 20, 10);   
		handle.graphics.endFill(); 
		
		handle.graphics.lineStyle(1,0xffffff);
		handle.graphics.moveTo(1, 2);
		handle.graphics.lineTo(18, 2);

		handle.graphics.moveTo(1, 5);
		handle.graphics.lineTo(18, 5);

		handle.graphics.lineStyle(1,0x000000);
		handle.graphics.moveTo(1, 3);
		handle.graphics.lineTo(18, 3);

		handle.graphics.moveTo(1, 6);
		handle.graphics.lineTo(18, 6);

		handle.mouseEnabled = true;
		handle.buttonMode = true;
		handle.addEventListener(MouseEvent.MOUSE_DOWN, pickUp);
		handle.addEventListener(MouseEvent.MOUSE_UP, pickDown);
		handle.name="toolbar";
		handle.toolbar = toolbar;
		
		back.addChild(handle);
		return back;
	}
	
	
	private function drawVBar(totalX:int, toolbar:ToolbarBean):MovieClip{
		var maxX = 10;
		for(var j:int=0; j<toolbar.iconList.length; j++){
			var iconMc = toolbar.iconList[j];
			if((totalX + maxX + iconMc.width + 22)>maxWidth) break;
			maxX = maxX + iconMc.width + 2;
		}
		var back:MovieClip = new MovieClip();
		back.graphics.lineStyle();
		back.graphics.beginFill(0xd4cfc9); 
		back.graphics.drawRect(0, 0, maxX, 19);   
		back.graphics.endFill(); 
		
		var handle:MovieClip = new MovieClip();
		handle.graphics.lineStyle();
		handle.graphics.beginFill(0xffffff, 0.01); 
		handle.graphics.drawRect(0, 0, 10, 20);   
		handle.graphics.endFill(); 
		
		handle.graphics.lineStyle(1,0xffffff);
		handle.graphics.moveTo(2, 1);
		handle.graphics.lineTo(2, 18);

		handle.graphics.moveTo(5, 1);
		handle.graphics.lineTo(5, 18);

		handle.graphics.lineStyle(1,0x000000);
		handle.graphics.moveTo(3, 1);
		handle.graphics.lineTo(3, 18);

		handle.graphics.moveTo(6, 1);
		handle.graphics.lineTo(6, 18);

		handle.mouseEnabled = true;
		handle.buttonMode = true;
		handle.addEventListener(MouseEvent.MOUSE_DOWN, pickUp);
		handle.addEventListener(MouseEvent.MOUSE_UP, pickDown);
		handle.name="toolbar";
		handle.toolbar = toolbar;
		
		back.addChild(handle);
		return back;
	}

	function pickUp(event:MouseEvent):void {
		var mc = event.target;
		if(mc.toolbar!=null){
	    	mc.parent.startDrag(false);
			
			var p:Point = new Point(mc.parent.x, mc.parent.y);
			p = mc.parent.parent.localToGlobal(p);
			p = window.pannel.globalToLocal(p);
			window.pannel.addChild(mc.parent);
			mc.parent.x = p.x;
			mc.parent.y = p.y;
		}
	}	
	function pickDown(event:MouseEvent):void {
    	event.target.parent.stopDrag();
		var mc = event.target;
		if(mc.toolbar!=null){
			if(mc.parent.x<20 && (mc.toolbar.acceptedPosition.indexOf("LEFT")>-1)){
				mc.toolbar.position="LEFT";
			}else if(mc.parent.y<(this.pannel.parent.y+20) && (mc.toolbar.acceptedPosition.indexOf("TOP")>-1)){
				mc.toolbar.position="TOP";
			}else if(mc.parent.y>(maxHeight-20) && (mc.toolbar.acceptedPosition.indexOf("BOTTOM")>-1)){
				mc.toolbar.position="BOTTOM";
			}else if(mc.parent.x>(maxWidth -20) && (mc.toolbar.acceptedPosition.indexOf("RIGHT")>-1)){
				mc.toolbar.position="RIGHT";
			}
		}
		window.pannel.removeChild(mc.parent);
		pannel.parent.dispatchEvent(new RedrawToolbarsEvent());
	}

	function clickedIcon(event:MouseEvent):void {
		var mc = event.target;
		if(mc.eventId==null) return;
		window.pannel.dispatchEvent(new ToolbarCustomEvent(mc.eventId, position, mc, ""));
	}
	
	function changeComboBox(event:Event):void{
		var mc = event.target;
		if(mc.eventId==null) return;
		window.pannel.dispatchEvent(new ToolbarCustomEvent(mc.eventId, position, mc.parent, mc.selectedItem.data));
	}

	function changeColor(event:Event):void{
		var mc = event.target;
		if(mc.parent.eventId==null) return;
		var	color:RGBColor = new RGBColor(mc.selectedColor);
		window.pannel.dispatchEvent(new ToolbarCustomEvent(mc.parent.eventId, position, mc.parent, color.toHex("#")));
	}
}

}