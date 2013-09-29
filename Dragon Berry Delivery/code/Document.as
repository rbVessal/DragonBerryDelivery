package code 
{
	//@author: Rebecca Vessal
	//Instructor: Professor Jefferson
	//Date: 29 October 2011
	//
	//Document.as represents the main class for the game.  
	//
	import flash.display.MovieClip;
	import flash.display.*;
	import flash.events.MouseEvent;
	import flash.events.TransformGestureEvent;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	import flash.events.TouchEvent;
	import flash.events.GestureEvent;
	import flash.net.URLRequest;
	import flash.net.URLLoader;
	import flash.events.Event;
	import flash.media.SoundChannel;
	import flash.media.Sound;
	import code.Screens.*;
		
	public class Document extends MovieClip 
	{
		//Declare game instance
		private var games:Game;
		//Declare xml instance
		private var levelsXML:XML;
		//Declare a soundChannel instance for the general game music
		public var gameThemeMusicChannel:SoundChannel;
		//Declare an external sound instance for the gneeral game theme music
		private var gameThemeMusic:Sound;
		//private var gameStart:Boolean;
		//Declare an instance of screen to keep track of the curren screen
		//private var currentScreen:Screen;
		
		//Declare mutlitouch instance
		
		
		public function Document() 
		{
			// constructor code
			//Intialize the soundchannel
			gameThemeMusicChannel = new SoundChannel();
			//Declare and intialize a URLRequest for the external sound
			var externalSoundRequest:URLRequest = new URLRequest("sounds/chaoGarden.mp3");
			//Load the game theme music into the sound variable
			gameThemeMusic = new Sound(externalSoundRequest);
			//Play the external sound and make it loop forever
			gameThemeMusicChannel = gameThemeMusic.play(0, 9999);
			//Obtain the xml file and store it in urlrequest
			var xmlRequest:URLRequest = new URLRequest("dragonBerryDeliveryXML.xml");
			var xmlLoader:URLLoader = new URLLoader(xmlRequest);
			//Enable full screen and scale to fit monitor size
			//stage.displayState = StageDisplayState.FULL_SCREEN;
			//stage.scaleMode = StageScaleMode.SHOW_ALL;
			//Add an event listener for when the xml finishes loading
			xmlLoader.addEventListener(Event.COMPLETE, finishedLoading);
			stage.focus = stage;
			
		}
		
		public function finishedLoading(e:Event):void
		{
			levelsXML = new XML(e.target.data);
			//trace("XML: " + levelsXML);
			games = new Game(levelsXML.levels[0]);
			addChild(games);
			//trace(games);
			//playGame();
			/*if(games.gameStart)
			{
				playGame();
			}*/
			//Display the title screen
			//displayScreen(TitleScreen);
			
		}
		
		public function playGame():void
		{
			
			//Begin the game
			games.begin();
			//Make the stage the focus when the player starts the game
			stage.focus = stage;
			/*games.Players;*/
			//trace(stage.focus.color);
			
			//stage.addEventListener(KeyboardEvent.KEY_DOWN, movePlayer);
			//Check to see if the platform supports touch
			//var support:Boolean = Multitouch.supportsGestureEvents;
			//if(support)
			//{
				//Ensure the that taps and gestures events become gesture events at runtime
				//Multitouch.inputMode = MultitouchInputMode.GESTURE;
				//Multitouch.inputMode = MultitouchInputMode.GESTURE;
				//GestureEvent gEvent = new GestureEvent
				/*stage.addEventListener(TouchEvent.TOUCH_BEGIN, onTouchBegin,true);
				stage.addEventListener(TouchEvent.TOUCH_MOVE, onTouchMove,true);
				stage.addEventListener(TouchEvent.TOUCH_END, onTouchEnd,true);*/
				//addEventListener(MouseEvent.CLICK, function(){trace("click!!");});
			//}
			/*else
			{
				trace("Multitouch not supported");
			}*/
		}
		

		
		
		//Display the current screen
		/*public function displayScreen(screenClass:Class):void
		{
			if(currentScreen != null)
			{
				currentScreen.bringOut();
			}
			
			if(screenClass == Game)
			{
				currentScreen = games = new Game(levelsXML.levels[0], this);
				//Initialize the game instance
				
				//Add game to the stage
				addChild(games);
				playGame();
				games.bringIn();
			}
			else
			{
				//Create a new screenClass
				currentScreen = new screenClass(this);
				
				//Add currentScreen to the display list
				addChild(currentScreen);
				
				//Tell the currentScreen to bringIn()
				currentScreen.bringIn();
			}
		}*/
		
		//Create a public accessor for game
		public function get Games():Game
		{
			//trace("rawr: " + games);
			return games;
		}
		
		/*public function onTouchBegin(e:TouchEvent):void
		{
			//trace("e="+e);
			//games.Players.x = 400;
			//games.Players.x = GestureEvent.localX;
			//games.Players.y = GestureEvent.localY;
		}
		public function onTouchMove(e:TouchEvent):void
		{
			//trace("e="+e);
			//games.Players.x = GestureEvent.localX;
			//games.Players.y = GestureEvent.localY;
			//games.Players.x = 200;
		}
		
		public function onTouchEnd(e:TouchEvent):void
		{
			stage.removeEventListener(TouchEvent.TOUCH_MOVE, onTouchMove);
			stage.removeEventListener(TouchEvent.TOUCH_END, onTouchEnd);
			//games.Players.x = 50;
		}*/
						
	}
	
}
