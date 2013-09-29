package code 
{
	
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	
	
	public class ReplayButton extends SimpleButton 
	{
		
		
		public function ReplayButton() 
		{
			cacheAsBitmap = true;
			// constructor code
			addEventListener(MouseEvent.CLICK, goToGame);
		}
		
		public function goToGame(e:MouseEvent):void
		{
			(parent as Document).Games.currentLevel = 0;
			(parent as Document).playGame();
			//trace("Current Frame: " + (parent as Document).currentLabel);
			(parent as Document).gotoAndStop("Games");
			
			//trace("BlAAAAHHHHH");
		}
	}
	
}
