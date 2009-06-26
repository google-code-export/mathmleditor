package learnmath.mathml.edit.types{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.formula.*;
import flash.display.*;

public interface EditManager{
	
	function drawCursor(graph:MovieClip):void;
	function clearCursor(graph:MovieClip):void;
	
	function addCharToCurrentPosition(c:String):void;
	function deleteRight(xml:XML):XML;
	function deleteLeft(xml:XML):XML;
	function goBegin(selection:Boolean):XML;
	function goEnd(selection:Boolean):XML;
	function goLeft(selection:Boolean):XML;
	function goRight(selection:Boolean):XML;
	function goUp(selection:Boolean):XML;
	function goDown(selection:Boolean):XML;
	
	function changeStyle(style:Style):void;
}
}