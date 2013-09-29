package code 
{
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	
	
	public class Pond extends GameElement 
	{
		public var waterDragon:WaterDragon;
		private var player:Player;
		private var game:Game;
		//Declare a boolean variable for checking whether the player has transformed
		public var transformed:Boolean;
		//Declare an xml instance
		private var levelsXML:XML;
		
		public function Pond(aGame:Game, aPlayer:Player, xml:XML, 
								xCoordinate:int, yCoordinate:int, widthPond:int,
								heightPond:int) 
		{
			// constructor code
			//Pass along the parameter arguments onto the game element class
			super(xCoordinate, yCoordinate, widthPond, heightPond);
			//Make the volcano clickable to the user
			buttonMode = true;
			//Initialize game
			game = aGame;
			//Initalize the player with the passed in parameter
			player = aPlayer;
			//Give default value for transformed
			transformed = false;
			//Set levelsXML to the xml file passed in
			levelsXML = xml;
			cacheAsBitmap = true;
			//Disptach an event when the user clicks on the volcano
			addEventListener(MouseEvent.CLICK, transformToWaterDragon);
		}
		
		private function transformToWaterDragon(e:MouseEvent):void
		{
			if(transformed == false)
			{
				//Initialize the wind dragon movieclip
				waterDragon = new WaterDragon(game, levelsXML);
				//Bitmap cache it
				waterDragon.cacheAsBitmap = true;			
				//Grab the player's x and store it in a temp variable
				var playerXCoordinate:Number = player.x;
				//Grab the player's y and store it in a temp variable 
				var playerYCoordinate:Number = player.y;
				
				//Set the fireDragon coordinates to the player's previous coordinates
				waterDragon.x = playerXCoordinate;
				waterDragon.y = playerYCoordinate;
				//Set the fireDragon direction to the player's previous direction
				waterDragon.facingDirection = player.facingDirection;
				if(waterDragon.facingDirection == "Left")
				{
					waterDragon.scaleX = -(Math.abs(waterDragon.scaleX));
				}
				trace("Player's direction: " + player.facingDirection);
				trace("Water dragon's direction: " + waterDragon.facingDirection);
				//trace(game.playerArray[0]);
				stage.removeEventListener(KeyboardEvent.KEY_DOWN, player.movePlayer);
				//Remove the player from the stage
				game.playerLayer.removeChild(game.playerArray.pop());
				//Add the fire dragon movieclip onto the stage
				game.playerLayer.addChild(waterDragon);
				//Add the fire dragon onto the playerArray
				game.playerArray.push(waterDragon);
				//Set transformed to true
				transformed = true;
			}
		}
	}
	
}
