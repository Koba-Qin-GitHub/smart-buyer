class ItemsController < ApplicationController
  def index
  end

  def new

    gon.mouser_apiKey = ENV['MOUSER_API_KEY']

  end
end
