package shake.menu 
{
	import shake.menu.gunz.MenuBullet;
	import mx.events.MenuEvent;
	import shake.gunz.Gun;
	import shake.gunz.Gunz;
	import shake.base.Base;
	import shake.base.BaseShake;

	import mx.controls.MenuBar;

	/**
	 * @author Carlinhos
	 */
	public class ApplicationMenu extends BaseShake 
	{
		/* GUNZ */
		public var gunz : Gunz;
		public var gunz_select : Gun;
				
		/* vars */
		private var _menu : MenuBar;
		
		
		public function ApplicationMenu( base : Base )
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
			gunz_select.shoot( new MenuBullet( ( event.item as XML ).attribute( "data" ) ) );
		}
	}
}
