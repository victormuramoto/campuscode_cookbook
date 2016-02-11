module CarouselHelper
  def carousel_for(recipes)
    Carousel.new(self,recipes).html
end

  class Carousel

    attr_accessor :uid
    def initialize(view, recipes)
      @view, @recipes = view, recipes
      @uid = SecureRandom.hex(6)
    end

    def html
      content = view.safe_join([indicators, slides, controls])
      view.content_tag(:div, content, class: 'carousel slide', id: @uid)
    end


  private

    attr_accessor :view, :recipes

    delegate :link_to, :content_tag, :image_tag, :attachment_url, :safe_join, to: :view

    def indicators
      items = recipes.count.times.map { |index| indicator_tag(index) }
      content_tag(:ol, safe_join(items), class: 'carousel-indicators')
    end

    def indicator_tag(index)
     options = {
       class: (index.zero? ? 'active' : ''),
       data: {
         target: uid,
         slide_to: index
       }
     }

     content_tag(:li, '', options)
    end

    def slides
      items = recipes.map.with_index { |recipe, index| slide_tag(recipe, index.zero?) }
      content_tag(:div, safe_join(items), class: 'carousel-inner')
    end

    def slide_tag(recipe, is_active)
      options = {
        class: (is_active ? 'item active' : 'item'),
      }
      context = []

      #Ok, this is not good, but believe me, it works.
      #If you see me after look this `HTML CODE`, remember me to make it DRY....or just be rude with me lol.
      context << "<div class='info'><p><h2>#{recipe.name}</h2></p>".html_safe + "<p><%= bla: #{recipe.number_people}</p>".html_safe + "<p>Empresa:#{recipe.time_prepare}</p>".html_safe + "<p>Categoria:#{recipe.difficult}</p>".html_safe + "<p>Contrato:#{recipe.kitchen}</p></div>".html_safe
      if recipe.image != nil
        context << image_tag(attachment_url(recipe, :image, :fill, 200,200), class:'img-circle')
      else
        context << image_tag("cookbook.jpg", height: '200', width: '200', class:'img-circle')
      end
      content_tag(:div, safe_join(context), options)
    end

    def controls
        safe_join([control_tag('left'), control_tag('right')])
      end

    def control_tag(direction)
      options = {
        class: "#{direction} carousel-control",
        data: { slide: direction == 'left' ? 'prev' : 'next' }
      }

      icon = content_tag(:i, '', class: "glyphicon glyphicon-chevron-#{direction}")
      control = link_to(icon, "##{uid}", options)
    end
  end
end
