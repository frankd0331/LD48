package;

import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxRect;
import flixel.system.debug.Console;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState {
	private var player:Player;
	//private var ground:FlxSprite;
	private var ogmoLoader:FlxOgmoLoader;
	private var map:FlxTilemap;
	//private var floor:FlxSprite;
	private var flippyCam:FlxCamera;
	private var dehbug:Console;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		bgColor = 0xFFC0C0C0;
		ogmoLoader = new FlxOgmoLoader("assets/data/level01.oel");
		map = ogmoLoader.loadTilemap("assets/images/haxeFlixeltut.fw.png", 16, 16, "ground");
		
		player = new Player(Std.int(map.height));
		
		flippyCam = new FlxCamera(0,0,320,240);
		flippyCam.bounds = new FlxRect(0,0,map.width,240);
		flippyCam.bounds.bottom = 480;
		flippyCam.follow(player);
		flippyCam.style = FlxCamera.STYLE_PLATFORMER;

		add(map);
		add(player);
		//dehbug = new Console();
		//dehbug.registerObject("player", player);
		FlxG.camera.follow(player);
		FlxG.camera.style = FlxCamera.STYLE_PLATFORMER;
		FlxG.cameras.add(flippyCam);
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		FlxG.collide(map, player, FlxObject.separate);
		if (player.y > map.height / 2 - 8) {
			//FlxG.camera.y = player.y;
			flippyCam.bounds.bottom = 9999;
			flippyCam.bounds.top = 480;
		} else {
			//FlxG.camera.y = ;
			flippyCam.bounds.top = 0;
			flippyCam.bounds.bottom = 480;
		}
		
		super.update();
	}	
}