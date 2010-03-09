package shake.mvc.views.explorer.gunz 
{
	import cocktail.core.gunz.Bullet;

	/**
	 * @author Carlinhos
	 */
	public class ExplorerBullet extends Bullet 
	{
		public var selected : *;
		
		public function ExplorerBullet( selected : * )
		{
			super( );
			this.selected = selected;
		}
	}
}
