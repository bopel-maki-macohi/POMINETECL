import lime.utils.Assets;

class Paths
{
	public static function asset(path:String):String return 'assets/$path';

	public static function audio(path:String):String return asset('snd/$path.wav');

	public static function texture(path:String):String return asset('spr/$path.png');

	public static function data(path:String):String return asset('dta/$path');

	public static function text(path:String):String return data('$path.txt');

	public static function getText(path:String):String return Assets.getText(text('$path'));
}
