package shake.mvc.views.explorer 
{
	import cocktail.core.gunz.Gun;
	import cocktail.core.gunz.Gunz;

	import shake.boot.ABoot;
	import shake.boot.Boot;
	import shake.mvc.models.ExplorerModel;
	import shake.mvc.views.explorer.gunz.ExplorerBullet;

	import mx.controls.Tree;

	import flash.events.Event;

	/**
	 * @author Carlinhos
	 */
	public class Explorer extends ABoot 
	{
		/* vars */
		private var _model : ExplorerModel;
		private var _tree : Tree;
		private var data : XML;
		
		/* GUNZ */
		public var gunz : Gunz;
		public var gunz_select : Gun;

		public function Explorer( boot : Boot )
		{
			super( boot );
			_init_gunz();
			
			data = <node label="app"></node>;
		}
		
		private function _init_gunz() : void
		{
			gunz = new Gunz( this );
			gunz_select = new Gun( gunz, this, "explorer_select" );
		}

		public function set tree( tree : Tree ) : void
		{
			_tree = tree;
			_tree.addEventListener( Event.CHANGE, _tree_change );
		}

		public function mount( layouts : Array, models : Array ) : void
		{
			_model = new ExplorerModel( layouts, models );
			_tree.dataProvider = _model.tree;
		}
		
		/* HANDLERS */
		
		private function _tree_change ( event : Event ) : void
		{
			gunz_select.shoot( new ExplorerBullet( event.currentTarget ) );
		}
	}
}
