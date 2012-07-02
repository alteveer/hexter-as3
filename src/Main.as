package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import org.flixel.FlxGame;
	
	/**
	 * ...
	 * @author robots
	 */
	public class Main extends FlxGame 
	{
		
		public static var FADE_IN_TIME:Number = 0.4;
		public static var FADE_OUT_TIME:Number = 0.2;
		
		[Embed(source="../assets/fonts/04b_25__.ttf", fontFamily="Title", embedAsCFF="false")] 	
		//[Embed(source="../assets/fonts/pixelanky_CE_DEMO.TTF", fontFamily="h1", embedAsCFF="false")] 	
		//[Embed(source="../assets/fonts/m39.TTF", fontFamily="Title", embedAsCFF="false")] 	
		//[Embed(source="../assets/fonts/Skinny.ttf", fontFamily="Title", embedAsCFF="false")] 	
		//[Embed(source="../assets/fonts/snakebold.ttf", fontFamily="Title", embedAsCFF="false")] 	
		//[Embed(source="../assets/fonts/bitdust1.ttf", fontFamily="Title", embedAsCFF="false")] 	
		public static var FontTitle:String;
		
		[Embed(source="../assets/fonts/04B_03__.TTF", fontFamily="Body", embedAsCFF="false")] 	
		//[Embed(source="../assets/fonts/bitdust1.ttf", fontFamily="Body", embedAsCFF="false")] 	
		public static var FontBody:String;
		
		[Embed(source="../assets/fonts/Bangalor.ttf", fontFamily="script", embedAsCFF="false")] 	
		public static var FontScriptTitle:String;
		
		public static const WIDTH:Number = 	640;
		public static const HEIGHT:Number = 400;
		
		public function Main():void 
		{
			super(WIDTH, HEIGHT, WorldMapState, 2)
		}
		
	}
	
}