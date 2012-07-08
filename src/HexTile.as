package  
{
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author robots
	 */
	public class HexTile extends FlxSprite 
	{
		[Embed(source = "../assets/hex_tile.png")]
		private var HexTileGraphic:Class;
		
		public function HexTile(X:Number=0, Y:Number=0, SimpleGraphic:Class=null) {
			super(X, Y, HexTileGraphic);
			
		}
		override public function getMidpoint(Point:FlxPoint = null):FlxPoint 
		{
			return new FlxPoint(x + width/2 , y + height/2 + 4)
		}
		
	}

}