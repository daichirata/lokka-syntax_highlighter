module Lokka
  module SyntaxHighlighter
    def self.registered(app)
      app.get '/admin/plugins/syntax_highlighter' do
        haml :"plugin/lokka-syntax_highlighter/views/index", :layout => :"admin/layout"
      end

      app.put '/admin/plugins/syntax_highlighter' do
        Option.syntax_highlighter_theme = params['syntax_highlighter_theme']
        flash[:notice] = 'Updated.'
        redirect '/admin/plugins/syntax_highlighter'
      end

      app.before do
        theme = Option.syntax_highlighter_theme || "Default"
        header = %Q(<link type="text/css" rel="Stylesheet" href="/plugin/lokka-syntax_highlighter/views/styles/shCore.css"/>)
        header << %Q(<link type="text/css" rel="Stylesheet" href="/plugin/lokka-syntax_highlighter/views/styles/shTheme#{theme}.css"/>)

        content_for :header do
          header
        end

        content_for :footer do
          haml :'plugin/lokka-syntax_highlighter/views/footer', :layout => false
        end
      end
    end
  end
end
