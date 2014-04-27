package;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.util.FlxPoint;
import flixel.util.FlxSpriteUtil;

/**
 * ...
 * @author Frank Dudek
 */
class Player extends FlxSprite {
	private var aY:Int;
	private var mapHeight:Int;
	private var surfaceSwitch:Bool = false;
	private var onTop:Bool = true;
	private var flickering:Bool = false;
	public var holdingSomething:Bool = false;
	public var bombBeingHeld:Bomb;
	
	public function new(newMapHeight:Int, newHealth:Float = 5) {
		super();
		mapHeight = newMapHeight;
		//makeGraphic(8, 16, 0xFFFF7A00);
		loadGraphic("assets/images/ld48Toon.png", true, 16, 18);
		maxVelocity.set(200, 500);
		aY = 500;
		acceleration.y = aY;
		drag.set(1000, 1000);
		width = 5;
		height = 14;
		health = newHealth;
		offset = new FlxPoint(5, -1);
		//immovable = true;
		solid = true;
		facing = FlxObject.RIGHT;
		animation.add("topWalk", [0, 1, 2, 3, 4, 5, 6, 7], 15, true);
		animation.add("topIdle", [8, 9], 2, true);
		animation.add("topJump", [10]);
		animation.add("topFall", [11]);
		animation.add("bottomWalk", [12, 13, 14, 15, 16, 17, 18, 19], 15, true);
		animation.add("bottomIdle", [20, 21], 2, true);
		animation.add("bottomJump", [22]);
		animation.add("bottomFall", [23]);
	}
	
	override public function update() {
		acceleration.x = 0;
		
		if (velocity.x == 0) {
			if (onTop) {
				animation.play("topIdle");
			} else {
				animation.play("bottomIdle");
			}
		}
		
		if (FlxG.keys.anyPressed(["A", "LEFT"])) {
			acceleration.x = -800;
			facing = FlxObject.LEFT;
			flipX = true;
			if (onTop) {
				animation.play("topWalk");
			} else {
				animation.play("bottomWalk");
			}
		}
		if (FlxG.keys.anyPressed(["D", "RIGHT"])) {
			acceleration.x = 800;
			facing = FlxObject.RIGHT;
			flipX = false;
			if (onTop) {
				animation.play("topWalk");
			} else {
				animation.play("bottomWalk");
			}
		}
		if (FlxG.keys.anyPressed(["A", "LEFT"]) && FlxG.keys.anyPressed(["D", "RIGHT"])) {
			acceleration.x = 0;
		}
		
		if (FlxG.keys.anyJustPressed(["SPACE"]) && holdingSomething) {
			if (facing == FlxObject.RIGHT) {
				bombBeingHeld.isHeld = false;
				bombBeingHeld.x = x + width;
				bombBeingHeld.velocity.x = 275;
				bombBeingHeld.drag.set(200, 200);
				bombBeingHeld.velocity.y = 0;
			} else {
				bombBeingHeld.isHeld = false;
				bombBeingHeld.x = x - bombBeingHeld.width;
				bombBeingHeld.velocity.x = -275;
				bombBeingHeld.drag.set(200, 200);
				bombBeingHeld.velocity.y = 0;
			}
			holdingSomething = false;
			bombBeingHeld = null;
		}
		
		if (velocity.y == 0) {
			if (FlxG.keys.anyJustPressed(["W", "UP"]) && onTop) {
				velocity.y = -200;
				FlxG.sound.play("assets/sounds/Jump4.wav");
			}
			if (FlxG.keys.anyJustPressed(["S", "DOWN"]) && !onTop) {
				velocity.y = 200;
				FlxG.sound.play("assets/sounds/Jump4.wav");
			}
		}
		
		if (y > mapHeight / 2 - 8) {
			aY = -500;
			if (onTop) {
				//makeGraphic(8, 16, 0xFF0969A2);
				health -= 1;
				FlxG.sound.play("assets/sounds/Hit_Hurt35.wav");
			}
			onTop = false;
		} else {
			aY = 500;
			if (!onTop) {
				//makeGraphic(8, 16, 0xFFFF7A00);
				health -= 1;
				FlxG.sound.play("assets/sounds/Hit_Hurt35.wav");
			}
			onTop = true;
		}
		acceleration.y = aY;
		
		if (velocity.y < 0) {
			if (onTop) {
				animation.play("topJump");
			} else {
				animation.play("bottomFall");
			}
		} else if (velocity.y > 0) {
			if (onTop) {
				animation.play("topFall");
			} else {
				animation.play("bottomJump");
			}
		}
		
		super.update();
	}
	
	public function isOnTop():Bool {
		return onTop;
	}
	
/*	override public function hurt(damage:Float):Void {
		if (flickering) {
			return;
		}
		
	}
	
	private function flicker(duration:Float):Void {
		FlxSpriteUtil.flicker(this, duration, 0.02);
		flickering = true;
	}*/
	
}