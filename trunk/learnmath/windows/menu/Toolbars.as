package learnmath.windows.menu{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import flash.display.*;
import learnmath.windows.elements.*;
import learnmath.windows.elements.buttons.*;
import flash.events.*;
import learnmath.mathml.formula.*;

public class Toolbars{

	public var listPannels:Array = new Array();
	
	public function redrawToolbars(pannel:MovieClip):void{
		for (var key in listPannels){
			var tPannel:ToolsPannel = ToolsPannel(listPannels[key]);	
			if(tPannel!=null){
				pannel.addChild(tPannel.pannel);
			}
		}
	}

	public function drawToolbar(pannel:MovieClip, toolbarId:String, x:int, y:int):void{
		for (var key in listPannels){
			var p:ToolsPannel = ToolsPannel(listPannels[key]);	
			if(p!=null && !p.haveBeenMoved){
				p.pannel.parent.removeChild(p.pannel);
				listPannels[key] = null;
			}
		}
		var tPannel:ToolsPannel = ToolsPannel(listPannels[toolbarId]);
		if(tPannel == null){
			tPannel = new ToolsPannel(pannel, "", toolbarId, x, y, toolbars[toolbarId], values[toolbarId]);
			tPannel.draw();
			tPannel.bClose.pannel.addEventListener(MouseEvent.CLICK, closeWindow);
			listPannels[toolbarId] = tPannel;
		}
		
	}

	function closeWindow(event:MouseEvent):void {
		var toolbarId = event.target.panelId;
		var window = listPannels[toolbarId];
		window.pannel.parent.removeChild(window.pannel);
		listPannels[toolbarId] = null;
	}	


	public var toolbars:Array = new Array();
	public var values:Array = new Array();
	
	public function init():void{
	}

	public function createToolbar(name:String, sta:String, end:String, style:Style, type:String):void{
		if(toolbars[name]==null){
			var toolbarEquation20:Array = new Array();
			var toolbarValues20:Array = new Array();
			addToToolbars(sta, end, toolbarEquation20, toolbarValues20, style, type);
			toolbars[name] = toolbarEquation20;
			values[name] = toolbarValues20;
		}					
	}
		
	public function addToToolbarsName(name:String, sta:String, end:String, style:Style, type:String):void{
		var t:Array = toolbars[name];
		var v:Array = values[name];
		addToToolbars(sta, end, t, v, style, type)
	}
	
	public function addToToolbars(sta:String, end:String, equ:Array, val:Array, style:Style, type:String):void{
		var startN:Number = Number(sta);
		var endN:Number = Number(end);
		for(var i:Number=startN; i<endN+1; i++){
			var s1:String = "<mrow><mo>&#x0" + i.toString(16)+";</mo><mtext focus='true'>...</mtext></mrow>";
			var s2:String = "<mrow><mo>&#x0" + i.toString(16)+";</mo></mrow>";
			if(type=='mtext'){
				s1 = "<mtext>&#x0" + i.toString(16)+";</mtext>";
				s2 = s1;;				
			}
			val[val.length] = s1;  
			equ[equ.length] = new ButtonMathML(s2, style, 19, 19);			
		}
	}
}

}