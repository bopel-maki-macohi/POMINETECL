import lime.app.Application;
import flixel.FlxG;

typedef SaveData = {}

class Save
{
	public static var data(get, set):SaveData;

	static function get_data():SaveData return FlxG.save.data.game;

	static function set_data(data:SaveData):SaveData return FlxG.save.data.game = data;

	public static function init()
	{
		FlxG.save.bind('Pominetecl', 'Maki');

		data ??= {};

		Application.current.onExit.add(function(l)
		{
			save();
		});
	}

	static function save()
	{
		FlxG.save.flush();
	}
}
