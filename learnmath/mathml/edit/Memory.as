package learnmath.mathml.edit
{
	
	public class Memory
	{
		private var codeList:Array = new Array();
		private var memoryList:Array = new Array();
		private var memIndex:int=-1;
		public var clipboard:String;
		
		public function Memory(){
		}

		public function addUnique(code:String, value:String):void{
			if(memIndex>-1){
				if(codeList[memIndex]==code){
					return;
				}
			}
			memIndex = memIndex+1;
			memoryList[memIndex] = value;
			codeList[memIndex]=code;
			
			var l:int = memoryList.length
			for (var i:int=(memIndex+1); i<l; i++){
				memoryList[i] = null;
				codeList[i] = null;
			}
		}

		public function hasPrev():Boolean{
			var prevIndex:int = memIndex-1; 
			if(prevIndex>=0 && prevIndex<memoryList.length){
				return  true;
			}
			return false;
		}

		public function getPrev():String{
			var prevIndex:int = memIndex-1; 
			if(prevIndex>=0 && prevIndex<memoryList.length){
				memIndex = prevIndex;
				return  memoryList[memIndex];
			}
			return null;
		}
		
		public function hasNext():Boolean{
			var nextIndex:int = memIndex+1; 
			if(nextIndex<memoryList.length){
				return  true;
			}
			return false;
		}

		public function getNext():String{
			var nextIndex:int = memIndex+1; 
			if(nextIndex<memoryList.length){
				memIndex = nextIndex;
				return  memoryList[memIndex];
			}
			return null;
		}
		
	}
}