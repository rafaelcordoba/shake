package scaffold.styles
{
	import helpers.FileHelper;
	
	import scaffold.styles.dao.StylesGroupDAO;
	import scaffold.styles.dao.StylesPropertyDAO;
	
	public class StylesParser
	{
		private var _reference : XML;
		
		public function StylesParser()
		{
			_reference = new XML( FileHelper.read( "/scaffold/styles/reference/css.xml" ) );
		}
		
		public function get data () : StylesGroupDAO
		{
			// TODO: implement method 
			return _fake_parsed_data;
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
		
		
		private function get _fake_parsed_data () : StylesGroupDAO
		{
			var item : StylesGroupDAO;
            var property : StylesPropertyDAO;
            
            // ITEM
            item = new StylesGroupDAO ();
            item.name_camel = "Position";
            item.description = "Render all position's properties.";
            item.properties = [];
            
            // PROP: left
            property = new StylesPropertyDAO ();
            property.lower = "left";
            property.upper = "LEFT";
            property.values = "auto, length, %, inherit";
            property.documentation = "Sets the left margin edge for a positioned box";
            item.properties.push( property );
            
            // PROP: top
            property = new StylesPropertyDAO ();
            property.lower = "top";
            property.upper = "TOP";
            property.values = "auto, length, %, inherit";
            property.documentation = "Sets the top margin edge for a positioned box";
            item.properties.push( property );
            
            return item;
		}
		
	}
}