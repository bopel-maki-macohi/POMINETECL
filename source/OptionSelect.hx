import flixel.text.FlxText;
import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;

class OptionSelect extends FlxSubState
{
	override public function new(line_path:String)
	{
		super();

		var options_path = 'default';

		options = new OptionContainer(options_path);
	}

	var fade:FlxSprite;

	var options:OptionContainer;
	var options_text:FlxTypedSpriteGroup<FlxText>;

	var current_selection:Int = 0;

	override function create()
	{
		super.create();

		fade = new FlxSprite().makeGraphic(Math.round(FlxG.width * 1.1), Math.round(FlxG.height * 1.1), FlxColor.BLACK);
		add(fade);

		fade.alpha = 0;
		FlxTween.tween(fade, {alpha: 0.3}, 1, {ease: FlxEase.sineInOut});

		options_text = new FlxTypedSpriteGroup<FlxText>();
		add(options_text);
		options_text.alpha = 0;
		FlxTween.tween(options_text, {alpha: 1}, 1, {ease: FlxEase.sineInOut});

		for (i => option in options.lines)
		{
			var option_text = new FlxText(0, 0, 0, option, 16);
			option_text.ID = i;

			options_text.add(option_text);
		}

		updateTexts();
	}

	function updateTexts()
	{
		for (option_text in options_text)
		{
			option_text.x = 16;
			option_text.y = 16 + (option_text.ID * (option_text.size * 2));

			option_text.color = (option_text.ID == current_selection) ? FlxColor.YELLOW : FlxColor.WHITE;
		}
	}
}
