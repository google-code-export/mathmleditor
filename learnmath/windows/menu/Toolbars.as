package learnmath.windows.menu{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import flash.display.*;
import learnmath.windows.elements.*;
import flash.events.*;

public class Toolbars{

	public var listPannels:Array = new Array();
	
	public function redrawToolbars(pannel:MovieClip):void{
		for (var key in listPannels){
			var tPannel:ToolsPannel = ToolsPannel(listPannels[key]);	
			if(tPannel!=null){
				pannel.addChild(tPannel.pannel);
			}
		}
	}

	public function drawToolbar(pannel:MovieClip, toolbarId:String, x:int, y:int):void{
		for (var key in listPannels){
			var p:ToolsPannel = ToolsPannel(listPannels[key]);	
			if(p!=null && !p.haveBeenMoved){
				p.pannel.parent.removeChild(p.pannel);
				listPannels[key] = null;
			}
		}
		var tPannel:ToolsPannel = ToolsPannel(listPannels[toolbarId]);
		if(tPannel == null){
			tPannel = new ToolsPannel(pannel, "", toolbarId, x, y, toolbars[toolbarId], values[toolbarId]);
			tPannel.draw();
			tPannel.bClose.pannel.addEventListener(MouseEvent.CLICK, closeWindow);
			listPannels[toolbarId] = tPannel;
		}
		
	}

	function closeWindow(event:MouseEvent):void {
		var toolbarId = event.target.panelId;
		var window = listPannels[toolbarId];
		window.pannel.parent.removeChild(window.pannel);
		listPannels[toolbarId] = null;
	}	


	static var toolbars:Array = new Array();
	static var values:Array = new Array();
	
	public static function init():void{
		if(toolbars["toolbar_Equation1"]==null){
			var toolbarEquation1:Array = new Array();
			var toolbarValues1:Array = new Array();
			toolbarEquation1[toolbarEquation1.length] = new Equation1(17, 19);
			toolbarValues1[toolbarValues1.length] = "<mrow><mo>-</mo><mtext  focus='true'>...</mtext></mrow>";
			toolbarEquation1[toolbarEquation1.length] = new Equation2(17, 19);
			toolbarValues1[toolbarValues1.length] = "<mrow><mo>+</mo><mtext  focus='true'>...</mtext></mrow>"; 
			toolbarEquation1[toolbarEquation1.length] = new Equation3(17, 19);
			toolbarValues1[toolbarValues1.length] = "<mrow><mo>&ast;</mo><mtext  focus='true'>...</mtext></mrow>"; 
			toolbarEquation1[toolbarEquation1.length] = new Equation4(17, 19);
			toolbarValues1[toolbarValues1.length] = "<mrow><mo>&divide;</mo><mtext  focus='true'>...</mtext></mrow>";
			toolbarEquation1[toolbarEquation1.length] = new Equation5(17, 19);
			toolbarValues1[toolbarValues1.length] = "<mrow><mo>&times;</mo><mtext  focus='true'>...</mtext></mrow>";
			toolbarEquation1[toolbarEquation1.length] = new Equation6(17, 19);
			toolbarValues1[toolbarValues1.length] = "<mrow><mo>&centerdot;</mo><mtext  focus='true'>...</mtext></mrow>";
			toolbarEquation1[toolbarEquation1.length] = new Equation7(17, 19);
			toolbarValues1[toolbarValues1.length] = "<mrow><mo>&plusmn;</mo><mtext  focus='true'>...</mtext></mrow>";
			toolbarEquation1[toolbarEquation1.length] = new Equation8(17, 19);
			toolbarValues1[toolbarValues1.length] = "<mrow><mo>&mnplus;</mo><mtext  focus='true'>...</mtext></mrow>"; 
			toolbarEquation1[toolbarEquation1.length] = new Equation9(17, 19);
			toolbarValues1[toolbarValues1.length] = "<mrow><mo>&CircleTimes;</mo><mtext  focus='true'>...</mtext></mrow>";
			toolbarEquation1[toolbarEquation1.length] = new Equation10(17, 19);
			toolbarValues1[toolbarValues1.length] = "<mrow><mo>&CirclePlus;</mo><mtext  focus='true'>...</mtext></mrow>";
			toolbarEquation1[toolbarEquation1.length] = new Equation26(17, 19);
			toolbarValues1[toolbarValues1.length] = "<mrow><mo>&CircleMinus;</mo><mtext  focus='true'>...</mtext></mrow>";
			toolbarEquation1[toolbarEquation1.length] = new Equation27(17, 19);
			toolbarValues1[toolbarValues1.length] = "<mrow><mo>&CircleDot;</mo><mtext  focus='true'>...</mtext></mrow>"; 
			toolbarEquation1[toolbarEquation1.length] = new Equation15(17, 19);
			toolbarValues1[toolbarValues1.length] = "<mrow><mo>&equals;</mo><mtext  focus='true'>...</mtext></mrow>"; 
			toolbarEquation1[toolbarEquation1.length] = new Equation16(17, 19);
			toolbarValues1[toolbarValues1.length] = "<mrow><mo>&ne;</mo><mtext  focus='true'>...</mtext></mrow>"; 
			toolbarEquation1[toolbarEquation1.length] = new Equation17(17, 19);
			toolbarValues1[toolbarValues1.length] = "<mrow><mo>&equiv;</mo><mtext  focus='true'>...</mtext></mrow>";
			toolbarEquation1[toolbarEquation1.length] = new Equation20(17, 19);
			toolbarValues1[toolbarValues1.length] = "<mrow><mo>&ratio;</mo><mtext  focus='true'>...</mtext></mrow>"; 
			toolbarEquation1[toolbarEquation1.length] = new Equation21(17, 19);
			toolbarValues1[toolbarValues1.length] = "<mrow><mo>&Proportion;</mo><mtext  focus='true'>...</mtext></mrow>"; 
			toolbarEquation1[toolbarEquation1.length] = new Equation25(17, 19);
			toolbarValues1[toolbarValues1.length] = "<mrow><mo>&efDot;</mo><mtext  focus='true'>...</mtext></mrow>"; 
			toolbarEquation1[toolbarEquation1.length] = new Equation40(17, 19);
			toolbarValues1[toolbarValues1.length] = "<mrow><mo>&mid;</mo><mtext  focus='true'>...</mtext></mrow>"; 
			toolbarEquation1[toolbarEquation1.length] = new Equation41(17, 19);
			toolbarValues1[toolbarValues1.length] = "<mrow><mo>&par;</mo><mtext  focus='true'>...</mtext></mrow>"; 
			toolbarEquation1[toolbarEquation1.length] = new Equation42(17, 19);
			toolbarValues1[toolbarValues1.length] = "<mrow><mo>&brvbar;</mo><mtext  focus='true'>...</mtext></mrow>"; 
			toolbars["toolbar_Equation1"] = toolbarEquation1;
			values["toolbar_Equation1"] = toolbarValues1;
		}
		if(toolbars["toolbar_Equation2"]==null){
			var toolbarEquation2:Array = new Array();
			var toolbarValues2:Array = new Array();
			toolbarEquation2[toolbarEquation2.length] = new Equation11(17, 19);
			toolbarValues2[toolbarValues2.length] = "<mrow><mo>&lt;</mo><mtext  focus='true'>...</mtext></mrow>";
			toolbarEquation2[toolbarEquation2.length] = new Equation12(17, 19);
			toolbarValues2[toolbarValues2.length] = "<mrow><mo>&gt;</mo><mtext  focus='true'>...</mtext></mrow>";
			toolbarEquation2[toolbarEquation2.length] = new Equation13(17, 19);
			toolbarValues2[toolbarValues2.length] = "<mrow><mo>&le;</mo><mtext  focus='true'>...</mtext></mrow>";
			toolbarEquation2[toolbarEquation2.length] = new Equation14(17, 19);
			toolbarValues2[toolbarValues2.length] = "<mrow><mo>&ge;</mo><mtext  focus='true'>...</mtext></mrow>";
			toolbarEquation2[toolbarEquation2.length] = new Equation28(17, 19);
			toolbarValues2[toolbarValues2.length] = "<mrow><mo>&Lt;</mo><mtext  focus='true'>...</mtext></mrow>";
			toolbarEquation2[toolbarEquation2.length] = new Equation29(17, 19);
			toolbarValues2[toolbarValues2.length] = "<mrow><mo>&Gt;</mo><mtext  focus='true'>...</mtext></mrow>";
			toolbarEquation2[toolbarEquation2.length] = new Equation30(17, 19);
			toolbarValues2[toolbarValues2.length] = "<mrow><mo>&NotGreaterGreater;</mo><mtext  focus='true'>...</mtext></mrow>";
			toolbarEquation2[toolbarEquation2.length] = new Equation31(17, 19);
			toolbarValues2[toolbarValues2.length] = "<mrow><mo>&NotLessLess;</mo><mtext  focus='true'>...</mtext></mrow>";
			toolbarEquation2[toolbarEquation2.length] = new Equation32(17, 19);
			toolbarValues2[toolbarValues2.length] = "<mrow><mo>&nless;</mo><mtext  focus='true'>...</mtext></mrow>";
			toolbarEquation2[toolbarEquation2.length] = new Equation33(17, 19);
			toolbarValues2[toolbarValues2.length] = "<mrow><mo>&ngtr;</mo><mtext  focus='true'>...</mtext></mrow>";
			toolbarEquation2[toolbarEquation2.length] = new Equation34(17, 19);
			toolbarValues2[toolbarValues2.length] = "<mrow><mo>&Ll;</mo><mtext  focus='true'>...</mtext></mrow>";
			toolbarEquation2[toolbarEquation2.length] = new Equation35(17, 19);
			toolbarValues2[toolbarValues2.length] = "<mrow><mo>&Gg;</mo><mtext  focus='true'>...</mtext></mrow>";
			toolbarEquation2[toolbarEquation2.length] = new Equation36(17, 19);
			toolbarValues2[toolbarValues2.length] = "<mrow><mo>&leqq;</mo><mtext  focus='true'>...</mtext></mrow>";
			toolbarEquation2[toolbarEquation2.length] = new Equation37(17, 19);
			toolbarValues2[toolbarValues2.length] = "<mrow><mo>&geqq;</mo><mtext  focus='true'>...</mtext></mrow>";
			toolbarEquation2[toolbarEquation2.length] = new Equation38(17, 19);
			toolbarValues2[toolbarValues2.length] = "<mrow><mo>&nleqq;</mo><mtext  focus='true'>...</mtext></mrow>";
			toolbarEquation2[toolbarEquation2.length] = new Equation39(17, 19);
			toolbarValues2[toolbarValues2.length] = "<mrow><mo>&ngeqq;</mo><mtext  focus='true'>...</mtext></mrow>";
			toolbarEquation2[toolbarEquation2.length] = new Equation43(17, 19);
			toolbarValues2[toolbarValues2.length] = "<mrow><mo>&sim;</mo><mtext  focus='true'>...</mtext></mrow>";
			toolbarEquation2[toolbarEquation2.length] = new Equation18(17, 19);
			toolbarValues2[toolbarValues2.length] = "<mrow><mo>&sim;</mo><mtext  focus='true'>...</mtext></mrow>";
			toolbarEquation2[toolbarEquation2.length] = new Equation19(17, 19);
			toolbarValues2[toolbarValues2.length] = "<mrow><mo>&bcong;</mo><mtext  focus='true'>...</mtext></mrow>";

			toolbars["toolbar_Equation2"] = toolbarEquation2;
			values["toolbar_Equation2"] = toolbarValues2;
		}
		
		if(toolbars["toolbar_Fraction1"]==null){
			var toolbarEquation3:Array = new Array();
			var toolbarValues3:Array = new Array();
			toolbarEquation3[toolbarEquation3.length] = new Fraction1(19, 19);
			toolbarValues3[toolbarValues3.length] = "<mfrac><mtext focus='true'>...</mtext><mtext>...</mtext></mfrac>";
			toolbarEquation3[toolbarEquation3.length] = new Fraction3(19, 19);
			toolbarValues3[toolbarValues3.length] = "<mfrac bevelled='true'><mtext focus='true'>...</mtext><mtext>...</mtext></mfrac>";
			toolbarEquation3[toolbarEquation3.length] = new Fraction4(19, 19);
			toolbarValues3[toolbarValues3.length] = "<msqrt><mtext focus='true'>...</mtext></msqrt>";
			toolbarEquation3[toolbarEquation3.length] = new Fraction5(19, 19);
			toolbarValues3[toolbarValues3.length] = "<mroot><mtext>...</mtext><mtext focus='true'>...</mtext></mroot>";

			toolbars["toolbar_Fraction1"] = toolbarEquation3;
			values["toolbar_Fraction1"] = toolbarValues3;
		}
		
		if(toolbars["toolbar_Superscript"]==null){
			var toolbarEquation4:Array = new Array();
			var toolbarValues4:Array = new Array();
			toolbarEquation4[toolbarEquation4.length] = new Superscript1(19, 19);
			toolbarValues4[toolbarValues4.length] = "<msup><mtext focus='true'>...</mtext><mtext>...</mtext></msup>";
			toolbarEquation4[toolbarEquation4.length] = new Superscript2(19, 19);
			toolbarValues4[toolbarValues4.length] = "<msub><mtext focus='true'>...</mtext><mtext>...</mtext></msub>";
			toolbarEquation4[toolbarEquation4.length] = new Superscript3(19, 19);
			toolbarValues4[toolbarValues4.length] = "<msubsup><mtext focus='true'>...</mtext><mtext>...</mtext><mtext>...</mtext></msubsup>";
			toolbarEquation4[toolbarEquation4.length] = new Superscript4(19, 19);
			toolbarValues4[toolbarValues4.length] = "<mover><mtext focus='true'>...</mtext><mtext>...</mtext></mover>";
			toolbarEquation4[toolbarEquation4.length] = new Superscript5(19, 19);
			toolbarValues4[toolbarValues4.length] = "<munder><mtext focus='true'>...</mtext><mtext>...</mtext></munder>";
			toolbarEquation4[toolbarEquation4.length] = new Superscript6(19, 19);
			toolbarValues4[toolbarValues4.length] = "<munderover><mtext focus='true'>...</mtext><mtext>...</mtext><mtext>...</mtext></munderover>";

			toolbars["toolbar_Superscript"] = toolbarEquation4;
			values["toolbar_Superscript"] = toolbarValues4;
		}
		if(toolbars["toolbar_Fence"]==null){
			var toolbarEquation5:Array = new Array();
			var toolbarValues5:Array = new Array();
			toolbarEquation5[toolbarEquation5.length] = new Fence1(19, 19);
			toolbarValues5[toolbarValues5.length] = "<mfenced><mtext focus='true'>...</mtext></mfenced>";
			toolbarEquation5[toolbarEquation5.length] = new Fence2(19, 19);
			toolbarValues5[toolbarValues5.length] = "<mfenced open='[' close=']'><mtext focus='true'>...</mtext></mfenced>"; 
			toolbarEquation5[toolbarEquation5.length] = new Fence3(19, 19);
			toolbarValues5[toolbarValues5.length] = "<mfenced open='{' close='}'><mtext focus='true'>...</mtext></mfenced>"; 
			toolbarEquation5[toolbarEquation5.length] = new Fence4(19, 19);
			toolbarValues5[toolbarValues5.length] = "<mfenced open='&langle;' close='&rangle;'><mtext focus='true'>...</mtext></mfenced>"; 
			toolbarEquation5[toolbarEquation5.length] = new Fence5(19, 19);
			toolbarValues5[toolbarValues5.length] = "<mfenced open='|' close='|'><mtext focus='true'>...</mtext></mfenced>";
			toolbarEquation5[toolbarEquation5.length] = new Fence6(19, 19);
			toolbarValues5[toolbarValues5.length] = "<mfenced open='&Verbar;' close='&Verbar;'><mtext focus='true'>...</mtext></mfenced>"; 
			toolbarEquation5[toolbarEquation5.length] = new Fence7(19, 19);
			toolbarValues5[toolbarValues5.length] = "<mfenced open='&lfloor;' close='&rfloor;'><mtext focus='true'>...</mtext></mfenced>";
			toolbarEquation5[toolbarEquation5.length] = new Fence8(19, 19);
			toolbarValues5[toolbarValues5.length] = "<mfenced open='&lceil;' close='&rceil;'><mtext focus='true'>...</mtext></mfenced>"; 
			toolbarEquation5[toolbarEquation5.length] = new Fence9(19, 19);
			toolbarValues5[toolbarValues5.length] = "<mfenced open='[' close='['><mtext focus='true'>...</mtext></mfenced>"; 
			toolbarEquation5[toolbarEquation5.length] = new Fence10(19, 19);
			toolbarValues5[toolbarValues5.length] = "<mfenced open=']' close=']'><mtext focus='true'>...</mtext></mfenced>";
			toolbarEquation5[toolbarEquation5.length] = new Fence11(19, 19);
			toolbarValues5[toolbarValues5.length] = "<mfenced open=']' close='['><mtext focus='true'>...</mtext></mfenced>"; 
			toolbarEquation5[toolbarEquation5.length] = new Fence12(19, 19);
			toolbarValues5[toolbarValues5.length] = "<mfenced open='[' close=')'><mtext focus='true'>...</mtext></mfenced>"; 
			toolbarEquation5[toolbarEquation5.length] = new Fence13(19, 19);
			toolbarValues5[toolbarValues5.length] = "<mfenced open='(' close=']'><mtext focus='true'>...</mtext></mfenced>"; 
			toolbarEquation5[toolbarEquation5.length] = new Fence16(19, 19);
			toolbarValues5[toolbarValues5.length] = "<mfenced open='(' close=''><mtext focus='true'>...</mtext></mfenced>";
			toolbarEquation5[toolbarEquation5.length] = new Fence17(19, 19);
			toolbarValues5[toolbarValues5.length] = "<mfenced open='' close=')'><mtext focus='true'>...</mtext></mfenced>"; 
			toolbarEquation5[toolbarEquation5.length] = new Fence18(19, 19);
			toolbarValues5[toolbarValues5.length] = "<mfenced open='[' close=''><mtext focus='true'>...</mtext></mfenced>"; 
			toolbarEquation5[toolbarEquation5.length] = new Fence19(19, 19);
			toolbarValues5[toolbarValues5.length] = "<mfenced open='' close=']'><mtext focus='true'>...</mtext></mfenced>"; 
			toolbarEquation5[toolbarEquation5.length] = new Fence20(19, 19);
			toolbarValues5[toolbarValues5.length] = "<mfenced open='{' close=''><mtext focus='true'>...</mtext></mfenced>";
			toolbarEquation5[toolbarEquation5.length] = new Fence21(19, 19);
			toolbarValues5[toolbarValues5.length] = "<mfenced open='' close='}'><mtext focus='true'>...</mtext></mfenced>"; 
			toolbarEquation5[toolbarEquation5.length] = new Fence22(19, 19);
			toolbarValues5[toolbarValues5.length] = "<mfenced open='&langle;' close=''><mtext focus='true'>...</mtext></mfenced>"; 
			toolbarEquation5[toolbarEquation5.length] = new Fence23(19, 19);
			toolbarValues5[toolbarValues5.length] = "<mfenced open='' close='&rangle;'><mtext focus='true'>...</mtext></mfenced>"; 
			toolbarEquation5[toolbarEquation5.length] = new Fence24(19, 19);
			toolbarValues5[toolbarValues5.length] = "<mfenced open='|' close=''><mtext focus='true'>...</mtext></mfenced>";
			toolbarEquation5[toolbarEquation5.length] = new Fence25(19, 19);
			toolbarValues5[toolbarValues5.length] = "<mfenced open='' close='|'><mtext focus='true'>...</mtext></mfenced>"; 
			toolbarEquation5[toolbarEquation5.length] = new Fence26(19, 19);
			toolbarValues5[toolbarValues5.length] = "<mfenced open='&Verbar;' close=''><mtext focus='true'>...</mtext></mfenced>";
			toolbarEquation5[toolbarEquation5.length] = new Fence27(19, 19);
			toolbarValues5[toolbarValues5.length] = "<mfenced open='' close='&Verbar;'><mtext focus='true'>...</mtext></mfenced>";
			toolbarEquation5[toolbarEquation5.length] = new Fence28(19, 19);
			toolbarValues5[toolbarValues5.length] = "<mfenced open='|' close='&rangle;'><mtext focus='true'>...</mtext></mfenced>";
			toolbarEquation5[toolbarEquation5.length] = new Fence29(19, 19);
			toolbarValues5[toolbarValues5.length] = "<mfenced open='&langle;' close='|'><mtext focus='true'>...</mtext></mfenced>";

			toolbars["toolbar_Fence"] = toolbarEquation5;
			values["toolbar_Fence"] = toolbarValues5;
		}
		if(toolbars["toolbar_Sum"]==null){
			var toolbarEquation6:Array = new Array();
			var toolbarValues6:Array = new Array();
			toolbarEquation6[toolbarEquation6.length] = new SumGroup21(19, 19);
			toolbarValues6[toolbarValues6.length] = "<mrow><mo>&sum;</mo><mtext focus='true'>...</mtext></mrow>"; 
			toolbarEquation6[toolbarEquation6.length] = new SumGroup22(19, 19);
			toolbarValues6[toolbarValues6.length] ="<mrow><munder><mo>&sum;</mo><mtext>...</mtext></munder><mtext focus='true'>...</mtext></mrow>"; 
			toolbarEquation6[toolbarEquation6.length] = new SumGroup23(19, 19);
			toolbarValues6[toolbarValues6.length] = "<mrow><munderover><mo>&sum;</mo><mtext>...</mtext><mtext>...</mtext></munderover><mtext focus='true'>...</mtext></mrow>"; 
			toolbarEquation6[toolbarEquation6.length] = new SumGroup1(19, 19);
			toolbarValues6[toolbarValues6.length] = "<mrow><mo>&prod;</mo><mtext focus='true'>...</mtext></mrow>"; 
			toolbarEquation6[toolbarEquation6.length] = new SumGroup2(19, 19);
			toolbarValues6[toolbarValues6.length] = "<mrow><munderover><mo>&prod;</mo><mtext>...</mtext><mtext>...</mtext></munderover><mtext focus='true'>...</mtext></mrow>"; 
			toolbarEquation6[toolbarEquation6.length] = new SumGroup3(19, 19);
			toolbarValues6[toolbarValues6.length] = "<mrow><msubsup><mo>&prod;</mo><mtext>...</mtext><mtext>...</mtext></msubsup><mtext focus='true'>...</mtext></mrow>"; 
			toolbarEquation6[toolbarEquation6.length] = new SumGroup4(19, 19);
			toolbarValues6[toolbarValues6.length] = "<mrow><mo>&coprod;</mo><mtext focus='true'>...</mtext></mrow>";
			toolbarEquation6[toolbarEquation6.length] = new SumGroup5(19, 19);
			toolbarValues6[toolbarValues6.length] = "<mrow><munderover><mo>&coprod;</mo><mtext>...</mtext><mtext>...</mtext></munderover><mtext focus='true'>...</mtext></mrow>";
			toolbarEquation6[toolbarEquation6.length] = new SumGroup6(19, 19);
			toolbarValues6[toolbarValues6.length] = "<mrow><msubsup><mo>&coprod;</mo><mtext>...</mtext><mtext>...</mtext></msubsup><mtext focus='true'>...</mtext></mrow>";
			toolbarEquation6[toolbarEquation6.length] = new SumGroup7(19, 19);
			toolbarValues6[toolbarValues6.length] = "<mrow><mo>&Intersection;</mo><mtext focus='true'>...</mtext></mrow>";
			toolbarEquation6[toolbarEquation6.length] = new SumGroup8(19, 19);
			toolbarValues6[toolbarValues6.length] = "<mrow><munderover><mo>&Intersection;</mo><mtext>...</mtext><mtext>...</mtext></munderover><mtext focus='true'>...</mtext></mrow>";
			toolbarEquation6[toolbarEquation6.length] = new SumGroup9(19, 19);
			toolbarValues6[toolbarValues6.length] = "<mrow><msubsup><mo>&Intersection;</mo><mtext>...</mtext><mtext>...</mtext></msubsup><mtext focus='true'>...</mtext></mrow>";
			toolbarEquation6[toolbarEquation6.length] = new SumGroup10(19, 19);
			toolbarValues6[toolbarValues6.length] = "<mrow><mo>&Union;</mo><mtext focus='true'>...</mtext></mrow>";
			toolbarEquation6[toolbarEquation6.length] = new SumGroup11(19, 19);
			toolbarValues6[toolbarValues6.length] = "<mrow><munderover><mo>&Union;</mo><mtext>...</mtext><mtext>...</mtext></munderover><mtext focus='true'>...</mtext></mrow>"; 
			toolbarEquation6[toolbarEquation6.length] = new SumGroup12(19, 19);
			toolbarValues6[toolbarValues6.length] = "<mrow><msubsup><mo>&Union;</mo><mtext>...</mtext><mtext>...</mtext></msubsup><mtext focus='true'>...</mtext></mrow>";
			
			toolbars["toolbar_Sum"] = toolbarEquation6;
			values["toolbar_Sum"] = toolbarValues6;
		}

		if(toolbars["toolbar_Integral1"]==null){
			var toolbarEquation7:Array = new Array();
			var toolbarValues7:Array = new Array();
			toolbarEquation7[toolbarEquation7.length] = new Integral1(19, 19);
			toolbarValues7[toolbarValues7.length] = "<mrow><mo>&int;</mo><mtext focus='true'>...</mtext></mrow>"; 
			toolbarEquation7[toolbarEquation7.length] = new Integral2(19, 19);
			toolbarValues7[toolbarValues7.length] = "<mrow><munderover><mo>&int;</mo><mtext>...</mtext><mtext>...</mtext></munderover><mtext focus='true'>...</mtext></mrow>"; 
			toolbarEquation7[toolbarEquation7.length] = new Integral3(19, 19);
			toolbarValues7[toolbarValues7.length] = "<mrow><msubsup><mo>&int;</mo><mtext>...</mtext><mtext>...</mtext></msubsup><mtext focus='true'>...</mtext></mrow>";  
			toolbarEquation7[toolbarEquation7.length] = new Integral4(19, 19);
			toolbarValues7[toolbarValues7.length] = "<mrow><munder><mo>&int;</mo><mtext>...</mtext></munder><mtext focus='true'>...</mtext></mrow>";
			toolbarEquation7[toolbarEquation7.length] = new Integral5(19, 19);
			toolbarValues7[toolbarValues7.length] = "<mrow><msub><mo>&int;</mo><mtext>...</mtext></msub><mtext focus='true'>...</mtext></mrow>"; 
			toolbarEquation7[toolbarEquation7.length] = new Integral6(19, 19);
			toolbarValues7[toolbarValues7.length] = "<mrow><mo>&Int;</mo><mtext focus='true'>...</mtext></mrow>";
			toolbarEquation7[toolbarEquation7.length] = new Integral7(19, 19);
			toolbarValues7[toolbarValues7.length] = "<mrow><munder><mo>&Int;</mo><mtext>...</mtext></munder><mtext focus='true'>...</mtext></mrow>";
			toolbarEquation7[toolbarEquation7.length] = new Integral8(19, 19);
			toolbarValues7[toolbarValues7.length] = "<mrow><msub><mo>&Int;</mo><mtext>...</mtext></msub><mtext focus='true'>...</mtext></mrow>"; 
			toolbarEquation7[toolbarEquation7.length] = new Integral9(19, 19);
			toolbarValues7[toolbarValues7.length] = "<mrow><mo>&tint;</mo><mtext focus='true'>...</mtext></mrow>";  
			toolbarEquation7[toolbarEquation7.length] = new Integral10(19, 19);
			toolbarValues7[toolbarValues7.length] = "<mrow><munder><mo>&tint;</mo><mtext>...</mtext></munder><mtext focus='true'>...</mtext></mrow>"; 
			toolbarEquation7[toolbarEquation7.length] = new Integral11(19, 19);
			toolbarValues7[toolbarValues7.length] = "<mrow><msub><mo>&tint;</mo><mtext>...</mtext></msub><mtext focus='true'>...</mtext></mrow>"; 
			toolbarEquation7[toolbarEquation7.length] = new Integral12(19, 19);
			toolbarValues7[toolbarValues7.length] = "<mrow><mo>&oint;</mo><mtext focus='true'>...</mtext></mrow>"; 
			toolbarEquation7[toolbarEquation7.length] = new Integral13(19, 19);
			toolbarValues7[toolbarValues7.length] = "<mrow><munder><mo>&oint;</mo><mtext>...</mtext></munder><mtext focus='true'>...</mtext></mrow>";
			toolbarEquation7[toolbarEquation7.length] = new Integral14(19, 19);
			toolbarValues7[toolbarValues7.length] = "<mrow><msub><mo>&oint;</mo><mtext>...</mtext></msub><mtext focus='true'>...</mtext></mrow>";
			toolbarEquation7[toolbarEquation7.length] = new Integral15(19, 19);
			toolbarValues7[toolbarValues7.length] = "<mrow><mo>&Conint;</mo><mtext focus='true'>...</mtext></mrow>";  
			toolbarEquation7[toolbarEquation7.length] = new Integral16(19, 19);
			toolbarValues7[toolbarValues7.length] = "<mrow><munder><mo>&Conint;</mo><mtext>...</mtext></munder><mtext focus='true'>...</mtext></mrow>";
			toolbarEquation7[toolbarEquation7.length] = new Integral17(19, 19);
			toolbarValues7[toolbarValues7.length] = "<mrow><msub><mo>&Conint;</mo><mtext>...</mtext></msub><mtext focus='true'>...</mtext></mrow>"; 
			toolbarEquation7[toolbarEquation7.length] = new Integral18(19, 19);
			toolbarValues7[toolbarValues7.length] = "<mrow><mo>&Cconint;</mo><mtext focus='true'>...</mtext></mrow>"; 
			toolbarEquation7[toolbarEquation7.length] = new Integral19(19, 19);
			toolbarValues7[toolbarValues7.length] = "<mrow><munder><mo>&Cconint;</mo><mtext>...</mtext></munder><mtext focus='true'>...</mtext></mrow>"; 
			toolbarEquation7[toolbarEquation7.length] = new Integral20(19, 19);
			toolbarValues7[toolbarValues7.length] = "<mrow><msub><mo>&Cconint;</mo><mtext>...</mtext></msub><mtext focus='true'>...</mtext></mrow>"; 

			toolbars["toolbar_Integral1"] = toolbarEquation7;
			values["toolbar_Integral1"] = toolbarValues7;
		}
		if(toolbars["toolbar_Integral2"]==null){
			var toolbarEquation8:Array = new Array();
			var toolbarValues8:Array = new Array();
			toolbarEquation8[toolbarEquation8.length] = new Integral51(19, 19);
			toolbarValues8[toolbarValues8.length] = "<mrow><mo>&cwconint;</mo><mtext focus='true'>...</mtext></mrow>";
			toolbarEquation8[toolbarEquation8.length] = new Integral52(19, 19);
			toolbarValues8[toolbarValues8.length] = "<mrow><munderover><mo>&cwconint;</mo><mtext>...</mtext><mtext>...</mtext></munderover><mtext focus='true'>...</mtext></mrow>"; 
			toolbarEquation8[toolbarEquation8.length] = new Integral53(19, 19);
			toolbarValues8[toolbarValues8.length] = "<mrow><msubsup><mo>&cwconint;</mo><mtext>...</mtext><mtext>...</mtext></msubsup><mtext focus='true'>...</mtext></mrow>";  
			toolbarEquation8[toolbarEquation8.length] = new Integral54(19, 19);
			toolbarValues8[toolbarValues8.length] = "<mrow><mo>&awconint;</mo><mtext focus='true'>...</mtext></mrow>"; 
			toolbarEquation8[toolbarEquation8.length] = new Integral55(19, 19);
			toolbarValues8[toolbarValues8.length] = "<mrow><munderover><mo>&awconint;</mo><mtext>...</mtext><mtext>...</mtext></munderover><mtext focus='true'>...</mtext></mrow>";  
			toolbarEquation8[toolbarEquation8.length] = new Integral56(19, 19);
			toolbarValues8[toolbarValues8.length] = "<mrow><msubsup><mo>&awconint;</mo><mtext>...</mtext><mtext>...</mtext></msubsup><mtext focus='true'>...</mtext></mrow>"; 
			toolbarEquation8[toolbarEquation8.length] = new Integral57(19, 19);
			toolbarValues8[toolbarValues8.length] = "<mrow><mo>&cwint;</mo><mtext focus='true'>...</mtext></mrow>";
			toolbarEquation8[toolbarEquation8.length] = new Integral58(19, 19);
			toolbarValues8[toolbarValues8.length] = "<mrow><munderover><mo>&cwint;</mo><mtext>...</mtext><mtext>...</mtext></munderover><mtext focus='true'>...</mtext></mrow>"; 
			toolbarEquation8[toolbarEquation8.length] = new Integral59(19, 19);
			toolbarValues8[toolbarValues8.length] = "<mrow><msubsup><mo>&cwint;</mo><mtext>...</mtext><mtext>...</mtext></msubsup><mtext focus='true'>...</mtext></mrow>";  
			toolbarEquation8[toolbarEquation8.length] = new Integral60(19, 19);
			toolbarValues8[toolbarValues8.length] = "<mrow><mo>&awint;</mo><mtext focus='true'>...</mtext></mrow>"; 
			toolbarEquation8[toolbarEquation8.length] = new Integral61(19, 19);
			toolbarValues8[toolbarValues8.length] = "<mrow><munderover><mo>&awint;</mo><mtext>...</mtext><mtext>...</mtext></munderover><mtext focus='true'>...</mtext></mrow>";  
			toolbarEquation8[toolbarEquation8.length] = new Integral62(19, 19);
			toolbarValues8[toolbarValues8.length] = "<mrow><msubsup><mo>&awint;</mo><mtext>...</mtext><mtext>...</mtext></msubsup><mtext focus='true'>...</mtext></mrow>"; 
			toolbarEquation8[toolbarEquation8.length] = new Integral63(19, 19);
			toolbarValues8[toolbarValues8.length] = "<mrow><mo>&fpartint;</mo><mtext focus='true'>...</mtext></mrow>";
			toolbarEquation8[toolbarEquation8.length] = new Integral64(19, 19);
			toolbarValues8[toolbarValues8.length] = "<mrow><munderover><mo>&fpartint;</mo><mtext>...</mtext><mtext>...</mtext></munderover><mtext focus='true'>...</mtext></mrow>"; 
			toolbarEquation8[toolbarEquation8.length] = new Integral65(19, 19);
			toolbarValues8[toolbarValues8.length] = "<mrow><msubsup><mo>&fpartint;</mo><mtext>...</mtext><mtext>...</mtext></msubsup><mtext focus='true'>...</mtext></mrow>";  

			toolbars["toolbar_Integral2"] = toolbarEquation8;
			values["toolbar_Integral2"] = toolbarValues8;
		}
		if(toolbars["toolbar_Accent"]==null){
			var toolbarEquation9:Array = new Array();
			var toolbarValues9:Array = new Array();
			toolbarEquation9[toolbarEquation9.length] = new Accent1(17, 19);
			toolbarValues9[toolbarValues9.length] = "<msup><mtext focus='true'>...</mtext><mo>&prime;</mo></msup>";
			toolbarEquation9[toolbarEquation9.length] = new Accent2(17, 19);
			toolbarValues9[toolbarValues9.length] = "<msup><mtext focus='true'>...</mtext><mo>&Prime;</mo></msup>"; 
			toolbarEquation9[toolbarEquation9.length] = new Accent3(17, 19);
			toolbarValues9[toolbarValues9.length] = "<msup><mtext focus='true'>...</mtext><mo>&tprime;</mo></msup>";
			toolbarEquation9[toolbarEquation9.length] = new Accent4(17, 19);
			toolbarValues9[toolbarValues9.length] = "<mover><mtext focus='true'>...</mtext><mo>&dot;</mo></mover>"; 
			toolbarEquation9[toolbarEquation9.length] = new Accent5(17, 19);
			toolbarValues9[toolbarValues9.length] = "<mover><mtext focus='true'>...</mtext><mo>&ddot;</mo></mover>"; 
			toolbarEquation9[toolbarEquation9.length] = new Accent6(17, 19);
			toolbarValues9[toolbarValues9.length] = "<mover><mtext focus='true'>...</mtext><mo>&ctdot;</mo></mover>";
			toolbarEquation9[toolbarEquation9.length] = new Accent7(17, 19);
			toolbarValues9[toolbarValues9.length] = "<mover><mtext focus='true'>...</mtext><mo>&macr;</mo></mover>"; 
			toolbarEquation9[toolbarEquation9.length] = new Accent72(17, 19);
			toolbarValues9[toolbarValues9.length] = "<munder><mtext focus='true'>...</mtext><mo>&UnderBar;</mo></munder>";
			toolbarEquation9[toolbarEquation9.length] = new Accent8(17, 19);
			toolbarValues9[toolbarValues9.length] = "<mover><mtext focus='true'>...</mtext><mo>&hat;</mo></mover>"; 
			toolbarEquation9[toolbarEquation9.length] = new Accent9(17, 19);
			toolbarValues9[toolbarValues9.length] = "<mover><mtext focus='true'>...</mtext><mo>&tilde;</mo></mover>"; 
			toolbarEquation9[toolbarEquation9.length] = new Accent91(17, 19);
			toolbarValues9[toolbarValues9.length] = "<munder><mtext focus='true'>...</mtext><mo>&tilde;</mo></munder>";
			toolbarEquation9[toolbarEquation9.length] = new Accent10(17, 19);
			toolbarValues9[toolbarValues9.length] = "<mover><mtext focus='true'>...</mtext><mo>&rarr;</mo></mover>"; 
			toolbarEquation9[toolbarEquation9.length] = new Accent101(17, 19);
			toolbarValues9[toolbarValues9.length] = "<munder><mtext focus='true'>...</mtext><mo>&rarr;</mo></munder>";
			toolbarEquation9[toolbarEquation9.length] = new Accent11(17, 19);
			toolbarValues9[toolbarValues9.length] = "<mover><mtext focus='true'>...</mtext><mo>&larr;</mo></mover>";
			toolbarEquation9[toolbarEquation9.length] = new Accent111(17, 19);
			toolbarValues9[toolbarValues9.length] = "<munder><mtext focus='true'>...</mtext><mo>&larr;</mo></munder>"; 
			toolbarEquation9[toolbarEquation9.length] = new Accent12(17, 19);
			toolbarValues9[toolbarValues9.length] = "<mover><mtext focus='true'>...</mtext><mo>&harr;</mo></mover>";
			toolbarEquation9[toolbarEquation9.length] = new Accent121(17, 19);
			toolbarValues9[toolbarValues9.length] = "<munder><mtext focus='true'>...</mtext><mo>&harr;</mo></munder>";
			toolbarEquation9[toolbarEquation9.length] = new Accent13(17, 19);
			toolbarValues9[toolbarValues9.length] = "<mover><mtext focus='true'>...</mtext><mo>&rharu;</mo></mover>";
			toolbarEquation9[toolbarEquation9.length] = new Accent14(17, 19);
			toolbarValues9[toolbarValues9.length] = "<mover><mtext focus='true'>...</mtext><mo>&lharu;</mo></mover>";
			toolbarEquation9[toolbarEquation9.length] = new Accent15(17, 19);
			toolbarValues9[toolbarValues9.length] = "<mover><mtext focus='true'>...</mtext><mo>&frown;</mo></mover>";
			toolbarEquation9[toolbarEquation9.length] = new Accent16(17, 19);
			toolbarValues9[toolbarValues9.length] = "<munder><mtext focus='true'>...</mtext><mo>&UnderParenthesis;</mo></munder>";
			toolbarEquation9[toolbarEquation9.length] = new Accent161(17, 19);
			toolbarValues9[toolbarValues9.length] = "<mover><mtext focus='true'>...</mtext><mo>&smile;</mo></mover>"; 
			toolbarEquation9[toolbarEquation9.length] = new Accent17(17, 19);
			toolbarValues9[toolbarValues9.length] = "<mover><mtext focus='true'>...</mtext><mo>&OverBrace;</mo></mover>"; 
			toolbarEquation9[toolbarEquation9.length] = new Accent171(17, 19);
			toolbarValues9[toolbarValues9.length] = "<munder><mtext focus='true'>...</mtext><mo>&UnderBrace;</mo></munder>"; 
			toolbarEquation9[toolbarEquation9.length] = new Accent18(17, 19);
			toolbarValues9[toolbarValues9.length] = "<mover><mtext focus='true'>...</mtext><mo>&OverBracket;</mo></mover>";
			toolbarEquation9[toolbarEquation9.length] = new Accent19(17, 19);
			toolbarValues9[toolbarValues9.length] = "<munder><mtext focus='true'>...</mtext><mo>&UnderBracket;</mo></munder>";

			toolbars["toolbar_Accent"] = toolbarEquation9;
			values["toolbar_Accent"] = toolbarValues9;
		}
		if(toolbars["toolbar_Matrix"]==null){
			var toolbarEquation10:Array = new Array();
			var toolbarValues10:Array = new Array();
			toolbarEquation10[toolbarEquation10.length] = new Matrix1(17, 19);
			toolbarValues10[toolbarValues10.length] = "<mtable><mtr><mtd><mtext focus='true'>...</mtext></mtd><mtd><mtext>...</mtext></mtd></mtr></mtable>"; 
			toolbarEquation10[toolbarEquation10.length] = new Matrix2(17, 19);
			toolbarValues10[toolbarValues10.length] = "<mtable><mtr><mtd><mtext focus='true'>...</mtext></mtd></mtr><mtr><mtd><mtext>...</mtext></mtd></mtr></mtable>"; 
			toolbarEquation10[toolbarEquation10.length] = new Matrix3(17, 19);
			toolbarValues10[toolbarValues10.length] = "<mtable><mtr><mtd><mtext focus='true'>...</mtext></mtd><mtd><mtext>...</mtext></mtd></mtr><mtr><mtd><mtext>...</mtext></mtd><mtd><mtext>...</mtext></mtd></mtr></mtable>"; 
			toolbarEquation10[toolbarEquation10.length] = new Matrix4(17, 19);
			toolbarValues10[toolbarValues10.length] = "<mtable><mtr><mtd><mtext focus='true'>...</mtext></mtd><mtd><mtext>...</mtext></mtd><mtd><mtext>...</mtext></mtd></mtr></mtable>";
			toolbarEquation10[toolbarEquation10.length] = new Matrix5(17, 19);
			toolbarValues10[toolbarValues10.length] = "<mtable><mtr><mtd><mtext focus='true'>...</mtext></mtd></mtr><mtr><mtd><mtext>...</mtext></mtd></mtr><mtr><mtd><mtext>...</mtext></mtd></mtr></mtable>"; 
			toolbarEquation10[toolbarEquation10.length] = new Matrix6(17, 19);
			toolbarValues10[toolbarValues10.length] = "<mtable><mtr><mtd><mtext focus='true'>...</mtext></mtd><mtd><mtext>...</mtext></mtd><mtd><mtext>...</mtext></mtd></mtr><mtr><mtd><mtext>...</mtext></mtd><mtd><mtext>...</mtext></mtd><mtd><mtext>...</mtext></mtd></mtr><mtr><mtd><mtext>...</mtext></mtd><mtd><mtext>...</mtext></mtd><mtd><mtext>...</mtext></mtd></mtr></mtable>"; 

			toolbars["toolbar_Matrix"] = toolbarEquation10;
			values["toolbar_Matrix"] = toolbarValues10;
		}
		if(toolbars["toolbar_CharsL"]==null){
			var toolbarEquation11:Array = new Array();
			var toolbarValues11:Array = new Array();
			toolbarEquation11[toolbarEquation11.length] = new LittleChar1(18, 19);
			toolbarValues11[toolbarValues11.length] = "α";  
			toolbarEquation11[toolbarEquation11.length] = new LittleChar2(18, 19);
			toolbarValues11[toolbarValues11.length] = "β"; 
			toolbarEquation11[toolbarEquation11.length] = new LittleChar3(18, 19);
			toolbarValues11[toolbarValues11.length] = "γ"; 
			toolbarEquation11[toolbarEquation11.length] = new LittleChar4(18, 19);
			toolbarValues11[toolbarValues11.length] = "δ"; 
			toolbarEquation11[toolbarEquation11.length] = new LittleChar5(18, 19);
			toolbarValues11[toolbarValues11.length] = "ε"; 
			toolbarEquation11[toolbarEquation11.length] = new LittleChar6(18, 19);
			toolbarValues11[toolbarValues11.length] = "ζ"; 
			toolbarEquation11[toolbarEquation11.length] = new LittleChar7(18, 19);
			toolbarValues11[toolbarValues11.length] = "η"; 
			toolbarEquation11[toolbarEquation11.length] = new LittleChar8(18, 19);
			toolbarValues11[toolbarValues11.length] = "θ";  
			toolbarEquation11[toolbarEquation11.length] = new LittleChar9(18, 19);
			toolbarValues11[toolbarValues11.length] = "ι"; 
			toolbarEquation11[toolbarEquation11.length] = new LittleChar10(18, 19);
			toolbarValues11[toolbarValues11.length] = "κ"; 
			toolbarEquation11[toolbarEquation11.length] = new LittleChar11(18, 19);
			toolbarValues11[toolbarValues11.length] = "λ"; 
			toolbarEquation11[toolbarEquation11.length] = new LittleChar12(18, 19);
			toolbarValues11[toolbarValues11.length] = "μ"; 
			toolbarEquation11[toolbarEquation11.length] = new LittleChar13(18, 19);
			toolbarValues11[toolbarValues11.length] = "ν"; 
			toolbarEquation11[toolbarEquation11.length] = new LittleChar14(18, 19);
			toolbarValues11[toolbarValues11.length] = "ξ" 
			toolbarEquation11[toolbarEquation11.length] = new LittleChar15(18, 19);
			toolbarValues11[toolbarValues11.length] = "ο"; 
			toolbarEquation11[toolbarEquation11.length] = new LittleChar16(18, 19);
			toolbarValues11[toolbarValues11.length] = "π"; 
			toolbarEquation11[toolbarEquation11.length] = new LittleChar17(18, 19);
			toolbarValues11[toolbarValues11.length] = "ρ";  
			toolbarEquation11[toolbarEquation11.length] = new LittleChar18(18, 19);
			toolbarValues11[toolbarValues11.length] = "ς"; 
			toolbarEquation11[toolbarEquation11.length] = new LittleChar19(18, 19);
			toolbarValues11[toolbarValues11.length] = "σ";  
			toolbarEquation11[toolbarEquation11.length] = new LittleChar20(18, 19);
			toolbarValues11[toolbarValues11.length] = "τ";
			toolbarEquation11[toolbarEquation11.length] = new LittleChar21(18, 19);
			toolbarValues11[toolbarValues11.length] = "υ";  
			toolbarEquation11[toolbarEquation11.length] = new LittleChar22(18, 19);
			toolbarValues11[toolbarValues11.length] = "φ";
			toolbarEquation11[toolbarEquation11.length] = new LittleChar23(18, 19);
			toolbarValues11[toolbarValues11.length] = "χ";
			toolbarEquation11[toolbarEquation11.length] = new LittleChar24(18, 19);
			toolbarValues11[toolbarValues11.length] = "ψ"; 
			toolbarEquation11[toolbarEquation11.length] = new LittleChar25(18, 19);
			toolbarValues11[toolbarValues11.length] = "ω"; 

			toolbars["toolbar_CharsL"] = toolbarEquation11;
			values["toolbar_CharsL"] = toolbarValues11;
		}
		if(toolbars["toolbar_CharsB"]==null){
			var toolbarEquation12:Array = new Array();
			var toolbarValues12:Array = new Array();
			toolbarEquation12[toolbarEquation12.length] = new BigChar1(19, 19);
			toolbarValues12[toolbarValues12.length] = "Α";  
			toolbarEquation12[toolbarEquation12.length] = new BigChar2(19, 19);
			toolbarValues12[toolbarValues12.length] = "Β"; 
			toolbarEquation12[toolbarEquation12.length] = new BigChar3(19, 19);
			toolbarValues12[toolbarValues12.length] = "Γ"; 
			toolbarEquation12[toolbarEquation12.length] = new BigChar4(19, 19);
			toolbarValues12[toolbarValues12.length] = "Δ";   
			toolbarEquation12[toolbarEquation12.length] = new BigChar5(19, 19);
			toolbarValues12[toolbarValues12.length] = "Ε";  
			toolbarEquation12[toolbarEquation12.length] = new BigChar6(19, 19);
			toolbarValues12[toolbarValues12.length] = "Ζ";  
			toolbarEquation12[toolbarEquation12.length] = new BigChar7(19, 19);
			toolbarValues12[toolbarValues12.length] = "Η";   
			toolbarEquation12[toolbarEquation12.length] = new BigChar8(19, 19);
			toolbarValues12[toolbarValues12.length] = "Θ";  
			toolbarEquation12[toolbarEquation12.length] = new BigChar9(19, 19);
			toolbarValues12[toolbarValues12.length] = "Ι"; 
			toolbarEquation12[toolbarEquation12.length] = new BigChar10(19, 19);
			toolbarValues12[toolbarValues12.length] = "Κ";  
			toolbarEquation12[toolbarEquation12.length] = new BigChar11(19, 19);
			toolbarValues12[toolbarValues12.length] = "Λ";
			toolbarEquation12[toolbarEquation12.length] = new BigChar12(19, 19);
			toolbarValues12[toolbarValues12.length] = "Μ"; 
			toolbarEquation12[toolbarEquation12.length] = new BigChar13(19, 19);
			toolbarValues12[toolbarValues12.length] = "Ν";  
			toolbarEquation12[toolbarEquation12.length] = new BigChar14(19, 19);
			toolbarValues12[toolbarValues12.length] = "Ξ";
			toolbarEquation12[toolbarEquation12.length] = new BigChar15(19, 19);
			toolbarValues12[toolbarValues12.length] = "Ο";  
			toolbarEquation12[toolbarEquation12.length] = new BigChar16(19, 19);
			toolbarValues12[toolbarValues12.length] = "Π"; 
			toolbarEquation12[toolbarEquation12.length] = new BigChar17(19, 19);
			toolbarValues12[toolbarValues12.length] = "Ρ"; 
			toolbarEquation12[toolbarEquation12.length] = new BigChar18(19, 19);
			toolbarValues12[toolbarValues12.length] = "Σ"; 
			toolbarEquation12[toolbarEquation12.length] = new BigChar19(19, 19);
			toolbarValues12[toolbarValues12.length] = "Τ";
			toolbarEquation12[toolbarEquation12.length] = new BigChar20(19, 19);
			toolbarValues12[toolbarValues12.length] = "Υ";  
			toolbarEquation12[toolbarEquation12.length] = new BigChar21(19, 19);
			toolbarValues12[toolbarValues12.length] = "Φ";  
			toolbarEquation12[toolbarEquation12.length] = new BigChar22(19, 19);
			toolbarValues12[toolbarValues12.length] = "Χ";  
			toolbarEquation12[toolbarEquation12.length] = new BigChar23(19, 19);
			toolbarValues12[toolbarValues12.length] = "Ψ"; 
			toolbarEquation12[toolbarEquation12.length] = new BigChar24(19, 19);
			toolbarValues12[toolbarValues12.length] = "Ω";   

			toolbars["toolbar_CharsB"] = toolbarEquation12;
			values["toolbar_CharsB"] = toolbarValues12;
		}
		
		
	}


}

}