package  
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author robots
	 */
	public class HexTile extends FlxSprite 
	{
		[Embed(source = "../assets/hex_tile.png")]
		private var HexTileGraphic:Class;
		
		public function HexTile(X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y, HexTileGraphic);
			
		}
		
	}

}