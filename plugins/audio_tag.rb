# Title: MP3 tag for Jekyll
# Authors: Devin Weaver, Daniel Roos (youtube changes)
# Description: Allows mp3 tag to include mp3 files embedded into the post.
# It uses the player 'audio.js' from http://kolber.github.com/audiojs/
#
# Install the plugin according to the manuel of the author by adding the necessary lines to the head-template
#   and adding the files into the right directories.
#
# Please read my [blog post about it][2].
#
# [2]: http://blog.micronarrativ.org/2012/09/06/Wordpress_til_Octopress_-_Audio
#
# Syntax {% audio fileurl %}
#
# Examples:
# {% audio http://www.example.com/audio.mp3 %}
#
# Output:
# <p/>
# <center>
# <audio src="http://www.example.com/audio.mp3" preload="none" />
# </center>
# <p/>

require 'digest/md5'

module Jekyll

  class AudioTag < Liquid::Tag
    def initialize(tag_name, markup, tokens)
      if /(?<fileurl>\S+)?/i =~ markup
        @audiotagurl = fileurl
      end
      super
    end

    def render(context)
      if @audiotagurl
        "<p/>
<center>
<audio src=\"#{@audiotagurl}\" preload=\"none\" />
</center>
<p/>"
      else
        "Error processing input, expected syntax: {% audio fileurl %}"
      end
  end
    end
end

Liquid::Template.register_tag('audio', Jekyll::AudioTag)
