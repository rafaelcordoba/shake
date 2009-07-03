package scaffold.styles
{
	import helpers.FileHelper;
	
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
		
		public function build ( groups : Array ) : void
		{
			for each ( _item in groups )
			{
				if ( ! _item.properties.length )
					continue;
				
				_build_render(); 
				_build_selector();
			}
		}
		
		
		
		/* ---------------------------------------------------------------------
			RENDER
		--------------------------------------------------------------------- */
		
		private function _build_render () : void
		{
			var render : String;
			var path : String;
			
			render = _tmpl.render.split( "%NAME_CAMEL%" ).join ( _item.name_camel );
			render = render.split( "%CLASS_DESCRIPTION%" ).join ( _item.render_description );
			render = render.replace( "%PLUGS%", _render_plugs() ); 
			render = render.replace( "%PROPERTIES%", _render_setters() );
			
			path = "/scaffold/styles/output/renders/"+ _item.name_camel +"Render.as";
			FileHelper.save_file( path, render );
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
							.replace( "%PROPERTY_LOWER_METHOD%", prop.lower_method ) +"\n";
			
			return plugs.substr( 0, -1 );
		}
		
		private function _render_setters () : String
		{
			var setters : String;
			var prop : StylesPropertyDAO;
			
			setters = "";
			for each ( prop in _item.properties )
				setters += _tmpl.render_setters.replace( "%PROPERTY_LOWER_METHOD%", prop.lower_method ) +"\n\n";
			
			return setters.substr ( 0, -2 );
		}
		
		
		
		/* ---------------------------------------------------------------------
			SELECTOR
		--------------------------------------------------------------------- */
		
		private function _build_selector() : void
		{
			var selector : String;
			var path : String;
			
			selector = _tmpl.selector.split( "%CLASS_DESCRIPTION%" ).join ( _item.selector_description );
			selector = selector.split( "%NAME_CAMEL%" ).join ( _item.name_camel );
			selector = selector.replace( "%CONSTANTS%", _selector_constants() ); 
			selector = selector.replace( "%PROPERTIES%", _selector_getters_setters() );
			
			path = "/scaffold/styles/output/selectors/"+ _item.name_camel +"Selector.as";
			FileHelper.save_file( path, selector );
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
									.split( "%PROPERTY_LOWER_METHOD%" ).join ( prop.lower_method )
									.split( "%PROPERTY_UPPER%" ).join ( prop.upper )
									.split( "%GETTER_DOCUMENTATION%" ).join ( prop.getter_docs )
									.split( "%GETTER_RETURN%" ).join ( prop.getter_return_docs )
									.split( "%SETTER_DOCUMENTATION%" ).join ( prop.setter_docs )
									.split( "%VALUES%" ).join ( prop.values ) + "\n\n\n\n";
			
			return getters_setters.substr ( 0, -4 );
		}
	}
}