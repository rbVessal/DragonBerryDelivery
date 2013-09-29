package code 
{
	//@author: Rebecca Vessal
	//Instructor: Professor Jefferson
	//Date: 17 December 2011
	//
	//Milk.as represents the milk movieclip
	//
	import flash.display.MovieClip;
	
	
	public class Milk extends GameElement 
	{
		
		
		public function Milk(xCoordinate:int, yCoordinate:int, 
							 widthMilk:int, heightMilk:int) 
		{
			// constructor code
			super(xCoordinate, yCoordinate, widthMilk, heightMilk);
			cacheAsBitmap = true;
		}
	}
	
}
