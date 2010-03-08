package  
shake.base
{
	import shake.menu.gunz.MenuBullet;
	import shake.menu.ApplicationMenu;

	/**
	 * @author Carlinhos
	 * 
	 * This class is the init view of the application.
	 */
	public class Shake extends BaseShake 
	{
		/* vars */
		private var menu : ApplicationMenu;
		
		public function Shake( base : Base )
		{
			super( base );
			
			add_childs();
		}
		
		private function add_childs() : void
		{
			//menu
			menu = new ApplicationMenu( _base );
			menu.menu = _base.applicationMenu;
			menu.gunz_select.add( menu_change );
			addChild( menu );
		}
		
		private function menu_change ( bullet : MenuBullet ) : void
		{
			trace( "=D ", bullet.selected );
		}
		
	}
}
