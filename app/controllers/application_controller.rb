class ApplicationController < ActionController::Base
  def hello
    render html: "This is a practice for ruby rails development"
  end
end
