package shake.mvc.controllers.gunz {
	import cocktail.core.gunz.Bullet;	/**
	 * @author Carlinhos
	 */
	public class ProjectBullet extends Bullet 
	{
		/* VARS */
		public var layouts : Array;
		public var models : Array;
		public function ProjectBullet( layout : Array = null, models : Array = null )
		{
			super( );
			this.layouts = layout || [];
			this.models = models || [];
		}
	}
}
