/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;

class learnmath.mathml.edit.style.CustomStyleManager{
	
	public static function changeStyleForNode(node:XMLNode, newStyle:Style, defaultStyle:Style){
		if(isStyleChanged(node, newStyle, defaultStyle )){
			var nodeStyle = getNodeStyle(node, defaultStyle);
			
			if(newStyle.size!=nodeStyle.size){
				node.attributes["fontsize"] = newStyle.size;
			}
			if(newStyle.color!=nodeStyle.color){
				node.attributes["color"] = newStyle.color;
			}
			if(newStyle.font!=nodeStyle.font){
				node.attributes["fontfamily"] = newStyle.font;
			}
			if(newStyle.fontweight!=nodeStyle.fontweight) {
				node.attributes["fontweight"] = newStyle.fontweight;
				
			}
			if(newStyle.fontstyle!=nodeStyle.fontstyle){
				node.attributes["fontstyle"] = newStyle.fontstyle;
			}
			
			if(node.attributes["fontweight"]==""){
				node.attributes["fontweight"] = null;
			}
			if(node.attributes["fontstyle"]==""){
				node.attributes["fontstyle"] = null;
			}
		}
	}

	public static function getNodeStyle(node:XMLNode, defaultStyle:Style):Style{
		var nodeStyle = defaultStyle.getCopy();
		if(node.attributes["color"]!=null){
			nodeStyle.color = node.attributes["color"];
		}
		if(node.attributes["fontweight"]!=null){
			nodeStyle.fontweight = node.attributes["fontweight"];
		}
		if(node.attributes["fontstyle"]!=null){
			nodeStyle.fontstyle = node.attributes["fontstyle"];
		}
		if(node.attributes["fontsize"]!=null){
			nodeStyle.size = int(node.attributes["fontsize"]);
		}
		if(node.attributes["fontfamily"]!=null){
			nodeStyle.font = node.attributes["fontfamily"];
		}
		return nodeStyle;
	}
		

	public static function copyStyle(source:XMLNode, target:XMLNode){
		if(source.attributes["color"]!=null){
			target.attributes["color"] = source.attributes["color"];
		}
		if(source.attributes["fontweight"]!=null){
			target.attributes["fontweight"] = source.attributes["fontweight"];
		}
		if(source.attributes["fontstyle"]!=null){
			target.attributes["fontstyle"] = source.attributes["fontstyle"];
		}
		if(source.attributes["fontsize"]!=null){
			target.attributes["fontsize"] = source.attributes["fontsize"];
		}
		if(source.attributes["fontfamily"]!=null){
			target.attributes["fontfamily"] = source.attributes["fontfamily"];
		}
	}


	public static function isStyleChanged(node:XMLNode, newStyle:Style, defaultStyle:Style):Boolean{
		var nodeStyle = getNodeStyle(node, defaultStyle);
		
		if(newStyle.size!=nodeStyle.size) return true;
		if(newStyle.color!=nodeStyle.color) return true;
		if(newStyle.font!=nodeStyle.font) return true;
		if(newStyle.fontweight!=nodeStyle.fontweight) return true;
		if(newStyle.fontstyle!=nodeStyle.fontstyle) return true;
		return false;
	}
}