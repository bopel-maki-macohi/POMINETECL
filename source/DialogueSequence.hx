using StringTools;

class DialogueSequence
{
	public var lines:Array<String> = [];

	public function new(sequence:String)
	{
		load(sequence);
	}

	public function load(sequence:String)
	{
		var fileContent = Paths.getText('seq/$sequence');

		lines = [for (line in fileContent.split('\n')) if (line.trim().length > 0) line.trim()];

		trace(lines);
	}
}
