package shake.mvc.controllers.gunz 
	import cocktail.core.gunz.Bullet;
	 * @author Carlinhos
	 */
	public class ProjectBullet extends Bullet 
	{
		/* VARS */
		public var layouts : Array;


		{
			super( );
			this.layouts = layout || [];
			this.models = models || [];
		}
	}
}