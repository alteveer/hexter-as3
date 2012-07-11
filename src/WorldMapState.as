package  
{
	import org.flixel.FlxBasic;
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
	
		/*  what is going on here?
		 * 
		 *       |--------------| tile_width 
		 *                          --- 
		 *                           | top_left_height_offset
		 *                           |
		 *  ---       ----------    ---   ---
		 *   |      /            \         |  alternate_column_height_offset
		 *   |     /   tile       \       ---
		 *   |     \  (x:0, y:0)  /  -----------
		 *   |      \            / /             \
		 *  ---       ----------  /   tile        \
		 *    tile_height         \  (x:1, y:1)   /
		 *                         \             /
		 *                           -----------
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
			
		}
		override public function create():void 
		{
			//super.create();
			FlxG.flash(0xff000000, Main.FADE_IN_TIME)
			title = new FlxText(TEXT_MARGIN, TEXT_MARGIN, FlxG.width, "test")
			title.size = 24
			title.font = "Title"
			title.scrollFactor = new FlxPoint(0,0)
			//title.scrollFactor = new FlxPoint()

			hex_map = new HexMap(13, 15)
			
			player = new FlxSprite()
			player.loadGraphic(Character01, true, true, 16, 32)
			player.addAnimation("idle_dr", [0], 6, false)
			player.addAnimation("idle_ur", [3], 6, false)
			player.addAnimation("walk_dr", [1,2], 6, false)
			player.addAnimation("walk_ur", [4,5], 6, false)
			
			var _st:FlxPoint = hex_map.starting_tile.getMidpoint()
			trace(_st.x, _st.y)
			FlxG.camera.focusOn(_st)
			player.x = _st.x - (player.width/2)
			player.y = _st.y - (player.height/2)
			
			add(hex_map)
			add(title)
			add(player)
			
			for each (var h:HexTile in hex_map.neighbors(hex_map.starting_tile.grid_x, hex_map.starting_tile.grid_y)) {
				trace(h)
				h.toggle()
			}
			
			
		}
		
		override public function update():void {
			super.update();
		   	
			
		}
		
	}

}