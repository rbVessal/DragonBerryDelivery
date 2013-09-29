package code 
{
	//@author: Rebecca Vessal
	//Instructor: Professor Jefferson
	//Date: 13 November 2011
	//
	//GameElement.as represents elements that comprise of the game
	//
	import flash.display.MovieClip;
	
	public class GameElement extends MovieClip
	{
		//Create attributes
		private var facingDirection:String;
		
		public function GameElement(xCoordinate:int, yCoordinate:int, 
									widthElement:int, heightElement:int) 
		{
			// constructor code
			x = xCoordinate;
			y = yCoordinate;
			width = widthElement;
			height = heightElement;
			
		}
		
		//Create accessors and mutators for the attributes
		/*public function get getFacingDirection():String
		{
			return facingDirection;
		}
		public function set setFacingDirection(aFacingDirection:String):void
		{
			facingDirection = aFacingDirection;
		}*/
		

	}
	
}
