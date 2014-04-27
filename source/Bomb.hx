package ;

import flixel.FlxSprite;

/**
 * ...
 * @author Frank Dudek
 */
class Bomb extends FlxSprite {
	private var onTop:Bool;
	private var aY:Int;
	private var mapHeight:Int;
	private var thePlayer:Player;
	public var isHeld:Bool = false;
	
	public function new(X:Float=0, Y:Float=0, newMapHeight = 480, playerLink:Player, newOnTop = true) 
	{
		super(X, Y);
		makeGraphic(8, 8, 0xFFFF7A00);
		//elasticity = 0.5;
		//immovable = false;
		solid = true;
		drag.set(200, 200);
		onTop = newOnTop;
		if (onTop) {
			aY = -500;
		} else {
			aY = 500;
		}
		acceleration.y = aY;
		maxVelocity.set(400, 400);
		mapHeight = newMapHeight;
		thePlayer = playerLink;
	}
	
	override public function update():Void {
		if (!isHeld) {
			drag.set(200, 200);
			if (y > mapHeight / 2 - 8) {
				aY = -500;
				if (onTop) {
					//makeGraphic(8, 16, 0xFF0969A2);
				}
				onTop = false;
			} else {
				aY = 500;
				if (!onTop) {
					//makeGraphic(8, 16, 0xFFFF7A00);
				}
				onTop = true;
			}
			acceleration.y = aY;
		} else {
			x = thePlayer.x;
			y = thePlayer.y;
			drag.set(0, 0);
		}

		
		super.update();
	}
	
}