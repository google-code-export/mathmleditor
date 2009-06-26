package learnmath.windows.comp{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
	import myLib.assets.*;
	import myLib.colors.*;
	import myLib.controls.*;
	import myLib.controls.skins.*;
	import myLib.core.*;
	import myLib.displayUtils.*;
	import myLib.events.*;
	import myLib.form.IField;
	import myLib.styles.Padding;
	
	import flash.geom.*;
	import flash.display.*;
	import flash.events.*;
	import flash.text.*;
	import flash.ui.Keyboard;
	import flash.utils.Dictionary;	


public class MyColorPicker extends ColorPicker{


	public function MyColorPicker(){
		super();
	}
	

	
		public override function open(  ) : void
		{
			if( _isOpen ) return;
			
			if( _selectedSwatch != null )
				_displaySwatch( _selectedSwatch );
			else
				_displayColor( _selectedColor );
			
			var padding : Padding = openPadding;
			var offset : Number;
			var redrawFocus : Boolean = false;
			
			if( _isFocused )
			{
				redrawFocus = true;
				drawFocus( false );
			}

			var p:Point = new Point(0,0);
			p = this.localToGlobal(p);

			if( redrawFocus ) drawFocus( true );
			
			_palette.x = p.x - (_palette.width/2);
			if(_openDirection == ColorPickerOpenDirection.BOTTOM){
				_palette.y = p.y + _height;
			}else{
				_palette.y = p.y - _height - _palette.height;
			}
			
			stage.addChild( _palette as DisplayObject );
			
			stage.addEventListener( MouseEvent.MOUSE_MOVE , _stageMove , false , 0 , true );
			
			_isOpen = true;
			
			_focusTarget = _paletteTextInput as InteractiveObject;
			_paletteTextInput.setFocus();
			
			dispatchEvent( new ColorPickerEvent( ColorPickerEvent.OPEN ) );
			
			if( _captureBackgroundColor )
			{
				_background = new BitmapData( stage.stageWidth , stage.stageHeight , true , 0x000000 );
				_background.draw( stage );
				stage.addEventListener( MouseEvent.MOUSE_DOWN , _stageClick , true , 0 , true );
			}
			else
			{
				_background = null;
				stage.removeEventListener( MouseEvent.MOUSE_DOWN , _stageClick );
			}
		}
	
	
}
}