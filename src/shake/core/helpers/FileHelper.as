package shake.core.helpers 
{
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;

	public class FileHelper
	{
		public static function save_file( path : String, raw : String ) : void
		{
			var stream : FileStream;
			
			stream = new FileStream( );
			stream.open( new File( path ), FileMode.WRITE );
			stream.writeUTFBytes( raw );
			stream.close( );
		}

		public static function read( path : String ) : String
		{
			var stream : FileStream;
			
			stream = new FileStream( );
			stream.open( new File( path ), FileMode.READ );
			return stream.readUTFBytes( stream.bytesAvailable );
		}
	}
}