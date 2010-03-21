package shake.mvc.controllers 
{
	import cocktail.core.gunz.Gun;
	import cocktail.core.gunz.Gunz;

	import shake.mvc.models.ProjectModel;
	import shake.mvc.views.ProjectView;

	import flash.events.Event;
	import flash.filesystem.File;

	/**
	 * @author Carlinhos
	 * 
	 * Temporary package to deal with the file system.
	 */
	public class ProjectController 
	{
		/* GUNZ */
		public var gunz : Gunz;

		public var gunz_select : Gun;

		private function _init_gunz() : void
		{
			gunz = new Gunz( this );
			gunz_select = new Gun( gunz, this, "sustem-select" );
		}

		/* VARS */
		private var _shake : Shake;

		private var _file : File;

		private var _view : ProjectView;

		private var _model : ProjectModel;

		public function ProjectController( shake : Shake )		{
			_init( shake );
			_init_gunz( );
			_init_mv( );
		}

		private function _init( shake : Shake ) : void 
		{
			_shake = shake;
			_file = new File( );
			_file.addEventListener( Event.SELECT, _file_select );
		}

		private function _init_mv() : void 
		{
			_model = new ProjectModel( );
			_shake.addChild( _view = new ProjectView( _shake ) );
			_view.refresh( _model.tree );		}

		public function open( ...etc ) : void
		{
			_file.browseForDirectory( "Cocktail app folder" );
		}

		private function _file_select( event : Event ) : void
		{
//			var bullet : ProjectBullet;
			var files : Array = _file.getDirectoryListing( );
			var file : File;
			
			for(var i : uint = 0; i < files.length; i++)
			{
				file = files[ i ] as File;
				if ( file.isDirectory && file.name == "cocktail" )
				{
					// bullet = new ProjectBullet( _get_layouts( file ), _get_models( file ) );
					// gunz_select.shoot( bullet );
					_model.feed( _get_layouts( file ), _get_models( file ) );
					_view.refresh( _model.tree );
					return;
				}
			}
		}

		private function _get_layouts( cocktail : File ) : Array
		{
			var i : int;
			var layouts : Array;
			var dir : File = new File( cocktail.url + "/xml/layouts" );
			
			if ( dir.exists )
			{
				layouts = dir.getDirectoryListing( );
				while( i < layouts.length )
				{
					if( File( layouts[ i ] ).isDirectory )
						layouts.splice( i, 1 );
					else
						i++;
				}
			}
			return layouts;
		}

		private function _get_models( cocktail : File ) : Array
		{
			var i : int;
			var models : Array;
			var dir : File = new File( cocktail.url + "/xml/models" );
			
			if ( dir.exists )
			{
				models = dir.getDirectoryListing( );				
				while( i < models.length )
				{
					if( File( models[ i ] ).isDirectory )
						models.splice( i, 1 );
					else
						i++;
				}
			}
			return models;
		}
	}
}
