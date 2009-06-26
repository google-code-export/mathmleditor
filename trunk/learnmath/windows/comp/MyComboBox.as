package learnmath.windows.comp{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import flash.display.*;
import flash.geom.*;
import flash.events.*;
import myLib.controls.*;
import myLib.data.*;
import myLib.core.*;
import myLib.displayUtils.*;
import myLib.transitions.*;
import myLib.events.*;


public class MyComboBox extends ComboBox{

	public var eventId:String;

	public function MyComboBox( _data:ICollection){
	
		_comboBoxSkin = DEFAULT_SKIN;
		
		_focusEnabled = false;
		tabEnabled = false;
			
		_removeChildren();
		_createChildren();
		_init();

		_skin = _comboBoxSkin;
		
		_dropdownList.dataProvider = _data;
		autoSize = true;
		invalidate( InvalidationType.SIZE );
		draw();
		
		_originWidth = _width;
		_originHeight = _height;
		scaleX = scaleY = 1;
	}
	
		public function getCustomWidth() : Number{
			return _width;	
		}
		
		public function getCustomHeight() : Number{
			return _height;	
		}
	
		public override function open(  ) : void
		{
			if( _isOpen || !_enabled || _dropdownList.dataProvider.isEmpty() ) return;
			
			_dropdownList.draw(); // make sure our component is validate (to get correct size).
			
			if( _dropdownList.getVisibleCells().length == 0 ) return;
			
			if( !_keepScrollPositionOnClose ) _dropdownList.scrollToIndex( 0 , AlignmentPoint.TOP );	
			
			_isOpen = true;
			
			var p : Point = localToGlobal( new Point( 0 ,  0 ) );
			
			// make sure open direction is valid and dropdown list will visible in stage area, if not change direction
			//if( _sens == 1 && p.y + _height + _dropdownList.height > stage.stageHeight ) _sens = -1;
			//if( _sens == -1 && p.y - _dropdownList.height < 0 ) _sens = 1;
			
			if( _tween != null ) _tween.stop();
			
			if( _transitionType != ComboBoxOpenType.NONE && _transitionDuration > 0 )
			{
				_tween = openFunction != null && _transitionType == ComboBoxOpenType.CUSTOM ? openFunction() : _initDropdownListForOpening();
				_tween.start( );
			}
			else
			{
				_dropdownList.x = p.x;	
				_dropdownList.y = _sens == 1 ? p.y + _height : p.y - _dropdownList.height;	
				
				_dropdownList.mask = null;
			}
			
			if( _transitionAlpha && _transitionDuration > 0 )
			{
				if( _alphaTween != null  ) _alphaTween.stop();
				
				_alphaTween = new Tween( _dropdownList , "alpha" , transitionEasing , 0 , 1 , _transitionDuration );
				_alphaTween.start();
			}
			
			stage.addChild( _dropdownListMask );
			stage.addChild( _dropdownList as DisplayObject );
			
			_dropdownList.setFocus();
			
			dispatchEvent( new ComboBoxEvent( ComboBoxEvent.OPEN ) );
		}
	
		protected override function _keyDown ( e : KeyboardEvent ) : void{
		}
}
}