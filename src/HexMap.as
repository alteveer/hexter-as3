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
		public function neighbors(x:int, y:int):Array {
			_neighbors = [];
			if (tiles[y] == null || tiles[y][x] == null) {
				return null
			}
			if (tiles[y + 1]) {
				_neighbors.push(tiles[y + 1][x])
			
				if (x % 2 == 1) {
					if (tiles[y + 1][x + 1]) {
						_neighbors.push(tiles[y + 1][x + 1])
					}
					if (tiles[y + 1][x - 1]) {
						_neighbors.push(tiles[y + 1][x - 1])
					}
				}
			}	

			if(tiles[y - 1]) {
				_neighbors.push(tiles[y - 1][x])
				if (x % 2 == 0) {
					if (tiles[y - 1][x + 1]) {
						_neighbors.push(tiles[y + 1][x + 1])
					}
					if (tiles[y - 1][x - 1]) {
						_neighbors.push(tiles[y + 1][x - 1])
					}
				}				
			}
			if (tiles[y][x + 1]) {
				_neighbors.push(tiles[y][x + 1])
			}
			if (tiles[y][x - 1]) {
				_neighbors.push(tiles[y][x - 1])
			}
			
			return _neighbors
		}

		
	}

}