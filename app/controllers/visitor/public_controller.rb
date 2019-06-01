class Visitor::PublicController < ApplicationController
  def index
    @welcome = "Hello everyone..."
  end
end
