package shake.mvc.models
{

	/**
	 * @author nybras | me@nybras.com
	 */
	public class ExplorerModel 
	{
		private var _models : Array;
		private var _layout : Array;
		private var _tree : XML;
		
		public function ExplorerModel( layout: Array, models : Array ) 
		{
			_tree = new XML( "app" );
			_models = models;
			_layout = layout;
			parse( );
		}

		private function parse() : void 
		{
			
		}
	}
}