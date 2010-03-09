package shake.mvc.views.explorer 
{
	import shake.boot.ABoot;
	import shake.boot.Boot;
	import shake.mvc.models.ExplorerModel;

	import mx.controls.Tree;

	/**
	 * @author Carlinhos
	 */
	public class Explorer extends ABoot 
	{
		/* vars */
		private var _model : ExplorerModel;

		private var _tree : Tree;

		private var data : XML;

		public function Explorer( boot : Boot )
		{
			super( boot );
			
			data = <node label="app"></node>;
		}

		public function set tree( tree : Tree ) : void
		{
			_tree = tree;
		}

		public function mount( layouts : Array, models : Array ) : void
		{
			_model = new ExplorerModel( layouts, models );
			_tree.dataProvider = _model.tree;
		}
	}
}
