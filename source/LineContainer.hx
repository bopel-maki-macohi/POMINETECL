using StringTools;

class LineContainer
{
	public var lines:Array<String> = [];

	public var line_file(default, null):String;

	var path_prefix:String = '';

	public function new(?line_file:String)
	{
		load(line_file);
	}

	public function load(line_file:String)
	{
		this.line_file = line_file;
		lines = [];

		final path = Paths.text('$path_prefix$line_file');

		if (line_file == null) return;
		if (!Paths.exists(path)) return;

		var fileContent = Paths.getText(path);

		lines = [for (line in fileContent.split('\n')) if (line.trim().length > 0) line.trim()];

		trace(lines);
	}
}
