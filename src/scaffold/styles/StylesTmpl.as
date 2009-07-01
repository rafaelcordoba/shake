package scaffold.styles
{
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	
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
			render = _read_file ( "/scaffold/styles/tmpl/render.tmpl" );
			render_plugs = _read_file ( "/scaffold/styles/tmpl/render.plugs.tmpl" );
			render_setters = _read_file ( "/scaffold/styles/tmpl/render.setters.tmpl" );
			
			selector = _read_file ( "/scaffold/styles/tmpl/selector.tmpl" );
			selector_constants = _read_file ( "/scaffold/styles/tmpl/selector.constants.tmpl" );
			selector_getters_setters = _read_file ( "/scaffold/styles/tmpl/selector.getters.setters.tmpl" );
		}
		
		private function _read_file ( url : String ) : String
		{
			var stream : FileStream;
			
			stream = new FileStream();
			stream.open( new File( File.applicationDirectory.nativePath + url ), FileMode.READ );
			return stream.readUTFBytes( stream.bytesAvailable );
		}
	}
}