package learnmath.windows.elements.buttons{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.windows.*;
import learnmath.windows.util.*;
import flash.display.*;
import flash.text.*;
import flash.events.*;

public class ButtonTextImgXP extends ButtonXP{

	public var marginX:int = 3;
	public var textImage:Sprite;

	private var tf:TextFormat;
	
	public function ButtonTextImgXP(parent:MovieClip, x:int, y:int, text:String, img:MovieClip, type:String){
		tf = ConfigManager.getTextFormatForButtons();
		var _width = 2*marginX + TextUtil.getWidth(text, tf);
		if(img!=null){
			_width = _width + 16 + marginX;
		}
		textImage = new MovieClip();
		textImage.mouseChildren = false;

		if(img!=null){
			textImage.addChild(img);
			img.mouseEnabled = false;
		}
		if(text!=null){
			var t:TextField = new TextField();
			t.defaultTextFormat = tf;
			t.text = text;
			t.selectable = false;
			t.mouseEnabled = false;
			if(img!=null){
				t.x = 16 + marginX;
			}
			textImage.addChild(t);
		}
		textImage.x = marginX;
		textImage.y = 3;		

		super(parent, x, y, _width, 22, type);
		pannel.addChild(textImage);
		drawUP();
	}
	

	
	public override function drawUP(){
		super.drawUP();
		textImage.x = marginX;
		textImage.y = 3;
	}	
	
	public override function drawDOWN(){
		super.drawDOWN();
		textImage.x = marginX + 1;
		textImage.y = 4;
	}
	
}
}