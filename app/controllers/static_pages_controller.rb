class StaticPagesController < ApplicationController

  def home
    @title = "ジムの口コミ"
    @description = "ジムの口コミを調べることができるサイトです"
    @keywords = "some keywords"
  end

  def help
  end

  def about
  end

  def contact
  end
end
