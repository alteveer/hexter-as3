package  
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.FlxText;
	/**
	 * ...
	 * @author robots
	 */
	public class HexMap extends FlxGroup
	{
		public static var TILE_WIDTH:Number = 48
		public static var TILE_HEIGHT:Number = 32
		public static var GRAPHIC_WIDTH:Number = 64
		public static var GRAPHIC_HEIGHT:Number = 64
		              
		public static var TLHO:Number = 32 // "t.op l.eft h.eight o.ffset"
		public static var ACHO:Number = 16 // "a.lternate c.olumn h.eight o.ffset"
		
		public var tiles:Array = []
		public var starting_tile:HexTile
		
		public var map_width:Number
		public var map_height:Number

		public function HexMap(_mw:Number, _mh:Number) 
		{
			super();
			
			map_width = _mw
			map_height = _mh
			
			var tile:HexTile
			var title:FlxText
			var x:Number, y:Number
			for (y = 0; y < map_height; y++) {
				tiles[y] = []
				for (x = 0; x < map_width; x++) {
					tile = new HexTile(x, y)
					tiles[y][x] = tile
					title = new FlxText(x * TILE_WIDTH + (TILE_WIDTH/2), y * TILE_HEIGHT + (ACHO * (x%2)) + (TILE_HEIGHT * 1.3), 200, x + " " + y)
					//tile.loadGraphic(hex_tiles
					add(tile)
					//trace(x, y)
					add(title)
				}
			}
			
			starting_tile = tiles[Math.round(_mh / 2)][Math.round(_mw / 2)]
			
		}
		private var _neighbors:Array;
		public function neighbors(Tile:HexTile):Array {
			_neighbors = [];
			var __x:Number = Tile.grid_x
			var __y:Number = Tile.grid_y
			
			if (tiles[__y] == null || tiles[__y][__x] == null) {
				return null
			}
			if (tiles[__y + 1]) {
				_neighbors.push(tiles[__y + 1][__x])
			
				if (__x % 2 == 1) {
					if (tiles[__y + 1][__x + 1]) {
						_neighbors.push(tiles[__y + 1][__x + 1])
					}
					if (tiles[__y + 1][__x - 1]) {
						_neighbors.push(tiles[__y + 1][__x - 1])
					}
				}
			}	

			if(tiles[__y - 1]) {
				_neighbors.push(tiles[__y - 1][__x])
				if (__x % 2 == 0) {
					if (tiles[__y - 1][__x + 1]) {
						_neighbors.push(tiles[__y - 1][__x + 1])
					}
					if (tiles[__y - 1][__x - 1]) {
						_neighbors.push(tiles[__y - 1][__x - 1])
					}
				}				
			}
			if (tiles[__y][__x + 1]) {
				_neighbors.push(tiles[__y][__x + 1])
			}
			if (tiles[__y][__x - 1]) {
				_neighbors.push(tiles[__y][__x - 1])
			}
			
			trace(Tile, " -- ", _neighbors.join())
			return _neighbors
		}

		
	}

}