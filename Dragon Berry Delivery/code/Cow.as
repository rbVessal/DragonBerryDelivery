package code 
{
	//@author: Rebecca Vessal
	//Instructor: Professor Jefferson
	//Date: 17 December 2011
	//
	//Cow.as represents the cow movieclip
	//
	import flash.display.MovieClip;
	import sounds.cowMoo;
	import flash.media.SoundChannel;
	
	
	public class Cow extends GameElement
	{
		//Create an instance of cow moo sound
		private var cowSound:cowMoo;
		public var cowSoundChannel:SoundChannel; 
		
		public function Cow(xCoordinate:int, yCoordinate:int, widthCow:int, heightCow:int) 
		{
			// constructor code
			//Pass along the passed in parameters to game element
			super(xCoordinate, yCoordinate, widthCow, heightCow);
			//Initialize the chicken sound
			cowSound = new cowMoo();
			//Initialize the chicken sound channel and play the chicken sound
			cowSoundChannel = cowSound.play(0,9999);
			//cacheAsBitmap = true;
			//Play the chicken sound
			//chickenSoundChannel.play(0, 9999);
		}
		
		//Create an accessor for chickenSound
		public function get CowSound():cowMoo
		{
			return cowSound;
		}
		//Create an accessor for chickenSoundChannel
		public function get CowSoundChannel():SoundChannel
		{
			return cowSoundChannel;
		}
	}
	
}
