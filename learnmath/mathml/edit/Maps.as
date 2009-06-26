package learnmath.mathml.edit{

import learnmath.mathml.edit.types.*;
import learnmath.mathml.formula.*;

public class Maps{

	private static var mapBox:Array = new Array();
	private static var mapManager:Array = new Array();
	private static var nextIndex:int = 0;
	private static var nextIndexM:int = 0;

	public static function clear():void{
		mapBox = new Array();
		mapManager = new Array();
	}

	public static function setBox(node:XML, box:Box):void{
		if(node.attribute("box").length()>0){
			var index:String = node.attribute("box")[0];			
			mapBox[index+""] = box;
		}else{
			nextIndex =nextIndex + 1;
			mapBox[nextIndex+""] = box;
			node.attribute("box")[0] = nextIndex+"";
		}
	}

	public static function getBox(node:XML):Box{
		if(node.attribute("box").length()>0){
			var index:String = node.attribute("box")[0];			
			return Box(mapBox[index]);
		}
		return null;
	}

	public static function hasBox(node:XML):Boolean{
		return node.attribute("box").length()>0;
	}

	public static function setManager(node:XML, manager:EditManager):void{
		if(node.attribute("manager").length()>0){
			var index:String = node.attribute("manager")[0];			
			mapManager[index+""] = manager;
		}else{
			nextIndexM =nextIndexM + 1;
			mapManager[nextIndexM+""] = manager;
			node.attribute("manager")[0] = nextIndexM+"";
		}
	}

	public static function getManager(node:XML):EditManager{
		if(node.attribute("manager").length()>0){
			var index:String = node.attribute("manager")[0];	
			return EditManager(mapManager[index]);
		}
		return null;
	}

	public static function hasManager(node:XML):Boolean{
		return node.attribute("manager").length()>0;
	}

}

}