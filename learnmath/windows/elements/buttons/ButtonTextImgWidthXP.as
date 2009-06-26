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

public class ButtonTextImgWidthXP extends ButtonXP{

	var text:String;
	var	img:MovieClip
	
	public var marginX:int = 3;
	public var textImage:Sprite;
	private var tf:TextFormat;	
	
	public function ButtonTextImgWidthXP(parent:MovieClip, x:int, y:int, _text:String, _img:MovieClip, type:String, _width:int){
		super(parent, x, y, _width, 22, type);
		text = _text;
		img = _img;
		tf = ConfigManager.getTextFormatForButtons();
		
		drawImageAndText();
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
	
	public override function setWidth(newWidth:int){
		super.setWidth(newWidth);
		drawImageAndText();
	}	
	
	public function drawImageAndText():void{
		if(textImage!=null){
			pannel.removeChild(textImage);
		}
		textImage = new MovieClip();
		textImage.mouseChildren = false;
		pannel.addChild(textImage);
		
		if(width<(16 + 2*marginX)) return;
		
		textImage.addChild(img);
		img.mouseEnabled = false;
		
		
		var displayedText = findtextForWidth(text);
		if(displayedText.length>0){
			var t:TextField = new TextField();
			t.defaultTextFormat = tf;
			t.text = displayedText;
			t.selectable = false;
			t.mouseEnabled = false;
			t.x = 16 + marginX;
			textImage.addChild(t);
		}

		textImage.x = marginX;
		textImage.y = 3;		

	}		

	public function findtextForWidth(text:String):String{
		var _width = 2*marginX + 16 + TextUtil.getWidth(text, tf);
		if(width>=_width) return text;
		
		while(width<_width){
			if(text.length==1) return "";
			text = text.substr(0, text.length-1)
			_width = 2*marginX + 16 + TextUtil.getWidth(text + "...", tf);
		}
		return text + "...";
	}	
}
}