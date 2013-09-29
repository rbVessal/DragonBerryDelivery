package code 
{
	//@author: Rebecca Vessal
	//Instructor: Professor Jefferson
	//Date: 15 November 2011
	//
	//Text.as updates ingredients needed and obtained as the player collects the ingredients
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	
	public class Text extends Sprite
	{
		//Create textfields variables
		public var ingredientsObtained_txt:TextField;
		public var ingredientsList_txt:TextField;
		//Create arrays to store the ingredients
		private var ingredientsObtainedArray:Array;
		public var ingredientsListArray:Array;
		//Create an instance of xml
		private var levelsXML:XML;
		
		public function Text() 
		{
			cacheAsBitmap = true;
			// constructor code
			//Intialize the arrays
			ingredientsObtainedArray = new Array();
			ingredientsListArray = new Array();
		}
		//Initialize the ingredient list
		public function initializeIngredientList(xml:XML, currentLevel:int):void
		{
			//Intialize the xml
			levelsXML = xml;
			if(currentLevel == 0)
			{
				//Push the ingredients needed into the array
				ingredientsListArray.push(levelsXML.level[currentLevel].ingredients.egg);
				ingredientsListArray.push(levelsXML.level[currentLevel].ingredients.wheat);
			}
			if(currentLevel == 1)
			{
				ingredientsListArray.push(levelsXML.level[currentLevel].ingredients.berry);
			}
			if(currentLevel == 2)
			{
				ingredientsListArray.push(levelsXML.level[currentLevel].ingredients.milk);
			}
			//Create a temp textfield to use for updating the ingredients obtained
			//textfield
			var temp_txt:TextField = new TextField();
			//Initialize temp textfield
			temp_txt.text = "Ingredients\nNeeded: ";
			//Update the temp textfield
			for(var i:int = 0; i<ingredientsListArray.length; i++)
			{
				//trace("Ingredients Obtained Array: " + ingredientsListArray[i]);
				temp_txt.appendText(ingredientsListArray[i] + "\n");
				
				//trace("Ingredients Obtained: " + ingredientsList_txt.text);
			}
			//Initialize the ingredients needed list
			ingredientsList_txt.text = temp_txt.text;
			/*var support_txt:TextField = new TextField();
			support_txt.text = "";
			support_txt.appendText(Multitouch.supportedGestures);*/
		}
		
		//Remove ingredients from the needed ingredients list as the
		//player collects the ingredients
		public function removeIngredientList(nameOfIngredientObtained:String):void
		{
			//Create a temp index
			var tempIndex:int;
			//Search for the ingredient in the ingredientsList array
			for(var i:int = 0; i<ingredientsListArray.length; i++)
			{
				if(ingredientsListArray[i] == nameOfIngredientObtained)
				{
					tempIndex = i;
				}
			}
			//Remove obtained ingredient from the array
			ingredientsListArray.splice(tempIndex, 1);
			//Create a temp textfield to use for updating the ingredients obtained
			//textfield
			var temp_txt:TextField = new TextField();
			//Initialize temp textfield
			temp_txt.text = "Ingredients\nNeeded: ";
			//Update the temp textfield
			for(var j:int = 0; j<ingredientsListArray.length; j++)
			{
				//trace("Ingredients Obtained Array: " + ingredientsListArray[i]);
				temp_txt.appendText(ingredientsListArray[j] + "\n");
				
				//trace("Ingredients Obtained: " + ingredientsList_txt.text);
			}
			//Update the ingredients needed list
			ingredientsList_txt.text = temp_txt.text;
		}
		
		//Update the obtained ingredients once the player obtains them
		public function obtainedIngredients(nameOfIngredientObtained:String):void
		{
			//Push obtained ingredient into the array
			ingredientsObtainedArray.push(nameOfIngredientObtained);
			//Create a temp textfield to use for updating the ingredients obtained
			//textfield
			var temp_txt:TextField = new TextField();
			//Initialize temp textfield
			temp_txt.text = "Ingredients\nObtained: ";
			//Update the temp textfield
			for(var i:int = 0; i<ingredientsObtainedArray.length; i++)
			{
				trace("Ingredients Obtained Array: " + ingredientsObtainedArray[i]);
				temp_txt.appendText(ingredientsObtainedArray[i] + "\n");
				
				trace("Ingredients Obtained: " + ingredientsObtained_txt.text);
			}
			//Update the ingredients obtained list
			ingredientsObtained_txt.text = temp_txt.text;
			//Remove the ingredient from the needed ingredients list
			removeIngredientList(nameOfIngredientObtained);
			
		}
	}
	
}
