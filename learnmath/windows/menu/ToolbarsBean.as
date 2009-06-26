package learnmath.windows.menu{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import flash.display.*;

public class ToolbarsBean{

	public var toolbarList:Array;
	public var iconMap:Array;
	
	public function ToolbarsBean(){
		toolbarList = new Array();
		iconMap = new Array();
	}
	
	
	public function addToolbar(toolbar:ToolbarBean):void{
		toolbarList[toolbarList.length] = toolbar;
		for (var key in toolbar.iconMap){
			iconMap[key] = toolbar;
		}
	}
}
}