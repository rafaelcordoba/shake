package shake.core.system.gunz {
	import cocktail.core.gunz.Bullet;	/**
	 * @author Carlinhos
	 */
	public class SystemBullet extends Bullet 
	{
		/* VARS */
		public var layouts : Array;
		public var models : Array;
		public function SystemBullet( views : Array = null, models : Array = null )
		{
			super( );
			this.layouts = views;
			this.models = models;
		}
	}
}
