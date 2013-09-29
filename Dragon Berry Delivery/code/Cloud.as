package code
{
	//@author: Rebecca Vessal
	//Instructor: Professor Jefferson
	//Date: 29 October 2011
	//
	//Cloud.as represents the cloud movieclip
	//
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	
	
	public class Cloud extends GameElement
	{
		
		public var windDragon:WindDragon;
		private var player:Player;
		private var game:Game;
		//Declare a boolean variable for checking whether the player has transformed
		public var transformed:Boolean;
		//Declare an xml instance
		private var levelsXML:XML;
		
		public function Cloud(aGame:Game, aPlayer:Player, xml:XML, 
								xCoordinate:int, yCoordinate:int, widthCloud:int,
								heightCloud:int) 
		{
			// constructor code
			//Pass along the parameter arguments onto the game element class
			super(xCoordinate, yCoordinate, widthCloud, heightCloud);
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
			addEventListener(MouseEvent.CLICK, transformToWindDragon);
		}
		
		private function transformToWindDragon(e:MouseEvent):void
		{
			if(transformed == false)
			{
				//Initialize the wind dragon movieclip
				windDragon = new WindDragon(game, levelsXML);
				//Bitmap cache it
				windDragon.cacheAsBitmap = true;			
				//Grab the player's x and store it in a temp variable
				var playerXCoordinate:Number = player.x;
				//Grab the player's y and store it in a temp variable 
				var playerYCoordinate:Number = player.y;
				
				//Set the fireDragon coordinates to the player's previous coordinates
				windDragon.x = playerXCoordinate;
				windDragon.y = playerYCoordinate;
				//Set the fireDragon direction to the player's previous direction
				windDragon.facingDirection = player.facingDirection;
				if(windDragon.facingDirection == "Left")
				{
					windDragon.scaleX = -(Math.abs(windDragon.scaleX));
				}
				trace("Player's direction: " + player.facingDirection);
				trace("Wind dragon's direction: " + windDragon.facingDirection);
				//trace(game.playerArray[0]);
				stage.removeEventListener(KeyboardEvent.KEY_DOWN, player.movePlayer);
				//Remove the player from the stage
				for(var i:int = 0; i<game.playerArray.length; i++)
				{
					trace("players: "+ game.playerArray[i]);
				}
				game.playerLayer.removeChild(game.playerArray.pop());
				//Add the wind dragon movieclip onto the stage
				game.playerLayer.addChild(windDragon);
				trace("Wind Dragon: " + game.playerLayer.contains(windDragon));
				//Add the wind dragon onto the playerArray
				game.playerArray.push(windDragon);
				//Set transformed to true
				transformed = true;
			}
		}
	}
	
}
