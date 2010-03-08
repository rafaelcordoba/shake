package  
shake
{
	import mx.controls.Tree;

	/**
	 * @author Carlinhos
	 */
	public class Shake extends BaseShake 
	{
		public function Shake( base : Base )
		{
			super( base );
			
			var tree : Tree = new Tree();
			tree.width = 300;
			tree.height = 300;
			
			addChild( tree );
		}
	}
}
