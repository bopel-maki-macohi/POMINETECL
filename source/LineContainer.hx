using StringTools;

class LineContainer
{
	public var lines:Array<String> = [];

	public var line_file(default, null):String;

	var path_prefix:String = '';

	public function new(path_prefix:String, ?line_file:String)
	{
		this.path_prefix = path_prefix;
		load(line_file);
	}

	public function load(line_file:String)
	{
		this.line_file = line_file;
		lines = [];

		final path = Paths.text('${path_prefix ?? ''}${line_file}');

		if (line_file == null) return;
		if (!Paths.exists(path))
		{
			trace('$path does not exist');
			return;
		}

		var fileContent = Paths.getText(path);

		lines = [for (line in fileContent.split('\n')) if (line.trim().length > 0) line.trim()];

		trace(lines);
	}
}
