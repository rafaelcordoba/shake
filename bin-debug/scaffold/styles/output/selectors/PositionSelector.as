/*	****************************************************************************
		Cocktail ActionScript Full Stack Framework. Copyright (C) 2009 Codeine.
	****************************************************************************
   
		This library is free software; you can redistribute it and/or modify
	it under the terms of the GNU Lesser General Public License as published
	by the Free Software Foundation; either version 2.1 of the License, or
	(at your option) any later version.
		
		This library is distributed in the hope that it will be useful, but
	WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
	or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public
	License for more details.

		You should have received a copy of the GNU Lesser General Public License
	along with this library; if not, write to the Free Software Foundation,
	Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA

	-------------------------
		Codeine
		http://codeine.it
		contact@codeine.it
	-------------------------
	
*******************************************************************************/

package cocktail.lib.view.styles.selectors 
{
	import cocktail.lib.view.styles.selectors.Selector;		

	/**
	 * Render all position's properties.
	 * @author nybras | nybras@codeine.it
	 */
	public class PositionSelector extends Selector
	{
		/* ---------------------------------------------------------------------
			CONSTANTS
		--------------------------------------------------------------------- */
		
		public static const LEFT : String = "left";
		public static const TOP : String = "top";
		
		
		
		/* ---------------------------------------------------------------------
			PROPERTIES
		--------------------------------------------------------------------- */
		
		/**
	 	* TODO: write documentation
	 	* @return	????
	 	*/
		public function get left () : String { return r ( LEFT ); }
	
		/**
	 	* Sets the left margin edge for a positioned box
	 	* @param left	Possible values are: auto, length, %, inherit.
	 	*/
		public function set left ( value : * ) : void {
			w ( LEFT, value );
		}



		/**
	 	* TODO: write documentation
	 	* @return	????
	 	*/
		public function get top () : String { return r ( TOP ); }
	
		/**
	 	* Sets the top margin edge for a positioned box
	 	* @param left	Possible values are: auto, length, %, inherit.
	 	*/
		public function set top ( value : * ) : void {
			w ( TOP, value );
		}
	}
}