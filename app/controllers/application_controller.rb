class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Authenticable

  def api
    str = File.open("#{Rails.root}/doc/api.md").read
    str = BlueCloth.new(str).to_html
    html = to_html(str, "F")
    render text: html.html_safe
  end
  private
  def to_html str, title
    <<-HTML
      <html lang="en">
        <head>
          <title>#{title}</title>
          <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1q8mTJOASx8j1Aua5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        </head>
        <body style="background: #fff;">
          <div class="container">
            #{str}
          </div>
        </body>
      </html>
    HTML
  end
end
