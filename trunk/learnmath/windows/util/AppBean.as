package learnmath.windows.util{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import flash.text.*;
import flash.display.*;
import flash.events.*;
import flash.net.*;

public class AppBean{

	public var name:String;
	public var id:String;
	public var displayTaskbar:Boolean;
	public var singleton:Boolean;
	public var appTypeId:String;
	
	public var iconLittle:String;
	private var iconLittleLoader:Loader;
	private var iconLittleMc:MovieClip;
	public var iconBig:String;
	private var iconBigLoader:Loader;
	private var iconBigMc:MovieClip;
	public var movieclip:String;
	private var movieclipLoader:Loader;
	private var movieclipMc:MovieClip;



	public function AppBean():void{
		displayTaskbar = true;
		singleton = false;
	}
	
	public function getIconLittleMc():MovieClip{
		if (iconLittle==null || iconLittle.length==0) return null;
		var	loader = new Loader();
		loader.load(new URLRequest(iconLittle));
		var newmovie = new MovieClip();
		//newmovie.mouseEnabled = false;
		newmovie.mouseChildren = false;
		newmovie.addChild(loader);
		return newmovie;
	}
	
	public function getIconBigMc():MovieClip{
		if (iconBig==null || iconBig.length==0) return null;
		var	loader = new Loader();
		loader.load(new URLRequest(iconBig));
		var newmovie:MovieClip = new MovieClip();
		//newmovie.mouseEnabled = false;
		newmovie.mouseChildren = false;
		newmovie.addChild(loader);
		return newmovie;
	}
	
	public function getMovieclipMc():Loader{
		if (movieclip==null || movieclip.length==0) return null;
		var	loader = new Loader();
		loader.load(new URLRequest(movieclip));
		return loader;
	}
	
	
	

	
}
}