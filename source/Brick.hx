package ;

import flixel.FlxSprite;

/**
 * ...
 * @author Frank Dudek
 */
class Brick extends FlxSprite
{

	public function new(X:Float=0, Y:Float=0) 
	{
		super(X, Y);
		immovable = true;
	}
	
}