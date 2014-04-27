package ;

import flixel.FlxSprite;

/**
 * ...
 * @author Frank Dudek
 */
class HotBomb extends Bomb {

	public function new(X:Float=0, Y:Float=0, newMapHeight = 480, playerLink:Player, newOnTop = true) {
		super(X, Y, newMapHeight, playerLink, newOnTop);
		makeGraphic(8, 8, 0xFFFF7A00);

	}
}