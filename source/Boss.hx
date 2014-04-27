package ;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

/**
 * ...
 * @author Frank Dudek
 */
class Boss extends FlxSprite {
	private var theState:FlxState;
	private var mapHeight:Int;
	private var aY:Int = 0;
	public var onTop:Bool = true;
	private var ax:Int = 30;
	private var ay:Int = 30;

	public function new(currentState:FlxState, newMapHeight:Int=480) 
	{
		super();
		theState = currentState;
		//makeGraphic(32, 32, 0xFF0000FF);
		loadGraphic("assets/images/coldBoss.fw.png");
		solid = true;
		mapHeight = newMapHeight;
		maxVelocity.set(150, 150);
		health = 2;
	}
	
	override public function destroy() {
		theState.add(new Door(x, y));
		FlxG.sound.play("assets/sounds/Explosion7.wav");
		super.destroy();
	}
	
	override public function update() {
		if (y > mapHeight / 2 - 8) {
			onTop = false;
			//makeGraphic(32, 32, 0xFFFF0000);
			loadGraphic("assets/images/fireBoss.fw.png");
		} else {
			onTop = true;
			//makeGraphic(32, 32, 0xFF0000FF);
			loadGraphic("assets/images/coldBoss.fw.png");
		}
		if (velocity.x == 0) {
			ax = -ax;
		}
		if (velocity.y == 0) {
			ay = -ay;
		}
		acceleration.x = ax;
		acceleration.y = ay;
		
		
		super.update();
	}
	
}