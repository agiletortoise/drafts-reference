module Jekyll
  class ObjectRef < Liquid::Tag

    def initialize(tag_name, object_name, tokens)
      super
      @object_name = object_name.strip!
    end

    def render(context)
      "[#{@object_name}](/objects/#{@object_name}.html)"
    end
  end
end

Liquid::Template.register_tag('ref', Jekyll::ObjectRef)
