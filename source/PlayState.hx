package;

import flixel.util.FlxTimer;
import flixel.sound.FlxSound;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class PlayState extends FlxState
{
	var saleswoman:FlxSprite;

	var cutting_room_floor:FlxSound;

	override public function create()
	{
		super.create();

		saleswoman = new FlxSprite();
		saleswoman.loadGraphic(Paths.texture('pominetecl'));
		add(saleswoman);

		saleswoman.screenCenter(X);
		saleswoman.y = FlxG.height - saleswoman.height;

		cutting_room_floor = new FlxSound().loadEmbedded(Paths.audio('cutting'), false, false, onCRFComplete);
		onCRFComplete();
		FlxG.sound.list.add(cutting_room_floor);
	}

	function onCRFComplete()
	{
		FlxTimer.wait(FlxG.random.float(0.5, 2), function()
		{
			trace('[[track0]]');
			cutting_room_floor.play();
		});
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
