package learnmath.mathml.edit.types{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import flash.display.*;

import learnmath.mathml.*;
import learnmath.mathml.edit.*;
import learnmath.mathml.edit.style.*;
import learnmath.mathml.edit.text.*;
import learnmath.mathml.formula.*;
import learnmath.mathml.util.*;


/*
*	Keep information about how to change a text box;
*/
public class EditTextManager implements EditManager{
	
	public var textNode:XML;
	public var sT:SelectText;
	public var cM:CursorManager;
	public var text:String;
	
	
	public function EditTextManager(_textNode:XML):void{
		textNode = _textNode;
		text = textNode.children()[0].toString();
		sT = new SelectText(_textNode);
		cM = new CursorManager(_textNode);
		var value = textNode.children()[0].toString();
		if(value=="..."){
			cM.leftString = "";
		}else{
			cM.leftString = textNode.children()[0].toString();
		}
	}
	
	public function drawCursor(graph:MovieClip):void{
		cM.drawCursor(graph);
	}
	
	public function clearCursor(graph:MovieClip):void{
		cM.clearCursor(graph);
	}
	
	public function addCharToCurrentPosition(c:String):void{
		var newText:String = textNode.children()[0].toString();
		if(newText!=text){
			text = newText;
			sT = new SelectText(textNode);
			cM = new CursorManager(textNode);			
		}
		if(text=="..."){
			cM.leftString = c;
			text = c;
		}else{
			if(sT.getBeginSelection()==sT.getEndSelection()){
				text = text.substring(0, cM.getIndex()) + c +  text.substring(cM.getIndex());
				cM.leftString = cM.leftString + c;
			}else{
				text = text.substring(0, sT.getBeginSelection()) + c +  text.substring(sT.getEndSelection());
				cM.leftString = text.substring(0, sT.getBeginSelection()) + c;
			}
		}
		updateNode();
		sT.resetSelection();
	}
	
	public function updateNode():void{
		if(text==""){
			text="...";
		}
		textNode.children()[0] = text;
	}
	
	public function deleteRight(xml:XML):XML{
		if(text=="..."){
			return XMLUtil.deleteNodeGoRight(textNode);;
		}else{
			if(sT.isSelection){
				text = text.substring(0, sT.getBeginSelection()) +  text.substring(sT.getEndSelection());
				cM.leftString = text.substring(0, sT.getBeginSelection());
			}else{
				if(cM.getIndex()<text.length){
					text = text.substring(0, cM.getIndex()) + text.substring(cM.getIndex()+1);
				}
			}
		}
		updateNode();
		sT.resetSelection();
		return null;
	}
	
	
	public function deleteLeft(xml:XML):XML{
		if(text=="..."){
			return XMLUtil.deleteNodeGoLeft(textNode);;
		}else{
			if(sT.isSelection){
				text = text.substring(0, sT.getBeginSelection()) +  text.substring(sT.getEndSelection());
				cM.leftString = text.substring(0, sT.getBeginSelection());
			}else{
				if(cM.getIndex()>0){
					text = text.substring(0, cM.getIndex()-1) + text.substring(cM.getIndex());
					cM.leftString = cM.leftString.substring(0, cM.getIndex()-1);
				}
			}
		}
		updateNode();
		sT.resetSelection();
		return null;
	}

	public function goBegin(selection:Boolean):XML{
		sT.selectBefore(selection, cM.getIndex());
		cM.leftString = "";
		sT.selectAfter(selection, cM.getIndex());
		return null;
	}

	public function goEnd(selection:Boolean):XML{
		sT.selectBefore(selection, cM.getIndex());
		cM.leftString = text;
		sT.selectAfter(selection, cM.getIndex());
		return null;
	}

	public function goLeft(selection:Boolean):XML{
		var retValue:XML = null;
		sT.selectBefore(selection, cM.getIndex());
		if(cM.getIndex()>0){
			if(text=="..."){
				cM.leftString = "";
			}else{
				cM.leftString = text.substring(0, cM.getIndex()-1);
			}
			retValue = textNode;
		}
		sT.selectAfter(selection, cM.getIndex());
		return retValue;
	}

	public function goRight(selection:Boolean):XML{
		var retValue:XML = null;
		sT.selectBefore(selection, cM.getIndex());
		if(text.length>cM.getIndex()){
			if(text=="..."){
				cM.leftString = text;
			}else{
				cM.leftString = text.substring(0, cM.getIndex()+1);
			}
			retValue = textNode;
		}
		sT.selectAfter(selection, cM.getIndex());
		return retValue;
	}

	public function goUp(selection:Boolean):XML{
		return null;
	}

	public function goDown(selection:Boolean):XML{
		return null;
	}
	
	
	public function changeStyle(style:Style):void{
		CustomStyleManager.changeStyleForNode(textNode, style);
	}
	
	public function getSelection():String{
		if(sT.isSelection){
			return text.substring(sT.getBeginSelection(), sT.getEndSelection());
		}
		return null;
	}
}
}