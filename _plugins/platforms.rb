module Jekyll
  class Platforms < Liquid::Tag

    def initialize(tag_name, object_name, tokens)
      super
      @platform_type = object_name.strip!
    end

    def render(context)
        case @platform_type
        when "ios"
            "<a href='#' onclick='javascript:return false;' class='platform available' title='Feature available on iOS'>iOS</a> <a href='#' onclick='javascript:return false;' class='platform unavailable' title='Feature not available on macOS'>macOS</a>"
        when "macos"
            "<a href='#' onclick='javascript:return false;' class='platform unavailable'title='Feature not available on iOS'>iOS</a> <a href='#' onclick='javascript:return false;' class='platform available' title='Feature available on macOS'>macOS</a>"
        when "all"
            "<a href='#' onclick='javascript:return false;' class='platform available' title='Feature available on iOS'>iOS</a> <a href='#' onclick='javascript:return false;' class='platform available' title='Feature available on macOS'>macOS</a>"
        else
            ""
        end
    end
  end
end

Liquid::Template.register_tag('platforms', Jekyll::Platforms)
