package learnmath.windows.menu{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import flash.display.*;
import learnmath.windows.*;
import learnmath.windows.elements.*;
import flash.text.*;
import flash.events.*;


public class MenuGroupPannel extends BorderPannel{

	var tf:TextFormat;
	var tfOver:TextFormat;

	public function MenuGroupPannel(_parent:MovieClip, _x:int, _y:int, menuGroup:MenuGroup, menuBarPannel:MenuBarPannel){
		var list = menuGroup.itemList;
		
		var maxWidth:int = 8;
		for(var j=0; j<list.length; j++){
			if(list[j] is String){
				maxWidth = maxWidth + 7;
				continue;
			}
			maxWidth = maxWidth + 18;
		}
				
		super(_parent, _x, _y, 175, maxWidth);
		tf = ConfigManager.getTextFormatForMenu();
		tfOver = ConfigManager.getTextFormatForMenuOver();
		
		var lastY:int = 4;
		for(var i=0; i<list.length; i++){
			if(list[i] is String){
				pannel.graphics.lineStyle(1,0x847f7b);
				pannel.graphics.moveTo(5, lastY+3);
				pannel.graphics.lineTo(width-5, lastY+4);
				pannel.graphics.lineStyle(1,0xffffff);
				pannel.graphics.moveTo(5, lastY+4);
				pannel.graphics.lineTo(width-5, lastY+5);
				
				lastY = lastY + 7;
				continue;
			}
			var mcText:MovieClip = new MovieClip();
			mcText.menuBarPannel = menuBarPannel;
			mcText.item=list[i];
			
			mcText.mouseChildren = false;
			mcText.y = lastY ;
			
			
			mcText.addEventListener(MouseEvent.MOUSE_OVER, drawOverItem);
			mcText.addEventListener(MouseEvent.MOUSE_OUT, drawOutItem);
			mcText.addEventListener(MouseEvent.MOUSE_DOWN, clicked);
			
			pannel.addChild(mcText);			
			
			var t:TextField = new TextField();
			t.text = list[i].name;
			t.y = -1;
			t.x = 18;
			t.width = 150;
			t.height = 18
			mcText.addChild(t);
			mcText.textMc = t;
			
			drawNormal(mcText);			
			lastY = lastY + 18;
			
			
		}
	}
	

	public function clicked(event:MouseEvent):void {
		var mc = event.target;
		if(mc.item is MenuGroup){
			// create subpannel
		}else{
			mc.menuBarPannel.menuClicked(mc.item.id);
		}
	}

	public function drawOutItem(event:MouseEvent):void {
		var mc = event.target;
		drawNormal(mc);
	}
	
	public function drawNormal(mc:MovieClip):void {
		mc.graphics.clear();
		mc.graphics.lineStyle();
		mc.graphics.beginFill(0xd4cfc9);   
		mc.graphics.drawRect(3, 0, 169, 18);   
		mc.graphics.endFill();
		mc.textMc.setTextFormat(tf);
		if(mc.item is MenuGroup){
			mc.graphics.beginFill(0x000000);   
			mc.graphics.moveTo(160, 5);
			mc.graphics.lineTo(160, 13);
			mc.graphics.lineTo(164, 9);
			mc.graphics.lineTo(160, 5);
			mc.graphics.endFill();
		}
	}
	
	
	public function drawOverItem(event:MouseEvent):void {
		var mc = event.target;
		mc.graphics.clear();
		mc.graphics.lineStyle();
		mc.graphics.beginFill(0x092469);   
		mc.graphics.drawRect(3, 0, 169, 18);   
		mc.graphics.endFill();
		mc.textMc.setTextFormat(tfOver);
		if(mc.item is MenuGroup){
			mc.graphics.beginFill(0xffffff);   
			mc.graphics.moveTo(160, 5);
			mc.graphics.lineTo(160, 13);
			mc.graphics.lineTo(164, 9);
			mc.graphics.lineTo(160, 5);
			mc.graphics.endFill();
		}
	}		



}

}