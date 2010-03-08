package  
shake.base
{
	import shake.menu.ShakeMenu;
	import shake.menu.gunz.MenuBullet;
	import shake.system.System;
	import shake.system.gunz.SystemBullet;
	import shake.tree.ShakeTree;

	/**
	 * @author Carlinhos
	 * 
	 * This class is the init view of the application.
	 */
	public class Shake extends BaseShake 
	{
		/* vars */
		private var menu : ShakeMenu;
		private var tree : ShakeTree;
		private var system : System;
		
		/**
		 * Constructor
		 * 
		 * This class is instanciated by the main mxml entrypoint ( Base.mxml )
		 */
		public function Shake( base : Base )
		{
			super( base );
			add_childs();
		}
		
		/**
		 * Adding the local childs 
		 */
		private function add_childs() : void
		{
			//menu
			menu = new ShakeMenu( _base );
			menu.menu = _base.applicationMenu;
			menu.gunz_select.add( menu_change );
			addChild( menu );
			
			//tree
			tree = new ShakeTree( _base );
			tree.tree = _base.shakeTree;
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
