package shake.mvc.controllers 
{
	import cocktail.core.gunz.Gun;
	import cocktail.core.gunz.Gunz;

	import shake.mvc.models.MenuModel;
	import shake.mvc.views.MenuView;

	/**
	 * @author nybras | me@nybras.com
	 */
	public class MenuController 
	{
		/* GUNZ */
		public var gunz : Gunz;

		public var gunz_select : Gun;

		private function _init_gunz() : void
		{
			gunz = new Gunz( this );
			gunz_select = new Gun( gunz, this, "sustem-select" );
		}

		/* VARS */
		private var _shake : Shake;

		private var _view : MenuView;

		private var _model : MenuModel;

		public function MenuController( shake : Shake )
		{
			_init( shake );
			_init_gunz( );
			_init_mv( );
		}

		private function _init( shake : Shake ) : void 
		{
			_shake = shake;
		}

		private function _init_mv() : void 
		{
			_model = new MenuModel( _shake );
			_shake.addChild( _view = new MenuView( _shake ) );
		}
	}
}