package scaffold.styles
{
	import helpers.FileHelper;
	
	import scaffold.styles.dao.CsvDAO;
	import scaffold.styles.dao.StylesGroupDAO;
	import scaffold.styles.dao.StylesPropertyDAO;
	
	import utils.StringUtil;
	
	public class StylesParser
	{
//		private var _reference : XML;
		private var _csv : String;
		
		public function StylesParser()
		{
//			_reference = new XML( FileHelper.read( "/scaffold/styles/reference/css.xml" ) );
			_csv = FileHelper.read( "/scaffold/styles/reference/css.csv" );
		}
		
		public function get data () : Array
		{
			var file : Array;
			var line : String;
			var column : CsvDAO;
			var group : StylesGroupDAO; 
			var groups : Array;
			
			file = _csv.split( "\n" ).slice ( 1 );
			groups = [];
			
			for each ( line in file )
			{
				column = new CsvDAO ( line );
				if ( column.isgroup )
					groups.push ( group = _parse_group( column ) );
				else if ( column.parseable )
					group.properties.push( _parse_properties( column, group ) );
			}
			
			return groups;
		}
		
		
		private function _parse_group ( column : CsvDAO ) : StylesGroupDAO
		{
			var output : StylesGroupDAO;
			
			output = new StylesGroupDAO ();
			output.render_description = column.rdesc_getter;
			output.selector_description = column.sdesc_setter;
			output.name_camel = StringUtil.ucasef( column.selector );
			
			return output;
		}
		
		private function _parse_properties ( column : CsvDAO, group : StylesGroupDAO ) : StylesPropertyDAO
		{
			var output : StylesPropertyDAO;
			
			output = new StylesPropertyDAO ();
			output.lower = column.property.toLocaleLowerCase();
			output.lower_method = StringUtil.replace( output.lower, "-", "_" );
			output.upper = StringUtil.replace( output.lower.toUpperCase(), "-", "_" );
			output.getter_docs = column.rdesc_getter;
			output.getter_return_docs = StringUtil.ucasef( column.rdesc_getter.split ( " " ).slice ( 1 ).join ( " " ) );
			output.setter_docs = column.sdesc_setter;
			output.values = StringUtil.replace( column.values, "|", ", " );
			
			return output;
		}
	}
}