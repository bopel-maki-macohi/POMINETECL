import flixel.FlxSprite;

class Pominetecl extends FlxSprite
{
	override public function new()
	{
		super();
        
		loadGraphic(Paths.texture('pominetecl'), true, 256, 256);
		animation.add('idle', [0]);
		animation.play('idle');
	}
}
