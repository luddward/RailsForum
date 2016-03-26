module RedcarpetHelper

  class HTMLBlockCode < Redcarpet::Render::HTML

    def image(url, title, alt_text)
      # Make sure to return an image tag anyway ; this method
      # overrides the vanilla output.
      %(<img src="#{url}" alt="#{alt_text}" title="#{title}>" class="img-responsive post-image")
    end

  end

end