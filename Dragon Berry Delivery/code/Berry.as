package code 
{
	//@author: Rebecca Vessal
	//Instructor: Professor Jefferson
	//Date: 17 December 2011
	//
	//Berry.as represents the berry movieclip
	//
	import flash.display.MovieClip;
	
	
	public class Berry extends GameElement
	{
		
		
		public function Berry(xCoordinate:int, yCoordinate:int, widthBerry:int, heightBerry:int) 
		{
			// constructor code
			super(xCoordinate, yCoordinate, widthBerry, heightBerry);
			/*x = xCoordinate;
			y = yCoordinate;
			width = widthBerry;
			height = heightBerry;*/
			cacheAsBitmap = true;
		}
	}
	
}
