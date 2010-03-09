package shake.mvc.views.menu.gunz 
{
	import cocktail.core.gunz.Bullet;

	/**
	 * @author Carlinhos
	 */
	public class MenuBullet extends Bullet 
	{
		/* VARS */
		
		public var selected : String = "";
		
		public function MenuBullet( selected : String = "" )
		{
			super( );
			this.selected = selected;
		}
	}
}
