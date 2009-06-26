package learnmath.windows.elements.buttons{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.windows.elements.*;
import learnmath.windows.elements.buttons.*;
import learnmath.windows.*;
import flash.display.*;
import flash.text.*;
import flash.events.*;

public class ButtonXP extends Pannel{

	public var button:Sprite;
	public var status:String = "UP";
	
	// NORMAL or STATE
	public var type="NORMAL";
	
	public function ButtonXP(parent:MovieClip, x:int, y:int, _width:int, _height, type:String){
		super(parent, x, y, _width, _height);
		pannel.buttonMode = true;
		pannel.addEventListener(MouseEvent.MOUSE_DOWN, drawD);
		pannel.addEventListener(MouseEvent.MOUSE_UP, drawU);
		pannel.name = "buttonXP"
		
		if(type!="STATE"){
			pannel.addEventListener(MouseEvent.MOUSE_OUT, drawU);
		}

		button = new MovieClip();
		pannel.addChild(button);
		button.mouseEnabled = false;
		pannel.mouseChildren = false;

	}
	

	function drawD(event:MouseEvent):void {
		drawDOWN();
	}
	
	function drawU(event:MouseEvent):void {
		drawUP();
	}	
	
	
	public function drawUP(){
		button.graphics.clear();

		button.graphics.lineStyle();
		button.graphics.beginFill(0xd4cfc9);   
		button.graphics.drawRect(0,0,width-1,height-1);   
		button.graphics.endFill();

		button.graphics.lineStyle(1,0xffffff);
		button.graphics.moveTo(0,0);
		button.graphics.lineTo(width, 0);
		button.graphics.moveTo(0,0);
		button.graphics.lineTo(0, height);
		
		button.graphics.lineStyle(1,0x433e3a);
		button.graphics.moveTo(width-1, height);
		button.graphics.lineTo(width-1, 0);
		button.graphics.moveTo(width, height-1);
		button.graphics.lineTo(0, height-1);
		
		button.graphics.lineStyle(1,0x847f7b);
		button.graphics.moveTo(width-2, height-1);
		button.graphics.lineTo(width-2, 1);
		button.graphics.moveTo(width-1, height-2);
		button.graphics.lineTo(1, height-2);
	}	
	
	public function drawDOWN(){
		button.graphics.clear();

		button.graphics.lineStyle();
		button.graphics.beginFill(0xe4dfd9);   
		button.graphics.drawRect(0,0,width,height);   
		button.graphics.endFill();

		button.graphics.lineStyle(1,0x847f7b);
		button.graphics.moveTo(1, 1);
		button.graphics.lineTo(width-2, 1);
		button.graphics.moveTo(1, 1);
		button.graphics.lineTo(1, height-2);

		button.graphics.lineStyle(1,0x433e3a);
		button.graphics.moveTo(0,0);
		button.graphics.lineTo(width, 0);
		button.graphics.moveTo(0,0);
		button.graphics.lineTo(0, height);
		
		button.graphics.lineStyle(1,0xffffff);
		button.graphics.moveTo(width-1, height);
		button.graphics.lineTo(width-1, 0);
		button.graphics.moveTo(width, height-1);
		button.graphics.lineTo(0, height-1);
	}
	
}
}