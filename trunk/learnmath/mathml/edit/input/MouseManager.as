package learnmath.mathml.edit.input{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.edit.*
import learnmath.mathml.formula.*;
import flash.display.*;

public class MouseManager{

	private var selectBox:SelectBox;
	private var xmlML:XML;
	public var overText:XML;
	
	
	public function MouseManager(_selectBox:SelectBox, _xmlML:XML){
		selectBox = _selectBox;
		xmlML = _xmlML;
	}

	public function moveCursor(graph:MovieClip, x:Number, y:Number):Boolean{
		x = x-graph.x;
		y = y-graph.y;
		var node:XML = findOverText(graph, x, y);

		if(node!=null){
			if(node!=overText){
				if(overText!=null){
					overText.attribute("over")[0] = null;
				}
				overText = node;
				overText.attribute("over")[0] = "T";
				return true;
			}
		}else{
			if(overText!=null){
				overText.attribute("over")[0] = null;
				overText = null;
				return true;
			}
		}
		return false;
	}
	public function clickEvent(graph:MovieClip, x:Number, y:Number):Boolean{
		if(overText!=null){
			selectBox.init(overText);
			return true;
		}
		return false;
	}

	private function findOverText(graph:MovieClip, x:Number, y:Number):XML{
		return findRectanglesRecursiv(xmlML.children(), x, y);
	}

	public function findRectanglesRecursiv(children:XMLList, x:Number, y:Number):XML{
		if(children==null){
			return null;
		}
		for(var i:int=0; i<children.length(); i++){
			if(children[i].localName()==null) continue;
			var name:String = children[i].localName().toLowerCase();
			if(name=='mtext' || name=='mo' || name=='mi' || name=='mn'){
				var box:Box = Maps.getBox(children[i]);
				if(box==null) continue;
				if(box.finalBounds.x<=x && (box.finalBounds.x+box.finalBounds.width)>=x &&
					box.finalBounds.y<=y && (box.finalBounds.y+box.finalBounds.height)>=y){
					return children[i];
				}
			}
			var node:XML = findRectanglesRecursiv(children[i].children(), x, y);
			if(node!=null){				
				return node;
			}
		}
		return null;
	}
	
}
}