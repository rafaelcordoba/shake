package helpers
{
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	
	public class FileHelper
	{
		public static function save_file ( path : String, contents : String, use_native_path : Boolean = true ) : void
		{
			var stream : FileStream;
			
			if ( use_native_path )
				path = File.applicationDirectory.nativePath + path;
			
			trace ( "{WRITE} "+ path);
			
			stream = new FileStream();
			stream.open( new File( path ), FileMode.WRITE );
			stream.writeUTFBytes( contents );
			stream.close();
		}
		
		public static function read ( path : String, use_native_path : Boolean = true ) : String
		{
			var stream : FileStream;
			
			if ( use_native_path )
				path = File.applicationDirectory.nativePath + path;
			
			trace ( "{READ} "+ path);
			
			stream = new FileStream();
			stream.open( new File( path ), FileMode.READ );
			return stream.readUTFBytes( stream.bytesAvailable );
		}
	}
}