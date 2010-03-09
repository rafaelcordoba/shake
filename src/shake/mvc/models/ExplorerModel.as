package shake.mvc.models
{
	import flash.filesystem.File;

	/**
	 * @author nybras | me@nybras.com
	 */
	public class ExplorerModel 
	{
		private var _models : Array;

		private var _layouts : Array;

		private var _tree : XML;

		public function ExplorerModel( layouts : Array, models : Array ) 
		{
			_tree = new XML( <node label="app"/> );
			_models = models;
			_layouts = layouts;
			_parse( );
		}

		private function _parse() : void 
		{
			var i : int;
			var len : int;
			var item : XML;
			var layout : File;
			var model : File;
			
			len = Math.max( _layouts.length, _models.length ); 
			while( i++ < len )
			{
				if( i < _layouts.length )
					layout = _layouts[ i ];
				
				if( i < _models.length )
					model = _models[ i ];
				
				trace( layout.name, model.name );
				if( layout.name == model.name )
					_tree.appendChild( _parse_both( layout, model ) );
				else
					trace( "TODO: Code exception here at ExplorerModel@44" );
			}
		}

		private function _parse_both( layout : File, model : File ) : XML 
		{
			var item : XML;
			
			item = <node label={layout.name.substr( 0, -4 )}/>;
			item.appendChild( _parse_model( model ) );
			item.appendChild( _parse_layout( layout ) );
			
			return item;
		}

		private function _parse_layout( file : File ) : XML 
		{
			var item : XML;
			
			item = <node label="layout" />;
			
			return item;
		}

		private function _parse_model( file : File) : XML 
		{
			var item : XML;
			
			item = <node label="model" />;
			
			return item;
		}

		public function get tree() : XML
		{
			return _tree;
		}
	}
}