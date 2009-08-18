package learnmath.mathml.edit{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.edit.*;
import learnmath.mathml.edit.types.*;
import learnmath.mathml.edit.style.*;


/*
*	Keep information about what box is selected; For each box it is instance of 
*   Edit Manager and a Cursor Manager.
*/
public class DeleteUtil{
	
	
	public static function deleteGarbage(xml:XML):void{
		deleteMrowWithOneChildMrow(xml);
		mergeMTextNearMtext(xml);		
	}
	
	public static function mergeMTextNearMtext(xml:XML):void{
		var children:XMLList = xml.children();
		var lastMText:XML;
		for(var i:int=0; i<children.length(); i++){
			var n:XML = children[i];
			mergeMTextNearMtext(n);
			
			if(n.localName()==null) continue;
			if(n.attribute("selected")[0]==true) continue;
			
			if(n.localName().toLowerCase()=='mtext'){
				if(lastMText==null){
					lastMText = n;
				}else{
					if(n.children()[0]!="..."){
						lastMText.children()[0] = lastMText.children()[0].toXMLString() + n.children()[0].toXMLString();
						delete lastMText.attribute("manager")[0];
					}
					delete n.parent().children()[ n.childIndex() ];
				}
			}else{
				lastMText = null;
			}
		}
	}
	

	
	public static function deleteMrowWithOneChildMrow(xml:XML):void{
		//search for mrow with one child
		var search:Boolean = true;
		do{
			var mrow:XML = getMrowWithOneChildMrow(xml.children());
			if(mrow!=null){
				var parent:XML = mrow.parent();
				var child:XML = mrow.children()[0];
				parent.appendChild(child);
				
				delete mrow.parent().children()[ mrow.childIndex() ];
			}else{
				search = false;
			}
		}while(search);
		
	}
	
	
	private static function getMrowWithOneChildMrow(children:XMLList):XML{
		if(children==null){
			return null;
		}
		for(var i:int=0; i<children.length(); i++){
			var n:XML = children[i];
			if(n.localName()==null) continue;
			if(n.attribute("selected")[0]==true) continue;
			
			if(n.localName().toLowerCase()=='mrow' && n.children().length()==1 && n.children()[0].localName().toLowerCase()=="mrow"){
				return n;
			}

			var s:XML = getMrowWithOneChildMrow(n.children());
			if(s!=null) return s;
		}
		return  null;
	}
	
	
}
}