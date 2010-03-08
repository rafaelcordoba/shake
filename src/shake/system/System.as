package shake.system 
{
	import cocktail.core.gunz.Gun;
	import cocktail.core.gunz.Gunz;

	import shake.system.gunz.SystemBullet;

	import flash.events.Event;
	import flash.filesystem.File;

	/**
	 * @author Carlinhos
	 * 
	 * Temporary package to deal with the file system.
	 */
	public class System 
	{
		/* VARS */
		private var _file : File;
		
		/* GUNZ */
		public var gunz : Gunz;
		public var gunz_select : Gun;
		
		public function System ()
		{
			_file = new File();
			_file.addEventListener( Event.SELECT, _file_select );
			_init_gunz();
		}
		
		private function _init_gunz () : void
		{
			gunz = new Gunz( this );
			gunz_select = new Gun( gunz, this, "sustem-select" );
		}
		
		public function open_project () : void
		{
			_file.browseForDirectory( "Cocktail app folder" );
		}
		
		private function _file_select ( event : Event ) : void
		{
			var bullet : SystemBullet;
			var files:Array = _file.getDirectoryListing();
			var file : File;
		    for(var i:uint = 0; i < files.length; i++)
		    {
		    	file = files[ i ] as File;
		        if ( file.isDirectory && file.name == "cocktail" )
		        {
		        	bullet = new SystemBullet( _get_views( file ), _get_models( file ) );
		        	gunz_select.shoot( bullet );
		        	return;
		        }
		    }
		}
		
		private function _get_views ( cocktail : File ) : Array
		{
			var views : Array;
			var dir : File = new File( cocktail.url + "/xml/views" );
			if ( dir.exists )
			{
				views = dir.getDirectoryListing();				
			}
			return views;
		}
		
		private function _get_models ( cocktail : File ) : Array
		{
			var models : Array;
			var dir : File = new File( cocktail.url + "/xml/models" );
			if ( dir.exists )
			{
				models = dir.getDirectoryListing();				
			}
			return models;
		}
	}
}
