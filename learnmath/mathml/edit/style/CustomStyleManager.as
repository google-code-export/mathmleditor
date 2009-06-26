package learnmath.mathml.edit.style{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;

public class CustomStyleManager{
	
	public static function setDefaultForNode(node:XML, style:Style):void{
			if(node.attribute("mathsize").length()==0){
				node.attribute("mathsize")[0] = style.size;
			}
			if(node.attribute("mathcolor").length()==0){
				node.attribute("mathcolor")[0] = style.color;
			}
			if(node.attribute("fontfamily").length()==0){
				node.attribute("fontfamily")[0] = style.font;
			}
			if(node.attribute("fontweight").length()==0){
				if(style.fontweight!=""){
					node.attribute("fontweight")[0] = style.fontweight;
				}
			}
			if(node.attribute("fontstyle").length()==0){
				if(style.fontstyle!=""){
					node.attribute("fontstyle")[0] = style.fontstyle;
				}
			}
	}

	public static function changeStyleForNode(node:XML, newStyle:Style):void{
		if(isStyleChanged(node, newStyle )){
			var nodeStyle:Style = getStyleForCurrentNode(node);
			
			if(newStyle.size!=nodeStyle.size){
				node.attribute("mathsize")[0] = newStyle.size;
			}
			if(newStyle.color!=nodeStyle.color){
				node.attribute("mathcolor")[0] = newStyle.color;
			}
			if(newStyle.font!=nodeStyle.font){
				node.attribute("fontfamily")[0] = newStyle.font;
			}
			
			if(newStyle.fontweight!=nodeStyle.fontweight) {
				node.attribute("fontweight")[0] = newStyle.fontweight;
				
			}
			if(newStyle.fontstyle!=nodeStyle.fontstyle){
				node.attribute("fontstyle")[0] = newStyle.fontstyle;
			}
			
			if(node.attribute("fontweight")[0]=="" && nodeStyle.fontweight==""){
				delete node.attribute("fontweight")[0];
			}
			if(node.attribute("fontstyle")[0]=="" && nodeStyle.fontstyle==""){
				delete node.attribute("fontstyle")[0];
			}
		}
	}

	public static function hasSameStyle(n1:XML, n2:XML):Boolean{
		var s1:Style = getStyleForCurrentNode(n1);
		var s2:Style = getStyleForCurrentNode(n2);
		return compare(s1, s2);
	}

	public static function compare(s1:Style, s2:Style):Boolean{
		if(s1.size!=s2.size) return false;
		if(s1.color!=s2.color) return false;
		if(s1.font!=s2.font) return false;
		if(s1.fontweight!=s2.fontweight) return false;
		if(s1.fontstyle!=s2.fontstyle) return false;
		return true;
	}

	public static function getStyleForCurrentNode(node:XML):Style{
		var list:Array = new Array();
		list[list.length] = node;
		
		var parent:XML = node.parent();
		while(parent!=null){
			list[list.length] = parent;
			parent = parent.parent();
		}
		var s:Style = getRootNodeStyle(list[list.length-1]);
		for(var i:int=(list.length-1); i>-1; i--){
			s = getNodeStyle(list[i], s);
		}
		return s;
	}

	public static function getNodeStyle(node:XML, defaultStyle:Style):Style{
		var nodeStyle:Style = defaultStyle.getCopy();
		if(node.attribute("mathcolor").length()>0){
			nodeStyle.color = node.attribute("mathcolor")[0];
		}
		if(node.attribute("fontweight").length()>0){
			nodeStyle.fontweight = node.attribute("fontweight")[0];
		}
		if(node.attribute("fontstyle").length()>0){
			nodeStyle.fontstyle = node.attribute("fontstyle")[0];
		}
		if(node.attribute("mathsize").length()>0){
			nodeStyle.size = int(node.attribute("mathsize")[0]);
		}
		if(node.attribute("fontfamily").length()>0){
			nodeStyle.font = node.attribute("fontfamily")[0];
		}
		return nodeStyle;
	}

	public static function getRootNodeStyle(node:XML):Style{
		var nodeStyle:Style = new Style();
		if(node.attribute("mathcolor").length()>0){
			nodeStyle.color = node.attribute("mathcolor")[0];
		}
		if(node.attribute("fontweight").length()>0){
			nodeStyle.fontweight = node.attribute("fontweight")[0];
		}else{
			nodeStyle.fontweight = "";
		}
		if(node.attribute("fontstyle").length()>0){
			nodeStyle.fontstyle = node.attribute("fontstyle")[0];
		}else{
			nodeStyle.fontstyle = "";
		}
		if(node.attribute("mathsize").length()>0){
			nodeStyle.size = int(node.attribute("mathsize")[0]);
		}
		if(node.attribute("fontfamily").length()>0){
			nodeStyle.font = node.attribute("fontfamily")[0];
		}
		return nodeStyle;
	}
	

	public static function copyStyle(source:XML, target:XML):void{
		if(source.attribute("mathcolor").length()>0){
			target.attribute("mathcolor")[0] = source.attribute("mathcolor")[0];
		}
		if(source.attribute("fontweight").length()>0){
			target.attribute("fontweight")[0] = source.attribute("fontweight")[0];
		}
		if(source.attribute("fontstyle").length()>0){
			target.attribute("fontstyle")[0] = source.attribute("fontstyle")[0];
		}
		if(source.attribute("mathsize").length()>0){
			target.attribute("mathsize")[0] = source.attribute("mathsize")[0];
		}
		if(source.attribute("fontfamily").length()>0){
			target.attribute("fontfamily")[0] = source.attribute("fontfamily")[0];
		}
	}


	public static function isStyleChanged(node:XML, newStyle:Style):Boolean{
		var nodeStyle:Style = getStyleForCurrentNode(node);
		return !compare(nodeStyle, newStyle);
	}
}
}