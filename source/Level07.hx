package;

import flash.utils.Timer;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxRect;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class Level07 extends FlxState {
	private var player:Player;
	private var ogmoLoader:FlxOgmoLoader;
	private var map:FlxTilemap;
	private var flippyCam:FlxCamera;
	private var healthCount:FlxText;
	private var hotEnemy:HotEnemy;
	private var door:Door;
	private var hotEnemyGroup:FlxGroup;
	private var coldEnemyGroup:FlxGroup;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		bgColor = 0xFFC0C0C0;
		ogmoLoader = new FlxOgmoLoader("assets/data/level07.oel");
		map = ogmoLoader.loadTilemap("assets/images/tileSheet.fw.png", 16, 16, "midGround");

		flippyCam = new FlxCamera(0,0,320,240);
		flippyCam.bounds = new FlxRect(0, 0, map.width, 240);
		flippyCam.bounds.bottom = 480;


		player = new Player(Std.int(map.height),2);
		door = new Door();
		hotEnemyGroup = new FlxGroup();
		coldEnemyGroup = new FlxGroup();
		
		ogmoLoader.loadEntities(entityLoader, "objects");
		
		healthCount = new FlxText(0, 0, FlxG.width, "Health: " + player.health, 10);
		healthCount.scrollFactor.set(0, 0);

		add(map);
		add(player);
		add(door);
		add(hotEnemyGroup);
		add(coldEnemyGroup);
		add(healthCount);

		flippyCam.follow(player);
		flippyCam.style = FlxCamera.STYLE_PLATFORMER;
		FlxG.cameras.add(flippyCam);
	}
	
	private function entityLoader(type:String, data:Xml):Void {
		switch (type.toLowerCase()) {
			case "player":
				player.x = Std.parseFloat(data.get("x"));
				player.y = Std.parseFloat(data.get("y"));
			case "door":
				door.x = Std.parseFloat(data.get("x"));
				door.y = Std.parseFloat(data.get("y"));
			case "hotenemy":
				hotEnemyGroup.add(new HotEnemy(Std.parseFloat(data.get("x")), Std.parseFloat(data.get("y")), player, Std.int(map.height)));
			case "coldenemy":
				coldEnemyGroup.add(new ColdEnemy(Std.parseFloat(data.get("x")), Std.parseFloat(data.get("y")), player, Std.int(map.height)));
		}
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		player = null;
		ogmoLoader = null;
		map = null;
		flippyCam = null;
		healthCount = null;
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		FlxG.collide(map, player, FlxObject.separate);
		FlxG.collide(hotEnemyGroup, player, hotEnemyCollisionHandler);
		FlxG.collide(coldEnemyGroup, player, coldEnemyCollisionHandler);
		FlxG.collide(door, player, doorCollisionHandler);
		FlxG.collide(hotEnemyGroup, hotEnemyGroup, FlxObject.separate);
		FlxG.collide(coldEnemyGroup, hotEnemyGroup, FlxObject.separate);
		FlxG.collide(coldEnemyGroup, coldEnemyGroup, FlxObject.separate);
		healthCount.text = "Health: " + player.health;
		
		if (player.y > map.height / 2 - 8) {
			flippyCam.bounds.bottom = map.height;
			flippyCam.bounds.top = map.height / 2;
			healthCount.y = FlxG.height - healthCount.height;
		} else {
			flippyCam.bounds.top = 0;
			flippyCam.bounds.bottom = map.height / 2;
			healthCount.y = 0;
		}
		
		if (player.health <= 0) {
			FlxG.sound.play("assets/sounds/Randomize3.wav");
			FlxG.switchState(new Level07());
		}
		
		super.update();
	}	
	
	function coldEnemyCollisionHandler(enemy:FlxObject, player:Player) {
		if (player.isOnTop()) {
			player.hurt(1);
			enemy.velocity.x = -enemy.velocity.x;
			enemy.velocity.y = -enemy.velocity.y;
			FlxG.sound.play("assets/sounds/Hit_Hurt35.wav");
		} else {
			enemy.destroy();
			FlxG.sound.play("assets/sounds/Powerup12.wav");
			player.hurt( -1);
		}
	}
	
	function doorCollisionHandler(door:FlxObject, player:Player) {
		FlxG.switchState(new Level08());
	}
	
	function hotEnemyCollisionHandler(enemy:FlxObject, player:Player) {
		if (!player.isOnTop()) {
			player.hurt(1);
			enemy.velocity.x = -enemy.velocity.x;
			enemy.velocity.y = -enemy.velocity.y;
			FlxG.sound.play("assets/sounds/Hit_Hurt35.wav");
		} else {
			enemy.destroy();
			FlxG.sound.play("assets/sounds/Powerup12.wav");
			player.hurt( -1);
		}
	}
}