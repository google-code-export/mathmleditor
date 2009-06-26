package learnmath.windows.menu{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/


public class MenuGroup extends MenuItem{


	public var itemList:Array;
	
	public function MenuGroup(_name:String, _id:String){
		super(_name, _id);
		itemList = new Array();
	}
	
	
	public function addMenuList(menuItem:MenuItem):void{
		itemList[itemList.length] = menuItem;
	}
	
}
}