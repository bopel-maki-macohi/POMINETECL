package;

import flixel.addons.text.FlxTypeText;
import flixel.util.FlxTimer;
import flixel.sound.FlxSound;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class PlayState extends FlxState
{
	var saleswoman:FlxSprite;

	var saleswoman_text:FlxTypeText;

	var cutting_room_floor:FlxSound;

	override public function create()
	{
		super.create();

		saleswoman = new FlxSprite();
		saleswoman.loadGraphic(Paths.texture('pominetecl'), true, 256, 256);
		saleswoman.animation.add('idle', [0]);
		saleswoman.animation.play('idle');
		add(saleswoman);

		saleswoman.screenCenter(X);
		saleswoman.y = FlxG.height - saleswoman.height;

		cutting_room_floor = new FlxSound().loadEmbedded(Paths.audio('cutting'), false, false, onCRFComplete);
		onCRFComplete();

		FlxG.sound.list.add(cutting_room_floor);

		saleswoman_text = new FlxTypeText(0, 0, 0, 'Superman', 16);
		add(saleswoman_text);

		dialogue('hello world');
	}

	function onCRFComplete()
	{
		FlxTimer.wait(FlxG.random.float(0.5, 2), function()
		{
			trace('[[track0]]');
			cutting_room_floor.play();
		});
	}

	function dialogue(dialog:String)
	{
		saleswoman_text.resetText(dialog);
		saleswoman_text.start(0.05);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
