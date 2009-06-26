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

public class ButtonRestoreXP extends ButtonXP{

	var img:MovieClip;
	
	public function ButtonRestoreXP(parent:MovieClip, x:int, y:int){
		super(parent, x, y, 16, 14, "NORMAL");
		img = new RestoreMc();
		img.buttonMode = false;
		button.addChild(img);
		drawUP();
	}
	

	
	public override function drawUP(){
		super.drawUP();
		img.x=1;
		img.y=1;
	}	
	
	public override function drawDOWN(){
		super.drawDOWN();
		img.x=2;
		img.y=2;
	}
	
}
}