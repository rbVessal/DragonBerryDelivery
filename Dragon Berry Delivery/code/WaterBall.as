package code 
{
	
	import flash.display.MovieClip;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	
	
	public class WaterBall extends GameElement
	{
		//Create attributes
		private var facingDirection:String;
		private var game:Game;
		public var collisionOccured:Boolean;
		public var waterBallSound:Sound;
		public var waterBallSoundChannel:SoundChannel;
		private var pewSound:Sound;
		private var pewSoundChannel:SoundChannel;
		
		//public var gameOver:Boolean;
		public function WaterBall(aGame:Game) 
		{
			// constructor code
			super(x, y, width, height);
			game = aGame;
			//Grab the sound from an external source and store it int
			//in a variable
			var pewSoundRequest:URLRequest = new URLRequest("sounds/pewPew.mp3");
			//Store the external sound request as the sound
			pewSound = new Sound(pewSoundRequest);
			//Play the pew sound
			pewSoundChannel = pewSound.play();
			//Grab the sound from an external source and store it int
			//in a variable
			var waterballSoundRequest:URLRequest = new URLRequest("sounds/waterfall.mp3");
			//Store the external sound request as the sound
			waterBallSound = new Sound(waterballSoundRequest);
			//Play the waterball sound
			waterBallSoundChannel = waterBallSound.play();
			cacheAsBitmap = true;
			
		}
		
		//Move the waterball across the screen
		public function moveWaterBall(gameElement:GameElement):void
		{
			
			
			//Use the waterball's direction to
			//have the waterball move in that certain direction
			if(facingDirection == "Right")
			{
				//Change the facing direction to right
				scaleX = Math.abs(scaleX);
				//Increment the waterball by 10 pixels
				x += 10;
				//Check to see if collision occured
				collision(gameElement);
			}
			else
			{
				//Change the facing direction to the left
				scaleX = -(Math.abs(scaleX));
				//Decrement the waterball by 10 pixels
				x -= 10;
				//Check to see if collision occured
				collision(gameElement);
			}
			
		}
		
		//Create a collision method to detect collisions between waterball against other components
		public function collision(gameElement:GameElement):void
		{
			//Check to see if their bounding boxes collide
			if(this.hitTestObject(gameElement))
			{
				//Check to see if their points collide
				if(gameElement.hitTestPoint(this.x, this.y, true))
				{
					for(var i:int = 0; i<game.obstaclesArray.length; i++)
					{
						//If the game element is part of the obstacles array
						if(gameElement == game.obstaclesArray[i])
						{
							if(gameElement == game.cow)
							{
								trace("Game Element: " + gameElement);
								//Stop playing the sound
								waterBallSoundChannel.stop();
								//Stop the chicken sound
								game.cow.CowSoundChannel.stop();
								//chicken.ChickenSoundChannel.stop();
								//Remove the obstacle
								game.obstaclesLayer.removeChild(gameElement);
								//Set collisionOccured to true
								collisionOccured = true;
								//Pop out the obstacle
								game.obstaclesArray.splice(i, 1);
							}
							/*else
							{
								gameOver = true;
								trace("Game Over: " + gameOver);
							}*/
						}
					}
					
				}
			}
		}
		
		//Create accessors and mutators for the attributes
		public function get FacingDirection():String
		{
			return facingDirection;
		}
		public function set FacingDirection(aFacingDirection:String):void
		{
			facingDirection = aFacingDirection;
		}
	}
	
}
