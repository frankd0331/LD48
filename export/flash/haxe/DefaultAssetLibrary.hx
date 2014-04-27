package;


import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.MovieClip;
import flash.text.Font;
import flash.media.Sound;
import flash.net.URLRequest;
import flash.utils.ByteArray;
import haxe.Unserializer;
import openfl.Assets;

#if (flash || js)
import flash.display.Loader;
import flash.events.Event;
import flash.net.URLLoader;
#end

#if ios
import openfl.utils.SystemPath;
#end


@:access(flash.media.Sound)
class DefaultAssetLibrary extends AssetLibrary {
	
	
	public static var className (default, null) = new Map <String, Dynamic> ();
	public static var path (default, null) = new Map <String, String> ();
	public static var type (default, null) = new Map <String, AssetType> ();
	
	public function new () {
		
		super ();
		
		#if flash
		
		className.set ("assets/data/ld48.oep", __ASSET__assets_data_ld48_oep);
		type.set ("assets/data/ld48.oep", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/data/level00.oel", __ASSET__assets_data_level00_oel);
		type.set ("assets/data/level00.oel", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/data/level01.oel", __ASSET__assets_data_level01_oel);
		type.set ("assets/data/level01.oel", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/data/level02.oel", __ASSET__assets_data_level02_oel);
		type.set ("assets/data/level02.oel", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/data/level03.oel", __ASSET__assets_data_level03_oel);
		type.set ("assets/data/level03.oel", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/data/level04.oel", __ASSET__assets_data_level04_oel);
		type.set ("assets/data/level04.oel", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/data/level05.oel", __ASSET__assets_data_level05_oel);
		type.set ("assets/data/level05.oel", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/data/level06.oel", __ASSET__assets_data_level06_oel);
		type.set ("assets/data/level06.oel", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/data/level07.oel", __ASSET__assets_data_level07_oel);
		type.set ("assets/data/level07.oel", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/data/level08.oel", __ASSET__assets_data_level08_oel);
		type.set ("assets/data/level08.oel", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/data/level09.oel", __ASSET__assets_data_level09_oel);
		type.set ("assets/data/level09.oel", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/images/BLANK.fw.png", __ASSET__assets_images_blank_fw_png);
		type.set ("assets/images/BLANK.fw.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/coldBrick.fw.png", __ASSET__assets_images_coldbrick_fw_png);
		type.set ("assets/images/coldBrick.fw.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/coldEnemy.fw.png", __ASSET__assets_images_coldenemy_fw_png);
		type.set ("assets/images/coldEnemy.fw.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/coldTiles.fw.png", __ASSET__assets_images_coldtiles_fw_png);
		type.set ("assets/images/coldTiles.fw.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/fireEnemy.fw.png", __ASSET__assets_images_fireenemy_fw_png);
		type.set ("assets/images/fireEnemy.fw.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/haxeFlixeltut.fw.png", __ASSET__assets_images_haxeflixeltut_fw_png);
		type.set ("assets/images/haxeFlixeltut.fw.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/hotBrick.fw.png", __ASSET__assets_images_hotbrick_fw_png);
		type.set ("assets/images/hotBrick.fw.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/hotTiles.fw.png", __ASSET__assets_images_hottiles_fw_png);
		type.set ("assets/images/hotTiles.fw.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/ld48Toon.png", __ASSET__assets_images_ld48toon_png);
		type.set ("assets/images/ld48Toon.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/images/sheet.xml", __ASSET__assets_images_sheet_xml);
		type.set ("assets/images/sheet.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/images/tileSheet.fw.png", __ASSET__assets_images_tilesheet_fw_png);
		type.set ("assets/images/tileSheet.fw.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/sounds/Explosion7.wav", __ASSET__assets_sounds_explosion7_wav);
		type.set ("assets/sounds/Explosion7.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("assets/sounds/Hit_Hurt35.wav", __ASSET__assets_sounds_hit_hurt35_wav);
		type.set ("assets/sounds/Hit_Hurt35.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("assets/sounds/Jump4.wav", __ASSET__assets_sounds_jump4_wav);
		type.set ("assets/sounds/Jump4.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("assets/sounds/Laser_Shoot6.wav", __ASSET__assets_sounds_laser_shoot6_wav);
		type.set ("assets/sounds/Laser_Shoot6.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("assets/sounds/Powerup12.wav", __ASSET__assets_sounds_powerup12_wav);
		type.set ("assets/sounds/Powerup12.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("assets/sounds/Randomize3.wav", __ASSET__assets_sounds_randomize3_wav);
		type.set ("assets/sounds/Randomize3.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp3);
		type.set ("assets/sounds/beep.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		
		
		#elseif html5
		
		addExternal("assets/data/ld48.oep", "text", "assets/data/ld48.oep");
		addExternal("assets/data/level00.oel", "text", "assets/data/level00.oel");
		addExternal("assets/data/level01.oel", "text", "assets/data/level01.oel");
		addExternal("assets/data/level02.oel", "text", "assets/data/level02.oel");
		addExternal("assets/data/level03.oel", "text", "assets/data/level03.oel");
		addExternal("assets/data/level04.oel", "text", "assets/data/level04.oel");
		addExternal("assets/data/level05.oel", "text", "assets/data/level05.oel");
		addExternal("assets/data/level06.oel", "text", "assets/data/level06.oel");
		addExternal("assets/data/level07.oel", "text", "assets/data/level07.oel");
		addExternal("assets/data/level08.oel", "text", "assets/data/level08.oel");
		addExternal("assets/data/level09.oel", "text", "assets/data/level09.oel");
		addExternal("assets/images/BLANK.fw.png", "image", "assets/images/BLANK.fw.png");
		addExternal("assets/images/coldBrick.fw.png", "image", "assets/images/coldBrick.fw.png");
		addExternal("assets/images/coldEnemy.fw.png", "image", "assets/images/coldEnemy.fw.png");
		addExternal("assets/images/coldTiles.fw.png", "image", "assets/images/coldTiles.fw.png");
		addExternal("assets/images/fireEnemy.fw.png", "image", "assets/images/fireEnemy.fw.png");
		addExternal("assets/images/haxeFlixeltut.fw.png", "image", "assets/images/haxeFlixeltut.fw.png");
		addExternal("assets/images/hotBrick.fw.png", "image", "assets/images/hotBrick.fw.png");
		addExternal("assets/images/hotTiles.fw.png", "image", "assets/images/hotTiles.fw.png");
		addExternal("assets/images/ld48Toon.png", "image", "assets/images/ld48Toon.png");
		addExternal("assets/images/sheet.xml", "text", "assets/images/sheet.xml");
		addExternal("assets/images/tileSheet.fw.png", "image", "assets/images/tileSheet.fw.png");
		addExternal("assets/sounds/Explosion7.wav", "sound", "assets/sounds/Explosion7.wav");
		addExternal("assets/sounds/Hit_Hurt35.wav", "sound", "assets/sounds/Hit_Hurt35.wav");
		addExternal("assets/sounds/Jump4.wav", "sound", "assets/sounds/Jump4.wav");
		addExternal("assets/sounds/Laser_Shoot6.wav", "sound", "assets/sounds/Laser_Shoot6.wav");
		addExternal("assets/sounds/Powerup12.wav", "sound", "assets/sounds/Powerup12.wav");
		addExternal("assets/sounds/Randomize3.wav", "sound", "assets/sounds/Randomize3.wav");
		addExternal("assets/sounds/beep.mp3", "music", "assets/sounds/beep.mp3");
		addExternal("assets/sounds/flixel.mp3", "music", "assets/sounds/flixel.mp3");
		
		
		#else
		
		#if (windows || mac || linux)
		
		var loadManifest = false;
		
		className.set ("assets/data/ld48.oep", __ASSET__assets_data_ld48_oep);
		type.set ("assets/data/ld48.oep", Reflect.field (AssetType, "text".toUpperCase ()));
		
		className.set ("assets/data/level00.oel", __ASSET__assets_data_level00_oel);
		type.set ("assets/data/level00.oel", Reflect.field (AssetType, "text".toUpperCase ()));
		
		className.set ("assets/data/level01.oel", __ASSET__assets_data_level01_oel);
		type.set ("assets/data/level01.oel", Reflect.field (AssetType, "text".toUpperCase ()));
		
		className.set ("assets/data/level02.oel", __ASSET__assets_data_level02_oel);
		type.set ("assets/data/level02.oel", Reflect.field (AssetType, "text".toUpperCase ()));
		
		className.set ("assets/data/level03.oel", __ASSET__assets_data_level03_oel);
		type.set ("assets/data/level03.oel", Reflect.field (AssetType, "text".toUpperCase ()));
		
		className.set ("assets/data/level04.oel", __ASSET__assets_data_level04_oel);
		type.set ("assets/data/level04.oel", Reflect.field (AssetType, "text".toUpperCase ()));
		
		className.set ("assets/data/level05.oel", __ASSET__assets_data_level05_oel);
		type.set ("assets/data/level05.oel", Reflect.field (AssetType, "text".toUpperCase ()));
		
		className.set ("assets/data/level06.oel", __ASSET__assets_data_level06_oel);
		type.set ("assets/data/level06.oel", Reflect.field (AssetType, "text".toUpperCase ()));
		
		className.set ("assets/data/level07.oel", __ASSET__assets_data_level07_oel);
		type.set ("assets/data/level07.oel", Reflect.field (AssetType, "text".toUpperCase ()));
		
		className.set ("assets/data/level08.oel", __ASSET__assets_data_level08_oel);
		type.set ("assets/data/level08.oel", Reflect.field (AssetType, "text".toUpperCase ()));
		
		className.set ("assets/data/level09.oel", __ASSET__assets_data_level09_oel);
		type.set ("assets/data/level09.oel", Reflect.field (AssetType, "text".toUpperCase ()));
		
		className.set ("assets/images/BLANK.fw.png", __ASSET__assets_images_blank_fw_png);
		type.set ("assets/images/BLANK.fw.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/images/coldBrick.fw.png", __ASSET__assets_images_coldbrick_fw_png);
		type.set ("assets/images/coldBrick.fw.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/images/coldEnemy.fw.png", __ASSET__assets_images_coldenemy_fw_png);
		type.set ("assets/images/coldEnemy.fw.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/images/coldTiles.fw.png", __ASSET__assets_images_coldtiles_fw_png);
		type.set ("assets/images/coldTiles.fw.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/images/fireEnemy.fw.png", __ASSET__assets_images_fireenemy_fw_png);
		type.set ("assets/images/fireEnemy.fw.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/images/haxeFlixeltut.fw.png", __ASSET__assets_images_haxeflixeltut_fw_png);
		type.set ("assets/images/haxeFlixeltut.fw.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/images/hotBrick.fw.png", __ASSET__assets_images_hotbrick_fw_png);
		type.set ("assets/images/hotBrick.fw.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/images/hotTiles.fw.png", __ASSET__assets_images_hottiles_fw_png);
		type.set ("assets/images/hotTiles.fw.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/images/ld48Toon.png", __ASSET__assets_images_ld48toon_png);
		type.set ("assets/images/ld48Toon.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/images/sheet.xml", __ASSET__assets_images_sheet_xml);
		type.set ("assets/images/sheet.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		
		className.set ("assets/images/tileSheet.fw.png", __ASSET__assets_images_tilesheet_fw_png);
		type.set ("assets/images/tileSheet.fw.png", Reflect.field (AssetType, "image".toUpperCase ()));
		
		className.set ("assets/sounds/Explosion7.wav", __ASSET__assets_sounds_explosion7_wav);
		type.set ("assets/sounds/Explosion7.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		
		className.set ("assets/sounds/Hit_Hurt35.wav", __ASSET__assets_sounds_hit_hurt35_wav);
		type.set ("assets/sounds/Hit_Hurt35.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		
		className.set ("assets/sounds/Jump4.wav", __ASSET__assets_sounds_jump4_wav);
		type.set ("assets/sounds/Jump4.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		
		className.set ("assets/sounds/Laser_Shoot6.wav", __ASSET__assets_sounds_laser_shoot6_wav);
		type.set ("assets/sounds/Laser_Shoot6.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		
		className.set ("assets/sounds/Powerup12.wav", __ASSET__assets_sounds_powerup12_wav);
		type.set ("assets/sounds/Powerup12.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		
		className.set ("assets/sounds/Randomize3.wav", __ASSET__assets_sounds_randomize3_wav);
		type.set ("assets/sounds/Randomize3.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
		
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp3);
		type.set ("assets/sounds/beep.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		
		
		#else
		
		var loadManifest = true;
		
		#end
		
		if (loadManifest) {
			try {
				
				#if blackberry
				var bytes = ByteArray.readFile ("app/native/manifest");
				#elseif tizen
				var bytes = ByteArray.readFile ("../res/manifest");
				#elseif emscripten
				var bytes = ByteArray.readFile ("assets/manifest");
				#else
				var bytes = ByteArray.readFile ("manifest");
				#end
				
				if (bytes != null) {
					
					bytes.position = 0;
					
					if (bytes.length > 0) {
						
						var data = bytes.readUTFBytes (bytes.length);
						
						if (data != null && data.length > 0) {
							
							var manifest:Array<AssetData> = Unserializer.run (data);
							
							for (asset in manifest) {
								
								if (!className.exists(asset.id)) {
									
									path.set (asset.id, asset.path);
									type.set (asset.id, asset.type);
									
								}
							}
						
						}
					
					}
				
				} else {
				
					trace ("Warning: Could not load asset manifest");
				
				}
			
			} catch (e:Dynamic) {
			
				trace ("Warning: Could not load asset manifest");
			
			}
		
		}
		
		#end
		
	}
	
	
	#if html5
	private function addEmbed(id:String, kind:String, value:Dynamic):Void {
		className.set(id, value);
		type.set(id, Reflect.field(AssetType, kind.toUpperCase()));
	}
	
	
	private function addExternal(id:String, kind:String, value:String):Void {
		path.set(id, value);
		type.set(id, Reflect.field(AssetType, kind.toUpperCase()));
	}
	#end
	
	
	public override function exists (id:String, type:AssetType):Bool {
		
		var assetType = DefaultAssetLibrary.type.get (id);
		
		#if pixi
		
		if (assetType == IMAGE) {
			
			return true;
			
		} else {
			
			return false;
			
		}
		
		#end
		
		if (assetType != null) {
			
			if (assetType == type || ((type == SOUND || type == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if ((assetType == BINARY || assetType == TEXT) && type == BINARY) {
				
				return true;
				
			} else if (path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (type == BINARY || type == null) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getBitmapData (id:String):BitmapData {
		
		#if pixi
		
		return BitmapData.fromImage (path.get (id));
		
		#elseif (flash)
		
		return cast (Type.createInstance (className.get (id), []), BitmapData);
		
		#elseif openfl_html5
		
		return BitmapData.fromImage (ApplicationMain.images.get (path.get (id)));
		
		#elseif js
		
		return cast (ApplicationMain.loaders.get (path.get (id)).contentLoaderInfo.content, Bitmap).bitmapData;
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), BitmapData);
		else return BitmapData.load (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if pixi
		
		return null;
		
		#elseif (flash)
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);
		
		#elseif openfl_html5
		
		return null;
		
		#elseif js
		
		var bytes:ByteArray = null;
		var data = ApplicationMain.urlLoaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}

		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), ByteArray);
		else return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if pixi
		
		return null;
		
		#elseif (flash || js)
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists(id)) {
			var fontClass = className.get(id);
			Font.registerFont(fontClass);
			return cast (Type.createInstance (fontClass, []), Font);
		} else return new Font (path.get (id));
		
		#end
		
	}
	
	
	public override function getMusic (id:String):Sound {
		
		#if pixi
		
		return null;
		
		#elseif (flash)
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		var sound = new Sound ();
		sound.__buffer = true;
		sound.load (new URLRequest (path.get (id)));
		return sound; 
		
		#elseif js
		
		return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}
	
	
	public override function getPath (id:String):String {
		
		#if ios
		
		return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		#else
		
		return path.get (id);
		
		#end
		
	}
	
	
	public override function getSound (id:String):Sound {
		
		#if pixi
		
		return null;
		
		#elseif (flash)
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif js
		
		return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		else return new Sound (new URLRequest (path.get (id)), null, type.get (id) == MUSIC);
		
		#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if js
		
		var bytes:ByteArray = null;
		var data = ApplicationMain.urlLoaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			return cast data;
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes.readUTFBytes (bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:AssetType):Bool {
		
		#if flash
		
		if (type != AssetType.MUSIC && type != AssetType.SOUND) {
			
			return className.exists (id);
			
		}
		
		#end
		
		return true;
		
	}
	
	
	public override function loadBitmapData (id:String, handler:BitmapData -> Void):Void {
		
		#if pixi
		
		handler (getBitmapData (id));
		
		#elseif (flash || js)
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBitmapData (id));
			
		}
		
		#else
		
		handler (getBitmapData (id));
		
		#end
		
	}
	
	
	public override function loadBytes (id:String, handler:ByteArray -> Void):Void {
		
		#if pixi
		
		handler (getBytes (id));
		
		#elseif (flash || js)
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				handler (bytes);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBytes (id));
			
		}
		
		#else
		
		handler (getBytes (id));
		
		#end
		
	}
	
	
	public override function loadFont (id:String, handler:Font -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getFont (id));
			
		//}
		
		#else
		
		handler (getFont (id));
		
		#end
		
	}
	
	
	public override function loadMusic (id:String, handler:Sound -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getMusic (id));
			
		//}
		
		#else
		
		handler (getMusic (id));
		
		#end
		
	}
	
	
	public override function loadSound (id:String, handler:Sound -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getSound (id));
			
		//}
		
		#else
		
		handler (getSound (id));
		
		#end
		
	}
	
	
	public override function loadText (id:String, handler:String -> Void):Void {
		
		#if js
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (event.currentTarget.data);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getText (id));
			
		}
		
		#else
		
		var callback = function (bytes:ByteArray):Void {
			
			if (bytes == null) {
				
				handler (null);
				
			} else {
				
				handler (bytes.readUTFBytes (bytes.length));
				
			}
			
		}
		
		loadBytes (id, callback);
		
		#end
		
	}
	
	
}


#if pixi
#elseif flash

@:keep class __ASSET__assets_data_ld48_oep extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_data_level00_oel extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_data_level01_oel extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_data_level02_oel extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_data_level03_oel extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_data_level04_oel extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_data_level05_oel extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_data_level06_oel extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_data_level07_oel extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_data_level08_oel extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_data_level09_oel extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_images_blank_fw_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_coldbrick_fw_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_coldenemy_fw_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_coldtiles_fw_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_fireenemy_fw_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_haxeflixeltut_fw_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_hotbrick_fw_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_hottiles_fw_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_ld48toon_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_images_sheet_xml extends flash.utils.ByteArray { }
@:keep class __ASSET__assets_images_tilesheet_fw_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep class __ASSET__assets_sounds_explosion7_wav extends flash.media.Sound { }
@:keep class __ASSET__assets_sounds_hit_hurt35_wav extends flash.media.Sound { }
@:keep class __ASSET__assets_sounds_jump4_wav extends flash.media.Sound { }
@:keep class __ASSET__assets_sounds_laser_shoot6_wav extends flash.media.Sound { }
@:keep class __ASSET__assets_sounds_powerup12_wav extends flash.media.Sound { }
@:keep class __ASSET__assets_sounds_randomize3_wav extends flash.media.Sound { }
@:keep class __ASSET__assets_sounds_beep_mp3 extends flash.media.Sound { }
@:keep class __ASSET__assets_sounds_flixel_mp3 extends flash.media.Sound { }


#elseif html5

































#elseif (windows || mac || linux)


@:file("assets/data/ld48.oep") class __ASSET__assets_data_ld48_oep extends flash.utils.ByteArray {}
@:file("assets/data/level00.oel") class __ASSET__assets_data_level00_oel extends flash.utils.ByteArray {}
@:file("assets/data/level01.oel") class __ASSET__assets_data_level01_oel extends flash.utils.ByteArray {}
@:file("assets/data/level02.oel") class __ASSET__assets_data_level02_oel extends flash.utils.ByteArray {}
@:file("assets/data/level03.oel") class __ASSET__assets_data_level03_oel extends flash.utils.ByteArray {}
@:file("assets/data/level04.oel") class __ASSET__assets_data_level04_oel extends flash.utils.ByteArray {}
@:file("assets/data/level05.oel") class __ASSET__assets_data_level05_oel extends flash.utils.ByteArray {}
@:file("assets/data/level06.oel") class __ASSET__assets_data_level06_oel extends flash.utils.ByteArray {}
@:file("assets/data/level07.oel") class __ASSET__assets_data_level07_oel extends flash.utils.ByteArray {}
@:file("assets/data/level08.oel") class __ASSET__assets_data_level08_oel extends flash.utils.ByteArray {}
@:file("assets/data/level09.oel") class __ASSET__assets_data_level09_oel extends flash.utils.ByteArray {}
@:bitmap("assets/images/BLANK.fw.png") class __ASSET__assets_images_blank_fw_png extends flash.display.BitmapData {}
@:bitmap("assets/images/coldBrick.fw.png") class __ASSET__assets_images_coldbrick_fw_png extends flash.display.BitmapData {}
@:bitmap("assets/images/coldEnemy.fw.png") class __ASSET__assets_images_coldenemy_fw_png extends flash.display.BitmapData {}
@:bitmap("assets/images/coldTiles.fw.png") class __ASSET__assets_images_coldtiles_fw_png extends flash.display.BitmapData {}
@:bitmap("assets/images/fireEnemy.fw.png") class __ASSET__assets_images_fireenemy_fw_png extends flash.display.BitmapData {}
@:bitmap("assets/images/haxeFlixeltut.fw.png") class __ASSET__assets_images_haxeflixeltut_fw_png extends flash.display.BitmapData {}
@:bitmap("assets/images/hotBrick.fw.png") class __ASSET__assets_images_hotbrick_fw_png extends flash.display.BitmapData {}
@:bitmap("assets/images/hotTiles.fw.png") class __ASSET__assets_images_hottiles_fw_png extends flash.display.BitmapData {}
@:bitmap("assets/images/ld48Toon.png") class __ASSET__assets_images_ld48toon_png extends flash.display.BitmapData {}
@:file("assets/images/sheet.xml") class __ASSET__assets_images_sheet_xml extends flash.utils.ByteArray {}
@:bitmap("assets/images/tileSheet.fw.png") class __ASSET__assets_images_tilesheet_fw_png extends flash.display.BitmapData {}
@:sound("assets/sounds/Explosion7.wav") class __ASSET__assets_sounds_explosion7_wav extends flash.media.Sound {}
@:sound("assets/sounds/Hit_Hurt35.wav") class __ASSET__assets_sounds_hit_hurt35_wav extends flash.media.Sound {}
@:sound("assets/sounds/Jump4.wav") class __ASSET__assets_sounds_jump4_wav extends flash.media.Sound {}
@:sound("assets/sounds/Laser_Shoot6.wav") class __ASSET__assets_sounds_laser_shoot6_wav extends flash.media.Sound {}
@:sound("assets/sounds/Powerup12.wav") class __ASSET__assets_sounds_powerup12_wav extends flash.media.Sound {}
@:sound("assets/sounds/Randomize3.wav") class __ASSET__assets_sounds_randomize3_wav extends flash.media.Sound {}
@:sound("C:/HaxeToolkit/haxe/lib/flixel/git/assets/sounds/beep.mp3") class __ASSET__assets_sounds_beep_mp3 extends flash.media.Sound {}
@:sound("C:/HaxeToolkit/haxe/lib/flixel/git/assets/sounds/flixel.mp3") class __ASSET__assets_sounds_flixel_mp3 extends flash.media.Sound {}


#end
