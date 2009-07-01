package scaffold.styles
{
	import helpers.FileHelper;
	
	import scaffold.styles.dao.StylesGroupDAO;
	
	public class StylesParser
	{
		private var _reference : XML;
		
		public function StylesParser()
		{
			_reference = new XML( FileHelper.read( "/scaffold/styles/reference/css.xml" ) );
		}
		
		public function get data () : StylesGroupDAO
		{
			var group : StylesGroupDAO;
			
			group = new StylesGroupDAO();
			
			// TODO: implement method 
			
			return group;
		}
		
		private function _parse_group () : *
		{
			// TODO: implement method 
			return {};
			
		}
		
		private function _parse_properties () : *
		{
			// TODO: implement method 
			return {};
		}
		
		
	}
}