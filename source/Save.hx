import lime.app.Application;
import flixel.FlxG;

typedef SaveData =
{
	var first_time:Null<Bool>;
}

class Save
{
	public static var data(get, set):SaveData;

	static function get_data():SaveData return FlxG.save?.data?.game ?? null;

	static function set_data(data:SaveData):SaveData
	{
		if (!FlxG.save.isBound) return null;
		return FlxG.save.data.game = data;
	}

	public static function init()
	{
		FlxG.save.bind('Pominetecl', 'Maki');

		FlxG.save.data.game ??= {};

		data.first_time ??= true;

		Application.current.onExit.add(function(l)
		{
			save();
		});

		trace(data);
	}

	static function save()
	{
		data.first_time = false;

		trace(data);
		FlxG.save.flush();
	}
}
