package learnmath.mathml.edit.types{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import learnmath.mathml.edit.*;
import learnmath.mathml.edit.types.*;
import learnmath.mathml.util.*;

/*
*	Keep information about how to change a text box;
*/
public class EditMoManager extends EditMBoxManager{
	
	public function EditMoManager(_textNode:XML){
		super(_textNode);
	}
	
	public override function goDown(selection:Boolean):XML{
		return null;
	}

}
}