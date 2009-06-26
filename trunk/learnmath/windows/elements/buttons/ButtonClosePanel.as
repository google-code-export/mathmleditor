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

public class ButtonClosePanel extends ButtonXP{

	var img:MovieClip;
	
	public function ButtonClosePanel(parent:MovieClip, x:int, y:int){
		super(parent, x, y, 8, 7, "NORMAL");
		img = new CloseImgMc();
		img.scaleX = 0.5;
		img.scaleY = 0.5;
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