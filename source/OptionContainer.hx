class OptionContainer extends LineContainer
{
	override public function new(?line_file:String)
	{
		path_prefix = 'opt/';
		super(line_file);
	}
}
