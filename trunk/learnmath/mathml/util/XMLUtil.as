package learnmath.mathml.util
{
	public class XMLUtil
	{
		public static function nextSibling(node:XML):XML{
			if(node==null) return null;
			
			var index:int = node.childIndex();
			var parent:XML = node.parent();
			if(parent==null) return null;
			if((index+1)<parent.children().length()){
				return parent.children()[index + 1];
			} 
			return null;
		}

		public static function previousSibling(node:XML):XML{
			if(node==null) return null;
			
			var index:int = node.childIndex();
			if(index==0) return null;
			
			var parent:XML = node.parent();
			if(parent==null) return null;
			return parent.children()[index - 1];
		}
		
		public static function deleteNodeGoLeft(node:XML):XML{
			if(node==null) return null;
			var index:int = node.childIndex();
			var parent:XML = node.parent();
			if(parent==null) return null;

			if(!acceptMoreChildren(parent)){ 
				return replaceNode("<mtext focus='true'>...</mtext>", node); 
			}

			var nbChildren:int = parent.children().length();

			delete parent.children()[ node.childIndex() ];

			if(nbChildren==1){
				var newText:XML = new XML("<mtext>...</mtext>");
				if(parent.parent()==null){
					var row:XML = new XML("<mrow/>");
					row.appendChild(newText);
					parent.appendChild(row);
				}else{
					parent.appendChild(newText);
				}
				return newText;
			}else{
				index = index-1;
				if(index<0){ index=0;}
				return parent.children()[index];
			}
		}		
		
		public static function deleteNodeGoRight(node:XML):XML{
			if(node==null) return null;
			var index:int = node.childIndex();
			var parent:XML = node.parent();
			if(parent==null) return null;
			
			var name:String = node.parent().localName().toLowerCase();
			if(!acceptMoreChildren(parent)){
				return replaceNode("<mtext focus='true'>...</mtext>", node); 
			 }
			
			
			var nbChildren:int = parent.children().length();
			
			delete node.parent().children()[ node.childIndex() ];
			
			if(nbChildren==1){
				var newText:XML = new XML("<mtext>...</mtext>");
				if(parent.parent()==null){
					var row:XML = new XML("<mrow/>");
					row.appendChild(newText);
					parent.appendChild(row);
				}else{
					parent.appendChild(newText);
				}
				return newText;
			}else{
				if(index>=parent.children().length){
					index = parent.children().length() -1;
				}
				return parent.children()[index];
			}
		}		

	public static function replaceNode(child:String, currentNode:XML):XML{
		var newNode:XML = new XML(child)
		var p:XML = currentNode.parent();
		if(p==null) return null;
		p.insertChildAfter(currentNode, newNode);
		delete p.children()[ currentNode.childIndex() ];
		
		var focusNode:XML = getNodeWithFocus(newNode);
		if(focusNode!=null){
			return focusNode;
		}else{
			return newNode;
		}
	}



	public static function replaceNodeAndInsert(child:String, currentNode:XML):XML{
		var newNode:XML = new XML(child)
		var p:XML = currentNode.parent();
		if(p==null) return null;
		p.insertChildAfter(currentNode, newNode);
		delete p.children()[ currentNode.childIndex() ];
		
		var focusNode:XML = getNodeWithFocus(newNode);
		if(focusNode!=null){
			var parentFocus:XML = focusNode.parent();
			parentFocus.insertChildAfter(focusNode, currentNode);
			delete parentFocus.children()[ focusNode.childIndex() ];
		}
		return newNode;
	}

	public static function insertToFront(child:String, currentNode:XML):XML{
		var newNode:XML = new XML(child)
		var p:XML = currentNode.parent();
		if(p==null) return null;
		
		if(	!acceptMoreChildren(p)){
			var mrow:XML = new XML("<mrow/>");
			p.insertChildAfter(currentNode, mrow);
			delete p.children()[ currentNode.childIndex() ];
			mrow.appendChild(newNode);
			mrow.appendChild(currentNode);
		}else{
			if(p.parent()==null){
				delete p.children()[ currentNode.childIndex() ];

				var mrow1:XML = new XML("<mrow/>");
				p.appendChild(mrow1);
				mrow1.appendChild(newNode);
				mrow1.appendChild(currentNode);
			}else{
				p.insertChildBefore(currentNode, newNode);
			}
		}
		var focusNode:XML = getNodeWithFocus(newNode);
		if(focusNode!=null){
			return focusNode;
		}else{
			return newNode;
		}
	}

	public static function insertToEnd(newNode:XML, currentNode:XML):XML{
		var p:XML = currentNode.parent();
		if(p==null) return null;
		
		if(	!acceptMoreChildren(p)){
			var mrow:XML = new XML("<mrow/>");
			p.insertChildAfter(currentNode, mrow);
			delete p.children()[ currentNode.childIndex() ];
			mrow.appendChild(currentNode);
			mrow.appendChild(newNode);
		}else{
			if(p.parent()==null){
				delete p.children()[ currentNode.childIndex() ];

				var mrow1:XML = new XML("<mrow/>");
				p.appendChild(mrow1);
				mrow1.appendChild(currentNode);
				mrow1.appendChild(newNode);
			}else{
				p.insertChildAfter(currentNode, newNode);
			}
		}
		var focusNode:XML = getNodeWithFocus(newNode);
		if(focusNode!=null){
			return focusNode;
		}else{
			return newNode;
		}
	}

	public static function acceptMoreChildren(node:XML):Boolean{
		var name:String = node.localName().toLowerCase();
		if(	name=="mfrac" || name=="mroot" ||
				name=="mover" || 
				name=="munder" ||
				name=="munderover" ||
				name=="msup" ||
				name=="msubsup" ||
				name=="sub"){
					return false;
				}
		return true;
		
	}	

	public static function getNodeWithFocus(node:XML):XML{
		for(var i:int=0; i<node.children().length(); i++){
			var child:XML = node.children()[i];
			if(child.attribute("focus").length()>0){
				return child;
			}else{
				var n:XML = getNodeWithFocus(child);
				if(n!=null) return n;
			}
		}
		return null;
	}
	
	public static function searchFirstFracDown(node:XML):XML{

		while(true){
			if(node.parent()==null) return null;
			var p:XML = node.parent();
			if(p.localName()==null) return null;
			var name:String = p.localName().toLowerCase();
			
			if(	name=="mfrac") {
				if(node.childIndex()==0) return p;
			}
			node = p;
		}		
		return null;
	}
	
	public static function searchFirstFracUp(node:XML):XML{

		while(true){
			if(node.parent()==null) return null;
			var p:XML = node.parent();
			if(p.localName()==null) return null;
			var name:String = p.localName().toLowerCase();
			
			if(	name=="mfrac") {
				if(node.childIndex()==1) return p;
			}
			node = p;
		}		
		return null;
	}
}
}