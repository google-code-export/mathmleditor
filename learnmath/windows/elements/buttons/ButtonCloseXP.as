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

public class ButtonCloseXP extends ButtonXP{

	var img:MovieClip;
	
	public function ButtonCloseXP(parent:MovieClip, x:int, y:int){
		super(parent, x, y, 16, 14, "NORMAL");
		img = new CloseImgMc();
		img.buttonMode = false;
		button.addChild(img);
		drawUP();
	}
	

	
	public override function drawUP(){
		super.drawUP();
		img.x=3;
		img.y=2;
	}	
	
	public override function drawDOWN(){
		super.drawDOWN();
		img.x=4;
		img.y=3;
	}
	
}
}