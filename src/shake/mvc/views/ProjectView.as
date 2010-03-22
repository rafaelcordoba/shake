package shake.mvc.views 
{
	import shake.mvc.models.ProjectModel;

	import org.aswing.AsWingManager;
	import org.aswing.JFrame;
	import org.aswing.JScrollPane;
	import org.aswing.JTree;
	import org.aswing.tree.DefaultTreeModel;

	import flash.events.Event;

	/**
	 * @author nybras | me@nybras.com
	 */
	public class ProjectView extends JFrame 
	{
		private var _shake : Shake;

		private var _model : ProjectModel;

		private var _tree : JTree;

		public function ProjectView( shake : Shake )
		{
			_shake = shake;
			
			AsWingManager.initAsStandard( this );
			
			_model = new ProjectModel( );
			//			_model.gunz_change.add( _refresh );
			_tree = new JTree( );
			_tree.addSelectionListener( _select );
			
			setTitle( "ProjectExplorer" );
			setSizeWH( 230, 500 );
			setY( 100 );
			
			setContentPane( new JScrollPane( _tree ) );
			addEventListener( Event.ADDED_TO_STAGE, _show );
		}

		private function _select( ev : Event ) : void 
		{
			trace( "SELECT: " + ev, _tree.getSelectionModel() );
		}

		private function _show( ...etc ) : void
		{
			removeEventListener( Event.ADDED_TO_STAGE, _show );
			owner = this.parent;
			show( );
		}

		public function refresh( tree : DefaultTreeModel ) : void
		{
			_tree.setModel( tree );
		}
	}
}