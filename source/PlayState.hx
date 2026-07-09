package;

import flixel.FlxSprite;
import flixel.FlxState;

class PlayState extends FlxState
{
	var saleswoman:FlxSprite;

	override public function create()
	{
		super.create();

		saleswoman = new FlxSprite();
		saleswoman.loadGraphic(Paths.texture('pominetecl'));
		add(saleswoman);

		saleswoman.screenCenter();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
