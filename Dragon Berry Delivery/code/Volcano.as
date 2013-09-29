package code
{
	//@author: Rebecca Vessal
	//Instructor: Professor Jefferson
	//Date: 29 October 2011
	//
	//Volcano.as represents the volcano movieclip.  Clicking on the volcano
	//switches the player from a normal dragon to a fire dragon.
	//
	import flash.display.MovieClip;
	import flash.events.*;
	
	public class Volcano extends GameElement
	{
		public var fireDragon:FireDragon;
		private var player:Player;
		private var game:Game;
		//Declare a boolean variable for checking whether the player has transformed
		public var transformed:Boolean;
		//Declare an xml instance
		private var levelsXML:XML;
		
		public function Volcano(aGame:Game, aPlayer:Player, xml:XML, 
								xCoordinate:int, yCoordinate:int, widthVolcano:int,
								heightVolcano:int) 
		{
			// constructor code
			//Pass along the parameter arguments onto the game element class
			super(xCoordinate, yCoordinate, widthVolcano, heightVolcano);
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
			addEventListener(MouseEvent.CLICK, transformToFireDragon);
		}
		
		private function transformToFireDragon(e:MouseEvent):void
		{
			if(transformed == false)
			{
				//Initialize the fire dragon movieclip
				fireDragon = new FireDragon(game, levelsXML);
				//Bitmap cache it
				fireDragon.cacheAsBitmap = true;			
				//Grab the player's x and store it in a temp variable
				var playerXCoordinate:Number = player.x;
				//Grab the player's y and store it in a temp variable 
				var playerYCoordinate:Number = player.y;
				
				//Set the fireDragon coordinates to the player's previous coordinates
				fireDragon.x = playerXCoordinate;
				fireDragon.y = playerYCoordinate;
				//Set the fireDragon direction to the player's previous direction
				fireDragon.facingDirection = player.facingDirection;
				if(fireDragon.facingDirection == "Left")
				{
					fireDragon.scaleX = -(Math.abs(fireDragon.scaleX));
				}
				trace("Player's direction: " + player.facingDirection);
				trace("Fire dragon's direction: " + fireDragon.facingDirection);
				//trace(game.playerArray[0]);
				stage.removeEventListener(KeyboardEvent.KEY_DOWN, player.movePlayer);
				//Remove the player from the stage
				game.playerLayer.removeChild(game.playerArray.pop());
				//Add the fire dragon movieclip onto the stage
				game.playerLayer.addChild(fireDragon);
				//Add the fire dragon onto the playerArray
				game.playerArray.push(fireDragon);
				//Set transformed to true
				transformed = true;
			}
		}
		
	}
	
}
