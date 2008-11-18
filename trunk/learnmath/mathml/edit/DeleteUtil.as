/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.edit.*;
import learnmath.mathml.edit.types.*;
import learnmath.mathml.edit.style.*;
import learnmath.mathml.edit.operators.*;


/*
*	Keep information about what box is selected; For each box it is instance of 
*   Edit Manager and a Cursor Manager.
*/
class learnmath.mathml.edit.DeleteUtil{
	
	public static function deleteGarbage(xml:XML, currentNode:XMLNode){
		//search for mrow with one child
		var search:Boolean = true;
		do{
			var mrow:XMLNode = getMrowWithOneChild(xml.childNodes[0].childNodes);
			if(mrow!=null){
				var parent:XMLNode = mrow.parentNode;
				var child:XMLNode = mrow.childNodes[0];
				parent.insertBefore(child, mrow);
				mrow.removeNode();
			}else{
				search = false;
			}
		}while(search);
		
		var search:Boolean = true;
		do{
			var mtext:XMLNode = getEmptyMTextNearMText(xml.childNodes);
			if(mtext!=null){
				mtext.removeNode();
			}else{
				search = false;
			}
		}while(search);
		
	}
	
	public static function getEmptyMTextNearMText(children:Array):XMLNode{
		if(children==null){
			return null;
		}
		for(var i=0; i<children.length; i++){
			var parent:XMLNode = children[i].parentNode;
			if(!(	parent.nodeName=="mfrac" | 
				parent.nodeName=="mroot" | 
				parent.nodeName=="munderover" | 
				parent.nodeName=="munder" | 
				parent.nodeName=="mover" | 
				parent.nodeName=="msubsup" | 
				parent.nodeName=="msub" | 
				parent.nodeName=="msup")){
				
				if(children[i].nodeName=='mtext' & children[i+1].nodeName=='mtext'){
					if(children[i].childNodes[0].nodeValue=="..." | children[i].childNodes[0].nodeValue=="" | children[i].childNodes[0].nodeValue==" "){
						return children[i];
					}
					if(children[i+1].childNodes[0].nodeValue=="..." | children[i+1].childNodes[0].nodeValue=="" | children[i+1].childNodes[0].nodeValue==" "){
						return children[i+1];
					}
				}
			}

			var s = getEmptyMTextNearMText(children[i].childNodes);
			if(s!=null) return s;
		}
	}

	public static function getMrowWithOneChild(children:Array):XMLNode{
		if(children==null){
			return null;
		}
		for(var i=0; i<children.length; i++){
			var n = children[i];
			if(n.nodeName=='mrow' & n.childNodes.length==1 & n.childNodes[0].nodeName!="mtable"){
				return n;
			}

			var s = getMrowWithOneChild(n.childNodes);
			if(s!=null) return s;
		}
	}
	
	
}