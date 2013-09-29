package code 
{
	//@author: Rebecca Vessal
	//Instructor: Professor Jefferson
	//Date: 17 December 2011
	//
	//WindButton.as represents the button for executing wind attacks
	//
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	
	
	public class WindButton extends SimpleButton 
	{
		
		//Declare instance of fireball
		public var wind:Wind;
		//Declare instance of fireDragon
		public var windDragon:WindDragon;
		//Declare a boolean variable to see if the player has shot a fireball
		public var attack:Boolean;
		//Declare instance of game
		public var game:Game;
		public function WindButton(aGame:Game, aWindDragon:WindDragon, xCoordinate:int,
								   yCoordinate:int, widthWindButton:int, heightWindButton:int) 
		{
			// constructor code
			game = aGame;
			windDragon = aWindDragon;
			x = xCoordinate;
			y = yCoordinate;
			width = widthWindButton;
			height = heightWindButton;
			cacheAsBitmap = true;
			addEventListener(MouseEvent.CLICK, windAttack);
			windDragon.addEventListener(MouseEvent.CLICK, windAttack);
		}
		
		public function windAttack(e:MouseEvent):void
		{
			//Disable player from shooting more than 1 fireball on the screen
			if(attack == false)
			{
				//Initialize the fireball
				wind = new Wind(game);
				//Bitmap cache it
				wind.cacheAsBitmap = true;
				//Make it appear on the screen
				game.attacksLayer.addChild(wind);
				//Make the fireball face the same direction
				wind.FacingDirection = windDragon.facingDirection;
				trace("Wind's facing direction: " + wind.FacingDirection);
				//Determine the position of the fireball based on the player's facing direction
				if(wind.FacingDirection == "Right")
				{
					//Make the fireball come from the player
					wind.x = windDragon.x + 180;
					wind.y = windDragon.y;
				}
				else
				{
					wind.x = windDragon.x - 180;
					wind.y = windDragon.y;
				}
			}
			//Set attack to true
			attack = true;
			//Remove the event listener
			windDragon.removeEventListener(MouseEvent.CLICK, windAttack);
			//Listen for when the user clicks on the fire attack button
			//removeEventListener(MouseEvent.CLICK, windAttack);
		}
		
		//Update the fireball as it moves across the screen
		public function updateWind(gameElement:GameElement):void
		{
			wind.moveWind(gameElement);
			//trace("Stage width: "  + stage.stageWidth);
			//trace("Attack: " + attack);
			//Remove the fireball as it goes off the stage
			if(wind.x > stage.stageWidth)
			{
				//trace("Fire Attack child: " + game.attacksLayer.contains(fireBall)
					 // + "Positiion: " + fireBall.x);
				//Stop the sound
				wind.windSoundChannel.stop();
				//Remove the fireball
				game.attacksLayer.removeChild(wind);
				//Set the attack to false so that the player can shoot another fireball
				attack = false;
				trace("Wind Attack: " + attack);
				
			}
			else if(wind.x < 0)
			{
				//Stop the sound
				wind.windSoundChannel.stop();
				//Remove the fireball
				game.attacksLayer.removeChild(wind);
				//Set attack to false so that the player can shoot another fireball
				attack = false;
				trace("Wind Attack: " + attack);
			}
			//If the fireball collided with a game element
			//Remove it from the stage
			if(wind.collisionOccured)
			{
				//Stop the sound
				//fireBall.fireBallSoundChannel.stop();
				//trace("Stop the fireball!!!!");
				wind.windSoundChannel.stop();
				//Remove the fireball
				game.attacksLayer.removeChild(wind);
				//Set attack to false so that the player can shoot another fireball
				attack = false;
				//Set collision occurred back to false
				wind.collisionOccured = false;
			}
		}
		
		
	}
	
}
