package learnmath.mathml.edit{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import flash.display.*;
import flash.events.*;
import flash.geom.*;
import flash.utils.*;

import learnmath.mathml.edit.*;
import learnmath.mathml.edit.input.*;
import learnmath.mathml.edit.style.*;
import learnmath.mathml.formula.*;
import learnmath.mathml.formula.util.*;


public class EditML{
	
	private var xml:XML;
	private var mathML:MathMLEdit;
	public var pannel:MovieClip;
	

	private var parentMovie:Sprite;
	
	public var _defaultStyle:Style;
	
	private var selectBox:SelectBox;
	private var keyboardManager:KeyboardManager;
	private var mouseManager:MouseManager;
	private var needReDraw:Boolean = true;
	private var needReDrawRectangle:Boolean = true;
	
	private var displayMathML:DisplayMathML;
	private var secondTimer:Timer;
	public var mem:Memory = new Memory();
	
	public function EditML(graph:Sprite, _xml:XML){
		
		var formulaMc:MovieClip = new MovieClip();
		graph.addChild(formulaMc);
		
		formulaMc.buttonMode = true;
		formulaMc.addEventListener(MouseEvent.MOUSE_DOWN, pickUp);
		formulaMc.addEventListener(MouseEvent.MOUSE_UP, pickDown);
		
		parentMovie = formulaMc;
		if(_xml.toXMLString().indexOf("<math")==0){
			xml = new XML(_xml.toXMLString());
		}else{
			xml = new XML("<math>" + _xml.toXMLString() + "</math>");
		}
		secondTimer = new Timer(200);
		secondTimer.addEventListener(TimerEvent.TIMER, onTick);
		secondTimer.start();
		init();
	}

	private function init(){
		displayMathML = new DisplayMathML(xml);
		selectBox = new SelectBox(xml);
		keyboardManager = new KeyboardManager(selectBox);
		mouseManager = new MouseManager(selectBox, xml);
	} 
	
	public function drawFormula( style:Style):void{
		if(pannel!=null){
			pannel.removeEventListener(MouseEvent.MOUSE_MOVE, moveCursor);
			pannel.removeEventListener(MouseEvent.MOUSE_OUT, notOverCursor);
		}
		while(parentMovie.numChildren>0){
			parentMovie.removeChildAt(0);
		}
		_defaultStyle = style.getCopy();
		mathML = new MathMLEdit(xml, true);
		
		var dim:Rectangle = mathML.drawFormula(parentMovie, style);
		pannel = mathML.dE.mc;
		
		pannel.addEventListener(MouseEvent.MOUSE_MOVE, moveCursor);
		pannel.addEventListener(MouseEvent.MOUSE_OUT, notOverCursor);
		pannel.addEventListener(MouseEvent.CLICK, clickEvent);
		pannel.mouseChildren = false;
		pannel.name = "formula";
		
		drawRectangles();
		needReDraw = false;
		
		var oldXML:XML = new XML(xml.toXMLString());
		filterForCopy(oldXML);
		var oldXML1:XML = new XML(xml.toXMLString());
		filterAll(oldXML1);
		mem.addUnique(oldXML1.toXMLString(), oldXML.toXMLString());
	}

	
	public function processKey(event:KeyboardEvent, style:Style):void{
		if(keyboardManager.isUndoKey(event)){
			undo();
		}else if(keyboardManager.isRedoKey(event)){
			redo();
		}else if(keyboardManager.isCopyKey(event)){
			copy();
		}else if(keyboardManager.isPasteKey(event)){
			paste();
		}else if(keyboardManager.isEnterKey(event)){
			var newXML:XML = new XML("<mtext>...</mtext>"); 
			selectBox.insertToEnd(newXML);
			CustomStyleManager.changeStyleForNode(newXML, style);
			drawFormula(_defaultStyle);
		}else{
			var ret:Boolean = keyboardManager.processKey(event);
			if(ret){
				drawFormula(_defaultStyle);
			}
		}
	}
	public function undo():void{
			var prev:String = mem.getPrev();
			if(prev!=null){
				xml = new XML(prev);
				init();
				drawFormula(_defaultStyle);
			}
	}
	public function redo():void{
			var next:String = mem.getNext();
			if(next!=null){
				xml = new XML(next);
				init();
				drawFormula(_defaultStyle);
			}
	}
	public function cut():void{
			if(selectBox.currentNode!=null){
				var copyXML:XML = new XML(selectBox.getCurrentNode());
				filterAll(copyXML);
				mem.clipboard = copyXML.toXMLString();
				selectBox.deleteLeft()
				drawFormula(_defaultStyle);
			}
	}
	public function copy():void{
			if(selectBox.currentNode!=null){
				var copyXML:XML = new XML(selectBox.getCurrentNode());
				filterAll(copyXML);
				mem.clipboard = copyXML.toXMLString();
			}
	}
	public function paste():void{
			var pasteValue:String = mem.clipboard;
			if(pasteValue!=null){
				selectBox.insertBox(pasteValue);
				drawFormula(_defaultStyle);
			}
	}

	public function insert(child:String):void{
		selectBox.insertBox(child);
		drawFormula(_defaultStyle);
	}

	public function changeStyle(style:Style):void{
		selectBox.changeStyle(style)
		drawFormula(_defaultStyle);
	}
	
	public function moveCursor(event:MouseEvent):void{
		var p:Point = new Point(event.localX, event.localY);
		if(mouseManager.moveCursor(pannel, p.x, p.y)){
			needReDrawRectangle = true;
		}
	}
	
	public function notOverCursor(event:MouseEvent):void{
		if(mouseManager.overText!=null){
			mouseManager.overText.attribute("over")[0] = null;
			mouseManager.overText = null;
			needReDrawRectangle = true;
		}
	}


	public function clickEvent(event:MouseEvent):void{
		var p:Point = new Point(event.localX, event.localY);
		if(mouseManager.clickEvent(pannel, p.x, p.y)){
			drawFormula(_defaultStyle);
		}
	}
	
	public function onTick(evt:TimerEvent):void{
		if(needReDrawRectangle){
			drawRectangles();
		}
		selectBox.drawCursor(pannel);
	}
	

	public function drawRectangles():void{
		selectBox.drawRectangles(pannel);
		needReDrawRectangle = false;
	}

	public function clear():void{
		secondTimer.removeEventListener(TimerEvent.TIMER, onTick);
		selectBox.clearCursor(pannel);
	}
	
	public function getMathML():XML{
		var value:XML = new XML(xml.toXMLString());
		DeleteUtil.deleteGarbage(value);
		filterAll(value);
		return value;
	}
	public function getMathMLString():String{
		return getMathML().toXMLString();
	}


	public function filterAll(value:XML):void{
		filterAttribute(value, "box");
		filterAttribute(value, "manager");
		filterAttribute(value, "selected");
		filterAttribute(value, "over");
	}

	public function filterForCopy(value:XML):void{
		filterAttribute(value, "box");
		filterAttribute(value, "manager");
		filterAttribute(value, "over");
	}

	public function filterAttribute(node:XML, att:String):void{
		delete node.attribute(att)[0];
		for(var i:int=0; i<node.children().length(); i++){
			filterAttribute(node.children()[i], att);
		}
	}
	
	public function getStyleForCurrentNode():Style{
		return selectBox.getStyleForCurrentNode();
	}

	public function newFormula():void{
		xml = new XML("<math><mrow><mtext>...</mtext></mrow></math>");
		init();
		drawFormula(_defaultStyle);
	}
	
	// changes for IDE
	function pickUp(event:MouseEvent):void {
		event.currentTarget.startDrag(false);
	}
	function pickDown(event:MouseEvent):void {
		event.currentTarget.stopDrag();
	}
	
	
}
}