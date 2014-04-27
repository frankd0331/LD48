package ;

import flixel.FlxSprite;

/**
 * ...
 * @author Frank Dudek
 */
class ColdEnemy extends FlxSprite
{
	private var thePlayer:Player;
	private var vx:Float = 500;
	private var vy:Float = 500;
	private var onTop:Bool = true;
	private var mapHeight:Int;
	
	public function new(newX:Float = 0, newY:Float = 0, player:Player, newMapHeight:Int = 480) {
		super(newX,newY);
		
		mapHeight = newMapHeight;
		thePlayer = player;
		//makeGraphic(8, 8, 0xFF009999);
		loadGraphic("assets/images/coldEnemy.fw.png");
		drag.set(2000, 2000);
		maxVelocity.set(200, 200);
		solid = true;
		elasticity = 0.5;
	}
	
	override public function update():Void {
/*		if (y > mapHeight / 2 - height / 2) {
			vx = 500;
			vy = 500;
			onTop = false;
		} else {
			vx = 0;
			vy = 0;
			velocity.x = 0;
			velocity.y = 0;
			onTop = true;
		}*/
		
		if (thePlayer.x < x) {
			acceleration.x = -vx;
		} else if (thePlayer.x > x) {
			acceleration.x = vx;
		}
		if (thePlayer.y < y) {
			acceleration.y = -vy;
		} else if (thePlayer.y > y) {
			acceleration.y = vy;
		}
		super.update();
	}
	
}