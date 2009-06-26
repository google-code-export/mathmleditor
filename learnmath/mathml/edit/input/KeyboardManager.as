package learnmath.mathml.edit.input{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.edit.*
import flash.events.*;
import flash.ui.*;

public class KeyboardManager{

	private var selectBox:SelectBox;
	
	public function KeyboardManager(_selectBox:SelectBox){
		selectBox = _selectBox;
	}

	public function isPasteKey(event:KeyboardEvent):Boolean{
		if(!event.ctrlKey) return false;
		if(event.keyCode == 86){
			return true
		}
		return false;
	}
	public function isCopyKey(event:KeyboardEvent):Boolean{
		if(!event.ctrlKey) return false;
		if(event.keyCode == 67){
			return true
		}
		return false;
	}
	public function isUndoKey(event:KeyboardEvent):Boolean{
		if(!event.ctrlKey) return false;
		if(event.keyCode == 90){
			return true
		}
		return false;
	}
	public function isRedoKey(event:KeyboardEvent):Boolean{
		if(!event.ctrlKey) return false;
		if(event.keyCode == 89){
			return true
		}
		return false;
	}
	public function isEnterKey(event:KeyboardEvent):Boolean{
		if(event.keyCode == Keyboard.ENTER){
			return true
		}
		return false;
	}
	
	public function processKey(event:KeyboardEvent):Boolean{
		if(event.keyCode == Keyboard.LEFT){
			selectBox.goLeft(event.shiftKey)
			 return true;
		}else if(event.keyCode == Keyboard.RIGHT){
			selectBox.goRight(event.shiftKey)
			return true;
		}else if(event.keyCode == Keyboard.UP){
			selectBox.goUp(event.shiftKey)
			return true;
		}else if(event.keyCode == Keyboard.DOWN){
			selectBox.goDown(event.shiftKey)
			return true;
		}else if(event.keyCode == Keyboard.HOME){
			selectBox.goBegin(event.shiftKey)
			return true;
		}else if(event.keyCode == Keyboard.END){
			selectBox.goEnd(event.shiftKey)
			return true;
		}else if(event.keyCode == Keyboard.DELETE){
			selectBox.deleteRight()
			return true;
		}else if(event.keyCode == Keyboard.BACKSPACE){
			selectBox.deleteLeft()
			return true;
		}else if(event.keyCode == Keyboard.TAB){
			selectBox.goTab(event.shiftKey)
			return true;
		}
		
		if(event.charCode>31 && event.charCode<126){
			selectBox.addCharToCurrentPosition(String.fromCharCode(event.charCode));
			return true;
		}
		return false;
	}

}
}