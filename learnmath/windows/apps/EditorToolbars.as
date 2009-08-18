package learnmath.windows.apps{
/*-------------------------------------------------------------
	Created by: Ionel Alexandru 
	Mail: ionel.alexandru@gmail.com
	Site: www.learn-math.info
---------------------------------------------------------------*/
import learnmath.windows.menu.*;
import learnmath.windows.elements.buttons.*;
import learnmath.mathml.formula.*;

public class EditorToolbars extends Toolbars{

	public override function init():void{
		var style:Style = new Style();
		style.font = "times";
		style.size = 8;
		style.color = "#252525"		
		var styleN:Style = new Style();
		styleN.font = "times";
		styleN.size = 8;
		styleN.color = "#000000"				
			
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
			toolbarEquation1[toolbarEquation1.length] = new Equation40(17, 19);
			toolbarValues1[toolbarValues1.length] = "<mrow><mo>&mid;</mo><mtext  focus='true'>...</mtext></mrow>"; 
			toolbarEquation1[toolbarEquation1.length] = new Equation41(17, 19);
			toolbarValues1[toolbarValues1.length] = "<mrow><mo>&par;</mo><mtext  focus='true'>...</mtext></mrow>"; 
			toolbarEquation1[toolbarEquation1.length] = new Equation42(17, 19);
			toolbarValues1[toolbarValues1.length] = "<mrow><mo>&brvbar;</mo><mtext  focus='true'>...</mtext></mrow>"; 
			
			addToToolbars("0x0021", "0x0021", toolbarEquation1, toolbarValues1, styleN, "mo");
			addToToolbars("0x0023", "0x0026", toolbarEquation1, toolbarValues1, styleN, "mo");
			addToToolbars("0x005e", "0x005e", toolbarEquation1, toolbarValues1, styleN, "mo");
			addToToolbars("0x00a1", "0x00a5", toolbarEquation1, toolbarValues1, styleN, "mo");			
			addToToolbars("0x00a7", "0x00a7", toolbarEquation1, toolbarValues1, styleN, "mo");			
			addToToolbars("0x00bc", "0x00bf", toolbarEquation1, toolbarValues1, styleN, "mo");			
			addToToolbars("0x00D8", "0x00D8", toolbarEquation1, toolbarValues1, styleN, "mo");			
			addToToolbars("0x00F8", "0x00F8", toolbarEquation1, toolbarValues1, styleN, "mo");						
			addToToolbars("0x2200", "0x2200", toolbarEquation1, toolbarValues1, styleN, "mo");						
			addToToolbars("0x2202", "0x2203", toolbarEquation1, toolbarValues1, styleN, "mo");						
			addToToolbars("0x2206", "0x2208", toolbarEquation1, toolbarValues1, styleN, "mo");						
			addToToolbars("0x220b", "0x220b", toolbarEquation1, toolbarValues1, styleN, "mo");									
			addToToolbars("0x221d", "0x221e", toolbarEquation1, toolbarValues1, styleN, "mo");									
			addToToolbars("0x221f", "0x2220", toolbarEquation1, toolbarValues1, styleN, "mo");												
			addToToolbars("0x2227", "0x2228", toolbarEquation1, toolbarValues1, styleN, "mo");												
			addToToolbars("0x22a5", "0x22a5", toolbarEquation1, toolbarValues1, styleN, "mo");															
			addToToolbars("0x22bf", "0x22bf", toolbarEquation1, toolbarValues1, styleN, "mo");															

			
			toolbarValues1[toolbarValues1.length] = "<mrow><msub><mi>x</mi><mtext>12</mtext></msub><mo>=</mo><mfrac linethickness='1'><mrow><mo>-</mo><mi>b</mi><mo>&plusmn;</mo><msqrt linethickness='1'><msup><mi>b</mi><mn>2</mn></msup><mo>-</mo><mn>4</mn><mi>a</mi><mi>c</mi></msqrt></mrow><mrow><mn>2</mn><mi>a</mi></mrow></mfrac></mrow>";  
			toolbarEquation1[toolbarEquation1.length] = new ButtonMathML("<mrow><msub><mi>x</mi><mtext>12</mtext></msub><mo>=</mo><mfrac linethickness='1'><mrow><mo>-</mo><mi>b</mi><mo>&plusmn;</mo><msqrt linethickness='1'><msup><mi>b</mi><mn>2</mn></msup><mo>-</mo><mn>4</mn><mi>a</mi><mi>c</mi></msqrt></mrow><mrow><mn>2</mn><mi>a</mi></mrow></mfrac></mrow>", style, 166, 50);									
			
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
			toolbarEquation2[toolbarEquation2.length] = new Equation15(17, 19);
			toolbarValues2[toolbarValues2.length] = "<mrow><mo>&equals;</mo><mtext  focus='true'>...</mtext></mrow>"; 
			toolbarEquation2[toolbarEquation2.length] = new Equation16(17, 19);
			toolbarValues2[toolbarValues2.length] = "<mrow><mo>&ne;</mo><mtext  focus='true'>...</mtext></mrow>"; 
			toolbarEquation2[toolbarEquation2.length] = new Equation17(17, 19);
			toolbarValues2[toolbarValues2.length] = "<mrow><mo>&equiv;</mo><mtext  focus='true'>...</mtext></mrow>";
			toolbarEquation2[toolbarEquation2.length] = new Equation20(17, 19);
			toolbarValues2[toolbarValues2.length] = "<mrow><mo>&ratio;</mo><mtext  focus='true'>...</mtext></mrow>"; 
			toolbarEquation2[toolbarEquation2.length] = new Equation21(17, 19);
			toolbarValues2[toolbarValues2.length] = "<mrow><mo>&Proportion;</mo><mtext  focus='true'>...</mtext></mrow>"; 
			
			addToToolbars("0x2234", "0x2235", toolbarEquation2, toolbarValues2, styleN, "mo");															
			
			toolbarEquation2[toolbarEquation2.length] = new Equation25(17, 19);
			toolbarValues2[toolbarValues2.length] = "<mrow><mo>&efDot;</mo><mtext  focus='true'>...</mtext></mrow>"; 
			
			
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

			toolbarValues3[toolbarValues3.length] = "<msqrt linethickness='1'><msup><mi>b</mi><mn>2</mn></msup><mo>-</mo><mn>4</mn><mi>a</mi><mi>c</mi></msqrt>";  
			toolbarEquation3[toolbarEquation3.length] = new ButtonMathML("<msqrt linethickness='1'><msup><mi>b</mi><mn>2</mn></msup><mo>-</mo><mn>4</mn><mi>a</mi><mi>c</mi></msqrt>", style, 100, 25);									
			
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

			toolbarValues4[toolbarValues4.length] = "<mrow><msup><mi focus='true'>x</mi><mn>2</mn></msup><mo>+</mo><mn>2</mn><mi>x</mi><mo>+</mo><mn>1</mn><mo>=</mo><mn>0</mn></mrow>";  
			toolbarEquation4[toolbarEquation4.length] = new ButtonMathML("<mrow><msup><mi>x</mi><mn>2</mn></msup><mo>+</mo><mn>2</mn><mi>x</mi><mo>+</mo><mn>1</mn><mo>=</mo><mn>0</mn></mrow>", style, 124, 25);									
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

			toolbarValues5[toolbarValues5.length] = "<mrow><mtext mathsize='12'>f</mtext><mfenced><mi focus='true'>x</mi></mfenced><mo>=</mo><mfenced open='{' close=''><mtable columnalign='left'><mtr><mtd><mn>-x</mn></mtd><mtd columnalign='right'><mspace width='10'/><mi>x</mi><mo>&lt;</mo><mn>0</mn></mtd></mtr><mtr><mtd><mn>x</mn></mtd><mtd columnalign='right'><mspace width='10'/><mi>x</mi><mo>&ge;</mo><mn>0</mn></mtd></mtr></mtable></mfenced></mrow>";  
			toolbarEquation5[toolbarEquation5.length] = new ButtonMathML("<mrow><mtext mathsize='12'>f</mtext><mfenced><mi>x</mi></mfenced><mo>=</mo><mfenced open='{' close=''><mtable columnalign='left'><mtr><mtd><mn>-x</mn></mtd><mtd columnalign='right'><mspace width='10'/><mi>x</mi><mo>&lt;</mo><mn>0</mn></mtd></mtr><mtr><mtd><mn>x</mn></mtd><mtd columnalign='right'><mspace width='10'/><mi>x</mi><mo>&ge;</mo><mn>0</mn></mtd></mtr></mtable></mfenced></mrow>", style, 164, 56);			
			
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


		if(toolbars["toolbar_trigo_sin"]==null){
			var toolbarEquation13:Array = new Array();
			var toolbarValues13:Array = new Array();
			
	 
			toolbarValues13[toolbarValues13.length] = "<mrow><mo>sin </mo><mi>θ</mi><mtext focus='true'>...</mtext></mrow>";  
			toolbarEquation13[toolbarEquation13.length] = new ButtonMathML("<mrow><mo>sin </mo><mi>θ</mi></mrow>", style, 39, 19);
			toolbarValues13[toolbarValues13.length] = "<mrow><mo>cos </mo><mi>θ</mi><mtext focus='true'>...</mtext></mrow>";  
			toolbarEquation13[toolbarEquation13.length] = new ButtonMathML("<mrow><mo>cos </mo><mi>θ</mi></mrow>", style, 39, 19);			
			toolbarValues13[toolbarValues13.length] = "<mrow><mo>tan </mo><mi>θ</mi><mtext focus='true'>...</mtext></mrow>";  
			toolbarEquation13[toolbarEquation13.length] = new ButtonMathML("<mrow><mo>tan </mo><mi>θ</mi></mrow>", style, 39, 19);			
			toolbarValues13[toolbarValues13.length] = "<mrow><mo>csc </mo><mi>θ</mi><mtext focus='true'>...</mtext></mrow>";  
			toolbarEquation13[toolbarEquation13.length] = new ButtonMathML("<mrow><mo>csc </mo><mi>θ</mi></mrow>", style, 39, 19);			
			toolbarValues13[toolbarValues13.length] = "<mrow><mo>sec </mo><mi>θ</mi><mtext focus='true'>...</mtext></mrow>";  
			toolbarEquation13[toolbarEquation13.length] = new ButtonMathML("<mrow><mo>sec </mo><mi>θ</mi></mrow>", style, 39, 19);			
			toolbarValues13[toolbarValues13.length] = "<mrow><mo>cot </mo><mi>θ</mi><mtext focus='true'>...</mtext></mrow>";  
			toolbarEquation13[toolbarEquation13.length] = new ButtonMathML("<mrow><mo>cot </mo><mi>θ</mi></mrow>", style, 39, 19);			
			toolbarValues13[toolbarValues13.length] = "<mrow><mo>tg </mo><mi>θ</mi><mtext focus='true'>...</mtext></mrow>";  
			toolbarEquation13[toolbarEquation13.length] = new ButtonMathML("<mrow><mo>tg </mo><mi>θ</mi></mrow>", style, 39, 19);			
			toolbarValues13[toolbarValues13.length] = "<mrow><mo>ctg </mo><mi>θ</mi><mtext focus='true'>...</mtext></mrow>";  
			toolbarEquation13[toolbarEquation13.length] = new ButtonMathML("<mrow><mo>ctg </mo><mi>θ</mi></mrow>", style, 39, 19);			
			
			toolbarValues13[toolbarValues13.length] = "<mrow><msup><mo>sin</mo><mn>2</mn></msup><mi>θ</mi><mo>+</mo><msup><mo>cos</mo><mn>2</mn></msup><mi>θ</mi><mo>=</mo><mn>1</mn></mrow>";  
			toolbarEquation13[toolbarEquation13.length] = new ButtonMathML("<mrow><msup><mo>sin</mo><mn>2</mn></msup><mi>θ</mi><mo>+</mo><msup><mo>cos</mo><mn>2</mn></msup><mi>θ</mi><mo>=</mo><mn>1</mn></mrow>", style, 162, 25);			
			
			toolbarValues13[toolbarValues13.length] = "<mrow><mo>sin</mo><mi>θ</mi><mo>=</mo><mo>sin</mo><mfenced><mi>θ</mi><mo>+</mo><mn>2</mn><mn>k</mn><mn>π</mn></mfenced></mrow>";  
			toolbarEquation13[toolbarEquation13.length] = new ButtonMathML("<mrow><mo>sin </mo><mi>θ</mi><mo>=</mo><mo>sin</mo><mfenced><mi>θ</mi><mo>+</mo><mn>2</mn><mn>k</mn><mn>π</mn></mfenced></mrow>", style, 162, 25);						
			
			toolbarValues13[toolbarValues13.length] = "<mrow><mo>sin</mo><mi>2θ</mi><mo>=</mo><mn>2</mn><mo>sin</mo><mi>θ</mi><mo>cos</mo><mi>θ</mi></mrow>";  
			toolbarEquation13[toolbarEquation13.length] = new ButtonMathML("<mrow><mo>sin</mo><mi>2θ</mi><mo>=</mo><mn>2</mn><mo>sin</mo><mi>θ</mi><mo>cos</mo><mi>θ</mi></mrow>", style, 162, 25);						
			
			toolbarValues13[toolbarValues13.length] = "<mrow><mo>cos</mo><mi>2θ</mi><mo>=</mo><msup><mo>cos</mo><mn>2</mn></msup><mi>θ</mi><mo>-</mo><msup><mo>sin</mo><mn>2</mn></msup><mi>θ</mi></mrow>";  
			toolbarEquation13[toolbarEquation13.length] = new ButtonMathML("<mrow><mo>cos</mo><mi>2θ</mi><mo>=</mo><msup><mo>cos</mo><mn>2</mn></msup><mi>θ</mi><mo>-</mo><msup><mo>sin</mo><mn>2</mn></msup><mi>θ</mi></mrow>", style, 162, 25);									
			toolbars["toolbar_trigo_sin"] = toolbarEquation13;
			values["toolbar_trigo_sin"] = toolbarValues13;
		}			
		if(toolbars["toolbar_trigo_arcsin"]==null){
			var toolbarEquation14:Array = new Array();
			var toolbarValues14:Array = new Array();
						
			
			toolbarValues14[toolbarValues14.length] = "<mrow><mo>arcsin </mo><mi>θ</mi><mtext focus='true'>...</mtext></mrow>";  
			toolbarEquation14[toolbarEquation14.length] = new ButtonMathML("<mrow><mo>arcsin </mo><mi>θ</mi></mrow>", style, 65, 19);
			toolbarValues14[toolbarValues14.length] = "<mrow><mo>arccos </mo><mi>θ</mi><mtext focus='true'>...</mtext></mrow>";  
			toolbarEquation14[toolbarEquation14.length] = new ButtonMathML("<mrow><mo>arccos </mo><mi>θ</mi></mrow>", style, 65, 19);			
			toolbarValues14[toolbarValues14.length] = "<mrow><mo>arctan </mo><mi>θ</mi><mtext focus='true'>...</mtext></mrow>";  
			toolbarEquation14[toolbarEquation14.length] = new ButtonMathML("<mrow><mo>arctan </mo><mi>θ</mi></mrow>", style, 65, 19);			
			toolbarValues14[toolbarValues14.length] = "<mrow><mo>arccsc </mo><mi>θ</mi><mtext focus='true'>...</mtext></mrow>";  
			toolbarEquation14[toolbarEquation14.length] = new ButtonMathML("<mrow><mo>arccsc </mo><mi>θ</mi></mrow>", style, 65, 19);			
			toolbarValues14[toolbarValues14.length] = "<mrow><mo>arcsec </mo><mi>θ</mi><mtext focus='true'>...</mtext></mrow>";  
			toolbarEquation14[toolbarEquation14.length] = new ButtonMathML("<mrow><mo>arcsec </mo><mi>θ</mi></mrow>", style, 65, 19);			
			toolbarValues14[toolbarValues14.length] = "<mrow><mo>arccot </mo><mi>θ</mi><mtext focus='true'>...</mtext></mrow>";  
			toolbarEquation14[toolbarEquation14.length] = new ButtonMathML("<mrow><mo>arccot </mo><mi>θ</mi></mrow>", style, 65, 19);			
			toolbarValues14[toolbarValues14.length] = "<mrow><mo>arctg </mo><mi>θ</mi><mtext focus='true'>...</mtext></mrow>";  
			toolbarEquation14[toolbarEquation14.length] = new ButtonMathML("<mrow><mo>arctg </mo><mi>θ</mi></mrow>", style, 65, 19);			
			toolbarValues14[toolbarValues14.length] = "<mrow><mo>arcctg </mo><mi>θ</mi><mtext focus='true'>...</mtext></mrow>";  
			toolbarEquation14[toolbarEquation14.length] = new ButtonMathML("<mrow><mo>arcctg </mo><mi>θ</mi></mrow>", style, 65, 19);			

			toolbarValues14[toolbarValues14.length] = "<mrow><mo>arccos</mo><mi>θ</mi><mo>=</mo><mfrac><mn>π</mn><mn>2</mn></mfrac><mo>+</mo><mo>arcsin</mo><mi>θ</mi></mrow>";  
			toolbarEquation14[toolbarEquation14.length] = new ButtonMathML("<mrow><mo>arccos</mo><mi>θ</mi><mo>=</mo><mfrac><mn>π</mn><mn>2</mn></mfrac><mo>+</mo><mo>arcsin</mo><mi>θ</mi></mrow>", style, 132, 35);									
					
			
			toolbars["toolbar_trigo_arcsin"] = toolbarEquation14;
			values["toolbar_trigo_arcsin"] = toolbarValues14;
		}
		if(toolbars["toolbar_trigo_sin1"]==null){
			var toolbarEquation15:Array = new Array();
			var toolbarValues15:Array = new Array();
			
	 
			toolbarValues15[toolbarValues15.length] = "<mrow><msup><mo>sin</mo><mn>-1</mn></msup><mi>θ</mi><mtext focus='true'>...</mtext></mrow>";  
			toolbarEquation15[toolbarEquation15.length] = new ButtonMathML("<mrow><msup><mo>sin</mo><mn>-1</mn></msup><mi>θ</mi></mrow>", style, 54, 19);
			toolbarValues15[toolbarValues15.length] = "<mrow><msup><mo>cos</mo><mn>-1</mn></msup><mi>θ</mi><mtext focus='true'>...</mtext></mrow>";  
			toolbarEquation15[toolbarEquation15.length] = new ButtonMathML("<mrow><msup><mo>cos</mo><mn>-1</mn></msup><mi>θ</mi></mrow>", style, 54, 19);			
			toolbarValues15[toolbarValues15.length] = "<mrow><msup><mo>tan</mo><mn>-1</mn></msup><mi>θ</mi><mtext focus='true'>...</mtext></mrow>";  
			toolbarEquation15[toolbarEquation15.length] = new ButtonMathML("<mrow><msup><mo>tan</mo><mn>-1</mn></msup><mi>θ</mi></mrow>", style, 54, 19);			
			toolbarValues15[toolbarValues15.length] = "<mrow><msup><mo>csc</mo><mn>-1</mn></msup><mi>θ</mi><mtext focus='true'>...</mtext></mrow>";  
			toolbarEquation15[toolbarEquation15.length] = new ButtonMathML("<mrow><msup><mo>csc</mo><mn>-1</mn></msup><mi>θ</mi></mrow>", style, 54, 19);			
			toolbarValues15[toolbarValues15.length] = "<mrow><msup><mo>sec</mo><mn>-1</mn></msup><mi>θ</mi><mtext focus='true'>...</mtext></mrow>";  
			toolbarEquation15[toolbarEquation15.length] = new ButtonMathML("<mrow><msup><mo>sec</mo><mn>-1</mn></msup><mi>θ</mi></mrow>", style, 54, 19);			
			toolbarValues15[toolbarValues15.length] = "<mrow><msup><mo>cot</mo><mn>-1</mn></msup><mi>θ</mi><mtext focus='true'>...</mtext></mrow>";  
			toolbarEquation15[toolbarEquation15.length] = new ButtonMathML("<mrow><msup><mo>cot</mo><mn>-1</mn></msup><mi>θ</mi></mrow>", style, 54, 19);						
			toolbarValues15[toolbarValues15.length] = "<mrow><msup><mo>tg</mo><mn>-1</mn></msup><mi>θ</mi><mtext focus='true'>...</mtext></mrow>";  
			toolbarEquation15[toolbarEquation15.length] = new ButtonMathML("<mrow><msup><mo>tg</mo><mn>-1</mn></msup><mi>θ</mi></mrow>", style, 54, 19);			
			toolbarValues15[toolbarValues15.length] = "<mrow><msup><mo>ctg</mo><mn>-1</mn></msup><mi>θ</mi><mtext focus='true'>...</mtext></mrow>";  
			toolbarEquation15[toolbarEquation15.length] = new ButtonMathML("<mrow><msup><mo>ctg</mo><mn>-1</mn></msup><mi>θ</mi></mrow>", style, 54, 19);						
			
			toolbarValues15[toolbarValues15.length] = "<mrow><msup><mo>sin</mo><mn>-1</mn></msup><mi>θ</mi><mo>=</mo><mn>2</mn><msup><mo>tan</mo><mn>-1</mn></msup><mfrac  linethickness='1'><mi>θ</mi><mrow><mn>1</mn><mo>+</mo><msqrt linethickness='1'><mn>1</mn><mo>-</mo><msup><mi>θ</mi><mn>2</mn></msup></msqrt></mrow></mfrac></mrow>";  
			toolbarEquation15[toolbarEquation15.length] = new ButtonMathML("<mrow><msup><mo>sin</mo><mn>-1</mn></msup><mi>θ</mi><mo>=</mo><mn>2</mn><msup><mo>tan</mo><mn>-1</mn></msup><mfrac  linethickness='1'><mi>θ</mi><mrow><mn>1</mn><mo>+</mo><msqrt linethickness='1'><mn>1</mn><mo>-</mo><msup><mi>θ</mi><mn>2</mn></msup></msqrt></mrow></mfrac></mrow>", style, 166, 48);												
			
			toolbars["toolbar_trigo_sin1"] = toolbarEquation15;
			values["toolbar_trigo_sin1"] = toolbarValues15;
		}
		if(toolbars["toolbar_trigo_sinh"]==null){
			var toolbarEquation16:Array = new Array();
			var toolbarValues16:Array = new Array();
			
	 
			toolbarValues16[toolbarValues16.length] = "<mrow><mo>sinh</mo><mi>θ</mi><mtext focus='true'>...</mtext></mrow>";  
			toolbarEquation16[toolbarEquation16.length] = new ButtonMathML("<mrow><mo>sinh</mo><mi>θ</mi></mrow>", style, 65, 19);
			toolbarValues16[toolbarValues16.length] = "<mrow><mo>cosh</mo><mi>θ</mi><mtext focus='true'>...</mtext></mrow>";  
			toolbarEquation16[toolbarEquation16.length] = new ButtonMathML("<mrow><mo>cosh</mo><mi>θ</mi></mrow>", style, 65, 19);			
			toolbarValues16[toolbarValues16.length] = "<mrow><mo>tanh</mo><mi>θ</mi><mtext focus='true'>...</mtext></mrow>";  
			toolbarEquation16[toolbarEquation16.length] = new ButtonMathML("<mrow><mo>tanh</mo><mi>θ</mi></mrow>", style, 65, 19);			
			toolbarValues16[toolbarValues16.length] = "<mrow><mo>csch</mo><mi>θ</mi><mtext focus='true'>...</mtext></mrow>";  
			toolbarEquation16[toolbarEquation16.length] = new ButtonMathML("<mrow><mo>csch</mo><mi>θ</mi></mrow>", style, 65, 19);			
			toolbarValues16[toolbarValues16.length] = "<mrow><mo>sech</mo><mi>θ</mi><mtext focus='true'>...</mtext></mrow>";  
			toolbarEquation16[toolbarEquation16.length] = new ButtonMathML("<mrow><mo>sech</mo><mi>θ</mi></mrow>", style, 65, 19);			
			toolbarValues16[toolbarValues16.length] = "<mrow><mo>coth</mo><mi>θ</mi><mtext focus='true'>...</mtext></mrow>";  
			toolbarEquation16[toolbarEquation16.length] = new ButtonMathML("<mrow><mo>coth</mo><mi>θ</mi></mrow>", style, 65, 19);			
			
			toolbarValues16[toolbarValues16.length] = "<mrow><msup><mo>cosh</mo><mn>2</mn></msup><mi>θ</mi><mo>-</mo><msup><mo>sinh</mo><mn>2</mn></msup><mi>θ</mi><mo>=</mo><mn>1</mn></mrow>";  
			toolbarEquation16[toolbarEquation16.length] = new ButtonMathML("<mrow><msup><mo>cosh</mo><mn>2</mn></msup><mi>θ</mi><mo>-</mo><msup><mo>sinh</mo><mn>2</mn></msup><mi>θ</mi><mo>=</mo><mn>1</mn></mrow>", style, 132, 25);			

			toolbarValues16[toolbarValues16.length] = "<mrow><mo>sinh</mo><mi>θ</mi><mo>=</mo><mfrac linethickness='1'><mrow><msup><mn>e</mn><mi>x</mi></msup><mo>-</mo><msup><mn>e</mn><mi>-x</mi></msup></mrow><mn>2</mn></mfrac></mrow>";  
			toolbarEquation16[toolbarEquation16.length] = new ButtonMathML("<mrow><mo>sinh</mo><mi>θ</mi><mo>=</mo><mfrac linethickness='1'><mrow><msup><mn>e</mn><mi>x</mi></msup><mo>-</mo><msup><mn>e</mn><mi>-x</mi></msup></mrow><mn>2</mn></mfrac></mrow>", style, 132, 38);															
			
			toolbars["toolbar_trigo_sinh"] = toolbarEquation16;
			values["toolbar_trigo_sinh"] = toolbarValues16;
		}								
		
		if(toolbars["toolbar_trigo_arsinh"]==null){
			var toolbarEquation18:Array = new Array();
			var toolbarValues18:Array = new Array();
						
			
			toolbarValues18[toolbarValues18.length] = "<mrow><mo>arcsinh</mo><mi>θ</mi><mtext focus='true'>...</mtext></mrow>";  
			toolbarEquation18[toolbarEquation18.length] = new ButtonMathML("<mrow><mo>arcsinh</mo><mi>θ</mi></mrow>", style, 78, 19);
			toolbarValues18[toolbarValues18.length] = "<mrow><mo>arccosh</mo><mi>θ</mi><mtext focus='true'>...</mtext></mrow>";  
			toolbarEquation18[toolbarEquation18.length] = new ButtonMathML("<mrow><mo>arccosh</mo><mi>θ</mi></mrow>", style, 78, 19);			
			toolbarValues18[toolbarValues18.length] = "<mrow><mo>arctanh</mo><mi>θ</mi><mtext focus='true'>...</mtext></mrow>";  
			toolbarEquation18[toolbarEquation18.length] = new ButtonMathML("<mrow><mo>arctanh</mo><mi>θ</mi></mrow>", style, 78, 19);			
			toolbarValues18[toolbarValues18.length] = "<mrow><mo>arccsch</mo><mi>θ</mi><mtext focus='true'>...</mtext></mrow>";  
			toolbarEquation18[toolbarEquation18.length] = new ButtonMathML("<mrow><mo>arccsch</mo><mi>θ</mi></mrow>", style, 78, 19);			
			toolbarValues18[toolbarValues18.length] = "<mrow><mo>arcsech</mo><mi>θ</mi><mtext focus='true'>...</mtext></mrow>";  
			toolbarEquation18[toolbarEquation18.length] = new ButtonMathML("<mrow><mo>arcsech</mo><mi>θ</mi></mrow>", style, 78, 19);			
			toolbarValues18[toolbarValues18.length] = "<mrow><mo>arccoth</mo><mi>θ</mi><mtext focus='true'>...</mtext></mrow>";  
			toolbarEquation18[toolbarEquation18.length] = new ButtonMathML("<mrow><mo>arccoth</mo><mi>θ</mi></mrow>", style, 78, 19);			

			toolbarValues18[toolbarValues18.length] = "<mrow><mo>arccosh</mo><mi>θ</mi><mo>=</mo><mo>ln</mo><mfenced><mi>θ</mi><mo>+</mo><msqrt linethickness='1'><msup><mi>θ</mi><mn>2</mn></msup><mo>+</mo><mn>1</mn></msqrt></mfenced></mrow>";  
			toolbarEquation18[toolbarEquation18.length] = new ButtonMathML("<mrow><mo>arccosh</mo><mi>θ</mi><mo>=</mo><mo>ln</mo><mfenced><mi>θ</mi><mo>+</mo><msqrt linethickness='1'><msup><mi>θ</mi><mn>2</mn></msup><mo>+</mo><mn>1</mn></msqrt></mfenced></mrow>", style, 158, 34);									
								
			toolbars["toolbar_trigo_arsinh"] = toolbarEquation18;
			values["toolbar_trigo_arsinh"] = toolbarValues18;
		}		
		
		if(toolbars["toolbar_trigo_sinh1"]==null){
			var toolbarEquation17:Array = new Array();
			var toolbarValues17:Array = new Array();
			
	 
			toolbarValues17[toolbarValues17.length] = "<mrow><msup><mo>sinh</mo><mn>-1</mn></msup><mi>θ</mi><mtext focus='true'>...</mtext></mrow>";  
			toolbarEquation17[toolbarEquation17.length] = new ButtonMathML("<mrow><msup><mo>sinh</mo><mn>-1</mn></msup><mi>θ</mi></mrow>", style, 65, 19);
			toolbarValues17[toolbarValues17.length] = "<mrow><msup><mo>cosh</mo><mn>-1</mn></msup><mi>θ</mi><mtext focus='true'>...</mtext></mrow>";  
			toolbarEquation17[toolbarEquation17.length] = new ButtonMathML("<mrow><msup><mo>cosh</mo><mn>-1</mn></msup><mi>θ</mi></mrow>", style, 65, 19);			
			toolbarValues17[toolbarValues17.length] = "<mrow><msup><mo>tanh</mo><mn>-1</mn></msup><mi>θ</mi><mtext focus='true'>...</mtext></mrow>";  
			toolbarEquation17[toolbarEquation17.length] = new ButtonMathML("<mrow><msup><mo>tanh</mo><mn>-1</mn></msup><mi>θ</mi></mrow>", style, 65, 19);			
			toolbarValues17[toolbarValues17.length] = "<mrow><msup><mo>csch</mo><mn>-1</mn></msup><mi>θ</mi><mtext focus='true'>...</mtext></mrow>";  
			toolbarEquation17[toolbarEquation17.length] = new ButtonMathML("<mrow><msup><mo>csch</mo><mn>-1</mn></msup><mi>θ</mi></mrow>", style, 65, 19);			
			toolbarValues17[toolbarValues17.length] = "<mrow><msup><mo>sech</mo><mn>-1</mn></msup><mi>θ</mi><mtext focus='true'>...</mtext></mrow>";  
			toolbarEquation17[toolbarEquation17.length] = new ButtonMathML("<mrow><msup><mo>sech</mo><mn>-1</mn></msup><mi>θ</mi></mrow>", style, 65, 19);			
			toolbarValues17[toolbarValues17.length] = "<mrow><msup><mo>coth</mo><mn>-1</mn></msup><mi>θ</mi><mtext focus='true'>...</mtext></mrow>";  
			toolbarEquation17[toolbarEquation17.length] = new ButtonMathML("<mrow><msup><mo>coth</mo><mn>-1</mn></msup><mi>θ</mi></mrow>", style, 65, 19);						

			//toolbarValues17[toolbarValues17.length] = "<mrow><msup><mo>sinh</mo><mn>-1</mn></msup><mo>=</mo><munderover><mo>&sum;</mo><mrow><mi>k</mi><mo>=</mo><mn>1</mn></mrow><mo>&infinity;</mo></munderover></mrow>";  
			//toolbarEquation17[toolbarEquation17.length] = new ButtonMathML("<mrow><msup><mo>sinh</mo><mn>-1</mn></msup><mo>=</mo><munderover><mo>&sum;</mo><mrow><mi>k</mi><mo>=</mo><mn>1</mn></mrow><mo>&infinity;</mo></munderover></mrow>", style, 132, 36);									
											
			toolbars["toolbar_trigo_sinh1"] = toolbarEquation17;
			values["toolbar_trigo_sinh1"] = toolbarValues17;
		}		

		createToolbar("toolbar_CharsL", "0x0391", "0x03A1", styleN, "mtext");
		addToToolbarsName("toolbar_CharsL", "0x03A3", "0x03CE", styleN, "mtext");		
		
		createToolbar("toolbar_charset3", "0x0100", "0x013f", style, "mtext");		
		createToolbar("toolbar_charset31", "0x0140", "0x017f", style, "mtext");		
		createToolbar("toolbar_charset4", "0x0180", "0x01bf", style, "mtext");		
		createToolbar("toolbar_charset41", "0x01c4", "0x01ff", style, "mtext");		
		createToolbar("toolbar_charset5", "0x0200", "0x023f", style, "mtext");		
		createToolbar("toolbar_charset51", "0x0240", "0x027f", style, "mtext");		
		createToolbar("toolbar_charset9", "0x0400", "0x042f", style, "mtext");		
		createToolbar("toolbar_charset91", "0x0430", "0x045f", style, "mtext");		
		
		createToolbar("toolbar_charset10", "0x25A0", "0x25AC", style, "mtext");		
		addToToolbarsName("toolbar_charset10", "0x25B2", "0x25B3", styleN, "mtext");		
		addToToolbarsName("toolbar_charset10", "0x25B6", "0x25B7", styleN, "mtext");		
		addToToolbarsName("toolbar_charset10", "0x25BA", "0x25BA", styleN, "mtext");		
		addToToolbarsName("toolbar_charset10", "0x25BC", "0x25BD", styleN, "mtext");		
		addToToolbarsName("toolbar_charset10", "0x25C4", "0x25C4", styleN, "mtext");		
		addToToolbarsName("toolbar_charset10", "0x25C0", "0x25C1", styleN, "mtext");		
		addToToolbarsName("toolbar_charset10", "0x25C6", "0x25C8", styleN, "mtext");		
		addToToolbarsName("toolbar_charset10", "0x25CA", "0x25CC", styleN, "mtext");		
		addToToolbarsName("toolbar_charset10", "0x25CE", "0x25D1", styleN, "mtext");		
		addToToolbarsName("toolbar_charset10", "0x25D8", "0x25D9", styleN, "mtext");		
		addToToolbarsName("toolbar_charset10", "0x25E2", "0x25E5", styleN, "mtext");		
		
		createToolbar("toolbar_charset11", "0x2160", "0x216B", style, "mtext");		
		addToToolbarsName("toolbar_charset11", "0x2170", "0x2179", styleN, "mtext");		
				
				
		createToolbar("toolbar_charsetF1", "0x00C0", "0x00D6", styleN, "mtext");		
		addToToolbarsName("toolbar_charsetF1", "0x00D9", "0x00DD", styleN, "mtext");		
		addToToolbarsName("toolbar_charsetF1", "0x00E0", "0x00F6", styleN, "mtext");		
		addToToolbarsName("toolbar_charsetF1", "0x00F9", "0x00FD", styleN, "mtext");		
		addToToolbarsName("toolbar_charsetF1", "0x00FF", "0x00FF", styleN, "mtext");		
	}
		}


}