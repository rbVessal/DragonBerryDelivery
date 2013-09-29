package code
{
	//@author: Rebecca Vessal
	//Instructor: Professor Jefferson
	//Date: 29 October 2011
	//
	//Player.as represents the dragon movieclip.  Player can move left and right.
	//
	
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	import flash.events.TransformGestureEvent;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	import flash.events.TouchEvent;
	import flash.events.GestureEvent;
	import flash.events.PressAndTapGestureEvent;
	import sounds.Swipe;
	import flash.text.TextField;
	
	
	public class Player extends GameElement 
	{
		//Declare an instance of a fire dragon movieclip
		public var fireDragon: FireDragon;
		//Declare an instance of a game class
		private var game:Game;
		//Declare attributes
		public var collisionOccurred: Boolean;
		public var facingDirection:String;
		//Declare an instance of swipe sound
		private var swipeSound:Swipe = new Swipe();
		//Create an instance for xml
		private var levelsXML:XML;
		//Create attributes
		private var speed:int;
		
		
		public function Player(aGame:Game, xml:XML,
							   xCoordinate:int, yCoordinate:int, 
							   widthPlayer:int, heightPlayer:int) 
		{
			//Pass along parameter arguments from player onto game element
			super(xCoordinate, yCoordinate, widthPlayer, heightPlayer);
			//Set the game to the game passed in to get access to the layers of the stage
			game = aGame;
			//Set xml instance to the xml passed in
			levelsXML = xml;
			//Set speed to speed data from xml file
			speed = levelsXML.level[0].player.speed;
			//Set default value for direction
			facingDirection = "Right";
			cacheAsBitmap = true;
			
		}
		
		//Call the movePlayer method if a player presses a keydown
		public function move():void
		{
			//When the player presses a key down
			//Check to see whether the input was a touch or a key
			if(Multitouch.supportsTouchEvents)
			{
				Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
				//stage.addEventListener(TouchEvent.TOUCH_BEGIN
				stage.addEventListener(TouchEvent.TOUCH_MOVE, movePlayerTouch);
				//stage.addEventListener(TouchEvent.TOUCH_END, stopPlayerTouch);
				//stage.addEventListener(GestureEvent.GESTURE_TWO_FINGER_TAP, movePlayerTouch);
				
				//stage.addEventListener(TouchEvent.TOUCH_END, endPlayerTouch);
			}
			else
			{
				
				stage.addEventListener(KeyboardEvent.KEY_DOWN, movePlayer);
			}
			
		}
		
		//Move the player depending on which key was pressed
		public function movePlayer(e:KeyboardEvent):void
		{
			//Grab player input and determine which key was pressed
			switch(e.keyCode)
			{
				case Keyboard.LEFT:
				{
					//Make sure that the player does not go off screen
					if(x > 0)
					{
						//Change the player's facing direction to the left
						scaleX = -(Math.abs(scaleX));
						facingDirection = "Left";
						//Move the player by 10 pixels to the left
						x -= speed;
						if(stage != null)
						{
							stage.removeEventListener(KeyboardEvent.KEY_DOWN, movePlayer);
						}
					}
					break;
				}
				case Keyboard.RIGHT:
				{
					if(stage != null)
					{
						//Make sure that the player does not go off screen
						if(x <stage.stageWidth)
						{
							//Change the player's facing direction to the left
							scaleX = Math.abs(scaleX);
							facingDirection = "Right";
							//Move the player by 10 pixels to the right
							x += speed;
							stage.removeEventListener(KeyboardEvent.KEY_DOWN, movePlayer);
							break;
						}
					}
					
				}
			}
		}
		
		
		public function movePlayerTouch(e:TouchEvent):void
		{
			if(e.stageX < x)
			{
				//Make sure that the player does not go off screen
				if(x > 0)
				{
					//Change the player's facing direction to the left
					scaleX = -(Math.abs(scaleX));
					facingDirection = "Left";
					//Move the player by 10 pixels to the left
					//x -= speed;
					x = e.stageX;
					if(stage != null)
					{
						stage.removeEventListener(KeyboardEvent.KEY_DOWN, movePlayerTouch);
					}
				}
			}
			if(e.stageX > x)
			{
				if(stage != null)
				{
					//Make sure that the player does not go off screen
					if(x <stage.stageWidth)
					{
						//Change the player's facing direction to the left
						scaleX = Math.abs(scaleX);
						facingDirection = "Right";
						//Move the player by 10 pixels to the right
						//x += speed;
						x = e.stageX;
						stage.removeEventListener(KeyboardEvent.KEY_DOWN, movePlayerTouch);
						
				}
				}
				
			}
			
		}
		
		
		//Process collision between the player and another game object
		public function collision(gameElement:GameElement, nameOfIngredient:String):void
		{
			//Check to see if their bounding boxes collide
			if(this.hitTestObject(gameElement))
			{
				//Check to see if their points collide
				if(this.hitTestPoint(gameElement.x, gameElement.y, true))
				{
				  	//Check to see if the ingredient is on the ingredients layer
					if(game.ingredientsLayer.contains(gameElement))
					{
						
						//Play the swipe sound
						swipeSound.play();
						//Update the text for obtained ingredients
						game.listText.obtainedIngredients(nameOfIngredient);
						//Remove the ingredient from the ingredients layer
						game.ingredientsLayer.removeChild(gameElement);
					}
				}
			}
		}
		

	}
	
}
