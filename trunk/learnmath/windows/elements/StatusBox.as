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

public class StatusBox extends Pannel{

	var tf:TextFormat;
	var t:TextField;

	public function StatusBox(parent:MovieClip, x:int, y:int, _width:int, _height:int, text:String, _tf:TextFormat){
		super(parent, x, y, _width, _height);
		tf = _tf;
		pannel.graphics.lineStyle(1,0x847f7b);
		pannel.graphics.moveTo(0,0);
		pannel.graphics.lineTo(width, 0);
		pannel.graphics.moveTo(0,0);
		pannel.graphics.lineTo(0, height-1);
		
		pannel.graphics.lineStyle(1,0xffffff);
		pannel.graphics.moveTo(width, height);
		pannel.graphics.lineTo(width, 0);
		pannel.graphics.moveTo(width, height-1);
		pannel.graphics.lineTo(0, height-1);
		pannel.mouseEnabled = false;
		drawText(text);		
	}
	
	public function drawText(text:String):void{
		t = new TextField();
		t.defaultTextFormat = tf;
		t.selectable = false;
		t.mouseEnabled = false;
		t.text = text;
		t.x = 3;
		t.y = 1;
		t.width = width-2;
		t.height = height-2;
		pannel.addChild(t);		
	}
	
	public function setText(text:String):void{
		t.text = text;
	}
	
	public function setHtml(html:String):void{
		t.text = "";
		t.htmlText = html;
	}
	
}
}