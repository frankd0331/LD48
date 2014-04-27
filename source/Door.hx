package ;

import flixel.FlxSprite;

/**
 * ...
 * @author Frank Dudek
 */
class Door extends FlxSprite
{

	public function new(newX:Float=0, newY:Float=0) {
		super(newX, newY);
		makeGraphic(16, 18, 0xFF000000);
	}
	
}