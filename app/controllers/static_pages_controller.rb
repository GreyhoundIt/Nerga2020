class StaticPagesController < ApplicationController

  def index
  end

  def home
  end

  def rules
  end

  def links
    @clubs = Club.published.order(:name)
  end

  def honours
  end

  def sponsors
  end
end
