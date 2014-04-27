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
class EndMenu extends FlxState {
	private var but:FlxButton;
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void {
		super.create();
		but = new FlxButton();
		//trace(but.width + " " + but.height);
		add(new FlxText(FlxG.width/2 - 50, 0, 100, "YOU WON!"));
		add(new FlxButton(0, 0, "LEVEL 01", gotoLevel01));
		add(new FlxButton(0, 20, "LEVEL 02", gotoLevel02));
		add(new FlxButton(0, 40, "LEVEL 03", gotoLevel03));
		add(new FlxButton(0, 60, "LEVEL 04", gotoLevel04));
		add(new FlxButton(0, 80, "LEVEL 05", gotoLevel05));
		add(new FlxButton(0, 100, "LEVEL 06", gotoLevel06));
		add(new FlxButton(FlxG.width - 80, 0, "LEVEL 07", gotoLevel07));
		add(new FlxButton(FlxG.width - 80, 20, "LEVEL 08", gotoLevel08));
		add(new FlxButton(FlxG.width - 80, 40, "LEVEL 09", gotoLevel09));
		add(new FlxButton(FlxG.width - 80, 60, "LEVEL 10", gotoLevel10));
		add(new FlxButton(FlxG.width - 80, 80, "LEVEL 11", gotoLevel11));
		add(new FlxButton(FlxG.width - 80, 100, "LEVEL 12", gotoLevel12));
		add(new FlxButton(FlxG.width / 2 - 40, FlxG.height - 20, "LEVEL 13", gotoLevel13));
	}
	
	function gotoLevel01():Void {
		FlxG.switchState(new Level00());
	}
	function gotoLevel02():Void {
		FlxG.switchState(new Level01());
	}
	function gotoLevel03():Void {
		FlxG.switchState(new Level02());
	}
	function gotoLevel04():Void {
		FlxG.switchState(new Level03());
	}
	function gotoLevel05():Void {
		FlxG.switchState(new Level04());
	}
	function gotoLevel06():Void {
		FlxG.switchState(new Level05());
	}
	function gotoLevel07():Void {
		FlxG.switchState(new Level06());
	}
	function gotoLevel08():Void {
		FlxG.switchState(new Level07());
	}
	function gotoLevel09():Void {
		FlxG.switchState(new Level08());
	}
	function gotoLevel10():Void {
		FlxG.switchState(new Level09());
	}
	function gotoLevel11():Void {
		FlxG.switchState(new Level10());
	}
	function gotoLevel12():Void {
		FlxG.switchState(new Level11());
	}
	function gotoLevel13():Void {
		FlxG.switchState(new Level12());
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
	}	
}