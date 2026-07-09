import lime.app.Application;
import flixel.FlxG;

typedef SaveData =
{
	var first_time:Null<Bool>;
}

class Save
{
	public static var data(get, set):SaveData;

	static function get_data():SaveData return FlxG.save.data.game;

	static function set_data(data:SaveData):SaveData return FlxG.save.data.game = data;

	public static function init()
	{
		if (FlxG.save.isBound)
			return;

		FlxG.save.bind('Pominetecl', 'Maki');

		data ??= {
			first_time: null,
		};

		data.first_time ??= true;

		Application.current.onExit.add(function(l)
		{
			save();
		});
	}

	static function save()
	{
		data.first_time = false;

		FlxG.save.flush();
	}
}
