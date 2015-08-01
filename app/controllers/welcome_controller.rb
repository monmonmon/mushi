class WelcomeController < ApplicationController
  before_action :full_screen_width, only: %w(index)

  def index
  end

  def about
  end

  def contact
  end

  def team
  end
end
