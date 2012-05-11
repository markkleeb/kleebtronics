=== Vimeo Short Code ===
Contributors: Gabriele Maidecchi, Matroschka
Tags: video, embed, movie, shortcode, plugin, clip, vimeo, flv, quicktag
Requires at least: 2.5
Tested up to: 3.01
Stable tag: 1.0

Allows the user to embed Vimeo movie clips by entering a shortcode ([vimeo]) into the post area. Vimeo's options are supported as short code attributes.
This plugin makes use of the new (as of August 2010) Vimeo embed code integrating full HTML5 support for video playback.

Full credits go to the original Lux Vimeo plugin, Matroschka, http://www.pastukhova-floeder.de/

== Description ==

Allows the user to embed Vimeo movie clips by entering a shortcode (`[vimeo]`) into the post area. Vimeo's options are supported as short code attributes.

== Installation ==

1. Unzip `vimeo_html5_shortcode.zip` and upload the contained files to the `/wp-content/plugins/` directory
2. Activate the plugin through the 'Plugins' menu in WordPress

== Usage ==
1. Enter the `[vimeo clip_id="XXXXXXX"]` short code into any post. `clip_id` is the number from the clip's URL (e.g. http://vimeo.com/123456)
2. Optionally modify the clip's appearance by specifying width or height, like so: `[vimeo clip_id="XXXXXXX" width="400" height="225"]`
3. Using empty values for either the `width` or `height`attributes will cause the plugin to calculate the proper dimension based on a 16:9 aspect ration. Example: `[vimeo clip_id="12345678" height="300" width=""]` or `[vimeo clip_id="12345678" height="" width="640"]`
