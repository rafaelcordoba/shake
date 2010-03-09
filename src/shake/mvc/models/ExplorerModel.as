package shake.mvc.models
{
	import shake.core.helpers.FileHelper;

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
			var layout : File;
			var model : File;
			
			len = Math.max( _layouts.length, _models.length );
			do
			{
				if( i < _layouts.length )
					layout = _layouts[ i ];
				
				if( i < _models.length )
					model = _models[ i ];
				
				if( layout.name == model.name )
					_tree.appendChild( _parse_both( layout, model ) );
				else
					trace( "TODO: Code exception here at ExplorerModel@44" );
			}
			while( ++i < len );
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
			var scheme : XML;
			
			item = <node label="layout" />;
			scheme = new XML( FileHelper.read( file.nativePath ) );
			
			// parse layout views
			for each( var ds : XML in scheme.children( ) )
				// TODO: parse layout views
				ds;
			
			return item;
		}

		private function _parse_model( file : File ) : XML
		{
			var item : XML;
			var scheme : XML;
			
			item = <node label="model" />;
			scheme = new XML( FileHelper.read( file.nativePath ) );
			
			// parse datasouces
			for each( var ds : XML in scheme.children( ) )
				item.appendChild( <node label={ds.@id} data={ds.localName( ) } /> );
			
			return item;
		}

		public function get tree() : XML
		{
			return _tree;
		}
	}
}