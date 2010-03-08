package shake.mvc.views.tree 
{
	import shake.boot.ABoot;
	import shake.boot.Boot;

	import mx.controls.Tree;

	import flash.filesystem.File;

	/**
	 * @author Carlinhos
	 */
	public class ShakeTree extends ABoot 
	{
		/* vars */
		private var _tree : Tree;

		private var data : XML;

		public function ShakeTree( boot : Boot )
		{
			super( boot );
			
			data = <node label="app"></node>;
		}

		public function set tree( tree : Tree ) : void
		{
			_tree = tree;
		}

		public function mount( views : Array, models : Array ) : void
		{
			_tree.labelField = "@label";
			_tree.dataProvider = data;
			
			var i : uint;
			var name : String;
			var areaNode : XML;
			
			models;
			
			for ( i = 0; i < views.length; i++ )
			{
				name = ( views[i] as File ).name.split( "." )[ 0 ];
				areaNode = data.appendChild( <node label={name}><node label="layout"/><node label="model"/></node> );
			}
		}
	}
}
