package code
{
	//@author: Rebecca Vessal
	//Instructor: Professor Jefferson
	//Date: 29 October 2011
	//
	//Tree.as represents the tree movieclip
	//
	import flash.display.MovieClip;
	
	
	public class Trees extends GameElement
	{
		
		
		public function Trees(xCoordinate:int, yCoordinate:int, widthTree:int, heightTree:int) 
		{
			//super(xCoordinate, yCoordinate, widthTree, heightTree);
			// constructor code
			super(xCoordinate, yCoordinate, widthTree, heightTree);
			/*x = xCoordinate;
			y = yCoordinate;
			width = widthTree;
			height = heightTree;*/
			cacheAsBitmap = true;
			
		}
	}
	
}
