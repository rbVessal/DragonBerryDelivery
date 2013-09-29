package code
{
	//@author: Rebecca Vessal
	//Instructor: Professor Jefferson
	//Date: 29 October 2011
	//
	//Background.as handles side scrolling for all background elements
	//
	
	import flash.display.MovieClip;
	import flash.display.*;
	
	public class Background extends GameElement
	{
		//Declare background elements
		//as background attributes
		private var skys:Sky;
		public var clouds:Cloud;
		//private var treess:Trees;
		private var grasses:Grass;
		//Declare an instance of xml
		private var levelsXML:XML;
		
		//Default constructor
		public function Background() 
		{
			// constructor code
			super(x, y, width, height);
			cacheAsBitmap = true;
			
		}
		
		//Initialize the background elements
		public function init(xml:XML, currentLevel:int):void
		{
			//Intialize the xml
			levelsXML = xml;
			//Intialize the background elements
			skys = new Sky(0,0);
			//trace("XML: " + levelsXML);
			//trace("Background current level: " + currentLevel);
			//trace("Tree: " + treess);
			//trace(levelsXML.level[currentLevel]);
			/*treess = new Trees(levelsXML.level[currentLevel].background.tree[0].x, 
							   levelsXML.level[currentLevel].background.tree[0].y, 
							   levelsXML.level[currentLevel].background.tree[0].width, 
							   levelsXML.level[currentLevel].background.tree[0].height);*/
			grasses = new Grass(0, stage.stageHeight*.5, 
								levelsXML.level[currentLevel].background.grass.width, 
								levelsXML.level[currentLevel].background.grass.height);
			/*clouds = new Cloud(levelsXML.level[currentLevel].background.cloud.x, 
							   levelsXML.level[currentLevel].background.cloud.y, 
							   levelsXML.level[currentLevel].background.cloud.width, 
							   levelsXML.level[currentLevel].background.cloud.height);*/
			//Add them to background 
			addChild(skys);
			//addChild(treess);
			addChild(grasses);
			//addChild(clouds);
		}
		
		//Create accessor for background's attributes
		public function get Skys():Sky
		{
			return skys;
		}
		
		/*public function get Treess():Trees
		{
			return treess;
		}*/
		
		public function get Grasses():Grass
		{
			return grasses;
		}
		
		public function get Clouds():Cloud
		{
			return clouds;
		}
		
		//Create mutators to give the option of changing coordinates/dimensions
		/*public function set Cloud(widthCloud:int, heightCloud:int)
		{
			cloud.width = widthCloud;
			cloud.height = heightCloud;
		}*/

	}
	
}
