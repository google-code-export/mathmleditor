package learnmath.windows.menu{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/


public class MenuBar{


	public var menuList:Array;
	
	public function MenuBar(){
		menuList = new Array();
	}
	
	
	public function addMenuList(menuGroup:MenuGroup):void{
		menuList[menuList.length] = menuGroup;
	}
}
}