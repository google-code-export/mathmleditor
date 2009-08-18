package learnmath.windows.menu{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import flash.display.*;
import flash.events.*;
import myLib.data.*;
import learnmath.windows.comp.*;
import learnmath.windows.elements.buttons.*;

public class ToolbarBean{

	public var position:String = "TOP";	//TOP, BOTTOM, LEFT, DOWN, FLOAT
	public var acceptedPosition:String = "TOP;BOTTOM;LEFT;RIGHT"
	public var index:int=-1;
	public var _x:int=0;
	public var _y:int=0;
	
	public var iconList:Array;
	public var iconMap:Array;
	
	public function ToolbarBean(){
		iconList = new Array();
		iconMap = new Array();
	}
	
	
	public function addElement(_icon:BitmapData, eventId:String, enabled:Boolean):void{
		var img:Bitmap = new Bitmap(_icon);
		var m:MovieClip = new MovieClip();

		m.addChild(img);
		iconMap[eventId] = m;

		if(enabled){
			enableElement(eventId);
		}else{
			disableElement(eventId);
		}
		
		var c:MovieClip = new MovieClip();
		c.addChild(m);
		c.isIcon = true;
		c.customWidth = m.width;
		c.customHeight = m.height;
		iconList[iconList.length] = c;
	}
	public function addElementMathML(button:ButtonMathML, eventId:String, enabled:Boolean):void{
		var m:MovieClip = new MovieClip();

		button.getButtonMC().mouseEnabled = false;
		button.getButtonMC().mouseChildren = false;
		m.addChild(button.getButtonMC());
		iconMap[eventId] = m;

		if(enabled){
			enableElement(eventId);
		}else{
			disableElement(eventId);
		}
		
		var c:MovieClip = new MovieClip();
		c.addChild(m);
		c.isIcon = true;
		c.customWidth = m.width;
		c.customHeight = m.height;
		iconList[iconList.length] = c;
	}
	public function addSelectField(eventId:String, enabled:Boolean, list:Array, selected:int):void{

		var combo:MyComboBox = new MyComboBox(new SimpleCollection(list));
		combo.maxHeight=18;
		combo.selectedIndex = selected;
		combo.eventId = eventId;

		var m:MovieClip = new MovieClip();
		m.addChild(combo);

		iconMap[eventId] = m;

		var c:MovieClip = new MovieClip();
		c.addChild(m);
		c.isIcon = false;
		c.customWidth = combo.getCustomWidth();
		c.customHeight = combo.getCustomHeight();
		c.combo = combo;
		iconList[iconList.length] = c;
	}

	public function addSpace():void{
		iconList[iconList.length] = 3;
	}
	
	public function addColorPicker(eventId:String):void{

		var color:MyColorPicker = new MyColorPicker();
		color.openDirection = "bottom";

		var m:MovieClip = new MovieClip();
		m.eventId = eventId;
		m.addChild(color);

		iconMap[eventId] = m;

		var c:MovieClip = new MovieClip();
		c.addChild(m);
		c.isIcon = false;
		c.customWidth = 22;
		c.customHeight = 18;
		c.colorComp = color;
		iconList[iconList.length] = c;
	}

	private function clickOverMenu(event:MouseEvent):void {
		var mc = event.currentTarget;
		mc.x = -1;
		mc.y = -1;
	}

	private function clickDownMenu(event:MouseEvent):void {
		var mc = event.currentTarget;
		mc.x = 1;
		mc.y = 1;
	}

	private function clickUpMenu(event:MouseEvent):void {
		var mc = event.currentTarget;
		mc.x = 0;
		mc.y = 0;
	}

	public function isEnableElement(eventId:String):Boolean{
		var m = iconMap[eventId];
		if(m!=null){
			if(m.eventId!=null) return true;
		}
		return false;
	}

	public function changeIcon(eventId:String, _icon:BitmapData):void{
		disableElement(eventId);
		var m = iconMap[eventId];
		if(m!=null){
			while(m.numChildren > 0) {
				m.removeChildAt(0);
			}			
			var img:Bitmap = new Bitmap(_icon);
			m.addChild(img);
			enableElement(eventId);
		}
	}

	public function enableElement(eventId:String):void{
		disableElement(eventId);
		var m = iconMap[eventId];
		if(m!=null){
			m.alpha = 1;
			m.eventId = eventId;
			m.addEventListener(MouseEvent.MOUSE_OVER, clickOverMenu);
			m.addEventListener(MouseEvent.MOUSE_DOWN, clickDownMenu);
			m.addEventListener(MouseEvent.MOUSE_OUT, clickUpMenu);
			m.addEventListener(MouseEvent.MOUSE_UP, clickUpMenu);
		}

	}

	public function disableElement(eventId:String):void{
		var m = iconMap[eventId];
		if(m!=null){
			m.alpha = 0.2;
			m.eventId = null;
			m.removeEventListener(MouseEvent.MOUSE_OVER, clickOverMenu);
			m.removeEventListener(MouseEvent.MOUSE_DOWN, clickDownMenu);
			m.removeEventListener(MouseEvent.MOUSE_OUT, clickUpMenu);
			m.removeEventListener(MouseEvent.MOUSE_UP, clickUpMenu);
		}
	}

}
}