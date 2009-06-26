package learnmath.windows.menu{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import flash.display.*;
import flash.text.*;
import flash.events.*;
import learnmath.windows.*;
import learnmath.windows.elements.*;
import learnmath.windows.util.*;


public class MenuManager{


	public static function createMenu(parent:MovieClip, menuBar:MenuBar, width:int):MenuBarPannel{
		var menuBarPannel = new MenuBarPannel(parent, 0, 0, width, menuBar);
		return menuBarPannel;
	}
	

	public static function createToolbars(window:WindowXP, parent:MovieClip, toolbars:ToolbarsBean, _x:int, _y:int, _w:int, _h:int):ToolbarContainer{
		var toolbarContainer = new ToolbarContainer(window, parent, toolbars, _x, _y, _w, _h);
		return toolbarContainer;
	}

}
}