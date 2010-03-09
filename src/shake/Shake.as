package shake  
{
	import shake.mvc.views.explorer.gunz.ExplorerBullet;
	import shake.boot.ABoot;
	import shake.boot.Boot;
	import shake.core.system.System;
	import shake.core.system.gunz.SystemBullet;
	import shake.mvc.views.explorer.Explorer;
	import shake.mvc.views.menu.Menu;
	import shake.mvc.views.menu.gunz.MenuBullet;

	/**
	 * @author Carlinhos
	 * 
	 * This class is the init view of the application.
	 */
	public class Shake extends ABoot 
	{
		/* vars */
		private var menu : Menu;
		private var explorer : Explorer;
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
			menu = new Menu( _boot );
			menu.menu = _boot.applicationMenu;
			menu.gunz_select.add( menu_change );
			addChild( menu );
			
			//tree
			explorer = new Explorer( _boot );
			explorer.tree = _boot.shakeTree;
			explorer.gunz_select.add( tree_select );
			addChild( explorer );
			
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
				case Menu.NEW_COCKTAIL_PROJECT :
				break;
				case Menu.OPEN_COCKTAIL_PROJECT :
					system.open_project();
				break;
			}
		}
		
		private function tree_select ( bullet : ExplorerBullet ) : void
		{
			trace( "EXPLORER SELECT ::::::", bullet.selected );
		}
		
		/**
		 * Invoked by the gunz when the user selects a app folder.
		 */
		private function _system_select ( bullet : SystemBullet ) : void
		{
			explorer.mount( bullet.layouts, bullet.models );
		}
	}
}
