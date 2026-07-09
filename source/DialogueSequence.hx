using StringTools;

class DialogueSequence
{
	public var lines:Array<String> = [];

	public function new(?sequence:String)
	{
		load(sequence);
	}

	public function load(sequence:String)
	{
		final seqPath = Paths.text('seq/$sequence');

		if (sequence == null) return;
		if (!Paths.exists(seqPath)) return;

		var fileContent = Paths.getText(seqPath);

		lines = [for (line in fileContent.split('\n')) if (line.trim().length > 0) line.trim()];

		trace(lines);
	}
}
