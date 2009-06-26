package learnmath.mathml.edit{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import flash.display.*;

import learnmath.mathml.*;
import learnmath.mathml.edit.style.*;
import learnmath.mathml.edit.types.*;
import learnmath.mathml.formula.*;
import learnmath.mathml.util.*;


/*
*	Keep information about what box is selected; For each box it is instance of 
*   Edit Manager and a Cursor Manager.
*/
public class SelectBox{
	
	private var xml:XML;
	private var editManager:EditManager;
	public var currentNode:XML;
	
	function SelectBox(_xmlML:XML){
		xml = _xmlML;
		// if selected
		var selected:XML = searchSelected(xml);
		if(selected!=null){
			init(selected);
		}else{
			var textNodeSelected:XML = selectFirstText(xml.children());
			if(textNodeSelected==null){
				init(_xmlML);
			}else{
				init(textNodeSelected);
			}
		}
	}
	
	public function init(node:XML):void{
		if(node==null) return;
		if(node.localName()==null) return;
		
		if(currentNode!=null){
			currentNode.attribute("selected")[0]=false;
		}
		node.attribute("selected")[0]=true;
		if(Maps.hasManager(node)){
			editManager = Maps.getManager(node);
		}else{
			var name:String = node.localName().toLowerCase();
			if(name=="mtext" || name=="mn" || name=="mi"){
				editManager = new EditTextManager(node);
			}else if(name=="mo"){
				editManager = new EditMoManager(node);
			}else{
				editManager = new EditMBoxManager(node);
			}
			Maps.setManager(node,editManager);
		}
		if(editManager is EditMBoxManager){
			EditMBoxManager(editManager).cursorToEnd = false;
		}
		currentNode = XML(node);
	}
	
	public function clearSelection():void{
		if(currentNode!=null){
			currentNode.attribute("selected")[0]=false;
		}
	}

	public function drawCursor(graph:MovieClip):void{
		editManager.drawCursor(graph);
	}

	public function clearCursor(graph:MovieClip):void{
		editManager.clearCursor(graph);
	}
	
	public function drawRectangles(graph:MovieClip):void{
		drawRectanglesRecursiv(xml.children(), graph);
	}
	

	public function drawRectanglesRecursiv(children:XMLList, graph:MovieClip):void{
		if(children==null){
			return;
		}
		for(var i:int=0; i<children.length(); i++){
			if(children[i].localName()==null) continue;
			
			var name:String = children[i].localName().toLowerCase();
			if(name=='mtext' || name=='mo' || name=='mn' || name=='mi'){
				var box:Box = Maps.getBox(children[i]);
				if(box==null) continue;
				if(children[i].attribute("over")[0]!=null){
					DrawRectangle.drawOver(graph, box.finalBounds);
				}else{
					DrawRectangle.draw(graph, box.finalBounds);
				}
			}else{
				drawRectanglesRecursiv(children[i].children(), graph);
			}
		}
	}

	public function searchSelected(node:XML):XML{
		if(node.attribute("selected")[0]!=null && node.attribute("selected")[0]==true) return node;
		for(var i:int=0; i<node.children().length(); i++){
			var res:XML = searchSelected(node.children()[i]);
			if(res!=null) return res;
		}
		return res;
	}
	
	public function selectFirstText(children:XMLList):XML{
		if(children==null){
			return null;
		}
		for(var i:int=0; i<children.length(); i++){
			if(children[i].localName()==null) continue;
			
			var name:String = children[i].localName().toLowerCase();
			if(name=='mtext' || name=='mn' || name=='mi'){
				return children[i];
			}

			var s:XML = selectFirstText(children[i].children());
			if(s!=null) return s;
		}
		return null
	}
	
	public function insertBox(child:String):void{
		if(child.charAt(0)!='<'){
			addCharToCurrentPosition(child);
			return;
		}
		var newNode:XML = null;
		if(editManager is EditTextManager){
			var m:EditTextManager = EditTextManager(editManager);
			if(m.text=="..."){
				newNode = XMLUtil.replaceNode(child, currentNode);
			}else{
				if(m.sT.isSelection){
					var startText:String = m.text.substr(0, m.sT.getBeginSelection());
					var endText:String = m.text.substr(m.sT.getEndSelection());
					var selectText:String = m.text.substr(m.sT.getBeginSelection(), (m.sT.getEndSelection()-m.sT.getBeginSelection()));

					var mrow:XML = new XML("<mrow/>");
					var xmlChild:XML = new XML(child);
					currentNode.parent().insertChildAfter(currentNode, mrow);
					delete currentNode.parent().children()[ currentNode.childIndex() ];
					if(startText.length>0){
						mrow.appendChild(new XML("<mtext>"+startText+"</mtext>"));
					}
					if(selectText.length>0){
						mrow.appendChild(xmlChild);
						newNode = XMLUtil.getNodeWithFocus(xmlChild);
						if(newNode==null){ 
							newNode = xmlChild;
						}else{
							newNode = XMLUtil.replaceNode("<mtext>"+selectText+"</mtext>", newNode)
						}
					}
					if(endText.length>0){
						mrow.appendChild(new XML("<mtext>"+endText+"</mtext>"));
					}
					
				}else{
					var xmlChild:XML = new XML(child);
					if(m.cM.leftString.length==0){
						newNode = XMLUtil.insertToFront(child, currentNode);
					}else if(m.cM.leftString==m.text){
						newNode = XMLUtil.insertToEnd(xmlChild, currentNode);
					}else{
						mrow = new XML("<mrow/>");
						xmlChild = new XML(child);
						currentNode.parent().insertChildAfter(currentNode, mrow);
						delete currentNode.parent().children()[ currentNode.childIndex() ];
						mrow.appendChild(new XML("<mtext>"+m.cM.leftString+"</mtext>"));
						mrow.appendChild(xmlChild);
						mrow.appendChild(new XML("<mtext>"+m.text.substr(m.cM.leftString.length)+"</mtext>"));
						newNode = XMLUtil.getNodeWithFocus(xmlChild);
						if(newNode==null){ newNode = xmlChild;}
					}
				}
			}
		}else{
			newNode = XMLUtil.replaceNodeAndInsert(child, currentNode);
		}
		init(newNode);
	}
	
	public function insertToEnd(child:XML):void{
		var newNode:XML = XMLUtil.insertToEnd(child, currentNode);
		init(newNode);
	}

	
	public function addCharToCurrentPosition(c:String):void{
		if(editManager is EditMBoxManager){
			var m:EditMBoxManager = EditMBoxManager(editManager);
			if(m.cursorToEnd){
				var newXML:XML = new XML("<mtext>...</mtext>"); 
				insertToEnd(newXML);
			}
		}
		editManager.addCharToCurrentPosition(c);
	}
	
	public function deleteRight():void{
		var nextNode:XML = null;
		if(editManager is EditTextManager){
			nextNode = editManager.deleteRight(xml);
		}else{
			nextNode = editManager.deleteRight(xml);
			DeleteUtil.deleteGarbage(xml, nextNode);
		}
		init(nextNode);
	}
	
	public function deleteLeft():void{
		var nextNode:XML = null;
		if(editManager is EditTextManager){
			nextNode = editManager.deleteLeft(xml);
		}else{
			nextNode = editManager.deleteLeft(xml);
			DeleteUtil.deleteGarbage(xml, nextNode);
		}
		init(nextNode);
	}

	public function goBegin(selection:Boolean):void{
		var newNode:XML = editManager.goBegin(selection);
		init(newNode);
	}

	public function goEnd(selection:Boolean):void{
		var newNode:XML = editManager.goEnd(selection);
		init(newNode);
	}

	public function goLeft(selection:Boolean):void{
		if(editManager is EditMoManager){
			goTab(true);
			return;
		}
		var newNode:XML = editManager.goLeft(selection);
		if(newNode==null && editManager is EditTextManager){
			goTab(true);
		}else{
			init(newNode);
		}
	}

	public function goRight(selection:Boolean):void{
		if(editManager is EditMoManager){
			goTab(false);
			return;
		}
		var newNode:XML = editManager.goRight(selection);
		if(newNode==null && editManager is EditTextManager){
			var nextText:XML = getOnlyNextText();
			if(nextText==null && currentNode.parent()!=null){
				newNode = getNextSelectableParent();
				init(newNode);
				if(editManager is EditMBoxManager){
					var m:EditMBoxManager = EditMBoxManager(editManager);
					m.cursorToEnd = true;
				}
			}else{
				goTab(false);
			}
		}else{
			init(newNode);
		}
	}

	public function goUp(selection:Boolean):void{
		if(currentNode.parent()==null) return;
		if(currentNode.parent().localName()=="math" || currentNode.parent().localName()=="m:math") return;

		if(editManager is EditTextManager){
			editManager = new EditMTextManager(currentNode);
			return;
		}
		var newNode:XML = editManager.goUp(selection);
		if(newNode.parent()==null) return;
		init(newNode);
	}

	public function goDown(selection:Boolean):void{
		if(editManager is EditMTextManager){
			init(currentNode);
			return;
		}
		var newNode:XML = editManager.goDown(selection);
		if(newNode==null){
			//search first parent frac
			var parentFrac:XML = XMLUtil.searchFirstFracDown(currentNode);
			if(parentFrac){
				init(parentFrac.children()[1]);
				return;
			}
		}
		init(newNode);
	}


	public function goTab(selection:Boolean):void{
		var newNode:XML;
		if(!selection){
			newNode = getNextText();
		}else{
			newNode = getPrevText();
		}
		init(newNode);
	}
	
	private function getOnlyNextText():XML{
		var allTextArray:Array = new Array();
		getAllTextChildren(allTextArray, xml.children());
		for(var i:int=0; i<allTextArray.length; i++){
			if(allTextArray[i]==currentNode){
				if(i<(allTextArray.length-1)){
					return allTextArray[i+1];
				}else{
					return null;
				}
			}
		}
		return null;
	}

	public function getNextSelectableParent():XML{
		var c:XML = currentNode;
		while(true){
			var p:XML = c.parent();
			if(p==null){ return null; }
			var name:String = p.localName().toLowerCase();
			if(name=='mtd' || name=='mtr'){
				c=p;
				continue;
			}
			return p;
		}
		return null;
	}

	public function getNextText():XML{
		var allTextArray:Array = new Array();
		getAllTextChildren(allTextArray, xml.children());
		
		return getNextTextNode(allTextArray, currentNode);
	}
	
	public function getNextTextNode(list:Array, cNode:XML):XML{
		for(var i:int=0; i<list.length; i++){
			if(list[i]==cNode){
				if(i<(list.length-1)){
					return list[i+1];
				}else{
					return list[0];
				}
			}
		}
		return list[0];
	}

	private function getPrevText():XML{
		var allTextArray:Array = new Array();
		getAllTextChildren(allTextArray, xml.children());

		return getPrevTextNode(allTextArray, currentNode);
	}
	
	private function getPrevTextNode(list:Array, cNode:XML):XML{
		for(var i:int=0; i<list.length; i++){
			if(list[i]==cNode){
				if(i>0){
					return list[i-1];
				}else{
					return list[list.length-1];
				}
			}
		}
		return list[list.length-1];
	}

	private function getAllTextChildren(list:Array, children:XMLList):void{
		for(var i:int=0; i<children.length(); i++){
			var name:String = children[i].localName();
			loadChild(list, children[i]);
			if(name=='mroot'){
				loadChild(list, children[i].children()[1]);
				loadChild(list, children[i].children()[0]);
				getAllTextChildren(list, children[i].children()[1].children());
				getAllTextChildren(list, children[i].children()[0].children());
			}else{
				getAllTextChildren(list, children[i].children());
			}
		}
	}
	
	private function loadChild(list:Array, node:XML):void{
		var name:String = node.localName();
		if(name=='mtext' || name=='mo' || name=='mn' || name=='mi'){
			list[list.length] = node;
		}
	}
	
	public function changeStyle(style:Style):void{
		var isInText:Boolean = editManager is EditTextManager;
		editManager.changeStyle(style);
	}
	
	public function getStyleForCurrentNode():Style{
		return CustomStyleManager.getStyleForCurrentNode(currentNode);
	}
	
	public function getCurrentNode():String{
		if(editManager is EditTextManager){
			var m:EditTextManager = EditTextManager(editManager);
			return m.getSelection();
		}else{
			return currentNode.toXMLString();
		}
		return null;
	}
}
}