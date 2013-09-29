package code
{
	
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	
	
	public class PauseButton extends SimpleButton 
	{
		
		
		public function PauseButton(/*xCoordinate:int, yCoordinate:int, widthButton:int, heightButton:int*/) 
		{
			/*x = xCoordinate;
			y = yCoordinate;
			width = widthButton;
			height = heightButton;*/
			cacheAsBitmap = true;
			addEventListener(MouseEvent.CLICK, goToPause);
		}
		
		public function goToPause(e:MouseEvent):void
		{
			(parent as Document).Games.stopSounds();
			//(parent as Document).gameThemeMusicChannel.stop();
			(parent as Document).gotoAndStop("Pause");
		}
	}
	
}
