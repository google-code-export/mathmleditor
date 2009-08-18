package learnmath.windows.elements.buttons{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.windows.*;
import learnmath.mathml.formula.*;
import flash.display.*;
import flash.text.*;
import flash.events.*;
import flash.geom.*;

public class ButtonMathML extends ButtonXP{

	var workingPannel:MovieClip;
	var p:MovieClip;
	var initX:int = 0;
	var initY:int = 0;
	
	public function ButtonMathML(mathml:String, style:Style, w:int, h:int){
		workingPannel = new MovieClip();
		super(workingPannel, 0, 0, w, h, "NORMAL");
		
		var xml:XML = new XML(mathml);
		var mathML:MathML = new MathML(xml);
		
		
		p = new MovieClip();
		var dim:Rectangle = mathML.drawFormula(p, style);
		
		p.x = (w-dim.width)/2;
		p.y = (h-dim.height)/2;
		p.mouseEnabled = false;
		
		initX = p.x;
		initY = p.y;

		button.addChild(p);
		drawUP();
	}
	
	public function getButtonMC():MovieClip{
		return workingPannel;
	}



	public override function drawUP(){
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
		
		button.graphics.lineStyle(1,0x847f7b);
		button.graphics.moveTo(width-1, height);
		button.graphics.lineTo(width-1, 0);
		button.graphics.moveTo(width, height-1);
		button.graphics.lineTo(0, height-1);

		p.x = initX-1;
		p.y = initY-1;
	}	
	
	public override function drawDOWN(){
		button.graphics.clear();

		button.graphics.lineStyle();
		button.graphics.beginFill(0xe4dfd9);   
		button.graphics.drawRect(0,0,width,height);   
		button.graphics.endFill();

		button.graphics.lineStyle(1,0x847f7b);
		button.graphics.moveTo(0,0);
		button.graphics.lineTo(width, 0);
		button.graphics.moveTo(0,0);
		button.graphics.lineTo(0, height);
		
		button.graphics.lineStyle(1,0xffffff);
		button.graphics.moveTo(width-1, height);
		button.graphics.lineTo(width-1, 0);
		button.graphics.moveTo(width, height-1);
		button.graphics.lineTo(0, height-1);
		
		p.x = initX;
		p.y = initY;
			
	}
		
}
}