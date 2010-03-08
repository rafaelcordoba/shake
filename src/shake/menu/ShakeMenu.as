package shake.menu 
{
	import cocktail.core.gunz.Gun;
	import cocktail.core.gunz.Gunz;

	import shake.base.Base;
	import shake.base.BaseShake;
	import shake.menu.gunz.MenuBullet;

	import mx.controls.MenuBar;
	import mx.events.MenuEvent;

	/**
	 * @author Carlinhos
	 */
	public class ShakeMenu extends BaseShake 
	{
		/* GUNZ */
		public var gunz : Gunz;
		public var gunz_select : Gun;
				
		/* vars */
		private var _menu : MenuBar;
		
		/* MENU ITEM DATA */
		public static var NEW_COCKTAIL_PROJECT : String = "NEW_COCKTAIL_PROJECT";
		public static var OPEN_COCKTAIL_PROJECT : String = "OPEN_COCKTAIL_PROJECT";
		
		public function ShakeMenu( base : Base )
		{
			super( base );
			_init_gunz();
		}
		
		private function _init_gunz () : void
		{
			gunz = new Gunz( this );
			gunz_select = new Gun( gunz, this, "menu_select" );
		}
		
		public function set menu ( menu : MenuBar ) : void
		{
			_menu = menu;
			_menu.addEventListener( MenuEvent.ITEM_CLICK, _menu_select );
		}
		
		private function _menu_select ( event : MenuEvent ) : void
		{
			gunz_select.shoot( new MenuBullet( ( event.item as XML ).@data ) );
		}
	}
}
