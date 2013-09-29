package code 
{
	//@author: Rebecca Vessal
	//Instructor: Professor Jefferson
	//Date: 17 December 2011
	//
	//Wind.as represents the wind attack
	//
	import flash.display.MovieClip;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	import flash.geom.Point;
	
	
	public class Wind extends GameElement 
	{
		//Create attributes
		private var facingDirection:String;
		private var game:Game;
		public var collisionOccured:Boolean;
		public var windSound:Sound;
		public var windSoundChannel:SoundChannel;
		private var pewSound:Sound;
		private var pewSoundChannel:SoundChannel;
		
		public function Wind(aGame:Game) 
		{
			// constructor code
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
			var windSoundRequest:URLRequest = new URLRequest("sounds/wind.mp3");
			//Store the external sound request as the sound
			windSound = new Sound(windSoundRequest);
			//Play the fireball sound
			windSoundChannel = windSound.play();
			//cacheAsBitmap = true;
		}
		
		//Move the fireball across the screen
		public function moveWind(gameElement:GameElement):void
		{
			//Use the fireball's direction to
			//have the fireball move in that certain direction
			if(facingDirection == "Right")
			{
				//Change the facing direction to right
				scaleX = Math.abs(scaleX);
				//Increment the fireball by 10 pixels
				x += 10;
				//Check to see if collision occured
				collision(gameElement);
			}
			else
			{
				//Change the facing direction to the left
				scaleX = -(Math.abs(scaleX));
				//Decrement the fireball by 10 pixels
				x -= 10;
				//Check to see if collision occured
				collision(gameElement);
			}
		}
		
		//Create a collision method to detect collisions between fireball against other components
		public function collision(gameElement:GameElement):void
		{
			//Check to see if their bounding boxes collide
			if(this.hitTestObject(gameElement))
			{
				//var treePoint = new Point(gameElement.x, gameElement.y);
				//trace("Tree coordinates: " + 
				//	  gameElement.localToGlobal(treePoint));
				//trace("Tree local coordinates: " + gameElement.x + "," + gameElement.y);
				//trace("Wind coordinates: " + this.x + "," + this.y);
				//Check to see if their points collide
				if(gameElement.hitTestPoint(this.x, this.y, true))
				{
					
					trace("HIT SOMETHING!");
					for(var i:int = 0; i<game.obstaclesArray.length; i++)
					{
						//If the game element is part of the obstacles array
						if(gameElement == game.obstaclesArray[i])
						{
							if(gameElement == game.tree)
							{
								trace("Game Element: " + gameElement);
								//Stop playing the sound
								windSoundChannel.stop();
								//Set collisionOccured to true
								collisionOccured = true;
							}
						}
					}
					
				}
			}
			
			if(collisionOccured)
			{
				//Drop the berry onto the ground
				//var speed:int = 1;
				game.berry.y = stage.stageHeight * .5 - 35;
				//speed++;
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
