package code 
{
	//@author: Rebecca Vessal
	//Instructor: Professor Jefferson
	//Date: 17 December 2011
	//
	//WindDragon.as represents the windDragon movieclip
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
	
	public class WindDragon extends Player
	{
		public var game:Game;
		public var facingWindDragonDirection:String;
		
		public function WindDragon(aGame:Game, xml:XML) 
		{
			// constructor code
			super(aGame, xml, x, y, width, height);
			cacheAsBitmap = true;
			game = aGame;
		}
		
		public function moveWindDragon():void
		{
			//trace("level: " + game.currentLevel);
			if(game.currentLevel == 1)
			{
				//When the player presses a key down
				stage.addEventListener(KeyboardEvent.KEY_DOWN, moveWindDragonPlayer);
				
				if(Multitouch.supportsTouchEvents)
				{
					Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
					stage.addEventListener(TouchEvent.TOUCH_MOVE, moveWindDragonPlayerTouch);
				}
			}
			
		}
		
		//Move the player depending on which key was pressed
		public function moveWindDragonPlayer(e:KeyboardEvent):void
		{
			if(game.currentLevel == 1 && game.backGround.Clouds.transformed)
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
							if(stage != null)
							{
								stage.removeEventListener(KeyboardEvent.KEY_DOWN, moveWindDragonPlayer);
							}
						}
						break;
					}
					case Keyboard.RIGHT:
					{
						trace("WindDragon on Stage? " + game.playerLayer.contains(game.backGround.Clouds.windDragon));
						trace("stage: " + stage);
						if(stage != null)
						{
							if(x < stage.stageWidth)
							{
								//Change the facing direction to right
								scaleX = Math.abs(scaleX);
								super.facingDirection = "Right";
								//Move the player by 10 pixels to the right
								x += 10;
								stage.removeEventListener(KeyboardEvent.KEY_DOWN, moveWindDragonPlayer);
								
							}
						}
						break;
						
					}
				}
			}
		}
		
		public function moveWindDragonPlayerTouch(e:TouchEvent):void
		{
			if(game.currentLevel == 1 && game.backGround.Clouds.transformed)
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
							stage.removeEventListener(TouchEvent.TOUCH_MOVE, moveWindDragonPlayerTouch);
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
							stage.removeEventListener(TouchEvent.TOUCH_MOVE, moveWindDragonPlayerTouch);
						}
					}
					
				}
			}
			
		}

	}
	
}
