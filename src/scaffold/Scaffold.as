package scaffold
{
	import scaffold.styles.Styles;
	import scaffold.styles.StylesParser;
	
	public class Scaffold
	{
		private var _styles : Styles;
		private var _parser : StylesParser;
		
		public function Scaffold()
		{
			_styles = new Styles ();
			_styles.build( ( _parser = new StylesParser () ).data );
		}
	}
}