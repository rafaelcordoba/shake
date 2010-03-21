package  
{
	import shake.mvc.controllers.MenuController;
	import shake.mvc.controllers.ProjectController;

	import flash.display.Sprite;

	/**
	 * @author nybras | me@nybras.com
	 */
	public class Shake extends Sprite 
	{
		public var project : ProjectController;

		public var menu : MenuController;

		public function Shake()
		{
			project = new ProjectController( this );
			menu = new MenuController( this );		}
	}
}