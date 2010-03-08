package  
shake
{
	import mx.core.UIComponent;

	import flash.display.DisplayObject;
	import flash.display.Sprite;

	/**
	 * @author Carlinhos
	 */
	public class BaseShake extends Sprite 
	{
		protected var _base : Base;
		protected var _holder : UIComponent;
		
		public function BaseShake( base : Base )
		{
			_base = base;
			_holder = new UIComponent();
			_base.holder.addChild( _holder );
		}
		
		override public function addChild( child : DisplayObject ) : DisplayObject
		{
			return _holder.addChild( child );
		}
	}
}
