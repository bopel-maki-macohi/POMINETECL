import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;

class OptionSelect extends FlxSubState
{
	var options:OptionContainer;

	override public function new(line_path:String)
	{
		super();

		var options_path = 'default';

		options = new OptionContainer(options_path);
	}

	var fade:FlxSprite;

	override function create()
	{
		super.create();

		fade = new FlxSprite().makeGraphic(Math.round(FlxG.width * 1.1), Math.round(FlxG.height * 1.1), FlxColor.BLACK);
		add(fade);

		fade.alpha = 0;
		FlxTween.tween(fade, {alpha: 0.3}, 1, {ease: FlxEase.sineInOut});
	}
}
