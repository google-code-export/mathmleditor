package learnmath.mathml.edit.types{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import flash.display.*;

import learnmath.mathml.edit.*;
import learnmath.mathml.edit.style.*;
import learnmath.mathml.formula.*;
import learnmath.mathml.util.*;

/*
*	Keep information about how to change a box(mrow);
*/
public class EditMBoxManager implements EditManager{
	
	private var textNode:XML;
	private var cM:CursorManager;
	public var cursorToEnd = false;
	
	
	public function EditMBoxManager(_textNode:XML):void{
		textNode = _textNode;
		cM = new CursorManager(_textNode);
	}
	
	public function drawCursor(graph:MovieClip):void{
		if(cursorToEnd){
			cM.drawEndBoxCursor(graph);
		}else{
			cM.drawBoxCursor(graph);
		}
	}
	
	public function clearCursor(graph:MovieClip):void{
		cM.clearCursor(graph);
	}
	
	public function addCharToCurrentPosition(c:String):void{
	}
	
	public function deleteRight(xml:XML):XML{
		return XMLUtil.deleteNodeGoRight(textNode);
	}
	
	public function deleteLeft(xml:XML):XML{
		return XMLUtil.deleteNodeGoLeft(textNode);
	}

	public function goBegin(selection:Boolean):XML{
		return(textNode.parent().children()[0]);
	}

	public function goEnd(selection:Boolean):XML{
		return(textNode.parent().children()[textNode.parent().children().length()-1]);
	}

	public function goLeft(selection:Boolean):XML{
		if(cursorToEnd) {
			cursorToEnd = false;
			return textNode;
		}
		var c:XML = textNode;
		while(true){
			
			var next:XML = XMLUtil.previousSibling(c);
			if(next!=null) return next;
			
			c = c.parent();
			if(c==null) return null;
		}
		return null;
	}

	public function goRight(selection:Boolean):XML{
		var c:XML = textNode;
		while(true){
			
			var next:XML = XMLUtil.nextSibling(c);
			if(next!=null) return next;
			
			c = c.parent();
			if(c==null) return null;
		}
		return null;
	}

	public function goUp(selection:Boolean):XML{
		if(textNode.parent()==null) return null;
		var name:String = textNode.parent().localName().toLowerCase();
		if(name=="mfrac" ){
			var n:XML = XMLUtil.previousSibling(textNode);
			if(n!=null){
				return n;
			}
		}
		if(name!=null){
			return(textNode.parent());
		}
		return null;
	}

	public function goDown(selection:Boolean):XML{
		if(textNode.children()[0]!=null){
			return(textNode.children()[0]);
		}
		return null;
	}
	
	
	public function changeStyle(style:Style):void{
		CustomStyleManager.changeStyleForNode(textNode, style);
	}
	
	public function getPosition(node:XML):Number{
		var parent:XML = node.parent();
		var pos:int = 0;
		for(var i:int=0; i<parent.children().length; i++){
			if(parent.children()[i]==node){
				pos = i;
				break;
			}
		}
		return pos;
	}
	
}
}