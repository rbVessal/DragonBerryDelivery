package code
{
	
	//@author: Rebecca Vessal
	//Instructor: Professor Jefferson
	//Date: 14 November 2011
	//
	//FireButton.as generates a fireball from the fire dragon's mouth and 
	//moves it across the screen
	import flash.events.MouseEvent;
	import flash.display.SimpleButton;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.events.TransformGestureEvent;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	import flash.events.TouchEvent;
	import flash.events.GestureEvent;
	import flash.events.PressAndTapGestureEvent;
	import flash.events.GesturePhase;
	
	public class FireButton extends SimpleButton
	{
		//Declare instance of fireball
		public var fireBall:FireBall;
		//Declare instance of fireDragon
		public var fireDragon:FireDragon;
		//Declare a boolean variable to see if the player has shot a fireball
		public var attack:Boolean;
		//Declare instance of game
		public var game:Game;
		
		public function FireButton(aGame: Game, aFireDragon:FireDragon, xCoordinate:int, yCoordinate:int, 
								   widthFireButton:int, heightFireButton:int)						   
		{
			// constructor code
			//Initialize attributes from the passed in parameters
			x = xCoordinate;
			y = yCoordinate;
			width = widthFireButton;
			height = heightFireButton;
			//Initialize the firedragon from the passed in parameter
			fireDragon = aFireDragon;
			//Initialize the game from the passed in parameter
			game = aGame;
			cacheAsBitmap = true;
		}
		
		public function shoot():void
		{
			fireDragon.addEventListener(MouseEvent.CLICK, fireAttack);
			//Listen for when the user clicks on the fire attack button
			addEventListener(MouseEvent.CLICK, fireAttack);
			/*if(Multitouch.supportsGestureEvents)
			{
				Multitouch.inputMode = MultitouchInputMode.GESTURE;
				stage.addEventListener(TransformGestureEvent.GESTURE_SWIPE, fireAttackSwipe);
			}*/
		
		}
		
		//Shoot the fireball from the player's mouth
		public function fireAttack(e:MouseEvent):void
		{
			//Disable player from shooting more than 1 fireball on the screen
			if(attack == false)
			{
				//Initialize the fireball
				fireBall = new FireBall(game);
				//Bitmap cache it
				fireBall.cacheAsBitmap = true;
				//Make it appear on the screen
				game.attacksLayer.addChild(fireBall);
				//Make the fireball face the same direction
				fireBall.FacingDirection = fireDragon.facingDirection;
				trace("Fireball's facing direction: " + fireBall.FacingDirection);
				//Determine the position of the fireball based on the player's facing direction
				if(fireBall.FacingDirection == "Right")
				{
					//Make the fireball come from the player
					fireBall.x = fireDragon.x + 180;
					fireBall.y = fireDragon.y;
				}
				else
				{
					fireBall.x = fireDragon.x - 180;
					fireBall.y = fireDragon.y;
				}
			}
			//Set attack to true
			attack = true;
			//Remove the event listener
			fireDragon.removeEventListener(MouseEvent.CLICK, fireAttack);
			//Listen for when the user clicks on the fire attack button
			removeEventListener(MouseEvent.CLICK, fireAttack);
			
		}
		
		//Shoot the fireball from the player's mouth if the player swiped
		/*public function fireAttackSwipe(e:TransformGestureEvent):void
		{	
			if(GesturePhase.END)
			{
				//Disable player from shooting more than 1 fireball on the screen
				if(attack == false)
				{
					//Initialize the fireball
					fireBall = new FireBall(game);
					//Bitmap cache it
					fireBall.cacheAsBitmap = true;
					//Make it appear on the screen
					game.attacksLayer.addChild(fireBall);
					//Make the fireball face the same direction
					fireBall.FacingDirection = fireDragon.facingDirection;
					trace("Fireball's facing direction: " + fireBall.FacingDirection);
					//Determine the position of the fireball based on the player's facing direction
					if(fireBall.FacingDirection == "Right")
					{
						//Make the fireball come from the player
						fireBall.x = fireDragon.x + 180;
						fireBall.y = fireDragon.y;
					}
					else
					{
						fireBall.x = fireDragon.x - 180;
						fireBall.y = fireDragon.y;
					}
				}
			}
			//Set attack to true
			attack = true;
			
		}*/
		
		//Update the fireball as it moves across the screen
		public function updateFireBall(gameElement:GameElement):void
		{
			fireBall.moveFireBall(gameElement);
			//trace("Stage width: "  + stage.stageWidth);
			//trace("Attack: " + attack);
			//Remove the fireball as it goes off the stage
			if(fireBall.x > stage.stageWidth)
			{
				//trace("Fire Attack child: " + game.attacksLayer.contains(fireBall)
					 // + "Positiion: " + fireBall.x);
				//Stop the sound
				fireBall.fireBallSoundChannel.stop();
				//Remove the fireball
				game.attacksLayer.removeChild(fireBall);
				//Set the attack to false so that the player can shoot another fireball
				attack = false;
				
			}
			else if(fireBall.x < 0)
			{
				//Stop the sound
				fireBall.fireBallSoundChannel.stop();
				//Remove the fireball
				game.attacksLayer.removeChild(fireBall);
				//Set attack to false so that the player can shoot another fireball
				attack = false;
			}
			//If the fireball collided with a game element
			//Remove it from the stage
			if(fireBall.collisionOccured)
			{
				//Stop the sound
				//fireBall.fireBallSoundChannel.stop();
				//trace("Stop the fireball!!!!");
				fireBall.fireBallSoundChannel.stop();
				//Remove the fireball
				game.attacksLayer.removeChild(fireBall);
				//Set attack to false so that the player can shoot another fireball
				attack = false;
				//Set collision occurred back to false
				fireBall.collisionOccured = false;
			}
		}
		
	}
	
}
