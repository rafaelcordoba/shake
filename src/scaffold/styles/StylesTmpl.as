package scaffold.styles
{
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	
	import helpers.FileHelper;
	
	public class StylesTmpl
	{
		public var render : String;
		public var render_setters : String;
		public var render_plugs : String;
		
		public var selector : String;
		public var selector_constants : String;
		public var selector_getters_setters : String;
		
		
		
		public function StylesTmpl()
		{
			render =  FileHelper.read( "/scaffold/styles/tmpl/render.tmpl" );
			render_plugs = FileHelper.read( "/scaffold/styles/tmpl/render.plugs.tmpl" );
			render_setters = FileHelper.read( "/scaffold/styles/tmpl/render.setters.tmpl" );
			
			selector = FileHelper.read ( "/scaffold/styles/tmpl/selector.tmpl" );
			selector_constants = FileHelper.read ( "/scaffold/styles/tmpl/selector.constants.tmpl" );
			selector_getters_setters = FileHelper.read ( "/scaffold/styles/tmpl/selector.getters.setters.tmpl" );
		}
	}
}