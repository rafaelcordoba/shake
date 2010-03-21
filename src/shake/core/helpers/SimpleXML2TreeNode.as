package 
shake.core.helpers{
	import org.aswing.tree.DefaultMutableTreeNode;
	import org.aswing.tree.MutableTreeNode;

	/**
	 * Parse XML to AsWing tree node.
	 *
	 * @author harry
	 */
	public class SimpleXML2TreeNode 
	{
		protected var _root : MutableTreeNode;

		protected var _xml : XML;

		protected var labelField : String;

		public var autoParse : Boolean;

		public function get root() : MutableTreeNode 
		{
			return _root;
		}

		public function set root(value : MutableTreeNode) : void 
		{
			_root = value;
			if(autoParse) parse( );
		}

		public function set xml(value : XML) : void 
		{
			_xml = value;
			if(autoParse) parse( );
		}

		public function get xml() : XML 
		{
			return _xml;
		}

		public function SimpleXML2TreeNode(xml : XML,
            root : MutableTreeNode = null,
            labelField : String = "@label",
            autoParse : Boolean = false) 
		{
 
			_xml = xml;
			this.labelField = labelField;
			this.autoParse = autoParse;
			this.root = root || new DefaultMutableTreeNode( "root" );
		}

		public function parse() : void 
		{
			removeAllRootChildern( );
			parseXML( xml, _root );
		}

		public function removeAllRootChildern() : void 
		{
			var len : int = root.getChildCount( ) - 1;
			for (var i : int = len; i <= 0; i--) 
			{
				root.removeAt( i );
			}
		}

		protected function parseXML(xml : XML, node : MutableTreeNode) : void
		{
			var subnode : DefaultMutableTreeNode = new DefaultMutableTreeNode( xml[labelField] );
			node.insert( subnode, node.getChildCount( ) );
 
			var children : XMLList = xml.children( );
			for each(var subxml:XML in children) 
			{
				parseXML( subxml, subnode );
			}
		}
	}
}