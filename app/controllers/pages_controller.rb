class PagesController < ApplicationController
  skip_before_action :authenticate_blogger!

  def index; end
end
