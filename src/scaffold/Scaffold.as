package scaffold
{
	import scaffold.styles.Styles;
	import scaffold.styles.StylesTmpl;
	import scaffold.styles.dao.StylesGroupDAO;
	import scaffold.styles.dao.StylesPropertyDAO;
	
	public class Scaffold
	{
		public var styles : StylesTmpl = new StylesTmpl(); 
		
		public function Scaffold()
		{
			var styles : Styles;
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
			
			// BUILD!
			styles = new Styles ();
			styles.build( item );
		}
	}
}