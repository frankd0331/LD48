package ;

/**
 * ...
 * @author Frank Dudek
 */
class HotBrick extends Brick {

	public function new(x:Float, y:Float) {
		super(x, y);
		//makeGraphic(16, 16, 0xFFFF80FF);
		loadGraphic("assets/images/hotBrick.fw.png");
		solid = true;
	}
	
}