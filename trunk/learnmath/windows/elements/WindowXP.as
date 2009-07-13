package learnmath.windows.elements{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.windows.*;
import learnmath.windows.elements.buttons.*;
import learnmath.windows.menu.*;
import flash.display.*;
import flash.events.*;
import flash.geom.*;
import flash.text.*;
import flash.ui.*;


public class WindowXP extends Pannel{

	var littleIcon:MovieClip;
	public var titleBar:MovieClip;
	var color1:MovieClip;
	var color2:MovieClip;
	public var buttonClose;
		
	public var name:String;
	private var tf:TextFormat;
	
	protected var statusBox:StatusBox;
	

	public function WindowXP(parent:MovieClip, _littleIcon:MovieClip, x:int, y:int, _width:int, _height:int){
		super(parent, x, y, _width, _height);
		tf = ConfigManager.getTextFormatForTitle();
		littleIcon = _littleIcon;
	}

	public function draw():void{
		pannel.graphics.clear();
		while(pannel.numChildren > 0) {
			pannel.removeChildAt(0);
		}
		

		pannel.graphics.lineStyle(1,0xd4cfc9);
		pannel.graphics.beginFill(0xd4cfc9);   
		pannel.graphics.drawRect(0, 0, width-1, height-1);   
		pannel.graphics.endFill();
		
		
		pannel.graphics.lineStyle(1,0xffffff);
		pannel.graphics.moveTo(0,0);
		pannel.graphics.lineTo(width, 0);
		pannel.graphics.moveTo(0,0);
		pannel.graphics.lineTo(0, height);
		
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
		
		titleBar = new MovieClip();
		titleBar.x = 3;
		titleBar.y = 3;
		pannel.addChild(titleBar);
		
		color1 = new MovieClip();
		color2 = new MovieClip();
		color1.mouseEnabled = false;
		color2.mouseEnabled = false;
		titleBar.addChild(color1);
		titleBar.addChild(color2);

		var colors:Array = [0x092469, 0xb7c7d7];
		var matr:Matrix = new Matrix();
		matr.createGradientBox(width-7, 18);
		
		color1.graphics.lineStyle();
		color1.graphics.beginGradientFill(GradientType.LINEAR, colors, [1, 1], [0, 255], matr, SpreadMethod.PAD);  
		color1.graphics.drawRect( 0, 0, width-7, 18);
		color1.graphics.endFill();

		titleBar.addChild(littleIcon);
		littleIcon.mouseEnabled = false;
		littleIcon.x=1;
		littleIcon.y=1;
		
		var t:TextField = new TextField();
		t.defaultTextFormat = tf;
		t.text = name;
		t.selectable = false;
		t.x = 20;
		t.y = 0;
		t.mouseEnabled = false;
		titleBar.addChild(t);
		
		buttonClose = new ButtonCloseXP(titleBar, width-25, 2);

		titleBar.buttonMode = true;
		titleBar.mouseEnabled = true;
		titleBar.doubleClickEnabled = true;
		titleBar.name="TitleBar";
		
		redrawWorkingPannel();

		var tfs = ConfigManager.getTextFormatForStatus();
		statusBox = new StatusBox(pannel, 3, height-21, width-8, 18, "", tfs);
		redrawStatusBar(statusBox);
		

	}


	public function redrawWorkingPannel():void {
	}

	public function redrawStatusBar(_statusBox:StatusBox):void {
	}

	public function drawOnFrame():void{
	}
	
	public function executeMenu(event:MenuCustomEvent):void {
	}
	
	
	public function processKey(event:KeyboardEvent):void {
	}	

}
}