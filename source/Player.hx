package ;
import flixel.FlxG;
import flixel.FlxSprite;

/**
 * ...
 * @author Frank Dudek
 */
class Player extends FlxSprite {
	private var aY:Int;
	private var mapHeight:Int;
	private var surfaceSwitch:Bool = false;
	private var onTop:Bool = true;
	
	public function new(newMapHeight:Int) {
		super();
		mapHeight = newMapHeight;
		makeGraphic(8, 16, 0xFF0969A2);
		maxVelocity.set(200, 200);
		aY = 500;
		acceleration.y = aY;
		drag.set(1000, 1000);
		//immovable = true;
	}
	
	override public function update() {
		acceleration.x = 0;
		
		if (FlxG.keys.anyPressed(["A", "LEFT"])) {
			acceleration.x = -800;
		}
		if (FlxG.keys.anyPressed(["D", "RIGHT"])) {
			acceleration.x = 800;
		}
		if (FlxG.keys.anyPressed(["A", "LEFT"]) && FlxG.keys.anyPressed(["D", "RIGHT"])) {
			acceleration.x = 0;
		}
		
		if (velocity.y == 0) {
			if (FlxG.keys.anyJustPressed(["W", "UP"]) && onTop) {
				velocity.y = -200;
			}
			if (FlxG.keys.anyJustPressed(["S", "DOWN"]) && !onTop) {
				velocity.y = 200;
			}
		}
		
		if (y > mapHeight / 2 - 8) {
			aY = -500;
			if (onTop) {
				makeGraphic(8, 16, 0xFFFF7A00);
			}
			onTop = false;
		} else {
			aY = 500;
			if (!onTop) {
				makeGraphic(8, 16, 0xFF0969A2);
			}
			onTop = true;
		}
		acceleration.y = aY;
		
		super.update();
	}
	
}