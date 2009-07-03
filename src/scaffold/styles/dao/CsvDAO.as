package scaffold.styles.dao
{
	public class CsvDAO
	{
		public var selector : String;
		public var status : String;
		public var property : String;
		public var rdesc_getter : String;
		public var sdesc_setter : String;
		public var values : String;
		
		
		
		public function CsvDAO( raw : String )
		{
			var columns : Array;
			
			columns = raw.split( "," );
			
			selector = columns[ 0 ];
			status = columns[ 1 ];
			property = columns[ 2 ];
			rdesc_getter = columns[ 3 ];
			sdesc_setter = columns[ 4 ];
			values = columns[ 5 ];
		}
		
		
		public function get isgroup () : Boolean
		{
			return ( selector != null && selector != "" )
		}
		
		public function get parseable () : Boolean
		{
			return ( status != "FALSE" )
		}
	}
}