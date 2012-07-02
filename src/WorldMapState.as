package  
{
	import org.flixel.FlxCamera;
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.system.input.Mouse;
	
	/**
	 * ...
	 * @author robots
	 */
	public class WorldMapState extends FlxState 
	{
		protected var hex_map:HexMap
		protected var title:FlxText
		
		[Embed(source="../assets/char01.png")]
		public static var Character01:Class

		public static var TEXT_MARGIN:Number = 12
		protected var camera:FlxCamera
		protected var player:FlxSprite
		
		public function WorldMapState() 
		{
			FlxG.flash(0xff000000, Main.FADE_IN_TIME)
			title = new FlxText(TEXT_MARGIN, TEXT_MARGIN, FlxG.width, "test")
			title.size = 24
			title.font = "Title"
			//title.scrollFactor = new FlxPoint()

			camera = new FlxCamera(0, 0, Main.WIDTH, Main.HEIGHT);
			FlxG.addCamera(camera)
			camera.focusOn(new FlxPoint(600, 1000))
			
			hex_map = new HexMap(20, 20)
			
			player = new FlxSprite()
			player.loadGraphic(Character01, true, true, 16, 32)
			player.addAnimation("idle_dr", [0], 6, false)
			player.addAnimation("idle_ur", [3], 6, false)
			player.addAnimation("walk_dr", [1,2], 6, false)
			player.addAnimation("walk_ur", [4,5], 6, false)
			
			var _st:FlxPoint = hex_map.starting_tile.getMidpoint()
			trace(_st.x, _st.y)
			player.x = _st.x - (player.width/2)
			player.y = _st.y - (player.height/2) + 4
			FlxG.mouse.show()
			add(hex_map)
			add(title)
			add(player)
		
		}
		override public function update():void {
			super.update();
			
			
		}
		
	}

}