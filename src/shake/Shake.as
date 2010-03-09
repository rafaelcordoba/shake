package shake  
{
	import shake.boot.ABoot;
	import shake.boot.Boot;
	import shake.core.system.System;
	import shake.core.system.gunz.SystemBullet;
	import shake.mvc.views.menu.ShakeMenu;
	import shake.mvc.views.menu.gunz.MenuBullet;
	import shake.mvc.views.tree.ShakeTree;

	/**
	 * @author Carlinhos
	 * 
	 * This class is the init view of the application.
	 */
	public class Shake extends ABoot 
	{
		/* vars */
		private var menu : ShakeMenu;
		private var tree : ShakeTree;
		private var system : System;
		
		/**
		 * Constructor
		 * 
		 * This class is instanciated by the main mxml entrypoint ( Boot.mxml )
		 */
		public function Shake( boot : Boot )
		{
			super( boot );
			add_childs();
		}
		
		/**
		 * Adding the local childs 
		 */
		private function add_childs() : void
		{
			//menu
			menu = new ShakeMenu( _boot );
			menu.menu = _boot.applicationMenu;
			menu.gunz_select.add( menu_change );
			addChild( menu );
			
			//tree
			tree = new ShakeTree( _boot );
			tree.tree = _boot.shakeTree;
			addChild( tree );
			
			//system
			system = new System();
			system.gunz_select.add( _system_select );
		}

		/**
		 * Invoked by gunz when the user change in menu.
		 */
		private function menu_change ( bullet : MenuBullet ) : void
		{
			switch ( bullet.selected ) 
			{
				case ShakeMenu.NEW_COCKTAIL_PROJECT :
				break;
				case ShakeMenu.OPEN_COCKTAIL_PROJECT :
					system.open_project();
				break;
			}
		}
		
		/**
		 * Invoked by the gunz when the user selects a app folder.
		 */
		private function _system_select ( bullet : SystemBullet ) : void
		{
			tree.mount( bullet.views, bullet.models );
		}
	}
}
