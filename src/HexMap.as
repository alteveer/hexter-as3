package  
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author robots
	 */
	public class HexMap extends FlxGroup
	{
		public var tile_width:Number = 48
		public var tile_height:Number = 32
		public var graphic_width:Number = 64
		public var graphic_height:Number = 64
		public var tlho:Number = 32 // "t.op l.eft h.eight o.ffset"
		public var acho:Number = 16 // "a.lternate c.olumn h.eight o.ffset"
		
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
			var x:Number, y:Number
			for (x = 0; x < map_width; x++) {
				tiles[x] = []
				for (y = 0; y < map_height; y++) {
					tile = new HexTile(
						x * tile_width, 
						y * tile_height + (acho * (x%2))						
					)
					tiles[x][y] = tile
					//tile.loadGraphic(hex_tiles
					add(tile)
				}
			}
			
			starting_tile = tiles[_mw / 2][_mh / 2]
			
		}

		
	}

}