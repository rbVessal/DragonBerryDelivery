package code 
{
	
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	
	
	public class ContinueJourneyButton extends SimpleButton 
	{
		
		
		public function ContinueJourneyButton() 
		{
			// constructor code
			cacheAsBitmap = true;
			addEventListener(MouseEvent.CLICK, goToGame);
		}
		
		public function goToGame(e:MouseEvent):void
		{
			(parent as Document).playGame();
			(parent as Document).gotoAndStop("Games");
		}
	}
	
}
