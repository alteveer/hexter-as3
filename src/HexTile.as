package  
{
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxText;
	
	/**
	 * ...
	 * @author robots
	 */
	public class HexTile extends FlxSprite 
	{
		[Embed(source = "../assets/hex_tile.png")]
		private var HexTileGraphic:Class;
		
		public var grid_x:int
		public var grid_y:int
		
		public function HexTile(X:Number=0, Y:Number=0, SimpleGraphic:Class=null) {
			super(
				X * HexMap.TILE_WIDTH, 
				Y * HexMap.TILE_HEIGHT + (HexMap.ACHO * (X % 2))						
			);
			grid_x = X
			grid_y = Y
			loadGraphic(HexTileGraphic, true, false, 64, 64)
			addAnimation("off", [0])
			addAnimation("on", [1])
			play("off")
		}
		override public function getMidpoint(Point:FlxPoint = null):FlxPoint 
		{
			return new FlxPoint(x + width/2 , y + height/2 + 4)
		}
		public function toggle():void {
			if (_curAnim.name == "on") {
				play("off")
			} else {
				play("on")
			}
		}
		
	}

}