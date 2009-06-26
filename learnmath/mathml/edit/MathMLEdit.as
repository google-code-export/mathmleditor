package learnmath.mathml.edit{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import flash.xml.*;
import learnmath.mathml.formula.*;
import learnmath.mathml.edit.*;

public class MathMLEdit extends MathML{
	
	private var editor:Boolean = false;

	public function MathMLEdit(xml:XML, _editor:Boolean):void{
		editor = _editor;
		super(xml);
	}
	
		
	protected override function loadNode(node:XML, parentBox:Box):Box{
		var box:Box = super.loadNode(node, parentBox);
		//added for editor
		if(editor){
			if(Maps.hasBox(node)){
				var oldBox:Box = Maps.getBox(node);
				box.selectionStart = oldBox.selectionStart;
				box.selectionEnd = oldBox.selectionEnd;
			}
			Maps.setBox(node, box);
		}		
		
		return box;
	}
	
}

}