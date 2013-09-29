package code 
{
	
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	
	
	public class WaterButton extends SimpleButton 
	{
		//Declare instance of waterball
		public var waterBall:WaterBall;
		//Declare instance of waterDragon
		public var waterDragon:WaterDragon;
		//Declare a boolean variable to see if the player has shot a waterball
		public var attack:Boolean;
		//Declare instance of game
		public var game:Game;
		
		public function WaterButton(aGame: Game, aWaterDragon:WaterDragon, xCoordinate:int, yCoordinate:int, 
								   widthWaterButton:int, heightWaterButton:int)						   
		{
			// constructor code
			//Initialize attributes from the passed in parameters
			x = xCoordinate;
			y = yCoordinate;
			width = widthWaterButton;
			height = heightWaterButton;
			//Initialize the waterdragon from the passed in parameter
			waterDragon = aWaterDragon;
			//Initialize the game from the passed in parameter
			game = aGame;
			cacheAsBitmap = true;
		}
		
		public function shoot():void
		{
			waterDragon.addEventListener(MouseEvent.CLICK, waterAttack);
			//Listen for when the user clicks on the water attack button
			addEventListener(MouseEvent.CLICK, waterAttack);
		}
		
		//Shoot the fireball from the player's mouth
		public function waterAttack(e:MouseEvent):void
		{
			//Disable player from shooting more than 1 fireball on the screen
			if(attack == false)
			{
				//Initialize the fireball
				waterBall = new WaterBall(game);
				//Bitmap cache it
				waterBall.cacheAsBitmap = true;
				//Make it appear on the screen
				game.attacksLayer.addChild(waterBall);
				//Make the fireball face the same direction
				waterBall.FacingDirection = waterDragon.facingDirection;
				trace("Waterball's facing direction: " + waterBall.FacingDirection);
				//Determine the position of the fireball based on the player's facing direction
				if(waterBall.FacingDirection == "Right")
				{
					//Make the waterball come from the player
					waterBall.x = waterDragon.x + 180;
					waterBall.y = waterDragon.y;
				}
				else
				{
					waterBall.x = waterDragon.x - 180;
					waterBall.y = waterDragon.y;
				}
			}
			//Set attack to true
			attack = true;
			//Remove the event listener
			waterDragon.removeEventListener(MouseEvent.CLICK, waterAttack);
			//Listen for when the user clicks on the water attack button
			removeEventListener(MouseEvent.CLICK, waterAttack);
			
		}
		
		//Update the fireball as it moves across the screen
		public function updateWaterBall(gameElement:GameElement):void
		{
			waterBall.moveWaterBall(gameElement);
			//trace("Stage width: "  + stage.stageWidth);
			//trace("Attack: " + attack);
			//Remove the waterball as it goes off the stage
			if(waterBall.x > stage.stageWidth)
			{
				//trace("Fire Attack child: " + game.attacksLayer.contains(fireBall)
					 // + "Positiion: " + fireBall.x);
				//Stop the sound
				waterBall.waterBallSoundChannel.stop();
				//Remove the waterball
				game.attacksLayer.removeChild(waterBall);
				//Set the attack to false so that the player can shoot another waterball
				attack = false;
				
			}
			else if(waterBall.x < 0)
			{
				//Stop the sound
				waterBall.waterBallSoundChannel.stop();
				//Remove the waterball
				game.attacksLayer.removeChild(waterBall);
				//Set attack to false so that the player can shoot another waterball
				attack = false;
			}
			//If the waterball collided with a game element
			//Remove it from the stage
			if(waterBall.collisionOccured)
			{
				//Stop the sound
				//waterBall.waterBallSoundChannel.stop();
				//trace("Stop the waterball!!!!");
				waterBall.waterBallSoundChannel.stop();
				//Remove the waterball
				game.attacksLayer.removeChild(waterBall);
				//Set attack to false so that the player can shoot another waterball
				attack = false;
				//Set collision occurred back to false
				waterBall.collisionOccured = false;
			}
		}
	}
	
}
