package learnmath.mathml.edit.text{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.edit.*;
import learnmath.mathml.formula.*;

/*
*	Keep information about how to change a text box;
*/
public class SelectText{
	
	private var textNode:XML;
	public var isSelection:Boolean = false;

	public function SelectText(_textNode:XML){
		textNode = _textNode;
	}
	
	public function getBeginSelection():Number{
		var box:Box = Maps.getBox(textNode);
		if(box.selectionStart<box.selectionEnd){
			return box.selectionStart;
		}else{
			return box.selectionEnd;
		}
	}
	
	public function getEndSelection():Number{
		var box:Box = Maps.getBox(textNode);
		if(box.selectionStart<box.selectionEnd){
			return box.selectionEnd;
		}else{
			return box.selectionStart;
		}
	}

	public function selectBefore(selection:Boolean, index:Number):void{
		var box:Box = Maps.getBox(textNode);
		if(!selection){
			resetSelection();
			return;
		}else{
			if(!isSelection){
				isSelection = true;
				box.selectionStart = index;
			}
		}
	}

	public function selectAfter(selection:Boolean, index:Number):void{
		var box:Box = Maps.getBox(textNode);
		if(selection){
			box.selectionEnd = index;
		}else{
			resetSelection();
		}
	}
	
	public function resetSelection():void{
		var box:Box = Maps.getBox(textNode);
		if(box==null) return;
		box.selectionStart = 0;
		box.selectionEnd = 0;
		isSelection = false;
	}
	
}
}