package learnmath.windows.elements{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.windows.*;
import learnmath.windows.util.*;
import learnmath.windows.elements.*;
import learnmath.windows.elements.buttons.*;
import flash.display.*;
import flash.events.*;
import flash.text.*;

public class StatusBoxHtml extends StatusBox{

	public function StatusBoxHtml(parent:MovieClip, x:int, y:int, _width:int, _height:int, text:String, tf:TextFormat){
		super(parent, x, y, _width, _height, text, tf);
	}
	
	public override function  drawText(text:String):void{
		t = new TextField();
		t.defaultTextFormat = tf;
		t.htmlText = text;
		t.x = 3;
		t.y = 3;
		t.width = width-2;
		t.height = height-2
		pannel.addChild(t);		
	}
	
	public override function setText(text:String):void{
		t.text = text;
	}
	
}
}