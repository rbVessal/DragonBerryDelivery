package code 
{
	
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	import flash.events.TransformGestureEvent;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	import flash.events.TouchEvent;
	
	
	public class WaterDragon extends Player 
	{
		public var game:Game;
		public var facingWaterDragonDirection:String;
		
		public function WaterDragon(aGame:Game, xml:XML) 
		{
			// constructor code
			super(aGame, xml, x, y, width, height);
			cacheAsBitmap = true;
			game = aGame;
		}
		
		public function moveWaterDragon():void
		{
			//When the player presses a key down
			stage.addEventListener(KeyboardEvent.KEY_DOWN, moveWaterDragonPlayer);
			if(Multitouch.supportsTouchEvents)
			{
				Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
				stage.addEventListener(TouchEvent.TOUCH_MOVE, moveWaterDragonPlayerTouch);
			}
		}
		
		//Move the player depending on which key was pressed
		public function moveWaterDragonPlayer(e:KeyboardEvent):void
		{
			if(game.currentLevel == 2 && game.pond.transformed)
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
						if(stage != null)
						{
							if(x < stage.stageWidth)
							{
								//Change the facing direction to right
								scaleX = Math.abs(scaleX);
								super.facingDirection = "Right";
								//Move the player by 10 pixels to the right
								x += 10;
							}
						}
						break;
						
					}
				}
			}
		}
		
		public function moveWaterDragonPlayerTouch(e:TouchEvent):void
		{
			if(game.currentLevel == 2 && game.pond.transformed)
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
							
						}
					}
					
				}
			}
			
		}
	}
	
}
