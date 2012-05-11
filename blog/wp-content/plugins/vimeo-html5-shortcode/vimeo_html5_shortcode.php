<?php
/*
Plugin Name: Vimeo HTML5 shortcode
Plugin URI: http://blog.esimplestudios.com/2010/08/embedding-vimeo-videos-on-wordpress
Description: Allows the user to embed Vimeo movie clips by entering a shortcode ([vimeo]) into the post area.
Author: Gabriele Maidecchi
Version: 1.0
Author URI: http://www.esimplestudios.com/
License: GPL 2.0, @see http://www.gnu.org/licenses/gpl-2.0.html

EDITED BY MAIDO 2010-08-18 to support new Vimeo HTML5-friendly embed code

Full credits go to the original version of the plugin, below:

Plugin Name: Lux Vimeo
Plugin URI: http://www.partnervermittlung-ukraine.net/info/lux-vimeo-wordpress-plugin
Description: Allows the user to embed Vimeo movie clips by entering a shortcode ([vimeo]) into the post area.
Author: Matroschka
Author URI: http://www.pastukhova-floeder.de/
*/

class lux_vimeo {
    function shortcode($atts, $content=null) {
		extract(shortcode_atts(array(
			'clip_id' 	=> '',
			'width' 	=> '400',
			'height' 	=> '225',
		), $atts));

		if (empty($clip_id) || !is_numeric($clip_id)) return '<!-- Lux Vimeo: Invalid clip_id -->';
		if ($height && !$width) $width = intval($height * 16 / 9);
		if (!$height && $width) $height = intval($width * 9 / 16);

		return "<iframe src='http://player.vimeo.com/video/$clip_id?title=0&amp;byline=0&amp;portrait=0' width='$width' height='$height' frameborder='0'></iframe>";
    }
}

add_shortcode('vimeo', array('lux_vimeo', 'shortcode'));

?>