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

	var sequence:DialogueSequence;
	var sequence_entry:Int = -1;

	var line_wait:Float = 0.5;

	var sequence_complete(get, never):Bool;

	function get_sequence_complete():Bool
	{
		// trace('$sequence_entry');
		// trace('${sequence.lines.length}');
		return sequence_entry >= sequence.lines.length;
	}

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

		saleswoman_text = new FlxTypeText(0, 0, FlxG.width, 'Superman', 16);
		add(saleswoman_text);

		saleswoman_text.alignment = CENTER;

		saleswoman_text.sounds = [
			new FlxSound().loadEmbedded(Paths.audio('txt-saleswoman1')),
			new FlxSound().loadEmbedded(Paths.audio('txt-saleswoman2')),
			new FlxSound().loadEmbedded(Paths.audio('txt-saleswoman3')),
		];
		saleswoman_text.finishSounds = true;

		sequence = new DialogueSequence('intro-new');
		sequence_entry = -1;

		continueSequence();
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
		saleswoman_text.start(0.05, false, false, [], onTypingComplete);
	}

	function onTypingComplete()
	{
		if (!sequence_complete)
			FlxTimer.wait(line_wait, continueSequence);
	}

	function continueSequence()
	{
		sequence_entry++;

		if (sequence_complete)
			onSequenceComplete();
		else
			dialogue(sequence.lines[sequence_entry]);
	}

	function onSequenceComplete()
	{
		trace('[[fatality]]');
		FlxTimer.wait(line_wait * 2, function()
		{
			dialogue('');
		});
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
