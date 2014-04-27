package ;

/**
 * ...
 * @author Frank Dudek
 */
class ColdBrick extends Brick {

	public function new(x:Float, y:Float) {
		super(x, y);
		makeGraphic(16, 16, 0xFF0000FF);
		solid = true;
	}
	
}