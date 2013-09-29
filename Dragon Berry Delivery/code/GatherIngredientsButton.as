package code 
{
	
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	
	
	public class GatherIngredientsButton extends SimpleButton 
	{
		
		
		public function GatherIngredientsButton() 
		{
			// constructor code
			cacheAsBitmap = true;
			addEventListener(MouseEvent.CLICK, goToGame);
		}
		
		public function goToGame(e:MouseEvent):void
		{
			if((parent as Document).Games.currentLevel > 0)
			{
				(parent as Document).Games.begin();
			}
			else
			{
				(parent as Document).playGame();
			}
			(parent as Document).gotoAndStop("Games");
		}
	}
	
}
