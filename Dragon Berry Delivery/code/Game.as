package code 
{
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.events.*;
	//import flash.display.*;
	//import flash.display;

	//@author: Rebecca Vessal
	//Instructor: Professor Jefferson
	//Date: 29 October 2011
	//
	//Game.as handles adding things onto the screen
	//and constantly updating the game
	public class Game extends MovieClip
	{
		public var interactiveEnvironmentLayer:Sprite;
		public var riverLayer:Sprite;
		//public var berryLayer:Sprite;
		//public var eggLayer:Sprite;
		//public var flourLayer:Sprite;
		
		//Declare main layers for the game
		public var skyLayer:Sprite;
		public var cloudsLayer:Sprite;
		public var treesLayer:Sprite;
		public var playerLayer:Sprite;
		public var ingredientsLayer:Sprite;
		public var attacksLayer:Sprite;
		public var grassLayer:Sprite;
		public var navButtonLayer:Sprite;
		public var buttonLayer:Sprite;
		public var textLayer:Sprite;
		
		//Declare obstacle layer
		public var obstaclesLayer:Sprite;
		
		//Declare background instance
		public var backGround:Background;
		public var tree:Trees;
		public var pond:Pond;
		//Declare player instance
		private var player:Player;
		
		//Declare text instance
		public var listText:Text;
		//Declare attack button instances
		public var fireButton:FireButton;
		private var waterButton:WaterButton;
		private var windButton:WindButton;
		//Declare inactive attack button instances
		//private var inactiveFireButton:NonActiveFireBtn;
		//Declare ingredient instances
		private var wheats:Wheat;
		private var egg:Egg;
		public var berry:Berry;
		public var milk:Milk;
		//Declare background elements instance
		public var volcanos:Volcano;
		//Declare obstacles instances
		public var chicken:Chicken;
		public var cow:Cow;
		//Declare pause button instance
		//public var pauseButton:PauseButton;
		public var gameStart:Boolean;
		
		//Create an array for the player
		public var playerArray:Array;
		//Create an array for active buttons
		public var activeButtonArray:Array;
		//Create an array for ingredients
		public var ingredientsArray:Array;
		//Create an array for the obstacles
		public var obstaclesArray:Array;
		//Create an array to keep all of the game layers
		public var gameLayerArray:Array;
		
		//Create an instace of xml to hold
		//loaded xml data
		private var levelsXML:XML;
		//Create a variable for keeping track of the levels
		public var currentLevel:int;
		
		public function Game(xml:XML) 
		{
			// constructor code
			trace(this + " created");
			//super(aDocument);
			playerArray = new Array();
			activeButtonArray = new Array();
			ingredientsArray = new Array();
			obstaclesArray = new Array();
			gameLayerArray = new Array();
			//Initialize the current level to be 0
			currentLevel = 0;
			//Store the loaded XML data into the levelsXML
			levelsXML = xml;
			
		}
		
		//Begin the game by setting it up
		public function begin():void
		{
		
			//Initialize background, player, navigation buttons, obstacles,
			//ingredients, and listText instances
			backGround = new Background();
			player = new Player(this, levelsXML, levelsXML.level[currentLevel].player.x, 
								levelsXML.level[currentLevel].player.y, 
								levelsXML.level[currentLevel].player.width, 
								levelsXML.level[currentLevel].player.height);
			tree = new Trees(levelsXML.level[currentLevel].background[0].tree.x,
							 levelsXML.level[currentLevel].background[0].tree.y,
							 levelsXML.level[currentLevel].background[0].tree.width,
							 levelsXML.level[currentLevel].background[0].tree.height);
			if(currentLevel == 0)
			{
				wheats = new Wheat(levelsXML.level[currentLevel].wheat.x, 
								   levelsXML.level[currentLevel].wheat.y, 
								   levelsXML.level[currentLevel].wheat.width, 
								   levelsXML.level[currentLevel].wheat.height);
				volcanos = new Volcano(this, player, levelsXML,
									   levelsXML.level[currentLevel].volcano.x, 
									   levelsXML.level[currentLevel].volcano.y,
									   levelsXML.level[currentLevel].volcano.width,
									   levelsXML.level[currentLevel].volcano.height);
				chicken = new Chicken(levelsXML.level[currentLevel].chicken.x, 
									  levelsXML.level[currentLevel].chicken.y, 
									  levelsXML.level[currentLevel].chicken.width, 
									  levelsXML.level[currentLevel].chicken.height);
				egg = new Egg(levelsXML.level[currentLevel].egg.x, 
							  levelsXML.level[currentLevel].egg.y, 
							  levelsXML.level[currentLevel].egg.width, 
							  levelsXML.level[currentLevel].egg.height);
			}
			else if(currentLevel == 1)
			{
				backGround.clouds = new Cloud(this, player, levelsXML,
											  levelsXML.level[currentLevel].background[0].cloud.x,
											  levelsXML.level[currentLevel].background[0].cloud.y,
											  levelsXML.level[currentLevel].background[0].cloud.width,
											  levelsXML.level[currentLevel].background[0].cloud.height);
				berry = new Berry(levelsXML.level[currentLevel].berry.x, 
								  levelsXML.level[currentLevel].berry.y,
								  levelsXML.level[currentLevel].berry.width,
								  levelsXML.level[currentLevel].berry.height);
			}
			else if(currentLevel == 2)
			{
				cow = new Cow(levelsXML.level[currentLevel].cow.x,
							  levelsXML.level[currentLevel].cow.y,
							  levelsXML.level[currentLevel].cow.width,
							  levelsXML.level[currentLevel].cow.height);
							  trace("Cow's x: " + levelsXML.level[currentLevel].cow.x);
				pond = new Pond(this, player, levelsXML,
								levelsXML.level[currentLevel].background[0].pond.x,
								levelsXML.level[currentLevel].background[0].pond.y,
								levelsXML.level[currentLevel].background[0].pond.width,
								levelsXML.level[currentLevel].background[0].pond.height);
				milk = new Milk(levelsXML.level[currentLevel].milk.x,
								levelsXML.level[currentLevel].milk.y,
								levelsXML.level[currentLevel].milk.width,
								levelsXML.level[currentLevel].milk.height);
			}
			//pauseButton = new PauseButton(levelsXML.level[currentLevel].pauseButton.x,
										  //levelsXML.level[currentLevel].pauseButton.y,
										  //levelsXML.level[currentLevel].pauseButton.width,
										  //levelsXML.level[currentLevel].pauseButton.height);
			listText = new Text();
			//Add them to the display list
			addChild(backGround);
			addChild(player);
			
			//Add the player to the player array
			playerArray.push(player);
			if(currentLevel == 0)
			{
				//Add the chicken and the tree to the obstacles array
				obstaclesArray.push(chicken);
			}
			else if(currentLevel == 2)
			{
				obstaclesArray.push(cow);
			}
			obstaclesArray.push(tree);
			
			trace("Current Level: " + currentLevel);
			//Initalize the background
			backGround.init(levelsXML, currentLevel);
			
			//Add objects to the stage
			addThingsToStage();
			
			//Initialize the needed ingredients list
			listText.initializeIngredientList(levelsXML,currentLevel);
			
			
			//Launch an event for constanting updating the game
			addEventListener(Event.ENTER_FRAME, update);
			
			
			
		}
		
		//Set up layer order for objects and add objects to the stage
		private function addThingsToStage():void
		{
			
			//Initialize the layers
			skyLayer = new Sprite();
			cloudsLayer = new Sprite();
			interactiveEnvironmentLayer = new Sprite();
			treesLayer = new Sprite();
			playerLayer = new Sprite();
			ingredientsLayer = new Sprite();
			obstaclesLayer = new Sprite();
			attacksLayer = new Sprite();
			grassLayer = new Sprite();			
			buttonLayer = new Sprite();
			textLayer = new Sprite();
			
			//Add the layers in the correct order
			addChild(skyLayer);
			addChild(cloudsLayer);
			addChild(interactiveEnvironmentLayer);
			addChild(treesLayer);
			addChild(playerLayer);
			addChild(ingredientsLayer);
			addChild(obstaclesLayer);
			addChild(attacksLayer);
			addChild(grassLayer);
			addChild(buttonLayer);
			addChild(textLayer);
			
			//Bitmap cache game objects
			//backGround.Skys.cacheAsBitmap = true;
			//backGround.Clouds.cacheAsBitmap = true;
			//backGround.Treess.cacheAsBitmap = true;
			//backGround.Grasses.cacheAsBitmap = true;
			//listText.cacheAsBitmap = true;
			
			//Add the correct objects to the layers
			//to get the objects in the desired order
			skyLayer.addChild(backGround.Skys);
			if(currentLevel == 0)
			{
				interactiveEnvironmentLayer.addChild(volcanos);
				ingredientsLayer.addChild(wheats);
				obstaclesLayer.addChild(chicken);
			}
			else if(currentLevel == 1)
			{
				cloudsLayer.addChild(backGround.Clouds);
				ingredientsLayer.addChild(berry);
				//trace("Clouds: " + backGround.Clouds.x);
			}
			else if(currentLevel == 2)
			{
				interactiveEnvironmentLayer.addChild(pond);
				obstaclesLayer.addChild(cow);
			}
			treesLayer.addChild(tree);
			playerLayer.addChild(player);
			
			grassLayer.addChild(backGround.Grasses);
			//buttonLayer.addChild(inactiveFireButton);
			//buttonLayer.addChild(waterButton);
			//buttonLayer.addChild(windButton);
			textLayer.addChild(listText);
			//buttonLayer.addChild(pauseButton);
			
			//Add all of the layers onto the gameLayerArray
			gameLayerArray.push(skyLayer);
			gameLayerArray.push(cloudsLayer);
			gameLayerArray.push(interactiveEnvironmentLayer);
			gameLayerArray.push(treesLayer);
			gameLayerArray.push(playerLayer);
			gameLayerArray.push(ingredientsLayer);
			gameLayerArray.push(obstaclesLayer);
			gameLayerArray.push(attacksLayer);
			gameLayerArray.push(grassLayer);
			gameLayerArray.push(buttonLayer);
			gameLayerArray.push(textLayer);
			
			
		}
		
		//Update player movements and attacks as neccessary
		private function update(e:Event):void
		{
			/*trace((parent as Document).currentLabel);
			if((parent as Document).currentLabel == "Winning")
			{
				(parent as Document).gotoAndStop("Games");
			}*/
			//trace("Player: " + playerLayer.contains(player));
			/*if(backGround.Clouds)
			{
				//trace("Wind Dragon: " + backGround.Clouds.transformed);
			}*/
			if(volcanos.transformed)
			{
				//Check to see if the player has transformed into a fire dragon
				moveFireDragonOnScreen();
			}
			
			//If player has not transformed
			else if(playerLayer.contains(player))
			{
				//trace("Player:" + player);
				//Move the player
				player.move();
				if(currentLevel == 0)
				{
					//Check for collisions				
					player.collision(wheats, "wheat");
				}
				
			}
			if(currentLevel == 2)
			{
				if(interactiveEnvironmentLayer.contains(pond))
				{
					//trace("Water Dragon transformed: " + pond.transformed);
					if(pond.transformed)
					{
						moveWaterDragonOnScreen();
					}
				}
			}
			//if(currentLevel == 1)
			//{
				if(backGround.Clouds)
				{
					if(backGround.Clouds.transformed)
					{
						//trace("Wind Dragon!!!!!");
						moveWindDragonOnScreen();
					}
				}
			//}
			
			
			//Check to see if the player has won
			win();
			
		}
		
		private function moveFireDragonOnScreen():void
		{
			
			//If the button layer does contain a fire button 
			if(activeButtonArray[0] != null)
			{
				//Check to see if player clicked on the active fire button
				fireButton.shoot();
				//Move the fireball if player has clicked on the active fire button
				if(fireButton.attack)
				{
					//trace("Update fireball: " + fireButton.fireBall);
					//If fireball exists
					if(fireButton.fireBall != null)
					{
						fireButton.updateFireBall(chicken);
						//trace("Trees: " + backGround.Treess);
						//fireButton.updateFireBall(backGround.Treess);
					}
				}
				
			}
			//If the button layer does not contain a active fire button yet
			else
			{
				//trace("FireButton: " + fireButton);
				if(fireButton == null)
				{
					//Intilize the active fireButton
					fireButton = new FireButton(this, volcanos.fireDragon, 
												levelsXML.level[currentLevel].fireButton.x, 
												levelsXML.level[currentLevel].fireButton.y, 
												levelsXML.level[currentLevel].fireButton.width,
												levelsXML.level[currentLevel].fireButton.height);
					//Bitmap cache the fire button
					//fireButton.cacheAsBitmap = true;
					//Add the active fire button onto the button layer
					buttonLayer.addChild(fireButton);
					//trace("Button Layer contains FireButton: " + buttonLayer.contains(fireButton));
					//Add the firebutton onto the active button array
					activeButtonArray.push(fireButton);
				}
				
			}
			//Check for input from player
			
			//Move the fire dragon
			volcanos.fireDragon.moveFireDragon();
			//Check for collisions
			volcanos.fireDragon.collision(wheats, "wheat");
			//Check to see if the chicken is removed from the stage
			//first before checking to detect collision between egg and player
			//trace("Obstacles Layer: " + obstaclesLayer.contains(chicken));
			if(obstaclesLayer.contains(chicken) == false)
			{
				
				//Check to see if the ingredients layer does not have an egg
				if(ingredientsLayer.contains(egg) == false && ingredientsArray.length == 0)
				{
					//Add the egg onto the ingredients layer
					ingredientsLayer.addChild(egg);
					//Set tempEgg to true
					//tempEgg = true;
					ingredientsArray.push(egg);
					//trace("IngredientsLayer length: " + ingredientsArray.length);
					
				}
				
				//Check for collisions between fire dragon and egg
				volcanos.fireDragon.collision(egg, "egg");
			}
				
			
		}
		
		private function moveWindDragonOnScreen():void
		{
			
			//If the button layer does contain a fire button 
			if(activeButtonArray[0] != null)
			{
				//Move the fireball if player has clicked on the active fire button
				if(windButton.attack)
				{
					//trace("Update fireball: " + fireButton.fireBall);
					//If fireball exists
					if(windButton.wind != null)
					{
						windButton.updateWind(tree);
						//trace("Trees: " + backGround.Treess);
						//fireButton.updateFireBall(backGround.Treess);
					}
				}
				
			}
			//If the button layer does not contain a active fire button yet
			else
			{
				//trace("FireButton: " + fireButton);
				if(windButton == null)
				{
					//Intilize the active fireButton
					windButton = new WindButton(this, backGround.Clouds.windDragon, 
												levelsXML.level[currentLevel].windButton.x, 
												levelsXML.level[currentLevel].windButton.y, 
												levelsXML.level[currentLevel].windButton.width,
												levelsXML.level[currentLevel].windButton.height);
					//Bitmap cache the fire button
					//fireButton.cacheAsBitmap = true;
					//Add the active fire button onto the button layer
					buttonLayer.addChild(windButton);
					//trace("Button Layer contains FireButton: " + buttonLayer.contains(fireButton));
					//Add the firebutton onto the active button array
					activeButtonArray.push(windButton);
				}
				
			}
			//Check for input from player
			
			//Move the fire dragon
			if(backGround.Clouds.windDragon != null)
			{
				//trace("Wind Dragon: " + backGround.Clouds.windDragon);
				backGround.Clouds.windDragon.moveWindDragon();
				
				//Check for collisions
				backGround.Clouds.windDragon.collision(berry, "berry");
			}
			//Check to see if the chicken is removed from the stage
			//first before checking to detect collision between egg and player
			//trace("Obstacles Layer: " + obstaclesLayer.contains(chicken));
			if(obstaclesLayer.contains(tree) == false)
			{
				//Check for collisions between wind dragon and berry
				backGround.Clouds.windDragon.collision(berry, "berry");
			}
				
			
		}
		
		private function moveWaterDragonOnScreen():void
		{
			
			//If the button layer does contain a fire button 
			if(activeButtonArray[0] != null)
			{
				//Check to see if the player click on the water button
				waterButton.shoot();
				//Move the fireball if player has clicked on the active fire button
				if(waterButton.attack)
				{
					//trace("Update fireball: " + fireButton.fireBall);
					//If fireball exists
					if(waterButton.waterBall != null)
					{
						waterButton.updateWaterBall(cow);
						//trace("Trees: " + backGround.Treess);
						//fireButton.updateFireBall(backGround.Treess);
					}
				}
				
			}
			//If the button layer does not contain a active fire button yet
			else
			{
				//trace("FireButton: " + fireButton);
				if(waterButton == null)
				{
					//Intilize the active fireButton
					waterButton = new WaterButton(this, pond.waterDragon, 
												levelsXML.level[currentLevel].waterButton.x, 
												levelsXML.level[currentLevel].waterButton.y, 
												levelsXML.level[currentLevel].waterButton.width,
												levelsXML.level[currentLevel].waterButton.height);
					//Bitmap cache the fire button
					//fireButton.cacheAsBitmap = true;
					//Add the active fire button onto the button layer
					buttonLayer.addChild(waterButton);
					//trace("Button Layer contains FireButton: " + buttonLayer.contains(fireButton));
					//Add the firebutton onto the active button array
					activeButtonArray.push(waterButton);
				}
				
			}
			//Check for input from player
			
			//Move the fire dragon
			
			pond.waterDragon.moveWaterDragon();
			
			//Check for collisions
			//pond.waterDragon.collision(milk, "milk");
			//Check to see if the chicken is removed from the stage
			//first before checking to detect collision between egg and player
			//trace("Obstacles Layer: " + obstaclesLayer.contains(chicken));
			if(obstaclesLayer.contains(cow) == false)
			{
				//Check to see if the ingredients layer does not have an milk
				if(ingredientsLayer.contains(milk) == false && ingredientsArray.length == 0)
				{
					//Add the milk onto the ingredients layer
					ingredientsLayer.addChild(milk);
					//Set tempEgg to true
					//tempEgg = true;
					ingredientsArray.push(milk);
					//trace("IngredientsLayer length: " + ingredientsArray.length);
					
				}
				//Check for collisions between wind dragon and berry
				pond.waterDragon.collision(milk, "milk");
			}
				
			
		}
		
		
		//Once the game resets, remove all of the layers from the stage
		public function resetGame():void
		{
			//trace("Before Game Array length: " + gameLayerArray.length);
			if(gameLayerArray.length > 0)
			{
				stopSounds();
				//Remove the layers in the correct order
				removeChild(skyLayer);
				removeChild(cloudsLayer);
				removeChild(interactiveEnvironmentLayer);
				removeChild(treesLayer);
				removeChild(playerLayer);
				removeChild(ingredientsLayer);
				removeChild(obstaclesLayer);
				removeChild(attacksLayer);
				removeChild(grassLayer);
				removeChild(buttonLayer);
				removeChild(textLayer);
				//Remove all event listeners
				removeEventListener(Event.ENTER_FRAME, update);
				if(volcanos.fireDragon != null)
				{
					stage.removeEventListener(KeyboardEvent.KEY_DOWN, volcanos.fireDragon.moveFireDragonPlayer);
					stage.removeEventListener(TouchEvent.TOUCH_MOVE, volcanos.fireDragon.moveFireDragonPlayerTouch);
				}
				else if(backGround.Clouds != null)
				{
					if(backGround.Clouds.windDragon != null)
					{
						stage.removeEventListener(KeyboardEvent.KEY_DOWN, backGround.Clouds.windDragon.moveWindDragonPlayer);
						stage.removeEventListener(TouchEvent.TOUCH_MOVE, backGround.Clouds.windDragon.moveWindDragonPlayerTouch);
					}
				}
				else if(pond != null)
				{
					stage.removeEventListener(KeyboardEvent.KEY_DOWN, pond.waterDragon.moveWaterDragonPlayer);
					stage.removeEventListener(TouchEvent.TOUCH_MOVE, pond.waterDragon.moveWaterDragonPlayerTouch);
				}
				//Pop out the active fire button
				activeButtonArray.pop();
				//Set fire button to null so that it may be readded to the stage when
				//the player transforms to a fire dragon
				fireButton = null;
				windButton = null;
				waterButton = null;
				//Empty out ingredients Array
				ingredientsArray.pop();
				//Empty out the player array
				for(var j:int = 0; j<playerArray.length; j++)
				{
					playerArray.pop();
				}
				//Empty the array
				for(var i:int = 0; i < 12; i++)
				{
					gameLayerArray.pop();
				}
			}
			//trace("After Game Array length: " + gameLayerArray.length);
		}
		
		public function stopSounds():void
		{
			if(currentLevel == 0)
			{
				//Stop all sounds except the for theme music
				if(chicken != null)
				{
					chicken.ChickenSoundChannel.stop();
				}
				if(fireButton != null)
				{
					if(fireButton.fireBall != null)
					{
						fireButton.fireBall.fireBallSoundChannel.stop();
					}
				}
			}
			else if(currentLevel == 1)
			{
				if(windButton != null)
				{
					if(windButton.wind != null)
					{
						windButton.wind.windSoundChannel.stop();
					}
				}
			}
			else if(currentLevel == 2)
			{
				if(cow != null)
				{
					cow.CowSoundChannel.stop();
				}
				if(waterButton != null)
				{
					if(waterButton.waterBall != null)
					{
						waterButton.waterBall.waterBallSoundChannel.stop();
					}
				}
			}
		}
		
		//Once the player has collected all of the ingredients
		//bring them to the winning screen
		public function win():void
		{
			
			//Check to see if needed ingredient list
			//is empty
			if(listText.ingredientsListArray[0] == null)
			{
				if(currentLevel == 0)
				{
					//Stop all sounds except the for theme music
					if(chicken != null)
					{
						chicken.ChickenSoundChannel.stop();
					}
					if(fireButton != null)
					{
						if(fireButton.fireBall != null)
						{
							fireButton.fireBall.fireBallSoundChannel.stop();
						}
					}
				}
				volcanos.transformed = false;
				if(backGround.Clouds)
				{
					if(backGround.Clouds.transformed)
					{
						backGround.Clouds.transformed = false;
					}
				}
				if(pond)
				{
					if(pond.transformed)
					{
						pond.transformed = false;
					}
				}
				//If it is empty proceed to reset the game
				//and go to win screen
				resetGame();
				if(currentLevel == 0)
				{
					//(parent as Document).gotoAndStop("Winning");
					//(parent as Document).addChild(wheat);
					(parent as Document).gotoAndStop("level1Win");
				}
				else if(currentLevel == 1)
				{
					(parent as Document).gotoAndStop("level2Win");
				}
				else if(currentLevel == 2)
				{
					(parent as Document).gotoAndStop("Winning");
				}
				
				NextLevel();
				//document.displayScreen(WinningScreen);
				
			}
		}
		
		public function NextLevel():void
		{
			if(currentLevel != 2)
			{
				currentLevel++;
			}
			/*if(currentLevel == 2)
			{
				currentLevel = 0;
			}*/
		}
		
		//Screen methods ahead
		/*public override function bringIn():void
		{
			//Call the super class bring in
			super.bringIn();
			//Add a MouseEvent.CLICK listener to menu button to call goToPause
			pauseButton.addEventListener(MouseEvent.CLICK, goToPause);
			
		}
		
		private function goToPause(e:MouseEvent):void
		{
			//Stop all sounds except the for theme music
			if(chicken != null)
			{
				chicken.ChickenSoundChannel.stop();
			}
			if(fireButton != null)
			{
				if(fireButton.fireBall != null)
				{
					fireButton.fireBall.fireBallSoundChannel.stop();
				}
			}
			//Reset the game
			resetGame();
			//Tell the document class to display the Controls screen
			document.displayScreen(PauseScreen);
		}
		
		
		public override function cleanUp():void
		{
			//Remove the event listeners on all of the buttons on objective screen
			pauseButton.removeEventListener(MouseEvent.CLICK, goToPause);
			//Call the super class' cleanUP()
			super.cleanUp();
		}*/
		

	}
	
}
