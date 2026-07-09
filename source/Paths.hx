class Paths
{
	public static function asset(path:String):String return 'assets/$path';

	public static function audio(path:String):String return asset('snd/$path.wav');

	public static function texture(path:String):String return asset('spr/$path.png');
}
