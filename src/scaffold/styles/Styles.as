package scaffold.styles
{
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	
	import scaffold.styles.dao.StylesGroupDAO;
	import scaffold.styles.dao.StylesPropertyDAO;
	
	public class Styles
	{
		private var _item : StylesGroupDAO;
		private var _tmpl : StylesTmpl;
		
		public function Styles ()
		{
			_tmpl = new StylesTmpl ();
		}
		
		public function build ( item : StylesGroupDAO ) : void
		{
			_item = item;
			_build_render(); 
			_build_selector(); 
		}
		
		
		
		/* ---------------------------------------------------------------------
			RENDER
		--------------------------------------------------------------------- */
		
		private function _save_file ( path : String, contents : String ) : void
		{
			var stream : FileStream = new FileStream();
			stream.open( new File( File.applicationDirectory.nativePath + path ), FileMode.WRITE );
			stream.writeUTFBytes( contents );
			stream.close();
		}
		
		
		
		/* ---------------------------------------------------------------------
			RENDER
		--------------------------------------------------------------------- */
		
		private function _build_render () : void
		{
			var render : String;
			
			render = _tmpl.render.split( "%NAME_CAMEL%" ).join ( _item.name_camel );
			render = render.split( "%CLASS_DESCRIPTION%" ).join ( _item.description );
			render = render.replace( "%PLUGS%", _render_plugs() ); 
			render = render.replace( "%PROPERTIES%", _render_setters() );
			
			_save_file ( "/scaffold/styles/output/renders/"+ _item.name_camel +"Render.as", render );
		}
		
		private function _render_plugs () : String
		{
			var plugs : String;
			var prop : StylesPropertyDAO;
			
			plugs = "";
			for each ( prop in _item.properties )
				plugs += _tmpl.render_plugs
							.replace( "%NAME_CAMEL%", _item.name_camel )
							.replace( "%PROPERTY_UPPER%", prop.upper )
							.replace( "%PROPERTY_LOWER%", prop.lower ) +"\n";
			
			return plugs.substr( 0, -1 );
		}
		
		private function _render_setters () : String
		{
			var setters : String;
			var prop : StylesPropertyDAO;
			
			setters = "";
			for each ( prop in _item.properties )
				setters += _tmpl.render_setters.replace( "%PROPERTY_LOWER%", prop.lower ) +"\n\n";
			
			return setters.substr ( 0, -2 );
		}
		
		
		
		/* ---------------------------------------------------------------------
			SELECTOR
		--------------------------------------------------------------------- */
		
		private function _build_selector() : void
		{
			var selector : String;
			
			selector = _tmpl.selector.split( "%CLASS_DESCRIPTION%" ).join ( _item.description );
			selector = selector.split( "%NAME_CAMEL%" ).join ( _item.name_camel );
			selector = selector.replace( "%CONSTANTS%", _selector_constants() ); 
			selector = selector.replace( "%PROPERTIES%", _selector_getters_setters() );
			
			_save_file ( "/scaffold/styles/output/selectors/"+ _item.name_camel +"Selector.as", selector );
		}
		
		private function _selector_constants () : String
		{
			var constants : String;
			var prop : StylesPropertyDAO;
			
			constants = "";
			for each ( prop in _item.properties )
				constants += _tmpl.selector_constants
							.replace( "%PROPERTY_UPPER%", prop.upper )
							.replace( "%PROPERTY_LOWER%", prop.lower ) +"\n";
			
			return constants.substr( 0, -1 );
		}
		
		private function _selector_getters_setters () : String
		{
			var getters_setters : String;
			var prop : StylesPropertyDAO;
			
			getters_setters = "";
			for each ( prop in _item.properties )
				getters_setters += _tmpl.selector_getters_setters
									.split( "%PROPERTY_LOWER%" ).join ( prop.lower)
									.split( "%PROPERTY_UPPER%" ).join ( prop.upper )
									.split( "%DOCUMENTATION%" ).join ( prop.documentation )
									.split( "%VALUES%" ).join ( prop.values ) + "\n\n\n\n";
			
			return getters_setters.substr ( 0, -4 );
		}
	}
}