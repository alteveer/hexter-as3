package  
{
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	
	/**
	 * ...
	 * @author robots
	 */
	public class WorldMapState extends FlxState 
	{
		protected var hex_map:HexMap
		protected var title:FlxText

		public static var TEXT_MARGIN:Number = 12
		
		public function WorldMapState() 
		{
			FlxG.flash(0xff000000, Main.FADE_IN_TIME)
			title = new FlxText(TEXT_MARGIN, TEXT_MARGIN, FlxG.width, "test")
			title.size = 24
			title.font = "Title"
			title.scrollFactor = new FlxPoint()

			hex_map = new HexMap(5, 5)
			
			add(hex_map)
			add(title)
		}
		
	}

}