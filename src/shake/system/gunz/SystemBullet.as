package shake.system.gunz 
{
	import shake.gunz.Bullet;

	/**
	 * @author Carlinhos
	 */
	public class SystemBullet extends Bullet 
	{
		/* VARS */
		public var views : Array;
		public var models : Array;
		
		public function SystemBullet( views : Array = null, models : Array = null )
		{
			super( );
			this.views = views;
			this.models = models;
		}
	}
}
