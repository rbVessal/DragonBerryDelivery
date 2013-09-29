package code
{
	//@author: Rebecca Vessal
	//Instructor: Professor Jefferson
	//Date: 29 October 2011
	//
	//FireDragon.as represents the fire dragon movieclip.  
	//The fire dragon can shoot fire balls at certain obstacles to clear them.
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
	
	public class FireDragon extends Player
	{
		public var facingFireDragonDirection:String;
		public var game:Game;
		
		public function FireDragon(aGame:Game, xml:XML) 
		{
			// constructor code
			super(aGame, xml, x, y, width, height);
			cacheAsBitmap = true;
			game = aGame;
			
		}
		
		//Call the movePlayer method if a player presses a keydown
		public function moveFireDragon()
		{
			//When the player presses a key down
			stage.addEventListener(KeyboardEvent.KEY_DOWN, moveFireDragonPlayer);
			if(Multitouch.supportsTouchEvents)
			{
				Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
				stage.addEventListener(TouchEvent.TOUCH_MOVE, moveFireDragonPlayerTouch);
			}
			
		}
		
		//Move the player depending on which key was pressed
		public function moveFireDragonPlayer(e:KeyboardEvent):void
		{
			//Grab player input and determine which key was pressed
			switch(e.keyCode)
			{
				case Keyboard.LEFT:
				{
					if(x > 0)
					{
						//Change the facing direction to left
						scaleX = -(Math.abs(scaleX));
						super.facingDirection = "Left";
						//Move the player by 10 pixels to the left
						x -= 10;
					}
					break;
				}
				case Keyboard.RIGHT:
				{
					if(x < stage.stageWidth)
					{
						//Change the facing direction to right
						scaleX = Math.abs(scaleX);
						super.facingDirection = "Right";
						//Move the player by 10 pixels to the right
						x += 10;
					}
					break;
					
				}
			}
		}
		
		public function moveFireDragonPlayerTouch(e:TouchEvent):void
		{
			//x = 400;
			//Move the player depending on where the player touched the screen
			//Grab player input and move the player based on the direction
			/*var textField:TextField = new TextField();
			textField.text = "Tap coordinate: " + e.tapLocalX;
			textField.x = 400;
			textField.y = 400;
			addChild(textField);*/
			//x = 400;
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
				}
			}
			if(e.stageX > x)
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
					
				}
				
			}
			
		}

	}
	
}
