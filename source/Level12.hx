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
class Level12 extends FlxState {
	private var player:Player;
	private var ogmoLoader:FlxOgmoLoader;
	private var map:FlxTilemap;
	private var flippyCam:FlxCamera;
	private var healthCount:FlxText;
	private var hotEnemy:HotEnemy;
	private var door:Door;
	public var hotEnemyGroup:FlxGroup;
	public var coldEnemyGroup:FlxGroup;
	public var hotBombGroup:FlxGroup;
	private var coldBrickGroup:FlxGroup;
	public var coldBombGroup:FlxGroup;
	private var hotBrickGroup:FlxGroup;
	private var boss:Boss;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		bgColor = 0xFFC0C0C0;
		ogmoLoader = new FlxOgmoLoader("assets/data/level20.oel");
		map = ogmoLoader.loadTilemap("assets/images/tileSheet.fw.png", 16, 16, "midGround");

		flippyCam = new FlxCamera(0,0,320,240);
		flippyCam.bounds = new FlxRect(0, 0, map.width, 240);
		flippyCam.bounds.bottom = 480;


		player = new Player(Std.int(map.height),30);
		door = new Door();
		hotEnemyGroup = new FlxGroup();
		coldEnemyGroup = new FlxGroup();
		hotBombGroup = new FlxGroup();
		coldBrickGroup = new FlxGroup();
		coldBombGroup = new FlxGroup();
		hotBrickGroup = new FlxGroup();
		boss = new Boss(this);
		
		ogmoLoader.loadEntities(entityLoader, "objects");
		
		healthCount = new FlxText(0, 0, FlxG.width, "Health: " + player.health, 10);
		healthCount.scrollFactor.set(0, 0);

		add(map);
		add(player);
		//add(door);
		add(hotEnemyGroup);
		add(coldEnemyGroup);
		add(hotBombGroup);
		add(healthCount);
		add(coldBrickGroup);
		add(coldBombGroup);
		add(hotBrickGroup);
		add(boss);

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
			case "hotbomb":
				hotBombGroup.add(new HotBomb(Std.parseFloat(data.get("x")), Std.parseFloat(data.get("y")), Std.int(map.height), player));
			case "coldbrick":
				coldBrickGroup.add(new ColdBrick(Std.parseFloat(data.get("x")), Std.parseFloat(data.get("y"))));
			case "coldbomb":
				coldBombGroup.add(new ColdBomb(Std.parseFloat(data.get("x")), Std.parseFloat(data.get("y")), Std.int(map.height), player));
			case "hotbrick":
				hotBrickGroup.add(new HotBrick(Std.parseFloat(data.get("x")), Std.parseFloat(data.get("y"))));
			case "boss":
				boss.x = Std.parseFloat(data.get("x"));
				boss.y = Std.parseFloat(data.get("y"));
				
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
		FlxG.collide(map, hotBombGroup, FlxObject.separate);
		FlxG.collide(hotBombGroup, player, hotBombCollisionHandler);
		FlxG.collide(coldBrickGroup, player, FlxObject.separate);
		FlxG.collide(hotBombGroup, coldBrickGroup, hotBombColdBrickCollisionHandler);
		FlxG.collide(hotBrickGroup, player, FlxObject.separate);
		FlxG.collide(coldBombGroup, hotBrickGroup, coldBombHotBrickCollisionHandler);
		FlxG.collide(map, coldBombGroup, FlxObject.separate);
		FlxG.collide(coldBombGroup, player, coldBombCollisionHandler);
		FlxG.collide(hotBombGroup, coldEnemyGroup, hotBombColdEnemyCollisionHandler);
		FlxG.collide(coldBombGroup, hotEnemyGroup, coldBombHotEnemyCollisionHandler);
		FlxG.collide(map, boss, FlxObject.separate);
		FlxG.collide(boss, player, bossPlayerCollisionHandler);
		FlxG.collide(coldBrickGroup, hotEnemyGroup, FlxObject.separate);
		FlxG.collide(hotBrickGroup, coldEnemyGroup, FlxObject.separate);
		FlxG.collide(hotBombGroup, boss, hotBombBossCollider);
		FlxG.collide(coldBombGroup, boss, coldBombBossCollider);
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
			FlxG.switchState(new EndMenu());
		}
		
		if (boss.health <= 0) {
			add(door);
		}
		
		super.update();
	}	
	
	function coldBombBossCollider(bomb:Bomb, boss:Boss) 
	{
		if (!boss.onTop && !bomb.isHeld) {
			bomb.destroy();
			boss.hurt(1);
			FlxG.sound.play("assets/sounds/Hit_Hurt35.wav");
		}
	}
	
	function hotBombBossCollider(bomb:Bomb, boss:Boss) 
	{
		if (boss.onTop && !bomb.isHeld) {
			bomb.destroy();
			boss.hurt(1);
			FlxG.sound.play("assets/sounds/Hit_Hurt35.wav");
		}
	}
	
	function bossPlayerCollisionHandler(boss:Boss, player:Player) {
		player.health = 0;	
	}
	
	function coldBombHotEnemyCollisionHandler(bomb:Bomb, enemy:HotEnemy) 
	{
		if (!bomb.isHeld) {
			bomb.kill();
			coldEnemyGroup.add(new ColdEnemy(enemy.x, enemy.y, player, Std.int(map.height)));
			enemy.kill();
		}
	}
	
	function hotBombColdEnemyCollisionHandler(bomb:Bomb, enemy:ColdEnemy) 
	{
		if (!bomb.isHeld) {
			bomb.kill();
			hotEnemyGroup.add(new HotEnemy(enemy.x, enemy.y, player, Std.int(map.height)));
			enemy.kill();
		}
	}
	
	function coldBombCollisionHandler(bomb:Bomb, player:Player) 
	{
		if (!player.holdingSomething) {
			bomb.isHeld = true;
			player.holdingSomething = true;
			player.bombBeingHeld = bomb;
			bomb.drag.set(0, 0);
			bomb.velocity.x = 0;
			bomb.velocity.y = 0;
			bomb.acceleration.y = 0;
		}
	}
	
	function coldBombHotBrickCollisionHandler(bomb:Bomb, brick:Brick) 
	{
		if (!bomb.isHeld) {
			bomb.kill();
			brick.kill();
			FlxG.sound.play("assets/sounds/Explosion7.wav");
		}
	}
	
	function hotBombColdBrickCollisionHandler(bomb:Bomb, brick:Brick) {
		if (!bomb.isHeld) {
			bomb.kill();
			brick.kill();
			FlxG.sound.play("assets/sounds/Explosion7.wav");
		}
	}
	
	function hotBombCollisionHandler(bomb:Bomb, player:Player) {
		if (!player.holdingSomething) {
			bomb.isHeld = true;
			player.holdingSomething = true;
			player.bombBeingHeld = bomb;
			bomb.drag.set(0, 0);
			bomb.velocity.x = 0;
			bomb.velocity.y = 0;
			bomb.acceleration.y = 0;
			bomb.acceleration.x = 0;
		}
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
		FlxG.switchState(new EndMenu());
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