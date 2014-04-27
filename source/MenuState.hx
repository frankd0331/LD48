package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState {
	private var message:FlxText;
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void {
		super.create();
		message = new FlxText(FlxG.width / 2 -50, FlxG.height / 4 * 2, 100, "Apologeticum:    For Ludum Dare 29");
		add(message);
		add(new FlxButton(FlxG.width/2 -40, FlxG.height/4 *3, "LEVELS", levelMenu));
	}
	
	function levelMenu():Void 
	{
		FlxG.switchState(new LevelChooser());
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void {
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void {
		super.update();
		//FlxG.switchState(new Level12());
	}	
}