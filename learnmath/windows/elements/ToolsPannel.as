package learnmath.windows.elements{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.windows.*;
import learnmath.windows.elements.buttons.*;
import learnmath.windows.menu.*;
import flash.display.*;
import flash.events.*;
import flash.geom.*;
import flash.text.*;
import flash.ui.*;


public class ToolsPannel extends WindowXP{
	
	public var haveBeenMoved = false;
	var toolWidth = 180;;
	var imgList:Array
	var values:Array
	public var bClose:ButtonClosePanel;
	public var id:String;

	public function ToolsPannel(parent:MovieClip, _name:String, _id:String, x:int, y:int, _imgList:Array, _values:Array){
		imgList = _imgList;
		if(imgList==null){
			imgList = new Array();
		}
		values = _values;
		if(values==null){
			values = new Array();
		}
		var w = toolWidth;
		var maxWidth = 0;
		var h = 17 + 20;
		var calcWidth = 5 ;
		for(var i:int=0; i<imgList.length; i++){
			var m:MovieClip = new MovieClip();
			
			var widthComp = 0;
			if(imgList[i] is ButtonMathML){
				var b:ButtonMathML = ButtonMathML(imgList[i]);
				widthComp = b.width+2;
				if(b.height>19){
					h = h + b.height-19;
				}
			}else{
				var img:Bitmap = new Bitmap(imgList[i]);
				m.addChild(img);
				widthComp = 21;
			}
			if((calcWidth+widthComp+5)>toolWidth){
				if((calcWidth+3)>maxWidth){
					maxWidth = calcWidth+3;
				}
				h = h + 20;
				calcWidth = 5;
			}
			calcWidth = calcWidth +widthComp;
			if(calcWidth>maxWidth){
				maxWidth = calcWidth +3;
			}
			
		}
		
		if(maxWidth==0){
			maxWidth = calcWidth + 3;
		}
		
		super(parent, null, x, y, maxWidth, h);
		id = _id;
	}

	public override function draw():void{
		pannel.graphics.clear();
		while(pannel.numChildren > 0) {
			pannel.removeChildAt(0);
		}
		
		pannel.graphics.lineStyle(1,0xd4cfc9);
		pannel.graphics.beginFill(0xd4cfc9);   
		pannel.graphics.drawRect(0, 0, width-1, height-1);   
		pannel.graphics.endFill();
		
		
		pannel.graphics.lineStyle(1,0xffffff);
		pannel.graphics.moveTo(0,0);
		pannel.graphics.lineTo(width, 0);
		pannel.graphics.moveTo(0,0);
		pannel.graphics.lineTo(0, height);
		
		pannel.graphics.lineStyle(1,0x433e3a);
		pannel.graphics.moveTo(width-1, height);
		pannel.graphics.lineTo(width-1, 0);
		pannel.graphics.moveTo(width, height-1);
		pannel.graphics.lineTo(0, height-1);
		
		pannel.graphics.lineStyle(1,0x847f7b);
		pannel.graphics.moveTo(width-2, height-1);
		pannel.graphics.lineTo(width-2, 1);
			pannel.graphics.moveTo(width-1, height-2);
		pannel.graphics.lineTo(1, height-2);
		
		titleBar = new MovieClip();
		titleBar.x = 3;
		titleBar.y = 3;
		pannel.addChild(titleBar);
		
		color1 = new MovieClip();
		color2 = new MovieClip();
		color1.mouseEnabled = false;
		color2.mouseEnabled = false;
		titleBar.addChild(color1);
		titleBar.addChild(color2);

		var colors:Array = [0x092469, 0xb7c7d7];
		var matr:Matrix = new Matrix();
		matr.createGradientBox(width-7, 10);
		
		color1.graphics.lineStyle();
		color1.graphics.beginGradientFill(GradientType.LINEAR, colors, [1, 1], [0, 255], matr, SpreadMethod.PAD);  
		color1.graphics.drawRect( 0, 0, width-7, 10);
		color1.graphics.endFill();


		bClose = new ButtonClosePanel(titleBar, width-13, 1);
		bClose.pannel.panelId=id;

		titleBar.buttonMode = true;
		titleBar.mouseEnabled = true;
		titleBar.addEventListener(MouseEvent.MOUSE_DOWN, pickUp);
		titleBar.addEventListener(MouseEvent.MOUSE_UP, dropIt);
		titleBar.name="TitleBar";

		var initStartX = 5;
		var startX = initStartX;
		var startY = 14;
		for(var i:int=0; i<imgList.length; i++){
			var m:MovieClip = new MovieClip();
			
			var compWidth = 0;
			var compHeight =0
			if(imgList[i] is ButtonMathML){
				var b:ButtonMathML = ButtonMathML(imgList[i]);
				compWidth = b.width + 2;
				if(b.height>19){
					compHeight = b.height;
				}
				m.addChild(b.getButtonMC());
			}else{
				var img:Bitmap = new Bitmap(imgList[i]);
				m.addChild(img);
				compWidth = 21;
			}
			m.indexIcon = i;
			m.addEventListener(MouseEvent.MOUSE_OVER, clickOverMenu);
			m.addEventListener(MouseEvent.MOUSE_DOWN, clickDownMenu);
			m.addEventListener(MouseEvent.MOUSE_OUT, clickUpMenu);
			m.addEventListener(MouseEvent.MOUSE_UP, clickUpMenu);			
			
			if((startX+compWidth+5)>toolWidth){
				startY = startY + 20;
				startX = initStartX;
			}			
			
			var cont:MovieClip = new MovieClip();
			cont.x = startX;// + rowCount*19 + int((19-m.width)/2);
			cont.y = startY;// + lineCount*19;
			cont.addChild(m);
			pannel.addChild(cont);
			
			startX = startX + compWidth;			
			if(compHeight>0){
				startY = startY + compHeight-19;
			}

		}
	}
	
	private function clickOverMenu(event:MouseEvent):void {
		var mc = event.currentTarget;
		mc.x = -1;
		mc.y = -1;
	}

	private function clickDownMenu(event:MouseEvent):void {
		var mc = event.currentTarget;
		mc.x = 1;
		mc.y = 1;
		pannel.parent.dispatchEvent(new ActionEvent(values[mc.indexIcon]));
	}

	private function clickUpMenu(event:MouseEvent):void {
		var mc = event.currentTarget;
		mc.x = 0;
		mc.y = 0;
	}

	function pickUp(event:MouseEvent):void {
		if(event.target.name=="TitleBar"){
			event.target.parent.startDrag();
		}
	}
	function dropIt(event:MouseEvent):void {
		if(event.target.name=="TitleBar"){
			event.target.parent.stopDrag();
		}
		haveBeenMoved = true;
	}

}
}