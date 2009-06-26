package learnmath.windows.elements.buttons{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.windows.*;
import flash.display.*;
import flash.text.*;
import flash.events.*;

public class ButtonMinXP extends ButtonXP{

	var img:MovieClip;
	
	public function ButtonMinXP(parent:MovieClip, x:int, y:int){
		super(parent, x, y, 16, 14, "NORMAL");
		img = new MinimizeMc();
		img.buttonMode = false;
		button.addChild(img);
		drawUP();
	}
	

	
	public override function drawUP(){
		super.drawUP();
		img.x=2;
		img.y=2;
	}	
	
	public override function drawDOWN(){
		super.drawDOWN();
		img.x=3;
		img.y=3;
	}
	
}
}