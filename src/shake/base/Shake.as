package  
shake.base
{
	import shake.menu.gunz.MenuBullet;
	import shake.menu.ShakeMenu;

	/**
	 * @author Carlinhos
	 * 
	 * This class is the init view of the application.
	 */
	public class Shake extends BaseShake 
	{
		/* vars */
		private var menu : ShakeMenu;
		
		public function Shake( base : Base )
		{
			super( base );
			
			add_childs();
		}
		
		private function add_childs() : void
		{
			//menu
			menu = new ShakeMenu( _base );
			menu.menu = _base.applicationMenu;
			menu.gunz_select.add( menu_change );
			addChild( menu );
		}
		
		private function menu_change ( bullet : MenuBullet ) : void
		{
			switch ( bullet.selected ) 
			{
				case ShakeMenu.NEW_COCKTAIL_PROJECT :
				break;
				case ShakeMenu.OPEN_COCKTAIL_PROJECT :
				break;
			}
			
		}
		
	}
}
