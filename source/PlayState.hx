package;

import flixel.addons.text.FlxTypeText;
import flixel.util.FlxTimer;
import flixel.sound.FlxSound;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;

class PlayState extends FlxState
{
	public static var played_intro:Bool = false;

	var saleswoman:Pominetecl;
	var saleswoman_text:FlxTypeText;

	var cutting_room_floor:FlxSound;

	var sequence:DialogueContainer;
	var sequence_entry:Int = -1;

	var line_wait:Float = 0.5;

	var sequence_complete(get, never):Bool;

	function get_sequence_complete():Bool
	{
		return sequence_entry >= sequence.lines.length;
	}

	override public function create()
	{
		super.create();

		if (Save.data == null) Save.init();

		saleswoman = new Pominetecl();
		add(saleswoman);

		saleswoman.screenCenter(X);
		saleswoman.y = FlxG.height - saleswoman.height;

		saleswoman_text = new FlxTypeText(0, 0, FlxG.width, 'Superman', 16);
		add(saleswoman_text);

		saleswoman_text.alignment = CENTER;

		saleswoman_text.sounds = [
			new FlxSound().loadEmbedded(Paths.audio('txt-saleswoman1')),
			new FlxSound().loadEmbedded(Paths.audio('txt-saleswoman2')),
			new FlxSound().loadEmbedded(Paths.audio('txt-saleswoman3')),
		];
		saleswoman_text.finishSounds = true;

		sequence = new DialogueContainer(null);

		cutting_room_floor = new FlxSound().loadEmbedded(Paths.audio('cutting'), false, false, onCRFComplete);
		cutting_room_floor.play();

		FlxG.sound.list.add(cutting_room_floor);

		if (!played_intro)
		{
			trace('[[intro]]');
			played_intro = true;

			if (Save.data.first_time) startSequence('intro-new');
			else startSequence('intro-continue');
		}
	}

	function startSequence(seq:String)
	{
		sequence.load(seq);

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

	function continueSequence()
	{
		sequence_entry++;

		if (sequence_complete) onSequenceComplete();
		else dialogue(sequence.lines[sequence_entry]);
	}

	function dialogue(dialog:String)
	{
		saleswoman_text.resetText(dialog);
		saleswoman_text.start(0.05, false, false, [], onTypingComplete);
	}

	function onTypingComplete()
	{
		if (!sequence_complete) FlxTimer.wait(line_wait, continueSequence);
	}

	function onSequenceComplete()
	{
		trace('[[fatality]]');
		FlxTimer.wait(line_wait * 2, function()
		{
			dialogue('');
			openSubState(new OptionSelect(sequence.line_file));
		});
	}
}
