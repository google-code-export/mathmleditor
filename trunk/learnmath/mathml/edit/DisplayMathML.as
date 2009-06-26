package learnmath.mathml.edit{
	
public class DisplayMathML{
	
	private var xml:XML;
	private var line:Number = 0;
	
	
	
	public function DisplayMathML(_xml:XML){
		xml = _xml;
	}
	
	public function getText():String{
		return addChildren(xml.children(), 0);
	}

	
	private function countLineChildren(children:Array):Boolean{
		if(children==null){
			return false;
		}
		
		for(var i:int=0; i<children.length; i++){
			if(children[i].attribute("selected")[0]){
				return true;
			}
			if(children[i].localName()!=null){
				line = line + 1;
				var r:Boolean = countLineChildren(children[i].children());
				if(r) return true;
				line = line + 1;
			}else{
				line = line + 1;
			}
		}
		return false;
	}
	
	
	private function addChildren(children:Array, tabs:Number):String{
		if(children==null){
			return "";
		}
		
		var classTag:String = "n";
		var s:String = "";
		for(var i:int=0; i<children.length; i++){
			if(children[i].attribute("selected")[0]){
				classTag = "s";
			}else{
				classTag = "n";
			}
			if(children[i].localName()!=null){
				if(children[i].localName()=="mo" || children[i].localName()=="mtext"){
					s = s + insertTabs(tabs) + "<span class='"+classTag+"'>&lt;"+ children[i].localName();
					s = s + insertAttributes(children[i]);
					s = s + "&gt;</span>";
					s = s + addChildren(children[i].children(), tabs+1);
					s = s + "<span class='"+classTag+"'>&lt;/"+ children[i].localName() + "&gt;</span><br>";
				}else{
					s = s + insertTabs(tabs) + "<span class='"+classTag+"'>&lt;"+ children[i].localName();
					s = s + insertAttributes(children[i]);
					s = s + "&gt;</span><br>";
					s = s + addChildren(children[i].children(), tabs+1);
					s = s + insertTabs(tabs) + "<span class='"+classTag+"'>&lt;/"+ children[i].localName() + "&gt;</span><br>";
				}
			}else{
				if(children[i].parent().localName()=="mo" || children[i].parent().localName()=="mtext"){
					s = s + "<span class='"+classTag+"'>" + formatToHtml(children[i].nodeValue) + "</span>";
				}else{
					s = s + insertTabs(tabs+1) + "<span class='"+classTag+"'>" + formatToHtml(children[i].nodeValue) + "</span><br>";
				}
			}
		}
		return s;
	}
	
	private function insertAttributes(node:XML):String{
		var s:String = " ";
		var i:String;
		for (i in node.attributes) {
			if(i=="manager") continue;
			if(i=="selected") continue;
			if(i=="over") continue;
			if(node.attribute(i)[0]==null) continue;
			
			s = s + i+ "='" + node.attribute(i)[0] + "' ";
		}
		if(s.length==1){
			return "";
		}
		return s;
	}
	
	private function formatToHtml(text:String):String{
		var newText:String ="";
		for(var i:int=0; i<text.length; i++){
			var c:String = text.charAt(i);
			if(c=="<"){
				newText = newText + "&amp;lt;";
			}else if(c==">"){
				newText = newText + "&amp;gt;";
			}else{
				newText = newText + c;
			}
		}
		return newText;
	}
	
	private function insertTabs(tabs:Number):String{
		var s:String = "";
		for(var i:int=0; i<tabs; i++){
			s = s+ "    ";
		}
		return s;
	}
}
}