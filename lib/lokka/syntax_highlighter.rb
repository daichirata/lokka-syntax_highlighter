module Lokka
  module SyntaxHighlighter
    def self.registered(app)
      app.before do
      #  if ENV['RACK_ENV'] == 'production' && !logged_in?
          content_for :header do
            haml :'plugin/lokka-syntax_highlighter/views/header', :layout => false
          end

          content_for :footer do
            haml :'plugin/lokka-syntax_highlighter/views/footer', :layout => false
          end
      #  end
      end
    end
  end
end
