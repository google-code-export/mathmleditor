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
	
	public static function deleteGarbage(xml:XML, currentNode:XML):void{
		//search for mrow with one child
//		var search:Boolean = true;
//		do{
//			var mrow:XML = getMrowWithOneChildMrow(xml.children());
//			if(mrow!=null){
//				
//				var parent:XML = mrow.parent();
//				var child:XML = mrow.children()[0];
//				parent.appendChild(child);
//				
//				delete mrow.parent().children()[ mrow.childIndex() ];
//			}else{
//				search = false;
//			}
//		}while(search);
		
	}
	
	
	public static function getMrowWithOneChildMrow(children:XMLList):XML{
		if(children==null){
			return null;
		}
		for(var i:int=0; i<children.length; i++){
			var n:XML = children[i];
			
			if(n.localName()=='mrow' && n.children().length==1 && n.children()[0].localName()=="mrow"){
				return n;
			}

			var s:XML = getMrowWithOneChildMrow(n.children());
			if(s!=null) return s;
		}
		return  null;
	}
	
	
}
}