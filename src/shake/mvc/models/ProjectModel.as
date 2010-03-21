package shake.mvc.models
{
	import shake.core.helpers.FileHelper;

	import org.aswing.tree.DefaultMutableTreeNode;
	import org.aswing.tree.DefaultTreeModel;
	import org.aswing.tree.MutableTreeNode;

	import flash.filesystem.File;

	/**
	 * @author nybras | me@nybras.com
	 */
	public class ProjectModel 
	{
		private var _models : Array;

		private var _layouts : Array;

		private var _tree : MutableTreeNode;

		public function ProjectModel() 
		{
			_tree = new DefaultMutableTreeNode( "app" );
		}

		public function feed( layouts : Array, models : Array ) : void
		{
			_models = models;
			_layouts = layouts;
			_parse( );
		}

		private function _clear() : void 
		{
			var len : int = _tree.getChildCount( );
			for (var i : int = len; --i >= 0; ) 
				_tree.removeAt( i );
		}

		private function _parse() : void 
		{
			var i : int;
			var len : int;
			var item : MutableTreeNode;
			var layout : File;
			var model : File;
			
			_clear( );			
			len = Math.max( _layouts.length, _models.length );
			do
			{
				if( i < _layouts.length )
					layout = _layouts[ i ];
				
				if( i < _models.length )
					model = _models[ i ];
				
				if( layout.name == model.name )
				{
					item = new DefaultMutableTreeNode( model.name.split( "." ).shift( ) );
					_tree.insert( item, item.getChildCount( ) );
					_parse_both( item, layout, model );
				}
				else
					trace( "TODO: Code exception here at ExplorerModel@44" );
			}
			while( ++i < len );
		}

		private function _parse_both( item : MutableTreeNode, layout : File, model : File ) : void 
		{
			_parse_model( item, model );
			_parse_layout( item, layout );
		}

		private function _parse_model( item : MutableTreeNode, file : File ) : void
		{
			var scheme : XML;
			
			item.insert( item = new DefaultMutableTreeNode( "model" ), 0 );
			scheme = new XML( FileHelper.read( file.nativePath ) );
			
			// parse datasouces
			for each( var ds : XML in scheme.children( ) )
				item.insert( new DefaultMutableTreeNode( ds.@id, false ), item.getChildCount( ) );
		}

		private function _parse_layout( item : MutableTreeNode, file : File ) : void 
		{
			var scheme : XML;
			
			item.insert( item = new DefaultMutableTreeNode( "layout" ), 1 );
			scheme = new XML( FileHelper.read( file.nativePath ) );
			
//			// parse layout
//			for each( var ds : XML in scheme.children( ) )
//				 // TODO: parse layout
		}

		public function get tree() : DefaultTreeModel
		{
			return new DefaultTreeModel( _tree );
		}
	}
}