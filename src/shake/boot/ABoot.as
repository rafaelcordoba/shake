package shake.boot
{
	import mx.core.UIComponent;

	import flash.display.DisplayObject;
	import flash.display.Sprite;

	/**
	 * @author Carlinhos
	 */
	public class ABoot extends Sprite 
	{
		protected var _boot : Boot;

		protected var _holder : UIComponent;

		public function ABoot( boot : Boot )
		{
			_boot = boot;
			_holder = new UIComponent( );
			_boot.holder.addChild( _holder );
		}

		override public function addChild( child : DisplayObject ) : DisplayObject
		{
			return _holder.addChild( child );
		}
	}
}
