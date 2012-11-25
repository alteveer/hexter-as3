package  
{
	import org.flixel.FlxBasic;
	import org.flixel.FlxCamera;
	import org.flixel.FlxObject;
	import org.flixel.FlxRect;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.FlxTilemap;
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
		protected var map:HexMap
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

			map = new HexMap(13, 15)
			
			player = new FlxSprite()
			player.loadGraphic(Character01, true, true, 16, 32)
			player.addAnimation("idle_dr", [0], 6, false)
			player.addAnimation("idle_ur", [3], 6, false)
			player.addAnimation("walk_dr", [1,2], 6, false)
			player.addAnimation("walk_ur", [4,5], 6, false)
			
			var _st:FlxPoint = map.selected_tile.getMidpoint()
			trace(_st.x, _st.y)
			//FlxG.camera.setBounds(0, 0, FlxG.width, FlxG.height);
			FlxG.camera.follow(map.selected_tile, FlxCamera.STYLE_TOPDOWN_TIGHT)
			FlxG.camera.deadzone = new FlxRect(FlxG.width / 4, FlxG.height / 4, FlxG.width / 2, FlxG.height / 2)
			//FlxG.camera.s
			
			player.x = _st.x - (player.width/2)
			player.y = _st.y - (player.height/2)
			_current_tile = map.selected_tile
			
			add(map)
			add(title)
			add(player)
			
		}
		
		protected var _current_tile_neighbors:Array = []
		protected var _current_tile:HexTile
		
		private var __tiles:Array = []
		override public function update():void {
			super.update();
			FlxG.camera.update()
			
			
		   	if (FlxG.keys.justReleased("RIGHT")) {
				if (map.neighbors()[HexMap.N_UR]) {
					map.selected_tile = map.neighbors()[HexMap.N_UR]
				} else if (map.neighbors()[HexMap.N_DR]) {
					map.selected_tile = map.neighbors()[HexMap.N_DR]
				}

			} else if(FlxG.keys.justReleased("LEFT")) {
				if (map.neighbors()[HexMap.N_UL] && map.selected_tile != map.neighbors()[HexMap.N_UL]) {
					map.selected_tile = map.neighbors()[HexMap.N_UL]
				} else if (map.neighbors()[HexMap.N_DL]) {
					map.selected_tile = map.neighbors()[HexMap.N_DL]
				}
					
			} else {
				//player.play("idle_dr")
			}
			if (FlxG.keys.justReleased("UP")) {
				if (map.neighbors()[HexMap.N_UP]) {
					map.selected_tile = map.neighbors()[HexMap.N_UP]
				}
			} else if (FlxG.keys.justReleased("DOWN")) {
				if (map.neighbors()[HexMap.N_DN]) {
					map.selected_tile = map.neighbors()[HexMap.N_DN]
				}
				
			}
			
			FlxG.camera.target = map.selected_tile

		}
		

	}

}