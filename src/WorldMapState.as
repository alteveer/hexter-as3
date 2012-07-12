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
			
			_selected_tile = _current_tile = hex_map.starting_tile
			_selected_tile.play("on")
			var _st:FlxPoint = hex_map.starting_tile.getMidpoint()
			trace(_st.x, _st.y)
			FlxG.camera.follow(player)
			player.x = _st.x - (player.width/2)
			player.y = _st.y - (player.height/2)
			
			add(hex_map)
			add(title)
			add(player)
			
		}
		
		protected var _current_tile_neighbors:Array = []
		protected var _current_tile:HexTile
		protected var _selected_tile:HexTile
		
		private var __tiles:Array = []
		override public function update():void {
			super.update();
		   	if (FlxG.keys.justReleased("RIGHT")) {
				__tiles = hex_map.neighbors(_selected_tile).filter(
					function(n:HexTile, index:int, array:Array):Boolean {
						return n.grid_x > _selected_tile.grid_x
						
					}
				)
				
				if (__tiles.length > 0) {
					trace(__tiles.join())
					select(__tiles[0])
				}
				//player.facing = FlxObject.RIGHT
			} else if(FlxG.keys.justReleased("LEFT")) {
				__tiles = hex_map.neighbors(_selected_tile).filter(
					function(n:HexTile, index:int, array:Array):Boolean {
						return n.grid_x < _selected_tile.grid_x
						
					}
				)
				
				if (__tiles.length > 0) {
					trace(__tiles.join())
					select(__tiles[0])
				}
				//player.facing = FlxObject.LEFT
				
			} else {
				//player.play("idle_dr")
			}
			if (FlxG.keys.justReleased("UP")) {
				__tiles = hex_map.neighbors(_selected_tile).filter(
					function(n:HexTile, index:int, array:Array):Boolean {
						return n.grid_x == _selected_tile.grid_x && n.grid_y < _selected_tile.grid_y
						
					}					
				)
				if (__tiles.length > 0) {
					trace(__tiles.join())
					select(__tiles[0])
				}

			} else if (FlxG.keys.justReleased("DOWN")) {
				__tiles = hex_map.neighbors(_selected_tile).filter(
					function(n:HexTile, index:int, array:Array):Boolean {
						return n.grid_x == _selected_tile.grid_x && n.grid_y > _selected_tile.grid_y
						
					}
				)
				if (__tiles.length > 0) {
					trace(__tiles.join())
					select(__tiles[0])
				}
			}

			
		}
		
		protected function select(Tile:HexTile):void {
			_selected_tile.play("off")
			_selected_tile = Tile
			_selected_tile.play("on")
		}
		
	}

}