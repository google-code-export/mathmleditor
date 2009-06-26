package learnmath.windows.apps{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.mathml.edit.*;
import learnmath.mathml.formula.*;
import learnmath.windows.*;
import learnmath.windows.elements.*;
import learnmath.windows.elements.buttons.*;
import learnmath.windows.menu.*;
import flash.display.*;
import flash.events.*;
import flash.geom.*;
import flash.text.*;
import flash.ui.*;
import fl.containers.*;
import flash.external.*;



public class EditorApp extends WindowXP{

	var menuBar:MenuBar;
	var toolbars:ToolbarsBean;
	var sp:ScrollPane;
	var drawZone:MovieClip;
	var formulaMc:MovieClip;

	var editor:EditML;
	var style:Style = new Style();
	
	var workingPannelW;
	var workingPannelH;
	
	var toolbarsManager:Toolbars = new Toolbars();

	public function EditorApp(parent:MovieClip, x:int, y:int, _width:int, _height:int){
		name = "MathML Editor";
		super(parent, new LittleIconMC(), x, y, _width, _height);
		this.pannel.addEventListener(ToolbarCustomEvent.EXECUTE, showToolbars);
		this.pannel.addEventListener(ActionEvent.INSERT, insertToEditor);
		
		//create the menu
		menuBar = new MenuBar();
		var m1:MenuGroup = new MenuGroup("File", "menu_file");
		m1.addMenuList(new MenuItem("New", "menu_file_new"));
		m1.addMenuList(new MenuItem("Open...", "menu_file_open"));
		m1.addMenuList(new MenuItem("Save", "menu_file_save"));
		m1.addMenuList(new MenuItem("Close", "menu_file_close"));
		menuBar.addMenuList(m1);
		
		var m2:MenuGroup = new MenuGroup("Edit", "menu_edit");
		m2.addMenuList(new MenuItem("Undo", "menu_edit_undo"));
		m2.addMenuList(new MenuItem("Redo", "menu_edit_redo"));
		m2.addMenuList(new MenuItem("Cut", "menu_edit_cut"));
		m2.addMenuList(new MenuItem("Copy", "menu_edit_copy"));
		m2.addMenuList(new MenuItem("Paste", "menu_edit_paste"));		
		menuBar.addMenuList(m2);

	
		var m5:MenuGroup = new MenuGroup("Help", "menu_help");
		m5.addMenuList(new MenuItem("Commands", "menu_help_comm"));
		m5.addMenuList(new MenuItem("MathML", "menu_help_mathml"));
		m5.addMenuList(new MenuItem("About MathML Editor...", "menu_help_about"));
		menuBar.addMenuList(m5);
		
		
		Toolbars.init();
		toolbars = new ToolbarsBean();
		var tool1:ToolbarBean = new ToolbarBean();
		tool1.position="LEFT";
		tool1.addElement(new Equation2(17, 19), "toolbar_Equation1", true);
		tool1.addElement(new Equation29(17, 19), "toolbar_Equation2", true);
		//tool1.addElement(new Equation10(17, 19));
		//tool1.addElement(new Equation43(17, 19));
		tool1.addElement(new Fraction1(19, 19), "toolbar_Fraction1", true);
		tool1.addElement(new Superscript3(19, 19), "toolbar_Superscript", true);
		//tool1.addElement(new Superscript6(19, 19));
		tool1.addElement(new Fence1(19, 19), "toolbar_Fence", true);
		//tool1.addElement(new Fence12(19, 19));
		tool1.addElement(new SumGroup23(19, 19), "toolbar_Sum", true);
		//tool1.addElement(new SumGroup11(19, 19));
		tool1.addElement(new Integral2(19, 19), "toolbar_Integral1", true);
		tool1.addElement(new Integral12(19, 19), "toolbar_Integral2", true);
		//tool1.addElement(new Integral51(19, 19));
		//tool1.addElement(new Integral62(19, 19));
		//tool1.addElement(new Accent1(17, 19));
		tool1.addElement(new Accent10(17, 19), "toolbar_Accent", true);
		//tool1.addElement(new Accent17(17, 19));
		tool1.addElement(new Matrix6(19, 19), "toolbar_Matrix", true);
		tool1.addElement(new LittleChar11(18, 19), "toolbar_CharsL", true);
		tool1.addElement(new BigChar21(18, 19), "toolbar_CharsB", true);


		var tool2:ToolbarBean = new ToolbarBean();
		tool2.addElement(new NewIcon(18, 19), "menu_file_new", false);
		tool2.addElement(new OpenIcon(19, 19), "menu_file_open", true);
		tool2.addElement(new SaveIcon(18, 19), "menu_file_save", false);

		var tool3:ToolbarBean = new ToolbarBean();
		tool3.addElement(new CutIcon(19, 19), "menu_edit_cut", true);
		tool3.addElement(new CopyIcon(19, 19), "menu_edit_copy", true);
		tool3.addElement(new PasteIcon(18, 19), "menu_edit_paste", false);
		tool3.addElement(new UndoIcon(19, 19), "menu_edit_undo", false);
		tool3.addElement(new RedoIcon(19, 19), "menu_edit_redo", false);

		var tool4:ToolbarBean = new ToolbarBean();
		tool4.acceptedPosition = "TOP;BOTTOM"
		var textTypes = new Array();
		textTypes[textTypes.length]={label: "times", data:"times"};
		textTypes[textTypes.length]={label: "arial", data:"arial"};
		textTypes[textTypes.length]={label: "verdana", data:"verdana"};
		textTypes[textTypes.length]={label: "_serif", data:"_serif"};
		textTypes[textTypes.length]={label: "_sans", data:"_sans"};
		textTypes[textTypes.length]={label: "_typewriter", data:"_typewriter"};
		tool4.addSelectField("menu_style_family", true, textTypes, 0);
		
		var textSizes = new Array();
		textSizes[textSizes.length]={label: "8", data:"8"};
		textSizes[textSizes.length]={label: "9", data:"9"};
		textSizes[textSizes.length]={label: "10", data:"10"};
		textSizes[textSizes.length]={label: "11", data:"11"};
		textSizes[textSizes.length]={label: "12", data:"12"};
		textSizes[textSizes.length]={label: "14", data:"14"};
		textSizes[textSizes.length]={label: "16", data:"16"};
		textSizes[textSizes.length]={label: "18", data:"18"};
		textSizes[textSizes.length]={label: "20", data:"20"};
		textSizes[textSizes.length]={label: "22", data:"22"};
		textSizes[textSizes.length]={label: "24", data:"24"};
		textSizes[textSizes.length]={label: "26", data:"26"};
		textSizes[textSizes.length]={label: "28", data:"28"};
		textSizes[textSizes.length]={label: "32", data:"32"};
		textSizes[textSizes.length]={label: "36", data:"36"};
		textSizes[textSizes.length]={label: "40", data:"40"};
		tool4.addSelectField("menu_style_size", true, textSizes, 4);

		tool4.addElement(new Bold(19, 19), "menu_style_bold", true);
		tool4.addElement(new Italic(19, 19), "menu_style_italic", true);
		tool4.addColorPicker("menu_style_color");

		toolbars.addToolbar(tool2);
		toolbars.addToolbar(tool3);
		toolbars.addToolbar(tool4);
		toolbars.addToolbar(tool1);
		
		sp = new ScrollPane();
		drawZone = new MovieClip();
		
		drawZone.graphics.beginFill(0xeeeeee);   
		drawZone.graphics.drawRect(0, 0, AppManager.width-7, AppManager.height-96);   
		drawZone.graphics.endFill();
		
		sp.source = drawZone;
		
		formulaMc = new MovieClip();
		formulaMc.x = 150;
		formulaMc.y = 100;
		
		drawZone.addChild(formulaMc);
		
		var xml = new XML("<math><mrow><mtext>...</mtext></mrow></math>");
		editor = new EditML(formulaMc, xml);
		
		style.font = "times";
		style.size = 12;
		style.color = "#000000"		
		editor.drawFormula(style);
	}
	
	public override function redrawWorkingPannel():void {
		workingPannelW = pannel.width-6;
		workingPannelH = pannel.height-20-22-22-1; // sustract title bar,  menu bar, status bar height

		pannel.addChild(sp);
		var toolbarContainer:ToolbarContainer = MenuManager.createToolbars(this, pannel, toolbars, 3, 21+22, workingPannelW, workingPannelH);
		toolbarContainer.pannel.addEventListener(RedrawToolbarsEvent.REDRAW, redraw);

		var menuBarPannel:MenuBarPannel = MenuManager.createMenu(pannel, menuBar, workingPannelW);
		menuBarPannel.pannel.addEventListener(MenuCustomEvent.EXECUTE, executeMenu);
		menuBarPannel.pannel.x = 3;
		menuBarPannel.pannel.y = 21; // add title bar
		
		workingPannelW = workingPannelW - (toolbarContainer.getWidthLeft() + toolbarContainer.getWidthRight());
		workingPannelH = workingPannelH - (toolbarContainer.getHeightTop()  + toolbarContainer.getHeightBottom()) ; 
		
		sp.move(3 + toolbarContainer.getWidthLeft(), menuBarPannel.pannel.y + menuBarPannel.pannel.height + toolbarContainer.getHeightTop()-1);
		sp.setSize(workingPannelW, workingPannelH);
		
		toolbarsManager.redrawToolbars(pannel);

		
	}
	
	public override function processKey(event:KeyboardEvent):void {
			//trace("keyboard event: " + event.ctrlKey + " " + event.keyCode);
        editor.processKey(event, style);
		updateIcons()
    }	

	public override function executeMenu(event:MenuCustomEvent):void {
		super.executeMenu(event);
		trace("event:" + event.menuId);
		if(event.menuId=="menu_help_about"){
			
		}else if(event.menuId.indexOf("toolbar_")==0){
			toolbarsManager.drawToolbar(pannel, event.menuId, event.target.x, event.target.x + 20);
		}else if(event.menuId =="menu_file_new"){
			editor.newFormula();			
		}else if(event.menuId =="menu_file_open"){
			var ret:String = String(ExternalInterface.call("getMathML"));
			if(ret==null || ret.length==0 || ret=='null') return;
			editor.clear();
			editor.insert(ret);
		}else if(event.menuId =="menu_file_save"){
			var value = editor.getMathMLString();
			ExternalInterface.call("saveMathML", value);
		}else if(event.menuId=="menu_edit_cut"){
			editor.cut();
		}else if(event.menuId=="menu_edit_copy"){
			editor.copy();
		}else if(event.menuId=="menu_edit_paste"){
			editor.paste();
		}else if(event.menuId=="menu_edit_redo"){
			editor.redo();
		}else if(event.menuId=="menu_edit_undo"){
			editor.undo();
		}
		updateIcons();		
	}
	
	public function showToolbars(event:ToolbarCustomEvent):void {
		trace("event toolbar:" + event.menuId + " value:" + event.value);
		if(event.menuId.indexOf("toolbar_")==0){
			if(toolbarsManager.listPannels[event.menuId]!=null) return;
			
			var mc:MovieClip = event.source;
			var p:Point = new Point(mc.x, mc.y);
			p = mc.localToGlobal(p);
			p= pannel.globalToLocal(p);
			toolbarsManager.drawToolbar(pannel, event.menuId, p.x, p.y);
			var tPannel:ToolsPannel = ToolsPannel(toolbarsManager.listPannels[event.menuId]);
			if(event.tPosition=="TOP"){
				tPannel.pannel.y = p.y + 18;
			}else if(event.tPosition=="BOTTOM"){
				tPannel.pannel.y = p.y - tPannel.pannel.height - 3;
			}else if(event.tPosition=="LEFT"){
				tPannel.pannel.x = p.x + 20;
			}else if(event.tPosition=="RIGHT"){
				tPannel.pannel.x = p.x - tPannel.pannel.width - 3;
			}
		}else if(event.menuId=="menu_file_new"){
			editor.newFormula();
		}else if(event.menuId=="menu_file_open"){
			var ret:String = String(ExternalInterface.call("getMathML"));
			if(ret==null || ret.length==0 || ret=='null') return;
			editor.clear();
			editor.insert(ret);
		}else if(event.menuId=="menu_file_save"){
			var value = editor.getMathMLString();
			ExternalInterface.call("saveMathML", value);
		}else if(event.menuId=="menu_edit_cut"){
			editor.cut();
		}else if(event.menuId=="menu_edit_copy"){
			editor.copy();
		}else if(event.menuId=="menu_edit_paste"){
			editor.paste();
		}else if(event.menuId=="menu_edit_redo"){
			editor.redo();
		}else if(event.menuId=="menu_edit_undo"){
			editor.undo();
		}else if(event.menuId=="menu_style_bold"){
			if(style.fontweight==null){
				style.fontweight = "bold";
				toolbars.iconMap["menu_style_bold"].changeIcon("menu_style_bold", new BoldOn(19, 19));
			}else{
				style.fontweight = null;
				toolbars.iconMap["menu_style_bold"].changeIcon("menu_style_bold", new Bold(19, 19));
			}
			editor.changeStyle(style);
		}else if(event.menuId=="menu_style_italic"){
			if(style.fontstyle==null){
				style.fontstyle = "italic";
				toolbars.iconMap["menu_style_italic"].changeIcon("menu_style_italic", new ItalicOn(19, 19));
			}else{
				style.fontstyle = null;
				toolbars.iconMap["menu_style_italic"].changeIcon("menu_style_italic", new Italic(19, 19));
			}
			editor.changeStyle(style);
		}else if(event.menuId=="menu_style_family"){
			style.font=event.value;
			editor.changeStyle(style);
		}else if(event.menuId=="menu_style_size"){
			style.size=int(event.value);
			editor.changeStyle(style);
		}else if(event.menuId=="menu_style_color"){
			style.color = event.value;
			editor.changeStyle(style);
		}
		updateIcons();
	}
	
	
	public function redraw(event:RedrawToolbarsEvent):void {
		super.draw();
	}

	public function insertToEditor(event:ActionEvent):void {
		//trace(event.value);
		editor.insert(event.value);
		updateIcons();
	}

	public override function drawOnFrame():void {
	}


	private function updateIcons(){
		// verify the new/save cut/copy undo/redo icons
		if(!toolbars.iconMap["menu_file_new"].isEnableElement("menu_file_new")){
			toolbars.iconMap["menu_file_new"].enableElement("menu_file_new");
			toolbars.iconMap["menu_file_save"].enableElement("menu_file_save");
		}
		if(editor.mem.hasPrev()){
			toolbars.iconMap["menu_edit_undo"].enableElement("menu_edit_undo");
		}else{
			toolbars.iconMap["menu_edit_undo"].disableElement("menu_edit_undo");
		}
		if(editor.mem.hasNext()){
			toolbars.iconMap["menu_edit_redo"].enableElement("menu_edit_redo");
		}else{
			toolbars.iconMap["menu_edit_redo"].disableElement("menu_edit_redo");
		}
		if(editor.mem.clipboard!=null && editor.mem.clipboard.length>0){
			toolbars.iconMap["menu_edit_paste"].enableElement("menu_edit_paste");
		}else{
			toolbars.iconMap["menu_edit_paste"].disableElement("menu_edit_paste");
		}

	}
	
	public override function redrawStatusBar(_statusBox:StatusBox):void {
		_statusBox.setHtml("<p align='right'><b>MathML Editor - www.learn-math.info</b></p>");
	}


}
}