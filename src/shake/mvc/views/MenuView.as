package shake.mvc.views 
{
	import org.aswing.AsWingManager;
	import org.aswing.JFrame;
	import org.aswing.JMenu;
	import org.aswing.JMenuBar;
	import org.aswing.JMenuItem;
	import org.aswing.JScrollPane;

	import flash.events.Event;
	import flash.events.MouseEvent;

	/**
	 * @author nybras | me@nybras.com
	 */
	public class MenuView extends JFrame 
	{
		/* BARS */
		private var _shake : Shake;

		/* MENU, MENU BAR */
		private var _menu : JMenu;

		private var _menu_bar : JMenuBar;

		/* MENU BUTTONS - FILE */
		private var _new : JMenuItem;

		private var _open : JMenuItem;

		/* CONSTRUCTOR */
		public function MenuView( shake : Shake )
		{
			AsWingManager.initAsStandard( this );
			
			_shake = shake;
			
			// MENU's menu
			_menu_bar = new JMenuBar( );
			
			// FILE's menu
			_menu_bar.addMenu( _menu = new JMenu( "File" ) );
			_new = _menu.addMenuItem( "New..." );
			_open = _menu.addMenuItem( "Open..." );
			
			_menu_bar.addMenu( _menu = new JMenu( "System" ) );
			_menu.addMenuItem( "Xyz..." );
			
			_menu_bar.addMenu( _menu = new JMenu( "Preferences" ) );
			_menu.addMenuItem( "Xyz..." );			
			setTitle( "Menu" );
			setSizeWH( 200, 60 );
			setContentPane( new JScrollPane( _menu_bar ) );
						addEventListener( Event.ADDED_TO_STAGE, _show );
		}

		private function _show( ...etc ) : void
		{
			removeEventListener( Event.ADDED_TO_STAGE, _show );
			owner = this.parent;
			show( );
			_set_triggers( );
		}

		private function _set_triggers() : void 
		{
			_open.addEventListener( MouseEvent.CLICK, _shake.project.open );
		}
	}
}